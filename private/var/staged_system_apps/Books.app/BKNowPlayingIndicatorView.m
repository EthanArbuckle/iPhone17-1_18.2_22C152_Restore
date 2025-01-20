@interface BKNowPlayingIndicatorView
- (BKNowPlayingIndicatorView)initWithCoder:(id)a3;
- (BKNowPlayingIndicatorView)initWithFrame:(CGRect)a3;
- (BOOL)isHidden;
- (BOOL)showsLevelGutters;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIColor)levelColor;
- (UIColor)levelGuttersColor;
- (double)interLevelSpacing;
- (double)levelCornerRadius;
- (double)levelWidth;
- (double)maximumLevelHeight;
- (double)minimumLevelHeight;
- (int64_t)numberOfLevels;
- (int64_t)playbackState;
- (void)drawRect:(CGRect)a3;
- (void)layoutSubviews;
- (void)setHidden:(BOOL)a3;
- (void)setInterLevelSpacing:(double)a3;
- (void)setLevelColor:(id)a3;
- (void)setLevelCornerRadius:(double)a3;
- (void)setLevelGuttersColor:(id)a3;
- (void)setLevelWidth:(double)a3;
- (void)setMaximumLevelHeight:(double)a3;
- (void)setMinimumLevelHeight:(double)a3;
- (void)setNumberOfLevels:(int64_t)a3;
- (void)setPlaybackState:(int64_t)a3;
- (void)setShowsLevelGutters:(BOOL)a3;
- (void)tintColorDidChange;
@end

@implementation BKNowPlayingIndicatorView

- (double)interLevelSpacing
{
  return *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR___BKNowPlayingIndicatorView_interLevelSpacing);
}

- (void)setInterLevelSpacing:(double)a3
{
  double v3 = *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR___BKNowPlayingIndicatorView_interLevelSpacing);
  *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR___BKNowPlayingIndicatorView_interLevelSpacing) = a3;
  if (v3 != a3) {
    [(BKNowPlayingIndicatorView *)self setNeedsLayout];
  }
}

- (double)levelCornerRadius
{
  return *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR___BKNowPlayingIndicatorView_levelCornerRadius);
}

- (void)setLevelCornerRadius:(double)a3
{
  v4 = self;
  sub_1003D6A6C(a3);
}

- (double)levelWidth
{
  return *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR___BKNowPlayingIndicatorView_levelWidth);
}

- (void)setLevelWidth:(double)a3
{
  *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR___BKNowPlayingIndicatorView_levelWidth) = a3;
  [(BKNowPlayingIndicatorView *)self setNeedsLayout];
}

- (double)maximumLevelHeight
{
  return *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR___BKNowPlayingIndicatorView_maximumLevelHeight);
}

- (void)setMaximumLevelHeight:(double)a3
{
  *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR___BKNowPlayingIndicatorView_maximumLevelHeight) = a3;
  double v3 = self;
  sub_1003D7C80();
}

- (double)minimumLevelHeight
{
  return *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR___BKNowPlayingIndicatorView_minimumLevelHeight);
}

- (void)setMinimumLevelHeight:(double)a3
{
  *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR___BKNowPlayingIndicatorView_minimumLevelHeight) = a3;
  double v3 = self;
  sub_1003D7C80();
}

- (int64_t)numberOfLevels
{
  return *(int64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___BKNowPlayingIndicatorView_numberOfLevels);
}

- (void)setNumberOfLevels:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___BKNowPlayingIndicatorView_numberOfLevels) = (Class)a3;
  double v3 = self;
  sub_1003D7790();
}

- (int64_t)playbackState
{
  return *(int64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___BKNowPlayingIndicatorView_playbackState);
}

- (void)setPlaybackState:(int64_t)a3
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___BKNowPlayingIndicatorView_playbackState);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___BKNowPlayingIndicatorView_playbackState) = (Class)a3;
  if (v3 != a3)
  {
    v4 = self;
    sub_1003D7C80();
  }
}

- (BOOL)showsLevelGutters
{
  return *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___BKNowPlayingIndicatorView_showsLevelGutters);
}

- (void)setShowsLevelGutters:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___BKNowPlayingIndicatorView_showsLevelGutters) = a3;
  [(BKNowPlayingIndicatorView *)self setNeedsDisplay];
}

- (UIColor)levelGuttersColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR___BKNowPlayingIndicatorView_levelGuttersColor));
}

- (void)setLevelGuttersColor:(id)a3
{
  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___BKNowPlayingIndicatorView_levelGuttersColor);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___BKNowPlayingIndicatorView_levelGuttersColor) = (Class)a3;
  id v7 = a3;
  v5 = self;

  char v6 = *((unsigned char *)&v5->super.super.super.isa + OBJC_IVAR___BKNowPlayingIndicatorView_needsLevelUpdate);
  *((unsigned char *)&v5->super.super.super.isa + OBJC_IVAR___BKNowPlayingIndicatorView_needsLevelUpdate) = 1;
  if ((v6 & 1) == 0) {
    [(BKNowPlayingIndicatorView *)v5 setNeedsDisplay];
  }
}

- (UIColor)levelColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR___BKNowPlayingIndicatorView_levelColor));
}

- (void)setLevelColor:(id)a3
{
  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___BKNowPlayingIndicatorView_levelColor);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___BKNowPlayingIndicatorView_levelColor) = (Class)a3;
  id v7 = a3;
  v5 = self;

  char v6 = *((unsigned char *)&v5->super.super.super.isa + OBJC_IVAR___BKNowPlayingIndicatorView_needsLevelUpdate);
  *((unsigned char *)&v5->super.super.super.isa + OBJC_IVAR___BKNowPlayingIndicatorView_needsLevelUpdate) = 1;
  if ((v6 & 1) == 0) {
    [(BKNowPlayingIndicatorView *)v5 setNeedsDisplay];
  }
}

- (BKNowPlayingIndicatorView)initWithFrame:(CGRect)a3
{
  return (BKNowPlayingIndicatorView *)sub_1003D6EDC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (BKNowPlayingIndicatorView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1003D83DC();
}

- (void)layoutSubviews
{
  v2 = self;
  NowPlayingIndicatorView.layoutSubviews()();
}

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v7 = self;
  NowPlayingIndicatorView.draw(_:)(x, y, width, height);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _s5Books23NowPlayingIndicatorViewC12sizeThatFitsySo6CGSizeVAFF_0();
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for NowPlayingIndicatorView();
  id v2 = v3.receiver;
  [(BKNowPlayingIndicatorView *)&v3 tintColorDidChange];
  if (*((unsigned char *)v2 + OBJC_IVAR___BKNowPlayingIndicatorView_showsLevelGutters) == 1) {
    [v2 setNeedsDisplay];
  }
  sub_1003D7790();
}

- (BOOL)isHidden
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for NowPlayingIndicatorView();
  return [(BKNowPlayingIndicatorView *)&v3 isHidden];
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (objc_class *)type metadata accessor for NowPlayingIndicatorView();
  v9.receiver = self;
  v9.super_class = v5;
  char v6 = self;
  unsigned int v7 = [(BKNowPlayingIndicatorView *)&v9 isHidden];
  v8.receiver = v6;
  v8.super_class = v5;
  [(BKNowPlayingIndicatorView *)&v8 setHidden:v3];
  if (![(BKNowPlayingIndicatorView *)v6 isHidden] && v7) {
    sub_1003D7C80();
  }
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___BKNowPlayingIndicatorView_levelColor);
}

@end