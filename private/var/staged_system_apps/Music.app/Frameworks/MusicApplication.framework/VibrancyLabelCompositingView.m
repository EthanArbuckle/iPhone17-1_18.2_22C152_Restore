@interface VibrancyLabelCompositingView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)text;
- (_TtC16MusicApplication28VibrancyLabelCompositingView)initWithCoder:(id)a3;
- (_TtC16MusicApplication28VibrancyLabelCompositingView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setText:(id)a3;
@end

@implementation VibrancyLabelCompositingView

- (_TtC16MusicApplication28VibrancyLabelCompositingView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_3C235C();
}

- (NSString)text
{
  if (*(void *)&self->text[OBJC_IVAR____TtC16MusicApplication28VibrancyLabelCompositingView_text])
  {
    swift_bridgeObjectRetain();
    NSString v2 = sub_AB64D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v2 = 0;
  }

  return (NSString *)v2;
}

- (void)setText:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_AB6510();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC16MusicApplication28VibrancyLabelCompositingView_text);
  uint64_t v7 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC16MusicApplication28VibrancyLabelCompositingView_text);
  uint64_t v8 = *(void *)&self->text[OBJC_IVAR____TtC16MusicApplication28VibrancyLabelCompositingView_text];
  uint64_t *v6 = v4;
  v6[1] = v5;
  v9 = self;
  sub_3C16B4(v7, v8);

  swift_bridgeObjectRelease();
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for VibrancyLabelCompositingView();
  NSString v2 = (char *)v11.receiver;
  [(VibrancyLabelCompositingView *)&v11 layoutSubviews];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [*(id *)&v2[OBJC_IVAR____TtC16MusicApplication28VibrancyLabelCompositingView_mainLabel] setFrame:];
  [*(id *)&v2[OBJC_IVAR____TtC16MusicApplication28VibrancyLabelCompositingView_overlayLabel] setFrame:v4, v6, v8, v10];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = self;
  sub_3C18D4();
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)intrinsicContentSize
{
  [*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication28VibrancyLabelCompositingView_mainLabel) intrinsicContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (_TtC16MusicApplication28VibrancyLabelCompositingView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC16MusicApplication28VibrancyLabelCompositingView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  double v3 = *(void **)&self->text[OBJC_IVAR____TtC16MusicApplication28VibrancyLabelCompositingView_properties + 8];
  double v4 = *(void **)&self->properties[OBJC_IVAR____TtC16MusicApplication28VibrancyLabelCompositingView_properties];

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication28VibrancyLabelCompositingView_mainLabel));
  double v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication28VibrancyLabelCompositingView_overlayLabel);
}

@end