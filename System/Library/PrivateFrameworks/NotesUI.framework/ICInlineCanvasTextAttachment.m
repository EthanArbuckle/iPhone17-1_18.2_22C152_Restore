@interface ICInlineCanvasTextAttachment
- (NSArray)attachmentViews;
- (NSArray)inlineViews;
- (id)image;
- (id)imageForBounds:(CGRect)a3 attributes:(id)a4 location:(id)a5 textContainer:(id)a6;
- (void)setViewSelected:(BOOL)a3 inWindow:(id)a4;
- (void)updatePaletteVisibility;
- (void)updatePaletteVisibilityToVisible:(BOOL)a3;
@end

@implementation ICInlineCanvasTextAttachment

- (id)image
{
  return 0;
}

- (NSArray)inlineViews
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (NSArray)attachmentViews
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (void)updatePaletteVisibility
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = [(ICInlineCanvasTextAttachment *)self inlineViews];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        v8 = [v7 window];
        v9 = +[ICInkPaletteController sharedToolPickerForWindow:v8];

        if ([v9 isVisible]) {
          uint64_t v10 = 1;
        }
        else {
          uint64_t v10 = [v9 _isAnimatingToVisible];
        }
        [v9 setVisible:v10 forFirstResponder:v7];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

- (void)updatePaletteVisibilityToVisible:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [(ICInlineCanvasTextAttachment *)self inlineViews];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v10 = [v9 window];
        long long v11 = +[ICInkPaletteController sharedToolPickerForWindow:v10];

        [v11 setVisible:v3 forFirstResponder:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)setViewSelected:(BOOL)a3 inWindow:(id)a4
{
  BOOL v4 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [(ICInlineCanvasTextAttachment *)self attachmentViews];
  v8 = (void *)[v7 copy];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [*(id *)(*((void *)&v15 + 1) + 8 * v12) window];

        if (v13 == v6)
        {
          objc_opt_class();
          long long v14 = ICCheckedDynamicCast();
          [v14 setAttachmentChromeVisible:v4 animated:0 highlightBackground:0];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
}

- (id)imageForBounds:(CGRect)a3 attributes:(id)a4 location:(id)a5 textContainer:(id)a6
{
  id v7 = a6;
  v8 = [v7 textView];
  uint64_t v9 = [v8 traitCollection];

  uint64_t v10 = -[ICBaseTextAttachment printableTextContentForAppearanceType:traitCollection:textContainer:](self, "printableTextContentForAppearanceType:traitCollection:textContainer:", objc_msgSend(v9, "ic_isDark"), v9, v7);

  uint64_t v11 = [v10 attribute:*MEMORY[0x1E4FB06B8] atIndex:0 effectiveRange:0];
  objc_opt_class();
  uint64_t v12 = ICDynamicCast();
  id v13 = [v12 image];

  return v13;
}

@end