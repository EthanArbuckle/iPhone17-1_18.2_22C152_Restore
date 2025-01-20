@interface CRLiOSDocumentModeFreehandDrawingTransform
- (BOOL)allowGestureInRestrictedGestureMode:(id)a3;
- (BOOL)wantsToSuppressSelectionKnobs;
- (CRLiOSDocumentModeFreehandDrawingTransform)initWithBoardViewController:(id)a3 andInteractiveCanvasController:(id)a4;
- (void)modeDidBeginFromMode:(id)a3 forced:(BOOL)a4;
- (void)modeWillBeginFromMode:(id)a3 forced:(BOOL)a4;
- (void)modeWillEndForMode:(id)a3 forced:(BOOL)a4;
- (void)p_doneButtonTapped:(id)a3;
- (void)p_endTransformMode;
- (void)selectionPathDidChange:(id)a3;
- (void)toolkitDidUpdateCurrentToolSelection;
@end

@implementation CRLiOSDocumentModeFreehandDrawingTransform

- (CRLiOSDocumentModeFreehandDrawingTransform)initWithBoardViewController:(id)a3 andInteractiveCanvasController:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CRLiOSDocumentModeFreehandDrawingTransform;
  return [(CRLiOSDocumentModeFreehandDrawing *)&v5 initWithBoardViewController:a3 andInteractiveCanvasController:a4];
}

- (void)modeWillBeginFromMode:(id)a3 forced:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v7 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E71F0);
    }
    v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101093F98(v7, v8);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E7210);
    }
    v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101066770(v9, v7);
    }
    v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDocumentModeFreehandDrawingTransform modeWillBeginFromMode:forced:]");
    v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLiOSDocumentModeFreehandDrawingTransform.m"];
    +[CRLAssertionHandler handleFailureInFunction:v10 file:v11 lineNumber:23 isFatal:0 description:"Transform mode is a submode of freehand drawing mode and can only transition from a freehand drawing mode"];
  }
  v12.receiver = self;
  v12.super_class = (Class)CRLiOSDocumentModeFreehandDrawingTransform;
  [(CRLiOSDocumentModeFreehandDrawing *)&v12 modeWillBeginFromMode:v6 forced:v4];
}

- (void)modeDidBeginFromMode:(id)a3 forced:(BOOL)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CRLiOSDocumentModeFreehandDrawingTransform;
  [(CRLiOSDocumentModeFreehandDrawing *)&v9 modeDidBeginFromMode:a3 forced:a4];
  if (+[CRLFeatureFlagsHelper isOSFeatureEnabled:1])
  {
    objc_super v5 = [(CRLiOSDocumentModeFreehandDrawing *)self interactiveCanvasController];
    id v6 = [v5 layerHost];
    int v7 = [v6 asiOSCVC];

    v8 = [v7 smartSelectionManager];
    [v8 beginSuppressingSmartSelection];
  }
}

- (void)modeWillEndForMode:(id)a3 forced:(BOOL)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CRLiOSDocumentModeFreehandDrawingTransform;
  [(CRLiOSDocumentModeFreehandDrawing *)&v9 modeWillEndForMode:a3 forced:a4];
  if (+[CRLFeatureFlagsHelper isOSFeatureEnabled:1])
  {
    objc_super v5 = [(CRLiOSDocumentModeFreehandDrawing *)self interactiveCanvasController];
    id v6 = [v5 layerHost];
    int v7 = [v6 asiOSCVC];

    v8 = [v7 smartSelectionManager];
    [v8 endSuppressingSmartSelection];
  }
}

- (BOOL)allowGestureInRestrictedGestureMode:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(CRLiOSDocumentModeFreehandDrawing *)self interactiveCanvasController];
  id v6 = [v5 layerHost];
  int v7 = [v6 asiOSCVC];

  v11.receiver = self;
  v11.super_class = (Class)CRLiOSDocumentModeFreehandDrawingTransform;
  if ([(CRLiOSDocumentModeFreehandDrawing *)&v11 allowGestureInRestrictedGestureMode:v4])
  {
    BOOL v8 = 1;
  }
  else
  {
    id v9 = [v7 repRotateGestureRecognizer];
    BOOL v8 = v9 == v4;
  }
  return v8;
}

- (void)toolkitDidUpdateCurrentToolSelection
{
  v3.receiver = self;
  v3.super_class = (Class)CRLiOSDocumentModeFreehandDrawingTransform;
  [(CRLiOSDocumentModeFreehandDrawing *)&v3 toolkitDidUpdateCurrentToolSelection];
  [(CRLiOSDocumentModeFreehandDrawingTransform *)self p_endTransformMode];
}

- (BOOL)wantsToSuppressSelectionKnobs
{
  return 0;
}

- (void)p_doneButtonTapped:(id)a3
{
  id v4 = [(CRLiOSDocumentMode *)self boardViewController];
  objc_super v3 = [v4 documentModeController];
  [v3 resetToDefaultModeAnimated:1];
}

- (void)selectionPathDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CRLiOSDocumentModeFreehandDrawingTransform;
  [(CRLiOSDocumentModeFreehandDrawing *)&v4 selectionPathDidChange:a3];
  [(CRLiOSDocumentModeFreehandDrawingTransform *)self p_endTransformMode];
}

- (void)p_endTransformMode
{
  id v7 = [(CRLiOSDocumentMode *)self boardViewController];
  objc_super v3 = [CRLiOSDocumentModeFreehandDrawing alloc];
  objc_super v4 = [(CRLiOSDocumentModeFreehandDrawing *)self interactiveCanvasController];
  objc_super v5 = [(CRLiOSDocumentModeFreehandDrawing *)v3 initWithBoardViewController:v7 andInteractiveCanvasController:v4];

  id v6 = [v7 documentModeController];
  [v6 setMode:v5 animated:0];
}

@end