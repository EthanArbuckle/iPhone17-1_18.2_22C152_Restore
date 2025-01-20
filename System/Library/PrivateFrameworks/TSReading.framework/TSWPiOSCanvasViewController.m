@interface TSWPiOSCanvasViewController
- (BOOL)_shouldAllowInteractionAtPoint:(CGPoint)a3;
- (BOOL)canDisplayHyperlinkUI;
- (BOOL)hasDelayedTapAction;
- (BOOL)hyperlinkUIShouldShow;
- (BOOL)hyperlinkUIShouldShowCustomUI;
- (BOOL)interactionShouldBegin:(id)a3 atPoint:(CGPoint)a4;
- (BOOL)interactionShouldSuppressSystemUI:(id)a3;
- (BOOL)isInteractingWithLink;
- (BOOL)onlyAllowTextSwipesWhenEditing;
- (BOOL)shouldHideCanvasLayerInMagnifier;
- (BOOL)willInteractWithLinkAtPoint:(CGPoint)a3;
- (TSUColor)backgroundColorForMagnifier;
- (TSWPInteractiveCanvasController)interactiveCanvasController;
- (TSWPLongPressGestureRecognizer)longPressGestureRecognizer;
- (TSWPSwipeGestureRecognizer)textLeftSwipeGestureRecognizer;
- (TSWPSwipeGestureRecognizer)textRightSwipeGestureRecognizer;
- (UIGestureRecognizer)hyperlinkGestureRecognizer;
- (UITapGestureRecognizer)secondarySingleTapGestureRecognizer;
- (UITextInteraction)textInteraction;
- (id)_dragItemsForInteraction:(id)a3 session:(id)a4 withTouchAtPoint:(CGPoint)a5;
- (id)_hitRepAtPoint:(CGPoint)a3;
- (id)_hyperLinkFieldAtPoint:(CGPoint)a3;
- (id)_textInteractionBlockingRepClasses;
- (id)actionForHyperlink:(id)a3 inRep:(id)a4 gesture:(id)a5;
- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4;
- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5;
- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5;
- (id)hyperlinkUICustomStringForURLString:(id)a3;
- (id)p_newSwipeGestureRecognizerWithDirection:(int)a3 numberOfTouchesRequired:(unsigned int)a4;
- (void)_clearSelectedRange;
- (void)_requestTextItemConstrainedToLineAtPoint:(CGPoint)a3 resultHandler:(id)a4;
- (void)_resetAndClearInteractions;
- (void)_resetLinkInteraction;
- (void)addSwipeGestureRecognizers;
- (void)cancelDelayedTapAction;
- (void)cancelInteractionWithLink;
- (void)dealloc;
- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5;
- (void)finishDelayedTapAction;
- (void)gestureSequenceWillBegin;
- (void)p_addSwipeGestureRecognizer:(id)a3 failRequiredFor:(id)a4;
- (void)removeSwipeGestureRecognizers;
- (void)setTextInteraction:(id)a3;
- (void)setUpGestureRecognizers;
- (void)startDelayedTapAction:(id)a3;
- (void)startInteractionWithLinkAtPoint:(CGPoint)a3;
- (void)startLongInteractionWithLinkAtPoint:(CGPoint)a3;
- (void)tapLinkAtPoint:(CGPoint)a3;
- (void)teardown;
- (void)validateInteractionWithLinkAtPoint:(CGPoint)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation TSWPiOSCanvasViewController

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)TSWPiOSCanvasViewController;
  -[TSDiOSCanvasViewController viewWillTransitionToSize:withTransitionCoordinator:](&v6, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  [(TSWPiOSCanvasViewController *)self cancelDelayedTapAction];
  objc_opt_class();
  [(TSDEditorController *)[(TSDInteractiveCanvasController *)[(TSWPiOSCanvasViewController *)self interactiveCanvasController] editorController] textInputEditor];
  v5 = (void *)TSUDynamicCast();
  if (v5) {
    [v5 dismissActivePopovers];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TSWPiOSCanvasViewController;
  [(TSWPiOSCanvasViewController *)&v4 viewDidAppear:a3];
  if (TSUSupportsTextInteraction()) {
    [(TSDCanvasView *)[(TSDiOSCanvasViewController *)self canvasView] addInteraction:self->_textInteraction];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TSWPiOSCanvasViewController;
  [(TSWPiOSCanvasViewController *)&v4 viewDidDisappear:a3];
  if (TSUSupportsTextInteraction()) {
    [(TSDCanvasView *)[(TSDiOSCanvasViewController *)self canvasView] removeInteraction:self->_textInteraction];
  }
}

- (void)teardown
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ([(TSWPiOSCanvasViewController *)self isViewLoaded])
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    gestureRecognizers = self->_gestureRecognizers;
    uint64_t v4 = [(NSMutableArray *)gestureRecognizers countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(gestureRecognizers);
          }
          v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
          [v8 setDelegate:0];
          objc_msgSend((id)objc_msgSend(v8, "view"), "removeGestureRecognizer:", v8);
          [(TSDGestureDispatcher *)[(TSDInteractiveCanvasController *)[(TSWPiOSCanvasViewController *)self interactiveCanvasController] gestureDispatcher] gestureRemovedFromView:v8];
        }
        uint64_t v5 = [(NSMutableArray *)gestureRecognizers countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v5);
    }
    [(NSMutableArray *)self->_gestureRecognizers removeAllObjects];
  }
  v9.receiver = self;
  v9.super_class = (Class)TSWPiOSCanvasViewController;
  [(TSDiOSCanvasViewController *)&v9 teardown];
}

- (void)dealloc
{
  if (TSUSupportsTextInteraction())
  {

    self->_textInteraction = 0;
  }

  self->_leftSwipeGestureRecognizer = 0;
  self->_rightSwipeGestureRecognizer = 0;

  self->_delayedTapAction = 0;
  self->_hyperlinkGestureRecognizer = 0;

  self->_gestureRecognizers = 0;
  self->_longPressGestureRecognizer = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSWPiOSCanvasViewController;
  [(TSDiOSCanvasViewController *)&v3 dealloc];
}

- (void)setUpGestureRecognizers
{
  v16.receiver = self;
  v16.super_class = (Class)TSWPiOSCanvasViewController;
  [(TSDiOSCanvasViewController *)&v16 setUpGestureRecognizers];
  self->_gestureRecognizers = (NSMutableArray *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:0];
  if (TSUSupportsTextInteraction())
  {
    objc_super v3 = (UITextInteraction *)(id)[MEMORY[0x263F1CAB0] textInteractionsForSet:1];
    self->_textInteraction = v3;
    [(UITextInteraction *)v3 setDelegate:self];
    [(UITextInteraction *)self->_textInteraction setTextInput:[(TSDInteractiveCanvasController *)[(TSWPiOSCanvasViewController *)self interactiveCanvasController] textInputResponder]];
    [(TSDCanvasView *)[(TSDiOSCanvasViewController *)self canvasView] setHyperLinkDelegate:self];
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263F1C5D8]) initWithDelegate:self];
    objc_msgSend((id)-[TSWPiOSCanvasViewController view](self, "view"), "addInteraction:", v4);

    uint64_t v5 = [(UIGestureRecognizer *)[TSWPLongPressGestureRecognizer alloc] initWithGestureDispatcher:[(TSDInteractiveCanvasController *)[(TSWPiOSCanvasViewController *)self interactiveCanvasController] gestureDispatcher] gestureKind:@"TSWPImmediatePress"];
    [(TSWPLongPressGestureRecognizer *)v5 setEnabled:0];
    [(TSWPLongPressGestureRecognizer *)v5 setNumberOfTapsRequired:0];
    [(TSWPLongPressGestureRecognizer *)v5 setMinimumPressDuration:0.0];
    objc_msgSend(-[TSDiOSCanvasViewController viewForGestureRecognizer:](self, "viewForGestureRecognizer:", v5), "addGestureRecognizer:", v5);
    [(NSMutableArray *)self->_gestureRecognizers addObject:v5];
  }
  else
  {
    uint64_t v6 = [(TSDInteractiveCanvasController *)[(TSWPiOSCanvasViewController *)self interactiveCanvasController] gestureDispatcher];
    uint64_t v15 = [(UIGestureRecognizer *)[TSWPTapAndTouchGestureRecognizer alloc] initWithGestureDispatcher:v6 gestureKind:@"TSWPDoubleTapAndTouch"];
    [(TSWPTapAndTouchGestureRecognizer *)v15 setNumberOfTapsRequired:2];
    objc_msgSend(-[TSDiOSCanvasViewController viewForGestureRecognizer:](self, "viewForGestureRecognizer:", v15), "addGestureRecognizer:", v15);
    [(NSMutableArray *)self->_gestureRecognizers addObject:v15];
    v7 = [(UIGestureRecognizer *)[TSWPTapAndTouchGestureRecognizer alloc] initWithGestureDispatcher:v6 gestureKind:@"TSWPTapAndTouch"];
    [(TSWPTapAndTouchGestureRecognizer *)v7 setNumberOfTapsRequired:1];
    objc_msgSend(-[TSDiOSCanvasViewController viewForGestureRecognizer:](self, "viewForGestureRecognizer:", v7), "addGestureRecognizer:", v7);
    [(NSMutableArray *)self->_gestureRecognizers addObject:v7];
    v8 = [(UIGestureRecognizer *)[TSWPLongPressGestureRecognizer alloc] initWithGestureDispatcher:v6 gestureKind:@"TSWPLongPress"];
    self->_longPressGestureRecognizer = v8;
    [(TSWPLongPressGestureRecognizer *)v8 setNumberOfTapsRequired:0];
    objc_msgSend(-[TSDiOSCanvasViewController viewForGestureRecognizer:](self, "viewForGestureRecognizer:", self->_longPressGestureRecognizer), "addGestureRecognizer:", self->_longPressGestureRecognizer);
    [(NSMutableArray *)self->_gestureRecognizers addObject:self->_longPressGestureRecognizer];
    objc_super v9 = [(UIGestureRecognizer *)[TSWPLongPressGestureRecognizer alloc] initWithGestureDispatcher:v6 gestureKind:@"TSWPImmediatePress"];
    [(TSWPLongPressGestureRecognizer *)v9 setNumberOfTapsRequired:0];
    [(TSWPLongPressGestureRecognizer *)v9 setMinimumPressDuration:0.0];
    objc_msgSend(-[TSDiOSCanvasViewController viewForGestureRecognizer:](self, "viewForGestureRecognizer:", v9), "addGestureRecognizer:", v9);
    [(NSMutableArray *)self->_gestureRecognizers addObject:v9];
    long long v10 = [(UIGestureRecognizer *)[TSWPTapGestureRecognizer alloc] initWithGestureDispatcher:v6 gestureKind:@"TSWPImmediateDoubleTap"];
    [(TSWPTapGestureRecognizer *)v10 setNumberOfTapsRequired:2];
    objc_msgSend(-[TSDiOSCanvasViewController viewForGestureRecognizer:](self, "viewForGestureRecognizer:", v10), "addGestureRecognizer:", v10);
    [(NSMutableArray *)self->_gestureRecognizers addObject:v10];
    long long v11 = [(UIGestureRecognizer *)[TSWPTapGestureRecognizer alloc] initWithGestureDispatcher:v6 gestureKind:@"TSWPSecondarySingleTap"];
    self->_secondarySingleTapGestureRecognizer = &v11->super;
    [(TSWPTapGestureRecognizer *)v11 setEnabled:0];
    objc_msgSend(-[TSDiOSCanvasViewController viewForGestureRecognizer:](self, "viewForGestureRecognizer:", self->_secondarySingleTapGestureRecognizer), "addGestureRecognizer:", self->_secondarySingleTapGestureRecognizer);
    [(NSMutableArray *)self->_gestureRecognizers addObject:self->_secondarySingleTapGestureRecognizer];
    long long v12 = [(UIGestureRecognizer *)[TSWPTapGestureRecognizer alloc] initWithGestureDispatcher:v6 gestureKind:@"TSWPImmediateSingleTap"];
    objc_msgSend(-[TSDiOSCanvasViewController viewForGestureRecognizer:](self, "viewForGestureRecognizer:", v12), "addGestureRecognizer:", v12);
    [(NSMutableArray *)self->_gestureRecognizers addObject:v12];
    long long v13 = [(UIGestureRecognizer *)[TSWPTapGestureRecognizer alloc] initWithGestureDispatcher:v6 gestureKind:@"TSWPTwoFingerTap"];
    [(TSWPTapGestureRecognizer *)v13 setNumberOfTouchesRequired:2];
    objc_msgSend(-[TSDiOSCanvasViewController viewForGestureRecognizer:](self, "viewForGestureRecognizer:", v13), "addGestureRecognizer:", v13);
    [(NSMutableArray *)self->_gestureRecognizers addObject:v13];
    v14 = (void *)[objc_alloc(MEMORY[0x263F1C5D8]) initWithDelegate:self];
    objc_msgSend((id)-[TSWPiOSCanvasViewController view](self, "view"), "addInteraction:", v14);

    [(TSDGestureDispatcher *)v6 prioritizeRecognizer:v7 overRecognizer:v12];
    -[TSDGestureDispatcher allowSimultaneousRecognitionByRecognizers:](v6, "allowSimultaneousRecognitionByRecognizers:", v12, self->_secondarySingleTapGestureRecognizer, 0);
    -[TSDGestureDispatcher allowSimultaneousRecognitionByRecognizers:](v6, "allowSimultaneousRecognitionByRecognizers:", self->_secondarySingleTapGestureRecognizer, self->_longPressGestureRecognizer, 0);
    -[TSDGestureDispatcher allowSimultaneousRecognitionByRecognizers:](v6, "allowSimultaneousRecognitionByRecognizers:", v7, v9, 0);
    -[TSDGestureDispatcher allowSimultaneousRecognitionByRecognizers:](v6, "allowSimultaneousRecognitionByRecognizers:", v12, v7, 0);
    -[TSDGestureDispatcher allowSimultaneousRecognitionByRecognizers:](v6, "allowSimultaneousRecognitionByRecognizers:", v15, v10, 0);
    -[TSDGestureDispatcher allowSimultaneousRecognitionByRecognizers:](v6, "allowSimultaneousRecognitionByRecognizers:", v15, v7, 0);
    if (![(TSWPiOSCanvasViewController *)self onlyAllowTextSwipesWhenEditing]) {
      [(TSWPiOSCanvasViewController *)self addSwipeGestureRecognizers];
    }
  }
}

- (BOOL)canDisplayHyperlinkUI
{
  id v2 = [(TSDEditorController *)[(TSDInteractiveCanvasController *)[(TSWPiOSCanvasViewController *)self interactiveCanvasController] editorController] textInputEditor];
  BOOL result = (objc_opt_respondsToSelector() & 1) == 0
        || (objc_opt_class(), [v2 selection], (objc_super v3 = (void *)TSUDynamicCast()) == 0)
        || (unint64_t)[v3 infoCount] < 2;
  return result;
}

- (id)actionForHyperlink:(id)a3 inRep:(id)a4 gesture:(id)a5
{
  objc_super v9 = [(TSDInteractiveCanvasController *)[(TSWPiOSCanvasViewController *)self interactiveCanvasController] delegate];
  if (objc_opt_respondsToSelector())
  {
    return (id)[(TSDInteractiveCanvasControllerDelegate *)v9 actionForHyperlink:a3 inRep:a4 gesture:a5];
  }
  else if ((__CFString *)[a5 gestureKind] == @"TSWPImmediateSingleTap" {
         && [(TSDInteractiveCanvasController *)[(TSWPiOSCanvasViewController *)self interactiveCanvasController] inReadMode])
  }
  {
    return +[TSWPHyperlinkAction hyperlinkActionWithHyperlink:a3 inRep:a4 action:&__block_literal_global_74];
  }
  else
  {
    return 0;
  }
}

uint64_t __64__TSWPiOSCanvasViewController_actionForHyperlink_inRep_gesture___block_invoke()
{
  id v0 = +[TSWPHyperlinkUIController sharedHyperlinkUIController];

  return [v0 visit];
}

- (void)gestureSequenceWillBegin
{
  self->_delayedTapAction = 0;
}

- (void)cancelDelayedTapAction
{
  delayedTapAction = self->_delayedTapAction;
  if (delayedTapAction)
  {
    [(TSWPTwoPartAction *)delayedTapAction cancel];

    self->_delayedTapAction = 0;
  }
}

- (void)startDelayedTapAction:(id)a3
{
  [(TSWPiOSCanvasViewController *)self cancelDelayedTapAction];
  uint64_t v5 = (TSWPTwoPartAction *)a3;
  self->_delayedTapAction = v5;
  [(TSWPTwoPartAction *)v5 performStartAction];
  if ([(TSWPTwoPartAction *)self->_delayedTapAction performImmediately])
  {
    [(TSWPiOSCanvasViewController *)self finishDelayedTapAction];
  }
}

- (void)finishDelayedTapAction
{
  delayedTapAction = self->_delayedTapAction;
  if (delayedTapAction)
  {
    [(TSWPTwoPartAction *)delayedTapAction performFinishAction];

    self->_delayedTapAction = 0;
    if (TSUSupportsTextInteraction())
    {
      [(TSWPiOSCanvasViewController *)self performSelector:sel__resetAndClearInteractions withObject:0 afterDelay:0.12];
    }
  }
}

- (void)_resetAndClearInteractions
{
  [(TSWPiOSCanvasViewController *)self _clearSelectedRange];

  [(TSWPiOSCanvasViewController *)self _resetLinkInteraction];
}

- (void)_clearSelectedRange
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__resetAndClearInteractions object:0];
  objc_opt_class();
  [(TSDTextInputResponder *)[(TSDInteractiveCanvasController *)[(TSWPiOSCanvasViewController *)self interactiveCanvasController] textInputResponder] selectedTextRange];
  objc_super v3 = (void *)TSUDynamicCast();
  if (v3)
  {
    uint64_t v4 = v3;
    objc_msgSend(v3, "setRange:", objc_msgSend(v3, "range"), 0);
    uint64_t v5 = [(TSDInteractiveCanvasController *)[(TSWPiOSCanvasViewController *)self interactiveCanvasController] textInputResponder];
    [(TSDTextInputResponder *)v5 setSelectedTextRange:v4];
  }
}

- (BOOL)hasDelayedTapAction
{
  return self->_delayedTapAction != 0;
}

- (void)addSwipeGestureRecognizers
{
  if ((self->_leftSwipeGestureRecognizer || self->_rightSwipeGestureRecognizer)
    && [(TSWPiOSCanvasViewController *)self onlyAllowTextSwipesWhenEditing])
  {
    objc_super v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSWPiOSCanvasViewController addSwipeGestureRecognizers]"];
    [v3 handleFailureInFunction:v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPiOSCanvasViewController.m"), 438, @"swipe gesture recognizers should be nil, this might mean we're calling this method without releasing them" file lineNumber description];
  }
  if (!self->_leftSwipeGestureRecognizer && !self->_rightSwipeGestureRecognizer
    || ![(TSWPiOSCanvasViewController *)self onlyAllowTextSwipesWhenEditing])
  {
    uint64_t v5 = (void *)[MEMORY[0x263EFF980] array];
    objc_msgSend(v5, "addObjectsFromArray:", -[NSSet allObjects](-[TSDiOSCanvasViewController panGestureRecognizers](self, "panGestureRecognizers"), "allObjects"));
    objc_msgSend(v5, "addObject:", -[TSDiOSCanvasViewController zoomGestureRecognizer](self, "zoomGestureRecognizer"));
    leftSwipeGestureRecognizer = self->_leftSwipeGestureRecognizer;
    if (!leftSwipeGestureRecognizer)
    {
      v7 = [(TSWPiOSCanvasViewController *)self p_newSwipeGestureRecognizerWithDirection:2 numberOfTouchesRequired:1];
      self->_leftSwipeGestureRecognizer = v7;
      [(TSWPiOSCanvasViewController *)self setUpGestureDependenciesForNewCopyOfTextGesture:v7];
      leftSwipeGestureRecognizer = self->_leftSwipeGestureRecognizer;
    }
    [(TSWPiOSCanvasViewController *)self p_addSwipeGestureRecognizer:leftSwipeGestureRecognizer failRequiredFor:v5];
    rightSwipeGestureRecognizer = self->_rightSwipeGestureRecognizer;
    if (!rightSwipeGestureRecognizer)
    {
      objc_super v9 = [(TSWPiOSCanvasViewController *)self p_newSwipeGestureRecognizerWithDirection:1 numberOfTouchesRequired:1];
      self->_rightSwipeGestureRecognizer = v9;
      [(TSWPiOSCanvasViewController *)self setUpGestureDependenciesForNewCopyOfTextGesture:v9];
      rightSwipeGestureRecognizer = self->_rightSwipeGestureRecognizer;
    }
    [(TSWPiOSCanvasViewController *)self p_addSwipeGestureRecognizer:rightSwipeGestureRecognizer failRequiredFor:v5];
    [(TSWPiOSCanvasViewController *)self p_addSwipeGestureRecognizer:[(TSWPiOSCanvasViewController *)self p_newSwipeGestureRecognizerWithDirection:4 numberOfTouchesRequired:1] failRequiredFor:v5];
    [(TSWPiOSCanvasViewController *)self p_addSwipeGestureRecognizer:[(TSWPiOSCanvasViewController *)self p_newSwipeGestureRecognizerWithDirection:8 numberOfTouchesRequired:1] failRequiredFor:v5];
    [(TSDiOSCanvasViewController *)self delegate];
    if ((objc_opt_respondsToSelector() & 1) == 0
      || [(TSDiOSCanvasViewControllerDelegate *)[(TSDiOSCanvasViewController *)self delegate] canvasViewController:self enableSwipeGestureWithNumberOfTouches:2])
    {
      [(TSWPiOSCanvasViewController *)self p_addSwipeGestureRecognizer:[(TSWPiOSCanvasViewController *)self p_newSwipeGestureRecognizerWithDirection:2 numberOfTouchesRequired:2] failRequiredFor:v5];
      [(TSWPiOSCanvasViewController *)self p_addSwipeGestureRecognizer:[(TSWPiOSCanvasViewController *)self p_newSwipeGestureRecognizerWithDirection:1 numberOfTouchesRequired:2] failRequiredFor:v5];
      [(TSWPiOSCanvasViewController *)self p_addSwipeGestureRecognizer:[(TSWPiOSCanvasViewController *)self p_newSwipeGestureRecognizerWithDirection:4 numberOfTouchesRequired:2] failRequiredFor:v5];
      [(TSWPiOSCanvasViewController *)self p_addSwipeGestureRecognizer:[(TSWPiOSCanvasViewController *)self p_newSwipeGestureRecognizerWithDirection:8 numberOfTouchesRequired:2] failRequiredFor:v5];
    }
    [(TSDiOSCanvasViewController *)self delegate];
    if ((objc_opt_respondsToSelector() & 1) == 0
      || [(TSDiOSCanvasViewControllerDelegate *)[(TSDiOSCanvasViewController *)self delegate] canvasViewController:self enableSwipeGestureWithNumberOfTouches:3])
    {
      [(TSWPiOSCanvasViewController *)self p_addSwipeGestureRecognizer:[(TSWPiOSCanvasViewController *)self p_newSwipeGestureRecognizerWithDirection:2 numberOfTouchesRequired:3] failRequiredFor:v5];
      [(TSWPiOSCanvasViewController *)self p_addSwipeGestureRecognizer:[(TSWPiOSCanvasViewController *)self p_newSwipeGestureRecognizerWithDirection:1 numberOfTouchesRequired:3] failRequiredFor:v5];
      [(TSWPiOSCanvasViewController *)self p_addSwipeGestureRecognizer:[(TSWPiOSCanvasViewController *)self p_newSwipeGestureRecognizerWithDirection:4 numberOfTouchesRequired:3] failRequiredFor:v5];
      id v10 = [(TSWPiOSCanvasViewController *)self p_newSwipeGestureRecognizerWithDirection:8 numberOfTouchesRequired:3];
      [(TSWPiOSCanvasViewController *)self p_addSwipeGestureRecognizer:v10 failRequiredFor:v5];
    }
  }
}

- (void)removeSwipeGestureRecognizers
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  objc_super v3 = objc_msgSend((id)-[TSWPiOSCanvasViewController view](self, "view", 0, 0), "gestureRecognizers");
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_opt_class();
        uint64_t v8 = TSUDynamicCast();
        if (v8)
        {
          uint64_t v9 = v8;
          objc_msgSend((id)-[TSWPiOSCanvasViewController view](self, "view"), "removeGestureRecognizer:", v8);
          [(NSMutableArray *)self->_gestureRecognizers removeObject:v9];
          [(TSDGestureDispatcher *)[(TSDInteractiveCanvasController *)[(TSWPiOSCanvasViewController *)self interactiveCanvasController] gestureDispatcher] gestureRemovedFromView:v9];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  self->_leftSwipeGestureRecognizer = 0;
  self->_rightSwipeGestureRecognizer = 0;
}

- (TSUColor)backgroundColorForMagnifier
{
  return 0;
}

- (BOOL)shouldHideCanvasLayerInMagnifier
{
  return 1;
}

- (BOOL)onlyAllowTextSwipesWhenEditing
{
  return 0;
}

- (BOOL)hyperlinkUIShouldShowCustomUI
{
  return 0;
}

- (BOOL)hyperlinkUIShouldShow
{
  return 1;
}

- (id)hyperlinkUICustomStringForURLString:(id)a3
{
  return 0;
}

- (id)_dragItemsForInteraction:(id)a3 session:(id)a4 withTouchAtPoint:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  v15[1] = *MEMORY[0x263EF8340];
  objc_opt_class();
  [(TSDEditorController *)[(TSDInteractiveCanvasController *)[(TSWPiOSCanvasViewController *)self interactiveCanvasController] editorController] textInputEditor];
  long long v10 = (void *)TSUDynamicCast();
  long long v11 = v10;
  if (v10) {
    id v12 = (id)objc_msgSend(v10, "dragItemForCurrentSelectionWithDragInteraction:session:withTouchPoint:", a3, a4, x, y);
  }
  else {
    id v12 = +[TSWPEditingController dragItemForHitRepWithDragInteraction:session:canvasView:icc:withTouchPoint:](TSWPEditingController, "dragItemForHitRepWithDragInteraction:session:canvasView:icc:withTouchPoint:", a3, a4, [(TSWPiOSCanvasViewController *)self view], [(TSWPiOSCanvasViewController *)self interactiveCanvasController], x, y);
  }
  id v13 = v12;
  if (!v12) {
    return (id)MEMORY[0x263EFFA68];
  }
  [v11 setSelection:0];
  v15[0] = v13;
  return (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  objc_msgSend(a4, "locationInView:", -[TSWPiOSCanvasViewController view](self, "view"));

  return -[TSWPiOSCanvasViewController _dragItemsForInteraction:session:withTouchAtPoint:](self, "_dragItemsForInteraction:session:withTouchAtPoint:", a3, a4);
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  return +[TSWPEditingController previewForDragItem:a4];
}

- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5
{
  [(TSWPLongPressGestureRecognizer *)[(TSWPiOSCanvasViewController *)self longPressGestureRecognizer] setEnabled:0];
  uint64_t v6 = [(TSWPiOSCanvasViewController *)self longPressGestureRecognizer];

  [(TSWPLongPressGestureRecognizer *)v6 setEnabled:1];
}

- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5
{
  uint64_t v8 = [(TSWPiOSCanvasViewController *)self view];
  uint64_t v9 = [(TSWPiOSCanvasViewController *)self interactiveCanvasController];

  return +[TSWPEditingController retargetedDragItem:a4 withDefault:a5 canvasView:v8 icc:v9];
}

- (TSWPInteractiveCanvasController)interactiveCanvasController
{
  objc_opt_class();

  return (TSWPInteractiveCanvasController *)TSUDynamicCast();
}

- (void)p_addSwipeGestureRecognizer:(id)a3 failRequiredFor:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  objc_msgSend((id)-[TSWPiOSCanvasViewController view](self, "view"), "addGestureRecognizer:", a3);
  [(NSMutableArray *)self->_gestureRecognizers addObject:a3];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v7 = [a4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(a4);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) requireGestureRecognizerToFail:a3];
      }
      while (v8 != v10);
      uint64_t v8 = [a4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (id)p_newSwipeGestureRecognizerWithDirection:(int)a3 numberOfTouchesRequired:(unsigned int)a4
{
  uint64_t v5 = *(void *)&a3;
  if (a4 == 3)
  {
    uint64_t v6 = TSWPThreeFingerSwipe;
  }
  else
  {
    uint64_t v6 = TSWPTwoFingerSwipe;
    if (a4 != 2) {
      uint64_t v6 = TSWPOneFingerSwipe;
    }
  }
  uint64_t v7 = [(UIGestureRecognizer *)[TSWPSwipeGestureRecognizer alloc] initWithGestureDispatcher:[(TSDInteractiveCanvasController *)[(TSWPiOSCanvasViewController *)self interactiveCanvasController] gestureDispatcher] gestureKind:*v6];
  [(TSWPSwipeGestureRecognizer *)v7 setNumberOfTouchesRequired:a4];
  [(TSWPSwipeGestureRecognizer *)v7 setDirection:v5];
  [(TSWPSwipeGestureRecognizer *)v7 setAllowedTouchTypes:&unk_26D739468];
  return v7;
}

- (BOOL)_shouldAllowInteractionAtPoint:(CGPoint)a3
{
  return -[TSWPiOSCanvasViewController _hitRepAtPoint:](self, "_hitRepAtPoint:", a3.x, a3.y) != 0;
}

- (id)_textInteractionBlockingRepClasses
{
  return (id)[MEMORY[0x263EFFA08] set];
}

- (id)_hitRepAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v6 = [(TSWPiOSCanvasViewController *)self interactiveCanvasController];
  -[TSDInteractiveCanvasController convertUnscaledToBoundsPoint:](v6, "convertUnscaledToBoundsPoint:", x, y);
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:](v6, "convertBoundsToUnscaledPoint:", x, y);
  double v12 = v11;
  double v14 = v13;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3052000000;
  v27 = __Block_byref_object_copy__23;
  v28 = __Block_byref_object_dispose__23;
  uint64_t v29 = 0;
  id v15 = [(TSWPiOSCanvasViewController *)self _textInteractionBlockingRepClasses];
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  objc_opt_class();
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __46__TSWPiOSCanvasViewController__hitRepAtPoint___block_invoke;
  v19[3] = &unk_2646B2DA0;
  v19[8] = v8;
  v19[9] = v10;
  v19[4] = v6;
  v19[5] = v15;
  v19[6] = &v24;
  v19[7] = &v20;
  -[TSDInteractiveCanvasController hitRep:withGesture:passingTest:](v6, "hitRep:withGesture:passingTest:", 0, v19, v12, v14);
  uint64_t v16 = TSUDynamicCast();
  if (!v16)
  {
    if (v25[5])
    {
      uint64_t v16 = 0;
    }
    else
    {
      uint64_t v16 = -[TSWPInteractiveCanvasController closestRepToPoint:](v6, "closestRepToPoint:", v12, v14);
      if (v16) {
        [(TSDInteractiveCanvasController *)v6 beginEditingRep:v16];
      }
    }
  }
  if (*((unsigned char *)v21 + 24)) {
    v17 = 0;
  }
  else {
    v17 = (void *)v16;
  }
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
  return v17;
}

BOOL __46__TSWPiOSCanvasViewController__hitRepAtPoint___block_invoke(uint64_t a1)
{
  objc_opt_class();
  id v2 = (void *)TSUDynamicCast();
  objc_super v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "convertNaturalPointFromUnscaledCanvas:", *(double *)(a1 + 64), *(double *)(a1 + 72));
    double v5 = v4;
    double v7 = v6;
    objc_opt_class();
    objc_msgSend(v3, "smartFieldAtPoint:", v5, v7);
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = TSUDynamicCast();
    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
      [*(id *)(a1 + 32) beginEditingRep:v3];
    }
  }
  else if ([*(id *)(a1 + 40) containsObject:objc_opt_class()])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  return v3 != 0;
}

- (id)_hyperLinkFieldAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v5 = [(TSWPiOSCanvasViewController *)self interactiveCanvasController];
  -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:](v5, "convertBoundsToUnscaledPoint:", x, y);
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:](v5, "convertBoundsToUnscaledPoint:", x, y);
  uint64_t v13 = 0;
  double v14 = &v13;
  uint64_t v15 = 0x3052000000;
  uint64_t v16 = __Block_byref_object_copy__23;
  v17 = __Block_byref_object_dispose__23;
  uint64_t v18 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __54__TSWPiOSCanvasViewController__hyperLinkFieldAtPoint___block_invoke;
  v12[3] = &unk_2646B2DC8;
  v12[5] = v7;
  v12[6] = v9;
  v12[4] = &v13;
  -[TSDInteractiveCanvasController hitRep:withGesture:passingTest:](v5, "hitRep:withGesture:passingTest:", 0, v12);
  uint64_t v10 = (void *)v14[5];
  _Block_object_dispose(&v13, 8);
  return v10;
}

uint64_t __54__TSWPiOSCanvasViewController__hyperLinkFieldAtPoint___block_invoke(uint64_t a1)
{
  objc_opt_class();
  uint64_t result = TSUDynamicCast();
  if (result)
  {
    objc_super v3 = (void *)result;
    objc_msgSend((id)result, "convertNaturalPointFromUnscaledCanvas:", *(double *)(a1 + 40), *(double *)(a1 + 48));
    double v5 = v4;
    double v7 = v6;
    objc_opt_class();
    objc_msgSend(v3, "smartFieldAtPoint:", v5, v7);
    uint64_t result = TSUDynamicCast();
    if (result)
    {
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
      return 1;
    }
  }
  return result;
}

- (BOOL)interactionShouldSuppressSystemUI:(id)a3
{
  return TSUSupportsTextInteraction() ^ 1;
}

- (BOOL)interactionShouldBegin:(id)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  int v7 = TSUSupportsTextInteraction();
  if (v7)
  {
    LOBYTE(v7) = -[TSWPiOSCanvasViewController _shouldAllowInteractionAtPoint:](self, "_shouldAllowInteractionAtPoint:", x, y);
  }
  return v7;
}

- (void)_resetLinkInteraction
{
  if (TSUSupportsTextInteraction())
  {
    self->_interactionHyperlinkField = 0;
    self->_isInteractingWithHyperLink = 0;
    self->_linkInteractionIsLongPress = 0;
  }
}

- (void)tapLinkAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (TSUSupportsTextInteraction())
  {
    -[TSWPiOSCanvasViewController startInteractionWithLinkAtPoint:](self, "startInteractionWithLinkAtPoint:", x, y);
    -[TSWPiOSCanvasViewController validateInteractionWithLinkAtPoint:](self, "validateInteractionWithLinkAtPoint:", x, y);
  }
}

- (BOOL)isInteractingWithLink
{
  int v3 = TSUSupportsTextInteraction();
  if (v3) {
    LOBYTE(v3) = self->_isInteractingWithHyperLink;
  }
  return v3;
}

- (void)startInteractionWithLinkAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (TSUSupportsTextInteraction())
  {
    self->_interactionHyperlinkField = (TSWPHyperlinkField *)-[TSWPiOSCanvasViewController _hyperLinkFieldAtPoint:](self, "_hyperLinkFieldAtPoint:", x, y);
    self->_interactionHyperLinkRep = (TSWPRep *)-[TSWPiOSCanvasViewController _hitRepAtPoint:](self, "_hitRepAtPoint:", x, y);
    self->_isInteractingWithHyperLink = 1;
  }
}

- (void)validateInteractionWithLinkAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (TSUSupportsTextInteraction() && self->_isInteractingWithHyperLink)
  {
    if (objc_msgSend(-[TSWPiOSCanvasViewController _hyperLinkFieldAtPoint:](self, "_hyperLinkFieldAtPoint:", x, y), "isEqual:", self->_interactionHyperlinkField))
    {
      self->_isInteractingWithHyperLink = 0;
      if (objc_opt_respondsToSelector())
      {
        if (self->_linkInteractionIsLongPress) {
          double v6 = TSWPLongPress;
        }
        else {
          double v6 = TSWPImmediateSingleTap;
        }
        int v7 = [[TSWPDummyTapGesture alloc] initWithKind:*v6];
        uint64_t v8 = [(TSWPiOSCanvasViewController *)self actionForHyperlink:self->_interactionHyperlinkField inRep:self->_interactionHyperLinkRep gesture:v7];
      }
      else
      {
        uint64_t v8 = +[TSWPHyperlinkAction hyperlinkActionWithHyperlink:self->_interactionHyperlinkField inRep:self->_interactionHyperLinkRep action:&__block_literal_global_44];
      }
      [(TSWPiOSCanvasViewController *)self startDelayedTapAction:v8];
    }
    else
    {
      [(TSWPiOSCanvasViewController *)self cancelInteractionWithLink];
    }
  }
}

uint64_t __66__TSWPiOSCanvasViewController_validateInteractionWithLinkAtPoint___block_invoke()
{
  id v0 = +[TSWPHyperlinkUIController sharedHyperlinkUIController];

  return [v0 visit];
}

- (void)cancelInteractionWithLink
{
  if (TSUSupportsTextInteraction())
  {
    [(TSWPiOSCanvasViewController *)self _resetAndClearInteractions];
  }
}

- (void)startLongInteractionWithLinkAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (TSUSupportsTextInteraction())
  {
    self->_linkInteractionIsLongPress = 1;
    -[TSWPiOSCanvasViewController validateInteractionWithLinkAtPoint:](self, "validateInteractionWithLinkAtPoint:", x, y);
  }
}

- (BOOL)willInteractWithLinkAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  int v6 = TSUSupportsTextInteraction();
  if (v6) {
    LOBYTE(v6) = -[TSWPiOSCanvasViewController _hyperLinkFieldAtPoint:](self, "_hyperLinkFieldAtPoint:", x, y) != 0;
  }
  return v6;
}

- (void)_requestTextItemConstrainedToLineAtPoint:(CGPoint)a3 resultHandler:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  int v7 = [(TSWPiOSCanvasViewController *)self interactiveCanvasController];
  -[TSDInteractiveCanvasController convertUnscaledToBoundsPoint:](v7, "convertUnscaledToBoundsPoint:", x, y);
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:](v7, "convertBoundsToUnscaledPoint:", x, y);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __86__TSWPiOSCanvasViewController__requestTextItemConstrainedToLineAtPoint_resultHandler___block_invoke;
  v12[3] = &unk_2646B2DF0;
  v12[6] = v9;
  void v12[7] = v11;
  *(double *)&v12[8] = x;
  *(double *)&v12[9] = y;
  v12[4] = v7;
  v12[5] = a4;
  -[TSDInteractiveCanvasController hitRep:withGesture:passingTest:](v7, "hitRep:withGesture:passingTest:", 0, v12);
}

BOOL __86__TSWPiOSCanvasViewController__requestTextItemConstrainedToLineAtPoint_resultHandler___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  objc_opt_class();
  id v2 = (void *)TSUDynamicCast();
  int v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "convertNaturalPointFromUnscaledCanvas:", *(double *)(a1 + 48), *(double *)(a1 + 56));
    double v4 = objc_msgSend(v3, "hyperlinkRegionsConstrainedToLineAtPoint:");
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v14 + 1) + 8 * i) CGRectValue];
          objc_msgSend(v3, "convertNaturalRectToUnscaledCanvas:");
          objc_msgSend(*(id *)(a1 + 32), "convertUnscaledToBoundsRect:");
          double x = v20.origin.x;
          double y = v20.origin.y;
          double width = v20.size.width;
          double height = v20.size.height;
          if (CGRectContainsPoint(v20, *(CGPoint *)(a1 + 64)))
          {
            (*(void (**)(double, double, double, double))(*(void *)(a1 + 40) + 16))(x, y, width, height);
            return v3 != 0;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
  }
  return v3 != 0;
}

- (TSWPSwipeGestureRecognizer)textLeftSwipeGestureRecognizer
{
  return self->_leftSwipeGestureRecognizer;
}

- (TSWPSwipeGestureRecognizer)textRightSwipeGestureRecognizer
{
  return self->_rightSwipeGestureRecognizer;
}

- (UITapGestureRecognizer)secondarySingleTapGestureRecognizer
{
  return self->_secondarySingleTapGestureRecognizer;
}

- (UIGestureRecognizer)hyperlinkGestureRecognizer
{
  return self->_hyperlinkGestureRecognizer;
}

- (TSWPLongPressGestureRecognizer)longPressGestureRecognizer
{
  return self->_longPressGestureRecognizer;
}

- (UITextInteraction)textInteraction
{
  return self->_textInteraction;
}

- (void)setTextInteraction:(id)a3
{
}

@end