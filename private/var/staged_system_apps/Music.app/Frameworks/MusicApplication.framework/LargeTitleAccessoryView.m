@interface LargeTitleAccessoryView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC16MusicApplication23LargeTitleAccessoryView)init;
- (_TtC16MusicApplication23LargeTitleAccessoryView)initWithCoder:(id)a3;
- (_TtC16MusicApplication23LargeTitleAccessoryView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation LargeTitleAccessoryView

- (_TtC16MusicApplication23LargeTitleAccessoryView)init
{
  return (_TtC16MusicApplication23LargeTitleAccessoryView *)sub_261FB4();
}

- (_TtC16MusicApplication23LargeTitleAccessoryView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC16MusicApplication23LargeTitleAccessoryView_content) = (Class)_swiftEmptyArrayStorage;
  uint64_t v4 = OBJC_IVAR____TtC16MusicApplication23LargeTitleAccessoryView_spacing;
  id v5 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v4) = (Class)*UIBarButtonItem.preferredFixedSpace.unsafeMutableAddressor();

  result = (_TtC16MusicApplication23LargeTitleAccessoryView *)sub_AB8280();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_262144();
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  sub_262428();
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = self;
  sub_262428();
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (_TtC16MusicApplication23LargeTitleAccessoryView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC16MusicApplication23LargeTitleAccessoryView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end