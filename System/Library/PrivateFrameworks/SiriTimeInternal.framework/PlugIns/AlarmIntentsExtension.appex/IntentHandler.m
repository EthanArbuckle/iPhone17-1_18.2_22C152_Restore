@interface IntentHandler
- (_TtC21AlarmIntentsExtension13IntentHandler)init;
- (id)handlerForIntent:(id)a3;
@end

@implementation IntentHandler

- (id)handlerForIntent:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100003790(v4, v8);

  sub_100003A6C(v8, v8[3]);
  v6 = (void *)sub_100003C80();
  sub_100003AB0(v8);
  return v6;
}

- (_TtC21AlarmIntentsExtension13IntentHandler)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for IntentHandler();
  return [(IntentHandler *)&v3 init];
}

@end