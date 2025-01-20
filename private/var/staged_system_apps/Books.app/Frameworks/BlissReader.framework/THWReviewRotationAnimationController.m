@interface THWReviewRotationAnimationController
- (CGPoint)translateForCenteredAutoRotateFromSize:(CGSize)a3 toSize:(CGSize)a4;
- (THWReviewRep)rep;
- (THWReviewRotationAnimationController)initWithRep:(id)a3;
- (double)scaleForCenteredAutoRotateFromSize:(CGSize)a3 toSize:(CGSize)a4;
- (int)autoRotationMode;
- (void)dealloc;
- (void)expandedDidRotateTransitionToSize:(CGSize)a3;
- (void)expandedWillAnimateRotationFromSize:(CGSize)a3 toSize:(CGSize)a4 duration:(double)a5;
- (void)expandedWillRotateTransitionFromSize:(CGSize)a3 toSize:(CGSize)a4;
- (void)expandedWillTransitionFromSize:(CGSize)a3 toSize:(CGSize)a4;
@end

@implementation THWReviewRotationAnimationController

- (THWReviewRotationAnimationController)initWithRep:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)THWReviewRotationAnimationController;
  v4 = [(THWReviewRotationAnimationController *)&v6 init];
  if (v4) {
    v4->_rep = (THWReviewRep *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THWReviewRotationAnimationController;
  [(THWReviewRotationAnimationController *)&v3 dealloc];
}

- (int)autoRotationMode
{
  return 4;
}

- (double)scaleForCenteredAutoRotateFromSize:(CGSize)a3 toSize:(CGSize)a4
{
  return 1.0;
}

- (CGPoint)translateForCenteredAutoRotateFromSize:(CGSize)a3 toSize:(CGSize)a4
{
  double x = CGPointZero.x;
  double y = CGPointZero.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)expandedWillRotateTransitionFromSize:(CGSize)a3 toSize:(CGSize)a4
{
  [(THWPagedCanvasController *)[(THWReviewRep *)self->_rep stageCanvasController] setPadInfos:0];

  +[CATransaction flush];
}

- (void)expandedDidRotateTransitionToSize:(CGSize)a3
{
  [(THWPagedCanvasController *)[(THWReviewRep *)self->_rep stageCanvasController] setPadInfos:1];
  [(THScrollView *)[(THWPagedCanvasController *)[(THWReviewRep *)self->_rep stageCanvasController] scrollView] setClipsToBounds:1];
  [self->_rep layout] layout invalidateQuestionLayouts
  v4 = [(THWReviewRep *)self->_rep stageCanvasController];

  [(THWPagedCanvasController *)v4 invalidateLayoutsAndFrames];
}

- (void)expandedWillAnimateRotationFromSize:(CGSize)a3 toSize:(CGSize)a4 duration:(double)a5
{
  [(TSDInteractiveCanvasController *)[(THWPagedCanvasController *)[(THWReviewRep *)self->_rep stageCanvasController] interactiveCanvasController] beginAnimations:@"reviewRotate" context:0];
  [(TSDInteractiveCanvasController *)[(THWPagedCanvasController *)[(THWReviewRep *)self->_rep stageCanvasController] interactiveCanvasController] setAnimationDuration:a5];
  id v7 = [(THWReviewRep *)self->_rep p_currentScrollableCanvasController];
  objc_msgSend(objc_msgSend(v7, "interactiveCanvasController"), "beginAnimations:context:", @"reviewRotate", 0);
  objc_msgSend(objc_msgSend(v7, "interactiveCanvasController"), "setAnimationDuration:", a5);
  [(THScrollView *)[(THWPagedCanvasController *)[(THWReviewRep *)self->_rep stageCanvasController] scrollView] setClipsToBounds:0];
  [self->_rep layout].invalidateFrame;
  [(THWPagedCanvasController *)[(THWReviewRep *)self->_rep stageCanvasController] invalidateLayoutsAndFrames];
  [v7 invalidateLayoutsAndFrames];
  id v8 = objc_alloc_init((Class)TSUMutableRetainedPointerSet);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v9 = objc_msgSend(objc_msgSend(objc_msgSend(v7, "interactiveCanvasController"), "canvas"), "topLevelReps");
  id v10 = [v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v28;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v27 + 1) + 8 * i) recursivelyPerformSelector:"addToSet:" withObject:v8];
      }
      id v11 = [v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v11);
  }
  [self->_rep.interactiveCanvasController layoutIfNeeded];
  v22 = self;
  [(TSDInteractiveCanvasController *)[(THWPagedCanvasController *)[(THWReviewRep *)self->_rep stageCanvasController] interactiveCanvasController] layoutIfNeeded];
  v21 = v7;
  objc_msgSend(objc_msgSend(v7, "interactiveCanvasController"), "layoutIfNeeded");
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v14 = (char *)[v8 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v14)
  {
    v15 = v14;
    uint64_t v16 = *(void *)v24;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v8);
        }
        objc_opt_class();
        uint64_t v18 = TSUDynamicCast();
        if (v18)
        {
          v19 = (void *)v18;
          id v20 = +[CATransition animation];
          [v20 setType:kCATransitionFade];
          [v20 setDuration:a5];
          objc_msgSend(objc_msgSend(v19, "textLayer"), "addAnimation:forKey:", v20, @"fadeAnimation");
        }
      }
      v15 = (char *)[v8 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v15);
  }
  objc_msgSend(objc_msgSend(v21, "interactiveCanvasController"), "commitAnimations");
  [(TSDInteractiveCanvasController *)[(THWPagedCanvasController *)[(THWReviewRep *)v22->_rep stageCanvasController] interactiveCanvasController] commitAnimations];
}

- (void)expandedWillTransitionFromSize:(CGSize)a3 toSize:(CGSize)a4
{
  [self->_rep layout:a3.width, a3.height, a4.width, a4.height];
  [self->_rep layout][self layout]invalidateQuestionLayouts
  [(THWPagedCanvasController *)[(THWReviewRep *)self->_rep stageCanvasController] invalidateLayoutsAndFrames];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = [(NSMutableDictionary *)[(THWReviewRep *)self->_rep scrollableCanvasControllers] allValues];
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) invalidateLayoutsAndFrames];
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (THWReviewRep)rep
{
  return self->_rep;
}

@end