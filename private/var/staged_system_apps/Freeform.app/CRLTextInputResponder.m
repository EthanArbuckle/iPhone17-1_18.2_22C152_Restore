@interface CRLTextInputResponder
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)disallowBecomingFirstResponder;
- (BOOL)editorIsChanging;
- (BOOL)editorWantsPlainTextDelete;
- (BOOL)endTextInputWhenFirstResponderResigns;
- (BOOL)hasText;
- (BOOL)iccAllowsTextEditing;
- (BOOL)ignoreKeyboard;
- (BOOL)ignorePencilInputSource;
- (BOOL)isIgnoringKeyboardInput;
- (BOOL)isSettingMarkedText;
- (BOOL)keyboardIsAnimating;
- (BOOL)keyboardIsHiding;
- (BOOL)p_accessibilityShouldCheckAncestorCanPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)p_workAround17828487ForSelector:(SEL)a3;
- (BOOL)resignFirstResponder;
- (BOOL)resigningFirstResponder;
- (BOOL)scribbleInProgress;
- (BOOL)shouldChangeFirstResponderFor:(id)a3;
- (CGPoint)convertPointFromTopResponderView:(CGPoint)a3;
- (CGPoint)convertPointToTopResponderView:(CGPoint)a3;
- (CGRect)_accessibilitySpeakRectForRange:(id)a3;
- (CGRect)caretRectForPosition:(id)a3;
- (CGRect)convertRectFromTopResponderView:(CGRect)a3;
- (CGRect)convertRectToTopResponderView:(CGRect)a3;
- (CGRect)firstRectForRange:(id)a3;
- (CRLInteractiveCanvasController)icc;
- (NSArray)arrowKeyCommands;
- (NSArray)deleteKeyCommands;
- (NSArray)keyCommands;
- (NSArray)tirKeyCommands;
- (NSDictionary)markedTextStyle;
- (UIInputViewController)inputAccessoryViewController;
- (UIInputViewController)inputViewController;
- (UIResponder)nextInChain;
- (UIResponder)nextResponder;
- (UITextInputDelegate)inputDelegate;
- (UITextInputTokenizer)tokenizer;
- (UITextPosition)beginningOfDocument;
- (UITextPosition)endOfDocument;
- (UITextRange)markedTextRange;
- (UITextRange)selectedTextRange;
- (UIView)inputAccessoryView;
- (UIView)inputView;
- (UIView)selectionContainerViewAboveText;
- (UIView)selectionContainerViewBelowText;
- (UIView)textInputView;
- (UIView)topFirstResponderView;
- (_TtC8Freeform17CRLFloatingCursor)floatingCursorHelper;
- (_TtC8Freeform18CRLTextInputLogger)inputLogger;
- (_TtC8Freeform21CRLTextInputResponder)init;
- (_TtC8Freeform21CRLTextInputResponder)initWithNextResponder:(id)a3 icc:(id)a4;
- (_TtP8Freeform18CRLTextInputEditor_)editor;
- (id)_accessibilitySpeakTextSelectionViews;
- (id)_crlaxEditingTextRep;
- (id)characterRangeAtPoint:(CGPoint)a3;
- (id)characterRangeByExtendingPosition:(id)a3 inDirection:(int64_t)a4;
- (id)closestPositionToPoint:(CGPoint)a3;
- (id)closestPositionToPoint:(CGPoint)a3 withinRange:(id)a4;
- (id)editorForKeyEvents;
- (id)keyCommandForArrowIn:(id)a3 with:(int64_t)a4;
- (id)keyCommandsForArrowsWithModifiersIn:(id)a3;
- (id)positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5;
- (id)positionFromPosition:(id)a3 offset:(int64_t)a4;
- (id)positionWithinRange:(id)a3 farthestInDirection:(int64_t)a4;
- (id)selectionRectsForRange:(id)a3;
- (id)targetForAction:(SEL)a3 withSender:(id)a4;
- (id)textInRange:(id)a3;
- (id)textRangeFromPosition:(id)a3 toPosition:(id)a4;
- (int64_t)autocorrectionType;
- (int64_t)baseWritingDirectionForPosition:(id)a3 inDirection:(int64_t)a4;
- (int64_t)comparePosition:(id)a3 toPosition:(id)a4;
- (int64_t)inlinePredictionType;
- (int64_t)offsetFromPosition:(id)a3 toPosition:(id)a4;
- (int64_t)textInputInProgress;
- (int64_t)writingToolsBehavior;
- (uint64_t)mathExpressionCompletionType;
- (unint64_t)allowedWritingToolsResultOptions;
- (void)applicationDidEnterBackgroundWithNotification:(id)a3;
- (void)applicationWillEnterForegroundWithNotification:(id)a3;
- (void)arrowKeyInputReceivedFrom:(id)a3;
- (void)beginFloatingCursorAtPoint:(CGPoint)a3;
- (void)beginTextInput;
- (void)deleteBackward;
- (void)deleteKeyPressed;
- (void)deleteWordBackward;
- (void)deleteWordForward;
- (void)endFloatingCursor;
- (void)endTextInput:(id)a3;
- (void)escapePressed:(id)a3;
- (void)firstResponderChangedWithNotification:(id)a3;
- (void)forwardInvocation:(id)a3;
- (void)indentParagraphLevel:(id)a3;
- (void)insertBackTab:(id)a3;
- (void)insertNewline:(id)a3;
- (void)insertTab:(id)a3;
- (void)insertText:(id)a3;
- (void)insertText:(id)a3 alternatives:(id)a4 style:(int64_t)a5;
- (void)outdentParagraphLevel:(id)a3;
- (void)reloadForMathPaperChangesWithNotification:(id)a3;
- (void)reloadInputViews;
- (void)replaceRange:(id)a3 withText:(id)a4;
- (void)scribbleDidEnd;
- (void)scribbleWillBegin;
- (void)setAttributedMarkedText:(id)a3 selectedRange:(_NSRange)a4;
- (void)setAutocorrectionType:(int64_t)a3;
- (void)setBaseWritingDirection:(int64_t)a3 forRange:(id)a4;
- (void)setDisallowBecomingFirstResponder:(BOOL)a3;
- (void)setEditor:(id)a3;
- (void)setEditor:(id)a3 withFlags:(unint64_t)a4;
- (void)setEditorIsChanging:(BOOL)a3;
- (void)setEndTextInputWhenFirstResponderResigns:(BOOL)a3;
- (void)setFloatingCursorHelper:(id)a3;
- (void)setIcc:(id)a3;
- (void)setIgnoreKeyboard:(BOOL)a3;
- (void)setIgnorePencilInputSource:(BOOL)a3;
- (void)setInlinePredictionType:(int64_t)a3;
- (void)setInputDelegate:(id)a3;
- (void)setInputLogger:(id)a3;
- (void)setIsIgnoringKeyboardInput:(BOOL)a3;
- (void)setIsSettingMarkedText:(BOOL)a3;
- (void)setKeyboardIsHiding:(BOOL)a3;
- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4;
- (void)setNeedsInputViewsReloaded;
- (void)setNextInChain:(id)a3;
- (void)setResigningFirstResponder:(BOOL)a3;
- (void)setScribbleInProgress:(BOOL)a3;
- (void)setSelectedTextRange:(id)a3;
- (void)setTextInputInProgress:(int64_t)a3;
- (void)spacebarTapped:(id)a3;
- (void)textDidChange;
- (void)textInput:(id)a3;
- (void)textSelectionDidChange;
- (void)textSelectionWillChange;
- (void)textWillChange;
- (void)unmarkText;
- (void)updateFloatingCursorAtPoint:(CGPoint)a3;
@end

@implementation CRLTextInputResponder

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  v15 = 0;
  [v4 getArgument:&v15 atIndex:2];
  if (!+[CRLCanvasEditor physicalKeyboardIsSender:v15]
    || ![(CRLTextInputResponder *)self isIgnoringKeyboardInput])
  {
    v5 = (char *)[v4 selector];
    v6 = [(CRLTextInputResponder *)self icc];
    v7 = [v6 layerHost];
    v8 = [v7 asiOSCVC];

    if ([v8 respondsToSelector:v5 withSender:v15])
    {
      v9 = +[UIMenuController sharedMenuController];
      [v9 hideMenu];

      [v4 invokeWithTarget:v8];
    }
    else if ((v15 == self || objc_msgSend(@"UIEditingInteraction", "isEqual:")) {
           && (v5 == "cut:" || v5 == "copy:" || v5 == "paste:"))
    }
    {
      int v10 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CEC08);
      }
      v11 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106C084(v10, v11);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CEC28);
      }
      v12 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101066770(v12, v10);
      }
      v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLTextInputResponder(ObjCExtension) forwardInvocation:]");
      v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLTextInputResponder.m"];
      +[CRLAssertionHandler handleFailureInFunction:v13 file:v14 lineNumber:62 isFatal:0 description:"The OS undo gestures should not be sending us selectors we can't respond to!"];
    }
    else if (![(CRLTextInputResponder *)self p_workAround17828487ForSelector:v5])
    {
      [(CRLTextInputResponder *)self doesNotRecognizeSelector:v5];
    }
  }
}

- (BOOL)p_workAround17828487ForSelector:(SEL)a3
{
  return "cut:" == a3 || "copy:" == a3;
}

- (BOOL)p_accessibilityShouldCheckAncestorCanPerformAction:(SEL)a3 withSender:(id)a4
{
  id v4 = NSStringFromSelector(a3);
  unsigned __int8 v5 = [&off_10155C368 containsObject:v4];

  return v5;
}

- (id)_crlaxEditingTextRep
{
  char v13 = 0;
  v2 = [(CRLTextInputResponder *)self editor];
  v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = __CRLAccessibilityCastAsClass(v3, (uint64_t)v2, 1, &v13);
  if (v13) {
    goto LABEL_6;
  }
  unsigned __int8 v5 = (void *)v4;

  char v12 = 0;
  v6 = [v5 editingReps];
  v7 = [v6 anyObject];

  v8 = (objc_class *)objc_opt_class();
  uint64_t v9 = __CRLAccessibilityCastAsClass(v8, (uint64_t)v7, 1, &v12);
  if (v12) {
LABEL_6:
  }
    abort();
  int v10 = (void *)v9;

  return v10;
}

- (id)_accessibilitySpeakTextSelectionViews
{
  v2 = [(CRLTextInputResponder *)self _crlaxEditingTextRep];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 crlaxValueForKey:@"_selectionHighlightLayer"];
    unsigned __int8 v5 = [v3 overlayRenderables];
    char v35 = 0;
    id v6 = v3;
    v7 = objc_opt_class();
    uint64_t v8 = __CRLAccessibilityCastAsSafeCategory(v7, (uint64_t)v6, 1, &v35);
    if (v35) {
      abort();
    }
    uint64_t v9 = (void *)v8;

    int v10 = [v9 crlaxRetainedTarget];
    v11 = [v10 knobs];

    char v12 = objc_opt_new();
    char v13 = v12;
    if (v4) {
      [v12 addObject:v4];
    }
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v14 = v5;
    id v15 = [v14 countByEnumeratingWithState:&v31 objects:v37 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v32;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v32 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = [*(id *)(*((void *)&v31 + 1) + 8 * i) layer];
          [v13 addObject:v19];
        }
        id v16 = [v14 countByEnumeratingWithState:&v31 objects:v37 count:16];
      }
      while (v16);
    }

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v20 = v11;
    id v21 = [v20 countByEnumeratingWithState:&v27 objects:v36 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v28;
      do
      {
        for (j = 0; j != v22; j = (char *)j + 1)
        {
          if (*(void *)v28 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = [*(id *)(*((void *)&v27 + 1) + 8 * (void)j) crlaxValueForKey:@"layer" v27];
          if (v25) {
            [v13 addObject:v25];
          }
        }
        id v22 = [v20 countByEnumeratingWithState:&v27 objects:v36 count:16];
      }
      while (v22);
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (CGRect)_accessibilitySpeakRectForRange:(id)a3
{
  id v4 = a3;
  uint64_t v34 = 0;
  char v35 = (double *)&v34;
  v37 = "";
  uint64_t v36 = 0x4010000000;
  CGSize size = CGRectZero.size;
  CGPoint origin = CGRectZero.origin;
  CGSize v39 = size;
  char v33 = 0;
  id v6 = v4;
  v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = __CRLAccessibilityCastAsClass(v7, (uint64_t)v6, 1, &v33);
  if (v33) {
    abort();
  }
  uint64_t v9 = (void *)v8;

  if (v9)
  {
    int v10 = [(CRLTextInputResponder *)self _crlaxEditingTextRep];
    v11 = v10;
    if (v10)
    {
      char v33 = 0;
      id v12 = v10;
      char v13 = objc_opt_class();
      uint64_t v14 = __CRLAccessibilityCastAsSafeCategory(v13, (uint64_t)v12, 1, &v33);
      if (v33) {
        abort();
      }
      id v15 = (void *)v14;

      id v16 = [v15 crlaxRetainedTarget];
      uint64_t v17 = [v16 canvas];
      v18 = [v17 canvasController];

      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_1001B9B08;
      v28[3] = &unk_1014D3920;
      id v29 = v9;
      long long v32 = &v34;
      id v30 = v12;
      id v19 = v18;
      id v31 = v19;
      if (__CRLAccessibilityPerformSafeBlock((uint64_t)v28)) {
        abort();
      }
    }
  }
  double v20 = v35[4];
  double v21 = v35[5];
  double v22 = v35[6];
  double v23 = v35[7];

  _Block_object_dispose(&v34, 8);
  double v24 = v20;
  double v25 = v21;
  double v26 = v22;
  double v27 = v23;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (UIView)selectionContainerViewBelowText
{
  v2 = self;
  id v3 = sub_100711648();

  return (UIView *)v3;
}

- (UIView)selectionContainerViewAboveText
{
  v2 = self;
  id v3 = sub_100711698();

  return (UIView *)v3;
}

- (int64_t)textInputInProgress
{
  return *(int64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_textInputInProgress);
}

- (void)setTextInputInProgress:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_textInputInProgress) = (Class)a3;
}

- (BOOL)scribbleInProgress
{
  return *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_scribbleInProgress);
}

- (void)setScribbleInProgress:(BOOL)a3
{
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_scribbleInProgress) = a3;
}

- (BOOL)ignorePencilInputSource
{
  return *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_ignorePencilInputSource);
}

- (void)setIgnorePencilInputSource:(BOOL)a3
{
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_ignorePencilInputSource) = a3;
}

- (_TtC8Freeform18CRLTextInputLogger)inputLogger
{
  return (_TtC8Freeform18CRLTextInputLogger *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                                      + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_inputLogger));
}

- (void)setInputLogger:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_inputLogger);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_inputLogger) = (Class)a3;
  id v3 = a3;
}

- (BOOL)iccAllowsTextEditing
{
  v2 = self;
  char v3 = sub_100711834();

  return v3 & 1;
}

- (BOOL)shouldChangeFirstResponderFor:(id)a3
{
  swift_unknownObjectRetain();
  unsigned __int8 v5 = self;
  char v6 = sub_100711920(a3);
  swift_unknownObjectRelease();

  return v6 & 1;
}

- (BOOL)editorIsChanging
{
  return *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_editorIsChanging);
}

- (void)setEditorIsChanging:(BOOL)a3
{
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_editorIsChanging) = a3;
}

- (_TtP8Freeform18CRLTextInputEditor_)editor
{
  v2 = (void *)swift_unknownObjectRetain();

  return (_TtP8Freeform18CRLTextInputEditor_ *)v2;
}

- (void)setEditor:(id)a3
{
}

- (void)setNeedsInputViewsReloaded
{
  v2 = self;
  sub_100711AE4();
}

- (BOOL)keyboardIsAnimating
{
  v2 = self;

  return [v2 keyboardIsAnimating];
}

- (void)reloadInputViews
{
  v2 = self;
  sub_100711FCC();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for CRLTextInputResponder();
  [(CRLTextInputResponder *)&v3 reloadInputViews];
}

- (void)textWillChange
{
  v2 = self;
  sub_10071227C();
}

- (void)textDidChange
{
  v2 = self;
  sub_100712358();
}

- (void)setEditor:(id)a3 withFlags:(unint64_t)a4
{
  char v4 = a4;
  swift_unknownObjectRetain();
  v7 = self;
  sub_100712434((uint64_t)a3, v4);

  swift_unknownObjectRelease();
}

- (UIResponder)nextInChain
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UIResponder *)Strong;
}

- (void)setNextInChain:(id)a3
{
}

- (UIResponder)nextResponder
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UIResponder *)Strong;
}

- (CRLInteractiveCanvasController)icc
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (CRLInteractiveCanvasController *)Strong;
}

- (void)setIcc:(id)a3
{
}

- (_TtC8Freeform21CRLTextInputResponder)initWithNextResponder:(id)a3 icc:(id)a4
{
  return (_TtC8Freeform21CRLTextInputResponder *)sub_100712A08(a3, a4);
}

- (void)applicationDidEnterBackgroundWithNotification:(id)a3
{
  objc_super v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_editor);
  if (v3)
  {
    id v5 = a3;
    v7 = self;
    id v6 = [v3 textInputReceiver];
    if (v6)
    {
      [v6 abortMarkedText];

      swift_unknownObjectRelease();
    }
    else
    {
    }
  }
}

- (void)applicationWillEnterForegroundWithNotification:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10071A26C();
}

- (void)firstResponderChangedWithNotification:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = self;
  sub_100712F14();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (BOOL)becomeFirstResponder
{
  v2 = self;
  unsigned __int8 v3 = sub_1007130D8();

  return v3 & 1;
}

- (void)scribbleWillBegin
{
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_scribbleInProgress) = 1;
}

- (void)scribbleDidEnd
{
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_scribbleInProgress) = 0;
}

- (BOOL)endTextInputWhenFirstResponderResigns
{
  return *((unsigned char *)&self->super.super.isa
         + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_endTextInputWhenFirstResponderResigns);
}

- (void)setEndTextInputWhenFirstResponderResigns:(BOOL)a3
{
  *((unsigned char *)&self->super.super.isa
  + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_endTextInputWhenFirstResponderResigns) = a3;
}

- (BOOL)resigningFirstResponder
{
  return *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_resigningFirstResponder);
}

- (void)setResigningFirstResponder:(BOOL)a3
{
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_resigningFirstResponder) = a3;
}

- (BOOL)resignFirstResponder
{
  v2 = self;
  unsigned __int8 v3 = sub_10071333C();

  return v3 & 1;
}

- (BOOL)disallowBecomingFirstResponder
{
  return *((unsigned char *)&self->super.super.isa
         + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_disallowBecomingFirstResponder);
}

- (void)setDisallowBecomingFirstResponder:(BOOL)a3
{
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_disallowBecomingFirstResponder) = a3;
}

- (BOOL)canBecomeFirstResponder
{
  return (*((unsigned char *)&self->super.super.isa
          + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_disallowBecomingFirstResponder) & 1) == 0
      && *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_editor) != 0;
}

- (BOOL)ignoreKeyboard
{
  return *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_ignoreKeyboard);
}

- (void)setIgnoreKeyboard:(BOOL)a3
{
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_ignoreKeyboard) = a3;
}

- (void)textSelectionWillChange
{
  v2 = self;
  sub_100713674();
}

- (void)textSelectionDidChange
{
  v2 = self;
  sub_100713770();
}

- (id)textInRange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_10071386C(v4);
  uint64_t v7 = v6;

  if (v7)
  {
    NSString v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v8 = 0;
  }

  return v8;
}

- (void)replaceRange:(id)a3 withText:(id)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  id v9 = a3;
  uint64_t v10 = self;
  sub_1007139E4(v9, v6, v8);

  swift_bridgeObjectRelease();
}

- (void)textInput:(id)a3
{
  id v4 = (void (**)(const void *))_Block_copy(a3);
  uint64_t v5 = OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_textInputInProgress;
  uint64_t v6 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_textInputInProgress);
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = (objc_class *)(v6 + 1);
  if (v7)
  {
    __break(1u);
    goto LABEL_7;
  }
  id v9 = v4;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_textInputInProgress) = v8;
  uint64_t v10 = v4[2];
  char v13 = self;
  v10(v9);
  uint64_t v11 = *(uint64_t *)((char *)&self->super.super.isa + v5);
  BOOL v7 = __OFSUB__(v11, 1);
  id v12 = (objc_class *)(v11 - 1);
  if (v7)
  {
LABEL_7:
    __break(1u);
    return;
  }
  *(Class *)((char *)&self->super.super.isa + v5) = v12;
  _Block_release(v9);
}

- (UITextRange)selectedTextRange
{
  v2 = self;
  id v3 = sub_100713D44();

  return (UITextRange *)v3;
}

- (void)setSelectedTextRange:(id)a3
{
  uint64_t v3 = OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_textInputInProgress;
  uint64_t v4 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_textInputInProgress);
  BOOL v5 = __OFADD__(v4, 1);
  uint64_t v6 = (objc_class *)(v4 + 1);
  if (v5)
  {
    __break(1u);
    goto LABEL_7;
  }
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_textInputInProgress) = v6;
  id v12 = a3;
  id v9 = self;
  sub_100713E50(a3, (uint64_t)v9);
  uint64_t v10 = *(uint64_t *)((char *)&self->super.super.isa + v3);
  BOOL v5 = __OFSUB__(v10, 1);
  uint64_t v11 = (objc_class *)(v10 - 1);
  if (v5)
  {
LABEL_7:
    __break(1u);
    return;
  }
  *(Class *)((char *)&self->super.super.isa + v3) = v11;
}

- (BOOL)isSettingMarkedText
{
  return *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_isSettingMarkedText);
}

- (void)setIsSettingMarkedText:(BOOL)a3
{
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_isSettingMarkedText) = a3;
}

- (UITextRange)markedTextRange
{
  v2 = self;
  id v3 = sub_100714138();

  return (UITextRange *)v3;
}

- (NSDictionary)markedTextStyle
{
  return (NSDictionary *)0;
}

- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if (a3)
  {
    uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    id v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    id v9 = 0;
  }
  uint64_t v10 = self;
  sub_100714250(v7, v9, location, length);

  swift_bridgeObjectRelease();
}

- (void)setAttributedMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = a3;
  id v9 = self;
  sub_1007144D0(a3, location, length);
}

- (void)unmarkText
{
  v2 = self;
  sub_10071471C();
}

- (int64_t)autocorrectionType
{
  return *(int64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_autocorrectionType);
}

- (void)setAutocorrectionType:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_autocorrectionType) = (Class)a3;
}

- (int64_t)inlinePredictionType
{
  return *(int64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_inlinePredictionType);
}

- (void)setInlinePredictionType:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_inlinePredictionType) = (Class)a3;
}

- (UITextPosition)beginningOfDocument
{
  v2 = self;
  id v3 = sub_1007148B8();

  return (UITextPosition *)v3;
}

- (UITextPosition)endOfDocument
{
  v2 = self;
  id v3 = sub_100714908();

  return (UITextPosition *)v3;
}

- (id)textRangeFromPosition:(id)a3 toPosition:(id)a4
{
  uint64_t v6 = qword_10166EE60;
  id v7 = a3;
  id v8 = a4;
  id v9 = self;
  if (v6 != -1) {
    swift_once();
  }
  uint64_t v10 = (void *)qword_10171A478;
  id v11 = v7;
  id v12 = v8;
  id v13 = v10;
  sub_1007149B8((uint64_t)v9, &v16);

  id v14 = v16;

  return v14;
}

- (id)positionFromPosition:(id)a3 offset:(int64_t)a4
{
  id v6 = a3;
  id v7 = self;
  id v8 = sub_100714C20(v6, a4);

  return v8;
}

- (id)positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5
{
  uint64_t v8 = qword_10166EE60;
  id v9 = a3;
  uint64_t v10 = self;
  if (v8 != -1) {
    swift_once();
  }
  id v11 = (void *)qword_10171A478;
  id v12 = v9;
  id v13 = v11;
  sub_100714DC0((uint64_t)v10, a4, a5, &v16);

  id v14 = v16;

  return v14;
}

- (int64_t)comparePosition:(id)a3 toPosition:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  id v9 = sub_100714F78((uint64_t)v6, (uint64_t)v7);

  return (int64_t)v9;
}

- (int64_t)offsetFromPosition:(id)a3 toPosition:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  id v9 = sub_100714FE8((uint64_t)v6, (uint64_t)v7);

  return (int64_t)v9;
}

- (UITextInputDelegate)inputDelegate
{
  v2 = (void *)swift_unknownObjectRetain();

  return (UITextInputDelegate *)v2;
}

- (void)setInputDelegate:(id)a3
{
}

- (UITextInputTokenizer)tokenizer
{
  id v3 = objc_allocWithZone((Class)type metadata accessor for CRLTextInputResponder.CRLWPInputStringTokenizer());
  uint64_t v4 = self;
  id v5 = [v3 initWithTextInput:v4];

  return (UITextInputTokenizer *)v5;
}

- (id)positionWithinRange:(id)a3 farthestInDirection:(int64_t)a4
{
  id v6 = a3;
  id v7 = self;
  id v8 = sub_100715208((uint64_t)v6, a4);

  return v8;
}

- (id)characterRangeByExtendingPosition:(id)a3 inDirection:(int64_t)a4
{
  id v6 = a3;
  id v7 = self;
  id v8 = sub_100715320(v6, a4);

  return v8;
}

- (int64_t)baseWritingDirectionForPosition:(id)a3 inDirection:(int64_t)a4
{
  id v5 = a3;
  id v6 = self;
  int64_t v7 = sub_10071A344(v5);

  return v7;
}

- (void)setBaseWritingDirection:(int64_t)a3 forRange:(id)a4
{
  id v6 = a4;
  int64_t v7 = self;
  sub_100715574(a3, v6);
}

- (CGRect)firstRectForRange:(id)a3
{
  double v3 = sub_100715B14(self, (uint64_t)a2, a3, sub_1007157D0);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)caretRectForPosition:(id)a3
{
  double v3 = sub_100715B14(self, (uint64_t)a2, a3, sub_1007159C0);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)selectionRectsForRange:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_100715B94(v4);

  sub_10050BF48(0, (unint64_t *)&qword_10167A2B0);
  v6.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v6.super.isa;
}

- (id)closestPositionToPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v5 = self;
  id v6 = sub_100715E04(x, y);

  return v6;
}

- (id)closestPositionToPoint:(CGPoint)a3 withinRange:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  id v8 = self;
  id v9 = sub_100715FC0(v7, x, y);

  return v9;
}

- (id)characterRangeAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v5 = qword_10166EE60;
  id v6 = self;
  if (v5 != -1) {
    swift_once();
  }
  id v7 = (id)qword_10171A478;
  sub_100716204((uint64_t)v6, &v10, x, y);

  id v8 = v10;

  return v8;
}

- (BOOL)hasText
{
  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_editor);
  if (v2)
  {
    double v3 = self;
    id v4 = [v2 textInputReceiver];
    if (v4)
    {
      unsigned __int8 v5 = [v4 hasText];

      swift_unknownObjectRelease();
      return v5;
    }
  }
  return 0;
}

- (BOOL)keyboardIsHiding
{
  return *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_keyboardIsHiding);
}

- (void)setKeyboardIsHiding:(BOOL)a3
{
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_keyboardIsHiding) = a3;
}

- (void)beginTextInput
{
  v2 = self;
  sub_1007163F0();
}

- (void)endTextInput:(id)a3
{
  double v3 = self;
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v10 = 0u;
    long long v11 = 0u;
    unsigned __int8 v5 = self;
  }
  int v6 = *((unsigned __int8 *)&v3->super.super.isa
       + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_resigningFirstResponder);
  Strong = (_TtC8Freeform21CRLTextInputResponder *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v8 = Strong;
    if (v6) {
      uint64_t v9 = 8320;
    }
    else {
      uint64_t v9 = 0x2000;
    }
    -[CRLTextInputResponder endEditingWithFlags:](Strong, "endEditingWithFlags:", v9, v10, v11);

    double v3 = v8;
  }

  sub_100522F00((uint64_t)&v10, &qword_101672BF0);
}

- (void)indentParagraphLevel:(id)a3
{
}

- (void)outdentParagraphLevel:(id)a3
{
}

- (void)insertTab:(id)a3
{
}

- (BOOL)editorWantsPlainTextDelete
{
  v2 = self;
  unsigned __int8 v3 = sub_100716A98();

  return v3 & 1;
}

- (void)insertBackTab:(id)a3
{
}

- (void)insertNewline:(id)a3
{
}

- (void)escapePressed:(id)a3
{
}

- (void)insertText:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  id v7 = self;
  sub_100716D6C(v4, v6);

  swift_bridgeObjectRelease();
}

- (void)insertText:(id)a3 alternatives:(id)a4 style:(int64_t)a5
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  uint64_t v9 = self;
  sub_100716D6C(v6, v8);

  swift_bridgeObjectRelease();
}

- (void)deleteKeyPressed
{
  v2 = self;
  sub_100717100();
}

- (void)deleteBackward
{
  uint64_t v2 = OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_textInputInProgress;
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_textInputInProgress);
  BOOL v4 = __OFADD__(v3, 1);
  uint64_t v5 = (objc_class *)(v3 + 1);
  if (v4)
  {
    __break(1u);
    goto LABEL_7;
  }
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_textInputInProgress) = v5;
  uint64_t v9 = self;
  sub_1007172D0((uint64_t)v9);
  uint64_t v7 = *(uint64_t *)((char *)&self->super.super.isa + v2);
  BOOL v4 = __OFSUB__(v7, 1);
  uint64_t v8 = (objc_class *)(v7 - 1);
  if (v4)
  {
LABEL_7:
    __break(1u);
    return;
  }
  *(Class *)((char *)&self->super.super.isa + v2) = v8;
}

- (void)deleteWordBackward
{
}

- (void)deleteWordForward
{
}

- (void)spacebarTapped:(id)a3
{
}

- (UIView)inputView
{
  uint64_t v2 = self;
  id v3 = sub_100717898();

  return (UIView *)v3;
}

- (UIView)inputAccessoryView
{
  return (UIView *)0;
}

- (UIInputViewController)inputAccessoryViewController
{
  uint64_t v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_editor);
  if (v2)
  {
    id v3 = self;
    if ([(id)swift_unknownObjectRetain() wantsVisibleKeyboard])
    {
      id v4 = [v2 inputAccessoryViewController];
      swift_unknownObjectRelease();

      goto LABEL_6;
    }

    swift_unknownObjectRelease();
  }
  id v4 = 0;
LABEL_6:

  return (UIInputViewController *)v4;
}

- (UIInputViewController)inputViewController
{
  return (UIInputViewController *)0;
}

- (BOOL)isIgnoringKeyboardInput
{
  return *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_isIgnoringKeyboardInput);
}

- (void)setIsIgnoringKeyboardInput:(BOOL)a3
{
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_isIgnoringKeyboardInput) = a3;
}

- (NSArray)keyCommands
{
  uint64_t v2 = self;
  id v3 = sub_100717CB4();

  if (v3)
  {
    sub_10050BF48(0, (unint64_t *)&unk_10167B160);
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return (NSArray *)v4.super.isa;
}

- (NSArray)arrowKeyCommands
{
  return (NSArray *)sub_10071845C((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_10071B04C);
}

- (id)keyCommandsForArrowsWithModifiersIn:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSArray v4 = self;
  sub_10071A5FC();

  swift_bridgeObjectRelease();
  sub_10050BF48(0, (unint64_t *)&unk_10167B160);
  v5.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v5.super.isa;
}

- (id)keyCommandForArrowIn:(id)a3 with:(int64_t)a4
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = self;
  NSString v7 = String._bridgeToObjectiveC()();
  id v8 = [self keyCommandWithInput:v7 modifierFlags:a4 action:"arrowKeyInputReceivedFrom:"];

  [v8 setWantsPriorityOverSystemBehavior:1];
  swift_bridgeObjectRelease();

  return v8;
}

- (NSArray)tirKeyCommands
{
  uint64_t v2 = self;
  sub_100717F14();

  sub_10050BF48(0, (unint64_t *)&unk_10167B160);
  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (NSArray)deleteKeyCommands
{
  return (NSArray *)sub_10071845C((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_10071A4C8);
}

- (id)editorForKeyEvents
{
  id v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_editor);
  if (v2) {
    id v2 = [v2 keyInputReceiver];
  }

  return v2;
}

- (void)arrowKeyInputReceivedFrom:(id)a3
{
  id v4 = a3;
  NSArray v5 = self;
  sub_100718510(v4);
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  if (a4)
  {
    uint64_t v6 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v16, 0, sizeof(v16));
    NSString v7 = self;
  }
  sub_100718770((uint64_t)a3, (uint64_t)v16, &v17);

  sub_100522F00((uint64_t)v16, &qword_101672BF0);
  uint64_t v8 = v18;
  if (v18)
  {
    uint64_t v9 = sub_10050F848(&v17, v18);
    uint64_t v10 = *(void *)(v8 - 8);
    __n128 v11 = __chkstk_darwin(v9, v9);
    id v13 = (char *)v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, __n128))(v10 + 16))(v13, v11);
    id v14 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v8);
    _s8Freeform26AnyCRLCommandChangeContextVwxx_0((uint64_t)&v17);
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (_TtC8Freeform17CRLFloatingCursor)floatingCursorHelper
{
  return (_TtC8Freeform17CRLFloatingCursor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                                     + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_floatingCursorHelper));
}

- (void)setFloatingCursorHelper:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_floatingCursorHelper);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_floatingCursorHelper) = (Class)a3;
  id v3 = a3;
}

- (void)beginFloatingCursorAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  NSArray v5 = self;
  sub_100718B54(x, y);
}

- (void)updateFloatingCursorAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v5 = qword_10166EE60;
  uint64_t v6 = self;
  if (v5 != -1) {
    swift_once();
  }
  id v7 = (id)qword_10171A478;
  sub_100718F50((uint64_t)v6, x, y);
}

- (void)endFloatingCursor
{
  id v2 = self;
  sub_100719190();
}

- (CGRect)convertRectToTopResponderView:(CGRect)a3
{
  double v3 = sub_100719478(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, sub_1007192B8);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGPoint)convertPointToTopResponderView:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v5 = self;
  double v6 = sub_1007192DC(x, y);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double y = v10;
  result.double x = v9;
  return result;
}

- (CGRect)convertRectFromTopResponderView:(CGRect)a3
{
  double v3 = sub_100719478(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, sub_10071933C);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGPoint)convertPointFromTopResponderView:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v5 = self;
  double v6 = sub_1007194FC(x, y);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double y = v10;
  result.double x = v9;
  return result;
}

- (UIView)topFirstResponderView
{
  id v2 = self;
  double v3 = (void *)sub_100719690();

  return (UIView *)v3;
}

- (UIView)textInputView
{
  id v2 = self;
  double v3 = (void *)sub_100719878();

  return (UIView *)v3;
}

- (void)reloadForMathPaperChangesWithNotification:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  double v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  double v9 = self;
  sub_100719930();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (_TtC8Freeform21CRLTextInputResponder)init
{
  CGPoint result = (_TtC8Freeform21CRLTextInputResponder *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_release();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectRelease();
  double v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLTextInputResponder_floatingCursorHelper);
}

- (unint64_t)allowedWritingToolsResultOptions
{
  return 1;
}

- (int64_t)writingToolsBehavior
{
  return 2;
}

- (uint64_t)mathExpressionCompletionType
{
  id v0 = [self standardUserDefaults];
  unint64_t v1 = (unint64_t)[v0 integerForKey:@"CRLMathRecognitionMode"];

  if (v1 > 2) {
    return 0;
  }
  else {
    return qword_10118A120[v1];
  }
}

@end