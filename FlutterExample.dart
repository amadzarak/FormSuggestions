//Example usage of the repo
class InputValidator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getLatest(
            'https://raw.githubusercontent.com/amadzarak/Master-Lists-For-Devs/main/hobbiesAndInterests.txt'),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? Container(
                  child: Text(snapshot.data.toString()),
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        });
  }
}

Future<List<String>> _getLatest(String url) async {
  List<String> result = [];

  try {
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == HttpStatus.ok) {
      result = (response.body).toString().split('\n');
      print(result);
    } else {
      print('Something went wrong!');
    }
  } catch (exception) {}

  return result;
}
