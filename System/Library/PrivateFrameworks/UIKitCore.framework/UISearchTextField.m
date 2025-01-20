@interface UISearchTextField
+ (BOOL)_wantsFadedEdges;
+ (Class)_fieldEditorClass;
+ (Class)_textPasteItemClass;
+ (NSCopying)visualStyleRegistryIdentity;
- (BOOL)_alwaysHidesMagnifyingGlassForAccessibilityContentSizeCategory;
- (BOOL)_alwaysShowsClearButtonWhenEmpty;
- (BOOL)_becomeFirstResponderWhenPossible;
- (BOOL)_delegateShouldBeginEditing;
- (BOOL)_delegateShouldChangeCharactersInTextStorageRange:(_NSRange)a3 replacementString:(id)a4 delegateCares:(BOOL *)a5;
- (BOOL)_delegateShouldClear;
- (BOOL)_delegateShouldEndEditing;
- (BOOL)_delegateShouldScrollToVisibleWhenBecomingFirstResponder;
- (BOOL)_hasContent;
- (BOOL)_hasCustomClearButtonImage;
- (BOOL)_ignoresDynamicType;
- (BOOL)_isEditingOrHasContent;
- (BOOL)_needsDelayedSearchControllerPresentation;
- (BOOL)_preventSelectionViewActivation;
- (BOOL)_scalesMagnifyingGlassForDynamicTypeWithFont:(id)a3;
- (BOOL)_shouldAppendTextInViewDescription;
- (BOOL)_shouldCenterPlaceholder;
- (BOOL)_shouldDetermineInterfaceStyleTextColor;
- (BOOL)_shouldHideMagnifyingGlassWhenEditingOrHasContent;
- (BOOL)_shouldIgnoreBaseWritingDirectionChanges;
- (BOOL)_shouldOverrideEditingFont;
- (BOOL)_shouldResignOnEditingDidEndOnExit;
- (BOOL)_shouldSendContentChangedNotificationsIfOnlyMarkedTextChanged;
- (BOOL)_shouldSuppressSelectionHandles;
- (BOOL)_supportsDynamicType;
- (BOOL)_textShouldFillFieldEditorHeight;
- (BOOL)allowsCopyingTokens;
- (BOOL)allowsDeletingTokens;
- (BOOL)allowsDraggingAttachments;
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canBecomeFocused;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)canResignFirstResponder;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)resignFirstResponder;
- (CGRect)_adjustedTextOrEditingRect:(CGRect)a3 forBounds:(CGRect)a4;
- (CGRect)_adjustmentsForSearchIconViewRectForBounds:(CGRect)a3;
- (CGRect)_availableTextRectForBounds:(CGRect)a3 forEditing:(BOOL)a4;
- (CGRect)_bookmarkViewRectForBounds:(CGRect)a3;
- (CGRect)_searchIconViewRectForBounds:(CGRect)a3;
- (CGRect)_suffixFrame;
- (CGRect)clearButtonRectForBounds:(CGRect)a3;
- (CGRect)editingRectForBounds:(CGRect)a3;
- (CGRect)leftViewRectForBounds:(CGRect)a3;
- (CGRect)placeholderRectForBounds:(CGRect)a3;
- (CGRect)rightViewRectForBounds:(CGRect)a3;
- (CGRect)textRectForBounds:(CGRect)a3;
- (CGSize)_clearButtonSize;
- (CGSize)intrinsicContentSize;
- (Class)_canvasViewClass;
- (Class)_placeholderLabelClass;
- (NSArray)_dci_suggestionsMenuDismissalPassthroughViews;
- (NSArray)searchSuggestions;
- (NSArray)tokens;
- (NSArray)tokensInRange:(UITextRange *)textRange;
- (NSValue)_searchTextOffsetValue;
- (UIColor)_tokenForegroundColor;
- (UIColor)tokenBackgroundColor;
- (UISearchBar)_searchBar;
- (UISearchTextField)initWithCoder:(id)a3;
- (UITextPosition)positionOfTokenAtIndex:(NSInteger)tokenIndex;
- (UITextRange)textualRange;
- (_NSRange)_rangeForClearButton;
- (_NSRange)_rangeForSetText;
- (_NSRange)_textRangeForTextStorageRange:(_NSRange)a3;
- (_NSRange)insertFilteredText:(id)a3;
- (_UISearchSuggestionControllerIOSBase)_suggestionController;
- (double)_clearButtonMarginX;
- (double)_defaultHeightForBarMetrics:(int64_t)a3;
- (double)_maximumAlphaForLeadingView;
- (double)_placeholderLabelAlphaForForegroundViewsAlpha:(double)a3;
- (id)_clearButtonImageForState:(unint64_t)a3;
- (id)_createEffectsBackgroundViewWithStyle:(int64_t)a3 applyFilter:(id)a4;
- (id)_customDraggableObjectsForRange:(id)a3;
- (id)_deferredSearchSuggestions;
- (id)_initWithDeferredSearchIconImageConfiguration;
- (id)_initWithFrame:(CGRect)a3 textLayoutManagerEnabled:(BOOL)a4;
- (id)_initWithFrame:(CGRect)a3 textLayoutManagerEnabled:(BOOL)a4 defersSearchImageConfiguration:(BOOL)a5;
- (id)_newAttributedStringWithToken:(id)a3;
- (id)_offsetValueForIcon:(int64_t)a3;
- (id)_placeholderColor;
- (id)_rangeOfCustomDraggableObjectsInRange:(id)a3;
- (id)attributedText;
- (id)attributedTextInRange:(id)a3;
- (id)selectedTokens;
- (id)text;
- (id)textInRange:(id)a3;
- (id)textInputTraits;
- (int64_t)_preferredRenderingModeForPlaceholder;
- (int64_t)_suffixLabelTextAlignment;
- (unint64_t)_characterIndexForTokenTapGestureRecognizer;
- (void)__highlightedDidChangeAnimated:(BOOL)a3;
- (void)_activateSelectionView;
- (void)_animateForFirstResponderChangeWithAnimations:(id)a3;
- (void)_animateForFirstResponderChangeWithAnimations:(id)a3 completion:(id)a4;
- (void)_applyHighlightedAnimated:(BOOL)a3;
- (void)_becomeFirstResponder;
- (void)_clearBackgroundViews;
- (void)_clearSearchSuggestionsIfNecessary;
- (void)_copySelectionPopulatingActuallyCopiedTokenCharacterIndexes:(id)a3;
- (void)_defaultInsertTextSuggestion:(id)a3;
- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4;
- (void)_didRemoveTokenLayoutView:(id)a3;
- (void)_didSetFont:(id)a3;
- (void)_highlightedDidChangeAnimated:(BOOL)a3;
- (void)_hoverGestureChanged:(id)a3;
- (void)_notifyDidBeginEditing;
- (void)_notifyDidEndEditing;
- (void)_observeScrollViewDidScroll:(id)a3;
- (void)_pasteSessionDidFinish:(id)a3;
- (void)_receivedKeyboardDidShowNotification:(id)a3;
- (void)_redirectSelectionToAvoidClobberingTokens;
- (void)_removeEffectsBackgroundViews;
- (void)_resetNeedsDelayedSearchControllerPresentation;
- (void)_setAlwaysHidesMagnifyingGlassForAccessibilityContentSizeCategory:(BOOL)a3;
- (void)_setAlwaysShowsClearButtonWhenEmpty:(BOOL)a3;
- (void)_setAnimatesBackgroundCornerRadius:(BOOL)a3;
- (void)_setBackgroundViewsAlpha:(double)a3;
- (void)_setBottomEffectBackgroundVisible:(BOOL)a3;
- (void)_setClearButtonImage:(id)a3 forState:(unint64_t)a4;
- (void)_setDeferredSearchSuggestions:(id)a3;
- (void)_setEnabled:(BOOL)a3 animated:(BOOL)a4;
- (void)_setIgnoresDynamicType:(BOOL)a3;
- (void)_setMagnifyingGlassImage:(id)a3;
- (void)_setOffsetValue:(id)a3 forIcon:(int64_t)a4;
- (void)_setPreventSelectionViewActivation:(BOOL)a3;
- (void)_setSearchBar:(id)a3;
- (void)_setSearchTextOffetValue:(id)a3;
- (void)_setSuggestionController:(id)a3;
- (void)_setTokenForegroundColor:(id)a3;
- (void)_suggestionsMenuInteractionWillEndWithAnimator:(id)a3;
- (void)_tokenTapGestureRecognized;
- (void)_updateAlphaForMagnifyingGlass;
- (void)_updateAtomViewSelection:(BOOL)a3;
- (void)_updateBackgroundView:(id)a3 withStyle:(int64_t)a4 filter:(id)a5;
- (void)_updateColorForMagnifyingGlass;
- (void)_updateDefaultLeftViewForFont:(id)a3;
- (void)_updateHelpMessageOverrideWithMessage:(id)a3;
- (void)_updateLeftViewForMagnifyingGlassImage;
- (void)_willAddTokenLayoutView:(id)a3;
- (void)copy:(id)a3;
- (void)cut:(id)a3;
- (void)deleteBackward;
- (void)didAddTextAttachmentViews:(id)a3;
- (void)didLayoutTextAttachmentView:(id)a3 inFragmentRect:(CGRect)a4;
- (void)didRemoveTextAttachmentViews:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)fieldEditorDidChange:(id)a3;
- (void)fieldEditorDidChangeSelection:(id)a3;
- (void)insertAttributedText:(id)a3;
- (void)insertText:(id)a3;
- (void)insertTextSuggestion:(id)a3;
- (void)insertToken:(UISearchToken *)token atIndex:(NSInteger)tokenIndex;
- (void)layoutSubviews;
- (void)paste:(id)a3;
- (void)removeTokenAtIndex:(NSInteger)tokenIndex;
- (void)replaceRange:(id)a3 withAttributedText:(id)a4;
- (void)replaceRange:(id)a3 withText:(id)a4;
- (void)replaceRangeWithTextWithoutClosingTyping:(id)a3 replacementText:(id)a4;
- (void)replaceTextualPortionOfRange:(UITextRange *)textRange withToken:(UISearchToken *)token atIndex:(NSUInteger)tokenIndex;
- (void)searchSuggestionController:(id)a3 didSelectSuggestion:(id)a4 atIndexPath:(id)a5;
- (void)setAllowsCopyingTokens:(BOOL)allowsCopyingTokens;
- (void)setAllowsDeletingTokens:(BOOL)allowsDeletingTokens;
- (void)setAttributedMarkedText:(id)a3 selectedRange:(_NSRange)a4;
- (void)setDelegate:(id)a3;
- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4;
- (void)setSearchSuggestions:(NSArray *)searchSuggestions;
- (void)setText:(id)a3;
- (void)setTokenBackgroundColor:(UIColor *)tokenBackgroundColor;
- (void)setTokens:(NSArray *)tokens;
- (void)tintColorDidChange;
- (void)updateForBackdropStyle:(int64_t)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation UISearchTextField

- (double)_defaultHeightForBarMetrics:(int64_t)a3
{
  [(_UISearchTextFieldVisualStyle *)self->_visualStyle defaultHeightForBarMetrics:a3];
  return result;
}

- (id)text
{
  v3 = [(UISearchTextField *)self textualRange];
  v4 = [(UISearchTextField *)self textInRange:v3];

  return v4;
}

- (id)textInRange:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(UISearchTextField *)self textualRange];
    v6 = [(UIResponder *)self _intersectionOfRange:v5 andRange:v4];

    v11.receiver = self;
    v11.super_class = (Class)UISearchTextField;
    v7 = [(UITextField *)&v11 textInRange:v6];
  }
  else
  {
    if (os_variant_has_internal_diagnostics())
    {
      v10 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v10, OS_LOG_TYPE_FAULT, "Something is calling -textInRange: with a nil range. This argument is nonnull. Returning a default value.", buf, 2u);
      }
    }
    else
    {
      v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &textInRange____s_category) + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "Something is calling -textInRange: with a nil range. This argument is nonnull. Returning a default value.", buf, 2u);
      }
    }
    v7 = &stru_1ED0E84C0;
  }

  return v7;
}

- (UITextRange)textualRange
{
  uint64_t v4 = [(_UISearchBarTextFieldTokenCounter *)self->_tokenCounter characterRangeOfTextAfterLastToken];
  return (UITextRange *)-[UIResponder _textRangeFromNSRange:](self, "_textRangeFromNSRange:", v4, v3);
}

+ (Class)_fieldEditorClass
{
  return (Class)objc_opt_class();
}

- (void)_setSearchBar:(id)a3
{
  p_searchBar = &self->_searchBar;
  id v5 = a3;
  objc_storeWeak((id *)p_searchBar, v5);
  LOBYTE(p_searchBar) = objc_opt_respondsToSelector();

  *(unsigned char *)&self->_searchBarTextFieldFlags = *(unsigned char *)&self->_searchBarTextFieldFlags & 0xFE | p_searchBar & 1;
  suggestionController = self->_suggestionController;
  [(_UISearchSuggestionControllerIOSBase *)suggestionController searchTextFieldDidGainSearchBar:self];
}

- (void)_setSuggestionController:(id)a3
{
}

- (BOOL)_hasContent
{
  v6.receiver = self;
  v6.super_class = (Class)UISearchTextField;
  if ([(UITextField *)&v6 _hasContent]) {
    return 1;
  }
  uint64_t v4 = [(_UISearchBarTextFieldTokenCounter *)self->_tokenCounter tokenCharacterIndexes];
  BOOL v3 = [v4 count] != 0;

  return v3;
}

- (double)_clearButtonMarginX
{
  BOOL v3 = [(_UISearchTextFieldVisualStyle *)self->_visualStyle clearButtonInnerInset];
  if (v3)
  {
  }
  else
  {
    uint64_t v4 = [(_UISearchTextFieldVisualStyle *)self->_visualStyle clearButtonOuterInset];

    if (!v4)
    {
      v13.receiver = self;
      v13.super_class = (Class)UISearchTextField;
      [(UITextField *)&v13 _clearButtonMarginX];
      return v12;
    }
  }
  id v5 = [(_UISearchTextFieldVisualStyle *)self->_visualStyle clearButtonInnerInset];
  [v5 floatValue];
  double v7 = v6 + 0.0;

  v8 = [(_UISearchTextFieldVisualStyle *)self->_visualStyle clearButtonOuterInset];
  [v8 floatValue];
  double v10 = v7 + v9;

  return v10;
}

- (CGRect)rightViewRectForBounds:(CGRect)a3
{
  if ((*((_DWORD *)&self->super.super.super._viewFlags + 4) & 0x80000) != 0) {
    -[UISearchTextField _searchIconViewRectForBounds:](self, "_searchIconViewRectForBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  }
  else {
    -[UISearchTextField _bookmarkViewRectForBounds:](self, "_bookmarkViewRectForBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)leftViewRectForBounds:(CGRect)a3
{
  if ((*((_DWORD *)&self->super.super.super._viewFlags + 4) & 0x80000) != 0) {
    -[UISearchTextField _bookmarkViewRectForBounds:](self, "_bookmarkViewRectForBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  }
  else {
    -[UISearchTextField _searchIconViewRectForBounds:](self, "_searchIconViewRectForBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)editingRectForBounds:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)UISearchTextField;
  -[UITextField editingRectForBounds:](&v8, sel_editingRectForBounds_);
  -[UISearchTextField _adjustedTextOrEditingRect:forBounds:](self, "_adjustedTextOrEditingRect:forBounds:");
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)_adjustedTextOrEditingRect:(CGRect)a3 forBounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  CGFloat v8 = a3.size.height;
  double v9 = a3.size.width;
  double v10 = a3.origin.y;
  double v11 = a3.origin.x;
  if (UISearchBarUsesModernAppearance())
  {
    double v68 = height;
    double v69 = v8;
    double v67 = y;
    -[UISearchTextField _searchIconViewRectForBounds:](self, "_searchIconViewRectForBounds:", x, y, width, height);
    uint64_t v17 = v13;
    uint64_t v18 = v14;
    uint64_t v19 = v15;
    uint64_t rect = v16;
    if ((*((_DWORD *)&self->super.super.super._viewFlags + 4) & 0x80000) != 0) {
      double MinX = CGRectGetMinX(*(CGRect *)&v13);
    }
    else {
      double MinX = CGRectGetMaxX(*(CGRect *)&v13);
    }
    double v70 = MinX;
    if ([(UISearchTextField *)self _shouldHideMagnifyingGlassWhenEditingOrHasContent])
    {
      if ([(UISearchTextField *)self _isEditingOrHasContent])
      {
        v28 = [(UITextField *)self leftView];
        defaultLeftView = self->_defaultLeftView;

        if (v28 == defaultLeftView)
        {
          uint64_t v30 = rect;
          uint64_t v31 = v17;
          uint64_t v32 = v18;
          uint64_t v33 = v19;
          if ((*((_DWORD *)&self->super.super.super._viewFlags + 4) & 0x80000) != 0) {
            double MaxX = CGRectGetMaxX(*(CGRect *)&v31);
          }
          else {
            double MaxX = CGRectGetMinX(*(CGRect *)&v31);
          }
          double v70 = MaxX;
        }
      }
    }
    double v35 = x;
    double v21 = v67;
    double height = v68;
    double v36 = v67;
    double v37 = width;
    double v38 = v68;
    if ((*((_DWORD *)&self->super.super.super._viewFlags + 4) & 0x80000) != 0) {
      double v39 = CGRectGetMaxX(*(CGRect *)&v35);
    }
    else {
      double v39 = CGRectGetMinX(*(CGRect *)&v35);
    }
    CGFloat v8 = v69;
    double v40 = v70 - v39;
    if ((*((_DWORD *)&self->super.super.super._viewFlags + 4) & 0x80000) != 0) {
      double v40 = -v40;
    }
    if (v40 > 0.0)
    {
      [(_UISearchTextFieldVisualStyle *)self->_visualStyle textLeadingInset];
      double v42 = v41;
      if ((*((_DWORD *)&self->super.super.super._viewFlags + 4) & 0x80000) != 0) {
        [(UITextField *)self paddingRight];
      }
      else {
        [(UITextField *)self paddingLeft];
      }
      int v44 = *((_DWORD *)&self->super.super.super._viewFlags + 4);
      double v45 = v42 - v43;
      if ((v44 & 0x80000) != 0) {
        double v45 = -v45;
      }
      double v46 = v70 + v45;
      double v47 = v11;
      double v48 = v10;
      double v49 = v9;
      double v50 = v69;
      if ((v44 & 0x80000) != 0) {
        double v51 = CGRectGetMaxX(*(CGRect *)&v47);
      }
      else {
        double v51 = CGRectGetMinX(*(CGRect *)&v47);
      }
      int v52 = *((_DWORD *)&self->super.super.super._viewFlags + 4);
      double v53 = v46 - v51;
      if ((v52 & 0x80000) != 0) {
        double v53 = -v53;
      }
      double v9 = v9 - v53;
      if ((*(void *)&v52 & 0x80000) == 0) {
        double v11 = v46;
      }
    }
  }
  else
  {
    double v21 = y;
    [(_UISearchTextFieldVisualStyle *)self->_visualStyle textLeftInsetLegacy];
    double v23 = v22;
    [(UITextField *)self paddingLeft];
    double v25 = v23 - v24;
    double v11 = v11 + v25;
    double v9 = v9 - v25;
    if (![(UITextField *)self _showsClearButtonWhenNonEmpty:[(UITextField *)self isEditing]])
    {
      [(_UISearchTextFieldVisualStyle *)self->_visualStyle textRightInset];
      double v9 = v9 - v26;
      if ((*((_DWORD *)&self->super.super.super._viewFlags + 4) & 0x80000) != 0)
      {
        [(_UISearchTextFieldVisualStyle *)self->_visualStyle textRightInset];
        double v11 = v11 + v27;
      }
    }
  }
  if ([(UIControl *)self contentVerticalAlignment] == UIControlContentVerticalAlignmentTop)
  {
    v54 = [(UITextField *)self font];
    [v54 lineHeight];
    double v56 = round(v21 + height * 0.5 - v55 * 0.5);

    [(UIView *)self _currentScreenScale];
    double v10 = v56 + 10.0 / v57;
  }
  searchTextOffsetValue = self->_searchTextOffsetValue;
  if (searchTextOffsetValue)
  {
    int v59 = *((_DWORD *)&self->super.super.super._viewFlags + 4);
    [(NSValue *)searchTextOffsetValue UIOffsetValue];
    if ((*(void *)&v59 & 0x80000) != 0) {
      double v60 = -v60;
    }
    double v11 = v11 + v60;
    double v10 = v10 + v61;
  }
  if (v9 >= 0.0) {
    double v62 = v9;
  }
  else {
    double v62 = 0.0;
  }
  double v63 = v11;
  double v64 = v10;
  double v65 = v8;
  result.size.double height = v65;
  result.size.double width = v62;
  result.origin.double y = v64;
  result.origin.double x = v63;
  return result;
}

- (BOOL)_shouldHideMagnifyingGlassWhenEditingOrHasContent
{
  double v3 = [(UITextField *)self font];
  if ([(UISearchTextField *)self _scalesMagnifyingGlassForDynamicTypeWithFont:v3])
  {
    double v4 = [(UIView *)self traitCollection];
    double v5 = [v4 preferredContentSizeCategory];
    IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v5);
  }
  else
  {
    IsAccessibilityCategordouble y = 0;
  }

  return IsAccessibilityCategory;
}

- (BOOL)_scalesMagnifyingGlassForDynamicTypeWithFont:(id)a3
{
  id v4 = a3;
  if ([(UISearchTextField *)self _supportsDynamicType])
  {
    double v5 = [v4 fontDescriptor];
    double v6 = [v5 objectForKey:*(void *)off_1E52D6B90];

    double v7 = [v4 textStyleForScaling];
    if (v7) {
      CGFloat v8 = v7;
    }
    else {
      CGFloat v8 = v6;
    }
    char v9 = [off_1E52D39B8 _isSupportedDynamicFontTextStyle:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)_supportsDynamicType
{
  return dyld_program_sdk_at_least();
}

- (CGRect)clearButtonRectForBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v54.receiver = self;
  v54.super_class = (Class)UISearchTextField;
  -[UITextField clearButtonRectForBounds:](&v54, sel_clearButtonRectForBounds_);
  double v9 = v8;
  double v11 = v10;
  CGFloat v13 = v12;
  CGFloat v48 = v14;
  uint64_t v15 = [(UIView *)self traitCollection];
  uint64_t v16 = [v15 userInterfaceIdiom];

  if (v16 != 6)
  {
    [(UIView *)self _currentScreenScale];
    if (v17 > 1.0)
    {
      [(UIView *)self _currentScreenScale];
      double v19 = 1.0 / v18;
      double v20 = -v19;
      if ((*((_DWORD *)&self->super.super.super._viewFlags + 4) & 0x80000) != 0) {
        double v20 = v19;
      }
      double v9 = v9 + v20;
      double v11 = v11 - v19;
    }
  }
  double v21 = [(UIView *)self traitCollection];
  uint64_t v22 = [v21 userInterfaceIdiom];

  if (v22 == 5)
  {
    if ((*((_DWORD *)&self->super.super.super._viewFlags + 4) & 0x80000) == 0)
    {
      v55.origin.CGFloat x = x;
      v55.origin.CGFloat y = y;
      v55.size.CGFloat width = width;
      v55.size.CGFloat height = height;
      double MaxX = CGRectGetMaxX(v55);
      v56.origin.CGFloat x = v9;
      v56.origin.CGFloat y = v11;
      v56.size.CGFloat width = v13;
      CGFloat v24 = v48;
      v56.size.CGFloat height = v48;
      double v25 = MaxX - CGRectGetWidth(v56);
      [(UISearchTextField *)self _clearButtonMarginX];
      v53.receiver = self;
      v53.super_class = (Class)UISearchTextField;
      [(UITextField *)&v53 _clearButtonPadX];
      UIRoundToViewScale(self);
      double v27 = round(v25 - v26);
      v52.receiver = self;
      v52.super_class = (Class)UISearchTextField;
      [(UITextField *)&v52 clearButtonOffset];
      double v9 = v27 + v28;
      goto LABEL_12;
    }
    v29 = [(_UISearchTextFieldVisualStyle *)self->_visualStyle clearButtonInnerInset];

    if (!v29)
    {
      if (os_variant_has_internal_diagnostics())
      {
        double v47 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1853B0000, v47, OS_LOG_TYPE_FAULT, "clearButtonInnerInset unexpectedly nil. Interpreted as 0.", buf, 2u);
        }
      }
      else
      {
        double v46 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &clearButtonRectForBounds____s_category) + 8);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1853B0000, v46, OS_LOG_TYPE_ERROR, "clearButtonInnerInset unexpectedly nil. Interpreted as 0.", buf, 2u);
        }
      }
    }
    uint64_t v30 = [(_UISearchTextFieldVisualStyle *)self->_visualStyle clearButtonInnerInset];
    [v30 floatValue];

    v57.origin.CGFloat x = x;
    v57.origin.CGFloat y = y;
    v57.size.CGFloat width = width;
    v57.size.CGFloat height = height;
    double MinX = CGRectGetMinX(v57);
    UIRoundToViewScale(self);
    double v33 = round(MinX + v32);
    v50.receiver = self;
    v50.super_class = (Class)UISearchTextField;
    [(UITextField *)&v50 clearButtonOffset];
    double v35 = v33 + v34;
    v49.receiver = self;
    v49.super_class = (Class)UISearchTextField;
    [(UITextField *)&v49 _clearButtonPadX];
    double v9 = v35 - v36;
  }
  CGFloat v24 = v48;
LABEL_12:
  double v37 = [(UISearchTextField *)self _offsetValueForIcon:1];
  double v38 = v37;
  if (v37)
  {
    int v39 = *((_DWORD *)&self->super.super.super._viewFlags + 4);
    [v37 UIOffsetValue];
    if ((*(void *)&v39 & 0x80000) != 0) {
      double v40 = -v40;
    }
    double v9 = v9 + v40;
    double v11 = v11 + v41;
  }

  double v42 = v9;
  double v43 = v11;
  double v44 = v13;
  double v45 = v24;
  result.size.CGFloat height = v45;
  result.size.CGFloat width = v44;
  result.origin.CGFloat y = v43;
  result.origin.CGFloat x = v42;
  return result;
}

- (CGRect)_bookmarkViewRectForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(_UISearchTextFieldVisualStyle *)self->_visualStyle rightViewInset];
  double v9 = v8;
  [(_UISearchTextFieldVisualStyle *)self->_visualStyle rightViewInset];
  double v11 = v10;
  if ((*((_DWORD *)&self->super.super.super._viewFlags + 4) & 0x80000) != 0)
  {
    v41.receiver = self;
    double v12 = &selRef_leftViewRectForBounds_;
    CGFloat v13 = &v41;
  }
  else
  {
    double v40 = self;
    double v12 = &selRef_rightViewRectForBounds_;
    CGFloat v13 = (objc_super *)&v40;
  }
  v13->super_class = (Class)UISearchTextField;
  objc_msgSendSuper2(v13, *v12, x, y, width, height, v40);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20 + 0.0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
  double v23 = WeakRetained;
  if (WeakRetained && [WeakRetained showsSearchResultsButton])
  {
    int v24 = *((_DWORD *)&self->super.super.super._viewFlags + 4);
    [(_UISearchTextFieldVisualStyle *)self->_visualStyle searchResultsListButtonOffset];
    if ((*(void *)&v24 & 0x80000) != 0) {
      double v26 = -v25;
    }
    else {
      double v26 = v25;
    }
    double v21 = v21 + 0.5;
    uint64_t v27 = 3;
  }
  else
  {
    int v28 = *((_DWORD *)&self->super.super.super._viewFlags + 4);
    [(_UISearchTextFieldVisualStyle *)self->_visualStyle searchBookmarkButtonOffset];
    if ((*(void *)&v28 & 0x80000) != 0) {
      double v26 = -v29;
    }
    else {
      double v26 = v29;
    }
    uint64_t v27 = 2;
  }
  uint64_t v30 = [(UISearchTextField *)self _offsetValueForIcon:v27];
  uint64_t v31 = v30;
  double v32 = v9 + v15 - v26;
  if (v30)
  {
    int v33 = *((_DWORD *)&self->super.super.super._viewFlags + 4);
    [v30 UIOffsetValue];
    if ((*(void *)&v33 & 0x80000) != 0) {
      double v34 = -v34;
    }
    double v32 = v32 + v34;
    double v21 = v21 + v35;
  }

  double v36 = v32;
  double v37 = v21;
  double v38 = v17 - (v9 - v11);
  double v39 = v19;
  result.size.double height = v39;
  result.size.double width = v38;
  result.origin.double y = v37;
  result.origin.double x = v36;
  return result;
}

- (CGRect)_searchIconViewRectForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  -[UISearchTextField _adjustmentsForSearchIconViewRectForBounds:](self, "_adjustmentsForSearchIconViewRectForBounds:");
  double v9 = v8;
  double v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  if ([(UISearchTextField *)self _shouldCenterPlaceholder])
  {
    rect.origin.double y = v15;
    rect.size.double width = v13;
    int v16 = *((_DWORD *)&self->super.super.super._viewFlags + 4);
    -[UISearchTextField placeholderRectForBounds:](self, "placeholderRectForBounds:", x, y, width, height);
    rect.origin.double x = v20;
    if ((v16 & 0x80000) != 0)
    {
      CGFloat v35 = v17;
      CGFloat v36 = v18;
      CGFloat v37 = v19;
      *(void *)&rect.size.double height = self;
      double v51 = UISearchTextField;
      -[CGFloat rightViewRectForBounds:]((objc_super *)&rect.size.height, sel_rightViewRectForBounds_, x, y, width, height);
      [(UIView *)self _currentScreenScale];
      double v24 = v38;
      v53.origin.double x = rect.origin.x;
      v53.origin.double y = v35;
      v53.size.double width = v36;
      v53.size.double height = v37;
      double MaxX = CGRectGetMaxX(v53);
      double v39 = [(UITextField *)self _placeholderLabel];
      double v40 = [v39 text];
      uint64_t v41 = [v40 length];

      double v29 = -1.0;
      if (v41)
      {
        [(_UISearchTextFieldVisualStyle *)self->_visualStyle leftViewToPlaceholderCenteredMargin];
        double MaxX = MaxX + v42;
      }
    }
    else
    {
      v52.receiver = self;
      v52.super_class = (Class)UISearchTextField;
      -[UITextField leftViewRectForBounds:](&v52, sel_leftViewRectForBounds_, x, y, width, height);
      double v22 = v21;
      [(UIView *)self _currentScreenScale];
      double v24 = v23;
      [(_UISearchTextFieldVisualStyle *)self->_visualStyle leftViewToPlaceholderCenteredMargin];
      CGFloat v26 = rect.origin.x - v22 - v25;
      [(UITextField *)self paddingLeft];
      double MaxX = v26 + v27;
      double v29 = 1.0;
    }
    double v9 = UIRectIntegralWithScale(MaxX + v29 / v24, v11, rect.size.width, rect.origin.y, v24);
    double v11 = v43;
    CGFloat v13 = v44;
    CGFloat v15 = v45;
  }
  else
  {
    uint64_t v30 = [(UISearchTextField *)self _offsetValueForIcon:0];
    uint64_t v31 = v30;
    if (v30)
    {
      int v32 = *((_DWORD *)&self->super.super.super._viewFlags + 4);
      [v30 UIOffsetValue];
      if ((*(void *)&v32 & 0x80000) != 0) {
        double v33 = -v33;
      }
      double v9 = v9 + v33;
      double v11 = v11 + v34;
    }
  }
  double v46 = v9;
  double v47 = v11;
  double v48 = v13;
  double v49 = v15;
  result.size.double height = v49;
  result.size.double width = v48;
  result.origin.double y = v47;
  result.origin.double x = v46;
  return result;
}

- (id)_offsetValueForIcon:(int64_t)a3
{
  iconOffsets = self->_iconOffsets;
  id v4 = [NSNumber numberWithInteger:a3];
  double v5 = [(NSMutableDictionary *)iconOffsets objectForKey:v4];

  return v5;
}

- (BOOL)_shouldCenterPlaceholder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
  if (WeakRetained
    && (([(UISearchTextField *)self text],
         id v4 = objc_claimAutoreleasedReturnValue(),
         ![v4 length])
     && !self->_deferringFirstResponder
      ? (int v5 = ![(UITextField *)self _fieldEditorAttached])
      : (int v5 = 0),
        v4,
        [WeakRetained centerPlaceholder]))
  {
    int v6 = [WeakRetained _forceCenteredPlaceholderLayout] | v5;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (CGRect)_adjustmentsForSearchIconViewRectForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(_UISearchTextFieldVisualStyle *)self->_visualStyle leftViewInset];
  double v9 = v8;
  int v10 = *((_DWORD *)&self->super.super.super._viewFlags + 4);
  if ((v10 & 0x80000) != 0)
  {
    v33.receiver = self;
    double v11 = &selRef_rightViewRectForBounds_;
    double v12 = &v33;
  }
  else
  {
    int v32 = self;
    double v11 = &selRef_leftViewRectForBounds_;
    double v12 = (objc_super *)&v32;
  }
  v12->super_class = (Class)UISearchTextField;
  objc_msgSendSuper2(v12, *v11, x, y, width, height, v32);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  [(UIView *)self _currentScreenScale];
  double v22 = v21;
  int v23 = *((_DWORD *)&self->super.super.super._viewFlags + 4);
  [(_UISearchTextFieldVisualStyle *)self->_visualStyle leftViewInsetAddition];
  if ((*(void *)&v23 & 0x80000) != 0) {
    double v24 = -v24;
  }
  double v25 = -v9;
  if ((*(void *)&v10 & 0x80000) != 0) {
    double v26 = -v9;
  }
  else {
    double v26 = v9;
  }
  double v27 = v26 + v14;
  if ((*(void *)&v10 & 0x80000) != 0) {
    double v25 = v9;
  }
  double v28 = v18 - (v26 + v25);
  double v29 = v16 + 0.0 + -1.0 / v22;
  double v30 = v27 + v24;
  double v31 = v20;
  result.size.double height = v31;
  result.size.double width = v28;
  result.origin.double y = v29;
  result.origin.double x = v30;
  return result;
}

- (CGRect)textRectForBounds:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)UISearchTextField;
  -[UITextField textRectForBounds:](&v8, sel_textRectForBounds_);
  -[UISearchTextField _adjustedTextOrEditingRect:forBounds:](self, "_adjustedTextOrEditingRect:forBounds:");
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (CGRect)_availableTextRectForBounds:(CGRect)a3 forEditing:(BOOL)a4
{
  v21.receiver = self;
  v21.super_class = (Class)UISearchTextField;
  -[UITextField _availableTextRectForBounds:forEditing:](&v21, sel__availableTextRectForBounds_forEditing_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  if ([(UITextField *)self _hasSuffixField])
  {
    [(_UISearchTextFieldVisualStyle *)self->_visualStyle searchTextResultsPadding];
    double v14 = v13;
    [(UIView *)self _currentScreenScale];
    double v16 = v14 / v15 + -2.0;
    double v10 = v10 - v16;
    if ((*((_DWORD *)&self->super.super.super._viewFlags + 4) & 0x80000) == 0) {
      double v16 = -0.0;
    }
    double v6 = v6 + v16;
  }
  double v17 = v6;
  double v18 = v8;
  double v19 = v10;
  double v20 = v12;
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.double y = v18;
  result.origin.double x = v17;
  return result;
}

- (id)textInputTraits
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
  double v4 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = [WeakRetained textInputTraits];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UISearchTextField;
    uint64_t v5 = [(UITextField *)&v8 textInputTraits];
  }
  double v6 = (void *)v5;

  return v6;
}

- (void)_setMagnifyingGlassImage:(id)a3
{
  double v4 = (UIImage *)a3;
  if (!v4)
  {
    double v4 = +[UIImage systemImageNamed:@"magnifyingglass"];
  }
  magnifyingGlassImage = self->_magnifyingGlassImage;
  self->_magnifyingGlassImage = v4;

  [(UISearchTextField *)self _updateLeftViewForMagnifyingGlassImage];
}

+ (BOOL)_wantsFadedEdges
{
  return 1;
}

- (id)_clearButtonImageForState:(unint64_t)a3
{
  customClearButtons = self->_customClearButtons;
  double v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  double v7 = [(NSMutableDictionary *)customClearButtons objectForKey:v6];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
  double v9 = WeakRetained;
  if (!a3 && !v7 && WeakRetained != 0)
  {
    uint64_t v11 = 1;
    double v12 = [WeakRetained _colorForComponent:1 disabled:0];
    if (![(UITextField *)self _partsShouldBeMini])
    {
      if (UISearchBarUsesModernAppearance()) {
        uint64_t v11 = 3;
      }
      else {
        uint64_t v11 = 0;
      }
    }
    double v13 = [(UIView *)self tintColor];
    double v14 = [(UIView *)self traitCollection];
    double v7 = _GetTextFieldClearButtonWithCustomColorContrastSettings(0, v11, v12, v13, v14, 1, 0);

    if (!_TextFieldScalesClearButton()) {
      goto LABEL_18;
    }
    double v15 = [(UIView *)self traitCollection];
    uint64_t v16 = [v15 userInterfaceIdiom];

    if (v16 == 6) {
      goto LABEL_18;
    }
    double v17 = [(UITextField *)self font];
    double v18 = [(UIView *)self traitCollection];
    double v19 = [v18 preferredContentSizeCategory];
    if (UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v19))
    {
      if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v19, &cfstr_Uictcontentsiz_11.isa) != NSOrderedAscending)
      {
        uint64_t v20 = 1;
LABEL_17:

        objc_super v21 = +[UIImageSymbolConfiguration configurationWithFont:v17 scale:v20];
        uint64_t v22 = [v7 imageWithConfiguration:v21];

        double v7 = (void *)v22;
LABEL_18:

        goto LABEL_19;
      }
      UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v19, &cfstr_Uictcontentsiz_9.isa);
    }
    uint64_t v20 = 2;
    goto LABEL_17;
  }
LABEL_19:
  if (v7)
  {
    id v23 = v7;
  }
  else
  {
    v26.receiver = self;
    v26.super_class = (Class)UISearchTextField;
    id v23 = [(UITextField *)&v26 _clearButtonImageForState:a3];
  }
  double v24 = v23;

  return v24;
}

- (CGRect)placeholderRectForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([(UISearchTextField *)self _shouldCenterPlaceholder])
  {
    -[UITextField _availableTextRectExcludingButtonsForBounds:](self, "_availableTextRectExcludingButtonsForBounds:", x, y, width, height);
    double v9 = v8;
    double v50 = v10;
    double v12 = v11;
    double v14 = v13;
    v52.receiver = self;
    v52.super_class = (Class)UISearchTextField;
    double v15 = 0.0;
    if ([(UITextField *)&v52 _showsLeftView])
    {
      -[UISearchTextField _adjustmentsForSearchIconViewRectForBounds:](self, "_adjustmentsForSearchIconViewRectForBounds:", x, y, width, height);
      double v17 = v16 * 0.5;
      [(_UISearchTextFieldVisualStyle *)self->_visualStyle leftViewToPlaceholderCenteredMargin];
      double v15 = v17 + v18 * 0.5;
    }
    double v19 = [(UITextField *)self _placeholderLabel];
    double v20 = v12 - (v15 + v15);
    objc_msgSend(v19, "sizeThatFits:", v20, v14);
    if (v21 <= v20) {
      double v20 = v21;
    }

    [(UITextField *)self paddingLeft];
    double v23 = v15 + v12 * 0.5 - v20 * 0.5 - v22;
    double v24 = v23 - v9;
    double v25 = v9 + v23;
    double v26 = v12 - v24;
    [(UIView *)self _currentScreenScale];
    double v28 = UIRectIntegralWithScale(v25, v50, v26, v14, v27);
    double v30 = v29;
    double v32 = v31;
  }
  else
  {
    v51.receiver = self;
    v51.super_class = (Class)UISearchTextField;
    -[UITextField placeholderRectForBounds:](&v51, sel_placeholderRectForBounds_, x, y, width, height);
    double v28 = v33;
    double v30 = v34;
    double v36 = v35;
    double v32 = v37;
    double v38 = [(UITextField *)self _placeholderLabel];
    objc_msgSend(v38, "sizeThatFits:", v36, v32);
    if (v39 <= v36) {
      double v20 = v39;
    }
    else {
      double v20 = v36;
    }

    if ((*((_DWORD *)&self->super.super.super._viewFlags + 4) & 0x80000) != 0)
    {
      [(UITextField *)self paddingLeft];
      double v41 = v36 - v20 - v40;
      [(UITextField *)self paddingRight];
      double v28 = v28 + v41 - v42;
    }
  }
  [(UITextField *)self paddingLeft];
  double v44 = v20 + v43;
  [(UITextField *)self paddingRight];
  double v46 = v44 + v45;
  double v47 = v28;
  double v48 = v30;
  double v49 = v32;
  result.size.double height = v49;
  result.size.double width = v46;
  result.origin.double y = v48;
  result.origin.double x = v47;
  return result;
}

- (void)_didSetFont:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)UISearchTextField;
  [(UITextField *)&v17 _didSetFont:v4];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = self->_knownTokenLayoutViews;
  uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v9), "delegateView", (void)v13);
        [v10 setAtomFont:v4];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v7);
  }

  [(UISearchTextField *)self _updateDefaultLeftViewForFont:v4];
  if ([(UISearchTextField *)self _ignoresDynamicType])
  {
    double v11 = +[UIImageSymbolConfiguration unspecifiedConfiguration];
    double v12 = [v11 _configurationIgnoringDynamicType];
    [(UIImageView *)self->_defaultLeftView _setOverridingSymbolConfiguration:v12];
  }
  else
  {
    [(UIImageView *)self->_defaultLeftView _setOverridingSymbolConfiguration:0];
  }
  if ([(UISearchTextField *)self _supportsDynamicType])
  {
    [(UISearchTextField *)self _updateLeftViewForMagnifyingGlassImage];
    [(UISearchTextField *)self _updateAlphaForMagnifyingGlass];
  }
}

- (void)_setIgnoresDynamicType:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v5 = +[UIImageSymbolConfiguration unspecifiedConfiguration];
    uint64_t v6 = [v5 _configurationIgnoringDynamicType];
  }
  else
  {
    uint64_t v6 = 0;
  }
  [(UIImageView *)self->_defaultLeftView _setOverridingSymbolConfiguration:v6];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = self->_knownTokenLayoutViews;
  uint64_t v8 = [(NSHashTable *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    BOOL v11 = !v3;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "delegateView", (void)v16);
        long long v14 = [v13 leadingImage];
        [v14 _setOverridingSymbolConfiguration:v6];

        long long v15 = [v13 textLabel];
        [v15 setAdjustsFontForContentSizeCategory:v11];
      }
      uint64_t v9 = [(NSHashTable *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
}

- (void)_updateDefaultLeftViewForFont:(id)a3
{
  id v9 = a3;
  BOOL v4 = -[UISearchTextField _scalesMagnifyingGlassForDynamicTypeWithFont:](self, "_scalesMagnifyingGlassForDynamicTypeWithFont:");
  if (!v4)
  {
    uint64_t v8 = +[UIImageSymbolConfiguration configurationWithFont:v9];
    goto LABEL_9;
  }
  uint64_t v5 = [(UIView *)self traitCollection];
  uint64_t v6 = [v5 preferredContentSizeCategory];
  if (!UIContentSizeCategoryIsAccessibilityCategory(v6)) {
    goto LABEL_7;
  }
  if (UIContentSizeCategoryCompareToCategory(v6, &cfstr_Uictcontentsiz_11.isa) == NSOrderedAscending)
  {
    UIContentSizeCategoryCompareToCategory(v6, &cfstr_Uictcontentsiz_9.isa);
LABEL_7:
    uint64_t v7 = 2;
    goto LABEL_8;
  }
  uint64_t v7 = 1;
LABEL_8:

  uint64_t v8 = +[UIImageSymbolConfiguration configurationWithFont:v9 scale:v7];

LABEL_9:
  [(UIImageView *)self->_defaultLeftView setPreferredSymbolConfiguration:v8];
  [(UIView *)self->_defaultLeftView setShowsLargeContentViewer:!v4];
}

- (void)_updateAlphaForMagnifyingGlass
{
  if (![(UISearchTextField *)self _shouldHideMagnifyingGlassWhenEditingOrHasContent]|| (BOOL v4 = [(UISearchTextField *)self _isEditingOrHasContent], v3 = 0.0, !v4))
  {
    [(UITextField *)self _foregroundViewsAlpha];
  }
  defaultLeftView = self->_defaultLeftView;
  [(UIView *)defaultLeftView setAlpha:v3];
}

- (BOOL)_ignoresDynamicType
{
  v2 = [(UIImageView *)self->_defaultLeftView _overridingSymbolConfiguration];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)_initWithFrame:(CGRect)a3 textLayoutManagerEnabled:(BOOL)a4 defersSearchImageConfiguration:(BOOL)a5
{
  v18.receiver = self;
  v18.super_class = (Class)UISearchTextField;
  id v6 = -[UITextField _initWithFrame:textLayoutManagerEnabled:](&v18, sel__initWithFrame_textLayoutManagerEnabled_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v7 = v6;
  if (v6)
  {
    CommonStyleRegistration(v6);
    uint64_t v8 = +[_UIVisualStyleRegistry registryForTraitEnvironment:v7];
    id v9 = (objc_class *)[v8 visualStyleClassForView:v7];

    uint64_t v10 = [[v9 alloc] initWithInstance:v7];
    BOOL v11 = (void *)*((void *)v7 + 143);
    *((void *)v7 + 143) = v10;

    double v12 = objc_alloc_init(UIImageView);
    long long v13 = (void *)*((void *)v7 + 136);
    *((void *)v7 + 136) = v12;

    long long v14 = [v7 font];
    [v7 _updateDefaultLeftViewForFont:v14];

    long long v15 = [*((id *)v7 + 143) defaultLeftViewTintColor];
    [*((id *)v7 + 136) setTintColor:v15];

    long long v16 = _UINSLocalizedStringWithDefaultValue(@"Search", @"Search");
    [*((id *)v7 + 136) setLargeContentTitle:v16];

    if (!a5) {
      [v7 _setMagnifyingGlassImage:0];
    }
    [v7 setLeftView:*((void *)v7 + 136)];
    [v7 setLeftViewMode:3];
    [v7 setClearButtonMode:1];
    [v7 setBorderStyle:3];
    if (UISearchBarUsesModernAppearance())
    {
      [*((id *)v7 + 143) backgroundCornerRadius];
      objc_msgSend(v7, "_setRoundedRectBackgroundCornerRadius:");
    }
    *((unsigned char *)v7 + 1112) |= 3u;
    CommonInit(v7);
  }
  return v7;
}

- (UISearchBar)_searchBar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
  return (UISearchBar *)WeakRetained;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)UISearchTextField;
  [(UITextField *)&v3 layoutSubviews];
  if ([(UISearchTextField *)self _shouldHideMagnifyingGlassWhenEditingOrHasContent])
  {
    [(UISearchTextField *)self _updateAlphaForMagnifyingGlass];
  }
}

- (void)_updateLeftViewForMagnifyingGlassImage
{
  id v6 = self->_magnifyingGlassImage;
  if ([(UISearchTextField *)self _supportsDynamicType])
  {
    if ([(UISearchTextField *)self _alwaysHidesMagnifyingGlassForAccessibilityContentSizeCategory])
    {
      objc_super v3 = [(UIView *)self traitCollection];
      BOOL v4 = [v3 preferredContentSizeCategory];
      IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v4);

      if (IsAccessibilityCategory)
      {

        id v6 = 0;
      }
    }
  }
  [(UIImageView *)self->_defaultLeftView setImage:v6];
  [(UIView *)self->_defaultLeftView sizeToFit];
}

- (BOOL)_alwaysHidesMagnifyingGlassForAccessibilityContentSizeCategory
{
  return (*((unsigned __int8 *)&self->_searchBarTextFieldFlags + 12) >> 2) & 1;
}

- (void)setText:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)UISearchTextField;
  [(UITextField *)&v6 setText:v4];
  if (dyld_program_sdk_at_least())
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
    [WeakRetained _updateForNewSearchFieldText:v4];
  }
}

- (_NSRange)_rangeForSetText
{
  NSUInteger v2 = [(_UISearchBarTextFieldTokenCounter *)self->_tokenCounter characterRangeOfTextAfterLastToken];
  result.length = v3;
  result.location = v2;
  return result;
}

- (void)_setBackgroundViewsAlpha:(double)a3
{
  -[UIView setAlpha:](self->_effectBackgroundTop, "setAlpha:");
  effectBackgroundBottom = self->_effectBackgroundBottom;
  [(UIView *)effectBackgroundBottom setAlpha:a3];
}

- (double)_placeholderLabelAlphaForForegroundViewsAlpha:(double)a3
{
  BOOL v4 = [(UIControl *)self isEnabled];
  double result = a3 * 0.35;
  if (v4) {
    return a3;
  }
  return result;
}

- (double)_maximumAlphaForLeadingView
{
  NSUInteger v3 = [(UITextField *)self leftView];
  if (v3 != self->_defaultLeftView
    || ![(UISearchTextField *)self _shouldHideMagnifyingGlassWhenEditingOrHasContent])
  {

    goto LABEL_6;
  }
  BOOL v4 = [(UISearchTextField *)self _isEditingOrHasContent];

  double result = 0.0;
  if (!v4)
  {
LABEL_6:
    v6.receiver = self;
    v6.super_class = (Class)UISearchTextField;
    [(UITextField *)&v6 _maximumAlphaForLeadingView];
  }
  return result;
}

- (void)willMoveToWindow:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UISearchTextField;
  id v4 = a3;
  [(UITextField *)&v6 willMoveToWindow:v4];
  uint64_t v5 = [(UISearchTextField *)self _suggestionController];
  [v5 searchTextFieldWillMoveToWindow:v4];
}

- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)UISearchTextField;
  -[UITextField _didMoveFromWindow:toWindow:](&v8, sel__didMoveFromWindow_toWindow_, a3);
  objc_super v6 = [(UISearchTextField *)self _suggestionController];
  -[UIView _removeGeometryChangeObserver:](self, v6);

  if (a4)
  {
    id v7 = [(UISearchTextField *)self _suggestionController];
    -[UIView _addGeometryChangeObserver:](self, v7);
  }
}

- (_UISearchSuggestionControllerIOSBase)_suggestionController
{
  return self->_suggestionController;
}

- (int64_t)_preferredRenderingModeForPlaceholder
{
  return 1;
}

- (Class)_placeholderLabelClass
{
  return (Class)objc_opt_class();
}

- (id)_placeholderColor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
  id v4 = WeakRetained;
  if (!WeakRetained
    || ([WeakRetained _colorForComponent:3 disabled:0],
        (uint64_t v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v7.receiver = self;
    v7.super_class = (Class)UISearchTextField;
    uint64_t v5 = [(UITextField *)&v7 _placeholderColor];
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenForegroundColor, 0);
  objc_storeStrong((id *)&self->_tokenBackgroundColor, 0);
  objc_storeStrong((id *)&self->_suggestionController, 0);
  objc_destroyWeak((id *)&self->_searchBar);
  objc_storeStrong((id *)&self->_magnifyingGlassImage, 0);
  objc_storeStrong((id *)&self->_hoverGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_visualStyle, 0);
  objc_storeStrong((id *)&self->_tokenTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tokenCounter, 0);
  objc_storeStrong((id *)&self->_knownTokenLayoutViews, 0);
  objc_storeStrong((id *)&self->_defaultLeftView, 0);
  objc_storeStrong((id *)&self->_effectBackgroundBottom, 0);
  objc_storeStrong((id *)&self->_effectBackgroundTop, 0);
  objc_storeStrong((id *)&self->_searchTextOffsetValue, 0);
  objc_storeStrong((id *)&self->_iconOffsets, 0);
  objc_storeStrong((id *)&self->_customClearButtons, 0);
}

+ (NSCopying)visualStyleRegistryIdentity
{
  return (NSCopying *)@"UISearchTextField";
}

- (BOOL)_shouldSuppressSelectionHandles
{
  NSUInteger v3 = [(_UISearchBarTextFieldTokenCounter *)self->_tokenCounter tokenCharacterIndexes];
  if ([v3 count] == 1)
  {
    [(_UISearchBarTextFieldTokenCounter *)self->_tokenCounter characterRangeOfTextAfterLastToken];
    BOOL v5 = v4 == 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)tintColorDidChange
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
  if (WeakRetained)
  {
    uint64_t v4 = [(UIView *)self superview];
    if (v4)
    {
      BOOL v5 = (void *)v4;
      while (1)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        uint64_t v6 = [v5 superview];

        BOOL v5 = (void *)v6;
        if (!v6) {
          goto LABEL_6;
        }
      }
    }
    else
    {
LABEL_6:
      [WeakRetained tintColorDidChange];
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)UISearchTextField;
  [(UITextField *)&v7 tintColorDidChange];
}

- (void)_setAnimatesBackgroundCornerRadius:(BOOL)a3
{
  BOOL v3 = a3;
  -[_UITextFieldRoundedRectBackgroundViewNeue setHasFlexibleCornerRadius:](self->_effectBackgroundTop, "setHasFlexibleCornerRadius:");
  effectBackgroundBottom = self->_effectBackgroundBottom;
  [(_UITextFieldRoundedRectBackgroundViewNeue *)effectBackgroundBottom setHasFlexibleCornerRadius:v3];
}

- (void)updateForBackdropStyle:(int64_t)a3
{
  BOOL v5 = [(UIView *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if (v6 == 3)
  {
    [(UIView *)self->_effectBackgroundBottom removeFromSuperview];
    effectBackgroundBottom = self->_effectBackgroundBottom;
    self->_effectBackgroundBottom = 0;

    [(UIView *)self->_effectBackgroundTop removeFromSuperview];
    effectBackgroundTop = self->_effectBackgroundTop;
    self->_effectBackgroundTop = 0;
LABEL_3:

    return;
  }
  if (a3 == 2020)
  {
    double v12 = self->_effectBackgroundBottom;
    if (v12)
    {
      [(UIView *)v12 removeFromSuperview];
      long long v13 = self->_effectBackgroundBottom;
      self->_effectBackgroundBottom = 0;
    }
    uint64_t v14 = *MEMORY[0x1E4F3A2E0];
    if (self->_effectBackgroundTop)
    {
      BOOL v11 = self;
      goto LABEL_41;
    }
    long long v16 = self;
    uint64_t v17 = 2020;
    goto LABEL_23;
  }
  if (a3 != 2005)
  {
    if (a3 != 2030)
    {
      if (a3 == 2010) {
        goto LABEL_20;
      }
      if (a3 != 2) {
        return;
      }
      if (UISearchBarUsesModernAppearance()) {
LABEL_20:
      }
        long long v15 = (id *)MEMORY[0x1E4F3A2C8];
      else {
        long long v15 = (id *)MEMORY[0x1E4F3A008];
      }
      float v22 = (_UISearchBarSearchFieldBackgroundView *)*v15;
      double v23 = self->_effectBackgroundBottom;
      double v31 = v22;
      if (v23)
      {
        [(UISearchTextField *)self _updateBackgroundView:v23 withStyle:a3 filter:v22];
      }
      else
      {
        double v24 = [(UISearchTextField *)self _createEffectsBackgroundViewWithStyle:a3 applyFilter:v22];
        double v25 = self->_effectBackgroundBottom;
        self->_effectBackgroundBottom = v24;
      }
      double v26 = self->_effectBackgroundTop;
      if (v26)
      {
        [(UISearchTextField *)self _updateBackgroundView:v26 withStyle:a3 filter:*MEMORY[0x1E4F3A2E0]];
      }
      else
      {
        double v27 = [(UISearchTextField *)self _createEffectsBackgroundViewWithStyle:a3 applyFilter:*MEMORY[0x1E4F3A2E0]];
        double v28 = self->_effectBackgroundTop;
        self->_effectBackgroundTop = v27;
      }
      [(UIView *)self->_effectBackgroundBottom setHidden:a3 == 2];
      effectBackgroundTop = v31;
      goto LABEL_3;
    }
    uint64_t v21 = self->_effectBackgroundBottom;
    if (v21)
    {
      [(UISearchTextField *)self _updateBackgroundView:v21 withStyle:2030 filter:*MEMORY[0x1E4F3A2C8]];
    }
    else
    {
      double v29 = [(UISearchTextField *)self _createEffectsBackgroundViewWithStyle:2030 applyFilter:*MEMORY[0x1E4F3A2C8]];
      double v30 = self->_effectBackgroundBottom;
      self->_effectBackgroundBottom = v29;
    }
    uint64_t v14 = *MEMORY[0x1E4F3A2E8];
    if (self->_effectBackgroundTop)
    {
      BOOL v11 = self;
      goto LABEL_41;
    }
    long long v16 = self;
    uint64_t v17 = 2030;
LABEL_23:
    uint64_t v18 = v14;
    goto LABEL_24;
  }
  id v9 = self->_effectBackgroundBottom;
  if (v9)
  {
    [(UIView *)v9 removeFromSuperview];
    uint64_t v10 = self->_effectBackgroundBottom;
    self->_effectBackgroundBottom = 0;
  }
  if (self->_effectBackgroundTop)
  {
    BOOL v11 = self;
LABEL_41:
    -[UISearchTextField _updateBackgroundView:withStyle:filter:](v11, "_updateBackgroundView:withStyle:filter:");
    return;
  }
  long long v16 = self;
  uint64_t v17 = 2005;
  uint64_t v18 = 0;
LABEL_24:
  long long v19 = [(UISearchTextField *)v16 _createEffectsBackgroundViewWithStyle:v17 applyFilter:v18];
  double v20 = self->_effectBackgroundTop;
  self->_effectBackgroundTop = v19;
}

- (void)_updateBackgroundView:(id)a3 withStyle:(int64_t)a4 filter:(id)a5
{
  objc_super v7 = (void *)MEMORY[0x1E4F39BC0];
  id v10 = a3;
  objc_super v8 = [v7 filterWithType:a5];
  id v9 = [v10 layer];
  [v9 setCompositingFilter:v8];

  [v10 setSearchBarStyle:a4];
}

- (id)_createEffectsBackgroundViewWithStyle:(int64_t)a3 applyFilter:(id)a4
{
  id v6 = a4;
  objc_super v7 = [(UITextField *)self _systemBackgroundView];
  objc_super v8 = [_UISearchBarSearchFieldBackgroundView alloc];
  [v7 bounds];
  long long v13 = -[_UISearchBarSearchFieldBackgroundView initWithFrame:active:updateView:](v8, "initWithFrame:active:updateView:", [(UIControl *)self isEnabled], 0, v9, v10, v11, v12);
  [v7 cornerRadius];
  -[_UISearchBarSearchFieldBackgroundView setCornerRadius:](v13, "setCornerRadius:");
  [(UISearchTextField *)self _updateBackgroundView:v13 withStyle:a3 filter:v6];

  -[_UISearchBarSearchFieldBackgroundView setBarStyle:](v13, "setBarStyle:", [v7 barStyle]);
  [v7 addSubview:v13];

  return v13;
}

- (Class)_canvasViewClass
{
  return (Class)objc_opt_class();
}

- (id)_initWithDeferredSearchIconImageConfiguration
{
  uint64_t v3 = [(id)objc_opt_class() _isTextLayoutManagerEnabled];
  double v4 = *MEMORY[0x1E4F28AD8];
  double v5 = *(double *)(MEMORY[0x1E4F28AD8] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F28AD8] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F28AD8] + 24);
  return -[UISearchTextField _initWithFrame:textLayoutManagerEnabled:defersSearchImageConfiguration:](self, "_initWithFrame:textLayoutManagerEnabled:defersSearchImageConfiguration:", v3, 1, v4, v5, v6, v7);
}

- (void)setDelegate:(id)a3
{
  uint64_t v3 = self;
  v5.receiver = self;
  v5.super_class = (Class)UISearchTextField;
  [(UITextField *)&v5 setDelegate:a3];
  double v4 = [(UITextField *)v3 delegate];
  uint64_t v3 = (UISearchTextField *)((char *)v3 + 1100);
  HIDWORD(v3->super.super.super.super.super.isa) = objc_opt_respondsToSelector() & 1;
  v3->super.super.super.super._responderFlags = ($0DEEFAF911E6A3949FD65CD0DF2CED26)(objc_opt_respondsToSelector() & 1);
}

- (void)_setOffsetValue:(id)a3 forIcon:(int64_t)a4
{
  id v12 = a3;
  double v6 = [NSNumber numberWithInteger:a4];
  uint64_t v7 = [(NSMutableDictionary *)self->_iconOffsets objectForKey:v6];
  objc_super v8 = (void *)v7;
  if (v12 && v7)
  {
    if ([v12 isEqualToValue:v7]) {
      goto LABEL_12;
    }
  }
  else if ((v12 != 0) == (v7 != 0))
  {
    goto LABEL_12;
  }
  iconOffsets = self->_iconOffsets;
  if (!iconOffsets)
  {
    double v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    double v11 = self->_iconOffsets;
    self->_iconOffsets = v10;

    iconOffsets = self->_iconOffsets;
  }
  if (v12) {
    [(NSMutableDictionary *)iconOffsets setObject:v12 forKey:v6];
  }
  else {
    [(NSMutableDictionary *)iconOffsets removeObjectForKey:v6];
  }
  [(UITextField *)self setNeedsLayout];
LABEL_12:
}

- (void)searchSuggestionController:(id)a3 didSelectSuggestion:(id)a4 atIndexPath:(id)a5
{
  id v7 = a4;
  if (self->_suggestionController == a3)
  {
    id v12 = v7;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
    double v9 = [WeakRetained _searchController];

    if (v9)
    {
      double v10 = objc_loadWeakRetained((id *)&self->_searchBar);
      double v11 = [v10 _searchController];
      [v11 _searchBarTextFieldDidSelectSearchSuggestion:v12];
    }
    else
    {
      double v10 = [(UITextField *)self delegate];
      if (objc_opt_respondsToSelector())
      {
        [v10 searchTextField:self didSelectSuggestion:v12];
      }
      else if (objc_opt_respondsToSelector())
      {
        objc_msgSend(v10, "_dci_searchTextField:didSelectSuggestion:", self, v12);
      }
      [(UISearchTextField *)self _dci_setSearchSuggestions:0];
      *((unsigned char *)&self->_searchBarTextFieldFlags + 12) |= 0x10u;
    }

    id v7 = v12;
  }
}

- (void)_suggestionsMenuInteractionWillEndWithAnimator:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
  double v6 = [WeakRetained _searchController];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"UISearchTextField.m" lineNumber:184 description:@"Should only be called on standalone searchBar or searchTextField. This is an internal UIKit bug"];
  }
  id v8 = [(UITextField *)self delegate];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v8, "_dci_searchTextField:willDismissSearchSuggestionsMenuWasSuggestionSelected:", self, (*((unsigned __int8 *)&self->_searchBarTextFieldFlags + 12) >> 4) & 1);
  }
  if ((*((unsigned char *)&self->_searchBarTextFieldFlags + 12) & 0x10) == 0) {
    *((unsigned char *)&self->_searchBarTextFieldFlags + 12) |= 0x20u;
  }
}

- (void)_setDeferredSearchSuggestions:(id)a3
{
}

- (id)_deferredSearchSuggestions
{
  return objc_getAssociatedObject(self, &_UISearchTextFieldDeferredSuggestions);
}

- (void)setSearchSuggestions:(NSArray *)searchSuggestions
{
  double v11 = searchSuggestions;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
  objc_super v5 = [WeakRetained _searchController];

  if (v5)
  {
    double v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    id v8 = objc_loadWeakRetained((id *)&self->_searchBar);
    double v9 = [v8 _searchController];
    [v6 raise:v7, @"Please set suggestions on the associated searchController instead. self = %@, searchController = %@", self, v9 format];
  }
  *((unsigned char *)&self->_searchBarTextFieldFlags + 12) &= 0xCFu;
  if (v11 && ![(UITextField *)self isEditing])
  {
    [(UISearchTextField *)self _setDeferredSearchSuggestions:v11];
  }
  else
  {
    [(UISearchTextField *)self _setDeferredSearchSuggestions:0];
    double v10 = [(UISearchTextField *)self _suggestionController];
    [v10 updateSuggestions:v11 userInitiated:1];
  }
}

- (NSArray)searchSuggestions
{
  NSUInteger v2 = [(UISearchTextField *)self _suggestionController];
  uint64_t v3 = [v2 suggestions];

  return (NSArray *)v3;
}

- (NSArray)_dci_suggestionsMenuDismissalPassthroughViews
{
  return 0;
}

- (id)_initWithFrame:(CGRect)a3 textLayoutManagerEnabled:(BOOL)a4
{
  return -[UISearchTextField _initWithFrame:textLayoutManagerEnabled:defersSearchImageConfiguration:](self, "_initWithFrame:textLayoutManagerEnabled:defersSearchImageConfiguration:", a4, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)UISearchTextField;
  [(UITextField *)&v6 encodeWithCoder:v4];
  [v4 encodeBool:*((unsigned char *)&self->_searchBarTextFieldFlags + 12) & 1 forKey:@"UIAllowsCopyingTokens"];
  [v4 encodeBool:(*((unsigned __int8 *)&self->_searchBarTextFieldFlags + 12) >> 1) & 1 forKey:@"UIAllowsDeletingTokens"];
  tokenBackgroundColor = self->_tokenBackgroundColor;
  if (tokenBackgroundColor) {
    [v4 encodeObject:tokenBackgroundColor forKey:@"UITokenBackgroundColor"];
  }
}

- (UISearchTextField)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)UISearchTextField;
  objc_super v5 = [(UITextField *)&v15 initWithCoder:v4];
  objc_super v6 = v5;
  if (v5)
  {
    CommonStyleRegistration(v5);
    uint64_t v7 = +[_UIVisualStyleRegistry registryForTraitEnvironment:v6];
    id v8 = (objc_class *)[v7 visualStyleClassForView:v6];

    uint64_t v9 = [[v8 alloc] initWithInstance:v6];
    visualStyle = v6->_visualStyle;
    v6->_visualStyle = (_UISearchTextFieldVisualStyle *)v9;

    CommonInit(v6);
    if ([v4 containsValueForKey:@"UIAllowsCopyingTokens"]) {
      *((unsigned char *)&v6->_searchBarTextFieldFlags + 12) = *((unsigned char *)&v6->_searchBarTextFieldFlags + 12) & 0xFE | [v4 decodeBoolForKey:@"UIAllowsCopyingTokens"];
    }
    if ([v4 containsValueForKey:@"UIAllowsDeletingTokens"])
    {
      if ([v4 decodeBoolForKey:@"UIAllowsDeletingTokens"]) {
        char v11 = 2;
      }
      else {
        char v11 = 0;
      }
      *((unsigned char *)&v6->_searchBarTextFieldFlags + 12) = *((unsigned char *)&v6->_searchBarTextFieldFlags + 12) & 0xFD | v11;
    }
    if ([v4 containsValueForKey:@"UITokenBackgroundColor"])
    {
      uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UITokenBackgroundColor"];
      tokenBackgroundColor = v6->_tokenBackgroundColor;
      v6->_tokenBackgroundColor = (UIColor *)v12;
    }
  }

  return v6;
}

- (CGSize)intrinsicContentSize
{
  if ([(_UISearchTextFieldVisualStyle *)self->_visualStyle usesCustomIntrinsicSize])
  {
    [(_UISearchTextFieldVisualStyle *)self->_visualStyle defaultHeight];
    double v4 = v3;
    double v5 = -1.0;
    if ([(UISearchTextField *)self _supportsDynamicType])
    {
      objc_super v6 = [(UITextField *)self font];
      [v6 _scaledValueForValue:v4];
      UIRoundToViewScale(self);
      double v4 = v7;
    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)UISearchTextField;
    [(UIView *)&v12 intrinsicContentSize];
    double v5 = v8;
    double v4 = v9;
  }
  double v10 = v5;
  double v11 = v4;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (BOOL)canBecomeFocused
{
  NSUInteger v2 = [(UIView *)self _focusBehavior];
  char v3 = [v2 searchBarTextFieldCanBecomeFocused];

  return v3;
}

- (void)_setClearButtonImage:(id)a3 forState:(unint64_t)a4
{
  id v16 = a3;
  customClearButtons = self->_customClearButtons;
  if (!customClearButtons)
  {
    double v7 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
    double v8 = self->_customClearButtons;
    self->_customClearButtons = v7;

    customClearButtons = self->_customClearButtons;
  }
  double v9 = [NSNumber numberWithUnsignedInteger:a4];
  id v10 = [(NSMutableDictionary *)customClearButtons objectForKey:v9];

  if (v16)
  {
    if (v10) {
      BOOL v11 = v10 == v16;
    }
    else {
      BOOL v11 = 0;
    }
    if (v11) {
      goto LABEL_11;
    }
    objc_super v12 = self->_customClearButtons;
    long long v13 = [NSNumber numberWithUnsignedInteger:a4];
    [(NSMutableDictionary *)v12 setObject:v16 forKey:v13];
  }
  else
  {
    uint64_t v14 = self->_customClearButtons;
    long long v13 = [NSNumber numberWithUnsignedInteger:a4];
    [(NSMutableDictionary *)v14 removeObjectForKey:v13];
  }

  objc_super v15 = [(UITextField *)self _clearButton];
  [v15 setImage:0 forState:0];

  [(UITextField *)self _updateButtons];
LABEL_11:
}

- (BOOL)_hasCustomClearButtonImage
{
  return [(NSMutableDictionary *)self->_customClearButtons count] != 0;
}

- (void)_setSearchTextOffetValue:(id)a3
{
  id v5 = a3;
  objc_super v6 = v5;
  searchTextOffsetValue = self->_searchTextOffsetValue;
  id v9 = v5;
  if (!v5)
  {
    if (!searchTextOffsetValue) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if (!searchTextOffsetValue
    || (v8 = objc_msgSend(v5, "isEqualToValue:"), objc_super v6 = v9, !v8)
    || !self->_searchTextOffsetValue)
  {
LABEL_7:
    objc_storeStrong((id *)&self->_searchTextOffsetValue, a3);
    [(UITextField *)self setNeedsLayout];
    objc_super v6 = v9;
  }
LABEL_8:
}

- (NSValue)_searchTextOffsetValue
{
  return self->_searchTextOffsetValue;
}

- (BOOL)_shouldResignOnEditingDidEndOnExit
{
  return 0;
}

- (BOOL)_shouldIgnoreBaseWritingDirectionChanges
{
  return 1;
}

- (void)_updateHelpMessageOverrideWithMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(UISearchTextField *)self _searchBar];
  [v5 _setHelperPlaceholderOverride:v4];
}

- (void)_updateColorForMagnifyingGlass
{
  BOOL v3 = [(UISearchTextField *)self _hasContent];
  visualStyle = self->_visualStyle;
  if (v3) {
    [(_UISearchTextFieldVisualStyle *)visualStyle filledLeftViewTintColor];
  }
  else {
  id v5 = [(_UISearchTextFieldVisualStyle *)visualStyle defaultLeftViewTintColor];
  }
  [(UIView *)self->_defaultLeftView setTintColor:v5];
}

- (BOOL)_isEditingOrHasContent
{
  if ([(UITextField *)self isEditing]) {
    return 1;
  }
  return [(UISearchTextField *)self _hasContent];
}

- (CGSize)_clearButtonSize
{
  BOOL v3 = [(NSMutableDictionary *)self->_customClearButtons objectForKey:&unk_1ED3F3408];
  id v4 = v3;
  if (v3)
  {
    [v3 size];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)UISearchTextField;
    [(UISearchTextField *)&v11 _clearButtonSize];
  }
  double v7 = v5;
  double v8 = v6;

  double v9 = v7;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (BOOL)_becomeFirstResponderWhenPossible
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
  id v4 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_9;
  }
  id v5 = WeakRetained;
  double v6 = [v5 _searchController];
  if (!v6)
  {
    double v9 = [v5 controller];
    if (v9)
    {
      double v10 = v9;
      int v11 = [v9 isActive];

      if (!v11) {
        goto LABEL_7;
      }
    }
    else
    {
    }
LABEL_9:
    v14.receiver = self;
    v14.super_class = (Class)UISearchTextField;
    BOOL v12 = [(UIView *)&v14 _becomeFirstResponderWhenPossible];
    goto LABEL_10;
  }
  double v7 = v6;
  char v8 = [v6 isActive];

  if (v8) {
    goto LABEL_9;
  }
LABEL_7:
  BOOL v12 = 0;
LABEL_10:

  return v12;
}

- (BOOL)_shouldSendContentChangedNotificationsIfOnlyMarkedTextChanged
{
  if (*(unsigned char *)&self->_searchBarTextFieldFlags)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
    char v6 = [WeakRetained _shouldSendContentChangedNotificationsIfOnlyMarkedTextChanged];

    LOBYTE(v2) = v6;
  }
  else
  {
    int v2 = dyld_program_sdk_at_least();
    if (v2)
    {
      if (_UIInternalPreferencesRevisionOnce != -1) {
        dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
      }
      int v3 = _UIInternalPreferencesRevisionVar;
      if (_UIInternalPreferencesRevisionVar < 1
        || (int v7 = _UIInternalPreference_UISearchTextFieldShouldSendContentChangeNotificationsForMarkedText,
            _UIInternalPreferencesRevisionVar == _UIInternalPreference_UISearchTextFieldShouldSendContentChangeNotificationsForMarkedText))
      {
        BOOL v4 = 1;
      }
      else
      {
        do
        {
          BOOL v4 = v3 >= v7;
          if (v3 < v7) {
            break;
          }
          _UIInternalPreferenceSync(v3, &_UIInternalPreference_UISearchTextFieldShouldSendContentChangeNotificationsForMarkedText, @"UISearchTextFieldShouldSendContentChangeNotificationsForMarkedText", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
          int v7 = _UIInternalPreference_UISearchTextFieldShouldSendContentChangeNotificationsForMarkedText;
        }
        while (v3 != _UIInternalPreference_UISearchTextFieldShouldSendContentChangeNotificationsForMarkedText);
      }
      if (byte_1E8FD4F94) {
        LOBYTE(v2) = 1;
      }
      else {
        LOBYTE(v2) = v4;
      }
    }
  }
  return v2;
}

- (CGRect)_suffixFrame
{
  v18.receiver = self;
  v18.super_class = (Class)UISearchTextField;
  [(UITextField *)&v18 _suffixFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  [(UIView *)self bounds];
  v17.receiver = self;
  v17.super_class = (Class)UISearchTextField;
  -[UITextField _availableTextRectForBounds:forEditing:](&v17, sel__availableTextRectForBounds_forEditing_, [(UITextField *)self isEditing], v9, v10, v11, v12);
  double MaxX = CGRectGetMaxX(v19);
  double v14 = v4;
  double v15 = v6;
  double v16 = v8;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.double y = v14;
  result.origin.double x = MaxX;
  return result;
}

- (int64_t)_suffixLabelTextAlignment
{
  return 2;
}

- (void)_highlightedDidChangeAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UISearchTextField;
  -[UITextField _highlightedDidChangeAnimated:](&v5, sel__highlightedDidChangeAnimated_);
  [(UISearchTextField *)self __highlightedDidChangeAnimated:v3];
}

- (void)_applyHighlightedAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UISearchTextField;
  -[UITextField _applyHighlightedAnimated:](&v5, sel__applyHighlightedAnimated_);
  [(UISearchTextField *)self __highlightedDidChangeAnimated:v3];
}

- (void)__highlightedDidChangeAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(UIControl *)self isHighlighted];
  double v6 = 0.3;
  v7[1] = 3221225472;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[2] = __52__UISearchTextField___highlightedDidChangeAnimated___block_invoke;
  v7[3] = &unk_1E52D9FC0;
  if (!v3) {
    double v6 = 0.0;
  }
  v7[4] = self;
  BOOL v8 = v5;
  +[UIView animateWithDuration:v7 animations:v6];
}

uint64_t __52__UISearchTextField___highlightedDidChangeAnimated___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1072) setShowingTouch:*(unsigned __int8 *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 1080) setShowingTouch:*(unsigned __int8 *)(a1 + 40)];
  BOOL v2 = (unint64_t)([*(id *)(*(void *)(a1 + 32) + 1152) state] - 1) < 2;
  [*(id *)(*(void *)(a1 + 32) + 1072) setShowingCursor:v2];
  BOOL v3 = *(void **)(*(void *)(a1 + 32) + 1080);
  return [v3 setShowingCursor:v2];
}

- (void)_hoverGestureChanged:(id)a3
{
}

- (void)_clearBackgroundViews
{
  v3.receiver = self;
  v3.super_class = (Class)UISearchTextField;
  [(UISearchTextField *)&v3 _clearBackgroundViews];
  [(UISearchTextField *)self _removeEffectsBackgroundViews];
}

- (void)_removeEffectsBackgroundViews
{
  [(UIView *)self->_effectBackgroundTop removeFromSuperview];
  effectBackgroundTop = self->_effectBackgroundTop;
  self->_effectBackgroundTop = 0;

  [(UIView *)self->_effectBackgroundBottom removeFromSuperview];
  effectBackgroundBottom = self->_effectBackgroundBottom;
  self->_effectBackgroundBottom = 0;
}

- (void)_activateSelectionView
{
  if (![(UISearchTextField *)self _preventSelectionViewActivation])
  {
    v3.receiver = self;
    v3.super_class = (Class)UISearchTextField;
    [(UITextField *)&v3 _activateSelectionView];
  }
}

- (void)_animateForFirstResponderChangeWithAnimations:(id)a3
{
}

- (void)_animateForFirstResponderChangeWithAnimations:(id)a3 completion:(id)a4
{
}

- (BOOL)becomeFirstResponder
{
  objc_super v3 = [(UIView *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 == 6)
  {
    v11.receiver = self;
    v11.super_class = (Class)UISearchTextField;
    return [(UITextField *)&v11 becomeFirstResponder];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
    double v7 = [WeakRetained _searchController];

    if (v7) {
      [v7 _startDeferringSettingSearchSuggestions];
    }
    v10.receiver = self;
    v10.super_class = (Class)UISearchTextField;
    unsigned __int8 v8 = [(UITextField *)&v10 becomeFirstResponder];
    BOOL v5 = v8;
    if (v7 && (v8 & 1) == 0) {
      [v7 _stopDeferringAndShowDeferredSearchSuggestions];
    }
  }
  return v5;
}

- (void)_becomeFirstResponder
{
  if (+[UIResponder _currentChangeIntent] == 1) {
    *((unsigned char *)&self->_searchBarTextFieldFlags + 12) |= 8u;
  }
  v15.receiver = self;
  v15.super_class = (Class)UISearchTextField;
  [(UITextField *)&v15 _becomeFirstResponder];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
  uint64_t v4 = WeakRetained;
  if (WeakRetained && [WeakRetained centerPlaceholder])
  {
    BOOL v5 = [(UISearchTextField *)self textInputTraits];
    if ([v5 deferBecomingResponder])
    {
      BOOL deferringFirstResponder = self->_deferringFirstResponder;

      if (!deferringFirstResponder)
      {
        self->_BOOL deferringFirstResponder = 1;
        [(UISearchTextField *)self _setPreventSelectionViewActivation:1];
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __42__UISearchTextField__becomeFirstResponder__block_invoke;
        aBlock[3] = &unk_1E52D9F98;
        id v7 = v4;
        id v13 = v7;
        double v14 = self;
        unsigned __int8 v8 = (void (**)(void))_Block_copy(aBlock);
        double v9 = [v7 controller];
        if (v9)
        {
        }
        else
        {
          objc_super v10 = [v7 _searchController];

          if (!v10)
          {
            v8[2](v8);
            goto LABEL_16;
          }
        }
        [(id)UIApp _performBlockAfterCATransactionCommits:v8];
LABEL_16:

        goto LABEL_13;
      }
    }
    else
    {
    }
  }
  if ([(UISearchTextField *)self _shouldHideMagnifyingGlassWhenEditingOrHasContent]&& ![(UISearchTextField *)self _hasContent])
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __42__UISearchTextField__becomeFirstResponder__block_invoke_4;
    v11[3] = &unk_1E52D9F70;
    v11[4] = self;
    [(UISearchTextField *)self _animateForFirstResponderChangeWithAnimations:v11];
  }
LABEL_13:
}

void __42__UISearchTextField__becomeFirstResponder__block_invoke(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) _searchController];

  if (v2
    && ([*(id *)(a1 + 32) _searchController],
        objc_super v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = [v3 _searchBarShouldFinalizeBecomingFirstResponder],
        v3,
        !v4))
  {
    [*(id *)(a1 + 40) _setPreventSelectionViewActivation:0];
    *(unsigned char *)(*(void *)(a1 + 40) + 1097) = 1;
    [*(id *)(a1 + 40) _clearBecomeFirstResponderWhenCapable];
    BOOL v5 = [*(id *)(a1 + 40) keyboardSceneDelegate];
    [v5 _clearPreservedInputViewsWithRestorableResponder:*(void *)(a1 + 40)];
  }
  else if ([*(id *)(a1 + 40) _preventSelectionViewActivation])
  {
    id v7 = *(id *)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __42__UISearchTextField__becomeFirstResponder__block_invoke_2;
    v8[3] = &unk_1E52D9F70;
    v8[4] = v7;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __42__UISearchTextField__becomeFirstResponder__block_invoke_3;
    v6[3] = &unk_1E52DC3A0;
    [v7 _animateForFirstResponderChangeWithAnimations:v8 completion:v6];
    [*(id *)(a1 + 40) _setPreventSelectionViewActivation:0];
    objc_msgSend(*(id *)(a1 + 40), "__resumeBecomeFirstResponder");
    *(unsigned char *)(*(void *)(a1 + 40) + 1097) = 1;
  }
  *(unsigned char *)(*(void *)(a1 + 40) + 1096) = 0;
}

uint64_t __42__UISearchTextField__becomeFirstResponder__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutSubviews];
}

uint64_t __42__UISearchTextField__becomeFirstResponder__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateSelectionView];
}

uint64_t __42__UISearchTextField__becomeFirstResponder__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (BOOL)resignFirstResponder
{
  v12.receiver = self;
  v12.super_class = (Class)UISearchTextField;
  BOOL v3 = [(UITextField *)&v12 resignFirstResponder];
  if (v3)
  {
    if (self->_animatePlaceholderOnResignFirstResponder)
    {
      int v4 = [(UISearchTextField *)self text];
      uint64_t v5 = [v4 length];

      if (v5)
      {
        double v6 = [(UISearchTextField *)self textInputTraits];
        id v7 = v6;
        uint64_t v8 = 0;
      }
      else
      {
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __41__UISearchTextField_resignFirstResponder__block_invoke;
        v11[3] = &unk_1E52D9F70;
        v11[4] = self;
        [(UISearchTextField *)self _animateForFirstResponderChangeWithAnimations:v11];
        self->_animatePlaceholderOnResignFirstResponder = 0;
        double v6 = [(UISearchTextField *)self textInputTraits];
        id v7 = v6;
        uint64_t v8 = 1;
      }
      [v6 setDeferBecomingResponder:v8];
    }
    else if ([(UISearchTextField *)self _shouldHideMagnifyingGlassWhenEditingOrHasContent]&& ![(UISearchTextField *)self _hasContent])
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __41__UISearchTextField_resignFirstResponder__block_invoke_2;
      v10[3] = &unk_1E52D9F70;
      v10[4] = self;
      [(UISearchTextField *)self _animateForFirstResponderChangeWithAnimations:v10];
    }
    *((unsigned char *)&self->_searchBarTextFieldFlags + 12) &= ~8u;
  }
  return v3;
}

uint64_t __41__UISearchTextField_resignFirstResponder__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutSubviews];
}

uint64_t __41__UISearchTextField_resignFirstResponder__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (BOOL)canResignFirstResponder
{
  v8.receiver = self;
  v8.super_class = (Class)UISearchTextField;
  unsigned int v3 = [(UITextField *)&v8 canResignFirstResponder];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
  uint64_t v5 = WeakRetained;
  if (v3) {
    BOOL v6 = WeakRetained == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6) {
    unsigned int v3 = [WeakRetained _transplanting] ^ 1;
  }

  return v3;
}

- (BOOL)canBecomeFirstResponder
{
  v9.receiver = self;
  v9.super_class = (Class)UISearchTextField;
  unsigned int v3 = [(UITextField *)&v9 canBecomeFirstResponder];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
  uint64_t v5 = WeakRetained;
  if (v3)
  {
    BOOL v6 = [WeakRetained _searchController];

    if (v6)
    {
      id v7 = [v5 _searchController];
      LOBYTE(v3) = [v7 _searchBarShouldFinalizeBecomingFirstResponder];
    }
    else
    {
      LOBYTE(v3) = 1;
    }
  }

  return v3;
}

- (BOOL)_needsDelayedSearchControllerPresentation
{
  return (*((unsigned __int8 *)&self->_searchBarTextFieldFlags + 12) >> 3) & 1;
}

- (void)_resetNeedsDelayedSearchControllerPresentation
{
  *((unsigned char *)&self->_searchBarTextFieldFlags + 12) &= ~8u;
}

- (BOOL)_delegateShouldBeginEditing
{
  v8.receiver = self;
  v8.super_class = (Class)UISearchTextField;
  unsigned int v3 = [(UITextField *)&v8 _delegateShouldBeginEditing];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
  uint64_t v5 = WeakRetained;
  if (v3) {
    BOOL v6 = WeakRetained == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6) {
    LOBYTE(v3) = [WeakRetained _searchBarTextFieldShouldBeginEditing];
  }

  return v3;
}

- (BOOL)_delegateShouldEndEditing
{
  v10.receiver = self;
  v10.super_class = (Class)UISearchTextField;
  unsigned int v3 = [(UITextField *)&v10 _delegateShouldEndEditing];
  p_searchBar = &self->_searchBar;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
  BOOL v6 = WeakRetained;
  if (v3) {
    BOOL v7 = WeakRetained == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_searchBar);
    LOBYTE(v3) = [v8 _searchBarTextFieldShouldEndEditing];
  }
  return v3;
}

- (BOOL)_delegateShouldScrollToVisibleWhenBecomingFirstResponder
{
  v10.receiver = self;
  v10.super_class = (Class)UISearchTextField;
  unsigned int v3 = [(UITextField *)&v10 _delegateShouldScrollToVisibleWhenBecomingFirstResponder];
  p_searchBar = &self->_searchBar;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
  BOOL v6 = WeakRetained;
  if (v3) {
    BOOL v7 = WeakRetained == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_searchBar);
    LOBYTE(v3) = [v8 _searchBarTextFieldShouldScrollToVisibleWhenBecomingFirstResponder];
  }
  return v3;
}

- (BOOL)_delegateShouldClear
{
  v8.receiver = self;
  v8.super_class = (Class)UISearchTextField;
  unsigned int v3 = [(UITextField *)&v8 _delegateShouldClear];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
  uint64_t v5 = WeakRetained;
  if (v3) {
    BOOL v6 = WeakRetained == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6) {
    LOBYTE(v3) = [WeakRetained _searchBarTextFieldShouldClear];
  }

  return v3;
}

- (BOOL)_delegateShouldChangeCharactersInTextStorageRange:(_NSRange)a3 replacementString:(id)a4 delegateCares:(BOOL *)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)UISearchTextField;
  unsigned int v10 = -[UITextField _delegateShouldChangeCharactersInTextStorageRange:replacementString:delegateCares:](&v15, sel__delegateShouldChangeCharactersInTextStorageRange_replacementString_delegateCares_, location, length, v9, a5);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
  objc_super v12 = WeakRetained;
  if (v10) {
    BOOL v13 = WeakRetained == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (!v13) {
    LOBYTE(v10) = objc_msgSend(WeakRetained, "_searchBarTextFieldShouldChangeCharactersInRange:replacementString:", location, length, v9);
  }

  return v10;
}

- (void)_setEnabled:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)UISearchTextField;
  -[UITextField _setEnabled:animated:](&v24, sel__setEnabled_animated_);
  BOOL v7 = [(UITextField *)self _placeholderLabel];
  objc_super v8 = [(UISearchTextField *)self _placeholderColor];
  [v7 setTextColor:v8];

  double v9 = 0.35;
  if (v5) {
    double v9 = 1.0;
  }
  [v7 setAlpha:v9];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
  objc_super v11 = WeakRetained;
  if (WeakRetained)
  {
    if (v5) {
      [WeakRetained _textColor];
    }
    else {
    objc_super v12 = [(UISearchTextField *)self _placeholderColor];
    }
    [(UITextField *)self setTextColor:v12];
  }
  uint64_t v13 = [(UITextField *)self rightView];
  if (v13)
  {
    double v14 = (void *)v13;
    objc_super v15 = [(UITextField *)self rightView];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      objc_super v17 = [(UITextField *)self rightView];
      [v17 setEnabled:v5];
    }
  }
  objc_super v18 = [(UITextField *)self textStorage];
  uint64_t v19 = *(void *)off_1E52D1F50;
  uint64_t v20 = [v18 length];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __42__UISearchTextField__setEnabled_animated___block_invoke;
  v21[3] = &__block_descriptor_34_e53_v40__0___UISearchTokenAttachment_8__NSRange_QQ_16_B32l;
  BOOL v22 = v5;
  BOOL v23 = a4;
  objc_msgSend(v18, "enumerateAttribute:inRange:options:usingBlock:", v19, 0, v20, 0, v21);
}

void __42__UISearchTextField__setEnabled_animated___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v3 = [v5 _viewProvider];
    int v4 = [v3 view];

    [v4 setEnabled:*(unsigned __int8 *)(a1 + 32) animated:*(unsigned __int8 *)(a1 + 33)];
  }
}

- (void)_setBottomEffectBackgroundVisible:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(_UISearchBarSearchFieldBackgroundView *)self->_effectBackgroundBottom searchBarStyle] == 2)
  {
    effectBackgroundBottom = self->_effectBackgroundBottom;
    [(UIView *)effectBackgroundBottom setHidden:!v3];
  }
}

- (void)_defaultInsertTextSuggestion:(id)a3
{
  id v4 = a3;
  id v6 = [(UISearchTextField *)self textualRange];
  id v5 = [v4 inputText];

  [(UISearchTextField *)self replaceRange:v6 withText:v5];
}

- (void)insertTextSuggestion:(id)a3
{
  p_searchBar = &self->_searchBar;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_searchBar);
  id v7 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained insertTextSuggestion:v5];
  }
  else {
    [(UISearchTextField *)self _defaultInsertTextSuggestion:v5];
  }
}

- (BOOL)_shouldDetermineInterfaceStyleTextColor
{
  return 0;
}

- (BOOL)_textShouldFillFieldEditorHeight
{
  return 0;
}

- (BOOL)_shouldOverrideEditingFont
{
  v3.receiver = self;
  v3.super_class = (Class)UISearchTextField;
  return [(UITextField *)&v3 _shouldOverrideEditingFont];
}

- (void)_setAlwaysHidesMagnifyingGlassForAccessibilityContentSizeCategory:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_searchBarTextFieldFlags + 12);
  if (((((v3 & 4) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v4 = 4;
    }
    else {
      char v4 = 0;
    }
    *((unsigned char *)&self->_searchBarTextFieldFlags + 12) = v3 & 0xFB | v4;
    [(UISearchTextField *)self _updateLeftViewForMagnifyingGlassImage];
  }
}

- (void)didAddTextAttachmentViews:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * v8);
        unsigned int v10 = self;
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass) {
          [(UISearchTextField *)self _willAddTokenLayoutView:v9];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)didRemoveTextAttachmentViews:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * v8);
        unsigned int v10 = self;
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass) {
          [(UISearchTextField *)self _didRemoveTokenLayoutView:v9];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)didLayoutTextAttachmentView:(id)a3 inFragmentRect:(CGRect)a4
{
  id v31 = a3;
  uint64_t v5 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  uint64_t v7 = v31;
  if (isKindOfClass)
  {
    id v8 = v31;
    if ([(UITextField *)self _fieldEditorAttached])
    {
      uint64_t v9 = [(UITextField *)self _fieldEditor];
      [v9 bounds];
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      objc_super v18 = [(UITextField *)self _fieldEditor];
      objc_msgSend(v8, "convertRect:fromView:", v18, v11, v13, v15, v17);
      double v20 = v19;
      double v22 = v21;
      double v24 = v23;
      double v26 = v25;
    }
    else
    {
      [(UITextField *)self editRect];
      objc_msgSend(v8, "convertRect:fromView:", self);
      double v20 = v27;
      double v22 = v28;
      double v24 = v29;
      double v26 = v30;
    }
    objc_msgSend(v8, "updateMaskLayerForVisibleRect:", v20, v22, v24, v26);

    uint64_t v7 = v31;
  }
}

- (BOOL)_shouldAppendTextInViewDescription
{
  return self->_tokenCounter != 0;
}

- (NSArray)tokens
{
  char v3 = objc_opt_new();
  id v4 = [(_UISearchBarTextFieldTokenCounter *)self->_tokenCounter tokenCharacterIndexes];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  double v10 = __27__UISearchTextField_tokens__block_invoke;
  double v11 = &unk_1E52DADC0;
  id v12 = v3;
  double v13 = self;
  id v5 = v3;
  [v4 enumerateIndexesUsingBlock:&v8];

  uint64_t v6 = objc_msgSend(v5, "copy", v8, v9, v10, v11);
  return (NSArray *)v6;
}

void __27__UISearchTextField_tokens__block_invoke(uint64_t a1, uint64_t a2)
{
  BOOL v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(*(void *)(a1 + 40) + 1128) tokenAtCharacterIndex:a2];
  [v2 addObject:v3];
}

- (id)_newAttributedStringWithToken:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [[_UISearchTokenAttachment alloc] initWithToken:v4];

  if ([(UIView *)self effectiveUserInterfaceLayoutDirection] == UIUserInterfaceLayoutDirectionRightToLeft)
  {
    uint64_t v6 = [NSNumber numberWithUnsignedInteger:6];
    v14[0] = v6;
    uint64_t v7 = (void **)v14;
  }
  else
  {
    uint64_t v6 = [NSNumber numberWithUnsignedInteger:5];
    double v13 = v6;
    uint64_t v7 = &v13;
  }
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];

  uint64_t v9 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v5];
  double v10 = (void *)[v9 mutableCopy];

  objc_msgSend(v10, "addAttribute:value:range:", *(void *)off_1E52D2450, v8, 0, 1);
  double v11 = (void *)[v10 copy];

  return v11;
}

- (void)setTokens:(NSArray *)tokens
{
  id v4 = tokens;
  NSUInteger v5 = [(UIResponder *)self _selectedNSRange];
  NSUInteger v7 = v6;
  NSUInteger v8 = [(_UISearchBarTextFieldTokenCounter *)self->_tokenCounter characterRangeOfAllTokens];
  NSUInteger v10 = v9;
  v29.NSUInteger location = v5;
  v29.NSUInteger length = v7;
  v30.NSUInteger location = v8;
  v30.NSUInteger length = v10;
  NSUInteger length = NSIntersectionRange(v29, v30).length;
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  double v25 = __31__UISearchTextField_setTokens___block_invoke;
  double v26 = &unk_1E52D9F98;
  double v27 = self;
  id v12 = v4;
  double v28 = v12;
  double v13 = _Block_copy(&v23);
  double v14 = v13;
  if (length)
  {
    (*((void (**)(void *))v13 + 2))(v13);
    uint64_t v15 = [(_UISearchBarTextFieldTokenCounter *)self->_tokenCounter characterRangeOfAllTokens];
    double v16 = self;
    uint64_t v18 = v17;
  }
  else
  {
    if (v5 >= v8 + v10)
    {
      uint64_t v20 = [(NSArray *)v12 count];
      double v19 = [(_UISearchBarTextFieldTokenCounter *)self->_tokenCounter tokenCharacterIndexes];
      PreservingSelectionForTokenChange(self, 0, v20 - [v19 count], v14);
      goto LABEL_7;
    }
    (*((void (**)(void *))v13 + 2))(v13);
    uint64_t v15 = [(_UISearchBarTextFieldTokenCounter *)self->_tokenCounter characterRangeOfTextAfterLastToken];
    double v16 = self;
    uint64_t v18 = 0;
  }
  double v19 = -[UIResponder _textRangeFromNSRange:](v16, "_textRangeFromNSRange:", v15, v18);
  [(UITextField *)self setSelectedTextRange:v19];
LABEL_7:

  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
  double v22 = [WeakRetained _searchController];
  -[UISearchController __searchTextFieldDidSetOrInsertTokens:]((uint64_t)v22, self);
}

void __31__UISearchTextField_setTokens___block_invoke(uint64_t a1)
{
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  NSUInteger v7 = __31__UISearchTextField_setTokens___block_invoke_2;
  NSUInteger v8 = &unk_1E52DEA50;
  BOOL v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v4;
  ManipulateTextStorage(v2, 1, &v5);
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout", v5, v6, v7, v8);
}

void __31__UISearchTextField_setTokens___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(a1 + 40), "_newAttributedStringWithToken:", *(void *)(*((void *)&v13 + 1) + 8 * v9), (void)v13);
        [v4 appendAttributedString:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  uint64_t v11 = [*(id *)(*(void *)(a1 + 40) + 1128) characterRangeOfAllTokens];
  objc_msgSend(v3, "replaceCharactersInRange:withAttributedString:", v11, v12, v4);
}

- (void)insertToken:(UISearchToken *)token atIndex:(NSInteger)tokenIndex
{
  uint64_t v7 = token;
  if (!v7)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"UISearchTextField.m", 1898, @"Invalid parameter not satisfying: %@", @"token != nil" object file lineNumber description];
  }
  unint64_t v8 = [(_UISearchBarTextFieldTokenCounter *)self->_tokenCounter characterIndexForInsertingTokenAtIndex:tokenIndex];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __41__UISearchTextField_insertToken_atIndex___block_invoke;
  v13[3] = &unk_1E52DA070;
  v13[4] = self;
  long long v14 = v7;
  unint64_t v15 = v8;
  uint64_t v9 = v7;
  PreservingSelectionForTokenChange(self, v8, 1, v13);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
  uint64_t v11 = [WeakRetained _searchController];
  -[UISearchController __searchTextFieldDidSetOrInsertTokens:]((uint64_t)v11, self);
}

void __41__UISearchTextField_insertToken_atIndex___block_invoke(uint64_t a1)
{
  BOOL v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__UISearchTextField_insertToken_atIndex___block_invoke_2;
  v5[3] = &unk_1E52DEA78;
  v5[4] = v2;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = v3;
  uint64_t v7 = v4;
  ManipulateTextStorage(v2, 1, v5);
}

void __41__UISearchTextField_insertToken_atIndex___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  id v6 = (id)[v3 _newAttributedStringWithToken:v4];
  [v5 insertAttributedString:v6 atIndex:*(void *)(a1 + 48)];

  [*(id *)(a1 + 32) setNeedsLayout];
}

- (void)removeTokenAtIndex:(NSInteger)tokenIndex
{
  if (tokenIndex < 0)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"UISearchTextField.m", 1913, @"Invalid parameter not satisfying: %@", @"tokenIndex >= 0" object file lineNumber description];
  }
  unint64_t v5 = [(_UISearchBarTextFieldTokenCounter *)self->_tokenCounter characterIndexForSelectingOrRemovingTokenAtIndex:tokenIndex];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__UISearchTextField_removeTokenAtIndex___block_invoke;
  v8[3] = &unk_1E52D9CD0;
  v8[4] = self;
  void v8[5] = v5;
  PreservingSelectionForTokenChange(self, v5, -1, v8);
}

void __40__UISearchTextField_removeTokenAtIndex___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __40__UISearchTextField_removeTokenAtIndex___block_invoke_2;
  v2[3] = &unk_1E52DEAA0;
  uint64_t v1 = *(void *)(a1 + 40);
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = v1;
  ManipulateTextStorage(v3, 1, v2);
}

uint64_t __40__UISearchTextField_removeTokenAtIndex___block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "replaceCharactersInRange:withString:", *(void *)(a1 + 40), 1, &stru_1ED0E84C0);
  id v3 = *(void **)(a1 + 32);
  return [v3 setNeedsLayout];
}

- (UITextPosition)positionOfTokenAtIndex:(NSInteger)tokenIndex
{
  if (tokenIndex < 0)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"UISearchTextField.m", 1926, @"Invalid parameter not satisfying: %@", @"tokenIndex >= 0" object file lineNumber description];
  }
  unint64_t v5 = [(_UISearchBarTextFieldTokenCounter *)self->_tokenCounter tokenCharacterIndexes];
  unint64_t v6 = [v5 count];

  if (tokenIndex < 0 || v6 <= tokenIndex)
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v13 = *MEMORY[0x1E4F1C3C8];
    long long v14 = [NSString stringWithFormat:@"Token index %ld out of range [0, %lu"], tokenIndex, v6);
    id v15 = [v12 exceptionWithName:v13 reason:v14 userInfo:0];

    objc_exception_throw(v15);
  }
  uint64_t v7 = [(UITextField *)self beginningOfDocument];
  unint64_t v8 = [(UITextField *)self positionFromPosition:v7 offset:[(_UISearchBarTextFieldTokenCounter *)self->_tokenCounter characterIndexForSelectingOrRemovingTokenAtIndex:tokenIndex]];

  return (UITextPosition *)v8;
}

- (NSArray)tokensInRange:(UITextRange *)textRange
{
  unint64_t v5 = textRange;
  if (!v5)
  {
    long long v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"UISearchTextField.m", 1938, @"Invalid parameter not satisfying: %@", @"textRange != nil" object file lineNumber description];
  }
  uint64_t v6 = [(UIResponder *)self _nsrangeForTextRange:v5];
  uint64_t v8 = v7;
  uint64_t v9 = objc_opt_new();
  uint64_t v10 = [(_UISearchBarTextFieldTokenCounter *)self->_tokenCounter tokenCharacterIndexes];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __35__UISearchTextField_tokensInRange___block_invoke;
  v15[3] = &unk_1E52DADC0;
  id v16 = v9;
  uint64_t v17 = self;
  id v11 = v9;
  objc_msgSend(v10, "enumerateIndexesInRange:options:usingBlock:", v6, v8, 0, v15);

  uint64_t v12 = (void *)[v11 copy];
  return (NSArray *)v12;
}

void __35__UISearchTextField_tokensInRange___block_invoke(uint64_t a1, uint64_t a2)
{
  BOOL v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(*(void *)(a1 + 40) + 1128) tokenAtCharacterIndex:a2];
  [v2 addObject:v3];
}

- (void)replaceTextualPortionOfRange:(UITextRange *)textRange withToken:(UISearchToken *)token atIndex:(NSUInteger)tokenIndex
{
  uint64_t v9 = textRange;
  uint64_t v10 = token;
  id v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"UISearchTextField.m", 1956, @"Invalid parameter not satisfying: %@", @"textRange != nil" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  uint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, self, @"UISearchTextField.m", 1957, @"Invalid parameter not satisfying: %@", @"token != nil" object file lineNumber description];

LABEL_3:
  NSUInteger v12 = [(UIResponder *)self _nsrangeForTextRange:v9];
  NSUInteger v14 = v13;
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x3010000000;
  double v33 = &unk_186D7DBA7;
  long long v34 = xmmword_186B8FCC0;
  v36.NSUInteger location = [(_UISearchBarTextFieldTokenCounter *)self->_tokenCounter characterRangeOfTextAfterLastToken];
  v36.NSUInteger length = v15;
  v35.NSUInteger location = v12;
  v35.NSUInteger length = v14;
  NSRange v16 = NSIntersectionRange(v35, v36);
  if (v16.location == 0x7FFFFFFFFFFFFFFFLL || v16.length == 0)
  {
    [(UISearchTextField *)self insertToken:v11 atIndex:tokenIndex];
    unint64_t v18 = [(_UISearchBarTextFieldTokenCounter *)self->_tokenCounter characterIndexForSelectingOrRemovingTokenAtIndex:tokenIndex];
    double v19 = v31;
    v31[4] = v18;
  }
  else
  {
    if ([(UITextField *)self hasMarkedText])
    {
      uint64_t v20 = [(UITextField *)self markedTextRange];
      v37.NSUInteger location = [(UIResponder *)self _nsrangeForTextRange:v20];
      v37.NSUInteger length = v21;
      NSUInteger length = NSIntersectionRange(v16, v37).length;

      if (length) {
        [(UITextField *)self unmarkText];
      }
    }
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __68__UISearchTextField_replaceTextualPortionOfRange_withToken_atIndex___block_invoke;
    v25[3] = &unk_1E52DEAC8;
    NSRange v28 = v16;
    v25[4] = self;
    NSUInteger v29 = tokenIndex;
    double v26 = v11;
    double v27 = &v30;
    ManipulateTextStorage(self, 0, v25);

    double v19 = v31;
    unint64_t v18 = v31[4];
  }
  -[UITextField setSelectionRange:](self, "setSelectionRange:", v18, v19[5]);
  _Block_object_dispose(&v30, 8);
}

void __68__UISearchTextField_replaceTextualPortionOfRange_withToken_atIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 64);
  id v5 = a2;
  objc_msgSend(v5, "replaceCharactersInRange:withString:", v3, v4, &stru_1ED0E84C0);
  id v7 = (id)[*(id *)(a1 + 32) _newAttributedStringWithToken:*(void *)(a1 + 40)];
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 1128) characterIndexForInsertingTokenAtIndex:*(void *)(a1 + 72)];
  [v5 insertAttributedString:v7 atIndex:v6];

  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 32) = v6;
  [*(id *)(a1 + 32) setNeedsLayout];
}

- (UIColor)tokenBackgroundColor
{
  tokenBackgroundColor = self->_tokenBackgroundColor;
  if (tokenBackgroundColor)
  {
    uint64_t v3 = tokenBackgroundColor;
  }
  else
  {
    uint64_t v4 = [(UIView *)self traitCollection];
    uint64_t v3 = +[_UISearchAtomView defaultAtomBackgroundColorForTraitCollection:v4];
  }
  return v3;
}

- (void)setTokenBackgroundColor:(UIColor *)tokenBackgroundColor
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = tokenBackgroundColor;
  p_tokenBackgroundColor = &self->_tokenBackgroundColor;
  objc_storeStrong((id *)&self->_tokenBackgroundColor, tokenBackgroundColor);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = self->_knownTokenLayoutViews;
  uint64_t v8 = [(NSHashTable *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        NSUInteger v12 = *p_tokenBackgroundColor;
        NSUInteger v13 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v11), "delegateView", (void)v14);
        [v13 setAtomBackgroundColor:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSHashTable *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

- (void)_setTokenForegroundColor:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_tokenForegroundColor = &self->_tokenForegroundColor;
  objc_storeStrong((id *)&self->_tokenForegroundColor, a3);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = self->_knownTokenLayoutViews;
  uint64_t v8 = [(NSHashTable *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        NSUInteger v12 = *p_tokenForegroundColor;
        NSUInteger v13 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v11), "delegateView", (void)v14);
        [v13 _setAtomForegroundColor:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSHashTable *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

- (UIColor)_tokenForegroundColor
{
  tokenForegroundColor = self->_tokenForegroundColor;
  if (tokenForegroundColor)
  {
    uint64_t v3 = tokenForegroundColor;
  }
  else
  {
    uint64_t v4 = [(UIView *)self traitCollection];
    uint64_t v3 = +[_UISearchAtomView _defaultAtomForegroundColorForTraitCollection:v4];
  }
  return v3;
}

- (id)selectedTokens
{
  uint64_t v3 = [(UITextField *)self selectedTextRange];
  uint64_t v4 = [(UISearchTextField *)self tokensInRange:v3];

  return v4;
}

- (BOOL)allowsCopyingTokens
{
  return *((unsigned char *)&self->_searchBarTextFieldFlags + 12) & 1;
}

- (void)setAllowsCopyingTokens:(BOOL)allowsCopyingTokens
{
  *((unsigned char *)&self->_searchBarTextFieldFlags + 12) = *((unsigned char *)&self->_searchBarTextFieldFlags + 12) & 0xFE | allowsCopyingTokens;
}

- (BOOL)allowsDeletingTokens
{
  return (*((unsigned __int8 *)&self->_searchBarTextFieldFlags + 12) >> 1) & 1;
}

- (void)setAllowsDeletingTokens:(BOOL)allowsDeletingTokens
{
  if (allowsDeletingTokens) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)&self->_searchBarTextFieldFlags + 12) = *((unsigned char *)&self->_searchBarTextFieldFlags + 12) & 0xFD | v3;
}

- (void)_willAddTokenLayoutView:(id)a3
{
  knownTokenLayoutViews = self->_knownTokenLayoutViews;
  id v5 = a3;
  if (![(NSHashTable *)knownTokenLayoutViews count])
  {
    uint64_t v6 = [(UITextField *)self _fieldEditor];
    [v6 _addScrollViewScrollObserver:self];
  }
  id v10 = [v5 delegateView];
  [v10 setAtomBackgroundColor:self->_tokenBackgroundColor];
  [v10 _setAtomForegroundColor:self->_tokenForegroundColor];
  id v7 = [(UITextField *)self font];
  [v10 setAtomFont:v7];

  uint64_t v8 = [(UIImageView *)self->_defaultLeftView _overridingSymbolConfiguration];
  uint64_t v9 = [v10 leadingImage];
  [v9 _setOverridingSymbolConfiguration:v8];

  [(NSHashTable *)self->_knownTokenLayoutViews addObject:v5];
  objc_msgSend(v5, "setEnabled:", -[UIControl isEnabled](self, "isEnabled"));
}

- (void)_didRemoveTokenLayoutView:(id)a3
{
  [(NSHashTable *)self->_knownTokenLayoutViews removeObject:a3];
  if (![(NSHashTable *)self->_knownTokenLayoutViews count])
  {
    id v4 = [(UITextField *)self _fieldEditor];
    [v4 _removeScrollViewScrollObserver:self];
  }
}

- (void)_observeScrollViewDidScroll:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(UITextField *)self _fieldEditor];

  if (v5 == v4)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v6 = self->_knownTokenLayoutViews;
    uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
          [(UITextField *)self editRect];
          objc_msgSend(v11, "convertRect:fromView:", self);
          objc_msgSend(v11, "updateMaskLayerForVisibleRect:");
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [(NSHashTable *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

- (unint64_t)_characterIndexForTokenTapGestureRecognizer
{
  tokenTapGestureRecognizer = self->_tokenTapGestureRecognizer;
  id v4 = [(UITextField *)self _textCanvasView];
  [(UITapGestureRecognizer *)tokenTapGestureRecognizer locationInView:v4];
  double v6 = v5;
  double v8 = v7;

  [(UITextField *)self textContainerOrigin];
  double v10 = v9;
  double v12 = v11;
  double v13 = v6 - v9;
  double v14 = v8 - v11;
  long long v15 = [(UITextField *)self textContainer];
  long long v16 = [(UITextField *)self textLayoutController];
  uint64_t v17 = [(_UITextLayoutControllerBase *)v16 nearestTextRangeAtPoint:v13 inContainer:v14];
  [v16 boundingRectForRange:v17];
  CGRect v27 = CGRectOffset(v26, -v10, -v12);
  v27.origin.double y = v27.origin.y + -5000.0;
  v27.size.double height = v27.size.height + 10000.0;
  v25.double x = v13;
  v25.double y = v14;
  unint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
  if (CGRectContainsPoint(v27, v25))
  {
    uint64_t v19 = [v16 beginningOfDocument];
    uint64_t v20 = [v17 start];
    uint64_t v21 = [v16 offsetFromPosition:v19 toPosition:v20];

    double v22 = [(UITextField *)self textStorage];
    uint64_t v23 = [v22 attribute:*(void *)off_1E52D1F50 atIndex:v21 effectiveRange:0];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unint64_t v18 = v21;
    }
  }
  return v18;
}

- (void)_tokenTapGestureRecognized
{
  unint64_t v3 = [(UISearchTextField *)self _characterIndexForTokenTapGestureRecognizer];
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v4 = v3;
    if (![(UIView *)self isFirstResponder]) {
      [(UISearchTextField *)self becomeFirstResponder];
    }
    double v5 = [(UITextField *)self selectedTextRange];
    id v10 = v5;
    if (v5
      && ([v5 isEmpty] & 1) == 0
      && (-[UIResponder _textRangeFromNSRange:](self, "_textRangeFromNSRange:", v4, 1),
          double v6 = objc_claimAutoreleasedReturnValue(),
          BOOL v7 = [(UIResponder *)self _range:v10 containsRange:v6],
          v6,
          v7))
    {
      double v8 = [(UITextField *)self interactionAssistant];
      [v8 showSelectionCommands];

      [(UISearchTextField *)self _activateSelectionView];
    }
    else
    {
      double v9 = -[UIResponder _textRangeFromNSRange:](self, "_textRangeFromNSRange:", v4, 1);
      [(UITextField *)self setSelectedTextRange:v9];
    }
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  if (self->_tokenTapGestureRecognizer == a3) {
    return [(UISearchTextField *)self _characterIndexForTokenTapGestureRecognizer] != 0x7FFFFFFFFFFFFFFFLL;
  }
  v4.receiver = self;
  v4.super_class = (Class)UISearchTextField;
  return -[UITextField gestureRecognizerShouldBegin:](&v4, sel_gestureRecognizerShouldBegin_);
}

- (_NSRange)_rangeForClearButton
{
  if ((*((unsigned char *)&self->_searchBarTextFieldFlags + 12) & 2) != 0)
  {
    v4.receiver = self;
    v4.super_class = (Class)UISearchTextField;
    id v2 = [(UITextField *)&v4 _rangeForClearButton];
  }
  else
  {
    id v2 = (id)[(UISearchTextField *)self _rangeForSetText];
  }
  result.NSUInteger length = v3;
  result.NSUInteger location = (NSUInteger)v2;
  return result;
}

- (_NSRange)_textRangeForTextStorageRange:(_NSRange)a3
{
  NSUInteger v3 = -[_UISearchBarTextFieldTokenCounter subrangeOfTextAfterLastTokenForCharacterRange:](self->_tokenCounter, "subrangeOfTextAfterLastTokenForCharacterRange:", a3.location, a3.length);
  result.NSUInteger length = v4;
  result.NSUInteger location = v3;
  return result;
}

- (id)attributedTextInRange:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    double v5 = [(UISearchTextField *)self textualRange];
    double v6 = [(UIResponder *)self _intersectionOfRange:v5 andRange:v4];

    v11.receiver = self;
    v11.super_class = (Class)UISearchTextField;
    BOOL v7 = [(UITextField *)&v11 attributedTextInRange:v6];
  }
  else
  {
    if (os_variant_has_internal_diagnostics())
    {
      id v10 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v10, OS_LOG_TYPE_FAULT, "Something is calling -attributedTextInRange: with a nil range. This argument is nonnull. Returning a default value.", buf, 2u);
      }
    }
    else
    {
      double v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &attributedTextInRange____s_category) + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "Something is calling -attributedTextInRange: with a nil range. This argument is nonnull. Returning a default value.", buf, 2u);
      }
    }
    BOOL v7 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:&stru_1ED0E84C0];
  }

  return v7;
}

- (id)attributedText
{
  NSUInteger v3 = [(UISearchTextField *)self textualRange];
  id v4 = [(UISearchTextField *)self attributedTextInRange:v3];

  return v4;
}

- (void)replaceRange:(id)a3 withText:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    double v8 = [(UISearchTextField *)self textualRange];
    double v9 = [(UIResponder *)self _intersectionOfRange:v8 andRange:v6];

    v12.receiver = self;
    v12.super_class = (Class)UISearchTextField;
    [(UITextField *)&v12 replaceRange:v9 withText:v7];
  }
  else if (os_variant_has_internal_diagnostics())
  {
    objc_super v11 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1853B0000, v11, OS_LOG_TYPE_FAULT, "Something is calling -replaceRange:withText: with a nil range. This argument is nonnull. Doing nothing.", buf, 2u);
    }
  }
  else
  {
    id v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &replaceRange_withText____s_category) + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "Something is calling -replaceRange:withText: with a nil range. This argument is nonnull. Doing nothing.", buf, 2u);
    }
  }
}

- (void)replaceRangeWithTextWithoutClosingTyping:(id)a3 replacementText:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    double v8 = [(UISearchTextField *)self textualRange];
    double v9 = [(UIResponder *)self _intersectionOfRange:v8 andRange:v6];

    v12.receiver = self;
    v12.super_class = (Class)UISearchTextField;
    [(UITextField *)&v12 replaceRange:v9 withText:v7];
  }
  else if (os_variant_has_internal_diagnostics())
  {
    objc_super v11 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1853B0000, v11, OS_LOG_TYPE_FAULT, "Something is calling -replaceRangeWithTextWithoutClosingTyping:replacementText: with a nil range. This argument is nonnull. Doing nothing.", buf, 2u);
    }
  }
  else
  {
    id v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &replaceRangeWithTextWithoutClosingTyping_replacementText____s_category)+ 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "Something is calling -replaceRangeWithTextWithoutClosingTyping:replacementText: with a nil range. This argument is nonnull. Doing nothing.", buf, 2u);
    }
  }
}

- (void)replaceRange:(id)a3 withAttributedText:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    double v8 = [(UISearchTextField *)self textualRange];
    double v9 = [(UIResponder *)self _intersectionOfRange:v8 andRange:v6];

    v12.receiver = self;
    v12.super_class = (Class)UISearchTextField;
    [(UITextField *)&v12 replaceRange:v9 withAttributedText:v7];
  }
  else if (os_variant_has_internal_diagnostics())
  {
    objc_super v11 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1853B0000, v11, OS_LOG_TYPE_FAULT, "Something is calling -replaceRange:withAttributedText: with a nil range. This argument is nonnull. Doing nothing.", buf, 2u);
    }
  }
  else
  {
    id v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &replaceRange_withAttributedText____s_category) + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "Something is calling -replaceRange:withAttributedText: with a nil range. This argument is nonnull. Doing nothing.", buf, 2u);
    }
  }
}

- (void)_redirectSelectionToAvoidClobberingTokens
{
  NSUInteger v3 = [(UITextField *)self selectedTextRange];
  if (v3)
  {
    id v8 = v3;
    id v4 = [(UISearchTextField *)self textualRange];
    if (![(UIResponder *)self _range:v4 containsRange:v8])
    {
      double v5 = [(UITextField *)self endOfDocument];
      id v6 = [(UITextField *)self endOfDocument];
      id v7 = [(UITextField *)self textRangeFromPosition:v5 toPosition:v6];
      [(UITextField *)self setSelectedTextRange:v7];
    }
    NSUInteger v3 = v8;
  }
}

- (void)insertText:(id)a3
{
  id v4 = a3;
  [(UISearchTextField *)self _redirectSelectionToAvoidClobberingTokens];
  v5.receiver = self;
  v5.super_class = (Class)UISearchTextField;
  [(UITextField *)&v5 insertText:v4];
}

- (_NSRange)insertFilteredText:(id)a3
{
  id v4 = a3;
  [(UISearchTextField *)self _redirectSelectionToAvoidClobberingTokens];
  if ([v4 isEqualToString:@"\n"])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
    id v6 = [WeakRetained _searchController];

    if (v6) {
      id v7 = v6;
    }
    else {
      id v7 = self;
    }
    [(UISearchTextField *)v7 setSearchSuggestions:0];
  }
  v13.receiver = self;
  v13.super_class = (Class)UISearchTextField;
  id v8 = [(UITextField *)&v13 insertFilteredText:v4];
  NSUInteger v10 = v9;

  NSUInteger v11 = (NSUInteger)v8;
  NSUInteger v12 = v10;
  result.NSUInteger length = v12;
  result.NSUInteger location = v11;
  return result;
}

- (void)insertAttributedText:(id)a3
{
  id v4 = a3;
  [(UISearchTextField *)self _redirectSelectionToAvoidClobberingTokens];
  v5.receiver = self;
  v5.super_class = (Class)UISearchTextField;
  [(UITextField *)&v5 insertAttributedText:v4];
}

- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  if (!-[UITextField hasMarkedText](self, "hasMarkedText") && [v7 length]) {
    [(UISearchTextField *)self _redirectSelectionToAvoidClobberingTokens];
  }
  v8.receiver = self;
  v8.super_class = (Class)UISearchTextField;
  -[UITextField setMarkedText:selectedRange:](&v8, sel_setMarkedText_selectedRange_, v7, location, length);
}

- (void)setAttributedMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  if (!-[UITextField hasMarkedText](self, "hasMarkedText") && [v7 length]) {
    [(UISearchTextField *)self _redirectSelectionToAvoidClobberingTokens];
  }
  v8.receiver = self;
  v8.super_class = (Class)UISearchTextField;
  -[UITextField setAttributedMarkedText:selectedRange:](&v8, sel_setAttributedMarkedText_selectedRange_, v7, location, length);
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  p_searchBarTextFieldFlags = &self->_searchBarTextFieldFlags;
  if (self->_searchBarTextFieldFlags.delegateImplementsItemProviderForCopyingTokens) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = self->_searchBarTextFieldFlags.delegateImplementsUnderscoredItemProviderForCopyingTokens == 0;
  }
  if (sel_cut_ == a3 || sel_copy_ == a3)
  {
    NSUInteger v10 = [(UITextField *)self selectedTextRange];
    NSUInteger v11 = [v10 start];
    NSUInteger v12 = [v10 end];
    int64_t v13 = [(UITextField *)self offsetFromPosition:v11 toPosition:v12];

    if (!v13)
    {
      LOBYTE(self) = 0;
LABEL_27:

      goto LABEL_28;
    }
    double v14 = [(UISearchTextField *)self textualRange];
    long long v15 = [v14 start];
    long long v16 = [v14 end];
    if ([(UITextField *)self offsetFromPosition:v15 toPosition:v16] < 1)
    {
      LODWORD(self) = 0;
    }
    else
    {
      [(UISearchTextField *)self textualRange];
      BOOL v24 = v8;
      v18 = id v17 = v6;
      LODWORD(self) = [(UIResponder *)self _range:v10 intersectsRange:v18];

      id v6 = v17;
      BOOL v8 = v24;
    }

    if (((self | v8) & 1) == 0)
    {
      int v20 = *((unsigned __int8 *)p_searchBarTextFieldFlags + 12);
      char v21 = v20 & 1;
      BOOL v22 = (~v20 & 3) == 0;
      if (sel_cut_ == a3) {
        LOBYTE(self) = v22;
      }
      else {
        LOBYTE(self) = v21;
      }
    }
LABEL_26:

    goto LABEL_27;
  }
  if (sel__define_ == a3 || sel__translate_ == a3)
  {
    NSUInteger v10 = [(UITextField *)self selectedTextRange];
    double v14 = [(UISearchTextField *)self textualRange];
    if ([(UIResponder *)self _range:v10 intersectsRange:v14])
    {
      v26.receiver = self;
      v26.super_class = (Class)UISearchTextField;
      LOBYTE(self) = [(UITextField *)&v26 canPerformAction:a3 withSender:v6];
    }
    else
    {
      LOBYTE(self) = 0;
    }
    goto LABEL_26;
  }
  v25.receiver = self;
  v25.super_class = (Class)UISearchTextField;
  LOBYTE(self) = [(UITextField *)&v25 canPerformAction:a3 withSender:v6];
LABEL_28:

  return (char)self;
}

- (void)_copySelectionPopulatingActuallyCopiedTokenCharacterIndexes:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(UISearchTextField *)self textualRange];
  id v6 = [(UITextField *)self selectedTextRange];
  id v7 = [(UIResponder *)self _intersectionOfRange:v5 andRange:v6];

  BOOL v8 = [v7 start];
  NSUInteger v9 = [v7 end];
  uint64_t v10 = [(UITextField *)self offsetFromPosition:v8 toPosition:v9];

  if (v10 < 1)
  {
    double v14 = 0;
  }
  else
  {
    NSUInteger v11 = [(UITextField *)self _inputController];
    uint64_t v12 = [(UIResponder *)self _nsrangeForTextRange:v7];
    double v14 = objc_msgSend(v11, "_itemProviderForCopyingRange:", v12, v13);
  }
  long long v15 = objc_opt_new();
  long long v16 = &xmmword_186B92000;
  if (self->_searchBarTextFieldFlags.delegateImplementsItemProviderForCopyingTokens
    || self->_searchBarTextFieldFlags.delegateImplementsUnderscoredItemProviderForCopyingTokens)
  {
    id v17 = [(UITextField *)self delegate];
    unint64_t v18 = [(_UISearchBarTextFieldTokenCounter *)self->_tokenCounter tokenCharacterIndexes];
    uint64_t v19 = [(UITextField *)self selectedTextRange];
    uint64_t v20 = [(UIResponder *)self _nsrangeForTextRange:v19];
    uint64_t v22 = v21;
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __81__UISearchTextField__copySelectionPopulatingActuallyCopiedTokenCharacterIndexes___block_invoke;
    v32[3] = &unk_1E52DEAF0;
    v32[4] = self;
    id v33 = v17;
    id v34 = v15;
    id v35 = v4;
    id v23 = v17;
    objc_msgSend(v18, "enumerateIndexesInRange:options:usingBlock:", v20, v22, 0, v32);

    long long v16 = &xmmword_186B92000;
  }
  else
  {
    NSRange v28 = *(NSObject **)(__UILogGetCategoryCachedImpl("Search", &_copySelectionPopulatingActuallyCopiedTokenCharacterIndexes____s_category)+ 8);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v28, OS_LOG_TYPE_ERROR, "Delegate agreed to copy a token but cannot provide an item provider for that token", buf, 2u);
    }
  }
  BOOL v24 = [(UISearchTextField *)self _searchBar];
  uint64_t v25 = [v24 _dataOwnerForCopy];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = *((void *)v16 + 137);
  v29[2] = __81__UISearchTextField__copySelectionPopulatingActuallyCopiedTokenCharacterIndexes___block_invoke_2;
  v29[3] = &unk_1E52D9F98;
  id v30 = v15;
  id v31 = v14;
  id v26 = v14;
  id v27 = v15;
  +[UIPasteboard _performAsDataOwner:v25 block:v29];
}

void __81__UISearchTextField__copySelectionPopulatingActuallyCopiedTokenCharacterIndexes___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 1128) tokenAtCharacterIndex:a2];
  uint64_t v5 = *(void *)(a1 + 32);
  id v9 = (id)v4;
  if (*(_DWORD *)(v5 + 1104))
  {
    id v6 = objc_msgSend(*(id *)(a1 + 40), "searchTextField:itemProviderForCopyingToken:");
  }
  else
  {
    if (!*(_DWORD *)(v5 + 1108))
    {
      id v7 = 0;
      goto LABEL_9;
    }
    id v6 = objc_msgSend(*(id *)(a1 + 40), "_searchTextField:itemProviderForCopyingToken:");
  }
  id v7 = v6;
  if (v6)
  {
    BOOL v8 = [v6 registeredTypeIdentifiers];

    if (v8)
    {
      [*(id *)(a1 + 48) addObject:v7];
      [*(id *)(a1 + 56) addIndex:a2];
    }
  }
LABEL_9:
}

void __81__UISearchTextField__copySelectionPopulatingActuallyCopiedTokenCharacterIndexes___block_invoke_2(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) count];
  uint64_t v3 = *(void *)(a1 + 40);
  if (v2)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    if (v3)
    {
      objc_msgSend(v4, "arrayByAddingObject:");
      id v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v5 = v4;
    }
    id v9 = v5;
    BOOL v8 = +[UIPasteboard generalPasteboard];
    [v8 setItemProviders:v9];
  }
  else if (v3)
  {
    v10[0] = *(void *)(a1 + 40);
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    id v7 = +[UIPasteboard generalPasteboard];
    [v7 setItemProviders:v6];
  }
}

- (void)copy:(id)a3
{
}

- (void)cut:(id)a3
{
  id v16 = [(UITextField *)self selectedTextRange];
  uint64_t v4 = [(UISearchTextField *)self textualRange];
  if ([(UIResponder *)self _range:v16 intersectsRange:v4])
  {
    id v5 = [(UIResponder *)self _intersectionOfRange:v16 andRange:v4];
    uint64_t v6 = [(UIResponder *)self _nsrangeForTextRange:v5];
    if (!-[UISearchTextField _delegateShouldChangeCharactersInTextStorageRange:replacementString:delegateCares:](self, "_delegateShouldChangeCharactersInTextStorageRange:replacementString:delegateCares:", v6, v7, &stru_1ED0E84C0, 0))goto LABEL_16; {
  }
    }
  else
  {
    id v5 = 0;
  }
  BOOL v8 = objc_opt_new();
  [(UISearchTextField *)self _copySelectionPopulatingActuallyCopiedTokenCharacterIndexes:v8];
  if ((*((unsigned char *)&self->_searchBarTextFieldFlags + 12) & 2) != 0
    && (self->_searchBarTextFieldFlags.delegateImplementsItemProviderForCopyingTokens
     || self->_searchBarTextFieldFlags.delegateImplementsUnderscoredItemProviderForCopyingTokens))
  {
    id v9 = [(UITextField *)self _inputController];
    uint64_t v10 = v9;
    id v11 = v16;
    goto LABEL_11;
  }
  if (v5)
  {
    id v9 = [(UITextField *)self _inputController];
    uint64_t v10 = v9;
    id v11 = v5;
LABEL_11:
    [v9 replaceRange:v11 withText:&stru_1ED0E84C0];
  }
  uint64_t v12 = [v8 firstIndex];
  if (v12 != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (uint64_t i = v12; i != 0x7FFFFFFFFFFFFFFFLL; uint64_t i = [v8 firstIndex])
    {
      double v14 = [(UITextField *)self _inputController];
      long long v15 = -[UIResponder _textRangeFromNSRange:](self, "_textRangeFromNSRange:", i, 1);
      [v14 replaceRange:v15 withText:&stru_1ED0E84C0];

      [v8 shiftIndexesStartingAtIndex:i + 1 by:-1];
    }
  }

LABEL_16:
}

- (void)paste:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)UISearchTextField;
  [(UITextField *)&v3 paste:a3];
}

+ (Class)_textPasteItemClass
{
  return (Class)objc_opt_class();
}

- (void)_pasteSessionDidFinish:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(_UISearchBarTextFieldTokenCounter *)self->_tokenCounter tokenCharacterIndexes];
  uint64_t v6 = [v5 count];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v4 originalItems];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * v11);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v13 = [v12 _searchTokenResult];
          if (v13) {
            [(UISearchTextField *)self insertToken:v13 atIndex:v6++];
          }
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  v14.receiver = self;
  v14.super_class = (Class)UISearchTextField;
  [(UITextField *)&v14 _pasteSessionDidFinish:v4];
}

- (void)deleteBackward
{
  objc_super v3 = [(UITextField *)self selectedTextRange];
  if (v3)
  {
    NSUInteger v4 = [(UIResponder *)self _nsrangeForTextRange:v3];
    NSUInteger v6 = v5;
    uint64_t v7 = [(UISearchTextField *)self textualRange];
    NSUInteger v8 = [(UIResponder *)self _nsrangeForTextRange:v7];
    NSUInteger v10 = v9;

    if (v6)
    {
      if (v4 >= v8)
      {
        [(UITextField *)&v12 deleteBackward];
      }
      else if ((*((unsigned char *)&self->_searchBarTextFieldFlags + 12) & 2) != 0)
      {
        [(UITextField *)&v15 deleteBackward];
      }
      else if (v4 + v6 > v8)
      {
        v17.NSUInteger location = v4;
        v17.NSUInteger length = v6;
        v18.NSUInteger location = v8;
        v18.NSUInteger length = v10;
        NSRange v11 = NSIntersectionRange(v17, v18);
        -[UITextField setSelectionRange:](self, "setSelectionRange:", v11.location, v11.length);
        [(UITextField *)&v14 deleteBackward];
      }
    }
    else if (v8 && v4 && v4 <= v8)
    {
      -[UITextField setSelectionRange:](self, "setSelectionRange:", v4 - 1, 1);
    }
    else
    {
      [(UITextField *)&v13 deleteBackward];
    }
  }
  else
  {
    [(UITextField *)&v16 deleteBackward];
  }
}

- (void)_updateAtomViewSelection:(BOOL)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    NSUInteger v4 = [(UITextField *)self textStorage];
    uint64_t v5 = [(UITextField *)self selectionRange];
    uint64_t v7 = v6;
    uint64_t v28 = 0;
    NSUInteger v29 = &v28;
    uint64_t v30 = 0x3032000000;
    id v31 = __Block_byref_object_copy__19;
    uint64_t v32 = __Block_byref_object_dispose__19;
    id v33 = 0;
    NSUInteger v8 = [(UITextField *)self textLayoutController];
    NSUInteger v9 = [v8 documentRange];
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    uint64_t v20 = __46__UISearchTextField__updateAtomViewSelection___block_invoke;
    uint64_t v21 = &unk_1E52DEB40;
    id v10 = v8;
    id v22 = v10;
    NSRange v11 = v4;
    uint64_t v26 = v5;
    uint64_t v27 = v7;
    id v23 = v11;
    BOOL v24 = self;
    uint64_t v25 = &v28;
    [v10 enumerateTextLineFragmentsInRange:v9 usingBlock:&v18];

    objc_super v12 = [(UISearchTextField *)self tokens];
    if ([v12 count] == 1)
    {
      objc_super v13 = [(UISearchTextField *)self text];
      if (![v13 length])
      {
        BOOL v17 = v29[5] == 0;

        if (!v17) {
          [(id)v29[5] setSelectionStyle:1 animated:0];
        }
        goto LABEL_6;
      }
    }
LABEL_6:

    _Block_object_dispose(&v28, 8);
    goto LABEL_14;
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  NSRange v11 = self->_knownTokenLayoutViews;
  uint64_t v14 = [(NSHashTable *)v11 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v35;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v35 != v15) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v34 + 1) + 8 * v16++) setSelectionStyle:0 animated:0];
      }
      while (v14 != v16);
      uint64_t v14 = [(NSHashTable *)v11 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v14);
  }
LABEL_14:
}

uint64_t __46__UISearchTextField__updateAtomViewSelection___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) characterRangeForTextRange:a2];
  NSUInteger v4 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)off_1E52D1F50;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__UISearchTextField__updateAtomViewSelection___block_invoke_2;
  v9[3] = &unk_1E52DEB18;
  long long v6 = *(_OWORD *)(a1 + 64);
  long long v10 = *(_OWORD *)(a1 + 48);
  long long v11 = v6;
  return objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", v5, v3, v7, 0, v9);
}

void __46__UISearchTextField__updateAtomViewSelection___block_invoke_2(void *a1, void *a2, unint64_t a3, uint64_t a4)
{
  id v27 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  NSUInteger v8 = v27;
  if (isKindOfClass)
  {
    NSUInteger v9 = [v27 _viewProvider];
    long long v10 = [v9 view];

    uint64_t v11 = 0;
    unint64_t v12 = a1[6];
    if (a3 >= v12)
    {
      unint64_t v13 = a1[7];
      if (a3 - v12 < v13)
      {
        BOOL v14 = a3 == v12;
        BOOL v15 = a3 + a4 == v13 + v12;
        uint64_t v16 = (void *)a1[4];
        BOOL v17 = [v16 beginningOfDocument];
        uint64_t v18 = [v16 positionFromPosition:v17 offset:a3];
        uint64_t v19 = [v16 baseWritingDirectionForPosition:v18 inDirection:0];

        if (v19 == 1) {
          BOOL v20 = v15;
        }
        else {
          BOOL v20 = v14;
        }
        if (v19 == 1) {
          BOOL v21 = v14;
        }
        else {
          BOOL v21 = v15;
        }
        int v22 = v20 || v21;
        BOOL v23 = !v20;
        uint64_t v24 = 4;
        if (v23) {
          uint64_t v24 = 0;
        }
        BOOL v23 = !v21;
        uint64_t v25 = 8;
        if (v23) {
          uint64_t v25 = 0;
        }
        uint64_t v26 = v24 | v25;
        if (v22) {
          uint64_t v11 = v26;
        }
        else {
          uint64_t v11 = 1;
        }
        objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), v10);
      }
    }
    [v10 setSelectionStyle:v11 animated:0];

    NSUInteger v8 = v27;
  }
}

- (void)fieldEditorDidChangeSelection:(id)a3
{
  id v4 = a3;
  [(UISearchTextField *)self _updateAtomViewSelection:[(UITextField *)self _fieldEditorAttached]];
  v7.receiver = self;
  v7.super_class = (Class)UISearchTextField;
  [(UITextField *)&v7 fieldEditorDidChangeSelection:v4];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
  long long v6 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _searchFieldSelectionChanged];
  }
}

- (void)_clearSearchSuggestionsIfNecessary
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if ((a1[1112] & 0x20) != 0)
    {
      uint64_t v2 = [a1 _suggestionController];
      int v3 = [v2 hasVisibleMenu];

      if (v3)
      {
        if (os_variant_has_internal_diagnostics())
        {
          uint64_t v5 = __UIFaultDebugAssertLog();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
          {
            int v6 = 138412290;
            objc_super v7 = a1;
            _os_log_fault_impl(&dword_1853B0000, v5, OS_LOG_TYPE_FAULT, "UIKit inconsistency: Menu became visible with clear-search-suggestions still pending. Search suggestions will not be cleared. %@", (uint8_t *)&v6, 0xCu);
          }
        }
        else
        {
          id v4 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_clearSearchSuggestionsIfNecessary___s_category)
                            + 8);
          if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
          {
            int v6 = 138412290;
            objc_super v7 = a1;
            _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_ERROR, "UIKit inconsistency: Menu became visible with clear-search-suggestions still pending. Search suggestions will not be cleared. %@", (uint8_t *)&v6, 0xCu);
          }
        }
      }
      else
      {
        [a1 setSearchSuggestions:0];
      }
    }
    a1[1112] &= ~0x20u;
  }
}

- (void)_notifyDidBeginEditing
{
  v5.receiver = self;
  v5.super_class = (Class)UISearchTextField;
  [(UITextField *)&v5 _notifyDidBeginEditing];
  int v3 = [(UISearchTextField *)self _deferredSearchSuggestions];
  if (v3)
  {
    *((unsigned char *)&self->_searchBarTextFieldFlags + 12) &= 0xCFu;
    id v4 = [(UISearchTextField *)self _suggestionController];
    [v4 updateSuggestions:v3 userInitiated:1];

    [(UISearchTextField *)self _setDeferredSearchSuggestions:0];
  }
}

- (void)_notifyDidEndEditing
{
  -[UISearchTextField _clearSearchSuggestionsIfNecessary](self);
  v3.receiver = self;
  v3.super_class = (Class)UISearchTextField;
  [(UITextField *)&v3 _notifyDidEndEditing];
}

- (void)_receivedKeyboardDidShowNotification:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UISearchTextField;
  [(UITextField *)&v6 _receivedKeyboardDidShowNotification:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
  objc_super v5 = [WeakRetained _searchController];
  [v5 _stopDeferringAndShowDeferredSearchSuggestions];
}

- (BOOL)allowsDraggingAttachments
{
  return 1;
}

- (id)_rangeOfCustomDraggableObjectsInRange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_UISearchBarTextFieldTokenCounter *)self->_tokenCounter characterRangeOfAllTokens];
  if (v6)
  {
    objc_super v7 = -[UIResponder _textRangeFromNSRange:](self, "_textRangeFromNSRange:", v5, v6);
    uint64_t v8 = [(UIResponder *)self _intersectionOfRange:v7 andRange:v4];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)_customDraggableObjectsForRange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UITextField *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [(UIResponder *)self _nsrangeForTextRange:v4];
    uint64_t v8 = v7;
    NSUInteger v9 = objc_opt_new();
    long long v10 = [(_UISearchBarTextFieldTokenCounter *)self->_tokenCounter tokenCharacterIndexes];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __53__UISearchTextField__customDraggableObjectsForRange___block_invoke;
    v15[3] = &unk_1E52DEAF0;
    void v15[4] = self;
    id v16 = v5;
    id v17 = v4;
    id v11 = v9;
    id v18 = v11;
    objc_msgSend(v10, "enumerateIndexesInRange:options:usingBlock:", v6, v8, 0, v15);

    unint64_t v12 = v18;
    id v13 = v11;
  }
  else
  {
    id v13 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v13;
}

void __53__UISearchTextField__customDraggableObjectsForRange___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(*(void *)(a1 + 32) + 1128) tokenAtCharacterIndex:a2];
  uint64_t v5 = [*(id *)(a1 + 40) searchTextField:*(void *)(a1 + 32) itemProviderForCopyingToken:v4];
  if (v5)
  {
    uint64_t v6 = +[UITextDraggableObject draggableObjectWithItemProvider:v5 fromRange:*(void *)(a1 + 48)];
    uint64_t v7 = [*(id *)(a1 + 32) _textStorage];
    uint64_t v8 = [v7 attribute:*(void *)off_1E52D1F50 atIndex:a2 effectiveRange:0];

    NSUInteger v9 = [v8 _viewProvider];
    long long v10 = [v9 view];

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __53__UISearchTextField__customDraggableObjectsForRange___block_invoke_2;
    v12[3] = &unk_1E52DEB68;
    id v13 = v10;
    id v11 = v10;
    [v6 setTargetedPreviewProvider:v12];
    [*(id *)(a1 + 56) addObject:v6];
  }
}

uint64_t __53__UISearchTextField__customDraggableObjectsForRange___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) targetedDragPreviewInContainerView:a2];
}

- (void)fieldEditorDidChange:(id)a3
{
  id v4 = a3;
  -[UISearchTextField _clearSearchSuggestionsIfNecessary](self);
  v5.receiver = self;
  v5.super_class = (Class)UISearchTextField;
  [(UITextField *)&v5 fieldEditorDidChange:v4];
}

- (BOOL)_preventSelectionViewActivation
{
  return self->__preventSelectionViewActivation;
}

- (void)_setPreventSelectionViewActivation:(BOOL)a3
{
  self->__preventSelectionViewActivation = a3;
}

- (BOOL)_alwaysShowsClearButtonWhenEmpty
{
  return self->__alwaysShowsClearButtonWhenEmpty;
}

- (void)_setAlwaysShowsClearButtonWhenEmpty:(BOOL)a3
{
  self->__alwaysShowsClearButtonWhenEmptdouble y = a3;
}

@end