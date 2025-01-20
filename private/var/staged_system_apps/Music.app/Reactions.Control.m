@interface Reactions.Control
- (CGRect)frame;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtCE5MusicO11MusicCoreUI9Reactions7Control)initWithCoder:(id)a3;
- (_TtCE5MusicO11MusicCoreUI9Reactions7Control)initWithFrame:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
@end

@implementation Reactions.Control

- (_TtCE5MusicO11MusicCoreUI9Reactions7Control)initWithCoder:(id)a3
{
  result = (_TtCE5MusicO11MusicCoreUI9Reactions7Control *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (CGSize)intrinsicContentSize
{
  [*(id *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtCE5MusicO11MusicCoreUI9Reactions7Control_contentView) intrinsicContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(Reactions.Control *)self intrinsicContentSize];
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGRect)frame
{
  v6.receiver = self;
  v6.super_class = (Class)_s7ControlCMa(0);
  [(Reactions.Control *)&v6 frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)_s7ControlCMa(0);
  v7 = (char *)v9.receiver;
  -[Reactions.Control setFrame:](&v9, "setFrame:", x, y, width, height);
  v8 = *(void **)&v7[OBJC_IVAR____TtCE5MusicO11MusicCoreUI9Reactions7Control_contentView];
  [v7 bounds];
  [v8 setFrame:];
}

- (_TtCE5MusicO11MusicCoreUI9Reactions7Control)initWithFrame:(CGRect)a3
{
  CGRect result = (_TtCE5MusicO11MusicCoreUI9Reactions7Control *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10021E014((uint64_t)self + OBJC_IVAR____TtCE5MusicO11MusicCoreUI9Reactions7Control_context, _s7ContextVMa);
  sub_10021E014((uint64_t)self + OBJC_IVAR____TtCE5MusicO11MusicCoreUI9Reactions7Control_reactionsStackView, type metadata accessor for Reactions.StackView);
  swift_release();
  double v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtCE5MusicO11MusicCoreUI9Reactions7Control_contentView);
}

@end