@interface RMFacePoseCaptureSession
- (BOOL)allowBuiltInMetadataCameras;
- (BOOL)allowBuiltInVideoCameras;
- (BOOL)allowExternalVideoCameras;
- (BOOL)configureCaptureSession;
- (BOOL)isCameraPaused;
- (NSMutableArray)captureContext;
- (OS_dispatch_queue)captureQueue;
- (RMFacePoseCaptureSession)init;
- (RMFacePoseCaptureSessionDelegate)delegate;
- (double)defaultFieldOfView;
- (double)networkFailureThresholdMultiplier;
- (double)trackingFailureFieldOfViewModifier;
- (id)chooseBestFormatForFaceKit:(id)a3 forCameraID:(unint64_t)a4;
- (id)computeCameraParametersFromDimensions:(id)a3;
- (id)handler;
- (int)frameRate;
- (int64_t)maxNumberOfCameras;
- (unint64_t)numberOfCameras;
- (void)captureOutput:(id)a3 didOutputMetadataObjects:(id)a4 fromConnection:(id)a5;
- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5;
- (void)setCameraPaused:(BOOL)a3;
- (void)setCaptureContext:(id)a3;
- (void)setCaptureQueue:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHandler:(id)a3;
- (void)startCaptureSessionWithHandler:(id)a3;
- (void)startFaceKitForContext:(id)a3;
- (void)stopCaptureSession;
- (void)stopFaceKitForContext:(id)a3;
@end

@implementation RMFacePoseCaptureSession

- (RMFacePoseCaptureSession)init
{
  v22.receiver = self;
  v22.super_class = (Class)RMFacePoseCaptureSession;
  v2 = [(RMFacePoseCaptureSession *)&v22 init];
  if (v2)
  {
    id v3 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.RelativeMotion"];
    v37[0] = @"TempestFacePoseDefaultFOV";
    v37[1] = @"TempestFacePoseFrameRate";
    v38[0] = &off_100025F30;
    v38[1] = &off_100025F60;
    v37[2] = @"TempestFacePoseMaxNumberOfCameras";
    v37[3] = @"TempestFacePoseAllowBuiltInMetadataCameras";
    v38[2] = &off_100025F78;
    v38[3] = &__kCFBooleanTrue;
    v37[4] = @"TempestFacePoseAllowBuiltInVideoCameras";
    v37[5] = @"TempestFacePoseAllowExternalVideoCameras";
    v38[4] = &__kCFBooleanFalse;
    v38[5] = &__kCFBooleanFalse;
    v37[6] = @"TempestFacePoseNetworkFailureThresholdMultiplier";
    v37[7] = @"TempestFacePoseTrackingFailureFieldOfViewModifier";
    v38[6] = &off_100025F40;
    v38[7] = &off_100025F40;
    v4 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:8];
    [v3 registerDefaults:v4];

    [v3 doubleForKey:@"TempestFacePoseDefaultFOV"];
    v2->_double defaultFieldOfView = v5;
    v2->_frameRate = [v3 integerForKey:@"TempestFacePoseFrameRate"];
    v2->_int64_t maxNumberOfCameras = (int64_t)[v3 integerForKey:@"TempestFacePoseMaxNumberOfCameras"];
    v2->_BOOL allowBuiltInMetadataCameras = [v3 integerForKey:@"TempestFacePoseAllowBuiltInMetadataCameras"] != 0;
    v2->_BOOL allowBuiltInVideoCameras = [v3 integerForKey:@"TempestFacePoseAllowBuiltInVideoCameras"] != 0;
    v2->_BOOL allowExternalVideoCameras = [v3 integerForKey:@"TempestFacePoseAllowExternalVideoCameras"] != 0;
    [v3 doubleForKey:@"TempestFacePoseNetworkFailureThresholdMultiplier"];
    v2->_double networkFailureThresholdMultiplier = v6;
    [v3 doubleForKey:@"TempestFacePoseTrackingFailureFieldOfViewModifier"];
    v2->_double trackingFailureFieldOfViewModifier = v7;
    if (qword_10002C538 != -1) {
      dispatch_once(&qword_10002C538, &stru_100025058);
    }
    v8 = qword_10002C540;
    if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_DEFAULT))
    {
      double defaultFieldOfView = v2->_defaultFieldOfView;
      int64_t maxNumberOfCameras = v2->_maxNumberOfCameras;
      BOOL allowBuiltInMetadataCameras = v2->_allowBuiltInMetadataCameras;
      BOOL allowBuiltInVideoCameras = v2->_allowBuiltInVideoCameras;
      BOOL allowExternalVideoCameras = v2->_allowExternalVideoCameras;
      double networkFailureThresholdMultiplier = v2->_networkFailureThresholdMultiplier;
      double trackingFailureFieldOfViewModifier = v2->_trackingFailureFieldOfViewModifier;
      *(_DWORD *)buf = 134350592;
      double v24 = defaultFieldOfView;
      __int16 v25 = 2050;
      int64_t v26 = maxNumberOfCameras;
      __int16 v27 = 1026;
      BOOL v28 = allowBuiltInMetadataCameras;
      __int16 v29 = 1026;
      BOOL v30 = allowBuiltInVideoCameras;
      __int16 v31 = 1026;
      BOOL v32 = allowExternalVideoCameras;
      __int16 v33 = 2050;
      double v34 = networkFailureThresholdMultiplier;
      __int16 v35 = 2050;
      double v36 = trackingFailureFieldOfViewModifier;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "defaultFieldOfView: %{public}f, maxNumberOfCameras: %{public}ld, allowBuiltInMetadataCameras: %{public}d, allowBuiltInCameras: %{public}d, allowExternalCameras: %{public}d, networkFailureThresholdMultiplier: %{public}f, trackingFailureFieldOfViewModifier: %{public}f", buf, 0x3Cu);
    }

    v16 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v17 = dispatch_queue_create("RMFacePoseCaptureSessionCaptureQueue", v16);
    captureQueue = v2->_captureQueue;
    v2->_captureQueue = (OS_dispatch_queue *)v17;

    uint64_t v19 = objc_opt_new();
    captureContext = v2->_captureContext;
    v2->_captureContext = (NSMutableArray *)v19;
  }
  return v2;
}

- (void)startCaptureSessionWithHandler:(id)a3
{
  id v4 = a3;
  double v5 = [(RMFacePoseCaptureSession *)self captureQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000F940;
  v7[3] = &unk_100024D88;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)stopCaptureSession
{
  id v3 = [(RMFacePoseCaptureSession *)self captureQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000FDD4;
  block[3] = &unk_100024908;
  block[4] = self;
  dispatch_sync(v3, block);

  if (qword_10002C538 != -1) {
    dispatch_once(&qword_10002C538, &stru_100025058);
  }
  id v4 = qword_10002C540;
  if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)double v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Stopped capture session", v5, 2u);
  }
}

- (void)setCameraPaused:(BOOL)a3
{
  double v5 = [(RMFacePoseCaptureSession *)self captureQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100010260;
  v6[3] = &unk_100024F98;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

- (unint64_t)numberOfCameras
{
  v2 = [(RMFacePoseCaptureSession *)self captureContext];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (BOOL)configureCaptureSession
{
  v214.value = 0;
  *(void *)&v214.timescale = &v214;
  v214.epoch = 0x2020000000;
  uint64_t v215 = 0;
  v213[0] = _NSConcreteStackBlock;
  v213[1] = 3221225472;
  v213[2] = sub_100011D6C;
  v213[3] = &unk_100024FC0;
  v213[4] = self;
  v213[5] = &v214;
  v160 = objc_retainBlock(v213);
  if ([(RMFacePoseCaptureSession *)self allowBuiltInMetadataCameras])
  {
    uint64_t v240 = AVCaptureDeviceTypeBuiltInUltraWideAngleMetadataCamera;
    v2 = +[NSArray arrayWithObjects:&v240 count:1];
    ((void (*)(void *, void *, const AVMediaType))v160[2])(v160, v2, AVMediaTypeMetadataObject);

    uint64_t v239 = AVCaptureDeviceTypeBuiltInWideAngleMetadataCamera;
    id v3 = +[NSArray arrayWithObjects:&v239 count:1];
    ((void (*)(void *, void *, const AVMediaType))v160[2])(v160, v3, AVMediaTypeMetadataObject);
  }
  if ([(RMFacePoseCaptureSession *)self allowBuiltInVideoCameras])
  {
    AVCaptureDeviceType v238 = AVCaptureDeviceTypeBuiltInTrueDepthCamera;
    id v4 = +[NSArray arrayWithObjects:&v238 count:1];
    ((void (*)(void *, void *, const AVMediaType))v160[2])(v160, v4, AVMediaTypeVideo);

    AVCaptureDeviceType v237 = AVCaptureDeviceTypeBuiltInUltraWideCamera;
    double v5 = +[NSArray arrayWithObjects:&v237 count:1];
    ((void (*)(void *, void *, const AVMediaType))v160[2])(v160, v5, AVMediaTypeVideo);

    AVCaptureDeviceType v236 = AVCaptureDeviceTypeBuiltInWideAngleCamera;
    id v6 = +[NSArray arrayWithObjects:&v236 count:1];
    ((void (*)(void *, void *, const AVMediaType))v160[2])(v160, v6, AVMediaTypeVideo);
  }
  if ([(RMFacePoseCaptureSession *)self allowExternalVideoCameras])
  {
    AVCaptureDeviceType v235 = AVCaptureDeviceTypeExternal;
    BOOL v7 = +[NSArray arrayWithObjects:&v235 count:1];
    ((void (*)(void *, void *, const AVMediaType))v160[2])(v160, v7, AVMediaTypeVideo);
  }
  id v8 = [(RMFacePoseCaptureSession *)self captureContext];
  BOOL v9 = [v8 count] == 0;

  if (v9)
  {
    if (qword_10002C538 != -1) {
      dispatch_once(&qword_10002C538, &stru_100025058);
    }
    __int16 v27 = (id)qword_10002C540;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf.value) = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Failed to find a capture device", (uint8_t *)&buf, 2u);
    }
LABEL_155:

    _Block_object_dispose(&v214, 8);
    return 0;
  }
  if (qword_10002C538 != -1) {
    dispatch_once(&qword_10002C538, &stru_100025058);
  }
  v10 = (id)qword_10002C540;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [(RMFacePoseCaptureSession *)self captureContext];
    id v12 = [v11 count];
    LODWORD(buf.value) = 134349056;
    *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Number of face tracking cameras: %{public}lu", (uint8_t *)&buf, 0xCu);
  }
  long long v211 = 0u;
  long long v212 = 0u;
  long long v209 = 0u;
  long long v210 = 0u;
  v13 = [(RMFacePoseCaptureSession *)self captureContext];
  id v14 = [v13 countByEnumeratingWithState:&v209 objects:v234 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v210;
    v163 = v13;
    uint64_t v162 = *(void *)v210;
    do
    {
      v16 = 0;
      id obj = v14;
      do
      {
        if (*(void *)v210 != v15) {
          objc_enumerationMutation(v13);
        }
        dispatch_queue_t v17 = *(void **)(*((void *)&v209 + 1) + 8 * (void)v16);
        if (qword_10002C538 != -1) {
          dispatch_once(&qword_10002C538, &stru_100025058);
        }
        v18 = (id)qword_10002C540;
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          id v19 = [v17 cameraID];
          v166 = [v17 captureDevice];
          v20 = [v166 uniqueID];
          v21 = [v17 captureDevice];
          objc_super v22 = [v21 localizedName];
          v23 = [v17 captureDevice];
          if ([v23 isContinuityCamera]) {
            double v24 = " (Continuity Camera)";
          }
          else {
            double v24 = (const char *)&unk_10001F7FA;
          }
          __int16 v25 = [v17 captureDevice];
          int64_t v26 = [v25 deviceType];
          LODWORD(buf.value) = 134350082;
          *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v19;
          LOWORD(buf.flags) = 2114;
          *(void *)((char *)&buf.flags + 2) = v20;
          HIWORD(buf.epoch) = 2114;
          v229 = v22;
          __int16 v230 = 2082;
          v231 = v24;
          __int16 v232 = 2114;
          v233 = v26;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[Cam %{public}lu] Found camera: %{public}@ \"%{public}@\"%{public}s, type: %{public}@", (uint8_t *)&buf, 0x34u);

          v13 = v163;
          uint64_t v15 = v162;
          id v14 = obj;
        }
        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [v13 countByEnumeratingWithState:&v209 objects:v234 count:16];
    }
    while (v14);
  }

  long long v207 = 0u;
  long long v208 = 0u;
  long long v205 = 0u;
  long long v206 = 0u;
  __int16 v27 = [(RMFacePoseCaptureSession *)self captureContext];
  id v28 = [v27 countByEnumeratingWithState:&v205 objects:v227 count:16];
  if (!v28) {
    goto LABEL_35;
  }
  uint64_t v29 = *(void *)v206;
  while (2)
  {
    for (i = 0; i != v28; i = (char *)i + 1)
    {
      if (*(void *)v206 != v29) {
        objc_enumerationMutation(v27);
      }
      __int16 v31 = *(void **)(*((void *)&v205 + 1) + 8 * i);
      BOOL v32 = [v31 captureDevice];
      id v204 = 0;
      __int16 v33 = +[AVCaptureDeviceInput deviceInputWithDevice:v32 error:&v204];
      id v34 = v204;
      [v31 setCaptureDeviceInput:v33];

      if (v34)
      {
        if (qword_10002C538 != -1) {
          dispatch_once(&qword_10002C538, &stru_100025058);
        }
        v150 = (id)qword_10002C540;
        if (!os_log_type_enabled(v150, OS_LOG_TYPE_ERROR)) {
          goto LABEL_154;
        }
        id v151 = [v31 cameraID];
        LODWORD(buf.value) = 134349314;
        *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v151;
        LOWORD(buf.flags) = 2114;
        *(void *)((char *)&buf.flags + 2) = v34;
        v152 = "[Cam %{public}lu] Capture device error: %{public}@";
        v153 = v150;
        uint32_t v154 = 22;
        goto LABEL_153;
      }
      __int16 v35 = [v31 captureDeviceInput];
      BOOL v36 = v35 == 0;

      if (v36)
      {
        if (qword_10002C538 != -1) {
          dispatch_once(&qword_10002C538, &stru_100025058);
        }
        v150 = (id)qword_10002C540;
        if (!os_log_type_enabled(v150, OS_LOG_TYPE_ERROR)) {
          goto LABEL_154;
        }
        id v155 = [v31 cameraID];
        LODWORD(buf.value) = 134349056;
        *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v155;
        v152 = "[Cam %{public}lu] Failed to create capture input";
        v153 = v150;
        uint32_t v154 = 12;
LABEL_153:
        _os_log_impl((void *)&_mh_execute_header, v153, OS_LOG_TYPE_ERROR, v152, (uint8_t *)&buf, v154);
LABEL_154:

        goto LABEL_155;
      }
    }
    id v28 = [v27 countByEnumeratingWithState:&v205 objects:v227 count:16];
    if (v28) {
      continue;
    }
    break;
  }
LABEL_35:

  _Block_object_dispose(&v214, 8);
  long long v200 = 0u;
  long long v201 = 0u;
  long long v202 = 0u;
  long long v203 = 0u;
  v37 = [(RMFacePoseCaptureSession *)self captureContext];
  id v38 = [v37 countByEnumeratingWithState:&v200 objects:v226 count:16];
  if (v38)
  {
    uint64_t v39 = *(void *)v201;
    do
    {
      for (j = 0; j != v38; j = (char *)j + 1)
      {
        if (*(void *)v201 != v39) {
          objc_enumerationMutation(v37);
        }
        v41 = *(void **)(*((void *)&v200 + 1) + 8 * (void)j);
        AVMediaType v42 = [v41 mediaType];
        BOOL v43 = v42 == AVMediaTypeVideo;

        if (v43)
        {
          v44 = objc_opt_new();
          [v41 setVideoDataOutput:v44];
        }
      }
      id v38 = [v37 countByEnumeratingWithState:&v200 objects:v226 count:16];
    }
    while (v38);
  }

  long long v198 = 0u;
  long long v199 = 0u;
  long long v196 = 0u;
  long long v197 = 0u;
  v45 = [(RMFacePoseCaptureSession *)self captureContext];
  id v46 = [v45 countByEnumeratingWithState:&v196 objects:v225 count:16];
  if (v46)
  {
    uint64_t v47 = *(void *)v197;
    do
    {
      for (k = 0; k != v46; k = (char *)k + 1)
      {
        if (*(void *)v197 != v47) {
          objc_enumerationMutation(v45);
        }
        v49 = *(void **)(*((void *)&v196 + 1) + 8 * (void)k);
        v50 = objc_opt_new();
        [v49 setMetadataOutput:v50];

        v51 = [v49 metadataOutput];
        v52 = [(RMFacePoseCaptureSession *)self captureQueue];
        [v51 setMetadataObjectsDelegate:self queue:v52];
      }
      id v46 = [v45 countByEnumeratingWithState:&v196 objects:v225 count:16];
    }
    while (v46);
  }

  long long v194 = 0u;
  long long v195 = 0u;
  long long v192 = 0u;
  long long v193 = 0u;
  v53 = [(RMFacePoseCaptureSession *)self captureContext];
  id v54 = [v53 countByEnumeratingWithState:&v192 objects:v224 count:16];
  if (v54)
  {
    uint64_t v55 = *(void *)v193;
    do
    {
      for (m = 0; m != v54; m = (char *)m + 1)
      {
        if (*(void *)v193 != v55) {
          objc_enumerationMutation(v53);
        }
        v57 = *(void **)(*((void *)&v192 + 1) + 8 * (void)m);
        v58 = objc_opt_new();
        [v57 setCaptureSession:v58];

        v59 = [v57 captureSession];
        [v59 beginConfiguration];

        v60 = [v57 captureSession];
        v61 = [v57 captureDeviceInput];
        [v60 addInput:v61];

        v62 = [v57 metadataOutput];
        LODWORD(v61) = v62 == 0;

        v63 = [v57 captureSession];
        if (v61) {
          [v57 videoDataOutput];
        }
        else {
        v64 = [v57 metadataOutput];
        }
        [v63 addOutput:v64];

        v65 = [v57 captureSession];
        [v65 commitConfiguration];
      }
      id v54 = [v53 countByEnumeratingWithState:&v192 objects:v224 count:16];
    }
    while (v54);
  }

  long long v190 = 0u;
  long long v191 = 0u;
  long long v188 = 0u;
  long long v189 = 0u;
  v66 = [(RMFacePoseCaptureSession *)self captureContext];
  id v67 = [v66 countByEnumeratingWithState:&v188 objects:v223 count:16];
  if (v67)
  {
    uint64_t v68 = *(void *)v189;
    uint64_t v69 = AVMetadataObjectTypeTrackedFaces;
    do
    {
      for (n = 0; n != v67; n = (char *)n + 1)
      {
        if (*(void *)v189 != v68) {
          objc_enumerationMutation(v66);
        }
        v71 = *(void **)(*((void *)&v188 + 1) + 8 * (void)n);
        v72 = [v71 metadataOutput];
        BOOL v73 = v72 == 0;

        if (!v73)
        {
          v74 = [v71 metadataOutput];
          unsigned int v75 = [v74 isFaceTrackingSupported];

          if (v75)
          {
            v76 = [v71 metadataOutput];
            [v76 setFaceTrackingMetadataObjectTypesAvailable:1];

            v77 = [v71 metadataOutput];
            [v77 setFaceTrackingMaxFaces:1];

            v78 = [v71 metadataOutput];
            [v78 setFaceTrackingUsesFaceRecognition:0];

            uint64_t v222 = v69;
            v79 = +[NSArray arrayWithObjects:&v222 count:1];
            v80 = [v71 metadataOutput];
            [v80 setMetadataObjectTypes:v79];

            [(RMFacePoseCaptureSession *)self networkFailureThresholdMultiplier];
            double v82 = v81;
            v83 = [v71 metadataOutput];
            *(float *)&double v84 = v82;
            [v83 setFaceTrackingNetworkFailureThresholdMultiplier:v84];

            [(RMFacePoseCaptureSession *)self trackingFailureFieldOfViewModifier];
            double v86 = v85;
            v87 = [v71 metadataOutput];
            *(float *)&double v88 = v86;
            [v87 setFaceTrackingFailureFieldOfViewModifier:v88];

            [v71 setSupportsFaceKitMetadata:1];
          }
        }
      }
      id v67 = [v66 countByEnumeratingWithState:&v188 objects:v223 count:16];
    }
    while (v67);
  }

  long long v186 = 0u;
  long long v187 = 0u;
  long long v184 = 0u;
  long long v185 = 0u;
  v89 = [(RMFacePoseCaptureSession *)self captureContext];
  id v90 = [v89 countByEnumeratingWithState:&v184 objects:v221 count:16];
  if (v90)
  {
    uint64_t v91 = *(void *)v185;
    CFStringRef v92 = kCVPixelBufferPixelFormatTypeKey;
    do
    {
      for (ii = 0; ii != v90; ii = (char *)ii + 1)
      {
        if (*(void *)v185 != v91) {
          objc_enumerationMutation(v89);
        }
        v94 = *(void **)(*((void *)&v184 + 1) + 8 * (void)ii);
        if (([v94 supportsFaceKitMetadata] & 1) == 0)
        {
          v95 = [v94 captureSession];
          [v95 beginConfiguration];

          CFStringRef v219 = v92;
          v220 = &off_100025F90;
          v96 = +[NSDictionary dictionaryWithObjects:&v220 forKeys:&v219 count:1];
          v97 = [v94 videoDataOutput];
          [v97 setVideoSettings:v96];

          v98 = [v94 videoDataOutput];
          [v98 setAlwaysDiscardsLateVideoFrames:1];

          v99 = [v94 videoDataOutput];
          v100 = [(RMFacePoseCaptureSession *)self captureQueue];
          [v99 setSampleBufferDelegate:self queue:v100];

          v101 = [v94 captureSession];
          [v101 commitConfiguration];
        }
      }
      id v90 = [v89 countByEnumeratingWithState:&v184 objects:v221 count:16];
    }
    while (v90);
  }

  long long v182 = 0u;
  long long v183 = 0u;
  long long v180 = 0u;
  long long v181 = 0u;
  obja = [(RMFacePoseCaptureSession *)self captureContext];
  id v102 = [obja countByEnumeratingWithState:&v180 objects:v218 count:16];
  if (v102)
  {
    uint64_t v167 = *(void *)v181;
    uint64_t v161 = 134349568;
    while (2)
    {
      v103 = 0;
      do
      {
        if (*(void *)v181 != v167) {
          objc_enumerationMutation(obja);
        }
        v104 = *(void **)(*((void *)&v180 + 1) + 8 * (void)v103);
        v105 = [v104 captureDeviceInput:v161];
        v106 = [v105 device];

        if (([v106 lockForConfiguration:0] & 1) == 0)
        {
          if (qword_10002C538 != -1) {
            dispatch_once(&qword_10002C538, &stru_100025058);
          }
          v156 = (void *)qword_10002C540;
          if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_ERROR))
          {
            v157 = v156;
            id v158 = [v104 cameraID];
            LODWORD(buf.value) = 134349056;
            *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v158;
            _os_log_impl((void *)&_mh_execute_header, v157, OS_LOG_TYPE_ERROR, "[Cam %{public}lu] Failed to acquire the lock for device configuration", (uint8_t *)&buf, 0xCu);
          }
          BOOL v149 = 0;
          v148 = obja;
          goto LABEL_161;
        }
        v107 = [v104 captureSession];
        [v107 beginConfiguration];

        if (([v104 supportsFaceKitMetadata] & 1) != 0
          || ([v106 activeFormat],
              v108 = objc_claimAutoreleasedReturnValue(),
              [v108 supportedDepthDataFormats],
              v109 = objc_claimAutoreleasedReturnValue(),
              BOOL v110 = [v109 count] == 0,
              v109,
              v108,
              v110))
        {
          v114 = [v106 formats];
          v113 = -[RMFacePoseCaptureSession chooseBestFormatForFaceKit:forCameraID:](self, "chooseBestFormatForFaceKit:forCameraID:", v114, [v104 cameraID]);

          if (v113) {
            [v106 setActiveFormat:v113];
          }
        }
        else
        {
          v111 = [v106 activeFormat];
          v112 = [v111 supportedDepthDataFormats];
          v113 = -[RMFacePoseCaptureSession chooseBestFormatForFaceKit:forCameraID:](self, "chooseBestFormatForFaceKit:forCameraID:", v112, [v104 cameraID]);

          if (v113) {
            [v106 setActiveDepthDataFormat:v113];
          }
        }

        if (qword_10002C538 != -1) {
          dispatch_once(&qword_10002C538, &stru_100025058);
        }
        v115 = (id)qword_10002C540;
        if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
        {
          id v116 = [v104 cameraID];
          v117 = [v106 activeFormat];
          v118 = [v117 description];
          v119 = [v106 activeDepthDataFormat];
          v120 = [v119 description];
          LODWORD(buf.value) = 134349570;
          *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v116;
          LOWORD(buf.flags) = 2114;
          *(void *)((char *)&buf.flags + 2) = v118;
          HIWORD(buf.epoch) = 2114;
          v229 = v120;
          _os_log_impl((void *)&_mh_execute_header, v115, OS_LOG_TYPE_DEFAULT, "[Cam %{public}lu] activeFormat: %{public}@, activeDepthDataFormat: %{public}@", (uint8_t *)&buf, 0x20u);
        }
        if ([(RMFacePoseCaptureSession *)self frameRate] >= 1)
        {
          long long v178 = 0u;
          long long v179 = 0u;
          long long v176 = 0u;
          long long v177 = 0u;
          v121 = [v106 activeFormat];
          v122 = [v121 videoSupportedFrameRateRanges];

          id v123 = [v122 countByEnumeratingWithState:&v176 objects:v217 count:16];
          if (v123)
          {
            uint64_t v124 = *(void *)v177;
            while (2)
            {
              for (jj = 0; jj != v123; jj = (char *)jj + 1)
              {
                if (*(void *)v177 != v124) {
                  objc_enumerationMutation(v122);
                }
                v126 = *(void **)(*((void *)&v176 + 1) + 8 * (void)jj);
                int v127 = [(RMFacePoseCaptureSession *)self frameRate];
                [v126 minFrameRate];
                if (v128 <= (double)v127)
                {
                  int v129 = [(RMFacePoseCaptureSession *)self frameRate];
                  [v126 maxFrameRate];
                  if (v130 >= (double)v129)
                  {

                    if (qword_10002C538 != -1) {
                      dispatch_once(&qword_10002C538, &stru_100025058);
                    }
                    v134 = (id)qword_10002C540;
                    if (os_log_type_enabled(v134, OS_LOG_TYPE_DEFAULT))
                    {
                      id v135 = [v104 cameraID];
                      unsigned int v136 = [(RMFacePoseCaptureSession *)self frameRate];
                      LODWORD(buf.value) = 134349312;
                      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v135;
                      LOWORD(buf.flags) = 1026;
                      *(CMTimeFlags *)((char *)&buf.flags + 2) = v136;
                      _os_log_impl((void *)&_mh_execute_header, v134, OS_LOG_TYPE_DEFAULT, "[Cam %{public}lu] Setting frame rate to %{public}d fps", (uint8_t *)&buf, 0x12u);
                    }

                    memset(&buf, 0, sizeof(buf));
                    CMTimeMake(&buf, 1, [(RMFacePoseCaptureSession *)self frameRate]);
                    CMTime v175 = buf;
                    [v106 setActiveVideoMaxFrameDuration:&v175];
                    CMTime v174 = buf;
                    [v106 setActiveVideoMinFrameDuration:&v174];
                    goto LABEL_116;
                  }
                }
              }
              id v123 = [v122 countByEnumeratingWithState:&v176 objects:v217 count:16];
              if (v123) {
                continue;
              }
              break;
            }
          }

          if (qword_10002C538 != -1) {
            dispatch_once(&qword_10002C538, &stru_100025058);
          }
          v131 = (id)qword_10002C540;
          if (os_log_type_enabled(v131, OS_LOG_TYPE_DEFAULT))
          {
            id v132 = [v104 cameraID];
            unsigned int v133 = [(RMFacePoseCaptureSession *)self frameRate];
            LODWORD(buf.value) = 134349312;
            *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v132;
            LOWORD(buf.flags) = 1026;
            *(CMTimeFlags *)((char *)&buf.flags + 2) = v133;
            _os_log_impl((void *)&_mh_execute_header, v131, OS_LOG_TYPE_DEFAULT, "[Cam %{public}lu] Frame rate of %{public}d fps is not supported", (uint8_t *)&buf, 0x12u);
          }
        }
LABEL_116:
        if ([v106 isExposureModeSupported:3])
        {
          memset(&v214, 0, sizeof(v214));
          CMTimeMake(&v214, 1, 60);
          if (qword_10002C538 != -1) {
            dispatch_once(&qword_10002C538, &stru_100025058);
          }
          v137 = (id)qword_10002C540;
          if (os_log_type_enabled(v137, OS_LOG_TYPE_DEFAULT))
          {
            id v138 = [v104 cameraID];
            LODWORD(buf.value) = v161;
            *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v138;
            LOWORD(buf.flags) = 2048;
            *(void *)((char *)&buf.flags + 2) = v214.value;
            HIWORD(buf.epoch) = 1026;
            LODWORD(v229) = v214.timescale;
            _os_log_impl((void *)&_mh_execute_header, v137, OS_LOG_TYPE_DEFAULT, "[Cam %{public}lu] Setting max exposure duration to %lld/%{public}d sec", (uint8_t *)&buf, 0x1Cu);
          }

          CMTime v173 = v214;
          [v106 setActiveMaxExposureDuration:&v173];
        }
        else
        {
          if (qword_10002C538 != -1) {
            dispatch_once(&qword_10002C538, &stru_100025058);
          }
          v139 = (id)qword_10002C540;
          if (os_log_type_enabled(v139, OS_LOG_TYPE_DEFAULT))
          {
            id v140 = [v104 cameraID];
            LODWORD(buf.value) = 134349056;
            *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v140;
            _os_log_impl((void *)&_mh_execute_header, v139, OS_LOG_TYPE_DEFAULT, "[Cam %{public}lu] Max exposure duration setting is not supported", (uint8_t *)&buf, 0xCu);
          }
        }
        [v106 setGeometricDistortionCorrectionEnabled:0];
        v141 = [v104 captureSession];
        [v141 commitConfiguration];

        [v106 unlockForConfiguration];
        v103 = (char *)v103 + 1;
      }
      while (v103 != v102);
      id v102 = [obja countByEnumeratingWithState:&v180 objects:v218 count:16];
      if (v102) {
        continue;
      }
      break;
    }
  }

  long long v171 = 0u;
  long long v172 = 0u;
  long long v169 = 0u;
  long long v170 = 0u;
  v142 = [(RMFacePoseCaptureSession *)self captureContext];
  id v143 = [v142 countByEnumeratingWithState:&v169 objects:v216 count:16];
  if (v143)
  {
    uint64_t v144 = *(void *)v170;
    do
    {
      for (kk = 0; kk != v143; kk = (char *)kk + 1)
      {
        if (*(void *)v170 != v144) {
          objc_enumerationMutation(v142);
        }
        v146 = [*(id *)(*((void *)&v169 + 1) + 8 * (void)kk) videoDataOutput];
        v147 = [v146 connectionWithMediaType:AVMediaTypeVideo];

        [v147 setVideoMirrored:0];
      }
      id v143 = [v142 countByEnumeratingWithState:&v169 objects:v216 count:16];
    }
    while (v143);
  }

  if (qword_10002C538 != -1) {
    dispatch_once(&qword_10002C538, &stru_100025058);
  }
  v148 = (id)qword_10002C540;
  if (os_log_type_enabled(v148, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf.value) = 0;
    _os_log_impl((void *)&_mh_execute_header, v148, OS_LOG_TYPE_DEFAULT, "Capture session configuration finished", (uint8_t *)&buf, 2u);
  }
  BOOL v149 = 1;
LABEL_161:

  return v149;
}

- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  id v66 = a3;
  id v7 = a5;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  v63 = self;
  id v8 = [(RMFacePoseCaptureSession *)self captureContext];
  id v9 = [v8 countByEnumeratingWithState:&v76 objects:v93 count:16];
  if (v9)
  {
    v10 = 0;
    uint64_t v11 = *(void *)v77;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v77 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v76 + 1) + 8 * i);
        id v14 = [v13 videoDataOutput];
        id v15 = [v14 connectionWithMediaType:AVMediaTypeVideo];
        BOOL v16 = v15 == v7;

        if (v16)
        {
          id v17 = v13;

          v10 = v17;
        }
      }
      id v9 = [v8 countByEnumeratingWithState:&v76 objects:v93 count:16];
    }
    while (v9);

    if (v10)
    {
      memset(&v75, 0, sizeof(v75));
      CMSampleBufferGetPresentationTimeStamp(&v75, a4);
      CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a4);
      if (ImageBuffer)
      {
        buf.value = 0;
        *(void *)&buf.timescale = &buf;
        buf.epoch = 0x3032000000;
        id v90 = sub_1000129E8;
        uint64_t v91 = sub_1000129F8;
        id v92 = 0;
        id v19 = [objc_alloc((Class)VNImageRequestHandler) initWithCVPixelBuffer:ImageBuffer orientation:1 options:&__NSDictionary0__struct];
        v74[0] = _NSConcreteStackBlock;
        v74[1] = 3221225472;
        v74[2] = sub_100012A00;
        v74[3] = &unk_100024FE8;
        v74[4] = &buf;
        id v20 = [objc_alloc((Class)VNDetectFaceRectanglesRequest) initWithCompletionHandler:v74];
        id v88 = v20;
        v21 = +[NSArray arrayWithObjects:&v88 count:1];
        id v73 = 0;
        unsigned int v22 = [v19 performRequests:v21 error:&v73];
        id v23 = v73;

        if (v22 && [*(id *)(*(void *)&buf.timescale + 40) count])
        {

          v72[0] = _NSConcreteStackBlock;
          v72[1] = 3221225472;
          v72[2] = sub_100012A4C;
          v72[3] = &unk_100024FE8;
          v72[4] = &buf;
          id v20 = [objc_alloc((Class)VNDetectFacePoseRequest) initWithCompletionHandler:v72];
          double v24 = [*(id *)(*(void *)&buf.timescale + 40) firstObject];
          v87 = v24;
          __int16 v25 = +[NSArray arrayWithObjects:&v87 count:1];
          [v20 setInputFaceObservations:v25];

          id v86 = v20;
          int64_t v26 = +[NSArray arrayWithObjects:&v86 count:1];
          id v71 = v23;
          LODWORD(v25) = [v19 performRequests:v26 error:&v71];
          id v27 = v71;

          if (v25 && [*(id *)(*(void *)&buf.timescale + 40) count])
          {

            id v20 = [*(id *)(*(void *)&buf.timescale + 40) firstObject];
            [v20 boundingBox];
            CGFloat v29 = v28;
            double v31 = v30;
            CGFloat v33 = v32;
            double v35 = v34;
            v84[0] = kCVAFaceTracking_DetectedFaceFaceID;
            BOOL v36 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v20 faceId]);
            v94.origin.y = 1.0 - v35 - v31;
            v85[0] = v36;
            v84[1] = kCVAFaceTracking_DetectedFaceRect;
            v94.origin.x = v29;
            v94.size.width = v33;
            v94.size.height = v35;
            CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v94);
            v85[1] = DictionaryRepresentation;
            v84[2] = kCVAFaceTracking_DetectedFaceAngleInfoRoll;
            v60 = [v20 roll];
            v85[2] = v60;
            v84[3] = @"AngleInfoPitch";
            v37 = [v20 pitch];
            v85[3] = v37;
            v84[4] = @"AngleInfoYaw";
            id v38 = [v20 yaw];
            v85[4] = v38;
            v84[5] = kCVAFaceTracking_Timestamp;
            CMTime time = v75;
            CFDictionaryRef v39 = CMTimeCopyAsDictionary(&time, 0);
            v85[5] = v39;
            CMSampleBufferRef sbufa = +[NSDictionary dictionaryWithObjects:v85 forKeys:v84 count:6];

            if (qword_10002C538 != -1) {
              dispatch_once(&qword_10002C538, &stru_100025058);
            }
            v40 = (id)qword_10002C540;
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
            {
              id v41 = [v10 cameraID];
              LODWORD(time.value) = 134349315;
              *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v41;
              LOWORD(time.flags) = 2113;
              *(void *)((char *)&time.flags + 2) = sbufa;
              _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEBUG, "[Cam %{public}ld] Face detected: %{private}@", (uint8_t *)&time, 0x16u);
            }

            int v42 = 1;
          }
          else
          {
            CMSampleBufferRef sbufa = 0;
            int v42 = 0;
          }
          id v23 = v27;
        }
        else
        {
          CMSampleBufferRef sbufa = 0;
          int v42 = 0;
        }

        _Block_object_dispose(&buf, 8);
        if (v42)
        {
          uint64_t v47 = [v10 captureDeviceInput];
          v48 = [v47 device];
          v62 = [v48 activeFormat];

          v49 = -[RMFacePoseCaptureSession computeCameraParametersFromDimensions:](v63, "computeCameraParametersFromDimensions:", CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)[v62 formatDescription]));
          v67[0] = _NSConcreteStackBlock;
          v67[1] = 3221225472;
          v67[2] = sub_100012A98;
          v67[3] = &unk_100025038;
          id v50 = v10;
          id v68 = v50;
          uint64_t v69 = v63;
          CMTime v70 = v75;
          v51 = objc_retainBlock(v67);
          v81[0] = kCVAFaceTracking_Timestamp;
          CMTime buf = v75;
          CFDictionaryRef v52 = CMTimeCopyAsDictionary(&buf, 0);
          v82[0] = v52;
          v81[1] = kCVAFaceTracking_DetectedFacesArray;
          CMSampleBufferRef v80 = sbufa;
          v53 = +[NSArray arrayWithObjects:&v80 count:1];
          v82[1] = v53;
          v81[2] = kCVAFaceTracking_Color;
          v81[3] = kCVAFaceTracking_CameraColor;
          v82[2] = ImageBuffer;
          v82[3] = v49;
          v81[4] = kCVAFaceTracking_Callback;
          id v54 = objc_retainBlock(v51);
          v82[4] = v54;
          uint64_t v55 = +[NSDictionary dictionaryWithObjects:v82 forKeys:v81 count:5];

          [v50 faceKit];
          CMTimeFlags v56 = CVAFaceTrackingProcess();
          if (v56)
          {
            if (qword_10002C538 != -1) {
              dispatch_once(&qword_10002C538, &stru_100025058);
            }
            v57 = (void *)qword_10002C540;
            if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_ERROR))
            {
              v58 = v57;
              id v59 = [v50 cameraID];
              LODWORD(buf.value) = 134349312;
              *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v59;
              LOWORD(buf.flags) = 1026;
              *(CMTimeFlags *)((char *)&buf.flags + 2) = v56;
              _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "[Cam %{public}ld] FaceKit failed %{public}d", (uint8_t *)&buf, 0x12u);
            }
          }
        }
      }
      else
      {
        if (qword_10002C538 != -1) {
          dispatch_once(&qword_10002C538, &stru_100025058);
        }
        v44 = (void *)qword_10002C540;
        if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_ERROR))
        {
          v45 = v44;
          id v46 = [v10 cameraID];
          LODWORD(buf.value) = 134349056;
          *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v46;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "[Cam %{public}lu] Failed to obtain the RGB buffer", (uint8_t *)&buf, 0xCu);
        }
      }

      goto LABEL_42;
    }
  }
  else
  {
  }
  if (qword_10002C538 != -1) {
    dispatch_once(&qword_10002C538, &stru_100025058);
  }
  BOOL v43 = qword_10002C540;
  if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf.value) = 0;
    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "Received sample buffer call back for unknown connection", (uint8_t *)&buf, 2u);
  }
LABEL_42:
}

- (id)chooseBestFormatForFaceKit:(id)a3 forCameraID:(unint64_t)a4
{
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = a3;
  id v4 = [obj countByEnumeratingWithState:&v23 objects:v33 count:16];
  if (v4)
  {
    id v6 = v4;
    id v7 = 0;
    uint64_t v8 = *(void *)v24;
    double v9 = 1.79769313e308;
    *(void *)&long long v5 = 134349570;
    long long v20 = v5;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v23 + 1) + 8 * (void)v10);
        int32_t height = CMVideoFormatDescriptionGetDimensions([v11 formatDescription:v20]).height;
        if ([v11 isVideoBinned]) {
          double v13 = 0.0;
        }
        else {
          double v13 = 1000.0;
        }
        if (qword_10002C538 != -1) {
          dispatch_once(&qword_10002C538, &stru_100025058);
        }
        double v14 = v13 + fabs(1080.0 / (double)height + -1.0) * 100.0 + 0.0;
        id v15 = (void *)qword_10002C540;
        if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_DEBUG))
        {
          BOOL v16 = v15;
          id v17 = [v11 description];
          *(_DWORD *)CMTime buf = v20;
          unint64_t v28 = a4;
          __int16 v29 = 2114;
          double v30 = v17;
          __int16 v31 = 2050;
          double v32 = v14;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "[Cam %{public}lu] Format candidate: %{public}@, cost: %{public}.0f", buf, 0x20u);
        }
        if (v9 > v14)
        {
          id v18 = v11;

          double v9 = v14;
          id v7 = v18;
        }
        v10 = (char *)v10 + 1;
      }
      while (v6 != v10);
      id v6 = [obj countByEnumeratingWithState:&v23 objects:v33 count:16];
    }
    while (v6);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)captureOutput:(id)a3 didOutputMetadataObjects:(id)a4 fromConnection:(id)a5
{
  id v50 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  v57 = self;
  v10 = [(RMFacePoseCaptureSession *)self captureContext];
  id v11 = [v10 countByEnumeratingWithState:&v64 objects:v69 count:16];
  if (!v11)
  {

LABEL_30:
    if (qword_10002C538 != -1) {
      dispatch_once(&qword_10002C538, &stru_100025058);
    }
    uint64_t v47 = v50;
    v48 = qword_10002C540;
    if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)CMTime buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "Received sample buffer call back for unknown connection", buf, 2u);
    }
    goto LABEL_36;
  }
  id v12 = v11;
  v49 = v8;
  double v13 = 0;
  uint64_t v14 = *(void *)v65;
  do
  {
    for (i = 0; i != v12; i = (char *)i + 1)
    {
      if (*(void *)v65 != v14) {
        objc_enumerationMutation(v10);
      }
      BOOL v16 = *(void **)(*((void *)&v64 + 1) + 8 * i);
      id v17 = [v16 metadataOutput];
      id v18 = [v17 connectionWithMediaType:AVMediaTypeMetadataObject];

      if (v18 == v9)
      {
        id v19 = v16;

        double v13 = v19;
      }
    }
    id v12 = [v10 countByEnumeratingWithState:&v64 objects:v69 count:16];
  }
  while (v12);

  id v8 = v49;
  if (!v13) {
    goto LABEL_30;
  }
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id obj = v49;
  id v20 = [obj countByEnumeratingWithState:&v59 objects:v68 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v60;
    uint64_t v23 = AVMetadataObjectTypeTrackedFaces;
    uint64_t v53 = kCVAFaceTracking_TrackedFacesArray;
    uint64_t v54 = kCVAFaceTrackingLiteFilter_SharedData;
    uint64_t v51 = AVMetadataObjectTypeTrackedFaces;
    uint64_t v52 = *(void *)v60;
    while (2)
    {
      long long v24 = 0;
      id v55 = v21;
      do
      {
        if (*(void *)v60 != v22) {
          objc_enumerationMutation(obj);
        }
        long long v25 = *(void **)(*((void *)&v59 + 1) + 8 * (void)v24);
        long long v26 = [v25 type];
        unsigned int v27 = [v26 isEqualToString:v23];

        if (v27)
        {
          unint64_t v28 = [v25 payload];
          id v29 = [v28 objectForKeyedSubscript:v54];
          if (!v29) {
            id v29 = v28;
          }
          uint64_t v30 = [v29 objectForKeyedSubscript:v53];
          if (!v30)
          {

            goto LABEL_35;
          }
          __int16 v31 = (void *)v30;
          double v32 = objc_opt_new();
          CGFloat v33 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v13 cameraID]);
          [v32 setObject:v33 forKeyedSubscript:@"rm_camera_id"];

          double v34 = [v13 captureDevice];
          double v35 = [v34 localizedName];
          [v32 setObject:v35 forKeyedSubscript:@"rm_camera_device_name"];

          BOOL v36 = [v13 captureDevice];
          v37 = [v36 modelID];
          [v32 setObject:v37 forKeyedSubscript:@"rm_camera_device_model_id"];

          id v38 = [v13 captureDevice];
          CFDictionaryRef v39 = [v38 uniqueID];
          [v32 setObject:v39 forKeyedSubscript:@"rm_camera_device_id"];

          v40 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v13 isBuiltInCamera]);
          [v32 setObject:v40 forKeyedSubscript:@"rm_built_in"];

          [v32 setObject:v31 forKeyedSubscript:@"rm_tracked_faces"];
          id v41 = [v13 videoDataOutput];
          int v42 = +[NSNumber numberWithInt:v41 != 0];
          [v32 setObject:v42 forKeyedSubscript:@"rm_has_video_data_output"];

          BOOL v43 = [v13 metadataOutput];
          v44 = +[NSNumber numberWithInt:v43 != 0];
          [v32 setObject:v44 forKeyedSubscript:@"rm_has_metadata_output"];

          uint64_t v23 = v51;
          v45 = [(RMFacePoseCaptureSession *)v57 handler];

          if (v45)
          {
            id v46 = [(RMFacePoseCaptureSession *)v57 handler];
            if (v25) {
              [v25 time];
            }
            else {
              memset(v58, 0, sizeof(v58));
            }
            ((void (**)(void, void *, void *))v46)[2](v46, v32, v58);
          }
          id v21 = v55;
          uint64_t v22 = v52;
        }
        long long v24 = (char *)v24 + 1;
      }
      while (v21 != v24);
      id v21 = [obj countByEnumeratingWithState:&v59 objects:v68 count:16];
      if (v21) {
        continue;
      }
      break;
    }
  }
LABEL_35:

  id v8 = v49;
  uint64_t v47 = v50;
LABEL_36:
}

- (void)startFaceKitForContext:(id)a3
{
  id v4 = a3;
  if (![v4 faceKit])
  {
    if (qword_10002C538 != -1) {
      dispatch_once(&qword_10002C538, &stru_100025058);
    }
    long long v5 = qword_10002C540;
    if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CMTime buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Starting FaceKit", buf, 2u);
    }
    v17[0] = kCVAFaceTracking_ColorOnly;
    v17[1] = kCVAFaceTracking_UseTongue;
    v18[0] = &__kCFBooleanTrue;
    v18[1] = &__kCFBooleanFalse;
    v17[2] = kCVAFaceTracking_RobustTongue;
    v17[3] = kCVAFaceTracking_NumTrackedFaces;
    v18[2] = &__kCFBooleanFalse;
    v18[3] = &off_100025F78;
    v17[4] = kCVAFaceTracking_NetworkFailureThresholdMultiplier;
    [(RMFacePoseCaptureSession *)self networkFailureThresholdMultiplier];
    id v6 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v18[4] = v6;
    v17[5] = kCVAFaceTracking_TrackingFailureFieldOfViewModifier;
    [(RMFacePoseCaptureSession *)self trackingFailureFieldOfViewModifier];
    id v7 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v17[6] = kCVAFaceTracking_UseRecognition;
    v18[5] = v7;
    v18[6] = &__kCFBooleanFalse;
    id v8 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:7];

    int v9 = CVAFaceTrackingCreate();
    [v4 setFaceKit:0];
    if (v9)
    {
      if (qword_10002C538 != -1) {
        dispatch_once(&qword_10002C538, &stru_100025058);
      }
      v10 = (void *)qword_10002C540;
      if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_ERROR))
      {
        id v11 = v10;
        id v12 = [v4 cameraID];
        *(_DWORD *)CMTime buf = 134349312;
        id v14 = v12;
        __int16 v15 = 1026;
        int v16 = v9;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "[Cam %{public}lu] Failed to create FaceKit instance: error: %{public}d", buf, 0x12u);
      }
      [v4 setFaceKit:0];
    }
  }
}

- (void)stopFaceKitForContext:(id)a3
{
  id v3 = a3;
  if ([v3 faceKit])
  {
    if (qword_10002C538 != -1) {
      dispatch_once(&qword_10002C538, &stru_100025058);
    }
    id v4 = (void *)qword_10002C540;
    if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_DEFAULT))
    {
      long long v5 = v4;
      int v6 = 134349056;
      id v7 = [v3 cameraID];
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[Cam %{public}lu] Stopping FaceKit", (uint8_t *)&v6, 0xCu);
    }
    CFRelease([v3 faceKit]);
    [v3 setFaceKit:0];
  }
}

- (id)computeCameraParametersFromDimensions:(id)a3
{
  double var0 = (double)a3.var0;
  double var1 = (double)a3.var1;
  [(RMFacePoseCaptureSession *)self defaultFieldOfView];
  long double v6 = tan(v5 * 3.14159265 / 180.0 * 0.5);
  long double v7 = sqrt(var1 * var1 + var0 * var0) / (v6 + v6);
  id v8 = +[NSNumber numberWithDouble:(double)v7];
  v45[0] = v8;
  v45[1] = &off_100025F50;
  int v9 = +[NSNumber numberWithDouble:var0 * 0.5 + -0.5];
  v45[2] = v9;
  v10 = +[NSArray arrayWithObjects:v45 count:3];
  v46[0] = v10;
  v44[0] = &off_100025F50;
  id v11 = +[NSNumber numberWithDouble:(double)v7];
  v44[1] = v11;
  id v12 = +[NSNumber numberWithDouble:var1 * 0.5 + -0.5];
  v44[2] = v12;
  double v13 = +[NSArray arrayWithObjects:v44 count:3];
  v46[1] = v13;
  v46[2] = &off_100025FD8;
  double v35 = +[NSArray arrayWithObjects:v46 count:3];

  LODWORD(v14) = 844757668;
  double v34 = +[NSNumber numberWithFloat:v14];
  v42[0] = v34;
  LODWORD(v15) = -1082130433;
  CGFloat v33 = +[NSNumber numberWithFloat:v15];
  v42[1] = v33;
  double v32 = +[NSNumber numberWithFloat:0.0];
  v42[2] = v32;
  __int16 v31 = +[NSArray arrayWithObjects:v42 count:3];
  v43[0] = v31;
  LODWORD(v16) = 1065353215;
  id v17 = +[NSNumber numberWithFloat:v16];
  v41[0] = v17;
  LODWORD(v18) = 844757668;
  id v19 = +[NSNumber numberWithFloat:v18];
  v41[1] = v19;
  id v20 = +[NSNumber numberWithFloat:0.0];
  v41[2] = v20;
  id v21 = +[NSArray arrayWithObjects:v41 count:3];
  v43[1] = v21;
  uint64_t v22 = +[NSNumber numberWithFloat:0.0];
  v40[0] = v22;
  uint64_t v23 = +[NSNumber numberWithFloat:0.0];
  v40[1] = v23;
  LODWORD(v24) = 1065353215;
  long long v25 = +[NSNumber numberWithFloat:v24];
  v40[2] = v25;
  long long v26 = +[NSArray arrayWithObjects:v40 count:3];
  v43[2] = v26;
  unsigned int v27 = +[NSArray arrayWithObjects:v43 count:3];

  v38[0] = kCVAFaceTracking_Rotation;
  v38[1] = kCVAFaceTracking_Translation;
  v39[0] = v27;
  v39[1] = &off_100025FF0;
  unint64_t v28 = +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:2];
  v36[0] = kCVAFaceTracking_Intrinsics;
  v36[1] = kCVAFaceTracking_Extrinsics;
  v37[0] = v35;
  v37[1] = v28;
  id v29 = +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:2];

  return v29;
}

- (RMFacePoseCaptureSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RMFacePoseCaptureSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isCameraPaused
{
  return self->_cameraPaused;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (double)defaultFieldOfView
{
  return self->_defaultFieldOfView;
}

- (int)frameRate
{
  return self->_frameRate;
}

- (int64_t)maxNumberOfCameras
{
  return self->_maxNumberOfCameras;
}

- (BOOL)allowBuiltInMetadataCameras
{
  return self->_allowBuiltInMetadataCameras;
}

- (BOOL)allowBuiltInVideoCameras
{
  return self->_allowBuiltInVideoCameras;
}

- (BOOL)allowExternalVideoCameras
{
  return self->_allowExternalVideoCameras;
}

- (double)networkFailureThresholdMultiplier
{
  return self->_networkFailureThresholdMultiplier;
}

- (double)trackingFailureFieldOfViewModifier
{
  return self->_trackingFailureFieldOfViewModifier;
}

- (OS_dispatch_queue)captureQueue
{
  return self->_captureQueue;
}

- (void)setCaptureQueue:(id)a3
{
}

- (NSMutableArray)captureContext
{
  return self->_captureContext;
}

- (void)setCaptureContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captureContext, 0);
  objc_storeStrong((id *)&self->_captureQueue, 0);
  objc_storeStrong(&self->_handler, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end