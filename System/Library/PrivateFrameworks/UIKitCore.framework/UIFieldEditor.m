@interface UIFieldEditor
+ (id)activeFieldEditor;
+ (id)excludedElementsForHTML;
+ (id)sharedFieldEditor;
- (BOOL)_clearOnEditIfNeeded;
- (BOOL)_hasDictationPlaceholder;
- (BOOL)_mightHaveSelection;
- (BOOL)_shouldIgnoreAutofillSave;
- (BOOL)_shouldObscureInput;
- (BOOL)_shouldObscureNextInput;
- (BOOL)allowsAttachments;
- (BOOL)hasMarkedText;
- (BOOL)hasText;
- (BOOL)isEditing;
- (BOOL)isFirstResponder;
- (BOOL)isHorizontallyResizable;
- (BOOL)keyboardInput:(id)a3 shouldInsertText:(id)a4 isMarkedText:(BOOL)a5;
- (BOOL)keyboardInput:(id)a3 shouldReplaceTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (BOOL)keyboardInputChanged:(id)a3;
- (BOOL)keyboardInputShouldDelete:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)setUpClippingWithMaskForBounds:(CGRect)a3 contentFrame:(CGRect)a4;
- (BOOL)textInput:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementText:(id)a5;
- (BOOL)textInputShouldExtendCaretHeight:(id)a3;
- (CGPoint)autoscrollContentOffset;
- (CGPoint)textContainerOrigin;
- (CGPoint)textContainerOriginForTextAlignment:(int64_t)a3;
- (CGRect)_responderExternalTouchRectForWindow:(id)a3;
- (CGRect)caretRectForPosition:(id)a3;
- (CGRect)contentFrameForView:(id)a3;
- (CGRect)firstRectForRange:(id)a3;
- (CGRect)frameForDictationResultPlaceholder:(id)a3;
- (CGRect)layoutManager:(id)a3 boundingBoxForControlGlyphAtIndex:(unint64_t)a4 forTextContainer:(id)a5 proposedLineFragment:(CGRect)a6 glyphPosition:(CGPoint)a7 characterIndex:(unint64_t)a8;
- (CGRect)visibleRect;
- (CGSize)minSize;
- (NSDictionary)markedTextStyle;
- (NSDictionary)typingAttributes;
- (NSLayoutManager)layoutManager;
- (UIEdgeInsets)_contentInsetsFromFonts;
- (UIEdgeInsets)_fullContentInsetsFromFonts;
- (UIEdgeInsets)padding;
- (UIEdgeInsets)textContainerInset;
- (UIFieldEditor)initWithFrame:(CGRect)a3;
- (UIFieldEditor)initWithTextField:(id)a3;
- (UITextInputDelegate)inputDelegate;
- (UITextInputTokenizer)tokenizer;
- (UITextInteractionAssistant)interactionAssistant;
- (UITextPosition)beginningOfDocument;
- (UITextPosition)endOfDocument;
- (UITextRange)markedTextRange;
- (UITextRange)selectedTextRange;
- (UIView)textInputView;
- (_NSRange)_unobscuredSecureRange;
- (_NSRange)insertFilteredText:(id)a3;
- (_NSRange)markedRange;
- (_NSRange)selectionRange;
- (_NSRange)textInput:(id)a3 willChangeSelectionFromCharacterRange:(_NSRange)a4 toCharacterRange:(_NSRange)a5;
- (double)_passcodeStyleAlpha;
- (id)_responderForBecomeFirstResponder;
- (id)_scrollAnimationEndedAction;
- (id)_textCanvasView;
- (id)_textContainer;
- (id)_textInputController;
- (id)_textInputTraits;
- (id)_textLayoutController;
- (id)_textSelectingContainer;
- (id)_textStorage;
- (id)_visualSelectionRangeForExtent:(id)a3 forPoint:(CGPoint)a4 fromPosition:(id)a5 inDirection:(int64_t)a6;
- (id)attributedSubstringForMarkedRange;
- (id)attributedText;
- (id)attributedTextInRange:(id)a3;
- (id)characterRangeAtPoint:(CGPoint)a3;
- (id)characterRangeByExtendingPosition:(id)a3 inDirection:(int64_t)a4;
- (id)closestPositionToPoint:(CGPoint)a3;
- (id)closestPositionToPoint:(CGPoint)a3 withinRange:(id)a4;
- (id)font;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)insertDictationResultPlaceholder;
- (id)insertTextPlaceholderWithSize:(CGSize)a3;
- (id)layoutManager:(id)a3 effectiveCUICatalogForTextEffect:(id)a4;
- (id)linkTextAttributes;
- (id)metadataDictionariesForDictationResults;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5;
- (id)positionFromPosition:(id)a3 offset:(int64_t)a4;
- (id)positionWithinRange:(id)a3 farthestInDirection:(int64_t)a4;
- (id)rangeWithTextAlternatives:(id *)a3 atPosition:(id)a4;
- (id)selectionRectsForRange:(id)a3;
- (id)text;
- (id)textColor;
- (id)textColorForCaretSelection;
- (id)textField;
- (id)textInRange:(id)a3;
- (id)textInputTraits;
- (id)textRangeFromPosition:(id)a3 toPosition:(id)a4;
- (id)undoManager;
- (int)scrollXOffset;
- (int)scrollYOffset;
- (int64_t)baseWritingDirectionForPosition:(id)a3 inDirection:(int64_t)a4;
- (int64_t)comparePosition:(id)a3 toPosition:(id)a4;
- (int64_t)layoutManager:(id)a3 shouldUseAction:(int64_t)a4 forControlCharacterAtIndex:(unint64_t)a5;
- (int64_t)layoutOrientation;
- (int64_t)nonEditingLinebreakMode;
- (int64_t)offsetFromPosition:(id)a3 toPosition:(id)a4;
- (unint64_t)layoutManager:(id)a3 shouldGenerateGlyphs:(const unsigned __int16 *)a4 properties:(const int64_t *)a5 characterIndexes:(const unint64_t *)a6 font:(id)a7 forGlyphRange:(_NSRange)a8;
- (void)_applyCorrectTextContainerSize;
- (void)_applyCorrectTextContainerSize:(id)a3;
- (void)_cancelObscureAllTextTimer;
- (void)_deactivateSelectionView;
- (void)_deleteBackwardAndNotify:(BOOL)a3;
- (void)_ephemerallyUnobscureCharacterAtIndex:(unint64_t)a3;
- (void)_ephemerallyUnobscureTextInRange:(_NSRange)a3;
- (void)_handleObscuredTextAfterActivationChange;
- (void)_handleObscuredTextInputIfNecessaryWithEditingBlock:(id)a3;
- (void)_invalidateAfterObscuredRangeChangeIfNeeded;
- (void)_obscureAllText;
- (void)_performWhileSuppressingDelegateNotifications:(id)a3;
- (void)_resetTypingAttributes;
- (void)_scrollRangeToVisible:(_NSRange)a3 animated:(BOOL)a4;
- (void)_scrollViewAnimationEnded:(id)a3 finished:(BOOL)a4;
- (void)_setAttributedTextInRange:(_NSRange)a3 replacementText:(id)a4 andSetCaretSelectionAfterText:(BOOL)a5;
- (void)_setNeedsInvalidateAfterObscuredRangeChange;
- (void)_setScrollAnimationEndedAction:(id)a3;
- (void)_setTextInRange:(_NSRange)a3 replacementText:(id)a4 andSetCaretSelectionAfterText:(BOOL)a5;
- (void)_setValue:(id)a3 forTextAttribute:(id)a4;
- (void)_textStorageDidProcessEditing:(id)a3;
- (void)_tvUpdateTextColor;
- (void)_unobscureAllText;
- (void)_unobscureTextInRange:(_NSRange)a3 settingTimerToReobscure:(BOOL)a4;
- (void)_updateLayoutManagerStyleEffectConfiguration;
- (void)_updateTextSelectionFromBehavior;
- (void)activateEditor;
- (void)addTextAlternativesDisplayStyle:(int64_t)a3 toRange:(_NSRange)a4;
- (void)beginSelectionChange;
- (void)cancelAutoscroll;
- (void)clearText;
- (void)deactivateEditorDiscardingEdits:(BOOL)a3;
- (void)dealloc;
- (void)deleteBackward;
- (void)endSelectionChange;
- (void)insertAttributedText:(id)a3;
- (void)insertDictationResult:(id)a3 withCorrectionIdentifier:(id)a4;
- (void)keyboardInputChangedSelection:(id)a3;
- (void)layoutManager:(id)a3 didCompleteLayoutForTextContainer:(id)a4 atEnd:(BOOL)a5;
- (void)layoutSubviews;
- (void)removeDictationResultPlaceholder:(id)a3 willInsertResult:(BOOL)a4;
- (void)removeTextPlaceholder:(id)a3;
- (void)replaceRange:(id)a3 withAttributedText:(id)a4;
- (void)replaceRange:(id)a3 withText:(id)a4;
- (void)replaceRangeWithTextWithoutClosingTyping:(id)a3 replacementText:(id)a4;
- (void)scrollSelectionToVisible:(BOOL)a3;
- (void)selectAll;
- (void)setAllowsAttachments:(BOOL)a3;
- (void)setAttributedMarkedText:(id)a3 selectedRange:(_NSRange)a4;
- (void)setAttributedText:(id)a3;
- (void)setAttributedText:(id)a3 andSetCaretSelectionAfterText:(BOOL)a4;
- (void)setAttributedTextInRange:(_NSRange)a3 replacementText:(id)a4;
- (void)setAutoscrollContentOffset:(CGPoint)a3;
- (void)setBaseWritingDirection:(int64_t)a3 forRange:(id)a4;
- (void)setConstrainedFrameSize:(CGSize)a3;
- (void)setContentOffset:(CGPoint)a3;
- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4;
- (void)setDisplaySecureEditsUsingPlainText:(BOOL)a3;
- (void)setFont:(id)a3;
- (void)setInputDelegate:(id)a3;
- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4;
- (void)setMarkedTextStyle:(id)a3;
- (void)setNeedsDisplayInRect:(CGRect)a3 avoidAdditionalLayout:(BOOL)a4;
- (void)setNonEditingLinebreakMode:(int64_t)a3;
- (void)setPadding:(UIEdgeInsets)a3;
- (void)setScrollXOffset:(int)a3 scrollYOffset:(int)a4;
- (void)setScrollXOffset:(int)a3 scrollYOffset:(int)a4 adjustForPurpleCaret:(BOOL)a5;
- (void)setSecureTextEntry:(BOOL)a3;
- (void)setSelectedTextRange:(id)a3;
- (void)setSelection:(_NSRange)a3;
- (void)setText:(id)a3;
- (void)setText:(id)a3 andSetCaretSelectionAfterText:(BOOL)a4;
- (void)setTextColor:(id)a3;
- (void)setTextContainer:(id)a3;
- (void)setTextInRange:(_NSRange)a3 replacementText:(id)a4;
- (void)setTypingAttributes:(id)a3;
- (void)set_shouldObscureNextInput:(BOOL)a3;
- (void)startAutoscroll:(CGPoint)a3;
- (void)textContainerUsageDidChangeToSize:(CGSize)a3;
- (void)textInput:(id)a3 prepareAttributedTextForInsertion:(id)a4;
- (void)textInputDidAnimatePaste:(id)a3;
- (void)textInputDidChange:(id)a3;
- (void)textInputDidChangeSelection:(id)a3;
- (void)textInputWillAnimatePaste:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)unmarkText;
- (void)updateAutoscroll:(id)a3;
@end

@implementation UIFieldEditor

- (id)textField
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
  return WeakRetained;
}

- (int64_t)comparePosition:(id)a3 toPosition:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(UIFieldEditor *)self _textInputController];
  int64_t v9 = [v8 comparePosition:v7 toPosition:v6];

  return v9;
}

- (id)textRangeFromPosition:(id)a3 toPosition:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(UIFieldEditor *)self _textInputController];
  int64_t v9 = [v8 textRangeFromPosition:v7 toPosition:v6];

  return v9;
}

- (id)positionFromPosition:(id)a3 offset:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(UIFieldEditor *)self _textInputController];
  v8 = [v7 positionFromPosition:v6 offset:a4];

  return v8;
}

- (id)_textInputController
{
  textInputController = self->__textInputController;
  if (!textInputController)
  {
    v4 = [(UIFieldEditor *)self _textLayoutController];
    -[_UITextLayoutControllerBase textInputController](v4);
    v5 = (UITextInputController *)objc_claimAutoreleasedReturnValue();
    id v6 = self->__textInputController;
    self->__textInputController = v5;

    [(UITextInputController *)self->__textInputController setDelegate:self];
    textInputController = self->__textInputController;
  }
  return textInputController;
}

- (UITextPosition)beginningOfDocument
{
  v2 = [(UIFieldEditor *)self _textInputController];
  v3 = [v2 beginningOfDocument];

  return (UITextPosition *)v3;
}

- (id)textInRange:(id)a3
{
  id v4 = a3;
  v5 = [(UIFieldEditor *)self _textInputController];
  id v6 = [v5 textInRange:v4];

  return v6;
}

- (UITextRange)markedTextRange
{
  v2 = [(UIFieldEditor *)self _textInputController];
  v3 = [v2 markedTextRange];

  return (UITextRange *)v3;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIFieldEditor;
  if (-[UIFieldEditor respondsToSelector:](&v5, sel_respondsToSelector_)) {
    return 1;
  }
  else {
    return [(id)objc_opt_class() instancesRespondToSelector:a3];
  }
}

- (void)setContentOffset:(CGPoint)a3
{
  if ((*(_WORD *)&self->_feFlags & 0x80) == 0)
  {
    double y = a3.y;
    double x = a3.x;
    [(UIScrollView *)self contentOffset];
    if (x != v7 || y != v6)
    {
      v9.receiver = self;
      v9.super_class = (Class)UIFieldEditor;
      -[UIScrollView setContentOffset:](&v9, sel_setContentOffset_, x, y);
    }
  }
}

- (CGPoint)textContainerOrigin
{
  v3 = [(UIFieldEditor *)self _textStorage];
  if ([v3 length])
  {
    uint64_t v4 = objc_msgSend(v3, "_ui_resolvedTextAlignment");
  }
  else
  {
    objc_super v5 = [(UIFieldEditor *)self typingAttributes];
    double v6 = [v5 objectForKeyedSubscript:*(void *)off_1E52D21B8];
    uint64_t v4 = objc_msgSend(v6, "_ui_resolvedTextAlignment");
  }
  [(UIFieldEditor *)self textContainerOriginForTextAlignment:v4];
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double y = v12;
  result.double x = v11;
  return result;
}

- (CGPoint)textContainerOriginForTextAlignment:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__textLayoutController);

  if (!WeakRetained)
  {
    double v10 = *MEMORY[0x1E4F1DAD8];
    double v11 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    goto LABEL_18;
  }
  double v7 = [(UIView *)self superview];
  if (v7
    && (id v3 = objc_loadWeakRetained((id *)&self->_textField), [v3 _tvHasFloatingFieldEditor]))
  {
    double v9 = *MEMORY[0x1E4F1DAD8];
    double v8 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  else
  {
    id v12 = objc_loadWeakRetained((id *)&self->_textField);
    [v12 _originForTextFieldLabel:0];
    double v9 = v13;
    double v8 = v14;

    if (!v7) {
      goto LABEL_8;
    }
  }

LABEL_8:
  if (a3 == 2)
  {
    v15 = [(UIFieldEditor *)self _textCanvasView];
    [v15 bounds];
    double Width = CGRectGetWidth(v32);
    v17 = [(UIFieldEditor *)self _textContainer];
    [v17 size];
    double v9 = Width - v20;
    goto LABEL_12;
  }
  if (a3 == 1)
  {
    v15 = [(UIFieldEditor *)self _textCanvasView];
    [v15 bounds];
    double v16 = CGRectGetWidth(v31);
    v17 = [(UIFieldEditor *)self _textContainer];
    [v17 size];
    double v9 = (v16 - v18) * 0.5;
LABEL_12:
  }
  v21 = [(UIFieldEditor *)self _textLayoutController];
  [v21 baselineOffsetForFirstGlyph];
  double v23 = v22;

  UIRoundToViewScale(self);
  double v25 = v8 + v24 - v23;
  [(UIFieldEditor *)self _contentInsetsFromFonts];
  double v28 = v27;
  double v10 = v9 - v29;
  if (a3 == 2) {
    double v10 = v9 + v26;
  }
  if (a3 == 1) {
    double v10 = v9;
  }
  double v11 = v25 - v28;
LABEL_18:
  result.double y = v11;
  result.double x = v10;
  return result;
}

- (id)_textLayoutController
{
  p_textLayoutController = &self->__textLayoutController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->__textLayoutController);

  if (!WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_textField);
    double v6 = [v5 textLayoutController];
    objc_storeWeak((id *)p_textLayoutController, v6);

    id v7 = objc_loadWeakRetained((id *)p_textLayoutController);
    LODWORD(v6) = [v7 canAccessLayoutManager];

    if (v6)
    {
      id v8 = objc_loadWeakRetained((id *)p_textLayoutController);
      [v8 setLayoutManagerDelegate:self];
    }
    id v9 = [(UIFieldEditor *)self _textContainer];
  }
  id v10 = objc_loadWeakRetained((id *)p_textLayoutController);
  return v10;
}

- (UIEdgeInsets)_contentInsetsFromFonts
{
  [(UIFieldEditor *)self _fullContentInsetsFromFonts];
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v3;
  result.left = v4;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)_fullContentInsetsFromFonts
{
  if ((*(_WORD *)&self->_feFlags & 0x100) == 0)
  {
    p_contentInsetsFromFonts = &self->_contentInsetsFromFonts;
    *(_OWORD *)&self->_contentInsetsFromFonts.double top = 0u;
    *(_OWORD *)&self->_contentInsetsFromFonts.double bottom = 0u;
    double v4 = +[UILabel _tooBigChars]();
    double v5 = [(UIFieldEditor *)self _textStorage];
    double v6 = [v5 string];
    uint64_t v7 = [v6 rangeOfCharacterFromSet:v4];

    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      id v8 = [v5 font];
      p_contentInsetsFromFonts->double top = +[UILabel _insetsForAttributedString:withDefaultFont:inView:]((uint64_t)UILabel, v5, v8, self);
      p_contentInsetsFromFonts->double left = v9;
      p_contentInsetsFromFonts->double bottom = v10;
      p_contentInsetsFromFonts->double right = v11;

      *(_WORD *)&self->_feFlags |= 0x100u;
    }
  }
  double top = self->_contentInsetsFromFonts.top;
  double left = self->_contentInsetsFromFonts.left;
  double bottom = self->_contentInsetsFromFonts.bottom;
  double right = self->_contentInsetsFromFonts.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (id)_textStorage
{
  p_textStorage = (id *)&self->__textStorage;
  textStorage = self->__textStorage;
  if (!textStorage)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->__textLayoutController);
    double v6 = [WeakRetained textStorage];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v6;
      if (!v7) {
        goto LABEL_7;
      }
    }
    else
    {
      id v8 = objc_loadWeakRetained((id *)&self->_textField);
      id v7 = [v8 _textStorage];

      if (!v7)
      {
LABEL_7:

        textStorage = (_UICascadingTextStorage *)*p_textStorage;
        goto LABEL_8;
      }
    }
    objc_storeStrong(p_textStorage, v7);
    CGFloat v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:self selector:sel__textStorageDidProcessEditing_ name:*(void *)off_1E52D2350 object:v7];

    goto LABEL_7;
  }
LABEL_8:
  return textStorage;
}

- (NSDictionary)typingAttributes
{
  double v3 = [(UIFieldEditor *)self _textInputController];
  double v4 = [v3 typingAttributes];
  double v5 = [(UIFieldEditor *)self _textContainer];
  [v5 setAttributesForExtraLineFragment:v4];

  double v6 = [v3 typingAttributes];

  return (NSDictionary *)v6;
}

- (id)_textContainer
{
  p_textContainer = &self->__textContainer;
  id WeakRetained = objc_loadWeakRetained((id *)&self->__textContainer);

  if (!WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_textField);
    double v6 = [v5 _textContainer];

    objc_storeWeak((id *)p_textContainer, v6);
    [v6 setTextView:self];
    [v6 setLineFragmentPadding:0.0];
    [(UIFieldEditor *)self _applyCorrectTextContainerSize:v6];
  }
  id v7 = objc_loadWeakRetained((id *)p_textContainer);
  return v7;
}

- (void)_applyCorrectTextContainerSize:(id)a3
{
  id v28 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_contentView);
    [v5 bounds];
    double v7 = v6;
    double v8 = 40000.0;
LABEL_5:

    goto LABEL_6;
  }
  CGFloat v9 = [(UIFieldEditor *)self _textCanvasView];

  if (v9)
  {
    id v5 = [(UIFieldEditor *)self _textCanvasView];
    [v5 bounds];
    double v8 = v10;
    double v7 = v11;
    goto LABEL_5;
  }
  double v8 = 40000.0;
  double v7 = 40000.0;
LABEL_6:
  [v28 size];
  double v13 = v28;
  if (v8 != v14 || v7 != v12)
  {
    objc_msgSend(v28, "setSize:", v8, v7);
    id v16 = objc_loadWeakRetained((id *)&self->__textLayoutController);
    if (v16)
    {
      id v17 = objc_loadWeakRetained((id *)&self->__textLayoutController);
      [v17 updateLayoutForSizeChangeOfTextContainer:v28];
      CGFloat v19 = v18;
      CGFloat v21 = v20;
      double v23 = v22;
      double v25 = v24;
    }
    else
    {
      CGFloat v19 = *MEMORY[0x1E4F1DB20];
      CGFloat v21 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
      double v23 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
      double v25 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    }

    v30.origin.double x = v19;
    v30.origin.double y = v21;
    v30.size.width = v23;
    v30.size.height = v25;
    BOOL IsNull = CGRectIsNull(v30);
    double v13 = v28;
    if (!IsNull)
    {
      -[UIFieldEditor textContainerUsageDidChangeToSize:](self, "textContainerUsageDidChangeToSize:", v23, v25);
      id v27 = objc_loadWeakRetained((id *)&self->_contentView);
      [v27 setNeedsDisplay];

      double v13 = v28;
    }
  }
}

- (id)_textCanvasView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
  double v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained;
  }
  else
  {
    id v6 = objc_loadWeakRetained((id *)&self->_textField);
    id v5 = [v6 _textCanvasView];
  }
  return v5;
}

- (void)textContainerUsageDidChangeToSize:(CGSize)a3
{
  self->_desiredContentdouble Width = ceil(a3.width);
  [(UIScrollView *)self setNeedsLayout];
}

- (BOOL)_mightHaveSelection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
  char v3 = [WeakRetained isFirstResponder];

  return v3;
}

- (void)_applyCorrectTextContainerSize
{
  p_textContainer = &self->__textContainer;
  id WeakRetained = objc_loadWeakRetained((id *)&self->__textContainer);

  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)p_textContainer);
    [(UIFieldEditor *)self _applyCorrectTextContainerSize:v6];
  }
  else
  {
    id v5 = [(UIFieldEditor *)self _textContainer];
  }
}

- (BOOL)_hasDictationPlaceholder
{
  double v2 = [(UIFieldEditor *)self _textInputController];
  char v3 = [v2 _hasDictationPlaceholder];

  return v3;
}

- (void)_unobscureAllText
{
  [(UIFieldEditor *)self _cancelObscureAllTextTimer];
  id v4 = [(UIFieldEditor *)self _textLayoutController];
  char v3 = [v4 documentRange];
  [v4 setUnobscuredRange:v3];

  [(UIFieldEditor *)self _setNeedsInvalidateAfterObscuredRangeChange];
}

- (void)_setNeedsInvalidateAfterObscuredRangeChange
{
  __int16 feFlags = (__int16)self->_feFlags;
  if ((feFlags & 0x40) == 0)
  {
    *(_WORD *)&self->___int16 feFlags = feFlags | 0x40;
    [(UIScrollView *)self setNeedsLayout];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
    [WeakRetained setNeedsLayout];
  }
}

- (void)_cancelObscureAllTextTimer
{
  obscureAllTextTimer = self->_obscureAllTextTimer;
  if (obscureAllTextTimer)
  {
    [(NSTimer *)obscureAllTextTimer invalidate];
    id v4 = self->_obscureAllTextTimer;
    self->_obscureAllTextTimer = 0;
  }
}

- (_NSRange)markedRange
{
  double v2 = [(UIFieldEditor *)self _textInputController];
  uint64_t v3 = [v2 markedRange];
  NSUInteger v5 = v4;

  NSUInteger v6 = v3;
  NSUInteger v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (void)_updateLayoutManagerStyleEffectConfiguration
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
  uint64_t v3 = [WeakRetained _cuiStyleEffectConfiguration];
  NSUInteger v4 = [(UIFieldEditor *)self _textLayoutController];
  [v4 setStyleEffectConfiguration:v3];
}

- (void)dealloc
{
  if (self->__textStorage)
  {
    uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:self name:*(void *)off_1E52D2350 object:self->__textStorage];
  }
  [(NSTimer *)self->_obscureAllTextTimer invalidate];
  obscureAllTextTimer = self->_obscureAllTextTimer;
  self->_obscureAllTextTimer = 0;

  v5.receiver = self;
  v5.super_class = (Class)UIFieldEditor;
  [(UIScrollView *)&v5 dealloc];
}

- (UIView)textInputView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
  return (UIView *)WeakRetained;
}

- (UITextRange)selectedTextRange
{
  double v2 = [(UIFieldEditor *)self _textInputController];
  uint64_t v3 = [v2 selectedTextRange];

  return (UITextRange *)v3;
}

- (CGRect)caretRectForPosition:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(UIFieldEditor *)self _textInputController];
  [v5 caretRectForPosition:v4];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  if ([(UIFieldEditor *)self _shouldObscureInput])
  {
    double v14 = [(UIFieldEditor *)self _textLayoutController];
    v15 = [v14 unobscuredRange];
    int v16 = [v15 isEmpty];

    if (v16)
    {
      id v17 = [(UIFieldEditor *)self font];
      [v17 lineHeight];
      double v13 = v18;
    }
  }
  double v19 = v7;
  double v20 = v9;
  double v21 = v11;
  double v22 = v13;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.double y = v20;
  result.origin.double x = v19;
  return result;
}

- (BOOL)_shouldObscureInput
{
  uint64_t v3 = [(UIFieldEditor *)self _textInputTraits];
  if ([v3 isSecureTextEntry]
    && ([v3 displaySecureTextUsingPlainText] & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
    int v4 = [WeakRetained _shouldUnobscureTextWithContentCover] ^ 1;
  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (id)_textInputTraits
{
  uint64_t v3 = self->__textInputController;
  p_textField = &self->_textField;
  id WeakRetained = objc_loadWeakRetained((id *)p_textField);
  [(UITextInputController *)v3 takeTraitsFrom:WeakRetained];

  if (v3)
  {
    double v6 = v3;
  }
  else
  {
    id v7 = objc_loadWeakRetained((id *)p_textField);
    double v6 = [v7 textInputTraits];
  }
  return v6;
}

- (int64_t)layoutOrientation
{
  return 0;
}

- (BOOL)textInputShouldExtendCaretHeight:(id)a3
{
  uint64_t v3 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
  LOBYTE(v3) = [WeakRetained fieldEditorShouldExtendCaretHeight:v3];

  return (char)v3;
}

- (void)layoutSubviews
{
  uint64_t v3 = (double *)MEMORY[0x1E4F1DB28];
  [(UIView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [(UIFieldEditor *)self _invalidateAfterObscuredRangeChangeIfNeeded];
  v48.origin.double x = v5;
  v48.origin.double y = v7;
  v48.size.width = v9;
  v48.size.height = v11;
  if (CGRectIsEmpty(v48))
  {
    double v12 = v3[2];
    double v13 = v3[3];
LABEL_10:
    CGRect v30 = [(UIView *)self layer];
    [v30 setMask:0];

    LOBYTE(v28) = 1;
    [(UIView *)self setClipsToBounds:1];
    goto LABEL_11;
  }
  double v14 = *v3;
  double v15 = v3[1];
  int v16 = [(UIFieldEditor *)self _textLayoutController];
  id v17 = [(UIFieldEditor *)self _textContainer];
  [v16 ensureLayoutForTextContainer:v17];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
  [WeakRetained _padding];
  double v20 = v19 + self->_desiredContentWidth;
  id v21 = objc_loadWeakRetained((id *)&self->_textField);
  [v21 _padding];
  double v23 = v20 + v22;

  double v12 = fmax(v23, v9);
  [(UIFieldEditor *)self _contentInsetsFromFonts];
  if (v25 == 0.0 && v24 == 0.0 && v27 == 0.0 && v26 == 0.0)
  {
    int v28 = 1;
    double v13 = v11;
  }
  else
  {
    double v14 = v14 + v25;
    double v15 = v15 + v24;
    double v12 = v12 - (v25 + v27);
    double v13 = v11 - (v24 + v26);
    int v28 = !-[UIFieldEditor setUpClippingWithMaskForBounds:contentFrame:](self, "setUpClippingWithMaskForBounds:contentFrame:", v5, v7, v9, v11, v14, v15, v12, v13);
  }
  id v29 = objc_loadWeakRetained((id *)&self->_contentView);
  objc_msgSend(v29, "setFrame:", v14, v15, v12, v13);

  if (v28) {
    goto LABEL_10;
  }
LABEL_11:
  double v31 = fmax(v9, v12);
  double v32 = fmax(v11, v13);
  [(UIScrollView *)self contentSize];
  if (v34 != v31 || v33 != v32)
  {
    -[UIScrollView setContentSize:](self, "setContentSize:", v31, v32);
    v36 = [(UIFieldEditor *)self interactionAssistant];
    [v36 setNeedsSelectionDisplayUpdate];
  }
  [(UIScrollView *)self contentOffset];
  double v38 = v37 - (v31 - v9);
  if (v38 > 0.0)
  {
    -[UIFieldEditor setContentOffset:](self, "setContentOffset:");
    if ((v28 & 1) == 0)
    {
      v39 = [(UIView *)self layer];
      v40 = [v39 mask];
      [v40 position];
      double v42 = v41;
      double v44 = v43;

      id v46 = [(UIView *)self layer];
      v45 = [v46 mask];
      objc_msgSend(v45, "setPosition:", v42 - v38, v44);
    }
  }
}

- (void)_invalidateAfterObscuredRangeChangeIfNeeded
{
  __int16 feFlags = (__int16)self->_feFlags;
  if ((feFlags & 0x40) != 0)
  {
    *(_WORD *)&self->___int16 feFlags = feFlags & 0xFFBF;
    id v7 = [(UIFieldEditor *)self _textLayoutController];
    double v4 = [v7 documentRange];
    [v7 invalidateLayoutForRange:v4];
    double v5 = [(UIFieldEditor *)self _textCanvasView];
    [v5 setNeedsDisplay];

    double v6 = [(UIFieldEditor *)self interactionAssistant];
    [v6 updateDisplayedSelection];
  }
}

- (UITextInteractionAssistant)interactionAssistant
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
  uint64_t v3 = [WeakRetained interactionAssistant];

  return (UITextInteractionAssistant *)v3;
}

- (int64_t)offsetFromPosition:(id)a3 toPosition:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(UIFieldEditor *)self _textInputController];
  int64_t v9 = [v8 offsetFromPosition:v7 toPosition:v6];

  return v9;
}

- (UIFieldEditor)initWithTextField:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)UIFieldEditor;
  double v5 = -[UIScrollView initWithFrame:](&v16, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  id v6 = v5;
  if (v5)
  {
    [(UIScrollView *)v5 setScrollEnabled:0];
    [(UIScrollView *)v6 setShowsHorizontalScrollIndicator:0];
    [(UIScrollView *)v6 setShowsVerticalScrollIndicator:0];
    [(UIScrollView *)v6 _setAutomaticContentOffsetAdjustmentEnabled:0];
    v6->_active = 0;
    id v7 = objc_storeWeak((id *)&v6->_textField, v4);
    *(_WORD *)&v6->___int16 feFlags = *(_WORD *)&v6->_feFlags & 0xFFFE | objc_opt_respondsToSelector() & 1;

    id WeakRetained = objc_loadWeakRetained((id *)&v6->_textField);
    if (objc_opt_respondsToSelector()) {
      __int16 v9 = 2;
    }
    else {
      __int16 v9 = 0;
    }
    *(_WORD *)&v6->___int16 feFlags = *(_WORD *)&v6->_feFlags & 0xFFFD | v9;

    id v10 = objc_loadWeakRetained((id *)&v6->_textField);
    if (objc_opt_respondsToSelector()) {
      __int16 v11 = 4;
    }
    else {
      __int16 v11 = 0;
    }
    *(_WORD *)&v6->___int16 feFlags = *(_WORD *)&v6->_feFlags & 0xFFFB | v11;

    id v12 = objc_loadWeakRetained((id *)&v6->_textField);
    if (objc_opt_respondsToSelector()) {
      __int16 v13 = 8;
    }
    else {
      __int16 v13 = 0;
    }
    *(_WORD *)&v6->___int16 feFlags = *(_WORD *)&v6->_feFlags & 0xFFF7 | v13;

    [(UIView *)v6 setOpaque:0];
    double v14 = [(UIScrollView *)v6 _autoScrollAssistant];
    [v14 setAllowedDirections:6];
  }
  return v6;
}

- (void)setTextContainer:(id)a3
{
  id v4 = a3;
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  id WeakRetained = objc_loadWeakRetained((id *)&self->__textContainer);

  if (has_internal_diagnostics)
  {
    if (WeakRetained != v4)
    {
      id v7 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v7, OS_LOG_TYPE_FAULT, "unexpected different text container", buf, 2u);
      }
    }
  }
  else if (WeakRetained != v4)
  {
    double v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &setTextContainer____s_category) + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "unexpected different text container", v10, 2u);
    }
  }
}

- (void)_textStorageDidProcessEditing:(id)a3
{
  if ([(UIFieldEditor *)self _shouldObscureInput])
  {
    id v4 = [(UIFieldEditor *)self _textLayoutController];
    [v4 setUnobscuredRange:0];

    [(UIFieldEditor *)self _setNeedsInvalidateAfterObscuredRangeChange];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
  [WeakRetained setNeedsDisplay];

  id v6 = [(UIFieldEditor *)self _textCanvasView];
  [v6 setNeedsDisplay];

  *(_WORD *)&self->_feFlags &= ~0x100u;
}

- (id)selectionRectsForRange:(id)a3
{
  id v4 = a3;
  double v5 = [(UIFieldEditor *)self _textInputController];
  id v6 = [v5 selectionRectsForRange:v4];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_scrollAnimationEndedAction, 0);
  objc_destroyWeak((id *)&self->_contentView);
  objc_storeStrong((id *)&self->_obscureAllTextTimer, 0);
  objc_storeStrong((id *)&self->__textStorage, 0);
  objc_destroyWeak((id *)&self->__textLayoutController);
  objc_destroyWeak((id *)&self->__textContainer);
  objc_storeStrong((id *)&self->__textInputController, 0);
  objc_storeStrong((id *)&self->_originalDefaultAttributes, 0);
  objc_storeStrong((id *)&self->_originalAttributedString, 0);
  objc_storeStrong((id *)&self->_autoscroll, 0);
  objc_destroyWeak((id *)&self->_textField);
}

- (void)_deleteBackwardAndNotify:(BOOL)a3
{
  if (a3)
  {
    [(UIFieldEditor *)self deleteBackward];
  }
  else
  {
    v5[5] = v3;
    v5[6] = v4;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __64__UIFieldEditor_UITextInputAdditions___deleteBackwardAndNotify___block_invoke;
    v5[3] = &unk_1E52D9F70;
    v5[4] = self;
    [(UIFieldEditor *)self _performWhileSuppressingDelegateNotifications:v5];
  }
}

uint64_t __64__UIFieldEditor_UITextInputAdditions___deleteBackwardAndNotify___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) deleteBackward];
}

+ (id)sharedFieldEditor
{
  return 0;
}

+ (id)activeFieldEditor
{
  return 0;
}

- (UIFieldEditor)initWithFrame:(CGRect)a3
{
  return -[UIFieldEditor initWithTextField:](self, "initWithTextField:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (NSLayoutManager)layoutManager
{
  uint64_t v3 = [(UIFieldEditor *)self _textContainer];
  uint64_t v4 = [v3 textLayoutManager];

  if (v4)
  {
    double v5 = 0;
  }
  else
  {
    if (os_variant_has_internal_diagnostics())
    {
      __int16 v9 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v9, OS_LOG_TYPE_FAULT, "UIFieldEditor.layoutManager should no longer be accessed", buf, 2u);
      }
    }
    else
    {
      id v6 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &layoutManager___s_category) + 8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v10 = 0;
        _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "UIFieldEditor.layoutManager should no longer be accessed", v10, 2u);
      }
    }
    id v7 = [(UIFieldEditor *)self _textContainer];
    double v5 = [v7 layoutManager];
  }
  return (NSLayoutManager *)v5;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  [(UIView *)self traitCollection];

  v5.receiver = self;
  v5.super_class = (Class)UIFieldEditor;
  [(UIScrollView *)&v5 traitCollectionDidChange:v4];
}

- (BOOL)setUpClippingWithMaskForBounds:(CGRect)a3 contentFrame:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v8 = a3.size.width;
  CGFloat v9 = a3.origin.x;
  p_textField = &self->_textField;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
  char v13 = [WeakRetained clipsToBounds];

  if (v13) {
    return 0;
  }
  id v15 = objc_loadWeakRetained((id *)p_textField);
  [v15 bounds];
  CGFloat v50 = x;
  CGFloat v51 = width;
  CGFloat v16 = v9;
  double v18 = v17;
  double v20 = v19;
  CGFloat v21 = v8;
  CGFloat v22 = height;
  CGFloat v23 = y;
  double v25 = v24;
  double v27 = v26;
  id v28 = objc_loadWeakRetained((id *)p_textField);
  double v29 = v18;
  double v30 = v16;
  -[UIView convertRect:fromView:](self, "convertRect:fromView:", v28, v29, v20, v25, v27);
  CGFloat v32 = v31;
  CGFloat v34 = v33;

  v52.origin.CGFloat x = v16;
  v52.origin.CGFloat y = v32;
  double v35 = v23;
  double v36 = v22;
  double v37 = v21;
  v52.size.CGFloat width = v21;
  v52.size.CGFloat height = v34;
  v54.origin.CGFloat x = v50;
  v54.size.CGFloat width = v51;
  v54.origin.CGFloat y = v35;
  v54.size.CGFloat height = v36;
  BOOL v38 = CGRectContainsRect(v52, v54);
  if (!v38)
  {
    [(UIView *)self setClipsToBounds:0];
    v39 = [(UIView *)self layer];
    v40 = [v39 mask];

    if (v40)
    {
      [v40 frame];
    }
    else
    {
      v40 = [MEMORY[0x1E4F39C88] layer];
      v45 = [(UIView *)self layer];
      [v45 setMask:v40];

      [v40 frame];
      if (!v40)
      {
LABEL_12:

        return !v38;
      }
    }
    v55.origin.CGFloat x = v41;
    v55.origin.CGFloat y = v42;
    double v46 = v43;
    double v47 = v44;
    v53.origin.CGFloat x = v30;
    v53.origin.CGFloat y = v35;
    v53.size.CGFloat width = v37;
    v53.size.CGFloat height = v36;
    v55.size.CGFloat width = v46;
    v55.size.CGFloat height = v47;
    if (!CGRectEqualToRect(v53, v55))
    {
      uint64_t v48 = [MEMORY[0x1E4F39CF8] disableActions];
      [MEMORY[0x1E4F39CF8] setDisableActions:1];
      if (v37 != v46 || v36 != v47)
      {
        +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", 0.0, 0.0, v37, v36, *(void *)&v50, *(void *)&v51);
        id v49 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setPath:", objc_msgSend(v49, "CGPath"));
      }
      objc_msgSend(v40, "setFrame:", v30, v35, v37, v36, *(void *)&v50, *(void *)&v51);
      [MEMORY[0x1E4F39CF8] setDisableActions:v48];
    }
    goto LABEL_12;
  }
  return !v38;
}

- (BOOL)keyboardInput:(id)a3 shouldInsertText:(id)a4 isMarkedText:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  p_textField = &self->_textField;
  id WeakRetained = objc_loadWeakRetained((id *)p_textField);
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    id v13 = objc_loadWeakRetained((id *)p_textField);
    char v14 = [v13 keyboardInput:v8 shouldInsertText:v9 isMarkedText:v5];
  }
  else
  {
    char v14 = 1;
  }

  return v14;
}

- (BOOL)keyboardInput:(id)a3 shouldReplaceTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = a5;
  p_textField = &self->_textField;
  id WeakRetained = objc_loadWeakRetained((id *)p_textField);
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    id v14 = objc_loadWeakRetained((id *)p_textField);
    char v15 = objc_msgSend(v14, "keyboardInput:shouldReplaceTextInRange:replacementText:", v9, location, length, v10);
  }
  else
  {
    char v15 = 1;
  }

  return v15;
}

- (BOOL)keyboardInputShouldDelete:(id)a3
{
  id v4 = a3;
  p_textField = &self->_textField;
  id WeakRetained = objc_loadWeakRetained((id *)p_textField);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_textField);
    char v9 = [v8 keyboardInputShouldDelete:v4];
  }
  else
  {
    char v9 = 1;
  }

  return v9;
}

- (BOOL)keyboardInputChanged:(id)a3
{
  id v4 = a3;
  p_textField = &self->_textField;
  id WeakRetained = objc_loadWeakRetained((id *)p_textField);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_textField);
    char v9 = [v8 keyboardInputChanged:v4];
  }
  else
  {
    char v9 = 1;
  }

  return v9;
}

- (void)keyboardInputChangedSelection:(id)a3
{
  id v8 = a3;
  p_textField = &self->_textField;
  id WeakRetained = objc_loadWeakRetained((id *)p_textField);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_textField);
    [v7 keyboardInputChangedSelection:v8];
  }
}

- (void)textInputDidChange:(id)a3
{
  if (*(_WORD *)&self->_feFlags)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
    [WeakRetained fieldEditorDidChange:self];
  }
}

- (void)textInputDidChangeSelection:(id)a3
{
  id v5 = a3;
  if ((*(_WORD *)&self->_feFlags & 0x10) == 0 && ![(UIAutoscroll *)self->_autoscroll active]) {
    [(UIFieldEditor *)self scrollSelectionToVisible:0];
  }
  if ((*(_WORD *)&self->_feFlags & 2) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
    [WeakRetained fieldEditorDidChangeSelection:self];
  }
}

- (_NSRange)textInput:(id)a3 willChangeSelectionFromCharacterRange:(_NSRange)a4 toCharacterRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  NSUInteger v7 = a4.length;
  NSUInteger v8 = a4.location;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
  uint64_t v11 = objc_msgSend(WeakRetained, "fieldEditor:willChangeSelectionFromCharacterRange:toCharacterRange:", self, v8, v7, location, length);
  NSUInteger v13 = v12;

  NSUInteger v14 = v11;
  NSUInteger v15 = v13;
  result.NSUInteger length = v15;
  result.NSUInteger location = v14;
  return result;
}

- (BOOL)textInput:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  p_textField = &self->_textField;
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)p_textField);
  LOBYTE(length) = objc_msgSend(WeakRetained, "fieldEditor:shouldInsertText:replacingRange:", self, v9, location, length);

  return length;
}

- (void)textInput:(id)a3 prepareAttributedTextForInsertion:(id)a4
{
  p_textField = &self->_textField;
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_textField);
  char v6 = [v5 mutableString];

  [WeakRetained _sanitizeText:v6];
}

- (void)textInputWillAnimatePaste:(id)a3
{
  *(_WORD *)&self->_feFlags |= 0x80u;
}

- (void)textInputDidAnimatePaste:(id)a3
{
  *(_WORD *)&self->_feFlags &= ~0x80u;
}

- (void)setPadding:(UIEdgeInsets)a3
{
  self->_padding = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
  [WeakRetained setNeedsDisplay];
}

- (void)selectAll
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
  [WeakRetained selectAll];
}

- (id)_responderForBecomeFirstResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
  return WeakRetained;
}

- (BOOL)isFirstResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
  char v3 = [WeakRetained isFirstResponder];

  return v3;
}

- (CGRect)_responderExternalTouchRectForWindow:(id)a3
{
  id v4 = a3;
  id v5 = [(UIFieldEditor *)self interactionAssistant];
  char v6 = [v5 dynamicCaretView];

  if (v6)
  {
    [v6 bounds];
    objc_msgSend(v4, "convertRect:fromView:", v6);
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)UIFieldEditor;
    [(UIView *)&v19 _responderExternalTouchRectForWindow:v4];
  }
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;
  double v14 = v10;

  double v15 = v11;
  double v16 = v12;
  double v17 = v13;
  double v18 = v14;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (id)_textSelectingContainer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
  id v4 = WeakRetained;
  if (!WeakRetained) {
    id WeakRetained = self;
  }
  id v5 = WeakRetained;

  return v5;
}

- (id)textInputTraits
{
  p_textField = &self->_textField;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_textField);
    double v7 = [v6 textInputTraits];
  }
  else
  {
    double v7 = self;
    [(UIFieldEditor *)v7 setToDefaultValues];
  }
  return v7;
}

- (id)textColorForCaretSelection
{
  p_textField = &self->_textField;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)p_textField);
    id v6 = [v5 textColor];
  }
  else
  {
    id v6 = +[UIColor blackColor];
  }
  return v6;
}

- (void)startAutoscroll:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (!self->_autoscroll)
  {
    id v6 = objc_alloc_init(UIAutoscroll);
    autoscroll = self->_autoscroll;
    self->_autoscroll = v6;
  }
  CGFloat v21 = self;
  [(UIFieldEditor *)v21 _selectionClipRect];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  double v13 = v12;
  CGFloat v15 = v14;
  [(UIScrollView *)v21 contentSize];
  double v17 = v16;
  int v18 = [(UIFieldEditor *)v21 scrollXOffset];
  if (v18 >= 1)
  {
    v23.origin.double x = v9;
    v23.origin.double y = v11;
    v23.size.CGFloat width = v13;
    v23.size.CGFloat height = v15;
    if (x < CGRectGetMinX(v23) + 16.0)
    {
      uint64_t v19 = 1;
LABEL_9:
      -[UIAutoscroll startAutoscroll:scrollContainer:point:directions:repeatInterval:](self->_autoscroll, "startAutoscroll:scrollContainer:point:directions:repeatInterval:", v21, v21, v19, x, y, 0.075);
      goto LABEL_13;
    }
  }
  float v20 = v17 - v13;
  if ((float)v18 < v20)
  {
    v24.origin.double x = v9;
    v24.origin.double y = v11;
    v24.size.CGFloat width = v13;
    v24.size.CGFloat height = v15;
    if (x > CGRectGetMaxX(v24) + -16.0)
    {
      uint64_t v19 = 2;
      goto LABEL_9;
    }
  }
  if (objc_opt_respondsToSelector()) {
    [(UIFieldEditor *)v21 autoscrollWillNotStart];
  }
  [(UIFieldEditor *)v21 cancelAutoscroll];
LABEL_13:
}

- (void)updateAutoscroll:(id)a3
{
  id v30 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0
    || (id v6 = objc_loadWeakRetained((id *)&self->_textField),
        [v6 interactionAssistant],
        double v7 = objc_claimAutoreleasedReturnValue(),
        v6,
        !v7))
  {
    [(UIFieldEditor *)self cancelAutoscroll];
    goto LABEL_24;
  }
  uint64_t v8 = [(UIFieldEditor *)self scrollXOffset];
  uint64_t v9 = [(UIFieldEditor *)self scrollYOffset];
  if ((unint64_t)[v30 count] > 4) {
    int v10 = 10;
  }
  else {
    int v10 = (int)(1.0 / (double)(unint64_t)(6 - [v30 count]) * 10.0);
  }
  int v11 = [v30 directions];
  int v12 = v11;
  if (v11)
  {
    if ((int)v8 > 0)
    {
      uint64_t v13 = 0;
      uint64_t v8 = (v8 - v10);
      goto LABEL_18;
    }
    uint64_t v13 = 0;
    if ((v11 & 0xFFFFFFFE) != 0) {
      goto LABEL_18;
    }
  }
  else
  {
    if ((v11 & 2) == 0)
    {
      uint64_t v13 = 0;
      if (!v11) {
        goto LABEL_16;
      }
LABEL_18:
      [(UIFieldEditor *)self setScrollXOffset:v8 scrollYOffset:v9 adjustForPurpleCaret:v13];
      [v7 setAutoscrolled:1];
      int v18 = [(UIFieldEditor *)self interactionAssistant];
      uint64_t v19 = [v18 activeSelection];

      float v20 = [(UIFieldEditor *)self textInputView];
      [v7 autoscrollUntransformedExtentPoint];
      objc_msgSend(v20, "convertPoint:fromView:", 0);
      double v22 = v21;
      double v24 = v23;

      double v25 = [v19 selectedRange];
      int v26 = [v25 isEmpty];

      if (v26)
      {
        objc_msgSend(v19, "setSelectionWithPoint:", v22, v24);
        [v19 commit];
      }
      else
      {
        double v27 = [v19 selectedRange];

        if (v27)
        {
          id v28 = [(UIFieldEditor *)self interactionAssistant];
          objc_msgSend(v28, "updateSelectionWithPoint:", v22, v24);

          double v29 = [(UIFieldEditor *)self interactionAssistant];
          [v29 updateDisplayedSelection];
        }
      }

      goto LABEL_23;
    }
    id v14 = objc_loadWeakRetained((id *)&self->_textField);
    [v14 bounds];
    objc_msgSend(v14, "editingRectForBounds:");
    double v16 = v15;

    [(UIScrollView *)self contentSize];
    uint64_t v13 = 1;
    if (v17 - v16 > (double)(int)v8)
    {
      uint64_t v8 = (v10 + v8);
      goto LABEL_18;
    }
    if ((v12 & 0xFFFFFFFD) != 0) {
      goto LABEL_18;
    }
  }
LABEL_16:
  [(UIFieldEditor *)self cancelAutoscroll];
LABEL_23:

LABEL_24:
}

- (void)cancelAutoscroll
{
}

- (CGRect)contentFrameForView:(id)a3
{
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (void)_tvUpdateTextColor
{
  p_textField = &self->_textField;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textField);

  if (WeakRetained)
  {
    id v7 = objc_loadWeakRetained((id *)p_textField);
    double v5 = [v7 visualStyle];
    double v6 = [v5 defaultTextColorForKeyboardAppearance];
    [(UIFieldEditor *)self setTextColor:v6];
  }
}

- (void)activateEditor
{
  v35[3] = *MEMORY[0x1E4F143B8];
  p_textField = &self->_textField;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
  if (WeakRetained)
  {
    double v5 = WeakRetained;
    id v6 = objc_loadWeakRetained((id *)&self->_contentView);

    if (!v6)
    {
      id v7 = [(UIFieldEditor *)self _textStorage];
      uint64_t v8 = (NSAttributedString *)[v7 copy];
      originalAttributedString = self->_originalAttributedString;
      self->_originalAttributedString = v8;

      int v10 = [v7 defaultAttributes];
      int v11 = (NSDictionary *)[v10 copy];
      originalDefaultAttributes = self->_originalDefaultAttributes;
      self->_originalDefaultAttributes = v11;

      id v13 = objc_loadWeakRetained((id *)p_textField);
      id v14 = [v13 _textCanvasView];
      objc_storeWeak((id *)&self->_contentView, v14);

      id v15 = objc_loadWeakRetained((id *)&self->_contentView);
      [(UIView *)self addSubview:v15];

      if ([(UIFieldEditor *)self _shouldObscureInput]) {
        __int16 v16 = 32;
      }
      else {
        __int16 v16 = 0;
      }
      *(_WORD *)&self->___int16 feFlags = *(_WORD *)&self->_feFlags & 0xFFDF | v16;
      [(UIFieldEditor *)self _cancelObscureAllTextTimer];
      [(UIFieldEditor *)self _deactivateSelectionView];
      [(UIFieldEditor *)self _resetTypingAttributes];
      [(UIFieldEditor *)self _handleObscuredTextAfterActivationChange];
      id v17 = objc_loadWeakRetained((id *)&self->_contentView);
      self->_cachedUserInteractionEnabled = [v17 isUserInteractionEnabled];

      id v18 = objc_loadWeakRetained((id *)&self->_contentView);
      [v18 setUserInteractionEnabled:1];

      id v19 = objc_loadWeakRetained((id *)p_textField);
      uint64_t v20 = [v19 _textInputSource];

      id v21 = objc_loadWeakRetained((id *)p_textField);
      int v22 = [v21 isFirstResponder];

      if (v22
        && (v20 != 3
         || !+[UIScribbleInteraction isScribbleEnabled]))
      {
        [(UIFieldEditor *)self _updateTextSelectionFromBehavior];
      }
      [(UIFieldEditor *)self _applyCorrectTextContainerSize];
      id v23 = objc_loadWeakRetained((id *)p_textField);
      int v24 = [v23 isFirstResponder];

      if (v24)
      {
        double v25 = [(UIFieldEditor *)self _textStorage];
        uint64_t v26 = [v25 length];

        if (!v26)
        {
          double v27 = objc_opt_new();
          id v28 = objc_loadWeakRetained((id *)p_textField);
          objc_msgSend(v27, "setAlignment:", objc_msgSend(v28, "textAlignment"));

          id v29 = objc_loadWeakRetained((id *)p_textField);
          objc_msgSend(v27, "setLineBreakMode:", objc_msgSend(v29, "_lineBreakMode"));

          v34[0] = *(void *)off_1E52D2040;
          id v30 = [(UIFieldEditor *)self font];
          v35[0] = v30;
          v34[1] = *(void *)off_1E52D2048;
          double v31 = [(UIFieldEditor *)self textColor];
          v34[2] = *(void *)off_1E52D21B8;
          v35[1] = v31;
          v35[2] = v27;
          CGFloat v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:3];
          double v33 = [(UIFieldEditor *)self _textInputController];
          [v33 setTypingAttributes:v32];
        }
      }
      [(UIFieldEditor *)self _updateLayoutManagerStyleEffectConfiguration];
      [(UIView *)self layoutIfNeeded];
      [(UIFieldEditor *)self scrollSelectionToVisible:1];
    }
  }
}

- (void)_updateTextSelectionFromBehavior
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __49__UIFieldEditor__updateTextSelectionFromBehavior__block_invoke;
  v2[3] = &unk_1E52D9F70;
  v2[4] = self;
  +[UIView performWithoutAnimation:v2];
}

void __49__UIFieldEditor__updateTextSelectionFromBehavior__block_invoke(uint64_t a1)
{
  id v12 = [*(id *)(a1 + 32) _textInputTraits];
  double v2 = [*(id *)(a1 + 32) text];
  int v3 = [v2 length];

  int v4 = [v12 textSelectionBehavior];
  if ((v4 - 2) < 2)
  {
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = [v7 beginningOfDocument];
    uint64_t v9 = [*(id *)(a1 + 32) endOfDocument];
    int v10 = [v7 textRangeFromPosition:v8 toPosition:v9];

    int v11 = *(void **)(a1 + 32);
    if (v10) {
      [v11 setSelectedTextRange:v10];
    }
    else {
      objc_msgSend(v11, "setSelection:", 0, v3);
    }

    goto LABEL_11;
  }
  if (v4)
  {
    if (v4 != 1) {
      goto LABEL_11;
    }
    double v5 = *(void **)(a1 + 32);
    uint64_t v6 = 0;
  }
  else
  {
    double v5 = *(void **)(a1 + 32);
    uint64_t v6 = v3;
  }
  objc_msgSend(v5, "setSelection:", v6, 0);
LABEL_11:
}

- (void)deactivateEditorDiscardingEdits:(BOOL)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
  if (WeakRetained)
  {
    uint64_t v6 = WeakRetained;
    id v7 = objc_loadWeakRetained((id *)&self->_contentView);

    if (v7)
    {
      uint64_t v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v8 removeObserver:self name:@"UITextSelectionDidScroll" object:self];

      if (a3)
      {
        uint64_t v9 = [(UIFieldEditor *)self _textStorage];
        [v9 setDefaultAttributes:self->_originalDefaultAttributes];

        int v10 = [(UIFieldEditor *)self _textStorage];
        [v10 setAttributedString:self->_originalAttributedString];
      }
      originalAttributedString = self->_originalAttributedString;
      self->_originalAttributedString = 0;

      originalDefaultAttributes = self->_originalDefaultAttributes;
      self->_originalDefaultAttributes = 0;

      [(UIFieldEditor *)self _cancelObscureAllTextTimer];
      [(UIFieldEditor *)self _deactivateSelectionView];
      [(UIFieldEditor *)self _resetTypingAttributes];
      id v13 = [(UIFieldEditor *)self _inputController];
      [v13 didEndEditing];

      [(UIFieldEditor *)self _handleObscuredTextAfterActivationChange];
      id v14 = objc_loadWeakRetained((id *)&self->_contentView);
      [v14 setUserInteractionEnabled:0];

      objc_storeWeak((id *)&self->_contentView, 0);
      [(UIFieldEditor *)self _applyCorrectTextContainerSize];
    }
  }
}

- (void)_resetTypingAttributes
{
  id v2 = [(UIFieldEditor *)self _textInputController];
  [v2 setTypingAttributes:0];
  [v2 _invalidateEmptyStringAttributes];
}

- (void)_deactivateSelectionView
{
  int v3 = [(UIFieldEditor *)self interactionAssistant];
  [v3 setSelectionDisplayVisible:0];

  id v4 = [(UIFieldEditor *)self interactionAssistant];
  [v4 deactivateSelection];
}

- (void)_handleObscuredTextAfterActivationChange
{
  if ([(UIFieldEditor *)self _shouldObscureInput])
  {
    [(UIFieldEditor *)self _obscureAllText];
  }
  else
  {
    [(UIFieldEditor *)self _setNeedsInvalidateAfterObscuredRangeChange];
  }
}

- (void)_setValue:(id)a3 forTextAttribute:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v11 = [(UIFieldEditor *)self _textInputController];
  uint64_t v8 = [v11 typingAttributes];
  uint64_t v9 = (void *)[v8 mutableCopy];

  [v9 setObject:v7 forKey:v6];
  [v11 setTypingAttributes:v9];
  int v10 = [(UIFieldEditor *)self _textStorage];
  [v10 beginEditing];
  objc_msgSend(v10, "addAttribute:value:range:", v6, v7, 0, objc_msgSend(v10, "length"));

  [v10 endEditing];
}

- (_NSRange)_unobscuredSecureRange
{
  id v2 = [(UIFieldEditor *)self _textLayoutController];
  int v3 = [v2 unobscuredRange];
  uint64_t v4 = [v2 characterRangeForTextRange:v3];
  NSUInteger v6 = v5;

  NSUInteger v7 = v4;
  NSUInteger v8 = v6;
  result.NSUInteger length = v8;
  result.NSUInteger location = v7;
  return result;
}

- (id)layoutManager:(id)a3 effectiveCUICatalogForTextEffect:(id)a4
{
  p_textField = &self->_textField;
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_textField);
  NSUInteger v7 = [WeakRetained _cuiCatalog];

  LODWORD(WeakRetained) = [v7 hasStylePresetWithName:v5];
  if (WeakRetained) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  return v8;
}

- (void)setTextColor:(id)a3
{
}

- (id)textColor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
  int v3 = [WeakRetained textColor];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = +[UIColor blackColor];
  }
  NSUInteger v6 = v5;

  return v6;
}

- (void)setFont:(id)a3
{
}

- (id)font
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
  int v3 = [WeakRetained font];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    [off_1E52D39B8 systemMinimumFontSize];
    objc_msgSend(off_1E52D39B8, "systemFontOfSize:");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  NSUInteger v6 = v5;

  return v6;
}

- (void)setTypingAttributes:(id)a3
{
  id v4 = a3;
  id v5 = [(UIFieldEditor *)self _textInputController];
  [v5 setTypingAttributes:v4];

  NSUInteger v6 = [(UIFieldEditor *)self _textContainer];
  [v6 setAttributesForExtraLineFragment:v4];

  if ([(UIFieldEditor *)self _shouldObscureInput])
  {
    [(UIFieldEditor *)self _obscureAllText];
  }
}

- (void)_setTextInRange:(_NSRange)a3 replacementText:(id)a4 andSetCaretSelectionAfterText:(BOOL)a5
{
  BOOL v5 = a5;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v9 = (__CFString *)a4;
  int v10 = [(UIFieldEditor *)self _textInputController];
  id v14 = [v10 typingAttributes];

  id v11 = objc_alloc(MEMORY[0x1E4F28E48]);
  if (v9) {
    id v12 = v9;
  }
  else {
    id v12 = &stru_1ED0E84C0;
  }
  id v13 = (void *)[v11 initWithString:v12 attributes:v14];

  -[UIFieldEditor _setAttributedTextInRange:replacementText:andSetCaretSelectionAfterText:](self, "_setAttributedTextInRange:replacementText:andSetCaretSelectionAfterText:", location, length, v13, v5);
  [(UIFieldEditor *)self scrollSelectionToVisible:0];
}

- (id)text
{
  int v3 = [(UIFieldEditor *)self _textInputController];
  id v4 = [(UIFieldEditor *)self beginningOfDocument];
  BOOL v5 = [(UIFieldEditor *)self endOfDocument];
  NSUInteger v6 = [(UIFieldEditor *)self textRangeFromPosition:v4 toPosition:v5];
  NSUInteger v7 = [v3 textInRange:v6];

  return v7;
}

- (void)setText:(id)a3
{
  id v4 = a3;
  id v5 = [(UIFieldEditor *)self text];
  -[UIFieldEditor _setTextInRange:replacementText:andSetCaretSelectionAfterText:](self, "_setTextInRange:replacementText:andSetCaretSelectionAfterText:", 0, [v5 length], v4, 1);
}

- (void)setText:(id)a3 andSetCaretSelectionAfterText:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(UIFieldEditor *)self text];
  -[UIFieldEditor _setTextInRange:replacementText:andSetCaretSelectionAfterText:](self, "_setTextInRange:replacementText:andSetCaretSelectionAfterText:", 0, [v7 length], v6, v4);
}

- (void)setTextInRange:(_NSRange)a3 replacementText:(id)a4
{
}

- (void)addTextAlternativesDisplayStyle:(int64_t)a3 toRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v11 = [(UIFieldEditor *)self _textLayoutController];
  id v8 = objc_msgSend(v11, "textRangeForCharacterRange:", location, length);
  uint64_t v9 = *(void *)off_1E52D2290;
  int v10 = [NSNumber numberWithInteger:a3];
  [v11 addAnnotationAttribute:v9 value:v10 forRange:v8];

  objc_msgSend(v11, "boundingRectForCharacterRange:", location, length);
  -[UIView setNeedsDisplayInRect:](self, "setNeedsDisplayInRect:");
}

- (void)_setAttributedTextInRange:(_NSRange)a3 replacementText:(id)a4 andSetCaretSelectionAfterText:(BOOL)a5
{
  BOOL v5 = a5;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v9 = a4;
  int v10 = [(UIFieldEditor *)self attributedText];
  id v11 = objc_msgSend(v10, "attributedSubstringFromRange:", location, length);
  char v12 = [v11 isEqual:v9];

  if ((v12 & 1) == 0)
  {
    if (location)
    {
      BOOL v13 = 0;
    }
    else
    {
      id v14 = [(UIFieldEditor *)self _textStorage];
      BOOL v13 = length == [v14 length];
    }
    id WeakRetained = (UIFieldEditor *)objc_loadWeakRetained((id *)&self->_textField);
    __int16 v16 = WeakRetained;
    if (WeakRetained) {
      id v17 = WeakRetained;
    }
    else {
      id v17 = self;
    }
    id v18 = v17;

    id v19 = [(UIFieldEditor *)self inputDelegate];
    [v19 textWillChange:v18];
    uint64_t v20 = [(UIFieldEditor *)self _textStorage];
    unint64_t v21 = [v20 length];
    if (!v13)
    {

      if (v21 < location + length) {
        goto LABEL_14;
      }
      int v22 = [(UIFieldEditor *)self _textStorage];
      unint64_t v23 = [v22 length];

      uint64_t v20 = [(UIFieldEditor *)self _textStorage];
      uint64_t v24 = [v20 length];
      if (v23 > location)
      {
        unint64_t v21 = v24 - location;
      }
      else
      {
        NSUInteger location = v24;
        unint64_t v21 = 0;
      }
    }

    NSUInteger length = v21;
LABEL_14:
    double v25 = [(UIFieldEditor *)self _textInputController];
    uint64_t v26 = [(UIFieldEditor *)self _textStorage];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __89__UIFieldEditor__setAttributedTextInRange_replacementText_andSetCaretSelectionAfterText___block_invoke;
    v36[3] = &unk_1E530B1C0;
    NSUInteger v38 = location;
    NSUInteger v39 = length;
    id v27 = v9;
    id v37 = v27;
    [v26 coordinateEditing:v36];

    if (v27)
    {
      if (!v5)
      {
LABEL_17:
        [v19 textDidChange:v18];
        uint64_t v29 = *(void *)off_1E52D2288;
        uint64_t v30 = [v27 length];
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __89__UIFieldEditor__setAttributedTextInRange_replacementText_andSetCaretSelectionAfterText___block_invoke_2;
        v31[3] = &unk_1E530B1E8;
        NSUInteger v34 = location;
        NSUInteger v35 = length;
        id v9 = v27;
        id v32 = v9;
        double v33 = self;
        objc_msgSend(v9, "enumerateAttribute:inRange:options:usingBlock:", v29, 0, v30, 0, v31);

        goto LABEL_18;
      }
    }
    else
    {
      id v27 = (id)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:&stru_1ED0E84C0];
      if (!v5) {
        goto LABEL_17;
      }
    }
    id v28 = [(UIFieldEditor *)self _textStorage];
    objc_msgSend(v25, "setSelectedRange:", objc_msgSend(v28, "length"), 0);

    goto LABEL_17;
  }
LABEL_18:
}

uint64_t __89__UIFieldEditor__setAttributedTextInRange_replacementText_andSetCaretSelectionAfterText___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "replaceCharactersInRange:withAttributedString:", a1[5], a1[6], a1[4]);
}

uint64_t __89__UIFieldEditor__setAttributedTextInRange_replacementText_andSetCaretSelectionAfterText___block_invoke_2(uint64_t result, void *a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    uint64_t v3 = *(void *)(result + 48);
    BOOL v4 = *(void **)(result + 32);
    id v5 = a2;
    uint64_t v6 = [v4 length];
    unsigned int v7 = [v5 isLowConfidence];

    id v8 = *(void **)(v2 + 40);
    return objc_msgSend(v8, "addTextAlternativesDisplayStyle:toRange:", v7, v3, v6);
  }
  return result;
}

- (id)attributedText
{
  uint64_t v2 = [(UIFieldEditor *)self _textInputController];
  uint64_t v3 = [v2 filteredAttributedText];

  return v3;
}

- (void)setAttributedText:(id)a3
{
  id v4 = a3;
  id v5 = [(UIFieldEditor *)self attributedText];
  -[UIFieldEditor _setAttributedTextInRange:replacementText:andSetCaretSelectionAfterText:](self, "_setAttributedTextInRange:replacementText:andSetCaretSelectionAfterText:", 0, [v5 length], v4, 1);
}

- (void)setAttributedText:(id)a3 andSetCaretSelectionAfterText:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(UIFieldEditor *)self attributedText];
  -[UIFieldEditor _setAttributedTextInRange:replacementText:andSetCaretSelectionAfterText:](self, "_setAttributedTextInRange:replacementText:andSetCaretSelectionAfterText:", 0, [v7 length], v6, v4);
}

- (void)setAttributedTextInRange:(_NSRange)a3 replacementText:(id)a4
{
}

- (int)scrollXOffset
{
  [(UIScrollView *)self contentOffset];
  return (int)v2;
}

- (int)scrollYOffset
{
  [(UIScrollView *)self contentOffset];
  return (int)v2;
}

- (void)setScrollXOffset:(int)a3 scrollYOffset:(int)a4
{
}

- (void)setScrollXOffset:(int)a3 scrollYOffset:(int)a4 adjustForPurpleCaret:(BOOL)a5
{
  -[UIFieldEditor setContentOffset:](self, "setContentOffset:", (double)a3, (double)a4);
  [(UIView *)self setNeedsDisplay];
}

- (_NSRange)selectionRange
{
  double v2 = [(UIFieldEditor *)self _textInputController];
  uint64_t v3 = [v2 selectedRange];
  NSUInteger v5 = v4;

  NSUInteger v6 = v3;
  NSUInteger v7 = v5;
  result.NSUInteger length = v7;
  result.NSUInteger location = v6;
  return result;
}

- (void)setSelection:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id WeakRetained = objc_loadWeakRetained((id *)&self->__textLayoutController);
  NSUInteger v6 = objc_msgSend(WeakRetained, "textRangeForCharacterRange:", location, length);
  [(UIFieldEditor *)self setSelectedTextRange:v6];
}

- (BOOL)hasMarkedText
{
  return 0;
}

- (void)_performWhileSuppressingDelegateNotifications:(id)a3
{
  id v4 = a3;
  id v5 = [(UIFieldEditor *)self _textInputController];
  [v5 _performWhileSuppressingDelegateNotifications:v4];
}

+ (id)excludedElementsForHTML
{
  if (qword_1EB25D5E0 != -1) {
    dispatch_once(&qword_1EB25D5E0, &__block_literal_global_574);
  }
  double v2 = (void *)_MergedGlobals_7_10;
  return v2;
}

void __40__UIFieldEditor_excludedElementsForHTML__block_invoke()
{
  uint64_t v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"P", @"STYLE", @"HTML", @"APPLET", @"OBJECT", @"BASEFONT", @"CENTER", @"DIR", @"FONT", @"ISINDEX", @"MENU", @"S", @"XML", @"BODY", @"HEAD", @"META", 0);
  v1 = (void *)_MergedGlobals_7_10;
  _MergedGlobals_7_10 = v0;
}

- (void)_scrollViewAnimationEnded:(id)a3 finished:(BOOL)a4
{
  BOOL v4 = a4;
  NSUInteger v6 = [(UIFieldEditor *)self _scrollAnimationEndedAction];
  if (v6)
  {
    [(UIFieldEditor *)self _setScrollAnimationEndedAction:0];
    v6[2](v6, v4);
  }
}

- (void)_scrollRangeToVisible:(_NSRange)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  NSUInteger location = a3.location;
  id v30 = [(UIFieldEditor *)self _textLayoutController];
  NSUInteger v7 = [v30 documentRange];
  [v30 ensureLayoutForRange:v7];

  [(UIView *)self layoutBelowIfNeeded];
  id v8 = [v30 positionWithOffset:location affinity:0];
  [(UIFieldEditor *)self caretRectForPosition:v8];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  double v14 = v13;
  CGFloat v16 = v15;

  v32.origin.double x = v10;
  v32.origin.double y = v12;
  v32.size.double width = v14;
  v32.size.double height = v16;
  CGRect v33 = CGRectInset(v32, -fmax(10.0 - v14, 0.0), 0.0);
  double x = v33.origin.x;
  double y = v33.origin.y;
  double width = v33.size.width;
  double height = v33.size.height;
  unint64_t v21 = [(UIFieldEditor *)self textInputView];
  -[UIView convertRect:fromView:](self, "convertRect:fromView:", v21, x, y, width, height);
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;

  -[UIScrollView scrollRectToVisible:animated:](self, "scrollRectToVisible:animated:", v4, v23, v25, v27, v29);
}

- (void)scrollSelectionToVisible:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(UIFieldEditor *)self _textInputController];
  -[UIFieldEditor _scrollRangeToVisible:animated:](self, "_scrollRangeToVisible:animated:", [v5 selectedRange], 0, v3);
}

- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4
{
  if ((*(_WORD *)&self->_feFlags & 0x80) == 0)
  {
    BOOL v4 = a4;
    double y = a3.y;
    double x = a3.x;
    [(UIScrollView *)self contentOffset];
    if (x != v9 || y != v8)
    {
      v11.receiver = self;
      v11.super_class = (Class)UIFieldEditor;
      -[UIScrollView setContentOffset:animated:](&v11, sel_setContentOffset_animated_, v4, x, y);
    }
  }
}

- (id)undoManager
{
  double v2 = [(UIFieldEditor *)self _textInputController];
  BOOL v3 = [v2 undoManager];

  return v3;
}

- (int64_t)nonEditingLinebreakMode
{
  double v2 = [(UIFieldEditor *)self _textStorage];
  int64_t v3 = [v2 lineBreakMode];

  return v3;
}

- (void)setNonEditingLinebreakMode:(int64_t)a3
{
  id v4 = [(UIFieldEditor *)self _textStorage];
  [v4 setLineBreakMode:a3];
}

- (double)_passcodeStyleAlpha
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
  [WeakRetained _passcodeStyleAlpha];
  double v4 = v3;

  return v4;
}

- (BOOL)_clearOnEditIfNeeded
{
  $C662668F73BD8D46A89588BCE30BB128 feFlags = self->_feFlags;
  if ((*(unsigned char *)&feFlags & 0x20) != 0)
  {
    double v4 = [(UIFieldEditor *)self _textInputController];
    if ([v4 hasText]) {
      [v4 clearText];
    }
    *(_WORD *)&self->_feFlags &= ~0x20u;
  }
  return (*(unsigned int *)&feFlags >> 5) & 1;
}

- (void)_handleObscuredTextInputIfNecessaryWithEditingBlock:(id)a3
{
  double v4 = (void (**)(id, id))a3;
  if (![(UIFieldEditor *)self _shouldObscureInput])
  {
    id v16 = [(UIFieldEditor *)self _textInputController];
    v4[2](v4, v16);

    goto LABEL_8;
  }
  id v5 = [(UIFieldEditor *)self _textLayoutController];
  [v5 resetFontForExtraBulletRendering];

  [(UIFieldEditor *)self _cancelObscureAllTextTimer];
  NSUInteger v6 = [(UIFieldEditor *)self _textInputController];
  uint64_t v7 = [v6 selectedRange];
  uint64_t v9 = v8;

  CGFloat v10 = [(UIFieldEditor *)self _textInputController];
  v4[2](v4, v10);

  objc_super v11 = [(UIFieldEditor *)self _textInputController];
  uint64_t v12 = [v11 selectedRange];

  if (![(UIFieldEditor *)self _shouldObscureNextInput])
  {
    id v16 = [(UIFieldEditor *)self _textStorage];
    v19.NSUInteger length = [v16 length];
    v18.NSUInteger location = v7 + v9;
    v18.NSUInteger length = v12 - (v7 + v9);
    v19.NSUInteger location = 0;
    NSRange v13 = NSIntersectionRange(v18, v19);
    if (v13.length)
    {
      if ([(UIFieldEditor *)self isFirstResponder])
      {
        double v14 = [v16 string];
        RangeOfComposedCharactersAtIndedouble x = CFStringGetRangeOfComposedCharactersAtIndex(v14, v13.length + v13.location - 1);

        if (RangeOfComposedCharactersAtIndex.length)
        {
          -[UIFieldEditor _unobscureTextInRange:settingTimerToReobscure:](self, "_unobscureTextInRange:settingTimerToReobscure:", RangeOfComposedCharactersAtIndex.location, RangeOfComposedCharactersAtIndex.length, 1);
LABEL_8:

          return;
        }
      }
    }
  }
  [(UIFieldEditor *)self _obscureAllText];
  if ([(UIFieldEditor *)self _shouldObscureNextInput])
  {
    [(UIFieldEditor *)self set_shouldObscureNextInput:0];
  }
}

- (BOOL)hasText
{
  double v2 = [(UIFieldEditor *)self _textInputController];
  char v3 = [v2 hasText];

  return v3;
}

- (_NSRange)insertFilteredText:(id)a3
{
  id v4 = a3;
  int v5 = [v4 isEqualToString:@"\n"];
  if ((*(_WORD *)&self->_feFlags & 8) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
    int v7 = [WeakRetained fieldEditor:self shouldReplaceWithText:v4];

    if (v7)
    {
      uint64_t v8 = [(UIFieldEditor *)self text];
      -[UIFieldEditor setSelection:](self, "setSelection:", 0, [v8 length]);
    }
  }
  if (v5)
  {
    p_textField = &self->_textField;
    id v10 = objc_loadWeakRetained((id *)p_textField);
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      id v12 = objc_loadWeakRetained((id *)p_textField);
      [v12 _sendActionsForEvents:0x80000 withEvent:0];
    }
    id v13 = objc_loadWeakRetained((id *)p_textField);
    int v14 = [v13 _shouldResignOnEditingDidEndOnExit];

    if (v14)
    {
      id v15 = objc_loadWeakRetained((id *)p_textField);
      [v15 resignFirstResponder];
    }
    uint64_t v16 = 0;
    uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    [(UIFieldEditor *)self _clearOnEditIfNeeded];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __36__UIFieldEditor_insertFilteredText___block_invoke;
    v21[3] = &unk_1E530B210;
    id v18 = v4;
    id v22 = v18;
    [(UIFieldEditor *)self _handleObscuredTextInputIfNecessaryWithEditingBlock:v21];
    uint64_t v16 = [v18 length];

    uint64_t v17 = 0;
  }

  NSUInteger v19 = v17;
  NSUInteger v20 = v16;
  result.NSUInteger length = v20;
  result.NSUInteger location = v19;
  return result;
}

uint64_t __36__UIFieldEditor_insertFilteredText___block_invoke(uint64_t a1, void *a2)
{
  return [a2 insertText:*(void *)(a1 + 32)];
}

- (void)_unobscureTextInRange:(_NSRange)a3 settingTimerToReobscure:(BOOL)a4
{
  BOOL v4 = a4;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v8 = [(UIFieldEditor *)self _textStorage];
  v16.NSUInteger length = [v8 length];
  v15.NSUInteger location = location;
  v15.NSUInteger length = length;
  v16.NSUInteger location = 0;
  NSRange v9 = NSIntersectionRange(v15, v16);

  id v13 = [(UIFieldEditor *)self _textLayoutController];
  id v10 = objc_msgSend(v13, "textRangeForCharacterRange:", v9.location, v9.length);
  [v13 setUnobscuredRange:v10];
  [v13 invalidateLayoutForRange:v10];
  if (v4)
  {
    [(UIFieldEditor *)self _cancelObscureAllTextTimer];
    char v11 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__obscureAllText selector:0 userInfo:0 repeats:2.0];
    obscureAllTextTimer = self->_obscureAllTextTimer;
    self->_obscureAllTextTimer = v11;
  }
  [(UIFieldEditor *)self _setNeedsInvalidateAfterObscuredRangeChange];
}

- (void)_ephemerallyUnobscureCharacterAtIndex:(unint64_t)a3
{
  id v7 = [(UIFieldEditor *)self _textStorage];
  if ([v7 length])
  {
    int v5 = [v7 string];
    RangeOfComposedCharactersAtIndedouble x = CFStringGetRangeOfComposedCharactersAtIndex(v5, a3);

    if (RangeOfComposedCharactersAtIndex.length >= 1) {
      -[UIFieldEditor _unobscureTextInRange:settingTimerToReobscure:](self, "_unobscureTextInRange:settingTimerToReobscure:", RangeOfComposedCharactersAtIndex.location, RangeOfComposedCharactersAtIndex.length, 1);
    }
  }
}

- (void)_ephemerallyUnobscureTextInRange:(_NSRange)a3
{
  if (a3.length)
  {
    NSUInteger length = a3.length;
    NSUInteger location = a3.location;
    id v6 = [(UIFieldEditor *)self _textStorage];
    if ([v6 length]) {
      -[UIFieldEditor _unobscureTextInRange:settingTimerToReobscure:](self, "_unobscureTextInRange:settingTimerToReobscure:", location, length, 1);
    }
  }
}

- (void)_obscureAllText
{
  [(UIFieldEditor *)self _cancelObscureAllTextTimer];
  char v3 = [(UIFieldEditor *)self _textLayoutController];
  [v3 setUnobscuredRange:0];

  [(UIFieldEditor *)self _setNeedsInvalidateAfterObscuredRangeChange];
}

- (void)deleteBackward
{
  if (![(UIFieldEditor *)self _clearOnEditIfNeeded])
  {
    char v3 = [(UIFieldEditor *)self _textInputController];
    [v3 deleteBackward];
  }
  if ([(UIFieldEditor *)self _shouldObscureInput])
  {
    [(UIFieldEditor *)self _obscureAllText];
  }
}

- (void)insertAttributedText:(id)a3
{
  id v4 = a3;
  id v5 = [(UIFieldEditor *)self _textInputController];
  [v5 insertAttributedText:v4];
}

- (id)attributedTextInRange:(id)a3
{
  id v4 = a3;
  id v5 = [(UIFieldEditor *)self _textInputController];
  id v6 = [v5 attributedTextInRange:v4];

  return v6;
}

- (void)replaceRange:(id)a3 withText:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(UIFieldEditor *)self _textInputController];
  [v8 replaceRange:v7 withText:v6];
}

- (void)replaceRange:(id)a3 withAttributedText:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(UIFieldEditor *)self _textInputController];
  [v8 replaceRange:v7 withAttributedText:v6];
}

- (void)replaceRangeWithTextWithoutClosingTyping:(id)a3 replacementText:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__UIFieldEditor_replaceRangeWithTextWithoutClosingTyping_replacementText___block_invoke;
  v10[3] = &unk_1E530B238;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(UIFieldEditor *)self _handleObscuredTextInputIfNecessaryWithEditingBlock:v10];
}

uint64_t __74__UIFieldEditor_replaceRangeWithTextWithoutClosingTyping_replacementText___block_invoke(uint64_t a1, void *a2)
{
  return [a2 replaceRangeWithTextWithoutClosingTyping:*(void *)(a1 + 32) replacementText:*(void *)(a1 + 40)];
}

- (void)clearText
{
  id v2 = [(UIFieldEditor *)self _textInputController];
  [v2 clearText];
}

- (void)setSelectedTextRange:(id)a3
{
  p_textField = &self->_textField;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_textField);
  int v7 = [WeakRetained _isPasscodeStyle];

  if (v7)
  {
    id v8 = [(UIFieldEditor *)self _textLayoutController];
    id v9 = [v5 end];

    id v11 = [v8 emptyTextRangeAtPosition:v9];

    id v10 = [(UIFieldEditor *)self _textInputController];
    [v10 setSelectedTextRange:v11];

    if ([(UIFieldEditor *)self _shouldObscureInput]) {
      [(UIFieldEditor *)self _obscureAllText];
    }
    id v5 = [(UIFieldEditor *)self interactionAssistant];
    [v5 selectionChanged];
  }
  else
  {
    id v11 = [(UIFieldEditor *)self _textInputController];
    [v11 setSelectedTextRange:v5];
  }
}

- (NSDictionary)markedTextStyle
{
  id v2 = [(UIFieldEditor *)self _textInputController];
  char v3 = [v2 markedTextStyle];

  return (NSDictionary *)v3;
}

- (void)setMarkedTextStyle:(id)a3
{
  id v4 = a3;
  id v5 = [(UIFieldEditor *)self _textInputController];
  [v5 setMarkedTextStyle:v4];
}

- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  uint64_t v8 = [(UIFieldEditor *)self markedTextRange];
  if (!v8
    || (id v9 = (void *)v8,
        [(UIFieldEditor *)self markedTextRange],
        id v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = [v10 isEmpty],
        v10,
        v9,
        v11))
  {
    [(UIFieldEditor *)self _clearOnEditIfNeeded];
  }
  id v12 = [(UIFieldEditor *)self _textInputController];
  objc_msgSend(v12, "setMarkedText:selectedRange:", v7, location, length);

  if ([(UIFieldEditor *)self _shouldObscureInput])
  {
    [(UIFieldEditor *)self _obscureAllText];
  }
}

- (void)setAttributedMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  uint64_t v8 = [(UIFieldEditor *)self _textInputController];
  objc_msgSend(v8, "setAttributedMarkedText:selectedRange:", v7, location, length);

  if ([(UIFieldEditor *)self _shouldObscureInput])
  {
    [(UIFieldEditor *)self _obscureAllText];
  }
}

- (void)unmarkText
{
  id v2 = [(UIFieldEditor *)self _textInputController];
  [v2 unmarkText];
}

- (UITextPosition)endOfDocument
{
  id v2 = [(UIFieldEditor *)self _textInputController];
  char v3 = [v2 endOfDocument];

  return (UITextPosition *)v3;
}

- (id)positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5
{
  id v8 = a3;
  id v9 = [(UIFieldEditor *)self _textInputController];
  id v10 = [v9 positionFromPosition:v8 inDirection:a4 offset:a5];

  return v10;
}

- (id)positionWithinRange:(id)a3 farthestInDirection:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(UIFieldEditor *)self _textInputController];
  id v8 = [v7 positionWithinRange:v6 farthestInDirection:a4];

  return v8;
}

- (id)characterRangeByExtendingPosition:(id)a3 inDirection:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(UIFieldEditor *)self _textInputController];
  id v8 = [v7 characterRangeByExtendingPosition:v6 inDirection:a4];

  return v8;
}

- (id)_visualSelectionRangeForExtent:(id)a3 forPoint:(CGPoint)a4 fromPosition:(id)a5 inDirection:(int64_t)a6
{
  double y = a4.y;
  double x = a4.x;
  id v11 = a5;
  id v12 = a3;
  id v13 = [(UIFieldEditor *)self _textLayoutController];
  int v14 = objc_msgSend(v13, "_visualSelectionRangeForExtent:forPoint:fromPosition:inDirection:", v12, v11, a6, x, y);

  return v14;
}

- (void)setInputDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(UIFieldEditor *)self _textInputController];
  [v5 setInputDelegate:v4];
}

- (UITextInputDelegate)inputDelegate
{
  id v2 = [(UIFieldEditor *)self _textInputController];
  char v3 = [v2 inputDelegate];

  return (UITextInputDelegate *)v3;
}

- (UITextInputTokenizer)tokenizer
{
  id v2 = [(UIFieldEditor *)self _textInputController];
  char v3 = [v2 tokenizer];

  return (UITextInputTokenizer *)v3;
}

- (int64_t)baseWritingDirectionForPosition:(id)a3 inDirection:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(UIFieldEditor *)self _textInputController];
  int64_t v8 = [v7 baseWritingDirectionForPosition:v6 inDirection:a4];

  return v8;
}

- (void)setBaseWritingDirection:(int64_t)a3 forRange:(id)a4
{
  id v6 = a4;
  id v7 = [(UIFieldEditor *)self _textInputController];
  [v7 setBaseWritingDirection:a3 forRange:v6];

  id v11 = [(UIFieldEditor *)self _textStorage];
  if (![v11 length])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
    int v9 = [WeakRetained _shouldIgnoreBaseWritingDirectionChanges];

    if (v9)
    {
      id v10 = [(UIFieldEditor *)self _textInputController];
      [v10 _updateEmptyStringAttributes];
    }
    else
    {
      [v11 setDefaultBaseWritingDirection:a3];
    }
  }
}

- (CGRect)firstRectForRange:(id)a3
{
  id v4 = a3;
  id v5 = [(UIFieldEditor *)self _textInputController];
  [v5 firstRectForRange:v4];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (id)closestPositionToPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = [(UIFieldEditor *)self _textInputController];
  double v6 = objc_msgSend(v5, "closestPositionToPoint:", x, y);

  return v6;
}

- (id)closestPositionToPoint:(CGPoint)a3 withinRange:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  double v8 = [(UIFieldEditor *)self _textInputController];
  double v9 = objc_msgSend(v8, "closestPositionToPoint:withinRange:", v7, x, y);

  return v9;
}

- (id)characterRangeAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = [(UIFieldEditor *)self _textInputController];
  double v6 = objc_msgSend(v5, "characterRangeAtPoint:", x, y);

  return v6;
}

- (BOOL)isEditing
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
  char v3 = [WeakRetained isFirstResponder];

  return v3;
}

- (void)insertDictationResult:(id)a3 withCorrectionIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__UIFieldEditor_insertDictationResult_withCorrectionIdentifier___block_invoke;
  v10[3] = &unk_1E530B238;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(UIFieldEditor *)self _handleObscuredTextInputIfNecessaryWithEditingBlock:v10];
}

uint64_t __64__UIFieldEditor_insertDictationResult_withCorrectionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 insertDictationResult:*(void *)(a1 + 32) withCorrectionIdentifier:*(void *)(a1 + 40)];
}

- (id)insertDictationResultPlaceholder
{
  id v2 = [(UIFieldEditor *)self _textInputController];
  char v3 = [v2 insertDictationResultPlaceholder];

  return v3;
}

- (CGRect)frameForDictationResultPlaceholder:(id)a3
{
  id v4 = a3;
  id v5 = [(UIFieldEditor *)self _textInputController];
  [v5 frameForDictationResultPlaceholder:v4];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (void)removeDictationResultPlaceholder:(id)a3 willInsertResult:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(UIFieldEditor *)self _textInputController];
  [v7 removeDictationResultPlaceholder:v6 willInsertResult:v4];
}

- (id)insertTextPlaceholderWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = [(UIFieldEditor *)self _textInputController];
  id v6 = objc_msgSend(v5, "insertTextPlaceholderWithSize:", width, height);

  return v6;
}

- (void)removeTextPlaceholder:(id)a3
{
  id v4 = a3;
  id v5 = [(UIFieldEditor *)self _textInputController];
  [v5 removeTextPlaceholder:v4];
}

- (id)rangeWithTextAlternatives:(id *)a3 atPosition:(id)a4
{
  id v6 = a4;
  id v7 = [(UIFieldEditor *)self _textInputController];
  double v8 = [v7 rangeWithTextAlternatives:a3 atPosition:v6];

  return v8;
}

- (id)metadataDictionariesForDictationResults
{
  id v2 = [(UIFieldEditor *)self _textInputController];
  char v3 = [v2 metadataDictionariesForDictationResults];

  return v3;
}

- (void)beginSelectionChange
{
  *(_WORD *)&self->_feFlags |= 0x10u;
  id v2 = [(UIFieldEditor *)self _textInputController];
  [v2 beginSelectionChange];
}

- (void)endSelectionChange
{
  char v3 = [(UIFieldEditor *)self _textInputController];
  [v3 endSelectionChange];

  *(_WORD *)&self->_feFlags &= ~0x10u;
}

- (unint64_t)layoutManager:(id)a3 shouldGenerateGlyphs:(const unsigned __int16 *)a4 properties:(const int64_t *)a5 characterIndexes:(const unint64_t *)a6 font:(id)a7 forGlyphRange:(_NSRange)a8
{
  id v13 = a3;
  id v14 = a7;
  double v15 = [(UIFieldEditor *)self _textInputTraits];
  if ([v15 isSecureTextEntry])
  {
    if (([v15 displaySecureEditsUsingPlainText] & 1) != 0
      || (id WeakRetained = objc_loadWeakRetained((id *)&self->_textField),
          int v17 = [WeakRetained _shouldUnobscureTextWithContentCover],
          WeakRetained,
          v17))
    {
      id v30 = v14;
      id v18 = a4;
      NSUInteger v19 = a5;
      NSUInteger v20 = a6;
      unint64_t obscuredSecureLength = self->_obscuredSecureLength;
      id v22 = v13;
      double v23 = [v13 textStorage];
      unint64_t v24 = [v23 length] - self->_obscuredSecureLength;
LABEL_7:

      a6 = v20;
      a5 = v19;
      a4 = v18;
      id v14 = v30;
      id v13 = v22;
      goto LABEL_9;
    }
  }
  if ([(UIFieldEditor *)self _shouldObscureInput])
  {
    id v22 = v13;
    id v30 = v14;
    id v18 = a4;
    NSUInteger v19 = a5;
    NSUInteger v20 = a6;
    double v23 = [(UIFieldEditor *)self _textLayoutController];
    double v25 = [v23 unobscuredRange];
    unint64_t obscuredSecureLength = [v23 characterRangeForTextRange:v25];
    unint64_t v24 = v26;

    goto LABEL_7;
  }
  unint64_t v24 = 0;
  unint64_t obscuredSecureLength = 0x7FFFFFFFFFFFFFFFLL;
LABEL_9:
  if (obscuredSecureLength == 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v27 = 0;
  }
  else
  {
    int64_t v27 = objc_msgSend(v13, "_generateBulletGlyphs:properties:characterIndexes:font:forGlyphRange:unobscuredRange:", a4, a5, a6, v14, a8.location, a8.length, obscuredSecureLength, v24);
    if (v27 >= 1)
    {
      double v28 = [(UIFieldEditor *)self _textInputController];
      [v28 _selectionGeometryChanged];
    }
  }

  return v27;
}

- (int64_t)layoutManager:(id)a3 shouldUseAction:(int64_t)a4 forControlCharacterAtIndex:(unint64_t)a5
{
  id v8 = a3;
  double v9 = [(UIFieldEditor *)self _textLayoutController];
  double v10 = [v9 unobscuredRange];
  unint64_t v11 = [v9 characterRangeForTextRange:v10];
  unint64_t v13 = v12;

  if (a4 == 1)
  {
    if (a5 < v11 || a5 - v11 >= v13)
    {
      id v14 = [MEMORY[0x1E4F28B88] controlCharacterSet];
      double v15 = [v8 textStorage];
      double v16 = [v15 string];
      int v17 = objc_msgSend(v14, "characterIsMember:", objc_msgSend(v16, "characterAtIndex:", a5));

      if (v17) {
        a4 = 1;
      }
      else {
        a4 = 2;
      }
    }
    else
    {
      a4 = 1;
    }
  }

  return a4;
}

- (CGRect)layoutManager:(id)a3 boundingBoxForControlGlyphAtIndex:(unint64_t)a4 forTextContainer:(id)a5 proposedLineFragment:(CGRect)a6 glyphPosition:(CGPoint)a7 characterIndex:(unint64_t)a8
{
  id v10 = a3;
  unint64_t v11 = [(UIFieldEditor *)self _textLayoutController];
  unint64_t v12 = [v11 unobscuredRange];
  uint64_t v13 = [v11 characterRangeForTextRange:v12];
  uint64_t v15 = v14;

  objc_msgSend(v10, "_boundingBoxForBulletAtCharIndex:inUnobscuredRange:", a8, v13, v15);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  double v24 = v17;
  double v25 = v19;
  double v26 = v21;
  double v27 = v23;
  result.size.double height = v27;
  result.size.double width = v26;
  result.origin.double y = v25;
  result.origin.double x = v24;
  return result;
}

- (void)layoutManager:(id)a3 didCompleteLayoutForTextContainer:(id)a4 atEnd:(BOOL)a5
{
  if (a4) {
    [a3 _completeBulletRenderingForTextContainer:a4];
  }
}

- (CGRect)visibleRect
{
  id v2 = [(UIFieldEditor *)self _textCanvasView];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (UIEdgeInsets)textContainerInset
{
  [(UIFieldEditor *)self textContainerOriginForTextAlignment:0];
  double v3 = v2;
  double v5 = v4;
  double v6 = v3;
  double v7 = v5;
  result.double right = v3;
  result.double bottom = v7;
  result.double left = v6;
  result.double top = v5;
  return result;
}

- (void)setConstrainedFrameSize:(CGSize)a3
{
  self->_desiredContentdouble Width = ceil(a3.width);
  double v4 = [(UIFieldEditor *)self _textCanvasView];
  [v4 setNeedsLayout];

  [(UIScrollView *)self setNeedsLayout];
}

- (CGSize)minSize
{
  [(UIView *)self bounds];
  double v3 = v2;
  double v5 = v4;
  result.double height = v5;
  result.double width = v3;
  return result;
}

- (BOOL)isHorizontallyResizable
{
  return 1;
}

- (void)setNeedsDisplayInRect:(CGRect)a3 avoidAdditionalLayout:(BOOL)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
  objc_msgSend(WeakRetained, "setNeedsDisplayInRect:", x, y, width, height);
}

- (id)linkTextAttributes
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
  double v3 = [WeakRetained linkTextAttributes];

  return v3;
}

- (id)attributedSubstringForMarkedRange
{
  double v2 = [(UIFieldEditor *)self _textInputController];
  double v3 = [v2 attributedSubstringForMarkedRange];

  return v3;
}

- (void)setSecureTextEntry:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(UIFieldEditor *)self _textInputTraits];
  [v5 setSecureTextEntry:v3];

  BOOL v6 = [(UIFieldEditor *)self _shouldObscureInput];
  __int16 feFlags = (__int16)self->_feFlags;
  if (v6)
  {
    *(_WORD *)&self->___int16 feFlags = feFlags | 0x20;
    [(UIFieldEditor *)self _obscureAllText];
  }
  else
  {
    *(_WORD *)&self->___int16 feFlags = feFlags & 0xFFDF;
    [(UIFieldEditor *)self _unobscureAllText];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
  [WeakRetained setNeedsDisplay];

  [(UIScrollView *)self setNeedsLayout];
}

- (void)setDisplaySecureEditsUsingPlainText:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(UIFieldEditor *)self _textInputTraits];
  [v5 setDisplaySecureEditsUsingPlainText:v3];

  if (v3)
  {
    id v6 = [(UIFieldEditor *)self _textStorage];
    self->_unint64_t obscuredSecureLength = [v6 length];
  }
  else
  {
    *(_WORD *)&self->_feFlags &= ~0x20u;
  }
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  if ([(id)objc_opt_class() instancesRespondToSelector:a3])
  {
    double v5 = [(UIFieldEditor *)self _textInputTraits];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIFieldEditor;
    double v5 = [(UIFieldEditor *)&v7 forwardingTargetForSelector:a3];
  }
  return v5;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  double v4 = [(id)objc_opt_class() instanceMethodSignatureForSelector:a3];
  if (!v4)
  {
    double v4 = [(id)objc_opt_class() instanceMethodSignatureForSelector:a3];
  }
  return v4;
}

- (BOOL)_shouldIgnoreAutofillSave
{
  return 1;
}

- (UIEdgeInsets)padding
{
  double top = self->_padding.top;
  double left = self->_padding.left;
  double bottom = self->_padding.bottom;
  double right = self->_padding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)allowsAttachments
{
  return self->_allowsAttachments;
}

- (void)setAllowsAttachments:(BOOL)a3
{
  self->_allowsAttachments = a3;
}

- (id)_scrollAnimationEndedAction
{
  return self->_scrollAnimationEndedAction;
}

- (void)_setScrollAnimationEndedAction:(id)a3
{
}

- (CGPoint)autoscrollContentOffset
{
  double x = self->_autoscrollContentOffset.x;
  double y = self->_autoscrollContentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setAutoscrollContentOffset:(CGPoint)a3
{
  self->_autoscrollContentOffset = a3;
}

- (BOOL)_shouldObscureNextInput
{
  return self->__shouldObscureNextInput;
}

- (void)set_shouldObscureNextInput:(BOOL)a3
{
  self->__shouldObscureNextInput = a3;
}

@end