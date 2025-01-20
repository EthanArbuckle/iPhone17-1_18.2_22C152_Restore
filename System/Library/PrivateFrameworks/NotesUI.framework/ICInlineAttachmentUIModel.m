@interface ICInlineAttachmentUIModel
+ (id)attributesForInlineAttachmentUIModel;
+ (id)filteredStyleAttributes:(id)a3;
- (BOOL)fadesColorDuringHighlight;
- (BOOL)isSelected;
- (ICInlineAttachment)attachment;
- (ICInlineAttachmentUIModel)initWithAttachment:(id)a3;
- (UIColor)labelColor;
- (_NSRange)highlightRangeForTextFindingMatchRange:(_NSRange)a3;
- (id)attributedStringWithSurroundingAttributes:(id)a3 formatter:(id)a4;
- (id)highlightingAttributedString:(id)a3 withRegexMatches:(id)a4;
- (id)highlightingAttributedString:(id)a3 withSurroundingAttributes:(id)a4;
- (void)setSelected:(BOOL)a3;
@end

@implementation ICInlineAttachmentUIModel

- (ICInlineAttachmentUIModel)initWithAttachment:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICInlineAttachmentUIModel;
  v5 = [(ICInlineAttachmentUIModel *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_attachment, v4);
  }

  return v6;
}

- (UIColor)labelColor
{
  return (UIColor *)[MEMORY[0x1E4FB1618] ICUnknownInlineAttachmentTextColor];
}

+ (id)attributesForInlineAttachmentUIModel
{
  if (attributesForInlineAttachmentUIModel_onceToken != -1) {
    dispatch_once(&attributesForInlineAttachmentUIModel_onceToken, &__block_literal_global_84);
  }
  v2 = (void *)attributesForInlineAttachmentUIModel_attributes;
  return v2;
}

void __65__ICInlineAttachmentUIModel_attributesForInlineAttachmentUIModel__block_invoke()
{
  v7[4] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F834C0] allowedAttributesForModel];
  v1 = (void *)[v0 mutableCopy];

  [v1 removeObject:*MEMORY[0x1E4F83248]];
  uint64_t v2 = *MEMORY[0x1E4FB0700];
  v7[0] = *MEMORY[0x1E4FB06F8];
  v7[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4FB0768];
  v7[2] = *MEMORY[0x1E4FB0808];
  v7[3] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:4];
  [v1 addObjectsFromArray:v4];

  uint64_t v5 = [v1 copy];
  v6 = (void *)attributesForInlineAttachmentUIModel_attributes;
  attributesForInlineAttachmentUIModel_attributes = v5;
}

+ (id)filteredStyleAttributes:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v6 = objc_msgSend(a1, "attributesForInlineAttachmentUIModel", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    uint64_t v10 = *MEMORY[0x1E4FB0720];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v13 = [v4 objectForKeyedSubscript:v12];
        if (v13)
        {
          v14 = (void *)v13;
          char v15 = [v12 isEqualToString:v10];

          if ((v15 & 1) == 0)
          {
            v16 = [v4 objectForKeyedSubscript:v12];
            [v5 setObject:v16 forKeyedSubscript:v12];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  v17 = (void *)[v5 copy];
  return v17;
}

- (id)attributedStringWithSurroundingAttributes:(id)a3 formatter:(id)a4
{
  v6 = (void (**)(id, id, uint64_t))a4;
  id v7 = a3;
  uint64_t v8 = [(ICInlineAttachmentUIModel *)self attachment];
  uint64_t v9 = [v8 displayText];
  uint64_t v10 = (void *)v9;
  v11 = &stru_1F0973378;
  if (v9) {
    v11 = (__CFString *)v9;
  }
  v12 = v11;

  if (v6)
  {
    uint64_t v13 = [(ICInlineAttachmentUIModel *)self attachment];
    uint64_t v14 = v6[2](v6, v12, [v13 attachmentType]);

    v12 = (__CFString *)v14;
  }
  char v15 = [(ICInlineAttachmentUIModel *)self labelColor];
  v16 = [(id)objc_opt_class() filteredStyleAttributes:v7];

  v17 = (void *)[v16 mutableCopy];
  [v17 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4FB0700]];
  [v17 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F83588]];
  id v18 = v15;
  uint64_t v19 = [v18 CGColor];
  [v17 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F83218]];
  id v20 = objc_alloc(MEMORY[0x1E4F28B18]);
  long long v21 = (void *)[v17 copy];
  long long v22 = (void *)[v20 initWithString:v12 attributes:v21];

  return v22;
}

- (id)highlightingAttributedString:(id)a3 withSurroundingAttributes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  uint64_t v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F83568]];
  uint64_t v9 = ICCheckedDynamicCast();
  [v9 floatValue];
  double v11 = v10;

  objc_opt_class();
  v12 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4FB0700]];

  uint64_t v13 = ICCheckedDynamicCast();

  if (ICInternalSettingsIsTextKit2Enabled())
  {
    double v14 = fmin(v11 * 0.6 + 1.0, 1.0);
  }
  else if (v13)
  {
    [v13 alphaComponent];
    double v14 = v15;
  }
  else
  {
    double v14 = 1.0;
  }
  v16 = (void *)[v6 mutableCopy];
  uint64_t v17 = *MEMORY[0x1E4F83588];
  uint64_t v18 = objc_msgSend(v16, "ic_range");
  uint64_t v20 = v19;
  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  v26 = __84__ICInlineAttachmentUIModel_highlightingAttributedString_withSurroundingAttributes___block_invoke;
  v27 = &unk_1E5FDE170;
  double v30 = v11;
  double v31 = v14;
  v28 = self;
  id v29 = v16;
  id v21 = v16;
  objc_msgSend(v21, "enumerateAttribute:inRange:options:usingBlock:", v17, v18, v20, 0, &v24);
  long long v22 = objc_msgSend(v21, "copy", v24, v25, v26, v27, v28);

  return v22;
}

void __84__ICInlineAttachmentUIModel_highlightingAttributedString_withSurroundingAttributes___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (!v7)
  {
    id v7 = [MEMORY[0x1E4FB1618] preferredDefaultFontColor];
  }
  if (*(double *)(a1 + 48) != 0.0)
  {
    id v20 = v7;
    if ([*(id *)(a1 + 32) fadesColorDuringHighlight])
    {
      id v8 = [MEMORY[0x1E4FB1618] tintColor];
      if (v20 == v8)
      {
        uint64_t v9 = [MEMORY[0x1E4FB1618] ICTintColor];

        id v20 = (id)v9;
      }

      float v10 = [MEMORY[0x1E4FB1618] preferredDefaultFontColor];
      uint64_t v11 = objc_msgSend(v20, "ic_colorBlendedWithColor:fraction:", v10, fabs(*(double *)(a1 + 48)));

      id v7 = (id)v11;
    }
    else
    {
      id v7 = v20;
    }
  }
  id v21 = v7;
  if (*(double *)(a1 + 56) < 1.0)
  {
    [v7 alphaComponent];
    uint64_t v13 = [v21 colorWithAlphaComponent:v12 * *(double *)(a1 + 56)];

    id v21 = (id)v13;
  }
  double v14 = [*(id *)(a1 + 40) attribute:*MEMORY[0x1E4F83200] atIndex:a3 effectiveRange:0];
  int v15 = [v14 intValue];

  if (v15)
  {
    v16 = (void *)v15;
    uint64_t v17 = *(void **)(a1 + 40);
    uint64_t v18 = *MEMORY[0x1E4FB0700];
    uint64_t v19 = ICColorForEmphasisColorType(v16);
    objc_msgSend(v17, "addAttribute:value:range:", v18, v19, a3, a4);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *MEMORY[0x1E4FB0700], v21, a3, a4);
  }
}

- (id)highlightingAttributedString:(id)a3 withRegexMatches:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4FB1618];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 ICFindInNoteHighlightColor];
  uint64_t v9 = objc_msgSend(v7, "ic_attributedStringByHighlightingRegexFinderMatches:withHighlightColor:attributeName:", v6, v8, *MEMORY[0x1E4FB06C0]);

  return v9;
}

- (BOOL)fadesColorDuringHighlight
{
  return 1;
}

- (_NSRange)highlightRangeForTextFindingMatchRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (ICInlineAttachment)attachment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_attachment);
  return (ICInlineAttachment *)WeakRetained;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (void).cxx_destruct
{
}

@end