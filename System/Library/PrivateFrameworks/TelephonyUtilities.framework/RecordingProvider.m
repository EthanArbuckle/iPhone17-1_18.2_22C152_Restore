@interface RecordingProvider
- (_TtC13callservicesd17RecordingProvider)init;
- (void)momentsController:(id)a3 didFinishRecordingMedia:(id)a4;
- (void)momentsControllerServerDied:(id)a3;
@end

@implementation RecordingProvider

- (_TtC13callservicesd17RecordingProvider)init
{
}

- (void).cxx_destruct
{
  sub_100235804((uint64_t)self + OBJC_IVAR____TtC13callservicesd17RecordingProvider_delegate, &qword_10058B030);

  type metadata accessor for LanguageManager();
  sub_10020233C();
  sub_1001F7664();
  v3();

  swift_release();
  sub_100235804((uint64_t)self + OBJC_IVAR____TtC13callservicesd17RecordingProvider_currentlyEndingRecordingDueToUpdate, (uint64_t *)&unk_100585580);
}

- (void)momentsController:(id)a3 didFinishRecordingMedia:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_100356834();
}

- (void)momentsControllerServerDied:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100356D6C();
}

@end