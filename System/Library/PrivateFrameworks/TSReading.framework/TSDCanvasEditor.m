@interface TSDCanvasEditor
+ (BOOL)physicalKeyboardIsSender:(id)a3;
+ (Class)canvasEditorHelperClass;
+ (id)canvasSelectionWithInfos:(id)a3;
+ (id)canvasSelectionWithInfos:(id)a3 andContainer:(id)a4;
+ (id)spatialInfoComparator;
- (BOOL)allowAutomaticTextEditingToBeginWithDifferentEditor;
- (BOOL)canAddOrShowComment;
- (BOOL)canCopyStyle;
- (BOOL)canDeleteComment;
- (BOOL)canGroupDrawable:(id)a3;
- (BOOL)canGroupWithSender:(id)a3;
- (BOOL)canSelectAllWithSender:(id)a3;
- (BOOL)canUngroupWithSender:(id)a3;
- (BOOL)canvasEditorCanCopyWithSender:(id)a3;
- (BOOL)canvasEditorCanCutWithSender:(id)a3;
- (BOOL)canvasEditorCanDeleteWithSender:(id)a3;
- (BOOL)isCharIndex:(unint64_t)a3 withEolAffinity:(BOOL)a4 atBoundary:(int64_t)a5 inDirection:(int64_t)a6;
- (BOOL)isCharIndex:(unint64_t)a3 withinTextUnit:(int64_t)a4 inDirection:(int64_t)a5;
- (BOOL)isRepSelectable:(id)a3;
- (BOOL)isSelectedInfo:(id)a3;
- (BOOL)shouldPushNewEditorForNewSelection;
- (BOOL)shouldUseAlternateSelectionHighlight;
- (BOOL)textIsVerticalAtCharIndex:(unint64_t)a3;
- (BOOL)wantsKeyboard;
- (BOOL)wantsRawArrowKeyEvents;
- (CGRect)firstRectForRange:(_NSRange)a3;
- (Class)editorClassForSelection;
- (NSSet)infosForSelectAllInRoot;
- (TSDCanvasEditor)initWithInteractiveCanvasController:(id)a3;
- (TSDCanvasEditorHelper)canvasEditorHelper;
- (TSDInteractiveCanvasController)interactiveCanvasController;
- (TSDTextSelection)textInputSelection;
- (TSKSelection)selection;
- (TSPObject)modelForSelection;
- (UIView)inputAccessoryView;
- (UIView)inputView;
- (_NSRange)editRange;
- (_NSRange)markedRange;
- (_NSRange)rangeOfWordEnclosingCharIndex:(unint64_t)a3 backward:(BOOL)a4;
- (id)canvasSelectionWithInfos:(id)a3;
- (id)canvasSelectionWithInfos:(id)a3 andContainer:(id)a4;
- (id)documentRoot;
- (id)drawables;
- (id)editorToPopToOnEndEditing;
- (id)keyCommands;
- (id)p_filterNonDisplayedInfos:(id)a3;
- (id)p_nextInfoInTabSequence:(int)a3;
- (id)p_spatiallySortedDrawables;
- (id)pasteboardController;
- (id)selectionRectsForRange:(_NSRange)a3;
- (id)selectionWithRange:(_NSRange)a3;
- (id)textColorAtCharIndex:(unint64_t)a3;
- (id)textFontAtCharIndex:(unint64_t)a3;
- (id)textInRange:(_NSRange)a3;
- (int)canPerformEditorAction:(SEL)a3 withSender:(id)a4;
- (int64_t)returnKeyType;
- (unint64_t)charIndexByMovingPosition:(id)a3 toBoundary:(int64_t)a4 inDirection:(int64_t)a5 preferPosition:(double *)a6;
- (unint64_t)countOfDrawables;
- (unint64_t)textLength;
- (void)beginAutomaticTextEditingIfNeededForPoint:(CGPoint)a3;
- (void)canvasInfosDidChange;
- (void)connectWithConnectionLine:(id)a3;
- (void)dealloc;
- (void)insertBacktab:(id)a3;
- (void)insertTab:(id)a3;
- (void)insertText:(id)a3;
- (void)p_notifyRepsForSelectionChangeFrom:(id)a3 to:(id)a4;
- (void)repWasCreated:(id)a3;
- (void)scrollToBeginningOfDocument:(id)a3;
- (void)scrollToEndOfDocument:(id)a3;
- (void)selectAll:(id)a3;
- (void)setSelection:(id)a3;
- (void)setSelection:(id)a3 withFlags:(unint64_t)a4;
- (void)setSelectionToInfo:(id)a3;
- (void)setSelectionToInfos:(id)a3;
- (void)setSelectionToRep:(id)a3;
- (void)teardown;
@end

@implementation TSDCanvasEditor

- (UIView)inputView
{
  result = self->mInputView;
  if (!result)
  {
    id v4 = objc_alloc(MEMORY[0x263F1CB60]);
    result = (UIView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    self->mInputView = result;
  }
  return result;
}

- (BOOL)wantsKeyboard
{
  return 1;
}

- (void)insertText:(id)a3
{
  if ([a3 isEqualToString:@"\t"])
  {
    [(TSDCanvasEditor *)self insertTab:0];
  }
}

- (UIView)inputAccessoryView
{
  return 0;
}

- (int64_t)returnKeyType
{
  return 0;
}

- (id)textColorAtCharIndex:(unint64_t)a3
{
  return 0;
}

- (id)textFontAtCharIndex:(unint64_t)a3
{
  return 0;
}

- (BOOL)isCharIndex:(unint64_t)a3 withEolAffinity:(BOOL)a4 atBoundary:(int64_t)a5 inDirection:(int64_t)a6
{
  return 0;
}

- (BOOL)isCharIndex:(unint64_t)a3 withinTextUnit:(int64_t)a4 inDirection:(int64_t)a5
{
  return 0;
}

- (unint64_t)charIndexByMovingPosition:(id)a3 toBoundary:(int64_t)a4 inDirection:(int64_t)a5 preferPosition:(double *)a6
{
  return 0;
}

- (_NSRange)markedRange
{
  NSUInteger v2 = 0x7FFFFFFFFFFFFFFFLL;
  NSUInteger v3 = 0;
  result.length = v3;
  result.location = v2;
  return result;
}

- (_NSRange)editRange
{
  NSUInteger v2 = 0x7FFFFFFFFFFFFFFFLL;
  NSUInteger v3 = 0;
  result.length = v3;
  result.location = v2;
  return result;
}

- (BOOL)textIsVerticalAtCharIndex:(unint64_t)a3
{
  return 0;
}

- (unint64_t)textLength
{
  return 0;
}

- (id)textInRange:(_NSRange)a3
{
  return 0;
}

- (CGRect)firstRectForRange:(_NSRange)a3
{
  double v3 = *MEMORY[0x263F001A8];
  double v4 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v5 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)selectionRectsForRange:(_NSRange)a3
{
  return (id)MEMORY[0x263EFFA68];
}

- (_NSRange)rangeOfWordEnclosingCharIndex:(unint64_t)a3 backward:(BOOL)a4
{
  NSUInteger v4 = 0;
  NSUInteger v5 = 0;
  result.length = v5;
  result.location = v4;
  return result;
}

- (id)selectionWithRange:(_NSRange)a3
{
  return 0;
}

- (BOOL)wantsRawArrowKeyEvents
{
  return 1;
}

+ (id)canvasSelectionWithInfos:(id)a3
{
  NSUInteger v4 = objc_opt_class();

  return (id)[v4 canvasSelectionWithInfos:a3 andContainer:0];
}

- (id)canvasSelectionWithInfos:(id)a3
{
  return [(TSDCanvasEditor *)self canvasSelectionWithInfos:a3 andContainer:0];
}

+ (id)canvasSelectionWithInfos:(id)a3 andContainer:(id)a4
{
  double v6 = (void *)[a1 canvasEditorHelperClass];

  return (id)[v6 canvasSelectionWithInfos:a3 andContainer:a4];
}

- (id)canvasSelectionWithInfos:(id)a3 andContainer:(id)a4
{
  double v6 = [(TSDCanvasEditor *)self canvasEditorHelper];

  return [(TSDCanvasEditorHelper *)v6 canvasSelectionWithInfos:a3 andContainer:a4];
}

- (void)setSelectionToInfo:(id)a3
{
  if (a3) {
    a3 = (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObject:");
  }
  id v4 = [(TSDCanvasEditor *)self canvasSelectionWithInfos:a3];

  [(TSDCanvasEditor *)self setSelection:v4];
}

- (void)setSelectionToInfos:(id)a3
{
  id v4 = [(TSDCanvasEditor *)self canvasSelectionWithInfos:a3];

  [(TSDCanvasEditor *)self setSelection:v4];
}

- (BOOL)isRepSelectable:(id)a3
{
  id v4 = [(TSDCanvasEditor *)self canvasEditorHelper];

  return [(TSDCanvasEditorHelper *)v4 isRepSelectable:a3];
}

- (id)keyCommands
{
  if (keyCommands_onceToken != -1) {
    dispatch_once(&keyCommands_onceToken, &__block_literal_global_30);
  }
  return (id)keyCommands_s_keyCommands;
}

id __30__TSDCanvasEditor_keyCommands__block_invoke()
{
  v1[4] = *MEMORY[0x263EF8340];
  v1[0] = [MEMORY[0x263F1C708] keyCommandWithInput:@"k" modifierFlags:1179648 action:sel_addOrShowComment_];
  v1[1] = [MEMORY[0x263F1C708] keyCommandWithInput:@"k" modifierFlags:1572864 action:sel_nextAnnotation_];
  v1[2] = [MEMORY[0x263F1C708] keyCommandWithInput:@"k" modifierFlags:1703936 action:sel_previousAnnotation_];
  v1[3] = [MEMORY[0x263F1C708] keyCommandWithInput:@"d" modifierFlags:0x100000 action:sel_duplicate_];
  keyCommands_s_keyCommands = [MEMORY[0x263EFF8C0] arrayWithObjects:v1 count:4];
  return (id)keyCommands_s_keyCommands;
}

- (BOOL)canDeleteComment
{
  NSUInteger v2 = [(TSDCanvasEditor *)self canvasEditorHelper];

  return [(TSDCanvasEditorHelper *)v2 canDeleteComment];
}

+ (Class)canvasEditorHelperClass
{
  return (Class)objc_opt_class();
}

- (TSDCanvasEditor)initWithInteractiveCanvasController:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TSDCanvasEditor;
  id v4 = [(TSDCanvasEditor *)&v7 init];
  NSUInteger v5 = v4;
  if (v4)
  {
    v4->mInteractiveCanvasController = (TSDInteractiveCanvasController *)a3;
    v4->mCanvasEditorHelper = (TSDCanvasEditorHelper *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "canvasEditorHelperClass")), "initWithCanvasEditor:", v4);
  }
  return v5;
}

- (void)teardown
{
  self->mInteractiveCanvasController = 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSDCanvasEditor;
  [(TSDCanvasEditor *)&v3 dealloc];
}

- (TSDCanvasEditorHelper)canvasEditorHelper
{
  return self->mCanvasEditorHelper;
}

- (id)documentRoot
{
  return [(TSDInteractiveCanvasController *)self->mInteractiveCanvasController documentRoot];
}

- (TSDInteractiveCanvasController)interactiveCanvasController
{
  return self->mInteractiveCanvasController;
}

- (BOOL)isSelectedInfo:(id)a3
{
  id v4 = [(TSDCanvasSelection *)[(TSDCanvasEditor *)self canvasSelection] infos];

  return [(NSSet *)v4 containsObject:a3];
}

- (TSPObject)modelForSelection
{
  NSUInteger v2 = [(TSDInteractiveCanvasController *)self->mInteractiveCanvasController objectContext];

  return [(TSPObjectContext *)v2 documentObject];
}

- (void)canvasInfosDidChange
{
  objc_super v3 = [(TSDCanvasSelection *)self->mSelection infos];
  if ([(NSSet *)v3 count])
  {
    id v4 = [(TSDCanvasEditor *)self p_filterNonDisplayedInfos:v3];
    if (v4 != v3)
    {
      id v5 = [(TSDCanvasEditor *)self canvasSelectionWithInfos:v4];
      [(TSDCanvasEditor *)self setSelection:v5];
    }
  }
}

- (void)repWasCreated:(id)a3
{
  if ([a3 isSelectedIgnoringLocking])
  {
    [a3 becameSelected];
  }
}

- (id)p_filterNonDisplayedInfos:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  double v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithArray:", -[TSDInteractiveCanvasController infosToDisplay](self->mInteractiveCanvasController, "infosToDisplay"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [a3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (!v7)
  {

LABEL_14:
    return a3;
  }
  uint64_t v8 = v7;
  char v9 = 0;
  uint64_t v10 = *(void *)v15;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v15 != v10) {
        objc_enumerationMutation(a3);
      }
      v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
      if ([v6 containsObject:TSDTopmostInfoFromInfo(v12)]) {
        [v5 addObject:v12];
      }
      else {
        char v9 = 1;
      }
    }
    uint64_t v8 = [a3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  }
  while (v8);

  if ((v9 & 1) == 0) {
    goto LABEL_14;
  }
  return v5;
}

- (Class)editorClassForSelection
{
  objc_super v3 = [(TSDCanvasEditor *)self canvasEditorHelper];
  mSelection = self->mSelection;

  return [(TSDCanvasEditorHelper *)v3 editorClassForSelection:mSelection];
}

- (id)editorToPopToOnEndEditing
{
  objc_super v3 = [(TSDCanvasEditor *)self canvasEditorHelper];
  mSelection = self->mSelection;

  return [(TSDCanvasEditorHelper *)v3 editorToPopToOnEndEditingForSelection:mSelection];
}

- (BOOL)shouldUseAlternateSelectionHighlight
{
  return 0;
}

- (unint64_t)countOfDrawables
{
  id v2 = [(TSDCanvasEditor *)self drawables];

  return [v2 count];
}

- (id)drawables
{
  id v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSDCanvasEditor drawables]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDCanvasEditor.m"), 470, @"subclass responsibility");
  return 0;
}

- (BOOL)shouldPushNewEditorForNewSelection
{
  mSelection = self->mSelection;
  if (mSelection) {
    LOBYTE(mSelection) = [(TSDCanvasSelection *)mSelection infoCount] != 0;
  }
  return (char)mSelection;
}

- (TSKSelection)selection
{
  return &self->mSelection->super;
}

- (TSDTextSelection)textInputSelection
{
  return (TSDTextSelection *)TSUClassAndProtocolCast();
}

- (void)setSelection:(id)a3
{
}

- (void)setSelection:(id)a3 withFlags:(unint64_t)a4
{
  double v6 = [(TSDCanvasEditor *)self interactiveCanvasController];
  objc_opt_class();
  uint64_t v7 = (TSDCanvasSelection *)TSUDynamicCast();
  uint64_t v8 = v7;
  if (v7 != self->mSelection && !-[TSDCanvasSelection isEqual:](v7, "isEqual:"))
  {
    objc_msgSend((id)-[TSDCanvasLayerHosting asiOSCVC](-[TSDInteractiveCanvasController layerHost](v6, "layerHost"), "asiOSCVC"), "setContextMenuMightBeDisplayed:", 0);
    mSelection = self->mSelection;
    self->mSelection = v8;
    [(TSDCanvasEditorHelper *)[(TSDCanvasEditor *)self canvasEditorHelper] notifyRepsForSelectionChangeFrom:[(TSDCanvasSelection *)mSelection infos] to:[(TSDCanvasSelection *)self->mSelection infos]];

    [(TSDEditorController *)[(TSDInteractiveCanvasController *)v6 editorController] editorDidChangeSelection:self withSelectionFlags:a4];
    uint64_t v10 = [(TSDCanvasEditor *)self canvasEditorHelper];
    v11 = self->mSelection;
    [(TSDCanvasEditorHelper *)v10 pushNewEditorForSelection:v11];
  }
}

- (void)setSelectionToRep:(id)a3
{
  id v4 = [(TSDCanvasEditorHelper *)[(TSDCanvasEditor *)self canvasEditorHelper] canvasSelectionFromRep:a3];

  [(TSDCanvasEditor *)self setSelection:v4];
}

- (id)pasteboardController
{
  id v2 = [(TSDCanvasEditor *)self documentRoot];

  return (id)[v2 pasteboardController];
}

- (BOOL)allowAutomaticTextEditingToBeginWithDifferentEditor
{
  return 1;
}

- (void)beginAutomaticTextEditingIfNeededForPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = [(TSDCanvasEditor *)self interactiveCanvasController];
  -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:](v5, "convertBoundsToUnscaledPoint:", x, y);
  id v6 = -[TSDInteractiveCanvasController hitRep:withGesture:passingTest:](v5, "hitRep:withGesture:passingTest:", 0, &__block_literal_global_81);
  if ((objc_opt_respondsToSelector() & 1) != 0 && ([v6 isEditing] & 1) == 0)
  {
    [(TSDInteractiveCanvasController *)v5 beginEditingRep:v6];
  }
}

BOOL __61__TSDCanvasEditor_beginAutomaticTextEditingIfNeededForPoint___block_invoke(uint64_t a1, void *a2)
{
  return (objc_opt_respondsToSelector() & 1) != 0 && ([a2 containsText] & 1) != 0;
}

+ (BOOL)physicalKeyboardIsSender:(id)a3
{
  id v4 = (void *)[a1 canvasEditorHelperClass];

  return [v4 physicalKeyboardIsSender:a3];
}

- (BOOL)canCopyStyle
{
  return 0;
}

- (BOOL)canvasEditorCanDeleteWithSender:(id)a3
{
  uint64_t v3 = [(TSDCanvasEditor *)self canvasSelection];
  if (v3) {
    LOBYTE(v3) = [(TSDCanvasSelection *)v3 unlockedInfoCount] != 0;
  }
  return (char)v3;
}

- (BOOL)canvasEditorCanCopyWithSender:(id)a3
{
  uint64_t v3 = [(TSDCanvasEditor *)self canvasSelection];
  if (v3) {
    LOBYTE(v3) = [(TSDCanvasSelection *)v3 unlockedInfoCount] != 0;
  }
  return (char)v3;
}

- (BOOL)canvasEditorCanCutWithSender:(id)a3
{
  BOOL v5 = -[TSDCanvasEditor canvasEditorCanDeleteWithSender:](self, "canvasEditorCanDeleteWithSender:");
  if (v5)
  {
    LOBYTE(v5) = [(TSDCanvasEditor *)self canvasEditorCanCopyWithSender:a3];
  }
  return v5;
}

- (BOOL)canSelectAllWithSender:(id)a3
{
  if (![(TSDCanvasSelection *)[(TSDCanvasEditor *)self canvasSelection] infoCount]
    || (int v5 = [(id)objc_opt_class() physicalKeyboardIsSender:a3]) != 0)
  {
    LOBYTE(v5) = [(TSDCanvasEditor *)self countOfDrawables] != 0;
  }
  return v5;
}

- (BOOL)canGroupWithSender:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = [(TSDCanvasSelection *)self->mSelection infosOfClass:objc_opt_class()];
  unint64_t v5 = [(TSDCanvasSelection *)self->mSelection infoCount];
  if (v5 == [v4 count]
    && (long long v14 = 0u,
        long long v15 = 0u,
        long long v12 = 0u,
        long long v13 = 0u,
        (uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16]) != 0))
  {
    uint64_t v7 = v6;
    unint64_t v8 = 0;
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v4);
        }
        if ([(TSDCanvasEditor *)self canGroupDrawable:*(void *)(*((void *)&v12 + 1) + 8 * i)])
        {
          if (v8)
          {
            unint64_t v8 = 2;
            return v8 > 1;
          }
          unint64_t v8 = 1;
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    unint64_t v8 = 0;
  }
  return v8 > 1;
}

- (BOOL)canUngroupWithSender:(id)a3
{
  id v4 = [(TSDCanvasEditor *)self canvasEditorHelper];
  mSelection = self->mSelection;

  return [(TSDCanvasEditorHelper *)v4 canUngroupWithSelection:mSelection];
}

- (int)canPerformEditorAction:(SEL)a3 withSender:(id)a4
{
  v8[10] = *MEMORY[0x263EF8340];
  v8[0] = sel_deleteBackward_;
  v8[1] = sel_deleteForward_;
  v8[2] = sel_deleteToBeginningOfLine_;
  v8[3] = sel_deleteToEndOfLine_;
  v8[4] = sel_deleteWordBackward_;
  v8[5] = sel_deleteWordForward_;
  v8[6] = sel_insertTab_;
  v8[7] = sel_insertBacktab_;
  v8[8] = sel_scrollToBeginningOfDocument_;
  v8[9] = sel_scrollToEndOfDocument_;
  int result = [(TSDCanvasEditorHelper *)[(TSDCanvasEditor *)self canvasEditorHelper] canPerformEditorAction:a3 withSender:a4];
  if (!result)
  {
    uint64_t v7 = 0;
    while (!sel_isEqual(a3, (SEL)v8[v7]))
    {
      if (++v7 == 10)
      {
        int result = 0;
        goto LABEL_8;
      }
    }
    int result = 1;
LABEL_8:
    if (sel_select_ == a3)
    {
      return -1;
    }
    else if (sel_addOrShowComment_ == a3)
    {
      if ([(TSDCanvasEditor *)self canAddOrShowComment]) {
        return 1;
      }
      else {
        return -1;
      }
    }
  }
  return result;
}

- (BOOL)canAddOrShowComment
{
  return 0;
}

- (NSSet)infosForSelectAllInRoot
{
  id v2 = (void *)MEMORY[0x263EFFA08];
  id v3 = [(TSDCanvasEditor *)self drawables];

  return (NSSet *)[v2 setWithArray:v3];
}

- (void)selectAll:(id)a3
{
  id v4 = [(TSDInteractiveCanvasController *)[(TSDCanvasEditor *)self interactiveCanvasController] topLevelContainerRepForEditing];
  if (v4) {
    unint64_t v5 = (NSSet *)objc_msgSend(MEMORY[0x263EFFA08], "setWithArray:", -[TSDContainerInfo childInfos](-[TSDContainerRep containerInfo](v4, "containerInfo"), "childInfos"));
  }
  else {
    unint64_t v5 = [(TSDCanvasEditor *)self infosForSelectAllInRoot];
  }
  [(TSDCanvasEditor *)self setSelectionToInfos:v5];
  uint64_t v6 = (void *)[(TSDCanvasLayerHosting *)[(TSDInteractiveCanvasController *)self->mInteractiveCanvasController layerHost] asiOSCVC];
  mSelection = self->mSelection;

  [v6 showEditMenuForSelection:mSelection];
}

- (BOOL)canGroupDrawable:(id)a3
{
  return [a3 isLocked] ^ 1;
}

- (void)connectWithConnectionLine:(id)a3
{
  id v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSDCanvasEditor connectWithConnectionLine:]"];
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDCanvasEditor.m"), 1029, @"Abstract method");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"Abstract method", "-[TSDCanvasEditor connectWithConnectionLine:]"), 0 reason userInfo]);
}

- (id)p_nextInfoInTabSequence:(int)a3
{
  id result = [(TSDCanvasEditor *)self countOfDrawables];
  if (!result) {
    return result;
  }
  uint64_t v6 = [(TSDCanvasEditor *)self canvasSelection];
  uint64_t v7 = [(TSDCanvasSelection *)v6 infoCount];
  id v8 = (id)objc_msgSend(-[TSDCanvasEditor p_spatiallySortedDrawables](self, "p_spatiallySortedDrawables"), "mutableCopy");
  uint64_t v9 = v8;
  if (!a3 && !v7)
  {
    return (id)[v8 firstObject];
  }
  if (a3 == 1 && !v7)
  {
    return (id)[v8 lastObject];
  }
  unint64_t v10 = [(TSDCanvasEditor *)self countOfDrawables];
  if (v10 - 1 >= 2)
  {
    unint64_t v11 = v10 - 2;
    do
    {
      long long v12 = objc_msgSend((id)objc_msgSend(v9, "objectAtIndex:", v11 + 1), "geometry");
      long long v13 = objc_msgSend((id)objc_msgSend(v9, "objectAtIndex:", v11), "geometry");
      [v13 size];
      double v15 = v14;
      [v12 position];
      double v17 = v16;
      [v13 position];
      if (v17 < v18)
      {
        double v19 = v15 * 0.33;
        [v13 position];
        double v21 = v20;
        [v12 position];
        if (v21 >= v22 - v19)
        {
          [v13 position];
          double v24 = v23;
          [v12 position];
          if (v24 < v19 + v25) {
            [v9 exchangeObjectAtIndex:v11 + 1 withObjectAtIndex:v11];
          }
        }
      }
    }
    while (v11-- > 1);
  }
  if (v7 == 1)
  {
    uint64_t v27 = objc_msgSend(v9, "indexOfObject:", -[NSSet anyObject](-[TSDCanvasSelection infos](v6, "infos"), "anyObject"));
  }
  else
  {
    v28 = (void *)[(NSArray *)[(NSSet *)[(TSDCanvasSelection *)[(TSDCanvasEditor *)self canvasSelection] infos] allObjects] mutableCopy];
    [v28 sortUsingComparator:&__block_literal_global_444];
    if (a3 == 1) {
      uint64_t v29 = [v28 firstObject];
    }
    else {
      uint64_t v29 = [v28 lastObject];
    }
    uint64_t v27 = [v9 indexOfObject:v29];
  }
  if (v27 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v30 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v31 = [NSString stringWithUTF8String:"-[TSDCanvasEditor p_nextInfoInTabSequence:]"];
    objc_msgSend(v30, "handleFailureInFunction:file:lineNumber:description:", v31, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDCanvasEditor.m"), 1140, @"couldn't find selected info in all drawables!");
    goto LABEL_31;
  }
  if (a3 != 1 || v27)
  {
LABEL_31:
    unint64_t v33 = [(TSDCanvasEditor *)self countOfDrawables];
    if (a3 == 1) {
      unint64_t v34 = v27 - 1;
    }
    else {
      unint64_t v34 = v27 + 1;
    }
    unint64_t v32 = v34 % v33;
    goto LABEL_35;
  }
  unint64_t v32 = [(TSDCanvasEditor *)self countOfDrawables] - 1;
LABEL_35:
  objc_opt_class();
  [v9 objectAtIndex:v32];

  return (id)TSUDynamicCast();
}

+ (id)spatialInfoComparator
{
  return &__block_literal_global_444;
}

- (id)p_spatiallySortedDrawables
{
  id v2 = [(TSDCanvasEditor *)self drawables];

  return (id)[v2 sortedArrayUsingComparator:&__block_literal_global_444];
}

- (void)insertTab:(id)a3
{
  id v4 = [(TSDCanvasEditor *)self p_nextInfoInTabSequence:0];

  [(TSDCanvasEditor *)self setSelectionToInfo:v4];
}

- (void)insertBacktab:(id)a3
{
  id v4 = [(TSDCanvasEditor *)self p_nextInfoInTabSequence:1];

  [(TSDCanvasEditor *)self setSelectionToInfo:v4];
}

- (void)scrollToBeginningOfDocument:(id)a3
{
  id v3 = [(TSDCanvasEditor *)self interactiveCanvasController];
  objc_msgSend((id)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](v3, "layerHost"), "canvasLayer"), "contentInset");
  double v5 = v4;
  [(TSDInteractiveCanvasController *)v3 contentOffset];
  double v7 = v6;
  [(TSDInteractiveCanvasController *)v3 viewScale];

  -[TSDInteractiveCanvasController setContentOffset:animated:](v3, "setContentOffset:animated:", 0, v7, v5 / v8);
}

- (void)scrollToEndOfDocument:(id)a3
{
  id v3 = [(TSDCanvasEditor *)self interactiveCanvasController];
  [(TSDCanvasView *)[(TSDInteractiveCanvasController *)v3 canvasView] bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [(TSDInteractiveCanvasController *)v3 contentOffset];
  double v13 = v12;
  v16.origin.double x = v5;
  v16.origin.double y = v7;
  v16.size.width = v9;
  v16.size.height = v11;
  double MaxY = CGRectGetMaxY(v16);

  -[TSDInteractiveCanvasController setContentOffset:animated:](v3, "setContentOffset:animated:", 0, v13, MaxY);
}

- (void)p_notifyRepsForSelectionChangeFrom:(id)a3 to:(id)a4
{
  double v6 = [(TSDCanvasEditor *)self canvasEditorHelper];

  [(TSDCanvasEditorHelper *)v6 notifyRepsForSelectionChangeFrom:a3 to:a4];
}

@end