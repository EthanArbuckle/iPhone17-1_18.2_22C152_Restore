@interface LemonadeInlineStoryPlayerUIView
- (_TtC12PhotosUICore31LemonadeInlineStoryPlayerUIView)initWithCoder:(id)a3;
- (_TtC12PhotosUICore31LemonadeInlineStoryPlayerUIView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation LemonadeInlineStoryPlayerUIView

- (_TtC12PhotosUICore31LemonadeInlineStoryPlayerUIView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12PhotosUICore31LemonadeInlineStoryPlayerUIView____lazy_storage___player) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12PhotosUICore31LemonadeInlineStoryPlayerUIView____lazy_storage___contentPlayerView) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC12PhotosUICore31LemonadeInlineStoryPlayerUIView_placeholderKenBurnsEffect;
  type metadata accessor for LemonadeInlineStoryPlayer();
  id v6 = a3;
  *(double *)v5 = sub_1A9D04DA8();
  *((void *)v5 + 1) = v7;
  v5[16] = v8 & 1;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12PhotosUICore31LemonadeInlineStoryPlayerUIView____lazy_storage___placeholderView) = (Class)1;

  result = (_TtC12PhotosUICore31LemonadeInlineStoryPlayerUIView *)sub_1AB23C1FC();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AA2D84B4();
}

- (_TtC12PhotosUICore31LemonadeInlineStoryPlayerUIView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore31LemonadeInlineStoryPlayerUIView____lazy_storage___contentPlayerView));
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12PhotosUICore31LemonadeInlineStoryPlayerUIView____lazy_storage___placeholderView);
  sub_1A9EAA228(v3);
}

@end