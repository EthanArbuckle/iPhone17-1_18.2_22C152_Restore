@interface TSWPHyperlinkUIController
+ (id)defaultTableView;
+ (id)sharedHyperlinkUIController;
- (BOOL)hasOpenSessionForHyperlinkField:(id)a3;
- (BOOL)hasStartedSession;
- (BOOL)isCanvasInReadMode;
- (BOOL)isDisplayingHyperlinkUI;
- (BOOL)p_shouldSetCanvasSelectionWhenDismissing;
- (BOOL)p_shouldSetTextSelectionWhenDismissing;
- (BOOL)shouldMaintainKeyboardWhenEndingSession;
- (CGRect)p_viewBoundsForField;
- (NSString)editedDisplayText;
- (NSString)editedURLString;
- (NSString)stringForDisplay;
- (NSString)stringForURL;
- (TSWPEditingController)editingController;
- (TSWPInteractiveCanvasController)interactiveCanvasController;
- (UIViewController)viewControllerForPresenting;
- (int)p_UIState;
- (void)dealloc;
- (void)endUISession;
- (void)hideHyperlinkHighlight;
- (void)i_openURLAction;
- (void)p_clearTextSelection;
- (void)p_initChangeSessionAuthorCreatedWithCommand:(id *)a3;
- (void)p_selectHyperlinkField;
- (void)p_stopObservingStorage;
- (void)setEditedDisplayText:(id)a3;
- (void)setEditedURLString:(id)a3;
- (void)setKeyboardSuppressedAndTextInputEditorIgnoresFirstResponderChanges:(BOOL)a3;
- (void)setShouldMaintainKeyboardWhenEndingSession:(BOOL)a3;
- (void)showHyperlinkHighlight;
- (void)startUISessionForHyperlinkField:(id)a3 inRep:(id)a4;
- (void)visit;
@end

@implementation TSWPHyperlinkUIController

- (BOOL)isCanvasInReadMode
{
  v2 = [(TSWPHyperlinkUIController *)self interactiveCanvasController];

  return [(TSDInteractiveCanvasController *)v2 inReadMode];
}

+ (id)sharedHyperlinkUIController
{
  id result = (id)+[TSWPHyperlinkUIController sharedHyperlinkUIController]::instance;
  if (!+[TSWPHyperlinkUIController sharedHyperlinkUIController]::instance)
  {
    +[TSWPHyperlinkUIController sharedHyperlinkUIController]::instance = objc_alloc_init(TSWPHyperlinkUIController);
    v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:+[TSWPHyperlinkUIController sharedHyperlinkUIController]::instance selector:sel_p_documentUIWillCloseNotification_ name:@"TSKDocumentUIWillCloseNotification" object:0];
    return (id)+[TSWPHyperlinkUIController sharedHyperlinkUIController]::instance;
  }
  return result;
}

- (int)p_UIState
{
  if (self->_hyperlinkField) {
    return 5;
  }
  else {
    return 0;
  }
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:", self);

  v3.receiver = self;
  v3.super_class = (Class)TSWPHyperlinkUIController;
  [(TSWPHyperlinkUIController *)&v3 dealloc];
}

- (void)visit
{
  objc_msgSend(+[TSKApplicationDelegate sharedDelegate](TSKApplicationDelegate, "sharedDelegate"), "openURL:", -[TSWPHyperlinkField url](self->_hyperlinkField, "url"));

  [(TSWPHyperlinkUIController *)self endUISession];
}

- (void)setKeyboardSuppressedAndTextInputEditorIgnoresFirstResponderChanges:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = [(TSWPHyperlinkUIController *)self interactiveCanvasController];

  [(TSDInteractiveCanvasController *)v4 setKeyboardSuppressedAndTextInputEditorIgnoresFirstResponderChanges:v3];
}

- (void)startUISessionForHyperlinkField:(id)a3 inRep:(id)a4
{
  if (![(TSWPHyperlinkUIController *)self p_UIState])
  {
    self->_hyperlinkRep = (TSWPHyperlinkHostRepProtocol *)a4;
    self->_hyperlinkField = (TSWPHyperlinkField *)a3;
    v7 = [TSWPFilteredStorage alloc];
    v8 = [(TSWPSmartField *)self->_hyperlinkField parentStorage];
    uint64_t v9 = [(TSWPSmartField *)self->_hyperlinkField range];
    uint64_t v11 = v10;
    v12 = [(TSWPSmartField *)self->_hyperlinkField parentStorage];
    uint64_t v13 = [(TSWPSmartField *)self->_hyperlinkField range];
    v15 = -[TSWPFilteredStorage initWithStorage:subRange:removeRanges:](v7, "initWithStorage:subRange:removeRanges:", v8, v9, v11, -[TSWPStorage deletedRangesInRange:](v12, "deletedRangesInRange:", v13, v14));
    self->_originalDisplayText = (NSString *)[(TSWPFilteredStorage *)v15 string];

    self->_changeSession = 0;
    v16 = [(TSWPSmartField *)self->_hyperlinkField parentStorage];
    self->_observedStorage = v16;
    [(TSWPStorage *)v16 addObserver:self];
    ++self->_hyperlinkUISessionID;
  }
}

- (BOOL)hasOpenSessionForHyperlinkField:(id)a3
{
  return self->_hyperlinkField == a3;
}

- (BOOL)hasStartedSession
{
  return [(TSWPHyperlinkUIController *)self p_UIState] != 0;
}

- (void)p_stopObservingStorage
{
  observedStorage = self->_observedStorage;
  if (observedStorage)
  {
    [(TSWPStorage *)observedStorage removeObserver:self];
    self->_observedStorage = 0;
  }
}

- (void)endUISession
{
  if (self->_hyperlinkRep)
  {
    [(TSWPHyperlinkUIController *)self hideHyperlinkHighlight];
    if (!self->_shouldMaintainKeyboardWhenEndingSession)
    {
      BOOL v3 = [(TSWPHyperlinkUIController *)self interactiveCanvasController];
      dispatch_time_t v4 = dispatch_time(0, 300000000);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __41__TSWPHyperlinkUIController_endUISession__block_invoke;
      block[3] = &unk_2646AF7B8;
      block[4] = v3;
      dispatch_after(v4, MEMORY[0x263EF83A0], block);
    }

    self->_hyperlinkRep = 0;
    self->_hyperlinkField = 0;

    self->_originalDisplayText = 0;
    self->_editedDisplayText = 0;

    self->_editedURLString = 0;
    self->_cachedEditingController = 0;
  }
  [(TSWPHyperlinkUIController *)self p_stopObservingStorage];
}

uint64_t __41__TSWPHyperlinkUIController_endUISession__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setKeyboardSuppressedAndTextInputEditorIgnoresFirstResponderChanges:0];
}

- (TSWPEditingController)editingController
{
  id result = self->_cachedEditingController;
  if (!result)
  {
    dispatch_time_t v4 = [(TSDEditorController *)[(TSDInteractiveCanvasController *)[(TSWPHyperlinkUIController *)self interactiveCanvasController] editorController] mostSpecificCurrentEditorOfClass:objc_opt_class()];
    self->_cachedEditingController = v4;
    v5 = [(TSWPEditingController *)v4 storage];
    if (v5 == [(TSWPSmartField *)self->_hyperlinkField parentStorage]) {
      cachedEditingController = self->_cachedEditingController;
    }
    else {
      cachedEditingController = 0;
    }
    self->_cachedEditingController = cachedEditingController;
    v7 = cachedEditingController;
    return self->_cachedEditingController;
  }
  return result;
}

- (void)showHyperlinkHighlight
{
}

- (void)hideHyperlinkHighlight
{
}

- (void)p_selectHyperlinkField
{
  if (![(TSWPHyperlinkUIController *)self isCanvasInReadMode])
  {
    BOOL v3 = [(TSWPHyperlinkUIController *)self editingController];
    uint64_t v4 = [(TSWPSmartField *)self->_hyperlinkField range];
    v6 = +[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", v4, v5);
    [(TSWPEditingController *)v3 setSelection:v6 withFlags:0x200000];
  }
}

- (void)p_clearTextSelection
{
  if (![(TSWPHyperlinkUIController *)self isCanvasInReadMode])
  {
    BOOL v3 = [(TSWPHyperlinkUIController *)self editingController];
    [(TSWPEditingController *)v3 setSelection:0 withFlags:0x200000];
  }
}

- (BOOL)isDisplayingHyperlinkUI
{
  int v3 = [(TSWPHyperlinkUIController *)self p_UIState];
  if (v3)
  {
    if (TSUPhoneUI()) {
      LOBYTE(v3) = self->_observedStorage != 0;
    }
    else {
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (CGRect)p_viewBoundsForField
{
  [(TSWPHyperlinkHostRepProtocol *)self->_hyperlinkRep naturalBoundsRectForHyperlinkField:self->_hyperlinkField];
  -[TSWPHyperlinkHostRepProtocol convertNaturalRectToUnscaledCanvas:](self->_hyperlinkRep, "convertNaturalRectToUnscaledCanvas:");
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = [(TSWPHyperlinkUIController *)self interactiveCanvasController];

  -[TSDInteractiveCanvasController convertUnscaledToBoundsRect:](v11, "convertUnscaledToBoundsRect:", v4, v6, v8, v10);
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)p_initChangeSessionAuthorCreatedWithCommand:(id *)a3
{
  if (!self->_changeSession)
  {
    double v5 = objc_msgSend(-[TSWPStorage documentRoot](-[TSWPSmartField parentStorage](self->_hyperlinkField, "parentStorage"), "documentRoot"), "changeSessionManagerForModel:", -[TSWPSmartField parentStorage](self->_hyperlinkField, "parentStorage"));
    if (v5) {
      self->_changeSession = (TSWPChangeSession *)[v5 changeSessionAuthorCreatedWithCommand:a3];
    }
  }
}

- (BOOL)p_shouldSetCanvasSelectionWhenDismissing
{
  if ([(TSWPHyperlinkUIController *)self isCanvasInReadMode])
  {
    char isKindOfClass = 0;
  }
  else
  {
    [(TSWPHyperlinkHostRepProtocol *)self->_hyperlinkRep parentRep];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (BOOL)p_shouldSetTextSelectionWhenDismissing
{
  return ![(TSWPHyperlinkUIController *)self isCanvasInReadMode]
      && ![(TSWPStorage *)[(TSWPSmartField *)self->_hyperlinkField parentStorage] wpKind]
      && !self->_closingDocument
      && !self->_removeHyperlink;
}

+ (id)defaultTableView
{
  id v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x263F1CA40]), "initWithFrame:style:", 1, 0.0, 0.0, 320.0, 10.0);
  +[TSKPopoverBasedViewController configureTableView:v2];
  objc_msgSend(v2, "setSeparatorInset:", *MEMORY[0x263F1D1C0], *(double *)(MEMORY[0x263F1D1C0] + 8), *(double *)(MEMORY[0x263F1D1C0] + 16), *(double *)(MEMORY[0x263F1D1C0] + 24));
  return v2;
}

- (void)i_openURLAction
{
  id v3 = +[TSKApplicationDelegate sharedDelegate];
  double v4 = [(TSWPHyperlinkField *)self->_hyperlinkField url];

  [v3 openURL:v4];
}

- (NSString)stringForDisplay
{
  if (![(TSWPHyperlinkUIController *)self editedDisplayText]) {
    return self->_originalDisplayText;
  }

  return [(TSWPHyperlinkUIController *)self editedDisplayText];
}

- (NSString)stringForURL
{
  if ([(TSWPHyperlinkUIController *)self editedURLString])
  {
    return [(TSWPHyperlinkUIController *)self editedURLString];
  }
  else
  {
    double v4 = [(TSWPHyperlinkField *)self->_hyperlinkField url];
    return [(NSURL *)v4 absoluteString];
  }
}

- (TSWPInteractiveCanvasController)interactiveCanvasController
{
  return (TSWPInteractiveCanvasController *)[(TSWPHyperlinkHostRepProtocol *)self->_hyperlinkRep interactiveCanvasController];
}

- (UIViewController)viewControllerForPresenting
{
  objc_opt_class();
  [(TSKDocumentRoot *)[(TSDInteractiveCanvasController *)[(TSWPHyperlinkUIController *)self interactiveCanvasController] documentRoot] viewController];
  id v3 = (UIViewController *)TSUDynamicCast();
  if (!v3)
  {
    double v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[TSWPHyperlinkUIController viewControllerForPresenting]"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPHyperlinkUIController.mm"), 1262, @"invalid nil value for '%s'", "viewController");
  }
  return v3;
}

- (NSString)editedDisplayText
{
  return self->_editedDisplayText;
}

- (void)setEditedDisplayText:(id)a3
{
}

- (NSString)editedURLString
{
  return self->_editedURLString;
}

- (void)setEditedURLString:(id)a3
{
}

- (BOOL)shouldMaintainKeyboardWhenEndingSession
{
  return self->_shouldMaintainKeyboardWhenEndingSession;
}

- (void)setShouldMaintainKeyboardWhenEndingSession:(BOOL)a3
{
  self->_shouldMaintainKeyboardWhenEndingSession = a3;
}

@end