@interface UITextKit2LayoutController
@end

@implementation UITextKit2LayoutController

uint64_t __58___UITextKit2LayoutController_baselineOffsetForFirstGlyph__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5, double a6)
{
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a6;
  return 0;
}

uint64_t __87___UITextKit2LayoutController_coordinateSystemCompatibilityFor2022AndEarlierSDKEnabled__block_invoke()
{
  objc_opt_class();
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t result = [(id)objc_opt_class() coordinateSystemCompatibilityFor2022AndEarlierSDKEnabled];
    coordinateSystemCompatibilityFor2022AndEarlierSDKEnabled_coordinateSystemCompatibilityFor2022AndEarlierSDKEnabled = result;
  }
  return result;
}

uint64_t __109___UITextKit2LayoutController_insertionRectForPosition_typingAttributes_placeholderAttachment_textContainer___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  v5 = *(double **)(*(void *)(a1 + 32) + 8);
  v5[4] = a2;
  v5[5] = a3;
  v5[6] = a4;
  v5[7] = a5;
  return 1;
}

uint64_t __87___UITextKit2LayoutController_selectionRectsForRange_fromView_forContainerPassingTest___block_invoke_2(uint64_t a1, void *a2, void *a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  id v13 = a2;
  id v14 = a3;
  if (([*(id *)(a1 + 32) containsObject:v14] & 1) == 0
    && !(*(unsigned int (**)(void))(*(void *)(a1 + 56) + 16))())
  {
    goto LABEL_12;
  }
  v15 = [v13 location];
  v16 = [*(id *)(a1 + 40) start];
  v17 = [v16 location];
  if ([v15 compare:v17] != 1)
  {
    v18 = [*(id *)(a1 + 40) start];
    v19 = [v18 location];
    v20 = [v13 endLocation];
    if ([v19 compare:v20] != 1)
    {
      uint64_t v34 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);

      if (v34 == 0x7FFFFFFFFFFFFFFFLL) {
        *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [*(id *)(a1 + 48) count];
      }
      goto LABEL_7;
    }
  }
LABEL_7:
  v21 = [v13 location];
  v22 = [*(id *)(a1 + 40) end];
  v23 = [v22 location];
  if ([v21 compare:v23] == 1)
  {
  }
  else
  {
    v24 = [*(id *)(a1 + 40) end];
    v25 = [v24 location];
    v26 = [v13 endLocation];
    uint64_t v27 = [v25 compare:v26];

    if (v27 != 1) {
      *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [*(id *)(a1 + 48) count];
    }
  }
  *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = [v14 layoutOrientation];
  [v14 lineFragmentPadding];
  double v29 = v28;
  [v14 size];
  v37.size.width = v30 - (v29 + v29);
  v35.origin.x = a4;
  v35.origin.y = a5;
  v35.size.width = a6;
  v35.size.height = a7;
  v37.origin.x = v29;
  v37.origin.y = a5;
  v37.size.height = a7;
  CGRect v36 = CGRectIntersection(v35, v37);
  v31 = *(void **)(a1 + 48);
  v32 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v36.origin.x, v36.origin.y, v36.size.width, v36.size.height);
  [v31 addObject:v32];

  [*(id *)(a1 + 32) addObject:v14];
LABEL_12:

  return 1;
}

uint64_t __70___UITextKit2LayoutController_unionRectForCharacterRange_bottomInset___block_invoke(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  v6.size.height = a5;
  v6.size.width = a4;
  v6.origin.y = a3;
  v6.origin.x = a2;
  *(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = CGRectUnion(*(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8)+ 32), v6);
  return 1;
}

void __87___UITextKit2LayoutController_selectionRectsForRange_fromView_forContainerPassingTest___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  [a2 CGRectValue];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  id v16 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  [v16 textContainerOrigin];
  v15 = +[_UIMutableTextSelectionRect selectionRectWithRect:fromView:](_UIMutableTextSelectionRect, "selectionRectWithRect:fromView:", *(void *)(a1 + 40), v6 + v13, v8 + v14, v10, v12);
  [v15 setWritingDirection:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v15 setIsVertical:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) == 1];
  [*(id *)(a1 + 48) addObject:v15];
}

uint64_t __70___UITextKit2LayoutController_unionRectForCharacterRange_bottomInset___block_invoke_2(uint64_t a1, CGFloat a2, CGFloat y, CGFloat a4, CGFloat a5, uint64_t a6, void *a7)
{
  id v12 = a7;
  double MaxY = CGRectGetMaxY(*(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8) + 32));
  v20.origin.x = a2;
  v20.origin.y = y;
  v20.size.CGFloat width = a4;
  v20.size.height = a5;
  if (MaxY < CGRectGetMaxY(v20))
  {
    [v12 containerSize];
    CGFloat width = v14;
    double v16 = a5 + *(double *)(a1 + 40);
    CGFloat Height = CGRectGetHeight(*(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8) + 32));
    v18 = *(CGRect **)(*(void *)(a1 + 32) + 8);
    if (Height <= 0.0)
    {
      v18[1].origin.x = 0.0;
    }
    else
    {
      v22.origin.x = 0.0;
      v22.origin.y = y;
      v22.size.CGFloat width = width;
      v22.size.height = v16;
      CGRect v21 = CGRectUnion(v18[1], v22);
      y = v21.origin.y;
      CGFloat width = v21.size.width;
      double v16 = v21.size.height;
      v18 = *(CGRect **)(*(void *)(a1 + 32) + 8);
      v18[1].origin.x = v21.origin.x;
    }
    v18[1].origin.y = y;
    v18[1].size.CGFloat width = width;
    v18[1].size.height = v16;
  }

  return 1;
}

void __87___UITextKit2LayoutController_selectionRectsForRange_fromView_forContainerPassingTest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(*(void *)(a1 + 32) + 56);
  double v5 = [v3 location];
  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [v4 baseWritingDirectionAtLocation:v5];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __87___UITextKit2LayoutController_selectionRectsForRange_fromView_forContainerPassingTest___block_invoke_2;
  aBlock[3] = &unk_1E52F03A0;
  id v17 = *(id *)(a1 + 40);
  id v20 = *(id *)(a1 + 64);
  id v6 = *(id *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 80);
  id v18 = v6;
  uint64_t v21 = v7;
  id v19 = *(id *)(a1 + 56);
  long long v22 = *(_OWORD *)(a1 + 88);
  double v8 = _Block_copy(aBlock);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  uint64_t v10 = [WeakRetained customRenderController];
  if (!v10)
  {

    goto LABEL_5;
  }
  double v11 = (void *)v10;
  id v12 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  int v13 = [v12 _customRenderControllerPermitsTextSegmentEnumeration];

  if (!v13)
  {
LABEL_5:
    [*(id *)(*(void *)(a1 + 32) + 56) enumerateTextSegmentsInRange:v3 type:*(void *)(a1 + 104) options:*(void *)(a1 + 112) usingBlock:v8];
    goto LABEL_6;
  }
  id v14 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  v15 = [v14 customRenderController];
  [v15 enumerateTextSegmentsInRange:v3 type:*(void *)(a1 + 104) options:*(void *)(a1 + 112) textLayoutManager:*(void *)(*(void *)(a1 + 32) + 56) usingBlock:v8];

LABEL_6:
}

uint64_t __90___UITextKit2LayoutController_requestTextGeometryAtPosition_typingAttributes_resultBlock___block_invoke(void *a1, double a2, double a3, double a4, double a5, double a6, uint64_t a7, uint64_t a8)
{
  if (a1[4] != a8)
  {
    double v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a1[8], a1[5], @"_UITextKit2LayoutController.m", 895, @"Invalid parameter not satisfying: %@", @"thisTextContainer == textContainer" object file lineNumber description];
  }
  id v14 = *(double **)(a1[6] + 8);
  v14[4] = a2;
  v14[5] = a3;
  v14[6] = a4;
  v14[7] = a5;
  *(double *)(*(void *)(a1[7] + 8) + 24) = a6;
  return 1;
}

void __96___UITextKit2LayoutController__visualSelectionRangeForExtent_forPoint_fromPosition_inDirection___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 textRanges];
  [v2 addObjectsFromArray:v3];
}

uint64_t __109___UITextKit2LayoutController_insertionRectForPosition_typingAttributes_placeholderAttachment_textContainer___block_invoke_74(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc((Class)off_1E52D2EF8);
  double v5 = [v3 textElement];

  id v6 = [v5 elementRange];
  uint64_t v7 = [v6 endLocation];
  uint64_t v8 = [v4 initWithLocation:v7];
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  return 0;
}

uint64_t __109___UITextKit2LayoutController_insertionRectForPosition_typingAttributes_placeholderAttachment_textContainer___block_invoke_2(uint64_t a1, double a2, double a3, double a4, double a5)
{
  double v5 = *(double **)(*(void *)(a1 + 32) + 8);
  v5[4] = a2;
  v5[5] = a3;
  v5[6] = a4;
  v5[7] = a5;
  return 0;
}

uint64_t __64___UITextKit2LayoutController_attributesAtPosition_inDirection___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    int v13 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v14 = a1[8];
    uint64_t v15 = a1[4];
    double v16 = (objc_class *)objc_opt_class();
    id v17 = NSStringFromClass(v16);
    [v13 handleFailureInMethod:v14, v15, @"_UITextKit2LayoutController.m", 457, @"%@ should be an instance inheriting from %@, but it is nil", @"element", v17 object file lineNumber description];
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v13 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v18 = a1[8];
    uint64_t v19 = a1[4];
    id v20 = (objc_class *)objc_opt_class();
    id v17 = NSStringFromClass(v20);
    uint64_t v21 = NSString;
    id v22 = v3;
    v23 = (objc_class *)objc_opt_class();
    v24 = NSStringFromClass(v23);
    v25 = [v21 stringWithFormat:@"<%@: %p>", v24, v22];

    [v13 handleFailureInMethod:v18, v19, @"_UITextKit2LayoutController.m", 457, @"%@ should be an instance inheriting from %@, but it is %@", @"element", v17, v25 object file lineNumber description];
    goto LABEL_6;
  }
LABEL_3:
  id v4 = [v3 elementRange];
  double v5 = (void *)a1[5];
  id v6 = [v4 location];
  unint64_t v7 = [v5 offsetFromLocation:v6 toLocation:a1[6]];

  uint64_t v8 = [v3 attributedString];
  uint64_t v9 = _UITextAttributesAtIndexWithDirection(v8, v7, a1[9]);
  uint64_t v10 = *(void *)(a1[7] + 8);
  double v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  return 0;
}

BOOL __76___UITextKit2LayoutController_enumerateTextLineFragmentsInRange_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  unsigned __int8 v40 = 0;
  [v3 rangeInElement];
  v32 = uint64_t v31 = a1;
  id v4 = [*(id *)(a1 + 32) textRangeByIntersectingWithTextRange:v32];
  double v5 = v4;
  if (v4 && ![v4 isEmpty])
  {
    unint64_t v7 = *(void **)(a1 + 40);
    uint64_t v8 = [v32 location];
    uint64_t v9 = [v5 location];
    v36[0] = [v7 offsetFromLocation:v8 toLocation:v9];

    uint64_t v10 = *(void **)(v31 + 40);
    double v11 = [v32 location];
    double v28 = v5;
    id v12 = [v5 endLocation];
    uint64_t v13 = [v10 offsetFromLocation:v11 toLocation:v12];

    long long v38 = 0u;
    long long v39 = 0u;
    *(_OWORD *)&v36[1] = 0u;
    long long v37 = 0u;
    id v29 = v3;
    id obj = [v3 textLineFragments];
    uint64_t v35 = [obj countByEnumeratingWithState:&v36[1] objects:v42 count:16];
    if (v35)
    {
      NSUInteger v14 = 0;
      NSUInteger range2 = v13 - v36[0];
      uint64_t v33 = *(void *)v37;
LABEL_6:
      uint64_t v15 = 0;
      while (1)
      {
        if (*(void *)v37 != v33) {
          objc_enumerationMutation(obj);
        }
        [*(id *)(v36[2] + 8 * v15) characterRange];
        NSUInteger length = v44.length;
        v44.location = v14;
        v45.location = v36[0];
        v45.NSUInteger length = range2;
        NSRange v17 = NSIntersectionRange(v44, v45);
        if (v17.length)
        {
          uint64_t v18 = *(void **)(v31 + 40);
          uint64_t v19 = [v32 location];
          id v20 = [v18 locationFromLocation:v19 withOffset:v17.location];

          uint64_t v21 = [*(id *)(v31 + 40) locationFromLocation:v20 withOffset:v17.length];
          id v22 = (void *)[objc_alloc((Class)off_1E52D2EF8) initWithLocation:v20 endLocation:v21];
          uint64_t v23 = *(void *)(v31 + 56);
          uint64_t v24 = *(void *)(*(void *)(v31 + 48) + 48);
          v41 = v22;
          v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
          v26 = +[_UITextKitTextRange rangeWithTextContentManager:v24 textRanges:v25 affinity:0];
          (*(void (**)(uint64_t, void *, unsigned __int8 *))(v23 + 16))(v23, v26, &v40);

          LODWORD(v23) = v40;
          if (v23) {
            break;
          }
        }
        v14 += length;
        if (v35 == ++v15)
        {
          uint64_t v35 = [obj countByEnumeratingWithState:&v36[1] objects:v42 count:16];
          if (v35) {
            goto LABEL_6;
          }
          break;
        }
      }
    }

    BOOL v6 = v40 == 0;
    double v5 = v28;
    id v3 = v29;
  }
  else
  {
    BOOL v6 = 0;
    unsigned __int8 v40 = 1;
  }

  return v6;
}

BOOL __87___UITextKit2LayoutController_enumerateTextSegmentsInRange_inTextContainer_usingBlock___block_invoke(uint64_t a1)
{
  char v2 = 0;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  return v2 == 0;
}

uint64_t __52___UITextKit2LayoutController_extraLineFragmentRect__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5, uint64_t a6, void *a7)
{
  uint64_t v8 = *(double **)(*(void *)(a1 + 32) + 8);
  v8[4] = a2;
  v8[5] = a3;
  v8[6] = a4;
  v8[7] = a5;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = 0;
  [a7 size];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = v9;
  return 1;
}

uint64_t __69___UITextKit2LayoutController_addAnnotationAttribute_value_forRange___block_invoke(void *a1, uint64_t a2)
{
  return [*(id *)(a1[4] + 56) addTemporaryAttribute:a1[5] value:a1[6] forTextRange:a2];
}

void __62___UITextKit2LayoutController_annotationAttribute_atPosition___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, unsigned char *a5)
{
  uint64_t v7 = [a3 objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  *a5 = 1;
}

uint64_t __66___UITextKit2LayoutController_removeAnnotationAttribute_forRange___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) removeTemporaryAttribute:*(void *)(a1 + 40) forTextRange:a2];
}

void __63___UITextKit2LayoutController_addRenderingAttributes_forRange___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) textKit2Ranges];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63___UITextKit2LayoutController_addRenderingAttributes_forRange___block_invoke_2;
  v10[3] = &unk_1E52F0418;
  v10[4] = *(void *)(a1 + 40);
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  [v7 enumerateObjectsUsingBlock:v10];
}

uint64_t __63___UITextKit2LayoutController_addRenderingAttributes_forRange___block_invoke_2(void *a1, uint64_t a2)
{
  return [*(id *)(a1[4] + 56) addTemporaryAttribute:a1[5] value:a1[6] forTextRange:a2];
}

uint64_t __66___UITextKit2LayoutController_removeRenderingAttributes_forRange___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) removeTemporaryAttribute:*(void *)(a1 + 40) forTextRange:a2];
}

uint64_t __53___UITextKit2LayoutController_attributedTextInRange___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v23 = a1[9];
    uint64_t v24 = a1[4];
    v25 = (objc_class *)objc_opt_class();
    id v22 = NSStringFromClass(v25);
    v26 = NSString;
    id v27 = v3;
    double v28 = (objc_class *)objc_opt_class();
    id v29 = NSStringFromClass(v28);
    double v30 = [v26 stringWithFormat:@"<%@: %p>", v29, v27];

    [v18 handleFailureInMethod:v23, v24, @"_UITextKit2LayoutController.m", 783, @"%@ should be an instance inheriting from %@, but it is %@", @"element", v22, v30 object file lineNumber description];
  }
  else
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v19 = a1[9];
    uint64_t v20 = a1[4];
    uint64_t v21 = (objc_class *)objc_opt_class();
    id v22 = NSStringFromClass(v21);
    [v18 handleFailureInMethod:v19, v20, @"_UITextKit2LayoutController.m", 783, @"%@ should be an instance inheriting from %@, but it is nil", @"element", v22 object file lineNumber description];
  }

LABEL_3:
  id v4 = [v3 elementRange];
  if ([v4 containsLocation:a1[5]])
  {
    id v5 = (void *)a1[6];
    id v6 = [v4 location];
    uint64_t v7 = [v5 offsetFromLocation:v6 toLocation:a1[5]];
  }
  else
  {
    uint64_t v7 = 0;
  }
  int v8 = [v4 containsLocation:a1[7]];
  id v9 = (void *)a1[6];
  uint64_t v10 = [v4 location];
  if (v8)
  {
    uint64_t v11 = [v9 offsetFromLocation:v10 toLocation:a1[7]];
  }
  else
  {
    id v12 = [v4 endLocation];
    uint64_t v11 = [v9 offsetFromLocation:v10 toLocation:v12];
  }
  uint64_t v13 = v11 - v7;
  NSUInteger v14 = (void *)a1[8];
  uint64_t v15 = [v3 attributedString];
  double v16 = objc_msgSend(v15, "attributedSubstringFromRange:", v7, v13);
  [v14 appendAttributedString:v16];

  return v8 ^ 1u;
}

void __58___UITextKit2LayoutController_annotatedSubstringForRange___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, unsigned char *a5)
{
  id v18 = a3;
  id v9 = a4;
  uint64_t v10 = [a2 textContentManager];
  uint64_t v11 = [*(id *)(a1 + 32) textRangeByIntersectingWithTextRange:v9];

  if (v11)
  {
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v13 = [v11 location];
    uint64_t v14 = [v10 offsetFromLocation:v12 toLocation:v13];

    uint64_t v15 = *(void *)(a1 + 40);
    double v16 = [v11 endLocation];
    uint64_t v17 = [v10 offsetFromLocation:v15 toLocation:v16];

    objc_msgSend(*(id *)(a1 + 48), "setAttributes:range:", v18, v14, v17 - v14);
  }
  else
  {
    *a5 = 1;
  }
}

uint64_t __75___UITextKit2LayoutController__writingToolsMinimumContextualRangeForRange___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v15 = a1[8];
    uint64_t v16 = a1[4];
    uint64_t v17 = (objc_class *)objc_opt_class();
    id v18 = NSStringFromClass(v17);
    [v14 handleFailureInMethod:v15, v16, @"_UITextKit2LayoutController.m", 838, @"%@ should be an instance inheriting from %@, but it is nil", @"element", v18 object file lineNumber description];
LABEL_12:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v19 = a1[8];
    uint64_t v20 = a1[4];
    uint64_t v21 = (objc_class *)objc_opt_class();
    id v18 = NSStringFromClass(v21);
    id v22 = NSString;
    id v23 = v3;
    uint64_t v24 = (objc_class *)objc_opt_class();
    v25 = NSStringFromClass(v24);
    v26 = [v22 stringWithFormat:@"<%@: %p>", v25, v23];

    [v14 handleFailureInMethod:v19, v20, @"_UITextKit2LayoutController.m", 838, @"%@ should be an instance inheriting from %@, but it is %@", @"element", v18, v26 object file lineNumber description];
    goto LABEL_12;
  }
LABEL_3:
  id v4 = [v3 elementRange];
  id v5 = v4;
  uint64_t v6 = a1[7];
  if (!*(void *)(*(void *)(v6 + 8) + 40))
  {
    int v7 = [v4 containsLocation:a1[5]];
    uint64_t v6 = a1[7];
    if (v7)
    {
      objc_storeStrong((id *)(*(void *)(v6 + 8) + 40), v5);
      uint64_t v6 = a1[7];
    }
  }
  int v8 = *(void **)(*(void *)(v6 + 8) + 40);
  if (v8)
  {
    uint64_t v9 = [v8 textRangeByFormingUnionWithTextRange:v5];
    uint64_t v10 = *(void *)(a1[7] + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    uint64_t v12 = [v5 containsLocation:a1[6]] ^ 1;
  }
  else
  {
    uint64_t v12 = 1;
  }

  return v12;
}

uint64_t __52___UITextKit2LayoutController_boundingRectForRange___block_invoke(uint64_t a1, void *a2, void *a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  id v13 = a2;
  id v14 = a3;
  uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 8);
  id v18 = *(void **)(v15 + 40);
  uint64_t v16 = (id *)(v15 + 40);
  id v17 = v18;
  if (!v18)
  {
    objc_storeStrong(v16, a3);
    goto LABEL_5;
  }
  if (v17 == v14)
  {
LABEL_5:
    v21.origin.x = a4;
    v21.origin.y = a5;
    v21.size.CGFloat width = a6;
    v21.size.height = a7;
    *(CGRect *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = CGRectUnion(*(CGRect *)(*(void *)(*(void *)(a1 + 40) + 8)+ 32), v21);
    uint64_t v19 = 1;
    goto LABEL_6;
  }
  uint64_t v19 = 0;
LABEL_6:

  return v19;
}

void __67___UITextKit2LayoutController_rangeOfCharacterClusterAtIndex_type___block_invoke(void *a1, uint64_t a2, void *a3, uint64_t a4, BOOL *a5)
{
  id v7 = a3;
  int v8 = [*(id *)(a1[4] + 56) textContentManager];
  uint64_t v9 = [v8 documentRange];
  uint64_t v10 = [v9 location];

  id v18 = v7;
  id v11 = v8;
  id v12 = v10;
  id v13 = [v18 location];
  uint64_t v14 = [v11 offsetFromLocation:v12 toLocation:v13];

  uint64_t v15 = [v18 endLocation];

  uint64_t v16 = [v11 offsetFromLocation:v12 toLocation:v15];
  uint64_t v17 = *(void *)(a1[5] + 8);
  *(void *)(v17 + 32) = v14;
  *(void *)(v17 + 40) = v16 - v14;
  *a5 = *(void *)(*(void *)(a1[5] + 8) + 40) + *(void *)(*(void *)(a1[5] + 8) + 32) > a1[6];
}

@end