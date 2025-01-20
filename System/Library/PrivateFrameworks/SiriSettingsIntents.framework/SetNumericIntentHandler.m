@interface SetNumericIntentHandler
- (_TtC19SiriSettingsIntents23SetNumericIntentHandler)init;
- (void)confirmSetNumericSetting:(id)a3 completion:(id)a4;
- (void)handleSetNumericSetting:(id)a3 completion:(id)a4;
@end

@implementation SetNumericIntentHandler

- (void)handleSetNumericSetting:(id)a3 completion:(id)a4
{
  id v5 = a3;
  v8 = _Block_copy(a4);
  v6 = self;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  sub_22E0E1344(a3, (void (*)(void))sub_22DF06914, v9);
  swift_release();
}

- (void)confirmSetNumericSetting:(id)a3 completion:(id)a4
{
  id v5 = a3;
  v8 = _Block_copy(a4);
  v6 = self;
  *(void *)(swift_allocObject() + 16) = v8;
  sub_22E0E1C98(a3, (void (*)(void))sub_22DF06914);
  swift_release();
}

- (_TtC19SiriSettingsIntents23SetNumericIntentHandler)init
{
  return (_TtC19SiriSettingsIntents23SetNumericIntentHandler *)SetNumericIntentHandler.init()();
}

- (void).cxx_destruct
{
}

@end