@interface MFTimeSensitiveBannerView
- (_TtC10MobileMail25MFTimeSensitiveBannerView)initWithCategory:(unint64_t)a3 showDescription:(BOOL)a4;
- (_TtC10MobileMail25MFTimeSensitiveBannerView)initWithFrame:(CGRect)a3;
- (void)createPrimaryViews;
- (void)updateCategoryWithCategory:(unint64_t)a3;
@end

@implementation MFTimeSensitiveBannerView

- (_TtC10MobileMail25MFTimeSensitiveBannerView)initWithCategory:(unint64_t)a3 showDescription:(BOOL)a4
{
  char v4 = _convertObjCBoolToBool(_:)();
  return (_TtC10MobileMail25MFTimeSensitiveBannerView *)MFTimeSensitiveBannerView.init(category:showDescription:)(a3, v4 & 1);
}

- (void)createPrimaryViews
{
  v2 = self;
  MFTimeSensitiveBannerView.createPrimaryViews()();
}

- (void)updateCategoryWithCategory:(unint64_t)a3
{
  v3 = self;
  MFTimeSensitiveBannerView.updateCategory(category:)();
}

- (_TtC10MobileMail25MFTimeSensitiveBannerView)initWithFrame:(CGRect)a3
{
  return (_TtC10MobileMail25MFTimeSensitiveBannerView *)MFTimeSensitiveBannerView.init(frame:)();
}

- (void).cxx_destruct
{
  swift_release();
}

@end