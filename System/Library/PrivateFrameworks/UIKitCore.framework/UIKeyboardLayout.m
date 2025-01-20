@interface UIKeyboardLayout
+ (BOOL)_showSmallDisplayKeyplane;
+ (CGSize)keyboardSizeForInputMode:(id)a3 screenTraits:(id)a4 keyboardType:(int64_t)a5;
- (BOOL)_allowContinuousPathUI;
- (BOOL)_canAddTouchesToScreenGestureRecognizer:(id)a3;
- (BOOL)_handRestRecognizerCancelShouldBeEnd;
- (BOOL)_hasRelatedTouchesForTouchState:(id)a3;
- (BOOL)_shouldAllowKeyboardHandlingForTouchesBegan:(id)a3 withEvent:(id)a4;
- (BOOL)_shouldAllowKeyboardHandlingForTouchesEndedOrCancelled:(id)a3 withEvent:(id)a4;
- (BOOL)_shouldAllowKeyboardHandlingForTouchesMoved:(id)a3 withEvent:(id)a4;
- (BOOL)_shouldAllowKeyboardHandlingIfNecessaryForTouch:(id)a3 phase:(int64_t)a4 withTouchState:(id)a5 task:(id)a6;
- (BOOL)canForceTouchUUIDCommit:(id)a3 inWindow:(id)a4;
- (BOOL)canHandleEvent:(id)a3;
- (BOOL)canHandlePresses:(id)a3 withEvent:(id)a4;
- (BOOL)canMultitap;
- (BOOL)canProduceString:(id)a3;
- (BOOL)diacriticForwardCompose;
- (BOOL)disableInteraction;
- (BOOL)globeKeyDisplaysAsEmojiKey;
- (BOOL)handRestRecognizerShouldNeverIgnoreTouchState:(id)a3 fromPoint:(CGPoint)a4 toPoint:(CGPoint)a5 forRestingState:(unint64_t)a6 otherRestedTouchLocations:(id)a7;
- (BOOL)hasAccentKey;
- (BOOL)hasActiveContinuousPathInput;
- (BOOL)hasCandidateKeys;
- (BOOL)hasPreferredHeight;
- (BOOL)hideKeysUnderIndicator;
- (BOOL)ignoresShiftState;
- (BOOL)ignoringKeyplaneChange;
- (BOOL)isAlphabeticPlane;
- (BOOL)isDynamicLayout;
- (BOOL)isEmojiKeyplane;
- (BOOL)isExecutingDeferredTouchTasks;
- (BOOL)isFloating;
- (BOOL)isGeometricShiftOrMoreKeyForTouch:(id)a3;
- (BOOL)isHandwritingPlane;
- (BOOL)isKanaPlane;
- (BOOL)isPossibleToTypeFast;
- (BOOL)isReachableDevice;
- (BOOL)isResized;
- (BOOL)isResizing;
- (BOOL)isShiftKeyBeingHeld;
- (BOOL)isShiftKeyPlaneChooser;
- (BOOL)keyplaneContainsDismissKey;
- (BOOL)keyplaneContainsEmojiKey;
- (BOOL)listeningForDidChange;
- (BOOL)listeningForWillChange;
- (BOOL)performReturnAction;
- (BOOL)performSpaceAction;
- (BOOL)queryShouldNeverIgnoreTouchStateWithIdentifier:(id)a3 touchState:(id)a4 startPoint:(CGPoint)a5 forRestingState:(unint64_t)a6;
- (BOOL)shouldAllowSelectionGestures:(BOOL)a3 atPoint:(CGPoint)a4 toBegin:(BOOL)a5;
- (BOOL)shouldFadeFromLayout;
- (BOOL)shouldFadeToLayout;
- (BOOL)shouldMergeAssistantBarWithKeyboardLayout;
- (BOOL)shouldShowIndicator;
- (BOOL)showsDedicatedEmojiKeyAlongsideGlobeButton;
- (BOOL)supportsEmoji;
- (BOOL)supportsVirtualDrift;
- (BOOL)usesAutoShift;
- (CGPoint)_uikbrtTouchDrifting:(id)a3 touchCenterForFingerID:(unint64_t)a4;
- (CGPoint)getCenterForKeyUnderLeftIndexFinger;
- (CGPoint)getCenterForKeyUnderRightIndexFinger;
- (CGPoint)leftVirtualDriftOffset;
- (CGPoint)rightVirtualDriftOffset;
- (CGRect)dragGestureRectInView:(id)a3;
- (CGRect)frameForKeylayoutName:(id)a3;
- (CGSize)handRestRecognizerStandardKeyPixelSize;
- (CGSize)stretchFactor;
- (NSMutableDictionary)deferredTouchTaskLists;
- (NSMutableSet)touchIgnoredUUIDSet;
- (NSString)layoutTag;
- (NSUUID)activeTouchUUID;
- (NSUUID)shiftKeyTouchUUID;
- (OS_dispatch_queue)deferredTouchTaskListsQueue;
- (SEL)handlerForNotification:(id)a3;
- (UIEdgeInsets)keyplanePadding;
- (UIEvent)currentTouchDownEvent;
- (UIKBCadenceMonitor)cadenceMonitor;
- (UIKBScreenTraits)screenTraits;
- (UIKeyboardLayout)initWithFrame:(CGRect)a3;
- (UIKeyboardLayoutSizeDelegate)sizeDelegate;
- (UIKeyboardTaskQueue)taskQueue;
- (UIKeyboardTypingStyleEstimator)typingStyleEstimator;
- (_UIKBRTFingerDetection)fingerDetection;
- (_UIKBRTRecognizer)handRestRecognizer;
- (_UIKBRTTouchDrifting)touchDrifting;
- (_UIKBRTTouchVelocities)touchVelocities;
- (_UIScreenEdgePanRecognizer)screenEdgePanRecognizer;
- (double)biasedKeyboardWidthRatio;
- (double)flickDistance;
- (double)hitBuffer;
- (double)lastTouchUpTime;
- (double)preferredHeight;
- (double)timestampOfLastTouchesEnded;
- (id)_keyboardLongPressInteractionRegions;
- (id)_touchStateForTouch:(id)a3;
- (id)_uikbrtTouchDrifting:(id)a3 touchIdentifiersForFingerID:(unint64_t)a4;
- (id)activationIndicatorMask;
- (id)activationIndicatorView;
- (id)baseKeyForString:(id)a3;
- (id)candidateList;
- (id)currentKeyplane;
- (id)deferredTaskForActiveTouch;
- (id)deferredTouchDownTask;
- (id)deferredTouchMovedTask;
- (id)getHorizontalOffsetFromHomeRowForRowRelativeToHomeRow:(int64_t)a3;
- (id)getRomanAccentVariantsForString:(id)a3 inputMode:(id)a4 keyboardVariantIndludes:(int)a5;
- (id)handRestRecognizerSilenceNextTouchDown;
- (id)internationalKeyDisplayStringOnEmojiKeyboard;
- (id)keyplaneForKey:(id)a3;
- (id)keyplaneNamed:(id)a3;
- (id)simulateTouch:(CGPoint)a3;
- (id)simulateTouchForCharacter:(id)a3 errorVector:(CGPoint)a4 shouldTypeVariants:(BOOL)a5 baseKeyForVariants:(BOOL)a6;
- (id)touchCancelledTaskForTouchState:(id)a3 forResting:(BOOL)a4;
- (id)touchChangedTaskForTouchState:(id)a3;
- (id)touchDownTaskForTouchState:(id)a3;
- (id)touchDraggedTaskForTouchState:(id)a3;
- (id)touchUUIDsToCommitBeforeTouchUUID:(id)a3;
- (id)touchUpTaskForTouchState:(id)a3;
- (int64_t)currentHandBias;
- (int64_t)idiom;
- (int64_t)orientation;
- (unint64_t)_uikbrtTouchDrifting:(id)a3 fingerIDFortouchIdentifier:(id)a4;
- (unint64_t)cursorLocation;
- (unint64_t)fingerIDForTouchUUID:(id)a3;
- (unint64_t)targetEdgesForScreenGestureRecognition;
- (unint64_t)textEditingKeyMask;
- (unsigned)getHandRestRecognizerState;
- (void)_addTouchToScreenEdgePanRecognizer:(id)a3;
- (void)_clearDeferredTouchTasks;
- (void)_enumerateDeferredTouchUUIDs:(id)a3 withBlock:(id)a4;
- (void)_executeDeferredTouchTasks;
- (void)_ignoreTouchState:(id)a3;
- (void)_removeTouchesFromProcessing:(id)a3;
- (void)_resetFingerDetectionFromLayout;
- (void)_setRequiresExclusiveTouch:(BOOL)a3;
- (void)_touchEndedProcessingForTouches:(id)a3;
- (void)_uikbrtTouchDriftingStateChanged:(id)a3;
- (void)_updateTouchState:(id)a3 errorVector:(CGPoint)a4 rowOffsetFromHomeRow:(int64_t)a5;
- (void)assertSavedLocation:(CGPoint)a3 onTouch:(id)a4 inWindow:(id)a5 resetPrevious:(BOOL)a6;
- (void)cancelTouchesForTwoFingerTapGesture:(id)a3;
- (void)clearShiftIfNecessaryForEndedTouchState:(id)a3;
- (void)commitTouchUUIDs:(id)a3;
- (void)commitTouchUUIDs:(id)a3 cancelInsteadOfUp:(BOOL)a4;
- (void)commitTouches:(id)a3 executionContext:(id)a4;
- (void)deactivateActiveKeys;
- (void)dealloc;
- (void)didCommitTouchState:(id)a3;
- (void)didEndIndirectSelectionGesture;
- (void)didMoveToWindow;
- (void)fadeWithInvocation:(id)a3;
- (void)forceUpdatesForCommittedTouch;
- (void)handRestRecognizerNotifyRestForBegin:(BOOL)a3 location:(CGPoint)a4 timestamp:(double)a5 pathIndex:(int)a6 touchUUID:(id)a7 context:(id)a8;
- (void)recognizer:(id)a3 beginTouchDownForTouchWithId:(id)a4 atPoint:(CGPoint)a5 forBeginState:(unint64_t)a6 whenStateReady:(id)a7;
- (void)recognizer:(id)a3 cancelTouchOnLayoutWithId:(id)a4 startPoint:(CGPoint)a5 endPoint:(CGPoint)a6 whenReady:(id)a7;
- (void)recognizer:(id)a3 continueTrackingIgnoredTouchWithId:(id)a4 currentPoint:(CGPoint)a5 whenReady:(id)a6;
- (void)recognizer:(id)a3 releaseTouchToLayoutWithId:(id)a4 startPoint:(CGPoint)a5 endPoint:(CGPoint)a6 whenReady:(id)a7;
- (void)recognizer:(id)a3 restartTouchDownForTouchWithId:(id)a4 startingAt:(double)a5 atPoint:(CGPoint)a6 currentPoint:(CGPoint)a7 whenStateReady:(id)a8;
- (void)recognizer:(id)a3 shouldContinueTrackingTouchWithId:(id)a4 startingAt:(double)a5 atPoint:(CGPoint)a6 currentPoint:(CGPoint)a7 forContinueState:(unint64_t)a8 whenStateReady:(id)a9;
- (void)recognizer:(id)a3 willIgnoreTouchWithId:(id)a4 startingAt:(double)a5 atPoint:(CGPoint)a6 currentPoint:(CGPoint)a7 whenReady:(id)a8;
- (void)recognizerBlockUntilTaskQueueReadyForceUsingDeferredTask:(BOOL)a3;
- (void)reloadKeyboardGestureRecognition;
- (void)resetHRRLayoutState;
- (void)screenEdgePanRecognizerStateDidChange:(id)a3;
- (void)setActiveTouchUUID:(id)a3;
- (void)setCadenceMonitor:(id)a3;
- (void)setCursorLocation:(unint64_t)a3;
- (void)setDeferredTaskForActiveTouch:(id)a3;
- (void)setDeferredTouchDownTask:(id)a3;
- (void)setDeferredTouchMovedTask:(id)a3;
- (void)setDeferredTouchTaskLists:(id)a3;
- (void)setDeferredTouchTaskListsQueue:(id)a3;
- (void)setDisableInteraction:(BOOL)a3;
- (void)setFingerDetection:(id)a3;
- (void)setHandRestRecognizer:(id)a3;
- (void)setHideKeysUnderIndicator:(BOOL)a3;
- (void)setIgnoringKeyplaneChange:(BOOL)a3;
- (void)setIsExecutingDeferredTouchTasks:(BOOL)a3;
- (void)setLastTouchUpTime:(double)a3;
- (void)setListeningForDidChange:(BOOL)a3;
- (void)setListeningForWillChange:(BOOL)a3;
- (void)setPreferredHeight:(double)a3;
- (void)setScreenEdgePanRecognizer:(id)a3;
- (void)setScreenTraits:(id)a3;
- (void)setShiftKeyTouchUUID:(id)a3;
- (void)setSizeDelegate:(id)a3;
- (void)setTaskQueue:(id)a3;
- (void)setTextEditingTraits:(id)a3;
- (void)setTouchDrifting:(id)a3;
- (void)setTouchIgnoredUUIDSet:(id)a3;
- (void)setTouchVelocities:(id)a3;
- (void)showKeyboardWithInputTraits:(id)a3 screenTraits:(id)a4 splitTraits:(id)a5;
- (void)touchCancelled:(id)a3;
- (void)touchCancelled:(id)a3 executionContext:(id)a4;
- (void)touchCancelled:(id)a3 forResting:(BOOL)a4 executionContext:(id)a5;
- (void)touchChanged:(id)a3;
- (void)touchChanged:(id)a3 executionContext:(id)a4;
- (void)touchDown:(id)a3;
- (void)touchDown:(id)a3 executionContext:(id)a4;
- (void)touchDragged:(id)a3;
- (void)touchDragged:(id)a3 executionContext:(id)a4;
- (void)touchUp:(id)a3;
- (void)touchUp:(id)a3 executionContext:(id)a4;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesEstimatedPropertiesUpdated:(id)a3;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
- (void)updateTouchProcessingForKeyboardChange;
- (void)updateTouchProcessingForKeyplaneChange;
- (void)willBeginIndirectSelectionGesture;
- (void)willMoveToWindow:(id)a3;
@end

@implementation UIKeyboardLayout

+ (CGSize)keyboardSizeForInputMode:(id)a3 screenTraits:(id)a4 keyboardType:(int64_t)a5
{
  double v5 = *MEMORY[0x1E4F1DB30];
  double v6 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v6;
  result.width = v5;
  return result;
}

+ (BOOL)_showSmallDisplayKeyplane
{
  return _AXSLowercaseKeyboardDisplayEnabled() != 0;
}

- (UIKeyboardLayout)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)UIKeyboardLayout;
  v3 = -[UIView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(UIView *)v3 setMultipleTouchEnabled:1];
    [(UIKeyboardLayout *)v4 _setRequiresExclusiveTouch:1];
    double v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uncommittedTouchUUIDs = v4->_uncommittedTouchUUIDs;
    v4->_uncommittedTouchUUIDs = v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.UIKeyboardLayout.deferredTouchTaskLists", 0);
    deferredTouchTaskListsQueue = v4->_deferredTouchTaskListsQueue;
    v4->_deferredTouchTaskListsQueue = (OS_dispatch_queue *)v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    deferredTouchTaskLists = v4->_deferredTouchTaskLists;
    v4->_deferredTouchTaskLists = v9;

    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    touchIgnoredUUIDSet = v4->_touchIgnoredUUIDSet;
    v4->_touchIgnoredUUIDSet = v11;
  }
  return v4;
}

- (void)dealloc
{
  v7[2] = *MEMORY[0x1E4F143B8];
  deferredTouchTaskListsQueue = self->_deferredTouchTaskListsQueue;
  self->_deferredTouchTaskListsQueue = 0;

  [(UIKeyboardLayout *)self setActiveTouchUUID:0];
  [(UIKeyboardLayout *)self setShiftKeyTouchUUID:0];
  [(_UIKBRTRecognizer *)self->_handRestRecognizer setDelegate:0];
  [(_UIScreenEdgePanRecognizer *)self->_screenEdgePanRecognizer setDelegate:0];
  [(UIKeyboardLayout *)self setSizeDelegate:0];
  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v7[0] = @"UIKeyboardPrivateWillChangeFrameNotification";
  v7[1] = @"UIKeyboardPrivateDidChangeFrameNotification";
  double v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  -[NSNotificationCenter _uiRemoveObserver:names:](v4, self, v5);

  v6.receiver = self;
  v6.super_class = (Class)UIKeyboardLayout;
  [(UIView *)&v6 dealloc];
}

- (void)willMoveToWindow:(id)a3
{
  id v14 = a3;
  v4 = [(UIView *)self window];
  double v5 = [v4 screen];

  objc_super v6 = [(UIKBScreenTraits *)self->_screenTraits screen];
  dispatch_queue_t v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [v14 screen];
  }
  v9 = v8;

  if (v5 != v9)
  {
    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v11 = v10;
    if (v5)
    {
      if (self->_listeningForWillChange)
      {
        [v10 removeObserver:self name:@"UIKeyboardPrivateWillChangeFrameNotification" object:v5];
        self->_listeningForWillChange = 0;
      }
      if (self->_listeningForDidChange)
      {
        [v11 removeObserver:self name:@"UIKeyboardPrivateDidChangeFrameNotification" object:v5];
        self->_listeningForDidChange = 0;
      }
    }
    if ([v9 _userInterfaceIdiom] == 1)
    {
      v12 = [(UIKeyboardLayout *)self handlerForNotification:@"UIKeyboardPrivateWillChangeFrameNotification"];
      if (v12)
      {
        self->_listeningForWillChange = 1;
        [v11 addObserver:self selector:v12 name:@"UIKeyboardPrivateWillChangeFrameNotification" object:v9];
      }
      v13 = [(UIKeyboardLayout *)self handlerForNotification:@"UIKeyboardPrivateDidChangeFrameNotification"];
      if (v13)
      {
        self->_listeningForDidChange = 1;
        [v11 addObserver:self selector:v13 name:@"UIKeyboardPrivateDidChangeFrameNotification" object:v9];
      }
    }
  }
}

- (UIKeyboardTaskQueue)taskQueue
{
  taskQueue = self->_taskQueue;
  if (!taskQueue)
  {
    v4 = objc_alloc_init(UIKeyboardTaskQueue);
    double v5 = self->_taskQueue;
    self->_taskQueue = v4;

    taskQueue = self->_taskQueue;
  }
  return taskQueue;
}

- (UIKeyboardTypingStyleEstimator)typingStyleEstimator
{
  typingStyleEstimator = self->_typingStyleEstimator;
  if (!typingStyleEstimator)
  {
    v4 = objc_alloc_init(UIKeyboardTypingStyleEstimator);
    double v5 = self->_typingStyleEstimator;
    self->_typingStyleEstimator = v4;

    typingStyleEstimator = self->_typingStyleEstimator;
  }
  return typingStyleEstimator;
}

- (UIEvent)currentTouchDownEvent
{
  return self->_currentTouchDownEvent;
}

- (void)setTaskQueue:(id)a3
{
  double v5 = (UIKeyboardTaskQueue *)a3;
  if (self->_taskQueue != v5)
  {
    objc_super v6 = v5;
    objc_storeStrong((id *)&self->_taskQueue, a3);
    double v5 = v6;
  }
}

- (int64_t)orientation
{
  return [(UIKBScreenTraits *)self->_screenTraits orientation];
}

- (int64_t)idiom
{
  return [(UIKBScreenTraits *)self->_screenTraits idiom];
}

- (BOOL)isFloating
{
  return [(UIKBScreenTraits *)self->_screenTraits isFloating];
}

- (void)showKeyboardWithInputTraits:(id)a3 screenTraits:(id)a4 splitTraits:(id)a5
{
  dispatch_queue_t v7 = (UITextInputTraits *)a3;
  id v8 = (UIKBScreenTraits *)a4;
  inputTraits = self->_inputTraits;
  self->_inputTraits = v7;
  v11 = v7;

  screenTraits = self->_screenTraits;
  self->_screenTraits = v8;
}

- (void)setTextEditingTraits:(id)a3
{
}

- (unint64_t)textEditingKeyMask
{
  return 0;
}

- (void)deactivateActiveKeys
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = [(UIKeyboardLayout *)self handRestRecognizer];

  if (v3)
  {
    v4 = (void *)[(NSMutableArray *)self->_uncommittedTouchUUIDs copy];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v23;
      v13 = &v20;
      id v14 = &v19;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v23 != v7) {
            objc_enumerationMutation(v5);
          }
          v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if ((!self->_activeTouchUUID
             || (objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "isEqual:", v13, v14) & 1) == 0)
            && (!self->_shiftKeyTouchUUID || (objc_msgSend(v9, "isEqual:") & 1) == 0))
          {
            -[NSMutableArray removeObject:](self->_uncommittedTouchUUIDs, "removeObject:", v9, v13, v14);
            [(NSMutableSet *)self->_touchIgnoredUUIDSet addObject:v9];
            uint64_t v16 = 0;
            v17 = &v16;
            uint64_t v18 = 0x3032000000;
            v19 = __Block_byref_object_copy__134;
            deferredTouchTaskListsQueue = self->_deferredTouchTaskListsQueue;
            v20 = __Block_byref_object_dispose__134;
            id v21 = 0;
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __40__UIKeyboardLayout_deactivateActiveKeys__block_invoke;
            block[3] = &unk_1E52E1B98;
            block[5] = v9;
            block[6] = &v16;
            block[4] = self;
            dispatch_sync(deferredTouchTaskListsQueue, block);
            if (([(id)v17[5] isExecutingFirstTask] & 1) == 0)
            {
              v11 = +[UIKBTouchState touchForTouchUUID:v9];
              if (v11)
              {
                v12 = [(UIKeyboardLayout *)self handRestRecognizer];
                [v12 markTouchProcessed:v11 withIdentifier:v9];
              }
            }
            _Block_object_dispose(&v16, 8);
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v6);
    }
  }
}

void __40__UIKeyboardLayout_deactivateActiveKeys__block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 608) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)usesAutoShift
{
  return 0;
}

- (BOOL)ignoresShiftState
{
  return 0;
}

- (BOOL)isAlphabeticPlane
{
  return 0;
}

- (BOOL)isKanaPlane
{
  return 0;
}

- (BOOL)isDynamicLayout
{
  return 0;
}

- (BOOL)diacriticForwardCompose
{
  return 0;
}

- (BOOL)isShiftKeyBeingHeld
{
  return 0;
}

- (BOOL)isGeometricShiftOrMoreKeyForTouch:(id)a3
{
  return 0;
}

- (BOOL)isShiftKeyPlaneChooser
{
  return 0;
}

- (id)_keyboardLongPressInteractionRegions
{
  return 0;
}

- (BOOL)performReturnAction
{
  return 0;
}

- (BOOL)performSpaceAction
{
  return 0;
}

- (id)candidateList
{
  return 0;
}

- (BOOL)hasCandidateKeys
{
  return 0;
}

- (BOOL)hasAccentKey
{
  return 0;
}

- (BOOL)canMultitap
{
  return 0;
}

- (NSString)layoutTag
{
  return 0;
}

- (id)activationIndicatorView
{
  return 0;
}

- (id)activationIndicatorMask
{
  return 0;
}

- (BOOL)shouldShowIndicator
{
  return 1;
}

- (BOOL)canProduceString:(id)a3
{
  return 0;
}

- (void)_setRequiresExclusiveTouch:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UIView *)self _rootInputWindowController];
  [v4 setExclusiveTouch:v3];
}

- (id)touchDownTaskForTouchState:(id)a3
{
  id v4 = a3;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __47__UIKeyboardLayout_touchDownTaskForTouchState___block_invoke;
  v12 = &unk_1E52E3628;
  v13 = self;
  id v14 = v4;
  id v5 = v4;
  uint64_t v6 = _Block_copy(&v9);
  uint64_t v7 = objc_msgSend(v6, "copy", v9, v10, v11, v12, v13);

  return v7;
}

void __47__UIKeyboardLayout_touchDownTaskForTouchState___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(a1 + 32) + 432);
  id v5 = [*(id *)(a1 + 40) touchUUID];
  uint64_t v6 = [v4 indexOfObject:v5];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    [v3 returnExecutionToParent];
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 40) touchUUID];
    [*(id *)(a1 + 32) setActiveTouchUUID:v7];

    id v8 = [*(id *)(a1 + 32) cadenceMonitor];
    [*(id *)(a1 + 40) timestamp];
    objc_msgSend(v8, "addTypingTouchTime:");

    uint64_t v10 = *(void **)(a1 + 32);
    uint64_t v9 = *(void **)(a1 + 40);
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __47__UIKeyboardLayout_touchDownTaskForTouchState___block_invoke_2;
    uint64_t v16 = &unk_1E52E3628;
    v17 = v10;
    id v11 = v9;
    id v18 = v11;
    v12 = [v3 childWithContinuation:&v13];
    objc_msgSend(v10, "touchDown:executionContext:", v11, v12, v13, v14, v15, v16, v17);
  }
}

void __47__UIKeyboardLayout_touchDownTaskForTouchState___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  CFAbsoluteTimeGetCurrent();
  id v4 = *(void **)(a1 + 40);
  id v5 = *(void **)(*(void *)(a1 + 32) + 608);
  uint64_t v6 = [v4 touchUUID];
  id v8 = [v5 objectForKey:v6];

  [v8 originalStartTime];
  +[_UIKeyboardUsageTracking keyboardPerformanceFromTouchStart:until:](_UIKeyboardUsageTracking, "keyboardPerformanceFromTouchStart:until:");
  uint64_t v7 = [v3 info];
  [v3 returnExecutionToParentWithInfo:v7];
}

- (id)_touchStateForTouch:(id)a3
{
  return +[UIKBTouchState touchStateForTouch:a3];
}

- (void)touchDown:(id)a3
{
  id v4 = a3;
  id v5 = [(UIKeyboardLayout *)self _touchStateForTouch:v4];
  [v5 timestamp];
  uint64_t v7 = v6;
  uint64_t v8 = mach_absolute_time();
  kdebug_trace();
  kac_get_log();
  uint64_t v9 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v9, v5);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v11 = v10;
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1853B0000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v11, "appTouchDown", " enableTelemetry=YES ", buf, 2u);
    }
  }

  v12 = [(UIKeyboardLayout *)self touchDownTaskForTouchState:v5];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __30__UIKeyboardLayout_touchDown___block_invoke;
  aBlock[3] = &unk_1E52FC8D0;
  id v13 = v12;
  id v20 = v13;
  id v14 = v5;
  id v19 = v14;
  uint64_t v21 = v7;
  uint64_t v22 = 0;
  uint64_t v23 = v8;
  v15 = _Block_copy(aBlock);
  BOOL v16 = [(UIKeyboardLayout *)self _shouldAllowKeyboardHandlingIfNecessaryForTouch:v4 phase:0 withTouchState:v14 task:v15];

  if (v16)
  {
    if (qword_1EB2593B0 != -1) {
      dispatch_once(&qword_1EB2593B0, &__block_literal_global_207);
    }
    v17 = [(UIKeyboardLayout *)self taskQueue];
    [v17 addTask:v15 breadcrumb:qword_1EB2593A8];
  }
}

void __30__UIKeyboardLayout_touchDown___block_invoke(uint64_t a1, void *a2)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __30__UIKeyboardLayout_touchDown___block_invoke_2;
  v6[3] = &unk_1E52FC8A8;
  uint64_t v4 = *(void *)(a1 + 40);
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 48);
  long long v9 = *(_OWORD *)(a1 + 56);
  id v5 = [a2 childWithContinuation:v6];
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
}

void __30__UIKeyboardLayout_touchDown___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = mach_absolute_time();
  kdebug_trace();
  kac_get_log();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, *(const void **)(a1 + 32));
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v7 = v6;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)long long v9 = 0;
      _os_signpost_emit_with_name_impl(&dword_1853B0000, v5, OS_SIGNPOST_INTERVAL_END, v7, "appTouchDown", " enableTelemetry=YES ", v9, 2u);
    }
  }

  +[_UIKeyboardDiagnosticCollection _requestTailspinWithDescription:@"KeyboardTouchToPaddleLatency" startMAT:*(void *)(a1 + 56) endMAT:v4 ifExceedsThresholdSec:0.5];
  uint64_t v8 = [v3 info];
  [v3 returnExecutionToParentWithInfo:v8];
}

void __30__UIKeyboardLayout_touchDown___block_invoke_205()
{
  uint64_t v0 = [&__block_literal_global_211 copy];
  v1 = (void *)qword_1EB2593A8;
  qword_1EB2593A8 = v0;
}

uint64_t __30__UIKeyboardLayout_touchDown___block_invoke_2_208(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (void)touchDown:(id)a3 executionContext:(id)a4
{
  objc_msgSend(a4, "returnExecutionToParent", a3);
}

- (id)touchDraggedTaskForTouchState:(id)a3
{
  id v4 = a3;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  os_signpost_id_t v11 = __50__UIKeyboardLayout_touchDraggedTaskForTouchState___block_invoke;
  v12 = &unk_1E52E3628;
  id v13 = self;
  id v14 = v4;
  id v5 = v4;
  os_signpost_id_t v6 = _Block_copy(&v9);
  os_signpost_id_t v7 = objc_msgSend(v6, "copy", v9, v10, v11, v12, v13);

  return v7;
}

void __50__UIKeyboardLayout_touchDraggedTaskForTouchState___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 40);
  id v4 = *(void **)(*(void *)(a1 + 32) + 432);
  id v11 = a2;
  id v5 = [v3 touchUUID];
  uint64_t v6 = [v4 indexOfObject:v5];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    [v11 returnExecutionToParent];
    os_signpost_id_t v7 = v11;
  }
  else
  {
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v10 = [v11 childWithContinuation:&__block_literal_global_213];

    [v9 touchDragged:v8 executionContext:v10];
    os_signpost_id_t v7 = (void *)v10;
  }
}

uint64_t __50__UIKeyboardLayout_touchDraggedTaskForTouchState___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 returnExecutionToParent];
}

- (void)touchDragged:(id)a3
{
  id v4 = a3;
  id v5 = [(UIKeyboardLayout *)self _touchStateForTouch:v4];
  kdebug_trace();
  kac_get_log();
  uint64_t v6 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v6, v5);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v8 = v7;
    if (os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1853B0000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v8, "appTouchDragged", " enableTelemetry=YES ", buf, 2u);
    }
  }

  uint64_t v9 = [(UIKeyboardLayout *)self touchDraggedTaskForTouchState:v5];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __33__UIKeyboardLayout_touchDragged___block_invoke;
  id v18 = &unk_1E52E3B88;
  id v10 = v9;
  id v20 = v10;
  id v11 = v5;
  id v19 = v11;
  v12 = _Block_copy(&v15);
  BOOL v13 = -[UIKeyboardLayout _shouldAllowKeyboardHandlingIfNecessaryForTouch:phase:withTouchState:task:](self, "_shouldAllowKeyboardHandlingIfNecessaryForTouch:phase:withTouchState:task:", v4, 1, v11, v12, v15, v16, v17, v18);

  if (v13)
  {
    if (qword_1EB2593C0 != -1) {
      dispatch_once(&qword_1EB2593C0, &__block_literal_global_216_0);
    }
    id v14 = [(UIKeyboardLayout *)self taskQueue];
    [v14 addTask:v12 breadcrumb:qword_1EB2593B8];
  }
}

void __33__UIKeyboardLayout_touchDragged___block_invoke(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__UIKeyboardLayout_touchDragged___block_invoke_2;
  v5[3] = &unk_1E52E34C8;
  uint64_t v3 = *(void *)(a1 + 40);
  id v6 = *(id *)(a1 + 32);
  id v4 = [a2 childWithContinuation:v5];
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
}

void __33__UIKeyboardLayout_touchDragged___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  kdebug_trace();
  kac_get_log();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v5 = os_signpost_id_make_with_pointer(v4, *(const void **)(a1 + 32));
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v6 = v5;
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)os_signpost_id_t v8 = 0;
      _os_signpost_emit_with_name_impl(&dword_1853B0000, v4, OS_SIGNPOST_INTERVAL_END, v6, "appTouchDragged", " enableTelemetry=YES ", v8, 2u);
    }
  }

  os_signpost_id_t v7 = [v3 info];
  [v3 returnExecutionToParentWithInfo:v7];
}

void __33__UIKeyboardLayout_touchDragged___block_invoke_214()
{
  uint64_t v0 = [&__block_literal_global_219_1 copy];
  v1 = (void *)qword_1EB2593B8;
  qword_1EB2593B8 = v0;
}

uint64_t __33__UIKeyboardLayout_touchDragged___block_invoke_2_217(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (void)touchDragged:(id)a3 executionContext:(id)a4
{
  objc_msgSend(a4, "returnExecutionToParent", a3);
}

- (void)_touchEndedProcessingForTouches:(id)a3
{
  id v4 = a3;
  os_signpost_id_t v5 = [MEMORY[0x1E4F28E60] indexSet];
  uncommittedTouchUUIDs = self->_uncommittedTouchUUIDs;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __52__UIKeyboardLayout__touchEndedProcessingForTouches___block_invoke;
  v15[3] = &unk_1E52FC8F8;
  id v7 = v4;
  id v16 = v7;
  id v8 = v5;
  id v17 = v8;
  id v18 = self;
  [(NSMutableArray *)uncommittedTouchUUIDs enumerateObjectsWithOptions:2 usingBlock:v15];
  if ([v8 count])
  {
    uint64_t v9 = [v8 lastIndex];
    [v8 removeIndex:v9];
    uint64_t v10 = [(NSMutableArray *)self->_uncommittedTouchUUIDs objectAtIndex:v9];
    if (v10)
    {
      id v11 = (void *)v10;
      v12 = +[UIKBTouchState touchForTouchUUID:v10];
      BOOL v13 = [(NSMutableArray *)self->_uncommittedTouchUUIDs objectsAtIndexes:v8];
      [(UIKeyboardLayout *)self commitTouchUUIDs:v13];

      [(UIKeyboardLayout *)self touchUp:v12];
LABEL_7:

      goto LABEL_8;
    }
  }
  if (![(NSMutableArray *)self->_uncommittedTouchUUIDs count])
  {
    id v14 = [(UIKeyboardLayout *)self screenEdgePanRecognizer];

    if (v14)
    {
      [(UIKeyboardLayout *)self _clearDeferredTouchTasks];
      id v11 = [(UIKeyboardLayout *)self screenEdgePanRecognizer];
      [v11 reset];
      goto LABEL_7;
    }
  }
LABEL_8:
}

void __52__UIKeyboardLayout__touchEndedProcessingForTouches___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v10 = a2;
  os_signpost_id_t v5 = +[UIKBTouchState touchForTouchUUID:](UIKBTouchState, "touchForTouchUUID:");
  char v6 = [*(id *)(a1 + 32) containsObject:v5];
  uint64_t v7 = [*(id *)(a1 + 40) count];
  if ((v6 & 1) != 0
    || v7
    && (id v8 = *(void **)(a1 + 48),
        [v5 window],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        LODWORD(v8) = [v8 canForceTouchUUIDCommit:v10 inWindow:v9],
        v9,
        v8))
  {
    [*(id *)(a1 + 40) addIndex:a3];
  }
}

- (id)touchUpTaskForTouchState:(id)a3
{
  id v4 = a3;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __45__UIKeyboardLayout_touchUpTaskForTouchState___block_invoke;
  v12 = &unk_1E52E3628;
  BOOL v13 = self;
  id v14 = v4;
  id v5 = v4;
  char v6 = _Block_copy(&v9);
  uint64_t v7 = objc_msgSend(v6, "copy", v9, v10, v11, v12, v13);

  return v7;
}

void __45__UIKeyboardLayout_touchUpTaskForTouchState___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(a1 + 32) + 432);
  id v5 = [*(id *)(a1 + 40) touchUUID];
  uint64_t v6 = [v4 indexOfObject:v5];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    [v3 returnExecutionToParent];
  }
  else
  {
    [*(id *)(a1 + 32) clearShiftIfNecessaryForEndedTouchState:*(void *)(a1 + 40)];
    id v8 = *(void **)(a1 + 32);
    uint64_t v7 = *(void **)(a1 + 40);
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    BOOL v13 = __45__UIKeyboardLayout_touchUpTaskForTouchState___block_invoke_2;
    id v14 = &unk_1E52E3628;
    uint64_t v15 = v8;
    id v9 = v7;
    id v16 = v9;
    uint64_t v10 = [v3 childWithContinuation:&v11];
    objc_msgSend(v8, "touchUp:executionContext:", v9, v10, v11, v12, v13, v14, v15);
  }
}

void __45__UIKeyboardLayout_touchUpTaskForTouchState___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = a2;
  [v3 didCommitTouchState:v4];
  [*(id *)(a1 + 40) timestamp];
  +[_UIKeyboardUsageTracking keyboardPerformanceFromTouchRelease:v5 until:CFAbsoluteTimeGetCurrent() + *(double *)&sSystemUptimeFromAbsoluteTimeDiff];
  [v6 returnExecutionToParent];
}

- (void)touchUp:(id)a3
{
  id v4 = a3;
  double v5 = [(UIKeyboardLayout *)self _touchStateForTouch:v4];
  [v5 timestamp];
  uint64_t v7 = v6;
  kdebug_trace();
  kac_get_log();
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v8, v5);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v10 = v9;
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1853B0000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "appTouchUp", " enableTelemetry=YES ", buf, 2u);
    }
  }

  uint64_t v11 = [(UIKeyboardLayout *)self touchUpTaskForTouchState:v5];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  id v19 = __28__UIKeyboardLayout_touchUp___block_invoke;
  id v20 = &unk_1E52FC920;
  id v12 = v11;
  id v22 = v12;
  id v13 = v5;
  id v21 = v13;
  uint64_t v23 = v7;
  uint64_t v24 = 0;
  id v14 = _Block_copy(&v17);
  BOOL v15 = -[UIKeyboardLayout _shouldAllowKeyboardHandlingIfNecessaryForTouch:phase:withTouchState:task:](self, "_shouldAllowKeyboardHandlingIfNecessaryForTouch:phase:withTouchState:task:", v4, 3, v13, v14, v17, v18, v19, v20);

  if (v15)
  {
    if (qword_1EB2593D0 != -1) {
      dispatch_once(&qword_1EB2593D0, &__block_literal_global_224_0);
    }
    id v16 = [(UIKeyboardLayout *)self taskQueue];
    [v16 addTask:v14 breadcrumb:qword_1EB2593C8];
  }
}

void __28__UIKeyboardLayout_touchUp___block_invoke(uint64_t a1, void *a2)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __28__UIKeyboardLayout_touchUp___block_invoke_2;
  v6[3] = &unk_1E52E3EB0;
  uint64_t v4 = *(void *)(a1 + 40);
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 56);
  double v5 = [a2 childWithContinuation:v6];
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
}

void __28__UIKeyboardLayout_touchUp___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  kdebug_trace();
  kac_get_log();
  uint64_t v4 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v5 = os_signpost_id_make_with_pointer(v4, *(const void **)(a1 + 32));
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v6 = v5;
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_signpost_emit_with_name_impl(&dword_1853B0000, v4, OS_SIGNPOST_INTERVAL_END, v6, "appTouchUp", " enableTelemetry=YES ", v8, 2u);
    }
  }

  id v7 = [v3 info];
  [v3 returnExecutionToParentWithInfo:v7];
}

void __28__UIKeyboardLayout_touchUp___block_invoke_222()
{
  uint64_t v0 = [&__block_literal_global_227_0 copy];
  v1 = (void *)qword_1EB2593C8;
  qword_1EB2593C8 = v0;
}

uint64_t __28__UIKeyboardLayout_touchUp___block_invoke_2_225(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (void)didCommitTouchState:(id)a3
{
  uncommittedTouchUUIDs = self->_uncommittedTouchUUIDs;
  id v5 = a3;
  os_signpost_id_t v6 = [v5 touchUUID];
  [(NSMutableArray *)uncommittedTouchUUIDs removeObject:v6];

  if (![(NSMutableArray *)self->_uncommittedTouchUUIDs count])
  {
    id v7 = [(UIKeyboardLayout *)self screenEdgePanRecognizer];

    if (v7)
    {
      [(UIKeyboardLayout *)self _clearDeferredTouchTasks];
      uint64_t v8 = [(UIKeyboardLayout *)self screenEdgePanRecognizer];
      [v8 reset];
    }
  }
  [v5 timestamp];
  -[UIKeyboardLayout setLastTouchUpTime:](self, "setLastTouchUpTime:");
  uint64_t v9 = [v5 touchUUID];

  os_signpost_id_t v10 = [(UIKeyboardLayout *)self activeTouchUUID];
  int v11 = [v9 isEqual:v10];

  if (v11)
  {
    [(UIKeyboardLayout *)self setActiveTouchUUID:0];
    id v12 = [(UIKeyboardLayout *)self deferredTaskForActiveTouch];

    if (v12)
    {
      id v13 = [(UIKeyboardLayout *)self deferredTaskForActiveTouch];
      v13[2]();

      [(UIKeyboardLayout *)self setDeferredTaskForActiveTouch:0];
    }
  }
}

- (void)touchUp:(id)a3 executionContext:(id)a4
{
  objc_msgSend(a4, "returnExecutionToParent", a3);
}

- (id)touchCancelledTaskForTouchState:(id)a3 forResting:(BOOL)a4
{
  id v6 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__UIKeyboardLayout_touchCancelledTaskForTouchState_forResting___block_invoke;
  aBlock[3] = &unk_1E52E3560;
  void aBlock[4] = self;
  id v12 = v6;
  BOOL v13 = a4;
  id v7 = v6;
  uint64_t v8 = _Block_copy(aBlock);
  uint64_t v9 = (void *)[v8 copy];

  return v9;
}

void __63__UIKeyboardLayout_touchCancelledTaskForTouchState_forResting___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 432);
  id v5 = [*(id *)(a1 + 40) touchUUID];
  uint64_t v6 = [v4 indexOfObject:v5];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    [v3 returnExecutionToParent];
  }
  else
  {
    [*(id *)(a1 + 32) clearShiftIfNecessaryForEndedTouchState:*(void *)(a1 + 40)];
    uint64_t v8 = *(void **)(a1 + 32);
    id v7 = *(void **)(a1 + 40);
    uint64_t v9 = *(unsigned __int8 *)(a1 + 48);
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    id v14 = __63__UIKeyboardLayout_touchCancelledTaskForTouchState_forResting___block_invoke_2;
    BOOL v15 = &unk_1E52E3628;
    id v16 = v8;
    id v10 = v7;
    id v17 = v10;
    int v11 = [v3 childWithContinuation:&v12];
    objc_msgSend(v8, "touchCancelled:forResting:executionContext:", v10, v9, v11, v12, v13, v14, v15, v16);
  }
}

void __63__UIKeyboardLayout_touchCancelledTaskForTouchState_forResting___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  [v2 didCommitTouchState:v3];
  [v4 returnExecutionToParent];
}

- (void)touchCancelled:(id)a3
{
  id v4 = a3;
  id v8 = [(UIKeyboardLayout *)self _touchStateForTouch:v4];
  id v5 = [(UIKeyboardLayout *)self touchCancelledTaskForTouchState:v8 forResting:0];
  BOOL v6 = [(UIKeyboardLayout *)self _shouldAllowKeyboardHandlingIfNecessaryForTouch:v4 phase:4 withTouchState:v8 task:v5];

  if (v6)
  {
    if (qword_1EB2593E0 != -1) {
      dispatch_once(&qword_1EB2593E0, &__block_literal_global_229_0);
    }
    id v7 = [(UIKeyboardLayout *)self taskQueue];
    [v7 addTask:v5 breadcrumb:qword_1EB2593D8];
  }
}

void __35__UIKeyboardLayout_touchCancelled___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_231 copy];
  v1 = (void *)qword_1EB2593D8;
  qword_1EB2593D8 = v0;
}

uint64_t __35__UIKeyboardLayout_touchCancelled___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (void)touchCancelled:(id)a3 executionContext:(id)a4
{
}

- (void)touchCancelled:(id)a3 forResting:(BOOL)a4 executionContext:(id)a5
{
  objc_msgSend(a5, "returnExecutionToParent", a3, a4);
}

- (void)touchChanged:(id)a3 executionContext:(id)a4
{
  objc_msgSend(a4, "returnExecutionToParent", a3);
}

- (id)touchChangedTaskForTouchState:(id)a3
{
  id v4 = a3;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  int v11 = __50__UIKeyboardLayout_touchChangedTaskForTouchState___block_invoke;
  uint64_t v12 = &unk_1E52E3628;
  uint64_t v13 = self;
  id v14 = v4;
  id v5 = v4;
  BOOL v6 = _Block_copy(&v9);
  id v7 = objc_msgSend(v6, "copy", v9, v10, v11, v12, v13);

  return v7;
}

void __50__UIKeyboardLayout_touchChangedTaskForTouchState___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 40);
  id v4 = *(void **)(*(void *)(a1 + 32) + 432);
  id v7 = a2;
  id v5 = [v3 touchUUID];
  uint64_t v6 = [v4 indexOfObject:v5];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    [v7 returnExecutionToParent];
  }
  else {
    [*(id *)(a1 + 32) touchChanged:*(void *)(a1 + 40) executionContext:v7];
  }
}

- (void)touchChanged:(id)a3
{
  id v6 = [(UIKeyboardLayout *)self _touchStateForTouch:a3];
  id v4 = -[UIKeyboardLayout touchChangedTaskForTouchState:](self, "touchChangedTaskForTouchState:");
  if (qword_1EB2593F0 != -1) {
    dispatch_once(&qword_1EB2593F0, &__block_literal_global_233_0);
  }
  id v5 = [(UIKeyboardLayout *)self taskQueue];
  [v5 addTask:v4 breadcrumb:qword_1EB2593E8];
}

void __33__UIKeyboardLayout_touchChanged___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_235 copy];
  v1 = (void *)qword_1EB2593E8;
  qword_1EB2593E8 = v0;
}

uint64_t __33__UIKeyboardLayout_touchChanged___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  if ([(UIKeyboardLayout *)v8 _shouldAllowKeyboardHandlingForTouchesBegan:v6 withEvent:v7])
  {
    p_currentTouchDownEvent = (void **)&v8->_currentTouchDownEvent;
    id v25 = v7;
    objc_storeStrong((id *)&v8->_currentTouchDownEvent, a4);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = v6;
    uint64_t v9 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (!v9) {
      goto LABEL_19;
    }
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v28;
    while (1)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v14 = +[UIKBTouchState touchUUIDForTouch:](UIKBTouchState, "touchUUIDForTouch:", v13, p_currentTouchDownEvent);
        [(NSMutableArray *)v8->_uncommittedTouchUUIDs addObject:v14];
        unint64_t v15 = UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL;
        BOOL v16 = +[UIKeyboardImpl isFloating];
        if (v15 == 1)
        {
          [(UIKeyboardLayout *)v8 hasActiveContinuousPathInput];
        }
        else
        {
          int v21 = _AXSZoomTouchEnabled();
          if (![(UIKeyboardLayout *)v8 hasActiveContinuousPathInput] && !v21)
          {
            id v17 = [(UIKeyboardLayout *)v8 touchUUIDsToCommitBeforeTouchUUID:v14];
            uint64_t v18 = v8;
            id v19 = v17;
            uint64_t v20 = 0;
            goto LABEL_14;
          }
        }
        if (!v16) {
          goto LABEL_15;
        }
        id v17 = [(UIKeyboardLayout *)v8 touchUUIDsToCommitBeforeTouchUUID:v14];
        uint64_t v18 = v8;
        id v19 = v17;
        uint64_t v20 = 1;
LABEL_14:
        [(UIKeyboardLayout *)v18 commitTouchUUIDs:v19 cancelInsteadOfUp:v20];

LABEL_15:
        id v22 = [v13 window];

        if (v22) {
          [(UIKeyboardLayout *)v8 touchDown:v13];
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (!v10)
      {
LABEL_19:

        uint64_t v23 = *p_currentTouchDownEvent;
        *p_currentTouchDownEvent = 0;

        id v7 = v25;
        break;
      }
    }
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = self;
  if ([(UIKeyboardLayout *)v7 _shouldAllowKeyboardHandlingForTouchesMoved:v6 withEvent:a4])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          -[UIKeyboardLayout touchDragged:](v7, "touchDragged:", *(void *)(*((void *)&v13 + 1) + 8 * v12++), (void)v13);
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }
  }
}

- (void)clearShiftIfNecessaryForEndedTouchState:(id)a3
{
  id v4 = [a3 touchUUID];
  int v5 = [v4 isEqual:self->_shiftKeyTouchUUID];

  if (v5)
  {
    id v6 = +[UIKeyboardImpl sharedInstance];
    if (self->_shiftKeyTouchUUID != self->_activeTouchUUID) {
      [v6 setShift:0];
    }
    [(UIKeyboardLayout *)self setShiftKeyTouchUUID:0];
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [v7 timestamp];
  self->_timestampOfLastTouchesEnded = v8;
  uint64_t v9 = self;
  if ([(UIKeyboardLayout *)v9 _shouldAllowKeyboardHandlingForTouchesEndedOrCancelled:v6 withEvent:v7])
  {
    uint64_t v10 = [(UIKeyboardLayout *)v9 handRestRecognizer];

    if (v10)
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v11 = v6;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v17;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v17 != v14) {
              objc_enumerationMutation(v11);
            }
            -[UIKeyboardLayout touchUp:](v9, "touchUp:", *(void *)(*((void *)&v16 + 1) + 8 * v15++), (void)v16);
          }
          while (v13 != v15);
          uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v13);
      }
    }
    else
    {
      [(UIKeyboardLayout *)v9 _touchEndedProcessingForTouches:v6];
    }
  }
  else
  {
    [(UIKeyboardLayout *)v9 _removeTouchesFromProcessing:v6];
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = self;
  if (![(UIKeyboardLayout *)v7 _shouldAllowKeyboardHandlingForTouchesEndedOrCancelled:v6 withEvent:a4])
  {
    [(UIKeyboardLayout *)v7 _removeTouchesFromProcessing:v6];
    goto LABEL_27;
  }
  uint64_t v32 = [MEMORY[0x1E4F1CA48] array];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v31 = v6;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v39 objects:v44 count:16];
  uint64_t v10 = &OBJC_IVAR___UIInputWindowControllerHostingItem__cachedScrollDismissController;
  if (!v9) {
    goto LABEL_15;
  }
  uint64_t v11 = v9;
  uint64_t v12 = *(void *)v40;
  do
  {
    uint64_t v13 = 0;
    do
    {
      if (*(void *)v40 != v12) {
        objc_enumerationMutation(v8);
      }
      uint64_t v14 = [(UIKeyboardLayout *)v7 _touchStateForTouch:*(void *)(*((void *)&v39 + 1) + 8 * v13)];
      uint64_t v15 = v14;
      if (v14)
      {
        long long v16 = *(Class *)((char *)&v7->super.super.super.isa + v10[148]);
        long long v17 = [v14 touchUUID];
        if ([v16 containsObject:v17])
        {

LABEL_11:
          uint64_t v21 = [v15 touchUUID];
          [v32 addObject:v21];

          goto LABEL_13;
        }
        touchIgnoredUUIDSet = v7->_touchIgnoredUUIDSet;
        [v15 touchUUID];
        v20 = long long v19 = v10;
        LODWORD(touchIgnoredUUIDSet) = [(NSMutableSet *)touchIgnoredUUIDSet containsObject:v20];

        uint64_t v10 = v19;
        if (touchIgnoredUUIDSet) {
          goto LABEL_11;
        }
        deferredTouchTaskListsQueue = v7->_deferredTouchTaskListsQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __47__UIKeyboardLayout_touchesCancelled_withEvent___block_invoke;
        block[3] = &unk_1E52D9F98;
        block[4] = v7;
        id v38 = v15;
        dispatch_sync(deferredTouchTaskListsQueue, block);
      }
LABEL_13:

      ++v13;
    }
    while (v11 != v13);
    uint64_t v11 = [v8 countByEnumeratingWithState:&v39 objects:v44 count:16];
  }
  while (v11);
LABEL_15:

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v23 = v32;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v34;
    do
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v34 != v26) {
          objc_enumerationMutation(v23);
        }
        long long v28 = +[UIKBTouchState touchForTouchUUID:*(void *)(*((void *)&v33 + 1) + 8 * v27)];
        [(UIKeyboardLayout *)v7 touchCancelled:v28];

        ++v27;
      }
      while (v25 != v27);
      uint64_t v25 = [v23 countByEnumeratingWithState:&v33 objects:v43 count:16];
    }
    while (v25);
  }

  if (![*(id *)((char *)&v7->super.super.super.isa + v10[148]) count])
  {
    long long v29 = [(UIKeyboardLayout *)v7 screenEdgePanRecognizer];

    if (v29)
    {
      [(UIKeyboardLayout *)v7 _clearDeferredTouchTasks];
      long long v30 = [(UIKeyboardLayout *)v7 screenEdgePanRecognizer];
      [v30 reset];
    }
  }

  id v6 = v31;
LABEL_27:
}

void __47__UIKeyboardLayout_touchesCancelled_withEvent___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 608);
  uint64_t v3 = [*(id *)(a1 + 40) touchUUID];
  id v7 = [v2 objectForKey:v3];

  if (v7)
  {
    id v4 = *(void **)(a1 + 40);
    int v5 = *(void **)(*(void *)(a1 + 32) + 608);
    id v6 = [v4 touchUUID];
    [v5 removeObjectForKey:v6];
  }
}

- (void)touchesEstimatedPropertiesUpdated:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = self;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v4);
        }
        [(UIKeyboardLayout *)v5 touchChanged:*(void *)(*((void *)&v10 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_removeTouchesFromProcessing:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id obj = a3;
  if (*(_OWORD *)&self->_handRestRecognizer != 0 || self->_touchDrifting)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v4 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v27 != v6) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          uint64_t v9 = [(UIKeyboardLayout *)self _touchStateForTouch:v8];
          long long v10 = v9;
          if (v9)
          {
            handRestRecognizer = self->_handRestRecognizer;
            long long v12 = [v9 touchUUID];
            [(_UIKBRTRecognizer *)handRestRecognizer markTouchProcessed:v8 withIdentifier:v12];

            fingerDetection = self->_fingerDetection;
            uint64_t v14 = [v10 touchUUID];
            [(_UIKBRTFingerDetection *)fingerDetection removeTouchWithIdentifier:v14 touchCancelled:1];

            touchDrifting = self->_touchDrifting;
            long long v16 = [v10 touchUUID];
            [(_UIKBRTTouchDrifting *)touchDrifting removeTouchWithIdentifier:v16 touchCancelled:1];

            [v10 locationInWindow];
            -[UIView convertPoint:fromView:](self, "convertPoint:fromView:", 0);
            double v18 = v17;
            double v20 = v19;
            [v10 timestamp];
            double v22 = v21;
            uint64_t v23 = [v10 pathIndex];
            uint64_t v24 = [v10 touchUUID];
            -[UIKeyboardLayout handRestRecognizerNotifyRestForBegin:location:timestamp:pathIndex:touchUUID:context:](self, "handRestRecognizerNotifyRestForBegin:location:timestamp:pathIndex:touchUUID:context:", 0, v23, v24, 0, v18, v20, v22);
          }
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v5);
    }
  }
}

- (id)touchUUIDsToCommitBeforeTouchUUID:(id)a3
{
  id v4 = a3;
  if ([(NSMutableArray *)self->_uncommittedTouchUUIDs indexOfObject:v4] == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uncommittedTouchUUIDs = self->_uncommittedTouchUUIDs;
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    long long v11 = __54__UIKeyboardLayout_touchUUIDsToCommitBeforeTouchUUID___block_invoke;
    long long v12 = &unk_1E52FC948;
    id v13 = v4;
    uint64_t v14 = self;
    uint64_t v7 = [(NSMutableArray *)uncommittedTouchUUIDs indexesOfObjectsPassingTest:&v9];
    uint64_t v5 = -[NSMutableArray objectsAtIndexes:](self->_uncommittedTouchUUIDs, "objectsAtIndexes:", v7, v9, v10, v11, v12);
  }
  return v5;
}

uint64_t __54__UIKeyboardLayout_touchUUIDsToCommitBeforeTouchUUID___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if ([v6 isEqual:*(void *)(a1 + 32)])
  {
    uint64_t v7 = 0;
    *a4 = 1;
  }
  else
  {
    uint64_t v8 = +[UIKBTouchState touchForTouchUUID:v6];
    uint64_t v9 = *(void **)(a1 + 40);
    uint64_t v10 = [v8 window];
    uint64_t v7 = [v9 canForceTouchUUIDCommit:v6 inWindow:v10];
  }
  return v7;
}

- (void)commitTouchUUIDs:(id)a3 cancelInsteadOfUp:(BOOL)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__UIKeyboardLayout_commitTouchUUIDs_cancelInsteadOfUp___block_invoke;
  v4[3] = &unk_1E52FC998;
  v4[4] = self;
  BOOL v5 = a4;
  [a3 enumerateObjectsUsingBlock:v4];
}

void __55__UIKeyboardLayout_commitTouchUUIDs_cancelInsteadOfUp___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[UIKBTouchState touchForTouchUUID:v3];
  BOOL v5 = [v4 window];

  if (!v5)
  {
    id v6 = [*(id *)(a1 + 32) window];
    [v4 setWindow:v6];
  }
  uint64_t v7 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 40)) {
    [v7 touchCancelled:v4];
  }
  else {
    [v7 touchUp:v4];
  }
  objc_initWeak(&location, *(id *)(a1 + 32));
  if (qword_1EB259400 != -1) {
    dispatch_once(&qword_1EB259400, &__block_literal_global_239);
  }
  uint64_t v8 = [*(id *)(a1 + 32) taskQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__UIKeyboardLayout_commitTouchUUIDs_cancelInsteadOfUp___block_invoke_4;
  v9[3] = &unk_1E52FC970;
  objc_copyWeak(&v10, &location);
  [v8 addTask:v9 breadcrumb:qword_1EB2593F8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __55__UIKeyboardLayout_commitTouchUUIDs_cancelInsteadOfUp___block_invoke_2()
{
  uint64_t v0 = [&__block_literal_global_241 copy];
  v1 = (void *)qword_1EB2593F8;
  qword_1EB2593F8 = v0;
}

uint64_t __55__UIKeyboardLayout_commitTouchUUIDs_cancelInsteadOfUp___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __55__UIKeyboardLayout_commitTouchUUIDs_cancelInsteadOfUp___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained forceUpdatesForCommittedTouch];
  [v3 returnExecutionToParent];
}

- (void)commitTouchUUIDs:(id)a3
{
}

- (void)forceUpdatesForCommittedTouch
{
  id v2 = +[UIKeyboardImpl sharedInstance];
  [v2 forceShiftUpdateIfKeyboardStateChanged];
}

- (void)commitTouches:(id)a3 executionContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    uint64_t v8 = [v6 objectAtIndex:0];
    uint64_t v9 = objc_msgSend(v6, "subarrayWithRange:", 1, objc_msgSend(v6, "count") - 1);
    id v10 = [v8 window];

    if (!v10)
    {
      long long v11 = [(UIView *)self window];
      [v8 setWindow:v11];
    }
    long long v12 = [(UIKeyboardLayout *)self _touchStateForTouch:v8];
    uncommittedTouchUUIDs = self->_uncommittedTouchUUIDs;
    uint64_t v14 = [v12 touchUUID];
    uint64_t v15 = [(NSMutableArray *)uncommittedTouchUUIDs indexOfObject:v14];

    if (v15 == 0x7FFFFFFFFFFFFFFFLL)
    {
      [(UIKeyboardLayout *)self commitTouches:v9 executionContext:v7];
    }
    else
    {
      [(UIKeyboardLayout *)self clearShiftIfNecessaryForEndedTouchState:v12];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __51__UIKeyboardLayout_commitTouches_executionContext___block_invoke;
      v18[3] = &unk_1E52E3678;
      v18[4] = self;
      id v16 = v12;
      id v19 = v16;
      id v20 = v9;
      double v17 = [v7 childWithContinuation:v18];
      [(UIKeyboardLayout *)self touchUp:v16 executionContext:v17];
    }
  }
  else
  {
    [v7 returnExecutionToParent];
  }
}

void __51__UIKeyboardLayout_commitTouches_executionContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  [v3 didCommitTouchState:v4];
  [*(id *)(a1 + 32) forceUpdatesForCommittedTouch];
  [*(id *)(a1 + 32) commitTouches:*(void *)(a1 + 48) executionContext:v5];
}

- (BOOL)canForceTouchUUIDCommit:(id)a3 inWindow:(id)a4
{
  return 1;
}

- (void)_enumerateDeferredTouchUUIDs:(id)a3 withBlock:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(UIKeyboardLayout *)self setIsExecutingDeferredTouchTasks:1];
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  long long v27 = __Block_byref_object_copy__134;
  long long v28 = __Block_byref_object_dispose__134;
  id v29 = 0;
  deferredTouchTaskListsQueue = self->_deferredTouchTaskListsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__UIKeyboardLayout__enumerateDeferredTouchUUIDs_withBlock___block_invoke;
  block[3] = &unk_1E52E1B98;
  uint64_t v23 = &v24;
  block[4] = self;
  id v9 = v6;
  id v22 = v9;
  dispatch_sync(deferredTouchTaskListsQueue, block);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = (id)v25[5];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v30 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8 * v13);
        uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", (void)v17);
        BOOL v16 = v14 == v15;

        if (!v16)
        {
          while ([v14 hasTasks]
               && ([v14 executeTasksInView:self withBlock:v7] & 1) == 0)
            ;
        }
        ++v13;
      }
      while (v13 != v11);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v30 count:16];
    }
    while (v11);
  }

  [(UIKeyboardLayout *)self setIsExecutingDeferredTouchTasks:0];
  _Block_object_dispose(&v24, 8);
}

void __59__UIKeyboardLayout__enumerateDeferredTouchUUIDs_withBlock___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 608);
  id v7 = [*(id *)(a1 + 40) allObjects];
  id v3 = [MEMORY[0x1E4F1CA98] null];
  uint64_t v4 = [v2 objectsForKeys:v7 notFoundMarker:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)recognizerBlockUntilTaskQueueReadyForceUsingDeferredTask:(BOOL)a3
{
  if (pthread_main_np() == 1)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"UIKeyboardLayout.m" lineNumber:1507 description:@"Must be called off the main thread"];

    if (!a3)
    {
LABEL_3:
      id v6 = [(UIKeyboardLayout *)self taskQueue];
      int v7 = [v6 isMainThreadExecutingTask];

      if (!v7) {
        return;
      }
    }
  }
  else if (!a3)
  {
    goto LABEL_3;
  }
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  if (qword_1EB259410 != -1) {
    dispatch_once(&qword_1EB259410, &__block_literal_global_251_0);
  }
  id v9 = [(UIKeyboardLayout *)self taskQueue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __77__UIKeyboardLayout_recognizerBlockUntilTaskQueueReadyForceUsingDeferredTask___block_invoke_3;
  v14[3] = &unk_1E52E34C8;
  dispatch_semaphore_t v15 = v8;
  uint64_t v10 = qword_1EB259408;
  uint64_t v11 = v8;
  [v9 addDeferredTask:v14 breadcrumb:v10];

  dispatch_time_t v12 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v11, v12);
}

void __77__UIKeyboardLayout_recognizerBlockUntilTaskQueueReadyForceUsingDeferredTask___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_253 copy];
  v1 = (void *)qword_1EB259408;
  qword_1EB259408 = v0;
}

uint64_t __77__UIKeyboardLayout_recognizerBlockUntilTaskQueueReadyForceUsingDeferredTask___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __77__UIKeyboardLayout_recognizerBlockUntilTaskQueueReadyForceUsingDeferredTask___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = *(NSObject **)(a1 + 32);
  id v3 = a2;
  dispatch_semaphore_signal(v2);
  [v3 returnExecutionToParent];
}

- (void)recognizer:(id)a3 beginTouchDownForTouchWithId:(id)a4 atPoint:(CGPoint)a5 forBeginState:(unint64_t)a6 whenStateReady:(id)a7
{
  CGFloat y = a5.y;
  CGFloat x = a5.x;
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  id v16 = [(UIKeyboardLayout *)self handRestRecognizer];

  if (v16 == v13)
  {
    v36[0] = 0;
    v36[1] = v36;
    v36[2] = 0x2020000000;
    char v37 = 1;
    long long v17 = (void *)[v15 copy];
    id v18 = v14;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __97__UIKeyboardLayout_recognizer_beginTouchDownForTouchWithId_atPoint_forBeginState_whenStateReady___block_invoke;
    block[3] = &unk_1E52FC9E8;
    block[4] = self;
    id v19 = v18;
    uint64_t v32 = v36;
    unint64_t v33 = a6;
    id v31 = v19;
    CGFloat v34 = x;
    CGFloat v35 = y;
    dispatch_sync(MEMORY[0x1E4F14428], block);
    [(UIKeyboardLayout *)self recognizerBlockUntilTaskQueueReadyForceUsingDeferredTask:1];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __97__UIKeyboardLayout_recognizer_beginTouchDownForTouchWithId_atPoint_forBeginState_whenStateReady___block_invoke_5;
    v22[3] = &unk_1E52FCA60;
    uint64_t v26 = v36;
    unint64_t v27 = a6;
    v22[4] = self;
    CGFloat v28 = x;
    CGFloat v29 = y;
    id v24 = v19;
    id v25 = v17;
    id v23 = v24;
    id v20 = v17;
    double v21 = (void *)MEMORY[0x1E4F14428];
    dispatch_sync(MEMORY[0x1E4F14428], v22);

    _Block_object_dispose(v36, 8);
  }
  else
  {
    (*((void (**)(id, id, void))v15 + 2))(v15, v14, 0);
  }
}

void __97__UIKeyboardLayout_recognizer_beginTouchDownForTouchWithId_atPoint_forBeginState_whenStateReady___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [MEMORY[0x1E4F1CAD0] setWithObject:*(void *)(a1 + 40)];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __97__UIKeyboardLayout_recognizer_beginTouchDownForTouchWithId_atPoint_forBeginState_whenStateReady___block_invoke_2;
  void v7[3] = &unk_1E52FC9C0;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 56);
  v7[4] = v4;
  long long v6 = *(_OWORD *)(a1 + 40);
  id v5 = (id)v6;
  long long v8 = v6;
  long long v10 = *(_OWORD *)(a1 + 64);
  [v2 _enumerateDeferredTouchUUIDs:v3 withBlock:v7];
}

void __97__UIKeyboardLayout_recognizer_beginTouchDownForTouchWithId_atPoint_forBeginState_whenStateReady___block_invoke_2(uint64_t a1, void *a2, void *a3, BOOL *a4)
{
  id v11 = a2;
  id v7 = a3;
  uint64_t v8 = [v11 phase];
  *a4 = v8 != 0;
  if (!v8)
  {
    if (*(void *)(a1 + 56))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "queryShouldNeverIgnoreTouchStateWithIdentifier:touchState:startPoint:forRestingState:", *(void *)(a1 + 40), v11, 2, *(double *)(a1 + 64), *(double *)(a1 + 72));
      uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
      if (*(unsigned char *)(v9 + 24) || *(void *)(a1 + 56) == 2)
      {
        *(unsigned char *)(v9 + 24) = 1;
        if (qword_1EB259420 != -1) {
          dispatch_once(&qword_1EB259420, &__block_literal_global_256_0);
        }
        long long v10 = [*(id *)(a1 + 32) taskQueue];
        [v10 addTask:v7 breadcrumb:qword_1EB259418];
      }
    }
  }
}

void __97__UIKeyboardLayout_recognizer_beginTouchDownForTouchWithId_atPoint_forBeginState_whenStateReady___block_invoke_3()
{
  uint64_t v0 = [&__block_literal_global_258_1 copy];
  v1 = (void *)qword_1EB259418;
  qword_1EB259418 = v0;
}

uint64_t __97__UIKeyboardLayout_recognizer_beginTouchDownForTouchWithId_atPoint_forBeginState_whenStateReady___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __97__UIKeyboardLayout_recognizer_beginTouchDownForTouchWithId_atPoint_forBeginState_whenStateReady___block_invoke_5(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) || !*(void *)(a1 + 72))
  {
    uint64_t v36 = 0;
    char v37 = &v36;
    uint64_t v38 = 0x3032000000;
    long long v39 = __Block_byref_object_copy__134;
    long long v40 = __Block_byref_object_dispose__134;
    id v41 = 0;
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = *(NSObject **)(v2 + 616);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __97__UIKeyboardLayout_recognizer_beginTouchDownForTouchWithId_atPoint_forBeginState_whenStateReady___block_invoke_6;
    block[3] = &unk_1E52E1B98;
    CGFloat v35 = &v36;
    block[4] = v2;
    id v34 = *(id *)(a1 + 40);
    dispatch_sync(v3, block);
    [(id)v37[5] setIgnoredOnBegin:1];
    objc_initWeak(&location, *(id *)(a1 + 32));
    if (![*(id *)(*(void *)(a1 + 32) + 624) containsObject:*(void *)(a1 + 40)]
      || [*(id *)(*(void *)(a1 + 32) + 432) containsObject:*(void *)(a1 + 40)])
    {
      uint64_t v4 = +[UIKBTouchState touchForTouchUUID:*(void *)(a1 + 40)];
      if (qword_1EB259430 != -1) {
        dispatch_once(&qword_1EB259430, &__block_literal_global_261_1);
      }
      id v5 = [*(id *)(a1 + 32) taskQueue];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __97__UIKeyboardLayout_recognizer_beginTouchDownForTouchWithId_atPoint_forBeginState_whenStateReady___block_invoke_9;
      v28[3] = &unk_1E52E3B10;
      objc_copyWeak(&v31, &location);
      id v29 = *(id *)(a1 + 40);
      id v6 = v4;
      id v30 = v6;
      [v5 addTask:v28 breadcrumb:qword_1EB259428];

      objc_destroyWeak(&v31);
    }
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = [MEMORY[0x1E4F1CAD0] setWithObject:*(void *)(a1 + 40)];
    [v7 _enumerateDeferredTouchUUIDs:v8 withBlock:0];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    double Current = CFAbsoluteTimeGetCurrent();
    double v10 = *(double *)&sSystemUptimeFromAbsoluteTimeDiff;
    uint64_t v11 = [(id)v37[5] pathIndex];
    dispatch_time_t v12 = [(id)v37[5] touchUUID];
    if (qword_1EB259440 != -1) {
      dispatch_once(&qword_1EB259440, &__block_literal_global_267_0);
    }
    id v13 = [*(id *)(a1 + 32) taskQueue];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __97__UIKeyboardLayout_recognizer_beginTouchDownForTouchWithId_atPoint_forBeginState_whenStateReady___block_invoke_12;
    v22[3] = &unk_1E52FCA10;
    objc_copyWeak(&v24, &location);
    long long v25 = *(_OWORD *)(a1 + 80);
    double v26 = Current + v10;
    uint64_t v27 = v11;
    id v14 = v12;
    id v23 = v14;
    [v13 addTask:v22 breadcrumb:qword_1EB259438];

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);

    _Block_object_dispose(&v36, 8);
  }
  if (qword_1EB259450 != -1) {
    dispatch_once(&qword_1EB259450, &__block_literal_global_275_0);
  }
  id v15 = [*(id *)(a1 + 32) taskQueue];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __97__UIKeyboardLayout_recognizer_beginTouchDownForTouchWithId_atPoint_forBeginState_whenStateReady___block_invoke_16;
  v18[3] = &unk_1E52FCA38;
  id v20 = *(id *)(a1 + 56);
  id v16 = *(id *)(a1 + 48);
  uint64_t v17 = *(void *)(a1 + 64);
  id v19 = v16;
  uint64_t v21 = v17;
  [v15 addTask:v18 breadcrumb:qword_1EB259448];
}

void __97__UIKeyboardLayout_recognizer_beginTouchDownForTouchWithId_atPoint_forBeginState_whenStateReady___block_invoke_6(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 608) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __97__UIKeyboardLayout_recognizer_beginTouchDownForTouchWithId_atPoint_forBeginState_whenStateReady___block_invoke_7()
{
  uint64_t v0 = [&__block_literal_global_263_1 copy];
  v1 = (void *)qword_1EB259428;
  qword_1EB259428 = v0;
}

uint64_t __97__UIKeyboardLayout_recognizer_beginTouchDownForTouchWithId_atPoint_forBeginState_whenStateReady___block_invoke_8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __97__UIKeyboardLayout_recognizer_beginTouchDownForTouchWithId_atPoint_forBeginState_whenStateReady___block_invoke_9(uint64_t a1, void *a2)
{
  uint64_t v3 = (id *)(a1 + 48);
  id v4 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained(v3);
  [WeakRetained[54] removeObject:*(void *)(a1 + 32)];
  [WeakRetained[78] addObject:*(void *)(a1 + 32)];
  [WeakRetained[67] explicitlyIgnoreTouch:*(void *)(a1 + 40) withIdentifier:*(void *)(a1 + 32)];
  [v4 returnExecutionToParent];
}

void __97__UIKeyboardLayout_recognizer_beginTouchDownForTouchWithId_atPoint_forBeginState_whenStateReady___block_invoke_10()
{
  uint64_t v0 = [&__block_literal_global_269_0 copy];
  v1 = (void *)qword_1EB259438;
  qword_1EB259438 = v0;
}

uint64_t __97__UIKeyboardLayout_recognizer_beginTouchDownForTouchWithId_atPoint_forBeginState_whenStateReady___block_invoke_11(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __97__UIKeyboardLayout_recognizer_beginTouchDownForTouchWithId_atPoint_forBeginState_whenStateReady___block_invoke_12(uint64_t a1, void *a2)
{
  uint64_t v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  double v5 = *(double *)(a1 + 64);
  uint64_t v6 = *(unsigned int *)(a1 + 72);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = [v4 childWithContinuation:&__block_literal_global_271];

  objc_msgSend(WeakRetained, "handRestRecognizerNotifyRestForBegin:location:timestamp:pathIndex:touchUUID:context:", 1, v6, v7, v8, *(double *)(a1 + 48), *(double *)(a1 + 56), v5);
}

uint64_t __97__UIKeyboardLayout_recognizer_beginTouchDownForTouchWithId_atPoint_forBeginState_whenStateReady___block_invoke_13(uint64_t a1, void *a2)
{
  return [a2 returnExecutionToParent];
}

void __97__UIKeyboardLayout_recognizer_beginTouchDownForTouchWithId_atPoint_forBeginState_whenStateReady___block_invoke_14()
{
  uint64_t v0 = [&__block_literal_global_277_0 copy];
  v1 = (void *)qword_1EB259448;
  qword_1EB259448 = v0;
}

uint64_t __97__UIKeyboardLayout_recognizer_beginTouchDownForTouchWithId_atPoint_forBeginState_whenStateReady___block_invoke_15(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __97__UIKeyboardLayout_recognizer_beginTouchDownForTouchWithId_atPoint_forBeginState_whenStateReady___block_invoke_16(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v2 = a1[5];
  uint64_t v4 = *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24);
  double v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  id v6 = a2;
  v5(v2, v3, v4);
  [v6 returnExecutionToParent];
}

- (void)recognizer:(id)a3 restartTouchDownForTouchWithId:(id)a4 startingAt:(double)a5 atPoint:(CGPoint)a6 currentPoint:(CGPoint)a7 whenStateReady:(id)a8
{
  CGFloat y = a7.y;
  CGFloat x = a7.x;
  CGFloat v11 = a6.y;
  CGFloat v12 = a6.x;
  id v16 = a4;
  id v17 = a8;
  id v18 = a3;
  id v19 = [(UIKeyboardLayout *)self handRestRecognizer];

  if (v19 == v18)
  {
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x2020000000;
    char v30 = 1;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __109__UIKeyboardLayout_recognizer_restartTouchDownForTouchWithId_startingAt_atPoint_currentPoint_whenStateReady___block_invoke;
    block[3] = &unk_1E52FCAB0;
    block[4] = self;
    double v24 = a5;
    CGFloat v25 = v12;
    id v21 = v16;
    id v23 = v29;
    CGFloat v26 = v11;
    CGFloat v27 = x;
    CGFloat v28 = y;
    id v22 = v17;
    dispatch_sync(MEMORY[0x1E4F14428], block);

    _Block_object_dispose(v29, 8);
  }
  else
  {
    (*((void (**)(id, id, void))v17 + 2))(v17, v16, 0);
  }
}

void __109__UIKeyboardLayout_recognizer_restartTouchDownForTouchWithId_startingAt_atPoint_currentPoint_whenStateReady___block_invoke(uint64_t a1)
{
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__134;
  v47 = __Block_byref_object_dispose__134;
  id v48 = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 616);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __109__UIKeyboardLayout_recognizer_restartTouchDownForTouchWithId_startingAt_atPoint_currentPoint_whenStateReady___block_invoke_2;
  block[3] = &unk_1E52E1B98;
  long long v42 = &v43;
  block[4] = v2;
  id v41 = *(id *)(a1 + 40);
  dispatch_sync(v3, block);
  uint64_t v4 = +[UIKBTouchState touchStateForTouchUUID:withTimestamp:phase:location:pathIndex:inView:](UIKBTouchState, "touchStateForTouchUUID:withTimestamp:phase:location:pathIndex:inView:", *(void *)(a1 + 40), 0, [(id)v44[5] pathIndex], *(void *)(a1 + 32), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "queryShouldNeverIgnoreTouchStateWithIdentifier:touchState:startPoint:forRestingState:", *(void *)(a1 + 40), v4, 2, *(double *)(a1 + 88), *(double *)(a1 + 96));
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    uint64_t v34 = 0;
    CGFloat v35 = &v34;
    uint64_t v36 = 0x3032000000;
    char v37 = __Block_byref_object_copy__278;
    uint64_t v38 = __Block_byref_object_dispose__279;
    id v39 = 0;
    objc_initWeak(&location, *(id *)(a1 + 32));
    if (qword_1EB259460 != -1) {
      dispatch_once(&qword_1EB259460, &__block_literal_global_282_3);
    }
    double v5 = [*(id *)(a1 + 32) taskQueue];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __109__UIKeyboardLayout_recognizer_restartTouchDownForTouchWithId_startingAt_atPoint_currentPoint_whenStateReady___block_invoke_3;
    v27[3] = &unk_1E52FCA88;
    id v29 = &v43;
    objc_copyWeak(&v30, &location);
    id v28 = *(id *)(a1 + 40);
    long long v31 = *(_OWORD *)(a1 + 72);
    uint64_t v32 = *(void *)(a1 + 64);
    [v5 addTask:v27 breadcrumb:qword_1EB259458];

    objc_destroyWeak(&v30);
    id v6 = +[UIKBTouchState touchStateForTouchUUID:withTimestamp:phase:location:pathIndex:inView:](UIKBTouchState, "touchStateForTouchUUID:withTimestamp:phase:location:pathIndex:inView:", *(void *)(a1 + 40), 0, [(id)v44[5] pathIndex], *(void *)(a1 + 32), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
    if (qword_1EB259470 != -1) {
      dispatch_once(&qword_1EB259470, &__block_literal_global_289_0);
    }
    uint64_t v7 = [*(id *)(a1 + 32) taskQueue];
    uint64_t v8 = [*(id *)(a1 + 32) touchDownTaskForTouchState:v6];
    [v7 addTask:v8 breadcrumb:qword_1EB259468];

    if (v35[5])
    {
      if (qword_1EB259480 != -1) {
        dispatch_once(&qword_1EB259480, &__block_literal_global_295);
      }
      uint64_t v9 = [*(id *)(a1 + 32) taskQueue];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __109__UIKeyboardLayout_recognizer_restartTouchDownForTouchWithId_startingAt_atPoint_currentPoint_whenStateReady___block_invoke_8;
      v26[3] = &unk_1E52E3D70;
      v26[4] = &v34;
      [v9 addTask:v26 breadcrumb:qword_1EB259478];
    }
    double v10 = +[UIKBTouchState touchStateForTouchUUID:withTimestamp:phase:location:pathIndex:inView:](UIKBTouchState, "touchStateForTouchUUID:withTimestamp:phase:location:pathIndex:inView:", *(void *)(a1 + 40), 1, [(id)v44[5] pathIndex], *(void *)(a1 + 32), *(double *)(a1 + 64), *(double *)(a1 + 88), *(double *)(a1 + 96));

    if (qword_1EB259490 != -1) {
      dispatch_once(&qword_1EB259490, &__block_literal_global_301);
    }
    CGFloat v11 = [*(id *)(a1 + 32) taskQueue];
    CGFloat v12 = [*(id *)(a1 + 32) touchDraggedTaskForTouchState:v10];
    [v11 addTask:v12 breadcrumb:qword_1EB259488];

    id v13 = *(void **)(a1 + 32);
    id v14 = [MEMORY[0x1E4F1CAD0] setWithObject:*(void *)(a1 + 40)];
    [v13 _enumerateDeferredTouchUUIDs:v14 withBlock:0];

    id v15 = +[UIKBTouchState touchStateForTouchUUID:withTimestamp:phase:location:pathIndex:inView:](UIKBTouchState, "touchStateForTouchUUID:withTimestamp:phase:location:pathIndex:inView:", *(void *)(a1 + 40), 3, [(id)v44[5] pathIndex], *(void *)(a1 + 32), CFAbsoluteTimeGetCurrent() + *(double *)&sSystemUptimeFromAbsoluteTimeDiff, *(double *)(a1 + 88), *(double *)(a1 + 96));

    id v16 = (void *)v44[5];
    id v17 = [*(id *)(a1 + 32) touchUpTaskForTouchState:v15];
    id v18 = +[UIKBTouchStateTask touchStateTaskForTouchState:v15 andTask:v17];
    [v16 addTask:v18];

    objc_destroyWeak(&location);
    _Block_object_dispose(&v34, 8);
  }
  if (qword_1EB2594A0 != -1) {
    dispatch_once(&qword_1EB2594A0, &__block_literal_global_307_0);
  }
  id v19 = [*(id *)(a1 + 32) taskQueue];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __109__UIKeyboardLayout_recognizer_restartTouchDownForTouchWithId_startingAt_atPoint_currentPoint_whenStateReady___block_invoke_13;
  v22[3] = &unk_1E52FCA38;
  id v24 = *(id *)(a1 + 48);
  id v20 = *(id *)(a1 + 40);
  uint64_t v21 = *(void *)(a1 + 56);
  id v23 = v20;
  uint64_t v25 = v21;
  [v19 addTask:v22 breadcrumb:qword_1EB259498];

  _Block_object_dispose(&v43, 8);
}

void __109__UIKeyboardLayout_recognizer_restartTouchDownForTouchWithId_startingAt_atPoint_currentPoint_whenStateReady___block_invoke_2(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 608) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __109__UIKeyboardLayout_recognizer_restartTouchDownForTouchWithId_startingAt_atPoint_currentPoint_whenStateReady___block_invoke_280()
{
  uint64_t v0 = [&__block_literal_global_285_0 copy];
  v1 = (void *)qword_1EB259458;
  qword_1EB259458 = v0;
}

uint64_t __109__UIKeyboardLayout_recognizer_restartTouchDownForTouchWithId_startingAt_atPoint_currentPoint_whenStateReady___block_invoke_2_283(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __109__UIKeyboardLayout_recognizer_restartTouchDownForTouchWithId_startingAt_atPoint_currentPoint_whenStateReady___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v4 = a2;
  [v3 ignoredOnBegin];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained[54] addObject:*(void *)(a1 + 32)];
  [WeakRetained[78] removeObject:*(void *)(a1 + 32)];
  objc_msgSend(WeakRetained, "handRestRecognizerNotifyRestForBegin:location:timestamp:pathIndex:touchUUID:context:", 0, objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "pathIndex"), *(void *)(a1 + 32), v4, *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

void __109__UIKeyboardLayout_recognizer_restartTouchDownForTouchWithId_startingAt_atPoint_currentPoint_whenStateReady___block_invoke_4()
{
  uint64_t v0 = [&__block_literal_global_291_0 copy];
  v1 = (void *)qword_1EB259468;
  qword_1EB259468 = v0;
}

uint64_t __109__UIKeyboardLayout_recognizer_restartTouchDownForTouchWithId_startingAt_atPoint_currentPoint_whenStateReady___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __109__UIKeyboardLayout_recognizer_restartTouchDownForTouchWithId_startingAt_atPoint_currentPoint_whenStateReady___block_invoke_6()
{
  uint64_t v0 = [&__block_literal_global_297_0 copy];
  v1 = (void *)qword_1EB259478;
  qword_1EB259478 = v0;
}

uint64_t __109__UIKeyboardLayout_recognizer_restartTouchDownForTouchWithId_startingAt_atPoint_currentPoint_whenStateReady___block_invoke_7(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __109__UIKeyboardLayout_recognizer_restartTouchDownForTouchWithId_startingAt_atPoint_currentPoint_whenStateReady___block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v3 = *(void (**)(uint64_t))(v2 + 16);
  id v4 = a2;
  v3(v2);
  [v4 returnExecutionToParent];
}

void __109__UIKeyboardLayout_recognizer_restartTouchDownForTouchWithId_startingAt_atPoint_currentPoint_whenStateReady___block_invoke_9()
{
  uint64_t v0 = [&__block_literal_global_303 copy];
  v1 = (void *)qword_1EB259488;
  qword_1EB259488 = v0;
}

uint64_t __109__UIKeyboardLayout_recognizer_restartTouchDownForTouchWithId_startingAt_atPoint_currentPoint_whenStateReady___block_invoke_10(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __109__UIKeyboardLayout_recognizer_restartTouchDownForTouchWithId_startingAt_atPoint_currentPoint_whenStateReady___block_invoke_11()
{
  uint64_t v0 = [&__block_literal_global_309 copy];
  v1 = (void *)qword_1EB259498;
  qword_1EB259498 = v0;
}

uint64_t __109__UIKeyboardLayout_recognizer_restartTouchDownForTouchWithId_startingAt_atPoint_currentPoint_whenStateReady___block_invoke_12(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __109__UIKeyboardLayout_recognizer_restartTouchDownForTouchWithId_startingAt_atPoint_currentPoint_whenStateReady___block_invoke_13(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v2 = a1[5];
  uint64_t v4 = *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24);
  double v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  id v6 = a2;
  v5(v2, v3, v4);
  [v6 returnExecutionToParent];
}

- (void)recognizer:(id)a3 shouldContinueTrackingTouchWithId:(id)a4 startingAt:(double)a5 atPoint:(CGPoint)a6 currentPoint:(CGPoint)a7 forContinueState:(unint64_t)a8 whenStateReady:(id)a9
{
  CGFloat y = a6.y;
  CGFloat x = a6.x;
  id v15 = a4;
  id v16 = (void (**)(id, id, uint64_t))a9;
  id v17 = a3;
  id v18 = [(UIKeyboardLayout *)self handRestRecognizer];

  if (v18 == v17)
  {
    if (a8 == 3)
    {
      v16[2](v16, v15, [v15 isEqual:self->_shiftKeyTouchUUID]);
    }
    else
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __129__UIKeyboardLayout_recognizer_shouldContinueTrackingTouchWithId_startingAt_atPoint_currentPoint_forContinueState_whenStateReady___block_invoke;
      v19[3] = &unk_1E52FCB28;
      v19[4] = self;
      id v20 = v15;
      unint64_t v22 = a8;
      CGFloat v23 = x;
      CGFloat v24 = y;
      uint64_t v21 = v16;
      dispatch_sync(MEMORY[0x1E4F14428], v19);
    }
  }
  else
  {
    v16[2](v16, v15, 0);
  }
}

void __129__UIKeyboardLayout_recognizer_shouldContinueTrackingTouchWithId_startingAt_atPoint_currentPoint_forContinueState_whenStateReady___block_invoke(uint64_t a1)
{
  uint64_t v25 = 0;
  CGFloat v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = __Block_byref_object_copy__134;
  id v29 = __Block_byref_object_dispose__134;
  id v30 = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 616);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __129__UIKeyboardLayout_recognizer_shouldContinueTrackingTouchWithId_startingAt_atPoint_currentPoint_forContinueState_whenStateReady___block_invoke_2;
  block[3] = &unk_1E52E1B98;
  CGFloat v24 = &v25;
  block[4] = v2;
  id v23 = *(id *)(a1 + 40);
  dispatch_sync(v3, block);
  id v4 = 0;
  uint64_t v5 = *(void *)(a1 + 56);
  if (!v5)
  {
    id v4 = [(id)v26[5] firstTouchStateForUITouchPhase:1];
    if (v4)
    {
      id v6 = *(void **)(a1 + 32);
      uint64_t v7 = [MEMORY[0x1E4F1CAD0] setWithObject:*(void *)(a1 + 40)];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __129__UIKeyboardLayout_recognizer_shouldContinueTrackingTouchWithId_startingAt_atPoint_currentPoint_forContinueState_whenStateReady___block_invoke_3;
      v19[3] = &unk_1E52FCAD8;
      id v4 = v4;
      uint64_t v8 = *(void *)(a1 + 32);
      id v20 = v4;
      uint64_t v21 = v8;
      [v6 _enumerateDeferredTouchUUIDs:v7 withBlock:v19];
    }
  }
  objc_initWeak(&location, *(id *)(a1 + 32));
  if (qword_1EB2594C0 != -1) {
    dispatch_once(&qword_1EB2594C0, &__block_literal_global_315);
  }
  uint64_t v9 = [*(id *)(a1 + 32) taskQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __129__UIKeyboardLayout_recognizer_shouldContinueTrackingTouchWithId_startingAt_atPoint_currentPoint_forContinueState_whenStateReady___block_invoke_8;
  v11[3] = &unk_1E52FCB00;
  objc_copyWeak(&v15, &location);
  id v12 = *(id *)(a1 + 40);
  id v10 = v4;
  id v13 = v10;
  long long v16 = *(_OWORD *)(a1 + 64);
  uint64_t v17 = v5;
  id v14 = *(id *)(a1 + 48);
  [v9 addTask:v11 breadcrumb:qword_1EB2594B8];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v25, 8);
}

void __129__UIKeyboardLayout_recognizer_shouldContinueTrackingTouchWithId_startingAt_atPoint_currentPoint_forContinueState_whenStateReady___block_invoke_2(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 608) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __129__UIKeyboardLayout_recognizer_shouldContinueTrackingTouchWithId_startingAt_atPoint_currentPoint_forContinueState_whenStateReady___block_invoke_3(uint64_t a1, void *a2, void *a3, BOOL *a4)
{
  id v10 = a2;
  id v7 = a3;
  id v8 = *(id *)(a1 + 32);
  *a4 = v8 != v10;
  if (v8 == v10)
  {
    if (qword_1EB2594B0 != -1) {
      dispatch_once(&qword_1EB2594B0, &__block_literal_global_311);
    }
    uint64_t v9 = [*(id *)(a1 + 40) taskQueue];
    [v9 addTask:v7 breadcrumb:qword_1EB2594A8];
  }
}

void __129__UIKeyboardLayout_recognizer_shouldContinueTrackingTouchWithId_startingAt_atPoint_currentPoint_forContinueState_whenStateReady___block_invoke_4()
{
  uint64_t v0 = [&__block_literal_global_313_0 copy];
  v1 = (void *)qword_1EB2594A8;
  qword_1EB2594A8 = v0;
}

uint64_t __129__UIKeyboardLayout_recognizer_shouldContinueTrackingTouchWithId_startingAt_atPoint_currentPoint_forContinueState_whenStateReady___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __129__UIKeyboardLayout_recognizer_shouldContinueTrackingTouchWithId_startingAt_atPoint_currentPoint_forContinueState_whenStateReady___block_invoke_6()
{
  uint64_t v0 = [&__block_literal_global_317_1 copy];
  v1 = (void *)qword_1EB2594B8;
  qword_1EB2594B8 = v0;
}

uint64_t __129__UIKeyboardLayout_recognizer_shouldContinueTrackingTouchWithId_startingAt_atPoint_currentPoint_forContinueState_whenStateReady___block_invoke_7(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __129__UIKeyboardLayout_recognizer_shouldContinueTrackingTouchWithId_startingAt_atPoint_currentPoint_forContinueState_whenStateReady___block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v3 = (id *)(a1 + 56);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "queryShouldNeverIgnoreTouchStateWithIdentifier:touchState:startPoint:forRestingState:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 80), *(double *)(a1 + 64), *(double *)(a1 + 72));
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  uint64_t v5 = [v4 info];
  [v4 returnExecutionToParentWithInfo:v5];
}

- (BOOL)queryShouldNeverIgnoreTouchStateWithIdentifier:(id)a3 touchState:(id)a4 startPoint:(CGPoint)a5 forRestingState:(unint64_t)a6
{
  double y = a5.y;
  double x = a5.x;
  id v11 = a3;
  id v12 = a4;
  uint64_t v30 = 0;
  long long v31 = &v30;
  uint64_t v32 = 0x3032000000;
  unint64_t v33 = __Block_byref_object_copy__134;
  uint64_t v34 = __Block_byref_object_dispose__134;
  id v35 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__134;
  id v28 = __Block_byref_object_dispose__134;
  id v29 = 0;
  deferredTouchTaskListsQueue = self->_deferredTouchTaskListsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __105__UIKeyboardLayout_queryShouldNeverIgnoreTouchStateWithIdentifier_touchState_startPoint_forRestingState___block_invoke;
  block[3] = &unk_1E52FCB78;
  uint64_t v21 = &v30;
  block[4] = self;
  id v14 = v11;
  unint64_t v22 = &v24;
  unint64_t v23 = a6;
  id v20 = v14;
  dispatch_sync(deferredTouchTaskListsQueue, block);
  id v15 = [(id)v31[5] currentTouchPoint];
  [v15 CGPointValue];
  LOBYTE(a6) = -[UIKeyboardLayout handRestRecognizerShouldNeverIgnoreTouchState:fromPoint:toPoint:forRestingState:otherRestedTouchLocations:](self, "handRestRecognizerShouldNeverIgnoreTouchState:fromPoint:toPoint:forRestingState:otherRestedTouchLocations:", v12, a6, v25[5], x, y, v16, v17);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return a6;
}

void __105__UIKeyboardLayout_queryShouldNeverIgnoreTouchStateWithIdentifier_touchState_startPoint_forRestingState___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 608) objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (*(void *)(a1 + 64) == 1)
  {
    uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 608) allValues];
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    id v15 = __105__UIKeyboardLayout_queryShouldNeverIgnoreTouchStateWithIdentifier_touchState_startPoint_forRestingState___block_invoke_2;
    double v16 = &unk_1E52FCB50;
    id v6 = *(id *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 32);
    id v17 = v6;
    uint64_t v18 = v7;
    id v8 = [v5 indexesOfObjectsPassingTest:&v13];
    uint64_t v9 = objc_msgSend(v5, "objectsAtIndexes:", v8, v13, v14, v15, v16);

    if ([v9 count])
    {
      uint64_t v10 = [v9 valueForKey:@"currentTouchPoint"];
      uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
      id v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;
    }
  }
}

uint64_t __105__UIKeyboardLayout_queryShouldNeverIgnoreTouchStateWithIdentifier_touchState_startPoint_forRestingState___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 touchUUID];
  if ([v4 isEqual:*(void *)(a1 + 32)])
  {
    uint64_t v5 = 0;
  }
  else
  {
    id v6 = [v3 currentTouchPoint];
    if (v6)
    {
      uint64_t v7 = *(void **)(*(void *)(a1 + 40) + 624);
      id v8 = [v3 touchUUID];
      uint64_t v5 = [v7 containsObject:v8];
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  return v5;
}

- (void)recognizer:(id)a3 willIgnoreTouchWithId:(id)a4 startingAt:(double)a5 atPoint:(CGPoint)a6 currentPoint:(CGPoint)a7 whenReady:(id)a8
{
  CGFloat y = a7.y;
  CGFloat x = a7.x;
  id v13 = a4;
  id v14 = a8;
  id v15 = a3;
  id v16 = [(UIKeyboardLayout *)self handRestRecognizer];

  if (v16 == v15)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __95__UIKeyboardLayout_recognizer_willIgnoreTouchWithId_startingAt_atPoint_currentPoint_whenReady___block_invoke;
    block[3] = &unk_1E52FCC40;
    block[4] = self;
    id v18 = v13;
    CGFloat v20 = x;
    CGFloat v21 = y;
    id v19 = v14;
    dispatch_sync(MEMORY[0x1E4F14428], block);
  }
  else
  {
    (*((void (**)(id, id))v14 + 2))(v14, v13);
  }
}

void __95__UIKeyboardLayout_recognizer_willIgnoreTouchWithId_startingAt_atPoint_currentPoint_whenReady___block_invoke(uint64_t a1)
{
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(NSObject **)(v2 + 616);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __95__UIKeyboardLayout_recognizer_willIgnoreTouchWithId_startingAt_atPoint_currentPoint_whenReady___block_invoke_2;
  block[3] = &unk_1E52E5180;
  block[4] = v2;
  id v29 = *(id *)(a1 + 40);
  uint64_t v30 = &v31;
  dispatch_sync(v3, block);
  if ([*(id *)(*(void *)(a1 + 32) + 624) containsObject:*(void *)(a1 + 40)])
  {
    if (qword_1EB2594E0 != -1) {
      dispatch_once(&qword_1EB2594E0, &__block_literal_global_329_0);
    }
    id v4 = [*(id *)(a1 + 32) taskQueue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __95__UIKeyboardLayout_recognizer_willIgnoreTouchWithId_startingAt_atPoint_currentPoint_whenReady___block_invoke_11;
    v11[3] = &unk_1E52E3B88;
    id v13 = *(id *)(a1 + 48);
    id v12 = *(id *)(a1 + 40);
    [v4 addTask:v11 breadcrumb:qword_1EB2594D8];
  }
  else
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    uint64_t v23 = 0;
    uint64_t v24 = (double *)&v23;
    uint64_t v25 = 0x2020000000;
    double v26 = 0.0;
    double v26 = CFAbsoluteTimeGetCurrent() + *(double *)&sSystemUptimeFromAbsoluteTimeDiff;
    uint64_t v5 = *(void **)(a1 + 32);
    id v6 = [MEMORY[0x1E4F1CAD0] setWithObject:*(void *)(a1 + 40)];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __95__UIKeyboardLayout_recognizer_willIgnoreTouchWithId_startingAt_atPoint_currentPoint_whenReady___block_invoke_3;
    v22[3] = &unk_1E52FCBA0;
    void v22[4] = &v23;
    [v5 _enumerateDeferredTouchUUIDs:v6 withBlock:v22];

    uint64_t v7 = +[UIKBTouchState touchStateForTouchUUID:withTimestamp:phase:location:pathIndex:inView:](UIKBTouchState, "touchStateForTouchUUID:withTimestamp:phase:location:pathIndex:inView:", *(void *)(a1 + 40), 4, *((unsigned __int8 *)v32 + 24), *(void *)(a1 + 32), v24[3], *(double *)(a1 + 56), *(double *)(a1 + 64));
    id v8 = [*(id *)(a1 + 32) touchCancelledTaskForTouchState:v7 forResting:1];
    if (qword_1EB2594D0 != -1) {
      dispatch_once(&qword_1EB2594D0, &__block_literal_global_323_0);
    }
    uint64_t v9 = [*(id *)(a1 + 32) taskQueue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __95__UIKeyboardLayout_recognizer_willIgnoreTouchWithId_startingAt_atPoint_currentPoint_whenReady___block_invoke_6;
    v14[3] = &unk_1E52FCC18;
    id v10 = v8;
    id v16 = v10;
    objc_copyWeak(&v20, &location);
    long long v21 = *(_OWORD *)(a1 + 56);
    id v18 = &v23;
    id v19 = &v31;
    id v15 = *(id *)(a1 + 40);
    id v17 = *(id *)(a1 + 48);
    [v9 addTask:v14 breadcrumb:qword_1EB2594C8];

    objc_destroyWeak(&v20);
    _Block_object_dispose(&v23, 8);
    objc_destroyWeak(&location);
  }

  _Block_object_dispose(&v31, 8);
}

void __95__UIKeyboardLayout_recognizer_willIgnoreTouchWithId_startingAt_atPoint_currentPoint_whenReady___block_invoke_2(void *a1)
{
  id v2 = [*(id *)(a1[4] + 608) objectForKey:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [v2 pathIndex];
}

uint64_t __95__UIKeyboardLayout_recognizer_willIgnoreTouchWithId_startingAt_atPoint_currentPoint_whenReady___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t result = [a2 timestamp];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;
  return result;
}

void __95__UIKeyboardLayout_recognizer_willIgnoreTouchWithId_startingAt_atPoint_currentPoint_whenReady___block_invoke_4()
{
  uint64_t v0 = [&__block_literal_global_325_1 copy];
  v1 = (void *)qword_1EB2594C8;
  qword_1EB2594C8 = v0;
}

uint64_t __95__UIKeyboardLayout_recognizer_willIgnoreTouchWithId_startingAt_atPoint_currentPoint_whenReady___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __95__UIKeyboardLayout_recognizer_willIgnoreTouchWithId_startingAt_atPoint_currentPoint_whenReady___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __95__UIKeyboardLayout_recognizer_willIgnoreTouchWithId_startingAt_atPoint_currentPoint_whenReady___block_invoke_7;
  v6[3] = &unk_1E52FCBF0;
  objc_copyWeak(&v10, (id *)(a1 + 72));
  long long v11 = *(_OWORD *)(a1 + 80);
  long long v9 = *(_OWORD *)(a1 + 56);
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 48);
  uint64_t v5 = [v3 childWithContinuation:v6];
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  objc_destroyWeak(&v10);
}

void __95__UIKeyboardLayout_recognizer_willIgnoreTouchWithId_startingAt_atPoint_currentPoint_whenReady___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 64);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  double v6 = *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  uint64_t v7 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  id v8 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __95__UIKeyboardLayout_recognizer_willIgnoreTouchWithId_startingAt_atPoint_currentPoint_whenReady___block_invoke_8;
  v11[3] = &unk_1E52FCBC8;
  void v11[4] = WeakRetained;
  id v9 = v8;
  id v12 = v9;
  id v13 = *(id *)(a1 + 40);
  id v10 = [v4 childWithContinuation:v11];

  objc_msgSend(WeakRetained, "handRestRecognizerNotifyRestForBegin:location:timestamp:pathIndex:touchUUID:context:", 1, v7, v9, v10, *(double *)(a1 + 72), *(double *)(a1 + 80), v6);
}

void __95__UIKeyboardLayout_recognizer_willIgnoreTouchWithId_startingAt_atPoint_currentPoint_whenReady___block_invoke_8(void *a1, void *a2)
{
  uint64_t v3 = a1[5];
  id v4 = *(void **)(a1[4] + 624);
  id v5 = a2;
  [v4 addObject:v3];
  (*(void (**)(void))(a1[6] + 16))();
  [v5 returnExecutionToParent];
}

void __95__UIKeyboardLayout_recognizer_willIgnoreTouchWithId_startingAt_atPoint_currentPoint_whenReady___block_invoke_9()
{
  uint64_t v0 = [&__block_literal_global_331_0 copy];
  v1 = (void *)qword_1EB2594D8;
  qword_1EB2594D8 = v0;
}

uint64_t __95__UIKeyboardLayout_recognizer_willIgnoreTouchWithId_startingAt_atPoint_currentPoint_whenReady___block_invoke_10(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __95__UIKeyboardLayout_recognizer_willIgnoreTouchWithId_startingAt_atPoint_currentPoint_whenReady___block_invoke_11(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = *(void (**)(uint64_t, uint64_t))(v2 + 16);
  id v5 = a2;
  v4(v2, v3);
  [v5 returnExecutionToParent];
}

- (void)recognizer:(id)a3 continueTrackingIgnoredTouchWithId:(id)a4 currentPoint:(CGPoint)a5 whenReady:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  id v11 = a3;
  id v12 = [(UIKeyboardLayout *)self handRestRecognizer];

  if (v12 == v11)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __89__UIKeyboardLayout_recognizer_continueTrackingIgnoredTouchWithId_currentPoint_whenReady___block_invoke;
    block[3] = &unk_1E52E3298;
    block[4] = self;
    id v14 = v9;
    id v15 = v10;
    dispatch_sync(MEMORY[0x1E4F14428], block);
  }
  else
  {
    (*((void (**)(id, id))v10 + 2))(v10, v9);
  }
}

void __89__UIKeyboardLayout_recognizer_continueTrackingIgnoredTouchWithId_currentPoint_whenReady___block_invoke(id *a1)
{
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  double v26 = __Block_byref_object_copy__134;
  uint64_t v27 = __Block_byref_object_dispose__134;
  id v28 = 0;
  id v2 = a1[4];
  uint64_t v3 = *((void *)v2 + 77);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__UIKeyboardLayout_recognizer_continueTrackingIgnoredTouchWithId_currentPoint_whenReady___block_invoke_2;
  block[3] = &unk_1E52E1B98;
  unint64_t v22 = &v23;
  block[4] = v2;
  id v21 = a1[5];
  dispatch_sync(v3, block);
  id v4 = [(id)v24[5] firstTouchStateForUITouchPhase:1];
  if (v4)
  {
    id v5 = a1[4];
    double v6 = [MEMORY[0x1E4F1CAD0] setWithObject:a1[5]];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __89__UIKeyboardLayout_recognizer_continueTrackingIgnoredTouchWithId_currentPoint_whenReady___block_invoke_3;
    v16[3] = &unk_1E52FCC90;
    id v7 = v4;
    id v8 = a1[4];
    id v9 = a1[5];
    v17[0] = v7;
    v17[1] = v8;
    id v18 = v9;
    id v19 = a1[6];
    [v5 _enumerateDeferredTouchUUIDs:v6 withBlock:v16];
    id v10 = (id *)v17;

    id v11 = v18;
  }
  else
  {
    if (qword_1EB259500 != -1) {
      dispatch_once(&qword_1EB259500, &__block_literal_global_337_1);
    }
    id v12 = [a1[4] taskQueue];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __89__UIKeyboardLayout_recognizer_continueTrackingIgnoredTouchWithId_currentPoint_whenReady___block_invoke_10;
    v13[3] = &unk_1E52E3B88;
    id v15 = a1[6];
    id v14 = a1[5];
    [v12 addTask:v13 breadcrumb:qword_1EB2594F8];
    id v10 = &v15;

    id v11 = v14;
  }

  _Block_object_dispose(&v23, 8);
}

void __89__UIKeyboardLayout_recognizer_continueTrackingIgnoredTouchWithId_currentPoint_whenReady___block_invoke_2(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 608) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __89__UIKeyboardLayout_recognizer_continueTrackingIgnoredTouchWithId_currentPoint_whenReady___block_invoke_3(uint64_t a1, void *a2, void *a3, BOOL *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = *(id *)(a1 + 32);
  *a4 = v9 != v7;
  if (v9 == v7)
  {
    objc_initWeak(&location, *(id *)(a1 + 40));
    if (qword_1EB2594F0 != -1) {
      dispatch_once(&qword_1EB2594F0, &__block_literal_global_333_1);
    }
    id v10 = [*(id *)(a1 + 40) taskQueue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __89__UIKeyboardLayout_recognizer_continueTrackingIgnoredTouchWithId_currentPoint_whenReady___block_invoke_6;
    v11[3] = &unk_1E52FCC68;
    objc_copyWeak(&v15, &location);
    id v12 = *(id *)(a1 + 48);
    id v13 = v8;
    id v14 = *(id *)(a1 + 56);
    [v10 addTask:v11 breadcrumb:qword_1EB2594E8];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __89__UIKeyboardLayout_recognizer_continueTrackingIgnoredTouchWithId_currentPoint_whenReady___block_invoke_4()
{
  uint64_t v0 = [&__block_literal_global_335_0 copy];
  v1 = (void *)qword_1EB2594E8;
  qword_1EB2594E8 = v0;
}

uint64_t __89__UIKeyboardLayout_recognizer_continueTrackingIgnoredTouchWithId_currentPoint_whenReady___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __89__UIKeyboardLayout_recognizer_continueTrackingIgnoredTouchWithId_currentPoint_whenReady___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v3 = (id *)(a1 + 56);
  id v4 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained(v3);
  [WeakRetained[54] addObject:*(void *)(a1 + 32)];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __89__UIKeyboardLayout_recognizer_continueTrackingIgnoredTouchWithId_currentPoint_whenReady___block_invoke_7;
  v8[3] = &unk_1E52FCBC8;
  v8[4] = WeakRetained;
  uint64_t v6 = *(void *)(a1 + 40);
  id v9 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 48);
  id v7 = [v4 childWithContinuation:v8];

  (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
}

void __89__UIKeyboardLayout_recognizer_continueTrackingIgnoredTouchWithId_currentPoint_whenReady___block_invoke_7(void *a1, void *a2)
{
  uint64_t v3 = a1[5];
  id v4 = *(void **)(a1[4] + 432);
  id v5 = a2;
  [v4 removeObject:v3];
  (*(void (**)(void))(a1[6] + 16))();
  [v5 returnExecutionToParent];
}

void __89__UIKeyboardLayout_recognizer_continueTrackingIgnoredTouchWithId_currentPoint_whenReady___block_invoke_8()
{
  uint64_t v0 = [&__block_literal_global_339_0 copy];
  v1 = (void *)qword_1EB2594F8;
  qword_1EB2594F8 = v0;
}

uint64_t __89__UIKeyboardLayout_recognizer_continueTrackingIgnoredTouchWithId_currentPoint_whenReady___block_invoke_9(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __89__UIKeyboardLayout_recognizer_continueTrackingIgnoredTouchWithId_currentPoint_whenReady___block_invoke_10(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = *(void (**)(uint64_t, uint64_t))(v2 + 16);
  id v5 = a2;
  v4(v2, v3);
  [v5 returnExecutionToParent];
}

- (void)recognizer:(id)a3 releaseTouchToLayoutWithId:(id)a4 startPoint:(CGPoint)a5 endPoint:(CGPoint)a6 whenReady:(id)a7
{
  CGFloat y = a6.y;
  CGFloat x = a6.x;
  CGFloat v10 = a5.y;
  CGFloat v11 = a5.x;
  id v13 = a4;
  id v14 = a7;
  [(UIKeyboardLayout *)self recognizerBlockUntilTaskQueueReadyForceUsingDeferredTask:0];
  id v15 = (void *)[v14 copy];

  id v16 = v13;
  id v17 = self->_deferredTouchTaskListsQueue;
  id v18 = self->_touchIgnoredUUIDSet;
  id v19 = self->_deferredTouchTaskLists;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__UIKeyboardLayout_recognizer_releaseTouchToLayoutWithId_startPoint_endPoint_whenReady___block_invoke;
  block[3] = &unk_1E52FCD08;
  double v26 = v17;
  uint64_t v27 = self;
  CGFloat v33 = v11;
  CGFloat v34 = v10;
  CGFloat v35 = x;
  CGFloat v36 = y;
  id v28 = v16;
  id v29 = v18;
  id v30 = v16;
  uint64_t v31 = v19;
  id v32 = v15;
  id v20 = v17;
  id v21 = v18;
  unint64_t v22 = v19;
  id v23 = v15;
  id v24 = v16;
  dispatch_sync(MEMORY[0x1E4F14428], block);
}

void __88__UIKeyboardLayout_recognizer_releaseTouchToLayoutWithId_startPoint_endPoint_whenReady___block_invoke(uint64_t a1)
{
  uint64_t v36 = 0;
  char v37 = &v36;
  uint64_t v38 = 0x3032000000;
  id v39 = __Block_byref_object_copy__134;
  long long v40 = __Block_byref_object_dispose__134;
  id v41 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__UIKeyboardLayout_recognizer_releaseTouchToLayoutWithId_startPoint_endPoint_whenReady___block_invoke_2;
  block[3] = &unk_1E52E1B98;
  uint64_t v3 = *(NSObject **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = *(void **)(a1 + 48);
  CGFloat v35 = &v36;
  void block[4] = v2;
  id v34 = v4;
  dispatch_sync(v3, block);
  if ([*(id *)(*(void *)(a1 + 40) + 624) containsObject:*(void *)(a1 + 48)])
  {
    [*(id *)(*(void *)(a1 + 40) + 624) removeObject:*(void *)(a1 + 48)];
    if (([*(id *)(*(void *)(a1 + 40) + 432) containsObject:*(void *)(a1 + 48)] & 1) == 0)
    {
      [*(id *)(*(void *)(a1 + 40) + 432) addObject:*(void *)(a1 + 48)];
      uint64_t v5 = *(void *)(a1 + 48);
      [(id)v37[5] originalStartTime];
      id v7 = +[UIKBTouchState touchStateForTouchUUID:withTimestamp:phase:location:pathIndex:inView:](UIKBTouchState, "touchStateForTouchUUID:withTimestamp:phase:location:pathIndex:inView:", v5, 0, [(id)v37[5] pathIndex], *(void *)(a1 + 40), v6, *(double *)(a1 + 88), *(double *)(a1 + 96));
      if (qword_1EB259510 != -1) {
        dispatch_once(&qword_1EB259510, &__block_literal_global_341_1);
      }
      id v8 = [*(id *)(a1 + 40) taskQueue];
      id v9 = [*(id *)(a1 + 40) touchDownTaskForTouchState:v7];
      [v8 addTask:v9 breadcrumb:qword_1EB259508];

      uint64_t v10 = *(void *)(a1 + 48);
      [(id)v37[5] originalStartTime];
      id v12 = +[UIKBTouchState touchStateForTouchUUID:withTimestamp:phase:location:pathIndex:inView:](UIKBTouchState, "touchStateForTouchUUID:withTimestamp:phase:location:pathIndex:inView:", v10, 1, [(id)v37[5] pathIndex], *(void *)(a1 + 40), v11, *(double *)(a1 + 104), *(double *)(a1 + 112));

      if (qword_1EB259520 != -1) {
        dispatch_once(&qword_1EB259520, &__block_literal_global_347_0);
      }
      id v13 = [*(id *)(a1 + 40) taskQueue];
      id v14 = [*(id *)(a1 + 40) touchDraggedTaskForTouchState:v12];
      [v13 addTask:v14 breadcrumb:qword_1EB259518];
    }
    id v15 = [(id)v37[5] firstTouchStateForUITouchPhase:3];

    if (!v15)
    {
      id v16 = +[UIKBTouchState touchStateForTouchUUID:withTimestamp:phase:location:pathIndex:inView:](UIKBTouchState, "touchStateForTouchUUID:withTimestamp:phase:location:pathIndex:inView:", *(void *)(a1 + 48), 3, [(id)v37[5] pathIndex], *(void *)(a1 + 40), CFAbsoluteTimeGetCurrent() + *(double *)&sSystemUptimeFromAbsoluteTimeDiff, *(double *)(a1 + 104), *(double *)(a1 + 112));
      id v17 = (void *)v37[5];
      id v18 = [*(id *)(a1 + 40) touchUpTaskForTouchState:v16];
      id v19 = +[UIKBTouchStateTask touchStateTaskForTouchState:v16 andTask:v18];
      [v17 addTask:v19];
    }
  }
  uint64_t v20 = [*(id *)(*(void *)(a1 + 40) + 432) indexOfObject:*(void *)(a1 + 48)];
  if (v20 != 0x7FFFFFFFFFFFFFFFLL && v20 + 1 != [*(id *)(*(void *)(a1 + 40) + 432) count])
  {
    id v21 = *(void **)(*(void *)(a1 + 40) + 432);
    unint64_t v22 = [v21 objectAtIndex:v20];
    [v21 addObject:v22];

    [*(id *)(*(void *)(a1 + 40) + 432) removeObjectAtIndex:v20];
  }
  id v23 = *(void **)(a1 + 40);
  id v24 = [MEMORY[0x1E4F1CAD0] setWithObject:*(void *)(a1 + 48)];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __88__UIKeyboardLayout_recognizer_releaseTouchToLayoutWithId_startPoint_endPoint_whenReady___block_invoke_7;
  v32[3] = &unk_1E52FCCB8;
  v32[4] = *(void *)(a1 + 40);
  [v23 _enumerateDeferredTouchUUIDs:v24 withBlock:v32];

  if (qword_1EB259540 != -1) {
    dispatch_once(&qword_1EB259540, &__block_literal_global_357);
  }
  uint64_t v25 = [*(id *)(a1 + 40) taskQueue];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __88__UIKeyboardLayout_recognizer_releaseTouchToLayoutWithId_startPoint_endPoint_whenReady___block_invoke_12;
  v26[3] = &unk_1E52FCCE0;
  id v27 = *(id *)(a1 + 56);
  id v28 = *(id *)(a1 + 64);
  id v29 = *(id *)(a1 + 32);
  id v30 = *(id *)(a1 + 72);
  id v31 = *(id *)(a1 + 80);
  [v25 addTask:v26 breadcrumb:qword_1EB259538];

  _Block_object_dispose(&v36, 8);
}

void __88__UIKeyboardLayout_recognizer_releaseTouchToLayoutWithId_startPoint_endPoint_whenReady___block_invoke_2(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 608) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __88__UIKeyboardLayout_recognizer_releaseTouchToLayoutWithId_startPoint_endPoint_whenReady___block_invoke_3()
{
  uint64_t v0 = [&__block_literal_global_343_0 copy];
  v1 = (void *)qword_1EB259508;
  qword_1EB259508 = v0;
}

uint64_t __88__UIKeyboardLayout_recognizer_releaseTouchToLayoutWithId_startPoint_endPoint_whenReady___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __88__UIKeyboardLayout_recognizer_releaseTouchToLayoutWithId_startPoint_endPoint_whenReady___block_invoke_5()
{
  uint64_t v0 = [&__block_literal_global_349_0 copy];
  v1 = (void *)qword_1EB259518;
  qword_1EB259518 = v0;
}

uint64_t __88__UIKeyboardLayout_recognizer_releaseTouchToLayoutWithId_startPoint_endPoint_whenReady___block_invoke_6(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __88__UIKeyboardLayout_recognizer_releaseTouchToLayoutWithId_startPoint_endPoint_whenReady___block_invoke_7(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = qword_1EB259530;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&qword_1EB259530, &__block_literal_global_351_2);
  }
  id v6 = [*(id *)(a1 + 32) taskQueue];
  [v6 addTask:v5 breadcrumb:qword_1EB259528];
}

void __88__UIKeyboardLayout_recognizer_releaseTouchToLayoutWithId_startPoint_endPoint_whenReady___block_invoke_8()
{
  uint64_t v0 = [&__block_literal_global_353_0 copy];
  v1 = (void *)qword_1EB259528;
  qword_1EB259528 = v0;
}

uint64_t __88__UIKeyboardLayout_recognizer_releaseTouchToLayoutWithId_startPoint_endPoint_whenReady___block_invoke_9(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __88__UIKeyboardLayout_recognizer_releaseTouchToLayoutWithId_startPoint_endPoint_whenReady___block_invoke_10()
{
  uint64_t v0 = [&__block_literal_global_359 copy];
  v1 = (void *)qword_1EB259538;
  qword_1EB259538 = v0;
}

uint64_t __88__UIKeyboardLayout_recognizer_releaseTouchToLayoutWithId_startPoint_endPoint_whenReady___block_invoke_11(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __88__UIKeyboardLayout_recognizer_releaseTouchToLayoutWithId_startPoint_endPoint_whenReady___block_invoke_12(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  [v3 removeObject:v4];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  double v11 = __88__UIKeyboardLayout_recognizer_releaseTouchToLayoutWithId_startPoint_endPoint_whenReady___block_invoke_13;
  id v12 = &unk_1E52D9F98;
  id v6 = *(NSObject **)(a1 + 48);
  id v13 = *(id *)(a1 + 56);
  id v14 = *(id *)(a1 + 40);
  dispatch_sync(v6, &v9);
  (*(void (**)(void, void, uint64_t, uint64_t))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64), *(void *)(a1 + 40), v7, v8);
  objc_msgSend(v5, "returnExecutionToParent", v9, v10, v11, v12);
}

uint64_t __88__UIKeyboardLayout_recognizer_releaseTouchToLayoutWithId_startPoint_endPoint_whenReady___block_invoke_13(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeObjectForKey:*(void *)(a1 + 40)];
}

- (void)recognizer:(id)a3 cancelTouchOnLayoutWithId:(id)a4 startPoint:(CGPoint)a5 endPoint:(CGPoint)a6 whenReady:(id)a7
{
  id v9 = a4;
  id v10 = a7;
  [(UIKeyboardLayout *)self recognizerBlockUntilTaskQueueReadyForceUsingDeferredTask:0];
  double v11 = self->_deferredTouchTaskListsQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __87__UIKeyboardLayout_recognizer_cancelTouchOnLayoutWithId_startPoint_endPoint_whenReady___block_invoke;
  v15[3] = &unk_1E52DC7E8;
  id v16 = v11;
  id v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v11;
  dispatch_sync(MEMORY[0x1E4F14428], v15);
}

void __87__UIKeyboardLayout_recognizer_cancelTouchOnLayoutWithId_startPoint_endPoint_whenReady___block_invoke(id *a1)
{
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__134;
  v53 = __Block_byref_object_dispose__134;
  id v54 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__UIKeyboardLayout_recognizer_cancelTouchOnLayoutWithId_startPoint_endPoint_whenReady___block_invoke_2;
  block[3] = &unk_1E52E1B98;
  uint64_t v3 = a1[4];
  id v2 = a1[5];
  id v4 = a1[6];
  id v48 = &v49;
  void block[4] = v2;
  id v47 = v4;
  dispatch_sync(v3, block);
  int v5 = [*((id *)a1[5] + 54) containsObject:a1[6]];
  id v6 = (id *)a1[5];
  if (v5)
  {
    uint64_t v7 = [v6[54] indexOfObject:a1[6]];
    if (v7 != 0x7FFFFFFFFFFFFFFFLL && v7 + 1 != [*((id *)a1[5] + 54) count])
    {
      uint64_t v8 = (void *)*((void *)a1[5] + 54);
      id v9 = [v8 objectAtIndex:v7];
      [v8 addObject:v9];

      [*((id *)a1[5] + 54) removeObjectAtIndex:v7];
    }
  }
  else if ([v6[78] containsObject:a1[6]])
  {
    [*((id *)a1[5] + 54) addObject:a1[6]];
    [*((id *)a1[5] + 78) removeObject:a1[6]];
  }
  uint64_t v40 = 0;
  id v41 = &v40;
  uint64_t v42 = 0x3032000000;
  uint64_t v43 = __Block_byref_object_copy__278;
  v44 = __Block_byref_object_dispose__279;
  id v45 = 0;
  id v10 = a1[5];
  double v11 = [MEMORY[0x1E4F1CAD0] setWithObject:a1[6]];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __87__UIKeyboardLayout_recognizer_cancelTouchOnLayoutWithId_startPoint_endPoint_whenReady___block_invoke_3;
  v37[3] = &unk_1E52FCD30;
  id v12 = a1[6];
  v37[4] = a1[5];
  id v39 = &v40;
  id v38 = v12;
  [v10 _enumerateDeferredTouchUUIDs:v11 withBlock:v37];

  if (!v41[5])
  {
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __87__UIKeyboardLayout_recognizer_cancelTouchOnLayoutWithId_startPoint_endPoint_whenReady___block_invoke_6;
    v33[3] = &unk_1E52E3D98;
    id v13 = a1[6];
    id v14 = a1[5];
    id v34 = v13;
    id v35 = v14;
    uint64_t v36 = &v49;
    uint64_t v15 = [v33 copy];
    id v16 = (void *)v41[5];
    v41[5] = v15;
  }
  id v17 = [(id)v50[5] currentTouchPoint];
  [v17 CGPointValue];
  id v19 = v18;
  id v21 = v20;

  double Current = CFAbsoluteTimeGetCurrent();
  double v23 = *(double *)&sSystemUptimeFromAbsoluteTimeDiff;
  id v24 = (void *)[(id)v50[5] pathIndex];
  objc_initWeak(&location, a1[5]);
  if (qword_1EB259560 != -1) {
    dispatch_once(&qword_1EB259560, &__block_literal_global_365_0);
  }
  uint64_t v25 = [a1[5] taskQueue];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __87__UIKeyboardLayout_recognizer_cancelTouchOnLayoutWithId_startPoint_endPoint_whenReady___block_invoke_9;
  v26[3] = &unk_1E52FCD80;
  id v30 = &v40;
  objc_copyWeak(v31, &location);
  id v27 = a1[6];
  id v28 = a1[4];
  v31[1] = v19;
  v31[2] = v21;
  *(double *)&v31[3] = Current + v23;
  v31[4] = v24;
  id v29 = a1[7];
  [v25 addTask:v26 breadcrumb:qword_1EB259558];

  objc_destroyWeak(v31);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v49, 8);
}

void __87__UIKeyboardLayout_recognizer_cancelTouchOnLayoutWithId_startPoint_endPoint_whenReady___block_invoke_2(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 608) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __87__UIKeyboardLayout_recognizer_cancelTouchOnLayoutWithId_startPoint_endPoint_whenReady___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v19 = a2;
  id v5 = a3;
  if ([v19 phase] == 3 || objc_msgSend(v19, "phase") == 4)
  {
    if ([v19 phase] == 4
      || [*(id *)(a1 + 32) _handRestRecognizerCancelShouldBeEnd])
    {
      uint64_t v6 = [v5 copy];
      uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;
    }
    else
    {
      uint64_t v9 = *(void *)(a1 + 40);
      [v19 timestamp];
      double v11 = v10;
      id v12 = *(void **)(a1 + 32);
      [v19 locationInWindow];
      objc_msgSend(v12, "convertPoint:fromView:", 0);
      uint64_t v8 = +[UIKBTouchState touchStateForTouchUUID:withTimestamp:phase:location:pathIndex:inView:](UIKBTouchState, "touchStateForTouchUUID:withTimestamp:phase:location:pathIndex:inView:", v9, 4, [v19 pathIndex], *(void *)(a1 + 32), v11, v13, v14);
      uint64_t v15 = [*(id *)(a1 + 32) touchCancelledTaskForTouchState:v8 forResting:0];
      uint64_t v16 = [v15 copy];
      uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 8);
      id v18 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = v16;
    }
  }
  else
  {
    if (qword_1EB259550 != -1) {
      dispatch_once(&qword_1EB259550, &__block_literal_global_361_0);
    }
    uint64_t v8 = [*(id *)(a1 + 32) taskQueue];
    [v8 addTask:v5 breadcrumb:qword_1EB259548];
  }
}

void __87__UIKeyboardLayout_recognizer_cancelTouchOnLayoutWithId_startPoint_endPoint_whenReady___block_invoke_4()
{
  uint64_t v0 = [&__block_literal_global_363 copy];
  v1 = (void *)qword_1EB259548;
  qword_1EB259548 = v0;
}

uint64_t __87__UIKeyboardLayout_recognizer_cancelTouchOnLayoutWithId_startPoint_endPoint_whenReady___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __87__UIKeyboardLayout_recognizer_cancelTouchOnLayoutWithId_startPoint_endPoint_whenReady___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  CFAbsoluteTime v5 = CFAbsoluteTimeGetCurrent() + *(double *)&sSystemUptimeFromAbsoluteTimeDiff;
  uint64_t v6 = *(void **)(a1 + 40);
  uint64_t v7 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) currentTouchPoint];
  [v7 CGPointValue];
  objc_msgSend(v6, "convertPoint:fromView:", 0);
  +[UIKBTouchState touchStateForTouchUUID:withTimestamp:phase:location:pathIndex:inView:](UIKBTouchState, "touchStateForTouchUUID:withTimestamp:phase:location:pathIndex:inView:", v3, 4, [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) pathIndex], *(void *)(a1 + 40), v5, v8, v9);
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 40) touchCancelled:v10 forResting:0 executionContext:v4];
}

void __87__UIKeyboardLayout_recognizer_cancelTouchOnLayoutWithId_startPoint_endPoint_whenReady___block_invoke_7()
{
  uint64_t v0 = [&__block_literal_global_367_1 copy];
  v1 = (void *)qword_1EB259558;
  qword_1EB259558 = v0;
}

uint64_t __87__UIKeyboardLayout_recognizer_cancelTouchOnLayoutWithId_startPoint_endPoint_whenReady___block_invoke_8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __87__UIKeyboardLayout_recognizer_cancelTouchOnLayoutWithId_startPoint_endPoint_whenReady___block_invoke_9(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __87__UIKeyboardLayout_recognizer_cancelTouchOnLayoutWithId_startPoint_endPoint_whenReady___block_invoke_10;
  v6[3] = &unk_1E52FCD58;
  objc_copyWeak(&v10, (id *)(a1 + 64));
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  long long v11 = *(_OWORD *)(a1 + 72);
  uint64_t v12 = *(void *)(a1 + 88);
  uint64_t v13 = *(void *)(a1 + 96);
  id v9 = *(id *)(a1 + 48);
  CFAbsoluteTime v5 = [v3 childWithContinuation:v6];
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  objc_destroyWeak(&v10);
}

void __87__UIKeyboardLayout_recognizer_cancelTouchOnLayoutWithId_startPoint_endPoint_whenReady___block_invoke_10(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 56);
  id v4 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained(v3);
  [WeakRetained[54] removeObject:*(void *)(a1 + 32)];
  [WeakRetained[78] removeObject:*(void *)(a1 + 32)];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__UIKeyboardLayout_recognizer_cancelTouchOnLayoutWithId_startPoint_endPoint_whenReady___block_invoke_11;
  block[3] = &unk_1E52D9F98;
  void block[4] = WeakRetained;
  uint64_t v6 = *(NSObject **)(a1 + 40);
  id v18 = *(id *)(a1 + 32);
  dispatch_sync(v6, block);
  double v7 = *(double *)(a1 + 80);
  uint64_t v8 = *(unsigned int *)(a1 + 88);
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __87__UIKeyboardLayout_recognizer_cancelTouchOnLayoutWithId_startPoint_endPoint_whenReady___block_invoke_12;
  double v14 = &unk_1E52E3B88;
  id v16 = *(id *)(a1 + 48);
  id v15 = *(id *)(a1 + 32);
  id v10 = [v4 childWithContinuation:&v11];

  objc_msgSend(WeakRetained, "handRestRecognizerNotifyRestForBegin:location:timestamp:pathIndex:touchUUID:context:", 0, v8, v9, v10, *(double *)(a1 + 64), *(double *)(a1 + 72), v7, v11, v12, v13, v14);
}

uint64_t __87__UIKeyboardLayout_recognizer_cancelTouchOnLayoutWithId_startPoint_endPoint_whenReady___block_invoke_11(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 608) removeObjectForKey:*(void *)(a1 + 40)];
}

void __87__UIKeyboardLayout_recognizer_cancelTouchOnLayoutWithId_startPoint_endPoint_whenReady___block_invoke_12(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = *(void (**)(uint64_t, uint64_t))(v2 + 16);
  id v5 = a2;
  v4(v2, v3);
  [v5 returnExecutionToParent];
}

- (void)resetHRRLayoutState
{
  [(_UIKBRTRecognizer *)self->_handRestRecognizer reset];
  deferredTouchTaskListsQueue = self->_deferredTouchTaskListsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__UIKeyboardLayout_resetHRRLayoutState__block_invoke;
  block[3] = &unk_1E52D9F70;
  void block[4] = self;
  dispatch_sync(deferredTouchTaskListsQueue, block);
  [(_UIKBRTFingerDetection *)self->_fingerDetection reset];
  [(_UIKBRTTouchDrifting *)self->_touchDrifting reset];
}

uint64_t __39__UIKeyboardLayout_resetHRRLayoutState__block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v23 = 624;
  id obj = *(id *)(*(void *)(a1 + 32) + 624);
  uint64_t v2 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v30 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 608), "objectForKey:", *(void *)(*((void *)&v29 + 1) + 8 * i), v23);
        double v7 = *(void **)(a1 + 32);
        uint64_t v8 = [v6 currentTouchPoint];
        [v8 CGPointValue];
        double v10 = v9;
        double v12 = v11;
        CFAbsoluteTime v13 = CFAbsoluteTimeGetCurrent() + *(double *)&sSystemUptimeFromAbsoluteTimeDiff;
        uint64_t v14 = [v6 pathIndex];
        id v15 = [v6 touchUUID];
        objc_msgSend(v7, "handRestRecognizerNotifyRestForBegin:location:timestamp:pathIndex:touchUUID:context:", 0, v14, v15, 0, v10, v12, v13);
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v3);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v16 = [*(id *)(*(void *)(a1 + 32) + 608) allKeys];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v25 + 1) + 8 * j);
        objc_msgSend(*(id *)(*(void *)(a1 + 32) + 544), "removeTouchWithIdentifier:touchCancelled:", v21, 1, v23);
        [*(id *)(*(void *)(a1 + 32) + 600) removeTouchWithIdentifier:v21 touchCancelled:1];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v18);
  }

  [*(id *)(*(void *)(a1 + 32) + v23) removeAllObjects];
  return [*(id *)(*(void *)(a1 + 32) + 608) removeAllObjects];
}

- (BOOL)_shouldAllowKeyboardHandlingIfNecessaryForTouch:(id)a3 phase:(int64_t)a4 withTouchState:(id)a5 task:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if ([(UIKeyboardLayout *)self isExecutingDeferredTouchTasks]
    || ([(UIKeyboardLayout *)self handRestRecognizer],
        CFAbsoluteTime v13 = objc_claimAutoreleasedReturnValue(),
        v13,
        !v13))
  {
    BOOL v18 = 1;
  }
  else
  {
    uint64_t v14 = +[UIKBTouchStateTask touchStateTaskForTouchState:v11 andTask:v12];
    uint64_t v52 = 0;
    v53 = &v52;
    uint64_t v54 = 0x3032000000;
    v55 = __Block_byref_object_copy__134;
    v56 = __Block_byref_object_dispose__134;
    id v57 = 0;
    deferredTouchTaskListsQueue = self->_deferredTouchTaskListsQueue;
    uint64_t v44 = MEMORY[0x1E4F143A8];
    uint64_t v45 = 3221225472;
    v46 = __94__UIKeyboardLayout__shouldAllowKeyboardHandlingIfNecessaryForTouch_phase_withTouchState_task___block_invoke;
    id v47 = &unk_1E52E5070;
    v50 = &v52;
    id v48 = self;
    id v16 = v11;
    id v49 = v16;
    int64_t v51 = a4;
    dispatch_sync(deferredTouchTaskListsQueue, &v44);
    uint64_t v17 = (void *)v53[5];
    BOOL v18 = v17 == 0;
    if (v17)
    {
      objc_msgSend(v17, "addTask:", v14, v44, v45, v46, v47, v48);
      switch(a4)
      {
        case 0:
          long long v30 = [(UIKeyboardLayout *)self handRestRecognizer];
          long long v31 = [v16 touchUUID];
          objc_msgSend(v30, "touchDown:withIdentifier:canLogTouch:", v10, v31, -[UITextInputTraits isSecureTextEntry](self->_inputTraits, "isSecureTextEntry") ^ 1);
          goto LABEL_10;
        case 1:
        case 2:
          uint64_t v19 = [(UIKeyboardLayout *)self handRestRecognizer];
          uint64_t v20 = [v16 touchUUID];
          [v19 touchDragged:v10 withIdentifier:v20];

          [v16 locationInWindow];
          -[UIView convertPoint:fromView:](self, "convertPoint:fromView:", 0);
          double v22 = v21;
          double v24 = v23;
          long long v25 = [(UIKeyboardLayout *)self fingerDetection];
          long long v26 = [v16 touchUUID];
          [v16 pathMajorRadius];
          double v28 = v27;
          [v16 timestamp];
          objc_msgSend(v25, "moveTouchWithIdentifier:toLocation:withRadius:atTouchTime:", v26, v22, v24, v28, v29);

          long long v30 = [(UIKeyboardLayout *)self touchDrifting];
          long long v31 = [v16 touchUUID];
          [v16 pathMajorRadius];
          double v33 = v32;
          [v16 timestamp];
          objc_msgSend(v30, "moveTouchWithIdentifier:toLocation:withRadius:atTouchTime:", v31, v22, v24, v33, v34);
          goto LABEL_10;
        case 3:
          fingerDetection = self->_fingerDetection;
          uint64_t v36 = [v16 touchUUID];
          [(_UIKBRTFingerDetection *)fingerDetection removeTouchWithIdentifier:v36 touchCancelled:0];

          touchDrifting = self->_touchDrifting;
          id v38 = [v16 touchUUID];
          [(_UIKBRTTouchDrifting *)touchDrifting removeTouchWithIdentifier:v38 touchCancelled:0];

          long long v30 = [(UIKeyboardLayout *)self handRestRecognizer];
          long long v31 = [v16 touchUUID];
          [v30 touchUp:v10 withIdentifier:v31];
          goto LABEL_10;
        case 4:
          id v39 = self->_fingerDetection;
          uint64_t v40 = [v16 touchUUID];
          [(_UIKBRTFingerDetection *)v39 removeTouchWithIdentifier:v40 touchCancelled:1];

          id v41 = self->_touchDrifting;
          uint64_t v42 = [v16 touchUUID];
          [(_UIKBRTTouchDrifting *)v41 removeTouchWithIdentifier:v42 touchCancelled:1];

          long long v30 = [(UIKeyboardLayout *)self handRestRecognizer];
          long long v31 = [v16 touchUUID];
          [v30 touchCancelled:v10 withIdentifier:v31];
LABEL_10:

          break;
        default:
          break;
      }
    }

    _Block_object_dispose(&v52, 8);
  }

  return v18;
}

void __94__UIKeyboardLayout__shouldAllowKeyboardHandlingIfNecessaryForTouch_phase_withTouchState_task___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 608);
  uint64_t v3 = [*(id *)(a1 + 40) touchUUID];
  uint64_t v4 = [v2 objectForKey:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) && !*(void *)(a1 + 56))
  {
    double v7 = [*(id *)(a1 + 40) touchUUID];
    uint64_t v8 = +[UIKBTouchOrderedTaskList taskListForTouchUUID:withPathIndex:](UIKBTouchOrderedTaskList, "taskListForTouchUUID:withPathIndex:", v7, [*(id *)(a1 + 40) pathIndex]);
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    id v11 = *(void **)(*(void *)(a1 + 32) + 608);
    uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    CFAbsoluteTime v13 = [*(id *)(a1 + 40) touchUUID];
    [v11 setObject:v12 forKey:v13];

    uint64_t v14 = *(void **)(a1 + 32);
    [*(id *)(a1 + 40) locationInWindow];
    objc_msgSend(v14, "convertPoint:fromView:", 0);
    double v16 = v15;
    double v18 = v17;
    uint64_t v19 = *(void **)(*(void *)(a1 + 32) + 544);
    [*(id *)(a1 + 40) pathMajorRadius];
    double v21 = v20;
    [*(id *)(a1 + 40) timestamp];
    double v23 = v22;
    double v24 = [*(id *)(a1 + 40) touchUUID];
    objc_msgSend(v19, "addTouchLocation:withRadius:withTouchTime:withIdentifier:", v24, v16, v18, v21, v23);

    long long v25 = *(void **)(*(void *)(a1 + 32) + 600);
    [*(id *)(a1 + 40) pathMajorRadius];
    double v27 = v26;
    [*(id *)(a1 + 40) timestamp];
    double v29 = v28;
    id v30 = [*(id *)(a1 + 40) touchUUID];
    objc_msgSend(v25, "addTouchLocation:withRadius:withTouchTime:withIdentifier:", v30, v16, v18, v27, v29);
  }
}

- (void)_clearDeferredTouchTasks
{
  [(UIKeyboardLayout *)self setDeferredTouchDownTask:0];
  [(UIKeyboardLayout *)self setDeferredTouchMovedTask:0];
}

- (void)_executeDeferredTouchTasks
{
  [(UIKeyboardLayout *)self setIsExecutingDeferredTouchTasks:1];
  id deferredTouchDownTask = self->_deferredTouchDownTask;
  if (deferredTouchDownTask)
  {
    uint64_t v4 = (void (**)(void))[deferredTouchDownTask copy];
    [(UIKeyboardLayout *)self setDeferredTouchDownTask:0];
    v4[2](v4);
  }
  id deferredTouchMovedTask = self->_deferredTouchMovedTask;
  if (deferredTouchMovedTask)
  {
    uint64_t v6 = (void (**)(void))[deferredTouchMovedTask copy];
    [(UIKeyboardLayout *)self setDeferredTouchMovedTask:0];
    v6[2](v6);
  }
  [(UIKeyboardLayout *)self setIsExecutingDeferredTouchTasks:0];
}

- (void)_addTouchToScreenEdgePanRecognizer:(id)a3
{
  id v4 = a3;
  id v15 = [(UIKeyboardLayout *)self screenEdgePanRecognizer];
  [v4 _locationInSceneReferenceSpace];
  double v6 = v5;
  double v8 = v7;
  [v4 timestamp];
  double v10 = v9;
  uint64_t v11 = [v4 _edgeType];
  unint64_t v12 = [v4 _edgeAim];
  int64_t v13 = [(UIKBScreenTraits *)self->_screenTraits orientation];
  if ([v4 _edgeForcePending])
  {
    uint64_t v14 = 1;
  }
  else if ([v4 _edgeForceActive])
  {
    uint64_t v14 = 2;
  }
  else
  {
    uint64_t v14 = 0;
  }
  if ((unint64_t)(v11 - 1) >= 4) {
    uint64_t v11 = 0;
  }

  objc_msgSend(v15, "incorporateTouchSampleAtLocation:timestamp:modifier:region:interfaceOrientation:forceState:", v11, (v12 >> 1) & 1 | (4 * (v12 & 1)) & 0xF7 | (8 * ((v12 >> 2) & 1)) | (v12 >> 2) & 2, v13, v14, v6, v8, v10);
}

- (void)assertSavedLocation:(CGPoint)a3 onTouch:(id)a4 inWindow:(id)a5 resetPrevious:(BOOL)a6
{
  BOOL v6 = a6;
  double y = a3.y;
  double x = a3.x;
  id v14 = a4;
  id v10 = a5;
  uint64_t v11 = [v14 window];

  if (!v11)
  {
    objc_msgSend(v10, "convertPoint:toWindow:", 0, x, y);
    double x = v12;
    double y = v13;
  }
  objc_msgSend(v14, "_setLocationInWindow:resetPrevious:", v6, x, y);
}

- (BOOL)_shouldAllowKeyboardHandlingForTouchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(UIKeyboardLayout *)self canHandleEvent:v7]) {
    goto LABEL_12;
  }
  if (![(UIKeyboardLayout *)self isExecutingDeferredTouchTasks])
  {
    if (!self->_deferredTouchDownTask) {
      goto LABEL_16;
    }
    double v8 = [(UIKeyboardLayout *)self screenEdgePanRecognizer];
    uint64_t v9 = [v8 state];

    if (!v9)
    {
      [(UIKeyboardLayout *)self _executeDeferredTouchTasks];
      goto LABEL_10;
    }
    if (!self->_deferredTouchDownTask)
    {
LABEL_16:
      if ([(UIKeyboardLayout *)self _canAddTouchesToScreenGestureRecognizer:v6])
      {
        id v10 = [v6 anyObject];
        [(UIKeyboardLayout *)self _addTouchToScreenEdgePanRecognizer:v10];
        uint64_t v11 = [(UIKeyboardLayout *)self screenEdgePanRecognizer];
        uint64_t v12 = [v11 state];

        if (v12)
        {

          goto LABEL_10;
        }
        [v10 locationInView:0];
        id v15 = v14;
        double v17 = v16;
        double v18 = [v10 window];
        objc_initWeak(&location, self);
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __74__UIKeyboardLayout__shouldAllowKeyboardHandlingForTouchesBegan_withEvent___block_invoke;
        v22[3] = &unk_1E52FCDA8;
        objc_copyWeak(v27, &location);
        v27[1] = v15;
        v27[2] = v17;
        id v19 = v10;
        id v23 = v19;
        id v20 = v18;
        id v24 = v20;
        id v25 = v6;
        id v26 = v7;
        [(UIKeyboardLayout *)self setDeferredTouchDownTask:v22];

        objc_destroyWeak(v27);
        objc_destroyWeak(&location);

LABEL_12:
        BOOL v13 = 0;
        goto LABEL_13;
      }
    }
  }
LABEL_10:
  BOOL v13 = 1;
LABEL_13:

  return v13;
}

void __74__UIKeyboardLayout__shouldAllowKeyboardHandlingForTouchesBegan_withEvent___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "assertSavedLocation:onTouch:inWindow:resetPrevious:", *(void *)(a1 + 32), *(void *)(a1 + 40), 1, *(double *)(a1 + 72), *(double *)(a1 + 80));
  [WeakRetained touchesBegan:*(void *)(a1 + 48) withEvent:*(void *)(a1 + 56)];
}

- (BOOL)_shouldAllowKeyboardHandlingForTouchesMoved:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(UIKeyboardLayout *)self canHandleEvent:v7]) {
    goto LABEL_10;
  }
  if ([(UIKeyboardLayout *)self isExecutingDeferredTouchTasks]
    || !self->_deferredTouchDownTask
    || ![(UIKeyboardLayout *)self _canAddTouchesToScreenGestureRecognizer:v6])
  {
LABEL_12:
    BOOL v19 = 1;
    goto LABEL_13;
  }
  double v8 = [v6 anyObject];
  [(UIKeyboardLayout *)self _addTouchToScreenEdgePanRecognizer:v8];
  uint64_t v9 = [(UIKeyboardLayout *)self screenEdgePanRecognizer];
  uint64_t v10 = [v9 state];

  if (!v10)
  {
    [v8 locationInView:0];
    id v14 = v13;
    double v16 = v15;
    double v17 = [v8 window];
    objc_initWeak(&location, self);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __74__UIKeyboardLayout__shouldAllowKeyboardHandlingForTouchesMoved_withEvent___block_invoke;
    v21[3] = &unk_1E52FCDA8;
    objc_copyWeak(v26, &location);
    v26[1] = v14;
    v26[2] = v16;
    id v22 = v8;
    id v18 = v17;
    id v23 = v18;
    id v24 = v6;
    id v25 = v7;
    [(UIKeyboardLayout *)self setDeferredTouchMovedTask:v21];

    objc_destroyWeak(v26);
    objc_destroyWeak(&location);

    goto LABEL_9;
  }
  uint64_t v11 = [(UIKeyboardLayout *)self screenEdgePanRecognizer];
  uint64_t v12 = [v11 state];

  if (v12 != 1)
  {

    goto LABEL_12;
  }
  [(UIKeyboardLayout *)self _clearDeferredTouchTasks];
LABEL_9:

LABEL_10:
  BOOL v19 = 0;
LABEL_13:

  return v19;
}

void __74__UIKeyboardLayout__shouldAllowKeyboardHandlingForTouchesMoved_withEvent___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "assertSavedLocation:onTouch:inWindow:resetPrevious:", *(void *)(a1 + 32), *(void *)(a1 + 40), 0, *(double *)(a1 + 72), *(double *)(a1 + 80));
  [WeakRetained touchesMoved:*(void *)(a1 + 48) withEvent:*(void *)(a1 + 56)];
}

- (BOOL)_shouldAllowKeyboardHandlingForTouchesEndedOrCancelled:(id)a3 withEvent:(id)a4
{
  BOOL v5 = [(UIKeyboardLayout *)self canHandleEvent:a4];
  if (v5)
  {
    id v6 = [(UIKeyboardLayout *)self screenEdgePanRecognizer];
    uint64_t v7 = [v6 state];

    if (!v7) {
      [(UIKeyboardLayout *)self _executeDeferredTouchTasks];
    }
  }
  return v5;
}

- (void)_resetFingerDetectionFromLayout
{
  [(UIKeyboardLayout *)self handRestRecognizerStandardKeyPixelSize];
  double v4 = v3;
  double v6 = v5;
  [(UIKeyboardLayout *)self getCenterForKeyUnderLeftIndexFinger];
  double v8 = v7;
  double v10 = v9;
  [(UIKeyboardLayout *)self getCenterForKeyUnderRightIndexFinger];
  double v12 = v11;
  double v14 = v13;
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v15 = [(UIKeyboardLayout *)self getHorizontalOffsetFromHomeRowForRowRelativeToHomeRow:-1];
  if (v15)
  {
    double v16 = (void *)v15;
    uint64_t v17 = -2;
    do
    {
      [v24 insertObject:v16 atIndex:0];

      double v16 = [(UIKeyboardLayout *)self getHorizontalOffsetFromHomeRowForRowRelativeToHomeRow:v17];
      --v17;
    }
    while (v16);
  }
  uint64_t v18 = [v24 count];
  [v24 addObject:&unk_1ED3F5478];
  uint64_t v19 = [(UIKeyboardLayout *)self getHorizontalOffsetFromHomeRowForRowRelativeToHomeRow:1];
  if (v19)
  {
    id v20 = (void *)v19;
    uint64_t v21 = 2;
    do
    {
      [v24 addObject:v20];

      id v20 = [(UIKeyboardLayout *)self getHorizontalOffsetFromHomeRowForRowRelativeToHomeRow:v21];
      ++v21;
    }
    while (v20);
  }
  id v22 = [(UIKeyboardLayout *)self fingerDetection];
  objc_msgSend(v22, "updateWithFCenter:jCenter:keySize:rowOffsets:homeRowOffsetIndex:", v24, v18, v8, v10, v12, v14, v4, v6);

  id v23 = [(UIKeyboardLayout *)self touchDrifting];
  objc_msgSend(v23, "updateWithFCenter:jCenter:keySize:rowOffsets:homeRowOffsetIndex:", v24, v18, v8, v10, v12, v14, v4, v6);
}

- (void)didMoveToWindow
{
  double v3 = [(UIKeyboardLayout *)self screenEdgePanRecognizer];

  if (v3)
  {
    id v5 = [(UIKeyboardLayout *)self screenEdgePanRecognizer];
    double v4 = [(UIView *)self _window];
    [v4 _sceneReferenceBounds];
    objc_msgSend(v5, "setScreenBounds:");
  }
}

- (void)reloadKeyboardGestureRecognition
{
  [(UIKeyboardLayout *)self setDeferredTouchDownTask:0];
  [(UIKeyboardLayout *)self setDeferredTouchMovedTask:0];
  unint64_t v3 = [(UIKeyboardLayout *)self targetEdgesForScreenGestureRecognition];
  double v4 = [(UIKeyboardLayout *)self screenEdgePanRecognizer];
  id v5 = v4;
  if (v3)
  {

    if (!v5)
    {
      double v6 = [[_UIScreenEdgePanRecognizer alloc] initWithType:3];
      [(UIKeyboardLayout *)self setScreenEdgePanRecognizer:v6];

      double v7 = [(UIKeyboardLayout *)self screenEdgePanRecognizer];
      [v7 setDelegate:self];

      double v8 = [(UIKeyboardLayout *)self screenEdgePanRecognizer];
      double v9 = [(UIView *)self _window];
      [v9 _sceneReferenceBounds];
      objc_msgSend(v8, "setScreenBounds:");
    }
    double v10 = [(UIKeyboardLayout *)self screenEdgePanRecognizer];
    [v10 reset];

    double v11 = [(UIKeyboardLayout *)self screenEdgePanRecognizer];
    uint64_t v12 = [v11 targetEdges];

    if (v12 != v3)
    {
      id v13 = [(UIKeyboardLayout *)self screenEdgePanRecognizer];
      [v13 setTargetEdges:v3];
    }
  }
  else
  {
    [v4 setDelegate:0];

    [(UIKeyboardLayout *)self setScreenEdgePanRecognizer:0];
  }
}

- (void)updateTouchProcessingForKeyboardChange
{
  objc_initWeak(&location, self);
  if (qword_1EB259570 != -1) {
    dispatch_once(&qword_1EB259570, &__block_literal_global_371_0);
  }
  unint64_t v3 = [(UIKeyboardLayout *)self taskQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__UIKeyboardLayout_updateTouchProcessingForKeyboardChange__block_invoke_3;
  v4[3] = &unk_1E52FC970;
  objc_copyWeak(&v5, &location);
  [v3 addTask:v4 breadcrumb:qword_1EB259568];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __58__UIKeyboardLayout_updateTouchProcessingForKeyboardChange__block_invoke()
{
  uint64_t v0 = [&__block_literal_global_373_1 copy];
  v1 = (void *)qword_1EB259568;
  qword_1EB259568 = v0;
}

uint64_t __58__UIKeyboardLayout_updateTouchProcessingForKeyboardChange__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __58__UIKeyboardLayout_updateTouchProcessingForKeyboardChange__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained[76] count])
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v7 = WeakRetained[76];
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __58__UIKeyboardLayout_updateTouchProcessingForKeyboardChange__block_invoke_4;
    v46[3] = &unk_1E52FCDF8;
    id v47 = v5;
    id v48 = v6;
    id v8 = v6;
    id v9 = v5;
    [v7 enumerateKeysAndObjectsUsingBlock:v46];
    id v10 = WeakRetained[76];
    double v11 = [v8 allObjects];
    [v10 removeObjectsForKeys:v11];

    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __58__UIKeyboardLayout_updateTouchProcessingForKeyboardChange__block_invoke_7;
    v45[3] = &unk_1E52FCE20;
    v45[4] = WeakRetained;
    [v9 enumerateObjectsUsingBlock:v45];
  }
  uint64_t v12 = [WeakRetained touchDrifting];
  [v12 reset];

  int v13 = [WeakRetained getHandRestRecognizerState];
  int v14 = v13;
  if ((v13 - 1) < 2)
  {
    uint64_t v15 = [WeakRetained handRestRecognizer];

    if (!v15)
    {
      double v16 = objc_alloc_init(_UIKBRTRecognizer);
      [WeakRetained setHandRestRecognizer:v16];

      uint64_t v17 = [WeakRetained handRestRecognizer];
      [v17 setDelegate:WeakRetained];
    }
    uint64_t v18 = [WeakRetained fingerDetection];

    if (!v18)
    {
      uint64_t v19 = [[_UIKBRTFingerDetection alloc] initWithParentView:WeakRetained];
      [WeakRetained setFingerDetection:v19];
    }
    if (v14 == 1)
    {
      BOOL v20 = +[_UIKBRTTouchDrifting isEnabled];
      uint64_t v21 = [WeakRetained touchDrifting];
      id v22 = v21;
      if (v20)
      {

        if (!v22)
        {
          id v23 = [[_UIKBRTTouchDrifting alloc] initWithParentView:WeakRetained];
          [WeakRetained setTouchDrifting:v23];

          id v24 = [WeakRetained touchDrifting];
          [v24 setDelegate:WeakRetained];
        }
        goto LABEL_16;
      }
    }
    else
    {
      uint64_t v21 = [WeakRetained touchDrifting];
      id v22 = v21;
    }
    [v21 setDelegate:0];

    [WeakRetained setTouchDrifting:0];
LABEL_16:
    if ((_UIInternalPreferenceUsesDefault_0(&_MergedGlobals_29, @"_UIKBRT_CadenceMonitor") & 1) != 0
      || byte_1EB2576B4)
    {
      double v28 = [WeakRetained cadenceMonitor];

      if (!v28)
      {
        double v29 = objc_alloc_init(UIKBCadenceMonitor);
        [WeakRetained setCadenceMonitor:v29];
      }
      id v30 = [WeakRetained handRestRecognizer];
      long long v31 = [v30 averagingRules];
      double v32 = [WeakRetained cadenceMonitor];
      [v31 addObject:v32];
    }
    if (((_UIInternalPreferenceUsesDefault_0(&dword_1EB2576B8, @"_UIKBRT_TouchVelocities") & 1) != 0
       || byte_1EB2576BC)
      && MGGetBoolAnswer())
    {
      double v33 = [WeakRetained touchVelocities];

      if (!v33)
      {
        double v34 = objc_alloc_init(_UIKBRTTouchVelocities);
        [WeakRetained setTouchVelocities:v34];
      }
      uint64_t v35 = [WeakRetained handRestRecognizer];
      uint64_t v36 = [v35 averagingRules];
      char v37 = [WeakRetained touchVelocities];
      [v36 addObject:v37];
    }
    [WeakRetained handRestRecognizerStandardKeyPixelSize];
    double v39 = v38;
    double v41 = v40;
    uint64_t v42 = [WeakRetained handRestRecognizer];
    objc_msgSend(v42, "setStandardKeyPixelSize:", v39, v41);

    uint64_t v43 = [WeakRetained handRestRecognizer];
    [v43 setDisableHomeRowReturn:v14 == 2];

    [WeakRetained _resetFingerDetectionFromLayout];
    uint64_t v44 = [WeakRetained cadenceMonitor];
    [v44 reset];

    uint64_t v27 = 0;
    goto LABEL_28;
  }
  if (!v13)
  {
    [WeakRetained setCadenceMonitor:0];
    id v25 = [WeakRetained touchDrifting];
    [v25 setDelegate:0];

    [WeakRetained setTouchDrifting:0];
    [WeakRetained setFingerDetection:0];
    id v26 = [WeakRetained handRestRecognizer];
    [v26 setDelegate:0];

    [WeakRetained setHandRestRecognizer:0];
    uint64_t v27 = 1;
LABEL_28:
    [WeakRetained _setRequiresExclusiveTouch:v27];
  }
  [v3 returnExecutionToParent];
}

void __58__UIKeyboardLayout_updateTouchProcessingForKeyboardChange__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F1CA98] null];

  if (v7 != v6)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __58__UIKeyboardLayout_updateTouchProcessingForKeyboardChange__block_invoke_5;
    v8[3] = &unk_1E52FCDD0;
    id v9 = *(id *)(a1 + 32);
    [v6 removeTasksMatchingFilter:v8];
    if (([v6 hasTasks] & 1) == 0) {
      [*(id *)(a1 + 40) addObject:v5];
    }
  }
}

uint64_t __58__UIKeyboardLayout_updateTouchProcessingForKeyboardChange__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isBusy] & 1) == 0) {
    objc_msgSend(*(id *)(a1 + 32), "insertObject:atIndex:", v3, objc_msgSend(*(id *)(a1 + 32), "indexOfObject:inSortedRange:options:usingComparator:", v3, 0, objc_msgSend(*(id *)(a1 + 32), "count"), 1024, &__block_literal_global_375_0));
  }
  uint64_t v4 = [v3 isBusy] ^ 1;

  return v4;
}

uint64_t __58__UIKeyboardLayout_updateTouchProcessingForKeyboardChange__block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __58__UIKeyboardLayout_updateTouchProcessingForKeyboardChange__block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v3 = qword_1EB259580;
  id v4 = a2;
  if (v3 != -1) {
    dispatch_once(&qword_1EB259580, &__block_literal_global_379_1);
  }
  id v6 = [*(id *)(a1 + 32) taskQueue];
  id v5 = [v4 task];

  [v6 addTask:v5 breadcrumb:qword_1EB259578];
}

void __58__UIKeyboardLayout_updateTouchProcessingForKeyboardChange__block_invoke_8()
{
  uint64_t v0 = [&__block_literal_global_381_2 copy];
  v1 = (void *)qword_1EB259578;
  qword_1EB259578 = v0;
}

uint64_t __58__UIKeyboardLayout_updateTouchProcessingForKeyboardChange__block_invoke_9(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (void)updateTouchProcessingForKeyplaneChange
{
  uint64_t v3 = [(UIKeyboardLayout *)self touchDrifting];
  [v3 reset];

  int v4 = [(UIKeyboardLayout *)self getHandRestRecognizerState];
  int v5 = v4;
  if ((v4 - 1) < 2)
  {
    id v6 = [(UIKeyboardLayout *)self handRestRecognizer];

    if (!v6)
    {
      id v7 = objc_alloc_init(_UIKBRTRecognizer);
      [(UIKeyboardLayout *)self setHandRestRecognizer:v7];

      id v8 = [(UIKeyboardLayout *)self handRestRecognizer];
      [v8 setDelegate:self];
    }
    id v9 = [(UIKeyboardLayout *)self fingerDetection];

    if (!v9)
    {
      id v10 = [[_UIKBRTFingerDetection alloc] initWithParentView:self];
      [(UIKeyboardLayout *)self setFingerDetection:v10];
    }
    if (v5 == 1)
    {
      BOOL v11 = +[_UIKBRTTouchDrifting isEnabled];
      uint64_t v12 = [(UIKeyboardLayout *)self touchDrifting];
      int v13 = v12;
      if (v11)
      {

        if (!v13)
        {
          int v14 = [[_UIKBRTTouchDrifting alloc] initWithParentView:self];
          [(UIKeyboardLayout *)self setTouchDrifting:v14];

          uint64_t v15 = [(UIKeyboardLayout *)self touchDrifting];
          [v15 setDelegate:self];
        }
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v12 = [(UIKeyboardLayout *)self touchDrifting];
      int v13 = v12;
    }
    [v12 setDelegate:0];

    [(UIKeyboardLayout *)self setTouchDrifting:0];
LABEL_15:
    if ((_UIInternalPreferenceUsesDefault_0(&_MergedGlobals_29, @"_UIKBRT_CadenceMonitor") & 1) != 0
      || byte_1EB2576B4)
    {
      uint64_t v18 = [(UIKeyboardLayout *)self cadenceMonitor];

      if (!v18)
      {
        uint64_t v19 = objc_alloc_init(UIKBCadenceMonitor);
        [(UIKeyboardLayout *)self setCadenceMonitor:v19];
      }
      BOOL v20 = [(UIKeyboardLayout *)self handRestRecognizer];
      uint64_t v21 = [v20 averagingRules];
      id v22 = [(UIKeyboardLayout *)self cadenceMonitor];
      [v21 addObject:v22];
    }
    if (((_UIInternalPreferenceUsesDefault_0(&dword_1EB2576B8, @"_UIKBRT_TouchVelocities") & 1) != 0
       || byte_1EB2576BC)
      && MGGetBoolAnswer())
    {
      id v23 = [(UIKeyboardLayout *)self touchVelocities];

      if (!v23)
      {
        id v24 = objc_alloc_init(_UIKBRTTouchVelocities);
        [(UIKeyboardLayout *)self setTouchVelocities:v24];
      }
      id v25 = [(UIKeyboardLayout *)self handRestRecognizer];
      id v26 = [v25 averagingRules];
      uint64_t v27 = [(UIKeyboardLayout *)self touchVelocities];
      [v26 addObject:v27];
    }
    [(UIKeyboardLayout *)self handRestRecognizerStandardKeyPixelSize];
    double v29 = v28;
    double v31 = v30;
    double v32 = [(UIKeyboardLayout *)self handRestRecognizer];
    objc_msgSend(v32, "setStandardKeyPixelSize:", v29, v31);

    double v33 = [(UIKeyboardLayout *)self handRestRecognizer];
    [v33 setDisableHomeRowReturn:v5 == 2];

    [(UIKeyboardLayout *)self _resetFingerDetectionFromLayout];
    double v34 = [(UIKeyboardLayout *)self cadenceMonitor];
    [v34 reset];

    uint64_t v17 = 0;
    goto LABEL_27;
  }
  if (v4) {
    return;
  }
  [(UIKeyboardLayout *)self setCadenceMonitor:0];
  double v16 = [(UIKeyboardLayout *)self touchDrifting];
  [v16 setDelegate:0];

  [(UIKeyboardLayout *)self setTouchDrifting:0];
  [(UIKeyboardLayout *)self setFingerDetection:0];
  [(UIKeyboardLayout *)self setHandRestRecognizer:0];
  uint64_t v17 = 1;
LABEL_27:
  [(UIKeyboardLayout *)self _setRequiresExclusiveTouch:v17];
}

- (BOOL)_canAddTouchesToScreenGestureRecognizer:(id)a3
{
  id v4 = a3;
  if ([v4 count] == 1)
  {
    int v5 = [v4 anyObject];
    [(UIKeyboardLayout *)self lastTouchUpTime];
    if (v6 == 0.0
      || ([v5 timestamp],
          double v8 = v7,
          [(UIKeyboardLayout *)self lastTouchUpTime],
          v8 - v9 >= 0.15))
    {
      BOOL v11 = [(UIKeyboardLayout *)self screenEdgePanRecognizer];
      if (v11)
      {
        uint64_t v12 = [(UIKeyboardLayout *)self screenEdgePanRecognizer];
        BOOL v13 = [v12 state] != 2;
      }
      else
      {
        BOOL v13 = 0;
      }

      if ([(NSMutableArray *)self->_uncommittedTouchUUIDs count]) {
        BOOL v10 = 0;
      }
      else {
        BOOL v10 = v13;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)screenEdgePanRecognizerStateDidChange:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 1)
  {
    [(UIKeyboardLayout *)self _clearDeferredTouchTasks];
  }
  else if ([v4 state] == 2)
  {
    [(UIKeyboardLayout *)self _executeDeferredTouchTasks];
  }
}

- (unsigned)getHandRestRecognizerState
{
  return 0;
}

- (BOOL)handRestRecognizerShouldNeverIgnoreTouchState:(id)a3 fromPoint:(CGPoint)a4 toPoint:(CGPoint)a5 forRestingState:(unint64_t)a6 otherRestedTouchLocations:(id)a7
{
  return 0;
}

- (CGSize)handRestRecognizerStandardKeyPixelSize
{
  double v2 = 0.0;
  double v3 = 0.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)handRestRecognizerSilenceNextTouchDown
{
  return 0;
}

- (void)handRestRecognizerNotifyRestForBegin:(BOOL)a3 location:(CGPoint)a4 timestamp:(double)a5 pathIndex:(int)a6 touchUUID:(id)a7 context:(id)a8
{
  objc_msgSend(a8, "returnExecutionToParent", a3, *(void *)&a6, a7, a4.x, a4.y, a5);
}

- (CGPoint)getCenterForKeyUnderLeftIndexFinger
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (CGPoint)getCenterForKeyUnderRightIndexFinger
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (id)getHorizontalOffsetFromHomeRowForRowRelativeToHomeRow:(int64_t)a3
{
  return 0;
}

- (void)_updateTouchState:(id)a3 errorVector:(CGPoint)a4 rowOffsetFromHomeRow:(int64_t)a5
{
  touchDrifting = self->_touchDrifting;
  if (touchDrifting)
  {
    double y = a4.y;
    double x = a4.x;
    id v9 = a3;
    id v12 = [v9 touchUUID];
    [v9 timestamp];
    double v11 = v10;

    -[_UIKBRTTouchDrifting updateTouchWithIdentifier:withTouchTime:resultingError:rowOffsetFromHomeRow:](touchDrifting, "updateTouchWithIdentifier:withTouchTime:resultingError:rowOffsetFromHomeRow:", v12, a5, v11, x, y);
  }
}

- (void)_ignoreTouchState:(id)a3
{
  touchDrifting = self->_touchDrifting;
  if (touchDrifting)
  {
    id v4 = a3;
    id v7 = [v4 touchUUID];
    [v4 timestamp];
    double v6 = v5;

    [(_UIKBRTTouchDrifting *)touchDrifting ignoreTouchWithIdentifier:v7 withTouchTime:v6];
  }
}

- (BOOL)_hasRelatedTouchesForTouchState:(id)a3
{
  fingerDetection = self->_fingerDetection;
  if (fingerDetection)
  {
    id v4 = [a3 touchUUID];
    double v5 = [(_UIKBRTFingerDetection *)fingerDetection fingerIdsRelatedToTouchWithIdentifier:v4 sinceTimestamp:0 includeThumbs:0.0];

    LOBYTE(fingerDetection) = [v5 count] != 0;
  }
  return (char)fingerDetection;
}

- (BOOL)_handRestRecognizerCancelShouldBeEnd
{
  return 0;
}

- (BOOL)isReachableDevice
{
  return [(UIKBScreenTraits *)self->_screenTraits idiom] == 0;
}

- (BOOL)supportsVirtualDrift
{
  double v2 = [(UIKeyboardLayout *)self touchDrifting];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CGPoint)leftVirtualDriftOffset
{
  BOOL v3 = [(UIKeyboardLayout *)self touchDrifting];

  if (v3)
  {
    id v4 = [(UIKeyboardLayout *)self touchDrifting];
    [v4 leftHandDriftOffset];
    double v6 = v5;
    double v8 = v7;
  }
  else
  {
    double v6 = *MEMORY[0x1E4F1DAD8];
    double v8 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  double v9 = v6;
  double v10 = v8;
  result.double y = v10;
  result.double x = v9;
  return result;
}

- (CGPoint)rightVirtualDriftOffset
{
  BOOL v3 = [(UIKeyboardLayout *)self touchDrifting];

  if (v3)
  {
    id v4 = [(UIKeyboardLayout *)self touchDrifting];
    [v4 rightHandDriftOffset];
    double v6 = v5;
    double v8 = v7;
  }
  else
  {
    double v6 = *MEMORY[0x1E4F1DAD8];
    double v8 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  double v9 = v6;
  double v10 = v8;
  result.double y = v10;
  result.double x = v9;
  return result;
}

- (void)_uikbrtTouchDriftingStateChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(UIKeyboardLayout *)self touchDrifting];

  if (v5 == v4)
  {
    [(UIKeyboardLayout *)self setNeedsVirtualDriftUpdate];
  }
}

- (unint64_t)_uikbrtTouchDrifting:(id)a3 fingerIDFortouchIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(UIKeyboardLayout *)self touchDrifting];

  if (v8 == v7)
  {
    double v10 = [(UIKeyboardLayout *)self fingerDetection];
    unint64_t v9 = [v10 fingerIdForTouchWithIdentifier:v6];
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

- (id)_uikbrtTouchDrifting:(id)a3 touchIdentifiersForFingerID:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(UIKeyboardLayout *)self touchDrifting];

  if (v7 == v6)
  {
    unint64_t v9 = [(UIKeyboardLayout *)self fingerDetection];
    id v8 = [v9 touchIdentifiersForFingerId:a4];
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

- (CGPoint)_uikbrtTouchDrifting:(id)a3 touchCenterForFingerID:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(UIKeyboardLayout *)self touchDrifting];

  if (v7 == v6)
  {
    double v10 = [(UIKeyboardLayout *)self fingerDetection];
    [v10 touchLocationForFingerId:a4];
    double v8 = v11;
    double v9 = v12;
  }
  else
  {
    double v8 = *MEMORY[0x1E4F1DAD8];
    double v9 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  double v13 = v8;
  double v14 = v9;
  result.double y = v14;
  result.double x = v13;
  return result;
}

- (unint64_t)fingerIDForTouchUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(UIKeyboardLayout *)self fingerDetection];

  if (v5
    && ([(UIKeyboardLayout *)self fingerDetection],
        id v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 fingerIdForTouchWithIdentifier:v4],
        v6,
        (unint64_t)(v7 - 1) <= 0xB))
  {
    unint64_t v8 = qword_186B9AAD8[v7 - 1];
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

- (unint64_t)targetEdgesForScreenGestureRecognition
{
  return 0;
}

- (BOOL)canHandleEvent:(id)a3
{
  return [a3 type] == 0;
}

- (BOOL)canHandlePresses:(id)a3 withEvent:(id)a4
{
  return [(UIKeyboardLayout *)self canHandleEvent:a4];
}

- (void)setDisableInteraction:(BOOL)a3
{
  self->_disableInteraction = a3;
  [(UIView *)self setUserInteractionEnabled:!a3];
}

- (void)setPreferredHeight:(double)a3
{
  self->_preferredHeight = a3;
  self->_hasPreferredHeight = 1;
}

- (double)hitBuffer
{
  return 0.0;
}

- (double)flickDistance
{
  uint64_t SafeDeviceIdiom = UIKeyboardGetSafeDeviceIdiom();
  double result = 10.0;
  if ((SafeDeviceIdiom & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    return 30.0;
  }
  return result;
}

- (CGRect)dragGestureRectInView:(id)a3
{
  id v4 = a3;
  [(UIView *)self bounds];
  -[UIView convertRect:toView:](self, "convertRect:toView:", v4, v17.origin.x + v17.size.width + -80.0, CGRectGetMaxY(v17) + -80.0, 80.0, 80.0);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (CGRect)frameForKeylayoutName:(id)a3
{
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (SEL)handlerForNotification:(id)a3
{
  return 0;
}

- (void)fadeWithInvocation:(id)a3
{
}

- (BOOL)shouldFadeFromLayout
{
  return 0;
}

- (BOOL)shouldFadeToLayout
{
  return 0;
}

- (void)willBeginIndirectSelectionGesture
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"UIKeyboardWillBeginIndirectSelectionGestureNotification" object:0 userInfo:0];
}

- (void)didEndIndirectSelectionGesture
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"UIKeyboardDidEndIndirectSelectionGestureNotification" object:0 userInfo:0];
}

- (void)cancelTouchesForTwoFingerTapGesture:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    double v5 = [(UIKeyboardLayout *)self handRestRecognizer];

    if (v5)
    {
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v35 = v4;
      id v6 = v4;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v37;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v37 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = *(void *)(*((void *)&v36 + 1) + 8 * i);
            double v12 = +[UIKBTouchState touchStateForTouch:v11];
            double v13 = v12;
            if (v12)
            {
              uint64_t v14 = 624;
              touchIgnoredUUIDSet = self->_touchIgnoredUUIDSet;
              double v16 = [v12 touchUUID];
              LODWORD(touchIgnoredUUIDSet) = [(NSMutableSet *)touchIgnoredUUIDSet containsObject:v16];

              if (touchIgnoredUUIDSet
                || (uint64_t v14 = 432,
                    uncommittedTouchUUIDs = self->_uncommittedTouchUUIDs,
                    [v13 touchUUID],
                    uint64_t v18 = objc_claimAutoreleasedReturnValue(),
                    LODWORD(uncommittedTouchUUIDs) = [(NSMutableArray *)uncommittedTouchUUIDs containsObject:v18], v18, uncommittedTouchUUIDs))
              {
                uint64_t v19 = *(Class *)((char *)&self->super.super.super.isa + v14);
                BOOL v20 = [v13 touchUUID];
                [v19 removeObject:v20];

                uint64_t v21 = [(UIKeyboardLayout *)self handRestRecognizer];
                id v22 = [v13 touchUUID];
                [v21 markTouchProcessed:v11 withIdentifier:v22];
              }
              [v13 locationInWindow];
              -[UIView convertPoint:fromView:](self, "convertPoint:fromView:", 0);
              double v24 = v23;
              double v26 = v25;
              [v13 timestamp];
              double v28 = v27;
              uint64_t v29 = [v13 pathIndex];
              double v30 = [v13 touchUUID];
              -[UIKeyboardLayout handRestRecognizerNotifyRestForBegin:location:timestamp:pathIndex:touchUUID:context:](self, "handRestRecognizerNotifyRestForBegin:location:timestamp:pathIndex:touchUUID:context:", 0, v29, v30, 0, v24, v26, v28);

              double v31 = [(UIKeyboardLayout *)self fingerDetection];
              double v32 = [v13 touchUUID];
              [v31 removeTouchWithIdentifier:v32 touchCancelled:1];

              double v33 = [(UIKeyboardLayout *)self touchDrifting];
              double v34 = [v13 touchUUID];
              [v33 removeTouchWithIdentifier:v34 touchCancelled:1];
            }
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v36 objects:v40 count:16];
        }
        while (v8);
      }

      id v4 = v35;
    }
  }
}

- (int64_t)currentHandBias
{
  return 0;
}

- (double)biasedKeyboardWidthRatio
{
  return 1.0;
}

- (id)currentKeyplane
{
  return 0;
}

- (BOOL)_allowContinuousPathUI
{
  return 0;
}

- (BOOL)keyplaneContainsDismissKey
{
  return 0;
}

- (BOOL)keyplaneContainsEmojiKey
{
  return 0;
}

- (BOOL)isEmojiKeyplane
{
  return 0;
}

- (BOOL)supportsEmoji
{
  return 0;
}

- (BOOL)isResizing
{
  return 0;
}

- (BOOL)isResized
{
  return 0;
}

- (BOOL)isPossibleToTypeFast
{
  return 1;
}

- (BOOL)globeKeyDisplaysAsEmojiKey
{
  return 0;
}

- (BOOL)showsDedicatedEmojiKeyAlongsideGlobeButton
{
  return 0;
}

- (UIEdgeInsets)keyplanePadding
{
  double v3 = [(UIKeyboardLayout *)self currentKeyplane];
  [(UIView *)self frame];
  double v5 = v4;
  double v7 = v6;
  [v3 keyUnionPaddedFrame];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  if (([v3 visualStyling] & 0xFF0000) == 0x90000) {
    double v16 = 0.0;
  }
  else {
    double v16 = v11;
  }

  double v17 = v16;
  double v18 = v9;
  double v19 = v7 - v15 - v11;
  double v20 = v5 - v13 - v9;
  result.right = v20;
  result.bottom = v19;
  result.left = v18;
  result.top = v17;
  return result;
}

- (id)internationalKeyDisplayStringOnEmojiKeyboard
{
  return 0;
}

- (BOOL)shouldAllowSelectionGestures:(BOOL)a3 atPoint:(CGPoint)a4 toBegin:(BOOL)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  BOOL result = 1;
  if (a5 && !a3)
  {
    double v7 = [(UIKeyboardLayout *)self handRestRecognizer];

    if (v7)
    {
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      double v8 = [(UIView *)self gestureRecognizers];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v47 objects:v52 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v48;
LABEL_6:
        uint64_t v11 = 0;
        while (1)
        {
          if (*(void *)v48 != v10) {
            objc_enumerationMutation(v8);
          }
          double v12 = *(void **)(*((void *)&v47 + 1) + 8 * v11);
          if ([v12 _isGestureType:8])
          {
            if ((unint64_t)[v12 minimumNumberOfTouches] > 1) {
              break;
            }
          }
          if (v9 == ++v11)
          {
            uint64_t v9 = [v8 countByEnumeratingWithState:&v47 objects:v52 count:16];
            if (v9) {
              goto LABEL_6;
            }
            goto LABEL_13;
          }
        }
        double v31 = v12;

        if (!v31) {
          return 1;
        }
        id v32 = v31[39];
        double v34 = +[UIKBTouchState touchUUIDsForTouches:](UIKBTouchState, "touchUUIDsForTouches:");
        double v14 = [v32 lastObject];
        [v14 timestamp];
        double v16 = v15;

        uint64_t v17 = [v34 count];
        if (v17 == [v32 count])
        {
          long long v45 = 0u;
          long long v46 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          id obj = self->_touchIgnoredUUIDSet;
          uint64_t v18 = [(NSMutableSet *)obj countByEnumeratingWithState:&v43 objects:v51 count:16];
          if (v18)
          {
            uint64_t v19 = *(void *)v44;
            BOOL v13 = 1;
LABEL_19:
            uint64_t v20 = 0;
            while (1)
            {
              if (*(void *)v44 != v19) {
                objc_enumerationMutation(obj);
              }
              uint64_t v21 = *(void *)(*((void *)&v43 + 1) + 8 * v20);
              uint64_t v37 = 0;
              long long v38 = &v37;
              uint64_t v39 = 0x3032000000;
              double v40 = __Block_byref_object_copy__134;
              deferredTouchTaskListsQueue = self->_deferredTouchTaskListsQueue;
              uint64_t v41 = __Block_byref_object_dispose__134;
              id v42 = 0;
              block[0] = MEMORY[0x1E4F143A8];
              block[1] = 3221225472;
              block[2] = __65__UIKeyboardLayout_shouldAllowSelectionGestures_atPoint_toBegin___block_invoke;
              block[3] = &unk_1E52E1B98;
              void block[5] = v21;
              block[6] = &v37;
              void block[4] = self;
              dispatch_sync(deferredTouchTaskListsQueue, block);
              double v23 = (void *)v38[5];
              if (!v23) {
                goto LABEL_27;
              }
              [v23 originalStartTime];
              double v25 = v24;
              char v26 = [v34 containsObject:v21];
              char v27 = vabdd_f64(v25, v16) >= 0.05 ? 1 : v26;
              if ((v27 & 1) == 0)
              {
                int v28 = 0;
                BOOL v13 = 0;
              }
              else
              {
LABEL_27:
                int v28 = 1;
              }
              _Block_object_dispose(&v37, 8);

              if (!v28) {
                break;
              }
              if (v18 == ++v20)
              {
                uint64_t v18 = [(NSMutableSet *)obj countByEnumeratingWithState:&v43 objects:v51 count:16];
                if (v18) {
                  goto LABEL_19;
                }
                break;
              }
            }

            if (!v13) {
              goto LABEL_39;
            }
          }
          else
          {

            BOOL v13 = 1;
          }
          uint64_t v29 = [(UIKeyboardLayout *)self fingerDetection];
          BOOL v30 = v29 == 0;

          if (!v30)
          {
            uint64_t v37 = 0;
            long long v38 = &v37;
            uint64_t v39 = 0x3032000000;
            double v40 = __Block_byref_object_copy__134;
            uint64_t v41 = __Block_byref_object_dispose__134;
            id v42 = 0;
            v35[0] = MEMORY[0x1E4F143A8];
            v35[1] = 3221225472;
            v35[2] = __65__UIKeyboardLayout_shouldAllowSelectionGestures_atPoint_toBegin___block_invoke_2;
            v35[3] = &unk_1E52FCE48;
            v35[4] = self;
            v35[5] = &v37;
            [v32 enumerateObjectsUsingBlock:v35];
            [(id)v38[5] removeObject:&unk_1ED3F5490];
            [(id)v38[5] removeObject:&unk_1ED3F54A8];
            BOOL v13 = [(id)v38[5] count] == 0;
            _Block_object_dispose(&v37, 8);
          }
        }
        else
        {
          BOOL v13 = 1;
        }
LABEL_39:

        double v8 = v31;
        goto LABEL_40;
      }
LABEL_13:
      BOOL v13 = 1;
LABEL_40:

      return v13;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

void __65__UIKeyboardLayout_shouldAllowSelectionGestures_atPoint_toBegin___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 608) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  double v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __65__UIKeyboardLayout_shouldAllowSelectionGestures_atPoint_toBegin___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = +[UIKBTouchState touchStateForTouch:a2];
  if (v3)
  {
    id v13 = v3;
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    double v5 = [*(id *)(a1 + 32) fingerDetection];
    double v6 = [v13 touchUUID];
    if (v4)
    {
      uint64_t v7 = [v5 fingerIdForTouchWithIdentifier:v6];

      double v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      double v5 = [NSNumber numberWithUnsignedInteger:v7];
      [v8 removeObject:v5];
    }
    else
    {
      uint64_t v9 = [v5 fingerIdsRelatedToTouchWithIdentifier:v6 sinceTimestamp:1 includeThumbs:0.0];
      uint64_t v10 = [v9 mutableCopy];
      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
      double v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;
    }
    uint64_t v3 = v13;
  }
}

- (CGSize)stretchFactor
{
  double v2 = 1.0;
  double v3 = 1.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)shouldMergeAssistantBarWithKeyboardLayout
{
  return 0;
}

- (id)baseKeyForString:(id)a3
{
  return 0;
}

- (id)keyplaneForKey:(id)a3
{
  return 0;
}

- (id)keyplaneNamed:(id)a3
{
  return 0;
}

- (id)simulateTouch:(CGPoint)a3
{
  return &stru_1ED0E84C0;
}

- (id)simulateTouchForCharacter:(id)a3 errorVector:(CGPoint)a4 shouldTypeVariants:(BOOL)a5 baseKeyForVariants:(BOOL)a6
{
  return &stru_1ED0E84C0;
}

- (BOOL)hasActiveContinuousPathInput
{
  return 0;
}

- (BOOL)isHandwritingPlane
{
  return 0;
}

- (id)getRomanAccentVariantsForString:(id)a3 inputMode:(id)a4 keyboardVariantIndludes:(int)a5
{
  return UIKeyboardRomanAccentVariants((uint64_t)a3, a4, *(uint64_t *)&a5);
}

- (NSUUID)activeTouchUUID
{
  return self->_activeTouchUUID;
}

- (void)setActiveTouchUUID:(id)a3
{
}

- (NSUUID)shiftKeyTouchUUID
{
  return self->_shiftKeyTouchUUID;
}

- (void)setShiftKeyTouchUUID:(id)a3
{
}

- (unint64_t)cursorLocation
{
  return self->_cursorLocation;
}

- (void)setCursorLocation:(unint64_t)a3
{
  self->_cursorLocation = a3;
}

- (BOOL)disableInteraction
{
  return self->_disableInteraction;
}

- (double)preferredHeight
{
  return self->_preferredHeight;
}

- (BOOL)hideKeysUnderIndicator
{
  return self->hideKeysUnderIndicator;
}

- (void)setHideKeysUnderIndicator:(BOOL)a3
{
  self->hideKeysUnderIndicator = a3;
}

- (_UIScreenEdgePanRecognizer)screenEdgePanRecognizer
{
  return self->_screenEdgePanRecognizer;
}

- (void)setScreenEdgePanRecognizer:(id)a3
{
}

- (id)deferredTouchDownTask
{
  return self->_deferredTouchDownTask;
}

- (void)setDeferredTouchDownTask:(id)a3
{
}

- (id)deferredTouchMovedTask
{
  return self->_deferredTouchMovedTask;
}

- (void)setDeferredTouchMovedTask:(id)a3
{
}

- (_UIKBRTRecognizer)handRestRecognizer
{
  return self->_handRestRecognizer;
}

- (void)setHandRestRecognizer:(id)a3
{
}

- (_UIKBRTFingerDetection)fingerDetection
{
  return self->_fingerDetection;
}

- (void)setFingerDetection:(id)a3
{
}

- (UIKBCadenceMonitor)cadenceMonitor
{
  return self->_cadenceMonitor;
}

- (void)setCadenceMonitor:(id)a3
{
}

- (_UIKBRTTouchVelocities)touchVelocities
{
  return self->_touchVelocities;
}

- (void)setTouchVelocities:(id)a3
{
}

- (double)lastTouchUpTime
{
  return self->lastTouchUpTime;
}

- (void)setLastTouchUpTime:(double)a3
{
  self->lastTouchUpTime = a3;
}

- (UIKeyboardLayoutSizeDelegate)sizeDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sizeDelegate);
  return (UIKeyboardLayoutSizeDelegate *)WeakRetained;
}

- (void)setSizeDelegate:(id)a3
{
}

- (UIKBScreenTraits)screenTraits
{
  return self->_screenTraits;
}

- (void)setScreenTraits:(id)a3
{
}

- (double)timestampOfLastTouchesEnded
{
  return self->_timestampOfLastTouchesEnded;
}

- (id)deferredTaskForActiveTouch
{
  return self->_deferredTaskForActiveTouch;
}

- (void)setDeferredTaskForActiveTouch:(id)a3
{
}

- (BOOL)ignoringKeyplaneChange
{
  return self->_ignoringKeyplaneChange;
}

- (void)setIgnoringKeyplaneChange:(BOOL)a3
{
  self->_ignoringKeyplaneChange = a3;
}

- (BOOL)hasPreferredHeight
{
  return self->_hasPreferredHeight;
}

- (_UIKBRTTouchDrifting)touchDrifting
{
  return self->_touchDrifting;
}

- (void)setTouchDrifting:(id)a3
{
}

- (NSMutableDictionary)deferredTouchTaskLists
{
  return self->_deferredTouchTaskLists;
}

- (void)setDeferredTouchTaskLists:(id)a3
{
}

- (OS_dispatch_queue)deferredTouchTaskListsQueue
{
  return self->_deferredTouchTaskListsQueue;
}

- (void)setDeferredTouchTaskListsQueue:(id)a3
{
}

- (NSMutableSet)touchIgnoredUUIDSet
{
  return self->_touchIgnoredUUIDSet;
}

- (void)setTouchIgnoredUUIDSet:(id)a3
{
}

- (BOOL)isExecutingDeferredTouchTasks
{
  return self->_isExecutingDeferredTouchTasks;
}

- (void)setIsExecutingDeferredTouchTasks:(BOOL)a3
{
  self->_isExecutingDeferredTouchTasks = a3;
}

- (BOOL)listeningForWillChange
{
  return self->_listeningForWillChange;
}

- (void)setListeningForWillChange:(BOOL)a3
{
  self->_listeningForWillChange = a3;
}

- (BOOL)listeningForDidChange
{
  return self->_listeningForDidChange;
}

- (void)setListeningForDidChange:(BOOL)a3
{
  self->_listeningForDidChange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchIgnoredUUIDSet, 0);
  objc_storeStrong((id *)&self->_deferredTouchTaskListsQueue, 0);
  objc_storeStrong((id *)&self->_deferredTouchTaskLists, 0);
  objc_storeStrong((id *)&self->_touchDrifting, 0);
  objc_storeStrong(&self->_deferredTaskForActiveTouch, 0);
  objc_destroyWeak((id *)&self->_sizeDelegate);
  objc_storeStrong((id *)&self->_touchVelocities, 0);
  objc_storeStrong((id *)&self->_cadenceMonitor, 0);
  objc_storeStrong((id *)&self->_fingerDetection, 0);
  objc_storeStrong((id *)&self->_handRestRecognizer, 0);
  objc_storeStrong(&self->_deferredTouchMovedTask, 0);
  objc_storeStrong(&self->_deferredTouchDownTask, 0);
  objc_storeStrong((id *)&self->_screenEdgePanRecognizer, 0);
  objc_storeStrong((id *)&self->_currentTouchDownEvent, 0);
  objc_storeStrong((id *)&self->_typingStyleEstimator, 0);
  objc_storeStrong((id *)&self->_taskQueue, 0);
  objc_storeStrong((id *)&self->_shiftKeyTouchUUID, 0);
  objc_storeStrong((id *)&self->_activeTouchUUID, 0);
  objc_storeStrong((id *)&self->_uncommittedTouchUUIDs, 0);
  objc_storeStrong((id *)&self->_textEditingTraits, 0);
  objc_storeStrong((id *)&self->_screenTraits, 0);
  objc_storeStrong((id *)&self->_inputTraits, 0);
}

@end