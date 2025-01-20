@interface VLLocalizer
+ (BOOL)isVisualLocalizationSupported;
+ (double)maximumHorizontalAccuracyThreshold;
+ (double)minimumTiltAngle;
+ (id)_debugInfoRecorder;
+ (void)_setDebugInfoRecorder:(id)a3;
- (BOOL)_debugInfoShouldPreserveImageData;
- (BOOL)shouldCacheMetadata;
- (VLLocalizationResult)_locateWithPixelBuffer:(float64_t)a3 deviceLocation:(int8x16_t)a4 heading:(int8x16_t)a5 gravity:(int32x4_t)a6 transform:(int8x16_t)a7 cameraIntrinsics:(uint64_t)a8 radialDistortion:(void *)a9 exposureTargetOffset:(void *)a10 timestamp:(float64x2_t *)a11 calculationBlock:(void *)a12 error:(unint64_t)a13;
- (VLLocalizer)init;
- (VLLocalizer)initWithAuditToken:(id)a3;
- (VLLocalizer)initWithDataProvider:(id)a3;
- (id)_altitudesAtLocation:(id *)a3 error:(id *)a4;
- (id)_fileURLForTile:(const vl_tile_t *)a3 error:(id *)a4;
- (id)locateWithPixelBuffer:(double)a3 location:(double)a4 heading:(double)a5 gravity:(double)a6 transform:(double)a7 cameraIntrinsics:(uint64_t)a8 radialDistortion:(uint64_t)a9 timestamp:(float64x2_t *)a10 error:(long long *)a11;
- (id)locateWithPixelBuffer:(double)a3 timestamp:(double)a4 location:(double)a5 gravity:(__n128)a6 transform:(__n128)a7 cameraIntrinsics:(__n128)a8 radialDistortion:(double)a9 error:(uint64_t)a10;
- (id)locateWithPixelBuffer:(double)a3 timestamp:(uint64_t)a4 location:(uint64_t)a5 heading:(unint64_t)a6 gravity:(_OWORD *)a7 transform:(long long *)a8 cameraIntrinsics:(uint64_t)a9 radialDistortion:(uint64_t)a10 error:(__int128)a11;
- (id)locateWithPixelBuffer:(uint64_t)a3 deviceLocation:(uint64_t)a4 heading:(_OWORD *)a5 gravity:(uint64_t)a6 transform:(uint64_t)a7 cameraIntrinsics:(uint64_t)a8 radialDistortion:(__int128)a9 ambientLightIntensity:(__int128)a10 timestamp:(__int128)a11 error:(uint64_t)a12;
- (id)locateWithPixelBuffer:(uint64_t)a3 deviceLocation:(uint64_t)a4 heading:(_OWORD *)a5 gravity:(uint64_t)a6 transform:(uint64_t)a7 cameraIntrinsics:(uint64_t)a8 radialDistortion:(__int128)a9 exposureTargetOffset:(__int128)a10 timestamp:(__int128)a11 error:(uint64_t)a12;
- (int)_algorithmVersion;
- (vl_t)_vlHandle;
- (void)_commonInit;
- (void)_deterministicLocateWithPixelBuffer:(double)a3 deviceLocation:(__n128)a4 heading:(__n128)a5 gravity:(__n128)a6 transform:(__n128)a7 cameraIntrinsics:(uint64_t)a8 radialDistortion:(uint64_t)a9 exposureTargetOffset:(void *)a10 timestamp:(long long *)a11 completionHandler:(void *)a12;
- (void)_resolveCurrentAltitudeQuery;
- (void)_setAlgorithmVersion:(int)a3;
- (void)_setDebugInfoShouldPreserveImageData:(BOOL)a3;
- (void)dataProvider:(id)a3 didChangeFormatVersion:(unsigned int)a4;
- (void)dealloc;
- (void)determineAltitudesAtLocation:(id)a3 callbackQueue:(id)a4 callback:(id)a5;
- (void)determineAvailabilityAtLocation:(id)a3 callbackQueue:(id)a4 callback:(id)a5;
- (void)determineAvailabilityAtLocation:(id)a3 purpose:(int64_t)a4 callbackQueue:(id)a5 callback:(id)a6;
- (void)prepareWithDeviceLocation:(id)a3;
- (void)prepareWithLocation:(id)a3;
- (void)setShouldCacheMetadata:(BOOL)a3;
@end

@implementation VLLocalizer

- (void)determineAvailabilityAtLocation:(id)a3 purpose:(int64_t)a4 callbackQueue:(id)a5 callback:(id)a6
{
  id v11 = v6;
  v12 = a6;
  if (([(id)objc_opt_class() isVisualLocalizationSupported] & 1) == 0)
  {
    if (qword_26AC375D0 == -1)
    {
      v25 = qword_26AC375C8;
      if (!os_log_type_enabled((os_log_t)qword_26AC375C8, OS_LOG_TYPE_INFO))
      {
LABEL_15:
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __78__VLLocalizer_determineAvailabilityAtLocation_purpose_callbackQueue_callback___block_invoke;
        block[3] = &unk_2643BA238;
        id v32 = v11;
        dispatch_async(v12, block);

        goto LABEL_18;
      }
    }
    else
    {
      dispatch_once(&qword_26AC375D0, &__block_literal_global_215);
      v25 = qword_26AC375C8;
      if (!os_log_type_enabled((os_log_t)qword_26AC375C8, OS_LOG_TYPE_INFO)) {
        goto LABEL_15;
      }
    }
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21BAD2000, v25, OS_LOG_TYPE_INFO, "Visual localization is not supported on this device", buf, 2u);
    goto LABEL_15;
  }
  float64x2_t v13 = *(float64x2_t *)a4;
  long double v14 = *(double *)(a4 + 8);
  double v15 = sqrt(vmlad_n_f64(vmuld_lane_f64(v14, *(float64x2_t *)a4, 1), v13.f64[0], v13.f64[0]));
  double v16 = v15 * 0.99330562;
  double v17 = 1.57079633;
  if (v15 * 0.99330562 != 0.0)
  {
    double v26 = *(double *)(a4 + 8);
    float64x2_t v27 = *(float64x2_t *)a4;
    unsigned int v18 = 0;
    long double __y = *(double *)(a4 + 16);
    double v17 = 0.0;
    double v19 = 0.0;
    do
    {
      double v21 = v17;
      double v17 = atan2(__y, v16);
      __double2 v22 = __sincos_stret(v17);
      double v23 = 6378137.0 / sqrt(v22.__sinval * -0.00669437999 * v22.__sinval + 1.0);
      double v24 = v15 / v22.__cosval - v23;
      if (vabdd_f64(v21, v17) < 0.000001)
      {
        if (vabdd_f64(v19, v24) < 0.001 || v18 >= 9)
        {
LABEL_11:
          v13.f64[0] = v27.f64[0];
          long double v14 = v26;
          goto LABEL_17;
        }
      }
      else if (v18 > 8)
      {
        goto LABEL_11;
      }
      ++v18;
      double v16 = v15 * (v23 / (v23 + v24) * -0.00669437999 + 1.0);
      double v19 = v15 / v22.__cosval - v23;
    }
    while (v16 != 0.0);
    v13.f64[0] = v27.f64[0];
    double v17 = 1.57079633;
    long double v14 = v26;
  }
LABEL_17:
  *(double *)buf = v17 / 0.0174532925;
  double v30 = atan2(v14, v13.f64[0]) / 0.0174532925;
  [(VLLocalizationDataProvider *)self->_dataProvider determineAvailabilityForCoordinate:buf horizontalAccuracy:a5 purpose:v12 callbackQueue:v11 callback:*(double *)(a4 + 32)];

LABEL_18:
}

+ (BOOL)isVisualLocalizationSupported
{
  if (qword_26AC375A0 != -1) {
    dispatch_once(&qword_26AC375A0, &__block_literal_global_3);
  }
  return _MergedGlobals_3;
}

- (VLLocalizer)initWithAuditToken:(id)a3
{
  v25[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)VLLocalizer;
  v5 = [(VLLocalizer *)&v24 init];
  v6 = v5;
  if (v5)
  {
    [(VLLocalizer *)v5 _commonInit];
    v7 = [MEMORY[0x263EFF980] arrayWithCapacity:6];
    v8 = [NSNumber numberWithInt:vl_argo_support_data_ver];
    [v7 addObject:v8];

    v9 = [NSNumber numberWithInt:dword_267C60C50];
    [v7 addObject:v9];

    v10 = [NSNumber numberWithInt:dword_267C60C54];
    [v7 addObject:v10];

    id v11 = [NSNumber numberWithInt:dword_267C60C58];
    [v7 addObject:v11];

    v12 = [NSNumber numberWithInt:dword_267C60C5C];
    [v7 addObject:v12];

    float64x2_t v13 = [NSNumber numberWithInt:dword_267C60C60];
    [v7 addObject:v13];

    long double v14 = [[VLTileDataProvider alloc] initWithAuditToken:v4 supportedFormatVersions:v7];
    dataProvider = v6->_dataProvider;
    v6->_dataProvider = (VLLocalizationDataProvider *)v14;

    [(VLLocalizationDataProvider *)v6->_dataProvider setDelegate:v6];
    double v16 = NSURL;
    double v17 = [MEMORY[0x263F41798] geoServicesCacheDirectoryPath];
    v25[0] = v17;
    v25[1] = @"VisualLocalization";
    unsigned int v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
    double v19 = [v16 fileURLWithPathComponents:v18];

    v20 = [[VLFilesystemDataProvider alloc] initWithBaseDirectory:v19];
    backupDataProvider = v6->_backupDataProvider;
    v6->_backupDataProvider = (VLLocalizationDataProvider *)v20;

    __double2 v22 = v6;
  }

  return v6;
}

- (void)_commonInit
{
  v19[2] = *MEMORY[0x263EF8340];
  if (qword_26AC375D0 != -1) {
    dispatch_once(&qword_26AC375D0, &__block_literal_global_215);
  }
  self->_os_signpost_id_t signpostID = os_signpost_id_generate((os_log_t)qword_26AC375C8);
  if (qword_26AC375D0 != -1) {
    dispatch_once(&qword_26AC375D0, &__block_literal_global_215);
  }
  v3 = (id)qword_26AC375C8;
  id v4 = v3;
  os_signpost_id_t signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)unsigned int v18 = 0;
    _os_signpost_emit_with_name_impl(&dword_21BAD2000, v4, OS_SIGNPOST_INTERVAL_BEGIN, signpostID, "Session", (const char *)&unk_21BB79E01, v18, 2u);
  }

  self->_vlOnce.lock._os_unfair_lock_opaque = 0;
  self->_vlOnce.didRun = 0;
  self->_algorithmVersion = GEOConfigGetInteger();
  v6 = NSURL;
  v7 = [MEMORY[0x263F41798] geoServicesCacheDirectoryPath];
  v19[0] = v7;
  v19[1] = @"VisualLocalization";
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
  v9 = [v6 fileURLWithPathComponents:v8];

  v10 = [[VLFilesystemDataProvider alloc] initWithBaseDirectory:v9];
  backupDataProvider = self->_backupDataProvider;
  self->_backupDataProvider = (VLLocalizationDataProvider *)v10;

  v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  float64x2_t v13 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.VisualLocalization.Recorder", v12);
  recorderQueue = self->_recorderQueue;
  self->_recorderQueue = v13;

  double v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  double v16 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.VisualLocalization.AltitudeCalculation", v15);
  altitudeCalculationQueue = self->_altitudeCalculationQueue;
  self->_altitudeCalculationQueue = v16;
}

+ (double)maximumHorizontalAccuracyThreshold
{
  return *(double *)&vl_gps_max_horz_accuracy;
}

void __44__VLLocalizer_isVisualLocalizationSupported__block_invoke()
{
  id v1 = MTLCreateSystemDefaultDevice();
  if ([v1 supportsFamily:3003] & 1) != 0 || (objc_msgSend(v1, "supportsFamily:", 1004)) {
    char v0 = 1;
  }
  else {
    char v0 = [v1 supportsFamily:2002];
  }
  _MergedGlobals_3 = v0;
}

+ (id)_debugInfoRecorder
{
  v2 = (void *)MEMORY[0x21D499960](qword_26AC37598, a2);
  return v2;
}

+ (void)_setDebugInfoRecorder:(id)a3
{
  qword_26AC37598 = [a3 copy];
  MEMORY[0x270F9A758]();
}

+ (double)minimumTiltAngle
{
  return *(double *)&vl_camera_min_gravity_angle;
}

- (VLLocalizer)init
{
  return [(VLLocalizer *)self initWithAuditToken:0];
}

- (VLLocalizer)initWithDataProvider:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VLLocalizer;
  v6 = [(VLLocalizer *)&v10 init];
  v7 = v6;
  if (v6)
  {
    [(VLLocalizer *)v6 _commonInit];
    objc_storeStrong((id *)&v7->_dataProvider, a3);
    [(VLLocalizationDataProvider *)v7->_dataProvider setDelegate:v7];
    v8 = v7;
  }

  return v7;
}

- (void)dealloc
{
  vl = self->_vl;
  if (vl) {
    vl_free((uint64_t)vl);
  }
  if (qword_26AC375D0 != -1) {
    dispatch_once(&qword_26AC375D0, &__block_literal_global_215);
  }
  id v4 = (id)qword_26AC375C8;
  id v5 = v4;
  os_signpost_id_t signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21BAD2000, v5, OS_SIGNPOST_INTERVAL_END, signpostID, "Session", (const char *)&unk_21BB79E01, buf, 2u);
  }

  v7.receiver = self;
  v7.super_class = (Class)VLLocalizer;
  [(VLLocalizer *)&v7 dealloc];
}

- (vl_t)_vlHandle
{
  return self->_vl;
}

void __24__VLLocalizer__vlHandle__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = [v2 bundleIdentifier];

  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  *(void *)(*(void *)(a1 + 32) + 16) = vl_create((uint64_t)_vlTrackCallback, v4, 0, (uint64_t (*)(void, void, void))_vlLogCallback, v4, (unsigned char *)[v7 cStringUsingEncoding:1], 0);
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(_DWORD **)(v5 + 16);
  LODWORD(v4) = *(_DWORD *)(v5 + 48);
  vl_par_version(v4, (uint64_t)__src);
  memcpy(v6, __src, 0x3F0uLL);
  v6[252] = v4;
}

- (BOOL)shouldCacheMetadata
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  dataProvider = self->_dataProvider;
  return [(VLLocalizationDataProvider *)dataProvider shouldCacheMetadata];
}

- (void)setShouldCacheMetadata:(BOOL)a3
{
  BOOL v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    dataProvider = self->_dataProvider;
    [(VLLocalizationDataProvider *)dataProvider setShouldCacheMetadata:v3];
  }
}

- (void)_setAlgorithmVersion:(int)a3
{
  self->_algorithmVersion = a3;
  uint64_t v4 = [(VLLocalizer *)self _vlHandle];
  vl_par_version(a3, (uint64_t)v5);
  memcpy(v4, v5, 0x3F0uLL);
  v4->var1 = a3;
}

- (void)determineAvailabilityAtLocation:(id)a3 callbackQueue:(id)a4 callback:(id)a5
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  long long v6 = *((_OWORD *)a4 + 1);
  v7[0] = *(_OWORD *)a4;
  v7[1] = v6;
  v7[2] = *((_OWORD *)a4 + 2);
  [(VLLocalizer *)self determineAvailabilityAtLocation:v7 purpose:0 callbackQueue:a5 callback:v5];
}

uint64_t __78__VLLocalizer_determineAvailabilityAtLocation_purpose_callbackQueue_callback___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)determineAltitudesAtLocation:(id)a3 callbackQueue:(id)a4 callback:(id)a5
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [v8 coordinate];
  double v12 = v11;
  [v8 coordinate];
  double v14 = v13;
  double v15 = [[_VLLocalizerAltitudeQuery alloc] initWithLocation:v8 callbackQueue:v9 callback:v10];
  if (qword_26AC375D0 != -1) {
    dispatch_once(&qword_26AC375D0, &__block_literal_global_215);
  }
  double v16 = (id)qword_26AC375C8;
  uint64_t v17 = [(_VLLocalizerAltitudeQuery *)v15 signpostID];
  if ((unint64_t)(v17 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v18 = v17;
    if (os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21BAD2000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v18, "QueryAltitude", (const char *)&unk_21BB79E01, buf, 2u);
    }
  }

  if (qword_26AC375D0 != -1)
  {
    dispatch_once(&qword_26AC375D0, &__block_literal_global_215);
    double v19 = (void *)qword_26AC375C8;
    if (!os_log_type_enabled((os_log_t)qword_26AC375C8, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  double v19 = (void *)qword_26AC375C8;
  if (os_log_type_enabled((os_log_t)qword_26AC375C8, OS_LOG_TYPE_DEBUG))
  {
LABEL_8:
    v20 = v19;
    [v8 coordinate];
    uint64_t v22 = v21;
    [v8 coordinate];
    *(_DWORD *)buf = 134218240;
    *(void *)&buf[4] = v22;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v23;
    _os_log_impl(&dword_21BAD2000, v20, OS_LOG_TYPE_DEBUG, "Determining altitudes at location: <%f, %f>", buf, 0x16u);
  }
LABEL_9:
  __double2 v24 = __sincos_stret(v14 * 0.0174532925);
  __double2 v25 = __sincos_stret(v12 * 0.0174532925);
  double v26 = 6378137.0 / sqrt(v25.__sinval * -0.00669437999 * v25.__sinval + 1.0);
  v27.f64[0] = v24.__cosval;
  v27.f64[1] = v24.__sinval;
  altitudeCalculationQueue = self->_altitudeCalculationQueue;
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __67__VLLocalizer_determineAltitudesAtLocation_callbackQueue_callback___block_invoke;
  v34[3] = &unk_2643BA288;
  v34[4] = self;
  id v35 = v8;
  v36 = v15;
  id v37 = v9;
  id v38 = v10;
  *(double *)&long long v29 = v25.__sinval * (v26 * 0.99330562 + 0.0);
  *(float64x2_t *)buf = vmulq_n_f64(v27, v25.__cosval * (v26 + 0.0));
  *(_OWORD *)&uint8_t buf[16] = v29;
  uint64_t v40 = 0;
  uint64_t v41 = 0;
  id v30 = v10;
  id v31 = v9;
  id v32 = v15;
  id v33 = v8;
  [(VLLocalizer *)self determineAvailabilityAtLocation:buf callbackQueue:altitudeCalculationQueue callback:v34];
}

void __67__VLLocalizer_determineAltitudesAtLocation_callbackQueue_callback___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v5 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 72));
  if (v5)
  {
    if (qword_26AC375D0 == -1)
    {
      long long v6 = (void *)qword_26AC375C8;
      if (os_log_type_enabled((os_log_t)qword_26AC375C8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_4;
      }
    }
    else
    {
      dispatch_once(&qword_26AC375D0, &__block_literal_global_215);
      long long v6 = (void *)qword_26AC375C8;
      if (os_log_type_enabled((os_log_t)qword_26AC375C8, OS_LOG_TYPE_ERROR))
      {
LABEL_4:
        id v7 = *(void **)(a1 + 40);
        id v8 = v6;
        [v7 coordinate];
        uint64_t v10 = v9;
        [*(id *)(a1 + 40) coordinate];
        *(_DWORD *)buf = 134218498;
        uint64_t v43 = v10;
        __int16 v44 = 2048;
        uint64_t v45 = v11;
        __int16 v46 = 2112;
        id v47 = v5;
        _os_log_impl(&dword_21BAD2000, v8, OS_LOG_TYPE_ERROR, "Got an error determining availability of tiles at location: <%f, %f>: %@", buf, 0x20u);

        if (qword_26AC375D0 != -1) {
          dispatch_once(&qword_26AC375D0, &__block_literal_global_215);
        }
      }
    }
    double v12 = (id)qword_26AC375C8;
    uint64_t v13 = [*(id *)(a1 + 48) signpostID];
    if ((unint64_t)(v13 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v14 = v13;
      if (os_signpost_enabled(v12))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_21BAD2000, v12, OS_SIGNPOST_INTERVAL_END, v14, "QueryAltitude", (const char *)&unk_21BB79E01, buf, 2u);
      }
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __67__VLLocalizer_determineAltitudesAtLocation_callbackQueue_callback___block_invoke_15;
    block[3] = &unk_2643BA260;
    double v15 = *(NSObject **)(a1 + 56);
    id v41 = *(id *)(a1 + 64);
    id v40 = v5;
    dispatch_async(v15, block);

    goto LABEL_24;
  }
  if (a2)
  {
    uint64_t v16 = *(void *)(a1 + 32);
    uint64_t v18 = *(void *)(v16 + 88);
    uint64_t v17 = (id *)(v16 + 88);
    if (v18)
    {
      double v19 = *(void **)(*(void *)(a1 + 32) + 80);
      if (!v19)
      {
        uint64_t v20 = [MEMORY[0x263EFF980] array];
        uint64_t v21 = *(void *)(a1 + 32);
        uint64_t v22 = *(void **)(v21 + 80);
        *(void *)(v21 + 80) = v20;

        double v19 = *(void **)(*(void *)(a1 + 32) + 80);
      }
      [v19 addObject:*(void *)(a1 + 48)];
    }
    else
    {
      objc_storeStrong(v17, *(id *)(a1 + 48));
      [*(id *)(a1 + 32) _resolveCurrentAltitudeQuery];
    }
    goto LABEL_24;
  }
  if (qword_26AC375D0 == -1)
  {
    uint64_t v23 = (void *)qword_26AC375C8;
    if (os_log_type_enabled((os_log_t)qword_26AC375C8, OS_LOG_TYPE_INFO)) {
      goto LABEL_17;
    }
  }
  else
  {
    dispatch_once(&qword_26AC375D0, &__block_literal_global_215);
    uint64_t v23 = (void *)qword_26AC375C8;
    if (os_log_type_enabled((os_log_t)qword_26AC375C8, OS_LOG_TYPE_INFO))
    {
LABEL_17:
      __double2 v24 = *(void **)(a1 + 40);
      __double2 v25 = v23;
      [v24 coordinate];
      uint64_t v27 = v26;
      [*(id *)(a1 + 40) coordinate];
      *(_DWORD *)buf = 134218240;
      uint64_t v43 = v27;
      __int16 v44 = 2048;
      uint64_t v45 = v28;
      _os_log_impl(&dword_21BAD2000, v25, OS_LOG_TYPE_INFO, "VL is not available at location: <%f, %f>", buf, 0x16u);

      if (qword_26AC375D0 != -1) {
        dispatch_once(&qword_26AC375D0, &__block_literal_global_215);
      }
    }
  }
  long long v29 = (id)qword_26AC375C8;
  uint64_t v30 = [*(id *)(a1 + 48) signpostID];
  if ((unint64_t)(v30 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v31 = v30;
    if (os_signpost_enabled(v29))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21BAD2000, v29, OS_SIGNPOST_INTERVAL_END, v31, "QueryAltitude", (const char *)&unk_21BB79E01, buf, 2u);
    }
  }

  id v32 = [MEMORY[0x263F087E8] errorWithDomain:@"VLAltitudeDataProviderError" code:0 userInfo:0];
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __67__VLLocalizer_determineAltitudesAtLocation_callbackQueue_callback___block_invoke_17;
  v36[3] = &unk_2643BA260;
  id v33 = *(NSObject **)(a1 + 56);
  id v34 = *(id *)(a1 + 64);
  id v37 = v32;
  id v38 = v34;
  id v35 = v32;
  dispatch_async(v33, v36);

LABEL_24:
}

uint64_t __67__VLLocalizer_determineAltitudesAtLocation_callbackQueue_callback___block_invoke_15(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __67__VLLocalizer_determineAltitudesAtLocation_callbackQueue_callback___block_invoke_17(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)_resolveCurrentAltitudeQuery
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  BOOL v3 = self->_currentAltitudeQuery;
  if (v3)
  {
    if (qword_26AC375D0 == -1)
    {
      uint64_t v4 = (void *)qword_26AC375C8;
      if (!os_log_type_enabled((os_log_t)qword_26AC375C8, OS_LOG_TYPE_DEBUG))
      {
LABEL_5:
        uint64_t v22 = 0;
        memset(buf, 0, sizeof(buf));
        uint64_t v11 = [(_VLLocalizerAltitudeQuery *)v3 location];
        VLLocationFromCLLocation(v11, (uint64_t)buf);

        LODWORD(v22) = 1;
        double v12 = [(VLLocalizer *)self _vlHandle];
        altitudeCalculationQueue = self->_altitudeCalculationQueue;
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __43__VLLocalizer__resolveCurrentAltitudeQuery__block_invoke;
        v16[3] = &unk_2643BA2D8;
        v16[4] = self;
        uint64_t v17 = v3;
        long long v18 = *(_OWORD *)buf;
        long long v19 = *(_OWORD *)&buf[16];
        uint64_t v20 = v22;
        v14[0] = *(_OWORD *)buf;
        v14[1] = *(_OWORD *)&buf[16];
        uint64_t v15 = v22;
        _prepareAltitudeQuery((uint64_t)v12, (uint64_t)v14, 0, altitudeCalculationQueue, v16);

        goto LABEL_6;
      }
    }
    else
    {
      dispatch_once(&qword_26AC375D0, &__block_literal_global_215);
      uint64_t v4 = (void *)qword_26AC375C8;
      if (!os_log_type_enabled((os_log_t)qword_26AC375C8, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_5;
      }
    }
    id v5 = v4;
    long long v6 = [(_VLLocalizerAltitudeQuery *)v3 location];
    [v6 coordinate];
    uint64_t v8 = v7;
    uint64_t v9 = [(_VLLocalizerAltitudeQuery *)v3 location];
    [v9 coordinate];
    *(_DWORD *)buf = 134218240;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v10;
    _os_log_impl(&dword_21BAD2000, v5, OS_LOG_TYPE_DEBUG, "Trying to get altitude at location: %f, %f", buf, 0x16u);

    goto LABEL_5;
  }
LABEL_6:
}

void __43__VLLocalizer__resolveCurrentAltitudeQuery__block_invoke(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 72));
  if (qword_26AC375D0 != -1) {
    dispatch_once(&qword_26AC375D0, &__block_literal_global_215);
  }
  v2 = (id)qword_26AC375C8;
  uint64_t v3 = [*(id *)(a1 + 40) signpostID];
  if ((unint64_t)(v3 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v4 = v3;
    if (os_signpost_enabled(v2))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21BAD2000, v2, OS_SIGNPOST_INTERVAL_BEGIN, v4, "CalculateAltitude", (const char *)&unk_21BB79E01, buf, 2u);
    }
  }

  id v5 = *(void **)(a1 + 32);
  long long v6 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)buf = *(_OWORD *)(a1 + 48);
  long long v50 = v6;
  uint64_t v51 = *(void *)(a1 + 80);
  id v52 = 0;
  uint64_t v7 = [v5 _altitudesAtLocation:buf error:&v52];
  id v8 = v52;
  if (qword_26AC375D0 != -1) {
    dispatch_once(&qword_26AC375D0, &__block_literal_global_215);
  }
  uint64_t v9 = (id)qword_26AC375C8;
  uint64_t v10 = [*(id *)(a1 + 40) signpostID];
  if ((unint64_t)(v10 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v11 = v10;
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21BAD2000, v9, OS_SIGNPOST_INTERVAL_END, v11, "CalculateAltitude", (const char *)&unk_21BB79E01, buf, 2u);
    }
  }

  if (qword_26AC375D0 != -1) {
    dispatch_once(&qword_26AC375D0, &__block_literal_global_215);
  }
  double v12 = (id)qword_26AC375C8;
  uint64_t v13 = [*(id *)(a1 + 40) signpostID];
  if ((unint64_t)(v13 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v14 = v13;
    if (os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21BAD2000, v12, OS_SIGNPOST_INTERVAL_END, v14, "QueryAltitude", (const char *)&unk_21BB79E01, buf, 2u);
    }
  }

  uint64_t v15 = [*(id *)(a1 + 40) callbackQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__VLLocalizer__resolveCurrentAltitudeQuery__block_invoke_19;
  block[3] = &unk_2643BA2B0;
  id v46 = *(id *)(a1 + 40);
  id v16 = v7;
  id v47 = v16;
  id v17 = v8;
  id v48 = v17;
  dispatch_async(v15, block);

  uint64_t v18 = [*(id *)(*(void *)(a1 + 32) + 80) count];
  uint64_t v19 = *(void *)(a1 + 32);
  if (v18)
  {
    int v20 = *(_DWORD *)(*(void *)(v19 + 16) + 144);
    id v21 = *(id *)(a1 + 40);
    uint64_t v22 = [v21 location];
    [v22 coordinate];
    uint64_t v23 = [v21 location];

    [v23 coordinate];
    GEOMapPointForCoordinate();
    double v25 = v24;
    double v27 = v26;

    if (![*(id *)(*(void *)(a1 + 32) + 80) count]) {
      goto LABEL_27;
    }
    uint64_t v28 = 0;
    double v29 = (double)(1 << v20) / *(double *)(MEMORY[0x263F41670] + 16);
    unsigned int v30 = vcvtmd_u64_f64(v29 * v25);
    unsigned int v31 = vcvtmd_u64_f64(v29 * v27);
    while (1)
    {
      id v32 = [*(id *)(*(void *)(a1 + 32) + 80) objectAtIndexedSubscript:v28];
      id v33 = [v32 location];
      [v33 coordinate];
      id v34 = [v32 location];

      [v34 coordinate];
      GEOMapPointForCoordinate();
      double v36 = v35;
      double v38 = v37;

      unsigned int v39 = vcvtmd_u64_f64(v29 * v38);
      if (vcvtmd_u64_f64(v29 * v36) == v30 && v39 == v31) {
        break;
      }
      if (++v28 >= (unint64_t)[*(id *)(*(void *)(a1 + 32) + 80) count]) {
        goto LABEL_27;
      }
    }
    if (v28 == 0x7FFFFFFFFFFFFFFFLL) {
LABEL_27:
    }
      uint64_t v28 = 0;
    uint64_t v42 = [*(id *)(*(void *)(a1 + 32) + 80) objectAtIndexedSubscript:v28];
    uint64_t v43 = *(void *)(a1 + 32);
    __int16 v44 = *(void **)(v43 + 88);
    *(void *)(v43 + 88) = v42;

    [*(id *)(*(void *)(a1 + 32) + 80) removeObjectAtIndex:v28];
    [*(id *)(a1 + 32) _resolveCurrentAltitudeQuery];
  }
  else
  {
    id v41 = *(void **)(v19 + 88);
    *(void *)(v19 + 88) = 0;
  }
}

void __43__VLLocalizer__resolveCurrentAltitudeQuery__block_invoke_19(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) callback];
  (*((void (**)(id, void, void))v2 + 2))(v2, *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (id)_altitudesAtLocation:(id *)a3 error:(id *)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  double v6 = a3->var0[0];
  double v7 = a3->var0[1];
  double v8 = a3->var0[2];
  double v9 = sqrt(v7 * v7 + v6 * v6);
  if (v9 >= 0.001)
  {
    double v10 = atan2(a3->var0[2], v9 * 0.996647189);
  }
  else
  {
    double v10 = dbl_21BB7A6E0[v8 < 0.0];
    double v9 = 0.001;
  }
  __double2 v11 = __sincos_stret(v10);
  double v12 = atan2(v7, v6);
  double v13 = atan2(v8 + v11.__sinval * (v11.__sinval * v11.__sinval) * 42841.3115, v9 + v11.__cosval * (v11.__cosval * v11.__cosval) * -42697.6727);
  double v35 = 0;
  int v34 = 0;
  os_signpost_id_t v14 = [(VLLocalizer *)self _vlHandle];
  float v15 = v13;
  float v16 = v12;
  int altitudes = vl_get_altitudes((uint64_t)v14, &v34, &v35, v15, v16);
  if (altitudes)
  {
    int v18 = altitudes;
    if (qword_26AC375D0 == -1)
    {
      uint64_t v19 = qword_26AC375C8;
      if (!os_log_type_enabled((os_log_t)qword_26AC375C8, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_8;
      }
    }
    else
    {
      dispatch_once(&qword_26AC375D0, &__block_literal_global_215);
      uint64_t v19 = qword_26AC375C8;
      if (!os_log_type_enabled((os_log_t)qword_26AC375C8, OS_LOG_TYPE_DEFAULT))
      {
LABEL_8:
        if (!a4) {
          goto LABEL_37;
        }
        if (v18 == 1)
        {
          uint64_t v20 = 1;
          goto LABEL_36;
        }
        if (v18 != 2)
        {
          if (v18 == 3)
          {
            uint64_t v20 = 2;
LABEL_36:
            *a4 = [MEMORY[0x263F087E8] errorWithDomain:@"VLAltitudeDataProviderError" code:v20 userInfo:0];
LABEL_37:
            if (v35) {
              free(v35);
            }
LABEL_39:
            double v24 = 0;
            goto LABEL_40;
          }
          if (qword_26AC375D0 != -1)
          {
            dispatch_once(&qword_26AC375D0, &__block_literal_global_215);
            id v32 = qword_26AC375C8;
            if (!os_log_type_enabled((os_log_t)qword_26AC375C8, OS_LOG_TYPE_ERROR)) {
              goto LABEL_35;
            }
            goto LABEL_34;
          }
          id v32 = qword_26AC375C8;
          if (os_log_type_enabled((os_log_t)qword_26AC375C8, OS_LOG_TYPE_ERROR))
          {
LABEL_34:
            *(_DWORD *)buf = 67109120;
            LODWORD(v37) = v18;
            _os_log_impl(&dword_21BAD2000, v32, OS_LOG_TYPE_ERROR, "Invalid VL status: %d", buf, 8u);
          }
LABEL_35:
          uint64_t v20 = -1;
          goto LABEL_36;
        }
        if (qword_26AC375D0 == -1)
        {
          double v29 = (void *)qword_26AC375C8;
          if (!os_log_type_enabled((os_log_t)qword_26AC375C8, OS_LOG_TYPE_FAULT)) {
            goto LABEL_35;
          }
        }
        else
        {
          dispatch_once(&qword_26AC375D0, &__block_literal_global_215);
          double v29 = (void *)qword_26AC375C8;
          if (!os_log_type_enabled((os_log_t)qword_26AC375C8, OS_LOG_TYPE_FAULT)) {
            goto LABEL_35;
          }
        }
        unsigned int v30 = v29;
        unsigned int v31 = [(VLLocalizer *)self _vlHandle];
        *(_DWORD *)buf = 134217984;
        double v37 = v31;
        _os_log_impl(&dword_21BAD2000, v30, OS_LOG_TYPE_FAULT, "vl_get_altitudes returned error vl_not_init with vlHandle: %p", buf, 0xCu);

        goto LABEL_35;
      }
    }
    *(_DWORD *)buf = 67109120;
    LODWORD(v37) = v18;
    _os_log_impl(&dword_21BAD2000, v19, OS_LOG_TYPE_DEFAULT, "vl_get_altitudes returned status: %d", buf, 8u);
    goto LABEL_8;
  }
  id v21 = (vl_t *)v34;
  uint64_t v22 = v35;
  if (v34 < 1 || !v35)
  {
    if (qword_26AC375D0 == -1)
    {
      uint64_t v28 = qword_26AC375C8;
      if (!os_log_type_enabled((os_log_t)qword_26AC375C8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_24;
      }
    }
    else
    {
      dispatch_once(&qword_26AC375D0, &__block_literal_global_215);
      uint64_t v28 = qword_26AC375C8;
      if (!os_log_type_enabled((os_log_t)qword_26AC375C8, OS_LOG_TYPE_ERROR))
      {
LABEL_24:
        if (v22) {
          free(v22);
        }
        if (a4)
        {
          [MEMORY[0x263F087E8] errorWithDomain:@"VLAltitudeDataProviderError" code:-1 userInfo:0];
          double v24 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_40;
        }
        goto LABEL_39;
      }
    }
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21BAD2000, v28, OS_LOG_TYPE_ERROR, "Received <= 0 altitudes", buf, 2u);
    goto LABEL_24;
  }
  if (qword_26AC375D0 == -1)
  {
    uint64_t v23 = qword_26AC375C8;
    if (!os_log_type_enabled((os_log_t)qword_26AC375C8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  dispatch_once(&qword_26AC375D0, &__block_literal_global_215);
  uint64_t v23 = qword_26AC375C8;
  if (os_log_type_enabled((os_log_t)qword_26AC375C8, OS_LOG_TYPE_DEFAULT))
  {
LABEL_17:
    *(_DWORD *)buf = 134349056;
    double v37 = v21;
    _os_log_impl(&dword_21BAD2000, v23, OS_LOG_TYPE_DEFAULT, "vl_get_altitudes returned %{public}llu altitudes", buf, 0xCu);
  }
LABEL_18:
  double v24 = [MEMORY[0x263EFF980] arrayWithCapacity:v21];
  double v26 = 0;
  do
  {
    LODWORD(v25) = *((_DWORD *)v22 + (void)v26);
    double v27 = [NSNumber numberWithFloat:v25];
    [v24 addObject:v27];

    double v26 = (vl_t *)((char *)v26 + 1);
  }
  while (v21 != v26);
  free(v22);
LABEL_40:
  return v24;
}

- (id)_fileURLForTile:(const vl_tile_t *)a3 error:(id *)a4
{
  vl_tile_t v12 = *a3;
  double v6 = -[VLLocalizationDataProvider fileURLForKey:error:](self->_dataProvider, "fileURLForKey:error:", &v12);
  if (!v6)
  {
    double v6 = [(VLLocalizationDataProvider *)self->_backupDataProvider fileURLForKey:&v12 error:a4];
    if (!v6) {
      goto LABEL_7;
    }
  }
  double v7 = [MEMORY[0x263F08850] defaultManager];
  double v8 = [v6 path];
  char v9 = [v7 fileExistsAtPath:v8];

  if (v9)
  {
    id v10 = v6;
    double v6 = v10;
    goto LABEL_8;
  }
  if (a4)
  {
    [MEMORY[0x263F087E8] errorWithDomain:@"VLLocalizationDataProviderErrorDomain" code:2 userInfo:0];
    id v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_7:
    id v10 = 0;
  }
LABEL_8:

  return v10;
}

- (void)prepareWithLocation:(id)a3
{
  os_signpost_id_t v4 = v3;
  uint64_t v37 = *MEMORY[0x263EF8340];
  if (([(id)objc_opt_class() isVisualLocalizationSupported] & 1) == 0)
  {
    if (qword_26AC375D0 == -1)
    {
      double v26 = qword_26AC375C8;
      if (!os_log_type_enabled((os_log_t)qword_26AC375C8, OS_LOG_TYPE_INFO)) {
        return;
      }
    }
    else
    {
      dispatch_once(&qword_26AC375D0, &__block_literal_global_215);
      double v26 = qword_26AC375C8;
      if (!os_log_type_enabled((os_log_t)qword_26AC375C8, OS_LOG_TYPE_INFO)) {
        return;
      }
    }
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21BAD2000, v26, OS_LOG_TYPE_INFO, "prepareWithLocation: Visual localization is not supported on this device", buf, 2u);
    return;
  }
  if (qword_26AC375D0 == -1)
  {
    if (!os_log_type_enabled((os_log_t)qword_26AC375C8, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_25;
    }
  }
  else
  {
    dispatch_once(&qword_26AC375D0, &__block_literal_global_215);
    if (!os_log_type_enabled((os_log_t)qword_26AC375C8, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_25;
    }
  }
  long double v6 = v4->f64[1];
  float64x2_t __x = *v4;
  double v7 = sqrt(vmlad_n_f64(vmuld_lane_f64(v6, *v4, 1), __x.f64[0], __x.f64[0]));
  double v8 = v7 * 0.99330562;
  double v9 = 0.0;
  double v10 = 1.57079633;
  if (v7 * 0.99330562 != 0.0)
  {
    unsigned int v11 = 0;
    long double __y = v4[1].f64[0];
    double v10 = 0.0;
    double v12 = 0.0;
    while (1)
    {
      double v13 = v10;
      double v10 = atan2(__y, v8);
      __double2 v14 = __sincos_stret(v10);
      double v15 = 6378137.0 / sqrt(v14.__sinval * -0.00669437999 * v14.__sinval + 1.0);
      double v9 = v7 / v14.__cosval - v15;
      if (vabdd_f64(v13, v10) >= 0.000001)
      {
        if (v11 > 8)
        {
          id v17 = qword_26AC375C8;
          if (os_log_type_enabled((os_log_t)qword_26AC375C8, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_23;
          }
          goto LABEL_25;
        }
      }
      else if (vabdd_f64(v12, v9) < 0.001 || v11 >= 9)
      {
        id v17 = qword_26AC375C8;
        if (os_log_type_enabled((os_log_t)qword_26AC375C8, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_23;
        }
        goto LABEL_25;
      }
      ++v11;
      double v8 = v7 * (v15 / (v15 + v9) * -0.00669437999 + 1.0);
      double v12 = v7 / v14.__cosval - v15;
      if (v8 == 0.0)
      {
        double v10 = 1.57079633;
        break;
      }
    }
  }
  id v17 = qword_26AC375C8;
  if (os_log_type_enabled((os_log_t)qword_26AC375C8, OS_LOG_TYPE_DEBUG))
  {
LABEL_23:
    long double v18 = atan2(v6, __x.f64[0]);
    *(_DWORD *)buf = 134284801;
    float64x2_t v19 = *v4;
    float64_t v20 = v4[1].f64[0];
    *(double *)&uint8_t buf[4] = v10 / 0.0174532925;
    *(_WORD *)&buf[12] = 2049;
    *(double *)&buf[14] = v18 / 0.0174532925;
    *(_WORD *)&buf[22] = 2049;
    double v31 = v9;
    *(_WORD *)id v32 = 2049;
    *(float64_t *)&v32[2] = v19.f64[0];
    __int16 v33 = 2049;
    float64_t v34 = v19.f64[1];
    __int16 v35 = 2049;
    float64_t v36 = v20;
    _os_log_impl(&dword_21BAD2000, v17, OS_LOG_TYPE_DEBUG, "prepare: (%{private}f, %{private}f, %{private}.2f) / ECEF: (%{private}f, %{private}f, %{private}f)", buf, 0x3Eu);
    if (qword_26AC375D0 != -1) {
      dispatch_once(&qword_26AC375D0, &__block_literal_global_215);
    }
  }
LABEL_25:
  id v21 = (id)qword_26AC375C8;
  uint64_t v22 = v21;
  os_signpost_id_t signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21BAD2000, v22, OS_SIGNPOST_EVENT, signpostID, "Update", (const char *)&unk_21BB79E01, buf, 2u);
  }

  *(void *)id v32 = 0;
  *(float64x2_t *)buf = *v4;
  *(float64_t *)&uint8_t buf[16] = v4[1].f64[0];
  *(float *)&unsigned int v24 = v4[2].f64[0];
  *(void *)&double v31 = v24;
  vl_update((uint64_t)[(VLLocalizer *)self _vlHandle], (uint64_t)buf);
}

- (void)prepareWithDeviceLocation:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (([(id)objc_opt_class() isVisualLocalizationSupported] & 1) == 0)
  {
    if (qword_26AC375D0 == -1)
    {
      float64_t v20 = qword_26AC375C8;
      if (!os_log_type_enabled((os_log_t)qword_26AC375C8, OS_LOG_TYPE_INFO)) {
        goto LABEL_17;
      }
    }
    else
    {
      dispatch_once(&qword_26AC375D0, &__block_literal_global_215);
      float64_t v20 = qword_26AC375C8;
      if (!os_log_type_enabled((os_log_t)qword_26AC375C8, OS_LOG_TYPE_INFO)) {
        goto LABEL_17;
      }
    }
    LOWORD(v22[0]) = 0;
    _os_log_impl(&dword_21BAD2000, v20, OS_LOG_TYPE_INFO, "prepareWithLocation: Visual localization is not supported on this device", (uint8_t *)v22, 2u);
    goto LABEL_17;
  }
  if (qword_26AC375D0 == -1)
  {
    if (!os_log_type_enabled((os_log_t)qword_26AC375C8, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_9;
    }
  }
  else
  {
    dispatch_once(&qword_26AC375D0, &__block_literal_global_215);
    if (!os_log_type_enabled((os_log_t)qword_26AC375C8, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_9;
    }
  }
  [v4 coordinate];
  double v6 = v5;
  [v4 coordinate];
  double v8 = v7;
  [v4 altitude];
  double v10 = v9;
  __double2 v11 = __sincos_stret(v6 * 0.0174532925);
  __double2 v12 = __sincos_stret(v8 * 0.0174532925);
  if (qword_26AC375D0 == -1)
  {
    double v13 = qword_26AC375C8;
    if (os_log_type_enabled((os_log_t)qword_26AC375C8, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_7;
    }
  }
  else
  {
    dispatch_once(&qword_26AC375D0, &__block_literal_global_215);
    double v13 = qword_26AC375C8;
    if (os_log_type_enabled((os_log_t)qword_26AC375C8, OS_LOG_TYPE_DEBUG))
    {
LABEL_7:
      double v14 = 6378137.0 / sqrt(v11.__sinval * -0.00669437999 * v11.__sinval + 1.0);
      double v15 = v11.__cosval * (v10 + v14);
      LODWORD(v22[0]) = 134284801;
      *(double *)((char *)v22 + 4) = v6;
      WORD6(v22[0]) = 2049;
      *(double *)((char *)v22 + 14) = v8;
      WORD3(v22[1]) = 2049;
      *((double *)&v22[1] + 1) = v10;
      *(_WORD *)uint64_t v23 = 2049;
      *(double *)&v23[2] = v12.__cosval * v15;
      __int16 v24 = 2049;
      double v25 = v12.__sinval * v15;
      __int16 v26 = 2049;
      double v27 = v11.__sinval * (v10 + v14 * 0.99330562);
      _os_log_impl(&dword_21BAD2000, v13, OS_LOG_TYPE_DEBUG, "prepare: (%{private}f, %{private}f, %{private}.2f) / ECEF: (%{private}f, %{private}f, %{private}f)", (uint8_t *)v22, 0x3Eu);
      if (qword_26AC375D0 != -1) {
        dispatch_once(&qword_26AC375D0, &__block_literal_global_215);
      }
    }
  }
LABEL_9:
  float v16 = (id)qword_26AC375C8;
  id v17 = v16;
  os_signpost_id_t signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    LOWORD(v22[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_21BAD2000, v17, OS_SIGNPOST_EVENT, signpostID, "Update", (const char *)&unk_21BB79E01, (uint8_t *)v22, 2u);
  }

  *(void *)uint64_t v23 = 0;
  memset(v22, 0, sizeof(v22));
  VLLocationFromCLLocation(v4, (uint64_t)v22);
  vl_update((uint64_t)[(VLLocalizer *)self _vlHandle], (uint64_t)v22);
LABEL_17:
}

- (id)locateWithPixelBuffer:(double)a3 timestamp:(double)a4 location:(double)a5 gravity:(__n128)a6 transform:(__n128)a7 cameraIntrinsics:(__n128)a8 radialDistortion:(double)a9 error:(uint64_t)a10
{
  double v19 = a2;
  uint64_t v35 = *MEMORY[0x263EF8340];
  long long v23 = *a14;
  long long v22 = a14[1];
  if (qword_26AC375B0 != -1)
  {
    __n128 v31 = a7;
    __n128 v32 = a8;
    __n128 v30 = a6;
    long long v27 = *a14;
    long long v28 = a14[1];
    dispatch_once(&qword_26AC375B0, &__block_literal_global_22);
    long long v23 = v27;
    long long v22 = v28;
    double v19 = a2;
    a6 = v30;
    a7 = v31;
    a8 = v32;
  }
  long long v24 = a13[1];
  v34[0] = *a13;
  v34[1] = v24;
  v34[2] = a13[2];
  v33[0] = v23;
  v33[1] = v22;
  double v25 = objc_msgSend(a1, "locateWithPixelBuffer:location:heading:gravity:transform:cameraIntrinsics:radialDistortion:timestamp:error:", a11, v34, v33, a15, -1.0, -1.0, v19, *(_OWORD *)&a6, *(_OWORD *)&a7, *(_OWORD *)&a8, *(void *)&a9, *(double *)&qword_26AC375A8 * (double)a12);
  return v25;
}

double __114__VLLocalizer_locateWithPixelBuffer_timestamp_location_gravity_transform_cameraIntrinsics_radialDistortion_error___block_invoke()
{
  mach_timebase_info info = 0;
  if (!mach_timebase_info(&info))
  {
    LODWORD(result) = info.numer;
    LODWORD(v1) = info.denom;
    double result = (double)*(unint64_t *)&result / (double)v1 / 1000000000.0;
    qword_26AC375A8 = *(void *)&result;
  }
  return result;
}

- (id)locateWithPixelBuffer:(double)a3 timestamp:(uint64_t)a4 location:(uint64_t)a5 heading:(unint64_t)a6 gravity:(_OWORD *)a7 transform:(long long *)a8 cameraIntrinsics:(uint64_t)a9 radialDistortion:(uint64_t)a10 error:(__int128)a11
{
  long long v22 = a12;
  long long v21 = a13;
  long long v23 = a11;
  uint64_t v33 = *MEMORY[0x263EF8340];
  long long v25 = *a8;
  long long v24 = a8[1];
  if (qword_26AC375C0 != -1)
  {
    long long v30 = a8[1];
    long long v29 = *a8;
    dispatch_once(&qword_26AC375C0, &__block_literal_global_24);
    long long v25 = v29;
    long long v24 = v30;
    long long v23 = a11;
    long long v22 = a12;
    long long v21 = a13;
  }
  long long v26 = a7[1];
  v32[0] = *a7;
  v32[1] = v26;
  v32[2] = a7[2];
  v31[0] = v25;
  v31[1] = v24;
  long long v27 = objc_msgSend(a1, "locateWithPixelBuffer:location:heading:gravity:transform:cameraIntrinsics:radialDistortion:timestamp:error:", a5, v32, v31, a9, a2, a3, v23, v22, v21, a14, *(double *)&qword_26AC375B8 * (double)a6);
  return v27;
}

double __122__VLLocalizer_locateWithPixelBuffer_timestamp_location_heading_gravity_transform_cameraIntrinsics_radialDistortion_error___block_invoke()
{
  mach_timebase_info info = 0;
  if (!mach_timebase_info(&info))
  {
    LODWORD(result) = info.numer;
    LODWORD(v1) = info.denom;
    double result = (double)*(unint64_t *)&result / (double)v1 / 1000000000.0;
    qword_26AC375B8 = *(void *)&result;
  }
  return result;
}

- (id)locateWithPixelBuffer:(double)a3 location:(double)a4 heading:(double)a5 gravity:(double)a6 transform:(double)a7 cameraIntrinsics:(uint64_t)a8 radialDistortion:(uint64_t)a9 timestamp:(float64x2_t *)a10 error:(long long *)a11
{
  uint64_t v25 = a18;
  float64x2_t v26 = *a10;
  long double v27 = a10->f64[1];
  double v28 = sqrt(vmlad_n_f64(vmuld_lane_f64(v27, *a10, 1), v26.f64[0], v26.f64[0]));
  double v29 = v28 * 0.99330562;
  double v30 = 0.0;
  double v31 = 1.57079633;
  long long v51 = a11[1];
  long long v52 = *a11;
  if (v28 * 0.99330562 != 0.0)
  {
    double v48 = a10->f64[1];
    float64x2_t v49 = *a10;
    double v50 = a3;
    unsigned int v32 = 0;
    long double __y = a10[1].f64[0];
    double v31 = 0.0;
    double v33 = 0.0;
    do
    {
      double v35 = v31;
      double v31 = atan2(__y, v29);
      __double2 v36 = __sincos_stret(v31);
      double v37 = 6378137.0 / sqrt(v36.__sinval * -0.00669437999 * v36.__sinval + 1.0);
      double v30 = v28 / v36.__cosval - v37;
      if (vabdd_f64(v35, v31) < 0.000001)
      {
        if (vabdd_f64(v33, v30) < 0.001 || v32 >= 9)
        {
LABEL_10:
          a3 = v50;
          uint64_t v25 = a18;
          v26.f64[0] = v49.f64[0];
          long double v27 = v48;
          goto LABEL_12;
        }
      }
      else if (v32 > 8)
      {
        goto LABEL_10;
      }
      ++v32;
      double v29 = v28 * (v37 / (v37 + v30) * -0.00669437999 + 1.0);
      double v33 = v28 / v36.__cosval - v37;
    }
    while (v29 != 0.0);
    a3 = v50;
    uint64_t v25 = a18;
    v26.f64[0] = v49.f64[0];
    double v31 = 1.57079633;
    long double v27 = v48;
  }
LABEL_12:
  long double v38 = atan2(v27, v26.f64[0]) / 0.0174532925;
  double v39 = v31 / 0.0174532925;
  id v40 = objc_alloc((Class)getCLLocationClass());
  double v41 = a10[2].f64[0];
  uint64_t v42 = [MEMORY[0x263EFF910] date];
  uint64_t v43 = objc_msgSend(v40, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v42, v39, (double)v38, v30, v41, 0.0);

  long long v68 = 0u;
  memset(v69, 0, 28);
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v61 = 0u;
  if (v43) {
    [v43 clientLocation];
  }
  LODWORD(v67) = 1;
  id v44 = objc_alloc((Class)getCLLocationClass());
  v59[6] = v67;
  v59[7] = v68;
  v60[0] = v69[0];
  *(_OWORD *)((char *)v60 + 12) = *(_OWORD *)((char *)v69 + 12);
  v59[2] = v63;
  v59[3] = v64;
  v59[4] = v65;
  v59[5] = v66;
  v59[0] = v61;
  v59[1] = v62;
  uint64_t v45 = (void *)[v44 initWithClientLocation:v59];

  v58[0] = v52;
  v58[1] = v51;
  id v46 = objc_msgSend(a1, "locateWithPixelBuffer:deviceLocation:heading:gravity:transform:cameraIntrinsics:radialDistortion:exposureTargetOffset:timestamp:error:", a9, v45, v58, a12, a2, a3, a4, a5, a6, a7, a15, a16, a17, v25, 0xBFF0000000000000, a19);

  return v46;
}

- (id)locateWithPixelBuffer:(uint64_t)a3 deviceLocation:(uint64_t)a4 heading:(_OWORD *)a5 gravity:(uint64_t)a6 transform:(uint64_t)a7 cameraIntrinsics:(uint64_t)a8 radialDistortion:(__int128)a9 ambientLightIntensity:(__int128)a10 timestamp:(__int128)a11 error:(uint64_t)a12
{
  long long v14 = a5[1];
  v17[0] = *a5;
  v17[1] = v14;
  double v15 = objc_msgSend(a1, "locateWithPixelBuffer:deviceLocation:heading:gravity:transform:cameraIntrinsics:radialDistortion:exposureTargetOffset:timestamp:error:", a3, a4, v17, a9, a10, a11, a12, a13, a14);
  return v15;
}

- (id)locateWithPixelBuffer:(uint64_t)a3 deviceLocation:(uint64_t)a4 heading:(_OWORD *)a5 gravity:(uint64_t)a6 transform:(uint64_t)a7 cameraIntrinsics:(uint64_t)a8 radialDistortion:(__int128)a9 exposureTargetOffset:(__int128)a10 timestamp:(__int128)a11 error:(uint64_t)a12
{
  long long v14 = a5[1];
  v17[0] = *a5;
  v17[1] = v14;
  double v15 = [a1 _locateWithPixelBuffer:a3 deviceLocation:a4 heading:v17 gravity:&__block_literal_global_28 transform:a6 cameraIntrinsics:a9 radialDistortion:a10 exposureTargetOffset:a11 timestamp:a12 calculationBlock:a13 error:a14];
  return v15;
}

uint64_t __149__VLLocalizer_locateWithPixelBuffer_deviceLocation_heading_gravity_transform_cameraIntrinsics_radialDistortion_exposureTargetOffset_timestamp_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, long long *a4, uint64_t a5)
{
  return vl_locate(a2, a3, a4, a5);
}

- (VLLocalizationResult)_locateWithPixelBuffer:(float64_t)a3 deviceLocation:(int8x16_t)a4 heading:(int8x16_t)a5 gravity:(int32x4_t)a6 transform:(int8x16_t)a7 cameraIntrinsics:(uint64_t)a8 radialDistortion:(void *)a9 exposureTargetOffset:(void *)a10 timestamp:(float64x2_t *)a11 calculationBlock:(void *)a12 error:(unint64_t)a13
{
  uint64_t v23 = a21;
  double v24 = a22;
  v276[2] = *MEMORY[0x263EF8340];
  float64x2_t v147 = *a11;
  float64x2_t v148 = a11[1];
  id v25 = a10;
  v159 = a12;
  if (qword_26AC375D0 != -1) {
    dispatch_once(&qword_26AC375D0, &__block_literal_global_215);
  }
  float64x2_t v26 = (id)qword_26AC375C8;
  BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG);

  if (v27)
  {
    [v25 coordinate];
    double v29 = v28;
    [v25 coordinate];
    double v31 = v30;
    [v25 altitude];
    double v33 = v32;
    __double2 v34 = __sincos_stret(v29 * 0.0174532925);
    __double2 v35 = __sincos_stret(v31 * 0.0174532925);
    if (qword_26AC375D0 == -1)
    {
      __double2 v36 = (id)qword_26AC375C8;
      if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
LABEL_7:

        double v24 = a22;
        uint64_t v23 = a21;
        goto LABEL_8;
      }
    }
    else
    {
      dispatch_once(&qword_26AC375D0, &__block_literal_global_215);
      __double2 v36 = (id)qword_26AC375C8;
      if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_7;
      }
    }
    double v37 = 6378137.0 / sqrt(v34.__sinval * -0.00669437999 * v34.__sinval + 1.0);
    double v38 = v34.__cosval * (v33 + v37);
    *(_DWORD *)buf = 134285057;
    *(double *)&uint8_t buf[4] = v29;
    *(_WORD *)&buf[12] = 2049;
    *(double *)&buf[14] = v31;
    *(_WORD *)&buf[22] = 2049;
    *(double *)&unsigned char buf[24] = v33;
    *(_WORD *)&uint8_t buf[32] = 2049;
    *(double *)&buf[34] = v35.__cosval * v38;
    *(_WORD *)&buf[42] = 2049;
    *(double *)&buf[44] = v35.__sinval * v38;
    *(_WORD *)&buf[52] = 2049;
    *(double *)&buf[54] = v34.__sinval * (v33 + v37 * 0.99330562);
    *(_WORD *)&buf[62] = 2050;
    *(double *)&long long v242 = a22;
    _os_log_impl(&dword_21BAD2000, v36, OS_LOG_TYPE_DEBUG, "locate: (%{private}f, %{private}f, %{private}.2f) / ECEF: (%{private}f, %{private}f, %{private}f) @ %{public}.2f", buf, 0x48u);
    goto LABEL_7;
  }
LABEL_8:
  GEOGetMonotonicTime();
  double v40 = v39;
  uint64_t v218 = 0;
  long long v217 = 0u;
  long long v216 = 0u;
  VLLocationFromCLLocation(v25, (uint64_t)&v216);
  uint64_t v161 = [(id)qword_26AC37598 copy];
  if ([(id)objc_opt_class() isVisualLocalizationSupported])
  {
    if (*(unsigned char *)(a1 + 64))
    {
      char v146 = 1;
      if (qword_26AC375D0 == -1) {
        goto LABEL_11;
      }
    }
    else
    {
      char BOOL = GEOConfigGetBOOL();
      if (v161) {
        char v62 = 1;
      }
      else {
        char v62 = BOOL;
      }
      char v146 = v62;
      if (qword_26AC375D0 == -1)
      {
LABEL_11:
        double v41 = (id)qword_26AC375C8;
        os_signpost_id_t spid = os_signpost_id_make_with_pointer(v41, a9);

        if (qword_26AC375D0 != -1) {
          dispatch_once(&qword_26AC375D0, &__block_literal_global_215);
        }
        uint64_t v42 = (id)qword_26AC375C8;
        uint64_t v43 = v42;
        unint64_t v144 = spid - 1;
        if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
        {
          uint64_t v44 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 134217984;
          *(void *)&uint8_t buf[4] = v44;
          _os_signpost_emit_with_name_impl(&dword_21BAD2000, v43, OS_SIGNPOST_INTERVAL_BEGIN, spid, "Locate", "parent_signpost=%llu", buf, 0xCu);
        }

        unint64_t v210 = 0;
        BaseAddress = 0;
        uint64_t v211 = 0;
        signed int PixelFormatType = CVPixelBufferGetPixelFormatType((CVPixelBufferRef)a9);
        unsigned int v46 = PixelFormatType;
        if (PixelFormatType <= 1278226487)
        {
          if (PixelFormatType != 875704422 && PixelFormatType != 875704438)
          {
LABEL_44:
            if (qword_26AC375D0 == -1)
            {
              long long v65 = (id)qword_26AC375C8;
              if (!os_log_type_enabled(v65, OS_LOG_TYPE_INFO)) {
                goto LABEL_47;
              }
            }
            else
            {
              dispatch_once(&qword_26AC375D0, &__block_literal_global_215);
              long long v65 = (id)qword_26AC375C8;
              if (!os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
              {
LABEL_47:

                if (qword_26AC375D0 == -1)
                {
                  long long v66 = (id)qword_26AC375C8;
                  if (v144 > 0xFFFFFFFFFFFFFFFDLL) {
                    goto LABEL_51;
                  }
                }
                else
                {
                  dispatch_once(&qword_26AC375D0, &__block_literal_global_215);
                  long long v66 = (id)qword_26AC375C8;
                  if (v144 > 0xFFFFFFFFFFFFFFFDLL) {
                    goto LABEL_51;
                  }
                }
                if (os_signpost_enabled(v66))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_21BAD2000, v66, OS_SIGNPOST_INTERVAL_BEGIN, spid, "ConvertImage", (const char *)&unk_21BB79E01, buf, 2u);
                }
LABEL_51:

                *(void *)&long long v170 = 0;
                *((void *)&v170 + 1) = &v170;
                *(void *)&long long v171 = 0x2050000000;
                long long v67 = (void *)qword_26AC375F8;
                *((void *)&v171 + 1) = qword_26AC375F8;
                if (!qword_26AC375F8)
                {
                  *(void *)buf = MEMORY[0x263EF8330];
                  *(void *)&uint8_t buf[8] = 3221225472;
                  *(void *)&uint8_t buf[16] = __getCIImageClass_block_invoke_0;
                  *(void *)&unsigned char buf[24] = &unk_2643B9F00;
                  *(void *)&uint8_t buf[32] = &v170;
                  __getCIImageClass_block_invoke_0((uint64_t)buf);
                  long long v67 = *(void **)(*((void *)&v170 + 1) + 24);
                }
                long long v68 = v67;
                _Block_object_dispose(&v170, 8);
                v69 = (void *)[[v68 alloc] initWithCVPixelBuffer:a9];
                [v69 extent];
                double v71 = v70;
                [v69 extent];
                double v73 = v72;
                unint64_t v74 = (unint64_t)v71;
                pixelBufferOut[0] = 0;
                uint64_t v272 = *MEMORY[0x263F040C8];
                v75 = [NSNumber numberWithUnsignedLong:(unint64_t)v71];
                v273 = v75;
                v76 = [NSDictionary dictionaryWithObjects:&v273 forKeys:&v272 count:1];

                if (!CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (unint64_t)v71, (unint64_t)v73, 0x4C303038u, (CFDictionaryRef)v76, pixelBufferOut)&& CVPixelBufferGetBytesPerRow(pixelBufferOut[0]) == v74)
                {
                  *(void *)&long long v170 = 0;
                  *((void *)&v170 + 1) = &v170;
                  *(void *)&long long v171 = 0x2050000000;
                  v77 = (void *)qword_26AC37608;
                  *((void *)&v171 + 1) = qword_26AC37608;
                  if (!qword_26AC37608)
                  {
                    *(void *)buf = MEMORY[0x263EF8330];
                    *(void *)&uint8_t buf[8] = 3221225472;
                    *(void *)&uint8_t buf[16] = __getCIContextClass_block_invoke_0;
                    *(void *)&unsigned char buf[24] = &unk_2643B9F00;
                    *(void *)&uint8_t buf[32] = &v170;
                    __getCIContextClass_block_invoke_0((uint64_t)buf);
                    v77 = *(void **)(*((void *)&v170 + 1) + 24);
                  }
                  id v78 = v77;
                  _Block_object_dispose(&v170, 8);
                  v79 = [v78 context];
                  [v79 render:v69 toCVPixelBuffer:pixelBufferOut[0]];

                  CVPixelBufferLockBaseAddress(pixelBufferOut[0], 1uLL);
                  BaseAddress = CVPixelBufferGetBaseAddress(pixelBufferOut[0]);
                  unint64_t v210 = __PAIR64__((unint64_t)v73, v74);
                  LODWORD(v211) = 0;
                  v202[0] = MEMORY[0x263EF8330];
                  v202[1] = 3221225472;
                  v202[2] = __167__VLLocalizer__locateWithPixelBuffer_deviceLocation_heading_gravity_transform_cameraIntrinsics_radialDistortion_exposureTargetOffset_timestamp_calculationBlock_error___block_invoke_2_41;
                  v202[3] = &__block_descriptor_40_e5_v8__0l;
                  v202[4] = pixelBufferOut[0];
                  v60 = (void (**)(void))MEMORY[0x21D499960](v202);
                  if (qword_26AC375D0 == -1)
                  {
                    v80 = (id)qword_26AC375C8;
                    if (!os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG)) {
                      goto LABEL_60;
                    }
                  }
                  else
                  {
                    dispatch_once(&qword_26AC375D0, &__block_literal_global_215);
                    v80 = (id)qword_26AC375C8;
                    if (!os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
                    {
LABEL_60:

                      if (qword_26AC375D0 == -1)
                      {
                        v81 = (id)qword_26AC375C8;
                        if (v144 <= 0xFFFFFFFFFFFFFFFDLL) {
                          goto LABEL_62;
                        }
                      }
                      else
                      {
                        dispatch_once(&qword_26AC375D0, &__block_literal_global_215);
                        v81 = (id)qword_26AC375C8;
                        if (v144 <= 0xFFFFFFFFFFFFFFFDLL)
                        {
LABEL_62:
                          if (os_signpost_enabled(v81))
                          {
                            *(_WORD *)buf = 0;
                            _os_signpost_emit_with_name_impl(&dword_21BAD2000, v81, OS_SIGNPOST_INTERVAL_END, spid, "ConvertImage", (const char *)&unk_21BB79E01, buf, 2u);
                          }
                        }
                      }

LABEL_65:
                      int v189 = 0;
                      pixelBufferOut[0] = (CVPixelBufferRef)vzip1_s32(*(int32x2_t *)a17.i8, *(int32x2_t *)a18.i8);
                      pixelBufferOut[1] = (CVPixelBufferRef)__PAIR64__(a17.u32[1], a19);
                      pixelBufferOut[2] = (CVPixelBufferRef)vzip2_s32(*(int32x2_t *)a18.i8, *(int32x2_t *)&a19);
                      pixelBufferOut[3] = (CVPixelBufferRef)vzip1_s32((int32x2_t)*(_OWORD *)&vextq_s8(a17, a17, 8uLL), (int32x2_t)*(_OWORD *)&vextq_s8(a18, a18, 8uLL));
                      int v187 = DWORD2(a19);
                      uint64_t v188 = a20;
                      long long v190 = v216;
                      long long v191 = v217;
                      uint64_t v192 = v218;
                      double v193 = v24;
                      v82.f64[0] = a2;
                      v82.f64[1] = a3;
                      float32x4_t v194 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v82), v147);
                      *(float *)v82.f64 = v148.f64[0];
                      int v195 = LODWORD(v82.f64[0]);
                      int32x2_t v196 = vzip1_s32(*(int32x2_t *)a4.i8, *(int32x2_t *)a5.i8);
                      unint64_t v197 = __PAIR64__(a4.u32[1], a6.u32[0]);
                      int32x2_t v198 = vzip2_s32(*(int32x2_t *)a5.i8, *(int32x2_t *)a6.i8);
                      int32x2_t v199 = vzip1_s32((int32x2_t)*(_OWORD *)&vextq_s8(a4, a4, 8uLL), (int32x2_t)*(_OWORD *)&vextq_s8(a5, a5, 8uLL));
                      int8x16_t v200 = vextq_s8((int8x16_t)vuzp1q_s32(a6, a6), a7, 0xCuLL);
                      int v201 = -1;
                      uint64_t v83 = [(id)a1 _vlHandle];
                      uint64_t v185 = 0;
                      long long v183 = 0u;
                      long long v184 = 0u;
                      long long v181 = 0u;
                      long long v182 = 0u;
                      long long v179 = 0u;
                      long long v180 = 0u;
                      long long v177 = 0u;
                      long long v178 = 0u;
                      long long v175 = 0u;
                      long long v176 = 0u;
                      long long v173 = 0u;
                      long long v174 = 0u;
                      long long v171 = 0u;
                      long long v172 = 0u;
                      long long v170 = 0u;
                      uint64_t v84 = v159[2](v159, v83, &BaseAddress, pixelBufferOut, &v170);
                      v60[2](v60);
                      uint64_t v269 = 0;
                      long long v268 = 0u;
                      long long v267 = 0u;
                      long long v266 = 0u;
                      long long v265 = 0u;
                      long long v264 = 0u;
                      long long v263 = 0u;
                      long long v262 = 0u;
                      long long v261 = 0u;
                      long long v260 = 0u;
                      long long v259 = 0u;
                      long long v258 = 0u;
                      long long v257 = 0u;
                      long long v256 = 0u;
                      long long v255 = 0u;
                      long long v254 = 0u;
                      long long v253 = 0u;
                      long long v252 = 0u;
                      long long v251 = 0u;
                      long long v250 = 0u;
                      long long v249 = 0u;
                      long long v248 = 0u;
                      long long v247 = 0u;
                      long long v246 = 0u;
                      long long v245 = 0u;
                      long long v244 = 0u;
                      long long v243 = 0u;
                      long long v242 = 0u;
                      memset(buf, 0, sizeof(buf));
                      vl_stats_get(v83, (void **)buf);
                      if (v84 == 1)
                      {
                        v85 = [VLLocalizationDebugInfo alloc];
                        GEOGetMonotonicTime();
                        *(_OWORD *)v228 = v216;
                        *(_OWORD *)&v228[16] = v217;
                        *(void *)v229 = v218;
                        v169[0] = v147;
                        v169[1] = v148;
                        LOBYTE(v143) = v146;
                        v87 = -[VLLocalizationDebugInfo initWithPixelBuffer:monotonicTimestamp:timestamp:duration:location:clLocation:heading:gravity:transform:cameraIntrinsics:radialDistortion:exposureTargetOffset:statistics:resultStatus:resultPose:preserveImageData:](v85, "initWithPixelBuffer:monotonicTimestamp:timestamp:duration:location:clLocation:heading:gravity:transform:cameraIntrinsics:radialDistortion:exposureTargetOffset:statistics:resultStatus:resultPose:preserveImageData:", a9, v228, v25, v169, buf, 1, v40, v24, v86 - v40, a2, a3, *(_OWORD *)&a4, *(_OWORD *)&a5, *(_OWORD *)&a6, *(_OWORD *)&a7,
                                *(_OWORD *)&a17,
                                *(_OWORD *)&a18,
                                a19,
                                a20,
                                v23,
                                &v170,
                                v143);
                        v56 = [[VLLocalizationResult alloc] initWithTimestamp:&v170 pose:v87 debugInfo:v24];
                        if (qword_26AC375D0 == -1)
                        {
                          if (!os_log_type_enabled((os_log_t)qword_26AC375C8, OS_LOG_TYPE_INFO)) {
                            goto LABEL_122;
                          }
                        }
                        else
                        {
                          dispatch_once(&qword_26AC375D0, &__block_literal_global_215);
                          if (!os_log_type_enabled((os_log_t)qword_26AC375C8, OS_LOG_TYPE_INFO)) {
                            goto LABEL_122;
                          }
                        }
                        [v25 coordinate];
                        [v25 coordinate];
                        if (v56)
                        {
                          [(VLLocalizationResult *)v56 location];
                          long double __ya = *(double *)&v239;
                          float64x2_t v88 = v238;
                        }
                        else
                        {
                          float64x2_t v88 = 0uLL;
                          long long v240 = 0u;
                          long long v239 = 0u;
                          float64x2_t v238 = 0u;
                          long double __ya = 0.0;
                        }
                        long double v111 = v88.f64[1];
                        double v112 = sqrt(vmlad_n_f64(vmuld_lane_f64(v88.f64[1], v88, 1), v88.f64[0], v88.f64[0]));
                        double v113 = v112 * 0.99330562;
                        double v114 = 0.0;
                        double v115 = 1.57079633;
                        if (v112 * 0.99330562 != 0.0)
                        {
                          double v150 = v88.f64[1];
                          float64_t v152 = v88.f64[0];
                          unsigned int v116 = 0;
                          double v115 = 0.0;
                          double v117 = 0.0;
                          do
                          {
                            double v119 = v115;
                            double v115 = atan2(__ya, v113);
                            __double2 v120 = __sincos_stret(v115);
                            double v121 = 6378137.0 / sqrt(v120.__sinval * -0.00669437999 * v120.__sinval + 1.0);
                            double v114 = v112 / v120.__cosval - v121;
                            if (vabdd_f64(v119, v115) < 0.000001)
                            {
                              if (vabdd_f64(v117, v114) < 0.001 || v116 >= 9)
                              {
LABEL_106:
                                v88.f64[0] = v152;
                                long double v111 = v150;
                                goto LABEL_115;
                              }
                            }
                            else if (v116 > 8)
                            {
                              goto LABEL_106;
                            }
                            ++v116;
                            double v113 = v112 * (v121 / (v121 + v114) * -0.00669437999 + 1.0);
                            double v117 = v112 / v120.__cosval - v121;
                          }
                          while (v113 != 0.0);
                          v88.f64[0] = v152;
                          long double v111 = v150;
                          double v115 = 1.57079633;
                        }
LABEL_115:
                        double v122 = atan2(v111, v88.f64[0]) / 0.0174532925;
                        double v123 = v115 / 0.0174532925;
                        GEOCalculateDistance();
                        uint64_t v125 = v124;
                        if (qword_26AC375D0 == -1)
                        {
                          v126 = (id)qword_26AC375C8;
                          if (!os_log_type_enabled(v126, OS_LOG_TYPE_INFO)) {
                            goto LABEL_121;
                          }
                        }
                        else
                        {
                          dispatch_once(&qword_26AC375D0, &__block_literal_global_215);
                          v126 = (id)qword_26AC375C8;
                          if (!os_log_type_enabled(v126, OS_LOG_TYPE_INFO)) {
                            goto LABEL_121;
                          }
                        }
                        if (v56)
                        {
                          [(VLLocalizationResult *)v56 location];
                          uint64_t v127 = v225;
                          [(VLLocalizationResult *)v56 location];
                          uint64_t v128 = *((void *)&v222 + 1);
                          [(VLLocalizationResult *)v56 location];
                          uint64_t v129 = v220;
                        }
                        else
                        {
                          uint64_t v128 = 0;
                          uint64_t v127 = 0;
                          long long v227 = 0u;
                          long long v226 = 0u;
                          long long v225 = 0u;
                          long long v222 = 0u;
                          long long v223 = 0u;
                          long long v224 = 0u;
                          long long v219 = 0u;
                          long long v220 = 0u;
                          uint64_t v129 = 0;
                          long long v221 = 0u;
                        }
                        *(_DWORD *)v228 = 134285313;
                        *(double *)&v228[4] = v123;
                        *(_WORD *)&v228[12] = 2049;
                        *(double *)&v228[14] = v122;
                        *(_WORD *)&v228[22] = 2049;
                        *(double *)&v228[24] = v114;
                        *(_WORD *)v229 = 2049;
                        *(void *)&v229[2] = v127;
                        __int16 v230 = 2049;
                        uint64_t v231 = v128;
                        __int16 v232 = 2049;
                        uint64_t v233 = v129;
                        __int16 v234 = 2050;
                        uint64_t v235 = v125;
                        __int16 v236 = 2048;
                        double v237 = v24;
                        _os_log_impl(&dword_21BAD2000, v126, OS_LOG_TYPE_INFO, "locate result: (%{private}f, %{private}f, %{private}.2f) / ECEF: (%{private}f, %{private}f, %{private}f) -- Correction: %{public}.1f meters @ %.2f", v228, 0x52u);
LABEL_121:

                        if (qword_26AC375D0 != -1)
                        {
                          dispatch_once(&qword_26AC375D0, &__block_literal_global_215);
                          v130 = (id)qword_26AC375C8;
                          if (v144 <= 0xFFFFFFFFFFFFFFFDLL)
                          {
LABEL_123:
                            if (os_signpost_enabled(v130))
                            {
                              uint64_t v131 = *(void *)(a1 + 40);
                              *(_DWORD *)v228 = 134217984;
                              *(void *)&v228[4] = v131;
                              _os_signpost_emit_with_name_impl(&dword_21BAD2000, v130, OS_SIGNPOST_INTERVAL_END, spid, "Locate", "parent_signpost=%llu", v228, 0xCu);
                            }
                          }
LABEL_125:

                          if (!v161)
                          {
LABEL_188:

                            goto LABEL_189;
                          }
                          v132 = *(NSObject **)(a1 + 56);
                          v166[0] = MEMORY[0x263EF8330];
                          v166[1] = 3221225472;
                          v166[2] = __167__VLLocalizer__locateWithPixelBuffer_deviceLocation_heading_gravity_transform_cameraIntrinsics_radialDistortion_exposureTargetOffset_timestamp_calculationBlock_error___block_invoke_43;
                          v166[3] = &unk_2643BA260;
                          v133 = &v168;
                          id v168 = (id)v161;
                          v134 = (id *)&v167;
                          v87 = v87;
                          v167 = v87;
                          dispatch_async(v132, v166);
LABEL_187:

                          goto LABEL_188;
                        }
LABEL_122:
                        v130 = (id)qword_26AC375C8;
                        if (v144 <= 0xFFFFFFFFFFFFFFFDLL) {
                          goto LABEL_123;
                        }
                        goto LABEL_125;
                      }
                      if (qword_26AC375D0 == -1)
                      {
                        v102 = (id)qword_26AC375C8;
                        if (!os_log_type_enabled(v102, OS_LOG_TYPE_INFO)) {
                          goto LABEL_84;
                        }
                      }
                      else
                      {
                        dispatch_once(&qword_26AC375D0, &__block_literal_global_215);
                        v102 = (id)qword_26AC375C8;
                        if (!os_log_type_enabled(v102, OS_LOG_TYPE_INFO))
                        {
LABEL_84:

                          if (qword_26AC375D0 == -1)
                          {
                            v103 = (id)qword_26AC375C8;
                            if (v144 > 0xFFFFFFFFFFFFFFFDLL) {
                              goto LABEL_88;
                            }
                          }
                          else
                          {
                            dispatch_once(&qword_26AC375D0, &__block_literal_global_215);
                            v103 = (id)qword_26AC375C8;
                            if (v144 > 0xFFFFFFFFFFFFFFFDLL) {
                              goto LABEL_88;
                            }
                          }
                          if (os_signpost_enabled(v103))
                          {
                            uint64_t v104 = *(void *)(a1 + 40);
                            *(_DWORD *)v228 = 134217984;
                            *(void *)&v228[4] = v104;
                            _os_signpost_emit_with_name_impl(&dword_21BAD2000, v103, OS_SIGNPOST_INTERVAL_END, spid, "Locate", "parent_signpost=%llu", v228, 0xCu);
                          }
LABEL_88:

                          if (!(a13 | v161))
                          {
                            v56 = 0;
LABEL_189:

                            goto LABEL_190;
                          }
                          v105 = [VLLocalizationDebugInfo alloc];
                          GEOGetMonotonicTime();
                          uint64_t v107 = v84;
                          *(_OWORD *)v228 = v216;
                          *(_OWORD *)&v228[16] = v217;
                          *(void *)v229 = v218;
                          v165[0] = v147;
                          v165[1] = v148;
                          LOBYTE(v143) = v146;
                          v108 = -[VLLocalizationDebugInfo initWithPixelBuffer:monotonicTimestamp:timestamp:duration:location:clLocation:heading:gravity:transform:cameraIntrinsics:radialDistortion:exposureTargetOffset:statistics:resultStatus:resultPose:preserveImageData:](v105, "initWithPixelBuffer:monotonicTimestamp:timestamp:duration:location:clLocation:heading:gravity:transform:cameraIntrinsics:radialDistortion:exposureTargetOffset:statistics:resultStatus:resultPose:preserveImageData:", a9, v228, v25, v165, buf, v84, v40, v24, v106 - v40, a2, a3, *(_OWORD *)&a4, *(_OWORD *)&a5, *(_OWORD *)&a6, *(_OWORD *)&a7,
                                   *(_OWORD *)&a17,
                                   *(_OWORD *)&a18,
                                   a19,
                                   a20,
                                   v23,
                                   0,
                                   v143);
                          v87 = v108;
                          if (!a13) {
                            goto LABEL_185;
                          }
                          v109 = (void *)MEMORY[0x263F087E8];
                          if (v108)
                          {
                            __yb = (void *)MEMORY[0x263F087E8];
                            if ((int)v84 <= 1023)
                            {
                              v110 = (void *)a13;
                              if ((int)v84 <= 63)
                              {
                                switch((int)v84)
                                {
                                  case 2:
                                    goto LABEL_170;
                                  case 4:
                                  case 8:
                                    uint64_t v107 = 100;
                                    break;
                                  case 16:
                                    uint64_t v107 = 101;
                                    break;
                                  case 32:
                                    uint64_t v107 = 200;
                                    break;
                                  default:
                                    goto LABEL_164;
                                }
                                goto LABEL_170;
                              }
                              if ((int)v84 > 255)
                              {
                                if (v84 == 256)
                                {
                                  uint64_t v107 = 203;
                                  goto LABEL_170;
                                }
                                if (v84 == 512)
                                {
                                  uint64_t v107 = 204;
                                  goto LABEL_170;
                                }
                              }
                              else
                              {
                                if (v84 == 64)
                                {
                                  uint64_t v107 = 201;
                                  goto LABEL_170;
                                }
                                if (v84 == 128)
                                {
                                  uint64_t v107 = 202;
                                  goto LABEL_170;
                                }
                              }
                            }
                            else
                            {
                              if ((int)v84 >= 0x2000)
                              {
                                v110 = (void *)a13;
                                switch((int)v84)
                                {
                                  case 16384:
                                    uint64_t v107 = 400;
                                    break;
                                  case 16385:
                                    uint64_t v107 = 401;
                                    break;
                                  case 16386:
                                    uint64_t v107 = 402;
                                    break;
                                  case 16387:
                                    uint64_t v107 = 403;
                                    break;
                                  case 16388:
                                    uint64_t v107 = 404;
                                    break;
                                  default:
                                    if (v84 == 0x2000)
                                    {
                                      uint64_t v107 = 207;
                                    }
                                    else
                                    {
                                      if (v84 != 0x8000) {
                                        goto LABEL_164;
                                      }
                                      uint64_t v107 = 405;
                                    }
                                    break;
                                }
                                goto LABEL_170;
                              }
                              v110 = (void *)a13;
                              switch(v84)
                              {
                                case 0x400:
                                  uint64_t v107 = 205;
                                  goto LABEL_170;
                                case 0x800:
                                  uint64_t v107 = 300;
                                  goto LABEL_170;
                                case 0x1000:
                                  uint64_t v107 = 206;
LABEL_170:
                                  v276[0] = @"UnderlyingVLStatus";
                                  v135 = NSNumber;
                                  v136 = v108;
                                  v137 = [v135 numberWithUnsignedInt:v84];
                                  a13 = (unint64_t)v110;
                                  v276[1] = @"VLLocalizerDebugInfo";
                                  *(void *)v228 = v137;
                                  *(void *)&v228[8] = v136;
                                  v138 = [NSDictionary dictionaryWithObjects:v228 forKeys:v276 count:2];
                                  uint64_t v139 = [__yb errorWithDomain:@"VLLocalizerError" code:v107 userInfo:v138];
LABEL_184:
                                  v140 = (void *)v139;

                                  *(void *)a13 = v140;
LABEL_185:
                                  if (!v161)
                                  {
                                    v56 = 0;
                                    goto LABEL_188;
                                  }
                                  v141 = *(NSObject **)(a1 + 56);
                                  v162[0] = MEMORY[0x263EF8330];
                                  v162[1] = 3221225472;
                                  v162[2] = __167__VLLocalizer__locateWithPixelBuffer_deviceLocation_heading_gravity_transform_cameraIntrinsics_radialDistortion_exposureTargetOffset_timestamp_calculationBlock_error___block_invoke_44;
                                  v162[3] = &unk_2643BA260;
                                  v133 = &v164;
                                  id v164 = (id)v161;
                                  v134 = (id *)&v163;
                                  v87 = v87;
                                  v163 = v87;
                                  dispatch_async(v141, v162);
                                  v56 = 0;
                                  goto LABEL_187;
                              }
                            }
LABEL_164:
                            uint64_t v107 = 1000;
                            goto LABEL_170;
                          }
                          if ((int)v84 <= 1023)
                          {
                            if ((int)v84 <= 63)
                            {
                              switch((int)v84)
                              {
                                case 2:
                                  goto LABEL_183;
                                case 4:
                                case 8:
                                  uint64_t v107 = 100;
                                  break;
                                case 16:
                                  uint64_t v107 = 101;
                                  break;
                                case 32:
                                  uint64_t v107 = 200;
                                  break;
                                default:
                                  goto LABEL_177;
                              }
                              goto LABEL_183;
                            }
                            if ((int)v84 > 255)
                            {
                              if (v84 == 256)
                              {
                                uint64_t v107 = 203;
                                goto LABEL_183;
                              }
                              if (v84 == 512)
                              {
                                uint64_t v107 = 204;
                                goto LABEL_183;
                              }
                            }
                            else
                            {
                              if (v84 == 64)
                              {
                                uint64_t v107 = 201;
                                goto LABEL_183;
                              }
                              if (v84 == 128)
                              {
                                uint64_t v107 = 202;
                                goto LABEL_183;
                              }
                            }
                          }
                          else
                          {
                            if ((int)v84 >= 0x2000)
                            {
                              switch((int)v84)
                              {
                                case 16384:
                                  uint64_t v107 = 400;
                                  break;
                                case 16385:
                                  uint64_t v107 = 401;
                                  break;
                                case 16386:
                                  uint64_t v107 = 402;
                                  break;
                                case 16387:
                                  uint64_t v107 = 403;
                                  break;
                                case 16388:
                                  uint64_t v107 = 404;
                                  break;
                                default:
                                  if (v84 == 0x2000)
                                  {
                                    uint64_t v107 = 207;
                                  }
                                  else
                                  {
                                    if (v84 != 0x8000) {
                                      goto LABEL_177;
                                    }
                                    uint64_t v107 = 405;
                                  }
                                  break;
                              }
                              goto LABEL_183;
                            }
                            switch(v84)
                            {
                              case 0x400:
                                uint64_t v107 = 205;
                                goto LABEL_183;
                              case 0x800:
                                uint64_t v107 = 300;
                                goto LABEL_183;
                              case 0x1000:
                                uint64_t v107 = 206;
LABEL_183:
                                v276[0] = @"UnderlyingVLStatus";
                                v137 = [NSNumber numberWithUnsignedInt:v84];
                                *(void *)v228 = v137;
                                v138 = [NSDictionary dictionaryWithObjects:v228 forKeys:v276 count:1];
                                uint64_t v139 = [v109 errorWithDomain:@"VLLocalizerError" code:v107 userInfo:v138];
                                goto LABEL_184;
                            }
                          }
LABEL_177:
                          uint64_t v107 = 1000;
                          goto LABEL_183;
                        }
                      }
                      *(_DWORD *)v228 = 134349312;
                      *(void *)&v228[4] = v84;
                      *(_WORD *)&v228[12] = 2048;
                      *(double *)&v228[14] = v24;
                      _os_log_impl(&dword_21BAD2000, v102, OS_LOG_TYPE_INFO, "locate failed: %{public}llu @ %.2f", v228, 0x16u);
                      goto LABEL_84;
                    }
                  }
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_21BAD2000, v80, OS_LOG_TYPE_DEBUG, "Successfully converted image to grayscale", buf, 2u);
                  goto LABEL_60;
                }
                if (CVPixelBufferGetBytesPerRow(pixelBufferOut[0]) != v74)
                {
                  if (qword_26AC375D0 != -1)
                  {
                    dispatch_once(&qword_26AC375D0, &__block_literal_global_215);
                    v89 = (void *)qword_26AC375C8;
                    if (!os_log_type_enabled((os_log_t)qword_26AC375C8, OS_LOG_TYPE_FAULT)) {
                      goto LABEL_74;
                    }
                    goto LABEL_73;
                  }
                  v89 = (void *)qword_26AC375C8;
                  if (os_log_type_enabled((os_log_t)qword_26AC375C8, OS_LOG_TYPE_FAULT))
                  {
LABEL_73:
                    v90 = (void *)a13;
                    CVPixelBufferRef v91 = pixelBufferOut[0];
                    v92 = v89;
                    v93 = v91;
                    a13 = (unint64_t)v90;
                    size_t BytesPerRow = CVPixelBufferGetBytesPerRow(v93);
                    *(_DWORD *)buf = 134349312;
                    *(void *)&uint8_t buf[4] = BytesPerRow;
                    *(_WORD *)&buf[12] = 2050;
                    *(void *)&buf[14] = (unint64_t)v71;
                    _os_log_impl(&dword_21BAD2000, v92, OS_LOG_TYPE_FAULT, "Image conversion failed to produce desired stride: %{public}zu vs %{public}zu", buf, 0x16u);
                  }
                }
LABEL_74:
                if (a13 | v161)
                {
                  v95 = [VLLocalizationDebugInfo alloc];
                  GEOGetMonotonicTime();
                  *(_OWORD *)buf = v216;
                  *(_OWORD *)&uint8_t buf[16] = v217;
                  *(void *)&uint8_t buf[32] = v218;
                  v206[0] = v147;
                  v206[1] = v148;
                  LOBYTE(v143) = v146;
                  v97 = -[VLLocalizationDebugInfo initWithPixelBuffer:monotonicTimestamp:timestamp:duration:location:clLocation:heading:gravity:transform:cameraIntrinsics:radialDistortion:exposureTargetOffset:statistics:resultStatus:resultPose:preserveImageData:](v95, "initWithPixelBuffer:monotonicTimestamp:timestamp:duration:location:clLocation:heading:gravity:transform:cameraIntrinsics:radialDistortion:exposureTargetOffset:statistics:resultStatus:resultPose:preserveImageData:", a9, buf, v25, v206, 0, 0, v40, v24, v96 - v40, a2, a3, *(_OWORD *)&a4, *(_OWORD *)&a5, *(_OWORD *)&a6, *(_OWORD *)&a7,
                          *(_OWORD *)&a17,
                          *(_OWORD *)&a18,
                          a19,
                          a20,
                          v23,
                          0,
                          v143);
                  v98 = (void *)MEMORY[0x263F087E8];
                  v270[0] = *MEMORY[0x263EFFC40];
                  v270[1] = @"VLLocalizerDebugInfo";
                  v271[0] = @"Failed to convert image format";
                  v271[1] = v97;
                  v99 = [NSDictionary dictionaryWithObjects:v271 forKeys:v270 count:2];
                  v100 = [v98 errorWithDomain:@"VLLocalizerError" code:2 userInfo:v99];

                  if (a13) {
                    *(void *)a13 = v100;
                  }
                  if (v161)
                  {
                    v101 = *(NSObject **)(a1 + 56);
                    v203[0] = MEMORY[0x263EF8330];
                    v203[1] = 3221225472;
                    v203[2] = __167__VLLocalizer__locateWithPixelBuffer_deviceLocation_heading_gravity_transform_cameraIntrinsics_radialDistortion_exposureTargetOffset_timestamp_calculationBlock_error___block_invoke_40;
                    v203[3] = &unk_2643BA260;
                    id v205 = (id)v161;
                    v204 = v97;
                    dispatch_async(v101, v203);
                  }
                }

                v56 = 0;
                v60 = (void (**)(void))&__block_literal_global_36;
                goto LABEL_189;
              }
            }
            *(_DWORD *)buf = 67109888;
            *(_DWORD *)&uint8_t buf[4] = HIBYTE(v46);
            *(_WORD *)&uint8_t buf[8] = 1024;
            *(_DWORD *)&buf[10] = BYTE2(v46);
            *(_WORD *)&buf[14] = 1024;
            *(_DWORD *)&uint8_t buf[16] = BYTE1(v46);
            *(_WORD *)&buf[20] = 1024;
            *(_DWORD *)&buf[22] = v46;
            _os_log_impl(&dword_21BAD2000, v65, OS_LOG_TYPE_INFO, "Input pixel format (%c%c%c%c) requires conversion", buf, 0x1Au);
            goto LABEL_47;
          }
        }
        else
        {
          if (PixelFormatType == 1278226488)
          {
            CVPixelBufferLockBaseAddress((CVPixelBufferRef)a9, 1uLL);
            size_t Width = CVPixelBufferGetWidth((CVPixelBufferRef)a9);
            unsigned int Height = CVPixelBufferGetHeight((CVPixelBufferRef)a9);
            if (CVPixelBufferGetBytesPerRow((CVPixelBufferRef)a9) == Width)
            {
              BaseAddress = CVPixelBufferGetBaseAddress((CVPixelBufferRef)a9);
              unint64_t v210 = __PAIR64__(Height, Width);
              LODWORD(v211) = 0;
              v207[0] = MEMORY[0x263EF8330];
              v207[1] = 3221225472;
              v207[2] = __167__VLLocalizer__locateWithPixelBuffer_deviceLocation_heading_gravity_transform_cameraIntrinsics_radialDistortion_exposureTargetOffset_timestamp_calculationBlock_error___block_invoke_3;
              v207[3] = &__block_descriptor_40_e5_v8__0l;
              v207[4] = a9;
              uint64_t v59 = MEMORY[0x21D499960](v207);
              goto LABEL_35;
            }
LABEL_43:
            CVPixelBufferUnlockBaseAddress((CVPixelBufferRef)a9, 1uLL);
            goto LABEL_44;
          }
          if (PixelFormatType != 2033463856 && PixelFormatType != 1714696752) {
            goto LABEL_44;
          }
        }
        CVPixelBufferLockBaseAddress((CVPixelBufferRef)a9, 1uLL);
        size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane((CVPixelBufferRef)a9, 0);
        unsigned int HeightOfPlane = CVPixelBufferGetHeightOfPlane((CVPixelBufferRef)a9, 0);
        if (CVPixelBufferGetBytesPerRowOfPlane((CVPixelBufferRef)a9, 0) == WidthOfPlane)
        {
          BaseAddress = CVPixelBufferGetBaseAddressOfPlane((CVPixelBufferRef)a9, 0);
          unint64_t v210 = __PAIR64__(HeightOfPlane, WidthOfPlane);
          LODWORD(v211) = 0;
          v208[0] = MEMORY[0x263EF8330];
          v208[1] = 3221225472;
          v208[2] = __167__VLLocalizer__locateWithPixelBuffer_deviceLocation_heading_gravity_transform_cameraIntrinsics_radialDistortion_exposureTargetOffset_timestamp_calculationBlock_error___block_invoke_2;
          v208[3] = &__block_descriptor_40_e5_v8__0l;
          v208[4] = a9;
          uint64_t v59 = MEMORY[0x21D499960](v208);
LABEL_35:
          v60 = (void (**)(void))v59;
          goto LABEL_65;
        }
        goto LABEL_43;
      }
    }
    dispatch_once(&qword_26AC375D0, &__block_literal_global_215);
    goto LABEL_11;
  }
  if (qword_26AC375D0 != -1)
  {
    dispatch_once(&qword_26AC375D0, &__block_literal_global_215);
    uint64_t v47 = v161;
    double v48 = qword_26AC375C8;
    if (!os_log_type_enabled((os_log_t)qword_26AC375C8, OS_LOG_TYPE_INFO)) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  uint64_t v47 = v161;
  double v48 = qword_26AC375C8;
  if (os_log_type_enabled((os_log_t)qword_26AC375C8, OS_LOG_TYPE_INFO))
  {
LABEL_23:
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21BAD2000, v48, OS_LOG_TYPE_INFO, "locateWithPixelBuffer: Visual localization is not supported on this device", buf, 2u);
  }
LABEL_24:
  if (!(a13 | v47))
  {
    v56 = 0;
    goto LABEL_191;
  }
  float64x2_t v49 = [VLLocalizationDebugInfo alloc];
  GEOGetMonotonicTime();
  *(_OWORD *)buf = v216;
  *(_OWORD *)&uint8_t buf[16] = v217;
  *(void *)&uint8_t buf[32] = v218;
  v215[0] = v147;
  v215[1] = v148;
  LOBYTE(v143) = 0;
  long long v51 = -[VLLocalizationDebugInfo initWithPixelBuffer:monotonicTimestamp:timestamp:duration:location:clLocation:heading:gravity:transform:cameraIntrinsics:radialDistortion:exposureTargetOffset:statistics:resultStatus:resultPose:preserveImageData:](v49, "initWithPixelBuffer:monotonicTimestamp:timestamp:duration:location:clLocation:heading:gravity:transform:cameraIntrinsics:radialDistortion:exposureTargetOffset:statistics:resultStatus:resultPose:preserveImageData:", 0, buf, v25, v215, 0, 0, v40, v24, v50 - v40, a2, a3, *(_OWORD *)&a4, *(_OWORD *)&a5, *(_OWORD *)&a6, *(_OWORD *)&a7, *(_OWORD *)&a17,
          *(_OWORD *)&a18,
          a19,
          a20,
          v23,
          0,
          v143);
  long long v52 = (void *)MEMORY[0x263F087E8];
  v274[0] = *MEMORY[0x263EFFC40];
  v274[1] = @"VLLocalizerDebugInfo";
  v275[0] = @"Not supported";
  v275[1] = v51;
  v53 = [NSDictionary dictionaryWithObjects:v275 forKeys:v274 count:2];
  v54 = [v52 errorWithDomain:@"VLLocalizerError" code:1 userInfo:v53];

  if (a13) {
    *(void *)a13 = v54;
  }
  if (v161)
  {
    v55 = *(NSObject **)(a1 + 56);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __167__VLLocalizer__locateWithPixelBuffer_deviceLocation_heading_gravity_transform_cameraIntrinsics_radialDistortion_exposureTargetOffset_timestamp_calculationBlock_error___block_invoke;
    block[3] = &unk_2643BA260;
    id v214 = (id)v161;
    v213 = v51;
    dispatch_async(v55, block);
  }
  v56 = 0;
LABEL_190:
  uint64_t v47 = v161;
LABEL_191:

  return v56;
}

uint64_t __167__VLLocalizer__locateWithPixelBuffer_deviceLocation_heading_gravity_transform_cameraIntrinsics_radialDistortion_exposureTargetOffset_timestamp_calculationBlock_error___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __167__VLLocalizer__locateWithPixelBuffer_deviceLocation_heading_gravity_transform_cameraIntrinsics_radialDistortion_exposureTargetOffset_timestamp_calculationBlock_error___block_invoke_2(uint64_t a1)
{
  return CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(a1 + 32), 1uLL);
}

uint64_t __167__VLLocalizer__locateWithPixelBuffer_deviceLocation_heading_gravity_transform_cameraIntrinsics_radialDistortion_exposureTargetOffset_timestamp_calculationBlock_error___block_invoke_3(uint64_t a1)
{
  return CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(a1 + 32), 1uLL);
}

uint64_t __167__VLLocalizer__locateWithPixelBuffer_deviceLocation_heading_gravity_transform_cameraIntrinsics_radialDistortion_exposureTargetOffset_timestamp_calculationBlock_error___block_invoke_40(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __167__VLLocalizer__locateWithPixelBuffer_deviceLocation_heading_gravity_transform_cameraIntrinsics_radialDistortion_exposureTargetOffset_timestamp_calculationBlock_error___block_invoke_2_41(uint64_t a1)
{
  CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(a1 + 32), 1uLL);
  id v2 = *(__CVBuffer **)(a1 + 32);
  CVPixelBufferRelease(v2);
}

uint64_t __167__VLLocalizer__locateWithPixelBuffer_deviceLocation_heading_gravity_transform_cameraIntrinsics_radialDistortion_exposureTargetOffset_timestamp_calculationBlock_error___block_invoke_43(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __167__VLLocalizer__locateWithPixelBuffer_deviceLocation_heading_gravity_transform_cameraIntrinsics_radialDistortion_exposureTargetOffset_timestamp_calculationBlock_error___block_invoke_44(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_deterministicLocateWithPixelBuffer:(double)a3 deviceLocation:(__n128)a4 heading:(__n128)a5 gravity:(__n128)a6 transform:(__n128)a7 cameraIntrinsics:(uint64_t)a8 radialDistortion:(uint64_t)a9 exposureTargetOffset:(void *)a10 timestamp:(long long *)a11 completionHandler:(void *)a12
{
  long long v32 = *a11;
  long long v31 = a11[1];
  id v25 = a10;
  id v26 = a12;
  qos_class_t v27 = qos_class_self();
  double v28 = dispatch_get_global_queue(v27, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __175__VLLocalizer__deterministicLocateWithPixelBuffer_deviceLocation_heading_gravity_transform_cameraIntrinsics_radialDistortion_exposureTargetOffset_timestamp_completionHandler___block_invoke;
  block[3] = &unk_2643BA320;
  uint64_t v47 = a1;
  id v48 = v25;
  double v51 = a2;
  double v52 = a3;
  long long v38 = v32;
  long long v39 = v31;
  __n128 v40 = a4;
  __n128 v41 = a5;
  __n128 v42 = a6;
  __n128 v43 = a7;
  long long v44 = a15;
  long long v45 = a16;
  long long v46 = a17;
  uint64_t v53 = a18;
  uint64_t v54 = a19;
  uint64_t v55 = a20;
  id v49 = v26;
  uint64_t v50 = a9;
  id v29 = v26;
  id v30 = v25;
  dispatch_async(v28, block);
}

void __175__VLLocalizer__deterministicLocateWithPixelBuffer_deviceLocation_heading_gravity_transform_cameraIntrinsics_radialDistortion_exposureTargetOffset_timestamp_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 200);
  uint64_t v3 = *(void **)(a1 + 176);
  uint64_t v4 = *(void *)(a1 + 184);
  long long v5 = *(_OWORD *)(a1 + 32);
  long long v6 = *(_OWORD *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 224);
  uint64_t v8 = *(void *)(a1 + 232);
  uint64_t v9 = *(void *)(a1 + 240);
  id v15 = 0;
  double v10 = *(double *)(a1 + 208);
  double v11 = *(double *)(a1 + 216);
  v14[0] = v5;
  v14[1] = v6;
  objc_msgSend(v3, "_locateWithPixelBuffer:deviceLocation:heading:gravity:transform:cameraIntrinsics:radialDistortion:exposureTargetOffset:timestamp:calculationBlock:error:", v2, v4, v14, &__block_literal_global_47, &v15, v10, v11, *(double *)(a1 + 64), *(double *)(a1 + 80), *(double *)(a1 + 96), *(double *)(a1 + 112), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144), *(void *)(a1 + 152), *(void *)(a1 + 160),
    *(void *)(a1 + 168),
    v7,
    v8,
  __double2 v12 = v9);
  id v13 = v15;
  (*(void (**)(void))(*(void *)(a1 + 192) + 16))();
}

uint64_t __175__VLLocalizer__deterministicLocateWithPixelBuffer_deviceLocation_heading_gravity_transform_cameraIntrinsics_radialDistortion_exposureTargetOffset_timestamp_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  long long v9 = *(_OWORD *)(a4 + 64);
  v11[0] = *(_OWORD *)(a4 + 48);
  v11[1] = v9;
  uint64_t v12 = *(void *)(a4 + 80);
  while (vl_update(a2, (uint64_t)v11))
    ;
  return vl_locate(a2, a3, (long long *)a4, a5);
}

- (void)dataProvider:(id)a3 didChangeFormatVersion:(unsigned int)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (vl_argo_support_data_ver == a4)
  {
    uint64_t v5 = 0;
    goto LABEL_13;
  }
  if (dword_267C60C50 == a4)
  {
    uint64_t v5 = 1;
    goto LABEL_13;
  }
  if (dword_267C60C54 == a4)
  {
    uint64_t v5 = 2;
    goto LABEL_13;
  }
  if (dword_267C60C58 == a4)
  {
    uint64_t v5 = 3;
    goto LABEL_13;
  }
  if (dword_267C60C5C == a4)
  {
    uint64_t v5 = 4;
    goto LABEL_13;
  }
  if (dword_267C60C60 == a4)
  {
    uint64_t v5 = 5;
LABEL_13:
    int v6 = vl_argo_support_algorithm_ver[v5];
    if (qword_26AC375D0 == -1) {
      goto LABEL_14;
    }
LABEL_18:
    dispatch_once(&qword_26AC375D0, &__block_literal_global_215);
    uint64_t v7 = qword_26AC375C8;
    if (!os_log_type_enabled((os_log_t)qword_26AC375C8, OS_LOG_TYPE_INFO)) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  int v6 = -1;
  if (qword_26AC375D0 != -1) {
    goto LABEL_18;
  }
LABEL_14:
  uint64_t v7 = qword_26AC375C8;
  if (os_log_type_enabled((os_log_t)qword_26AC375C8, OS_LOG_TYPE_INFO))
  {
LABEL_15:
    v9[0] = 67109120;
    v9[1] = v6;
    _os_log_impl(&dword_21BAD2000, v7, OS_LOG_TYPE_INFO, "Setting algorithm version: %i", (uint8_t *)v9, 8u);
  }
LABEL_16:
  self->_algorithmVersion = v6;
  uint64_t v8 = [(VLLocalizer *)self _vlHandle];
  vl_par_version(v6, (uint64_t)v9);
  memcpy(v8, v9, 0x3F0uLL);
  v8->var1 = v6;
}

- (int)_algorithmVersion
{
  return self->_debug_algorithmVersion;
}

- (BOOL)_debugInfoShouldPreserveImageData
{
  return self->_debugInfoShouldPreserveImageData;
}

- (void)_setDebugInfoShouldPreserveImageData:(BOOL)a3
{
  self->_debugInfoShouldPreserveImageData = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentAltitudeQuery, 0);
  objc_storeStrong((id *)&self->_pendingAltitudeQueries, 0);
  objc_storeStrong((id *)&self->_altitudeCalculationQueue, 0);
  objc_storeStrong((id *)&self->_recorderQueue, 0);
  objc_storeStrong((id *)&self->_backupDataProvider, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
}

@end