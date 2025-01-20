@interface CRLFreehandDrawingRepDetectionItem
- (CGAffineTransform)drawingFullTransformInRoot;
- (CRLFreehandDrawingRepDetectionItem)initWithDrawingDetectionItem:(id)a3 andDrawingFullTransformInRoot:(CGAffineTransform *)a4;
- (_PKDrawingDetectionItem)drawingDetectionItem;
@end

@implementation CRLFreehandDrawingRepDetectionItem

- (CRLFreehandDrawingRepDetectionItem)initWithDrawingDetectionItem:(id)a3 andDrawingFullTransformInRoot:(CGAffineTransform *)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CRLFreehandDrawingRepDetectionItem;
  v8 = [(CRLFreehandDrawingRepDetectionItem *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_drawingDetectionItem, a3);
    long long v10 = *(_OWORD *)&a4->a;
    long long v11 = *(_OWORD *)&a4->tx;
    *(_OWORD *)&v9->_drawingFullTransformInRoot.c = *(_OWORD *)&a4->c;
    *(_OWORD *)&v9->_drawingFullTransformInRoot.tx = v11;
    *(_OWORD *)&v9->_drawingFullTransformInRoot.a = v10;
  }

  return v9;
}

- (_PKDrawingDetectionItem)drawingDetectionItem
{
  return self->_drawingDetectionItem;
}

- (CGAffineTransform)drawingFullTransformInRoot
{
  long long v3 = *(_OWORD *)&self->tx;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self->c;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[1].a;
  return self;
}

- (void).cxx_destruct
{
}

@end