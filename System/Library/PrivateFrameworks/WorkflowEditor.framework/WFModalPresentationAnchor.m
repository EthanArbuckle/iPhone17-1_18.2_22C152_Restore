@interface WFModalPresentationAnchor
- (CGRect)sourceRect;
- (UIView)sourceView;
- (UIViewController)sourceViewController;
- (WFModalPresentationAnchor)initWithSourceViewController:(id)a3 sourceView:(id)a4 sourceRect:(CGRect)a5;
@end

@implementation WFModalPresentationAnchor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceView, 0);
  objc_storeStrong((id *)&self->_sourceViewController, 0);
}

- (CGRect)sourceRect
{
  double x = self->_sourceRect.origin.x;
  double y = self->_sourceRect.origin.y;
  double width = self->_sourceRect.size.width;
  double height = self->_sourceRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (UIView)sourceView
{
  return self->_sourceView;
}

- (UIViewController)sourceViewController
{
  return self->_sourceViewController;
}

- (WFModalPresentationAnchor)initWithSourceViewController:(id)a3 sourceView:(id)a4 sourceRect:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v12 = a3;
  id v13 = a4;
  v18.receiver = self;
  v18.super_class = (Class)WFModalPresentationAnchor;
  v14 = [(WFModalPresentationAnchor *)&v18 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_sourceViewController, a3);
    objc_storeStrong((id *)&v15->_sourceView, a4);
    v15->_sourceRect.origin.CGFloat x = x;
    v15->_sourceRect.origin.CGFloat y = y;
    v15->_sourceRect.size.CGFloat width = width;
    v15->_sourceRect.size.CGFloat height = height;
    v16 = v15;
  }

  return v15;
}

@end