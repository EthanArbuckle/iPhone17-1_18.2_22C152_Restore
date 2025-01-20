@interface SetBinaryIntentHandler
- (_TtC19SiriSettingsIntents22SetBinaryIntentHandler)init;
- (void)confirmSetBinarySetting:(id)a3 completion:(id)a4;
- (void)handleSetBinarySetting:(id)a3 completion:(id)a4;
- (void)resolveTemporalEventTriggerForSetBinarySetting:(INSetBinarySettingIntent *)a3 withCompletion:(id)a4;
@end

@implementation SetBinaryIntentHandler

- (void)handleSetBinarySetting:(id)a3 completion:(id)a4
{
  id v5 = a3;
  v8 = _Block_copy(a4);
  v6 = self;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  sub_22DF1EB10(a3, (void (*)(void))sub_22DF06914, v9);
  swift_release();
}

- (void)confirmSetBinarySetting:(id)a3 completion:(id)a4
{
  id v5 = a3;
  v8 = _Block_copy(a4);
  v6 = self;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  sub_22DF1F2E8(a3, (uint64_t)sub_22DF06914, v9);
  swift_release();
}

- (void)resolveTemporalEventTriggerForSetBinarySetting:(INSetBinarySettingIntent *)a3 withCompletion:(id)a4
{
  v4 = a3;
  uint64_t v9 = _Block_copy(a4);
  id v5 = self;
  v6 = (void *)swift_allocObject();
  v6[2] = a3;
  v6[3] = v9;
  v6[4] = self;
  sub_22DF20474((uint64_t)&unk_2685C0F80, (uint64_t)v6);
}

- (_TtC19SiriSettingsIntents22SetBinaryIntentHandler)init
{
  return (_TtC19SiriSettingsIntents22SetBinaryIntentHandler *)SetBinaryIntentHandler.init()();
}

- (void).cxx_destruct
{
}

@end