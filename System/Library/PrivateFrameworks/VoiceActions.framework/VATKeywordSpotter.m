@interface VATKeywordSpotter
+ (id)pronounciationsFor:(id)a3 wordSeparator:(id)a4;
+ (id)pronounciationsFor:(id)a3 wordSeparator:(id)a4 prefixWithPhrase:(BOOL)a5;
- (BOOL)_isDetectionValidForResult:(void *)a3 reason:(id *)a4;
- (BOOL)audioDebuggingEnabled;
- (BOOL)batchDecodeEnabled;
- (BOOL)duringKeywordSilenceCheckEnabled;
- (BOOL)isValidRecognizer;
- (BOOL)postKeywordSilenceCheckEnabled;
- (BOOL)preKeywordSilenceCheckEnabled;
- (BOOL)secondPassEnabled;
- (NSString)customSecondPassModelPath;
- (VATConfiguration)configuration;
- (VATKeywordSpotter)initWithConfig:(id)a3 keywords:(id)a4 delegate:(id)a5;
- (VATKeywordSpotter)initWithConfig:(id)a3 keywordsWithPhonemes:(id)a4 delegate:(id)a5;
- (VATKeywordSpotter)initWithConfig:(id)a3 keywordsWithPhonemes:(id)a4 delegate:(id)a5 silenceLookback:(int)a6 silenceExpect:(int)a7 batchDecode:(BOOL)a8 enableAudioDebugging:(BOOL)a9;
- (VATKeywordSpotter)initWithKeywords:(id)a3 delegate:(id)a4;
- (VATKeywordSpotter)initWithKeywordsWithPhonemes:(id)a3 delegate:(id)a4;
- (id).cxx_construct;
- (id)_handleAudioDebuggingForKeyword:(id)a3 result:(void *)a4 buffer:(id)a5;
- (id)_handleSecondPass:(id)a3 expectedKeyword:(id)a4 duration:(double *)a5 secondPassAudio:(id *)a6;
- (id)_replaceModelPathWithAbsolutePathForTest:(id)a3;
- (id)_thresholdsForAllPhrases;
- (id)init:(id)a3 delegate:(id)a4 silenceLookback:(int)a5 silenceExpect:(int)a6 batchDecode:(BOOL)a7 enableAudioDebugging:(BOOL)a8;
- (void)_acousticCallback:(id)a3 rows:(int64_t)a4 cols:(int64_t)a5;
- (void)_handleValidResult:(void *)a3;
- (void)_initializeDecoderForKeywordsWithPhonemes:(id)a3;
- (void)_postKeywordSilenceProcessingWithResults:(id)a3 rows:(int64_t)a4 cols:(int64_t)a5;
- (void)addAudioSamples:(const void *)a3 count:(int)a4;
- (void)addAudioSamples:(const void *)a3 count:(int)a4 isFloat:(BOOL)a5;
- (void)addAudioSamples:(const void *)a3 count:(int)a4 isFloat:(BOOL)a5 filePath:(id)a6 byteCount:(int64_t)a7 currentDuration:(double)a8;
- (void)addAudioSamples:(const void *)a3 length:(int)a4;
- (void)dealloc;
- (void)setAudioDebuggingEnabled:(BOOL)a3;
- (void)setBatchDecodeEnabled:(BOOL)a3;
- (void)setConfiguration:(id)a3;
- (void)setCustomSecondPassModelPath:(id)a3;
- (void)setDuringKeywordSilenceCheckEnabled:(BOOL)a3;
- (void)setPostKeywordSilenceCheckEnabled:(BOOL)a3;
- (void)setPreKeywordSilenceCheckEnabled:(BOOL)a3;
- (void)setSecondPassEnabled:(BOOL)a3;
- (void)setSecondPassEnabled:(BOOL)a3 customAssetPath:(id)a4;
- (void)setStreamingMode:(BOOL)a3;
- (void)start;
- (void)stop;
- (void)updateWithKeywords:(id)a3;
- (void)updateWithKeywordsWithPhonemes:(id)a3;
@end

@implementation VATKeywordSpotter

- (void)setSecondPassEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(VATKeywordSpotter *)self configuration];
  v6 = [v5 runtime];
  int v7 = [v6 secondPass];

  if (v7 != v3)
  {
    id v9 = [(VATKeywordSpotter *)self configuration];
    v8 = [v9 runtime];
    [v8 setSecondPass:v3];
  }
}

- (BOOL)secondPassEnabled
{
  v2 = [(VATKeywordSpotter *)self configuration];
  BOOL v3 = [v2 runtime];
  char v4 = [v3 secondPass];

  return v4;
}

- (void)setConfiguration:(id)a3
{
}

- (VATConfiguration)configuration
{
  return (VATConfiguration *)objc_getAssociatedObject(self, off_26A915FE0);
}

- (void)setCustomSecondPassModelPath:(id)a3
{
}

- (NSString)customSecondPassModelPath
{
  return (NSString *)objc_getAssociatedObject(self, &off_26A915FE8);
}

- (void)setSecondPassEnabled:(BOOL)a3 customAssetPath:(id)a4
{
  [(VATKeywordSpotter *)self setCustomSecondPassModelPath:a4];
  MEMORY[0x270F9A6D0](self, sel_setSecondPassEnabled_);
}

- (void)setBatchDecodeEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(VATKeywordSpotter *)self configuration];
  char v4 = [v5 runtime];
  [v4 setBatchDecode:v3];
}

- (BOOL)batchDecodeEnabled
{
  v2 = [(VATKeywordSpotter *)self configuration];
  BOOL v3 = [v2 runtime];
  char v4 = [v3 batchDecode];

  return v4;
}

- (void)setAudioDebuggingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(VATKeywordSpotter *)self configuration];
  char v4 = [v5 runtime];
  [v4 setAudioDebug:v3];
}

- (BOOL)audioDebuggingEnabled
{
  v2 = [(VATKeywordSpotter *)self configuration];
  BOOL v3 = [v2 runtime];
  char v4 = [v3 audioDebug];

  return v4;
}

- (BOOL)isValidRecognizer
{
  return 0;
}

- (id)_handleSecondPass:(id)a3 expectedKeyword:(id)a4 duration:(double *)a5 secondPassAudio:(id *)a6
{
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  *a6 = (id)[0 copy];
  *a5 = 0.0;
  return v8;
}

- (id).cxx_construct
{
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_DWORD *)self + 20) = 1065353216;
  *((void *)self + 18) = 0;
  *((void *)self + 19) = 0;
  *((void *)self + 17) = 0;
  return self;
}

- (void).cxx_destruct
{
  p_keywordResults = &self->_keywordResults;
  sub_2614C3E0C((void ***)&p_keywordResults);
  objc_storeStrong((id *)&self->_filePath, 0);
  sub_2614C3E60((uint64_t)&self->_phraseThresholds);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->fe, 0);
  objc_storeStrong((id *)&self->_keywordsWithPhonemes, 0);
}

- (id)_thresholdsForAllPhrases
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  next = (char *)self->_phraseThresholds.__table_.__p1_.__value_.__next_;
  while (next)
  {
    id v5 = next + 16;
    if (next[39] < 0) {
      id v5 = (void *)*v5;
    }
    v6 = objc_msgSend(NSString, "stringWithCString:encoding:", v5, objc_msgSend(NSString, "defaultCStringEncoding"));
    LODWORD(v7) = *((_DWORD *)next + 10);
    id v8 = [NSNumber numberWithFloat:v7];
    [v3 setValue:v8 forKey:v6];

    next = *(char **)next;
  }
  return v3;
}

- (id)_replaceModelPathWithAbsolutePathForTest:(id)a3
{
  id v4 = a3;
  id v5 = [(FeatureExtractObjc *)self->fe configuration];
  [v5 _replaceModelPathWithCustomModelPathForTestWithPrefix:v4];

  v6 = [(FeatureExtractObjc *)self->fe configuration];
  double v7 = [v6 description];

  return v7;
}

- (id)_handleAudioDebuggingForKeyword:(id)a3 result:(void *)a4 buffer:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  fe = self->fe;
  v11 = [NSString stringWithFormat:@"%.2f", *((float *)a4 + 6)];
  v12 = [(FeatureExtractObjc *)fe saveAudioBufferToFileWithPcmBuffer:v9 keyword:v8 score:v11 duration:*((unsigned int *)a4 + 13)];

  return v12;
}

- (void)_handleValidResult:(void *)a3
{
  uint64_t v108 = *MEMORY[0x263EF8340];
  id v3 = *(void **)a3;
  if (*(char *)(*(void *)a3 + 23) < 0) {
    id v3 = (void *)*v3;
  }
  v90 = objc_msgSend(NSString, "stringWithCString:encoding:", v3, objc_msgSend(NSString, "defaultCStringEncoding"));
  double v100 = 0.0;
  int v4 = *(_DWORD *)(*(void *)a3 + 32);
  id v5 = [(VATKeywordSpotter *)self configuration];
  v6 = [v5 decoder];
  double v7 = [v6 audioCapture];
  int v8 = [v7 leftOfStartFrameOffset];

  int v9 = *(_DWORD *)(*(void *)a3 + 36);
  v10 = [(VATKeywordSpotter *)self configuration];
  v11 = [v10 decoder];
  v12 = [v11 audioCapture];
  int v13 = v9 + [v12 rightOfEndFrameOffset];

  uint64_t v14 = v13;
  uint64_t v99 = v13;
  v15 = [(VATKeywordSpotter *)self configuration];
  v16 = [v15 runtime];
  uint64_t v85 = (v4 - v8);
  if ([v16 secondPass])
  {
  }
  else
  {
    v17 = [(VATKeywordSpotter *)self configuration];
    v18 = [v17 runtime];
    int v19 = [v18 audioDebug];

    if (!v19)
    {
      v88 = 0;
LABEL_44:
      id obj = 0;
      v87 = 0;
      goto LABEL_45;
    }
  }
  v87 = [(FeatureExtractObjc *)self->fe audioForKeywordWithStartFrame:(int)v85 endFrame:v14 actualEndFrame:&v99];
  v20 = [(VATKeywordSpotter *)self configuration];
  v21 = [v20 runtime];
  char v22 = [v21 secondPass];

  if (v87) {
    char v23 = v22;
  }
  else {
    char v23 = 1;
  }
  if ((v23 & 1) != 0
    || ([(VATKeywordSpotter *)self configuration],
        v24 = objc_claimAutoreleasedReturnValue(),
        [v24 runtime],
        v25 = objc_claimAutoreleasedReturnValue(),
        int v26 = [v25 audioDebug],
        v25,
        v24,
        !v26))
  {
    v88 = 0;
  }
  else
  {
    uint64_t v27 = [(VATKeywordSpotter *)self _handleAudioDebuggingForKeyword:v90 result:*(void *)a3 buffer:v87];
    v28 = _VATLoggingFacility(kVATLogCategoryFramework);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v102 = v27;
      _os_log_impl(&dword_2613B8000, v28, OS_LOG_TYPE_INFO, "audio %@", buf, 0xCu);
    }

    v88 = (void *)v27;
  }
  v29 = [(VATKeywordSpotter *)self configuration];
  v30 = [v29 runtime];
  int v31 = [v30 secondPass];

  if (!v31)
  {
    id obj = 0;
LABEL_45:
    v55 = 0;
    goto LABEL_46;
  }
  if (!v87)
  {
    v54 = _VATLoggingFacility(kVATLogCategoryFramework);
    if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2613B8000, v54, OS_LOG_TYPE_INFO, "No audio for second pass", buf, 2u);
    }

    goto LABEL_44;
  }
  id v98 = 0;
  v82 = [(VATKeywordSpotter *)self _handleSecondPass:v87 expectedKeyword:v90 duration:&v100 secondPassAudio:&v98];
  id v84 = v98;
  if (v84)
  {
    v32 = [(VATKeywordSpotter *)self configuration];
    v33 = [v32 runtime];
    int v34 = [v33 audioDebug];

    if (v34)
    {
      v35 = (void *)[objc_alloc(MEMORY[0x263EF9388]) initWithStreamDescription:&unk_2614DF930];
      v36 = objc_msgSend(objc_alloc(MEMORY[0x263EF93B0]), "initWithPCMFormat:frameCapacity:", v35, objc_msgSend(v84, "length")/ *(_DWORD *)(objc_msgSend(v35, "streamDescription") + 24));
      objc_msgSend(v36, "setFrameLength:", objc_msgSend(v36, "frameCapacity"));
      int v37 = [v36 frameCapacity];
      *(_DWORD *)([v36 mutableAudioBufferList] + 12) = v37;
      memcpy(*(void **)([v36 mutableAudioBufferList] + 16), (const void *)objc_msgSend(v84, "bytes"), 2 * objc_msgSend(v36, "frameCapacity"));
      uint64_t v38 = [(VATKeywordSpotter *)self _handleAudioDebuggingForKeyword:v90 result:*(void *)a3 buffer:v36];

      v39 = _VATLoggingFacility(kVATLogCategoryFramework);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v102 = v38;
        _os_log_impl(&dword_2613B8000, v39, OS_LOG_TYPE_INFO, "audio %@", buf, 0xCu);
      }

      v88 = (void *)v38;
    }
  }
  v83 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"_[0-9]+$" options:0 error:0];
  v81 = objc_msgSend(v83, "stringByReplacingMatchesInString:options:range:withTemplate:", v90, 0, 0, objc_msgSend(v90, "length"), &stru_270D59F58);
  v40 = [v81 lowercaseString];
  v41 = [v40 stringByReplacingOccurrencesOfString:@"_" withString:&stru_270D59F58];

  v93 = [v41 stringByReplacingOccurrencesOfString:@" " withString:&stru_270D59F58];

  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  id obj = v82;
  uint64_t v42 = [obj countByEnumeratingWithState:&v94 objects:v107 count:16];
  if (v42)
  {
    char v43 = 0;
    v92 = 0;
    uint64_t v44 = *(void *)v95;
    do
    {
      for (uint64_t i = 0; i != v42; ++i)
      {
        if (*(void *)v95 != v44) {
          objc_enumerationMutation(obj);
        }
        v46 = *(void **)(*((void *)&v94 + 1) + 8 * i);
        v47 = [v46 lowercaseString];
        v48 = [v47 stringByReplacingOccurrencesOfString:@" " withString:&stru_270D59F58];

        v49 = _VATLoggingFacility(kVATLogCategoryFramework);
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
        {
          int v52 = [v48 hasPrefix:v93];
          *(_DWORD *)buf = 138412802;
          uint64_t v102 = (uint64_t)v93;
          __int16 v103 = 2112;
          v104 = v48;
          __int16 v105 = 1024;
          int v106 = v52;
          _os_log_debug_impl(&dword_2613B8000, v49, OS_LOG_TYPE_DEBUG, "\"%@\" is prefix of \"%@\" = %d", buf, 0x1Cu);
        }

        if ([v48 hasPrefix:v93])
        {
          id v50 = v46;

          v51 = _VATLoggingFacility(kVATLogCategoryFramework);
          char v43 = 1;
          if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v102 = (uint64_t)v50;
            __int16 v103 = 2112;
            v104 = v90;
            _os_log_impl(&dword_2613B8000, v51, OS_LOG_TYPE_INFO, "Second pass \"%@\" matches keyword \"%@\"", buf, 0x16u);
          }
          v92 = v50;
        }
        else
        {
          v51 = _VATLoggingFacility(kVATLogCategoryFramework);
          if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v102 = (uint64_t)v46;
            __int16 v103 = 2112;
            v104 = v90;
            _os_log_impl(&dword_2613B8000, v51, OS_LOG_TYPE_INFO, "Second pass \"%@\" doesn't match keyword \"%@\"", buf, 0x16u);
          }
        }
      }
      uint64_t v42 = [obj countByEnumeratingWithState:&v94 objects:v107 count:16];
    }
    while (v42);

    if (v43)
    {
      char v53 = 0;
      goto LABEL_64;
    }
    v73 = v92;
  }
  else
  {

    v73 = 0;
  }
  v92 = v73;
  v74 = _VATLoggingFacility(kVATLogCategoryFramework);
  if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
  {
    v75 = [obj componentsJoinedByString:@","];
    *(_DWORD *)buf = 138412546;
    uint64_t v102 = (uint64_t)v75;
    __int16 v103 = 2112;
    v104 = v90;
    _os_log_impl(&dword_2613B8000, v74, OS_LOG_TYPE_INFO, "Second pass \"%@\" doesn't match keyword \"%@\"", buf, 0x16u);
  }
  if (objc_opt_respondsToSelector())
  {
    v76 = self->_delegate;
    v77 = [obj componentsJoinedByString:@","];
    v78 = NSString;
    v79 = [obj componentsJoinedByString:@","];
    v80 = [v78 stringWithFormat:@"\"%@\" vs \"%@\" mismatch", v90, v79];
    [(VATKeywordSpotterDelegate *)v76 keywordDiscarded:v90 failedPreSilence:0 failedDuringSilence:0 failedPostSilence:0 failedSecondPass:1 secondPassResult:v77 reason:v80 audioURL:v88];
  }
  char v53 = 1;
LABEL_64:

  v55 = v92;
  if (v53) {
    goto LABEL_65;
  }
LABEL_46:
  if (objc_opt_respondsToSelector())
  {
    v56 = self->_delegate;
    v57 = [VATKeywordSpotterResult alloc];
    LODWORD(v58) = *(_DWORD *)(*(void *)a3 + 24);
    LODWORD(v59) = *(_DWORD *)(*(void *)a3 + 56);
    v60 = [(VATKeywordSpotterResult *)v57 initWithKeyword:v90 cost:*(unsigned int *)(*(void *)a3 + 32) threshold:*(unsigned int *)(*(void *)a3 + 36) start:*(unsigned int *)(*(void *)a3 + 52) end:v58 duration:v59];
    [(VATKeywordSpotterResult *)v60 setAudioFileURL:v88];
    v61 = [(VATKeywordSpotter *)self configuration];
    v62 = [v61 runtime];
    int v63 = [v62 secondPass];

    if (v63)
    {
      [(VATKeywordSpotterResult *)v60 setSecondPassResult:v55];
      [(VATKeywordSpotterResult *)v60 setSecondPassDuration:v100];
    }
    v64 = [(VATKeywordSpotter *)self configuration];
    v65 = [v64 runtime];
    if ([v65 secondPass])
    {
    }
    else
    {
      v70 = [(VATKeywordSpotter *)self configuration];
      v71 = [v70 runtime];
      int v72 = [v71 audioDebug];

      if (!v72)
      {
LABEL_56:
        [(VATKeywordSpotterDelegate *)v56 keywordSpotted:v60 nbestResults:0 filePath:self->_filePath fileByteCount:self->_fileByteCount fileDuration:self->_fileCurrentDuration];

        goto LABEL_65;
      }
    }
    [(VATKeywordSpotterResult *)v60 setAudioStart:v85];
    [(VATKeywordSpotterResult *)v60 setAudioEnd:v99];
    -[VATKeywordSpotterResult setAudioDuration:](v60, "setAudioDuration:", (double)[v87 frameLength] / 16000.0);
    goto LABEL_56;
  }
  char v66 = objc_opt_respondsToSelector();
  delegate = self->_delegate;
  uint64_t v68 = *(void *)a3;
  double v69 = *(float *)(*(void *)a3 + 24);
  if (v66) {
    [(VATKeywordSpotterDelegate *)delegate keywordSpotted:v90 cost:*(unsigned int *)(v68 + 32) threshold:*(unsigned int *)(v68 + 36) start:v69 end:*(float *)(v68 + 56)];
  }
  else {
    [(VATKeywordSpotterDelegate *)delegate keywordSpotted:v90 cost:*(unsigned int *)(v68 + 32) start:*(unsigned int *)(v68 + 36) end:v69];
  }
LABEL_65:
}

- (BOOL)_isDetectionValidForResult:(void *)a3 reason:(id *)a4
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  BOOL v74 = [(VATKeywordSpotter *)self preKeywordSilenceCheckEnabled];
  id v5 = [(VATKeywordSpotter *)self configuration];
  v6 = [v5 runtime];
  int v7 = [v6 duringKeywordSilence];

  int v8 = [(VATKeywordSpotter *)self configuration];
  int v9 = [v8 runtime];
  int v10 = [v9 duringKeywordSilence];

  if (v10)
  {
    floatFstDecoder = self->_floatFstDecoder;
    int v12 = *((_DWORD *)a3 + 8);
    uint64_t v13 = *((int *)a3 + 9);
    v71 = [(VATKeywordSpotter *)self configuration];
    uint64_t v14 = [v71 decoder];
    v15 = [v14 duringKeywordSilence];
    [v15 minPercentageOfNonSilenceFrames];
    float v17 = v16;
    v18 = [(VATKeywordSpotter *)self configuration];
    int v19 = [v18 decoder];
    v20 = [v19 duringKeywordSilence];
    [v20 silenceProbability];
    uint64_t v22 = floatFstDecoder[8];
    LODWORD(v23) = v12 - v22;
    unint64_t v24 = v13 - v22;
    if (v24 >= (int)v23)
    {
      int v25 = 0;
      unint64_t v23 = (int)v23;
      do
      {
        if (*(float *)(*(void *)(floatFstDecoder[2] + (((floatFstDecoder[5] + v23) >> 7) & 0x1FFFFFFFFFFFFF8))
                      + 4 * ((floatFstDecoder[5] + v23) & 0x3FF)) >= v21)
          ++v25;
        ++v23;
      }
      while (v24 >= v23);
    }
    else
    {
      int v25 = 0;
    }
    float v27 = (float)(v13 - v12);
    int v28 = (int)((float)(v17 * v27) + 0.5);
    int v26 = v25 >= v28;

    if (a4 && v25 < v28)
    {
      v29 = NSString;
      int v72 = [(VATKeywordSpotter *)self configuration];
      v30 = [v72 decoder];
      int v31 = [v30 duringKeywordSilence];
      [v31 minPercentageOfNonSilenceFrames];
      objc_msgSend(v29, "stringWithFormat:", @"speechToSilence ratio %4.2f < %4.2f", (float)((float)v25 / v27), v32);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      int v26 = 0;
    }
  }
  else
  {
    int v26 = v7 ^ 1;
  }
  if ([(VATKeywordSpotter *)self preKeywordSilenceCheckEnabled])
  {
    int v68 = v26;
    v33 = self->_floatFstDecoder;
    unint64_t v34 = *((int *)a3 + 8);
    v75 = [(VATKeywordSpotter *)self configuration];
    v73 = [v75 decoder];
    v70 = [v73 preKeywordSilence];
    LODWORD(v35) = [v70 lookbackFrames];
    double v69 = [(VATKeywordSpotter *)self configuration];
    v36 = [v69 decoder];
    int v37 = [v36 preKeywordSilence];
    int v38 = [v37 minSilenceInLookbackFrames];
    v39 = [(VATKeywordSpotter *)self configuration];
    v40 = [v39 decoder];
    v41 = [v40 preKeywordSilence];
    [v41 silenceProbability];
    unint64_t v43 = v33[8];
    unint64_t v44 = v34 - v43;
    if (v34 <= v43)
    {
      uint64_t v47 = 0;
      int v46 = 1;
    }
    else
    {
      if ((int)v35 < 1)
      {
        int v45 = 0;
      }
      else
      {
        int v45 = 0;
        uint64_t v35 = v35;
        do
        {
          if (!v44) {
            break;
          }
          if (*(float *)(*(void *)(v33[2] + (((v44 + v33[5]) >> 7) & 0x1FFFFFFFFFFFFF8))
                        + 4 * ((v44 + v33[5]) & 0x3FF)) <= v42)
            ++v45;
          --v44;
          --v35;
        }
        while (v35);
      }
      uint64_t v47 = (v35 + v45);
      int v46 = (int)v47 >= v38;
    }

    if (a4 && (v46 & 1) == 0)
    {
      v48 = NSString;
      v76 = [(VATKeywordSpotter *)self configuration];
      v49 = [v76 decoder];
      id v50 = [v49 preKeywordSilence];
      uint64_t v51 = [v50 minSilenceInLookbackFrames];
      if ([*a4 length]) {
        int v52 = (__CFString *)*a4;
      }
      else {
        int v52 = &stru_270D59F58;
      }
      *a4 = [v48 stringWithFormat:@"pre-keyword silence frames %d < %ld. %@", v47, v51, v52];
    }
    int v26 = v68;
  }
  else
  {
    int v46 = !v74;
  }
  if (((v46 ^ 1) & 1) != 0 || v26 != 1)
  {
    if (*((char *)a3 + 23) >= 0) {
      char v53 = a3;
    }
    else {
      char v53 = *(void **)a3;
    }
    v54 = objc_msgSend(NSString, "stringWithCString:encoding:", v53, objc_msgSend(NSString, "defaultCStringEncoding"));
    v55 = [(VATKeywordSpotter *)self configuration];
    v56 = [v55 runtime];
    int v57 = [v56 audioDebug];

    if (v57)
    {
      uint64_t v58 = *((int *)a3 + 8);
      *(void *)buf = *((int *)a3 + 9);
      double v59 = -[FeatureExtractObjc audioForKeywordWithStartFrame:endFrame:actualEndFrame:](self->fe, "audioForKeywordWithStartFrame:endFrame:actualEndFrame:", v58);
      if (v59
        && ([(VATKeywordSpotter *)self configuration],
            v60 = objc_claimAutoreleasedReturnValue(),
            [v60 runtime],
            v61 = objc_claimAutoreleasedReturnValue(),
            int v62 = [v61 audioDebug],
            v61,
            v60,
            v62))
      {
        int v63 = [(VATKeywordSpotter *)self _handleAudioDebuggingForKeyword:v54 result:a3 buffer:v59];
      }
      else
      {
        int v63 = 0;
      }
    }
    else
    {
      int v63 = 0;
    }
    v64 = _VATLoggingFacility(kVATLogCategoryFramework);
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
    {
      int v66 = *((_DWORD *)a3 + 8);
      int v77 = *((_DWORD *)a3 + 9);
      id v79 = *a4;
      v67 = [v63 path];
      *(_DWORD *)buf = 138413314;
      *(void *)&uint8_t buf[4] = v54;
      __int16 v82 = 1024;
      int v83 = v66;
      __int16 v84 = 1024;
      int v85 = v77;
      __int16 v86 = 2112;
      id v87 = v79;
      __int16 v88 = 2112;
      v89 = v67;
      _os_log_debug_impl(&dword_2613B8000, v64, OS_LOG_TYPE_DEBUG, "Keyword \"%@\" [%d,%d] dismissed. %@, %@", buf, 0x2Cu);
    }
    if (objc_opt_respondsToSelector()) {
      [(VATKeywordSpotterDelegate *)self->_delegate keywordDiscarded:v54 failedPreSilence:v46 ^ 1u failedDuringSilence:v26 ^ 1u failedPostSilence:0 failedSecondPass:0 secondPassResult:0 reason:*a4 audioURL:v63];
    }
  }
  return v46 & v26;
}

- (void)_postKeywordSilenceProcessingWithResults:(id)a3 rows:(int64_t)a4 cols:(int64_t)a5
{
  uint64_t v107 = *MEMORY[0x263EF8340];
  id v96 = a3;
  uint64_t v8 = [v96 bytes];
  long long v97 = self;
  if (a4 < 1)
  {
    int v9 = 0;
    v15 = 0;
  }
  else
  {
    int v9 = 0;
    int v10 = 0;
    unint64_t v11 = 0;
    uint64_t v12 = 0;
    int64_t v13 = v8 + 4 * a5 - 4;
    do
    {
      int v14 = *(_DWORD *)(v13 + 4 * v12 * a5);
      if ((unint64_t)v10 >= v11)
      {
        uint64_t v16 = (v10 - v9) >> 2;
        unint64_t v17 = v16 + 1;
        if ((unint64_t)(v16 + 1) >> 62) {
          sub_2614C637C();
        }
        if ((uint64_t)(v11 - (void)v9) >> 1 > v17) {
          unint64_t v17 = (uint64_t)(v11 - (void)v9) >> 1;
        }
        if (v11 - (unint64_t)v9 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v18 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v18 = v17;
        }
        if (v18) {
          unint64_t v18 = (unint64_t)sub_2614C6394(v18);
        }
        else {
          uint64_t v19 = 0;
        }
        v20 = (char *)(v18 + 4 * v16);
        *(_DWORD *)v20 = v14;
        v15 = v20 + 4;
        while (v10 != v9)
        {
          int v21 = *((_DWORD *)v10 - 1);
          v10 -= 4;
          *((_DWORD *)v20 - 1) = v21;
          v20 -= 4;
        }
        unint64_t v11 = v18 + 4 * v19;
        if (v9) {
          operator delete(v9);
        }
        int v9 = v20;
      }
      else
      {
        *(_DWORD *)int v10 = v14;
        v15 = v10 + 4;
      }
      ++v12;
      int v10 = v15;
    }
    while (v12 != a4);
  }
  int v22 = v97->_frameCountSinceKeywordDetected + a4;
  v97->_int frameCountSinceKeywordDetected = v22;
  unsigned int v98 = 0;
  int v99 = -1;
  unint64_t v23 = [(VATKeywordSpotter *)v97 configuration];
  unint64_t v24 = [v23 decoder];
  int v25 = [v24 postKeywordSilence];
  uint64_t v26 = [v25 lookForwardFrames];

  if (v26 <= v22)
  {
    unint64_t v34 = [(VATKeywordSpotter *)v97 configuration];
    uint64_t v35 = [v34 decoder];
    v36 = [v35 postKeywordSilence];
    int v37 = [v36 lookForwardFrames];

    p_keywordResults = &v97->_keywordResults;
    int v38 = *((_DWORD *)v97->_keywordResults.__begin_ + 9);
    if (v38 <= 0) {
      int v39 = -(-v38 & 7);
    }
    else {
      int v39 = *((_DWORD *)v97->_keywordResults.__begin_ + 9) & 7;
    }
    int v40 = 15 - v39;
    if (v37 != 8) {
      int v40 = v37;
    }
    uint64_t v41 = v15 - v9;
    int v93 = v40;
    uint64_t floatFstDecoder = (uint64_t)v97->_floatFstDecoder;
    if (v15 == v9)
    {
      float v42 = 0;
      unint64_t v43 = 0;
    }
    else
    {
      if (v41 < 0) {
        sub_2614C637C();
      }
      float v42 = (char *)sub_2614C6394(v41 >> 2);
      memmove(v42, v9, v15 - v9);
      unint64_t v43 = &v42[4 * (v41 >> 2)];
    }
    __int16 v88 = [(VATKeywordSpotter *)v97 configuration];
    unint64_t v44 = [v88 decoder];
    int v45 = [v44 postKeywordSilence];
    [v45 silenceProbability];
    float v47 = v46;
    v48 = [(VATKeywordSpotter *)v97 configuration];
    v49 = [v48 decoder];
    id v50 = [v49 postKeywordSilence];
    BOOL v51 = sub_2614C63CC(floatFstDecoder, v38, v42, v43, v93, [v50 minSilenceFramesExpected], &v99, &v98, v47);

    if (v42) {
      operator delete(v42);
    }
    begin = p_keywordResults->__begin_;
    if (*((char *)p_keywordResults->__begin_ + 23) < 0) {
      begin = *(FstSpotterResults **)begin;
    }
    uint64_t v94 = objc_msgSend(NSString, "stringWithCString:encoding:", begin, objc_msgSend(NSString, "defaultCStringEncoding"));
    if (v51)
    {
      char v53 = _VATLoggingFacility(kVATLogCategoryFramework);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
      {
        v92 = [NSNumber numberWithInt:v98];
        v78 = NSNumber;
        id v79 = [(VATKeywordSpotter *)v97 configuration];
        v80 = [v79 decoder];
        v81 = [v80 postKeywordSilence];
        __int16 v82 = objc_msgSend(v78, "numberWithInteger:", objc_msgSend(v81, "minSilenceFramesExpected"));
        int v83 = NSNumber;
        __int16 v84 = [(VATKeywordSpotter *)v97 configuration];
        int v85 = [v84 decoder];
        __int16 v86 = [v85 postKeywordSilence];
        id v87 = objc_msgSend(v83, "numberWithInteger:", objc_msgSend(v86, "lookForwardFrames"));
        *(_DWORD *)buf = 138413058;
        *(void *)&uint8_t buf[4] = v94;
        __int16 v101 = 2112;
        uint64_t v102 = v92;
        __int16 v103 = 2112;
        v104 = v82;
        __int16 v105 = 2112;
        int v106 = v87;
        _os_log_debug_impl(&dword_2613B8000, v53, OS_LOG_TYPE_DEBUG, "Enough silence after keyword \"%@\", %@ > %@/%@", buf, 0x2Au);
      }
      v54 = v97;
      v55 = (uint64_t *)&v97->_keywordResults;
      [(VATKeywordSpotter *)v97 _handleValidResult:p_keywordResults];
    }
    else
    {
      v56 = [(VATKeywordSpotter *)v97 configuration];
      int v57 = [v56 runtime];
      int v58 = [v57 audioDebug];

      if (v58)
      {
        double v59 = v97->_keywordResults.__begin_;
        uint64_t v60 = *((int *)v59 + 8);
        *(void *)buf = *((int *)v59 + 9);
        v61 = -[FeatureExtractObjc audioForKeywordWithStartFrame:endFrame:actualEndFrame:](v97->fe, "audioForKeywordWithStartFrame:endFrame:actualEndFrame:", v60);
        v89 = [(VATKeywordSpotter *)v97 _handleAudioDebuggingForKeyword:v94 result:v97->_keywordResults.__begin_ buffer:v61];
      }
      else
      {
        v89 = 0;
      }
      int v62 = NSString;
      v91 = [NSNumber numberWithInt:v98];
      int v63 = NSNumber;
      v64 = [(VATKeywordSpotter *)v97 configuration];
      v65 = [v64 decoder];
      int v66 = [v65 postKeywordSilence];
      v67 = objc_msgSend(v63, "numberWithInteger:", objc_msgSend(v66, "minSilenceFramesExpected"));
      int v68 = NSNumber;
      double v69 = [(VATKeywordSpotter *)v97 configuration];
      v70 = [v69 decoder];
      v71 = [v70 postKeywordSilence];
      int v72 = objc_msgSend(v68, "numberWithInteger:", objc_msgSend(v71, "lookForwardFrames"));
      v73 = [v62 stringWithFormat:@"not enough silence after keyword %@ < %@/%@", v91, v67, v72];

      BOOL v74 = _VATLoggingFacility(kVATLogCategoryFramework);
      if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v94;
        __int16 v101 = 2112;
        uint64_t v102 = v73;
        _os_log_impl(&dword_2613B8000, v74, OS_LOG_TYPE_INFO, "Discarding keyword \"%@\", %@", buf, 0x16u);
      }

      if (objc_opt_respondsToSelector())
      {
        v75 = v97->_delegate;
        v76 = v97->_keywordResults.__begin_;
        if (*((char *)v76 + 23) < 0) {
          v76 = *(FstSpotterResults **)v76;
        }
        int v77 = objc_msgSend(NSString, "stringWithCString:encoding:", v76, objc_msgSend(NSString, "defaultCStringEncoding"));
        [(VATKeywordSpotterDelegate *)v75 keywordDiscarded:v77 failedPreSilence:0 failedDuringSilence:0 failedPostSilence:1 failedSecondPass:0 secondPassResult:0 reason:v73 audioURL:v89];
      }
      v54 = v97;
      v55 = (uint64_t *)&v97->_keywordResults;
    }
    v54->_int frameCountSinceKeywordDetected = 0;
    sub_2614C3EE8(v55);
    float v27 = v94;
  }
  else
  {
    float v27 = _VATLoggingFacility(kVATLogCategoryFramework);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      int v28 = NSNumber;
      v29 = [(VATKeywordSpotter *)v97 configuration];
      v30 = [v29 decoder];
      int v31 = [v30 postKeywordSilence];
      float v32 = objc_msgSend(v28, "numberWithInteger:", objc_msgSend(v31, "minSilenceFramesExpected"));
      int frameCountSinceKeywordDetected = v97->_frameCountSinceKeywordDetected;
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v32;
      __int16 v101 = 1024;
      LODWORD(v102) = frameCountSinceKeywordDetected;
      _os_log_debug_impl(&dword_2613B8000, v27, OS_LOG_TYPE_DEBUG, "waiting for %@ frames, have only %d", buf, 0x12u);
    }
  }

  if (v9) {
    operator delete(v9);
  }
}

- (void)_acousticCallback:(id)a3 rows:(int64_t)a4 cols:(int64_t)a5
{
  uint64_t v196 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v181 = v8;
  if (a4 != 8)
  {
    v174 = sub_2614C8CCC(v173, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VoiceActions/VoiceActions/v1/VATKeywordSpotter.m", 86);
    sub_2614C8CCC(v174, (uint64_t)" line ", 6);
    v175 = (void *)std::ostream::operator<<();
    v176 = sub_2614C8CCC(v175, (uint64_t)": ", 2);
    v177 = sub_2614C8CCC(v176, (uint64_t)"Mismatch in acoustic model output shape, expected 8 rows", 56);
    sub_2614C8FE8(v177);
    std::terminate();
  }
  if (v8)
  {
    int v9 = [(VATKeywordSpotter *)self configuration];
    int v10 = [v9 runtime];
    if ([v10 postKeywordSilence])
    {
      begin = self->_keywordResults.__begin_;
      end = self->_keywordResults.__end_;

      int64_t v13 = v181;
      if (end != begin)
      {
        [(VATKeywordSpotter *)self _postKeywordSilenceProcessingWithResults:v181 rows:8 cols:a5];
        self->_processedFrameCount += 8;
        goto LABEL_9;
      }
    }
    else
    {

      int64_t v13 = v181;
    }
    uint64_t v183 = [v13 bytes];
    size_t v182 = 4 * a5;
    uint64_t v186 = 0;
    p_end_cap = &self->_keywordResults.__end_cap_;
    p_keywordResults = (uint64_t *)&self->_keywordResults;
    *(void *)&long long v15 = 138413058;
    long long v178 = v15;
    int64_t v184 = a5;
    v185 = self;
    while (1)
    {
      if (a5)
      {
        if ((unint64_t)a5 >> 62) {
          sub_2614C637C();
        }
        __p = sub_2614C6394(a5);
        memmove(__p, (const void *)(v183 + 4 * v186 * a5), v182);
      }
      else
      {
        __p = 0;
      }
      uint64_t floatFstDecoder = (char *)self->_floatFstDecoder;
      if (*((void *)floatFstDecoder + 23) == *((void *)floatFstDecoder + 24)) {
        goto LABEL_123;
      }
      int processedFrameCount = self->_processedFrameCount;
      v190 = (unsigned __int8 *)self->_floatFstDecoder;
      if (floatFstDecoder[72] || floatFstDecoder[73] || floatFstDecoder[74]) {
        break;
      }
LABEL_68:
      uint64_t v65 = *((void *)floatFstDecoder + 23);
      if (0xAAAAAAAAAAAAAAABLL
         * ((uint64_t)(*((void *)floatFstDecoder + 11) - *((void *)floatFstDecoder + 10)) >> 3) != (*((void *)floatFstDecoder + 24) - v65) >> 5)
        __assert_rtn("SearchFrame", "OnlineFstSpottingDecoder.hpp", 505, "tokens.size() == states.size()");
      if (processedFrameCount) {
        BOOL v66 = floatFstDecoder[517] == 0;
      }
      else {
        BOOL v66 = 1;
      }
      *(_DWORD *)uint64_t v65 = voiceactions::kNolabel;
      float v67 = *(float *)&voiceactions::kLogZero;
      int v68 = voiceactions::kNoTime;
      if (v66)
      {
        int v68 = processedFrameCount;
        float v67 = 0.0;
      }
      *(void *)(v65 + 20) = 0;
      *(void *)(v65 + 12) = 0;
      *(_DWORD *)(v65 + 8) = v68;
      *(float *)(v65 + 4) = v67;
      uint64_t v69 = -1
          - 1431655765 * ((*((void *)floatFstDecoder + 11) - *((void *)floatFstDecoder + 10)) >> 3);
      if ((v69 & 0x80000000) == 0)
      {
        do
        {
          uint64_t v70 = *((void *)v190 + 10) + 24 * v69;
          uint64_t v72 = *(void *)(v70 + 8);
          v71 = (uint64_t *)(v70 + 8);
          v188 = (uint64_t *)(*((void *)v190 + 10) + 24 * v69);
          uint64_t v73 = *v188;
          if (v72 != *v188)
          {
            int v74 = *(_DWORD *)(v73 + 8);
            int v75 = v190[524];
            float v76 = *(float *)&__p[v74 - 1];
            float v77 = logf(v76);
            if (!v75) {
              float v77 = v76;
            }
            sub_2614CAEB0(*((void *)v190 + 23) + 32 * v69, (float *)(*((void *)v190 + 23) + 32 * *(int *)(v73 + 4)), v74, *(_DWORD *)(v73 + 12), *((_DWORD *)v190 + 120), 1, *(float *)(v73 + 16) - v77);
            uint64_t v78 = *v71;
            uint64_t v79 = *v188;
            if (0xAAAAAAAAAAAAAAABLL * ((*v71 - *v188) >> 3) >= 2)
            {
              uint64_t v80 = 0;
              unint64_t v81 = 1;
              do
              {
                uint64_t v82 = v79 + v80;
                int v83 = *(_DWORD *)(v79 + v80 + 32);
                int v84 = v190[524];
                float v85 = *(float *)&__p[v83 - 1];
                float v86 = logf(v85);
                if (!v84) {
                  float v86 = v85;
                }
                uint64_t v87 = *((void *)v190 + 23);
                __int16 v88 = (float *)(v87 + 32 * *(int *)(v82 + 28));
                uint64_t v89 = v87 + 32 * v69;
                if ((float)(v88[1] - v86) < *(float *)(v89 + 4))
                {
                  sub_2614CAEB0(v89, v88, v83, *(_DWORD *)(v82 + 36), *((_DWORD *)v190 + 120), 0, -v86);
                  uint64_t v78 = *v71;
                  uint64_t v79 = *v188;
                }
                ++v81;
                v80 += 24;
              }
              while (0xAAAAAAAAAAAAAAABLL * ((v78 - v79) >> 3) > v81);
            }
          }
          BOOL v32 = v69-- <= 0;
        }
        while (!v32);
      }
      uint64_t v90 = (void *)*((void *)v190 + 15);
      a5 = v184;
      self = v185;
      if (v90)
      {
        v91 = (uint64_t *)(v190 + 144);
        while (1)
        {
          uint64_t v92 = v90[2];
          uint64_t v192 = v92;
          uint64_t v93 = *((void *)v190 + 23);
          float v94 = *(float *)(v93 + 32 * (int)v92 + 4);
          if (v94 >= *(float *)&voiceactions::kLogZero) {
            goto LABEL_120;
          }
          long long v95 = (int *)(v93 + 32 * (int)v92);
          memset(__str, 0, 24);
          *(_DWORD *)&__str[60] = voiceactions::kLogZero;
          __str[64] = 0;
          *(float *)&__str[24] = v94 + *((float *)&v92 + 1);
          *(_DWORD *)&__str[56] = 0;
          *(_DWORD *)&__str[36] = processedFrameCount;
          int v96 = v95[2];
          *(_DWORD *)&__str[32] = v96;
          if (*v95 >= 1 && (long long v97 = sub_2614CB9DC((void *)v190 + 45, *v95)) != 0)
          {
            if (*((char *)v97 + 47) < 0)
            {
              sub_2614C96D8(&__dst, (void *)v97[3], v97[4]);
            }
            else
            {
              long long __dst = *(_OWORD *)(v97 + 3);
              unint64_t v194 = v97[5];
            }
          }
          else
          {
            long long __dst = 0uLL;
            unint64_t v194 = 0;
          }
          unsigned int v98 = (_DWORD *)(v93 + 32 * (int)v92);
          int v100 = v98[5];
          int v99 = v98[6];
          int v101 = v98[3];
          int v102 = v98[4];
          *(_OWORD *)__str = __dst;
          *(void *)&__str[16] = v194;
          *(_DWORD *)&__str[28] = v102;
          *(_DWORD *)&__str[40] = v100;
          *(_DWORD *)&__str[44] = v101;
          *(_DWORD *)&__str[48] = v99;
          *(_DWORD *)&__str[52] = processedFrameCount + 1 - v96;
          *(void *)&long long __dst = __str;
          float v103 = *((float *)sub_2614CAF24((uint64_t)(v190 + 400), __str, (long long **)&__dst) + 10);
          __str[64] = (float)(*(float *)&__str[24] - v103) < 0.0;
          *(float *)&__str[56] = v103;
          *(_DWORD *)&__str[60] = *(_DWORD *)&__str[24];
          if ((float)(*(float *)&__str[24] - v103) < 0.0 && *(float *)&__str[24] < *((float *)v190 + 67))
          {
            std::string::operator=((std::string *)(v190 + 208), (const std::string *)__str);
            long long v104 = *(_OWORD *)&__str[40];
            *(_OWORD *)(v190 + 232) = *(_OWORD *)&__str[24];
            *(_OWORD *)(v190 + 248) = v104;
            *(_OWORD *)(v190 + 257) = *(_OWORD *)&__str[49];
          }
          unint64_t v105 = *((void *)v190 + 19);
          if (!v105) {
            goto LABEL_117;
          }
          uint8x8_t v106 = (uint8x8_t)vcnt_s8((int8x8_t)v105);
          v106.i16[0] = vaddlv_u8(v106);
          if (v106.u32[0] > 1uLL)
          {
            unint64_t v107 = (int)v92;
            if (v105 <= (int)v92) {
              unint64_t v107 = (int)v92 % v105;
            }
          }
          else
          {
            unint64_t v107 = (v105 - 1) & (int)v92;
          }
          uint64_t v108 = *(uint64_t ***)(*v91 + 8 * v107);
          if (!v108 || (v109 = *v108) == 0)
          {
LABEL_117:
            v112 = sub_2614C9240(v91, v92, &v192);
            std::string::operator=((std::string *)v112 + 1, (const std::string *)__str);
            long long v113 = *(_OWORD *)&__str[49];
            long long v114 = *(_OWORD *)&__str[40];
            *((_OWORD *)v112 + 3) = *(_OWORD *)&__str[24];
            *((_OWORD *)v112 + 4) = v114;
            *(_OWORD *)(v112 + 73) = v113;
            goto LABEL_118;
          }
          while (1)
          {
            unint64_t v110 = v109[1];
            if (v110 == (int)v92) {
              break;
            }
            if (v106.u32[0] > 1uLL)
            {
              if (v110 >= v105) {
                v110 %= v105;
              }
            }
            else
            {
              v110 &= v105 - 1;
            }
            if (v110 != v107) {
              goto LABEL_117;
            }
LABEL_113:
            v109 = (uint64_t *)*v109;
            if (!v109) {
              goto LABEL_117;
            }
          }
          if (*((_DWORD *)v109 + 4) != v92) {
            goto LABEL_113;
          }
          v111 = sub_2614C9240(v91, v92, &v192);
          if (*((float *)v111 + 12) > *(float *)&__str[24]) {
            goto LABEL_117;
          }
LABEL_118:
          if ((__str[23] & 0x80000000) != 0) {
            operator delete(*(void **)__str);
          }
LABEL_120:
          uint64_t v90 = (void *)*v90;
          if (!v90)
          {
            v115 = (void *)*((void *)v190 + 15);
            a5 = v184;
            for (self = v185; v115; v115 = (void *)*v115)
              ;
            break;
          }
        }
      }
LABEL_123:
      v116 = self->_floatFstDecoder;
      int v117 = self->_processedFrameCount;
      unint64_t v194 = 0;
      long long __dst = 0uLL;
      v118 = (void *)v116[20];
      if (!v118) {
        goto LABEL_144;
      }
      char v119 = 0;
      do
      {
        sub_2614C91D8((uint64_t)__str, (uint64_t)(v118 + 2));
        if (__str[72]) {
          v119 |= *(_DWORD *)&__str[44] >= v117 - *((_DWORD *)v116 + 130);
        }
        if ((__str[31] & 0x80000000) != 0) {
          operator delete(*(void **)&__str[8]);
        }
        v118 = (void *)*v118;
      }
      while (v118);
      if (v119)
      {
        v120 = (void *)v116[20];
        if (v120)
        {
          do
          {
            sub_2614C91D8((uint64_t)__str, (uint64_t)(v120 + 2));
            if (__str[72])
            {
              v121 = (_OWORD *)*((void *)&__dst + 1);
              if (*((void *)&__dst + 1) >= v194)
              {
                uint64_t v123 = sub_2614C9914((uint64_t *)&__dst, (long long *)&__str[8]);
              }
              else
              {
                if ((__str[31] & 0x80000000) != 0)
                {
                  sub_2614C96D8(*((unsigned char **)&__dst + 1), *(void **)&__str[8], *(unint64_t *)&__str[16]);
                }
                else
                {
                  long long v122 = *(_OWORD *)&__str[8];
                  *(void *)(*((void *)&__dst + 1) + 16) = *(void *)&__str[24];
                  _OWORD *v121 = v122;
                }
                long long v124 = *(_OWORD *)&__str[32];
                long long v125 = *(_OWORD *)&__str[48];
                *(_OWORD *)((char *)v121 + 49) = *(_OWORD *)&__str[57];
                *(_OWORD *)((char *)v121 + 40) = v125;
                *(_OWORD *)((char *)v121 + 24) = v124;
                uint64_t v123 = (uint64_t)v121 + 72;
              }
              *((void *)&__dst + 1) = v123;
            }
            if ((__str[31] & 0x80000000) != 0) {
              operator delete(*(void **)&__str[8]);
            }
            v120 = (void *)*v120;
          }
          while (v120);
          unint64_t v127 = *((void *)&__dst + 1);
          unint64_t v126 = __dst;
        }
        else
        {
          unint64_t v127 = 0;
          unint64_t v126 = 0;
        }
      }
      else
      {
LABEL_144:
        unint64_t v127 = 0;
        unint64_t v126 = 0;
      }
      unint64_t v128 = 126 - 2 * __clz(0x8E38E38E38E38E39 * ((uint64_t)(v127 - v126) >> 3));
      if (v127 == v126) {
        uint64_t v129 = 0;
      }
      else {
        uint64_t v129 = v128;
      }
      sub_2614C9A70(v126, v127, v129, 1);
      v130 = [(VATKeywordSpotter *)self configuration];
      v131 = [v130 runtime];
      if (([(__CFString *)v131 batchDecode] & 1) != 0 || *((void *)&__dst + 1) == (void)__dst) {
        goto LABEL_191;
      }
      BOOL v132 = *(unsigned char *)(__dst + 64) == 0;

      if (!v132)
      {
        uint64_t v133 = __dst;
        if (*(char *)(__dst + 23) < 0) {
          uint64_t v133 = *(void *)__dst;
        }
        v130 = objc_msgSend(NSString, "stringWithCString:encoding:", v133, objc_msgSend(NSString, "defaultCStringEncoding", v178));
        v191 = &stru_270D59F58;
        BOOL v134 = [(VATKeywordSpotter *)self _isDetectionValidForResult:(void)__dst reason:&v191];
        v131 = v191;
        if (v134)
        {
          v135 = [(VATKeywordSpotter *)self configuration];
          v136 = [v135 runtime];
          int v137 = [v136 postKeywordSilence];

          v138 = _VATLoggingFacility(kVATLogCategoryFramework);
          BOOL v139 = os_log_type_enabled(v138, OS_LOG_TYPE_DEBUG);
          if (v137)
          {
            if (v139)
            {
              int v168 = *(_DWORD *)(__dst + 32);
              int v167 = *(_DWORD *)(__dst + 36);
              int v169 = self->_processedFrameCount;
              *(_DWORD *)__str = v178;
              *(void *)&__str[4] = v130;
              *(_WORD *)&__str[12] = 1024;
              *(_DWORD *)&__str[14] = v168;
              *(_WORD *)&__str[18] = 1024;
              *(_DWORD *)&__str[20] = v167;
              *(_WORD *)&__str[24] = 1024;
              *(_DWORD *)&__str[26] = v169;
              _os_log_debug_impl(&dword_2613B8000, v138, OS_LOG_TYPE_DEBUG, "Got keyword \"%@\" [%d, %d] at frame %d, waiting for silence", __str, 0x1Eu);
            }

            if (p_keywordResults != (uint64_t *)&__dst)
            {
              v140 = (long long *)*((void *)&__dst + 1);
              v141 = (long long *)__dst;
              unint64_t v142 = 0x8E38E38E38E38E39 * ((uint64_t)(*((void *)&__dst + 1) - __dst) >> 3);
              uint64_t value = (uint64_t)p_end_cap->__value_;
              uint64_t v144 = *p_keywordResults;
              if (0x8E38E38E38E38E39 * (((uint64_t)p_end_cap->__value_ - *p_keywordResults) >> 3) < v142)
              {
                if (v144)
                {
                  v145 = (long long *)*((void *)&__dst + 1);
                  sub_2614C3EE8(p_keywordResults);
                  operator delete((void *)*p_keywordResults);
                  uint64_t value = 0;
                  uint64_t *p_keywordResults = 0;
                  p_keywordResults[1] = 0;
                  p_keywordResults[2] = 0;
                  v140 = v145;
                }
                if (v142 > 0x38E38E38E38E38ELL) {
                  goto LABEL_207;
                }
                unint64_t v146 = 0x8E38E38E38E38E39 * (value >> 3);
                uint64_t v147 = 2 * v146;
                if (2 * v146 <= v142) {
                  uint64_t v147 = v142;
                }
                unint64_t v148 = v146 >= 0x1C71C71C71C71C7 ? 0x38E38E38E38E38ELL : v147;
                if (v148 > 0x38E38E38E38E38ELL) {
LABEL_207:
                }
                  sub_2614C637C();
                v149 = (FstSpotterResults *)sub_2614C9868(v148);
                self->_keywordResults.__begin_ = v149;
                self->_keywordResults.__end_ = v149;
                self->_keywordResults.__end_cap_.__value_ = (FstSpotterResults *)((char *)v149 + 72 * v150);
                v151 = sub_2614C978C((uint64_t)p_end_cap, v141, v140, (char *)v149);
                goto LABEL_181;
              }
              v153 = self->_keywordResults.__end_;
              if (0x8E38E38E38E38E39 * (((uint64_t)v153 - v144) >> 3) >= v142)
              {
                if ((void)__dst != *((void *)&__dst + 1))
                {
                  do
                  {
                    std::string::operator=((std::string *)v144, (const std::string *)v141);
                    long long v157 = *(long long *)((char *)v141 + 24);
                    long long v158 = *(long long *)((char *)v141 + 40);
                    *(_OWORD *)(v144 + 49) = *(long long *)((char *)v141 + 49);
                    *(_OWORD *)(v144 + 40) = v158;
                    *(_OWORD *)(v144 + 24) = v157;
                    v144 += 72;
                    v141 = (long long *)((char *)v141 + 72);
                  }
                  while (v141 != v140);
                  v153 = self->_keywordResults.__end_;
                }
                while (v153 != (FstSpotterResults *)v144)
                {
                  if (*((char *)v153 - 49) < 0) {
                    operator delete(*((void **)v153 - 9));
                  }
                  v153 = (FstSpotterResults *)((char *)v153 - 72);
                }
                self->_keywordResults.__end_ = (FstSpotterResults *)v144;
              }
              else
              {
                v154 = (long long *)(__dst + 8 * (((uint64_t)v153 - v144) >> 3));
                if (v153 != (FstSpotterResults *)v144)
                {
                  do
                  {
                    std::string::operator=((std::string *)v144, (const std::string *)v141);
                    long long v155 = *(long long *)((char *)v141 + 24);
                    long long v156 = *(long long *)((char *)v141 + 40);
                    *(_OWORD *)(v144 + 49) = *(long long *)((char *)v141 + 49);
                    *(_OWORD *)(v144 + 40) = v156;
                    *(_OWORD *)(v144 + 24) = v155;
                    v141 = (long long *)((char *)v141 + 72);
                    v144 += 72;
                  }
                  while (v141 != v154);
                  uint64_t v144 = (uint64_t)self->_keywordResults.__end_;
                }
                v151 = sub_2614C978C((uint64_t)p_end_cap, v154, v140, (char *)v144);
LABEL_181:
                self->_keywordResults.__end_ = (FstSpotterResults *)v151;
              }
            }
          }
          else
          {
            if (v139)
            {
              int v171 = *(_DWORD *)(__dst + 32);
              int v170 = *(_DWORD *)(__dst + 36);
              int v172 = self->_processedFrameCount;
              *(_DWORD *)__str = v178;
              *(void *)&__str[4] = v130;
              *(_WORD *)&__str[12] = 1024;
              *(_DWORD *)&__str[14] = v171;
              *(_WORD *)&__str[18] = 1024;
              *(_DWORD *)&__str[20] = v170;
              *(_WORD *)&__str[24] = 1024;
              *(_DWORD *)&__str[26] = v172;
              _os_log_debug_impl(&dword_2613B8000, v138, OS_LOG_TYPE_DEBUG, "Got keyword \"%@\" [%d, %d] after %d frames, not looking for silence after", __str, 0x1Eu);
            }

            [(VATKeywordSpotter *)self _handleValidResult:&__dst];
          }
        }
        else
        {
          v152 = _VATLoggingFacility(kVATLogCategoryFramework);
          if (os_log_type_enabled(v152, OS_LOG_TYPE_DEBUG))
          {
            int v160 = *(_DWORD *)(__dst + 32);
            int v159 = *(_DWORD *)(__dst + 36);
            *(_DWORD *)__str = v178;
            *(void *)&__str[4] = v130;
            *(_WORD *)&__str[12] = 1024;
            *(_DWORD *)&__str[14] = v160;
            *(_WORD *)&__str[18] = 1024;
            *(_DWORD *)&__str[20] = v159;
            *(_WORD *)&__str[24] = 2112;
            *(void *)&__str[26] = v131;
            _os_log_debug_impl(&dword_2613B8000, v152, OS_LOG_TYPE_DEBUG, "Keyword \"%@\" [%d,%d] dismissed. %@", __str, 0x22u);
          }
        }
        sub_2614C90A0((void *)self->_floatFstDecoder);
LABEL_191:
      }
      ++self->_processedFrameCount;
      *(void *)__str = &__dst;
      sub_2614C3E0C((void ***)__str);
      if (__p) {
        operator delete(__p);
      }
      if (++v186 == 8) {
        goto LABEL_9;
      }
    }
    unint64_t v17 = (char *)*((void *)floatFstDecoder + 3);
    unint64_t v18 = (char *)*((void *)floatFstDecoder + 2);
    uint64_t v19 = v17 - v18;
    v20 = floatFstDecoder + 8;
    if (v17 == v18) {
      uint64_t v21 = 0;
    }
    else {
      uint64_t v21 = ((v17 - v18) << 7) - 1;
    }
    unint64_t v22 = *((void *)floatFstDecoder + 5);
    uint64_t v23 = *((void *)floatFstDecoder + 6);
    unint64_t v24 = v23 + v22;
    if (v21 != v23 + v22)
    {
LABEL_66:
      *(_DWORD *)(*(void *)&v18[(v24 >> 7) & 0x1FFFFFFFFFFFFF8] + 4 * (v24 & 0x3FF)) = __p[54];
      *((void *)floatFstDecoder + 6) = v23 + 1;
      if (v23 + 1 == *((_DWORD *)floatFstDecoder + 14))
      {
        *((void *)floatFstDecoder + 5) = v22 + 1;
        *((void *)floatFstDecoder + 6) = v23;
        sub_2614C72E4((uint64_t)v20);
        ++*((void *)floatFstDecoder + 8);
      }
      goto LABEL_68;
    }
    BOOL v25 = v22 >= 0x400;
    unint64_t v26 = v22 - 1024;
    if (v25)
    {
      *((void *)floatFstDecoder + 5) = v26;
      uint64_t v29 = *(void *)v18;
      float v27 = v18 + 8;
      uint64_t v28 = v29;
      *((void *)floatFstDecoder + 2) = v27;
      if (*((char **)floatFstDecoder + 4) == v17)
      {
        uint64_t v30 = (uint64_t)&v27[-*v20];
        if ((unint64_t)v27 > *v20)
        {
          uint64_t v31 = v30 >> 3;
          BOOL v32 = v30 >> 3 < -1;
          uint64_t v33 = (v30 >> 3) + 2;
          if (v32) {
            uint64_t v34 = v33;
          }
          else {
            uint64_t v34 = v31 + 1;
          }
          uint64_t v35 = &v27[-8 * (v34 >> 1)];
          int64_t v36 = v17 - v27;
          if (v17 == v27)
          {
            int v37 = v17;
          }
          else
          {
            memmove(&v27[-8 * (v34 >> 1)], v27, v17 - v27);
            int v37 = (char *)*((void *)floatFstDecoder + 2);
          }
          unint64_t v17 = &v35[v36];
          v64 = &v37[-8 * (v34 >> 1)];
LABEL_63:
          *((void *)floatFstDecoder + 2) = v64;
          *((void *)floatFstDecoder + 3) = v17;
          goto LABEL_64;
        }
        if (v17 == (char *)*v20) {
          unint64_t v45 = 1;
        }
        else {
          unint64_t v45 = (uint64_t)&v17[-*v20] >> 2;
        }
        float v46 = (char *)sub_2614C7718(v45);
        v48 = &v46[8 * (v45 >> 2)];
        v49 = (uint64_t *)*((void *)floatFstDecoder + 2);
        unint64_t v17 = v48;
        uint64_t v50 = *((void *)floatFstDecoder + 3) - (void)v49;
        if (v50)
        {
          unint64_t v17 = &v48[v50 & 0xFFFFFFFFFFFFFFF8];
          uint64_t v51 = 8 * (v50 >> 3);
          int v52 = &v46[8 * (v45 >> 2)];
          do
          {
            uint64_t v53 = *v49++;
            *(void *)int v52 = v53;
            v52 += 8;
            v51 -= 8;
          }
          while (v51);
        }
LABEL_52:
        v54 = (void *)*((void *)floatFstDecoder + 1);
        *((void *)floatFstDecoder + 1) = v46;
        *((void *)floatFstDecoder + 2) = v48;
        *((void *)floatFstDecoder + 3) = v17;
        *((void *)floatFstDecoder + 4) = &v46[8 * v47];
        if (v54)
        {
          operator delete(v54);
          unint64_t v17 = (char *)*((void *)floatFstDecoder + 3);
        }
      }
    }
    else
    {
      uint64_t v38 = v19 >> 3;
      int v39 = (char *)*((void *)floatFstDecoder + 4);
      int v40 = (char *)*((void *)floatFstDecoder + 1);
      if (v19 >> 3 >= (unint64_t)((v39 - v40) >> 3))
      {
        if (v39 == v40) {
          unint64_t v41 = 1;
        }
        else {
          unint64_t v41 = (v39 - v40) >> 2;
        }
        *(void *)&__str[32] = floatFstDecoder + 32;
        *(void *)__str = sub_2614C7718(v41);
        *(void *)&__str[8] = *(void *)__str + 8 * v38;
        *(void *)&__str[16] = *(void *)&__str[8];
        *(void *)&__str[24] = *(void *)__str + 8 * v42;
        *(void *)&long long __dst = operator new(0x1000uLL);
        sub_2614C7750(__str, &__dst);
        for (uint64_t i = (void *)*((void *)floatFstDecoder + 3);
              i != *((void **)floatFstDecoder + 2);
              sub_2614C7864((uint64_t)__str, i))
        {
          --i;
        }
        unint64_t v44 = (void *)*((void *)floatFstDecoder + 1);
        *(_OWORD *)(floatFstDecoder + 8) = *(_OWORD *)__str;
        *(_OWORD *)(floatFstDecoder + 24) = *(_OWORD *)&__str[16];
        if (v44) {
          operator delete(v44);
        }
        goto LABEL_65;
      }
      if (v39 != v17)
      {
        *(void *)__str = operator new(0x1000uLL);
        sub_2614C7750((void *)floatFstDecoder + 1, __str);
LABEL_65:
        unint64_t v18 = (char *)*((void *)floatFstDecoder + 2);
        unint64_t v22 = *((void *)floatFstDecoder + 5);
        uint64_t v23 = *((void *)floatFstDecoder + 6);
        unint64_t v24 = v22 + v23;
        goto LABEL_66;
      }
      *(void *)__str = operator new(0x1000uLL);
      sub_2614C7864((uint64_t)(floatFstDecoder + 8), __str);
      v55 = (void *)*((void *)floatFstDecoder + 2);
      unint64_t v17 = (char *)*((void *)floatFstDecoder + 3);
      uint64_t v57 = *v55;
      v56 = (char *)(v55 + 1);
      uint64_t v28 = v57;
      *((void *)floatFstDecoder + 2) = v56;
      if (v17 == *((char **)floatFstDecoder + 4))
      {
        uint64_t v58 = (uint64_t)&v56[-*v20];
        if ((unint64_t)v56 > *v20)
        {
          uint64_t v59 = v58 >> 3;
          BOOL v32 = v58 >> 3 < -1;
          uint64_t v60 = (v58 >> 3) + 2;
          if (v32) {
            uint64_t v61 = v60;
          }
          else {
            uint64_t v61 = v59 + 1;
          }
          int v62 = &v56[-8 * (v61 >> 1)];
          int64_t v63 = v17 - v56;
          if (v17 != v56)
          {
            memmove(&v56[-8 * (v61 >> 1)], v56, v17 - v56);
            v56 = (char *)*((void *)floatFstDecoder + 2);
          }
          unint64_t v17 = &v62[v63];
          v64 = &v56[-8 * (v61 >> 1)];
          goto LABEL_63;
        }
        if (v17 == (char *)*v20) {
          unint64_t v161 = 1;
        }
        else {
          unint64_t v161 = (uint64_t)&v17[-*v20] >> 2;
        }
        float v46 = (char *)sub_2614C7718(v161);
        v48 = &v46[8 * (v161 >> 2)];
        v162 = (uint64_t *)*((void *)floatFstDecoder + 2);
        unint64_t v17 = v48;
        uint64_t v163 = *((void *)floatFstDecoder + 3) - (void)v162;
        if (v163)
        {
          unint64_t v17 = &v48[v163 & 0xFFFFFFFFFFFFFFF8];
          uint64_t v164 = 8 * (v163 >> 3);
          v165 = &v46[8 * (v161 >> 2)];
          do
          {
            uint64_t v166 = *v162++;
            *(void *)v165 = v166;
            v165 += 8;
            v164 -= 8;
          }
          while (v164);
        }
        goto LABEL_52;
      }
    }
LABEL_64:
    *(void *)unint64_t v17 = v28;
    *((void *)floatFstDecoder + 3) += 8;
    goto LABEL_65;
  }
  int v14 = _VATLoggingFacility(kVATLogCategoryFramework);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)__str = 0;
    _os_log_error_impl(&dword_2613B8000, v14, OS_LOG_TYPE_ERROR, "Got nil acoustic model output", __str, 2u);
  }

LABEL_9:
}

- (void)_initializeDecoderForKeywordsWithPhonemes:(id)a3
{
  self->_int processedFrameCount = 0;
  operator new();
}

- (void)setPostKeywordSilenceCheckEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(VATKeywordSpotter *)self configuration];
  int v4 = [v5 runtime];
  [v4 setPostKeywordSilence:v3];
}

- (BOOL)postKeywordSilenceCheckEnabled
{
  v2 = [(VATKeywordSpotter *)self configuration];
  BOOL v3 = [v2 runtime];
  char v4 = [v3 postKeywordSilence];

  return v4;
}

- (void)setDuringKeywordSilenceCheckEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(VATKeywordSpotter *)self configuration];
  char v4 = [v5 runtime];
  [v4 setDuringKeywordSilence:v3];
}

- (BOOL)duringKeywordSilenceCheckEnabled
{
  v2 = [(VATKeywordSpotter *)self configuration];
  BOOL v3 = [v2 runtime];
  char v4 = [v3 duringKeywordSilence];

  return v4;
}

- (void)setPreKeywordSilenceCheckEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(VATKeywordSpotter *)self configuration];
  char v4 = [v5 runtime];
  [v4 setPreKeywordSilence:v3];
}

- (BOOL)preKeywordSilenceCheckEnabled
{
  v2 = [(VATKeywordSpotter *)self configuration];
  BOOL v3 = [v2 runtime];
  char v4 = [v3 preKeywordSilence];

  return v4;
}

- (void)stop
{
  if (self->_isRunning)
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
    fe = self->fe;
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = sub_2614D1B40;
    v37[3] = &unk_265581720;
    v37[4] = self;
    id v5 = v3;
    uint64_t v38 = v5;
    [(FeatureExtractObjc *)fe stopWithCompletionHandlerWithCompletionHandler:v37];
    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
    self->_isRunning = 0;
    self->_int processedFrameCount = 0;
    uint64_t floatFstDecoder = self->_floatFstDecoder;
    sub_2614C90A0(floatFstDecoder);
    floatFstDecoder[8] = 0;
    unint64_t v7 = floatFstDecoder[5];
    uint64_t v9 = floatFstDecoder[2];
    uint64_t v8 = floatFstDecoder[3];
    int v10 = (char **)(v9 + 8 * (v7 >> 10));
    if (v8 == v9)
    {
      uint64_t v11 = 0;
      uint64_t v14 = 0;
      uint64_t v12 = floatFstDecoder[6];
      int64_t v13 = (char *)(v9 + 8 * ((v12 + v7) >> 10));
    }
    else
    {
      uint64_t v11 = (uint64_t)&(*v10)[4 * (floatFstDecoder[5] & 0x3FFLL)];
      uint64_t v12 = floatFstDecoder[6];
      int64_t v13 = (char *)(v9 + 8 * ((v12 + v7) >> 10));
      uint64_t v14 = *(void *)v13 + 4 * ((v12 + v7) & 0x3FF);
    }
    if (v14 == v11) {
      uint64_t v15 = 0;
    }
    else {
      uint64_t v15 = ((v14 - *(void *)v13) >> 2) + ((v13 - (char *)v10) << 7) - ((v11 - (uint64_t)*v10) >> 2);
    }
    if (v8 == v9) {
      uint64_t v16 = 0;
    }
    else {
      uint64_t v16 = &(*v10)[4 * (floatFstDecoder[5] & 0x3FFLL)];
    }
    uint64_t v35 = floatFstDecoder[3];
    int64_t v36 = self;
    uint64_t v34 = floatFstDecoder[5];
    uint64_t v17 = v15;
    if (v16 == (char *)v11) {
      unint64_t v18 = 0;
    }
    else {
      unint64_t v18 = ((v11 - (uint64_t)*v10) >> 2) - ((v16 - *v10) >> 2);
    }
    uint64_t v19 = (char **)sub_2614C733C((void *)(v9 + 8 * (v7 >> 10)), (uint64_t)v16, v18);
    if (v17 >= 1)
    {
      uint64_t v21 = v19;
      unint64_t v22 = (char *)v20;
      uint64_t v33 = v5;
      uint64_t v23 = sub_2614C733C(v19, v20, v17);
      if (v18 <= (unint64_t)(v12 - v17) >> 1)
      {
        sub_2614C751C(v39, v10, v16, v21, v22, v23, v24);
        uint64_t v28 = floatFstDecoder[6] - v17;
        floatFstDecoder[5] += v17;
        floatFstDecoder[6] = v28;
        while (sub_2614C72E4((uint64_t)(floatFstDecoder + 1)))
          ;
      }
      else
      {
        v25.n128_u64[0] = (unint64_t)v21;
        v25.n128_u64[1] = (unint64_t)v22;
        unint64_t v26 = (uint64_t *)(v9 + 8 * ((unint64_t)(v34 + v12) >> 10));
        if (v35 == v9) {
          float v27 = 0;
        }
        else {
          float v27 = (unsigned char *)(*v26 + 4 * (((_WORD)v34 + (_WORD)v12) & 0x3FF));
        }
        v39[0] = v25;
        sub_2614C7390(v23, v24, v26, v27, (uint64_t)v39);
        uint64_t v29 = floatFstDecoder[6] - v17;
        floatFstDecoder[6] = v29;
        uint64_t v30 = floatFstDecoder[3];
        while (1)
        {
          uint64_t v31 = floatFstDecoder[2];
          uint64_t v32 = v30 == v31 ? 0 : ((v30 - v31) << 7) - 1;
          if ((unint64_t)(v32 - (v29 + floatFstDecoder[5])) < 0x800) {
            break;
          }
          operator delete(*(void **)(v30 - 8));
          uint64_t v30 = floatFstDecoder[3] - 8;
          floatFstDecoder[3] = v30;
          uint64_t v29 = floatFstDecoder[6];
        }
      }
    }
    [(FeatureExtractObjc *)v36->fe reset];
  }
}

- (void)addAudioSamples:(const void *)a3 count:(int)a4 isFloat:(BOOL)a5 filePath:(id)a6 byteCount:(int64_t)a7 currentDuration:(double)a8
{
  objc_storeStrong((id *)&self->_filePath, a6);
  self->_fileCurrentDuration = a8;
  self->_fileByteCount += a7;
  MEMORY[0x270F9A6D0](self, sel_addAudioSamples_count_isFloat_);
}

- (void)addAudioSamples:(const void *)a3 count:(int)a4 isFloat:(BOOL)a5
{
  fe = self->fe;
  if (a5) {
    MEMORY[0x270F9A6D0](fe, sel_addFloatSamples_count_);
  }
  else {
    MEMORY[0x270F9A6D0](fe, sel_addSamples_count_);
  }
}

- (void)addAudioSamples:(const void *)a3 length:(int)a4
{
}

- (void)addAudioSamples:(const void *)a3 count:(int)a4
{
}

- (void)setStreamingMode:(BOOL)a3
{
  fe = self->fe;
  if (fe)
  {
    MEMORY[0x270F9A6D0](fe, sel_setStreamingModeWithStreaming_);
  }
  else
  {
    char v4 = _VATLoggingFacility(kVATLogCategoryFramework);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_2613B8000, v4, OS_LOG_TYPE_INFO, "VATKeywordSpotter setStreamingMode ignored due to fe being null", v5, 2u);
    }
  }
}

- (void)start
{
  filePath = self->_filePath;
  self->_filePath = 0;

  self->_fileByteCount = 0;
  self->_fileCurrentDuration = 0.0;
  if (!self->_isRunning)
  {
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
    fe = self->fe;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = sub_2614D3568;
    v7[3] = &unk_2655816F8;
    dispatch_semaphore_t v8 = v4;
    v6 = v4;
    [(FeatureExtractObjc *)fe startWithCompletionHandlerWithCompletionHandler:v7];
    dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
    self->_isRunning = 1;
  }
}

- (VATKeywordSpotter)initWithConfig:(id)a3 keywordsWithPhonemes:(id)a4 delegate:(id)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v29.receiver = self;
  v29.super_class = (Class)VATKeywordSpotter;
  uint64_t v11 = [(VATKeywordSpotter *)&v29 init];
  if (!v11) {
    goto LABEL_5;
  }
  id v28 = 0;
  uint64_t v12 = [[VATConfiguration alloc] initWithFilename:v8 error:&v28];
  id v13 = v28;
  if (!v12)
  {
    unint64_t v18 = _VATLoggingFacility((uint64_t)"VATKeywordSpotter");
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      uint64_t v17 = 0;
      goto LABEL_10;
    }
    *(_DWORD *)location = 138412546;
    *(void *)&location[4] = v8;
    __int16 v31 = 2112;
    id v32 = v13;
    uint64_t v19 = "Failed to load config from %@: %@";
    uint64_t v20 = v18;
    uint32_t v21 = 22;
LABEL_12:
    _os_log_error_impl(&dword_2613B8000, v20, OS_LOG_TYPE_ERROR, v19, location, v21);
    goto LABEL_9;
  }
  [(VATKeywordSpotter *)v11 setConfiguration:v12];
  uint64_t v14 = [[FeatureExtractObjc alloc] initWithConfig:v12];
  fe = v11->fe;
  v11->fe = v14;

  if (!v11->fe)
  {
    unint64_t v18 = _VATLoggingFacility((uint64_t)"VATKeywordSpotter");
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_WORD *)location = 0;
    uint64_t v19 = "Failed to create frontend or AM neural net";
    uint64_t v20 = v18;
    uint32_t v21 = 2;
    goto LABEL_12;
  }
  objc_storeStrong((id *)&v11->_delegate, a5);
  objc_storeStrong((id *)&v11->_keywordsWithPhonemes, a4);
  [(VATKeywordSpotter *)v11 _initializeDecoderForKeywordsWithPhonemes:v9];
  objc_initWeak((id *)location, v11);
  uint64_t v16 = v11->fe;
  uint64_t v23 = MEMORY[0x263EF8330];
  uint64_t v24 = 3221225472;
  __n128 v25 = sub_2614D3878;
  unint64_t v26 = &unk_2655816D0;
  objc_copyWeak(&v27, (id *)location);
  [(FeatureExtractObjc *)v16 addCallbackForAcousticModelOutputAvailableWithCallback:&v23];
  [(VATKeywordSpotter *)v11 start];
  objc_destroyWeak(&v27);
  objc_destroyWeak((id *)location);

LABEL_5:
  uint64_t v17 = v11;
LABEL_10:

  return v17;
}

- (VATKeywordSpotter)initWithConfig:(id)a3 keywords:(id)a4 delegate:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(G2PFactoredObjc);
  [(G2PFactoredObjc *)v10 setup];
  uint64_t v11 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v12 = v8;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v21;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = [(G2PFactoredObjc *)v10 getPhrasePronounciationWithPhrase:*(void *)(*((void *)&v20 + 1) + 8 * v15) wordSep:@"<w>" prefixWithPhrase:1];
        if (v16) {
          [v11 addObject:v16];
        }

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v13);
  }

  uint64_t v17 = [(VATKeywordSpotter *)self initWithConfig:v7 keywordsWithPhonemes:v11 delegate:v9];
  return v17;
}

- (void)updateWithKeywordsWithPhonemes:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v21 = a3;
  long long v22 = self;
  [(VATKeywordSpotter *)self stop];
  uint64_t v33 = 0;
  uint64_t v34 = 0;
  unint64_t v35 = 0;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v4 = v21;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v30 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(id *)(*((void *)&v29 + 1) + 8 * i);
        sub_2614CCA98(__p, (char *)[v8 UTF8String]);
        id v9 = v34;
        if ((unint64_t)v34 >= v35)
        {
          unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * ((v34 - v33) >> 3);
          unint64_t v12 = v11 + 1;
          if (v11 + 1 > 0xAAAAAAAAAAAAAAALL) {
            sub_2614C637C();
          }
          if (0x5555555555555556 * ((uint64_t)(v35 - (void)v33) >> 3) > v12) {
            unint64_t v12 = 0x5555555555555556 * ((uint64_t)(v35 - (void)v33) >> 3);
          }
          if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v35 - (void)v33) >> 3) >= 0x555555555555555) {
            unint64_t v13 = 0xAAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v13 = v12;
          }
          v36[4] = (void **)&v35;
          if (v13) {
            unint64_t v13 = (unint64_t)sub_2614CCB48(v13);
          }
          else {
            uint64_t v14 = 0;
          }
          unint64_t v15 = v13 + 24 * v11;
          v36[0] = (void **)v13;
          v36[1] = (void **)v15;
          v36[3] = (void **)(v13 + 24 * v14);
          long long v16 = *(_OWORD *)__p;
          *(void *)(v15 + 16) = v28;
          *(_OWORD *)unint64_t v15 = v16;
          __p[1] = 0;
          uint64_t v28 = 0;
          __p[0] = 0;
          v36[2] = (void **)(v15 + 24);
          sub_2614CCB90((uint64_t *)&v33, v36);
          uint64_t v17 = (long long *)v34;
          sub_2614CCC14((uint64_t)v36);
          uint64_t v34 = (char *)v17;
          if (SHIBYTE(v28) < 0) {
            operator delete(__p[0]);
          }
        }
        else
        {
          long long v10 = *(_OWORD *)__p;
          *((void *)v34 + 2) = v28;
          *(_OWORD *)id v9 = v10;
          uint64_t v34 = v9 + 24;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v5);
  }

  uint64_t floatFstDecoder = (uint64_t)v22->_floatFstDecoder;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  uint64_t v23 = 0;
  sub_2614CCC78((char *)&v23, (long long *)v33, (long long *)v34, 0xAAAAAAAAAAAAAAABLL * ((v34 - v33) >> 3));
  sub_2614CCD00((uint64_t)v26, floatFstDecoder, v23, v24);
  sub_2614C3E9C((void **)v26[2]);
  uint64_t v19 = v26[0];
  v26[0] = 0;
  if (v19) {
    operator delete(v19);
  }
  v36[0] = (void **)&v23;
  sub_2614CB938(v36);
  long long v20 = (void **)v22->_floatFstDecoder;
  sub_2614CE718(v20 + 23, (int)(-1431655765 * ((unint64_t)((unsigned char *)v20[11] - (unsigned char *)v20[10]) >> 3)));
  sub_2614C90A0(v20);
  sub_2614C90A0((void *)v22->_floatFstDecoder);
  [(VATKeywordSpotter *)v22 start];
  v36[0] = (void **)&v33;
  sub_2614CB938(v36);
}

- (void)updateWithKeywords:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(G2PFactoredObjc);
  [(G2PFactoredObjc *)v5 setup];
  uint64_t v6 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        unint64_t v11 = [(G2PFactoredObjc *)v5 getPhrasePronounciationWithPhrase:*(void *)(*((void *)&v12 + 1) + 8 * v10), @"<w>", 1, (void)v12 wordSep prefixWithPhrase];
        if (v11) {
          [v6 addObject:v11];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  [(VATKeywordSpotter *)self updateWithKeywordsWithPhonemes:v6];
}

- (VATKeywordSpotter)initWithKeywordsWithPhonemes:(id)a3 delegate:(id)a4
{
  return [(VATKeywordSpotter *)self initWithConfig:0 keywordsWithPhonemes:a3 delegate:a4];
}

- (VATKeywordSpotter)initWithKeywords:(id)a3 delegate:(id)a4
{
  return (VATKeywordSpotter *)MEMORY[0x270F9A6D0](self, sel_initWithConfig_keywords_delegate_);
}

- (id)init:(id)a3 delegate:(id)a4 silenceLookback:(int)a5 silenceExpect:(int)a6 batchDecode:(BOOL)a7 enableAudioDebugging:(BOOL)a8
{
  LOBYTE(v9) = a8;
  return [(VATKeywordSpotter *)self initWithConfig:0 keywordsWithPhonemes:a3 delegate:a4 silenceLookback:*(void *)&a5 silenceExpect:*(void *)&a6 batchDecode:a7 enableAudioDebugging:v9];
}

- (VATKeywordSpotter)initWithConfig:(id)a3 keywordsWithPhonemes:(id)a4 delegate:(id)a5 silenceLookback:(int)a6 silenceExpect:(int)a7 batchDecode:(BOOL)a8 enableAudioDebugging:(BOOL)a9
{
  BOOL v9 = a8;
  long long v12 = [(VATKeywordSpotter *)self initWithConfig:a3 keywordsWithPhonemes:a4 delegate:a5];
  long long v13 = v12;
  BOOL v15 = a6 > 0 && a7 > 0;
  if (v15)
  {
    long long v16 = [(VATKeywordSpotter *)v12 configuration];
    uint64_t v17 = [v16 decoder];
    unint64_t v18 = [v17 preKeywordSilence];
    [v18 setLookbackFrames:a6];

    uint64_t v19 = [(VATKeywordSpotter *)v13 configuration];
    long long v20 = [v19 decoder];
    id v21 = [v20 preKeywordSilence];
    [v21 setMinSilenceInLookbackFrames:a7];
  }
  [(VATKeywordSpotter *)v13 setPreKeywordSilenceCheckEnabled:v15];
  [(VATKeywordSpotter *)v13 setAudioDebuggingEnabled:a9];
  [(VATKeywordSpotter *)v13 setBatchDecodeEnabled:v9];

  return v13;
}

- (void)dealloc
{
  uint64_t floatFstDecoder = self->_floatFstDecoder;
  if (floatFstDecoder) {
    (*(void (**)(void *, SEL))(*(void *)floatFstDecoder + 8))(floatFstDecoder, a2);
  }
  [(VATKeywordSpotter *)self _categoryDealloc];
  v4.receiver = self;
  v4.super_class = (Class)VATKeywordSpotter;
  [(VATKeywordSpotter *)&v4 dealloc];
}

+ (id)pronounciationsFor:(id)a3 wordSeparator:(id)a4 prefixWithPhrase:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v18 = a3;
  id v19 = a4;
  long long v20 = objc_alloc_init(G2PFactoredObjc);
  [(G2PFactoredObjc *)v20 setup];
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v18;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        long long v13 = [v7 allKeys];
        char v14 = [v13 containsObject:v12];

        if ((v14 & 1) == 0)
        {
          BOOL v15 = [(G2PFactoredObjc *)v20 getPhrasePronounciationWithPhrase:v12 wordSep:v19 prefixWithPhrase:v5];
          uint64_t v25 = v15;
          long long v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v25 count:1];
          [v7 setObject:v16 forKeyedSubscript:v12];
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v9);
  }

  return v7;
}

+ (id)pronounciationsFor:(id)a3 wordSeparator:(id)a4
{
  objc_super v4 = +[VATKeywordSpotter pronounciationsFor:a3 wordSeparator:a4 prefixWithPhrase:0];
  return v4;
}

@end