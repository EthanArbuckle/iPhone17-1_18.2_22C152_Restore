@interface PTHandGestureDetector
- (BOOL)detectGesturesFromBuffer:(__CVBuffer *)a3 timeStamp:(id *)a4 withRotationDegrees:(int)a5 withDetectedHands:(id)a6 withDetectedFaces:(id)a7 asyncWork:(id)a8;
- (CGSize)frameSize;
- (PTHandGestureDelegate)delegate;
- (PTHandGestureDetector)initWithFrameSize:(CGSize)a3 asyncInitQueue:(id)a4 externalHandDetectionsEnabled:(BOOL)a5;
- (VCPHandGestureVideoRequest)vcpHandGestureRequest;
- (void)setDelegate:(id)a3;
- (void)setVcpHandGestureRequest:(id)a3;
@end

@implementation PTHandGestureDetector

- (BOOL)detectGesturesFromBuffer:(__CVBuffer *)a3 timeStamp:(id *)a4 withRotationDegrees:(int)a5 withDetectedHands:(id)a6 withDetectedFaces:(id)a7 asyncWork:(id)a8
{
  uint64_t v10 = *(void *)&a5;
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v69 = a6;
  id v70 = a7;
  id v67 = a8;
  val = self;
  v12 = [(PTHandGestureDetector *)self vcpHandGestureRequest];

  v13 = self;
  p_numPendingRequestsLock = &self->_numPendingRequestsLock;
  os_unfair_lock_lock(p_numPendingRequestsLock);
  int numPendingRequests = v13->_numPendingRequests;
  os_unfair_lock_unlock(p_numPendingRequestsLock);
  if (v12) {
    BOOL v16 = numPendingRequests < 1;
  }
  else {
    BOOL v16 = 0;
  }
  int v17 = v16;
  BOOL v66 = v17;
  if (v17 != 1) {
    goto LABEL_42;
  }
  lock = p_numPendingRequestsLock;
  v68 = [MEMORY[0x1E4F1CA60] dictionary];
  v18 = [NSNumber numberWithInt:v10];
  v19 = getVCPRequestRotationInDegreesPropertyKey();
  [v68 setObject:v18 forKeyedSubscript:v19];

  if (!v69 || !val->_useExternalHandDetections) {
    goto LABEL_32;
  }
  v72 = [MEMORY[0x1E4F1CA48] array];
  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  id v20 = v69;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v87 objects:v92 count:16];
  if (!v21) {
    goto LABEL_29;
  }
  uint64_t v22 = *(void *)v88;
  do
  {
    for (uint64_t i = 0; i != v21; ++i)
    {
      if (*(void *)v88 != v22) {
        objc_enumerationMutation(v20);
      }
      v24 = *(void **)(*((void *)&v87 + 1) + 8 * i);
      id v25 = objc_alloc_init((Class)getVCPHandObjectClass());
      id v26 = v24;
      id v27 = v25;
      v28 = [v26 objectForKeyedSubscript:@"Rect"];
      v29 = v28;
      if (!v28) {
        goto LABEL_26;
      }
      [v27 setBounds:CGRectFromRectDictionary(v28)];
      [v27 bounds];
      v98.origin.x = 0.0;
      v98.origin.y = 0.0;
      v98.size.width = 1.0;
      v98.size.height = 1.0;
      CGRect v95 = CGRectIntersection(v94, v98);
      objc_msgSend(v27, "setBounds:", v95.origin.x, v95.origin.y, v95.size.width, v95.size.height);
      [v27 bounds];
      if (CGRectIsNull(v96)) {
        goto LABEL_26;
      }
      v30 = [v26 objectForKeyedSubscript:@"Chirality"];

      if (!v30) {
        goto LABEL_25;
      }
      if ([v30 intValue]) {
        uint64_t v31 = 0xFFFFFFFFLL;
      }
      else {
        uint64_t v31 = 1;
      }
      [v27 setChirality:v31];
      v29 = [v26 objectForKeyedSubscript:@"ID"];

      if (!v29) {
        goto LABEL_26;
      }
      objc_msgSend(v27, "setHandID:", objc_msgSend(v29, "intValue"));
      v32 = [v26 objectForKeyedSubscript:@"GroupID"];

      if (v32)
      {
        objc_msgSend(v27, "setGroupID:", objc_msgSend(v32, "intValue"));
        v29 = [v26 objectForKeyedSubscript:@"ConfidenceLevel"];

        if (v29)
        {
          *(float *)&double v33 = (float)(int)[v29 intValue] / 1000.0;
          [v27 setConfidence:v33];

          [v72 addObject:v27];
          goto LABEL_27;
        }
      }
      else
      {
LABEL_25:
        v29 = 0;
      }
LABEL_26:

LABEL_27:
    }
    uint64_t v21 = [v20 countByEnumeratingWithState:&v87 objects:v92 count:16];
  }
  while (v21);
LABEL_29:

  if ([v72 count])
  {
    v34 = getVCPRequestHandObjectsPropertyKey();
    [v68 setObject:v72 forKeyedSubscript:v34];
  }
LABEL_32:
  v35 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v70, "count"));
  v36 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v70, "count"));
  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id v37 = v70;
  uint64_t v38 = [v37 countByEnumeratingWithState:&v83 objects:v91 count:16];
  if (v38)
  {
    uint64_t v39 = *(void *)v84;
    do
    {
      for (uint64_t j = 0; j != v38; ++j)
      {
        if (*(void *)v84 != v39) {
          objc_enumerationMutation(v37);
        }
        v41 = *(void **)(*((void *)&v83 + 1) + 8 * j);
        v42 = [v41 objectForKeyedSubscript:@"Rect"];
        double v43 = CGRectFromRectDictionary(v42);
        CGFloat v45 = v44;
        CGFloat v47 = v46;
        CGFloat v49 = v48;

        v97.origin.x = v43;
        v97.origin.y = v45;
        v97.size.width = v47;
        v97.size.height = v49;
        v50 = NSStringFromRect(v97);
        [v35 addObject:v50];

        v51 = [v41 objectForKeyedSubscript:@"AngleInfoYaw"];
        [v51 doubleValue];
        double v53 = v52 * 3.14159265 / 180.0;
        if (v53 > 3.14159265) {
          double v53 = v53 + -6.28318531;
        }
        v54 = objc_msgSend(NSNumber, "numberWithDouble:", fmin(fmax(v53, -1.57079633), 1.57079633));
        [v36 addObject:v54];
      }
      uint64_t v38 = [v37 countByEnumeratingWithState:&v83 objects:v91 count:16];
    }
    while (v38);
  }

  v55 = getVCPRequestFaceRectsPropertyKey();
  [v68 setObject:v35 forKeyedSubscript:v55];

  v56 = getVCPRequestFaceYawsPropertyKey();
  [v68 setObject:v36 forKeyedSubscript:v56];

  v80[0] = MEMORY[0x1E4F143A8];
  v80[1] = 3221225472;
  v80[2] = __126__PTHandGestureDetector_detectGesturesFromBuffer_timeStamp_withRotationDegrees_withDetectedHands_withDetectedFaces_asyncWork___block_invoke;
  v80[3] = &unk_1E68847F8;
  v80[4] = val;
  long long v81 = *(_OWORD *)&a4->var0;
  int64_t var3 = a4->var3;
  v57 = (void *)MEMORY[0x1D25E44D0](v80);
  CVPixelBufferRetain(a3);
  objc_initWeak(&location, val);
  v73[0] = MEMORY[0x1E4F143A8];
  v73[1] = 3221225472;
  v73[2] = __126__PTHandGestureDetector_detectGesturesFromBuffer_timeStamp_withRotationDegrees_withDetectedHands_withDetectedFaces_asyncWork___block_invoke_131;
  v73[3] = &unk_1E6884820;
  objc_copyWeak(v76, &location);
  v76[1] = a3;
  long long v77 = *(_OWORD *)&a4->var0;
  int64_t v78 = a4->var3;
  id v58 = v68;
  id v74 = v58;
  id v59 = v57;
  id v75 = v59;
  v60 = (void *)MEMORY[0x1D25E44D0](v73);
  os_unfair_lock_lock(lock);
  ++val->_numPendingRequests;
  os_unfair_lock_unlock(lock);
  v61 = (void *)MEMORY[0x1D25E44D0](v60);
  [v67 addObject:v61];

  objc_destroyWeak(v76);
  objc_destroyWeak(&location);

LABEL_42:
  return v66;
}

- (VCPHandGestureVideoRequest)vcpHandGestureRequest
{
  return (VCPHandGestureVideoRequest *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDelegate:(id)a3
{
}

- (PTHandGestureDetector)initWithFrameSize:(CGSize)a3 asyncInitQueue:(id)a4 externalHandDetectionsEnabled:(BOOL)a5
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v9 = a4;
  v21.receiver = self;
  v21.super_class = (Class)PTHandGestureDetector;
  uint64_t v10 = [(PTHandGestureDetector *)&v21 init];
  if (v10)
  {
    PTKTraceInit();
    v10->_frameSize.CGFloat width = width;
    v10->_frameSize.CGFloat height = height;
    v10->_int numPendingRequests = 0;
    v10->_useExternalHandDetections = a5;
    v11 = _PTLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      if (v10->_useExternalHandDetections) {
        v12 = @"FW (ANST)";
      }
      else {
        v12 = @"MediaAnalysis";
      }
      *(_DWORD *)buf = 138412290;
      v23 = v12;
      _os_log_impl(&dword_1D0778000, v11, OS_LOG_TYPE_DEFAULT, "GestureDetector: Using hand detection from %@", buf, 0xCu);
    }

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __88__PTHandGestureDetector_initWithFrameSize_asyncInitQueue_externalHandDetectionsEnabled___block_invoke;
    v17[3] = &unk_1E68847D0;
    CGFloat v19 = width;
    CGFloat v20 = height;
    v13 = v10;
    v18 = v13;
    v14 = (void *)MEMORY[0x1D25E44D0](v17);
    dispatch_async(v9, v14);
    v15 = v13;
  }
  return v10;
}

void __88__PTHandGestureDetector_initWithFrameSize_asyncInitQueue_externalHandDetectionsEnabled___block_invoke(uint64_t a1)
{
  kdebug_trace();
  id v15 = [MEMORY[0x1E4F1CA60] dictionary];
  v2 = getVCPRequestMaxNumOfPersonsPropertyKey();
  [v15 setObject:&unk_1F26C0EB0 forKeyedSubscript:v2];

  v3 = getVCPRequestUseAsyncPropertyKey();
  [v15 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v3];

  v4 = +[PTInference ANEConfigForAsynchronousWork];
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v4, "espressoPlanPriority"));
  [v15 setObject:v5 forKeyedSubscript:@"planPriority"];

  v6 = [v4 MLANEExecutionPriority];
  [v15 setObject:v6 forKeyedSubscript:@"MLAneQoS"];

  if (*(unsigned char *)(*(void *)(a1 + 32) + 24))
  {
    v7 = getVCPRequestDisableHandDetectionPropertyKey();
    [v15 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v7];
  }
  else
  {
    v7 = [NSNumber numberWithBool:1];
    v8 = getVCPRequestEnableANSTHandDetectionPropertyKey();
    [v15 setObject:v7 forKeyedSubscript:v8];
  }
  v9 = [NSNumber numberWithInt:(int)*(double *)(a1 + 40)];
  uint64_t v10 = getVCPRequestFrameWidthPropertyKey();
  [v15 setObject:v9 forKeyedSubscript:v10];

  v11 = [NSNumber numberWithInt:(int)*(double *)(a1 + 48)];
  v12 = getVCPRequestFrameHeightPropertyKey();
  [v15 setObject:v11 forKeyedSubscript:v12];

  v13 = *(void **)(a1 + 32);
  v14 = (void *)[objc_alloc((Class)getVCPHandGestureVideoRequestClass()) initWithOptions:v15];
  [v13 setVcpHandGestureRequest:v14];

  kdebug_trace();
}

- (CGSize)frameSize
{
  double width = self->_frameSize.width;
  double height = self->_frameSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

void __126__PTHandGestureDetector_detectGesturesFromBuffer_timeStamp_withRotationDegrees_withDetectedHands_withDetectedFaces_asyncWork___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 32));
  --*(_DWORD *)(*(void *)(a1 + 32) + 28);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 32));
  if (v6)
  {
    v7 = _PTLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __126__PTHandGestureDetector_detectGesturesFromBuffer_timeStamp_withRotationDegrees_withDetectedHands_withDetectedFaces_asyncWork___block_invoke_cold_1(v6, v7);
    }

    v8 = [MEMORY[0x1E4F1CA48] array];
  }
  else
  {
    uint64_t v30 = a1;
    v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v31 = v5;
    obuint64_t j = v5;
    uint64_t v9 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v39;
      unint64_t v12 = 0x1E6883000uLL;
      uint64_t v32 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v39 != v11) {
            objc_enumerationMutation(obj);
          }
          v14 = (void *)[objc_alloc(*(Class *)(v12 + 3520)) initWithVCPHandObservation:*(void *)(*((void *)&v38 + 1) + 8 * i)];
          [v8 addObject:v14];

          id v15 = _PTLogSystem();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            BOOL v16 = *(void **)(v12 + 3520);
            id v37 = [v8 lastObject];
            v34 = objc_msgSend(v16, "gestureTypeToString:", objc_msgSend(v37, "type"));
            v36 = [v8 lastObject];
            v35 = [v36 confidence];
            [v35 floatValue];
            double v18 = v17;
            CGFloat v19 = [v8 lastObject];
            CGFloat v20 = [v19 handID];
            int v21 = [v20 intValue];
            [v8 lastObject];
            v23 = uint64_t v22 = v8;
            [v23 personID];
            id v25 = v24 = v10;
            int v26 = [v25 intValue];
            *(_DWORD *)buf = 138413058;
            *(void *)&uint8_t buf[4] = v34;
            *(_WORD *)&buf[12] = 2048;
            *(double *)&buf[14] = v18;
            *(_WORD *)&buf[22] = 1024;
            int v43 = v21;
            __int16 v44 = 1024;
            int v45 = v26;
            _os_log_impl(&dword_1D0778000, v15, OS_LOG_TYPE_DEFAULT, "GestureDetector: Recieved gesture (type: %@) (confidence: %.2f) (HandID: %i) (PersonID: %i)", buf, 0x22u);

            uint64_t v10 = v24;
            v8 = v22;

            unint64_t v12 = 0x1E6883000;
            uint64_t v11 = v32;
          }
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
      }
      while (v10);
    }

    id v6 = 0;
    id v5 = v31;
    a1 = v30;
  }
  id v27 = [*(id *)(a1 + 32) delegate];
  v28 = v27;
  if (v27)
  {
    *(_OWORD *)buf = *(_OWORD *)(a1 + 40);
    *(void *)&buf[16] = *(void *)(a1 + 56);
    [v27 gesturesAvailable:v8 forTimeStamp:buf];
  }
  else
  {
    v29 = _PTLogSystem();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0778000, v29, OS_LOG_TYPE_INFO, "PTHandGestureDelegate not available to update with new gestures", buf, 2u);
    }
  }
  [v6 code];
  [v8 count];
  kdebug_trace();
}

void __126__PTHandGestureDetector_detectGesturesFromBuffer_timeStamp_withRotationDegrees_withDetectedHands_withDetectedFaces_asyncWork___block_invoke_131(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    CVPixelBufferGetWidth(*(CVPixelBufferRef *)(a1 + 56));
    CVPixelBufferGetHeight(*(CVPixelBufferRef *)(a1 + 56));
    CVPixelBufferGetPixelFormatType(*(CVPixelBufferRef *)(a1 + 56));
    kdebug_trace();
    v3 = (void *)WeakRetained[6];
    uint64_t v4 = *(void *)(a1 + 56);
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    long long v7 = *(_OWORD *)(a1 + 64);
    uint64_t v8 = *(void *)(a1 + 80);
    [v3 processBuffer:v4 timestamp:&v7 withOptions:v5 completion:v6];
  }
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 56));
}

- (PTHandGestureDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PTHandGestureDelegate *)WeakRetained;
}

- (void)setVcpHandGestureRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vcpHandGestureRequest, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

void __126__PTHandGestureDetector_detectGesturesFromBuffer_timeStamp_withRotationDegrees_withDetectedHands_withDetectedFaces_asyncWork___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = [a1 description];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_1D0778000, a2, OS_LOG_TYPE_ERROR, "Error processing gesture request in MediaAnalysis: %@", (uint8_t *)&v4, 0xCu);
}

@end