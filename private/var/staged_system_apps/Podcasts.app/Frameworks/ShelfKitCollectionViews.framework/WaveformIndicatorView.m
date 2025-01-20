@interface WaveformIndicatorView
- (_TtC23ShelfKitCollectionViews21WaveformIndicatorView)init;
- (_TtC23ShelfKitCollectionViews21WaveformIndicatorView)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews21WaveformIndicatorView)initWithFrame:(CGRect)a3;
- (void)didMoveToSuperview;
- (void)didMoveToWindow;
@end

@implementation WaveformIndicatorView

- (_TtC23ShelfKitCollectionViews21WaveformIndicatorView)init
{
  return (_TtC23ShelfKitCollectionViews21WaveformIndicatorView *)sub_28B344();
}

- (_TtC23ShelfKitCollectionViews21WaveformIndicatorView)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews21WaveformIndicatorView_state;
  uint64_t v6 = enum case for WaveformState.hidden(_:);
  uint64_t v7 = sub_37BF70();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 104))(v5, v6, v7);
  id v8 = a3;

  sub_385780(27);
  swift_bridgeObjectRelease();
  result = (_TtC23ShelfKitCollectionViews21WaveformIndicatorView *)sub_385890();
  __break(1u);
  return result;
}

- (void)didMoveToWindow
{
}

- (void)didMoveToSuperview
{
}

- (_TtC23ShelfKitCollectionViews21WaveformIndicatorView)initWithFrame:(CGRect)a3
{
  result = (_TtC23ShelfKitCollectionViews21WaveformIndicatorView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews21WaveformIndicatorView_state;
  uint64_t v4 = sub_37BF70();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews21WaveformIndicatorView_contentView);
}

@end