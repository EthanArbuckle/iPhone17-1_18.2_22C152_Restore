@interface OpenIntentHandler
- (_TtC19SiriSettingsIntents17OpenIntentHandler)init;
- (void)handleOpenSetting:(id)a3 completion:(id)a4;
@end

@implementation OpenIntentHandler

- (void)handleOpenSetting:(id)a3 completion:(id)a4
{
  id v5 = a3;
  v8 = _Block_copy(a4);
  v6 = self;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  sub_22DF03A00(a3, (void (*)(void))sub_22DF06914, v9);
  swift_release();
}

- (_TtC19SiriSettingsIntents17OpenIntentHandler)init
{
  return (_TtC19SiriSettingsIntents17OpenIntentHandler *)OpenIntentHandler.init()();
}

- (void).cxx_destruct
{
}

@end