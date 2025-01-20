@interface IntentHandler
- (_TtC24AppLaunchIntentExtension13IntentHandler)init;
- (id)handlerForIntent:(id)a3;
@end

@implementation IntentHandler

- (id)handlerForIntent:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100002834(v4, v8);

  sub_100002CC8(v8, v8[3]);
  v6 = (void *)sub_1000037F0();
  sub_100002D0C(v8);
  return v6;
}

- (_TtC24AppLaunchIntentExtension13IntentHandler)init
{
  return (_TtC24AppLaunchIntentExtension13IntentHandler *)sub_100002C14();
}

@end