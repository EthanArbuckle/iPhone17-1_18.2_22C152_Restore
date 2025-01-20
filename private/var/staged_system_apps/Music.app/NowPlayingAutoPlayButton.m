@interface NowPlayingAutoPlayButton
- (BOOL)isSelected;
- (_TtC5Music24NowPlayingAutoPlayButton)initWithCoder:(id)a3;
- (_TtC5Music24NowPlayingAutoPlayButton)initWithFrame:(CGRect)a3;
- (void)setSelected:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation NowPlayingAutoPlayButton

- (BOOL)isSelected
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for NowPlayingAutoPlayButton();
  return [(NowPlayingAutoPlayButton *)&v3 isSelected];
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NowPlayingAutoPlayButton();
  id v4 = v5.receiver;
  [(NowPlayingAutoPlayButton *)&v5 setSelected:v3];
  sub_100596894();
}

- (_TtC5Music24NowPlayingAutoPlayButton)initWithFrame:(CGRect)a3
{
  return (_TtC5Music24NowPlayingAutoPlayButton *)sub_1005964F4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5Music24NowPlayingAutoPlayButton)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC5Music24NowPlayingAutoPlayButton_defaultColor) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC5Music24NowPlayingAutoPlayButton_selectedColor) = 0;
  id v4 = a3;

  result = (_TtC5Music24NowPlayingAutoPlayButton *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_100596750((uint64_t)a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music24NowPlayingAutoPlayButton_defaultColor));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC5Music24NowPlayingAutoPlayButton_selectedColor);
}

@end