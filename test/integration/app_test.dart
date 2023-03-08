// testing flutter packages
import 'package:flutter_test/flutter_test.dart';
import 'package:firstproject/mocks/mock_location.dart';
import 'package:firstproject/app.dart';

void main() {
  testWidgets('test app startup', (WidgetTester tester) async{
    // async for asynchronous function
    () async {
      // await waits for a Future to complete
      await tester.pumpWidget(App());

      final mockLocation = MockLocation.fetchAny();

      expect(find.text(mockLocation.name), findsOneWidget);
      expect(find.text('${mockLocation.name}blah'), findsNothing);
    };
  });
}