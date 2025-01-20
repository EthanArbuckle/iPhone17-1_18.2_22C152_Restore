@interface UITextInteraction
+ (UITextInteraction)textInteractionForMode:(UITextInteractionMode)mode;
+ (double)_maximumBeamSnappingLength;
+ (id)textInteractionsForSet:(int64_t)a3;
- (BOOL)_allowsSelectionCommands;
- (BOOL)_shouldAllowEnforcedTouchTypeForTouch:(id)a3 forGestureRecognizer:(id)a4;
- (BOOL)_shouldObscureTextInput;
- (BOOL)_textInputIsInteractive;
- (BOOL)_textInputLivesInKeyWindow;
- (BOOL)containerChangesSelectionOnOneFingerTap;
- (BOOL)currentSelectionContainsPoint:(CGPoint)a3;
- (BOOL)doesControlDelegate;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)inGesture;
- (BOOL)interaction_gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)interaction_gestureRecognizerShouldBegin:(id)a3;
- (BOOL)selection:(id)a3 containsPoint:(CGPoint)a4;
- (BOOL)shouldAllowWithTouchTypes:(id)a3 atPoint:(CGPoint)a4 toBegin:(BOOL)a5;
- (BOOL)shouldHandleFormGestureAtLocation:(CGPoint)a3;
- (NSArray)children;
- (NSArray)gestures;
- (NSArray)gesturesForFailureRequirements;
- (NSDictionary)gestureMap;
- (UILongPressGestureRecognizer)_customHighlighterGesture;
- (UIResponder)textInput;
- (UITextCursorAssertionController)_assertionController;
- (UITextInteraction)init;
- (UITextInteraction)interactionWithClass:(Class)a3;
- (UITextInteraction)interactionWithGestureForName:(id)a3;
- (UITextInteraction)parent;
- (UITextInteraction)root;
- (UITextInteractionInputDelegate)interactionInputDelegate;
- (UITextInteractionMode)textInteractionMode;
- (UITextInteraction_AssistantDelegate)assistantDelegate;
- (UIView)gestureRecognizerHostView;
- (UIView)view;
- (_UIStatesFeedbackGenerator)feedbackBehaviour;
- (double)distanceBetweenPoint:(CGPoint)a3 andRects:(id)a4;
- (id)_textInput;
- (id)_transientState;
- (id)_updatedAccessibilityTextMenuWithMenuElements:(id)a3;
- (id)defaultDoubleTapRecognizerWithAction:(SEL)a3;
- (id)defaultTapRecognizerWithAction:(SEL)a3;
- (id)defaultTripleTapRecognizerWithAction:(SEL)a3;
- (id)delegate;
- (id)linkInteractionSession;
- (id)rangeWithTextAlternatives:(id *)a3 atPosition:(id)a4;
- (id)recognizerForName:(id)a3;
- (int64_t)textInteractionSet;
- (void)_applyTransientState:(id)a3;
- (void)_beginSelectionChange;
- (void)_callDelegateWillMoveTextRangeExtentAtPoint:(CGPoint)a3;
- (void)_cancelRecognizerWithName:(id)a3;
- (void)_cleanUpFeedbackForGesture;
- (void)_createFeedbackIfNecessary;
- (void)_endSelectionChange;
- (void)_performGestureType:(int64_t)a3 state:(int64_t)a4 location:(CGPoint)a5;
- (void)_performGestureType:(int64_t)a3 state:(int64_t)a4 location:(CGPoint)a5 locationOfFirstTouch:(CGPoint)a6;
- (void)_performGestureType:(int64_t)a3 state:(int64_t)a4 location:(CGPoint)a5 locationOfFirstTouch:(CGPoint)a6 forTouchType:(int64_t)a7;
- (void)_performPreemtiveLayoutToEnsureNoMoreLayoutWhileSelecting:(id)a3;
- (void)_playFeedbackForCursorMovement;
- (void)_prepareFeedbackForGesture;
- (void)_presentTextEditMenuWithOverrideMenu:(id)a3;
- (void)_setAllowsSelectionCommands:(BOOL)a3;
- (void)_setLinkInteractionSession:(id)a3;
- (void)addChild:(id)a3;
- (void)addGestureRecognizer:(id)a3 withName:(id)a4;
- (void)addIndirectChild:(id)a3;
- (void)cancelLinkInteractionSession;
- (void)didMoveToView:(id)a3;
- (void)disableClearsOnInsertion;
- (void)finishSetup;
- (void)removeChild:(id)a3;
- (void)removeGestureRecognizerWithName:(id)a3;
- (void)setAssistantDelegate:(id)a3;
- (void)setDelegate:(id)delegate;
- (void)setFeedbackBehaviour:(id)a3;
- (void)setInGesture:(BOOL)a3;
- (void)setInteractionInputDelegate:(id)a3;
- (void)setTextInput:(UIResponder *)textInput;
- (void)setView:(id)a3;
- (void)set_customHighlighterGesture:(id)a3;
- (void)updateTextInputSourceForScribbleGesture:(id)a3;
- (void)willMoveToView:(id)a3;
@end

@implementation UITextInteraction

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (UITextInteraction_AssistantDelegate)assistantDelegate
{
  p_assistantDelegate = &self->_assistantDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_assistantDelegate);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_assistantDelegate);
    goto LABEL_8;
  }
  id v6 = objc_loadWeakRetained((id *)&self->_parent);

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_parent);
    uint64_t v8 = [v7 assistantDelegate];
LABEL_7:
    id v5 = (id)v8;

    goto LABEL_8;
  }
  p_textInput = &self->_textInput;
  id v10 = objc_loadWeakRetained((id *)p_textInput);

  if (v10)
  {
    id v7 = objc_loadWeakRetained((id *)p_textInput);
    uint64_t v8 = [v7 interactionAssistant];
    goto LABEL_7;
  }
  id v5 = 0;
LABEL_8:
  return (UITextInteraction_AssistantDelegate *)v5;
}

- (UITextInteraction)init
{
  v11.receiver = self;
  v11.super_class = (Class)UITextInteraction;
  v2 = [(UITextInteraction *)&v11 init];
  v3 = v2;
  if (v2)
  {
    v2->_textInteractionMode = -1;
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    children = v3->_children;
    v3->_children = (NSMutableArray *)v4;

    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    gestures = v3->_gestures;
    v3->_gestures = (NSMutableArray *)v6;

    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    gestureMap = v3->_gestureMap;
    v3->_gestureMap = (NSMutableDictionary *)v8;
  }
  return v3;
}

- (id)recognizerForName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UITextInteraction *)self interactionWithGestureForName:v4];
  uint64_t v6 = (void *)v5;
  if (v5)
  {
    id v7 = [*(id *)(v5 + 32) objectForKey:v4];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (UITextInteraction)interactionWithGestureForName:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_gestureMap objectForKey:v4];
  if (v5)
  {
    uint64_t v6 = self;
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = self->_children;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "interactionWithGestureForName:", v4, (void)v14);
          if (v12)
          {
            uint64_t v6 = (UITextInteraction *)v12;

            goto LABEL_13;
          }
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    uint64_t v6 = 0;
  }
LABEL_13:

  return v6;
}

- (id)_textInput
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [(UITextInteraction *)self root];
  id v4 = [v3 textInput];

  if (!v4)
  {
    if (+[UIKeyboard isKeyboardProcess]) {
      goto LABEL_4;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    char v6 = [WeakRetained conformsToProtocol:&unk_1ED42F658];

    if (v6) {
      goto LABEL_4;
    }
    if (os_variant_has_internal_diagnostics())
    {
      uint64_t v9 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        goto LABEL_12;
      }
      id v10 = objc_loadWeakRetained((id *)&self->_view);
      Class Class = object_getClass(v10);
      uint64_t v12 = Class;
      id v13 = objc_loadWeakRetained((id *)&self->_view);
      int v15 = 138412546;
      Class v16 = Class;
      __int16 v17 = 2048;
      id v18 = v13;
      _os_log_fault_impl(&dword_1853B0000, v9, OS_LOG_TYPE_FAULT, "View <%@:%p> does not conform to UITextInput protocol", (uint8_t *)&v15, 0x16u);
    }
    else
    {
      uint64_t v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_textInput___s_category) + 8);
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
LABEL_4:
        id v4 = objc_loadWeakRetained((id *)&self->_view);
        goto LABEL_5;
      }
      uint64_t v9 = v8;
      id v10 = objc_loadWeakRetained((id *)&self->_view);
      Class v11 = object_getClass(v10);
      uint64_t v12 = v11;
      id v13 = objc_loadWeakRetained((id *)&self->_view);
      int v15 = 138412546;
      Class v16 = v11;
      __int16 v17 = 2048;
      id v18 = v13;
      _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "View <%@:%p> does not conform to UITextInput protocol", (uint8_t *)&v15, 0x16u);
    }

LABEL_12:
    goto LABEL_4;
  }
LABEL_5:
  return v4;
}

- (UIResponder)textInput
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textInput);
  return (UIResponder *)WeakRetained;
}

- (void)addGestureRecognizer:(id)a3 withName:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  [v10 setName:v6];
  [v10 _setAnalyticsGestureHandled:1];
  if ([(UITextInteraction *)self doesControlDelegate]) {
    [v10 setDelegate:self];
  }
  id v7 = [v10 _pairedGestureIdentifiers];
  [v7 addObject:v6];

  [(NSMutableArray *)self->_gestures addObject:v10];
  [(NSMutableDictionary *)self->_gestureMap setObject:v10 forKey:v6];

  uint64_t v8 = [(UITextInteraction *)self gestureRecognizerHostView];
  uint64_t v9 = (void *)v8;
  if (v8) {
    -[UIView _addGestureRecognizer:atEnd:](v8, v10, 0);
  }
}

- (void)didMoveToView:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(UITextInteraction *)self cancelLinkInteractionSession];
  id v5 = objc_storeWeak((id *)&self->_view, v4);

  id v6 = v5;
  if (!v4) {
    goto LABEL_24;
  }
  id v7 = [(UITextInteraction *)self gestureRecognizerHostView];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  uint64_t v8 = self->_gestures;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v47;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v47 != v11) {
          objc_enumerationMutation(v8);
        }
        -[UIView _addGestureRecognizer:atEnd:]((uint64_t)v7, *(void **)(*((void *)&v46 + 1) + 8 * v12++), 0);
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v46 objects:v51 count:16];
    }
    while (v10);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v13 = self->_children;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v43;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v43 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v42 + 1) + 8 * v17);
        id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
        objc_msgSend(WeakRetained, "addInteraction:", v18, (void)v42);

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v42 objects:v50 count:16];
    }
    while (v15);
  }

  id v20 = objc_loadWeakRetained((id *)&self->_assistantDelegate);
  if (!v20)
  {
    id v20 = objc_loadWeakRetained((id *)&self->_parent);
    if (!v20)
    {
      id v28 = objc_loadWeakRetained((id *)&self->_textInput);
      if (!v28) {
        goto LABEL_19;
      }
      v29 = v28;
      id v30 = objc_loadWeakRetained((id *)&self->_view);
      v31 = +[UIKeyboardImpl activeInstance];
      id v32 = [v31 markedTextOverlay];

      if (v30 == v32) {
        goto LABEL_19;
      }
      id v33 = objc_loadWeakRetained((id *)&self->_textInput);
      v34 = [v33 interactionAssistant];

      if (!v34)
      {
        id v35 = objc_loadWeakRetained((id *)&self->_textInput);
        objc_msgSend(v35, "__createInteractionAssistantIfNecessaryWithMode:", self->_textInteractionMode);
      }
      id v36 = objc_loadWeakRetained((id *)&self->_textInput);
      objc_msgSend(v36, "__prepareInteractionAssistantIfNecessary");

      id v37 = objc_loadWeakRetained((id *)&self->_textInput);
      v38 = [v37 interactionAssistant];
      [v38 setExternalInteractions:self];

      v39 = objc_alloc_init(UITextInteractionInputDelegate);
      [(UITextInteraction *)self setInteractionInputDelegate:v39];

      v40 = [(UITextInteraction *)self interactionInputDelegate];
      [v40 setRootInteraction:self];

      id v20 = objc_loadWeakRetained((id *)&self->_textInput);
      v41 = [(UITextInteraction *)self interactionInputDelegate];
      [v20 setInputDelegate:v41];
    }
  }

LABEL_19:
  id v21 = objc_loadWeakRetained((id *)&self->_delegate);
  char v22 = objc_opt_respondsToSelector();

  if (v22)
  {
    id v23 = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v24 = [v23 interactionShouldSuppressSystemUI:self];

    v25 = [(UITextInteraction *)self assistantDelegate];
    [v25 setSuppressSystemUI:v24];
  }
  id v26 = objc_loadWeakRetained((id *)&self->_view);
  char v27 = objc_opt_respondsToSelector();

  if (v27) {
    self->_viewOverridesInteractivityState = 1;
  }

LABEL_24:
}

- (UIView)gestureRecognizerHostView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (void)willMoveToView:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  [(UITextInteraction *)self cancelLinkInteractionSession];
  if (!a3)
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v5 = self->_gestures;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v34;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v34 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v33 + 1) + 8 * v9);
          id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
          [WeakRetained removeGestureRecognizer:v10];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v7);
    }

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v12 = self->_children;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v30;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v30 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v29 + 1) + 8 * v16);
          id v18 = objc_loadWeakRetained((id *)&self->_view);
          objc_msgSend(v18, "removeInteraction:", v17, (void)v29);

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v14);
    }

    id v19 = objc_loadWeakRetained((id *)&self->_assistantDelegate);
    if (v19) {
      goto LABEL_18;
    }
    id v19 = objc_loadWeakRetained((id *)&self->_parent);
    if (v19) {
      goto LABEL_18;
    }
    id v20 = objc_loadWeakRetained((id *)&self->_textInput);

    if (v20)
    {
      id v21 = objc_loadWeakRetained((id *)&self->_textInput);
      char v22 = [v21 interactionAssistant];
      id v23 = [v22 externalInteractions];

      if (v23 == self)
      {
        id v24 = objc_loadWeakRetained((id *)&self->_textInput);
        v25 = [v24 inputDelegate];
        id v26 = [(UITextInteraction *)self interactionInputDelegate];

        if (v25 == v26)
        {
          char v27 = [(UITextInteraction *)self interactionInputDelegate];
          [v27 setRootInteraction:0];

          id v28 = objc_loadWeakRetained((id *)&self->_textInput);
          [v28 setInputDelegate:0];

          [(UITextInteraction *)self setInteractionInputDelegate:0];
        }
        id v19 = objc_loadWeakRetained((id *)&self->_textInput);
        objc_msgSend(v19, "__tearDownInteractionAssistantIfNecessary");
LABEL_18:
      }
    }
  }
}

- (void)_setLinkInteractionSession:(id)a3
{
  id v4 = a3;
  id v5 = [(UITextInteraction *)self root];
  uint64_t v6 = v5;
  if (v5) {
    BOOL v7 = v5 == self;
  }
  else {
    BOOL v7 = 1;
  }
  int v8 = !v7;
  if (os_variant_has_internal_diagnostics())
  {
    if (!v8) {
      goto LABEL_9;
    }
    uint64_t v9 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1853B0000, v9, OS_LOG_TYPE_FAULT, "Setting link interaction session on a non root interaction!", buf, 2u);
    }

LABEL_17:
    [(UITextInteraction *)v6 _setLinkInteractionSession:v4];
    goto LABEL_10;
  }
  if (v8)
  {
    uint64_t v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB2647C8) + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "Setting link interaction session on a non root interaction!", v11, 2u);
    }
    goto LABEL_17;
  }
LABEL_9:
  objc_setAssociatedObject(self, &_MergedGlobals_1265, v4, (void *)1);
LABEL_10:
}

- (void)cancelLinkInteractionSession
{
  v3 = [(UITextInteraction *)self root];
  id v4 = v3;
  if (!v3 || v3 == self) {
    [(UITextInteraction *)self _setLinkInteractionSession:0];
  }
  else {
    [(UITextInteraction *)v3 cancelLinkInteractionSession];
  }
}

- (UITextInteraction)root
{
  v2 = self;
  p_parent = (id *)&v2->_parent;
  id WeakRetained = objc_loadWeakRetained((id *)&v2->_parent);

  if (WeakRetained)
  {
    do
    {
      p_isa = (id *)objc_loadWeakRetained(p_parent);

      p_parent = p_isa + 1;
      id v6 = objc_loadWeakRetained(p_isa + 1);

      v2 = (UITextInteraction *)p_isa;
    }
    while (v6);
  }
  else
  {
    p_isa = (id *)&v2->super.isa;
  }
  return (UITextInteraction *)p_isa;
}

- (BOOL)doesControlDelegate
{
  return 1;
}

- (void)_applyTransientState:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = self->_children;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
        uint64_t v11 = (objc_class *)objc_opt_class();
        uint64_t v12 = NSStringFromClass(v11);
        uint64_t v13 = objc_msgSend(v4, "objectForKey:", v12, (void)v14);

        [v10 _applyTransientState:v13];
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (id)_transientState
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableArray *)self->_children count])
  {
    v3 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSMutableArray count](self->_children, "count"));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v4 = self->_children;
    uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "_transientState", (void)v13);
          if (v9)
          {
            uint64_t v10 = (objc_class *)objc_opt_class();
            uint64_t v11 = NSStringFromClass(v10);
            [v3 setObject:v9 forKey:v11];
          }
        }
        uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (BOOL)inGesture
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self->_inGesture)
  {
    LOBYTE(v2) = 1;
  }
  else
  {
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    v3 = self->_children;
    uint64_t v2 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    if (v2)
    {
      uint64_t v4 = *(void *)v8;
      while (2)
      {
        for (uint64_t i = 0; i != v2; ++i)
        {
          if (*(void *)v8 != v4) {
            objc_enumerationMutation(v3);
          }
          if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "inGesture", (void)v7))
          {
            LOBYTE(v2) = 1;
            goto LABEL_13;
          }
        }
        uint64_t v2 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
        if (v2) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  return v2;
}

- (void)addChild:(id)a3
{
  uint64_t v4 = (id *)a3;
  long long v7 = v4;
  if (!v4)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@: cluster may not be nil", self format];
    uint64_t v4 = 0;
  }
  uint64_t v5 = [v4 parent];

  if (v5)
  {
    uint64_t v6 = [v7 parent];
    [v6 removeChild:v7];
  }
  objc_storeWeak(v7 + 1, self);
  [(NSMutableArray *)self->_children addObject:v7];
}

- (UITextInteraction)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  return (UITextInteraction *)WeakRetained;
}

- (void)finishSetup
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = self->_children;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "finishSetup", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)setAssistantDelegate:(id)a3
{
}

- (void)setTextInput:(UIResponder *)textInput
{
}

- (void)setDelegate:(id)delegate
{
}

- (void)addIndirectChild:(id)a3
{
  uint64_t v4 = (id *)a3;
  uint64_t v5 = v4;
  if (!v4)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@: cluster may not be nil", self format];
    uint64_t v4 = 0;
  }
  objc_storeWeak(v4 + 1, self);
}

+ (UITextInteraction)textInteractionForMode:(UITextInteractionMode)mode
{
  uint64_t v4 = objc_alloc_init(UITextInteraction);
  v4->_textInteractionMode = mode;
  return v4;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_assistantDelegate);
  objc_storeStrong((id *)&self->_interactionInputDelegate, 0);
  objc_destroyWeak((id *)&self->_view);
  objc_destroyWeak((id *)&self->_textInput);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_feedbackBehaviour, 0);
  objc_storeStrong((id *)&self->_customHighlighterGesture, 0);
  objc_storeStrong((id *)&self->_gestureMap, 0);
  objc_storeStrong((id *)&self->_gestures, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_destroyWeak((id *)&self->_parent);
}

- (id)defaultTapRecognizerWithAction:(SEL)a3
{
  uint64_t v3 = [[UITextTapRecognizer alloc] initWithTarget:self action:a3];
  [(UITapGestureRecognizer *)v3 setAllowableMovement:10.0];
  [(UITapGestureRecognizer *)v3 setNumberOfTapsRequired:1];
  [(UITapGestureRecognizer *)v3 setNumberOfTouchesRequired:1];
  [(UIGestureRecognizer *)v3 setDelaysTouchesEnded:0];
  return v3;
}

- (id)defaultDoubleTapRecognizerWithAction:(SEL)a3
{
  uint64_t v3 = [[UITextTapRecognizer alloc] initWithTarget:self action:a3];
  [(UITapGestureRecognizer *)v3 setAllowableMovement:60.0];
  [(UITapGestureRecognizer *)v3 setNumberOfTapsRequired:2];
  [(UITapGestureRecognizer *)v3 setNumberOfTouchesRequired:1];
  [(UIGestureRecognizer *)v3 setDelaysTouchesEnded:0];
  [(UITapGestureRecognizer *)v3 _setDelaysRecognitionForGreaterTapCounts:1];
  return v3;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained;
  }
  else
  {
    id v6 = objc_loadWeakRetained((id *)&self->_parent);
    id v5 = [v6 delegate];
  }
  return v5;
}

- (void)removeChild:(id)a3
{
  uint64_t v4 = (id *)a3;
  id v5 = (uint64_t *)MEMORY[0x1E4F1C3C8];
  long long v10 = v4;
  if (!v4)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@: cluster may not be nil", self format];
    uint64_t v4 = 0;
  }
  id v6 = [v4 parent];

  if (v6 != self)
  {
    long long v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *v5;
    long long v9 = [v10 parent];
    [v7 raise:v8, @"%@: cluster has a different parent (%@)", self, v9 format];
  }
  objc_storeWeak(v10 + 1, 0);
  [(NSMutableArray *)self->_children removeObject:v10];
}

- (UITextInteraction)interactionWithClass:(Class)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = self->_children;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_opt_isKindOfClass())
        {
          id v10 = v9;
LABEL_13:
          uint64_t v11 = v10;
          goto LABEL_14;
        }
        objc_msgSend(v9, "interactionWithClass:", a3, (void)v13);
        id v10 = (id)objc_claimAutoreleasedReturnValue();
        if (v10) {
          goto LABEL_13;
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      uint64_t v11 = 0;
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
LABEL_14:

  return (UITextInteraction *)v11;
}

- (UITextCursorAssertionController)_assertionController
{
  uint64_t v2 = [(UITextInteraction *)self assistantDelegate];
  uint64_t v3 = [v2 _assertionController];

  return (UITextCursorAssertionController *)v3;
}

- (void)removeGestureRecognizerWithName:(id)a3
{
  id v7 = a3;
  uint64_t v4 = -[NSMutableDictionary objectForKey:](self->_gestureMap, "objectForKey:");
  if ([(NSMutableArray *)self->_gestures containsObject:v4])
  {
    uint64_t v5 = [(UITextInteraction *)self gestureRecognizerHostView];
    uint64_t v6 = v5;
    if (v5) {
      [v5 removeGestureRecognizer:v4];
    }
    if ([(UITextInteraction *)self doesControlDelegate]) {
      [v4 setDelegate:0];
    }
    [(NSMutableArray *)self->_gestures removeObject:v4];
    [(NSMutableDictionary *)self->_gestureMap removeObjectForKey:v7];
  }
}

- (void)_cancelRecognizerWithName:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v4 = a3;
    uint64_t v5 = [(UITextInteraction *)self root];
    uint64_t v6 = [v5 recognizerForName:v4];

    if (v6)
    {
      id v7 = [(id)UIApp _gestureEnvironment];
      v9[0] = v6;
      uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
      -[UIGestureEnvironment _cancelGestureRecognizers:]((uint64_t)v7, v8);
    }
  }
}

- (UITextInteractionMode)textInteractionMode
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);

  if (!WeakRetained) {
    return self->_textInteractionMode;
  }
  id v4 = [(UITextInteraction *)self root];
  UITextInteractionMode v5 = [v4 textInteractionMode];

  return v5;
}

- (void)setInGesture:(BOOL)a3
{
  BOOL v3 = a3;
  self->_inGesture = a3;
  uint64_t v5 = [(UITextInteraction *)self delegate];
  uint64_t v6 = (void *)v5;
  if (v5)
  {
    id v10 = (void *)v5;
    if (v3)
    {
      char v7 = objc_opt_respondsToSelector();
      uint64_t v6 = v10;
      if ((v7 & 1) == 0) {
        goto LABEL_8;
      }
      uint64_t v8 = [(UITextInteraction *)self root];
      [v10 interactionWillBegin:v8];
    }
    else
    {
      char v9 = objc_opt_respondsToSelector();
      uint64_t v6 = v10;
      if ((v9 & 1) == 0) {
        goto LABEL_8;
      }
      uint64_t v8 = [(UITextInteraction *)self root];
      [v10 interactionDidEnd:v8];
    }

    uint64_t v6 = v10;
  }
LABEL_8:
}

- (BOOL)shouldAllowWithTouchTypes:(id)a3 atPoint:(CGPoint)a4 toBegin:(BOOL)a5
{
  BOOL v5 = a5;
  double y = a4.y;
  double x = a4.x;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = self->_children;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "shouldAllowWithTouchTypes:atPoint:toBegin:", v9, v5, x, y, (void)v17))
        {
          BOOL v15 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
  BOOL v15 = 1;
LABEL_11:

  return v15;
}

- (void)_callDelegateWillMoveTextRangeExtentAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v6 = [(UITextInteraction *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(UITextInteraction *)self delegate];
    objc_msgSend(v8, "_willMoveTextRangeExtentAtPoint:", x, y);
  }
}

- (NSArray)gesturesForFailureRequirements
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  p_textInput = &self->_textInput;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textInput);
  BOOL v5 = [WeakRetained interactionAssistant];
  uint64_t v6 = [v5 externalInteractions];

  if (v6 == self)
  {
    id v8 = (NSMutableArray *)objc_loadWeakRetained((id *)p_textInput);
    long long v14 = [(NSMutableArray *)v8 interactionAssistant];
    BOOL v15 = [v14 interactions];
    char v7 = [v15 gesturesForFailureRequirements];
  }
  else
  {
    char v7 = (void *)[(NSMutableArray *)self->_gestures mutableCopy];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = self->_children;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "gesturesForFailureRequirements", (void)v17);
          [v7 addObjectsFromArray:v13];
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }
  }

  return (NSArray *)v7;
}

+ (id)textInteractionsForSet:(int64_t)a3
{
  if (a3 == 1) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = -1;
  }
  if (a3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  return (id)[a1 textInteractionForMode:v4];
}

- (int64_t)textInteractionSet
{
  UITextInteractionMode v2 = [(UITextInteraction *)self textInteractionMode];
  if (v2 == UITextInteractionModeNonEditable) {
    int64_t v3 = 1;
  }
  else {
    int64_t v3 = -1;
  }
  if (v2) {
    return v3;
  }
  else {
    return 0;
  }
}

- (void)_performGestureType:(int64_t)a3 state:(int64_t)a4 location:(CGPoint)a5
{
}

- (void)_performGestureType:(int64_t)a3 state:(int64_t)a4 location:(CGPoint)a5 locationOfFirstTouch:(CGPoint)a6
{
}

- (void)_performGestureType:(int64_t)a3 state:(int64_t)a4 location:(CGPoint)a5 locationOfFirstTouch:(CGPoint)a6 forTouchType:(int64_t)a7
{
  double y = a6.y;
  double x = a6.x;
  double v11 = a5.y;
  double v12 = a5.x;
  BOOL v15 = @"UITextInteractionNameInteractiveRefinement";
  if (a7 == 3) {
    BOOL v15 = @"UITextInteractionNameLoupe";
  }
  long long v16 = @"UITextInteractionNameDoubleTap";
  long long v17 = @"UITextInteractionNameSingleTap";
  if (a3 != 1) {
    long long v17 = 0;
  }
  if (a3 != 2) {
    long long v16 = v17;
  }
  if ((unint64_t)(a3 - 3) >= 2) {
    long long v18 = v16;
  }
  else {
    long long v18 = v15;
  }
  id v27 = [(UITextInteraction *)self root];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textInput);
  long long v20 = [WeakRetained interactionAssistant];
  id v21 = [v20 externalInteractions];

  if (v21 == self)
  {
    id v23 = objc_loadWeakRetained((id *)&self->_textInput);
    id v24 = [v23 interactionAssistant];
    uint64_t v25 = [v24 interactions];

    uint64_t v22 = (void *)v25;
  }
  else
  {
    uint64_t v22 = v27;
  }
  id v28 = v22;
  id v26 = [v22 interactionWithGestureForName:v18];
  objc_msgSend(v26, "_performGestureType:state:location:locationOfFirstTouch:forTouchType:", a3, a4, a7, v12, v11, x, y);
}

- (void)_createFeedbackIfNecessary
{
  if (!self->_feedbackBehaviour)
  {
    int64_t v3 = [[_UIStatesFeedbackGenerator alloc] initWithStyle:0];
    feedbackBehaviour = self->_feedbackBehaviour;
    self->_feedbackBehaviour = v3;
  }
}

- (void)_prepareFeedbackForGesture
{
  int64_t v3 = [(UITextInteraction *)self feedbackBehaviour];
  char v4 = [v3 isActive];

  if ((v4 & 1) == 0)
  {
    id v5 = [(UITextInteraction *)self feedbackBehaviour];
    [v5 activateWithCompletionBlock:0];
  }
}

- (void)_cleanUpFeedbackForGesture
{
  int64_t v3 = [(UITextInteraction *)self feedbackBehaviour];
  int v4 = [v3 isActive];

  if (v4)
  {
    id v5 = [(UITextInteraction *)self feedbackBehaviour];
    [v5 deactivate];
  }
}

- (void)_playFeedbackForCursorMovement
{
  id v2 = [(UITextInteraction *)self feedbackBehaviour];
  [v2 transitionToState:@"preview" ended:1];
}

- (id)linkInteractionSession
{
  return objc_getAssociatedObject(self, &_MergedGlobals_1265);
}

- (BOOL)_shouldObscureTextInput
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  if (objc_opt_respondsToSelector()) {
    int v3 = [WeakRetained displaySecureTextUsingPlainText] ^ 1;
  }
  else {
    int v3 = 1;
  }
  id v4 = WeakRetained;
  if (objc_opt_respondsToSelector()) {
    int v5 = [v4 isSecureTextEntry] & v3;
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)_textInputIsInteractive
{
  int v3 = [(UITextInteraction *)self _textInput];
  id v4 = v3;
  if (v3)
  {
    if (self->_viewOverridesInteractivityState) {
      char v5 = [v3 _isInteractiveDespiteResponderStatus];
    }
    else {
      char v5 = [v3 isFirstResponder];
    }
    BOOL v6 = v5;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_textInputLivesInKeyWindow
{
  id v2 = [(UITextInteraction *)self _textInput];
  int v3 = [v2 _responderWindow];

  if ([v3 _isTextEffectsWindow]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 _isApplicationKeyWindow];
  }

  return v4;
}

- (void)_performPreemtiveLayoutToEnsureNoMoreLayoutWhileSelecting:(id)a3
{
  id v3 = (id)objc_msgSend(a3, "closestPositionToPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
}

- (BOOL)containerChangesSelectionOnOneFingerTap
{
  id v2 = [(UITextInteraction *)self _textInput];
  BOOL v3 = (objc_opt_respondsToSelector() & 1) == 0
    || ([v2 isEditing] & 1) != 0
    || ![v2 hasText]
    || (unint64_t)([v2 clearingBehavior] - 4) < 0xFFFFFFFFFFFFFFFELL;

  return v3;
}

- (void)disableClearsOnInsertion
{
  p_view = &self->_view;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)p_view);
    [v5 setClearingBehavior:0];
  }
}

- (BOOL)selection:(id)a3 containsPoint:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = [v7 selectedRange];
  int v9 = [v8 _isRanged];

  if (!v9)
  {
LABEL_18:
    BOOL v23 = 0;
    goto LABEL_20;
  }
  p_view = &self->_view;
  id WeakRetained = objc_loadWeakRetained((id *)p_view);
  char v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) == 0)
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v24 = objc_msgSend(v7, "selectionRects", 0);
    uint64_t v25 = [v24 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v37;
      while (2)
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v37 != v27) {
            objc_enumerationMutation(v24);
          }
          [*(id *)(*((void *)&v36 + 1) + 8 * i) rect];
          double v33 = (44.0 - v31) * 0.5;
          if (v33 < 0.0) {
            double v33 = 0.0;
          }
          if ((44.0 - v32) * 0.5 >= 0.0) {
            double v34 = (44.0 - v32) * 0.5;
          }
          else {
            double v34 = 0.0;
          }
          CGRect v45 = CGRectInset(*(CGRect *)&v29, -v33, -v34);
          v43.CGFloat x = x;
          v43.CGFloat y = y;
          if (CGRectContainsPoint(v45, v43))
          {

            BOOL v23 = 1;
            goto LABEL_20;
          }
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v36 objects:v40 count:16];
        if (v26) {
          continue;
        }
        break;
      }
    }

    goto LABEL_18;
  }
  id v13 = objc_loadWeakRetained((id *)p_view);
  long long v14 = [v7 selectedRange];
  [v13 _boundingRectForRange:v14];
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;

  v44.origin.CGFloat x = v16;
  v44.origin.CGFloat y = v18;
  v44.size.width = v20;
  v44.size.height = v22;
  v42.CGFloat x = x;
  v42.CGFloat y = y;
  BOOL v23 = CGRectContainsPoint(v44, v42);
LABEL_20:

  return v23;
}

- (BOOL)currentSelectionContainsPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = self;
  BOOL v6 = [(UITextInteraction *)self assistantDelegate];
  id v7 = [v6 activeSelection];
  LOBYTE(v5) = -[UITextInteraction selection:containsPoint:](v5, "selection:containsPoint:", v7, x, y);

  return (char)v5;
}

- (id)rangeWithTextAlternatives:(id *)a3 atPosition:(id)a4
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  if (objc_opt_respondsToSelector())
  {
    id v8 = [WeakRetained rangeWithTextAlternatives:a3 atPosition:v6];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (double)distanceBetweenPoint:(CGPoint)a3 andRects:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    double v10 = 3.40282347e38;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * i) rect];
        UIDistanceBetweenPointAndRect(x, y, v12, v13, v14, v15);
        if (v10 > v16) {
          double v10 = v16;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }
  else
  {
    double v10 = 3.40282347e38;
  }

  return v10;
}

- (BOOL)shouldHandleFormGestureAtLocation:(CGPoint)a3
{
  CGPoint v11 = a3;
  if (!WebKitFramework) {
    return 1;
  }
  p_view = &self->_view;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_opt_class();
  isKindOfClass Class = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    return 1;
  }
  id v6 = objc_loadWeakRetained((id *)p_view);
  uint64_t v7 = objc_msgSend(v6, "formElement", *(void *)&v11.x, *(void *)&v11.y);
  if (v7)
  {
    WebThreadLock();
    uint64_t v8 = [v6 approximateNodeAtViewportLocation:&v11];
    char v9 = [v7 isSameNode:v8];
  }
  else
  {
    char v9 = 1;
  }

  return v9;
}

- (id)defaultTripleTapRecognizerWithAction:(SEL)a3
{
  BOOL v3 = [[UITextTapRecognizer alloc] initWithTarget:self action:a3];
  [(UITapGestureRecognizer *)v3 setAllowableMovement:60.0];
  [(UITapGestureRecognizer *)v3 setNumberOfTapsRequired:3];
  [(UITapGestureRecognizer *)v3 setNumberOfTouchesRequired:1];
  [(UIGestureRecognizer *)v3 setDelaysTouchesEnded:0];
  return v3;
}

- (BOOL)interaction_gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = [v4 view];
  [v4 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  LOBYTE(self) = -[UITextInteraction shouldHandleFormGestureAtLocation:](self, "shouldHandleFormGestureAtLocation:", v7, v9);
  return (char)self;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = [(UITextInteraction *)self delegate];
  double v6 = [(UITextInteraction *)self assistantDelegate];
  if (objc_opt_respondsToSelector())
  {
    double v7 = [v4 view];
    [v4 locationInView:v7];
    double v9 = v8;
    double v11 = v10;

    if ((objc_msgSend(v5, "interactionShouldBegin:atPoint:", self, v9, v11) & 1) == 0)
    {
LABEL_10:
      BOOL v12 = 0;
      goto LABEL_11;
    }
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0 && ![v5 interactionShouldBegin:self])
  {
    goto LABEL_10;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ![v6 overrideGestureRecognizerShouldBegin:v4]
    || ![(UITextInteraction *)self interaction_gestureRecognizerShouldBegin:v4])
  {
    goto LABEL_10;
  }
  [(UITextInteraction *)self updateTextInputSourceForScribbleGesture:v4];
  BOOL v12 = 1;
LABEL_11:

  return v12;
}

- (void)updateTextInputSourceForScribbleGesture:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    long long v32 = 0uLL;
    long long v33 = 0uLL;
    long long v30 = 0uLL;
    long long v31 = 0uLL;
    id v5 = [v4 touchesForTap];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v30 objects:v40 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v31;
LABEL_4:
      uint64_t v8 = 0;
      while (1)
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(v5);
        }
        double v9 = *(void **)(*((void *)&v30 + 1) + 8 * v8);
        if ([v9 type] == 2) {
          goto LABEL_20;
        }
        if (v6 == ++v8)
        {
          uint64_t v6 = [v5 countByEnumeratingWithState:&v30 objects:v40 count:16];
          if (v6) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
LABEL_19:

    id v13 = 0;
LABEL_27:
    uint64_t v23 = +[UIKeyboardImpl sharedInstance];
    [v23 updateTextInputKeyboardSource];
    goto LABEL_28;
  }
  long long v28 = 0uLL;
  long long v29 = 0uLL;
  long long v26 = 0uLL;
  long long v27 = 0uLL;
  id v5 = [v4 _allActiveTouches];
  uint64_t v10 = [v5 countByEnumeratingWithState:&v26 objects:v39 count:16];
  if (!v10) {
    goto LABEL_19;
  }
  uint64_t v11 = *(void *)v27;
LABEL_13:
  uint64_t v12 = 0;
  while (1)
  {
    if (*(void *)v27 != v11) {
      objc_enumerationMutation(v5);
    }
    double v9 = *(void **)(*((void *)&v26 + 1) + 8 * v12);
    if ([v9 type] == 2) {
      break;
    }
    if (v10 == ++v12)
    {
      uint64_t v10 = [v5 countByEnumeratingWithState:&v26 objects:v39 count:16];
      if (v10) {
        goto LABEL_13;
      }
      goto LABEL_19;
    }
  }
LABEL_20:
  id v13 = v9;

  if (!v13) {
    goto LABEL_27;
  }
  CGFloat v14 = [v4 view];
  [v13 locationInView:v14];
  double v16 = v15;
  double v18 = v17;

  id v19 = [(UITextInteraction *)self view];
  uint64_t v35 = 0;
  long long v36 = &v35;
  uint64_t v37 = 0x2020000000;
  long long v20 = (void (*)(id))off_1EB2647D0;
  long long v38 = off_1EB2647D0;
  if (!off_1EB2647D0)
  {
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __getPKScribbleInteractionInViewSymbolLoc_block_invoke;
    v34[3] = &unk_1E52D9900;
    v34[4] = &v35;
    __getPKScribbleInteractionInViewSymbolLoc_block_invoke(v34);
    long long v20 = (void (*)(id))v36[3];
  }
  _Block_object_dispose(&v35, 8);
  if (!v20)
  {
    id v24 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v25 = [NSString stringWithUTF8String:"id<PKScribbleInteractionWrapper> getPKScribbleInteractionInView(UIView *__strong)"];
    objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, @"UITextInteraction.m", 59, @"%s", dlerror());

    __break(1u);
  }
  long long v21 = v20(v19);

  if (v21)
  {
    int v22 = objc_msgSend(v21, "shouldBeginAtLocation:", v16, v18);

    if (!v22) {
      goto LABEL_27;
    }
  }
  uint64_t v23 = +[UIKeyboardImpl sharedInstance];
  [v23 _updateTextInputPencilSource];
LABEL_28:
}

+ (double)_maximumBeamSnappingLength
{
  id v2 = +[_UIPointerSettingsDomain rootSettings];
  BOOL v3 = [v2 beamSettings];

  [v3 maxSnapLength];
  double v5 = v4;

  return v5;
}

- (BOOL)_shouldAllowEnforcedTouchTypeForTouch:(id)a3 forGestureRecognizer:(id)a4
{
  return 1;
}

- (void)_beginSelectionChange
{
  id v5 = [(UITextInteraction *)self view];
  if (([v5 _conformsToProtocolUIAsyncTextInputClient] & 1) == 0)
  {
    BOOL v3 = [(UITextInteraction *)self view];
    char v4 = [v3 _conformsToProtocolBETextInput];

    if (v4) {
      return;
    }
    id v5 = [(UITextInteraction *)self view];
    [v5 beginSelectionChange];
  }
}

- (void)_endSelectionChange
{
  id v5 = [(UITextInteraction *)self view];
  if (([v5 _conformsToProtocolUIAsyncTextInputClient] & 1) == 0)
  {
    BOOL v3 = [(UITextInteraction *)self view];
    char v4 = [v3 _conformsToProtocolBETextInput];

    if (v4) {
      return;
    }
    id v5 = [(UITextInteraction *)self view];
    [v5 endSelectionChange];
  }
}

- (BOOL)interaction_gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(UITextInteraction *)self assistantDelegate];
  uint64_t v7 = [(UITextInteraction *)self view];
  uint64_t v8 = [v5 view];

  if (WebKitFramework && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (v8 == v7) {
      char v9 = 1;
    }
    else {
      char v9 = [v7 _hasSubviewContainingWebContent:v8];
    }
  }
  else
  {
    id v10 = v7;
    uint64_t v11 = [(UITextInteraction *)self root];
    uint64_t v12 = [v11 textInput];

    id v13 = v10;
    if (v12)
    {
      CGFloat v14 = [(UITextInteraction *)self root];
      double v15 = [v14 textInput];
      id v13 = [v15 textInputView];
    }
    if ([v10 isEqual:v8] & 1) != 0 || (objc_msgSend(v13, "isDescendantOfView:", v8))
    {
      char v9 = 1;
    }
    else
    {
      double v16 = [v6 _legacySelectionView];
      double v17 = [v16 rangeView];
      if (v17 == v8)
      {
        char v9 = 1;
      }
      else
      {
        double v18 = [v6 _selectionViewManager];
        if ([v18 _isManagedSelectionSubview:v8])
        {
          char v9 = 1;
        }
        else if (_UITextViewAllowSelectionContainerInTextLayoutCanvas() {
               && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        }
        {
          id v19 = [v10 selectionContainerView];
          char v9 = v19 == v8;
        }
        else
        {
          char v9 = 0;
        }
      }
    }
  }
  return v9;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 _isPointerTouch];
  char v9 = [(UITextInteraction *)self assistantDelegate];
  [v9 setAutomaticSelectionCommandsSuppressedForPointerTouchType:v8];

  id v10 = [(UITextInteraction *)self assistantDelegate];
  LODWORD(v9) = [v10 supportsIndirectInteractions];

  if (v9
    && ![(UITextInteraction *)self _shouldAllowEnforcedTouchTypeForTouch:v7 forGestureRecognizer:v6])
  {
    BOOL v13 = 0;
  }
  else
  {
    uint64_t v11 = [(UITextInteraction *)self assistantDelegate];
    if (objc_opt_respondsToSelector()) {
      char v12 = [v11 overrideGestureRecognizer:v6 shouldReceiveTouch:v7];
    }
    else {
      char v12 = [(UITextInteraction *)self interaction_gestureRecognizer:v6 shouldReceiveTouch:v7];
    }
    BOOL v13 = v12;
  }
  return v13;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v5 = a3;
  id v6 = [a4 _pairedGestureIdentifiersAndCreate:0];
  if (v6)
  {
    id v7 = [v5 _pairedGestureIdentifiersAndCreate:0];
    char v8 = [v7 intersectsSet:v6];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)_updatedAccessibilityTextMenuWithMenuElements:(id)a3
{
  return 0;
}

- (void)_presentTextEditMenuWithOverrideMenu:(id)a3
{
  id v4 = a3;
  id v6 = [(UITextInteraction *)self assistantDelegate];
  id v5 = [v6 _editMenuAssistant];
  [v5 _presentEditMenuWithPreferredDirection:0 overrideMenu:v4];
}

- (NSArray)children
{
  return &self->_children->super;
}

- (NSArray)gestures
{
  return &self->_gestures->super;
}

- (NSDictionary)gestureMap
{
  return &self->_gestureMap->super;
}

- (UILongPressGestureRecognizer)_customHighlighterGesture
{
  return self->_customHighlighterGesture;
}

- (void)set_customHighlighterGesture:(id)a3
{
}

- (BOOL)_allowsSelectionCommands
{
  return self->_allowsSelectionCommands;
}

- (void)_setAllowsSelectionCommands:(BOOL)a3
{
  self->_allowsSelectionCommands = a3;
}

- (_UIStatesFeedbackGenerator)feedbackBehaviour
{
  return self->_feedbackBehaviour;
}

- (void)setFeedbackBehaviour:(id)a3
{
}

- (void)setView:(id)a3
{
}

- (UITextInteractionInputDelegate)interactionInputDelegate
{
  return self->_interactionInputDelegate;
}

- (void)setInteractionInputDelegate:(id)a3
{
}

@end