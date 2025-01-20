@interface ICTextAttachment(Printing)
- (id)imageForBounds:()Printing attributes:location:textContainer:;
- (id)imageForBounds:()Printing textContainer:characterIndex:;
@end

@implementation ICTextAttachment(Printing)

- (id)imageForBounds:()Printing attributes:location:textContainer:
{
  id v6 = a5;
  objc_opt_class();
  v7 = [v6 textLayoutManager];

  v8 = ICDynamicCast();

  if (v8)
  {
    v9 = [a1 viewIdentifier];
    v10 = [v8 existingAttachmentViewForIdentifier:v9];

    objc_opt_class();
    v11 = ICDynamicCast();
    [v11 prepareForPrinting];

    [v10 frame];
    double v13 = v12;
    [v10 frame];
    [v10 setFrame:v13];
    uint64_t v14 = [v10 isHidden];
    [v10 setHidden:0];
    objc_opt_class();
    v15 = ICDynamicCast();
    v16 = v15;
    if (!v15 || ([v15 imageForPrinting], (v17 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      [v10 layoutIfNeeded];
      id v18 = (id)[v10 snapshotViewAfterScreenUpdates:1];
      v17 = objc_msgSend(v10, "ic_imageRenderedFromLayer");
    }
    [v10 setHidden:v14];
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)imageForBounds:()Printing textContainer:characterIndex:
{
  id v10 = a7;
  objc_opt_class();
  v11 = [v10 layoutManager];

  double v12 = ICDynamicCast();

  if (v12)
  {
    double v13 = [v12 viewForTextAttachment:a1];
    objc_opt_class();
    uint64_t v14 = [v12 viewControllerForTextAttachment:a1];
    v15 = ICDynamicCast();
    [v15 prepareForPrinting];

    objc_opt_class();
    v16 = ICDynamicCast();
    [v16 prepareForPrinting];

    objc_msgSend(v13, "setFrame:", 0.0, 0.0, a4, a5);
    uint64_t v17 = [v13 isHidden];
    [v13 setHidden:0];
    objc_opt_class();
    id v18 = ICDynamicCast();
    v19 = v18;
    if (!v18 || ([v18 imageForPrinting], (v20 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      [v13 layoutIfNeeded];
      id v21 = (id)[v13 snapshotViewAfterScreenUpdates:1];
      v20 = objc_msgSend(v13, "ic_imageRenderedFromLayer");
    }
    [v13 setHidden:v17];
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

@end