@interface UIKeyboardLayoutCursor
+ (CGSize)keyboardSizeForInputMode:(id)a3 screenTraits:(id)a4 keyboardType:(int64_t)a5;
+ (id)carKeyboardNameForKeyboard:(id)a3 screenTraits:(id)a4;
- (BOOL)_handleMoveWithEvent:(id)a3;
- (BOOL)_handlePresses:(id)a3 withEvent:(id)a4;
- (BOOL)_handleRemoteControlReceivedWithEvent:(id)a3;
- (BOOL)_handleWheelChangedWithEvent:(id)a3;
- (BOOL)_isDirectionalHeading:(unint64_t)a3;
- (BOOL)_isKeyboardReverseOfAppLayoutDirection;
- (BOOL)_menuTapShouldExitVariants;
- (BOOL)_menuTapShouldStopDictation;
- (BOOL)canHandleEvent:(id)a3;
- (BOOL)canHandlePresses:(id)a3 withEvent:(id)a4;
- (BOOL)canMultitap;
- (BOOL)diacriticForwardCompose;
- (BOOL)handleLinearDirectionalInput:(int)a3;
- (BOOL)handleVisualDirectionalInput:(int)a3;
- (BOOL)ignoresShiftState;
- (BOOL)isAlphabeticPlane;
- (BOOL)isAppRightToLeft;
- (BOOL)isKanaPlane;
- (BOOL)isKeyboardRightToLeft;
- (BOOL)isKeyplaneDisabledWithName:(id)a3;
- (BOOL)isPossibleToTypeFast;
- (BOOL)isSlimLinearKeyboardTV;
- (BOOL)overrideInitialKey;
- (BOOL)refreshSelectedCellIfNecessaryForKey:(id)a3;
- (BOOL)refreshSelectedCellIfNecessaryForKey:(id)a3 animated:(BOOL)a4;
- (BOOL)shouldAllowCurrentKeyplaneReload;
- (BOOL)shouldConfigureFloatingContentView;
- (BOOL)shouldDeactivateWithoutWindow;
- (BOOL)shouldMatchCaseForDomainKeys;
- (BOOL)shouldMergeKey:(id)a3;
- (BOOL)shouldPreventInputManagerHitTestingForKey:(id)a3;
- (BOOL)shouldRetestKey:(id)a3 slidOffKey:(id)a4 withKeyplane:(id)a5;
- (BOOL)shouldToggleKeyplaneWithName:(id)a3;
- (BOOL)shouldToggleLetterCaseNext;
- (BOOL)supportsContinuousPath;
- (BOOL)supportsEmoji;
- (BOOL)suppressOperations;
- (BOOL)usesAutoShift;
- (CGRect)selectionFrameForKeyIndex:(int64_t)a3;
- (NSString)keyplaneBeforeDictation;
- (UIAlertController)recentInputsAlert;
- (UIKBTree)currentKey;
- (UIKeyboardLayoutCursor)initWithFrame:(CGRect)a3;
- (UIWindow)focusWindow;
- (double)defaultCursorAdjustDistance;
- (id)_keyplaneForKeyplaneProperties;
- (id)cacheTokenForKeyplane:(id)a3;
- (id)getRomanAccentVariantsForString:(id)a3 inputMode:(id)a4 keyboardVariantIndludes:(int)a5;
- (id)keyHitTestInSameRowAsCenter:(CGPoint)a3 size:(CGSize)a4;
- (id)keyViewAnimator;
- (int)activeStateForKey:(id)a3;
- (int)enabledStateForKey:(id)a3;
- (int)stateForCandidateListKey:(id)a3;
- (int)stateForKeyplaneSwitchKey:(id)a3;
- (int64_t)defaultSelectedVariantIndexForKey:(id)a3 withActions:(unint64_t)a4;
- (int64_t)selectedKeyBeforeDictation;
- (int64_t)targetKeyIndexAtOffset:(CGPoint)a3 fromKey:(id)a4;
- (int64_t)targetKeyIndexFromPoint:(CGPoint)a3;
- (int64_t)targetKeyIndexFromPoint:(CGPoint)a3 inKeys:(id)a4;
- (unint64_t)_indexOfFirstKeyPassingTest:(id)a3;
- (unint64_t)cursorLocation;
- (unint64_t)downActionFlagsForKey:(id)a3;
- (unint64_t)getNextKeyplaneIndex:(unint64_t)a3;
- (unint64_t)lastSelectedKeyIndex;
- (unint64_t)targetEdgesForScreenGestureRecognition;
- (unint64_t)variantCountForKey:(id)a3;
- (unsigned)getHandRestRecognizerState;
- (void)_moveWithEvent:(id)a3;
- (void)_wheelChangedWithEvent:(id)a3;
- (void)acceptRecentInputIfNecessary;
- (void)alertDidDismiss;
- (void)clearVariantStateForKey:(id)a3;
- (void)configureFloatingContentViewsIfNeeded;
- (void)deactivateKey:(id)a3;
- (void)dealloc;
- (void)didSelectRecentInputString:(id)a3;
- (void)endMultitapForKey:(id)a3;
- (void)handleVariantDeleteIfNecessaryForKey:(id)a3;
- (void)longPressAction;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)remoteControlReceivedWithEvent:(id)a3;
- (void)restoreFocusFromEntryPoint:(CGPoint)a3;
- (void)returnToKeyplaneAfterDictation;
- (void)runWithSuppressedActions:(id)a3;
- (void)selectInitialKeyIfNecessary;
- (void)setCursorLocation:(unint64_t)a3;
- (void)setDisableTouchInput:(BOOL)a3;
- (void)setFocusWindow:(id)a3;
- (void)setHighlightedVariantIndex:(int64_t)a3 key:(id)a4;
- (void)setKeyboardAppearance:(int64_t)a3;
- (void)setKeyboardName:(id)a3 appearance:(int64_t)a4;
- (void)setKeyplaneBeforeDictation:(id)a3;
- (void)setKeyplaneName:(id)a3;
- (void)setLastSelectedKeyIndex:(unint64_t)a3;
- (void)setOverrideInitialKey:(BOOL)a3;
- (void)setRecentInputs:(id)a3;
- (void)setRecentInputsAlert:(id)a3;
- (void)setRenderConfig:(id)a3;
- (void)setSelectedKeyBeforeDictation:(int64_t)a3;
- (void)setSelectedKeyIndex:(int64_t)a3;
- (void)setShift:(BOOL)a3;
- (void)setShouldConfigureFloatingContentView:(BOOL)a3;
- (void)setShouldToggleLetterCaseNext:(BOOL)a3;
- (void)setSuppressOperations:(BOOL)a3;
- (void)showKeyboardWithInputTraits:(id)a3 screenTraits:(id)a4 splitTraits:(id)a5;
- (void)showPopupKeyplaneSwitcher;
- (void)showRecentInputsAlert;
- (void)switchToDictationKeyplaneWithActivationIdentifier:(id)a3;
- (void)takeKeyAction:(id)a3;
- (void)updateDictationHelpString;
- (void)updateKeyplaneSwitchEdgeBiases;
- (void)updateRecentInputsKeyIfNecessary;
- (void)willMoveToWindow:(id)a3;
@end

@implementation UIKeyboardLayoutCursor

- (UIKeyboardLayoutCursor)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIKeyboardLayoutCursor;
  v3 = -[UIKeyboardLayoutStar initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (UIKeyboardLayoutCursor *)v3;
  if (v3)
  {
    *((void *)v3 + 195) = 0x7FFFFFFFFFFFFFFFLL;
    *((void *)v3 + 208) = 0x7FFFFFFFFFFFFFFFLL;
    v3[1643] = 1;
    v3[1644] = 1;
    *(_OWORD *)(v3 + 1624) = *MEMORY[0x1E4F1DAD8];
    v3[1640] = 0;
    *((void *)v3 + 209) = 0x7FFFFFFFFFFFFFFFLL;
    [v3 setOpaque:0];
  }
  return v4;
}

- (void)dealloc
{
  _shouldRestoreSelectedKeyIndex = 1;
  [(UIView *)self->_selectionView removeFromSuperview];
  v3.receiver = self;
  v3.super_class = (Class)UIKeyboardLayoutCursor;
  [(UIKeyboardLayoutStar *)&v3 dealloc];
}

- (void)willMoveToWindow:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UIKeyboardLayoutCursor;
  [(UIKeyboardLayoutStar *)&v4 willMoveToWindow:a3];
  [(UIKeyboardLayoutCursor *)self setShouldToggleLetterCaseNext:1];
}

- (void)runWithSuppressedActions:(id)a3
{
  self->_suppressOperations = 1;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  self->_suppressOperations = 0;
}

- (UIKBTree)currentKey
{
  unint64_t selectedKeyIndex = self->_selectedKeyIndex;
  if (selectedKeyIndex == 0x7FFFFFFFFFFFFFFFLL || selectedKeyIndex >= [(NSArray *)self->_keyplaneKeys count])
  {
    objc_super v4 = 0;
  }
  else
  {
    objc_super v4 = [(NSArray *)self->_keyplaneKeys objectAtIndex:self->_selectedKeyIndex];
  }
  return (UIKBTree *)v4;
}

- (unint64_t)variantCountForKey:(id)a3
{
  id v4 = a3;
  v5 = [(UIKBKeyplaneView *)self->super._keyplaneView viewForKey:v4];
  objc_super v6 = v5;
  if (v5)
  {
    unint64_t v7 = [v5 focusableVariantCount];
  }
  else
  {
    v8 = [v4 subtrees];
    unint64_t v7 = [v8 count];
  }
  return v7;
}

- (void)configureFloatingContentViewsIfNeeded
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __63__UIKeyboardLayoutCursor_configureFloatingContentViewsIfNeeded__block_invoke;
  v2[3] = &unk_1E52DA260;
  v2[4] = self;
  long long v3 = xmmword_186B99F70;
  uint64_t v4 = 0x4024000000000000;
  if (configureFloatingContentViewsIfNeeded_onceToken != -1) {
    dispatch_once(&configureFloatingContentViewsIfNeeded_onceToken, v2);
  }
}

void __63__UIKeyboardLayoutCursor_configureFloatingContentViewsIfNeeded__block_invoke(double *a1)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  v2 = +[UITraitCollection traitCollectionWithUserInterfaceStyle:1];
  v19[0] = objc_opt_class();
  long long v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  uint64_t v4 = +[UIView appearanceForTraitCollection:v2 whenContainedInInstancesOfClasses:v3];

  [v4 setCornerRadius:a1[5]];
  objc_msgSend(v4, "setAsymmetricFocusedSizeIncrease:", a1[6], a1[7]);
  objc_msgSend(v4, "set_disableOutsetShadowPath:", 1);
  v5 = +[UIColor whiteColor];
  [v4 setBackgroundColor:v5 forState:8];

  objc_super v6 = +[UIColor whiteColor];
  [v4 setBackgroundColor:v6 forState:1];

  unint64_t v7 = +[UITraitCollection traitCollectionWithUserInterfaceStyle:1000];
  uint64_t v18 = objc_opt_class();
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
  v9 = +[UIView appearanceForTraitCollection:v7 whenContainedInInstancesOfClasses:v8];

  [v9 setCornerRadius:a1[5]];
  objc_msgSend(v9, "setAsymmetricFocusedSizeIncrease:", a1[6], a1[7]);
  objc_msgSend(v9, "set_disableOutsetShadowPath:", 1);
  v10 = +[UIColor colorWithWhite:1.0 alpha:0.8];
  [v9 setBackgroundColor:v10 forState:8];

  v11 = +[UIColor colorWithWhite:1.0 alpha:0.8];
  [v9 setBackgroundColor:v11 forState:1];

  v12 = +[UITraitCollection traitCollectionWithUserInterfaceStyle:2];
  uint64_t v17 = objc_opt_class();
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  v14 = +[UIView appearanceForTraitCollection:v12 whenContainedInInstancesOfClasses:v13];

  [v14 setCornerRadius:a1[5]];
  objc_msgSend(v14, "setAsymmetricFocusedSizeIncrease:", a1[6], a1[7]);
  objc_msgSend(v14, "set_disableOutsetShadowPath:", 1);
  v15 = +[UIColor colorWithWhite:1.0 alpha:0.8];
  [v14 setBackgroundColor:v15 forState:8];

  v16 = +[UIColor colorWithWhite:1.0 alpha:0.8];
  [v14 setBackgroundColor:v16 forState:1];
}

- (id)keyViewAnimator
{
  if ([(UIKeyboardLayout *)self idiom] == 2)
  {
    if (!self->super._keyViewAnimator)
    {
      long long v3 = objc_alloc_init(UIKBKeyViewAnimatorMonolith);
      keyViewAnimator = self->super._keyViewAnimator;
      self->super._keyViewAnimator = &v3->super;
    }
    keyplaneView = self->super._keyplaneView;
    if (keyplaneView)
    {
      objc_super v6 = [(UIKBKeyplaneView *)keyplaneView keyViewAnimator];
      unint64_t v7 = self->super._keyViewAnimator;

      if (v6 != v7) {
        [(UIKBKeyplaneView *)self->super._keyplaneView setKeyViewAnimator:self->super._keyViewAnimator];
      }
    }
    v8 = self->super._keyViewAnimator;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)UIKeyboardLayoutCursor;
    v8 = [(UIKeyboardLayoutStar *)&v10 keyViewAnimator];
  }
  return v8;
}

- (void)showKeyboardWithInputTraits:(id)a3 screenTraits:(id)a4 splitTraits:(id)a5
{
  int v8 = _shouldRestoreSelectedKeyIndex;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  if (v8 == 1)
  {
    v12 = [(UIKeyboardLayoutCursor *)self currentKey];
    [(UIKeyboardLayoutCursor *)self deactivateKey:v12];

    self->_unint64_t selectedKeyIndex = _savedSelectedKeyIndex;
    _shouldRestoreSelectedKeyIndex = 0;
  }
  else
  {
    [(UIKeyboardLayoutCursor *)self setSelectedKeyIndex:0x7FFFFFFFFFFFFFFFLL];
  }
  [(UIKeyboardLayoutCursor *)self configureFloatingContentViewsIfNeeded];
  v13.receiver = self;
  v13.super_class = (Class)UIKeyboardLayoutCursor;
  [(UIKeyboardLayoutStar *)&v13 showKeyboardWithInputTraits:v11 screenTraits:v10 splitTraits:v9];

  [(UIKeyboardLayoutCursor *)self selectInitialKeyIfNecessary];
}

+ (id)carKeyboardNameForKeyboard:(id)a3 screenTraits:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 idiom] == 3
    && (([v6 knobInput] & 1) != 0 || objc_msgSend(v6, "touchpadInput")))
  {
    unint64_t v7 = [v5 subtreeWithName:@"capital-letters"];
    int v8 = @"Alphabetic";
    if (!v7) {
      int v8 = @"Uncased";
    }
    id v9 = v8;

    id v10 = [NSString stringWithFormat:@"Car-%@-Linear-Keyboard", v9];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (CGSize)keyboardSizeForInputMode:(id)a3 screenTraits:(id)a4 keyboardType:(int64_t)a5
{
  id v8 = a4;
  id v9 = UIKeyboardGetKBStarName(a3, v8, a5, 0);
  id v10 = [a1 keyboardWithName:v9 screenTraits:v8];
  id v11 = [a1 carKeyboardNameForKeyboard:v10 screenTraits:v8];

  if (v11)
  {
    uint64_t v12 = [a1 keyboardWithName:v11 screenTraits:v8];

    id v10 = (void *)v12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v10 frame];
    double v14 = v13;
    double v16 = v15;
  }
  else
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    void v19[2] = __77__UIKeyboardLayoutCursor_keyboardSizeForInputMode_screenTraits_keyboardType___block_invoke;
    v19[3] = &unk_1E52D9F98;
    id v20 = v11;
    id v21 = v10;
    if (keyboardSizeForInputMode_screenTraits_keyboardType__once != -1) {
      dispatch_once(&keyboardSizeForInputMode_screenTraits_keyboardType__once, v19);
    }

    double v14 = *MEMORY[0x1E4F1DB30];
    double v16 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }

  double v17 = v14;
  double v18 = v16;
  result.height = v18;
  result.width = v17;
  return result;
}

void __77__UIKeyboardLayoutCursor_keyboardSizeForInputMode_screenTraits_keyboardType___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("Warning", &_UIInternalPreference__UIATVClearBeforeDictation_block_invoke___s_category)+ 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138412546;
    uint64_t v6 = v3;
    __int16 v7 = 2112;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_ERROR, "Error: LayoutCursor keyboardName %@ resulted in %@", (uint8_t *)&v5, 0x16u);
  }
}

- (void)setKeyboardName:(id)a3 appearance:(int64_t)a4
{
  id v6 = a3;
  __int16 v7 = [(id)objc_opt_class() keyboardWithName:v6 screenTraits:self->super.super._screenTraits];
  uint64_t v8 = [(id)objc_opt_class() carKeyboardNameForKeyboard:v7 screenTraits:self->super.super._screenTraits];
  if (v8)
  {
    objc_storeStrong((id *)&self->_indirectKeyboard, v7);
    id v9 = v8;

    id v6 = v9;
  }
  v10.receiver = self;
  v10.super_class = (Class)UIKeyboardLayoutCursor;
  [(UIKeyboardLayoutStar *)&v10 setKeyboardName:v6 appearance:a4];
}

- (void)setKeyboardAppearance:(int64_t)a3
{
  self->super._appearance = a3;
  uint64_t v4 = [(UIKBTree *)self->super._keyboard visualStyle];
  keyplane = self->super._keyplane;
  [(UIKBTree *)keyplane setVisualStyle:v4];
}

- (void)setRenderConfig:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UIKeyboardLayoutCursor;
  [(UIKeyboardLayoutStar *)&v4 setRenderConfig:a3];
  [(UIKeyboardLayoutCursor *)self updateDictationHelpString];
}

- (id)cacheTokenForKeyplane:(id)a3
{
  id v4 = a3;
  if ([(UIKeyboardLayout *)self idiom] == 2)
  {
    int v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIKeyboardLayoutCursor;
    int v5 = [(UIKeyboardLayoutCursor *)&v7 cacheTokenForKeyplane:v4];
  }

  return v5;
}

- (void)setKeyplaneName:(id)a3
{
  v100[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(UIKeyboardLayoutCursor *)self suppressOperations])
  {
    int v5 = [(UIKeyboardLayoutCursor *)self currentKey];
    id v6 = [(UIKeyboardLayoutCursor *)self currentKey];
    [v6 frame];
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    double v12 = v11;
    double v14 = v13;

    double x = self->_keyplaneSwitchSelectedKeyFrameCenter.x;
    double y = self->_keyplaneSwitchSelectedKeyFrameCenter.y;
    if (x == *MEMORY[0x1E4F1DAD8] && y == *(double *)(MEMORY[0x1E4F1DAD8] + 8))
    {
      [v5 frame];
      double x = CGRectGetMidX(v101);
      [v5 frame];
      double y = CGRectGetMidY(v102);
    }
    v98.receiver = self;
    v98.super_class = (Class)UIKeyboardLayoutCursor;
    [(UIKeyboardLayoutStar *)&v98 setKeyplaneName:v4];
    BOOL v18 = [(UIKeyboardLayoutCursor *)self isAppRightToLeft];
    keyplane = self->super._keyplane;
    if (v18) {
      [(UIKBTree *)keyplane keysOrderedByPositionRTL];
    }
    else {
    id v20 = [(UIKBTree *)keyplane keysOrderedByPosition];
    }
    keyplaneKeys = self->_keyplaneKeys;
    self->_keyplaneKeys = v20;

    indirectKeyboard = self->_indirectKeyboard;
    if (indirectKeyboard)
    {
      v23 = self->super._keyplane;
      if (v23)
      {
        v24 = [(UIKBTree *)v23 unhashedName];
        v25 = [(UIKBTree *)indirectKeyboard subtreeWithName:v24];

        v26 = [v25 subtrees];
        v27 = [v26 firstObject];

        v28 = [(UIKBTree *)self->super._keyplane firstCachedKeyWithName:@"Letter-Line-Key"];
        v29 = [v27 keys];
        v30 = (void *)[v29 mutableCopy];

        if (qword_1EB25C500 != -1) {
          dispatch_once(&qword_1EB25C500, &__block_literal_global_332);
        }
        v31 = (void *)_MergedGlobals_45;
        v32 = [v30 firstObject];
        v33 = [v32 representedString];
        LODWORD(v31) = objc_msgSend(v31, "characterIsMember:", objc_msgSend(v33, "characterAtIndex:", 0));

        if (v31)
        {
          v34 = [MEMORY[0x1E4F1CA48] array];
          v35 = [MEMORY[0x1E4F1CA48] array];
          v95[0] = MEMORY[0x1E4F143A8];
          v95[1] = 3221225472;
          v95[2] = __42__UIKeyboardLayoutCursor_setKeyplaneName___block_invoke_2;
          v95[3] = &unk_1E52FA400;
          id v96 = v34;
          id v97 = v35;
          id v36 = v35;
          id v37 = v34;
          [v30 enumerateObjectsUsingBlock:v95];
          [v30 removeAllObjects];
          [v30 addObjectsFromArray:v37];
          [v30 addObjectsFromArray:v36];
        }
        else
        {
          [v30 sortUsingComparator:&__block_literal_global_93];
        }
        [v28 setSubtrees:v30];
        [(UIKeyboardLayoutStar *)self setState:[(UIKeyboardLayoutCursor *)self enabledStateForKey:v28] forKey:v28];
        v41 = [(UIKeyboardLayoutCursor *)self currentKey];
        v42 = [v41 subtrees];

        if (!v42) {
          [(UIKeyboardLayoutStar *)self setState:[(UIKeyboardLayoutCursor *)self activeStateForKey:v41] forKey:v41];
        }

        goto LABEL_80;
      }
    }
    if ([(UIKeyboardLayout *)self idiom] != 2)
    {
LABEL_80:

      goto LABEL_81;
    }
    if ([(UIKeyboardLayoutCursor *)self selectedKeyBeforeDictation] == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v5 && !self->_selectInitialKey)
      {
        v38 = [(UIKeyboardLayoutCursor *)self currentKey];
        if ([v38 interactionType] == 3)
        {
          v39 = [(UIKeyboardLayoutStar *)self candidateList];
          char v40 = [v39 hasCandidates];

          if (v40) {
            goto LABEL_72;
          }
        }
        else
        {
        }
        v45 = [(UIKeyboardLayoutCursor *)self currentKey];
        int v46 = [v45 interactionType];

        if (v46 == 3) {
          goto LABEL_65;
        }
        v47 = -[UIKeyboardLayoutCursor keyHitTestInSameRowAsCenter:size:](self, "keyHitTestInSameRowAsCenter:size:", x, y, v12, v14);
        int v48 = [v47 interactionType];
        if (v48 == [v5 interactionType]
          || ([(UIKeyboardLayoutStar *)self keyboard],
              v49 = objc_claimAutoreleasedReturnValue(),
              [v49 name],
              v50 = objc_claimAutoreleasedReturnValue(),
              char v51 = [v50 containsString:@"Linear"],
              v50,
              v49,
              (v51 & 1) != 0))
        {
LABEL_63:
          if (v47)
          {
            int64_t v73 = [(NSArray *)self->_keyplaneKeys indexOfObject:v47];
LABEL_71:
            [(UIKeyboardLayoutCursor *)self setSelectedKeyIndex:v73];

            goto LABEL_72;
          }
LABEL_65:
          v74 = self->_keyplaneKeys;
          if ([(UIKeyboardLayoutStar *)self hasCandidateKeys])
          {
            v75 = (void *)[(NSArray *)self->_keyplaneKeys mutableCopy];
            v76 = [(UIKBTree *)self->super._keyplane cachedKeysByKeyName:@"Candidate-Selection"];
            [v75 removeObjectsInArray:v76];
            v77 = v75;

            int64_t v73 = -[UIKeyboardLayoutCursor targetKeyIndexFromPoint:inKeys:](self, "targetKeyIndexFromPoint:inKeys:", v77, x, y);
            if (v73 != 0x7FFFFFFFFFFFFFFFLL) {
              goto LABEL_70;
            }
          }
          else
          {
            v77 = v74;
          }
          int64_t v73 = -[UIKeyboardLayoutCursor targetKeyIndexFromPoint:](self, "targetKeyIndexFromPoint:", x, y);
LABEL_70:

          v47 = 0;
          goto LABEL_71;
        }
        v52 = [v47 displayString];
        if ([v52 length])
        {
          v53 = [v47 name];
          int v54 = [v53 containsString:@"Empty-Key"];

          if (!v54) {
            goto LABEL_39;
          }
        }
        else
        {
        }
        v47 = 0;
LABEL_39:
        id v87 = v47;
        v103.origin.double x = v8;
        v103.origin.double y = v10;
        v103.size.width = v12;
        v103.size.height = v14;
        uint64_t v55 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", x - CGRectGetWidth(v103), y);
        v104.origin.double x = v8;
        v104.origin.double y = v10;
        v104.size.width = v12;
        v104.size.height = v14;
        uint64_t v56 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", x + CGRectGetWidth(v104), y);
        if ([(UIKeyboardLayoutCursor *)self isKeyboardRightToLeft]) {
          uint64_t v57 = v56;
        }
        else {
          uint64_t v57 = v55;
        }
        v100[0] = v57;
        v85 = (void *)v56;
        v86 = (void *)v55;
        if ([(UIKeyboardLayoutCursor *)self isKeyboardRightToLeft]) {
          uint64_t v58 = v55;
        }
        else {
          uint64_t v58 = v56;
        }
        v100[1] = v58;
        v105.origin.double x = v8;
        v105.origin.double y = v10;
        v105.size.width = v12;
        v105.size.height = v14;
        v59 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", x, y - CGRectGetHeight(v105));
        v100[2] = v59;
        v106.origin.double x = v8;
        v106.origin.double y = v10;
        v106.size.width = v12;
        v106.size.height = v14;
        v60 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", x, y + CGRectGetHeight(v106));
        v100[3] = v60;
        v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:v100 count:4];

        long long v93 = 0u;
        long long v94 = 0u;
        long long v91 = 0u;
        long long v92 = 0u;
        id obj = v61;
        uint64_t v62 = [obj countByEnumeratingWithState:&v91 objects:v99 count:16];
        if (v62)
        {
          uint64_t v63 = v62;
          uint64_t v64 = *(void *)v92;
          v88 = v5;
          while (2)
          {
            uint64_t v65 = 0;
            uint64_t v89 = v63;
            do
            {
              if (*(void *)v92 != v64) {
                objc_enumerationMutation(obj);
              }
              [*(id *)(*((void *)&v91 + 1) + 8 * v65) CGPointValue];
              v66 = -[UIKeyboardLayoutStar keyHitTest:](self, "keyHitTest:");
              v67 = v66;
              if (v66)
              {
                v68 = [v66 displayString];
                if ([v68 length])
                {
                  uint64_t v69 = v64;
                  v70 = [v67 name];
                  char v71 = [v70 containsString:@"Empty-Key"];

                  if (v71)
                  {
                    uint64_t v64 = v69;
                    int v5 = v88;
                    uint64_t v63 = v89;
                  }
                  else
                  {
                    uint64_t v64 = v69;
                    if (!v87) {
                      id v87 = v67;
                    }
                    int v72 = [v67 interactionType];
                    int v5 = v88;
                    uint64_t v63 = v89;
                    if (v72 == [v88 interactionType])
                    {

                      id v87 = v67;
                      goto LABEL_62;
                    }
                  }
                }
                else
                {
                }
              }

              ++v65;
            }
            while (v63 != v65);
            uint64_t v63 = [obj countByEnumeratingWithState:&v91 objects:v99 count:16];
            if (v63) {
              continue;
            }
            break;
          }
        }
LABEL_62:

        v47 = v87;
        goto LABEL_63;
      }
    }
    else
    {
      v43 = [(UIKBTree *)self->super._keyplane name];
      uint64_t v44 = [v43 rangeOfString:@"Dictation"];

      if (v44 == 0x7FFFFFFFFFFFFFFFLL)
      {
        [(UIKeyboardLayoutCursor *)self setSelectedKeyIndex:[(UIKeyboardLayoutCursor *)self selectedKeyBeforeDictation]];
        [(UIKeyboardLayoutCursor *)self setSelectedKeyBeforeDictation:0x7FFFFFFFFFFFFFFFLL];
      }
    }
LABEL_72:
    v78 = +[UIKeyboardImpl activeInstance];
    if ([v78 shouldShowDictationKey])
    {
      v79 = [(UIKBTree *)self->super._keyplane name];
      uint64_t v80 = [v79 rangeOfString:@"Dictation"];

      if (v80 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v81 = +[UIDictationController sharedInstance];
        [v81 updateHelperMessageDisplayIfNeeded];
LABEL_77:

        [(UIKeyboardLayoutCursor *)self updateRecentInputsKeyIfNecessary];
        v82 = [(UIKBTree *)self->super._keyplane name];
        uint64_t v83 = [v82 rangeOfString:@"Dictation"];

        if (v83 == 0x7FFFFFFFFFFFFFFFLL) {
          [(UIKeyboardLayoutCursor *)self selectInitialKeyIfNecessary];
        }
        [(UIKeyboardLayoutCursor *)self updateKeyplaneSwitchEdgeBiases];
        [(UIKeyboardLayoutCursor *)self updateDictationHelpString];
        v84 = +[UIKBKeyplaneChangeContext keyplaneChangeContext];
        [(UIKeyboardLayoutStar *)self _didChangeKeyplaneWithContext:v84];

        self->_keyplaneSwitchSelectedKeyFrameCenter.double x = x;
        self->_keyplaneSwitchSelectedKeyFrameCenter.double y = y;
        [(UIKeyboardLayoutCursor *)self setLastSelectedKeyIndex:0x7FFFFFFFFFFFFFFFLL];
        goto LABEL_80;
      }
    }
    else
    {
    }
    v81 = +[UIDictationController sharedInstance];
    [v81 stopHelperMessageDisplayIfNeeded];
    goto LABEL_77;
  }
LABEL_81:
}

void __42__UIKeyboardLayoutCursor_setKeyplaneName___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
  v1 = (void *)_MergedGlobals_45;
  _MergedGlobals_45 = v0;

  uint64_t v2 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@".,-/#&@'+"];
  uint64_t v3 = (void *)qword_1EB25C4F8;
  qword_1EB25C4F8 = v2;
}

void __42__UIKeyboardLayoutCursor_setKeyplaneName___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)_MergedGlobals_45;
  id v10 = v3;
  int v5 = [v3 representedString];
  LODWORD(v4) = objc_msgSend(v4, "characterIsMember:", objc_msgSend(v5, "characterAtIndex:", 0));

  if (v4)
  {
    id v6 = v10;
    double v7 = (id *)(a1 + 32);
  }
  else
  {
    CGFloat v8 = (void *)qword_1EB25C4F8;
    double v9 = [v10 representedString];
    LODWORD(v8) = objc_msgSend(v8, "characterIsMember:", objc_msgSend(v9, "characterAtIndex:", 0));

    if (!v8) {
      goto LABEL_6;
    }
    id v6 = v10;
    double v7 = (id *)(a1 + 40);
  }
  [*v7 addObject:v6];
LABEL_6:
}

uint64_t __42__UIKeyboardLayoutCursor_setKeyplaneName___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  int v5 = [a2 representedString];
  id v6 = [v4 representedString];

  uint64_t v7 = [v5 localizedCompare:v6];
  return v7;
}

- (BOOL)shouldAllowCurrentKeyplaneReload
{
  return [(UIKeyboardLayout *)self idiom] != 2
      || [(UITextInputTraits *)self->super.super._inputTraits keyboardType] != 7;
}

- (void)selectInitialKeyIfNecessary
{
  if ([(UIKBScreenTraits *)self->super.super._screenTraits idiom] == 3)
  {
    id v3 = +[UIKeyboard activeKeyboard];
    if ([v3 isFocused])
    {
    }
    else
    {
      id v4 = +[UIKeyboard activeKeyboard];
      BOOL v5 = [(UIView *)self isDescendantOfView:v4];

      if (v5) {
        return;
      }
    }
  }
  if (self->_selectInitialKey) {
    goto LABEL_25;
  }
  uint64_t v10 = [(UIKeyboardLayoutCursor *)self currentKey];
  if (!v10
    || (double v11 = (void *)v10,
        [(UIKeyboardLayoutCursor *)self currentKey],
        double v12 = objc_claimAutoreleasedReturnValue(),
        int v13 = [v12 visible],
        v12,
        v11,
        !v13))
  {
LABEL_25:
    if ([(UITextInputTraits *)self->super.super._inputTraits hasDefaultContents])
    {
      keyplaneKeys = self->_keyplaneKeys;
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __53__UIKeyboardLayoutCursor_selectInitialKeyIfNecessary__block_invoke;
      v23[3] = &unk_1E52F5440;
      v23[4] = self;
      [(NSArray *)keyplaneKeys enumerateObjectsUsingBlock:v23];
    }
    else
    {
      uint64_t v7 = +[UIKeyboard activeKeyboard];
      int v8 = [v7 isFocused];

      if (v8)
      {
        unint64_t v9 = [(UIKeyboardLayoutCursor *)self _indexOfFirstKeyPassingTest:&__block_literal_global_113_4];
        if (v9 != 0x7FFFFFFFFFFFFFFFLL)
        {
          self->_unint64_t selectedKeyIndex = 0x7FFFFFFFFFFFFFFFLL;
          [(UIKeyboardLayoutCursor *)self setSelectedKeyIndex:v9];
          self->_selectInitialKedouble y = 1;
        }
      }
      else
      {
        _savedSelectedKeyIndedouble x = 0x7FFFFFFFFFFFFFFFLL;
      }
    }
    return;
  }
  double v14 = [(UIKeyboardLayoutCursor *)self currentKey];
  uint64_t v15 = [(UIKeyboardLayoutCursor *)self activeStateForKey:v14];

  double v16 = [(UIKeyboardLayoutCursor *)self currentKey];
  if ([v16 state] != v15)
  {

LABEL_19:
    id v21 = [(UIKeyboardLayoutCursor *)self currentKey];
    [(UIKeyboardLayoutStar *)self setState:v15 forKey:v21];

    goto LABEL_20;
  }
  keyplaneView = self->super._keyplaneView;
  BOOL v18 = [(UIKeyboardLayoutCursor *)self currentKey];
  v19 = [(UIKBKeyplaneView *)keyplaneView viewForKey:v18];
  uint64_t v20 = objc_opt_class();

  if (!v20) {
    goto LABEL_19;
  }
LABEL_20:
  id v22 = [(UIKeyboardLayoutCursor *)self currentKey];
  [(UIKeyboardLayoutCursor *)self refreshSelectedCellIfNecessaryForKey:v22];
}

void __53__UIKeyboardLayoutCursor_selectInitialKeyIfNecessary__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  if ([v9 interactionType] == 4
    || ([v9 name],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 isEqualToString:@"Monolith-Recent-Inputs-Key"],
        v7,
        v8))
  {
    [*(id *)(a1 + 32) setSelectedKeyIndex:a3];
    *a4 = 1;
  }
}

uint64_t __53__UIKeyboardLayoutCursor_selectInitialKeyIfNecessary__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 interactionType] == 1
    || [v2 interactionType] == 2
    || [v2 interactionType] == 16)
  {
    uint64_t v3 = 1;
  }
  else
  {
    BOOL v5 = [v2 name];
    uint64_t v3 = [v5 isEqualToString:@"Monolith-Recent-Inputs-Key"];
  }
  return v3;
}

- (void)updateKeyplaneSwitchEdgeBiases
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v3 = self->_keyplaneKeys;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (!v4)
  {
    id v6 = 0;
LABEL_28:

    goto LABEL_29;
  }
  uint64_t v5 = v4;
  id v6 = 0;
  LODWORD(v7) = 0;
  uint64_t v8 = *(void *)v17;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v17 != v8) {
        objc_enumerationMutation(v3);
      }
      uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
      if (([v10 interactionType] == 10
         || [v10 interactionType] == 9)
        && [v10 visible])
      {
        if (v7)
        {
          double v11 = [(NSArray *)self->_keyplaneKeys lastObject];

          if (v10 == v11)
          {
            if ([(UIKeyboardLayoutCursor *)self isAppRightToLeft]) {
              uint64_t v7 = 21;
            }
            else {
              uint64_t v7 = 29;
            }
          }
          else
          {
            uint64_t v7 = 2;
          }
        }
        else if ([(UIKeyboardLayoutCursor *)self isAppRightToLeft])
        {
          uint64_t v7 = 29;
        }
        else
        {
          uint64_t v7 = 21;
        }
        double v12 = [NSNumber numberWithUnsignedInt:v7];
        [v10 setObject:v12 forProperty:@"popup-bias"];

        id v13 = v10;
        id v6 = v13;
      }
    }
    uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  }
  while (v5);

  if (v6 && v7 == 2)
  {
    double v14 = NSNumber;
    if ([(UIKeyboardLayoutCursor *)self isAppRightToLeft]) {
      uint64_t v15 = 21;
    }
    else {
      uint64_t v15 = 29;
    }
    uint64_t v3 = [v14 numberWithInt:v15];
    [v6 setObject:v3 forProperty:@"popup-bias"];
    goto LABEL_28;
  }
LABEL_29:
}

- (void)updateDictationHelpString
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(UIKBTree *)self->super._keyplane name];
  uint64_t v4 = [v3 rangeOfString:@"Dictation"];

  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  uint64_t v5 = self->_keyplaneKeys;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v75 objects:v79 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v73 = 0;
    uint64_t v8 = *(void *)v76;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v76 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v75 + 1) + 8 * i);
        if ([v10 interactionType] == 10
          || [v10 interactionType] == 9)
        {
          double v11 = [(UIKBKeyplaneView *)self->super._keyplaneView viewForKey:v10];
          [v11 setHidden:v4 != 0x7FFFFFFFFFFFFFFFLL];
          if (!v73)
          {
            if ([v10 interactionType] == 10) {
              id v73 = v10;
            }
            else {
              id v73 = 0;
            }
          }
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v75 objects:v79 count:16];
    }
    while (v7);

    if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (!v73)
      {

        return;
      }
      if (!self->_dictationHelpLabel)
      {
        [v73 frame];
        double v13 = v12;
        double v15 = v14;
        [(UIView *)self bounds];
        long long v17 = -[UILabel initWithFrame:]([UILabel alloc], "initWithFrame:", 0.0, v13, v16, v15);
        dictationHelpLabel = self->_dictationHelpLabel;
        self->_dictationHelpLabel = v17;

        [(UILabel *)self->_dictationHelpLabel setTextAlignment:1];
      }
      long long v19 = [(UIKeyboardLayoutStar *)self renderConfig];
      uint64_t v20 = +[UIKBRenderingContext renderingContextForRenderConfig:v19];

      uint64_t v21 = +[UIKBRenderFactory lightweightFactoryForVisualStyle:[(UIKBTree *)self->super._keyplane visualStyling] renderingContext:v20];
      id v22 = [v21 traitsForKey:v73 onKeyplane:self->super._keyplane];
      uint64_t v23 = [v22 symbolStyle];
      int v72 = v22;
      if (!v23) {
        goto LABEL_25;
      }
      v24 = (void *)v23;
      v25 = [v22 symbolStyle];
      v26 = [v25 textColor];

      if (v26)
      {
        v27 = [v22 symbolStyle];
        [v27 fontSize];
        double v29 = v28;
        v30 = [v22 symbolStyle];
        [v30 fontWeight];
        v32 = [off_1E52D39B8 systemFontOfSize:v29 weight:v31];
        [(UILabel *)self->_dictationHelpLabel setFont:v32];

        v33 = [v22 symbolStyle];
        v34 = [v33 textColor];
        v35 = +[UIColor colorWithCGColor:UIKBGetNamedColor(v34)];
        [(UILabel *)self->_dictationHelpLabel setTextColor:v35];
      }
      else
      {
LABEL_25:
        id v37 = [off_1E52D39B8 systemFontOfSize:29.0 weight:*(double *)off_1E52D6BF0];
        [(UILabel *)self->_dictationHelpLabel setFont:v37];

        v38 = [(UIKeyboardLayoutStar *)self renderConfig];
        int v39 = [v38 lightKeyboard];
        char v40 = UIKBColorBlack_Alpha40;
        if (!v39) {
          char v40 = UIKBColorWhite_Alpha50;
        }
        v41 = *v40;

        v33 = +[UIColor colorWithCGColor:UIKBGetNamedColor(v41)];
        v42 = self->_dictationHelpLabel;

        [(UILabel *)v42 setTextColor:v33];
      }

      uint64_t v43 = [(UITextInputTraits *)self->super.super._inputTraits dictationInfoKeyboardType];
      uint64_t v44 = +[UIKeyboardInputModeController sharedInputModeController];
      v45 = [v44 currentInputMode];
      char v71 = [v45 languageWithRegion];

      int v46 = +[UIKeyboardInputModeController sharedInputModeController];
      v47 = [v46 enabledDictationLanguages];
      unint64_t v48 = [v47 count];

      if (UIKeyboardTypeSupportsDictationSpelling(v43)
        || [(UITextInputTraits *)self->super.super._inputTraits isSecureTextEntry]
        || [(UITextInputTraits *)self->super.super._inputTraits forceSpellingDictation])
      {
        if (v48 < 2)
        {
          v59 = _UILocalizedString(@"ATV_DICTATION_SPELLING_INSTRUCTION", @"Instruction text for AppleTV spelling dictation.", @"Speak in letters, numbers, and symbols.");
        }
        else
        {
          v49 = _UILocalizedString(@"ATV_DICTATION_SPELLING_INSTRUCTION_LANGUAGE", @"Instruction text for AppleTV spelling dictation with language.", @"Speak in letters, numbers, and symbols in %@.");
          v50 = +[UIKeyboardInputModeController sharedInputModeController];
          char v51 = [v50 currentInputMode];
          v52 = [v51 defaultDictationLanguage];

          v53 = +[UIDictationController sharedInstance];
          int v54 = [v53 currentInputModeForDictation];
          uint64_t v55 = [v54 dictationLanguage];

          uint64_t v56 = TIInputModeGetLanguageWithRegion();
          if ([v49 hasPrefix:@"%@"]) {
            uint64_t v57 = 4;
          }
          else {
            uint64_t v57 = 5;
          }
          uint64_t v58 = UIKeyboardDictationDisplayNameInUILanguage(v56, v57);
          v59 = [NSString localizedStringWithValidatedFormat:v49, @"%@", 0, v58 validFormatSpecifiers error];
        }
      }
      else
      {
        v59 = _UILocalizedString(@"ATV_DICTATION_GENERIC_INSTRUCTION", @"Instruction text for AppleTV generic dictation.", @"Speak in full words and phrases.");
        if (v48 >= 2)
        {
          v61 = _UILocalizedString(@"ATV_DICTATION_GENERIC_INSTRUCTION_LANGUAGE", @"Instruction text for AppleTV generic dictation with language.", @"Speak in full words and phrases in %@.");

          uint64_t v62 = +[UIKeyboardInputModeController sharedInputModeController];
          uint64_t v63 = [v62 currentInputMode];
          uint64_t v64 = [v63 defaultDictationLanguage];

          uint64_t v65 = +[UIDictationController sharedInstance];
          v66 = [v65 currentInputModeForDictation];
          v67 = [v66 dictationLanguage];

          v68 = TIInputModeGetLanguageWithRegion();
          if ([v61 hasPrefix:@"%@"]) {
            uint64_t v69 = 4;
          }
          else {
            uint64_t v69 = 5;
          }
          v70 = UIKeyboardDictationDisplayNameInUILanguage(v68, v69);
          v59 = [NSString localizedStringWithValidatedFormat:v61, @"%@", 0, v70 validFormatSpecifiers error];
        }
      }
      [(UILabel *)self->_dictationHelpLabel setText:v59];
      v60 = [(UIView *)self->_dictationHelpLabel superview];

      if (v60 != self)
      {
        [(UIView *)self->_dictationHelpLabel setAlpha:0.0];
        [(UIView *)self insertSubview:self->_dictationHelpLabel above:self->super._keyplaneView];
        v74[0] = MEMORY[0x1E4F143A8];
        v74[1] = 3221225472;
        v74[2] = __51__UIKeyboardLayoutCursor_updateDictationHelpString__block_invoke;
        v74[3] = &unk_1E52D9F70;
        v74[4] = self;
        +[UIView animateWithDuration:v74 animations:0.133];
      }

      goto LABEL_41;
    }
  }
  else
  {

    id v73 = 0;
    if (v4 != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_42;
    }
  }
  id v36 = self->_dictationHelpLabel;
  if (v36)
  {
    [(UIView *)v36 removeFromSuperview];
    uint64_t v20 = self->_dictationHelpLabel;
    self->_dictationHelpLabel = 0;
LABEL_41:
  }
LABEL_42:
}

uint64_t __51__UIKeyboardLayoutCursor_updateDictationHelpString__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1608) setAlpha:1.0];
}

- (BOOL)shouldMatchCaseForDomainKeys
{
  return [(UIKeyboardLayout *)self idiom] == 2;
}

- (void)showRecentInputsAlert
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _UINSLocalizedStringWithDefaultValue(@"Previously-Used Emails", @"Previously-Used Emails");
  uint64_t v4 = +[UIAlertController alertControllerWithTitle:v3 message:0 preferredStyle:1];

  [v4 setKbDelegate:self];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [(UILexicon *)self->_recentInputs entries];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v18 + 1) + 8 * v9) userInput];
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __47__UIKeyboardLayoutCursor_showRecentInputsAlert__block_invoke;
        v17[3] = &unk_1E52DC290;
        v17[4] = self;
        double v11 = +[UIAlertAction actionWithTitle:v10 style:0 handler:v17];
        [v4 addAction:v11];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  [v4 _addSectionDelimiter];
  double v12 = _UINSLocalizedStringWithDefaultValue(@"Clear All", @"Clear All");
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __47__UIKeyboardLayoutCursor_showRecentInputsAlert__block_invoke_2;
  v16[3] = &unk_1E52DC290;
  v16[4] = self;
  double v13 = +[UIAlertAction actionWithTitle:v12 style:0 handler:v16];

  [v4 addAction:v13];
  double v14 = +[UIAlertAction actionWithTitle:0 style:1 handler:0];
  [v14 setEnabled:0];
  [v4 addAction:v14];
  [(UIKeyboardLayoutCursor *)self setRecentInputsAlert:v4];
  double v15 = [(UIView *)self _viewControllerForAncestor];
  [v15 presentViewController:v4 animated:1 completion:0];
}

void __47__UIKeyboardLayoutCursor_showRecentInputsAlert__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 title];
  [v2 didSelectRecentInputString:v3];
}

uint64_t __47__UIKeyboardLayoutCursor_showRecentInputsAlert__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) didSelectRecentInputString:0x1ED13F800];
}

- (void)alertDidDismiss
{
  dispatch_time_t v3 = dispatch_time(0, 250000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__UIKeyboardLayoutCursor_alertDidDismiss__block_invoke;
  block[3] = &unk_1E52D9F70;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x1E4F14428], block);
}

void __41__UIKeyboardLayoutCursor_alertDidDismiss__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _focusSystem];
  id v5 = [v2 _focusedView];

  if ([*(id *)(a1 + 32) isDescendantOfView:v5]
    && ![*(id *)(a1 + 32) cursorLocation])
  {
    [*(id *)(a1 + 32) selectInitialKeyIfNecessary];
  }
  dispatch_time_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = +[UIKBKeyplaneChangeContext keyplaneChangeContext];
  [v3 _didChangeKeyplaneWithContext:v4];
}

- (void)didSelectRecentInputString:(id)a3
{
  id v8 = a3;
  uint64_t v4 = +[UIKeyboardImpl activeInstance];
  if ([v8 isEqualToString:0x1ED13F800])
  {
    [v4 clearRecentInput];
    [(UIKeyboardLayoutCursor *)self setRecentInputs:0];
    id v5 = [(UIKBTree *)self->super._keyplane name];
    [(UIKeyboardLayoutCursor *)self setKeyplaneName:v5];

    [(UIKeyboardLayoutCursor *)self setSelectedKeyIndex:0x7FFFFFFFFFFFFFFFLL];
  }
  else
  {
    [v4 handleClear];
    uint64_t v6 = [(UIKeyboardLayoutStar *)self createKeyEventForStringAction:v8 forKey:0 inputFlags:2];
    [v4 handleKeyEvent:v6];
  }
  uint64_t v7 = [(UIKeyboardLayoutCursor *)self recentInputsAlert];
  [v7 dismissViewControllerAnimated:1 completion:0];

  [(UIKeyboardLayoutCursor *)self setRecentInputsAlert:0];
}

- (void)updateRecentInputsKeyIfNecessary
{
  id v4 = [(UIKBTree *)self->super._keyplane firstCachedKeyWithName:@"Monolith-Recent-Inputs-Key"];
  dispatch_time_t v3 = [(UIKBKeyplaneView *)self->super._keyplaneView viewForKey:v4];
  [v3 setVerticalLayout:self->_disableTouchInput];
  [v3 setRecentInputs:self->_recentInputs];
}

- (void)acceptRecentInputIfNecessary
{
  uint64_t v8 = [(UIKBTree *)self->super._keyplane firstCachedKeyWithName:@"Monolith-Recent-Inputs-Key"];
  dispatch_time_t v3 = [(UIKeyboardLayoutCursor *)self currentKey];

  id v4 = (void *)v8;
  if (v3 == (void *)v8)
  {
    id v5 = -[UIKBKeyplaneView viewForKey:](self->super._keyplaneView, "viewForKey:");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [v5 selectedRecentInputString];
      if (([v6 isEqualToString:0x1ED13F800] & 1) == 0)
      {
        uint64_t v7 = +[UIKeyboardImpl activeInstance];
        [v7 acceptRecentInput:v6];
      }
    }

    id v4 = (void *)v8;
  }
}

- (void)setRecentInputs:(id)a3
{
  objc_storeStrong((id *)&self->_recentInputs, a3);
  [(UIKeyboardLayoutCursor *)self updateRecentInputsKeyIfNecessary];
}

- (BOOL)shouldPreventInputManagerHitTestingForKey:(id)a3
{
  return 1;
}

- (BOOL)shouldRetestKey:(id)a3 slidOffKey:(id)a4 withKeyplane:(id)a5
{
  return 0;
}

- (unsigned)getHandRestRecognizerState
{
  return 0;
}

- (BOOL)supportsEmoji
{
  return 0;
}

- (BOOL)isPossibleToTypeFast
{
  return 0;
}

- (id)_keyplaneForKeyplaneProperties
{
  indirectKeyboard = self->_indirectKeyboard;
  if (!indirectKeyboard
    || (keyplane = self->super._keyplane) == 0
    || ([(UIKBTree *)keyplane name],
        id v5 = objc_claimAutoreleasedReturnValue(),
        [(UIKBTree *)indirectKeyboard subtreeWithName:v5],
        uint64_t v6 = (UIKBTree *)objc_claimAutoreleasedReturnValue(),
        v5,
        !v6))
  {
    uint64_t v6 = self->super._keyplane;
  }
  return v6;
}

- (BOOL)usesAutoShift
{
  id v2 = [(UIKeyboardLayoutCursor *)self _keyplaneForKeyplaneProperties];
  char v3 = [v2 BOOLForProperty:@"autoshift"];

  return v3;
}

- (BOOL)ignoresShiftState
{
  id v2 = [(UIKeyboardLayoutCursor *)self _keyplaneForKeyplaneProperties];
  char v3 = [v2 BOOLForProperty:@"ignore-shift-state"];

  return v3;
}

- (void)setShift:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)UIKeyboardLayoutCursor;
  [(UIKeyboardLayoutStar *)&v3 setShift:a3];
}

- (BOOL)isAlphabeticPlane
{
  id v2 = [(UIKeyboardLayoutCursor *)self _keyplaneForKeyplaneProperties];
  char v3 = [v2 BOOLForProperty:@"is-alphabetic-plane"];

  return v3;
}

- (BOOL)isKanaPlane
{
  id v2 = [(UIKeyboardLayoutCursor *)self _keyplaneForKeyplaneProperties];
  char v3 = [v2 isKanaPlane];

  return v3;
}

- (BOOL)supportsContinuousPath
{
  return [(UIKBTree *)self->super._keyplane BOOLForProperty:@"supports-continuous-path"];
}

- (BOOL)diacriticForwardCompose
{
  id v2 = [(UIKeyboardLayoutCursor *)self _keyplaneForKeyplaneProperties];
  char v3 = [v2 BOOLForProperty:@"diacritic-forward-compose"];

  return v3;
}

- (void)setDisableTouchInput:(BOOL)a3
{
  self->_disableTouchInput = a3;
}

- (unint64_t)targetEdgesForScreenGestureRecognition
{
  return 0;
}

- (BOOL)shouldToggleKeyplaneWithName:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 rangeOfString:@"Recents"] == 0x7FFFFFFFFFFFFFFFLL
    && [v3 rangeOfString:@"Dictation"] == 0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

- (BOOL)isKeyplaneDisabledWithName:(id)a3
{
  id v4 = a3;
  if ([v4 rangeOfString:@"Dictation"] != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_7:
    BOOL v5 = 1;
    goto LABEL_8;
  }
  if ([v4 rangeOfString:@"Recents"] != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = +[UIKeyboard activeKeyboard];
    int v7 = [v6 _useRecentsAlert];

    if (v7 && ![(UITextInputTraits *)self->super.super._inputTraits isSecureTextEntry])
    {
      double v11 = [(UILexicon *)self->_recentInputs entries];
      BOOL v5 = [v11 count] == 0;

      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if ([v4 rangeOfString:@"Numbers"] == 0x7FFFFFFFFFFFFFFFLL
    || ((unint64_t v9 = [(UITextInputTraits *)self->super.super._inputTraits keyboardType], v5 = 1, v9 <= 9)
      ? (BOOL v10 = ((1 << v9) & 0x2CF) == 0)
      : (BOOL v10 = 1),
        v10 && v9 != 123))
  {
    BOOL v5 = 0;
  }
LABEL_8:

  return v5;
}

- (BOOL)shouldMergeKey:(id)a3
{
  id v4 = a3;
  if ([v4 interactionType] == 10)
  {
    BOOL v5 = [v4 name];

    BOOL v6 = [(UIKeyboardLayoutCursor *)self isKeyplaneDisabledWithName:v5];
    return v6;
  }
  else
  {
    int v8 = [v4 interactionType];

    if (v8 == 9)
    {
      if ([(UITextInputTraits *)self->super.super._inputTraits isSecureTextEntry]) {
        char HasMultipleActiveSecureInputModes = UIKeyboardHasMultipleActiveSecureInputModes();
      }
      else {
        char HasMultipleActiveSecureInputModes = (unint64_t)[(id)UIKeyboardActiveUserSelectableInputModes count] > 1;
      }
      return HasMultipleActiveSecureInputModes ^ 1;
    }
    else
    {
      return 0;
    }
  }
}

- (int)stateForKeyplaneSwitchKey:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UIKeyboardLayoutCursor;
  int v5 = [(UIKeyboardLayoutStar *)&v10 stateForKeyplaneSwitchKey:v4];
  if (v5 != 4)
  {
    BOOL v6 = [v4 name];
    uint64_t v7 = [v6 rangeOfString:@"Recents"];

    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      int v8 = [(UILexicon *)self->_recentInputs entries];
      if ([v8 count]) {
        int v5 = 2;
      }
      else {
        int v5 = 1;
      }
    }
  }

  return v5;
}

- (int)stateForCandidateListKey:(id)a3
{
  return 16;
}

- (int64_t)defaultSelectedVariantIndexForKey:(id)a3 withActions:(unint64_t)a4
{
  if ([(UIKeyboardLayout *)self idiom] == 2) {
    return 1;
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (BOOL)canMultitap
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  keyplane = self->super._keyplane;
  p_cachedMultitapKeyplane = &self->_cachedMultitapKeyplane;
  if (keyplane != *p_cachedMultitapKeyplane)
  {
    objc_storeStrong((id *)p_cachedMultitapKeyplane, keyplane);
    self->_cachedCanMultitap = 0;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    int v5 = [(UIKBTree *)self->super._keyplane keys];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          if ([*(id *)(*((void *)&v11 + 1) + 8 * i) interactionType] == 16)
          {
            self->_cachedCanMultitap = 1;
            goto LABEL_12;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  return self->_cachedCanMultitap;
}

- (void)endMultitapForKey:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_super v10 = v4;
    int v5 = [(UIKBKeyplaneView *)self->super._keyplaneView viewForKey:v4];
    if (v5)
    {
      uint64_t v6 = [(UIKeyboardLayoutCursor *)self keyViewAnimator];
      uint64_t v7 = [v10 state];
      uint64_t v8 = [(UIKeyboardLayoutCursor *)self currentKey];
      if (v8 == v10) {
        uint64_t v9 = 8;
      }
      else {
        uint64_t v9 = 2;
      }
      [v6 transitionKeyView:v5 fromState:v7 toState:v9 completion:0];
    }
    id v4 = v10;
  }
}

- (void)longPressAction
{
  id v3 = [(UIKeyboardLayoutCursor *)self currentKey];
  int v4 = [v3 state];

  v13.receiver = self;
  v13.super_class = (Class)UIKeyboardLayoutCursor;
  [(UIKeyboardLayoutStar *)&v13 longPressAction];
  if ([(UIKeyboardLayoutCursor *)self isSlimLinearKeyboardTV])
  {
    int v5 = [(UIKeyboardLayoutCursor *)self currentKey];
    int v6 = [v5 interactionType];

    if (v6 == 10) {
      [(UIKeyboardLayoutCursor *)self showPopupKeyplaneSwitcher];
    }
  }
  uint64_t v7 = [(UIKeyboardLayoutCursor *)self currentKey];
  int v8 = [v7 state];

  if (v4 != 16 && v8 == 16)
  {
    self->_ignoreEventsUntilPressEnds = 1;
    uint64_t v9 = +[UIKBKeyplaneChangeContext keyplaneChangeContext];
    [(UIKeyboardLayoutStar *)self _didChangeKeyplaneWithContext:v9];

    +[_UIKeyboardUsageTracking showVariantsIncrement];
  }
  objc_super v10 = [(UIKeyboardLayoutCursor *)self currentKey];
  int v11 = [v10 interactionType];

  if (v11 == 4)
  {
    long long v12 = +[UIKeyboardImpl activeInstance];
    [v12 handleClear];
  }
}

- (void)showPopupKeyplaneSwitcher
{
  keyboard = self->super._keyboard;
  int v4 = [(UIKeyboardLayoutStar *)self keyplane];
  id v14 = [(UIKBTree *)keyboard keyplaneSwitchKeysWithoutCurrentKeyplane:v4];

  [(UIKeyboardLayoutStar *)self updateLocalizedDisplayStringsForKeys:v14];
  int v5 = [(UIKeyboardLayoutCursor *)self currentKey];
  [v5 setSelectedVariantIndex:0];

  int v6 = [(UIKeyboardLayoutCursor *)self currentKey];
  [v6 setVariantType:14];

  BOOL v7 = [(UIView *)self _shouldReverseLayoutDirection];
  int v8 = UIKBAttributeValueFixedLeftStr;
  if (v7) {
    int v8 = UIKBAttributeValueFixedRightStr;
  }
  uint64_t v9 = *v8;
  objc_super v10 = [(UIKeyboardLayoutCursor *)self currentKey];
  [v10 setVariantPopupBias:v9];

  int v11 = (void *)[v14 mutableCopy];
  long long v12 = [(UIKeyboardLayoutCursor *)self currentKey];
  [v12 setSubtrees:v11];

  if ([(UIKBScreenTraits *)self->super.super._screenTraits idiom] == 2) {
    [(UIKeyboardLayoutStar *)self setKeyboardDim:1];
  }
  objc_super v13 = [(UIKeyboardLayoutCursor *)self currentKey];
  [(UIKeyboardLayoutStar *)self setState:16 forKey:v13];
}

- (int)activeStateForKey:(id)a3
{
  id v3 = a3;
  if ([v3 displayType] == 38 || objc_msgSend(v3, "displayType") == 1)
  {
    int v4 = 16;
  }
  else if ([v3 displayType] == 14)
  {
    int v4 = 8;
  }
  else
  {
    int v4 = 8;
    if ([v3 displayType] != 4)
    {
      if ([v3 displayType] == 13) {
        int v4 = 8;
      }
      else {
        int v4 = 4;
      }
    }
  }

  return v4;
}

- (int)enabledStateForKey:(id)a3
{
  id v4 = a3;
  if ([v4 displayType] == 38 || objc_msgSend(v4, "displayType") == 1)
  {
    int v5 = 16;
  }
  else if ([v4 displayType] == 14 || objc_msgSend(v4, "displayType") == 4)
  {
    int v5 = [(UIKeyboardLayoutCursor *)self stateForKeyplaneSwitchKey:v4];
  }
  else
  {
    int v5 = 2;
  }

  return v5;
}

- (unint64_t)downActionFlagsForKey:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIKeyboardLayoutCursor;
  unint64_t v5 = [(UIKeyboardLayoutStar *)&v9 downActionFlagsForKey:v4];
  if ([v4 interactionType] == 16)
  {
    int v6 = +[UIKeyboardImpl activeInstance];
    if ([v6 isLongPress])
    {
      BOOL v7 = [(UIKeyboardLayoutStar *)self keyHasAccentedVariants:v4];

      if (v7) {
        v5 |= 0x8080uLL;
      }
    }
    else
    {
    }
  }

  return v5;
}

- (unint64_t)cursorLocation
{
  if (self->_selectedKeyIndex == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  uint64_t v4 = [(id)UIApp userInterfaceLayoutDirection];
  unint64_t v5 = [(UIKeyboardLayoutCursor *)self currentKey];
  unint64_t v6 = [(UIKeyboardLayoutCursor *)self variantCountForKey:v5];
  if (v6)
  {
    int v7 = [v5 state];
    uint64_t v8 = [v5 selectedVariantIndex];
    if (v4 == 1) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = v6 - 1;
    }
    if (v4 == 1) {
      unint64_t v10 = v6 - 1;
    }
    else {
      unint64_t v10 = 0;
    }
    BOOL v11 = v8 == 0;
    BOOL v12 = v8 == v10;
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      BOOL v11 = 1;
      BOOL v12 = 1;
    }
    BOOL v13 = v7 == 16;
    BOOL v14 = v7 == 16 && v8 == v6 - 1;
    LODWORD(v6) = v7 == 16 && v11;
    BOOL v15 = v7 == 16 && v12;
    BOOL v47 = v15;
  }
  else
  {
    uint64_t v8 = [v5 selectedVariantIndex];
    BOOL v13 = 0;
    BOOL v14 = 0;
    BOOL v47 = 0;
    if (v4 == 1) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = -1;
    }
  }
  BOOL v16 = v8 == v9 && v13;
  BOOL v46 = v16;
  if (v5)
  {
    [v5 frame];
    double v18 = v17;
  }
  else
  {
    [(UIKeyboardLayoutCursor *)self defaultCursorAdjustDistance];
    double v18 = v19;
  }
  [(UIKeyboardLayoutCursor *)self defaultCursorAdjustDistance];
  if (v18 > v20)
  {
    [(UIKeyboardLayoutCursor *)self defaultCursorAdjustDistance];
    double v18 = v21;
  }
  int v48 = v6;
  if (v5)
  {
    [v5 frame];
    double v23 = v22;
  }
  else
  {
    [(UIKeyboardLayoutCursor *)self defaultCursorAdjustDistance];
    double v23 = v24;
  }
  int64_t v25 = -[UIKeyboardLayoutCursor targetKeyIndexAtOffset:fromKey:](self, "targetKeyIndexAtOffset:fromKey:", v5, -v18, 0.0);
  int64_t v26 = -[UIKeyboardLayoutCursor targetKeyIndexAtOffset:fromKey:](self, "targetKeyIndexAtOffset:fromKey:", v5, v18, 0.0);
  int64_t v27 = -[UIKeyboardLayoutCursor targetKeyIndexAtOffset:fromKey:](self, "targetKeyIndexAtOffset:fromKey:", v5, 0.0, -v23);
  -[UIKeyboardLayoutCursor targetKeyIndexAtOffset:fromKey:](self, "targetKeyIndexAtOffset:fromKey:", v5, 0.0, v23);
  unint64_t selectedKeyIndex = self->_selectedKeyIndex;
  int v29 = !v13;
  if (selectedKeyIndex || ((v29 | v47) & 1) == 0)
  {
    if (((selectedKeyIndex >= [(NSArray *)self->_keyplaneKeys count] - 1) & (v29 | v46)) != 0) {
      uint64_t v31 = 4;
    }
    else {
      uint64_t v31 = 0;
    }
    int64_t v30 = self->_selectedKeyIndex;
  }
  else
  {
    int64_t v30 = 0;
    uint64_t v31 = 1;
  }
  BOOL v32 = v14;
  BOOL v33 = v25 == v30;
  int v34 = v48;
  if ((v33 & (v29 | v48)) != 0) {
    v31 |= 0x20uLL;
  }
  if (((v26 == v30) & (v29 | v14)) != 0) {
    uint64_t v35 = v31 | 0x40;
  }
  else {
    uint64_t v35 = v31;
  }
  if (v35) {
    uint64_t v36 = v35;
  }
  else {
    uint64_t v36 = 2;
  }
  [v5 frame];
  if (fabs(CGRectGetMinY(v49)) >= 15.0)
  {
    if (v27 != 0x7FFFFFFFFFFFFFFFLL && v27 != self->_selectedKeyIndex)
    {
      id v37 = [(NSArray *)self->_keyplaneKeys objectAtIndex:v27];
      if ([v37 interactionType] == 3)
      {
        v38 = [(UIKeyboardLayoutStar *)self candidateList];
        int v39 = [v38 hasCandidates];

        int v34 = v48;
        if (!v39) {
          v36 |= 8uLL;
        }
      }
    }
  }
  else
  {
    v36 |= 8uLL;
  }
  [(UIView *)self bounds];
  double v41 = v40;
  [v5 frame];
  if (vabdd_f64(v41, CGRectGetMaxY(v50)) >= 15.0) {
    unint64_t v2 = v36;
  }
  else {
    unint64_t v2 = v36 | 0x10;
  }
  if (v13)
  {
    int v42 = [v5 variantType];
    uint64_t v43 = 128;
    if (v34) {
      uint64_t v43 = 160;
    }
    unint64_t v44 = v2 & 0xFFFFFFFFFFFFFFE7 | v43;
    if (v32) {
      v44 |= 0x40uLL;
    }
    if (v42) {
      unint64_t v2 = v44;
    }
  }

  return v2;
}

- (void)setCursorLocation:(unint64_t)a3
{
  __int16 v3 = a3;
  unint64_t v5 = a3 & 7;
  int64_t selectedKeyIndex = 0x7FFFFFFFFFFFFFFFLL;
  switch(v5)
  {
    case 0uLL:
      if ((v3 & 0x200) == 0) {
        _savedSelectedKeyIndedouble x = self->_selectedKeyIndex;
      }
      goto LABEL_10;
    case 1uLL:
      int64_t selectedKeyIndex = 0;
      goto LABEL_10;
    case 2uLL:
      int64_t selectedKeyIndex = self->_selectedKeyIndex;
      if (selectedKeyIndex != 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_10;
      }
      int64_t selectedKeyIndex = _savedSelectedKeyIndex;
      if ((v3 & 0x100) != 0 || _savedSelectedKeyIndex != 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_10;
      }
      [(UIKeyboardLayoutCursor *)self selectInitialKeyIfNecessary];
      break;
    case 4uLL:
      int64_t selectedKeyIndex = [(NSArray *)self->_keyplaneKeys count] - 1;
      goto LABEL_10;
    default:
LABEL_10:
      [(UIKeyboardLayoutCursor *)self setSelectedKeyIndex:selectedKeyIndex];
      break;
  }
  id v14 = [(UIKeyboardLayoutCursor *)self currentKey];
  unint64_t v7 = -[UIKeyboardLayoutCursor variantCountForKey:](self, "variantCountForKey:");
  if (v7)
  {
    unint64_t v8 = v7;
    if (![v14 variantType])
    {
      if (v5 - 1 >= 2)
      {
        if (v5 != 4)
        {
          uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
          id v12 = v14;
LABEL_21:
          [(UIKeyboardLayoutCursor *)self setHighlightedVariantIndex:v13 key:v12];
          goto LABEL_22;
        }
        BOOL v9 = [(UIKeyboardLayoutCursor *)self isAppRightToLeft];
        uint64_t v11 = 0;
        uint64_t v10 = v8 - 1;
      }
      else
      {
        BOOL v9 = [(UIKeyboardLayoutCursor *)self isAppRightToLeft];
        uint64_t v10 = 0;
        uint64_t v11 = v8 - 1;
      }
      id v12 = v14;
      if (v9) {
        uint64_t v13 = v11;
      }
      else {
        uint64_t v13 = v10;
      }
      goto LABEL_21;
    }
  }
LABEL_22:
}

- (void)restoreFocusFromEntryPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v7 = [(UIKBTree *)self->super._keyplane keysExcludingEmptyKeys];
  int64_t v6 = [(UIKeyboardLayoutCursor *)self targetKeyIndexFromPoint:x inKeys:y];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    [(UIKeyboardLayoutCursor *)self selectInitialKeyIfNecessary];
  }
  else {
    [(UIKeyboardLayoutCursor *)self setSelectedKeyIndex:v6];
  }
}

- (BOOL)shouldDeactivateWithoutWindow
{
  return self->_selectedKeyIndex == 0x7FFFFFFFFFFFFFFFLL;
}

- (CGRect)selectionFrameForKeyIndex:(int64_t)a3
{
  __int16 v3 = [(NSArray *)self->_keyplaneKeys objectAtIndex:a3];
  int v4 = [v3 interactionType];
  [v3 paddedFrame];
  CGFloat MidX = v5;
  CGFloat MidY = v6;
  double v11 = v7;
  double v12 = v8;
  if (v4 == 10)
  {
    CGFloat MidX = CGRectGetMidX(*(CGRect *)&v5);
    [v3 paddedFrame];
    CGFloat MidY = CGRectGetMidY(v17);
    double v11 = 0.0;
    double v12 = 0.0;
  }

  double v13 = MidX;
  double v14 = MidY;
  double v15 = v11;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (void)deactivateKey:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    [v4 setSelectedVariantIndex:0x7FFFFFFFFFFFFFFFLL];
    uint64_t v5 = [(UIKeyboardLayoutCursor *)self enabledStateForKey:v8];
    [(UIKeyboardLayoutStar *)self setState:v5 forKey:v8];
    id v4 = v8;
    if (v5 == 16)
    {
      double v6 = [v8 subtrees];
      uint64_t v7 = [v6 count];

      id v4 = v8;
      if (!v7)
      {
        [(UIKeyboardLayoutCursor *)self refreshSelectedCellIfNecessaryForKey:v8];
        id v4 = v8;
      }
    }
  }
}

- (void)setSelectedKeyIndex:(int64_t)a3
{
  if (![(UIKeyboardLayoutCursor *)self suppressOperations] && self->_selectedKeyIndex != a3)
  {
    if ((unint64_t)a3 >= 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v5 = a3;
    }
    if ((unint64_t)a3 > 0x7FFFFFFFFFFFFFFELL || v5 >= [(NSArray *)self->_keyplaneKeys count])
    {
      id v18 = [(UIKeyboardLayoutCursor *)self currentKey];
      self->_int64_t selectedKeyIndex = 0x7FFFFFFFFFFFFFFFLL;
      [(UIKeyboardLayoutCursor *)self deactivateKey:v18];
      [(UIKeyboardLayoutStar *)self setKeyboardDim:0];
    }
    else
    {
      int64_t selectedKeyIndex = self->_selectedKeyIndex;
      if ([(UIKBScreenTraits *)self->super.super._screenTraits idiom] == 3
        && ([(UIKBScreenTraits *)self->super.super._screenTraits knobInput]
         || [(UIKBScreenTraits *)self->super.super._screenTraits touchpadInput])
        || [(UIKBScreenTraits *)self->super.super._screenTraits idiom] == 2)
      {
        uint64_t v7 = [(UIKeyboardLayoutCursor *)self currentKey];
        [(UIKeyboardLayoutCursor *)self setLastSelectedKeyIndex:self->_selectedKeyIndex];
        self->_int64_t selectedKeyIndex = v5;
        id v8 = [(NSArray *)self->_keyplaneKeys objectAtIndex:v5];
        if (v7 != v8)
        {
          [(UIKeyboardLayoutCursor *)self deactivateKey:v7];
          BOOL v9 = [(UIKeyboardLayoutStar *)self activeKey];

          if (v9 == v7) {
            [(UIKeyboardLayoutStar *)self setActiveKey:0];
          }
        }
        if (![v8 visible] || objc_msgSend(v8, "state") == 1) {
          goto LABEL_17;
        }
        uint64_t v15 = [(UIKeyboardLayoutCursor *)self activeStateForKey:v8];
        if (v7 != v8) {
          [(UIKeyboardLayoutStar *)self setState:v15 forKey:v8];
        }
        if (v15 == 16)
        {
          double v16 = [v8 subtrees];
          uint64_t v17 = [v16 count];

          if (!v17
            && ![(UIKeyboardLayoutCursor *)self refreshSelectedCellIfNecessaryForKey:v8])
          {
LABEL_17:
            [(UIKeyboardLayoutCursor *)self setSelectedKeyIndex:selectedKeyIndex];
          }
        }
        uint64_t v10 = [(UIKeyboardLayoutCursor *)self currentKey];

        if (v10) {
          [(UIKeyboardLayoutStar *)self setKeyboardDim:0];
        }
      }
      else
      {
        if (!self->_selectionView)
        {
          double v11 = [UIKBCursorSelection alloc];
          double v12 = [(UIResponder *)self _responderSelectionImage];
          double v13 = [(UIImageView *)v11 initWithImage:v12];
          selectionView = self->_selectionView;
          self->_selectionView = v13;

          [(UIView *)self addSubview:self->_selectionView];
        }
        self->_int64_t selectedKeyIndex = v5;
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        void v19[2] = __46__UIKeyboardLayoutCursor_setSelectedKeyIndex___block_invoke;
        v19[3] = &unk_1E52D9F70;
        void v19[4] = self;
        +[UIView animateWithDuration:v19 animations:0.3];
      }
      self->_selectInitialKedouble y = 0;
      self->_keyplaneSwitchSelectedKeyFrameCenter = (CGPoint)*MEMORY[0x1E4F1DAD8];
    }
  }
}

uint64_t __46__UIKeyboardLayoutCursor_setSelectedKeyIndex___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) selectionFrameForKeyIndex:*(void *)(*(void *)(a1 + 32) + 1560)];
  unint64_t v2 = *(void **)(*(void *)(a1 + 32) + 1544);
  return objc_msgSend(v2, "setFrame:");
}

- (BOOL)refreshSelectedCellIfNecessaryForKey:(id)a3
{
  return [(UIKeyboardLayoutCursor *)self refreshSelectedCellIfNecessaryForKey:a3 animated:1];
}

- (BOOL)refreshSelectedCellIfNecessaryForKey:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(UIKeyboardLayoutCursor *)self suppressOperations])
  {
    BOOL v7 = 0;
  }
  else
  {
    id v8 = [(UIKBKeyplaneView *)self->super._keyplaneView viewForKey:v6];
    uint64_t v9 = [v8 focusableVariantCount];
    BOOL v7 = v9 != 0;
    if (v9)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = [(UIKeyboardLayoutCursor *)self currentKey];
        if (v10 == v6)
        {
          uint64_t v12 = [v6 selectedVariantIndex];

          if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
            [v6 setSelectedVariantIndex:0];
          }
        }
        else
        {
        }
        [v8 refreshSelectedRecent];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = [(UIKeyboardLayoutCursor *)self currentKey];
          if (v11 == v6)
          {
            uint64_t v13 = [v6 selectedVariantIndex];

            if (v13 == 0x7FFFFFFFFFFFFFFFLL) {
              [v6 setSelectedVariantIndex:0];
            }
          }
          else
          {
          }
          [v8 refreshSelectedCandidateAnimated:v4];
        }
      }
    }
  }
  return v7;
}

- (void)setHighlightedVariantIndex:(int64_t)a3 key:(id)a4
{
  id v7 = a4;
  if (![(UIKeyboardLayoutCursor *)self suppressOperations])
  {
    uint64_t v6 = [v7 selectedVariantIndex];
    [v7 setSelectedVariantIndex:a3];
    if (v6 != a3)
    {
      [(UIKeyboardLayoutStar *)self setState:16 forKey:v7];
      [(UIKeyboardLayoutCursor *)self refreshSelectedCellIfNecessaryForKey:v7];
    }
  }
}

- (int64_t)targetKeyIndexFromPoint:(CGPoint)a3
{
  return -[UIKeyboardLayoutCursor targetKeyIndexFromPoint:inKeys:](self, "targetKeyIndexFromPoint:inKeys:", self->_keyplaneKeys, a3.x, a3.y);
}

- (int64_t)targetKeyIndexFromPoint:(CGPoint)a3 inKeys:(id)a4
{
  keyplaneKeys = self->_keyplaneKeys;
  unint64_t v5 = -[UIKeyboardLayoutStar keyHitTestClosestToPoint:inKeys:](self, "keyHitTestClosestToPoint:inKeys:", a4, a3.x, a3.y);
  int64_t v6 = [(NSArray *)keyplaneKeys indexOfObject:v5];

  return v6;
}

- (int64_t)targetKeyIndexAtOffset:(CGPoint)a3 fromKey:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  id v8 = v7;
  double v9 = fabs(y);
  if (fabs(x) >= 2.22044605e-16 || v9 >= 2.22044605e-16)
  {
    id v11 = v7;
    [v11 navigationPointOfKey];
    double v13 = x + v12;
    double v15 = y + v14;
    [v11 frame];
    v37.double x = v13;
    v37.double y = v15;
    BOOL v16 = CGRectContainsPoint(v38, v37);
    double v17 = -0.0;
    if (v16) {
      double v18 = y;
    }
    else {
      double v18 = -0.0;
    }
    double v19 = v15 + v18;
    if (v16) {
      double v17 = x;
    }
    double v20 = v13 + v17;
    -[UIKeyboardLayoutStar keyHitTest:](self, "keyHitTest:", v20, v19);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    int v22 = [v21 interactionType];
    int v23 = [v21 interactionType];
    BOOL v25 = v22 == 4 || v23 == 15;
    if (v21 == v11 && v25)
    {
      int v27 = v23;
      if ([(UIKeyboardLayoutCursor *)self isKeyboardRightToLeft]) {
        BOOL v28 = x > 0.0;
      }
      else {
        BOOL v28 = x < 0.0;
      }
      if ([(UIKeyboardLayoutCursor *)self isKeyboardRightToLeft]) {
        BOOL v29 = x < 0.0;
      }
      else {
        BOOL v29 = x > 0.0;
      }
      if (v22 != 4) {
        BOOL v29 = 0;
      }
      BOOL v30 = v27 == 15 && v28;
      LOBYTE(v25) = v29 || v30;
    }
    if ([(UIKBScreenTraits *)self->super.super._screenTraits knobInput])
    {
      if (!v25) {
        [(UIKBScreenTraits *)self->super.super._screenTraits touchInput];
      }
LABEL_40:
      id v33 = v11;

      int v34 = 5;
      id v21 = v33;
      while (1)
      {
        uint64_t v35 = v21;
        [v33 frame];
        id v21 = [(UIKeyboardLayoutCursor *)self keyHitTestInSameRowAsCenter:v20 size:v19];

        if (v21)
        {
          if (v21 != v33) {
            goto LABEL_46;
          }
        }
        double v20 = x + v20;
        double v19 = y + v19;
        if (!--v34) {
          goto LABEL_44;
        }
      }
    }
    BOOL v32 = [(UIKBScreenTraits *)self->super.super._screenTraits touchpadInput];
    if (v25)
    {
      if (v32) {
        goto LABEL_40;
      }
    }
    else if ([(UIKBScreenTraits *)self->super.super._screenTraits touchInput] || v32)
    {
      goto LABEL_40;
    }
LABEL_44:
    if (!v21) {
      id v21 = v11;
    }
LABEL_46:
    int64_t v31 = [(NSArray *)self->_keyplaneKeys indexOfObject:v21];

    goto LABEL_47;
  }
  int64_t v31 = -[NSArray indexOfObject:](self->_keyplaneKeys, "indexOfObject:", v7, 2.22044605e-16, v9);
LABEL_47:

  return v31;
}

- (id)keyHitTestInSameRowAsCenter:(CGPoint)a3 size:(CGSize)a4
{
  double height = a4.height;
  double y = a3.y;
  CGFloat x = a3.x;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  [(UIView *)self bounds];
  CGFloat v9 = v8;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v10 = self->_keyplaneKeys;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    id v13 = 0;
    uint64_t v14 = *(void *)v28;
    float v15 = 3.4028e38;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(v10);
        }
        double v17 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if (-[UIKeyboardLayoutStar shouldHitTestKey:](self, "shouldHitTestKey:", v17, (void)v27))
        {
          [v17 frame];
          v35.origin.CGFloat x = 0.0;
          v35.origin.double y = y + height * -0.5;
          v35.size.width = v9;
          v35.size.double height = height;
          if (CGRectIntersectsRect(v34, v35))
          {
            [v17 frame];
            UIDistanceBetweenPointAndRect(x, y, v18, v19, v20, v21);
            float v23 = v22;
            if (fabsf(v23) < 2.2204e-16)
            {
              id v25 = v17;

              goto LABEL_17;
            }
            if (v15 > v23)
            {
              id v24 = v17;

              id v13 = v24;
              float v15 = v23;
            }
          }
        }
      }
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v13 = 0;
  }

  id v13 = v13;
  id v25 = v13;
LABEL_17:

  return v25;
}

- (BOOL)canHandleEvent:(id)a3
{
  return [(UIKeyboardLayoutCursor *)self canHandlePresses:0 withEvent:a3];
}

- (BOOL)canHandlePresses:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  CGFloat v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  if ([(UIKeyboardLayout *)self idiom] == 3)
  {
    if ([v7 type])
    {
      v16.receiver = self;
      v16.super_class = (Class)UIKeyboardLayoutCursor;
      unsigned int v8 = [(UIKeyboardLayout *)&v16 canHandleEvent:v7];
    }
    else
    {
      unsigned int v8 = [(UIKBScreenTraits *)self->super.super._screenTraits touchInput];
    }
    *((unsigned char *)v18 + 24) = v8;
    if (!v8) {
      goto LABEL_8;
    }
  }
  else if (!*((unsigned char *)v18 + 24))
  {
LABEL_8:
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __53__UIKeyboardLayoutCursor_canHandlePresses_withEvent___block_invoke;
    v11[3] = &unk_1E52FA448;
    float v15 = &v17;
    id v12 = v7;
    id v13 = self;
    id v14 = v6;
    [(UIKeyboardLayoutCursor *)self runWithSuppressedActions:v11];
    BOOL v9 = *((unsigned char *)v18 + 24) != 0;

    goto LABEL_9;
  }
  BOOL v9 = 1;
LABEL_9:
  _Block_object_dispose(&v17, 8);

  return v9;
}

uint64_t __53__UIKeyboardLayoutCursor_canHandlePresses_withEvent___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) type];
  switch(result)
  {
    case 2:
      uint64_t result = [*(id *)(a1 + 40) _handleRemoteControlReceivedWithEvent:*(void *)(a1 + 32)];
      goto LABEL_7;
    case 3:
      uint64_t result = [*(id *)(a1 + 40) _handlePresses:*(void *)(a1 + 48) withEvent:*(void *)(a1 + 32)];
      goto LABEL_7;
    case 5:
      uint64_t result = [*(id *)(a1 + 40) _handleMoveWithEvent:*(void *)(a1 + 32)];
      goto LABEL_7;
    case 7:
      uint64_t result = [*(id *)(a1 + 40) _handleWheelChangedWithEvent:*(void *)(a1 + 32)];
LABEL_7:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
      break;
    default:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
      break;
  }
  return result;
}

- (void)takeKeyAction:(id)a3
{
  BOOL v4 = (UIKBTree *)a3;
  if (![(UIKeyboardLayoutCursor *)self suppressOperations])
  {
    multitapKedouble y = self->super._multitapKey;
    if (multitapKey) {
      BOOL v6 = multitapKey == v4;
    }
    else {
      BOOL v6 = 1;
    }
    if (!v6) {
      [(UIKeyboardLayoutStar *)self multitapExpired];
    }
    id v7 = +[UIKeyboardImpl activeInstance];
    if ([(UIKBTree *)v4 interactionType] == 4)
    {
      unsigned int v8 = [(UIKeyboardLayoutStar *)self createKeyEventForStringAction:@"\b" forKey:v4 inputFlags:0];
      [v7 handleKeyEvent:v8];

      goto LABEL_14;
    }
    if ([(UIKBTree *)v4 interactionType] == 23)
    {
      [v7 handleClear];
      goto LABEL_14;
    }
    if ([(UIKBTree *)v4 interactionType] == 11)
    {
      BOOL v9 = [(UIKBTree *)self->super._keyplane alternateKeyplaneName];
      [(UIKeyboardLayoutCursor *)self setKeyplaneName:v9];
      goto LABEL_13;
    }
    if ([(UIKBTree *)v4 interactionType] == 10)
    {
      if ([(UIKeyboardLayoutCursor *)self isSlimLinearKeyboardTV])
      {
        [(UIKeyboardLayoutCursor *)self setOverrideInitialKey:1];
        self->_selectInitialKedouble y = 0;
        self->_overridenSelectedKeyType = 10;
      }
      id v10 = [(UIKBTree *)v4 representedString];
      uint64_t v11 = [v10 rangeOfString:@"Recents"];

      if (v11 != 0x7FFFFFFFFFFFFFFFLL)
      {
        [(UIKeyboardLayoutCursor *)self showRecentInputsAlert];
        goto LABEL_14;
      }
      id v12 = [(UIKBTree *)v4 representedString];
      uint64_t v13 = [v12 rangeOfString:@"Dictation"];

      if (v13 != 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_14:

        goto LABEL_15;
      }
      id v14 = v4;
      int64_t v15 = [(UIKeyboardLayoutCursor *)self variantCountForKey:v14];
      uint64_t v16 = [(UIKBTree *)v14 selectedVariantIndex];
      BOOL v9 = v14;
      if ([(UIKBTree *)v14 state] == 16)
      {
        BOOL v9 = v14;
        if (v16 != 0x7FFFFFFFFFFFFFFFLL)
        {
          BOOL v9 = v14;
          if (v16 < v15)
          {
            uint64_t v17 = [(UIKBTree *)v14 subtrees];
            BOOL v9 = [v17 objectAtIndexedSubscript:v16];
          }
        }
      }
      CGFloat v18 = [v9 representedString];
      [(UIKeyboardLayoutCursor *)self clearVariantStateForKey:v14];
      [(UIKBTree *)v14 setSelectedVariantIndex:0];
      uint64_t v19 = [(UIKBTree *)self->super._keyboard subtreeWithName:v18];
      if (v19 != self->super._keyplane) {
        [(UIKeyboardLayoutCursor *)self setKeyplaneName:v18];
      }

LABEL_13:
      goto LABEL_14;
    }
    if ([(UIKBTree *)v4 interactionType] == 9)
    {
      char v20 = +[UIKeyboardInputModeController sharedInputModeController];
      CGFloat v21 = [(UIKBTree *)v4 representedString];
      int v22 = [v20 identifierIsValidSystemInputMode:v21];

      if (v22)
      {
        if (qword_1EB25C510 != -1) {
          dispatch_once(&qword_1EB25C510, &__block_literal_global_190);
        }
        float v23 = [v7 taskQueue];
        v61[0] = MEMORY[0x1E4F143A8];
        v61[1] = 3221225472;
        v61[2] = __40__UIKeyboardLayoutCursor_takeKeyAction___block_invoke_3;
        v61[3] = &unk_1E52E3628;
        id v62 = v7;
        uint64_t v63 = v4;
        [v23 addTask:v61 breadcrumb:qword_1EB25C508];

        id v24 = v62;
      }
      else
      {
        if (qword_1EB25C520 != -1) {
          dispatch_once(&qword_1EB25C520, &__block_literal_global_198);
        }
        long long v29 = [v7 taskQueue];
        v59[0] = MEMORY[0x1E4F143A8];
        v59[1] = 3221225472;
        v59[2] = __40__UIKeyboardLayoutCursor_takeKeyAction___block_invoke_6;
        v59[3] = &unk_1E52E34C8;
        id v60 = v7;
        [v29 addTask:v59 breadcrumb:qword_1EB25C518];

        id v24 = v60;
      }

      goto LABEL_14;
    }
    if ([(UIKBTree *)v4 interactionType] == 3)
    {
      unint64_t v25 = [(UIKBTree *)v4 selectedVariantIndex];
      unint64_t v26 = [(UIKeyboardLayoutCursor *)self variantCountForKey:v4];
      if ([(UIKBTree *)v4 state] == 16 && v25 != 0x7FFFFFFFFFFFFFFFLL && v25 < v26)
      {
        long long v27 = [(UIKBKeyplaneView *)self->super._keyplaneView viewForKey:v4];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v28 = [v27 selectedRecentInputString];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v45 = +[UIKeyboardImpl activeInstance];
            BOOL v46 = [v45 candidateController];

            if ([v46 currentIndex] != 0x7FFFFFFFFFFFFFFFLL)
            {
              [v46 acceptSelectedCandidate];
              [(UIKeyboardLayoutCursor *)self handleVisualDirectionalInput:2];
              BOOL v47 = +[UIKBKeyplaneChangeContext keyplaneChangeContext];
              [(UIKeyboardLayoutStar *)self _didChangeKeyplaneWithContext:v47];
            }
          }
          long long v28 = 0;
        }
        if ([v28 isEqualToString:0x1ED13F800])
        {
          [v7 clearRecentInput];
          [(UIKeyboardLayoutCursor *)self setRecentInputs:0];
          [(UIKeyboardLayoutStar *)self setToInitialKeyplane];
        }
        else if (v28)
        {
          [v7 handleClear];
          CGRect v50 = [(UIKeyboardLayoutStar *)self createKeyEventForStringAction:v28 forKey:v4 inputFlags:2];
          [v7 handleKeyEvent:v50];
        }
      }
      goto LABEL_14;
    }
    if ([(UIKBTree *)v4 interactionType] != 16)
    {
      BOOL v9 = [(UIKBTree *)v4 representedString];
      unint64_t v38 = [(UIKBTree *)v4 selectedVariantIndex];
      unint64_t v39 = [(UIKeyboardLayoutCursor *)self variantCountForKey:v4];
      uint64_t v40 = 0;
      if ([(UIKBTree *)v4 state] == 16 && v38 != 0x7FFFFFFFFFFFFFFFLL && v38 < v39)
      {
        double v41 = [(UIKBTree *)v4 subtrees];
        int v42 = [v41 objectAtIndex:v38];

        uint64_t v43 = [v42 representedString];

        [(UIKeyboardLayoutCursor *)self clearVariantStateForKey:v4];
        uint64_t v40 = 2;
        BOOL v9 = (void *)v43;
      }
      if ([v9 length])
      {
        unint64_t v44 = [(UIKeyboardLayoutStar *)self createKeyEventForStringAction:v9 forKey:v4 inputFlags:v40];
        [v7 handleKeyEvent:v44];
      }
      goto LABEL_13;
    }
    BOOL v9 = [(UIKBTree *)v4 fullRepresentedString];
    long long v30 = [(UIKBTree *)v4 representedString];
    unint64_t v31 = [(UIKBTree *)v4 selectedVariantIndex];
    unint64_t v32 = [(UIKeyboardLayoutCursor *)self variantCountForKey:v4];
    if ([(UIKBTree *)v4 state] != 16 || v31 == 0x7FFFFFFFFFFFFFFFLL || v31 >= v32)
    {
      if (![(UIKBTree *)v4 forceMultitap])
      {
        unint64_t v51 = [v30 length];
        if (v51 >= [v9 length] || !-[UIKeyboardLayoutCursor canMultitap](self, "canMultitap"))
        {
          int v37 = 0;
          int v36 = 0;
LABEL_74:
          if ([v30 length])
          {
            uint64_t v58 = [(UIKeyboardLayoutStar *)self createKeyEventForStringAction:v30 forKey:v4 inputFlags:v36 | v37];
            [v7 handleKeyEvent:v58];
          }
          goto LABEL_13;
        }
      }
      if (self->super._multitapKey == v4)
      {
        v52 = [(UIKBTree *)v4 fullRepresentedString];
        [v52 rangeOfComposedCharacterSequenceAtIndex:self->super._multitapCount];
        uint64_t v54 = v53;

        unint64_t v55 = v54 + self->super._multitapCount;
        CGRect v49 = [(UIKBTree *)self->super._multitapKey fullRepresentedString];
        self->super._multitapCount = v55 % [v49 length];
        int v36 = 4;
      }
      else
      {
        self->super._multitapCount = 0;
        int v48 = v4;
        int v36 = 0;
        CGRect v49 = self->super._multitapKey;
        self->super._multitapKedouble y = v48;
      }

      [(UIKeyboardLayoutStar *)self touchMultitapTimer];
      uint64_t v56 = [v9 rangeOfComposedCharacterSequenceAtIndex:self->super._multitapCount];
      uint64_t v35 = objc_msgSend(v9, "substringWithRange:", v56, v57);
      int v37 = 0;
    }
    else
    {
      id v33 = [(UIKBTree *)v4 subtrees];
      CGRect v34 = [v33 objectAtIndex:v31];

      uint64_t v35 = [v34 representedString];

      [(UIKeyboardLayoutCursor *)self clearVariantStateForKey:v4];
      int v36 = 0;
      int v37 = 2;
      long long v30 = v34;
    }

    long long v30 = (void *)v35;
    goto LABEL_74;
  }
LABEL_15:
}

void __40__UIKeyboardLayoutCursor_takeKeyAction___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_193 copy];
  v1 = (void *)qword_1EB25C508;
  qword_1EB25C508 = v0;
}

uint64_t __40__UIKeyboardLayoutCursor_takeKeyAction___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __40__UIKeyboardLayoutCursor_takeKeyAction___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = +[UIKeyboardInputModeController sharedInputModeController];
  unint64_t v5 = +[UIKeyboardInputModeController sharedInputModeController];
  BOOL v6 = [v5 currentInputMode];
  [v4 updateLastUsedInputMode:v6];

  id v7 = *(void **)(a1 + 32);
  unsigned int v8 = [*(id *)(a1 + 40) representedString];
  [v7 setInputMode:v8 userInitiated:1 updateIndicator:0 executionContext:v3];

  id v11 = +[UIKeyboardInputModeController sharedInputModeController];
  BOOL v9 = +[UIKeyboardInputModeController sharedInputModeController];
  id v10 = [v9 currentInputMode];
  [v11 updateLastUsedInputMode:v10];
}

void __40__UIKeyboardLayoutCursor_takeKeyAction___block_invoke_4()
{
  uint64_t v0 = [&__block_literal_global_200_2 copy];
  v1 = (void *)qword_1EB25C518;
  qword_1EB25C518 = v0;
}

uint64_t __40__UIKeyboardLayoutCursor_takeKeyAction___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __40__UIKeyboardLayoutCursor_takeKeyAction___block_invoke_6(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setInputModeToNextInPreferredListWithExecutionContext:a2];
}

- (void)clearVariantStateForKey:(id)a3
{
  id v5 = a3;
  if (![(UIKeyboardLayoutCursor *)self suppressOperations])
  {
    [(UIKeyboardLayoutStar *)self setState:[(UIKeyboardLayoutCursor *)self activeStateForKey:v5] forKey:v5];
    [(UIKeyboardLayoutStar *)self setKeyboardDim:0];
    BOOL v4 = +[UIKBKeyplaneChangeContext keyplaneChangeContext];
    [(UIKeyboardLayoutStar *)self _didChangeKeyplaneWithContext:v4];
  }
}

- (void)handleVariantDeleteIfNecessaryForKey:(id)a3
{
  id v4 = a3;
  if ([v4 variantType])
  {
    id v5 = [v4 subtrees];
    BOOL v6 = objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v4, "highlightedVariantIndex"));

    if ([v6 interactionType] == 4 && !self->_didVariantDelete)
    {
      self->_didVariantDelete = 1;
      id v7 = +[UIKeyboardImpl activeInstance];
      [v7 handleDelete];

      unsigned int v8 = +[UIDevice currentDevice];
      [v8 _playInputDeleteSound];

      +[_UIKeyboardUsageTracking variantDeleteIncrement];
      dispatch_time_t v9 = dispatch_time(0, 200000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __63__UIKeyboardLayoutCursor_handleVariantDeleteIfNecessaryForKey___block_invoke;
      block[3] = &unk_1E52D9F98;
      block[4] = self;
      id v14 = v4;
      id v10 = MEMORY[0x1E4F14428];
      dispatch_after(v9, MEMORY[0x1E4F14428], block);
      dispatch_time_t v11 = dispatch_time(0, 500000000);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __63__UIKeyboardLayoutCursor_handleVariantDeleteIfNecessaryForKey___block_invoke_2;
      v12[3] = &unk_1E52D9F70;
      v12[4] = self;
      dispatch_after(v11, v10, v12);
    }
  }
}

void __63__UIKeyboardLayoutCursor_handleVariantDeleteIfNecessaryForKey___block_invoke(uint64_t a1)
{
  unint64_t v2 = *(unsigned char **)(a1 + 32);
  if (!v2[1616]) {
    return;
  }
  id v3 = *(void **)(a1 + 40);
  id v4 = [v2 currentKey];
  if (v3 != v4) {
    goto LABEL_3;
  }
  int v5 = [*(id *)(a1 + 40) state];

  if (v5 != 16) {
    return;
  }
  [*(id *)(a1 + 32) handleLinearDirectionalInput:4];
  BOOL v6 = +[UIKeyboardImpl activeInstance];
  char v7 = [v6 canHandleDelete];

  unsigned int v8 = *(void **)(a1 + 32);
  if (v7)
  {
    uint64_t v11 = +[UIKBKeyplaneChangeContext keyplaneChangeContext];
    [v8 _didChangeKeyplaneWithContext:v11];
    id v4 = (void *)v11;
LABEL_3:

    return;
  }
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = *(void **)(a1 + 32);
  [v10 clearVariantStateForKey:v9];
}

uint64_t __63__UIKeyboardLayoutCursor_handleVariantDeleteIfNecessaryForKey___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 1616) = 0;
  return result;
}

- (BOOL)handleLinearDirectionalInput:(int)a3
{
  if (!self->_ignoreEventsUntilPressEnds)
  {
    BOOL v6 = [(UIKeyboardLayoutCursor *)self currentKey];
    unint64_t v7 = [(UIKeyboardLayoutCursor *)self variantCountForKey:v6];
    uint64_t v8 = [v6 selectedVariantIndex];
    int64_t selectedKeyIndex = self->_selectedKeyIndex;
    NSUInteger v10 = [(NSArray *)self->_keyplaneKeys count];
    if (a3 == 5)
    {
      [(UIKeyboardLayoutCursor *)self takeKeyAction:v6];
      BOOL v3 = self->_selectedKeyIndex != 0x7FFFFFFFFFFFFFFFLL;
LABEL_56:

      return v3;
    }
    NSUInteger v11 = v10 - 1;
    if (a3 == 4)
    {
      if ([v6 state] != 16 || v8 == 0x7FFFFFFFFFFFFFFFLL || v8 >= v7 - 1)
      {
        if (self->_selectedKeyIndex != 0x7FFFFFFFFFFFFFFFLL)
        {
          if ([(UIKeyboardLayoutCursor *)self isAppRightToLeft])
          {
            if (selectedKeyIndex <= 0) {
              goto LABEL_55;
            }
          }
          else if (selectedKeyIndex >= v11)
          {
            goto LABEL_55;
          }
          if ([v6 state] == 16) {
            [(UIKeyboardLayoutStar *)self setKeyboardDim:0];
          }
          uint64_t v13 = 0;
          while (1)
          {
            uint64_t v19 = v13;
            if ([(UIKeyboardLayoutCursor *)self isAppRightToLeft]) {
              --selectedKeyIndex;
            }
            else {
              ++selectedKeyIndex;
            }
            uint64_t v13 = [(NSArray *)self->_keyplaneKeys objectAtIndex:selectedKeyIndex];

            if (!v13) {
              goto LABEL_54;
            }
            char v20 = [v13 visible];
            if (selectedKeyIndex < 1
              || (v20 & 1) != 0
              || selectedKeyIndex >= [(NSArray *)self->_keyplaneKeys count] - 1)
            {
              if (![v13 visible]) {
                goto LABEL_54;
              }
              CGFloat v18 = self;
              uint64_t v17 = 0;
LABEL_53:
              [(UIKeyboardLayoutCursor *)v18 setHighlightedVariantIndex:v17 key:v13];
              [(UIKeyboardLayoutCursor *)self setSelectedKeyIndex:selectedKeyIndex];

              goto LABEL_19;
            }
          }
        }
LABEL_55:
        BOOL v3 = 0;
        goto LABEL_56;
      }
      uint64_t v12 = v8 + 1;
    }
    else
    {
      if (a3 != 3) {
        goto LABEL_55;
      }
      if ([v6 state] != 16 || v8 == 0x7FFFFFFFFFFFFFFFLL || (uint64_t v12 = v8 - 1, v8 < 1))
      {
        if (self->_selectedKeyIndex != 0x7FFFFFFFFFFFFFFFLL)
        {
          if ([(UIKeyboardLayoutCursor *)self isAppRightToLeft])
          {
            if (selectedKeyIndex >= v11) {
              goto LABEL_55;
            }
            goto LABEL_25;
          }
          if (selectedKeyIndex >= 1)
          {
LABEL_25:
            if ([v6 state] == 16) {
              [(UIKeyboardLayoutStar *)self setKeyboardDim:0];
            }
            uint64_t v13 = 0;
            while (1)
            {
              id v14 = v13;
              if ([(UIKeyboardLayoutCursor *)self isAppRightToLeft]) {
                ++selectedKeyIndex;
              }
              else {
                --selectedKeyIndex;
              }
              uint64_t v13 = [(NSArray *)self->_keyplaneKeys objectAtIndex:selectedKeyIndex];

              if (!v13) {
                break;
              }
              char v15 = [v13 visible];
              if (selectedKeyIndex < 1
                || (v15 & 1) != 0
                || selectedKeyIndex >= [(NSArray *)self->_keyplaneKeys count] - 1)
              {
                if (![v13 visible]) {
                  break;
                }
                unint64_t v16 = [(UIKeyboardLayoutCursor *)self variantCountForKey:v13];
                if (v16) {
                  uint64_t v17 = v16 - 1;
                }
                else {
                  uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
                }
                CGFloat v18 = self;
                goto LABEL_53;
              }
            }
LABEL_54:

            goto LABEL_55;
          }
        }
        goto LABEL_55;
      }
    }
    [(UIKeyboardLayoutCursor *)self setHighlightedVariantIndex:v12 key:v6];
    [(UIKeyboardLayoutCursor *)self handleVariantDeleteIfNecessaryForKey:v6];
LABEL_19:
    BOOL v3 = 1;
    goto LABEL_56;
  }
  return 1;
}

- (BOOL)handleVisualDirectionalInput:(int)a3
{
  if (!self->_ignoreEventsUntilPressEnds)
  {
    self->_didVariantDelete = 0;
    BOOL v6 = [(UIKeyboardLayoutCursor *)self currentKey];
    unint64_t v7 = v6;
    if (v6)
    {
      [v6 frame];
      double v9 = v8;
    }
    else
    {
      [(UIKeyboardLayoutCursor *)self defaultCursorAdjustDistance];
      double v9 = v10;
    }
    [(UIKeyboardLayoutCursor *)self defaultCursorAdjustDistance];
    if (v9 > v11)
    {
      [(UIKeyboardLayoutCursor *)self defaultCursorAdjustDistance];
      double v9 = v12;
    }
    if (v7)
    {
      [v7 frame];
      double v14 = v13;
    }
    else
    {
      [(UIKeyboardLayoutCursor *)self defaultCursorAdjustDistance];
      double v14 = v15;
    }
    unint64_t v16 = [(UIKBTree *)self->super._keyboard subtrees];
    uint64_t v17 = [v16 indexOfObject:self->super._keyplane];

    uint64_t v18 = [v7 selectedVariantIndex];
    uint64_t v19 = [(UIKeyboardLayoutCursor *)self variantCountForKey:v7];
    char v20 = [v7 subtrees];
    uint64_t v21 = [v20 count];

    int64_t selectedKeyIndex = self->_selectedKeyIndex;
    uint64_t v54 = v18;
    if ([v7 state] == 16)
    {
      float v23 = [(UIKBTree *)self->super._keyplane firstCachedKeyWithName:@"Monolith-Recent-Inputs-Key"];
      BOOL v24 = v7 != v23;
    }
    else
    {
      BOOL v24 = 1;
    }
    switch(a3)
    {
      case 1:
        if ([v7 state] != 16) {
          goto LABEL_57;
        }
        if (!v24 && self->_disableTouchInput)
        {
          if (v19 >= 1) {
            goto LABEL_71;
          }
          goto LABEL_57;
        }
        if (![v7 variantType] || v21 < 1 || v54 == 0x7FFFFFFFFFFFFFFFLL)
        {
LABEL_57:
          double v44 = -v14;
          v45 = self;
          goto LABEL_63;
        }
LABEL_61:
        [(UIKeyboardLayoutCursor *)self clearVariantStateForKey:v7];
        char v3 = 1;
        goto LABEL_81;
      case 2:
        if ([v7 state] != 16) {
          goto LABEL_62;
        }
        if (v24 || !self->_disableTouchInput)
        {
          if ([v7 variantType] && v21 >= 1 && v54 != 0x7FFFFFFFFFFFFFFFLL) {
            goto LABEL_61;
          }
        }
        else if (v19 >= 1)
        {
          goto LABEL_74;
        }
LABEL_62:
        v45 = self;
        double v44 = v14;
LABEL_63:
        uint64_t v46 = -[UIKeyboardLayoutCursor targetKeyIndexAtOffset:fromKey:](v45, "targetKeyIndexAtOffset:fromKey:", v7, 0.0, v44);
        int64_t selectedKeyIndex = 0x7FFFFFFFFFFFFFFFLL;
        if (v46 == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_80;
        }
        int64_t v43 = v46;
        [(UIKeyboardLayoutCursor *)self setSelectedKeyIndex:v46];
        BOOL v47 = [(UIKeyboardLayoutCursor *)self currentKey];
        if ([v47 displayType] == 38)
        {
          unint64_t v48 = [(UIKeyboardLayoutCursor *)self variantCountForKey:v47];
          if (v48)
          {
            unint64_t v49 = v48;
            if ([(UIKeyboardLayoutCursor *)self isAppRightToLeft]) {
              uint64_t v50 = v49 - 1;
            }
            else {
              uint64_t v50 = 0;
            }
          }
          else
          {
            uint64_t v50 = 0x7FFFFFFFFFFFFFFFLL;
          }
          [(UIKeyboardLayoutCursor *)self setHighlightedVariantIndex:v50 key:v47];
        }

        goto LABEL_79;
      case 3:
        if ([v7 state] != 16)
        {
          double v40 = -v9;
          double v41 = self;
          goto LABEL_52;
        }
        if (v24)
        {
          char v3 = 1;
          if (v19 < 1 || v54 < 1)
          {
LABEL_81:

            return v3;
          }
        }
        else
        {
          char v3 = 0;
          if (self->_disableTouchInput || v19 < 1) {
            goto LABEL_81;
          }
        }
LABEL_71:
        unint64_t v51 = self;
        uint64_t v52 = 3;
        goto LABEL_75;
      case 4:
        if ([v7 state] != 16)
        {
          double v41 = self;
          double v40 = v9;
LABEL_52:
          uint64_t v42 = -[UIKeyboardLayoutCursor targetKeyIndexAtOffset:fromKey:](v41, "targetKeyIndexAtOffset:fromKey:", v7, v40, 0.0);
          int64_t selectedKeyIndex = 0x7FFFFFFFFFFFFFFFLL;
          if (v42 != 0x7FFFFFFFFFFFFFFFLL)
          {
            int64_t v43 = v42;
            [(UIKeyboardLayoutCursor *)self setSelectedKeyIndex:v42];
LABEL_79:
            int64_t selectedKeyIndex = v43;
          }
          goto LABEL_80;
        }
        if (v24)
        {
          char v3 = 1;
          if (v19 < 1 || v54 >= v19 - 1) {
            goto LABEL_81;
          }
        }
        else
        {
          char v3 = 0;
          if (self->_disableTouchInput || v19 < 1) {
            goto LABEL_81;
          }
        }
LABEL_74:
        unint64_t v51 = self;
        uint64_t v52 = 4;
LABEL_75:
        char v3 = [(UIKeyboardLayoutCursor *)v51 handleLinearDirectionalInput:v52];
        goto LABEL_81;
      case 5:
        [(UIView *)self->_selectionView alpha];
        if (v25 != 0.0 && [v7 interactionType] != 10) {
          [(UIKeyboardLayoutCursor *)self takeKeyAction:v7];
        }
        goto LABEL_80;
      case 6:
        unint64_t v26 = [(UIKBTree *)self->super._keyplane stringForProperty:@"shift-alternate"];

        if (v26)
        {
          keyboard = self->super._keyboard;
          long long v28 = [(UIKBTree *)self->super._keyplane stringForProperty:@"shift-alternate"];
          long long v29 = [(UIKBTree *)keyboard subtreeWithName:v28];

          if (v29)
          {
            long long v30 = [v29 name];
            [(UIKeyboardLayoutCursor *)self setKeyplaneName:v30];

            +[_UIKeyboardUsageTracking letterCaseToggleIncrement];
            goto LABEL_80;
          }
        }
        unint64_t v31 = 0;
        uint64_t v32 = 1;
        while (2)
        {
          id v33 = v31;
          CGRect v34 = [(UIKBTree *)self->super._keyboard subtrees];
          uint64_t v35 = [(UIKBTree *)self->super._keyboard subtrees];
          unint64_t v31 = objc_msgSend(v34, "objectAtIndex:", (v17 + v32) % (unint64_t)objc_msgSend(v35, "count"));

          if (!v32) {
            goto LABEL_47;
          }
          int v36 = [v31 name];
          if ([(UIKeyboardLayoutCursor *)self isKeyplaneDisabledWithName:v36])
          {
          }
          else
          {
            int v37 = [v31 name];
            BOOL v38 = [(UIKeyboardLayoutCursor *)self shouldToggleKeyplaneWithName:v37];

            if (v38)
            {
LABEL_47:
              if (v31)
              {
                unint64_t v39 = [v31 name];
                [(UIKeyboardLayoutCursor *)self setKeyplaneName:v39];
              }
LABEL_80:
              char v3 = selectedKeyIndex != 0x7FFFFFFFFFFFFFFFLL;
              goto LABEL_81;
            }
          }
          ++v32;
          continue;
        }
      default:
        goto LABEL_80;
    }
  }
  return 1;
}

- (unint64_t)getNextKeyplaneIndex:(unint64_t)a3
{
  if ([(UIKeyboardLayoutCursor *)self suppressOperations]) {
    return a3;
  }
  if (![(UIKeyboardLayoutCursor *)self shouldToggleLetterCaseNext]) {
    goto LABEL_7;
  }
  BOOL v6 = [(UIKBTree *)self->super._keyplane stringForProperty:@"shift-alternate"];

  if (!v6) {
    goto LABEL_7;
  }
  [(UIKeyboardLayoutCursor *)self setShouldToggleLetterCaseNext:0];
  keyboard = self->super._keyboard;
  double v8 = [(UIKBTree *)self->super._keyplane stringForProperty:@"shift-alternate"];
  double v9 = [(UIKBTree *)keyboard subtreeWithName:v8];

  if (!v9
    || (+[_UIKeyboardUsageTracking letterCaseToggleIncrement], unint64_t v5 = [(UIKBTree *)self->super._keyboard indexOfSubtree:v9], v9, v5 == a3))
  {
LABEL_7:
    double v10 = 0;
    unint64_t v5 = a3;
    while (1)
    {
      double v11 = v10;
      double v12 = [(UIKBTree *)self->super._keyboard subtrees];
      unint64_t v5 = (v5 + 1) % [v12 count];

      double v13 = [(UIKBTree *)self->super._keyboard subtrees];
      double v10 = [v13 objectAtIndex:v5];

      if (v5 == a3) {
        break;
      }
      double v14 = [v10 name];
      if ([(UIKeyboardLayoutCursor *)self isKeyplaneDisabledWithName:v14])
      {
      }
      else
      {
        double v15 = [v10 name];
        BOOL v16 = [(UIKeyboardLayoutCursor *)self shouldToggleKeyplaneWithName:v15];

        if (v16) {
          goto LABEL_14;
        }
      }
    }
    unint64_t v5 = a3;
LABEL_14:
  }
  return v5;
}

- (void)switchToDictationKeyplaneWithActivationIdentifier:(id)a3
{
  id v4 = a3;
  unint64_t v5 = +[UIDictationController sharedInstance];
  int v6 = [v5 dictationEnabled];

  if (v6)
  {
    unint64_t v7 = +[UIDictationController sharedInstance];
    [v7 setActivationIdentifier:v4];

    double v8 = [(UIKBTree *)self->super._keyplane name];
    [(UIKeyboardLayoutCursor *)self setKeyplaneBeforeDictation:v8];

    [(UIKeyboardLayoutCursor *)self setSelectedKeyBeforeDictation:self->_selectedKeyIndex];
    if (UIKeyboardTypeSupportsDictationSpelling([(UITextInputTraits *)self->super.super._inputTraits dictationKeyboardType])
      || [(UITextInputTraits *)self->super.super._inputTraits isSecureTextEntry])
    {
      int v9 = 0;
    }
    else
    {
      int v9 = ![(UITextInputTraits *)self->super.super._inputTraits forceSpellingDictation];
    }
    if (((byte_1E8FD5314 != 0) & ~_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference__UIATVClearBeforeDictation, @"_UIATVClearBeforeDictation")) != 0|| v9)
    {
      double v10 = +[UIKeyboardImpl activeInstance];
      [v10 handleClear];
    }
    void v11[4] = self;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __76__UIKeyboardLayoutCursor_switchToDictationKeyplaneWithActivationIdentifier___block_invoke;
    v12[3] = &unk_1E52D9F70;
    v12[4] = self;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __76__UIKeyboardLayoutCursor_switchToDictationKeyplaneWithActivationIdentifier___block_invoke_2;
    v11[3] = &unk_1E52DC3A0;
    +[UIView animateWithDuration:v12 animations:v11 completion:0.133];
  }
}

uint64_t __76__UIKeyboardLayoutCursor_switchToDictationKeyplaneWithActivationIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 688) setAlpha:0.0];
}

void __76__UIKeyboardLayoutCursor_switchToDictationKeyplaneWithActivationIdentifier___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 688) setAlpha:1.0];
  unint64_t v2 = [*(id *)(a1 + 32) keyplaneBeforeDictation];

  if (v2)
  {
    [*(id *)(a1 + 32) setKeyplaneName:@"Dictation"];
    char v3 = [*(id *)(a1 + 32) window];
    [*(id *)(a1 + 32) setFocusWindow:v3];

    id v5 = [*(id *)(a1 + 32) focusWindow];
    id v4 = [v5 _focusEventRecognizer];
    [v4 setEnabled:0];
  }
}

- (void)returnToKeyplaneAfterDictation
{
  char v3 = [(UIKeyboardLayoutCursor *)self keyplaneBeforeDictation];

  if (v3)
  {
    id v4 = [(UIKeyboardLayoutCursor *)self keyplaneBeforeDictation];
    [(UIKeyboardLayoutCursor *)self setKeyplaneName:v4];

    [(UIKeyboardLayoutCursor *)self setKeyplaneBeforeDictation:0];
    [(UIKeyboardLayoutCursor *)self setSelectedKeyBeforeDictation:0x7FFFFFFFFFFFFFFFLL];
    [(UIView *)self->super._keyplaneView setAlpha:0.0];
    v5[4] = self;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __56__UIKeyboardLayoutCursor_returnToKeyplaneAfterDictation__block_invoke;
    v6[3] = &unk_1E52D9F70;
    v6[4] = self;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __56__UIKeyboardLayoutCursor_returnToKeyplaneAfterDictation__block_invoke_2;
    v5[3] = &unk_1E52DC3A0;
    +[UIView animateWithDuration:v6 animations:v5 completion:0.133];
  }
}

uint64_t __56__UIKeyboardLayoutCursor_returnToKeyplaneAfterDictation__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 688) setAlpha:1.0];
}

uint64_t __56__UIKeyboardLayoutCursor_returnToKeyplaneAfterDictation__block_invoke_2(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) focusWindow];
  char v3 = [v2 _focusEventRecognizer];
  [v3 setEnabled:1];

  id v4 = *(void **)(a1 + 32);
  return [v4 setFocusWindow:0];
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(UIKeyboardLayout *)self disableInteraction]) {
    goto LABEL_28;
  }
  double v8 = [(UIKeyboardLayoutCursor *)self currentKey];
  [(UIKeyboardLayoutStar *)self setActiveKey:v8];

  if ([(UIKBScreenTraits *)self->super.super._screenTraits idiom] != 2) {
    goto LABEL_28;
  }
  self->_didVariantDelete = 0;
  if (_UIPressesContainsPressType(v6, 4))
  {
    int v9 = +[UIKeyboardImpl activeInstance];
    [v9 touchLongPressTimerWithDelay:1.0];

    BOOL v10 = UIKeyboardTypeSupportsDictationSpelling([(UITextInputTraits *)self->super.super._inputTraits dictationKeyboardType])
       || [(UITextInputTraits *)self->super.super._inputTraits isSecureTextEntry]
       || [(UITextInputTraits *)self->super.super._inputTraits forceSpellingDictation];
    double v15 = [(UIKeyboardLayoutStar *)self activeKey];
    int v16 = [v15 interactionType];

    uint64_t v17 = +[UIDevice currentDevice];
    uint64_t v18 = v17;
    if (v16 == 4)
    {
      [v17 _playInputDeleteSound];

      if (v10)
      {
        uint64_t v19 = +[UIDictationController activeInstance];
        [v19 markKeyboardDeleteMetricEvent];
LABEL_24:
      }
    }
    else
    {
      [v17 _playInputSelectSound];

      if (v10)
      {
        uint64_t v19 = +[UIDictationController activeInstance];
        [v19 markKeyboardInputMetricEvent];
        goto LABEL_24;
      }
    }
    keyplaneView = self->super._keyplaneView;
    uint64_t v21 = [(UIKeyboardLayoutStar *)self activeKey];
    int v22 = [(UIKBKeyplaneView *)keyplaneView viewForKey:v21];

    if (v22)
    {
      float v23 = [(UIKeyboardLayoutCursor *)self keyViewAnimator];
      BOOL v24 = [(UIKeyboardLayoutStar *)self activeKey];
      objc_msgSend(v23, "transitionKeyView:fromState:toState:completion:", v22, objc_msgSend(v24, "state"), 12, 0);
    }
    goto LABEL_28;
  }
  if ((_UIPressesContainsPressType(v6, 18) & 1) != 0
    || _UIPressesContainsPressType(v6, 6)
    && (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference__UIAllowDictationFromPlayPause, @"_UIAllowDictationFromPlayPause") & 1) == 0&& byte_1E8FD530C)
  {
    double v11 = +[UIKeyboardImpl activeInstance];
    int v12 = [v11 shouldShowDictationKey];

    if (v12
      && [(NSString *)self->super._keyplaneName rangeOfString:@"Dictation"] == 0x7FFFFFFFFFFFFFFFLL)
    {
      [v7 _hidEvent];
      double v13 = [NSNumber numberWithUnsignedLongLong:IOHIDEventGetSenderID()];
      double v14 = [v13 stringValue];

      [(UIKeyboardLayoutCursor *)self switchToDictationKeyplaneWithActivationIdentifier:v14];
    }
  }
  else if (_UIPressesContainsPressType(v6, 5) {
         && ![(UIKeyboardLayoutCursor *)self _menuTapShouldExitVariants]
  }
         && ![(UIKeyboardLayoutCursor *)self _menuTapShouldStopDictation])
  {
    v25.receiver = self;
    v25.super_class = (Class)UIKeyboardLayoutCursor;
    [(UIResponder *)&v25 pressesBegan:v6 withEvent:v7];
  }
LABEL_28:
}

- (BOOL)_menuTapShouldExitVariants
{
  unint64_t v2 = [(UIKeyboardLayoutCursor *)self currentKey];
  char v3 = v2;
  if (v2 && [v2 state] == 16)
  {
    id v4 = [v3 subtrees];
    if ([v4 count]) {
      BOOL v5 = [v3 variantType] != 0;
    }
    else {
      BOOL v5 = 0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_menuTapShouldStopDictation
{
  if ([(UIKeyboardLayout *)self idiom] != 2
    || !+[UIDictationController isRunning])
  {
    return 0;
  }
  char v3 = [(UIKBTree *)self->super._keyplane name];
  BOOL v4 = [v3 rangeOfString:@"Dictation"] != 0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(UIKeyboardLayout *)self disableInteraction]) {
    goto LABEL_27;
  }
  self->_didVariantDelete = 0;
  if (_UIPressesContainsPressType(v6, 4))
  {
    if ([(UIKeyboardLayout *)self idiom] == 2
      && [(NSString *)self->super._keyplaneName rangeOfString:@"Dictation"] != 0x7FFFFFFFFFFFFFFFLL)
    {
      double v8 = +[UIDictationController activeInstance];
      [v8 stopDictation:0];
    }
    int v9 = [(UIKeyboardLayoutStar *)self activeKey];

    keyplaneView = self->super._keyplaneView;
    double v11 = [(UIKeyboardLayoutStar *)self activeKey];
    int v12 = [(UIKBKeyplaneView *)keyplaneView viewForKey:v11];

    if (v12)
    {
      double v13 = [(UIKeyboardLayoutStar *)self activeKey];
      int v14 = [v13 interactionType];

      if (v14 != 16)
      {
        double v15 = [(UIKeyboardLayoutCursor *)self keyViewAnimator];
        int v16 = [(UIKeyboardLayoutStar *)self activeKey];
        objc_msgSend(v15, "transitionKeyView:fromState:toState:completion:", v12, objc_msgSend(v16, "state"), 4, 0);
      }
    }

    if (!v9) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  if ((_UIPressesContainsPressType(v6, 18) & 1) == 0
    && (!_UIPressesContainsPressType(v6, 6)
     || (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference__UIAllowDictationFromPlayPause, @"_UIAllowDictationFromPlayPause") & 1) != 0|| !byte_1E8FD530C))
  {
LABEL_16:
    [(UIKeyboardLayoutCursor *)self _handlePresses:v6 withEvent:v7];
    goto LABEL_17;
  }
  [(UIKeyboardLayoutCursor *)self returnToKeyplaneAfterDictation];
LABEL_17:
  uint64_t v17 = +[UIKeyboardImpl activeInstance];
  [v17 clearLongPressTimer];

  if (_UIPressesContainsPressType(v6, 4))
  {
    [(UIKeyboardLayoutStar *)self setActiveKey:0];
LABEL_19:
    self->_ignoreEventsUntilPressEnds = 0;
    goto LABEL_27;
  }
  if (!_UIPressesContainsPressType(v6, 5)) {
    goto LABEL_27;
  }
  if ([(UIKeyboardLayoutCursor *)self _menuTapShouldExitVariants])
  {
    uint64_t v18 = [(UIKeyboardLayoutCursor *)self currentKey];
    [(UIKeyboardLayoutCursor *)self clearVariantStateForKey:v18];

    goto LABEL_19;
  }
  if ([(UIKeyboardLayoutCursor *)self _menuTapShouldStopDictation])
  {
    uint64_t v19 = +[UIDictationController activeInstance];
    [v19 stopDictation:0];
  }
  else if (!self->_isForwardingEvent)
  {
    self->_isForwardingEvent = 1;
    v20.receiver = self;
    v20.super_class = (Class)UIKeyboardLayoutCursor;
    [(UIResponder *)&v20 pressesEnded:v6 withEvent:v7];
    self->_isForwardingEvent = 0;
  }
LABEL_27:
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(UIKeyboardLayout *)self disableInteraction])
  {
    self->_didVariantDelete = 0;
    double v8 = +[UIKeyboardImpl activeInstance];
    [v8 clearLongPressTimer];

    if (_UIPressesContainsPressType(v6, 4))
    {
      keyplaneView = self->super._keyplaneView;
      BOOL v10 = [(UIKeyboardLayoutStar *)self activeKey];
      double v11 = [(UIKBKeyplaneView *)keyplaneView viewForKey:v10];

      if (v11)
      {
        int v12 = [(UIKeyboardLayoutCursor *)self keyViewAnimator];
        double v13 = [(UIKeyboardLayoutStar *)self activeKey];
        objc_msgSend(v12, "transitionKeyView:fromState:toState:completion:", v11, objc_msgSend(v13, "state"), 4, 0);
      }
      [(UIKeyboardLayoutStar *)self setActiveKey:0];
      self->_ignoreEventsUntilPressEnds = 0;
      goto LABEL_6;
    }
    if (_UIPressesContainsPressType(v6, 5))
    {
      if ([(UIKeyboardLayoutCursor *)self _menuTapShouldExitVariants])
      {
        double v11 = [(UIKeyboardLayoutCursor *)self currentKey];
        [(UIKeyboardLayoutCursor *)self clearVariantStateForKey:v11];
LABEL_6:

        goto LABEL_7;
      }
      if ([(UIKeyboardLayoutCursor *)self _menuTapShouldStopDictation])
      {
        int v14 = +[UIDictationController activeInstance];
        [v14 stopDictation:0];

        goto LABEL_7;
      }
      if (self->_isForwardingEvent) {
        goto LABEL_7;
      }
      self->_isForwardingEvent = 1;
      -[UIResponder pressesCancelled:withEvent:](&v16, sel_pressesCancelled_withEvent_, v6, v7, v15.receiver, v15.super_class, self, UIKeyboardLayoutCursor);
    }
    else
    {
      if (!_UIPressesContainsPressType(v6, 6)) {
        goto LABEL_7;
      }
      if ([(UIKeyboardLayoutCursor *)self canHandleEvent:v7])
      {
        [(UIKeyboardLayoutCursor *)self _handlePresses:v6 withEvent:v7];
        goto LABEL_7;
      }
      if (self->_isForwardingEvent) {
        goto LABEL_7;
      }
      self->_isForwardingEvent = 1;
      -[UIResponder pressesCancelled:withEvent:](&v15, sel_pressesCancelled_withEvent_, v6, v7, self, UIKeyboardLayoutCursor, v16.receiver, v16.super_class);
    }
    self->_isForwardingEvent = 0;
  }
LABEL_7:
}

- (BOOL)_handlePresses:(id)a3 withEvent:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [0 type];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_18;
  }
  if (qword_1EB25C528 != -1)
  {
    dispatch_once(&qword_1EB25C528, &__block_literal_global_214_0);
    if (v6) {
      goto LABEL_4;
    }
LABEL_33:
    if (os_variant_has_internal_diagnostics())
    {
      float v23 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v23, OS_LOG_TYPE_FAULT, "presses should never be nil. Caller must filter [event allPresses] appropriately and pass in a set of UIPress objects that matches current phase. Not doing so runs a risk of triggering infinite loop.", buf, 2u);
      }
    }
    else
    {
      int v22 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25C538) + 8);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v22, OS_LOG_TYPE_ERROR, "presses should never be nil. Caller must filter [event allPresses] appropriately and pass in a set of UIPress objects that matches current phase. Not doing so runs a risk of triggering infinite loop.", buf, 2u);
      }
    }
    id v9 = [v7 allPresses];
    goto LABEL_5;
  }
  if (!v6) {
    goto LABEL_33;
  }
LABEL_4:
  id v9 = v6;
LABEL_5:
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    id v24 = v7;
    uint64_t v13 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_super v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        objc_super v16 = (void *)qword_1EB25C530;
        uint64_t v17 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v15, "type"));
        if ([v16 containsObject:v17])
        {
          uint64_t v18 = [v15 phase];

          if (v18 != 2)
          {
            uint64_t v8 = [v15 type];
            goto LABEL_16;
          }
        }
        else
        {
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v12);
LABEL_16:
    id v7 = v24;
  }

LABEL_18:
  if ([(UIKeyboardLayout *)self idiom] == 2 && v8 > 5)
  {
    if (v8 == 18) {
      goto LABEL_30;
    }
    if (v8 == 6)
    {
      BOOL v19 = [(UIKeyboardLayoutCursor *)self handleVisualDirectionalInput:6];
      goto LABEL_28;
    }
LABEL_29:
    BOOL v20 = 0;
    goto LABEL_31;
  }
  if (v8 == 4)
  {
    BOOL v19 = [(UIKeyboardLayoutCursor *)self handleLinearDirectionalInput:5];
    goto LABEL_28;
  }
  if (v8 != 5) {
    goto LABEL_29;
  }
  if ([(UIKeyboardLayoutCursor *)self _menuTapShouldExitVariants])
  {
LABEL_30:
    BOOL v20 = 1;
    goto LABEL_31;
  }
  BOOL v19 = [(UIKeyboardLayoutCursor *)self _menuTapShouldStopDictation];
LABEL_28:
  BOOL v20 = v19;
LABEL_31:

  return v20;
}

void __51__UIKeyboardLayoutCursor__handlePresses_withEvent___block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:&unk_1ED3F0238];
  v1 = (void *)qword_1EB25C530;
  qword_1EB25C530 = v0;
}

- (void)remoteControlReceivedWithEvent:(id)a3
{
  id v4 = a3;
  if (![(UIKeyboardLayout *)self disableInteraction]) {
    [(UIKeyboardLayoutCursor *)self _handleRemoteControlReceivedWithEvent:v4];
  }
}

- (BOOL)_handleRemoteControlReceivedWithEvent:(id)a3
{
  unint64_t v4 = [a3 subtype] - 103;
  if (v4 > 9 || ((0x3A9u >> v4) & 1) == 0) {
    return 0;
  }
  uint64_t v6 = dword_186B99F80[v4];
  return [(UIKeyboardLayoutCursor *)self handleVisualDirectionalInput:v6];
}

- (void)_wheelChangedWithEvent:(id)a3
{
  id v4 = a3;
  if (![(UIKeyboardLayout *)self disableInteraction]) {
    [(UIKeyboardLayoutCursor *)self _handleWheelChangedWithEvent:v4];
  }
}

- (BOOL)_handleWheelChangedWithEvent:(id)a3
{
  unint64_t v4 = [a3 subtype] - 200;
  if (v4 > 5) {
    return 0;
  }
  uint64_t v5 = dword_186B99FA8[v4];
  return [(UIKeyboardLayoutCursor *)self handleLinearDirectionalInput:v5];
}

- (void)_moveWithEvent:(id)a3
{
  id v4 = a3;
  if (![(UIKeyboardLayout *)self disableInteraction]) {
    [(UIKeyboardLayoutCursor *)self _handleMoveWithEvent:v4];
  }
}

- (BOOL)_isDirectionalHeading:(unint64_t)a3
{
  return (a3 & 0x30) == 0 && (a3 & 0xF) != 0;
}

- (BOOL)_handleMoveWithEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 _focusHeading];
  BOOL v6 = 0;
  uint64_t v7 = 2;
  switch(v5)
  {
    case 1:
      uint64_t v7 = 1;
      goto LABEL_9;
    case 2:
      goto LABEL_9;
    case 3:
    case 5:
    case 6:
    case 7:
      goto LABEL_13;
    case 4:
      goto LABEL_6;
    case 8:
      goto LABEL_8;
    default:
      if (v5 == 16)
      {
        if ([(UIKeyboardLayoutCursor *)self isAppRightToLeft])
        {
LABEL_6:
          uint64_t v7 = 3;
          goto LABEL_9;
        }
      }
      else
      {
        if (v5 != 32) {
          goto LABEL_13;
        }
        if (![(UIKeyboardLayoutCursor *)self isAppRightToLeft]) {
          goto LABEL_6;
        }
      }
LABEL_8:
      uint64_t v7 = 4;
LABEL_9:
      if (-[UIKeyboardLayoutCursor _isDirectionalHeading:](self, "_isDirectionalHeading:", [v4 _focusHeading]))
      {
        BOOL v8 = [(UIKeyboardLayoutCursor *)self handleVisualDirectionalInput:v7];
      }
      else
      {
        BOOL v8 = [(UIKeyboardLayoutCursor *)self handleLinearDirectionalInput:v7];
      }
      BOOL v6 = v8;
LABEL_13:

      return v6;
  }
}

- (unint64_t)_indexOfFirstKeyPassingTest:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  int v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
  if ([(UIKeyboardLayoutCursor *)self _isKeyboardReverseOfAppLayoutDirection]) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 0;
  }
  keyplaneKeys = self->_keyplaneKeys;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__UIKeyboardLayoutCursor__indexOfFirstKeyPassingTest___block_invoke;
  v10[3] = &unk_1E52FA470;
  id v7 = v4;
  id v11 = v7;
  uint64_t v12 = &v13;
  [(NSArray *)keyplaneKeys enumerateObjectsWithOptions:v5 usingBlock:v10];
  unint64_t v8 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v8;
}

uint64_t __54__UIKeyboardLayoutCursor__indexOfFirstKeyPassingTest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (BOOL)_isKeyboardReverseOfAppLayoutDirection
{
  unint64_t v2 = (void *)MEMORY[0x1E4F1CA20];
  char v3 = +[UIKeyboardImpl activeInstance];
  id v4 = [v3 _getLocalizedInputMode];
  LOBYTE(v2) = [v2 characterDirectionForLanguage:v4] == 1;

  return v2 ^ ([(id)UIApp userInterfaceLayoutDirection] == 0);
}

- (id)getRomanAccentVariantsForString:(id)a3 inputMode:(id)a4 keyboardVariantIndludes:(int)a5
{
  return UIKeyboardRomanAccentVariants((uint64_t)a3, a4, *(uint64_t *)&a5);
}

- (double)defaultCursorAdjustDistance
{
  return 60.0;
}

- (BOOL)isSlimLinearKeyboardTV
{
  return 0;
}

- (BOOL)isAppRightToLeft
{
  return [(id)UIApp userInterfaceLayoutDirection] == 1;
}

- (BOOL)isKeyboardRightToLeft
{
  unint64_t v2 = +[UIKeyboardInputModeController sharedInputModeController];
  char v3 = [v2 currentInputMode];
  char v4 = [v3 isDefaultRightToLeft];

  return v4;
}

- (UIAlertController)recentInputsAlert
{
  return self->_recentInputsAlert;
}

- (void)setRecentInputsAlert:(id)a3
{
}

- (NSString)keyplaneBeforeDictation
{
  return self->_keyplaneBeforeDictation;
}

- (void)setKeyplaneBeforeDictation:(id)a3
{
}

- (int64_t)selectedKeyBeforeDictation
{
  return self->_selectedKeyBeforeDictation;
}

- (void)setSelectedKeyBeforeDictation:(int64_t)a3
{
  self->_selectedKeyBeforeDictation = a3;
}

- (BOOL)suppressOperations
{
  return self->_suppressOperations;
}

- (void)setSuppressOperations:(BOOL)a3
{
  self->_suppressOperations = a3;
}

- (BOOL)overrideInitialKey
{
  return self->_overrideInitialKey;
}

- (void)setOverrideInitialKey:(BOOL)a3
{
  self->_overrideInitialKedouble y = a3;
}

- (unint64_t)lastSelectedKeyIndex
{
  return self->_lastSelectedKeyIndex;
}

- (void)setLastSelectedKeyIndex:(unint64_t)a3
{
  self->_lastSelectedKeyIndeCGFloat x = a3;
}

- (BOOL)shouldConfigureFloatingContentView
{
  return self->_shouldConfigureFloatingContentView;
}

- (void)setShouldConfigureFloatingContentView:(BOOL)a3
{
  self->_shouldConfigureFloatingContentView = a3;
}

- (BOOL)shouldToggleLetterCaseNext
{
  return self->_shouldToggleLetterCaseNext;
}

- (void)setShouldToggleLetterCaseNext:(BOOL)a3
{
  self->_shouldToggleLetterCaseNext = a3;
}

- (UIWindow)focusWindow
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusWindow);
  return (UIWindow *)WeakRetained;
}

- (void)setFocusWindow:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_focusWindow);
  objc_storeStrong((id *)&self->_keyplaneBeforeDictation, 0);
  objc_storeStrong((id *)&self->_recentInputsAlert, 0);
  objc_storeStrong((id *)&self->_dictationHelpLabel, 0);
  objc_storeStrong((id *)&self->_cachedMultitapKeyplane, 0);
  objc_storeStrong((id *)&self->_recentInputs, 0);
  objc_storeStrong((id *)&self->_keyplaneKeys, 0);
  objc_storeStrong((id *)&self->_selectionView, 0);
  objc_storeStrong((id *)&self->_indirectKeyboard, 0);
}

@end