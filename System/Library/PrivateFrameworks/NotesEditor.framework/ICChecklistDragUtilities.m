@interface ICChecklistDragUtilities
+ (BOOL)shouldDropAboveForTrackedTodoParagraph:(id)a3 forPoint:(CGPoint)a4 textView:(id)a5;
+ (CGRect)insertionRectForTrackedTodoParagraph:(id)a3 drawAbove:(BOOL)a4 inTextView:(id)a5;
+ (unint64_t)tabIndentationEqualivantForString:(id)a3;
@end

@implementation ICChecklistDragUtilities

+ (BOOL)shouldDropAboveForTrackedTodoParagraph:(id)a3 forPoint:(CGPoint)a4 textView:(id)a5
{
  double y = a4.y;
  id v7 = a5;
  id v8 = a3;
  uint64_t v9 = [v8 characterRange];
  uint64_t v11 = v10;
  uint64_t v12 = [v8 characterRange];
  uint64_t v14 = v13;

  uint64_t v15 = v9 + v11;
  v16 = [v7 textStorage];
  uint64_t v17 = [v16 length];

  uint64_t v18 = v14 - (v15 >= v17);
  if (ICInternalSettingsIsTextKit2Enabled())
  {
    objc_msgSend(v7, "ic_rectForRange:", v12, v18);
  }
  else
  {
    v19 = [v7 icLayoutManager];
    uint64_t v20 = objc_msgSend(v19, "glyphRangeForCharacterRange:actualCharacterRange:", v12, v18, 0);
    uint64_t v22 = v21;
    v23 = [v7 textContainer];
    objc_msgSend(v19, "boundingRectForGlyphRange:inTextContainer:", v20, v22, v23);
  }
  [v7 textContainerInset];
  TSDCenterOfRect();
  BOOL v25 = y <= v24;

  return v25;
}

+ (CGRect)insertionRectForTrackedTodoParagraph:(id)a3 drawAbove:(BOOL)a4 inTextView:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = a5;
  double v10 = *MEMORY[0x263F001A8];
  double v9 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v11 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v12 = *(double *)(MEMORY[0x263F001A8] + 24);
  if ([v8 isDraggingChecklistItem]
    && [v8 isDraggingOverChecklistItem])
  {
    if (ICInternalSettingsIsTextKit2Enabled())
    {
      objc_opt_class();
      uint64_t v13 = [v8 textLayoutManager];
      uint64_t v14 = ICCheckedDynamicCast();

      uint64_t v15 = [v14 todoButtonForTrackedParagraph:v7];
      [v15 imageFrame];
      objc_msgSend(v8, "convertRect:fromView:", v15);
      double v17 = v16;
      double rect = v18;
      double v66 = v19;
      double v67 = v20;
      uint64_t v21 = [v7 characterRange];
      uint64_t v23 = v21;
      uint64_t v24 = v22;
      if (v6) {
        uint64_t v25 = -1;
      }
      else {
        uint64_t v25 = v22;
      }
      v26 = [v14 trackedTodoParagraphAtIndex:v21 + v25];
      v27 = [v14 todoButtonForTrackedParagraph:v26];
      [v27 imageFrame];
      objc_msgSend(v8, "convertRect:fromView:", v27);
    }
    else
    {
      uint64_t v14 = [v8 icLayoutManager];
      uint64_t v15 = [v14 todoButtonForTrackedParagraphIfExists:v7];
      [v15 imageFrame];
      double v17 = v32;
      double rect = v33;
      double v66 = v34;
      double v67 = v35;
      uint64_t v36 = [v7 characterRange];
      uint64_t v23 = v36;
      uint64_t v24 = v37;
      if (v6) {
        uint64_t v38 = -1;
      }
      else {
        uint64_t v38 = v37;
      }
      v26 = [v14 trackedTodoParagraphAtIndexIfExists:v36 + v38];
      v27 = [v14 todoButtonForTrackedParagraphIfExists:v26];
      [v27 imageFrame];
    }
    double v39 = v28;
    double v40 = v29;
    CGFloat v41 = v30;
    CGFloat v42 = v31;
    uint64_t v43 = objc_msgSend(v14, "lineCountForCharacterRange:", v23, v24);
    if (v26)
    {
      uint64_t v44 = [v26 characterRange];
      BOOL v46 = (unint64_t)(objc_msgSend(v14, "lineCountForCharacterRange:", v44, v45) - 3) < 0xFFFFFFFFFFFFFFFELL;
    }
    else
    {
      BOOL v46 = 0;
    }
    int v47 = (unint64_t)(v43 - 3) < 0xFFFFFFFFFFFFFFFELL || v46;

    if (!v15) {
      goto LABEL_59;
    }
    if (v27)
    {
      if ((v47 & 1) == 0)
      {
        if (v6) {
          double v52 = v39;
        }
        else {
          double v52 = v17;
        }
        if (v6) {
          double v53 = v40;
        }
        else {
          double v53 = rect;
        }
        double v11 = v67;
        if (v6) {
          double v54 = v41;
        }
        else {
          double v54 = v67;
        }
        if (v6) {
          double v55 = v42;
        }
        else {
          double v55 = v66;
        }
        if (v6) {
          CGFloat v56 = v17;
        }
        else {
          CGFloat v56 = v39;
        }
        if (v6) {
          CGFloat v57 = rect;
        }
        else {
          CGFloat v57 = v40;
        }
        if (v6)
        {
          CGFloat v41 = v67;
          CGFloat v42 = v66;
        }
        double MaxY = CGRectGetMaxY(*(CGRect *)&v52);
        v68.origin.x = v56;
        v68.origin.double y = v57;
        v68.size.width = v41;
        v68.size.height = v42;
        double MinY = MaxY + (CGRectGetMinY(v68) - MaxY) * 0.5;
        double v60 = -1.0;
        goto LABEL_58;
      }
      if (v6) {
        double v48 = v17;
      }
      else {
        double v48 = v39;
      }
      double v49 = rect;
      double v50 = v66;
      if (!v6) {
        double v49 = v40;
      }
      double v11 = v67;
      if (v6) {
        double v51 = v67;
      }
      else {
        double v51 = v41;
      }
      if (!v6) {
        double v50 = v42;
      }
      goto LABEL_56;
    }
    if (!v47 || v6)
    {
      double v50 = v66;
      double v11 = v67;
      double v49 = rect;
      double v48 = v17;
      double v51 = v67;
      if (v6)
      {
LABEL_56:
        double MinY = CGRectGetMinY(*(CGRect *)&v48);
        double v60 = -3.0;
LABEL_58:
        double v9 = MinY + v60;
        double v10 = v17;
LABEL_59:

        double v12 = 2.0;
        goto LABEL_60;
      }
    }
    else
    {
      double v48 = v17;
      double v49 = rect;
      double v50 = v66;
      double v11 = v67;
      double v51 = v67;
    }
    double MinY = CGRectGetMaxY(*(CGRect *)&v48);
    double v60 = 3.0;
    goto LABEL_58;
  }
LABEL_60:

  double v61 = v10;
  double v62 = v9;
  double v63 = v11;
  double v64 = v12;
  result.size.height = v64;
  result.size.width = v63;
  result.origin.double y = v62;
  result.origin.x = v61;
  return result;
}

+ (unint64_t)tabIndentationEqualivantForString:(id)a3
{
  id v3 = a3;
  v4 = objc_msgSend(v3, "ic_trimmedString");
  uint64_t v5 = [v4 length];

  if (v5)
  {
    unint64_t v6 = 0;
  }
  else
  {
    if (objc_msgSend(v3, "ic_isLastCharacterANewline"))
    {
      uint64_t v7 = objc_msgSend(v3, "ic_substringWithRange:", 0, objc_msgSend(v3, "length") - 1);

      id v3 = (id)v7;
    }
    id v8 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"\t"];
    unint64_t v6 = objc_msgSend(v3, "ic_countOfCharactersInSet:", v8);
  }
  return v6;
}

@end