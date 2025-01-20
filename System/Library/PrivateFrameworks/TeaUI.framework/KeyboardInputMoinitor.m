@interface KeyboardInputMoinitor
- (_TtC5TeaUI21KeyboardInputMoinitor)init;
- (void)handle:(id)a3;
@end

@implementation KeyboardInputMoinitor

- (_TtC5TeaUI21KeyboardInputMoinitor)init
{
  return (_TtC5TeaUI21KeyboardInputMoinitor *)KeyboardInputMoinitor.init()();
}

- (void)handle:(id)a3
{
  id v4 = a3;
  v5 = self;
  KeyboardInputMoinitor.handle(_:)((UIEvent)v4);
}

@end