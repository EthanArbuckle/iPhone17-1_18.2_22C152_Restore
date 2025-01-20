@interface PlaybackCloseButton
- (_TtC9SeymourUI19PlaybackCloseButton)initWithCoder:(id)a3;
- (_TtC9SeymourUI19PlaybackCloseButton)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation PlaybackCloseButton

- (_TtC9SeymourUI19PlaybackCloseButton)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI19PlaybackCloseButton *)sub_23A2071FC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI19PlaybackCloseButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A207A9C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_23A207738();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI19PlaybackCloseButton_blurView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI19PlaybackCloseButton_iconImageView));
  objc_release(*(id *)((char *)&self->super.super.super._cachedTraitCollection
                     + OBJC_IVAR____TtC9SeymourUI19PlaybackCloseButton_styleProvider));
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI19PlaybackCloseButton_vibrancyView);
}

@end