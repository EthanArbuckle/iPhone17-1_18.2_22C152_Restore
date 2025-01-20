@interface TranscriptionAvailabilityProvider
+ (_TtC10VoiceMemos33TranscriptionAvailabilityProvider)shared;
+ (void)setShared:(id)a3;
- (BOOL)deviceIsSupported;
- (_TtC10VoiceMemos33TranscriptionAvailabilityProvider)init;
- (void)registerObserver:(id)a3;
- (void)updateDeviceIsSupported;
@end

@implementation TranscriptionAvailabilityProvider

- (void)updateDeviceIsSupported
{
  uint64_t v3 = sub_100028654(&qword_1002699E0);
  __chkstk_darwin(v3 - 8);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  type metadata accessor for MainActor();
  v7 = self;
  uint64_t v8 = static MainActor.shared.getter();
  v9 = (void *)swift_allocObject();
  v9[2] = v8;
  v9[3] = &protocol witness table for MainActor;
  v9[4] = v7;
  sub_10001E1A8((uint64_t)v5, (uint64_t)&unk_100268018, (uint64_t)v9);

  swift_release();
}

+ (_TtC10VoiceMemos33TranscriptionAvailabilityProvider)shared
{
  if (qword_100264560 != -1) {
    swift_once();
  }
  v2 = (void *)qword_100275388;

  return (_TtC10VoiceMemos33TranscriptionAvailabilityProvider *)v2;
}

- (BOOL)deviceIsSupported
{
  v2 = self;
  swift_retain();
  CurrentValueSubject.value.getter();

  swift_release();
  return v4;
}

- (void)registerObserver:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_100029464((uint64_t)a3);
  swift_unknownObjectRelease();
}

- (_TtC10VoiceMemos33TranscriptionAvailabilityProvider)init
{
  return (_TtC10VoiceMemos33TranscriptionAvailabilityProvider *)sub_100016840();
}

+ (void)setShared:(id)a3
{
  uint64_t v3 = qword_100264560;
  id v4 = a3;
  if (v3 != -1) {
    swift_once();
  }
  v5 = (void *)qword_100275388;
  qword_100275388 = (uint64_t)v4;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();

  swift_release();
}

@end