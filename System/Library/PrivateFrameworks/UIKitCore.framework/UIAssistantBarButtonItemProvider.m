@interface UIAssistantBarButtonItemProvider
+ (BOOL)_isDictationButtonVisible;
+ (BOOL)_isDismissButtonVisible;
+ (BOOL)_isEmojiButtonVisible;
+ (BOOL)_isInputModeVisible:(id)a3;
+ (BOOL)_isKeyboardItemEnabled;
+ (BOOL)_isMinimizeAssistantBarButtonVisible;
+ (BOOL)_isScribbleButtonsVisible;
+ (BOOL)_isShowKeyboardButtonVisible;
+ (BOOL)_isStyleItemEnable:(id)a3;
+ (BOOL)isFloatingKeyboardVisible;
+ (BOOL)isKeyboardGroupVisible;
+ (id)actionForInputMode:(id)a3;
+ (id)barButtonItemForAssistantItemStyle:(int64_t)a3 target:(id)a4;
+ (id)barButtonItemForAssistantItemStyle:(int64_t)a3 target:(id)a4 forcePlainButton:(BOOL)a5;
+ (id)compactSystemAssistantItem;
+ (id)configuredSymbolImageWithName:(id)a3 size:(double)a4;
+ (id)configuredSymbolImageWithName:(id)a3 size:(double)a4 keyboardLanguageCode:(id)a5;
+ (id)defaultSystemLeadingBarButtonGroupsForItem:(id)a3;
+ (id)defaultSystemTrailingBarButtonGroupsForItem:(id)a3;
+ (id)dictationActionForInputMode:(id)a3 inCurrentInputMode:(id)a4;
+ (id)dictationMenu;
+ (id)imageSymbolConfigurationForAssistantBarWithPointSize:(double)a3;
+ (id)inputWindowController;
+ (id)inputWindowControllerForApplication:(BOOL)a3;
+ (id)languageIndicatorImage;
+ (id)languageIndicatorItem:(BOOL)a3;
+ (id)languageIndicatorMenu:(BOOL)a3;
+ (id)systemDefaultAssistantItem;
+ (id)unmodifiableSystemAssistantItem:(int64_t)a3;
+ (void)dismissFloatingKeyboard;
+ (void)presentFloatingKeyboard;
+ (void)setAssistantBarCompact:(BOOL)a3;
+ (void)setAssistantBarCompact:(BOOL)a3 forceReload:(BOOL)a4;
+ (void)setScribbleLanguageIdentifier:(id)a3;
+ (void)updateFloatingAssistantBarIfNeeded;
@end

@implementation UIAssistantBarButtonItemProvider

+ (BOOL)isKeyboardGroupVisible
{
  v3 = +[UIKeyboardImpl activeInstance];
  v4 = [v3 delegateAsResponder];
  if (([v4 _isDisplayingWritingToolsSessionInUCB] & 1) == 0
    && (([a1 _isDismissButtonVisible] & 1) != 0
     || [a1 _isScribbleButtonsVisible]))
  {
    v5 = [v4 inputView];
    if (v5)
    {
      BOOL v6 = 0;
    }
    else
    {
      v7 = [v4 inputViewController];
      BOOL v6 = v7 == 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (BOOL)_isEmojiButtonVisible
{
  v2 = +[UIKeyboardImpl activeInstance];
  char v3 = [v2 canPresentEmojiPopover];

  return v3;
}

+ (BOOL)_isDictationButtonVisible
{
  v2 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  char v3 = [v2 responder];

  if (objc_opt_respondsToSelector() & 1) != 0 && ([v3 _isDisplayingWritingToolsSessionInUCB])
  {
    char v4 = 0;
  }
  else
  {
    v5 = [v3 inputAssistantItem];
    BOOL v6 = [v5 _dictationReplacementAction];

    if (v6)
    {
      char v4 = 1;
    }
    else
    {
      v7 = +[UIKeyboardImpl activeInstance];
      char v4 = [v7 shouldShowDictationKey];
    }
  }

  return v4;
}

+ (BOOL)_isScribbleButtonsVisible
{
  v2 = [a1 inputWindowController];
  char v3 = [v2 placement];

  uint64_t v4 = [v3 assistantView];
  v5 = (void *)v4;
  if (v4) {
    BOOL v6 = (void *)v4;
  }
  else {
    BOOL v6 = v3;
  }
  id v7 = v6;

  int v8 = [v7 isFloatingAssistantView];
  if (!v8) {
    return 0;
  }
  v9 = +[UIKeyboardImpl activeInstance];
  char v10 = [v9 _showsScribbleIconsInAssistantView];

  return v10;
}

+ (BOOL)_isDismissButtonVisible
{
  v2 = +[UIKeyboardImpl activeInstance];
  if ([v2 _shouldMinimizeForHardwareKeyboard]) {
    int v3 = [v2 _shouldSuppressSoftwareKeyboard] ^ 1;
  }
  else {
    LOBYTE(v3) = 0;
  }

  return v3;
}

+ (BOOL)_isShowKeyboardButtonVisible
{
  v2 = +[UIKeyboardImpl activeInstance];
  if (([v2 isMinimized] & 1) == 0)
  {
    int v3 = [v2 delegateAsResponder];
    if ([v3 _suppressSoftwareKeyboard])
    {
    }
    else
    {
      int v4 = [v2 _showsScribbleIconsInAssistantView];

      if (!v4)
      {
        BOOL v5 = 0;
        goto LABEL_6;
      }
    }
  }
  BOOL v5 = +[UIKeyboardVisualModeManager softwareKeyboardAllowedForActiveKeyboardSceneDelegate];
LABEL_6:

  return v5;
}

+ (BOOL)_isMinimizeAssistantBarButtonVisible
{
  int v3 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  int v4 = [v3 systemInputAssistantViewController];

  if ([v4 isInputAssistantItemEmpty]
    && ![a1 _isScribbleButtonsVisible]
    || ([v4 _usesCustomBackground] & 1) != 0
    || +[UIKeyboardImpl isFloatingForced])
  {
    char v5 = 0;
  }
  else
  {
    char v5 = [v4 supportsCompactStyle];
  }

  return v5;
}

+ (BOOL)_isKeyboardItemEnabled
{
  v2 = +[UIKeyboardImpl activeInstance];
  int v3 = [v2 textInputTraits];
  BOOL v4 = [v3 keyboardType] != 122;

  return v4;
}

+ (BOOL)_isStyleItemEnable:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[UIKeyboardImpl activeInstance];
  char v5 = [v4 textInputTraits];
  uint64_t v6 = [v5 allowsTextAnimationsType];

  if (v6 == 2) {
    LOBYTE(v7) = 0;
  }
  else {
    int v7 = [v3 _isDisplayingWritingToolsSessionInUCB] ^ 1;
  }

  return v7;
}

+ (id)barButtonItemForAssistantItemStyle:(int64_t)a3 target:(id)a4
{
  return (id)[a1 barButtonItemForAssistantItemStyle:a3 target:a4 forcePlainButton:0];
}

+ (id)barButtonItemForAssistantItemStyle:(int64_t)a3 target:(id)a4 forcePlainButton:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  v9 = 0;
  char v10 = &stru_1ED0E84C0;
  BOOL v44 = v5;
  switch(a3)
  {
    case 0:
      _UINSLocalizedStringWithDefaultValue(@"Cut", @"Cut");
      char v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v11 = 0;
      int v12 = 0;
      char v13 = 0;
      v14 = @"scissors";
      v43 = sel_assistantCut;
      double v15 = 20.0;
      double v16 = 0.0;
      double v17 = 0.0;
      v18 = &__block_literal_global_564;
      goto LABEL_29;
    case 1:
      _UINSLocalizedStringWithDefaultValue(@"Copy", @"Copy");
      char v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v11 = 0;
      int v12 = 0;
      char v13 = 0;
      v14 = @"doc.on.doc";
      v43 = sel_assistantCopy;
      double v15 = 20.0;
      double v16 = 0.0;
      double v17 = 0.0;
      v18 = &__block_literal_global_62_3;
      goto LABEL_29;
    case 2:
      _UINSLocalizedStringWithDefaultValue(@"Paste", @"Paste");
      char v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v11 = 0;
      int v12 = 0;
      char v13 = 0;
      v14 = @"doc.on.clipboard";
      v43 = sel_assistantPaste_forEvent_;
      double v15 = 20.0;
      double v16 = 0.0;
      double v17 = 0.0;
      v18 = &__block_literal_global_94_2;
      goto LABEL_29;
    case 3:
      _UINSLocalizedStringWithDefaultValue(@"Undo", @"Undo");
      char v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v11 = 0;
      int v12 = 0;
      char v13 = 0;
      v14 = @"arrow.uturn.backward";
      v43 = sel_assistantUndo;
      double v15 = 20.0;
      double v16 = 0.0;
      double v17 = 0.0;
      v18 = &__block_literal_global_74_3;
      goto LABEL_29;
    case 4:
      _UINSLocalizedStringWithDefaultValue(@"Redo", @"Redo");
      char v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v11 = 0;
      int v12 = 0;
      char v13 = 0;
      v14 = @"arrow.uturn.forward";
      v43 = sel_assistantRedo;
      double v15 = 20.0;
      double v16 = 0.0;
      double v17 = 0.0;
      v18 = &__block_literal_global_84_2;
      goto LABEL_29;
    case 5:
      _UINSLocalizedStringWithDefaultValue(@"Bold", @"Bold");
      char v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v43 = sel_assistantBold;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_6;
      aBlock[3] = &__block_descriptor_40_e25_v16__0__UIBarButtonItem_8l;
      aBlock[4] = a1;
      v18 = _Block_copy(aBlock);
      v11 = 0;
      int v12 = 0;
      char v13 = 0;
      double v15 = 20.0;
      double v16 = 0.0;
      v14 = @"bold";
      goto LABEL_28;
    case 6:
      _UINSLocalizedStringWithDefaultValue(@"Italic", @"Italic");
      char v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v43 = sel_assistantItalic;
      v58[0] = MEMORY[0x1E4F143A8];
      v58[1] = 3221225472;
      v58[2] = __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_7;
      v58[3] = &__block_descriptor_40_e25_v16__0__UIBarButtonItem_8l;
      v58[4] = a1;
      v18 = _Block_copy(v58);
      v11 = 0;
      int v12 = 0;
      char v13 = 0;
      double v15 = 20.0;
      double v17 = -1.0;
      v14 = @"italic";
      double v16 = 0.0;
      goto LABEL_29;
    case 7:
      _UINSLocalizedStringWithDefaultValue(@"Underline", @"Underline");
      char v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v43 = sel_assistantUnderline;
      v57[0] = MEMORY[0x1E4F143A8];
      v57[1] = 3221225472;
      v57[2] = __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_8;
      v57[3] = &__block_descriptor_40_e25_v16__0__UIBarButtonItem_8l;
      v57[4] = a1;
      v18 = _Block_copy(v57);
      v11 = 0;
      int v12 = 0;
      char v13 = 0;
      double v15 = 20.0;
      double v17 = 0.0;
      v14 = @"underline";
      double v16 = -1.0;
      goto LABEL_29;
    case 8:
      v19 = objc_alloc_init(UIKeyboardBIUImageGenerator);
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_9;
      v55[3] = &unk_1E530AA40;
      v56 = v19;
      v20 = v19;
      v18 = _Block_copy(v55);

      v11 = 0;
      v21 = 0;
      v14 = 0;
      int v12 = 0;
      v43 = 0;
      v22 = 0;
      double v15 = 20.0;
      double v16 = 0.0;
      int v23 = 1;
      double v17 = 0.0;
      double v24 = 0.0;
      char v10 = &stru_1ED0E84C0;
      goto LABEL_34;
    case 9:
      _UINSLocalizedStringWithDefaultValue(@"TEXT_FORMATTING_FORMAT", @"Format");
      char v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v43 = sel_assistantTextFormatting;
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_10;
      v54[3] = &__block_descriptor_40_e25_v16__0__UIBarButtonItem_8l;
      v54[4] = a1;
      v18 = _Block_copy(v54);
      v11 = 0;
      int v12 = 0;
      char v13 = 0;
      double v15 = 20.0;
      double v16 = 0.0;
      v14 = @"textformat";
      goto LABEL_28;
    case 10:
      v25 = [UIAssistantBarSeparatorView alloc];
      v21 = -[UIAssistantBarSeparatorView initWithFrame:](v25, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      +[UIAssistantBarSeparatorView preferredWidth];
      double v24 = v26;
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_21;
      v45[3] = &__block_descriptor_40_e25_v16__0__UIBarButtonItem_8l;
      v45[4] = a1;
      v18 = _Block_copy(v45);
      v11 = 0;
      v14 = 0;
      int v12 = 0;
      v43 = 0;
      v22 = 0;
      double v15 = 20.0;
      int v23 = 1;
      double v16 = 0.0;
      double v17 = 0.0;
      goto LABEL_34;
    case 11:
      _UINSLocalizedStringWithDefaultValue(@"Emoji", @"Emoji");
      char v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v43 = sel_assistantEmoji;
      v53[0] = MEMORY[0x1E4F143A8];
      v53[1] = 3221225472;
      v53[2] = __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_12;
      v53[3] = &__block_descriptor_40_e25_v16__0__UIBarButtonItem_8l;
      v53[4] = a1;
      v18 = _Block_copy(v53);
      v11 = 0;
      int v12 = 0;
      char v13 = 1;
      double v15 = 22.0;
      double v16 = 0.0;
      v14 = @"face.grinning.inverse";
      goto LABEL_28;
    case 12:
      _UINSLocalizedStringWithDefaultValue(@"Dictation", @"Dictation");
      char v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v43 = sel_assistantDictation;
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_13;
      v52[3] = &__block_descriptor_40_e25_v16__0__UIBarButtonItem_8l;
      v52[4] = a1;
      v27 = v52;
      goto LABEL_16;
    case 13:
      _UINSLocalizedStringWithDefaultValue(@"Dictation", @"Dictation");
      char v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v43 = sel_assistantDictationMicOn;
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_14;
      v51[3] = &__block_descriptor_40_e25_v16__0__UIBarButtonItem_8l;
      v51[4] = a1;
      v27 = v51;
LABEL_16:
      v18 = _Block_copy(v27);
      v11 = 0;
      int v12 = 0;
      char v13 = 1;
      double v15 = 22.0;
      double v16 = 0.0;
      v14 = @"mic";
      goto LABEL_28;
    case 14:
      _UINSLocalizedStringWithDefaultValue(@"Dismiss", @"Dismiss");
      char v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v43 = sel_assistantDismiss;
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_15;
      v50[3] = &__block_descriptor_40_e25_v16__0__UIBarButtonItem_8l;
      v50[4] = a1;
      v18 = _Block_copy(v50);
      v11 = 0;
      int v12 = 1;
      double v15 = 22.0;
      double v16 = 0.0;
      v14 = @"keyboard.chevron.compact.down";
      goto LABEL_26;
    case 15:
      _UINSLocalizedStringWithDefaultValue(@"Show Keyboard", @"Show Keyboard");
      char v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v43 = sel_assistantShowKeyboard;
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_17;
      v48[3] = &__block_descriptor_40_e25_v16__0__UIBarButtonItem_8l;
      v48[4] = a1;
      v18 = _Block_copy(v48);
      v11 = 0;
      int v12 = 1;
      double v15 = 22.0;
      double v16 = 0.0;
      v14 = @"keyboard";
      goto LABEL_26;
    case 16:
      _UINSLocalizedStringWithDefaultValue(@"Keyboard", @"Keyboard");
      char v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_19;
      v47[3] = &__block_descriptor_40_e25_v16__0__UIBarButtonItem_8l;
      v47[4] = a1;
      v18 = _Block_copy(v47);
      v11 = 0;
      int v12 = 0;
      char v13 = 0;
      v43 = 0;
      double v15 = 22.0;
      double v16 = 0.0;
      double v17 = 0.0;
      v14 = @"keyboard.badge.ellipsis";
      goto LABEL_29;
    case 18:
      _UINSLocalizedStringWithDefaultValue(@"Show Writeboard", @"Show Writeboard");
      char v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      int v28 = _AXSEnhanceTextLegibilityEnabled();
      v29 = @"UIButtonBarKeyboardWriteboard_bold.png";
      if (!v28) {
        v29 = @"UIButtonBarKeyboardWriteboard.png";
      }
      v14 = v29;
      v43 = sel_assistantWriteboard;
      v30 = +[UIImage _kitImageNamed:v14 withTrait:0];
      v22 = [v30 _imageThatSuppressesAccessibilityHairlineThickening];

      v11 = 0;
      v21 = 0;
      int v12 = 0;
      int v23 = 1;
      double v15 = 20.0;
      double v16 = 0.0;
      v18 = &__block_literal_global_205_0;
      double v17 = 0.0;
      double v24 = 0.0;
      goto LABEL_34;
    case 19:
      _UINSLocalizedStringWithDefaultValue(@"Delete", @"Delete");
      char v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      uint64_t v31 = +[UIKeyboardImpl sharedInstance];

      v18 = 0;
      v11 = 0;
      int v12 = 0;
      char v13 = 0;
      v43 = sel_deleteFromInput;
      v14 = @"delete.left";
      double v15 = 20.0;
      double v16 = 0.0;
      double v17 = 0.0;
      id v8 = (id)v31;
      goto LABEL_29;
    case 20:
      _UINSLocalizedStringWithDefaultValue(@"Undo/Redo", @"Undo/Redo");
      char v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_20;
      v46[3] = &__block_descriptor_40_e25_v16__0__UIBarButtonItem_8l;
      v46[4] = a1;
      v18 = _Block_copy(v46);
      v11 = 0;
      int v12 = 0;
      char v13 = 0;
      v43 = 0;
      double v15 = 22.0;
      double v16 = 0.0;
      double v17 = 0.0;
      v14 = @"arrow.uturn.backward.circle.badge.ellipsis";
      goto LABEL_29;
    case 21:
      _UINSLocalizedStringWithDefaultValue(@"Return Key", @"Return Key");
      char v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v43 = sel_assistantReturnKey;
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_16;
      v49[3] = &__block_descriptor_40_e25_v16__0__UIBarButtonItem_8l;
      v49[4] = a1;
      v18 = _Block_copy(v49);
      v11 = 0;
      int v12 = 1;
      double v15 = 22.0;
      double v16 = 0.0;
      v14 = @"return";
LABEL_26:
      double v17 = 0.0;
      char v13 = 1;
      goto LABEL_29;
    case 22:
      _UINSLocalizedStringWithDefaultValue(@"Text Animation", @"Text Animation");
      char v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v32 = +[UIKeyboardInputModeController sharedInputModeController];
      v11 = [v32 textEffectsButtonLanguageCode];

      int v12 = 0;
      char v13 = 0;
      v14 = @"character.motion";
      v43 = sel_assistantTextAnimation;
      double v15 = 20.0;
      double v16 = 0.0;
      v18 = &__block_literal_global_151_0;
LABEL_28:
      double v17 = 0.0;
LABEL_29:
      v33 = [(id)objc_opt_class() configuredSymbolImageWithName:v14 size:v11 keyboardLanguageCode:v15];
      v22 = v33;
      double v24 = 0.0;
      if (v13)
      {
        v21 = 0;
        int v23 = 0;
      }
      else if ([v33 hasBaseline])
      {
        v34 = [v22 imageWithoutBaseline];

        objc_msgSend(v34, "_setAlignmentRectInsets:", 0.0, 0.0, 0.0, 0.0);
        v21 = 0;
        int v23 = 1;
        v22 = v34;
      }
      else
      {
        v21 = 0;
        int v23 = 1;
      }
LABEL_34:
      if (v16 != 0.0 || v17 != 0.0)
      {
        uint64_t v35 = objc_msgSend(v22, "imageWithAlignmentRectInsets:", 0.0, v17, v16, 0.0);

        v22 = (void *)v35;
      }
      if ((v23 | v44))
      {
        v36 = (UIButton *)v21;
      }
      else
      {
        v37 = [UIButton alloc];
        [v22 size];
        v38 = -[UIView initWithSize:](v37, "initWithSize:");
        [(UIControl *)v38 setPointerInteractionEnabled:1];
        [(UIButton *)v38 setImage:v22 forState:0];
        [v38 setAccessibilityLabel:v10];
        [(UIControl *)v38 addTarget:v8 action:v43 forControlEvents:64];
        v36 = v38;

        double v39 = 0.0;
        if (v12)
        {
          [v22 size];
          double v39 = v15 - v40;
        }
        -[UIButton setContentEdgeInsets:](v36, "setContentEdgeInsets:", 0.0, 0.0, v39, 0.0);
      }
      v41 = [UIBarButtonItem alloc];
      if (v36)
      {
        v9 = [(UIBarButtonItem *)v41 initWithCustomView:v36];
      }
      else
      {
        v9 = [(UIBarButtonItem *)v41 initWithImage:v22 style:0 target:v8 action:v43];
        [(UIBarButtonItem *)v9 setTitle:v10];
      }
      [(UIBarButtonItem *)v9 setWidth:v24];
      [(UIBarButtonItem *)v9 _setAutoValidationHandler:v18];

      break;
    default:
      break;
  }

  return v9;
}

void __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  _getResponderForEditing();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEnabled:", objc_msgSend(v3, "canPerformAction:withSender:", sel_cut_, 0));
}

void __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  _getResponderForEditing();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEnabled:", objc_msgSend(v3, "canPerformAction:withSender:", sel_copy_, 0));
}

void __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  _getResponderForEditing();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [v4 undoManager];
  objc_msgSend(v2, "setEnabled:", objc_msgSend(v3, "canUndo"));
}

void __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  _getResponderForEditing();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [v4 undoManager];
  objc_msgSend(v2, "setEnabled:", objc_msgSend(v3, "canRedo"));
}

void __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  _getResponderForEditing();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEnabled:", objc_msgSend(v3, "canPerformAction:withSender:", sel_paste_, 0));
}

void __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  _getResponderForEditing();
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  if ([v8 canPerformAction:sel_toggleBoldface_ withSender:0]) {
    uint64_t v4 = [*(id *)(a1 + 32) _isStyleItemEnable:v8];
  }
  else {
    uint64_t v4 = 0;
  }
  [v3 setEnabled:v4];
  BOOL v5 = _getStylingDictionaryForResponder(v8);
  uint64_t v6 = [v5 objectForKeyedSubscript:*(void *)off_1E52D2040];
  int v7 = [v6 fontDescriptor];
  objc_msgSend(v3, "setSelected:", (objc_msgSend(v7, "symbolicTraits") >> 1) & 1);
}

void __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  _getResponderForEditing();
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  if ([v8 canPerformAction:sel_toggleItalics_ withSender:0]) {
    uint64_t v4 = [*(id *)(a1 + 32) _isStyleItemEnable:v8];
  }
  else {
    uint64_t v4 = 0;
  }
  [v3 setEnabled:v4];
  BOOL v5 = _getStylingDictionaryForResponder(v8);
  uint64_t v6 = [v5 objectForKeyedSubscript:*(void *)off_1E52D2040];
  int v7 = [v6 fontDescriptor];
  objc_msgSend(v3, "setSelected:", objc_msgSend(v7, "symbolicTraits") & 1);
}

void __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = a2;
  _getResponderForEditing();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  if ([v7 canPerformAction:sel_toggleUnderline_ withSender:0]) {
    uint64_t v4 = [*(id *)(a1 + 32) _isStyleItemEnable:v7];
  }
  else {
    uint64_t v4 = 0;
  }
  [v3 setEnabled:v4];
  BOOL v5 = _getStylingDictionaryForResponder(v7);
  uint64_t v6 = [v5 objectForKeyedSubscript:*(void *)off_1E52D23E8];
  objc_msgSend(v3, "setSelected:", objc_msgSend(v6, "integerValue") != 0);
}

void __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_9(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = [a2 buttonGroup];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v4 = -[UIBarButtonItemGroup _items](v3);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    int v7 = 0;
    uint64_t v8 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v4);
        }
        v7 |= objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * i), "isEnabled", (void)v28);
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v6);

    [v3 setHidden:(v7 & 1) == 0];
    if (v7)
    {
      char v10 = [v3 representativeItem];
      v11 = _getResponderForEditing();
      int v12 = _getStylingDictionaryForResponder(v11);

      uint64_t v13 = *(void *)off_1E52D2040;
      v14 = [v12 objectForKeyedSubscript:*(void *)off_1E52D2040];
      double v15 = [v14 fontDescriptor];
      unsigned int v16 = [v15 symbolicTraits];

      double v17 = [v12 objectForKeyedSubscript:v13];
      v18 = [v17 fontDescriptor];
      char v19 = [v18 symbolicTraits];
      int v20 = v16 & 2 | v19 & 1;
      uint64_t v21 = (v16 >> 1) & 1;
      uint64_t v22 = v19 & 1;

      int v23 = [v12 objectForKeyedSubscript:*(void *)off_1E52D23E8];
      uint64_t v24 = [v23 integerValue];

      v25 = *(void **)(a1 + 32);
      if (v24) {
        BOOL v26 = 1;
      }
      else {
        BOOL v26 = v20 != 0;
      }
      v27 = [v25 BIUImageForBold:v21 italic:v22 underline:v24 != 0];
      [v10 setImage:v27];

      [v10 setSelected:v26];
    }
  }
  else
  {

    objc_msgSend(v3, "setHidden:", 1, (void)v28);
  }
}

void __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_10(uint64_t a1, void *a2)
{
  id v3 = a2;
  _getResponderForEditing();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [v5 _areDefaultTextFormattingAffordancesAvailable])
  {
    uint64_t v4 = [*(id *)(a1 + 32) _isStyleItemEnable:v5];
  }
  else
  {
    uint64_t v4 = 0;
  }
  [v3 setHidden:v4 ^ 1];
  [v3 setEnabled:v4];
  [v3 setSelected:0];
}

void __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_11(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v2 = +[UIKeyboardImpl activeInstance];
  id v3 = [v2 textInputTraits];
  if ([v3 allowsTextAnimationsType] == 2)
  {
    uint64_t v4 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    id v5 = [v4 systemInputAssistantViewController];
    uint64_t v6 = [v5 centerViewController];
    objc_msgSend(v7, "setHidden:", objc_msgSend(v6, "isVisibleForInputDelegate:inputViews:", 0, 0) ^ 1);
  }
  else
  {
    [v7 setHidden:1];
  }
}

void __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_12(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setHidden:", objc_msgSend(v2, "_isEmojiButtonVisible") ^ 1);
}

void __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_13(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_msgSend(v4, "setHidden:", (objc_msgSend(*(id *)(a1 + 32), "_isDictationButtonVisible") | +[UIDictationController isRunning](UIDictationController, "isRunning")) ^ 1);
  if (([v4 isHidden] & 1) == 0)
  {
    if (+[UIDictationController dictationIsFunctional]) {
      uint64_t v3 = +[UIKeyboard usesInputSystemUI] ^ 1;
    }
    else {
      uint64_t v3 = 0;
    }
    [v4 setEnabled:v3];
  }
}

void __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_14(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_msgSend(v4, "setHidden:", +[UIDictationController isRunning](UIDictationController, "isRunning") & ~objc_msgSend(*(id *)(a1 + 32), "_isDictationButtonVisible"));
  if (([v4 isHidden] & 1) == 0)
  {
    if (+[UIDictationController dictationIsFunctional]) {
      uint64_t v3 = +[UIKeyboard usesInputSystemUI] ^ 1;
    }
    else {
      uint64_t v3 = 0;
    }
    [v4 setEnabled:v3];
  }
}

void __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_15(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setHidden:", objc_msgSend(v2, "_isDismissButtonVisible") ^ 1);
}

void __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_16(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  if ([v2 _isScribbleButtonsVisible]) {
    BOOL v4 = +[UIKeyboard usesInputSystemUI];
  }
  else {
    BOOL v4 = 1;
  }
  [v3 setHidden:v4];
  uint64_t v5 = [v3 isHidden];
  id v6 = [v3 buttonGroup];

  [v6 setHidden:v5];
}

void __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_17(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setHidden:", objc_msgSend(v2, "_isShowKeyboardButtonVisible") ^ 1);
}

void __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_18(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[UIKeyboardImpl activeInstance];
  BOOL v4 = [v3 textInputTraits];
  uint64_t v5 = [v4 keyboardType];

  id v8 = +[UIKeyboardImpl activeInstance];
  unsigned int v6 = [v8 isMinimized] ^ 1;
  if (v5 == 126) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 1;
  }
  [v2 setHidden:v7];
}

void __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_19(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setHidden:", objc_msgSend(v2, "isKeyboardGroupVisible") ^ 1);
}

void __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_20(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  if ([v2 _isScribbleButtonsVisible]) {
    BOOL v4 = +[UIKeyboard usesInputSystemUI];
  }
  else {
    BOOL v4 = 1;
  }
  [v3 setHidden:v4];
  uint64_t v5 = [v3 isHidden];
  id v6 = [v3 buttonGroup];

  [v6 setHidden:v5];
}

void __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_21(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setHidden:", objc_msgSend(v2, "isKeyboardGroupVisible") ^ 1);
}

+ (id)configuredSymbolImageWithName:(id)a3 size:(double)a4
{
  return (id)[a1 configuredSymbolImageWithName:a3 size:0 keyboardLanguageCode:a4];
}

+ (id)configuredSymbolImageWithName:(id)a3 size:(double)a4 keyboardLanguageCode:(id)a5
{
  id v7 = a3;
  id v8 = (__CFString *)a5;
  v9 = +[UIKeyboard activeKeyboard];
  if ([v9 _lightStyleRenderConfig]) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = 2;
  }

  if (qword_1EB25D110 != -1) {
    dispatch_once(&qword_1EB25D110, &__block_literal_global_235_2);
  }
  if (qword_1EB25D100 != v10)
  {
    [(id)_MergedGlobals_17_4 removeAllObjects];
    qword_1EB25D100 = v10;
  }
  if (v8) {
    v11 = v8;
  }
  else {
    v11 = &stru_1ED0E84C0;
  }
  int v12 = [v7 stringByAppendingString:v11];
  uint64_t v13 = [(id)_MergedGlobals_17_4 objectForKey:v12];
  if (!v13)
  {
    v14 = +[UITraitCollection traitCollectionWithUserInterfaceStyle:v10];
    double v15 = v14;
    if (v14) {
      v14 = (void *)[v14 imageConfiguration];
    }
    id v16 = v14;

    double v17 = [(id)objc_opt_class() imageSymbolConfigurationForAssistantBarWithPointSize:a4];
    v18 = [v16 configurationByApplyingConfiguration:v17];

    if (v8)
    {
      char v19 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v8];
      uint64_t v20 = [v18 configurationWithLocale:v19];

      v18 = (void *)v20;
    }
    uint64_t v13 = +[UIImage imageNamed:v7 inBundle:qword_1EB25D108 withConfiguration:v18];
    if (!v13)
    {
      uint64_t v13 = +[UIImage _systemImageNamed:v7 withConfiguration:v18];
    }
    [(id)_MergedGlobals_17_4 setObject:v13 forKey:v12];
  }
  return v13;
}

void __92__UIAssistantBarButtonItemProvider_configuredSymbolImageWithName_size_keyboardLanguageCode___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:20];
  v1 = (void *)_MergedGlobals_17_4;
  _MergedGlobals_17_4 = v0;

  qword_1EB25D100 = 0;
  uint64_t v2 = [MEMORY[0x1E4F28B50] bundleWithPath:@"/System/Library/PrivateFrameworks/SFSymbols.framework/CoreGlyphsPriority.bundle"];
  id v3 = (void *)qword_1EB25D108;
  qword_1EB25D108 = v2;
}

+ (id)imageSymbolConfigurationForAssistantBarWithPointSize:(double)a3
{
  BOOL v4 = +[UIImageSymbolConfiguration configurationWithTextStyle:@"UICTFontTextStyleFootnote" scale:-1];
  uint64_t v5 = +[UIImageSymbolConfiguration configurationWithPointSize:4 weight:a3];
  id v6 = [v4 configurationByApplyingConfiguration:v5];

  return v6;
}

+ (id)inputWindowController
{
  id v3 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  BOOL v4 = [v3 visualModeManager];
  uint64_t v5 = [v4 shouldShowWithinAppWindow];

  return (id)[a1 inputWindowControllerForApplication:v5];
}

+ (id)inputWindowControllerForApplication:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  uint64_t v5 = [v4 visualModeManager];
  int v6 = [v5 useVisualModeWindowed];

  if (v3 && v6)
  {
    id v7 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    uint64_t v8 = [v7 containerRootController];
  }
  else
  {
    id v7 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
    uint64_t v8 = [v7 inputWindowRootViewController];
  }
  v9 = (void *)v8;

  return v9;
}

+ (id)defaultSystemLeadingBarButtonGroupsForItem:(id)a3
{
  v36[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 defaultSystemLeadingBarButtonGroups];
  if (!v5)
  {
    int v6 = [a1 barButtonItemForAssistantItemStyle:0 target:v4];
    [v6 setHidden:1];
    id v7 = [a1 barButtonItemForAssistantItemStyle:1 target:v4];
    [v7 setHidden:1];
    uint64_t v8 = [a1 barButtonItemForAssistantItemStyle:2 target:v4];
    v9 = [a1 barButtonItemForAssistantItemStyle:3 target:v4];
    uint64_t v10 = [a1 barButtonItemForAssistantItemStyle:4 target:v4];
    v11 = [(id)objc_opt_class() configuredSymbolImageWithName:@"scissors.badge.ellipsis" size:22.0];
    int v12 = [(id)objc_opt_class() configuredSymbolImageWithName:@"arrow.uturn.backward.circle.badge.ellipsis" size:22.0];
    uint64_t v13 = [[UIBarButtonItem alloc] initWithImage:v12 style:0 target:a1 action:0];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __79__UIAssistantBarButtonItemProvider_defaultSystemLeadingBarButtonGroupsForItem___block_invoke;
    v26[3] = &unk_1E530AA68;
    id v27 = v6;
    id v28 = v7;
    id v29 = v9;
    id v30 = v10;
    id v31 = v8;
    id v32 = v11;
    id v33 = v12;
    id v34 = a1;
    id v25 = v12;
    id v23 = v11;
    id v14 = v8;
    id v15 = v10;
    id v16 = v9;
    id v17 = v7;
    id v18 = v6;
    [(UIBarButtonItem *)v13 _setAutoValidationHandler:v26];
    v36[0] = v18;
    v36[1] = v17;
    v36[2] = v16;
    v36[3] = v15;
    v36[4] = v14;
    char v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:5];
    uint64_t v20 = [[UIBarButtonItemGroup alloc] initWithBarButtonItems:v19 representativeItem:v13];
    uint64_t v21 = v20;
    if (v20) {
      *(unsigned char *)&v20->_groupFlags |= 6u;
    }
    -[UIBarButtonItemGroup _setExpandStyle:](v20, "_setExpandStyle:", 1, v23);
    uint64_t v35 = v21;
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
  }
  return v5;
}

void __79__UIAssistantBarButtonItemProvider_defaultSystemLeadingBarButtonGroupsForItem___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(a1 + 88);
  id v16 = a2;
  id v4 = [v3 inputWindowController];
  uint64_t v5 = [v4 placement];

  uint64_t v6 = [v5 assistantView];
  id v7 = (void *)v6;
  if (v6) {
    uint64_t v8 = (void *)v6;
  }
  else {
    uint64_t v8 = v5;
  }
  id v9 = v8;

  char v10 = [v9 showsEditItems];
  if (v10)
  {
    v11 = +[UIKeyboardImpl activeInstance];
    int v12 = [v11 inputDelegate];
    uint64_t v13 = [v12 selectedTextRange];
    uint64_t v14 = [v13 _isRanged];

    [*(id *)(a1 + 32) setHidden:v14 ^ 1];
    [*(id *)(a1 + 40) setHidden:v14 ^ 1];
    [*(id *)(a1 + 48) setHidden:v14];
    [*(id *)(a1 + 56) setHidden:v14];
    [*(id *)(a1 + 64) setHidden:0];
    [v16 setHidden:0];
    uint64_t v15 = 80;
    if (v14) {
      uint64_t v15 = 72;
    }
    [v16 setImage:*(void *)(a1 + v15)];
  }
  else
  {
    [*(id *)(a1 + 32) setHidden:1];
    [*(id *)(a1 + 40) setHidden:1];
    [*(id *)(a1 + 48) setHidden:1];
    [*(id *)(a1 + 56) setHidden:1];
    [*(id *)(a1 + 64) setHidden:1];
    [v16 setHidden:1];
  }
}

+ (id)defaultSystemTrailingBarButtonGroupsForItem:(id)a3
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 defaultSystemTrailingBarButtonGroups];
  if (!v5)
  {
    uint64_t v6 = [a1 barButtonItemForAssistantItemStyle:5 target:v4];
    v20[0] = v6;
    id v7 = [a1 barButtonItemForAssistantItemStyle:6 target:v4];
    v20[1] = v7;
    uint64_t v8 = [a1 barButtonItemForAssistantItemStyle:7 target:v4];
    v20[2] = v8;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];

    char v10 = [a1 barButtonItemForAssistantItemStyle:8 target:v4];
    v11 = [[UIBarButtonItemGroup alloc] initWithBarButtonItems:v9 representativeItem:v10];
    int v12 = v11;
    if (v11) {
      *(unsigned char *)&v11->_groupFlags |= 6u;
    }
    [(UIBarButtonItemGroup *)v11 _setExpandStyle:1];
    uint64_t v13 = [a1 barButtonItemForAssistantItemStyle:9 target:v4];
    uint64_t v14 = [UIBarButtonItemGroup alloc];
    char v19 = v13;
    uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
    id v16 = [(UIBarButtonItemGroup *)v14 initWithBarButtonItems:v15 representativeItem:0];

    if (v16) {
      *(unsigned char *)&v16->_groupFlags |= 2u;
    }
    v18[0] = v12;
    v18[1] = v16;
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  }
  return v5;
}

+ (id)systemDefaultAssistantItem
{
  BOOL v3 = objc_alloc_init(UISystemDefaultTextInputAssistantItem);
  id v4 = [a1 defaultSystemLeadingBarButtonGroupsForItem:v3];
  [(UISystemDefaultTextInputAssistantItem *)v3 setLeadingBarButtonGroups:v4];

  uint64_t v5 = [a1 defaultSystemTrailingBarButtonGroupsForItem:v3];
  [(UISystemDefaultTextInputAssistantItem *)v3 setTrailingBarButtonGroups:v5];

  return v3;
}

+ (BOOL)_isInputModeVisible:(id)a3
{
  id v3 = a3;
  id v4 = [v3 primaryLanguage];
  if (UIKeyboardInputModeIsNonLinguistic(v4)) {
    LOBYTE(v5) = 0;
  }
  else {
    int v5 = [v3 isExtensionInputMode] ^ 1;
  }

  return v5;
}

+ (void)setScribbleLanguageIdentifier:(id)a3
{
  id v8 = a3;
  id PKTextInputInteractionClass = getPKTextInputInteractionClass();
  id v4 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  int v5 = [v4 scene];
  uint64_t v6 = [PKTextInputInteractionClass interactionForScene:v5];

  id v7 = [v6 enabledLanguageIdentifiers];
  LODWORD(v5) = [v7 containsObject:v8];

  if (v5) {
    [v6 setCurrentLanguageIdentifier:v8];
  }
}

+ (id)actionForInputMode:(id)a3
{
  id v4 = a3;
  int v5 = +[UIKeyboardInputModeController sharedInputModeController];
  uint64_t v6 = [v5 inputModeWithIdentifier:v4];

  if ([a1 _isInputModeVisible:v6])
  {
    id v7 = [v6 indicatorIcon];
    id v8 = [v6 identifier];
    if (UIKeyboardShowsTransliterationCandidatesForInputMode()) {
      [v6 monolingualDisplayName];
    }
    else {
    char v10 = [v6 extendedDisplayName];
    }

    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    uint64_t v20 = __55__UIAssistantBarButtonItemProvider_actionForInputMode___block_invoke;
    uint64_t v21 = &unk_1E52E9CD8;
    id v23 = a1;
    id v11 = v4;
    id v22 = v11;
    id v9 = +[UIAction actionWithTitle:v10 image:v7 identifier:v11 handler:&v18];
    if (objc_msgSend(a1, "_isScribbleButtonsVisible", v18, v19, v20, v21))
    {
      id PKTextInputInteractionClass = getPKTextInputInteractionClass();
      uint64_t v13 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
      uint64_t v14 = [v13 scene];
      uint64_t v15 = [PKTextInputInteractionClass interactionForScene:v14];

      id v16 = [v15 currentLanguageIdentifier];
    }
    else
    {
      id v16 = UIKeyboardGetCurrentInputMode();
    }
    if ([v11 isEqualToString:v16]) {
      [v9 setState:1];
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void __55__UIAssistantBarButtonItemProvider_actionForInputMode___block_invoke(uint64_t a1)
{
  id v4 = +[UIKeyboardImpl sharedInstance];
  if ([*(id *)(a1 + 40) _isScribbleButtonsVisible])
  {
    uint64_t v2 = +[UIKeyboardInputModeController sharedInputModeController];
    id v3 = [v2 inputModeIdentifierLastUsedForLanguage:*(void *)(a1 + 32)];
    [v4 setInputMode:v3 userInitiated:1];
  }
  else
  {
    [v4 setInputMode:*(void *)(a1 + 32) userInitiated:1];
  }
  [*(id *)(a1 + 40) updateFloatingAssistantBarIfNeeded];
}

+ (void)updateFloatingAssistantBarIfNeeded
{
  id v3 = [a1 inputWindowController];
  id v4 = [v3 placement];

  uint64_t v5 = [v4 assistantView];
  uint64_t v6 = (void *)v5;
  if (v5) {
    id v7 = (void *)v5;
  }
  else {
    id v7 = v4;
  }
  id v11 = v7;

  if ((updateFloatingAssistantBarIfNeeded_updatingFloatingAssistantBar & 1) == 0)
  {
    if ([v11 isFloatingAssistantView])
    {
      if (([v11 isCompactAssistantView] & 1) == 0)
      {
        id v8 = +[UIKeyboardPreferencesController sharedPreferencesController];
        id v9 = [v8 preferencesActions];
        uint64_t v10 = [v9 compactAssistantBarPersistentLocation];

        if (v10 == 1)
        {
          updateFloatingAssistantBarIfNeeded_updatingFloatingAssistantBar = 1;
          objc_msgSend(a1, "setAssistantBarCompact:forceReload:", objc_msgSend(v11, "isCompactAssistantView"), 0);
          updateFloatingAssistantBarIfNeeded_updatingFloatingAssistantBar = 0;
        }
      }
    }
  }
}

+ (void)setAssistantBarCompact:(BOOL)a3
{
}

+ (void)setAssistantBarCompact:(BOOL)a3 forceReload:(BOOL)a4
{
  BOOL v4 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__UIAssistantBarButtonItemProvider_setAssistantBarCompact_forceReload___block_invoke;
  aBlock[3] = &__block_descriptor_42_e5_v8__0l;
  BOOL v19 = a3;
  aBlock[4] = a1;
  BOOL v20 = a4;
  uint64_t v6 = (void (**)(void))_Block_copy(aBlock);
  id v7 = +[UIKeyboardPreferencesController sharedPreferencesController];
  id v8 = [v7 preferencesActions];
  char v9 = [v8 compactAssistantBarPersistentLocation];

  uint64_t v10 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  id v11 = [v10 visualModeManager];
  if (![v11 useVisualModeWindowed])
  {

    goto LABEL_5;
  }

  if (((v9 & 4) == 0) != v4)
  {
LABEL_5:
    v6[2](v6);
    goto LABEL_6;
  }
  uint64_t v12 = v4 ^ 1;
  uint64_t v13 = [a1 inputWindowControllerForApplication:v4];
  uint64_t v14 = [a1 inputWindowControllerForApplication:v12];
  uint64_t v15 = +[UIInputViewSetPlacement placement];
  [v13 setPlacement:v15 completion:&__block_literal_global_255_0];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __71__UIAssistantBarButtonItemProvider_setAssistantBarCompact_forceReload___block_invoke_3;
  v16[3] = &unk_1E52DA040;
  id v17 = v6;
  [v14 setPlacement:v15 completion:v16];

LABEL_6:
}

void __71__UIAssistantBarButtonItemProvider_setAssistantBarCompact_forceReload___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(unsigned __int8 *)(a1 + 40);
  id v3 = +[UIKeyboardPreferencesController sharedPreferencesController];
  BOOL v4 = [v3 preferencesActions];
  objc_msgSend(v4, "setCompactAssistantBarPersistentLocation:", objc_msgSend(v4, "compactAssistantBarPersistentLocation") & 0xFFFFFFFFFFFFFFFBLL | (4 * v2));

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "inputWindowController", 0);
  uint64_t v6 = [v5 hosting];
  id v7 = [v6 allHostingItems];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(unsigned __int8 *)(a1 + 40);
        uint64_t v13 = [*(id *)(*((void *)&v16 + 1) + 8 * v11) flickingAssistantViewSupport];
        [v13 setCompact:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  uint64_t v14 = +[UIKeyboardImpl activeInstance];
  [v14 updateAssistantView];

  if (*(unsigned char *)(a1 + 41))
  {
    uint64_t v15 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    [v15 reloadPlacement];
  }
}

uint64_t __71__UIAssistantBarButtonItemProvider_setAssistantBarCompact_forceReload___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)dismissFloatingKeyboard
{
  if (+[UIKeyboard isKeyboardProcess])
  {
    id v7 = +[UIKeyboardImpl activeInstance];
    id v3 = [v7 remoteTextInputPartner];
    [v3 forwardKeyboardOperation:a2 object:0];
  }
  else
  {
    id PKTextInputInteractionClass = getPKTextInputInteractionClass();
    uint64_t v5 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    uint64_t v6 = [v5 scene];
    id v7 = [PKTextInputInteractionClass interactionForScene:v6];

    [v7 dismissFloatingKeyboard];
  }
}

+ (void)presentFloatingKeyboard
{
  if (+[UIKeyboard isKeyboardProcess])
  {
    id v7 = +[UIKeyboardImpl activeInstance];
    id v3 = [v7 remoteTextInputPartner];
    [v3 forwardKeyboardOperation:a2 object:0];
  }
  else
  {
    id PKTextInputInteractionClass = getPKTextInputInteractionClass();
    uint64_t v5 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    uint64_t v6 = [v5 scene];
    id v7 = [PKTextInputInteractionClass interactionForScene:v6];

    if ([v7 isFloatingKeyboardVisible]) {
      [v7 dismissFloatingKeyboard];
    }
    [v7 presentFloatingKeyboard];
  }
}

+ (BOOL)isFloatingKeyboardVisible
{
  if (+[UIKeyboard isKeyboardProcess])
  {
    return +[UIKeyboardImpl isFloatingForced];
  }
  else
  {
    id PKTextInputInteractionClass = getPKTextInputInteractionClass();
    BOOL v4 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    uint64_t v5 = [v4 scene];
    uint64_t v6 = [PKTextInputInteractionClass interactionForScene:v5];

    LOBYTE(v4) = [v6 isFloatingKeyboardVisible];
    return (char)v4;
  }
}

+ (id)languageIndicatorMenu:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  if ([a1 _isScribbleButtonsVisible])
  {
    id PKTextInputInteractionClass = getPKTextInputInteractionClass();
    uint64_t v6 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    id v7 = [v6 scene];
    uint64_t v8 = [PKTextInputInteractionClass interactionForScene:v7];

    v51 = v8;
    uint64_t v9 = [v8 enabledLanguageIdentifiers];
    if (v9) {
      goto LABEL_6;
    }
  }
  else
  {
    v51 = 0;
  }
  uint64_t v9 = UIKeyboardGetActiveUniqueInputModesForHardwareKeyboard();
LABEL_6:
  uint64_t v10 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:5];
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v58 objects:v64 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v59 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = [a1 actionForInputMode:*(void *)(*((void *)&v58 + 1) + 8 * i)];
        if (v17) {
          [v11 addObject:v17];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v58 objects:v64 count:16];
    }
    while (v14);
  }

  if ([a1 _isEmojiButtonVisible])
  {
    long long v18 = _UINSLocalizedStringWithDefaultValue(@"Show Emoji", @"Show Emoji");
    long long v19 = [a1 configuredSymbolImageWithName:@"face.grinning" size:22.0];
    BOOL v20 = +[UIAction actionWithTitle:v18 image:v19 identifier:@"emoji" handler:&__block_literal_global_267_1];
    [v10 addObject:v20];
  }
  if ([a1 _isScribbleButtonsVisible])
  {
    if ([a1 isFloatingKeyboardVisible])
    {
      uint64_t v21 = _UINSLocalizedStringWithDefaultValue(@"Hide Keyboard", @"Hide Keyboard");
      id v22 = [a1 configuredSymbolImageWithName:@"keyboard" size:22.0];
      v57[0] = MEMORY[0x1E4F143A8];
      v57[1] = 3221225472;
      v57[2] = __58__UIAssistantBarButtonItemProvider_languageIndicatorMenu___block_invoke_3;
      v57[3] = &__block_descriptor_40_e18_v16__0__UIAction_8l;
      v57[4] = a1;
      id v23 = v57;
    }
    else
    {
      uint64_t v21 = _UINSLocalizedStringWithDefaultValue(@"Show Keyboard", @"Show Keyboard");
      id v22 = [a1 configuredSymbolImageWithName:@"keyboard" size:22.0];
      v56[0] = MEMORY[0x1E4F143A8];
      v56[1] = 3221225472;
      v56[2] = __58__UIAssistantBarButtonItemProvider_languageIndicatorMenu___block_invoke_4;
      v56[3] = &__block_descriptor_40_e18_v16__0__UIAction_8l;
      v56[4] = a1;
      id v23 = v56;
    }
    goto LABEL_23;
  }
  if ([a1 _isShowKeyboardButtonVisible])
  {
    [a1 dismissFloatingKeyboardFromPencilKitIfNeeded];
    uint64_t v21 = _UINSLocalizedStringWithDefaultValue(@"Show Keyboard", @"Show Keyboard");
    id v22 = [a1 configuredSymbolImageWithName:@"keyboard" size:22.0];
    id v23 = &__block_literal_global_275_1;
LABEL_23:
    id v24 = +[UIAction actionWithTitle:v21 image:v22 identifier:@"keyboard" handler:v23];
    [v10 addObject:v24];
  }
  if ((_os_feature_enabled_impl() & 1) != 0 || _os_feature_enabled_impl())
  {
    if (![a1 _isMinimizeAssistantBarButtonVisible]) {
      goto LABEL_33;
    }
    if (v3)
    {
      id v25 = _UINSLocalizedStringWithDefaultValue(@"Expand", @"Expand");
      BOOL v26 = [a1 configuredSymbolImageWithName:@"arrow.up.left.and.arrow.down.right" size:22.0];
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = __58__UIAssistantBarButtonItemProvider_languageIndicatorMenu___block_invoke_6;
      v55[3] = &__block_descriptor_40_e18_v16__0__UIAction_8l;
      void v55[4] = a1;
      id v27 = @"minimize";
      id v28 = v55;
    }
    else
    {
      id v25 = _UINSLocalizedStringWithDefaultValue(@"Minimize", @"Minimize");
      BOOL v26 = [a1 configuredSymbolImageWithName:@"arrow.down.right.and.arrow.up.left" size:22.0];
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = __58__UIAssistantBarButtonItemProvider_languageIndicatorMenu___block_invoke_7;
      v54[3] = &__block_descriptor_40_e18_v16__0__UIAction_8l;
      v54[4] = a1;
      id v27 = @"minimize";
      id v28 = v54;
    }
  }
  else
  {
    if (![a1 _isDismissButtonVisible]) {
      goto LABEL_33;
    }
    id v25 = _UINSLocalizedStringWithDefaultValue(@"Dismiss", @"Dismiss");
    BOOL v26 = [a1 configuredSymbolImageWithName:@"keyboard.chevron.compact.down" size:22.0];
    id v27 = @"dismiss";
    id v28 = &__block_literal_global_299;
  }
  id v29 = +[UIAction actionWithTitle:v25 image:v26 identifier:v27 handler:v28];
  [v10 addObject:v29];

LABEL_33:
  if ([a1 _isScribbleButtonsVisible])
  {
    id v30 = _UINSLocalizedStringWithDefaultValue(@"Pencil Settings…", @"Pencil Settings…");
    id v31 = [a1 configuredSymbolImageWithName:@"gear" size:22.0];
    id v32 = &__block_literal_global_310;
  }
  else
  {
    if (!+[UIInputSwitcherView canShowKeyboardSettings]) {
      goto LABEL_38;
    }
    id v30 = _UINSLocalizedStringWithDefaultValue(@"Keyboard Settings…", @"Keyboard Settings…");
    id v31 = [a1 configuredSymbolImageWithName:@"gear" size:22.0];
    id v32 = &__block_literal_global_319_1;
  }
  id v33 = +[UIAction actionWithTitle:v30 image:v31 identifier:@"setting" handler:v32];
  [v10 addObject:v33];

LABEL_38:
  id v34 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
  if ((unint64_t)[v11 count] >= 2)
  {
    uint64_t v35 = +[UIMenu menuWithTitle:&stru_1ED0E84C0 image:0 identifier:@"keyboards" options:1 children:v11];
    [v34 addObject:v35];
  }
  v36 = +[UIMenu menuWithTitle:&stru_1ED0E84C0 image:0 identifier:@"action" options:1 children:v10];
  [v34 addObject:v36];
  if (os_variant_has_internal_diagnostics())
  {
    if ([a1 _isScribbleButtonsVisible])
    {
      v49 = _UINSLocalizedStringWithDefaultValue(@"Report a Problem…", @"Report a Problem…");
      double v39 = [a1 configuredSymbolImageWithName:@"ladybug" size:22.0];
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __58__UIAssistantBarButtonItemProvider_languageIndicatorMenu___block_invoke_11;
      v52[3] = &unk_1E52DB038;
      id v53 = v51;
      double v40 = +[UIAction actionWithTitle:v49 image:v39 identifier:@"pencilProblemReporter" handler:v52];
      v63 = v40;
      v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v63 count:1];
      v42 = +[UIMenu menuWithTitle:&stru_1ED0E84C0 image:0 identifier:@"internal" options:1 children:v41];
      [v34 addObject:v42];

      v43 = v53;
    }
    else
    {
      BOOL v44 = TIGetTypoTrackerButtonValue_0();
      int v45 = [v44 BOOLValue];

      if (!v45) {
        goto LABEL_41;
      }
      v43 = _UINSLocalizedStringWithDefaultValue(@"Keyboard Feedback…", @"Keyboard Feedback…");
      v50 = [a1 configuredSymbolImageWithName:@"ant" size:22.0];
      v46 = +[UIAction actionWithTitle:v43 image:v50 identifier:@"typotracker" handler:&__block_literal_global_352];
      v62 = v46;
      v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v62 count:1];
      v48 = +[UIMenu menuWithTitle:&stru_1ED0E84C0 image:0 identifier:@"internal" options:1 children:v47];
      [v34 addObject:v48];
    }
  }
LABEL_41:
  v37 = +[UIMenu menuWithTitle:&stru_1ED0E84C0 image:0 identifier:@"action" options:1 children:v34];

  return v37;
}

void __58__UIAssistantBarButtonItemProvider_languageIndicatorMenu___block_invoke()
{
}

void __58__UIAssistantBarButtonItemProvider_languageIndicatorMenu___block_invoke_2()
{
  id v0 = +[UIKeyboardImpl sharedInstance];
  [v0 presentEmojiPopoverViaTrigger:@"ucb" completion:0];
}

uint64_t __58__UIAssistantBarButtonItemProvider_languageIndicatorMenu___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissFloatingKeyboard];
}

uint64_t __58__UIAssistantBarButtonItemProvider_languageIndicatorMenu___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentFloatingKeyboard];
}

void __58__UIAssistantBarButtonItemProvider_languageIndicatorMenu___block_invoke_5()
{
  id v3 = +[UIKeyboardImpl activeInstance];
  id v0 = [v3 delegateAsResponder];
  int v1 = [v0 _suppressSoftwareKeyboard];

  if (v1)
  {
    uint64_t v2 = [v3 delegateAsResponder];
    [v2 _setSuppressSoftwareKeyboard:0];
  }
  else if ([v3 isMinimized])
  {
    [v3 showKeyboardWithoutSuppressionPolicy];
  }
}

uint64_t __58__UIAssistantBarButtonItemProvider_languageIndicatorMenu___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAssistantBarCompact:0];
}

uint64_t __58__UIAssistantBarButtonItemProvider_languageIndicatorMenu___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAssistantBarCompact:1];
}

void __58__UIAssistantBarButtonItemProvider_languageIndicatorMenu___block_invoke_8()
{
  id v2 = +[UIKeyboardImpl activeInstance];
  if ([v2 isMinimized])
  {
    id v0 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    [v0 setHideSystemInputAssistantView:1];

    int v1 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    [v1 minimize];
  }
}

uint64_t __58__UIAssistantBarButtonItemProvider_languageIndicatorMenu___block_invoke_9()
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    int v1 = (void *)MEMORY[0x1E4FAE270];
    return [v1 performSelector:sel_launchPencilSettings];
  }
  return result;
}

uint64_t __58__UIAssistantBarButtonItemProvider_languageIndicatorMenu___block_invoke_10()
{
  return [MEMORY[0x1E4FAE270] launchKeyboardSettings];
}

uint64_t __58__UIAssistantBarButtonItemProvider_languageIndicatorMenu___block_invoke_11(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    id v3 = *(void **)(a1 + 32);
    return [v3 presentProblemReportingView];
  }
  return result;
}

void __58__UIAssistantBarButtonItemProvider_languageIndicatorMenu___block_invoke_12()
{
  id v0 = +[UIKeyboardImpl activeInstance];
  [v0 createTypoTrackerReport];
}

+ (id)languageIndicatorImage
{
  if ([a1 _isScribbleButtonsVisible])
  {
    id PKTextInputInteractionClass = getPKTextInputInteractionClass();
    BOOL v4 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    uint64_t v5 = [v4 scene];
    uint64_t v6 = [PKTextInputInteractionClass interactionForScene:v5];

    id v7 = [v6 enabledLanguageIdentifiers];
    unint64_t v8 = [v7 count];

    if (v8 >= 2)
    {
      uint64_t v9 = +[UIKeyboardInputModeController sharedInputModeController];
      uint64_t v10 = [v6 currentLanguageIdentifier];
      uint64_t v11 = [v9 inputModeWithIdentifier:v10];

      id v12 = [v11 indicatorIcon];

      goto LABEL_7;
    }
LABEL_9:

    goto LABEL_10;
  }
  if (UIKeyboardHasMultipleActiveLinguisticNonExtensionInputModes())
  {
    uint64_t v13 = +[UIKeyboardInputModeController sharedInputModeController];
    uint64_t v14 = UIKeyboardGetCurrentInputMode();
    uint64_t v6 = [v13 inputModeWithIdentifier:v14];

    if ([a1 _isInputModeVisible:v6])
    {
      id v12 = [v6 indicatorIcon];
LABEL_7:

      if (v12) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_10:
  uint64_t v15 = [(id)objc_opt_class() configuredSymbolImageWithName:@"keyboard.badge.ellipsis" size:22.0];
  [v15 alignmentRectInsets];
  id v12 = objc_msgSend(v15, "imageWithAlignmentRectInsets:", v16 + 2.0, v17 + 2.5, v18 + -2.0, v19 + -2.5);

LABEL_11:
  if (+[UIKeyboard usesInputSystemUI])
  {
    BOOL v20 = +[UIColor clearColor];
    uint64_t v21 = [v12 imageWithTintColor:v20 renderingMode:1];

    id v12 = (void *)v21;
  }
  return v12;
}

+ (id)languageIndicatorItem:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [a1 languageIndicatorImage];
  uint64_t v6 = [UIBarButtonItem alloc];
  id v7 = v6;
  if (v3)
  {
    unint64_t v8 = +[UIAction actionWithTitle:&stru_1ED0E84C0 image:v5 identifier:0 handler:&__block_literal_global_355_1];
    uint64_t v9 = [(UIBarButtonItem *)v7 initWithPrimaryAction:v8];
  }
  else
  {
    uint64_t v9 = [(UIBarButtonItem *)v6 initWithImage:v5 menu:0];
  }
  uint64_t v10 = _UINSLocalizedStringWithDefaultValue(@"Keyboard", @"Keyboard");
  [(UIBarButtonItem *)v9 setTitle:v10];

  [(UIBarItem *)v9 setTag:1735287116];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __58__UIAssistantBarButtonItemProvider_languageIndicatorItem___block_invoke_2;
  v13[3] = &__block_descriptor_41_e28___UIMenu_24__0_8__NSArray_16l;
  v13[4] = a1;
  BOOL v14 = v3;
  [(UIBarButtonItem *)v9 _setSecondaryActionsProvider:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__UIAssistantBarButtonItemProvider_languageIndicatorItem___block_invoke_3;
  v12[3] = &__block_descriptor_40_e25_v16__0__UIBarButtonItem_8l;
  v12[4] = a1;
  [(UIBarButtonItem *)v9 _setAutoValidationHandler:v12];
  [(UIBarButtonItem *)v9 setIsKeyboardItem:1];

  return v9;
}

uint64_t __58__UIAssistantBarButtonItemProvider_languageIndicatorItem___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) languageIndicatorMenu:*(unsigned __int8 *)(a1 + 40)];
}

void __58__UIAssistantBarButtonItemProvider_languageIndicatorItem___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_msgSend(v4, "setHidden:", objc_msgSend(*(id *)(a1 + 32), "isKeyboardGroupVisible") ^ 1);
  if ([*(id *)(a1 + 32) _isKeyboardItemEnabled]) {
    uint64_t v3 = +[UIKeyboard usesInputSystemUI] ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }
  [v4 setEnabled:v3];
}

+ (id)dictationActionForInputMode:(id)a3 inCurrentInputMode:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[UIKeyboardInputMode dictationInputMode];
  unint64_t v8 = [v7 indicatorIconForDictationLanguage:v5 scaleFactor:1.0];

  uint64_t v9 = UIKeyboardLocalizedDictationDisplayName(v5);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __83__UIAssistantBarButtonItemProvider_dictationActionForInputMode_inCurrentInputMode___block_invoke;
  v13[3] = &unk_1E52DB038;
  id v10 = v5;
  id v14 = v10;
  uint64_t v11 = +[UIAction actionWithTitle:v9 image:v8 identifier:v10 handler:v13];

  LODWORD(v9) = [v10 isEqualToString:v6];
  if (v9) {
    [v11 setState:1];
  }

  return v11;
}

void __83__UIAssistantBarButtonItemProvider_dictationActionForInputMode_inCurrentInputMode___block_invoke(uint64_t a1)
{
  id v2 = +[UIDictationController sharedInstance];
  [v2 setReasonType:12];

  uint64_t v3 = +[UIDictationController sharedInstance];
  [v3 switchToDictationLanguage:*(void *)(a1 + 32)];

  id v4 = +[UIDictationView sharedInstance];
  [v4 setSwitchingLanguage:0];
}

+ (id)dictationMenu
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[UIKeyboardInputModeController sharedInputModeController];
  id v4 = [v3 enabledDictationLanguages];

  if ((unint64_t)[v4 count] >= 2)
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    id v7 = +[UIKeyboardImpl activeInstance];
    unint64_t v8 = [v7 activeDictationLanguage];

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v9 = v4;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v30 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = objc_msgSend(a1, "dictationActionForInputMode:inCurrentInputMode:", *(void *)(*((void *)&v29 + 1) + 8 * i), v8, (void)v29);
          [v6 addObject:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v11);
    }

    if (+[UIInputSwitcherView canShowKeyboardSettings])
    {
      uint64_t v15 = _UILocalizedStringInSystemLanguage(@"Dictation Settings…", @"Dictation Settings…");
      double v16 = [a1 configuredSymbolImageWithName:@"gear" size:22.0];
      double v17 = +[UIAction actionWithTitle:v15 image:v16 identifier:@"setting" handler:&__block_literal_global_364_0];
    }
    else
    {
      double v17 = 0;
    }
    double v18 = +[UIMenu menuWithTitle:&stru_1ED0E84C0, 0, @"keyboards", 1, v6, (void)v29 image identifier options children];
    v36[0] = v18;
    if (v17)
    {
      uint64_t v35 = v17;
      double v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
    }
    else
    {
      double v19 = (void *)MEMORY[0x1E4F1CBF0];
    }
    BOOL v20 = +[UIMenu menuWithTitle:&stru_1ED0E84C0 image:0 identifier:@"action" options:1 children:v19];
    v36[1] = v20;
    uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];

    if (v17) {
    if (os_variant_has_internal_diagnostics())
    }
    {
      id v23 = _UILocalizedStringInSystemLanguage(@"Dictation Feedback", @"Dictation Feedback");
      id v24 = [a1 configuredSymbolImageWithName:@"ladybug" size:22.0];
      id v25 = +[UIAction actionWithTitle:v23 image:v24 identifier:@"report" handler:&__block_literal_global_372];

      id v34 = v25;
      BOOL v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
      id v27 = +[UIMenu menuWithTitle:&stru_1ED0E84C0 image:0 identifier:@"report" options:1 children:v26];

      if (v21)
      {
        uint64_t v28 = [v21 arrayByAddingObject:v27];

        uint64_t v21 = (void *)v28;
      }
      else
      {
        id v33 = v27;
        uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
      }
    }
    id v5 = +[UIMenu menuWithTitle:&stru_1ED0E84C0 image:0 identifier:@"action" options:1 children:v21];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

uint64_t __49__UIAssistantBarButtonItemProvider_dictationMenu__block_invoke()
{
  return [MEMORY[0x1E4FAE270] launchDictationSettings];
}

void __49__UIAssistantBarButtonItemProvider_dictationMenu__block_invoke_2()
{
  id v0 = +[UIDictationController sharedInstance];
  [v0 launchDictationFeedbackApp];
}

+ (id)unmodifiableSystemAssistantItem:(int64_t)a3
{
  v83[2] = *MEMORY[0x1E4F143B8];
  if ((unint64_t)(a3 - 2) > 2)
  {
    id v4 = objc_alloc_init(UISystemDefaultTextInputAssistantItem);
    v62 = [MEMORY[0x1E4F1CA48] array];
    v72 = [MEMORY[0x1E4F1CA48] array];
    id v6 = [a1 barButtonItemForAssistantItemStyle:18 target:v4];
    uint64_t v65 = [a1 barButtonItemForAssistantItemStyle:11 target:v4];
    id v7 = [a1 barButtonItemForAssistantItemStyle:12 target:v4 forcePlainButton:a3 == 1];
    if (+[UIDictationController isRunning]
      && (+[UIKeyboard isKeyboardProcess]
       || !+[UIKeyboard usesInputSystemUI]))
    {
      uint64_t v8 = [a1 barButtonItemForAssistantItemStyle:13 target:v4 forcePlainButton:a3 == 1];

      v70 = (void *)v8;
    }
    else
    {
      v70 = v7;
    }
    v67 = [a1 barButtonItemForAssistantItemStyle:21 target:v4 forcePlainButton:a3 == 1];
    v69 = [a1 barButtonItemForAssistantItemStyle:22 target:v4];
    v64 = [a1 barButtonItemForAssistantItemStyle:14 target:v4];
    v63 = [a1 barButtonItemForAssistantItemStyle:15 target:v4];
    uint64_t v9 = [a1 barButtonItemForAssistantItemStyle:10 target:v4];
    uint64_t v10 = [a1 barButtonItemForAssistantItemStyle:3 target:v4];
    uint64_t v11 = [a1 barButtonItemForAssistantItemStyle:4 target:v4];
    uint64_t v12 = [UIBarButtonItemGroup alloc];
    long long v61 = (void *)v9;
    v83[0] = v6;
    v83[1] = v9;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v83 count:2];
    v66 = [(UIBarButtonItemGroup *)v12 initWithBarButtonItems:v13 representativeItem:0];

    id v14 = +[UIKeyboardImpl activeInstance];
    uint64_t v15 = [v14 delegateAsResponder];
    v68 = [v15 _assistantBarButtonItemForWritingToolsWithStyle:24];

    double v16 = +[UIKeyboardImpl activeInstance];
    double v17 = [v16 delegateAsResponder];
    *((void *)&v71 + 1) = [v17 _assistantBarButtonItemForWritingToolsWithStyle:25];

    double v18 = +[UIKeyboardImpl activeInstance];
    double v19 = [v18 delegateAsResponder];
    *(void *)&long long v71 = [v19 _assistantBarButtonItemForWritingToolsWithStyle:23];

    BOOL v20 = [a1 barButtonItemForAssistantItemStyle:20 target:v4];
    [v20 setIsKeyboardItem:1];
    [v10 setIsKeyboardItem:1];
    [v11 setIsKeyboardItem:1];
    uint64_t v21 = [UIBarButtonItemGroup alloc];
    long long v60 = v10;
    v82[0] = v10;
    v82[1] = v11;
    id v22 = v11;
    id v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v82 count:2];
    long long v59 = v20;
    id v24 = [(UIBarButtonItemGroup *)v21 initWithBarButtonItems:v23 representativeItem:v20];

    [(UIBarButtonItemGroup *)v24 _setExpandStyle:1];
    [(UIBarButtonItemGroup *)v24 _setShouldAlwaysCollapse:1];
    [v62 addObject:v24];
    id v25 = [a1 barButtonItemForAssistantItemStyle:16 target:v4];
    long long v58 = v25;
    if ((_os_feature_enabled_impl() & 1) != 0 || _os_feature_enabled_impl())
    {
      BOOL v26 = [a1 languageIndicatorItem:0];
      id v27 = [UIBarButtonItemGroup alloc];
      v81 = v26;
      char v28 = 1;
      long long v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v81 count:1];
      long long v30 = [(UIBarButtonItemGroup *)v27 initWithBarButtonItems:v29 representativeItem:0];

      long long v31 = v62;
    }
    else
    {
      if (a3 == 1)
      {
        [v25 setIsKeyboardItem:1];
        long long v32 = [UIBarButtonItemGroup alloc];
        v80[0] = v65;
        v80[1] = v63;
        v80[2] = v64;
        id v33 = (void *)MEMORY[0x1E4F1C978];
        id v34 = v80;
        uint64_t v35 = 3;
      }
      else
      {
        long long v32 = [UIBarButtonItemGroup alloc];
        v79[0] = v65;
        v79[1] = v70;
        v79[2] = v63;
        v79[3] = v64;
        id v33 = (void *)MEMORY[0x1E4F1C978];
        id v34 = v79;
        uint64_t v35 = 4;
      }
      v36 = [v33 arrayWithObjects:v34 count:v35];
      long long v30 = [(UIBarButtonItemGroup *)v32 initWithBarButtonItems:v36 representativeItem:v25];

      [(UIBarButtonItemGroup *)v30 _setExpandStyle:1];
      [(UIBarButtonItemGroup *)v30 _setShouldAlwaysCollapse:1];
      char v28 = 0;
      long long v31 = v62;
    }
    [v31 addObject:v30];
    if (v68)
    {
      v37 = [UIBarButtonItemGroup alloc];
      v78 = v68;
      uint64_t v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v78 count:1];
      double v39 = [(UIBarButtonItemGroup *)v37 initWithBarButtonItems:v38 representativeItem:0];

      [v62 addObject:v39];
    }
    if (a3 == 1) {
      char v40 = 1;
    }
    else {
      char v40 = v28;
    }
    if ((v40 & 1) == 0) {
      [v72 addObject:v66];
    }
    [v69 setIsKeyboardItem:1];
    v41 = [UIBarButtonItemGroup alloc];
    v77 = v69;
    v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v77 count:1];
    v43 = [(UIBarButtonItemGroup *)v41 initWithBarButtonItems:v42 representativeItem:0];

    [v72 addObject:v43];
    if (v71 != 0)
    {
      id v44 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      int v45 = v44;
      if (*((void *)&v71 + 1)) {
        objc_msgSend(v44, "addObject:");
      }
      if ((void)v71) {
        [v45 addObject:(void)v71];
      }
      v46 = [[UIBarButtonItemGroup alloc] initWithBarButtonItems:v45 representativeItem:0];
      [v72 addObject:v46];
    }
    v47 = v70;
    if (a3 == 1)
    {
      if ([a1 _isDictationButtonVisible])
      {
        if (+[UIKeyboard usesInputSystemUI])
        {
          v48 = [v70 image];
          v49 = +[UIColor clearColor];
          v50 = [v48 imageWithTintColor:v49 renderingMode:1];
          [v70 setImage:v50];

          v47 = v70;
        }
        v74[0] = MEMORY[0x1E4F143A8];
        v74[1] = 3221225472;
        v74[2] = __68__UIAssistantBarButtonItemProvider_unmodifiableSystemAssistantItem___block_invoke;
        v74[3] = &__block_descriptor_40_e28___UIMenu_24__0_8__NSArray_16l;
        v74[4] = a1;
        [v47 _setSecondaryActionsProvider:v74];
        [v47 setIsKeyboardItem:1];
        [v47 setTag:1944175551];
        v73[0] = MEMORY[0x1E4F143A8];
        v73[1] = 3221225472;
        v73[2] = __68__UIAssistantBarButtonItemProvider_unmodifiableSystemAssistantItem___block_invoke_2;
        v73[3] = &__block_descriptor_40_e25_v16__0__UIBarButtonItem_8l;
        v73[4] = a1;
        [v47 _setAutoValidationHandler:v73];
        v51 = [UIBarButtonItemGroup alloc];
        v76 = v47;
        v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v76 count:1];
        id v53 = [(UIBarButtonItemGroup *)v51 initWithBarButtonItems:v52 representativeItem:0];

        [v72 addObject:v53];
      }
      [v67 setIsKeyboardItem:1];
      v54 = [UIBarButtonItemGroup alloc];
      v75 = v67;
      v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v75 count:1];
      v56 = [(UIBarButtonItemGroup *)v54 initWithBarButtonItems:v55 representativeItem:0];

      [v72 addObject:v56];
    }
    [(UISystemDefaultTextInputAssistantItem *)v4 setLeadingBarButtonGroups:v62];
    [(UISystemDefaultTextInputAssistantItem *)v4 setTrailingBarButtonGroups:v72];
  }
  else
  {
    id v4 = [a1 compactSystemAssistantItem];
  }
  return v4;
}

uint64_t __68__UIAssistantBarButtonItemProvider_unmodifiableSystemAssistantItem___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dictationMenu];
}

void __68__UIAssistantBarButtonItemProvider_unmodifiableSystemAssistantItem___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([*(id *)(a1 + 32) _isKeyboardItemEnabled]) {
    BOOL v3 = +[UIKeyboardInputModeController dictationInputModeIsFunctional];
  }
  else {
    BOOL v3 = 0;
  }
  [v4 setEnabled:v3];
}

+ (id)compactSystemAssistantItem
{
  v18[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = objc_alloc_init(UISystemDefaultTextInputAssistantItem);
  if ((_os_feature_enabled_impl() & 1) != 0 || _os_feature_enabled_impl())
  {
    id v4 = [a1 languageIndicatorItem:1];
    id v5 = [[UITapGestureRecognizer alloc] initWithTarget:v3 action:sel_assistantExpand];
    v18[0] = v5;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    [v4 _setGestureRecognizers:v6];

    id v7 = [UIBarButtonItemGroup alloc];
    double v17 = v4;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
    uint64_t v9 = [(UIBarButtonItemGroup *)v7 initWithBarButtonItems:v8 representativeItem:0];
  }
  else
  {
    id v4 = [a1 barButtonItemForAssistantItemStyle:16 target:v3];
    id v5 = [a1 barButtonItemForAssistantItemStyle:11 target:v3];
    uint64_t v8 = [a1 barButtonItemForAssistantItemStyle:15 target:v3];
    uint64_t v10 = [a1 barButtonItemForAssistantItemStyle:14 target:v3];
    [v4 setIsKeyboardItem:1];
    uint64_t v11 = [UIBarButtonItemGroup alloc];
    v16[0] = v5;
    v16[1] = v8;
    v16[2] = v10;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:3];
    uint64_t v9 = [(UIBarButtonItemGroup *)v11 initWithBarButtonItems:v12 representativeItem:v4];

    [(UIBarButtonItemGroup *)v9 _setExpandStyle:1];
    [(UIBarButtonItemGroup *)v9 _setShouldAlwaysCollapse:1];
  }
  uint64_t v15 = v9;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
  [(UISystemDefaultTextInputAssistantItem *)v3 setLeadingBarButtonGroups:v13];

  [(UISystemDefaultTextInputAssistantItem *)v3 setTrailingBarButtonGroups:MEMORY[0x1E4F1CBF0]];
  return v3;
}

@end