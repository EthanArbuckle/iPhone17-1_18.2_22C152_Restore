@interface UIRevealInteraction
+ (id)revealItemForTextInput:(id)a3 locationInTextInputView:(CGPoint)a4;
@end

@implementation UIRevealInteraction

+ (id)revealItemForTextInput:(id)a3 locationInTextInputView:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  v33[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = objc_msgSend(v6, "closestPositionToPoint:", x, y);
  v8 = [v6 positionFromPosition:v7 offset:-1];
  if (v8)
  {
    uint64_t v9 = [v6 textRangeFromPosition:v8 toPosition:v7];
  }
  else
  {
    v8 = [v6 positionFromPosition:v7 offset:1];
    if (!v8)
    {
      v10 = 0;
      goto LABEL_18;
    }
    uint64_t v9 = [v6 textRangeFromPosition:v7 toPosition:v8];
  }
  v10 = (void *)v9;
  if (v9)
  {
    unint64_t v11 = [v6 _nsrangeForTextRange:v9];
    uint64_t v27 = [v6 _selectedNSRange];
    uint64_t v13 = v12;
    v14 = [v6 beginningOfDocument];
    v15 = [v6 endOfDocument];
    v16 = [v6 textRangeFromPosition:v14 toPosition:v15];
    v17 = [v6 textInRange:v16];

    unint64_t v18 = [v17 length];
    if (v18 && v18 == v11)
    {
      --v11;
    }
    else
    {
      v19 = 0;
      if (!v18 || v11 > v18)
      {
LABEL_16:

        goto LABEL_19;
      }
    }
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x2050000000;
    v20 = (void *)_MergedGlobals_1264;
    uint64_t v32 = _MergedGlobals_1264;
    if (!_MergedGlobals_1264)
    {
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __getRVItemClass_block_invoke;
      v28[3] = &unk_1E52D9900;
      v28[4] = &v29;
      __getRVItemClass_block_invoke((uint64_t)v28);
      v20 = (void *)v30[3];
    }
    v21 = v20;
    _Block_object_dispose(&v29, 8);
    id v22 = [v21 alloc];
    v23 = v22;
    if (v13)
    {
      v24 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v27, v13);
      v33[0] = v24;
      v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
      v19 = (void *)[v23 initWithText:v17 clickedIndex:v11 selectionRanges:v25 shouldUpdateSelection:0];
    }
    else
    {
      v19 = (void *)[v22 initWithText:v17 clickedIndex:v11 selectionRanges:0 shouldUpdateSelection:0];
    }
    goto LABEL_16;
  }
LABEL_18:
  v19 = 0;
LABEL_19:

  return v19;
}

@end