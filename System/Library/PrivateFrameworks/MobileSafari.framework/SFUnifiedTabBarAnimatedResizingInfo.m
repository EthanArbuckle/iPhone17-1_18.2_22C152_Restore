@interface SFUnifiedTabBarAnimatedResizingInfo
- (CGPoint)targetContentOffset;
- (NSSet)itemsToKeepVisible;
- (SFUnifiedTabBarAnimatedResizingInfo)initWithItemsToKeepVisible:(id)a3 targetContentOffset:(CGPoint)a4;
@end

@implementation SFUnifiedTabBarAnimatedResizingInfo

- (SFUnifiedTabBarAnimatedResizingInfo)initWithItemsToKeepVisible:(id)a3 targetContentOffset:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SFUnifiedTabBarAnimatedResizingInfo;
  v9 = [(SFUnifiedTabBarAnimatedResizingInfo *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_itemsToKeepVisible, a3);
    v10->_targetContentOffset.CGFloat x = x;
    v10->_targetContentOffset.CGFloat y = y;
    v11 = v10;
  }

  return v10;
}

- (NSSet)itemsToKeepVisible
{
  return self->_itemsToKeepVisible;
}

- (CGPoint)targetContentOffset
{
  double x = self->_targetContentOffset.x;
  double y = self->_targetContentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void).cxx_destruct
{
}

@end