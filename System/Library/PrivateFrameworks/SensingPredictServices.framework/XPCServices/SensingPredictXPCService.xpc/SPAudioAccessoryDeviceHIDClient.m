@interface SPAudioAccessoryDeviceHIDClient
+ (_TtC24SensingPredictXPCService31SPAudioAccessoryDeviceHIDClient)shared;
- (_TtC24SensingPredictXPCService31SPAudioAccessoryDeviceHIDClient)init;
- (void)MarkSessionStartWithAppName:(id)a3;
- (void)MarkSessionStopWithAppName:(id)a3;
- (void)ReceiveNoiseLevelWithBlock:(id)a3;
@end

@implementation SPAudioAccessoryDeviceHIDClient

+ (_TtC24SensingPredictXPCService31SPAudioAccessoryDeviceHIDClient)shared
{
  if (qword_10001A558 != -1) {
    swift_once();
  }
  v2 = (void *)qword_10001A570;

  return (_TtC24SensingPredictXPCService31SPAudioAccessoryDeviceHIDClient *)v2;
}

- (_TtC24SensingPredictXPCService31SPAudioAccessoryDeviceHIDClient)init
{
  return (_TtC24SensingPredictXPCService31SPAudioAccessoryDeviceHIDClient *)SPAudioAccessoryDeviceHIDClient.init()();
}

- (void)ReceiveNoiseLevelWithBlock:(id)a3
{
  uint64_t v4 = (uint64_t)_Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v5;
    v6 = sub_10000DD18;
  }
  else
  {
    v6 = 0;
  }
  v7 = (uint64_t (**)())((char *)self
                      + OBJC_IVAR____TtC24SensingPredictXPCService31SPAudioAccessoryDeviceHIDClient_noiseLevelCallback);
  uint64_t v8 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC24SensingPredictXPCService31SPAudioAccessoryDeviceHIDClient_noiseLevelCallback);
  *v7 = v6;
  v7[1] = (uint64_t (*)())v4;

  sub_10000A634(v8);
}

- (void)MarkSessionStartWithAppName:(id)a3
{
}

- (void)MarkSessionStopWithAppName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24SensingPredictXPCService31SPAudioAccessoryDeviceHIDClient_SPHIDManagerQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24SensingPredictXPCService31SPAudioAccessoryDeviceHIDClient_hidManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24SensingPredictXPCService31SPAudioAccessoryDeviceHIDClient_hidDevice));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC24SensingPredictXPCService31SPAudioAccessoryDeviceHIDClient_noiseLevelCallback);

  sub_10000A634(v3);
}

@end