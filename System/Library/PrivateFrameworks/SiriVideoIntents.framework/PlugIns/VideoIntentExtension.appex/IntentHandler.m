@interface IntentHandler
- (_TtC20VideoIntentExtension13IntentHandler)init;
- (id)handlerForIntent:(id)a3;
@end

@implementation IntentHandler

- (id)handlerForIntent:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100003350(v8);

  sub_100003854(v8, v8[3]);
  v6 = (void *)sub_100003C00();
  sub_100003898(v8);
  return v6;
}

- (_TtC20VideoIntentExtension13IntentHandler)init
{
  return (_TtC20VideoIntentExtension13IntentHandler *)sub_1000037A0();
}

@end