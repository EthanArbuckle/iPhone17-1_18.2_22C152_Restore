@interface CRLiOSDocumentModeEdit
- (BOOL)cellHoverHighlightShouldBeDisplayed;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldHandleDoubleTapAtPoint:(CGPoint)a3 touchType:(int64_t)a4;
- (BOOL)shouldShowTextOverflowGlyphs;
- (BOOL)showApplicationToolbarWhenEnteringMode;
- (unint64_t)hash;
@end

@implementation CRLiOSDocumentModeEdit

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = [v3 isMemberOfClass:objc_opt_class()];

  return v4;
}

- (unint64_t)hash
{
  return 5;
}

- (BOOL)cellHoverHighlightShouldBeDisplayed
{
  return 1;
}

- (BOOL)showApplicationToolbarWhenEnteringMode
{
  return 0;
}

- (BOOL)shouldShowTextOverflowGlyphs
{
  return 1;
}

- (BOOL)shouldHandleDoubleTapAtPoint:(CGPoint)a3 touchType:(int64_t)a4
{
  double y = a3.y;
  double x = a3.x;
  unsigned int v8 = +[CRLFeatureFlagsHelper isOSFeatureEnabled:1];
  v9 = [(CRLiOSDocumentMode *)self boardViewController];
  v10 = [v9 interactiveCanvasController];

  unsigned __int8 v11 = [v10 documentIsSharedReadOnly];
  BOOL v12 = 0;
  if (v8 && (v11 & 1) == 0)
  {
    v13 = [v10 layerHost];
    v14 = [v13 asiOSCVC];

    v15 = [v14 delegate];
    v16 = [v15 pencilKitCanvasViewControllerForCanvasViewController:v14];

    v17 = [v10 hitRep:x, y];
    v18 = [v17 repForSelecting];

    uint64_t v19 = objc_opt_class();
    v20 = sub_1002469D0(v19, v18);
    v21 = v20;
    if (v20 && ([v20 isLocked] & 1) == 0)
    {
      v22 = [v10 freehandDrawingToolkit];
      [v22 beginDrawingModeIfNeededForTouchType:a4];

      v23 = [v10 freehandDrawingToolkit];
      [v23 setCurrentToolSelection:9];

      v24 = [v14 canvasView];
      v25 = [v24 unscaledCoordinateSpace];
      v26 = [v14 canvasView];
      v27 = [v26 window];
      v28 = [v27 coordinateSpace];
      [v25 convertPoint:v28 toCoordinateSpace:x, y];
      double v30 = v29;
      double v32 = v31;

      v33 = [v14 smartSelectionManager];
      v34 = [v16 smartSelectionView];
      [v34 frame];
      [v10 convertBoundsToUnscaledRect:];
      v39.double x = x;
      v39.double y = y;
      BOOL v35 = CGRectContainsPoint(v40, v39);

      v36 = [v16 smartSelectionView];

      if (v36 && v33 && v35)
      {
        v37 = [v16 smartSelectionView];
        [v33 handleDoubleTapInputAtUnscaledPoint:v37 inSelectionView:v30];
      }
      else
      {
        [v33 handleDoubleTapInputAtUnscaledPoint:v30, v32];
      }

      BOOL v12 = 1;
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  return v12;
}

@end