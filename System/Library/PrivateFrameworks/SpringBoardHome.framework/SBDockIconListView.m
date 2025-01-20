@interface SBDockIconListView
+ (CGRect)defaultFrameForOrientation:(int64_t)a3;
+ (double)defaultHeight;
+ (unint64_t)defaultIconViewConfigurationOptions;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (BOOL)adaptsOrientationToTraitCollection;
- (BOOL)allowsAddingIconCount:(unint64_t)a3;
- (BOOL)isVertical;
- (SBDockIconListView)initWithModel:(id)a3 layoutProvider:(id)a4 iconLocation:(id)a5 orientation:(int64_t)a6 iconViewProvider:(id)a7;
@end

@implementation SBDockIconListView

- (BOOL)adaptsOrientationToTraitCollection
{
  return 0;
}

+ (double)defaultHeight
{
  return 92.0;
}

+ (unint64_t)defaultIconViewConfigurationOptions
{
  return 2;
}

+ (CGRect)defaultFrameForOrientation:(int64_t)a3
{
  SBHScreenBounds(a3);
  CGFloat Width = CGRectGetWidth(v9);
  [(id)objc_opt_class() defaultHeight];
  double v5 = v4;
  double v6 = 0.0;
  double v7 = 0.0;
  double v8 = Width;
  result.size.height = v5;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (SBDockIconListView)initWithModel:(id)a3 layoutProvider:(id)a4 iconLocation:(id)a5 orientation:(int64_t)a6 iconViewProvider:(id)a7
{
  v10.receiver = self;
  v10.super_class = (Class)SBDockIconListView;
  double v7 = [(SBIconListView *)&v10 initWithModel:a3 layoutProvider:a4 iconLocation:a5 orientation:a6 iconViewProvider:a7];
  double v8 = v7;
  if (v7) {
    [(SBDockIconListView *)v7 setAutoresizesSubviews:0];
  }
  return v8;
}

- (BOOL)allowsAddingIconCount:(unint64_t)a3
{
  double v4 = [(SBIconListView *)self displayedModel];
  LOBYTE(a3) = [v4 allowsAddingIconCount:a3];

  return a3;
}

- (BOOL)isVertical
{
  return [(SBIconListView *)self iconRowsForCurrentOrientation] > 1;
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SBDockIconListView;
  if ([(SBDockIconListView *)&v7 _shouldAnimatePropertyWithKey:v4]) {
    char v5 = 1;
  }
  else {
    char v5 = [v4 isEqualToString:@"contents"];
  }

  return v5;
}

@end