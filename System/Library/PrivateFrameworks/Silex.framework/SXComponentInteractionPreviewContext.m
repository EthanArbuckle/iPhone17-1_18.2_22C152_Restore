@interface SXComponentInteractionPreviewContext
- (CGRect)sourceRect;
- (SXComponentInteractionPreviewContext)initWithViewController:(id)a3 sourceRect:(CGRect)a4;
- (UIViewController)viewController;
@end

@implementation SXComponentInteractionPreviewContext

- (SXComponentInteractionPreviewContext)initWithViewController:(id)a3 sourceRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SXComponentInteractionPreviewContext;
  v11 = [(SXComponentInteractionPreviewContext *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_viewController, a3);
    v12->_sourceRect.origin.CGFloat x = x;
    v12->_sourceRect.origin.CGFloat y = y;
    v12->_sourceRect.size.CGFloat width = width;
    v12->_sourceRect.size.CGFloat height = height;
  }

  return v12;
}

- (UIViewController)viewController
{
  return self->_viewController;
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

- (void).cxx_destruct
{
}

@end