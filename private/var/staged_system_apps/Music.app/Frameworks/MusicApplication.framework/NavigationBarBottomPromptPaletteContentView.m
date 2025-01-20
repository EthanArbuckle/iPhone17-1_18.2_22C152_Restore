@interface NavigationBarBottomPromptPaletteContentView
- (CGSize)sizeThatFits:(CGSize)result;
- (_TtC16MusicApplication43NavigationBarBottomPromptPaletteContentView)initWithCoder:(id)a3;
- (_TtC16MusicApplication43NavigationBarBottomPromptPaletteContentView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation NavigationBarBottomPromptPaletteContentView

- (_TtC16MusicApplication43NavigationBarBottomPromptPaletteContentView)initWithCoder:(id)a3
{
  uint64_t v4 = OBJC_IVAR____TtC16MusicApplication43NavigationBarBottomPromptPaletteContentView_textLabel;
  id v5 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v4) = (Class)sub_1B46F8();

  result = (_TtC16MusicApplication43NavigationBarBottomPromptPaletteContentView *)sub_AB8280();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3 = 28.0;
  result.height = v3;
  return result;
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v2 = (char *)v6.receiver;
  [(NavigationBarBottomPromptPaletteContentView *)&v6 layoutSubviews];
  double v3 = *(void **)&v2[OBJC_IVAR____TtC16MusicApplication43NavigationBarBottomPromptPaletteContentView_textLabel];
  [v2 bounds];
  double Width = CGRectGetWidth(v7);
  [v2 bounds];
  [v3 sizeThatFits:CGRectGetWidth(v8)];
  [v3 setFrame:CGRectMake(0.0, 0.0, Width, v5)];
}

- (_TtC16MusicApplication43NavigationBarBottomPromptPaletteContentView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication43NavigationBarBottomPromptPaletteContentView_textLabel));
}

@end