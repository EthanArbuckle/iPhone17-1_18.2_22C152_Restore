@interface WFSlotTemplateView
+ (double)heightForWidth:(double)a3 withContents:(id)a4 horizontalPadding:(double)a5 font:(id)a6 unpopulatedFont:(id)a7 alignment:(int64_t)a8;
+ (id)paragraphStyleWithAlignment:(int64_t)a3;
- (BOOL)disclosureArrowIsOpen;
- (BOOL)extendSlotBackgroundOffEdges;
- (BOOL)isAccessibilityElement;
- (BOOL)menuIsPresented;
- (BOOL)outputButtonIsOpen;
- (BOOL)shouldPresentMenuAboveView;
- (BOOL)shouldRecognizeTapOnTextAttachment:(id)a3 inSlotWithIdentifier:(id)a4;
- (BOOL)showsDisclosureArrow;
- (BOOL)showsOutputButton;
- (BOOL)startEditingHighlightedSlot;
- (BOOL)textAttachmentInteraction:(id)a3 shouldRecognizeTapOnTextAttachment:(id)a4 inCharacterRange:(_NSRange)a5;
- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (BOOL)typingAllowsMultipleLines;
- (CGPoint)menuAttachmentPointForConfiguration:(id)a3;
- (CGRect)sourceRectForSlot:(id)a3;
- (CGRect)sourceRectForSlotWithIdentifier:(id)a3;
- (NSArray)accessibilityElements;
- (NSArray)exclusionRects;
- (NSDate)touchDownTimestamp;
- (NSMutableDictionary)cachedHeightsByWidths;
- (NSParagraphStyle)paragraphStyle;
- (NSTextContainer)textContainer;
- (NSTextContainer)typingTextContainer;
- (UIButton)disclosureButton;
- (UIButton)outputButton;
- (UIColor)disabledSlotBackgroundColor;
- (UIColor)disabledSlotTitleColor;
- (UIColor)textColor;
- (UIFont)font;
- (UIFont)unpopulatedFont;
- (WFSlotIdentifier)selectedSlotIdentifier;
- (WFSlotIdentifier)typingSlotIdentifier;
- (WFSlotTemplateLayoutManager)layoutManager;
- (WFSlotTemplateLayoutManager)typingLayoutManager;
- (WFSlotTemplateTextStorage)textStorage;
- (WFSlotTemplateTextStorage)typingTextStorage;
- (WFSlotTemplateTypingTextView)typingTextView;
- (WFSlotTemplateView)initWithFrame:(CGRect)a3;
- (WFSlotTemplateViewDelegate)delegate;
- (WFTextAttachmentInteraction)typingAttachmentInteraction;
- (double)heightForWidth:(double)a3;
- (double)horizontalPadding;
- (id)accessibilityElementAtIndex:(int64_t)a3;
- (id)attachmentAtPoint:(CGPoint)a3 characterRange:(_NSRange *)a4;
- (id)configureMenuAtLocation:(CGPoint)a3 wasTriggeredByTap:(BOOL)a4;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)highlightedSlot;
- (id)highlightedSlotIdentifier;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)selectedSlot;
- (id)slotAfterSlotIdentifier:(id)a3;
- (id)slotAtPoint:(CGPoint)a3;
- (id)slotBeforeSlotIdentifier:(id)a3;
- (id)slotIdentifierBeforeSlot:(id)a3 inContents:(id)a4;
- (id)slotIdentifierForAttachmentInteraction:(id)a3 characterRange:(_NSRange)a4;
- (id)slotWithIdentifier:(id)a3;
- (id)typingParagraphStyleForParagraphStyle:(id)a3;
- (int64_t)accessibilityElementCount;
- (int64_t)textAlignment;
- (unint64_t)lastLayoutManagerLineCount;
- (void)_deselectSlotAndNotifyDelegate:(BOOL)a3 completionHandler:(id)a4;
- (void)_selectSlot:(id)a3 notifyDelegate:(BOOL)a4;
- (void)accessibilityShiftFocusBackToView;
- (void)beginTypingInSlotWithIdentifier:(id)a3;
- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)deselectSlot;
- (void)didTapDisclosureArrow;
- (void)didTapOutputButton;
- (void)didTapTextAttachment:(id)a3 inSlotWithIdentifier:(id)a4;
- (void)drawRect:(CGRect)a3;
- (void)endTyping;
- (void)handleTouch:(id)a3 withPhase:(unint64_t)a4;
- (void)handleTouchWithPhase:(unint64_t)a3 atLocation:(CGPoint)a4;
- (void)highlightSlotWithIdentifier:(id)a3;
- (void)invalidateDisplay;
- (void)invalidateIntrinsicContentSize;
- (void)layoutSubviews;
- (void)menuWillPresent;
- (void)performFadeTransition:(id)a3;
- (void)positionTypingAboveSlot:(id)a3;
- (void)presentedMenuDidDismiss;
- (void)resetTextView;
- (void)selectSlotWithIdentifier:(id)a3;
- (void)setAccessibilityElements:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setContents:(id)a3 animated:(BOOL)a4;
- (void)setDelegate:(id)a3;
- (void)setDisabledSlotTitleColor:(id)a3 backgroundColor:(id)a4 animated:(BOOL)a5;
- (void)setDisclosureArrowIsOpen:(BOOL)a3;
- (void)setDisclosureButton:(id)a3;
- (void)setExclusionRects:(id)a3;
- (void)setExtendSlotBackgroundOffEdges:(BOOL)a3;
- (void)setFont:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHorizontalPadding:(double)a3;
- (void)setLastLayoutManagerLineCount:(unint64_t)a3;
- (void)setLayoutManager:(id)a3;
- (void)setMenuIsPresented:(BOOL)a3;
- (void)setOutputButton:(id)a3;
- (void)setOutputButtonIsOpen:(BOOL)a3;
- (void)setParagraphStyle:(id)a3;
- (void)setShowsDisclosureArrow:(BOOL)a3;
- (void)setShowsOutputButton:(BOOL)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)setTextColor:(id)a3;
- (void)setTextContainer:(id)a3;
- (void)setTextStorage:(id)a3;
- (void)setTouchDownTimestamp:(id)a3;
- (void)setTypingAllowsMultipleLines:(BOOL)a3;
- (void)setTypingAttachmentInteraction:(id)a3;
- (void)setTypingLayoutManager:(id)a3;
- (void)setTypingTextContainer:(id)a3;
- (void)setTypingTextStorage:(id)a3;
- (void)setTypingTextView:(id)a3;
- (void)setUnpopulatedFont:(id)a3;
- (void)setupTextEntry;
- (void)slotTemplateStorageDidInvalidateDisplay:(id)a3;
- (void)slotTemplateTypingTextViewDidCopy:(id)a3 withOriginalBlock:(id)a4;
- (void)slotTemplateTypingTextViewDidCut:(id)a3 withOriginalBlock:(id)a4;
- (void)slotTemplateTypingTextViewDidDelete:(id)a3;
- (void)slotTemplateTypingTextViewDidPaste:(id)a3 withOriginalBlock:(id)a4;
- (void)slotTemplateTypingTextViewDidTabBackwards:(id)a3 withOriginalBlock:(id)a4;
- (void)slotTemplateTypingTextViewDidTabForwards:(id)a3 withOriginalBlock:(id)a4;
- (void)textAttachmentInteraction:(id)a3 didTapTextAttachment:(id)a4 inCharacterRange:(_NSRange)a5;
- (void)tintColorDidChange;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)typingTextViewDidChange;
- (void)typingTextViewDidEndEditing;
- (void)unhighlightSlot;
- (void)updateAccessibilityElements;
- (void)updateDisclosureButtonPosition;
- (void)updateDisclosureButtonTransformAnimated:(BOOL)a3;
- (void)updateExclusionRectsWithBounds:(CGRect)a3;
- (void)updateOutputButtonPosition;
- (void)updateOutputButtonTransformAnimated:(BOOL)a3;
- (void)updateTintColorInTextStorage;
- (void)updateTypingFont;
- (void)updateTypingParagraphStyle;
- (void)updateTypingTextContainerSize;
- (void)updateTypingTextContents:(id)a3;
- (void)updateTypingUnpopulatedFont;
- (void)updateVariableAttachmentAppearanceInContents;
@end

@implementation WFSlotTemplateView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchDownTimestamp, 0);
  objc_storeStrong((id *)&self->_cachedHeightsByWidths, 0);
  objc_storeStrong((id *)&self->_accessibilityElements, 0);
  objc_storeStrong((id *)&self->_typingTextStorage, 0);
  objc_storeStrong((id *)&self->_typingLayoutManager, 0);
  objc_storeStrong((id *)&self->_typingTextContainer, 0);
  objc_storeStrong((id *)&self->_typingTextView, 0);
  objc_destroyWeak((id *)&self->_outputButton);
  objc_destroyWeak((id *)&self->_disclosureButton);
  objc_storeStrong((id *)&self->_typingAttachmentInteraction, 0);
  objc_storeStrong((id *)&self->_layoutManager, 0);
  objc_storeStrong((id *)&self->_textStorage, 0);
  objc_storeStrong((id *)&self->_textContainer, 0);
  objc_storeStrong((id *)&self->_typingSlotIdentifier, 0);
  objc_storeStrong((id *)&self->_exclusionRects, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setMenuIsPresented:(BOOL)a3
{
  self->_menuIsPresented = a3;
}

- (BOOL)menuIsPresented
{
  return self->_menuIsPresented;
}

- (void)setTouchDownTimestamp:(id)a3
{
}

- (NSDate)touchDownTimestamp
{
  return self->_touchDownTimestamp;
}

- (NSMutableDictionary)cachedHeightsByWidths
{
  return self->_cachedHeightsByWidths;
}

- (void)setAccessibilityElements:(id)a3
{
}

- (void)setLastLayoutManagerLineCount:(unint64_t)a3
{
  self->_lastLayoutManagerLineCount = a3;
}

- (unint64_t)lastLayoutManagerLineCount
{
  return self->_lastLayoutManagerLineCount;
}

- (void)setTypingAllowsMultipleLines:(BOOL)a3
{
  self->_typingAllowsMultipleLines = a3;
}

- (BOOL)typingAllowsMultipleLines
{
  return self->_typingAllowsMultipleLines;
}

- (void)setTypingTextStorage:(id)a3
{
}

- (WFSlotTemplateTextStorage)typingTextStorage
{
  return self->_typingTextStorage;
}

- (void)setTypingLayoutManager:(id)a3
{
}

- (WFSlotTemplateLayoutManager)typingLayoutManager
{
  return self->_typingLayoutManager;
}

- (void)setTypingTextContainer:(id)a3
{
}

- (NSTextContainer)typingTextContainer
{
  return self->_typingTextContainer;
}

- (void)setTypingTextView:(id)a3
{
}

- (WFSlotTemplateTypingTextView)typingTextView
{
  return self->_typingTextView;
}

- (void)setOutputButton:(id)a3
{
}

- (UIButton)outputButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_outputButton);
  return (UIButton *)WeakRetained;
}

- (void)setDisclosureButton:(id)a3
{
}

- (UIButton)disclosureButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_disclosureButton);
  return (UIButton *)WeakRetained;
}

- (void)setTypingAttachmentInteraction:(id)a3
{
}

- (WFTextAttachmentInteraction)typingAttachmentInteraction
{
  return self->_typingAttachmentInteraction;
}

- (void)setLayoutManager:(id)a3
{
}

- (WFSlotTemplateLayoutManager)layoutManager
{
  return self->_layoutManager;
}

- (void)setTextStorage:(id)a3
{
}

- (WFSlotTemplateTextStorage)textStorage
{
  return self->_textStorage;
}

- (void)setTextContainer:(id)a3
{
}

- (NSTextContainer)textContainer
{
  return self->_textContainer;
}

- (WFSlotIdentifier)typingSlotIdentifier
{
  return self->_typingSlotIdentifier;
}

- (BOOL)outputButtonIsOpen
{
  return self->_outputButtonIsOpen;
}

- (BOOL)showsOutputButton
{
  return self->_showsOutputButton;
}

- (BOOL)disclosureArrowIsOpen
{
  return self->_disclosureArrowIsOpen;
}

- (BOOL)showsDisclosureArrow
{
  return self->_showsDisclosureArrow;
}

- (NSArray)exclusionRects
{
  return self->_exclusionRects;
}

- (double)horizontalPadding
{
  return self->_horizontalPadding;
}

- (void)setDelegate:(id)a3
{
}

- (WFSlotTemplateViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFSlotTemplateViewDelegate *)WeakRetained;
}

- (BOOL)startEditingHighlightedSlot
{
  v3 = [(WFSlotTemplateView *)self highlightedSlot];
  v4 = v3;
  if (v3)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __49__WFSlotTemplateView_startEditingHighlightedSlot__block_invoke;
    v6[3] = &unk_264BFD500;
    v6[4] = self;
    id v7 = v3;
    [(WFSlotTemplateView *)self _deselectSlotAndNotifyDelegate:1 completionHandler:v6];
  }
  return v4 != 0;
}

uint64_t __49__WFSlotTemplateView_startEditingHighlightedSlot__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _selectSlot:*(void *)(a1 + 40) notifyDelegate:1];
}

- (void)accessibilityShiftFocusBackToView
{
}

- (void)updateAccessibilityElements
{
  [(WFSlotTemplateView *)self frame];
  if (CGRectEqualToRect(v19, *MEMORY[0x263F001A8]))
  {
    [(WFSlotTemplateView *)self setAccessibilityElements:0];
  }
  else
  {
    v3 = [(WFSlotTemplateView *)self textStorage];
    v4 = [(WFSlotTemplateView *)self layoutManager];
    v5 = [v3 selectedSlots];
    v6 = objc_opt_new();
    uint64_t v7 = [v3 length];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __49__WFSlotTemplateView_updateAccessibilityElements__block_invoke;
    v12[3] = &unk_264BFD640;
    id v13 = v4;
    v14 = self;
    id v15 = v6;
    id v16 = v3;
    id v17 = v5;
    id v8 = v5;
    id v9 = v3;
    id v10 = v6;
    id v11 = v4;
    objc_msgSend(v9, "enumerateContentInRange:usingBlock:", 0, v7, v12);
    [(WFSlotTemplateView *)self setAccessibilityElements:v10];
  }
}

void __49__WFSlotTemplateView_updateAccessibilityElements__block_invoke(id *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  uint64_t v42 = 0;
  v43 = (double *)&v42;
  v45 = &unk_234BA41F7;
  uint64_t v44 = 0x4010000000;
  long long v8 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
  long long v46 = *MEMORY[0x263F001A8];
  long long v47 = v8;
  uint64_t v9 = objc_msgSend(a1[4], "glyphRangeForCharacterRange:actualCharacterRange:", a3, a4, 0);
  id v10 = a1[4];
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __49__WFSlotTemplateView_updateAccessibilityElements__block_invoke_2;
  v41[3] = &unk_264BFD5A0;
  v41[4] = &v42;
  objc_msgSend(v10, "enumerateInsetEnclosingRectsForGlyphRange:usingBlock:", v9, v11, v41);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v7;
    id v13 = [a1[5] typingSlotIdentifier];
    v14 = [v12 identifier];
    int v15 = [v13 isEqual:v14];

    if (v15)
    {
      id v16 = a1[6];
      id v17 = [a1[5] typingTextView];
      [v16 addObject:v17];
LABEL_19:

      goto LABEL_20;
    }
    v23 = objc_opt_new();
    v24 = objc_msgSend(a1[7], "attributedSubstringFromRange:", a3, a4);
    uint64_t v25 = [v24 length];
    uint64_t v26 = *MEMORY[0x263F814A0];
    uint64_t v34 = MEMORY[0x263EF8330];
    uint64_t v35 = 3221225472;
    v36 = __49__WFSlotTemplateView_updateAccessibilityElements__block_invoke_3;
    v37 = &unk_264BFD618;
    id v38 = a1[5];
    id v27 = v23;
    id v39 = v27;
    id v28 = v24;
    id v40 = v28;
    objc_msgSend(v28, "enumerateAttribute:inRange:options:usingBlock:", v26, 0, v25, 0, &v34);
    if (objc_msgSend(a1[5], "isEnabled", v34, v35, v36, v37, v38)
      && [v12 isEnabled])
    {
      int v20 = [a1[8] containsObject:v12];
      int v19 = 0;
    }
    else
    {
      int v20 = 0;
      int v19 = 1;
    }
    uint64_t v22 = *MEMORY[0x263F83260];
    v29 = v40;
    id v30 = v27;

    id v12 = v30;
LABEL_14:
    id v17 = (void *)[objc_alloc(MEMORY[0x263F823B8]) initWithAccessibilityContainer:a1[5]];
    [v17 setIsAccessibilityElement:1];
    objc_msgSend(v17, "setAccessibilityFrameInContainerSpace:", v43[4], v43[5], v43[6], v43[7]);
    [v17 setAccessibilityLabel:v12];
    uint64_t v31 = *MEMORY[0x263F832A8];
    if (!v20) {
      uint64_t v31 = 0;
    }
    uint64_t v32 = v31 | v22;
    uint64_t v33 = *MEMORY[0x263F83290];
    if (!v19) {
      uint64_t v33 = 0;
    }
    [v17 setAccessibilityTraits:v32 | v33];
    [a1[6] addObject:v17];
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v19 = 0;
    int v20 = 0;
    id v12 = 0;
    v21 = (uint64_t *)MEMORY[0x263F83288];
    goto LABEL_8;
  }
  v18 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  id v12 = [v7 stringByTrimmingCharactersInSet:v18];

  if ([v12 length])
  {
    int v19 = 0;
    int v20 = 0;
    v21 = (uint64_t *)MEMORY[0x263F832B8];
LABEL_8:
    uint64_t v22 = *v21;
    goto LABEL_14;
  }
LABEL_20:

  _Block_object_dispose(&v42, 8);
}

uint64_t __49__WFSlotTemplateView_updateAccessibilityElements__block_invoke_2(uint64_t result, unsigned char *a2, double a3, double a4, double a5, double a6)
{
  v6 = *(double **)(*(void *)(result + 32) + 8);
  v6[4] = a3;
  void v6[5] = a4;
  v6[6] = a5;
  v6[7] = a6;
  *a2 = 1;
  return result;
}

void __49__WFSlotTemplateView_updateAccessibilityElements__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  id v17 = v7;
  if (v7)
  {
    long long v8 = [v7 accessibilityLabel];
    uint64_t v9 = v17;
    if (!v8) {
      goto LABEL_9;
    }
    id v10 = [*(id *)(a1 + 32) textStorage];
    id v11 = [v10 disclosureAttachment];
    if (v11 == v17)
    {
    }
    else
    {
      id v12 = [*(id *)(a1 + 32) textStorage];
      id v13 = [v12 outputButtonAttachment];

      uint64_t v9 = v17;
      if (v13 == v17) {
        goto LABEL_9;
      }
      v14 = *(void **)(a1 + 40);
      long long v8 = [v17 accessibilityLabel];
      [v14 appendString:v8];
    }
  }
  else
  {
    int v15 = *(void **)(a1 + 40);
    long long v8 = objc_msgSend(*(id *)(a1 + 48), "attributedSubstringFromRange:", a3, a4);
    id v16 = [v8 string];
    [v15 appendString:v16];
  }
  uint64_t v9 = v17;
LABEL_9:
}

- (id)accessibilityElementAtIndex:(int64_t)a3
{
  v4 = [(WFSlotTemplateView *)self accessibilityElements];
  v5 = [v4 objectAtIndexedSubscript:a3];

  return v5;
}

- (int64_t)accessibilityElementCount
{
  v2 = [(WFSlotTemplateView *)self accessibilityElements];
  int64_t v3 = [v2 count];

  return v3;
}

- (NSArray)accessibilityElements
{
  accessibilityElements = self->_accessibilityElements;
  if (!accessibilityElements)
  {
    [(WFSlotTemplateView *)self updateAccessibilityElements];
    accessibilityElements = self->_accessibilityElements;
  }
  return accessibilityElements;
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (void)typingTextViewDidEndEditing
{
  id v8 = [(WFSlotTemplateView *)self typingTextView];
  int64_t v3 = [(WFSlotTemplateView *)self typingSlotIdentifier];
  typingSlotIdentifier = self->_typingSlotIdentifier;
  self->_typingSlotIdentifier = 0;

  [v8 setHidden:1];
  [(WFSlotTemplateView *)self resetTextView];
  v5 = [(WFSlotTemplateView *)self slotWithIdentifier:v3];
  if (v5)
  {
    v6 = [(WFSlotTemplateView *)self textStorage];
    [v6 didEndTypingInSlot:v5];
  }
  [(WFSlotTemplateView *)self updateAccessibilityElements];
  [(WFSlotTemplateView *)self accessibilityShiftFocusBackToView];
  id v7 = [(WFSlotTemplateView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v7 slotTemplateView:self didEndTypingInSlotWithIdentifier:v3];
  }
}

- (void)typingTextViewDidChange
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  int64_t v3 = [(WFSlotTemplateView *)self typingTextView];
  v4 = [v3 attributedText];
  v5 = [(WFSlotTemplateView *)self typingSlotIdentifier];
  if (v5)
  {
    v6 = [(WFSlotTemplateView *)self slotWithIdentifier:v5];
    id v7 = (void *)[v6 copy];
    [v7 setContentAttributedString:v4];
    id v8 = [(WFSlotTemplateView *)self textStorage];
    uint64_t v9 = [v8 contents];
    id v10 = (void *)[v9 mutableCopy];

    objc_msgSend(v10, "replaceObjectAtIndex:withObject:", objc_msgSend(v10, "indexOfObject:", v6), v7);
    [(WFSlotTemplateView *)self setContents:v10 animated:0];
    id v11 = [(WFSlotTemplateView *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v11 slotTemplateView:self didChangeText:v4 forSlotWithIdentifier:v5];
    }
    id v12 = [(WFSlotTemplateView *)self layoutManager];
    uint64_t v13 = [v12 numberOfLaidLines];

    if (v13 != [(WFSlotTemplateView *)self lastLayoutManagerLineCount])
    {
      [(WFSlotTemplateView *)self setLastLayoutManagerLineCount:v13];
      if (objc_opt_respondsToSelector()) {
        [v11 slotTemplateViewDidInvalidateSize:self];
      }
    }
  }
  else
  {
    v14 = getWFGeneralLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      int v15 = 136315138;
      id v16 = "-[WFSlotTemplateView typingTextViewDidChange]";
      _os_log_impl(&dword_23490C000, v14, OS_LOG_TYPE_FAULT, "%s Received text view change notification while there is no slot with an active typing session.", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = a5;
  id v11 = [MEMORY[0x263F08708] newlineCharacterSet];
  uint64_t v12 = [v10 rangeOfCharacterFromSet:v11];

  if (v12 == 0x7FFFFFFFFFFFFFFFLL || [(WFSlotTemplateView *)self typingAllowsMultipleLines])
  {
    uint64_t v13 = [(WFSlotTemplateView *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      v14 = [v9 attributedText];
      int v15 = (void *)[v14 mutableCopy];
      id v16 = v15;
      if (v15) {
        id v17 = v15;
      }
      else {
        id v17 = (id)objc_opt_new();
      }
      int v19 = v17;

      objc_msgSend(v19, "replaceCharactersInRange:withString:", location, length, v10);
      int v20 = [(WFSlotTemplateView *)self typingSlotIdentifier];
      char v18 = [v13 slotTemplateView:self shouldChangeText:v19 forSlotWithIdentifier:v20];
    }
    else
    {
      char v18 = 1;
    }
  }
  else
  {
    [v9 resignFirstResponder];
    char v18 = 0;
  }

  return v18;
}

- (void)resetTextView
{
  id v2 = [(WFSlotTemplateView *)self typingTextView];
  [v2 setClearsZeroWhenTyping:0];
  [v2 setAttributedText:0];
  [v2 setInputView:0];
  [v2 setInputAccessoryView:0];
  [v2 setAutocapitalizationType:2];
  [v2 setAutocorrectionType:0];
  [v2 setSpellCheckingType:0];
  [v2 setSmartQuotesType:0];
  [v2 setSmartDashesType:0];
  [v2 setSmartInsertDeleteType:0];
  [v2 setKeyboardType:0];
  [v2 setKeyboardAppearance:0];
  [v2 setReturnKeyType:0];
  [v2 setEnablesReturnKeyAutomatically:0];
  [v2 setSecureTextEntry:0];
  [v2 setTextContentType:0];
  [v2 setPasswordRules:0];
}

- (void)endTyping
{
  int64_t v3 = [(WFSlotTemplateView *)self typingTextView];
  int v4 = [v3 isFirstResponder];

  if (v4)
  {
    id v5 = [(WFSlotTemplateView *)self typingTextView];
    [v5 resignFirstResponder];
  }
  else
  {
    [(WFSlotTemplateView *)self typingTextViewDidEndEditing];
  }
}

- (void)positionTypingAboveSlot:(id)a3
{
  id v4 = a3;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v19[3] = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  char v18 = 0;
  id v5 = objc_opt_new();
  v6 = [(WFSlotTemplateView *)self layoutManager];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __46__WFSlotTemplateView_positionTypingAboveSlot___block_invoke;
  v13[3] = &unk_264BFD5C8;
  int v15 = v17;
  id v16 = v19;
  v13[4] = self;
  id v7 = v5;
  id v14 = v7;
  [v6 enumerateEnclosingRectsForSlot:v4 includeInsideSpacing:0 insetForBackground:0 usingBlock:v13];

  id v8 = (void *)MEMORY[0x263F82E00];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __46__WFSlotTemplateView_positionTypingAboveSlot___block_invoke_2;
  v10[3] = &unk_264BFD5F0;
  v10[4] = self;
  id v9 = v7;
  id v11 = v9;
  uint64_t v12 = v19;
  [v8 performWithoutAnimation:v10];

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v19, 8);
}

void __46__WFSlotTemplateView_positionTypingAboveSlot___block_invoke(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    *(CGFloat *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = CGRectGetMinY(*(CGRect *)&a2);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  v21.origin.x = a2;
  v21.origin.y = a3;
  v21.size.width = a4;
  v21.size.height = a5;
  double MinY = CGRectGetMinY(v21);
  v22.origin.x = a2;
  v22.origin.y = a3;
  v22.size.width = a4;
  v22.size.height = a5;
  double v11 = (MinY + CGRectGetMaxY(v22)) * 0.5 - *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  CGFloat v12 = a2 + a4;
  uint64_t v13 = [*(id *)(a1 + 32) typingTextContainer];
  [v13 size];
  double v15 = v14 - v12;

  id v16 = *(void **)(a1 + 40);
  id v17 = objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithRect:", 0.0, v11, a2, 5.0);
  [v16 addObject:v17];

  char v18 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithRect:", v12, v11, v15, 5.0);
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  [v18 addObject:v19];
}

void __46__WFSlotTemplateView_positionTypingAboveSlot___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  int64_t v3 = [*(id *)(a1 + 32) typingTextContainer];
  [v3 setExclusionPaths:v2];

  double v4 = *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  id v5 = [*(id *)(a1 + 32) typingTextView];
  objc_msgSend(v5, "setTextContainerInset:", v4, 0.0, 0.0, 0.0);
}

- (void)beginTypingInSlotWithIdentifier:(id)a3
{
  id v5 = a3;
  v6 = [(WFSlotTemplateView *)self slotWithIdentifier:v5];
  if (!v6)
  {
    id v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"WFSlotTemplateView.m" lineNumber:1594 description:@"Must be slot with that identifier"];
  }
  id v7 = [(WFSlotTemplateView *)self typingTextView];

  if (!v7) {
    [(WFSlotTemplateView *)self setupTextEntry];
  }
  id v8 = (WFSlotIdentifier *)[v5 copy];
  typingSlotIdentifier = self->_typingSlotIdentifier;
  self->_typingSlotIdentifier = v8;

  id v10 = [(WFSlotTemplateView *)self typingTextView];
  double v11 = [(WFSlotTemplateView *)self typingTextStorage];
  [(WFSlotTemplateView *)self resetTextView];
  [(WFSlotTemplateView *)self updateTypingTextContents:v5];
  [(WFSlotTemplateView *)self positionTypingAboveSlot:v6];
  [v10 setReturnKeyType:9];
  [(WFSlotTemplateView *)self setTypingAllowsMultipleLines:0];
  CGFloat v12 = [(WFSlotTemplateView *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    char v17 = 0;
    [v12 slotTemplateView:self willBeginTypingInSlotWithIdentifier:v5 usingTextEntry:v10 allowMultipleLines:&v17];
    if (v17)
    {
      [v10 setReturnKeyType:0];
      [(WFSlotTemplateView *)self setTypingAllowsMultipleLines:1];
    }
  }
  uint64_t v13 = [(WFSlotTemplateView *)self textStorage];
  [v13 didBeginTypingInSlot:v6];

  [v10 setHidden:0];
  [v10 becomeFirstResponder];
  if ([v6 userInputInsertionIndex] == -1) {
    uint64_t v14 = [v11 length];
  }
  else {
    uint64_t v14 = [v6 userInputInsertionIndex];
  }
  objc_msgSend(v10, "setSelectedRange:", v14, 0);
  double v15 = [(WFSlotTemplateView *)self layoutManager];
  -[WFSlotTemplateView setLastLayoutManagerLineCount:](self, "setLastLayoutManagerLineCount:", [v15 numberOfLaidLines]);
}

- (void)updateTypingTextContents:(id)a3
{
  v27[3] = *MEMORY[0x263EF8340];
  id v5 = [(WFSlotTemplateView *)self slotWithIdentifier:a3];
  if (!v5)
  {
    uint64_t v25 = [MEMORY[0x263F08690] currentHandler];
    [v25 handleFailureInMethod:a2 object:self file:@"WFSlotTemplateView.m" lineNumber:1568 description:@"Must be slot with that identifier"];
  }
  v6 = [(WFSlotTemplateView *)self typingTextView];
  id v7 = [(WFSlotTemplateView *)self typingTextStorage];
  id v8 = [v7 string];
  id v9 = [v5 contentAttributedString];
  id v10 = [v9 string];
  char v11 = [v8 isEqualToString:v10];

  if ((v11 & 1) == 0)
  {
    CGFloat v12 = [(WFSlotTemplateView *)self textColor];
    [v7 setTextColor:v12];

    v26[0] = *MEMORY[0x263F814F0];
    uint64_t v13 = [(WFSlotTemplateView *)self font];
    v27[0] = v13;
    v26[1] = *MEMORY[0x263F81500];
    uint64_t v14 = [v7 textColor];
    v27[1] = v14;
    v26[2] = *MEMORY[0x263F81540];
    double v15 = [(WFSlotTemplateView *)self paragraphStyle];
    id v16 = [(WFSlotTemplateView *)self typingParagraphStyleForParagraphStyle:v15];
    v27[2] = v16;
    char v17 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:3];
    [v6 setTypingAttributes:v17];

    char v18 = [(WFSlotTemplateView *)self font];
    [v6 setEmojiOverrideFont:v18];

    id v19 = [v5 contentAttributedString];
    int v20 = (void *)[v19 mutableCopy];
    CGRect v21 = v20;
    if (v20) {
      id v22 = v20;
    }
    else {
      id v22 = (id)objc_opt_new();
    }
    v23 = v22;

    v24 = [v6 typingAttributes];
    objc_msgSend(v23, "addAttributes:range:", v24, 0, objc_msgSend(v23, "length"));

    [v7 setAttributedString:v23];
  }
}

- (double)heightForWidth:(double)a3
{
  id v5 = [(WFSlotTemplateView *)self cachedHeightsByWidths];
  v6 = [NSNumber numberWithDouble:a3];
  id v7 = [v5 objectForKeyedSubscript:v6];

  if (v7)
  {
    [v7 doubleValue];
    double v9 = v8;
  }
  else
  {
    id v10 = getWFEditorLogObject();
    os_signpost_id_t v11 = os_signpost_id_generate(v10);

    CGFloat v12 = getWFEditorLogObject();
    uint64_t v13 = v12;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_23490C000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "SlotTemplateCalculateSize", "", buf, 2u);
    }

    uint64_t v14 = [(WFSlotTemplateView *)self textContainer];
    double v15 = [(WFSlotTemplateView *)self layoutManager];
    [(WFSlotTemplateView *)self bounds];
    -[WFSlotTemplateView updateExclusionRectsWithBounds:](self, "updateExclusionRectsWithBounds:");
    objc_msgSend(v15, "wf_calculateIntrinsicHeightForWidth:textContainer:", v14, a3);
    double v9 = v16;
    [(WFSlotTemplateView *)self bounds];
    -[WFSlotTemplateView updateExclusionRectsWithBounds:](self, "updateExclusionRectsWithBounds:");
    char v17 = [NSNumber numberWithDouble:v9];
    char v18 = [(WFSlotTemplateView *)self cachedHeightsByWidths];
    id v19 = [NSNumber numberWithDouble:a3];
    [v18 setObject:v17 forKeyedSubscript:v19];

    int v20 = getWFEditorLogObject();
    CGRect v21 = v20;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      *(_WORD *)v23 = 0;
      _os_signpost_emit_with_name_impl(&dword_23490C000, v21, OS_SIGNPOST_INTERVAL_END, v11, "SlotTemplateCalculateSize", "", v23, 2u);
    }
  }
  return v9;
}

- (void)textAttachmentInteraction:(id)a3 didTapTextAttachment:(id)a4 inCharacterRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v10 = a4;
  double v9 = -[WFSlotTemplateView slotIdentifierForAttachmentInteraction:characterRange:](self, "slotIdentifierForAttachmentInteraction:characterRange:", a3, location, length);
  if (v9) {
    [(WFSlotTemplateView *)self didTapTextAttachment:v10 inSlotWithIdentifier:v9];
  }
}

- (BOOL)textAttachmentInteraction:(id)a3 shouldRecognizeTapOnTextAttachment:(id)a4 inCharacterRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v9 = a4;
  id v10 = -[WFSlotTemplateView slotIdentifierForAttachmentInteraction:characterRange:](self, "slotIdentifierForAttachmentInteraction:characterRange:", a3, location, length);
  if (v10) {
    BOOL v11 = [(WFSlotTemplateView *)self shouldRecognizeTapOnTextAttachment:v9 inSlotWithIdentifier:v10];
  }
  else {
    BOOL v11 = 0;
  }

  return v11;
}

- (id)slotIdentifierForAttachmentInteraction:(id)a3 characterRange:(_NSRange)a4
{
  id v5 = a3;
  id v6 = [(WFSlotTemplateView *)self typingAttachmentInteraction];

  if (v6 == v5)
  {
    id v7 = [(WFSlotTemplateView *)self typingSlotIdentifier];
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (void)didTapTextAttachment:(id)a3 inSlotWithIdentifier:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(WFSlotTemplateView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v7 slotTemplateView:self didTapTextAttachment:v8 inSlotWithIdentifier:v6];
  }
}

- (BOOL)shouldRecognizeTapOnTextAttachment:(id)a3 inSlotWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WFSlotTemplateView *)self slotWithIdentifier:v7];
  if (-[WFSlotTemplateView isEnabled](self, "isEnabled") && [v8 isEnabled])
  {
    id v9 = [(WFSlotTemplateView *)self delegate];
    if (objc_opt_respondsToSelector()) {
      char v10 = [v9 slotTemplateView:self shouldTapTextAttachment:v6 inSlotWithIdentifier:v7];
    }
    else {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (void)slotTemplateTypingTextViewDidTabBackwards:(id)a3 withOriginalBlock:(id)a4
{
  id v5 = (void (**)(void))a4;
  id v6 = [(WFSlotTemplateView *)self typingSlotIdentifier];
  if (v6 && ![(WFSlotTemplateView *)self typingAllowsMultipleLines])
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __82__WFSlotTemplateView_slotTemplateTypingTextViewDidTabBackwards_withOriginalBlock___block_invoke;
    v7[3] = &unk_264BFD500;
    v7[4] = self;
    id v8 = v6;
    [(WFSlotTemplateView *)self _deselectSlotAndNotifyDelegate:1 completionHandler:v7];
  }
  else
  {
    v5[2](v5);
  }
}

void __82__WFSlotTemplateView_slotTemplateTypingTextViewDidTabBackwards_withOriginalBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) slotBeforeSlotIdentifier:*(void *)(a1 + 40)];
  if (v2)
  {
    int64_t v3 = v2;
    [*(id *)(a1 + 32) highlightSlotWithIdentifier:v2];
    uint64_t v2 = v3;
  }
}

- (void)slotTemplateTypingTextViewDidTabForwards:(id)a3 withOriginalBlock:(id)a4
{
  id v5 = (void (**)(void))a4;
  id v6 = [(WFSlotTemplateView *)self typingSlotIdentifier];
  if (v6 && ![(WFSlotTemplateView *)self typingAllowsMultipleLines])
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __81__WFSlotTemplateView_slotTemplateTypingTextViewDidTabForwards_withOriginalBlock___block_invoke;
    v7[3] = &unk_264BFD500;
    v7[4] = self;
    id v8 = v6;
    [(WFSlotTemplateView *)self _deselectSlotAndNotifyDelegate:1 completionHandler:v7];
  }
  else
  {
    v5[2](v5);
  }
}

void __81__WFSlotTemplateView_slotTemplateTypingTextViewDidTabForwards_withOriginalBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) slotAfterSlotIdentifier:*(void *)(a1 + 40)];
  if (v2)
  {
    int64_t v3 = v2;
    [*(id *)(a1 + 32) highlightSlotWithIdentifier:v2];
    uint64_t v2 = v3;
  }
}

- (void)slotTemplateTypingTextViewDidPaste:(id)a3 withOriginalBlock:(id)a4
{
  id v8 = (void (**)(void))a4;
  id v5 = [(WFSlotTemplateView *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(WFSlotTemplateView *)self delegate];
    [v7 slotTemplateView:self typingDidPasteWithOriginalBlock:v8];
  }
  else
  {
    v8[2]();
  }
}

- (void)slotTemplateTypingTextViewDidCopy:(id)a3 withOriginalBlock:(id)a4
{
  id v8 = (void (**)(void))a4;
  id v5 = [(WFSlotTemplateView *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(WFSlotTemplateView *)self delegate];
    [v7 slotTemplateView:self typingDidCopyWithOriginalBlock:v8];
  }
  else
  {
    v8[2]();
  }
}

- (void)slotTemplateTypingTextViewDidCut:(id)a3 withOriginalBlock:(id)a4
{
  id v8 = (void (**)(void))a4;
  id v5 = [(WFSlotTemplateView *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(WFSlotTemplateView *)self delegate];
    [v7 slotTemplateView:self typingDidCutWithOriginalBlock:v8];
  }
  else
  {
    v8[2]();
  }
}

- (void)slotTemplateTypingTextViewDidDelete:(id)a3
{
  double v4 = [(WFSlotTemplateView *)self selectedSlot];
  char v5 = [v4 isPopulated];

  if ((v5 & 1) == 0)
  {
    char v6 = [(WFSlotTemplateView *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v9 = [(WFSlotTemplateView *)self delegate];
      id v8 = [(WFSlotTemplateView *)self selectedSlotIdentifier];
      [v9 slotTemplateView:self deletePressedOnSlotWithIdentifier:v8 allowResettingValue:0];
    }
  }
}

- (void)slotTemplateStorageDidInvalidateDisplay:(id)a3
{
  [(WFSlotTemplateView *)self invalidateDisplay];
  [(WFSlotTemplateView *)self updateAccessibilityElements];
}

- (void)tintColorDidChange
{
  v6.receiver = self;
  v6.super_class = (Class)WFSlotTemplateView;
  [(WFSlotTemplateView *)&v6 tintColorDidChange];
  int64_t v3 = [(WFSlotTemplateView *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    char v5 = [(WFSlotTemplateView *)self delegate];
    [v5 slotTemplateViewTintColorDidChange:self];
  }
  [(WFSlotTemplateView *)self updateTintColorInTextStorage];
}

- (void)updateTintColorInTextStorage
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __50__WFSlotTemplateView_updateTintColorInTextStorage__block_invoke;
  v2[3] = &unk_264BFDBA0;
  v2[4] = self;
  [(WFSlotTemplateView *)self performFadeTransition:v2];
}

void __50__WFSlotTemplateView_updateTintColorInTextStorage__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) tintAdjustmentMode];
  int64_t v3 = [*(id *)(a1 + 32) textStorage];
  [v3 beginEditing];

  unsigned int v4 = [*(id *)(a1 + 32) isEnabled];
  if (v2 == 2) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = v4;
  }
  objc_super v6 = [*(id *)(a1 + 32) textStorage];
  [v6 setEnabled:v5];

  char v7 = [*(id *)(a1 + 32) tintColor];
  id v8 = [*(id *)(a1 + 32) textStorage];
  [v8 setTintColor:v7];

  [*(id *)(a1 + 32) updateVariableAttachmentAppearanceInContents];
  id v9 = [*(id *)(a1 + 32) textStorage];
  [v9 endEditing];
}

- (CGRect)sourceRectForSlot:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    double v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"WFSlotTemplateView.m", 1289, @"Invalid parameter not satisfying: %@", @"slot" object file lineNumber description];
  }
  uint64_t v18 = 0;
  id v19 = (double *)&v18;
  uint64_t v20 = 0x4010000000;
  CGRect v21 = &unk_234BA41F7;
  long long v6 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
  long long v22 = *MEMORY[0x263F001A8];
  long long v23 = v6;
  char v7 = [(WFSlotTemplateView *)self layoutManager];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __40__WFSlotTemplateView_sourceRectForSlot___block_invoke;
  void v17[3] = &unk_264BFD5A0;
  v17[4] = &v18;
  [v7 enumerateEnclosingRectsForSlot:v5 includeInsideSpacing:1 insetForBackground:1 usingBlock:v17];

  double v8 = v19[4];
  double v9 = v19[5];
  double v10 = v19[6];
  double v11 = v19[7];
  _Block_object_dispose(&v18, 8);

  double v12 = v8;
  double v13 = v9;
  double v14 = v10;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

uint64_t __40__WFSlotTemplateView_sourceRectForSlot___block_invoke(uint64_t result, unsigned char *a2, double a3, double a4, double a5, double a6)
{
  long long v6 = *(double **)(*(void *)(result + 32) + 8);
  v6[4] = a3;
  void v6[5] = a4;
  v6[6] = a5;
  v6[7] = a6;
  *a2 = 1;
  return result;
}

- (CGRect)sourceRectForSlotWithIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v19 = [MEMORY[0x263F08690] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"WFSlotTemplateView.m", 1283, @"Invalid parameter not satisfying: %@", @"slotIdentifier" object file lineNumber description];
  }
  long long v6 = [(WFSlotTemplateView *)self slotWithIdentifier:v5];
  [(WFSlotTemplateView *)self sourceRectForSlot:v6];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (id)slotAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  long long v6 = [(WFSlotTemplateView *)self layoutManager];
  double v7 = [(WFSlotTemplateView *)self textContainer];
  uint64_t v8 = objc_msgSend(v6, "characterIndexForPoint:inTextContainer:fractionOfDistanceBetweenInsertionPoints:", v7, 0, x, y);

  uint64_t v24 = 0;
  uint64_t v25 = 0;
  double v9 = [(WFSlotTemplateView *)self textStorage];
  double v10 = [v9 slotAtCharacterIndex:v8 effectiveRange:&v24 effectiveContentRange:0];

  if (v10)
  {
    uint64_t v20 = 0;
    CGRect v21 = &v20;
    uint64_t v22 = 0x2020000000;
    char v23 = 0;
    double v11 = [(WFSlotTemplateView *)self layoutManager];
    uint64_t v12 = objc_msgSend(v11, "glyphRangeForCharacterRange:actualCharacterRange:", v24, v25, 0);
    uint64_t v14 = v13;

    double v15 = [(WFSlotTemplateView *)self layoutManager];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __34__WFSlotTemplateView_slotAtPoint___block_invoke;
    v19[3] = &unk_264BFD578;
    *(double *)&v19[5] = x;
    *(double *)&v19[6] = y;
    void v19[4] = &v20;
    objc_msgSend(v15, "enumerateInsetEnclosingRectsForGlyphRange:usingBlock:", v12, v14, v19);

    if (*((unsigned char *)v21 + 24)) {
      double v16 = v10;
    }
    else {
      double v16 = 0;
    }
    id v17 = v16;
    _Block_object_dispose(&v20, 8);
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

BOOL __34__WFSlotTemplateView_slotAtPoint___block_invoke(uint64_t a1, unsigned char *a2, double a3, double a4, double a5, double a6)
{
  BOOL result = CGRectContainsPoint(*(CGRect *)&a3, *(CGPoint *)(a1 + 40));
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a2 = 1;
  }
  return result;
}

- (id)attachmentAtPoint:(CGPoint)a3 characterRange:(_NSRange *)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v8 = [(WFSlotTemplateView *)self layoutManager];
  double v9 = [(WFSlotTemplateView *)self textContainer];
  NSUInteger v10 = objc_msgSend(v8, "characterIndexForPoint:inTextContainer:fractionOfDistanceBetweenInsertionPoints:", v9, 0, x, y);

  double v11 = [(WFSlotTemplateView *)self layoutManager];
  uint64_t v12 = [(WFSlotTemplateView *)self textContainer];
  uint64_t v13 = objc_msgSend(v11, "glyphIndexForPoint:inTextContainer:", v12, x, y);

  uint64_t v14 = [(WFSlotTemplateView *)self textStorage];
  unint64_t v15 = [v14 length];

  double v16 = 0;
  if (v10 < v15)
  {
    id v17 = [(WFSlotTemplateView *)self textStorage];
    double v16 = [v17 attribute:*MEMORY[0x263F814A0] atIndex:v10 effectiveRange:0];

    if (!v16) {
      goto LABEL_6;
    }
    double v18 = [(WFSlotTemplateView *)self layoutManager];
    id v19 = [(WFSlotTemplateView *)self textContainer];
    objc_msgSend(v18, "boundingRectForGlyphRange:inTextContainer:", v13, 1, v19);
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    CGFloat v27 = v26;

    v31.origin.double x = v21;
    v31.origin.double y = v23;
    v31.size.width = v25;
    v31.size.height = v27;
    v30.double x = x;
    v30.double y = y;
    if (CGRectContainsPoint(v31, v30))
    {
      if (a4)
      {
        a4->NSUInteger location = v10;
        a4->NSUInteger length = 1;
      }
    }
    else
    {
LABEL_6:

      double v16 = 0;
    }
  }
  return v16;
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)WFSlotTemplateView;
  id v6 = a3;
  [(WFSlotTemplateView *)&v8 touchesCancelled:v6 withEvent:a4];
  double v7 = objc_msgSend(v6, "anyObject", v8.receiver, v8.super_class);

  [(WFSlotTemplateView *)self handleTouch:v7 withPhase:3];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)WFSlotTemplateView;
  id v6 = a3;
  [(WFSlotTemplateView *)&v8 touchesEnded:v6 withEvent:a4];
  double v7 = objc_msgSend(v6, "anyObject", v8.receiver, v8.super_class);

  [(WFSlotTemplateView *)self handleTouch:v7 withPhase:2];
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)WFSlotTemplateView;
  id v6 = a3;
  [(WFSlotTemplateView *)&v8 touchesMoved:v6 withEvent:a4];
  double v7 = objc_msgSend(v6, "anyObject", v8.receiver, v8.super_class);

  [(WFSlotTemplateView *)self handleTouch:v7 withPhase:1];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)WFSlotTemplateView;
  id v6 = a3;
  [(WFSlotTemplateView *)&v8 touchesBegan:v6 withEvent:a4];
  double v7 = objc_msgSend(v6, "anyObject", v8.receiver, v8.super_class);

  [(WFSlotTemplateView *)self handleTouch:v7 withPhase:0];
}

- (void)handleTouch:(id)a3 withPhase:(unint64_t)a4
{
  [a3 locationInView:self];
  -[WFSlotTemplateView handleTouchWithPhase:atLocation:](self, "handleTouchWithPhase:atLocation:", a4);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)WFSlotTemplateView;
  objc_super v8 = -[WFSlotTemplateView hitTest:withEvent:](&v24, sel_hitTest_withEvent_, v7, x, y);
  double v9 = [(WFSlotTemplateView *)self disclosureButton];

  if (v8 != v9)
  {
    NSUInteger v10 = [(WFSlotTemplateView *)self outputButton];

    if (v8 != v10)
    {
      double v11 = [(WFSlotTemplateView *)self typingTextView];
      if (v8 == v11)
      {
        uint64_t v14 = [(WFSlotTemplateView *)self typingSlotIdentifier];

        if (v14)
        {
          uint64_t v12 = [(WFSlotTemplateView *)self typingSlotIdentifier];
          uint64_t v13 = [(WFSlotTemplateView *)self slotWithIdentifier:v12];
          uint64_t v20 = 0;
          CGFloat v21 = &v20;
          uint64_t v22 = 0x2020000000;
          char v23 = 0;
          if (!v13) {
            goto LABEL_10;
          }
          unint64_t v15 = [(WFSlotTemplateView *)self layoutManager];
          v19[0] = MEMORY[0x263EF8330];
          v19[1] = 3221225472;
          v19[2] = __40__WFSlotTemplateView_hitTest_withEvent___block_invoke;
          v19[3] = &unk_264BFD578;
          *(double *)&v19[5] = x;
          *(double *)&v19[6] = y;
          void v19[4] = &v20;
          [v15 enumerateEnclosingRectsForSlot:v13 includeInsideSpacing:1 insetForBackground:0 usingBlock:v19];

          if (!*((unsigned char *)v21 + 24))
          {
LABEL_10:
            double v16 = self;

            objc_super v8 = v16;
          }
          _Block_object_dispose(&v20, 8);
          goto LABEL_12;
        }
      }
      else
      {
      }
      uint64_t v12 = -[WFSlotTemplateView slotAtPoint:](self, "slotAtPoint:", x, y);
      if (v12)
      {
LABEL_13:

        goto LABEL_14;
      }
      uint64_t v13 = v8;
      objc_super v8 = 0;
LABEL_12:

      goto LABEL_13;
    }
  }
LABEL_14:
  id v17 = v8;

  return v17;
}

BOOL __40__WFSlotTemplateView_hitTest_withEvent___block_invoke(uint64_t a1, unsigned char *a2, double a3, double a4, double a5, double a6)
{
  BOOL result = CGRectContainsPoint(*(CGRect *)&a3, *(CGPoint *)(a1 + 40));
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a2 = 1;
  }
  return result;
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  objc_super v8 = (void *)MEMORY[0x263F08A00];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = [v8 defaultCenter];
  [v12 postNotificationName:@"WFSlotContextMenuInteractionWillEndNotification" object:0];

  [(WFSlotTemplateView *)self presentedMenuDidDismiss];
  v13.receiver = self;
  v13.super_class = (Class)WFSlotTemplateView;
  [(WFSlotTemplateView *)&v13 contextMenuInteraction:v11 willEndForConfiguration:v10 animator:v9];
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(WFSlotTemplateView *)self menuWillPresent];
  v11.receiver = self;
  v11.super_class = (Class)WFSlotTemplateView;
  [(WFSlotTemplateView *)&v11 contextMenuInteraction:v10 willDisplayMenuForConfiguration:v9 animator:v8];
}

- (CGPoint)menuAttachmentPointForConfiguration:(id)a3
{
  unsigned int v4 = [a3 identifier];
  id v5 = [(WFSlotTemplateView *)self slotWithIdentifier:v4];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 identifier];
    id v8 = [(WFSlotTemplateView *)self slotWithIdentifier:v7];
    [(WFSlotTemplateView *)self sourceRectForSlot:v8];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;

    id v17 = [(WFSlotTemplateView *)self window];
    -[WFSlotTemplateView convertRect:toView:](self, "convertRect:toView:", v17, v10, v12, v14, v16);
    double v19 = v14 * 0.5 + v18;
    [v17 frame];
    if (v19 >= v20 * 0.5)
    {
      double v10 = v10 + v14;
      [v17 frame];
      double v29 = (v28 + 250.0) * 0.5;
      -[WFSlotTemplateView convertPoint:toView:](self, "convertPoint:toView:", v17, v10, 0.0);
      if (v30 < v29)
      {
        objc_msgSend(v17, "convertPoint:toView:", self, v29, 0.0);
        double v25 = -16.0;
        goto LABEL_8;
      }
      double v31 = -12.0;
    }
    else
    {
      [v17 frame];
      double v22 = (v21 + -250.0) * 0.5;
      -[WFSlotTemplateView convertPoint:toView:](self, "convertPoint:toView:", v17, v10, 0.0);
      if (v23 > v22)
      {
        objc_msgSend(v17, "convertPoint:toView:", self, v22, 0.0);
        double v25 = 16.0;
LABEL_8:
        double v27 = v24 + v25;
        goto LABEL_12;
      }
      double v31 = 12.0;
    }
    double v27 = v10 + v31;
LABEL_12:
    if ([(WFSlotTemplateView *)self shouldPresentMenuAboveView])
    {
      [(WFSlotTemplateView *)self frame];
      if (v12 < v32 * 0.5)
      {
        double v33 = -4.0;
LABEL_17:
        double v26 = v12 + v33;
LABEL_21:

        goto LABEL_22;
      }
      [(WFSlotTemplateView *)self frame];
      double v36 = v35 * 0.5;
      double v37 = -2.0;
    }
    else
    {
      double v12 = v12 + v16;
      [(WFSlotTemplateView *)self frame];
      if (v12 > v34 * 0.5)
      {
        double v33 = 4.0;
        goto LABEL_17;
      }
      [(WFSlotTemplateView *)self frame];
      double v36 = v38 * 0.5;
      double v37 = 2.0;
    }
    double v26 = v36 + v37;
    goto LABEL_21;
  }
  double v27 = *MEMORY[0x263F00148];
  double v26 = *(double *)(MEMORY[0x263F00148] + 8);
LABEL_22:

  double v39 = v27;
  double v40 = v26;
  result.double y = v40;
  result.double x = v39;
  return result;
}

- (BOOL)shouldPresentMenuAboveView
{
  [(WFSlotTemplateView *)self frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(WFSlotTemplateView *)self window];
  -[WFSlotTemplateView convertRect:toView:](self, "convertRect:toView:", v11, v4, v6, v8, v10);
  double v13 = v12;

  double v14 = [(WFSlotTemplateView *)self window];
  [v14 frame];
  LOBYTE(v11) = v13 > v15 * 0.5;

  return (char)v11;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v7 = objc_msgSend(MEMORY[0x263EFF910], "date", a3);
  double v8 = [(WFSlotTemplateView *)self touchDownTimestamp];
  [v7 timeIntervalSinceDate:v8];
  double v10 = v9;

  double v11 = [(WFSlotTemplateView *)self touchDownTimestamp];
  BOOL v13 = v10 < 0.140000001 || v11 == 0;

  [(WFSlotTemplateView *)self setTouchDownTimestamp:0];
  v32.receiver = self;
  v32.super_class = (Class)WFSlotTemplateView;
  double v14 = -[WFSlotTemplateView hitTest:withEvent:](&v32, sel_hitTest_withEvent_, 0, x, y);
  double v15 = [(WFSlotTemplateView *)self disclosureButton];

  if (v14 == v15)
  {
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __76__WFSlotTemplateView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
    v31[3] = &unk_264BFDBA0;
    v31[4] = self;
    double v25 = MEMORY[0x263EF83A0];
    double v26 = v31;
LABEL_16:
    dispatch_async(v25, v26);
    double v23 = 0;
    goto LABEL_19;
  }
  double v16 = [(WFSlotTemplateView *)self outputButton];

  if (v14 == v16)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __76__WFSlotTemplateView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2;
    block[3] = &unk_264BFDBA0;
    block[4] = self;
    double v25 = MEMORY[0x263EF83A0];
    double v26 = block;
    goto LABEL_16;
  }
  id v17 = -[WFSlotTemplateView slotAtPoint:](self, "slotAtPoint:", x, y);
  if (v17)
  {
    double v18 = -[WFSlotTemplateView configureMenuAtLocation:wasTriggeredByTap:](self, "configureMenuAtLocation:wasTriggeredByTap:", v13, x, y);
    int v19 = [v18 shouldDisplayInFixedOrder];
    double v20 = (void *)MEMORY[0x263F82610];
    double v21 = [v17 identifier];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __76__WFSlotTemplateView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_3;
    v28[3] = &unk_264BFD550;
    id v29 = v18;
    id v22 = v18;
    double v23 = [v20 configurationWithIdentifier:v21 previewProvider:0 actionProvider:v28];

    if (v19) {
      uint64_t v24 = 2;
    }
    else {
      uint64_t v24 = 1;
    }
    [v23 setPreferredMenuElementOrder:v24];
  }
  else
  {
    double v23 = 0;
  }

LABEL_19:
  return v23;
}

uint64_t __76__WFSlotTemplateView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) didTapDisclosureArrow];
}

uint64_t __76__WFSlotTemplateView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) didTapOutputButton];
}

uint64_t __76__WFSlotTemplateView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) platformMenu];
}

- (void)handleTouchWithPhase:(unint64_t)a3 atLocation:(CGPoint)a4
{
  BOOL v13 = -[WFSlotTemplateView slotAtPoint:](self, "slotAtPoint:", a4.x, a4.y);
  double v6 = [v13 identifier];
  double v7 = [(WFSlotTemplateView *)self typingSlotIdentifier];
  char v8 = [v6 isEqual:v7];

  double v9 = v13;
  if (v8) {
    goto LABEL_15;
  }
  if (a3 == 1)
  {
    if (v13 && [v13 isEnabled])
    {
      double v11 = [v13 identifier];
      [(WFSlotTemplateView *)self highlightSlotWithIdentifier:v11];
      goto LABEL_10;
    }
    goto LABEL_13;
  }
  if (a3)
  {
    if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 2) {
      goto LABEL_15;
    }
    BOOL v12 = [(WFSlotTemplateView *)self menuIsPresented];
    double v9 = v13;
    if (v12) {
      goto LABEL_15;
    }
LABEL_13:
    [(WFSlotTemplateView *)self unhighlightSlot];
    goto LABEL_14;
  }
  if (v13)
  {
    int v10 = [v13 isEnabled];
    double v9 = v13;
    if (v10)
    {
      double v11 = [MEMORY[0x263EFF910] date];
      [(WFSlotTemplateView *)self setTouchDownTimestamp:v11];
LABEL_10:

LABEL_14:
      double v9 = v13;
    }
  }
LABEL_15:
}

- (void)performFadeTransition:(id)a3
{
}

- (void)drawRect:(CGRect)a3
{
  v19.receiver = self;
  v19.super_class = (Class)WFSlotTemplateView;
  -[WFSlotTemplateView drawRect:](&v19, sel_drawRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = [(WFSlotTemplateView *)self layoutManager];
  [(WFSlotTemplateView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  BOOL v13 = [(WFSlotTemplateView *)self textContainer];
  uint64_t v14 = objc_msgSend(v4, "glyphRangeForBoundingRect:inTextContainer:", v13, v6, v8, v10, v12);
  uint64_t v16 = v15;

  id v17 = [(WFSlotTemplateView *)self layoutManager];
  [(WFSlotTemplateView *)self bounds];
  [v17 drawBackgroundForGlyphRange:v14 atPoint:v16];

  double v18 = [(WFSlotTemplateView *)self layoutManager];
  [(WFSlotTemplateView *)self bounds];
  [v18 drawGlyphsForGlyphRange:v14 atPoint:v16];
}

- (void)updateTypingTextContainerSize
{
  [(WFSlotTemplateView *)self bounds];
  double v4 = v3;
  id v5 = [(WFSlotTemplateView *)self typingTextContainer];
  objc_msgSend(v5, "setSize:", v4, 1.79769313e308);
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)WFSlotTemplateView;
  [(WFSlotTemplateView *)&v18 layoutSubviews];
  [(WFSlotTemplateView *)self bounds];
  double v4 = v3;
  id v5 = [(WFSlotTemplateView *)self textContainer];
  objc_msgSend(v5, "setSize:", v4, 1.79769313e308);

  [(WFSlotTemplateView *)self updateTypingTextContainerSize];
  [(WFSlotTemplateView *)self bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  uint64_t v14 = [(WFSlotTemplateView *)self typingTextView];
  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

  uint64_t v15 = [(WFSlotTemplateView *)self typingSlotIdentifier];

  if (v15)
  {
    uint64_t v16 = [(WFSlotTemplateView *)self typingSlotIdentifier];
    id v17 = [(WFSlotTemplateView *)self slotWithIdentifier:v16];

    if (v17) {
      [(WFSlotTemplateView *)self positionTypingAboveSlot:v17];
    }
  }
  [(WFSlotTemplateView *)self updateAccessibilityElements];
  [(WFSlotTemplateView *)self updateDisclosureButtonPosition];
  [(WFSlotTemplateView *)self updateOutputButtonPosition];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WFSlotTemplateView;
  [(WFSlotTemplateView *)&v4 traitCollectionDidChange:a3];
  [(WFSlotTemplateView *)self bounds];
  -[WFSlotTemplateView updateExclusionRectsWithBounds:](self, "updateExclusionRectsWithBounds:");
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(WFSlotTemplateView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)WFSlotTemplateView;
  -[WFSlotTemplateView setBounds:](&v13, sel_setBounds_, x, y, width, height);
  if (v9 != width || v11 != height)
  {
    [(WFSlotTemplateView *)self invalidateDisplay];
    [(WFSlotTemplateView *)self bounds];
    -[WFSlotTemplateView updateExclusionRectsWithBounds:](self, "updateExclusionRectsWithBounds:");
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(WFSlotTemplateView *)self frame];
  double v9 = v8;
  double v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)WFSlotTemplateView;
  -[WFSlotTemplateView setFrame:](&v13, sel_setFrame_, x, y, width, height);
  if (v9 != width || v11 != height)
  {
    [(WFSlotTemplateView *)self invalidateDisplay];
    [(WFSlotTemplateView *)self bounds];
    -[WFSlotTemplateView updateExclusionRectsWithBounds:](self, "updateExclusionRectsWithBounds:");
  }
}

- (void)presentedMenuDidDismiss
{
  [(WFSlotTemplateView *)self setMenuIsPresented:0];
  [(WFSlotTemplateView *)self unhighlightSlot];
  double v3 = [(WFSlotTemplateView *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(WFSlotTemplateView *)self delegate];
    [v5 menuDidDismissInSlotTemplateView:self];
  }
}

- (void)menuWillPresent
{
}

- (id)configureMenuAtLocation:(CGPoint)a3 wasTriggeredByTap:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  double v8 = -[WFSlotTemplateView slotAtPoint:](self, "slotAtPoint:");
  if (!v8)
  {
    objc_super v13 = 0;
    goto LABEL_15;
  }
  if (!v4) {
    goto LABEL_8;
  }
  double v9 = -[WFSlotTemplateView attachmentAtPoint:characterRange:](self, "attachmentAtPoint:characterRange:", 0, x, y);
  if (!v9
    || ([v8 identifier],
        double v10 = objc_claimAutoreleasedReturnValue(),
        BOOL v11 = [(WFSlotTemplateView *)self shouldRecognizeTapOnTextAttachment:v9 inSlotWithIdentifier:v10], v10, !v11))
  {

LABEL_8:
    BOOL v14 = !v4;
    uint64_t v15 = [(WFSlotTemplateView *)self delegate];
    uint64_t v16 = [v8 identifier];
    objc_super v13 = [v15 slotTemplateView:self menuForSlotIdentifier:v16 style:!v4];

    if (v14 || v13)
    {
      if (v13)
      {
        id v17 = [v8 identifier];
        [(WFSlotTemplateView *)self highlightSlotWithIdentifier:v17];
      }
      id v12 = v13;
      objc_super v13 = v12;
    }
    else
    {
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __64__WFSlotTemplateView_configureMenuAtLocation_wasTriggeredByTap___block_invoke_2;
      v19[3] = &unk_264BFD500;
      void v19[4] = self;
      id v20 = v8;
      dispatch_async(MEMORY[0x263EF83A0], v19);

      id v12 = 0;
    }
    goto LABEL_14;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__WFSlotTemplateView_configureMenuAtLocation_wasTriggeredByTap___block_invoke;
  block[3] = &unk_264BFD4B0;
  block[4] = self;
  id v22 = v9;
  id v23 = v8;
  id v12 = v9;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_super v13 = 0;
LABEL_14:

LABEL_15:
  return v13;
}

void __64__WFSlotTemplateView_configureMenuAtLocation_wasTriggeredByTap___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 48) identifier];
  [v1 didTapTextAttachment:v2 inSlotWithIdentifier:v3];
}

uint64_t __64__WFSlotTemplateView_configureMenuAtLocation_wasTriggeredByTap___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _selectSlot:*(void *)(a1 + 40) notifyDelegate:1];
}

- (void)_deselectSlotAndNotifyDelegate:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  double v6 = (void (**)(void))a4;
  double v7 = [(WFSlotTemplateView *)self selectedSlot];
  double v8 = v7;
  if (v7)
  {
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    BOOL v14 = __71__WFSlotTemplateView__deselectSlotAndNotifyDelegate_completionHandler___block_invoke;
    uint64_t v15 = &unk_264BFD500;
    uint64_t v16 = self;
    id v9 = v7;
    id v17 = v9;
    [(WFSlotTemplateView *)self performFadeTransition:&v12];
    [(WFSlotTemplateView *)self accessibilityShiftFocusBackToView];
    double v10 = [(WFSlotTemplateView *)self delegate];
    if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      BOOL v11 = [v9 identifier];
      [v10 slotTemplateView:self didDeselectSlotWithIdentifier:v11 completionHandler:v6];
    }
    else if (v6)
    {
      v6[2](v6);
    }
  }
  else if (v6)
  {
    v6[2](v6);
  }
}

void __71__WFSlotTemplateView__deselectSlotAndNotifyDelegate_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) textStorage];
  [v2 didDeselectSlot:*(void *)(a1 + 40)];
}

- (void)deselectSlot
{
}

- (void)_selectSlot:(id)a3 notifyDelegate:(BOOL)a4
{
  id v7 = a3;
  if (!v7)
  {
    BOOL v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFSlotTemplateView.m", 728, @"Invalid parameter not satisfying: %@", @"slot" object file lineNumber description];
  }
  double v8 = [(WFSlotTemplateView *)self textStorage];
  id v9 = [v8 selectedSlots];
  char v10 = [v9 containsObject:v7];

  if ((v10 & 1) == 0)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __49__WFSlotTemplateView__selectSlot_notifyDelegate___block_invoke;
    v12[3] = &unk_264BFD528;
    id v13 = v7;
    id v14 = v8;
    uint64_t v15 = self;
    BOOL v16 = a4;
    [(WFSlotTemplateView *)self _deselectSlotAndNotifyDelegate:1 completionHandler:v12];
  }
}

void __49__WFSlotTemplateView__selectSlot_notifyDelegate___block_invoke(uint64_t a1)
{
  id v11 = *(id *)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) contents];
  char v3 = [v2 containsObject:*(void *)(a1 + 32)];

  if (v3) {
    goto LABEL_3;
  }
  BOOL v4 = *(void **)(a1 + 48);
  id v5 = [*(id *)(a1 + 32) identifier];
  uint64_t v6 = [v4 slotWithIdentifier:v5];

  id v11 = (id)v6;
  if (v6)
  {
LABEL_3:
    id v7 = [*(id *)(a1 + 48) textStorage];
    [v7 didSelectSlot:v11];

    double v8 = [*(id *)(a1 + 48) delegate];
    if (*(unsigned char *)(a1 + 56) && (objc_opt_respondsToSelector() & 1) != 0)
    {
      uint64_t v9 = *(void *)(a1 + 48);
      char v10 = [v11 identifier];
      [v8 slotTemplateView:v9 didSelectSlotWithIdentifier:v10];
    }
  }
}

- (void)selectSlotWithIdentifier:(id)a3
{
  uint64_t v5 = [(WFSlotTemplateView *)self slotWithIdentifier:a3];
  id v7 = (id)v5;
  if (!v5)
  {
    uint64_t v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"WFSlotTemplateView.m" lineNumber:723 description:@"Must be slot with that identifier"];

    uint64_t v5 = 0;
  }
  [(WFSlotTemplateView *)self _selectSlot:v5 notifyDelegate:0];
}

- (WFSlotIdentifier)selectedSlotIdentifier
{
  id v2 = [(WFSlotTemplateView *)self selectedSlot];
  char v3 = [v2 identifier];

  return (WFSlotIdentifier *)v3;
}

- (id)selectedSlot
{
  id v2 = [(WFSlotTemplateView *)self textStorage];
  char v3 = [v2 selectedSlots];
  BOOL v4 = [v3 anyObject];

  return v4;
}

- (void)unhighlightSlot
{
  char v3 = [(WFSlotTemplateView *)self highlightedSlot];
  BOOL v4 = v3;
  if (v3)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __37__WFSlotTemplateView_unhighlightSlot__block_invoke;
    v5[3] = &unk_264BFD500;
    v5[4] = self;
    id v6 = v3;
    [(WFSlotTemplateView *)self performFadeTransition:v5];
  }
}

uint64_t __37__WFSlotTemplateView_unhighlightSlot__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) textStorage];
  [v2 didUnhighlightSlot:*(void *)(a1 + 40)];

  char v3 = *(void **)(a1 + 32);
  return [v3 updateVariableAttachmentAppearanceInContents];
}

- (void)highlightSlotWithIdentifier:(id)a3
{
  BOOL v4 = [(WFSlotTemplateView *)self slotWithIdentifier:a3];
  if (v4)
  {
    uint64_t v5 = [(WFSlotTemplateView *)self textStorage];
    id v6 = [v5 highlightedSlots];
    char v7 = [v6 containsObject:v4];

    if ((v7 & 1) == 0)
    {
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __50__WFSlotTemplateView_highlightSlotWithIdentifier___block_invoke;
      v8[3] = &unk_264BFD4B0;
      v8[4] = self;
      id v9 = v5;
      id v10 = v4;
      [(WFSlotTemplateView *)self performFadeTransition:v8];
    }
  }
}

uint64_t __50__WFSlotTemplateView_highlightSlotWithIdentifier___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) unhighlightSlot];
  [*(id *)(a1 + 40) didHighlightSlot:*(void *)(a1 + 48)];
  id v2 = *(void **)(a1 + 32);
  return [v2 updateVariableAttachmentAppearanceInContents];
}

- (id)highlightedSlotIdentifier
{
  id v2 = [(WFSlotTemplateView *)self highlightedSlot];
  char v3 = [v2 identifier];

  return v3;
}

- (id)highlightedSlot
{
  id v2 = [(WFSlotTemplateView *)self textStorage];
  char v3 = [v2 highlightedSlots];
  BOOL v4 = [v3 anyObject];

  return v4;
}

- (id)slotIdentifierBeforeSlot:(id)a3 inContents:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = a4;
  char v7 = (void *)[v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  id v8 = 0;
  if (v7)
  {
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v12 = v11;
          id v13 = objc_msgSend(v12, "identifier", (void)v17);
          char v14 = [v13 isEqual:v5];

          if (v14)
          {
            id v8 = v8;

            char v7 = v8;
            goto LABEL_13;
          }
          uint64_t v15 = [v12 identifier];

          id v8 = (id)v15;
        }
      }
      char v7 = (void *)[v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v7;
}

- (id)slotBeforeSlotIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(WFSlotTemplateView *)self textStorage];
  id v6 = [v5 contents];
  char v7 = v6;
  if (v4)
  {
    id v8 = [v6 objectEnumerator];
    uint64_t v9 = [(WFSlotTemplateView *)self slotIdentifierBeforeSlot:v4 inContents:v8];
  }
  else
  {
    id v10 = objc_msgSend(v6, "if_objectsOfClass:", objc_opt_class());
    id v11 = [v10 lastObject];

    uint64_t v9 = [v11 identifier];
    id v5 = v11;
  }

  return v9;
}

- (id)slotAfterSlotIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(WFSlotTemplateView *)self textStorage];
  id v6 = [v5 contents];
  char v7 = v6;
  if (v4)
  {
    id v8 = [v6 reverseObjectEnumerator];
    uint64_t v9 = [(WFSlotTemplateView *)self slotIdentifierBeforeSlot:v4 inContents:v8];
  }
  else
  {
    id v10 = objc_msgSend(v6, "if_objectsOfClass:", objc_opt_class());
    id v11 = [v10 firstObject];

    uint64_t v9 = [v11 identifier];
    id v5 = v11;
  }

  return v9;
}

- (id)slotWithIdentifier:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = [(WFSlotTemplateView *)self textStorage];
  id v6 = [v5 contents];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v12 = v11;
          id v13 = [v12 identifier];
          char v14 = [v13 isEqual:v4];

          if (v14) {
            goto LABEL_12;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
  id v12 = 0;
LABEL_12:

  return v12;
}

- (void)setContents:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = getWFEditorLogObject();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  uint64_t v9 = getWFEditorLogObject();
  id v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_23490C000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "SlotTemplateSetContents", "", buf, 2u);
  }

  id v11 = [(WFSlotTemplateView *)self textStorage];
  id v12 = [v11 contents];
  id v13 = v6;
  char v14 = v12;
  if (v14 != v13)
  {
    uint64_t v15 = v14;
    if (v13 && v14)
    {
      char v16 = [v13 isEqualToArray:v14];

      if (v16) {
        goto LABEL_29;
      }
    }
    else
    {
    }
    id v11 = [(WFSlotTemplateView *)self selectedSlotIdentifier];
    long long v19 = [(WFSlotTemplateView *)self highlightedSlotIdentifier];
    long long v20 = [(WFSlotTemplateView *)self textStorage];
    [v20 beginEditing];

    if (v4)
    {
      uint64_t v28 = MEMORY[0x263EF8330];
      uint64_t v29 = 3221225472;
      double v30 = __43__WFSlotTemplateView_setContents_animated___block_invoke;
      double v31 = &unk_264BFD500;
      objc_super v32 = self;
      double v33 = v13;
      [(WFSlotTemplateView *)self performFadeTransition:&v28];

      if (!v11)
      {
LABEL_17:
        if (v19)
        {
          id v23 = [(WFSlotTemplateView *)self slotWithIdentifier:v19];

          if (v23) {
            [(WFSlotTemplateView *)self highlightSlotWithIdentifier:v19];
          }
        }
        [(WFSlotTemplateView *)self updateVariableAttachmentAppearanceInContents];
        uint64_t v24 = [(WFSlotTemplateView *)self textStorage];
        [v24 endEditing];

        [(WFSlotTemplateView *)self invalidateIntrinsicContentSize];
        long long v18 = [(WFSlotTemplateView *)self typingSlotIdentifier];
        if (v18)
        {
          double v25 = [(WFSlotTemplateView *)self slotWithIdentifier:v18];
          if (v25)
          {
            [(WFSlotTemplateView *)self updateTypingTextContents:v18];
            double v26 = [(WFSlotTemplateView *)self textStorage];
            [v26 didBeginTypingInSlot:v25];

            [(WFSlotTemplateView *)self positionTypingAboveSlot:v25];
          }
          else
          {
            [(WFSlotTemplateView *)self endTyping];
          }
        }
        double v27 = getWFEditorLogObject();
        long long v17 = v27;
        if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23490C000, v17, OS_SIGNPOST_INTERVAL_END, v8, "SlotTemplateSetContents", "", buf, 2u);
        }
        goto LABEL_28;
      }
    }
    else
    {
      uint64_t v21 = [(WFSlotTemplateView *)self textStorage];
      [v21 setContents:v13];

      if (!v11) {
        goto LABEL_17;
      }
    }
    uint64_t v22 = -[WFSlotTemplateView slotWithIdentifier:](self, "slotWithIdentifier:", v11, v28, v29, v30, v31, v32);

    if (v22) {
      [(WFSlotTemplateView *)self selectSlotWithIdentifier:v11];
    }
    goto LABEL_17;
  }
  long long v17 = v13;
  long long v18 = v13;
  long long v19 = v13;
LABEL_28:

LABEL_29:
}

void __43__WFSlotTemplateView_setContents_animated___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) textStorage];
  [v2 setContents:v1];
}

- (void)invalidateIntrinsicContentSize
{
  v4.receiver = self;
  v4.super_class = (Class)WFSlotTemplateView;
  [(WFSlotTemplateView *)&v4 invalidateIntrinsicContentSize];
  char v3 = [(WFSlotTemplateView *)self cachedHeightsByWidths];
  [v3 removeAllObjects];
}

- (void)invalidateDisplay
{
  [(WFSlotTemplateView *)self setNeedsDisplay];
  [(WFSlotTemplateView *)self updateDisclosureButtonPosition];
  [(WFSlotTemplateView *)self updateOutputButtonPosition];
}

- (void)updateOutputButtonTransformAnimated:(BOOL)a3
{
  double v3 = 0.200000003;
  if (!a3) {
    double v3 = 0.0;
  }
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __58__WFSlotTemplateView_updateOutputButtonTransformAnimated___block_invoke;
  v4[3] = &unk_264BFDBA0;
  v4[4] = self;
  [MEMORY[0x263F82E00] animateWithDuration:v4 animations:v3];
}

void __58__WFSlotTemplateView_updateOutputButtonTransformAnimated___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) outputButtonIsOpen]) {
    id v2 = @"eye.fill";
  }
  else {
    id v2 = @"eye";
  }
  id v4 = [MEMORY[0x263F827E8] systemImageNamed:v2];
  double v3 = [*(id *)(a1 + 32) outputButton];
  [v3 setImage:v4 forState:0];
}

- (void)updateOutputButtonPosition
{
  double v3 = [(WFSlotTemplateView *)self textStorage];
  uint64_t v4 = [v3 length] - 1;

  id v5 = [(WFSlotTemplateView *)self layoutManager];
  uint64_t v6 = objc_msgSend(v5, "glyphRangeForCharacterRange:actualCharacterRange:", v4, 1, 0);
  uint64_t v8 = v7;

  uint64_t v9 = [(WFSlotTemplateView *)self layoutManager];
  id v10 = [(WFSlotTemplateView *)self textContainer];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __48__WFSlotTemplateView_updateOutputButtonPosition__block_invoke;
  v11[3] = &unk_264BFD840;
  v11[4] = self;
  objc_msgSend(v9, "enumerateEnclosingRectsForGlyphRange:withinSelectedGlyphRange:inTextContainer:usingBlock:", v6, v8, 0x7FFFFFFFFFFFFFFFLL, 0, v10, v11);
}

uint64_t __48__WFSlotTemplateView_updateOutputButtonPosition__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  uint64_t v9 = [*(id *)(a1 + 32) outputButton];
  [v9 intrinsicContentSize];
  double v11 = v10;
  double v13 = v12;

  char v14 = [*(id *)(a1 + 32) outputButton];
  objc_msgSend(v14, "setFrame:", a2 + 7.0, a3 + (a5 - v13) * 0.5, v11, v13);

  uint64_t v15 = *(void **)(a1 + 32);
  return [v15 updateOutputButtonTransformAnimated:0];
}

- (void)didTapOutputButton
{
  BOOL outputButtonIsOpen = self->_outputButtonIsOpen;
  self->_BOOL outputButtonIsOpen = !outputButtonIsOpen;
  uint64_t v4 = [(WFSlotTemplateView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(WFSlotTemplateView *)self delegate];
    [v6 slotTemplateView:self outputButtonDidChange:!outputButtonIsOpen];
  }
}

- (void)setOutputButtonIsOpen:(BOOL)a3
{
  if (self->_outputButtonIsOpen != a3)
  {
    self->_BOOL outputButtonIsOpen = a3;
    [(WFSlotTemplateView *)self updateOutputButtonTransformAnimated:0];
  }
}

- (void)setShowsOutputButton:(BOOL)a3
{
  if (self->_showsOutputButton != a3)
  {
    BOOL v3 = a3;
    self->_showsOutputButton = a3;
    if (a3)
    {
      char v5 = (void *)[objc_alloc(MEMORY[0x263F81678]) initWithData:0 ofType:0];
      objc_msgSend(v5, "setBounds:", 0.0, 0.0, 27.0, 20.0);
      id v6 = objc_opt_new();
      [v5 setImage:v6];
    }
    else
    {
      char v5 = 0;
    }
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    uint64_t v15 = __43__WFSlotTemplateView_setShowsOutputButton___block_invoke;
    char v16 = &unk_264BFD500;
    long long v17 = self;
    id v7 = v5;
    id v18 = v7;
    [(WFSlotTemplateView *)self performFadeTransition:&v13];
    if (v3)
    {
      uint64_t v8 = objc_msgSend(MEMORY[0x263F827E8], "systemImageNamed:", @"eye", v13, v14, v15, v16, v17);
      uint64_t v9 = [MEMORY[0x263F82818] configurationWithPointSize:16.0];
      double v10 = [v8 imageWithConfiguration:v9];

      double v11 = [MEMORY[0x263F824E8] systemButtonWithImage:v10 target:self action:sel_didTapOutputButton];
      [(WFSlotTemplateView *)self addSubview:v11];
      [(WFSlotTemplateView *)self setOutputButton:v11];
      [(WFSlotTemplateView *)self updateOutputButtonPosition];
    }
    else
    {
      double v12 = [(WFSlotTemplateView *)self outputButton];
      [v12 removeFromSuperview];

      [(WFSlotTemplateView *)self setOutputButton:0];
    }
  }
}

void __43__WFSlotTemplateView_setShowsOutputButton___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) textStorage];
  [v2 setOutputButtonAttachment:v1];
}

- (void)updateDisclosureButtonTransformAnimated:(BOOL)a3
{
  double v3 = 0.200000003;
  if (!a3) {
    double v3 = 0.0;
  }
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __62__WFSlotTemplateView_updateDisclosureButtonTransformAnimated___block_invoke;
  v4[3] = &unk_264BFDBA0;
  v4[4] = self;
  [MEMORY[0x263F82E00] animateWithDuration:v4 animations:v3];
}

void __62__WFSlotTemplateView_updateDisclosureButtonTransformAnimated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) traitCollection];
  BOOL v3 = [v2 layoutDirection] == 1;

  double v4 = dbl_234B79610[v3];
  int v5 = [*(id *)(a1 + 32) disclosureArrowIsOpen];
  double v6 = 0.0;
  if (v5) {
    double v6 = v4;
  }
  CGAffineTransformMakeRotation(&v9, v6);
  id v7 = [*(id *)(a1 + 32) disclosureButton];
  CGAffineTransform v8 = v9;
  [v7 setTransform:&v8];
}

- (void)updateDisclosureButtonPosition
{
  BOOL v3 = [(WFSlotTemplateView *)self textStorage];
  uint64_t v4 = [v3 length] - 1;

  int v5 = [(WFSlotTemplateView *)self layoutManager];
  uint64_t v6 = objc_msgSend(v5, "glyphRangeForCharacterRange:actualCharacterRange:", v4, 1, 0);
  uint64_t v8 = v7;

  CGAffineTransform v9 = [(WFSlotTemplateView *)self layoutManager];
  double v10 = [(WFSlotTemplateView *)self textContainer];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __52__WFSlotTemplateView_updateDisclosureButtonPosition__block_invoke;
  v11[3] = &unk_264BFD840;
  v11[4] = self;
  objc_msgSend(v9, "enumerateEnclosingRectsForGlyphRange:withinSelectedGlyphRange:inTextContainer:usingBlock:", v6, v8, 0x7FFFFFFFFFFFFFFFLL, 0, v10, v11);
}

uint64_t __52__WFSlotTemplateView_updateDisclosureButtonPosition__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  double v9 = 0.0;
  if ([*(id *)(a1 + 32) showsOutputButton])
  {
    double v10 = [*(id *)(a1 + 32) outputButton];
    [v10 intrinsicContentSize];
    double v9 = v11 + 7.0;
  }
  double v12 = [*(id *)(a1 + 32) disclosureButton];
  [v12 intrinsicContentSize];
  double v14 = v13;
  double v16 = v15;

  long long v17 = [*(id *)(a1 + 32) disclosureButton];
  objc_msgSend(v17, "setFrame:", a2 + 7.0 + v9, a3 + (a5 - v16) * 0.5, v14, v16);

  id v18 = *(void **)(a1 + 32);
  return [v18 updateDisclosureButtonTransformAnimated:0];
}

- (void)didTapDisclosureArrow
{
  BOOL disclosureArrowIsOpen = self->_disclosureArrowIsOpen;
  self->_BOOL disclosureArrowIsOpen = !disclosureArrowIsOpen;
  [(WFSlotTemplateView *)self updateDisclosureButtonTransformAnimated:1];
  uint64_t v4 = [(WFSlotTemplateView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(WFSlotTemplateView *)self delegate];
    [v6 slotTemplateView:self disclosureArrowDidChange:!disclosureArrowIsOpen];
  }
}

- (void)setDisclosureArrowIsOpen:(BOOL)a3
{
  if (self->_disclosureArrowIsOpen != a3)
  {
    self->_BOOL disclosureArrowIsOpen = a3;
    [(WFSlotTemplateView *)self updateDisclosureButtonTransformAnimated:1];
  }
}

- (void)setShowsDisclosureArrow:(BOOL)a3
{
  if (self->_showsDisclosureArrow != a3)
  {
    BOOL v3 = a3;
    self->_showsDisclosureArrow = a3;
    if (a3)
    {
      char v5 = (void *)[objc_alloc(MEMORY[0x263F81678]) initWithData:0 ofType:0];
      objc_msgSend(v5, "setBounds:", 0.0, 0.0, 27.0, 20.0);
      id v6 = objc_opt_new();
      [v5 setImage:v6];
    }
    else
    {
      char v5 = 0;
    }
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    id v18 = __46__WFSlotTemplateView_setShowsDisclosureArrow___block_invoke;
    long long v19 = &unk_264BFD500;
    long long v20 = self;
    id v7 = v5;
    id v21 = v7;
    [(WFSlotTemplateView *)self performFadeTransition:&v16];
    if (v3)
    {
      uint64_t v8 = [(WFSlotTemplateView *)self traitCollection];
      uint64_t v9 = [v8 layoutDirection];

      if (v9 == 1) {
        double v10 = @"chevron.left.circle";
      }
      else {
        double v10 = @"chevron.right.circle";
      }
      double v11 = [MEMORY[0x263F827E8] systemImageNamed:v10];
      double v12 = [MEMORY[0x263F82818] configurationWithPointSize:16.0];
      double v13 = [v11 imageWithConfiguration:v12];

      double v14 = [MEMORY[0x263F824E8] systemButtonWithImage:v13 target:self action:sel_didTapDisclosureArrow];
      [(WFSlotTemplateView *)self addSubview:v14];
      [(WFSlotTemplateView *)self setDisclosureButton:v14];
      [(WFSlotTemplateView *)self updateDisclosureButtonPosition];
    }
    else
    {
      double v15 = [(WFSlotTemplateView *)self disclosureButton];
      [v15 removeFromSuperview];

      [(WFSlotTemplateView *)self setDisclosureButton:0];
    }
  }
}

void __46__WFSlotTemplateView_setShowsDisclosureArrow___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) textStorage];
  [v2 setDisclosureAttachment:v1];
}

- (void)updateExclusionRectsWithBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v8 = [(WFSlotTemplateView *)self exclusionRects];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __53__WFSlotTemplateView_updateExclusionRectsWithBounds___block_invoke;
  v14[3] = &unk_264BFD4D8;
  v14[4] = self;
  *(CGFloat *)&v14[5] = x;
  *(CGFloat *)&v14[6] = y;
  *(CGFloat *)&v14[7] = width;
  *(CGFloat *)&v14[8] = height;
  uint64_t v9 = objc_msgSend(v8, "if_map:", v14);
  double v10 = [(WFSlotTemplateView *)self textContainer];
  [v10 setExclusionPaths:v9];

  double v11 = [(WFSlotTemplateView *)self typingSlotIdentifier];

  if (v11)
  {
    double v12 = [(WFSlotTemplateView *)self typingSlotIdentifier];
    double v13 = [(WFSlotTemplateView *)self slotWithIdentifier:v12];

    if (v13) {
      [(WFSlotTemplateView *)self positionTypingAboveSlot:v13];
    }
  }
}

uint64_t __53__WFSlotTemplateView_updateExclusionRectsWithBounds___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = a2;
  char v5 = [v3 traitCollection];
  BOOL v6 = [v5 layoutDirection] == 1;

  id v7 = (void *)MEMORY[0x263F824C0];
  objc_msgSend(v4, "resolvedRectWithViewBounds:inRTL:", v6, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  return objc_msgSend(v7, "bezierPathWithRect:", v9, v11, v13, v15);
}

- (void)setExclusionRects:(id)a3
{
  id v4 = a3;
  exclusionRects = self->_exclusionRects;
  double v10 = (NSArray *)v4;
  BOOL v6 = exclusionRects;
  if (v6 == v10)
  {

    goto LABEL_9;
  }
  if (!v10 || !v6)
  {

    goto LABEL_8;
  }
  BOOL v7 = [(NSArray *)v10 isEqualToArray:v6];

  if (!v7)
  {
LABEL_8:
    double v8 = (NSArray *)[(NSArray *)v10 copy];
    double v9 = self->_exclusionRects;
    self->_exclusionRects = v8;

    [(WFSlotTemplateView *)self invalidateDisplay];
    [(WFSlotTemplateView *)self invalidateIntrinsicContentSize];
    [(WFSlotTemplateView *)self bounds];
    -[WFSlotTemplateView updateExclusionRectsWithBounds:](self, "updateExclusionRectsWithBounds:");
  }
LABEL_9:
}

- (void)setExtendSlotBackgroundOffEdges:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(WFSlotTemplateView *)self extendSlotBackgroundOffEdges] != a3)
  {
    char v5 = [(WFSlotTemplateView *)self layoutManager];
    [v5 setExtendSlotBackgroundOffEdges:v3];

    [(WFSlotTemplateView *)self invalidateDisplay];
  }
}

- (BOOL)extendSlotBackgroundOffEdges
{
  id v2 = [(WFSlotTemplateView *)self layoutManager];
  char v3 = [v2 extendSlotBackgroundOffEdges];

  return v3;
}

- (void)setDisabledSlotTitleColor:(id)a3 backgroundColor:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__WFSlotTemplateView_setDisabledSlotTitleColor_backgroundColor_animated___block_invoke;
  aBlock[3] = &unk_264BFD4B0;
  aBlock[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v10 = v9;
  id v11 = v8;
  double v12 = _Block_copy(aBlock);
  double v13 = v12;
  if (v5) {
    [(WFSlotTemplateView *)self performFadeTransition:v12];
  }
  else {
    (*((void (**)(void *))v12 + 2))(v12);
  }
}

void __73__WFSlotTemplateView_setDisabledSlotTitleColor_backgroundColor_animated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) textStorage];
  [v2 setDisabledSlotTitleColor:*(void *)(a1 + 40) backgroundColor:*(void *)(a1 + 48)];
}

- (UIColor)disabledSlotBackgroundColor
{
  id v2 = [(WFSlotTemplateView *)self textStorage];
  char v3 = [v2 disabledSlotBackgroundColor];

  return (UIColor *)v3;
}

- (UIColor)disabledSlotTitleColor
{
  id v2 = [(WFSlotTemplateView *)self textStorage];
  char v3 = [v2 disabledSlotTitleColor];

  return (UIColor *)v3;
}

- (void)setHorizontalPadding:(double)a3
{
  if (self->_horizontalPadding != a3)
  {
    self->_horizontalPadding = a3;
    BOOL v5 = [(WFSlotTemplateView *)self textContainer];
    [v5 setLineFragmentPadding:a3];

    BOOL v6 = [(WFSlotTemplateView *)self typingTextView];
    BOOL v7 = [v6 textContainer];
    [v7 setLineFragmentPadding:a3];

    [(WFSlotTemplateView *)self updateTypingTextContainerSize];
    [(WFSlotTemplateView *)self updateAccessibilityElements];
    [(WFSlotTemplateView *)self invalidateIntrinsicContentSize];
    id v8 = [(WFSlotTemplateView *)self typingSlotIdentifier];

    if (v8)
    {
      id v9 = [(WFSlotTemplateView *)self typingSlotIdentifier];
      id v11 = [(WFSlotTemplateView *)self slotWithIdentifier:v9];

      id v10 = v11;
      if (v11)
      {
        [(WFSlotTemplateView *)self positionTypingAboveSlot:v11];
        id v10 = v11;
      }
    }
  }
}

- (id)typingParagraphStyleForParagraphStyle:(id)a3
{
  char v3 = [(WFSlotTemplateView *)self paragraphStyle];
  id v4 = (void *)[v3 mutableCopy];

  [v4 setAlignment:4];
  return v4;
}

- (void)updateTypingParagraphStyle
{
  id v9 = [(WFSlotTemplateView *)self paragraphStyle];
  char v3 = [(WFSlotTemplateView *)self typingTextStorage];
  [v3 setParagraphStyle:v9];

  id v4 = [(WFSlotTemplateView *)self typingTextView];
  BOOL v5 = [v4 typingAttributes];
  BOOL v6 = (void *)[v5 mutableCopy];

  BOOL v7 = [(WFSlotTemplateView *)self typingParagraphStyleForParagraphStyle:v9];
  [v6 setObject:v7 forKey:*MEMORY[0x263F81540]];

  id v8 = [(WFSlotTemplateView *)self typingTextView];
  [v8 setTypingAttributes:v6];
}

- (void)setTextColor:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(WFSlotTemplateView *)self textStorage];
  BOOL v6 = [v5 textColor];
  id v10 = v4;
  id v7 = v6;
  if (v7 == v10)
  {

LABEL_9:
    id v9 = v10;
    goto LABEL_10;
  }
  if (!v10 || !v7)
  {

    goto LABEL_8;
  }
  char v8 = [v10 isEqual:v7];

  id v9 = v10;
  if ((v8 & 1) == 0)
  {
LABEL_8:
    BOOL v5 = [(WFSlotTemplateView *)self textStorage];
    [v5 setTextColor:v10];
    goto LABEL_9;
  }
LABEL_10:
}

- (void)updateTypingUnpopulatedFont
{
  id v4 = [(WFSlotTemplateView *)self unpopulatedFont];
  char v3 = [(WFSlotTemplateView *)self typingTextStorage];
  [v3 setUnpopulatedFont:v4];
}

- (void)setUnpopulatedFont:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(WFSlotTemplateView *)self textStorage];
  BOOL v6 = [v5 unpopulatedFont];
  id v10 = v4;
  id v7 = v6;
  if (v7 == v10)
  {

    goto LABEL_9;
  }
  if (!v10 || !v7)
  {

    goto LABEL_8;
  }
  char v8 = [v10 isEqual:v7];

  if ((v8 & 1) == 0)
  {
LABEL_8:
    id v9 = [(WFSlotTemplateView *)self textStorage];
    [v9 setUnpopulatedFont:v10];

    [(WFSlotTemplateView *)self updateTypingUnpopulatedFont];
  }
LABEL_9:
}

- (void)updateVariableAttachmentAppearanceInContents
{
  char v3 = [(WFSlotTemplateView *)self textStorage];
  [v3 beginEditing];

  id v4 = [(WFSlotTemplateView *)self textStorage];
  uint64_t v5 = *MEMORY[0x263F814A0];
  BOOL v6 = [(WFSlotTemplateView *)self textStorage];
  uint64_t v7 = [v6 length];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __66__WFSlotTemplateView_updateVariableAttachmentAppearanceInContents__block_invoke;
  v9[3] = &unk_264BFD488;
  v9[4] = self;
  objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", v5, 0, v7, 0, v9);

  char v8 = [(WFSlotTemplateView *)self textStorage];
  [v8 endEditing];
}

void __66__WFSlotTemplateView_updateVariableAttachmentAppearanceInContents__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }
  id v5 = v4;
  BOOL v6 = [*(id *)(a1 + 32) font];
  [v5 setFont:v6];

  uint64_t v7 = [*(id *)(a1 + 32) tintColor];
  [v5 setTintColor:v7];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __66__WFSlotTemplateView_updateVariableAttachmentAppearanceInContents__block_invoke_2;
  v13[3] = &unk_264BFDBA0;
  v13[4] = *(void *)(a1 + 32);
  [v5 setFixUpBlock:v13];
  char v8 = [v5 containingSlotIdentifier];
  if (v8)
  {
    id v9 = [*(id *)(a1 + 32) slotWithIdentifier:v8];
    if ([v9 standaloneTextAttachment])
    {
      id v10 = [*(id *)(a1 + 32) highlightedSlotIdentifier];
      id v11 = v8;
      if (v10 == v11)
      {
        uint64_t v12 = 1;
      }
      else if (v10)
      {
        uint64_t v12 = [v10 isEqual:v11];
      }
      else
      {
        uint64_t v12 = 0;
      }

      [v5 setHighlighted:v12];
    }
    else
    {
      [v5 setHighlighted:0];
    }
  }
  else
  {
    [v5 setHighlighted:0];
  }
}

void __66__WFSlotTemplateView_updateVariableAttachmentAppearanceInContents__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) textStorage];
  [v2 beginEditing];

  id v3 = [*(id *)(a1 + 32) textStorage];
  [v3 endEditing];
}

- (void)updateTypingFont
{
  id v9 = [(WFSlotTemplateView *)self font];
  id v3 = [(WFSlotTemplateView *)self typingTextStorage];
  [v3 setFont:v9];

  id v4 = [(WFSlotTemplateView *)self typingTextView];
  id v5 = [v4 typingAttributes];
  BOOL v6 = (void *)[v5 mutableCopy];

  [v6 setObject:v9 forKey:*MEMORY[0x263F814F0]];
  uint64_t v7 = [(WFSlotTemplateView *)self typingTextView];
  [v7 setTypingAttributes:v6];

  char v8 = [(WFSlotTemplateView *)self typingTextView];
  [v8 setEmojiOverrideFont:v9];
}

- (void)setFont:(id)a3
{
  id v4 = a3;
  id v5 = [(WFSlotTemplateView *)self textStorage];
  BOOL v6 = [v5 font];
  id v10 = v4;
  id v7 = v6;
  if (v7 == v10)
  {

    goto LABEL_9;
  }
  if (!v10 || !v7)
  {

    goto LABEL_8;
  }
  char v8 = [v10 isEqual:v7];

  if ((v8 & 1) == 0)
  {
LABEL_8:
    id v9 = [(WFSlotTemplateView *)self textStorage];
    [v9 setFont:v10];

    [(WFSlotTemplateView *)self updateTypingFont];
    [(WFSlotTemplateView *)self updateVariableAttachmentAppearanceInContents];
  }
LABEL_9:
}

- (void)setParagraphStyle:(id)a3
{
  id v4 = a3;
  id v5 = [(WFSlotTemplateView *)self textStorage];
  BOOL v6 = [v5 paragraphStyle];
  id v10 = v4;
  id v7 = v6;
  if (v7 == v10)
  {

    goto LABEL_9;
  }
  if (!v10 || !v7)
  {

    goto LABEL_8;
  }
  char v8 = [v10 isEqual:v7];

  if ((v8 & 1) == 0)
  {
LABEL_8:
    id v9 = [(WFSlotTemplateView *)self textStorage];
    [v9 setParagraphStyle:v10];

    [(WFSlotTemplateView *)self updateTypingParagraphStyle];
  }
LABEL_9:
}

- (NSParagraphStyle)paragraphStyle
{
  id v2 = [(WFSlotTemplateView *)self textStorage];
  id v3 = [v2 paragraphStyle];

  return (NSParagraphStyle *)v3;
}

- (void)setTextAlignment:(int64_t)a3
{
  if ([(WFSlotTemplateView *)self textAlignment] != a3)
  {
    id v5 = [(id)objc_opt_class() paragraphStyleWithAlignment:a3];
    [(WFSlotTemplateView *)self setParagraphStyle:v5];
  }
}

- (int64_t)textAlignment
{
  id v2 = [(WFSlotTemplateView *)self paragraphStyle];
  int64_t v3 = [v2 alignment];

  return v3;
}

- (UIColor)textColor
{
  id v2 = [(WFSlotTemplateView *)self textStorage];
  int64_t v3 = [v2 textColor];

  return (UIColor *)v3;
}

- (UIFont)unpopulatedFont
{
  id v2 = [(WFSlotTemplateView *)self textStorage];
  int64_t v3 = [v2 unpopulatedFont];

  return (UIFont *)v3;
}

- (UIFont)font
{
  id v2 = [(WFSlotTemplateView *)self textStorage];
  int64_t v3 = [v2 font];

  return (UIFont *)v3;
}

- (void)setupTextEntry
{
  id v3 = objc_alloc(MEMORY[0x263F81680]);
  [(WFSlotTemplateView *)self frame];
  BOOL v6 = (NSTextContainer *)objc_msgSend(v3, "initWithSize:", v4, v5);
  [(NSTextContainer *)self->_textContainer lineFragmentPadding];
  -[NSTextContainer setLineFragmentPadding:](v6, "setLineFragmentPadding:");
  typingTextContainer = self->_typingTextContainer;
  self->_typingTextContainer = v6;
  char v8 = v6;

  id v9 = objc_alloc_init(WFSlotTemplateLayoutManager);
  [(WFSlotTemplateLayoutManager *)v9 setIsLayoutManagerForTextView:1];
  [(WFSlotTemplateLayoutManager *)v9 addTextContainer:v8];
  typingLayoutManager = self->_typingLayoutManager;
  self->_typingLayoutManager = v9;
  id v11 = v9;

  uint64_t v12 = objc_alloc_init(WFSlotTemplateTextStorage);
  [(WFSlotTemplateTextStorage *)v12 addLayoutManager:v11];
  typingTextStorage = self->_typingTextStorage;
  self->_typingTextStorage = v12;
  double v14 = v12;

  id v15 = [WFSlotTemplateTypingTextView alloc];
  [(WFSlotTemplateView *)self bounds];
  id v16 = -[WFSlotTemplateTypingTextView initWithFrame:textContainer:](v15, "initWithFrame:textContainer:", v8);
  uint64_t v17 = [MEMORY[0x263F825C8] clearColor];
  [(WFSlotTemplateTypingTextView *)v16 setBackgroundColor:v17];

  [(WFSlotTemplateTypingTextView *)v16 setAutoresizingMask:18];
  [(WFSlotTemplateTypingTextView *)v16 setScrollEnabled:0];
  [(WFSlotTemplateTypingTextView *)v16 setScrollsToTop:0];
  [(WFSlotTemplateTypingTextView *)v16 setDelegate:self];
  [(WFSlotTemplateTypingTextView *)v16 setHidden:1];
  [(WFSlotTemplateView *)self insertSubview:v16 atIndex:0];
  typingTextView = self->_typingTextView;
  self->_typingTextView = v16;
  long long v19 = v16;

  [(WFSlotTemplateLayoutManager *)v11 wf_setControlView:v19];
  id v20 = objc_alloc_init(MEMORY[0x263F879C8]);
  [v20 setDelegate:self];
  [v20 setTextContainer:v8];
  [(WFSlotTemplateTypingTextView *)v19 addInteraction:v20];
  typingAttachmentInteraction = self->_typingAttachmentInteraction;
  self->_typingAttachmentInteraction = (WFTextAttachmentInteraction *)v20;

  [(WFSlotTemplateView *)self updateTypingFont];
  [(WFSlotTemplateView *)self updateTypingUnpopulatedFont];
  [(WFSlotTemplateView *)self updateTypingParagraphStyle];
}

- (WFSlotTemplateView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  v21.receiver = self;
  v21.super_class = (Class)WFSlotTemplateView;
  double v5 = -[WFSlotTemplateView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  BOOL v6 = v5;
  if (v5)
  {
    [(WFSlotTemplateView *)v5 setContextMenuInteractionEnabled:1];
    [(WFSlotTemplateView *)v6 setShowsMenuAsPrimaryAction:1];
    [(WFSlotTemplateView *)v6 setEnabled:1];
    [(WFSlotTemplateView *)v6 setContentMode:5];
    id v7 = [MEMORY[0x263F825C8] clearColor];
    [(WFSlotTemplateView *)v6 setBackgroundColor:v7];

    char v8 = (NSTextContainer *)objc_msgSend(objc_alloc(MEMORY[0x263F81680]), "initWithSize:", width, height);
    textContainer = v6->_textContainer;
    v6->_textContainer = v8;
    id v10 = v8;

    id v11 = objc_alloc_init(WFSlotTemplateLayoutManager);
    [(WFSlotTemplateLayoutManager *)v11 addTextContainer:v10];
    [(WFSlotTemplateLayoutManager *)v11 wf_setControlView:v6];
    layoutManager = v6->_layoutManager;
    v6->_layoutManager = v11;
    double v13 = v11;

    double v14 = objc_alloc_init(WFSlotTemplateTextStorage);
    [(WFSlotTemplateTextStorage *)v14 setDelegate:v6];
    [(WFSlotTemplateTextStorage *)v14 addLayoutManager:v13];
    textStorage = v6->_textStorage;
    v6->_textStorage = v14;
    id v16 = v14;

    [(WFSlotTemplateView *)v6 updateTintColorInTextStorage];
    [(WFSlotTemplateView *)v6 setTextAlignment:4];
    uint64_t v17 = objc_opt_new();
    cachedHeightsByWidths = v6->_cachedHeightsByWidths;
    v6->_cachedHeightsByWidths = (NSMutableDictionary *)v17;

    long long v19 = v6;
  }

  return v6;
}

+ (double)heightForWidth:(double)a3 withContents:(id)a4 horizontalPadding:(double)a5 font:(id)a6 unpopulatedFont:(id)a7 alignment:(int64_t)a8
{
  id v14 = a7;
  id v15 = a6;
  id v16 = a4;
  uint64_t v17 = [a1 paragraphStyleWithAlignment:a8];
  id v18 = objc_alloc_init(WFSlotTemplateTextStorage);
  [(WFSlotTemplateTextStorage *)v18 setFont:v15];

  [(WFSlotTemplateTextStorage *)v18 setUnpopulatedFont:v14];
  [(WFSlotTemplateTextStorage *)v18 setParagraphStyle:v17];
  [(WFSlotTemplateTextStorage *)v18 setContents:v16];

  long long v19 = objc_alloc_init(WFSlotTemplateLayoutManager);
  [(WFSlotTemplateTextStorage *)v18 addLayoutManager:v19];
  id v20 = objc_msgSend(objc_alloc(MEMORY[0x263F81680]), "initWithSize:", a3, 1.79769313e308);
  [v20 setLineFragmentPadding:a5];
  [(WFSlotTemplateLayoutManager *)v19 addTextContainer:v20];
  [(WFSlotTemplateLayoutManager *)v19 ensureLayoutForTextContainer:v20];
  [(WFSlotTemplateLayoutManager *)v19 usedRectForTextContainer:v20];
  CGFloat v22 = v21;
  uint64_t v23 = [(WFSlotTemplateLayoutManager *)v19 glyphRangeForTextContainer:v20];
  -[WFSlotTemplateLayoutManager boundingRectForGlyphRange:inTextContainer:](v19, "boundingRectForGlyphRange:inTextContainer:", v23, v24, v20);
  v29.size.double height = v26 - v25;
  v29.origin.CGFloat x = 0.0;
  v29.origin.CGFloat y = 0.0;
  v32.origin.CGFloat x = 0.0;
  v32.origin.CGFloat y = 0.0;
  v29.size.double width = v22;
  v32.size.double width = a3;
  v32.size.double height = 1.79769313e308;
  CGRect v30 = CGRectIntersection(v29, v32);
  CGRect v31 = CGRectIntegral(v30);
  double height = v31.size.height;

  return height;
}

+ (id)paragraphStyleWithAlignment:(int64_t)a3
{
  double v4 = [MEMORY[0x263F81658] defaultParagraphStyle];
  double v5 = (void *)[v4 mutableCopy];

  [v5 setLineHeightMultiple:1.29999995];
  [v5 setAlignment:a3];
  return v5;
}

@end