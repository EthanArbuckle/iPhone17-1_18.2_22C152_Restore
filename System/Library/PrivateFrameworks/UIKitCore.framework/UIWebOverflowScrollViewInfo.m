@interface UIWebOverflowScrollViewInfo
- (UIView)oldSuperview;
- (UIWebOverflowScrollView)scrollView;
- (UIWebOverflowScrollViewInfo)initWithScrollView:(id)a3;
- (void)dealloc;
- (void)setOldSuperview:(id)a3;
- (void)setScrollView:(id)a3;
@end

@implementation UIWebOverflowScrollViewInfo

- (UIWebOverflowScrollViewInfo)initWithScrollView:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UIWebOverflowScrollViewInfo;
  v4 = [(UIWebOverflowScrollViewInfo *)&v7 init];
  if (v4)
  {
    v5 = (UIWebOverflowScrollView *)a3;
    v4->_scrollView = v5;
    v4->_scrollViewLayer = [(UIView *)v5 layer];
    v4->_oldSuperview = (UIView *)(id)[a3 superview];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)UIWebOverflowScrollViewInfo;
  [(UIWebOverflowScrollViewInfo *)&v3 dealloc];
}

- (UIWebOverflowScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (UIView)oldSuperview
{
  return self->_oldSuperview;
}

- (void)setOldSuperview:(id)a3
{
}

@end