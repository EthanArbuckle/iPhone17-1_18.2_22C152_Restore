@interface VideoHeaderPlayButton
- (BOOL)isHighlighted;
- (BOOL)isSelected;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC16MusicApplication21VideoHeaderPlayButton)initWithCoder:(id)a3;
- (_TtC16MusicApplication21VideoHeaderPlayButton)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation VideoHeaderPlayButton

- (_TtC16MusicApplication21VideoHeaderPlayButton)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication21VideoHeaderPlayButton *)sub_463690(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication21VideoHeaderPlayButton)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC16MusicApplication21VideoHeaderPlayButton_isBlurBackgroundEnabled) = 0;
  uint64_t v5 = OBJC_IVAR____TtC16MusicApplication21VideoHeaderPlayButton_backgroundView;
  id v6 = objc_allocWithZone((Class)UIView);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)[v6 init];

  result = (_TtC16MusicApplication21VideoHeaderPlayButton *)sub_AB8280();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_463C3C();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  if (a3.height >= a3.width) {
    double width = a3.width;
  }
  else {
    double width = a3.height;
  }
  sub_4C150();
  char v4 = sub_AB1200();
  double v5 = 64.0;
  if ((v4 & 1) == 0) {
    double v5 = width;
  }
  double v6 = v5;
  result.height = v6;
  result.double width = v5;
  return result;
}

- (BOOL)isHighlighted
{
  return sub_463F04(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
}

- (BOOL)isSelected
{
  return sub_463F04(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (void)setSelected:(BOOL)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication21VideoHeaderPlayButton_playImageView));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication21VideoHeaderPlayButton_backgroundView);
}

@end