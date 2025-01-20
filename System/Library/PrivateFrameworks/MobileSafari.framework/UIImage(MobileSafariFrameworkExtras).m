@interface UIImage(MobileSafariFrameworkExtras)
+ (__CFString)safari_currentDeviceImageNameForOrientation:()MobileSafariFrameworkExtras;
+ (id)sf_chicletStyleImageWithImage:()MobileSafariFrameworkExtras backgroundColor:size:cornerRadius:;
+ (id)sf_imageNamed:()MobileSafariFrameworkExtras;
- (BOOL)sf_isLaunchImageSizedForOrientation:()MobileSafariFrameworkExtras includesStatusBar:;
- (uint64_t)sf_hasRegisteredFaviconForDarkUserInterfaceStyle;
- (uint64_t)sf_isMonogram;
- (uint64_t)sf_registerFaviconForDarkUserInterfaceStyle;
- (uint64_t)sf_shouldApplyBackingForDarkBackdrop;
- (uint64_t)sf_tabSnapshotEffectsVersion;
- (void)sf_initWithCGImage:()MobileSafariFrameworkExtras tabSnapshotEffectsVersion:;
- (void)sf_registerFaviconForDarkUserInterfaceStyleWithSize:()MobileSafariFrameworkExtras;
- (void)sf_setIsMonogram:()MobileSafariFrameworkExtras;
@end

@implementation UIImage(MobileSafariFrameworkExtras)

+ (id)sf_imageNamed:()MobileSafariFrameworkExtras
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x1E4FB1818];
  v5 = objc_msgSend(MEMORY[0x1E4F28B50], "sf_mobileSafariFrameworkBundle");
  v6 = [v4 imageNamed:v3 inBundle:v5 compatibleWithTraitCollection:0];

  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    id v7 = [MEMORY[0x1E4FB1818] imageNamed:v3];
  }
  v8 = v7;

  return v8;
}

+ (__CFString)safari_currentDeviceImageNameForOrientation:()MobileSafariFrameworkExtras
{
  uint64_t v3 = 4 * ((unint64_t)(a3 - 3) < 2);
  v4 = [MEMORY[0x1E4F442D8] _typeOfCurrentDevice];
  v5 = [v4 identifier];

  v6 = [MEMORY[0x1E4F6F260] symbolForTypeIdentifier:v5 withResolutionStrategy:1 variantOptions:v3 error:0];
  id v7 = v6;
  if (v6)
  {
    v8 = [v6 name];
  }
  else
  {
    v8 = @"iphone";
  }

  return v8;
}

- (uint64_t)sf_shouldApplyBackingForDarkBackdrop
{
  v2 = objc_getAssociatedObject(a1, (const void *)shouldApplyBackingForDarkBackdropKey);
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 BOOLValue];
  }
  else
  {
    id v5 = a1;
    [v5 CGImage];
    uint64_t v4 = WBSShouldApplyBackingForDarkBackdropToImage();
    v6 = (const void *)shouldApplyBackingForDarkBackdropKey;
    id v7 = [NSNumber numberWithBool:v4];
    objc_setAssociatedObject(v5, v6, v7, (void *)1);
  }
  return v4;
}

- (uint64_t)sf_hasRegisteredFaviconForDarkUserInterfaceStyle
{
  v1 = objc_getAssociatedObject(a1, (const void *)hasRegisteredFaviconForDarkUserInterfaceStyleKey);
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (uint64_t)sf_registerFaviconForDarkUserInterfaceStyle
{
  return objc_msgSend(a1, "sf_registerFaviconForDarkUserInterfaceStyleWithSize:", 18.0, 18.0);
}

- (void)sf_registerFaviconForDarkUserInterfaceStyleWithSize:()MobileSafariFrameworkExtras
{
  if ([a1 renderingMode] != 2
    && ([a1 isSymbolImage] & 1) == 0
    && (objc_msgSend(a1, "sf_hasRegisteredFaviconForDarkUserInterfaceStyle") & 1) == 0)
  {
    if (objc_msgSend(a1, "sf_shouldApplyBackingForDarkBackdrop"))
    {
      v6 = [MEMORY[0x1E4FB17E0] preferredFormat];
      [v6 setOpaque:0];
      id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:format:", v6, a2, a3);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __92__UIImage_MobileSafariFrameworkExtras__sf_registerFaviconForDarkUserInterfaceStyleWithSize___block_invoke;
      v16[3] = &unk_1E54E98D0;
      *(double *)&v16[5] = a2;
      *(double *)&v16[6] = a3;
      v16[4] = a1;
      __asm { FMOV            V0.2D, #1.0 }
      long long v17 = _Q0;
      double v18 = a2 + -2.0;
      double v19 = a3 + -2.0;
      v13 = [v7 imageWithActions:v16];
      v14 = [a1 imageAsset];
      v15 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceStyle:2];
      [v14 registerImage:v13 withTraitCollection:v15];

      objc_setAssociatedObject(a1, (const void *)hasRegisteredFaviconForDarkUserInterfaceStyleKey, MEMORY[0x1E4F1CC38], (void *)1);
    }
  }
}

- (uint64_t)sf_isMonogram
{
  v1 = objc_getAssociatedObject(a1, (const void *)isMonogramKey);
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (void)sf_setIsMonogram:()MobileSafariFrameworkExtras
{
  uint64_t v2 = (const void *)isMonogramKey;
  objc_msgSend(NSNumber, "numberWithBool:");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, v2, v3, (void *)0x301);
}

- (void)sf_initWithCGImage:()MobileSafariFrameworkExtras tabSnapshotEffectsVersion:
{
  id v5 = objc_msgSend(a1, "initWithCGImage:");
  if (v5)
  {
    v6 = (const void *)tabSnapshotEffectsVersionKey;
    id v7 = [NSNumber numberWithInteger:a4];
    objc_setAssociatedObject(v5, v6, v7, (void *)0x301);

    id v8 = v5;
  }

  return v5;
}

- (uint64_t)sf_tabSnapshotEffectsVersion
{
  v1 = objc_getAssociatedObject(a1, (const void *)tabSnapshotEffectsVersionKey);
  uint64_t v2 = [v1 integerValue];

  return v2;
}

- (BOOL)sf_isLaunchImageSizedForOrientation:()MobileSafariFrameworkExtras includesStatusBar:
{
  unint64_t v6 = a3 - 3;
  id v7 = [MEMORY[0x1E4FB1BA8] mainScreen];
  id v8 = [v7 fixedCoordinateSpace];
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;

  if (v6 >= 2) {
    double v13 = v12;
  }
  else {
    double v13 = v10;
  }
  if (v6 >= 2) {
    double v14 = v10;
  }
  else {
    double v14 = v12;
  }
  v15 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v15 scale];
  double v17 = v16;

  id v18 = a1;
  [v18 scale];
  if (v19 == v17 && (([v18 size], v21 == v14) ? (BOOL v22 = v20 == v13) : (BOOL v22 = 0), v22))
  {
    BOOL v30 = 1;
  }
  else
  {
    [v18 scale];
    double v24 = v23;
    [v18 size];
    double v26 = v25;
    double v28 = v27;
    if (v24 != v17)
    {
      [v18 size];
      double v24 = v24 * (v29 / v14);
      double v26 = v26 / v24;
      double v28 = v28 / v24;
    }
    if (v24 != v17)
    {

      return 0;
    }
    BOOL v30 = v28 == v13 && v26 == v14;
  }

  if (a4 && v30)
  {
    BOOL v30 = 1;
    *a4 = 1;
  }
  return v30;
}

+ (id)sf_chicletStyleImageWithImage:()MobileSafariFrameworkExtras backgroundColor:size:cornerRadius:
{
  id v15 = a8;
  id v16 = a9;
  double v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithBounds:", a1, a2, a3, a4);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __104__UIImage_MobileSafariFrameworkExtras__sf_chicletStyleImageWithImage_backgroundColor_size_cornerRadius___block_invoke;
  v22[3] = &unk_1E54E98F8;
  double v25 = a1;
  double v26 = a2;
  double v27 = a3;
  double v28 = a4;
  double v29 = a5;
  id v23 = v16;
  id v24 = v15;
  id v18 = v15;
  id v19 = v16;
  double v20 = [v17 imageWithActions:v22];

  return v20;
}

@end