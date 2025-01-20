@interface CarouselItemModuleLockupView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC8AppStore15SmallLockupView)accessibilityLockupView;
- (_TtC8AppStore28CarouselItemModuleLockupView)initWithCoder:(id)a3;
- (_TtC8AppStore28CarouselItemModuleLockupView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation CarouselItemModuleLockupView

- (_TtC8AppStore28CarouselItemModuleLockupView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore28CarouselItemModuleLockupView *)sub_1002D25F0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore28CarouselItemModuleLockupView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1002D3F8C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1002D2C18();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  double v6 = sub_1002D2E98(width, height);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (_TtC8AppStore15SmallLockupView)accessibilityLockupView
{
  return (_TtC8AppStore15SmallLockupView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                   + OBJC_IVAR____TtC8AppStore28CarouselItemModuleLockupView_smallLockupView));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28CarouselItemModuleLockupView_materialBackground));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28CarouselItemModuleLockupView_smallLockupView));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC8AppStore28CarouselItemModuleLockupView_selectionHandler);

  sub_10006012C(v3);
}

@end