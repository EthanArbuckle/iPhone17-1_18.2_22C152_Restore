@interface VideoLooperView
- (_TtC10FitnessApp15VideoLooperView)initWithCoder:(id)a3;
- (_TtC10FitnessApp15VideoLooperView)initWithFrame:(CGRect)a3;
- (void)configurePlayer;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)teardownPlayer;
@end

@implementation VideoLooperView

- (void)dealloc
{
  v2 = self;
  sub_1006CABB4();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC10FitnessApp15VideoLooperView_url;
  uint64_t v4 = type metadata accessor for URL();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for VideoLooperView();
  v2 = (char *)v5.receiver;
  [(VideoLooperView *)&v5 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC10FitnessApp15VideoLooperView_playerLayer];
  if (v3)
  {
    uint64_t v4 = v3;
    [v2 bounds];
    [v4 setFrame:];

    v2 = v4;
  }
}

- (void)didMoveToWindow
{
  v2 = self;
  sub_1006CAE74();
}

- (_TtC10FitnessApp15VideoLooperView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10FitnessApp15VideoLooperView_player) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10FitnessApp15VideoLooperView_playerLayer) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10FitnessApp15VideoLooperView_observers) = (Class)_swiftEmptyArrayStorage;
  id v4 = a3;

  result = (_TtC10FitnessApp15VideoLooperView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC10FitnessApp15VideoLooperView)initWithFrame:(CGRect)a3
{
  result = (_TtC10FitnessApp15VideoLooperView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)configurePlayer
{
  v2 = self;
  sub_1006CB0E8();
}

- (void)teardownPlayer
{
  v2 = self;
  sub_1006CB3B4();
}

@end