@interface NUTimeTransformTrim
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)beginTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)transformTime:(SEL)a3;
- (BOOL)isEqual:(id)a3;
- (NUTimeTransformTrim)init;
- (NUTimeTransformTrim)initWithTrimBeginTime:(id *)a3;
- (id)description;
- (id)inverseTransform;
- (unint64_t)hash;
@end

@implementation NUTimeTransformTrim

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)beginTime
{
  objc_copyStruct(retstr, &self->_beginTime, 24, 1, 0);
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (NUTimeTransformTrim *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      p_beginTime = &self->_beginTime;
      if (v4) {
        [(NUTimeTransformTrim *)v4 beginTime];
      }
      else {
        memset(&time2, 0, sizeof(time2));
      }
      $95D729B680665BEAEFA1D6FCA8238556 v8 = *p_beginTime;
      BOOL v6 = CMTimeCompare((CMTime *)&v8, &time2) == 0;
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  $95D729B680665BEAEFA1D6FCA8238556 beginTime = self->_beginTime;
  v2 = [NSNumber numberWithDouble:CMTimeGetSeconds((CMTime *)&beginTime)];
  unint64_t v3 = 0x1D3550BEF245C7 * [v2 hash];

  return v3;
}

- (id)description
{
  CMTime time = (CMTime)self->_beginTime;
  v2 = objc_msgSend(NSString, "stringWithFormat:", @"NUTimeTransformTrim  beginTime=%f", CMTimeGetSeconds(&time));

  return v2;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)transformTime:(SEL)a3
{
  CMTime lhs = *(CMTime *)a4;
  $95D729B680665BEAEFA1D6FCA8238556 beginTime = self->_beginTime;
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeSubtract((CMTime *)retstr, &lhs, (CMTime *)&beginTime);
}

- (id)inverseTransform
{
  memset(&v7, 0, sizeof(v7));
  CMTime beginTime = (CMTime)self->_beginTime;
  CMTimeMultiply(&v7, &beginTime, -1);
  unint64_t v3 = self;
  CMTime beginTime = v7;
  v4 = [(NUTimeTransformTrim *)v3 initWithTrimBeginTime:&beginTime];

  return v4;
}

- (NUTimeTransformTrim)init
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_19038);
  }
  unint64_t v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v4 = NSString;
    v5 = v3;
    BOOL v6 = (objc_class *)objc_opt_class();
    CMTime v7 = NSStringFromClass(v6);
    $95D729B680665BEAEFA1D6FCA8238556 v8 = NSStringFromSelector(a2);
    v9 = [v4 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v7, v8];
    *(_DWORD *)buf = 138543362;
    v29 = v9;
    _os_log_error_impl(&dword_1A9892000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v10 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v10 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_19038);
      }
      goto LABEL_8;
    }
    if (v10 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_19038);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v11 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    v12 = (void *)MEMORY[0x1E4F29060];
    v13 = v11;
    v14 = [v12 callStackSymbols];
    v15 = [v14 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    v29 = v15;
    _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v16 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v18 = (void *)MEMORY[0x1E4F29060];
  id v19 = specific;
  v13 = v16;
  v20 = [v18 callStackSymbols];
  v21 = [v20 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  v29 = specific;
  __int16 v30 = 2114;
  v31 = v21;
  _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v22 = (objc_class *)objc_opt_class();
  uint64_t v23 = NSStringFromClass(v22);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUTimeTransformTrim init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/transforms/NUGeometryTransform.m", 629, @"Initializer not available: -[%@ %@], use designated initializer instead.", v24, v25, v26, v27, v23);
}

- (NUTimeTransformTrim)initWithTrimBeginTime:(id *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NUTimeTransformTrim;
  result = [(NUTimeTransformTrim *)&v6 init];
  if (result)
  {
    int64_t var3 = a3->var3;
    *(_OWORD *)&result->_beginTime.value = *(_OWORD *)&a3->var0;
    result->_beginTime.epoch = var3;
  }
  return result;
}

@end