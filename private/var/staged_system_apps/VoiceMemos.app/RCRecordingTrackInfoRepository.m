@interface RCRecordingTrackInfoRepository
+ (_TtC10VoiceMemos30RCRecordingTrackInfoRepository)repositoryWithObserver:(id)a3;
- (_TtC10VoiceMemos30RCRecordingTrackInfoRepository)init;
- (unint64_t)state;
- (void)clearMutedTrackIndex;
- (void)registerObserver:(id)a3;
- (void)setMutedTrackIndexWithMutedIndex:(int64_t)a3;
- (void)setState:(unint64_t)a3;
@end

@implementation RCRecordingTrackInfoRepository

- (void)registerObserver:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_1001023BC((uint64_t)a3);
  swift_unknownObjectRelease();
}

- (unint64_t)state
{
  v2 = self;
  CurrentValueSubject.value.getter();

  return v4;
}

- (void)setState:(unint64_t)a3
{
  unint64_t v4 = self;
  sub_100102540(a3);
}

- (void)setMutedTrackIndexWithMutedIndex:(int64_t)a3
{
  unint64_t v4 = self;
  sub_1001026C8(a3);
}

- (void)clearMutedTrackIndex
{
  v2 = self;
  CurrentValueSubject.value.getter();
  CurrentValueSubject.value.setter();
}

- (_TtC10VoiceMemos30RCRecordingTrackInfoRepository)init
{
  return (_TtC10VoiceMemos30RCRecordingTrackInfoRepository *)sub_1001028A4();
}

+ (_TtC10VoiceMemos30RCRecordingTrackInfoRepository)repositoryWithObserver:(id)a3
{
  swift_unknownObjectRetain();
  unint64_t v4 = sub_100102B00((uint64_t)a3);
  swift_unknownObjectRelease();

  return (_TtC10VoiceMemos30RCRecordingTrackInfoRepository *)v4;
}

- (void).cxx_destruct
{
  swift_release();

  swift_release();
}

@end