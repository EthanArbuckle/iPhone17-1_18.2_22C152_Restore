@interface SPUITextField
+ (double)lineHeightMultiplierForCurrentLanguage;
+ (id)removeDictationCharacterInString:(id)a3;
+ (id)webEntityStringForEntity:(id)a3;
+ (void)updateBlueButton;
- (BOOL)_shouldSendContentChangedNotificationsIfOnlyMarkedTextChanged;
- (BOOL)becomeFirstResponder;
- (BOOL)canAcquireFieldEditor;
- (BOOL)canBecomeFocused;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)completionResultIsPotentiallyPunchout;
- (BOOL)didShowWebEntityBeforeTap;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)hasContent;
- (BOOL)ignoreTokensUpdate;
- (BOOL)isOnDarkBackground;
- (BOOL)keyboardInput:(id)a3 shouldInsertText:(id)a4 isMarkedText:(BOOL)a5;
- (BOOL)keyboardInputShouldDelete:(id)a3;
- (BOOL)lastUpdateWasDeletion;
- (BOOL)needsLandscapeHeight;
- (BOOL)optOutOfGoButton;
- (BOOL)resignFirstResponder;
- (BOOL)shouldPromoteCompletion;
- (BOOL)supportsAdaptiveImageGlyph;
- (BOOL)supportsEmojiImageTextAttachments;
- (CGRect)_shiftedBoundsForText:(CGRect)a3;
- (CGRect)clearButtonRectForBounds:(CGRect)a3;
- (CGRect)editingRectForBounds:(CGRect)a3;
- (CGRect)leftViewRectForBounds:(CGRect)a3;
- (CGRect)rightViewRectForBounds:(CGRect)a3;
- (CGRect)textRectForBounds:(CGRect)a3;
- (CGSize)intrinsicContentSize;
- (NSString)restorationStringOnKBMovement;
- (NSString)textIncludingTokens;
- (NSTimer)switchBackToSuggestionsTimer;
- (SPSearchEntity)searchEntity;
- (SPUICompletionStringModel)searchFieldModel;
- (SPUICompletionStringView)hintingView;
- (SPUIHeaderBlurView)blurView;
- (SPUITextField)init;
- (UIColor)primaryColor;
- (UIColor)secondaryColor;
- (UIFont)accessoryIconFont;
- (UIGestureRecognizer)completionTapGestureRecognizer;
- (UIImage)microphoneImage;
- (UIResponder)responderForKeyboardInput;
- (UIScribbleInteraction)scribbleInteraction;
- (UITextCursorAssertion)caretAssertion;
- (UIView)canvasView;
- (UIView)tintView;
- (_NSRange)insertFilteredText:(id)a3;
- (double)backgroundCornerRadius;
- (double)textFieldHeight;
- (id)accessoryIconWithSymbolName:(id)a3;
- (id)animateAssertion;
- (id)assertionForGrabbers;
- (id)currentQueryContext;
- (id)focusGroupIdentifier;
- (id)keyCommands;
- (id)nextResponder;
- (id)preferredFocusEnvironments;
- (int64_t)accessorySymbolWeight;
- (int64_t)activeInterfaceOrientation;
- (int64_t)focusItemDeferralMode;
- (void)_promoteCompletionAndMoveForward:(BOOL)a3;
- (void)applyMetrics;
- (void)beginFloatingCursorAtPoint:(CGPoint)a3;
- (void)buildMenuWithBuilder:(id)a3;
- (void)clearAllTokens;
- (void)commitToCommitedSearch;
- (void)cut:(id)a3;
- (void)detokenizeIfNeededAndSearch:(BOOL)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)enterKeyPressed;
- (void)escapeKeyCommand;
- (void)insertText:(id)a3;
- (void)keyboardFrameChanged:(id)a3;
- (void)layoutSubviews;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)promoteCompletionIfPossibleAndMoveForward:(BOOL)a3;
- (void)removeCaretAssertion;
- (void)removeCompletionAndHighlight;
- (void)removeCompletionsOrEntitiesAndGoToSuggestions:(BOOL)a3;
- (void)resetClearButtonWithScale:(int64_t)a3;
- (void)resetDeletion;
- (void)resetPhoneClearButton;
- (void)scribbleInteractionWillBeginWriting:(id)a3;
- (void)selectAll:(id)a3;
- (void)setAccessoryIconFont:(id)a3;
- (void)setAccessorySymbolWeight:(int64_t)a3;
- (void)setActiveInterfaceOrientation:(int64_t)a3;
- (void)setAnimateAssertion:(id)a3;
- (void)setAssertionForGrabbers:(id)a3;
- (void)setBlurView:(id)a3;
- (void)setCanAcquireFieldEditor:(BOOL)a3;
- (void)setCaretAssertion:(id)a3;
- (void)setCompletionTapGestureRecognizer:(id)a3;
- (void)setDidShowWebEntityBeforeTap:(BOOL)a3;
- (void)setFont:(id)a3;
- (void)setHintingView:(id)a3;
- (void)setIgnoreTokensUpdate:(BOOL)a3;
- (void)setLastUpdateWasDeletion:(BOOL)a3;
- (void)setMicrophoneImage:(id)a3;
- (void)setResponderForKeyboardInput:(id)a3;
- (void)setRestorationStringOnKBMovement:(id)a3;
- (void)setScribbleInteraction:(id)a3;
- (void)setSearchFieldModel:(id)a3;
- (void)setSelectionGrabbersHiddenSafe:(BOOL)a3;
- (void)setSwitchBackToSuggestionsTimer:(id)a3;
- (void)setTextColor:(id)a3;
- (void)setTintView:(id)a3;
- (void)textFieldWasTapped;
- (void)tintColorDidChange;
- (void)toggleBackToCommittedSearch;
- (void)toggleCommitedSearch;
- (void)traitCollectionDidChange:(id)a3;
- (void)unmarkText;
- (void)updateCaretVisibility;
- (void)updateCaretVisibility:(BOOL)a3;
- (void)updateFocusResult:(id)a3 cardSection:(id)a4 focusIsOnFirstResult:(BOOL)a5;
- (void)updateLeftViewWithSymbolName:(id)a3;
- (void)updateRightView;
- (void)updateTextAlignmentShouldCenter:(BOOL)a3 animated:(BOOL)a4;
- (void)updateTextRange:(id)a3;
- (void)updateToken:(id)a3;
- (void)updateWithPrimaryColor:(id)a3 secondaryColor:(id)a4 isOnDarkBackground:(BOOL)a5 appearance:(id)a6;
@end

@implementation SPUITextField

- (SPUIHeaderBlurView)blurView
{
  return self->_blurView;
}

- (double)backgroundCornerRadius
{
  int v2 = [MEMORY[0x263F79140] bottomSearchFieldEnabled];
  double result = 10.0;
  if (v2) {
    return 16.0;
  }
  return result;
}

- (void)updateWithPrimaryColor:(id)a3 secondaryColor:(id)a4 isOnDarkBackground:(BOOL)a5 appearance:(id)a6
{
  BOOL v7 = a5;
  v49[3] = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  objc_storeStrong((id *)&self->_primaryColor, a3);
  objc_storeStrong((id *)&self->_secondaryColor, a4);
  self->_isOnDarkBackground = v7;
  if (([MEMORY[0x263F79140] enableFloatingWindow] & 1) == 0)
  {
    BOOL IsReduceTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
    if (IsReduceTransparencyEnabled)
    {
      int v15 = 0;
      BOOL v16 = 0;
      v17 = 0;
    }
    else
    {
      if (v7) {
        [MEMORY[0x263F825C8] whiteColor];
      }
      else {
      v17 = [MEMORY[0x263F825C8] blackColor];
      }
      int v15 = !v7;
      BOOL v16 = v7;
    }
    v18 = [(SPUITextField *)self tintView];
    [v18 setBackgroundColor:v17];

    if (v15) {
    if (v16)
    }

    v19 = (uint64_t *)MEMORY[0x263F15D58];
    if (!v7) {
      v19 = (uint64_t *)MEMORY[0x263F15D50];
    }
    uint64_t v20 = *v19;
    if (IsReduceTransparencyEnabled) {
      uint64_t v21 = 0;
    }
    else {
      uint64_t v21 = v20;
    }
    v22 = [(SPUITextField *)self tintView];
    v23 = [v22 layer];
    [v23 setCompositingFilter:v21];
  }
  [(SPUITextField *)self setTintColor:v11];
  [(SPUITextField *)self setTextColor:v11];
  v24 = [(SPUITextField *)self leftView];
  v49[0] = v24;
  v25 = [(SPUITextField *)self _clearButton];
  v49[1] = v25;
  v26 = [(SPUITextField *)self _placeholderLabel];
  v49[2] = v26;
  v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v49 count:3];

  v28 = [(SPUITextField *)self rightView];

  if (v28)
  {
    v29 = [(SPUITextField *)self rightView];
    uint64_t v30 = [v27 arrayByAddingObject:v29];

    v27 = (void *)v30;
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v31 = v27;
  uint64_t v32 = [v31 countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v43 != v34) {
          objc_enumerationMutation(v31);
        }
        v36 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        objc_msgSend(v36, "setTintColor:", v12, (void)v42);
        [v13 enableAppearanceForView:v36];
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v42 objects:v48 count:16];
    }
    while (v33);
  }

  v37 = [v11 colorWithAlphaComponent:0.36];
  id v38 = objc_alloc(MEMORY[0x263F086A0]);
  v39 = [(SPUITextField *)self placeholder];
  uint64_t v46 = *MEMORY[0x263F81500];
  v47 = v37;
  v40 = [NSDictionary dictionaryWithObjects:&v47 forKeys:&v46 count:1];
  v41 = (void *)[v38 initWithString:v39 attributes:v40];

  [(SPUITextField *)self setAttributedPlaceholder:v41];
}

- (UIView)tintView
{
  return (UIView *)objc_getProperty(self, a2, 1256, 1);
}

- (void)setTextColor:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SPUITextField;
  id v4 = a3;
  [(SPUITextField *)&v6 setTextColor:v4];
  v5 = [(SPUITextField *)self hintingView];
  [v5 setTextColorForCompletionLabel:v4];
}

- (void)updateFocusResult:(id)a3 cardSection:(id)a4 focusIsOnFirstResult:(BOOL)a5
{
  BOOL v5 = a5;
  unint64_t v16 = (unint64_t)a3;
  unint64_t v8 = (unint64_t)a4;
  if (!v5)
  {
    v9 = [(SPUITextField *)self restorationStringOnKBMovement];

    if (v9)
    {
      v10 = [(SPUITextField *)self restorationStringOnKBMovement];
      [(UISearchTextField *)self setText:v10];
    }
  }
  [(SPUITextField *)self setRestorationStringOnKBMovement:0];
  if (![(SPUITextField *)self isFirstResponder] || !(v16 | v8)) {
    goto LABEL_12;
  }
  id v11 = [(SPUITextField *)self scribbleInteraction];
  if ([v11 isHandlingWriting])
  {

LABEL_12:
    int v15 = [(SPUITextField *)self hintingView];
    [v15 updateWithResult:0 cardSection:0 focusIsOnFirstResult:v5];

    v14 = [MEMORY[0x263F82758] focusSystemForEnvironment:self];
    [v14 requestFocusUpdateToEnvironment:self];
    goto LABEL_13;
  }
  id v12 = [(SPUITextField *)self selectedTextRange];
  char v13 = [v12 isEmpty];

  if ((v13 & 1) == 0) {
    goto LABEL_12;
  }
  if (![(SPUITextField *)self lastUpdateWasDeletion] || !v5)
  {
    v14 = [(SPUITextField *)self hintingView];
    [v14 updateWithResult:v16 cardSection:v8 focusIsOnFirstResult:v5];
LABEL_13:
  }
  [(SPUITextField *)self updateCaretVisibility];
}

- (void)updateCaretVisibility
{
  id v3 = [(SPUITextField *)self hintingView];
  -[SPUITextField updateCaretVisibility:](self, "updateCaretVisibility:", [v3 hasContent] ^ 1);
}

- (void)updateCaretVisibility:(BOOL)a3
{
  if (a3)
  {
    [(SPUITextField *)self removeCaretAssertion];
  }
  else
  {
    id v4 = [(SPUITextField *)self caretAssertion];

    if (!v4)
    {
      id v7 = [(SPUITextField *)self _textInteraction];
      BOOL v5 = [v7 _assertionController];
      objc_super v6 = [v5 nonVisibleAssertionWithReason:@"spotlightHasCompletion"];
      [(SPUITextField *)self setCaretAssertion:v6];
    }
  }
}

- (void)setCaretAssertion:(id)a3
{
}

- (void)removeCaretAssertion
{
  id v3 = [(SPUITextField *)self caretAssertion];
  [v3 invalidate];

  [(SPUITextField *)self setCaretAssertion:0];
}

- (UITextCursorAssertion)caretAssertion
{
  return (UITextCursorAssertion *)objc_getProperty(self, a2, 1288, 1);
}

- (void)layoutSubviews
{
  v26.receiver = self;
  v26.super_class = (Class)SPUITextField;
  [(UISearchTextField *)&v26 layoutSubviews];
  id v3 = [(SPUITextField *)self _fieldEditor];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  if (![(SPUITextField *)self effectiveUserInterfaceLayoutDirection])
  {
    [(SPUITextField *)self bounds];
    -[SPUITextField textRectForBounds:](self, "textRectForBounds:");
    double v13 = v12;
    double v11 = v14;
    [(SPUITextField *)self bounds];
    -[SPUITextField clearButtonRectForBounds:](self, "clearButtonRectForBounds:");
    double v9 = v13 + v15 + -16.0;
  }
  unint64_t v16 = [(SPUITextField *)self hintingView];
  objc_msgSend(v16, "setFrame:", v5, v7, v9, v11);

  v17 = [(SPUITextField *)self hintingView];
  uint64_t v18 = [v17 hasPrefix];
  v19 = [(SPUITextField *)self _fieldEditor];
  [v19 setHidden:v18];

  uint64_t v20 = [(SPUITextField *)self _fieldEditor];
  [v20 alpha];
  double v22 = v21;

  if (v22 == 1.0)
  {
    v23 = [(SPUITextField *)self hintingView];
    uint64_t v24 = [v23 hasContent];
    v25 = [(SPUITextField *)self _placeholderLabel];
    [v25 setHidden:v24];
  }
}

- (SPUICompletionStringView)hintingView
{
  return (SPUICompletionStringView *)objc_getProperty(self, a2, 1272, 1);
}

- (void)setRestorationStringOnKBMovement:(id)a3
{
}

- (NSString)restorationStringOnKBMovement
{
  return (NSString *)objc_getProperty(self, a2, 1304, 1);
}

- (id)nextResponder
{
  id v3 = [(SPUITextField *)self responderForKeyboardInput];
  if (v3 && ([MEMORY[0x263F828A0] isInHardwareKeyboardMode] & 1) != 0)
  {
    uint64_t v4 = [(SPUITextField *)self responderForKeyboardInput];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SPUITextField;
    uint64_t v4 = [(SPUITextField *)&v7 nextResponder];
  }
  double v5 = (void *)v4;

  return v5;
}

- (UIResponder)responderForKeyboardInput
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_responderForKeyboardInput);
  return (UIResponder *)WeakRetained;
}

- (void)setResponderForKeyboardInput:(id)a3
{
}

- (void)keyboardFrameChanged:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  double v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F837B8]];
  [v5 CGRectValue];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  double v14 = [(SPUITextField *)self tlks_screen];
  [v14 bounds];
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;

  v25.origin.x = v7;
  v25.origin.y = v9;
  v25.size.width = v11;
  v25.size.height = v13;
  v27.origin.x = v16;
  v27.origin.y = v18;
  v27.size.width = v20;
  v27.size.height = v22;
  CGRect v26 = CGRectIntersection(v25, v27);
  BOOL v23 = CGRectGetHeight(v26) <= 0.0;
  [(SPUITextField *)self updateTextAlignmentShouldCenter:v23 animated:1];
}

- (CGRect)editingRectForBounds:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SPUITextField;
  -[UISearchTextField editingRectForBounds:](&v8, sel_editingRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[SPUITextField _shiftedBoundsForText:](self, "_shiftedBoundsForText:");
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)textRectForBounds:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SPUITextField;
  -[UISearchTextField textRectForBounds:](&v8, sel_textRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[SPUITextField _shiftedBoundsForText:](self, "_shiftedBoundsForText:");
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)rightViewRectForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([MEMORY[0x263F79140] enableFloatingWindow])
  {
    [(SPUITextField *)self textFieldHeight];
    double v9 = v8;
    v21.origin.double x = x;
    v21.origin.double y = y;
    v21.size.double width = width;
    v21.size.double height = height;
    double v10 = CGRectGetMaxX(v21) - v9 + -2.0;
    double v11 = v9;
  }
  else if ([MEMORY[0x263F79140] bottomSearchFieldEnabled])
  {
    v20.receiver = self;
    v20.super_class = (Class)SPUITextField;
    -[UISearchTextField rightViewRectForBounds:](&v20, sel_rightViewRectForBounds_, x, y, width, height);
    double y = v12;
    double v9 = v13;
    double v10 = v14 + -3.5;
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)SPUITextField;
    -[UISearchTextField rightViewRectForBounds:](&v19, sel_rightViewRectForBounds_, x, y, width, height);
    double y = v15;
    double v9 = v16;
  }
  double v17 = y;
  double v18 = v9;
  result.size.double height = v11;
  result.size.double width = v18;
  result.origin.double y = v17;
  result.origin.double x = v10;
  return result;
}

- (CGRect)_shiftedBoundsForText:(CGRect)a3
{
  CGFloat height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  double x = a3.origin.x;
  if ([MEMORY[0x263F79140] enableFloatingWindow])
  {
    [(SPUITextField *)self textFieldHeight];
    double v9 = v8;
    double v10 = [(UISearchTextField *)self tokens];
    uint64_t v11 = [v10 count];
    double v12 = 12.0;
    if (!v11) {
      double v12 = 4.0;
    }
    double x = v9 - v12;

    [(SPUITextField *)self bounds];
    double width = CGRectGetWidth(v24) - (v9 + v9);
    double v13 = [MEMORY[0x263F82438] sharedApplication];
    uint64_t v14 = [v13 userInterfaceLayoutDirection];

    if (!v14)
    {
      double v15 = [(SPUITextField *)self hintingView];
      [v15 trailingPaddingForFieldEditor];
      double width = width - v16;
    }
  }
  else if ([MEMORY[0x263F79140] bottomSearchFieldEnabled])
  {
    double v17 = [MEMORY[0x263F82438] sharedApplication];
    uint64_t v18 = [v17 userInterfaceLayoutDirection];

    if (!v18)
    {
      [MEMORY[0x263F7E3B0] deviceScaledRoundedValue:self forView:7.5];
      double x = x + v19;
      double width = width + -16.0;
    }
  }
  double v20 = x;
  double v21 = y;
  double v22 = width;
  double v23 = height;
  result.size.CGFloat height = v23;
  result.size.double width = v22;
  result.origin.CGFloat y = v21;
  result.origin.double x = v20;
  return result;
}

- (CGRect)clearButtonRectForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([MEMORY[0x263F79140] enableFloatingWindow])
  {
    if ([(SPUITextField *)self effectiveUserInterfaceLayoutDirection]) {
      -[SPUITextField leftViewRectForBounds:](self, "leftViewRectForBounds:", x, y, width, height);
    }
    else {
      -[SPUITextField rightViewRectForBounds:](self, "rightViewRectForBounds:", x, y, width, height);
    }
    goto LABEL_10;
  }
  if (![MEMORY[0x263F79140] bottomSearchFieldEnabled])
  {
    v25.receiver = self;
    v25.super_class = (Class)SPUITextField;
    -[UISearchTextField clearButtonRectForBounds:](&v25, sel_clearButtonRectForBounds_, x, y, width, height);
LABEL_10:
    double v15 = v9;
    double v17 = v10;
    double v19 = v11;
    goto LABEL_11;
  }
  v26.receiver = self;
  v26.super_class = (Class)SPUITextField;
  -[UISearchTextField clearButtonRectForBounds:](&v26, sel_clearButtonRectForBounds_, x, y, width, height);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  uint64_t v20 = [(SPUITextField *)self effectiveUserInterfaceLayoutDirection];
  double v21 = -3.5;
  if (!v20) {
    double v21 = 7.5;
  }
  double v8 = v13 - v21;
LABEL_11:
  double v22 = v15;
  double v23 = v17;
  double v24 = v19;
  result.size.double height = v24;
  result.size.double width = v23;
  result.origin.double y = v22;
  result.origin.double x = v8;
  return result;
}

- (CGRect)leftViewRectForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([MEMORY[0x263F79140] enableFloatingWindow])
  {
    [(SPUITextField *)self textFieldHeight];
    double v9 = v8;
    double v10 = v8 + 1.0;
    double v11 = x + -1.0;
  }
  else if ([MEMORY[0x263F79140] bottomSearchFieldEnabled])
  {
    v17.receiver = self;
    v17.super_class = (Class)SPUITextField;
    -[UISearchTextField leftViewRectForBounds:](&v17, sel_leftViewRectForBounds_, x, y, width, height);
    double y = v12;
    double v11 = v13 + 7.0;
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)SPUITextField;
    -[UISearchTextField leftViewRectForBounds:](&v16, sel_leftViewRectForBounds_, x, y, width, height);
    double y = v14;
  }
  double v15 = y;
  result.size.double height = v9;
  result.size.double width = v10;
  result.origin.double y = v15;
  result.origin.double x = v11;
  return result;
}

- (CGSize)intrinsicContentSize
{
  [MEMORY[0x263F67C00] idealPlatterWidth];
  double v4 = v3;
  [(SPUITextField *)self textFieldHeight];
  double v6 = v5;
  double v7 = v4;
  result.double height = v6;
  result.double width = v7;
  return result;
}

- (double)textFieldHeight
{
  if ([MEMORY[0x263F79140] bottomSearchFieldEnabled])
  {
    double v3 = (void *)MEMORY[0x263F7E3B0];
    [(id)objc_opt_class() lineHeightMultiplierForCurrentLanguage];
    double v5 = v4 * 48.0;
    double v6 = [(SPUITextField *)self font];
    [v3 scaledValueForValue:v6 withFont:self view:v5];
    double v8 = v7;

    return v8;
  }
  else if ([MEMORY[0x263F79140] enableFloatingWindow])
  {
    return 61.0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SPUITextField;
    [(UISearchTextField *)&v11 intrinsicContentSize];
    return v10;
  }
}

+ (double)lineHeightMultiplierForCurrentLanguage
{
  int v2 = (void *)MEMORY[0x263EFF960];
  double v3 = [MEMORY[0x263F828C0] sharedInputModeController];
  uint64_t v4 = [v3 currentInputMode];
  double v5 = [(id)v4 primaryLanguage];
  double v6 = [v2 localeWithLocaleIdentifier:v5];

  double v7 = [v6 languageCode];
  LOBYTE(v4) = [&unk_26F10BCB8 containsObject:v7];

  if (v4)
  {
    double v8 = 1.18;
  }
  else
  {
    double v9 = [v6 languageCode];
    int v10 = [&unk_26F10BCD0 containsObject:v9];

    if (v10) {
      double v8 = 1.27;
    }
    else {
      double v8 = 1.0;
    }
  }

  return v8;
}

- (SPUITextField)init
{
  v36.receiver = self;
  v36.super_class = (Class)SPUITextField;
  int v2 = [(SPUITextField *)&v36 init];
  double v3 = v2;
  if (v2)
  {
    [(SPUITextField *)v2 setSymbolAnimationEnabled:0];
    [(SPUITextField *)v3 setBorderStyle:0];
    uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    double v5 = [v4 localizedStringForKey:@"SEARCH_BAR_PLACEHOLDER" value:&stru_26F104E28 table:0];
    [(SPUITextField *)v3 setPlaceholder:v5];

    [(SPUITextField *)v3 setAutocapitalizationType:0];
    [(SPUITextField *)v3 setAutocorrectionType:1];
    [(SPUITextField *)v3 setReturnKeyType:6];
    [(SPUITextField *)v3 setEnablesReturnKeyAutomatically:1];
    [(SPUITextField *)v3 setAccessibilityIdentifier:@"SpotlightSearchField"];
    [(SPUITextField *)v3 setAcceptsDictationSearchResults:1];
    double v6 = [MEMORY[0x263F81708] boldSystemFontOfSize:23.0];
    [(SPUITextField *)v3 setAccessoryIconFont:v6];

    if ([MEMORY[0x263F79140] enableFloatingWindow])
    {
      double v7 = [MEMORY[0x263F81708] systemFontOfSize:26.0];
      [(SPUITextField *)v3 setFont:v7];

      objc_initWeak(&location, v3);
      double v8 = (void *)MEMORY[0x263F823D0];
      uint64_t v30 = MEMORY[0x263EF8330];
      uint64_t v31 = 3221225472;
      uint64_t v32 = __21__SPUITextField_init__block_invoke;
      uint64_t v33 = &unk_264E90610;
      objc_copyWeak(&v34, &location);
      double v9 = [v8 actionWithHandler:&v30];
      int v10 = objc_msgSend(MEMORY[0x263F824F0], "plainButtonConfiguration", v30, v31, v32, v33);
      [v10 setImagePlacement:15];
      objc_super v11 = [(SPUITextField *)v3 accessoryIconWithSymbolName:@"magnifyingglass"];
      [v10 setImage:v11];

      double v12 = [MEMORY[0x263F824E8] buttonWithConfiguration:v10 primaryAction:v9];
      [(SPUITextField *)v3 setLeftView:v12];

      double v13 = (void *)[objc_alloc(MEMORY[0x263F82B78]) initWithDelegate:v3];
      [(SPUITextField *)v3 setScribbleInteraction:v13];
      [(SPUITextField *)v3 addInteraction:v13];
      [(SPUITextField *)v3 resetClearButtonWithScale:1];

      objc_destroyWeak(&v34);
      objc_destroyWeak(&location);
    }
    else
    {
      [(SPUITextField *)v3 setCanAcquireFieldEditor:1];
      double v14 = objc_opt_new();
      [v14 setUserInteractionEnabled:0];
      double v15 = [(SPUITextField *)v3 subviews];
      objc_super v16 = [v15 lastObject];
      [(SPUITextField *)v3 insertSubview:v14 belowSubview:v16];

      [MEMORY[0x263F67C10] constrainViewToContainer:v14];
      [(SPUITextField *)v3 setTintView:v14];
      if ([MEMORY[0x263F79140] bottomSearchFieldEnabled])
      {
        objc_super v17 = [(SPUITextField *)v3 tintView];
        [v17 removeFromSuperview];
      }
      [(SPUITextField *)v3 applyMetrics];
      double v18 = [MEMORY[0x263F08A00] defaultCenter];
      [v18 addObserver:v3 selector:sel_applyMetrics name:*MEMORY[0x263F83428] object:0];

      [(SPUITextField *)v3 setKeyboardAppearance:11];
    }
    double v19 = objc_opt_new();
    [(SPUITextField *)v3 setHintingView:v19];

    uint64_t v20 = [(SPUITextField *)v3 font];
    double v21 = [(SPUITextField *)v3 hintingView];
    [v21 setFontForCompletionLabel:v20];

    double v22 = [(SPUITextField *)v3 hintingView];
    double v23 = [(SPUITextField *)v3 subviews];
    double v24 = [v23 lastObject];
    [(SPUITextField *)v3 insertSubview:v22 below:v24];

    objc_super v25 = [(SPUITextField *)v3 layer];
    [v25 setAllowsGroupBlending:0];

    objc_super v26 = [(SPUITextField *)v3 leftView];
    [v26 setTintColor:0];

    [(SPUITextField *)v3 setTextDragOptions:1];
    CGRect v27 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:v3 action:sel_textFieldWasTapped];
    [v27 setDelegate:v3];
    [(SPUITextField *)v3 addGestureRecognizer:v27];
    [(SPUITextField *)v3 setCompletionTapGestureRecognizer:v27];
    if ([MEMORY[0x263F79140] bottomSearchFieldEnabled])
    {
      v28 = [MEMORY[0x263F08A00] defaultCenter];
      [v28 addObserver:v3 selector:sel_keyboardFrameChanged_ name:*MEMORY[0x263F837F8] object:0];
    }
    else
    {
      [(SPUITextField *)v3 updateTextAlignmentShouldCenter:0 animated:1];
    }
    [(SPUITextField *)v3 setSymbolAnimationEnabled:0];
  }
  return v3;
}

- (void)setCanAcquireFieldEditor:(BOOL)a3
{
  self->_canAcquireFieldEditor = a3;
  if (!a3)
  {
    id v3 = [(SPUITextField *)self blurView];
    [v3 setAlpha:0.0];
  }
}

- (void)setTintView:(id)a3
{
}

- (void)setHintingView:(id)a3
{
}

- (void)setCompletionTapGestureRecognizer:(id)a3
{
}

- (void)setAccessoryIconFont:(id)a3
{
}

- (void)applyMetrics
{
  if ([MEMORY[0x263F79140] bottomSearchFieldEnabled]) {
    double v3 = 16.0;
  }
  else {
    double v3 = 10.0;
  }
  uint64_t v4 = [(SPUITextField *)self tintView];
  [v4 _setContinuousCornerRadius:v3];

  double v5 = [(SPUITextField *)self blurView];
  [v5 _setContinuousCornerRadius:v3];

  double v6 = [(SPUITextField *)self blurView];
  double v7 = [v6 contentView];
  [v7 _setContinuousCornerRadius:v3];

  [(SPUITextField *)self invalidateIntrinsicContentSize];
  double v8 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
  [(SPUITextField *)self setFont:v8];

  if ([MEMORY[0x263F79140] bottomSearchFieldEnabled])
  {
    double v9 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83628]];
    [(SPUITextField *)self setFont:v9];
  }
  [(SPUITextField *)self resetPhoneClearButton];
}

- (void)setFont:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SPUITextField;
  [(SPUITextField *)&v6 setFont:a3];
  uint64_t v4 = [(SPUITextField *)self font];
  double v5 = [(SPUITextField *)self hintingView];
  [v5 setFontForCompletionLabel:v4];
}

- (void)resetPhoneClearButton
{
  if (([MEMORY[0x263F79140] enableFloatingWindow] & 1) == 0)
  {
    if ([MEMORY[0x263F7E3B0] isSuperLargeAccessibilitySize]) {
      uint64_t v3 = 1;
    }
    else {
      uint64_t v3 = 2;
    }
    [(SPUITextField *)self resetClearButtonWithScale:v3];
  }
}

- (void)resetClearButtonWithScale:(int64_t)a3
{
  id v4 = [(SPUITextField *)self accessoryIconWithSymbolName:@"xmark.circle.fill"];
  [(UISearchTextField *)self _setClearButtonImage:v4 forState:0];
}

- (id)accessoryIconWithSymbolName:(id)a3
{
  id v4 = (void *)MEMORY[0x263F79140];
  id v5 = a3;
  int v6 = [v4 enableFloatingWindow];
  double v7 = (void *)MEMORY[0x263F67C70];
  if (v6)
  {
    double v8 = [(SPUITextField *)self accessoryIconFont];
    [v7 uiImageWithSymbolName:v5 font:v8 scale:-1 weight:6 isTemplate:1];
  }
  else
  {
    double v8 = [(SPUITextField *)self font];
    [v7 uiImageWithSymbolName:v5 font:v8 scale:-1];
  double v9 = };

  return v9;
}

- (void)setMicrophoneImage:(id)a3
{
}

- (UIImage)microphoneImage
{
  return (UIImage *)objc_getProperty(self, a2, 1320, 1);
}

- (void)updateRightView
{
  BOOL v3 = [(SPUITextField *)self hasContent];
  if (v3) {
    uint64_t v4 = 3;
  }
  else {
    uint64_t v4 = 0;
  }
  if (v3) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = 3;
  }
  [(SPUITextField *)self setClearButtonMode:v4];
  [(SPUITextField *)self setRightViewMode:v5];
  [(SPUITextField *)self layoutIfNeeded];
}

- (BOOL)hasContent
{
  BOOL v3 = [(UISearchTextField *)self text];
  if ([v3 length])
  {
    BOOL v4 = 1;
  }
  else
  {
    uint64_t v5 = [(UISearchTextField *)self tokens];
    BOOL v4 = [v5 count] != 0;
  }
  return v4;
}

- (BOOL)becomeFirstResponder
{
  BOOL v3 = [(SPUITextField *)self animateAssertion];

  if (!v3)
  {
    BOOL v4 = [(SPUITextField *)self keyboardSceneDelegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      int v6 = [(SPUITextField *)self keyboardSceneDelegate];
      double v7 = [v6 requestAnimationAssertionWithDirection:6];
      [(SPUITextField *)self setAnimateAssertion:v7];
    }
  }
  uint64_t v8 = MEMORY[0x263F79148];
  double v9 = *(NSObject **)(MEMORY[0x263F79148] + 16);
  if (!v9)
  {
    SPUIInitLogging();
    double v9 = *(NSObject **)(v8 + 16);
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23D2E6000, v9, OS_LOG_TYPE_DEFAULT, "becomeFirstResponder", buf, 2u);
  }
  int v10 = [(SPUITextField *)self delegate];
  uint64_t v11 = [v10 currentlyPresentingWebEntity];

  [(SPUITextField *)self detokenizeIfNeededAndSearch:0];
  [(SPUITextField *)self setDidShowWebEntityBeforeTap:v11];
  v13.receiver = self;
  v13.super_class = (Class)SPUITextField;
  return [(UISearchTextField *)&v13 becomeFirstResponder];
}

- (void)setDidShowWebEntityBeforeTap:(BOOL)a3
{
  self->_didShowWebEntityBeforeTap = a3;
}

- (void)setAnimateAssertion:(id)a3
{
}

- (void)detokenizeIfNeededAndSearch:(BOOL)a3
{
  BOOL v3 = a3;
  if (![MEMORY[0x263F79140] bottomSearchFieldEnabled]) {
    goto LABEL_18;
  }
  char v5 = [(SPUITextField *)self delegate];
  if ([v5 currentlyPresentingWebEntity])
  {

    goto LABEL_5;
  }
  BOOL v6 = [(SPUITextField *)self didShowWebEntityBeforeTap];

  if (v6)
  {
LABEL_5:
    double v7 = [(UISearchTextField *)self tokens];
    uint64_t v8 = [v7 firstObject];
    double v9 = [v8 representedObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v11 = objc_opt_class();
      double v12 = [(UISearchTextField *)self tokens];
      objc_super v13 = [v12 firstObject];
      double v14 = [v13 representedObject];
      double v15 = [v11 webEntityStringForEntity:v14];
    }
    else
    {
      objc_super v16 = [(UISearchTextField *)self tokens];
      objc_super v17 = [v16 firstObject];
      double v18 = [v17 representedObject];
      objc_opt_class();
      char v19 = objc_opt_isKindOfClass();

      if ((v19 & 1) == 0)
      {
        double v15 = 0;
        goto LABEL_11;
      }
      double v12 = [(UISearchTextField *)self tokens];
      objc_super v13 = [v12 firstObject];
      double v15 = [v13 representedObject];
    }

LABEL_11:
    if ([v15 length])
    {
      [(SPUITextField *)self clearAllTokens];
      [(UISearchTextField *)self setText:v15];
      [(SPUITextField *)self setNeedsLayout];
      uint64_t v20 = [(SPUITextField *)self delegate];
      [v20 textFieldDidReplaceTokensWithStringEquivalent:self];
    }
    if (v3)
    {
      double v21 = [(SPUITextField *)self delegate];
      [v21 switchToSuggestions];
    }
  }
  if (v3)
  {
    [(SPUITextField *)self becomeFirstResponder];
    dispatch_time_t v22 = dispatch_time(0, 250000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __45__SPUITextField_detokenizeIfNeededAndSearch___block_invoke;
    block[3] = &unk_264E90660;
    block[4] = self;
    dispatch_after(v22, MEMORY[0x263EF83A0], block);
  }
LABEL_18:
  double v23 = [(SPUITextField *)self canvasView];
  [v23 setAlpha:1.0];
}

- (BOOL)didShowWebEntityBeforeTap
{
  return self->_didShowWebEntityBeforeTap;
}

- (id)animateAssertion
{
  return objc_getProperty(self, a2, 1328, 1);
}

- (void)tintColorDidChange
{
  v5.receiver = self;
  v5.super_class = (Class)SPUITextField;
  [(UISearchTextField *)&v5 tintColorDidChange];
  BOOL v3 = [(SPUITextField *)self selectionHighlightColor];
  BOOL v4 = [(SPUITextField *)self hintingView];
  [v4 setSelectionHighlightColor:v3];
}

- (void)removeCompletionAndHighlight
{
  BOOL v3 = [(SPUITextField *)self hintingView];
  int v4 = [v3 focusIsOnFirstResult];

  objc_super v5 = [(SPUITextField *)self hintingView];
  [v5 updateWithResult:0 cardSection:0 focusIsOnFirstResult:0];

  if (v4)
  {
    BOOL v6 = [(SPUITextField *)self delegate];
    [v6 removeCompletionAndHighlightAsTyped:0];
  }
  [(SPUITextField *)self updateCaretVisibility];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SPUITextField;
  [(SPUITextField *)&v4 traitCollectionDidChange:a3];
  [(SPUITextField *)self resetPhoneClearButton];
}

void __21__SPUITextField_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained delegate];
  [v1 backButtonPressed];
}

- (void)setSelectionGrabbersHiddenSafe:(BOOL)a3
{
  if (a3)
  {
    id v4 = [(SPUITextField *)self obtainSelectionGrabberSuppressionAssertion];
    [(SPUITextField *)self setAssertionForGrabbers:v4];
  }
  else
  {
    [(SPUITextField *)self setAssertionForGrabbers:0];
  }
}

- (void)updateTextAlignmentShouldCenter:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  double v7 = [(SPUITextField *)self window];
  uint64_t v8 = [v7 windowScene];
  double v9 = [v8 _FBSScene];
  int v10 = [v9 settings];
  uint64_t v11 = [v10 displayConfiguration];
  double v12 = [v11 identity];
  if ([v12 isContinuityDisplay]) {
    int v13 = 1;
  }
  else {
    int v13 = [MEMORY[0x263F828A0] isInHardwareKeyboardMode];
  }

  double v14 = [MEMORY[0x263F82438] sharedApplication];
  BOOL v15 = [v14 userInterfaceLayoutDirection] != 0;

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __58__SPUITextField_updateTextAlignmentShouldCenter_animated___block_invoke;
  v17[3] = &unk_264E90638;
  if (!v5 | v13) {
    uint64_t v16 = 2 * v15;
  }
  else {
    uint64_t v16 = 1;
  }
  v17[4] = self;
  v17[5] = v16;
  [MEMORY[0x263F67C78] performAnimatableChanges:v17 animated:v4];
}

uint64_t __58__SPUITextField_updateTextAlignmentShouldCenter_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTextAlignment:*(void *)(a1 + 40)];
}

- (void)textFieldWasTapped
{
  if (([MEMORY[0x263F79140] bottomSearchFieldEnabled] & 1) == 0)
  {
    BOOL v3 = [(SPUITextField *)self delegate];
    char v4 = [v3 currentlyPresentingWebEntity];

    BOOL v5 = [(SPUITextField *)self searchEntity];

    if (v5 || (v4 & 1) == 0)
    {
      [(SPUITextField *)self removeCompletionsOrEntitiesAndGoToSuggestions:1];
    }
    else
    {
      uint64_t v6 = MEMORY[0x263F79148];
      double v7 = *(NSObject **)(MEMORY[0x263F79148] + 8);
      if (!v7)
      {
        SPUIInitLogging();
        double v7 = *(NSObject **)(v6 + 8);
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)double v9 = 0;
        _os_log_impl(&dword_23D2E6000, v7, OS_LOG_TYPE_DEFAULT, "Search field was tapped while showing web entity results, switching to suggestions.", v9, 2u);
      }
      uint64_t v8 = [(SPUITextField *)self delegate];
      [v8 switchToSuggestions];
    }
  }
  [(SPUITextField *)self detokenizeIfNeededAndSearch:1];
}

uint64_t __45__SPUITextField_detokenizeIfNeededAndSearch___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) selectAll:0];
}

- (void)removeCompletionsOrEntitiesAndGoToSuggestions:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = objc_opt_class();
  uint64_t v6 = [(SPUITextField *)self searchEntity];
  double v7 = [v5 webEntityStringForEntity:v6];

  if ([v7 length])
  {
    [(SPUITextField *)self clearAllTokens];
    [(UISearchTextField *)self setText:v7];
    uint64_t v8 = [(SPUITextField *)self delegate];
    [v8 textFieldDidReplaceTokensWithStringEquivalent:self];

    if (v3)
    {
      uint64_t v9 = MEMORY[0x263F79148];
      int v10 = *(NSObject **)(MEMORY[0x263F79148] + 8);
      if (!v10)
      {
        SPUIInitLogging();
        int v10 = *(NSObject **)(v9 + 8);
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)double v12 = 0;
        _os_log_impl(&dword_23D2E6000, v10, OS_LOG_TYPE_DEFAULT, "Search field was tapped while showing web entity results, switching to suggestions.", v12, 2u);
      }
      uint64_t v11 = [(SPUITextField *)self delegate];
      [v11 switchToSuggestions];
    }
    else
    {
      [(SPUITextField *)self setNeedsLayout];
    }
  }
  else
  {
    [(SPUITextField *)self removeCompletionAndHighlight];
  }
}

- (id)focusGroupIdentifier
{
  return (id)[MEMORY[0x263F67C78] focusGroupIdentifier];
}

+ (id)webEntityStringForEntity:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    BOOL v5 = [v4 command];
    int v6 = [v5 entityType];

    if (v6 == 3)
    {
      double v7 = [v4 command];
      uint64_t v8 = [v7 tokenString];
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (BOOL)optOutOfGoButton
{
  if ([(SPUITextField *)self lastUpdateWasDeletion]
    && [(SPUITextField *)self hasContent])
  {
    return 1;
  }
  id v4 = [(SPUITextField *)self restorationStringOnKBMovement];
  BOOL v3 = v4 != 0;

  return v3;
}

- (void)setSearchFieldModel:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SPUITextField *)self hintingView];
  [v5 setSearchFieldModel:v4];

  [(SPUITextField *)self updateCaretVisibility];
}

- (id)currentQueryContext
{
  int v2 = [(SPUITextField *)self hintingView];
  BOOL v3 = [v2 searchFieldModel];

  return v3;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v5 = a3;
  id v6 = [(SPUITextField *)self completionTapGestureRecognizer];

  if (v6 == v5)
  {
    uint64_t v9 = [(SPUITextField *)self delegate];
    int v10 = [v9 currentlyPresentingWebEntity];

    if ([MEMORY[0x263F79140] bottomSearchFieldEnabled])
    {
      if (v10) {
        return [(SPUITextField *)self isFirstResponder] ^ 1;
      }
    }
    else if (v10 && [(SPUITextField *)self isEditing])
    {
      uint64_t v11 = [(SPUITextField *)self selectedTextRange];
      int v7 = [v11 isEmpty] ^ 1;

      return v7;
    }
  }
  LOBYTE(v7) = 1;
  return v7;
}

- (void)beginFloatingCursorAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(SPUITextField *)self removeCompletionAndHighlight];
  v6.receiver = self;
  v6.super_class = (Class)SPUITextField;
  -[SPUITextField beginFloatingCursorAtPoint:](&v6, sel_beginFloatingCursorAtPoint_, x, y);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = [(SPUITextField *)self completionTapGestureRecognizer];

  if (v5 == v4)
  {
    int v7 = [(SPUITextField *)self firstResponder];
    BOOL v6 = v7 == 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SPUITextField;
    if ([(UISearchTextField *)&v9 gestureRecognizerShouldBegin:v4])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(SPUITextField *)self removeCompletionAndHighlight];
      }
      BOOL v6 = 1;
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SPUITextField *)self responderForKeyboardInput];
  if (v8
    && (objc_super v9 = (void *)v8, v10 = [MEMORY[0x263F828A0] isInHardwareKeyboardMode], v9, v10))
  {
    uint64_t v11 = [(SPUITextField *)self responderForKeyboardInput];
    [v11 pressesEnded:v6 withEvent:v7];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SPUITextField;
    [(SPUITextField *)&v12 pressesEnded:v6 withEvent:v7];
  }
}

- (BOOL)keyboardInputShouldDelete:(id)a3
{
  id v4 = a3;
  id v5 = [(SPUITextField *)self hintingView];
  int v6 = [v5 hasContent];

  v10.receiver = self;
  v10.super_class = (Class)SPUITextField;
  LODWORD(v5) = [(SPUITextField *)&v10 keyboardInputShouldDelete:v4];

  if (!v5) {
    return 0;
  }
  if ((![(SPUITextField *)self lastUpdateWasDeletion] | v6) != 1) {
    return 1;
  }
  [(SPUITextField *)self setLastUpdateWasDeletion:1];
  id v7 = [(SPUITextField *)self hintingView];
  [v7 updateWithResult:0 cardSection:0 focusIsOnFirstResult:1];

  if ([(SPUITextField *)self returnKeyType] != 6)
  {
    [(SPUITextField *)self setReturnKeyType:6];
    [(id)objc_opt_class() updateBlueButton];
  }
  [(SPUITextField *)self updateCaretVisibility:1];
  uint64_t v8 = [(SPUITextField *)self delegate];
  [v8 removeCompletionAndHighlightAsTyped:1];

  return v6 ^ 1;
}

- (BOOL)keyboardInput:(id)a3 shouldInsertText:(id)a4 isMarkedText:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  [(SPUITextField *)self resetDeletion];
  v11.receiver = self;
  v11.super_class = (Class)SPUITextField;
  LOBYTE(v5) = [(SPUITextField *)&v11 keyboardInput:v9 shouldInsertText:v8 isMarkedText:v5];

  return v5;
}

- (void)insertText:(id)a3
{
  id v4 = a3;
  [(SPUITextField *)self resetDeletion];
  v5.receiver = self;
  v5.super_class = (Class)SPUITextField;
  [(UISearchTextField *)&v5 insertText:v4];
}

- (_NSRange)insertFilteredText:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SPUITextField;
  id v4 = [(UISearchTextField *)&v9 insertFilteredText:a3];
  NSUInteger v6 = v5;
  [(SPUITextField *)self resetDeletion];
  NSUInteger v7 = (NSUInteger)v4;
  NSUInteger v8 = v6;
  result.length = v8;
  result.id location = v7;
  return result;
}

- (void)resetDeletion
{
  [(SPUITextField *)self setLastUpdateWasDeletion:0];
  [(SPUITextField *)self setRestorationStringOnKBMovement:0];
}

- (BOOL)resignFirstResponder
{
  [(SPUITextField *)self removeCompletionAndHighlight];
  uint64_t v3 = MEMORY[0x263F79148];
  id v4 = *(NSObject **)(MEMORY[0x263F79148] + 16);
  if (!v4)
  {
    SPUIInitLogging();
    id v4 = *(NSObject **)(v3 + 16);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23D2E6000, v4, OS_LOG_TYPE_DEFAULT, "resignFirstResponder", buf, 2u);
  }
  v6.receiver = self;
  v6.super_class = (Class)SPUITextField;
  return [(UISearchTextField *)&v6 resignFirstResponder];
}

- (void)selectAll:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SPUITextField;
  [(SPUITextField *)&v4 selectAll:a3];
  [(SPUITextField *)self removeCompletionsOrEntitiesAndGoToSuggestions:0];
  [(SPUITextField *)self removeCaretAssertion];
}

- (BOOL)shouldPromoteCompletion
{
  if ([(SPUITextField *)self hasMarkedText]) {
    return 0;
  }
  objc_super v4 = [(SPUITextField *)self hintingView];
  NSUInteger v5 = [v4 completionText];
  BOOL v3 = v5 != 0;

  return v3;
}

- (void)buildMenuWithBuilder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SPUITextField;
  id v3 = a3;
  [(SPUITextField *)&v4 buildMenuWithBuilder:v3];
  objc_msgSend(v3, "removeMenuForIdentifier:", @"com.apple.menu.insert-from-external-sources", v4.receiver, v4.super_class);
}

- (id)preferredFocusEnvironments
{
  v11[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(SPUITextField *)self responderForKeyboardInput];
  if (!v3) {
    goto LABEL_4;
  }
  objc_super v4 = (void *)v3;
  NSUInteger v5 = [(SPUITextField *)self hintingView];
  objc_super v6 = [v5 result];

  if (v6)
  {
    NSUInteger v7 = [(SPUITextField *)self responderForKeyboardInput];
    v11[0] = v7;
    v11[1] = self;
    NSUInteger v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];
  }
  else
  {
LABEL_4:
    v10.receiver = self;
    v10.super_class = (Class)SPUITextField;
    NSUInteger v8 = [(SPUITextField *)&v10 preferredFocusEnvironments];
  }
  return v8;
}

- (BOOL)_shouldSendContentChangedNotificationsIfOnlyMarkedTextChanged
{
  return 1;
}

- (BOOL)needsLandscapeHeight
{
  if ((unint64_t)([(SPUITextField *)self activeInterfaceOrientation] - 3) > 1) {
    return 0;
  }
  else {
    return [MEMORY[0x263F67C78] isIpad] ^ 1;
  }
}

- (NSString)textIncludingTokens
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  objc_super v4 = [(UISearchTextField *)self tokens];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_super v9 = [*(id *)(*((void *)&v14 + 1) + 8 * i) representedObject];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_super v10 = [v9 tokenText];
          [v3 appendString:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  objc_super v11 = [(UISearchTextField *)self text];
  [v3 appendString:v11];

  objc_super v12 = [(id)objc_opt_class() removeDictationCharacterInString:v3];

  return (NSString *)v12;
}

+ (id)removeDictationCharacterInString:(id)a3
{
  return (id)[a3 stringByReplacingOccurrencesOfString:@"\uFFFC" withString:&stru_26F104E28];
}

- (void)clearAllTokens
{
  for (uint64_t i = self; ; self = i)
  {
    uint64_t v3 = [(UISearchTextField *)self tokens];
    uint64_t v4 = [v3 count];

    if (!v4) {
      break;
    }
    [(UISearchTextField *)i removeTokenAtIndex:0];
  }
}

- (void)updateToken:(id)a3
{
  id v4 = a3;
  [(SPUITextField *)self setIgnoreTokensUpdate:1];
  [(SPUITextField *)self clearAllTokens];
  if (v4) {
    [(UISearchTextField *)self insertToken:v4 atIndex:0];
  }
  [(SPUITextField *)self setIgnoreTokensUpdate:0];
  [(SPUITextField *)self updateRightView];
}

- (void)updateTextRange:(id)a3
{
  uint64_t v5 = &stru_26F104E28;
  if (a3) {
    uint64_t v5 = (__CFString *)a3;
  }
  uint64_t v6 = v5;
  id v8 = a3;
  [(SPUITextField *)self setIgnoreTokensUpdate:1];
  uint64_t v7 = [(UISearchTextField *)self textualRange];
  [(UISearchTextField *)self replaceRange:v7 withText:v6];

  [(SPUITextField *)self setIgnoreTokensUpdate:0];
  [(SPUITextField *)self updateRightView];
}

- (void)updateLeftViewWithSymbolName:(id)a3
{
  id v4 = a3;
  id v7 = [(SPUITextField *)self leftView];
  uint64_t v5 = [v7 configuration];
  uint64_t v6 = [(SPUITextField *)self accessoryIconWithSymbolName:v4];

  [v5 setImage:v6];
  [v7 setConfiguration:v5];
}

- (SPSearchEntity)searchEntity
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int v2 = [(UISearchTextField *)self tokens];
  uint64_t v3 = (void *)[v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        id v7 = [v6 representedObject];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          uint64_t v3 = [v6 representedObject];
          goto LABEL_11;
        }
      }
      uint64_t v3 = (void *)[v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (SPSearchEntity *)v3;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if (NSSelectorFromString(&cfstr_Define.isa) == a3
    || NSSelectorFromString(&cfstr_Lookup.isa) == a3
    || NSSelectorFromString(&cfstr_Share.isa) == a3
    || NSSelectorFromString(&cfstr_Translate.isa) == a3)
  {
    LOBYTE(v8) = 0;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)SPUITextField;
    unsigned __int8 v7 = [(UISearchTextField *)&v14 canPerformAction:a3 withSender:v6];
    if (sel_enterKeyPressed == a3)
    {
      int v8 = [(SPUITextField *)self hasMarkedText] ^ 1;
    }
    else if (sel_commitToCommitedSearch == a3 || (LOBYTE(v8) = v7, sel_toggleCommitedSearch == a3))
    {
      if ([(SPUITextField *)self hasMarkedText])
      {
        int v8 = 0;
      }
      else
      {
        long long v10 = [(UISearchTextField *)self text];
        if ([v10 length])
        {
          long long v11 = [(UISearchTextField *)self tokens];
          int v8 = [v11 count] == 0;
        }
        else
        {
          int v8 = 0;
        }
      }
      if (sel_toggleCommitedSearch == a3)
      {
        long long v12 = [(SPUITextField *)self switchBackToSuggestionsTimer];
        if (([v12 isValid] & 1) == 0)
        {
          long long v13 = [(SPUITextField *)self delegate];
          v8 &= [v13 lastQueryKindSupportsOptionKey];
        }
      }
    }
  }

  return v8;
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (int64_t)focusItemDeferralMode
{
  return 2;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SPUITextField;
  id v6 = a3;
  [(SPUITextField *)&v8 didUpdateFocusInContext:v6 withAnimationCoordinator:a4];
  objc_msgSend(v6, "nextFocusedView", v8.receiver, v8.super_class);
  unsigned __int8 v7 = (SPUITextField *)objc_claimAutoreleasedReturnValue();

  if (v7 == self) {
    [(SPUITextField *)self removeCompletionAndHighlight];
  }
}

- (id)keyCommands
{
  v13[4] = *MEMORY[0x263EF8340];
  v12.receiver = self;
  v12.super_class = (Class)SPUITextField;
  int v2 = [(SPUITextField *)&v12 keyCommands];
  if (!keyCommands_spotlightKeyCommands)
  {
    uint64_t v3 = [MEMORY[0x263F82890] keyCommandWithInput:*MEMORY[0x263F83758] modifierFlags:0 action:sel_escapeKeyCommand];
    uint64_t v4 = [MEMORY[0x263F82890] keyCommandWithInput:@"\r" modifierFlags:0 action:sel_enterKeyPressed];
    uint64_t v5 = [MEMORY[0x263F82890] keyCommandWithInput:&stru_26F104E28 modifierFlags:0x80000 action:sel_toggleCommitedSearch];
    id v6 = [MEMORY[0x263F82890] keyCommandWithInput:@"\r" modifierFlags:0x80000 action:sel_commitToCommitedSearch];
    v13[0] = v3;
    v13[1] = v4;
    v13[2] = v5;
    v13[3] = v6;
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:4];
    objc_super v8 = (void *)keyCommands_spotlightKeyCommands;
    keyCommands_spotlightKeyCommands = v7;
  }
  if (v2)
  {
    id v9 = [v2 arrayByAddingObjectsFromArray:keyCommands_spotlightKeyCommands];
  }
  else
  {
    id v9 = (id)keyCommands_spotlightKeyCommands;
  }
  long long v10 = v9;

  return v10;
}

- (UIView)canvasView
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int v2 = [(SPUITextField *)self subviews];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_super v8 = (objc_class *)objc_opt_class();
        id v9 = NSStringFromClass(v8);
        char v10 = [v9 isEqualToString:@"_UITextLayoutCanvasView"];

        if (v10)
        {
          id v11 = v7;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_11:

  return (UIView *)v11;
}

- (void)toggleCommitedSearch
{
  uint64_t v3 = [(SPUITextField *)self switchBackToSuggestionsTimer];
  char v4 = [v3 isValid];

  if ((v4 & 1) == 0)
  {
    uint64_t v5 = [(SPUITextField *)self delegate];
    [v5 commitSearch];
  }
  id v6 = [(SPUITextField *)self switchBackToSuggestionsTimer];
  [v6 invalidate];

  id v7 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel_toggleBackToCommittedSearch selector:0 userInfo:0 repeats:0.25];
  [(SPUITextField *)self setSwitchBackToSuggestionsTimer:v7];
}

- (void)commitToCommitedSearch
{
  uint64_t v3 = [(SPUITextField *)self switchBackToSuggestionsTimer];
  [v3 invalidate];

  [(SPUITextField *)self setSwitchBackToSuggestionsTimer:0];
}

- (void)toggleBackToCommittedSearch
{
  id v2 = [(SPUITextField *)self delegate];
  [v2 switchToSuggestions];
}

- (void)enterKeyPressed
{
  uint64_t v3 = [(SPUITextField *)self delegate];
  [v3 returnKeyPressed];

  [(SPUITextField *)self setLastUpdateWasDeletion:0];
}

- (void)escapeKeyCommand
{
  if ([(SPUITextField *)self hasMarkedText]) {
    return;
  }
  uint64_t v3 = [(UISearchTextField *)self text];
  if ([v3 length])
  {
  }
  else
  {
    char v4 = [(UISearchTextField *)self tokens];
    uint64_t v5 = [v4 count];

    if (!v5)
    {
      id v7 = [(SPUITextField *)self delegate];
      [v7 escapeKeyPressed];
      goto LABEL_6;
    }
  }
  [(UISearchTextField *)self setText:&stru_26F104E28];
  id v6 = objc_opt_new();
  [(UISearchTextField *)self setTokens:v6];

  id v7 = [(UISearchTextField *)self textualRange];
  -[UISearchTextField replaceRange:withText:](self, "replaceRange:withText:");
LABEL_6:
}

- (void)promoteCompletionIfPossibleAndMoveForward:(BOOL)a3
{
  BOOL v3 = a3;
  [(SPUITextField *)self removeCaretAssertion];
  if ([(SPUITextField *)self shouldPromoteCompletion]) {
    [(SPUITextField *)self _promoteCompletionAndMoveForward:v3];
  }
  else {
    [(SPUITextField *)self updateFocusResult:0 cardSection:0 focusIsOnFirstResult:0];
  }
  id v5 = [(SPUITextField *)self delegate];
  [v5 removeCompletionAndHighlightAsTyped:0];
}

- (void)_promoteCompletionAndMoveForward:(BOOL)a3
{
  id v18 = [(UISearchTextField *)self text];
  id v5 = [(UISearchTextField *)self text];
  uint64_t v6 = [v5 length];

  id v7 = [(SPUITextField *)self hintingView];
  objc_super v8 = [v7 completionText];
  [(UISearchTextField *)self setText:v8];

  if (!a3)
  {
    id v9 = [(SPUITextField *)self beginningOfDocument];
    char v10 = [(SPUITextField *)self positionFromPosition:v9 inDirection:2 offset:v6];

    id v11 = [(SPUITextField *)self textRangeFromPosition:v10 toPosition:v10];
    [(SPUITextField *)self setSelectedTextRange:v11];
  }
  objc_super v12 = [SPUICompletionStringModel alloc];
  long long v13 = [(UISearchTextField *)self text];
  long long v14 = [(SPUITextField *)self hintingView];
  long long v15 = [v14 searchFieldModel];
  long long v16 = -[SPUICompletionStringModel initWithTypedString:hasTokens:queryId:hasMarkedText:](v12, "initWithTypedString:hasTokens:queryId:hasMarkedText:", v13, 0, [v15 queryId], 0);
  long long v17 = [(SPUITextField *)self hintingView];
  [v17 setSearchFieldModel:v16];

  [(SPUITextField *)self updateFocusResult:0 cardSection:0 focusIsOnFirstResult:1];
  [(SPUITextField *)self setRestorationStringOnKBMovement:v18];
}

- (void)unmarkText
{
  v4.receiver = self;
  v4.super_class = (Class)SPUITextField;
  [(SPUITextField *)&v4 unmarkText];
  [(SPUITextField *)self setLastUpdateWasDeletion:0];
  BOOL v3 = [(SPUITextField *)self delegate];
  [v3 highlightResultAfterUnmarkingText];
}

- (void)scribbleInteractionWillBeginWriting:(id)a3
{
}

- (BOOL)completionResultIsPotentiallyPunchout
{
  id v2 = [(SPUITextField *)self hintingView];
  char v3 = [v2 completionResultIsPotentiallyPunchout];

  return v3;
}

+ (void)updateBlueButton
{
  if (([MEMORY[0x263F828A0] isInHardwareKeyboardMode] & 1) == 0)
  {
    id v2 = [MEMORY[0x263F828A0] activeKeyboard];
    [v2 textInputTraitsDidChange];

    id v3 = [MEMORY[0x263F828B0] activeInstance];
    [v3 updateReturnKey:1];
  }
}

- (void)cut:(id)a3
{
  id v4 = a3;
  id v5 = [(SPUITextField *)self delegate];
  [v5 textWasCutFromTextField:self];

  v6.receiver = self;
  v6.super_class = (Class)SPUITextField;
  [(UISearchTextField *)&v6 cut:v4];
}

- (BOOL)supportsEmojiImageTextAttachments
{
  return 0;
}

- (BOOL)supportsAdaptiveImageGlyph
{
  return 0;
}

- (SPUICompletionStringModel)searchFieldModel
{
  return self->_searchFieldModel;
}

- (int64_t)activeInterfaceOrientation
{
  return self->_activeInterfaceOrientation;
}

- (void)setActiveInterfaceOrientation:(int64_t)a3
{
  self->_activeInterfaceOrientation = a3;
}

- (UIColor)primaryColor
{
  return (UIColor *)objc_getProperty(self, a2, 1240, 1);
}

- (UIColor)secondaryColor
{
  return (UIColor *)objc_getProperty(self, a2, 1248, 1);
}

- (BOOL)isOnDarkBackground
{
  return self->_isOnDarkBackground;
}

- (BOOL)canAcquireFieldEditor
{
  return self->_canAcquireFieldEditor;
}

- (void)setBlurView:(id)a3
{
}

- (BOOL)ignoreTokensUpdate
{
  return self->_ignoreTokensUpdate;
}

- (void)setIgnoreTokensUpdate:(BOOL)a3
{
  self->_ignoreTokensUpdate = a3;
}

- (UIGestureRecognizer)completionTapGestureRecognizer
{
  return (UIGestureRecognizer *)objc_getProperty(self, a2, 1280, 1);
}

- (BOOL)lastUpdateWasDeletion
{
  return self->_lastUpdateWasDeletion;
}

- (void)setLastUpdateWasDeletion:(BOOL)a3
{
  self->_lastUpdateWasDeletion = a3;
}

- (UIScribbleInteraction)scribbleInteraction
{
  return (UIScribbleInteraction *)objc_getProperty(self, a2, 1296, 1);
}

- (void)setScribbleInteraction:(id)a3
{
}

- (NSTimer)switchBackToSuggestionsTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 1312, 1);
}

- (void)setSwitchBackToSuggestionsTimer:(id)a3
{
}

- (UIFont)accessoryIconFont
{
  return (UIFont *)objc_getProperty(self, a2, 1336, 1);
}

- (int64_t)accessorySymbolWeight
{
  return self->_accessorySymbolWeight;
}

- (void)setAccessorySymbolWeight:(int64_t)a3
{
  self->_accessorySymbolWeight = a3;
}

- (id)assertionForGrabbers
{
  return objc_getProperty(self, a2, 1352, 1);
}

- (void)setAssertionForGrabbers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_assertionForGrabbers, 0);
  objc_storeStrong((id *)&self->_accessoryIconFont, 0);
  objc_storeStrong(&self->_animateAssertion, 0);
  objc_storeStrong((id *)&self->_microphoneImage, 0);
  objc_storeStrong((id *)&self->_switchBackToSuggestionsTimer, 0);
  objc_storeStrong((id *)&self->_restorationStringOnKBMovement, 0);
  objc_storeStrong((id *)&self->_scribbleInteraction, 0);
  objc_storeStrong((id *)&self->_caretAssertion, 0);
  objc_storeStrong((id *)&self->_completionTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_hintingView, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_tintView, 0);
  objc_storeStrong((id *)&self->_secondaryColor, 0);
  objc_storeStrong((id *)&self->_primaryColor, 0);
  objc_storeStrong((id *)&self->_searchFieldModel, 0);
  objc_destroyWeak((id *)&self->_responderForKeyboardInput);
}

@end