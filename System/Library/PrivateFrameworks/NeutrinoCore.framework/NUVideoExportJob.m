@interface NUVideoExportJob
- (BOOL)render:(id *)a3;
- (BOOL)renderVideoFrames:(id)a3 videoMetadataSamples:(id)a4 videoSampleSlices:(id)a5 intoPixelBuffer:(__CVBuffer *)a6 time:(id *)a7 colorSpace:(id)a8 playbackDirection:(int64_t)a9 error:(id *)a10;
- (BOOL)requiresVideoComposition;
- (BOOL)shouldKeepLastFrameRenderNode;
- (BOOL)wantsOutputGeometry;
- (BOOL)wantsOutputVideo;
- (BOOL)writeVideoFrom:(id)a3 toWriter:(id)a4 stillImageTime:(id *)a5 createCustomMetadata:(BOOL)a6 geometryTransform:(id)a7 inputSize:(CGSize)a8 outputSize:(CGSize)a9 error:(id *)a10;
- (NUDigest)digest;
- (NURenderNode)lastFrameRenderNode;
- (NUVideoExportJob)initWithExportRequest:(id)a3;
- (NUVideoExportJob)initWithVideoExportRequest:(id)a3;
- (NUVideoProperties)videoProperties;
- (id)generateVideoComposition:(id *)a3;
- (id)prepareNodeWithPipelineState:(id)a3 error:(id *)a4;
- (id)renderNodeWithPipelineState:(id)a3 error:(id *)a4;
- (id)renderer:(id *)a3;
- (id)result;
- (id)scalePolicy;
- (void)setDigest:(id)a3;
- (void)setLastFrameRenderNode:(id)a3;
- (void)setShouldKeepLastFrameRenderNode:(BOOL)a3;
- (void)setVideoProperties:(id)a3;
- (void)updateDigestWithRenderedFrame:(__CVBuffer *)a3;
@end

@implementation NUVideoExportJob

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastFrameRenderNode, 0);
  objc_storeStrong((id *)&self->_digest, 0);

  objc_storeStrong((id *)&self->_videoProperties, 0);
}

- (void)setLastFrameRenderNode:(id)a3
{
}

- (NURenderNode)lastFrameRenderNode
{
  return self->_lastFrameRenderNode;
}

- (void)setShouldKeepLastFrameRenderNode:(BOOL)a3
{
  self->_shouldKeepLastFrameRenderNode = a3;
}

- (BOOL)shouldKeepLastFrameRenderNode
{
  return self->_shouldKeepLastFrameRenderNode;
}

- (void)setDigest:(id)a3
{
}

- (NUDigest)digest
{
  return self->_digest;
}

- (void)setVideoProperties:(id)a3
{
}

- (NUVideoProperties)videoProperties
{
  return self->_videoProperties;
}

- (void)updateDigestWithRenderedFrame:(__CVBuffer *)a3
{
  v5 = [(NUVideoExportJob *)self digest];

  if (v5)
  {
    size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
    size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
    size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
    size_t v15 = CVPixelBufferGetWidthOfPlane(a3, 1uLL);
    size_t v9 = CVPixelBufferGetHeightOfPlane(a3, 1uLL);
    size_t v10 = CVPixelBufferGetBytesPerRowOfPlane(a3, 1uLL);
    CVPixelBufferLockBaseAddress(a3, 0);
    BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a3, 0);
    for (i = (char *)CVPixelBufferGetBaseAddressOfPlane(a3, 1uLL); HeightOfPlane; --HeightOfPlane)
    {
      v13 = [(NUVideoExportJob *)self digest];
      [v13 addBytes:BaseAddressOfPlane length:WidthOfPlane];

      BaseAddressOfPlane += BytesPerRowOfPlane;
    }
    for (; v9; --v9)
    {
      v14 = [(NUVideoExportJob *)self digest];
      [v14 addBytes:i length:2 * v15];

      i += v10;
    }
    CVPixelBufferUnlockBaseAddress(a3, 0);
  }
}

- (BOOL)renderVideoFrames:(id)a3 videoMetadataSamples:(id)a4 videoSampleSlices:(id)a5 intoPixelBuffer:(__CVBuffer *)a6 time:(id *)a7 colorSpace:(id)a8 playbackDirection:(int64_t)a9 error:(id *)a10
{
  v16.receiver = self;
  v16.super_class = (Class)NUVideoExportJob;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v15 = *a7;
  BOOL v12 = [(NURenderJob *)&v16 renderVideoFrames:a3 videoMetadataSamples:a4 videoSampleSlices:a5 intoPixelBuffer:a6 time:&v15 colorSpace:a8 playbackDirection:a9 error:a10];
  if (v12)
  {
    v13 = [(NUVideoExportJob *)self digest];

    if (v13) {
      [(NUVideoExportJob *)self updateDigestWithRenderedFrame:a6];
    }
  }
  return v12;
}

- (id)renderNodeWithPipelineState:(id)a3 error:(id *)a4
{
  v7.receiver = self;
  v7.super_class = (Class)NUVideoExportJob;
  v5 = [(NURenderJob *)&v7 renderNodeWithPipelineState:a3 error:a4];
  if ([(NUVideoExportJob *)self shouldKeepLastFrameRenderNode]) {
    [(NUVideoExportJob *)self setLastFrameRenderNode:v5];
  }

  return v5;
}

- (BOOL)writeVideoFrom:(id)a3 toWriter:(id)a4 stillImageTime:(id *)a5 createCustomMetadata:(BOOL)a6 geometryTransform:(id)a7 inputSize:(CGSize)a8 outputSize:(CGSize)a9 error:(id *)a10
{
  double height = a9.height;
  double width = a9.width;
  double v13 = a8.height;
  double v14 = a8.width;
  BOOL v15 = a6;
  id v20 = a7;
  id v21 = a4;
  id v22 = a3;
  v23 = [(NURenderJob *)self outputVideoComposition];
  v24 = [v23 sourceVideoTrackWindowsForTrackIDs];
  BOOL v25 = [v24 count] != 0;

  [(NUVideoExportJob *)self setShouldKeepLastFrameRenderNode:v25];
  v26 = [(NUVideoExportJob *)self videoExportRequest];
  v27 = [v26 progress];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v29 = *a5;
  LOBYTE(v15) = +[NUVideoUtilities readFromReader:andWriteToWriter:stillImageTime:createCustomMetadata:geometryTransform:inputSize:outputSize:progress:error:](NUVideoUtilities, "readFromReader:andWriteToWriter:stillImageTime:createCustomMetadata:geometryTransform:inputSize:outputSize:progress:error:", v22, v21, &v29, v15, v20, v27, v14, v13, width, height, a10);

  [(NUVideoExportJob *)self setLastFrameRenderNode:0];
  return v15;
}

- (BOOL)render:(id *)a3
{
  uint64_t v460 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v264 = NUAssertLogger_3539();
    if (os_log_type_enabled(v264, OS_LOG_TYPE_ERROR))
    {
      v265 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      LODWORD(buf.value) = 138543362;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v265;
      _os_log_error_impl(&dword_1A9892000, v264, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v267 = NUAssertLogger_3539();
    BOOL v268 = os_log_type_enabled(v267, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v268)
      {
        v272 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v273 = (void *)MEMORY[0x1E4F29060];
        id v274 = v272;
        v275 = [v273 callStackSymbols];
        v276 = [v275 componentsJoinedByString:@"\n"];
        LODWORD(buf.value) = 138543618;
        *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v272;
        LOWORD(buf.flags) = 2114;
        *(void *)((char *)&buf.flags + 2) = v276;
        _os_log_error_impl(&dword_1A9892000, v267, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);
      }
    }
    else if (v268)
    {
      v269 = [MEMORY[0x1E4F29060] callStackSymbols];
      v270 = [v269 componentsJoinedByString:@"\n"];
      LODWORD(buf.value) = 138543362;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v270;
      _os_log_error_impl(&dword_1A9892000, v267, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUVideoExportJob render:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUVideoExportJob.m", 225, @"Invalid parameter not satisfying: %s", v277, v278, v279, v280, (uint64_t)"error != nil");
  }
  v324 = [(NUVideoExportJob *)self videoExportRequest];
  v322 = [(NUVideoExportJob *)self videoProperties];
  id v3 = objc_alloc(MEMORY[0x1E4F16378]);
  v4 = [(NURenderJob *)self outputVideo];
  id v442 = 0;
  v5 = (void *)[v3 initWithAsset:v4 error:&v442];
  id v6 = v442;

  if (!v5)
  {
    v321 = [(NURenderJob *)self outputVideo];
    +[NUError errorWithCode:1 reason:@"Failed to initialize AVAssetReader" object:v321 underlyingError:v6];
    BOOL v10 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_136;
  }
  v321 = [v324 destinationURL];
  objc_super v7 = [v321 pathExtension];
  v318 = NUFileTypeFromExtension(v7);

  id v441 = v6;
  v323 = (void *)[objc_alloc(MEMORY[0x1E4F163B8]) initWithURL:v321 fileType:v318 error:&v441];
  id v315 = v441;

  if (!v323)
  {
    +[NUError errorWithCode:1 reason:@"Failed to inialize AVAssetWriter for URL" object:v321 underlyingError:v315];
    BOOL v10 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_135;
  }
  v8 = [v324 metadata];
  [v323 setMetadata:v8];

  v348 = [MEMORY[0x1E4F1CA48] array];
  v340 = [MEMORY[0x1E4F1CA48] array];
  v334 = [MEMORY[0x1E4F1CA48] array];
  v332 = [MEMORY[0x1E4F1CA48] array];
  memset(&buf, 0, sizeof(buf));
  if (v322)
  {
    [v322 livePhotoKeyFrameTime];
    char flags = buf.flags;
  }
  else
  {
    char flags = 0;
  }
  long long v440 = 0u;
  long long v439 = 0u;
  long long v438 = 0u;
  long long v437 = 0u;
  v11 = [(NURenderJob *)self outputVideo];
  BOOL v12 = [v11 tracks];

  uint64_t v13 = [v12 countByEnumeratingWithState:&v437 objects:v458 count:16];
  char v333 = flags & 1;
  if (!v13)
  {
    unsigned int newTimescale = 600;
    float v17 = 0.0;
    goto LABEL_44;
  }
  uint64_t v14 = *(void *)v438;
  uint64_t v15 = *MEMORY[0x1E4F15C18];
  uint64_t v16 = *MEMORY[0x1E4F15BB8];
  uint64_t v356 = *MEMORY[0x1E4F15BA8];
  id v341 = (id)*MEMORY[0x1E4F15BE0];
  unsigned int newTimescale = 600;
  float v17 = 0.0;
  do
  {
    uint64_t v18 = 0;
    do
    {
      if (*(void *)v438 != v14) {
        objc_enumerationMutation(v12);
      }
      v19 = *(void **)(*((void *)&v437 + 1) + 8 * v18);
      id v20 = [v19 mediaType];
      int v21 = [v20 isEqualToString:v15];

      if (v21)
      {
        [v348 addObject:v19];
        unsigned int newTimescale = [v19 naturalTimeScale];
        [v19 estimatedDataRate];
        if (v17 < v22) {
          float v17 = v22;
        }
      }
      else
      {
        v23 = [v19 mediaType];
        int v24 = [v23 isEqualToString:v16];

        if (v24)
        {
          [v340 addObject:v19];
          goto LABEL_26;
        }
        BOOL v25 = [v19 mediaType];
        int v26 = [v25 isEqualToString:v356];

        if (v26)
        {
          [v334 addObject:v19];
          goto LABEL_26;
        }
        v27 = [v19 mediaType];
        int v28 = [v27 isEqualToString:v341];

        if (!v28)
        {
LABEL_25:
          [v332 addObject:v19];
          goto LABEL_26;
        }
        BOOL v29 = +[NUVideoUtilities isMetadataTrackStillImageDisplayTimeMarkerInLivePhoto:v19];
        if (+[NUVideoUtilities isMetadataTrackWithStillImageTransformInLivePhoto:v19])
        {
          char v333 = 1;
          goto LABEL_26;
        }
        v333 &= !v29;
        if (+[NUVideoUtilities isMetadataTrackWithLivePhotoInfo:v19])
        {
          v30 = [(NURenderJob *)self renderNode];
          int v31 = [v30 canPropagateOriginalLivePhotoMetadataTrack];

          if (v31) {
            goto LABEL_25;
          }
        }
        else if (+[NUVideoUtilities metadataTrackContainsPortraitVideoData:v19])
        {
          if ([v324 includeCinematicVideoTracks]) {
            goto LABEL_25;
          }
        }
        else if (+[NUVideoUtilities metadataTrackContainsCinematicAudioData:v19])
        {
          if ([v324 includeCinematicVideoTracks]) {
            goto LABEL_25;
          }
        }
        else if (!+[NUVideoUtilities metadataTrackContainsSemanticStyleData:](NUVideoUtilities, "metadataTrackContainsSemanticStyleData:", v19)|| [v324 includeSemanticStyleTracks])
        {
          goto LABEL_25;
        }
      }
LABEL_26:
      ++v18;
    }
    while (v13 != v18);
    uint64_t v32 = [v12 countByEnumeratingWithState:&v437 objects:v458 count:16];
    uint64_t v13 = v32;
  }
  while (v32);
LABEL_44:

  if (buf.flags)
  {
    CMTime time = buf;
    CMTimeConvertScale(&v457, &time, newTimescale, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
    CMTime buf = v457;
  }
  v316 = [v324 outputSettings];
  uint64_t v33 = *MEMORY[0x1E4F16220];
  v34 = [v316 objectForKeyedSubscript:*MEMORY[0x1E4F16220]];
  BOOL v35 = v34 == 0;

  if (v35) {
    +[NUVideoUtilities defaultExportCodecForHDRVideo:](NUVideoUtilities, "defaultExportCodecForHDRVideo:", [v322 isHDR]);
  }
  else {
  v36 = [v316 objectForKeyedSubscript:v33];
  }
  CMVideoCodecType v37 = NUTypeCodeFromString(v36);

  v314 = [(NURenderJob *)self outputGeometry];
  uint64_t v38 = [v314 scaledSize];
  uint64_t v311 = v39;
  uint64_t v312 = v38;
  if ((v38 | v39))
  {
    v281 = NUAssertLogger_3539();
    if (os_log_type_enabled(v281, OS_LOG_TYPE_ERROR))
    {
      v282 = [NSString stringWithFormat:@"Expected even dimensions for the exported video"];
      LODWORD(v457.value) = 138543362;
      *(CMTimeValue *)((char *)&v457.value + 4) = (CMTimeValue)v282;
      _os_log_error_impl(&dword_1A9892000, v281, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v457, 0xCu);
    }
    v283 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v284 = NUAssertLogger_3539();
    BOOL v285 = os_log_type_enabled(v284, OS_LOG_TYPE_ERROR);
    if (v283)
    {
      if (v285)
      {
        v288 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v289 = (void *)MEMORY[0x1E4F29060];
        id v290 = v288;
        v291 = [v289 callStackSymbols];
        v292 = [v291 componentsJoinedByString:@"\n"];
        LODWORD(v457.value) = 138543618;
        *(CMTimeValue *)((char *)&v457.value + 4) = (CMTimeValue)v288;
        LOWORD(v457.flags) = 2114;
        *(void *)((char *)&v457.flags + 2) = v292;
        _os_log_error_impl(&dword_1A9892000, v284, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v457, 0x16u);
      }
    }
    else if (v285)
    {
      v286 = [MEMORY[0x1E4F29060] callStackSymbols];
      v287 = [v286 componentsJoinedByString:@"\n"];
      LODWORD(v457.value) = 138543362;
      *(CMTimeValue *)((char *)&v457.value + 4) = (CMTimeValue)v287;
      _os_log_error_impl(&dword_1A9892000, v284, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v457, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUVideoExportJob render:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUVideoExportJob.m", 341, @"Expected even dimensions for the exported video", v293, v294, v295, v296, v297);
  }
  v313 = +[NUVideoUtilities bestOutputSettingsPresetForTargetVideoSize:codec:](NUVideoUtilities, "bestOutputSettingsPresetForTargetVideoSize:codec:");
  v320 = [MEMORY[0x1E4F165F0] outputSettingsAssistantWithPreset:v313];
  if (!v320)
  {
    +[NUError unknownError:@"Failed to instantiate assistant for preset" object:v313];
    BOOL v10 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_134;
  }
  CMVideoFormatDescriptionRef formatDescriptionOut = 0;
  if (v312 <= v311) {
    int32_t v40 = v311;
  }
  else {
    int32_t v40 = v312;
  }
  if (v312 >= v311) {
    int32_t v41 = v311;
  }
  else {
    int32_t v41 = v312;
  }
  if (!CMVideoFormatDescriptionCreate(0, v37, v40, v41, 0, &formatDescriptionOut))
  {
    [v320 setSourceVideoFormat:formatDescriptionOut];
    CFRelease(formatDescriptionOut);
  }
  v317 = [v348 firstObject];
  memset(&v457, 0, sizeof(v457));
  if (v317)
  {
    [v317 minFrameDuration];
    if (v457.flags)
    {
      CMTime time = v457;
      CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
      if (CMTimeCompare(&time, &time2) >= 1)
      {
        CMTime v434 = v457;
        [v320 setSourceVideoMinFrameDuration:&v434];
      }
    }
  }
  [v317 nominalFrameRate];
  if (v42 > 0.0)
  {
    [v317 nominalFrameRate];
    CMTimeMakeWithSeconds(&v433, 1.0 / v43, [v317 naturalTimeScale]);
    CMTime v432 = v433;
    [v320 setSourceVideoAverageFrameDuration:&v432];
  }
  v44 = [v317 formatDescriptions];
  objc_msgSend(v320, "setSourceVideoFormat:", objc_msgSend(v44, "firstObject"));

  v45 = [(NURenderJob *)self fullSizeGeometry];
  uint64_t v46 = [v45 size];
  uint64_t v306 = v47;
  uint64_t v307 = v46;

  if (v322)
  {
    uint64_t v48 = [v322 originalSize];
    uint64_t v306 = v49;
    uint64_t v307 = v48;
  }
  id v357 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v50 = [(NURenderJob *)self outputVideoComposition];
  BOOL v51 = v50 == 0;

  if (v51)
  {
    v54 = [v317 formatDescriptions];
    v55 = [v54 firstObject];

    FourCharCode MediaSubType = CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)v55);
    uint64_t v57 = [v314 renderScale];
    uint64_t v59 = v58;
    v60 = [(NURenderJob *)self fullSizeGeometry];
    if (v60)
    {
      v61 = [(NURenderJob *)self fullSizeGeometry];
      uint64_t v62 = [v61 renderScale];
      uint64_t v64 = v63;
    }
    else
    {
      uint64_t v62 = [(NURenderJob *)self renderScale];
      uint64_t v64 = v95;
    }

    if (NUScaleCompare(v57, v59, v62, v64)
      || ([v324 bypassOutputSettingsIfNoComposition] & 1) == 0
      && (([v316 objectForKeyedSubscript:v33],
           (v101 = objc_claimAutoreleasedReturnValue()) != 0)
        ? (BOOL v102 = v37 == MediaSubType)
        : (BOOL v102 = 1),
          v102 ? (int v103 = 0) : (int v103 = 1),
          v101,
          v103))
    {
      newTimescalea = +[NUVideoUtilities defaultVideoSettingsForAVAssetReader];
      v96 = [v320 videoSettings];
      v97 = (void *)[v96 mutableCopy];

      [v97 addEntriesFromDictionary:v316];
      v98 = [NSNumber numberWithInteger:v312];
      [v97 setObject:v98 forKeyedSubscript:*MEMORY[0x1E4F16300]];

      v99 = [NSNumber numberWithInteger:v311];
      [v97 setObject:v99 forKeyedSubscript:*MEMORY[0x1E4F162A0]];

      [v97 removeObjectForKey:*MEMORY[0x1E4F162D8]];
      if (v322)
      {
        [v322 cleanAperture];
        v100 = +[NUVideoUtilities cleanApertureVideoSettingsFor:scale:videoSize:](NUVideoUtilities, "cleanApertureVideoSettingsFor:scale:videoSize:", v406, v57, v59, v312, v311);
        [v97 setObject:v100 forKeyedSubscript:*MEMORY[0x1E4F161F8]];
      }
      id v344 = v97;
    }
    else
    {
      id v344 = 0;
      newTimescalea = 0;
    }
    long long v405 = 0u;
    long long v404 = 0u;
    long long v403 = 0u;
    long long v402 = 0u;
    v104 = [(NURenderJob *)self outputVideo];
    uint64_t v105 = *MEMORY[0x1E4F15C18];
    v337 = [v104 tracksWithMediaType:*MEMORY[0x1E4F15C18]];

    uint64_t v106 = [v337 countByEnumeratingWithState:&v402 objects:v453 count:16];
    if (v106)
    {
      uint64_t v107 = *(void *)v403;
      do
      {
        for (uint64_t i = 0; i != v106; ++i)
        {
          if (*(void *)v403 != v107) {
            objc_enumerationMutation(v337);
          }
          v109 = *(void **)(*((void *)&v402 + 1) + 8 * i);
          v110 = (void *)[objc_alloc(MEMORY[0x1E4F163A0]) initWithTrack:v109 outputSettings:newTimescalea];
          [v110 setAlwaysCopiesSampleData:0];
          if (([v5 canAddOutput:v110] & 1) == 0)
          {
            *a3 = +[NUError unknownError:@"Cannot add video track output to asset reader" object:v109];

            goto LABEL_130;
          }
          [v5 addOutput:v110];

          v111 = (void *)[objc_alloc(MEMORY[0x1E4F163C0]) initWithMediaType:v105 outputSettings:v344];
          if (v109)
          {
            [v109 preferredTransform];
          }
          else
          {
            long long v401 = 0u;
            long long v400 = 0u;
            long long v399 = 0u;
          }
          v398[0] = v399;
          v398[1] = v400;
          v398[2] = v401;
          [v111 setTransform:v398];
          [v109 naturalSize];
          objc_msgSend(v111, "setNaturalSize:");
          objc_msgSend(v111, "setMediaTimeScale:", objc_msgSend(v109, "naturalTimeScale"));
          v112 = [v322 trackMetadata];
          v113 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v109, "trackID"));
          v114 = [v112 objectForKeyedSubscript:v113];
          [v111 setMetadata:v114];

          if (([v323 canAddInput:v111] & 1) == 0)
          {
            *a3 = +[NUError unknownError:@"Cannot add video track input to asset writer" object:v111];

LABEL_130:
LABEL_131:
            id obja = 0;
            goto LABEL_132;
          }
          [v323 addInput:v111];
          v115 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v109, "trackID"));
          [v357 setObject:v111 forKeyedSubscript:v115];
        }
        uint64_t v106 = [v337 countByEnumeratingWithState:&v402 objects:v453 count:16];
      }
      while (v106);
    }

    id obja = 0;
  }
  else
  {
    v52 = [(NURenderJob *)self outputVideoComposition];
    v53 = v52;
    if (v52)
    {
      [v52 frameDuration];
    }
    else
    {
      long long v430 = 0uLL;
      uint64_t v431 = 0;
    }
    long long v428 = v430;
    uint64_t v429 = v431;
    [v320 setSourceVideoMinFrameDuration:&v428];

    v65 = [(NURenderJob *)self outputVideoComposition];
    v66 = v65;
    if (v65)
    {
      [v65 frameDuration];
    }
    else
    {
      long long v426 = 0uLL;
      uint64_t v427 = 0;
    }
    long long v424 = v426;
    uint64_t v425 = v427;
    [v320 setSourceVideoAverageFrameDuration:&v424];

    v67 = [(NURenderJob *)self outputVideoComposition];
    unsigned int v308 = [v67 sourceTrackIDForFrameTiming];

    if (v308)
    {
      v68 = [(NURenderJob *)self outputVideo];
      v69 = [v68 trackWithTrackID:v308];

      if (v69)
      {
        [v69 minFrameDuration];
        long long v420 = v422;
        uint64_t v421 = v423;
        [v320 setSourceVideoMinFrameDuration:&v420];
        [v69 nominalFrameRate];
        CMTimeMakeWithSeconds(&v419, 1.0 / v70, [v69 naturalTimeScale]);
        CMTime v418 = v419;
        [v320 setSourceVideoAverageFrameDuration:&v418];
      }
    }
    v71 = objc_opt_new();
    long long v417 = 0u;
    long long v416 = 0u;
    long long v415 = 0u;
    long long v414 = 0u;
    v72 = [(NURenderJob *)self outputVideoComposition];
    obuint64_t j = [v72 instructions];

    uint64_t v335 = [obj countByEnumeratingWithState:&v414 objects:v455 count:16];
    if (v335)
    {
      uint64_t v328 = *(void *)v415;
      do
      {
        v73 = 0;
        do
        {
          if (*(void *)v415 != v328)
          {
            v74 = v73;
            objc_enumerationMutation(obj);
            v73 = v74;
          }
          v342 = v73;
          v75 = *(void **)(*((void *)&v414 + 1) + 8 * (void)v73);
          long long v410 = 0u;
          long long v411 = 0u;
          long long v412 = 0u;
          long long v413 = 0u;
          v76 = [v75 requiredSourceTrackIDs];
          uint64_t v77 = [v76 countByEnumeratingWithState:&v410 objects:v454 count:16];
          if (v77)
          {
            uint64_t v78 = *(void *)v411;
            do
            {
              for (uint64_t j = 0; j != v77; ++j)
              {
                if (*(void *)v411 != v78) {
                  objc_enumerationMutation(v76);
                }
                v80 = (void *)MEMORY[0x1E4F8CC38];
                uint64_t v81 = [*(id *)(*((void *)&v410 + 1) + 8 * j) intValue];
                v82 = [v5 asset];
                v83 = [v80 trackWithTrackID:v81 forAsset:v82];

                if (([v71 containsObject:v83] & 1) == 0) {
                  [v71 addObject:v83];
                }
              }
              uint64_t v77 = [v76 countByEnumeratingWithState:&v410 objects:v454 count:16];
            }
            while (v77);
          }

          v73 = v342 + 1;
        }
        while (v342 + 1 != (char *)v335);
        uint64_t v335 = [obj countByEnumeratingWithState:&v414 objects:v455 count:16];
      }
      while (v335);
    }

    v336 = (void *)[objc_alloc(MEMORY[0x1E4F163A8]) initWithVideoTracks:v71 videoSettings:0];
    v84 = [(NURenderJob *)self outputVideoComposition];
    [v336 setVideoComposition:v84];

    [v336 setAlwaysCopiesSampleData:0];
    if (([v5 canAddOutput:v336] & 1) == 0)
    {
      *a3 = +[NUError unknownError:@"Cannot add video composition output to asset reader" object:v336];

      goto LABEL_131;
    }
    [v5 addOutput:v336];
    v85 = [v320 videoSettings];
    id v343 = (id)[v85 mutableCopy];

    [v343 addEntriesFromDictionary:v316];
    v86 = [NSNumber numberWithInteger:v312];
    [v343 setObject:v86 forKeyedSubscript:*MEMORY[0x1E4F16300]];

    uint64_t v87 = [NSNumber numberWithInteger:v311];
    [v343 setObject:v87 forKeyedSubscript:*MEMORY[0x1E4F162A0]];

    [v343 removeObjectForKey:*MEMORY[0x1E4F162D8]];
    v88 = [v324 colorSpace];
    LOBYTE(v87) = v88 == 0;

    if (v87)
    {
      [v343 setObject:0 forKeyedSubscript:*MEMORY[0x1E4F16258]];
    }
    else
    {
      v89 = [v324 colorSpace];
      v90 = [v89 cvPixelBufferAttachments];

      v91 = objc_opt_new();
      v92 = [v90 objectForKeyedSubscript:*MEMORY[0x1E4F24A90]];
      [v91 setObject:v92 forKeyedSubscript:*MEMORY[0x1E4F16240]];

      v93 = [v90 objectForKeyedSubscript:*MEMORY[0x1E4F24BC8]];
      [v91 setObject:v93 forKeyedSubscript:*MEMORY[0x1E4F162E0]];

      v94 = [v90 objectForKeyedSubscript:*MEMORY[0x1E4F24C18]];
      [v91 setObject:v94 forKeyedSubscript:*MEMORY[0x1E4F16308]];

      [v343 setObject:v91 forKeyedSubscript:*MEMORY[0x1E4F16258]];
    }
    BOOL v117 = +[NUGlobalSettings enforceMinimumBitRateForExportedVideos];
    v118 = (uint64_t *)MEMORY[0x1E4F16268];
    if (v117
      || +[NUGlobalSettings enforceMinimumBitRateForCinematicVideos](NUGlobalSettings, "enforceMinimumBitRateForCinematicVideos")&& (-[NURenderJob composition](self, "composition"), v119 = objc_claimAutoreleasedReturnValue(), [v119 objectForKeyedSubscript:@"portraitVideo"], v120 = objc_claimAutoreleasedReturnValue(), BOOL v121 = v120 == 0, v120, v119, !v121))
    {
      uint64_t v122 = *v118;
      v123 = [v343 objectForKeyedSubscript:*v118];
      uint64_t v124 = *MEMORY[0x1E4F161D8];
      v125 = [v123 objectForKeyedSubscript:*MEMORY[0x1E4F161D8]];

      if (v125)
      {
        [v125 floatValue];
        if (v126 >= v17) {
          float v127 = v126;
        }
        else {
          float v127 = v17;
        }
        v128 = [v343 objectForKeyedSubscript:v122];
        v129 = (void *)[v128 mutableCopy];

        v130 = [NSNumber numberWithInteger:(uint64_t)v127];
        [v129 setObject:v130 forKeyedSubscript:v124];

        [v343 setObject:v129 forKeyedSubscript:v122];
      }
    }
    BOOL v131 = +[NUVideoUtilities videoTrackContainsDolbyVisionMetadata:v317];
    v132 = (id *)MEMORY[0x1E4F44FB8];
    if (!v131) {
      v132 = (id *)MEMORY[0x1E4F44FC0];
    }
    id v133 = *v132;
    uint64_t v134 = *v118;
    v135 = [v343 objectForKeyedSubscript:*v118];
    v329 = (void *)[v135 mutableCopy];

    [v329 setObject:v133 forKeyedSubscript:*MEMORY[0x1E4F44928]];
    [v343 setObject:v329 forKeyedSubscript:v134];
    id v409 = 0;
    id obja = [v314 transformWithSourceSpace:@"/Image" destinationSpace:@"/masterSpace" error:&v409];
    id v136 = v409;
    if (!obja)
    {
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_156);
      }
      v137 = (id)_NULogger;
      if (os_log_type_enabled(v137, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(time.value) = 138412290;
        *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v136;
        _os_log_debug_impl(&dword_1A9892000, v137, OS_LOG_TYPE_DEBUG, "can't get mapping from input to output space, %@", (uint8_t *)&time, 0xCu);
      }
    }
    v138 = [(NURenderJob *)self fullSizeGeometry];
    if (v138)
    {
      v139 = [(NURenderJob *)self fullSizeGeometry];
      uint64_t v140 = [v139 renderScale];
      uint64_t v142 = v141;
    }
    else
    {
      uint64_t v140 = [(NURenderJob *)self renderScale];
      uint64_t v142 = v143;
    }

    uint64_t v144 = [v314 renderScale];
    uint64_t v146 = NUScaleDivide(v144, v145, v140, v142);
    if (v322)
    {
      uint64_t v148 = v146;
      uint64_t v149 = v147;
      [v322 cleanAperture];
      v150 = +[NUVideoUtilities cleanApertureVideoSettingsFor:scale:videoSize:](NUVideoUtilities, "cleanApertureVideoSettingsFor:scale:videoSize:", v408, v148, v149, v312, v311);
      [v343 setObject:v150 forKeyedSubscript:*MEMORY[0x1E4F161F8]];
    }
    id v151 = objc_alloc(MEMORY[0x1E4F163C0]);
    v152 = (void *)[v151 initWithMediaType:*MEMORY[0x1E4F15C18] outputSettings:v343];
    [v152 setMediaTimeScale:newTimescale];
    v153 = [(NUVideoExportJob *)self videoExportRequest];
    int v154 = [v153 applyOrientationAsMetadata];

    if (v154) {
      uint64_t v155 = [v314 orientation];
    }
    else {
      uint64_t v155 = 1;
    }
    uint64_t v156 = [v314 size];
    +[NUVideoUtilities preferredTransformFromOrientation:size:](NUVideoUtilities, "preferredTransformFromOrientation:size:", v155, v156, v157);
    *(_OWORD *)v407 = *(_OWORD *)&v407[7];
    *(_OWORD *)&v407[2] = *(_OWORD *)&v407[9];
    *(_OWORD *)&v407[4] = *(_OWORD *)&v407[11];
    [v152 setTransform:v407];
    v158 = [(NURenderJob *)self outputVideoComposition];
    [v158 renderSize];
    objc_msgSend(v152, "setNaturalSize:");

    if (v308)
    {
      v159 = [v322 trackMetadata];
      v160 = [NSNumber numberWithInt:v308];
      v161 = [v159 objectForKeyedSubscript:v160];
      [v152 setMetadata:v161];
    }
    if ([v323 canAddInput:v152])
    {
      [v323 addInput:v152];
      int v162 = 0;
    }
    else
    {
      *a3 = +[NUError unknownError:@"Cannot add video track input to asset writer" object:v152];
      int v162 = 1;
    }

    if (v162) {
      goto LABEL_132;
    }
  }
  v163 = [(NURenderJob *)self outputAudioMix];
  if (!v163 || (BOOL v164 = [v334 count] == 0, v163, v164))
  {
    long long v392 = 0u;
    long long v393 = 0u;
    long long v390 = 0u;
    long long v391 = 0u;
    id v184 = v334;
    uint64_t v185 = [v184 countByEnumeratingWithState:&v390 objects:v450 count:16];
    if (!v185) {
      goto LABEL_229;
    }
    uint64_t v186 = *(void *)v391;
    uint64_t v187 = *MEMORY[0x1E4F15BA8];
LABEL_201:
    uint64_t v188 = 0;
    while (1)
    {
      if (*(void *)v391 != v186) {
        objc_enumerationMutation(v184);
      }
      v189 = *(void **)(*((void *)&v390 + 1) + 8 * v188);
      v190 = (void *)[objc_alloc(MEMORY[0x1E4F163A0]) initWithTrack:v189 outputSettings:0];
      [v190 setAlwaysCopiesSampleData:0];
      if (([v5 canAddOutput:v190] & 1) == 0) {
        break;
      }
      [v5 addOutput:v190];
      v191 = (void *)[objc_alloc(MEMORY[0x1E4F163C0]) initWithMediaType:v187 outputSettings:0 sourceFormatHint:SourceFormatHintForTrack(v189)];
      objc_msgSend(v191, "setMarksOutputTrackAsEnabled:", objc_msgSend(v189, "isEnabled"));
      if (([v323 canAddInput:v191] & 1) == 0)
      {
        *a3 = +[NUError unknownError:@"Cannot add audio track output to asset writer" object:v5];

        goto LABEL_211;
      }
      [v323 addInput:v191];
      v192 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v189, "trackID"));
      [v357 setObject:v191 forKeyedSubscript:v192];

      if (v185 == ++v188)
      {
        uint64_t v185 = [v184 countByEnumeratingWithState:&v390 objects:v450 count:16];
        if (!v185) {
          goto LABEL_229;
        }
        goto LABEL_201;
      }
    }
    *a3 = +[NUError unknownError:@"Cannot add audio track output to asset reader" object:v5];
LABEL_211:

    goto LABEL_132;
  }
  v165 = [(NURenderJob *)self outputVideo];
  id newTimescaleb = +[NUVideoUtilities cinematicAudioTrackInAsset:v165];

  if (!newTimescaleb)
  {
    v309 = [v334 firstObject];
    v193 = [v309 formatDescriptions];
    uint64_t v194 = [v193 firstObject];

    v195 = (void *)[objc_alloc(MEMORY[0x1E4F16380]) initWithAudioTracks:v334 audioSettings:0];
    v196 = [(NURenderJob *)self outputAudioMix];
    [v195 setAudioMix:v196];

    [v195 setAlwaysCopiesSampleData:0];
    if ([v5 canAddOutput:v195])
    {
      [v5 addOutput:v195];
      [v320 setSourceAudioFormat:v194];
      v197 = [v320 audioSettings];
      if (v197
        || (+[NUVideoUtilities assetWriterAudioSettingsForAudioTrackFormatDescription:v194], (v197 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        uint64_t v198 = *MEMORY[0x1E4F151E0];
        v199 = [v316 objectForKeyedSubscript:*MEMORY[0x1E4F151E0]];

        uint64_t v200 = *MEMORY[0x1E4F15270];
        v201 = [v316 objectForKeyedSubscript:*MEMORY[0x1E4F15270]];

        if (v199 != 0 || v201 != 0)
        {
          BOOL v202 = v199 != 0;
          v203 = (void *)[v197 mutableCopy];
          if (v202)
          {
            v204 = [v316 objectForKeyedSubscript:v198];
            [v203 setObject:v204 forKeyedSubscript:v198];
          }
          if (v201)
          {
            v205 = [v316 objectForKeyedSubscript:v200];
            [v203 setObject:v205 forKeyedSubscript:v200];
          }
          id v206 = v203;
        }
        else
        {
          id v206 = v197;
        }
        id v207 = objc_alloc(MEMORY[0x1E4F163C0]);
        v208 = (void *)[v207 initWithMediaType:*MEMORY[0x1E4F15BA8] outputSettings:v206];
        char v209 = [v323 canAddInput:v208];
        if (v209)
        {
          [v323 addInput:v208];
          v210 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v309, "trackID"));
          [v357 setObject:v208 forKeyedSubscript:v210];
        }
        else
        {
          *a3 = +[NUError unknownError:@"Cannot add audio track output to asset writer" object:v5];
        }

        if (v209)
        {
          id v184 = 0;
          goto LABEL_229;
        }
LABEL_322:

        goto LABEL_132;
      }
      *a3 = +[NUError unknownError:@"Cannot obtain audio settings for track" object:v309];
    }
    else
    {
      *a3 = +[NUError unknownError:@"Cannot add audio mix output to asset reader" object:v195];
    }
LABEL_321:

    goto LABEL_322;
  }
  if ((unint64_t)[v334 count] >= 3)
  {
    v166 = NULogger();
    if (os_log_type_enabled(v166, OS_LOG_TYPE_ERROR))
    {
      CMTimeValue v271 = [v334 count];
      LODWORD(time.value) = 134217984;
      *(CMTimeValue *)((char *)&time.value + 4) = v271;
      _os_log_error_impl(&dword_1A9892000, v166, OS_LOG_TYPE_ERROR, "Expected 2 audio tracks, got %lu", (uint8_t *)&time, 0xCu);
    }
  }
  v309 = [MEMORY[0x1E4F8CC38] associatedTracksOfTypeForTrack:newTimescaleb trackAssociationType:*MEMORY[0x1E4F160E0]];
  id v345 = [v309 firstObject];
  if (!v345)
  {
    *a3 = +[NUError missingError:@"Expected audio fallback track for track" object:newTimescaleb];
    goto LABEL_321;
  }
  long long v396 = 0u;
  long long v397 = 0u;
  long long v394 = 0u;
  long long v395 = 0u;
  id v304 = v334;
  uint64_t v338 = [v304 countByEnumeratingWithState:&v394 objects:v452 count:16];
  if (!v338) {
    goto LABEL_198;
  }
  uint64_t v330 = *(void *)v395;
  id v302 = (id)*MEMORY[0x1E4F15BA8];
  while (2)
  {
    uint64_t v167 = 0;
    while (2)
    {
      if (*(void *)v395 != v330) {
        objc_enumerationMutation(v304);
      }
      id v168 = *(id *)(*((void *)&v394 + 1) + 8 * v167);
      if (v168 == newTimescaleb || v168 == v345)
      {
        v170 = +[NUVideoUtilities assetReaderAudioSettingsForTrackType:v168 == newTimescaleb];
        id v171 = objc_alloc(MEMORY[0x1E4F16380]);
        v451 = newTimescaleb;
        v172 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v451 count:1];
        v173 = (void *)[v171 initWithAudioTracks:v172 audioSettings:v170];

        v174 = [(NURenderJob *)self outputAudioMix];
        [v173 setAudioMix:v174];

        [v173 setAlwaysCopiesSampleData:0];
        if ([v5 canAddOutput:v173])
        {
          [v5 addOutput:v173];
          v175 = [v168 formatDescriptions];
          BOOL v176 = [v175 count] == 0;

          if (v176)
          {
            v263 = +[NUError errorWithCode:3 reason:@"Missing format description" object:v168];
          }
          else
          {
            v177 = [v168 formatDescriptions];
            v178 = (const opaqueCMFormatDescription *)[v177 firstObject];

            StreamBasicDescriptiouint64_t n = CMAudioFormatDescriptionGetStreamBasicDescription(v178);
            if (StreamBasicDescription)
            {
              v180 = +[NUVideoUtilities assetWriterAudioSettingsForTrackWithSampleRate:v168 == newTimescaleb isAmbisonic:StreamBasicDescription->mSampleRate];

              v181 = (void *)[objc_alloc(MEMORY[0x1E4F163C0]) initWithMediaType:v302 outputSettings:v180];
              [v181 setMarksOutputTrackAsEnabled:v168 != newTimescaleb];
              v182 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v168, "trackID"));
              [v357 setObject:v181 forKeyedSubscript:v182];

              if ([v323 canAddInput:v181])
              {
                [v323 addInput:v181];

                goto LABEL_196;
              }
              *a3 = +[NUError unknownError:@"Cannot add audio track output to asset writer" object:v5];

              v170 = v180;
              goto LABEL_320;
            }
            v263 = +[NUError errorWithCode:2 reason:@"ASBD: Invalid format description" object:v178];
          }
        }
        else
        {
          v263 = +[NUError unknownError:@"Cannot add audio mix output to asset reader" object:v173];
        }
        *a3 = v263;
LABEL_320:

        goto LABEL_321;
      }
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_156);
      }
      v180 = (id)_NULogger;
      if (os_log_type_enabled(v180, OS_LOG_TYPE_ERROR))
      {
        int v183 = [v168 trackID];
        LODWORD(time.value) = 67109120;
        HIDWORD(time.value) = v183;
        _os_log_error_impl(&dword_1A9892000, v180, OS_LOG_TYPE_ERROR, "Unexpected audio track %d, skipping", (uint8_t *)&time, 8u);
      }
LABEL_196:

      if (v338 != ++v167) {
        continue;
      }
      break;
    }
    uint64_t v338 = [v304 countByEnumeratingWithState:&v394 objects:v452 count:16];
    if (v338) {
      continue;
    }
    break;
  }
LABEL_198:

  id v184 = newTimescaleb;
LABEL_229:

  if (([v324 includeCinematicVideoTracks] & 1) != 0
    || [v324 includeSemanticStyleTracks])
  {
    long long v388 = 0u;
    long long v389 = 0u;
    long long v386 = 0u;
    long long v387 = 0u;
    id newTimescalec = v340;
    uint64_t v211 = [newTimescalec countByEnumeratingWithState:&v386 objects:v449 count:16];
    if (!v211) {
      goto LABEL_243;
    }
    uint64_t v212 = *(void *)v387;
    while (1)
    {
      for (uint64_t k = 0; k != v211; ++k)
      {
        if (*(void *)v387 != v212) {
          objc_enumerationMutation(newTimescalec);
        }
        v214 = *(void **)(*((void *)&v386 + 1) + 8 * k);
        v215 = (void *)[objc_alloc(MEMORY[0x1E4F163A0]) initWithTrack:v214 outputSettings:0];
        [v215 setAlwaysCopiesSampleData:0];
        if (([v5 canAddOutput:v215] & 1) == 0)
        {
          *a3 = +[NUError unknownError:@"Cannot add video track output to asset reader" object:v214];

          goto LABEL_311;
        }
        [v5 addOutput:v215];

        id v216 = objc_alloc(MEMORY[0x1E4F163C0]);
        v217 = [v214 mediaType];
        v218 = (void *)[v216 initWithMediaType:v217 outputSettings:0];

        if (v214)
        {
          [v214 preferredTransform];
        }
        else
        {
          long long v384 = 0u;
          long long v385 = 0u;
          long long v383 = 0u;
        }
        v382[0] = v383;
        v382[1] = v384;
        v382[2] = v385;
        [v218 setTransform:v382];
        [v214 naturalSize];
        objc_msgSend(v218, "setNaturalSize:");
        objc_msgSend(v218, "setMediaTimeScale:", objc_msgSend(v214, "naturalTimeScale"));
        if (([v323 canAddInput:v218] & 1) == 0)
        {
          *a3 = +[NUError unknownError:@"Cannot add video track input to asset writer" object:v218];

LABEL_311:
LABEL_132:
          BOOL v10 = 0;
          goto LABEL_133;
        }
        [v323 addInput:v218];
        v219 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v214, "trackID"));
        [v357 setObject:v218 forKeyedSubscript:v219];
      }
      uint64_t v211 = [newTimescalec countByEnumeratingWithState:&v386 objects:v449 count:16];
      if (!v211)
      {
LABEL_243:

        break;
      }
    }
  }
  long long v380 = 0u;
  long long v381 = 0u;
  long long v378 = 0u;
  long long v379 = 0u;
  id newTimescaled = v332;
  uint64_t v220 = [newTimescaled countByEnumeratingWithState:&v378 objects:v448 count:16];
  if (!v220) {
    goto LABEL_253;
  }
  uint64_t v221 = *(void *)v379;
  while (2)
  {
    uint64_t v222 = 0;
    while (2)
    {
      if (*(void *)v379 != v221) {
        objc_enumerationMutation(newTimescaled);
      }
      v223 = *(void **)(*((void *)&v378 + 1) + 8 * v222);
      v224 = (void *)[objc_alloc(MEMORY[0x1E4F163A0]) initWithTrack:v223 outputSettings:0];
      [v224 setAlwaysCopiesSampleData:0];
      if (([v5 canAddOutput:v224] & 1) == 0)
      {
        *a3 = +[NUError unknownError:@"Cannot add track output to asset reader" object:v5];
LABEL_314:

        goto LABEL_132;
      }
      [v5 addOutput:v224];
      v225 = SourceFormatHintForTrack(v223);
      id v226 = objc_alloc(MEMORY[0x1E4F163C0]);
      v227 = [v223 mediaType];
      v228 = (void *)[v226 initWithMediaType:v227 outputSettings:0 sourceFormatHint:v225];

      if (([v323 canAddInput:v228] & 1) == 0)
      {
        *a3 = +[NUError unknownError:@"Cannot add track input to asset writer" object:v5];

        goto LABEL_314;
      }
      [v323 addInput:v228];
      v229 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v223, "trackID"));
      [v357 setObject:v228 forKeyedSubscript:v229];

      if (v220 != ++v222) {
        continue;
      }
      break;
    }
    uint64_t v220 = [newTimescaled countByEnumeratingWithState:&v378 objects:v448 count:16];
    if (v220) {
      continue;
    }
    break;
  }
LABEL_253:

  long long v376 = 0u;
  long long v377 = 0u;
  long long v374 = 0u;
  long long v375 = 0u;
  v230 = [(NURenderJob *)self outputVideo];
  v301 = [v230 tracks];

  uint64_t v300 = [v301 countByEnumeratingWithState:&v374 objects:v447 count:16];
  if (v300)
  {
    uint64_t v231 = *(void *)v375;
    uint64_t v298 = *(void *)v375;
    do
    {
      uint64_t v232 = 0;
      do
      {
        if (*(void *)v375 != v231)
        {
          uint64_t v233 = v232;
          objc_enumerationMutation(v301);
          uint64_t v232 = v233;
        }
        uint64_t v299 = v232;
        v234 = *(void **)(*((void *)&v374 + 1) + 8 * v232);
        long long v370 = 0u;
        long long v371 = 0u;
        long long v372 = 0u;
        long long v373 = 0u;
        id v303 = [v234 availableTrackAssociationTypes];
        uint64_t v310 = [v303 countByEnumeratingWithState:&v370 objects:v446 count:16];
        if (v310)
        {
          id v305 = *(id *)v371;
          do
          {
            for (uint64_t m = 0; m != v310; ++m)
            {
              if (*(id *)v371 != v305) {
                objc_enumerationMutation(v303);
              }
              uint64_t v235 = *(void *)(*((void *)&v370 + 1) + 8 * m);
              long long v366 = 0u;
              long long v367 = 0u;
              long long v368 = 0u;
              long long v369 = 0u;
              *(void *)newTimescalee = v235;
              objc_msgSend(MEMORY[0x1E4F8CC38], "associatedTracksOfTypeForTrack:trackAssociationType:", v234);
              id v346 = (id)objc_claimAutoreleasedReturnValue();
              uint64_t v236 = [v346 countByEnumeratingWithState:&v366 objects:v445 count:16];
              if (v236)
              {
                uint64_t v237 = *(void *)v367;
                do
                {
                  for (uint64_t n = 0; n != v236; ++n)
                  {
                    if (*(void *)v367 != v237) {
                      objc_enumerationMutation(v346);
                    }
                    v239 = *(void **)(*((void *)&v366 + 1) + 8 * n);
                    v240 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v234, "trackID"));
                    v241 = [v357 objectForKeyedSubscript:v240];

                    v242 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v239, "trackID"));
                    v243 = [v357 objectForKeyedSubscript:v242];

                    if (v241 && v243)
                    {
                      [v241 addTrackAssociationWithTrackOfInput:v243 type:*(void *)newTimescalee];
                    }
                    else
                    {
                      if (_NULogOnceToken != -1) {
                        dispatch_once(&_NULogOnceToken, &__block_literal_global_156);
                      }
                      v244 = (id)_NULogger;
                      if (os_log_type_enabled(v244, OS_LOG_TYPE_INFO))
                      {
                        int v245 = [v234 trackID];
                        CMTimeScale v246 = [v239 trackID];
                        LODWORD(time.value) = 67109634;
                        HIDWORD(time.value) = v245;
                        LOWORD(time.timescale) = 1024;
                        *(CMTimeScale *)((char *)&time.timescale + 2) = v246;
                        HIWORD(time.flags) = 2112;
                        time.epoch = *(void *)newTimescalee;
                        _os_log_impl(&dword_1A9892000, v244, OS_LOG_TYPE_INFO, "Missing inputs for track association, skipping (%d <- %d: %@)", (uint8_t *)&time, 0x18u);
                      }
                    }
                  }
                  uint64_t v236 = [v346 countByEnumeratingWithState:&v366 objects:v445 count:16];
                }
                while (v236);
              }
            }
            uint64_t v310 = [v303 countByEnumeratingWithState:&v370 objects:v446 count:16];
          }
          while (v310);
        }

        uint64_t v232 = v299 + 1;
        uint64_t v231 = v298;
      }
      while (v299 + 1 != v300);
      uint64_t v300 = [v301 countByEnumeratingWithState:&v374 objects:v447 count:16];
      uint64_t v231 = v298;
    }
    while (v300);
  }

  long long v364 = 0u;
  long long v365 = 0u;
  long long v362 = 0u;
  long long v363 = 0u;
  v339 = [v322 trackGroups];
  *(void *)newTimescalef = [v339 countByEnumeratingWithState:&v362 objects:v444 count:16];
  if (*(void *)newTimescalef)
  {
    id v347 = *(id *)v363;
    while (2)
    {
      uint64_t v247 = 0;
      do
      {
        if (*(id *)v363 != v347) {
          objc_enumerationMutation(v339);
        }
        v248 = *(void **)(*((void *)&v362 + 1) + 8 * v247);
        id v249 = objc_alloc(MEMORY[0x1E4F1CA48]);
        v250 = [v248 trackIDs];
        v251 = objc_msgSend(v249, "initWithCapacity:", objc_msgSend(v250, "count"));

        long long v360 = 0u;
        long long v361 = 0u;
        long long v358 = 0u;
        long long v359 = 0u;
        v252 = [v248 trackIDs];
        id v253 = 0;
        uint64_t v254 = [v252 countByEnumeratingWithState:&v358 objects:v443 count:16];
        if (v254)
        {
          uint64_t v255 = *(void *)v359;
          do
          {
            for (iuint64_t i = 0; ii != v254; ++ii)
            {
              if (*(void *)v359 != v255) {
                objc_enumerationMutation(v252);
              }
              v257 = [v357 objectForKeyedSubscript:*(void *)(*((void *)&v358 + 1) + 8 * ii)];
              if (v257)
              {
                [v251 addObject:v257];
                if (!v253)
                {
                  if ([v257 marksOutputTrackAsEnabled]) {
                    id v253 = v257;
                  }
                  else {
                    id v253 = 0;
                  }
                }
              }
            }
            uint64_t v254 = [v252 countByEnumeratingWithState:&v358 objects:v443 count:16];
          }
          while (v254);
        }

        uint64_t v258 = [v251 count];
        v259 = [v248 trackIDs];
        BOOL v260 = v258 == [v259 count];

        if (v260)
        {
          v261 = [objc_alloc(MEMORY[0x1E4F163C8]) initWithInputs:v251 defaultInput:v253];
          if (([v323 canAddInputGroup:v261] & 1) == 0)
          {
            *a3 = +[NUError unknownError:@"Cannot add input group to asset writer" object:v261];

            goto LABEL_132;
          }
          [v323 addInputGroup:v261];
        }
        else
        {
          if (_NULogOnceToken != -1) {
            dispatch_once(&_NULogOnceToken, &__block_literal_global_156);
          }
          v261 = (id)_NULogger;
          if (os_log_type_enabled(v261, OS_LOG_TYPE_DEFAULT))
          {
            v262 = [v248 trackIDs];
            LODWORD(time.value) = 138543362;
            *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v262;
            _os_log_impl(&dword_1A9892000, v261, OS_LOG_TYPE_DEFAULT, "Missing track group inputs for track group %{public}@, ignored.", (uint8_t *)&time, 0xCu);
          }
        }

        ++v247;
      }
      while (v247 != *(void *)newTimescalef);
      *(void *)newTimescalef = [v339 countByEnumeratingWithState:&v362 objects:v444 count:16];
      if (*(void *)newTimescalef) {
        continue;
      }
      break;
    }
  }

  CMTime time = buf;
  BOOL v10 = -[NUVideoExportJob writeVideoFrom:toWriter:stillImageTime:createCustomMetadata:geometryTransform:inputSize:outputSize:error:](self, "writeVideoFrom:toWriter:stillImageTime:createCustomMetadata:geometryTransform:inputSize:outputSize:error:", v5, v323, &time, v333 & 1, obja, a3, (double)v307, (double)v306, (double)v312, (double)v311);
LABEL_133:

LABEL_134:
LABEL_135:

  id v6 = v315;
LABEL_136:

  return v10;
}

- (id)renderer:(id *)a3
{
  v5 = [(NURenderJob *)self priority];
  int v6 = [v5 isLow];

  objc_super v7 = [(NURenderJob *)self device];
  v8 = v7;
  if (v6) {
    [v7 lowPriorityRendererWithoutIntermediateCaching:a3];
  }
  else {
  size_t v9 = [v7 rendererWithoutIntermediateCaching:a3];
  }

  return v9;
}

- (id)generateVideoComposition:(id *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)NUVideoExportJob;
  v4 = [(NURenderJob *)&v24 generateVideoComposition:a3];
  if (v4)
  {
    v5 = +[NUVideoUtilities deepMutableCopyVideoComposition:v4];
    int v6 = [(NUVideoExportJob *)self videoProperties];
    [v6 isHDR];

    [v5 setCustomVideoCompositorClass:objc_opt_class()];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    objc_super v7 = objc_msgSend(v5, "instructions", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          BOOL v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v13 = [(NURenderJob *)self composition];
          [v12 setAdjustmentComposition:v13];

          uint64_t v14 = [(NURenderJob *)self request];
          uint64_t v15 = [v14 pipelineFilters];
          [v12 setPipelineFilters:v15];

          uint64_t v16 = [(NUVideoExportJob *)self videoExportRequest];
          float v17 = [v16 colorSpace];
          [v12 setColorSpace:v17];

          [v12 setRenderJob:self];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v9);
    }

    uint64_t v18 = (void *)[v5 copy];
  }
  else
  {
    uint64_t v18 = 0;
  }

  return v18;
}

- (BOOL)requiresVideoComposition
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = [(NUVideoExportJob *)self videoExportRequest];
  v4 = [(NURenderJob *)self prepareNode];
  id v32 = 0;
  v5 = [v4 videoProperties:&v32];
  id v6 = v32;
  [(NUVideoExportJob *)self setVideoProperties:v5];

  objc_super v7 = [(NUVideoExportJob *)self videoProperties];

  if (!v7)
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_156);
    }
    uint64_t v8 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)CMTime buf = 138412290;
      id v35 = v6;
      _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "Failed to prepare video properties: %@", buf, 0xCu);
    }
  }
  uint64_t v9 = [(NURenderJob *)self outputVideo];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v10 = [MEMORY[0x1E4F8CC38] tracksWithMediaType:*MEMORY[0x1E4F15C18] forAsset:v9];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v29;
LABEL_8:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v29 != v13) {
        objc_enumerationMutation(v10);
      }
      uint64_t v15 = *(void **)(*((void *)&v28 + 1) + 8 * v14);
      if ([v15 isEnabled])
      {
        uint64_t v16 = [v15 segments];
        unint64_t v17 = [v16 count];

        if (v17 > 1) {
          goto LABEL_20;
        }
      }
      if (v12 == ++v14)
      {
        uint64_t v12 = [v10 countByEnumeratingWithState:&v28 objects:v33 count:16];
        if (v12) {
          goto LABEL_8;
        }
        break;
      }
    }
  }

  uint64_t v18 = (void *)MEMORY[0x1E4F8CDF8];
  v19 = [v3 destinationURL];
  long long v20 = [v19 pathExtension];
  uint64_t v10 = [v18 typeWithFilenameExtension:v20];

  if (![v10 conformsToType:*MEMORY[0x1E4F44490]])
  {
LABEL_20:
    BOOL v25 = 1;
    goto LABEL_21;
  }
  if ([v3 applyOrientationAsMetadata]) {
    goto LABEL_19;
  }
  long long v21 = [(NURenderJob *)self outputGeometry];
  uint64_t v22 = [v21 orientation];

  long long v23 = [(NUVideoExportJob *)self videoProperties];
  uint64_t v24 = [v23 orientation];

  BOOL v25 = 1;
  if (v22 == 1 && v24 == 1)
  {
LABEL_19:
    v27.receiver = self;
    v27.super_class = (Class)NUVideoExportJob;
    BOOL v25 = [(NURenderJob *)&v27 requiresVideoComposition];
  }
LABEL_21:

  return v25;
}

- (id)prepareNodeWithPipelineState:(id)a3 error:(id *)a4
{
  v16.receiver = self;
  v16.super_class = (Class)NUVideoExportJob;
  -[NURenderJob prepareNodeWithPipelineState:error:](&v16, sel_prepareNodeWithPipelineState_error_, a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_super v7 = [(NUVideoExportJob *)self videoExportRequest];
    int v8 = [v7 applyOrientationAsMetadata];

    if (v8)
    {
      uint64_t v9 = [v6 outputImageGeometry:a4];
      uint64_t v10 = v9;
      if (!v9) {
        goto LABEL_11;
      }
      uint64_t v11 = [v9 orientation];
      uint64_t v12 = 6;
      if (v11 != 8) {
        uint64_t v12 = v11;
      }
      if (v11 == 6) {
        uint64_t v13 = 8;
      }
      else {
        uint64_t v13 = v12;
      }
      uint64_t v14 = [(NUOrientationNode *)[NUResetOrientationNode alloc] initWithOrientation:v13 input:v6];

      id v6 = v14;
    }
  }
  id v6 = v6;
  uint64_t v10 = v6;
LABEL_11:

  return v10;
}

- (id)result
{
  id v3 = objc_alloc_init(_NUVideoExportResult);
  v4 = [(NUVideoExportJob *)self videoExportRequest];
  v5 = [v4 destinationURL];
  [(_NUExportResult *)v3 setDestinationURL:v5];

  id v6 = [(NURenderJob *)self outputGeometry];
  [(_NUExportResult *)v3 setGeometry:v6];

  objc_super v7 = [(NUVideoExportJob *)self digest];
  int v8 = [v7 stringValue];
  [(_NUVideoExportResult *)v3 setDigest:v8];

  return v3;
}

- (id)scalePolicy
{
  v2 = [(NUVideoExportJob *)self videoExportRequest];
  id v3 = [v2 scalePolicy];

  return v3;
}

- (BOOL)wantsOutputVideo
{
  return 1;
}

- (BOOL)wantsOutputGeometry
{
  return 1;
}

- (NUVideoExportJob)initWithExportRequest:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_3633);
  }
  v5 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    id v6 = NSString;
    objc_super v7 = v5;
    int v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    uint64_t v10 = NSStringFromSelector(a2);
    uint64_t v11 = [v6 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v9, v10];
    *(_DWORD *)CMTime buf = 138543362;
    long long v31 = v11;
    _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v12 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v12 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_3633);
      }
      goto LABEL_8;
    }
    if (v12 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_3633);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    uint64_t v13 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    uint64_t v14 = (void *)MEMORY[0x1E4F29060];
    uint64_t v15 = v13;
    objc_super v16 = [v14 callStackSymbols];
    unint64_t v17 = [v16 componentsJoinedByString:@"\n"];
    *(_DWORD *)CMTime buf = 138543362;
    long long v31 = v17;
    _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  uint64_t v18 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  long long v20 = (void *)MEMORY[0x1E4F29060];
  id v21 = specific;
  uint64_t v15 = v18;
  uint64_t v22 = [v20 callStackSymbols];
  long long v23 = [v22 componentsJoinedByString:@"\n"];
  *(_DWORD *)CMTime buf = 138543618;
  long long v31 = specific;
  __int16 v32 = 2114;
  uint64_t v33 = v23;
  _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  uint64_t v24 = (objc_class *)objc_opt_class();
  uint64_t v25 = NSStringFromClass(v24);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUVideoExportJob initWithExportRequest:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUVideoExportJob.m", 87, @"Initializer not available: -[%@ %@], use designated initializer instead.", v26, v27, v28, v29, v25);
}

- (NUVideoExportJob)initWithVideoExportRequest:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NUVideoExportJob;
  v5 = [(NUExportJob *)&v9 initWithExportRequest:v4];
  if (v5)
  {
    id v6 = [v4 composition];
    [(NURenderJob *)v5 setComposition:v6];

    if ([v4 computeDigest])
    {
      objc_super v7 = objc_alloc_init(NUDigest);
      [(NUVideoExportJob *)v5 setDigest:v7];
    }
  }

  return v5;
}

@end