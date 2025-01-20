@interface THiOSCanvasViewController
- (BCDDParsecCollectionViewController)lookupController;
- (BOOL)_shouldBeginCustomHighlighterActionForTouchType:(int64_t)a3 modifierFlags:(int64_t)initialTextInteractionModifiers;
- (BOOL)haveDeterminedInitialModifiers;
- (BOOL)isGlossaryPresented;
- (BOOL)shouldHideCanvasLayerInMagnifier;
- (BOOL)shouldIgnoreTextGestures;
- (BOOL)shouldPreventGestureFromEditingController:(id)a3;
- (BOOL)shouldSelectAndShowEditMenuOnFirstTapForRep:(id)a3;
- (BOOL)takeFirstResponderOnTap;
- (BOOL)wantsHyperlinkGestureRecognizer;
- (CGRect)p_glossaryTargetRect;
- (CGRect)rectForPresentedMenuForTextInteraction;
- (LTUITranslationViewController)translationController;
- (NSString)menuAnnotationUUID;
- (THGlossaryPopoverViewController)glossaryPopoverViewController;
- (THHighlightGestureController)highlightGestureController;
- (THInteractiveCanvasController)interactiveCanvasController;
- (THiOSCanvasViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (THiOSTraitsCache)traitsCache;
- (TSDInfo)glossaryHitInfo;
- (TSDTrackingController)trackingController;
- (UIEditMenuInteraction)editMenuInteraction;
- (UINavigationController)glossaryPopoverNavController;
- (UITapGestureRecognizer)delayedTFTapGestureRecognizer;
- (UITapGestureRecognizer)singleTFTapGestureRecognizer;
- (UIViewController)sharePopoverController;
- (_NSRange)glossaryRangeInRep;
- (id)_selectionDisplayInteraction;
- (id)_textInteractionBlockingRepClasses;
- (id)newNavigationControllerForGlossaryView:(id)a3;
- (id)p_activityItemsConfigurationWithSelectedAnnotation:(id)a3;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (int64_t)initialTextInteractionModifiers;
- (int64_t)p_styleForPresentation:(id)a3;
- (void)_accessibilityInvertColorsStatusDidChange:(id)a3;
- (void)_adjustZPositionIfNecessary;
- (void)_performHighlighterActionWithGestureState:(int64_t)a3 location:(CGPoint)a4;
- (void)_resetInteractionTracking;
- (void)_scheduleInteractionReset;
- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4;
- (void)buildMenuWithBuilder:(id)a3;
- (void)createHighlightForSelectionWithCurrentThemeWithCompletion:(id)a3;
- (void)createHighlightForSelectionWithStyle:(int)a3;
- (void)dealloc;
- (void)dismissGlossaryIfPopoverAnimated:(BOOL)a3;
- (void)dismissGlossaryPopoverAnimated:(BOOL)a3;
- (void)dismissSharePopover;
- (void)doneButtonPressed:(id)a3;
- (void)hideEditMenu;
- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5;
- (void)p_cleanupGlossaryPopover;
- (void)p_dismissGlossaryPopoverAnimated:(BOOL)a3 cleanup:(BOOL)a4;
- (void)p_presentGlossaryPopoverOfType:(int)a3 withTerm:(id)a4 targetRect:(CGRect)a5;
- (void)p_releaseOutlets;
- (void)presentGlossaryPopoverOfType:(int)a3 withTerm:(id)a4 rangeInRep:(_NSRange)a5 rep:(id)a6;
- (void)presentSharePopoverWithItemProvider:(id)a3 targetRect:(CGRect)a4;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)replaceGlossaryPopoverWithDictionaryForTerm:(id)a3;
- (void)repositionGlossaryIfPopoverAnimated:(BOOL)a3;
- (void)resetHighlightGestureRecognizers;
- (void)setDelayedTFTapGestureRecognizer:(id)a3;
- (void)setEditMenuInteraction:(id)a3;
- (void)setGlossaryHitInfo:(id)a3;
- (void)setGlossaryPopoverNavController:(id)a3;
- (void)setGlossaryPopoverViewController:(id)a3;
- (void)setGlossaryRangeInRep:(_NSRange)a3;
- (void)setHaveDeterminedInitialModifiers:(BOOL)a3;
- (void)setHighlightGestureController:(id)a3;
- (void)setInitialTextInteractionModifiers:(int64_t)a3;
- (void)setLookupController:(id)a3;
- (void)setMenuAnnotationUUID:(id)a3;
- (void)setRectForPresentedMenuForTextInteraction:(CGRect)a3;
- (void)setSharePopoverController:(id)a3;
- (void)setSingleTFTapGestureRecognizer:(id)a3;
- (void)setStyleOfExistingHighlight:(id)a3 to:(int)a4;
- (void)setTakeFirstResponderOnTap:(BOOL)a3;
- (void)setTrackingController:(id)a3;
- (void)setTraitsCache:(id)a3;
- (void)setTranslationController:(id)a3;
- (void)setUpGestureRecognizers;
- (void)shareSelection:(id)a3;
- (void)translateSelection:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation THiOSCanvasViewController

- (THiOSCanvasViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)THiOSCanvasViewController;
  v4 = [(THiOSCanvasViewController *)&v6 initWithNibName:a3 bundle:a4];
  if (v4) {
    [(THiOSCanvasViewController *)v4 registerForTraitChanges:+[UITraitCollection bc_allAPITraits] withAction:"_traitCollectionDidChange:previousTraitCollection:"];
  }
  return v4;
}

- (THInteractiveCanvasController)interactiveCanvasController
{
  objc_opt_class();

  return (THInteractiveCanvasController *)TSUDynamicCast();
}

- (void)dealloc
{
  [(THiOSCanvasViewController *)self p_releaseOutlets];

  self->_menuAnnotationUUID = 0;
  v3.receiver = self;
  v3.super_class = (Class)THiOSCanvasViewController;
  [(THiOSCanvasViewController *)&v3 dealloc];
}

- (void)p_releaseOutlets
{
  self->_traitsCache = 0;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)THiOSCanvasViewController;
  [(THiOSCanvasViewController *)&v4 viewDidLoad];
  [self.view setExclusiveTouch:0];
  [(THiOSCanvasViewController *)self setTakeFirstResponderOnTap:1];
  [self.view setBackgroundColor:[UIColor clearColor]];
  objc_super v3 = objc_opt_new();
  [(THiOSCanvasViewController *)self setTraitsCache:v3];

  -[THiOSCanvasViewController setEditMenuInteraction:](self, "setEditMenuInteraction:", [objc_alloc((Class)UIEditMenuInteraction) initWithDelegate:self]);
  [(-[THiOSCanvasViewController view](self, "view")) addInteraction:(-[THiOSCanvasViewController editMenuInteraction](self, "editMenuInteraction"))];
}

- (id)_selectionDisplayInteraction
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [[self view] interactions];
  id result = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (result)
  {
    id v4 = result;
    uint64_t v5 = *(void *)v8;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v8 != v5) {
        objc_enumerationMutation(v2);
      }
      objc_opt_class();
      id result = (id)TSUDynamicCast();
      if (result) {
        break;
      }
      if (v4 == (id)++v6)
      {
        id result = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
        id v4 = result;
        if (result) {
          goto LABEL_3;
        }
        return result;
      }
    }
  }
  return result;
}

- (void)_adjustZPositionIfNecessary
{
  id v2 = [(THiOSCanvasViewController *)self _selectionDisplayInteraction];
  objc_msgSend(objc_msgSend(objc_msgSend(v2, "highlightView"), "layer"), "setZPosition:", 10.0);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  [v2 handleViews];
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      long long v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * (void)v7), "layer"), "setZPosition:", 10.0);
        long long v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THiOSCanvasViewController;
  [(THiOSCanvasViewController *)&v4 viewWillAppear:a3];
  [(THiOSTraitsCache *)[(THiOSCanvasViewController *)self traitsCache] updateTraitsWithCollection:[(THiOSCanvasViewController *)self traitCollection]];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THiOSCanvasViewController;
  [(THiOSCanvasViewController *)&v4 viewDidAppear:a3];
  [+[NSNotificationCenter defaultCenter] addObserver:self selector:"_accessibilityInvertColorsStatusDidChange:" name:UIAccessibilityInvertColorsStatusDidChangeNotification object:0];
  [(THiOSCanvasViewController *)self _adjustZPositionIfNecessary];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THiOSCanvasViewController;
  [(THiOSCanvasViewController *)&v4 viewWillDisappear:a3];
  [+[NSNotificationCenter defaultCenter] removeObserver:self name:UIAccessibilityInvertColorsStatusDidChangeNotification object:0];
}

- (void)_accessibilityInvertColorsStatusDidChange:(id)a3
{
  id v3 = [(THiOSCanvasViewController *)self interactiveCanvasController];

  [(THInteractiveCanvasController *)v3 invalidateLayers];
}

- (BOOL)wantsHyperlinkGestureRecognizer
{
  return 0;
}

- (BOOL)shouldHideCanvasLayerInMagnifier
{
  return 0;
}

- (void)setUpGestureRecognizers
{
  v34.receiver = self;
  v34.super_class = (Class)THiOSCanvasViewController;
  [(THiOSCanvasViewController *)&v34 setUpGestureRecognizers];
  if (TSUSupportsTextInteraction())
  {
    id v3 = [(THiOSCanvasViewController *)self interactiveCanvasController];
    uint64_t v4 = TSWPImmediatePress;
    uint64_t v37 = TSWPImmediatePress;
    [(THInteractiveCanvasController *)v3 enableGestureKinds:+[NSArray arrayWithObjects:&v37 count:1]];
  }
  else
  {
    uint64_t v4 = TSWPImmediatePress;
  }
  id v5 = [(THInteractiveCanvasController *)[(THiOSCanvasViewController *)self interactiveCanvasController] gestureDispatcher];
  uint64_t v6 = [THShortTapGestureRecognizer alloc];
  [(THiOSCanvasViewController *)self setSingleTFTapGestureRecognizer:[(THShortTapGestureRecognizer *)v6 initWithGestureDispatcher:v5 gestureKind:TSDShortTap]];
  [(UITapGestureRecognizer *)[(THiOSCanvasViewController *)self singleTFTapGestureRecognizer] setAllowedTouchTypes:&off_499A10];
  [self viewForGestureRecognizer:[self singleTFTapGestureRecognizer] addGestureRecognizer:[self singleTFTapGestureRecognizer]];
  long long v7 = [THShortTapGestureRecognizer alloc];
  [(THiOSCanvasViewController *)self setDelayedTFTapGestureRecognizer:[(THShortTapGestureRecognizer *)v7 initWithGestureDispatcher:v5 gestureKind:TSDDelayedShortTap]];
  [(UITapGestureRecognizer *)[(THiOSCanvasViewController *)self delayedTFTapGestureRecognizer] setAllowedTouchTypes:&off_499A28];
  [self viewForGestureRecognizer:[self delayedTFTapGestureRecognizer] addGestureRecognizer:[self delayedTFTapGestureRecognizer]];
  id v8 = [(THInteractiveCanvasController *)[(THiOSCanvasViewController *)self interactiveCanvasController] gestureRecognizerWithKind:v4];
  [(UITapGestureRecognizer *)[(THiOSCanvasViewController *)self singleTFTapGestureRecognizer] requireGestureRecognizerToFail:v8];
  [(UITapGestureRecognizer *)[(THiOSCanvasViewController *)self delayedTFTapGestureRecognizer] requireGestureRecognizerToFail:v8];
  [(THiOSCanvasViewController *)self setHighlightGestureController:objc_alloc_init(THHighlightGestureController)];
  [(THHighlightGestureController *)[(THiOSCanvasViewController *)self highlightGestureController] setInteractiveCanvasController:[(THiOSCanvasViewController *)self interactiveCanvasController]];
  [(THHighlightGestureController *)[(THiOSCanvasViewController *)self highlightGestureController] setUpGestureRecognizers];
  [(THTimeoutDragGestureRecognizer *)[(THHighlightGestureController *)[(THiOSCanvasViewController *)self highlightGestureController] highlightGestureRecognizer] requireGestureRecognizerToFail:v8];
  long long v9 = [(THiOSCanvasViewController *)self interactiveCanvasController];
  uint64_t v10 = TSWPLongPress;
  [v9 gestureRecognizerWithKind:TSWPLongPress].requireGestureRecognizerToFail:[-[THiOSCanvasViewController highlightGestureController](self, "highlightGestureController") highlightGestureRecognizer]];
  [(UITapGestureRecognizer *)[(THiOSCanvasViewController *)self singleTFTapGestureRecognizer] requireGestureRecognizerToFail:[(THHighlightGestureController *)[(THiOSCanvasViewController *)self highlightGestureController] marginNotesGestureRecognizer]];
  [(UITapGestureRecognizer *)[(THiOSCanvasViewController *)self delayedTFTapGestureRecognizer] requireGestureRecognizerToFail:[(THHighlightGestureController *)[(THiOSCanvasViewController *)self highlightGestureController] marginNotesGestureRecognizer]];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v11 = [(THiOSCanvasViewController *)self panGestureRecognizers];
  id v12 = [v11 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v31;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v31 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        [v16 requireGestureRecognizerToFail:[self highlightGestureController] marginNotesGestureRecognizer];
        [v16 requireGestureRecognizerToFail:[self highlightGestureController].highlightGestureRecognizer];
        [v5 allowSimultaneousRecognitionByRecognizers:v8, v16];
      }
      id v13 = [v11 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v13);
  }
  [v5 allowSimultaneousRecognitionByRecognizers:[self interactiveCanvasController] gestureRecognizerWithKind:v10, [self highlightGestureController] highlightGestureRecognizer];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v17 = [-[THiOSCanvasViewController view](self, "view") gestureRecognizers];
  id v18 = [v17 countByEnumeratingWithState:&v26 objects:v35 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v27;
    id v21 = (id)TSWPTapAndTouch;
    do
    {
      for (j = 0; j != v19; j = (char *)j + 1)
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(v17);
        }
        v23 = *(void **)(*((void *)&v26 + 1) + 8 * (void)j);
        if ([v23 gestureKind] == v21) {
          [(UITapGestureRecognizer *)[(THiOSCanvasViewController *)self delayedTFTapGestureRecognizer] requireGestureRecognizerToFail:v23];
        }
      }
      id v19 = [v17 countByEnumeratingWithState:&v26 objects:v35 count:16];
    }
    while (v19);
  }
  v24 = [THWFreeTransformGestureRecognizer alloc];
  v25 = [(THWFreeTransformGestureRecognizer *)v24 initWithGestureDispatcher:v5 gestureKind:TSDFreeTransform];
  [(THWFreeTransformGestureRecognizer *)v25 setAllowedTouchTypes:&off_499A40];
  [self viewForGestureRecognizer:v25 addGestureRecognizer:v25];
  objc_opt_class();
  [(THiOSCanvasViewController *)self delegate];
  -[THWFreeTransformGestureRecognizer setUnmovingParentView:](v25, "setUnmovingParentView:", [(id)TSUDynamicCast() view]);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  [(THHighlightGestureController *)[(THiOSCanvasViewController *)self highlightGestureController] setEnabled:0];
  v8.receiver = self;
  v8.super_class = (Class)THiOSCanvasViewController;
  -[THiOSCanvasViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  [(THHighlightGestureController *)[(THiOSCanvasViewController *)self highlightGestureController] setEnabled:1];
}

- (BOOL)shouldSelectAndShowEditMenuOnFirstTapForRep:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)THiOSCanvasViewController;
  return [(THiOSCanvasViewController *)&v6 shouldSelectAndShowEditMenuOnFirstTapForRep:a3];
}

- (BOOL)shouldPreventGestureFromEditingController:(id)a3
{
  [a3 locationInView:[self view]];
  double v5 = v4;
  double v7 = v6;
  -[THInteractiveCanvasController hitRep:]([(THiOSCanvasViewController *)self interactiveCanvasController], "hitRep:", v4, v6);
  objc_opt_class();
  objc_super v8 = (void *)TSUDynamicCast();
  if (v8)
  {
    LOBYTE(v8) = [v8 hasMarginNoteAtCanvasPoint:v5, v7];
  }
  return (char)v8;
}

- (BOOL)shouldIgnoreTextGestures
{
  return +[THWPHighlightController activePopoverEditor] != 0;
}

- (void)hideEditMenu
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v3 postNotificationName:AEAnnotationPopoverShouldHideNotification object:self];
  v4.receiver = self;
  v4.super_class = (Class)THiOSCanvasViewController;
  [(THiOSCanvasViewController *)&v4 hideEditMenu];
}

- (void)buildMenuWithBuilder:(id)a3
{
  [a3 removeMenuForIdentifier:UIMenuLookup];
  [a3 removeMenuForIdentifier:UIMenuServices];
  [a3 replaceChildrenOfMenuForIdentifier:UIMenuStandardEdit fromChildrenBlock:&stru_459DC8];
  double y = CGPointZero.y;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v28 = 0u;
  id v6 = objc_msgSend(objc_msgSend(-[THiOSCanvasViewController view](self, "view", 0, 0), "interactions"), "reverseObjectEnumerator");
  double v7 = (char *)[v6 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v7)
  {
    objc_super v8 = v7;
    uint64_t v9 = *(void *)v28;
    uint64_t v10 = *(void *)&y;
    CGFloat x = CGPointZero.x;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_opt_class();
        id v13 = (void *)TSUDynamicCast();
        if (v13)
        {
          [v13 locationInView:[self view]];
          double v16 = v14;
          double v17 = v15;
          if (CGPointZero.x == v14 && y == v15)
          {
            uint64_t v10 = *(void *)&v15;
            CGFloat x = v14;
          }
          else
          {
            uint64_t v10 = 0x7FEFFFFFFFFFFFFFLL;
            BOOL v19 = v14 == 1.79769313e308 && v15 == 1.79769313e308;
            CGFloat x = 1.79769313e308;
            if (!v19) {
              goto LABEL_21;
            }
          }
        }
      }
      objc_super v8 = (char *)[v6 countByEnumeratingWithState:&v27 objects:v33 count:16];
      double v17 = *(double *)&v10;
      double v16 = x;
    }
    while (v8);
  }
  else
  {
    double v17 = y;
    double v16 = CGPointZero.x;
  }
LABEL_21:
  uint64_t v20 = -[THInteractiveCanvasController menuForHighlightAtLocation:]([(THiOSCanvasViewController *)self interactiveCanvasController], "menuForHighlightAtLocation:", v16, v17);
  if (v20)
  {
    id v21 = v20;
    id v22 = a3;
    CFStringRef v23 = (const __CFString *)UIMenuStandardEdit;
  }
  else
  {
    long long v32 = +[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", [(id)THBundle() localizedStringForKey:@"Copy" value:&stru_46D7E8 table:0], +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", @"doc.on.doc"), "copy:", @"C", 0x80000, 0);
    [a3 insertSiblingMenu:[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_46D7E8, 0, @"com.apple.iBooks.EditMenuGroup", 17, [NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v32, 1)) afterMenuForIdentifier:UIMenuStandardEdit];
    id v24 = +[_TtC8BookCore23BECustomViewMenuElement createHighlightMenuElementFor:4 annotationUUID:0 delegate:self];
    v25 = +[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", [(id)THBundle() localizedStringForKey:@"Add Note" value:&stru_46D7E8 table:0], +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", @"note.text"), "addNote:", @"N", 0x80000, 0);
    v31[0] = v24;
    v31[1] = v25;
    [a3 insertSiblingMenu:[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_46D7E8, 0, @"com.apple.iBooks.AnnotationMenuGroup", 17, [NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v31, 2)) afterMenuForIdentifier:@"com.apple.iBooks.EditMenuGroup"];
    id v26 = +[NSMutableArray array];
    [v26 addObject:[UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:
    [v26 addObject:[UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:action:propertyList:][UICommand commandWithTitle:image:
    objc_msgSend(v26, "addObject:", +[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", @"Search", &stru_46D7E8, 0), +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", @"doc.text.magnifyingglass"), "searchSelection:", 0));
    objc_msgSend(v26, "addObject:", +[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", @"Share", &stru_46D7E8, 0), +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", @"square.and.arrow.up"), "shareSelection:", 0));
    id v21 = +[UIMenu menuWithTitle:&stru_46D7E8 image:0 identifier:@"com.apple.iBooks.OtherMenuGroup" options:17 children:v26];
    id v22 = a3;
    CFStringRef v23 = @"com.apple.iBooks.AnnotationMenuGroup";
  }
  [v22 insertSiblingMenu:v21 afterMenuForIdentifier:v23];
  [a3 removeMenuForIdentifier:UIMenuStandardEdit];
}

- (void)shareSelection:(id)a3
{
  objc_super v4 = [(THiOSCanvasViewController *)self interactiveCanvasController];
  objc_opt_class();
  [v4 editorController].textInputEditor
  double v5 = (void *)TSUDynamicCast();

  [v5 shareSelection:self];
}

- (void)translateSelection:(id)a3
{
  objc_super v4 = [(THiOSCanvasViewController *)self interactiveCanvasController];
  objc_opt_class();
  [v4 editorController].textInputEditor
  double v5 = (void *)TSUDynamicCast();

  [v5 translateSelection:self];
}

- (void)createHighlightForSelectionWithCurrentThemeWithCompletion:(id)a3
{
  [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THiOSCanvasViewController createHighlightForSelectionWithCurrentThemeWithCompletion:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THiOSCanvasViewController.m") lineNumber:683 description:@"THiOSCanvasViewController createHighlightForSelectionWithCurrentTheme not implemented"];
  if (a3)
  {
    objc_super v4 = (void (*)(id, void))*((void *)a3 + 2);
    v4(a3, 0);
  }
}

- (void)createHighlightForSelectionWithStyle:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  double v5 = [(THiOSCanvasViewController *)self interactiveCanvasController];
  objc_opt_class();
  [v5 editorController].textInputEditor;
  id v6 = (void *)TSUDynamicCast();
  [v6 addHighlightWithStyle:v3 forSender:self];

  [v6 setSelection:0];
}

- (void)setStyleOfExistingHighlight:(id)a3 to:(int)a4
{
  id v4 = +[TSUAssertionHandler currentHandler];
  double v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THiOSCanvasViewController setStyleOfExistingHighlight:to:]");
  id v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THiOSCanvasViewController.m"];

  [v4 handleFailureInFunction:v5 file:v6 lineNumber:700 description:@"THiOSCanvasViewController setStyleOfExistingHighlight:to: not implemented"];
}

- (id)p_activityItemsConfigurationWithSelectedAnnotation:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = [objc_alloc((Class)NSItemProvider) initWithObject:[AEAnnotationCatalystItemProvider itemProviderWithAnnotation:propertyProvider:](AEAnnotationCatalystItemProvider, "itemProviderWithAnnotation:propertyProvider:", a3, 0)];
  return [objc_alloc((Class)UIActivityItemsConfiguration) initWithItemProviders:[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v4, 1)];
}

- (int64_t)p_styleForPresentation:(id)a3
{
  id v3 = a3;
  if (a3 || (id v3 = [(THiOSCanvasViewController *)self traitCollection]) != 0)
  {
    id v4 = (char *)[v3 horizontalSizeClass];
    if ([v3 verticalSizeClass] == (char *)&dword_0 + 1 || v4 == (unsigned char *)&dword_0 + 1) {
      return 0;
    }
    else {
      return 7;
    }
  }
  else
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THiOSCanvasViewController p_styleForPresentation:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THiOSCanvasViewController.m") lineNumber:778 description:@"invalid nil value for '%s'", "traitCollection"];
    return 0;
  }
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  id v5 = [(THiOSCanvasViewController *)self traitCollection];

  return [(THiOSCanvasViewController *)self adaptivePresentationStyleForPresentationController:a3 traitCollection:v5];
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  int64_t v6 = [(THiOSCanvasViewController *)self p_styleForPresentation:a4];
  id v7 = [a3 presentedViewController];
  if (v7 == [THGlossaryPopoverViewController navigationController][-[THiOSCanvasViewController glossaryPopoverViewController](self, "glossaryPopoverViewController") navigationController])[THGlossaryPopoverViewController navigationController][-[THiOSCanvasViewController glossaryPopoverViewController](self, "glossaryPopoverViewController") navigationController] setNavigationBarHidden:v6 == 7; {
  return v6;
  }
}

- (void)p_cleanupGlossaryPopover
{
  [(THiOSCanvasViewController *)self setGlossaryPopoverViewController:0];
  [(THiOSCanvasViewController *)self setGlossaryPopoverNavController:0];

  [(THiOSCanvasViewController *)self setGlossaryHitInfo:0];
}

- (void)doneButtonPressed:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_139450;
  v3[3] = &unk_456DE0;
  v3[4] = self;
  [(THiOSCanvasViewController *)self dismissViewControllerAnimated:1 completion:v3];
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4 = (BCDDParsecCollectionViewController *)[a3 presentedViewController];
  if (v4 == [(THGlossaryPopoverViewController *)[(THiOSCanvasViewController *)self glossaryPopoverViewController] navigationController])
  {
    [(THiOSCanvasViewController *)self p_cleanupGlossaryPopover];
  }
  else if (v4 == [(THiOSCanvasViewController *)self lookupController])
  {
    [(THiOSCanvasViewController *)self setLookupController:0];
  }
  else if (v4 == (BCDDParsecCollectionViewController *)[(THiOSCanvasViewController *)self sharePopoverController])
  {
    [(THiOSCanvasViewController *)self setSharePopoverController:0];
  }
  else if (v4 == [(THiOSCanvasViewController *)self translationController])
  {
    [(THiOSCanvasViewController *)self setTranslationController:0];
  }
}

- (id)newNavigationControllerForGlossaryView:(id)a3
{
  if ([(THiOSCanvasViewController *)self im_isCompactWidth]) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = [(THiOSCanvasViewController *)self im_isCompactHeight] ^ 1;
  }
  id v6 = [objc_alloc((Class)UINavigationController) initWithRootViewController:a3];
  [v6 setNavigationBarHidden:v5];
  [v6 setToolbarHidden:0];
  id v7 = [v6 toolbar];
  [v7 setOpaque:0];
  [v7 setTranslucent:1];
  [v7 _setHidesShadow:1];
  id v8 = [a3 themePage];
  uint64_t v9 = (UIColor *)[v8 popoverBackgroundColor];
  uint64_t v10 = (UIColor *)[v8 keyColor];
  id v11 = [v8 dividerColor];
  id v12 = [objc_alloc((Class)BEHairlineDividerView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v7 addSubview:v12];
  id v13 = [v12 heightAnchor];
  [+[UIScreen mainScreen] scale];
  v23[0] = [v13 constraintEqualToConstant:1.0 / v14];
  v23[1] = objc_msgSend(objc_msgSend(v12, "leadingAnchor"), "constraintEqualToAnchor:", objc_msgSend(v7, "leadingAnchor"));
  v23[2] = objc_msgSend(objc_msgSend(v12, "trailingAnchor"), "constraintEqualToAnchor:", objc_msgSend(v7, "trailingAnchor"));
  v23[3] = objc_msgSend(objc_msgSend(v12, "topAnchor"), "constraintEqualToAnchor:", objc_msgSend(v7, "topAnchor"));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", +[NSArray arrayWithObjects:v23 count:4]);
  id v15 = [v8 identifier];
  if ([v15 isEqualToString:kIMThemeIdentifierBlissClassicTheme])
  {
    uint64_t v9 = +[UIColor colorWithWhite:1.0 alpha:0.97];
    uint64_t v10 = +[UIColor systemBlueColor];
  }
  [v7 setBackgroundColor:v9];
  [v7 setBarTintColor:v9];
  [v7 setTintColor:v10];
  [v12 setBackgroundColor:v11];
  objc_msgSend(v6, "setOverrideUserInterfaceStyle:", objc_msgSend(v8, "userInterfaceStyle"));
  id v16 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"doneButtonPressed:"];
  objc_msgSend(objc_msgSend(a3, "navigationItem"), "setRightBarButtonItem:animated:", v16, 0);

  id v17 = [objc_alloc((Class)UIBarButtonItem) initWithTitle:[THBundle localizedStringForKey:@"Glossary Index" value:&stru_46D7E8 table:0] style:0 target:a3 action:@"showGlossaryIndex"];
  id v18 = [objc_alloc((Class)UIBarButtonItem) initWithTitle:[THBundle localizedStringForKey:@"Look Up" value:&stru_46D7E8 table:0] style:0 target:a3 action:@"showDictionaryEntry"];
  id v19 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:5 target:0 action:0];
  id v20 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:6 target:0 action:0];
  +[THGlossaryPopoverViewController toolbarButtonHInset];
  [v20 setWidth:];
  v22[0] = v20;
  v22[1] = v17;
  v22[2] = v19;
  v22[3] = v18;
  v22[4] = v20;
  [a3 setToolbarItems:[NSArray arrayWithObjects:count:v22, 5]];

  return v6;
}

- (CGRect)p_glossaryTargetRect
{
  objc_opt_class();
  [(THInteractiveCanvasController *)[(THiOSCanvasViewController *)self interactiveCanvasController] repForInfo:[(THiOSCanvasViewController *)self glossaryHitInfo]];
  uint64_t v3 = TSUDynamicCast();
  if (v3)
  {
    id v4 = (void *)v3;
    id v5 = [(THiOSCanvasViewController *)self glossaryRangeInRep];
    [v4 popoverPresentationRectForRange:v5, v6];
    double v8 = v7;
    double v10 = v9;
    [v4 frameInUnscaledCanvas];
    TSDAddPoints();
    objc_msgSend(objc_msgSend(v4, "interactiveCanvasController"), "convertUnscaledToBoundsRect:", v11, v12, v8, v10);
  }
  else
  {
    double x = CGRectZero.origin.x;
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)presentGlossaryPopoverOfType:(int)a3 withTerm:(id)a4 rangeInRep:(_NSRange)a5 rep:(id)a6
{
  if (a6)
  {
    uint64_t v9 = *(void *)&a3;
    -[THiOSCanvasViewController setGlossaryRangeInRep:](self, "setGlossaryRangeInRep:", a5.location, a5.length);
    -[THiOSCanvasViewController setGlossaryHitInfo:](self, "setGlossaryHitInfo:", [a6 info]);
    [(THiOSCanvasViewController *)self p_glossaryTargetRect];
    -[THiOSCanvasViewController p_presentGlossaryPopoverOfType:withTerm:targetRect:](self, "p_presentGlossaryPopoverOfType:withTerm:targetRect:", v9, a4);
  }
  else
  {
    -[THiOSCanvasViewController setGlossaryHitInfo:](self, "setGlossaryHitInfo:", 0, a4, a5.location, a5.length);
  }
}

- (void)replaceGlossaryPopoverWithDictionaryForTerm:(id)a3
{
  id v5 = [(THiOSCanvasViewController *)self glossaryHitInfo];
  if (a3 && v5)
  {
    [(THiOSCanvasViewController *)self p_glossaryTargetRect];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    [(THiOSCanvasViewController *)self p_dismissGlossaryPopoverAnimated:0 cleanup:0];
    -[THiOSCanvasViewController p_presentGlossaryPopoverOfType:withTerm:targetRect:](self, "p_presentGlossaryPopoverOfType:withTerm:targetRect:", 2, a3, v7, v9, v11, v13);
  }
}

- (void)p_presentGlossaryPopoverOfType:(int)a3 withTerm:(id)a4 targetRect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  objc_opt_class();
  [(THiOSCanvasViewController *)self delegate];
  double v12 = (void *)TSUDynamicCast();
  id v13 = [v12 view];
  [v13 convertRect:x, y, width, height fromView:[self view]];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  if (objc_msgSend(v12, "im_isCompactWidth")) {
    unsigned int v22 = 1;
  }
  else {
    unsigned int v22 = [v12 im_isCompactHeight];
  }
  if (a3 == 3)
  {
    id v27 = objc_alloc_init((Class)LTUITranslationViewController);
    id v28 = [objc_alloc((Class)NSAttributedString) initWithString:a4];
    id v37 = v28;
    if ((v22 & 1) == 0)
    {
      [v27 setModalPresentationStyle:7];
      id v28 = v37;
    }
    [v27 setText:v28];
    [v27 setIsSourceEditable:0];
    objc_msgSend(v27, "setOverrideUserInterfaceStyle:", objc_msgSend(v12, "overrideUserInterfaceStyle"));
    id v29 = [v27 popoverPresentationController];
    [v29 setSourceView:v13];
    [v29 setSourceRect:v15, v17, v19, v21];
    [v29 setPermittedArrowDirections:15];
    [v29 setDelegate:self];
    [v29 bc_applyTraitOverridesWithOverrideUserInterfaceStyleFromViewController:v12];
    [(THiOSCanvasViewController *)self bc_presentViewController:v27 animated:1 tintColor:+[UIColor bc_booksKeyColor] completion:0];
    [(THiOSCanvasViewController *)self setTranslationController:v27];

LABEL_21:

    return;
  }
  if (a3 != 2)
  {
    if (a3) {
      return;
    }
    id v23 = objc_msgSend(objc_msgSend(v12, "documentRoot"), "glossaryController");
    id v24 = v23;
    if (v22)
    {
      id v25 = [[[v23 model] entryForTerm:a4];
      id v26 = [[THApplePubAssetPlugin sharedPlugin] existingBookViewControllerForDocumentRoot:[-[THiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController") documentRoot]];
      [v26 showGlossaryEntry:v25];
      return;
    }
    id v32 = [[THApplePubAssetPlugin sharedPlugin] existingBookViewControllerForDocumentRoot:[self interactiveCanvasController].documentRoot];
    v38 = [[THGlossaryPopoverViewController alloc] initWithTerm:a4 glossaryController:v24];
    [(THGlossaryPopoverViewController *)v38 setBookViewController:v32];
    objc_opt_class();
    [(THiOSCanvasViewController *)self im_theme];
    uint64_t v33 = TSUDynamicCast();
    if (v33) {
      [(THGlossaryPopoverViewController *)v38 setTheme:v33];
    }
    [(THiOSCanvasViewController *)self setGlossaryPopoverViewController:v38];

    self->_glossaryPopoverNavController = 0;
    self->_glossaryPopoverNavController = (UINavigationController *)[(THiOSCanvasViewController *)self newNavigationControllerForGlossaryView:v38];
    [(THGlossaryPopoverViewController *)v38 preferredContentSize];
    -[UINavigationController setPreferredContentSize:]([(THiOSCanvasViewController *)self glossaryPopoverNavController], "setPreferredContentSize:", v34, v35);
    [(THGlossaryPopoverViewController *)v38 setGlossaryPresenting:self];
    [(UINavigationController *)[(THiOSCanvasViewController *)self glossaryPopoverNavController] setModalPresentationStyle:7];
    id v36 = [(UINavigationController *)[(THiOSCanvasViewController *)self glossaryPopoverNavController] popoverPresentationController];
    [v36 setSourceView:v13];
    [v36 setSourceRect:v15, v17, v19, v21];
    [v36 setPermittedArrowDirections:3];
    [v36 setDelegate:self];
    [v36 bc_applyTraitOverridesWithOverrideUserInterfaceStyleFromViewController:v38];
    [(THiOSCanvasViewController *)self presentViewController:[(THiOSCanvasViewController *)self glossaryPopoverNavController] animated:1 completion:0];
    goto LABEL_21;
  }
  id v30 = [objc_alloc((Class)BCDDParsecCollectionViewController) initWithString:a4 range:0, [a4 length]];
  [v30 setOverrideUserInterfaceStyle:[v12 overrideUserInterfaceStyle]];
  if ((v22 & 1) == 0) {
    [v30 setModalPresentationStyle:7];
  }
  id v31 = [v30 popoverPresentationController];
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_13A0D4;
  v39[3] = &unk_457868;
  v39[4] = [v30 dismissCompletionHandler];
  [v30 setDismissCompletionHandler:v39];
  [v31 setSourceView:v13];
  [v31 setSourceRect:v15, v17, v19, v21];
  [v31 setPermittedArrowDirections:15];
  [v31 setDelegate:self];
  [v31 bc_applyTraitOverridesWithOverrideUserInterfaceStyleFromViewController:v12];
  [(THiOSCanvasViewController *)self bc_presentViewController:v30 animated:1 tintColor:+[UIColor bc_booksKeyColor] completion:0];
  [(THiOSCanvasViewController *)self setLookupController:v30];
}

- (void)dismissGlossaryIfPopoverAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (([(THGlossaryPopoverViewController *)[(THiOSCanvasViewController *)self glossaryPopoverViewController] _isInPopoverPresentation] & 1) != 0|| ([(BCDDParsecCollectionViewController *)[(THiOSCanvasViewController *)self lookupController] _isInPopoverPresentation] & 1) != 0|| [(LTUITranslationViewController *)[(THiOSCanvasViewController *)self translationController] _isInPopoverPresentation])
  {
    [(THiOSCanvasViewController *)self dismissGlossaryPopoverAnimated:v3];
  }
}

- (void)dismissGlossaryPopoverAnimated:(BOOL)a3
{
}

- (void)p_dismissGlossaryPopoverAnimated:(BOOL)a3 cleanup:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  [(THGlossaryPopoverViewController *)[(THiOSCanvasViewController *)self glossaryPopoverViewController] dismissViewControllerAnimated:a3 completion:0];
  [(BCDDParsecCollectionViewController *)[(THiOSCanvasViewController *)self lookupController] dismissViewControllerAnimated:v5 completion:0];
  [(THiOSCanvasViewController *)self setLookupController:0];
  [(LTUITranslationViewController *)[(THiOSCanvasViewController *)self translationController] dismissViewControllerAnimated:v5 completion:0];
  [(THiOSCanvasViewController *)self setTranslationController:0];
  if (v4)
  {
    [(THiOSCanvasViewController *)self p_cleanupGlossaryPopover];
  }
}

- (void)resetHighlightGestureRecognizers
{
  [(THHighlightGestureController *)[(THiOSCanvasViewController *)self highlightGestureController] setEnabled:0];
  BOOL v3 = [(THiOSCanvasViewController *)self highlightGestureController];

  [(THHighlightGestureController *)v3 setEnabled:1];
}

- (void)repositionGlossaryIfPopoverAnimated:(BOOL)a3
{
  if ([(THiOSCanvasViewController *)self glossaryHitInfo])
  {
    [(THiOSCanvasViewController *)self p_glossaryTargetRect];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    objc_opt_class();
    [(THiOSCanvasViewController *)self delegate];
    objc_msgSend(objc_msgSend((id)TSUDynamicCast(), "view"), "convertRect:fromView:", -[THiOSCanvasViewController view](self, "view"), v5, v7, v9, v11);
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    if ([-[THGlossaryPopoverViewController _isInPopoverPresentation](-[THiOSCanvasViewController glossaryPopoverViewController](self, "glossaryPopoverViewController"), "_isInPopoverPresentation")]) {
    [(-[BCDDParsecCollectionViewController popoverPresentationController](-[THiOSCanvasViewController lookupController](self, "lookupController"), "popoverPresentationController")) setSourceRect:v13, v15, v17, v19];
    }
    id v20 = [(LTUITranslationViewController *)[(THiOSCanvasViewController *)self translationController] popoverPresentationController];
    [v20 setSourceRect:v13, v15, v17, v19];
  }
}

- (BOOL)isGlossaryPresented
{
  return [(THiOSCanvasViewController *)self glossaryPopoverViewController] != 0;
}

- (void)presentSharePopoverWithItemProvider:(id)a3 targetRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  objc_opt_class();
  [(THiOSCanvasViewController *)self delegate];
  double v10 = (void *)TSUDynamicCast();
  id v13 = [objc_alloc((Class)IMActivityController) initWithActivityItems:[NSArray arrayWithObject:a3] applicationActivities:0 shareType:[a3 shareType] propertySource:[a3 propertySource] tracker:[self ba_effectiveAnalyticsTracker]];
  objc_msgSend(v13, "setManagedBook:", objc_msgSend(objc_msgSend(objc_msgSend(-[THInteractiveCanvasController documentRoot](-[THiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"), "documentRoot"), "bookDescription"), "asset"), "isManagedBook"));
  id v11 = [v13 viewController];
  [v11 setModalPresentationStyle:7];
  [v11 setOverrideUserInterfaceStyle:[v10 overrideUserInterfaceStyle]];
  id v12 = [v11 popoverPresentationController];
  [v12 setDelegate:self];
  [v12 setPermittedArrowDirections:15];
  [v12 setSourceView:[self interactiveCanvasController].canvasView];
  [v12 setSourceRect:x, y, width, height];
  [v12 bc_applyTraitOverridesWithOverrideUserInterfaceStyleFromViewController:v10];
  [(THiOSCanvasViewController *)self setSharePopoverController:v11];
  [(THiOSCanvasViewController *)self bc_presentViewController:v11 animated:1 tintColor:+[UIColor bc_booksKeyColor] completion:0];
}

- (void)dismissSharePopover
{
  BOOL v3 = [(THiOSCanvasViewController *)self sharePopoverController];
  if (v3)
  {
    double v4 = v3;
    if ([(UIViewController *)v3 _isInPopoverPresentation])
    {
      [(UIViewController *)v4 dismissViewControllerAnimated:0 completion:0];
      [(THiOSCanvasViewController *)self setSharePopoverController:0];
    }
  }
}

- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5
{
  if (a4 == 3)
  {
    id v6 = [(id)THBundle() localizedStringForKey:@"Error" value:&stru_46D7E8 table:0];
    double v7 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v6, [(id)THBundle() localizedStringForKey:@"Failed to send email" value:&stru_46D7E8 table:0], 1);
    -[UIAlertController addAction:](v7, "addAction:", +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", [(id)THBundle() localizedStringForKey:@"OK" value:&stru_46D7E8 table:0], 1, 0));
    [(THiOSCanvasViewController *)self presentViewController:v7 animated:1 completion:0];
  }

  [(THiOSCanvasViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  double v5 = [(THiOSCanvasViewController *)self traitsCache];
  id v6 = [(THiOSCanvasViewController *)self traitCollection];

  [(THiOSTraitsCache *)v5 updateTraitsWithCollection:v6];
}

- (void)_resetInteractionTracking
{
  self->_haveDeterminedInitialModifiers = 0;
  self->_initialTextInteractionModifiers = 0;
}

- (void)_scheduleInteractionReset
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_resetInteractionTracking" object:0];

  [(THiOSCanvasViewController *)self performSelector:"_resetInteractionTracking" withObject:0 afterDelay:0.25];
}

- (BOOL)_shouldBeginCustomHighlighterActionForTouchType:(int64_t)a3 modifierFlags:(int64_t)initialTextInteractionModifiers
{
  if (a3 == 3)
  {
    if (self->_haveDeterminedInitialModifiers)
    {
      initialTextInteractionModifiers = self->_initialTextInteractionModifiers;
    }
    else
    {
      self->_haveDeterminedInitialModifiers = 1;
      self->_initialTextInteractionModifiers = initialTextInteractionModifiers;
    }
    unint64_t v4 = ((unint64_t)initialTextInteractionModifiers >> 20) & 1;
  }
  else
  {
    LOBYTE(v4) = 1;
  }
  [(THiOSCanvasViewController *)self _scheduleInteractionReset];
  return v4;
}

- (void)_performHighlighterActionWithGestureState:(int64_t)a3 location:(CGPoint)a4
{
}

- (id)_textInteractionBlockingRepClasses
{
  uint64_t v3 = objc_opt_class();
  return +[NSSet setWithArray:](NSSet, "setWithArray:", +[NSArray arrayWithObjects:&v3 count:1]);
}

- (UITapGestureRecognizer)singleTFTapGestureRecognizer
{
  return self->mSingleTFTapGestureRecognizer;
}

- (void)setSingleTFTapGestureRecognizer:(id)a3
{
}

- (UITapGestureRecognizer)delayedTFTapGestureRecognizer
{
  return self->mDelayedTFTapGestureRecognizer;
}

- (void)setDelayedTFTapGestureRecognizer:(id)a3
{
}

- (THHighlightGestureController)highlightGestureController
{
  return self->mHighlightGestureController;
}

- (void)setHighlightGestureController:(id)a3
{
}

- (THGlossaryPopoverViewController)glossaryPopoverViewController
{
  return self->mGlossaryPopoverViewController;
}

- (void)setGlossaryPopoverViewController:(id)a3
{
}

- (BOOL)takeFirstResponderOnTap
{
  return self->mTakeFirstResponderOnTap;
}

- (void)setTakeFirstResponderOnTap:(BOOL)a3
{
  self->mTakeFirstResponderOnTap = a3;
}

- (TSDTrackingController)trackingController
{
  return self->_trackingController;
}

- (void)setTrackingController:(id)a3
{
}

- (BCDDParsecCollectionViewController)lookupController
{
  return self->_lookupController;
}

- (void)setLookupController:(id)a3
{
}

- (LTUITranslationViewController)translationController
{
  return self->_translationController;
}

- (void)setTranslationController:(id)a3
{
}

- (UIViewController)sharePopoverController
{
  return self->_sharePopoverController;
}

- (void)setSharePopoverController:(id)a3
{
}

- (UINavigationController)glossaryPopoverNavController
{
  return self->_glossaryPopoverNavController;
}

- (void)setGlossaryPopoverNavController:(id)a3
{
}

- (_NSRange)glossaryRangeInRep
{
  p_glossaryRangeInRep = &self->_glossaryRangeInRep;
  NSUInteger location = self->_glossaryRangeInRep.location;
  NSUInteger length = p_glossaryRangeInRep->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setGlossaryRangeInRep:(_NSRange)a3
{
  self->_glossaryRangeInRep = a3;
}

- (TSDInfo)glossaryHitInfo
{
  return self->_glossaryHitInfo;
}

- (void)setGlossaryHitInfo:(id)a3
{
}

- (THiOSTraitsCache)traitsCache
{
  return self->_traitsCache;
}

- (void)setTraitsCache:(id)a3
{
}

- (BOOL)haveDeterminedInitialModifiers
{
  return self->_haveDeterminedInitialModifiers;
}

- (void)setHaveDeterminedInitialModifiers:(BOOL)a3
{
  self->_haveDeterminedInitialModifiers = a3;
}

- (int64_t)initialTextInteractionModifiers
{
  return self->_initialTextInteractionModifiers;
}

- (void)setInitialTextInteractionModifiers:(int64_t)a3
{
  self->_initialTextInteractionModifiers = a3;
}

- (NSString)menuAnnotationUUID
{
  return self->_menuAnnotationUUID;
}

- (void)setMenuAnnotationUUID:(id)a3
{
}

- (CGRect)rectForPresentedMenuForTextInteraction
{
  double x = self->_rectForPresentedMenuForTextInteraction.origin.x;
  double y = self->_rectForPresentedMenuForTextInteraction.origin.y;
  double width = self->_rectForPresentedMenuForTextInteraction.size.width;
  double height = self->_rectForPresentedMenuForTextInteraction.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setRectForPresentedMenuForTextInteraction:(CGRect)a3
{
  self->_rectForPresentedMenuForTextInteraction = a3;
}

- (UIEditMenuInteraction)editMenuInteraction
{
  return self->_editMenuInteraction;
}

- (void)setEditMenuInteraction:(id)a3
{
}

@end