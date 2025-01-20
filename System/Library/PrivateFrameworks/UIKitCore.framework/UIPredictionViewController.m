@interface UIPredictionViewController
+ (BOOL)_currentInputModeShowsMultiscriptOrTransliterationCandidates;
- (BOOL)_autocorrectionListContainsContinuousPathConversions:(id)a3;
- (BOOL)_autocorrectionListMayCausePredictionViewToReappear:(id)a3;
- (BOOL)_canShowWhileLocked;
- (BOOL)_isVisibleForAutocorrectionType:(int64_t)a3;
- (BOOL)hidesExpandableButton;
- (BOOL)isVisibleForInputDelegate:(id)a3 inputViews:(id)a4;
- (BOOL)requiresKeyboard;
- (NSArray)displayedCandidates;
- (TIAutocorrectionList)cachedAutocorrectionList;
- (TUIPredictionView)predictionView;
- (UIPredictionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)preferredHeightForTraitCollection:(id)a3;
- (id)_currentTextSuggestions;
- (void)_clearTextSuggestions;
- (void)_inputModeDidChange;
- (void)_performThrottledUpdateUIWithAutocorrectionList:(id)a3;
- (void)_registerAsAutocorrectionObserver;
- (void)_registerForNotifications;
- (void)_throttledUpdateUIWithAutocorrectionList:(id)a3;
- (void)_updateAutocorrectionList:(id)a3;
- (void)autocorrectionController:(id)a3 didUpdateAutocorrectionList:(id)a4;
- (void)autocorrectionControllerDidClearAutocorrections:(id)a3;
- (void)dealloc;
- (void)loadView;
- (void)predictionView:(id)a3 didSelectCandidate:(id)a4;
- (void)setCachedAutocorrectionList:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation UIPredictionViewController

- (UIPredictionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)UIPredictionViewController;
  v4 = [(UIViewController *)&v7 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4) {
    [(UIPredictionViewController *)v4 _registerForNotifications];
  }
  return v5;
}

- (void)dealloc
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v8[0] = @"UITextInputCurrentInputModeDidChangeNotification";
  v8[1] = @"UITextInputResponderDidChangeNotification";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  v5 = +[UIKeyboardImpl activeInstance];
  v6 = [v5 autocorrectionController];
  [v6 removeAutocorrectionObserver:self];

  v7.receiver = self;
  v7.super_class = (Class)UIPredictionViewController;
  [(UIViewController *)&v7 dealloc];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (BOOL)_currentInputModeShowsMultiscriptOrTransliterationCandidates
{
  if (_os_feature_enabled_impl())
  {
    v2 = +[UIKeyboardInputModeController sharedInputModeController];
    v3 = [v2 currentInputMode];
    if ([v3 isMultiscript])
    {

      return 1;
    }
    char v5 = UIKeyboardShowsTransliterationCandidatesForCurrentInputMode();

    if (v5) {
      return 1;
    }
  }
  else if (UIKeyboardShowsTransliterationCandidatesForCurrentInputMode())
  {
    return 1;
  }
  return UIKeyboardCurrentInputModeIsKoreanEnglishBilingual();
}

- (BOOL)_isVisibleForAutocorrectionType:(int64_t)a3
{
  v4 = +[UIKeyboardImpl activeInstance];
  char v5 = [v4 autocorrectionController];
  char v6 = [v5 hasContinuousPathConversions];

  char v7 = [(id)objc_opt_class() _currentInputModeShowsMultiscriptOrTransliterationCandidates];
  v8 = +[UIKeyboardImpl activeInstance];
  uint64_t v9 = [v8 autocorrectionPreferenceForTraits];

  if (a3 == 1) {
    char v10 = v7;
  }
  else {
    char v10 = 1;
  }
  char v11 = v6 | v10;
  if (v9 == 2) {
    return 1;
  }
  else {
    return v11;
  }
}

- (BOOL)isVisibleForInputDelegate:(id)a3 inputViews:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    v8 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    id v7 = [v8 inputViews];
  }
  if (([v7 isCustomInputView] & 1) == 0)
  {
    char v10 = [(UIPredictionViewController *)self _currentTextSuggestions];
    char v11 = v10;
    if (v10)
    {
      v12 = [v10 predictions];
      uint64_t v13 = [v12 count];

      if (v13) {
        goto LABEL_14;
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = v6;
      int v15 = +[UIKeyboardCameraSession shouldShowTextSuggestionForResponder:](UIKeyboardCameraSession, "shouldShowTextSuggestionForResponder:", v14)? [v14 hasText]: 1;
      v16 = +[UIKeyboardImpl activeInstance];
      char v17 = [v16 _showsScribbleIconsInAssistantView];

      char v9 = v17 ^ 1;
      if ((v17 & 1) != 0 || !v15) {
        goto LABEL_45;
      }
    }
    v18 = +[UIKeyboardImpl activeInstance];
    v19 = [v18 autocorrectionController];
    char v20 = [v19 hasAutofillCandidates];

    if (v20)
    {
LABEL_14:
      char v9 = 1;
LABEL_45:

      goto LABEL_46;
    }
    v21 = +[UIKeyboardImpl activeInstance];
    if ([v21 textInputTraitsNeedAutofill])
    {
      v22 = +[UIKeyboardImpl activeInstance];
      if (![v22 textInputTraitsNeedOneTimeCode])
      {
        v28 = +[UIKeyboardImpl activeInstance];
        char v29 = [v28 textInputTraitsNeedContactAutoFill];

        if ((v29 & 1) == 0)
        {
          char v9 = 0;
          goto LABEL_45;
        }
LABEL_19:
        v23 = +[UIKeyboardImpl activeInstance];
        v24 = [v23 textInputTraits];

        if ([v6 conformsToProtocolCached:&unk_1ED431E48])
        {
          v25 = [v6 textInputTraits];
          uint64_t v26 = +[UITextInputTraits traitsByAdoptingTraits:v25];

          v24 = (void *)v26;
        }
        if (!v24
          && +[UIKBInputDelegateManager isAsyncTextInputEnabled](UIKBInputDelegateManager, "isAsyncTextInputEnabled")&& ([v6 conformsToProtocolCached:&unk_1ED700940] & 1) != 0|| objc_msgSend(v6, "conformsToProtocolCached:", &unk_1ED7009A0))
        {
          uint64_t v27 = +[UITextInputTraits traitsByAdoptingTraits:v6];

          v24 = (void *)v27;
        }
        if (!v24)
        {
          if ([v6 conformsToProtocolCached:&unk_1ED42F658])
          {
            v24 = +[UITextInputTraits traitsByAdoptingTraits:v6];
          }
          else
          {
            v24 = 0;
          }
        }
        if ([v24 hidePrediction])
        {
          char v9 = 0;
LABEL_44:

          goto LABEL_45;
        }
        v30 = +[UIKeyboardImpl activeInstance];
        v31 = [v30 autocorrectionController];
        char v32 = [v31 hasProactiveCandidates];

        if (v32)
        {
          char v9 = 1;
          goto LABEL_44;
        }
        v33 = [(UIViewController *)self view];
        v34 = [v33 _rootInputWindowController];

        if (!v34)
        {
          v35 = +[_UIRemoteKeyboards sharedRemoteKeyboards];
          v36 = [v35 keyboardWindow];
          v34 = [v36 rootViewController];
        }
        v37 = [v34 placement];
        if (([v37 isFloatingAssistantView] & 1) == 0
          && +[UIKeyboardImpl isSplit])
        {
          goto LABEL_40;
        }
        unsigned int v38 = [v24 keyboardType];
        char v9 = 0;
        if (v38 <= 0xB && ((1 << v38) & 0x930) != 0 || v38 == 127) {
          goto LABEL_43;
        }
        v40 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
        v41 = [v40 visualModeManager];
        if ([v41 windowingModeEnabled])
        {
          [(UIViewController *)self traitCollection];
          v42 = v51 = v40;
          uint64_t v50 = [v42 userInterfaceIdiom];

          if (v50 != 6)
          {
            v43 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
            v44 = [v43 visualModeManager];
            int v52 = [v44 useVisualModeWindowed];

            if (v52)
            {
              char v45 = [v37 isFloatingAssistantView];
              int v46 = 0;
              if (!v37 || (v45 & 1) != 0)
              {
LABEL_57:
                if ((objc_msgSend(v24, "disablePrediction", v50) & 1) == 0
                  && ([v24 hidePrediction] & 1) == 0)
                {
                  v47 = +[UIKeyboardImpl activeInstance];
                  if (([v47 disableInputBars] & 1) != 0
                    || !-[UIPredictionViewController _isVisibleForAutocorrectionType:](self, "_isVisibleForAutocorrectionType:", [v24 autocorrectionType]))
                  {
                    char v9 = 0;
LABEL_65:

                    goto LABEL_43;
                  }
                  unsigned int v48 = v46 & ~[v24 isSecureTextEntry];

                  if (v48 == 1)
                  {
                    if ([(id)objc_opt_class() _currentInputModeShowsMultiscriptOrTransliterationCandidates])
                    {
                      char v9 = 1;
                      goto LABEL_43;
                    }
                    if (UIKeyboardPredictionEnabledForCurrentInputMode())
                    {
                      v47 = +[UIKeyboardPreferencesController sharedPreferencesController];
                      v49 = [v47 preferencesActions];
                      char v9 = [v49 predictionEnabled];

                      goto LABEL_65;
                    }
                  }
                }
LABEL_40:
                char v9 = 0;
LABEL_43:

                goto LABEL_44;
              }
              if (([v37 isFloating] & 1) == 0)
              {
                int v46 = [v37 showsInputOrAssistantViews];
                goto LABEL_57;
              }
            }
          }
        }
        else
        {
        }
        int v46 = 1;
        goto LABEL_57;
      }
    }
    goto LABEL_19;
  }
  char v9 = 0;
LABEL_46:

  return v9;
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

- (BOOL)requiresKeyboard
{
  return 1;
}

- (id)_currentTextSuggestions
{
  v2 = +[UIKeyboardImpl activeInstance];
  v3 = [v2 autocorrectionController];
  v4 = [v3 textSuggestionList];

  return v4;
}

- (void)_clearTextSuggestions
{
  id v3 = +[UIKeyboardImpl activeInstance];
  v2 = [v3 autocorrectionController];
  [v2 setTextSuggestionList:0];
}

- (void)_registerForNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__inputModeDidChange name:@"UITextInputCurrentInputModeDidChangeNotification" object:0];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel__inputResponderDidChangeNotification_ name:@"UITextInputResponderDidChangeNotification" object:0];
}

- (void)_inputModeDidChange
{
  id v3 = UIKeyboardGetCurrentInputMode();
  id v5 = +[UIKeyboardInputMode keyboardInputModeWithIdentifier:v3];

  id v4 = [v5 locale];
  [(TUIPredictionView *)self->_predictionView setCurrentLocale:v4];
}

- (void)loadView
{
  uint64_t v9 = 0;
  char v10 = &v9;
  uint64_t v11 = 0x2050000000;
  id v3 = (void *)_MergedGlobals_9_9;
  uint64_t v12 = _MergedGlobals_9_9;
  if (!_MergedGlobals_9_9)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __getTUIPredictionViewClass_block_invoke_0;
    void v8[3] = &unk_1E52D9900;
    v8[4] = &v9;
    __getTUIPredictionViewClass_block_invoke_0((uint64_t)v8);
    id v3 = (void *)v10[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v9, 8);
  id v5 = [v4 alloc];
  id v6 = (TUIPredictionView *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  predictionView = self->_predictionView;
  self->_predictionView = v6;

  [(TUIPredictionView *)self->_predictionView setDelegate:self];
  [(UIPredictionViewController *)self _inputModeDidChange];
  [(UIViewController *)self setView:self->_predictionView];
}

- (void)viewWillAppear:(BOOL)a3
{
  [(UIPredictionViewController *)self _registerAsAutocorrectionObserver];
  id v4 = +[UIKeyboardImpl activeInstance];
  uint64_t v11 = [v4 autocorrectionController];

  int v5 = [v11 hasAutocorrection];
  id v6 = v11;
  if (v5)
  {
    id v7 = [v11 autocorrectionList];
    v8 = v7;
    if (v7) {
      id v9 = v7;
    }
    else {
      id v9 = objc_alloc_init(MEMORY[0x1E4FAE278]);
    }
    char v10 = v9;

    [(UIPredictionViewController *)self _updateAutocorrectionList:v10];
    id v6 = v11;
  }
}

- (NSArray)displayedCandidates
{
  if (objc_opt_respondsToSelector())
  {
    id v3 = [(TUIPredictionView *)self->_predictionView displayedCandidates];
  }
  else
  {
    id v3 = 0;
  }
  return (NSArray *)v3;
}

- (BOOL)_autocorrectionListContainsContinuousPathConversions:(id)a3
{
  id v3 = a3;
  id v4 = [v3 autocorrection];
  if ([v4 isContinuousPathConversion])
  {
    BOOL v5 = 1;
  }
  else
  {
    id v6 = [v3 predictions];
    id v7 = [v6 indexesOfObjectsPassingTest:&__block_literal_global_669];
    BOOL v5 = [v7 count] != 0;
  }
  return v5;
}

uint64_t __83__UIPredictionViewController__autocorrectionListContainsContinuousPathConversions___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 isContinuousPathConversion];
  *a4 = result;
  return result;
}

- (void)_performThrottledUpdateUIWithAutocorrectionList:(id)a3
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [MEMORY[0x1E4F1C9C8] date];
  lastUIUpdateTime = self->_lastUIUpdateTime;
  self->_lastUIUpdateTime = v5;

  [(NSTimer *)self->_updateUITimer invalidate];
  updateUITimer = self->_updateUITimer;
  self->_updateUITimer = 0;

  v8 = +[UIKeyboardImpl activeInstance];
  uint64_t v9 = [v8 autocorrectionPreferenceForTraits];

  char v10 = +[UIKeyboardImpl activeInstance];
  [v10 resetSmartReplyFeedbackUIIfAlreadyShown];

  uint64_t v11 = +[UIKeyboardImpl activeInstance];
  uint64_t v12 = [v11 delegateAsResponder];
  uint64_t v13 = [v12 _trailingPredictiveCandidateForWritingTools];

  if (v13)
  {
    id v14 = [v4 predictions];
    if (v14)
    {
      int v15 = [v4 predictions];
      v16 = [v15 arrayByAddingObject:v13];
    }
    else
    {
      v35[0] = v13;
      v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
    }

    char v17 = (void *)MEMORY[0x1E4FAE278];
    v18 = [v4 corrections];
    v19 = [v4 emojiList];
    uint64_t v20 = [v17 listWithCorrections:v18 predictions:v16 emojiList:v19];

    id v4 = (id)v20;
  }
  v21 = [MEMORY[0x1E4FAE300] textEffectsButtonCandidate];
  if (v21)
  {
    v22 = [v4 predictions];
    if (v22)
    {
      v23 = [v4 predictions];
      v24 = [v23 arrayByAddingObject:v21];
    }
    else
    {
      v34 = v21;
      v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
    }

    v25 = (void *)MEMORY[0x1E4FAE278];
    uint64_t v26 = [v4 corrections];
    uint64_t v27 = [v4 emojiList];
    uint64_t v28 = [v25 listWithCorrections:v26 predictions:v24 emojiList:v27];

    id v4 = (id)v28;
  }
  if (v9 == 2)
  {
    char v29 = [v4 autocorrection];
    if ([v29 isContinuousPathConversion])
    {
      uint64_t v30 = 0;
    }
    else
    {
      v31 = [v4 autocorrection];
      uint64_t v30 = [v31 isForShortcutConversion] ^ 1;
    }
  }
  else
  {
    uint64_t v30 = 0;
  }
  char v32 = [(UIPredictionViewController *)self predictionView];
  [v32 setDisablesHighlight:v30];

  v33 = [(UIPredictionViewController *)self predictionView];
  [v33 setAutocorrectionList:v4 animated:1];
}

- (void)_throttledUpdateUIWithAutocorrectionList:(id)a3
{
  id v4 = a3;
  if (([v4 containsAutofillCandidates] & 1) == 0
    && ([v4 containsProactiveTriggers] & 1) == 0
    && [v4 notEmpty]
    && [(TIAutocorrectionList *)self->_cachedAutocorrectionList notEmpty])
  {
    BOOL v5 = [MEMORY[0x1E4F1C9C8] date];
    id v6 = v5;
    if (self->_lastUIUpdateTime)
    {
      objc_msgSend(v5, "timeIntervalSinceDate:");
      double v8 = v7;
    }
    else
    {
      double v8 = 1.79769313e308;
    }
    if ([(UIPredictionViewController *)self _autocorrectionListContainsContinuousPathConversions:v4])
    {
      double v9 = 0.05 - v8;

LABEL_10:
      [(NSTimer *)self->_updateUITimer invalidate];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __71__UIPredictionViewController__throttledUpdateUIWithAutocorrectionList___block_invoke;
      v21[3] = &unk_1E52EC0A8;
      v21[4] = self;
      char v10 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:0 repeats:v21 block:v9];
      updateUITimer = self->_updateUITimer;
      self->_updateUITimer = v10;

      goto LABEL_16;
    }
    uint64_t v12 = [v4 predictions];
    uint64_t v13 = [v12 count];

    double v9 = 0.22;
    if (!v13 || v8 < 0.22) {
      goto LABEL_10;
    }
  }
  [(UIPredictionViewController *)self _performThrottledUpdateUIWithAutocorrectionList:v4];
  id v14 = +[UIDevice currentDevice];
  uint64_t v15 = [v14 userInterfaceIdiom];

  if (!v15)
  {
    v16 = +[UIKeyboardImpl activeInstance];
    int v17 = [v16 isMinimized];

    if (v17)
    {
      v18 = +[UIKeyboardImpl activeInstance];
      v19 = [v18 _textChoicesAssistant];
      uint64_t v20 = [v4 predictions];
      [v19 showChoicesForCandidates:v20];
    }
  }
LABEL_16:
}

uint64_t __71__UIPredictionViewController__throttledUpdateUIWithAutocorrectionList___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performThrottledUpdateUIWithAutocorrectionList:*(void *)(*(void *)(a1 + 32) + 1000)];
}

- (void)_registerAsAutocorrectionObserver
{
  id v4 = +[UIKeyboardImpl activeInstance];
  id v3 = [v4 autocorrectionController];
  [v3 addAutocorrectionObserver:self];
}

- (BOOL)_autocorrectionListMayCausePredictionViewToReappear:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[UIKeyboardImpl activeInstance];
  id v6 = [v5 textInputTraits];

  if ([v4 containsAutofillCandidates]) {
    goto LABEL_2;
  }
  if ([v6 autocorrectionType] != 1)
  {
LABEL_7:
    char v7 = 0;
    goto LABEL_8;
  }
  int v8 = [(TIAutocorrectionList *)self->_cachedAutocorrectionList containsContinuousPathConversions];
  if (v8 == [v4 containsContinuousPathConversions])
  {
    if ([v4 containsContinuousPathConversions])
    {
      double v9 = [(UIPredictionViewController *)self predictionView];
      char v7 = [v9 isHidden];

      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_2:
  char v7 = 1;
LABEL_8:

  return v7;
}

- (void)_updateAutocorrectionList:(id)a3
{
  id obj = a3;
  id v4 = [(UIPredictionViewController *)self _currentTextSuggestions];
  BOOL v5 = v4;
  if (v4)
  {
    id v6 = [v4 predictions];
    uint64_t v7 = [v6 count];

    if (v7)
    {
      if ([v5 isShowingSuggestionForKeyboardCamera])
      {
        [(UIPredictionViewController *)self _clearTextSuggestions];
      }
      else
      {
        id v8 = v5;

        id obj = v8;
      }
    }
  }
  BOOL v9 = [(UIPredictionViewController *)self _autocorrectionListMayCausePredictionViewToReappear:obj];
  [(UIPredictionViewController *)self _throttledUpdateUIWithAutocorrectionList:obj];
  objc_storeStrong((id *)&self->_cachedAutocorrectionList, obj);
  if (v9)
  {
    char v10 = +[UIKBKeyplaneChangeContext keyplaneChangeContext];
    [v10 setUpdateAssistantView:1];
    uint64_t v11 = [(UIPredictionViewController *)self predictionView];
    [v11 _didChangeKeyplaneWithContext:v10];

    +[UIView performWithoutAnimation:&__block_literal_global_843];
  }
}

uint64_t __56__UIPredictionViewController__updateAutocorrectionList___block_invoke()
{
  return +[UIAssistantBarButtonItemProvider updateFloatingAssistantBarIfNeeded];
}

- (void)autocorrectionController:(id)a3 didUpdateAutocorrectionList:(id)a4
{
}

- (void)autocorrectionControllerDidClearAutocorrections:(id)a3
{
}

- (void)predictionView:(id)a3 didSelectCandidate:(id)a4
{
  id v21 = a3;
  id v5 = a4;
  id v6 = +[UIKeyboardImpl activeInstance];
  [v6 updateIdleDetection:0];

  uint64_t v7 = +[UIKeyboardImpl activeInstance];
  id v8 = [v7 feedbackGenerator];
  BOOL v9 = [v21 allVisibleCells];
  char v10 = objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v21, "selectedIndex"));
  [v10 center];
  objc_msgSend(v8, "actionOccurred:atLocation:", 10);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = [v5 replacement];
    if (!v11)
    {
LABEL_10:

      goto LABEL_11;
    }
    uint64_t v12 = +[UIKeyboardImpl activeInstance];
    uint64_t v13 = [v12 delegateAsResponder];
    id v14 = [v13 _responderForEditing];

    uint64_t v15 = [v14 targetForAction:sel_replace_ withSender:v11];

    [v15 performSelector:sel_replace_ withObject:v11];
LABEL_9:

    goto LABEL_10;
  }
  v16 = +[UIKeyboardImpl activeInstance];
  [v16 acceptPredictiveInput:v5];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v17 = [v21 autocorrectionList];
    id v18 = [v17 autocorrection];
    BOOL v19 = v18 == v5;

    +[_UIKeyboardUsageTracking selectedPredictiveInputCandidate:isAutocorrection:index:](_UIKeyboardUsageTracking, "selectedPredictiveInputCandidate:isAutocorrection:index:", v5, v19, [v21 selectedIndex]);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && ([v5 candidateProperty] & 0x20) != 0)
  {
    uint64_t v11 = +[UIDictationController activeInstance];
    uint64_t v15 = [v5 input];
    uint64_t v20 = [v21 displayedCandidates];
    objc_msgSend(v11, "logEuclidSelection:suggestedTokens:correctedToken:selectedIndex:", v15, v20, v5, objc_msgSend(v21, "selectedIndex"));

    goto LABEL_9;
  }
LABEL_11:
}

- (TUIPredictionView)predictionView
{
  return self->_predictionView;
}

- (TIAutocorrectionList)cachedAutocorrectionList
{
  return self->_cachedAutocorrectionList;
}

- (void)setCachedAutocorrectionList:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedAutocorrectionList, 0);
  objc_storeStrong((id *)&self->_predictionView, 0);
  objc_storeStrong((id *)&self->_lastUIUpdateTime, 0);
  objc_storeStrong((id *)&self->_updateUITimer, 0);
}

@end