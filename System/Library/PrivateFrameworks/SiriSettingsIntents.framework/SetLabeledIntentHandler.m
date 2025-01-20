@interface SetLabeledIntentHandler
- (_TtC19SiriSettingsIntents23SetLabeledIntentHandler)init;
- (void)handleSetLabeledSetting:(id)a3 completion:(id)a4;
@end

@implementation SetLabeledIntentHandler

- (void)handleSetLabeledSetting:(id)a3 completion:(id)a4
{
  id v5 = a3;
  v8 = _Block_copy(a4);
  v6 = self;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  sub_22DFE7D34(a3, (void (*)(void))sub_22DF06914, v9);
  swift_release();
}

- (_TtC19SiriSettingsIntents23SetLabeledIntentHandler)init
{
  return (_TtC19SiriSettingsIntents23SetLabeledIntentHandler *)SetLabeledIntentHandler.init()();
}

- (void).cxx_destruct
{
}

@end