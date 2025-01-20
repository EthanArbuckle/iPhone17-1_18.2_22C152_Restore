@interface SXTextTangierInteractiveCanvasController
+ (void)createCanvasWithDelegate:(id)a3 outICC:(id *)a4 outLayerHost:(id *)a5 iccClass:(Class)a6 layerHostClass:(Class)a7;
- (BOOL)forceLayoutAndRenderOnThread;
- (BOOL)isScrolling;
- (BOOL)mightScrollToTop;
- (BOOL)p_currentlyScrolling;
- (BOOL)scrollViewShouldScrollToTop:(id)a3;
- (NSString)selectedText;
- (SXTextTangierInteractiveCanvasControllerDataSource)dataSource;
- (UIScrollView)scrollView;
- (id)closestRepToPoint:(CGPoint)a3 forStorage:(id)a4;
- (id)hitRep:(CGPoint)a3 withGesture:(id)a4 passingTest:(id)a5;
- (id)i_topLevelLayersForTiling;
- (id)topLevelRepsForHitTesting;
- (void)endUISession;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewDidScrollToTop:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setForceLayoutAndRenderOnThread:(BOOL)a3;
- (void)setIsScrolling:(BOOL)a3;
- (void)setMightScrollToTop:(BOOL)a3;
- (void)setScrollView:(id)a3;
- (void)setSelectedText:(id)a3;
- (void)setSelection:(id)a3 onModel:(id)a4 withFlags:(unint64_t)a5;
- (void)teardown;
- (void)willEndEditingText;
@end

@implementation SXTextTangierInteractiveCanvasController

+ (void)createCanvasWithDelegate:(id)a3 outICC:(id *)a4 outLayerHost:(id *)a5 iccClass:(Class)a6 layerHostClass:(Class)a7
{
}

- (void)setSelection:(id)a3 onModel:(id)a4 withFlags:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  objc_opt_class();
  v10 = TSUDynamicCast();
  objc_opt_class();
  v11 = TSUDynamicCast();
  v12 = [v11 substringWithSelection:v10];
  [(SXTextTangierInteractiveCanvasController *)self setSelectedText:v12];

  v13.receiver = self;
  v13.super_class = (Class)SXTextTangierInteractiveCanvasController;
  [(TSDInteractiveCanvasController *)&v13 setSelection:v9 onModel:v8 withFlags:a5 & 0xFFFFFFFFFFFFFFAFLL];
}

- (void)willEndEditingText
{
  [(SXTextTangierInteractiveCanvasController *)self setSelectedText:0];
  v3.receiver = self;
  v3.super_class = (Class)SXTextTangierInteractiveCanvasController;
  [(TSWPInteractiveCanvasController *)&v3 willEndEditingText];
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SXTextTangierInteractiveCanvasController;
  [(TSDInteractiveCanvasController *)&v5 scrollViewWillBeginDragging:a3];
  v4 = [(TSDInteractiveCanvasController *)self delegate];
  [v4 interactiveCanvasControllerWillStartInteraction:self];

  [(SXTextTangierInteractiveCanvasController *)self setIsScrolling:1];
}

- (void)scrollViewDidScroll:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SXTextTangierInteractiveCanvasController;
  [(TSDInteractiveCanvasController *)&v6 scrollViewDidScroll:a3];
  if ([(SXTextTangierInteractiveCanvasController *)self mightScrollToTop])
  {
    [(SXTextTangierInteractiveCanvasController *)self setIsScrolling:1];
    [(SXTextTangierInteractiveCanvasController *)self setMightScrollToTop:0];
    v4 = [(TSDInteractiveCanvasController *)self delegate];
    [v4 interactiveCanvasControllerWillStartInteraction:self];
  }
  objc_super v5 = [(TSDInteractiveCanvasController *)self delegate];
  [v5 interactiveCanvasControllerDidScroll:self];
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SXTextTangierInteractiveCanvasController;
  [(TSDInteractiveCanvasController *)&v10 scrollViewDidEndDragging:v6 willDecelerate:v4];
  if (!v4) {
    [(SXTextTangierInteractiveCanvasController *)self setIsScrolling:0];
  }
  v7 = [(TSDInteractiveCanvasController *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(TSDInteractiveCanvasController *)self delegate];
    [v9 interactiveCanvasController:self scrollViewDidEndDragging:v6 willDecelerate:v4];
  }
}

- (BOOL)scrollViewShouldScrollToTop:(id)a3
{
  int v4 = [a3 scrollsToTop];
  if (v4) {
    [(SXTextTangierInteractiveCanvasController *)self setMightScrollToTop:1];
  }
  return v4;
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SXTextTangierInteractiveCanvasController;
  [(TSDInteractiveCanvasController *)&v5 scrollViewDidEndDecelerating:a3];
  [(SXTextTangierInteractiveCanvasController *)self setIsScrolling:0];
  int v4 = [(TSDInteractiveCanvasController *)self delegate];
  [v4 interactiveCanvasControllerDidStopScrolling:self];
}

- (void)scrollViewDidScrollToTop:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SXTextTangierInteractiveCanvasController;
  [(TSDInteractiveCanvasController *)&v5 scrollViewDidScrollToTop:a3];
  [(SXTextTangierInteractiveCanvasController *)self setIsScrolling:0];
  int v4 = [(TSDInteractiveCanvasController *)self delegate];
  [v4 interactiveCanvasControllerDidStopScrolling:self];
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SXTextTangierInteractiveCanvasController;
  [(TSDInteractiveCanvasController *)&v5 scrollViewDidEndScrollingAnimation:a3];
  [(SXTextTangierInteractiveCanvasController *)self setIsScrolling:0];
  int v4 = [(TSDInteractiveCanvasController *)self delegate];
  [v4 interactiveCanvasControllerDidStopScrolling:self];
}

- (id)topLevelRepsForHitTesting
{
  objc_super v3 = [(SXTextTangierInteractiveCanvasController *)self dataSource];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    objc_super v5 = [(SXTextTangierInteractiveCanvasController *)self dataSource];
    id v6 = [v5 topLevelRepsForInteractiveCanvasController:self];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SXTextTangierInteractiveCanvasController;
    id v6 = [(TSDInteractiveCanvasController *)&v8 topLevelRepsForHitTesting];
  }
  return v6;
}

- (id)i_topLevelLayersForTiling
{
  objc_super v3 = [(SXTextTangierInteractiveCanvasController *)self dataSource];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    objc_super v5 = [(SXTextTangierInteractiveCanvasController *)self dataSource];
    id v6 = [v5 topLevelLayersForInteractiveCanvasController:self];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SXTextTangierInteractiveCanvasController;
    id v6 = [(TSDInteractiveCanvasController *)&v8 i_topLevelLayersForTiling];
  }
  return v6;
}

- (id)closestRepToPoint:(CGPoint)a3 forStorage:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v7 = a4;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  objc_super v8 = [(SXTextTangierInteractiveCanvasController *)self topLevelRepsForHitTesting];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    v11 = 0;
    uint64_t v12 = *(void *)v27;
    double v13 = INFINITY;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v8);
        }
        v15 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v16 = [v15 storage];

          if (v16 == v7)
          {
            [v15 frameInUnscaledCanvas];
            CGFloat v17 = v34.origin.x;
            CGFloat v18 = v34.origin.y;
            CGFloat width = v34.size.width;
            CGFloat height = v34.size.height;
            v33.CGFloat x = x;
            v33.CGFloat y = y;
            if (CGRectContainsPoint(v34, v33))
            {
              id v24 = v15;

              v11 = v24;
              goto LABEL_16;
            }
            v35.origin.CGFloat x = v17;
            v35.origin.CGFloat y = v18;
            v35.size.CGFloat width = width;
            v35.size.CGFloat height = height;
            CGRectGetMidX(v35);
            v36.origin.CGFloat x = v17;
            v36.origin.CGFloat y = v18;
            v36.size.CGFloat width = width;
            v36.size.CGFloat height = height;
            CGRectGetMidY(v36);
            TSDDistance();
            if (v21 < v13)
            {
              double v22 = v21;
              id v23 = v15;

              double v13 = v22;
              v11 = v23;
            }
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  else
  {
    v11 = 0;
  }
LABEL_16:

  return v11;
}

- (id)hitRep:(CGPoint)a3 withGesture:(id)a4 passingTest:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  id v9 = a5;
  id v10 = a4;
  v11 = [(TSDInteractiveCanvasController *)self canvas];
  uint64_t v12 = [(SXTextTangierInteractiveCanvasController *)self topLevelRepsForHitTesting];
  [(id)objc_opt_class() smallRepOutsetForHitTesting];
  v14 = objc_msgSend(v11, "hitRep:inTopLevelReps:smallRepOutset:withGesture:passingTest:", v12, v10, v9, x, y, v13);

  return v14;
}

- (BOOL)p_currentlyScrolling
{
  v6.receiver = self;
  v6.super_class = (Class)SXTextTangierInteractiveCanvasController;
  if ([(TSDInteractiveCanvasController *)&v6 p_currentlyScrolling]) {
    return 1;
  }
  char v4 = [(SXTextTangierInteractiveCanvasController *)self scrollView];
  char v3 = [v4 _isAnimatingScrollTest];

  return v3;
}

- (void)endUISession
{
  id v2 = [MEMORY[0x263F7C758] sharedHyperlinkUIController];
  [v2 endUISession];
}

- (void)teardown
{
  v3.receiver = self;
  v3.super_class = (Class)SXTextTangierInteractiveCanvasController;
  [(TSWPInteractiveCanvasController *)&v3 teardown];
  [(TSDInteractiveCanvasController *)self setDelegate:0];
}

- (UIScrollView)scrollView
{
  return *(UIScrollView **)&self->_forceLayoutAndRenderOnThread;
}

- (void)setScrollView:(id)a3
{
}

- (SXTextTangierInteractiveCanvasControllerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  return (SXTextTangierInteractiveCanvasControllerDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (BOOL)forceLayoutAndRenderOnThread
{
  return *(&self->super._isTearingDown + 2);
}

- (void)setForceLayoutAndRenderOnThread:(BOOL)a3
{
  *(&self->super._isTearingDown + 2) = a3;
}

- (NSString)selectedText
{
  return (NSString *)self->_dataSource;
}

- (void)setSelectedText:(id)a3
{
}

- (BOOL)isScrolling
{
  return *(&self->super._isTearingDown + 3);
}

- (void)setIsScrolling:(BOOL)a3
{
  *(&self->super._isTearingDown + 3) = a3;
}

- (BOOL)mightScrollToTop
{
  return *(&self->super._isTearingDown + 4);
}

- (void)setMightScrollToTop:(BOOL)a3
{
  *(&self->super._isTearingDown + 4) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_scrollView);
  objc_storeStrong((id *)&self->_forceLayoutAndRenderOnThread, 0);
}

@end