@interface TrackPreviewViewController
- (_TtC16MusicMessagesAppP33_578446D9A918AE2275B472A9158C63A626TrackPreviewViewController)initWithCoder:(id)a3;
- (_TtC16MusicMessagesAppP33_578446D9A918AE2275B472A9158C63A626TrackPreviewViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation TrackPreviewViewController

- (_TtC16MusicMessagesAppP33_578446D9A918AE2275B472A9158C63A626TrackPreviewViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicMessagesAppP33_578446D9A918AE2275B472A9158C63A626TrackPreviewViewController__cellView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicMessagesAppP33_578446D9A918AE2275B472A9158C63A626TrackPreviewViewController__sharableTrack) = 0;
  id v4 = a3;

  result = (_TtC16MusicMessagesAppP33_578446D9A918AE2275B472A9158C63A626TrackPreviewViewController *)sub_100485590();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1000103D0();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_1000107B4();
}

- (_TtC16MusicMessagesAppP33_578446D9A918AE2275B472A9158C63A626TrackPreviewViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC16MusicMessagesAppP33_578446D9A918AE2275B472A9158C63A626TrackPreviewViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicMessagesAppP33_578446D9A918AE2275B472A9158C63A626TrackPreviewViewController__cellView));

  swift_release();
}

@end