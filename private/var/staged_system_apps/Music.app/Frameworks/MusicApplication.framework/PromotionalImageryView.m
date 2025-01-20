@interface PromotionalImageryView
- (_TtC16MusicApplication22PromotionalImageryView)initWithCoder:(id)a3;
- (_TtC16MusicApplication22PromotionalImageryView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PromotionalImageryView

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(PromotionalImageryView *)&v3 layoutSubviews];
  sub_103150(0);
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v6.receiver;
  [(PromotionalImageryView *)&v6 traitCollectionDidChange:v4];
  [v5 setNeedsLayout];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v8 = a4;
  v9 = self;
  v10 = sub_103540((uint64_t)a4, x, y);

  return v10;
}

- (_TtC16MusicApplication22PromotionalImageryView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication22PromotionalImageryView_promotionalParallaxContentView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication22PromotionalImageryView_upsellBannerView) = 0;
  v9 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplication22PromotionalImageryView_normalizedContentOffset);
  void *v9 = 0;
  v9[1] = 0;
  *(UIOffset *)((char *)&self->super.super.super.isa
              + OBJC_IVAR____TtC16MusicApplication22PromotionalImageryView_contentInsetAdditions) = UIOffsetZero;
  v11.receiver = self;
  v11.super_class = ObjectType;
  return -[PromotionalImageryView initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
}

- (_TtC16MusicApplication22PromotionalImageryView)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (_TtC16MusicApplication22PromotionalImageryView *)sub_1039DC((uint64_t)v3);

  return v4;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22PromotionalImageryView_promotionalParallaxContentView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication22PromotionalImageryView_upsellBannerView);
}

@end