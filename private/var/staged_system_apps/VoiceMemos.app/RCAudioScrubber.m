@interface RCAudioScrubber
- (RCAudioScrubber)init;
- (double)position;
- (id)timeLabelFontForStyle:(int64_t)a3;
- (id)timeLabelTextColorForStyle:(int64_t)a3;
@end

@implementation RCAudioScrubber

- (double)position
{
  [(RCAudioScrubber *)self value];
  double v4 = v3;
  [(RCMPDetailSlider *)self availableDuration];
  return v5 * v4;
}

- (RCAudioScrubber)init
{
  v2 = -[RCMPDetailSlider initWithFrame:style:](self, "initWithFrame:style:", 5, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  float v3 = v2;
  if (v2) {
    [(RCMPDetailSlider *)v2 setMinTimeLabelWidth:0.0];
  }
  return v3;
}

- (id)timeLabelFontForStyle:(int64_t)a3
{
  return +[UIFont preferredFontForTextStyle:UIFontTextStyleCaption1];
}

- (id)timeLabelTextColorForStyle:(int64_t)a3
{
  return +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", a3, 0.6, 1.0);
}

@end