@interface UITextView(IC)
- (BOOL)ic_shouldEnableBlockQuoteForAttachmentsOnlySelection;
- (NSUInteger)ic_rangeFromRect:()IC;
- (double)ic_rectForRange:()IC;
- (double)ic_textContainerOrigin;
- (id)containerViewForAttachments;
- (id)ic_imageForRange:()IC;
- (id)ic_pkSelectionInteraction;
- (id)ic_pkTiledView;
- (id)ic_selectedRanges;
- (id)ic_textRangeFromCharacterRange:()IC;
- (uint64_t)ic_characterRangeFromTextPosition:()IC;
- (uint64_t)ic_characterRangeFromTextRange:()IC;
- (uint64_t)ic_markedTextRange;
- (uint64_t)ic_visibleRange;
- (void)ic_scrollRangeToTop:()IC;
- (void)ic_scrollRangeToVisible:()IC animated:completionHandler:;
- (void)ic_scrollRangeToVisible:()IC consideringInsets:animated:;
- (void)ic_scrollRectToVisible:()IC animated:completionHandler:;
- (void)setIc_selectedRanges:()IC;
@end

@implementation UITextView(IC)

- (BOOL)ic_shouldEnableBlockQuoteForAttachmentsOnlySelection
{
  uint64_t v2 = [a1 textStorage];
  if (!v2) {
    return 0;
  }
  v3 = (void *)v2;
  v4 = [a1 textStorage];
  if (![v4 length])
  {

    return 0;
  }
  v5 = [a1 textStorage];
  v6 = [v5 string];
  uint64_t v7 = [a1 selectedRange];
  int v9 = objc_msgSend(v6, "ic_rangeIsValid:", v7, v8);

  if (!v9) {
    return 0;
  }
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  v10 = [a1 textStorage];
  v11 = [v10 string];
  uint64_t v12 = [a1 selectedRange];
  uint64_t v14 = objc_msgSend(v11, "paragraphRangeForRange:", v12, v13);
  uint64_t v16 = v15;

  v17 = [a1 textStorage];
  uint64_t v18 = *MEMORY[0x1E4FB06B8];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __70__UITextView_IC__ic_shouldEnableBlockQuoteForAttachmentsOnlySelection__block_invoke;
  v21[3] = &unk_1E5FDE680;
  v21[5] = &v26;
  v21[6] = &v22;
  v21[4] = a1;
  objc_msgSend(v17, "enumerateAttribute:inRange:options:usingBlock:", v18, v14, v16, 0, v21);

  if (*((unsigned char *)v27 + 24)) {
    BOOL v19 = *((unsigned char *)v23 + 24) == 0;
  }
  else {
    BOOL v19 = 0;
  }
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);
  return v19;
}

- (id)ic_selectedRanges
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v1 = (void *)MEMORY[0x1E4F29238];
  uint64_t v2 = [a1 selectedRange];
  v4 = objc_msgSend(v1, "valueWithRange:", v2, v3);
  v7[0] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];

  return v5;
}

- (id)ic_pkTiledView
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v1 = [a1 subviews];
  uint64_t v2 = (void *)[v1 copy];

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = v2;
  id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)containerViewForAttachments
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (!containerViewForAttachments_UITextContainerViewClass) {
    containerViewForAttachments_UITextContainerViewClass = (uint64_t)NSClassFromString(&cfstr_Uitextcontaine.isa);
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = objc_msgSend(v1, "subviews", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (objc_opt_isKindOfClass())
        {
          id v8 = v7;

          id v1 = v8;
          goto LABEL_13;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v1;
}

- (void)ic_scrollRangeToVisible:()IC consideringInsets:animated:
{
  [a1 contentSize];
  if (v12 <= 0.0 || v11 <= 0.0) {
    [a1 layoutIfNeeded];
  }
  objc_msgSend(a1, "ic_textRangeFromCharacterRange:", a3, a4);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  [a1 firstRectForRange:v13];
  objc_msgSend(a1, "ic_scrollRectToVisible:animated:consideringInsets:", a6, a5);
}

- (void)ic_scrollRangeToTop:()IC
{
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = [a1 textStorage];
    unint64_t v8 = [v7 length];

    if (a3 < v8)
    {
      long long v9 = objc_msgSend(a1, "ic_textRangeFromCharacterRange:", a3, a4);
      [a1 firstRectForRange:v9];
      double v11 = v10;
      double v13 = v12;

      objc_msgSend(a1, "setContentOffset:", 0.0, v11 + v13 + 1.0);
    }
  }
}

- (void)setIc_selectedRanges:()IC
{
  id v7 = a3;
  if ([v7 count])
  {
    uint64_t v4 = [v7 firstObject];
    uint64_t v5 = [v4 rangeValue];
    objc_msgSend(a1, "setSelectedRange:", v5, v6);
  }
}

- (uint64_t)ic_markedTextRange
{
  uint64_t v2 = [a1 markedTextRange];
  if (v2)
  {
    uint64_t v3 = [a1 markedTextRange];
    uint64_t v4 = objc_msgSend(a1, "ic_characterRangeFromTextRange:", v3);
  }
  else
  {
    uint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v4;
}

- (uint64_t)ic_characterRangeFromTextRange:()IC
{
  id v4 = a3;
  uint64_t v5 = [a1 beginningOfDocument];
  uint64_t v6 = [v4 start];
  id v7 = [v4 end];

  uint64_t v8 = [a1 offsetFromPosition:v5 toPosition:v6];
  [a1 offsetFromPosition:v6 toPosition:v7];

  return v8;
}

- (id)ic_textRangeFromCharacterRange:()IC
{
  id v7 = [a1 beginningOfDocument];
  uint64_t v8 = [a1 positionFromPosition:v7 offset:a3];

  long long v9 = [a1 positionFromPosition:v8 offset:a4];
  double v10 = [a1 textRangeFromPosition:v8 toPosition:v9];

  return v10;
}

- (uint64_t)ic_characterRangeFromTextPosition:()IC
{
  id v4 = a3;
  uint64_t v5 = [a1 beginningOfDocument];
  uint64_t v6 = [a1 offsetFromPosition:v5 toPosition:v4];

  return v6;
}

- (uint64_t)ic_visibleRange
{
  [a1 visibleTextRect];
  CGFloat x = v15.origin.x;
  CGFloat y = v15.origin.y;
  CGFloat width = v15.size.width;
  CGFloat height = v15.size.height;
  double MidX = CGRectGetMidX(v15);
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v16);
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  double v8 = CGRectGetMidX(v17);
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v18);
  double v10 = objc_msgSend(a1, "closestPositionToPoint:", MidX, MinY);
  double v11 = objc_msgSend(a1, "closestPositionToPoint:", v8, MaxY);
  double v12 = [a1 textRangeFromPosition:v10 toPosition:v11];
  uint64_t v13 = objc_msgSend(a1, "ic_characterRangeFromTextRange:", v12);

  return v13;
}

- (NSUInteger)ic_rangeFromRect:()IC
{
  double MinX = CGRectGetMinX(*(CGRect *)&a2);
  v24.origin.CGFloat x = a2;
  v24.origin.CGFloat y = a3;
  v24.size.CGFloat width = a4;
  v24.size.CGFloat height = a5;
  double MinY = CGRectGetMinY(v24);
  v25.origin.CGFloat x = a2;
  v25.origin.CGFloat y = a3;
  v25.size.CGFloat width = a4;
  v25.size.CGFloat height = a5;
  double MaxX = CGRectGetMaxX(v25);
  v26.origin.CGFloat x = a2;
  v26.origin.CGFloat y = a3;
  v26.size.CGFloat width = a4;
  v26.size.CGFloat height = a5;
  double MaxY = CGRectGetMaxY(v26);
  uint64_t v14 = objc_msgSend(a1, "characterRangeAtPoint:", MinX, MinY);
  CGRect v15 = objc_msgSend(a1, "characterRangeAtPoint:", MaxX, MaxY);
  NSUInteger v16 = objc_msgSend(a1, "ic_characterRangeFromTextRange:", v14);
  NSUInteger v18 = v17;
  v23.NSUInteger location = objc_msgSend(a1, "ic_characterRangeFromTextRange:", v15);
  v23.length = v19;
  v22.NSUInteger location = v16;
  v22.length = v18;
  NSUInteger location = NSUnionRange(v22, v23).location;

  return location;
}

- (double)ic_rectForRange:()IC
{
  unint64_t v7 = a3 + a4;
  double v8 = [a1 textStorage];
  objc_msgSend(v8, "ic_range");
  unint64_t v10 = v9;

  if (v7 > v10) {
    return *MEMORY[0x1E4F1DB28];
  }
  if (ICInternalSettingsIsTextKit2Enabled()
    && ([a1 textLayoutManager], double v12 = objc_claimAutoreleasedReturnValue(), v12, v12))
  {
    uint64_t v13 = [a1 textLayoutManager];
    objc_msgSend(v13, "ic_rectForRange:", a3, a4);
    double v11 = v14;
  }
  else
  {
    uint64_t v13 = [a1 textContainer];
    uint64_t v15 = [a1 layoutManager];
    NSUInteger v16 = (void *)v15;
    if (v13 && v15)
    {
      uint64_t v27 = 0;
      uint64_t v28 = (double *)&v27;
      uint64_t v29 = 0x4010000000;
      v30 = &unk_1B0BF84BB;
      long long v17 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
      long long v31 = *MEMORY[0x1E4F1DB28];
      long long v32 = v17;
      NSUInteger v18 = [a1 textStorage];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __34__UITextView_IC__ic_rectForRange___block_invoke;
      v20[3] = &unk_1E5FDE630;
      uint64_t v25 = a3;
      uint64_t v26 = a4;
      id v21 = v16;
      NSRange v22 = a1;
      CGRect v24 = &v27;
      id v23 = v13;
      [v18 coordinateReading:v20];

      double v11 = v28[4];
      _Block_object_dispose(&v27, 8);
    }
    else
    {
      double v11 = *MEMORY[0x1E4F1DB28];
    }
  }
  return v11;
}

- (id)ic_imageForRange:()IC
{
  if (ICInternalSettingsIsTextKit2Enabled())
  {
    unint64_t v7 = [a1 textLayoutManager];

    if (v7)
    {
      [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no" functionName:"-[UITextView(IC) ic_imageForRange:]" simulateCrash:1 showAlert:0 format:@"Unavailable in TextKit 2"];
LABEL_5:
      double v12 = 0;
      goto LABEL_7;
    }
  }
  objc_msgSend(a1, "ic_rectForRange:", a3, a4);
  CGFloat x = v28.origin.x;
  CGFloat y = v28.origin.y;
  double width = v28.size.width;
  double height = v28.size.height;
  if (CGRectIsEmpty(v28)) {
    goto LABEL_5;
  }
  uint64_t v13 = [a1 layoutManager];
  objc_msgSend(a1, "convertSize:toView:", 0, width, height);
  NSUInteger v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:", v14, v15);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __35__UITextView_IC__ic_imageForRange___block_invoke;
  v19[3] = &unk_1E5FDE658;
  id v20 = v13;
  uint64_t v21 = a3;
  uint64_t v22 = a4;
  CGFloat v23 = x;
  CGFloat v24 = y;
  double v25 = width;
  double v26 = height;
  id v17 = v13;
  double v12 = [v16 imageWithActions:v19];

LABEL_7:
  return v12;
}

- (id)ic_pkSelectionInteraction
{
  id v1 = objc_msgSend(a1, "ic_pkTiledView");
  uint64_t v2 = [v1 selectionInteraction];

  return v2;
}

- (double)ic_textContainerOrigin
{
  id v1 = [a1 textContainer];
  [v1 textContainerOrigin];
  double v3 = v2;

  return v3;
}

- (void)ic_scrollRangeToVisible:()IC animated:completionHandler:
{
  id v10 = a6;
  objc_msgSend(a1, "ic_rectForRange:", a3, a4);
  objc_msgSend(a1, "ic_scrollRectToVisible:animated:completionHandler:", a5, v10);
}

- (void)ic_scrollRectToVisible:()IC animated:completionHandler:
{
  id v14 = a8;
  objc_msgSend(a1, "ic_scrollRectToVisible:animated:consideringInsets:", a7, 1, a2, a3, a4, a5);
  if (v14)
  {
    [MEMORY[0x1E4F39CF8] animationDuration];
    dispatchMainAfterDelay();
  }
}

@end