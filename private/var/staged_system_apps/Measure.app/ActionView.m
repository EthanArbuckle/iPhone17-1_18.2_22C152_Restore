@interface ActionView
- (_TtC7Measure10ActionView)initWithCoder:(id)a3;
- (_TtC7Measure10ActionView)initWithFrame:(CGRect)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation ActionView

- (_TtC7Measure10ActionView)initWithCoder:(id)a3
{
  *(void *)&self->delegate[OBJC_IVAR____TtC7Measure10ActionView_delegate] = 0;
  swift_unknownObjectWeakInit();
  id v5 = a3;

  result = (_TtC7Measure10ActionView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_10001FD84();
  sub_10001FDC4();
  uint64_t v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a4;
  v8 = self;
  sub_10001F8F0(v6, (uint64_t)a4);

  swift_bridgeObjectRelease();
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
}

- (_TtC7Measure10ActionView)initWithFrame:(CGRect)a3
{
  result = (_TtC7Measure10ActionView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10001FE1C((uint64_t)self + OBJC_IVAR____TtC7Measure10ActionView_delegate);

  swift_release();
}

@end