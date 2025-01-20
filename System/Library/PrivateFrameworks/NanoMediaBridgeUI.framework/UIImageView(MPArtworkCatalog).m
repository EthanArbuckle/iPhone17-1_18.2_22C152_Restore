@interface UIImageView(MPArtworkCatalog)
- (id)_imageFromImage:()MPArtworkCatalog scaledToSize:;
- (void)setArtworkCatalog:()MPArtworkCatalog withPlaceholderImage:withDesiredSize:;
@end

@implementation UIImageView(MPArtworkCatalog)

- (void)setArtworkCatalog:()MPArtworkCatalog withPlaceholderImage:withDesiredSize:
{
  id v10 = a5;
  id v11 = a6;
  if (v11)
  {
    v12 = objc_msgSend(a1, "_imageFromImage:scaledToSize:", v11, a2, a3);
    [a1 setImage:v12];
  }
  if (v10)
  {
    v13 = [MEMORY[0x263F1C920] mainScreen];
    [v13 scale];
    objc_msgSend(v10, "setDestinationScale:");

    objc_msgSend(v10, "setFittingSize:", a2, a3);
    objc_initWeak(&location, a1);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __88__UIImageView_MPArtworkCatalog__setArtworkCatalog_withPlaceholderImage_withDesiredSize___block_invoke;
    v14[3] = &unk_264DA3C58;
    objc_copyWeak(v15, &location);
    v15[1] = *(id *)&a2;
    v15[2] = *(id *)&a3;
    [v10 setDestination:a1 configurationBlock:v14];
    objc_destroyWeak(v15);
    objc_destroyWeak(&location);
  }
}

- (id)_imageFromImage:()MPArtworkCatalog scaledToSize:
{
  id v7 = a5;
  v11.width = a1;
  v11.height = a2;
  UIGraphicsBeginImageContextWithOptions(v11, 0, 0.0);
  objc_msgSend(v7, "drawInRect:", 0.0, 0.0, a1, a2);

  v8 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return v8;
}

@end