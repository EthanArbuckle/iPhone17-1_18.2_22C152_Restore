@interface IKTextBadgeAttachment(TVMLKitAdditions)
- (id)tv_currentTintColor;
- (id)tv_highlightColor;
- (id)tv_imageProxy;
- (uint64_t)tv_isResolving;
- (void)tv_resolveWithTextLayoutDirection:()TVMLKitAdditions layoutObserver:;
- (void)tv_setCurrentTintColor:()TVMLKitAdditions;
- (void)tv_setHighlightColor:()TVMLKitAdditions;
- (void)tv_setImage:()TVMLKitAdditions;
- (void)tv_setImageProxy:()TVMLKitAdditions;
- (void)tv_setResolving:()TVMLKitAdditions;
@end

@implementation IKTextBadgeAttachment(TVMLKitAdditions)

- (id)tv_imageProxy
{
  return objc_getAssociatedObject(a1, sel_tv_imageProxy);
}

- (void)tv_setImageProxy:()TVMLKitAdditions
{
  id value = a3;
  objc_msgSend(a1, "tv_imageProxy");
  id v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = value;
  if (v4 != value)
  {
    objc_setAssociatedObject(a1, sel_tv_imageProxy, value, (void *)1);
    v5 = value;
  }
}

- (uint64_t)tv_isResolving
{
  v1 = objc_getAssociatedObject(a1, sel_tv_isResolving);
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (void)tv_setResolving:()TVMLKitAdditions
{
  if (objc_msgSend(a1, "tv_isResolving") != a3)
  {
    id v5 = [NSNumber numberWithBool:a3];
    objc_setAssociatedObject(a1, sel_tv_isResolving, v5, (void *)0x301);
  }
}

- (id)tv_highlightColor
{
  return objc_getAssociatedObject(a1, sel_tv_highlightColor);
}

- (void)tv_setHighlightColor:()TVMLKitAdditions
{
  id value = a3;
  objc_msgSend(a1, "tv_highlightColor");
  id v4 = (id)objc_claimAutoreleasedReturnValue();

  id v5 = value;
  if (v4 != value)
  {
    objc_setAssociatedObject(a1, sel_tv_highlightColor, value, (void *)1);
    id v5 = value;
  }
}

- (id)tv_currentTintColor
{
  return objc_getAssociatedObject(a1, sel_tv_currentTintColor);
}

- (void)tv_setCurrentTintColor:()TVMLKitAdditions
{
  id value = a3;
  objc_msgSend(a1, "tv_currentTintColor");
  id v4 = (id)objc_claimAutoreleasedReturnValue();

  id v5 = value;
  if (v4 != value)
  {
    objc_setAssociatedObject(a1, sel_tv_currentTintColor, value, (void *)1);
    id v5 = value;
  }
}

- (void)tv_setImage:()TVMLKitAdditions
{
  id v24 = a3;
  id v4 = objc_msgSend(a1, "tv_currentTintColor");
  if (v4)
  {
    id v5 = objc_msgSend(a1, "tv_currentTintColor");
    v6 = [v5 color];
    id v7 = [v24 _flatImageWithColor:v6];
  }
  else
  {
    id v7 = v24;
  }

  v8 = [a1 badge];
  v9 = [v8 style];
  [v7 size];
  double v11 = v10;
  double v13 = v12;
  v14 = [v8 style];
  objc_msgSend(v14, "tv_margin");
  double v16 = v15;

  objc_msgSend(v9, "tv_width");
  if (v17 > 0.0)
  {
    objc_msgSend(v9, "tv_height");
    if (v18 > 0.0)
    {
      objc_msgSend(v9, "tv_width");
      double v11 = v19;
      objc_msgSend(v9, "tv_height");
LABEL_10:
      double v13 = v20;
      goto LABEL_11;
    }
  }
  [v8 width];
  if (v21 > 0.0)
  {
    [v8 height];
    if (v22 > 0.0)
    {
      [v8 width];
      double v11 = v23;
      [v8 height];
      goto LABEL_10;
    }
  }
LABEL_11:
  objc_msgSend(a1, "setBounds:", 0.0, v16, v11, v13);
  [a1 setImage:v7];
}

- (void)tv_resolveWithTextLayoutDirection:()TVMLKitAdditions layoutObserver:
{
  v6 = a4;
  if ((objc_msgSend(a1, "tv_isResolving") & 1) == 0)
  {
    objc_msgSend(a1, "tv_setResolving:", 1);
    id v7 = [a1 badge];
    v8 = [v7 url];
    if (objc_msgSend(v8, "tv_isResourceURL"))
    {
      v9 = objc_msgSend(v8, "tv_resourceName");
      double v10 = +[TVInterfaceFactory sharedInterfaceFactory];
      double v11 = [v10 imageForResource:v9];

      if (v11)
      {
        double v12 = [v11 imageAsset];

        if (v12)
        {
          double v13 = [v11 imageAsset];
          v14 = [MEMORY[0x263F1CB00] traitCollectionWithLayoutDirection:a3 == 1];
          uint64_t v15 = [v13 imageWithTraitCollection:v14];

          double v11 = (void *)v15;
        }
        objc_msgSend(a1, "tv_setImage:", v11);
        objc_msgSend(a1, "tv_setResolving:", 0);
        if (v6) {
          v6[2](v6);
        }
      }
    }
    else
    {
      objc_initWeak(&location, a1);
      double v16 = objc_msgSend(v7, "tv_imageProxy");
      [v16 setImageDirection:a3];
      objc_msgSend(a1, "tv_setImageProxy:", v16);
      objc_msgSend(v16, "setCacheOnLoad:", +[TVMLUtilities canHandleDecodingOnRenderThread](TVMLUtilities, "canHandleDecodingOnRenderThread") ^ 1);
      [v16 setLoadSynchronouslyIfCached:1];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __92__IKTextBadgeAttachment_TVMLKitAdditions__tv_resolveWithTextLayoutDirection_layoutObserver___block_invoke;
      v17[3] = &unk_264BA67E0;
      objc_copyWeak(&v19, &location);
      double v18 = v6;
      [v16 setCompletionHandler:v17];
      [v16 load];

      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
  }
}

@end