@interface NTKNoContentTemplateProvider
+ (id)graphicCircularEmptyImageForDevice:(id)a3;
+ (id)graphicExtraLargeCircularEmptyImageForDevice:(id)a3;
+ (id)largeModularEmptyTextProvider;
+ (id)largeRectangularEmptyTextProviderForDevice:(id)a3;
+ (id)templateForDisplayName:(id)a3 image:(id)a4 family:(int64_t)a5 device:(id)a6 sdkVersion:(id)a7;
@end

@implementation NTKNoContentTemplateProvider

+ (id)templateForDisplayName:(id)a3 image:(id)a4 family:(int64_t)a5 device:(id)a6 sdkVersion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v16 = 0;
  switch(a5)
  {
    case 0:
      if (v13)
      {
        v17 = [MEMORY[0x1E4F19A68] imageProviderWithOnePieceImage:v13];
        v18 = (void *)MEMORY[0x1E4F199B8];
        goto LABEL_24;
      }
      v17 = NTKClockFaceLocalizedString(@"SMALL_MODULAR_NO_CONTENT", @"--");
      v25 = [MEMORY[0x1E4F19AB0] textProviderWithText:v17];
      uint64_t v26 = [MEMORY[0x1E4F199C0] templateWithTextProvider:v25];
      goto LABEL_33;
    case 1:
      v17 = [MEMORY[0x1E4F19AB0] textProviderWithText:v12];
      v19 = [a1 largeModularEmptyTextProvider];
      uint64_t v20 = [MEMORY[0x1E4F19978] templateWithHeaderTextProvider:v17 body1TextProvider:v19];
      goto LABEL_20;
    case 2:
      v17 = [MEMORY[0x1E4F19A68] imageProviderWithOnePieceImage:v13];
      v18 = (void *)MEMORY[0x1E4F19A08];
      goto LABEL_24;
    case 3:
      v17 = [MEMORY[0x1E4F19AB0] textProviderWithText:v12];
      v21 = (void *)MEMORY[0x1E4F199E0];
      goto LABEL_9;
    case 4:
      v17 = [MEMORY[0x1E4F19A68] imageProviderWithOnePieceImage:v13];
      v18 = (void *)MEMORY[0x1E4F19740];
      goto LABEL_24;
    case 6:
      v17 = [MEMORY[0x1E4F19AB0] textProviderWithText:v12];
      v21 = (void *)MEMORY[0x1E4F199E8];
LABEL_9:
      uint64_t v22 = [v21 templateWithTextProvider:v17];
      goto LABEL_25;
    case 7:
      v17 = [MEMORY[0x1E4F19A68] imageProviderWithOnePieceImage:v13];
      v18 = (void *)MEMORY[0x1E4F19798];
      goto LABEL_24;
    case 8:
      v17 = NTKClockFaceLocalizedString(@"SIGNATURE_CONER_NO_DATA", @"----");
      if (!v13)
      {
        v25 = [MEMORY[0x1E4F19AB0] textProviderWithText:v12];
        v27 = [MEMORY[0x1E4F19AB0] textProviderWithText:v17];
        v16 = [MEMORY[0x1E4F19880] templateWithInnerTextProvider:v27 outerTextProvider:v25];

        goto LABEL_34;
      }
      v19 = [MEMORY[0x1E4F19A58] providerWithFullColorImage:v13 monochromeFilterType:0];
      v23 = [MEMORY[0x1E4F19AB0] textProviderWithText:v17];
      uint64_t v24 = [MEMORY[0x1E4F19888] templateWithTextProvider:v23 imageProvider:v19];
LABEL_30:
      v16 = (void *)v24;

      goto LABEL_31;
    case 9:
      v17 = [MEMORY[0x1E4F19AB0] textProviderWithText:v12];
      if (v13)
      {
        v19 = [MEMORY[0x1E4F19A58] providerWithFullColorImage:v13 monochromeFilterType:0];
      }
      else
      {
        v28 = +[NTKNoContentTemplateProvider graphicCircularEmptyImageForDevice:v14];
        v19 = [MEMORY[0x1E4F19A58] providerWithFullColorImage:v28 monochromeFilterType:0 applyScalingAndCircularMasking:0];
      }
      v23 = [MEMORY[0x1E4F197E0] templateWithImageProvider:v19];
      uint64_t v24 = [MEMORY[0x1E4F197B8] templateWithCircularTemplate:v23 textProvider:v17];
      goto LABEL_30;
    case 10:
      if (!v13)
      {
        id v13 = +[NTKNoContentTemplateProvider graphicCircularEmptyImageForDevice:v14];
      }
      v17 = [MEMORY[0x1E4F19A58] providerWithFullColorImage:v13 monochromeFilterType:0 applyScalingAndCircularMasking:1];
      v18 = (void *)MEMORY[0x1E4F197E0];
      goto LABEL_24;
    case 11:
      v17 = [MEMORY[0x1E4F19AB0] textProviderWithText:v12];
      if (v13)
      {
        v19 = [MEMORY[0x1E4F19A58] providerWithFullColorImage:v13 monochromeFilterType:0];
        uint64_t v20 = [MEMORY[0x1E4F19928] templateWithTextProvider:v17 imageProvider:v19];
LABEL_20:
        v16 = (void *)v20;
LABEL_31:
      }
      else
      {
        v25 = [a1 largeRectangularEmptyTextProviderForDevice:v14];
        uint64_t v26 = [MEMORY[0x1E4F19948] templateWithHeaderTextProvider:v17 body1TextProvider:v25];
LABEL_33:
        v16 = (void *)v26;
LABEL_34:

        id v13 = 0;
      }
LABEL_35:

LABEL_36:
      [v16 setSDKVersionFromLS:v15];
      uint64_t v34 = MEMORY[0x1E4F143A8];
      uint64_t v35 = 3221225472;
      v36 = __86__NTKNoContentTemplateProvider_templateForDisplayName_image_family_device_sdkVersion___block_invoke;
      v37 = &unk_1E62C6830;
      id v29 = v16;
      id v38 = v29;
      id v39 = v15;
      id v30 = v15;
      [v29 enumerateEmbeddedTemplateKeysWithBlock:&v34];
      objc_msgSend(v29, "finalize", v34, v35, v36, v37);
      v31 = v39;
      id v32 = v29;

      return v32;
    case 12:
      if (!v13)
      {
        id v13 = +[NTKNoContentTemplateProvider graphicExtraLargeCircularEmptyImageForDevice:v14];
      }
      v17 = [MEMORY[0x1E4F19A58] providerWithFullColorImage:v13 monochromeFilterType:0 applyScalingAndCircularMasking:1];
      v18 = (void *)MEMORY[0x1E4F198B0];
LABEL_24:
      uint64_t v22 = [v18 templateWithImageProvider:v17];
LABEL_25:
      v16 = (void *)v22;
      goto LABEL_35;
    default:
      goto LABEL_36;
  }
}

void __86__NTKNoContentTemplateProvider_templateForDisplayName_image_family_device_sdkVersion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) valueForKey:a2];
  [v3 setSDKVersionFromLS:*(void *)(a1 + 40)];
}

+ (id)largeModularEmptyTextProvider
{
  if (largeModularEmptyTextProvider_onceToken != -1) {
    dispatch_once(&largeModularEmptyTextProvider_onceToken, &__block_literal_global_115);
  }
  v2 = (void *)largeModularEmptyTextProvider___largeModularEmptyTextProvider;
  return v2;
}

void __61__NTKNoContentTemplateProvider_largeModularEmptyTextProvider__block_invoke()
{
  NTKClockFaceLocalizedString(@"LARGE_MODULAR_NO_CONTENT", @"–––––––––––\n–––––––––––");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [MEMORY[0x1E4F19A80] _dashTrackingTextProviderWithDashes:v2 tracking:305.0];
  v1 = (void *)largeModularEmptyTextProvider___largeModularEmptyTextProvider;
  largeModularEmptyTextProvider___largeModularEmptyTextProvider = v0;
}

+ (id)largeRectangularEmptyTextProviderForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&largeRectangularEmptyTextProviderForDevice____lock);
  id WeakRetained = objc_loadWeakRetained(&largeRectangularEmptyTextProviderForDevice____cachedDevice);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&largeRectangularEmptyTextProviderForDevice____cachedDevice);
  if (v6 != v3)
  {

LABEL_5:
    id v9 = objc_storeWeak(&largeRectangularEmptyTextProviderForDevice____cachedDevice, v3);
    largeRectangularEmptyTextProviderForDevice____previousCLKDeviceVersion = [v3 version];

    __75__NTKNoContentTemplateProvider_largeRectangularEmptyTextProviderForDevice___block_invoke();
    goto LABEL_6;
  }
  uint64_t v7 = [v3 version];
  uint64_t v8 = largeRectangularEmptyTextProviderForDevice____previousCLKDeviceVersion;

  if (v7 != v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&largeRectangularEmptyTextProviderForDevice____lock);
  id v10 = (id)largeRectangularEmptyTextProviderForDevice____largeModularEmptyTextProvider;

  return v10;
}

void __75__NTKNoContentTemplateProvider_largeRectangularEmptyTextProviderForDevice___block_invoke()
{
  CLKValueForDeviceMetrics();
  double v1 = v0;
  NTKClockFaceLocalizedString(@"LARGE_RECTANGULAR_NO_CONTENT", @"––––––––––––\n––––––––––––");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [MEMORY[0x1E4F19A80] _dashTrackingTextProviderWithDashes:v4 tracking:v1];
  id v3 = (void *)largeRectangularEmptyTextProviderForDevice____largeModularEmptyTextProvider;
  largeRectangularEmptyTextProviderForDevice____largeModularEmptyTextProvider = v2;
}

+ (id)graphicCircularEmptyImageForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&graphicCircularEmptyImageForDevice____lock);
  id WeakRetained = objc_loadWeakRetained(&graphicCircularEmptyImageForDevice____cachedDevice);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&graphicCircularEmptyImageForDevice____cachedDevice);
  if (v6 != v3)
  {

LABEL_5:
    id v9 = objc_storeWeak(&graphicCircularEmptyImageForDevice____cachedDevice, v3);
    graphicCircularEmptyImageForDevice____previousCLKDeviceVersion = [v3 version];

    __67__NTKNoContentTemplateProvider_graphicCircularEmptyImageForDevice___block_invoke(v10, v3);
    goto LABEL_6;
  }
  uint64_t v7 = [v3 version];
  uint64_t v8 = graphicCircularEmptyImageForDevice____previousCLKDeviceVersion;

  if (v7 != v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&graphicCircularEmptyImageForDevice____lock);
  id v11 = (id)graphicCircularEmptyImageForDevice__emptyImage;

  return v11;
}

void __67__NTKNoContentTemplateProvider_graphicCircularEmptyImageForDevice___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  double v3 = NTKWhistlerSubdialComplicationDiameter(v2);
  CLKValueForDeviceMetrics();
  double v5 = v4;
  [v2 screenScale];
  CGFloat v7 = v6;

  uint64_t v8 = _richCircularEmptyImage(v3, v5, v7);
  id v9 = (void *)graphicCircularEmptyImageForDevice__emptyImage;
  graphicCircularEmptyImageForDevice__emptyImage = v8;
}

+ (id)graphicExtraLargeCircularEmptyImageForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&graphicExtraLargeCircularEmptyImageForDevice____lock);
  id WeakRetained = objc_loadWeakRetained(&graphicExtraLargeCircularEmptyImageForDevice____cachedDevice);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  double v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&graphicExtraLargeCircularEmptyImageForDevice____cachedDevice);
  if (v6 != v3)
  {

LABEL_5:
    id v9 = objc_storeWeak(&graphicExtraLargeCircularEmptyImageForDevice____cachedDevice, v3);
    graphicExtraLargeCircularEmptyImageForDevice____previousCLKDeviceVersion = [v3 version];

    __77__NTKNoContentTemplateProvider_graphicExtraLargeCircularEmptyImageForDevice___block_invoke(v10, v3);
    goto LABEL_6;
  }
  uint64_t v7 = [v3 version];
  uint64_t v8 = graphicExtraLargeCircularEmptyImageForDevice____previousCLKDeviceVersion;

  if (v7 != v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&graphicExtraLargeCircularEmptyImageForDevice____lock);
  id v11 = (id)graphicExtraLargeCircularEmptyImageForDevice__emptyImage;

  return v11;
}

void __77__NTKNoContentTemplateProvider_graphicExtraLargeCircularEmptyImageForDevice___block_invoke(uint64_t a1, void *a2)
{
  v13[3] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  double v3 = NTKGraphicExtraLargeComplicationContentDiameter();
  double v4 = [MEMORY[0x1E4F19A40] metricsWithDevice:v2 identitySizeClass:2];
  v12[0] = &unk_1F16E25B0;
  v12[1] = &unk_1F16E25C8;
  v13[0] = &unk_1F16E7DE0;
  v13[1] = &unk_1F16E7DE0;
  v12[2] = &unk_1F16E25E0;
  v13[2] = &unk_1F16E7DF0;
  double v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
  [v4 scaledValue:v5 withOverrides:51.5];
  double v7 = v6;

  [v2 screenScale];
  CGFloat v9 = v8;

  uint64_t v10 = _richCircularEmptyImage(v3, v7, v9);
  id v11 = (void *)graphicExtraLargeCircularEmptyImageForDevice__emptyImage;
  graphicExtraLargeCircularEmptyImageForDevice__emptyImage = v10;
}

@end