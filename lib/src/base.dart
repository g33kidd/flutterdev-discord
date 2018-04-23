import 'dart:io';
import 'package:args/args.dart';
import 'package:discord/discord.dart';

class Bot {

  String token;
  Client client;

  Bot(ArgResults args) {
    token = args.options.contains('token') ? args['token'] : null;
  }

  init () {
    if (token == null) {
      print("DISCORD TOKEN CANNOT BE EMPTY!");
      exit(1);
      return;
    }

    var clientOptions = new ClientOptions(
      disabledEvents: ['MESSAGE_UPDATE']
    );

    client = new Client(token, clientOptions);
    client.onReady.listen(onReady);
    client.onMessage.listen(onMessage);
    client.onGuildMemberAdd.listen(onGuildMemberAdd);
  }

  onMessage(MessageEvent event) {
    if (event.message.author.bot) return;

    if (event.message.content.startsWith('+')) {
      print(event.message);
    }
  }

  onReady(ReadyEvent e) {
    client.user.setGame(name: "Hello world!");
    print("Ready!");
  }

  onGuildMemberAdd(GuildMemberAddEvent e) {
    print("Somebody joined teh server!");
  }
}
