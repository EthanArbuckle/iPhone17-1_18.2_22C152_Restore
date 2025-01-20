@interface LargeTitleAccessoryView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC5Music23LargeTitleAccessoryView)init;
- (_TtC5Music23LargeTitleAccessoryView)initWithCoder:(id)a3;
- (_TtC5Music23LargeTitleAccessoryView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation LargeTitleAccessoryView

- (_TtC5Music23LargeTitleAccessoryView)init
{
  return (_TtC5Music23LargeTitleAccessoryView *)sub_100036D6C();
}

- (_TtC5Music23LargeTitleAccessoryView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Music23LargeTitleAccessoryView_content) = (Class)_swiftEmptyArrayStorage;
  uint64_t v4 = OBJC_IVAR____TtC5Music23LargeTitleAccessoryView_spacing;
  id v5 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v4) = (Class)*UIBarButtonItem.preferredFixedSpace.unsafeMutableAddressor();

  result = (_TtC5Music23LargeTitleAccessoryView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1002CDEB0();
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  sub_1002CE194();
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
  sub_1002CE194();
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (_TtC5Music23LargeTitleAccessoryView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC5Music23LargeTitleAccessoryView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end