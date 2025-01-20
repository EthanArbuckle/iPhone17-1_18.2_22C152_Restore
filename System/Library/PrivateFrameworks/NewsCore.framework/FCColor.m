@interface FCColor
+ (BOOL)supportsSecureCoding;
+ (FCColor)colorWithHexString:(id)a3;
+ (FCColor)colorWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6;
+ (id)blackColor;
+ (id)clearColor;
+ (id)nullableColorWithHexString:(id)a3;
+ (id)whiteColor;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSimilarToColor:(id)a3 withinPercentage:(double)a4;
- (FCColor)init;
- (FCColor)initWithCoder:(id)a3;
- (FCColor)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6;
- (NSString)hex;
- (double)alpha;
- (double)blue;
- (double)green;
- (double)red;
- (id)legibleColor;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)readDeconstructedRepresentationWithAcccessor:(id)a3;
@end

@implementation FCColor

uint64_t __38__FCColor_nullableColorWithHexString___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  uint64_t v6 = [objc_alloc((Class)objc_opt_class()) initWithRed:a2 green:a3 blue:a4 alpha:a5];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void *)(v7 + 40);
  *(void *)(v7 + 40) = v6;
  return MEMORY[0x1F41817F8](v6, v8);
}

- (FCColor)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a3 < 0.0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v12 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "red >= 0");
    *(_DWORD *)buf = 136315906;
    v18 = "-[FCColor initWithRed:green:blue:alpha:]";
    __int16 v19 = 2080;
    v20 = "FCColor.m";
    __int16 v21 = 1024;
    int v22 = 82;
    __int16 v23 = 2114;
    v24 = v12;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  if (a4 < 0.0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v13 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "green >= 0");
    *(_DWORD *)buf = 136315906;
    v18 = "-[FCColor initWithRed:green:blue:alpha:]";
    __int16 v19 = 2080;
    v20 = "FCColor.m";
    __int16 v21 = 1024;
    int v22 = 83;
    __int16 v23 = 2114;
    v24 = v13;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  if (a5 < 0.0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v14 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "blue >= 0");
    *(_DWORD *)buf = 136315906;
    v18 = "-[FCColor initWithRed:green:blue:alpha:]";
    __int16 v19 = 2080;
    v20 = "FCColor.m";
    __int16 v21 = 1024;
    int v22 = 84;
    __int16 v23 = 2114;
    v24 = v14;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  if (a6 < 0.0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v15 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "alpha >= 0");
    *(_DWORD *)buf = 136315906;
    v18 = "-[FCColor initWithRed:green:blue:alpha:]";
    __int16 v19 = 2080;
    v20 = "FCColor.m";
    __int16 v21 = 1024;
    int v22 = 85;
    __int16 v23 = 2114;
    v24 = v15;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v16.receiver = self;
  v16.super_class = (Class)FCColor;
  result = [(FCColor *)&v16 init];
  if (result)
  {
    result->_red = a3;
    result->_green = a4;
    result->_blue = a5;
    result->_alpha = a6;
  }
  return result;
}

uint64_t __30__FCColor_colorWithHexString___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  uint64_t v6 = [objc_alloc((Class)objc_opt_class()) initWithRed:a2 green:a3 blue:a4 alpha:a5];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void *)(v7 + 40);
  *(void *)(v7 + 40) = v6;
  return MEMORY[0x1F41817F8](v6, v8);
}

+ (id)whiteColor
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __21__FCColor_whiteColor__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB5D1078 != -1) {
    dispatch_once(&qword_1EB5D1078, block);
  }
  v2 = (void *)_MergedGlobals_145;
  return v2;
}

+ (FCColor)colorWithHexString:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__8;
  v14 = __Block_byref_object_dispose__8;
  id v15 = 0;
  if (objc_msgSend(v4, "fc_isValidColorHexString"))
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __30__FCColor_colorWithHexString___block_invoke;
    v9[3] = &unk_1E5B4D950;
    v9[4] = &v10;
    v9[5] = a1;
    FCDeconstructHexStringWithBlock(v4, v9);
  }
  else
  {
    uint64_t v5 = [objc_alloc((Class)objc_opt_class()) initWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
    uint64_t v6 = (void *)v11[5];
    v11[5] = v5;
  }
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return (FCColor *)v7;
}

+ (id)nullableColorWithHexString:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__8;
  uint64_t v12 = __Block_byref_object_dispose__8;
  id v13 = 0;
  if (objc_msgSend(v4, "fc_isValidColorHexString"))
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __38__FCColor_nullableColorWithHexString___block_invoke;
    v7[3] = &unk_1E5B4D950;
    v7[4] = &v8;
    v7[5] = a1;
    FCDeconstructHexStringWithBlock(v4, v7);
  }
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __21__FCColor_whiteColor__block_invoke()
{
  _MergedGlobals_145 = [objc_alloc((Class)objc_opt_class()) initWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
  return MEMORY[0x1F41817F8]();
}

- (FCColor)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    uint64_t v8 = "-[FCColor init]";
    __int16 v9 = 2080;
    uint64_t v10 = "FCColor.m";
    __int16 v11 = 1024;
    int v12 = 77;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCColor init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

+ (FCColor)colorWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a3 < 0.0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v13 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "red >= 0");
    *(_DWORD *)buf = 136315906;
    v18 = "+[FCColor colorWithRed:green:blue:alpha:]";
    __int16 v19 = 2080;
    v20 = "FCColor.m";
    __int16 v21 = 1024;
    int v22 = 100;
    __int16 v23 = 2114;
    v24 = v13;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  if (a4 < 0.0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v14 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "green >= 0");
    *(_DWORD *)buf = 136315906;
    v18 = "+[FCColor colorWithRed:green:blue:alpha:]";
    __int16 v19 = 2080;
    v20 = "FCColor.m";
    __int16 v21 = 1024;
    int v22 = 101;
    __int16 v23 = 2114;
    v24 = v14;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  if (a5 < 0.0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v15 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "blue >= 0");
    *(_DWORD *)buf = 136315906;
    v18 = "+[FCColor colorWithRed:green:blue:alpha:]";
    __int16 v19 = 2080;
    v20 = "FCColor.m";
    __int16 v21 = 1024;
    int v22 = 102;
    __int16 v23 = 2114;
    v24 = v15;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  if (a6 < 0.0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    objc_super v16 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "alpha >= 0");
    *(_DWORD *)buf = 136315906;
    v18 = "+[FCColor colorWithRed:green:blue:alpha:]";
    __int16 v19 = 2080;
    v20 = "FCColor.m";
    __int16 v21 = 1024;
    int v22 = 103;
    __int16 v23 = 2114;
    v24 = v16;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  __int16 v11 = (void *)[objc_alloc((Class)a1) initWithRed:a3 green:a4 blue:a5 alpha:a6];
  return (FCColor *)v11;
}

+ (id)blackColor
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __21__FCColor_blackColor__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB5D1088 != -1) {
    dispatch_once(&qword_1EB5D1088, block);
  }
  v2 = (void *)qword_1EB5D1080;
  return v2;
}

uint64_t __21__FCColor_blackColor__block_invoke()
{
  uint64_t v0 = [objc_alloc((Class)objc_opt_class()) initWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
  uint64_t v1 = qword_1EB5D1080;
  qword_1EB5D1080 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)clearColor
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __21__FCColor_clearColor__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB5D1098 != -1) {
    dispatch_once(&qword_1EB5D1098, block);
  }
  v2 = (void *)qword_1EB5D1090;
  return v2;
}

uint64_t __21__FCColor_clearColor__block_invoke()
{
  uint64_t v0 = [objc_alloc((Class)objc_opt_class()) initWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
  uint64_t v1 = qword_1EB5D1090;
  qword_1EB5D1090 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (void)readDeconstructedRepresentationWithAcccessor:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(void, double, double, double, double))a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v12 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "accessor");
    *(_DWORD *)buf = 136315906;
    v14 = "-[FCColor readDeconstructedRepresentationWithAcccessor:]";
    __int16 v15 = 2080;
    objc_super v16 = "FCColor.m";
    __int16 v17 = 1024;
    int v18 = 173;
    __int16 v19 = 2114;
    v20 = v12;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  [(FCColor *)self red];
  double v6 = v5;
  [(FCColor *)self green];
  double v8 = v7;
  [(FCColor *)self blue];
  double v10 = v9;
  [(FCColor *)self alpha];
  v4[2](v4, v6, v8, v10, v11);
}

- (BOOL)isSimilarToColor:(id)a3 withinPercentage:(double)a4
{
  id v6 = a3;
  if (!v6)
  {
LABEL_7:
    BOOL v7 = 0;
    goto LABEL_8;
  }
  if (a4 >= 0.00000011920929)
  {
    [(FCColor *)self red];
    double v9 = v8;
    [v6 red];
    if (vabdd_f64(v9, v10) <= a4)
    {
      [(FCColor *)self green];
      double v12 = v11;
      [v6 green];
      if (vabdd_f64(v12, v13) <= a4)
      {
        [(FCColor *)self blue];
        double v15 = v14;
        [v6 blue];
        if (vabdd_f64(v15, v16) <= a4)
        {
          [(FCColor *)self alpha];
          double v19 = v18;
          [v6 alpha];
          BOOL v7 = vabdd_f64(v19, v20) <= a4;
          goto LABEL_8;
        }
      }
    }
    goto LABEL_7;
  }
  BOOL v7 = [(FCColor *)self isEqual:v6];
LABEL_8:

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    [(FCColor *)self red];
    double v7 = v6;
    [v5 red];
    if (vabdd_f64(v7, v8) >= 0.00999999978
      || (-[FCColor green](self, "green"), double v10 = v9, [v5 green], vabdd_f64(v10, v11) >= 0.00999999978)
      || (-[FCColor blue](self, "blue"), double v13 = v12, [v5 blue], vabdd_f64(v13, v14) >= 0.00999999978))
    {
      BOOL v18 = 0;
    }
    else
    {
      [(FCColor *)self alpha];
      double v16 = v15;
      [v5 alpha];
      BOOL v18 = vabdd_f64(v16, v17) < 0.00999999978;
    }
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (unint64_t)hash
{
  v3 = NSNumber;
  [(FCColor *)self red];
  id v4 = objc_msgSend(v3, "numberWithDouble:");
  uint64_t v5 = [v4 hash];
  double v6 = NSNumber;
  [(FCColor *)self green];
  double v7 = objc_msgSend(v6, "numberWithDouble:");
  uint64_t v8 = [v7 hash] ^ v5;
  double v9 = NSNumber;
  [(FCColor *)self blue];
  double v10 = objc_msgSend(v9, "numberWithDouble:");
  uint64_t v11 = [v10 hash];
  double v12 = NSNumber;
  [(FCColor *)self alpha];
  double v13 = objc_msgSend(v12, "numberWithDouble:");
  unint64_t v14 = v8 ^ v11 ^ [v13 hash];

  return v14;
}

- (id)legibleColor
{
  uint64_t v5 = 0;
  double v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__8;
  double v9 = __Block_byref_object_dispose__8;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __23__FCColor_legibleColor__block_invoke;
  v4[3] = &unk_1E5B4D998;
  v4[4] = self;
  v4[5] = &v5;
  [(FCColor *)self readDeconstructedRepresentationWithAcccessor:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __23__FCColor_legibleColor__block_invoke(uint64_t a1, double a2, double a3, double a4)
{
  double v5 = a3 * 0.7152 + a2 * 0.2126 + a4 * 0.0722;
  double v6 = objc_opt_class();
  if (v5 > 0.7) {
    [v6 blackColor];
  }
  else {
  id v7 = [v6 whiteColor];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v7);
}

- (NSString)hex
{
  float v2 = self->_red * 255.0;
  unint64_t v3 = llroundf(v2);
  float v4 = self->_green * 255.0;
  unint64_t v5 = llroundf(v4);
  float v6 = self->_blue * 255.0;
  float v7 = self->_alpha * 255.0;
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"#%02lX%02lX%02lX%02lX", v3, v5, llroundf(v6), llroundf(v7));
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  [(FCColor *)self red];
  *(float *)&double v4 = v4;
  [v8 encodeFloat:@"red" forKey:v4];
  [(FCColor *)self green];
  *(float *)&double v5 = v5;
  [v8 encodeFloat:@"green" forKey:v5];
  [(FCColor *)self blue];
  *(float *)&double v6 = v6;
  [v8 encodeFloat:@"blue" forKey:v6];
  [(FCColor *)self alpha];
  *(float *)&double v7 = v7;
  [v8 encodeFloat:@"alpha" forKey:v7];
}

- (FCColor)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeFloatForKey:@"red"];
  double v6 = v5;
  [v4 decodeFloatForKey:@"green"];
  double v8 = v7;
  [v4 decodeFloatForKey:@"blue"];
  double v10 = v9;
  [v4 decodeFloatForKey:@"alpha"];
  float v12 = v11;

  return [(FCColor *)self initWithRed:v6 green:v8 blue:v10 alpha:v12];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (double)red
{
  return self->_red;
}

- (double)green
{
  return self->_green;
}

- (double)blue
{
  return self->_blue;
}

- (double)alpha
{
  return self->_alpha;
}

@end