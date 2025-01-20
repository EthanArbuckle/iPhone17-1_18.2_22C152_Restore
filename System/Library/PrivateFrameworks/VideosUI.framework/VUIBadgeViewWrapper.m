@interface VUIBadgeViewWrapper
- (CGRect)badgeFrame;
- (CGSize)badgeSize;
- (IKViewElement)badgeElement;
- (NSString)badgeType;
- (UIView)badgeView;
- (void)setBadgeElement:(id)a3;
- (void)setBadgeFrame:(CGRect)a3;
- (void)setBadgeSize:(CGSize)a3;
- (void)setBadgeType:(id)a3;
- (void)setBadgeView:(id)a3;
@end

@implementation VUIBadgeViewWrapper

- (UIView)badgeView
{
  return self->_badgeView;
}

- (void)setBadgeView:(id)a3
{
}

- (IKViewElement)badgeElement
{
  return self->_badgeElement;
}

- (void)setBadgeElement:(id)a3
{
}

- (CGSize)badgeSize
{
  double width = self->_badgeSize.width;
  double height = self->_badgeSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setBadgeSize:(CGSize)a3
{
  self->_badgeSize = a3;
}

- (CGRect)badgeFrame
{
  double x = self->_badgeFrame.origin.x;
  double y = self->_badgeFrame.origin.y;
  double width = self->_badgeFrame.size.width;
  double height = self->_badgeFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBadgeFrame:(CGRect)a3
{
  self->_badgeFrame = a3;
}

- (NSString)badgeType
{
  return self->_badgeType;
}

- (void)setBadgeType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeType, 0);
  objc_storeStrong((id *)&self->_badgeElement, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
}

@end