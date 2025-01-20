@interface CACCorrectionPresentationManager
+ (int)axNotification;
+ (int64_t)remoteViewType;
- (AXElement)element;
- (BOOL)isOverlay;
- (id)currentlyDisplayedCorrections;
- (void)_showCorrectionsForElement:(id)a3 fromString:(id)a4 withAlternatives:(id)a5 withEmojis:(id)a6 portraitUpRect:(CGRect)a7;
- (void)correctionsPresentationViewController:(id)a3 didSelectItemWithText:(id)a4;
- (void)dismissCorrectionsPresentationViewController:(id)a3;
- (void)handleAXNotificationData:(void *)a3;
- (void)hideIfNeededForElements:(id)a3;
- (void)setElement:(id)a3;
- (void)showCorrectionsForElement:(id)a3 nBestStrings:(id)a4;
@end

@implementation CACCorrectionPresentationManager

- (void)_showCorrectionsForElement:(id)a3 fromString:(id)a4 withAlternatives:(id)a5 withEmojis:(id)a6 portraitUpRect:(CGRect)a7
{
  CGFloat height = a7.size.height;
  CGFloat width = a7.size.width;
  CGFloat y = a7.origin.y;
  CGFloat x = a7.origin.x;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __117__CACCorrectionPresentationManager__showCorrectionsForElement_fromString_withAlternatives_withEmojis_portraitUpRect___block_invoke;
  v28[3] = &unk_264D11F80;
  v28[4] = self;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __117__CACCorrectionPresentationManager__showCorrectionsForElement_fromString_withAlternatives_withEmojis_portraitUpRect___block_invoke_2;
  v20[3] = &unk_264D12D38;
  id v21 = v14;
  id v22 = v15;
  id v23 = v16;
  CGFloat v24 = x;
  CGFloat v25 = y;
  CGFloat v26 = width;
  CGFloat v27 = height;
  id v17 = v16;
  id v18 = v15;
  id v19 = v14;
  [(CACSimpleContentViewManager *)self showViewControllerWithCreationHandler:v28 updateHandler:v20];
}

id __117__CACCorrectionPresentationManager__showCorrectionsForElement_fromString_withAlternatives_withEmojis_portraitUpRect___block_invoke(uint64_t a1)
{
  v2 = objc_opt_new();
  [v2 setDelegate:*(void *)(a1 + 32)];
  return v2;
}

void __117__CACCorrectionPresentationManager__showCorrectionsForElement_fromString_withAlternatives_withEmojis_portraitUpRect___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setText:v3];
  [v4 setAlternatives:*(void *)(a1 + 40)];
  [v4 setEmojis:*(void *)(a1 + 48)];
  objc_msgSend(v4, "setPortraitUpSourceRect:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
}

- (void)showCorrectionsForElement:(id)a3 nBestStrings:(id)a4
{
  uint64_t v113 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [(CACCorrectionPresentationManager *)self setElement:v6];
  if (showCorrectionsForElement_nBestStrings__textCheckerInialize != -1) {
    dispatch_once(&showCorrectionsForElement_nBestStrings__textCheckerInialize, &__block_literal_global_48);
  }
  uint64_t v8 = [v6 selectedTextRange];
  objc_msgSend(v6, "rectForRange:", v8, v9);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  id v18 = [v6 cacTextSelectionCACTextMarkerRange];
  id v19 = [v6 cacStringForCACTextMarkerRange:v18];

  v20 = [MEMORY[0x263EFF8C0] array];
  id v21 = objc_opt_new();
  if ([v19 length])
  {
    v94 = v7;
    uint64_t v22 = [v19 characterAtIndex:0];
    if ([v19 length] == 1
      && ((v22 - 32) < 0x5F || (v22 - 8216) <= 5 && ((1 << (v22 - 24)) & 0x33) != 0))
    {
      id v23 = [MEMORY[0x263F08708] alphanumericCharacterSet];
      char v24 = [v23 characterIsMember:v22];

      if (v24)
      {
        if ((v22 - 48) > 9)
        {
          v79 = self;
          v80 = [v19 uppercaseString];
          CGFloat v25 = v19;
          int v81 = [v19 isEqualToString:v80];

          uint64_t v82 = 65;
          do
          {
            while (v81)
            {
              v83 = objc_msgSend(NSString, "stringWithFormat:", @"%c", v82);
              [v21 addObject:v83];

              uint64_t v82 = (v82 + 1);
              if (v82 == 91)
              {
                uint64_t v85 = [v19 lowercaseString];
                goto LABEL_67;
              }
            }
            v84 = objc_msgSend(NSString, "stringWithFormat:", @"%c", (v82 + 32));
            [v21 addObject:v84];

            uint64_t v82 = (v82 + 1);
          }
          while (v82 != 91);
          uint64_t v85 = [v19 uppercaseString];
LABEL_67:
          v86 = (void *)v85;
          [v21 addObject:v85];

          uint64_t v87 = 0;
          self = v79;
          do
          {
            v88 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v87);
            [v21 addObject:v88];

            uint64_t v87 = (v87 + 1);
          }
          while (v87 != 10);
        }
        else
        {
          CGFloat v25 = v19;
          uint64_t v26 = 0;
          do
          {
            CGFloat v27 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v26);
            [v21 addObject:v27];

            uint64_t v26 = (v26 + 1);
          }
          while (v26 != 10);
          uint64_t v28 = 65;
          do
          {
            v29 = objc_msgSend(NSString, "stringWithFormat:", @"%c", v28);
            [v21 addObject:v29];

            uint64_t v28 = (v28 + 1);
          }
          while (v28 != 91);
        }
      }
      else
      {
        CGFloat v25 = v19;
        uint64_t v71 = 33;
        do
        {
          v72 = objc_msgSend(NSString, "stringWithFormat:", @"%c", v71);
          [v21 addObject:v72];

          uint64_t v71 = (v71 + 1);
        }
        while (v71 != 48);
        uint64_t v73 = 58;
        do
        {
          v74 = objc_msgSend(NSString, "stringWithFormat:", @"%c", v73);
          [v21 addObject:v74];

          uint64_t v73 = (v73 + 1);
        }
        while (v73 != 65);
        uint64_t v75 = 91;
        do
        {
          v76 = objc_msgSend(NSString, "stringWithFormat:", @"%c", v75);
          [v21 addObject:v76];

          uint64_t v75 = (v75 + 1);
        }
        while (v75 != 97);
        uint64_t v77 = 123;
        do
        {
          v78 = objc_msgSend(NSString, "stringWithFormat:", @"%c", v77);
          [v21 addObject:v78];

          uint64_t v77 = (v77 + 1);
        }
        while (v77 != 127);
        [v21 addObject:@"“"];
        [v21 addObject:@"”"];
        [v21 addObject:@"‘"];
        [v21 addObject:@"’"];
      }
      id v7 = v94;
    }
    else
    {
      v92 = self;
      v30 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
      v97 = [v30 leadingTextForCurrentSelection];

      v31 = +[CACSpeechSystem speechSystem];
      uint64_t v32 = [v31 recognitionLocaleIdentifier];

      v90 = +[CACCorrectionUtilities emojiSuggestionsForString:v19];

      v96 = (void *)v32;
      uint64_t v33 = +[CACCorrectionUtilities alternativesForString:v19 languageIdentifier:v32];
      v34 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
      LODWORD(v32) = [v34 dictationRecognizerMode];

      id v93 = v6;
      v91 = v19;
      v89 = (void *)v33;
      if ((v32 - 4) > 0xFFFFFFFD)
      {
        int v36 = 0;
      }
      else
      {
        v35 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
        int v36 = [v35 doesCurrentLanguageSupportInterWordSpaces];
      }
      v37 = +[CACPreferences sharedPreferences];
      v38 = +[CACPreferences sharedPreferences];
      v39 = [v38 bestLocaleIdentifier];
      v40 = [v37 vocabularyEntriesForLocaleIdentifier:v39];

      v41 = objc_opt_new();
      long long v106 = 0u;
      long long v107 = 0u;
      long long v108 = 0u;
      long long v109 = 0u;
      obuint64_t j = v40;
      uint64_t v42 = [obj countByEnumeratingWithState:&v106 objects:v112 count:16];
      if (v42)
      {
        uint64_t v43 = v42;
        uint64_t v44 = *(void *)v107;
        do
        {
          for (uint64_t i = 0; i != v43; ++i)
          {
            if (*(void *)v107 != v44) {
              objc_enumerationMutation(obj);
            }
            v46 = [*(id *)(*((void *)&v106 + 1) + 8 * i) objectForKey:@"Text"];
            [v41 addObject:v46];
          }
          uint64_t v43 = [obj countByEnumeratingWithState:&v106 objects:v112 count:16];
        }
        while (v43);
      }

      long long v104 = 0u;
      long long v105 = 0u;
      long long v102 = 0u;
      long long v103 = 0u;
      id v47 = v94;
      uint64_t v48 = [v47 countByEnumeratingWithState:&v102 objects:v111 count:16];
      if (v48)
      {
        uint64_t v49 = v48;
        uint64_t v50 = *(void *)v103;
        do
        {
          for (uint64_t j = 0; j != v49; ++j)
          {
            if (*(void *)v103 != v50) {
              objc_enumerationMutation(v47);
            }
            v52 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:*(void *)(*((void *)&v102 + 1) + 8 * j)];
            if (v36)
            {
              v53 = (void *)[v41 copy];
              [v52 adjustCapsAndSpacingUsingLeadingText:v97 localeIdentifier:v96 vocabularyEntries:v53 spellingGuessesBlock:&__block_literal_global_301];
            }
            v54 = [v52 string];
            char v55 = [v21 containsObject:v54];

            if ((v55 & 1) == 0)
            {
              v56 = [v52 string];
              [v21 addObject:v56];
            }
          }
          uint64_t v49 = [v47 countByEnumeratingWithState:&v102 objects:v111 count:16];
        }
        while (v49);
      }

      long long v100 = 0u;
      long long v101 = 0u;
      long long v98 = 0u;
      long long v99 = 0u;
      id v57 = v89;
      uint64_t v58 = [v57 countByEnumeratingWithState:&v98 objects:v110 count:16];
      if (v58)
      {
        uint64_t v59 = v58;
        uint64_t v60 = *(void *)v99;
        do
        {
          for (uint64_t k = 0; k != v59; ++k)
          {
            if (*(void *)v99 != v60) {
              objc_enumerationMutation(v57);
            }
            v62 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:*(void *)(*((void *)&v98 + 1) + 8 * k)];
            if (v36)
            {
              v63 = (void *)[v41 copy];
              [v62 adjustCapsAndSpacingUsingLeadingText:v97 localeIdentifier:v96 vocabularyEntries:v63 spellingGuessesBlock:&__block_literal_global_303];
            }
            v64 = [v62 stringByReplacingNewLinesWithSymbols];
            v65 = (void *)[v64 mutableCopy];

            v66 = [v65 string];
            char v67 = [v21 containsObject:v66];

            if ((v67 & 1) == 0)
            {
              v68 = [v65 string];
              [v21 addObject:v68];
            }
          }
          uint64_t v59 = [v57 countByEnumeratingWithState:&v98 objects:v110 count:16];
        }
        while (v59);
      }

      if ((unint64_t)[v21 count] >= 0x10) {
        objc_msgSend(v21, "removeObjectsInRange:", 15, objc_msgSend(v21, "count") - 15);
      }
      v69 = v90;
      id v6 = v93;
      id v7 = v94;
      CGFloat v25 = v91;
      if ((unint64_t)[v90 count] >= 0xD)
      {
        uint64_t v70 = objc_msgSend(v90, "subarrayWithRange:", 0, 12);

        v69 = (void *)v70;
      }

      v20 = v69;
      self = v92;
    }
    id v19 = [v25 stringByReplacingNewLinesWithSymbols];

    -[CACCorrectionPresentationManager _showCorrectionsForElement:fromString:withAlternatives:withEmojis:portraitUpRect:](self, "_showCorrectionsForElement:fromString:withAlternatives:withEmojis:portraitUpRect:", v6, v19, v21, v20, v11, v13, v15, v17);
  }
}

uint64_t __75__CACCorrectionPresentationManager_showCorrectionsForElement_nBestStrings___block_invoke()
{
  showCorrectionsForElement_nBestStrings__sChecker = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

uint64_t __75__CACCorrectionPresentationManager_showCorrectionsForElement_nBestStrings___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend((id)showCorrectionsForElement_nBestStrings__sChecker, "guessesForWordRange:inString:language:", a2, a3, a4, a5);
}

uint64_t __75__CACCorrectionPresentationManager_showCorrectionsForElement_nBestStrings___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend((id)showCorrectionsForElement_nBestStrings__sChecker, "guessesForWordRange:inString:language:", a2, a3, a4, a5);
}

- (void)hideIfNeededForElements:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  id v6 = [(CACCorrectionPresentationManager *)v5 element];

  if (v6)
  {
    id v7 = [(CACCorrectionPresentationManager *)v5 element];
    if (([v4 containsObject:v7] & 1) == 0)
    {
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __60__CACCorrectionPresentationManager_hideIfNeededForElements___block_invoke;
      v8[3] = &unk_264D115D0;
      v8[4] = v5;
      [(CACSimpleContentViewManager *)v5 hideAnimated:0 completion:v8];
    }
  }
  objc_sync_exit(v5);
}

uint64_t __60__CACCorrectionPresentationManager_hideIfNeededForElements___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setElement:0];
}

- (id)currentlyDisplayedCorrections
{
  uint64_t v3 = [MEMORY[0x263EFF980] array];
  id v4 = [(CACSimpleContentViewManager *)self viewController];
  v5 = v4;
  if (v4)
  {
    id v6 = [v4 alternatives];
    uint64_t v7 = [v6 count];

    if (v7)
    {
      uint64_t v8 = [v5 alternatives];
      [v3 addObjectsFromArray:v8];
    }
    uint64_t v9 = [v5 emojis];
    uint64_t v10 = [v9 count];

    if (v10)
    {
      double v11 = [v5 emojis];
      [v3 addObjectsFromArray:v11];
    }
  }

  return v3;
}

- (void)correctionsPresentationViewController:(id)a3 didSelectItemWithText:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = +[CACEmojiManager sharedManager];
      [v8 willInsertStringPotentiallyContainingEmojis:v7];

      uint64_t v9 = [(CACCorrectionPresentationManager *)self element];
      [v9 insertText:v7 asUndoableAction:1];

      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __96__CACCorrectionPresentationManager_correctionsPresentationViewController_didSelectItemWithText___block_invoke;
      v10[3] = &unk_264D115D0;
      v10[4] = self;
      [(CACSimpleContentViewManager *)self hideAnimated:1 completion:v10];
    }
  }
}

uint64_t __96__CACCorrectionPresentationManager_correctionsPresentationViewController_didSelectItemWithText___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setElement:0];
}

- (void)dismissCorrectionsPresentationViewController:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __81__CACCorrectionPresentationManager_dismissCorrectionsPresentationViewController___block_invoke;
  v3[3] = &unk_264D115D0;
  v3[4] = self;
  [(CACSimpleContentViewManager *)self hideAnimated:1 completion:v3];
}

uint64_t __81__CACCorrectionPresentationManager_dismissCorrectionsPresentationViewController___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setElement:0];
}

- (BOOL)isOverlay
{
  return 0;
}

+ (int64_t)remoteViewType
{
  return 4;
}

+ (int)axNotification
{
  return 2029;
}

- (void)handleAXNotificationData:(void *)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = [(CACCorrectionPresentationManager *)self element];
    [v5 insertText:v4 asUndoableAction:1];
  }
  else
  {
    v5 = CACLogAccessibility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[CACCorrectionPresentationManager handleAXNotificationData:]((uint64_t)v4, v5);
    }
  }
}

- (AXElement)element
{
  return self->_element;
}

- (void)setElement:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)handleAXNotificationData:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138477827;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_238377000, a2, OS_LOG_TYPE_ERROR, "Unexpected data from corrections: %{private}@", (uint8_t *)&v2, 0xCu);
}

@end