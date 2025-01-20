@interface AudioRecordingLiveActivityBannerViewController
- (BOOL)_canShowWhileLocked;
- (_TtC7Journal46AudioRecordingLiveActivityBannerViewController)initWithCoder:(id)a3;
- (void)handleTap:(id)a3;
- (void)viewDidLoad;
@end

@implementation AudioRecordingLiveActivityBannerViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC7Journal46AudioRecordingLiveActivityBannerViewController)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC7Journal46AudioRecordingLiveActivityBannerViewController____lazy_storage___waveformView) = 0;
  v6 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC7Journal46AudioRecordingLiveActivityBannerViewController____lazy_storage___emptyTimeCodeString);
  void *v6 = 0;
  v6[1] = 0;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return [(AudioRecordingLiveActivityViewController *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal46AudioRecordingLiveActivityBannerViewController____lazy_storage___waveformView));

  swift_bridgeObjectRelease();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100025958();
}

- (void)handleTap:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100026258(v4);
}

@end