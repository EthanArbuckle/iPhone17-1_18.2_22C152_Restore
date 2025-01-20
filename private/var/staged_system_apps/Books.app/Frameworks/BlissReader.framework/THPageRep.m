@interface THPageRep
- (BOOL)canHandleGesture:(id)a3;
- (BOOL)directlyManagesLayerContent;
- (BOOL)drawsPageBackground;
- (BOOL)handleGesture:(id)a3;
- (BOOL)masksToBounds;
- (BOOL)p_hasBookmark;
- (BOOL)p_isToggleBookmarkGesture:(id)a3;
- (BOOL)p_shouldShowBookmark;
- (BOOL)supportsBookmarking;
- (CGRect)p_bookmarkLayerFrame;
- (THMarginNotesController)marginNotesController;
- (THPageRep)initWithLayout:(id)a3 canvas:(id)a4;
- (id)childRepsForHitTesting;
- (id)hitRep:(CGPoint)a3;
- (id)hitRep:(CGPoint)a3 withGesture:(id)a4 passingTest:(id)a5;
- (id)marginNoteForAnnotation:(id)a3 inRep:(id)a4 highlightBounds:(CGRect)a5;
- (id)noteMarkerForUnscaledPoint:(CGPoint)a3;
- (int)marginNoteSideForPageRelativeRect:(CGRect)a3;
- (void)addAdditionalChildLayersToArray:(id)a3;
- (void)dealloc;
- (void)didUpdateLayer:(id)a3;
- (void)drawInLayerContext:(CGContext *)a3;
- (void)insertChildRep:(id)a3 atIndex:(unint64_t)a4;
- (void)p_setHasBookmark:(BOOL)a3;
- (void)p_updateBookmarkStatusAnimated:(BOOL)a3;
- (void)removeChildRep:(id)a3;
- (void)setChildReps:(id)a3;
- (void)setMarginNotesController:(id)a3;
- (void)setNeedsDisplayInRect:(CGRect)a3;
- (void)showEditorForMarginNote:(id)a3;
- (void)updateBookmarkStatus;
- (void)updateBookmarkStatusAnimated;
- (void)updateBookmarkVisibleState;
- (void)updateFromLayout;
- (void)viewScaleDidChange;
@end

@implementation THPageRep

- (THPageRep)initWithLayout:(id)a3 canvas:(id)a4
{
  [a3 info];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:@"-[THPageRep initWithLayout:canvas:]"] file:[NSString stringWithUTF8String:@"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageRep.mm"] lineNumber:78 description:@"bad info class"];
  }
  v13.receiver = self;
  v13.super_class = (Class)THPageRep;
  v7 = [(THPageRep *)&v13 initWithLayout:a3 canvas:a4];
  if (v7)
  {
    [(THPageRep *)v7 setMarginNotesController:objc_alloc_init(THMarginNotesController)];
    objc_msgSend(objc_msgSend(-[THPageRep layout](v7, "layout"), "geometryInRoot"), "size");
    -[THMarginNotesController setOwnerSize:]([(THPageRep *)v7 marginNotesController], "setOwnerSize:", v8, v9);
    [a4 viewScale];
    [(THMarginNotesController *)[(THPageRep *)v7 marginNotesController] setOwnerScale:v10];
    if (objc_msgSend(-[THPageRep layout](v7, "layout"), "isReflowablePresentation")
      && (objc_msgSend(objc_msgSend(-[THPageRep layout](v7, "layout"), "layoutController"), "isCompactWidth") & 1) != 0)
    {
      id v11 = &dword_0 + 1;
    }
    else
    {
      id v11 = [[v7 layout] isCompactFlowPresentation];
    }
    [(THMarginNotesController *)[(THPageRep *)v7 marginNotesController] setCompactPresentation:v11];
    v7->mBookmarkStatusDirty = 1;
  }
  return v7;
}

- (void)dealloc
{
  [(THPageRep *)self setMarginNotesController:0];

  v3.receiver = self;
  v3.super_class = (Class)THPageRep;
  [(THPageRep *)&v3 dealloc];
}

- (void)viewScaleDidChange
{
  [self canvas].viewScale;
  [(THMarginNotesController *)[(THPageRep *)self marginNotesController] setOwnerScale:v3];
  v4.receiver = self;
  v4.super_class = (Class)THPageRep;
  [(THPageRep *)&v4 viewScaleDidChange];
}

- (BOOL)drawsPageBackground
{
  return 1;
}

- (void)didUpdateLayer:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)THPageRep;
  -[THPageRep didUpdateLayer:](&v7, "didUpdateLayer:");
  if ([(THPageRep *)self drawsPageBackground])
  {
    [a3 setOpaque:1];
    if (objc_msgSend(objc_msgSend(-[THPageRep interactiveCanvasController](self, "interactiveCanvasController"), "documentRoot"), "themeProvider"))
    {
      uint64_t Copy = (uint64_t)CGColorCreateCopy((CGColorRef)objc_msgSend(objc_msgSend(objc_msgSend(-[THPageRep interactiveCanvasController](self, "interactiveCanvasController"), "documentRoot"), "themeProvider"), "backgroundColor"));
    }
    else
    {
      uint64_t Copy = TSUCGColorCreateDeviceRGB();
    }
    v6 = (CGColor *)Copy;
    [a3 setBackgroundColor:Copy];
    CGColorRelease(v6);
  }
}

- (BOOL)directlyManagesLayerContent
{
  return 1;
}

- (void)setNeedsDisplayInRect:(CGRect)a3
{
  if (!CGRectIsEmpty(a3))
  {
    id v3 = +[TSUAssertionHandler currentHandler];
    objc_super v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPageRep setNeedsDisplayInRect:]");
    v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageRep.mm"];
    [v3 handleFailureInFunction:v4, v5, 148, @"this method should never be called, and page reps should never get a bitmap allocated" file lineNumber description];
  }
}

- (void)drawInLayerContext:(CGContext *)a3
{
  id v3 = +[TSUAssertionHandler currentHandler];
  objc_super v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPageRep drawInLayerContext:]");
  v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageRep.mm"];

  [v3 handleFailureInFunction:v4, v5, 158, @"this method should never be called, and page reps should never get a bitmap allocated" file lineNumber description];
}

- (BOOL)masksToBounds
{
  return 1;
}

- (id)hitRep:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v20.receiver = self;
  v20.super_class = (Class)THPageRep;
  v6 = -[THPageRep hitRep:](&v20, "hitRep:");
  if (v6 == self)
  {
    id v8 = [(THPageRep *)self interactiveCanvasController];
    [v8 convertBoundsToUnscaledSize:kTextMarginHitSlop[0], kTextMarginHitSlop[1]];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v11 = -[THPageRep hitReps:withSlop:](self, "hitReps:withSlop:", x, y, v9, v10, 0);
    id v12 = [v11 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v17;
LABEL_5:
      uint64_t v15 = 0;
      while (1)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        v6 = *(THPageRep **)(*((void *)&v16 + 1) + 8 * v15);
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 && ([(THPageRep *)v6 isEditing]) {
          break;
        }
        if (v13 == (id)++v15)
        {
          id v13 = [v11 countByEnumeratingWithState:&v16 objects:v21 count:16];
          if (v13) {
            goto LABEL_5;
          }
          return self;
        }
      }
    }
    else
    {
      return self;
    }
  }
  return v6;
}

- (id)hitRep:(CGPoint)a3 withGesture:(id)a4 passingTest:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  [(THPageRep *)self naturalBounds];
  v12.double x = x;
  v12.double y = y;
  if (!CGRectContainsPoint(v13, v12)) {
    return 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)THPageRep;
  return -[THPageRep hitRep:withGesture:passingTest:](&v11, "hitRep:withGesture:passingTest:", a4, a5, x, y);
}

- (id)childRepsForHitTesting
{
  id result = self->mSortedChildRepsForHitTesting;
  if (!result)
  {
    v7.receiver = self;
    v7.super_class = (Class)THPageRep;
    objc_super v4 = +[NSMutableOrderedSet orderedSetWithArray:[(THPageRep *)&v7 childRepsForHitTesting]];
    id v5 = [(NSMutableOrderedSet *)v4 indexesOfObjectsPassingTest:&stru_4579F0];
    -[NSMutableOrderedSet moveObjectsAtIndexes:toIndex:](v4, "moveObjectsAtIndexes:toIndex:", v5, (unsigned char *)-[NSMutableOrderedSet count](v4, "count") - (unsigned char *)[v5 count]);
    id v6 = [(NSMutableOrderedSet *)v4 indexesOfObjectsPassingTest:&stru_457A10];
    -[NSMutableOrderedSet moveObjectsAtIndexes:toIndex:](v4, "moveObjectsAtIndexes:toIndex:", v6, (unsigned char *)-[NSMutableOrderedSet count](v4, "count") - (unsigned char *)[v6 count]);
    id result = [[v4 array] copy];
    self->mSortedChildRepsForHitTesting = (NSArray *)result;
  }
  return result;
}

- (void)setChildReps:(id)a3
{
  self->mSortedChildRepsForHitTesting = 0;
  v5.receiver = self;
  v5.super_class = (Class)THPageRep;
  [(THPageRep *)&v5 setChildReps:a3];
}

- (void)insertChildRep:(id)a3 atIndex:(unint64_t)a4
{
  self->mSortedChildRepsForHitTesting = 0;
  v7.receiver = self;
  v7.super_class = (Class)THPageRep;
  [(THPageRep *)&v7 insertChildRep:a3 atIndex:a4];
}

- (void)removeChildRep:(id)a3
{
  self->mSortedChildRepsForHitTesting = 0;
  v5.receiver = self;
  v5.super_class = (Class)THPageRep;
  [(THPageRep *)&v5 removeChildRep:a3];
}

- (void)updateBookmarkVisibleState
{
  *(float *)&double v3 = (float)[(THPageRep *)self p_shouldShowBookmark];
  mBookmarkLayer = self->mBookmarkLayer;

  [(CALayer *)mBookmarkLayer setOpacity:v3];
}

- (BOOL)supportsBookmarking
{
  return 1;
}

- (void)updateFromLayout
{
  v3.receiver = self;
  v3.super_class = (Class)THPageRep;
  [(THPageRep *)&v3 updateFromLayout];
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  [(THPageRep *)self p_bookmarkLayerFrame];
  -[CALayer setFrame:](self->mBookmarkLayer, "setFrame:");
  +[CATransaction commit];
}

- (CGRect)p_bookmarkLayerFrame
{
  [(THPageRep *)self frameInUnscaledCanvas];
  double v3 = CGRectGetWidth(v10) + -48.0;
  id v4 = [(THPageRep *)self canvas];

  [v4 convertUnscaledToBoundsRect:v3];
  result.size.height = v8;
  result.size.width = v7;
  result.origin.double y = v6;
  result.origin.double x = v5;
  return result;
}

- (BOOL)p_hasBookmark
{
  [self interactiveCanvasController].delegate
  double v3 = (void *)TSUProtocolCast();

  return [v3 isPageBookmarkedForPageRep:self];
}

- (void)p_setHasBookmark:(BOOL)a3
{
  BOOL v3 = a3;
  [self interactiveCanvasController].delegate
  double v5 = (void *)TSUProtocolCast();

  [v5 setPageBookmarked:v3 forPageRep:self];
}

- (BOOL)p_shouldShowBookmark
{
  [self.interactiveCanvasController delegate];
  v2 = (void *)TSUProtocolCast();

  return [v2 bookmarksShouldBeVisible];
}

- (void)p_updateBookmarkStatusAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(THPageRep *)self supportsBookmarking]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPageRep p_updateBookmarkStatusAnimated:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageRep.mm") lineNumber:303 description:@"shouldn't be updating the bookmark status if we don't show the bookmark layer"];
  }
  BOOL v5 = [(CALayer *)self->mBookmarkLayer contents] == 0;
  unsigned int v6 = [(THPageRep *)self p_hasBookmark];
  if (((v5 ^ v6) & 1) == 0)
  {
    unsigned int v7 = v6;
    if (v6)
    {
      [self->mBookmarkLayer setContents:[+[TSUImage imageNamed:inBundle:](TSUImage, "imageNamed:inBundle:", @"ib_bookmark_on_page", THBundle()) CGImage]];
      if (!v3)
      {
        [(THPageRep *)self p_bookmarkLayerFrame];
        mBookmarkLayer = self->mBookmarkLayer;
        -[CALayer setFrame:](mBookmarkLayer, "setFrame:");
        return;
      }
      goto LABEL_10;
    }
    if (v3)
    {
LABEL_10:
      [(CALayer *)self->mBookmarkLayer removeAllAnimations];
      +[CATransaction begin];
      if ((v7 & 1) == 0)
      {
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = sub_49550;
        v25[3] = &unk_456DE0;
        v25[4] = self;
        +[CATransaction setCompletionBlock:v25];
      }
      double v9 = +[CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
      CGRect v10 = +[NSNumber numberWithFloat:0.0];
      [(CALayer *)self->mBookmarkLayer bounds];
      float v12 = v11;
      *(float *)&double v13 = -v12;
      uint64_t v14 = +[NSNumber numberWithFloat:v13];
      if (v7) {
        uint64_t v15 = v14;
      }
      else {
        uint64_t v15 = v10;
      }
      if (v7) {
        long long v16 = v10;
      }
      else {
        long long v16 = v14;
      }
      [(CABasicAnimation *)v9 setFromValue:v15];
      [(CABasicAnimation *)v9 setToValue:v16];
      [(CALayer *)self->mBookmarkLayer addAnimation:v9 forKey:@"slide"];
      [(CALayer *)self->mBookmarkLayer frame];
      double v18 = v17;
      double v20 = v19;
      double v22 = v21;
      objc_opt_class();
      [(CABasicAnimation *)v9 toValue];
      [(id)TSUDynamicCast() floatValue];
      -[CALayer setFrame:](self->mBookmarkLayer, "setFrame:", v18, v23, v20, v22);
      +[CATransaction commit];
      return;
    }
    [(CALayer *)self->mBookmarkLayer setContents:0];
    v24 = self->mBookmarkLayer;
    [(CALayer *)v24 setContents:0];
  }
}

- (void)updateBookmarkStatus
{
  if ([(THPageRep *)self supportsBookmarking])
  {
    [(THPageRep *)self p_updateBookmarkStatusAnimated:0];
  }
}

- (void)updateBookmarkStatusAnimated
{
  if ([(THPageRep *)self supportsBookmarking])
  {
    [(THPageRep *)self p_updateBookmarkStatusAnimated:1];
  }
}

- (void)addAdditionalChildLayersToArray:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)THPageRep;
  -[THPageRep addAdditionalChildLayersToArray:](&v5, "addAdditionalChildLayersToArray:");
  [a3 addObjectsFromArray:[-[THPageRep marginNotesController](self, "marginNotesController") layers]];
  if ([(THPageRep *)self supportsBookmarking])
  {
    if (!self->mBookmarkLayer)
    {
      self->mBookmarkLayer = (CALayer *)objc_alloc_init((Class)CALayer);
      [(THPageRep *)self p_bookmarkLayerFrame];
      -[CALayer setFrame:](self->mBookmarkLayer, "setFrame:");
      [(THPageRep *)self updateBookmarkVisibleState];
    }
    if (self->mBookmarkStatusDirty)
    {
      [(THPageRep *)self p_updateBookmarkStatusAnimated:0];
      self->mBookmarkStatusDirtdouble y = 0;
    }
    [a3 addObject:self->mBookmarkLayer];
  }
}

- (id)noteMarkerForUnscaledPoint:(CGPoint)a3
{
  return 0;
}

- (BOOL)p_isToggleBookmarkGesture:(id)a3
{
  [self interactiveCanvasController].delegate
  uint64_t v5 = TSUProtocolCast();
  if (v5)
  {
    unsigned int v6 = (void *)v5;
    [a3 naturalLocationForRep:self];
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    [v6 bookmarkHotspotRegionForPage:[self info]];
    v13.double x = v8;
    v13.double y = v10;
    if (CGRectContainsPoint(v15, v13))
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      [(THPageRep *)self p_bookmarkLayerFrame];
      v14.double x = v8;
      v14.double y = v10;
      LODWORD(v5) = CGRectContainsPoint(v16, v14);
      if (v5)
      {
        LOBYTE(v5) = [(THPageRep *)self p_hasBookmark];
      }
    }
  }
  return v5;
}

- (BOOL)canHandleGesture:(id)a3
{
  id v5 = [a3 gestureKind];
  if (v5 != (id)TSDShortTap)
  {
    id v6 = [a3 gestureKind];
    if (v6 != (id)TSDDelayedShortTap) {
      return 0;
    }
  }

  return [(THPageRep *)self p_isToggleBookmarkGesture:a3];
}

- (BOOL)handleGesture:(id)a3
{
  id v5 = [a3 gestureKind];
  if (v5 == (id)TSDShortTap || (id v6 = [a3 gestureKind], v6 == (id)TSDDelayedShortTap))
  {
    if ([(THPageRep *)self p_isToggleBookmarkGesture:a3]) {
      [(THPageRep *)self p_setHasBookmark:[(THPageRep *)self p_hasBookmark] ^ 1];
    }
  }
  return 1;
}

- (THMarginNotesController)marginNotesController
{
  return self->mMarginNotesController;
}

- (void)setMarginNotesController:(id)a3
{
}

- (int)marginNoteSideForPageRelativeRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v8 = fabs(CGRectGetMinX(a3));
  [(THPageRep *)self naturalBounds];
  double v10 = v9;
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  return v8 >= vabdd_f64(v10, CGRectGetMaxX(v12));
}

- (id)marginNoteForAnnotation:(id)a3 inRep:(id)a4 highlightBounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  [a4 convertNaturalRectToUnscaledCanvas:a5.origin.x, a5.origin.y];
  [(THPageRep *)self frameInUnscaledCanvas];
  [self canvas].contentsScale
  TSDRoundForScale();
  double v10 = v9;
  TSDRoundForScale();
  double v12 = v11;
  id v13 = objc_alloc_init((Class)AEMarginNote);
  [v13 setAnnotation:a3];
  [v13 setTheme:[a3 theme]];
  [v13 setSide:[self marginNoteSideForPageRelativeRect:v10, v12, width, height]];
  v16.origin.CGFloat x = v10;
  v16.origin.CGFloat y = v12;
  v16.size.double width = width;
  v16.size.double height = height;
  [v13 setYStart:CGRectGetMinY(v16)];

  return v13;
}

- (void)showEditorForMarginNote:(id)a3
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(THPageRep *)self childReps];
  id v6 = (char *)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    double v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_opt_class();
        double v10 = (void *)TSUDynamicCast();
        if (v10)
        {
          double v11 = v10;
          if (objc_msgSend(objc_msgSend(v10, "highlightController"), "ownsMarginNote:", a3))
          {
            [self interactiveCanvasController].endEditing;
            objc_msgSend(objc_msgSend(v11, "highlightController"), "showNoteEditorForMarginNote:", a3);
            return;
          }
        }
      }
      double v7 = (char *)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
}

@end