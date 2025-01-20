@interface NCAudioPlayerTimelineSlider
- (NCAudioPlayerTimelineSlider)init;
- (NCAudioPlayerTimelineSlider)initWithFrame:(CGRect)a3;
- (id)timeLabelFontForStyle:(int64_t)a3;
- (id)timeLabelTextColorForStyle:(int64_t)a3;
@end

@implementation NCAudioPlayerTimelineSlider

- (NCAudioPlayerTimelineSlider)init
{
  return -[NCAudioPlayerTimelineSlider initWithFrame:](self, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
}

- (NCAudioPlayerTimelineSlider)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NCAudioPlayerTimelineSlider;
  return -[NCAudioPlayerTimelineSlider initWithFrame:style:](&v4, "initWithFrame:style:", 5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (id)timeLabelFontForStyle:(int64_t)a3
{
  return +[UIFont preferredFontForTextStyle:UIFontTextStyleCaption1];
}

- (id)timeLabelTextColorForStyle:(int64_t)a3
{
  return +[UIColor secondaryLabelColor];
}

@end