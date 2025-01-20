@interface ICDrawingTextAttachment(UI)
- (ICDrawingInlineAttachmentView)newlyCreatedViewForManualRenderingInTextContainer:()UI;
- (double)attachmentSizeForTextContainer:()UI;
- (double)availableWidthForTextContainer:()UI;
- (uint64_t)attachmentViewClassForTextContainer:()UI;
- (void)placeView:()UI withFrame:inParentView:characterIndex:layoutManager:;
@end

@implementation ICDrawingTextAttachment(UI)

- (double)attachmentSizeForTextContainer:()UI
{
  id v4 = a3;
  if (ICInternalSettingsIsTextKit2Enabled())
  {
    objc_opt_class();
    v5 = [v4 textLayoutManager];
    v6 = ICDynamicCast();
    v7 = [a1 viewIdentifier];
    v8 = [v6 existingAttachmentViewForIdentifier:v7];
  }
  else
  {
    objc_opt_class();
    v5 = [v4 layoutManager];
    v6 = ICDynamicCast();
    v8 = [v6 viewForTextAttachment:a1];
  }

  v9 = [a1 attachment];
  v10 = [v9 drawingModel];
  v11 = [v10 drawing];
  [v11 fullBounds];

  if (v8)
  {
    objc_opt_class();
    v12 = ICCheckedDynamicCast();
    [v12 boundsForDisplay];
  }
  else
  {
    v13 = [a1 attachment];
    v14 = [v13 drawingModel];
    v12 = [v14 drawing];

    [v12 bounds];
  }

  [a1 availableWidthForTextContainer:v4];
  double v16 = v15;

  return v16;
}

- (uint64_t)attachmentViewClassForTextContainer:()UI
{
  return objc_opt_class();
}

- (ICDrawingInlineAttachmentView)newlyCreatedViewForManualRenderingInTextContainer:()UI
{
  id v4 = a3;
  v5 = [[ICDrawingInlineAttachmentView alloc] initWithTextAttachment:a1 textContainer:v4 forManualRendering:1];

  return v5;
}

- (double)availableWidthForTextContainer:()UI
{
  v11.receiver = a1;
  v11.super_class = (Class)&off_26C1D2260;
  id v3 = a3;
  objc_msgSendSuper2(&v11, sel_availableWidthForTextContainer_, v3);
  double v5 = v4;
  objc_opt_class();
  v6 = objc_msgSend(v3, "textView", v11.receiver, v11.super_class);

  v7 = [v6 superview];
  v8 = ICDynamicCast();

  if (v8)
  {
    [v8 bounds];
    double v5 = v9;
  }

  return v5;
}

- (void)placeView:()UI withFrame:inParentView:characterIndex:layoutManager:
{
  id v18 = a10;
  id v19 = a8;
  id v20 = a7;
  objc_opt_class();
  v21 = [v19 superview];
  v22 = ICDynamicCast();

  double v23 = 0.0;
  if (!v22) {
    double v23 = a2;
  }
  v24.receiver = a1;
  v24.super_class = (Class)&off_26C1D2260;
  objc_msgSendSuper2(&v24, sel_placeView_withFrame_inParentView_characterIndex_layoutManager_, v20, v19, a9, v18, v23, a3, a4, a5);
}

@end