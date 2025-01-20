@interface RCRecordButtonRepository
- (BOOL)isEnabled;
- (_TtC10VoiceMemos24RCRecordButtonRepository)init;
- (int64_t)state;
- (unint64_t)trackState;
- (void)setIsEnabled:(BOOL)a3;
- (void)setState:(int64_t)a3;
- (void)setTrackState:(unint64_t)a3;
@end

@implementation RCRecordButtonRepository

- (void)setState:(int64_t)a3
{
  v3 = self;
  CurrentValueSubject.value.getter();
  CurrentValueSubject.value.setter();
}

- (void)setIsEnabled:(BOOL)a3
{
  v3 = self;
  CurrentValueSubject.value.getter();
  CurrentValueSubject.value.setter();
}

- (_TtC10VoiceMemos24RCRecordButtonRepository)init
{
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  char v8 = 1;
  sub_100028654(&qword_100266320);
  swift_allocObject();
  v3 = self;
  *(Class *)((char *)&v3->super.isa + OBJC_IVAR____TtC10VoiceMemos24RCRecordButtonRepository_modelSubject) = (Class)CurrentValueSubject.init(_:)();

  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for RCRecordButtonRepository();
  return [(RCRecordButtonRepository *)&v5 init];
}

- (void)setTrackState:(unint64_t)a3
{
  v3 = self;
  CurrentValueSubject.value.getter();
  CurrentValueSubject.value.setter();
}

- (int64_t)state
{
  v2 = self;
  CurrentValueSubject.value.getter();

  return v4;
}

- (unint64_t)trackState
{
  v2 = self;
  CurrentValueSubject.value.getter();

  return v4;
}

- (BOOL)isEnabled
{
  v2 = self;
  CurrentValueSubject.value.getter();

  return v4;
}

- (void).cxx_destruct
{
}

@end