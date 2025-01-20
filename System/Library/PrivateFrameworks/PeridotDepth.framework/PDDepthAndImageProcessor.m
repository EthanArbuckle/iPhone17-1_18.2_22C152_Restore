@interface PDDepthAndImageProcessor
- (ADCameraCalibration)imageCalibrationData;
- (BOOL)pointCloudFiltering;
- (BOOL)retainImagesRemovedFromQueue;
- (PDDepthAndImageProcessor)initWithPointCloudToImageTransform:(__n128)a3 imageCameraCalibration:(__n128)a4;
- (__n128)pointCloudToImageTransform;
- (id).cxx_construct;
- (id)checkSyncResults:(PushResults *)a3;
- (id)purgeAllQueuedImages;
- (id)pushImage:(id)a3;
- (id)pushPointCloud:(id)a3;
- (int)numberOfPointCloudsPerImage;
- (void)setImageCalibrationData:(id)a3;
- (void)setNumberOfPointCloudsPerImage:(int)a3;
- (void)setPointCloudFiltering:(BOOL)a3;
- (void)setRetainImagesRemovedFromQueue:(BOOL)a3;
@end

@implementation PDDepthAndImageProcessor

- (id).cxx_construct
{
  *(_OWORD *)&self->_sync.m_pointClouds.__map_.__first_ = 0u;
  *(_OWORD *)&self->_sync.m_images.__map_.__end_ = 0u;
  *(_OWORD *)&self->_sync.m_images.__start_ = 0u;
  *(_OWORD *)&self->_sync.m_pointClouds.__start_ = 0u;
  *(_OWORD *)&self->_sync.m_images.__map_.__first_ = 0u;
  *(_OWORD *)&self->_sync.m_pointClouds.__map_.__end_ = 0u;
  pthread_mutex_init(&self->_sync.m_lock, 0);
  self->_sync.m_numberOfBanksToMatch = 2;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageCalibrationData, 0);
  TimeSync::~TimeSync(&self->_sync);
}

- (void)setRetainImagesRemovedFromQueue:(BOOL)a3
{
  self->_retainImagesRemovedFromQueue = a3;
}

- (BOOL)retainImagesRemovedFromQueue
{
  return self->_retainImagesRemovedFromQueue;
}

- (void)setPointCloudFiltering:(BOOL)a3
{
  self->_pointCloudFiltering = a3;
}

- (BOOL)pointCloudFiltering
{
  return self->_pointCloudFiltering;
}

- (void)setImageCalibrationData:(id)a3
{
}

- (ADCameraCalibration)imageCalibrationData
{
  return self->_imageCalibrationData;
}

- (__n128)pointCloudToImageTransform
{
  return a1[12];
}

- (id)purgeAllQueuedImages
{
  v6.var4[0] = 0;
  v6.var4[1] = 0;
  TimeSync::purgeAllImages(&self->_sync, &v6);
  v3 = [(PDDepthAndImageProcessor *)self checkSyncResults:&v6];
  v4 = [v3 droppedImages];

  return v4;
}

- (id)checkSyncResults:(PushResults *)a3
{
  v5 = objc_alloc_init(PDDepthAndImagePushResults);
  if (a3->var0)
  {
    long long v41 = *(_OWORD *)&self[1].super.isa;
    long long v37 = *(_OWORD *)&self[1]._sync.m_pointClouds.__map_.__end_cap_.__value_;
    long long v39 = *(_OWORD *)&self[1]._sync.m_pointClouds.__map_.__begin_;
    long long v35 = *(_OWORD *)&self[1]._sync.m_pointClouds.__size_.__value_;
    PushResults v6 = objc_alloc_init(PDMatchedDepthAndImage);
    [(PDDepthAndImagePushResults *)v5 setMatch:v6];

    v7 = [PDTimestampedImage alloc];
    var0 = a3->var0;
    var1 = a3->var1;
    long long v50 = *(_OWORD *)&a3->var2.var0;
    int64_t var3 = a3->var2.var3;
    v10 = [(PDTimestampedImage *)v7 initWithImage:var0 metadataDictionary:var1 andTimestamp:&v50];
    v11 = [(PDDepthAndImagePushResults *)v5 match];
    [v11 setImage:v10];

    CVPixelBufferRelease(a3->var0);
    v12 = [MEMORY[0x263EFF980] arrayWithCapacity:a3->var3];
    v42 = v5;
    v13 = [MEMORY[0x263EFF980] arrayWithCapacity:a3->var3];
    if (a3->var3 < 1)
    {
      double v17 = 0.0;
    }
    else
    {
      uint64_t v14 = 0;
      var5 = (CMTime *)a3->var5;
      var4 = a3->var4;
      double v17 = 0.0;
      do
      {
        objc_msgSend(v12, "addObject:", var4[v14], v35, v37, v39);
        v18 = [PDTimestampedPointCloud alloc];
        id v19 = var4[v14];
        long long v48 = *(_OWORD *)&var5->value;
        CMTimeEpoch epoch = var5->epoch;
        v20 = [(PDTimestampedPointCloud *)v18 initWithPointCloud:v19 andTimestamp:&v48];
        [v13 addObject:v20];
        CMTime time = *var5;
        double v17 = CMTimeGetSeconds(&time) + v17;

        ++v14;
        ++var5;
      }
      while (v14 < a3->var3);
    }
    v5 = v42;
    v21 = [(PDDepthAndImagePushResults *)v42 match];
    [v21 setOriginalPointClouds:v13];

    v22 = [MEMORY[0x263F26C98] pointCloudByMergingPointClouds:v12];
    v23 = objc_msgSend(v22, "pointCloudByChangingPointOfViewByTransform:to:", self->_imageCalibrationData, *(double *)&v41, v40, v38, v36);
    memset(&v46, 0, sizeof(v46));
    CMTimeMakeWithSeconds(&v46, v17 / (double)a3->var3, 1000000);
    v24 = [PDTimestampedPointCloud alloc];
    CMTime v45 = v46;
    v25 = [(PDTimestampedPointCloud *)v24 initWithPointCloud:v23 andTimestamp:&v45];
    v26 = [(PDDepthAndImagePushResults *)v42 match];
    [v26 setPointCloud:v25];
  }
  if (a3->var6 >= 1)
  {
    v27 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:");
    if (a3->var6 >= 1)
    {
      uint64_t v28 = 0;
      var8 = a3->var8;
      var7 = a3->var7;
      do
      {
        v31 = [PDTimestampedImage alloc];
        v32 = var7[v28];
        long long v43 = *(_OWORD *)&var8->var0;
        int64_t v44 = var8->var3;
        v33 = [(PDTimestampedImage *)v31 initWithImage:v32 metadataDictionary:0 andTimestamp:&v43];
        CVPixelBufferRelease(var7[v28]);
        [v27 addObject:v33];

        ++v28;
        ++var8;
      }
      while (v28 < a3->var6);
    }
    [(PDDepthAndImagePushResults *)v5 setDroppedImages:v27];
  }
  return v5;
}

- (id)pushImage:(id)a3
{
  id v4 = a3;
  v10.var4[0] = 0;
  v10.var4[1] = 0;
  v5 = (__CVBuffer *)[v4 image];
  CFDictionaryRef v6 = [v4 metadataDictionary];
  if (v4) {
    [v4 timestamp];
  }
  else {
    memset(&v9, 0, sizeof(v9));
  }
  TimeSync::pushImage(&self->_sync, v5, v6, &v9, &v10);

  if (self->_retainImagesRemovedFromQueue) {
    CVPixelBufferRetain((CVPixelBufferRef)[v4 image]);
  }
  v7 = -[PDDepthAndImageProcessor checkSyncResults:](self, "checkSyncResults:", &v10, v9.value, *(void *)&v9.timescale, v9.epoch);

  return v7;
}

- (id)pushPointCloud:(id)a3
{
  id v4 = a3;
  v9.var4[0] = 0;
  v9.var4[1] = 0;
  v5 = [v4 pointCloud];
  if (v4) {
    [v4 timestamp];
  }
  else {
    memset(&v8, 0, sizeof(v8));
  }
  TimeSync::pushPeridotPointCloud(&self->_sync, v5, &v8, &v9);

  CFDictionaryRef v6 = [(PDDepthAndImageProcessor *)self checkSyncResults:&v9];

  return v6;
}

- (PDDepthAndImageProcessor)initWithPointCloudToImageTransform:(__n128)a3 imageCameraCalibration:(__n128)a4
{
  id v9 = a7;
  v18.receiver = a1;
  v18.super_class = (Class)PDDepthAndImageProcessor;
  PushResults v10 = [(PDDepthAndImageProcessor *)&v18 init];
  v11 = v10;
  if (v10)
  {
    *(__n128 *)&v10[1].super.isa = a2;
    *(__n128 *)&v10[1]._sync.m_pointClouds.__map_.__begin_ = a3;
    *(__n128 *)&v10[1]._sync.m_pointClouds.__map_.__end_cap_.__value_ = a4;
    *(__n128 *)&v10[1]._sync.m_pointClouds.__size_.__value_ = a5;
    objc_storeStrong((id *)&v10->_imageCalibrationData, a7);
    *(_WORD *)&v11->_pointCloudFiltering = 0;
    v12 = v11;
  }

  return v11;
}

- (void)setNumberOfPointCloudsPerImage:(int)a3
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if ((a3 - 5) <= 0xFFFFFFFB)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v5 = a3;
      _os_log_error_impl(&dword_258FEE000, &_os_log_internal, OS_LOG_TYPE_ERROR, "ERROR: Bad configuration for timesync: does not know how to match %d banks per image", buf, 8u);
    }
    __assert_rtn("setNumberOfBanksToMatch", "TimeSync.mm", 55, "false");
  }
  self->_sync.m_numberOfBanksToMatch = a3;
}

- (int)numberOfPointCloudsPerImage
{
  return self->_sync.m_numberOfBanksToMatch;
}

@end