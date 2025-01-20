@interface CollectionAccessoryView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)title;
- (_TtC16MusicApplication23CollectionAccessoryView)initWithCoder:(id)a3;
- (_TtC16MusicApplication23CollectionAccessoryView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setTitle:(id)a3;
- (void)tintColorDidChange;
@end

@implementation CollectionAccessoryView

- (_TtC16MusicApplication23CollectionAccessoryView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication23CollectionAccessoryView *)sub_E2B88(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication23CollectionAccessoryView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_E4468();
}

- (NSString)title
{
  swift_bridgeObjectRetain();
  NSString v2 = sub_AB64D0();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setTitle:(id)a3
{
  uint64_t v5 = sub_AB6510();
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC16MusicApplication23CollectionAccessoryView_title);
  uint64_t *v6 = v5;
  v6[1] = v7;
  id v8 = a3;
  v9 = self;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v10 = *v6;
  uint64_t v11 = v6[1];
  swift_retain();
  swift_bridgeObjectRetain();
  TextStackView.Component.textValue.setter(v10, v11);

  swift_release();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v4 = self;
  double v5 = sub_E3374(width);
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.double width = v8;
  return result;
}

- (CGSize)intrinsicContentSize
{
  NSString v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication23CollectionAccessoryView_accessoryImageView);
  id v3 = self;
  [v2 sizeThatFits:0.0, 0.0];
  double v5 = v4;
  double v7 = v6;
  [*(id *)((char *)&v3->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication23CollectionAccessoryView_textStackView) sizeThatFits:0.0, 0.0];
  double v9 = v8;
  double v11 = v10;

  double v12 = v5 + v9 + 8.0;
  if (v11 > v7) {
    double v13 = v11;
  }
  else {
    double v13 = v7;
  }
  result.height = v13;
  result.double width = v12;
  return result;
}

- (void)layoutSubviews
{
  NSString v2 = self;
  sub_E3544();
}

- (void)tintColorDidChange
{
  NSString v2 = self;
  sub_E3814();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication23CollectionAccessoryView_titleTextColor));
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication23CollectionAccessoryView_handler));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication23CollectionAccessoryView_accessoryImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication23CollectionAccessoryView_textStackView));
  id v3 = *(void **)&self->title[OBJC_IVAR____TtC16MusicApplication23CollectionAccessoryView_textComponents + 8];
  double v4 = *(void **)&self->titleTextColor[OBJC_IVAR____TtC16MusicApplication23CollectionAccessoryView_textComponents];
  swift_bridgeObjectRelease();

  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication23CollectionAccessoryView_button));

  swift_release();
}

@end