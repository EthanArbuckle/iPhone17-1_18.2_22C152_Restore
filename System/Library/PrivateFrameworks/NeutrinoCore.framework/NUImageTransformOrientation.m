@interface NUImageTransformOrientation
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToGeometryTransformOrientation:(id)a3;
- (BOOL)isIdentityImageTransform;
- (CGAffineTransform)transformMatrix:(_OWORD *)a3@<X8>;
- (CGPoint)transformPoint:(CGPoint)a3;
- (NUImageTransformOrientation)init;
- (NUImageTransformOrientation)initWithOrientation:(int64_t)a3 imageSize:(id)a4;
- (NUImageTransformOrientation)initWithOrientation:(int64_t)a3 imageSize:(id)a4 imageOrigin:(id)a5;
- (id)description;
- (id)inverseTransform;
- (int64_t)orientation;
- (unint64_t)hash;
- (void)nu_updateDigest:(id)a3;
@end

@implementation NUImageTransformOrientation

- (int64_t)orientation
{
  return self->_orientation;
}

- (id)description
{
  v2 = NSString;
  int64_t orientation = self->_orientation;
  if ((unint64_t)(orientation - 9) < 0xFFFFFFFFFFFFFFF8) {
    int64_t orientation = 0;
  }
  v4 = *(&NUOrientationName_names + orientation);
  v5 = [v2 stringWithFormat:@"NUImageTransformOrientation: %@", v4];

  return v5;
}

- (void)nu_updateDigest:(id)a3
{
  id v4 = a3;
  [v4 addCString:"NUImageTransformOrientation"];
  [v4 addBytes:&self->_orientation length:8];
}

- (BOOL)isEqualToGeometryTransformOrientation:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v7 = NUAssertLogger_19081();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "other != nil");
      *(_DWORD *)buf = 138543362;
      v24 = v8;
      _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v10 = NUAssertLogger_19081();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        v14 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v15 = (void *)MEMORY[0x1E4F29060];
        id v16 = v14;
        v17 = [v15 callStackSymbols];
        v18 = [v17 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v24 = v14;
        __int16 v25 = 2114;
        v26 = v18;
        _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v11)
    {
      v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v24 = v13;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUImageTransformOrientation isEqualToGeometryTransformOrientation:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/transforms/NUGeometryTransform.m", 594, @"Invalid parameter not satisfying: %s", v19, v20, v21, v22, (uint64_t)"other != nil");
  }
  BOOL v5 = self->_orientation == v4[5];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (NUImageTransformOrientation *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(NUImageTransformOrientation *)self isEqualToGeometryTransformOrientation:v4];
  }

  return v5;
}

- (unint64_t)hash
{
  return 0xF012E5E162C2FLL * self->_orientation;
}

- (BOOL)isIdentityImageTransform
{
  memset(&v4, 0, sizeof(v4));
  NUOrientationMakeTransformWithSizeAndOrigin(self->_orientation, self->_inputImageSize.width, self->_inputImageSize.height, self->_inputImageOrigin.x, self->_inputImageOrigin.y, (uint64_t)&v4);
  CGAffineTransform v3 = v4;
  return CGAffineTransformIsIdentity(&v3);
}

- (CGAffineTransform)transformMatrix:(_OWORD *)a3@<X8>
{
  long long v26 = 0u;
  long long v27 = 0u;
  long long v25 = 0u;
  result = NUOrientationMakeTransformWithSizeAndOrigin(a1[5], a1[1], a1[2], a1[3], a1[4], (uint64_t)&v25);
  uint64_t v6 = 0;
  *(void *)&long long v8 = *((void *)&v25 + 1);
  *(void *)&long long v7 = v25;
  *((void *)&v7 + 1) = v26;
  *(void *)&long long v9 = 0;
  *((void *)&v9 + 1) = v27;
  *((void *)&v8 + 1) = *((void *)&v26 + 1);
  *(void *)&long long v10 = 0;
  *((void *)&v10 + 1) = *((void *)&v27 + 1);
  float64x2_t v12 = *a2;
  float64x2_t v11 = a2[1];
  float64x2_t v14 = a2[2];
  float64x2_t v13 = a2[3];
  float64x2_t v16 = a2[4];
  float64x2_t v15 = a2[5];
  float64x2_t v18 = a2[6];
  float64x2_t v17 = a2[7];
  v24[0] = v7;
  v24[1] = v9;
  v24[2] = v8;
  v24[3] = v10;
  long long v19 = *(_OWORD *)(MEMORY[0x1E4F14990] + 80);
  v24[4] = *(_OWORD *)(MEMORY[0x1E4F14990] + 64);
  v24[5] = v19;
  long long v20 = *(_OWORD *)(MEMORY[0x1E4F14990] + 112);
  v24[6] = *(_OWORD *)(MEMORY[0x1E4F14990] + 96);
  v24[7] = v20;
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
    float64x2_t v22 = (float64x2_t)v24[v6];
    float64x2_t v21 = (float64x2_t)v24[v6 + 1];
    v23 = (float64x2_t *)&a3[v6];
    float64x2_t *v23 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v12, v22.f64[0]), v14, v22, 1), v16, v21.f64[0]), v18, v21, 1);
    v23[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v11, v22.f64[0]), v13, v22, 1), v15, v21.f64[0]), v17, v21, 1);
    v6 += 2;
  }
  while (v6 != 8);
  return result;
}

- (CGPoint)transformPoint:(CGPoint)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  int64_t width = self->_inputImageSize.width;
  if (width < 1 || (int64_t height = self->_inputImageSize.height, height <= 0))
  {
    long long v10 = NUAssertLogger_19081();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      float64x2_t v11 = [NSString stringWithFormat:@"invalid image size"];
      LODWORD(buf[0].f64[0]) = 138543362;
      *(void *)((char *)buf[0].f64 + 4) = v11;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    float64x2_t v13 = NUAssertLogger_19081();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        float64x2_t v17 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        float64x2_t v18 = (void *)MEMORY[0x1E4F29060];
        id v19 = v17;
        long long v20 = [v18 callStackSymbols];
        float64x2_t v21 = [v20 componentsJoinedByString:@"\n"];
        LODWORD(buf[0].f64[0]) = 138543618;
        *(void *)((char *)buf[0].f64 + 4) = v17;
        WORD2(buf[0].f64[1]) = 2114;
        *(void *)((char *)&buf[0].f64[1] + 6) = v21;
        _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)buf, 0x16u);
      }
    }
    else if (v14)
    {
      float64x2_t v15 = [MEMORY[0x1E4F29060] callStackSymbols];
      float64x2_t v16 = [v15 componentsJoinedByString:@"\n"];
      LODWORD(buf[0].f64[0]) = 138543362;
      *(void *)((char *)buf[0].f64 + 4) = v16;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUImageTransformOrientation transformPoint:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/transforms/NUGeometryTransform.m", 551, @"invalid image size", v22, v23, v24, v25, v26);
  }
  double y = a3.y;
  double x = a3.x;
  int64_t orientation = self->_orientation;
  int64_t v6 = self->_inputImageOrigin.x;
  int64_t v7 = self->_inputImageOrigin.y;
  float64x2_t v30 = 0u;
  memset(buf, 0, sizeof(buf));
  NUOrientationMakeTransformWithSizeAndOrigin(orientation, width, height, v6, v7, (uint64_t)buf);
  float64x2_t v8 = vaddq_f64(v30, vmlaq_n_f64(vmulq_n_f64(buf[1], y), buf[0], x));
  double v9 = v8.f64[1];
  result.double x = v8.f64[0];
  result.double y = v9;
  return result;
}

- (id)inverseTransform
{
  int64_t orientation = self->_orientation;
  int64_t v4 = 6;
  if (orientation != 8) {
    int64_t v4 = self->_orientation;
  }
  if (orientation == 6) {
    uint64_t v5 = 8;
  }
  else {
    uint64_t v5 = v4;
  }
  uint64_t v7 = NUOrientationTransformImageSize(v5, self->_inputImageSize.width, self->_inputImageSize.height);
  int64_t x = self->_inputImageOrigin.x;
  int64_t y = self->_inputImageOrigin.y;
  if ((unint64_t)(v5 - 5) >= 4) {
    int64_t v10 = self->_inputImageOrigin.x;
  }
  else {
    int64_t v10 = self->_inputImageOrigin.y;
  }
  if ((unint64_t)(v5 - 5) >= 4) {
    int64_t v11 = y;
  }
  else {
    int64_t v11 = x;
  }
  float64x2_t v12 = -[NUImageTransformOrientation initWithOrientation:imageSize:imageOrigin:]([NUImageTransformOrientation alloc], "initWithOrientation:imageSize:imageOrigin:", v5, v7, v6, v10, v11);

  return v12;
}

- (NUImageTransformOrientation)initWithOrientation:(int64_t)a3 imageSize:(id)a4 imageOrigin:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)(a3 - 1) >= 8)
  {
    int64_t v11 = NUAssertLogger_19081();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      float64x2_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "NUOrientationIsValid(orientation)");
      *(_DWORD *)buf = 138543362;
      v29 = v12;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v14 = NUAssertLogger_19081();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        float64x2_t v18 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v19 = (void *)MEMORY[0x1E4F29060];
        id v20 = v18;
        float64x2_t v21 = [v19 callStackSymbols];
        uint64_t v22 = [v21 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v29 = v18;
        __int16 v30 = 2114;
        uint64_t v31 = v22;
        _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v15)
    {
      float64x2_t v16 = [MEMORY[0x1E4F29060] callStackSymbols];
      float64x2_t v17 = [v16 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v29 = v17;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUImageTransformOrientation initWithOrientation:imageSize:imageOrigin:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/transforms/NUGeometryTransform.m", 527, @"Invalid parameter not satisfying: %s", v23, v24, v25, v26, (uint64_t)"NUOrientationIsValid(orientation)");
  }
  int64_t var1 = a5.var1;
  int64_t var0 = a5.var0;
  int64_t v7 = a4.var1;
  int64_t v8 = a4.var0;
  v27.receiver = self;
  v27.super_class = (Class)NUImageTransformOrientation;
  CGPoint result = [(NUImageTransformOrientation *)&v27 init];
  result->_inputImageSize.int64_t width = v8;
  result->_inputImageSize.int64_t height = v7;
  result->_inputImageOrigin.int64_t x = var0;
  result->_inputImageOrigin.int64_t y = var1;
  result->_int64_t orientation = a3;
  return result;
}

- (NUImageTransformOrientation)initWithOrientation:(int64_t)a3 imageSize:(id)a4
{
  return -[NUImageTransformOrientation initWithOrientation:imageSize:imageOrigin:](self, "initWithOrientation:imageSize:imageOrigin:", a3, a4.var0, a4.var1, 0, 0);
}

- (NUImageTransformOrientation)init
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_19038);
  }
  v2 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    CGAffineTransform v3 = NSString;
    int64_t v4 = v2;
    uint64_t v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    int64_t v7 = [v3 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v6];
    *(_DWORD *)buf = 138543362;
    objc_super v27 = v7;
    _os_log_error_impl(&dword_1A9892000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v8 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v8 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_19038);
      }
      goto LABEL_8;
    }
    if (v8 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_19038);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    double v9 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    int64_t v10 = (void *)MEMORY[0x1E4F29060];
    int64_t v11 = v9;
    float64x2_t v12 = [v10 callStackSymbols];
    float64x2_t v13 = [v12 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    objc_super v27 = v13;
    _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  BOOL v14 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  float64x2_t v16 = (void *)MEMORY[0x1E4F29060];
  id v17 = specific;
  int64_t v11 = v14;
  float64x2_t v18 = [v16 callStackSymbols];
  id v19 = [v18 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  objc_super v27 = specific;
  __int16 v28 = 2114;
  v29 = v19;
  _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  id v20 = (objc_class *)objc_opt_class();
  uint64_t v21 = NSStringFromClass(v20);
  _NUAssertFailHandler((uint64_t)"-[NUImageTransformOrientation init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/transforms/NUGeometryTransform.m", 518, @"This is an abstract method! Subclass '%@' should provide concrete implementation", v22, v23, v24, v25, v21);
}

@end