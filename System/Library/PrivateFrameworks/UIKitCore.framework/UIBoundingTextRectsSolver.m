@interface UIBoundingTextRectsSolver
@end

@implementation UIBoundingTextRectsSolver

uint64_t __40___UIBoundingTextRectsSolver__calculate__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _calculateRectsUsingLayoutManager:a2];
}

uint64_t __68___UIBoundingTextRectsSolver__calculateRectsUsingTextLayoutManager___block_invoke(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, uint64_t a6, void *a7)
{
  id v12 = a7;
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  id v14 = *(id *)(*(void *)(a1 + 32) + 152);

  if (has_internal_diagnostics)
  {
    if (v14 != v12)
    {
      v18 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v18, OS_LOG_TYPE_FAULT, "Unexpected textContainer in rect enumeration", buf, 2u);
      }
    }
  }
  else if (v14 != v12)
  {
    v19 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_block_invoke___s_category_10) + 8);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v21[0] = 0;
      _os_log_impl(&dword_1853B0000, v19, OS_LOG_TYPE_ERROR, "Unexpected textContainer in rect enumeration", (uint8_t *)v21, 2u);
    }
  }
  v23.origin.x = a2;
  v23.origin.y = a3;
  v23.size.width = a4;
  v23.size.height = a5;
  CGRect v24 = CGRectOffset(v23, *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56));
  v15 = *(void **)(a1 + 40);
  v16 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v24.origin.x, v24.origin.y, v24.size.width, v24.size.height);
  [v15 addObject:v16];

  return 1;
}

void __64___UIBoundingTextRectsSolver__calculateRectsUsingLayoutManager___block_invoke(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4)
{
  id v7 = a2;
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  id v9 = *(id *)(*(void *)(a1 + 32) + 152);
  if (has_internal_diagnostics)
  {
    if (v9 != v7)
    {
      CGRect v23 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v23, OS_LOG_TYPE_FAULT, "Unexpected textContainer in rect enumeration", buf, 2u);
      }
    }
  }
  else if (v9 != v7)
  {
    CGRect v24 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_block_invoke_2___s_category_0) + 8);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v24, OS_LOG_TYPE_ERROR, "Unexpected textContainer in rect enumeration", buf, 2u);
    }
  }
  v33.location = a3;
  v33.length = a4;
  NSRange v10 = NSIntersectionRange(v33, *(NSRange *)(a1 + 56));
  if (v10.length > 1 || v10.location == *(void *)(a1 + 56) && v10.length == *(void *)(a1 + 64)) {
    goto LABEL_9;
  }
  id v11 = *(id *)(a1 + 40);
  uint64_t v12 = objc_msgSend(v11, "characterRangeForGlyphRange:actualGlyphRange:", v10.location, v10.length, 0);
  if (!v13)
  {
LABEL_10:

    goto LABEL_11;
  }
  uint64_t v14 = v12;
  uint64_t v15 = v13;
  v16 = [v11 textStorage];
  v17 = objc_msgSend(v16, "attributedSubstringFromRange:", v14, v15);
  v18 = [v17 string];

  v19 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  v20 = [v18 stringByTrimmingCharactersInSet:v19];
  uint64_t v21 = [v20 length];

  if (v21)
  {
LABEL_9:
    v22 = *(void **)(a1 + 40);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __64___UIBoundingTextRectsSolver__calculateRectsUsingLayoutManager___block_invoke_5;
    v26[3] = &unk_1E530C810;
    id v27 = v22;
    NSRange v30 = v10;
    id v28 = v7;
    long long v31 = *(_OWORD *)(a1 + 72);
    id v29 = *(id *)(a1 + 48);
    objc_msgSend(v27, "enumerateEnclosingRectsForGlyphRange:withinSelectedGlyphRange:inTextContainer:usingBlock:", v10.location, v10.length, *(void *)(a1 + 56), *(void *)(a1 + 64), v28, v26);

    id v11 = v27;
    goto LABEL_10;
  }
LABEL_11:
}

void __64___UIBoundingTextRectsSolver__calculateRectsUsingLayoutManager___block_invoke_5(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  objc_msgSend(*(id *)(a1 + 32), "boundingRectForGlyphRange:inTextContainer:", *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 40));
  v18.origin.y = v10;
  v18.size.height = v11;
  v15.origin.x = a2;
  v15.origin.y = a3;
  v15.size.width = a4;
  v15.size.height = a5;
  v18.origin.x = a2;
  v18.size.width = a4;
  CGRect v16 = CGRectUnion(v15, v18);
  CGRect v17 = CGRectOffset(v16, *(CGFloat *)(a1 + 72), *(CGFloat *)(a1 + 80));
  uint64_t v12 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v17.origin.x, v17.origin.y, v17.size.width, v17.size.height);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  [v12 addObject:v13];
}

@end