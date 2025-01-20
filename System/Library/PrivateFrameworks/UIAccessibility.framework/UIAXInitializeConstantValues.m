@interface UIAXInitializeConstantValues
@end

@implementation UIAXInitializeConstantValues

uint64_t ___UIAXInitializeConstantValues_block_invoke()
{
  kUIAccessibilityGSEventFlagEventFallThru = 0x1000000;
  UIAccessibilityScreenWillChangeNotification = 1055;
  UIAccessibilityScreenLockedNotification = 1004;
  UIAccessibilityScreenOnNotification = 1039;
  UIAccessibilityScreenUnlockedByExternalDeviceNotification = 1030;
  UIAccessibilityAlertNotification = 1006;
  UIAccessibilityWebPageLoadedNotification = 1007;
  UIAccessibilityValueChangedNotification = 1005;
  UIAccessibilitySelectionChangedNotification = 1017;
  UIAccessibilityAutoCorrectionMadeNotification = 1010;
  UIAccessibilityKeyboardKeySelectedNotification = 1012;
  UIAccessibilityAutoCorrectionDisplayedNotification = 1013;
  UIAccessibilityTextReplacementOccurredNotification = 1052;
  UIAccessibilityPasteOperationOccurredNotification = 1054;
  UIAccessibilityKeyboardChangedNotification = 1014;
  UIAccessibilitySpringBoardReturnNotification = 1015;
  UIAccessibilityElementMovedNotification = 1016;
  UIAccessibilityFirstResponderChangedNotification = 1018;
  UIAccessibilityKeyboardFocusChangedNotification = 1078;
  UIAccessibilityNativeFocusItemDidChangeWithContextNotification = 1053;
  UIAccessibilityDevicePointerDidEnterElementNotification = 1077;
  UIAccessibilityLowBatteryNotification = 1019;
  UIAccessibilityMoveToElementNotification = 1020;
  UIAccessibilityInvalidTextInputNotification = 1023;
  UIAccessibilityViewAnimationEndedNotification = 1025;
  UIAccessibilityDictationRequestCompleteNotification = 1027;
  UIAccessibilityKBPopupVariantsDisplayedNotification = 1029;
  UIAccessibilityUpdateElementVisualsNotification = 1044;
  UIAccessibilityElementPreviewNotification = 1045;
  UIAccessibilityElementPreviewActionNotification = 1051;
  UIAccessibilityScreenWillWakeNotification = 1059;
  UIAccessibilityWebFormControlInteractionStartNotification = 1061;
  UIAccessibilityWebFormControlInteractionEndNotification = 1062;
  UIAccessibilityFKAArrowNavigationNotification = 1067;
  UIAccessibilityScrollViewDidEndDeceleratingNotification = 1069;
  UIAccessibilityContextMenuStatusNotification = 1070;
  objc_storeStrong((id *)&UIAccessibilityMoveToElementNotificationKeyElement, (id)*MEMORY[0x1E4F48C58]);
  objc_storeStrong(&UIAccessibilityMoveToElementNotificationKeySyncNativeFocus, (id)*MEMORY[0x1E4F48C68]);
  objc_storeStrong(&UIAccessibilityMoveToElementNotificationKeyIgnoreTouchInProgress, (id)*MEMORY[0x1E4F48C60]);
  objc_storeStrong(&UIAccessibilityAutoCorrectionForContinuousPathKey, (id)*MEMORY[0x1E4F48B88]);
  UIAccessibilityTraitWebContent = *MEMORY[0x1E4F48DE8];
  UIAccessibilityTraitTextEntry = *MEMORY[0x1E4F48CF8];
  UIAccessibilityTraitPickerElement = *MEMORY[0x1E4F48C90];
  UIAccessibilityTraitIsEditing = *MEMORY[0x1E4F48C28];
  UIAccessibilityTraitLaunchIcon = *MEMORY[0x1E4F48C38];
  UIAccessibilityTraitFolderIcon = *MEMORY[0x1E4F48BE0];
  UIAccessibilityTraitStatusBarElement = *MEMORY[0x1E4F48CE0];
  UIAccessibilityTraitAllowsLayoutChangeInStatusBar = *MEMORY[0x1E4F48B68];
  UIAccessibilityTraitSecureTextField = *MEMORY[0x1E4F48CB8];
  UIAccessibilityTraitBackButton = *MEMORY[0x1E4F48B90];
  UIAccessibilityTraitToggle = *MEMORY[0x1E4F48DB0];
  UIAccessibilityTraitSelectionDismissesItem = *MEMORY[0x1E4F48CC8];
  UIAccessibilityTraitVisited = *MEMORY[0x1E4F48DE0];
  UIAccessibilityTraitScrollable = *MEMORY[0x1E4F48CB0];
  UIAccessibilityTraitSpacer = *MEMORY[0x1E4F48CD0];
  UIAccessibilityTraitTableIndex = *MEMORY[0x1E4F48CF0];
  UIAccessibilityTraitMap = *MEMORY[0x1E4F48C48];
  UIAccessibilityTraitTextOperationsAvailable = *MEMORY[0x1E4F48DA8];
  UIAccessibilityTraitDraggable = *MEMORY[0x1E4F48BC0];
  UIAccessibilityTraitGesturePracticeRegion = *MEMORY[0x1E4F48BF0];
  UIAccessibilityTraitPopupButton = *MEMORY[0x1E4F48CA0];
  UIAccessibilityTraitAllowsNativeSliding = *MEMORY[0x1E4F48B70];
  UIAccessibilityTraitTouchContainer = *MEMORY[0x1E4F48DB8];
  UIAccessibilityTraitBookContent = *MEMORY[0x1E4F48B98];
  UIAccessibilityTraitMenuItem = *MEMORY[0x1E4F48C50];
  UIAccessibilityAutoCorrectCandidate = *MEMORY[0x1E4F48B80];
  UIAccessibilityTraitDeleteKey = *MEMORY[0x1E4F48BB8];
  UIAccessibilityTraitTabButton = *MEMORY[0x1E4F48CE8];
  UIAccessibilityTraitRadioButton = *MEMORY[0x1E4F48CA8];
  UIAccessibilityTraitInactive = *MEMORY[0x1E4F48C08];
  UIAccessibilityTraitAlert = *MEMORY[0x1E4F48B58];
  UIAccessibilityScrollToVisibleAction = 2003;
  UIAccessibilityIncrementAction = 2004;
  UIAccessibilityDecrementAction = 2005;
  UIAccessibilityScrollUpPageAction = 2007;
  UIAccessibilityScrollDownPageAction = 2006;
  UIAccessibilityScrollRightPageAction = 2009;
  UIAccessibilityScrollLeftPageAction = 2008;
  UIAccessibilityActivateAction = 2010;
  UIAccessibilityStartStopToggleAction = 2011;
  _UIAccessibilitySetBroadcastCallback();
  _UIAccessibilitySetConvertFrameCallback();
  _UIAccessibilitySetConvertPathCallback();
  _UIAccessibilitySetConvertAccessibilityPathToViewCallback();

  return MEMORY[0x1F4102E98](_UIAccessibilityFocusedElementForAssistiveTech);
}

@end