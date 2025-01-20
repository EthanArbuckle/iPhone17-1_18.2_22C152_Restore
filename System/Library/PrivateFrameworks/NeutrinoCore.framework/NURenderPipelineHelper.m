@interface NURenderPipelineHelper
+ (id)gainMapFromLightMap:(id)a3 base:(id)a4 settings:(id)a5;
+ (id)lightMapFromGainMap:(id)a3 settings:(id)a4;
+ (id)styleTransferApplyNodeWithInput:(id)a3 thumbnail:(id)a4 target:(id)a5 settings:(id)a6;
+ (id)styleTransferInterpolationNodeWithInputs:(id)a3 weights:(id)a4 settings:(id)a5;
+ (id)styleTransferLearnNodeWithInput:(id)a3 target:(id)a4 settings:(id)a5;
+ (id)styleTransferNodeWithInput:(id)a3 target:(id)a4 settings:(id)a5;
+ (id)styleTransferThumbnailNodeWithInput:(id)a3 settings:(id)a4;
- (BOOL)endGroupWithName:(id)a3 error:(id *)a4;
- (BOOL)hasStaticTime;
- (BOOL)isCIFilterAvailable:(id)a3 propertyName:(id)a4;
- (BOOL)isSourceAvailable:(id)a3 sourceSettings:(id)a4;
- (BOOL)resetTag:(id)a3 input:(id)a4 error:(id *)a5;
- (NURenderPipelineHelper)initWithPipelineState:(id)a3;
- (NURenderPipelineState)pipelineState;
- (id)HDROpticalScaleNode:(id)a3 scale:(double)a4;
- (id)addTagWithName:(id)a3 inputNode:(id)a4 error:(id *)a5;
- (id)auxiliaryImageFromComposition:(id)a3 type:(id)a4 mediaComponentType:(id)a5 error:(id *)a6;
- (id)auxiliaryImageNode:(id)a3 type:(int64_t)a4;
- (id)beginGroupWithName:(id)a3 error:(id *)a4;
- (id)cacheNode:(id)a3 type:(id)a4 settings:(id)a5 error:(id *)a6;
- (id)createSloMoWithInput:(id)a3 startTime:(id *)a4 endTime:(id *)a5 rate:(float)a6 error:(id *)a7;
- (id)cropNode:(id)a3 cropRect:(id *)a4 cropSettings:(id)a5;
- (id)filterNode:(id)a3 input:(id)a4 settings:(id)a5;
- (id)filterNode:(id)a3 inputs:(id)a4 settings:(id)a5;
- (id)gainMapHeadroomNode:(id)a3 headroomOffset:(double)a4;
- (id)gainMapNode:(id)a3 contentHeadroom:(double)a4 displayHeadroom:(double)a5;
- (id)getTagWithPath:(id)a3 error:(id *)a4;
- (id)inputForPath:(id)a3 error:(id *)a4;
- (id)livePhotoKeyFrameMetadataFromNode:(id)a3 time:(id *)a4 error:(id *)a5;
- (id)orientedNode:(id)a3 withOrientation:(int64_t)a4;
- (id)perspectiveTransformWithPitch:(double)a3 yaw:(double)a4 roll:(double)a5 imageRect:(CGRect)a6;
- (id)renderNodeFromSource:(id)a3 settings:(id)a4 error:(id *)a5;
- (id)scaleNode:(id)a3 scale:(id)a4 error:(id *)a5;
- (id)sourceFromComposition:(id)a3 error:(id *)a4;
- (id)sourceFromComposition:(id)a3 withName:(id)a4 error:(id *)a5;
- (id)straightenTransformWithAngle:(double)a3 extent:(id *)a4;
- (id)switchFromNodes:(id)a3 mainInput:(id)a4 selector:(id)a5;
- (id)trimInput:(id)a3 startTime:(id *)a4 endTime:(id *)a5 error:(id *)a6;
- (id)vectorWithFloats:(id)a3;
- (int64_t)mediaTypeForComposition:(id)a3;
- (int64_t)orientationFromAdjustmentIn:(id)a3;
- (void)resetTag:(id)a3 input:(id)a4;
@end

@implementation NURenderPipelineHelper

- (void).cxx_destruct
{
}

- (NURenderPipelineState)pipelineState
{
  return self->_pipelineState;
}

- (id)HDROpticalScaleNode:(id)a3 scale:(double)a4
{
  id v5 = a3;
  v6 = [[NUHDROpticalScaleNode alloc] initWithInput:v5 opticalScale:a4];

  return v6;
}

- (id)gainMapHeadroomNode:(id)a3 headroomOffset:(double)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [NUHDRGainMapHeadroomNode alloc];
  v11 = @"headroomOffset";
  v7 = [NSNumber numberWithDouble:a4];
  v12[0] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  v9 = [(NUHDRGainMapHeadroomNode *)v6 initWithInput:v5 settings:v8];

  return v9;
}

- (id)gainMapNode:(id)a3 contentHeadroom:(double)a4 displayHeadroom:(double)a5
{
  id v7 = a3;
  v8 = [[NUHDRGainMapNode alloc] initWithInput:v7 contentHeadroom:a4 displayHeadroom:a5];

  return v8;
}

- (id)auxiliaryImageNode:(id)a3 type:(int64_t)a4
{
  id v5 = a3;
  v6 = [[NUAuxiliaryRenderNode alloc] initWithInput:v5 auxiliaryImageType:a4];

  return v6;
}

- (id)switchFromNodes:(id)a3 mainInput:(id)a4 selector:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [NUSwitchNode alloc];
  v11 = +[NURenderPipelineFunction functionWithEvaluationBlock:v7];

  v12 = [(NUSwitchNode *)v10 initWithInputs:v9 mainInput:v8 selector:v11];

  return v12;
}

- (id)livePhotoKeyFrameMetadataFromNode:(id)a3 time:(id *)a4 error:(id *)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!a5)
  {
    v13 = NUAssertLogger_24364();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      LODWORD(time.value) = 138543362;
      *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v14;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&time, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v16 = NUAssertLogger_24364();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v17)
      {
        v20 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v21 = (void *)MEMORY[0x1E4F29060];
        id v22 = v20;
        v23 = [v21 callStackSymbols];
        v24 = [v23 componentsJoinedByString:@"\n"];
        LODWORD(time.value) = 138543618;
        *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v20;
        LOWORD(time.flags) = 2114;
        *(void *)((char *)&time.flags + 2) = v24;
        _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&time, 0x16u);
      }
    }
    else if (v17)
    {
      v18 = [MEMORY[0x1E4F29060] callStackSymbols];
      v19 = [v18 componentsJoinedByString:@"\n"];
      LODWORD(time.value) = 138543362;
      *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v19;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&time, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderPipelineHelper livePhotoKeyFrameMetadataFromNode:time:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderPipelineHelper.m", 454, @"Invalid parameter not satisfying: %s", v25, v26, v27, v28, (uint64_t)"error != nil");
  }
  id v8 = v7;
  if (a4->var2)
  {
    v11 = [NULivePhotoKeyFrameMetaDataNode alloc];
    CMTime time = (CMTime)*a4;
    v10 = [(NULivePhotoKeyFrameMetaDataNode *)v11 initWithTime:&time input:v8];
  }
  else
  {
    CMTime time = (CMTime)*a4;
    id v9 = (__CFString *)CMTimeCopyDescription((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &time);
    *a5 = +[NUError invalidError:@"time is invalid" object:v9];

    v10 = 0;
  }

  return v10;
}

- (id)orientedNode:(id)a3 withOrientation:(int64_t)a4
{
  id v5 = a3;
  v6 = [(NUOrientationNode *)[NUUserOrientationNode alloc] initWithOrientation:a4 input:v5];

  return v6;
}

- (int64_t)orientationFromAdjustmentIn:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"orientation"];
  v4 = [v3 objectForKeyedSubscript:@"value"];
  int64_t v5 = [v4 integerValue];

  return v5;
}

- (id)straightenTransformWithAngle:(double)a3 extent:(id *)a4
{
  CGFloat v5 = (double)a4->var1.var0 * 0.5 + (double)a4->var0.var0;
  CGFloat v6 = (double)a4->var1.var1 * 0.5 + (double)a4->var0.var1;
  long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v13.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v13.c = v7;
  *(_OWORD *)&v13.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  *(_OWORD *)&v12.a = *(_OWORD *)&v13.a;
  *(_OWORD *)&v12.c = v7;
  *(_OWORD *)&v12.tx = *(_OWORD *)&v13.tx;
  CGAffineTransformTranslate(&v13, &v12, v5, v6);
  CGAffineTransform v11 = v13;
  CGAffineTransformRotate(&v12, &v11, a3 * 3.14159265 / 180.0);
  CGAffineTransform v13 = v12;
  CGAffineTransform v11 = v12;
  CGAffineTransformTranslate(&v12, &v11, -v5, -v6);
  CGAffineTransform v13 = v12;
  id v8 = [NUImageTransformAffine alloc];
  CGAffineTransform v12 = v13;
  id v9 = [(NUImageTransformAffine *)v8 initWithAffineTransform:&v12];

  return v9;
}

- (id)perspectiveTransformWithPitch:(double)a3 yaw:(double)a4 roll:(double)a5 imageRect:(CGRect)a6
{
  int64x2_t v19 = 0u;
  float64x2_t v20 = 0u;
  int64x2_t v17 = 0u;
  float64x2_t v18 = 0u;
  int64x2_t v15 = 0u;
  int64x2_t v16 = 0u;
  int64x2_t v13 = 0u;
  int64x2_t v14 = 0u;
  +[NUCropModel _imageTransformFromPitch:yaw:roll:imageRect:](NUCropModel, "_imageTransformFromPitch:yaw:roll:imageRect:", a3 * 3.14159265 / 180.0, a4 * 3.14159265 / 180.0, a5 * 3.14159265 / 180.0, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
  float64x2x4_t v22 = vld4q_f64((const double *)v17.i64);
  int64x2_t v6 = vzip2q_s64(v13, v15);
  int64x2_t v7 = vzip1q_s64(v14, v16);
  int64x2_t v8 = vzip2q_s64(v14, v16);
  int64x2_t v13 = vzip1q_s64(v13, v15);
  int64x2_t v14 = (int64x2_t)v22.val[0];
  int64x2_t v15 = v6;
  int64x2_t v16 = (int64x2_t)v22.val[1];
  int64x2_t v17 = v7;
  float64x2_t v18 = v22.val[2];
  int64x2_t v19 = v8;
  float64x2_t v20 = v22.val[3];
  id v9 = [NUImageTransform3D alloc];
  v12[4] = v17;
  v12[5] = v18;
  v12[6] = v19;
  v12[7] = v20;
  v12[0] = v13;
  v12[1] = v14;
  void v12[2] = v15;
  v12[3] = v16;
  v10 = [(NUImageTransform3D *)v9 initWithTransform3D:v12];

  return v10;
}

- (id)createSloMoWithInput:(id)a3 startTime:(id *)a4 endTime:(id *)a5 rate:(float)a6 error:(id *)a7
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  if (!a7)
  {
    int64x2_t v19 = NUAssertLogger_24364();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      float64x2_t v20 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      LODWORD(time.start.value) = 138543362;
      *(CMTimeValue *)((char *)&time.start.value + 4) = (CMTimeValue)v20;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&time, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    float64x2x4_t v22 = NUAssertLogger_24364();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        uint64_t v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v27 = (void *)MEMORY[0x1E4F29060];
        id v28 = v26;
        v29 = [v27 callStackSymbols];
        uint64_t v30 = [v29 componentsJoinedByString:@"\n"];
        LODWORD(time.start.value) = 138543618;
        *(CMTimeValue *)((char *)&time.start.value + 4) = (CMTimeValue)v26;
        LOWORD(time.start.flags) = 2114;
        *(void *)((char *)&time.start.flags + 2) = v30;
        _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&time, 0x16u);
      }
    }
    else if (v23)
    {
      v24 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v25 = [v24 componentsJoinedByString:@"\n"];
      LODWORD(time.start.value) = 138543362;
      *(CMTimeValue *)((char *)&time.start.value + 4) = (CMTimeValue)v25;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&time, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderPipelineHelper createSloMoWithInput:startTime:endTime:rate:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderPipelineHelper.m", 397, @"Invalid parameter not satisfying: %s", v31, v32, v33, v34, (uint64_t)"error != nil");
  }
  CGAffineTransform v12 = v11;
  if (a4->var2)
  {
    if (a5->var2)
    {
      memset(&v37, 0, sizeof(v37));
      *(_OWORD *)&time.start.value = *(_OWORD *)&a5->var0;
      time.start.epoch = a5->var3;
      CMTime rhs = (CMTime)*a4;
      CMTimeSubtract(&duration, &time.start, &rhs);
      *(_OWORD *)&time.start.value = *(_OWORD *)&a4->var0;
      time.start.epoch = a4->var3;
      CMTimeRangeMake(&v37, &time.start, &duration);
      if ((v37.start.flags & 1) != 0
        && (v37.duration.flags & 1) != 0
        && !v37.duration.epoch
        && (v37.duration.value & 0x8000000000000000) == 0)
      {
        int64x2_t v16 = [NUSlowMotionNode alloc];
        CMTimeRange time = v37;
        int64x2_t v17 = [(NUSlowMotionNode *)v16 initWithTimeRange:&time rate:v12 input:COERCE_DOUBLE(__PAIR64__(v37.duration.flags, LODWORD(a6)))];
        goto LABEL_14;
      }
      CMTimeRange time = v37;
      int64x2_t v14 = (__CFString *)CMTimeRangeCopyDescription((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &time);
      int64x2_t v15 = @"time range is invalid";
    }
    else
    {
      *(_OWORD *)&time.start.value = *(_OWORD *)&a5->var0;
      time.start.epoch = a5->var3;
      int64x2_t v14 = (__CFString *)CMTimeCopyDescription((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &time.start);
      int64x2_t v15 = @"end time is invalid";
    }
    *a7 = +[NUError invalidError:v15 object:v14];
  }
  else
  {
    *(_OWORD *)&time.start.value = *(_OWORD *)&a4->var0;
    time.start.epoch = a4->var3;
    int64x2_t v13 = (__CFString *)CMTimeCopyDescription((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &time.start);
    *a7 = +[NUError invalidError:@"start time is invalid" object:v13];
  }
  int64x2_t v17 = 0;
LABEL_14:

  return v17;
}

- (id)trimInput:(id)a3 startTime:(id *)a4 endTime:(id *)a5 error:(id *)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (!a6)
  {
    int64x2_t v17 = NUAssertLogger_24364();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      float64x2_t v18 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      LODWORD(time.start.value) = 138543362;
      *(CMTimeValue *)((char *)&time.start.value + 4) = (CMTimeValue)v18;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&time, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    float64x2_t v20 = NUAssertLogger_24364();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v25 = (void *)MEMORY[0x1E4F29060];
        id v26 = v24;
        uint64_t v27 = [v25 callStackSymbols];
        id v28 = [v27 componentsJoinedByString:@"\n"];
        LODWORD(time.start.value) = 138543618;
        *(CMTimeValue *)((char *)&time.start.value + 4) = (CMTimeValue)v24;
        LOWORD(time.start.flags) = 2114;
        *(void *)((char *)&time.start.flags + 2) = v28;
        _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&time, 0x16u);
      }
    }
    else if (v21)
    {
      float64x2x4_t v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v23 = [v22 componentsJoinedByString:@"\n"];
      LODWORD(time.start.value) = 138543362;
      *(CMTimeValue *)((char *)&time.start.value + 4) = (CMTimeValue)v23;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&time, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderPipelineHelper trimInput:startTime:endTime:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderPipelineHelper.m", 373, @"Invalid parameter not satisfying: %s", v29, v30, v31, v32, (uint64_t)"error != nil");
  }
  v10 = v9;
  if (a4->var2)
  {
    if (a5->var2)
    {
      memset(&v35, 0, sizeof(v35));
      *(_OWORD *)&time.start.value = *(_OWORD *)&a5->var0;
      time.start.epoch = a5->var3;
      CMTime rhs = (CMTime)*a4;
      CMTimeSubtract(&duration, &time.start, &rhs);
      *(_OWORD *)&time.start.value = *(_OWORD *)&a4->var0;
      time.start.epoch = a4->var3;
      CMTimeRangeMake(&v35, &time.start, &duration);
      if ((v35.start.flags & 1) != 0
        && (v35.duration.flags & 1) != 0
        && !v35.duration.epoch
        && (v35.duration.value & 0x8000000000000000) == 0)
      {
        int64x2_t v14 = [NUTrimNode alloc];
        CMTimeRange time = v35;
        int64x2_t v15 = [(NUTrimNode *)v14 initWithTimeRange:&time input:v10];
        goto LABEL_14;
      }
      CMTimeRange time = v35;
      CGAffineTransform v12 = (__CFString *)CMTimeRangeCopyDescription((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &time);
      int64x2_t v13 = @"time range is invalid";
    }
    else
    {
      *(_OWORD *)&time.start.value = *(_OWORD *)&a5->var0;
      time.start.epoch = a5->var3;
      CGAffineTransform v12 = (__CFString *)CMTimeCopyDescription((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &time.start);
      int64x2_t v13 = @"end time is invalid";
    }
    *a6 = +[NUError invalidError:v13 object:v12];
  }
  else
  {
    *(_OWORD *)&time.start.value = *(_OWORD *)&a4->var0;
    time.start.epoch = a4->var3;
    id v11 = (__CFString *)CMTimeCopyDescription((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &time.start);
    *a6 = +[NUError invalidError:@"start time is invalid" object:v11];
  }
  int64x2_t v15 = 0;
LABEL_14:

  return v15;
}

- (BOOL)resetTag:(id)a3 input:(id)a4 error:(id *)a5
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    float64x2_t v18 = NUAssertLogger_24364();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int64x2_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "path != nil");
      *(_DWORD *)buf = 138543362;
      v67 = v19;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v21 = NUAssertLogger_24364();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v22)
      {
        uint64_t v39 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v40 = (void *)MEMORY[0x1E4F29060];
        id v41 = v39;
        v42 = [v40 callStackSymbols];
        v43 = [v42 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v67 = v39;
        __int16 v68 = 2114;
        v69 = v43;
        _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v22)
    {
      BOOL v23 = [MEMORY[0x1E4F29060] callStackSymbols];
      v24 = [v23 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v67 = v24;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderPipelineHelper resetTag:input:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderPipelineHelper.m", 348, @"Invalid parameter not satisfying: %s", v44, v45, v46, v47, (uint64_t)"path != nil");
  }
  v10 = v9;
  if (!v9)
  {
    uint64_t v25 = NUAssertLogger_24364();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      id v26 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "input != nil");
      *(_DWORD *)buf = 138543362;
      v67 = v26;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v28 = NUAssertLogger_24364();
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (v27)
    {
      if (v29)
      {
        v48 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v49 = (void *)MEMORY[0x1E4F29060];
        id v50 = v48;
        v51 = [v49 callStackSymbols];
        v52 = [v51 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v67 = v48;
        __int16 v68 = 2114;
        v69 = v52;
        _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v29)
    {
      uint64_t v30 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v31 = [v30 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v67 = v31;
      _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderPipelineHelper resetTag:input:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderPipelineHelper.m", 349, @"Invalid parameter not satisfying: %s", v53, v54, v55, v56, (uint64_t)"input != nil");
  }
  if (!a5)
  {
    uint64_t v32 = NUAssertLogger_24364();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      uint64_t v33 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      v67 = v33;
      _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v34 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    CMTimeRange v35 = NUAssertLogger_24364();
    BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
    if (v34)
    {
      if (v36)
      {
        v57 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v58 = (void *)MEMORY[0x1E4F29060];
        id v59 = v57;
        v60 = [v58 callStackSymbols];
        v61 = [v60 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v67 = v57;
        __int16 v68 = 2114;
        v69 = v61;
        _os_log_error_impl(&dword_1A9892000, v35, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v36)
    {
      uint64_t v37 = [MEMORY[0x1E4F29060] callStackSymbols];
      v38 = [v37 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v67 = v38;
      _os_log_error_impl(&dword_1A9892000, v35, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderPipelineHelper resetTag:input:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderPipelineHelper.m", 350, @"Invalid parameter not satisfying: %s", v62, v63, v64, v65, (uint64_t)"error != nil");
  }
  id v11 = [(NURenderPipelineHelper *)self pipelineState];
  CGAffineTransform v12 = [v11 currentGroup];

  int64x2_t v13 = [v12 nodeWithPath:v8];
  int64x2_t v14 = v13;
  if (v13)
  {
    if (![v13 hasCyclicalDependencyForInput:v10])
    {
      [v14 setInput:v10];
      BOOL v16 = 1;
      goto LABEL_10;
    }
    int64x2_t v15 = @"resetTag failed - has cyclical dependency";
  }
  else
  {
    int64x2_t v15 = @"resetTag failed - could not find tag";
  }
  +[NUError errorWithCode:1 reason:v15 object:v8];
  BOOL v16 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v16;
}

- (void)resetTag:(id)a3 input:(id)a4
{
  id v10 = a4;
  id v6 = a3;
  int64x2_t v7 = [(NURenderPipelineHelper *)self pipelineState];
  id v8 = [v7 currentGroup];

  id v9 = [v8 nodeWithPath:v6];

  if (([v9 hasCyclicalDependencyForInput:v10] & 1) == 0) {
    [v9 setInput:v10];
  }
}

- (id)auxiliaryImageFromComposition:(id)a3 type:(id)a4 mediaComponentType:(id)a5 error:(id *)a6
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!a6)
  {
    BOOL v23 = NUAssertLogger_24364();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      v43 = v24;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v26 = NUAssertLogger_24364();
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v27)
      {
        uint64_t v30 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v31 = (void *)MEMORY[0x1E4F29060];
        id v32 = v30;
        uint64_t v33 = [v31 callStackSymbols];
        uint64_t v34 = [v33 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v43 = v30;
        __int16 v44 = 2114;
        uint64_t v45 = v34;
        _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v27)
    {
      id v28 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v29 = [v28 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v43 = v29;
      _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderPipelineHelper auxiliaryImageFromComposition:type:mediaComponentType:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderPipelineHelper.m", 310, @"Invalid parameter not satisfying: %s", v35, v36, v37, v38, (uint64_t)"error != nil");
  }
  int64x2_t v13 = v12;
  v40[0] = @"auxiliaryImageType";
  v40[1] = @"skipOrientation";
  v41[0] = v11;
  v41[1] = MEMORY[0x1E4F1CC38];
  v40[2] = @"nativeScale";
  v40[3] = @"mediaComponentType";
  v41[2] = MEMORY[0x1E4F1CC38];
  v41[3] = v12;
  int64x2_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:4];
  int64x2_t v15 = [v10 objectForKeyedSubscript:@"source"];
  BOOL v16 = [(NURenderPipelineHelper *)self isSourceAvailable:v15 sourceSettings:v14];

  if (v16)
  {
    int64x2_t v17 = [v10 objectForKeyedSubscript:@"source"];
    float64x2_t v18 = [(NURenderPipelineHelper *)self renderNodeFromSource:v17 settings:v14 error:a6];

    if (v18)
    {
      int64x2_t v19 = [v18 outputImageGeometry:a6];
      float64x2_t v20 = v19;
      if (v19) {
        [v19 extent];
      }
      else {
        memset(v39, 0, sizeof(v39));
      }
      BOOL v21 = [(NURenderPipelineHelper *)self cropNode:v18 cropRect:v39 cropSettings:0];
    }
    else
    {
      BOOL v21 = 0;
    }
  }
  else
  {
    BOOL v21 = 0;
  }

  return v21;
}

- (BOOL)isSourceAvailable:(id)a3 sourceSettings:(id)a4
{
  id v6 = a4;
  id v19 = 0;
  int64x2_t v7 = +[NUSourceContainerNode sourceContainerNodeFromSource:a3 error:&v19];
  id v8 = v19;
  if (v7)
  {
    id v9 = [(NURenderPipelineHelper *)self pipelineState];
    id v10 = (void *)[v9 copy];

    id v11 = [v10 pipelineSettingsFromSourceSettings:v6];
    id v18 = 0;
    int v12 = [v10 applyPipelineSettings:v11 error:&v18];
    id v13 = v18;

    if (v12)
    {
      id v17 = 0;
      int64x2_t v14 = [v7 preparedSourceNodeForPipelineState:v10 pipelineSettings:v11 sourceSettings:v6 error:&v17];
      id v15 = v17;

      LOBYTE(v12) = v14 != 0;
      id v13 = v15;
    }

    id v8 = v13;
  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (id)sourceFromComposition:(id)a3 withName:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = [a3 objectForKeyedSubscript:v7];
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v8;
      goto LABEL_7;
    }
    id v10 = @"object is not an NUSource";
    id v11 = v8;
  }
  else
  {
    id v10 = @"no source found";
    id v11 = v7;
  }
  +[NUError missingError:v10 object:v11];
  id v9 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v9;
}

- (id)sourceFromComposition:(id)a3 error:(id *)a4
{
  return [(NURenderPipelineHelper *)self sourceFromComposition:a3 withName:@"source" error:a4];
}

- (id)vectorWithFloats:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  unint64_t v4 = [v3 count];
  if (v4 >= 0x20) {
    uint64_t v5 = 32;
  }
  else {
    uint64_t v5 = v4;
  }
  id v6 = objc_msgSend(v3, "subarrayWithRange:", 0, v5);

  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    id v11 = v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "doubleValue", (void)v16);
        *v11++ = v13;
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  int64x2_t v14 = objc_msgSend(MEMORY[0x1E4F1E080], "vectorWithValues:count:", v21, objc_msgSend(v7, "count"));

  return v14;
}

- (BOOL)isCIFilterAvailable:(id)a3 propertyName:(id)a4
{
  id v5 = a4;
  id v6 = [MEMORY[0x1E4F1E040] filterWithName:a3];
  id v7 = v6;
  if (v5)
  {
    uint64_t v8 = [v6 inputKeys];
    char v9 = [v8 containsObject:v5];
  }
  else
  {
    char v9 = 1;
  }
  if (!v7) {
    char v9 = 0;
  }

  return v9;
}

- (id)filterNode:(id)a3 inputs:(id)a4 settings:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [[NUFilterNode alloc] initWithFilterName:v9 settings:v7 inputs:v8];

  return v10;
}

- (id)filterNode:(id)a3 input:(id)a4 settings:(id)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  uint64_t v15 = *MEMORY[0x1E4F1E480];
  v16[0] = a4;
  id v8 = (void *)MEMORY[0x1E4F1C9E8];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  int v12 = [v8 dictionaryWithObjects:v16 forKeys:&v15 count:1];

  uint64_t v13 = [(NURenderPipelineHelper *)self filterNode:v11 inputs:v12 settings:v9];

  return v13;
}

- (id)cropNode:(id)a3 cropRect:(id *)a4 cropSettings:(id)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  if (!v7)
  {
    v24 = NUAssertLogger_24364();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "node != nil");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v25;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v27 = NUAssertLogger_24364();
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v28)
      {
        uint64_t v31 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v32 = (void *)MEMORY[0x1E4F29060];
        id v33 = v31;
        uint64_t v34 = [v32 callStackSymbols];
        uint64_t v35 = [v34 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v31;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v35;
        _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v28)
    {
      BOOL v29 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v30 = [v29 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v30;
      _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderPipelineHelper cropNode:cropRect:cropSettings:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderPipelineHelper.m", 197, @"Invalid parameter not satisfying: %s", v36, v37, v38, v39, (uint64_t)"node != nil");
  }
  id v9 = v8;
  if (v8)
  {
    id v10 = [v8 objectForKeyedSubscript:@"resetCleanAperture"];
    uint64_t v11 = [v10 BOOLValue];

    int v12 = [v9 objectForKeyedSubscript:@"projectUsingCleanAperture"];
    uint64_t v13 = [v9 objectForKeyedSubscript:@"projectUsingOriginalSize"];
    int64x2_t v14 = [v9 objectForKeyedSubscript:@"projectUsingEstimatedCleanAperture"];
    uint64_t v15 = 0;
    if (v12 && v13)
    {
      unsigned int v40 = v11;
      double v42 = 0.0;
      double v43 = 0.0;
      [v13 getValue:&v42];
      memset(buf, 0, 32);
      [v12 getValue:buf];
      double v41 = 0.0;
      if (v14) {
        [v14 getValue:&v41];
      }
      v44[0] = @"projectUsingCleanAperture";
      long long v16 = objc_msgSend(MEMORY[0x1E4F1E080], "vectorWithCGRect:", *(double *)buf, *(double *)&buf[8], *(_OWORD *)&buf[16]);
      v45[0] = v16;
      v44[1] = @"projectUsingOriginalSize";
      id v17 = objc_alloc(MEMORY[0x1E4F1E080]);
      long long v18 = (void *)[v17 initWithX:v42 Y:v43];
      v45[1] = v18;
      v44[2] = @"projectUsingEstimatedCleanAperture";
      long long v19 = [NSNumber numberWithDouble:v41];
      v45[2] = v19;
      uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:3];

      uint64_t v11 = v40;
    }
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v11 = 0;
    int v12 = 0;
    int64x2_t v14 = 0;
    uint64_t v15 = 0;
  }
  float64x2_t v20 = [NUCropNode alloc];
  $0AC6E346AE4835514AAA8AC86D8F4844 var1 = a4->var1;
  *($0AC6E346AE4835514AAA8AC86D8F4844 *)buf = a4->var0;
  *($0AC6E346AE4835514AAA8AC86D8F4844 *)&buf[16] = var1;
  uint64_t v22 = [(NUCropNode *)v20 initWithRect:buf input:v7 resetCleanAperture:v11 settings:v15];

  return v22;
}

- (id)scaleNode:(id)a3 scale:(id)a4 error:(id *)a5
{
  int64_t var1 = a4.var1;
  int64_t var0 = a4.var0;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (!a5)
  {
    uint64_t v15 = NUAssertLogger_24364();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      long long v16 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      id v32 = v16;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    long long v18 = NUAssertLogger_24364();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        uint64_t v22 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v23 = (void *)MEMORY[0x1E4F29060];
        id v24 = v22;
        uint64_t v25 = [v23 callStackSymbols];
        id v26 = [v25 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v32 = v22;
        __int16 v33 = 2114;
        uint64_t v34 = v26;
        _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v19)
    {
      float64x2_t v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v21 = [v20 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v32 = v21;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderPipelineHelper scaleNode:scale:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderPipelineHelper.m", 183, @"Invalid parameter not satisfying: %s", v27, v28, v29, v30, (uint64_t)"error != nil");
  }
  id v10 = v9;
  if (v9)
  {
    uint64_t v11 = [NUScaleNode alloc];
    int v12 = [(NURenderPipelineHelper *)self pipelineState];
    uint64_t v13 = -[NUScaleNode initWithScale:sampleMode:input:](v11, "initWithScale:sampleMode:input:", var0, var1, [v12 sampleMode], v10);
  }
  else
  {
    int v12 = [MEMORY[0x1E4F1CA98] null];
    +[NUError missingError:@"input image to scaleNode:scale: cannot be nil" object:v12];
    uint64_t v13 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)cacheNode:(id)a3 type:(id)a4 settings:(id)a5 error:(id *)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!a6)
  {
    float64x2_t v20 = NUAssertLogger_24364();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      BOOL v21 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v37 = v21;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v23 = NUAssertLogger_24364();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        uint64_t v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v28 = (void *)MEMORY[0x1E4F29060];
        id v29 = v27;
        uint64_t v30 = [v28 callStackSymbols];
        uint64_t v31 = [v30 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v37 = v27;
        __int16 v38 = 2114;
        uint64_t v39 = v31;
        _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v24)
    {
      uint64_t v25 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v26 = [v25 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v37 = v26;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderPipelineHelper cacheNode:type:settings:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderPipelineHelper.m", 164, @"Invalid parameter not satisfying: %s", v32, v33, v34, v35, (uint64_t)"error != nil");
  }
  uint64_t v13 = v12;
  int64x2_t v14 = +[NUCacheNode registry];
  uint64_t v15 = (void *)[v14 classForCacheNodeType:v11];

  if (v15)
  {
    long long v16 = [(NURenderPipelineHelper *)self pipelineState];
    id v17 = [v15 nodeWithInput:v10 settings:v13 pipelineState:v16 error:a6];

    if (v17)
    {
      id v18 = v17;
    }
    else
    {
      *a6 = +[NUError errorWithCode:1 reason:@"Failed to instantiate cache node" object:v15 underlyingError:*a6];
    }
  }
  else
  {
    +[NUError unknownError:@"Unknown cache node type" object:v11];
    id v17 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (id)renderNodeFromSource:(id)a3 settings:(id)a4 error:(id *)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!a5)
  {
    float64x2_t v20 = NUAssertLogger_24364();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      BOOL v21 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v37 = v21;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v23 = NUAssertLogger_24364();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        uint64_t v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v28 = (void *)MEMORY[0x1E4F29060];
        id v29 = v27;
        uint64_t v30 = [v28 callStackSymbols];
        uint64_t v31 = [v30 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v37 = v27;
        __int16 v38 = 2114;
        uint64_t v39 = v31;
        _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v24)
    {
      uint64_t v25 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v26 = [v25 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v37 = v26;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderPipelineHelper renderNodeFromSource:settings:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderPipelineHelper.m", 135, @"Invalid parameter not satisfying: %s", v32, v33, v34, v35, (uint64_t)"error != nil");
  }
  id v10 = v9;
  if (v8)
  {
    id v11 = +[NUSourceContainerNode sourceContainerNodeFromSource:v8 error:a5];
    if (v11)
    {
      id v12 = [(NURenderPipelineHelper *)self pipelineState];
      uint64_t v13 = [v12 pipelineSettingsFromSourceSettings:v10];

      int64x2_t v14 = [(NURenderPipelineHelper *)self pipelineState];
      uint64_t v15 = (void *)[v14 copy];

      if ([v15 applyPipelineSettings:v13 error:a5])
      {
        long long v16 = [v11 preparedSourceNodeForPipelineState:v15 pipelineSettings:v13 sourceSettings:v10 error:a5];
        id v17 = v16;
        if (v16) {
          id v18 = v16;
        }
      }
      else
      {
        id v17 = 0;
      }
    }
    else
    {
      id v17 = 0;
    }
  }
  else
  {
    +[NUError missingError:@"Invalid source" object:self];
    id v17 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (id)getTagWithPath:(id)a3 error:(id *)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!a4)
  {
    int64x2_t v14 = NUAssertLogger_24364();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v31 = v15;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v17 = NUAssertLogger_24364();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        BOOL v21 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v22 = (void *)MEMORY[0x1E4F29060];
        id v23 = v21;
        BOOL v24 = [v22 callStackSymbols];
        uint64_t v25 = [v24 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v31 = v21;
        __int16 v32 = 2114;
        uint64_t v33 = v25;
        _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v18)
    {
      BOOL v19 = [MEMORY[0x1E4F29060] callStackSymbols];
      float64x2_t v20 = [v19 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v31 = v20;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderPipelineHelper getTagWithPath:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderPipelineHelper.m", 112, @"Invalid parameter not satisfying: %s", v26, v27, v28, v29, (uint64_t)"error != nil");
  }
  id v7 = v6;
  id v8 = [(NURenderPipelineHelper *)self pipelineState];
  id v9 = [v8 currentGroup];

  if (+[NURenderTagGroup validatePath:v7 error:a4])
  {
    id v10 = [v9 nodeWithPath:v7];
    id v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      *a4 = +[NUError errorWithCode:1 reason:@"getTagWithPath - could not find tag" object:v7];
    }
  }
  else
  {
    +[NUError errorWithCode:5 reason:@"getTagWithPath - Invalid tag path" object:v7 underlyingError:*a4];
    id v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)addTagWithName:(id)a3 inputNode:(id)a4 error:(id *)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!a5)
  {
    long long v16 = NUAssertLogger_24364();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      uint64_t v33 = v17;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v19 = NUAssertLogger_24364();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        id v23 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v24 = (void *)MEMORY[0x1E4F29060];
        id v25 = v23;
        uint64_t v26 = [v24 callStackSymbols];
        uint64_t v27 = [v26 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v33 = v23;
        __int16 v34 = 2114;
        uint64_t v35 = v27;
        _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v20)
    {
      BOOL v21 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v22 = [v21 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v33 = v22;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderPipelineHelper addTagWithName:inputNode:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderPipelineHelper.m", 88, @"Invalid parameter not satisfying: %s", v28, v29, v30, v31, (uint64_t)"error != NULL");
  }
  id v10 = v9;
  if (+[NURenderTagNode validateName:v8 error:a5])
  {
    id v11 = [(NURenderPipelineHelper *)self pipelineState];
    id v12 = [v11 currentGroup];

    uint64_t v13 = [v12 nodeWithPath:v8];
    if (v13)
    {
      +[NUError errorWithCode:5 reason:@"Given tag already present" object:v8];
      int64x2_t v14 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      int64x2_t v14 = [v12 addTag:v8 forNode:v10];
    }
  }
  else
  {
    +[NUError errorWithCode:5 reason:@"Invalid tag name" object:v8 underlyingError:*a5];
    int64x2_t v14 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (id)inputForPath:(id)a3 error:(id *)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!a4)
  {
    int64x2_t v14 = NUAssertLogger_24364();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      uint64_t v31 = v15;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v17 = NUAssertLogger_24364();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        BOOL v21 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v22 = (void *)MEMORY[0x1E4F29060];
        id v23 = v21;
        BOOL v24 = [v22 callStackSymbols];
        id v25 = [v24 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v31 = v21;
        __int16 v32 = 2114;
        uint64_t v33 = v25;
        _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v18)
    {
      BOOL v19 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v20 = [v19 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v31 = v20;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderPipelineHelper inputForPath:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderPipelineHelper.m", 64, @"Invalid parameter not satisfying: %s", v26, v27, v28, v29, (uint64_t)"error != NULL");
  }
  id v7 = v6;
  id v8 = [(NURenderPipelineHelper *)self pipelineState];
  id v9 = [v8 currentGroup];

  if (+[NURenderTagGroup validatePath:v7 error:a4])
  {
    id v10 = [v9 nodeWithPath:v7];
    id v11 = v10;
    if (v10)
    {
      id v12 = [v10 input];
    }
    else
    {
      +[NUError errorWithCode:5 reason:@"inputForPath - did not find node with path" object:v7];
      id v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    +[NUError errorWithCode:5 reason:@"inputForPath - Invalid path" object:v7 underlyingError:*a4];
    id v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (BOOL)endGroupWithName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(NURenderPipelineHelper *)self pipelineState];
  LOBYTE(a4) = [v7 endGroupWithName:v6 error:a4];

  return (char)a4;
}

- (id)beginGroupWithName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(NURenderPipelineHelper *)self pipelineState];
  id v8 = [v7 beginGroupWithName:v6 error:a4];

  return v8;
}

- (BOOL)hasStaticTime
{
  v2 = [(NURenderPipelineHelper *)self pipelineState];
  id v3 = v2;
  if (v2)
  {
    [v2 time];
    BOOL v4 = v6 & 1;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (int64_t)mediaTypeForComposition:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"source"];
  BOOL v4 = [v3 definition];
  id v5 = v4;
  if (v4) {
    int64_t v6 = [v4 mediaType];
  }
  else {
    int64_t v6 = 0;
  }

  return v6;
}

- (NURenderPipelineHelper)initWithPipelineState:(id)a3
{
  BOOL v4 = (NURenderPipelineState *)a3;
  v8.receiver = self;
  v8.super_class = (Class)NURenderPipelineHelper;
  id v5 = [(NURenderPipelineHelper *)&v8 init];
  pipelineState = v5->_pipelineState;
  v5->_pipelineState = v4;

  return v5;
}

+ (id)styleTransferInterpolationNodeWithInputs:(id)a3 weights:(id)a4 settings:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [[NUStyleTransferInterpolationNode alloc] initWithInputs:v9 weights:v8 settings:v7];

  return v10;
}

+ (id)styleTransferApplyNodeWithInput:(id)a3 thumbnail:(id)a4 target:(id)a5 settings:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  uint64_t v13 = [NUStyleTransferApplyNode alloc];
  if (v9) {
    uint64_t v14 = [(NUStyleTransferApplyNode *)v13 initWithInput:v12 thumbnail:v9 target:v11 settings:v10];
  }
  else {
    uint64_t v14 = [(NUStyleTransferNode *)v13 initWithInput:v12 target:v11 settings:v10];
  }
  uint64_t v15 = (void *)v14;

  return v15;
}

+ (id)styleTransferThumbnailNodeWithInput:(id)a3 settings:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[NUStyleTransferThumbnailNode alloc] initWithInput:v6 settings:v5];

  return v7;
}

+ (id)styleTransferLearnNodeWithInput:(id)a3 target:(id)a4 settings:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [(NUStyleTransferNode *)[NUStyleTransferLearnNode alloc] initWithInput:v9 target:v8 settings:v7];

  return v10;
}

+ (id)styleTransferNodeWithInput:(id)a3 target:(id)a4 settings:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [[NUStyleTransferNode alloc] initWithInput:v9 target:v8 settings:v7];

  return v10;
}

+ (id)gainMapFromLightMap:(id)a3 base:(id)a4 settings:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [[NUHDRGainMapDivideNode alloc] initWithInput:v8 lightMap:v9 settings:v7];

  return v10;
}

+ (id)lightMapFromGainMap:(id)a3 settings:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[NUHDRGainMapMultiplyNode alloc] initWithInput:v6 settings:v5];

  return v7;
}

@end