@interface _UIInertPreviewingContext
- (CGRect)preferredSourceViewRectInCoordinateSpace:(id)a3;
- (CGRect)sourceRect;
- (UIGestureRecognizer)previewingGestureRecognizerForFailureRelationship;
- (UIView)customViewForInteractiveHighlight;
- (UIView)sourceView;
- (UIViewControllerPreviewingDelegate)delegate;
- (_UIInertPreviewingContext)initWithSourceView:(id)a3;
- (void)setCustomViewForInteractiveHighlight:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSourceRect:(CGRect)a3;
- (void)setSourceView:(id)a3;
@end

@implementation _UIInertPreviewingContext

- (_UIInertPreviewingContext)initWithSourceView:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_UIInertPreviewingContext;
  v6 = [(_UIInertPreviewingContext *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sourceView, a3);
    CGSize v8 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    v7->_sourceRect.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    v7->_sourceRect.size = v8;
    v9 = objc_alloc_init(UIGestureRecognizer);
    failureRelationshipGestureRecognizer = v7->_failureRelationshipGestureRecognizer;
    v7->_failureRelationshipGestureRecognizer = v9;

    v11 = v7;
  }

  return v7;
}

- (UIGestureRecognizer)previewingGestureRecognizerForFailureRelationship
{
  return self->_failureRelationshipGestureRecognizer;
}

- (CGRect)preferredSourceViewRectInCoordinateSpace:(id)a3
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

- (UIViewControllerPreviewingDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UIViewControllerPreviewingDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
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

- (void)setSourceRect:(CGRect)a3
{
  self->_sourceRect = a3;
}

- (UIView)customViewForInteractiveHighlight
{
  return self->_customViewForInteractiveHighlight;
}

- (void)setCustomViewForInteractiveHighlight:(id)a3
{
}

- (UIView)sourceView
{
  return self->_sourceView;
}

- (void)setSourceView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceView, 0);
  objc_storeStrong((id *)&self->_customViewForInteractiveHighlight, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_failureRelationshipGestureRecognizer, 0);
}

@end