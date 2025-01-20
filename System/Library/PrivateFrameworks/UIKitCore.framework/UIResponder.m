@interface UIResponder
+ (BOOL)_callBecomeFirstResponder:(id)a3 withIntent:(unint64_t)a4;
+ (BOOL)_callResignFirstResponder:(id)a3 withIntent:(unint64_t)a4;
+ (BOOL)_isWritingToolsAvailable;
+ (id)_globalFirstResponder;
+ (id)objectWithRestorationIdentifierPath:(id)a3;
+ (unint64_t)_currentChangeIntent;
+ (void)_cleanupAllStateRestorationTables;
+ (void)_cleanupStateRestorationObjectIdentifierTrackingTables;
+ (void)_setRestoredIdentifierPathForObject:(id)a3 identifierPath:(id)a4;
+ (void)_startDeferredTrackingObjectsWithIdentifiers;
+ (void)_stopDeferredTrackingObjectsWithIdentifiers;
+ (void)_updateStateRestorationIdentifierMap;
+ (void)clearTextInputContextIdentifier:(NSString *)identifier;
- (BOOL)__isKindOfUIResponder;
- (BOOL)_allowsChangingFirstResponderForFocusUpdateWithContext:(id)a3;
- (BOOL)_alwaysRequireInlineCandidateView;
- (BOOL)_becomeFirstResponderWhenPossible;
- (BOOL)_canBecomeFirstResponder;
- (BOOL)_canChangeFirstResponder:(id)a3 toResponder:(id)a4;
- (BOOL)_canHaveWritingToolsCoordinator;
- (BOOL)_canResignIfContainsFirstResponder;
- (BOOL)_canShowTextServiceForType:(int64_t)a3;
- (BOOL)_commonUIInvocationAnimationNeeded;
- (BOOL)_conformsToProtocolBETextInput;
- (BOOL)_conformsToProtocolUIAsyncTextInputClient;
- (BOOL)_conformsToProtocolUIKeyInput;
- (BOOL)_containedInAbsoluteResponderChain;
- (BOOL)_containsResponder:(id)a3;
- (BOOL)_disableAutomaticKeyboardBehavior;
- (BOOL)_disableAutomaticKeyboardUI;
- (BOOL)_disallowsPresentationOfKeyboardShortcutHUD;
- (BOOL)_enableAutomaticKeyboardPressDone;
- (BOOL)_finishResignFirstResponder;
- (BOOL)_finishResignFirstResponderFromBecomeFirstResponder:(BOOL)a3;
- (BOOL)_handleActivityItemsConfigurationCanPerformAction:(SEL)a3 sender:(id)a4;
- (BOOL)_handleActivityItemsConfigurationDoesNotHandleSelector:(SEL)a3;
- (BOOL)_handleActivityItemsConfigurationShare:(id)a3;
- (BOOL)_handleActivityItemsConfigurationShare:(id)a3 activityItemsConfiguration:(id)a4;
- (BOOL)_hasMarkedText;
- (BOOL)_hasMarkedTextOrRangedSelection;
- (BOOL)_isDisplayingWritingToolsSessionInUCB;
- (BOOL)_isEditableForWritingTools;
- (BOOL)_isEmptySelection;
- (BOOL)_isHardwareKeyboardBehaviorEnabled;
- (BOOL)_isHostingRemoteContent;
- (BOOL)_isPinningInputViews;
- (BOOL)_isRootForKeyResponderCycle;
- (BOOL)_isTransitioningFromView:(id)a3;
- (BOOL)_isView;
- (BOOL)_isViewController;
- (BOOL)_isWritingToolsActive;
- (BOOL)_nextResponderChainContainsResponder:(id)a3;
- (BOOL)_ownsInputAccessoryView;
- (BOOL)_range:(id)a3 containsRange:(id)a4;
- (BOOL)_range:(id)a3 intersectsRange:(id)a4;
- (BOOL)_range:(id)a3 isEqualToRange:(id)a4;
- (BOOL)_requiresKeyboardResetOnReload;
- (BOOL)_requiresKeyboardWhenFirstResponder;
- (BOOL)_resignIfContainsFirstResponder;
- (BOOL)_selectionAtDocumentEnd;
- (BOOL)_selectionAtDocumentStart;
- (BOOL)_selectionAtWordStart;
- (BOOL)_shouldDisplayWritingToolsCalloutBarItem;
- (BOOL)_shouldDisplayWritingToolsCandidateOptions;
- (BOOL)_shouldForwardMovementToFocusEngine:(int64_t)a3;
- (BOOL)_shouldPerformUICalloutBarButtonReplaceAction:(SEL)a3 forText:(id)a4 checkAutocorrection:(BOOL)a5;
- (BOOL)_shouldRestorationInputViewsOnlyWhenKeepingFirstResponder;
- (BOOL)_shouldSkipKeyCommand:(id)a3 forMovement:(int64_t)a4;
- (BOOL)_supportsBecomeFirstResponderWhenPossible;
- (BOOL)_supportsImagePaste;
- (BOOL)_supportsWritingTools;
- (BOOL)_suppressSoftwareKeyboard;
- (BOOL)_textIsLargeEnoughToUseWritingTools;
- (BOOL)_usesAsynchronousProtocol;
- (BOOL)_wantsPriorityOverFocusUpdates;
- (BOOL)_writingToolsWantsKeyboardSuppression;
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canPasteItemProviders:(id)a3;
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender;
- (BOOL)canResignFirstResponder;
- (BOOL)isEditable;
- (BOOL)isFirstResponder;
- (BOOL)resignFirstResponder;
- (BOOL)shouldReloadInputViews;
- (CGRect)_caretRect;
- (CGRect)_lastRectForRange:(id)a3;
- (CGRect)_rectToScrollToVisibleInCellInWindow:(id)a3;
- (CGRect)_responderExternalTouchRectForWindow:(id)a3;
- (CGRect)_responderSelectionRectForWindow:(id)a3;
- (CGRect)_selectionClipRect;
- (CGRect)_selectionRectForWritingTools;
- (FBSSceneIdentityToken)_layeringSceneIdentity;
- (NSArray)keyCommands;
- (NSString)restorationIdentifier;
- (NSString)textInputContextIdentifier;
- (NSUndoManager)undoManager;
- (UIEditingInteractionConfiguration)editingInteractionConfiguration;
- (UIInputViewController)inputAccessoryViewController;
- (UIInputViewController)inputViewController;
- (UIPredictiveViewController)_smartReplyFeedbackInputDashboardViewController;
- (UIPredictiveViewController)_writingToolsInputDashboardViewController;
- (UIResponder)_editingDelegate;
- (UIResponder)nextResponder;
- (UITextInputAssistantItem)inputAssistantItem;
- (UITextInputMode)textInputMode;
- (UITextInteractionAssistant)interactionAssistant;
- (UIView)inputAccessoryView;
- (UIView)inputView;
- (_NSRange)_nsrangeForTextRange:(id)a3;
- (_NSRange)_selectedNSRange;
- (_NSRange)_selectedRangeWithinMarkedText;
- (_WORD)_storedActivityItemsConfiguration;
- (id)__textInteractionFromAssistant;
- (id)__wt_writingToolsCoordinator;
- (id)_additionalTextInputLocales;
- (id)_assistantBarButtonItemForWritingToolsWithStyle:(int64_t)a3;
- (id)_captureOverrideState;
- (id)_clampedpositionFromPosition:(id)a3 offset:(int)a4;
- (id)_currentOverrideClient;
- (id)_currentOverrideHost;
- (id)_effectiveActivityItemsConfigurationAtLocation:(CGPoint)a3 inCoordinateSpace:(id)a4 sender:(id)a5;
- (id)_effectiveActivityItemsConfigurationForSender:(id)a3;
- (id)_findBoundaryPositionClosestToPosition:(id)a3 withGranularity:(int64_t)a4;
- (id)_findDocumentBoundaryFromPosition:(id)a3;
- (id)_findPleasingWordBoundaryFromPosition:(id)a3;
- (id)_firstNonnullActivityItemsConfigurationInResponderChainForLocation:(CGPoint)a3 inCoordinateSpace:(id)a4 skipPresentingViewControllers:(BOOL)a5 sender:(id)a6 target:(id *)a7;
- (id)_firstResponder;
- (id)_fontForCaretSelection;
- (id)_fullRange;
- (id)_fullText;
- (id)_intersectionOfRange:(id)a3 andRange:(id)a4;
- (id)_keyCommandForEvent:(id)a3;
- (id)_keyCommandForEvent:(id)a3 target:(id *)a4;
- (id)_moveDown:(BOOL)a3 withHistory:(id)a4;
- (id)_moveLeft:(BOOL)a3 withHistory:(id)a4;
- (id)_moveRight:(BOOL)a3 withHistory:(id)a4;
- (id)_moveToEndOfDocument:(BOOL)a3 withHistory:(id)a4;
- (id)_moveToEndOfLine:(BOOL)a3 withHistory:(id)a4;
- (id)_moveToEndOfParagraph:(BOOL)a3 withHistory:(id)a4;
- (id)_moveToEndOfWord:(BOOL)a3 withHistory:(id)a4;
- (id)_moveToStartOfDocument:(BOOL)a3 withHistory:(id)a4;
- (id)_moveToStartOfLine:(BOOL)a3 withHistory:(id)a4;
- (id)_moveToStartOfParagraph:(BOOL)a3 withHistory:(id)a4;
- (id)_moveToStartOfWord:(BOOL)a3 withHistory:(id)a4;
- (id)_moveUp:(BOOL)a3 withHistory:(id)a4;
- (id)_nextKeyResponder;
- (id)_nextResponderOverride;
- (id)_nextResponderThatCanBecomeFirstResponder;
- (id)_normalizedStringForRangeComparison:(id)a3;
- (id)_overrideHost;
- (id)_positionAtStartOfWords:(unint64_t)a3 beforePosition:(id)a4;
- (id)_positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5 withAffinityDownstream:(BOOL)a6;
- (id)_positionFromPosition:(id)a3 pastTextUnit:(int64_t)a4 inDirection:(int64_t)a5;
- (id)_positionWithinRange:(id)a3 farthestInDirection:(int64_t)a4;
- (id)_previousKeyResponder;
- (id)_primaryContentResponder;
- (id)_rangeFromCurrentRangeWithDelta:(_NSRange)a3;
- (id)_rangeOfEnclosingWord:(id)a3;
- (id)_rangeOfLineEnclosingPosition:(id)a3;
- (id)_rangeOfParagraphEnclosingPosition:(id)a3;
- (id)_rangeOfSentenceEnclosingPosition:(id)a3;
- (id)_rangeOfSmartSelectionIncludingRange:(id)a3;
- (id)_rangeOfText:(id)a3 endingAtPosition:(id)a4;
- (id)_rangeOfTextUnit:(int64_t)a3 enclosingPosition:(id)a4;
- (id)_rangeSpanningTextUnit:(int64_t)a3 andPosition:(id)a4;
- (id)_responderChainDescription;
- (id)_responderForEditing;
- (id)_responderSelectionContainerViewForResponder:(id)a3;
- (id)_responderSelectionImage;
- (id)_responderWindow;
- (id)_restorationIdentifierPath;
- (id)_selectableText;
- (id)_selectionDisplayInteraction;
- (id)_setHistory:(id)a3 withExtending:(BOOL)a4 withAnchor:(int)a5 withAffinityDownstream:(BOOL)a6;
- (id)_setSelectionRangeWithHistory:(id)a3;
- (id)_showServiceForText:(id)a3 selectedTextRange:(_NSRange)a4 type:(int64_t)a5 fromRect:(CGRect)a6 inView:(id)a7;
- (id)_showServiceForText:(id)a3 type:(int64_t)a4 fromRect:(CGRect)a5 inView:(id)a6;
- (id)_showServiceForType:(int64_t)a3 withContext:(id)a4;
- (id)_targetActionResponderChainDescription;
- (id)_targetCanPerformBlock:(id)a3;
- (id)_textColorForCaretSelection;
- (id)_textInputForWritingTools;
- (id)_textRangeFromNSRange:(_NSRange)a3;
- (id)_textServicesResponderProxy;
- (id)_textSuggestionsForWritingTools;
- (id)_trailingPredictiveCandidateForWritingTools;
- (id)_ui_findNavigatorResponder;
- (id)_underlineRectsByDocumentLineForSelectionRange:(id)a3;
- (id)_userActivity;
- (id)_viewControllerForWritingToolsSource;
- (id)_window;
- (id)_wordContainingCaretSelection;
- (id)_writingToolsDelegate;
- (id)_writingToolsViewController;
- (id)firstResponder;
- (id)inputDashboardViewController;
- (id)nextFirstResponder;
- (id)pasteConfiguration;
- (id)recentsAccessoryView;
- (id)targetForAction:(SEL)action withSender:(id)sender;
- (id)textInputSuggestionDelegate;
- (id)textInputView;
- (int)_indexForTextPosition:(id)a3;
- (int64_t)__wt_writingToolsBehavior;
- (int64_t)_availableTextServices;
- (int64_t)_dataOwnerForCopy;
- (int64_t)_dataOwnerForPaste;
- (int64_t)_dragDataOwner;
- (int64_t)_dropDataOwner;
- (int64_t)_opposingDirectionFromDirection:(int64_t)a3;
- (int64_t)_selectionAffinity;
- (int64_t)_textInputSource;
- (int64_t)selectionAffinity;
- (unint64_t)_defaultWritingToolsResultOptions;
- (unsigned)_characterAfterCaretSelection;
- (unsigned)_characterBeforeCaretSelection;
- (unsigned)_characterInRelationToCaretSelection:(int)a3;
- (unsigned)_characterInRelationToPosition:(id)a3 amount:(int)a4;
- (unsigned)_characterInRelationToRangedSelection:(int)a3;
- (void)__createInteractionAssistantIfNecessaryWithMode:(int64_t)a3;
- (void)__prepareInteractionAssistantIfNecessary;
- (void)__tearDownInteractionAssistantIfNecessary;
- (void)_addShortcut:(id)a3;
- (void)_becomeFirstResponder;
- (void)_beginPinningInputViews;
- (void)_checkIsText:(BOOL *)a3 isSecure:(BOOL *)a4 isEditable:(BOOL *)a5 isFormatted:(BOOL *)a6;
- (void)_clearOverrideHost;
- (void)_clearOverrideNextResponder;
- (void)_clearRestorableResponderStatus;
- (void)_completeForwardingTouches:(id)a3 phase:(int64_t)a4 event:(id)a5;
- (void)_completeForwardingTouches:(id)a3 phase:(int64_t)a4 event:(id)a5 index:(unint64_t)a6;
- (void)_define:(id)a3;
- (void)_deleteBackwardAndNotify:(BOOL)a3;
- (void)_deleteByWord;
- (void)_deleteForwardAndNotify:(BOOL)a3;
- (void)_deleteForwardByWord;
- (void)_deleteTextRange:(id)a3;
- (void)_deleteToEndOfLine;
- (void)_deleteToEndOfParagraph;
- (void)_deleteToStartOfLine;
- (void)_didChangeDeepestActionResponder;
- (void)_endPinningInputViews;
- (void)_endWritingTools;
- (void)_endWritingToolsIfNecessaryForResignFirstResponder;
- (void)_enumerateKeyCommandsInChainWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)_expandSelectionToBackwardDeletionClusterWithReinsertionOut:(id *)a3;
- (void)_expandSelectionToStartOfWordBeforeCaretSelection;
- (void)_expandSelectionToStartOfWordsBeforeCaretSelection:(int)a3;
- (void)_extendCurrentSelection:(int)a3;
- (void)_handleGameControllerEvent:(id)a3;
- (void)_handleKeyEvent:(__GSEvent *)a3;
- (void)_handleKeyUIEvent:(id)a3;
- (void)_insertItemFromProvider:(id)a3 completionHandler:(id)a4;
- (void)_lookup:(id)a3;
- (void)_moveCurrentSelection:(int)a3;
- (void)_notifyFocusEngine;
- (void)_overrideInputAccessoryViewNextResponderWithResponder:(id)a3;
- (void)_overrideInputViewNextResponderWithResponder:(id)a3;
- (void)_overrideNextResponderWithResponder:(id)a3 forType:(int64_t)a4;
- (void)_playInvocationAnimation;
- (void)_preserveResponderOverridesWhilePerforming:(id)a3;
- (void)_rebuildStateRestorationIdentifierPath;
- (void)_reloadInputViewsFromFirstResponder:(BOOL)a3;
- (void)_replaceCurrentWordWithText:(id)a3;
- (void)_replaceDocumentWithText:(id)a3;
- (void)_resignFirstResponder;
- (void)_restoreOverrideState:(id)a3;
- (void)_scrollRectToVisible:(CGRect)a3 animated:(BOOL)a4;
- (void)_selectAll;
- (void)_selectionDidUpdate;
- (void)_setAttributedMarkedText:(id)a3 selectedRange:(_NSRange)a4;
- (void)_setCaretSelectionAtEndOfSelection;
- (void)_setCommonUIInvocationAnimationNeeded:(BOOL)a3;
- (void)_setDataOwnerForCopy:(int64_t)a3;
- (void)_setDataOwnerForPaste:(int64_t)a3;
- (void)_setDragDataOwner:(int64_t)a3;
- (void)_setDropDataOwner:(int64_t)a3;
- (void)_setFirstResponder:(id)a3;
- (void)_setGestureRecognizers;
- (void)_setMarkedText:(id)a3 selectedRange:(_NSRange)a4;
- (void)_setSelectedTextRange:(id)a3 withAffinityDownstream:(BOOL)a4;
- (void)_setSelectionDisplayInteraction:(id)a3;
- (void)_setSelectionToPosition:(id)a3;
- (void)_setSmartReplyFeedbackInputDashboardViewController:(id)a3;
- (void)_setStoredActivityItemsConfiguration:(_WORD *)a1;
- (void)_setSuppressSoftwareKeyboard:(BOOL)a3;
- (void)_setSuppressWritingToolsForRemoteKeyboard:(BOOL)a3;
- (void)_setWritingToolsInputDashboardViewController:(id)a3;
- (void)_setWritingToolsViewController:(id)a3;
- (void)_setWritingToolsWantsKeyboardSuppression:(BOOL)a3;
- (void)_setWritingToolsWantsKeyboardSuppression:(BOOL)a3 suppressAssistant:(BOOL)a4;
- (void)_share:(id)a3;
- (void)_startProofreadingFromCandidateBar;
- (void)_startRewritingFromCandidateBar;
- (void)_startWritingToolsWithTool:(id)a3 prompt:(id)a4 entryPoint:(id)a5 inputContextHistory:(id)a6 sender:(id)a7;
- (void)_startWritingToolsWithTool:(id)a3 prompt:(id)a4 sender:(id)a5;
- (void)_tagAsRestorableResponder;
- (void)_translate:(id)a3;
- (void)_transpose;
- (void)_unmarkText;
- (void)_updateSelectedRects:(id)a3 byTrimmingWhitespaceInRange:(id)a4 inDocument:(id)a5;
- (void)_updateSelectionWithTextRange:(id)a3 withAffinityDownstream:(BOOL)a4;
- (void)_windowBecameKey;
- (void)_writingToolsDidEnd;
- (void)captureTextFromCamera:(id)sender;
- (void)dealloc;
- (void)doesNotRecognizeSelector:(SEL)a3;
- (void)pasteItemProviders:(id)a3;
- (void)pressesBegan:(NSSet *)presses withEvent:(UIPressesEvent *)event;
- (void)pressesCancelled:(NSSet *)presses withEvent:(UIPressesEvent *)event;
- (void)pressesChanged:(NSSet *)presses withEvent:(UIPressesEvent *)event;
- (void)pressesEnded:(NSSet *)presses withEvent:(UIPressesEvent *)event;
- (void)promptBackgroundViewDidUpdateConfiguration:(id)a3;
- (void)reloadInputViews;
- (void)reloadInputViewsWithoutReset;
- (void)setActivityItemsConfiguration:(id)activityItemsConfiguration;
- (void)setPasteConfiguration:(id)a3;
- (void)setRestorationIdentifier:(id)a3;
- (void)setUserActivity:(NSUserActivity *)userActivity;
- (void)set_textInputSource:(int64_t)a3;
- (void)showWritingTools:(id)a3;
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)validateCommand:(UICommand *)command;
@end

@implementation UIResponder

- (BOOL)_resignIfContainsFirstResponder
{
  v3 = [(UIResponder *)self _responderWindow];
  v4 = [v3 _firstResponder];

  if (!v4 || v4 == self)
  {
    v5 = v4;
    if (v4 != self)
    {
LABEL_12:
      LOBYTE(v8) = 0;
      goto LABEL_14;
    }
  }
  else
  {
    do
    {
      if (![(UIResponder *)v4 _canResignIfContainsFirstResponder])
      {
        LOBYTE(v8) = 0;
        v5 = v4;
        goto LABEL_14;
      }
      v5 = [(UIResponder *)v4 nextResponder];

      if (!v5) {
        break;
      }
      v4 = v5;
    }
    while (v5 != self);
    if (v5 != self) {
      goto LABEL_12;
    }
  }
  v6 = [(UIResponder *)self _responderWindow];
  v7 = [v6 _firstResponder];

  int v8 = [v7 resignFirstResponder];
  if (v8 && [v7 _canBecomeFirstResponderWhenPossible]) {
    [v7 _becomeFirstResponderWhenPossible];
  }

LABEL_14:
  return v8;
}

- (void).cxx_destruct
{
}

- (id)_intersectionOfRange:(id)a3 andRange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = self;
  v9 = [v6 start];
  v10 = [v7 start];
  if ([(UIResponder *)v8 comparePosition:v9 toPosition:v10] == 1) {
    v11 = v6;
  }
  else {
    v11 = v7;
  }
  v12 = [v11 start];

  v13 = [v6 end];
  v14 = [v7 end];
  if ([(UIResponder *)v8 comparePosition:v13 toPosition:v14] == -1) {
    v15 = v6;
  }
  else {
    v15 = v7;
  }
  v16 = [v15 end];

  v17 = [(UIResponder *)v8 textRangeFromPosition:v12 toPosition:v16];

  return v17;
}

- (id)_textRangeFromNSRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v5 = [(UIResponder *)self _selectableText];
  id v6 = [v5 beginningOfDocument];
  id v7 = [v5 positionFromPosition:v6 offset:location];
  int v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [v5 endOfDocument];
  }
  v10 = v9;

  v11 = [v5 positionFromPosition:v10 offset:length];
  v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v13 = [v5 endOfDocument];
  }
  v14 = v13;

  v15 = [v5 textRangeFromPosition:v10 toPosition:v14];

  return v15;
}

- (id)_selectableText
{
  v3 = [(UIResponder *)self _textSelectingContainer];
  v4 = v3;
  if (!v3) {
    v3 = self;
  }
  id v5 = v3;

  return v5;
}

- (void)_clearRestorableResponderStatus
{
  v3 = objc_getAssociatedObject(self, &_UIRestorableResponderKey);
  if ([v3 BOOLValue])
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __46__UIResponder__clearRestorableResponderStatus__block_invoke;
    v4[3] = &unk_1E52E9EE0;
    v4[4] = self;
    +[UIKeyboardSceneDelegate performOnControllers:v4];
    objc_setAssociatedObject(self, &_UIRestorableResponderKey, 0, (void *)1);
  }
}

- (void)dealloc
{
  v3 = [(UIResponder *)self _userActivity];
  if (v3)
  {
    v4 = (void *)MEMORY[0x18C108260]();
    [(id)UIApp _removeResponder:self forUserActivity:v3];
  }
  [(UIResponder *)self _clearRestorableResponderStatus];

  v5.receiver = self;
  v5.super_class = (Class)UIResponder;
  [(UIResponder *)&v5 dealloc];
}

- (void)_clearOverrideNextResponder
{
  v3 = (void *)MEMORY[0x18C108260](self, a2);
  __int16 responderFlags = (__int16)self->_responderFlags;
  if ((responderFlags & 2) != 0)
  {
    objc_setAssociatedObject(self, &unk_1EB262469, 0, (void *)1);
    __int16 responderFlags = *(_WORD *)&self->_responderFlags & 0xFFFD;
    *(_WORD *)&self->___int16 responderFlags = responderFlags;
  }
  if (responderFlags)
  {
    objc_setAssociatedObject(self, &_MergedGlobals_1199, 0, (void *)1);
    *(_WORD *)&self->_responderFlags &= ~1u;
  }
}

- (id)_userActivity
{
  if ((*(_WORD *)&self->_responderFlags & 8) != 0)
  {
    v2 = objc_getAssociatedObject(self, &kResponderUserActivityKey);
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (BOOL)_disableAutomaticKeyboardBehavior
{
  v2 = [(UIResponder *)self nextResponder];
  char v3 = [v2 _disableAutomaticKeyboardBehavior];

  return v3;
}

- (BOOL)_containedInAbsoluteResponderChain
{
  v2 = [(UIResponder *)self nextResponder];
  char v3 = [v2 _containedInAbsoluteResponderChain];

  return v3;
}

- (BOOL)resignFirstResponder
{
  [(UIResponder *)self _clearBecomeFirstResponderWhenCapable];
  char v3 = [(UIResponder *)self _firstResponder];
  if (v3 == self && [(UIResponder *)self canResignFirstResponder])
  {
    v4 = [(UIResponder *)self _responderWindow];
    if ([v4 _isSettingFirstResponder])
    {
      if (![(UIResponder *)self _finishResignFirstResponderFromBecomeFirstResponder:1])
      {
        BOOL v5 = 0;
LABEL_21:

        goto LABEL_7;
      }
    }
    else
    {
      [v4 _setIsSettingFirstResponder:1];
      id v7 = [(UIResponder *)self nextFirstResponder];
      if ([v4 _wantsResponderWithoutKeyboard]
        && [(UIResponder *)v7 _requiresKeyboardWhenFirstResponder])
      {
        do
        {
          int v8 = [(UIResponder *)v7 nextFirstResponder];

          id v7 = v8;
        }
        while ([(UIResponder *)v8 _requiresKeyboardWhenFirstResponder]);
      }
      else
      {
        int v8 = v7;
      }
      id v9 = [(UIResponder *)self _responderWindow];
      v10 = [v9 windowScene];
      v11 = [v10 keyboardSceneDelegate];

      if (v11) {
        [v11 setKeyWindowCandidate:0];
      }
      if (v8 == self
        || ![(UIResponder *)v8 becomeFirstResponder]
        || [(UIResponder *)self isFirstResponder])
      {
        [(UIResponder *)self _finishResignFirstResponder];
        [(id)UIApp _updateSerializableKeyCommandsForResponder:0];
      }
      [(UIResponder *)self _notifyFocusEngine];
      [v4 _setIsSettingFirstResponder:0];
    }
    [(UIResponder *)self _endWritingToolsIfNecessaryForResignFirstResponder];
    BOOL v5 = 1;
    goto LABEL_21;
  }
  BOOL v5 = 0;
LABEL_7:

  return v5;
}

- (void)_notifyFocusEngine
{
  id v4 = [(UIResponder *)self _responderWindow];
  char v3 = +[_UIFocusSystemSceneComponent sceneComponentForEnvironment:v4];
  [v3 _firstResponderDidUpdateFromResponder:self];
}

+ (unint64_t)_currentChangeIntent
{
  if (pthread_main_np() != 1)
  {
    BOOL v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:a1 file:@"UIResponder.m" lineNumber:826 description:@"Call must be made on main thread"];
  }
  return __changeIntent;
}

- (void)_endWritingToolsIfNecessaryForResignFirstResponder
{
  char v3 = +[_UIRemoteKeyboards sharedRemoteKeyboards];
  char v4 = [v3 isWritingToolsHostingViewService];

  if ((v4 & 1) == 0)
  {
    [(UIResponder *)self _endWritingTools];
  }
}

- (BOOL)canResignFirstResponder
{
  return 1;
}

- (BOOL)_finishResignFirstResponderFromBecomeFirstResponder:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(UIResponder *)self _responderWindow];
  if (!v5)
  {
    id v6 = +[UIWindow _applicationKeyWindow];
    id v7 = [v6 windowScene];
    int v8 = [v7 keyboardSceneDelegate];
    id v9 = [v8 responder];

    if (v9 == self) {
      id v5 = v6;
    }
    else {
      id v5 = 0;
    }
  }
  v10 = [v5 windowScene];
  v11 = [v10 keyboardSceneDelegate];

  v12 = [v11 responder];
  if (!v12 || ![v11 _isTrackingResponder:self]) {
    goto LABEL_14;
  }
  if ([v11 _isTrackingResponder:self])
  {
    id v13 = [(UIResponder *)self _window];
    v14 = [v12 _window];
    if (v13 != v14)
    {

      goto LABEL_12;
    }
    BOOL v15 = [(UIResponder *)self _disableAutomaticKeyboardBehavior];

    if (v15) {
      goto LABEL_12;
    }
    [v11 _reloadInputViewsForResponder:0 fromBecomeFirstResponder:v3];
LABEL_14:
    BOOL v16 = 1;
    goto LABEL_15;
  }
LABEL_12:
  BOOL v16 = 0;
LABEL_15:
  [(UIResponder *)self _resignFirstResponder];
  *(_WORD *)&self->_responderFlags &= ~0x40u;

  return v16;
}

- (void)_setFirstResponder:(id)a3
{
  id v5 = a3;
  [(UIResponder *)self _willChangeToFirstResponder:v5];
  char v4 = [(UIResponder *)self nextResponder];
  [v4 _setFirstResponder:v5];

  [(UIResponder *)self _didChangeToFirstResponder:v5];
}

- (void)_resignFirstResponder
{
}

- (NSUndoManager)undoManager
{
  BOOL v3 = [(UIResponder *)self nextResponder];
  char v4 = v3;
  id v5 = 0;
  if (v3 && v3 != self)
  {
    id v5 = [(UIResponder *)v3 undoManager];
  }

  return (NSUndoManager *)v5;
}

- (id)_responderWindow
{
  v2 = [(UIResponder *)self nextResponder];
  BOOL v3 = [v2 _responderWindow];

  return v3;
}

- (id)_nextResponderOverride
{
  if (*(_WORD *)&self->_responderFlags)
  {
    BOOL v3 = objc_getAssociatedObject(self, &_MergedGlobals_1199);
    v2 = [v3 target];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void)_setSuppressWritingToolsForRemoteKeyboard:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UIResponder *)self _writingToolsViewController];
  [v4 setSuppressWritingToolsForRemoteKeyboard:v3];
}

- (void)_endWritingTools
{
  id v2 = [(UIResponder *)self _writingToolsViewController];
  [v2 endWritingTools];
}

- (id)_writingToolsViewController
{
  id v2 = [(UIResponder *)self _firstResponder];
  BOOL v3 = objc_getAssociatedObject(v2, &kWritingToolsViewControllerKey);

  return v3;
}

- (id)nextFirstResponder
{
  id v2 = [(UIResponder *)self nextResponder];
  if (v2)
  {
    do
    {
      if ([v2 isFirstResponder] & 1) == 0 && (objc_msgSend(v2, "_canBecomeFirstResponder")) {
        break;
      }
      uint64_t v3 = [v2 nextResponder];

      id v2 = (void *)v3;
    }
    while (v3);
  }
  return v2;
}

- (BOOL)isFirstResponder
{
  id v2 = self;
  uint64_t v3 = [(UIResponder *)self _firstResponder];
  LOBYTE(v2) = v3 == v2;

  return (char)v2;
}

- (BOOL)_finishResignFirstResponder
{
  return [(UIResponder *)self _finishResignFirstResponderFromBecomeFirstResponder:0];
}

- (void)_reloadInputViewsFromFirstResponder:(BOOL)a3
{
  if ([(UIResponder *)self shouldReloadInputViews])
  {
    id v6 = [(UIResponder *)self _responderWindow];
    id v4 = [v6 windowScene];
    id v5 = [v4 keyboardSceneDelegate];
    [v5 _reloadInputViewsForResponder:self fromBecomeFirstResponder:1];
  }
}

- (void)_didChangeDeepestActionResponder
{
}

- (BOOL)becomeFirstResponder
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(UIResponder *)self _responderWindow];
  id v4 = [v3 windowScene];
  id v5 = [v4 keyboardSceneDelegate];

  int v6 = [v3 _isSettingFirstResponder];
  if (![v3 _suppressFirstResponderWhenUserInteractionDisabled]
    || ([v3 isUserInteractionEnabled] & 1) != 0)
  {
    id v7 = self;
    int v8 = [(UIResponder *)v7 _firstResponder];
    uint64_t v9 = [(UIResponder *)v7 firstResponder];
    v10 = (void *)v9;
    BOOL v11 = 1;
    if (v8 == v7 || (UIResponder *)v9 == v7)
    {
LABEL_44:

      goto LABEL_45;
    }
    if (v9) {
      v12 = (void *)v9;
    }
    else {
      v12 = v8;
    }
    id v13 = v12;
    if ((v6 & 1) == 0) {
      [v3 _setIsSettingFirstResponder:1];
    }
    v14 = [v5 localAuthenticationObserver];
    [v14 willTryToBecomeFirstResponder:v7];
    if (v13 && ![v13 _canChangeFirstResponder:v13 toResponder:v7]
      || ![(UIResponder *)v7 _canBecomeFirstResponder])
    {
      goto LABEL_40;
    }
    [v5 _beginIgnoringReloadInputViews];
    if (v6) {
      [v13 _finishResignFirstResponder];
    }
    if (v3
      && v13
      && ([v13 _window], BOOL v15 = objc_claimAutoreleasedReturnValue(), v15, v15 != v3)
      && ([v13 _window],
          BOOL v16 = objc_claimAutoreleasedReturnValue(),
          char v17 = [v16 _isTextEffectsWindow],
          v16,
          (v17 & 1) == 0))
    {
      v21 = *(NSObject **)(__UILogGetCategoryCachedImpl("View", &becomeFirstResponder___s_category) + 8);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = v21;
        *(_DWORD *)v27 = 138412290;
        *(void *)&v27[4] = objc_opt_class();
        id v23 = *(id *)&v27[4];
        _os_log_impl(&dword_1853B0000, v22, OS_LOG_TYPE_ERROR, "First responder warning: '<%@>' rejected resignFirstResponder when being removed from hierarchy", v27, 0xCu);
      }
      -[UIResponder _setFirstResponder:](v7, "_setFirstResponder:", 0, *(_OWORD *)v27);

      id v13 = 0;
      BOOL v18 = 1;
    }
    else
    {
      BOOL v18 = v13 == 0;
      if (v13) {
        char v19 = v6;
      }
      else {
        char v19 = 1;
      }
      if ((v19 & 1) == 0)
      {
        BOOL v18 = 0;
        int v20 = 0;
        if (![v13 resignFirstResponder])
        {
LABEL_36:
          int v25 = [v5 _endIgnoringReloadInputViews];
          [(UIResponder *)v7 _setSuppressWritingToolsForRemoteKeyboard:0];
          if (v20)
          {
            BOOL v11 = 1;
            [(UIResponder *)v7 _reloadInputViewsFromFirstResponder:1];
            [(id)UIApp _updateSerializableKeyCommandsForResponder:v7];
LABEL_41:
            [v14 didTryToBecomeFirstResponder:v7];
            if ((v6 & 1) == 0) {
              [v3 _setIsSettingFirstResponder:0];
            }

            goto LABEL_44;
          }
          if (v25) {
            [v5 forceReloadInputViews];
          }
LABEL_40:
          BOOL v11 = 0;
          goto LABEL_41;
        }
      }
    }
    if ([(UIResponder *)v7 _containedInAbsoluteResponderChain])
    {
      [(UIResponder *)v7 _becomeFirstResponder];
      [(UIResponder *)v7 _notifyFocusEngine];
      int v20 = 1;
    }
    else
    {
      int v24 = [(UIResponder *)v7 _becomeFirstResponderWhenPossible];
      if ((v24 | v18))
      {
        int v20 = v24;
      }
      else
      {
        if (![(UIResponder *)v7 _disableAutomaticKeyboardBehavior]) {
          [v5 _reloadInputViewsForResponder:0];
        }
        int v20 = 0;
      }
    }
    goto LABEL_36;
  }
  [v3 _setLastFirstResponder:self];
  BOOL v11 = 0;
LABEL_45:

  return v11;
}

- (id)firstResponder
{
  id v2 = [(UIResponder *)self nextResponder];
  uint64_t v3 = [v2 firstResponder];

  return v3;
}

- (id)_firstResponder
{
  id v2 = [(UIResponder *)self nextResponder];
  uint64_t v3 = [v2 _firstResponder];

  return v3;
}

- (BOOL)_canBecomeFirstResponder
{
  int v2 = [(UIResponder *)self canBecomeFirstResponder];
  if (v2) {
    LOBYTE(v2) = [(id)UIApp _disableBecomeFirstResponder] ^ 1;
  }
  return v2;
}

- (BOOL)canBecomeFirstResponder
{
  return 0;
}

- (BOOL)_requiresKeyboardWhenFirstResponder
{
  uint64_t v3 = [(UIResponder *)self _keyboardResponder];
  BOOL v4 = [v3 _conformsToProtocolUIKeyInput]
    && (([(UIResponder *)self _conformsToProtocolUIAsyncTextInputClient]
      || [(UIResponder *)self _conformsToProtocolBETextInput])
     && +[UIKeyboard isInHardwareKeyboardMode]
     || (objc_opt_respondsToSelector() & 1) == 0
     || [(UIResponder *)self isEditable]);

  return v4;
}

- (BOOL)_conformsToProtocolUIKeyInput
{
  unsigned int responderFlags = self->_responderFlags;
  if ((responderFlags & 0x80) == 0)
  {
    int v4 = 128;
    if (objc_opt_respondsToSelector())
    {
      if ([(UIResponder *)self conformsToProtocol:&unk_1ED42EEC0]) {
        int v4 = 384;
      }
      else {
        int v4 = 128;
      }
    }
    unsigned int responderFlags = *(_WORD *)&self->_responderFlags & 0xFE7F | v4;
    *(_WORD *)&self->_unsigned int responderFlags = *(_WORD *)&self->_responderFlags & 0xFE7F | v4;
  }
  return (responderFlags >> 8) & 1;
}

- (BOOL)_canChangeFirstResponder:(id)a3 toResponder:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(UIResponder *)self nextResponder];
  uint64_t v9 = v8;
  if (v8) {
    char v10 = [v8 _canChangeFirstResponder:v6 toResponder:v7];
  }
  else {
    char v10 = 1;
  }

  return v10;
}

- (BOOL)_conformsToProtocolBETextInput
{
  unsigned int responderFlags = self->_responderFlags;
  if ((responderFlags & 0x1000) == 0)
  {
    if (+[UIKBInputDelegateManager isAsyncTextInputEnabled])
    {
      int v4 = 4096;
      if (objc_opt_respondsToSelector())
      {
        if ([(UIResponder *)self conformsToProtocol:&unk_1ED7009A0]) {
          int v4 = 6144;
        }
        else {
          int v4 = 4096;
        }
      }
    }
    else
    {
      int v4 = 4096;
    }
    unsigned int responderFlags = *(_WORD *)&self->_responderFlags & 0xE7FF | v4;
    *(_WORD *)&self->_unsigned int responderFlags = *(_WORD *)&self->_responderFlags & 0xE7FF | v4;
  }
  return (responderFlags >> 11) & 1;
}

- (void)_becomeFirstResponder
{
}

- (BOOL)_becomeFirstResponderWhenPossible
{
  return 0;
}

- (BOOL)shouldReloadInputViews
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (![(UIResponder *)self _disableAutomaticKeyboardBehavior]
    && [(UIResponder *)self isFirstResponder])
  {
    uint64_t v3 = [(UIResponder *)self _responderWindow];
    if ([v3 _isApplicationKeyWindow]) {
      goto LABEL_18;
    }
    int v4 = +[UIWindow _applicationKeyWindow];

    if (v3 == v4) {
      goto LABEL_18;
    }
    if ([v3 isKeyWindow])
    {
      uint64_t v5 = [(UIResponder *)self inputAccessoryView];
      if (v5)
      {
        id v6 = (void *)v5;
        BOOL v7 = [(UIResponder *)self _requiresKeyboardWhenFirstResponder];

        if (!v7) {
          goto LABEL_18;
        }
      }
      else
      {
        uint64_t v9 = [(UIResponder *)self inputAccessoryViewController];
        if (v9)
        {
          char v10 = (void *)v9;
          BOOL v11 = [(UIResponder *)self _requiresKeyboardWhenFirstResponder];

          if (!v11) {
            goto LABEL_18;
          }
        }
      }
    }
    v12 = [(UIResponder *)self _responderWindow];
    id v13 = [v12 windowScene];
    v14 = [v13 keyboardSceneDelegate];
    BOOL v15 = [v14 keyWindowCandidate];

    if (v3 != v15)
    {
      BOOL v16 = [(UIResponder *)self _window];
      char v17 = [v16 windowScene];
      BOOL v18 = [v17 keyboardSceneDelegate];
      char v19 = [v18 responder];

      if (v19)
      {
        int v20 = [v19 _responderWindow];
        v21 = [v20 screen];
        v22 = [v3 screen];

        if (v21 != v22) {
          goto LABEL_17;
        }
      }
      id v23 = [(UIResponder *)self _window];
      int v24 = [v23 screen];
      uint64_t v25 = [v24 _userInterfaceIdiom];

      if (v19 || v25 != 3)
      {
        v27 = +[UIKeyboardImpl activeInstance];
        uint64_t v28 = [v27 _window];

        if (v28 && ![v28 _isTextEffectsWindow]) {
          goto LABEL_25;
        }
        v29 = [(UIResponder *)self _window];
        v30 = [v29 windowScene];
        v31 = [v30 keyboardSceneDelegate];
        char v32 = [v31 automaticAppearanceEnabled];

        if (v32)
        {
          BOOL v8 = 0;
        }
        else
        {
LABEL_25:
          v33 = *(NSObject **)(__UILogGetCategoryCachedImpl("View", &shouldReloadInputViews___s_category) + 8);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            v34 = v33;
            v35 = [(UIResponder *)self _window];
            v36 = [(id)UIApp keyWindow];
            int v37 = 138412546;
            v38 = v35;
            __int16 v39 = 2112;
            v40 = v36;
            _os_log_impl(&dword_1853B0000, v34, OS_LOG_TYPE_ERROR, "First responder issue detected: non-key window attempting reload - allowing due to manual keyboard (first responder window is %@, key window is %@)", (uint8_t *)&v37, 0x16u);
          }
          BOOL v8 = 1;
        }
      }
      else
      {
LABEL_17:
        BOOL v8 = 1;
      }

      goto LABEL_19;
    }
LABEL_18:
    BOOL v8 = 1;
LABEL_19:

    return v8;
  }
  return 0;
}

- (BOOL)__isKindOfUIResponder
{
  return 1;
}

- (void)setActivityItemsConfiguration:(id)activityItemsConfiguration
{
}

- (BOOL)_ownsInputAccessoryView
{
  if (![(UIResponder *)self performSelector:sel_inputAccessoryView]
    || (uint64_t v3 = [(UIResponder *)self methodForSelector:sel_inputAccessoryView],
        v3 == +[UIResponder instanceMethodForSelector:sel_inputAccessoryView]))
  {
    uint64_t v4 = [(UIResponder *)self performSelector:sel_inputAccessoryViewController];
    if (v4)
    {
      uint64_t v5 = [(UIResponder *)self methodForSelector:sel_inputAccessoryViewController];
      LOBYTE(v4) = v5 != +[UIResponder instanceMethodForSelector:sel_inputAccessoryViewController];
    }
  }
  else
  {
    LOBYTE(v4) = 1;
  }
  return v4;
}

- (UIView)inputView
{
  uint64_t v3 = [(UIResponder *)self nextResponder];
  uint64_t v4 = [v3 inputView];

  uint64_t v5 = [v4 _nextResponderOverride];

  if (!v5)
  {
    id v6 = [(UIResponder *)self nextResponder];
    [v4 _overrideInputViewNextResponderWithResponder:v6];
  }
  return (UIView *)v4;
}

- (UIInputViewController)inputViewController
{
  uint64_t v3 = [(UIResponder *)self nextResponder];
  uint64_t v4 = [v3 inputViewController];

  uint64_t v5 = [v4 _nextResponderOverride];

  if (!v5)
  {
    id v6 = [(UIResponder *)self nextResponder];
    [v4 _overrideInputViewNextResponderWithResponder:v6];
  }
  return (UIInputViewController *)v4;
}

- (BOOL)_disableAutomaticKeyboardUI
{
  int v2 = [(UIResponder *)self nextResponder];
  char v3 = [v2 _disableAutomaticKeyboardUI];

  return v3;
}

- (UIInputViewController)inputAccessoryViewController
{
  char v3 = [(UIResponder *)self nextResponder];
  uint64_t v4 = [v3 inputAccessoryViewController];

  uint64_t v5 = [v4 _nextResponderOverride];

  if (!v5)
  {
    id v6 = [(UIResponder *)self nextResponder];
    [v4 _overrideInputAccessoryViewNextResponderWithResponder:v6];
  }
  return (UIInputViewController *)v4;
}

- (UIView)inputAccessoryView
{
  char v3 = [(UIResponder *)self nextResponder];
  uint64_t v4 = [v3 inputAccessoryView];

  uint64_t v5 = [v4 _nextResponderOverride];

  if (!v5)
  {
    id v6 = [(UIResponder *)self nextResponder];
    [v4 _overrideInputAccessoryViewNextResponderWithResponder:v6];
  }
  return (UIView *)v4;
}

- (UIResponder)nextResponder
{
  return 0;
}

+ (void)_startDeferredTrackingObjectsWithIdentifiers
{
  byte_1EB262D99 = 1;
}

uint64_t __36__UIResponder__endPinningInputViews__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _stopPinningInputViewsOnBehalfOfResponder:*(void *)(a1 + 32)];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
}

- (void)_selectionDidUpdate
{
  uint64_t v3 = [(UIResponder *)self _writingToolsViewController];
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    BOOL v5 = [(UIResponder *)self _supportsWritingTools];

    if (v5)
    {
      id v6 = [(UIResponder *)self _writingToolsViewController];
      char v7 = objc_opt_respondsToSelector();

      if (v7)
      {
        id v8 = [(UIResponder *)self _writingToolsViewController];
        [v8 performSelector:sel_selectionDidUpdate];
      }
    }
  }
}

+ (id)_globalFirstResponder
{
  int v2 = +[UIKeyboardImpl activeInstance];
  uint64_t v3 = [v2 delegateAsResponder];
  uint64_t v4 = [v3 _editingDelegate];

  if (v4)
  {
    BOOL v5 = [v2 delegateAsResponder];
  }
  else
  {
    id v6 = +[UIWindow _externalKeyWindow];
    char v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = +[UIWindow _applicationKeyWindow];
    }
    uint64_t v9 = v8;

    BOOL v5 = [v9 _responderForKeyEvents];
  }
  return v5;
}

- (id)_responderForEditing
{
  uint64_t v3 = [(UIResponder *)self _editingDelegate];
  uint64_t v4 = v3;
  if (!v3) {
    uint64_t v3 = self;
  }
  id v5 = v3;

  return v5;
}

- (UIResponder)_editingDelegate
{
  return 0;
}

- (FBSSceneIdentityToken)_layeringSceneIdentity
{
  return self->__layeringSceneIdentity;
}

- (UITextInputMode)textInputMode
{
  if (+[UIKeyboard usesInputSystemUI]) {
    goto LABEL_13;
  }
  uint64_t v3 = [(UIResponder *)self textInputContextIdentifier];
  if (v3)
  {
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"UITextInputContextIdentifiers"];
    id v5 = [@"ID_" stringByAppendingString:v3];
    id v6 = [v5 stringByAppendingString:@"_SETTIME"];
    char v7 = [v4 objectForKey:v5];
    if (!v7) {
      goto LABEL_10;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v7;
      uint64_t v9 = +[UIKeyboardInputModeController sharedInputModeController];
      char v10 = [v9 inputModeLastUsedForLanguage:v8];

      id v11 = 0;
      if (!v10) {
        goto LABEL_11;
      }
LABEL_9:

      goto LABEL_14;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = v7;
      char v10 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v11 error:0];
      id v8 = 0;
      if (v10) {
        goto LABEL_9;
      }
    }
    else
    {
LABEL_10:
      id v8 = 0;
      id v11 = 0;
    }
LABEL_11:
  }
LABEL_13:
  uint64_t v3 = [(UIResponder *)self nextResponder];
  char v10 = [v3 textInputMode];
LABEL_14:

  return (UITextInputMode *)v10;
}

- (NSString)textInputContextIdentifier
{
  int v2 = [(UIResponder *)self nextResponder];
  uint64_t v3 = [v2 textInputContextIdentifier];

  return (NSString *)v3;
}

- (CGRect)_caretRect
{
  int v2 = [(UIResponder *)self _asTextSelection];
  uint64_t v3 = [v2 selectedTextRange];
  uint64_t v4 = [v3 start];

  if (v4)
  {
    [v2 caretRectForPosition:v4];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    double v6 = *MEMORY[0x1E4F1DB20];
    double v8 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v10 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v12 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)_selectionClipRect
{
  double v2 = *MEMORY[0x1E4F1DB20];
  double v3 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)_beginPinningInputViews
{
  double v3 = [(UIResponder *)self _window];
  double v4 = [v3 windowScene];
  id v6 = [v4 keyboardSceneDelegate];

  double v5 = v6;
  if (!v6)
  {
    double v5 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  }
  id v7 = v5;
  [v5 _beginPinningInputViewsOnBehalfOfResponder:self];
}

+ (void)_cleanupAllStateRestorationTables
{
  qword_1EB262DC0 = 0;
  qword_1EB262DA0 = 0;
}

+ (void)_stopDeferredTrackingObjectsWithIdentifiers
{
  byte_1EB262D99 = 0;
}

+ (void)_cleanupStateRestorationObjectIdentifierTrackingTables
{
  qword_1EB262DB8 = 0;
  [a1 _stopDeferredTrackingObjectsWithIdentifiers];
}

- (void)setUserActivity:(NSUserActivity *)userActivity
{
  value = userActivity;
  double v4 = [(UIResponder *)self _userActivity];
  if (v4 != value)
  {
    *(_WORD *)&self->_unsigned int responderFlags = *(_WORD *)&self->_responderFlags & 0xFFF7 | (8 * (value != 0));
    objc_setAssociatedObject(self, &kResponderUserActivityKey, value, (void *)1);
    if (v4) {
      [(id)UIApp _removeResponder:self forUserActivity:v4];
    }
    if (value) {
      [(id)UIApp _addResponder:self forUserActivity:value];
    }
  }
}

- (void)setRestorationIdentifier:(id)a3
{
  objc_setAssociatedObject(self, &kRestorationIdentifierAssociatedObjectKey, a3, (void *)1);
  _trackObjectWithIdentifier((uint64_t)self);
}

- (BOOL)_hasMarkedText
{
  double v2 = [(UIResponder *)self _selectableText];
  if ([v2 _usesAsynchronousProtocol]
    && (!+[UIKBInputDelegateManager isAsyncTextInputEnabled]|| (objc_opt_respondsToSelector() & 1) != 0|| (objc_opt_respondsToSelector() & 1) != 0))
  {
    char v3 = [v2 hasMarkedText];
  }
  else
  {
    double v4 = [v2 markedTextRange];
    char v3 = v4 != 0;
  }
  return v3;
}

- (BOOL)_usesAsynchronousProtocol
{
  double v2 = [(UIResponder *)self _selectableText];
  if (!+[UIKBInputDelegateManager isAsyncTextInputEnabled])
  {
    if (objc_opt_respondsToSelector())
    {
      char v4 = [v2 conformsToProtocol:&unk_1ED700D60];
LABEL_9:
      BOOL v3 = v4;
      goto LABEL_11;
    }
LABEL_10:
    BOOL v3 = 0;
    goto LABEL_11;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([v2 conformsToProtocolCached:&unk_1ED700940] & 1) == 0)
  {
    if (objc_opt_respondsToSelector())
    {
      char v4 = [v2 conformsToProtocolCached:&unk_1ED7009A0];
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  BOOL v3 = 1;
LABEL_11:

  return v3;
}

- (NSString)restorationIdentifier
{
  return (NSString *)objc_getAssociatedObject(self, &kRestorationIdentifierAssociatedObjectKey);
}

- (BOOL)_requiresKeyboardResetOnReload
{
  if ([(UIResponder *)self _conformsToProtocolUIAsyncTextInputClient]) {
    return 1;
  }
  return [(UIResponder *)self _conformsToProtocolBETextInput];
}

- (BOOL)_conformsToProtocolUIAsyncTextInputClient
{
  unsigned int responderFlags = self->_responderFlags;
  if ((responderFlags & 0x400) == 0)
  {
    if (+[UIKBInputDelegateManager isAsyncTextInputEnabled])
    {
      int v4 = 1024;
      if (objc_opt_respondsToSelector())
      {
        if ([(UIResponder *)self conformsToProtocol:&unk_1ED700940]) {
          int v4 = 1536;
        }
        else {
          int v4 = 1024;
        }
      }
    }
    else
    {
      int v4 = 1024;
    }
    unsigned int responderFlags = *(_WORD *)&self->_responderFlags & 0xF9FF | v4;
    *(_WORD *)&self->_unsigned int responderFlags = *(_WORD *)&self->_responderFlags & 0xF9FF | v4;
  }
  return (responderFlags >> 9) & 1;
}

- (UIEditingInteractionConfiguration)editingInteractionConfiguration
{
  return 1;
}

- (void)_setStoredActivityItemsConfiguration:(_WORD *)a1
{
  if (a1)
  {
    a1[4] = a1[4] & 0xFFDF | (32 * (value != 0));
    objc_setAssociatedObject(a1, &_UIActivityItemsConfigurationKey, value, (void *)1);
  }
}

- (BOOL)_containsResponder:(id)a3
{
  int v4 = (UIResponder *)a3;
  while (v4)
  {
    if (v4 == self) {
      break;
    }
    double v5 = v4;
    int v4 = [(UIResponder *)v4 nextResponder];
  }
  return v4 == self;
}

- (_NSRange)_nsrangeForTextRange:(id)a3
{
  id v4 = a3;
  double v5 = [(UIResponder *)self _selectableText];
  id v6 = [v4 start];
  NSUInteger v7 = [(UIResponder *)self _indexForTextPosition:v6];

  double v8 = [v4 start];
  double v9 = [v4 end];

  uint64_t v10 = [v5 offsetFromPosition:v8 toPosition:v9];
  NSUInteger v11 = v7;
  NSUInteger v12 = v10;
  result.NSUInteger length = v12;
  result.NSUInteger location = v11;
  return result;
}

- (int)_indexForTextPosition:(id)a3
{
  id v4 = a3;
  double v5 = [(UIResponder *)self _selectableText];
  id v6 = [v5 beginningOfDocument];
  int v7 = [v5 offsetFromPosition:v6 toPosition:v4];

  return v7;
}

- (void)_windowBecameKey
{
  BOOL v3 = [(UIResponder *)self _window];
  char v4 = [v3 _isSettingFirstResponder];

  if ((v4 & 1) == 0)
  {
    double v5 = [(UIResponder *)self _window];
    id v6 = [v5 windowScene];
    id v7 = [v6 keyboardSceneDelegate];

    if (![(UIResponder *)self _isTransitioningFromView:self]
      || [v7 ignoresPinning])
    {
      [(UIResponder *)self reloadInputViews];
    }
  }
}

- (BOOL)_isTransitioningFromView:(id)a3
{
  BOOL v3 = self;
  char v4 = [(UIResponder *)self nextResponder];
  LOBYTE(v3) = [v4 _isTransitioningFromView:v3];

  return (char)v3;
}

- (void)reloadInputViews
{
  if ([(UIResponder *)self shouldReloadInputViews])
  {
    id v5 = [(UIResponder *)self _responderWindow];
    BOOL v3 = [v5 windowScene];
    char v4 = [v3 keyboardSceneDelegate];
    [v4 _reloadInputViewsForResponder:self];
  }
}

- (id)_window
{
  double v2 = [(UIResponder *)self nextResponder];
  BOOL v3 = [v2 _window];

  return v3;
}

- (void)setPasteConfiguration:(id)a3
{
  *(_WORD *)&self->_unsigned int responderFlags = *(_WORD *)&self->_responderFlags & 0xFFEF | (16 * (a3 != 0));
  id v4 = (id)[a3 copy];
  objc_setAssociatedObject(self, &_pasteConfigurationKey, v4, (void *)1);
}

+ (BOOL)_isWritingToolsAvailable
{
  id WTWritingToolsViewControllerClass = getWTWritingToolsViewControllerClass();
  if (WTWritingToolsViewControllerClass)
  {
    LOBYTE(WTWritingToolsViewControllerClass) = [WTWritingToolsViewControllerClass isAvailable];
  }
  return (char)WTWritingToolsViewControllerClass;
}

- (void)_endPinningInputViews
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __36__UIResponder__endPinningInputViews__block_invoke;
  v2[3] = &unk_1E52E9EE0;
  v2[4] = self;
  +[UIKeyboardSceneDelegate performOnControllers:v2];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
}

- (void)_tagAsRestorableResponder
{
}

- (BOOL)_shouldRestorationInputViewsOnlyWhenKeepingFirstResponder
{
  return 0;
}

- (void)_completeForwardingTouches:(id)a3 phase:(int64_t)a4 event:(id)a5 index:(unint64_t)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  if (os_variant_has_internal_diagnostics())
  {
    if ((unint64_t)a4 > 4 || ((1 << a4) & 0x1A) == 0)
    {
      uint64_t v25 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      {
        int v28 = 136315138;
        v29 = "-[UIResponder _completeForwardingTouches:phase:event:index:]";
        _os_log_fault_impl(&dword_1853B0000, v25, OS_LOG_TYPE_FAULT, "Unexpected touch phase in %s", (uint8_t *)&v28, 0xCu);
      }
    }
  }
  else if ((unint64_t)a4 > 4 || ((1 << a4) & 0x1A) == 0)
  {
    v21 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB2624A8) + 8);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      int v28 = 136315138;
      v29 = "-[UIResponder _completeForwardingTouches:phase:event:index:]";
      _os_log_impl(&dword_1853B0000, v21, OS_LOG_TYPE_ERROR, "Unexpected touch phase in %s", (uint8_t *)&v28, 0xCu);
    }
  }
  NSUInteger v12 = [(UIResponder *)self nextResponder];
  double v13 = [v10 anyObject];
  double v14 = [v13 _forwardingRecord];
  unint64_t v15 = [v14 count];
  if (v15 <= a6) {
    goto LABEL_25;
  }
  unint64_t v16 = v15;
  while (1)
  {
    char v17 = [v14 objectAtIndex:a6];
    BOOL v18 = v17;
    if (v12)
    {
      char v19 = [v17 responder];

      if (v12 == v19) {
        break;
      }
    }
    [v18 setResponder:0];
    int v20 = 0;
LABEL_14:

    ++a6;
    NSUInteger v12 = v20;
    if (v16 == a6) {
      goto LABEL_26;
    }
  }
  if (!v18)
  {
    if (a4 > 0) {
      goto LABEL_21;
    }
    goto LABEL_13;
  }
  if (v18[3] >= a4 && (a4 != 1 || v18[4] != 1))
  {
LABEL_13:
    int v20 = [v12 nextResponder];
    goto LABEL_14;
  }
  v18[3] = a4;
  v18[4] = a4;
LABEL_21:
  v22 = [v18 responder];

  if (v22)
  {
    id v23 = [v13 _eventComponentPhase];
    uint64_t v24 = objc_msgSend(v13, "_responderSelectorForPhase:", objc_msgSend(v23, "value"));

    if (os_variant_has_internal_diagnostics())
    {
      if (!v24)
      {
        v26 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
        {
          int v28 = 136315138;
          v29 = "-[UIResponder _completeForwardingTouches:phase:event:index:]";
          _os_log_fault_impl(&dword_1853B0000, v26, OS_LOG_TYPE_FAULT, "Unexpected touch phase in %s", (uint8_t *)&v28, 0xCu);
        }
      }
    }
    else if (!v24)
    {
      v27 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB2624B0) + 8);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        int v28 = 136315138;
        v29 = "-[UIResponder _completeForwardingTouches:phase:event:index:]";
        _os_log_impl(&dword_1853B0000, v27, OS_LOG_TYPE_ERROR, "Unexpected touch phase in %s", (uint8_t *)&v28, 0xCu);
      }
    }
    ((void (*)(void *, uint64_t, id, id))[v12 methodForSelector:v24])(v22, v24, v10, v11);
    [v22 _completeForwardingTouches:v10 phase:a4 event:v11 index:a6 + 1];
  }
LABEL_25:
  int v20 = v12;
LABEL_26:
}

- (void)_completeForwardingTouches:(id)a3 phase:(int64_t)a4 event:(id)a5
{
}

- (void)promptBackgroundViewDidUpdateConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = [(UIResponder *)v5 nextResponder];
  [(UIResponder *)v6 promptBackgroundViewDidUpdateConfiguration:v4];
}

- (BOOL)_allowsChangingFirstResponderForFocusUpdateWithContext:(id)a3
{
  return 1;
}

- (BOOL)_shouldSkipKeyCommand:(id)a3 forMovement:(int64_t)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ((unint64_t)(a4 - 6) > 0xFFFFFFFFFFFFFFFDLL) {
    goto LABEL_16;
  }
  id v7 = self;
  double v8 = v7;
  if (qword_1EB25EF08 == -1)
  {
    if (v7) {
      goto LABEL_4;
    }
    goto LABEL_6;
  }
  dispatch_once(&qword_1EB25EF08, &__block_literal_global_18);
  if (v8)
  {
LABEL_4:
    while (1)
    {
      uint64_t v9 = _MergedGlobals_934;
      if (v9 != [v8 methodForSelector:sel__wantsPriorityOverFocusUpdates]) {
        break;
      }
      uint64_t v10 = [v8 nextResponder];

      double v8 = (void *)v10;
      if (!v10) {
        goto LABEL_6;
      }
    }
    _UIIsPrivateMainBundle();
    if (dyld_program_sdk_at_least())
    {
      NSUInteger v12 = [MEMORY[0x1E4F28B00] currentHandler];
      double v13 = [NSString stringWithUTF8String:"BOOL __legacyWantsPriorityOverFocusUpdate(UIResponder * _Nonnull __strong)"];
      double v14 = (objc_class *)objc_opt_class();
      unint64_t v15 = NSStringFromClass(v14);
      unint64_t v16 = NSStringFromSelector(sel__wantsPriorityOverFocusUpdates);
      [v12 handleFailureInFunction:v13, @"UIResponder_Focus.m", 91, @"Class %@ implements %@, which is no longer supported.", v15, v16 file lineNumber description];
    }
    else
    {
      if (os_variant_has_internal_diagnostics())
      {
        NSUInteger v12 = __UIFaultDebugAssertLog();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
          goto LABEL_14;
        }
        v22 = (objc_class *)objc_opt_class();
        double v13 = NSStringFromClass(v22);
        char v19 = NSStringFromSelector(sel__wantsPriorityOverFocusUpdates);
        *(_DWORD *)buf = 138412546;
        uint64_t v24 = v13;
        __int16 v25 = 2112;
        v26 = v19;
        _os_log_fault_impl(&dword_1853B0000, v12, OS_LOG_TYPE_FAULT, "Class %@ implements %@, which is no longer supported.  This will become an assert in a future version.", buf, 0x16u);
      }
      else
      {
        char v17 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25EF10) + 8);
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          goto LABEL_15;
        }
        NSUInteger v12 = v17;
        BOOL v18 = (objc_class *)objc_opt_class();
        double v13 = NSStringFromClass(v18);
        char v19 = NSStringFromSelector(sel__wantsPriorityOverFocusUpdates);
        *(_DWORD *)buf = 138412546;
        uint64_t v24 = v13;
        __int16 v25 = 2112;
        v26 = v19;
        _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "Class %@ implements %@, which is no longer supported.  This will become an assert in a future version.", buf, 0x16u);
      }
    }
LABEL_14:

LABEL_15:
    char v20 = [v8 _wantsPriorityOverFocusUpdates];

    if ((v20 & 1) == 0) {
      goto LABEL_6;
    }
LABEL_16:
    LOBYTE(v11) = 0;
    goto LABEL_17;
  }
LABEL_6:
  int v11 = [v6 wantsPriorityOverSystemBehavior] ^ 1;
LABEL_17:

  return v11;
}

- (BOOL)_shouldForwardMovementToFocusEngine:(int64_t)a3
{
  if (![(UIResponder *)self conformsToProtocol:&unk_1ED42EEC0]) {
    return 1;
  }
  if ((unint64_t)(a3 - 4) < 2) {
    return ![(UIResponder *)self isFirstResponder];
  }
  if (a3 != 3 || (objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  return [(UIResponder *)self isSingleLineDocument];
}

- (id)_ui_findNavigatorResponder
{
  double v2 = [(UIResponder *)self nextResponder];
  BOOL v3 = objc_msgSend(v2, "_ui_findNavigatorResponder");

  return v3;
}

- (id)_effectiveActivityItemsConfigurationForSender:(id)a3
{
  BOOL v3 = _UIResponderTargetForAction(self, sel_copy_, a3);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = [v3 _effectiveActivityItemsConfiguration];
LABEL_5:
    id v5 = (void *)v4;
    goto LABEL_7;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = [v3 activityItemsConfiguration];
    goto LABEL_5;
  }
  id v5 = 0;
LABEL_7:

  return v5;
}

- (id)_effectiveActivityItemsConfigurationAtLocation:(CGPoint)a3 inCoordinateSpace:(id)a4 sender:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  id v9 = a4;
  id v10 = a5;
  int v11 = _UIResponderTargetForAction(self, sel_copy_, v10);
  if (objc_opt_respondsToSelector())
  {
    objc_msgSend(v11, "convertPoint:fromCoordinateSpace:", v9, x, y);
    objc_msgSend(v11, "_activityItemsConfigurationAtLocation:");
  }
  else
  {
    _activityItemsConfigurationForTarget(v11, v10);
  NSUInteger v12 = };

  return v12;
}

- (id)_firstNonnullActivityItemsConfigurationInResponderChainForLocation:(CGPoint)a3 inCoordinateSpace:(id)a4 skipPresentingViewControllers:(BOOL)a5 sender:(id)a6 target:(id *)a7
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v12 = a4;
  id v13 = a6;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  int v28 = __Block_byref_object_copy__85;
  v29 = __Block_byref_object_dispose__85;
  id v30 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __174__UIResponder_UIActivityItemsConfiguration___firstNonnullActivityItemsConfigurationInResponderChainForLocation_inCoordinateSpace_skipPresentingViewControllers_sender_target___block_invoke;
  v20[3] = &unk_1E52EDCB0;
  CGFloat v23 = x;
  CGFloat v24 = y;
  id v14 = v12;
  id v21 = v14;
  v22 = &v25;
  unint64_t v15 = _Block_copy(v20);
  unint64_t v16 = _UIResponderTargetForActionWithTestBlock(self, sel_copy_, self, v15);
  char v17 = v16;
  if (a7) {
    *a7 = v16;
  }
  id v18 = (id)v26[5];

  _Block_object_dispose(&v25, 8);
  return v18;
}

BOOL __174__UIResponder_UIActivityItemsConfiguration___firstNonnullActivityItemsConfigurationInResponderChainForLocation_inCoordinateSpace_skipPresentingViewControllers_sender_target___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v7 = a2;
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v7, "_effectiveActivityItemsConfigurationAtLocation:inCoordinateSpace:sender:", *(void *)(a1 + 32), v6, *(double *)(a1 + 48), *(double *)(a1 + 56));
  }
  else {
  double v8 = _activityItemsConfigurationForTarget(v7, v6);
  }

  if (v8) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v8);
  }

  return v8 != 0;
}

- (BOOL)_handleActivityItemsConfigurationCanPerformAction:(SEL)a3 sender:(id)a4
{
  id v6 = a4;
  if (sel__share_ == a3 || sel_copy_ == a3)
  {
    double v8 = [(UIResponder *)self _effectiveActivityItemsConfiguration];
  }
  else
  {
    double v8 = 0;
  }
  if (!dyld_program_sdk_at_least() || !_UIActivityItemsConfigurationHasItems(v8))
  {
    BOOL v9 = 0;
    goto LABEL_13;
  }
  if (sel__share_ == a3)
  {
    id v11 = v8;
    id v12 = v6;
    if ((+[_UITextServiceSession availableTextServices] & 8) == 0) {
      goto LABEL_24;
    }
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_20;
    }
    id v13 = &UIActivityItemsConfigurationInteractionShare;
LABEL_19:
    if ([v11 activityItemsConfigurationSupportsInteraction:*v13])
    {
LABEL_20:
      id v14 = v12;
      if ((objc_opt_respondsToSelector() & 1) != 0
        && ([v14 sender],
            unint64_t v15 = objc_claimAutoreleasedReturnValue(),
            int v16 = objc_msgSend(v15, "__isKindOfUIResponder"),
            v15,
            v16)
        && ([v14 sender], char v17 = objc_claimAutoreleasedReturnValue(), (v18 = v17) != 0))
      {
        char v19 = [v17 activityItemsConfiguration];
        BOOL v9 = v19 != 0;
      }
      else
      {
        BOOL v9 = 1;
      }

      goto LABEL_27;
    }
LABEL_24:
    BOOL v9 = 0;
LABEL_27:

    goto LABEL_13;
  }
  if (sel_copy_ == a3)
  {
    id v11 = v8;
    id v12 = v6;
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_20;
    }
    id v13 = &UIActivityItemsConfigurationInteractionCopy;
    goto LABEL_19;
  }
  BOOL v9 = 1;
LABEL_13:

  return v9;
}

- (BOOL)_handleActivityItemsConfigurationDoesNotHandleSelector:(SEL)a3
{
  int v5 = dyld_program_sdk_at_least();
  BOOL result = 0;
  if (v5 && sel_copy_ == a3)
  {
    id v7 = [(UIResponder *)self _effectiveActivityItemsConfigurationForSender:self];

    if (v7)
    {
      int64_t v8 = [(UIResponder *)self _dataOwnerForCopy];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __100__UIResponder_UIActivityItemsConfiguration___handleActivityItemsConfigurationDoesNotHandleSelector___block_invoke;
      v9[3] = &unk_1E52D9F70;
      v9[4] = self;
      +[UIPasteboard _performAsDataOwner:v8 block:v9];
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void __100__UIResponder_UIActivityItemsConfiguration___handleActivityItemsConfigurationDoesNotHandleSelector___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _effectiveActivityItemsConfigurationForSender:*(void *)(a1 + 32)];
  v1 = [v3 itemProvidersForActivityItemsConfiguration];
  double v2 = +[UIPasteboard generalPasteboard];
  [v2 setItemProviders:v1];
}

- (BOOL)_handleActivityItemsConfigurationShare:(id)a3
{
  id v4 = a3;
  if (dyld_program_sdk_at_least())
  {
    int v5 = [(UIResponder *)self _effectiveActivityItemsConfigurationForSender:v4];
    BOOL v6 = [(UIResponder *)self _handleActivityItemsConfigurationShare:v4 activityItemsConfiguration:v5];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_handleActivityItemsConfigurationShare:(id)a3 activityItemsConfiguration:(id)a4
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = v7;
  if (!v7) {
    goto LABEL_4;
  }
  id v9 = v7;
  id v10 = v6;
  if ((+[_UITextServiceSession availableTextServices] & 8) != 0
    && ((objc_opt_respondsToSelector() & 1) == 0
     || [v9 activityItemsConfigurationSupportsInteraction:@"share"]))
  {
    id v12 = v10;
    if ((objc_opt_respondsToSelector() & 1) != 0
      && ([v12 sender],
          id v13 = objc_claimAutoreleasedReturnValue(),
          int v14 = objc_msgSend(v13, "__isKindOfUIResponder"),
          v13,
          v14)
      && ([v12 sender], (unint64_t v15 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      int v16 = v15;
      char v17 = [v15 activityItemsConfiguration];

      if (!v17) {
        goto LABEL_4;
      }
    }
    else
    {
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v18 = [v12 _targetView];
      char v19 = _viewControllerToPresentFromBasedOnResponder(v18);
    }
    else
    {
      char v19 = 0;
    }
    char v20 = [v19 viewIfLoaded];
    id v21 = [v20 _window];

    if (!v21)
    {
      uint64_t v22 = _viewControllerToPresentFromBasedOnResponder(self);

      char v19 = (void *)v22;
    }
    CGFloat v23 = [v19 viewIfLoaded];
    CGFloat v24 = [v23 _window];

    if (!v24)
    {
      uint64_t v25 = [(UIResponder *)self _window];
      uint64_t v26 = [v25 rootViewController];

      char v19 = (void *)v26;
    }
    uint64_t v27 = [v19 viewIfLoaded];
    int v28 = [v27 _window];

    if (!v28)
    {
      v29 = _UIActivityItemsConfigurationLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1853B0000, v29, OS_LOG_TYPE_ERROR, "Could not derive a window scene from the responder returning an activity items configuration. Return a non-nil activity items configuration from a responder in a window scene to avoid this.", buf, 2u);
      }

      id v30 = +[UIScene _mostActiveScene];
      objc_opt_class();
      v65 = v30;
      if (objc_opt_isKindOfClass())
      {
        id v31 = v30;
      }
      else
      {
        [(id)UIApp connectedScenes];
        long long v66 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        id v32 = (id)objc_claimAutoreleasedReturnValue();
        id v31 = (id)[v32 countByEnumeratingWithState:&v66 objects:v71 count:16];
        if (v31)
        {
          v63 = self;
          id v64 = v9;
          uint64_t v33 = *(void *)v67;
          while (2)
          {
            for (i = 0; i != v31; i = (char *)i + 1)
            {
              if (*(void *)v67 != v33) {
                objc_enumerationMutation(v32);
              }
              v35 = *(void **)(*((void *)&v66 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v31 = v35;
                goto LABEL_35;
              }
            }
            id v31 = (id)[v32 countByEnumeratingWithState:&v66 objects:v71 count:16];
            if (v31) {
              continue;
            }
            break;
          }
LABEL_35:
          self = v63;
          id v9 = v64;
        }
      }
      if (v31)
      {
        v36 = _preferredUIWindowInWindowScene(v31);
        uint64_t v37 = [v36 rootViewController];

        char v19 = (void *)v37;
      }
    }
    v38 = [v19 viewIfLoaded];
    __int16 v39 = [v38 _window];

    if (!v39)
    {
      p_super = _UIActivityItemsConfigurationLog();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1853B0000, p_super, OS_LOG_TYPE_ERROR, "Could not find a view controller to present a share sheet from. A share sheet will not be presented.", buf, 2u);
      }
      goto LABEL_56;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v40 = v12;
      uint64_t v41 = [v40 _targetView];
      if (v41)
      {
        p_super = v41;
        [v40 _targetRect];
        -[NSObject convertRect:fromView:](p_super, "convertRect:fromView:", 0);
        double v44 = v43;
        double v46 = v45;
        double v48 = v47;
        double v50 = v49;

LABEL_55:
        v60 = (void *)[objc_alloc(MEMORY[0x1E4F9F2E8]) initWithActivityItemsConfiguration:v9];
        v61 = [v60 popoverPresentationController];
        [v61 setSourceView:p_super];
        objc_msgSend(v61, "setSourceRect:", v44, v46, v48, v50);
        [v19 presentViewController:v60 animated:1 completion:&__block_literal_global_200];

LABEL_56:
        BOOL v11 = 1;
        goto LABEL_57;
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v51 = self;
      if (!v51)
      {
LABEL_53:
        p_super = [v19 view];
        v52 = [v19 view];
        [(UIResponder *)v52 bounds];
        double v54 = v57;
        v58 = [v19 view];
        [v58 bounds];
        double v56 = v59;

        goto LABEL_54;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_53;
      }
      v51 = [(UIResponder *)self view];
      if (!v51) {
        goto LABEL_53;
      }
    }
    v52 = v51;
    [(UIResponder *)v52 bounds];
    double v54 = v53;
    [(UIResponder *)v52 bounds];
    double v56 = v55;
    p_super = &v52->super;
LABEL_54:

    double v46 = v56 * 0.5;
    double v44 = v54 * 0.5;
    double v50 = 1.0;
    double v48 = 1.0;
    goto LABEL_55;
  }

LABEL_4:
  BOOL v11 = 0;
LABEL_57:

  return v11;
}

- (id)textInputSuggestionDelegate
{
  double v2 = [(UIResponder *)self _selectableText];
  id v3 = [v2 inputDelegate];
  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (int64_t)_textInputSource
{
  double v2 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];

  if (!v2) {
    return __UIPlatformFallbackInputSource;
  }
  id v3 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
  int64_t v4 = [v3 lastEventSource];

  return v4;
}

- (void)set_textInputSource:(int64_t)a3
{
  int v5 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];

  if (v5)
  {
    BOOL v6 = (objc_opt_respondsToSelector() & 1) != 0 && [(UIResponder *)self keyboardType] == 122;
    if (a3 == 3 && v6) {
      uint64_t v7 = 2;
    }
    else {
      uint64_t v7 = 5;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int64_t v8 = self;
    }
    else {
      int64_t v8 = 0;
    }
    id v9 = v8;
    id v10 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
    [v10 updateEventSource:a3 options:v7 responder:v9];
  }
  else
  {
    __UIPlatformFallbackInputSource = a3;
  }
}

- (_NSRange)_selectedNSRange
{
  id v3 = [(UIResponder *)self _selectableText];
  int64_t v4 = v3;
  if (v3)
  {
    int v5 = [v3 selectedTextRange];
    if (v5)
    {
      uint64_t v6 = [(UIResponder *)self _nsrangeForTextRange:v5];
      NSUInteger v8 = v7;
    }
    else
    {
      NSUInteger v8 = 0;
      uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    NSUInteger v8 = 0;
    uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  NSUInteger v9 = v6;
  NSUInteger v10 = v8;
  result.NSUInteger length = v10;
  result.NSUInteger location = v9;
  return result;
}

- (_NSRange)_selectedRangeWithinMarkedText
{
  double v2 = [(UIResponder *)self _selectableText];
  id v3 = v2;
  if (v2)
  {
    int64_t v4 = [v2 selectedTextRange];
    if (v4)
    {
      int v5 = [v3 markedTextRange];
      uint64_t v6 = v5;
      if (!v5
        || ([v5 start],
            NSUInteger v7 = objc_claimAutoreleasedReturnValue(),
            [v4 start],
            NSUInteger v8 = objc_claimAutoreleasedReturnValue(),
            uint64_t v9 = [v3 offsetFromPosition:v7 toPosition:v8],
            v8,
            v7,
            v9 < 0))
      {
        uint64_t v12 = 0;
        uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else
      {
        NSUInteger v10 = [v4 start];
        BOOL v11 = [v4 end];
        uint64_t v12 = [v3 offsetFromPosition:v10 toPosition:v11];
      }
    }
    else
    {
      uint64_t v12 = 0;
      uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  }

  NSUInteger v13 = v9;
  NSUInteger v14 = v12;
  result.NSUInteger length = v14;
  result.NSUInteger location = v13;
  return result;
}

- (void)_selectAll
{
  id v3 = [(UIResponder *)self _selectableText];
  double v2 = [v3 _fullRange];
  [v3 setSelectedTextRange:v2];
}

- (unsigned)_characterAfterCaretSelection
{
  return [(UIResponder *)self _characterInRelationToCaretSelection:0];
}

- (unsigned)_characterBeforeCaretSelection
{
  return [(UIResponder *)self _characterInRelationToCaretSelection:0xFFFFFFFFLL];
}

- (unsigned)_characterInRelationToCaretSelection:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = [(UIResponder *)self _selectableText];
  uint64_t v6 = [v5 selectedTextRange];
  if (v6
    && (NSUInteger v7 = (void *)v6,
        [v5 selectedTextRange],
        NSUInteger v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 isEmpty],
        v8,
        v7,
        v9))
  {
    unsigned int v10 = [(UIResponder *)self _characterInRelationToRangedSelection:v3];
  }
  else
  {
    unsigned int v10 = 0;
  }

  return v10;
}

- (unsigned)_characterInRelationToRangedSelection:(int)a3
{
  int64_t v4 = [(UIResponder *)self _selectableText];
  int v5 = [v4 selectedTextRange];

  if (!v5) {
    goto LABEL_4;
  }
  if (a3 > -101)
  {
    if ((a3 & 0x80000000) == 0)
    {
      NSUInteger v7 = [v4 selectedTextRange];
      NSUInteger v8 = [v7 end];

      if (a3)
      {
        uint64_t v9 = [v4 positionFromPosition:v8 offset:a3];

        NSUInteger v8 = (void *)v9;
      }
      if (!v8) {
        goto LABEL_17;
      }
LABEL_11:
      uint64_t v12 = [v4 positionFromPosition:v8 offset:1];
      if (v12)
      {
        NSUInteger v13 = (void *)v12;
        NSUInteger v14 = [v4 textRangeFromPosition:v8 toPosition:v12];
        unint64_t v15 = [v4 textInRange:v14];
        if ([v15 length])
        {
          if ([v15 length] == 2
            && (int v16 = [v15 characterAtIndex:0],
                int v17 = [v15 characterAtIndex:1],
                (v16 & 0xFC00) == 0xD800)
            && (v17 & 0xFC00) == 0xDC00)
          {
            unsigned int v6 = v17 + (v16 << 10) - 56613888;
          }
          else
          {
            unsigned int v6 = [v15 characterAtIndex:0];
          }
        }
        else
        {
          unsigned int v6 = 0;
        }

        goto LABEL_21;
      }
LABEL_17:
      unsigned int v6 = 0;
LABEL_21:

      goto LABEL_22;
    }
LABEL_10:
    unsigned int v10 = [v4 selectedTextRange];
    BOOL v11 = [v10 start];
    NSUInteger v8 = [v4 positionFromPosition:v11 offset:a3];

    if (!v8) {
      goto LABEL_17;
    }
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_10;
  }
LABEL_4:
  unsigned int v6 = 0;
LABEL_22:

  return v6;
}

- (unsigned)_characterInRelationToPosition:(id)a3 amount:(int)a4
{
  if (!a3) {
    return 0;
  }
  id v6 = a3;
  NSUInteger v7 = [(UIResponder *)self _selectableText];
  NSUInteger v8 = [v7 positionFromPosition:v6 offset:a4];

  uint64_t v9 = [v7 positionFromPosition:v8 offset:1];
  unsigned int v10 = [v7 textRangeFromPosition:v8 toPosition:v9];
  BOOL v11 = [v7 textInRange:v10];
  if ([v11 length])
  {
    if ([v11 length] == 2
      && (int v12 = [v11 characterAtIndex:0],
          int v13 = [v11 characterAtIndex:1],
          (v12 & 0xFC00) == 0xD800)
      && (v13 & 0xFC00) == 0xDC00)
    {
      unsigned int v14 = v13 + (v12 << 10) - 56613888;
    }
    else
    {
      unsigned int v14 = [v11 characterAtIndex:0];
    }
  }
  else
  {
    unsigned int v14 = 0;
  }

  return v14;
}

- (id)_wordContainingCaretSelection
{
  uint64_t v3 = [(UIResponder *)self _selectableText];
  int64_t v4 = [v3 selectedTextRange];
  if (v4)
  {
    int v5 = [v3 selectedTextRange];
    int v6 = [v5 isEmpty];

    if (v6)
    {
      NSUInteger v7 = [v3 selectedTextRange];
      NSUInteger v8 = [v7 start];
      uint64_t v9 = [(UIResponder *)self _rangeOfEnclosingWord:v8];

      if (v9)
      {
        int64_t v4 = [v3 textInRange:v9];
      }
      else
      {
        int64_t v4 = 0;
      }
    }
    else
    {
      int64_t v4 = 0;
    }
  }

  return v4;
}

- (id)_fullText
{
  double v2 = [(UIResponder *)self _selectableText];
  uint64_t v3 = [v2 beginningOfDocument];
  int64_t v4 = [v2 endOfDocument];
  int v5 = [v2 textRangeFromPosition:v3 toPosition:v4];

  int v6 = [v2 textInRange:v5];

  return v6;
}

- (void)_setSelectionToPosition:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v6 = [(UIResponder *)self _selectableText];
    int v5 = [v6 textRangeFromPosition:v4 toPosition:v4];

    if (v5) {
      [v6 setSelectedTextRange:v5];
    }
  }
}

- (BOOL)_selectionAtWordStart
{
  uint64_t v3 = [(UIResponder *)self _selectableText];
  id v4 = [v3 selectedTextRange];
  int v5 = [v4 start];
  id v6 = [(UIResponder *)self _rangeOfEnclosingWord:v5];

  if (v6)
  {
    NSUInteger v7 = [v6 start];
    NSUInteger v8 = [v3 selectedTextRange];
    uint64_t v9 = [v8 start];
    uint64_t v10 = [v3 comparePosition:v7 toPosition:v9];

    BOOL v11 = v10 == 0;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)_selectionAtDocumentStart
{
  double v2 = [(UIResponder *)self _selectableText];
  uint64_t v3 = [v2 selectedTextRange];
  id v4 = [v3 start];

  if (v4)
  {
    int v5 = [v2 beginningOfDocument];
    BOOL v6 = [v2 comparePosition:v5 toPosition:v4] == 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_selectionAtDocumentEnd
{
  double v2 = [(UIResponder *)self _selectableText];
  uint64_t v3 = [v2 selectedTextRange];
  id v4 = [v3 end];

  if (v4)
  {
    int v5 = [v2 endOfDocument];
    BOOL v6 = [v2 comparePosition:v5 toPosition:v4] == 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_isEmptySelection
{
  double v2 = [(UIResponder *)self _selectableText];
  uint64_t v3 = [v2 selectedTextRange];
  id v4 = [v3 start];
  int v5 = [v3 end];
  BOOL v6 = [v2 comparePosition:v4 toPosition:v5] == 0;

  return v6;
}

- (BOOL)_hasMarkedTextOrRangedSelection
{
  double v2 = [(UIResponder *)self _selectableText];
  uint64_t v3 = [v2 markedTextRange];
  if (v3)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    int v5 = [v2 selectedTextRange];
    if (v5)
    {
      BOOL v6 = [v2 selectedTextRange];
      int v4 = [v6 isEmpty] ^ 1;
    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }
  return v4;
}

- (void)_extendCurrentSelection:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = [(UIResponder *)self _selectableText];
  if (v3)
  {
    id v15 = v5;
    BOOL v6 = [v5 selectedTextRange];

    int v5 = v15;
    if (v6)
    {
      NSUInteger v7 = [v15 selectedTextRange];
      NSUInteger v8 = [v7 start];

      uint64_t v9 = [v15 selectedTextRange];
      uint64_t v10 = [v9 end];

      if ((int)v3 < 1)
      {
        uint64_t v13 = [(UIResponder *)self _clampedpositionFromPosition:v8 offset:v3];
        int v12 = v8;
        NSUInteger v8 = (void *)v13;
      }
      else
      {
        uint64_t v11 = [(UIResponder *)self _clampedpositionFromPosition:v10 offset:v3];
        int v12 = v10;
        uint64_t v10 = (void *)v11;
      }

      unsigned int v14 = [v15 textRangeFromPosition:v8 toPosition:v10];
      [v15 setSelectedTextRange:v14];

      int v5 = v15;
    }
  }
}

- (void)_moveCurrentSelection:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = [(UIResponder *)self _selectableText];
  if (v3)
  {
    id v14 = v5;
    BOOL v6 = [v5 selectedTextRange];

    int v5 = v14;
    if (v6)
    {
      NSUInteger v7 = [v14 selectedTextRange];
      int v8 = [v7 isEmpty];

      if (v8)
      {
        uint64_t v9 = [v14 selectedTextRange];
        uint64_t v10 = [v9 start];
      }
      else
      {
        uint64_t v11 = [v14 selectedTextRange];
        uint64_t v10 = [v11 end];

        if ((int)v3 < 1) {
          uint64_t v3 = (v3 + 1);
        }
        else {
          uint64_t v3 = (v3 - 1);
        }
      }
      int v12 = [(UIResponder *)self _clampedpositionFromPosition:v10 offset:v3];

      uint64_t v13 = [v14 textRangeFromPosition:v12 toPosition:v12];
      if (v13) {
        [v14 setSelectedTextRange:v13];
      }

      int v5 = v14;
    }
  }
}

- (void)_expandSelectionToBackwardDeletionClusterWithReinsertionOut:(id *)a3
{
  id v24 = [(UIResponder *)self _selectableText];
  int v4 = [v24 selectedTextRange];
  int v5 = [v4 start];
  BOOL v6 = [v4 end];
  id v7 = v5;
  if (!v4 || ([v4 isEmpty] & 1) != 0)
  {
    int v8 = &stru_1ED0E84C0;
    if (v7) {
      goto LABEL_4;
    }
LABEL_18:
    id v19 = 0;
    uint64_t v10 = 0;
    goto LABEL_29;
  }
  int v8 = [v24 textInRange:v4];
  if (!v7) {
    goto LABEL_18;
  }
LABEL_4:
  CGFloat v23 = a3;
  uint64_t v9 = v7;
  uint64_t v10 = v7;
  while (1)
  {
    uint64_t v11 = v8;
    uint64_t v12 = [(__CFString *)v11 length];
    if (v12)
    {
      uint64_t v13 = v12;
      [(__CFString *)v11 _rangeOfBackwardDeletionClusterAtIndex:[(__CFString *)v11 length] - 1];
      uint64_t v15 = v14;
      int v16 = v13 - v14;

      if (v13 != v15)
      {
        int v8 = v11;
        id v19 = v9;
        goto LABEL_20;
      }
    }
    else
    {

      int v16 = 0;
    }
    id v19 = v10;

    uint64_t v10 = [v24 positionFromPosition:v19 offset:-1];

    if (v10)
    {
      int v17 = [v24 textRangeFromPosition:v10 toPosition:v19];
      if (v17)
      {
        id v18 = [v24 textInRange:v17];
      }
      else
      {
        id v18 = 0;
      }
    }
    else
    {
      id v18 = 0;
      int v17 = 0;
    }
    if (!objc_msgSend(v18, "length", v23)) {
      break;
    }
    int v8 = [v18 stringByAppendingString:v11];

    uint64_t v9 = v19;
    if (!v10) {
      goto LABEL_20;
    }
  }

  uint64_t v10 = 0;
  int v8 = v11;
LABEL_20:
  char v20 = v24;
  if (v23 && v16 >= 1)
  {
    id v21 = v10;

    *CGFloat v23 = [(__CFString *)v8 substringToIndex:v16];
    char v20 = v24;
    id v19 = v21;
  }
  if (v19 != v7 && v19 && v6)
  {
    uint64_t v22 = [v20 textRangeFromPosition:v19 toPosition:v6];
    if (v22) {
      [v24 setSelectedTextRange:v22];
    }
  }
LABEL_29:
}

- (void)_expandSelectionToStartOfWordBeforeCaretSelection
{
}

- (void)_expandSelectionToStartOfWordsBeforeCaretSelection:(int)a3
{
  id v10 = [(UIResponder *)self _selectableText];
  int v4 = [v10 selectedTextRange];
  int v5 = v4;
  if (a3 && v4)
  {
    BOOL v6 = [v4 start];
    id v7 = [v10 _positionAtStartOfWords:a3 beforePosition:v6];

    if (v7)
    {
      int v8 = [v5 end];
      uint64_t v9 = [v10 textRangeFromPosition:v7 toPosition:v8];
      [v10 setSelectedTextRange:v9];
    }
  }
}

- (id)_positionWithinRange:(id)a3 farthestInDirection:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(UIResponder *)self _selectableText];
  int v8 = v7;
  if (a4 == 1)
  {
    uint64_t v9 = [v6 start];
    goto LABEL_7;
  }
  if (!a4)
  {
    uint64_t v9 = [v6 end];
LABEL_7:
    id v10 = (void *)v9;
    goto LABEL_8;
  }
  if (v6)
  {
    uint64_t v9 = [v7 positionWithinRange:v6 farthestInDirection:a4];
    goto LABEL_7;
  }
  id v10 = 0;
LABEL_8:

  return v10;
}

- (int64_t)_opposingDirectionFromDirection:(int64_t)a3
{
  int64_t result = a3;
  if ((unint64_t)a3 <= 5) {
    return qword_186B9AF70[a3];
  }
  return result;
}

- (id)_positionFromPosition:(id)a3 pastTextUnit:(int64_t)a4 inDirection:(int64_t)a5
{
  id v8 = a3;
  uint64_t v9 = [(UIResponder *)self _selectableText];
  if (v8)
  {
    uint64_t v10 = -3;
    while (!__CFADD__(v10++, 1))
    {
      uint64_t v12 = [v9 tokenizer];
      uint64_t v13 = [v12 positionFromPosition:v8 toBoundary:a4 inDirection:a5];

      if (!v13)
      {
        id v17 = 0;
        id v8 = 0;
        goto LABEL_12;
      }
      uint64_t v14 = [v9 tokenizer];
      if ([v14 isPosition:v13 atBoundary:a4 inDirection:a5])
      {

LABEL_11:
        id v17 = v13;
        id v8 = v17;
        goto LABEL_12;
      }
      uint64_t v15 = [v9 tokenizer];
      int v16 = objc_msgSend(v15, "isPosition:atBoundary:inDirection:", v13, a4, -[UIResponder _opposingDirectionFromDirection:](self, "_opposingDirectionFromDirection:", a5));

      id v8 = v13;
      if (v16) {
        goto LABEL_11;
      }
    }
  }
  id v17 = 0;
LABEL_12:

  return v17;
}

- (id)_positionAtStartOfWords:(unint64_t)a3 beforePosition:(id)a4
{
  id v6 = a4;
  id v7 = [(UIResponder *)self _selectableText];
  id v8 = v7;
  if (!a3 || !v6)
  {
    id v6 = v6;
    uint64_t v10 = v6;
    goto LABEL_13;
  }
  uint64_t v9 = [v7 tokenizer];
  uint64_t v10 = [v9 rangeEnclosingPosition:v6 withGranularity:1 inDirection:1];

  if (v10) {
    goto LABEL_4;
  }
  id v18 = [v8 tokenizer];
  id v19 = [v18 positionFromPosition:v6 toBoundary:1 inDirection:1];

  if (!v19)
  {
    uint64_t v10 = 0;
    goto LABEL_13;
  }
  char v20 = [v8 tokenizer];
  uint64_t v10 = [v20 rangeEnclosingPosition:v19 withGranularity:1 inDirection:1];

  if (v10)
  {
LABEL_4:
    uint64_t v11 = [v10 start];

    if (a3 >= 2)
    {
      unint64_t v12 = a3 - 1;
      while (1)
      {
        uint64_t v13 = [v8 tokenizer];
        uint64_t v14 = [v13 positionFromPosition:v11 toBoundary:1 inDirection:1];

        if (!v14) {
          break;
        }
        uint64_t v15 = [v8 tokenizer];
        int v16 = [v15 positionFromPosition:v14 toBoundary:1 inDirection:1];

        if (!v16) {
          break;
        }

        uint64_t v11 = v16;
        if (!--v12) {
          goto LABEL_12;
        }
      }
    }
    int v16 = v11;
LABEL_12:
    id v6 = v16;

    uint64_t v10 = v6;
  }
LABEL_13:

  return v10;
}

- (void)_setCaretSelectionAtEndOfSelection
{
  id v7 = [(UIResponder *)self _selectableText];
  double v2 = [v7 selectedTextRange];
  uint64_t v3 = v2;
  if (v2)
  {
    int v4 = [v2 end];
    int v5 = [v3 end];
    id v6 = [v7 textRangeFromPosition:v4 toPosition:v5];
    [v7 setSelectedTextRange:v6];
  }
}

- (void)_deleteByWord
{
  id v10 = [(UIResponder *)self _selectableText];
  uint64_t v3 = [v10 selectedTextRange];
  int v4 = [v10 inputDelegate];
  [v4 textWillChange:v10];

  if ([v3 isEmpty])
  {
    int v5 = [v3 start];
    id v6 = [v10 _positionAtStartOfWords:1 beforePosition:v5];

    if (v6)
    {
      id v7 = [v3 end];
      uint64_t v8 = [v10 textRangeFromPosition:v6 toPosition:v7];

      uint64_t v3 = (void *)v8;
    }
  }
  [(UIResponder *)self _deleteTextRange:v3];
  uint64_t v9 = [v10 inputDelegate];
  [v9 textDidChange:v10];
}

- (void)_deleteForwardByWord
{
  id v18 = [(UIResponder *)self _selectableText];
  uint64_t v3 = [v18 selectedTextRange];
  int v4 = [v18 inputDelegate];
  [v4 textWillChange:v18];

  if ([v3 isEmpty])
  {
    int v5 = [(UIResponder *)self _selectableText];
    id v6 = v5;
    if (v3)
    {
      id v7 = [v5 tokenizer];
      uint64_t v8 = [v3 end];
      uint64_t v9 = [v7 rangeEnclosingPosition:v8 withGranularity:1 inDirection:0];

      if (v9) {
        goto LABEL_4;
      }
      uint64_t v14 = [v6 tokenizer];
      uint64_t v15 = [v3 end];
      int v16 = [v14 positionFromPosition:v15 toBoundary:1 inDirection:0];

      if (v16)
      {
        id v17 = [v6 tokenizer];
        uint64_t v9 = [v17 rangeEnclosingPosition:v16 withGranularity:1 inDirection:0];

        if (v9)
        {
LABEL_4:
          id v10 = [v3 start];
          uint64_t v11 = [v9 end];
          uint64_t v12 = [v6 textRangeFromPosition:v10 toPosition:v11];

          uint64_t v3 = (void *)v12;
        }
      }
    }
  }
  [(UIResponder *)self _deleteTextRange:v3];
  uint64_t v13 = [v18 inputDelegate];
  [v13 textDidChange:v18];
}

- (void)_deleteToStartOfLine
{
  id v13 = [(UIResponder *)self _selectableText];
  uint64_t v3 = [v13 selectedTextRange];
  int v4 = [v13 inputDelegate];
  [v4 textWillChange:v13];

  if ([v3 isEmpty])
  {
    int v5 = [v13 tokenizer];
    id v6 = [v3 start];
    id v7 = [v5 positionFromPosition:v6 toBoundary:4 inDirection:1];

    if (v7)
    {
      uint64_t v8 = [v3 start];
      uint64_t v9 = [v13 comparePosition:v8 toPosition:v7];

      if (v9 == 1)
      {
        id v10 = [v3 start];
        uint64_t v11 = [v13 textRangeFromPosition:v7 toPosition:v10];

        uint64_t v3 = (void *)v11;
      }
    }
  }
  [(UIResponder *)self _deleteTextRange:v3];
  uint64_t v12 = [v13 inputDelegate];
  [v12 textDidChange:v13];
}

- (void)_deleteToEndOfLine
{
  id v13 = [(UIResponder *)self _selectableText];
  uint64_t v3 = [v13 selectedTextRange];
  int v4 = [v13 inputDelegate];
  [v4 textWillChange:v13];

  if ([v3 isEmpty])
  {
    int v5 = [v13 tokenizer];
    id v6 = [v3 end];
    id v7 = [v5 positionFromPosition:v6 toBoundary:4 inDirection:0];

    if (v7)
    {
      uint64_t v8 = [v3 end];
      uint64_t v9 = [v13 comparePosition:v7 toPosition:v8];

      if (v9 == 1)
      {
        id v10 = [v3 end];
        uint64_t v11 = [v13 textRangeFromPosition:v10 toPosition:v7];

        uint64_t v3 = (void *)v11;
      }
    }
  }
  [(UIResponder *)self _deleteTextRange:v3];
  uint64_t v12 = [v13 inputDelegate];
  [v12 textDidChange:v13];
}

- (void)_deleteToEndOfParagraph
{
  id v13 = [(UIResponder *)self _selectableText];
  uint64_t v3 = [v13 selectedTextRange];
  int v4 = [v13 inputDelegate];
  [v4 textWillChange:v13];

  if ([v3 isEmpty])
  {
    int v5 = [v13 tokenizer];
    id v6 = [v3 end];
    id v7 = [v5 positionFromPosition:v6 toBoundary:3 inDirection:0];

    if (v7)
    {
      uint64_t v8 = [v3 end];
      uint64_t v9 = [v13 comparePosition:v7 toPosition:v8];

      if (v9 == 1)
      {
        id v10 = [v3 end];
        uint64_t v11 = [v13 textRangeFromPosition:v10 toPosition:v7];

        uint64_t v3 = (void *)v11;
      }
    }
  }
  [(UIResponder *)self _deleteTextRange:v3];
  uint64_t v12 = [v13 inputDelegate];
  [v12 textDidChange:v13];
}

- (void)_deleteTextRange:(id)a3
{
  id v4 = a3;
  id v9 = [(UIResponder *)self _selectableText];
  int v5 = [v9 selectedTextRange];
  [v9 setSelectedTextRange:v4];

  id v6 = [v9 selectedTextRange];
  char v7 = [v6 isEmpty];

  if ((v7 & 1) == 0)
  {
    if (objc_opt_respondsToSelector())
    {
      id v8 = v9;
      if ([v8 keyboardInputShouldDelete:v8]) {
        [v8 deleteBackward];
      }
      else {
        [v8 setSelectedTextRange:v5];
      }
    }
    else
    {
      [v9 deleteBackward];
    }
  }
}

- (void)_deleteBackwardAndNotify:(BOOL)a3
{
  id v3 = [(UIResponder *)self _keyInput];
  [v3 deleteBackward];
}

- (void)_deleteForwardAndNotify:(BOOL)a3
{
  id v14 = [(UIResponder *)self _selectableText];
  id v4 = [v14 selectedTextRange];
  int v5 = [v14 inputDelegate];
  [v5 textWillChange:v14];

  if ([v4 isEmpty])
  {
    id v6 = [v14 tokenizer];
    char v7 = [v4 end];
    id v8 = [v6 positionFromPosition:v7 toBoundary:0 inDirection:0];

    if (v8)
    {
      id v9 = [v4 end];
      uint64_t v10 = [v14 comparePosition:v8 toPosition:v9];

      if (v10 == 1)
      {
        uint64_t v11 = [v4 end];
        uint64_t v12 = [v14 textRangeFromPosition:v11 toPosition:v8];

        id v4 = (void *)v12;
      }
    }
  }
  [(UIResponder *)self _deleteTextRange:v4];
  id v13 = [v14 inputDelegate];
  [v13 textDidChange:v14];
}

- (void)_transpose
{
  id v19 = [(UIResponder *)self _selectableText];
  double v2 = [v19 selectedTextRange];
  if ([v2 isEmpty])
  {
    id v3 = [v19 inputDelegate];
    [v3 textWillChange:v19];

    id v4 = [v19 tokenizer];
    int v5 = [v2 start];
    id v6 = [v4 positionFromPosition:v5 toBoundary:0 inDirection:1];

    char v7 = [v19 tokenizer];
    id v8 = [v2 end];
    id v9 = [v7 positionFromPosition:v8 toBoundary:0 inDirection:0];

    if (v6 && v9)
    {
      uint64_t v10 = [v2 start];
      uint64_t v11 = [v19 textRangeFromPosition:v6 toPosition:v10];

      uint64_t v12 = [v2 end];
      id v13 = [v19 textRangeFromPosition:v12 toPosition:v9];

      if (v11 && v13)
      {
        id v14 = [v19 textInRange:v11];
        uint64_t v15 = [v19 textInRange:v13];
        int v16 = [v15 stringByAppendingString:v14];
        id v17 = [v19 textRangeFromPosition:v6 toPosition:v9];
        if (v17) {
          [v19 replaceRange:v17 withText:v16];
        }
      }
    }
    id v18 = [v19 inputDelegate];
    [v18 textDidChange:v19];
  }
}

- (void)_replaceCurrentWordWithText:(id)a3
{
  id v8 = a3;
  id v4 = [(UIResponder *)self _selectableText];
  int v5 = [v4 selectedTextRange];
  id v6 = [v5 start];
  char v7 = [(UIResponder *)self _rangeOfEnclosingWord:v6];

  if (v7) {
    [v4 replaceRange:v7 withText:v8];
  }
}

- (void)_replaceDocumentWithText:(id)a3
{
  id v7 = a3;
  id v4 = [(UIResponder *)self _selectableText];
  int v5 = [(UIResponder *)self _fullRange];
  id v6 = v5;
  if (v5)
  {
    if (([v5 isEmpty] & 1) == 0) {
      [v4 replaceRange:v6 withText:&stru_1ED0E84C0];
    }
    [v4 insertText:v7];
  }
}

- (void)_scrollRectToVisible:(CGRect)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = [(UIResponder *)self _selectableText];
  id v9 = [v11 textInputView];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v10 = [v9 performSelector:sel__enclosingScrollerIncludingSelf];
    objc_msgSend(v10, "convertRect:fromView:", v9, x, y, width, height);
    objc_msgSend(v10, "scrollRectToVisible:animated:", v4);
  }
}

- (id)_normalizedStringForRangeComparison:(id)a3
{
  id v3 = [a3 _stringByReplacingCharacter:160 withCharacter:32];
  BOOL v4 = [v3 _stringByReplacingCharacter:8217 withCharacter:39];

  int v5 = [v4 _stringByReplacingCharacter:8216 withCharacter:39];

  return v5;
}

- (id)_rangeOfText:(id)a3 endingAtPosition:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(UIResponder *)self _selectableText];
  if (![v6 length])
  {
    id v11 = [v8 textRangeFromPosition:v7 toPosition:v7];
    goto LABEL_30;
  }
  id v9 = [v8 _rangeOfEnclosingWord:v7];
  if (v9)
  {
    uint64_t v10 = [v8 textInRange:v9];
  }
  else
  {
    uint64_t v10 = 0;
  }
  if (![v10 isEqualToString:v6])
  {
    id v13 = objc_msgSend(v8, "positionFromPosition:offset:", v7, -objc_msgSend(v6, "length"));
    if (!v13)
    {
      id v13 = [v8 beginningOfDocument];
    }
    id v14 = [v8 textRangeFromPosition:v13 toPosition:v7];

    if (v14)
    {
      uint64_t v15 = [v8 textInRange:v14];

      unint64_t v16 = [v15 length];
      if (v16 <= [v6 length])
      {
        id v12 = v14;
        uint64_t v10 = v15;
LABEL_25:
        id v21 = [(UIResponder *)self _normalizedStringForRangeComparison:v10];
        uint64_t v22 = [(UIResponder *)self _normalizedStringForRangeComparison:v6];
        if ([v21 isEqualToString:v22]) {
          id v11 = v12;
        }
        else {
          id v11 = 0;
        }

        goto LABEL_29;
      }
      unsigned int v17 = 0;
      while (1)
      {
        id v18 = v13;
        id v13 = [v8 positionFromPosition:v13 offset:1];

        if (!v13) {
          break;
        }
        if ([v8 comparePosition:v13 toPosition:v7] != -1)
        {

          break;
        }
        id v12 = [v8 textRangeFromPosition:v13 toPosition:v7];

        if (!v12) {
          goto LABEL_24;
        }
        uint64_t v10 = [v8 textInRange:v12];

        unint64_t v19 = [v10 length];
        if (v19 > [v6 length])
        {
          id v14 = v12;
          uint64_t v15 = v10;
          if (v17++ < 9) {
            continue;
          }
        }
        goto LABEL_25;
      }

      id v13 = 0;
    }
    else
    {
      uint64_t v15 = v10;
    }
LABEL_24:

    id v12 = 0;
    uint64_t v10 = 0;
    goto LABEL_25;
  }
  id v12 = v9;
  id v11 = v12;
LABEL_29:

LABEL_30:
  return v11;
}

- (id)_rangeOfTextUnit:(int64_t)a3 enclosingPosition:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v7 = [(UIResponder *)self _selectableText];
    id v8 = [v7 tokenizer];
    id v9 = [v8 rangeEnclosingPosition:v6 withGranularity:a3 inDirection:0];

    if (!v9)
    {
      uint64_t v10 = [v7 tokenizer];
      id v9 = [v10 rangeEnclosingPosition:v6 withGranularity:a3 inDirection:1];
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)_rangeOfEnclosingWord:(id)a3
{
  return [(UIResponder *)self _rangeOfTextUnit:1 enclosingPosition:a3];
}

- (id)_rangeOfLineEnclosingPosition:(id)a3
{
  return [(UIResponder *)self _rangeOfTextUnit:4 enclosingPosition:a3];
}

- (id)_rangeOfSentenceEnclosingPosition:(id)a3
{
  return [(UIResponder *)self _rangeOfTextUnit:2 enclosingPosition:a3];
}

- (id)_rangeOfParagraphEnclosingPosition:(id)a3
{
  return [(UIResponder *)self _rangeOfTextUnit:3 enclosingPosition:a3];
}

- (id)_fullRange
{
  double v2 = [(UIResponder *)self _selectableText];
  id v3 = [v2 beginningOfDocument];
  BOOL v4 = [v2 endOfDocument];
  int v5 = [v2 textRangeFromPosition:v3 toPosition:v4];

  return v5;
}

- (id)_rangeSpanningTextUnit:(int64_t)a3 andPosition:(id)a4
{
  id v6 = a4;
  if (!v6)
  {
    id v8 = 0;
    goto LABEL_17;
  }
  id v7 = [(UIResponder *)self _selectableText];
  id v8 = [(UIResponder *)self _rangeOfTextUnit:a3 enclosingPosition:v6];
  if (!v8)
  {
    id v9 = [v7 tokenizer];
    uint64_t v10 = 1;
    uint64_t v11 = [v9 positionFromPosition:v6 toBoundary:a3 inDirection:1];

    id v12 = (void *)v11;
    if (!v11)
    {
      id v13 = [v7 tokenizer];
      id v12 = [v13 positionFromPosition:v6 toBoundary:a3 inDirection:0];

      if (!v12)
      {
        uint64_t v15 = 0;
        goto LABEL_11;
      }
      uint64_t v10 = 0;
    }
    id v14 = [v7 tokenizer];
    uint64_t v15 = [v14 rangeEnclosingPosition:v12 withGranularity:a3 inDirection:v10];

    if (v11)
    {
      unint64_t v16 = [v15 start];
      if (v16)
      {
        unsigned int v17 = v7;
        id v18 = v16;
        id v19 = v6;
LABEL_13:
        id v8 = [v17 textRangeFromPosition:v18 toPosition:v19];
LABEL_15:

        goto LABEL_16;
      }
      goto LABEL_14;
    }
LABEL_11:
    unint64_t v16 = [v15 end];
    if (v16)
    {
      unsigned int v17 = v7;
      id v18 = v6;
      id v19 = v16;
      goto LABEL_13;
    }
LABEL_14:
    id v8 = 0;
    goto LABEL_15;
  }
LABEL_16:

LABEL_17:
  return v8;
}

- (BOOL)_range:(id)a3 containsRange:(id)a4
{
  id v6 = a4;
  NSUInteger v7 = [(UIResponder *)self _nsrangeForTextRange:a3];
  NSUInteger v9 = v8;
  NSUInteger v10 = [(UIResponder *)self _nsrangeForTextRange:v6];
  NSUInteger v12 = v11;

  if (!v12) {
    return v10 >= v7 && v10 - v7 < v9;
  }
  v17.NSUInteger location = v7;
  v17.NSUInteger length = v9;
  v18.NSUInteger location = v10;
  v18.NSUInteger length = v12;
  NSRange v13 = NSIntersectionRange(v17, v18);
  return v10 == v13.location && v12 == v13.length;
}

- (BOOL)_range:(id)a3 intersectsRange:(id)a4
{
  id v6 = a4;
  NSUInteger v7 = [(UIResponder *)self _nsrangeForTextRange:a3];
  NSUInteger v9 = v8;
  NSUInteger v10 = [(UIResponder *)self _nsrangeForTextRange:v6];
  NSUInteger v12 = v11;

  v14.NSUInteger location = v7;
  v14.NSUInteger length = v9;
  v15.NSUInteger location = v10;
  v15.NSUInteger length = v12;
  return NSIntersectionRange(v14, v15).length != 0;
}

- (BOOL)_range:(id)a3 isEqualToRange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  NSUInteger v8 = v7;
  if (v6 == v7)
  {
    BOOL v9 = 1;
  }
  else
  {
    BOOL v9 = 0;
    if (v6 && v7)
    {
      NSUInteger v10 = self;
      NSUInteger v11 = [v6 start];
      NSUInteger v12 = [v8 start];
      uint64_t v13 = [(UIResponder *)v10 comparePosition:v11 toPosition:v12];

      NSRange v14 = [v6 end];
      NSRange v15 = [v8 end];
      uint64_t v16 = v13 | [(UIResponder *)v10 comparePosition:v14 toPosition:v15];

      BOOL v9 = v16 == 0;
    }
  }

  return v9;
}

- (id)_findBoundaryPositionClosestToPosition:(id)a3 withGranularity:(int64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  if (a4 == 5)
  {
    id v8 = [(UIResponder *)self _findDocumentBoundaryFromPosition:v6];
  }
  else if (a4 == 1)
  {
    id v8 = [(UIResponder *)self _findPleasingWordBoundaryFromPosition:v6];
  }
  else
  {
    id v8 = v6;
  }
  BOOL v9 = v8;

  return v9;
}

- (id)_findPleasingWordBoundaryFromPosition:(id)a3
{
  id v4 = a3;
  int v5 = [(UIResponder *)self _selectableText];
  id v6 = [v5 tokenizer];
  if ([v6 isPosition:v4 atBoundary:4 inDirection:0]) {
    goto LABEL_2;
  }
  int v9 = [v6 isPosition:v4 withinTextUnit:1 inDirection:0];
  NSUInteger v10 = [v5 tokenizer];
  NSUInteger v11 = v10;
  if (v9)
  {
    NSUInteger v12 = [v10 rangeEnclosingPosition:v4 withGranularity:1 inDirection:0];

    uint64_t v13 = [v12 start];
    int v14 = [v5 offsetFromPosition:v13 toPosition:v4];

    if (v14 > 1) {
      [v12 end];
    }
    else {
    id v8 = [v12 start];
    }

    goto LABEL_12;
  }
  int v15 = [v10 isPosition:v4 atBoundary:1 inDirection:1];

  if (v15)
  {
LABEL_2:
    id v7 = v4;
LABEL_3:
    id v8 = v7;
    goto LABEL_12;
  }
  uint64_t v16 = [v5 tokenizer];
  id v8 = [v16 positionFromPosition:v4 toBoundary:1 inDirection:0];

  if (!v8)
  {
    id v7 = [v5 endOfDocument];
    goto LABEL_3;
  }
LABEL_12:

  return v8;
}

- (id)_findDocumentBoundaryFromPosition:(id)a3
{
  id v4 = a3;
  int v5 = [(UIResponder *)self _selectableText];
  id v6 = [v5 beginningOfDocument];
  id v7 = [v5 endOfDocument];
  uint64_t v8 = [v5 offsetFromPosition:v6 toPosition:v4];
  uint64_t v9 = [v5 offsetFromPosition:v4 toPosition:v7];

  if (v8 <= v9) {
    NSUInteger v10 = v6;
  }
  else {
    NSUInteger v10 = v7;
  }
  id v11 = v10;

  return v11;
}

- (id)_underlineRectsByDocumentLineForSelectionRange:(id)a3
{
  id v4 = a3;
  int v5 = [(UIResponder *)self _selectableText];
  id v6 = [v5 tokenizer];
  id v7 = [v4 start];
  uint64_t v8 = [v6 rangeEnclosingPosition:v7 withGranularity:4 inDirection:0];

  uint64_t v9 = [v4 end];
  NSUInteger v10 = [v6 rangeEnclosingPosition:v9 withGranularity:4 inDirection:0];

  if (!v8
    || !v10
    || ([v8 isEmpty] & 1) != 0
    || ([v10 isEmpty] & 1) != 0
    || ([v8 isEqual:v10] & 1) != 0)
  {
    goto LABEL_9;
  }
  id v11 = [v8 start];
  NSUInteger v12 = [v10 start];
  if ([v11 isEqual:v12])
  {

LABEL_9:
    int v15 = [v5 selectionRectsForRange:v4];
    goto LABEL_10;
  }
  uint64_t v13 = [v8 end];
  int v14 = [v10 end];
  int v28 = [v13 isEqual:v14];

  if (v28) {
    goto LABEL_9;
  }
  int v15 = objc_opt_new();
  NSRange v17 = [v4 start];
  NSRange v18 = [v8 end];
  uint64_t v19 = [v5 textRangeFromPosition:v17 toPosition:v18];

  v29 = (void *)v19;
  [(UIResponder *)self _updateSelectedRects:v15 byTrimmingWhitespaceInRange:v19 inDocument:v5];
  char v20 = [v8 end];
  id v21 = [v6 rangeEnclosingPosition:v20 withGranularity:4 inDirection:0];

  if (v21)
  {
    while (([v21 isEqual:v10] & 1) == 0)
    {
      uint64_t v22 = [v21 end];
      CGFloat v23 = [v6 rangeEnclosingPosition:v22 withGranularity:4 inDirection:0];

      if ([v23 isEqual:v21])
      {

        break;
      }
      id v24 = [v5 selectionRectsForRange:v21];
      [v15 addObjectsFromArray:v24];

      id v21 = v23;
      if (!v23) {
        break;
      }
    }
  }
  uint64_t v25 = [v10 start];
  uint64_t v26 = [v4 end];
  uint64_t v27 = [v5 textRangeFromPosition:v25 toPosition:v26];

  if (v27) {
    [(UIResponder *)self _updateSelectedRects:v15 byTrimmingWhitespaceInRange:v27 inDocument:v5];
  }

LABEL_10:
  return v15;
}

- (void)_updateSelectedRects:(id)a3 byTrimmingWhitespaceInRange:(id)a4 inDocument:(id)a5
{
  id v18 = a3;
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = v8;
  if (v7)
  {
    NSUInteger v10 = [v8 textInRange:v7];
    id v11 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    NSUInteger v12 = [v10 stringByTrimmingCharactersInSet:v11];

    if ([v12 length])
    {
      uint64_t v13 = [v7 start];
      int v14 = objc_msgSend(v9, "positionFromPosition:offset:", v13, objc_msgSend(v12, "length"));

      int v15 = [v7 start];
      uint64_t v16 = [v9 textRangeFromPosition:v15 toPosition:v14];

      if (v16)
      {
        NSRange v17 = [v9 selectionRectsForRange:v16];
        [v18 addObjectsFromArray:v17];
      }
    }
  }
}

- (id)_rangeOfSmartSelectionIncludingRange:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    int v5 = [(UIResponder *)self _selectableText];
    id v6 = v4;
    id v7 = [v5 tokenizer];
    id v8 = [v6 start];
    uint64_t v9 = [v7 positionFromPosition:v8 toBoundary:2 inDirection:1];
    NSUInteger v10 = v9;
    id v58 = v4;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [v5 beginningOfDocument];
    }
    NSUInteger v12 = v11;

    uint64_t v13 = [v6 start];
    uint64_t v14 = [v5 offsetFromPosition:v12 toPosition:v13];

    if (v14 >= 65)
    {
      int v15 = [v6 start];
      uint64_t v16 = [v5 positionFromPosition:v15 offset:-64];

      NSUInteger v12 = [v7 positionFromPosition:v16 toBoundary:1 inDirection:0];

      if (!v12)
      {
        NSRange v17 = [v6 start];
        id v18 = [v5 positionFromPosition:v17 offset:-64];

        NSUInteger v12 = [v7 positionFromPosition:v18 toBoundary:0 inDirection:0];
      }
      uint64_t v19 = [v6 start];
      uint64_t v20 = [v5 comparePosition:v12 toPosition:v19];

      if (v20 == 1)
      {
        id v21 = [v6 start];
        uint64_t v22 = [v7 positionFromPosition:v21 toBoundary:0 inDirection:1];
        CGFloat v23 = v22;
        if (v22)
        {
          id v24 = v22;
        }
        else
        {
          id v24 = [v6 start];
        }
        id v25 = v24;

        NSUInteger v12 = v25;
      }
    }
    uint64_t v26 = [v6 end];
    uint64_t v27 = [v7 positionFromPosition:v26 toBoundary:2 inDirection:0];
    int v28 = v27;
    if (v27)
    {
      id v29 = v27;
    }
    else
    {
      id v29 = [v5 endOfDocument];
    }
    id v30 = v29;

    id v31 = [v6 end];
    uint64_t v32 = [v5 offsetFromPosition:v31 toPosition:v30];

    if (v32 >= 65)
    {
      uint64_t v33 = [v6 end];
      v34 = [v5 positionFromPosition:v33 offset:64];

      id v30 = [v7 positionFromPosition:v34 toBoundary:1 inDirection:1];

      if (!v30)
      {
        v35 = [v6 end];
        v36 = [v5 positionFromPosition:v35 offset:64];

        id v30 = [v7 positionFromPosition:v36 toBoundary:0 inDirection:1];
      }
      uint64_t v37 = [v6 end];
      uint64_t v38 = [v5 comparePosition:v37 toPosition:v30];

      if (v38 == 1)
      {
        __int16 v39 = [v6 end];
        id v40 = [v7 positionFromPosition:v39 toBoundary:0 inDirection:0];
        uint64_t v41 = v40;
        if (v40)
        {
          id v42 = v40;
        }
        else
        {
          id v42 = [v6 end];
        }
        id v43 = v42;

        id v30 = v43;
      }
    }
    double v57 = v7;
    double v59 = [v5 textRangeFromPosition:v12 toPosition:v30];
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (uint64_t v44 = [v5 keyboardType], v45 = 420, v44 != 3) && v44 != 10 && v44 != 120)
    {
      uint64_t v45 = 428;
    }
    double v46 = [v5 beginningOfDocument];
    double v56 = v12;
    int v47 = [v5 offsetFromPosition:v46 toPosition:v12];

    uint64_t v48 = [(UIResponder *)self _nsrangeForTextRange:v6];
    uint64_t v50 = v49;
    v51 = [v5 textInRange:v59];
    uint64_t v61 = 0;
    v62 = &v61;
    uint64_t v63 = 0x3010000000;
    id v64 = &unk_186D7DBA7;
    long long v65 = xmmword_186B93450;
    v52 = +[UIKeyboardImpl activeInstance];
    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = __74__UIResponder_UITextInput_Internal___rangeOfSmartSelectionIncludingRange___block_invoke;
    v60[3] = &unk_1E52FEBF0;
    v60[4] = &v61;
    objc_msgSend(v52, "smartSelectionForTextInDocument:inRange:options:completion:", v51, v48 - v47, v50, v45, v60);

    uint64_t v53 = v62[4];
    if (v53 != 0x7FFFFFFFFFFFFFFFLL && v62[5])
    {
      v62[4] = v53 + v47;
      uint64_t v54 = -[UIResponder _textRangeFromNSRange:](self, "_textRangeFromNSRange:");

      id v6 = (id)v54;
    }
    _Block_object_dispose(&v61, 8);

    id v4 = v58;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

uint64_t __74__UIResponder_UITextInput_Internal___rangeOfSmartSelectionIncludingRange___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(*(void *)(result + 32) + 8);
  *(void *)(v3 + 32) = a2;
  *(void *)(v3 + 40) = a3;
  return result;
}

- (id)_clampedpositionFromPosition:(id)a3 offset:(int)a4
{
  id v6 = a3;
  id v7 = v6;
  if (!a4)
  {
    id v10 = v6;
    goto LABEL_10;
  }
  id v8 = [(UIResponder *)self _selectableText];
  uint64_t v9 = v8;
  if (a4 < 1)
  {
    id v10 = [v8 positionFromPosition:v7 offset:a4];
    if (!v10)
    {
      uint64_t v11 = [v9 beginningOfDocument];
      goto LABEL_8;
    }
  }
  else
  {
    id v10 = [v8 positionFromPosition:v7 offset:a4];
    if (!v10)
    {
      uint64_t v11 = [v9 endOfDocument];
LABEL_8:
      id v10 = (id)v11;
    }
  }

LABEL_10:
  return v10;
}

- (id)_rangeFromCurrentRangeWithDelta:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  int v5 = [(UIResponder *)self _selectableText];
  id v6 = [v5 selectedTextRange];
  id v7 = v6;
  if (location | length)
  {
    NSUInteger v9 = length + location;
    id v10 = [v6 start];
    uint64_t v11 = [v7 end];
    if (location)
    {
      uint64_t v12 = [v5 positionFromPosition:v10 offset:location];

      id v10 = (void *)v12;
      if (!v12)
      {
        if ((location & 0x8000000000000000) != 0) {
          [v5 beginningOfDocument];
        }
        else {
        id v10 = [v5 endOfDocument];
        }
      }
    }
    if (v9)
    {
      uint64_t v13 = [v5 positionFromPosition:v11 offset:v9];

      uint64_t v11 = (void *)v13;
      if (!v13)
      {
        if ((v9 & 0x8000000000000000) != 0)
        {
          id v14 = v10;
        }
        else
        {
          id v14 = [v5 endOfDocument];
        }
        uint64_t v11 = v14;
      }
    }
    uint64_t v15 = [v5 textRangeFromPosition:v10 toPosition:v11];
    uint64_t v16 = (void *)v15;
    if (v15) {
      NSRange v17 = (void *)v15;
    }
    else {
      NSRange v17 = v7;
    }
    id v8 = v17;
  }
  else
  {
    id v8 = v6;
  }

  return v8;
}

- (id)_textColorForCaretSelection
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = [(UIResponder *)self textColorForCaretSelection];
  }
  else
  {
    id v4 = [(UIResponder *)self _selectableText];
    if (objc_opt_respondsToSelector())
    {
      int v5 = [v4 selectedTextRange];
      id v6 = [v5 end];

      if (v6)
      {
        id v7 = [v4 endOfDocument];
        if (v7 && [v4 comparePosition:v7 toPosition:v6] == -1)
        {
          id v8 = v7;

          id v6 = v8;
        }
        NSUInteger v9 = [v4 textStylingAtPosition:v6 inDirection:0];
      }
      else
      {
        NSUInteger v9 = 0;
      }
      if (dyld_program_sdk_at_least()) {
        id v10 = *(__CFString **)off_1E52D2048;
      }
      else {
        id v10 = @"UITextInputTextColorKey";
      }
      uint64_t v3 = [v9 objectForKey:v10];
    }
    else
    {
      uint64_t v3 = 0;
    }
  }
  return v3;
}

- (id)_fontForCaretSelection
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = [(UIResponder *)self fontForCaretSelection];
  }
  else
  {
    id v4 = [(UIResponder *)self _selectableText];
    if (objc_opt_respondsToSelector())
    {
      int v5 = [v4 selectedTextRange];
      id v6 = [v5 end];

      if (v6)
      {
        id v7 = [v4 endOfDocument];
        if (v7 && [v4 comparePosition:v7 toPosition:v6] == -1)
        {
          id v8 = v7;

          id v6 = v8;
        }
        NSUInteger v9 = [v4 textStylingAtPosition:v6 inDirection:0];
      }
      else
      {
        NSUInteger v9 = 0;
      }
      if (dyld_program_sdk_at_least()) {
        id v10 = *(__CFString **)off_1E52D2040;
      }
      else {
        id v10 = @"UITextInputTextFontKey";
      }
      uint64_t v3 = [v9 objectForKey:v10];
    }
    else
    {
      uint64_t v3 = 0;
    }
  }
  return v3;
}

- (void)_updateSelectionWithTextRange:(id)a3 withAffinityDownstream:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(UIResponder *)self _selectableText];
  [v7 _setSelectedTextRange:v6 withAffinityDownstream:v4];
}

- (id)_setSelectionRangeWithHistory:(id)a3
{
  id v4 = a3;
  int v5 = [(UIResponder *)self _selectableText];
  id v6 = [v4 cursor];

  if (!v6) {
    goto LABEL_19;
  }
  if ([v4 anchor] == 1)
  {
    id v7 = [v4 cursor];
LABEL_5:
    [v4 setEnd:v7];
    goto LABEL_6;
  }
  int v8 = [v4 anchor];
  id v7 = [v4 cursor];
  [v4 setStart:v7];
  if (v8 != 2) {
    goto LABEL_5;
  }
LABEL_6:

  NSUInteger v9 = [v4 start];
  id v10 = [v4 end];
  uint64_t v11 = [v5 comparePosition:v9 toPosition:v10];

  if (v11 >= 1)
  {
    if ([v4 anchor] == 1) {
      uint64_t v12 = 2;
    }
    else {
      uint64_t v12 = 1;
    }
    [v4 setAnchor:v12];
  }
  uint64_t v13 = [v4 start];
  id v14 = [v4 end];
  uint64_t v15 = [v5 textRangeFromPosition:v13 toPosition:v14];

  -[UIResponder _updateSelectionWithTextRange:withAffinityDownstream:](self, "_updateSelectionWithTextRange:withAffinityDownstream:", v15, [v4 affinityDownstream]);
  if ([v4 anchor])
  {
    if ([v4 anchor] == 1) {
      [v5 _lastRectForRange:v15];
    }
    else {
      [v5 firstRectForRange:v15];
    }
    objc_msgSend(v5, "_scrollRectToVisible:animated:", 0);
  }
  else if (objc_opt_respondsToSelector())
  {
    uint64_t v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v17 = *MEMORY[0x1E4FB6E78];
    id v18 = [(UIResponder *)self webView];
    [v16 postNotificationName:v17 object:v18];
  }
LABEL_19:

  return v4;
}

- (id)_setHistory:(id)a3 withExtending:(BOOL)a4 withAnchor:(int)a5 withAffinityDownstream:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = *(void *)&a5;
  BOOL v8 = a4;
  id v10 = (UITextInputArrowKeyHistory *)a3;
  if (v10)
  {
    uint64_t v11 = v10;
    if (!v8) {
      [(UITextInputArrowKeyHistory *)v10 setAnchor:0];
    }
  }
  else
  {
    uint64_t v11 = objc_alloc_init(UITextInputArrowKeyHistory);
  }
  uint64_t v12 = [(UIResponder *)self _selectableText];
  uint64_t v13 = [v12 selectedTextRange];
  id v14 = [v13 start];
  [(UITextInputArrowKeyHistory *)v11 setStart:v14];

  uint64_t v15 = [v12 selectedTextRange];
  uint64_t v16 = [v15 end];
  [(UITextInputArrowKeyHistory *)v11 setEnd:v16];

  int v17 = [(UITextInputArrowKeyHistory *)v11 anchor];
  id v18 = [v12 selectedTextRange];
  uint64_t v19 = v18;
  if (v7 == 2)
  {
    if (v17 == 1)
    {
LABEL_7:
      uint64_t v20 = [v18 end];
      goto LABEL_10;
    }
  }
  else if (v17 != 2)
  {
    goto LABEL_7;
  }
  uint64_t v20 = [v18 start];
LABEL_10:
  id v21 = (void *)v20;
  [(UITextInputArrowKeyHistory *)v11 setCursor:v20];

  uint64_t v22 = [(UITextInputArrowKeyHistory *)v11 startPosition];

  if (!v22)
  {
    CGFloat v23 = [(UITextInputArrowKeyHistory *)v11 cursor];
    [(UITextInputArrowKeyHistory *)v11 setStartPosition:v23];

    if (v8) {
      goto LABEL_12;
    }
LABEL_16:
    uint64_t v7 = 0;
LABEL_17:
    [(UITextInputArrowKeyHistory *)v11 setAnchor:v7];
    goto LABEL_18;
  }
  if (!v8) {
    goto LABEL_16;
  }
LABEL_12:
  if (![(UITextInputArrowKeyHistory *)v11 anchor]
    || [(UIResponder *)self _isEmptySelection])
  {
    goto LABEL_17;
  }
LABEL_18:
  [(UITextInputArrowKeyHistory *)v11 setAffinityDownstream:v6];

  return v11;
}

- (id)_moveToStartOfWord:(BOOL)a3 withHistory:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = [(UIResponder *)self _selectableText];
  BOOL v8 = [v7 selectedTextRange];

  if (v8)
  {
    NSUInteger v9 = [(UIResponder *)self _setHistory:v6 withExtending:v4 withAnchor:2 withAffinityDownstream:1];

    [v9 setAmount:0];
    id v10 = [v7 tokenizer];
    uint64_t v11 = [v9 cursor];
    char v12 = [v10 isPosition:v11 withinTextUnit:1 inDirection:1];

    if (v12)
    {
LABEL_7:
      uint64_t v22 = [v7 tokenizer];
      CGFloat v23 = [v9 cursor];
      id v24 = [v22 positionFromPosition:v23 toBoundary:1 inDirection:1];
      [v9 setCursor:v24];

      id v25 = [v9 cursor];
      [v9 setStartPosition:v25];

      uint64_t v26 = [(UIResponder *)self _setSelectionRangeWithHistory:v9];
      goto LABEL_9;
    }
    uint64_t v13 = [v7 tokenizer];
    id v14 = [v9 cursor];
    uint64_t v15 = [v13 positionFromPosition:v14 toBoundary:1 inDirection:1];

    if (v15)
    {
LABEL_4:
      uint64_t v16 = [v7 tokenizer];
      int v17 = [v9 cursor];
      char v18 = [v16 isPosition:v17 withinTextUnit:1 inDirection:1];

      if ((v18 & 1) == 0)
      {
        uint64_t v19 = [v7 tokenizer];
        uint64_t v20 = [v9 cursor];
        id v21 = [v19 positionFromPosition:v20 toBoundary:1 inDirection:1];
        [v9 setCursor:v21];
      }
      goto LABEL_7;
    }
    uint64_t v15 = [v9 cursor];
    int v28 = 0;
    while (1)
    {
      id v29 = [v7 beginningOfDocument];
      uint64_t v30 = [v7 comparePosition:v29 toPosition:v15];

      if (!v30) {
        break;
      }
      if (v28 && ![v7 comparePosition:v28 toPosition:v15])
      {
        v35 = [v7 beginningOfDocument];
        [v9 setCursor:v35];

        v36 = [v9 cursor];
        [v9 setStartPosition:v36];

        break;
      }
      id v31 = v15;

      uint64_t v32 = [v7 tokenizer];
      uint64_t v15 = [v32 positionFromPosition:v31 toBoundary:3 inDirection:1];

      uint64_t v33 = [v7 tokenizer];
      char v34 = [v33 isPosition:v15 atBoundary:3 inDirection:1];

      int v28 = v31;
      if ((v34 & 1) == 0)
      {
        [v9 setCursor:v15];

        goto LABEL_4;
      }
    }
    uint64_t v26 = [(UIResponder *)self _setSelectionRangeWithHistory:v9];
  }
  else
  {
    uint64_t v26 = 0;
    NSUInteger v9 = v6;
  }
LABEL_9:

  return v26;
}

- (id)_moveToEndOfWord:(BOOL)a3 withHistory:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = [(UIResponder *)self _selectableText];
  BOOL v8 = [v7 selectedTextRange];

  if (v8)
  {
    NSUInteger v9 = [(UIResponder *)self _setHistory:v6 withExtending:v4 withAnchor:1 withAffinityDownstream:1];

    [v9 setAmount:0];
    id v10 = [v7 tokenizer];
    uint64_t v11 = [v9 cursor];
    char v12 = [v10 isPosition:v11 withinTextUnit:1 inDirection:0];

    if ((v12 & 1) == 0)
    {
      uint64_t v13 = [v7 tokenizer];
      id v14 = [v9 cursor];
      uint64_t v15 = [v13 positionFromPosition:v14 toBoundary:1 inDirection:0];

      if (v15) {
        [v9 setCursor:v15];
      }
    }
    uint64_t v16 = [v7 tokenizer];
    int v17 = [v9 cursor];
    char v18 = [v16 positionFromPosition:v17 toBoundary:1 inDirection:0];
    [v9 setCursor:v18];

    uint64_t v19 = [v9 cursor];

    if (!v19)
    {
      uint64_t v20 = [v7 endOfDocument];
      [v9 setCursor:v20];
    }
    id v21 = [v9 cursor];
    [v9 setStartPosition:v21];

    uint64_t v22 = [(UIResponder *)self _setSelectionRangeWithHistory:v9];
  }
  else
  {
    uint64_t v22 = 0;
    NSUInteger v9 = v6;
  }

  return v22;
}

- (id)_moveToStartOfLine:(BOOL)a3 withHistory:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = [(UIResponder *)self _selectableText];
  BOOL v8 = [v7 selectedTextRange];

  if (!v8)
  {
    int v17 = 0;
    id v10 = v6;
    goto LABEL_11;
  }
  char v9 = [v6 affinityDownstream];
  id v10 = [(UIResponder *)self _setHistory:v6 withExtending:v4 withAnchor:2 withAffinityDownstream:1];

  [v10 setAmount:0];
  uint64_t v11 = [v7 tokenizer];
  char v12 = [v7 selectedTextRange];
  uint64_t v13 = [v12 end];
  if (([v11 isPosition:v13 atBoundary:3 inDirection:1] & 1) == 0)
  {
    if (v9)
    {
      id v14 = [v7 tokenizer];
      uint64_t v15 = [v10 cursor];
      char v16 = [v14 isPosition:v15 atBoundary:4 inDirection:1];

      if (v16) {
        goto LABEL_10;
      }
    }
    else
    {
    }
    uint64_t v11 = [v7 tokenizer];
    char v12 = [v10 cursor];
    uint64_t v13 = [v11 positionFromPosition:v12 toBoundary:4 inDirection:1];
    [v10 setCursor:v13];
  }

LABEL_10:
  char v18 = [v10 cursor];
  [v10 setStartPosition:v18];

  int v17 = [(UIResponder *)self _setSelectionRangeWithHistory:v10];
LABEL_11:

  return v17;
}

- (id)_moveToEndOfLine:(BOOL)a3 withHistory:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = [(UIResponder *)self _selectableText];
  BOOL v8 = [v7 selectedTextRange];

  if (!v8)
  {
    id v14 = 0;
    id v10 = v6;
    goto LABEL_10;
  }
  int v9 = [v6 affinityDownstream];
  id v10 = [(UIResponder *)self _setHistory:v6 withExtending:v4 withAnchor:1 withAffinityDownstream:0];

  [v10 setAmount:0];
  uint64_t v11 = [v7 tokenizer];
  char v12 = [v7 selectedTextRange];
  uint64_t v13 = [v12 end];
  if ([v11 isPosition:v13 atBoundary:3 inDirection:0]) {
    goto LABEL_8;
  }
  if (v9)
  {

LABEL_7:
    uint64_t v11 = [v7 tokenizer];
    char v12 = [v10 cursor];
    uint64_t v13 = [v11 positionFromPosition:v12 toBoundary:4 inDirection:0];
    [v10 setCursor:v13];
LABEL_8:

    goto LABEL_9;
  }
  uint64_t v15 = [v7 tokenizer];
  char v16 = [v10 cursor];
  char v17 = [v15 isPosition:v16 atBoundary:4 inDirection:0];

  if ((v17 & 1) == 0) {
    goto LABEL_7;
  }
LABEL_9:
  char v18 = [v10 cursor];
  [v10 setStartPosition:v18];

  id v14 = [(UIResponder *)self _setSelectionRangeWithHistory:v10];
LABEL_10:

  return v14;
}

- (id)_moveToStartOfParagraph:(BOOL)a3 withHistory:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = [(UIResponder *)self _selectableText];
  BOOL v8 = [v7 selectedTextRange];

  if (v8)
  {
    int v9 = [(UIResponder *)self _setHistory:v6 withExtending:v4 withAnchor:2 withAffinityDownstream:1];

    [v9 setAmount:0];
    id v10 = [v7 tokenizer];
    uint64_t v11 = [v9 cursor];
    int v12 = [v10 isPosition:v11 atBoundary:3 inDirection:1];

    if (v12)
    {
      uint64_t v13 = [v9 cursor];
      id v14 = [v10 positionFromPosition:v13 toBoundary:0 inDirection:1];

      if (v14) {
        [v9 setCursor:v14];
      }
    }
    uint64_t v15 = [v9 cursor];
    char v16 = [v10 positionFromPosition:v15 toBoundary:3 inDirection:1];
    [v9 setCursor:v16];

    char v17 = [v9 cursor];
    [v9 setStartPosition:v17];

    char v18 = [(UIResponder *)self _setSelectionRangeWithHistory:v9];
  }
  else
  {
    char v18 = 0;
    int v9 = v6;
  }

  return v18;
}

- (id)_moveToEndOfParagraph:(BOOL)a3 withHistory:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = [(UIResponder *)self _selectableText];
  BOOL v8 = [v7 selectedTextRange];

  if (v8)
  {
    int v9 = [(UIResponder *)self _setHistory:v6 withExtending:v4 withAnchor:1 withAffinityDownstream:0];

    [v9 setAmount:0];
    id v10 = [v7 tokenizer];
    uint64_t v11 = [v9 cursor];
    int v12 = [v10 isPosition:v11 atBoundary:3 inDirection:0];

    if (v12)
    {
      uint64_t v13 = [v9 cursor];
      id v14 = [v10 positionFromPosition:v13 toBoundary:0 inDirection:0];

      if (v14) {
        [v9 setCursor:v14];
      }
    }
    uint64_t v15 = [v9 cursor];
    char v16 = [v10 positionFromPosition:v15 toBoundary:3 inDirection:0];
    [v9 setCursor:v16];

    char v17 = [v9 cursor];
    [v9 setStartPosition:v17];

    char v18 = [(UIResponder *)self _setSelectionRangeWithHistory:v9];
  }
  else
  {
    char v18 = 0;
    int v9 = v6;
  }

  return v18;
}

- (id)_moveToStartOfDocument:(BOOL)a3 withHistory:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = [(UIResponder *)self _selectableText];
  BOOL v8 = [v7 selectedTextRange];

  if (v8)
  {
    int v9 = [(UIResponder *)self _setHistory:v6 withExtending:v4 withAnchor:2 withAffinityDownstream:1];

    [v9 setAmount:0];
    id v10 = [v7 beginningOfDocument];
    [v9 setCursor:v10];

    uint64_t v11 = [v9 cursor];
    [v9 setStartPosition:v11];

    int v12 = [(UIResponder *)self _setSelectionRangeWithHistory:v9];
    id v6 = v9;
  }
  else
  {
    int v12 = 0;
  }

  return v12;
}

- (id)_moveToEndOfDocument:(BOOL)a3 withHistory:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = [(UIResponder *)self _selectableText];
  BOOL v8 = [v7 selectedTextRange];

  if (v8)
  {
    int v9 = [(UIResponder *)self _setHistory:v6 withExtending:v4 withAnchor:1 withAffinityDownstream:0];

    [v9 setAmount:0];
    id v10 = [v7 endOfDocument];
    [v9 setCursor:v10];

    uint64_t v11 = [v9 cursor];
    [v9 setStartPosition:v11];

    int v12 = [v7 tokenizer];
    uint64_t v13 = [v9 cursor];
    int v14 = [v12 isPosition:v13 atBoundary:4 inDirection:3];

    if (v14) {
      [v9 setAffinityDownstream:1];
    }
    uint64_t v15 = [(UIResponder *)self _setSelectionRangeWithHistory:v9];
  }
  else
  {
    uint64_t v15 = 0;
    int v9 = v6;
  }

  return v15;
}

- (id)_moveUp:(BOOL)a3 withHistory:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = [(UIResponder *)self _selectableText];
  BOOL v8 = [v7 selectedTextRange];

  if (v8)
  {
    if (v6) {
      uint64_t v9 = [v6 affinityDownstream];
    }
    else {
      uint64_t v9 = [(UIResponder *)self _selectionAffinity] == 0;
    }
    uint64_t v11 = [(UIResponder *)self _setHistory:v6 withExtending:v4 withAnchor:2 withAffinityDownstream:v9];

    objc_msgSend(v11, "setAmount:", objc_msgSend(v11, "amount") + 1);
    int v12 = [v11 cursor];
    uint64_t v13 = [v7 beginningOfDocument];
    uint64_t v14 = [v7 comparePosition:v12 toPosition:v13];

    if (v14)
    {
      uint64_t v15 = [v11 startPosition];
      if ([v11 amount] > 0) {
        uint64_t v16 = 4;
      }
      else {
        uint64_t v16 = 5;
      }
      uint64_t v17 = [v11 amount];
      if (v17 >= 0) {
        uint64_t v18 = v17;
      }
      else {
        uint64_t v18 = -v17;
      }
      uint64_t v19 = objc_msgSend(v7, "_positionFromPosition:inDirection:offset:withAffinityDownstream:", v15, v16, v18, objc_msgSend(v11, "affinityDownstream"));

      uint64_t v20 = [v11 cursor];
      uint64_t v21 = [v7 comparePosition:v20 toPosition:v19];

      if (v21)
      {
        [v11 setCursor:v19];
      }
      else
      {
        uint64_t v22 = [v7 beginningOfDocument];
        [v11 setCursor:v22];

        objc_msgSend(v11, "setAmount:", objc_msgSend(v11, "amount") - 1);
      }
    }
    else
    {
      objc_msgSend(v11, "setAmount:", objc_msgSend(v11, "amount") - 1);
    }
    id v10 = [(UIResponder *)self _setSelectionRangeWithHistory:v11];
  }
  else
  {
    id v10 = 0;
    uint64_t v11 = v6;
  }

  return v10;
}

- (id)_moveDown:(BOOL)a3 withHistory:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = [(UIResponder *)self _selectableText];
  BOOL v8 = [v7 selectedTextRange];

  if (v8)
  {
    if (v6) {
      uint64_t v9 = [v6 affinityDownstream];
    }
    else {
      uint64_t v9 = [(UIResponder *)self _selectionAffinity] == 0;
    }
    uint64_t v11 = [(UIResponder *)self _setHistory:v6 withExtending:v4 withAnchor:1 withAffinityDownstream:v9];

    objc_msgSend(v11, "setAmount:", objc_msgSend(v11, "amount") - 1);
    int v12 = [v11 cursor];
    uint64_t v13 = [v7 endOfDocument];
    uint64_t v14 = [v7 comparePosition:v12 toPosition:v13];

    if (v14)
    {
      uint64_t v15 = [v11 startPosition];
      if ([v11 amount] > 0) {
        uint64_t v16 = 4;
      }
      else {
        uint64_t v16 = 5;
      }
      uint64_t v17 = [v11 amount];
      if (v17 >= 0) {
        uint64_t v18 = v17;
      }
      else {
        uint64_t v18 = -v17;
      }
      uint64_t v19 = objc_msgSend(v7, "_positionFromPosition:inDirection:offset:withAffinityDownstream:", v15, v16, v18, objc_msgSend(v11, "affinityDownstream"));

      uint64_t v20 = [v11 cursor];
      uint64_t v21 = [v7 comparePosition:v20 toPosition:v19];

      if (v21)
      {
        [v11 setCursor:v19];
      }
      else
      {
        uint64_t v22 = [v7 endOfDocument];
        [v11 setCursor:v22];

        objc_msgSend(v11, "setAmount:", objc_msgSend(v11, "amount") + 1);
      }
    }
    else
    {
      objc_msgSend(v11, "setAmount:", objc_msgSend(v11, "amount") + 1);
    }
    id v10 = [(UIResponder *)self _setSelectionRangeWithHistory:v11];
  }
  else
  {
    id v10 = 0;
    uint64_t v11 = v6;
  }

  return v10;
}

- (id)_moveLeft:(BOOL)a3 withHistory:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = [(UIResponder *)self _selectableText];
  BOOL v8 = [v7 selectedTextRange];

  if (v8)
  {
    uint64_t v9 = [(UIResponder *)self _setHistory:v6 withExtending:v4 withAnchor:2 withAffinityDownstream:1];

    [v9 setAmount:0];
    id v10 = [v7 selectedTextRange];
    char v11 = [v10 isEmpty];

    if ((v11 & 1) != 0 || v4)
    {
      int v12 = [v9 cursor];
      uint64_t v13 = [v7 positionFromPosition:v12 inDirection:3 offset:1];
      [v9 setCursor:v13];
    }
    uint64_t v14 = [v9 cursor];
    [v9 setStartPosition:v14];

    uint64_t v15 = [(UIResponder *)self _setSelectionRangeWithHistory:v9];
  }
  else
  {
    uint64_t v15 = 0;
    uint64_t v9 = v6;
  }

  return v15;
}

- (id)_moveRight:(BOOL)a3 withHistory:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = [(UIResponder *)self _selectableText];
  BOOL v8 = [v7 selectedTextRange];

  if (v8)
  {
    uint64_t v9 = [(UIResponder *)self _setHistory:v6 withExtending:v4 withAnchor:1 withAffinityDownstream:1];

    [v9 setAmount:0];
    id v10 = [v7 selectedTextRange];
    char v11 = [v10 isEmpty];

    if ((v11 & 1) != 0 || v4)
    {
      int v12 = [v9 cursor];
      uint64_t v13 = [v7 positionFromPosition:v12 inDirection:2 offset:1];
      [v9 setCursor:v13];
    }
    uint64_t v14 = [v9 cursor];
    [v9 setStartPosition:v14];

    uint64_t v15 = [(UIResponder *)self _setSelectionRangeWithHistory:v9];
  }
  else
  {
    uint64_t v15 = 0;
    uint64_t v9 = v6;
  }

  return v15;
}

- (id)_positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5 withAffinityDownstream:(BOOL)a6
{
  id v9 = a3;
  id v10 = [(UIResponder *)self _selectableText];
  char v11 = [v10 positionFromPosition:v9 inDirection:a4 offset:a5];

  return v11;
}

- (void)_setSelectedTextRange:(id)a3 withAffinityDownstream:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if (objc_opt_respondsToSelector())
  {
    [(UIResponder *)self setSelectedTextRange:v7 withAffinityDownstream:v4];
  }
  else
  {
    id v6 = [(UIResponder *)self _selectableText];
    [v6 setSelectedTextRange:v7];
  }
}

- (int64_t)_selectionAffinity
{
  double v2 = [(UIResponder *)self _selectableText];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    BOOL v4 = [v2 tokenizer];
    int v5 = [v2 selectedTextRange];
    id v6 = [v5 start];
    if ([v4 isPosition:v6 atBoundary:3 inDirection:1])
    {
    }
    else
    {
      id v7 = [v2 tokenizer];
      BOOL v8 = [v2 selectedTextRange];
      id v9 = [v8 end];
      char v10 = [v7 isPosition:v9 atBoundary:4 inDirection:2];

      if (v10)
      {
        int64_t v3 = 1;
        goto LABEL_8;
      }
    }
    int64_t v3 = 0;
    goto LABEL_8;
  }
  int64_t v3 = [v2 selectionAffinity];
LABEL_8:

  return v3;
}

- (void)_setGestureRecognizers
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (objc_opt_respondsToSelector())
  {
    [(UIResponder *)self _setInternalGestureRecognizers];
  }
  else
  {
    int64_t v3 = +[UIKeyboardImpl activeInstance];
    BOOL v4 = [v3 markedTextOverlay];
    [v4 removeFromSuperview];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    int v5 = objc_msgSend(v4, "interactions", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          [v4 removeInteraction:*(void *)(*((void *)&v16 + 1) + 8 * i)];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }

    char v10 = [(UIResponder *)self _selectableText];
    char v11 = [v10 interactionAssistant];
    int v12 = v11;
    if (v11)
    {
      [v11 setGestureRecognizers];
    }
    else if ([v10 _hasMarkedText] {
           && [v3 hasEditableMarkedText])
    }
    {
      uint64_t v13 = [v10 markedTextRange];
      [v10 firstRectForRange:v13];
      objc_msgSend(v4, "setFrame:");

      uint64_t v14 = [v10 textInputView];
      [v14 addSubview:v4];

      uint64_t v15 = [[UITextPhraseBoundaryInteraction alloc] initWithTextInput:v10];
      [v4 addInteraction:v15];
    }
  }
}

- (void)_setMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v7 = (objc_class *)MEMORY[0x1E4F28B18];
  id v8 = a3;
  id v9 = (id)[[v7 alloc] initWithString:v8];

  -[UIResponder _setAttributedMarkedText:selectedRange:](self, "_setAttributedMarkedText:selectedRange:", v9, location, length);
}

- (void)_setAttributedMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  id v26 = [(UIResponder *)self _selectableText];
  int v8 = [(UIResponder *)self _hasMarkedText];
  if (objc_opt_respondsToSelector())
  {
    objc_msgSend(v26, "setAttributedMarkedText:selectedRange:", v7, location, length);
  }
  else
  {
    uint64_t v9 = [v7 string];

    objc_msgSend(v26, "setMarkedText:selectedRange:", v9, location, length);
    id v7 = (id)v9;
  }

  int v10 = [(UIResponder *)self _hasMarkedText];
  if (v8 != v10)
  {
    if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled])
    {
      uint64_t v11 = [v26 _selectionDisplayInteraction];
      int v12 = v26;
      uint64_t v13 = (void *)v11;
    }
    else
    {
      uint64_t v13 = 0;
      int v12 = v26;
    }
    [v12 _setGestureRecognizers];
    long long v18 = [(UIResponder *)self _textSelectingContainer];
    uint64_t v19 = [v18 interactionAssistant];
    if (v19)
    {
      uint64_t v20 = (void *)v19;
      uint64_t v21 = [(UIResponder *)self _textSelectingContainer];
      uint64_t v22 = [v21 interactionAssistant];
      CGFloat v23 = [v22 externalInteractions];

      if (v23)
      {
        id v24 = [(UIResponder *)self _textSelectingContainer];
        id v25 = [v24 interactionAssistant];
        [v25 deactivateSelection];

        [v26 _setSelectionDisplayInteraction:v13];
      }
    }
    else
    {
    }
    goto LABEL_15;
  }
  if (v10)
  {
    uint64_t v14 = [(UIResponder *)self _textSelectingContainer];
    uint64_t v15 = [v14 interactionAssistant];

    if (!v15)
    {
      long long v16 = +[UIKeyboardImpl activeInstance];
      uint64_t v13 = [v16 markedTextOverlay];

      long long v17 = [v26 markedTextRange];
      [v26 firstRectForRange:v17];
      objc_msgSend(v13, "setFrame:");

LABEL_15:
    }
  }
}

- (void)_unmarkText
{
  id v13 = [(UIResponder *)self _selectableText];
  BOOL v3 = [(UIResponder *)self _hasMarkedText];
  [v13 unmarkText];
  if (v3)
  {
    if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled])
    {
      BOOL v4 = [v13 _selectionDisplayInteraction];
    }
    else
    {
      BOOL v4 = 0;
    }
    [v13 _setGestureRecognizers];
    int v5 = [(UIResponder *)self _textSelectingContainer];
    uint64_t v6 = [v5 interactionAssistant];
    if (v6)
    {
      id v7 = (void *)v6;
      int v8 = [(UIResponder *)self _textSelectingContainer];
      uint64_t v9 = [v8 interactionAssistant];
      int v10 = [v9 externalInteractions];

      if (v10)
      {
        uint64_t v11 = [(UIResponder *)self _textSelectingContainer];
        int v12 = [v11 interactionAssistant];
        [v12 deactivateSelection];

        [v13 _setSelectionDisplayInteraction:v4];
      }
    }
    else
    {
    }
  }
}

- (BOOL)_shouldPerformUICalloutBarButtonReplaceAction:(SEL)a3 forText:(id)a4 checkAutocorrection:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  int v8 = v7;
  if (sel_promptForReplace_ != a3 && sel__promptForReplace_ != a3)
  {
    if (sel__transliterateChinese_ == a3)
    {
      char v14 = UIKeyboardEnabledInputModesAllowChineseTransliterationForText(v7);
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  if (v5
    && (+[UIKeyboardImpl activeInstance],
        int v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = [v10 autocorrectSpellingEnabled],
        v10,
        !v11)
    || ([v8 _containsCJScriptsOnly] & 1) != 0)
  {
LABEL_11:
    char v14 = 0;
    goto LABEL_13;
  }
  int v12 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  id v13 = [v8 componentsSeparatedByCharactersInSet:v12];

  char v14 = (unint64_t)[v13 count] < 8;
LABEL_13:

  return v14;
}

- (int64_t)selectionAffinity
{
  return 0;
}

- (CGRect)_lastRectForRange:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(UIResponder *)self _selectableText];
  uint64_t v6 = [v5 tokenizer];
  id v7 = [v4 end];
  int v8 = [v6 positionFromPosition:v7 toBoundary:4 inDirection:1];

  if (v8)
  {
    uint64_t v9 = [v4 start];
    if ([v5 comparePosition:v9 toPosition:v8] < 0)
    {
      int v10 = [v4 end];
      uint64_t v11 = [v5 comparePosition:v8 toPosition:v10];

      if (v11 < 0)
      {
        id v24 = [v4 end];
        id v25 = [v5 textRangeFromPosition:v8 toPosition:v24];
        [v5 firstRectForRange:v25];
        double v13 = v26;
        double v15 = v27;
        double v17 = v28;
        double v19 = v29;

        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  [v5 firstRectForRange:v4];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
LABEL_6:

  double v20 = v13;
  double v21 = v15;
  double v22 = v17;
  double v23 = v19;
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

- (id)textInputView
{
  double v2 = [(UIResponder *)self nextResponder];
  BOOL v3 = [v2 textInputView];

  return v3;
}

- (id)_selectionDisplayInteraction
{
  double v2 = objc_getAssociatedObject(self, &_UITextInputImplicitSelectionDisplayInteractionKey);
  BOOL v3 = [v2 weakObject];

  return v3;
}

- (void)_setSelectionDisplayInteraction:(id)a3
{
  id v4 = +[_UITextInputImplicitObjectWrapper wrapperForObject:a3];
  objc_setAssociatedObject(self, &_UITextInputImplicitSelectionDisplayInteractionKey, v4, (void *)1);
}

- (UITextInteractionAssistant)interactionAssistant
{
  return (UITextInteractionAssistant *)objc_getAssociatedObject(self, &_UITextInputImplicitInteractionAssistantKey);
}

- (void)__createInteractionAssistantIfNecessaryWithMode:(int64_t)a3
{
  BOOL v5 = objc_getAssociatedObject(self, &_UITextInputImplicitInteractionAssistantKey);
  if (!v5)
  {
    if ([(UIResponder *)self conformsToProtocol:&unk_1ED42F658])
    {
      uint64_t v6 = [[UITextInteractionAssistant alloc] initWithView:self textInteractionMode:a3];
      objc_setAssociatedObject(self, &_UITextInputImplicitInteractionAssistantKey, v6, (void *)1);
      BOOL v5 = v6;
    }
    else
    {
      BOOL v5 = 0;
    }
  }
  id v7 = v5;
  if (([v5 isValid] & 1) == 0) {
    [v7 activate];
  }
}

- (void)__prepareInteractionAssistantIfNecessary
{
  double v2 = objc_getAssociatedObject(self, &_UITextInputImplicitInteractionAssistantKey);
  BOOL v3 = v2;
  if (v2)
  {
    BOOL v5 = v2;
    char v4 = [v2 isValid];
    BOOL v3 = v5;
    if ((v4 & 1) == 0)
    {
      [v5 activate];
      BOOL v3 = v5;
    }
  }
}

- (void)__tearDownInteractionAssistantIfNecessary
{
  objc_getAssociatedObject(self, &_UITextInputImplicitInteractionAssistantKey);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 invalidate];
}

- (id)__textInteractionFromAssistant
{
  id v2 = [(UIResponder *)self interactionAssistant];
  BOOL v3 = [v2 interactions];

  return v3;
}

- (BOOL)isEditable
{
  id v2 = [(UIResponder *)self __textInteractionFromAssistant];
  BOOL v3 = v2;
  if (v2) {
    BOOL v4 = [v2 textInteractionMode] != 1;
  }
  else {
    BOOL v4 = 1;
  }

  return v4;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
}

- (id)_nextKeyResponder
{
  return 0;
}

- (id)_previousKeyResponder
{
  return 0;
}

- (BOOL)_isRootForKeyResponderCycle
{
  return 0;
}

- (id)_textServicesResponderProxy
{
  id v2 = [(UIResponder *)self __textInteractionFromAssistant];
  BOOL v3 = [v2 interactionWithClass:objc_opt_class()];
  BOOL v4 = v3;
  if (v3)
  {
    BOOL v5 = [v3 responder];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (_WORD)_storedActivityItemsConfiguration
{
  if (a1)
  {
    if ((a1[4] & 0x20) != 0)
    {
      objc_getAssociatedObject(a1, &_UIActivityItemsConfigurationKey);
      a1 = (_WORD *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a1 = 0;
    }
    uint64_t v1 = vars8;
  }
  return a1;
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
  id v6 = sender;
  if (sel_paste_ == action)
  {
    uint64_t v18 = +[UIResponder instanceMethodForSelector:sel_canPasteItemProviders_];
    if (v18 == [(UIResponder *)self methodForSelector:sel_canPasteItemProviders_])
    {
      uint64_t v23 = [(UIResponder *)self _effectivePasteConfiguration];
      if (v23)
      {
        id v24 = (void *)v23;
        id v25 = +[UIPasteboard generalPasteboard];
        double v26 = [v25 itemProviders];
        char v27 = _UICanPasteItemProviders(v24, v26);

        if (v27) {
          goto LABEL_42;
        }
      }
    }
    else
    {
      double v19 = +[UIPasteboard generalPasteboard];
      double v20 = [v19 itemProviders];
      BOOL v21 = [(UIResponder *)self canPasteItemProviders:v20];

      if (v21) {
        goto LABEL_42;
      }
    }
  }
  if ([(UIResponder *)self _handleActivityItemsConfigurationCanPerformAction:action sender:v6])
  {
LABEL_42:
    BOOL v17 = 1;
    goto LABEL_48;
  }
  if (sel__define_ == action
    || sel_define_ == action
    || sel__lookup_ == action
    || sel_lookup_ == action
    || sel__translate_ == action
    || sel__share_ == action
    || sel_share_ == action
    || sel__addShortcut_ == action
    || sel_addShortcut_ == action)
  {
    double v15 = [(UIResponder *)self _textServicesResponderProxy];
    double v16 = v15;
    BOOL v17 = v15 && ([v15 canPerformAction:action withSender:v6] & 1) != 0;
  }
  else
  {
    if (sel_captureTextFromCamera_ == action)
    {
      if (!+[UIKeyboardCameraSession isEnabled])
      {
        BOOL v17 = 0;
        goto LABEL_48;
      }
      char v22 = [(UIResponder *)self _requiresKeyboardWhenFirstResponder];
    }
    else if (sel_showWritingTools_ == action)
    {
      char v22 = [(UIResponder *)self _shouldDisplayWritingToolsCalloutBarItem];
    }
    else
    {
      char v22 = objc_opt_respondsToSelector();
    }
    BOOL v17 = v22;
  }
LABEL_48:

  return v17;
}

- (id)_targetCanPerformBlock:(id)a3
{
  BOOL v4 = (unsigned int (**)(id, UIResponder *))a3;
  if (v4[2](v4, self))
  {
    BOOL v5 = self;
  }
  else if ([(UIResponder *)self __isKindOfUIResponder])
  {
    id v6 = [(UIResponder *)self nextResponder];
    if (objc_opt_respondsToSelector())
    {
      BOOL v5 = [v6 _targetCanPerformBlock:v4];
    }
    else
    {
      BOOL v5 = 0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)targetForAction:(SEL)action withSender:(id)sender
{
  return _UIResponderTargetForActionWithTestBlock(self, action, sender, &__block_literal_global_34);
}

- (void)validateCommand:(UICommand *)command
{
  int v8 = command;
  if ([(UICommand *)v8 action] == sel_undo_)
  {
    BOOL v4 = [(UIResponder *)self _undoManagerForValidatingUndoRedoCommands];
    BOOL v5 = [v4 undoMenuItemTitle];
    if (v5)
    {
LABEL_9:
      [(UICommand *)v8 setTitle:v5];
LABEL_12:

      goto LABEL_13;
    }
    id v6 = @"Undo";
LABEL_11:
    id v7 = _UINSLocalizedStringWithDefaultValue(v6, v6);
    [(UICommand *)v8 setTitle:v7];

    goto LABEL_12;
  }
  if ([(UICommand *)v8 action] == sel_redo_)
  {
    BOOL v4 = [(UIResponder *)self _undoManagerForValidatingUndoRedoCommands];
    BOOL v5 = [v4 redoMenuItemTitle];
    if (v5) {
      goto LABEL_9;
    }
    id v6 = @"Redo";
    goto LABEL_11;
  }
  if ([(UICommand *)v8 action] == sel_captureTextFromCamera_
    && [(UIResponder *)self _conformsToProtocolUIKeyInput])
  {
    BOOL v4 = +[UIAction _textFromCameraTitleForResponder:self];
    [(UICommand *)v8 setTitle:v4];
LABEL_13:
  }
}

- (void)_define:(id)a3
{
  id v4 = a3;
  id v5 = [(UIResponder *)self _textServicesResponderProxy];
  [v5 _define:v4];
}

- (void)_lookup:(id)a3
{
  id v4 = a3;
  id v5 = [(UIResponder *)self _textServicesResponderProxy];
  [v5 _lookup:v4];
}

- (void)_translate:(id)a3
{
  id v4 = a3;
  id v5 = [(UIResponder *)self _textServicesResponderProxy];
  [v5 _translate:v4];
}

- (void)_share:(id)a3
{
  id v5 = a3;
  if (!-[UIResponder _handleActivityItemsConfigurationShare:](self, "_handleActivityItemsConfigurationShare:"))
  {
    id v4 = [(UIResponder *)self _textServicesResponderProxy];
    [v4 _share:v5];
  }
}

- (void)_addShortcut:(id)a3
{
  id v4 = a3;
  id v5 = [(UIResponder *)self _textServicesResponderProxy];
  [v5 _addShortcut:v4];
}

- (void)doesNotRecognizeSelector:(SEL)a3
{
  if (dyld_program_sdk_at_least()
    && sel_paste_ == a3
    && ([(UIResponder *)self _effectivePasteConfiguration],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    if (objc_opt_respondsToSelector())
    {
      int64_t v6 = [(UIResponder *)self _dataOwnerForPaste];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __40__UIResponder_doesNotRecognizeSelector___block_invoke;
      v8[3] = &unk_1E52D9F70;
      v8[4] = self;
      +[UIPasteboard _performAsDataOwner:v6 block:v8];
    }
  }
  else if (![(UIResponder *)self _handleActivityItemsConfigurationDoesNotHandleSelector:a3])
  {
    v7.receiver = self;
    v7.super_class = (Class)UIResponder;
    [(UIResponder *)&v7 doesNotRecognizeSelector:a3];
  }
}

void __40__UIResponder_doesNotRecognizeSelector___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v3 = +[UIPasteboard generalPasteboard];
  id v2 = [v3 itemProviders];
  [v1 pasteItemProviders:v2];
}

+ (BOOL)_callBecomeFirstResponder:(id)a3 withIntent:(unint64_t)a4
{
  id v7 = a3;
  if (pthread_main_np() != 1)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:a1 file:@"UIResponder.m" lineNumber:834 description:@"Call must be made on main thread"];
  }
  uint64_t v8 = __changeIntent;
  __changeIntent = a4;
  char v9 = [v7 becomeFirstResponder];
  __changeIntent = v8;

  return v9;
}

+ (BOOL)_callResignFirstResponder:(id)a3 withIntent:(unint64_t)a4
{
  id v7 = a3;
  if (pthread_main_np() != 1)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:a1 file:@"UIResponder.m" lineNumber:847 description:@"Call must be made on main thread"];
  }
  uint64_t v8 = __changeIntent;
  __changeIntent = a4;
  char v9 = [v7 resignFirstResponder];
  __changeIntent = v8;

  return v9;
}

- (id)_currentOverrideClient
{
  if (*(_WORD *)&self->_responderFlags)
  {
    id v2 = objc_getAssociatedObject(self, &_MergedGlobals_1199);
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

- (id)_currentOverrideHost
{
  if ((*(_WORD *)&self->_responderFlags & 2) != 0)
  {
    id v2 = objc_getAssociatedObject(self, &unk_1EB262469);
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

- (id)_overrideHost
{
  if ((*(_WORD *)&self->_responderFlags & 2) != 0)
  {
    id v3 = objc_getAssociatedObject(self, &unk_1EB262469);
  }
  else
  {
    id v3 = +[_UIResponder_Override_Host hostForResponder:self];
    objc_setAssociatedObject(self, &unk_1EB262469, v3, (void *)1);
    *(_WORD *)&self->_responderFlags |= 2u;
  }
  return v3;
}

- (void)_clearOverrideHost
{
  if ((*(_WORD *)&self->_responderFlags & 2) != 0)
  {
    id v3 = (void *)MEMORY[0x18C108260]();
    objc_setAssociatedObject(self, &unk_1EB262469, 0, (void *)1);
    *(_WORD *)&self->_responderFlags &= ~2u;
  }
}

- (id)_captureOverrideState
{
  v8[2] = *MEMORY[0x1E4F143B8];
  id v2 = [(UIResponder *)self _currentOverrideClient];
  id v3 = [v2 target];
  uint64_t v4 = [v2 types];
  if (v3)
  {
    v8[0] = v3;
    id v5 = [NSNumber numberWithInteger:v4];
    v8[1] = v5;
    int64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (void)_restoreOverrideState:(id)a3
{
  id v4 = a3;
  if ((*(_WORD *)&self->_responderFlags & 1) == 0)
  {
    id v9 = v4;
    id v5 = v4;
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v5 count] == 2)
      {
        int64_t v6 = [v5 objectAtIndexedSubscript:0];
        id v7 = [v5 objectAtIndexedSubscript:1];
        uint64_t v8 = +[_UIResponder_Override overrideForResponder:withTarget:forType:](_UIResponder_Override, "overrideForResponder:withTarget:forType:", self, v6, (int)[v7 intValue]);

        objc_setAssociatedObject(self, &_MergedGlobals_1199, v8, (void *)1);
        *(_WORD *)&self->_responderFlags |= 1u;
      }
    }

    id v4 = v9;
  }
}

- (void)_preserveResponderOverridesWhilePerforming:(id)a3
{
  id v9 = (void (**)(void))a3;
  id v4 = (void *)MEMORY[0x18C108260]();
  id v5 = [(UIResponder *)self _currentOverrideClient];
  int64_t v6 = [v5 target];
  uint64_t v7 = [v5 types];

  v9[2]();
  if (v6 && (*(_WORD *)&self->_responderFlags & 1) == 0)
  {
    uint64_t v8 = +[_UIResponder_Override overrideForResponder:self withTarget:v6 forType:v7];
    objc_setAssociatedObject(self, &_MergedGlobals_1199, v8, (void *)1);
    *(_WORD *)&self->_responderFlags |= 1u;
  }
}

- (void)_overrideInputViewNextResponderWithResponder:(id)a3
{
}

- (void)_overrideInputAccessoryViewNextResponderWithResponder:(id)a3
{
}

- (void)_overrideNextResponderWithResponder:(id)a3 forType:(int64_t)a4
{
  id v8 = a3;
  int64_t v6 = (void *)MEMORY[0x18C108260]();
  if (![(UIResponder *)self _containsResponder:v8])
  {
    if (v8)
    {
      uint64_t v7 = +[_UIResponder_Override overrideForResponder:self withTarget:v8 forType:a4];
    }
    else
    {
      uint64_t v7 = 0;
    }
    objc_setAssociatedObject(self, &_MergedGlobals_1199, v7, (void *)1);
    *(_WORD *)&self->_unsigned int responderFlags = *(_WORD *)&self->_responderFlags & 0xFFFE | (v7 != 0);
  }
}

uint64_t __46__UIResponder__clearRestorableResponderStatus__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _clearPreservedInputViewsWithRestorableResponder:*(void *)(a1 + 32)];
}

- (id)recentsAccessoryView
{
  id v2 = [(UIResponder *)self nextResponder];
  id v3 = [v2 recentsAccessoryView];

  return v3;
}

- (id)_keyCommandForEvent:(id)a3
{
  return [(UIResponder *)self _keyCommandForEvent:a3 target:0];
}

- (id)_keyCommandForEvent:(id)a3 target:(id *)a4
{
  id v6 = a3;
  if ([v6 type] == 4)
  {
    id v7 = v6;
    v47[0] = 0;
    v47[1] = v47;
    v47[2] = 0x2020000000;
    v47[3] = 0;
    id v8 = objc_alloc_init(_UIMenuLeafValidation);
    uint64_t v41 = 0;
    id v42 = &v41;
    uint64_t v43 = 0x3032000000;
    uint64_t v44 = __Block_byref_object_copy__165;
    uint64_t v45 = __Block_byref_object_dispose__165;
    id v46 = 0;
    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x3032000000;
    uint64_t v38 = __Block_byref_object_copy__165;
    __int16 v39 = __Block_byref_object_dispose__165;
    id v40 = 0;
    uint64_t v29 = 0;
    uint64_t v30 = &v29;
    uint64_t v31 = 0x3032000000;
    uint64_t v32 = __Block_byref_object_copy__165;
    uint64_t v33 = __Block_byref_object_dispose__165;
    id v34 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __42__UIResponder__keyCommandForEvent_target___block_invoke;
    aBlock[3] = &unk_1E53032D8;
    double v28 = &v29;
    id v9 = v8;
    char v27 = v9;
    int v10 = _Block_copy(aBlock);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __42__UIResponder__keyCommandForEvent_target___block_invoke_2;
    v20[3] = &unk_1E5303300;
    id v11 = v7;
    id v21 = v11;
    uint64_t v23 = &v41;
    id v12 = v10;
    id v22 = v12;
    id v24 = &v35;
    id v25 = v47;
    [(UIResponder *)self _enumerateKeyCommandsInChainWithOptions:0 usingBlock:v20];
    if (!v36[5])
    {
      double v13 = (void *)v42[5];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __42__UIResponder__keyCommandForEvent_target___block_invoke_3;
      v16[3] = &unk_1E5303328;
      id v18 = v12;
      id v17 = v11;
      double v19 = &v35;
      [v13 enumerateObjectsUsingBlock:v16];
    }
    if (a4) {
      *a4 = (id) v30[5];
    }
    id v14 = (id)v36[5];

    _Block_object_dispose(&v29, 8);
    _Block_object_dispose(&v35, 8);

    _Block_object_dispose(&v41, 8);
    _Block_object_dispose(v47, 8);
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

BOOL __42__UIResponder__keyCommandForEvent_target___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)UIApp;
  id v4 = a2;
  uint64_t v5 = objc_msgSend(v3, "_unswizzledTargetInChainForAction:sender:", objc_msgSend(v4, "action"), v4);
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  id v8 = [*(id *)(a1 + 32) validatedCommandForTarget:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) command:v4 alternate:0 sender:0];

  if (v8) {
    BOOL v9 = ([v8 attributes] & 1) == 0;
  }
  else {
    BOOL v9 = 0;
  }

  return v9;
}

void __42__UIResponder__keyCommandForEvent_target___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v19 = a2;
  uint64_t v6 = [v19 action];
  id v7 = v19;
  if (v6 || (uint64_t v8 = [v19 _buttonType], v7 = v19, v8))
  {
    uint64_t v9 = [*(id *)(a1 + 32) _matchFidelityForKeyCommand:v7];
    uint64_t v10 = v9;
    if (v9)
    {
      if (v9 == 3)
      {
        uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
        id v12 = *(void **)(v11 + 40);
        *(void *)(v11 + 40) = 0;

        if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))())
        {
          [v19 _setTriggeringEvent:*(void *)(a1 + 32)];
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
          *a3 = 1;
        }
      }
      else
      {
        uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
        if (v9 <= v13)
        {
          if (v9 == v13) {
            [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v19];
          }
        }
        else
        {
          uint64_t v14 = [MEMORY[0x1E4F1CA48] arrayWithObject:v19];
          uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
          double v16 = *(void **)(v15 + 40);
          *(void *)(v15 + 40) = v14;
        }
      }
    }
    uint64_t v17 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v18 = *(void *)(v17 + 24);
    if (v18 <= v10) {
      uint64_t v18 = v10;
    }
    *(void *)(v17 + 24) = v18;
    id v7 = v19;
  }
}

void __42__UIResponder__keyCommandForEvent_target___block_invoke_3(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ((*(unsigned int (**)(void))(a1[5] + 16))())
  {
    [v7 _setTriggeringEvent:a1[4]];
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)_enumerateKeyCommandsInChainWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  char v4 = a3;
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  uint64_t v63 = (void (**)(id, void, uint8_t *))a4;
  if (qword_1EB262478 != -1) {
    dispatch_once(&qword_1EB262478, &__block_literal_global_454);
  }
  uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
  id v7 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
  if (([(id)UIApp _disableLayoutAwareShortcuts] & 1) == 0
    && dyld_program_sdk_at_least()
    && (+[UIDevice currentDevice],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 _isHardwareKeyboardAvailable],
        v8,
        v9))
  {
    uint64_t v10 = [(id)UIApp _hardwareKeyboard:0];
  }
  else
  {
    uint64_t v10 = 0;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__UIResponder__enumerateKeyCommandsInChainWithOptions_usingBlock___block_invoke_2;
  aBlock[3] = &unk_1E5303350;
  id v59 = v7;
  id v96 = v59;
  uint64_t v98 = v10;
  BOOL v99 = (v4 & 8) != 0;
  id v61 = v6;
  id v97 = v61;
  uint64_t v11 = (void (**)(void *, void *, void *))_Block_copy(aBlock);
  id v12 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
  uint64_t v13 = self;
  char v64 = v4;
  v62 = v12;
  if (!v13)
  {
LABEL_35:
    if ((v4 & 0x20) == 0) {
      goto LABEL_61;
    }
    goto LABEL_40;
  }
  uint64_t v14 = v13;
  while (!objc_msgSend(v12, "containsObject:", v14, v59))
  {
    [v12 addObject:v14];
    if ((v4 & 1) != 0 && v14 == (void *)UIApp)
    {
      uint64_t v15 = [v14 keyCommands];
    }
    else
    {
      uint64_t v15 = [v14 _keyCommands];
    }
    long long v93 = 0u;
    long long v94 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    obuint64_t j = v15;
    uint64_t v16 = [obj countByEnumeratingWithState:&v91 objects:v106 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v92;
      uint64_t v65 = *(void *)v92;
      do
      {
        uint64_t v19 = 0;
        uint64_t v67 = v17;
        do
        {
          if (*(void *)v92 != v18) {
            objc_enumerationMutation(obj);
          }
          double v20 = *(void **)(*((void *)&v91 + 1) + 8 * v19);
          v11[2](v11, v20, v14);
          if ((v4 & 2) == 0)
          {
            long long v89 = 0u;
            long long v90 = 0u;
            long long v87 = 0u;
            long long v88 = 0u;
            id v21 = [v20 alternates];
            uint64_t v22 = [v21 countByEnumeratingWithState:&v87 objects:v105 count:16];
            if (v22)
            {
              uint64_t v23 = v22;
              uint64_t v24 = *(void *)v88;
              do
              {
                for (uint64_t i = 0; i != v23; ++i)
                {
                  if (*(void *)v88 != v24) {
                    objc_enumerationMutation(v21);
                  }
                  double v26 = [v20 _keyCommandUsingAlternate:*(void *)(*((void *)&v87 + 1) + 8 * i)];
                  v11[2](v11, v26, v14);
                }
                uint64_t v23 = [v21 countByEnumeratingWithState:&v87 objects:v105 count:16];
              }
              while (v23);
            }

            char v4 = v64;
            uint64_t v18 = v65;
            uint64_t v17 = v67;
          }
          ++v19;
        }
        while (v19 != v17);
        uint64_t v17 = [obj countByEnumeratingWithState:&v91 objects:v106 count:16];
      }
      while (v17);
    }

    if (byte_1EB262470) {
      uint64_t v27 = 2;
    }
    else {
      uint64_t v27 = 0;
    }
    uint64_t v28 = [v14 _nextResponderUsingTraversalStrategy:v27];

    uint64_t v14 = (void *)v28;
    id v12 = v62;
    if (!v28) {
      goto LABEL_35;
    }
  }
  uint64_t v29 = *(NSObject **)(__UILogGetCategoryCachedImpl("View", &qword_1EB262480) + 8);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v108 = v14;
    _os_log_impl(&dword_1853B0000, v29, OS_LOG_TYPE_ERROR, "Responder chain warning: %@ has already been seen in the chain; ending traversal. Please check your nextResponder overrides.",
      buf,
      0xCu);
  }

  if ((v4 & 0x20) != 0)
  {
LABEL_40:
    uint64_t v30 = +[UIKeyboardImpl activeInstance];
    uint64_t v31 = [v30 inputDelegateManager];
    uint64_t v32 = [v31 keyInputDelegate];

    if (v32)
    {
      if (qword_1EB262490 != -1) {
        dispatch_once(&qword_1EB262490, &__block_literal_global_170_1);
      }
      long long v85 = 0u;
      long long v86 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      id v33 = (id)qword_1EB262488;
      uint64_t v34 = [v33 countByEnumeratingWithState:&v83 objects:v104 count:16];
      if (v34)
      {
        uint64_t v35 = v34;
        uint64_t v36 = *(void *)v84;
        do
        {
          for (uint64_t j = 0; j != v35; ++j)
          {
            if (*(void *)v84 != v36) {
              objc_enumerationMutation(v33);
            }
            v11[2](v11, *(void **)(*((void *)&v83 + 1) + 8 * j), (void *)UIApp);
          }
          uint64_t v35 = [v33 countByEnumeratingWithState:&v83 objects:v104 count:16];
        }
        while (v35);
      }
    }
    if (qword_1EB2624A0 != -1) {
      dispatch_once(&qword_1EB2624A0, &__block_literal_global_199_0);
    }
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    id v38 = (id)qword_1EB262498;
    uint64_t v39 = [v38 countByEnumeratingWithState:&v79 objects:v103 count:16];
    if (v39)
    {
      uint64_t v40 = v39;
      uint64_t v41 = *(void *)v80;
      do
      {
        for (uint64_t k = 0; k != v40; ++k)
        {
          if (*(void *)v80 != v41) {
            objc_enumerationMutation(v38);
          }
          v11[2](v11, *(void **)(*((void *)&v79 + 1) + 8 * k), (void *)UIApp);
        }
        uint64_t v40 = [v38 countByEnumeratingWithState:&v79 objects:v103 count:16];
      }
      while (v40);
    }
  }
LABEL_61:
  buf[0] = 0;
  uint64_t v43 = objc_msgSend(MEMORY[0x1E4F1CA80], "set", v59);
  uint64_t v44 = [v61 allKeys];
  uint64_t v45 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"self" ascending:0];
  v102 = v45;
  id v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v102 count:1];
  int v47 = [v44 sortedArrayUsingDescriptors:v46];

  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v48 = v47;
  uint64_t v68 = [v48 countByEnumeratingWithState:&v75 objects:v101 count:16];
  if (v68)
  {
    uint64_t v49 = *(void *)v76;
    uint64_t v50 = v4 & 0x14;
    id obja = v48;
    uint64_t v66 = *(void *)v76;
    do
    {
      uint64_t v51 = 0;
      do
      {
        if (*(void *)v76 != v49) {
          objc_enumerationMutation(v48);
        }
        uint64_t v52 = *(void *)(*((void *)&v75 + 1) + 8 * v51);
        long long v71 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        uint64_t v53 = [v61 objectForKeyedSubscript:v52];
        uint64_t v54 = [v53 countByEnumeratingWithState:&v71 objects:v100 count:16];
        if (!v54) {
          goto LABEL_77;
        }
        uint64_t v55 = v54;
        uint64_t v56 = *(void *)v72;
        while (2)
        {
          for (uint64_t m = 0; m != v55; ++m)
          {
            if (*(void *)v72 != v56) {
              objc_enumerationMutation(v53);
            }
            uint64_t v58 = *(void *)(*((void *)&v71 + 1) + 8 * m);
            if (v50 != 16)
            {
              if ([v43 containsObject:*(void *)(*((void *)&v71 + 1) + 8 * m)]) {
                continue;
              }
              [v43 addObject:v58];
            }
            v63[2](v63, v58, buf);
            if (buf[0])
            {

              id v12 = v62;
              id v48 = obja;
              goto LABEL_83;
            }
          }
          uint64_t v55 = [v53 countByEnumeratingWithState:&v71 objects:v100 count:16];
          if (v55) {
            continue;
          }
          break;
        }
LABEL_77:

        if ((v64 & 4) == 0) {
          [v43 removeAllObjects];
        }
        ++v51;
        id v48 = obja;
        id v12 = v62;
        uint64_t v49 = v66;
      }
      while (v51 != v68);
      uint64_t v68 = [obja countByEnumeratingWithState:&v75 objects:v101 count:16];
    }
    while (v68);
  }
LABEL_83:
}

uint64_t __66__UIResponder__enumerateKeyCommandsInChainWithOptions_usingBlock___block_invoke()
{
  uint64_t result = dyld_program_sdk_at_least();
  byte_1EB262470 = result;
  return result;
}

void __66__UIResponder__enumerateKeyCommandsInChainWithOptions_usingBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v16 = a2;
  id v5 = a3;
  if (([*(id *)(a1 + 32) containsObject:v16] & 1) == 0)
  {
    [*(id *)(a1 + 32) addObject:v16];
    uint64_t v6 = *(void *)(a1 + 48);
    if (v6)
    {
      if (_UIInternalPreferencesRevisionOnce != -1) {
        dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
      }
      int v7 = _UIInternalPreferencesRevisionVar;
      uint64_t v8 = v16;
      if (_UIInternalPreferencesRevisionVar < 1
        || (int v15 = _UIInternalPreference_EnableLayoutAwareShortcutsAutomatic,
            _UIInternalPreferencesRevisionVar == _UIInternalPreference_EnableLayoutAwareShortcutsAutomatic))
      {
        BOOL v9 = 0;
      }
      else
      {
        while (1)
        {
          BOOL v9 = v7 < v15;
          if (v7 < v15) {
            break;
          }
          _UIInternalPreferenceSync(v7, &_UIInternalPreference_EnableLayoutAwareShortcutsAutomatic, @"EnableLayoutAwareShortcutsAutomatic", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
          int v15 = _UIInternalPreference_EnableLayoutAwareShortcutsAutomatic;
          uint64_t v8 = v16;
          if (v7 == _UIInternalPreference_EnableLayoutAwareShortcutsAutomatic) {
            goto LABEL_7;
          }
        }
        uint64_t v8 = v16;
      }
LABEL_7:
      if (byte_1EB257674) {
        BOOL v10 = v9;
      }
      else {
        BOOL v10 = 0;
      }
      [v8 _localizeWithGSKeyboard:v6 automatically:v10 force:0];
    }
    if ([v16 action] || objc_msgSend(v16, "_buttonType"))
    {
      uint64_t v11 = (void *)[v16 _mutableCopyIfNeeded];
      [v11 _setOriginatingResponder:v5];
      if (*(unsigned char *)(a1 + 56))
      {
        id v12 = &unk_1ED3F6150;
      }
      else
      {
        id v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v11, "_enumerationPriority"));
      }
      uint64_t v13 = [*(id *)(a1 + 40) objectForKeyedSubscript:v12];
      if (v13)
      {
        uint64_t v14 = v13;
        [v13 addObject:v11];
      }
      else
      {
        uint64_t v14 = [MEMORY[0x1E4F1CA48] arrayWithObject:v11];
        [*(id *)(a1 + 40) setObject:v14 forKeyedSubscript:v12];
      }
    }
  }
}

void __66__UIResponder__enumerateKeyCommandsInChainWithOptions_usingBlock___block_invoke_168()
{
  v28[15] = *MEMORY[0x1E4F143B8];
  uint64_t v22 = +[UICommand _defaultCommandForAction:sel_undo_];
  v28[0] = v22;
  id v21 = +[UICommand _defaultCommandForAction:sel_redo_];
  v28[1] = v21;
  double v20 = +[UICommand _defaultCommandForAction:sel_cut_];
  v28[2] = v20;
  uint64_t v19 = +[UICommand _defaultCommandForAction:sel_copy_];
  v28[3] = v19;
  uint64_t v18 = +[UICommand _defaultCommandForAction:sel_paste_];
  v28[4] = v18;
  uint64_t v17 = +[UICommand _defaultCommandForAction:sel_pasteAndMatchStyle_];
  v28[5] = v17;
  v0 = +[UICommand _defaultCommandForAction:sel_selectAll_];
  v28[6] = v0;
  uint64_t v1 = +[UICommand _defaultCommandForAction:sel_increaseSize_];
  v28[7] = v1;
  id v2 = +[UICommand _defaultCommandForAction:sel_decreaseSize_];
  v28[8] = v2;
  id v3 = +[UICommand _defaultCommandForAction:sel_toggleBoldface_];
  v28[9] = v3;
  char v4 = +[UICommand _defaultCommandForAction:sel_toggleItalics_];
  v28[10] = v4;
  id v5 = +[UICommand _defaultCommandForAction:sel_toggleUnderline_];
  v28[11] = v5;
  uint64_t v6 = +[UICommand _defaultCommandForAction:sel_startDictation_];
  v28[12] = v6;
  int v7 = +[UICommand _defaultCommandForAction:sel_orderFrontCharacterPalette_];
  v28[13] = v7;
  uint64_t v8 = +[UICommand _defaultCommandForAction:sel__handleLegacyEmojiKeyboardShortcut_];
  v28[14] = v8;
  BOOL v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:15];

  uint64_t v10 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v9 copyItems:1];
  uint64_t v11 = (void *)qword_1EB262488;
  qword_1EB262488 = v10;

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v12 = (id)qword_1EB262488;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v24;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v12);
        }
        [*(id *)(*((void *)&v23 + 1) + 8 * v16++) _setEnumerationPriority:-1];
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v14);
  }
}

void __66__UIResponder__enumerateKeyCommandsInChainWithOptions_usingBlock___block_invoke_2_197()
{
  v17[5] = *MEMORY[0x1E4F143B8];
  v0 = +[UIKeyCommand keyCommandWithInput:@" " modifierFlags:11468800 action:sel__nopSelector_];
  v17[0] = v0;
  uint64_t v1 = +[UIKeyCommand keyCommandWithInput:@"UIKeyInputUpArrow" modifierFlags:0x100000 action:sel__nopSelector_];
  v17[1] = v1;
  id v2 = +[UIKeyCommand keyCommandWithInput:@"UIKeyInputDownArrow" modifierFlags:0x100000 action:sel__nopSelector_];
  v17[2] = v2;
  id v3 = +[UIKeyCommand keyCommandWithInput:@"UIKeyInputLeftArrow" modifierFlags:0x100000 action:sel__nopSelector_];
  v17[3] = v3;
  char v4 = +[UIKeyCommand keyCommandWithInput:@"UIKeyInputRightArrow" modifierFlags:0x100000 action:sel__nopSelector_];
  v17[4] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:5];
  uint64_t v6 = (void *)qword_1EB262498;
  qword_1EB262498 = v5;

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = (id)qword_1EB262498;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "_setEnumerationPriority:", -1, (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (BOOL)_enableAutomaticKeyboardPressDone
{
  id v2 = [(UIResponder *)self nextResponder];
  char v3 = [v2 _enableAutomaticKeyboardPressDone];

  return v3;
}

- (BOOL)_canResignIfContainsFirstResponder
{
  return 1;
}

- (BOOL)_isHostingRemoteContent
{
  return 0;
}

- (id)_nextResponderThatCanBecomeFirstResponder
{
  id v2 = self;
  if (v2)
  {
    do
    {
      if ([(UIResponder *)v2 isFirstResponder]) {
        break;
      }
      if ([(UIResponder *)v2 canBecomeFirstResponder]) {
        break;
      }
      uint64_t v3 = [(UIResponder *)v2 nextResponder];

      id v2 = (UIResponder *)v3;
    }
    while (v3);
  }
  return v2;
}

- (BOOL)_nextResponderChainContainsResponder:(id)a3
{
  uint64_t v5 = (UIResponder *)a3;
  if (!v5)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"UIResponder.m", 1526, @"Invalid parameter not satisfying: %@", @"nextResponder" object file lineNumber description];
  }
  uint64_t v6 = self;
  for (BOOL i = v6 != 0; v6; BOOL i = v6 != 0)
  {
    if (v6 == v5) {
      break;
    }
    uint64_t v8 = v6;
    uint64_t v6 = [(UIResponder *)v6 nextResponder];
  }
  return i;
}

- (BOOL)_isPinningInputViews
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __35__UIResponder__isPinningInputViews__block_invoke;
  v4[3] = &unk_1E5303378;
  v4[4] = self;
  void v4[5] = &v5;
  +[UIKeyboardSceneDelegate performOnControllers:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __35__UIResponder__isPinningInputViews__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 _isPinningInputViewsOnBehalfOfResponder:*(void *)(a1 + 32)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= result;
  return result;
}

- (void)_handleKeyEvent:(__GSEvent *)a3
{
  id v4 = [(UIResponder *)self nextResponder];
  [v4 _handleKeyEvent:a3];
}

- (void)_handleKeyUIEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(UIResponder *)self nextResponder];
  [v5 _handleKeyUIEvent:v4];
}

- (void)_handleGameControllerEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(UIResponder *)self nextResponder];
  [v5 _handleGameControllerEvent:v4];
}

- (BOOL)_wantsPriorityOverFocusUpdates
{
  char v2 = [(UIResponder *)self nextResponder];
  char v3 = [v2 _wantsPriorityOverFocusUpdates];

  return v3;
}

- (BOOL)_isViewController
{
  return 0;
}

- (BOOL)_isView
{
  return 0;
}

- (int64_t)_availableTextServices
{
  char v2 = [(UIResponder *)self nextResponder];
  int64_t v3 = [v2 _availableTextServices];

  return v3;
}

- (BOOL)_canShowTextServiceForType:(int64_t)a3
{
  return (a3 & ~[(UIResponder *)self _availableTextServices]) == 0;
}

- (id)_showServiceForType:(int64_t)a3 withContext:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(UIResponder *)self nextResponder];
  char v8 = [v7 _showServiceForType:a3 withContext:v6];

  return v8;
}

- (id)_showServiceForText:(id)a3 type:(int64_t)a4 fromRect:(CGRect)a5 inView:(id)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v13 = a6;
  id v14 = a3;
  long long v15 = [(UIResponder *)self nextResponder];
  uint64_t v16 = objc_msgSend(v15, "_showServiceForText:type:fromRect:inView:", v14, a4, v13, x, y, width, height);

  return v16;
}

- (id)_showServiceForText:(id)a3 selectedTextRange:(_NSRange)a4 type:(int64_t)a5 fromRect:(CGRect)a6 inView:(id)a7
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v16 = a7;
  id v17 = a3;
  uint64_t v18 = [(UIResponder *)self nextResponder];
  uint64_t v19 = objc_msgSend(v18, "_showServiceForText:selectedTextRange:type:fromRect:inView:", v17, location, length, a5, v16, x, y, width, height);

  return v19;
}

- (void)pressesBegan:(NSSet *)presses withEvent:(UIPressesEvent *)event
{
}

- (void)pressesChanged:(NSSet *)presses withEvent:(UIPressesEvent *)event
{
}

- (void)pressesEnded:(NSSet *)presses withEvent:(UIPressesEvent *)event
{
}

- (void)pressesCancelled:(NSSet *)presses withEvent:(UIPressesEvent *)event
{
}

- (id)_primaryContentResponder
{
  char v2 = [(UIResponder *)self nextResponder];
  int64_t v3 = [v2 _primaryContentResponder];

  return v3;
}

- (CGRect)_responderSelectionRectForWindow:(id)a3
{
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGRect)_responderExternalTouchRectForWindow:(id)a3
{
  if (a3)
  {
    [a3 frame];
  }
  else
  {
    double v3 = *MEMORY[0x1E4F1DB28];
    double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (id)_responderSelectionContainerViewForResponder:(id)a3
{
  id v4 = a3;
  double v5 = [(UIResponder *)self nextResponder];
  double v6 = [v5 _responderSelectionContainerViewForResponder:v4];

  return v6;
}

- (id)_responderSelectionImage
{
  if (qword_1EB2624C0 != -1) {
    dispatch_once(&qword_1EB2624C0, &__block_literal_global_614_1);
  }
  char v2 = (void *)qword_1EB2624B8;
  return v2;
}

void __39__UIResponder__responderSelectionImage__block_invoke()
{
  _UIGraphicsBeginImageContextWithOptions(0, 0, 23.0, 23.0, 0.0);
  v0 = +[UIColor blueColor];
  [v0 setStroke];

  v7.origin.double x = 0.0;
  v7.origin.double y = 0.0;
  v7.size.double width = 23.0;
  v7.size.double height = 23.0;
  CGRect v8 = CGRectInset(v7, 2.5, 2.5);
  +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v8.origin.x, v8.origin.y, v8.size.width, v8.size.height, 10.0);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setLineWidth:5.0];
  [v5 stroke];
  uint64_t v1 = _UIGraphicsGetImageFromCurrentImageContext(0);
  UIGraphicsEndImageContext();
  char v2 = objc_msgSend(v1, "resizableImageWithCapInsets:", 11.0, 11.0, 11.0, 11.0);

  uint64_t v3 = objc_msgSend(v2, "imageWithAlignmentRectInsets:", -7.0, -7.0, -7.0, -7.0);

  id v4 = (void *)qword_1EB2624B8;
  qword_1EB2624B8 = v3;
}

- (BOOL)_supportsBecomeFirstResponderWhenPossible
{
  return 0;
}

- (CGRect)_rectToScrollToVisibleInCellInWindow:(id)a3
{
  double v3 = *MEMORY[0x1E4F1DB20];
  double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (void)_checkIsText:(BOOL *)a3 isSecure:(BOOL *)a4 isEditable:(BOOL *)a5 isFormatted:(BOOL *)a6
{
  int v11 = [(UIResponder *)self conformsToProtocol:&unk_1ED42EE38];
  BOOL v12 = v11;
  if (!v11)
  {
    BOOL v14 = 0;
    char v13 = 0;
    if (!a3) {
      goto LABEL_17;
    }
LABEL_16:
    *a3 = v12;
    goto LABEL_17;
  }
  if (objc_opt_respondsToSelector())
  {
    char v13 = [(UIResponder *)self isSecureTextEntry];
  }
  else
  {
    long long v15 = +[UITextInputTraits traitsByAdoptingTraits:self];
    id v16 = v15;
    if (v15) {
      char v13 = [v15 isSecureTextEntry];
    }
    else {
      char v13 = 0;
    }
  }
  BOOL v14 = (objc_opt_respondsToSelector() & 1) != 0 && [(UIResponder *)self isEditable];
  if ([(UIResponder *)self canPerformAction:sel_toggleBoldface_ withSender:0]
    || [(UIResponder *)self canPerformAction:sel_toggleItalics_ withSender:0])
  {
    LOBYTE(v11) = 1;
    if (!a3) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  LOBYTE(v11) = [(UIResponder *)self canPerformAction:sel_toggleUnderline_ withSender:0];
  if (a3) {
    goto LABEL_16;
  }
LABEL_17:
  if (a4) {
    *a4 = v13;
  }
  if (a5) {
    *a5 = v14;
  }
  if (a6) {
    *a6 = v11;
  }
}

- (BOOL)_disallowsPresentationOfKeyboardShortcutHUD
{
  char v2 = [(UIResponder *)self nextResponder];
  char v3 = [v2 _disallowsPresentationOfKeyboardShortcutHUD];

  return v3;
}

- (BOOL)_alwaysRequireInlineCandidateView
{
  char v2 = [(UIResponder *)self nextResponder];
  char v3 = [v2 _alwaysRequireInlineCandidateView];

  return v3;
}

- (BOOL)_isHardwareKeyboardBehaviorEnabled
{
  char v2 = +[UIKeyboardImpl activeInstance];
  char v3 = [v2 isInHardwareKeyboardMode];

  return v3;
}

- (id)pasteConfiguration
{
  if ((*(_WORD *)&self->_responderFlags & 0x10) != 0)
  {
    char v2 = objc_getAssociatedObject(self, &_pasteConfigurationKey);
  }
  else
  {
    char v2 = 0;
  }
  return v2;
}

- (void)pasteItemProviders:(id)a3
{
  id v8 = a3;
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    double v5 = [(UIResponder *)self _nextResponderUsingTraversalStrategy:2];
    double v6 = v5;
    if (v5) {
      [v5 pasteItemProviders:v8];
    }
  }
  CGRect v7 = [MEMORY[0x1E4F28B00] currentHandler];
  [v7 handleFailureInMethod:a2 object:self file:@"UIResponder.m" lineNumber:1918 description:@"pasteItemProviders: must be overridden if pasteConfiguration is not nil."];
}

- (BOOL)canPasteItemProviders:(id)a3
{
  id v4 = a3;
  double v5 = [(UIResponder *)self _effectivePasteConfiguration];
  double v6 = v5;
  if (v5) {
    char v7 = _UICanPasteItemProviders(v5, v4);
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (id)_responderChainDescription
{
  return _UIResponderChainDescription(self, 0);
}

- (id)_targetActionResponderChainDescription
{
  return _UIResponderChainDescription(self, 2);
}

- (int64_t)_dragDataOwner
{
  char v3 = objc_getAssociatedObject(self, &_dragDataOwnerKey);
  id v4 = (void *)[v3 integerValue];

  if (!v4)
  {
    id v4 = [(UIResponder *)self nextResponder];

    if (v4)
    {
      double v5 = [(UIResponder *)self nextResponder];
      id v4 = (void *)[v5 _dragDataOwner];
    }
  }
  return (int64_t)v4;
}

- (void)_setDragDataOwner:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  objc_setAssociatedObject(self, &_dragDataOwnerKey, v4, (void *)1);
}

- (int64_t)_dropDataOwner
{
  char v3 = objc_getAssociatedObject(self, &_dropDataOwnerKey);
  id v4 = (void *)[v3 integerValue];

  if (!v4)
  {
    id v4 = [(UIResponder *)self nextResponder];

    if (v4)
    {
      double v5 = [(UIResponder *)self nextResponder];
      id v4 = (void *)[v5 _dropDataOwner];
    }
  }
  return (int64_t)v4;
}

- (void)_setDropDataOwner:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  objc_setAssociatedObject(self, &_dropDataOwnerKey, v4, (void *)1);
}

- (int64_t)_dataOwnerForCopy
{
  char v3 = objc_getAssociatedObject(self, &_dataOwnerForCopyKey);
  id v4 = (void *)[v3 integerValue];

  if (!v4)
  {
    id v4 = [(UIResponder *)self nextResponder];

    if (v4)
    {
      double v5 = [(UIResponder *)self nextResponder];
      id v4 = (void *)[v5 _dataOwnerForCopy];
    }
  }
  return (int64_t)v4;
}

- (void)_setDataOwnerForCopy:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  objc_setAssociatedObject(self, &_dataOwnerForCopyKey, v4, (void *)1);
}

- (int64_t)_dataOwnerForPaste
{
  char v3 = objc_getAssociatedObject(self, &_dataOwnerForPasteKey);
  id v4 = (void *)[v3 integerValue];

  if (!v4)
  {
    id v4 = [(UIResponder *)self nextResponder];

    if (v4)
    {
      double v5 = [(UIResponder *)self nextResponder];
      id v4 = (void *)[v5 _dataOwnerForPaste];
    }
  }
  return (int64_t)v4;
}

- (void)_setDataOwnerForPaste:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  objc_setAssociatedObject(self, &_dataOwnerForPasteKey, v4, (void *)1);
}

- (id)inputDashboardViewController
{
  char v3 = +[UIKeyboardImpl activeInstance];
  int v4 = [v3 shouldShowSmartReplyFeedbackInputDashboardViewController];

  if (!v4
    || ([(UIResponder *)self _smartReplyFeedbackInputDashboardViewController], (id v5 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    double v6 = [(UIResponder *)self _writingToolsInputDashboardViewController];
    char v7 = v6;
    if (v6)
    {
      id v5 = v6;
    }
    else
    {
      id v8 = [(UIResponder *)self nextResponder];
      id v5 = [v8 inputDashboardViewController];

      uint64_t v9 = [v5 _nextResponderOverride];

      if (!v9)
      {
        uint64_t v10 = [(UIResponder *)self nextResponder];
        [v5 _overrideInputAccessoryViewNextResponderWithResponder:v10];
      }
    }
  }
  return v5;
}

+ (void)clearTextInputContextIdentifier:(NSString *)identifier
{
  char v3 = (objc_class *)MEMORY[0x1E4F1CB18];
  int v4 = identifier;
  id v7 = (id)[[v3 alloc] initWithSuiteName:@"UITextInputContextIdentifiers"];
  id v5 = [@"ID_" stringByAppendingString:v4];

  double v6 = [v5 stringByAppendingString:@"_SETTIME"];
  [v7 removeObjectForKey:v5];
  [v7 removeObjectForKey:v6];
}

- (id)_additionalTextInputLocales
{
  char v2 = [(UIResponder *)self nextResponder];
  char v3 = [v2 _additionalTextInputLocales];

  return v3;
}

- (void)reloadInputViewsWithoutReset
{
  if ([(UIResponder *)self shouldReloadInputViews])
  {
    char v3 = [(UIResponder *)self _window];
    int v4 = [v3 windowScene];
    id v5 = [v4 keyboardSceneDelegate];

    [v5 _setReloadInputViewsForcedIsAllowed:0];
    [v5 _reloadInputViewsForResponder:self];
    [v5 _setReloadInputViewsForcedIsAllowed:1];
  }
}

- (UITextInputAssistantItem)inputAssistantItem
{
  if ((*(_WORD *)&self->_responderFlags & 4) == 0
    || (objc_getAssociatedObject(self, &_UIResponderInputAssistantItem),
        (char v3 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    char v3 = +[UIAssistantBarButtonItemProvider systemDefaultAssistantItem];
    *(_WORD *)&self->_unsigned int responderFlags = *(_WORD *)&self->_responderFlags & 0xFFFB | (4 * (v3 != 0));
    objc_setAssociatedObject(self, &_UIResponderInputAssistantItem, v3, (void *)1);
  }
  return (UITextInputAssistantItem *)v3;
}

- (BOOL)_suppressSoftwareKeyboard
{
  return (*(_WORD *)&self->_responderFlags >> 6) & 1;
}

- (void)_setSuppressSoftwareKeyboard:(BOOL)a3
{
  __int16 responderFlags = (__int16)self->_responderFlags;
  if (((((responderFlags & 0x40) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      __int16 v4 = 64;
    }
    else {
      __int16 v4 = 0;
    }
    *(_WORD *)&self->___int16 responderFlags = responderFlags & 0xFFBF | v4;
    id v5 = +[UIKeyboardImpl activeInstance];
    [v5 _suppressSoftwareKeyboardStateChangedIgnoringPolicyDelegate:1];
  }
}

- (void)captureTextFromCamera:(id)sender
{
  id v6 = sender;
  __int16 v4 = [(UIResponder *)self _keyboardResponder];
  if (v4)
  {
    id v5 = +[UIKeyboardCameraSession sharedSession];
    [v5 showForResponder:v4 sender:v6 rtiConfiguration:0];
  }
}

- (NSArray)keyCommands
{
  return 0;
}

void __37___UIResponder_Override_Host_dealloc__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 == 2)
  {
    id v3 = [*(id *)(a1 + 32) overridden];
    [v3 _overrideInputAccessoryViewNextResponderWithResponder:*(void *)(a1 + 40)];
  }
  else
  {
    if (a2 != 1) {
      return;
    }
    id v3 = [*(id *)(a1 + 32) overridden];
    [v3 _overrideInputViewNextResponderWithResponder:*(void *)(a1 + 40)];
  }
}

void __55___UIResponder_Override_Host_attachOverrider_forTypes___block_invoke(uint64_t a1, uint64_t a2)
{
  char v2 = *(void **)(*(void *)(a1 + 32) + 8);
  id v3 = +[_UIResponder_Override_Host_Entry entryWithResponder:*(void *)(a1 + 40) forType:a2];
  [v2 addObject:v3];
}

- (void)_rebuildStateRestorationIdentifierPath
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    _rebuildStateRestorationIdentifierPath(self, v3);
  }
  else if (_UIStateRestorationDebugLogEnabled())
  {
    NSLog(&cfstr_SWarningCalled_0.isa, "-[UIResponder(StateRestoration) _rebuildStateRestorationIdentifierPath]", self);
  }
}

+ (id)objectWithRestorationIdentifierPath:(id)a3
{
  if (!qword_1EB262DC0 || (id result = (id)[(id)qword_1EB262DC0 objectForKey:a3]) == 0)
  {
    id v5 = (void *)qword_1EB262DC8;
    return (id)[v5 objectForKey:a3];
  }
  return result;
}

- (id)_restorationIdentifierPath
{
  id result = [(UIResponder *)self restorationIdentifier];
  if (result)
  {
    __int16 v4 = (void *)_restorationIdentifierPathArrayForResponder(self);
    return (id)[v4 componentsJoinedByString:@"/"];
  }
  return result;
}

+ (void)_updateStateRestorationIdentifierMap
{
  [(id)qword_1EB262DB8 enumerateObjectsUsingBlock:&__block_literal_global_235_0];
  char v2 = (void *)qword_1EB262DB8;
  [v2 removeAllObjects];
}

void __69__UIResponder_StateRestoration___updateStateRestorationIdentifierMap__block_invoke(uint64_t a1, void *a2)
{
  id v3 = _restorationIdentifierForObject(a2);
  if (v3)
  {
    uint64_t v4 = (uint64_t)v3;
    id v5 = (id)qword_1EB262DC0;
    if (!qword_1EB262DC0)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      qword_1EB262DC0 = (uint64_t)v5;
    }
    _putObjectIdentifierIntoRestorationIdentifierMap(a2, v4, v5);
  }
  else if (_UIStateRestorationDebugLogEnabled())
  {
    NSLog(&cfstr_SWarningObject_0.isa, "+[UIResponder(StateRestoration) _updateStateRestorationIdentifierMap]_block_invoke", a2);
  }
}

+ (void)_setRestoredIdentifierPathForObject:(id)a3 identifierPath:(id)a4
{
  id v6 = (void *)[a4 componentsSeparatedByString:@"/"];
  if ([v6 count])
  {
    id v7 = (id)qword_1EB262DA0;
    if (!qword_1EB262DA0)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      qword_1EB262DA0 = (uint64_t)v7;
    }
    [v7 setObject:v6, objc_msgSend(NSString, "stringWithFormat:", @"%p", a3) forKey];
    [v6 lastObject];
    _trackObjectWithIdentifier((uint64_t)a3);
  }
  else if (_UIStateRestorationDebugLogEnabled())
  {
    NSLog(&cfstr_SWarningIdenti.isa, "+[UIResponder(StateRestoration) _setRestoredIdentifierPathForObject:identifierPath:]", a4, a3);
  }
}

- (BOOL)_supportsImagePaste
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = [(UIResponder *)self pasteConfiguration];
  uint64_t v4 = v3;
  if (v3)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v5 = [v3 acceptableTypeIdentifiers];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      id v21 = v4;
      char v8 = 0;
      uint64_t v9 = *(void *)v23;
      uint64_t v10 = *MEMORY[0x1E4F44460];
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(v5);
          }
          BOOL v12 = [MEMORY[0x1E4F442D8] typeWithIdentifier:*(void *)(*((void *)&v22 + 1) + 8 * i)];
          int v13 = [v12 conformsToType:v10];

          if (v13) {
            char v8 = 1;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v7);

      uint64_t v4 = v21;
      if (v8)
      {
        char v14 = 1;
        goto LABEL_19;
      }
    }
    else
    {
    }
  }
  if (objc_opt_respondsToSelector())
  {
    char v14 = [(UIResponder *)self supportsImagePaste];
  }
  else
  {
    if (_supportsImagePaste_onceToken != -1) {
      dispatch_once(&_supportsImagePaste_onceToken, &__block_literal_global_81_0);
    }
    id v15 = objc_alloc_init(MEMORY[0x1E4F28D78]);
    id v16 = [(id)*MEMORY[0x1E4F44460] identifier];
    [v15 registerDataRepresentationForTypeIdentifier:v16 visibility:0 loadHandler:&__block_literal_global_83_1];

    id v26 = v15;
    id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
    uint64_t v18 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:5.0];
    +[UIPasteboard _pinItemProviders:v17 forPasteboardNamed:@"com.apple.UIKit.pboard.general" withExpirationDate:v18];

    uint64_t v19 = [(UIResponder *)self targetForAction:sel_paste_ withSender:0];

    +[UIPasteboard _clearPinnedItemProvidersForPasteboardNamed:@"com.apple.UIKit.pboard.general"];
    char v14 = v19 == self;
  }
LABEL_19:

  return v14;
}

void __55__UIResponder__UIStickerExtension___supportsImagePaste__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:@"iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNk+M9QDwADhgGAWjR9awAAAABJRU5ErkJggg==" options:0];
  uint64_t v1 = (void *)_supportsImagePaste_imgData;
  _supportsImagePaste_imgData = v0;
}

uint64_t __55__UIResponder__UIStickerExtension___supportsImagePaste__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return 0;
}

- (void)_insertItemFromProvider:(id)a3 completionHandler:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void (**)(id, BOOL))a4;
  id v16 = a3;
  uint64_t v7 = (void *)MEMORY[0x1E4F1C978];
  id v8 = a3;
  uint64_t v9 = [v7 arrayWithObjects:&v16 count:1];
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceNow:", 0.5, v16, v17);
  +[UIPasteboard _pinItemProviders:v9 forPasteboardNamed:@"com.apple.UIKit.pboard.general" withExpirationDate:v10];

  int v11 = [(UIResponder *)self targetForAction:sel_paste_ withSender:0];
  BOOL v12 = v11;
  if (v11)
  {
    int v13 = [v11 conformsToProtocol:&unk_1ED700D60];

    if (v13)
    {
      [v12 pasteWithCompletionHandler:&__block_literal_global_198_0];
      if (!v6) {
        goto LABEL_7;
      }
    }
    else
    {
      [v12 paste:0];
      dispatch_time_t v15 = dispatch_time(0, 500000000);
      dispatch_after(v15, MEMORY[0x1E4F14428], &__block_literal_global_200_4);
      if (!v6) {
        goto LABEL_7;
      }
    }
    goto LABEL_6;
  }
  char v14 = +[UIPasteboard generalPasteboard];

  [v14 _clearPinnedItemProviders];
  if (v6) {
LABEL_6:
  }
    v6[2](v6, v12 != 0);
LABEL_7:
}

void __78__UIResponder__UIStickerExtension___insertItemFromProvider_completionHandler___block_invoke()
{
  id v0 = +[UIPasteboard generalPasteboard];
  [v0 _clearPinnedItemProviders];
}

void __78__UIResponder__UIStickerExtension___insertItemFromProvider_completionHandler___block_invoke_2()
{
  id v0 = +[UIPasteboard generalPasteboard];
  [v0 _clearPinnedItemProviders];
}

- (BOOL)_supportsWritingTools
{
  if (![(id)objc_opt_class() _isWritingToolsAvailable]) {
    return 0;
  }
  id v3 = [(UIResponder *)self _textInputForWritingTools];
  if (!v3
    || [(UIResponder *)self __wt_writingToolsBehavior] == -1
    || (_os_feature_enabled_impl() & 1) == 0
    && [(UIResponder *)self _isEditableForWritingTools]
    && ![v3 hasText]
    || (int v4 = MKBGetDeviceLockState(), v4 != 3) && v4
    || (objc_opt_respondsToSelector() & 1) != 0 && ([v3 isSecureTextEntry] & 1) != 0
    || (objc_opt_respondsToSelector() & 1) != 0
    && ([v3 keyboardType] == 2
     || [v3 keyboardType] == 4
     || [v3 keyboardType] == 5
     || [v3 keyboardType] == 8
     || [v3 keyboardType] == 11))
  {
    BOOL v5 = 0;
  }
  else if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = [v3 textContentType];
    BOOL v5 = [v7 length] == 0;
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (BOOL)_canHaveWritingToolsCoordinator
{
  return 0;
}

- (unint64_t)_defaultWritingToolsResultOptions
{
  return 15;
}

- (id)__wt_writingToolsCoordinator
{
  char v2 = [(UIResponder *)self _firstResponder];
  if ([v2 _canHaveWritingToolsCoordinator])
  {
    id v3 = [v2 _writingToolsCoordinator];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)_textInputForWritingTools
{
  char v2 = [(UIResponder *)self _firstResponder];
  if ([v2 conformsToProtocolCached:&unk_1ED42F658])
  {
    id v3 = v2;
    goto LABEL_8;
  }
  int v4 = [v2 _textInteraction];

  if (v4)
  {
    BOOL v5 = [v2 _textInteraction];
  }
  else
  {
    id v3 = [v2 _selectionDisplayInteraction];

    if (!v3) {
      goto LABEL_8;
    }
    BOOL v5 = [v2 _selectionDisplayInteraction];
  }
  uint64_t v6 = v5;
  id v3 = [v5 textInput];

LABEL_8:
  return v3;
}

- (int64_t)__wt_writingToolsBehavior
{
  id v3 = [(UIResponder *)self __wt_writingToolsCoordinator];
  int v4 = v3;
  if (v3)
  {
    int64_t v5 = [v3 behavior];
  }
  else
  {
    uint64_t v6 = [(UIResponder *)self _textInputForWritingTools];
    if (objc_opt_respondsToSelector()) {
      int64_t v5 = [v6 writingToolsBehavior];
    }
    else {
      int64_t v5 = 0;
    }
  }
  return v5;
}

- (BOOL)_isEditableForWritingTools
{
  id v3 = [(UIResponder *)self _textInputForWritingTools];
  if (objc_opt_respondsToSelector())
  {
    char v4 = [v3 isEditable];
  }
  else
  {
    int64_t v5 = [(UIResponder *)self _textInteraction];

    if (v5)
    {
      uint64_t v6 = [(UIResponder *)self _textInteraction];
      char v4 = [v6 textInteractionMode] == 0;
    }
    else
    {
      char v4 = 1;
    }
  }

  return v4;
}

- (id)_writingToolsDelegate
{
  id v3 = [(UIResponder *)self __wt_writingToolsCoordinator];
  char v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    uint64_t v6 = [(UIResponder *)self _textInputForWritingTools];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || ([v6 textLayoutManager], id v5 = (id)objc_claimAutoreleasedReturnValue(), v5, v5))
    {
      if (objc_opt_respondsToSelector()) {
        id v5 = v6;
      }
      else {
        id v5 = 0;
      }
    }
  }
  return v5;
}

- (BOOL)_shouldDisplayWritingToolsCandidateOptions
{
  if (![(UIResponder *)self _supportsWritingTools]) {
    return 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return 0;
  }
  char v4 = [(UIResponder *)self _writingToolsDelegate];
  if (!v4
    || (objc_opt_respondsToSelector() & 1) != 0 && [v4 writingToolsBehavior] == 2
    || ![(UIResponder *)self _textIsLargeEnoughToUseWritingTools])
  {
    BOOL v3 = 0;
  }
  else
  {
    id v5 = [(UIResponder *)self _writingToolsViewController];
    BOOL v3 = v5 == 0;
  }
  return v3;
}

- (BOOL)_shouldDisplayWritingToolsCalloutBarItem
{
  BOOL v3 = [(UIResponder *)self _writingToolsDelegate];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    id v5 = [v4 _writingToolsViewController];
    if (v5) {
      char v6 = 0;
    }
    else {
      char v6 = [v4 _supportsWritingTools];
    }
  }
  else
  {
    id v4 = [(UIResponder *)self _writingToolsViewController];
    if (v4) {
      char v6 = 0;
    }
    else {
      char v6 = [(UIResponder *)self _supportsWritingTools];
    }
  }

  return v6;
}

- (void)showWritingTools:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[_UISignalAnalytics getIAPayloadValueWritingToolsUIUnspecified];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = +[_UISignalAnalytics getIAPayloadValueWritingToolsUIMenu];
LABEL_5:
    uint64_t v7 = (void *)v6;

    id v5 = v7;
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = +[_UISignalAnalytics getIAPayloadValueWritingToolsUICandidateBar];
    goto LABEL_5;
  }
LABEL_6:
  id v8 = +[_UISignalAnalytics getIASignalWritingToolsPanelRequested];
  uint64_t v9 = +[_UISignalAnalytics getIAPayloadKeyWritingToolsUI];
  int v11 = v9;
  v12[0] = v5;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  +[_UISignalAnalytics sendWritingToolsSignal:v8 payload:v10];

  [(UIResponder *)self _startWritingToolsWithTool:@"WTUIRequestedToolNone" prompt:0 sender:v4];
}

- (void)_startWritingToolsWithTool:(id)a3 prompt:(id)a4 sender:(id)a5
{
}

- (void)_startWritingToolsWithTool:(id)a3 prompt:(id)a4 entryPoint:(id)a5 inputContextHistory:(id)a6 sender:(id)a7
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  int v11 = (__CFString *)a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if ([(UIResponder *)self _supportsWritingTools])
  {
    dispatch_time_t v15 = [(UIResponder *)self _writingToolsViewController];

    if (v15) {
      [(UIResponder *)self _endWritingTools];
    }
    id v16 = objc_alloc((Class)getWTWritingToolsViewControllerClass());
    if (v14) {
      uint64_t v17 = [v16 _initWithRequestedTool:v11 baseResponse:v12 entryPoint:v13 inputContextHistory:v14];
    }
    else {
      uint64_t v17 = [v16 initWithRequestedTool:v11 prompt:v12];
    }
    uint64_t v18 = (void *)v17;
    [(UIResponder *)self _setWritingToolsViewController:v17];
    uint64_t v19 = [(UIResponder *)self _textInputForWritingTools];
    if (os_variant_has_internal_diagnostics())
    {
      if (!v19)
      {
        id v21 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        {
          int v23 = 138412546;
          long long v24 = self;
          __int16 v25 = 2048;
          id v26 = self;
          _os_log_fault_impl(&dword_1853B0000, v21, OS_LOG_TYPE_FAULT, "<%@:%p> can not find UITextInput", (uint8_t *)&v23, 0x16u);
        }
      }
    }
    else if (!v19)
    {
      long long v22 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_startWritingToolsWithTool_prompt_entryPoint_inputContextHistory_sender____s_category)+ 8);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        int v23 = 138412546;
        long long v24 = self;
        __int16 v25 = 2048;
        id v26 = self;
        _os_log_impl(&dword_1853B0000, v22, OS_LOG_TYPE_ERROR, "<%@:%p> can not find UITextInput", (uint8_t *)&v23, 0x16u);
      }
    }
    [v18 setSourceResponder:self sourceTextInput:v19];
    double v20 = [(UIResponder *)self _writingToolsDelegate];
    [v18 setWritingToolsDelegate:v20];

    [(UIResponder *)self _setWritingToolsWantsKeyboardSuppression:1];
    if (objc_opt_respondsToSelector()) {
      [v19 willPresentWritingTools];
    }
    [v18 startWritingTools];
    if (v11 != @"WTUIRequestedToolNone") {
      [(UIResponder *)self _playInvocationAnimation];
    }
  }
}

- (void)_writingToolsDidEnd
{
  id v7 = [(UIResponder *)self _textInputForWritingTools];
  [(UIResponder *)self _setWritingToolsViewController:0];
  BOOL v3 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  id v4 = [v3 systemInputAssistantViewController];
  [v4 setInputAssistantButtonItemsForResponder:self];

  id v5 = +[UIKeyboardImpl activeInstance];
  [v5 writingToolsDidEnd];

  if (objc_opt_respondsToSelector()) {
    [v7 didDismissWritingTools];
  }
  uint64_t v6 = [(UIResponder *)self __wt_writingToolsCoordinator];
  [v6 _didDismissWritingTools];
}

- (BOOL)_isWritingToolsActive
{
  char v2 = [(UIResponder *)self _writingToolsViewController];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_setWritingToolsWantsKeyboardSuppression:(BOOL)a3
{
}

- (void)_setWritingToolsWantsKeyboardSuppression:(BOOL)a3 suppressAssistant:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = +[_UIRemoteKeyboards sharedRemoteKeyboards];
  id v8 = v7;
  if (v5)
  {
    char v9 = [v7 wantsAssistantWhileSuppressingKeyboard];

    uint64_t v10 = +[_UIRemoteKeyboards sharedRemoteKeyboards];
    [v10 setWantsAssistantWhileSuppressingKeyboard:!v4];

    int v11 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
    id value = [v11 vendKeyboardSuppressionAssertionForReason:@"WritingTools" type:0];

    objc_setAssociatedObject(self, &_MergedGlobals_1332, value, (void *)1);
    id v12 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    LODWORD(v10) = [v12 useVisualModeWindowedUI];

    if (v10 && (v9 & 1) == 0 && !v4)
    {
      id v13 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
      [v13 forceReloadInputViews];
    }
    id v14 = [(UIResponder *)self _selectionDisplayInteraction];
    dispatch_time_t v15 = [v14 obtainGhostCursorAssertionForReason:@"WritingTools"];

    objc_setAssociatedObject(self, &unk_1EB265389, v15, (void *)1);
  }
  else
  {
    [v7 setWantsAssistantWhileSuppressingKeyboard:0];

    objc_setAssociatedObject(self, &_MergedGlobals_1332, 0, (void *)1);
    objc_setAssociatedObject(self, &unk_1EB265389, 0, (void *)1);
    id v16 = +[UIKeyboardImpl activeInstance];
    [v16 generateCandidates];

    id value = +[_UIRemoteKeyboards sharedRemoteKeyboards];
    [value restoreKeyboardIfNeeded];
  }
}

- (BOOL)_writingToolsWantsKeyboardSuppression
{
  char v2 = objc_getAssociatedObject(self, &_MergedGlobals_1332);
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)_viewControllerForWritingToolsSource
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v3 = self;
LABEL_5:
    BOOL v4 = v3;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v3 = [(UIResponder *)self _viewControllerForAncestor];
    goto LABEL_5;
  }
  BOOL v5 = [(UIResponder *)self textInputView];
  BOOL v4 = [v5 _viewControllerForAncestor];

LABEL_7:
  return v4;
}

- (UIPredictiveViewController)_writingToolsInputDashboardViewController
{
  return (UIPredictiveViewController *)objc_getAssociatedObject(self, &kWritingToolsInputDashboardViewControllerKey);
}

- (void)_setWritingToolsInputDashboardViewController:(id)a3
{
  objc_setAssociatedObject(self, &kWritingToolsInputDashboardViewControllerKey, a3, (void *)1);
  BOOL v4 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  BOOL v5 = [v4 systemInputAssistantViewController];
  [v5 setInputAssistantButtonItemsForResponder:self];

  id v6 = +[UIKeyboardImpl activeInstance];
  [v6 updateAssistantView];
}

- (UIPredictiveViewController)_smartReplyFeedbackInputDashboardViewController
{
  objc_getAssociatedObject(self, &kSmartReplyFeedbackInputDashboardViewControllerKey);
  BOOL v3 = (_UISmartReplyFeedbackInputDashboardViewController *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    BOOL v3 = objc_alloc_init(_UISmartReplyFeedbackInputDashboardViewController);
    [(UIResponder *)self _setSmartReplyFeedbackInputDashboardViewController:v3];
  }
  return (UIPredictiveViewController *)v3;
}

- (void)_setSmartReplyFeedbackInputDashboardViewController:(id)a3
{
  objc_setAssociatedObject(self, &kSmartReplyFeedbackInputDashboardViewControllerKey, a3, (void *)1);
  BOOL v4 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  BOOL v5 = [v4 systemInputAssistantViewController];
  [v5 setInputAssistantButtonItemsForResponder:self];

  id v6 = +[UIKeyboardImpl activeInstance];
  [v6 updateAssistantView];
}

- (id)_textSuggestionsForWritingTools
{
  v14[3] = *MEMORY[0x1E4F143B8];
  BOOL v3 = _UINSLocalizedStringWithDefaultValue(@"Proofread", @"Proofread");
  BOOL v4 = +[UITextSuggestion textSuggestionWithInputText:v3 searchText:v3 customInfoType:0x10000];
  [v4 setTarget:self];
  [v4 setAction:sel__startProofreadingFromCandidateBar];
  BOOL v5 = +[UIImage systemImageNamed:@"text.magnifyingglass"];
  [v4 setImage:v5];

  id v6 = _UINSLocalizedStringWithDefaultValue(@"Rewrite", @"Rewrite");
  id v7 = +[UITextSuggestion textSuggestionWithInputText:v6 searchText:v6 customInfoType:0x10000];
  [v7 setTarget:self];
  [v7 setAction:sel__startRewritingFromCandidateBar];
  id v8 = +[UIImage _systemImageNamed:@"pencil.arrow.trianglehead.clockwise"];
  [v7 setImage:v8];

  char v9 = +[UITextSuggestion textSuggestionWithInputText:0 searchText:0 customInfoType:0x10000];
  [v9 setTarget:self];
  [v9 setAction:sel_showWritingTools_];
  uint64_t v10 = +[UIImageSymbolConfiguration configurationPreferringMulticolor];
  int v11 = +[UIImage _systemImageNamed:@"_gm" withConfiguration:v10];
  [v9 setImage:v11];

  v14[0] = v4;
  v14[1] = v7;
  v14[2] = v9;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:3];

  return v12;
}

- (id)_trailingPredictiveCandidateForWritingTools
{
  if (((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) != 1
     || +[UIKeyboardImpl isFloating])
    && ([(UIResponder *)self _writingToolsViewController],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        char v4 = objc_opt_respondsToSelector(),
        v3,
        (v4 & 1) != 0))
  {
    BOOL v5 = [(UIResponder *)self _writingToolsViewController];
    id v6 = [v5 trailingPredictiveCandidate];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)_assistantBarButtonItemForWritingToolsWithStyle:(int64_t)a3
{
  BOOL v5 = [(UIResponder *)self _writingToolsViewController];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(UIResponder *)self _writingToolsViewController];
    id v8 = [v7 assistantBarButtonItemWithStyle:a3];
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

- (BOOL)_isDisplayingWritingToolsSessionInUCB
{
  BOOL v3 = [(UIResponder *)self _writingToolsInputDashboardViewController];
  if (v3 && [(UIResponder *)self _writingToolsWantsKeyboardSuppression])
  {
    char v4 = +[_UIRemoteKeyboards sharedRemoteKeyboards];
    char v5 = [v4 wantsAssistantWhileSuppressingKeyboard];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)_setWritingToolsViewController:(id)a3
{
  id v4 = a3;
  char v5 = [(UIResponder *)self _firstResponder];
  objc_setAssociatedObject(v5, &kWritingToolsViewControllerKey, v4, (void *)1);

  id v6 = +[UIKeyboardImpl activeInstance];
  [v6 generateCandidates];
}

- (void)_startProofreadingFromCandidateBar
{
  v8[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = +[_UISignalAnalytics getIASignalWritingToolsPanelRequested];
  id v4 = +[_UISignalAnalytics getIAPayloadKeyWritingToolsUI];
  id v7 = v4;
  char v5 = +[_UISignalAnalytics getIAPayloadValueWritingToolsUICandidateBar];
  v8[0] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  +[_UISignalAnalytics sendWritingToolsSignal:v3 payload:v6];

  [(UIResponder *)self _startWritingToolsWithTool:@"WTUIRequestedToolProofreading" prompt:0 sender:0];
}

- (void)_startRewritingFromCandidateBar
{
  v8[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = +[_UISignalAnalytics getIASignalWritingToolsPanelRequested];
  id v4 = +[_UISignalAnalytics getIAPayloadKeyWritingToolsUI];
  id v7 = v4;
  char v5 = +[_UISignalAnalytics getIAPayloadValueWritingToolsUICandidateBar];
  v8[0] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  +[_UISignalAnalytics sendWritingToolsSignal:v3 payload:v6];

  [(UIResponder *)self _startWritingToolsWithTool:@"WTUIRequestedToolRewriting" prompt:0 sender:0];
}

- (CGRect)_selectionRectForWritingTools
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  char v2 = [(UIResponder *)self _textInputForWritingTools];
  if ([v2 conformsToProtocolCached:&unk_1ED7009A0])
  {
    id v3 = v2;
    id v4 = [v3 selectedTextRange];
    char v5 = [v3 selectionRectsForRange:v4];
    CGFloat x = *MEMORY[0x1E4F1DB20];
    CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id v10 = v5;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v67 objects:v73 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v68;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v68 != v13) {
            objc_enumerationMutation(v10);
          }
          [*(id *)(*((void *)&v67 + 1) + 8 * v14) rect];
          v88.origin.CGFloat x = v15;
          v88.origin.CGFloat y = v16;
          v88.size.CGFloat width = v17;
          v88.size.CGFloat height = v18;
          v75.origin.CGFloat x = x;
          v75.origin.CGFloat y = y;
          v75.size.CGFloat width = width;
          v75.size.CGFloat height = height;
          CGRect v76 = CGRectUnion(v75, v88);
          CGFloat x = v76.origin.x;
          CGFloat y = v76.origin.y;
          CGFloat width = v76.size.width;
          CGFloat height = v76.size.height;
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v67 objects:v73 count:16];
      }
      while (v12);
    }

    uint64_t v19 = [v3 textInputView];
    [v19 bounds];
    v89.origin.CGFloat x = v20;
    v89.origin.CGFloat y = v21;
    v89.size.CGFloat width = v22;
    v89.size.CGFloat height = v23;
    v77.origin.CGFloat x = x;
    v77.origin.CGFloat y = y;
    v77.size.CGFloat width = width;
    v77.size.CGFloat height = height;
    CGRect v78 = CGRectIntersection(v77, v89);
    CGFloat v24 = v78.origin.x;
    CGFloat v25 = v78.origin.y;
    CGFloat v26 = v78.size.width;
    CGFloat v27 = v78.size.height;
  }
  else
  {
    if ([v2 conformsToProtocolCached:&unk_1ED700D60])
    {
      id v3 = v2;
      uint64_t v28 = [v3 webSelectionRects];
      CGFloat v30 = *MEMORY[0x1E4F1DB20];
      CGFloat v29 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
      CGFloat v32 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
      CGFloat v31 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
      long long v63 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      id v10 = v28;
      uint64_t v33 = [v10 countByEnumeratingWithState:&v63 objects:v72 count:16];
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = *(void *)v64;
        do
        {
          uint64_t v36 = 0;
          do
          {
            if (*(void *)v64 != v35) {
              objc_enumerationMutation(v10);
            }
            [*(id *)(*((void *)&v63 + 1) + 8 * v36) rect];
            v90.origin.CGFloat x = v37;
            v90.origin.CGFloat y = v38;
            v90.size.CGFloat width = v39;
            v90.size.CGFloat height = v40;
            v79.origin.CGFloat x = v30;
            v79.origin.CGFloat y = v29;
            v79.size.CGFloat width = v32;
            v79.size.CGFloat height = v31;
            CGRect v80 = CGRectUnion(v79, v90);
            CGFloat v30 = v80.origin.x;
            CGFloat v29 = v80.origin.y;
            CGFloat v32 = v80.size.width;
            CGFloat v31 = v80.size.height;
            ++v36;
          }
          while (v34 != v36);
          uint64_t v34 = [v10 countByEnumeratingWithState:&v63 objects:v72 count:16];
        }
        while (v34);
      }

      uint64_t v41 = v3;
    }
    else
    {
      id v3 = [v2 selectedTextRange];
      id v42 = [v2 selectionRectsForRange:v3];
      CGFloat v30 = *MEMORY[0x1E4F1DB20];
      CGFloat v29 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
      CGFloat v32 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
      CGFloat v31 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
      long long v59 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      id v10 = v42;
      uint64_t v43 = [v10 countByEnumeratingWithState:&v59 objects:v71 count:16];
      if (v43)
      {
        uint64_t v44 = v43;
        uint64_t v45 = *(void *)v60;
        do
        {
          uint64_t v46 = 0;
          do
          {
            if (*(void *)v60 != v45) {
              objc_enumerationMutation(v10);
            }
            objc_msgSend(*(id *)(*((void *)&v59 + 1) + 8 * v46), "rect", (void)v59);
            CGFloat v47 = v81.origin.x;
            CGFloat v48 = v81.origin.y;
            CGFloat v49 = v81.size.width;
            CGFloat v50 = v81.size.height;
            if (CGRectGetWidth(v81) > 0.0)
            {
              v82.origin.CGFloat x = v47;
              v82.origin.CGFloat y = v48;
              v82.size.CGFloat width = v49;
              v82.size.CGFloat height = v50;
              if (CGRectGetHeight(v82) > 0.0)
              {
                v83.origin.CGFloat x = v30;
                v83.origin.CGFloat y = v29;
                v83.size.CGFloat width = v32;
                v83.size.CGFloat height = v31;
                v91.origin.CGFloat x = v47;
                v91.origin.CGFloat y = v48;
                v91.size.CGFloat width = v49;
                v91.size.CGFloat height = v50;
                CGRect v84 = CGRectUnion(v83, v91);
                CGFloat v30 = v84.origin.x;
                CGFloat v29 = v84.origin.y;
                CGFloat v32 = v84.size.width;
                CGFloat v31 = v84.size.height;
              }
            }
            ++v46;
          }
          while (v44 != v46);
          uint64_t v44 = [v10 countByEnumeratingWithState:&v59 objects:v71 count:16];
        }
        while (v44);
      }

      uint64_t v41 = v2;
    }
    id v4 = objc_msgSend(v41, "textInputView", (void)v59);
    [v4 bounds];
    v92.origin.CGFloat x = v51;
    v92.origin.CGFloat y = v52;
    v92.size.CGFloat width = v53;
    v92.size.CGFloat height = v54;
    v85.origin.CGFloat x = v30;
    v85.origin.CGFloat y = v29;
    v85.size.CGFloat width = v32;
    v85.size.CGFloat height = v31;
    CGRect v86 = CGRectIntersection(v85, v92);
    CGFloat v24 = v86.origin.x;
    CGFloat v25 = v86.origin.y;
    CGFloat v26 = v86.size.width;
    CGFloat v27 = v86.size.height;
  }

  double v55 = v24;
  double v56 = v25;
  double v57 = v26;
  double v58 = v27;
  result.size.CGFloat height = v58;
  result.size.CGFloat width = v57;
  result.origin.CGFloat y = v56;
  result.origin.CGFloat x = v55;
  return result;
}

- (BOOL)_textIsLargeEnoughToUseWritingTools
{
  char v2 = [(UIResponder *)self _textInputForWritingTools];
  if ([v2 conformsToProtocolCached:&unk_1ED7009A0])
  {
    id v3 = v2;
    id v4 = [v3 selectedTextRange];
    char v5 = [v4 start];
    [v3 caretRectForPosition:v5];
    double v7 = v6;

    id v8 = [v4 end];
    [v3 caretRectForPosition:v8];
    double v10 = v9;

LABEL_5:
    float v17 = v7 - v10;
    BOOL v18 = fabsf(v17) > 2.0;
    goto LABEL_13;
  }
  int v11 = [v2 conformsToProtocolCached:&unk_1ED700D60];
  uint64_t v12 = [v2 selectedTextRange];
  id v4 = v12;
  if (v11)
  {
    uint64_t v13 = [v12 start];
    [v2 caretRectForPosition:v13];
    double v7 = v14;

    CGFloat v15 = [v4 end];
    [v2 caretRectForPosition:v15];
    double v10 = v16;

    goto LABEL_5;
  }
  uint64_t v19 = [v2 tokenizer];
  CGFloat v20 = [v4 start];
  if (v20)
  {
    CGFloat v21 = [v19 rangeEnclosingPosition:v20 withGranularity:4 inDirection:0];
  }
  else
  {
    CGFloat v21 = 0;
  }
  CGFloat v22 = [v4 end];
  uint64_t v23 = [v21 end];
  CGFloat v24 = (void *)v23;
  BOOL v18 = 0;
  if (v22 && v23) {
    BOOL v18 = [v2 comparePosition:v22 toPosition:v23] == 1;
  }

LABEL_13:
  return v18;
}

- (void)_playInvocationAnimation
{
  [(UIResponder *)self _setCommonUIInvocationAnimationNeeded:1];
  id v3 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  [v3 updateRenderConfigForResponder:self];

  v4[4] = self;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__UIResponder_WritingToolsSupport___playInvocationAnimation__block_invoke;
  v5[3] = &unk_1E52D9F70;
  v5[4] = self;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60__UIResponder_WritingToolsSupport___playInvocationAnimation__block_invoke_2;
  v4[3] = &unk_1E52DC3A0;
  +[UIView animateWithDuration:v5 animations:v4 completion:3.0];
}

void __60__UIResponder_WritingToolsSupport___playInvocationAnimation__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setCommonUIInvocationAnimationNeeded:0];
  id v2 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  [v2 updateRenderConfigForResponder:*(void *)(a1 + 32)];
}

uint64_t __60__UIResponder_WritingToolsSupport___playInvocationAnimation__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setCommonUIInvocationAnimationNeeded:0];
}

- (BOOL)_commonUIInvocationAnimationNeeded
{
  id v2 = objc_getAssociatedObject(self, &kCommonUIInvocationAnimationNeededKey);
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)_setCommonUIInvocationAnimationNeeded:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  objc_setAssociatedObject(self, &kCommonUIInvocationAnimationNeededKey, v4, (void *)1);
}

@end