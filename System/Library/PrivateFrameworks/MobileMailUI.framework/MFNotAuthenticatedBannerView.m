@interface MFNotAuthenticatedBannerView
- (_TtC12MobileMailUI28MFNotAuthenticatedBannerView)initWithFrame:(CGRect)a3;
- (_TtC12MobileMailUI28MFNotAuthenticatedBannerView)initWithFrame:(CGRect)a3 banner:(id)a4;
- (_TtC12MobileMailUI28MFNotAuthenticatedBannerView)initWithFrame:(CGRect)a3 sender:(id)a4;
- (_TtP12MobileMailUI36MFNotAuthenticatedBannerViewDelegate_)delegate;
- (void)setDelegate:(id)a3;
@end

@implementation MFNotAuthenticatedBannerView

- (_TtP12MobileMailUI36MFNotAuthenticatedBannerViewDelegate_)delegate
{
  v2 = self;
  id v5 = (id)sub_1DDF96A1C();

  return (_TtP12MobileMailUI36MFNotAuthenticatedBannerViewDelegate_ *)v5;
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1DDF96AD4();
}

- (_TtC12MobileMailUI28MFNotAuthenticatedBannerView)initWithFrame:(CGRect)a3 sender:(id)a4
{
  id v4 = a4;
  uint64_t v5 = sub_1DDF9AB40();
  v10 = (_TtC12MobileMailUI28MFNotAuthenticatedBannerView *)MFNotAuthenticatedBannerView.init(frame:sender:)(v5, v6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);

  return v10;
}

- (_TtC12MobileMailUI28MFNotAuthenticatedBannerView)initWithFrame:(CGRect)a3
{
  return (_TtC12MobileMailUI28MFNotAuthenticatedBannerView *)MFNotAuthenticatedBannerView.init(frame:)();
}

- (_TtC12MobileMailUI28MFNotAuthenticatedBannerView)initWithFrame:(CGRect)a3 banner:(id)a4
{
  id v4 = a4;
  return (_TtC12MobileMailUI28MFNotAuthenticatedBannerView *)MFNotAuthenticatedBannerView.init(frame:banner:)();
}

- (void).cxx_destruct
{
}

@end