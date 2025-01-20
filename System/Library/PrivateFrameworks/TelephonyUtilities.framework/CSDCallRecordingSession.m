@interface CSDCallRecordingSession
- (CSDCallRecordingSession)init;
- (NSString)description;
- (TUCallRecordingSession)tuSession;
- (TUCallRecordingSession)tuSessionWithoutStateFiltering;
@end

@implementation CSDCallRecordingSession

- (NSString)description
{
  v2 = self;
  sub_10025C3F8();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (TUCallRecordingSession)tuSession
{
  v2 = self;
  sub_10025C67C();
  v4 = v3;

  return (TUCallRecordingSession *)v4;
}

- (TUCallRecordingSession)tuSessionWithoutStateFiltering
{
  v2 = self;
  sub_10025C9BC();
  v4 = v3;

  return (TUCallRecordingSession *)v4;
}

- (CSDCallRecordingSession)init
{
}

- (void).cxx_destruct
{
  NSString v3 = (char *)self + OBJC_IVAR___CSDCallRecordingSession_uuid;
  uint64_t v4 = type metadata accessor for UUID();
  sub_10020233C();
  v6 = *(void (**)(char *, uint64_t))(v5 + 8);
  v6(v3, v4);
  swift_bridgeObjectRelease();
  sub_1002392A8((uint64_t)self + OBJC_IVAR___CSDCallRecordingSession_dateStartedRecording, &qword_100584B40);
  sub_1002392A8((uint64_t)self + OBJC_IVAR___CSDCallRecordingSession_dateEndedRecording, &qword_100584B40);
  v6((char *)self + OBJC_IVAR___CSDCallRecordingSession_requestUUID, v4);
  sub_1002392A8((uint64_t)self + OBJC_IVAR___CSDCallRecordingSession_currentMessageUUID, (uint64_t *)&unk_100585580);
  swift_bridgeObjectRelease();

  swift_unknownObjectWeakDestroy();
}

@end