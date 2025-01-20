@interface UISearchTextFieldCanvasView
@end

@implementation UISearchTextFieldCanvasView

void __49___UISearchTextFieldCanvasView__updateTokenViews__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id rect_8 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "glyphRangeForCharacterRange:actualCharacterRange:", a3, a4, 0);
    [*(id *)(a1 + 32) lineFragmentRectForGlyphAtIndex:v7 effectiveRange:0];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    uint64_t v16 = *(void *)(a1 + 40);
    [*(id *)(a1 + 32) locationForGlyphAtIndex:v7];
    objc_msgSend(rect_8, "attachmentBoundsForTextContainer:proposedLineFragment:glyphPosition:characterIndex:", v16, a3, v9, v11, v13, v15, v17, v18);
    double y = v43.origin.y;
    double width = v43.size.width;
    double height = v43.size.height;
    double rect = v43.origin.x;
    double MinX = CGRectGetMinX(v43);
    v44.origin.x = v9;
    v44.origin.double y = v11;
    v44.size.double width = v13;
    v44.size.double height = v15;
    if (MinX < CGRectGetMaxX(v44))
    {
      v45.origin.x = rect;
      v45.origin.double y = y;
      v45.size.double width = width;
      v45.size.double height = height;
      double MaxX = CGRectGetMaxX(v45);
      v46.origin.x = v9;
      v46.origin.double y = v11;
      v46.size.double width = v13;
      v46.size.double height = v15;
      if (MaxX > CGRectGetMinX(v46))
      {
        double v39 = v11;
        v24 = [rect_8 _viewProvider];
        v25 = [v24 view];

        [*(id *)(a1 + 48) removeObject:v25];
        v26 = *(void **)(a1 + 56);
        if (!v26[56])
        {
          uint64_t v27 = objc_opt_new();
          uint64_t v28 = *(void *)(a1 + 56);
          v29 = *(void **)(v28 + 448);
          *(void *)(v28 + 448) = v27;

          v26 = *(void **)(a1 + 56);
        }
        [v26 addSubview:v25];
        [*(id *)(*(void *)(a1 + 56) + 448) addObject:v25];
        double v30 = UIRectIntegralWithScale(rect, y, width, height, *(double *)(a1 + 64));
        double v32 = v31;
        double v34 = v33;
        double v36 = v35;
        [v25 frame];
        if (v34 != v38 || v36 != v37)
        {
          objc_msgSend(v25, "setBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v34, v36);
          [v25 layoutSubviews];
        }
        objc_msgSend(v25, "setFrame:", UIPointRoundToScale(v30 + *(double *)(a1 + 72), v39 + 0.0 + *(double *)(a1 + 80), *(double *)(a1 + 64)));
        objc_msgSend(v25, "updateMaskLayerForAttachmentRect:lineFragment:", v30, v32, v34, v36, v9, v39, v13, v15);
      }
    }
  }
}

@end