@interface ICTableTextAttachment(UI)
- (double)attachmentSizeForTextContainer:()UI proposedLineFragment:;
- (double)availableWidthForTextContainer:()UI;
- (uint64_t)attachmentSizeForTextContainer:()UI;
- (uint64_t)attachmentViewClassForTextContainer:()UI;
- (uint64_t)attachmentViewControllerClass;
- (uint64_t)supportsDraggingWithoutSelecting;
- (void)placeView:()UI withFrame:inParentView:characterIndex:layoutManager:;
@end

@implementation ICTableTextAttachment(UI)

- (uint64_t)attachmentSizeForTextContainer:()UI
{
  return objc_msgSend(a1, "attachmentSizeForTextContainer:proposedLineFragment:", *MEMORY[0x263F001A0], *(double *)(MEMORY[0x263F001A0] + 8), *(double *)(MEMORY[0x263F001A0] + 16), *(double *)(MEMORY[0x263F001A0] + 24));
}

- (double)attachmentSizeForTextContainer:()UI proposedLineFragment:
{
  id v12 = a7;
  if (!v12)
  {
    [a1 lastAttachmentSize];
    double v14 = v26;
    goto LABEL_18;
  }
  [a1 availableWidthForTextContainer:v12];
  double v14 = v13;
  objc_msgSend(a1, "setLastAvailableWidth:");
  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    v15 = [v12 layoutManager];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      objc_opt_class();
      v17 = [v12 layoutManager];
      v18 = ICCheckedDynamicCast();

      objc_opt_class();
      v19 = [v18 viewControllerForTextAttachment:a1];
      v20 = ICCheckedDynamicCast();

LABEL_7:
      v32.origin.x = a2;
      v32.origin.y = a3;
      v32.size.width = a4;
      v32.size.height = a5;
      if (!CGRectIsNull(v32)) {
        objc_msgSend(v20, "setProposedLineFragmentRect:", a2, a3, a4, a5);
      }
      [v20 intrinsicSize];
      goto LABEL_15;
    }
  }
  v21 = [v12 textLayoutManager];
  objc_opt_class();
  char v22 = objc_opt_isKindOfClass();

  if (v22)
  {
    objc_opt_class();
    v23 = [v12 textLayoutManager];
    v18 = ICCheckedDynamicCast();

    v20 = [v18 tableViewControllerForAttachment:a1 createIfNeeded:1];
    goto LABEL_7;
  }
  [v12 size];
  if (v27 >= v14 * 3.0) {
    double v28 = v14 * 3.0;
  }
  else {
    double v28 = v27;
  }
  v18 = [a1 attachment];
  v20 = [v18 tableModel];
  objc_msgSend(v20, "previewInAvailableSize:shouldDraw:", 0, v14, v28);
LABEL_15:
  double v29 = v24;
  double v30 = v25;

  if (v14 >= v29) {
    double v14 = v29;
  }
  objc_msgSend(a1, "setLastAttachmentSize:", v14, v30);
LABEL_18:

  return v14;
}

- (uint64_t)attachmentViewClassForTextContainer:()UI
{
  return objc_opt_class();
}

- (uint64_t)attachmentViewControllerClass
{
  return objc_opt_class();
}

- (uint64_t)supportsDraggingWithoutSelecting
{
  return 0;
}

- (double)availableWidthForTextContainer:()UI
{
  id v4 = a3;
  v19.receiver = a1;
  v19.super_class = (Class)&off_26C1C5F90;
  objc_msgSendSuper2(&v19, sel_availableWidthForTextContainer_, v4);
  double v6 = v5;
  objc_opt_class();
  v7 = [v4 textView];
  v8 = [v7 superview];
  v9 = ICDynamicCast();

  if (v9)
  {
    int v10 = objc_msgSend(v9, "ic_isRTL");
    [v9 textContainerInset];
    if (v10) {
      double v13 = v12;
    }
    else {
      double v13 = v11;
    }
    [v9 bounds];
    double v15 = v14 - v13 * 2.0;
    [v4 lineFragmentPadding];
    double v17 = v15 - v16 * 2.0;
    if (v6 < v17 + -50.0) {
      double v6 = v17;
    }
  }

  return v6;
}

- (void)placeView:()UI withFrame:inParentView:characterIndex:layoutManager:
{
  id v18 = a7;
  id v19 = a8;
  id v20 = a10;
  objc_opt_class();
  v21 = [v19 superview];
  char v22 = ICDynamicCast();

  if (v22)
  {
    if (objc_msgSend(v22, "ic_isRTL"))
    {
      v23 = [v22 textContainer];
      v34.receiver = a1;
      v34.super_class = (Class)&off_26C1C5F90;
      objc_msgSendSuper2(&v34, sel_availableWidthForTextContainer_, v23);
      double v25 = v24;

      double v26 = [v22 textContainer];
      [a1 availableWidthForTextContainer:v26];
      double v28 = v27;

      if (a4 > v25)
      {
        [v22 textContainerInset];
        double v30 = v28 - a4 + v29;
        v31 = [v22 textContainer];
        [v31 lineFragmentPadding];
        a2 = v30 + v32;
      }
    }
  }
  v33.receiver = a1;
  v33.super_class = (Class)&off_26C1C5F90;
  objc_msgSendSuper2(&v33, sel_placeView_withFrame_inParentView_characterIndex_layoutManager_, v18, v19, a9, v20, a2, a3, a4, a5);
}

@end