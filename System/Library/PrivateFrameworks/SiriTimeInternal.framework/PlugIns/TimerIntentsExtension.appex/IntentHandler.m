@interface IntentHandler
- (_TtC21TimerIntentsExtension13IntentHandler)init;
- (id)handlerForIntent:(id)a3;
@end

@implementation IntentHandler

- (id)handlerForIntent:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100002CE0(v4, v8);

  sub_100003004(v8, v8[3]);
  v6 = (void *)sub_100003940();
  sub_100003048(v8);
  return v6;
}

- (_TtC21TimerIntentsExtension13IntentHandler)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for IntentHandler();
  return [(IntentHandler *)&v3 init];
}

@end