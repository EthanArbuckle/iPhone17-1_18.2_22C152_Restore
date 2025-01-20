@interface CRLiOSFreehandDrawingItemsSearchTarget
- (CRLInteractiveCanvasController)icc;
- (CRLiOSFreehandDrawingItemsSearchTarget)initWithDrawing:(id)a3 interactiveCanvasController:(id)a4;
- (NSArray)childSearchTargets;
- (PKDrawing)drawingCopy;
- (void)layoutSearchForString:(id)a3 options:(unint64_t)a4 hitBlock:(id)a5 completionBlock:(id)a6;
- (void)setDrawingCopy:(id)a3;
- (void)setIcc:(id)a3;
@end

@implementation CRLiOSFreehandDrawingItemsSearchTarget

- (CRLiOSFreehandDrawingItemsSearchTarget)initWithDrawing:(id)a3 interactiveCanvasController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRLiOSFreehandDrawingItemsSearchTarget;
  v8 = [(CRLiOSFreehandDrawingItemsSearchTarget *)&v12 init];
  if (v8)
  {
    v9 = (PKDrawing *)[v6 copy];
    drawingCopy = v8->_drawingCopy;
    v8->_drawingCopy = v9;

    objc_storeWeak((id *)&v8->_icc, v7);
  }

  return v8;
}

- (void)layoutSearchForString:(id)a3 options:(unint64_t)a4 hitBlock:(id)a5 completionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v13 = v12;
  if (v10)
  {
    v14 = dispatch_get_global_queue(33, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100409AC8;
    block[3] = &unk_1014F8180;
    block[4] = self;
    unint64_t v19 = a4;
    id v16 = v10;
    id v17 = v11;
    id v18 = v13;
    dispatch_async(v14, block);
  }
  else if (v12)
  {
    (*((void (**)(id))v12 + 2))(v12);
  }
}

- (NSArray)childSearchTargets
{
  return (NSArray *)&__NSArray0__struct;
}

- (PKDrawing)drawingCopy
{
  return self->_drawingCopy;
}

- (void)setDrawingCopy:(id)a3
{
}

- (CRLInteractiveCanvasController)icc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);

  return (CRLInteractiveCanvasController *)WeakRetained;
}

- (void)setIcc:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_icc);

  objc_storeStrong((id *)&self->_drawingCopy, 0);
}

@end