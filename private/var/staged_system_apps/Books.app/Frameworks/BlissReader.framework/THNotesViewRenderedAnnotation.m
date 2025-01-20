@interface THNotesViewRenderedAnnotation
- (CALayer)editingHighlightLayer;
- (CALayer)highlightLayer;
- (CGRect)highlightTextFrame;
- (void)dealloc;
- (void)setEditingHighlightLayer:(id)a3;
- (void)setHighlightLayer:(id)a3;
- (void)setHighlightTextFrame:(CGRect)a3;
@end

@implementation THNotesViewRenderedAnnotation

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THNotesViewRenderedAnnotation;
  [(THNotesViewRenderedAnnotation *)&v3 dealloc];
}

- (CALayer)highlightLayer
{
  return self->mHighlightLayer;
}

- (void)setHighlightLayer:(id)a3
{
}

- (CALayer)editingHighlightLayer
{
  return self->mEditingHighlightLayer;
}

- (void)setEditingHighlightLayer:(id)a3
{
}

- (CGRect)highlightTextFrame
{
  double x = self->mHighlightTextFrame.origin.x;
  double y = self->mHighlightTextFrame.origin.y;
  double width = self->mHighlightTextFrame.size.width;
  double height = self->mHighlightTextFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setHighlightTextFrame:(CGRect)a3
{
  self->mHighlightTextFrame = a3;
}

@end