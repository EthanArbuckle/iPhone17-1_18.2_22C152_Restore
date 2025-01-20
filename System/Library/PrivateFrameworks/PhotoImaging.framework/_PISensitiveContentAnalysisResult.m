@interface _PISensitiveContentAnalysisResult
- (BOOL)isSafe;
- (NSString)description;
- (SCMLImageSanitization)sanitization;
- (_PISensitiveContentAnalysisResult)initWithSanitization:(id)a3;
- (double)sensitivityScore;
- (void)setSanitization:(id)a3;
@end

@implementation _PISensitiveContentAnalysisResult

- (void).cxx_destruct
{
}

- (void)setSanitization:(id)a3
{
}

- (SCMLImageSanitization)sanitization
{
  return self->_sanitization;
}

- (NSString)description
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v32.receiver = self;
  v32.super_class = (Class)_PISensitiveContentAnalysisResult;
  v3 = [(_PISensitiveContentAnalysisResult *)&v32 description];
  v4 = [(_PISensitiveContentAnalysisResult *)self sanitization];
  int v5 = [v4 safe];
  v6 = @"NO";
  if (v5) {
    v6 = @"YES";
  }
  v7 = [v3 stringByAppendingFormat:@"\n   isSafe: %@", v6];

  v8 = [MEMORY[0x1E4F1CA60] dictionary];
  v9 = [(_PISensitiveContentAnalysisResult *)self sanitization];
  v10 = [v9 signals];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __48___PISensitiveContentAnalysisResult_description__block_invoke;
  v30[3] = &unk_1E5D7ECA8;
  id v11 = v8;
  id v31 = v11;
  [v10 enumerateKeysAndObjectsUsingBlock:v30];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v12 = [v11 allKeys];
  v13 = [v12 sortedArrayUsingComparator:&__block_literal_global_24];

  id obj = v13;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v33 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v27;
    do
    {
      uint64_t v17 = 0;
      v18 = v7;
      do
      {
        if (*(void *)v27 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v26 + 1) + 8 * v17);
        v20 = [v11 objectForKeyedSubscript:v19];
        if ([v20 safe]) {
          v21 = @"safe";
        }
        else {
          v21 = @"UNSAFE";
        }
        v22 = [v20 score];
        [v22 doubleValue];
        v7 = [v18 stringByAppendingFormat:@"\n        %@: %@ (%f)", v19, v21, v23];

        ++v17;
        v18 = v7;
      }
      while (v15 != v17);
      uint64_t v15 = [obj countByEnumeratingWithState:&v26 objects:v33 count:16];
    }
    while (v15);
  }

  return (NSString *)v7;
}

- (double)sensitivityScore
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v4 = [v3 BOOLForKey:@"PI_FORCE_SAFETY_CHECK_FAIL"];

  if ((v4 & 1) == 0)
  {
    v6 = +[PIGlobalSettings globalSettings];
    int v7 = [v6 sensitivityCheckVersion2Thresholds];

    if (v7) {
      v8 = @"ivs.nsfw_explicit";
    }
    else {
      v8 = @"ivs.nsfw_any";
    }
    v9 = [(SCMLImageSanitization *)self->_sanitization signals];
    double Helper_x8__OBJC_CLASS___SCMLImageLabelCoder = gotLoadHelper_x8__OBJC_CLASS___SCMLImageLabelCoder(v10);
    v13 = objc_msgSend(*(id *)(v12 + 1568), "instance", Helper_x8__OBJC_CLASS___SCMLImageLabelCoder);
    uint64_t v14 = [v13 encodeToP1:v8];
    uint64_t v15 = [v9 objectForKeyedSubscript:v14];

    if (v15) {
      goto LABEL_20;
    }
    uint64_t v16 = (uint64_t *)MEMORY[0x1E4F7A750];
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_173);
    }
    uint64_t v17 = (os_log_t *)MEMORY[0x1E4F7A748];
    v18 = (void *)*MEMORY[0x1E4F7A748];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = NSString;
      sanitization = self->_sanitization;
      v21 = v18;
      v22 = [(SCMLImageSanitization *)sanitization signals];
      uint64_t v23 = [v19 stringWithFormat:@"Did not get the expected signal: %@", v22];
      *(_DWORD *)buf = 138543362;
      v41 = v23;
      _os_log_impl(&dword_1A9680000, v21, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

      uint64_t v24 = *v16;
      if (dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
      {
        if (v24 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_173);
        }
LABEL_14:
        os_log_t v25 = *v17;
        if (os_log_type_enabled(*v17, OS_LOG_TYPE_ERROR))
        {
          specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
          long long v27 = (void *)MEMORY[0x1E4F29060];
          id v28 = specific;
          long long v29 = v25;
          v30 = [v27 callStackSymbols];
          id v31 = [v30 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543618;
          v41 = specific;
          __int16 v42 = 2114;
          v43 = v31;
          _os_log_error_impl(&dword_1A9680000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_23:
          goto LABEL_19;
        }
        goto LABEL_19;
      }
      if (v24 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_173);
      }
    }
    else if (dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
    {
      goto LABEL_14;
    }
    os_log_t v32 = *v17;
    if (os_log_type_enabled(*v17, OS_LOG_TYPE_ERROR))
    {
      v36 = (void *)MEMORY[0x1E4F29060];
      long long v29 = v32;
      v37 = [v36 callStackSymbols];
      v38 = [v37 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v41 = v38;
      _os_log_error_impl(&dword_1A9680000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      goto LABEL_23;
    }
LABEL_19:
    v39 = [(SCMLImageSanitization *)self->_sanitization signals];
    _NUAssertContinueHandler();

LABEL_20:
    v33 = objc_msgSend(v15, "score", v39);
    [v33 doubleValue];
    double v5 = v34;

    return v5;
  }
  return 0.999;
}

- (BOOL)isSafe
{
  [(_PISensitiveContentAnalysisResult *)self sensitivityScore];
  return !+[PISensitiveContentAnalysisRequest currentSensitivityExceedsThresholds:v2 initialSensitivity:v2];
}

- (_PISensitiveContentAnalysisResult)initWithSanitization:(id)a3
{
  char v4 = (SCMLImageSanitization *)a3;
  v8.receiver = self;
  v8.super_class = (Class)_PISensitiveContentAnalysisResult;
  double v5 = [(_PISensitiveContentAnalysisResult *)&v8 init];
  sanitization = v5->_sanitization;
  v5->_sanitization = v4;

  return v5;
}

@end