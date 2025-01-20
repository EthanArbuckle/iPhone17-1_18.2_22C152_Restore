@interface IntentHandler
- (_TtC23IdentityIntentExtension13IntentHandler)init;
- (id)handlerForIntent:(id)a3;
@end

@implementation IntentHandler

- (id)handlerForIntent:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100003588((uint64_t)v4, v8);

  sub_1000039EC(v8, v8[3]);
  v6 = (void *)sub_100003C20();
  sub_100003A30(v8);
  return v6;
}

- (_TtC23IdentityIntentExtension13IntentHandler)init
{
  return (_TtC23IdentityIntentExtension13IntentHandler *)sub_100003938();
}

@end