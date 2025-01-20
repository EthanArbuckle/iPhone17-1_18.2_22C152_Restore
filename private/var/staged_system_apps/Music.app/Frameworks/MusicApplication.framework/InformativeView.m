@interface InformativeView
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)message;
- (NSString)title;
- (_TtC16MusicApplication15InformativeView)initWithCoder:(id)a3;
- (_TtC16MusicApplication15InformativeView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)music_inheritedLayoutInsetsDidChange;
- (void)setMessage:(id)a3;
- (void)setTitle:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation InformativeView

- (_TtC16MusicApplication15InformativeView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication15InformativeView *)sub_258674(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication15InformativeView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_25B0C4();
}

- (NSString)title
{
  return (NSString *)sub_8E8C8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication15InformativeView_title);
}

- (void)setTitle:(id)a3
{
}

- (NSString)message
{
  return (NSString *)sub_8E8C8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication15InformativeView_message);
}

- (void)setMessage:(id)a3
{
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  double v6 = sub_2593E0(width, height);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_25982C();
}

- (void)music_inheritedLayoutInsetsDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for InformativeView();
  v2 = (char *)v4.receiver;
  [(InformativeView *)&v4 music_inheritedLayoutInsetsDidChange];
  [v2 setNeedsLayout];
  id v3 = *(void (**)(char *))&v2[OBJC_IVAR____TtC16MusicApplication15InformativeView_layoutInvalidationHandler];
  if (v3)
  {
    swift_retain();
    v3(v2);
    sub_1A528((uint64_t)v3);
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  double v6 = self;
  sub_25A30C(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication15InformativeView_customView));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication15InformativeView_actionHandler));
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication15InformativeView_layoutInvalidationHandler));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication15InformativeView_actionButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication15InformativeView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication15InformativeView____lazy_storage___titleLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication15InformativeView____lazy_storage___messageLabel);
}

@end