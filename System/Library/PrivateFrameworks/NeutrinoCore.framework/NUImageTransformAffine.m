@interface NUImageTransformAffine
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToGeometryTransformAffine:(id)a3;
- (BOOL)isIdentityImageTransform;
- (CGAffineTransform)transform;
- (CGPoint)transformPoint:(CGPoint)a3;
- (NUImageTransformAffine)init;
- (NUImageTransformAffine)initWithAffineTransform:(CGAffineTransform *)a3;
- (id)description;
- (id)inverseTransform;
- (id)transformByRotateZ:(double)a3;
- (id)transformByScaleX:(double)a3 scaleY:(double)a4;
- (id)transformByTranslateX:(double)a3 translateY:(double)a4;
- (unint64_t)hash;
- (void)nu_updateDigest:(id)a3;
- (void)transformMatrix:(_OWORD *)a3@<X8>;
@end

@implementation NUImageTransformAffine

- (CGAffineTransform)transform
{
  objc_copyStruct(retstr, &self->_transform, 48, 1, 0);
  return result;
}

- (void)nu_updateDigest:(id)a3
{
  id v4 = a3;
  [v4 addCString:"NUImageTransformAffine"];
  [v4 addBytes:&self->_transform length:48];
}

- (BOOL)isEqualToGeometryTransformAffine:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = (char *)a3;
  if (!v4)
  {
    v11 = NUAssertLogger_19081();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "other != nil");
      LODWORD(t1.a) = 138543362;
      *(void *)((char *)&t1.a + 4) = v12;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&t1, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v14 = NUAssertLogger_19081();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        v18 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v19 = (void *)MEMORY[0x1E4F29060];
        id v20 = v18;
        v21 = [v19 callStackSymbols];
        v22 = [v21 componentsJoinedByString:@"\n"];
        LODWORD(t1.a) = 138543618;
        *(void *)((char *)&t1.a + 4) = v18;
        WORD2(t1.b) = 2114;
        *(void *)((char *)&t1.b + 6) = v22;
        _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&t1, 0x16u);
      }
    }
    else if (v15)
    {
      v16 = [MEMORY[0x1E4F29060] callStackSymbols];
      v17 = [v16 componentsJoinedByString:@"\n"];
      LODWORD(t1.a) = 138543362;
      *(void *)((char *)&t1.a + 4) = v17;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&t1, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUImageTransformAffine isEqualToGeometryTransformAffine:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/transforms/NUGeometryTransform.m", 242, @"Invalid parameter not satisfying: %s", v23, v24, v25, v26, (uint64_t)"other != nil");
  }
  v5 = v4;
  long long v6 = *(_OWORD *)&self->_transform.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&self->_transform.a;
  *(_OWORD *)&t1.c = v6;
  *(_OWORD *)&t1.tx = *(_OWORD *)&self->_transform.tx;
  long long v7 = *(_OWORD *)(v4 + 56);
  long long v8 = *(_OWORD *)(v4 + 88);
  *(_OWORD *)&t2.c = *(_OWORD *)(v4 + 72);
  *(_OWORD *)&t2.tx = v8;
  *(_OWORD *)&t2.a = v7;
  BOOL v9 = CGAffineTransformEqualToTransform(&t1, &t2);

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (NUImageTransformAffine *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(NUImageTransformAffine *)self isEqualToGeometryTransformAffine:v4];
  }

  return v5;
}

- (unint64_t)hash
{
  v2 = [NSNumber numberWithDouble:self->_transform.a+ self->_transform.b+ self->_transform.b+ self->_transform.c * 3.0+ self->_transform.d * 5.0+ self->_transform.tx * 7.0+ self->_transform.ty * 11.0];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"NUImageTransformAffine  a=%f b=%f c=%f d=%f tx=%f ty=%f", *(void *)&self->_transform.a, *(void *)&self->_transform.b, *(void *)&self->_transform.c, *(void *)&self->_transform.d, *(void *)&self->_transform.tx, *(void *)&self->_transform.ty);
}

- (id)transformByRotateZ:(double)a3
{
  long long v3 = *(_OWORD *)&self->_transform.c;
  *(_OWORD *)&v7.a = *(_OWORD *)&self->_transform.a;
  *(_OWORD *)&v7.c = v3;
  *(_OWORD *)&v7.tx = *(_OWORD *)&self->_transform.tx;
  memset(&v8, 0, sizeof(v8));
  CGAffineTransformRotate(&v8, &v7, a3 * 3.14159265 / 180.0);
  id v4 = [NUImageTransformAffine alloc];
  CGAffineTransform v7 = v8;
  BOOL v5 = [(NUImageTransformAffine *)v4 initWithAffineTransform:&v7];

  return v5;
}

- (id)transformByTranslateX:(double)a3 translateY:(double)a4
{
  long long v4 = *(_OWORD *)&self->_transform.c;
  *(_OWORD *)&v8.a = *(_OWORD *)&self->_transform.a;
  *(_OWORD *)&v8.c = v4;
  *(_OWORD *)&v8.tx = *(_OWORD *)&self->_transform.tx;
  memset(&v9, 0, sizeof(v9));
  CGAffineTransformTranslate(&v9, &v8, a3, a4);
  BOOL v5 = [NUImageTransformAffine alloc];
  CGAffineTransform v8 = v9;
  long long v6 = [(NUImageTransformAffine *)v5 initWithAffineTransform:&v8];

  return v6;
}

- (id)transformByScaleX:(double)a3 scaleY:(double)a4
{
  long long v4 = *(_OWORD *)&self->_transform.c;
  *(_OWORD *)&v8.a = *(_OWORD *)&self->_transform.a;
  *(_OWORD *)&v8.c = v4;
  *(_OWORD *)&v8.tx = *(_OWORD *)&self->_transform.tx;
  memset(&v9, 0, sizeof(v9));
  CGAffineTransformScale(&v9, &v8, a3, a4);
  BOOL v5 = [NUImageTransformAffine alloc];
  CGAffineTransform v8 = v9;
  long long v6 = [(NUImageTransformAffine *)v5 initWithAffineTransform:&v8];

  return v6;
}

- (void)transformMatrix:(_OWORD *)a3@<X8>
{
  uint64_t v3 = 0;
  *(void *)&long long v4 = result[8];
  *((void *)&v4 + 1) = result[10];
  *(void *)&long long v5 = 0;
  *((void *)&v5 + 1) = result[12];
  float64x2_t v7 = *a2;
  float64x2_t v6 = a2[1];
  float64x2_t v9 = a2[2];
  float64x2_t v8 = a2[3];
  float64x2_t v11 = a2[4];
  float64x2_t v10 = a2[5];
  float64x2_t v13 = a2[6];
  float64x2_t v12 = a2[7];
  v19[2] = v4;
  v19[3] = v5;
  long long v14 = *(_OWORD *)(MEMORY[0x1E4F14990] + 80);
  v19[4] = *(_OWORD *)(MEMORY[0x1E4F14990] + 64);
  v19[5] = v14;
  long long v15 = *(_OWORD *)(MEMORY[0x1E4F14990] + 112);
  v19[6] = *(_OWORD *)(MEMORY[0x1E4F14990] + 96);
  v19[7] = v15;
  *a3 = 0u;
  a3[1] = 0u;
  a3[2] = 0u;
  a3[3] = 0u;
  a3[4] = 0u;
  a3[5] = 0u;
  a3[6] = 0u;
  a3[7] = 0u;
  do
  {
    float64x2_t v17 = (float64x2_t)v19[v3];
    float64x2_t v16 = (float64x2_t)v19[v3 + 1];
    v18 = (float64x2_t *)&a3[v3];
    float64x2_t *v18 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v7, v17.f64[0]), v9, v17, 1), v11, v16.f64[0]), v13, v16, 1);
    v18[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v6, v17.f64[0]), v8, v17, 1), v10, v16.f64[0]), v12, v16, 1);
    v3 += 2;
  }
  while (v3 != 8);
  return result;
}

- (BOOL)isIdentityImageTransform
{
  long long v2 = *(_OWORD *)&self->_transform.c;
  *(_OWORD *)&v4.a = *(_OWORD *)&self->_transform.a;
  *(_OWORD *)&v4.c = v2;
  *(_OWORD *)&v4.tx = *(_OWORD *)&self->_transform.tx;
  return CGAffineTransformIsIdentity(&v4);
}

- (CGPoint)transformPoint:(CGPoint)a3
{
  float64x2_t v3 = vaddq_f64(*(float64x2_t *)&self->_transform.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&self->_transform.c, a3.y), *(float64x2_t *)&self->_transform.a, a3.x));
  double v4 = v3.f64[1];
  result.x = v3.f64[0];
  result.y = v4;
  return result;
}

- (id)inverseTransform
{
  float64x2_t v3 = [NUImageTransformAffine alloc];
  long long v4 = *(_OWORD *)&self->_transformInv.c;
  v7[0] = *(_OWORD *)&self->_transformInv.a;
  v7[1] = v4;
  v7[2] = *(_OWORD *)&self->_transformInv.tx;
  long long v5 = [(NUImageTransformAffine *)v3 initWithAffineTransform:v7];

  return v5;
}

- (NUImageTransformAffine)init
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_19038);
  }
  float64x2_t v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    long long v4 = NSString;
    long long v5 = v3;
    float64x2_t v6 = (objc_class *)objc_opt_class();
    float64x2_t v7 = NSStringFromClass(v6);
    float64x2_t v8 = NSStringFromSelector(a2);
    float64x2_t v9 = [v4 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v7, v8];
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = v9;
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
    float64x2_t v11 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    float64x2_t v12 = (void *)MEMORY[0x1E4F29060];
    float64x2_t v13 = v11;
    long long v14 = [v12 callStackSymbols];
    long long v15 = [v14 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = v15;
    _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  float64x2_t v16 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v18 = (void *)MEMORY[0x1E4F29060];
  id v19 = specific;
  float64x2_t v13 = v16;
  id v20 = [v18 callStackSymbols];
  v21 = [v20 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  uint64_t v29 = specific;
  __int16 v30 = 2114;
  v31 = v21;
  _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v22 = (objc_class *)objc_opt_class();
  uint64_t v23 = NSStringFromClass(v22);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUImageTransformAffine init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/transforms/NUGeometryTransform.m", 163, @"Initializer not available: -[%@ %@], use designated initializer instead.", v24, v25, v26, v27, v23);
}

- (NUImageTransformAffine)initWithAffineTransform:(CGAffineTransform *)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  long long v5 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t1.c = v5;
  *(_OWORD *)&t1.tx = *(_OWORD *)&a3->tx;
  float64x2_t v6 = (long long *)MEMORY[0x1E4F1DAB8];
  long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&t2.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&t2.c = v7;
  *(_OWORD *)&t2.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  BOOL v8 = CGAffineTransformEqualToTransform(&t1, &t2);
  v40.receiver = self;
  v40.super_class = (Class)NUImageTransformAffine;
  float64x2_t v9 = [(NUImageTransformAffine *)&v40 init];
  uint64_t v10 = v9;
  if (v9)
  {
    long long v12 = *(_OWORD *)&a3->c;
    long long v11 = *(_OWORD *)&a3->tx;
    *(_OWORD *)(v9 + 56) = *(_OWORD *)&a3->a;
    *(_OWORD *)(v9 + 72) = v12;
    *(_OWORD *)(v9 + 88) = v11;
    float64x2_t v13 = v9 + 8;
    if (v8)
    {
      long long v14 = *v6;
      long long v15 = v6[2];
      *(_OWORD *)(v9 + 24) = v6[1];
      *(_OWORD *)(v9 + 40) = v15;
      *float64x2_t v13 = v14;
      return (NUImageTransformAffine *)v10;
    }
    long long v16 = *(_OWORD *)&a3->c;
    *(_OWORD *)&t2.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&t2.c = v16;
    *(_OWORD *)&t2.tx = *(_OWORD *)&a3->tx;
    CGAffineTransformInvert(&t1, &t2);
    long long v17 = *(_OWORD *)&t1.a;
    long long v18 = *(_OWORD *)&t1.tx;
    *(_OWORD *)(v10 + 24) = *(_OWORD *)&t1.c;
    *(_OWORD *)(v10 + 40) = v18;
    *float64x2_t v13 = v17;
    if (fabs(*((double *)v10 + 1) * *((double *)v10 + 4) - *((double *)v10 + 2) * *((double *)v10 + 3)) > 1.0e-12) {
      return (NUImageTransformAffine *)v10;
    }
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_19038);
    }
    id v19 = (void *)_NUAssertLogger;
    if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = NSString;
      v21 = v19;
      v22 = [v20 stringWithFormat:@"Supplied transform is not invertible"];
      LODWORD(t1.a) = 138543362;
      *(void *)((char *)&t1.a + 4) = v22;
      _os_log_impl(&dword_1A9892000, v21, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", (uint8_t *)&t1, 0xCu);

      uint64_t v23 = _NULogOnceToken;
      if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
      {
        if (v23 != -1) {
          dispatch_once(&_NULogOnceToken, &__block_literal_global_19038);
        }
LABEL_12:
        uint64_t v24 = (void *)_NUAssertLogger;
        if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
        {
          specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          __int16 v30 = (void *)MEMORY[0x1E4F29060];
          id v31 = specific;
          uint64_t v32 = v24;
          v33 = [v30 callStackSymbols];
          v34 = [v33 componentsJoinedByString:@"\n"];
          LODWORD(t1.a) = 138543618;
          *(void *)((char *)&t1.a + 4) = specific;
          WORD2(t1.b) = 2114;
          *(void *)((char *)&t1.b + 6) = v34;
          _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&t1, 0x16u);

LABEL_20:
          goto LABEL_17;
        }
        goto LABEL_17;
      }
      if (v23 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_19038);
      }
    }
    else if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      goto LABEL_12;
    }
    v35 = (void *)_NUAssertLogger;
    if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    {
      v37 = (void *)MEMORY[0x1E4F29060];
      uint64_t v32 = v35;
      v38 = [v37 callStackSymbols];
      v39 = [v38 componentsJoinedByString:@"\n"];
      LODWORD(t1.a) = 138543362;
      *(void *)((char *)&t1.a + 4) = v39;
      _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&t1, 0xCu);

      goto LABEL_20;
    }
LABEL_17:
    _NUAssertContinueHandler((uint64_t)"-[NUImageTransformAffine initWithAffineTransform:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/transforms/NUGeometryTransform.m", 154, @"Supplied transform is not invertible", v25, v26, v27, v28, (uint64_t)v40.receiver);
  }
  return (NUImageTransformAffine *)v10;
}

@end