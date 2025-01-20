@interface UIKBAnalyticsDispatcher
+ (id)allowedValuesForTextEditingPreferredFieldName:(id)a3;
+ (id)allowedValuesForType:(id)a3;
+ (id)currentInputMode;
+ (id)preferredEventName:(id)a3;
+ (id)sharedInstance;
+ (void)analyticsDispatchEventTextEditingOperation:(id)a3 trigger:(id)a4;
+ (void)candidateViewExtended:(id)a3 direction:(id)a4;
+ (void)decrementAllowCursorMovementCount;
+ (void)didCandidateReplacement;
+ (void)didCandidateReplacementWithRemovedText:(id)a3 insertedText:(id)a4;
+ (void)didDeleteBackwardText:(id)a3;
+ (void)didInsertText:(id)a3 relativeRangeBefore:(_NSRange)a4 selectedTextBefore:(id)a5 withLanguage:(id)a6;
+ (void)didRevisionBubbleTap;
+ (void)dispatchFloatingKeyboardEventOfType:(id)a3 trigger:(id)a4 pinnedToEdge:(id)a5 position:(CGPoint)a6 touchUpPosition:(CGPoint)a7;
+ (void)emojiInsertedByMethod:(id)a3 inputType:(id)a4;
+ (void)emojiPopoverSummoned:(id)a3 appendsEmoji:(BOOL)a4;
+ (void)floatingKeyboardMoved:(id)a3 toPosition:(CGPoint)a4 touchPosition:(CGPoint)a5;
+ (void)floatingKeyboardSummonedEvent:(id)a3 trigger:(id)a4 finalPosition:(CGPoint)a5;
+ (void)globeKeyEducationShown:(double)a3;
+ (void)globeKeyLongPress;
+ (void)handwritingResized:(id)a3;
+ (void)hapticEventEngineDuration:(double)a3 startCount:(unint64_t)a4 actionCount:(unint64_t)a5;
+ (void)incrementAllowCursorMovementCount;
+ (void)keyboardAnalyticsDispatchWithSelector:(SEL)a3 withTrigger:(id)a4;
+ (void)keyboardCameraSessionEndedForTextContentType:(id)a3 didFindText:(BOOL)a4 didInsertText:(BOOL)a5 sender:(id)a6;
+ (void)keyboardShortcutInvokedWithKeyCommand:(id)a3 keyEvent:(id)a4 keyboardProperties:(id)a5;
+ (void)sessionAnalyticsEnded:(id)a3;
+ (void)setKeyboardTrialParameters:(id)a3;
- (BOOL)analyticsSkipDidKeyPress;
- (NSString)glomojiTitle;
- (NSString)nextCandidateReplacementInsertedText;
- (NSString)nextCandidateReplacementPostCandidateInsertedText;
- (NSString)nextCandidateReplacementRemovedText;
- (NSString)updatedInputMode;
- (UIKBAnalyticsDispatcher)init;
- (unint64_t)nextCandidateReplacementSource;
- (void)resetCandidateReplacementVariables;
- (void)setAnalyticsSkipDidKeyPress:(BOOL)a3;
- (void)setGlomojiTitle:(id)a3;
- (void)setNextCandidateReplacementInsertedText:(id)a3;
- (void)setNextCandidateReplacementPostCandidateInsertedText:(id)a3;
- (void)setNextCandidateReplacementRemovedText:(id)a3;
- (void)setNextCandidateReplacementSource:(unint64_t)a3;
- (void)setUpdatedInputMode:(id)a3;
@end

@implementation UIKBAnalyticsDispatcher

- (UIKBAnalyticsDispatcher)init
{
  v5.receiver = self;
  v5.super_class = (Class)UIKBAnalyticsDispatcher;
  v2 = [(UIKBAnalyticsDispatcher *)&v5 init];
  v3 = v2;
  if (v2) {
    [(UIKBAnalyticsDispatcher *)v2 resetCandidateReplacementVariables];
  }
  return v3;
}

+ (id)sharedInstance
{
  if (qword_1EB25F4D0 != -1) {
    dispatch_once(&qword_1EB25F4D0, &__block_literal_global_102);
  }
  v2 = (void *)_MergedGlobals_988;
  return v2;
}

void __41__UIKBAnalyticsDispatcher_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(UIKBAnalyticsDispatcher);
  v1 = (void *)_MergedGlobals_988;
  _MergedGlobals_988 = (uint64_t)v0;
}

- (void)resetCandidateReplacementVariables
{
  nextCandidateReplacementRemovedText = self->_nextCandidateReplacementRemovedText;
  self->_nextCandidateReplacementRemovedText = 0;

  nextCandidateReplacementInsertedText = self->_nextCandidateReplacementInsertedText;
  self->_nextCandidateReplacementInsertedText = 0;

  nextCandidateReplacementPostCandidateInsertedText = self->_nextCandidateReplacementPostCandidateInsertedText;
  self->_nextCandidateReplacementPostCandidateInsertedText = 0;

  self->_nextCandidateReplacementSource = 0;
}

+ (id)preferredEventName:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3 && [v3 length])
  {
    objc_super v5 = [NSString stringWithFormat:@"%@.%@", @"UIKBAnalytics", v4];
  }
  else
  {
    objc_super v5 = 0;
  }

  return v5;
}

+ (id)currentInputMode
{
  v2 = +[UIKeyboardInputModeController sharedInputModeController];
  id v3 = [v2 currentInputMode];
  v4 = [v3 identifierWithLayouts];

  return v4;
}

+ (void)setKeyboardTrialParameters:(id)a3
{
  id v3 = a3;
  id v5 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  v4 = [v5 _textInputSessionAnalytics];
  [v4 setKeyboardTrialParameters:v3];
}

+ (id)allowedValuesForTextEditingPreferredFieldName:(id)a3
{
  v10[6] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 isEqualToString:@"Operation"])
  {
    v10[0] = @"Undo";
    v10[1] = @"UndoCancel";
    v10[2] = @"Redo";
    v10[3] = @"Cut";
    v10[4] = @"Copy";
    v10[5] = @"Paste";
    v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = v10;
    uint64_t v6 = 6;
LABEL_5:
    v7 = [v4 arrayWithObjects:v5 count:v6];
    goto LABEL_7;
  }
  if ([v3 isEqualToString:@"TriggerType"])
  {
    v9[0] = @"UndoHUDGesturePan";
    v9[1] = @"UndoHUDGestureDoubleTap";
    v9[2] = @"UndoHUDGestureDoubleTapShortHand";
    v9[3] = @"UndoHUDControl";
    v9[4] = @"UCB";
    v9[5] = @"CalloutBar";
    v9[6] = @"Shake";
    v9[7] = @"SWKeyboard";
    v9[8] = @"HWKeyboard";
    v9[9] = @"EditMenu";
    v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = v9;
    uint64_t v6 = 10;
    goto LABEL_5;
  }
  v7 = 0;
LABEL_7:

  return v7;
}

+ (void)incrementAllowCursorMovementCount
{
  id v3 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  v2 = [v3 _textInputSessionAnalytics];
  [v2 incrementAllowCursorMovementCount];
}

+ (void)decrementAllowCursorMovementCount
{
  id v3 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  v2 = [v3 _textInputSessionAnalytics];
  [v2 decrementAllowCursorMovementCount];
}

+ (void)analyticsDispatchEventTextEditingOperation:(id)a3 trigger:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = UITextInputSessionLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v24 = v6;
    __int16 v25 = 2112;
    id v26 = v7;
    _os_log_debug_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEBUG, "[UIKBAnalyticsDispatcher] analyticsDispatchEventTextEditingOperation:%@ trigger:%@", buf, 0x16u);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__UIKBAnalyticsDispatcher_analyticsDispatchEventTextEditingOperation_trigger___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (analyticsDispatchEventTextEditingOperation_trigger__onceToken != -1) {
    dispatch_once(&analyticsDispatchEventTextEditingOperation_trigger__onceToken, block);
  }
  v9 = [MEMORY[0x1E4FAE260] sharedInstance];
  v10 = [(id)objc_opt_class() preferredEventName:@"TextEditing"];
  v22[0] = v6;
  v22[1] = v7;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  v12 = [(id)objc_opt_class() currentInputMode];
  [v9 dispatchEventWithName:v10 values:v11 inputMode:v12];

  v13 = [MEMORY[0x1E4FA8AA0] sharedInstance];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __78__UIKBAnalyticsDispatcher_analyticsDispatchEventTextEditingOperation_trigger___block_invoke_2;
  v18[3] = &unk_1E52E1960;
  v14 = (__CFString *)v6;
  v19 = v14;
  id v15 = v7;
  id v20 = v15;
  [v13 logBlock:v18 domain:@"com.apple.keyboard.UIKit"];

  if (@"Copy" == v14)
  {
    v16 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    v17 = [v16 _textInputSessionAnalytics];
    [v17 didCopy];
    goto LABEL_15;
  }
  if (@"Cut" == v14)
  {
    v16 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    v17 = [v16 _textInputSessionAnalytics];
    [v17 didCut];
    goto LABEL_15;
  }
  if (@"Paste" == v14)
  {
    v16 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    v17 = [v16 _textInputSessionAnalytics];
    [v17 didPaste];
    goto LABEL_15;
  }
  if (@"Undo" == v14)
  {
    v16 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    v17 = [v16 _textInputSessionAnalytics];
    [v17 didUndo];
    goto LABEL_15;
  }
  if (@"Redo" == v14)
  {
    v16 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    v17 = [v16 _textInputSessionAnalytics];
    [v17 didRedo];
LABEL_15:
  }
}

void __78__UIKBAnalyticsDispatcher_analyticsDispatchEventTextEditingOperation_trigger___block_invoke()
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4FAE250];
  v1 = [(id)objc_opt_class() allowedValuesForTextEditingPreferredFieldName:@"Operation"];
  v2 = [v0 stringFieldSpecWithName:@"Operation" allowedValues:v1];

  id v3 = (void *)MEMORY[0x1E4FAE250];
  v4 = [(id)objc_opt_class() allowedValuesForTextEditingPreferredFieldName:@"TriggerType"];
  id v5 = [v3 stringFieldSpecWithName:@"TriggerType" allowedValues:v4];

  id v6 = (void *)MEMORY[0x1E4FAE248];
  id v7 = [(id)objc_opt_class() preferredEventName:@"TextEditing"];
  v11[0] = v2;
  v11[1] = v5;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  v9 = [v6 eventSpecWithName:v7 inputModeRequired:1 fieldSpecs:v8];

  v10 = [MEMORY[0x1E4FAE260] sharedInstance];
  [v10 registerEventSpec:v9];
}

id __78__UIKBAnalyticsDispatcher_analyticsDispatchEventTextEditingOperation_trigger___block_invoke_2(uint64_t a1)
{
  v6[3] = *MEMORY[0x1E4F143B8];
  v5[0] = @"KeyboardEventType";
  v5[1] = @"Operation";
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v6[0] = @"TextEditing";
  v6[1] = v1;
  v5[2] = @"TriggerType";
  v6[2] = v2;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:3];
  return v3;
}

+ (void)keyboardAnalyticsDispatchWithSelector:(SEL)a3 withTrigger:(id)a4
{
  id v7 = a4;
  id v5 = NSStringFromSelector(a3);
  if ([v5 containsString:@"cut"])
  {
    id v6 = UIKBAnalyticsTextEditingOperationCut;
  }
  else if ([v5 containsString:@"copy"])
  {
    id v6 = UIKBAnalyticsTextEditingOperationCopy;
  }
  else
  {
    if (![v5 containsString:@"paste"]) {
      goto LABEL_8;
    }
    id v6 = UIKBAnalyticsTextEditingOperationPaste;
  }
  +[UIKBAnalyticsDispatcher analyticsDispatchEventTextEditingOperation:*v6 trigger:v7];
LABEL_8:
}

+ (id)allowedValuesForType:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 isEqualToString:@"eventType"])
  {
    v19 = @"Untether";
    id v20 = @"Tether";
    v21 = @"Move";
    v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = &v19;
    uint64_t v6 = 3;
LABEL_8:
    id v7 = objc_msgSend(v4, "arrayWithObjects:count:", v5, v6, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22);
    goto LABEL_9;
  }
  if ([v3 isEqualToString:@"triggerType"])
  {
    v14 = @"Interactive";
    id v15 = @"NonInteractive";
    v16 = @"DockedToBottom";
    v17 = @"PositionedAwayFromEdge";
    v18 = @"PositionedOnEdge";
    v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = &v14;
LABEL_7:
    uint64_t v6 = 5;
    goto LABEL_8;
  }
  if ([v3 isEqualToString:@"screenEdge"])
  {
    v9 = @"NotOnEdge";
    v10 = @"LeftEdge";
    v11 = @"BottomEdge";
    v12 = @"RightEdge";
    v13 = @"TopEdge";
    v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = &v9;
    goto LABEL_7;
  }
  id v7 = 0;
LABEL_9:

  return v7;
}

+ (void)floatingKeyboardSummonedEvent:(id)a3 trigger:(id)a4 finalPosition:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v8 = a4;
  id v9 = a3;
  objc_msgSend((id)objc_opt_class(), "dispatchFloatingKeyboardEventOfType:trigger:pinnedToEdge:position:touchUpPosition:", v9, v8, @"NotOnEdge", x, y, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
}

+ (void)floatingKeyboardMoved:(id)a3 toPosition:(CGPoint)a4 touchPosition:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  double v7 = a4.y;
  double v8 = a4.x;
  id v13 = a3;
  if ([v13 isEqualToString:@"BottomEdge"])
  {
    id v9 = objc_opt_class();
    v10 = @"Tether";
    v11 = UIKBAnalyticsFloatingKeyboardTriggerTypeDocked;
  }
  else
  {
    int v12 = [v13 isEqualToString:@"NotOnEdge"];
    id v9 = objc_opt_class();
    v10 = @"Move";
    v11 = UIKBAnalyticsFloatingKeyboardTriggerTypePositioned;
    if (!v12) {
      v11 = UIKBAnalyticsFloatingKeyboardTriggerTypeSnappedToEdge;
    }
  }
  objc_msgSend(v9, "dispatchFloatingKeyboardEventOfType:trigger:pinnedToEdge:position:touchUpPosition:", v10, *v11, v13, v8, v7, x, y);
}

+ (void)dispatchFloatingKeyboardEventOfType:(id)a3 trigger:(id)a4 pinnedToEdge:(id)a5 position:(CGPoint)a6 touchUpPosition:(CGPoint)a7
{
  double y = a7.y;
  double x = a7.x;
  double v9 = a6.y;
  double v10 = a6.x;
  v42[7] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  v17 = [(id)objc_opt_class() preferredEventName:@"floatingKeyboardUsageEvent"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __109__UIKBAnalyticsDispatcher_dispatchFloatingKeyboardEventOfType_trigger_pinnedToEdge_position_touchUpPosition___block_invoke;
  block[3] = &unk_1E52D9CD0;
  id v40 = v17;
  id v41 = a1;
  uint64_t v18 = dispatchFloatingKeyboardEventOfType_trigger_pinnedToEdge_position_touchUpPosition__onceToken;
  id v19 = v17;
  if (v18 != -1) {
    dispatch_once(&dispatchFloatingKeyboardEventOfType_trigger_pinnedToEdge_position_touchUpPosition__onceToken, block);
  }
  id v20 = [MEMORY[0x1E4FAE260] sharedInstance];
  v42[0] = v14;
  v42[1] = v15;
  v42[2] = v16;
  [NSNumber numberWithDouble:v10];
  v21 = v31 = v14;
  v42[3] = v21;
  uint64_t v22 = [NSNumber numberWithDouble:v9];
  v42[4] = v22;
  v23 = [NSNumber numberWithDouble:x];
  v42[5] = v23;
  id v24 = [NSNumber numberWithDouble:y];
  v42[6] = v24;
  __int16 v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:7];
  id v26 = [(id)objc_opt_class() currentInputMode];
  v32 = v19;
  [v20 dispatchEventWithName:v19 values:v25 inputMode:v26];

  uint64_t v27 = [MEMORY[0x1E4FA8AA0] sharedInstance];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __109__UIKBAnalyticsDispatcher_dispatchFloatingKeyboardEventOfType_trigger_pinnedToEdge_position_touchUpPosition___block_invoke_2;
  v33[3] = &unk_1E52E1988;
  id v34 = v31;
  id v35 = v15;
  id v36 = v16;
  double v37 = v10;
  double v38 = v9;
  id v28 = v16;
  id v29 = v15;
  id v30 = v31;
  [v27 logBlock:v33 domain:@"com.apple.keyboard.UIKit"];
}

void __109__UIKBAnalyticsDispatcher_dispatchFloatingKeyboardEventOfType_trigger_pinnedToEdge_position_touchUpPosition___block_invoke(uint64_t a1)
{
  v20[7] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4FAE250];
  id v3 = [(id)objc_opt_class() allowedValuesForType:@"eventType"];
  v4 = [v2 stringFieldSpecWithName:@"eventType" allowedValues:v3];

  id v5 = (void *)MEMORY[0x1E4FAE250];
  uint64_t v6 = [(id)objc_opt_class() allowedValuesForType:@"triggerType"];
  double v7 = [v5 stringFieldSpecWithName:@"triggerType" allowedValues:v6];

  double v8 = (void *)MEMORY[0x1E4FAE250];
  double v9 = [(id)objc_opt_class() allowedValuesForType:@"screenEdge"];
  double v10 = [v8 stringFieldSpecWithName:@"screenEdge" allowedValues:v9];

  v11 = [MEMORY[0x1E4FAE250] floatFieldSpecWithName:@"originXCoord"];
  int v12 = [MEMORY[0x1E4FAE250] floatFieldSpecWithName:@"originYCoord"];
  id v13 = [MEMORY[0x1E4FAE250] floatFieldSpecWithName:@"touchXCoord"];
  id v14 = [MEMORY[0x1E4FAE250] floatFieldSpecWithName:@"touchYCoord"];
  id v15 = (void *)MEMORY[0x1E4FAE248];
  uint64_t v16 = *(void *)(a1 + 32);
  v20[0] = v4;
  v20[1] = v7;
  v20[2] = v10;
  v20[3] = v11;
  v20[4] = v12;
  v20[5] = v13;
  v20[6] = v14;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:7];
  uint64_t v18 = [v15 eventSpecWithName:v16 inputModeRequired:1 fieldSpecs:v17];

  id v19 = [MEMORY[0x1E4FAE260] sharedInstance];
  [v19 registerEventSpec:v18];
}

id __109__UIKBAnalyticsDispatcher_dispatchFloatingKeyboardEventOfType_trigger_pinnedToEdge_position_touchUpPosition___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = @"FloatingKeyboardUsageEvent";
  v4[0] = @"KeyboardEventType";
  v4[1] = @"eventType";
  long long v6 = *(_OWORD *)(a1 + 32);
  v4[2] = @"triggerType";
  v4[3] = @"screenEdge";
  uint64_t v7 = *(void *)(a1 + 48);
  v4[4] = @"TouchCoordinates";
  uint64_t v1 = NSStringFromCGPoint(*(CGPoint *)(a1 + 56));
  double v8 = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v5 forKeys:v4 count:5];

  return v2;
}

+ (void)candidateViewExtended:(id)a3 direction:(id)a4
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [(id)objc_opt_class() preferredEventName:@"candidateViewExtended"];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __59__UIKBAnalyticsDispatcher_candidateViewExtended_direction___block_invoke;
  uint64_t v16 = &unk_1E52D9F70;
  id v17 = v7;
  uint64_t v8 = candidateViewExtended_direction__onceToken;
  id v9 = v7;
  if (v8 != -1) {
    dispatch_once(&candidateViewExtended_direction__onceToken, &v13);
  }
  double v10 = objc_msgSend(MEMORY[0x1E4FAE260], "sharedInstance", v13, v14, v15, v16);
  v18[0] = v6;
  v18[1] = v5;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  int v12 = [(id)objc_opt_class() currentInputMode];
  [v10 dispatchEventWithName:v9 values:v11 inputMode:v12];
}

void __59__UIKBAnalyticsDispatcher_candidateViewExtended_direction___block_invoke(uint64_t a1)
{
  v15[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4FAE250];
  v15[0] = @"Button";
  v15[1] = @"Gesture";
  v15[2] = @"Automatic";
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:3];
  v4 = [v2 stringFieldSpecWithName:@"EventType" allowedValues:v3];

  id v5 = (void *)MEMORY[0x1E4FAE250];
  v14[0] = @"Close";
  v14[1] = @"Open";
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  uint64_t v7 = [v5 stringFieldSpecWithName:@"Direction" allowedValues:v6];

  uint64_t v8 = (void *)MEMORY[0x1E4FAE248];
  uint64_t v9 = *(void *)(a1 + 32);
  v13[0] = v4;
  v13[1] = v7;
  double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  v11 = [v8 eventSpecWithName:v9 inputModeRequired:1 fieldSpecs:v10];

  int v12 = [MEMORY[0x1E4FAE260] sharedInstance];
  [v12 registerEventSpec:v11];
}

+ (void)didRevisionBubbleTap
{
  id v3 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  uint64_t v2 = [v3 _textInputSessionAnalytics];
  [v2 didRevisionBubbleTap];
}

+ (void)didCandidateReplacement
{
  id v11 = +[UIKBAnalyticsDispatcher sharedInstance];
  uint64_t v2 = [v11 nextCandidateReplacementRemovedText];
  id v3 = [v11 nextCandidateReplacementInsertedText];
  v4 = [v11 nextCandidateReplacementPostCandidateInsertedText];
  if (v3) {
    id v5 = v3;
  }
  else {
    id v5 = &stru_1ED0E84C0;
  }
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = &stru_1ED0E84C0;
  }
  uint64_t v7 = [(__CFString *)v5 stringByAppendingString:v6];
  if (v3) {
    BOOL v8 = v2 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8 && ([v2 isEqualToString:v3] & 1) == 0)
  {
    switch([v11 nextCandidateReplacementSource])
    {
      case 3:
        uint64_t v9 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
        double v10 = [v9 _textInputSessionAnalytics];
        [v10 didAutocorrectReplacementForText:v2 withText:v7];
        goto LABEL_19;
      case 4:
        uint64_t v9 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
        double v10 = [v9 _textInputSessionAnalytics];
        [v10 didAutocorrectTapOnCompletionReplacementForText:v2 withText:v7];
        goto LABEL_19;
      case 5:
        uint64_t v9 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
        double v10 = [v9 _textInputSessionAnalytics];
        [v10 didCandidateBarReplacementForText:v2 withText:v7];
        goto LABEL_19;
      case 6:
        uint64_t v9 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
        double v10 = [v9 _textInputSessionAnalytics];
        [v10 didInlineCompletionReplacementForText:v2 withText:v7];
        goto LABEL_19;
      case 7:
        uint64_t v9 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
        double v10 = [v9 _textInputSessionAnalytics];
        [v10 didInlineCompletionTapOnCompletionReplacementForText:v2 withText:v7];
        goto LABEL_19;
      case 8:
        uint64_t v9 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
        double v10 = [v9 _textInputSessionAnalytics];
        [v10 didRevisionBubbleReplacementForText:v2 withText:v7];
LABEL_19:

        break;
      default:
        break;
    }
  }
  [v11 resetCandidateReplacementVariables];
}

+ (void)didCandidateReplacementWithRemovedText:(id)a3 insertedText:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = +[UIKBAnalyticsDispatcher sharedInstance];
  [v7 setNextCandidateReplacementRemovedText:v6];

  BOOL v8 = +[UIKBAnalyticsDispatcher sharedInstance];
  [v8 setNextCandidateReplacementInsertedText:v5];

  +[UIKBAnalyticsDispatcher didCandidateReplacement];
}

+ (void)globeKeyEducationShown:(double)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
  id v5 = (void *)qword_1EB25F4D8;
  qword_1EB25F4D8 = v4;

  id v6 = [(id)objc_opt_class() preferredEventName:@"globeKeyEducationShown"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__UIKBAnalyticsDispatcher_globeKeyEducationShown___block_invoke;
  block[3] = &unk_1E52D9F70;
  id v14 = v6;
  uint64_t v7 = qword_1EB25F4E0;
  id v8 = v6;
  if (v7 != -1) {
    dispatch_once(&qword_1EB25F4E0, block);
  }
  uint64_t v9 = [MEMORY[0x1E4FAE260] sharedInstance];
  double v10 = [NSNumber numberWithDouble:a3];
  v15[0] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  int v12 = [(id)objc_opt_class() currentInputMode];
  [v9 dispatchEventWithName:v8 values:v11 inputMode:v12];
}

void __50__UIKBAnalyticsDispatcher_globeKeyEducationShown___block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4FAE250] floatFieldSpecWithName:@"Duration"];
  id v3 = (void *)MEMORY[0x1E4FAE248];
  uint64_t v4 = *(void *)(a1 + 32);
  v8[0] = v2;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  id v6 = [v3 eventSpecWithName:v4 inputModeRequired:1 fieldSpecs:v5];

  uint64_t v7 = [MEMORY[0x1E4FAE260] sharedInstance];
  [v7 registerEventSpec:v6];
}

+ (void)globeKeyLongPress
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if (qword_1EB25F4D8)
  {
    uint64_t v2 = [MEMORY[0x1E4F1C9C8] date];
    [v2 timeIntervalSinceDate:qword_1EB25F4D8];
    double v4 = v3;

    BOOL v5 = v4 < 5.0;
  }
  else
  {
    BOOL v5 = 0;
  }
  id v6 = [(id)objc_opt_class() preferredEventName:@"globeKeyLongPress"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__UIKBAnalyticsDispatcher_globeKeyLongPress__block_invoke;
  block[3] = &unk_1E52D9F70;
  id v14 = v6;
  uint64_t v7 = qword_1EB25F4E8;
  id v8 = v6;
  if (v7 != -1) {
    dispatch_once(&qword_1EB25F4E8, block);
  }
  uint64_t v9 = [MEMORY[0x1E4FAE260] sharedInstance];
  double v10 = [NSNumber numberWithBool:v5];
  v15[0] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  int v12 = [(id)objc_opt_class() currentInputMode];
  [v9 dispatchEventWithName:v8 values:v11 inputMode:v12];
}

void __44__UIKBAnalyticsDispatcher_globeKeyLongPress__block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4FAE250] BOOLeanFieldSpecWithName:@"AfterEducation"];
  double v3 = (void *)MEMORY[0x1E4FAE248];
  uint64_t v4 = *(void *)(a1 + 32);
  v8[0] = v2;
  BOOL v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  id v6 = [v3 eventSpecWithName:v4 inputModeRequired:1 fieldSpecs:v5];

  uint64_t v7 = [MEMORY[0x1E4FAE260] sharedInstance];
  [v7 registerEventSpec:v6];
}

+ (void)handwritingResized:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [(id)objc_opt_class() preferredEventName:@"handwritingResized"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__UIKBAnalyticsDispatcher_handwritingResized___block_invoke;
  block[3] = &unk_1E52D9F70;
  id v11 = v4;
  uint64_t v5 = handwritingResized__onceToken;
  id v6 = v4;
  if (v5 != -1) {
    dispatch_once(&handwritingResized__onceToken, block);
  }
  uint64_t v7 = [MEMORY[0x1E4FAE260] sharedInstance];
  v12[0] = v3;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  uint64_t v9 = [(id)objc_opt_class() currentInputMode];
  [v7 dispatchEventWithName:v6 values:v8 inputMode:v9];
}

void __46__UIKBAnalyticsDispatcher_handwritingResized___block_invoke(uint64_t a1)
{
  v11[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4FAE250];
  v11[0] = @"Close";
  v11[1] = @"Open";
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  uint64_t v4 = [v2 stringFieldSpecWithName:@"Direction" allowedValues:v3];

  uint64_t v5 = (void *)MEMORY[0x1E4FAE248];
  uint64_t v6 = *(void *)(a1 + 32);
  double v10 = v4;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
  id v8 = [v5 eventSpecWithName:v6 inputModeRequired:1 fieldSpecs:v7];

  uint64_t v9 = [MEMORY[0x1E4FAE260] sharedInstance];
  [v9 registerEventSpec:v8];
}

+ (void)sessionAnalyticsEnded:(id)a3
{
  id v3 = a3;
  uint64_t v4 = @"TextInputSession";
  uint64_t v5 = @"TextInputSessionUpdate";
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__UIKBAnalyticsDispatcher_sessionAnalyticsEnded___block_invoke;
  block[3] = &unk_1E52DCB30;
  id v29 = v3;
  uint64_t v6 = v4;
  id v30 = v6;
  uint64_t v7 = v5;
  v31 = v7;
  uint64_t v8 = sessionAnalyticsEnded__onceToken[0];
  id v9 = v3;
  if (v8 != -1) {
    dispatch_once(sessionAnalyticsEnded__onceToken, block);
  }
  double v10 = [(id)objc_opt_class() currentInputMode];
  id v11 = [v9 sessionIdentifier];
  uint64_t v12 = [v11 UUIDString];
  uint64_t v13 = (void *)v12;
  id v14 = @"<nil>";
  if (v12) {
    id v14 = (__CFString *)v12;
  }
  id v15 = v14;

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __49__UIKBAnalyticsDispatcher_sessionAnalyticsEnded___block_invoke_69;
  v24[3] = &unk_1E52E19B0;
  __int16 v25 = v6;
  uint64_t v16 = v15;
  id v26 = v16;
  id v17 = v10;
  id v27 = v17;
  [v9 enumerateAnalytics:v24];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __49__UIKBAnalyticsDispatcher_sessionAnalyticsEnded___block_invoke_2;
  v20[3] = &unk_1E52E19B0;
  v21 = v7;
  uint64_t v22 = v16;
  id v23 = v17;
  id v18 = v17;
  id v19 = v16;
  [v9 enumerateSeparateCycleAnalytics:v20];
}

void __49__UIKBAnalyticsDispatcher_sessionAnalyticsEnded___block_invoke(uint64_t a1)
{
  v21[4] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:@"Identifier"];
  id v3 = (void *)MEMORY[0x1E4FAE250];
  uint64_t v4 = [*(id *)(a1 + 32) allAccumulatorNames];
  uint64_t v5 = [v3 stringFieldSpecWithName:@"SessionAction" allowedValues:v4];

  uint64_t v6 = (void *)MEMORY[0x1E4FAE250];
  uint64_t v7 = +[UITextInputSessionActionAnalytics allowedValuesForTextInputSource];
  uint64_t v8 = [v6 stringFieldSpecWithName:@"InputSource" allowedValues:v7];

  id v9 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"Value" minValue:&unk_1ED3F3828 maxValue:0 significantDigits:&unk_1ED3F3840];
  double v10 = (void *)MEMORY[0x1E4FAE248];
  uint64_t v11 = *(void *)(a1 + 40);
  v21[0] = v2;
  v21[1] = v5;
  v21[2] = v8;
  v21[3] = v9;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:4];
  uint64_t v13 = [v10 eventSpecWithName:v11 inputModeRequired:1 fieldSpecs:v12];

  id v14 = [MEMORY[0x1E4FAE260] sharedInstance];
  [v14 registerEventSpec:v13];

  id v15 = (void *)MEMORY[0x1E4FAE248];
  uint64_t v16 = *(void *)(a1 + 48);
  v20[0] = v2;
  v20[1] = v5;
  v20[2] = v8;
  v20[3] = v9;
  id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:4];
  id v18 = [v15 eventSpecWithName:v16 inputModeRequired:1 fieldSpecs:v17];

  id v19 = [MEMORY[0x1E4FAE260] sharedInstance];
  [v19 registerEventSpec:v18];
}

void __49__UIKBAnalyticsDispatcher_sessionAnalyticsEnded___block_invoke_69(void *a1, void *a2, uint64_t a3)
{
  v14[4] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"SessionAction"];
  uint64_t v7 = [v5 objectForKeyedSubscript:@"InputSource"];

  uint64_t v8 = (void *)MEMORY[0x1E4FAE268];
  id v9 = [NSNumber numberWithUnsignedInteger:a3];
  double v10 = [v8 roundNumber:v9 toSignificantDigits:&unk_1ED3F3840];

  uint64_t v11 = [MEMORY[0x1E4FAE260] sharedInstance];
  uint64_t v12 = a1[4];
  v14[0] = a1[5];
  v14[1] = v6;
  void v14[2] = v7;
  v14[3] = v10;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:4];
  [v11 dispatchEventWithName:v12 values:v13 inputMode:a1[6]];
}

void __49__UIKBAnalyticsDispatcher_sessionAnalyticsEnded___block_invoke_2(void *a1, void *a2, uint64_t a3)
{
  v14[4] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"SessionAction"];
  uint64_t v7 = [v5 objectForKeyedSubscript:@"InputSource"];

  if (([v7 isEqualToString:@"Dictation"] & 1) != 0
    || ([v6 isEqualToString:@"Insertion"] & 1) == 0)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4FAE268];
    id v9 = [NSNumber numberWithUnsignedInteger:a3];
    double v10 = [v8 roundNumber:v9 toSignificantDigits:&unk_1ED3F3840];

    uint64_t v11 = [MEMORY[0x1E4FAE260] sharedInstance];
    uint64_t v12 = a1[4];
    v14[0] = a1[5];
    v14[1] = v6;
    void v14[2] = v7;
    v14[3] = v10;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:4];
    [v11 dispatchEventWithName:v12 values:v13 inputMode:a1[6]];
  }
}

+ (void)didInsertText:(id)a3 relativeRangeBefore:(_NSRange)a4 selectedTextBefore:(id)a5 withLanguage:(id)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v14 = a3;
  id v10 = a5;
  id v11 = a6;
  if (!+[UIKeyboard inputUIOOP]
    || +[UIKeyboard isKeyboardProcess])
  {
    uint64_t v12 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    uint64_t v13 = [v12 _textInputSessionAnalytics];
    objc_msgSend(v13, "didInsertText:relativeRangeBefore:selectedTextBefore:withLanguage:", v14, location, length, v10, v11);
  }
}

+ (void)didDeleteBackwardText:(id)a3
{
  id v5 = a3;
  if (!+[UIKeyboard inputUIOOP]
    || +[UIKeyboard isKeyboardProcess])
  {
    id v3 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    uint64_t v4 = [v3 _textInputSessionAnalytics];
    [v4 didDeleteBackwardText:v5];
  }
}

+ (void)emojiPopoverSummoned:(id)a3 appendsEmoji:(BOOL)a4
{
  BOOL v4 = a4;
  v18[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [(id)objc_opt_class() preferredEventName:@"emojiPopoverSummoned"];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __61__UIKBAnalyticsDispatcher_emojiPopoverSummoned_appendsEmoji___block_invoke;
  uint64_t v16 = &unk_1E52D9F70;
  id v17 = v6;
  uint64_t v7 = emojiPopoverSummoned_appendsEmoji__onceToken;
  id v8 = v6;
  if (v7 != -1) {
    dispatch_once(&emojiPopoverSummoned_appendsEmoji__onceToken, &v13);
  }
  id v9 = objc_msgSend(MEMORY[0x1E4FAE260], "sharedInstance", v13, v14, v15, v16);
  v18[0] = v5;
  id v10 = [NSNumber numberWithBool:v4];
  v18[1] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  uint64_t v12 = [(id)objc_opt_class() currentInputMode];
  [v9 dispatchEventWithName:v8 values:v11 inputMode:v12];
}

void __61__UIKBAnalyticsDispatcher_emojiPopoverSummoned_appendsEmoji___block_invoke(uint64_t a1)
{
  v12[4] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4FAE250];
  v12[0] = @"ucb";
  v12[1] = @"keyboardShortcut";
  void v12[2] = @"globeKey";
  v12[3] = @"other";
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:4];
  BOOL v4 = [v2 stringFieldSpecWithName:@"triggerType" allowedValues:v3];

  id v5 = [MEMORY[0x1E4FAE250] BOOLeanFieldSpecWithName:@"appendsEmoji"];
  uint64_t v6 = (void *)MEMORY[0x1E4FAE248];
  uint64_t v7 = *(void *)(a1 + 32);
  v11[0] = v4;
  v11[1] = v5;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  id v9 = [v6 eventSpecWithName:v7 inputModeRequired:1 fieldSpecs:v8];

  id v10 = [MEMORY[0x1E4FAE260] sharedInstance];
  [v10 registerEventSpec:v9];
}

+ (void)emojiInsertedByMethod:(id)a3 inputType:(id)a4
{
  v16[3] = *MEMORY[0x1E4F143B8];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__UIKBAnalyticsDispatcher_emojiInsertedByMethod_inputType___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  uint64_t v5 = emojiInsertedByMethod_inputType__onceToken;
  id v6 = a4;
  id v7 = a3;
  if (v5 != -1) {
    dispatch_once(&emojiInsertedByMethod_inputType__onceToken, block);
  }
  id v8 = +[UIKeyboardImpl activeInstance];
  uint64_t v9 = [v8 hardwareKeyboardAttached];

  id v10 = [MEMORY[0x1E4FAE260] sharedInstance];
  id v11 = [(id)objc_opt_class() preferredEventName:@"emojiInserted"];
  v16[0] = v7;
  v16[1] = v6;
  uint64_t v12 = [NSNumber numberWithBool:v9];
  v16[2] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:3];

  uint64_t v14 = [(id)objc_opt_class() currentInputMode];
  [v10 dispatchEventWithName:v11 values:v13 inputMode:v14];
}

void __59__UIKBAnalyticsDispatcher_emojiInsertedByMethod_inputType___block_invoke()
{
  v14[4] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4FAE250];
  v14[0] = @"ReturnKey";
  v14[1] = @"SearchResult";
  void v14[2] = @"SpaceBar";
  v14[3] = @"Touch";
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:4];
  uint64_t v2 = [v0 stringFieldSpecWithName:@"selectionMethod" allowedValues:v1];

  id v3 = (void *)MEMORY[0x1E4FAE250];
  v13[0] = @"Keyboard";
  v13[1] = @"Popover";
  void v13[2] = @"PopoverSearch";
  v13[3] = @"PredictionBar";
  v13[4] = @"Search";
  v13[5] = @"SearchFavorites";
  BOOL v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:6];
  uint64_t v5 = [v3 stringFieldSpecWithName:@"inputType" allowedValues:v4];

  id v6 = [MEMORY[0x1E4FAE250] BOOLeanFieldSpecWithName:@"hardwareKeyboardAttached"];
  id v7 = (void *)MEMORY[0x1E4FAE248];
  id v8 = [(id)objc_opt_class() preferredEventName:@"emojiInserted"];
  v12[0] = v2;
  v12[1] = v5;
  void v12[2] = v6;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:3];
  id v10 = [v7 eventSpecWithName:v8 inputModeRequired:1 fieldSpecs:v9];

  id v11 = [MEMORY[0x1E4FAE260] sharedInstance];
  [v11 registerEventSpec:v10];
}

+ (void)keyboardShortcutInvokedWithKeyCommand:(id)a3 keyEvent:(id)a4 keyboardProperties:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v9 language];
  id v11 = [MEMORY[0x1E4F28E78] string];
  if (v7)
  {
    uint64_t v12 = [v7 _readableStringForModifierFlagsUsingWords:0 forHUD:0];
    [v11 appendString:v12];

    uint64_t v13 = [v7 _readableStringForInputUsingWords:0 forHUD:0 outIsSingleCharacterOrKeySymbol:0];
    [v11 appendString:v13];
  }
  id v14 = (id)[v11 stringByReplacingOccurrencesOfString:@" " withString:&stru_1ED0E84C0];
  id v15 = (void *)[v11 copy];
  uint64_t v16 = v15;
  if (v15 && [v15 length])
  {
    id v17 = +[UIKeyboardInputModeController sharedInputModeController];
    id v18 = [v17 currentSystemInputMode];
    id v19 = [v18 identifier];

    if (v19 && [(__CFString *)v19 length])
    {
      id v20 = +[UIKeyboardInputModeController sharedInputModeController];
      v21 = [v20 currentSystemInputMode];
      int v22 = [v21 isExtensionInputMode];

      if (v22)
      {

        id v19 = @"Other";
      }
      id v23 = _UIMainBundleIdentifier();
      id v24 = v23;
      if (v23 && [v23 length])
      {
        [v8 _keyCode];
        [v8 _modifierFlags];
        [v9 subinterfaceID];
        [v9 standardType];
        uint64_t v25 = NSStringFromSelector((SEL)[v7 action]);
        id v26 = (void *)v25;
        id v27 = @"unknown";
        if (v25) {
          id v27 = (__CFString *)v25;
        }
        id v28 = v27;

        id v30 = v10;
        v31 = v19;
        id v32 = v24;
        id v33 = v16;
        id v34 = v28;
        id v29 = v28;
        AnalyticsSendEventLazy();
      }
    }
  }
}

id __93__UIKBAnalyticsDispatcher_keyboardShortcutInvokedWithKeyCommand_keyEvent_keyboardProperties___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v15[0] = @"keyCode";
  uint64_t v2 = [NSNumber numberWithLong:*(void *)(a1 + 72)];
  id v3 = [v2 stringValue];
  v16[0] = v3;
  v15[1] = @"modifierFlags";
  BOOL v4 = [NSNumber numberWithInteger:*(void *)(a1 + 80)];
  uint64_t v5 = [v4 stringValue];
  v16[1] = v5;
  void v15[2] = @"keyboardType";
  id v6 = [NSNumber numberWithInteger:*(void *)(a1 + 88)];
  id v7 = [v6 stringValue];
  v16[2] = v7;
  v15[3] = @"keyboardStandardType";
  id v8 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 96)];
  uint64_t v9 = [v8 stringValue];
  id v10 = (void *)v9;
  id v11 = @"unknown";
  uint64_t v12 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32)) {
    id v11 = *(__CFString **)(a1 + 32);
  }
  v16[3] = v9;
  void v16[4] = v11;
  void v15[4] = @"keyboardLanguage";
  v15[5] = @"inputSource";
  v16[5] = v12;
  long long v17 = *(_OWORD *)(a1 + 48);
  v15[6] = @"bundleId";
  v15[7] = @"shortcut";
  v15[8] = @"title";
  uint64_t v18 = *(void *)(a1 + 64);
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:9];

  return v13;
}

+ (void)keyboardCameraSessionEndedForTextContentType:(id)a3 didFindText:(BOOL)a4 didInsertText:(BOOL)a5 sender:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  v19[4] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = (__CFString *)a3;
  id v10 = a6;
  if (keyboardCameraSessionEndedForTextContentType_didFindText_didInsertText_sender__onceToken != -1) {
    dispatch_once(&keyboardCameraSessionEndedForTextContentType_didFindText_didInsertText_sender__onceToken, &__block_literal_global_113_0);
  }
  if (![(__CFString *)v9 length])
  {

    uint64_t v9 = @"None";
  }
  id v11 = @"custom";
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v12 = UIKBAnalyticsKeyboardCameraInvocationSourceTextSuggestion;
LABEL_9:
    id v14 = *v12;

    id v11 = v14;
    goto LABEL_10;
  }
  id v13 = +[UIMenuController sharedMenuController];

  if (v13 == v10)
  {
    uint64_t v12 = UIKBAnalyticsKeyboardCameraInvocationSourceCalloutBar;
    goto LABEL_9;
  }
LABEL_10:
  id v15 = [MEMORY[0x1E4FAE260] sharedInstance];
  uint64_t v16 = [NSNumber numberWithBool:v7];
  v19[0] = v16;
  long long v17 = [NSNumber numberWithBool:v8];
  v19[1] = v17;
  v19[2] = v9;
  v19[3] = v11;
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:4];
  [v15 dispatchEventWithName:@"keyboardCameraSessionEnded" values:v18];
}

void __105__UIKBAnalyticsDispatcher_keyboardCameraSessionEndedForTextContentType_didFindText_didInsertText_sender___block_invoke()
{
  void v11[3] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4FAE250] BOOLeanFieldSpecWithName:@"didInsert"];
  uint64_t v1 = [MEMORY[0x1E4FAE250] BOOLeanFieldSpecWithName:@"didFindText"];
  uint64_t v2 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:@"textContentType"];
  id v3 = (void *)MEMORY[0x1E4FAE250];
  v11[0] = @"calloutBar";
  v11[1] = @"textSuggestion";
  void v11[2] = @"custom";
  BOOL v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:3];
  uint64_t v5 = [v3 stringFieldSpecWithName:@"invocationSource" allowedValues:v4];

  id v6 = (void *)MEMORY[0x1E4FAE248];
  v10[0] = v0;
  v10[1] = v1;
  v10[2] = v2;
  v10[3] = v5;
  BOOL v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:4];
  BOOL v8 = [v6 eventSpecWithName:@"keyboardCameraSessionEnded" inputModeRequired:0 fieldSpecs:v7];

  uint64_t v9 = [MEMORY[0x1E4FAE260] sharedInstance];
  [v9 registerEventSpec:v8];
}

+ (void)hapticEventEngineDuration:(double)a3 startCount:(unint64_t)a4 actionCount:(unint64_t)a5
{
  v13[3] = *MEMORY[0x1E4F143B8];
  if (hapticEventEngineDuration_startCount_actionCount__onceToken != -1) {
    dispatch_once(&hapticEventEngineDuration_startCount_actionCount__onceToken, &__block_literal_global_120_0);
  }
  BOOL v8 = [MEMORY[0x1E4FAE260] sharedInstance];
  uint64_t v9 = [NSNumber numberWithUnsignedInteger:llround(a3)];
  id v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", a4, v9);
  v13[1] = v10;
  id v11 = [NSNumber numberWithUnsignedInteger:a5];
  void v13[2] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3];
  [v8 dispatchEventWithName:@"HapticFeedback.Daily" values:v12];
}

void __76__UIKBAnalyticsDispatcher_hapticEventEngineDuration_startCount_actionCount___block_invoke()
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"EngineActiveTime"];
  uint64_t v1 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"EngineStartCount"];
  uint64_t v2 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"ActionCount"];
  id v3 = (void *)MEMORY[0x1E4FAE248];
  v7[0] = v0;
  v7[1] = v1;
  v7[2] = v2;
  BOOL v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];
  uint64_t v5 = [v3 eventSpecWithName:@"HapticFeedback.Daily" inputModeRequired:0 fieldSpecs:v4];

  id v6 = [MEMORY[0x1E4FAE260] sharedInstance];
  [v6 registerEventSpec:v5];
}

- (unint64_t)nextCandidateReplacementSource
{
  return self->_nextCandidateReplacementSource;
}

- (void)setNextCandidateReplacementSource:(unint64_t)a3
{
  self->_nextCandidateReplacementSource = a3;
}

- (NSString)nextCandidateReplacementRemovedText
{
  return self->_nextCandidateReplacementRemovedText;
}

- (void)setNextCandidateReplacementRemovedText:(id)a3
{
}

- (NSString)nextCandidateReplacementInsertedText
{
  return self->_nextCandidateReplacementInsertedText;
}

- (void)setNextCandidateReplacementInsertedText:(id)a3
{
}

- (NSString)nextCandidateReplacementPostCandidateInsertedText
{
  return self->_nextCandidateReplacementPostCandidateInsertedText;
}

- (void)setNextCandidateReplacementPostCandidateInsertedText:(id)a3
{
}

- (BOOL)analyticsSkipDidKeyPress
{
  return self->_analyticsSkipDidKeyPress;
}

- (void)setAnalyticsSkipDidKeyPress:(BOOL)a3
{
  self->_analyticsSkipDidKeyPress = a3;
}

- (NSString)updatedInputMode
{
  return self->_updatedInputMode;
}

- (void)setUpdatedInputMode:(id)a3
{
}

- (NSString)glomojiTitle
{
  return self->_glomojiTitle;
}

- (void)setGlomojiTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glomojiTitle, 0);
  objc_storeStrong((id *)&self->_updatedInputMode, 0);
  objc_storeStrong((id *)&self->_nextCandidateReplacementPostCandidateInsertedText, 0);
  objc_storeStrong((id *)&self->_nextCandidateReplacementInsertedText, 0);
  objc_storeStrong((id *)&self->_nextCandidateReplacementRemovedText, 0);
}

@end