@interface _UIRefreshControlContentView
- (NSAttributedString)attributedTitle;
- (UIColor)tintColor;
- (UIImpactFeedbackGenerator)impactFeedbackGenerator;
- (UIRefreshControl)refreshControl;
- (double)_heightAtWhichNoneOfTheInterfaceElementsAreVisibleEvenIfTheControlIsStillPartiallyOnScreen;
- (double)maximumSnappingHeight;
- (double)minimumSnappingHeight;
- (int64_t)style;
- (void)setImpactFeedbackGenerator:(id)a3;
- (void)setRefreshControl:(id)a3;
- (void)setTintColor:(id)a3;
- (void)willTransitionFromState:(int64_t)a3 toState:(int64_t)a4;
@end

@implementation _UIRefreshControlContentView

- (void)willTransitionFromState:(int64_t)a3 toState:(int64_t)a4
{
  if (a3 != a4)
  {
    id v5 = [(UIView *)self layer];
    [v5 removeAllAnimations];
  }
}

- (UIRefreshControl)refreshControl
{
  return self->_refreshControl;
}

- (double)minimumSnappingHeight
{
  return 0.0;
}

- (void)setTintColor:(id)a3
{
}

- (void)setRefreshControl:(id)a3
{
  self->_refreshControl = (UIRefreshControl *)a3;
}

- (void)setImpactFeedbackGenerator:(id)a3
{
}

- (UIImpactFeedbackGenerator)impactFeedbackGenerator
{
  return self->_impactFeedbackGenerator;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (NSAttributedString)attributedTitle
{
  return 0;
}

- (int64_t)style
{
  return 1;
}

- (double)maximumSnappingHeight
{
  return 0.0;
}

- (double)_heightAtWhichNoneOfTheInterfaceElementsAreVisibleEvenIfTheControlIsStillPartiallyOnScreen
{
  return 0.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impactFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
}

@end