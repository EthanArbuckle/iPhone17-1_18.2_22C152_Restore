@interface ChannelCategoryView
- (NSString)accessibilityLabel;
- (_TtC7NewsUI219ChannelCategoryView)initWithCoder:(id)a3;
- (_TtC7NewsUI219ChannelCategoryView)initWithFrame:(CGRect)a3;
@end

@implementation ChannelCategoryView

- (_TtC7NewsUI219ChannelCategoryView)initWithFrame:(CGRect)a3
{
  return (_TtC7NewsUI219ChannelCategoryView *)sub_1DF213BE8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7NewsUI219ChannelCategoryView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1DF2140BC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI219ChannelCategoryView_backgroundView));

  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7NewsUI219ChannelCategoryView_token);
}

- (NSString)accessibilityLabel
{
  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7NewsUI219ChannelCategoryView_nameLabel);
  id v3 = self;
  id v4 = objc_msgSend(v2, sel_text);
  if (v4)
  {
    v5 = v4;
    sub_1DFDFDD20();

    v6 = (void *)sub_1DFDFDCE0();
    swift_bridgeObjectRelease();
  }
  else
  {

    v6 = 0;
  }
  return (NSString *)v6;
}

@end