@interface VOSOutputEvent
+ (NSSet)allOutputEvents;
+ (VOSOutputEvent)AlertDidAppear;
+ (VOSOutputEvent)AutofillDidAppear;
+ (VOSOutputEvent)AutofillDidDismiss;
+ (VOSOutputEvent)BSIDidCalibrate;
+ (VOSOutputEvent)BSIDidCarriageReturn;
+ (VOSOutputEvent)BSIDidDelete;
+ (VOSOutputEvent)BSIDidDisable;
+ (VOSOutputEvent)BSIDidEnableCommand;
+ (VOSOutputEvent)BSIDidEnableTyping;
+ (VOSOutputEvent)BSIDidEnterChord;
+ (VOSOutputEvent)BSIDidEnterSpace;
+ (VOSOutputEvent)BSIDidType;
+ (VOSOutputEvent)BoundaryEncountered;
+ (VOSOutputEvent)BrailleDisplayConnected;
+ (VOSOutputEvent)BrailleDisplayDisconnected;
+ (VOSOutputEvent)BrailleDisplayReconnectionTriggered;
+ (VOSOutputEvent)CollaborationOccurred;
+ (VOSOutputEvent)DidActivateElement;
+ (VOSOutputEvent)DidBeginPassthrough;
+ (VOSOutputEvent)DidChangeTextSelectionDirection;
+ (VOSOutputEvent)DidChangeVolume;
+ (VOSOutputEvent)DidDisableQuickNav;
+ (VOSOutputEvent)DidEnableQuickNav;
+ (VOSOutputEvent)DidEnterSecureText;
+ (VOSOutputEvent)DidEnterTargetArea;
+ (VOSOutputEvent)DidEnterTouchContainer;
+ (VOSOutputEvent)DidFocusOnElement;
+ (VOSOutputEvent)DidFocusOnScreenRecognitionElement;
+ (VOSOutputEvent)DidLeaveTargetArea;
+ (VOSOutputEvent)DidRecognizeMLContent;
+ (VOSOutputEvent)DidReorderItem;
+ (VOSOutputEvent)DidScrollByPage;
+ (VOSOutputEvent)DidSelectAutofill;
+ (VOSOutputEvent)DidSelectNextRotor;
+ (VOSOutputEvent)DidSelectPreviousRotor;
+ (VOSOutputEvent)DidSyncWithSystemFocus;
+ (VOSOutputEvent)DidWrapBackwards;
+ (VOSOutputEvent)DidWrapForwards;
+ (VOSOutputEvent)DockDidAppear;
+ (VOSOutputEvent)DockDidDisappear;
+ (VOSOutputEvent)FolderDidClose;
+ (VOSOutputEvent)FolderDidOpen;
+ (VOSOutputEvent)FolderWillOpen;
+ (VOSOutputEvent)InsertionPointDidMove;
+ (VOSOutputEvent)InteractIn;
+ (VOSOutputEvent)InteractOut;
+ (VOSOutputEvent)IsInteractable;
+ (VOSOutputEvent)ItemDidLoad;
+ (VOSOutputEvent)ItemIsLoading;
+ (VOSOutputEvent)ItemMemorizationFailed;
+ (VOSOutputEvent)ItemMemorizationInProgress;
+ (VOSOutputEvent)ItemMemorizationSucceeded;
+ (VOSOutputEvent)KeyboardAppeared;
+ (VOSOutputEvent)KeyboardDisappeared;
+ (VOSOutputEvent)NextRotorProgress;
+ (VOSOutputEvent)NoItemExists;
+ (VOSOutputEvent)NoResultsFound;
+ (VOSOutputEvent)NotificationDidAppear;
+ (VOSOutputEvent)PopoverDidAppear;
+ (VOSOutputEvent)PreviousRotorProgress;
+ (VOSOutputEvent)ReachabilityDidBegin;
+ (VOSOutputEvent)ReachabilityDidEnd;
+ (VOSOutputEvent)ScreenDidChange;
+ (VOSOutputEvent)ScreenDidTurnOff;
+ (VOSOutputEvent)SensitiveContent;
+ (VOSOutputEvent)Startup;
+ (VOSOutputEvent)TVDidBeginInteractionWithRotor;
+ (VOSOutputEvent)TVDidEndInteractionWithRotor;
+ (VOSOutputEvent)TouchIDAuthenticated;
+ (VOSOutputEvent)TouchIDFailed;
+ (VOSOutputEvent)TutorialMagicTapStart;
+ (VOSOutputEvent)TutorialMagicTapStop;
+ (VOSOutputEvent)TutorialSuccess;
+ (VOSOutputEvent)UnknownCommand;
+ (VOSOutputEvent)eventWithStringValue:(id)a3;
- (BOOL)supportsHaptic;
- (BOOL)supportsSoundEffect;
- (NSString)localizedName;
- (NSString)rawValue;
- (id)_initOutputEventWithRawValue:(id)a3 supportsSoundEffect:(BOOL)a4 supportsHaptic:(BOOL)a5;
- (id)description;
- (void)setSupportsHaptic:(BOOL)a3;
- (void)setSupportsSoundEffect:(BOOL)a3;
@end

@implementation VOSOutputEvent

- (id)_initOutputEventWithRawValue:(id)a3 supportsSoundEffect:(BOOL)a4 supportsHaptic:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VOSOutputEvent;
  v10 = [(VOSOutputEvent *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_rawValue, a3);
    [(VOSOutputEvent *)v11 setSupportsSoundEffect:v6];
    [(VOSOutputEvent *)v11 setSupportsHaptic:v5];
  }

  return v11;
}

+ (VOSOutputEvent)DidActivateElement
{
  if (DidActivateElement_onceToken != -1) {
    dispatch_once(&DidActivateElement_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)DidActivateElement__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __36__VOSOutputEvent_DidActivateElement__block_invoke()
{
  DidActivateElement__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"DidActivateElement" supportsSoundEffect:1 supportsHaptic:1];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)NoResultsFound
{
  if (NoResultsFound_onceToken != -1) {
    dispatch_once(&NoResultsFound_onceToken, &__block_literal_global_270);
  }
  v2 = (void *)NoResultsFound__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __32__VOSOutputEvent_NoResultsFound__block_invoke()
{
  NoResultsFound__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"NoResultsFound" supportsSoundEffect:1 supportsHaptic:1];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)DidFocusOnElement
{
  if (DidFocusOnElement_onceToken != -1) {
    dispatch_once(&DidFocusOnElement_onceToken, &__block_literal_global_275);
  }
  v2 = (void *)DidFocusOnElement__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __35__VOSOutputEvent_DidFocusOnElement__block_invoke()
{
  DidFocusOnElement__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"DidFocusOnElement" supportsSoundEffect:1 supportsHaptic:1];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)DidFocusOnScreenRecognitionElement
{
  if (DidFocusOnScreenRecognitionElement_onceToken != -1) {
    dispatch_once(&DidFocusOnScreenRecognitionElement_onceToken, &__block_literal_global_280);
  }
  v2 = (void *)DidFocusOnScreenRecognitionElement__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __52__VOSOutputEvent_DidFocusOnScreenRecognitionElement__block_invoke()
{
  DidFocusOnScreenRecognitionElement__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"DidFocusOnScreenRecognitionElement" supportsSoundEffect:1 supportsHaptic:1];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)DidScrollByPage
{
  if (DidScrollByPage_onceToken != -1) {
    dispatch_once(&DidScrollByPage_onceToken, &__block_literal_global_285);
  }
  v2 = (void *)DidScrollByPage__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __33__VOSOutputEvent_DidScrollByPage__block_invoke()
{
  DidScrollByPage__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"DidScrollByPage" supportsSoundEffect:1 supportsHaptic:1];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)BoundaryEncountered
{
  if (BoundaryEncountered_onceToken != -1) {
    dispatch_once(&BoundaryEncountered_onceToken, &__block_literal_global_290);
  }
  v2 = (void *)BoundaryEncountered__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __37__VOSOutputEvent_BoundaryEncountered__block_invoke()
{
  BoundaryEncountered__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"BoundaryEncountered" supportsSoundEffect:1 supportsHaptic:1];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)NoItemExists
{
  if (NoItemExists_onceToken != -1) {
    dispatch_once(&NoItemExists_onceToken, &__block_literal_global_295);
  }
  v2 = (void *)NoItemExists__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __30__VOSOutputEvent_NoItemExists__block_invoke()
{
  NoItemExists__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"NoItemExists" supportsSoundEffect:1 supportsHaptic:1];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)IsInteractable
{
  if (IsInteractable_onceToken != -1) {
    dispatch_once(&IsInteractable_onceToken, &__block_literal_global_300);
  }
  v2 = (void *)IsInteractable__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __32__VOSOutputEvent_IsInteractable__block_invoke()
{
  IsInteractable__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"IsInteractable" supportsSoundEffect:1 supportsHaptic:1];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)InteractIn
{
  if (InteractIn_onceToken != -1) {
    dispatch_once(&InteractIn_onceToken, &__block_literal_global_305);
  }
  v2 = (void *)InteractIn__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __28__VOSOutputEvent_InteractIn__block_invoke()
{
  InteractIn__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"InteractIn" supportsSoundEffect:1 supportsHaptic:0];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)InteractOut
{
  if (InteractOut_onceToken != -1) {
    dispatch_once(&InteractOut_onceToken, &__block_literal_global_310);
  }
  v2 = (void *)InteractOut__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __29__VOSOutputEvent_InteractOut__block_invoke()
{
  InteractOut__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"InteractOut" supportsSoundEffect:1 supportsHaptic:0];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)DidSelectAutofill
{
  if (DidSelectAutofill_onceToken != -1) {
    dispatch_once(&DidSelectAutofill_onceToken, &__block_literal_global_315_0);
  }
  v2 = (void *)DidSelectAutofill__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __35__VOSOutputEvent_DidSelectAutofill__block_invoke()
{
  DidSelectAutofill__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"DidSelectAutofill" supportsSoundEffect:1 supportsHaptic:1];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)DidBeginPassthrough
{
  if (DidBeginPassthrough_onceToken != -1) {
    dispatch_once(&DidBeginPassthrough_onceToken, &__block_literal_global_320);
  }
  v2 = (void *)DidBeginPassthrough__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __37__VOSOutputEvent_DidBeginPassthrough__block_invoke()
{
  DidBeginPassthrough__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"DidBeginPassthrough" supportsSoundEffect:1 supportsHaptic:1];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)DidSelectPreviousRotor
{
  if (DidSelectPreviousRotor_onceToken != -1) {
    dispatch_once(&DidSelectPreviousRotor_onceToken, &__block_literal_global_325);
  }
  v2 = (void *)DidSelectPreviousRotor__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __40__VOSOutputEvent_DidSelectPreviousRotor__block_invoke()
{
  DidSelectPreviousRotor__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"DidSelectPreviousRotor" supportsSoundEffect:1 supportsHaptic:1];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)DidSelectNextRotor
{
  if (DidSelectNextRotor_onceToken != -1) {
    dispatch_once(&DidSelectNextRotor_onceToken, &__block_literal_global_330);
  }
  v2 = (void *)DidSelectNextRotor__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __36__VOSOutputEvent_DidSelectNextRotor__block_invoke()
{
  DidSelectNextRotor__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"DidSelectNextRotor" supportsSoundEffect:1 supportsHaptic:1];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)PreviousRotorProgress
{
  if (PreviousRotorProgress_onceToken != -1) {
    dispatch_once(&PreviousRotorProgress_onceToken, &__block_literal_global_335);
  }
  v2 = (void *)PreviousRotorProgress__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __39__VOSOutputEvent_PreviousRotorProgress__block_invoke()
{
  PreviousRotorProgress__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"PreviousRotorProgress" supportsSoundEffect:0 supportsHaptic:1];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)NextRotorProgress
{
  if (NextRotorProgress_onceToken != -1) {
    dispatch_once(&NextRotorProgress_onceToken, &__block_literal_global_340);
  }
  v2 = (void *)NextRotorProgress__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __35__VOSOutputEvent_NextRotorProgress__block_invoke()
{
  NextRotorProgress__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"NextRotorProgress" supportsSoundEffect:0 supportsHaptic:1];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)DidEnterSecureText
{
  if (DidEnterSecureText_onceToken != -1) {
    dispatch_once(&DidEnterSecureText_onceToken, &__block_literal_global_345);
  }
  v2 = (void *)DidEnterSecureText__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __36__VOSOutputEvent_DidEnterSecureText__block_invoke()
{
  DidEnterSecureText__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"DidEnterSecureText" supportsSoundEffect:1 supportsHaptic:1];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)DidChangeTextSelectionDirection
{
  if (DidChangeTextSelectionDirection_onceToken != -1) {
    dispatch_once(&DidChangeTextSelectionDirection_onceToken, &__block_literal_global_350);
  }
  v2 = (void *)DidChangeTextSelectionDirection__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __49__VOSOutputEvent_DidChangeTextSelectionDirection__block_invoke()
{
  DidChangeTextSelectionDirection__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"DidChangeTextSelectionDirection" supportsSoundEffect:1 supportsHaptic:1];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)UnknownCommand
{
  if (UnknownCommand_onceToken != -1) {
    dispatch_once(&UnknownCommand_onceToken, &__block_literal_global_355);
  }
  v2 = (void *)UnknownCommand__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __32__VOSOutputEvent_UnknownCommand__block_invoke()
{
  UnknownCommand__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"UnknownCommand" supportsSoundEffect:1 supportsHaptic:1];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)DidRecognizeMLContent
{
  if (DidRecognizeMLContent_onceToken != -1) {
    dispatch_once(&DidRecognizeMLContent_onceToken, &__block_literal_global_360);
  }
  v2 = (void *)DidRecognizeMLContent__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __39__VOSOutputEvent_DidRecognizeMLContent__block_invoke()
{
  DidRecognizeMLContent__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"DidRecognizeMLContent" supportsSoundEffect:1 supportsHaptic:0];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)DidEnterTargetArea
{
  if (DidEnterTargetArea_onceToken != -1) {
    dispatch_once(&DidEnterTargetArea_onceToken, &__block_literal_global_365);
  }
  v2 = (void *)DidEnterTargetArea__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __36__VOSOutputEvent_DidEnterTargetArea__block_invoke()
{
  DidEnterTargetArea__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"DidEnterTargetArea" supportsSoundEffect:1 supportsHaptic:1];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)DidLeaveTargetArea
{
  if (DidLeaveTargetArea_onceToken != -1) {
    dispatch_once(&DidLeaveTargetArea_onceToken, &__block_literal_global_370);
  }
  v2 = (void *)DidLeaveTargetArea__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __36__VOSOutputEvent_DidLeaveTargetArea__block_invoke()
{
  DidLeaveTargetArea__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"DidLeaveTargetArea" supportsSoundEffect:1 supportsHaptic:1];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)DidSyncWithSystemFocus
{
  if (DidSyncWithSystemFocus_onceToken != -1) {
    dispatch_once(&DidSyncWithSystemFocus_onceToken, &__block_literal_global_375);
  }
  v2 = (void *)DidSyncWithSystemFocus__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __40__VOSOutputEvent_DidSyncWithSystemFocus__block_invoke()
{
  DidSyncWithSystemFocus__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"DidSyncWithSystemFocus" supportsSoundEffect:1 supportsHaptic:0];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)DidEnterTouchContainer
{
  if (DidEnterTouchContainer_onceToken != -1) {
    dispatch_once(&DidEnterTouchContainer_onceToken, &__block_literal_global_380);
  }
  v2 = (void *)DidEnterTouchContainer__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __40__VOSOutputEvent_DidEnterTouchContainer__block_invoke()
{
  DidEnterTouchContainer__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"DidEnterTouchContainer" supportsSoundEffect:1 supportsHaptic:0];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)DidChangeVolume
{
  if (DidChangeVolume_onceToken != -1) {
    dispatch_once(&DidChangeVolume_onceToken, &__block_literal_global_385);
  }
  v2 = (void *)DidChangeVolume__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __33__VOSOutputEvent_DidChangeVolume__block_invoke()
{
  DidChangeVolume__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"DidChangeVolume" supportsSoundEffect:1 supportsHaptic:0];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)DidReorderItem
{
  if (DidReorderItem_onceToken != -1) {
    dispatch_once(&DidReorderItem_onceToken, &__block_literal_global_390);
  }
  v2 = (void *)DidReorderItem__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __32__VOSOutputEvent_DidReorderItem__block_invoke()
{
  DidReorderItem__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"DidReorderItem" supportsSoundEffect:1 supportsHaptic:0];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)DidWrapBackwards
{
  if (DidWrapBackwards_onceToken != -1) {
    dispatch_once(&DidWrapBackwards_onceToken, &__block_literal_global_395);
  }
  v2 = (void *)DidWrapBackwards__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __34__VOSOutputEvent_DidWrapBackwards__block_invoke()
{
  DidWrapBackwards__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"DidWrapBackwards" supportsSoundEffect:1 supportsHaptic:1];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)DidWrapForwards
{
  if (DidWrapForwards_onceToken != -1) {
    dispatch_once(&DidWrapForwards_onceToken, &__block_literal_global_400);
  }
  v2 = (void *)DidWrapForwards__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __33__VOSOutputEvent_DidWrapForwards__block_invoke()
{
  DidWrapForwards__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"DidWrapForwards" supportsSoundEffect:1 supportsHaptic:1];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)DidEnableQuickNav
{
  if (DidEnableQuickNav_onceToken != -1) {
    dispatch_once(&DidEnableQuickNav_onceToken, &__block_literal_global_405);
  }
  v2 = (void *)DidEnableQuickNav__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __35__VOSOutputEvent_DidEnableQuickNav__block_invoke()
{
  DidEnableQuickNav__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"DidEnableQuickNav" supportsSoundEffect:1 supportsHaptic:0];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)DidDisableQuickNav
{
  if (DidDisableQuickNav_onceToken != -1) {
    dispatch_once(&DidDisableQuickNav_onceToken, &__block_literal_global_410);
  }
  v2 = (void *)DidDisableQuickNav__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __36__VOSOutputEvent_DidDisableQuickNav__block_invoke()
{
  DidDisableQuickNav__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"DidDisableQuickNav" supportsSoundEffect:1 supportsHaptic:0];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)TVDidBeginInteractionWithRotor
{
  if (TVDidBeginInteractionWithRotor_onceToken != -1) {
    dispatch_once(&TVDidBeginInteractionWithRotor_onceToken, &__block_literal_global_415);
  }
  v2 = (void *)TVDidBeginInteractionWithRotor__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __48__VOSOutputEvent_TVDidBeginInteractionWithRotor__block_invoke()
{
  TVDidBeginInteractionWithRotor__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"TVDidBeginInteractionWithRotor" supportsSoundEffect:1 supportsHaptic:0];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)TVDidEndInteractionWithRotor
{
  if (TVDidEndInteractionWithRotor_onceToken != -1) {
    dispatch_once(&TVDidEndInteractionWithRotor_onceToken, &__block_literal_global_420);
  }
  v2 = (void *)TVDidEndInteractionWithRotor__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __46__VOSOutputEvent_TVDidEndInteractionWithRotor__block_invoke()
{
  TVDidEndInteractionWithRotor__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"TVDidEndInteractionWithRotor" supportsSoundEffect:1 supportsHaptic:0];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)BSIDidEnableTyping
{
  if (BSIDidEnableTyping_onceToken != -1) {
    dispatch_once(&BSIDidEnableTyping_onceToken, &__block_literal_global_425);
  }
  v2 = (void *)BSIDidEnableTyping__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __36__VOSOutputEvent_BSIDidEnableTyping__block_invoke()
{
  BSIDidEnableTyping__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"BSIDidEnableTyping" supportsSoundEffect:1 supportsHaptic:0];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)BSIDidEnableCommand
{
  if (BSIDidEnableCommand_onceToken != -1) {
    dispatch_once(&BSIDidEnableCommand_onceToken, &__block_literal_global_430);
  }
  v2 = (void *)BSIDidEnableCommand__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __37__VOSOutputEvent_BSIDidEnableCommand__block_invoke()
{
  BSIDidEnableCommand__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"BSIDidEnableCommand" supportsSoundEffect:1 supportsHaptic:0];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)BSIDidDisable
{
  if (BSIDidDisable_onceToken != -1) {
    dispatch_once(&BSIDidDisable_onceToken, &__block_literal_global_435);
  }
  v2 = (void *)BSIDidDisable__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __31__VOSOutputEvent_BSIDidDisable__block_invoke()
{
  BSIDidDisable__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"BSIDidDisable" supportsSoundEffect:1 supportsHaptic:0];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)BSIDidCalibrate
{
  if (BSIDidCalibrate_onceToken != -1) {
    dispatch_once(&BSIDidCalibrate_onceToken, &__block_literal_global_440);
  }
  v2 = (void *)BSIDidCalibrate__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __33__VOSOutputEvent_BSIDidCalibrate__block_invoke()
{
  BSIDidCalibrate__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"BSIDidCalibrate" supportsSoundEffect:1 supportsHaptic:0];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)BSIDidCarriageReturn
{
  if (BSIDidCarriageReturn_onceToken != -1) {
    dispatch_once(&BSIDidCarriageReturn_onceToken, &__block_literal_global_445);
  }
  v2 = (void *)BSIDidCarriageReturn__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __38__VOSOutputEvent_BSIDidCarriageReturn__block_invoke()
{
  BSIDidCarriageReturn__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"BSIDidCarriageReturn" supportsSoundEffect:1 supportsHaptic:0];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)BSIDidType
{
  if (BSIDidType_onceToken != -1) {
    dispatch_once(&BSIDidType_onceToken, &__block_literal_global_450);
  }
  v2 = (void *)BSIDidType__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __28__VOSOutputEvent_BSIDidType__block_invoke()
{
  BSIDidType__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"BSIDidType" supportsSoundEffect:1 supportsHaptic:0];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)BSIDidDelete
{
  if (BSIDidDelete_onceToken != -1) {
    dispatch_once(&BSIDidDelete_onceToken, &__block_literal_global_455);
  }
  v2 = (void *)BSIDidDelete__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __30__VOSOutputEvent_BSIDidDelete__block_invoke()
{
  BSIDidDelete__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"BSIDidDelete" supportsSoundEffect:1 supportsHaptic:0];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)BSIDidEnterSpace
{
  if (BSIDidEnterSpace_onceToken != -1) {
    dispatch_once(&BSIDidEnterSpace_onceToken, &__block_literal_global_460);
  }
  v2 = (void *)BSIDidEnterSpace__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __34__VOSOutputEvent_BSIDidEnterSpace__block_invoke()
{
  BSIDidEnterSpace__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"BSIDidEnterSpace" supportsSoundEffect:1 supportsHaptic:0];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)BSIDidEnterChord
{
  if (BSIDidEnterChord_onceToken != -1) {
    dispatch_once(&BSIDidEnterChord_onceToken, &__block_literal_global_465);
  }
  v2 = (void *)BSIDidEnterChord__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __34__VOSOutputEvent_BSIDidEnterChord__block_invoke()
{
  BSIDidEnterChord__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"BSIDidEnterChord" supportsSoundEffect:0 supportsHaptic:1];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)BrailleDisplayReconnectionTriggered
{
  if (BrailleDisplayReconnectionTriggered_onceToken != -1) {
    dispatch_once(&BrailleDisplayReconnectionTriggered_onceToken, &__block_literal_global_470);
  }
  v2 = (void *)BrailleDisplayReconnectionTriggered__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __53__VOSOutputEvent_BrailleDisplayReconnectionTriggered__block_invoke()
{
  BrailleDisplayReconnectionTriggered__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"BrailleDisplayReconnectionTriggered" supportsSoundEffect:0 supportsHaptic:1];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)AlertDidAppear
{
  if (AlertDidAppear_onceToken != -1) {
    dispatch_once(&AlertDidAppear_onceToken, &__block_literal_global_475);
  }
  v2 = (void *)AlertDidAppear__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __32__VOSOutputEvent_AlertDidAppear__block_invoke()
{
  AlertDidAppear__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"AlertDidAppear" supportsSoundEffect:1 supportsHaptic:1];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)NotificationDidAppear
{
  if (NotificationDidAppear_onceToken != -1) {
    dispatch_once(&NotificationDidAppear_onceToken, &__block_literal_global_480);
  }
  v2 = (void *)NotificationDidAppear__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __39__VOSOutputEvent_NotificationDidAppear__block_invoke()
{
  NotificationDidAppear__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"NotificationDidAppear" supportsSoundEffect:0 supportsHaptic:1];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)PopoverDidAppear
{
  if (PopoverDidAppear_onceToken != -1) {
    dispatch_once(&PopoverDidAppear_onceToken, &__block_literal_global_485);
  }
  v2 = (void *)PopoverDidAppear__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __34__VOSOutputEvent_PopoverDidAppear__block_invoke()
{
  PopoverDidAppear__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"PopoverDidAppear" supportsSoundEffect:1 supportsHaptic:1];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)AutofillDidAppear
{
  if (AutofillDidAppear_onceToken != -1) {
    dispatch_once(&AutofillDidAppear_onceToken, &__block_literal_global_490);
  }
  v2 = (void *)AutofillDidAppear__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __35__VOSOutputEvent_AutofillDidAppear__block_invoke()
{
  AutofillDidAppear__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"AutofillDidAppear" supportsSoundEffect:1 supportsHaptic:1];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)AutofillDidDismiss
{
  if (AutofillDidDismiss_onceToken != -1) {
    dispatch_once(&AutofillDidDismiss_onceToken, &__block_literal_global_495);
  }
  v2 = (void *)AutofillDidDismiss__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __36__VOSOutputEvent_AutofillDidDismiss__block_invoke()
{
  AutofillDidDismiss__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"AutofillDidDismiss" supportsSoundEffect:1 supportsHaptic:1];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)ItemIsLoading
{
  if (ItemIsLoading_onceToken != -1) {
    dispatch_once(&ItemIsLoading_onceToken, &__block_literal_global_500);
  }
  v2 = (void *)ItemIsLoading__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __31__VOSOutputEvent_ItemIsLoading__block_invoke()
{
  ItemIsLoading__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"ItemIsLoading" supportsSoundEffect:1 supportsHaptic:1];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)ItemDidLoad
{
  if (ItemDidLoad_onceToken != -1) {
    dispatch_once(&ItemDidLoad_onceToken, &__block_literal_global_505);
  }
  v2 = (void *)ItemDidLoad__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __29__VOSOutputEvent_ItemDidLoad__block_invoke()
{
  ItemDidLoad__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"ItemDidLoad" supportsSoundEffect:1 supportsHaptic:1];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)ScreenDidTurnOff
{
  if (ScreenDidTurnOff_onceToken != -1) {
    dispatch_once(&ScreenDidTurnOff_onceToken, &__block_literal_global_510);
  }
  v2 = (void *)ScreenDidTurnOff__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __34__VOSOutputEvent_ScreenDidTurnOff__block_invoke()
{
  ScreenDidTurnOff__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"ScreenDidTurnOff" supportsSoundEffect:1 supportsHaptic:1];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)InsertionPointDidMove
{
  if (InsertionPointDidMove_onceToken != -1) {
    dispatch_once(&InsertionPointDidMove_onceToken, &__block_literal_global_515);
  }
  v2 = (void *)InsertionPointDidMove__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __39__VOSOutputEvent_InsertionPointDidMove__block_invoke()
{
  InsertionPointDidMove__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"InsertionPointDidMove" supportsSoundEffect:1 supportsHaptic:1];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)KeyboardAppeared
{
  if (KeyboardAppeared_onceToken != -1) {
    dispatch_once(&KeyboardAppeared_onceToken, &__block_literal_global_520);
  }
  v2 = (void *)KeyboardAppeared__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __34__VOSOutputEvent_KeyboardAppeared__block_invoke()
{
  KeyboardAppeared__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"KeyboardAppeared" supportsSoundEffect:1 supportsHaptic:1];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)KeyboardDisappeared
{
  if (KeyboardDisappeared_onceToken != -1) {
    dispatch_once(&KeyboardDisappeared_onceToken, &__block_literal_global_525);
  }
  v2 = (void *)KeyboardDisappeared__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __37__VOSOutputEvent_KeyboardDisappeared__block_invoke()
{
  KeyboardDisappeared__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"KeyboardDisappeared" supportsSoundEffect:1 supportsHaptic:1];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)ItemMemorizationSucceeded
{
  if (ItemMemorizationSucceeded_onceToken != -1) {
    dispatch_once(&ItemMemorizationSucceeded_onceToken, &__block_literal_global_530);
  }
  v2 = (void *)ItemMemorizationSucceeded__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __43__VOSOutputEvent_ItemMemorizationSucceeded__block_invoke()
{
  ItemMemorizationSucceeded__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"ItemMemorizationSucceeded" supportsSoundEffect:1 supportsHaptic:1];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)ScreenDidChange
{
  if (ScreenDidChange_onceToken != -1) {
    dispatch_once(&ScreenDidChange_onceToken, &__block_literal_global_535);
  }
  v2 = (void *)ScreenDidChange__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __33__VOSOutputEvent_ScreenDidChange__block_invoke()
{
  ScreenDidChange__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"ScreenDidChange" supportsSoundEffect:1 supportsHaptic:1];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)CollaborationOccurred
{
  if (CollaborationOccurred_onceToken != -1) {
    dispatch_once(&CollaborationOccurred_onceToken, &__block_literal_global_540);
  }
  v2 = (void *)CollaborationOccurred__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __39__VOSOutputEvent_CollaborationOccurred__block_invoke()
{
  CollaborationOccurred__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"CollaborationOccurred" supportsSoundEffect:1 supportsHaptic:0];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)FolderWillOpen
{
  if (FolderWillOpen_onceToken != -1) {
    dispatch_once(&FolderWillOpen_onceToken, &__block_literal_global_545);
  }
  v2 = (void *)FolderWillOpen__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __32__VOSOutputEvent_FolderWillOpen__block_invoke()
{
  FolderWillOpen__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"FolderWillOpen" supportsSoundEffect:1 supportsHaptic:0];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)FolderDidOpen
{
  if (FolderDidOpen_onceToken != -1) {
    dispatch_once(&FolderDidOpen_onceToken, &__block_literal_global_550);
  }
  v2 = (void *)FolderDidOpen__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __31__VOSOutputEvent_FolderDidOpen__block_invoke()
{
  FolderDidOpen__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"FolderDidOpen" supportsSoundEffect:1 supportsHaptic:0];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)FolderDidClose
{
  if (FolderDidClose_onceToken != -1) {
    dispatch_once(&FolderDidClose_onceToken, &__block_literal_global_555);
  }
  v2 = (void *)FolderDidClose__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __32__VOSOutputEvent_FolderDidClose__block_invoke()
{
  FolderDidClose__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"FolderDidClose" supportsSoundEffect:1 supportsHaptic:0];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)BrailleDisplayConnected
{
  if (BrailleDisplayConnected_onceToken != -1) {
    dispatch_once(&BrailleDisplayConnected_onceToken, &__block_literal_global_560);
  }
  v2 = (void *)BrailleDisplayConnected__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __41__VOSOutputEvent_BrailleDisplayConnected__block_invoke()
{
  BrailleDisplayConnected__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"BrailleDisplayConnected" supportsSoundEffect:1 supportsHaptic:1];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)BrailleDisplayDisconnected
{
  if (BrailleDisplayDisconnected_onceToken != -1) {
    dispatch_once(&BrailleDisplayDisconnected_onceToken, &__block_literal_global_565);
  }
  v2 = (void *)BrailleDisplayDisconnected__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __44__VOSOutputEvent_BrailleDisplayDisconnected__block_invoke()
{
  BrailleDisplayDisconnected__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"BrailleDisplayDisconnected" supportsSoundEffect:1 supportsHaptic:1];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)ItemMemorizationFailed
{
  if (ItemMemorizationFailed_onceToken != -1) {
    dispatch_once(&ItemMemorizationFailed_onceToken, &__block_literal_global_570);
  }
  v2 = (void *)ItemMemorizationFailed__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __40__VOSOutputEvent_ItemMemorizationFailed__block_invoke()
{
  ItemMemorizationFailed__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"ItemMemorizationFailed" supportsSoundEffect:1 supportsHaptic:0];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)ItemMemorizationInProgress
{
  if (ItemMemorizationInProgress_onceToken != -1) {
    dispatch_once(&ItemMemorizationInProgress_onceToken, &__block_literal_global_575);
  }
  v2 = (void *)ItemMemorizationInProgress__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __44__VOSOutputEvent_ItemMemorizationInProgress__block_invoke()
{
  ItemMemorizationInProgress__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"ItemMemorizationInProgress" supportsSoundEffect:1 supportsHaptic:0];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)DockDidAppear
{
  if (DockDidAppear_onceToken != -1) {
    dispatch_once(&DockDidAppear_onceToken, &__block_literal_global_580);
  }
  v2 = (void *)DockDidAppear__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __31__VOSOutputEvent_DockDidAppear__block_invoke()
{
  DockDidAppear__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"DockDidAppear" supportsSoundEffect:1 supportsHaptic:0];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)DockDidDisappear
{
  if (DockDidDisappear_onceToken != -1) {
    dispatch_once(&DockDidDisappear_onceToken, &__block_literal_global_585);
  }
  v2 = (void *)DockDidDisappear__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __34__VOSOutputEvent_DockDidDisappear__block_invoke()
{
  DockDidDisappear__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"DockDidDisappear" supportsSoundEffect:1 supportsHaptic:0];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)ReachabilityDidBegin
{
  if (ReachabilityDidBegin_onceToken != -1) {
    dispatch_once(&ReachabilityDidBegin_onceToken, &__block_literal_global_590);
  }
  v2 = (void *)ReachabilityDidBegin__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __38__VOSOutputEvent_ReachabilityDidBegin__block_invoke()
{
  ReachabilityDidBegin__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"ReachabilityDidBegin" supportsSoundEffect:1 supportsHaptic:0];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)ReachabilityDidEnd
{
  if (ReachabilityDidEnd_onceToken != -1) {
    dispatch_once(&ReachabilityDidEnd_onceToken, &__block_literal_global_595_0);
  }
  v2 = (void *)ReachabilityDidEnd__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __36__VOSOutputEvent_ReachabilityDidEnd__block_invoke()
{
  ReachabilityDidEnd__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"ReachabilityDidEnd" supportsSoundEffect:1 supportsHaptic:0];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)TouchIDAuthenticated
{
  if (TouchIDAuthenticated_onceToken != -1) {
    dispatch_once(&TouchIDAuthenticated_onceToken, &__block_literal_global_600);
  }
  v2 = (void *)TouchIDAuthenticated__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __38__VOSOutputEvent_TouchIDAuthenticated__block_invoke()
{
  TouchIDAuthenticated__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"TouchIDAuthenticated" supportsSoundEffect:1 supportsHaptic:1];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)TouchIDFailed
{
  if (TouchIDFailed_onceToken != -1) {
    dispatch_once(&TouchIDFailed_onceToken, &__block_literal_global_605);
  }
  v2 = (void *)TouchIDFailed__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __31__VOSOutputEvent_TouchIDFailed__block_invoke()
{
  TouchIDFailed__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"TouchIDFailed" supportsSoundEffect:1 supportsHaptic:1];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)SensitiveContent
{
  if (SensitiveContent_onceToken != -1) {
    dispatch_once(&SensitiveContent_onceToken, &__block_literal_global_610);
  }
  v2 = (void *)SensitiveContent__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __34__VOSOutputEvent_SensitiveContent__block_invoke()
{
  SensitiveContent__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"SensitiveContent" supportsSoundEffect:1 supportsHaptic:0];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)Startup
{
  if (Startup_onceToken != -1) {
    dispatch_once(&Startup_onceToken, &__block_literal_global_615);
  }
  v2 = (void *)Startup__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __25__VOSOutputEvent_Startup__block_invoke()
{
  Startup__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"Startup" supportsSoundEffect:0 supportsHaptic:1];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)TutorialSuccess
{
  if (TutorialSuccess_onceToken != -1) {
    dispatch_once(&TutorialSuccess_onceToken, &__block_literal_global_620);
  }
  v2 = (void *)TutorialSuccess__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __33__VOSOutputEvent_TutorialSuccess__block_invoke()
{
  TutorialSuccess__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"TutorialSuccess" supportsSoundEffect:1 supportsHaptic:0];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)TutorialMagicTapStart
{
  if (TutorialMagicTapStart_onceToken != -1) {
    dispatch_once(&TutorialMagicTapStart_onceToken, &__block_literal_global_625);
  }
  v2 = (void *)TutorialMagicTapStart__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __39__VOSOutputEvent_TutorialMagicTapStart__block_invoke()
{
  TutorialMagicTapStart__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"TutorialMagicTapStart" supportsSoundEffect:1 supportsHaptic:0];

  return MEMORY[0x270F9A758]();
}

+ (VOSOutputEvent)TutorialMagicTapStop
{
  if (TutorialMagicTapStop_onceToken != -1) {
    dispatch_once(&TutorialMagicTapStop_onceToken, &__block_literal_global_630);
  }
  v2 = (void *)TutorialMagicTapStop__Event;

  return (VOSOutputEvent *)v2;
}

uint64_t __38__VOSOutputEvent_TutorialMagicTapStop__block_invoke()
{
  TutorialMagicTapStop__Event = [[VOSOutputEvent alloc] _initOutputEventWithRawValue:@"TutorialMagicTapStop" supportsSoundEffect:1 supportsHaptic:0];

  return MEMORY[0x270F9A758]();
}

+ (NSSet)allOutputEvents
{
  if (allOutputEvents_onceToken != -1) {
    dispatch_once(&allOutputEvents_onceToken, &__block_literal_global_635);
  }
  v2 = (void *)allOutputEvents__AllOutputEvents;

  return (NSSet *)v2;
}

void __33__VOSOutputEvent_allOutputEvents__block_invoke()
{
  v14 = (void *)MEMORY[0x263EFFA08];
  v76 = +[VOSOutputEvent DidActivateElement];
  v75 = +[VOSOutputEvent NoResultsFound];
  v74 = +[VOSOutputEvent DidFocusOnElement];
  v73 = +[VOSOutputEvent DidFocusOnScreenRecognitionElement];
  v72 = +[VOSOutputEvent DidScrollByPage];
  v71 = +[VOSOutputEvent BoundaryEncountered];
  v70 = +[VOSOutputEvent NoItemExists];
  v69 = +[VOSOutputEvent IsInteractable];
  v68 = +[VOSOutputEvent InteractIn];
  v67 = +[VOSOutputEvent InteractOut];
  v66 = +[VOSOutputEvent DidSelectAutofill];
  v65 = +[VOSOutputEvent DidBeginPassthrough];
  v64 = +[VOSOutputEvent DidSelectPreviousRotor];
  v63 = +[VOSOutputEvent DidSelectNextRotor];
  v62 = +[VOSOutputEvent PreviousRotorProgress];
  v61 = +[VOSOutputEvent NextRotorProgress];
  v60 = +[VOSOutputEvent DidEnterSecureText];
  v59 = +[VOSOutputEvent DidChangeTextSelectionDirection];
  v58 = +[VOSOutputEvent UnknownCommand];
  v57 = +[VOSOutputEvent DidRecognizeMLContent];
  v56 = +[VOSOutputEvent DidEnterTargetArea];
  v55 = +[VOSOutputEvent DidLeaveTargetArea];
  v54 = +[VOSOutputEvent DidSyncWithSystemFocus];
  v53 = +[VOSOutputEvent DidEnterTouchContainer];
  v52 = +[VOSOutputEvent DidChangeVolume];
  v51 = +[VOSOutputEvent DidReorderItem];
  v50 = +[VOSOutputEvent DidWrapBackwards];
  v49 = +[VOSOutputEvent DidWrapForwards];
  v48 = +[VOSOutputEvent DidEnableQuickNav];
  v47 = +[VOSOutputEvent DidDisableQuickNav];
  v46 = +[VOSOutputEvent TVDidBeginInteractionWithRotor];
  v45 = +[VOSOutputEvent TVDidEndInteractionWithRotor];
  v44 = +[VOSOutputEvent BSIDidEnableTyping];
  v43 = +[VOSOutputEvent BSIDidEnableCommand];
  v42 = +[VOSOutputEvent BSIDidDisable];
  v41 = +[VOSOutputEvent BSIDidCalibrate];
  v40 = +[VOSOutputEvent BSIDidCarriageReturn];
  v39 = +[VOSOutputEvent BSIDidType];
  v38 = +[VOSOutputEvent BSIDidDelete];
  v37 = +[VOSOutputEvent BSIDidEnterSpace];
  v36 = +[VOSOutputEvent BSIDidEnterChord];
  v35 = +[VOSOutputEvent BrailleDisplayReconnectionTriggered];
  v34 = +[VOSOutputEvent AlertDidAppear];
  v33 = +[VOSOutputEvent NotificationDidAppear];
  v29 = +[VOSOutputEvent PopoverDidAppear];
  v31 = +[VOSOutputEvent AutofillDidAppear];
  v32 = +[VOSOutputEvent AutofillDidDismiss];
  v30 = +[VOSOutputEvent ItemIsLoading];
  objc_super v13 = +[VOSOutputEvent ItemDidLoad];
  v28 = +[VOSOutputEvent ScreenDidTurnOff];
  v12 = +[VOSOutputEvent InsertionPointDidMove];
  v27 = +[VOSOutputEvent KeyboardAppeared];
  v26 = +[VOSOutputEvent KeyboardDisappeared];
  v25 = +[VOSOutputEvent ItemMemorizationSucceeded];
  v24 = +[VOSOutputEvent ScreenDidChange];
  v23 = +[VOSOutputEvent CollaborationOccurred];
  v22 = +[VOSOutputEvent FolderWillOpen];
  v21 = +[VOSOutputEvent FolderDidOpen];
  v20 = +[VOSOutputEvent FolderDidClose];
  v19 = +[VOSOutputEvent BrailleDisplayConnected];
  v18 = +[VOSOutputEvent BrailleDisplayDisconnected];
  v17 = +[VOSOutputEvent ItemMemorizationFailed];
  v16 = +[VOSOutputEvent ItemMemorizationInProgress];
  v15 = +[VOSOutputEvent DockDidAppear];
  v10 = +[VOSOutputEvent DockDidDisappear];
  v0 = +[VOSOutputEvent ReachabilityDidBegin];
  v1 = +[VOSOutputEvent ReachabilityDidEnd];
  v11 = +[VOSOutputEvent TouchIDAuthenticated];
  v2 = +[VOSOutputEvent TouchIDFailed];
  v3 = +[VOSOutputEvent SensitiveContent];
  v4 = +[VOSOutputEvent Startup];
  BOOL v5 = +[VOSOutputEvent TutorialSuccess];
  BOOL v6 = +[VOSOutputEvent TutorialMagicTapStart];
  id v9 = +[VOSOutputEvent TutorialMagicTapStop];
  objc_msgSend(v14, "setWithObjects:", v76, v75, v74, v73, v72, v71, v70, v69, v68, v67, v66, v65, v64, v63, v62, v61, v60,
    v59,
    v58,
    v57,
    v56,
    v55,
    v54,
    v53,
    v52,
    v51,
    v50,
    v49,
    v48,
    v47,
    v46,
    v45,
    v44,
    v43,
    v42,
    v41,
    v40,
    v39,
    v38,
    v37,
    v36,
    v35,
    v34,
    v33,
    v29,
    v31,
    v32,
    v30,
    v13,
    v28,
    v12,
    v27,
    v26,
    v25,
    v24,
    v23,
    v22,
    v21,
    v20,
    v19,
  uint64_t v7 = v18);
  v8 = (void *)allOutputEvents__AllOutputEvents;
  allOutputEvents__AllOutputEvents = v7;
}

+ (VOSOutputEvent)eventWithStringValue:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  BOOL v5 = objc_msgSend(a1, "allOutputEvents", 0);
  BOOL v6 = (id *)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (id *)((char *)i + 1))
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(id **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9[1] isEqualToString:v4])
        {
          BOOL v6 = v9;
          goto LABEL_11;
        }
      }
      BOOL v6 = (id *)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (VOSOutputEvent *)v6;
}

- (NSString)rawValue
{
  return self->_rawValue;
}

- (NSString)localizedName
{
  v2 = [NSString stringWithFormat:@"VOSOutputEvent.%@", self->_rawValue];
  v3 = VOSLocString(v2);

  return (NSString *)v3;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(VOSOutputEvent *)self rawValue];
  BOOL v5 = [(VOSOutputEvent *)self localizedName];
  BOOL v6 = [v3 stringWithFormat:@"VOSOutputEvent<%p> %@ (%@)", self, v4, v5];

  return v6;
}

- (BOOL)supportsSoundEffect
{
  return self->_supportsSoundEffect;
}

- (void)setSupportsSoundEffect:(BOOL)a3
{
  self->_supportsSoundEffect = a3;
}

- (BOOL)supportsHaptic
{
  return self->_supportsHaptic;
}

- (void)setSupportsHaptic:(BOOL)a3
{
  self->_supportsHaptic = a3;
}

- (void).cxx_destruct
{
}

@end