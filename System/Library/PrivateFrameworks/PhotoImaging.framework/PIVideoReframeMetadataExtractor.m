@interface PIVideoReframeMetadataExtractor
+ (BOOL)canProvideMetadataForAVAsset:(id)a3;
- (CGVector)centerMotionVectorFromMetadata:(const FigLivePhotoMetadata *)a3;
- (CGVector)motionBlurVectorFromMetadata:(const FigLivePhotoMetadata *)a3;
- (NSArray)timedMetadataArray;
- (PIVideoReframeMetadataExtractor)init;
- (PIVideoReframeMetadataExtractor)initWithAVAsset:(id)a3;
- (double)trajectoryeHomographyFromMetadata:(double)a3 containsV3Metadata:(int32x4_t)a4;
- (id)extractMetadata;
@end

@implementation PIVideoReframeMetadataExtractor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->timedMetadataArray, 0);
  objc_storeStrong((id *)&self->_mdataTrack, 0);
  objc_storeStrong((id *)&self->_videoTrack, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

- (NSArray)timedMetadataArray
{
  return self->timedMetadataArray;
}

- (id)extractMetadata
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  v45 = (void *)MEMORY[0x1AD0F8D70](self, a2);
  asset = self->_asset;
  id v55 = 0;
  id v47 = [MEMORY[0x1E4F16378] assetReaderWithAsset:asset error:&v55];
  id v46 = v55;
  if (v46)
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_24598);
    }
    v4 = *MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v46;
      _os_log_error_impl(&dword_1A9680000, v4, OS_LOG_TYPE_ERROR, "Error creating asset reader: %@", buf, 0xCu);
    }
    v5 = 0;
  }
  else
  {
    id v42 = (id)[objc_alloc(MEMORY[0x1E4F163A0]) initWithTrack:self->_mdataTrack outputSettings:0];
    if (objc_msgSend(v47, "canAddOutput:"))
    {
      [v47 addOutput:v42];
      id v48 = (id)[objc_alloc(MEMORY[0x1E4F16390]) initWithAssetReaderTrackOutput:v42];
      if ([v47 startReading])
      {
        id v43 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:64];
        if (*MEMORY[0x1E4F7A750] != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_24598);
        }
        v6 = *MEMORY[0x1E4F7A758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A9680000, v6, OS_LOG_TYPE_DEFAULT, "Starting metadata extraction", buf, 2u);
        }
        uint64_t v44 = *MEMORY[0x1E4F52790];
        uint64_t v7 = *MEMORY[0x1E4F52758];
        double v8 = 0.0;
        v41 = "0 && \"unexpected metadata identifier\"";
        double v9 = 0.0;
        do
        {
          v10 = (void *)MEMORY[0x1AD0F8D70]();
          v11 = [v48 nextTimedMetadataGroup];
          v12 = v11;
          if (v11)
          {
            v13 = [v11 items];
            if ([v13 count] != 1) {
              __assert_rtn("-[PIVideoReframeMetadataExtractor extractMetadata]", "PIVideoReframeMetadataExtractor.mm", 330, "mdataGroup.items.count == 1");
            }

            v14 = [v12 items];
            v15 = [v14 firstObject];

            v16 = [v15 identifier];
            char v17 = [v16 isEqualToString:v44];

            if ((v17 & 1) == 0)
            {
              int v39 = 335;
              goto LABEL_52;
            }
            v18 = [v15 dataType];
            char v19 = [v18 isEqualToString:v7];

            if ((v19 & 1) == 0)
            {
              int v39 = 338;
              v41 = "0 && \"unexpected metadata data type\"";
LABEL_52:
              __assert_rtn("-[PIVideoReframeMetadataExtractor extractMetadata]", "PIVideoReframeMetadataExtractor.mm", v39, v41);
            }
            int v54 = 0;
            *(void *)buf = 0;
            id v20 = [v15 dataValue];
            [v20 bytes];
            v21 = [v15 dataValue];
            [v21 length];
            int v22 = FigLivePhotoMetadataComputeDeserializationSize();

            if (v22) {
              __assert_rtn("-[PIVideoReframeMetadataExtractor extractMetadata]", "PIVideoReframeMetadataExtractor.mm", 347, "err == noErr");
            }
            MEMORY[0x1F4188790](v23);
            v25 = (char *)&v40 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
            id v26 = [v15 dataValue];
            [v26 bytes];
            v27 = [v15 dataValue];
            [v27 length];
            int v28 = FigLivePhotoMetadataDeserializeIntoBuffer();

            if (v28) {
              __assert_rtn("-[PIVideoReframeMetadataExtractor extractMetadata]", "PIVideoReframeMetadataExtractor.mm", 354, "err == noErr");
            }
            v29 = objc_alloc_init(PIVideoReframeTimedMetadata);
            if (v15)
            {
              [v15 time];
            }
            else
            {
              long long v52 = 0uLL;
              uint64_t v53 = 0;
            }
            long long v50 = v52;
            uint64_t v51 = v53;
            [(PIVideoReframeTimedMetadata *)v29 setTime:&v50];
            [(PIVideoReframeMetadataExtractor *)self centerMotionVectorFromMetadata:v25];
            double v31 = v30;
            double v33 = v32;
            -[PIVideoReframeTimedMetadata setEstimatedCenterMotion:](v29, "setEstimatedCenterMotion:", v30 - v9, v32 - v8);
            [(PIVideoReframeMetadataExtractor *)self motionBlurVectorFromMetadata:v25];
            -[PIVideoReframeTimedMetadata setEstimatedMotionBlur:](v29, "setEstimatedMotionBlur:");
            char v49 = 0;
            [(PIVideoReframeMetadataExtractor *)self trajectoryeHomographyFromMetadata:v25 containsV3Metadata:&v49];
            -[PIVideoReframeTimedMetadata setTrajectoryHomography:](v29, "setTrajectoryHomography:");
            if (v49) {
              [v43 addObject:v29];
            }

            double v8 = v33;
            double v9 = v31;
          }
        }
        while (v12);
        if (*MEMORY[0x1E4F7A750] != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_24598);
        }
        v34 = *MEMORY[0x1E4F7A758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A9680000, v34, OS_LOG_TYPE_DEFAULT, "Finished metadata extraction", buf, 2u);
        }
        id v35 = v43;
        v5 = (void *)[v43 copy];
      }
      else
      {
        if (*MEMORY[0x1E4F7A750] != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_24598);
        }
        v37 = *MEMORY[0x1E4F7A758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1A9680000, v37, OS_LOG_TYPE_ERROR, "Failed to start reading asset", buf, 2u);
        }
        v5 = 0;
      }
    }
    else
    {
      if (*MEMORY[0x1E4F7A750] != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_24598);
      }
      v36 = *MEMORY[0x1E4F7A758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A9680000, v36, OS_LOG_TYPE_ERROR, "Can't add metadata output for asset", buf, 2u);
      }
      v5 = 0;
    }
  }
  return v5;
}

- (double)trajectoryeHomographyFromMetadata:(double)a3 containsV3Metadata:(int32x4_t)a4
{
  if (*a7 >= 3u
    && (double v8 = (int32x4_t *)&a7[8 * a7[11]],
        uint64_t i64 = (uint64_t)v8[2 * vaddvq_s32(v8[3]) + 3].i64,
        __int16 v11 = *(_WORD *)(i64 + 16),
        v10 = (void *)(i64 + 16),
        (v11 & 1) != 0))
  {
    *a8 = 1;
    v13.i64[0] = *(void *)((char *)v10 + 4);
    a4.i64[0] = *(void *)((char *)v10 + 28);
    v13.i64[1] = v10[2];
    *(void *)&double result = vuzp1q_s32(v13, a4).u64[0];
  }
  else
  {
    *a8 = 0;
    *(void *)&double result = 1065353216;
  }
  return result;
}

- (CGVector)motionBlurVectorFromMetadata:(const FigLivePhotoMetadata *)a3
{
  if (!a3->var0) {
    __assert_rtn("-[PIVideoReframeMetadataExtractor motionBlurVectorFromMetadata:]", "PIVideoReframeMetadataExtractor.mm", 248, "v1");
  }
  float64x2_t v3 = vsubq_f64(vaddq_f64(*(float64x2_t *)&self->pxlMetadataTransform.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&self->pxlMetadataTransform.c, a3->var1.var3), *(float64x2_t *)&self->pxlMetadataTransform.a, a3->var1.var2)), vaddq_f64(*(float64x2_t *)&self->pxlMetadataTransform.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&self->pxlMetadataTransform.c, *(double *)(MEMORY[0x1E4F1DAD8] + 8)), *(float64x2_t *)&self->pxlMetadataTransform.a, *MEMORY[0x1E4F1DAD8])));
  double v4 = v3.f64[1];
  result.dx = v3.f64[0];
  result.dy = v4;
  return result;
}

- (CGVector)centerMotionVectorFromMetadata:(const FigLivePhotoMetadata *)a3
{
  if (a3->var0)
  {
    float64x2_t v3 = vsubq_f64(vaddq_f64(*(float64x2_t *)&self->pxlMetadataTransform.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&self->pxlMetadataTransform.c, *((float *)&a3->var1.var1 + 1)), *(float64x2_t *)&self->pxlMetadataTransform.a, *(float *)&a3->var1.var1)), vaddq_f64(*(float64x2_t *)&self->pxlMetadataTransform.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&self->pxlMetadataTransform.c, *(double *)(MEMORY[0x1E4F1DAD8] + 8)), *(float64x2_t *)&self->pxlMetadataTransform.a, *MEMORY[0x1E4F1DAD8])));
    double v4 = v3.f64[1];
  }
  else
  {
    v3.f64[0] = 0.0;
    double v4 = 0.0;
  }
  result.dx = v3.f64[0];
  result.dy = v4;
  return result;
}

- (PIVideoReframeMetadataExtractor)initWithAVAsset:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v31.receiver = self;
  v31.super_class = (Class)PIVideoReframeMetadataExtractor;
  v6 = [(PIVideoReframeMetadataExtractor *)&v31 init];
  objc_storeStrong((id *)v6 + 1, a3);
  uint64_t v7 = *((void *)v6 + 1);
  id v30 = 0;
  uint64_t v8 = [MEMORY[0x1E4F7A718] firstEnabledVideoTrackInAsset:v7 error:&v30];
  id v9 = v30;
  v10 = (void *)*((void *)v6 + 2);
  *((void *)v6 + 2) = v8;

  if (!*((void *)v6 + 2))
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_24598);
    }
    id v20 = *MEMORY[0x1E4F7A758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    *(_DWORD *)buf = 138412290;
    id v34 = v9;
    v21 = "Can't find enabled video track in asset: %@";
    int v22 = v20;
    uint32_t v23 = 12;
    goto LABEL_28;
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  __int16 v11 = [v5 tracks];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v11);
        }
        v15 = *(AVAssetTrack **)(*((void *)&v26 + 1) + 8 * i);
        if (isLivePhotoMetadataTrack(v15))
        {
          objc_storeStrong((id *)v6 + 3, v15);
          goto LABEL_12;
        }
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v32 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  if (!*((void *)v6 + 3))
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_24598);
    }
    uint64_t v24 = *MEMORY[0x1E4F7A758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    *(_WORD *)buf = 0;
    v21 = "Asset does not contain Live Photo metadata track";
LABEL_27:
    int v22 = v24;
    uint32_t v23 = 2;
LABEL_28:
    _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, v21, buf, v23);
LABEL_29:
    char v19 = 0;
    goto LABEL_30;
  }
  *((void *)v6 + 5) = 0;
  *((void *)v6 + 6) = 0;
  *((void *)v6 + 4) = 0x3FF0000000000000;
  *(_OWORD *)(v6 + 56) = xmmword_1A980BA10;
  *((void *)v6 + 9) = 0x3FF0000000000000;
  [MEMORY[0x1E4F7A718] encodedPixelSizeOfTrack:*((void *)v6 + 2) oriented:0];
  *((void *)v6 + 11) = 0;
  *((void *)v6 + 12) = 0;
  *((void *)v6 + 10) = 0x3FF0000000000000;
  *(_OWORD *)(v6 + 104) = xmmword_1A980BA10;
  *((double *)v6 + 15) = (double)v16;
  uint64_t v17 = [v6 extractMetadata];
  v18 = (void *)*((void *)v6 + 16);
  *((void *)v6 + 16) = v17;

  if (![*((id *)v6 + 16) count])
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_24598);
    }
    uint64_t v24 = *MEMORY[0x1E4F7A758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    *(_WORD *)buf = 0;
    v21 = "Track does not contain V3 metadata";
    goto LABEL_27;
  }
  char v19 = v6;
LABEL_30:

  return v19;
}

- (PIVideoReframeMetadataExtractor)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"init is not a valid initializer" userInfo:0];
  objc_exception_throw(v2);
}

+ (BOOL)canProvideMetadataForAVAsset:(id)a3
{
  id v3 = a3;
  double v4 = [[PIVideoReframeMetadataExtractor alloc] initWithAVAsset:v3];
  id v5 = [(PIVideoReframeMetadataExtractor *)v4 timedMetadataArray];
  BOOL v6 = v5 != 0;

  return v6;
}

@end