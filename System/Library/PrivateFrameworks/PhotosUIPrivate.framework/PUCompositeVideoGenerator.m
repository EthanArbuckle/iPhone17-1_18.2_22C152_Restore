@interface PUCompositeVideoGenerator
+ ($0FD61D44AD30C1CDCD15B60AC4039C90)conformRange:(SEL)a3 inRange:(id *)a4;
+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)_overlapDurationBetweenAsset:(SEL)a3 andAsset:(id)a4;
+ (BOOL)canMergeAsset:(id)a3 withConsecutiveAsset:(id)a4;
- (AVAssetExportSession)exportSession;
- (BOOL)onlyAllowOverlappingAssets;
- (NSArray)assets;
- (NSError)error;
- (PUCompositeVideoGenerator)init;
- (PUCompositeVideoGenerator)initWithAssets:(id)a3 outputType:(int64_t)a4 onlyAllowOverlappingAssets:(BOOL)a5;
- (PUCompositeVideoGenerator)initWithAssets:(id)a3 outputType:(int64_t)a4 onlyAllowOverlappingAssets:(BOOL)a5 dataCache:(id)a6;
- (PUMergedLivePhotosVideo)playbackVideo;
- (int64_t)outputType;
- (int64_t)state;
- (void)_workQueue_finishWithError:(id)a3;
- (void)_workQueue_finishWithExportSession:(id)a3 error:(id)a4;
- (void)_workQueue_finishWithPlaybackVideo:(id)a3 error:(id)a4;
- (void)_workQueue_generateVideoWithAVAssets:(id)a3;
- (void)_workQueue_generateVideoWithSingleAssetExportSession:(id)a3;
- (void)_workQueue_generateVideoWithSingleAssetPlayerItem:(id)a3;
- (void)_workQueue_start;
- (void)setError:(id)a3;
- (void)setExportSession:(id)a3;
- (void)setPlaybackVideo:(id)a3;
- (void)setState:(int64_t)a3;
- (void)start;
@end

@implementation PUCompositeVideoGenerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_dataCache, 0);
  objc_storeStrong((id *)&self->_videoAssetsByAssetGroup, 0);
  objc_storeStrong((id *)&self->_stateQueue_error, 0);
  objc_storeStrong((id *)&self->_stateQueue_exportSession, 0);
  objc_storeStrong((id *)&self->_stateQueue_playbackVideo, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (BOOL)onlyAllowOverlappingAssets
{
  return self->_onlyAllowOverlappingAssets;
}

- (int64_t)outputType
{
  return self->_outputType;
}

- (NSArray)assets
{
  return self->_assets;
}

- (void)_workQueue_finishWithError:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  px_dispatch_on_main_queue();
}

uint64_t __56__PUCompositeVideoGenerator__workQueue_finishWithError___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setPlaybackVideo:0];
  [*(id *)(a1 + 32) setExportSession:0];
  [*(id *)(a1 + 32) setError:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);
  return [v2 setState:2];
}

- (void)_workQueue_finishWithExportSession:(id)a3 error:(id)a4
{
  id v5 = a3;
  id v8 = a4;
  id v6 = v8;
  id v7 = v5;
  px_dispatch_on_main_queue();
}

uint64_t __70__PUCompositeVideoGenerator__workQueue_finishWithExportSession_error___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setPlaybackVideo:0];
  [*(id *)(a1 + 32) setExportSession:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setError:*(void *)(a1 + 48)];
  v2 = *(void **)(a1 + 32);
  return [v2 setState:2];
}

- (void)_workQueue_finishWithPlaybackVideo:(id)a3 error:(id)a4
{
  id v5 = a3;
  id v8 = a4;
  id v6 = v8;
  id v7 = v5;
  px_dispatch_on_main_queue();
}

uint64_t __70__PUCompositeVideoGenerator__workQueue_finishWithPlaybackVideo_error___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setPlaybackVideo:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setExportSession:0];
  [*(id *)(a1 + 32) setError:*(void *)(a1 + 48)];
  v2 = *(void **)(a1 + 32);
  return [v2 setState:2];
}

- (void)_workQueue_generateVideoWithAVAssets:(id)a3
{
  uint64_t v215 = *MEMORY[0x1E4F143B8];
  id v165 = a3;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    v147 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v147, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUCompositeVideoGenerator.m", 362, @"%s must NOT be called on the main thread", "-[PUCompositeVideoGenerator _workQueue_generateVideoWithAVAssets:]");
  }
  id v5 = PLLivePhotoPlaybackGetLog();
  id v6 = [(PUCompositeVideoGenerator *)self assets];
  os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v5, v6);

  id v8 = v5;
  v9 = v8;
  os_signpost_id_t spid = v7;
  unint64_t v150 = v7 - 1;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(buf.a) = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "CompositeVideoGeneration", "", (uint8_t *)&buf, 2u);
  }
  v149 = v9;

  v10 = [(PUCompositeVideoGenerator *)self assets];
  uint64_t v11 = [v10 count];

  v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v11];
  v174 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v11];
  v156 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v11];
  v171 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v11];
  v162 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v11];
  id v13 = objc_alloc_init(MEMORY[0x1E4F16590]);
  uint64_t v160 = *MEMORY[0x1E4F15C18];
  v163 = objc_msgSend(v13, "addMutableTrackWithMediaType:preferredTrackID:");
  uint64_t v158 = *MEMORY[0x1E4F15BA8];
  v151 = objc_msgSend(v13, "addMutableTrackWithMediaType:preferredTrackID:");
  double v15 = *MEMORY[0x1E4F1DB30];
  double v14 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  long long v198 = 0u;
  long long v199 = 0u;
  long long v200 = 0u;
  long long v201 = 0u;
  id obj = [(PUCompositeVideoGenerator *)self assets];
  v166 = v12;
  v161 = self;
  v170 = v13;
  uint64_t v157 = [obj countByEnumeratingWithState:&v198 objects:v214 count:16];
  if (!v157)
  {
    v172 = 0;
    v173 = 0;
    goto LABEL_93;
  }
  v172 = 0;
  v173 = 0;
  uint64_t v159 = *(void *)v199;
  CMTimeFlags v152 = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 12);
  unint64_t v16 = 0x1E4F8C000uLL;
  CGFloat v153 = *(double *)(MEMORY[0x1E4F1F9F8] + 16);
  do
  {
    uint64_t v17 = 0;
    double v18 = v14;
    double v19 = v15;
    do
    {
      if (*(void *)v199 != v159) {
        objc_enumerationMutation(obj);
      }
      v20 = *(void **)(*((void *)&v198 + 1) + 8 * v17);
      uint64_t v21 = [v165 objectForKeyedSubscript:v20];
      if (!v21) {
        goto LABEL_92;
      }
      v22 = (void *)v21;
      v23 = [*(id *)(v16 + 3128) tracksWithMediaType:v160 forAsset:v21];
      v24 = [v23 firstObject];

      if (!v24)
      {
        v65 = PLLivePhotoPlaybackGetLog();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf.a) = 138412290;
          *(void *)((char *)&buf.a + 4) = v22;
          _os_log_impl(&dword_1AE9F8000, v65, OS_LOG_TYPE_ERROR, "Encountered an asset with no video track: %@", (uint8_t *)&buf, 0xCu);
        }

LABEL_92:
        double v14 = v18;
        double v15 = v19;
        goto LABEL_93;
      }
      v25 = [*(id *)(v16 + 3128) tracksWithMediaType:v158 forAsset:v22];
      v26 = [v25 firstObject];

      long long v196 = 0uLL;
      CGFloat v197 = 0.0;
      [v22 duration];
      long long v194 = 0uLL;
      CGFloat v195 = 0.0;
      v27 = [v12 lastObject];
      +[PUCompositeVideoGenerator _overlapDurationBetweenAsset:v27 andAsset:v20];

      memset(&v193, 0, sizeof(v193));
      if (v13) {
        [v13 duration];
      }
      else {
        memset(&lhs, 0, sizeof(lhs));
      }
      *(_OWORD *)&buf.a = v194;
      buf.CGFloat c = v195;
      CMTimeSubtract(&v192, &lhs, (CMTime *)&buf);
      if (v20) {
        [v20 photoIrisStillDisplayTime];
      }
      else {
        memset(&rhs, 0, sizeof(rhs));
      }
      CMTimeAdd(&v193, &v192, &rhs);
      objc_msgSend(v24, "px_transformedNaturalSize");
      double v29 = v28;
      double v31 = v30;
      memset(&buf, 0, sizeof(buf));
      long long v167 = *MEMORY[0x1E4F1FA48];
      *(_OWORD *)&start.a = *MEMORY[0x1E4F1FA48];
      CGFloat v32 = *(double *)(MEMORY[0x1E4F1FA48] + 16);
      start.CGFloat c = v32;
      *(_OWORD *)&duration.a = v196;
      duration.CGFloat c = v197;
      CMTimeRangeMake((CMTimeRange *)&buf, (CMTime *)&start, (CMTime *)&duration);
      double v14 = v31;
      double v15 = v29;
      if ([v12 count])
      {
        *(_OWORD *)&start.a = v194;
        start.CGFloat c = v195;
        *(_OWORD *)&duration.a = v167;
        duration.CGFloat c = v32;
        if (CMTimeCompare((CMTime *)&start, (CMTime *)&duration) >= 1)
        {
          memset(&duration, 0, 24);
          if (v173) {
            [v173 duration];
          }
          *(void *)&long long v208 = *MEMORY[0x1E4F1F9F8];
          DWORD2(v208) = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 8);
          objc_opt_class();
          v154 = v26;
          if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
          {
            id v33 = objc_alloc(MEMORY[0x1E4F912E8]);
            *(_OWORD *)&start.a = *(_OWORD *)&duration.a;
            start.CGFloat c = duration.c;
            v34 = (__CFString *)CMTimeCopyDescription(0, (CMTime *)&start);
            v212[0] = v34;
            v35 = [v173 URL];
            v212[1] = v35;
            v36 = [v22 URL];
            v212[2] = v36;
            v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v212 count:3];
            v38 = (void *)[v33 initWithObjects:v37];

            v39 = [(NSCache *)v161->_dataCache objectForKey:v38];
            v40 = v39;
            CGFloat c = v153;
            CMTimeFlags b_high = v152;
            if (v39)
            {
              [v39 CMTimeValue];
              *(CGFloat *)&long long v208 = start.a;
              CMTimeFlags b_high = HIDWORD(start.b);
              DWORD2(v208) = LODWORD(start.b);
              CGFloat c = start.c;
            }

            v12 = v166;
            if (b_high)
            {
LABEL_32:
              if (b_high)
              {
                *(void *)&time2.a = v208;
                *(void *)&time2.b = __PAIR64__(b_high, DWORD2(v208));
                time2.CGFloat c = c;
              }
              else
              {
                *(_OWORD *)&time2.a = v194;
                time2.CGFloat c = v195;
              }
              *(_OWORD *)&end.a = v196;
              end.CGFloat c = v197;
              CMTimeRangeFromTimeToTime((CMTimeRange *)&start, (CMTime *)&time2, (CMTime *)&end);
              CMTimeValue v210 = *(void *)&start.a;
              CMTimeScale b_low = LODWORD(start.b);
              self = v161;
              v26 = v154;
              if ((BYTE4(start.b) & 1) == 0
                || (BYTE4(start.tx) & 1) == 0
                || *(void *)&start.ty
                || (*(void *)&start.d & 0x8000000000000000) != 0)
              {
                if ([(PUCompositeVideoGenerator *)v161 onlyAllowOverlappingAssets])
                {
                  v45 = PLLivePhotoPlaybackGetLog();
                  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
                  {
                    LOWORD(start.a) = 0;
                    _os_log_impl(&dword_1AE9F8000, v45, OS_LOG_TYPE_DEBUG, "Adjusted time range is invalid. Overlapping LP generation will stop.", (uint8_t *)&start, 2u);
                  }

LABEL_43:
                  int v46 = 6;
                  double v14 = v18;
                  double v15 = v19;
                  id v13 = v170;
                  goto LABEL_71;
                }
              }
              else
              {
                *(void *)&buf.a = v210;
                LODWORD(buf.b) = b_low;
                HIDWORD(buf.b) = HIDWORD(start.b);
                *(_OWORD *)&buf.CGFloat c = *(_OWORD *)&start.c;
                *(_OWORD *)&buf.tx = *(unint64_t *)&start.tx;
              }

              goto LABEL_49;
            }
          }
          else
          {
            v38 = 0;
            CGFloat c = v153;
            CMTimeFlags b_high = v152;
            if (v152) {
              goto LABEL_32;
            }
          }
          *(_OWORD *)&time2.a = *(_OWORD *)&duration.a;
          time2.CGFloat c = duration.c;
          [MEMORY[0x1E4F8CE20] convertTime:&time2 fromAsset:v173 toAsset:v22];
          *(CGFloat *)&long long v208 = start.a;
          CMTimeFlags b_high = HIDWORD(start.b);
          DWORD2(v208) = LODWORD(start.b);
          CGFloat c = start.c;
          if (v38)
          {
            dataCache = v161->_dataCache;
            *(void *)&start.a = v208;
            LODWORD(start.b) = DWORD2(v208);
            v44 = [MEMORY[0x1E4F29238] valueWithCMTime:&start];
            [(NSCache *)dataCache setObject:v44 forKey:v38];

            v12 = v166;
          }
          goto LABEL_32;
        }
        if ([(PUCompositeVideoGenerator *)self onlyAllowOverlappingAssets]
          && [v12 count])
        {
          goto LABEL_43;
        }
LABEL_49:
        double v14 = v18;
        double v15 = v19;
      }
      long long v208 = 0uLL;
      CGFloat v209 = 0.0;
      if (v170) {
        [v170 duration];
      }
      memset(&start, 0, sizeof(start));
      [v24 timeRange];
      CGAffineTransform duration = buf;
      PXConformCMTimeRangeWithinRange();
      if ((BYTE4(start.b) & 1) == 0
        || (BYTE4(start.tx) & 1) == 0
        || *(void *)&start.ty
        || (*(void *)&start.d & 0x8000000000000000) != 0
        || (*(_OWORD *)&duration.a = *(_OWORD *)&start.d,
            duration.CGFloat c = start.ty,
            *(_OWORD *)&time2.a = v167,
            time2.CGFloat c = v32,
            CMTimeCompare((CMTime *)&duration, (CMTime *)&time2) < 1))
      {
        v47 = PLLivePhotoPlaybackGetLog();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(duration.a) = 138412290;
          *(void *)((char *)&duration.a + 4) = v24;
          _os_log_impl(&dword_1AE9F8000, v47, OS_LOG_TYPE_DEFAULT, "Skipping insertion of video track %@ into merged composition. Nothing to insert.", (uint8_t *)&duration, 0xCu);
        }
      }
      else
      {
        id v188 = v172;
        CGAffineTransform duration = start;
        *(_OWORD *)&time2.a = *MEMORY[0x1E4F1F9F8];
        time2.CGFloat c = v153;
        char v51 = [v163 insertTimeRange:&duration ofTrack:v24 atTime:&time2 error:&v188];
        id v52 = v188;

        if ((v51 & 1) == 0)
        {
          v60 = PLLivePhotoPlaybackGetLog();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
          {
            CGAffineTransform duration = start;
            v61 = PXCMTimeRangeDescription();
            LODWORD(duration.a) = 138412802;
            *(void *)((char *)&duration.a + 4) = v61;
            WORD2(duration.b) = 2112;
            *(void *)((char *)&duration.b + 6) = v24;
            HIWORD(duration.c) = 2112;
            *(void *)&duration.d = v52;
            _os_log_impl(&dword_1AE9F8000, v60, OS_LOG_TYPE_ERROR, "Unable to insert time range %@ of video track %@ into merged composition. Error: %@", (uint8_t *)&duration, 0x20u);
          }
          int v46 = 6;
          id v13 = v170;
          self = v161;
          goto LABEL_70;
        }
        v172 = v52;
        self = v161;
      }
      uint64_t v164 = v17;
      if (v26)
      {
        memset(&duration, 0, sizeof(duration));
        [v26 timeRange];
        CGAffineTransform time2 = buf;
        PXConformCMTimeRangeWithinRange();
        [v24 timeRange];
        CGAffineTransform end = duration;
        PXConformCMTimeRangeWithinRange();
        CGAffineTransform duration = time2;
        if ((BYTE4(time2.b) & 1) == 0
          || (BYTE4(duration.tx) & 1) == 0
          || *(void *)&duration.ty
          || (*(void *)&duration.d & 0x8000000000000000) != 0
          || (*(_OWORD *)&time2.a = *(_OWORD *)&duration.d,
              time2.CGFloat c = duration.ty,
              *(_OWORD *)&end.a = v167,
              end.CGFloat c = v32,
              CMTimeCompare((CMTime *)&time2, (CMTime *)&end) < 1))
        {
          v48 = self;
          v49 = PLLivePhotoPlaybackGetLog();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(time2.a) = 138412290;
            *(void *)((char *)&time2.a + 4) = v26;
            _os_log_impl(&dword_1AE9F8000, v49, OS_LOG_TYPE_DEFAULT, "Skipping insertion of audio track %@ into merged composition. Nothing to insert.", (uint8_t *)&time2, 0xCu);
          }

          id v13 = v170;
        }
        else
        {
          id v186 = v172;
          CGAffineTransform time2 = duration;
          *(_OWORD *)&end.a = *MEMORY[0x1E4F1F9F8];
          end.CGFloat c = v153;
          char v59 = [v151 insertTimeRange:&time2 ofTrack:v26 atTime:&end error:&v186];
          id v52 = v186;

          id v13 = v170;
          if ((v59 & 1) == 0)
          {
            v62 = PLLivePhotoPlaybackGetLog();
            if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
            {
              CGAffineTransform time2 = duration;
              v63 = PXCMTimeRangeDescription();
              LODWORD(time2.a) = 138412802;
              *(void *)((char *)&time2.a + 4) = v63;
              WORD2(time2.b) = 2112;
              *(void *)((char *)&time2.b + 6) = v26;
              HIWORD(time2.c) = 2112;
              *(void *)&time2.d = v52;
              _os_log_impl(&dword_1AE9F8000, v62, OS_LOG_TYPE_ERROR, "Unable to insert time range %@ of audio track %@ into merged composition. Error: %@", (uint8_t *)&time2, 0x20u);
            }
            int v46 = 6;
            goto LABEL_70;
          }
          v48 = self;
          v172 = v52;
        }
        v50 = v26;
      }
      else
      {
        v48 = self;
        v50 = 0;
        id v13 = v170;
      }
      [v12 addObject:v20];
      id v53 = v22;

      *(_OWORD *)&duration.a = v208;
      duration.CGFloat c = v209;
      v54 = [MEMORY[0x1E4F29238] valueWithCMTime:&duration];
      [v174 setObject:v54 forKeyedSubscript:v20];

      *(_OWORD *)&duration.a = *(_OWORD *)&v193.value;
      *(void *)&duration.CGFloat c = v193.epoch;
      v55 = [MEMORY[0x1E4F29238] valueWithCMTime:&duration];
      [v156 setObject:v55 forKeyedSubscript:v20];

      v56 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", v29, v31);
      [v162 setObject:v56 forKeyedSubscript:v20];

      memset(&duration, 0, sizeof(duration));
      objc_msgSend(v24, "px_preferredTransformBasedOnNaturalSize");
      CGFloat v57 = fmax(v15 / v29, v14 / v31);
      CGAffineTransformMakeScale(&t2, v57, v57);
      CGAffineTransform end = duration;
      CGAffineTransformConcat(&time2, &end, &t2);
      CGAffineTransform duration = time2;
      v58 = [MEMORY[0x1E4F29238] valueWithCGAffineTransform:&time2];
      [v171 setObject:v58 forKeyedSubscript:v20];

      int v46 = 0;
      v173 = v53;
      id v52 = v172;
      v26 = v50;
      self = v48;
      uint64_t v17 = v164;
LABEL_70:
      v172 = v52;
LABEL_71:

      if (v46) {
        goto LABEL_93;
      }
      ++v17;
      double v18 = v14;
      double v19 = v15;
      unint64_t v16 = 0x1E4F8C000;
    }
    while (v157 != v17);
    uint64_t v64 = [obj countByEnumeratingWithState:&v198 objects:v214 count:16];
    uint64_t v157 = v64;
  }
  while (v64);
LABEL_93:

  if (![v12 count] || v172)
  {
    v69 = PLLivePhotoPlaybackGetLog();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf.a) = 138412290;
      *(void *)((char *)&buf.a + 4) = v172;
      _os_log_impl(&dword_1AE9F8000, v69, OS_LOG_TYPE_ERROR, "Unable to generate merged live photo video with error: %@", (uint8_t *)&buf, 0xCu);
    }

    if ([(PUCompositeVideoGenerator *)self outputType]) {
      goto LABEL_180;
    }
    v70 = [(PUCompositeVideoGenerator *)self assets];
    v71 = [v70 firstObject];

    v72 = [v165 objectForKeyedSubscript:v71];
    v73 = [v156 objectForKeyedSubscript:v71];
    v74 = [(PUCompositeVideoGenerator *)self assets];
    v75 = [v74 firstObject];

    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
      id v76 = v75;
    }
    else {
      id v76 = 0;
    }
    v78 = v166;

    if (v76 && v72 && v73)
    {
      v79 = v73;
      v80 = PLLivePhotoPlaybackGetLog();
      if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
      {
        v81 = [(PUCompositeVideoGenerator *)v161 assets];
        v82 = [v81 firstObject];
        LODWORD(buf.a) = 138412290;
        *(void *)((char *)&buf.a + 4) = v82;
        _os_log_impl(&dword_1AE9F8000, v80, OS_LOG_TYPE_ERROR, "Attempting fallback to first asset: %@", (uint8_t *)&buf, 0xCu);

        v78 = v166;
      }

      double v83 = (double)(unint64_t)[v71 pixelWidth];
      double v84 = v83 / (double)(unint64_t)[v71 pixelHeight];
      v85 = [v78 firstObject];
      v86 = [v165 objectForKeyedSubscript:v85];
      v87 = v86;
      if (v86) {
        uint64_t v168 = objc_msgSend(v86, "pu_supportsVitality") ^ 1;
      }
      else {
        uint64_t v168 = 0;
      }

      v139 = [PUMergedLivePhotosVideo alloc];
      id v204 = v76;
      v140 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v204 count:1];
      *(_OWORD *)&buf.a = *MEMORY[0x1E4F1FA48];
      buf.CGFloat c = *(CGFloat *)(MEMORY[0x1E4F1FA48] + 16);
      [MEMORY[0x1E4F29238] valueWithCMTime:&buf];
      v142 = id v141 = v76;
      v203 = v142;
      v143 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v203 count:1];
      v73 = v79;
      v202 = v79;
      v144 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v202 count:1];
      v88 = [(PUMergedLivePhotosVideo *)v139 initWithAssets:v140 startTimes:v143 keyTimes:v144 videoAsset:v72 videoComposition:0 videoAspectRatio:v168 options:v84];

      id v76 = v141;
      [(PUCompositeVideoGenerator *)v161 _workQueue_finishWithPlaybackVideo:v88 error:0];
      id v13 = v170;
LABEL_177:

      goto LABEL_178;
    }
    if (v76)
    {
      v88 = &stru_1F06BE7B8;
      if (v72)
      {
LABEL_116:
        if (!v73)
        {
          uint64_t v90 = [(__CFString *)v88 stringByAppendingString:@" (key time is nil) "];

          v88 = (__CFString *)v90;
        }
        if (![(__CFString *)v88 length])
        {

          v88 = @"UNKNOWN";
        }
        v91 = PLLivePhotoPlaybackGetLog();
        if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
        {
          v92 = [(PUCompositeVideoGenerator *)v161 assets];
          v93 = [v92 firstObject];
          LODWORD(buf.a) = 138412546;
          *(void *)((char *)&buf.a + 4) = v93;
          WORD2(buf.b) = 2112;
          *(void *)((char *)&buf.b + 6) = v88;
          _os_log_impl(&dword_1AE9F8000, v91, OS_LOG_TYPE_ERROR, "Unable to fallback to first asset: %@. Reason: %@", (uint8_t *)&buf, 0x16u);

          id v13 = v170;
        }

        [(PUCompositeVideoGenerator *)v161 _workQueue_finishWithError:v172];
        goto LABEL_177;
      }
    }
    else
    {
      v88 = [&stru_1F06BE7B8 stringByAppendingString:@" (PHAsset is nil) "];
      if (v72) {
        goto LABEL_116;
      }
    }
    uint64_t v89 = [(__CFString *)v88 stringByAppendingString:@" (AVAsset is nil) "];

    v88 = (__CFString *)v89;
    goto LABEL_116;
  }
  if ((unint64_t)[v12 count] < 2)
  {
    BOOL v77 = 1;
  }
  else
  {
    v66 = [v12 lastObject];
    memset(&buf, 0, sizeof(buf));
    v67 = [v171 objectForKeyedSubscript:v66];
    v68 = v67;
    if (v67) {
      [v67 CGAffineTransformValue];
    }
    else {
      memset(&buf, 0, sizeof(buf));
    }

    v94 = [v162 objectForKeyedSubscript:v66];
    [v94 CGSizeValue];
    double v96 = v95;
    double v98 = v97;

    if ([v12 count] == 1)
    {
LABEL_135:
      BOOL v77 = 1;
    }
    else
    {
      uint64_t v99 = 0;
      while (1)
      {
        v100 = [v12 objectAtIndexedSubscript:v99];
        memset(&start, 0, sizeof(start));
        v101 = [v171 objectForKeyedSubscript:v100];
        v102 = v101;
        if (v101) {
          [v101 CGAffineTransformValue];
        }
        else {
          memset(&start, 0, sizeof(start));
        }

        v103 = [v162 objectForKeyedSubscript:v100];
        [v103 CGSizeValue];
        double v105 = v104;
        double v107 = v106;

        CGAffineTransform duration = start;
        CGAffineTransform time2 = buf;
        if (!CGAffineTransformEqualToTransform(&duration, &time2)) {
          break;
        }
        BOOL v77 = v107 == v98 && v105 == v96;

        v12 = v166;
        self = v161;
        if (!v77) {
          goto LABEL_137;
        }
        if (++v99 >= (unint64_t)([v166 count] - 1)) {
          goto LABEL_135;
        }
      }

      BOOL v77 = 0;
      v12 = v166;
      self = v161;
    }
LABEL_137:
  }
  v108 = PLLivePhotoPlaybackGetLog();
  if (os_log_type_enabled(v108, OS_LOG_TYPE_DEBUG))
  {
    v109 = @"false";
    if (v77) {
      v109 = @"true";
    }
    LODWORD(buf.a) = 138412290;
    *(void *)((char *)&buf.a + 4) = v109;
    _os_log_impl(&dword_1AE9F8000, v108, OS_LOG_TYPE_DEBUG, "Assets have same size and transform: %@", (uint8_t *)&buf, 0xCu);
  }

  if (v77)
  {
    v110 = [v12 firstObject];
    v111 = [v171 objectForKeyedSubscript:v110];
    v112 = v111;
    if (v111)
    {
      [v111 CGAffineTransformValue];
    }
    else
    {
      long long v183 = 0u;
      long long v184 = 0u;
      long long v182 = 0u;
    }
    v181[0] = v182;
    v181[1] = v183;
    v181[2] = v184;
    [v163 setPreferredTransform:v181];
    v71 = 0;
  }
  else
  {
    v110 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v12, "count"));
    if ([v12 count])
    {
      unint64_t v113 = 1;
      long long v169 = *MEMORY[0x1E4F1FA48];
      CGFloat v114 = *(double *)(MEMORY[0x1E4F1FA48] + 16);
      do
      {
        v115 = [v12 objectAtIndexedSubscript:v113 - 1];
        if (v113 >= [v12 count])
        {
          id v116 = 0;
        }
        else
        {
          id v116 = [v12 objectAtIndexedSubscript:v113];
        }
        v117 = [MEMORY[0x1E4F165C0] videoCompositionLayerInstructionWithAssetTrack:v163];
        memset(&buf, 0, sizeof(buf));
        v118 = [v171 objectForKeyedSubscript:v115];
        v119 = v118;
        if (v118) {
          [v118 CGAffineTransformValue];
        }
        else {
          memset(&buf, 0, sizeof(buf));
        }

        CGAffineTransform start = buf;
        *(_OWORD *)&duration.a = v169;
        duration.CGFloat c = v114;
        [v117 setTransform:&start atTime:&duration];
        memset(&start, 0, 24);
        v120 = [v174 objectForKeyedSubscript:v115];
        v121 = v120;
        if (v120) {
          [v120 CMTimeValue];
        }
        else {
          memset(&start, 0, 24);
        }

        memset(&duration, 0, 24);
        if (v116)
        {
          v122 = [v174 objectForKeyedSubscript:v116];
          v123 = v122;
          if (v122) {
            [v122 CMTimeValue];
          }
          else {
            memset(&duration, 0, 24);
          }
        }
        else
        {
          *(_OWORD *)&duration.a = *MEMORY[0x1E4F1FA10];
          duration.CGFloat c = *(CGFloat *)(MEMORY[0x1E4F1FA10] + 16);
        }
        *(_OWORD *)&end.a = *(_OWORD *)&start.a;
        end.CGFloat c = start.c;
        CMTimeConvertScale((CMTime *)&time2, (CMTime *)&end, 600, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
        *(_OWORD *)&start.a = *(_OWORD *)&time2.a;
        start.CGFloat c = time2.c;
        *(_OWORD *)&end.a = *(_OWORD *)&duration.a;
        end.CGFloat c = duration.c;
        CMTimeConvertScale((CMTime *)&time2, (CMTime *)&end, 600, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
        *(_OWORD *)&duration.a = *(_OWORD *)&time2.a;
        duration.CGFloat c = time2.c;
        v124 = [MEMORY[0x1E4F165B8] videoCompositionInstruction];
        v205 = v117;
        v125 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v205 count:1];
        [v124 setLayerInstructions:v125];

        *(_OWORD *)&time2.a = *(_OWORD *)&start.a;
        time2.CGFloat c = start.c;
        *(_OWORD *)&end.a = *(_OWORD *)&duration.a;
        end.CGFloat c = duration.c;
        CMTimeRangeFromTimeToTime(&v180, (CMTime *)&time2, (CMTime *)&end);
        CMTimeRange v179 = v180;
        [v124 setTimeRange:&v179];
        [v110 addObject:v124];

        v12 = v166;
      }
      while (v113++ < [v166 count]);
    }
    v71 = [MEMORY[0x1E4F165B0] videoComposition];
    objc_msgSend(v71, "setRenderSize:", v15, v14);
    CMTimeMake(&v178, 1, 30);
    CMTime v177 = v178;
    [v71 setFrameDuration:&v177];
    v112 = (void *)[v110 copy];
    [v71 setInstructions:v112];
    self = v161;
  }

  int64_t v127 = [(PUCompositeVideoGenerator *)self outputType];
  if (v127 == 1)
  {
    id v135 = objc_alloc(MEMORY[0x1E4F16360]);
    id v13 = v170;
    v136 = (void *)[v170 copy];
    v72 = (void *)[v135 initWithAsset:v136 presetName:*MEMORY[0x1E4F156E0]];

    v137 = (void *)[v71 copy];
    [v72 setVideoComposition:v137];

    [(PUCompositeVideoGenerator *)self _workQueue_finishWithExportSession:v72 error:0];
    goto LABEL_178;
  }
  if (v127)
  {
    id v13 = v170;
  }
  else
  {
    id v176 = v174;
    v128 = PXMap();
    id v175 = v156;
    v129 = PXMap();
    double v130 = fabs(v15 / v14);
    v131 = [v12 firstObject];
    v132 = [v165 objectForKeyedSubscript:v131];
    v133 = v132;
    if (v132) {
      uint64_t v134 = objc_msgSend(v132, "pu_supportsVitality") ^ 1;
    }
    else {
      uint64_t v134 = 0;
    }

    v138 = [[PUMergedLivePhotosVideo alloc] initWithAssets:v12 startTimes:v128 keyTimes:v129 videoAsset:v170 videoComposition:v71 videoAspectRatio:v134 options:v130];
    [(PUCompositeVideoGenerator *)v161 _workQueue_finishWithPlaybackVideo:v138 error:0];

    id v13 = v170;
    v72 = v176;
LABEL_178:

    v12 = v166;
  }

LABEL_180:
  v145 = v149;
  v146 = v145;
  if (v150 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v145))
  {
    LOWORD(buf.a) = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v146, OS_SIGNPOST_INTERVAL_END, spid, "CompositeVideoGeneration", "", (uint8_t *)&buf, 2u);
  }
}

uint64_t __66__PUCompositeVideoGenerator__workQueue_generateVideoWithAVAssets___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
}

uint64_t __66__PUCompositeVideoGenerator__workQueue_generateVideoWithAVAssets___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
}

- (void)_workQueue_generateVideoWithSingleAssetExportSession:(id)a3
{
  id v5 = (void *)MEMORY[0x1E4F29060];
  id v6 = a3;
  if ([v5 isMainThread])
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUCompositeVideoGenerator.m", 343, @"%s must NOT be called on the main thread", "-[PUCompositeVideoGenerator _workQueue_generateVideoWithSingleAssetExportSession:]");
  }
  os_signpost_id_t v7 = PLLivePhotoPlaybackGetLog();
  id v8 = [(PUCompositeVideoGenerator *)self assets];
  os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v7, v8);

  v10 = v7;
  uint64_t v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)CGAffineTransform buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "CompositeVideoGeneration", "", buf, 2u);
  }

  v12 = [v6 asset];
  id v13 = [v12 metadata];
  double v14 = PXFilter();
  [v6 setMetadata:v14];

  [(PUCompositeVideoGenerator *)self _workQueue_finishWithExportSession:v6 error:0];
  double v15 = v11;
  unint64_t v16 = v15;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)double v18 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v16, OS_SIGNPOST_INTERVAL_END, v9, "CompositeVideoGeneration", "", v18, 2u);
  }
}

uint64_t __82__PUCompositeVideoGenerator__workQueue_generateVideoWithSingleAssetExportSession___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 keySpace];
  if ([v3 isEqualToString:*MEMORY[0x1E4F15DF8]])
  {
    id v4 = [v2 key];
    uint64_t v5 = [v4 isEqual:*MEMORY[0x1E4F15E60]] ^ 1;
  }
  else
  {
    uint64_t v5 = 1;
  }

  return v5;
}

- (void)_workQueue_generateVideoWithSingleAssetPlayerItem:(id)a3
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    double v28 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUCompositeVideoGenerator.m", 326, @"%s must NOT be called on the main thread", "-[PUCompositeVideoGenerator _workQueue_generateVideoWithSingleAssetPlayerItem:]");
  }
  id v6 = PLLivePhotoPlaybackGetLog();
  os_signpost_id_t v7 = [(PUCompositeVideoGenerator *)self assets];
  os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v6, v7);

  os_signpost_id_t v9 = v6;
  v10 = v9;
  unint64_t v30 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)CGAffineTransform buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "CompositeVideoGeneration", "", buf, 2u);
  }
  os_signpost_id_t spid = v8;

  double v31 = self;
  uint64_t v11 = [(PUCompositeVideoGenerator *)self assets];
  v12 = [v11 objectAtIndexedSubscript:0];

  *(_OWORD *)CGAffineTransform buf = *MEMORY[0x1E4F1FA48];
  uint64_t v34 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  id v13 = [MEMORY[0x1E4F29238] valueWithCMTime:buf];
  v37[0] = v13;
  double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];

  double v15 = (void *)MEMORY[0x1E4F29238];
  if (v12) {
    [v12 photoIrisStillDisplayTime];
  }
  else {
    memset(v32, 0, sizeof(v32));
  }
  unint64_t v16 = [v15 valueWithCMTime:v32];
  v36 = v16;
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];

  double v18 = [v5 asset];
  double v19 = v18;
  if (v18) {
    uint64_t v20 = objc_msgSend(v18, "pu_supportsVitality") ^ 1;
  }
  else {
    uint64_t v20 = 0;
  }

  uint64_t v21 = [PUMergedLivePhotosVideo alloc];
  v35 = v12;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
  v23 = [v5 asset];
  v24 = [v5 videoComposition];
  [v12 aspectRatio];
  v25 = -[PUMergedLivePhotosVideo initWithAssets:startTimes:keyTimes:videoAsset:videoComposition:videoAspectRatio:options:](v21, "initWithAssets:startTimes:keyTimes:videoAsset:videoComposition:videoAspectRatio:options:", v22, v14, v17, v23, v24, v20);

  [(PUCompositeVideoGenerator *)v31 _workQueue_finishWithPlaybackVideo:v25 error:0];
  v26 = v10;
  v27 = v26;
  if (v30 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    *(_WORD *)CGAffineTransform buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v27, OS_SIGNPOST_INTERVAL_END, spid, "CompositeVideoGeneration", "", buf, 2u);
  }
}

- (void)_workQueue_start
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  if (![(PUCompositeVideoGenerator *)self state])
  {
    [(PUCompositeVideoGenerator *)self setState:1];
    v39 = self;
    objc_initWeak(&location, self);
    group = self->_videoAssetsByAssetGroup;
    ptr = [(PUCompositeVideoGenerator *)self assets];
    id v3 = PLLivePhotoPlaybackGetLog();
    id v4 = (char *)os_signpost_id_make_with_pointer(v3, ptr);
    id v5 = v3;
    id v6 = v5;
    os_signpost_id_t spid = v4;
    v36 = v5;
    if ((unint64_t)(v4 - 1) > 0xFFFFFFFFFFFFFFFDLL)
    {

      os_signpost_id_t v7 = v36;
      os_signpost_id_t v9 = v36;
    }
    else
    {
      if (os_signpost_enabled(v5))
      {
        *(_WORD *)CGAffineTransform buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v6, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v4, "CompositeVideoGenerationProcessing", "", buf, 2u);
      }

      os_signpost_id_t v7 = v36;
      os_signpost_id_t v8 = v36;
      if (os_signpost_enabled(v8))
      {
        *(_WORD *)CGAffineTransform buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v8, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v4, "CompositeVideoFetches", "", buf, 2u);
      }
    }

    id v40 = objc_alloc_init(MEMORY[0x1E4F39348]);
    [v40 setVideoComplementAllowed:1];
    [v40 setStreamingAllowed:0];
    [v40 setNetworkAccessAllowed:1];
    if ([ptr count] == 1)
    {
      uint64_t v10 = [(PUCompositeVideoGenerator *)v39 outputType];
      if (v10)
      {
        if (v10 == 1)
        {
          uint64_t v11 = [MEMORY[0x1E4F390D0] defaultManager];
          v12 = [ptr objectAtIndexedSubscript:0];
          v58[0] = MEMORY[0x1E4F143A8];
          v58[1] = 3221225472;
          v58[2] = __45__PUCompositeVideoGenerator__workQueue_start__block_invoke_216;
          v58[3] = &unk_1E5F2C938;
          v58[4] = v39;
          char v59 = v36;
          v60[1] = v4;
          objc_copyWeak(v60, &location);
          [v11 requestExportSessionForVideo:v12 options:v40 exportPreset:*MEMORY[0x1E4F15758] resultHandler:v58];

          objc_destroyWeak(v60);
        }
      }
      else
      {
        [v40 setDownloadIntent:3];
        [v40 setDownloadPriority:0];
        unint64_t v30 = [MEMORY[0x1E4F390D0] defaultManager];
        double v31 = [ptr objectAtIndexedSubscript:0];
        v61[0] = MEMORY[0x1E4F143A8];
        v61[1] = 3221225472;
        v61[2] = __45__PUCompositeVideoGenerator__workQueue_start__block_invoke;
        v61[3] = &unk_1E5F2C910;
        v61[4] = v39;
        v62 = v36;
        v63[1] = v4;
        objc_copyWeak(v63, &location);
        [v30 requestPlayerItemForVideo:v31 options:v40 resultHandler:v61];

        objc_destroyWeak(v63);
      }
    }
    else if ((unint64_t)[ptr count] < 2)
    {
      v27 = v36;
      double v28 = v27;
      if ((unint64_t)(v4 - 1) > 0xFFFFFFFFFFFFFFFDLL)
      {

        CGFloat v32 = v28;
      }
      else
      {
        if (os_signpost_enabled(v27))
        {
          *(_WORD *)CGAffineTransform buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v28, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v4, "CompositeVideoFetches", "", buf, 2u);
        }

        double v29 = v28;
        if (os_signpost_enabled(v29))
        {
          *(_WORD *)CGAffineTransform buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v29, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v4, "CompositeVideoGenerationProcessing", "", buf, 2u);
        }
      }

      id v33 = objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:debugDescription:", *MEMORY[0x1E4F91328], -1, @"Unable to generate merged live photo video because self.assets.count == 0");
      id v34 = objc_loadWeakRetained(&location);
      objc_msgSend(v34, "_workQueue_finishWithError:", v33);
    }
    else
    {
      if ([(PUCompositeVideoGenerator *)v39 outputType] == 1) {
        [v40 setDeliveryMode:1];
      }
      id v13 = objc_alloc(MEMORY[0x1E4F1CA60]);
      double v14 = [(PUCompositeVideoGenerator *)v39 assets];
      double v15 = objc_msgSend(v13, "initWithCapacity:", objc_msgSend(v14, "count"));

      id v16 = objc_alloc(MEMORY[0x1E4F1CA60]);
      uint64_t v17 = [(PUCompositeVideoGenerator *)v39 assets];
      double v18 = objc_msgSend(v16, "initWithCapacity:", objc_msgSend(v17, "count"));

      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id obj = ptr;
      uint64_t v19 = [obj countByEnumeratingWithState:&v54 objects:v66 count:16];
      if (v19)
      {
        uint64_t v20 = *(void *)v55;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v55 != v20) {
              objc_enumerationMutation(obj);
            }
            uint64_t v22 = *(void *)(*((void *)&v54 + 1) + 8 * i);
            dispatch_group_enter((dispatch_group_t)group);
            v23 = [MEMORY[0x1E4F390D0] defaultManager];
            v49[0] = MEMORY[0x1E4F143A8];
            v49[1] = 3221225472;
            v49[2] = __45__PUCompositeVideoGenerator__workQueue_start__block_invoke_220;
            v49[3] = &unk_1E5F2C988;
            v49[4] = v39;
            id v50 = v15;
            uint64_t v51 = v22;
            id v52 = v18;
            id v53 = group;
            [v23 requestAVAssetForVideo:v22 options:v40 resultHandler:v49];
          }
          uint64_t v19 = [obj countByEnumeratingWithState:&v54 objects:v66 count:16];
        }
        while (v19);
      }

      workQueue = v39->_workQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __45__PUCompositeVideoGenerator__workQueue_start__block_invoke_3;
      block[3] = &unk_1E5F2C9B0;
      v43 = v36;
      v44 = v39;
      v48[1] = spid;
      id v45 = v15;
      id v46 = obj;
      id v25 = v15;
      objc_copyWeak(v48, &location);
      id v47 = v18;
      id v26 = v18;
      dispatch_group_notify((dispatch_group_t)group, workQueue, block);

      objc_destroyWeak(v48);
    }

    objc_destroyWeak(&location);
  }
}

void __45__PUCompositeVideoGenerator__workQueue_start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  os_signpost_id_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 96);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__PUCompositeVideoGenerator__workQueue_start__block_invoke_2;
  block[3] = &unk_1E5F2C8E8;
  id v8 = *(id *)(a1 + 40);
  v15[1] = *(id *)(a1 + 56);
  id v12 = v8;
  id v13 = v5;
  id v9 = v5;
  objc_copyWeak(v15, (id *)(a1 + 48));
  id v14 = v6;
  id v10 = v6;
  dispatch_async(v7, block);

  objc_destroyWeak(v15);
}

void __45__PUCompositeVideoGenerator__workQueue_start__block_invoke_216(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  os_signpost_id_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 96);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__PUCompositeVideoGenerator__workQueue_start__block_invoke_2_217;
  block[3] = &unk_1E5F2C8E8;
  id v8 = *(id *)(a1 + 40);
  v15[1] = *(id *)(a1 + 56);
  id v12 = v8;
  id v13 = v5;
  id v9 = v5;
  objc_copyWeak(v15, (id *)(a1 + 48));
  id v14 = v6;
  id v10 = v6;
  dispatch_async(v7, block);

  objc_destroyWeak(v15);
}

void __45__PUCompositeVideoGenerator__workQueue_start__block_invoke_220(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id v8 = *(NSObject **)(*(void *)(a1 + 32) + 96);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__PUCompositeVideoGenerator__workQueue_start__block_invoke_2_221;
  block[3] = &unk_1E5F2C960;
  id v15 = v6;
  id v9 = *(id *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v11 = *(void **)(a1 + 56);
  id v16 = v9;
  uint64_t v17 = v10;
  id v18 = v11;
  id v19 = v7;
  id v12 = v7;
  id v13 = v6;
  dispatch_async(v8, block);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

void __45__PUCompositeVideoGenerator__workQueue_start__block_invoke_3(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 80);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)CGAffineTransform buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v3, OS_SIGNPOST_INTERVAL_END, v4, "CompositeVideoFetches", "", buf, 2u);
  }

  if ([*(id *)(a1 + 40) outputType] == 1)
  {
    uint64_t v5 = [*(id *)(a1 + 48) count];
    if (v5 == [*(id *)(a1 + 56) count]) {
      goto LABEL_10;
    }
  }
  if (![*(id *)(a1 + 40) outputType]
    && [*(id *)(a1 + 48) count]
    && (id v12 = *(void **)(a1 + 48),
        [*(id *)(a1 + 56) objectAtIndexedSubscript:0],
        id v13 = objc_claimAutoreleasedReturnValue(),
        [v12 objectForKeyedSubscript:v13],
        id v14 = objc_claimAutoreleasedReturnValue(),
        v14,
        v13,
        v14))
  {
LABEL_10:
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    id v11 = (id)[*(id *)(a1 + 48) copy];
    objc_msgSend(WeakRetained, "_workQueue_generateVideoWithAVAssets:", v11);
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v7 = *MEMORY[0x1E4F91328];
    id v8 = [*(id *)(a1 + 64) allValues];
    id v9 = [v8 firstObject];
    WeakRetained = objc_msgSend(v6, "px_errorWithDomain:code:underlyingError:debugDescription:", v7, -1, v9, @"Unable to generate merged live photo video because some or all of the assets can't be loaded.");

    id v11 = objc_loadWeakRetained((id *)(a1 + 72));
    objc_msgSend(v11, "_workQueue_finishWithError:", WeakRetained);
  }

  id v15 = *(id *)(a1 + 32);
  id v16 = v15;
  os_signpost_id_t v17 = *(void *)(a1 + 80);
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)id v18 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v16, OS_SIGNPOST_INTERVAL_END, v17, "CompositeVideoGenerationProcessing", "", v18, 2u);
  }
}

void __45__PUCompositeVideoGenerator__workQueue_start__block_invoke_2_221(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = *(void **)(a1 + 40);
    objc_msgSend(v2, "setObject:forKeyedSubscript:");
  }
  else
  {
    id v3 = [*(id *)(a1 + 64) objectForKeyedSubscript:*MEMORY[0x1E4F39698]];
    [*(id *)(a1 + 56) setObject:v3 forKeyedSubscript:*(void *)(a1 + 48)];
  }
}

void __45__PUCompositeVideoGenerator__workQueue_start__block_invoke_2_217(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 64);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)CGAffineTransform buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v3, OS_SIGNPOST_INTERVAL_END, v4, "CompositeVideoFetches", "", buf, 2u);
  }

  uint64_t v5 = *(void *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v7 = WeakRetained;
  if (v5)
  {
    objc_msgSend(WeakRetained, "_workQueue_generateVideoWithSingleAssetExportSession:", *(void *)(a1 + 40));
  }
  else
  {
    id v8 = [*(id *)(a1 + 48) objectForKeyedSubscript:*MEMORY[0x1E4F39698]];
    objc_msgSend(v7, "_workQueue_finishWithError:", v8);
  }
  id v9 = *(id *)(a1 + 32);
  uint64_t v10 = v9;
  os_signpost_id_t v11 = *(void *)(a1 + 64);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)id v12 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v10, OS_SIGNPOST_INTERVAL_END, v11, "CompositeVideoGenerationProcessing", "", v12, 2u);
  }
}

void __45__PUCompositeVideoGenerator__workQueue_start__block_invoke_2(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 64);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)CGAffineTransform buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v3, OS_SIGNPOST_INTERVAL_END, v4, "CompositeVideoFetches", "", buf, 2u);
  }

  uint64_t v5 = *(void *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v7 = WeakRetained;
  if (v5)
  {
    objc_msgSend(WeakRetained, "_workQueue_generateVideoWithSingleAssetPlayerItem:", *(void *)(a1 + 40));
  }
  else
  {
    id v8 = [*(id *)(a1 + 48) objectForKeyedSubscript:*MEMORY[0x1E4F39698]];
    objc_msgSend(v7, "_workQueue_finishWithError:", v8);
  }
  id v9 = *(id *)(a1 + 32);
  uint64_t v10 = v9;
  os_signpost_id_t v11 = *(void *)(a1 + 64);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)id v12 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v10, OS_SIGNPOST_INTERVAL_END, v11, "CompositeVideoGenerationProcessing", "", v12, 2u);
  }
}

- (void)setError:(id)a3
{
  id v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__PUCompositeVideoGenerator_setError___block_invoke;
  v7[3] = &unk_1E5F2ECC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(stateQueue, v7);
}

void __38__PUCompositeVideoGenerator_setError___block_invoke(uint64_t a1)
{
}

- (void)setExportSession:(id)a3
{
  id v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__PUCompositeVideoGenerator_setExportSession___block_invoke;
  v7[3] = &unk_1E5F2ECC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(stateQueue, v7);
}

void __46__PUCompositeVideoGenerator_setExportSession___block_invoke(uint64_t a1)
{
}

- (void)setPlaybackVideo:(id)a3
{
  id v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__PUCompositeVideoGenerator_setPlaybackVideo___block_invoke;
  v7[3] = &unk_1E5F2ECC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(stateQueue, v7);
}

void __46__PUCompositeVideoGenerator_setPlaybackVideo___block_invoke(uint64_t a1)
{
}

- (void)setState:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __38__PUCompositeVideoGenerator_setState___block_invoke;
  v3[3] = &unk_1E5F2C8C0;
  v3[4] = self;
  v3[5] = a3;
  [(PUCompositeVideoGenerator *)self performChanges:v3];
}

void __38__PUCompositeVideoGenerator_setState___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 104);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__PUCompositeVideoGenerator_setState___block_invoke_2;
  block[3] = &unk_1E5F2C898;
  uint64_t v6 = *(void *)(a1 + 40);
  block[5] = &v8;
  block[6] = v6;
  void block[4] = v4;
  dispatch_sync(v5, block);
  if (*((unsigned char *)v9 + 24)) {
    [*(id *)(a1 + 32) signalChange:1];
  }
  _Block_object_dispose(&v8, 8);
}

void *__38__PUCompositeVideoGenerator_setState___block_invoke_2(void *result)
{
  *(unsigned char *)(*(void *)(result[5] + 8) + 24) = result[6] != *(void *)(result[4] + 112);
  *(void *)(result[4] + 112) = result[6];
  return result;
}

- (void)start
{
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__PUCompositeVideoGenerator_start__block_invoke;
  v4[3] = &unk_1E5F2E530;
  objc_copyWeak(&v5, &location);
  dispatch_async(workQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __34__PUCompositeVideoGenerator_start__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_workQueue_start");
}

- (NSError)error
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__92369;
  uint64_t v10 = __Block_byref_object_dispose__92370;
  id v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__PUCompositeVideoGenerator_error__block_invoke;
  v5[3] = &unk_1E5F2E200;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSError *)v3;
}

void __34__PUCompositeVideoGenerator_error__block_invoke(uint64_t a1)
{
}

- (AVAssetExportSession)exportSession
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__92369;
  uint64_t v10 = __Block_byref_object_dispose__92370;
  id v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__PUCompositeVideoGenerator_exportSession__block_invoke;
  v5[3] = &unk_1E5F2E200;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (AVAssetExportSession *)v3;
}

void __42__PUCompositeVideoGenerator_exportSession__block_invoke(uint64_t a1)
{
}

- (PUMergedLivePhotosVideo)playbackVideo
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__92369;
  uint64_t v10 = __Block_byref_object_dispose__92370;
  id v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__PUCompositeVideoGenerator_playbackVideo__block_invoke;
  v5[3] = &unk_1E5F2E200;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PUMergedLivePhotosVideo *)v3;
}

void __42__PUCompositeVideoGenerator_playbackVideo__block_invoke(uint64_t a1)
{
}

- (int64_t)state
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__PUCompositeVideoGenerator_state__block_invoke;
  v5[3] = &unk_1E5F2E200;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__PUCompositeVideoGenerator_state__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 112);
  return result;
}

- (PUCompositeVideoGenerator)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUCompositeVideoGenerator.m", 73, @"%s is not available as initializer", "-[PUCompositeVideoGenerator init]");

  abort();
}

- (PUCompositeVideoGenerator)initWithAssets:(id)a3 outputType:(int64_t)a4 onlyAllowOverlappingAssets:(BOOL)a5 dataCache:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v25.receiver = self;
  v25.super_class = (Class)PUCompositeVideoGenerator;
  id v12 = [(PUCompositeVideoGenerator *)&v25 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_dataCache, a6);
    v13->_outputType = a4;
    v13->_onlyAllowOverlappingAssets = a5;
    uint64_t v14 = [v10 copy];
    assets = v13->_assets;
    v13->_assets = (NSArray *)v14;

    dispatch_group_t v16 = dispatch_group_create();
    videoAssetsByAssetGroup = v13->_videoAssetsByAssetGroup;
    v13->_videoAssetsByAssetGroup = (OS_dispatch_group *)v16;

    id v18 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v19 = dispatch_queue_create("com.apple.photos.composite-video-generator.state", v18);
    stateQueue = v13->_stateQueue;
    v13->_stateQueue = (OS_dispatch_queue *)v19;

    uint64_t v21 = dispatch_queue_attr_make_with_autorelease_frequency(v18, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v22 = dispatch_queue_create("com.apple.photos.composite-video-generator.work", v21);
    workQueue = v13->_workQueue;
    v13->_workQueue = (OS_dispatch_queue *)v22;
  }
  return v13;
}

- (PUCompositeVideoGenerator)initWithAssets:(id)a3 outputType:(int64_t)a4 onlyAllowOverlappingAssets:(BOOL)a5
{
  return [(PUCompositeVideoGenerator *)self initWithAssets:a3 outputType:a4 onlyAllowOverlappingAssets:a5 dataCache:0];
}

+ ($0FD61D44AD30C1CDCD15B60AC4039C90)conformRange:(SEL)a3 inRange:(id *)a4
{
  if (a5->var0.var1 <= a5->var1.var1) {
    int32_t var1 = a5->var1.var1;
  }
  else {
    int32_t var1 = a5->var0.var1;
  }
  memset(&v19, 0, sizeof(v19));
  *(_OWORD *)&time.start.value = *(_OWORD *)&a4->var0.var0;
  time.start.epoch = a4->var0.var3;
  CMTimeConvertScale(&v19, &time.start, var1, kCMTimeRoundingMethod_RoundAwayFromZero);
  memset(&v18, 0, sizeof(v18));
  *(_OWORD *)&time.start.value = *(_OWORD *)&a4->var1.var0;
  time.start.epoch = a4->var1.var3;
  CMTimeConvertScale(&v18, &time.start, var1, kCMTimeRoundingMethod_RoundTowardZero);
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.int32_t var1 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  time.CGAffineTransform start = v19;
  duration.CGAffineTransform start = v18;
  CMTimeRangeMake((CMTimeRange *)retstr, &time.start, &duration.start);
  long long v9 = *(_OWORD *)&a5->var0.var3;
  *(_OWORD *)&time.start.value = *(_OWORD *)&a5->var0.var0;
  *(_OWORD *)&time.start.epoch = v9;
  *(_OWORD *)&time.duration.timescale = *(_OWORD *)&a5->var1.var1;
  long long v10 = *(_OWORD *)&retstr->var0.var3;
  *(_OWORD *)&duration.start.value = *(_OWORD *)&retstr->var0.var0;
  *(_OWORD *)&duration.start.epoch = v10;
  *(_OWORD *)&duration.duration.timescale = *(_OWORD *)&retstr->var1.var1;
  result = ($0FD61D44AD30C1CDCD15B60AC4039C90 *)CMTimeRangeContainsTimeRange(&time, &duration);
  if (!result)
  {
    long long v12 = *(_OWORD *)&a5->var0.var3;
    *(_OWORD *)&duration.start.value = *(_OWORD *)&a5->var0.var0;
    *(_OWORD *)&duration.start.epoch = v12;
    *(_OWORD *)&duration.duration.timescale = *(_OWORD *)&a5->var1.var1;
    long long v13 = *(_OWORD *)&retstr->var0.var3;
    *(_OWORD *)&v15.start.value = *(_OWORD *)&retstr->var0.var0;
    *(_OWORD *)&v15.start.epoch = v13;
    *(_OWORD *)&v15.duration.timescale = *(_OWORD *)&retstr->var1.var1;
    result = ($0FD61D44AD30C1CDCD15B60AC4039C90 *)CMTimeRangeGetIntersection(&time, &duration, &v15);
    long long v14 = *(_OWORD *)&time.start.epoch;
    *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&time.start.value;
    *(_OWORD *)&retstr->var0.var3 = v14;
    *(_OWORD *)&retstr->var1.int32_t var1 = *(_OWORD *)&time.duration.timescale;
  }
  return result;
}

+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)_overlapDurationBetweenAsset:(SEL)a3 andAsset:(id)a4
{
  id v7 = a4;
  id v8 = a5;
  long long v9 = v8;
  if (v7 && v8)
  {
    long long v10 = [v7 creationDate];
    id v11 = [v9 creationDate];
    if ([v7 playbackStyle] == 3)
    {
      uint64_t v12 = [v9 playbackStyle];
      uint64_t v13 = [v10 compare:v11];
      if (v12 == 3 && v13 == -1)
      {
        memset(&v35, 0, sizeof(v35));
        [v11 timeIntervalSinceDate:v10];
        CMTimeMakeWithSeconds(&v35, v14, 600);
        long long v33 = 0uLL;
        CMTimeEpoch v34 = 0;
        [v7 photoIrisStillDisplayTime];
        long long v31 = 0uLL;
        CMTimeEpoch v32 = 0;
        [v7 photoIrisVideoDuration];
        long long v29 = 0uLL;
        CMTimeEpoch v30 = 0;
        [v9 photoIrisStillDisplayTime];
        long long v27 = 0uLL;
        CMTimeEpoch v28 = 0;
        [v9 photoIrisVideoDuration];
        memset(&v26, 0, sizeof(v26));
        long long v19 = *MEMORY[0x1E4F1FA48];
        *(_OWORD *)&start.start.value = *MEMORY[0x1E4F1FA48];
        CMTimeEpoch v15 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
        start.start.epoch = v15;
        *(_OWORD *)&duration.start.value = v31;
        duration.start.epoch = v32;
        CMTimeRangeMake(&v26, &start.start, &duration.start);
        memset(&start, 0, sizeof(start));
        *(_OWORD *)&duration.start.value = v33;
        duration.start.epoch = v34;
        rhs.CMTimeRange start = v35;
        CMTimeAdd(&lhs, &duration.start, &rhs.start);
        *(_OWORD *)&duration.start.value = v29;
        duration.start.epoch = v30;
        CMTimeSubtract(&v24, &lhs, &duration.start);
        *(_OWORD *)&duration.start.value = v27;
        duration.start.epoch = v28;
        CMTimeRangeMake(&start, &v24, &duration.start);
        CMTimeRange rhs = v26;
        memset(&duration, 0, sizeof(duration));
        CMTimeRange otherRange = start;
        CMTimeRangeGetIntersection(&duration, &rhs, &otherRange);
        if ((duration.start.flags & 1) == 0
          || (duration.duration.flags & 1) == 0
          || duration.duration.epoch
          || duration.duration.value < 0)
        {
          *(_OWORD *)&retstr->var0 = v19;
          retstr->var3 = v15;
          goto LABEL_15;
        }
        p_CMTimeRange duration = &duration.duration;
LABEL_14:
        *(_OWORD *)&retstr->var0 = *(_OWORD *)&p_duration->value;
        retstr->var3 = p_duration->epoch;
LABEL_15:

        goto LABEL_16;
      }
    }
    else
    {
      [v10 compare:v11];
    }
    p_CMTimeRange duration = (CMTime *)MEMORY[0x1E4F1FA48];
    goto LABEL_14;
  }
  uint64_t v17 = MEMORY[0x1E4F1FA48];
  *(_OWORD *)&retstr->var0 = *MEMORY[0x1E4F1FA48];
  retstr->var3 = *(void *)(v17 + 16);
LABEL_16:

  return result;
}

+ (BOOL)canMergeAsset:(id)a3 withConsecutiveAsset:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  long long v9 = v8;
  BOOL v10 = 0;
  if (v7 && v8)
  {
    [a1 _overlapDurationBetweenAsset:v7 andAsset:v8];
    CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
    int32_t v11 = CMTimeCompare(&time1, &time2);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = v7;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        long long v29 = [MEMORY[0x1E4F28B00] currentHandler];
        CMTimeEpoch v30 = (objc_class *)objc_opt_class();
        long long v31 = NSStringFromClass(v30);
        CMTimeEpoch v32 = objc_msgSend(v12, "px_descriptionForAssertionMessage");
        [v29 handleFailureInMethod:a2, a1, @"PUCompositeVideoGenerator.m", 126, @"%@ should be an instance inheriting from %@, but it is %@", @"fromAsset", v31, v32 object file lineNumber description];
      }
      int v13 = [v12 hasAdjustments] ^ 1;
    }
    else
    {
      int v13 = 1;
    }
    objc_opt_class();
    int isKindOfClass = objc_opt_isKindOfClass();
    int v15 = (isKindOfClass ^ 1) & v13;
    if (((isKindOfClass ^ 1) & 1) == 0 && v13)
    {
      id v16 = v9;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        long long v33 = [MEMORY[0x1E4F28B00] currentHandler];
        CMTimeEpoch v34 = (objc_class *)objc_opt_class();
        CMTime v35 = NSStringFromClass(v34);
        v36 = objc_msgSend(v16, "px_descriptionForAssertionMessage");
        [v33 handleFailureInMethod:a2, a1, @"PUCompositeVideoGenerator.m", 130, @"%@ should be an instance inheriting from %@, but it is %@", @"toAsset", v35, v36 object file lineNumber description];
      }
      int v15 = [v16 hasAdjustments] ^ 1;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v17 = v9;
    }
    else {
      uint64_t v17 = 0;
    }
    unint64_t v18 = v17;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      long long v19 = v7;
    }
    else {
      long long v19 = 0;
    }
    unint64_t v20 = v19;
    if (v18 | v20)
    {
      [(id)v18 fetchPropertySetsIfNeeded];
      [(id)v20 fetchPropertySetsIfNeeded];
      if (v15)
      {
        uint64_t v21 = [(id)v18 photosInfoPanelExtendedProperties];
        dispatch_queue_t v22 = [v21 semanticStylePreset];
        v23 = [(id)v20 photosInfoPanelExtendedProperties];
        CMTime v24 = [v23 semanticStylePreset];
        if (v22 == v24) {
          LOBYTE(v15) = 1;
        }
        else {
          LOBYTE(v15) = [v22 isEqual:v24];
        }
      }
    }
    int v25 = [v7 canPlayPhotoIris];
    if (v25) {
      LOBYTE(v25) = [v9 canPlayPhotoIris];
    }
    if (v11 <= 0)
    {
      CMTimeRange v26 = PLLivePhotoPlaybackGetLog();
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_38;
      }
      LOWORD(time2.value) = 0;
      long long v27 = "\tAssets do not overlap.";
    }
    else
    {
      if (v15)
      {
        if (v25)
        {
          BOOL v10 = 1;
LABEL_39:

          goto LABEL_40;
        }
        CMTimeRange v26 = PLLivePhotoPlaybackGetLog();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(time2.value) = 0;
          long long v27 = "\tAssets are not both Live Photos.";
          goto LABEL_37;
        }
LABEL_38:

        BOOL v10 = 0;
        goto LABEL_39;
      }
      CMTimeRange v26 = PLLivePhotoPlaybackGetLog();
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_38;
      }
      LOWORD(time2.value) = 0;
      long long v27 = "\tAssets have adjustments.";
    }
LABEL_37:
    _os_log_impl(&dword_1AE9F8000, v26, OS_LOG_TYPE_DEFAULT, v27, (uint8_t *)&time2, 2u);
    goto LABEL_38;
  }
LABEL_40:

  return v10;
}

@end