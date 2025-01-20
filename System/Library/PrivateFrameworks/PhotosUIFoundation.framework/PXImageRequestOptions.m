@interface PXImageRequestOptions
- (BOOL)allowPlaceholder;
- (BOOL)allowSecondaryDegradedImage;
- (BOOL)chooseAlchemist;
- (BOOL)includeHDRGainMap;
- (BOOL)isNetworkAccessAllowed;
- (BOOL)isSynchronous;
- (BOOL)preferHDR;
- (BOOL)useAsyncForFastOpportunisticResult;
- (BOOL)useLowMemoryMode;
- (CGRect)normalizedCropRect;
- (CGSize)fallbackTargetSizeIfRequestedSizeNotLocallyAvailable;
- (OS_dispatch_queue)resultHandlerQueue;
- (PXImageRequestOptions)init;
- (double)targetHDRHeadroom;
- (id)copyWithZone:(_NSZone *)a3;
- (id)progressHandler;
- (int64_t)deliveryMode;
- (int64_t)downloadIntent;
- (int64_t)downloadPriority;
- (int64_t)loadingMode;
- (int64_t)opportunisticDegradedImagesToReturn;
- (int64_t)resizeMode;
- (int64_t)version;
- (void)copyPropertiesToOptions:(id)a3;
- (void)setAllowPlaceholder:(BOOL)a3;
- (void)setAllowSecondaryDegradedImage:(BOOL)a3;
- (void)setChooseAlchemist:(BOOL)a3;
- (void)setDeliveryMode:(int64_t)a3;
- (void)setDownloadIntent:(int64_t)a3;
- (void)setDownloadPriority:(int64_t)a3;
- (void)setFallbackTargetSizeIfRequestedSizeNotLocallyAvailable:(CGSize)a3;
- (void)setIncludeHDRGainMap:(BOOL)a3;
- (void)setLoadingMode:(int64_t)a3;
- (void)setNetworkAccessAllowed:(BOOL)a3;
- (void)setNormalizedCropRect:(CGRect)a3;
- (void)setOpportunisticDegradedImagesToReturn:(int64_t)a3;
- (void)setPreferHDR:(BOOL)a3;
- (void)setProgressHandler:(id)a3;
- (void)setResizeMode:(int64_t)a3;
- (void)setResultHandlerQueue:(id)a3;
- (void)setSynchronous:(BOOL)a3;
- (void)setTargetHDRHeadroom:(double)a3;
- (void)setUseAsyncForFastOpportunisticResult:(BOOL)a3;
- (void)setUseLowMemoryMode:(BOOL)a3;
- (void)setVersion:(int64_t)a3;
@end

@implementation PXImageRequestOptions

- (int64_t)resizeMode
{
  return self->_resizeMode;
}

- (BOOL)isNetworkAccessAllowed
{
  return self->_networkAccessAllowed;
}

- (int64_t)deliveryMode
{
  return self->_deliveryMode;
}

- (CGRect)normalizedCropRect
{
  double x = self->_normalizedCropRect.origin.x;
  double y = self->_normalizedCropRect.origin.y;
  double width = self->_normalizedCropRect.size.width;
  double height = self->_normalizedCropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (int64_t)loadingMode
{
  return self->_loadingMode;
}

- (int64_t)version
{
  return self->_version;
}

- (BOOL)useLowMemoryMode
{
  return self->_useLowMemoryMode;
}

- (BOOL)useAsyncForFastOpportunisticResult
{
  return self->_useAsyncForFastOpportunisticResult;
}

- (double)targetHDRHeadroom
{
  return self->_targetHDRHeadroom;
}

- (OS_dispatch_queue)resultHandlerQueue
{
  return self->_resultHandlerQueue;
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (BOOL)preferHDR
{
  return self->_preferHDR;
}

- (BOOL)isSynchronous
{
  return self->_synchronous;
}

- (BOOL)includeHDRGainMap
{
  return self->_includeHDRGainMap;
}

- (CGSize)fallbackTargetSizeIfRequestedSizeNotLocallyAvailable
{
  double width = self->_fallbackTargetSizeIfRequestedSizeNotLocallyAvailable.width;
  double height = self->_fallbackTargetSizeIfRequestedSizeNotLocallyAvailable.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int64_t)downloadPriority
{
  return self->_downloadPriority;
}

- (int64_t)downloadIntent
{
  return self->_downloadIntent;
}

- (BOOL)chooseAlchemist
{
  return self->_chooseAlchemist;
}

- (BOOL)allowPlaceholder
{
  return self->_allowPlaceholder;
}

- (void)setAllowSecondaryDegradedImage:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(PXImageRequestOptions *)self opportunisticDegradedImagesToReturn] & 0xFFFFFFFFFFFFFFFDLL;
  uint64_t v6 = 2;
  if (!v3) {
    uint64_t v6 = 0;
  }

  [(PXImageRequestOptions *)self setOpportunisticDegradedImagesToReturn:v5 | v6];
}

- (BOOL)allowSecondaryDegradedImage
{
  return ((unint64_t)[(PXImageRequestOptions *)self opportunisticDegradedImagesToReturn] >> 1) & 1;
}

- (int64_t)opportunisticDegradedImagesToReturn
{
  return self->_opportunisticDegradedImagesToReturn;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [(PXImageRequestOptions *)self copyPropertiesToOptions:v4];
  return v4;
}

- (PXImageRequestOptions)init
{
  v7.receiver = self;
  v7.super_class = (Class)PXImageRequestOptions;
  v2 = [(PXImageRequestOptions *)&v7 init];
  BOOL v3 = v2;
  if (v2)
  {
    v2->_loadingMode = 0;
    v2->_version = 0;
    v2->_deliveryMode = 0;
    CGSize v4 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
    v2->_normalizedCropRect.origin = (CGPoint)*MEMORY[0x263F001A8];
    v2->_normalizedCropRect.size = v4;
    v2->_networkAccessAllowed = 0;
    id progressHandler = v2->_progressHandler;
    v2->_resizeMode = 1;
    v2->_id progressHandler = 0;

    v3->_fallbackTargetSizeIfRequestedSizeNotLocallyAvailable = (CGSize)*MEMORY[0x263F001B0];
    v3->_allowPlaceholder = 0;
    v3->_targetHDRHeadroom = 1.0;
    v3->_chooseAlchemist = 0;
    *(_WORD *)&v3->_useAsyncForFastOpportunisticResult = 0;
    v3->_opportunisticDegradedImagesToReturn = 1;
  }
  return v3;
}

- (void)copyPropertiesToOptions:(id)a3
{
  int64_t version = self->_version;
  id v5 = a3;
  [v5 setVersion:version];
  [v5 setAllowPlaceholder:self->_allowPlaceholder];
  [v5 setDeliveryMode:self->_deliveryMode];
  [v5 setResizeMode:self->_resizeMode];
  objc_msgSend(v5, "setNormalizedCropRect:", self->_normalizedCropRect.origin.x, self->_normalizedCropRect.origin.y, self->_normalizedCropRect.size.width, self->_normalizedCropRect.size.height);
  [v5 setNetworkAccessAllowed:self->_networkAccessAllowed];
  [v5 setSynchronous:self->_synchronous];
  [v5 setProgressHandler:self->_progressHandler];
  objc_msgSend(v5, "setFallbackTargetSizeIfRequestedSizeNotLocallyAvailable:", self->_fallbackTargetSizeIfRequestedSizeNotLocallyAvailable.width, self->_fallbackTargetSizeIfRequestedSizeNotLocallyAvailable.height);
  [v5 setLoadingMode:self->_loadingMode];
  [v5 setResultHandlerQueue:self->_resultHandlerQueue];
  [v5 setDownloadIntent:self->_downloadIntent];
  [v5 setDownloadPriority:self->_downloadPriority];
  [v5 setUseLowMemoryMode:self->_useLowMemoryMode];
  [v5 setPreferHDR:self->_preferHDR];
  [v5 setTargetHDRHeadroom:self->_targetHDRHeadroom];
  [v5 setIncludeHDRGainMap:self->_includeHDRGainMap];
  [v5 setChooseAlchemist:self->_chooseAlchemist];
  [v5 setUseAsyncForFastOpportunisticResult:self->_useAsyncForFastOpportunisticResult];
  [v5 setOpportunisticDegradedImagesToReturn:self->_opportunisticDegradedImagesToReturn];
}

- (void)setLoadingMode:(int64_t)a3
{
  self->_loadingMode = a3;
}

- (void)setUseLowMemoryMode:(BOOL)a3
{
  self->_useLowMemoryMode = a3;
}

- (void)setTargetHDRHeadroom:(double)a3
{
  self->_targetHDRHeadroom = a3;
}

- (void)setResultHandlerQueue:(id)a3
{
}

- (void)setPreferHDR:(BOOL)a3
{
  self->_preferHDR = a3;
}

- (void)setDownloadIntent:(int64_t)a3
{
  self->_downloadIntent = a3;
}

- (void)setDeliveryMode:(int64_t)a3
{
  self->_deliveryMode = a3;
}

- (void)setOpportunisticDegradedImagesToReturn:(int64_t)a3
{
  self->_opportunisticDegradedImagesToReturn = a3;
}

- (void)setNetworkAccessAllowed:(BOOL)a3
{
  self->_networkAccessAllowed = a3;
}

- (void)setUseAsyncForFastOpportunisticResult:(BOOL)a3
{
  self->_useAsyncForFastOpportunisticResult = a3;
}

- (void)setVersion:(int64_t)a3
{
  self->_int64_t version = a3;
}

- (void)setSynchronous:(BOOL)a3
{
  self->_synchronous = a3;
}

- (void)setResizeMode:(int64_t)a3
{
  self->_resizeMode = a3;
}

- (void)setProgressHandler:(id)a3
{
}

- (void)setNormalizedCropRect:(CGRect)a3
{
  self->_normalizedCropRect = a3;
}

- (void)setIncludeHDRGainMap:(BOOL)a3
{
  self->_includeHDRGainMap = a3;
}

- (void)setFallbackTargetSizeIfRequestedSizeNotLocallyAvailable:(CGSize)a3
{
  self->_fallbackTargetSizeIfRequestedSizeNotLocallyAvailable = a3;
}

- (void)setDownloadPriority:(int64_t)a3
{
  self->_downloadPrioritdouble y = a3;
}

- (void)setChooseAlchemist:(BOOL)a3
{
  self->_chooseAlchemist = a3;
}

- (void)setAllowPlaceholder:(BOOL)a3
{
  self->_allowPlaceholder = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultHandlerQueue, 0);

  objc_storeStrong(&self->_progressHandler, 0);
}

@end