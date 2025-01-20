@interface JournalAssetView
- (_TtC20JournalWidgetsSecure16JournalAssetView)initWithCoder:(id)a3;
- (_TtC20JournalWidgetsSecure16JournalAssetView)initWithFrame:(CGRect)a3;
@end

@implementation JournalAssetView

- (_TtC20JournalWidgetsSecure16JournalAssetView)initWithFrame:(CGRect)a3
{
  return (_TtC20JournalWidgetsSecure16JournalAssetView *)sub_100013018(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20JournalWidgetsSecure16JournalAssetView)initWithCoder:(id)a3
{
  return (_TtC20JournalWidgetsSecure16JournalAssetView *)sub_10001312C(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20JournalWidgetsSecure16JournalAssetView_fallbackView));
  v3 = (char *)self + OBJC_IVAR____TtC20JournalWidgetsSecure16JournalAssetView_loadingDelegate;

  sub_1000132D4((uint64_t)v3);
}

@end