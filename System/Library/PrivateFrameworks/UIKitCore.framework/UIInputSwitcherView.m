@interface UIInputSwitcherView
+ (BOOL)canShowKeyboardSettings;
+ (UIInputSwitcherView)sharedInstance;
+ (id)activeInstance;
- (BOOL)_canAddLaunchItem;
- (BOOL)_isHandBiasSwitchVisible;
- (BOOL)didHitDockItemWithinTypingWindow;
- (BOOL)fileReportFromSwitcher;
- (BOOL)isForDictation;
- (BOOL)messagesWriteboardFromSwitcher;
- (BOOL)shouldSelectItemAtIndex:(unint64_t)a3;
- (BOOL)shouldShow;
- (BOOL)shouldShowSelectionExtraViewForIndexPath:(id)a3;
- (BOOL)showsSwitches;
- (BOOL)usesDeviceLanguageForItemAtIndex:(unint64_t)a3;
- (CGSize)preferredSize;
- (NSArray)inputModes;
- (UIInputSwitcherView)initWithFrame:(CGRect)a3;
- (id)_itemWithIdentifier:(id)a3;
- (id)buttonPressed:(id)a3 withEvent:(id)a4 location:(CGPoint)a5 isForDictation:(BOOL)a6 tapAction:(id)a7;
- (id)buttonPressed:(id)a3 withEvent:(id)a4 location:(CGPoint)a5 isLocationInsideViewHitArea:(BOOL)a6 isForDictation:(BOOL)a7 tapAction:(id)a8;
- (id)defaultInputMode;
- (id)finishSplitTransitionBlock;
- (id)fontForItemAtIndex:(unint64_t)a3;
- (id)localizedTitleForItemAtIndex:(unint64_t)a3;
- (id)nextInputMode;
- (id)previousInputMode;
- (id)selectedInputMode;
- (id)subtitleFontForItemAtIndex:(unint64_t)a3;
- (id)subtitleForItemAtIndex:(unint64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)titleForItemAtIndex:(unint64_t)a3;
- (int64_t)_indexOfFastSwitchToggleModeForIdentifier:(id)a3;
- (int64_t)_indexOfInputSwitcherItemWithIdentifier:(id)a3;
- (unint64_t)defaultSelectedIndex;
- (unint64_t)numberOfItems;
- (void)_reloadInputSwitcherItems;
- (void)_segmentControlValueDidChange:(id)a3;
- (void)customizeCell:(id)a3 forItemAtIndex:(unint64_t)a4;
- (void)didFinishSplitTransition;
- (void)didSelectItemAtIndex:(unint64_t)a3;
- (void)didShow;
- (void)fadeWithDelay:(double)a3;
- (void)reloadInputModes;
- (void)removeFromSuperview;
- (void)reportHandBiasToAnalytics:(int64_t)a3;
- (void)returnToKeyboardIfNeeded;
- (void)selectInputMode:(id)a3;
- (void)selectNextInputMode;
- (void)selectPreviousInputMode;
- (void)selectRowForInputMode:(id)a3;
- (void)setFileReportFromSwitcher:(BOOL)a3;
- (void)setFinishSplitTransitionBlock:(id)a3;
- (void)setInputMode:(id)a3;
- (void)setIsForDictation:(BOOL)a3;
- (void)setMessagesWriteboardFromSwitcher:(BOOL)a3;
- (void)setShowsSwitches:(BOOL)a3;
- (void)showAsPopupForKey:(id)a3 inLayout:(id)a4;
- (void)switchAction;
- (void)toggleKeyboardFloatingPreference;
- (void)updateSelectionWithPoint:(CGPoint)a3;
- (void)willFade;
- (void)willFadeForSelectionAtIndex:(unint64_t)a3;
@end

@implementation UIInputSwitcherView

- (UIInputSwitcherView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)UIInputSwitcherView;
  v3 = -[UIKeyboardMenuView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    m_inputModes = v3->m_inputModes;
    v3->m_inputModes = v4;

    m_table = v3->super.m_table;
    uint64_t v7 = objc_opt_class();
    v8 = +[UIInputSwitcherTableCell reuseIdentifier];
    [(UITableView *)m_table registerClass:v7 forCellReuseIdentifier:v8];

    [(UIInputSwitcherView *)v3 setShowsSwitches:1];
    v9 = v3;
  }

  return v3;
}

+ (UIInputSwitcherView)sharedInstance
{
  v2 = (void *)gSharedInputSwitcher;
  if (!gSharedInputSwitcher)
  {
    v3 = [UIInputSwitcherView alloc];
    uint64_t v4 = -[UIInputSwitcherView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v5 = (void *)gSharedInputSwitcher;
    gSharedInputSwitcher = v4;

    v2 = (void *)gSharedInputSwitcher;
  }
  return (UIInputSwitcherView *)v2;
}

+ (id)activeInstance
{
  return (id)gSharedInputSwitcher;
}

- (void)setIsForDictation:(BOOL)a3
{
  self->_isForDictation = a3;
  if (a3)
  {
    [(UIKeyboardMenuView *)self setGlomojiAnalyticsInstance:0];
  }
  else
  {
    uint64_t v4 = [(UIKeyboardMenuView *)self glomojiAnalyticsInstance];

    if (!v4)
    {
      v5 = objc_alloc_init(UIGlomojiAnalyticsDispatcher);
      [(UIKeyboardMenuView *)self setGlomojiAnalyticsInstance:v5];
    }
  }
}

- (void)didFinishSplitTransition
{
  v3 = [(UIInputSwitcherView *)self finishSplitTransitionBlock];

  if (v3)
  {
    uint64_t v4 = [(UIInputSwitcherView *)self finishSplitTransitionBlock];
    v4[2]();

    [(UIInputSwitcherView *)self setFinishSplitTransitionBlock:0];
  }
}

- (void)reloadInputModes
{
  v2 = self;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  [(NSMutableArray *)self->m_inputModes removeAllObjects];
  v3 = off_1E52D4000;
  uint64_t v4 = +[UIKeyboardInputModeController sharedInputModeController];
  [v4 _clearAllExtensionsIfNeeded];

  v5 = +[UIKeyboardImpl activeInstance];
  int v6 = [v5 isMinimized];

  if ([(UIInputSwitcherView *)v2 isForDictation])
  {
    m_inputModes = v2->m_inputModes;
    id v8 = +[UIKeyboardInputModeController sharedInputModeController];
    v9 = [v8 enabledDictationLanguages];
    [(NSMutableArray *)m_inputModes addObjectsFromArray:v9];

LABEL_19:
    goto LABEL_20;
  }
  if (!v6)
  {
    v25 = v2->m_inputModes;
    id v8 = (id)UIKeyboardActiveInputModes;
    [(NSMutableArray *)v25 addObjectsFromArray:v8];
    goto LABEL_19;
  }
  v26 = v2;
  v10 = UIKeyboardGetActiveUniqueInputModesForHardwareKeyboard();
  objc_super v11 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  v12 = [v11 inputViews];
  int v13 = [v12 isCustomInputView];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v10;
  uint64_t v14 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v29 != v16) {
          objc_enumerationMutation(obj);
        }
        v18 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        v19 = v3;
        v20 = [(__objc2_class *)v3[14] sharedInputModeController];
        v21 = [v20 inputModeWithIdentifier:v18];

        if (!v13
          || ([v21 hardwareLayout],
              v22 = objc_claimAutoreleasedReturnValue(),
              v22,
              v22))
        {
          if (([v18 hasPrefix:@"emoji"] & 1) == 0
            && ![v18 containsString:@"HWR"]
            || (+[UIKeyboardImpl activeInstance],
                v23 = objc_claimAutoreleasedReturnValue(),
                char v24 = [v23 isEmojiPopoverPresented],
                v23,
                (v24 & 1) == 0))
          {
            [(NSMutableArray *)v26->m_inputModes addObject:v18];
          }
        }

        v3 = v19;
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v15);
  }

  v2 = v26;
LABEL_20:
  [(NSMutableArray *)v2->m_inputModes removeObject:@"autofillsignup"];
}

- (BOOL)_canAddLaunchItem
{
  return 1;
}

+ (BOOL)canShowKeyboardSettings
{
  v2 = +[UIKeyboard keyboardBundleIdentifier];
  if (([v2 isEqualToString:@"com.apple.Preferences"] & 1) != 0
    || ([v2 isEqualToString:@"com.apple.purplebuddy"] & 1) != 0)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    int v3 = [v2 isEqualToString:@"com.apple.CheckerBoard"] ^ 1;
  }
  uint64_t v4 = +[UIKeyboardInputModeController sharedInputModeController];
  char v5 = [v4 deviceStateIsLocked];

  return v3 & (v5 ^ 1);
}

- (void)_reloadInputSwitcherItems
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  if (self->super.m_mode)
  {
    BOOL v3 = 0;
  }
  else
  {
    uint64_t v4 = [(UIKeyboardMenuView *)self inputView];
    BOOL v3 = v4 == 0;
  }
  v64 = [MEMORY[0x1E4F1CA48] array];
  char v5 = +[UIKeyboardInputModeController sharedInputModeController];
  int v58 = [v5 deviceStateIsLocked];

  int v6 = +[UIKeyboardInputModeController sharedInputModeController];
  uint64_t v7 = [v6 currentInputMode];
  int v60 = [v7 isExtensionInputMode];

  if ([(id)objc_opt_class() canShowKeyboardSettings]
    && !v3
    && [(UIInputSwitcherView *)self _canAddLaunchItem])
  {
    if ([(UIInputSwitcherView *)self isForDictation])
    {
      id v8 = +[UIInputSwitcherItem switcherItemWithIdentifier:@"launchdictationsettings"];
      v9 = @"Dictation Settings…";
    }
    else
    {
      id v8 = +[UIInputSwitcherItem switcherItemWithIdentifier:@"launchkeyboardsettings"];
      v9 = @"Keyboard Settings…";
    }
    v10 = _UILocalizedStringInSystemLanguage(v9, v9);
    [v8 setLocalizedTitle:v10];

    [v8 setUsesDeviceLanguage:1];
    [(NSArray *)v64 addObject:v8];
  }
  [(UIInputSwitcherView *)self reloadInputModes];
  BOOL v59 = v3;
  if (_os_feature_enabled_impl())
  {
    v61 = [MEMORY[0x1E4F1CA48] array];
  }
  else
  {
    v61 = 0;
  }
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id obj = self->m_inputModes;
  uint64_t v11 = [(NSMutableArray *)obj countByEnumeratingWithState:&v66 objects:v71 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v65 = *(void *)v67;
    uint64_t v62 = *MEMORY[0x1E4F1C438];
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v67 != v65) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(id *)(*((void *)&v66 + 1) + 8 * i);
        uint64_t v15 = v14;
        if (!_os_feature_enabled_impl()) {
          goto LABEL_26;
        }
        if (TIInputModeIsMultilingualOnly()) {
          goto LABEL_46;
        }
        uint64_t v16 = TIInputModeGetMultilingualSet();
        if ((unint64_t)[v16 count] < 2)
        {
          uint64_t v15 = v14;
          goto LABEL_25;
        }
        uint64_t v15 = [v16 firstObject];

        v17 = TIInputModeGetMultilingualID();
        if (([v61 containsObject:v17] & 1) == 0)
        {
          [v61 addObject:v17];
          uint64_t v18 = +[UIKeyboardInputModeController multilingualSetForInputModeIdentifier:v14];

          uint64_t v16 = (void *)v18;
LABEL_25:

LABEL_26:
          uint64_t v16 = +[UIInputSwitcherItem switcherItemWithIdentifier:v15];
          BOOL v19 = [(UIInputSwitcherView *)self isForDictation];
          v20 = +[UIKeyboardInputModeController sharedInputModeController];
          v21 = v20;
          if (v19)
          {
            uint64_t v22 = [v20 keyboardLanguageForDictationLanguage:v14];
            v23 = (void *)v22;
            if (v22) {
              char v24 = (void *)v22;
            }
            else {
              char v24 = v14;
            }
            id v25 = v24;

            v26 = +[UIKeyboardInputModeController sharedInputModeController];
            v17 = [v26 inputModeWithIdentifier:v25];

            v27 = UIKeyboardLocalizedDictationDisplayName(v14);
          }
          else
          {
            v17 = [v20 inputModeWithIdentifier:v15];

            if (_os_feature_enabled_impl() && (unint64_t)[0 count] >= 2)
            {
              uint64_t v28 = [v17 displayName];
            }
            else
            {
              uint64_t v28 = [v17 extendedDisplayName];
            }
            v27 = (void *)v28;
          }
          [v16 setLocalizedTitle:v27];

          if (UIKeyboardRequiresFontFallbacksForInputMode())
          {
            long long v29 = [(UIKeyboardMenuView *)self font];
            long long v30 = [(UIKeyboardMenuView *)self font];
            [v30 pointSize];
            objc_msgSend(v16, "setTitleFont:", UIKBCTFontForInputMode(v15, v29, v31));

            v32 = [(UIKeyboardMenuView *)self subtitleFont];
            uint64_t v33 = [(UIKeyboardMenuView *)self subtitleFont];
            [v33 pointSize];
            objc_msgSend(v16, "setSubtitleFont:", UIKBCTFontForInputMode(v15, v32, v34));
          }
          if ([v17 isExtensionInputMode])
          {
            v35 = [v17 primaryLanguage];
            uint64_t v36 = [v35 length];

            if (v36)
            {
              v37 = [MEMORY[0x1E4F1CA20] preferredLocale];
              v38 = [v17 primaryLanguage];
              v39 = [v37 displayNameForKey:v62 value:v38];
              [v16 setLocalizedSubtitle:v39];

              goto LABEL_43;
            }
          }
          else
          {
            v40 = [(UIInputSwitcherView *)self inputModes];
            v41 = UIKeyboardInputModesMatchingMode((uint64_t)v15, v40);
            unint64_t v42 = [v41 count];

            if (v42 >= 2)
            {
              v37 = UIKeyboardLocalizedSWLayoutName(v15);
              [v16 setLocalizedSubtitle:v37];
LABEL_43:
            }
          }
          [(NSArray *)v64 addObject:v16];
        }

        id v14 = v15;
LABEL_46:
      }
      uint64_t v12 = [(NSMutableArray *)obj countByEnumeratingWithState:&v66 objects:v71 count:16];
    }
    while (v12);
  }

  if ([(UIInputSwitcherView *)self isForDictation]
    && os_variant_has_internal_diagnostics())
  {
    v52 = +[UIInputSwitcherItem switcherItemWithIdentifier:@"launchdictationfeedback"];
    v53 = _UILocalizedStringInSystemLanguage(@"Dictation Feedback", @"Dictation Feedback");
    [v52 setLocalizedTitle:v53];

    [v52 setUsesDeviceLanguage:1];
    [(NSArray *)v64 addObject:v52];
  }
  if ((([(UIInputSwitcherView *)self isForDictation] | v58 | v59) & 1) == 0)
  {
    if (os_variant_has_internal_diagnostics())
    {
      v54 = TIGetTypoTrackerButtonValue();
      int v55 = [v54 BOOLValue];

      if (v55)
      {
        v56 = +[UIInputSwitcherItem switcherItemWithIdentifier:@"reporttotypotracker"];
        v57 = _UILocalizedStringInSystemLanguage(@"Keyboard Feedback…", @"Keyboard Feedback…");
        [v56 setLocalizedTitle:v57];

        [v56 setUsesDeviceLanguage:1];
        [(NSArray *)v64 addObject:v56];
      }
    }
  }
  if ((([(UIInputSwitcherView *)self isForDictation] | v60) & 1) == 0)
  {
    if ([(UIInputSwitcherView *)self _isHandBiasSwitchVisible])
    {
      v43 = +[UIKeyboardImpl activeInstance];
      char v44 = [v43 isTrackpadMode];

      if ((v44 & 1) == 0)
      {
        v45 = +[UIInputSwitcherItem switcherItemWithIdentifier:@"handbiasswitch"];
        [v45 setLocalizedTitle:&stru_1ED0E84C0];
        v46 = +[UIImageSymbolConfiguration configurationWithPointSize:26.0];
        v47 = +[UIImage systemImageNamed:@"keyboard.onehanded.left" withConfiguration:v46];
        v70[0] = v47;
        v48 = +[UIImage systemImageNamed:@"keyboard" withConfiguration:v46];
        v70[1] = v48;
        v49 = +[UIImage systemImageNamed:@"keyboard.onehanded.right" withConfiguration:v46];
        v70[2] = v49;
        v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:3];
        [v45 setSegmentImages:v50];

        [v45 setPersistentSelectedIndex:&__block_literal_global_313];
        [(NSArray *)v64 addObject:v45];
      }
    }
  }
  m_inputSwitcherItems = self->m_inputSwitcherItems;
  self->m_inputSwitcherItems = v64;
}

uint64_t __48__UIInputSwitcherView__reloadInputSwitcherItems__block_invoke()
{
  v0 = +[UIKeyboardImpl activeInstance];
  v1 = [v0 _layout];
  uint64_t v2 = [v1 currentHandBias];
  for (uint64_t i = 0; i != 3; ++i)
  {
    if (__handBiasOrdering[i] == v2) {
      break;
    }
  }

  return i;
}

- (void)toggleKeyboardFloatingPreference
{
  +[UIKeyboardImpl isFloating];
  id v3 = (id)objc_opt_new();
  [v3 actionForMenu:self];
}

- (id)selectedInputMode
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(UIInputSwitcherView *)self defaultSelectedIndex];
  uint64_t v4 = [(UITableView *)self->super.m_table indexPathForSelectedRow];
  char v5 = v4;
  if (v4) {
    unint64_t v3 = [v4 row];
  }
  if ([(UIKeyboardMenuView *)self showingCapsLockSwitcher]) {
    unint64_t v3 = [(UIKeyboardMenuView *)self indexForSelectedFastSwitchMode];
  }
  if (v3 >= [(NSArray *)self->m_inputSwitcherItems count])
  {
    if (os_variant_has_internal_diagnostics())
    {
      uint64_t v11 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        m_inputSwitcherItems = self->m_inputSwitcherItems;
        int v13 = 134218242;
        unint64_t v14 = v3;
        __int16 v15 = 2112;
        uint64_t v16 = m_inputSwitcherItems;
        _os_log_fault_impl(&dword_1853B0000, v11, OS_LOG_TYPE_FAULT, "Attempted to select an out-of-bounds index path (%lu) in %@", (uint8_t *)&v13, 0x16u);
      }
    }
    else
    {
      id v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &selectedInputMode___s_category) + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = self->m_inputSwitcherItems;
        int v13 = 134218242;
        unint64_t v14 = v3;
        __int16 v15 = 2112;
        uint64_t v16 = v9;
        _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "Attempted to select an out-of-bounds index path (%lu) in %@", (uint8_t *)&v13, 0x16u);
      }
    }
    uint64_t v7 = [(UIInputSwitcherView *)self defaultInputMode];
  }
  else
  {
    int v6 = [(NSArray *)self->m_inputSwitcherItems objectAtIndex:v3];
    uint64_t v7 = [v6 identifier];
  }
  return v7;
}

- (BOOL)shouldShowSelectionExtraViewForIndexPath:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UIInputSwitcherView;
  if ([(UIKeyboardMenuView *)&v8 shouldShowSelectionExtraViewForIndexPath:v4])
  {
    char v5 = -[NSArray objectAtIndex:](self->m_inputSwitcherItems, "objectAtIndex:", [v4 row]);
    int v6 = [v5 isSegmentedItem] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (int64_t)_indexOfInputSwitcherItemWithIdentifier:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl())
  {
    char v5 = TIInputModeGetMultilingualSet();
    if ((unint64_t)[v5 count] >= 2)
    {
      uint64_t v6 = [v5 firstObject];

      id v4 = (id)v6;
    }
  }
  else
  {
    char v5 = 0;
  }
  for (unint64_t i = 0; i < [(NSArray *)self->m_inputSwitcherItems count]; ++i)
  {
    objc_super v8 = [(NSArray *)self->m_inputSwitcherItems objectAtIndex:i];
    v9 = [v8 identifier];
    char v10 = [v9 isEqualToString:v4];

    if (v10) {
      break;
    }
  }

  return i;
}

- (int64_t)_indexOfFastSwitchToggleModeForIdentifier:(id)a3
{
  id v4 = a3;
  char v5 = +[UIKeyboardInputModeController sharedInputModeController];
  uint64_t v6 = [v5 currentLinguisticInputMode];

  uint64_t v7 = [v6 identifier];
  int v8 = [v7 isEqualToString:v4];

  if (v8)
  {
    v9 = +[UIKeyboardInputModeController sharedInputModeController];
    uint64_t v10 = [v9 inputModeForASCIIToggleWithTraits:0];

    uint64_t v6 = (void *)v10;
  }
  uint64_t v11 = [v6 identifier];
  int64_t v12 = [(UIInputSwitcherView *)self _indexOfInputSwitcherItemWithIdentifier:v11];

  return v12;
}

- (void)selectRowForInputMode:(id)a3
{
  id v5 = a3;
  int64_t v4 = -[UIInputSwitcherView _indexOfInputSwitcherItemWithIdentifier:](self, "_indexOfInputSwitcherItemWithIdentifier:");
  if (![(UIKeyboardMenuView *)self mode]) {
    [(UIKeyboardMenuView *)self setIndexForSelectedFastSwitchMode:v4];
  }
  if ([(UIKeyboardMenuView *)self showingCapsLockSwitcher]) {
    [(UIKeyboardMenuView *)self setIndexForUnselectedFastSwitchMode:[(UIInputSwitcherView *)self _indexOfFastSwitchToggleModeForIdentifier:v5]];
  }
  [(UIKeyboardMenuView *)self highlightRow:v4];
}

- (void)removeFromSuperview
{
  [(UIInputSwitcherView *)self setIsForDictation:0];
  v3.receiver = self;
  v3.super_class = (Class)UIInputSwitcherView;
  [(UIKeyboardMenuView *)&v3 removeFromSuperview];
}

- (void)fadeWithDelay:(double)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UIInputSwitcherView;
  [(UIKeyboardMenuView *)&v4 fadeWithDelay:a3];
  [(UIInputSwitcherView *)self returnToKeyboardIfNeeded];
}

- (void)returnToKeyboardIfNeeded
{
  if ([(UIInputSwitcherView *)self isForDictation])
  {
    uint64_t v2 = +[UIDictationView sharedInstance];
    [v2 setSwitchingLanguage:0];

    id v3 = +[UIDictationView sharedInstance];
    [v3 returnToKeyboard];
  }
}

- (void)setInputMode:(id)a3
{
  id v18 = a3;
  if ([(UIInputSwitcherView *)self isForDictation])
  {
    objc_super v4 = +[UIKeyboardImpl activeInstance];
    if ([v4 isUsingDictationLayout]) {
      id v5 = @"UIDictationInputModeInvocationSourceGlobalButtonOnDictationPlane";
    }
    else {
      id v5 = @"UIDictationInputModeInvocationSourceMicButtonOnKeyboardWithInputSwitcher";
    }
    uint64_t v6 = +[UIDictationInputModeOptions dictationInputModeOptionsWithInvocationSource:v5];

    uint64_t v7 = +[UIDictationController sharedInstance];
    [v7 switchToDictationLanguage:v18 inputOptions:v6];

    int v8 = +[UIDictationView sharedInstance];
    [v8 setSwitchingLanguage:0];
  }
  else
  {
    v9 = [(UIKeyboardMenuView *)self layout];
    uint64_t v10 = [(UIKeyboardMenuView *)self referenceKey];
    [v9 setState:2 forKey:v10];

    uint64_t v6 = +[UIKeyboardImpl activeInstance];
    [v6 setInputMode:v18 userInitiated:1];
    uint64_t v11 = +[UIKeyboardPreferencesController sharedPreferencesController];
    int64_t v12 = [v11 preferencesActions];
    int v8 = [v12 inputModeSelectionSequence];

    if ([v8 count]
      && (TIInputModeGetNormalizedIdentifier(),
          int v13 = objc_claimAutoreleasedReturnValue(),
          int v14 = [@"emoji" isEqualToString:v13],
          v13,
          v14))
    {
      __int16 v15 = +[UIKeyboardInputModeController sharedInputModeController];
      uint64_t v16 = +[UIKeyboardInputModeController sharedInputModeController];
      uint64_t v17 = [v16 currentInputMode];
      [v15 updateLastUsedInputMode:v17];
    }
    else
    {
      __int16 v15 = +[UIKeyboardInputModeController sharedInputModeController];
      [v15 clearNextInputModeToUse];
    }
  }
}

- (void)selectInputMode:(id)a3
{
  id v4 = a3;
  if ([(UIKeyboardMenuView *)self isVisible]) {
    [(UIInputSwitcherView *)self selectRowForInputMode:v4];
  }
}

- (void)_segmentControlValueDidChange:(id)a3
{
  id v8 = a3;
  id v4 = [v8 superview];
  id v5 = [(UITableView *)self->super.m_table indexPathForCell:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = -[NSArray objectAtIndex:](self->m_inputSwitcherItems, "objectAtIndex:", [v5 row]);
    objc_msgSend(v7, "setSelectedSegmentIndex:", objc_msgSend(v8, "selectedSegmentIndex"));
  }
}

- (void)updateSelectionWithPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v15.receiver = self;
  v15.super_class = (Class)UIInputSwitcherView;
  -[UIKeyboardMenuView updateSelectionWithPoint:](&v15, sel_updateSelectionWithPoint_);
  -[UIView convertPoint:toView:](self, "convertPoint:toView:", self->super.m_table, x, y);
  uint64_t v6 = -[UIKeyboardMenuView indexPathForInputSwitcherCellIncludingInteractiveInsetsAtPoint:](self, "indexPathForInputSwitcherCellIncludingInteractiveInsetsAtPoint:");
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = -[NSArray objectAtIndex:](self->m_inputSwitcherItems, "objectAtIndex:", [v6 row]);
    v9 = [(UITableView *)self->super.m_table cellForRowAtIndexPath:v7];
    if (v9)
    {
      -[UIView convertPoint:toView:](self, "convertPoint:toView:", v9, x, y);
      objc_msgSend(v9, "updateSelectionWithPoint:");
    }
  }
  else
  {
    id v8 = 0;
  }
  m_inputSwitcherItems = self->m_inputSwitcherItems;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __48__UIInputSwitcherView_updateSelectionWithPoint___block_invoke;
  v12[3] = &unk_1E52F3B00;
  id v13 = v8;
  int v14 = self;
  id v11 = v8;
  [(NSArray *)m_inputSwitcherItems enumerateObjectsUsingBlock:v12];
}

void __48__UIInputSwitcherView_updateSelectionWithPoint___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v15 = a2;
  id v5 = [v15 switchControl];

  if (v5)
  {
    BOOL v6 = *(void *)(a1 + 32) == (void)v15;
    uint64_t v7 = [v15 switchControl];
    id v8 = [v15 switchIsOnBlock];
    [v7 setOn:v6 ^ v8[2]() animated:1];
  }
  if ([v15 isSegmentedItem] && *(id *)(a1 + 32) != v15)
  {
    v9 = [v15 persistentSelectedIndex];
    [v15 setSelectedSegmentIndex:v9[2]()];

    uint64_t v10 = *(void **)(*(void *)(a1 + 40) + 408);
    id v11 = [MEMORY[0x1E4F28D58] indexPathForRow:a3 inSection:0];
    int64_t v12 = [v10 cellForRowAtIndexPath:v11];

    uint64_t v13 = [v15 selectedSegmentIndex];
    int v14 = [v12 segmentControl];
    [v14 setSelectedSegmentIndex:v13];
  }
}

- (BOOL)shouldSelectItemAtIndex:(unint64_t)a3
{
  id v3 = [(NSArray *)self->m_inputSwitcherItems objectAtIndex:a3];
  id v4 = [v3 switchControl];
  if (v4) {
    LOBYTE(v5) = 0;
  }
  else {
    int v5 = [v3 isSegmentedItem] ^ 1;
  }

  return v5;
}

- (void)didSelectItemAtIndex:(unint64_t)a3
{
  -[NSArray objectAtIndex:](self->m_inputSwitcherItems, "objectAtIndex:");
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  if ([(UIInputSwitcherView *)self defaultSelectedIndex] == a3
    && ![(UIInputSwitcherView *)self isForDictation])
  {
    goto LABEL_17;
  }
  int v5 = [v11 identifier];
  if ([(NSMutableArray *)self->m_inputModes containsObject:v5])
  {
    [(UIInputSwitcherView *)self setInputMode:v5];
    BOOL v6 = [(UIKeyboardMenuView *)self glomojiAnalyticsInstance];
    [v6 setUpdatedInputMode:v5];

    uint64_t v7 = [(UIKeyboardMenuView *)self glomojiAnalyticsInstance];
    id v8 = v7;
    uint64_t v9 = 2;
LABEL_14:
    [v7 setKBMenuSelectedAction:v9];
    goto LABEL_15;
  }
  if (v5 == @"reporttotypotracker")
  {
    uint64_t v10 = +[UIKeyboardImpl activeInstance];
    [v10 createTypoTrackerReport];

    uint64_t v7 = [(UIKeyboardMenuView *)self glomojiAnalyticsInstance];
    id v8 = v7;
    uint64_t v9 = 3;
    goto LABEL_14;
  }
  if (v5 == @"launchkeyboardsettings")
  {
    [MEMORY[0x1E4FAE270] launchKeyboardSettings];
    uint64_t v7 = [(UIKeyboardMenuView *)self glomojiAnalyticsInstance];
    id v8 = v7;
    uint64_t v9 = 1;
    goto LABEL_14;
  }
  if (v5 == @"launchdictationsettings")
  {
    [MEMORY[0x1E4FAE270] launchDictationSettings];
    goto LABEL_16;
  }
  if (v5 == @"dismiss")
  {
    id v8 = +[UIKeyboardImpl activeInstance];
    [v8 dismissKeyboard];
  }
  else
  {
    if (v5 != @"launchdictationfeedback" || !os_variant_has_internal_diagnostics()) {
      goto LABEL_16;
    }
    id v8 = +[UIDictationController activeInstance];
    [v8 launchDictationFeedbackApp];
  }
LABEL_15:

LABEL_16:
LABEL_17:
  if ([(UIKeyboardMenuView *)self launchedFromKeyboard])
  {
    [(UIInputSwitcherView *)self willFadeForSelectionAtIndex:a3];
    [(UIKeyboardMenuView *)self hide];
  }
  else
  {
    [(UIKeyboardMenuView *)self fadeWithDelay:a3 forSelectionAtIndex:0.1];
  }
  [(UIInputSwitcherView *)self setIsForDictation:0];
}

- (id)nextInputMode
{
  m_inputModes = self->m_inputModes;
  if ([(UIKeyboardMenuView *)self isVisible]) {
    [(UIInputSwitcherView *)self selectedInputMode];
  }
  else {
  id v4 = [(UIInputSwitcherView *)self defaultInputMode];
  }
  uint64_t v5 = [(NSMutableArray *)m_inputModes indexOfObject:v4];

  unint64_t v6 = (v5 + 1) % (unint64_t)[(NSMutableArray *)self->m_inputModes count];
  uint64_t v7 = self->m_inputModes;
  return (id)[(NSMutableArray *)v7 objectAtIndex:v6];
}

- (void)selectNextInputMode
{
  id v3 = [(UIInputSwitcherView *)self nextInputMode];
  [(UIInputSwitcherView *)self setInputMode:v3];
  [(UIInputSwitcherView *)self selectRowForInputMode:v3];
}

- (id)previousInputMode
{
  m_inputModes = self->m_inputModes;
  if ([(UIKeyboardMenuView *)self isVisible]) {
    [(UIInputSwitcherView *)self selectedInputMode];
  }
  else {
  id v4 = [(UIInputSwitcherView *)self defaultInputMode];
  }
  uint64_t v5 = [(NSMutableArray *)m_inputModes indexOfObject:v4];

  if (v5 <= 0)
  {
    unint64_t v6 = [(UIInputSwitcherView *)self inputModes];
    uint64_t v5 = [v6 count];
  }
  uint64_t v7 = [(UIInputSwitcherView *)self inputModes];
  id v8 = [v7 objectAtIndex:v5 - 1];

  return v8;
}

- (void)selectPreviousInputMode
{
  id v3 = [(UIInputSwitcherView *)self previousInputMode];
  [(UIInputSwitcherView *)self setInputMode:v3];
  [(UIInputSwitcherView *)self selectRowForInputMode:v3];
}

- (void)showAsPopupForKey:(id)a3 inLayout:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(UIInputSwitcherView *)self setShowsSwitches:1];
  -[UIInputSwitcherView setIsForDictation:](self, "setIsForDictation:", [v7 interactionType] == 5);
  [(UIKeyboardMenuView *)self setShowingCapsLockSwitcher:0];
  v8.receiver = self;
  v8.super_class = (Class)UIInputSwitcherView;
  [(UIKeyboardMenuView *)&v8 showAsPopupForKey:v7 inLayout:v6];
}

- (BOOL)shouldShow
{
  [(UIInputSwitcherView *)self _reloadInputSwitcherItems];
  if (+[UIKeyboard isShowingEmojiSearch]
    || [(UIInputSwitcherView *)self isForDictation])
  {
    return 1;
  }
  id v4 = [(UIInputSwitcherView *)self inputModes];
  BOOL v3 = (unint64_t)[v4 count] > 1;

  return v3;
}

- (void)didShow
{
  if ([(UIInputSwitcherView *)self isForDictation])
  {
    BOOL v3 = +[UIKeyboardImpl activeInstance];
    id v8 = [v3 activeDictationLanguage];

    uint64_t v4 = (uint64_t)v8;
  }
  else
  {
    uint64_t v4 = UIKeyboardGetCurrentInputMode();
  }
  id v9 = (id)v4;
  if (([(NSMutableArray *)self->m_inputModes containsObject:v4] & 1) == 0)
  {
    uint64_t v5 = [(NSMutableArray *)self->m_inputModes firstObject];

    id v9 = (id)v5;
  }
  if (![(UIInputSwitcherView *)self isForDictation]
    || (+[UIDictationController sharedInstance],
        id v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 smartLanguageSelectionOverridden],
        v6,
        v7))
  {
    [(UIInputSwitcherView *)self selectRowForInputMode:v9];
  }
}

- (void)willFade
{
}

- (void)willFadeForSelectionAtIndex:(unint64_t)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v33 = 672;
  uint64_t v4 = self->m_inputSwitcherItems;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v36 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "switchControl", v33);

        if (v10)
        {
          id v11 = [v9 switchIsOnBlock];
          int v12 = v11[2]();
          uint64_t v13 = [v9 switchControl];
          int v14 = [v13 isOn];

          if (v12 != v14)
          {
            id v15 = [v9 switchToggleBlock];
            uint64_t v16 = [v9 switchControl];
            v15[2](v15, [v16 isOn]);
          }
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v6);
  }

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v17 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v33), "objectAtIndex:");
  }
  uint64_t v18 = [(UIInputSwitcherView *)self _itemWithIdentifier:@"handbiasswitch", v33];
  BOOL v19 = (void *)v18;
  if (v18 && v17 == (void *)v18)
  {
    unint64_t v20 = [v17 selectedSegmentIndex];
    if (v20 <= 3) {
      uint64_t v21 = __handBiasOrdering[v20];
    }
    else {
      uint64_t v21 = 0;
    }
    [(UIInputSwitcherView *)self reportHandBiasToAnalytics:v21];
    uint64_t v22 = +[UIKeyboardImpl activeInstance];
    v23 = [v22 _layout];
    uint64_t v24 = [v23 currentHandBias];

    if (v21 != v24)
    {
      id v25 = +[UIKeyboardPreferencesController sharedPreferencesController];
      v26 = [v25 preferencesActions];
      [v26 setHandBias:v21];

      v27 = +[UIKeyboardPreferencesController sharedPreferencesController];
      uint64_t v28 = [v27 preferencesActions];
      [v28 performedFirstReachableKeyboardInteraction];

      long long v29 = +[UIKeyboardImpl activeInstance];
      long long v30 = [v29 _layout];
      [v30 setKeyboardBias:v21];

      CGFloat v31 = +[UIKeyboardImpl activeInstance];
      [v31 updateForHandBiasChange];
    }
  }
  m_gestureState = self->m_gestureState;
  self->m_gestureState = 0;
}

- (void)reportHandBiasToAnalytics:(int64_t)a3
{
  if (a3 == 2)
  {
    BOOL v3 = [(UIKeyboardMenuView *)self glomojiAnalyticsInstance];
    id v5 = v3;
    uint64_t v4 = 5;
  }
  else if (a3 == 1)
  {
    BOOL v3 = [(UIKeyboardMenuView *)self glomojiAnalyticsInstance];
    id v5 = v3;
    uint64_t v4 = 6;
  }
  else
  {
    if (a3) {
      return;
    }
    BOOL v3 = [(UIKeyboardMenuView *)self glomojiAnalyticsInstance];
    id v5 = v3;
    uint64_t v4 = 4;
  }
  [v3 setKBMenuSelectedAction:v4];
}

- (unint64_t)numberOfItems
{
  if ([(UIKeyboardMenuView *)self showingCapsLockSwitcher]) {
    return 2;
  }
  m_inputSwitcherItems = self->m_inputSwitcherItems;
  return [(NSArray *)m_inputSwitcherItems count];
}

- (CGSize)preferredSize
{
  BOOL v3 = [(UIKeyboardMenuView *)self font];
  uint64_t v4 = [(UIKeyboardMenuView *)self subtitleFont];
  uint64_t v28 = 0;
  long long v29 = (double *)&v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 0;
  id v5 = +[UIKeyboardImpl activeInstance];
  char v6 = [v5 isMinimized];

  m_inputSwitcherItems = self->m_inputSwitcherItems;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __36__UIInputSwitcherView_preferredSize__block_invoke;
  v22[3] = &unk_1E52F3B28;
  id v8 = v3;
  v26 = &v28;
  id v23 = v8;
  uint64_t v24 = self;
  char v27 = v6;
  id v9 = v4;
  id v25 = v9;
  [(NSArray *)m_inputSwitcherItems enumerateObjectsUsingBlock:v22];
  if (self->super.m_mode)
  {
    uint64_t v10 = +[UIKeyboardImpl keyboardScreen];
    [v10 bounds];
    double v12 = v11 + -50.0;

    double v13 = v29[3];
    if (v13 < self->super.m_referenceRect.size.width + 40.0) {
      double v13 = self->super.m_referenceRect.size.width + 40.0;
    }
    if (v12 < v13) {
      double v13 = v12;
    }
    v29[3] = v13;
    double v14 = self->super.m_referenceRect.size.height + 50.0;
  }
  else
  {
    double v14 = 50.0;
  }
  if ([(UIKeyboardMenuView *)self usesTable]) {
    double v14 = (double)self->super.m_visibleRows * 50.0;
  }
  id v15 = [(UIInputSwitcherView *)self _itemWithIdentifier:@"handbiasswitch"];
  uint64_t v16 = v15;
  if (v15)
  {
    uint64_t v17 = [v15 segmentImages];
    +[UIInputSwitcherSegmentedTableCell preferredSizeWithSegmentCount:](UIInputSwitcherSegmentedTableCell, "preferredSizeWithSegmentCount:", [v17 count]);
    double v19 = v18;

    if (v19 < v29[3]) {
      double v19 = v29[3];
    }
    v29[3] = v19;
    double v14 = v14 + 4.0;
  }
  else
  {
    double v19 = v29[3];
  }

  _Block_object_dispose(&v28, 8);
  double v20 = v19;
  double v21 = v14;
  result.height = v21;
  result.width = v20;
  return result;
}

void __36__UIInputSwitcherView_preferredSize__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v22 = a2;
  id v5 = [v22 localizedTitle];
  objc_msgSend(v5, "_legacy_sizeWithFont:", *(void *)(a1 + 32));
  double v7 = v6 + 48.0;
  id v8 = [v22 switchControl];

  if (v8)
  {
    id v9 = [v22 switchControl];
    [v9 size];
    double v7 = v7 + v10;
  }
  double v11 = [v22 identifier];
  uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
  if (*(double *)(v12 + 24) < v7) {
    *(double *)(v12 + 24) = v7;
  }
  double v13 = +[UIKeyboardInputModeController sharedInputModeController];
  int v14 = [v13 identifierIsValidSystemInputMode:v11];

  if (v14)
  {
    id v15 = [*(id *)(a1 + 40) inputModes];
    uint64_t v16 = UIKeyboardInputModesMatchingMode((uint64_t)v11, v15);
    BOOL v17 = (unint64_t)[v16 count] > 1;
  }
  else
  {
    BOOL v17 = 0;
  }
  if (!*(unsigned char *)(a1 + 64) && v14 ^ 1 | v17)
  {
    double v18 = [*(id *)(a1 + 40) subtitleForItemAtIndex:a3];
    if ([v18 length])
    {
      objc_msgSend(v18, "_legacy_sizeWithFont:", *(void *)(a1 + 48));
      double v20 = v19 + 48.0;
      uint64_t v21 = *(void *)(*(void *)(a1 + 56) + 8);
      if (*(double *)(v21 + 24) < v20) {
        *(double *)(v21 + 24) = v20;
      }
    }
  }
}

- (id)_itemWithIdentifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = self->m_inputSwitcherItems;
  id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        objc_msgSend(v9, "identifier", (void)v12);
        id v10 = (id)objc_claimAutoreleasedReturnValue();

        if (v10 == v4)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)defaultInputMode
{
  if ([(UIInputSwitcherView *)self isForDictation])
  {
    BOOL v3 = +[UIKeyboardImpl activeInstance];
    if ([v3 isUsingDictationLayout])
    {
      id v4 = +[UIDictationController sharedInstance];
      [v4 currentInputModeForDictation];
    }
    else
    {
      id v4 = +[UIKeyboardInputModeController sharedInputModeController];
      [v4 currentInputMode];
    id v6 = };
    id v5 = [v6 dictationLanguage];
  }
  else
  {
    id v5 = UIKeyboardGetCurrentInputMode();
  }
  if (([(NSMutableArray *)self->m_inputModes containsObject:v5] & 1) == 0)
  {
    uint64_t v7 = [(NSMutableArray *)self->m_inputModes firstObject];

    id v5 = (void *)v7;
  }
  return v5;
}

- (unint64_t)defaultSelectedIndex
{
  if ([(UIInputSwitcherView *)self isForDictation]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  id v4 = [(UIInputSwitcherView *)self defaultInputMode];
  unint64_t v5 = [(UIInputSwitcherView *)self _indexOfInputSwitcherItemWithIdentifier:v4];

  return v5;
}

- (id)titleForItemAtIndex:(unint64_t)a3
{
  BOOL v3 = [(NSArray *)self->m_inputSwitcherItems objectAtIndexedSubscript:a3];
  id v4 = [v3 localizedTitle];

  return v4;
}

- (id)localizedTitleForItemAtIndex:(unint64_t)a3
{
  BOOL v3 = [(NSArray *)self->m_inputSwitcherItems objectAtIndexedSubscript:a3];
  id v4 = [v3 localizedTitle];

  return v4;
}

- (id)fontForItemAtIndex:(unint64_t)a3
{
  id v4 = [(NSArray *)self->m_inputSwitcherItems objectAtIndexedSubscript:a3];
  unint64_t v5 = [v4 titleFont];

  if (!v5)
  {
    unint64_t v5 = [(UIKeyboardMenuView *)self font];
  }
  return v5;
}

- (id)subtitleForItemAtIndex:(unint64_t)a3
{
  unint64_t v5 = +[UIKeyboardImpl activeInstance];
  char v6 = [v5 isMinimized];

  if (v6)
  {
    uint64_t v7 = &stru_1ED0E84C0;
  }
  else
  {
    id v8 = [(NSArray *)self->m_inputSwitcherItems objectAtIndexedSubscript:a3];
    uint64_t v7 = [v8 localizedSubtitle];
  }
  return v7;
}

- (id)subtitleFontForItemAtIndex:(unint64_t)a3
{
  id v4 = [(NSArray *)self->m_inputSwitcherItems objectAtIndexedSubscript:a3];
  unint64_t v5 = [v4 subtitleFont];

  if (!v5)
  {
    unint64_t v5 = [(UIKeyboardMenuView *)self subtitleFont];
  }
  return v5;
}

- (BOOL)usesDeviceLanguageForItemAtIndex:(unint64_t)a3
{
  BOOL v3 = [(NSArray *)self->m_inputSwitcherItems objectAtIndexedSubscript:a3];
  char v4 = [v3 usesDeviceLanguage];

  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[UIInputSwitcherTableCell reuseIdentifier];
  id v9 = -[NSArray objectAtIndex:](self->m_inputSwitcherItems, "objectAtIndex:", [v7 row]);
  if ([v9 isSegmentedItem])
  {
    uint64_t v10 = +[UIInputSwitcherTableCell reuseIdentifier];

    id v8 = (void *)v10;
  }
  double v11 = [v6 dequeueReusableCellWithIdentifier:v8 forIndexPath:v7];
  -[UIInputSwitcherView customizeCell:forItemAtIndex:](self, "customizeCell:forItemAtIndex:", v11, [v7 row]);

  return v11;
}

- (void)customizeCell:(id)a3 forItemAtIndex:(unint64_t)a4
{
  id v6 = a3;
  v36.receiver = self;
  v36.super_class = (Class)UIInputSwitcherView;
  [(UIKeyboardMenuView *)&v36 customizeCell:v6 forItemAtIndex:a4];
  unint64_t v7 = a4;
  if ([(UIKeyboardMenuView *)self showingCapsLockSwitcher])
  {
    int64_t v8 = [(UIKeyboardMenuView *)self indexForSelectedFastSwitchMode];
    int64_t v9 = [(UIKeyboardMenuView *)self indexForUnselectedFastSwitchMode];
    if (a4 == 1)
    {
      if (v8 < v9)
      {
LABEL_5:
        int64_t v10 = [(UIKeyboardMenuView *)self indexForUnselectedFastSwitchMode];
LABEL_8:
        unint64_t v7 = v10;
        goto LABEL_9;
      }
    }
    else
    {
      unint64_t v7 = a4;
      if (a4) {
        goto LABEL_9;
      }
      if (v8 >= v9) {
        goto LABEL_5;
      }
    }
    int64_t v10 = [(UIKeyboardMenuView *)self indexForSelectedFastSwitchMode];
    goto LABEL_8;
  }
LABEL_9:
  objc_msgSend(v6, "setInteractiveInsets:", 0.0, 0.0, 0.0, 0.0);
  double v11 = [(NSArray *)self->m_inputSwitcherItems objectAtIndex:v7];
  long long v12 = [v11 switchControl];

  if (v12)
  {
    long long v12 = [v11 switchControl];
    long long v13 = [v11 switchIsOnBlock];
    uint64_t v14 = v13[2]();
    long long v15 = [v11 switchControl];
    [v15 setOn:v14];

    uint64_t v16 = [v6 textLabel];
    [v16 setTextAlignment:0];
  }
  if ([v11 isSegmentedItem])
  {
    id v17 = v6;
    double v18 = [v11 segmentImages];
    uint64_t v19 = [v18 count];

    if (v19)
    {
      double v20 = [v11 segmentImages];
      uint64_t v21 = [v17 segmentControl];
      [v21 setSegmentImages:v20];
    }
    id v22 = [v11 segmentTitles];
    uint64_t v23 = [v22 count];

    if (v23)
    {
      uint64_t v24 = [v11 segmentTitles];
      id v25 = [v17 segmentControl];
      [v25 setSegmentTitles:v24];
    }
    v26 = +[UIKeyboardImpl activeInstance];
    char v27 = [v26 _layout];
    uint64_t v28 = [v27 currentHandBias];

    for (uint64_t i = 0; i != 3; ++i)
    {
      if (__handBiasOrdering[i] == v28) {
        break;
      }
    }
    uint64_t v30 = [v17 segmentControl];
    [v30 setSelectedSegmentIndex:i];

    uint64_t v31 = [v17 segmentControl];
    [v31 addTarget:self action:sel__segmentControlValueDidChange_ forControlEvents:4096];

    v32 = +[UIKeyboardPreferencesController sharedPreferencesController];
    uint64_t v33 = [v32 preferencesActions];
    char v34 = [v33 isFirstReachableKeyboardInteraction];

    if ((v34 & 1) == 0 && [(NSArray *)self->m_inputSwitcherItems count] - 1 == a4) {
      objc_msgSend(v17, "setInteractiveInsets:", 0.0, 0.0, -50.0, 0.0);
    }
  }
  [v6 setAccessoryView:v12];
  long long v35 = [v6 textLabel];
  [v35 setAlpha:1.0];
}

- (void)switchAction
{
}

- (BOOL)_isHandBiasSwitchVisible
{
  BOOL v2 = [(UIInputSwitcherView *)self showsSwitches];
  if (v2)
  {
    BOOL v3 = +[UIKeyboardImpl activeInstance];
    char v4 = [v3 allowsReachableKeyboard];

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (BOOL)didHitDockItemWithinTypingWindow
{
  BOOL v2 = +[UIKeyboardImpl activeInstance];
  BOOL v3 = [v2 _layout];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    return 0;
  }
  unint64_t v5 = +[UIKeyboardImpl activeInstance];
  id v6 = [v5 _layout];
  [v6 lastTouchUpTimestamp];
  double v8 = v7;

  return CFAbsoluteTimeGetCurrent() - v8 < 0.325;
}

- (id)buttonPressed:(id)a3 withEvent:(id)a4 location:(CGPoint)a5 isForDictation:(BOOL)a6 tapAction:(id)a7
{
  return -[UIInputSwitcherView buttonPressed:withEvent:location:isLocationInsideViewHitArea:isForDictation:tapAction:](self, "buttonPressed:withEvent:location:isLocationInsideViewHitArea:isForDictation:tapAction:", a3, a4, 1, a6, a7, a5.x, a5.y);
}

- (id)buttonPressed:(id)a3 withEvent:(id)a4 location:(CGPoint)a5 isLocationInsideViewHitArea:(BOOL)a6 isForDictation:(BOOL)a7 tapAction:(id)a8
{
  BOOL v9 = a7;
  double y = a5.y;
  double x = a5.x;
  id v15 = a3;
  uint64_t v16 = (void (**)(void))a8;
  id v17 = [a4 touchesForView:v15];
  double v18 = [v17 anyObject];

  [v18 locationInView:self];
  double v20 = v19;
  double v22 = v21;
  uint64_t v23 = [v15 window];
  [v18 locationInView:v23];
  double v25 = v24;
  double v27 = v26;

  switch([v18 phase])
  {
    case 0:
      if ([(UIKeyboardMenuView *)self isVisible]) {
        [(UIKeyboardMenuView *)self hide];
      }
      [(UIInputSwitcherView *)self setIsForDictation:v9];
      uint64_t v28 = objc_alloc_init(UIInputSwitcherGestureState);
      m_gestureState = self->m_gestureState;
      self->m_gestureState = v28;

      [(UIInputSwitcherGestureState *)self->m_gestureState setTouchDown:CFAbsoluteTimeGetCurrent()];
      -[UIInputSwitcherGestureState setFirstReferencePoint:](self->m_gestureState, "setFirstReferencePoint:", v25, v27);
      uint64_t v30 = +[UIKeyboardImpl activeInstance];
      [v30 lastTouchDownTimestamp];
      -[UIInputSwitcherGestureState setLastSeenKeyboardTouchDown:](self->m_gestureState, "setLastSeenKeyboardTouchDown:");

      uint64_t v31 = [(UIKeyboardMenuView *)self glomojiAnalyticsInstance];
      v32 = [v31 getInputMode];
      uint64_t v33 = [(UIKeyboardMenuView *)self glomojiAnalyticsInstance];
      [v33 setOriginalInputMode:v32];

      if (TIGetGlobeButtonDelayValue_onceToken != -1) {
        dispatch_once(&TIGetGlobeButtonDelayValue_onceToken, &__block_literal_global_515_2);
      }
      char v34 = [MEMORY[0x1E4FAE3D8] sharedPreferencesController];
      long long v35 = [v34 valueForPreferenceKey:@"GlobeButtonDelay"];

      [v35 doubleValue];
      double v37 = v36;

      if ([(UIInputSwitcherGestureState *)self->m_gestureState gestureConflictsWithTypingWindow])
      {
        double v37 = v37 + v37;
      }
      dispatch_time_t v38 = dispatch_time(0, (uint64_t)(v37 * 1000000000.0));
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __109__UIInputSwitcherView_buttonPressed_withEvent_location_isLocationInsideViewHitArea_isForDictation_tapAction___block_invoke;
      block[3] = &unk_1E52F3B50;
      block[4] = self;
      double v71 = v37;
      BOOL v74 = a6;
      id v69 = v18;
      double v72 = x;
      double v73 = y;
      id v70 = v15;
      dispatch_after(v38, MEMORY[0x1E4F14428], block);

      break;
    case 1:
      p_m_gestureState = &self->m_gestureState;
      [(UIInputSwitcherGestureState *)self->m_gestureState firstReferencePoint];
      double v41 = v40;
      if (![(UIInputSwitcherGestureState *)self->m_gestureState didMoveBeyondThreshold]) {
        [(UIInputSwitcherGestureState *)*p_m_gestureState setDidMoveBeyondThreshold:vabdd_f64(v27, v41) > 25.0];
      }
      if (![(UIInputSwitcherGestureState *)*p_m_gestureState didMoveBeyondThreshold]) {
        goto LABEL_28;
      }
      if ([(UIKeyboardMenuView *)self isVisible])
      {
        -[UIInputSwitcherView updateSelectionWithPoint:](self, "updateSelectionWithPoint:", v20, v22);
      }
      else
      {
        if (!+[UIKeyboard isModelessActive])
        {
          int v55 = +[UIDictationController sharedInstance];
          [v55 setReasonType:16];

          v56 = +[UIDictationController sharedInstance];
          [v56 stopDictation];
        }
        [(UIInputSwitcherView *)self setShowsSwitches:1];
        [v18 timestamp];
        -[UIKeyboardMenuView showAsHUDFromLocation:withInputView:touchBegan:](self, "showAsHUDFromLocation:withInputView:touchBegan:", v15, x, y, v57);
        int v58 = +[UIKeyboardImpl activeInstance];
        objc_msgSend(v58, "_tagTouchForTypingMenu:", objc_msgSend(v18, "_touchIdentifier"));
      }
      [(UIInputSwitcherGestureState *)*p_m_gestureState setHideSwitcher:1];
      break;
    case 3:
      [(UIInputSwitcherGestureState *)self->m_gestureState touchDown];
      if (v42 == 0.0) {
        break;
      }
      [(UIInputSwitcherGestureState *)self->m_gestureState setTouchDown:0.0];
      BOOL v43 = [(UIInputSwitcherGestureState *)self->m_gestureState gestureConflictsWithTypingWindow];
      if ([(UIKeyboardMenuView *)self isVisible]) {
        goto LABEL_40;
      }
      [v15 bounds];
      CGFloat v45 = v44;
      CGFloat v47 = v46;
      CGFloat v49 = v48;
      CGFloat v51 = v50;
      [v18 locationInView:v15];
      v75.double x = v52;
      v75.double y = v53;
      v77.origin.double x = v45;
      v77.origin.double y = v47;
      v77.size.width = v49;
      v77.size.height = v51;
      if (!CGRectContainsPoint(v77, v75) || v43)
      {
LABEL_40:
        if ([(UIKeyboardMenuView *)self isVisible])
        {
          if ([(UIInputSwitcherGestureState *)self->m_gestureState didMoveBeyondThreshold]
            && ([(UIKeyboardMenuView *)self interactiveBounds],
                v76.double x = v20,
                v76.double y = v22,
                CGRectContainsPoint(v78, v76)))
          {
            v54 = [(UIKeyboardMenuView *)self glomojiAnalyticsInstance];
            [v54 setKBMenuInteractionSource:2];

            -[UIKeyboardMenuView selectItemAtPoint:](self, "selectItemAtPoint:", v20, v22);
          }
          else
          {
            if (!v9) {
              goto LABEL_41;
            }
            v61 = +[UIKeyboardInputMode dictationInputMode];
            uint64_t v62 = +[UIKeyboardInputModeController sharedInputModeController];
            v63 = [v62 currentInputMode];
            char v64 = [v61 isEqual:v63];

            if ((v64 & 1) == 0)
            {
              v16[2](v16);
            }
            else
            {
LABEL_41:
              if ([(UIInputSwitcherGestureState *)self->m_gestureState hideSwitcher])
              {
                uint64_t v65 = [(UIKeyboardMenuView *)self glomojiAnalyticsInstance];
                [v65 setKBMenuDismissSource:2];

LABEL_22:
                [(UIKeyboardMenuView *)self hide];
              }
            }
          }
        }
      }
      else
      {
        if (v16) {
          v16[2](v16);
        }
        else {
          id v66 = [(UIInputSwitcherView *)self nextInputMode];
        }
        long long v67 = [(UIKeyboardMenuView *)self glomojiAnalyticsInstance];
        [v67 didGlomojiTap];
      }
      break;
    case 4:
      [(UIInputSwitcherGestureState *)self->m_gestureState setTouchDown:0.0];
      if ([(UIKeyboardMenuView *)self isVisible]) {
        goto LABEL_22;
      }
      break;
    default:
      break;
  }
  p_m_gestureState = &self->m_gestureState;
LABEL_28:
  BOOL v59 = *p_m_gestureState;

  return v59;
}

uint64_t __109__UIInputSwitcherView_buttonPressed_withEvent_location_isLocationInsideViewHitArea_isForDictation_tapAction___block_invoke(uint64_t a1)
{
  double Current = CFAbsoluteTimeGetCurrent();
  [*(id *)(*(void *)(a1 + 32) + 680) touchDown];
  double v4 = v3;
  double v5 = *(double *)(a1 + 56);
  int v6 = [*(id *)(*(void *)(a1 + 32) + 680) gestureConflictsWithTypingWindow];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 680) touchDown];
  if (v8 > 0.0)
  {
    uint64_t result = [*(id *)(a1 + 32) isVisible];
    int v9 = Current - v4 < v5 ? 1 : result;
    if (((v9 | v6) & 1) == 0 && *(unsigned char *)(a1 + 80))
    {
      if (!+[UIKeyboard isModelessActive])
      {
        int64_t v10 = +[UIDictationController sharedInstance];
        [v10 setReasonType:16];

        double v11 = +[UIDictationController sharedInstance];
        [v11 stopDictation];
      }
      [*(id *)(a1 + 32) setShowsSwitches:1];
      long long v12 = +[UIKeyboardImpl activeInstance];
      objc_msgSend(v12, "_tagTouchForTypingMenu:", objc_msgSend(*(id *)(a1 + 40), "_touchIdentifier"));

      [*(id *)(a1 + 32) setShowingCapsLockSwitcher:0];
      uint64_t v13 = *(void *)(a1 + 48);
      uint64_t v14 = *(void **)(a1 + 32);
      [*(id *)(a1 + 40) timestamp];
      objc_msgSend(v14, "showAsHUDFromLocation:withInputView:touchBegan:", v13, *(double *)(a1 + 64), *(double *)(a1 + 72), v15);
      uint64_t v16 = [*(id *)(a1 + 32) glomojiAnalyticsInstance];
      [v16 setKBMenuAppeared:1];

      id v17 = [*(id *)(a1 + 32) glomojiAnalyticsInstance];
      [v17 didKBMenuAppear];

      return +[UIKBAnalyticsDispatcher globeKeyLongPress];
    }
  }
  return result;
}

- (NSArray)inputModes
{
  return &self->m_inputModes->super;
}

- (id)finishSplitTransitionBlock
{
  return self->m_finishSplitTransitionBlock;
}

- (void)setFinishSplitTransitionBlock:(id)a3
{
}

- (BOOL)messagesWriteboardFromSwitcher
{
  return self->_messagesWriteboardFromSwitcher;
}

- (void)setMessagesWriteboardFromSwitcher:(BOOL)a3
{
  self->_messagesWriteboardFromSwitcher = a3;
}

- (BOOL)fileReportFromSwitcher
{
  return self->_fileReportFromSwitcher;
}

- (void)setFileReportFromSwitcher:(BOOL)a3
{
  self->_fileReportFromSwitcher = a3;
}

- (BOOL)showsSwitches
{
  return self->_showsSwitches;
}

- (void)setShowsSwitches:(BOOL)a3
{
  self->_showsSwitches = a3;
}

- (BOOL)isForDictation
{
  return self->_isForDictation;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->m_finishSplitTransitionBlock, 0);
  objc_storeStrong((id *)&self->m_gestureState, 0);
  objc_storeStrong((id *)&self->m_inputSwitcherItems, 0);
  objc_storeStrong((id *)&self->m_inputModes, 0);
}

@end