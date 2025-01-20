@interface CRLMultiselectResizeRep
- (BOOL)containsPoint:(CGPoint)a3 withPrecision:(BOOL)a4;
- (BOOL)p_representedSelectedLayoutInLayoutState:(int)a3;
- (BOOL)shouldCreateConnectionLineKnobs;
- (BOOL)shouldCreateSelectionKnobs;
- (BOOL)shouldShowKnobs;
- (BOOL)shouldShowSelectionHighlight;
- (BOOL)wantsRenderableToBeDescendedFromParentRepRenderable;
- (BOOL)willHandleResizingLayoutForRep:(id)a3;
- (CRLMultiselectResizeRep)initWithLayout:(id)a3 canvas:(id)a4;
- (NSArray)decoratorOverlayRenderables;
- (id)additionalRepsToResize;
- (id)dynamicResizeDidBegin;
- (id)p_multiselectLayout;
- (id)p_representedSelectedReps;
- (id)repForRotating;
- (int64_t)dragTypeAtCanvasPoint:(CGPoint)a3 forTouchType:(int64_t)a4;
- (void)documentModeDidChange;
- (void)dynamicResizeDidEndWithTracker:(id)a3;
- (void)selectionDidChange;
- (void)willBeRemoved;
@end

@implementation CRLMultiselectResizeRep

- (CRLMultiselectResizeRep)initWithLayout:(id)a3 canvas:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CRLMultiselectResizeRep;
  v4 = [(CRLCanvasRep *)&v8 initWithLayout:a3 canvas:a4];
  v5 = v4;
  if (v4)
  {
    v4->_viewScaleForCurrentLayerRelativePath = 0.0;
    v6 = [(CRLCanvasRep *)v4 interactiveCanvasController];
    [v6 addDecorator:v5];
  }
  return v5;
}

- (void)selectionDidChange
{
  [(CRLCanvasRep *)self invalidateKnobPositions];
  id v3 = [(CRLCanvasRep *)self layout];
  [v3 invalidateFrame];
}

- (BOOL)containsPoint:(CGPoint)a3 withPrecision:(BOOL)a4
{
  return 0;
}

- (id)repForRotating
{
  id v3 = [(CRLCanvasRep *)self layout];
  unsigned int v4 = [v3 supportsRotation];

  if (v4) {
    v5 = self;
  }
  else {
    v5 = 0;
  }

  return v5;
}

- (BOOL)shouldShowKnobs
{
  id v3 = [(CRLCanvasRep *)self interactiveCanvasController];
  unsigned __int8 v4 = [v3 isInDynamicOperation];

  return v4 ^ 1 | [(CRLMultiselectResizeRep *)self p_representedSelectedLayoutInLayoutState:4];
}

- (BOOL)shouldCreateSelectionKnobs
{
  unsigned __int8 v3 = [(CRLMultiselectResizeRep *)self p_representedSelectedLayoutInLayoutState:2];
  unsigned __int8 v4 = [(CRLMultiselectResizeRep *)self p_representedSelectedLayoutInLayoutState:3];
  return (v3 | v4 | [(CRLMultiselectResizeRep *)self p_representedSelectedLayoutInLayoutState:5]) ^ 1;
}

- (BOOL)shouldCreateConnectionLineKnobs
{
  return 0;
}

- (BOOL)shouldShowSelectionHighlight
{
  v2 = [(CRLCanvasRep *)self interactiveCanvasController];
  char v3 = [v2 isInDynamicOperation] ^ 1;

  return v3;
}

- (void)documentModeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)CRLMultiselectResizeRep;
  [(CRLCanvasRep *)&v3 documentModeDidChange];
  [(CRLCanvasRep *)self invalidateKnobs];
}

- (void)willBeRemoved
{
  objc_super v3 = [(CRLCanvasRep *)self interactiveCanvasController];
  [v3 removeDecorator:self];

  v4.receiver = self;
  v4.super_class = (Class)CRLMultiselectResizeRep;
  [(CRLCanvasRep *)&v4 willBeRemoved];
}

- (BOOL)wantsRenderableToBeDescendedFromParentRepRenderable
{
  return 1;
}

- (int64_t)dragTypeAtCanvasPoint:(CGPoint)a3 forTouchType:(int64_t)a4
{
  return 3;
}

- (NSArray)decoratorOverlayRenderables
{
  return (NSArray *)&__NSArray0__struct;
}

- (id)p_multiselectLayout
{
  uint64_t v3 = objc_opt_class();
  objc_super v4 = [(CRLCanvasRep *)self layout];
  v5 = sub_1002469D0(v3, v4);

  return v5;
}

- (BOOL)p_representedSelectedLayoutInLayoutState:(int)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  objc_super v4 = [(CRLMultiselectResizeRep *)self p_multiselectLayout];
  v5 = [v4 representedSelectedLayouts];

  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v12 + 1) + 8 * i) layoutState] == a3)
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (id)dynamicResizeDidBegin
{
  v16.receiver = self;
  v16.super_class = (Class)CRLMultiselectResizeRep;
  uint64_t v3 = [(CRLCanvasRep *)&v16 dynamicResizeDidBegin];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  objc_super v4 = [(CRLMultiselectResizeRep *)self p_representedSelectedReps];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(CRLMultiselectResizeRep **)(*((void *)&v12 + 1) + 8 * i);
        if (v9 != self && [*(id *)(*((void *)&v12 + 1) + 8 * i) isSelected]) {
          id v10 = [(CRLMultiselectResizeRep *)v9 dynamicResizeDidBegin];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)dynamicResizeDidEndWithTracker:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(CRLMultiselectResizeRep *)self p_representedSelectedReps];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(CRLMultiselectResizeRep **)(*((void *)&v13 + 1) + 8 * (void)v9);
        if (v10 != self && [*(id *)(*((void *)&v13 + 1) + 8 * (void)v9) isSelected]) {
          [v4 applyNewBoundsToRep:v10];
        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  [(CRLCanvasRep *)self invalidateKnobs];
  v12.receiver = self;
  v12.super_class = (Class)CRLMultiselectResizeRep;
  [(CRLCanvasRep *)&v12 dynamicResizeDidEndWithTracker:v4];
  v11 = [(CRLCanvasRep *)self layout];
  [v11 invalidatePosition];
}

- (BOOL)willHandleResizingLayoutForRep:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLCanvasRep *)self parentRep];
  id v6 = [v4 parentRep];

  return v5 == v6;
}

- (id)p_representedSelectedReps
{
  uint64_t v3 = +[NSMutableSet set];
  uint64_t v4 = objc_opt_class();
  id v5 = [(CRLCanvasRep *)self info];
  id v6 = sub_1002469D0(v4, v5);

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = [v6 representedSelectedBoardItems];
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        long long v13 = [(CRLCanvasRep *)self interactiveCanvasController];
        long long v14 = [v13 repForInfo:v12];
        [v3 addObject:v14];
      }
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  return v3;
}

- (id)additionalRepsToResize
{
  uint64_t v3 = +[NSMutableSet set];
  uint64_t v4 = objc_opt_class();
  id v5 = [(CRLCanvasRep *)self info];
  id v6 = sub_1002469D0(v4, v5);

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = [v6 representedSelectedBoardItems];
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        long long v13 = [(CRLCanvasRep *)self interactiveCanvasController];
        long long v14 = [v13 repForInfo:v12];
        [v3 addObject:v14];
      }
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  return v3;
}

@end