@interface IntentHandler
- (_TtC18NewsAudioExtension13IntentHandler)init;
- (id)handlerForIntent:(id)a3;
- (void)confirmPlayMedia:(id)a3 completion:(id)a4;
- (void)handlePlayMedia:(id)a3 completion:(id)a4;
@end

@implementation IntentHandler

- (id)handlerForIntent:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100002760(v4, v8);

  sub_1000034C4(v8, v8[3]);
  v6 = (void *)sub_100003608();
  sub_100003508((uint64_t)v8);

  return v6;
}

- (void)confirmPlayMedia:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_100003220((uint64_t)v7, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)handlePlayMedia:(id)a3 completion:(id)a4
{
  v6 = (void (**)(void *, id))_Block_copy(a4);
  id v7 = objc_allocWithZone((Class)INPlayMediaIntentResponse);
  id v8 = a3;
  v10 = self;
  id v9 = [v7 initWithCode:5 userActivity:0];
  v6[2](v6, v9);

  _Block_release(v6);
}

- (_TtC18NewsAudioExtension13IntentHandler)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(IntentHandler *)&v3 init];
}

@end