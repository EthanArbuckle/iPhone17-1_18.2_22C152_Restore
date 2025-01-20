@interface AEMarginNotesController
- (AEMarginNotesController)init;
- (AEMarginNotesControllerAccessibilityDelegate)imaxAccessibilityDelegate;
- (BOOL)compactPresentation;
- (BOOL)hasMarginNoteAtPoint:(CGPoint)a3;
- (CGRect)ownerFrame;
- (CGSize)ownerSize;
- (NSArray)layers;
- (NSMapTable)highlightedMarginNoteMarkers;
- (NSMapTable)marginNoteMarkers;
- (double)ownerScale;
- (id)marginNoteAtPoint:(CGPoint)a3;
- (id)p_marginNoteIntersectingRect:(CGRect)a3;
- (int64_t)pageTheme;
- (void)addMarginNote:(id)a3 edgeInsets:(UIEdgeInsets)a4;
- (void)highlightMarginNote:(id)a3;
- (void)imaxSetAccessibilityDelegate:(id)a3;
- (void)p_updateLayerLayout;
- (void)removeMarginNote:(id)a3;
- (void)setCompactPresentation:(BOOL)a3;
- (void)setHighlightedMarginNoteMarkers:(id)a3;
- (void)setMarginNoteMarkers:(id)a3;
- (void)setOwnerFrame:(CGRect)a3;
- (void)setOwnerScale:(double)a3;
- (void)setOwnerSize:(CGSize)a3;
- (void)setPageTheme:(int64_t)a3;
- (void)unhighlightAllMarginNotes;
- (void)unhighlightMarginNote:(id)a3;
@end

@implementation AEMarginNotesController

- (AEMarginNotesController)init
{
  v9.receiver = self;
  v9.super_class = (Class)AEMarginNotesController;
  v2 = [(AEMarginNotesController *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_pageTheme = 4;
    uint64_t v4 = +[NSMapTable strongToStrongObjectsMapTable];
    marginNoteMarkers = v3->_marginNoteMarkers;
    v3->_marginNoteMarkers = (NSMapTable *)v4;

    uint64_t v6 = +[NSMapTable strongToStrongObjectsMapTable];
    highlightedMarginNoteMarkers = v3->_highlightedMarginNoteMarkers;
    v3->_highlightedMarginNoteMarkers = (NSMapTable *)v6;

    v3->_ownerScale = 1.0;
  }
  return v3;
}

- (CGSize)ownerSize
{
  [(AEMarginNotesController *)self ownerFrame];
  double v3 = v2;
  double v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (void)setOwnerSize:(CGSize)a3
{
}

- (NSArray)layers
{
  double v2 = [(AEMarginNotesController *)self marginNoteMarkers];
  double v3 = [v2 objectEnumerator];
  double v4 = [v3 allObjects];

  +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_E86B4;
  v7[3] = &unk_2C9140;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = v5;
  [v4 enumerateObjectsUsingBlock:v7];

  return (NSArray *)v5;
}

- (id)p_marginNoteIntersectingRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CGRectGetMidX(a3);
  v35.origin.CGFloat x = x;
  v35.origin.CGFloat y = y;
  v35.size.CGFloat width = width;
  v35.size.CGFloat height = height;
  CGRectGetMidY(v35);
  id v8 = [(AEMarginNotesController *)self marginNoteMarkers];
  id v9 = [v8 copy];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v10 = v9;
  id v11 = [v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v11)
  {
    id v12 = v11;
    v13 = 0;
    uint64_t v14 = *(void *)v30;
    double v28 = 1.79769313e308;
    double v27 = x;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v30 != v14) {
          objc_enumerationMutation(v10);
        }
        v16 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v17 = [v10 objectForKey:v16];
        v18 = [v17 layer];

        [v18 frame];
        CGFloat v19 = v36.origin.x;
        CGFloat v20 = v36.origin.y;
        CGFloat v21 = v36.size.width;
        CGFloat v22 = v36.size.height;
        v39.origin.CGFloat x = x;
        v39.origin.CGFloat y = y;
        v39.size.CGFloat width = width;
        v39.size.CGFloat height = height;
        if (CGRectIntersectsRect(v36, v39))
        {
          v37.origin.CGFloat x = v19;
          v37.origin.CGFloat y = v20;
          v37.size.CGFloat width = v21;
          v37.size.CGFloat height = v22;
          CGRectGetMidX(v37);
          v38.origin.CGFloat x = v19;
          v38.origin.CGFloat y = v20;
          v38.size.CGFloat width = v21;
          v38.size.CGFloat height = v22;
          CGRectGetMidY(v38);
          CGPointSquaredDistanceFromPoint();
          double v24 = v23;
          if (!v13 || v23 < v28)
          {
            id v25 = v16;

            double v28 = v24;
            v13 = v25;
          }
          CGFloat x = v27;
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v12);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)marginNoteAtPoint:(CGPoint)a3
{
  [(AEMarginNotesController *)self ownerScale];
  CGPointMultiply();
  double v5 = v4;
  double v7 = v6;
  isPad();
  CGSizeScale();
  double v9 = v8;
  double v11 = v10;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v12 = [(AEMarginNotesController *)self marginNoteMarkers];
  id v13 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v13)
  {
    id v14 = v13;
    v15 = 0;
    uint64_t v16 = *(void *)v29;
    double v27 = 1.79769313e308;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v29 != v16) {
          objc_enumerationMutation(v12);
        }
        v18 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        CGFloat v19 = [(AEMarginNotesController *)self marginNoteMarkers];
        CGFloat v20 = [v19 objectForKey:v18];
        CGFloat v21 = [v20 layer];

        [v21 frame];
        double MidX = CGRectGetMidX(v35);
        [v21 frame];
        double MidY = CGRectGetMidY(v36);
        v37.origin.CGFloat x = MidX - v9 * 0.5;
        v37.origin.CGFloat y = MidY - v11 * 0.5;
        v37.size.CGFloat width = v9;
        v37.size.CGFloat height = v11;
        v34.CGFloat x = v5;
        v34.CGFloat y = v7;
        if (CGRectContainsPoint(v37, v34))
        {
          double v24 = (MidY - v7) * (MidY - v7) + (MidX - v5) * (MidX - v5);
          if (!v15 || v24 < v27)
          {
            id v25 = v18;

            double v27 = v24;
            v15 = v25;
          }
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v14);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)hasMarginNoteAtPoint:(CGPoint)a3
{
  double v3 = -[AEMarginNotesController marginNoteAtPoint:](self, "marginNoteAtPoint:", a3.x, a3.y);
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)p_updateLayerLayout
{
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  double v3 = [(AEMarginNotesController *)self layers];
  id v4 = [v3 countByEnumeratingWithState:&v52 objects:v57 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v53;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v53 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v52 + 1) + 8 * i) setPosition:-100.0, -100.0];
      }
      id v5 = [v3 countByEnumeratingWithState:&v52 objects:v57 count:16];
    }
    while (v5);
  }

  double v8 = [(AEMarginNotesController *)self marginNoteMarkers];
  double v9 = [v8 keyEnumerator];
  double v10 = [v9 allObjects];
  double v11 = [v10 sortedArrayUsingComparator:&stru_2C9160];

  [(AEMarginNotesController *)self ownerScale];
  long long v48 = 0u;
  long long v49 = 0u;
  if (v12 <= 0.0) {
    double v13 = 1.0;
  }
  else {
    double v13 = v12;
  }
  long long v50 = 0uLL;
  long long v51 = 0uLL;
  id obj = v11;
  id v14 = [obj countByEnumeratingWithState:&v48 objects:v56 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v49;
    double v17 = -(v13 * 6.0 + -0.00000011920929);
    do
    {
      v18 = 0;
      do
      {
        if (*(void *)v49 != v16) {
          objc_enumerationMutation(obj);
        }
        CGFloat v19 = *(void **)(*((void *)&v48 + 1) + 8 * (void)v18);
        CGFloat v20 = [(AEMarginNotesController *)self marginNoteMarkers];
        CGFloat v21 = [v20 objectForKey:v19];

        CGFloat v22 = [v21 layer];
        [v21 imageSize];
        if ([v19 side]) {
          [(AEMarginNotesController *)self ownerSize];
        }
        [v21 edgeInsets];
        [v19 xOffset];
        [(AEMarginNotesController *)self ownerFrame];
        [v19 yStart];
        [(AEMarginNotesController *)self ownerFrame];
        CGPointMultiply();
        CGFloat v24 = v23;
        [v22 bounds];
        CGRectMakeWithOriginSize();
        CGFloat width = v58.size.width;
        CGFloat height = v58.size.height;
        CGRect v59 = CGRectInset(v58, v17, v17);
        uint64_t v27 = -[AEMarginNotesController p_marginNoteIntersectingRect:](self, "p_marginNoteIntersectingRect:", v59.origin.x, v59.origin.y, v59.size.width, v59.size.height);
        if (v27)
        {
          long long v28 = (void *)v27;
          while (1)
          {
            long long v29 = [(AEMarginNotesController *)self marginNoteMarkers];
            long long v30 = [v29 objectForKey:v28];
            long long v31 = [v30 layer];

            if (!v31) {
              break;
            }

            [v31 frame];
            CGFloat v35 = v13 * 6.0 + CGRectGetMaxY(v60);
            v61.origin.CGFloat x = v24;
            v61.origin.CGFloat y = v35;
            v61.size.CGFloat width = width;
            v61.size.CGFloat height = height;
            CGRect v62 = CGRectInset(v61, v17, v17);
            long long v28 = -[AEMarginNotesController p_marginNoteIntersectingRect:](self, "p_marginNoteIntersectingRect:", v62.origin.x, v62.origin.y, v62.size.width, v62.size.height);

            if (!v28) {
              goto LABEL_22;
            }
          }
          BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/AssetsEngine/AECore/Annotations/AEMarginNotesController.m", 191, (uint64_t)"-[AEMarginNotesController p_updateLayerLayout]", (uint64_t)"nearbyLayer", 0, v32, v33, v34, v46);
        }
LABEL_22:
        [v22 frame];
        double v37 = v36;
        double v39 = v38;
        v40 = +[UIScreen mainScreen];
        [v40 scale];
        CGPointRoundForScale();
        double v42 = v41;
        double v44 = v43;

        [v22 setFrame:v42, v44, v37, v39];
        v18 = (char *)v18 + 1;
      }
      while (v18 != v15);
      id v45 = [obj countByEnumeratingWithState:&v48 objects:v56 count:16];
      id v15 = v45;
    }
    while (v45);
  }
}

- (void)addMarginNote:(id)a3 edgeInsets:(UIEdgeInsets)a4
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  id v16 = a3;
  double v9 = [v16 theme];
  if ([v9 isUnderline])
  {
    id v10 = &dword_4 + 2;
  }
  else
  {
    double v11 = [v16 theme];
    id v10 = [v11 annotationStyle];
  }
  double v12 = [AEAnnotationMarker alloc];
  double v13 = +[UIScreen mainScreen];
  [v13 scale];
  id v14 = -[AEAnnotationMarker initWithAnnotationStyle:contentScale:](v12, "initWithAnnotationStyle:contentScale:", v10);

  [(AEAnnotationMarker *)v14 setPageTheme:[(AEMarginNotesController *)self pageTheme]];
  [(AEMarginNotesController *)self ownerScale];
  -[AEAnnotationMarker setViewScale:](v14, "setViewScale:");
  -[AEAnnotationMarker setEdgeInsets:](v14, "setEdgeInsets:", top, left, bottom, right);
  id v15 = [(AEMarginNotesController *)self marginNoteMarkers];
  [v15 setObject:v14 forKey:v16];

  [(AEMarginNotesController *)self p_updateLayerLayout];
}

- (void)removeMarginNote:(id)a3
{
  id v4 = a3;
  id v5 = [(AEMarginNotesController *)self marginNoteMarkers];
  [v5 removeObjectForKey:v4];

  uint64_t v6 = [(AEMarginNotesController *)self highlightedMarginNoteMarkers];
  [v6 removeObjectForKey:v4];

  [(AEMarginNotesController *)self p_updateLayerLayout];
}

- (void)highlightMarginNote:(id)a3
{
  id v4 = a3;
  id v5 = [(AEMarginNotesController *)self marginNoteMarkers];
  id v7 = [v5 objectForKey:v4];

  [v7 setEffect:1];
  uint64_t v6 = [(AEMarginNotesController *)self highlightedMarginNoteMarkers];
  [v6 setObject:v7 forKey:v4];
}

- (void)unhighlightMarginNote:(id)a3
{
  id v4 = a3;
  id v5 = [(AEMarginNotesController *)self marginNoteMarkers];
  id v7 = [v5 objectForKey:v4];

  [v7 setEffect:0];
  uint64_t v6 = [(AEMarginNotesController *)self highlightedMarginNoteMarkers];
  [v6 removeObjectForKey:v4];
}

- (void)unhighlightAllMarginNotes
{
  double v3 = [(AEMarginNotesController *)self highlightedMarginNoteMarkers];
  id v4 = [v3 keyEnumerator];
  id v5 = [v4 allObjects];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[AEMarginNotesController unhighlightMarginNote:](self, "unhighlightMarginNote:", *(void *)(*((void *)&v11 + 1) + 8 * (void)v10), (void)v11);
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (CGRect)ownerFrame
{
  double x = self->_ownerFrame.origin.x;
  double y = self->_ownerFrame.origin.y;
  double width = self->_ownerFrame.size.width;
  double height = self->_ownerFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setOwnerFrame:(CGRect)a3
{
  self->_ownerFrame = a3;
}

- (double)ownerScale
{
  return self->_ownerScale;
}

- (void)setOwnerScale:(double)a3
{
  self->_ownerScale = a3;
}

- (BOOL)compactPresentation
{
  return self->_compactPresentation;
}

- (void)setCompactPresentation:(BOOL)a3
{
  self->_compactPresentation = a3;
}

- (int64_t)pageTheme
{
  return self->_pageTheme;
}

- (void)setPageTheme:(int64_t)a3
{
  self->_pageTheme = a3;
}

- (NSMapTable)marginNoteMarkers
{
  return self->_marginNoteMarkers;
}

- (void)setMarginNoteMarkers:(id)a3
{
}

- (NSMapTable)highlightedMarginNoteMarkers
{
  return self->_highlightedMarginNoteMarkers;
}

- (void)setHighlightedMarginNoteMarkers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightedMarginNoteMarkers, 0);

  objc_storeStrong((id *)&self->_marginNoteMarkers, 0);
}

- (AEMarginNotesControllerAccessibilityDelegate)imaxAccessibilityDelegate
{
  return (AEMarginNotesControllerAccessibilityDelegate *)objc_getAssociatedObject(self, &unk_2A27E8);
}

- (void)imaxSetAccessibilityDelegate:(id)a3
{
}

@end