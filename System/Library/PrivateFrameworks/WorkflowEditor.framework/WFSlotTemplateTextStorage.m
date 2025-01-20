@interface WFSlotTemplateTextStorage
- (BOOL)isEnabled;
- (BOOL)slotContainsStrongRTL:(id)a3;
- (NSArray)contents;
- (NSMutableSet)mutableHighlightedSlots;
- (NSMutableSet)mutableSelectedSlots;
- (NSMutableSet)mutableTypingSlots;
- (NSParagraphStyle)paragraphStyle;
- (NSSet)highlightedSlots;
- (NSSet)selectedSlots;
- (NSSet)typingSlots;
- (NSTextAttachment)disclosureAttachment;
- (NSTextAttachment)outputButtonAttachment;
- (NSTextStorage)textStorage;
- (UIColor)disabledSlotBackgroundColor;
- (UIColor)disabledSlotTitleColor;
- (UIColor)textColor;
- (UIColor)tintColor;
- (UIFont)font;
- (UIFont)unpopulatedFont;
- (WFSlotTemplateTextStorage)init;
- (_NSRange)characterRangeForSlot:(id)a3 includingInsideSpacingOpportunities:(BOOL)a4;
- (id)attributedStringForSlot:(id)a3 isRTL:(BOOL)a4;
- (id)attributesAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4;
- (id)slotAtCharacterIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4 effectiveContentRange:(_NSRange *)a5;
- (id)string;
- (id)stringForSlotSpacingOpportunity:(unint64_t)a3;
- (int64_t)contentsTextAlignment;
- (unint64_t)editingLevel;
- (unint64_t)slotSpacingOpportunityAtCharacterIndex:(unint64_t)a3;
- (void)_updateColorsForSlot:(id)a3 inRange:(_NSRange)a4;
- (void)beginEditing;
- (void)didBeginTypingInSlot:(id)a3;
- (void)didDeselectSlot:(id)a3;
- (void)didEndTypingInSlot:(id)a3;
- (void)didHighlightSlot:(id)a3;
- (void)didSelectSlot:(id)a3;
- (void)didUnhighlightSlot:(id)a3;
- (void)endEditing;
- (void)enumerateContentInRange:(_NSRange)a3 usingBlock:(id)a4;
- (void)getColorsForSlot:(id)a3 titleColor:(id *)a4 backgroundColor:(id *)a5;
- (void)regenerateEntireAttributedString;
- (void)replaceAttribute:(id)a3 value:(id)a4 range:(_NSRange)a5;
- (void)replaceAttributeInInanimateText:(id)a3 value:(id)a4;
- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4;
- (void)setAttributes:(id)a3 range:(_NSRange)a4;
- (void)setContents:(id)a3;
- (void)setDisabledSlotTitleColor:(id)a3 backgroundColor:(id)a4;
- (void)setDisclosureAttachment:(id)a3;
- (void)setEditingLevel:(unint64_t)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFont:(id)a3;
- (void)setOutputButtonAttachment:(id)a3;
- (void)setParagraphStyle:(id)a3;
- (void)setTextColor:(id)a3;
- (void)setTintColor:(id)a3;
- (void)setUnpopulatedFont:(id)a3;
- (void)updateColorsForAllSlots;
- (void)updateColorsForSlot:(id)a3;
@end

@implementation WFSlotTemplateTextStorage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableTypingSlots, 0);
  objc_storeStrong((id *)&self->_mutableSelectedSlots, 0);
  objc_storeStrong((id *)&self->_mutableHighlightedSlots, 0);
  objc_storeStrong((id *)&self->_textStorage, 0);
  objc_storeStrong((id *)&self->_outputButtonAttachment, 0);
  objc_storeStrong((id *)&self->_disclosureAttachment, 0);
  objc_storeStrong((id *)&self->_contents, 0);
  objc_storeStrong((id *)&self->_disabledSlotBackgroundColor, 0);
  objc_storeStrong((id *)&self->_disabledSlotTitleColor, 0);
  objc_storeStrong((id *)&self->_paragraphStyle, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_unpopulatedFont, 0);
  objc_storeStrong((id *)&self->_font, 0);
}

- (void)setEditingLevel:(unint64_t)a3
{
  self->_editingLevel = a3;
}

- (unint64_t)editingLevel
{
  return self->_editingLevel;
}

- (NSMutableSet)mutableTypingSlots
{
  return self->_mutableTypingSlots;
}

- (NSMutableSet)mutableSelectedSlots
{
  return self->_mutableSelectedSlots;
}

- (NSMutableSet)mutableHighlightedSlots
{
  return self->_mutableHighlightedSlots;
}

- (NSTextStorage)textStorage
{
  return self->_textStorage;
}

- (NSTextAttachment)outputButtonAttachment
{
  return self->_outputButtonAttachment;
}

- (NSTextAttachment)disclosureAttachment
{
  return self->_disclosureAttachment;
}

- (int64_t)contentsTextAlignment
{
  return self->_contentsTextAlignment;
}

- (NSArray)contents
{
  return self->_contents;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)enumerateContentInRange:(_NSRange)a3 usingBlock:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __64__WFSlotTemplateTextStorage_enumerateContentInRange_usingBlock___block_invoke;
  v9[3] = &unk_264BFCF88;
  v9[4] = self;
  id v10 = v7;
  id v8 = v7;
  [(WFSlotTemplateTextStorage *)self enumerateAttribute:@"WFSlot", location, length, 0, v9 inRange options usingBlock];
}

void __64__WFSlotTemplateTextStorage_enumerateContentInRange_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v17 = a2;
  if (v17)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else if (a4)
  {
    uint64_t v9 = [*(id *)(a1 + 32) slotSpacingOpportunityAtCharacterIndex:a3];
    uint64_t v10 = [*(id *)(a1 + 32) slotSpacingOpportunityAtCharacterIndex:a4 + a3 - 1];
    uint64_t v11 = a4 - (v9 != 0);
    uint64_t v12 = v10 != 0;
    uint64_t v13 = v11 - v12;
    if (v11 != v12)
    {
      if (v9) {
        ++a3;
      }
      uint64_t v14 = *(void *)(a1 + 40);
      v15 = objc_msgSend(*(id *)(a1 + 32), "attributedSubstringFromRange:", a3, v11 - v12);
      v16 = [v15 string];
      (*(void (**)(uint64_t, void *, uint64_t, uint64_t, uint64_t))(v14 + 16))(v14, v16, a3, v13, a5);
    }
  }
}

- (id)slotAtCharacterIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4 effectiveContentRange:(_NSRange *)a5
{
  uint64_t v9 = (void *)[(WFSlotTemplateTextStorage *)self length];
  if (v9)
  {
    if ([(WFSlotTemplateTextStorage *)self length] - 1 >= a3)
    {
      int64x2_t v11 = (int64x2_t)xmmword_234B79650;
      uint64_t v9 = [(WFSlotTemplateTextStorage *)self attribute:@"WFSlot", a3, &v11, 0, [(WFSlotTemplateTextStorage *)self length] atIndex longestEffectiveRange inRange];
      if (v9)
      {
        if (a4) {
          *a4 = (_NSRange)v11;
        }
        if (a5) {
          *(int64x2_t *)a5 = vaddq_s64(v11, (int64x2_t)xmmword_234B795B0);
        }
      }
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  return v9;
}

- (_NSRange)characterRangeForSlot:(id)a3 includingInsideSpacingOpportunities:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if (!v7)
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"WFSlotTemplateTextStorage.m", 566, @"Invalid parameter not satisfying: %@", @"slotToFind" object file lineNumber description];
  }
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3010000000;
  v22 = &unk_234BA41F7;
  long long v23 = xmmword_234B795C0;
  uint64_t v8 = [(WFSlotTemplateTextStorage *)self length];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __87__WFSlotTemplateTextStorage_characterRangeForSlot_includingInsideSpacingOpportunities___block_invoke;
  v16[3] = &unk_264BFCF60;
  id v9 = v7;
  id v17 = v9;
  v18 = &v19;
  [(WFSlotTemplateTextStorage *)self enumerateAttribute:@"WFSlot", 0, v8, 0, v16 inRange options usingBlock];
  uint64_t v10 = v20;
  NSUInteger v11 = v20[4];
  if (v4)
  {
    uint64_t v12 = v20[5];
  }
  else
  {
    v11 += 2;
    uint64_t v12 = v20[5] - 4;
    v20[4] = v11;
    v10[5] = v12;
  }

  _Block_object_dispose(&v19, 8);
  NSUInteger v13 = v11;
  NSUInteger v14 = v12;
  result.NSUInteger length = v14;
  result.NSUInteger location = v13;
  return result;
}

uint64_t __87__WFSlotTemplateTextStorage_characterRangeForSlot_includingInsideSpacingOpportunities___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t result = [a2 isEqual:*(void *)(a1 + 32)];
  if (result)
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    *(void *)(v10 + 32) = a3;
    *(void *)(v10 + 40) = a4;
    *a5 = 1;
  }
  return result;
}

- (unint64_t)slotSpacingOpportunityAtCharacterIndex:(unint64_t)a3
{
  v5 = [(WFSlotTemplateTextStorage *)self string];
  unint64_t v6 = 1;
  id v7 = objc_msgSend(v5, "substringWithRange:", a3, 1);

  uint64_t v8 = [(WFSlotTemplateTextStorage *)self stringForSlotSpacingOpportunity:1];
  char v9 = [v7 isEqualToString:v8];

  if ((v9 & 1) == 0)
  {
    uint64_t v10 = [(WFSlotTemplateTextStorage *)self stringForSlotSpacingOpportunity:2];
    int v11 = [v7 isEqualToString:v10];

    if (v11) {
      unint64_t v6 = 2;
    }
    else {
      unint64_t v6 = 0;
    }
  }

  return v6;
}

- (id)stringForSlotSpacingOpportunity:(unint64_t)a3
{
  if (a3 == 1)
  {
    uint64_t v4 = 145;
LABEL_5:
    v5 = objc_msgSend(NSString, "stringWithFormat:", @"%C", v4);
    return v5;
  }
  if (a3 == 2)
  {
    uint64_t v4 = 146;
    goto LABEL_5;
  }
  v5 = 0;
  return v5;
}

- (void)_updateColorsForSlot:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v10 = 0;
  int v11 = 0;
  [(WFSlotTemplateTextStorage *)self getColorsForSlot:a3 titleColor:&v11 backgroundColor:&v10];
  id v7 = v11;
  id v8 = v10;
  id v9 = v7;
  [(WFSlotTemplateTextStorage *)self beginEditing];
  -[WFSlotTemplateTextStorage replaceAttribute:value:range:](self, "replaceAttribute:value:range:", *MEMORY[0x263F814A8], v8, location, length);
  -[WFSlotTemplateTextStorage replaceAttribute:value:range:](self, "replaceAttribute:value:range:", *MEMORY[0x263F81500], v9, location, length);

  [(WFSlotTemplateTextStorage *)self endEditing];
}

- (void)updateColorsForAllSlots
{
  [(WFSlotTemplateTextStorage *)self beginEditing];
  uint64_t v3 = [(WFSlotTemplateTextStorage *)self length];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __52__WFSlotTemplateTextStorage_updateColorsForAllSlots__block_invoke;
  v4[3] = &unk_264BFD890;
  v4[4] = self;
  [(WFSlotTemplateTextStorage *)self enumerateAttribute:@"WFSlot", 0, v3, 0, v4 inRange options usingBlock];
  [(WFSlotTemplateTextStorage *)self endEditing];
}

uint64_t __52__WFSlotTemplateTextStorage_updateColorsForAllSlots__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2) {
    return objc_msgSend(*(id *)(result + 32), "_updateColorsForSlot:inRange:", a2, a3, a4);
  }
  return result;
}

- (void)updateColorsForSlot:(id)a3
{
  id v9 = a3;
  uint64_t v5 = -[WFSlotTemplateTextStorage characterRangeForSlot:includingInsideSpacingOpportunities:](self, "characterRangeForSlot:includingInsideSpacingOpportunities:");
  uint64_t v7 = v6;
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"WFSlotTemplateTextStorage.m" lineNumber:517 description:@"Tried to update colors for a slot that doesn't exist"];
  }
  -[WFSlotTemplateTextStorage _updateColorsForSlot:inRange:](self, "_updateColorsForSlot:inRange:", v9, v5, v7);
}

- (void)getColorsForSlot:(id)a3 titleColor:(id *)a4 backgroundColor:(id *)a5
{
  id v22 = a3;
  id v8 = [(WFSlotTemplateTextStorage *)self highlightedSlots];
  int v9 = [v8 containsObject:v22];

  id v10 = [(WFSlotTemplateTextStorage *)self selectedSlots];
  int v11 = [v10 containsObject:v22];

  uint64_t v12 = [(WFSlotTemplateTextStorage *)self typingSlots];
  char v13 = [v12 containsObject:v22];

  if ([(WFSlotTemplateTextStorage *)self isEnabled]) {
    char v14 = [v22 isEnabled];
  }
  else {
    char v14 = 0;
  }
  char v15 = [v22 isInvalid];
  v16 = [(WFSlotTemplateTextStorage *)self tintColor];
  if ((v13 & 1) == 0)
  {
    if (v11)
    {
      if (v15)
      {
        id v17 = objc_msgSend(MEMORY[0x263F825C8], "wf_slotTemplateSlotErrorSelectedTitleColor");
        objc_msgSend(MEMORY[0x263F825C8], "wf_slotTemplateSlotErrorSelectedBackgroundColor");
      }
      else
      {
        id v17 = objc_msgSend(MEMORY[0x263F825C8], "wf_slotTemplateSlotSelectedTitleColorWithTintColor:", v16);
        objc_msgSend(MEMORY[0x263F825C8], "wf_slotTemplateSlotSelectedBackgroundColorWithTintColor:", v16);
      }
    }
    else
    {
      if ((v14 & 1) == 0)
      {
        id v17 = [(WFSlotTemplateTextStorage *)self disabledSlotTitleColor];
        uint64_t v20 = [(WFSlotTemplateTextStorage *)self disabledSlotBackgroundColor];
        goto LABEL_21;
      }
      if (v9)
      {
        if (v15)
        {
          id v17 = objc_msgSend(MEMORY[0x263F825C8], "wf_slotTemplateSlotErrorHighlightedTitleColor");
          objc_msgSend(MEMORY[0x263F825C8], "wf_slotTemplateSlotErrorHighlightedBackgroundColor");
        }
        else
        {
          id v17 = objc_msgSend(MEMORY[0x263F825C8], "wf_slotTemplateSlotHighlightedTitleColorWithTintColor:", v16);
          objc_msgSend(MEMORY[0x263F825C8], "wf_slotTemplateSlotHighlightedBackgroundColorWithTintColor:", v16);
        }
      }
      else if (v15)
      {
        id v17 = objc_msgSend(MEMORY[0x263F825C8], "wf_slotTemplateSlotErrorTitleColor");
        objc_msgSend(MEMORY[0x263F825C8], "wf_slotTemplateSlotErrorBackgroundColor");
      }
      else
      {
        id v17 = objc_msgSend(MEMORY[0x263F825C8], "wf_slotTemplateSlotTitleColorWithTintColor:", v16);
        objc_msgSend(MEMORY[0x263F825C8], "wf_slotTemplateSlotBackgroundColorWithTintColor:", v16);
      }
    uint64_t v20 = };
LABEL_21:
    v18 = (void *)v20;
    if ([v22 isPopulated]) {
      goto LABEL_24;
    }
    goto LABEL_22;
  }
  id v17 = objc_msgSend(MEMORY[0x263F825C8], "wf_slotTemplateSlotTypingTitleColor");
  v18 = objc_msgSend(MEMORY[0x263F825C8], "wf_slotTemplateSlotTypingBackgroundColor");
  if (([v22 isPopulated] & 1) == 0)
  {
LABEL_22:
    uint64_t v19 = [v17 colorWithAlphaComponent:0.4];
    goto LABEL_23;
  }
  uint64_t v19 = [MEMORY[0x263F825C8] clearColor];
LABEL_23:
  uint64_t v21 = (void *)v19;

  id v17 = v21;
LABEL_24:
  if (a4) {
    *a4 = v17;
  }
  if (a5) {
    *a5 = v18;
  }
}

- (id)attributedStringForSlot:(id)a3 isRTL:(BOOL)a4
{
  BOOL v4 = a4;
  v42[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x263F089B8]);
  uint64_t v8 = [(WFSlotTemplateTextStorage *)self stringForSlotSpacingOpportunity:1];
  int v9 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v8];
  [v7 appendAttributedString:v9];

  id v10 = objc_alloc(MEMORY[0x263F086A0]);
  uint64_t v11 = 8295;
  if (!v4) {
    uint64_t v11 = 8296;
  }
  uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"%C", v11);
  uint64_t v13 = [v10 initWithString:v12];

  v36 = (void *)v13;
  [v7 appendAttributedString:v13];
  char v14 = [v6 contentAttributedString];
  if ([v14 length])
  {
    uint64_t v15 = *MEMORY[0x263F814A0];
    uint64_t v16 = [v14 length];
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __59__WFSlotTemplateTextStorage_attributedStringForSlot_isRTL___block_invoke;
    v40[3] = &unk_264BFD488;
    v40[4] = self;
    objc_msgSend(v14, "enumerateAttribute:inRange:options:usingBlock:", v15, 0, v16, 0, v40);
    goto LABEL_10;
  }
  id v17 = [v6 localizedPlaceholder];
  uint64_t v18 = [v17 length];

  if (v18)
  {
    id v19 = objc_alloc(MEMORY[0x263F086A0]);
    uint64_t v20 = [v6 localizedPlaceholder];
  }
  else
  {
    uint64_t v21 = [v6 localizedName];
    uint64_t v22 = [v21 length];

    if (!v22) {
      goto LABEL_10;
    }
    id v19 = objc_alloc(MEMORY[0x263F086A0]);
    uint64_t v20 = [v6 localizedName];
  }
  long long v23 = (void *)v20;
  uint64_t v24 = [v19 initWithString:v20];

  char v14 = (void *)v24;
LABEL_10:
  if ([v14 length]) {
    [v7 appendAttributedString:v14];
  }
  id v25 = objc_alloc(MEMORY[0x263F086A0]);
  v26 = objc_msgSend(NSString, "stringWithFormat:", @"%C", 8297);
  v27 = (void *)[v25 initWithString:v26];

  [v7 appendAttributedString:v27];
  v37 = (void *)v8;
  v28 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v8];
  [v7 appendAttributedString:v28];

  id v38 = 0;
  id v39 = 0;
  [(WFSlotTemplateTextStorage *)self getColorsForSlot:v6 titleColor:&v39 backgroundColor:&v38];
  id v29 = v39;
  id v30 = v38;
  v41[0] = *MEMORY[0x263F814F0];
  if ([v6 isPopulated]) {
    [(WFSlotTemplateTextStorage *)self font];
  }
  else {
  v31 = [(WFSlotTemplateTextStorage *)self unpopulatedFont];
  }
  v42[0] = v31;
  v41[1] = *MEMORY[0x263F81540];
  v32 = [(WFSlotTemplateTextStorage *)self paragraphStyle];
  v41[2] = @"WFSlot";
  v42[1] = v32;
  v42[2] = v6;
  v33 = [NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:3];
  v34 = (void *)[v33 mutableCopy];

  if (v29) {
    [v34 setObject:v29 forKeyedSubscript:*MEMORY[0x263F81500]];
  }
  if (v30) {
    [v34 setObject:v30 forKeyedSubscript:*MEMORY[0x263F814A8]];
  }
  objc_msgSend(v7, "addAttributes:range:", v34, 0, objc_msgSend(v7, "length"));

  return v7;
}

void __59__WFSlotTemplateTextStorage_attributedStringForSlot_isRTL___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v17 = v3;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    uint64_t v5 = *(void **)(a1 + 32);
    if (isKindOfClass)
    {
      id v6 = v17;
      id v7 = [v5 font];
      [v6 setFontForAlignment:v7];
    }
    else
    {
      id v7 = [v5 font];
      [v7 capHeight];
      double v9 = v8;
      id v6 = [v17 image];
      [v6 size];
      double v11 = (v9 - v10) * 0.5;
      uint64_t v12 = [v17 image];
      [v12 size];
      double v14 = v13;
      uint64_t v15 = [v17 image];
      [v15 size];
      objc_msgSend(v17, "setBounds:", 0.0, v11, v14, v16);
    }
    id v3 = v17;
  }
}

- (void)replaceAttributeInInanimateText:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(WFSlotTemplateTextStorage *)self beginEditing];
  uint64_t v8 = [(WFSlotTemplateTextStorage *)self length];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __67__WFSlotTemplateTextStorage_replaceAttributeInInanimateText_value___block_invoke;
  v11[3] = &unk_264BFCF38;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  -[WFSlotTemplateTextStorage enumerateAttributesInRange:options:usingBlock:](self, "enumerateAttributesInRange:options:usingBlock:", 0, v8, 0, v11);
  [(WFSlotTemplateTextStorage *)self endEditing];
}

void __67__WFSlotTemplateTextStorage_replaceAttributeInInanimateText_value___block_invoke(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = [a2 objectForKey:@"WFSlot"];

  if (!v7)
  {
    uint64_t v8 = (void *)a1[4];
    uint64_t v9 = a1[5];
    uint64_t v10 = a1[6];
    objc_msgSend(v8, "replaceAttribute:value:range:", v9, v10, a3, a4);
  }
}

- (void)replaceAttribute:(id)a3 value:(id)a4 range:(_NSRange)a5
{
  if (a4) {
    -[WFSlotTemplateTextStorage addAttribute:value:range:](self, "addAttribute:value:range:", a3, a4, a5.location, a5.length);
  }
  else {
    -[WFSlotTemplateTextStorage removeAttribute:range:](self, "removeAttribute:range:", a3, a5.location, a5.length);
  }
}

- (void)regenerateEntireAttributedString
{
  v35[2] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F089B8]);
  v34[0] = *MEMORY[0x263F81500];
  BOOL v4 = [(WFSlotTemplateTextStorage *)self textColor];
  v35[0] = v4;
  v34[1] = *MEMORY[0x263F814F0];
  uint64_t v5 = [(WFSlotTemplateTextStorage *)self font];
  v35[1] = v5;
  id v6 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:2];

  id v7 = [(WFSlotTemplateTextStorage *)self contents];
  v33 = [(WFSlotTemplateTextStorage *)self stringForSlotSpacingOpportunity:2];
  int v8 = 0;
  if ([v7 count])
  {
    unint64_t v9 = 0;
    v32 = v6;
    while (1)
    {
      uint64_t v10 = [v7 objectAtIndexedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = v10;
        BOOL v13 = [(WFSlotTemplateTextStorage *)self slotContainsStrongRTL:v12];
        if (v9)
        {
          double v14 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v33];
          [v3 appendAttributedString:v14];

          id v6 = v32;
        }
        v8 |= v13;
        uint64_t v15 = [(WFSlotTemplateTextStorage *)self attributedStringForSlot:v12 isRTL:v8 & 1];
        [v3 appendAttributedString:v15];
        if (v9 < [v7 count] - 1)
        {
          double v16 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v33];
          [v3 appendAttributedString:v16];

          id v6 = v32;
        }

        goto LABEL_11;
      }
LABEL_12:

      if (++v9 >= [v7 count]) {
        goto LABEL_13;
      }
    }
    id v11 = v10;
    v8 |= objc_msgSend(v11, "wf_hasStrongRTLCharacter");
    id v12 = (id)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v11 attributes:v6];

    [v3 appendAttributedString:v12];
LABEL_11:

    goto LABEL_12;
  }
LABEL_13:
  id v17 = [(WFSlotTemplateTextStorage *)self disclosureAttachment];
  if (v17)
  {
    id v18 = objc_alloc(MEMORY[0x263F086A0]);
    id v19 = objc_msgSend(NSString, "stringWithFormat:", @"%C", 160);
    uint64_t v20 = (void *)[v18 initWithString:v19];

    [v3 appendAttributedString:v20];
    uint64_t v21 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v17];
    [v3 appendAttributedString:v21];
  }
  uint64_t v22 = [(WFSlotTemplateTextStorage *)self outputButtonAttachment];
  if (v22)
  {
    id v23 = objc_alloc(MEMORY[0x263F086A0]);
    uint64_t v24 = objc_msgSend(NSString, "stringWithFormat:", @"%C", 160);
    id v25 = (void *)[v23 initWithString:v24];

    [v3 appendAttributedString:v25];
    v26 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v22];
    [v3 appendAttributedString:v26];
  }
  int64_t v27 = 2;
  if ((v8 & 1) == 0) {
    int64_t v27 = 0;
  }
  self->_contentsTextAlignment = v27;
  v28 = [(WFSlotTemplateTextStorage *)self paragraphStyle];
  uint64_t v29 = [v28 alignment];

  if (v29 == 4)
  {
    id v30 = [(WFSlotTemplateTextStorage *)self paragraphStyle];
    v31 = (void *)[v30 mutableCopy];

    [v31 setAlignment:self->_contentsTextAlignment];
    objc_msgSend(v3, "addAttribute:value:range:", *MEMORY[0x263F81540], v31, 0, objc_msgSend(v3, "length"));
  }
  [(WFSlotTemplateTextStorage *)self setAttributedString:v3];
}

- (BOOL)slotContainsStrongRTL:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 contentAttributedString];
  uint64_t v5 = [v4 string];

  if (![v5 length])
  {
    id v6 = [v3 localizedPlaceholder];
    id v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [v3 localizedName];
    }
    id v9 = v8;

    uint64_t v5 = v9;
  }
  char v10 = objc_msgSend(v5, "wf_hasStrongRTLCharacter");

  return v10;
}

- (void)didEndTypingInSlot:(id)a3
{
  id v10 = a3;
  if (!v10)
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"WFSlotTemplateTextStorage.m", 295, @"Invalid parameter not satisfying: %@", @"slot" object file lineNumber description];
  }
  uint64_t v5 = [(WFSlotTemplateTextStorage *)self contents];
  char v6 = [v5 containsObject:v10];

  if ((v6 & 1) == 0)
  {
    id v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"WFSlotTemplateTextStorage.m" lineNumber:296 description:@"Slot must be a member of the contents array"];
  }
  id v7 = [(WFSlotTemplateTextStorage *)self mutableTypingSlots];
  [v7 removeObject:v10];

  [(WFSlotTemplateTextStorage *)self updateColorsForSlot:v10];
}

- (void)didBeginTypingInSlot:(id)a3
{
  id v10 = a3;
  if (!v10)
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"WFSlotTemplateTextStorage.m", 288, @"Invalid parameter not satisfying: %@", @"slot" object file lineNumber description];
  }
  uint64_t v5 = [(WFSlotTemplateTextStorage *)self contents];
  char v6 = [v5 containsObject:v10];

  if ((v6 & 1) == 0)
  {
    id v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"WFSlotTemplateTextStorage.m" lineNumber:289 description:@"Slot must be a member of the contents array"];
  }
  id v7 = [(WFSlotTemplateTextStorage *)self mutableTypingSlots];
  [v7 addObject:v10];

  [(WFSlotTemplateTextStorage *)self updateColorsForSlot:v10];
}

- (NSSet)typingSlots
{
  v2 = [(WFSlotTemplateTextStorage *)self mutableTypingSlots];
  id v3 = (void *)[v2 copy];

  return (NSSet *)v3;
}

- (void)didDeselectSlot:(id)a3
{
  id v10 = a3;
  if (!v10)
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"WFSlotTemplateTextStorage.m", 275, @"Invalid parameter not satisfying: %@", @"slot" object file lineNumber description];
  }
  uint64_t v5 = [(WFSlotTemplateTextStorage *)self contents];
  char v6 = [v5 containsObject:v10];

  if ((v6 & 1) == 0)
  {
    id v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"WFSlotTemplateTextStorage.m" lineNumber:276 description:@"Slot must be a member of the contents array"];
  }
  id v7 = [(WFSlotTemplateTextStorage *)self mutableSelectedSlots];
  [v7 removeObject:v10];

  [(WFSlotTemplateTextStorage *)self updateColorsForSlot:v10];
}

- (void)didSelectSlot:(id)a3
{
  id v10 = a3;
  if (!v10)
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"WFSlotTemplateTextStorage.m", 268, @"Invalid parameter not satisfying: %@", @"slot" object file lineNumber description];
  }
  uint64_t v5 = [(WFSlotTemplateTextStorage *)self contents];
  char v6 = [v5 containsObject:v10];

  if ((v6 & 1) == 0)
  {
    id v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"WFSlotTemplateTextStorage.m" lineNumber:269 description:@"Slot must be a member of the contents array"];
  }
  id v7 = [(WFSlotTemplateTextStorage *)self mutableSelectedSlots];
  [v7 addObject:v10];

  [(WFSlotTemplateTextStorage *)self updateColorsForSlot:v10];
}

- (NSSet)selectedSlots
{
  v2 = [(WFSlotTemplateTextStorage *)self mutableSelectedSlots];
  id v3 = (void *)[v2 copy];

  return (NSSet *)v3;
}

- (void)didUnhighlightSlot:(id)a3
{
  id v10 = a3;
  if (!v10)
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"WFSlotTemplateTextStorage.m", 255, @"Invalid parameter not satisfying: %@", @"slot" object file lineNumber description];
  }
  uint64_t v5 = [(WFSlotTemplateTextStorage *)self contents];
  char v6 = [v5 containsObject:v10];

  if ((v6 & 1) == 0)
  {
    id v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"WFSlotTemplateTextStorage.m" lineNumber:256 description:@"Slot must be a member of the contents array"];
  }
  id v7 = [(WFSlotTemplateTextStorage *)self mutableHighlightedSlots];
  [v7 removeObject:v10];

  [(WFSlotTemplateTextStorage *)self updateColorsForSlot:v10];
}

- (void)didHighlightSlot:(id)a3
{
  id v10 = a3;
  if (!v10)
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"WFSlotTemplateTextStorage.m", 248, @"Invalid parameter not satisfying: %@", @"slot" object file lineNumber description];
  }
  uint64_t v5 = [(WFSlotTemplateTextStorage *)self contents];
  char v6 = [v5 containsObject:v10];

  if ((v6 & 1) == 0)
  {
    id v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"WFSlotTemplateTextStorage.m" lineNumber:249 description:@"Slot must be a member of the contents array"];
  }
  id v7 = [(WFSlotTemplateTextStorage *)self mutableHighlightedSlots];
  [v7 addObject:v10];

  [(WFSlotTemplateTextStorage *)self updateColorsForSlot:v10];
}

- (NSSet)highlightedSlots
{
  v2 = [(WFSlotTemplateTextStorage *)self mutableHighlightedSlots];
  id v3 = (void *)[v2 copy];

  return (NSSet *)v3;
}

- (void)setContents:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        if (([*(id *)(*((void *)&v15 + 1) + 8 * v9) conformsToProtocol:&unk_26E7E13B0] & 1) == 0)
        {
          id v10 = [MEMORY[0x263F08690] currentHandler];
          [v10 handleFailureInMethod:a2 object:self file:@"WFSlotTemplateTextStorage.m" lineNumber:231 description:@"The contents array may only contain NSString and WFSlotTemplateSlot objects."];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
  if (v5) {
    id v11 = (void *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:v5 copyItems:1];
  }
  else {
    id v11 = 0;
  }
  objc_storeStrong((id *)&self->_contents, v11);
  if (v5) {

  }
  id v12 = [(WFSlotTemplateTextStorage *)self mutableHighlightedSlots];
  [v12 removeAllObjects];

  BOOL v13 = [(WFSlotTemplateTextStorage *)self mutableSelectedSlots];
  [v13 removeAllObjects];

  double v14 = [(WFSlotTemplateTextStorage *)self mutableTypingSlots];
  [v14 removeAllObjects];

  [(WFSlotTemplateTextStorage *)self regenerateEntireAttributedString];
}

- (void)setDisabledSlotTitleColor:(id)a3 backgroundColor:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  objc_storeStrong((id *)&self->_disabledSlotTitleColor, a3);
  objc_storeStrong((id *)&self->_disabledSlotBackgroundColor, a4);
  if ([(WFSlotTemplateTextStorage *)self isEnabled])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v9 = [(WFSlotTemplateTextStorage *)self contents];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          double v14 = *(void **)(*((void *)&v16 + 1) + 8 * v13);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v15 = v14;
            if (([v15 isEnabled] & 1) == 0) {
              [(WFSlotTemplateTextStorage *)self updateColorsForSlot:v15];
            }
          }
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }
  }
  else
  {
    [(WFSlotTemplateTextStorage *)self updateColorsForAllSlots];
  }
}

- (UIColor)disabledSlotBackgroundColor
{
  disabledSlotBackgroundColor = self->_disabledSlotBackgroundColor;
  if (!disabledSlotBackgroundColor)
  {
    objc_msgSend(MEMORY[0x263F825C8], "wf_tertiarySystemGroupedBackgroundColor");
    BOOL v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
    id v5 = self->_disabledSlotBackgroundColor;
    self->_disabledSlotBackgroundColor = v4;

    disabledSlotBackgroundColor = self->_disabledSlotBackgroundColor;
  }
  return disabledSlotBackgroundColor;
}

- (UIColor)disabledSlotTitleColor
{
  disabledSlotTitleColor = self->_disabledSlotTitleColor;
  if (!disabledSlotTitleColor)
  {
    objc_msgSend(MEMORY[0x263F825C8], "wf_labelColor");
    BOOL v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
    id v5 = self->_disabledSlotTitleColor;
    self->_disabledSlotTitleColor = v4;

    disabledSlotTitleColor = self->_disabledSlotTitleColor;
  }
  return disabledSlotTitleColor;
}

- (void)setOutputButtonAttachment:(id)a3
{
  id v5 = (NSTextAttachment *)a3;
  if (self->_outputButtonAttachment != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_outputButtonAttachment, a3);
    [(WFSlotTemplateTextStorage *)self regenerateEntireAttributedString];
    id v5 = v6;
  }
}

- (void)setDisclosureAttachment:(id)a3
{
  id v5 = (NSTextAttachment *)a3;
  if (self->_disclosureAttachment != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_disclosureAttachment, a3);
    [(WFSlotTemplateTextStorage *)self regenerateEntireAttributedString];
    id v5 = v6;
  }
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    [(WFSlotTemplateTextStorage *)self updateColorsForAllSlots];
  }
}

- (void)setParagraphStyle:(id)a3
{
  id v4 = a3;
  id v5 = [(WFSlotTemplateTextStorage *)self paragraphStyle];
  char v6 = [v4 isEqual:v5];

  id v7 = (NSParagraphStyle *)[v4 copy];
  paragraphStyle = self->_paragraphStyle;
  self->_paragraphStyle = v7;

  if ((v6 & 1) == 0)
  {
    [(WFSlotTemplateTextStorage *)self regenerateEntireAttributedString];
  }
}

- (void)setTintColor:(id)a3
{
  id v4 = (UIColor *)a3;
  id v5 = [(WFSlotTemplateTextStorage *)self tintColor];
  char v6 = [(UIColor *)v4 isEqual:v5];

  tintColor = self->_tintColor;
  self->_tintColor = v4;

  if ((v6 & 1) == 0)
  {
    [(WFSlotTemplateTextStorage *)self updateColorsForAllSlots];
  }
}

- (void)setTextColor:(id)a3
{
  id v4 = (UIColor *)a3;
  id v5 = [(WFSlotTemplateTextStorage *)self textColor];
  char v6 = [(UIColor *)v4 isEqual:v5];

  textColor = self->_textColor;
  self->_textColor = v4;

  if ((v6 & 1) == 0)
  {
    uint64_t v8 = *MEMORY[0x263F81500];
    id v9 = [(WFSlotTemplateTextStorage *)self textColor];
    [(WFSlotTemplateTextStorage *)self replaceAttributeInInanimateText:v8 value:v9];
  }
}

- (void)setUnpopulatedFont:(id)a3
{
  id v5 = a3;
  char v6 = [(WFSlotTemplateTextStorage *)self unpopulatedFont];
  char v7 = [v5 isEqual:v6];

  objc_storeStrong((id *)&self->_unpopulatedFont, a3);
  if ((v7 & 1) == 0)
  {
    uint64_t v8 = [(WFSlotTemplateTextStorage *)self length];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __48__WFSlotTemplateTextStorage_setUnpopulatedFont___block_invoke;
    v9[3] = &unk_264BFD890;
    v9[4] = self;
    [(WFSlotTemplateTextStorage *)self enumerateAttribute:@"WFSlot", 0, v8, 0, v9 inRange options usingBlock];
  }
}

void __48__WFSlotTemplateTextStorage_setUnpopulatedFont___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  if (([a2 isPopulated] & 1) == 0)
  {
    char v7 = *(void **)(a1 + 32);
    uint64_t v8 = *MEMORY[0x263F814F0];
    id v9 = [v7 unpopulatedFont];
    objc_msgSend(v7, "addAttribute:value:range:", v8, v9, a3, a4);
  }
}

- (void)setFont:(id)a3
{
  id v4 = (UIFont *)a3;
  id v5 = [(WFSlotTemplateTextStorage *)self font];
  char v6 = [(UIFont *)v4 isEqual:v5];

  font = self->_font;
  self->_font = v4;

  if ((v6 & 1) == 0)
  {
    [(WFSlotTemplateTextStorage *)self regenerateEntireAttributedString];
  }
}

- (NSParagraphStyle)paragraphStyle
{
  paragraphStyle = self->_paragraphStyle;
  if (!paragraphStyle)
  {
    id v4 = [MEMORY[0x263F81658] defaultParagraphStyle];
    id v5 = self->_paragraphStyle;
    self->_paragraphStyle = v4;

    paragraphStyle = self->_paragraphStyle;
  }
  return paragraphStyle;
}

- (UIColor)tintColor
{
  tintColor = self->_tintColor;
  if (!tintColor)
  {
    objc_msgSend(MEMORY[0x263F825C8], "wf_systemBlueColor");
    id v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
    id v5 = self->_tintColor;
    self->_tintColor = v4;

    tintColor = self->_tintColor;
  }
  return tintColor;
}

- (UIColor)textColor
{
  textColor = self->_textColor;
  if (!textColor)
  {
    objc_msgSend(MEMORY[0x263F825C8], "wf_labelColor");
    id v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
    id v5 = self->_textColor;
    self->_textColor = v4;

    textColor = self->_textColor;
  }
  return textColor;
}

- (UIFont)unpopulatedFont
{
  unpopulatedFont = self->_unpopulatedFont;
  if (unpopulatedFont)
  {
    id v3 = unpopulatedFont;
  }
  else
  {
    id v3 = [(WFSlotTemplateTextStorage *)self font];
  }
  return v3;
}

- (UIFont)font
{
  font = self->_font;
  if (!font)
  {
    id v4 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
    id v5 = self->_font;
    self->_font = v4;

    font = self->_font;
  }
  return font;
}

- (void)endEditing
{
  v4.receiver = self;
  v4.super_class = (Class)WFSlotTemplateTextStorage;
  [(WFSlotTemplateTextStorage *)&v4 endEditing];
  if ([(WFSlotTemplateTextStorage *)self editingLevel])
  {
    [(WFSlotTemplateTextStorage *)self setEditingLevel:[(WFSlotTemplateTextStorage *)self editingLevel] - 1];
    if (![(WFSlotTemplateTextStorage *)self editingLevel])
    {
      id v3 = [(WFSlotTemplateTextStorage *)self delegate];
      if (objc_opt_respondsToSelector()) {
        [v3 slotTemplateStorageDidInvalidateDisplay:self];
      }
    }
  }
}

- (void)beginEditing
{
  [(WFSlotTemplateTextStorage *)self setEditingLevel:[(WFSlotTemplateTextStorage *)self editingLevel] + 1];
  v3.receiver = self;
  v3.super_class = (Class)WFSlotTemplateTextStorage;
  [(WFSlotTemplateTextStorage *)&v3 beginEditing];
}

- (void)setAttributes:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  uint64_t v8 = [(WFSlotTemplateTextStorage *)self textStorage];
  objc_msgSend(v8, "setAttributes:range:", v7, location, length);

  -[WFSlotTemplateTextStorage edited:range:changeInLength:](self, "edited:range:changeInLength:", 1, location, length, 0);
}

- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  uint64_t v8 = [(WFSlotTemplateTextStorage *)self textStorage];
  objc_msgSend(v8, "replaceCharactersInRange:withString:", location, length, v7);

  uint64_t v9 = [v7 length];
  -[WFSlotTemplateTextStorage edited:range:changeInLength:](self, "edited:range:changeInLength:", 2, location, length, v9 - length);
}

- (id)attributesAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  char v6 = [(WFSlotTemplateTextStorage *)self textStorage];
  id v7 = [v6 attributesAtIndex:a3 effectiveRange:a4];

  return v7;
}

- (id)string
{
  v2 = [(WFSlotTemplateTextStorage *)self textStorage];
  objc_super v3 = [v2 string];

  return v3;
}

- (WFSlotTemplateTextStorage)init
{
  v13.receiver = self;
  v13.super_class = (Class)WFSlotTemplateTextStorage;
  v2 = [(WFSlotTemplateTextStorage *)&v13 init];
  if (v2)
  {
    objc_super v3 = (NSTextStorage *)objc_alloc_init(MEMORY[0x263F816E8]);
    textStorage = v2->_textStorage;
    v2->_textStorage = v3;

    id v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    mutableHighlightedSlots = v2->_mutableHighlightedSlots;
    v2->_mutableHighlightedSlots = v5;

    id v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    mutableSelectedSlots = v2->_mutableSelectedSlots;
    v2->_mutableSelectedSlots = v7;

    uint64_t v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    mutableTypingSlots = v2->_mutableTypingSlots;
    v2->_mutableTypingSlots = v9;

    v2->_contentsTextAlignment = 4;
    uint64_t v11 = v2;
  }

  return v2;
}

@end