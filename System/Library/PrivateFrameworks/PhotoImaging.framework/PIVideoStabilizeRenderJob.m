@interface PIVideoStabilizeRenderJob
- ($FD18CD26FAB5729647810B74E671536E)stabCropRect;
- (BOOL)prepare:(id *)a3;
- (BOOL)wantsCompleteStage;
- (BOOL)wantsOutputVideo;
- (BOOL)wantsRenderStage;
- (NSArray)keyframes;
- (NSDictionary)rawHomographies;
- (double)allowedCropFraction;
- (id)progressHandler;
- (id)result;
- (id)scalePolicy;
- (unint64_t)allowedAnalysisTypes;
- (unint64_t)analysisType;
- (void)setAllowedAnalysisTypes:(unint64_t)a3;
- (void)setAllowedCropFraction:(double)a3;
- (void)setProgressHandler:(id)a3;
@end

@implementation PIVideoStabilizeRenderJob

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawHomographies, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_keyframes, 0);
}

- (NSDictionary)rawHomographies
{
  return self->_rawHomographies;
}

- (void)setProgressHandler:(id)a3
{
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setAllowedCropFraction:(double)a3
{
  self->_allowedCropFraction = a3;
}

- (double)allowedCropFraction
{
  return self->_allowedCropFraction;
}

- (unint64_t)analysisType
{
  return self->_analysisType;
}

- (void)setAllowedAnalysisTypes:(unint64_t)a3
{
  self->_allowedAnalysisTypes = a3;
}

- (unint64_t)allowedAnalysisTypes
{
  return self->_allowedAnalysisTypes;
}

- ($FD18CD26FAB5729647810B74E671536E)stabCropRect
{
  $0AC6E346AE4835514AAA8AC86D8F4844 v3 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)&self[9].var0.var1;
  retstr->var0 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)&self[8].var1.var1;
  retstr->var1 = v3;
  return self;
}

- (NSArray)keyframes
{
  return self->_keyframes;
}

- (id)result
{
  $0AC6E346AE4835514AAA8AC86D8F4844 v3 = [_PIVideoStabilizeResult alloc];
  v4 = [(PIVideoStabilizeRenderJob *)self keyframes];
  [(PIVideoStabilizeRenderJob *)self stabCropRect];
  unint64_t v5 = [(PIVideoStabilizeRenderJob *)self analysisType];
  v6 = [(PIVideoStabilizeRenderJob *)self rawHomographies];
  v7 = [(_PIVideoStabilizeResult *)v3 initWithKeyframes:v4 stabCropRect:&v9 analysisType:v5 rawHomographies:v6];

  return v7;
}

- (BOOL)prepare:(id *)a3
{
  uint64_t v114 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v58 = NUAssertLogger_6438();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
    {
      v59 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v59;
      _os_log_error_impl(&dword_1A9680000, v58, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v60 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v62 = NUAssertLogger_6438();
    BOOL v63 = os_log_type_enabled(v62, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v63)
      {
        v66 = dispatch_get_specific(*v60);
        v67 = (void *)MEMORY[0x1E4F29060];
        id v68 = v66;
        v69 = [v67 callStackSymbols];
        v70 = [v69 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v66;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v70;
        _os_log_error_impl(&dword_1A9680000, v62, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v63)
    {
      v64 = [MEMORY[0x1E4F29060] callStackSymbols];
      v65 = [v64 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v65;
      _os_log_error_impl(&dword_1A9680000, v62, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
    __break(1u);
  }
  v92.receiver = self;
  v92.super_class = (Class)PIVideoStabilizeRenderJob;
  if (-[NURenderJob prepare:](&v92, sel_prepare_))
  {
    v78 = [(NURenderJob *)self outputVideo];
    v76 = [MEMORY[0x1E4F7A718] firstEnabledVideoTrackInAsset:v78 error:a3];
    if (!v76)
    {
      BOOL v33 = 0;
LABEL_34:

      return v33;
    }
    [MEMORY[0x1E4F7A718] cleanApertureOfTrack:v76 oriented:0];
    id v72 = location[4];
    id v73 = location[3];
    $0AC6E346AE4835514AAA8AC86D8F4844 v3 = objc_alloc_init(_PIVideoStabilizeFlowControl);
    [(_PIVideoStabilizeFlowControl *)v3 setProgressHandler:self->_progressHandler];
    objc_initWeak(location, self);
    v89[0] = MEMORY[0x1E4F143A8];
    v89[1] = 3221225472;
    v89[2] = __37__PIVideoStabilizeRenderJob_prepare___block_invoke;
    v89[3] = &unk_1E5D7F398;
    objc_copyWeak(&v90, location);
    [(_PIVideoStabilizeFlowControl *)v3 setShouldCancelHandler:v89];
    [(_PIVideoStabilizeFlowControl *)v3 setRangeMin:0.0];
    [(_PIVideoStabilizeFlowControl *)v3 setRangeMax:0.75];
    char v4 = [(PIVideoStabilizeRenderJob *)self allowedAnalysisTypes];
    id v74 = v78;
    v75 = v3;
    unsigned int v98 = 0;
    if ((v4 & 2) != 0)
    {
      unint64_t v5 = [[PIVideoReframeMetadataExtractor alloc] initWithAVAsset:v74];
      v6 = [(PIVideoReframeMetadataExtractor *)v5 timedMetadataArray];

      if (v6)
      {
        NUPixelSizeToCGSize();
        CFDictionaryRef DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(v115);
        v82 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
        long long v96 = 0u;
        long long v97 = 0u;
        long long v95 = 0u;
        long long v94 = 0u;
        id obj = v6;
        uint64_t v83 = [obj countByEnumeratingWithState:&v94 objects:buf count:16];
        if (v83)
        {
          uint64_t v81 = *(void *)v95;
          do
          {
            for (uint64_t i = 0; i != v83; ++i)
            {
              if (*(void *)v95 != v81) {
                objc_enumerationMutation(obj);
              }
              v7 = *(void **)(*((void *)&v94 + 1) + 8 * i);
              if (v7) {
                [*(id *)(*((void *)&v94 + 1) + 8 * i) time];
              }
              else {
                memset(&v93, 0, sizeof(v93));
              }
              CMTime time = v93;
              CFDictionaryRef v84 = CMTimeCopyAsDictionary(&time, 0);
              [v7 trajectoryHomography];
              long long v87 = v9;
              long long v88 = v8;
              long long v86 = v10;
              v11 = [NSNumber numberWithFloat:*(double *)&v8];
              v104 = v11;
              v12 = [NSNumber numberWithFloat:*(double *)&v87];
              v105 = v12;
              v13 = [NSNumber numberWithFloat:*(double *)&v86];
              HIDWORD(v14) = DWORD1(v88);
              LODWORD(v14) = DWORD1(v88);
              v106 = v13;
              v15 = [NSNumber numberWithFloat:v14];
              HIDWORD(v16) = DWORD1(v87);
              LODWORD(v16) = DWORD1(v87);
              v107 = v15;
              v17 = [NSNumber numberWithFloat:v16];
              HIDWORD(v18) = DWORD1(v86);
              LODWORD(v18) = DWORD1(v86);
              v108 = v17;
              v19 = [NSNumber numberWithFloat:v18];
              v109 = v19;
              v20 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v88), DWORD2(v88))));
              v110 = v20;
              v21 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v87), DWORD2(v87))));
              v111 = v21;
              v22 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v86), DWORD2(v86))));
              v112 = v22;
              v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v104 count:9];

              uint64_t v24 = *MEMORY[0x1E4F6F348];
              v102[0] = *MEMORY[0x1E4F6F350];
              v102[1] = v24;
              v103[0] = v84;
              v103[1] = v23;
              v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v103 forKeys:v102 count:2];
              [v82 addObject:v25];
            }
            uint64_t v83 = [obj countByEnumeratingWithState:&v94 objects:buf count:16];
          }
          while (v83);
        }

        uint64_t v26 = *MEMORY[0x1E4F6F340];
        v100[0] = *MEMORY[0x1E4F6F390];
        v100[1] = v26;
        v101[0] = DictionaryRepresentation;
        v101[1] = v82;
        uint64_t v27 = *MEMORY[0x1E4F6F360];
        v100[2] = *MEMORY[0x1E4F6F358];
        v100[3] = v27;
        v101[2] = MEMORY[0x1E4F1CC38];
        v101[3] = MEMORY[0x1E4F1CC38];
        v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v101 forKeys:v100 count:4];
        uint64_t v29 = ICSynthesizeAnalysis();
        if (!v29)
        {
          v30 = (void *)MEMORY[0x1E4F7A438];
          v31 = [NSNumber numberWithInt:v98];
          *a3 = [v30 failureError:@"Failure in ICSynthesizeAnalysis" object:v31];
        }
        if (!v29) {
          goto LABEL_32;
        }
        unint64_t v32 = 2;
        goto LABEL_26;
      }
    }
    if (v4)
    {
      if (ICAnalyzeInputMotion())
      {

        unint64_t v32 = 1;
LABEL_26:
        if ([(NURenderJob *)self isCanceled])
        {
          v34 = (void *)MEMORY[0x1E4F7A438];
          v35 = (void *)[(PIVideoStabilizeRenderJob *)self copy];
          *a3 = [v34 canceledError:@"Stabilize request was cancelled" object:v35];

          ICDestroyResult();
        }
        else
        {
          [(_PIVideoStabilizeFlowControl *)v75 rangeMax];
          -[_PIVideoStabilizeFlowControl setRangeMin:](v75, "setRangeMin:");
          [(_PIVideoStabilizeFlowControl *)v75 setRangeMax:1.0];
          [v76 nominalFrameRate];
          float v37 = v36;
          [(PIVideoStabilizeRenderJob *)self allowedCropFraction];
          double v39 = v38;
          v104 = (void *)*MEMORY[0x1E4F6F3E8];
          v40 = NSNumber;
          v41 = v75;
          *(float *)&double v42 = v37 * 60.0;
          v43 = [v40 numberWithFloat:v42];
          *(void *)buf = v43;
          v105 = (void *)*MEMORY[0x1E4F6F3F0];
          *(float *)&double v44 = v37 * 50.0;
          v45 = [NSNumber numberWithFloat:v44];
          *(void *)&buf[8] = v45;
          v106 = (void *)*MEMORY[0x1E4F6F3C0];
          v46 = [NSNumber numberWithDouble:v39];
          *(void *)&buf[16] = v46;
          v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v104 count:3];

          LODWORD(v94) = 0;
          uint64_t v48 = ICCalcCinematicL1Corrections();

          if (v48)
          {

            v49 = [MEMORY[0x1E4F1CA48] array];
            v50 = ICGetResultHomographies();
            CreateKeyframesFromHomographyDictionary(v50, (CMTimeEpoch)v73, (uint64_t)v72, v49, (long long *)&self->_stabCropRect.origin.x);
            v51 = (NSArray *)[v49 copy];
            keyframes = self->_keyframes;
            self->_keyframes = v51;

            self->_analysisType = v32;
            objc_storeStrong((id *)&self->_rawHomographies, v50);
            ICDestroyResult();
            ICDestroyResult();

            BOOL v33 = 1;
LABEL_33:
            objc_destroyWeak(&v90);
            objc_destroyWeak(location);

            goto LABEL_34;
          }
          v56 = (void *)MEMORY[0x1E4F7A438];
          v57 = [NSNumber numberWithInt:v94];
          *a3 = [v56 failureError:@"Failure in ICCalcCinematicL1Corrections" object:v57];

          ICDestroyResult();
        }
LABEL_32:
        BOOL v33 = 0;
        goto LABEL_33;
      }
      v53 = (void *)MEMORY[0x1E4F7A438];
      v54 = [NSNumber numberWithInt:v98];
      *a3 = [v53 failureError:@"Failure in ICAnalyzeInputMotion" object:v54];
    }
    else
    {
      *a3 = [MEMORY[0x1E4F7A438] failureError:@"No available analysis types were allowed" object:0];
    }

    goto LABEL_32;
  }
  return 0;
}

uint64_t __37__PIVideoStabilizeRenderJob_prepare___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained isCanceled];

  return v2;
}

- (id)scalePolicy
{
  return (id)[MEMORY[0x1E4F7A478] oneToOneScalePolicy];
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