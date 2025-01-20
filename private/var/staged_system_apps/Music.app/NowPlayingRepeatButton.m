@interface NowPlayingRepeatButton
- (_TtC5Music22NowPlayingRepeatButton)initWithCoder:(id)a3;
- (_TtC5Music22NowPlayingRepeatButton)initWithFrame:(CGRect)a3;
- (int64_t)accessibilityRepeatType;
- (void)tintColorDidChange;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation NowPlayingRepeatButton

- (_TtC5Music22NowPlayingRepeatButton)initWithFrame:(CGRect)a3
{
  return (_TtC5Music22NowPlayingRepeatButton *)sub_100013288(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_100015654((uint64_t)a3);
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for NowPlayingRepeatButton();
  id v2 = v3.receiver;
  [(NowPlayingRepeatButton *)&v3 tintColorDidChange];
  sub_100063F48();
}

- (_TtC5Music22NowPlayingRepeatButton)initWithCoder:(id)a3
{
  *(void *)&self->MPButton_opaque[OBJC_IVAR____TtC5Music22NowPlayingRepeatButton_repeatType] = 0;
  *(void *)&self->MPButton_opaque[OBJC_IVAR____TtC5Music22NowPlayingRepeatButton_defaultColor] = 0;
  *(void *)&self->MPButton_opaque[OBJC_IVAR____TtC5Music22NowPlayingRepeatButton_selectedColor] = 0;
  *(void *)&self->MPButton_opaque[OBJC_IVAR____TtC5Music22NowPlayingRepeatButton_selectedBackgroundColor] = 0;
  *(void *)&self->MPButton_opaque[OBJC_IVAR____TtC5Music22NowPlayingRepeatButton_dimmedBackgroundColor] = 0;
  id v4 = a3;

  result = (_TtC5Music22NowPlayingRepeatButton *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (int64_t)accessibilityRepeatType
{
  return *(void *)&self->MPButton_opaque[OBJC_IVAR____TtC5Music22NowPlayingRepeatButton_repeatType];
}

- (void).cxx_destruct
{
  objc_super v3 = *(void **)&self->MPButton_opaque[OBJC_IVAR____TtC5Music22NowPlayingRepeatButton_dimmedBackgroundColor];
}

@end