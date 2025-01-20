@interface _UIKeyboardUsageTracking
+ (void)appAutofillCredentialFromSafariUI;
+ (void)appAutofillDetectedDecrement;
+ (void)appAutofillDetectedIncrement;
+ (void)appAutofillExtraKeyTapped;
+ (void)appAutofillFilled;
+ (void)countKeystrokeForReachableKeyboardWithBias:(int64_t)a3;
+ (void)countReachableKeyboardHandBiasChangeToBias:(int64_t)a3;
+ (void)dualStringsKeyFlickUpCount;
+ (void)inputSwitcherSetPredictionPreference:(BOOL)a3;
+ (void)keyboardExtensionCrashed;
+ (void)keyboardExtensionPrimaryLanguageChanged;
+ (void)keyboardExtensionsOnDevice;
+ (void)keyboardGestureOneFingerForcePan:(BOOL)a3;
+ (void)keyboardGestureOneFingerForcePress:(BOOL)a3 withPressCount:(int)a4;
+ (void)keyboardGestureSelectedPredictiveInputCandidate;
+ (void)keyboardGestureSetPredictionPreference:(BOOL)a3;
+ (void)keyboardGestureTwoFingerTap:(BOOL)a3 withTapCount:(int)a4;
+ (void)keyboardPerformanceFromTouchRelease:(double)a3 until:(double)a4;
+ (void)keyboardPerformanceFromTouchStart:(double)a3 until:(double)a4;
+ (void)keyboardReachabilityDistribution:(double)a3;
+ (void)keyboardSetToInputMode:(id)a3 fromPrevious:(id)a4;
+ (void)keyboardSupportsTouch:(BOOL)a3;
+ (void)keyboardTotalOnScreenTime:(double)a3 orientation:(int64_t)a4;
+ (void)letterCaseToggleIncrement;
+ (void)loginPasswordFromAutofillIncrement;
+ (void)loginPasswordFromKeyboardIncrement;
+ (void)normalPunctuationKeyCount;
+ (void)panAlternateKeyFlickDownCount;
+ (void)predictionViewState:(BOOL)a3 forInputMode:(id)a4;
+ (void)redoKeyCount;
+ (void)restAndTypeTriggered;
+ (void)selectedPredictiveInputCandidate:(id)a3 isAutocorrection:(BOOL)a4 index:(unint64_t)a5;
+ (void)showCharacterPreviewPreference:(BOOL)a3;
+ (void)showLowercaseKeyplanePreference:(BOOL)a3;
+ (void)showVariantsIncrement;
+ (void)signupPasswordFromAutofillIncrement;
+ (void)signupPasswordFromKeyboardIncrement;
+ (void)singleStringKeyFlickUpCount;
+ (void)undoKeyCount;
+ (void)variantDeleteIncrement;
@end

@implementation _UIKeyboardUsageTracking

+ (void)keyboardSetToInputMode:(id)a3 fromPrevious:(id)a4
{
  id v14 = a3;
  id v5 = a4;
  if (v14)
  {
    if ([v14 isExtensionInputMode])
    {
      v6 = [v14 identifier];
      TIStatisticScalarIncrement3PKSummoned();

      if (!v5 || [v5 isExtensionInputMode])
      {
        if ([v14 isEqual:v5]) {
          goto LABEL_10;
        }
        v7 = [v14 containingBundleDisplayName];
        v8 = [v5 containingBundleDisplayName];
        char v9 = [v7 isEqualToString:v8];

        if ((v9 & 1) == 0) {
          goto LABEL_10;
        }
      }
    }
    else
    {
      v10 = [v14 identifierWithLayouts];
      TIStatisticScalarIncrementSystemKeyboardSummoned();

      if (![v5 isExtensionInputMode])
      {
LABEL_10:
        v12 = objc_opt_class();
        v13 = +[UIKeyboardImpl activeInstance];
        objc_msgSend(v12, "predictionViewState:forInputMode:", objc_msgSend(v13, "isPredictionViewControllerVisible"), v14);

        goto LABEL_11;
      }
    }
    v11 = TIStatisticGetKey();
    TIStatisticScalarIncrement();

    goto LABEL_10;
  }
LABEL_11:
}

+ (void)keyboardExtensionPrimaryLanguageChanged
{
  TIStatisticGetKey();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarIncrement();
}

+ (void)keyboardExtensionCrashed
{
  TIStatisticGetKey();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarIncrement();
}

+ (void)keyboardExtensionsOnDevice
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v2 = +[UIKeyboardInputModeController sharedInputModeController];
  v3 = [v2 extensionInputModes];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = [*(id *)(*((void *)&v24 + 1) + 8 * i) identifier];
        char v9 = TIStatisticGetKeyForInputMode();
        TIStatisticScalarSetValue();
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v5);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v10 = +[UIKeyboardInputModeController sharedInputModeController];
  v11 = [v10 activeInputModes];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v20 + 1) + 8 * j);
        if ([v16 isExtensionInputMode])
        {
          v17 = [v16 identifier];
          v18 = TIStatisticGetKeyForInputMode();
          TIStatisticScalarSetValue();

          [v16 defaultLayoutIsASCIICapable];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v13);
  }

  v19 = TIStatisticGetKey();
  TIStatisticScalarSetValue();
}

+ (void)predictionViewState:(BOOL)a3 forInputMode:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  if (([v4 isExtensionInputMode] & 1) == 0)
  {
    uint64_t v5 = [v4 identifier];
    v10[0] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    int v7 = UIKeyboardPredictionEnabledForInputModes(v6);

    if (v7)
    {
      v8 = [v4 identifierWithLayouts];
      char v9 = TIStatisticGetKeyForInputMode();
      TIStatisticScalarIncrement();
    }
  }
}

+ (void)inputSwitcherSetPredictionPreference:(BOOL)a3
{
  TIStatisticGetKey();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarIncrement();
}

+ (void)keyboardGestureSetPredictionPreference:(BOOL)a3
{
  TIStatisticGetKey();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarIncrement();
}

+ (void)keyboardGestureSelectedPredictiveInputCandidate
{
  TIStatisticGetKey();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarIncrement();
}

+ (void)selectedPredictiveInputCandidate:(id)a3 isAutocorrection:(BOOL)a4 index:(unint64_t)a5
{
  BOOL v5 = a4;
  id v17 = a3;
  uint64_t v6 = UIKeyboardGetCurrentInputMode();
  int v7 = UIKeyboardInputModeGetIdentifierWithKeyboardLayouts(v6);

  if (v7)
  {
    if (v5) {
      goto LABEL_6;
    }
    v8 = [v17 input];
    uint64_t v9 = [v8 length];

    if (!v9) {
      goto LABEL_6;
    }
    v10 = [v17 input];
    v11 = [v17 candidate];
    int v12 = [v10 isEqualToString:v11];

    if (v12)
    {
      uint64_t v13 = TIStatisticGetKeyForInputMode();
      TIStatisticScalarIncrement();
    }
    else
    {
LABEL_6:
      uint64_t v14 = TIStatisticGetKeyForInputMode();
      TIStatisticScalarIncrement();

      uint64_t v13 = TIStatisticGetKeyForInputMode();
      v15 = [v17 candidate];
      [v15 length];
      TIStatisticDistributionPushValue();
    }
    v16 = TIStatisticGetKeyForInputMode();
    TIStatisticDistributionPushValue();
  }
}

+ (void)showCharacterPreviewPreference:(BOOL)a3
{
  TIStatisticGetKey();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarSetBoolean();
}

+ (void)showLowercaseKeyplanePreference:(BOOL)a3
{
  TIStatisticGetKey();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarSetBoolean();
}

+ (void)keyboardGestureTwoFingerTap:(BOOL)a3 withTapCount:(int)a4
{
  if ((a4 - 1) <= 2)
  {
    TIStatisticsGetKeyForGesture();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    TIStatisticScalarIncrement();
  }
}

+ (void)keyboardGestureOneFingerForcePan:(BOOL)a3
{
  TIStatisticGetKey();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarIncrement();
}

+ (void)keyboardGestureOneFingerForcePress:(BOOL)a3 withPressCount:(int)a4
{
  if ((a4 - 1) <= 2)
  {
    TIStatisticsGetKeyForGesture();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    TIStatisticScalarIncrement();
  }
}

+ (void)keyboardPerformanceFromTouchStart:(double)a3 until:(double)a4
{
  if (a3 != 0.0)
  {
    TIStatisticGetKey();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    TIStatisticScalarIncrement();
  }
}

+ (void)keyboardPerformanceFromTouchRelease:(double)a3 until:(double)a4
{
  if (a3 != 0.0)
  {
    TIStatisticGetKey();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    TIStatisticDistributionPushValue();
  }
}

+ (void)keyboardTotalOnScreenTime:(double)a3 orientation:(int64_t)a4
{
  if ((unint64_t)(a4 - 1) <= 1)
  {
    uint64_t v4 = TIStatisticGetKey();
    TIStatisticDistributionPushValue();

    id v5 = TIStatisticGetKey();
    TIStatisticScalarIncrement();
  }
  uint64_t v6 = TIStatisticGetKey();
  TIStatisticDistributionPushValue();

  TIStatisticGetKey();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarIncrement();
}

+ (void)keyboardReachabilityDistribution:(double)a3
{
  uint64_t v4 = UIKeyboardGetCurrentInputMode();
  uint64_t v7 = UIKeyboardInputModeGetIdentifierWithKeyboardLayouts(v4);

  id v5 = (void *)v7;
  if (v7 && (a3 > 0.0 || a3 < 0.0))
  {
    uint64_t v6 = TIStatisticGetKeyForInputMode();
    TIStatisticDistributionPushValue();

    id v5 = (void *)v7;
  }
}

+ (void)dualStringsKeyFlickUpCount
{
  UIKeyboardGetCurrentInputMode();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = TIStatisticGetKeyForInputMode();
  TIStatisticScalarIncrement();
}

+ (void)singleStringKeyFlickUpCount
{
  UIKeyboardGetCurrentInputMode();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = TIStatisticGetKeyForInputMode();
  TIStatisticScalarIncrement();
}

+ (void)panAlternateKeyFlickDownCount
{
  UIKeyboardGetCurrentInputMode();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = TIStatisticGetKeyForInputMode();
  TIStatisticScalarIncrement();
}

+ (void)redoKeyCount
{
  UIKeyboardGetCurrentInputMode();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = TIStatisticGetKeyForInputMode();
  TIStatisticScalarIncrement();
}

+ (void)undoKeyCount
{
  UIKeyboardGetCurrentInputMode();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = TIStatisticGetKeyForInputMode();
  TIStatisticScalarIncrement();
}

+ (void)normalPunctuationKeyCount
{
  UIKeyboardGetCurrentInputMode();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = TIStatisticGetKeyForInputMode();
  TIStatisticScalarIncrement();
}

+ (void)restAndTypeTriggered
{
  TIStatisticGetKey();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarIncrement();
}

+ (void)countKeystrokeForReachableKeyboardWithBias:(int64_t)a3
{
  if (a3)
  {
    TIStatisticGetKey();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    TIStatisticScalarIncrement();
  }
}

+ (void)countReachableKeyboardHandBiasChangeToBias:(int64_t)a3
{
  TIStatisticGetKey();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarIncrement();
}

+ (void)appAutofillDetectedIncrement
{
  id v3 = +[UIKeyboardImpl activeInstance];
  [v3 isRTIClient];
  id v2 = TIStatisticGetKey();
  TIStatisticScalarIncrement();
}

+ (void)appAutofillDetectedDecrement
{
  id v3 = +[UIKeyboardImpl activeInstance];
  [v3 isRTIClient];
  id v2 = TIStatisticGetKey();
  TIStatisticScalarDecrement();
}

+ (void)appAutofillFilled
{
  id v3 = +[UIKeyboardImpl activeInstance];
  [v3 isRTIClient];
  id v2 = TIStatisticGetKey();
  TIStatisticScalarIncrement();
}

+ (void)appAutofillExtraKeyTapped
{
  TIStatisticGetKey();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarIncrement();
}

+ (void)appAutofillCredentialFromSafariUI
{
  TIStatisticGetKey();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarIncrement();
}

+ (void)loginPasswordFromAutofillIncrement
{
  id v3 = +[UIKeyboardImpl activeInstance];
  [v3 isRTIClient];
  id v2 = TIStatisticGetKey();
  TIStatisticScalarIncrement();
}

+ (void)loginPasswordFromKeyboardIncrement
{
  id v3 = +[UIKeyboardImpl activeInstance];
  [v3 isRTIClient];
  id v2 = TIStatisticGetKey();
  TIStatisticScalarIncrement();
}

+ (void)signupPasswordFromAutofillIncrement
{
  TIStatisticGetKey();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarIncrement();
}

+ (void)signupPasswordFromKeyboardIncrement
{
  TIStatisticGetKey();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarIncrement();
}

+ (void)keyboardSupportsTouch:(BOOL)a3
{
  TIStatisticGetKey();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarSetBoolean();
}

+ (void)letterCaseToggleIncrement
{
  TIStatisticGetKey();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarIncrement();
}

+ (void)showVariantsIncrement
{
  TIStatisticGetKey();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarIncrement();
}

+ (void)variantDeleteIncrement
{
  TIStatisticGetKey();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarIncrement();
}

@end