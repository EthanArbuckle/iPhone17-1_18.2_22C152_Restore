@interface APPCMetricsVideoView
- (APPrivacyMarker)privacyMarker;
- (void)beginAction;
- (void)didAddSubview:(id)a3;
- (void)didMoveToSuperview;
- (void)didMoveToWindow;
@end

@implementation APPCMetricsVideoView

- (APPrivacyMarker)privacyMarker
{
  return (APPrivacyMarker *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                    + OBJC_IVAR___APPCMetricsVideoView_privacyMarker));
}

- (void)didAddSubview:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for MetricsVideoView();
  id v4 = a3;
  id v5 = v6.receiver;
  [(APPCMetricsVideoView *)&v6 didAddSubview:v4];
  sub_1B5D15940(0, 0);
}

- (void)didMoveToSuperview
{
}

- (void)didMoveToWindow
{
}

- (void)beginAction
{
  v2 = self;
  sub_1B5D7E874();
}

- (void).cxx_destruct
{
  sub_1B5D09338(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR___APPCMetricsVideoView_representationFetched));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___APPCMetricsVideoView_videoView);
}

@end