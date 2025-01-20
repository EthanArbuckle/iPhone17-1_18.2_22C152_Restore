@interface UIPlaceholderPredictiveViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_isVisibleForAutocorrectionType:(int64_t)a3;
- (BOOL)hidesExpandableButton;
- (BOOL)isVisibleForInputDelegate:(id)a3 inputViews:(id)a4;
- (BOOL)requiresKeyboard;
- (BOOL)showsRemoteInputDashViewController;
- (NSArray)displayedCandidates;
- (double)preferredHeightForTraitCollection:(id)a3;
- (id)_currentTextSuggestions;
- (void)setShowsRemoteInputDashViewController:(BOOL)a3;
@end

@implementation UIPlaceholderPredictiveViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)_isVisibleForAutocorrectionType:(int64_t)a3
{
  v4 = +[UIKeyboardImpl activeInstance];
  v5 = [v4 autocorrectionController];
  char v6 = [v5 hasContinuousPathConversions];

  v7 = +[UIKeyboardImpl activeInstance];
  uint64_t v8 = [v7 autocorrectionPreferenceForTraits];

  if (a3 == 1) {
    BOOL v9 = v6;
  }
  else {
    BOOL v9 = 1;
  }
  return v8 == 2 || v9;
}

- (id)_currentTextSuggestions
{
  v2 = +[UIKeyboardImpl activeInstance];
  v3 = [v2 autocorrectionController];
  v4 = [v3 textSuggestionList];

  return v4;
}

- (BOOL)isVisibleForInputDelegate:(id)a3 inputViews:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(UIPlaceholderPredictiveViewController *)self showsRemoteInputDashViewController])
  {
    if (!v7)
    {
      BOOL v9 = +[UIPeripheralHost activeInstance];
      id v7 = [v9 loadAwareInputViews];
    }
    if ([v7 isCustomInputView])
    {
      LOBYTE(v8) = 0;
      goto LABEL_36;
    }
    v10 = [(UIPlaceholderPredictiveViewController *)self _currentTextSuggestions];
    v11 = v10;
    if (v10)
    {
      v12 = [v10 predictions];
      uint64_t v13 = [v12 count];

      if (v13)
      {
        LOBYTE(v8) = 1;
LABEL_35:

        goto LABEL_36;
      }
    }
    v14 = +[UIKeyboardImpl activeInstance];
    char v15 = [v14 _showsScribbleIconsInAssistantView];

    if (v15)
    {
      LOBYTE(v8) = 0;
      goto LABEL_35;
    }
    v16 = +[UIKeyboardImpl activeInstance];
    v17 = [v16 textInputTraits];

    if ([v6 conformsToProtocolCached:&unk_1ED431E48])
    {
      v18 = [v6 textInputTraits];
      uint64_t v19 = +[UITextInputTraits traitsByAdoptingTraits:v18];

      v17 = (void *)v19;
    }
    if (!v17)
    {
      if (!+[UIKBInputDelegateManager isAsyncTextInputEnabled](UIKBInputDelegateManager, "isAsyncTextInputEnabled")|| ([v6 conformsToProtocolCached:&unk_1ED700940] & 1) == 0&& !objc_msgSend(v6, "conformsToProtocolCached:", &unk_1ED7009A0)|| (+[UITextInputTraits traitsByAdoptingTraits:](UITextInputTraits, "traitsByAdoptingTraits:", v6), (v17 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        if ([v6 conformsToProtocolCached:&unk_1ED42F658])
        {
          v17 = +[UITextInputTraits traitsByAdoptingTraits:v6];
        }
        else
        {
          v17 = 0;
        }
      }
    }
    if (UIKeyboardAlwaysShowCandidateBarForCurrentInputMode())
    {
      if (([v17 disableInputBars] & 1) == 0)
      {
        int v8 = [v17 hidePrediction] ^ 1;
LABEL_34:

        goto LABEL_35;
      }
    }
    else if (([v17 disablePrediction] & 1) == 0 && (objc_msgSend(v17, "hidePrediction") & 1) == 0)
    {
      v20 = +[UIKeyboardImpl activeInstance];
      if (([v20 disableInputBars] & 1) != 0
        || !-[UIPlaceholderPredictiveViewController _isVisibleForAutocorrectionType:](self, "_isVisibleForAutocorrectionType:", [v17 autocorrectionType]))
      {
      }
      else
      {
        char v21 = [v17 isSecureTextEntry];

        if ((v21 & 1) == 0 && UIKeyboardPredictionEnabledForCurrentInputMode())
        {
          v22 = +[UIKeyboardPreferencesController sharedPreferencesController];
          v23 = [v22 preferencesActions];
          LOBYTE(v8) = [v23 predictionEnabled];

          goto LABEL_34;
        }
      }
    }
    LOBYTE(v8) = 0;
    goto LABEL_34;
  }
  LOBYTE(v8) = 1;
LABEL_36:

  return v8;
}

- (double)preferredHeightForTraitCollection:(id)a3
{
  +[UISystemInputAssistantViewController _defaultPreferredHeightForTraitCollection:a3];
  return result;
}

- (BOOL)hidesExpandableButton
{
  return 0;
}

- (NSArray)displayedCandidates
{
  return 0;
}

- (BOOL)requiresKeyboard
{
  return 1;
}

- (BOOL)showsRemoteInputDashViewController
{
  return self->_showsRemoteInputDashViewController;
}

- (void)setShowsRemoteInputDashViewController:(BOOL)a3
{
  self->_showsRemoteInputDashViewController = a3;
}

@end