@interface MTInlineNowPlayingIndicatorView
+ (double)maximumLevelHeightDefault;
+ (double)maximumLevelHeightMax;
+ (double)maximumLevelHeightMin;
- (BOOL)playing;
- (CGSize)sizeThatFitsBarHeight:(double)a3;
- (MTInlineNowPlayingIndicatorView)initWithFrame:(CGRect)a3;
- (NSString)accessibilityIdentifier;
- (void)adjustBarHeightToSize;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
@end

@implementation MTInlineNowPlayingIndicatorView

+ (double)maximumLevelHeightDefault
{
  return 13.0;
}

+ (double)maximumLevelHeightMin
{
  return 7.0;
}

+ (double)maximumLevelHeightMax
{
  return 26.0;
}

- (MTInlineNowPlayingIndicatorView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MTInlineNowPlayingIndicatorView;
  v3 = -[MTInlineNowPlayingIndicatorView initWithFrame:](&v9, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MTInlineNowPlayingIndicatorView *)v3 setBounceStyle:1];
    [(MTInlineNowPlayingIndicatorView *)v4 setNumberOfLevels:4];
    v5 = +[UIScreen mainScreen];
    [v5 scale];
    double v7 = v6;

    [(MTInlineNowPlayingIndicatorView *)v4 setLevelCornerRadius:1.0 / v7];
    [(id)objc_opt_class() maximumLevelHeightDefault];
    -[MTInlineNowPlayingIndicatorView setMaximumLevelHeight:](v4, "setMaximumLevelHeight:");
  }
  return v4;
}

- (BOOL)playing
{
  return [(MTInlineNowPlayingIndicatorView *)self playbackState] == (id)1;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(MTInlineNowPlayingIndicatorView *)self frame];
  v14.origin.double x = v8;
  v14.origin.double y = v9;
  v14.size.double width = v10;
  v14.size.double height = v11;
  v13.origin.double x = x;
  v13.origin.double y = y;
  v13.size.double width = width;
  v13.size.double height = height;
  if (!CGRectEqualToRect(v13, v14))
  {
    v12.receiver = self;
    v12.super_class = (Class)MTInlineNowPlayingIndicatorView;
    -[MTInlineNowPlayingIndicatorView setFrame:](&v12, "setFrame:", x, y, width, height);
    [(MTInlineNowPlayingIndicatorView *)self adjustBarHeightToSize];
  }
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(MTInlineNowPlayingIndicatorView *)self bounds];
  v14.origin.double x = v8;
  v14.origin.double y = v9;
  v14.size.double width = v10;
  v14.size.double height = v11;
  v13.origin.double x = x;
  v13.origin.double y = y;
  v13.size.double width = width;
  v13.size.double height = height;
  if (!CGRectEqualToRect(v13, v14))
  {
    v12.receiver = self;
    v12.super_class = (Class)MTInlineNowPlayingIndicatorView;
    -[MTInlineNowPlayingIndicatorView setBounds:](&v12, "setBounds:", x, y, width, height);
    [(MTInlineNowPlayingIndicatorView *)self adjustBarHeightToSize];
  }
}

- (CGSize)sizeThatFitsBarHeight:(double)a3
{
  [(id)objc_opt_class() maximumLevelHeightMax];
  if (v5 <= a3) {
    a3 = v5;
  }
  [(id)objc_opt_class() maximumLevelHeightMin];
  if (a3 < v6) {
    a3 = v6;
  }
  [(MTInlineNowPlayingIndicatorView *)self frame];
  -[MTInlineNowPlayingIndicatorView sizeThatFits:](self, "sizeThatFits:", v7, a3);
  double v9 = a3;
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (void)adjustBarHeightToSize
{
  [(MTInlineNowPlayingIndicatorView *)self frame];

  [(MTInlineNowPlayingIndicatorView *)self setMaximumLevelHeight:v3];
}

- (NSString)accessibilityIdentifier
{
  v2 = self;
  MTInlineNowPlayingIndicatorView.accessibilityIdentifier.getter();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }

  return (NSString *)v5;
}

@end