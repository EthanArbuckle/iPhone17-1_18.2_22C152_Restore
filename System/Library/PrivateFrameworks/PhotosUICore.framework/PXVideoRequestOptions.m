@interface PXVideoRequestOptions
- ($28FEB1B56BB3ED5175BFC6DE64DE503F)timeRange;
- (BOOL)includeTimeRangeMapper;
- (BOOL)isMediumHighQualityAllowed;
- (BOOL)isNetworkAccessAllowed;
- (BOOL)isStreamingAllowed;
- (BOOL)liveRenderVideoIfNeeded;
- (BOOL)restrictToEncryptedStream;
- (BOOL)restrictToPlayableOnCurrentDevice;
- (BOOL)restrictToStreamable;
- (CGSize)targetSize;
- (OS_dispatch_queue)resultHandlerQueue;
- (PXVideoRequestOptions)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)photoKitRequestOptions;
- (id)progressHandler;
- (int64_t)deliveryMode;
- (int64_t)downloadIntent;
- (int64_t)downloadPriority;
- (int64_t)streamingVideoIntent;
- (int64_t)version;
- (void)setAllowMediumHighQuality:(BOOL)a3;
- (void)setDeliveryMode:(int64_t)a3;
- (void)setDownloadIntent:(int64_t)a3;
- (void)setDownloadPriority:(int64_t)a3;
- (void)setIncludeTimeRangeMapper:(BOOL)a3;
- (void)setLiveRenderVideoIfNeeded:(BOOL)a3;
- (void)setNetworkAccessAllowed:(BOOL)a3;
- (void)setProgressHandler:(id)a3;
- (void)setRestrictToEncryptedStream:(BOOL)a3;
- (void)setRestrictToPlayableOnCurrentDevice:(BOOL)a3;
- (void)setRestrictToStreamable:(BOOL)a3;
- (void)setResultHandlerQueue:(id)a3;
- (void)setStreamingAllowed:(BOOL)a3;
- (void)setStreamingVideoIntent:(int64_t)a3;
- (void)setTargetSize:(CGSize)a3;
- (void)setTimeRange:(id *)a3;
- (void)setVersion:(int64_t)a3;
@end

@implementation PXVideoRequestOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultHandlerQueue, 0);
  objc_storeStrong(&self->_progressHandler, 0);
}

- (void)setIncludeTimeRangeMapper:(BOOL)a3
{
  self->_includeTimeRangeMapper = a3;
}

- (BOOL)includeTimeRangeMapper
{
  return self->_includeTimeRangeMapper;
}

- (void)setLiveRenderVideoIfNeeded:(BOOL)a3
{
  self->_liveRenderVideoIfNeeded = a3;
}

- (BOOL)liveRenderVideoIfNeeded
{
  return self->_liveRenderVideoIfNeeded;
}

- (void)setAllowMediumHighQuality:(BOOL)a3
{
  self->_allowMediumHighQuality = a3;
}

- (BOOL)isMediumHighQualityAllowed
{
  return self->_allowMediumHighQuality;
}

- (void)setTimeRange:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0.var0;
  long long v4 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_timeRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_timeRange.start.epoch = v4;
  *(_OWORD *)&self->_timeRange.start.value = v3;
}

- ($28FEB1B56BB3ED5175BFC6DE64DE503F)timeRange
{
  long long v3 = *(_OWORD *)&self[2].var0.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[1].var1.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[2].var1.var0;
  return self;
}

- (void)setDownloadPriority:(int64_t)a3
{
  self->_downloadPriority = a3;
}

- (int64_t)downloadPriority
{
  return self->_downloadPriority;
}

- (void)setDownloadIntent:(int64_t)a3
{
  self->_downloadIntent = a3;
}

- (int64_t)downloadIntent
{
  return self->_downloadIntent;
}

- (void)setStreamingVideoIntent:(int64_t)a3
{
  self->_streamingVideoIntent = a3;
}

- (int64_t)streamingVideoIntent
{
  return self->_streamingVideoIntent;
}

- (void)setResultHandlerQueue:(id)a3
{
}

- (OS_dispatch_queue)resultHandlerQueue
{
  return self->_resultHandlerQueue;
}

- (void)setStreamingAllowed:(BOOL)a3
{
  self->_streamingAllowed = a3;
}

- (BOOL)isStreamingAllowed
{
  return self->_streamingAllowed;
}

- (void)setRestrictToEncryptedStream:(BOOL)a3
{
  self->_restrictToEncryptedStream = a3;
}

- (BOOL)restrictToEncryptedStream
{
  return self->_restrictToEncryptedStream;
}

- (void)setRestrictToPlayableOnCurrentDevice:(BOOL)a3
{
  self->_restrictToPlayableOnCurrentDevice = a3;
}

- (BOOL)restrictToPlayableOnCurrentDevice
{
  return self->_restrictToPlayableOnCurrentDevice;
}

- (void)setTargetSize:(CGSize)a3
{
  self->_targetSize = a3;
}

- (CGSize)targetSize
{
  double width = self->_targetSize.width;
  double height = self->_targetSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setProgressHandler:(id)a3
{
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setDeliveryMode:(int64_t)a3
{
  self->_deliveryMode = a3;
}

- (int64_t)deliveryMode
{
  return self->_deliveryMode;
}

- (void)setVersion:(int64_t)a3
{
  self->_version = a3;
}

- (int64_t)version
{
  return self->_version;
}

- (void)setNetworkAccessAllowed:(BOOL)a3
{
  self->_networkAccessAllowed = a3;
}

- (BOOL)isNetworkAccessAllowed
{
  return self->_networkAccessAllowed;
}

- (BOOL)restrictToStreamable
{
  return self->_restrictToStreamable;
}

- (void)setRestrictToStreamable:(BOOL)a3
{
  self->_restrictToStreamable = a3;
  if (a3)
  {
    [(PXVideoRequestOptions *)self setStreamingAllowed:1];
    [(PXVideoRequestOptions *)self setNetworkAccessAllowed:1];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setAllowMediumHighQuality:self->_allowMediumHighQuality];
  [v4 setDeliveryMode:self->_deliveryMode];
  [v4 setDownloadIntent:self->_downloadIntent];
  [v4 setDownloadPriority:self->_downloadPriority];
  [v4 setLiveRenderVideoIfNeeded:self->_liveRenderVideoIfNeeded];
  [v4 setNetworkAccessAllowed:self->_networkAccessAllowed];
  [v4 setProgressHandler:self->_progressHandler];
  [v4 setRestrictToPlayableOnCurrentDevice:self->_restrictToPlayableOnCurrentDevice];
  [v4 setRestrictToStreamable:self->_restrictToStreamable];
  [v4 setRestrictToEncryptedStream:self->_restrictToEncryptedStream];
  [v4 setStreamingAllowed:self->_streamingAllowed];
  [v4 setResultHandlerQueue:self->_resultHandlerQueue];
  [v4 setStreamingVideoIntent:self->_streamingVideoIntent];
  objc_msgSend(v4, "setTargetSize:", self->_targetSize.width, self->_targetSize.height);
  long long v5 = *(_OWORD *)&self->_timeRange.start.epoch;
  v7[0] = *(_OWORD *)&self->_timeRange.start.value;
  v7[1] = v5;
  v7[2] = *(_OWORD *)&self->_timeRange.duration.timescale;
  [v4 setTimeRange:v7];
  [v4 setVersion:self->_version];
  [v4 setIncludeTimeRangeMapper:self->_includeTimeRangeMapper];
  return v4;
}

- (PXVideoRequestOptions)init
{
  v7.receiver = self;
  v7.super_class = (Class)PXVideoRequestOptions;
  v2 = [(PXVideoRequestOptions *)&v7 init];
  long long v3 = (PXVideoRequestOptions *)v2;
  if (v2)
  {
    v2[9] = 0;
    *((_WORD *)v2 + 6) = 0;
    *(void *)(v2 + 23) = 0;
    *(void *)(v2 + 15) = 0;
    v2[31] = 0;
    id v4 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = 0;

    id progressHandler = v3->_progressHandler;
    v3->_id progressHandler = 0;

    *(_WORD *)&v3->_restrictToPlayableOnCurrentDevice = 1;
    v3->_restrictToStreamable = 0;
  }
  return v3;
}

- (id)photoKitRequestOptions
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F39348]);
  objc_msgSend(v3, "setNetworkAccessAllowed:", -[PXVideoRequestOptions isNetworkAccessAllowed](self, "isNetworkAccessAllowed"));
  objc_msgSend(v3, "setVersion:", -[PXVideoRequestOptions version](self, "version"));
  objc_msgSend(v3, "setDeliveryMode:", -[PXVideoRequestOptions deliveryMode](self, "deliveryMode"));
  id v4 = [(PXVideoRequestOptions *)self progressHandler];
  [v3 setProgressHandler:v4];

  [v3 setVideoComplementAllowed:1];
  [(PXVideoRequestOptions *)self targetSize];
  objc_msgSend(v3, "setTargetSize:");
  objc_msgSend(v3, "setRestrictToPlayableOnCurrentDevice:", -[PXVideoRequestOptions restrictToPlayableOnCurrentDevice](self, "restrictToPlayableOnCurrentDevice"));
  objc_msgSend(v3, "setRestrictToStreamable:", -[PXVideoRequestOptions restrictToStreamable](self, "restrictToStreamable"));
  objc_msgSend(v3, "setRestrictToEncryptedStream:", -[PXVideoRequestOptions restrictToEncryptedStream](self, "restrictToEncryptedStream"));
  objc_msgSend(v3, "setStreamingAllowed:", -[PXVideoRequestOptions isStreamingAllowed](self, "isStreamingAllowed"));
  long long v5 = [(PXVideoRequestOptions *)self resultHandlerQueue];
  [v3 setResultHandlerQueue:v5];

  objc_msgSend(v3, "setStreamingVideoIntent:", -[PXVideoRequestOptions streamingVideoIntent](self, "streamingVideoIntent"));
  objc_msgSend(v3, "setDownloadIntent:", -[PXVideoRequestOptions downloadIntent](self, "downloadIntent"));
  objc_msgSend(v3, "setDownloadPriority:", -[PXVideoRequestOptions downloadPriority](self, "downloadPriority"));
  [(PXVideoRequestOptions *)self timeRange];
  v7[0] = v7[3];
  v7[1] = v7[4];
  v7[2] = v7[5];
  [v3 setTimeRange:v7];
  objc_msgSend(v3, "setAllowMediumHighQuality:", -[PXVideoRequestOptions isMediumHighQualityAllowed](self, "isMediumHighQualityAllowed"));
  objc_msgSend(v3, "setLiveRenderVideoIfNeeded:", -[PXVideoRequestOptions liveRenderVideoIfNeeded](self, "liveRenderVideoIfNeeded"));
  objc_msgSend(v3, "setIncludeTimeRangeMapper:", -[PXVideoRequestOptions includeTimeRangeMapper](self, "includeTimeRangeMapper"));
  return v3;
}

@end