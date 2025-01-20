@interface NUVideoRenderJob
- (BOOL)prepare:(id *)a3;
- (BOOL)requiresVideoComposition;
- (BOOL)wantsCompleteStage;
- (BOOL)wantsOutputGeometry;
- (BOOL)wantsOutputVideo;
- (BOOL)wantsRenderStage;
- (id)generateVideoComposition:(id *)a3;
- (id)result;
- (id)scalePolicy;
@end

@implementation NUVideoRenderJob

- (id)result
{
  v3 = objc_alloc_init(_NUVideoRenderResult);
  v4 = [(NURenderJob *)self outputVideo];
  [(_NUVideoRenderResult *)v3 setVideo:v4];

  v5 = [(NURenderJob *)self outputVideoComposition];
  [(_NUVideoRenderResult *)v3 setVideoComposition:v5];

  v6 = [(NURenderJob *)self outputAudioMix];
  [(_NUVideoRenderResult *)v3 setAudioMix:v6];

  v7 = [(NURenderJob *)self outputGeometry];
  [(_NUVideoRenderResult *)v3 setGeometry:v7];

  return v3;
}

- (id)generateVideoComposition:(id *)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  v47.receiver = self;
  v47.super_class = (Class)NUVideoRenderJob;
  v42 = -[NURenderJob generateVideoComposition:](&v47, sel_generateVideoComposition_);
  v5 = +[NUVideoUtilities deepMutableCopyVideoComposition:](NUVideoUtilities, "deepMutableCopyVideoComposition:");
  v6 = [(NURenderJob *)self composition];
  +[NUCompositionUtilities isHDRComposition:v6];

  [v5 setCustomVideoCompositorClass:objc_opt_class()];
  v7 = [(NURenderJob *)self outputVideo];
  v8 = [v7 tracksWithMediaType:*MEMORY[0x1E4F15C18]];
  if ([v8 count] == 1)
  {
    v9 = [v8 objectAtIndexedSubscript:0];
    objc_msgSend(v5, "setSourceTrackIDForFrameTiming:", objc_msgSend(v9, "trackID"));
  }
  v39 = v8;
  uint64_t v10 = +[NUVideoUtilities firstEnabledVideoTrackInAsset:v7 error:a3];
  v40 = v7;
  v38 = (void *)v10;
  if (v10) {
    BOOL v11 = +[NUVideoUtilities videoTrackContainsDolbyVisionMetadata:v10];
  }
  else {
    BOOL v11 = 0;
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v41 = v5;
  v12 = [v5 instructions];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v44 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        v18 = [(NURenderJob *)self request];
        v19 = [v18 composition];
        [v17 setAdjustmentComposition:v19];

        v20 = [(NURenderJob *)self request];
        v21 = [v20 pipelineFilters];
        [v17 setPipelineFilters:v21];

        uint64_t v22 = [(NURenderJob *)self renderScale];
        objc_msgSend(v17, "setRenderScale:", v22, v23);
        v24 = [(NUVideoRenderJob *)self videoRenderRequest];
        v25 = [v24 colorSpace];
        [v17 setColorSpace:v25];

        [v17 setIsDolbyVision:v11];
        v26 = [(NURenderJob *)self request];
        v27 = [v26 renderContext];
        [v17 setRenderContext:v27];

        v28 = [(NURenderJob *)self prepareNode];
        [v17 setVideoRenderPrepareNode:v28];

        v29 = [(NURenderJob *)self request];
        objc_msgSend(v17, "setSampleMode:", objc_msgSend(v29, "sampleMode"));

        v30 = [(NURenderJob *)self request];
        v31 = [v30 name];
        v32 = [v31 stringByReplacingOccurrencesOfString:@"-NUVideoRenderRequest" withString:&stru_1F0017700];
        [v17 setName:v32];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v43 objects:v48 count:16];
    }
    while (v14);
  }

  if (v11) {
    [v41 setPerFrameHDRDisplayMetadataPolicy:*MEMORY[0x1E4F16260]];
  }
  v33 = [v41 instructions];
  v34 = [v33 firstObject];
  v35 = [v34 requiredSourceSampleDataTrackIDs];
  [v41 setSourceSampleDataTrackIDs:v35];

  v36 = (void *)[v41 copy];

  return v36;
}

- (BOOL)requiresVideoComposition
{
  v3.receiver = self;
  v3.super_class = (Class)NUVideoRenderJob;
  return [(NURenderJob *)&v3 requiresVideoComposition];
}

- (BOOL)prepare:(id *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)NUVideoRenderJob;
  BOOL v4 = [(NURenderJob *)&v14 prepare:a3];
  if (v4 && ![(NURenderJob *)self _shouldWaitForDependentJobs])
  {
    v5 = [(NURenderJob *)self outputVideoComposition];

    if (!v5)
    {
      v6 = [(NURenderJob *)self outputGeometry];
      v7 = [NUImageGeometry alloc];
      if (v6)
      {
        [v6 extent];
      }
      else
      {
        long long v12 = 0u;
        long long v13 = 0u;
      }
      uint64_t v8 = objc_msgSend(v6, "orientation", v12, v13);
      v9 = [v6 spaceMap];
      uint64_t v10 = [(NUImageGeometry *)v7 initWithExtent:&v12 renderScale:NUScaleOne orientation:v8 spaceMap:v9];
      [(NURenderJob *)self setOutputGeometry:v10];
    }
  }
  return v4;
}

- (id)scalePolicy
{
  v2 = [(NUVideoRenderJob *)self videoRenderRequest];
  objc_super v3 = [v2 scalePolicy];

  return v3;
}

- (BOOL)wantsOutputGeometry
{
  return 1;
}

- (BOOL)wantsOutputVideo
{
  return 1;
}

- (BOOL)wantsCompleteStage
{
  return 0;
}

- (BOOL)wantsRenderStage
{
  return 0;
}

@end