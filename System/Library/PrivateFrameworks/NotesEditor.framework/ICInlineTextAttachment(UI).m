@interface ICInlineTextAttachment(UI)
- (double)attachmentBoundsForAttributes:()UI location:textContainer:proposedLineFragment:position:;
- (double)attachmentBoundsForTextContainer:()UI proposedLineFragment:glyphPosition:characterIndex:;
- (id)viewProviderForParentView:()UI characterIndex:layoutManager:;
- (id)viewProviderForParentView:()UI location:textContainer:;
- (uint64_t)attachmentViewControllerClass;
@end

@implementation ICInlineTextAttachment(UI)

- (id)viewProviderForParentView:()UI location:textContainer:
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  objc_opt_class();
  v11 = [v8 textLayoutManager];

  v12 = ICDynamicCast();

  v13 = [v12 viewProviderForTextAttachment:a1 parentView:v10 location:v9];

  return v13;
}

- (double)attachmentBoundsForAttributes:()UI location:textContainer:proposedLineFragment:position:
{
  id v20 = a11;
  v41.receiver = a1;
  v41.super_class = (Class)&off_26C1C3B08;
  id v21 = a10;
  id v22 = a9;
  objc_msgSendSuper2(&v41, sel_attachmentBoundsForAttributes_location_textContainer_proposedLineFragment_position_, v22, v21, v20, a2, a3, a4, a5, a6, a7);
  double v24 = v23;
  v25 = objc_msgSend(v20, "textView", v41.receiver, v41.super_class);
  v26 = [a1 viewProviderForParentView:v25 location:v21 textContainer:v20];

  v27 = [v26 view];
  objc_opt_class();
  v28 = ICDynamicCast();
  objc_opt_class();
  v29 = ICDynamicCast();
  v30 = [v29 tk2TextView];

  objc_opt_class();
  v31 = [v30 textStorage];
  v32 = ICDynamicCast();

  objc_opt_class();
  v33 = [v32 styler];
  v34 = ICDynamicCast();

  v35 = [v34 authorHighlightsController];
  int v36 = [v35 isPerformingHighlightUpdatesForTextStorage:v32];

  if (v36) {
    [v28 updateHighlightsWithAttributes:v22];
  }
  else {
    [v28 updateStyleWithAttributes:v22];
  }

  [v20 size];
  double v38 = v37;
  [v20 lineFragmentPadding];
  [v28 setTextContainerWidth:v38 + v39 * -2.0];
  if (v28)
  {
    [v28 baselineOffsetFromBottom];
    [v28 intrinsicContentSize];
    [v28 intrinsicContentSize];
    double v24 = 0.0;
  }

  return v24;
}

- (id)viewProviderForParentView:()UI characterIndex:layoutManager:
{
  id v8 = a5;
  id v9 = a3;
  objc_opt_class();
  id v10 = ICDynamicCast();

  v11 = [v10 viewProviderForTextAttachment:a1 parentView:v9 characterIndex:a4];

  return v11;
}

- (double)attachmentBoundsForTextContainer:()UI proposedLineFragment:glyphPosition:characterIndex:
{
  id v18 = a9;
  objc_opt_class();
  v19 = [v18 layoutManager];
  id v20 = ICDynamicCast();

  if (v20)
  {
    id v21 = [v20 viewForTextAttachment:a1 initialCharacterIndex:a10];
    objc_opt_class();
    id v22 = ICDynamicCast();
    [v18 size];
    double v24 = v23;
    [v18 lineFragmentPadding];
    [v22 setTextContainerWidth:v24 + v25 * -2.0];
    double v26 = 0.0;
    if (v22) {
      [v22 baselineOffsetFromBottom];
    }
    [v21 frame];
    [v21 frame];
  }
  else
  {
    v29.receiver = a1;
    v29.super_class = (Class)&off_26C1C3B08;
    objc_msgSendSuper2(&v29, sel_attachmentBoundsForTextContainer_proposedLineFragment_glyphPosition_characterIndex_, v18, a10, a2, a3, a4, a5, a6, a7);
    double v26 = v27;
  }

  return v26;
}

- (uint64_t)attachmentViewControllerClass
{
  return objc_opt_class();
}

@end