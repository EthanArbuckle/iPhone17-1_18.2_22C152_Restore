@interface UITextKit1LayoutController
@end

@implementation UITextKit1LayoutController

uint64_t __49___UITextKit1LayoutController__textStorageLength__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 length];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __83___UITextKit1LayoutController_textRangeForLineEnclosingPosition_effectiveAffinity___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 textStorage];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    uint64_t v6 = [*(id *)(a1 + 40) offset];
    if (v6 == v5) {
      uint64_t v7 = v5 - 1;
    }
    else {
      uint64_t v7 = v6;
    }
    uint64_t v8 = [v3 glyphIndexForCharacterAtIndex:v7];
    uint64_t v33 = 0;
    uint64_t v34 = 0;
    [v3 lineFragmentRectForGlyphAtIndex:v8 effectiveRange:&v33];
    uint64_t v9 = objc_msgSend(v3, "characterRangeForGlyphRange:actualGlyphRange:", v33, v34, 0);
    uint64_t v11 = v10;
    if (v7 == v9)
    {
      if (v8) {
        BOOL v12 = *(void *)(a1 + 56) == 1;
      }
      else {
        BOOL v12 = 0;
      }
      uint64_t v13 = v7;
      if (v12)
      {
        [v3 lineFragmentRectForGlyphAtIndex:v8 - 1 effectiveRange:&v33];
        uint64_t v13 = objc_msgSend(v3, "characterRangeForGlyphRange:actualGlyphRange:", v33, v34, 0);
        uint64_t v11 = v14;
      }
    }
    else
    {
      uint64_t v13 = v9;
    }
    v20 = [v3 textStorage];
    v21 = [v20 string];
    v22 = objc_msgSend(v21, "substringWithRange:", v13, v11);
    v23 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
    uint64_t v24 = [v22 rangeOfCharacterFromSet:v23 options:4];
    uint64_t v26 = v25;

    if (v24 + v13 + v26 == v13 + v11) {
      uint64_t v27 = v26;
    }
    else {
      uint64_t v27 = 0;
    }
    uint64_t v28 = v11 - v27;
    if (v24 + v13 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v29 = v11;
    }
    else {
      uint64_t v29 = v28;
    }
    uint64_t v30 = objc_msgSend(*(id *)(a1 + 32), "textRangeForCharacterRange:", v13, v29);
    uint64_t v31 = *(void *)(*(void *)(a1 + 48) + 8);
    v32 = *(void **)(v31 + 40);
    *(void *)(v31 + 40) = v30;
  }
  else
  {
    v15 = *(void **)(a1 + 32);
    v16 = [v15 beginningOfDocument];
    uint64_t v17 = [v15 emptyTextRangeAtPosition:v16];
    uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
    v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;
  }
}

void __109___UITextKit1LayoutController_insertionRectForPosition_typingAttributes_placeholderAttachment_textContainer___block_invoke(uint64_t a1, void *a2)
{
  id v76 = a2;
  id v3 = [v76 textStorage];
  unint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  if (v4 < [v3 length] && objc_msgSend(v3, "length"))
  {
    uint64_t v5 = *(void **)(a1 + 32);
    if (v5
      && ([v5 bounds], CGRectIsEmpty(v78))
      && ([v3 string],
          uint64_t v6 = objc_claimAutoreleasedReturnValue(),
          int v7 = [v6 characterAtIndex:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)],
          v6,
          v7 == 65532))
    {
      uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v9 = *(void *)(v8 + 24);
      if (v9) {
        *(void *)(v8 + 24) = v9 - 1;
      }
      char v10 = 1;
    }
    else
    {
      char v10 = 0;
    }
    uint64_t v21 = [v76 glyphIndexForCharacterAtIndex:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
    [v76 lineFragmentRectForGlyphAtIndex:v21 effectiveRange:0];
    double x = v22;
    double y = v23;
    CGFloat width = v24;
    CGFloat height = v25;
    uint64_t v26 = [v76 textContainerForGlyphAtIndex:v21 effectiveRange:0];
    uint64_t v27 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v28 = *(void **)(v27 + 40);
    *(void *)(v27 + 40) = v26;

    goto LABEL_27;
  }
  double x = *MEMORY[0x1E4F1DB20];
  double y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  if (v15 != [v3 length])
  {
LABEL_26:
    char v10 = 0;
    goto LABEL_27;
  }
  if ([v3 length])
  {
    uint64_t v16 = objc_msgSend(v76, "glyphIndexForCharacterAtIndex:", objc_msgSend(v3, "length") - 1);
    [v76 lineFragmentRectForGlyphAtIndex:v16 effectiveRange:0];
    double x = v17;
    double y = v18;
    CGFloat width = v19;
    CGFloat height = v20;
  }
  else
  {
    uint64_t v16 = 0;
  }
  if ([v3 length])
  {
    [v76 extraLineFragmentRect];
    if (CGRectIsEmpty(v79))
    {
      uint64_t v29 = [v76 textContainerForGlyphAtIndex:v16 effectiveRange:0];
      uint64_t v30 = *(void *)(*(void *)(a1 + 64) + 8);
      uint64_t v31 = *(void **)(v30 + 40);
      *(void *)(v30 + 40) = v29;
    }
    else
    {
      uint64_t v48 = [v76 extraLineFragmentTextContainer];
      uint64_t v49 = *(void *)(*(void *)(a1 + 64) + 8);
      v50 = *(void **)(v49 + 40);
      *(void *)(v49 + 40) = v48;

      [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setAttributesForExtraLineFragment:*(void *)(a1 + 40)];
      [v76 extraLineFragmentRect];
      double x = v51;
      double y = v52;
      CGFloat width = v53;
      CGFloat height = v54;
    }
    goto LABEL_26;
  }
  v32 = [v76 textContainers];
  uint64_t v33 = [v32 firstObject];
  objc_msgSend(v76, "boundingRectForGlyphRange:inTextContainer:", 0, 0, v33);

  uint64_t v34 = [v76 extraLineFragmentTextContainer];
  uint64_t v35 = *(void *)(*(void *)(a1 + 64) + 8);
  v36 = *(void **)(v35 + 40);
  *(void *)(v35 + 40) = v34;

  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setAttributesForExtraLineFragment:*(void *)(a1 + 40)];
  [v76 extraLineFragmentRect];
  double x = v80.origin.x;
  double y = v80.origin.y;
  CGFloat width = v80.size.width;
  CGFloat height = v80.size.height;
  if (!CGRectIsEmpty(v80) && *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)) {
    goto LABEL_26;
  }
  v37 = [v76 textContainers];
  uint64_t v38 = [v37 firstObject];
  uint64_t v39 = *(void *)(*(void *)(a1 + 64) + 8);
  v40 = *(void **)(v39 + 40);
  *(void *)(v39 + 40) = v38;

  v41 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) textView];
  [v41 bounds];
  double x = v42;
  double y = v43;

  v44 = [*(id *)(a1 + 40) objectForKey:*(void *)off_1E52D2040];
  if (!v44)
  {
    [off_1E52D39B8 defaultFontSize];
    v44 = objc_msgSend(off_1E52D39B8, "systemFontOfSize:");
  }
  v45 = [*(id *)(a1 + 40) objectForKey:*(void *)off_1E52D21B8];
  uint64_t v46 = objc_msgSend(v45, "_ui_resolvedTextAlignment");

  if (v46 == 1)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) size];
    double x = v73 * 0.5;
  }
  else if (v46 == 2)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) size];
    double x = v47;
  }
  [v44 lineHeight];
  CGFloat height = v74;

  char v10 = 0;
  CGFloat width = height;
LABEL_27:
  uint64_t v55 = [v76 getLineFragmentInsertionPointsForCharacterAtIndex:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) alternatePositions:0 inDisplayOrder:0 positions:0 characterIndexes:0];
  if (v55)
  {
    size_t v56 = 8 * v55;
    v57 = (double *)malloc_type_malloc(8 * v55, 0x100004000313F17uLL);
    v58 = malloc_type_malloc(v56, 0x100004000313F17uLL);
    unint64_t v59 = [v76 getLineFragmentInsertionPointsForCharacterAtIndex:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) alternatePositions:0 inDisplayOrder:0 positions:v57 characterIndexes:v58];
    unint64_t v60 = 0;
    if (v59)
    {
      while (1)
      {
        unint64_t v61 = v58[v60];
        if (v61 >= *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
          break;
        }
        if (v60 && v58[v60 - 1] > v61)
        {
          v75 = [MEMORY[0x1E4F28B00] currentHandler];
          [v75 handleFailureInMethod:*(void *)(a1 + 80) object:*(void *)(a1 + 48) file:@"_UITextKit1LayoutController.m" lineNumber:333 description:@"Insertion points aren't ordered by character position"];
        }
        if (v59 == ++v60)
        {
          unint64_t v60 = v59;
          break;
        }
      }
    }
    if (v59 - 1 <= v60 || *(unsigned char *)(a1 + 88) == 0) {
      unint64_t v64 = v60;
    }
    else {
      unint64_t v64 = (v60 + 1);
    }
    if (v59 > v64)
    {
      v65 = *(double **)(*(void *)(a1 + 72) + 8);
      v65[4] = x;
      v65[5] = y;
      v65[6] = width;
      v65[7] = height;
      uint64_t v66 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) layoutOrientation];
      double v67 = v57[v64];
      uint64_t v68 = *(void *)(*(void *)(a1 + 72) + 8);
      if (v66) {
        *(double *)(v68 + 40) = y + v67;
      }
      else {
        *(double *)(v68 + 32) = x + v67;
      }
    }
    free(v57);
    free(v58);
  }
  else
  {
    v62 = *(double **)(*(void *)(a1 + 72) + 8);
    v62[4] = x;
    v62[5] = y;
    v62[6] = width;
    v62[7] = height;
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    char v69 = 0;
  }
  else {
    char v69 = v10;
  }
  uint64_t v70 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) layoutOrientation];
  uint64_t v71 = *(void *)(*(void *)(a1 + 72) + 8);
  if (v70)
  {
    *(void *)(v71 + 56) = 0x4000000000000000;
    if (v69) {
      goto LABEL_56;
    }
    v72 = (double *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  }
  else
  {
    *(void *)(v71 + 48) = 0x4000000000000000;
    if (v69) {
      goto LABEL_56;
    }
    v72 = (double *)(*(void *)(*(void *)(a1 + 72) + 8) + 32);
  }
  double *v72 = *v72 + -1.0;
LABEL_56:
}

void __81___UITextKit1LayoutController_textRangeForBounds_inTextContainer_layoutIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  int v3 = *(unsigned __int8 *)(a1 + 80);
  uint64_t v4 = *(void *)(a1 + 32);
  double v6 = *(double *)(a1 + 48);
  double v5 = *(double *)(a1 + 56);
  double v8 = *(double *)(a1 + 64);
  double v7 = *(double *)(a1 + 72);
  id v9 = a2;
  char v10 = v9;
  if (v3)
  {
    objc_msgSend(v9, "ensureLayoutForBoundingRect:inTextContainer:", v4, v6, v5, v8, v7);
    uint64_t v11 = objc_msgSend(v10, "glyphRangeForBoundingRect:inTextContainer:", *(void *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  }
  else
  {
    uint64_t v11 = objc_msgSend(v9, "glyphRangeForBoundingRectWithoutAdditionalLayout:inTextContainer:", v4, v6, v5, v8, v7);
  }
  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  *(void *)(v13 + 32) = v11;
  *(void *)(v13 + 40) = v12;
  uint64_t v14 = objc_msgSend(v10, "characterRangeForGlyphRange:actualGlyphRange:", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), 0);
  uint64_t v16 = v15;

  uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
  *(void *)(v17 + 32) = v14;
  *(void *)(v17 + 40) = v16;
}

void __64___UITextKit1LayoutController_attributesAtPosition_inDirection___block_invoke(void *a1, void *a2)
{
  int v3 = (void *)a1[4];
  id v4 = a2;
  uint64_t v5 = _UITextAttributesAtIndexWithDirection(v4, [v3 offset], a1[6]);

  uint64_t v6 = *(void *)(a1[5] + 8);
  double v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __87___UITextKit1LayoutController_selectionRectsForRange_fromView_forContainerPassingTest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v33 = 0;
  uint64_t v34 = 0;
  uint64_t v4 = [*(id *)(a1 + 32) asRange];
  uint64_t v6 = objc_msgSend(v3, "glyphRangeForCharacterRange:actualCharacterRange:", v4, v5, &v33);
  uint64_t v21 = [v3 textStorage];
  uint64_t v7 = v33;
  uint64_t v8 = v34;
  if (v8 + v7 > (unint64_t)[v21 length] || (uint64_t v9 = v33, v9 == objc_msgSend(v21, "length")))
  {
    uint64_t v10 = [v3 extraLineFragmentTextContainer];
  }
  else
  {
    uint64_t v10 = [v3 textContainerForGlyphAtIndex:v6 effectiveRange:0];
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  double v22 = [v3 textContainers];
  uint64_t v13 = [v22 indexOfObjectIdenticalTo:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v22, "subarrayWithRange:", v13, objc_msgSend(v22, "count") - v13);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = [v14 countByEnumeratingWithState:&v29 objects:v35 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v30 != v16) {
            objc_enumerationMutation(v14);
          }
          double v18 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          if ((*(unsigned int (**)(void))(*(void *)(a1 + 56) + 16))())
          {
            [v18 textContainerOrigin];
            v23[0] = MEMORY[0x1E4F143A8];
            v23[1] = 3221225472;
            v23[2] = __87___UITextKit1LayoutController_selectionRectsForRange_fromView_forContainerPassingTest___block_invoke_2;
            v23[3] = &unk_1E52DFA50;
            uint64_t v27 = v19;
            uint64_t v28 = v20;
            id v24 = *(id *)(a1 + 40);
            double v25 = v18;
            id v26 = *(id *)(a1 + 48);
            objc_msgSend(v3, "enumerateEnclosingRectsForCharacterRange:withinSelectedCharacterRange:inTextContainer:usingBlock:", v33, v34, v33, v34, v18, v23);
          }
        }
        uint64_t v15 = [v14 countByEnumeratingWithState:&v29 objects:v35 count:16];
      }
      while (v15);
    }
  }
}

void __87___UITextKit1LayoutController_selectionRectsForRange_fromView_forContainerPassingTest___block_invoke_2(uint64_t a1, double a2, double a3)
{
  +[_UIMutableTextSelectionRect selectionRectWithRect:fromView:](_UIMutableTextSelectionRect, "selectionRectWithRect:fromView:", *(void *)(a1 + 32), a2 + *(double *)(a1 + 56), a3 + *(double *)(a1 + 64));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIsVertical:", objc_msgSend(*(id *)(a1 + 40), "layoutOrientation") == 1);
  uint64_t v4 = +[UIKeyboardInputModeController sharedInputModeController];
  uint64_t v5 = [v4 currentInputMode];
  objc_msgSend(v6, "setWritingDirection:", objc_msgSend(v5, "isDefaultRightToLeft"));

  [*(id *)(a1 + 48) addObject:v6];
}

void __65___UITextKit1LayoutController_cursorPositionAtPoint_inContainer___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v30 = 0.0;
  uint64_t v4 = objc_msgSend(v3, "glyphIndexForPoint:inTextContainer:fractionOfDistanceThroughGlyph:", *(void *)(a1 + 32), &v30, *(double *)(a1 + 56), *(double *)(a1 + 64));
  v29[0] = 0;
  v29[1] = 0;
  if ([v3 numberOfGlyphs])
  {
    [v3 lineFragmentRectForGlyphAtIndex:v4 effectiveRange:v29];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
  }
  else
  {
    CGFloat v6 = *MEMORY[0x1E4F1DB28];
    CGFloat v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    CGFloat v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    CGFloat v12 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  uint64_t v13 = [v3 textStorage];
  unint64_t v14 = [v13 length];

  unint64_t v15 = objc_msgSend(v3, "characterIndexForPoint:inTextContainer:fractionOfDistanceBetweenInsertionPoints:", *(void *)(a1 + 32), &v30, *(double *)(a1 + 56), *(double *)(a1 + 64));
  BOOL v16 = v30 <= 1.0 && v30 > 0.5;
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  uint64_t v17 = objc_msgSend(v3, "glyphRangeForCharacterRange:actualCharacterRange:", v15, 1, &v27, v30);
  uint64_t v18 = v29[0];
  if (v30 == 1.0)
  {
    if (v28 + v27 == v14)
    {
      uint64_t v19 = objc_msgSend(v3, "textStorage", v30);
      uint64_t v20 = [v19 string];
      uint64_t v21 = objc_msgSend(v20, "substringWithRange:", v27, v28);
      if ([v21 _isNewlineOrReturn])
      {
        v31.origin.double x = v6;
        v31.origin.double y = v8;
        v31.size.CGFloat width = v10;
        v31.size.CGFloat height = v12;
        BOOL v16 = !CGRectContainsPoint(v31, *(CGPoint *)(a1 + 56));
      }
      else
      {
        BOOL v16 = 1;
      }

      BOOL v22 = 0;
      goto LABEL_15;
    }
    if (objc_msgSend(v3, "propertyForGlyphAtIndex:", v17, v30) == 2)
    {
      BOOL v16 = 0;
      BOOL v22 = v17 != v18;
LABEL_15:
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v22;
    }
  }
  double v23 = v30;
  if (v30 <= 0.5 && v17 == v18) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  if (v15 < v14)
  {
    uint64_t v24 = objc_msgSend(v3, "rangeOfCharacterClusterAtIndex:type:", v15, 3, v23);
    if (v16) {
      uint64_t v26 = v25;
    }
    else {
      uint64_t v26 = 0;
    }
    unint64_t v15 = v26 + v24;
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v15;
}

void __66___UITextKit1LayoutController_nearestPositionAtPoint_inContainer___block_invoke(double *a1, void *a2)
{
  uint64_t v3 = *((void *)a1 + 4);
  double v4 = a1[6];
  double v5 = a1[7];
  id v6 = a2;
  uint64_t v7 = objc_msgSend(v6, "characterIndexForGlyphAtIndex:", objc_msgSend(v6, "glyphIndexForPoint:inTextContainer:", v3, v4, v5));

  *(void *)(*(void *)(*((void *)a1 + 5) + 8) + 24) = v7;
}

void __76___UITextKit1LayoutController_enumerateTextLineFragmentsInRange_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "characterRangeForGlyphRange:actualGlyphRange:", a3, a4, 0);
  +[_UITextKitTextRange rangeWithRange:](_UITextKitTextRange, "rangeWithRange:", v5, v6);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __45___UITextKit1LayoutController_textContainers__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 textContainers];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

uint64_t __69___UITextKit1LayoutController_ensureLayoutForBounds_inTextContainer___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ensureLayoutForBoundingRect:inTextContainer:", *(void *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __67___UITextKit1LayoutController_rangeOfCharacterClusterAtIndex_type___block_invoke(void *a1, void *a2)
{
  uint64_t result = [a2 rangeOfCharacterClusterAtIndex:a1[5] type:a1[6]];
  uint64_t v4 = *(void *)(a1[4] + 8);
  *(void *)(v4 + 32) = result;
  *(void *)(v4 + 40) = v5;
  return result;
}

void __61___UITextKit1LayoutController_boundingRectForCharacterRange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend(*(id *)(a1 + 32), "boundsRectForTextBlock:glyphRange:", a2, a3, a4);
  *(CGRect *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = CGRectUnion(v5, *(CGRect *)(*(void *)(*(void *)(a1 + 40) + 8)+ 32));
}

void __70___UITextKit1LayoutController_unionRectForCharacterRange_bottomInset___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  id v5 = a2;
  uint64_t v6 = objc_msgSend(v5, "glyphRangeForCharacterRange:actualCharacterRange:", v3, v4, 0);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70___UITextKit1LayoutController_unionRectForCharacterRange_bottomInset___block_invoke_2;
  v8[3] = &unk_1E52DFBB8;
  v8[4] = a1[4];
  objc_msgSend(v5, "enumerateLineFragmentsForGlyphRange:usingBlock:", v6, v7, v8);
}

void __70___UITextKit1LayoutController_unionRectForCharacterRange_bottomInset___block_invoke_2(uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  *(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = CGRectUnion(*(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8)+ 32), *(CGRect *)&a6);
}

@end