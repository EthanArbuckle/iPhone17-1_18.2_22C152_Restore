@interface CategoryFilterBar
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC8VideosUI17CategoryFilterBar)init;
- (_TtC8VideosUI17CategoryFilterBar)initWithCoder:(id)a3;
- (_TtC8VideosUI17CategoryFilterBar)initWithFrame:(CGRect)a3;
- (void)categoryButtonTapped:(id)a3;
- (void)layoutSubviews;
@end

@implementation CategoryFilterBar

- (_TtC8VideosUI17CategoryFilterBar)init
{
  return (_TtC8VideosUI17CategoryFilterBar *)sub_1E2CFBF18();
}

- (_TtC8VideosUI17CategoryFilterBar)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E303E850();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  sub_1E303E920();
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1E303EA6C();
}

- (void)categoryButtonTapped:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_1E303F594((uint64_t)v4);
}

- (_TtC8VideosUI17CategoryFilterBar)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1E2C5FB90(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC8VideosUI17CategoryFilterBar_selectionHandler));
  sub_1E303E284(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC8VideosUI17CategoryFilterBar_selectedCategory), *(void *)((char *)&self->super.super.super._responderFlags+ OBJC_IVAR____TtC8VideosUI17CategoryFilterBar_selectedCategory));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI17CategoryFilterBar_selectedButton));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI17CategoryFilterBar____lazy_storage___selectedButtonBackgroundView);
}

@end