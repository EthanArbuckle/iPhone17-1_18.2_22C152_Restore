@interface _PIPosterLayoutJob
- (BOOL)clockOverlapAcceptable;
- (BOOL)complete:(id *)a3;
- (BOOL)facePositionAcceptable;
- (BOOL)headroomIsFeasible;
- (BOOL)metadataClockOverlapAcceptable;
- (BOOL)prepare:(id *)a3;
- (BOOL)render:(id *)a3;
- (BOOL)usingHeadroom;
- (BOOL)usingLandscapeHeadroom;
- (BOOL)wantsCompleteStage;
- (BOOL)wantsOutputGeometry;
- (BOOL)wantsOutputImage;
- (BOOL)wantsRenderStage;
- (CIImage)segmentationConfidenceMapImage;
- (CIImage)segmentationMatteImage;
- (PFParallaxAssetRegions)layoutRegions;
- (PFPosterLayout)layout;
- (PFWallpaperCompoundDeviceConfiguration)layoutConfiguration;
- (_PIPosterLayoutJob)initWithPosterLayoutRequest:(id)a3;
- (_PIPosterLayoutJob)initWithRequest:(id)a3;
- (float)_headroomPenaltyForIntermediateLayout:(id)a3 originalFullExtent:(CGRect)a4 layoutConfiguration:(id)a5;
- (float)confidenceMapScore;
- (float)confidencePureBackground;
- (float)confidencePureForeground;
- (float)cropScore;
- (float)faceLocalConfidence;
- (float)faceSize;
- (float)groundedScore;
- (float)landscapeCropScore;
- (float)landscapeLayoutScore;
- (float)layoutScore;
- (float)localConfidenceScore;
- (float)mattePureBackground;
- (float)mattePureForeground;
- (float)nFaces;
- (float)parallaxScore;
- (float)resolutionRatio;
- (float)segmentationScore;
- (id)_layoutFromIntermediateLayouts:(id)a3 layoutConfiguration:(id)a4 fullExtent:(CGRect)a5;
- (id)generateOrientedLayoutsForFullExtent:(CGRect)a3 layoutConfiguration:(id)a4 layoutRegions:(id)a5 segmentationMatteImage:(id)a6 segmentationClassification:(unint64_t)a7 error:(id *)a8;
- (id)result;
- (id)scalePolicy;
- (unint64_t)segmentationClassification;
- (void)setClockOverlapAcceptable:(BOOL)a3;
- (void)setConfidenceMapScore:(float)a3;
- (void)setConfidencePureBackground:(float)a3;
- (void)setConfidencePureForeground:(float)a3;
- (void)setCropScore:(float)a3;
- (void)setFaceLocalConfidence:(float)a3;
- (void)setFacePositionAcceptable:(BOOL)a3;
- (void)setFaceSize:(float)a3;
- (void)setGroundedScore:(float)a3;
- (void)setHeadroomIsFeasible:(BOOL)a3;
- (void)setLandscapeCropScore:(float)a3;
- (void)setLandscapeLayoutScore:(float)a3;
- (void)setLayout:(id)a3;
- (void)setLayoutConfiguration:(id)a3;
- (void)setLayoutRegions:(id)a3;
- (void)setLayoutScore:(float)a3;
- (void)setLocalConfidenceScore:(float)a3;
- (void)setMattePureBackground:(float)a3;
- (void)setMattePureForeground:(float)a3;
- (void)setMetadataClockOverlapAcceptable:(BOOL)a3;
- (void)setNFaces:(float)a3;
- (void)setParallaxScore:(float)a3;
- (void)setResolutionRatio:(float)a3;
- (void)setSegmentationClassification:(unint64_t)a3;
- (void)setSegmentationConfidenceMapImage:(id)a3;
- (void)setSegmentationMatteImage:(id)a3;
- (void)setSegmentationScore:(float)a3;
- (void)setUsingHeadroom:(BOOL)a3;
- (void)setUsingLandscapeHeadroom:(BOOL)a3;
@end

@implementation _PIPosterLayoutJob

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_segmentationConfidenceMapImage, 0);
  objc_storeStrong((id *)&self->_segmentationMatteImage, 0);
  objc_storeStrong((id *)&self->_layoutRegions, 0);
  objc_storeStrong((id *)&self->_layoutConfiguration, 0);
}

- (void)setUsingLandscapeHeadroom:(BOOL)a3
{
  self->_usingLandscapeHeadroom = a3;
}

- (BOOL)usingLandscapeHeadroom
{
  return self->_usingLandscapeHeadroom;
}

- (void)setUsingHeadroom:(BOOL)a3
{
  self->_usingHeadroom = a3;
}

- (BOOL)usingHeadroom
{
  return self->_usingHeadroom;
}

- (void)setHeadroomIsFeasible:(BOOL)a3
{
  self->_headroomIsFeasible = a3;
}

- (BOOL)headroomIsFeasible
{
  return self->_headroomIsFeasible;
}

- (void)setMetadataClockOverlapAcceptable:(BOOL)a3
{
  self->_metadataClockOverlapAcceptable = a3;
}

- (BOOL)metadataClockOverlapAcceptable
{
  return self->_metadataClockOverlapAcceptable;
}

- (void)setFacePositionAcceptable:(BOOL)a3
{
  self->_facePositionAcceptable = a3;
}

- (BOOL)facePositionAcceptable
{
  return self->_facePositionAcceptable;
}

- (void)setFaceLocalConfidence:(float)a3
{
  self->_faceLocalConfidence = a3;
}

- (float)faceLocalConfidence
{
  return self->_faceLocalConfidence;
}

- (void)setFaceSize:(float)a3
{
  self->_faceSize = a3;
}

- (float)faceSize
{
  return self->_faceSize;
}

- (void)setResolutionRatio:(float)a3
{
  self->_resolutionRatio = a3;
}

- (float)resolutionRatio
{
  return self->_resolutionRatio;
}

- (void)setClockOverlapAcceptable:(BOOL)a3
{
  self->_clockOverlapAcceptable = a3;
}

- (BOOL)clockOverlapAcceptable
{
  return self->_clockOverlapAcceptable;
}

- (void)setConfidencePureForeground:(float)a3
{
  self->_confidencePureForeground = a3;
}

- (float)confidencePureForeground
{
  return self->_confidencePureForeground;
}

- (void)setConfidencePureBackground:(float)a3
{
  self->_confidencePureBackground = a3;
}

- (float)confidencePureBackground
{
  return self->_confidencePureBackground;
}

- (void)setMattePureForeground:(float)a3
{
  self->_mattePureForeground = a3;
}

- (float)mattePureForeground
{
  return self->_mattePureForeground;
}

- (void)setMattePureBackground:(float)a3
{
  self->_mattePureBackground = a3;
}

- (float)mattePureBackground
{
  return self->_mattePureBackground;
}

- (void)setParallaxScore:(float)a3
{
  self->_parallaxScore = a3;
}

- (float)parallaxScore
{
  return self->_parallaxScore;
}

- (void)setConfidenceMapScore:(float)a3
{
  self->_confidenceMapScore = a3;
}

- (float)confidenceMapScore
{
  return self->_confidenceMapScore;
}

- (void)setGroundedScore:(float)a3
{
  self->_groundedScore = a3;
}

- (float)groundedScore
{
  return self->_groundedScore;
}

- (void)setLocalConfidenceScore:(float)a3
{
  self->_localConfidenceScore = a3;
}

- (float)localConfidenceScore
{
  return self->_localConfidenceScore;
}

- (void)setSegmentationScore:(float)a3
{
  self->_segmentationScore = a3;
}

- (float)segmentationScore
{
  return self->_segmentationScore;
}

- (void)setNFaces:(float)a3
{
  self->_nFaces = a3;
}

- (float)nFaces
{
  return self->_nFaces;
}

- (void)setLandscapeLayoutScore:(float)a3
{
  self->_landscapeLayoutScore = a3;
}

- (float)landscapeLayoutScore
{
  return self->_landscapeLayoutScore;
}

- (void)setLayoutScore:(float)a3
{
  self->_layoutScore = a3;
}

- (float)layoutScore
{
  return self->_layoutScore;
}

- (void)setLandscapeCropScore:(float)a3
{
  self->_landscapeCropScore = a3;
}

- (float)landscapeCropScore
{
  return self->_landscapeCropScore;
}

- (void)setCropScore:(float)a3
{
  self->_cropScore = a3;
}

- (float)cropScore
{
  return self->_cropScore;
}

- (void)setLayout:(id)a3
{
}

- (PFPosterLayout)layout
{
  return self->_layout;
}

- (void)setSegmentationClassification:(unint64_t)a3
{
  self->_segmentationClassification = a3;
}

- (unint64_t)segmentationClassification
{
  return self->_segmentationClassification;
}

- (void)setSegmentationConfidenceMapImage:(id)a3
{
}

- (CIImage)segmentationConfidenceMapImage
{
  return self->_segmentationConfidenceMapImage;
}

- (void)setSegmentationMatteImage:(id)a3
{
}

- (CIImage)segmentationMatteImage
{
  return self->_segmentationMatteImage;
}

- (void)setLayoutRegions:(id)a3
{
}

- (PFParallaxAssetRegions)layoutRegions
{
  return self->_layoutRegions;
}

- (void)setLayoutConfiguration:(id)a3
{
}

- (PFWallpaperCompoundDeviceConfiguration)layoutConfiguration
{
  return self->_layoutConfiguration;
}

- (id)result
{
  v57[21] = *MEMORY[0x1E4F143B8];
  v3 = objc_alloc_init(_PIPosterLayoutResult);
  v4 = [(_PIPosterLayoutJob *)self layout];
  v53 = v3;
  [(_PIPosterLayoutResult *)v3 setLayout:v4];

  id v48 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v56[0] = *MEMORY[0x1E4F8D238];
  v52 = [NSNumber numberWithUnsignedInteger:50];
  v57[0] = v52;
  v56[1] = *MEMORY[0x1E4F8D180];
  v5 = NSNumber;
  [(_PIPosterLayoutJob *)self cropScore];
  v51 = objc_msgSend(v5, "numberWithFloat:");
  v57[1] = v51;
  v56[2] = *MEMORY[0x1E4F8D1B8];
  v6 = NSNumber;
  [(_PIPosterLayoutJob *)self layoutScore];
  v50 = objc_msgSend(v6, "numberWithFloat:");
  v57[2] = v50;
  v56[3] = *MEMORY[0x1E4F8D1E0];
  v7 = NSNumber;
  [(_PIPosterLayoutJob *)self nFaces];
  v49 = objc_msgSend(v7, "numberWithFloat:");
  v57[3] = v49;
  v56[4] = *MEMORY[0x1E4F8D1F8];
  v8 = NSNumber;
  [(_PIPosterLayoutJob *)self segmentationScore];
  v47 = objc_msgSend(v8, "numberWithFloat:");
  v57[4] = v47;
  v56[5] = *MEMORY[0x1E4F8D1C0];
  v9 = NSNumber;
  [(_PIPosterLayoutJob *)self localConfidenceScore];
  v46 = objc_msgSend(v9, "numberWithFloat:");
  v57[5] = v46;
  v56[6] = *MEMORY[0x1E4F8D1A0];
  v10 = NSNumber;
  [(_PIPosterLayoutJob *)self groundedScore];
  v45 = objc_msgSend(v10, "numberWithFloat:");
  v57[6] = v45;
  v56[7] = *MEMORY[0x1E4F8D168];
  v11 = NSNumber;
  [(_PIPosterLayoutJob *)self confidenceMapScore];
  v44 = objc_msgSend(v11, "numberWithFloat:");
  v57[7] = v44;
  v56[8] = *MEMORY[0x1E4F8D1E8];
  v12 = NSNumber;
  [(_PIPosterLayoutJob *)self parallaxScore];
  v43 = objc_msgSend(v12, "numberWithFloat:");
  v57[8] = v43;
  v56[9] = *MEMORY[0x1E4F8D1C8];
  v13 = NSNumber;
  [(_PIPosterLayoutJob *)self mattePureBackground];
  v42 = objc_msgSend(v13, "numberWithFloat:");
  v57[9] = v42;
  v56[10] = *MEMORY[0x1E4F8D1D0];
  v14 = NSNumber;
  [(_PIPosterLayoutJob *)self mattePureForeground];
  v41 = objc_msgSend(v14, "numberWithFloat:");
  v57[10] = v41;
  v56[11] = *MEMORY[0x1E4F8D170];
  v15 = NSNumber;
  [(_PIPosterLayoutJob *)self confidencePureBackground];
  v40 = objc_msgSend(v15, "numberWithFloat:");
  v57[11] = v40;
  v56[12] = *MEMORY[0x1E4F8D178];
  v16 = NSNumber;
  [(_PIPosterLayoutJob *)self confidencePureForeground];
  v39 = objc_msgSend(v16, "numberWithFloat:");
  v57[12] = v39;
  v56[13] = *MEMORY[0x1E4F8D160];
  v38 = objc_msgSend(NSNumber, "numberWithBool:", -[_PIPosterLayoutJob clockOverlapAcceptable](self, "clockOverlapAcceptable"));
  v57[13] = v38;
  v56[14] = *MEMORY[0x1E4F8D1F0];
  v17 = NSNumber;
  [(_PIPosterLayoutJob *)self resolutionRatio];
  v37 = objc_msgSend(v17, "numberWithFloat:");
  v57[14] = v37;
  v56[15] = *MEMORY[0x1E4F8D198];
  v18 = NSNumber;
  [(_PIPosterLayoutJob *)self faceSize];
  v19 = objc_msgSend(v18, "numberWithFloat:");
  v57[15] = v19;
  v56[16] = *MEMORY[0x1E4F8D188];
  v20 = NSNumber;
  [(_PIPosterLayoutJob *)self faceLocalConfidence];
  v21 = objc_msgSend(v20, "numberWithFloat:");
  v57[16] = v21;
  v56[17] = *MEMORY[0x1E4F8D190];
  v22 = objc_msgSend(NSNumber, "numberWithBool:", -[_PIPosterLayoutJob facePositionAcceptable](self, "facePositionAcceptable"));
  v57[17] = v22;
  v56[18] = *MEMORY[0x1E4F8D158];
  v23 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_PIPosterLayoutJob segmentationClassification](self, "segmentationClassification"));
  v57[18] = v23;
  v56[19] = *MEMORY[0x1E4F8D1D8];
  v24 = objc_msgSend(NSNumber, "numberWithBool:", -[_PIPosterLayoutJob metadataClockOverlapAcceptable](self, "metadataClockOverlapAcceptable"));
  v57[19] = v24;
  v56[20] = *MEMORY[0x1E4F8D228];
  v25 = objc_msgSend(NSNumber, "numberWithBool:", -[_PIPosterLayoutJob usingHeadroom](self, "usingHeadroom"));
  v57[20] = v25;
  v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:21];
  v27 = (void *)[v48 initWithDictionary:v26];

  v28 = [(_PIPosterLayoutJob *)self layout];
  v29 = [v28 landscapeLayout];

  if (v29)
  {
    v54[0] = *MEMORY[0x1E4F8D1A8];
    v30 = NSNumber;
    [(_PIPosterLayoutJob *)self landscapeCropScore];
    v31 = objc_msgSend(v30, "numberWithFloat:");
    v55[0] = v31;
    v54[1] = *MEMORY[0x1E4F8D1B0];
    v32 = NSNumber;
    [(_PIPosterLayoutJob *)self landscapeLayoutScore];
    v33 = objc_msgSend(v32, "numberWithFloat:");
    v55[1] = v33;
    v54[2] = *MEMORY[0x1E4F8D230];
    v34 = objc_msgSend(NSNumber, "numberWithBool:", -[_PIPosterLayoutJob usingLandscapeHeadroom](self, "usingLandscapeHeadroom"));
    v55[2] = v34;
    v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:3];
    [v27 addEntriesFromDictionary:v35];
  }
  [(_PIPosterLayoutResult *)v53 setScores:v27];

  return v53;
}

- (BOOL)complete:(id *)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(_PIPosterLayoutJob *)self layoutRegions];
  if (!v4)
  {
    v25 = NUAssertLogger_13666();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = [NSString stringWithFormat:@"Missing layout regions"];
      int v38 = 138543362;
      v39 = v26;
      _os_log_error_impl(&dword_1A9680000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v38, 0xCu);
    }
    v27 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v29 = NUAssertLogger_13666();
    BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v30)
      {
        v33 = dispatch_get_specific(*v27);
        v34 = (void *)MEMORY[0x1E4F29060];
        id v35 = v33;
        v36 = [v34 callStackSymbols];
        v37 = [v36 componentsJoinedByString:@"\n"];
        int v38 = 138543618;
        v39 = v33;
        __int16 v40 = 2114;
        v41 = v37;
        _os_log_error_impl(&dword_1A9680000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v38, 0x16u);
      }
    }
    else if (v30)
    {
      v31 = [MEMORY[0x1E4F29060] callStackSymbols];
      v32 = [v31 componentsJoinedByString:@"\n"];
      int v38 = 138543362;
      v39 = v32;
      _os_log_error_impl(&dword_1A9680000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v38, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v5 = (void *)v4;
  if ([(_PIPosterLayoutJob *)self segmentationClassification] == 1)
  {
    v6 = [v5 faceRegions];
  }
  else
  {
    unint64_t v7 = [(_PIPosterLayoutJob *)self segmentationClassification];
    double v8 = 0.0;
    if (v7 != 2) {
      goto LABEL_8;
    }
    v6 = objc_msgSend(v5, "petRegions", 0.0);
  }
  v9 = v6;
  uint64_t v10 = [v6 count];

  double v8 = 0.0;
  if (v10 == 1) {
    *(float *)&double v8 = 0.5;
  }
LABEL_8:
  [(_PIPosterLayoutJob *)self setParallaxScore:v8];
  v11 = [(_PIPosterLayoutJob *)self layoutRegions];
  v12 = [v11 faceRegions];
  float v13 = (float)(unint64_t)[v12 count] / 10.0;

  if (v13 <= 1.0) {
    *(float *)&double v14 = v13;
  }
  else {
    *(float *)&double v14 = 1.0;
  }
  [(_PIPosterLayoutJob *)self setNFaces:v14];
  v15 = [(_PIPosterLayoutJob *)self layout];
  v16 = [v15 portraitLayout];
  [v16 visibleFrame];
  float v18 = v17;

  v19 = [(_PIPosterLayoutJob *)self layoutConfiguration];
  v20 = [v19 portraitConfiguration];
  [v20 screenSize];
  float v22 = v21;

  *(float *)&double v23 = fminf(v18 / v22, 1.0);
  [(_PIPosterLayoutJob *)self setResolutionRatio:v23];

  return 1;
}

- (BOOL)render:(id *)a3
{
  uint64_t v309 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [(_PIPosterLayoutJob *)self layoutConfiguration];
  if (!v6)
  {
    v235 = NUAssertLogger_13666();
    if (os_log_type_enabled(v235, OS_LOG_TYPE_ERROR))
    {
      v236 = [NSString stringWithFormat:@"Missing layout configuration"];
      *(_DWORD *)buf = 138543362;
      v304 = v236;
      _os_log_error_impl(&dword_1A9680000, v235, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v237 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v239 = NUAssertLogger_13666();
    BOOL v240 = os_log_type_enabled(v239, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v240)
      {
        v253 = dispatch_get_specific(*v237);
        v254 = (void *)MEMORY[0x1E4F29060];
        v3 = v253;
        v255 = [v254 callStackSymbols];
        v256 = [v255 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v304 = (const void **)v253;
        __int16 v305 = 2114;
        double v306 = *(double *)&v256;
        _os_log_error_impl(&dword_1A9680000, v239, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

        goto LABEL_87;
      }
    }
    else if (v240)
    {
      v241 = [MEMORY[0x1E4F29060] callStackSymbols];
      v3 = [v241 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v304 = v3;
      _os_log_error_impl(&dword_1A9680000, v239, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_87:
    }

    int v245 = _NUAssertFailHandler();
    goto LABEL_89;
  }
  unint64_t v7 = (void *)v6;
  uint64_t v8 = [(_PIPosterLayoutJob *)self layoutRegions];
  if (!v8)
  {
    v242 = NUAssertLogger_13666();
    if (os_log_type_enabled(v242, OS_LOG_TYPE_ERROR))
    {
      v243 = [NSString stringWithFormat:@"Missing layout regions"];
      *(_DWORD *)buf = 138543362;
      v304 = v243;
      _os_log_error_impl(&dword_1A9680000, v242, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v237 = (const void **)MEMORY[0x1E4F7A308];
    v244 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v239 = NUAssertLogger_13666();
    int v245 = os_log_type_enabled(v239, OS_LOG_TYPE_ERROR);
    if (!v244)
    {
      if (v245)
      {
        v246 = [MEMORY[0x1E4F29060] callStackSymbols];
        v3 = [v246 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v304 = v3;
        _os_log_error_impl(&dword_1A9680000, v239, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_91:
        goto LABEL_92;
      }
      goto LABEL_92;
    }
LABEL_89:
    if (v245)
    {
      v257 = dispatch_get_specific(*v237);
      v258 = (void *)MEMORY[0x1E4F29060];
      v3 = v257;
      v259 = [v258 callStackSymbols];
      v260 = [v259 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v304 = (const void **)v257;
      __int16 v305 = 2114;
      double v306 = *(double *)&v260;
      _os_log_error_impl(&dword_1A9680000, v239, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_91;
    }
LABEL_92:

    int v250 = _NUAssertFailHandler();
    goto LABEL_93;
  }
  v9 = (void *)v8;
  uint64_t v10 = [(NURenderJob *)self outputGeometry];
  if (!v10)
  {
    v247 = NUAssertLogger_13666();
    if (os_log_type_enabled(v247, OS_LOG_TYPE_ERROR))
    {
      v248 = [NSString stringWithFormat:@"Missing output geometry"];
      *(_DWORD *)buf = 138543362;
      v304 = v248;
      _os_log_error_impl(&dword_1A9680000, v247, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v3 = (const void **)MEMORY[0x1E4F7A308];
    v249 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v239 = NUAssertLogger_13666();
    int v250 = os_log_type_enabled(v239, OS_LOG_TYPE_ERROR);
    if (!v249)
    {
      if (!v250) {
        goto LABEL_96;
      }
      v251 = [MEMORY[0x1E4F29060] callStackSymbols];
      v252 = [v251 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v304 = v252;
      _os_log_error_impl(&dword_1A9680000, v239, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      goto LABEL_95;
    }
LABEL_93:
    if (!v250) {
      goto LABEL_96;
    }
    v261 = dispatch_get_specific(*v3);
    v262 = (void *)MEMORY[0x1E4F29060];
    v252 = v261;
    v263 = [v262 callStackSymbols];
    v264 = [v263 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543618;
    v304 = (const void **)v261;
    __int16 v305 = 2114;
    double v306 = *(double *)&v264;
    _os_log_error_impl(&dword_1A9680000, v239, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_95:
LABEL_96:

    _NUAssertFailHandler();
  }
  v11 = v10;
  [v10 extent];
  NUPixelRectToCGRect();
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v20 = [(_PIPosterLayoutJob *)self layoutRequest];
  uint64_t v21 = [v20 layoutProvider];
  float v22 = (void *)v21;
  if (v21) {
    double v23 = (_PIPosterLayoutJob *)v21;
  }
  else {
    double v23 = self;
  }
  v24 = v23;

  v25 = [v7 portraitConfiguration];
  v26 = [(_PIPosterLayoutJob *)self layoutRegions];
  v27 = [(_PIPosterLayoutJob *)self segmentationMatteImage];
  v28 = -[_PIPosterLayoutJob generateOrientedLayoutsForFullExtent:layoutConfiguration:layoutRegions:segmentationMatteImage:segmentationClassification:error:](v24, "generateOrientedLayoutsForFullExtent:layoutConfiguration:layoutRegions:segmentationMatteImage:segmentationClassification:error:", v25, v26, v27, [(_PIPosterLayoutJob *)self segmentationClassification], a3, v13, v15, v17, v19);

  if (v28)
  {
    v29 = [v7 portraitConfiguration];
    uint64_t v30 = -[_PIPosterLayoutJob _layoutFromIntermediateLayouts:layoutConfiguration:fullExtent:](self, "_layoutFromIntermediateLayouts:layoutConfiguration:fullExtent:", v28, v29, v13, v15, v17, v19);

    uint64_t v31 = [v7 landscapeConfiguration];
    v292 = v24;
    v293 = v11;
    if (v31
      && (v32 = (void *)v31,
          int v33 = [MEMORY[0x1E4F8CE48] deviceSupportsLandscapeConfiguration],
          v32,
          v33))
    {
      v34 = [v7 landscapeConfiguration];
      id v35 = [(_PIPosterLayoutJob *)self layoutRegions];
      [(_PIPosterLayoutJob *)self segmentationMatteImage];
      v37 = uint64_t v36 = v30;
      int v38 = -[_PIPosterLayoutJob generateOrientedLayoutsForFullExtent:layoutConfiguration:layoutRegions:segmentationMatteImage:segmentationClassification:error:](v24, "generateOrientedLayoutsForFullExtent:layoutConfiguration:layoutRegions:segmentationMatteImage:segmentationClassification:error:", v34, v35, v37, [(_PIPosterLayoutJob *)self segmentationClassification], a3, v13, v15, v17, v19);

      uint64_t v30 = v36;
      v39 = [v7 landscapeConfiguration];
      uint64_t v40 = -[_PIPosterLayoutJob _layoutFromIntermediateLayouts:layoutConfiguration:fullExtent:](self, "_layoutFromIntermediateLayouts:layoutConfiguration:fullExtent:", v38, v39, v13, v15, v17, v19);
    }
    else
    {
      uint64_t v40 = 0;
      int v38 = 0;
    }
    v296 = (void *)v30;
    v294 = (void *)v40;
    v297 = (void *)[objc_alloc(MEMORY[0x1E4F8CD10]) initWithPortraitLayout:v30 landscapeLayout:v40];
    [(_PIPosterLayoutJob *)self setLayout:"setLayout:"];
    v41 = [v28 lastObject];
    [v41 layoutScore];
    *(float *)&double v42 = v42;
    [(_PIPosterLayoutJob *)self setLayoutScore:v42];
    unint64_t v43 = 0x1E4F8C000uLL;
    v44 = (void *)MEMORY[0x1E4F8CCC8];
    v45 = [v7 portraitConfiguration];
    objc_msgSend(v44, "headroomPenaltyForIntermediateLayout:originalFullExtent:layoutConfiguration:", v41, v45, v13, v15, v17, v19);
    float v47 = v46;
    [(_PIPosterLayoutJob *)self layoutScore];
    *(float *)&double v49 = v48 - v47;
    [(_PIPosterLayoutJob *)self setLayoutScore:v49];

    [v41 cropScore];
    *(float *)&double v50 = v50;
    [(_PIPosterLayoutJob *)self setCropScore:v50];
    v51 = (void *)MEMORY[0x1E4F8CCC8];
    v52 = [v7 portraitConfiguration];
    objc_msgSend(v51, "headroomPenaltyForIntermediateLayout:originalFullExtent:layoutConfiguration:", v41, v52, v13, v15, v17, v19);
    float v54 = v53;
    [(_PIPosterLayoutJob *)self cropScore];
    *(float *)&double v56 = v55 - v54;
    [(_PIPosterLayoutJob *)self setCropScore:v56];

    v295 = v38;
    v57 = [v38 lastObject];
    v58 = v57;
    if (v57)
    {
      [v57 layoutScore];
      *(float *)&double v59 = v59;
      [(_PIPosterLayoutJob *)self setLandscapeLayoutScore:v59];
      v60 = (void *)MEMORY[0x1E4F8CCC8];
      v61 = [v7 landscapeConfiguration];
      objc_msgSend(v60, "headroomPenaltyForIntermediateLayout:originalFullExtent:layoutConfiguration:", v58, v61, v13, v15, v17, v19);
      float v63 = v62;
      [(_PIPosterLayoutJob *)self landscapeLayoutScore];
      *(float *)&double v65 = v64 - v63;
      [(_PIPosterLayoutJob *)self setLandscapeLayoutScore:v65];

      [v58 cropScore];
      *(float *)&double v66 = v66;
      [(_PIPosterLayoutJob *)self setLandscapeCropScore:v66];
      v67 = (void *)MEMORY[0x1E4F8CCC8];
      v68 = [v7 landscapeConfiguration];
      objc_msgSend(v67, "headroomPenaltyForIntermediateLayout:originalFullExtent:layoutConfiguration:", v58, v68, v13, v15, v17, v19);
      float v70 = v69;
      [(_PIPosterLayoutJob *)self landscapeCropScore];
      *(float *)&double v72 = v71 - v70;
      [(_PIPosterLayoutJob *)self setLandscapeCropScore:v72];
    }
    v73 = [(_PIPosterLayoutJob *)self layoutRequest];
    char v74 = [v73 shouldConstrainLayoutToBounds];

    if ((v74 & 1) == 0)
    {
      v75 = (void *)MEMORY[0x1E4F8CCC8];
      v76 = [v7 portraitConfiguration];
      objc_msgSend(v75, "headroomPenaltyForIntermediateLayout:originalFullExtent:layoutConfiguration:", v41, v76, v13, v15, v17, v19);
      [(_PIPosterLayoutJob *)self setUsingHeadroom:v77 > 0.0];

      if (v58)
      {
        v78 = (void *)MEMORY[0x1E4F8CCC8];
        v79 = [v7 landscapeConfiguration];
        objc_msgSend(v78, "headroomPenaltyForIntermediateLayout:originalFullExtent:layoutConfiguration:", v58, v79, v13, v15, v17, v19);
        [(_PIPosterLayoutJob *)self setUsingLandscapeHeadroom:v80 > 0.0];
      }
    }
    v81 = [(_PIPosterLayoutJob *)self layoutRequest];
    int v82 = [v81 shouldComputeAllScores];

    if (v82)
    {
      v83 = [v7 portraitConfiguration];
      -[_PIPosterLayoutJob setClockOverlapAcceptable:](self, "setClockOverlapAcceptable:", [v41 clockOverlapAcceptableForLayoutConfiguration:v83]);

      v84 = [(NURenderJob *)self renderer:a3];
      v85 = [(_PIPosterLayoutJob *)self segmentationMatteImage];

      if (v85) {
        BOOL v86 = v84 == 0;
      }
      else {
        BOOL v86 = 0;
      }
      BOOL v87 = !v86;
      if (!v86)
      {
        v281 = v28;
        v282 = v84;
        BOOL r2_28 = v87;
        id v291 = objc_alloc_init(MEMORY[0x1E4F7A4A8]);
        v88 = [v9 faceRegions];
        v288 = v9;
        double v283 = v17;
        if ([v88 count])
        {
          v89 = [v9 faceRegions];
          v90 = [v89 firstObject];
          [v90 rectValue];
          double v92 = v91;
          double v94 = v93;
          double v96 = v95;
          double v289 = v97;
        }
        else
        {
          double v92 = *MEMORY[0x1E4F1DB20];
          double v94 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
          double v96 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
          double v289 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
        }

        v98 = v297;
        [v297 imageSize];
        double v100 = v99;
        [v297 imageSize];
        double v102 = v101;
        v103 = [(_PIPosterLayoutJob *)self segmentationMatteImage];

        double v280 = v19;
        if (v103)
        {
          double v104 = v96;
          double v105 = v92 * v100 + 0.0;
          double r2_8 = v104;
          double r2_16 = v94;
          double v284 = v92;
          double v286 = 0.0;
          double v271 = v104 * v100;
          v106 = [(_PIPosterLayoutJob *)self segmentationMatteImage];
          v107 = [v297 portraitLayout];
          [v107 visibleFrame];
          NURectNormalize();
          [v106 extent];
          NURectDenormalize();
          CGFloat v109 = v108;
          CGFloat v111 = v110;
          double v113 = v112;
          double v115 = v114;

          CGFloat r2 = v109;
          v310.origin.double x = v109;
          v310.origin.double y = v111;
          v310.size.double width = v113;
          v310.size.double height = v115;
          CGRect v311 = CGRectIntegral(v310);
          v116 = objc_msgSend(v106, "imageByCroppingToRect:", v311.origin.x, v311.origin.y, v311.size.width, v311.size.height);
          objc_msgSend(MEMORY[0x1E4F8CCB8], "inflatePersonFaceRect:", v105, v94 * v102 + 0.0, v271, v289 * v102);
          if (v113 >= v115) {
            double v121 = v115;
          }
          else {
            double v121 = v113;
          }
          CGRect v312 = CGRectInset(*(CGRect *)&v117, v121 * -0.05, v121 * -0.05);
          double x = v312.origin.x;
          double y = v312.origin.y;
          double width = v312.size.width;
          double height = v312.size.height;
          v126 = [v297 portraitLayout];
          [v126 visibleFrame];
          double v131 = x - v130;
          double v132 = 0.0;
          if (v128 != 0.0)
          {
            double v131 = v131 / v128;
            double v132 = width / v128;
          }
          double v133 = y - v127;
          if (v129 != 0.0)
          {
            double v133 = v133 / v129;
            double v286 = height / v129;
          }
          [v106 extent];
          CGFloat v136 = v134 + v131 * v135;
          CGFloat v139 = v137 + v133 * v138;
          CGFloat v140 = v132 * v135;
          CGFloat v141 = v286 * v138;

          v313.origin.double x = v136;
          v313.origin.double y = v139;
          v313.size.double width = v140;
          v313.size.double height = v141;
          v320.origin.double x = r2;
          v320.origin.double y = v111;
          v320.size.double width = v113;
          v320.size.double height = v115;
          CGRect v314 = CGRectIntersection(v313, v320);
          double v142 = v314.origin.x;
          double v143 = v314.origin.y;
          double v144 = v314.size.width;
          double v145 = v314.size.height;
          v287 = [v291 computeHistogramFromMatte:v116];
          v146 = +[PISegmentationHelper localConfidenceImage:v116];
          [v146 extent];
          double v148 = v147;
          double v150 = v149;
          double v152 = v151;
          double v154 = v153;
          v155 = [v282 context];
          +[PISegmentationHelper localConfidenceScoreForLocalConfidenceImage:extent:context:](PISegmentationHelper, "localConfidenceScoreForLocalConfidenceImage:extent:context:", v146, v155, v148, v150, v152, v154);
          int v267 = v156;

          v157 = [v282 context];
          +[PISegmentationHelper localConfidenceScoreForLocalConfidenceImage:extent:context:](PISegmentationHelper, "localConfidenceScoreForLocalConfidenceImage:extent:context:", v146, v157, v142, v143, v144, v145);
          int v268 = v158;

          v159 = [v282 context];
          +[PISegmentationHelper groundedScoreForSegmentationMatte:v116 context:v159];
          int v266 = v160;

          v98 = v297;
          double v92 = v284;
          double v96 = r2_8;
          double v94 = r2_16;
          unint64_t v43 = 0x1E4F8C000;
        }
        else
        {
          v287 = 0;
          int v266 = 0;
          int v267 = 0;
          int v268 = 0;
        }
        v161 = [(_PIPosterLayoutJob *)self segmentationConfidenceMapImage];

        if (v161)
        {
          v162 = [(_PIPosterLayoutJob *)self segmentationConfidenceMapImage];
          [v98 imageSize];
          [v98 imageSize];
          v163 = [v98 portraitLayout];
          [v163 visibleFrame];
          NURectNormalize();
          [v162 extent];
          NURectDenormalize();
          CGFloat v165 = v164;
          CGFloat v167 = v166;
          CGFloat v169 = v168;
          CGFloat v171 = v170;

          v315.origin.double x = v165;
          v315.origin.double y = v167;
          v315.size.double width = v169;
          v315.size.double height = v171;
          CGRect v316 = CGRectIntegral(v315);
          v172 = objc_msgSend(v162, "imageByCroppingToRect:", v316.origin.x, v316.origin.y, v316.size.width, v316.size.height);
          v285 = [v291 computeHistogramFromMatte:v172];
        }
        else
        {
          v285 = 0;
        }
        if (v96 >= v289) {
          double v173 = v96;
        }
        else {
          double v173 = v289;
        }
        if ([(_PIPosterLayoutJob *)self segmentationClassification] == 1)
        {
          v174 = *(void **)(v43 + 3272);
          [v98 imageSize];
          double v177 = v175;
          double v178 = v176;
          if (v175 == 0.0
            || v176 == 0.0
            || v175 == *MEMORY[0x1E4F8A250] && v176 == *(double *)(MEMORY[0x1E4F8A250] + 8))
          {
            double v179 = 1.0;
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 134218496;
              v304 = *(const void ***)&v177;
              __int16 v305 = 2048;
              double v306 = v178;
              __int16 v307 = 2048;
              uint64_t v308 = 0x3FF0000000000000;
              _os_log_fault_impl(&dword_1A9680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "PFSizeGetAspectRatio produced an undefined aspect ratio from size {%lf, %lf}. Returning %f. Use PFSizeGetAspectRatioWithDefault() to provide a value for this case.", buf, 0x20u);
            }
          }
          else
          {
            double v179 = fabs(v175 / v176);
          }
          v180 = (CGFloat *)MEMORY[0x1E4F1DB20];
          unsigned int v265 = objc_msgSend(v174, "facePositionAcceptable:imageAspect:", v92, v94, v96, v289, v179);
        }
        else
        {
          unsigned int v265 = 1;
          v180 = (CGFloat *)MEMORY[0x1E4F1DB20];
        }
        float v181 = v173;
        +[PISegmentationHelper bimodalScoreForHistogram:v287];
        int v269 = v182;
        int v184 = v183;
        int v186 = v185;
        +[PISegmentationHelper bimodalScoreForHistogram:v285];
        int v270 = v187;
        int v272 = v188;
        int v190 = v189;
        CGFloat v192 = *v180;
        double v191 = v180[1];
        CGFloat v194 = v180[2];
        double v193 = v180[3];
        long long v298 = 0u;
        long long v299 = 0u;
        long long v300 = 0u;
        long long v301 = 0u;
        v195 = [v9 faceRegions];
        uint64_t v196 = [v195 countByEnumeratingWithState:&v298 objects:v302 count:16];
        float v290 = v181;
        int r2_16a = v186;
        int r2_8a = v190;
        int r2a = v184;
        if (v196)
        {
          uint64_t v197 = v196;
          uint64_t v198 = *(void *)v299;
          do
          {
            for (uint64_t i = 0; i != v197; ++i)
            {
              if (*(void *)v299 != v198) {
                objc_enumerationMutation(v195);
              }
              [*(id *)(*((void *)&v298 + 1) + 8 * i) rectValue];
              CGFloat v201 = v200;
              CGFloat v203 = v202;
              CGFloat v205 = v204;
              CGFloat v207 = v206;
              v317.origin.double x = v192;
              v317.origin.double y = v191;
              v317.size.double width = v194;
              v317.size.double height = v193;
              if (CGRectIsNull(v317))
              {
                CGFloat v192 = v201;
                double v191 = v203;
                CGFloat v194 = v205;
                double v193 = v207;
              }
              else
              {
                v318.origin.double x = v192;
                v318.origin.double y = v191;
                v318.size.double width = v194;
                v318.size.double height = v193;
                v321.origin.double x = v201;
                v321.origin.double y = v203;
                v321.size.double width = v205;
                v321.size.double height = v207;
                CGRect v319 = CGRectUnion(v318, v321);
                CGFloat v192 = v319.origin.x;
                double v191 = v319.origin.y;
                CGFloat v194 = v319.size.width;
                double v193 = v319.size.height;
              }
            }
            uint64_t v197 = [v195 countByEnumeratingWithState:&v298 objects:v302 count:16];
          }
          while (v197);
        }

        double v208 = *(double *)(MEMORY[0x1E4F8A248] + 8) + *(double *)(MEMORY[0x1E4F8A248] + 24) - (v191 + v193);
        buf[0] = 0;
        v209 = (void *)MEMORY[0x1E4F8CBF8];
        unint64_t v210 = [(_PIPosterLayoutJob *)self segmentationClassification];
        v211 = [v7 portraitConfiguration];
        v9 = v288;
        [v288 preferredCropRect];
        double v213 = v212;
        double v215 = v214;
        double v217 = v216;
        double v219 = v218;
        [v288 acceptableCropRect];
        objc_msgSend(v209, "bestCropRectV2ForPosterClassification:layoutConfiguration:sourcePixelWidth:sourcePixelHeight:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:outputCropScore:outputLayoutScore:outputClockOverlapAcceptable:", v210, v211, (unint64_t)v283, (unint64_t)v280, 0, 0, v213, v215, v217, v219, v220, v221, v222, v223, *(void *)&v192,
          *(void *)&v208,
          *(void *)&v194,
          *(void *)&v193,
          buf);

        [(_PIPosterLayoutJob *)self setMetadataClockOverlapAcceptable:buf[0]];
        LODWORD(v224) = v269;
        [(_PIPosterLayoutJob *)self setSegmentationScore:v224];
        LODWORD(v225) = v267;
        [(_PIPosterLayoutJob *)self setLocalConfidenceScore:v225];
        LODWORD(v226) = v266;
        [(_PIPosterLayoutJob *)self setGroundedScore:v226];
        LODWORD(v227) = v270;
        [(_PIPosterLayoutJob *)self setConfidenceMapScore:v227];
        LODWORD(v228) = r2a;
        [(_PIPosterLayoutJob *)self setMattePureBackground:v228];
        LODWORD(v229) = r2_16a;
        [(_PIPosterLayoutJob *)self setMattePureForeground:v229];
        LODWORD(v230) = v272;
        [(_PIPosterLayoutJob *)self setConfidencePureBackground:v230];
        LODWORD(v231) = r2_8a;
        [(_PIPosterLayoutJob *)self setConfidencePureForeground:v231];
        *(float *)&double v232 = v290;
        [(_PIPosterLayoutJob *)self setFaceSize:v232];
        LODWORD(v233) = v268;
        [(_PIPosterLayoutJob *)self setFaceLocalConfidence:v233];
        [(_PIPosterLayoutJob *)self setFacePositionAcceptable:v265];

        v28 = v281;
        v84 = v282;
        BOOL v87 = r2_28;
      }
    }
    else
    {
      BOOL v87 = 1;
    }
    v24 = v292;
    v11 = v293;
  }
  else
  {
    BOOL v87 = 0;
  }

  return v87;
}

- (float)_headroomPenaltyForIntermediateLayout:(id)a3 originalFullExtent:(CGRect)a4 layoutConfiguration:(id)a5
{
  double height = a4.size.height;
  id v7 = a5;
  id v8 = a3;
  [v8 visibleRect];
  double v10 = v9;
  [v8 visibleRect];
  double v12 = v11;

  double v13 = v10 + v12 - height;
  [v7 screenSize];
  double v15 = v14;
  [v7 screenScale];
  double v17 = v16;
  [v7 screenScale];
  double v19 = v18;

  float result = 1.0;
  if (v13 <= 0.0) {
    return fmax(v15 / v17 * (v13 / v19), 0.0) / ((*MEMORY[0x1E4F8D150] + -1.0) * 1398784.0) * 5.0;
  }
  return result;
}

- (id)_layoutFromIntermediateLayouts:(id)a3 layoutConfiguration:(id)a4 fullExtent:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  if (![v11 count])
  {
    v58 = NUAssertLogger_13666();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
    {
      double v59 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "intermediateLayouts.count > 0");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v59;
      _os_log_error_impl(&dword_1A9680000, v58, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v60 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    float v62 = NUAssertLogger_13666();
    BOOL v63 = os_log_type_enabled(v62, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v63)
      {
        double v66 = dispatch_get_specific(*v60);
        v67 = (void *)MEMORY[0x1E4F29060];
        id v68 = v66;
        float v69 = [v67 callStackSymbols];
        float v70 = [v69 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v66;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v70;
        _os_log_error_impl(&dword_1A9680000, v62, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v63)
    {
      float v64 = [MEMORY[0x1E4F29060] callStackSymbols];
      double v65 = [v64 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v65;
      _os_log_error_impl(&dword_1A9680000, v62, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  double v13 = [v11 lastObject];
  [v13 visibleRect];
  double v15 = v14;
  double v83 = v17;
  double v84 = v16;
  double v82 = v18;
  [v12 parallaxPaddingPct];
  double v20 = v19;
  double v22 = v21;
  [v12 timeRect];
  double v24 = v23;
  double v78 = v26;
  double v79 = v25;
  double v77 = v27;
  id v28 = (id)*MEMORY[0x1E4F8D098];
  v29 = [(_PIPosterLayoutJob *)self segmentationMatteImage];
  double v81 = width;
  if (v29)
  {
    double v73 = v24;
    double v74 = v22;
    double v76 = v20;
    id v85 = 0;
    uint64_t v30 = [(NURenderJob *)self renderer:&v85];
    double v31 = v15 - x;
    double v32 = 0.0;
    double v33 = 0.0;
    if (width != 0.0)
    {
      double v31 = v31 / width;
      double v33 = v83 / width;
    }
    double v34 = v84 - y;
    if (height != 0.0)
    {
      double v34 = v34 / height;
      double v32 = v82 / height;
    }
    id v35 = v85;
    [v29 extent];
    double v38 = v36 + v31 * v37;
    double v41 = v39 + v34 * v40;
    double v42 = v33 * v37;
    double v43 = v32 * v40;
    memset(buf, 0, 32);
    v44 = [v30 context];
    +[PISegmentationHelper computeClockLayerOrderWithVisibleFrame:segmentationMatte:layoutConfiguration:context:interactive:](PISegmentationHelper, "computeClockLayerOrderWithVisibleFrame:segmentationMatte:layoutConfiguration:context:interactive:", v29, v12, v44, 0, v38, v41, v42, v43);

    id v45 = *(id *)buf;
    uint64_t v46 = *(void *)&buf[8];

    id v28 = v45;
    double v22 = v74;
    double v20 = v76;
    double v24 = v73;
  }
  else
  {
    uint64_t v46 = 2;
  }
  double v75 = v84 + v79 * v82;
  double v80 = v82 * v22;
  [v13 inactiveRect];
  uint64_t v71 = v48;
  uint64_t v72 = v47;
  uint64_t v50 = v49;
  uint64_t v52 = v51;
  id v53 = objc_alloc(MEMORY[0x1E4F8CD30]);
  [v12 screenSize];
  double v56 = objc_msgSend(v53, "initWithImageSize:deviceResolution:parallaxPadding:visibleFrame:inactiveFrame:timeFrame:clockLayerOrder:clockIntersection:hasTopEdgeContact:debugLayouts:", v28, v46, objc_msgSend(v13, "hasTopEdgeContact"), v11, v81, height, v54, v55, v83 * v20, v80, *(void *)&v15, *(void *)&v84, *(void *)&v83, *(void *)&v82, v72, v71,
                  v50,
                  v52,
                  v15 + v24 * v83,
                  *(void *)&v75,
                  v83 * v78,
                  v82 * v77);

  return v56;
}

- (id)generateOrientedLayoutsForFullExtent:(CGRect)a3 layoutConfiguration:(id)a4 layoutRegions:(id)a5 segmentationMatteImage:(id)a6 segmentationClassification:(unint64_t)a7 error:(id *)a8
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v215 = *MEMORY[0x1E4F143B8];
  double v21 = a4;
  id specific = a5;
  id v23 = a6;
  v217.origin.double x = x;
  v217.origin.double y = y;
  v217.size.double width = width;
  v217.size.double height = height;
  if (CGRectIsEmpty(v217))
  {
    v163 = NUAssertLogger_13666();
    double v24 = "CGRectIsEmpty(fullExtent) == false";
    if (os_log_type_enabled(v163, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "CGRectIsEmpty(fullExtent) == false");
      double v164 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      double v212 = v164;
      _os_log_error_impl(&dword_1A9680000, v163, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    CGFloat v165 = (const void **)MEMORY[0x1E4F7A308];
    id specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    double v21 = NUAssertLogger_13666();
    BOOL v166 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v166)
      {
        id specific = dispatch_get_specific(*v165);
        CGFloat v171 = (void *)MEMORY[0x1E4F29060];
        id v23 = specific;
        CGFloat v165 = [v171 callStackSymbols];
        self = [v165 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        double v212 = (const void **)specific;
        __int16 v213 = 2114;
        double v214 = self;
        _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v166)
    {
      id specific = [MEMORY[0x1E4F29060] callStackSymbols];
      CGFloat v165 = [specific componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      double v212 = v165;
      _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    v174 = "CGRectIsEmpty(fullExtent) == false";
    int v169 = _NUAssertFailHandler();
    goto LABEL_84;
  }
  double v24 = [(_PIPosterLayoutJob *)self layoutRequest];
  [v24 normalizedLayoutBounds];
  double v26 = v25;
  double v28 = v27;
  double v10 = v29;
  double v11 = v30;

  [v21 screenSize];
  if (v31 <= 0.0)
  {
    CGFloat v167 = NUAssertLogger_13666();
    if (os_log_type_enabled(v167, OS_LOG_TYPE_ERROR))
    {
      double v168 = [NSString stringWithFormat:@"Invalid layout configuration"];
      *(_DWORD *)buf = 138543362;
      double v212 = v168;
      _os_log_error_impl(&dword_1A9680000, v167, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    CGFloat v165 = (const void **)MEMORY[0x1E4F7A308];
    id specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    double v21 = NUAssertLogger_13666();
    int v169 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (!specific)
    {
      if (v169)
      {
        id specific = [MEMORY[0x1E4F29060] callStackSymbols];
        double v170 = [specific componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        double v212 = v170;
        _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_86;
    }
LABEL_84:
    if (v169)
    {
      id specific = dispatch_get_specific(*v165);
      v172 = (void *)MEMORY[0x1E4F29060];
      id v23 = specific;
      double v173 = [v172 callStackSymbols];
      self = [v173 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      double v212 = (const void **)specific;
      __int16 v213 = 2114;
      double v214 = self;
      _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_86:

    _NUAssertFailHandler();
LABEL_87:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_13679);
LABEL_35:
    v98 = (os_log_t *)MEMORY[0x1E4F7A748];
    double v99 = (void *)*MEMORY[0x1E4F7A748];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_DEFAULT))
    {
      double v100 = NSString;
      double v101 = v99;
      double v102 = [v100 stringWithFormat:@"Invalid new initial rect"];
      *(_DWORD *)buf = 138543362;
      double v212 = v102;
      _os_log_impl(&dword_1A9680000, v101, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

      uint64_t v103 = *v8;
      if (dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
      {
        if (v103 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_13679);
        }
        goto LABEL_40;
      }
      if (v103 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_13679);
      }
    }
    else if (dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
    {
LABEL_40:
      os_log_t v104 = *v98;
      if (!os_log_type_enabled(*v98, OS_LOG_TYPE_ERROR)) {
        goto LABEL_45;
      }
      double v105 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
      v106 = (void *)MEMORY[0x1E4F29060];
      id v177 = v105;
      v107 = v104;
      double v108 = [v106 callStackSymbols];
      CGFloat v109 = [v108 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      double v212 = (const void **)v105;
      __int16 v213 = 2114;
      double v214 = v109;
      _os_log_error_impl(&dword_1A9680000, v107, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_70;
    }
    os_log_t v110 = *v98;
    if (!os_log_type_enabled(*v98, OS_LOG_TYPE_ERROR)) {
      goto LABEL_45;
    }
    int v160 = (void *)MEMORY[0x1E4F29060];
    v107 = v110;
    v161 = [v160 callStackSymbols];
    v162 = [v161 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    double v212 = v162;
    _os_log_error_impl(&dword_1A9680000, v107, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_70:
LABEL_45:
    _NUAssertContinueHandler();
    unint64_t v58 = v9;
LABEL_46:
    if (v209 / v11 >= v208 / x)
    {
      double v112 = (v181 - v11) * 0.5;
      if (v112 >= v209 - v11) {
        double v112 = v209 - v11;
      }
      double v10 = v10 + v112;
    }
    else
    {
      double v111 = (y - x) * 0.5;
      if (v111 >= v208 - x) {
        double v111 = v208 - x;
      }
      double height = height + v111;
    }
LABEL_53:
    double v113 = [(_PIPosterLayoutJob *)self layoutRequest];
    char v114 = [v113 shouldConstrainLayoutToBounds];

    if (v114) {
      uint64_t v115 = 2;
    }
    else {
      uint64_t v115 = [*(id *)(v58 + 3272) layoutTypeFromLayoutConfiguration:v21];
    }
    double v116 = v178 + v10 * width;
    uint64_t v117 = [(_PIPosterLayoutJob *)self layoutRequest];
    uint64_t v118 = [v117 shouldConsiderHeadroom];

    if (v23)
    {
      double v179 = width * v11;
      int v182 = v21;
      v119 = *(void **)(v58 + 3272);
      unint64_t v120 = [(_PIPosterLayoutJob *)self segmentationClassification];
      [v23 extent];
      objc_msgSend(v119, "effectiveMatteInspectionRectForClassification:havePetFaces:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:sourcePreferredRectNormalized:originalMatteRectDenormalized:", v120, v24 != 0, v188, v187, v186, v185, v203, v205, v204, v206, *(void *)&v191, *(void *)&v190, *(void *)&v189, *(void *)&v184, v121, v122,
        v123,
        v124);
      double v126 = v125;
      double v128 = v127;
      double v130 = v129;
      double v132 = v131;
      id v133 = objc_alloc(MEMORY[0x1E4F1E050]);
      double v134 = [MEMORY[0x1E4F1E008] blackColor];
      double v135 = (void *)[v133 initWithColor:v134];

      CGFloat v136 = [v23 imageByCompositingOverImage:v135];
      double v137 = objc_msgSend(v136, "imageByCroppingToRect:", v126, v128, v130, v132);

      double v138 = [MEMORY[0x1E4F1E018] context];
      BOOL v139 = +[PISegmentationHelper topEdgeHasNoContactWithInspectionMatte:v137 context:v138];

      [(_PIPosterLayoutJob *)self setHeadroomIsFeasible:v118 & v139];
      id v140 = specific;
      if (PFPosterEnableHeadroom())
      {
        double v141 = v180 + height * v200;
        if ([(_PIPosterLayoutJob *)self headroomIsFeasible])
        {
          uint64_t v142 = v115;
          if (v115 != 2)
          {
            [v23 extent];
            double v144 = v143;
            double v146 = v145;
            double v148 = v147;
            double v150 = *MEMORY[0x1E4F8D150] * v149;
            double v151 = [v23 imageByCompositingOverImage:v135];
            double v152 = v144;
            double v141 = v180 + height * v200;
            uint64_t v153 = objc_msgSend(v151, "imageByCroppingToRect:", v152, v146, v148, v150);

            id v23 = (id)v153;
          }
        }
        else
        {
          uint64_t v142 = v115;
        }
      }
      else
      {
        uint64_t v142 = v115;
        double v141 = v180 + height * v200;
      }
      v155 = [PIPosterLayoutHelper alloc];
      int v156 = [v183 context];
      double v154 = -[PIPosterLayoutHelper initWithCIContext:matte:posterClassification:initialRect:imageSize:effectiveAcceptableRect:effectivePreferredRect:validBoundsNormalized:headroomFeasible:hasTopEdgeContact:layoutType:layoutConfiguration:](v155, "initWithCIContext:matte:posterClassification:initialRect:imageSize:effectiveAcceptableRect:effectivePreferredRect:validBoundsNormalized:headroomFeasible:hasTopEdgeContact:layoutType:layoutConfiguration:", v156, v23, [(_PIPosterLayoutJob *)self segmentationClassification], [(_PIPosterLayoutJob *)self headroomIsFeasible], !v139, v142, v116, v141, v179, v200 * x, v207, v200, *(void *)&v199, *(void *)&v198, *(void *)&v197, *(void *)&v196,
               v195,
               v194,
               v193,
               v192,
               *(void *)&v202,
               *(void *)&v201,
               *(void *)&v209,
               *(void *)&v208,
               v182);

      unint64_t v58 = 0x1E4F8C000uLL;
      id specific = v140;
      double v21 = v182;
    }
    else
    {
      double v154 = (PIPosterLayoutHelper *)objc_msgSend(objc_alloc(MEMORY[0x1E4F8CCB8]), "initWithPosterClassification:initialRect:imageSize:effectiveAcceptableRect:effectivePreferredRect:validBoundsNormalized:headroomFeasible:hasTopEdgeContact:layoutType:layoutConfiguration:", -[_PIPosterLayoutJob segmentationClassification](self, "segmentationClassification"), v118, 0, v115, v21, v116, v180 + height * v200, width * v11, v200 * x, width, v200, *(void *)&v199, *(void *)&v198,
                                       *(void *)&v197,
                                       *(void *)&v196,
                                       v195,
                                       v194,
                                       v193,
                                       v192,
                                       *(void *)&v202,
                                       *(void *)&v201,
                                       *(void *)&v209,
                                       *(void *)&v208);
      id v23 = 0;
    }
    v157 = [*(id *)(v58 + 3272) computeLayoutsWithHelper:v154];
    int v158 = [(PFParallaxLayoutHelper *)v154 bestLayout:v157];
    double v34 = [v157 arrayByAddingObject:v158];

    double v32 = v183;
    goto LABEL_65;
  }
  double v32 = [(NURenderJob *)self renderer:a8];
  double v33 = [(_PIPosterLayoutJob *)self segmentationMatteImage];

  if (!v33 || v32)
  {
    id v35 = [specific petRegions];
    double v24 = (char *)[v35 count];

    double v201 = v28;
    double v202 = v26;
    double v208 = v11;
    double v209 = v10;
    int v183 = v32;
    double v178 = x;
    double v180 = y;
    if (v23)
    {
      [v23 extent];
      CGFloat v37 = width / v36;
      [v23 extent];
      CGAffineTransformMakeScale(&v210, v37, height / v38);
      uint64_t v39 = [v23 imageByApplyingTransform:&v210];

      id v23 = (id)v39;
    }
    double v40 = height;
    double v41 = width;
    double v207 = width;
    [specific preferredCropRect];
    double v190 = v43;
    double v191 = v42;
    double v189 = v44;
    double v184 = v45;
    [specific acceptableCropRect];
    double v187 = v47;
    double v188 = v46;
    double v185 = v49;
    double v186 = v48;
    [specific gazeAreaRect];
    CGFloat v51 = v50;
    double v53 = v52;
    CGFloat v55 = v54;
    CGFloat v57 = v56;
    unint64_t v58 = 0x1E4F8C000uLL;
    double v59 = (void *)MEMORY[0x1E4F8CCC8];
    [v21 screenSize];
    double v61 = v60;
    double v63 = v62;
    float v64 = [specific faceRegions];
    double v200 = v40;
    objc_msgSend(v59, "bestFaceRectWithImageSize:deviceSize:faceRegions:", v64, v41, v40, v61, v63);
    double v66 = v65;
    double v203 = v65;
    double v204 = v67;
    double v69 = v68;
    double v205 = v68;
    double v206 = v70;
    double v71 = v67;
    double v72 = v70;

    CGFloat v175 = v53;
    double v176 = *(double *)(MEMORY[0x1E4F8A248] + 8) + *(double *)(MEMORY[0x1E4F8A248] + 24);
    objc_msgSend(MEMORY[0x1E4F8CCC8], "effectiveAcceptableRectForClassification:havePetFaces:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:sourceGazeAreaRectNormalized:", a7, v24 != 0, v191, v190, v189, v184, v188, v187, v186, v185, *(void *)&v66, *(void *)&v69, *(void *)&v71, *(void *)&v72, *(void *)&v51, *(void *)&v53,
      *(void *)&v55,
      *(void *)&v57);
    double v198 = v74;
    double v199 = v73;
    double v196 = v76;
    double v197 = v75;
    objc_msgSend(MEMORY[0x1E4F8CCC8], "effectivePreferredRectForClassification:havePetFaces:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:", a7, v24 != 0, v191, v190, v189, v184, v188, v187, v186, v185, *(void *)&v203, *(void *)&v205, *(void *)&v204, *(void *)&v206);
    uint64_t v194 = v78;
    uint64_t v195 = v77;
    uint64_t v192 = v80;
    uint64_t v193 = v79;
    [v21 screenSize];
    double v82 = v81;
    [v21 screenSize];
    unint64_t v83 = (unint64_t)v207;
    unint64_t v84 = (unint64_t)v200;
    double v85 = v176;
    double v87 = v82 / v86;
    switch([(_PIPosterLayoutJob *)self segmentationClassification])
    {
      case 0uLL:
      case 3uLL:
      case 4uLL:
      case 5uLL:
        objc_msgSend(MEMORY[0x1E4F8CBF8], "bestCropRectV2ForAspectRatio:withFocusRegion:sourcePixelWidth:sourcePixelHeight:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:outputCropScore:", (unint64_t)v207, (unint64_t)v200, 0, v87, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24), v195, v194, v193, v192, *(void *)&v199, *(void *)&v198, *(void *)&v197, *(void *)&v196,
          *(void *)&v203,
          v176 - (v205 + v206),
          *(void *)&v204,
          *(void *)&v206);
        goto LABEL_17;
      case 1uLL:
        if (![MEMORY[0x1E4F8CE48] deviceSupportsLandscapeConfiguration]) {
          goto LABEL_16;
        }
        double v93 = +[PIGlobalSettings globalSettings];
        if ([v93 posterDisableCropVariant])
        {
        }
        else
        {
          v218.origin.double x = v51;
          v218.size.double width = v55;
          v218.origin.double y = v175;
          v218.size.double height = v57;
          IsEmptdouble y = CGRectIsEmpty(v218);

          if (!IsEmpty)
          {
            +[PIPNCropUtilitiesWrapper bestCropVariantFromSignalsWithAspectRatio:sourcePixelWidth:sourcePixelHeight:acceptableCropRect:preferredCropRect:normalizedFaceAreaRect:gazeAreaRect:](PIPNCropUtilitiesWrapper, "bestCropVariantFromSignalsWithAspectRatio:sourcePixelWidth:sourcePixelHeight:acceptableCropRect:preferredCropRect:normalizedFaceAreaRect:gazeAreaRect:", v83, v84, v87, v188, v187, v186, v185, *(void *)&v191, *(void *)&v190, *(void *)&v189, *(void *)&v184, *(void *)&v203, v176 - (v205 + v206), *(void *)&v204, *(void *)&v206, *(void *)&v51,
              *(void *)&v175,
              *(void *)&v55,
              *(void *)&v57);
            double v92 = v219.origin.y;
            double y = v219.size.height;
            double v10 = v219.origin.x;
            double v181 = v219.size.width;
            if (!CGRectIsEmpty(v219)) {
              goto LABEL_18;
            }
          }
        }
LABEL_16:
        objc_msgSend(MEMORY[0x1E4F8CBF8], "bestCropRectV2ForAspectRatio:sourcePixelWidth:sourcePixelHeight:sourceEssentialAreaRect:sourceSecondaryEssentialAreaRect:outputCropScore:", v83, v84, 0, v87, v199, v198, v197, v196, v195, v194, v193, v192);
LABEL_17:
        double v10 = v88;
        double v92 = v89;
        double v181 = v90;
        double y = v91;
LABEL_18:
        double height = v85 - (v92 + y);
        v220.origin.double x = v202;
        v220.origin.double y = v201;
        v220.size.double width = v209;
        v220.size.double height = v208;
        if (CGRectIsNull(v220))
        {
          double v11 = v181;
          double x = y;
          double width = v207;
          goto LABEL_53;
        }
        if (v10 + v181 <= v202 + v209) {
          double v95 = v10;
        }
        else {
          double v95 = v202 + v209 - v181;
        }
        if (v95 >= v202) {
          double v10 = v95;
        }
        else {
          double v10 = v202;
        }
        if (y + height <= v201 + v208) {
          double v96 = v85 - (v92 + y);
        }
        else {
          double v96 = v201 + v208 - y;
        }
        if (v96 >= v201) {
          double height = v96;
        }
        else {
          double height = v201;
        }
        double v97 = fmin(fmin(v209 / v181, v208 / y), 1.0);
        double v11 = v181 * v97;
        double x = y * v97;
        double width = v207;
        if (v181 * v97 > 0.0 && x > 0.0) {
          goto LABEL_46;
        }
        id v8 = (uint64_t *)MEMORY[0x1E4F7A750];
        unint64_t v9 = 0x1E4F8C000uLL;
        if (*MEMORY[0x1E4F7A750] == -1) {
          goto LABEL_35;
        }
        goto LABEL_87;
      case 2uLL:
        goto LABEL_16;
      default:
        double v10 = *MEMORY[0x1E4F1DB28];
        double v92 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
        double y = *(double *)(MEMORY[0x1E4F1DB28] + 24);
        double v181 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
        double v85 = v176;
        goto LABEL_18;
    }
  }
  double v34 = 0;
LABEL_65:

  return v34;
}

- (BOOL)prepare:(id *)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v36.receiver = self;
  v36.super_class = (Class)_PIPosterLayoutJob;
  if (-[NURenderJob prepare:](&v36, sel_prepare_))
  {
    v5 = [(_PIPosterLayoutJob *)self layoutRequest];
    if ([v5 shouldConstrainLayoutToBounds])
    {
      [v5 normalizedLayoutBounds];
      if (CGRectIsNull(v42))
      {
        id v23 = NUAssertLogger_13666();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          double v24 = [NSString stringWithFormat:@"Cannot constrain layout to a null rect"];
          *(_DWORD *)buf = 138543362;
          double v38 = v24;
          _os_log_error_impl(&dword_1A9680000, v23, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
        }
        double v25 = (const void **)MEMORY[0x1E4F7A308];
        id specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
        double v27 = NUAssertLogger_13666();
        BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
        if (specific)
        {
          if (v28)
          {
            double v31 = dispatch_get_specific(*v25);
            double v32 = (void *)MEMORY[0x1E4F29060];
            id v33 = v31;
            double v34 = [v32 callStackSymbols];
            id v35 = [v34 componentsJoinedByString:@"\n"];
            *(_DWORD *)buf = 138543618;
            double v38 = v31;
            __int16 v39 = 2114;
            double v40 = v35;
            _os_log_error_impl(&dword_1A9680000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
          }
        }
        else if (v28)
        {
          double v29 = [MEMORY[0x1E4F29060] callStackSymbols];
          double v30 = [v29 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          double v38 = v30;
          _os_log_error_impl(&dword_1A9680000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
        }
        _NUAssertFailHandler();
      }
    }
    uint64_t v6 = [v5 layoutConfiguration];
    [(_PIPosterLayoutJob *)self setLayoutConfiguration:v6];

    id v7 = [(_PIPosterLayoutJob *)self layoutConfiguration];

    if (v7)
    {
      id v8 = [v5 layoutRegions];
      [(_PIPosterLayoutJob *)self setLayoutRegions:v8];

      unint64_t v9 = [(_PIPosterLayoutJob *)self layoutRegions];

      if (v9)
      {
        -[_PIPosterLayoutJob setSegmentationClassification:](self, "setSegmentationClassification:", [v5 segmentationClassification]);
        double v10 = [v5 segmentationMatte];
        if (v10)
        {
          double v11 = [MEMORY[0x1E4F1E050] imageWithNUImageBuffer:v10];
          [v11 extent];
          double v13 = @"Invalid segmentation matte size";
          if (v14 >= 1.0 && v12 >= 1.0)
          {
            if ([(_PIPosterLayoutJob *)self segmentationClassification])
            {
              if ([(_PIPosterLayoutJob *)self segmentationClassification] == 3
                || [(_PIPosterLayoutJob *)self segmentationClassification] == 4)
              {
                uint64_t v15 = +[PISegmentationHelper invertImage:v11];

                double v11 = (void *)v15;
              }
              [(_PIPosterLayoutJob *)self setSegmentationMatteImage:v11];

              goto LABEL_14;
            }
            double v13 = @"Invalid segmentation classification";
          }
          [MEMORY[0x1E4F7A438] invalidError:v13 object:v5];
          LOBYTE(v19) = 0;
          *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_29:

          goto LABEL_30;
        }
LABEL_14:
        double v11 = [v5 segmentationConfidenceMap];
        if (v11)
        {
          double v16 = [MEMORY[0x1E4F1E050] imageWithNUImageBuffer:v11];
          [v16 extent];
          BOOL v19 = v18 >= 1.0 && v17 >= 1.0;
          if (v19)
          {
            [(_PIPosterLayoutJob *)self setSegmentationConfidenceMapImage:v16];
          }
          else
          {
            *a3 = [MEMORY[0x1E4F7A438] invalidError:@"Invalid segmentation confidence map size" object:v5];
          }
        }
        else
        {
          LOBYTE(v19) = 1;
        }
        goto LABEL_29;
      }
      double v20 = (void *)MEMORY[0x1E4F7A438];
      double v21 = @"Missing layout regions";
    }
    else
    {
      double v20 = (void *)MEMORY[0x1E4F7A438];
      double v21 = @"Missing layout configuration";
    }
    [v20 missingError:v21 object:v5];
    LOBYTE(v19) = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_30:

    return v19;
  }
  LOBYTE(v19) = 0;
  return v19;
}

- (id)scalePolicy
{
  return (id)[MEMORY[0x1E4F7A478] oneToOneScalePolicy];
}

- (BOOL)wantsCompleteStage
{
  return 1;
}

- (BOOL)wantsOutputGeometry
{
  return 1;
}

- (BOOL)wantsOutputImage
{
  return 0;
}

- (BOOL)wantsRenderStage
{
  return 1;
}

- (_PIPosterLayoutJob)initWithPosterLayoutRequest:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_PIPosterLayoutJob;
  return [(NURenderJob *)&v4 initWithRequest:a3];
}

- (_PIPosterLayoutJob)initWithRequest:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (uint64_t *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    goto LABEL_15;
  }
  while (1)
  {
    uint64_t v6 = (os_log_t *)MEMORY[0x1E4F7A748];
    id v7 = (void *)*MEMORY[0x1E4F7A748];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_ERROR))
    {
      id v8 = NSString;
      unint64_t v9 = v7;
      double v10 = (objc_class *)objc_opt_class();
      double v11 = NSStringFromClass(v10);
      double v12 = NSStringFromSelector(a2);
      double v13 = [v8 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v11, v12];
      *(_DWORD *)buf = 138543362;
      BOOL v28 = v13;
      _os_log_error_impl(&dword_1A9680000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      uint64_t v14 = *v5;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
      {
        if (v14 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_13679);
        }
LABEL_7:
        os_log_t v15 = *v6;
        if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
        {
          double v16 = (void *)MEMORY[0x1E4F29060];
          double v17 = v15;
          double v18 = [v16 callStackSymbols];
          BOOL v19 = [v18 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          BOOL v28 = v19;
          _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v14 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_13679);
      }
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
    {
      goto LABEL_7;
    }
    os_log_t v20 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
    {
      id specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
      double v22 = (void *)MEMORY[0x1E4F29060];
      id v23 = specific;
      double v17 = v20;
      double v24 = [v22 callStackSymbols];
      double v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      BOOL v28 = specific;
      __int16 v29 = 2114;
      double v30 = v25;
      _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    double v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_13679);
  }
}

@end