@interface PlaybackButton
- (_TtC7Journal14PlaybackButton)initWithCoder:(id)a3;
- (_TtC7Journal14PlaybackButton)initWithFrame:(CGRect)a3;
- (void)updateConfiguration;
@end

@implementation PlaybackButton

- (_TtC7Journal14PlaybackButton)initWithFrame:(CGRect)a3
{
  return (_TtC7Journal14PlaybackButton *)sub_1000E1050(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Journal14PlaybackButton)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC7Journal14PlaybackButton_isPlaying) = 0;
  id v4 = a3;

  result = (_TtC7Journal14PlaybackButton *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)updateConfiguration
{
  v2 = self;
  sub_1000E1724();
}

@end