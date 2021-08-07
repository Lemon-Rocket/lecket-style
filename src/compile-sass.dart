import 'dart:io';
import 'package:sass/sass.dart' as sass;

void main(List<String> arguments) {
    var sourceDirectory = new Directory(arguments[0]);
    RegExp regExp = new RegExp(
        '^scss.[^_]', caseSensitive: false, multiLine: false,
    );
    sourceDirectory.list(recursive: false).forEach((file) {
        if(regExp.hasMatch(file.path)){
            var newFile = file.path.replaceAll('scss', 'css');
            var result = sass.compile(file.path);
            new File(newFile).writeAsStringSync(result);
        }
    });
}
