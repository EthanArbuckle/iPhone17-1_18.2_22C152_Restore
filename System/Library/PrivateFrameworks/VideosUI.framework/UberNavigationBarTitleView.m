@interface UberNavigationBarTitleView
- (BOOL)allowsUberTinting;
- (_TtC8VideosUI26UberNavigationBarTitleView)initWithCoder:(id)a3;
- (_TtC8VideosUI26UberNavigationBarTitleView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)contentDidChange;
- (void)layoutSubviews;
- (void)setAllowsUberTinting:(BOOL)a3;
- (void)setScrolledNonUberPercentage:(double)a3;
@end

@implementation UberNavigationBarTitleView

- (BOOL)allowsUberTinting
{
  return sub_1E315BFF8() & 1;
}

- (void)setAllowsUberTinting:(BOOL)a3
{
}

- (_TtC8VideosUI26UberNavigationBarTitleView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E315CF34();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1E315D088();
}

- (void)contentDidChange
{
  v2 = self;
  sub_1E315D780();
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  v9 = self;
  id v10 = sub_1E315D80C((uint64_t)a4, x, y);

  return v10;
}

- (_TtC8VideosUI26UberNavigationBarTitleView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI26UberNavigationBarTitleView_customBackButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI26UberNavigationBarTitleView_titleView));
  sub_1E2C5FB90(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC8VideosUI26UberNavigationBarTitleView_backButtonFrameChangeHandler));
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
}

- (void)setScrolledNonUberPercentage:(double)a3
{
  v4 = self;
  sub_1E315DD64(a3);
}

@end