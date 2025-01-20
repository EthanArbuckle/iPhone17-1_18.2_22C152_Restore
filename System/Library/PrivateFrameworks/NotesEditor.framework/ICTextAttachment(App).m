@interface ICTextAttachment(App)
- (double)attachmentSizeForImageInTextContainer:()App intrinsicImageSize:;
- (id)viewForLayoutManager:()App;
- (id)viewProviderForParentView:()App characterIndex:layoutManager:;
- (id)viewProviderForParentView:()App location:textContainer:;
- (uint64_t)attachmentThumbnailViewHeight;
- (void)placeView:()App withFrame:inParentView:characterIndex:layoutManager:;
@end

@implementation ICTextAttachment(App)

- (id)viewProviderForParentView:()App location:textContainer:
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

- (double)attachmentSizeForImageInTextContainer:()App intrinsicImageSize:
{
  id v8 = a5;
  [v8 size];
  double v10 = v9;
  [v8 lineFragmentPadding];
  double v12 = v11;

  double v13 = v10 + v12 * -2.0;
  double v14 = 0.0;
  if (a2 > 0.0)
  {
    if (v13 >= a2) {
      double v14 = a2;
    }
    else {
      double v14 = v13;
    }
  }
  if ([a1 supportsMultiplePresentationSizes])
  {
    v15 = [a1 attachment];
    int v16 = [v15 preferredViewSize];

    if (v16 == 1 && a3 > 0.0)
    {
      [a1 attachmentThumbnailViewHeight];
      if (a3 >= v17) {
        double v18 = v17;
      }
      else {
        double v18 = a3;
      }
      double v14 = fmax(a2 * (v18 / a3), 1.0);
      if (v14 > v13) {
        return v13;
      }
    }
  }
  return v14;
}

- (id)viewProviderForParentView:()App characterIndex:layoutManager:
{
  id v8 = a5;
  id v9 = a3;
  objc_opt_class();
  double v10 = ICDynamicCast();

  double v11 = [v10 viewProviderForTextAttachment:a1 parentView:v9 characterIndex:a4];

  return v11;
}

- (id)viewForLayoutManager:()App
{
  v3.receiver = a1;
  v3.super_class = (Class)&off_26C1C5B90;
  v1 = objc_msgSendSuper2(&v3, sel_viewForLayoutManager_);

  return v1;
}

- (void)placeView:()App withFrame:inParentView:characterIndex:layoutManager:
{
  id v18 = a10;
  id v19 = a8;
  id v20 = a7;
  objc_opt_class();
  v21 = ICDynamicCast();
  id v22 = [v20 superview];

  [a1 attachmentBoundsMargins];
  double v24 = v23;
  double v26 = v25;
  double v29 = a5 - (v27 + v28);
  double v30 = a3 + v27;
  double v31 = a4 - (v23 + v25);
  v32 = [v21 paragraphStyleForCharacterIndex:a9];
  if ([v32 layoutWritingDirection]) {
    double v33 = v26;
  }
  else {
    double v33 = v24;
  }
  double v34 = a2 + v33;
  [v21 willPlaceView:v20 forTextAttachment:a1];
  v35.receiver = a1;
  v35.super_class = (Class)&off_26C1C5B90;
  objc_msgSendSuper2(&v35, sel_placeView_withFrame_inParentView_characterIndex_layoutManager_, v20, v19, a9, v18, v34, v30, v31, v29);

  if (v22 != v19) {
    [v21 didAddViewForTextAttachment:a1];
  }
}

- (uint64_t)attachmentThumbnailViewHeight
{
  v0 = objc_opt_class();

  return [v0 defaultAttachmentThumbnailViewHeight];
}

@end