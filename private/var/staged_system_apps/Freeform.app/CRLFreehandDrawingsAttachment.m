@interface CRLFreehandDrawingsAttachment
- (BOOL)_handleSingleTapAtDrawingLocation:(CGPoint)a3;
- (BOOL)hitByTouchLocation:(CGPoint)a3 bounds:(CGRect)a4;
- (BOOL)isAtEndOfDocument;
- (BOOL)isExternalAttachment;
- (BOOL)isTornDown;
- (CGAffineTransform)drawingTransform;
- (CRLFreehandDrawingsAttachment)initWithDelegate:(id)a3 drawing:(id)a4;
- (PKAttachmentView)attachmentView;
- (PKDrawing)drawing;
- (PKRecognitionController)recognitionController;
- (PKStrokeSpatialCache)strokeSpatialCache;
- (UIView)attachmentContainerView;
- (UIView)tileContainerView;
- (UIView)tileMaskView;
- (UIView)viewRep;
- (double)viewScaleForExternalAttachment;
- (id)_firstStrokesInSelectedStrokes:(id)a3;
- (id)_lastStrokesInSelectedStrokes:(id)a3;
- (id)contentScaledCoordinateSpace;
- (id)contentUnscaledCoordinateSpace;
- (id)contentWindowCoordinateSpace;
- (int64_t)contentTypeForIntersectedStrokes:(id)a3;
- (void)dealloc;
- (void)didSelectPreviouslySelectedStrokes:(id)a3;
- (void)fetchIntersectedStrokesAtPoint:(CGPoint)a3 selectionType:(int64_t)a4 inputType:(int64_t)a5 visibleOnscreenStrokes:(id)a6 completion:(id)a7;
- (void)fetchIntersectedStrokesBetweenTopPoint:(CGPoint)a3 bottomPoint:(CGPoint)a4 liveScrollOffset:(CGPoint)a5 completion:(id)a6;
- (void)installSelectionView:(id)a3;
- (void)setDrawing:(id)a3;
- (void)teardown;
- (void)translationDidFinishedInViewController:(id)a3;
- (void)updateLiveSelectionForStrokesInLayer:(id)a3 inDrawing:(id)a4;
- (void)updateVisibleUnscaledBoundsAfterDrawingChanged;
- (void)visibleOnscreenBoundsDidChange:(CGRect)a3;
@end

@implementation CRLFreehandDrawingsAttachment

- (CRLFreehandDrawingsAttachment)initWithDelegate:(id)a3 drawing:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CRLFreehandDrawingsAttachment;
  v8 = [(CRLFreehandDrawingsAttachment *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v9->_drawing, a4);
    [(CRLFreehandDrawingsAttachment *)v9 updateVisibleUnscaledBoundsAfterDrawingChanged];
  }

  return v9;
}

- (void)teardown
{
  if (self->_isTornDown)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D1098);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101070830();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D10B8);
    }
    v2 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v2);
    }
    v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingsAttachment teardown]");
    v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingsAttachment.m"];
    +[CRLAssertionHandler handleFailureInFunction:v3 file:v4 lineNumber:53 isFatal:0 description:"attempting to call teardown on an instance of CRLFreehandDrawingsAttachment that has already been torn down."];
  }
  else
  {
    self->_isTornDown = 1;
  }
}

- (void)dealloc
{
  if (!self->_isTornDown)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D10D8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010708C4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D10F8);
    }
    v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v3);
    }
    v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingsAttachment dealloc]");
    v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingsAttachment.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:58 isFatal:0 description:"teardown not called for CRLFreehandDrawingsAttachment."];
  }
  v6.receiver = self;
  v6.super_class = (Class)CRLFreehandDrawingsAttachment;
  [(CRLFreehandDrawingsAttachment *)&v6 dealloc];
}

- (void)updateVisibleUnscaledBoundsAfterDrawingChanged
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v27 = [WeakRetained interactiveCanvasController];

  v4 = [v27 canvasView];
  v5 = [v4 unscaledCoordinateSpace];
  [(PKDrawing *)self->_drawing bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  v14 = [v27 canvasView];
  v15 = [v14 window];
  v16 = [v15 coordinateSpace];
  [v5 convertRect:v16 toCoordinateSpace:v7, v9, v11, v13];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;

  v25 = [objc_alloc((Class)UIView) initWithFrame:v18, v20, v22, v24];
  mViewRep = self->mViewRep;
  self->mViewRep = v25;
}

- (BOOL)isAtEndOfDocument
{
  return 0;
}

- (PKStrokeSpatialCache)strokeSpatialCache
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = [WeakRetained smartSelectionControllerForAttachment:self];

  v5 = [v4 strokeSpatialCacheForAttachment:self];

  return (PKStrokeSpatialCache *)v5;
}

- (UIView)viewRep
{
  return self->mViewRep;
}

- (UIView)tileContainerView
{
  return self->mViewRep;
}

- (UIView)attachmentContainerView
{
  return self->mViewRep;
}

- (PKAttachmentView)attachmentView
{
  return 0;
}

- (BOOL)isExternalAttachment
{
  return 1;
}

- (PKRecognitionController)recognitionController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = [WeakRetained smartSelectionControllerForAttachment:self];

  v5 = [v4 recognitionController];

  return (PKRecognitionController *)v5;
}

- (CGAffineTransform)drawingTransform
{
  long long v3 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  return self;
}

- (int64_t)contentTypeForIntersectedStrokes:(id)a3
{
  return 1;
}

- (void)fetchIntersectedStrokesBetweenTopPoint:(CGPoint)a3 bottomPoint:(CGPoint)a4 liveScrollOffset:(CGPoint)a5 completion:(id)a6
{
  double y = a5.y;
  double x = a5.x;
  double v8 = a4.y;
  double v9 = a4.x;
  double v10 = a3.y;
  double v11 = a3.x;
  p_delegate = &self->_delegate;
  id v14 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  id v16 = [WeakRetained smartSelectionControllerForAttachment:self];

  [v16 fetchIntersectedStrokesBetweenTopPoint:v14 bottomPoint:v11 liveScrollOffset:v10 completion:v9];
}

- (void)fetchIntersectedStrokesAtPoint:(CGPoint)a3 selectionType:(int64_t)a4 inputType:(int64_t)a5 visibleOnscreenStrokes:(id)a6 completion:(id)a7
{
  double y = a3.y;
  double x = a3.x;
  p_delegate = &self->_delegate;
  id v14 = a7;
  id v15 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  id v17 = [WeakRetained smartSelectionControllerForAttachment:self];

  [v17 fetchIntersectedStrokesAtPoint:a4 selectionType:a5 inputType:v15 visibleOnscreenStrokes:v14 completion:x, y];
}

- (id)contentWindowCoordinateSpace
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  long long v3 = [WeakRetained interactiveCanvasController];

  v4 = [v3 canvasView];
  v5 = [v4 window];
  double v6 = [v5 coordinateSpace];

  return v6;
}

- (id)contentScaledCoordinateSpace
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  long long v3 = [WeakRetained interactiveCanvasController];

  v4 = [v3 canvasView];

  return v4;
}

- (id)contentUnscaledCoordinateSpace
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  long long v3 = [WeakRetained interactiveCanvasController];

  v4 = [v3 canvasView];
  v5 = [v4 unscaledCoordinateSpace];

  return v5;
}

- (double)viewScaleForExternalAttachment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  long long v3 = [WeakRetained interactiveCanvasController];

  [v3 viewScale];
  double v5 = v4;

  return v5;
}

- (void)installSelectionView:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  double v6 = [(CRLFreehandDrawingsAttachment *)self viewRep];
  [WeakRetained installSelectionView:v5 fromView:v6];
}

- (BOOL)_handleSingleTapAtDrawingLocation:(CGPoint)a3
{
  return 1;
}

- (BOOL)hitByTouchLocation:(CGPoint)a3 bounds:(CGRect)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v7.CGFloat x = x;
  v7.CGFloat y = y;
  return CGRectContainsPoint(a4, v7);
}

- (void)visibleOnscreenBoundsDidChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v9 = [WeakRetained smartSelectionControllerForAttachment:self];

  [v9 invalidateCacheForBounds:self->_drawing inDrawing:x, y, width, height];
}

- (id)_firstStrokesInSelectedStrokes:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  CGPoint v7 = [WeakRetained smartSelectionControllerForAttachment:self];

  double v8 = [v7 firstStrokesInSelectedStrokes:v5 isRTL:sub_1003E86EC()];

  return v8;
}

- (id)_lastStrokesInSelectedStrokes:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  CGPoint v7 = [WeakRetained smartSelectionControllerForAttachment:self];

  double v8 = [v7 lastStrokesInSelectedStrokes:v5 isRTL:sub_1003E86EC()];

  return v8;
}

- (void)updateLiveSelectionForStrokesInLayer:(id)a3 inDrawing:(id)a4
{
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  sub_1002469D0(v6, WeakRetained);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  double v8 = [v9 selectionDecorator];
  [v8 setDecoratorLayer:v5];
}

- (void)translationDidFinishedInViewController:(id)a3
{
  p_delegate = &self->_delegate;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained installTranslationViewController:v4];
}

- (void)didSelectPreviouslySelectedStrokes:(id)a3
{
  p_delegate = &self->_delegate;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained pencilKitDidSmartSelectPreviouslySelectedStrokes:v4];
}

- (PKDrawing)drawing
{
  return self->_drawing;
}

- (void)setDrawing:(id)a3
{
}

- (UIView)tileMaskView
{
  return self->_tileMaskView;
}

- (BOOL)isTornDown
{
  return self->_isTornDown;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tileMaskView, 0);
  objc_storeStrong((id *)&self->_drawing, 0);
  objc_storeStrong((id *)&self->mTiledContainerView, 0);
  objc_storeStrong((id *)&self->mViewRep, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end