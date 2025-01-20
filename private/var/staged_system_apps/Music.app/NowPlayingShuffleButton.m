@interface NowPlayingShuffleButton
- (_TtC5Music23NowPlayingShuffleButton)initWithCoder:(id)a3;
- (_TtC5Music23NowPlayingShuffleButton)initWithFrame:(CGRect)a3;
- (int64_t)accessibilityShuffleType;
- (void)tintColorDidChange;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation NowPlayingShuffleButton

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for NowPlayingShuffleButton();
  id v2 = v3.receiver;
  [(NowPlayingShuffleButton *)&v3 tintColorDidChange];
  sub_100063AC0();
}

- (_TtC5Music23NowPlayingShuffleButton)initWithFrame:(CGRect)a3
{
  return (_TtC5Music23NowPlayingShuffleButton *)sub_1000125C0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_100014E58((uint64_t)a3);
}

- (_TtC5Music23NowPlayingShuffleButton)initWithCoder:(id)a3
{
  *(void *)&self->MPButton_opaque[OBJC_IVAR____TtC5Music23NowPlayingShuffleButton_shuffleType] = 0;
  *(void *)&self->MPButton_opaque[OBJC_IVAR____TtC5Music23NowPlayingShuffleButton_defaultColor] = 0;
  *(void *)&self->MPButton_opaque[OBJC_IVAR____TtC5Music23NowPlayingShuffleButton_selectedColor] = 0;
  *(void *)&self->MPButton_opaque[OBJC_IVAR____TtC5Music23NowPlayingShuffleButton_selectedBackgroundColor] = 0;
  *(void *)&self->MPButton_opaque[OBJC_IVAR____TtC5Music23NowPlayingShuffleButton_dimmedBackgroundColor] = 0;
  id v4 = a3;

  result = (_TtC5Music23NowPlayingShuffleButton *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (int64_t)accessibilityShuffleType
{
  return *(void *)&self->MPButton_opaque[OBJC_IVAR____TtC5Music23NowPlayingShuffleButton_shuffleType];
}

- (void).cxx_destruct
{
  objc_super v3 = *(void **)&self->MPButton_opaque[OBJC_IVAR____TtC5Music23NowPlayingShuffleButton_dimmedBackgroundColor];
}

@end