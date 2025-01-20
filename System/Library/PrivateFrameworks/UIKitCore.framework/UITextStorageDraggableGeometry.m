@interface UITextStorageDraggableGeometry
@end

@implementation UITextStorageDraggableGeometry

void __71___UITextStorageDraggableGeometry_textRangesForAttachmentsInTextRange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
    objc_msgSend(WeakRetained, "_textRangeFromNSRange:", a3, a4);
    id v8 = (id)objc_claimAutoreleasedReturnValue();

    [*(id *)(a1 + 40) addObject:v8];
  }
}

void __71___UITextStorageDraggableGeometry_textRangesForAttachmentsInTextRange___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v9 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
    id v8 = objc_msgSend(WeakRetained, "_textRangeFromNSRange:", a3, a4);

    [*(id *)(a1 + 40) addObject:v8];
  }
}

void __77___UITextStorageDraggableGeometry_textRangeForAttachmentInTextRange_atPoint___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
    objc_msgSend(WeakRetained, "_textRangeFromNSRange:", a3, a4);
    id obj = (id)objc_claimAutoreleasedReturnValue();

    id v10 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
    LODWORD(a3) = UITextRangeContainsPointInViewWithSlop(v10, obj, *(double *)(a1 + 48), *(double *)(a1 + 56), 0.0);

    if (a3)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
      *a5 = 1;
    }
  }
}

void __77___UITextStorageDraggableGeometry_textRangeForAttachmentInTextRange_atPoint___block_invoke_2(uint64_t a1, uint64_t a2, NSUInteger a3, NSUInteger a4, unsigned char *a5)
{
  NSUInteger v13 = a3;
  NSUInteger v14 = a4;
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
    ExtendAttributedRangeForAttribute(WeakRetained, a3, a4, *(void **)off_1E52D2110, &v13);

    id v10 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
    v11 = objc_msgSend(v10, "_textRangeFromNSRange:", v13, v14);

    id v12 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
    LODWORD(WeakRetained) = UITextRangeContainsPointInViewWithSlop(v12, v11, *(double *)(a1 + 48), *(double *)(a1 + 56), 4.0);

    if (WeakRetained)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v11);
      *a5 = 1;
    }
  }
}

void __64___UITextStorageDraggableGeometry_draggableObjectsForTextRange___block_invoke(id *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (v7 && [off_1E52D2EB0 _attachmentHasImage:v7])
  {
    id WeakRetained = objc_loadWeakRetained((id *)a1[4] + 3);
    id v9 = objc_msgSend(WeakRetained, "_textRangeFromNSRange:", a3, a4);

    id v10 = [off_1E52D2EB0 _imageFromAttachment:v7];
    v11 = (void *)[objc_alloc(MEMORY[0x1E4F28D78]) initWithObject:v10];
    id v12 = +[UITextDraggableObject draggableObjectWithItemProvider:v11 fromRange:v9];
    NSUInteger v13 = [a1[4] _targetedPreviewProviderForImage:v10 inRange:v9];
    [v12 setTargetedPreviewProvider:v13];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __64___UITextStorageDraggableGeometry_draggableObjectsForTextRange___block_invoke_2;
    v15[3] = &unk_1E5309CF0;
    id v14 = v10;
    id v16 = v14;
    [v12 setPreviewProvider:v15];
    [a1[5] addObject:v12];
    if (([a1[6] containsObject:v9] & 1) == 0) {
      [a1[6] addObject:v9];
    }
  }
}

UIDragPreview *__64___UITextStorageDraggableGeometry_draggableObjectsForTextRange___block_invoke_2(uint64_t a1)
{
  v1 = [[UIImageView alloc] initWithImage:*(void *)(a1 + 32)];
  v2 = [[UIDragPreview alloc] initWithView:v1];

  return v2;
}

void __64___UITextStorageDraggableGeometry_draggableObjectsForTextRange___block_invoke_3(id *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (v7)
  {
    id v8 = v7;
    id WeakRetained = objc_loadWeakRetained((id *)a1[4] + 3);
    id v10 = objc_msgSend(WeakRetained, "_textRangeFromNSRange:", a3, a4);

    if ([a1[5] containsObject:v10])
    {
LABEL_13:

      return;
    }
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x3010000000;
    v39 = &unk_186D7DBA7;
    uint64_t v40 = a3;
    uint64_t v41 = a4;
    id v11 = objc_loadWeakRetained((id *)a1[4] + 3);
    id v12 = [v10 start];
    NSUInteger v13 = [v11 _rangeOfSentenceEnclosingPosition:v12];

    id v14 = objc_loadWeakRetained((id *)a1[4] + 4);
    id v15 = objc_loadWeakRetained((id *)a1[4] + 3);
    uint64_t v16 = [v15 _nsrangeForTextRange:v13];
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)off_1E52D2110;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __64___UITextStorageDraggableGeometry_draggableObjectsForTextRange___block_invoke_4;
    v33[3] = &unk_1E5309D40;
    id v8 = v8;
    id v34 = v8;
    v35 = &v36;
    objc_msgSend(v14, "enumerateAttribute:inRange:options:usingBlock:", v19, v16, v18, 0, v33);

    id v20 = objc_loadWeakRetained((id *)a1[4] + 4);
    v21 = objc_msgSend(v20, "attributedSubstringFromRange:", v37[4], v37[5]);
    v22 = [v21 string];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v23 = [MEMORY[0x1E4F1CB10] URLWithString:v8 encodingInvalidCharacters:0];

      id v8 = (id)v23;
    }
    if ([a1[4] _isActualLink:v8])
    {
      v24 = (void *)[objc_alloc(MEMORY[0x1E4F28D78]) initWithObject:v8];
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __64___UITextStorageDraggableGeometry_draggableObjectsForTextRange___block_invoke_5;
      aBlock[3] = &unk_1E5309D68;
      id v31 = v8;
      id v32 = v22;
      v25 = _Block_copy(aBlock);

      if (!v24) {
        goto LABEL_12;
      }
    }
    else
    {
      if (![v22 length])
      {
        v25 = 0;
        v24 = 0;
        goto LABEL_12;
      }
      v24 = (void *)[objc_alloc(MEMORY[0x1E4F28D78]) initWithObject:v22];
      v25 = 0;
      if (!v24)
      {
LABEL_12:

        _Block_object_dispose(&v36, 8);
        goto LABEL_13;
      }
    }
    id v26 = objc_loadWeakRetained((id *)a1[4] + 3);
    v27 = objc_msgSend(v26, "_textRangeFromNSRange:", v37[4], v37[5]);

    v28 = +[UITextDraggableObject draggableObjectWithItemProvider:v24 fromRange:v10];
    v29 = [a1[4] _targetedPreviewProviderForTextInRange:v27 dismissing:0 overrideLifting:&__block_literal_global_548];
    [v28 setTargetedPreviewProvider:v29];

    [v28 setPreviewProvider:v25];
    [a1[6] addObject:v28];
    [a1[5] addObject:v10];

    goto LABEL_12;
  }
}

uint64_t __64___UITextStorageDraggableGeometry_draggableObjectsForTextRange___block_invoke_4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  if (*(void *)(result + 32) == a2)
  {
    uint64_t v5 = *(void *)(*(void *)(result + 40) + 8);
    *(void *)(v5 + 32) = a3;
    *(void *)(v5 + 40) = a4;
    *a5 = 1;
  }
  return result;
}

UIDragPreview *__64___UITextStorageDraggableGeometry_draggableObjectsForTextRange___block_invoke_5(uint64_t a1)
{
  return +[UIDragPreview previewForURL:*(void *)(a1 + 32) title:*(void *)(a1 + 40)];
}

uint64_t __64___UITextStorageDraggableGeometry_draggableObjectsForTextRange___block_invoke_6()
{
  return 0;
}

uint64_t __64___UITextStorageDraggableGeometry_draggableObjectsForTextRange___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  v4 = (id *)(*(void *)(a1 + 32) + 24);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  id v8 = [v6 start];

  id v9 = [v5 start];

  uint64_t v10 = [WeakRetained comparePosition:v8 toPosition:v9];
  return v10;
}

uint64_t __64___UITextStorageDraggableGeometry_draggableObjectsForTextRange___block_invoke_8(void *a1, void *a2)
{
  v3 = (id *)(a1[4] + 24);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  uint64_t v6 = [WeakRetained _nsrangeForTextRange:v4];
  uint64_t v8 = v7;

  id v9 = (void *)a1[5];
  uint64_t v10 = v6 - a1[6];
  return objc_msgSend(v9, "deleteCharactersInRange:", v10, v8);
}

void __66___UITextStorageDraggableGeometry_attributedStringsForTextRanges___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * v8);
        id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 24));
        uint64_t v11 = objc_msgSend(WeakRetained, "_nsrangeForTextRange:", v9, (void)v15);
        uint64_t v13 = v12;

        id v14 = objc_msgSend(v3, "attributedSubstringFromRange:", v11, v13);
        if (v14) {
          [*(id *)(a1 + 48) addObject:v14];
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
}

void __64___UITextStorageDraggableGeometry_performSameViewDropOperation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  NSUInteger v4 = [v3 length] + 1;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  uint64_t v6 = [*(id *)(a1 + 40) targetRange];
  NSUInteger v7 = [WeakRetained _nsrangeForTextRange:v6];
  NSUInteger v9 = v8;

  v63.NSUInteger location = v7;
  v63.NSUInteger length = v9;
  v66.NSUInteger location = 0;
  NSUInteger range2 = v4;
  v66.NSUInteger length = v4;
  NSRange v10 = NSIntersectionRange(v63, v66);
  if ([*(id *)(a1 + 40) operation] == 2)
  {
    if (v10.length) {
      objc_msgSend(v3, "deleteCharactersInRange:", v10.location, v10.length);
    }
    uint64_t v11 = [*(id *)(a1 + 40) text];
    [v3 insertAttributedString:v11 atIndex:v10.location];
  }
  else if ([*(id *)(a1 + 40) operation] == 3)
  {
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id obj = [*(id *)(a1 + 40) sourceRanges];
    uint64_t v12 = [obj countByEnumeratingWithState:&v56 objects:v61 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      NSUInteger length = 0;
      NSUInteger location = 0;
      uint64_t v16 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          long long v18 = v3;
          if (*(void *)v57 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = *(void *)(*((void *)&v56 + 1) + 8 * i);
          uint64_t v20 = a1;
          id v21 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
          NSUInteger v22 = [v21 _nsrangeForTextRange:v19];
          NSUInteger v24 = v23;

          v64.NSUInteger location = v22;
          v64.NSUInteger length = v24;
          v67.NSUInteger location = 0;
          v67.NSUInteger length = range2;
          NSRange v25 = NSIntersectionRange(v64, v67);
          id v3 = v18;
          objc_msgSend(v18, "addAttribute:value:range:", @"_UIToBeDeleted", MEMORY[0x1E4F1CC38], v25.location, v25.length);
          if (length)
          {
            v68.NSUInteger location = location;
            v68.NSUInteger length = length;
            NSRange v26 = NSUnionRange(v25, v68);
            NSUInteger location = v26.location;
            NSUInteger length = v26.length;
          }
          else
          {
            NSUInteger location = v25.location;
            NSUInteger length = v25.length;
          }
          a1 = v20;
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v56 objects:v61 count:16];
      }
      while (v13);
    }
    else
    {
      NSUInteger length = 0;
      NSUInteger location = 0;
    }

    if (v10.length) {
      [v3 deleteCharactersInRange:v10.location];
    }
    v27 = [*(id *)(a1 + 40) text];
    v28 = (void *)[v27 mutableCopy];

    uint64_t v29 = [v28 length];
    objc_msgSend(v28, "addAttribute:value:range:", @"_UIResult", MEMORY[0x1E4F1CC38], 0, v29);
    [v3 insertAttributedString:v28 atIndex:v10.location];
    v69.NSUInteger length = [v3 length];
    v65.NSUInteger location = (location - v29) & ~((uint64_t)(location - v29) >> 63);
    v65.NSUInteger length = length + 2 * v29;
    v69.NSUInteger location = 0;
    NSRange v30 = NSIntersectionRange(v65, v69);
    id v31 = (void *)MEMORY[0x1E4F1CA48];
    id v32 = [*(id *)(a1 + 40) sourceRanges];
    v33 = objc_msgSend(v31, "arrayWithCapacity:", objc_msgSend(v32, "count"));

    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __64___UITextStorageDraggableGeometry_performSameViewDropOperation___block_invoke_2;
    v54[3] = &unk_1E52D9A30;
    id v34 = v33;
    id v55 = v34;
    objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", @"_UIToBeDeleted", v30.location, v30.length, 0, v54);
    [v34 sortUsingComparator:&__block_literal_global_26_6];
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v35 = v34;
    uint64_t v36 = [v35 countByEnumeratingWithState:&v50 objects:v60 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v51;
      do
      {
        for (uint64_t j = 0; j != v37; ++j)
        {
          if (*(void *)v51 != v38) {
            objc_enumerationMutation(v35);
          }
          uint64_t v40 = [*(id *)(*((void *)&v50 + 1) + 8 * j) rangeValue];
          objc_msgSend(v3, "deleteCharactersInRange:", v40, v41);
        }
        uint64_t v37 = [v35 countByEnumeratingWithState:&v50 objects:v60 count:16];
      }
      while (v37);
    }

    uint64_t v42 = [v3 length];
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __64___UITextStorageDraggableGeometry_performSameViewDropOperation___block_invoke_4;
    v49[3] = &unk_1E5309E50;
    uint64_t v43 = *(void *)(a1 + 48);
    v49[4] = *(void *)(a1 + 32);
    v49[5] = v43;
    objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", @"_UIResult", 0, v42, 0, v49);
    id v44 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
    uint64_t v45 = [v44 _nsrangeForTextRange:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    objc_msgSend(v3, "removeAttribute:range:", @"_UIResult", v45, v46);
  }
}

void __64___UITextStorageDraggableGeometry_performSameViewDropOperation___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    [v2 addObject:v3];
  }
}

uint64_t __64___UITextStorageDraggableGeometry_performSameViewDropOperation___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  unint64_t v5 = [a2 rangeValue];
  unint64_t v6 = [v4 rangeValue];

  if (v5 > v6) {
    return -1;
  }
  else {
    return v5 < v6;
  }
}

void __64___UITextStorageDraggableGeometry_performSameViewDropOperation___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
    uint64_t v10 = objc_msgSend(WeakRetained, "_textRangeFromNSRange:", a3, a4);
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    *a5 = 1;
  }
}

UITargetedDragPreview *__76___UITextStorageDraggableGeometry__targetedPreviewProviderForImage_inRange___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  uint64_t v5 = *(void *)(a1 + 32);
  if (has_internal_diagnostics)
  {
    if (v5) {
      goto LABEL_3;
    }
    v39 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1853B0000, v39, OS_LOG_TYPE_FAULT, "generating a preview for a nil image!", buf, 2u);
    }
  }
  else
  {
    if (v5) {
      goto LABEL_3;
    }
    uint64_t v40 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_block_invoke___s_category_7) + 8);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      v41[0] = 0;
      _os_log_impl(&dword_1853B0000, v40, OS_LOG_TYPE_ERROR, "generating a preview for a nil image!", (uint8_t *)v41, 2u);
    }
  }
  if (!*(void *)(a1 + 32))
  {
    uint64_t v37 = 0;
    goto LABEL_6;
  }
LABEL_3:
  unint64_t v6 = [[UIImageView alloc] initWithImage:*(void *)(a1 + 32)];
  NSUInteger v7 = *(void **)(a1 + 48);
  id v8 = *(id *)(a1 + 40);
  id v9 = v7;
  uint64_t v10 = [v8 textInputView];
  [v8 _boundingRectForRange:v9];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  if ([v10 isDescendantOfView:v8])
  {
    objc_msgSend(v10, "convertRect:toView:", v8, v12, v14, v16, v18);
    double v12 = v19;
    double v14 = v20;
    double v16 = v21;
    double v18 = v22;
  }

  objc_msgSend(v8, "convertRect:toView:", v3, v12, v14, v16, v18);
  -[UIImageView setFrame:](v6, "setFrame:");
  NSUInteger v23 = [UITargetedDragPreview alloc];
  NSUInteger v24 = objc_opt_new();
  NSRange v25 = v6;
  id v26 = v3;
  v27 = [UIDragPreviewTarget alloc];
  [(UIView *)v25 frame];
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;

  uint64_t v36 = -[UIPreviewTarget initWithContainer:center:](v27, "initWithContainer:center:", v26, v29 + v33 * 0.5, v31 + v35 * 0.5);
  uint64_t v37 = [(UITargetedDragPreview *)v23 initWithView:v25 parameters:v24 target:v36];

LABEL_6:
  return v37;
}

UITargetedDragPreview *__101___UITextStorageDraggableGeometry__targetedPreviewProviderForTextInRange_dismissing_overrideLifting___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  NSUInteger v7 = [WeakRetained _window];
  uint64_t v8 = [v5 _window];
  id v9 = (void *)v8;
  if (v7) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    double v11 = 0;
    goto LABEL_32;
  }
  uint64_t v12 = *(void *)(a1 + 48);
  if (v12) {
    a3 = (*(uint64_t (**)(void))(v12 + 16))();
  }
  double v13 = *(void **)(a1 + 32);
  uint64_t v14 = *(void *)(a1 + 40);
  id v72 = 0;
  v73[0] = 0;
  [v13 _renderTextInRange:v14 image:v73 boundingRectangles:&v72 forLifting:a3];
  id v15 = v73[0];
  id v16 = v72;
  double v11 = 0;
  if (v15 && v16)
  {
    id v71 = v16;
    v70 = [[UIImageView alloc] initWithImage:v15];
    double v17 = *(void **)(a1 + 40);
    id v18 = WeakRetained;
    id v19 = v17;
    double v20 = [v18 textInputView];
    [v18 _boundingRectForRange:v19];
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;

    if ([v20 isDescendantOfView:v18])
    {
      objc_msgSend(v20, "convertRect:toView:", v18, v22, v24, v26, v28);
      double v22 = v29;
      double v24 = v30;
    }
    double v31 = v70;

    [(UIView *)v70 bounds];
    objc_msgSend(v18, "convertRect:toView:", v7, v22, v24);
    double v33 = v32;
    double v35 = v34;
    double v37 = v36;
    double v39 = v38;
    objc_msgSend(v9, "convertRect:fromWindow:", v7);
    objc_msgSend(v5, "convertRect:fromView:", v9);
    -[UIImageView setFrame:](v70, "setFrame:");
    uint64_t v40 = [(UIPreviewParameters *)[UIDragPreviewParameters alloc] initWithTextLineRects:v71];
    id v69 = v15;
    if (([*(id *)(a1 + 32) geometryOptions] & 1) == 0)
    {
      uint64_t v41 = [v18 backgroundColor];
      if (v41)
      {
        uint64_t v42 = (void *)v41;
        [v18 backgroundColor];
        v44 = uint64_t v43 = v40;
        uint64_t v45 = +[UIColor clearColor];

        BOOL v10 = v44 == v45;
        uint64_t v40 = v43;
        if (!v10)
        {
          uint64_t v46 = [v18 backgroundColor];
LABEL_22:
          v48 = (void *)v46;
          [(UIPreviewParameters *)v40 setBackgroundColor:v46];
          double v31 = v70;
LABEL_29:
          v47 = v40;
LABEL_30:

          v54 = [UITargetedDragPreview alloc];
          id v55 = v31;
          id v56 = v5;
          long long v57 = [UIDragPreviewTarget alloc];
          [(UIView *)v55 frame];
          double v59 = v58;
          double v61 = v60;
          double v63 = v62;
          double v65 = v64;

          NSRange v66 = -[UIPreviewTarget initWithContainer:center:](v57, "initWithContainer:center:", v56, v59 + v63 * 0.5, v61 + v65 * 0.5);
          double v11 = [(UITargetedDragPreview *)v54 initWithView:v55 parameters:v47 target:v66];

          id v16 = v71;
          id v15 = v69;
          goto LABEL_31;
        }
      }
      if (*(unsigned char *)(a1 + 56))
      {
        if (*(void *)(*(void *)(a1 + 32) + 8))
        {
          v47 = v40;
          -[UIPreviewParameters setBackgroundColor:](v40, "setBackgroundColor:");
        }
        else
        {
          v49 = +[UIColor systemBackgroundColor];
          v47 = v40;
          [(UIPreviewParameters *)v40 setBackgroundColor:v49];
        }
        double v31 = v70;
        uint64_t v50 = *(void *)(a1 + 32);
        v48 = *(void **)(v50 + 8);
        *(void *)(v50 + 8) = 0;
        goto LABEL_30;
      }
      if ([v18 _currentUserInterfaceIdiom] == 6)
      {
        uint64_t v46 = +[UIColor systemBackgroundColor];
        goto LABEL_22;
      }
      uint64_t v51 = objc_msgSend(v7, "createIOSurfaceWithFrame:", v33, v35, v37, v39);
      double v31 = v70;
      if (v51)
      {
        long long v52 = (const void *)v51;
        long long v53 = [[UIImage alloc] initWithIOSurface:v51];
        v48 = v53;
        if (v53) {
          [(UIImage *)v53 _calculateEdgeStatistics];
        }
        NSRange v68 = +[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
        [(UIPreviewParameters *)v40 setBackgroundColor:v68];
        CFRelease(v52);

        goto LABEL_29;
      }
    }
    v48 = +[UIColor systemBackgroundColor];
    [(UIPreviewParameters *)v40 setBackgroundColor:v48];
    goto LABEL_29;
  }
LABEL_31:

LABEL_32:
  return v11;
}

UIDragPreview *__66___UITextStorageDraggableGeometry__previewProviderForTextInRange___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  id v10 = 0;
  double v11 = 0;
  [v2 _renderTextInRange:v1 image:&v11 boundingRectangles:&v10 forLifting:0];
  id v3 = v11;
  id v4 = v10;
  id v5 = v3;
  unint64_t v6 = [[UIImageView alloc] initWithImage:v5];
  NSUInteger v7 = [(UIPreviewParameters *)[UIDragPreviewParameters alloc] initWithTextLineRects:v4];

  uint64_t v8 = [[UIDragPreview alloc] initWithView:v6 parameters:v7];
  return v8;
}

@end