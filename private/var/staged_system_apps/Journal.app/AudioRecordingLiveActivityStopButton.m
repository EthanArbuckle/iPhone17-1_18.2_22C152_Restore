@interface AudioRecordingLiveActivityStopButton
- (_TtC7Journal36AudioRecordingLiveActivityStopButton)initWithCoder:(id)a3;
- (_TtC7Journal36AudioRecordingLiveActivityStopButton)initWithFrame:(CGRect)a3;
- (void)updateConfiguration;
@end

@implementation AudioRecordingLiveActivityStopButton

- (_TtC7Journal36AudioRecordingLiveActivityStopButton)initWithFrame:(CGRect)a3
{
  return (_TtC7Journal36AudioRecordingLiveActivityStopButton *)sub_1001DE8D8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Journal36AudioRecordingLiveActivityStopButton)initWithCoder:(id)a3
{
  return 0;
}

- (void)updateConfiguration
{
  v2 = self;
  sub_1001DEF28();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC7Journal36AudioRecordingLiveActivityStopButton__phase;
  uint64_t v4 = sub_100010218(&qword_100802BA0);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC7Journal36AudioRecordingLiveActivityStopButton____lazy_storage___packageView);

  sub_1000D39C0(v5);
}

@end