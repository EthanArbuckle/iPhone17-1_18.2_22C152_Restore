@interface _UIDefaultSwipeViewManipulator
- (CGRect)restingFrameForSwipedView:(id)a3 atIndexPath:(id)a4;
- (double)swipedViewRestingOffset;
- (void)moveSwipedView:(id)a3 atIndexPath:(id)a4 withSwipeInfo:(id *)a5 animator:(id)a6;
- (void)removeAnimationsFromSwipedView:(id)a3 atIndexPath:(id)a4;
- (void)setSwipedViewRestingOffset:(double)a3;
@end

@implementation _UIDefaultSwipeViewManipulator

- (CGRect)restingFrameForSwipedView:(id)a3 atIndexPath:(id)a4
{
  [a3 frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(_UIDefaultSwipeViewManipulator *)self swipedViewRestingOffset];
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)removeAnimationsFromSwipedView:(id)a3 atIndexPath:(id)a4
{
  id v7 = [a3 layer];
  v4 = [v7 presentationLayer];
  if (v4)
  {
    double v5 = [v7 animationKeys];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      [v4 position];
      objc_msgSend(v7, "setPosition:");
      [v7 removeAllAnimations];
    }
  }
}

- (void)moveSwipedView:(id)a3 atIndexPath:(id)a4 withSwipeInfo:(id *)a5 animator:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  [(_UIDefaultSwipeViewManipulator *)self restingFrameForSwipedView:v10 atIndexPath:a4];
  CGFloat x = v22.origin.x;
  CGFloat y = v22.origin.y;
  CGFloat width = v22.size.width;
  CGFloat height = v22.size.height;
  double v16 = CGRectGetMidX(v22) + a5->var3;
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v23);
  if (v11)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __84___UIDefaultSwipeViewManipulator_moveSwipedView_atIndexPath_withSwipeInfo_animator___block_invoke;
    v18[3] = &unk_1E52DD178;
    id v19 = v10;
    double v20 = v16;
    double v21 = MidY;
    [v11 addAnimations:v18];
  }
  else
  {
    objc_msgSend(v10, "setCenter:", v16, MidY);
  }
}

- (double)swipedViewRestingOffset
{
  return self->_swipedViewRestingOffset;
}

- (void)setSwipedViewRestingOffset:(double)a3
{
  self->_swipedViewRestingOffset = a3;
}

@end