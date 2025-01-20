@interface UITextSelectionGrabberSuppressionAssertion
- (BOOL)invalidated;
- (UITextSelectionGrabberSuppressionAssertion)initWithSelectionView:(id)a3;
- (UITextSelectionView)selectionView;
- (void)_invalidate;
- (void)dealloc;
- (void)setInvalidated:(BOOL)a3;
- (void)setSelectionView:(id)a3;
@end

@implementation UITextSelectionGrabberSuppressionAssertion

- (UITextSelectionGrabberSuppressionAssertion)initWithSelectionView:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UITextSelectionGrabberSuppressionAssertion;
  v5 = [(UITextSelectionGrabberSuppressionAssertion *)&v8 init];
  v6 = v5;
  if (v5) {
    [(UITextSelectionGrabberSuppressionAssertion *)v5 setSelectionView:v4];
  }

  return v6;
}

- (void)dealloc
{
  if (![(UITextSelectionGrabberSuppressionAssertion *)self invalidated])
  {
    v3 = [(UITextSelectionGrabberSuppressionAssertion *)self selectionView];
    [v3 releaseGrabberHandleSuppressionAssertion:self];
  }
  v4.receiver = self;
  v4.super_class = (Class)UITextSelectionGrabberSuppressionAssertion;
  [(UITextSelectionGrabberSuppressionAssertion *)&v4 dealloc];
}

- (void)_invalidate
{
  [(UITextSelectionGrabberSuppressionAssertion *)self setInvalidated:1];
  id v3 = [(UITextSelectionGrabberSuppressionAssertion *)self selectionView];
  [v3 releaseGrabberHandleSuppressionAssertion:self];
}

- (UITextSelectionView)selectionView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionView);
  return (UITextSelectionView *)WeakRetained;
}

- (void)setSelectionView:(id)a3
{
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (void).cxx_destruct
{
}

@end