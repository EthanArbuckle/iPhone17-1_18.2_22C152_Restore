@interface SetTemporalIntentHandler
- (_TtC19SiriSettingsIntents24SetTemporalIntentHandler)init;
- (void)handleSetTemporalSetting:(id)a3 completion:(id)a4;
@end

@implementation SetTemporalIntentHandler

- (void)handleSetTemporalSetting:(id)a3 completion:(id)a4
{
  id v5 = a3;
  v8 = _Block_copy(a4);
  v6 = self;
  *(void *)(swift_allocObject() + 16) = v8;
  sub_22DF256D0();
  swift_release();
}

- (_TtC19SiriSettingsIntents24SetTemporalIntentHandler)init
{
  return (_TtC19SiriSettingsIntents24SetTemporalIntentHandler *)SetTemporalIntentHandler.init()();
}

@end