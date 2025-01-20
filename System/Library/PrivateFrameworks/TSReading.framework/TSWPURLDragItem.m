@interface TSWPURLDragItem
- (CGPoint)canvasDragPoint;
- (TSWPURLDragItem)initWithDragPreview:(id)a3 canvasRect:(CGRect)a4 canvasDragPoint:(CGPoint)a5 range:(_NSRange)a6;
- (_NSRange)range;
- (id)retargetedDragPreviewForDefaultTargetedDragPreview:(id)a3 icc:(id)a4 canvasView:(id)a5 boundsRect:(CGRect)a6;
@end

@implementation TSWPURLDragItem

- (TSWPURLDragItem)initWithDragPreview:(id)a3 canvasRect:(CGRect)a4 canvasDragPoint:(CGPoint)a5 range:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  CGFloat y = a5.y;
  CGFloat x = a5.x;
  v11.receiver = self;
  v11.super_class = (Class)TSWPURLDragItem;
  result = -[TSWPDragItem initWithDragPreview:canvasRect:](&v11, sel_initWithDragPreview_canvasRect_, a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  if (result)
  {
    result->_canvasDragPoint.CGFloat x = x;
    result->_canvasDragPoint.CGFloat y = y;
    result->_range.NSUInteger location = location;
    result->_range.NSUInteger length = length;
  }
  return result;
}

- (id)retargetedDragPreviewForDefaultTargetedDragPreview:(id)a3 icc:(id)a4 canvasView:(id)a5 boundsRect:(CGRect)a6
{
  objc_opt_class();
  [(TSWPURLDragItem *)self canvasDragPoint];
  objc_msgSend(a4, "hitRep:");
  id result = (id)TSUDynamicCast();
  if (result)
  {
    id v9 = result;
    uint64_t v10 = [(TSWPURLDragItem *)self range];
    v12 = +[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", v10, v11);
    uint64_t v13 = [MEMORY[0x263EFFA08] setWithObject:v9];
    return +[TSWPEditingController _targetedDragPreviewForSelection:v12 interactiveCanvasController:a4 reps:v13 applyScale:1 imageFrameUnion:0];
  }
  return result;
}

- (CGPoint)canvasDragPoint
{
  double x = self->_canvasDragPoint.x;
  double y = self->_canvasDragPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (_NSRange)range
{
  p_range = &self->_range;
  NSUInteger location = self->_range.location;
  NSUInteger length = p_range->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

@end