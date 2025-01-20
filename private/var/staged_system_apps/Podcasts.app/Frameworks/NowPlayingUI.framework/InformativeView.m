@interface InformativeView
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)message;
- (NSString)title;
- (_TtC12NowPlayingUI15InformativeView)initWithCoder:(id)a3;
- (_TtC12NowPlayingUI15InformativeView)initWithFrame:(CGRect)a3;
- (_TtCV12NowPlayingUI14DeprecatedText9StackView)accessibilityTextStackView;
- (void)layoutSubviews;
- (void)music_inheritedLayoutInsetsDidChange;
- (void)preferredContentSizeDidChangeWithNewContentSizeCategory:(id)a3;
- (void)setMessage:(id)a3;
- (void)setTitle:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation InformativeView

- (_TtC12NowPlayingUI15InformativeView)initWithFrame:(CGRect)a3
{
  return (_TtC12NowPlayingUI15InformativeView *)sub_503F8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12NowPlayingUI15InformativeView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_52164();
}

- (NSString)title
{
  return (NSString *)sub_50A80((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC12NowPlayingUI15InformativeView_title);
}

- (void)setTitle:(id)a3
{
}

- (NSString)message
{
  return (NSString *)sub_50A80((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC12NowPlayingUI15InformativeView_message);
}

- (void)setMessage:(id)a3
{
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  sub_50CB4(width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_50EB0();
}

- (void)music_inheritedLayoutInsetsDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for InformativeView();
  v2 = (char *)v4.receiver;
  [(InformativeView *)&v4 music_inheritedLayoutInsetsDidChange];
  [v2 setNeedsLayout];
  id v3 = *(void (**)(char *))&v2[OBJC_IVAR____TtC12NowPlayingUI15InformativeView_layoutInvalidationHandler];
  if (v3)
  {
    swift_retain();
    v3(v2);
    sub_FB70((uint64_t)v3);
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  double v6 = self;
  sub_51700(a3);
}

- (void)preferredContentSizeDidChangeWithNewContentSizeCategory:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_52320();
}

- (_TtCV12NowPlayingUI14DeprecatedText9StackView)accessibilityTextStackView
{
  return (_TtCV12NowPlayingUI14DeprecatedText9StackView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                  + OBJC_IVAR____TtC12NowPlayingUI15InformativeView_textStackView));
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_FB70(*(uint64_t *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR____TtC12NowPlayingUI15InformativeView_actionHandler));
  sub_FB70(*(uint64_t *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR____TtC12NowPlayingUI15InformativeView_layoutInvalidationHandler));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI15InformativeView_textStackView));
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI15InformativeView_actionButton));
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12NowPlayingUI15InformativeView_imageView);
}

@end