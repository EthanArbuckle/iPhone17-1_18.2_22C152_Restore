@interface THNoteCardsController
- (BOOL)canFlipTopCard;
- (BOOL)darkMode;
- (BOOL)draggingTopCard;
- (BOOL)isBottomCardAtPoint:(CGPoint)a3;
- (BOOL)isDraggingTopCard;
- (BOOL)isPointInsideTopCardFlipGlyph:(CGPoint)a3;
- (BOOL)isShowingEmptyStudyCard;
- (BOOL)isTopCardAtPoint:(CGPoint)a3;
- (BOOL)isTopCardFlipAffordancePressed;
- (BOOL)isTopCardPageNumberPressed;
- (BOOL)p_hitTest:(CGPoint)a3 noteCard:(id)a4 outset:(UIEdgeInsets)a5;
- (BOOL)showingMultipleCards;
- (BOOL)topNoteCardIsFlipped;
- (CATransform3D)p_perspectiveTransformWithScale:(SEL)a3;
- (CGPoint)dragOffset;
- (CGPoint)shuffleOffset:(BOOL)a3;
- (CGRect)frameForBottomCardInHostView;
- (CGRect)frameForTopCardFlipGlyphInHostView;
- (CGRect)frameForTopCardInHostView;
- (CGRect)frameForTopCardPageNumberInHostView;
- (CGSize)maxCardSize;
- (CGSize)minCardSize;
- (NSArray)noteCards;
- (THNoteCardsController)initWithDocumentRoot:(id)a3;
- (THNoteCardsControllerDelegate)delegate;
- (THStudyOptions)studyOptions;
- (double)offscreenNoteDistance;
- (id)p_bottomNoteCard;
- (id)p_createNewNoteCardLayer;
- (id)p_noteCardAtIndex:(int)a3;
- (id)p_noteCardForPoint:(CGPoint)a3;
- (id)p_noteCardsForInfos:(id)a3;
- (id)p_topNoteCard;
- (id)p_topNoteCardInfo;
- (id)topScrollView;
- (int)scalingMode;
- (unint64_t)bookPageIndexForTopCard;
- (unint64_t)noteCardCount;
- (unint64_t)noteCardLayerCount;
- (void)animateBottomCardToTopInDirection:(CGPoint)a3;
- (void)animateTopCardToBottomInDirection:(CGPoint)a3;
- (void)attachToView:(id)a3;
- (void)beginDragAtPoint:(CGPoint)a3;
- (void)beginDraggingBottomCardAtPoint:(CGPoint)a3;
- (void)beginDraggingTopCardAtPoint:(CGPoint)a3;
- (void)dealloc;
- (void)detachFromView:(id)a3;
- (void)endDragInDirection:(CGPoint)a3;
- (void)flipTopCard;
- (void)forceSwipeInDirection:(CGPoint)a3;
- (void)handleTopCardFlipAffordanceHovered:(BOOL)a3;
- (void)handleTopCardFlipAffordancePressed:(BOOL)a3;
- (void)handleTopCardPageNumberHovered:(BOOL)a3;
- (void)handleTopCardPageNumberPressed:(BOOL)a3;
- (void)noteCardDidSettle:(id)a3;
- (void)noteCardWillUnsettle:(id)a3;
- (void)p_animateCardToTopOrBottom:(id)a3 direction:(CGPoint)a4 duration:(double)a5;
- (void)p_cancelDragAnimated:(BOOL)a3 duration:(double)a4;
- (void)p_completeDragInDirection:(CGPoint)a3 animationDuration:(double)a4;
- (void)p_filterOptionsChanged;
- (void)p_handleDelayedCardUpdate;
- (void)p_makeTopCardInteractive;
- (void)p_makeTopCardNonInteractive;
- (void)p_populateNoteCard:(id)a3 withInfo:(id)a4;
- (void)p_rebuildNoteCardInfos;
- (void)p_recreateNoteCardLayers;
- (void)p_reflectShuffleOptionsChangeWithCompletionBlock:(id)a3;
- (void)p_reloadNoteCardAtIndex:(int)a3 noteCards:(id)a4 noteCardInfos:(id)a5;
- (void)p_reloadNoteCardInfosFromNavigationUnit:(id)a3;
- (void)p_reloadNoteCards;
- (void)p_resetFlipOnBelowTopCard;
- (void)p_rotateNoteCardInfosToContentNode:(id)a3;
- (void)p_setDynamicScale:(double)a3;
- (void)p_setDynamicScale:(double)a3 animated:(BOOL)a4 duration:(double)a5;
- (void)p_setLayoutScale:(double)a3;
- (void)p_setScale:(double)a3 animated:(BOOL)a4 duration:(double)a5;
- (void)p_unfilteredNoteCardInfosChangedMoveToRight:(BOOL)a3;
- (void)p_updateNoteCardOrder;
- (void)setDarkMode:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDragOffset:(CGPoint)a3;
- (void)setMaxCardSize:(CGSize)a3;
- (void)setMinCardSize:(CGSize)a3;
- (void)setScalingMode:(int)a3;
- (void)shuffleCards;
- (void)studyOptionsDidChangeFilterOptions:(id)a3;
- (void)studyOptionsDidChangeShuffle:(id)a3;
- (void)studyOptionsWillChangeShuffle:(id)a3;
- (void)updateFrame:(CGRect)a3 insets:(UIEdgeInsets)a4 animated:(BOOL)a5 duration:(double)a6;
- (void)updateWithNavigationUnit:(id)a3 contentNode:(id)a4;
- (void)zoomOutAndFadeCards:(BOOL)a3 duration:(double)a4;
@end

@implementation THNoteCardsController

- (THNoteCardsController)initWithDocumentRoot:(id)a3
{
  if (!a3) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNoteCardsController initWithDocumentRoot:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNoteCardsController.m") lineNumber:140 description:@"invalid nil value for '%s'", "documentRoot"];
  }
  v19.receiver = self;
  v19.super_class = (Class)THNoteCardsController;
  v5 = [(THNoteCardsController *)&v19 init];
  v6 = v5;
  if (v5)
  {
    v5->_documentRoot = (THDocumentRoot *)a3;
    v7 = -[THStudyOptions initWithUserDefaults:]([THStudyOptions alloc], "initWithUserDefaults:", [a3 bookUserDefaults]);
    v6->_options = v7;
    [(THStudyOptions *)v7 addObserver:v6];
    v6->_noteCards = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v6->_noteCardInfos = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v6->_delayedUpdateNoteCardIndex = 0x7FFFFFFFFFFFFFFFLL;
    v6->_noteCardsView = (UIView *)objc_alloc_init((Class)UIView);
    v6->_noteCardsLayer = (CALayer *)objc_alloc_init((Class)TSDNoDefaultImplicitActionLayer);
    [(THNoteCardsController *)v6 p_perspectiveTransformWithScale:1.0];
    noteCardsLayer = v6->_noteCardsLayer;
    v18[4] = v18[12];
    v18[5] = v18[13];
    v18[6] = v18[14];
    v18[7] = v18[15];
    v18[0] = v18[8];
    v18[1] = v18[9];
    v18[2] = v18[10];
    v18[3] = v18[11];
    [(CALayer *)noteCardsLayer setSublayerTransform:v18];
    [(CALayer *)[(UIView *)v6->_noteCardsView layer] addSublayer:v6->_noteCardsLayer];
    v6->_interactiveViewsToLayers = +[NSMapTable weakToWeakObjectsMapTable];
    __asm { FMOV            V0.2D, #10.0 }
    v6->_minCardSize = _Q0;
    TSDMultiplySizeScalar();
    v6->_maxCardSize.width = v14;
    v6->_maxCardSize.height = v15;
    v6->_scalingMode = 0;
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&v6->_layoutScale = _Q0;
  }
  return v6;
}

- (void)dealloc
{
  [(THStudyOptions *)self->_options removeObserver:self];
  [(NSArray *)[(CALayer *)self->_noteCardsLayer sublayers] makeObjectsPerformSelector:"removeFromSuperlayer"];
  [(CALayer *)self->_noteCardsLayer removeFromSuperlayer];

  v3.receiver = self;
  v3.super_class = (Class)THNoteCardsController;
  [(THNoteCardsController *)&v3 dealloc];
}

- (void)updateWithNavigationUnit:(id)a3 contentNode:(id)a4
{
  currentNavigationUnit = self->_currentNavigationUnit;
  [(NSArray *)[(THDocumentNavigationModel *)[(THDocumentRoot *)self->_documentRoot navigationModel] navigationUnits] indexOfObject:currentNavigationUnit];
  [(NSArray *)[(THDocumentNavigationModel *)[(THDocumentRoot *)self->_documentRoot navigationModel] navigationUnits] indexOfObject:a3];
  if (currentNavigationUnit != a3)
  {
    [(THNoteCardsController *)self p_reloadNoteCardInfosFromNavigationUnit:a3];

    self->_currentNavigationUnit = (THNavigationUnit *)a3;
  }
  if (a4) {
    [(THNoteCardsController *)self p_rotateNoteCardInfosToContentNode:a4];
  }
  if (currentNavigationUnit == a3)
  {
    [(THNoteCardsController *)self p_reloadNoteCards];
  }
  else
  {
    -[THNoteCardsController p_unfilteredNoteCardInfosChangedMoveToRight:](self, "p_unfilteredNoteCardInfosChangedMoveToRight:");
  }
}

- (void)attachToView:(id)a3
{
  if (![a3 layer]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNoteCardsController attachToView:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNoteCardsController.m") lineNumber:237 description:@"can't attach to a view without a layer"];
  }
  [a3 insertSubview:self->_noteCardsView atIndex:0];
  self->_hostView = (UIView *)a3;
}

- (void)detachFromView:(id)a3
{
  self->_hostView = 0;
}

- (void)updateFrame:(CGRect)a3 insets:(UIEdgeInsets)a4 animated:(BOOL)a5 duration:(double)a6
{
  BOOL v6 = a5;
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  -[UIView setFrame:](self->_noteCardsView, "setFrame:");
  double v15 = width - (left + right);
  -[CALayer setFrame:](self->_noteCardsLayer, "setFrame:", x + left, y + top, v15, height - (top + bottom));
  THScaleNeededToFitSizeInSize(895.0, 614.0, self->_minCardSize.width, self->_minCardSize.height);
  THScaleNeededToFitSizeInSize(895.0, 614.0, self->_maxCardSize.width, self->_maxCardSize.height);
  THScaleNeededToFitSizeInSize(895.0, 614.0, v15, height - (top + bottom));
  TSUClamp();
  -[THNoteCardsController p_setScale:animated:duration:](self, "p_setScale:animated:duration:", v6);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  noteCards = self->_noteCards;
  id v17 = [(NSMutableArray *)noteCards countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v23;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v23 != v19) {
          objc_enumerationMutation(noteCards);
        }
        [*(id *)(*((void *)&v22 + 1) + 8 * i) updateTransformAnimated:v6 duration:a6];
      }
      id v18 = [(NSMutableArray *)noteCards countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v18);
  }
  [(THNoteCardsController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [(THNoteCardsControllerDelegate *)[(THNoteCardsController *)self delegate] noteCardsControllerUpdatedTopCardFrame:self];
  }
}

- (void)setDarkMode:(BOOL)a3
{
  if (self->_darkMode != a3)
  {
    BOOL v3 = a3;
    self->_darkMode = a3;
    if ([(THNoteCardsController *)self p_topNoteCard])
    {
      [(THNoteCardsController *)self p_makeTopCardNonInteractive];
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      noteCardInfos = self->_noteCardInfos;
      id v6 = [(NSMutableArray *)noteCardInfos countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v6)
      {
        id v7 = v6;
        uint64_t v8 = *(void *)v21;
        do
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(void *)v21 != v8) {
              objc_enumerationMutation(noteCardInfos);
            }
            [*(id *)(*((void *)&v20 + 1) + 8 * i) setDarkMode:v3];
          }
          id v7 = [(NSMutableArray *)noteCardInfos countByEnumeratingWithState:&v20 objects:v25 count:16];
        }
        while (v7);
      }
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      noteCards = self->_noteCards;
      id v11 = [(NSMutableArray *)noteCards countByEnumeratingWithState:&v16 objects:v24 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v17;
        do
        {
          for (j = 0; j != v12; j = (char *)j + 1)
          {
            if (*(void *)v17 != v13) {
              objc_enumerationMutation(noteCards);
            }
            double v15 = *(void **)(*((void *)&v16 + 1) + 8 * (void)j);
            [v15 setDarkMode:v3];
            if (objc_msgSend(objc_msgSend(v15, "frontLayer"), "hasBody")) {
              objc_msgSend(objc_msgSend(v15, "noteCardInfo"), "populateNoteCardFront:", objc_msgSend(v15, "frontLayer"));
            }
            if (objc_msgSend(objc_msgSend(v15, "backLayer"), "hasBody")) {
              objc_msgSend(objc_msgSend(v15, "noteCardInfo"), "populateNoteCardBack:", objc_msgSend(v15, "backLayer"));
            }
          }
          id v12 = [(NSMutableArray *)noteCards countByEnumeratingWithState:&v16 objects:v24 count:16];
        }
        while (v12);
      }
      [(THNoteCardsController *)self p_makeTopCardInteractive];
    }
  }
}

- (void)setScalingMode:(int)a3
{
  if (self->_scalingMode != a3)
  {
    self->_scalingMode = a3;
    if (a3 == 1)
    {
      [(THNoteCardsController *)self p_makeTopCardNonInteractive];
    }
    else if (!a3)
    {
      [(THNoteCardsController *)self p_setLayoutScale:self->_layoutScale * self->_dynamicScale];
      [(THNoteCardsController *)self p_setDynamicScale:1.0];
      [(THNoteCardsController *)self p_makeTopCardInteractive];
    }
  }
}

- (void)shuffleCards
{
}

- (BOOL)isShowingEmptyStudyCard
{
  id v2 = [(NSMutableArray *)self->_noteCardInfos firstObject];

  return [v2 isEmptyCard];
}

- (BOOL)canFlipTopCard
{
  id v2 = [(THNoteCardsController *)self p_topNoteCardInfo];

  return [v2 hasBackContent];
}

- (BOOL)isPointInsideTopCardFlipGlyph:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(THNoteCardsController *)self p_topNoteCard];
  [v6 convertPoint:x fromLayer:[self->_hostView layer]];

  return [v6 isPointInsideFlipGlyph:];
}

- (void)flipTopCard
{
  [(THNoteCardsController *)self p_handleDelayedCardUpdate];
  id v3 = [(THNoteCardsController *)self p_topNoteCard];
  id v4 = [(THNoteCardsController *)self p_topNoteCardInfo];
  if (([v4 hasBackContent] & 1) == 0) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNoteCardsController flipTopCard]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNoteCardsController.m") lineNumber:377 description:@"shouldn't be flipping a card with no back content"];
  }
  if (([v3 isFlipped] & 1) == 0
    && (objc_msgSend(objc_msgSend(v3, "backLayer"), "hasBody") & 1) == 0)
  {
    [v4 populateNoteCardBack:[v3 backLayer]];
  }

  [v3 flipAnimated:1 duration:0.5];
}

- (unint64_t)noteCardCount
{
  return (unint64_t)[(NSMutableArray *)self->_noteCardInfos count];
}

- (BOOL)showingMultipleCards
{
  id v3 = [(THNoteCardsController *)self p_topNoteCard];
  return v3 != [(THNoteCardsController *)self p_bottomNoteCard];
}

- (BOOL)isTopCardAtPoint:(CGPoint)a3
{
  -[CALayer convertPoint:fromLayer:](self->_noteCardsLayer, "convertPoint:fromLayer:", [(UIView *)self->_hostView layer], a3.x, a3.y);
  id v4 = -[THNoteCardsController p_noteCardForPoint:](self, "p_noteCardForPoint:");
  if (v4) {
    LOBYTE(v4) = v4 == [(THNoteCardsController *)self p_topNoteCard];
  }
  return (char)v4;
}

- (BOOL)isBottomCardAtPoint:(CGPoint)a3
{
  -[CALayer convertPoint:fromLayer:](self->_noteCardsLayer, "convertPoint:fromLayer:", [(UIView *)self->_hostView layer], a3.x, a3.y);
  double v5 = v4;
  double v7 = v6;
  id v8 = -[THNoteCardsController p_noteCardForPoint:](self, "p_noteCardForPoint:");
  id v9 = [(THNoteCardsController *)self p_bottomNoteCard];
  id v10 = v9;
  if (v8) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = v9 == 0;
  }
  if (!v11)
  {
    if (-[THNoteCardsController p_hitTest:noteCard:outset:](self, "p_hitTest:noteCard:outset:", v9, v5, v7, 0.0, 0.0, 30.0, 50.0))
    {
      id v8 = v10;
    }
    else
    {
      id v8 = 0;
    }
  }
  return v8 && v8 == v10;
}

- (unint64_t)bookPageIndexForTopCard
{
  objc_opt_class();
  [(THNoteCardsController *)self p_topNoteCardInfo];
  id v3 = (void *)TSUDynamicCast();
  if (!v3) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNoteCardsController bookPageIndexForTopCard]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNoteCardsController.m") lineNumber:425 description:@"trying to get the page for a non annotation card info."];
  }

  return (unint64_t)[v3 pageIndex];
}

- (void)animateTopCardToBottomInDirection:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (self->_dragOffset.x != CGPointZero.x || self->_dragOffset.y != CGPointZero.y) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNoteCardsController animateTopCardToBottomInDirection:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNoteCardsController.m") lineNumber:432 description:@"need to reset _dragOffset here"];
  }
  [(THNoteCardsController *)self p_handleDelayedCardUpdate];
  id v7 = [(THNoteCardsController *)self p_topNoteCard];
  if (v7)
  {
    -[THNoteCardsController p_animateCardToTopOrBottom:direction:duration:](self, "p_animateCardToTopOrBottom:direction:duration:", v7, x, y, 0.600000024);
  }
}

- (void)animateBottomCardToTopInDirection:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (self->_dragOffset.x != CGPointZero.x || self->_dragOffset.y != CGPointZero.y) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNoteCardsController animateBottomCardToTopInDirection:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNoteCardsController.m") lineNumber:445 description:@"need to reset _dragOffset here"];
  }
  [(THNoteCardsController *)self p_handleDelayedCardUpdate];
  id v7 = [(THNoteCardsController *)self p_bottomNoteCard];
  if (v7)
  {
    -[THNoteCardsController p_animateCardToTopOrBottom:direction:duration:](self, "p_animateCardToTopOrBottom:direction:duration:", v7, x, y, 0.600000024);
  }
}

- (void)beginDragAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(THNoteCardsController *)self p_handleDelayedCardUpdate];
  -[CALayer convertPoint:fromLayer:](self->_noteCardsLayer, "convertPoint:fromLayer:", [(UIView *)self->_hostView layer], x, y);
  double v7 = v6;
  double v9 = v8;
  id v10 = (THNoteCardLayer *)-[THNoteCardsController p_noteCardForPoint:](self, "p_noteCardForPoint:");
  self->_draggingNoteCard = v10;
  -[THNoteCardLayer convertPoint:fromLayer:](v10, "convertPoint:fromLayer:", self->_noteCardsLayer, v7, v9);
  [(THNoteCardLayer *)self->_draggingNoteCard bounds];
  TSDCenterOfRect();
  TSDSubtractPoints();
  draggingNoteCard = self->_draggingNoteCard;

  -[THNoteCardLayer setDragAnchor:](draggingNoteCard, "setDragAnchor:");
}

- (void)beginDraggingTopCardAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(THNoteCardsController *)self p_handleDelayedCardUpdate];
  -[CALayer convertPoint:fromLayer:](self->_noteCardsLayer, "convertPoint:fromLayer:", [(UIView *)self->_hostView layer], x, y);
  double v7 = v6;
  double v9 = v8;
  id v10 = (THNoteCardLayer *)[(THNoteCardsController *)self p_topNoteCard];
  self->_draggingNoteCard = v10;
  -[THNoteCardLayer convertPoint:fromLayer:](v10, "convertPoint:fromLayer:", self->_noteCardsLayer, v7, v9);
  [(THNoteCardLayer *)self->_draggingNoteCard bounds];
  TSDCenterOfRect();
  TSDSubtractPoints();
  draggingNoteCard = self->_draggingNoteCard;

  -[THNoteCardLayer setDragAnchor:](draggingNoteCard, "setDragAnchor:");
}

- (void)beginDraggingBottomCardAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(THNoteCardsController *)self p_handleDelayedCardUpdate];
  -[CALayer convertPoint:fromLayer:](self->_noteCardsLayer, "convertPoint:fromLayer:", [(UIView *)self->_hostView layer], x, y);
  double v7 = v6;
  double v9 = v8;
  id v10 = (THNoteCardLayer *)[(THNoteCardsController *)self p_bottomNoteCard];
  self->_draggingNoteCard = v10;
  -[THNoteCardLayer convertPoint:fromLayer:](v10, "convertPoint:fromLayer:", self->_noteCardsLayer, v7, v9);
  [(THNoteCardLayer *)self->_draggingNoteCard bounds];
  TSDCenterOfRect();
  TSDSubtractPoints();
  draggingNoteCard = self->_draggingNoteCard;

  -[THNoteCardLayer setDragAnchor:](draggingNoteCard, "setDragAnchor:");
}

- (void)handleTopCardPageNumberHovered:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [[self p_topNoteCard] upwardFacingLayer];

  [v4 setPageNumberHovered:v3];
}

- (void)handleTopCardPageNumberPressed:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [self p_topNoteCard].upwardFacingLayer;

  [v4 setPageNumberPressed:v3];
}

- (BOOL)isTopCardPageNumberPressed
{
  id v2 = [self p_topNoteCard].upwardFacingLayer;

  return [v2 pageNumberPressed];
}

- (void)handleTopCardFlipAffordanceHovered:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [[self p_topNoteCard] upwardFacingLayer];

  [v4 setFlipAffordanceHovered:v3];
}

- (void)handleTopCardFlipAffordancePressed:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [[self p_topNoteCard] upwardFacingLayer];

  [v4 setFlipAffordancePressed:v3];
}

- (BOOL)isTopCardFlipAffordancePressed
{
  id v2 = [[self p_topNoteCard] upwardFacingLayer];

  return [v2 flipAffordancePressed];
}

- (void)setDragOffset:(CGPoint)a3
{
  self->_dragOffset = a3;
  -[THNoteCardLayer setDragOffset:](self->_draggingNoteCard, "setDragOffset:", a3.x / self->_dynamicScale, a3.y / self->_dynamicScale);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  noteCards = self->_noteCards;
  id v5 = [(NSMutableArray *)noteCards countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(noteCards);
        }
        double v9 = *(THNoteCardLayer **)(*((void *)&v10 + 1) + 8 * i);
        if (v9 != self->_draggingNoteCard) {
          [(THNoteCardLayer *)v9 updateTransformAnimated:0 duration:0.0];
        }
      }
      id v6 = [(NSMutableArray *)noteCards countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  if ([(THNoteCardLayer *)self->_draggingNoteCard isTopCard])
  {
    if (![(THNoteCardLayer *)self->_draggingNoteCard poppedState]) {
      [(THNoteCardLayer *)self->_draggingNoteCard popAnimated:1 duration:0.150000006];
    }
  }
}

- (void)endDragInDirection:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  self->_dragOffset = CGPointZero;
  if ([(THNoteCardLayer *)self->_draggingNoteCard draggedPastThreshold]
    && [(THNoteCardsController *)self showingMultipleCards])
  {
    -[THNoteCardsController p_completeDragInDirection:animationDuration:](self, "p_completeDragInDirection:animationDuration:", x, y, 0.600000024);
  }
  else
  {
    [(THNoteCardsController *)self p_cancelDragAnimated:1 duration:0.300000012];
  }
  if ([(THNoteCardLayer *)self->_draggingNoteCard poppedState] == 3
    || [(THNoteCardLayer *)self->_draggingNoteCard poppedState] == 1)
  {
    [(THNoteCardLayer *)self->_draggingNoteCard unpopAnimated:1 duration:0.150000006];
  }

  self->_draggingNoteCard = 0;
}

- (void)forceSwipeInDirection:(CGPoint)a3
{
  self->_dragOffset = CGPointZero;
  -[THNoteCardsController p_completeDragInDirection:animationDuration:](self, "p_completeDragInDirection:animationDuration:", a3.x, a3.y, 0.600000024);
  if ([(THNoteCardLayer *)self->_draggingNoteCard poppedState] == 3
    || [(THNoteCardLayer *)self->_draggingNoteCard poppedState] == 1)
  {
    [(THNoteCardLayer *)self->_draggingNoteCard unpopAnimated:1 duration:0.150000006];
  }

  self->_draggingNoteCard = 0;
}

- (BOOL)draggingTopCard
{
  draggingNoteCard = self->_draggingNoteCard;
  return draggingNoteCard == [(THNoteCardsController *)self p_topNoteCard];
}

- (CGRect)frameForTopCardPageNumberInHostView
{
  id v3 = [self p_topNoteCard].upwardFacingLayer;
  id v4 = [(UIView *)self->_hostView layer];
  [v3 pageNumberLabelFrame];

  -[CALayer convertRect:fromLayer:](v4, "convertRect:fromLayer:", v3);
  result.size.double height = v8;
  result.size.double width = v7;
  result.origin.double y = v6;
  result.origin.double x = v5;
  return result;
}

- (CGRect)frameForTopCardFlipGlyphInHostView
{
  id v3 = [[self p_topNoteCard] upwardFacingLayer];
  id v4 = [(UIView *)self->_hostView layer];
  [v3 flipGlyphFrame];

  -[CALayer convertRect:fromLayer:](v4, "convertRect:fromLayer:", v3);
  result.size.double height = v8;
  result.size.double width = v7;
  result.origin.double y = v6;
  result.origin.double x = v5;
  return result;
}

- (CGRect)frameForTopCardInHostView
{
  id v3 = [self p_topNoteCard].upwardFacingLayer;
  id v4 = [(UIView *)self->_hostView layer];
  [v3 frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  id v13 = [v3 superlayer];

  -[CALayer convertRect:fromLayer:](v4, "convertRect:fromLayer:", v13, v6, v8, v10, v12);
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (CGRect)frameForBottomCardInHostView
{
  id v3 = [[self p_bottomNoteCard] upwardFacingLayer];
  id v4 = [(UIView *)self->_hostView layer];
  [v3 frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  id v13 = [v3 superlayer];

  -[CALayer convertRect:fromLayer:](v4, "convertRect:fromLayer:", v13, v6, v8, v10, v12);
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (void)p_cancelDragAnimated:(BOOL)a3 duration:(double)a4
{
  BOOL v5 = a3;
  -[THNoteCardLayer cancelDragAnimated:duration:](self->_draggingNoteCard, "cancelDragAnimated:duration:");
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  noteCards = self->_noteCards;
  id v8 = [(NSMutableArray *)noteCards countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(noteCards);
        }
        double v12 = *(THNoteCardLayer **)(*((void *)&v13 + 1) + 8 * i);
        if (v12 != self->_draggingNoteCard) {
          [(THNoteCardLayer *)v12 updateTransformAnimated:v5 duration:a4];
        }
      }
      id v9 = [(NSMutableArray *)noteCards countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)p_handleDelayedCardUpdate
{
  delayedUpdateNoteCardIndedouble x = self->_delayedUpdateNoteCardIndex;
  if (delayedUpdateNoteCardIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(THNoteCardsController *)self p_reloadNoteCardAtIndex:delayedUpdateNoteCardIndex noteCards:self->_noteCards noteCardInfos:self->_noteCardInfos];
    self->_delayedUpdateNoteCardIndedouble x = 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (void)p_resetFlipOnBelowTopCard
{
  id v3 = (char *)[(NSMutableArray *)self->_noteCards count];
  if ((unint64_t)v3 >= 2 && v3 - 2 != (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = -[NSMutableArray objectAtIndex:](self->_noteCards, "objectAtIndex:");
    if ([v5 isFlipped])
    {
      [v5 setFlipped:0];
    }
  }
}

- (void)p_completeDragInDirection:(CGPoint)a3 animationDuration:(double)a4
{
}

- (id)topScrollView
{
  return self->_topScrollView;
}

- (void)zoomOutAndFadeCards:(BOOL)a3 duration:(double)a4
{
  BOOL v5 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  double v6 = [(THNoteCardsController *)self noteCards];
  id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v10);
        if (v5)
        {
          [*(id *)(*((void *)&v15 + 1) + 8 * (void)v10) setScaleFactor:1 darkerBackground:0 animated:0.85 duration:a4];
          double v12 = 1.0;
          long long v13 = v11;
          uint64_t v14 = 0;
        }
        else
        {
          long long v13 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v10);
          double v12 = 0.85;
          uint64_t v14 = 1;
        }
        [v13 setScaleFactor:v14 darkerBackground:1 animated:v12 duration:a4];
        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
}

- (unint64_t)noteCardLayerCount
{
  unint64_t result = (unint64_t)[(NSMutableArray *)self->_noteCards count];
  if (result >= 4) {
    return 4;
  }
  return result;
}

- (BOOL)topNoteCardIsFlipped
{
  id v2 = [(THNoteCardsController *)self p_topNoteCard];

  return [v2 isFlipped];
}

- (BOOL)isDraggingTopCard
{
  draggingNoteCard = self->_draggingNoteCard;
  if (draggingNoteCard) {
    LOBYTE(draggingNoteCard) = [(THNoteCardLayer *)draggingNoteCard isTopCard];
  }
  return (char)draggingNoteCard;
}

- (CGPoint)dragOffset
{
  double x = self->_dragOffset.x;
  double y = self->_dragOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)shuffleOffset:(BOOL)a3
{
  BOOL v3 = a3;
  [(UIView *)self->_hostView bounds];
  double Width = CGRectGetWidth(v7);
  if (v3) {
    double Width = -Width;
  }
  double v5 = 0.0;
  result.double y = v5;
  result.double x = Width;
  return result;
}

- (double)offscreenNoteDistance
{
  [(UIView *)self->_hostView bounds];
  return CGRectGetWidth(v4) / self->_dynamicScale;
}

- (void)noteCardWillUnsettle:(id)a3
{
  if ([a3 isTopCard])
  {
    [(THNoteCardsController *)self p_makeTopCardNonInteractive];
  }
}

- (void)noteCardDidSettle:(id)a3
{
  if ([a3 isTopCard])
  {
    [(THNoteCardsController *)self p_makeTopCardInteractive];
  }
}

- (void)studyOptionsWillChangeShuffle:(id)a3
{
  if (!self->_isShufflingCards) {
    [(THNoteCardsController *)self p_recreateNoteCardLayers];
  }
}

- (void)studyOptionsDidChangeShuffle:(id)a3
{
  if ((unint64_t)[(NSMutableArray *)self->_noteCardInfos count] >= 2 && !self->_isShufflingCards)
  {
    self->_isShufflingCards = 1;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1CF474;
    v5[3] = &unk_458E48;
    unsigned __int8 v6 = [(THStudyOptions *)[(THNoteCardsController *)self studyOptions] shuffle];
    v5[4] = self;
    v5[5] = a3;
    [(THNoteCardsController *)self p_reflectShuffleOptionsChangeWithCompletionBlock:v5];
  }
}

- (void)studyOptionsDidChangeFilterOptions:(id)a3
{
}

- (void)p_reloadNoteCardInfosFromNavigationUnit:(id)a3
{
  self->_unfilteredNoteCardInfos = 0;
  double v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  long long v24 = [(THDocumentRoot *)self->_documentRoot annotationController];
  long long v25 = self;
  unsigned __int8 v6 = [(THDocumentRoot *)self->_documentRoot glossaryController];
  id v7 = [a3 contentNodes];
  id v8 = [(THGlossaryController *)v6 model];
  id v26 = +[NSMutableSet set];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v7;
  id v9 = [v7 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v9)
  {
    uint64_t v10 = 0;
    uint64_t v23 = *(void *)v34;
    do
    {
      double v11 = 0;
      do
      {
        if (*(void *)v34 != v23) {
          objc_enumerationMutation(obj);
        }
        double v12 = *(void **)(*((void *)&v33 + 1) + 8 * (void)v11);
        long long v13 = (void *)THBundle();
        if ((char *)v11 + v10) {
          uint64_t v14 = +[NSString stringWithFormat:@"SECTION: %lu \\U2014 %@" value:&stru_46D7E8 table:0], (char *)v11 + v10, [v12 title]);
        }
        else {
          uint64_t v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", [v13 localizedStringForKey:@"%@" value:&stru_46D7E8 table:0], objc_msgSend(v12, "title"));
        }
        long long v15 = v14;
        id v16 = [(THAnnotationStorageController *)v24 cachedAnnotationsForContentNode:v12];
        v32[0] = 0;
        v32[1] = v32;
        v32[2] = 0x3052000000;
        v32[3] = sub_1CF8F4;
        v32[4] = sub_1CF904;
        v32[5] = 0;
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472;
        v31[2] = sub_1CF910;
        v31[3] = &unk_45B000;
        v31[7] = v5;
        v31[8] = v32;
        v31[4] = v12;
        v31[5] = v25;
        v31[6] = v15;
        [v16 enumerateAnnotationsWithBlock:v31];
        [v26 addObjectsFromArray:[self pathsForEntriesInContentNode:v12]];
        _Block_object_dispose(v32, 8);
        double v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
      v10 += (uint64_t)v11;
    }
    while (v9);
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v17 = [v26 countByEnumeratingWithState:&v27 objects:v37 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v28;
    do
    {
      long long v19 = 0;
      do
      {
        if (*(void *)v28 != v18) {
          objc_enumerationMutation(v26);
        }
        id v20 = [(THModelGlossary *)v8 entryForPath:*(void *)(*((void *)&v27 + 1) + 8 * (void)v19)];
        long long v21 = objc_alloc_init(THGlossaryNoteCardInfo);
        [(THGlossaryNoteCardInfo *)v21 setGlossaryEntry:v20];
        -[THGlossaryNoteCardInfo setTitle:](v21, "setTitle:", [(id)THBundle() localizedStringForKey:@"GLOSSARY TERM" value:&stru_46D7E8 table:0]);
        -[THGlossaryNoteCardInfo setBackTitle:](v21, "setBackTitle:", [(id)THBundle() localizedStringForKey:@"DEFINITION" value:&stru_46D7E8 table:0]);
        [(NSMutableArray *)v5 addObject:v21];

        long long v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      id v17 = [v26 countByEnumeratingWithState:&v27 objects:v37 count:16];
    }
    while (v17);
  }
  v25->_unfilteredNoteCardInfos = v5;
  [(THNoteCardsController *)v25 p_updateNoteCardOrder];
}

- (void)p_rotateNoteCardInfosToContentNode:(id)a3
{
  CGRect v4 = +[NSSet setWithArray:](NSSet, "setWithArray:", objc_msgSend(-[THAnnotationStorageController cachedAnnotationsForContentNode:](-[THDocumentRoot annotationController](self->_documentRoot, "annotationController"), "cachedAnnotationsForContentNode:", a3), "highlightAnnotations"));
  if ([(NSSet *)v4 count] && [(NSMutableArray *)self->_unfilteredNoteCardInfos count])
  {
    unint64_t v5 = 0;
    do
    {
      id v6 = [(NSMutableArray *)self->_unfilteredNoteCardInfos lastObject];
      objc_opt_class();
      id v7 = (void *)TSUDynamicCast();
      if (v7 && -[NSSet containsObject:](v4, "containsObject:", [v7 annotation])) {
        break;
      }
      [(NSMutableArray *)self->_unfilteredNoteCardInfos insertObject:v6 atIndex:0];
      [(NSMutableArray *)self->_unfilteredNoteCardInfos removeLastObject];
      ++v5;
    }
    while (v5 < (unint64_t)[(NSMutableArray *)self->_unfilteredNoteCardInfos count]);
  }
}

- (void)p_updateNoteCardOrder
{
  unsigned int v3 = [(THStudyOptions *)self->_options shuffle];
  unfilteredNoteCardInfos = self->_unfilteredNoteCardInfos;
  if (v3)
  {
    [(NSMutableArray *)unfilteredNoteCardInfos shuffle];
  }
  else
  {
    [(NSMutableArray *)unfilteredNoteCardInfos sortUsingComparator:&stru_45B040];
  }
}

- (void)p_rebuildNoteCardInfos
{
  [(NSMutableArray *)self->_noteCardInfos removeAllObjects];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  unfilteredNoteCardInfos = self->_unfilteredNoteCardInfos;
  id v4 = [(NSMutableArray *)unfilteredNoteCardInfos countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(unfilteredNoteCardInfos);
        }
        id v8 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ([v8 shouldShowWithStudyOptions:self->_options]) {
          [(NSMutableArray *)self->_noteCardInfos addObject:v8];
        }
      }
      id v5 = [(NSMutableArray *)unfilteredNoteCardInfos countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v5);
  }
  if (![(NSMutableArray *)self->_noteCardInfos count])
  {
    id v9 = objc_alloc_init(THEmptyNoteCardInfo);
    [(THEmptyNoteCardInfo *)v9 setStudyOptions:self->_options];
    [(THEmptyNoteCardInfo *)v9 setIsUnfilteredContentAvailable:[(NSMutableArray *)self->_unfilteredNoteCardInfos count] != 0];
    [(NSMutableArray *)self->_noteCardInfos addObject:v9];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  noteCardInfos = self->_noteCardInfos;
  id v11 = [(NSMutableArray *)noteCardInfos countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(noteCardInfos);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * (void)j) setDarkMode:self->_darkMode];
      }
      id v12 = [(NSMutableArray *)noteCardInfos countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }

  self->_noteCardInfosUnrotated = (NSArray *)[(NSMutableArray *)self->_noteCardInfos copy];
}

- (id)p_noteCardsForInfos:(id)a3
{
  id v5 = objc_alloc_init((Class)NSMutableArray);
  id v6 = [a3 count];
  if ((unint64_t)v6 >= 4) {
    uint64_t v7 = 4;
  }
  else {
    uint64_t v7 = (uint64_t)v6;
  }
  for (; v7; --v7)
  {
    id v8 = [(THNoteCardsController *)self p_createNewNoteCardLayer];
    [v8 setCardIndex:[v5 count]];
    [v5 addObject:v8];
  }
  [(THNoteCardsController *)self p_reloadNoteCardAtIndex:3 noteCards:v5 noteCardInfos:a3];
  [(THNoteCardsController *)self p_reloadNoteCardAtIndex:2 noteCards:v5 noteCardInfos:a3];
  [(THNoteCardsController *)self p_reloadNoteCardAtIndex:1 noteCards:v5 noteCardInfos:a3];
  [(THNoteCardsController *)self p_reloadNoteCardAtIndex:0 noteCards:v5 noteCardInfos:a3];

  return v5;
}

- (void)p_recreateNoteCardLayers
{
  [(NSMutableArray *)self->_noteCards removeAllObjects];
  [(NSArray *)[(CALayer *)self->_noteCardsLayer sublayers] makeObjectsPerformSelector:"removeFromSuperlayer"];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  unsigned int v3 = [(NSMapTable *)self->_interactiveViewsToLayers keyEnumerator];
  id v4 = [(NSEnumerator *)v3 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v30;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v30 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v29 + 1) + 8 * i) removeFromSuperview];
      }
      id v5 = [(NSEnumerator *)v3 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v5);
  }
  [(NSMapTable *)self->_interactiveViewsToLayers removeAllObjects];
  id v8 = [(THNoteCardsController *)self p_noteCardsForInfos:self->_noteCardInfos];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v25 objects:v34 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      for (j = 0; j != v10; j = (char *)j + 1)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v25 + 1) + 8 * (void)j);
        [(NSMutableArray *)self->_noteCards addObject:v13];
        [(CALayer *)self->_noteCardsLayer addSublayer:v13];
      }
      id v10 = [v8 countByEnumeratingWithState:&v25 objects:v34 count:16];
    }
    while (v10);
  }
  if ([(NSMutableArray *)self->_noteCards count])
  {
    unint64_t v14 = 0;
    do
    {
      [self->_noteCards objectAtIndex:v14].setCardIndex:v14;
      ++v14;
    }
    while (v14 < (unint64_t)[(NSMutableArray *)self->_noteCards count]);
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  noteCards = self->_noteCards;
  id v16 = [(NSMutableArray *)noteCards countByEnumeratingWithState:&v21 objects:v33 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v22;
    double y = CGPointZero.y;
    do
    {
      for (k = 0; k != v17; k = (char *)k + 1)
      {
        if (*(void *)v22 != v18) {
          objc_enumerationMutation(noteCards);
        }
        [*(id *)(*((void *)&v21 + 1) + 8 * (void)k) setDragAnchor:CGPointZero.x, y];
      }
      id v17 = [(NSMutableArray *)noteCards countByEnumeratingWithState:&v21 objects:v33 count:16];
    }
    while (v17);
  }
  [(THNoteCardsController *)self noteCardDidSettle:[(THNoteCardsController *)self p_topNoteCard]];
}

- (void)p_reloadNoteCards
{
  [(THNoteCardsController *)self p_rebuildNoteCardInfos];

  [(THNoteCardsController *)self p_recreateNoteCardLayers];
}

- (void)p_populateNoteCard:(id)a3 withInfo:(id)a4
{
  if ([a3 isFlipped]) {
    [a3 setFlipped:0];
  }
  objc_msgSend(objc_msgSend(a3, "frontLayer"), "clearContents");
  objc_msgSend(objc_msgSend(a3, "backLayer"), "clearContents");
  [a4 populateNoteCardFront:[a3 frontLayer]];
  [a3 setNoteCardInfo:a4];
  if (([a4 isEmptyCard] & 1) == 0)
  {
    uint64_t v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", [(id)THBundle() localizedStringForKey:@"%lu of %lu" value:&stru_46D7E8 table:0], (unsigned char *)-[NSArray count](self->_noteCardInfosUnrotated, "count")- (unsigned char *)-[NSArray indexOfObject:](self->_noteCardInfosUnrotated, "indexOfObject:", a4), -[THNoteCardsController noteCardCount](self, "noteCardCount"));
    objc_msgSend(objc_msgSend(a3, "frontLayer"), "setCardNumberString:", v7);
    id v8 = [a3 backLayer];
    [v8 setCardNumberString:v7];
  }
}

- (void)p_reloadNoteCardAtIndex:(int)a3 noteCards:(id)a4 noteCardInfos:(id)a5
{
  id v9 = [a5 count];
  if (v9 < [a4 count]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNoteCardsController p_reloadNoteCardAtIndex:noteCards:noteCardInfos:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNoteCardsController.m") lineNumber:1075 description:@"should have at least as many note card infos as layers"];
  }
  id v10 = [a4 count];
  id v11 = [a5 count];
  switch(a3)
  {
    case 0:
      if (v10) {
        uint64_t v12 = 0;
      }
      else {
        uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
      }
      if (v11) {
        uint64_t v13 = 0;
      }
      else {
        uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
      }
      goto LABEL_28;
    case 1:
      if ((unint64_t)v10 > 1) {
        uint64_t v12 = 1;
      }
      else {
        uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
      }
      if ((unint64_t)v11 > 1) {
        uint64_t v13 = 1;
      }
      else {
        uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
      }
      goto LABEL_28;
    case 2:
      if ((unint64_t)v10 <= 1) {
        uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        uint64_t v12 = (uint64_t)v10 - 2;
      }
      if ((unint64_t)v11 <= 1) {
        uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        uint64_t v13 = (uint64_t)v11 - 2;
      }
      goto LABEL_28;
    case 3:
      if (v10) {
        uint64_t v12 = (uint64_t)v10 - 1;
      }
      else {
        uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
      }
      if (v11) {
        uint64_t v13 = (uint64_t)v11 - 1;
      }
      else {
        uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
      }
LABEL_28:
      if (v12 == 0x7FFFFFFFFFFFFFFFLL || v13 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (v12 != v13)
        {
          id v16 = +[TSUAssertionHandler currentHandler];
          id v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNoteCardsController p_reloadNoteCardAtIndex:noteCards:noteCardInfos:]");
          uint64_t v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNoteCardsController.m"];
          [v16 handleFailureInFunction:v17 file:v18 lineNumber:1114 description:@"indexes should both be valid or invalid at the same time"];
        }
      }
      else
      {
        id v14 = [a4 objectAtIndex:];
        id v15 = [a5 objectAtIndex:v13];
        [(THNoteCardsController *)self p_populateNoteCard:v14 withInfo:v15];
      }
      break;
    default:
      return;
  }
}

- (CATransform3D)p_perspectiveTransformWithScale:(SEL)a3
{
  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m43 = 0u;
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  *(_OWORD *)&retstr->m23 = 0u;
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m13 = 0u;
  CGPoint result = CATransform3DMakeScale(retstr, a4, a4, 1.0);
  retstr->m34 = -0.000285714286;
  return result;
}

- (void)p_setScale:(double)a3 animated:(BOOL)a4 duration:(double)a5
{
  int scalingMode = self->_scalingMode;
  if (scalingMode == 1)
  {
    double v9 = a3 / self->_layoutScale;
    [(THNoteCardsController *)self p_setDynamicScale:a4 animated:v9 duration:a5];
  }
  else if (!scalingMode)
  {
    if (a4) {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3, a5) handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNoteCardsController p_setScale:animated:duration:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNoteCardsController.m") lineNumber:1138 description:@"should not animate note cards when in Layout mode"];
    }
    double v8 = a3 / self->_dynamicScale;
    -[THNoteCardsController p_setLayoutScale:](self, "p_setLayoutScale:", v8, a5);
  }
}

- (void)p_setLayoutScale:(double)a3
{
  double layoutScale = self->_layoutScale;
  if (layoutScale != a3 && vabdd_f64(layoutScale, a3) >= fabs(a3 * 0.000000999999997))
  {
    self->_double layoutScale = a3;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    noteCards = self->_noteCards;
    id v6 = [(NSMutableArray *)noteCards countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(noteCards);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * i) setLayoutContext:[THNoteCardLayoutContext contextWithScale:hostView:self->_noteCardsView, self->_layoutScale]];
        }
        id v7 = [(NSMutableArray *)noteCards countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)p_setDynamicScale:(double)a3
{
}

- (void)p_setDynamicScale:(double)a3 animated:(BOOL)a4 duration:(double)a5
{
  BOOL v6 = a4;
  self->_dynamicScale = a3;
  long long v9 = 0uLL;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  noteCardsLayer = self->_noteCardsLayer;
  if (noteCardsLayer)
  {
    [(CALayer *)noteCardsLayer sublayerTransform];
    long long v9 = 0uLL;
  }
  long long v27 = v9;
  long long v28 = v9;
  long long v25 = v9;
  long long v26 = v9;
  long long v23 = v9;
  long long v24 = v9;
  long long v21 = v9;
  long long v22 = v9;
  [(THNoteCardsController *)self p_perspectiveTransformWithScale:a3];
  v20[4] = v25;
  v20[5] = v26;
  v20[6] = v27;
  v20[7] = v28;
  v20[0] = v21;
  v20[1] = v22;
  v20[2] = v23;
  v20[3] = v24;
  [(CALayer *)self->_noteCardsLayer setSublayerTransform:v20];
  if (v6)
  {
    long long v11 = +[CABasicAnimation animationWithKeyPath:@"sublayerTransform"];
    long long v16 = v33;
    long long v17 = v34;
    long long v18 = v35;
    long long v19 = v36;
    long long v12 = v29;
    long long v13 = v30;
    long long v14 = v31;
    long long v15 = v32;
    [(CABasicAnimation *)v11 setFromValue:+[NSValue valueWithCATransform3D:&v12]];
    long long v16 = v25;
    long long v17 = v26;
    long long v18 = v27;
    long long v19 = v28;
    long long v12 = v21;
    long long v13 = v22;
    long long v14 = v23;
    long long v15 = v24;
    [(CABasicAnimation *)v11 setToValue:+[NSValue valueWithCATransform3D:&v12]];
    [(CABasicAnimation *)v11 setDuration:a5];
    [(CABasicAnimation *)v11 setTimingFunction:+[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [(CALayer *)self->_noteCardsLayer addAnimation:v11 forKey:@"noteCardsLayerSublayerTransform"];
  }
}

- (id)p_createNewNoteCardLayer
{
  unsigned int v3 = [[THNoteCardLayer alloc] initWithDelegate:self darkMode:self->_darkMode];
  [(THNoteCardLayer *)v3 setLayoutContext:+[THNoteCardLayoutContext contextWithScale:self->_noteCardsView hostView:self->_layoutScale]];
  return v3;
}

- (BOOL)p_hitTest:(CGPoint)a3 noteCard:(id)a4 outset:(UIEdgeInsets)a5
{
  double right = a5.right;
  double bottom = a5.bottom;
  double left = a5.left;
  double top = a5.top;
  [a4 convertPoint:self->_noteCardsLayer x:a3.x y:a3.y];
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  [a4 bounds];
  double v15 = v14 - left;
  double v17 = v16 - top;
  double v19 = left + right + v18;
  double v21 = top + bottom + v20;
  uint64_t v22 = v11;
  uint64_t v23 = v13;

  return CGRectContainsPoint(*(CGRect *)&v15, *(CGPoint *)&v22);
}

- (id)p_noteCardForPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v6 = [(NSArray *)[(CALayer *)self->_noteCardsLayer sublayers] reverseObjectEnumerator];
  id result = [(NSEnumerator *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (result)
  {
    id v8 = result;
    uint64_t v9 = *(void *)v13;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v13 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
      [v11 convertPoint:self->_noteCardsLayer fromLayer:x, y];
      if (objc_msgSend(v11, "containsPoint:"))
      {
        objc_opt_class();
        id result = (id)TSUDynamicCast();
        if (result) {
          break;
        }
      }
      if (v8 == (id)++v10)
      {
        id result = [(NSEnumerator *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
        id v8 = result;
        if (result) {
          goto LABEL_3;
        }
        return result;
      }
    }
  }
  return result;
}

- (id)p_topNoteCard
{
  return [(NSMutableArray *)self->_noteCards lastObject];
}

- (id)p_bottomNoteCard
{
  return [(NSMutableArray *)self->_noteCards firstObject];
}

- (id)p_topNoteCardInfo
{
  return [(NSMutableArray *)self->_noteCardInfos lastObject];
}

- (id)p_noteCardAtIndex:(int)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  noteCards = self->_noteCards;
  id v5 = [(NSMutableArray *)noteCards countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v5) {
    return 0;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v13;
  unint64_t v8 = a3;
LABEL_3:
  uint64_t v9 = 0;
  while (1)
  {
    if (*(void *)v13 != v7) {
      objc_enumerationMutation(noteCards);
    }
    uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
    if ([v10 cardIndex] == (id)v8) {
      return v10;
    }
    if (v6 == (id)++v9)
    {
      id v6 = [(NSMutableArray *)noteCards countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (void)p_animateCardToTopOrBottom:(id)a3 direction:(CGPoint)a4 duration:(double)a5
{
  double y = a4.y;
  double x = a4.x;
  if ([(THNoteCardsController *)self p_topNoteCard] != a3
    && [(THNoteCardsController *)self p_bottomNoteCard] != a3)
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNoteCardsController p_animateCardToTopOrBottom:direction:duration:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNoteCardsController.m") lineNumber:1260 description:@"shouldn't complete dragging anything other than the top or bottom note cards"];
  }
  id v10 = [(THNoteCardsController *)self p_topNoteCard];
  [self p_topNoteCard].reset;
  noteCards = self->_noteCards;
  if (v10 == a3)
  {
    [(NSMutableArray *)noteCards moveLastObjectToFirst];
    [(NSMutableArray *)self->_noteCardInfos moveLastObjectToFirst];
    unint64_t v12 = 2;
  }
  else
  {
    [(NSMutableArray *)noteCards moveFirstObjectToLast];
    [(NSMutableArray *)self->_noteCardInfos moveFirstObjectToLast];
    unint64_t v12 = 1;
  }
  self->_delayedUpdateNoteCardIndedouble x = v12;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v13 = self->_noteCards;
  id v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = 0;
    uint64_t v17 = *(void *)v26;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v13);
        }
        double v19 = (char *)i + v16;
        id v20 = *(id *)(*((void *)&v25 + 1) + 8 * i);
        if (v20 == a3)
        {
          v24[0] = _NSConcreteStackBlock;
          v24[1] = 3221225472;
          v24[2] = sub_1D1088;
          v24[3] = &unk_456DE0;
          v24[4] = self;
          [a3 completeDragInDirection:v19 newCardIndex:1 animated:v24 duration:x completion:y a5];
          if (v10 == a3) {
            id v21 = 0;
          }
          else {
            id v21 = [(NSMutableArray *)self->_noteCards count];
          }
          [(CALayer *)self->_noteCardsLayer insertSublayer:a3 atIndex:v21];
        }
        else
        {
          [v20 setCardIndex:v19 animated:1 duration:a5 * 0.5];
        }
      }
      id v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
      v16 += (uint64_t)i;
    }
    while (v15);
  }
  id v22 = [(THNoteCardsController *)self p_topNoteCard];
  if (v22 != [(NSArray *)[(CALayer *)self->_noteCardsLayer sublayers] lastObject]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNoteCardsController p_animateCardToTopOrBottom:direction:duration:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNoteCardsController.m") lineNumber:1304 description:@"note cards are out of order"];
  }
  id v23 = [(THNoteCardsController *)self p_bottomNoteCard];
  if (v23 != [(NSArray *)[(CALayer *)self->_noteCardsLayer sublayers] firstObject]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNoteCardsController p_animateCardToTopOrBottom:direction:duration:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNoteCardsController.m") lineNumber:1305 description:@"note cards are out of order"];
  }
}

- (void)p_filterOptionsChanged
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self);
  id v3 = [(NSMutableArray *)self->_noteCardInfos copy];
  [(THNoteCardsController *)self p_rebuildNoteCardInfos];
  id v4 = objc_alloc_init((Class)NSMutableArray);
  id v5 = objc_alloc_init((Class)NSMutableArray);
  id v100 = objc_alloc_init((Class)NSMutableArray);
  if ([v3 count] == (char *)&dword_0 + 1
    && [(NSMutableArray *)self->_noteCardInfos count] == (char *)&dword_0 + 1)
  {
    objc_opt_class();
    [v3 firstObject];
    BOOL v6 = TSUDynamicCast() != 0;
    objc_opt_class();
    [(NSMutableArray *)self->_noteCardInfos firstObject];
    uint64_t v7 = TSUDynamicCast();
    if (v7) {
      BOOL v8 = 0;
    }
    else {
      BOOL v8 = v6;
    }
    int v101 = v8;
    if (v7) {
      BOOL v9 = v6;
    }
    else {
      BOOL v9 = 0;
    }
    BOOL v104 = v9;
  }
  else
  {
    BOOL v104 = 0;
    int v101 = 0;
  }
  id v10 = objc_alloc_init((Class)NSMutableArray);
  long long v119 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  id v11 = [v3 countByEnumeratingWithState:&v119 objects:v126 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v120;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v120 != v13) {
          objc_enumerationMutation(v3);
        }
        uint64_t v15 = *(void *)(*((void *)&v119 + 1) + 8 * i);
        if (([(NSMutableArray *)self->_noteCardInfos containsObject:v15] & 1) == 0) {
          [v10 addObject:v15];
        }
      }
      id v12 = [v3 countByEnumeratingWithState:&v119 objects:v126 count:16];
    }
    while (v12);
  }
  v105 = v10;
  id v16 = objc_alloc_init((Class)NSMutableArray);
  long long v115 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  noteCardInfos = self->_noteCardInfos;
  id v18 = [(NSMutableArray *)noteCardInfos countByEnumeratingWithState:&v115 objects:v125 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v116;
    do
    {
      for (j = 0; j != v19; j = (char *)j + 1)
      {
        if (*(void *)v116 != v20) {
          objc_enumerationMutation(noteCardInfos);
        }
        uint64_t v22 = *(void *)(*((void *)&v115 + 1) + 8 * (void)j);
        if (([v3 containsObject:v22] & 1) == 0) {
          [v16 addObject:v22];
        }
      }
      id v19 = [(NSMutableArray *)noteCardInfos countByEnumeratingWithState:&v115 objects:v125 count:16];
    }
    while (v19);
  }
  id v23 = v100;
  BOOL v24 = v104;
  if (!v104)
  {
    id v25 = [v3 count];
    if (v25 < [(NSMutableArray *)self->_noteCardInfos count]) {
      int v26 = 1;
    }
    else {
      int v26 = v101;
    }
    if (v26 == 1)
    {
      if ([(NSMutableArray *)self->_noteCards count])
      {
        unint64_t v27 = 0;
        do
        {
          if (objc_msgSend(v105, "containsObject:", objc_msgSend(v3, "objectAtIndex:", v27))) {
            [v100 addObject:[self->_noteCards objectAtIndex:v27]];
          }
          ++v27;
        }
        while (v27 < (unint64_t)[(NSMutableArray *)self->_noteCards count]);
      }
      id v28 = [(NSMutableArray *)self->_noteCardInfos mutableCopy];
      id v102 = [v16 mutableCopy];
      if ([v28 count])
      {
        id v29 = [v3 lastObject];
        if (v29 != [v28 lastObject])
        {
          id v30 = [v28 lastObject];
          id v31 = [(THNoteCardsController *)self p_createNewNoteCardLayer];
          [(THNoteCardsController *)self p_populateNoteCard:v31 withInfo:v30];
          [(CALayer *)self->_noteCardsLayer addSublayer:v31];
          [v31 setFilteredOut:1];
          id v32 = [(NSMutableArray *)self->_noteCardInfos count];
          if ((unint64_t)v32 >= 4) {
            uint64_t v33 = 4;
          }
          else {
            uint64_t v33 = (uint64_t)v32;
          }
          [v31 setCardIndex:v33];
          double y = CGPointZero.y;
          [v31 setDragAnchor:CGPointZero.x, y];
          [v31 setDragOffset:CGPointZero.x, y];
          [(NSMutableArray *)self->_noteCards addObject:v31];

          [v4 addObject:v31];
          [v28 removeObject:v30];
          [v102 removeObject:v30];
        }
      }
      if ([v28 count])
      {
        id v35 = [v3 firstObject];
        if (v35 != [v28 firstObject])
        {
          id v36 = [v28 firstObject];
          id v37 = [(THNoteCardsController *)self p_createNewNoteCardLayer];
          [(THNoteCardsController *)self p_populateNoteCard:v37 withInfo:v36];
          [(CALayer *)self->_noteCardsLayer addSublayer:v37];
          [v37 setFilteredOut:1];
          [v37 setCardIndex:0];
          double v38 = CGPointZero.y;
          [v37 setDragAnchor:CGPointZero.x, v38];
          [v37 setDragOffset:CGPointZero.x, v38];
          [(NSMutableArray *)self->_noteCards insertObject:v37 atIndex:0];

          [v4 addObject:v37];
          [v28 removeObject:v36];
          [v102 removeObject:v36];
        }
      }
      v39 = v102;
      if ([v102 count])
      {
        id v40 = [v102 lastObject];
        id v41 = [(THNoteCardsController *)self p_createNewNoteCardLayer];
        [(THNoteCardsController *)self p_populateNoteCard:v41 withInfo:v40];
        [(CALayer *)self->_noteCardsLayer addSublayer:v41];
        [v41 setFilteredOut:1];
        v42 = (char *)[(NSMutableArray *)self->_noteCardInfos count];
        if ((unint64_t)(v42 - 1) >= 3) {
          uint64_t v43 = 3;
        }
        else {
          uint64_t v43 = (uint64_t)(v42 - 1);
        }
        [v41 setCardIndex:v43];
        double v44 = CGPointZero.y;
        [v41 setDragAnchor:CGPointZero.x, v44];
        [v41 setDragOffset:CGPointZero.x, v44];
        noteCards = self->_noteCards;
        v46 = (char *)[(NSMutableArray *)noteCards count] - 1;
        v47 = noteCards;
        BOOL v24 = v104;
        [(NSMutableArray *)v47 insertObject:v41 atIndex:v46];

        [v4 addObject:v41];
        [v28 removeObject:v40];
        id v48 = v40;
        v39 = v102;
        [v102 removeObject:v48];
      }
      if ([v39 count])
      {
        id v49 = [v39 firstObject];
        id v50 = [(THNoteCardsController *)self p_createNewNoteCardLayer];
        [(THNoteCardsController *)self p_populateNoteCard:v50 withInfo:v49];
        [(CALayer *)self->_noteCardsLayer addSublayer:v50];
        [v50 setFilteredOut:1];
        [v50 setCardIndex:1];
        double v51 = CGPointZero.y;
        [v50 setDragAnchor:CGPointZero.x, v51];
        [v50 setDragOffset:CGPointZero.x, v51];
        [(NSMutableArray *)self->_noteCards insertObject:v50 atIndex:1];

        [v4 addObject:v50];
        [v28 removeObject:v49];
        id v52 = v49;
        v39 = v102;
        [v102 removeObject:v52];
      }
LABEL_83:

      goto LABEL_84;
    }
    id v53 = [v3 mutableCopy];
    id v54 = [(NSMutableArray *)self->_noteCardInfos mutableCopy];
    id v99 = [v105 mutableCopy];
    v103 = v54;
    if ([v53 count]
      && [v54 count]
      && (id v55 = [v53 lastObject], v55 == objc_msgSend(v54, "lastObject")))
    {
      [v53 removeObject:[v53 lastObject]];
      [v54 removeObject:[v54 lastObject]];
      uint64_t v58 = 1;
    }
    else
    {
      id v56 = [v53 lastObject];
      id v57 = [(NSMutableArray *)self->_noteCards lastObject];
      [v5 addObject:v57];

      id v54 = v103;
      [v53 removeObject:v56];
      [v99 removeObject:v56];
      uint64_t v58 = 0;
    }
    if ([v54 count]
      && [v53 count]
      && (v59 = [v53 firstObject], v60 = v59 == objc_msgSend(v103, "firstObject"), id v54 = v103, v60))
    {
      [v53 removeObject:[v53 firstObject]];
      [v103 removeObject:[v103 firstObject]];
      ++v58;
    }
    else if ([v53 count])
    {
      id v61 = [v53 firstObject];
      id v62 = [(NSMutableArray *)self->_noteCards firstObject];
      [v5 addObject:v62];

      [v53 removeObject:v61];
      id v63 = v61;
      id v54 = v103;
      [v99 removeObject:v63];
    }
    if ((unint64_t)[(NSMutableArray *)self->_noteCards count] >= 3)
    {
      uint64_t v97 = v58;
      id v64 = [(NSMutableArray *)self->_noteCards objectAtIndex:1];
      if ([v99 count])
      {
        id v65 = [v99 firstObject];
        [(THNoteCardsController *)self p_populateNoteCard:v64 withInfo:v65];
        [v5 addObject:v64];
        [v99 removeObject:v65];
        [v53 removeObject:v65];
      }
      else
      {
        v66 = v54;
        id v67 = [v54 firstObject];
        [(THNoteCardsController *)self p_populateNoteCard:v64 withInfo:v67];
        [v66 removeObject:v67];
        uint64_t v58 = v97 + 1;
      }
    }
    id v98 = v53;
    if ((unint64_t)[(NSMutableArray *)self->_noteCards count] >= 4)
    {
      id v68 = [(NSMutableArray *)self->_noteCards objectAtIndex:2];
      if (![v99 count])
      {
        id v95 = [v103 lastObject];
        [(THNoteCardsController *)self p_populateNoteCard:v68 withInfo:v95];
        id v96 = v95;
        v39 = v103;
        [v103 removeObject:v96];
        ++v58;
LABEL_74:
        if ([v39 count] && v58 != 4)
        {
          double v70 = CGPointZero.y;
          uint64_t v71 = v58 - 3;
          char v72 = 1;
          do
          {
            uint64_t v73 = v71;
            if (v72) {
              id v74 = [v39 lastObject];
            }
            else {
              id v74 = [v39 firstObject];
            }
            id v75 = v74;
            v76 = v39;
            id v77 = [(THNoteCardsController *)self p_createNewNoteCardLayer];
            [(THNoteCardsController *)self p_populateNoteCard:v77 withInfo:v75];
            [(CALayer *)self->_noteCardsLayer insertSublayer:v77 atIndex:0];
            [v77 setCardIndex:1];
            [v77 setDragOffset:CGPointZero.x, v70];
            [(NSMutableArray *)self->_noteCards addObject:v77];

            [v76 removeObject:v75];
            v39 = v76;
            if (![v76 count]) {
              break;
            }
            v72 ^= 1u;
            uint64_t v71 = v73 + 1;
          }
          while (v73);
        }
        v78 = self->_noteCards;
        v114[0] = _NSConcreteStackBlock;
        v114[1] = 3221225472;
        v114[2] = sub_1D1FBC;
        v114[3] = &unk_457B78;
        v114[4] = self;
        [(NSMutableArray *)v78 sortUsingComparator:v114];

        id v23 = v100;
        BOOL v24 = v104;
        id v28 = v98;
        goto LABEL_83;
      }
      id v69 = [v99 lastObject];
      [(THNoteCardsController *)self p_populateNoteCard:v68 withInfo:v69];
      [v5 addObject:v68];
      [v99 removeObject:v69];
      [v53 removeObject:v69];
    }
    v39 = v103;
    goto LABEL_74;
  }
LABEL_84:
  [(NSMutableArray *)self->_noteCards removeObjectsInArray:v5];
  if ([(NSMutableArray *)self->_noteCards count])
  {
    id v79 = [(NSMutableArray *)self->_noteCards lastObject];
    v80 = (char *)[(NSMutableArray *)self->_noteCards count];
    if ((unint64_t)(v80 - 1) >= 3) {
      uint64_t v81 = 3;
    }
    else {
      uint64_t v81 = (uint64_t)(v80 - 1);
    }
    if (([v4 containsObject:v79] & 1) != 0
      || ([v5 containsObject:v79] & 1) != 0)
    {
      [v79 setCardIndex:v81];
    }
    else
    {
      [v79 setCardIndex:v81 forceHidden:[v23 containsObject:v79] animated:1 duration:0.75];
    }
  }
  if ((unint64_t)[(NSMutableArray *)self->_noteCards count] >= 2)
  {
    id v82 = [(NSMutableArray *)self->_noteCards firstObject];
    if (([v4 containsObject:v82] & 1) != 0
      || ([v5 containsObject:v82] & 1) != 0)
    {
      [v82 setCardIndex:0];
    }
    else
    {
      [v82 setCardIndex:0 forceHidden:[v23 containsObject:v82] animated:1 duration:0.75];
    }
  }
  if ((unint64_t)[(NSMutableArray *)self->_noteCards count] >= 3
    && ceilf((float)(unint64_t)[(NSMutableArray *)self->_noteCards count] * 0.5) > 1.0)
  {
    v83 = (unsigned char *)(&dword_0 + 1);
    do
    {
      if (v83 >= (char *)[(NSMutableArray *)self->_noteCards count] - 1) {
        break;
      }
      id v84 = [(NSMutableArray *)self->_noteCards objectAtIndex:v83];
      if (([v4 containsObject:v84] & 1) != 0
        || ([v5 containsObject:v84] & 1) != 0)
      {
        [v84 setCardIndex:1];
      }
      else
      {
        [v84 setCardIndex:1 forceHidden:[v23 containsObject:v84] animated:1 duration:0.75];
      }
      ++v83;
    }
    while (ceilf((float)(unint64_t)[(NSMutableArray *)self->_noteCards count] * 0.5) > (float)(unint64_t)v83);
  }
  if ((unint64_t)[(NSMutableArray *)self->_noteCards count] >= 4)
  {
    for (k = (char *)vcvtps_u32_f32((float)(unint64_t)[(NSMutableArray *)self->_noteCards count] * 0.5);
          k < (char *)[(NSMutableArray *)self->_noteCards count] - 1;
          ++k)
    {
      id v86 = [(NSMutableArray *)self->_noteCards objectAtIndex:k];
      if (([v4 containsObject:v86] & 1) != 0
        || ([v5 containsObject:v86] & 1) != 0)
      {
        [v86 setCardIndex:2];
      }
      else
      {
        [v86 setCardIndex:2 forceHidden:[v23 containsObject:v86] animated:1 duration:0.75];
      }
    }
  }
  long long v112 = 0u;
  long long v113 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  id v87 = [v4 countByEnumeratingWithState:&v110 objects:v124 count:16];
  if (v87)
  {
    id v88 = v87;
    uint64_t v89 = *(void *)v111;
    do
    {
      for (m = 0; m != v88; m = (char *)m + 1)
      {
        if (*(void *)v111 != v89) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v110 + 1) + 8 * (void)m) setFilteredOut:0 direction:1 animated:0 duration:1.0 completion:0.0];
      }
      id v88 = [v4 countByEnumeratingWithState:&v110 objects:v124 count:16];
    }
    while (v88);
  }
  long long v108 = 0u;
  long long v109 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  id v91 = [v5 countByEnumeratingWithState:&v106 objects:v123 count:16];
  if (v91)
  {
    id v92 = v91;
    uint64_t v93 = *(void *)v107;
    do
    {
      for (n = 0; n != v92; n = (char *)n + 1)
      {
        if (*(void *)v107 != v93) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v106 + 1) + 8 * (void)n) setFilteredOut:1 direction:1 animated:0 duration:1.0 completion:0.0];
      }
      id v92 = [v5 countByEnumeratingWithState:&v106 objects:v123 count:16];
    }
    while (v92);
  }

  if (v24) {
    [(THNoteCardsController *)self p_recreateNoteCardLayers];
  }
  else {
    [(THNoteCardsController *)self performSelector:"p_recreateNoteCardLayers" withObject:0 afterDelay:0.75];
  }
}

- (void)p_reflectShuffleOptionsChangeWithCompletionBlock:(id)a3
{
  if ((unint64_t)[(NSMutableArray *)self->_noteCardInfos count] >= 2)
  {
    [(THNoteCardsController *)self p_updateNoteCardOrder];
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x2020000000;
    v37[3] = 0;
    v35[0] = 0;
    v35[1] = v35;
    v35[2] = 0x2020000000;
    id v36 = 0;
    id v36 = [(NSMutableArray *)self->_noteCards count];
    if ([(NSMutableArray *)self->_noteCardInfos count] == (char *)&dword_0 + 2)
    {
      id v5 = [(THNoteCardsController *)self p_noteCardAtIndex:1];
      id v6 = [(THNoteCardsController *)self p_noteCardAtIndex:0];
      id v7 = [(NSMutableArray *)self->_noteCardInfos lastObject];
      [(THNoteCardsController *)self p_rebuildNoteCardInfos];
      id v8 = [(NSMutableArray *)self->_noteCardInfos lastObject];
      if (v7 == v8) {
        double v9 = 0.5;
      }
      else {
        double v9 = 0.625;
      }
      [v5 shuffleToIndex:v7 == v8 animated:1 delay:&v34 duration:0.0 completion:v9];
      if (v7 == v8) {
        double v10 = 0.5;
      }
      else {
        double v10 = 0.375;
      }
      [v6 shuffleToIndex:v7 != v8 animated:1 delay:&v34 duration:0.125 completion:v10];
    }
    else if ([(NSMutableArray *)self->_noteCardInfos count] == (char *)&dword_0 + 3)
    {
      id v11 = [(THNoteCardsController *)self p_noteCardAtIndex:2];
      id v12 = [(THNoteCardsController *)self p_noteCardAtIndex:1];
      id v13 = [(THNoteCardsController *)self p_noteCardAtIndex:0];
      id v14 = [(NSMutableArray *)self->_noteCardInfos objectAtIndex:2];
      id v15 = [(NSMutableArray *)self->_noteCardInfos objectAtIndex:1];
      id v16 = [(NSMutableArray *)self->_noteCardInfos objectAtIndex:0];
      [(THNoteCardsController *)self p_rebuildNoteCardInfos];
      id v17 = [(NSMutableArray *)self->_noteCardInfos indexOfObject:v14];
      [v11 shuffleToIndex:v17 animated:1 delay:&v34 duration:0.0 completion:(double)(2 - (uint64_t)v17) * 0.125 + 0.5];
      id v18 = [(NSMutableArray *)self->_noteCardInfos indexOfObject:v15];
      [v12 shuffleToIndex:v18 animated:1 delay:&v34 duration:0.125 completion:(double)(1 - (uint64_t)v18) * 0.125 + 0.5];
      uint64_t v19 = (uint64_t)[(NSMutableArray *)self->_noteCardInfos indexOfObject:v16];
      [v13 shuffleToIndex:v19 animated:1 delay:&v34 duration:0.25 completion:(double)-v19 * 0.125 + 0.5];
    }
    else if ((unint64_t)[(NSMutableArray *)self->_noteCardInfos count] >= 4)
    {
      id v20 = [(THNoteCardsController *)self p_noteCardAtIndex:3];
      id v21 = [(THNoteCardsController *)self p_noteCardAtIndex:2];
      id v22 = [(THNoteCardsController *)self p_noteCardAtIndex:1];
      id v23 = [(THNoteCardsController *)self p_noteCardAtIndex:0];
      id v24 = [(NSMutableArray *)self->_noteCardInfos lastObject];
      id v25 = [(NSMutableArray *)self->_noteCardInfos firstObject];
      [(THNoteCardsController *)self p_rebuildNoteCardInfos];
      id v26 = [(NSMutableArray *)self->_noteCardInfos lastObject];
      id v27 = [(NSMutableArray *)self->_noteCardInfos firstObject];
      if (v24 != v26) {
        [(THNoteCardsController *)self p_populateNoteCard:v21 withInfo:v26];
      }
      if (v25 != v27) {
        [(THNoteCardsController *)self p_populateNoteCard:v22 withInfo:v27];
      }
      if (v24 == v26) {
        uint64_t v28 = 3;
      }
      else {
        uint64_t v28 = 2;
      }
      if (v24 == v26) {
        double v29 = 0.5;
      }
      else {
        double v29 = 0.625;
      }
      [v20 shuffleToIndex:v28 animated:1 delay:&v34 duration:0.0 completion:v29];
      if (v24 == v26) {
        uint64_t v30 = 2;
      }
      else {
        uint64_t v30 = 3;
      }
      if (v24 == v26) {
        double v31 = 0.5;
      }
      else {
        double v31 = 0.375;
      }
      [v21 shuffleToIndex:v30 animated:1 delay:&v34 duration:0.125 completion:v31];
      if (v25 == v27) {
        double v32 = 0.5;
      }
      else {
        double v32 = 0.625;
      }
      [v22 shuffleToIndex:v25 == v27 animated:1 delay:&v34 duration:0.25 completion:v32];
      if (v25 == v27) {
        double v33 = 0.5;
      }
      else {
        double v33 = 0.375;
      }
      [v23 shuffleToIndex:v25 != v27 animated:1 delay:&v34 duration:0.375 completion:v33];
    }
    _Block_object_dispose(v35, 8);
    _Block_object_dispose(v37, 8);
  }
}

- (void)p_unfilteredNoteCardInfosChangedMoveToRight:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(NSMutableArray *)self->_noteCardInfos count])
  {
    if (v3) {
      double v5 = 1.0;
    }
    else {
      double v5 = -1.0;
    }
    +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"p_recreateNoteCardLayers" object:0];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    noteCards = self->_noteCards;
    id v7 = [(NSMutableArray *)noteCards countByEnumeratingWithState:&v34 objects:v40 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v35;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v35 != v9) {
            objc_enumerationMutation(noteCards);
          }
          [*(id *)(*((void *)&v34 + 1) + 8 * i) setFilteredOut:1 direction:1 animated:0 duration:-v5 completion:0.0];
        }
        id v8 = [(NSMutableArray *)noteCards countByEnumeratingWithState:&v34 objects:v40 count:16];
      }
      while (v8);
    }
    [(NSMutableArray *)self->_noteCards removeAllObjects];
    [(THNoteCardsController *)self p_rebuildNoteCardInfos];
    id v11 = [(THNoteCardsController *)self p_noteCardsForInfos:self->_noteCardInfos];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v12 = [v11 countByEnumeratingWithState:&v30 objects:v39 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v31;
      do
      {
        for (j = 0; j != v13; j = (char *)j + 1)
        {
          if (*(void *)v31 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v30 + 1) + 8 * (void)j);
          [(NSMutableArray *)self->_noteCards addObject:v16];
          [(CALayer *)self->_noteCardsLayer addSublayer:v16];
        }
        id v13 = [v11 countByEnumeratingWithState:&v30 objects:v39 count:16];
      }
      while (v13);
    }
    if ([(NSMutableArray *)self->_noteCards count])
    {
      unint64_t v17 = 0;
      do
      {
        [self->_noteCards[v17] setCardIndex:v17];
        [self->_noteCards objectAtIndex:v17++].setFilteredOut:1 direction:v5;
      }
      while (v17 < (unint64_t)[(NSMutableArray *)self->_noteCards count]);
    }
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v18 = self->_noteCards;
    id v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v26 objects:v38 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v27;
      do
      {
        for (k = 0; k != v20; k = (char *)k + 1)
        {
          if (*(void *)v27 != v21) {
            objc_enumerationMutation(v18);
          }
          id v23 = *(id *)(*((void *)&v26 + 1) + 8 * (void)k);
          if (v23 == [(NSMutableArray *)self->_noteCards lastObject])
          {
            id v24 = v25;
            v25[0] = _NSConcreteStackBlock;
            v25[1] = 3221225472;
            v25[2] = sub_1D2958;
            v25[3] = &unk_456DE0;
            v25[4] = self;
          }
          else
          {
            id v24 = 0;
          }
          [v23 setFilteredOut:0 direction:1 animated:v24 duration:-v5 completion:0.0];
        }
        id v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v26 objects:v38 count:16];
      }
      while (v20);
    }
  }
  else
  {
    [(THNoteCardsController *)self p_reloadNoteCards];
  }
}

- (void)p_makeTopCardInteractive
{
  if (![(NSMapTable *)self->_interactiveViewsToLayers count] && !self->_scalingMode)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id obj = [self p_topNoteCard].interactiveLayers;
    id v3 = [obj countByEnumeratingWithState:&v17 objects:v23 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v18;
      do
      {
        id v6 = 0;
        do
        {
          if (*(void *)v18 != v5) {
            objc_enumerationMutation(obj);
          }
          id v7 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v6);
          v16[0] = _NSConcreteStackBlock;
          v16[1] = 3221225472;
          v16[2] = sub_1D2B94;
          v16[3] = &unk_45B090;
          v16[4] = self;
          CFStringRef v21 = @"scrollViewBlock";
          id v22 = [v16 copy];
          id v8 = [v7 swapIntoView:[NSDictionary dictionaryWithObjects:forKeys:count:&v22, &v21, 1]];
          if (v8)
          {
            uint64_t v9 = v8;
            double v10 = [(UIView *)self->_hostView layer];
            [v9 frame];
            -[CALayer convertRect:fromLayer:](v10, "convertRect:fromLayer:", [v7 superlayer], v11, v12, v13, v14);
            [v9 setFrame:];
            [(UIView *)self->_hostView addSubview:v9];
            [v7 setHidden:1];
            [(NSMapTable *)self->_interactiveViewsToLayers setObject:v7 forKey:v9];
          }
          id v6 = (char *)v6 + 1;
        }
        while (v4 != v6);
        id v4 = [obj countByEnumeratingWithState:&v17 objects:v23 count:16];
      }
      while (v4);
    }
  }
}

- (void)p_makeTopCardNonInteractive
{
  if ([(NSMapTable *)self->_interactiveViewsToLayers count])
  {
    id v3 = [(NSMapTable *)self->_interactiveViewsToLayers copy];
    [(NSMapTable *)self->_interactiveViewsToLayers removeAllObjects];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = [v3 keyEnumerator];
    id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          id v10 = [v3 objectForKey:v9];
          [v10 swapOutOfView:v9];
          +[CATransaction begin];
          +[CATransaction setDisableActions:1];
          [v9 removeFromSuperview];
          +[CATransaction commit];
          [v10 setHidden:0];
        }
        id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
    self->_topScrollView = 0;
  }
}

- (THNoteCardsControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THNoteCardsControllerDelegate *)a3;
}

- (THStudyOptions)studyOptions
{
  return self->_options;
}

- (NSArray)noteCards
{
  return &self->_noteCards->super;
}

- (CGSize)minCardSize
{
  double width = self->_minCardSize.width;
  double height = self->_minCardSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setMinCardSize:(CGSize)a3
{
  self->_minCardSize = a3;
}

- (CGSize)maxCardSize
{
  double width = self->_maxCardSize.width;
  double height = self->_maxCardSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setMaxCardSize:(CGSize)a3
{
  self->_maxCardSize = a3;
}

- (int)scalingMode
{
  return self->_scalingMode;
}

- (BOOL)darkMode
{
  return self->_darkMode;
}

@end