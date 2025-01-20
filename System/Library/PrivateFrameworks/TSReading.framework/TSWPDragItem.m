@interface TSWPDragItem
- (CGRect)canvasRect;
- (TSWPDragItem)initWithDragPreview:(id)a3 canvasRect:(CGRect)a4;
- (UITargetedDragPreview)targetedDragPreview;
- (id)retargetedDragPreviewForDefaultTargetedDragPreview:(id)a3 icc:(id)a4 canvasView:(id)a5 boundsRect:(CGRect)a6;
- (void)dealloc;
@end

@implementation TSWPDragItem

- (TSWPDragItem)initWithDragPreview:(id)a3 canvasRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)TSWPDragItem;
  v9 = [(TSWPDragItem *)&v11 init];
  if (v9)
  {
    v9->_targetedDragPreview = (UITargetedDragPreview *)a3;
    v9->_canvasRect.origin.CGFloat x = x;
    v9->_canvasRect.origin.CGFloat y = y;
    v9->_canvasRect.size.CGFloat width = width;
    v9->_canvasRect.size.CGFloat height = height;
  }
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSWPDragItem;
  [(TSWPDragItem *)&v3 dealloc];
}

- (id)retargetedDragPreviewForDefaultTargetedDragPreview:(id)a3 icc:(id)a4 canvasView:(id)a5 boundsRect:(CGRect)a6
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  memset(&v22, 0, sizeof(v22));
  [a4 viewScale];
  CGFloat v14 = v13;
  [a4 viewScale];
  CGAffineTransformMakeScale(&v22, v14, v15);
  id v16 = objc_alloc(MEMORY[0x263F1C5F0]);
  double v17 = TSDCenterOfRect(x, y, width, height);
  CGAffineTransform v21 = v22;
  v18 = (void *)[v16 initWithContainer:a5 center:&v21 transform:v17];
  v19 = (void *)[a3 retargetedPreviewWithTarget:v18];

  return v19;
}

- (UITargetedDragPreview)targetedDragPreview
{
  return self->_targetedDragPreview;
}

- (CGRect)canvasRect
{
  double x = self->_canvasRect.origin.x;
  double y = self->_canvasRect.origin.y;
  double width = self->_canvasRect.size.width;
  double height = self->_canvasRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

@end