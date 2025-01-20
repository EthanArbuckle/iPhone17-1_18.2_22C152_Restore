@interface NUTimeTransformSlowMo
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)transformTime:(SEL)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInverse;
- (NUSlowMotionTimeRangeMapper)timeMapper;
- (NUTimeTransformSlowMo)init;
- (NUTimeTransformSlowMo)initWithSlowMoBeginTime:(id *)a3 endTime:(id *)a4 rate:(float)a5 assetDuration:(double)a6;
- (NUTimeTransformSlowMo)initWithSlowMoTimeMapper:(id)a3 isInverse:(BOOL)a4;
- (id)description;
- (id)inverseTransform;
- (unint64_t)hash;
@end

@implementation NUTimeTransformSlowMo

- (void).cxx_destruct
{
}

- (NUSlowMotionTimeRangeMapper)timeMapper
{
  return self->_timeMapper;
}

- (BOOL)isInverse
{
  return self->_isInverse;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (NUTimeTransformSlowMo *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      timeMapper = self->_timeMapper;
      v7 = [(NUTimeTransformSlowMo *)v5 timeMapper];
      if (timeMapper == v7)
      {
        BOOL isInverse = self->_isInverse;
        BOOL v8 = isInverse == [(NUTimeTransformSlowMo *)v5 isInverse];
      }
      else
      {
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  return (0x224CB1CC7EE42FLL * (uint64_t)self->_timeMapper) ^ (0x107A5804BC1A2BLL * self->_isInverse);
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"NUTimeTransformSlowMo timeMapper=%@ isInverse=%d", self->_timeMapper, self->_isInverse];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)transformTime:(SEL)a3
{
  timeMapper = self->_timeMapper;
  if (self->_isInverse)
  {
    CMTime v10 = *(CMTime *)a4;
    Float64 Seconds = CMTimeGetSeconds(&v10);
    *(float *)&Float64 Seconds = Seconds;
    [(NUSlowMotionTimeRangeMapper *)timeMapper originalTimeForScaledTime:Seconds];
  }
  else
  {
    CMTime v10 = *(CMTime *)a4;
    Float64 v8 = CMTimeGetSeconds(&v10);
    *(float *)&Float64 v8 = v8;
    [(NUSlowMotionTimeRangeMapper *)timeMapper scaledTimeForOriginalTime:v8];
  }
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMakeWithSeconds((CMTime *)retstr, v7, 1000000);
}

- (id)inverseTransform
{
  v2 = self;
  v3 = [(NUTimeTransformSlowMo *)v2 initWithSlowMoTimeMapper:v2->_timeMapper isInverse:!v2->_isInverse];

  return v3;
}

- (NUTimeTransformSlowMo)init
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_19038);
  }
  v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v4 = NSString;
    v5 = v3;
    v6 = (objc_class *)objc_opt_class();
    float v7 = NSStringFromClass(v6);
    Float64 v8 = NSStringFromSelector(a2);
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
  _NUAssertFailHandler((uint64_t)"-[NUTimeTransformSlowMo init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/transforms/NUGeometryTransform.m", 717, @"Initializer not available: -[%@ %@], use designated initializer instead.", v24, v25, v26, v27, v23);
}

- (NUTimeTransformSlowMo)initWithSlowMoTimeMapper:(id)a3 isInverse:(BOOL)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NUTimeTransformSlowMo;
  Float64 v8 = [(NUTimeTransformSlowMo *)&v13 init];
  v9 = v8;
  if (v8
    && (v8->_BOOL isInverse = a4,
        p_timeMapper = &v8->_timeMapper,
        objc_storeStrong((id *)&v8->_timeMapper, a3),
        !*p_timeMapper))
  {
    v11 = 0;
  }
  else
  {
    v11 = v9;
  }

  return v11;
}

- (NUTimeTransformSlowMo)initWithSlowMoBeginTime:(id *)a3 endTime:(id *)a4 rate:(float)a5 assetDuration:(double)a6
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  memset(&v20, 0, sizeof(v20));
  lhs.start = (CMTime)*a4;
  CMTime rhs = *(CMTime *)a3;
  CMTimeSubtract(&duration, &lhs.start, &rhs);
  lhs.start = (CMTime)*a3;
  CMTimeRangeMake(&v20, &lhs.start, &duration);
  id v17 = 0;
  CMTimeRange lhs = v20;
  uint64_t v10 = +[NUSlowMotionUtilities timeMapperForAssetDuration:&lhs rate:&v17 range:a6 error:COERCE_DOUBLE(__PAIR64__(HIDWORD(v20.start.epoch), LODWORD(a5)))];
  id v11 = v17;
  if (v11)
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_179);
    }
    v12 = (void *)_NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_DEBUG))
    {
      v15 = v12;
      v16 = [v11 description];
      LODWORD(lhs.start.value) = 138412290;
      *(CMTimeValue *)((char *)&lhs.start.value + 4) = (CMTimeValue)v16;
      _os_log_debug_impl(&dword_1A9892000, v15, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&lhs, 0xCu);
    }
  }
  objc_super v13 = [(NUTimeTransformSlowMo *)self initWithSlowMoTimeMapper:v10 isInverse:0];

  return v13;
}

@end