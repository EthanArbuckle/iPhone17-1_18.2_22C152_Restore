@interface ICLinkUIModel
- (_NSRange)highlightRangeForTextFindingMatchRange:(_NSRange)a3;
- (id)attributedStringWithSurroundingAttributes:(id)a3 formatter:(id)a4;
- (id)highlightingAttributedString:(id)a3 withSurroundingAttributes:(id)a4;
- (id)labelColor;
- (id)noteGlyphTextAttachmentWithSurroundingAttributes:(id)a3;
@end

@implementation ICLinkUIModel

- (id)labelColor
{
  return (id)[MEMORY[0x1E4FB1618] tintColor];
}

- (id)noteGlyphTextAttachmentWithSurroundingAttributes:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4FB06F8]];
  v6 = ICDynamicCast();

  objc_opt_class();
  v7 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F83568]];
  v8 = ICCheckedDynamicCast();
  [v8 floatValue];
  double v10 = v9;

  objc_opt_class();
  v11 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4FB0700]];

  v12 = ICCheckedDynamicCast();

  if (ICInternalSettingsIsTextKit2Enabled())
  {
    double v13 = fmin(v10 * 0.6 + 1.0, 1.0);
  }
  else if (v12)
  {
    [v12 alphaComponent];
    double v13 = v14;
  }
  else
  {
    double v13 = 1.0;
  }
  v15 = (void *)MEMORY[0x1E4FB1818];
  [v6 pointSize];
  v16 = objc_msgSend(v15, "ic_systemImageNamed:pointSize:", @"note.text");
  v17 = [(ICLinkUIModel *)self labelColor];
  v18 = [MEMORY[0x1E4FB1618] preferredDefaultFontColor];
  v19 = objc_msgSend(v17, "ic_colorBlendedWithColor:fraction:", v18, fabs(v10));

  [v19 alphaComponent];
  v21 = [v19 colorWithAlphaComponent:v13 * v20];

  v22 = [v16 imageWithTintColor:v21];

  id v23 = objc_alloc_init(MEMORY[0x1E4FB0870]);
  [v23 setImage:v22];
  [v6 capHeight];
  double v25 = v24;
  [v22 size];
  double v27 = (v25 - v26) * 0.5;
  [v22 size];
  double v29 = v28;
  [v22 size];
  objc_msgSend(v23, "setBounds:", 0.0, v27, v29, v30);

  return v23;
}

- (id)attributedStringWithSurroundingAttributes:(id)a3 formatter:(id)a4
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  v7 = [(ICLinkUIModel *)self noteGlyphTextAttachmentWithSurroundingAttributes:v5];
  v8 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v7];
  [v6 appendAttributedString:v8];

  float v9 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F83220]];
  if ([v9 style] != 4)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F28B18]);
    v11 = objc_msgSend(NSString, "ic_thinSpaceCharacterString");
    v12 = (void *)[v10 initWithString:v11];
    [v6 appendAttributedString:v12];
  }
  id v13 = objc_alloc(MEMORY[0x1E4F28B18]);
  double v14 = [(ICInlineAttachmentUIModel *)self attachment];
  v15 = [v14 displayText];
  uint64_t v28 = *MEMORY[0x1E4FB0808];
  v29[0] = &unk_1F09A4490;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
  v17 = (void *)[v13 initWithString:v15 attributes:v16];
  [v6 appendAttributedString:v17];

  v18 = [(id)objc_opt_class() filteredStyleAttributes:v5];
  v19 = (void *)[v18 mutableCopy];

  double v20 = [(ICLinkUIModel *)self labelColor];
  [v19 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4FB0700]];

  v21 = [(ICLinkUIModel *)self labelColor];
  [v19 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F83588]];

  id v22 = [(ICLinkUIModel *)self labelColor];
  uint64_t v23 = [v22 CGColor];
  [v19 setObject:v23 forKeyedSubscript:*MEMORY[0x1E4F83218]];

  uint64_t v24 = objc_msgSend(v6, "ic_range");
  objc_msgSend(v6, "addAttributes:range:", v19, v24, v25);
  double v26 = (void *)[v6 copy];

  return v26;
}

- (id)highlightingAttributedString:(id)a3 withSurroundingAttributes:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)ICLinkUIModel;
  id v6 = a4;
  v7 = [(ICInlineAttachmentUIModel *)&v13 highlightingAttributedString:a3 withSurroundingAttributes:v6];
  v8 = objc_msgSend(v7, "mutableCopy", v13.receiver, v13.super_class);

  float v9 = [(ICLinkUIModel *)self noteGlyphTextAttachmentWithSurroundingAttributes:v6];

  id v10 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v9];
  objc_msgSend(v8, "replaceCharactersInRange:withAttributedString:", 0, 1, v10);

  v11 = (void *)[v8 copy];
  return v11;
}

- (_NSRange)highlightRangeForTextFindingMatchRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger v4 = a3.location + 2;
  result.NSUInteger length = length;
  result.location = v4;
  return result;
}

@end