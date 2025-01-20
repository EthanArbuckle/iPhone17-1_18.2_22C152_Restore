@interface UITextViewCanvasView
@end

@implementation UITextViewCanvasView

unint64_t __40___UITextViewCanvasView_drawTextInRect___block_invoke(uint64_t a1)
{
  unint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "glyphRangeForBoundingRect:inTextContainer:", *(void *)(a1 + 40), *(double *)(a1 + 72) - *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 32), *(double *)(a1 + 80) - *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), *(double *)(a1 + 88), *(double *)(a1 + 96));
  unint64_t v4 = v3;
  unint64_t result = [*(id *)(a1 + 48) textContainerOrigin];
  uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
  *(void *)(v6 + 32) = v7;
  *(void *)(v6 + 40) = v8;
  if (v4)
  {
    int v9 = [*(id *)(a1 + 32) hasNonContiguousLayout];
    v10 = *(void **)(a1 + 32);
    unint64_t result = v9 ? [v10 numberOfGlyphs] : objc_msgSend(v10, "firstUnlaidGlyphIndex");
    if (result > v2)
    {
      unint64_t v11 = v2 + v4 <= result ? v4 : result - v2;
      if (v11)
      {
        uint64_t v12 = objc_msgSend(*(id *)(a1 + 56), "_extendedGlyphRangeForRange:maxGlyphIndex:", v2, v11, result);
        uint64_t v14 = v13;
        objc_msgSend(*(id *)(a1 + 32), "drawBackgroundForGlyphRange:atPoint:", v12, v13, *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 40));
        v15 = *(void **)(a1 + 32);
        uint64_t v16 = *(void *)(*(void *)(a1 + 64) + 8);
        double v17 = *(double *)(v16 + 32);
        double v18 = *(double *)(v16 + 40);
        return objc_msgSend(v15, "drawGlyphsForGlyphRange:atPoint:", v12, v14, v17, v18);
      }
    }
  }
  return result;
}

@end