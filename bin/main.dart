import 'dart:io';
import 'package:args/args.dart';
import 'package:flutterdev_bot/flutterdev_bot.dart';
import 'package:discord/vm.dart';

main(List<String> args) {

  configureDiscordForVM();

  // CLI Arguments
  ArgParser parser = new ArgParser()
    ..addOption('token', abbr: 't')
    ..addOption('config', abbr: 'c');

  // Setup and run the bot!
  Bot bot = new Bot(parser.parse(args));

  try {
    bot.init();
  } catch (e) {
    print("something went wrong!");
    print(e);
    exit(1);
  }

}
