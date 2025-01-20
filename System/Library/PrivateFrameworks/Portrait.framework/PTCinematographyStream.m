@interface PTCinematographyStream
+ (BOOL)isSupportedVersion:(unint64_t)a3;
+ (unint64_t)latestVersion;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)detectorDidRunNextExpectedTime;
- (BOOL)_detectorDidRunFromFTTrackingResult:(id)a3 time:(id *)a4;
- (BOOL)_hasFusionTrackerMetadata:(id)a3;
- (BOOL)_isFailedTapToTrackFTTapResponse:(id)a3;
- (BOOL)_isFixedFocusFTTapRequest:(id)a3;
- (BOOL)_isFixedFocusFTTapRequestMetadata:(id)a3;
- (BOOL)_isInvalidFTTrack:(id)a3;
- (BOOL)_isSuccessfulTapToTrackFTTapResponse:(id)a3;
- (BOOL)_isTapToTrackFTTapRequest:(id)a3;
- (BOOL)_isUserTap:(id)a3 inFrameDetections:(id)a4;
- (BOOL)_isValidNormalizedPoint:(CGPoint)a3;
- (BOOL)_logUnusualDetection:(id)a3 info:(id)a4;
- (BOOL)_logUnusualDisparity:(float)a3 kind:(id)a4 info:(id)a5;
- (BOOL)_useSyntheticDDR;
- (BOOL)_userTapEndsForBaseFocusDetection:(id)a3;
- (BOOL)_userTapEndsForChangedFocusWithDisparityBuffer:(__CVBuffer *)a3;
- (BOOL)_userTapLockEndsAtTime:(id *)a3;
- (BOOL)autoFocusUseBlurMap;
- (BOOL)autoFocusUseMask;
- (BOOL)canCopyISPDetectionsIfMissing;
- (BOOL)didReadFocusStrategyDefault;
- (BOOL)getGlobalMetadata:(id)a3;
- (CGRect)_autoFocusRectFromMetadata:(id)a3;
- (CGRect)_defaultFixedFocusRectForPoint:(CGPoint)a3 disparityBuffer:(__CVBuffer *)a4;
- (CGRect)_fixedFocusRectForPoint:(CGPoint)a3 disparityBuffer:(__CVBuffer *)a4;
- (CGRect)_validSensorRectFromMetadata:(id)a3;
- (CGSize)_sensorSizeFromMetadata:(id)a3;
- (NSString)internalDefaultNetworkVersion;
- (NSString)modelVersionString;
- (PTCinematographyFocusPuller)previewFocusPuller;
- (PTCinematographyFrame)previousFrame;
- (PTCinematographyNetwork)network;
- (PTCinematographyStream)init;
- (PTCinematographyStream)initWithOptions:(id)a3;
- (PTCinematographyStreamDelegate)delegate;
- (PTCinematographyStreamOptions)options;
- (PTCinematographyTrackAllocator)trackAllocator;
- (PTCinematographyUserTap)activeUserTap;
- (float)_defaultAperture;
- (float)_floatValueForAssignmentString:(id)a3;
- (float)_focusDistanceForAutoFocusDetection:(id)a3 lockedDisparityBufferAddress:(void *)a4 width:(unint64_t)a5 height:(unint64_t)a6 bytesPerRow:(unint64_t)a7 formatType:(unsigned int)a8 focusBlurMap:(id)a9;
- (float)_focusDistanceForDetection:(id)a3 lockedDisparityBufferAddress:(void *)a4 width:(unint64_t)a5 height:(unint64_t)a6 bytesPerRow:(unint64_t)a7 formatType:(unsigned int)a8;
- (float)_minimumUserTapSeconds;
- (float)_userDefaultFixedFocusDisparity;
- (float)internalDefaultFixedFocusDisparity;
- (float)smoothFocusDistance:(float)a3 trackIdentifier:(int64_t)a4 sampleCount:(unint64_t)a5;
- (float)userAperture;
- (id)_ANODPoseFromFTTrackMetadata:(id)a3;
- (id)_autoFocusBlurMapFromMetadata:(id)a3;
- (id)_autoFocusDetectionWithTime:(id *)a3 rect:(CGRect)a4;
- (id)_chooseClosestObjectDetection:(id)a3;
- (id)_chooseFocusDetection:(id)a3;
- (id)_chooseLargestAreaDetection:(id)a3;
- (id)_copyInternalState;
- (id)_copyUserFocusDetectionFromDetections:(id)a3;
- (id)_detectionForFixedFocusAtNormalizedPoint:(CGPoint)a3 disparityBuffer:(__CVBuffer *)a4;
- (id)_detectionForFixedFocusDistance:(float)a3 rect:(CGRect)a4;
- (id)_detectionsFromFTTrackingResult:(id)a3 autoFocusRect:(CGRect)a4 focusBlurMap:(id)a5 namedSignalsPerTrack:(id)a6 time:(id *)a7 disparityBuffer:(__CVBuffer *)a8;
- (id)_disparityWeightingValue;
- (id)_frameDetectionsFromFusionTrackerMetadata:(id)a3 time:(id *)a4 disparityBuffer:(__CVBuffer *)a5;
- (id)_frameDetectionsFromMetadata:(id)a3 time:(id *)a4 disparityBuffer:(__CVBuffer *)a5;
- (id)_frameFromDetections:(id)a3 userAperture:(float)a4 snapshotPolicy:(unint64_t)a5 disparityPixelBuffer:(__CVBuffer *)a6;
- (id)_inFocusRegionForFocusBlurMap:(id)a3;
- (id)_mutableDetectionsFromFTTrackingResult:(id)a3 namedSignalsPerTrack:(id)a4 time:(id *)a5;
- (id)_namedSignals:(id)a3 addingANODPoseFromFTTrackMetadata:(id)a4;
- (id)_nextSnapshotForPolicy:(unint64_t)a3;
- (id)_stringValueForAssignmentString:(id)a3;
- (id)_trackingResultFromFusionTrackerMetadata:(id)a3;
- (id)_userDefaultNetworkVersion;
- (id)_userTapFromFTTapResponse:(id)a3 frameDetections:(id)a4 disparityBuffer:(__CVBuffer *)a5;
- (id)_userTapFromMetadata:(id)a3 frameDetections:(id)a4 disparityBuffer:(__CVBuffer *)a5;
- (id)processColorBuffer:(__CVBuffer *)a3 disparityBuffer:(__CVBuffer *)a4 metadataDictionary:(id)a5 presentationTime:(id *)a6;
- (unint64_t)_detectionTypeForFTObjectKind:(unint64_t)a3;
- (unint64_t)_userDefaultFocusStrategy;
- (unint64_t)activeVersion;
- (unint64_t)autoFocusInFocusRegionSelect;
- (unint64_t)detectionModel;
- (unint64_t)focusBlurMapMode;
- (unint64_t)frameIndex;
- (unint64_t)internalDefaultFocusStrategy;
- (unint64_t)previousRecordingState;
- (void)_copyPreviousISPDetections:(id)a3 toDetections:(id)a4 time:(id *)a5;
- (void)_getFocusStrategyIfNeeded;
- (void)_logFocusChangeForFrame:(id)a3;
- (void)_logUserTap:(id)a3;
- (void)_reset;
- (void)_restoreInternalState:(id)a3;
- (void)_setDisparityOfDetections:(id)a3 disparityBuffer:(__CVBuffer *)a4 focusBlurMap:(id)a5;
- (void)_updateDetectionModelFromMetadata:(id)a3;
- (void)_updateDetections:(id)a3 ifMissingISPDetectionsFromTrackingResult:(id)a4 time:(id *)a5;
- (void)_updateFocusBlurMapModeFromMetadata:(id)a3;
- (void)adviseDidStartRecording;
- (void)adviseDidStopRecording;
- (void)endOfStream;
- (void)setActiveUserTap:(id)a3;
- (void)setAutoFocusInFocusRegionSelect:(unint64_t)a3;
- (void)setAutoFocusUseBlurMap:(BOOL)a3;
- (void)setAutoFocusUseMask:(BOOL)a3;
- (void)setCanCopyISPDetectionsIfMissing:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDetectionModel:(unint64_t)a3;
- (void)setDetectorDidRunNextExpectedTime:(id *)a3;
- (void)setDidReadFocusStrategyDefault:(BOOL)a3;
- (void)setFocusBlurMapMode:(unint64_t)a3;
- (void)setFrameIndex:(unint64_t)a3;
- (void)setInternalDefaultFixedFocusDisparity:(float)a3;
- (void)setInternalDefaultFocusStrategy:(unint64_t)a3;
- (void)setInternalDefaultNetworkVersion:(id)a3;
- (void)setNetwork:(id)a3;
- (void)setOptions:(id)a3;
- (void)setPreviewFocusPuller:(id)a3;
- (void)setPreviousFrame:(id)a3;
- (void)setPreviousRecordingState:(unint64_t)a3;
- (void)setTrackAllocator:(id)a3;
- (void)setUserAperture:(float)a3;
@end

@implementation PTCinematographyStream

- (PTCinematographyStream)init
{
  return [(PTCinematographyStream *)self initWithOptions:0];
}

- (PTCinematographyStream)initWithOptions:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PTCinematographyStream;
  v5 = [(PTCinematographyStream *)&v20 init];
  if (!v5)
  {
LABEL_15:
    v17 = v5;
    goto LABEL_19;
  }
  if (v4) {
    uint64_t v6 = [v4 copy];
  }
  else {
    uint64_t v6 = objc_opt_new();
  }
  options = v5->_options;
  v5->_options = (PTCinematographyStreamOptions *)v6;

  uint64_t v8 = [(PTCinematographyStreamOptions *)v5->_options version];
  if (!v8) {
    uint64_t v8 = [(id)objc_opt_class() latestVersion];
  }
  v5->_activeVersion = v8;
  if ([(id)objc_opt_class() isSupportedVersion:v5->_activeVersion])
  {
    v9 = PTDefaultsGetDictionary();
    v10 = [v9 objectForKeyedSubscript:@"CinematographySnapshotEveryFrame"];

    if (v10) {
      [(PTCinematographyStreamOptions *)v5->_options _setSnapshotPolicy:1];
    }
    v11 = [v4 cinematographyParameters];
    v12 = [v11 objectForKeyedSubscript:@"detectionModel"];
    v5->_detectionModel = [v12 unsignedIntegerValue];

    v13 = [v4 cinematographyParameters];
    v14 = [v13 objectForKeyedSubscript:@"focusBlurMapMode"];
    v5->_focusBlurMapMode = [v14 unsignedIntegerValue];

    v15 = _PTLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[PTCinematographyStream initWithOptions:](&v5->_detectionModel);
    }

    v16 = _PTLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[PTCinematographyStream initWithOptions:](&v5->_focusBlurMapMode);
    }

    [(PTCinematographyStream *)v5 _reset];
    *(_WORD *)&v5->_autoFocusUseBlurMap = 256;
    v5->_autoFocusInFocusRegionSelect = 0;
    goto LABEL_15;
  }
  v18 = _PTLogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    -[PTCinematographyStream initWithOptions:](&v5->_activeVersion);
  }

  v17 = 0;
LABEL_19:

  return v17;
}

- (void)_updateDetectionModelFromMetadata:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 objectForKeyedSubscript:@"CinematographyParameters"];
  v5 = [v4 objectForKeyedSubscript:@"detectionModel"];

  uint64_t v6 = [v5 unsignedIntegerValue];
  if (v6)
  {
    unint64_t v7 = v6;
    if (self->_detectionModel != v6)
    {
      uint64_t v8 = _PTLogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = [NSNumber numberWithUnsignedInteger:self->_detectionModel];
        v10 = [NSNumber numberWithUnsignedInteger:v7];
        int v11 = 138412546;
        v12 = v9;
        __int16 v13 = 2112;
        v14 = v10;
        _os_log_impl(&dword_1D0778000, v8, OS_LOG_TYPE_DEFAULT, "change from detection model %@ to %@", (uint8_t *)&v11, 0x16u);
      }
      self->_detectionModel = v7;
      [(PTCinematographyStream *)self _reset];
    }
  }
}

- (void)_updateFocusBlurMapModeFromMetadata:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 objectForKeyedSubscript:@"CinematographyParameters"];
  v5 = [v4 objectForKeyedSubscript:@"focusBlurMapMode"];

  uint64_t v6 = [v5 unsignedIntegerValue];
  if (v6)
  {
    unint64_t v7 = v6;
    if (self->_focusBlurMapMode != v6)
    {
      uint64_t v8 = _PTLogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = [NSNumber numberWithUnsignedInteger:self->_focusBlurMapMode];
        v10 = [NSNumber numberWithUnsignedInteger:v7];
        int v11 = 138412546;
        v12 = v9;
        __int16 v13 = 2112;
        v14 = v10;
        _os_log_impl(&dword_1D0778000, v8, OS_LOG_TYPE_DEFAULT, "change from focus blur map mode %@ to %@", (uint8_t *)&v11, 0x16u);
      }
      self->_focusBlurMapMode = v7;
    }
  }
}

- (id)processColorBuffer:(__CVBuffer *)a3 disparityBuffer:(__CVBuffer *)a4 metadataDictionary:(id)a5 presentationTime:(id *)a6
{
  id v9 = a5;
  [(PTCinematographyStream *)self _updateDetectionModelFromMetadata:v9];
  [(PTCinematographyStream *)self _updateFocusBlurMapModeFromMetadata:v9];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v20 = *a6;
  v10 = [(PTCinematographyStream *)self _frameDetectionsFromMetadata:v9 time:&v20 disparityBuffer:a4];
  int v11 = [(PTCinematographyStream *)self _userTapFromMetadata:v9 frameDetections:v10 disparityBuffer:a4];

  if (v11)
  {
    [(PTCinematographyStream *)self setActiveUserTap:v11];
    [(PTCinematographyStream *)self _logUserTap:v11];
  }
  [(PTCinematographyStream *)self userAperture];
  int v13 = v12;
  v14 = [(PTCinematographyStream *)self options];
  uint64_t v15 = [v14 _snapshotPolicy];
  LODWORD(v16) = v13;
  v17 = [(PTCinematographyStream *)self _frameFromDetections:v10 userAperture:v15 snapshotPolicy:a4 disparityPixelBuffer:v16];

  [(PTCinematographyStream *)self _logFocusChangeForFrame:v17];
  [v17 focusDistance];
  if (-[PTCinematographyStream _logUnusualDisparity:kind:info:](self, "_logUnusualDisparity:kind:info:", @"frame", @"stream detection"))
  {
    v18 = _PTLogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[PTCinematographyStream processColorBuffer:disparityBuffer:metadataDictionary:presentationTime:]();
    }
  }
  [(PTCinematographyStream *)self setPreviousFrame:v17];

  return v17;
}

- (void)endOfStream
{
  v3 = _PTLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D0778000, v3, OS_LOG_TYPE_INFO, "end of cinematography stream", v5, 2u);
  }

  PTDefaultsFlush(v4);
  [(PTCinematographyStream *)self _reset];
}

- (void)adviseDidStartRecording
{
}

- (void)adviseDidStopRecording
{
}

+ (unint64_t)latestVersion
{
  return 1;
}

+ (BOOL)isSupportedVersion:(unint64_t)a3
{
  return [(id)objc_opt_class() latestVersion] >= a3;
}

- (NSString)modelVersionString
{
  v2 = [(PTCinematographyStream *)self network];
  v3 = [v2 versionString];

  return (NSString *)v3;
}

- (BOOL)getGlobalMetadata:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    [v4 setFocusPullerAlpha:0.0];
    [v4 setFocusPullerMaxV:0.0];
    [v4 setFocusPullerResistance:0.0];
    v5 = objc_alloc_init(PTCinematographyFocusFramesOptions);
    BOOL v6 = [(PTCinematographyFocusFramesOptions *)v5 writeToGlobalMetadata:v4];
  }
  else
  {
    unint64_t v7 = _PTLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[PTCinematographyStream getGlobalMetadata:]();
    }

    BOOL v6 = 0;
  }

  return v6;
}

- (id)_frameFromDetections:(id)a3 userAperture:(float)a4 snapshotPolicy:(unint64_t)a5 disparityPixelBuffer:(__CVBuffer *)a6
{
  v67[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  int v11 = v10;
  long long v65 = 0uLL;
  uint64_t v66 = 0;
  if (v10) {
    [v10 presentationTime];
  }
  v59 = [(PTCinematographyStream *)self _nextSnapshotForPolicy:a5];
  int v12 = [(PTCinematographyStream *)self _chooseFocusDetection:v11];
  uint64_t v13 = [(PTCinematographyStream *)self activeUserTap];

  if (v13)
  {
    v14 = [(PTCinematographyStream *)self activeUserTap];
    uint64_t v15 = [v14 detection];
    if ([v15 isFixedFocusDetection])
    {
    }
    else
    {
      double v16 = [(PTCinematographyStream *)self activeUserTap];
      BOOL v17 = [(PTCinematographyStream *)self _isUserTap:v16 inFrameDetections:v11];

      if (!v17)
      {
        $3CC8671D27C23BF42ADDB32F2B5E48AE v20 = _PTLogSystem();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          v21 = "user focus: no longer detected";
          goto LABEL_15;
        }
LABEL_16:
        uint64_t v13 = 0;
LABEL_17:

        goto LABEL_18;
      }
    }
    v18 = [(PTCinematographyStream *)self activeUserTap];
    if ([v18 isStrong])
    {

      goto LABEL_23;
    }
    *(_OWORD *)buf = v65;
    uint64_t v64 = v66;
    BOOL v19 = [(PTCinematographyStream *)self _userTapLockEndsAtTime:buf];

    if (v19)
    {
      if ([(PTCinematographyStream *)self _userTapEndsForBaseFocusDetection:v12])
      {
        $3CC8671D27C23BF42ADDB32F2B5E48AE v20 = _PTLogSystem();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          v21 = "user focus: base focus changed after user focus lock expired";
LABEL_15:
          _os_log_impl(&dword_1D0778000, v20, OS_LOG_TYPE_INFO, v21, buf, 2u);
          goto LABEL_16;
        }
        goto LABEL_16;
      }
      if ([(PTCinematographyStream *)self _userTapEndsForChangedFocusWithDisparityBuffer:a6])
      {
        $3CC8671D27C23BF42ADDB32F2B5E48AE v20 = _PTLogSystem();
        uint64_t v13 = 1;
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D0778000, v20, OS_LOG_TYPE_INFO, "user focus: fixed focus depth changed after lock expired", buf, 2u);
        }
        goto LABEL_17;
      }
    }
LABEL_23:
    v25 = [(PTCinematographyStream *)self activeUserTap];
    v26 = [v25 detection];
    int v27 = [v26 isFixedFocusDetection];

    if (v27)
    {
      v28 = [(PTCinematographyStream *)self activeUserTap];
      v29 = [v28 detection];
      v30 = (void *)[v29 copy];

      if (v11) {
        [v11 presentationTime];
      }
      else {
        memset(v62, 0, sizeof(v62));
      }
      v31 = [v30 _detectionByChangingTime:v62];

      [v11 addDetection:v31];
    }
    id v22 = [(PTCinematographyStream *)self _copyUserFocusDetectionFromDetections:v11];
    uint64_t v13 = 0;
    if (!v22) {
      goto LABEL_29;
    }
LABEL_19:
    [v22 focusDistance];
    unsigned int v24 = v23;
    goto LABEL_30;
  }
LABEL_18:
  id v22 = v12;
  [(PTCinematographyStream *)self setActiveUserTap:0];
  if (v22) {
    goto LABEL_19;
  }
LABEL_29:
  unsigned int v24 = 0;
LABEL_30:
  previewFocusPuller = self->_previewFocusPuller;
  unsigned int v33 = v24;
  if (previewFocusPuller)
  {
    *(_OWORD *)buf = v65;
    uint64_t v64 = v66;
    [(PTCinematographyFocusPuller *)previewFocusPuller pullTowardFocusDistance:buf time:v22 == 0 missing:COERCE_DOUBLE(__PAIR64__(DWORD1(v65), v24))];
    unsigned int v33 = v34;
  }
  v35 = objc_alloc_init(PTCinematographyFrame);
  long long v60 = v65;
  uint64_t v61 = v66;
  [(PTCinematographyFrame *)v35 setTime:&v60];
  v36 = [v11 detections];
  v37 = (void *)[v36 copy];
  [(PTCinematographyFrame *)v35 setAllDetections:v37];

  [(PTCinematographyFrame *)v35 setFocusDetection:v22];
  *(float *)&double v38 = a4;
  [(PTCinematographyFrame *)v35 setAperture:v38];
  LODWORD(v39) = v33;
  [(PTCinematographyFrame *)v35 setFocusDistance:v39];
  LODWORD(v40) = v24;
  [(PTCinematographyFrame *)v35 setRawFocusDistance:v40];
  v41 = [v22 trackNumber];
  [(PTCinematographyFrame *)v35 setFocusTrackNumber:v41];

  if (v12)
  {
    v42 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v12, "trackIdentifier", v12));
    [(PTCinematographyFrame *)v35 setBaseFocusTrackNumber:v42];
  }
  else
  {
    -[PTCinematographyFrame setBaseFocusTrackNumber:](v35, "setBaseFocusTrackNumber:", 0, 0);
  }
  unint64_t v43 = a5;
  v44 = [(PTCinematographyStream *)self activeUserTap];
  if (v44)
  {
    v45 = NSNumber;
    v46 = [(PTCinematographyStream *)self activeUserTap];
    v47 = objc_msgSend(v45, "numberWithInteger:", objc_msgSend(v46, "trackIdentifier"));
    [(PTCinematographyFrame *)v35 setUserFocusTrackNumber:v47];
  }
  else
  {
    [(PTCinematographyFrame *)v35 setUserFocusTrackNumber:0];
  }

  v48 = [v11 detectorDidRun];
  [(PTCinematographyFrame *)v35 _setDetectorDidRun:v48];

  v49 = [(PTCinematographyStream *)self activeUserTap];
  -[PTCinematographyFrame setUserFocusStrong:](v35, "setUserFocusStrong:", [v49 isStrong]);

  v50 = [(PTCinematographyStream *)self activeUserTap];
  -[PTCinematographyFrame setUserFocusGroup:](v35, "setUserFocusGroup:", [v50 isGroupTap]);

  [(PTCinematographyFrame *)v35 setUserFocusEnd:v13];
  v51 = NSNumber;
  unint64_t v52 = [(PTCinematographyStream *)self frameIndex];
  [(PTCinematographyStream *)self setFrameIndex:v52 + 1];
  v53 = [v51 numberWithUnsignedInteger:v52];
  [(PTCinematographyFrame *)v35 _setFrameNumber:v53];

  [(PTCinematographyFrame *)v35 _setSnapshot:v59];
  [(PTCinematographyFrame *)v35 _setSnapshotPolicy:v43];
  v54 = _PTLogSystem();
  BOOL v55 = os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG);

  if (v55)
  {
    v67[0] = v35;
    v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:1];
    +[PTCinematographyFrame _debugLogFrames:v56 label:@"Raw Cinematography"];
  }

  return v35;
}

- (id)_copyUserFocusDetectionFromDetections:(id)a3
{
  id v4 = a3;
  v5 = [(PTCinematographyStream *)self activeUserTap];
  int v6 = [v5 isGroupTap];

  unint64_t v7 = [(PTCinematographyStream *)self activeUserTap];
  uint64_t v8 = v7;
  if (v6)
  {
    uint64_t v9 = [v7 groupIdentifier];

    id v10 = [v4 bestDetectionForGroupIdentifier:v9 options:1];

    if (!v10)
    {
      int v11 = _PTLogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[PTCinematographyStream _copyUserFocusDetectionFromDetections:]();
      }
LABEL_8:

      id v10 = 0;
    }
  }
  else
  {
    uint64_t v12 = [v7 trackIdentifier];

    id v10 = [v4 detectionForTrackIdentifier:v12];

    if (!v10)
    {
      int v11 = _PTLogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[PTCinematographyStream _copyUserFocusDetectionFromDetections:]();
      }
      goto LABEL_8;
    }
  }
  uint64_t v13 = (void *)[v10 copy];

  return v13;
}

- (id)_copyInternalState
{
  id v3 = objc_opt_new();
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PTCinematographyStream activeVersion](self, "activeVersion"));
  [v3 setObject:v4 forKeyedSubscript:@"_version"];

  v5 = NSNumber;
  [(PTCinematographyStream *)self userAperture];
  int v6 = objc_msgSend(v5, "numberWithFloat:");
  [v3 setObject:v6 forKeyedSubscript:@"user_aperture"];

  unint64_t v7 = [(PTCinematographyStream *)self previewFocusPuller];
  uint64_t v8 = [v7 _asCinematographyDictionary];
  [v3 setObject:v8 forKeyedSubscript:@"focus_puller"];

  uint64_t v9 = [(PTCinematographyStream *)self network];
  id v10 = [v9 _asCinematographyDictionary];
  [v3 setObject:v10 forKeyedSubscript:@"_network_state"];

  int v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PTCinematographyStream frameIndex](self, "frameIndex"));
  [v3 setObject:v11 forKeyedSubscript:@"_frame_index"];

  uint64_t v12 = [(PTCinematographyStream *)self previousFrame];
  uint64_t v13 = [v12 _asCinematographyDictionary];
  v14 = (void *)[v13 mutableCopy];

  [v14 removeObjectForKey:@"_snapshot"];
  [v3 setObject:v14 forKeyedSubscript:@"_previous_frame_serialized"];
  uint64_t v15 = (void *)[v3 copy];

  return v15;
}

- (void)_restoreInternalState:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = v4;
    int v6 = [v5 objectForKeyedSubscript:@"_version"];
    unint64_t v7 = [v6 unsignedIntegerValue];

    if ([(id)objc_opt_class() isSupportedVersion:v7])
    {
      self->_activeVersion = v7;
      uint64_t v8 = [v5 objectForKeyedSubscript:@"user_aperture"];
      [v8 floatValue];
      -[PTCinematographyStream setUserAperture:](self, "setUserAperture:");

      uint64_t v9 = [v5 objectForKeyedSubscript:@"_frame_index"];
      -[PTCinematographyStream setFrameIndex:](self, "setFrameIndex:", [v9 unsignedIntegerValue]);

      id v10 = [v5 objectForKeyedSubscript:@"_previous_frame_serialized"];
      if (v10)
      {
        id v11 = [[PTCinematographyFrame alloc] _initWithCinematographyDictionary:v10];
        [(PTCinematographyStream *)self setPreviousFrame:v11];
      }
      else
      {
        [(PTCinematographyStream *)self setPreviousFrame:0];
      }
      uint64_t v12 = [v5 objectForKeyedSubscript:@"focus_puller"];
      if (v12)
      {
        id v13 = [[PTCinematographyFocusPuller alloc] _initWithCinematographyDictionary:v12];
        [(PTCinematographyStream *)self setPreviewFocusPuller:v13];
      }
      else
      {
        [(PTCinematographyStream *)self setPreviewFocusPuller:0];
      }
      v14 = [v5 objectForKeyedSubscript:@"_network_state"];
      if (v14)
      {
        uint64_t v15 = [[PTCinematographyNetwork alloc] _initWithCinematographyDictionary:v14];
        if (v15)
        {
          objc_storeStrong((id *)&self->_network, v15);
          double v16 = _PTLogSystem();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            BOOL v17 = [v15 versionString];
            int v18 = 138412290;
            BOOL v19 = v17;
            _os_log_impl(&dword_1D0778000, v16, OS_LOG_TYPE_INFO, "Cinematography network version %@ (restored)", (uint8_t *)&v18, 0xCu);
          }
        }
        else
        {
          double v16 = _PTLogSystem();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            -[PTCinematographyStream _restoreInternalState:]();
          }
        }
      }
      else
      {
        uint64_t v15 = _PTLogSystem();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          -[PTCinematographyStream _restoreInternalState:]();
        }
      }
    }
    else
    {
      id v10 = _PTLogSystem();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[PTCinematographyStream _restoreInternalState:]();
      }
    }
  }
  else
  {
    v5 = _PTLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[PTCinematographyStream _restoreInternalState:].cold.4();
    }
  }
}

- (id)_nextSnapshotForPolicy:(unint64_t)a3
{
  unint64_t v5 = [(PTCinematographyStream *)self previousRecordingState];
  if (v5 == 2)
  {
    if ((a3 | 2) != 2) {
      goto LABEL_8;
    }
LABEL_6:
    id v6 = 0;
    goto LABEL_9;
  }
  if (v5 != 1)
  {
    if (a3 != 2) {
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (a3 == 2) {
    goto LABEL_6;
  }
  [(PTCinematographyStream *)self setPreviousRecordingState:2];
LABEL_8:
  id v6 = [(PTCinematographyStream *)self _copyInternalState];
LABEL_9:

  return v6;
}

- (float)_defaultAperture
{
  if (_defaultAperture_onceToken != -1) {
    dispatch_once(&_defaultAperture_onceToken, &__block_literal_global_0);
  }
  return *(float *)&_defaultAperture_sDefaultAperture;
}

void __42__PTCinematographyStream__defaultAperture__block_invoke()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  _defaultAperture_sDefaultAperture = 1082130432;
  v0 = _PTLogSystem();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 134217984;
    uint64_t v2 = 0x4010000000000000;
    _os_log_impl(&dword_1D0778000, v0, OS_LOG_TYPE_DEFAULT, "CinematographyAperture: %g", (uint8_t *)&v1, 0xCu);
  }
}

- (void)_reset
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [(PTCinematographyStream *)self _defaultAperture];
  self->_userAperture = v3;
  id v4 = [[PTCinematographyTrackAllocator alloc] initWithTrackIdentifier:0x1100000000];
  trackAllocator = self->_trackAllocator;
  self->_trackAllocator = v4;

  id v6 = objc_alloc_init(PTCinematographyFocusPuller);
  previewFocusPuller = self->_previewFocusPuller;
  self->_previewFocusPuller = v6;

  uint64_t v8 = [(PTCinematographyStream *)self _userDefaultNetworkVersion];
  if (!v8)
  {
    uint64_t v8 = +[PTCinematographyNetwork defaultVersionStringForDetectionModel:self->_detectionModel];
  }
  uint64_t v9 = [[PTCinematographyNetwork alloc] initWithVersionString:v8];
  network = self->_network;
  self->_network = v9;

  self->_frameIndex = 0;
  previousFrame = self->_previousFrame;
  self->_previousFrame = 0;

  [(PTCinematographyStream *)self setPreviousRecordingState:0];
  uint64_t v12 = _PTLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = [(PTCinematographyStream *)self network];
    v14 = [v13 versionString];
    int v17 = 138412290;
    int v18 = v14;
    _os_log_impl(&dword_1D0778000, v12, OS_LOG_TYPE_INFO, "Cinematography network version %@", (uint8_t *)&v17, 0xCu);
  }
  uint64_t v15 = _PTLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    double v16 = [(PTCinematographyFocusPuller *)self->_previewFocusPuller _asCinematographyDictionary];
    int v17 = 138412290;
    int v18 = v16;
    _os_log_impl(&dword_1D0778000, v15, OS_LOG_TYPE_INFO, "focus puller: %@", (uint8_t *)&v17, 0xCu);
  }
}

- (id)_chooseClosestObjectDetection:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v16;
    float v8 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v3);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        [v10 focusDistance];
        if (v8 < v11)
        {
          float v12 = v11;
          id v13 = v10;

          float v8 = v12;
          id v6 = v13;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_chooseLargestAreaDetection:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v19;
    float v8 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v3);
        }
        id v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        [v10 rect];
        float Area = CGRectGetArea(v11, v12, v13, v14);
        if (v8 < Area)
        {
          id v16 = v10;

          float v8 = Area;
          id v6 = v16;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v5);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_detectionForFixedFocusDistance:(float)a3 rect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v10 = [PTCinematographyDetection alloc];
  long long v15 = *MEMORY[0x1E4F1F9F0];
  uint64_t v16 = *(void *)(MEMORY[0x1E4F1F9F0] + 16);
  *(float *)&double v11 = a3;
  CGFloat v12 = -[PTCinematographyDetection initWithTime:rect:focusDistance:](v10, "initWithTime:rect:focusDistance:", &v15, x, y, width, height, v11);
  [(PTCinematographyDetection *)v12 setDetectionType:101];
  CGFloat v13 = [(PTCinematographyStream *)self trackAllocator];
  -[PTCinematographyDetection setTrackIdentifier:](v12, "setTrackIdentifier:", [v13 nextTrackIdentifier]);

  return v12;
}

- (float)_floatValueForAssignmentString:(id)a3
{
  id v3 = [a3 componentsSeparatedByString:@"="];
  float v4 = 0.0;
  if ((unint64_t)[v3 count] >= 2)
  {
    uint64_t v5 = [v3 objectAtIndexedSubscript:1];
    [v5 floatValue];
    float v4 = v6;
  }
  return v4;
}

- (id)_stringValueForAssignmentString:(id)a3
{
  id v3 = [a3 componentsSeparatedByString:@"="];
  if ((unint64_t)[v3 count] < 2)
  {
    float v4 = 0;
  }
  else
  {
    float v4 = [v3 objectAtIndexedSubscript:1];
  }

  return v4;
}

- (void)_getFocusStrategyIfNeeded
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (![(PTCinematographyStream *)self didReadFocusStrategyDefault])
  {
    [(PTCinematographyStream *)self setDidReadFocusStrategyDefault:1];
    id v3 = PTDefaultsGetDictionary();
    float v4 = [v3 objectForKeyedSubscript:@"CinematographyFocus"];

    if (v4)
    {
      uint64_t v5 = _PTLogSystem();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v9 = 138412290;
        id v10 = v4;
        _os_log_impl(&dword_1D0778000, v5, OS_LOG_TYPE_INFO, "defaults: CinematographyFocus %@", (uint8_t *)&v9, 0xCu);
      }

      if ([v4 hasPrefix:@"network"])
      {
        [(PTCinematographyStream *)self setInternalDefaultFocusStrategy:0];
        float v6 = [(PTCinematographyStream *)self _stringValueForAssignmentString:v4];
        [(PTCinematographyStream *)self setInternalDefaultNetworkVersion:v6];
      }
      else
      {
        if (![v4 hasPrefix:@"fixed"])
        {
          if ([v4 isEqualToString:@"closest"])
          {
            uint64_t v7 = self;
            uint64_t v8 = 2;
          }
          else
          {
            if (![v4 isEqualToString:@"largest"]) {
              goto LABEL_14;
            }
            uint64_t v7 = self;
            uint64_t v8 = 3;
          }
          [(PTCinematographyStream *)v7 setInternalDefaultFocusStrategy:v8];
          goto LABEL_14;
        }
        [(PTCinematographyStream *)self setInternalDefaultFocusStrategy:1];
        [(PTCinematographyStream *)self _floatValueForAssignmentString:v4];
        -[PTCinematographyStream setInternalDefaultFixedFocusDisparity:](self, "setInternalDefaultFixedFocusDisparity:");
      }
    }
LABEL_14:
  }
}

- (unint64_t)_userDefaultFocusStrategy
{
  [(PTCinematographyStream *)self _getFocusStrategyIfNeeded];

  return [(PTCinematographyStream *)self internalDefaultFocusStrategy];
}

- (id)_userDefaultNetworkVersion
{
  [(PTCinematographyStream *)self _getFocusStrategyIfNeeded];

  return [(PTCinematographyStream *)self internalDefaultNetworkVersion];
}

- (float)_userDefaultFixedFocusDisparity
{
  [(PTCinematographyStream *)self _getFocusStrategyIfNeeded];

  [(PTCinematographyStream *)self internalDefaultFixedFocusDisparity];
  return result;
}

- (id)_chooseFocusDetection:(id)a3
{
  id v4 = a3;
  switch([(PTCinematographyStream *)self _userDefaultFocusStrategy])
  {
    case 0uLL:
      uint64_t v5 = [(PTCinematographyStream *)self network];
      uint64_t v6 = [v5 stepWithFrameDetections:v4];
      goto LABEL_7;
    case 1uLL:
      [(PTCinematographyStream *)self _userDefaultFixedFocusDisparity];
      uint64_t v7 = -[PTCinematographyStream _detectionForFixedFocusDistance:rect:](self, "_detectionForFixedFocusDistance:rect:");
      break;
    case 2uLL:
      uint64_t v5 = [v4 detections];
      uint64_t v6 = [(PTCinematographyStream *)self _chooseClosestObjectDetection:v5];
      goto LABEL_7;
    case 3uLL:
      uint64_t v5 = [v4 detections];
      uint64_t v6 = [(PTCinematographyStream *)self _chooseLargestAreaDetection:v5];
LABEL_7:
      uint64_t v7 = (void *)v6;

      break;
    default:
      uint64_t v7 = 0;
      break;
  }
  uint64_t v8 = [v4 baseFocusTrackNumberOverride];

  if (v8)
  {
    int v9 = [v4 baseFocusTrackNumberOverride];
    uint64_t v10 = [v9 integerValue];

    uint64_t v11 = [v4 detectionForTrackIdentifier:v10];

    uint64_t v7 = (void *)v11;
  }

  return v7;
}

- (float)_minimumUserTapSeconds
{
  if (_minimumUserTapSeconds_onceToken != -1) {
    dispatch_once(&_minimumUserTapSeconds_onceToken, &__block_literal_global_164);
  }
  return *(float *)&_minimumUserTapSeconds_sMinimumUserTapSeconds;
}

void __48__PTCinematographyStream__minimumUserTapSeconds__block_invoke()
{
  _minimumUserTapSeconds_sMinimumUserTapSeconds = 0x40000000;
}

- (BOOL)_userTapLockEndsAtTime:(id *)a3
{
  uint64_t v5 = [(PTCinematographyStream *)self activeUserTap];
  uint64_t v6 = v5;
  if (v5) {
    [v5 time];
  }
  else {
    memset(&rhs, 0, sizeof(rhs));
  }
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11 = *a3;
  CMTimeSubtract(&time, (CMTime *)&v11, &rhs);
  double Seconds = CMTimeGetSeconds(&time);
  [(PTCinematographyStream *)self _minimumUserTapSeconds];
  BOOL v9 = Seconds >= v8;

  return v9;
}

- (BOOL)_userTapEndsForChangedFocusWithDisparityBuffer:(__CVBuffer *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (_userTapEndsForChangedFocusWithDisparityBuffer__onceToken != -1)
  {
    dispatch_once(&_userTapEndsForChangedFocusWithDisparityBuffer__onceToken, &__block_literal_global_166);
    if (a3) {
      goto LABEL_3;
    }
    return 0;
  }
  if (!a3) {
    return 0;
  }
LABEL_3:
  if (0xCCCCCCCCCCCCCCCDLL * [(PTCinematographyStream *)self frameIndex] > 0x3333333333333333) {
    return 0;
  }
  uint64_t v5 = [(PTCinematographyStream *)self activeUserTap];
  uint64_t v6 = [v5 detection];
  int v7 = [v6 isFixedFocusDetection];

  if (!v7) {
    return 0;
  }
  float v8 = [(PTCinematographyStream *)self activeUserTap];
  BOOL v9 = [v8 detection];
  [v9 rect];
  float v14 = PTDisparityInNormalizedRectFromPixelBuffer(101, a3, v10, v11, v12, v13);

  long long v15 = [(PTCinematographyStream *)self activeUserTap];
  uint64_t v16 = [v15 detection];
  [v16 focusDistance];
  float v18 = fabsf((float)(v17 / fmaxf(v14, 0.0001)) + -1.0);

  if (v18 <= *(float *)&_userTapEndsForChangedFocusWithDisparityBuffer__sSoftFixedFocusTerminateThreshold) {
    return 0;
  }
  long long v19 = _PTLogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    long long v21 = [(PTCinematographyStream *)self activeUserTap];
    id v22 = [(PTCinematographyStream *)self activeUserTap];
    uint64_t v23 = [v22 detection];
    [v23 focusDistance];
    int v25 = 138413058;
    v26 = v21;
    __int16 v27 = 2048;
    double v28 = (float)(v18 * 100.0);
    __int16 v29 = 2048;
    double v30 = v24;
    __int16 v31 = 2048;
    double v32 = v14;
    _os_log_debug_impl(&dword_1D0778000, v19, OS_LOG_TYPE_DEBUG, "user tap %@ ends due to depth change of %.1f%% (from disparity %.3f to %.3f)", (uint8_t *)&v25, 0x2Au);
  }
  return 1;
}

void __73__PTCinematographyStream__userTapEndsForChangedFocusWithDisparityBuffer___block_invoke()
{
  _userTapEndsForChangedFocusWithDisparityBuffer__sSoftFixedFocusTerminateThreshold = 1036831949;
}

- (BOOL)_userTapEndsForBaseFocusDetection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 trackNumber];
  uint64_t v6 = [v4 groupIdentifier];

  if (PTGroupIDIsValid(v6))
  {
    int v7 = [(PTCinematographyStream *)self previousFrame];
    float v8 = [(PTCinematographyStream *)self previousFrame];
    BOOL v9 = [v8 baseFocusTrackNumber];
    double v10 = [v7 detectionForTrackNumber:v9];

    if (v6 == [v10 groupIdentifier])
    {

      goto LABEL_6;
    }
    double v11 = [(PTCinematographyStream *)self activeUserTap];
    uint64_t v12 = [v11 groupIdentifier];

    if (v6 == v12) {
      goto LABEL_6;
    }
  }
  double v13 = [(PTCinematographyStream *)self previousFrame];
  float v14 = [v13 baseFocusTrackNumber];
  char v15 = [v5 isEqualToNumber:v14];

  if ((v15 & 1) == 0)
  {
    float v17 = [(PTCinematographyStream *)self activeUserTap];
    float v18 = [v17 trackNumber];
    char v19 = [v5 isEqualToNumber:v18];

    char v16 = v19 ^ 1;
    goto LABEL_8;
  }
LABEL_6:
  char v16 = 0;
LABEL_8:

  return v16;
}

- (id)_userTapFromMetadata:(id)a3 frameDetections:(id)a4 disparityBuffer:(__CVBuffer *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([(PTCinematographyStream *)self _hasFusionTrackerMetadata:v8])
  {
    double v10 = [(PTCinematographyStream *)self _trackingResultFromFusionTrackerMetadata:v8];
    double v11 = [v10 tapResponse];
    uint64_t v12 = [(PTCinematographyStream *)self _userTapFromFTTapResponse:v11 frameDetections:v9 disparityBuffer:a5];
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (BOOL)_isValidNormalizedPoint:(CGPoint)a3
{
  BOOL v3 = a3.x >= 0.0;
  if (a3.x > 1.0) {
    BOOL v3 = 0;
  }
  if (a3.y < 0.0) {
    BOOL v3 = 0;
  }
  return a3.y <= 1.0 && v3;
}

- (BOOL)_isFixedFocusFTTapRequestMetadata:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:PTCinematographyTapRequestIsFixedPlaneFocus];
  if ([v4 BOOLValue])
  {
    char v5 = 1;
  }
  else
  {
    uint64_t v6 = [v3 objectForKeyedSubscript:@"isFixedFocus"];
    char v5 = [v6 BOOLValue];
  }
  return v5;
}

- (BOOL)_isFixedFocusFTTapRequest:(id)a3
{
  id v4 = a3;
  char v5 = [v4 metadata];
  if ([(PTCinematographyStream *)self _isFixedFocusFTTapRequestMetadata:v5])
  {
    [v4 tapPoint];
    BOOL v6 = -[PTCinematographyStream _isValidNormalizedPoint:](self, "_isValidNormalizedPoint:");
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_isTapToTrackFTTapRequest:(id)a3
{
  id v4 = a3;
  char v5 = [v4 metadata];
  if ([(PTCinematographyStream *)self _isFixedFocusFTTapRequestMetadata:v5])
  {
    BOOL v6 = 0;
  }
  else
  {
    [v4 tapPoint];
    BOOL v6 = -[PTCinematographyStream _isValidNormalizedPoint:](self, "_isValidNormalizedPoint:");
  }

  return v6;
}

- (BOOL)_isSuccessfulTapToTrackFTTapResponse:(id)a3
{
  id v4 = a3;
  if ([v4 wasSuccessful])
  {
    char v5 = [v4 request];
    BOOL v6 = [(PTCinematographyStream *)self _isTapToTrackFTTapRequest:v5];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_isFailedTapToTrackFTTapResponse:(id)a3
{
  id v4 = a3;
  if ([v4 wasSuccessful])
  {
    BOOL v5 = 0;
  }
  else
  {
    BOOL v6 = [v4 request];
    BOOL v5 = [(PTCinematographyStream *)self _isTapToTrackFTTapRequest:v6];
  }
  return v5;
}

- (CGRect)_fixedFocusRectForPoint:(CGPoint)a3 disparityBuffer:(__CVBuffer *)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = [(PTCinematographyStream *)self options];
  [v8 fixedFocusNormalizedRectSize];
  double v10 = v9;
  double v12 = v11;

  BOOL v13 = v10 <= 0.0 || v10 > 1.0;
  if (v13 || (v12 > 0.0 ? (BOOL v14 = v12 > 1.0) : (BOOL v14 = 1), v14))
  {
    -[PTCinematographyStream _defaultFixedFocusRectForPoint:disparityBuffer:](self, "_defaultFixedFocusRectForPoint:disparityBuffer:", a4, x, y);
    double v10 = v17;
    double v12 = v18;
  }
  else
  {
    double v15 = x - v10 * 0.5;
    double v16 = y - v12 * 0.5;
  }
  double v19 = v10;
  double v20 = v12;
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.double y = v16;
  result.origin.double x = v15;
  return result;
}

- (CGRect)_defaultFixedFocusRectForPoint:(CGPoint)a3 disparityBuffer:(__CVBuffer *)a4
{
  double y = a3.y;
  double x = a3.x;
  double Width = (double)CVPixelBufferGetWidth(a4);
  double Height = (double)CVPixelBufferGetHeight(a4);
  double v9 = 0.125;
  double v10 = 0.125;
  if (Width > Height) {
    double v10 = Height * 0.125 / Width;
  }
  if (Width < Height) {
    double v9 = Width * 0.125 / Height;
  }
  double v11 = x - v10 * 0.5;
  double v12 = y - v9 * 0.5;
  result.size.double height = v9;
  result.size.double width = v10;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (id)_detectionForFixedFocusAtNormalizedPoint:(CGPoint)a3 disparityBuffer:(__CVBuffer *)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  -[PTCinematographyStream _fixedFocusRectForPoint:disparityBuffer:](self, "_fixedFocusRectForPoint:disparityBuffer:");
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  float v16 = PTDisparityInNormalizedRectFromPixelBuffer(101, a4, v8, v10, v12, v14);
  double v17 = _PTLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v33.CGFloat x = x;
    v33.CGFloat y = y;
    double v18 = NSStringFromPoint(v33);
    v34.origin.CGFloat x = v9;
    v34.origin.CGFloat y = v11;
    v34.size.double width = v13;
    v34.size.double height = v15;
    double v19 = NSStringFromRect(v34);
    *(float *)&double v20 = v16;
    long long v21 = [NSNumber numberWithFloat:v20];
    int v25 = 138412802;
    v26 = v18;
    __int16 v27 = 2112;
    double v28 = v19;
    __int16 v29 = 2112;
    double v30 = v21;
    _os_log_impl(&dword_1D0778000, v17, OS_LOG_TYPE_DEFAULT, "fixed focus user tap at point %@ (rect %@; disparity %@)",
      (uint8_t *)&v25,
      0x20u);
  }
  *(float *)&double v22 = v16;
  uint64_t v23 = -[PTCinematographyStream _detectionForFixedFocusDistance:rect:](self, "_detectionForFixedFocusDistance:rect:", v22, v9, v11, v13, v15);

  return v23;
}

- (id)_userTapFromFTTapResponse:(id)a3 frameDetections:(id)a4 disparityBuffer:(__CVBuffer *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v8) {
    goto LABEL_8;
  }
  double v10 = [v8 request];
  double v11 = v10;
  if (!v10)
  {
    double v13 = _PTLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[PTCinematographyStream _userTapFromFTTapResponse:frameDetections:disparityBuffer:]();
    }
    goto LABEL_7;
  }
  if (([v10 trackId] & 0x8000000000000000) == 0)
  {
    uint64_t v12 = objc_msgSend(v9, "detectionForTrackIdentifier:", objc_msgSend(v11, "trackId"));
LABEL_12:
    double v14 = (void *)v12;
    goto LABEL_13;
  }
  if ([(PTCinematographyStream *)self _isSuccessfulTapToTrackFTTapResponse:v8])
  {
    uint64_t v12 = [v9 customDetection];
    goto LABEL_12;
  }
  if (![(PTCinematographyStream *)self _isFixedFocusFTTapRequest:v11]
    && ![(PTCinematographyStream *)self _isFailedTapToTrackFTTapResponse:v8])
  {
    double v13 = _PTLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[PTCinematographyStream _userTapFromFTTapResponse:frameDetections:disparityBuffer:]();
    }
LABEL_7:

LABEL_8:
    double v14 = 0;
    goto LABEL_9;
  }
  [v11 tapPoint];
  double v14 = -[PTCinematographyStream _detectionForFixedFocusAtNormalizedPoint:disparityBuffer:](self, "_detectionForFixedFocusAtNormalizedPoint:disparityBuffer:", a5);
  [v9 addDetection:v14];
LABEL_13:

  if (v14)
  {
    float v16 = [v8 request];
    double v17 = [v16 metadata];
    double v18 = [v17 objectForKeyedSubscript:PTCinematographyTapRequestIsHardFocus];
    uint64_t v19 = [v18 BOOLValue];

    BOOL v20 = PTGroupIDIsValid([v14 groupIdentifier]);
    long long v21 = [PTCinematographyUserTap alloc];
    if (v9) {
      [v9 presentationTime];
    }
    else {
      memset(v23, 0, sizeof(v23));
    }
    double v15 = [(PTCinematographyUserTap *)v21 initWithTime:v23 tappedDetection:v14 strong:v19 group:v20];
    goto LABEL_18;
  }
LABEL_9:
  double v15 = 0;
LABEL_18:

  return v15;
}

- (BOOL)_isUserTap:(id)a3 inFrameDetections:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isGroupTap])
  {
    int v7 = objc_msgSend(v6, "bestDetectionForGroupIdentifier:options:", objc_msgSend(v5, "groupIdentifier"), 1);

    BOOL v8 = v7 != 0;
  }
  else
  {
    int v7 = objc_msgSend(v6, "detectionForTrackIdentifier:", objc_msgSend(v5, "trackIdentifier"));

    if (v7)
    {
      if (![v7 _isExcludedAsCinematicChoice])
      {
        BOOL v8 = 1;
        goto LABEL_10;
      }
      id v9 = _PTLogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[PTCinematographyStream _isUserTap:inFrameDetections:]();
      }
    }
    BOOL v8 = 0;
  }
LABEL_10:

  return v8;
}

- (id)_frameDetectionsFromMetadata:(id)a3 time:(id *)a4 disparityBuffer:(__CVBuffer *)a5
{
  id v8 = a3;
  if (![(PTCinematographyStream *)self _hasFusionTrackerMetadata:v8])
  {
    id v9 = _PTLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[PTCinematographyStream _frameDetectionsFromMetadata:time:disparityBuffer:]();
    }
  }
  long long v13 = *(_OWORD *)&a4->var0;
  int64_t var3 = a4->var3;
  double v10 = [(PTCinematographyStream *)self _frameDetectionsFromFusionTrackerMetadata:v8 time:&v13 disparityBuffer:a5];
  double v11 = [v8 objectForKeyedSubscript:@"__BaseFocusTrackNumberOverride"];

  [v10 setBaseFocusTrackNumberOverride:v11];

  return v10;
}

- (BOOL)_hasFusionTrackerMetadata:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"FTCinematicTrackingResult"];
  if (v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    id v6 = [v3 objectForKeyedSubscript:@"FTTrackingResult"];
    BOOL v5 = v6 != 0;
  }
  return v5;
}

- (id)_trackingResultFromFusionTrackerMetadata:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"FTCinematicTrackingResult"];
  if (!v4)
  {
    id v4 = [v3 objectForKeyedSubscript:@"FTTrackingResult"];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)_useSyntheticDDR
{
  if (_useSyntheticDDR_onceToken != -1) {
    dispatch_once(&_useSyntheticDDR_onceToken, &__block_literal_global_170);
  }
  return 0;
}

- (BOOL)_detectorDidRunFromFTTrackingResult:(id)a3 time:(id *)a4
{
  id v6 = a3;
  if ([(PTCinematographyStream *)self _useSyntheticDDR])
  {
    int v7 = [(PTCinematographyStream *)self previousFrame];

    if (v7)
    {
      memset(&v25, 0, sizeof(v25));
      id v8 = [(PTCinematographyStream *)self previousFrame];
      id v9 = v8;
      if (v8) {
        [v8 time];
      }
      else {
        memset(&rhs, 0, sizeof(rhs));
      }
      CMTime lhs = (CMTime)*a4;
      CMTimeSubtract(&v25, &lhs, &rhs);

      CMTime time = v25;
      CMTimeMultiplyByRatio(&lhs, &time, 1, 4);
      CMTime v25 = lhs;
      memset(&lhs, 0, sizeof(lhs));
      [(PTCinematographyStream *)self detectorDidRunNextExpectedTime];
      CMTime time = v25;
      CMTimeSubtract(&lhs, &v21, &time);
      CMTime time = (CMTime)*a4;
      CMTime time2 = lhs;
      if (CMTimeCompare(&time, &time2) < 0)
      {
        char v10 = 0;
LABEL_17:
        uint64_t v12 = _PTLogSystem();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          -[PTCinematographyStream _detectorDidRunFromFTTrackingResult:time:](v10, v12);
        }
LABEL_19:

        goto LABEL_20;
      }
    }
    else
    {
      long long v26 = *(_OWORD *)&a4->var0;
      int64_t var3 = a4->var3;
      [(PTCinematographyStream *)self setDetectorDidRunNextExpectedTime:&v26];
    }
    long long v13 = [(PTCinematographyStream *)self network];
    [v13 expectedFPS];
    if (v14 == 0.0) {
      float v14 = 6.0;
    }
    int32_t v15 = (int)v14;

    memset(&v25, 0, sizeof(v25));
    char v10 = 1;
    CMTimeMake(&v25, 1, v15);
    [(PTCinematographyStream *)self detectorDidRunNextExpectedTime];
    CMTime lhs = v25;
    CMTimeAdd(&v19, &v18, &lhs);
    CMTime v17 = v19;
    [(PTCinematographyStream *)self setDetectorDidRunNextExpectedTime:&v17];
    goto LABEL_17;
  }
  char v10 = [v6 detectorDidRun];
  double v11 = [(PTCinematographyStream *)self previousFrame];

  if (!v11 && (v10 & 1) == 0)
  {
    uint64_t v12 = _PTLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[PTCinematographyStream _detectorDidRunFromFTTrackingResult:time:]();
    }
    char v10 = 1;
    goto LABEL_19;
  }
LABEL_20:

  return v10;
}

- (id)_frameDetectionsFromFusionTrackerMetadata:(id)a3 time:(id *)a4 disparityBuffer:(__CVBuffer *)a5
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = [(PTCinematographyStream *)self _trackingResultFromFusionTrackerMetadata:v8];
  char v10 = _PTLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    log = v10;
    v56 = a5;
    v57 = self;
    v58 = a4;
    v59 = v9;
    id v60 = v8;
    id v27 = v9;
    v63 = objc_opt_new();
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id obj = [v27 tracks];
    uint64_t v28 = [obj countByEnumeratingWithState:&v64 objects:buf count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v62 = *(void *)v65;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v65 != v62) {
            objc_enumerationMutation(obj);
          }
          uint64_t v31 = *(void **)(*((void *)&v64 + 1) + 8 * i);
          if (v27) {
            [v27 sourceFrameTimestamp];
          }
          id v32 = v31;
          uint64_t v33 = PTGroupIDFromFTTrack(v32);
          NSRect v34 = &stru_1F269F3B0;
          if (PTGroupIDIsValid(v33))
          {
            objc_msgSend(NSString, "stringWithFormat:", @"G%ld", v33);
            NSRect v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          v35 = [v32 metadata];
          v36 = [v35 objectForKeyedSubscript:PTCinematographyExcludeAsCinematicChoice];
          int v37 = [v36 BOOLValue];
          double v38 = @"(excluded)";
          if (!v37) {
            double v38 = &stru_1F269F3B0;
          }
          double v39 = v38;

          [v32 box];
          uint64_t v41 = v40;
          uint64_t v43 = v42;
          uint64_t v45 = v44;
          uint64_t v47 = v46;
          v48 = NSString;
          uint64_t v49 = [v32 identifier];
          uint64_t v50 = [v32 objectKind];

          v51 = [v48 stringWithFormat:@"T%ld%@(%zd)%@: (%g,%g,%g,%g)", v49, v34, v50, v39, v41, v43, v45, v47];

          [v63 addObject:v51];
        }
        uint64_t v29 = [obj countByEnumeratingWithState:&v64 objects:buf count:16];
      }
      while (v29);
    }

    unint64_t v52 = NSString;
    v53 = [v27 tracks];
    v54 = [v52 stringWithFormat:@"FTCinematicTrackingResult (%ld) [DDR:%d]: %@", objc_msgSend(v53, "count"), objc_msgSend(v27, "detectorDidRun"), v63];

    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v54;
    char v10 = log;
    _os_log_debug_impl(&dword_1D0778000, log, OS_LOG_TYPE_DEBUG, "FusionTracker: %@", buf, 0xCu);

    id v9 = v59;
    id v8 = v60;
    self = v57;
    a4 = v58;
    a5 = v56;
  }

  double v11 = [v8 objectForKeyedSubscript:@"MLSignals"];
  [(PTCinematographyStream *)self _autoFocusRectFromMetadata:v8];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  BOOL v20 = [(PTCinematographyStream *)self _autoFocusBlurMapFromMetadata:v8];
  CMTime v21 = v20;
  if (v20) {
    objc_msgSend(v20, "setAutoFocusRect:", v13, v15, v17, v19);
  }
  *(_OWORD *)buf = *(_OWORD *)&a4->var0;
  int64_t var3 = a4->var3;
  double v22 = -[PTCinematographyStream _detectionsFromFTTrackingResult:autoFocusRect:focusBlurMap:namedSignalsPerTrack:time:disparityBuffer:](self, "_detectionsFromFTTrackingResult:autoFocusRect:focusBlurMap:namedSignalsPerTrack:time:disparityBuffer:", v9, v21, v11, buf, a5, v13, v15, v17, v19);
  *(_OWORD *)buf = *(_OWORD *)&a4->var0;
  int64_t var3 = a4->var3;
  BOOL v23 = [(PTCinematographyStream *)self _detectorDidRunFromFTTrackingResult:v9 time:buf];
  float v24 = [NSNumber numberWithBool:v23];
  *(_OWORD *)buf = *(_OWORD *)&a4->var0;
  int64_t var3 = a4->var3;
  CMTime v25 = +[PTCinematographyFrameDetections frameDetections:v22 detectorDidRun:v24 presentationTime:buf];

  return v25;
}

- (BOOL)_isInvalidFTTrack:(id)a3
{
  id v3 = a3;
  [v3 box];
  IsEmptCGFloat y = CGRectIsEmpty(v15);
  if (IsEmpty)
  {
    [v3 box];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v13 = _PTLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[PTCinematographyStream _isInvalidFTTrack:](v3, v13, v6, v8, v10, v12);
    }
  }
  return IsEmpty;
}

- (CGSize)_sensorSizeFromMetadata:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"RawSensorWidth"];
  [v4 doubleValue];
  double v6 = v5;

  double v7 = [v3 objectForKeyedSubscript:@"RawSensorHeight"];

  [v7 doubleValue];
  double v9 = v8;

  double v10 = v6;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (CGRect)_validSensorRectFromMetadata:(id)a3
{
  CGSize v3 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  v10.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  v10.size = v3;
  CFDictionaryRef v4 = [a3 objectForKeyedSubscript:@"SensorRawValidBufferRect"];
  CFDictionaryRef v5 = v4;
  if (v4) {
    CGRectMakeWithDictionaryRepresentation(v4, &v10);
  }

  double y = v10.origin.y;
  double x = v10.origin.x;
  double height = v10.size.height;
  double width = v10.size.width;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)_autoFocusBlurMapFromMetadata:(id)a3
{
  id v4 = a3;
  CFDictionaryRef v5 = v4;
  if (!self->_autoFocusUseBlurMap) {
    goto LABEL_13;
  }
  if (!self->_focusBlurMapMode) {
    goto LABEL_13;
  }
  double v6 = [v4 objectForKeyedSubscript:@"FocusMode"];
  uint64_t v7 = [v6 unsignedIntegerValue];

  if (!v7) {
    goto LABEL_13;
  }
  double v8 = _PTLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[PTCinematographyStream _autoFocusBlurMapFromMetadata:]();
  }

  if (v7 == 1)
  {
    double v9 = [v5 objectForKeyedSubscript:@"FocusBlurMap"];
    if (v9)
    {
      [(PTCinematographyStream *)self _sensorSizeFromMetadata:v5];
      double v12 = 0;
      if (v10 > 0.0)
      {
        double v13 = v11;
        if (v11 > 0.0)
        {
          double v14 = v10;
          [(PTCinematographyStream *)self _validSensorRectFromMetadata:v5];
          double v12 = 0;
          if (v17 > 0.0 && v18 > 0.0) {
            double v12 = -[PTFocusBlurMap initWithFocusBlurMapData:sensorSize:validSensorRect:]([PTFocusBlurMap alloc], "initWithFocusBlurMapData:sensorSize:validSensorRect:", v9, v14, v13, v15, v16, v17, v18);
          }
        }
      }
    }
    else
    {
      double v12 = 0;
    }
  }
  else
  {
LABEL_13:
    double v12 = 0;
  }

  return v12;
}

- (CGRect)_autoFocusRectFromMetadata:(id)a3
{
  CGSize v3 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  v11.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  v11.size = v3;
  CFDictionaryRef v4 = [a3 objectForKeyedSubscript:@"FocusRegion"];
  CFDictionaryRef v5 = v4;
  if (v4)
  {
    CGRectMakeWithDictionaryRepresentation(v4, &v11);
    double v6 = _PTLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[PTCinematographyStream _autoFocusRectFromMetadata:](&v11.origin.x);
    }
  }
  double y = v11.origin.y;
  double x = v11.origin.x;
  double height = v11.size.height;
  double width = v11.size.width;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)_autoFocusDetectionWithTime:(id *)a3 rect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  if (CGRectIsEmpty(a4))
  {
    double x = 0.0;
    double y = 0.0;
    double width = 1.0;
    double height = 1.0;
  }
  double v9 = [PTCinematographyDetection alloc];
  long long v12 = *(_OWORD *)&a3->var0;
  int64_t var3 = a3->var3;
  double v10 = -[PTCinematographyDetection initWithTime:rect:focusDistance:](v9, "initWithTime:rect:focusDistance:", &v12, x, y, width, height, 0.0);
  [(PTCinematographyDetection *)v10 setDetectionType:100];
  [(PTCinematographyDetection *)v10 setTrackIdentifier:0x1000000001];

  return v10;
}

- (void)_copyPreviousISPDetections:(id)a3 toDetections:(id)a4 time:(id *)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v7);
        }
        double v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ((unint64_t)([v13 detectionType] - 1) <= 0xB)
        {
          long long v15 = *(_OWORD *)&a5->var0;
          int64_t var3 = a5->var3;
          double v14 = [v13 _detectionByChangingTime:&v15];
          [v8 addObject:v14];
        }
      }
      uint64_t v10 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }
}

- (void)_updateDetections:(id)a3 ifMissingISPDetectionsFromTrackingResult:(id)a4 time:(id *)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v9 = objc_msgSend(a4, "tracks", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:&v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    while (2)
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        if ([*(id *)(*((void *)&v18 + 1) + 8 * v13) objectKind] != 912559)
        {

          uint64_t v17 = 1;
          goto LABEL_14;
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:&v22 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  if ([(PTCinematographyStream *)self canCopyISPDetectionsIfMissing])
  {
    double v14 = _PTLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[PTCinematographyStream _updateDetections:ifMissingISPDetectionsFromTrackingResult:time:]();
    }

    long long v15 = [(PTCinematographyStream *)self previousFrame];
    double v16 = [v15 allDetections];
    long long v22 = *(_OWORD *)&a5->var0;
    int64_t var3 = a5->var3;
    [(PTCinematographyStream *)self _copyPreviousISPDetections:v16 toDetections:v8 time:&v22];

    uint64_t v17 = 0;
LABEL_14:
    [(PTCinematographyStream *)self setCanCopyISPDetectionsIfMissing:v17];
  }
}

- (id)_detectionsFromFTTrackingResult:(id)a3 autoFocusRect:(CGRect)a4 focusBlurMap:(id)a5 namedSignalsPerTrack:(id)a6 time:(id *)a7 disparityBuffer:(__CVBuffer *)a8
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v23 = *a7;
  id v17 = a5;
  id v18 = a3;
  long long v19 = [(PTCinematographyStream *)self _mutableDetectionsFromFTTrackingResult:v18 namedSignalsPerTrack:a6 time:&v23];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v23 = *a7;
  long long v20 = -[PTCinematographyStream _autoFocusDetectionWithTime:rect:](self, "_autoFocusDetectionWithTime:rect:", &v23, x, y, width, height);
  [v19 addObject:v20];
  [(PTCinematographyStream *)self _setDisparityOfDetections:v19 disparityBuffer:a8 focusBlurMap:v17];

  $3CC8671D27C23BF42ADDB32F2B5E48AE v23 = *a7;
  [(PTCinematographyStream *)self _updateDetections:v19 ifMissingISPDetectionsFromTrackingResult:v18 time:&v23];

  long long v21 = (void *)[v19 copy];

  return v21;
}

- (unint64_t)_detectionTypeForFTObjectKind:(unint64_t)a3
{
  if ((uint64_t)a3 > 1999)
  {
    if ((uint64_t)a3 > 3000)
    {
      switch(a3)
      {
        case 0xBB9uLL:
          return 10;
        case 0xA411uLL:
          return 11;
        case 0xDECAFuLL:
          return 102;
      }
    }
    else
    {
      switch(a3)
      {
        case 0x7D0uLL:
          return 4;
        case 0x7D1uLL:
          return 9;
        case 0xBB8uLL:
          return 5;
      }
    }
    return 0;
  }
  else
  {
    unint64_t result = 1;
    switch(a3)
    {
      case 1uLL:
        return result;
      case 2uLL:
LABEL_15:
        unint64_t result = 2;
        break;
      case 3uLL:
LABEL_9:
        unint64_t result = 3;
        break;
      case 4uLL:
        return 4;
      case 5uLL:
        return 5;
      default:
        switch(a3)
        {
          case 0x3E8uLL:
            goto LABEL_9;
          case 0x3E9uLL:
            goto LABEL_15;
          case 0x3EAuLL:
            return result;
          case 0x3EBuLL:
            unint64_t result = 12;
            break;
          default:
            return 0;
        }
        break;
    }
  }
  return result;
}

- (id)_ANODPoseFromFTTrackMetadata:(id)a3
{
  v21[3] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  CFDictionaryRef v4 = [v3 objectForKeyedSubscript:@"AngleInfoRoll"];
  if (v4)
  {
    CFDictionaryRef v5 = [v3 objectForKeyedSubscript:@"AngleInfoPitch"];
    if (v5)
    {
      double v6 = [v3 objectForKeyedSubscript:@"AngleInfoYaw"];
      if (v6)
      {
        [v4 floatValue];
        int v8 = v7;
        [v5 floatValue];
        int v10 = v9;
        [v6 floatValue];
        int v12 = v11;
        LODWORD(v13) = v8;
        double v14 = [NSNumber numberWithFloat:v13];
        LODWORD(v15) = v10;
        double v16 = objc_msgSend(NSNumber, "numberWithFloat:", v15, v14);
        v21[1] = v16;
        LODWORD(v17) = v12;
        id v18 = [NSNumber numberWithFloat:v17];
        v21[2] = v18;
        long long v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:3];
      }
      else
      {
        long long v19 = 0;
      }
    }
    else
    {
      long long v19 = 0;
    }
  }
  else
  {
    long long v19 = 0;
  }

  return v19;
}

- (id)_namedSignals:(id)a3 addingANODPoseFromFTTrackMetadata:(id)a4
{
  id v6 = a3;
  int v7 = [(PTCinematographyStream *)self _ANODPoseFromFTTrackMetadata:a4];
  if (v7)
  {
    if (!v6) {
      id v6 = (id)MEMORY[0x1E4F1CC08];
    }
    int v8 = (void *)[v6 mutableCopy];
    [v8 setObject:v7 forKeyedSubscript:@"anod_pose"];
    int v9 = (void *)[v8 copy];
  }
  else
  {
    id v6 = v6;
    int v9 = v6;
  }

  return v9;
}

- (id)_mutableDetectionsFromFTTrackingResult:(id)a3 namedSignalsPerTrack:(id)a4 time:(id *)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v33 = a4;
  id v34 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v31 = v7;
  id obj = [v7 tracks];
  uint64_t v8 = [obj countByEnumeratingWithState:&v36 objects:v43 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v37 != v10) {
          objc_enumerationMutation(obj);
        }
        int v12 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        if (![(PTCinematographyStream *)self _isInvalidFTTrack:v12])
        {
          double v13 = [PTCinematographyDetection alloc];
          [v12 box];
          *(_OWORD *)buf = *(_OWORD *)&a5->var0;
          *(void *)&uint8_t buf[16] = a5->var3;
          double v14 = -[PTCinematographyDetection initWithTime:rect:focusDistance:](v13, "initWithTime:rect:focusDistance:", buf);
          -[PTCinematographyDetection setDetectionType:](v14, "setDetectionType:", -[PTCinematographyStream _detectionTypeForFTObjectKind:](self, "_detectionTypeForFTObjectKind:", [v12 objectKind]));
          -[PTCinematographyDetection setTrackIdentifier:](v14, "setTrackIdentifier:", [v12 identifier]);
          [(PTCinematographyDetection *)v14 setGroupIdentifier:PTGroupIDFromFTTrack(v12)];
          double v15 = [v12 metadata];
          double v16 = [v15 objectForKeyedSubscript:PTCinematographyExcludeAsCinematicChoice];
          -[PTCinematographyDetection _setExcludedAsCinematicChoice:](v14, "_setExcludedAsCinematicChoice:", [v16 BOOLValue]);

          if ([(PTCinematographyDetection *)v14 trackIdentifier] < 0)
          {
            double v17 = _PTLogSystem();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
              -[PTCinematographyStream _mutableDetectionsFromFTTrackingResult:namedSignalsPerTrack:time:](v40, v14, &v41, v17);
            }
          }
          id v18 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v12, "identifier"));
          long long v19 = [v33 objectForKey:v18];

          long long v20 = [v12 metadata];
          long long v21 = [(PTCinematographyStream *)self _namedSignals:v19 addingANODPoseFromFTTrackMetadata:v20];
          [(PTCinematographyDetection *)v14 set_namedSignals:v21];

          uint64_t v22 = [(PTCinematographyDetection *)v14 _namedSignals];
          if (v22)
          {
            $3CC8671D27C23BF42ADDB32F2B5E48AE v23 = (void *)v22;
            uint64_t v24 = PTDefaultsGetDictionary();
            CMTime v25 = [v24 objectForKeyedSubscript:@"CinematographyDebugLogMLSignals"];
            int v26 = [v25 BOOLValue];

            if (v26)
            {
              id v27 = _PTLogSystem();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v28 = [(PTCinematographyDetection *)v14 focusIdentifier];
                uint64_t v29 = [(PTCinematographyDetection *)v14 _namedSignals];
                *(_DWORD *)buf = 138412546;
                *(void *)&buf[4] = v28;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v29;
                _os_log_debug_impl(&dword_1D0778000, v27, OS_LOG_TYPE_DEBUG, "%@ named signals: %@", buf, 0x16u);
              }
            }
          }
          [v34 addObject:v14];
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v36 objects:v43 count:16];
    }
    while (v9);
  }

  return v34;
}

- (id)_disparityWeightingValue
{
  if (_disparityWeightingValue_onceToken != -1) {
    dispatch_once(&_disparityWeightingValue_onceToken, &__block_literal_global_182);
  }
  uint64_t v2 = (void *)_disparityWeightingValue_sDisparityWeightingValue;

  return v2;
}

void __50__PTCinematographyStream__disparityWeightingValue__block_invoke()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v0 = PTDefaultsGetDictionary();
  uint64_t v1 = [v0 objectForKeyedSubscript:@"CinematographyDisparityWeighting"];
  uint64_t v2 = (void *)_disparityWeightingValue_sDisparityWeightingValue;
  _disparityWeightingValue_sDisparityWeightingValue = v1;

  if (!_disparityWeightingValue_sDisparityWeightingValue) {
    goto LABEL_5;
  }
  id v3 = _PTLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    uint64_t v6 = _disparityWeightingValue_sDisparityWeightingValue;
    _os_log_impl(&dword_1D0778000, v3, OS_LOG_TYPE_INFO, "defaults: CinematographyDisparityWeighting: %@", (uint8_t *)&v5, 0xCu);
  }

  if (!_disparityWeightingValue_sDisparityWeightingValue)
  {
LABEL_5:
    CFDictionaryRef v4 = (void *)_disparityWeightingValue_sDisparityWeightingValue;
    _disparityWeightingValue_sDisparityWeightingValue = (uint64_t)&unk_1F26C1198;
  }
}

- (float)_focusDistanceForDetection:(id)a3 lockedDisparityBufferAddress:(void *)a4 width:(unint64_t)a5 height:(unint64_t)a6 bytesPerRow:(unint64_t)a7 formatType:(unsigned int)a8
{
  id v14 = a3;
  double v15 = [(PTCinematographyStream *)self previousFrame];
  double v16 = objc_msgSend(v15, "detectionForTrackIdentifier:", objc_msgSend(v14, "trackIdentifier"));

  [v16 focusDistance];
  int v27 = v17;
  uint64_t v18 = [v14 detectionType];
  [v14 rect];
  if (v16) {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v23 = (float *)&v27;
  }
  else {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v23 = 0;
  }
  float v24 = PTDisparityInNormalizedRectFromLockedPixelBufferInfoWithPrior(v18, (uint64_t)a4, a5, a6, a7, a8, v23, v19, v20, v21, v22);
  CMTime v25 = _PTLogSystem();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
    -[PTCinematographyStream _focusDistanceForDetection:lockedDisparityBufferAddress:width:height:bytesPerRow:formatType:](v14);
  }

  return v24;
}

- (id)_inFocusRegionForFocusBlurMap:(id)a3
{
  if (self->_autoFocusInFocusRegionSelect == 1) {
    [a3 largestFocusRegion];
  }
  else {
  id v3 = [a3 inFocusRegion];
  }

  return v3;
}

- (float)_focusDistanceForAutoFocusDetection:(id)a3 lockedDisparityBufferAddress:(void *)a4 width:(unint64_t)a5 height:(unint64_t)a6 bytesPerRow:(unint64_t)a7 formatType:(unsigned int)a8 focusBlurMap:(id)a9
{
  uint64_t v9 = *(void *)&a8;
  id v15 = a3;
  id v16 = a9;
  if (v16)
  {
    int v17 = [(PTCinematographyStream *)self _inFocusRegionForFocusBlurMap:v16];
    if (self->_autoFocusUseMask)
    {
      [v16 inputValidNormalizedRect];
      double v19 = v18;
      double v21 = v20;
      double v23 = v22;
      double v25 = v24;
      int v26 = +[PTScanlineMask scanlineMaskWithFocusBlurMap:v16 region:v17];
      [v16 validNormalizedRectFromRegion:v17];
      objc_msgSend(v15, "setRect:");
    }
    else
    {
      [v16 validNormalizedRectFromRegion:v17];
      double v19 = v33;
      double v21 = v34;
      double v23 = v35;
      double v25 = v36;
      objc_msgSend(v15, "setRect:");
      int v26 = 0;
    }
    float v32 = _PTDisparityInNormalizedRectFromLockedPixelBufferInfoWithMask([v15 detectionType], a4, a5, a6, a7, v9, 0, v26, v19, v21, v23, v25);
  }
  else
  {
    uint64_t v27 = [v15 detectionType];
    [v15 rect];
    float v32 = PTDisparityInNormalizedRectFromLockedPixelBufferInfo(v27, (uint64_t)a4, a5, a6, a7, v9, v28, v29, v30, v31);
  }
  long long v37 = _PTLogSystem();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
    -[PTCinematographyStream _focusDistanceForAutoFocusDetection:lockedDisparityBufferAddress:width:height:bytesPerRow:formatType:focusBlurMap:](v15);
  }

  return v32;
}

- (void)_setDisparityOfDetections:(id)a3 disparityBuffer:(__CVBuffer *)a4 focusBlurMap:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v20 = a5;
  CVPixelBufferLockBaseAddress(a4, 1uLL);
  BaseAddress = CVPixelBufferGetBaseAddress(a4);
  size_t Width = CVPixelBufferGetWidth(a4);
  size_t Height = CVPixelBufferGetHeight(a4);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a4);
  CVPixelBufferRef pixelBuffer = a4;
  uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(a4);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v8;
  uint64_t v14 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(obj);
        }
        double v18 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ([v18 isAutoFocusDetection]) {
          -[PTCinematographyStream _focusDistanceForAutoFocusDetection:lockedDisparityBufferAddress:width:height:bytesPerRow:formatType:focusBlurMap:](self, "_focusDistanceForAutoFocusDetection:lockedDisparityBufferAddress:width:height:bytesPerRow:formatType:focusBlurMap:", v18, BaseAddress, Width, Height, BytesPerRow, PixelFormatType, v20, pixelBuffer);
        }
        else {
          [(PTCinematographyStream *)self _focusDistanceForDetection:v18 lockedDisparityBufferAddress:BaseAddress width:Width height:Height bytesPerRow:BytesPerRow formatType:PixelFormatType];
        }
        objc_msgSend(v18, "setFocusDistance:");
        [(PTCinematographyStream *)self _logUnusualDetection:v18 info:@"reading disparity buffer"];
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v15);
  }

  CVPixelBufferUnlockBaseAddress(pixelBuffer, 1uLL);
}

- (float)smoothFocusDistance:(float)a3 trackIdentifier:(int64_t)a4 sampleCount:(unint64_t)a5
{
  id v8 = [(PTCinematographyStream *)self previousFrame];
  uint64_t v9 = [v8 detectionForTrackIdentifier:a4];

  if (v9)
  {
    [v9 focusDistance];
    a3 = v10 + (float)((float)(2.0 / (float)((float)a5 + 1.0)) * (float)(a3 - v10));
  }

  return a3;
}

- (void)_logFocusChangeForFrame:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(PTCinematographyStream *)self previousFrame];
  if (!v7) {
    goto LABEL_3;
  }
  id v8 = (void *)v7;
  uint64_t v9 = [v6 focusDetection];
  id v3 = (void *)[v9 trackIdentifier];
  CFDictionaryRef v4 = [(PTCinematographyStream *)self previousFrame];
  float v10 = [v4 focusDetection];
  uint64_t v11 = [v10 trackIdentifier];

  if (v3 != (void *)v11)
  {
LABEL_3:
    int v12 = _PTLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      double v13 = [(PTCinematographyStream *)self previousFrame];
      if (v13)
      {
        uint64_t v14 = NSString;
        self = [(PTCinematographyStream *)self previousFrame];
        id v3 = [(PTCinematographyStream *)self focusDetection];
        CFDictionaryRef v4 = [v3 focusIdentifier];
        uint64_t v15 = [v14 stringWithFormat:@" from %@", v4];
      }
      else
      {
        uint64_t v15 = &stru_1F269F3B0;
      }
      uint64_t v16 = [v6 focusDetection];
      int v17 = [v16 focusIdentifier];
      *(_DWORD *)buf = 138412546;
      double v19 = v15;
      __int16 v20 = 2112;
      double v21 = v17;
      _os_log_impl(&dword_1D0778000, v12, OS_LOG_TYPE_INFO, "cinematography focus change%@ to %@", buf, 0x16u);

      if (v13)
      {
      }
    }
  }
}

- (void)_logUserTap:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  CFDictionaryRef v4 = [v3 detection];
  int v5 = [v4 isFixedFocusDetection];

  if (v5)
  {
    id v6 = [v3 detection];
    [v6 rect];
    CGFloat MidX = CGRectGetMidX(v24);

    id v8 = [v3 detection];
    [v8 rect];
    CGFloat MidY = CGRectGetMidY(v25);

    float v10 = [v3 detection];
    [v10 focusDistance];
    float v12 = v11;

    double v13 = _PTLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 134218496;
      CGFloat v18 = MidX;
      __int16 v19 = 2048;
      CGFloat v20 = MidY;
      __int16 v21 = 2048;
      double v22 = v12;
      _os_log_impl(&dword_1D0778000, v13, OS_LOG_TYPE_DEFAULT, "user tap at (%g,%g) focus distance %g", (uint8_t *)&v17, 0x20u);
    }
  }
  else
  {
    double v13 = _PTLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "trackIdentifier"));
      int v15 = [v3 isStrong];
      uint64_t v16 = &stru_1F269F3B0;
      if (v15) {
        uint64_t v16 = @" (strong)";
      }
      int v17 = 138412546;
      CGFloat v18 = *(double *)&v14;
      __int16 v19 = 2112;
      CGFloat v20 = *(double *)&v16;
      _os_log_impl(&dword_1D0778000, v13, OS_LOG_TYPE_DEFAULT, "user tap on track %@%@", (uint8_t *)&v17, 0x16u);
    }
  }
}

- (BOOL)_logUnusualDisparity:(float)a3 kind:(id)a4 info:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  BOOL v9 = a3 > 100.0 || a3 < 0.0;
  if (v9)
  {
    float v10 = _PTLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(float *)&double v11 = a3;
      float v12 = [NSNumber numberWithFloat:v11];
      int v14 = 138412802;
      int v15 = v12;
      __int16 v16 = 2112;
      id v17 = v7;
      __int16 v18 = 2112;
      id v19 = v8;
      _os_log_impl(&dword_1D0778000, v10, OS_LOG_TYPE_INFO, "unusual %@ disparity %@ (%@)", (uint8_t *)&v14, 0x20u);
    }
  }

  return v9;
}

- (BOOL)_logUnusualDetection:(id)a3 info:(id)a4
{
  id v6 = a4;
  [a3 focusDistance];
  LOBYTE(a3) = -[PTCinematographyStream _logUnusualDisparity:kind:info:](self, "_logUnusualDisparity:kind:info:", @"detection", v6);

  return (char)a3;
}

- (PTCinematographyStreamDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PTCinematographyStreamDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (float)userAperture
{
  return self->_userAperture;
}

- (void)setUserAperture:(float)a3
{
  self->_userAperture = a3;
}

- (unint64_t)activeVersion
{
  return self->_activeVersion;
}

- (PTCinematographyStreamOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (PTCinematographyTrackAllocator)trackAllocator
{
  return self->_trackAllocator;
}

- (void)setTrackAllocator:(id)a3
{
}

- (PTCinematographyNetwork)network
{
  return self->_network;
}

- (void)setNetwork:(id)a3
{
}

- (PTCinematographyFocusPuller)previewFocusPuller
{
  return self->_previewFocusPuller;
}

- (void)setPreviewFocusPuller:(id)a3
{
}

- (unint64_t)detectionModel
{
  return self->_detectionModel;
}

- (void)setDetectionModel:(unint64_t)a3
{
  self->_detectionModel = a3;
}

- (unint64_t)focusBlurMapMode
{
  return self->_focusBlurMapMode;
}

- (void)setFocusBlurMapMode:(unint64_t)a3
{
  self->_focusBlurMapMode = a3;
}

- (BOOL)autoFocusUseBlurMap
{
  return self->_autoFocusUseBlurMap;
}

- (void)setAutoFocusUseBlurMap:(BOOL)a3
{
  self->_autoFocusUseBlurMap = a3;
}

- (BOOL)autoFocusUseMask
{
  return self->_autoFocusUseMask;
}

- (void)setAutoFocusUseMask:(BOOL)a3
{
  self->_autoFocusUseMask = a3;
}

- (unint64_t)autoFocusInFocusRegionSelect
{
  return self->_autoFocusInFocusRegionSelect;
}

- (void)setAutoFocusInFocusRegionSelect:(unint64_t)a3
{
  self->_autoFocusInFocusRegionSelect = a3;
}

- (unint64_t)frameIndex
{
  return self->_frameIndex;
}

- (void)setFrameIndex:(unint64_t)a3
{
  self->_frameIndedouble x = a3;
}

- (unint64_t)previousRecordingState
{
  return self->_previousRecordingState;
}

- (void)setPreviousRecordingState:(unint64_t)a3
{
  self->_previousRecordingState = a3;
}

- (PTCinematographyFrame)previousFrame
{
  return self->_previousFrame;
}

- (void)setPreviousFrame:(id)a3
{
}

- (BOOL)canCopyISPDetectionsIfMissing
{
  return self->_canCopyISPDetectionsIfMissing;
}

- (void)setCanCopyISPDetectionsIfMissing:(BOOL)a3
{
  self->_canCopyISPDetectionsIfMissing = a3;
}

- (PTCinematographyUserTap)activeUserTap
{
  return self->_activeUserTap;
}

- (void)setActiveUserTap:(id)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)detectorDidRunNextExpectedTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[6];
  return self;
}

- (void)setDetectorDidRunNextExpectedTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_detectorDidRunNextExpectedTime.epoch = a3->var3;
  *(_OWORD *)&self->_detectorDidRunNextExpectedTime.value = v3;
}

- (BOOL)didReadFocusStrategyDefault
{
  return self->_didReadFocusStrategyDefault;
}

- (void)setDidReadFocusStrategyDefault:(BOOL)a3
{
  self->_didReadFocusStrategyDefault = a3;
}

- (unint64_t)internalDefaultFocusStrategy
{
  return self->_internalDefaultFocusStrategy;
}

- (void)setInternalDefaultFocusStrategy:(unint64_t)a3
{
  self->_internalDefaultFocusStrategdouble y = a3;
}

- (float)internalDefaultFixedFocusDisparity
{
  return self->_internalDefaultFixedFocusDisparity;
}

- (void)setInternalDefaultFixedFocusDisparity:(float)a3
{
  self->_internalDefaultFixedFocusDisparitdouble y = a3;
}

- (NSString)internalDefaultNetworkVersion
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setInternalDefaultNetworkVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalDefaultNetworkVersion, 0);
  objc_storeStrong((id *)&self->_activeUserTap, 0);
  objc_storeStrong((id *)&self->_previousFrame, 0);
  objc_storeStrong((id *)&self->_previewFocusPuller, 0);
  objc_storeStrong((id *)&self->_network, 0);
  objc_storeStrong((id *)&self->_trackAllocator, 0);
  objc_storeStrong((id *)&self->_options, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithOptions:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [NSNumber numberWithUnsignedInteger:*a1];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10(&dword_1D0778000, v2, v3, "init with focus blur map mode %@", v4, v5, v6, v7, v8);
}

- (void)initWithOptions:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1 = [NSNumber numberWithUnsignedInteger:*a1];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10(&dword_1D0778000, v2, v3, "init with detection model %@", v4, v5, v6, v7, v8);
}

- (void)initWithOptions:(void *)a1 .cold.3(void *a1)
{
  uint64_t v1 = [NSNumber numberWithUnsignedInteger:*a1];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_1(&dword_1D0778000, v2, v3, "stream options requested unsupported version %@", v4, v5, v6, v7, v8);
}

- (void)processColorBuffer:disparityBuffer:metadataDictionary:presentationTime:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_1D0778000, v0, OS_LOG_TYPE_DEBUG, "Frame: %@", v1, 0xCu);
}

- (void)getGlobalMetadata:.cold.1()
{
  os_log_t v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_1(&dword_1D0778000, v2, v3, "unexpected global metadata class %@", v4, v5, v6, v7, v8);
}

- (void)_copyUserFocusDetectionFromDetections:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  os_log_t v0 = objc_msgSend(NSNumber, "numberWithInteger:");
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_1(&dword_1D0778000, v1, v2, "error: user focus on unknown group %@", v3, v4, v5, v6, v7);
}

- (void)_copyUserFocusDetectionFromDetections:.cold.2()
{
  OUTLINED_FUNCTION_6_0();
  os_log_t v0 = objc_msgSend(NSNumber, "numberWithInteger:");
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_1(&dword_1D0778000, v1, v2, "error: user focus on unknown track %@", v3, v4, v5, v6, v7);
}

- (void)_restoreInternalState:.cold.1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_2(&dword_1D0778000, v0, v1, "stream state missing network state", v2, v3, v4, v5, v6);
}

- (void)_restoreInternalState:.cold.2()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_2(&dword_1D0778000, v0, v1, "stream state has invalid network", v2, v3, v4, v5, v6);
}

- (void)_restoreInternalState:.cold.3()
{
  OUTLINED_FUNCTION_6_0();
  os_log_t v0 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_1(&dword_1D0778000, v1, v2, "attempt to restore internal state to unsupported version %@", v3, v4, v5, v6, v7);
}

- (void)_restoreInternalState:.cold.4()
{
  objc_opt_class();
  OUTLINED_FUNCTION_4();
  id v1 = v0;
  OUTLINED_FUNCTION_1_1(&dword_1D0778000, v2, v3, "unable to restore internal state of class %@", v4, v5, v6, v7, v8);
}

- (void)_userTapFromFTTapResponse:frameDetections:disparityBuffer:.cold.1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_2(&dword_1D0778000, v0, v1, "user tap response missing request", v2, v3, v4, v5, v6);
}

- (void)_userTapFromFTTapResponse:frameDetections:disparityBuffer:.cold.2()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_2(&dword_1D0778000, v0, v1, "user tap response/request unknown (ignored)", v2, v3, v4, v5, v6);
}

- (void)_isUserTap:inFrameDetections:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_1D0778000, v1, OS_LOG_TYPE_DEBUG, "user tap %@ abandoned since detection %@ is marked as excluded as cinematic choice", v2, 0x16u);
}

- (void)_frameDetectionsFromMetadata:time:disparityBuffer:.cold.1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_2(&dword_1D0778000, v0, v1, "error: FusionTracker information not provided in metadata", v2, v3, v4, v5, v6);
}

- (void)_detectorDidRunFromFTTrackingResult:(char)a1 time:(NSObject *)a2 .cold.1(char a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_1D0778000, a2, OS_LOG_TYPE_DEBUG, "Synthetic DDR:%d", (uint8_t *)v2, 8u);
}

- (void)_detectorDidRunFromFTTrackingResult:time:.cold.2()
{
  OUTLINED_FUNCTION_9();
  _os_log_debug_impl(&dword_1D0778000, v0, OS_LOG_TYPE_DEBUG, "Setting DDR:1 for the first frame seen by cinematography", v1, 2u);
}

- (void)_isInvalidFTTrack:(double)a3 .cold.1(void *a1, NSObject *a2, double a3, double a4, double a5, double a6)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int v12 = 134219264;
  uint64_t v13 = [a1 identifier];
  __int16 v14 = 2048;
  uint64_t v15 = [a1 objectKind];
  __int16 v16 = 2048;
  double v17 = a3;
  __int16 v18 = 2048;
  double v19 = a4;
  __int16 v20 = 2048;
  double v21 = a5;
  __int16 v22 = 2048;
  double v23 = a6;
  _os_log_error_impl(&dword_1D0778000, a2, OS_LOG_TYPE_ERROR, "*** error: FT track %ld(%zd) with empty box (%g,%g,%g,%g) - skipping", (uint8_t *)&v12, 0x3Eu);
}

- (void)_autoFocusBlurMapFromMetadata:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  os_log_t v0 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10(&dword_1D0778000, v1, v2, "auto focus mode: %@", v3, v4, v5, v6, v7);
}

- (void)_autoFocusRectFromMetadata:(double *)a1 .cold.1(double *a1)
{
  uint64_t v1 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:", *a1, a1[1], a1[2], a1[3]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10(&dword_1D0778000, v2, v3, "auto focus rect: %@", v4, v5, v6, v7, v8);
}

- (void)_updateDetections:ifMissingISPDetectionsFromTrackingResult:time:.cold.1()
{
  OUTLINED_FUNCTION_9();
  _os_log_debug_impl(&dword_1D0778000, v0, OS_LOG_TYPE_DEBUG, "no ISP detections; copying from prior frame (once)",
    v1,
    2u);
}

- (void)_mutableDetectionsFromFTTrackingResult:(void *)a3 namedSignalsPerTrack:(NSObject *)a4 time:.cold.1(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a2, "trackIdentifier"));
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_1D0778000, a4, OS_LOG_TYPE_ERROR, "error: FusionTracker: track with negative identifier (%@)", a1, 0xCu);
}

- (void)_focusDistanceForDetection:(void *)a1 lockedDisparityBufferAddress:width:height:bytesPerRow:formatType:.cold.1(void *a1)
{
  [a1 trackIdentifier];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7_0(&dword_1D0778000, v1, v2, "raw focus %zd: %g", v3, v4, v5, v6, v7);
}

- (void)_focusDistanceForAutoFocusDetection:(void *)a1 lockedDisparityBufferAddress:width:height:bytesPerRow:formatType:focusBlurMap:.cold.1(void *a1)
{
  [a1 trackIdentifier];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7_0(&dword_1D0778000, v1, v2, "auto focus %zd: %g", v3, v4, v5, v6, v7);
}

@end