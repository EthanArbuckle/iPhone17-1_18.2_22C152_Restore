@interface EDPane
+ (id)pane;
- (EDPane)init;
- (double)xSplitPosition;
- (double)ySplitPosition;
- (id)description;
- (id)topLeftCell;
- (int)activePane;
- (int)paneState;
- (void)setActivePane:(int)a3;
- (void)setPaneState:(int)a3;
- (void)setTopLeftCell:(id)a3;
- (void)setXSplitPosition:(double)a3;
- (void)setYSplitPosition:(double)a3;
@end

@implementation EDPane

+ (id)pane
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

- (EDPane)init
{
  v3.receiver = self;
  v3.super_class = (Class)EDPane;
  result = [(EDPane *)&v3 init];
  if (result)
  {
    result->mActivePane = 0;
    result->mXSplitPosition = 0.0;
    result->mYSplitPosition = 0.0;
  }
  return result;
}

- (void)setActivePane:(int)a3
{
  self->mActivePane = a3;
}

- (void)setXSplitPosition:(double)a3
{
  self->mXSplitPosition = a3;
}

- (void)setYSplitPosition:(double)a3
{
  self->mYSplitPosition = a3;
}

- (void)setTopLeftCell:(id)a3
{
  v5 = (EDReference *)a3;
  mTopLeftCell = self->mTopLeftCell;
  p_mTopLeftCell = &self->mTopLeftCell;
  if (mTopLeftCell != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mTopLeftCell, a3);
    v5 = v8;
  }
}

- (double)xSplitPosition
{
  return self->mXSplitPosition;
}

- (double)ySplitPosition
{
  return self->mYSplitPosition;
}

- (id)topLeftCell
{
  return self->mTopLeftCell;
}

- (int)activePane
{
  return self->mActivePane;
}

- (int)paneState
{
  return self->mPaneState;
}

- (void)setPaneState:(int)a3
{
  self->mPaneState = a3;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)EDPane;
  id v2 = [(EDPane *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
}

@end