@interface UITextView
@end

@implementation UITextView

uint64_t __70__UITextView_IC__ic_shouldEnableBlockQuoteForAttachmentsOnlySelection__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v11 = a2;
  if (v11 && ([MEMORY[0x1E4F834B0] isInlineAttachment:v11] & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    v7 = [*(id *)(a1 + 32) textStorage];
    v8 = [v7 string];
    v9 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) |= objc_msgSend(v8, "ic_range:onlyContainsCharacterSet:", a3, a4, v9) ^ 1;
  }
  return MEMORY[0x1F41817F8]();
}

void __34__UITextView_IC__ic_rectForRange___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "ensureGlyphsForCharacterRange:", *(void *)(a1 + 64), *(void *)(a1 + 72));
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "glyphRangeForCharacterRange:actualCharacterRange:", *(void *)(a1 + 64), *(void *)(a1 + 72), 0);
  uint64_t v4 = v3;
  unint64_t v5 = *(void *)(a1 + 72) + *(void *)(a1 + 64);
  v6 = [*(id *)(a1 + 40) textStorage];
  objc_msgSend(v6, "ic_range");
  unint64_t v8 = v7;

  if (v5 <= v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "ensureLayoutForGlyphRange:", v2, v4);
    objc_msgSend(*(id *)(a1 + 32), "boundingRectForGlyphRange:inTextContainer:", v2, v4, *(void *)(a1 + 48));
    v9 = *(void **)(*(void *)(a1 + 56) + 8);
    v9[4] = v10;
    v9[5] = v11;
    v9[6] = v12;
    v9[7] = v13;
  }
}

uint64_t __35__UITextView_IC__ic_imageForRange___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "glyphRangeForCharacterRange:actualCharacterRange:", *(void *)(a1 + 40), *(void *)(a1 + 48), 0);
  if (v3)
  {
    uint64_t v4 = result;
    uint64_t v5 = v3;
    double v6 = -*(double *)(a1 + 56);
    double v7 = -*(double *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 32), "drawBackgroundForGlyphRange:atPoint:", result, v3, v6, v7);
    unint64_t v8 = *(void **)(a1 + 32);
    return objc_msgSend(v8, "drawGlyphsForGlyphRange:atPoint:", v4, v5, v6, v7);
  }
  return result;
}

@end