@interface AudioRecordingLiveActivityViewController
- (_TtC7Journal40AudioRecordingLiveActivityViewController)initWithCoder:(id)a3;
- (_TtC7Journal40AudioRecordingLiveActivityViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation AudioRecordingLiveActivityViewController

- (_TtC7Journal40AudioRecordingLiveActivityViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7Journal40AudioRecordingLiveActivityViewController_recordingFinishedTask) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7Journal40AudioRecordingLiveActivityViewController____lazy_storage___timeLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7Journal40AudioRecordingLiveActivityViewController____lazy_storage___stopButton) = 0;
  id v4 = a3;

  result = (_TtC7Journal40AudioRecordingLiveActivityViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for AudioRecordingLiveActivityViewController();
  id v2 = v7.receiver;
  [(AudioRecordingLiveActivityViewController *)&v7 viewDidLoad];
  id v3 = [v2 view];
  if (v3)
  {
    id v4 = v3;
    [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

    id v5 = [v2 view];
    if (v5)
    {
      v6 = v5;
      [v5 setMaximumContentSizeCategory:UIContentSizeCategoryLarge];

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

- (void)viewIsAppearing:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AudioRecordingLiveActivityViewController();
  id v4 = v5.receiver;
  [(AudioRecordingLiveActivityViewController *)&v5 viewIsAppearing:v3];
  withObservationTracking<A>(_:onChange:)();
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AudioRecordingLiveActivityViewController();
  id v2 = v3.receiver;
  [(AudioRecordingLiveActivityViewController *)&v3 viewWillLayoutSubviews];
  withObservationTracking<A>(_:onChange:)();
}

- (_TtC7Journal40AudioRecordingLiveActivityViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC7Journal40AudioRecordingLiveActivityViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal40AudioRecordingLiveActivityViewController____lazy_storage___timeLabel));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7Journal40AudioRecordingLiveActivityViewController____lazy_storage___stopButton);
}

@end