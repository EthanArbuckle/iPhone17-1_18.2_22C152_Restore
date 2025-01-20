@interface GetIntentHandler
- (_TtC19SiriSettingsIntents16GetIntentHandler)init;
- (void)confirmGetSetting:(id)a3 completion:(id)a4;
- (void)handleGetSetting:(id)a3 completion:(id)a4;
@end

@implementation GetIntentHandler

- (_TtC19SiriSettingsIntents16GetIntentHandler)init
{
  return (_TtC19SiriSettingsIntents16GetIntentHandler *)sub_22DF2AF7C();
}

- (void)handleGetSetting:(id)a3 completion:(id)a4
{
  id v5 = a3;
  v8 = _Block_copy(a4);
  v6 = self;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  sub_22DF2B328(a3, (void (*)(void))sub_22DF06914, v9);
  swift_release();
}

- (void)confirmGetSetting:(id)a3 completion:(id)a4
{
  id v5 = a3;
  v8 = _Block_copy(a4);
  v6 = self;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  sub_22DF2BDF8(a3, (uint64_t)sub_22DF06914, v9);
  swift_release();
}

- (void).cxx_destruct
{
}

@end