@interface PXImageRequestOptions(PhotoKit)
+ (uint64_t)phImageRequestOptionsDegradedImagesToReturnFromPXImageRequestOptionsDegradedImagesToReturn:()PhotoKit;
+ (uint64_t)pxImageRequestOptionsDegradedImagesToReturnFromPHImageRequestOptionsDegradedImagesToReturn:()PhotoKit;
+ (unint64_t)phImageRequestOptionsDeliveryModeFromPXImageRequestOptionsDeliveryMode:()PhotoKit;
+ (unint64_t)phImageRequestOptionsResizeModeFromPXImageRequestOptionsResizeMode:()PhotoKit;
+ (unint64_t)phImageRequestOptionsVersionFromPXImageRequestOptionsVersion:()PhotoKit;
+ (unint64_t)pxImageRequestOptionsDeliveryModeFromPHImageRequestOptionsDeliveryMode:()PhotoKit;
+ (unint64_t)pxImageRequestOptionsResizeModeFromPHImageRequestOptionsResizeMode:()PhotoKit;
+ (unint64_t)pxImageRequestOptionsVersionFromPHImageRequestOptionsVersion:()PhotoKit;
- (id)photoKitRequestOptions;
- (id)underlyingPhotoKitImageRequestOptions;
- (uint64_t)copyPropertiesFromPhotoKitOptions:()PhotoKit;
- (void)copyPropertiesToPhotoKitOptions:()PhotoKit;
- (void)initWithUnderlyingPhotoKitImageRequestOptions:()PhotoKit;
- (void)setUnderlyingPhotoKitImageRequestOptions:()PhotoKit;
@end

@implementation PXImageRequestOptions(PhotoKit)

- (id)photoKitRequestOptions
{
  id v2 = [a1 underlyingPhotoKitImageRequestOptions];
  if (!v2)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F390D8]);
    [a1 copyPropertiesToPhotoKitOptions:v2];
  }
  return v2;
}

- (id)underlyingPhotoKitImageRequestOptions
{
  return objc_getAssociatedObject(a1, (const void *)UnderlyingPhotoKitRequestOptionsKey);
}

- (void)copyPropertiesToPhotoKitOptions:()PhotoKit
{
  id v6 = a3;
  objc_msgSend(v6, "setVersion:", objc_msgSend((id)objc_opt_class(), "phImageRequestOptionsVersionFromPXImageRequestOptionsVersion:", objc_msgSend(a1, "version")));
  objc_msgSend(v6, "setAllowPlaceholder:", objc_msgSend(a1, "allowPlaceholder"));
  objc_msgSend(v6, "setDeliveryMode:", objc_msgSend((id)objc_opt_class(), "phImageRequestOptionsDeliveryModeFromPXImageRequestOptionsDeliveryMode:", objc_msgSend(a1, "deliveryMode")));
  objc_msgSend(v6, "setResizeMode:", objc_msgSend((id)objc_opt_class(), "phImageRequestOptionsResizeModeFromPXImageRequestOptionsResizeMode:", objc_msgSend(a1, "resizeMode")));
  [a1 normalizedCropRect];
  objc_msgSend(v6, "setNormalizedCropRect:");
  objc_msgSend(v6, "setNetworkAccessAllowed:", objc_msgSend(a1, "isNetworkAccessAllowed"));
  objc_msgSend(v6, "setSynchronous:", objc_msgSend(a1, "isSynchronous"));
  v4 = [a1 progressHandler];
  [v6 setProgressHandler:v4];

  objc_msgSend(v6, "setAllowSecondaryDegradedImage:", objc_msgSend(a1, "allowSecondaryDegradedImage"));
  [a1 fallbackTargetSizeIfRequestedSizeNotLocallyAvailable];
  objc_msgSend(v6, "setFallbackTargetSizeIfRequestedSizeNotLocallyAvailable:");
  objc_msgSend(v6, "setLoadingMode:", objc_msgSend(a1, "loadingMode"));
  v5 = [a1 resultHandlerQueue];
  [v6 setResultHandlerQueue:v5];

  objc_msgSend(v6, "setDownloadIntent:", objc_msgSend(a1, "downloadIntent"));
  objc_msgSend(v6, "setDownloadPriority:", objc_msgSend(a1, "downloadPriority"));
  objc_msgSend(v6, "setUseLowMemoryMode:", objc_msgSend(a1, "useLowMemoryMode"));
  objc_msgSend(v6, "setPreferHDR:", objc_msgSend(a1, "preferHDR"));
  [a1 targetHDRHeadroom];
  objc_msgSend(v6, "setTargetHDRHeadroom:");
  objc_msgSend(v6, "setIncludeHDRGainMap:", objc_msgSend(a1, "includeHDRGainMap"));
  objc_msgSend(v6, "setChooseAlchemist:", objc_msgSend(a1, "chooseAlchemist"));
  objc_msgSend(v6, "setUseAsyncForFastOpportunisticResult:", objc_msgSend(a1, "useAsyncForFastOpportunisticResult"));
  objc_msgSend(v6, "setOpportunisticDegradedImagesToReturn:", objc_msgSend((id)objc_opt_class(), "phImageRequestOptionsDegradedImagesToReturnFromPXImageRequestOptionsDegradedImagesToReturn:", objc_msgSend(a1, "opportunisticDegradedImagesToReturn")));
}

+ (unint64_t)phImageRequestOptionsVersionFromPXImageRequestOptionsVersion:()PhotoKit
{
  if (a3 >= 3)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"PXImageRequestOptions+PhotoKit.m", 110, @"Unexpected PX value %ti", a3);

    abort();
  }
  return a3;
}

+ (unint64_t)phImageRequestOptionsResizeModeFromPXImageRequestOptionsResizeMode:()PhotoKit
{
  if (a3 >= 3)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"PXImageRequestOptions+PhotoKit.m", 162, @"Unexpected PX value %ti", a3);

    abort();
  }
  return a3;
}

+ (unint64_t)phImageRequestOptionsDeliveryModeFromPXImageRequestOptionsDeliveryMode:()PhotoKit
{
  if (a3 >= 3)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"PXImageRequestOptions+PhotoKit.m", 136, @"Unexpected PX value %ti", a3);

    abort();
  }
  return a3;
}

+ (uint64_t)phImageRequestOptionsDegradedImagesToReturnFromPXImageRequestOptionsDegradedImagesToReturn:()PhotoKit
{
  return a3 & 3;
}

- (uint64_t)copyPropertiesFromPhotoKitOptions:()PhotoKit
{
  id v4 = a3;
  objc_msgSend(a1, "setVersion:", objc_msgSend((id)objc_opt_class(), "pxImageRequestOptionsVersionFromPHImageRequestOptionsVersion:", objc_msgSend(v4, "version")));
  objc_msgSend(a1, "setAllowPlaceholder:", objc_msgSend(v4, "allowPlaceholder"));
  objc_msgSend(a1, "setDeliveryMode:", objc_msgSend((id)objc_opt_class(), "pxImageRequestOptionsDeliveryModeFromPHImageRequestOptionsDeliveryMode:", objc_msgSend(v4, "deliveryMode")));
  objc_msgSend(a1, "setResizeMode:", objc_msgSend((id)objc_opt_class(), "pxImageRequestOptionsResizeModeFromPHImageRequestOptionsResizeMode:", objc_msgSend(v4, "resizeMode")));
  [v4 normalizedCropRect];
  objc_msgSend(a1, "setNormalizedCropRect:");
  objc_msgSend(a1, "setNetworkAccessAllowed:", objc_msgSend(v4, "isNetworkAccessAllowed"));
  objc_msgSend(a1, "setSynchronous:", objc_msgSend(v4, "isSynchronous"));
  v5 = [v4 progressHandler];
  [a1 setProgressHandler:v5];

  objc_msgSend(a1, "setAllowSecondaryDegradedImage:", objc_msgSend(v4, "allowSecondaryDegradedImage"));
  [v4 fallbackTargetSizeIfRequestedSizeNotLocallyAvailable];
  objc_msgSend(a1, "setFallbackTargetSizeIfRequestedSizeNotLocallyAvailable:");
  objc_msgSend(a1, "setLoadingMode:", objc_msgSend(v4, "loadingMode"));
  id v6 = [v4 resultHandlerQueue];
  [a1 setResultHandlerQueue:v6];

  objc_msgSend(a1, "setDownloadIntent:", objc_msgSend(v4, "downloadIntent"));
  objc_msgSend(a1, "setDownloadPriority:", objc_msgSend(v4, "downloadPriority"));
  objc_msgSend(a1, "setUseLowMemoryMode:", objc_msgSend(v4, "useLowMemoryMode"));
  objc_msgSend(a1, "setPreferHDR:", objc_msgSend(v4, "preferHDR"));
  [v4 targetHDRHeadroom];
  objc_msgSend(a1, "setTargetHDRHeadroom:");
  objc_msgSend(a1, "setIncludeHDRGainMap:", objc_msgSend(v4, "includeHDRGainMap"));
  objc_msgSend(a1, "setChooseAlchemist:", objc_msgSend(v4, "chooseAlchemist"));
  objc_msgSend(a1, "setUseAsyncForFastOpportunisticResult:", objc_msgSend(v4, "useAsyncForFastOpportunisticResult"));
  v7 = objc_opt_class();
  uint64_t v8 = [v4 opportunisticDegradedImagesToReturn];

  uint64_t v9 = [v7 pxImageRequestOptionsDegradedImagesToReturnFromPHImageRequestOptionsDegradedImagesToReturn:v8];
  return [a1 setOpportunisticDegradedImagesToReturn:v9];
}

- (void)setUnderlyingPhotoKitImageRequestOptions:()PhotoKit
{
  id value = a3;
  [a1 copyPropertiesFromPhotoKitOptions:value];
  objc_setAssociatedObject(a1, (const void *)UnderlyingPhotoKitRequestOptionsKey, value, (void *)3);
}

- (void)initWithUnderlyingPhotoKitImageRequestOptions:()PhotoKit
{
  id v4 = a3;
  v5 = (void *)[a1 init];
  id v6 = v5;
  if (v5) {
    [v5 setUnderlyingPhotoKitImageRequestOptions:v4];
  }

  return v6;
}

+ (uint64_t)pxImageRequestOptionsDegradedImagesToReturnFromPHImageRequestOptionsDegradedImagesToReturn:()PhotoKit
{
  return a3 & 3;
}

+ (unint64_t)pxImageRequestOptionsResizeModeFromPHImageRequestOptionsResizeMode:()PhotoKit
{
  if (a3 >= 3)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"PXImageRequestOptions+PhotoKit.m", 175, @"Unexpected PH value %ti", a3);

    abort();
  }
  return a3;
}

+ (unint64_t)pxImageRequestOptionsDeliveryModeFromPHImageRequestOptionsDeliveryMode:()PhotoKit
{
  if (a3 >= 3)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"PXImageRequestOptions+PhotoKit.m", 149, @"Unexpected PH value %ti", a3);

    abort();
  }
  return a3;
}

+ (unint64_t)pxImageRequestOptionsVersionFromPHImageRequestOptionsVersion:()PhotoKit
{
  if (a3 >= 3)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"PXImageRequestOptions+PhotoKit.m", 123, @"Unexpected PH value %ti", a3);

    abort();
  }
  return a3;
}

@end