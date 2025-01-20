@interface PICropAdjustmentController
+ (NSString)angleKey;
+ (NSString)constraintHeightKey;
+ (NSString)constraintWidthKey;
+ (NSString)heightKey;
+ (NSString)pitchKey;
+ (NSString)widthKey;
+ (NSString)xOriginKey;
+ (NSString)yOriginKey;
+ (NSString)yawKey;
- (BOOL)isCropConstrained;
- (BOOL)isCropIdentityForImageSize:(CGSize)a3;
- (BOOL)isGeometryIdentityForImageSize:(CGSize)a3;
- (BOOL)isSettingEqual:(id)a3 forKey:(id)a4;
- (CGRect)cropRect;
- (PICropAdjustmentController)initWithAdjustment:(id)a3;
- (double)angle;
- (double)angleRadians;
- (double)pitch;
- (double)pitchRadians;
- (double)yaw;
- (double)yawRadians;
- (id)pasteKeysForMediaType:(int64_t)a3;
- (id)visualInputKeys;
- (int64_t)constraintHeight;
- (int64_t)constraintWidth;
- (void)setAngle:(double)a3;
- (void)setAngleRadians:(double)a3;
- (void)setConstraintHeight:(int64_t)a3;
- (void)setConstraintWidth:(int64_t)a3;
- (void)setCropRect:(CGRect)a3;
- (void)setPitch:(double)a3;
- (void)setPitchRadians:(double)a3;
- (void)setYaw:(double)a3;
- (void)setYawRadians:(double)a3;
@end

@implementation PICropAdjustmentController

- (id)pasteKeysForMediaType:(int64_t)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (BOOL)isSettingEqual:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(PIAdjustmentController *)self adjustment];
  v9 = [v8 objectForKeyedSubscript:v7];

  v10 = [v6 objectForKeyedSubscript:v7];
  v11 = +[PICropAdjustmentController angleKey];
  if ([v7 isEqualToString:v11]) {
    goto LABEL_4;
  }
  v12 = +[PICropAdjustmentController pitchKey];
  if (![v7 isEqualToString:v12])
  {
    v20 = +[PICropAdjustmentController yawKey];
    char v21 = [v7 isEqualToString:v20];

    if (v21) {
      goto LABEL_5;
    }
    v22 = +[PICropAdjustmentController xOriginKey];
    if (([v7 isEqualToString:v22] & 1) == 0)
    {
      v23 = +[PICropAdjustmentController yOriginKey];
      if (([v7 isEqualToString:v23] & 1) == 0)
      {
        v24 = +[PICropAdjustmentController widthKey];
        if (![v7 isEqualToString:v24])
        {
          v28 = +[PICropAdjustmentController heightKey];
          char v29 = [v7 isEqualToString:v28];

          if ((v29 & 1) == 0)
          {
            v30.receiver = self;
            v30.super_class = (Class)PICropAdjustmentController;
            unsigned __int8 v18 = [(PIAdjustmentController *)&v30 isSettingEqual:v6 forKey:v7];
            goto LABEL_7;
          }
          goto LABEL_15;
        }
      }
    }

LABEL_15:
    [v9 doubleValue];
    double v26 = v25;
    [v10 doubleValue];
    double v16 = vabdd_f64(v26, v27);
    v17 = (double *)MEMORY[0x1E4F7A780];
    goto LABEL_6;
  }

LABEL_4:
LABEL_5:
  [v9 doubleValue];
  double v14 = v13;
  [v10 doubleValue];
  double v16 = vabdd_f64(v14, v15);
  v17 = (double *)MEMORY[0x1E4F7A770];
LABEL_6:
  unsigned __int8 v18 = v16 < *v17;
LABEL_7:

  return v18;
}

- (void)setYawRadians:(double)a3
{
}

- (void)setYaw:(double)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__PICropAdjustmentController_setYaw___block_invoke;
  block[3] = &unk_1E5D812E0;
  block[4] = self;
  if (setYaw__onceToken != -1) {
    dispatch_once(&setYaw__onceToken, block);
  }
  double v5 = *(double *)&setYaw__minAngle;
  double v6 = *(double *)&setYaw__maxAngle;
  if (*(double *)&setYaw__maxAngle > a3) {
    double v6 = a3;
  }
  if (*(double *)&setYaw__minAngle < v6) {
    double v5 = v6;
  }
  id v7 = [NSNumber numberWithDouble:v5];
  v8 = [(PIAdjustmentController *)self adjustment];
  v9 = +[PICropAdjustmentController yawKey];
  [v8 setObject:v7 forKeyedSubscript:v9];
}

void __37__PICropAdjustmentController_setYaw___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) adjustment];
  v2 = [v1 schema];
  v3 = [v2 settings];
  v4 = +[PICropAdjustmentController yawKey];
  id v9 = [v3 objectForKeyedSubscript:v4];

  double v5 = [v9 minimumValue];
  [v5 doubleValue];
  setYaw__minAngle = v6;

  id v7 = [v9 maximumValue];
  [v7 doubleValue];
  setYaw__maxAngle = v8;
}

- (void)setPitchRadians:(double)a3
{
}

- (void)setPitch:(double)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__PICropAdjustmentController_setPitch___block_invoke;
  block[3] = &unk_1E5D812E0;
  block[4] = self;
  if (setPitch__onceToken != -1) {
    dispatch_once(&setPitch__onceToken, block);
  }
  double v5 = *(double *)&setPitch__minAngle;
  double v6 = *(double *)&setPitch__maxAngle;
  if (*(double *)&setPitch__maxAngle > a3) {
    double v6 = a3;
  }
  if (*(double *)&setPitch__minAngle < v6) {
    double v5 = v6;
  }
  id v7 = [NSNumber numberWithDouble:v5];
  uint64_t v8 = [(PIAdjustmentController *)self adjustment];
  id v9 = +[PICropAdjustmentController pitchKey];
  [v8 setObject:v7 forKeyedSubscript:v9];
}

void __39__PICropAdjustmentController_setPitch___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) adjustment];
  v2 = [v1 schema];
  v3 = [v2 settings];
  v4 = +[PICropAdjustmentController pitchKey];
  id v9 = [v3 objectForKeyedSubscript:v4];

  double v5 = [v9 minimumValue];
  [v5 doubleValue];
  setPitch__minAngle = v6;

  id v7 = [v9 maximumValue];
  [v7 doubleValue];
  setPitch__maxAngle = v8;
}

- (void)setAngleRadians:(double)a3
{
}

- (void)setAngle:(double)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__PICropAdjustmentController_setAngle___block_invoke;
  block[3] = &unk_1E5D812E0;
  block[4] = self;
  if (setAngle__onceToken != -1) {
    dispatch_once(&setAngle__onceToken, block);
  }
  double v5 = *(double *)&setAngle__minAngle;
  double v6 = *(double *)&setAngle__maxAngle;
  if (*(double *)&setAngle__maxAngle > a3) {
    double v6 = a3;
  }
  if (*(double *)&setAngle__minAngle < v6) {
    double v5 = v6;
  }
  id v7 = [NSNumber numberWithDouble:v5];
  uint64_t v8 = [(PIAdjustmentController *)self adjustment];
  id v9 = +[PICropAdjustmentController angleKey];
  [v8 setObject:v7 forKeyedSubscript:v9];
}

void __39__PICropAdjustmentController_setAngle___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) adjustment];
  v2 = [v1 schema];
  v3 = [v2 settings];
  v4 = +[PICropAdjustmentController angleKey];
  id v9 = [v3 objectForKeyedSubscript:v4];

  double v5 = [v9 minimumValue];
  [v5 doubleValue];
  setAngle__minAngle = v6;

  id v7 = [v9 maximumValue];
  [v7 doubleValue];
  setAngle__maxAngle = v8;
}

- (void)setConstraintHeight:(int64_t)a3
{
  if (a3)
  {
    objc_msgSend(NSNumber, "numberWithInteger:");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    v4 = [(PIAdjustmentController *)self adjustment];
    double v5 = +[PICropAdjustmentController constraintHeightKey];
    [v4 setObject:v6 forKeyedSubscript:v5];
  }
  else
  {
    id v6 = [(PIAdjustmentController *)self adjustment];
    v4 = +[PICropAdjustmentController constraintHeightKey];
    [v6 setObject:0 forKeyedSubscript:v4];
  }
}

- (void)setConstraintWidth:(int64_t)a3
{
  if (a3)
  {
    objc_msgSend(NSNumber, "numberWithInteger:");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    v4 = [(PIAdjustmentController *)self adjustment];
    double v5 = +[PICropAdjustmentController constraintWidthKey];
    [v4 setObject:v6 forKeyedSubscript:v5];
  }
  else
  {
    id v6 = [(PIAdjustmentController *)self adjustment];
    v4 = +[PICropAdjustmentController constraintWidthKey];
    [v6 setObject:0 forKeyedSubscript:v4];
  }
}

- (void)setCropRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (CGRectIsEmpty(a3))
  {
    v19 = NUAssertLogger_11297();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = [NSString stringWithFormat:@"cannot set empty crop rect"];
      *(_DWORD *)buf = 138543362;
      v34 = v20;
      _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    char v21 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v23 = NUAssertLogger_11297();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        double v27 = dispatch_get_specific(*v21);
        v28 = (void *)MEMORY[0x1E4F29060];
        id v29 = v27;
        objc_super v30 = [v28 callStackSymbols];
        v31 = [v30 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v34 = v27;
        __int16 v35 = 2114;
        v36 = v31;
        _os_log_error_impl(&dword_1A9680000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v24)
    {
      double v25 = [MEMORY[0x1E4F29060] callStackSymbols];
      double v26 = [v25 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v34 = v26;
      _os_log_error_impl(&dword_1A9680000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  uint64_t v8 = [NSNumber numberWithDouble:x];
  id v9 = [(PIAdjustmentController *)self adjustment];
  v10 = +[PICropAdjustmentController xOriginKey];
  [v9 setObject:v8 forKeyedSubscript:v10];

  v11 = [NSNumber numberWithDouble:y];
  v12 = [(PIAdjustmentController *)self adjustment];
  double v13 = +[PICropAdjustmentController yOriginKey];
  [v12 setObject:v11 forKeyedSubscript:v13];

  double v14 = [NSNumber numberWithDouble:width];
  double v15 = [(PIAdjustmentController *)self adjustment];
  double v16 = +[PICropAdjustmentController widthKey];
  [v15 setObject:v14 forKeyedSubscript:v16];

  id v32 = [NSNumber numberWithDouble:height];
  v17 = [(PIAdjustmentController *)self adjustment];
  unsigned __int8 v18 = +[PICropAdjustmentController heightKey];
  [v17 setObject:v32 forKeyedSubscript:v18];
}

- (double)yawRadians
{
  [(PICropAdjustmentController *)self yaw];
  return v2 / 180.0 * 3.14159265;
}

- (double)yaw
{
  double v2 = [(PIAdjustmentController *)self adjustment];
  v3 = +[PICropAdjustmentController yawKey];
  v4 = [v2 objectForKeyedSubscript:v3];
  [v4 doubleValue];
  double v6 = v5;

  return v6;
}

- (double)pitchRadians
{
  [(PICropAdjustmentController *)self pitch];
  return v2 / 180.0 * 3.14159265;
}

- (double)pitch
{
  double v2 = [(PIAdjustmentController *)self adjustment];
  v3 = +[PICropAdjustmentController pitchKey];
  v4 = [v2 objectForKeyedSubscript:v3];
  [v4 doubleValue];
  double v6 = v5;

  return v6;
}

- (double)angleRadians
{
  [(PICropAdjustmentController *)self angle];
  return v2 / 180.0 * 3.14159265;
}

- (double)angle
{
  double v2 = [(PIAdjustmentController *)self adjustment];
  v3 = +[PICropAdjustmentController angleKey];
  v4 = [v2 objectForKeyedSubscript:v3];
  [v4 doubleValue];
  double v6 = v5;

  return v6;
}

- (int64_t)constraintHeight
{
  double v2 = [(PIAdjustmentController *)self adjustment];
  v3 = +[PICropAdjustmentController constraintHeightKey];
  v4 = [v2 objectForKeyedSubscript:v3];
  int64_t v5 = [v4 integerValue];

  return v5;
}

- (int64_t)constraintWidth
{
  double v2 = [(PIAdjustmentController *)self adjustment];
  v3 = +[PICropAdjustmentController constraintWidthKey];
  v4 = [v2 objectForKeyedSubscript:v3];
  int64_t v5 = [v4 integerValue];

  return v5;
}

- (CGRect)cropRect
{
  double v26 = [(PIAdjustmentController *)self adjustment];
  double v25 = +[PICropAdjustmentController xOriginKey];
  v3 = [v26 objectForKeyedSubscript:v25];
  [v3 doubleValue];
  double v5 = v4;
  double v6 = [(PIAdjustmentController *)self adjustment];
  id v7 = +[PICropAdjustmentController yOriginKey];
  uint64_t v8 = [v6 objectForKeyedSubscript:v7];
  [v8 doubleValue];
  double v10 = v9;
  v11 = [(PIAdjustmentController *)self adjustment];
  v12 = +[PICropAdjustmentController widthKey];
  double v13 = [v11 objectForKeyedSubscript:v12];
  [v13 doubleValue];
  double v15 = v14;
  double v16 = [(PIAdjustmentController *)self adjustment];
  v17 = +[PICropAdjustmentController heightKey];
  unsigned __int8 v18 = [v16 objectForKeyedSubscript:v17];
  [v18 doubleValue];
  double v20 = v19;

  double v21 = v5;
  double v22 = v10;
  double v23 = v15;
  double v24 = v20;
  result.size.double height = v24;
  result.size.double width = v23;
  result.origin.double y = v22;
  result.origin.double x = v21;
  return result;
}

- (BOOL)isCropIdentityForImageSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  [(PICropAdjustmentController *)self cropRect];
  v12.origin.double x = 0.0;
  v12.origin.double y = 0.0;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  BOOL v6 = CGRectEqualToRect(v11, v12);
  if (v6)
  {
    [(PICropAdjustmentController *)self angle];
    if (fabs(v7) >= 0.0000000596046448
      || ([(PICropAdjustmentController *)self pitch], fabs(v8) >= 0.0000000596046448))
    {
      LOBYTE(v6) = 0;
    }
    else
    {
      [(PICropAdjustmentController *)self yaw];
      LOBYTE(v6) = fabs(v9) < 0.0000000596046448;
    }
  }
  return v6;
}

- (BOOL)isCropConstrained
{
  v3 = [(PIAdjustmentController *)self adjustment];
  double v4 = +[PICropAdjustmentController constraintWidthKey];
  double v5 = [v3 objectForKeyedSubscript:v4];
  uint64_t v6 = [v5 integerValue];

  double v7 = [(PIAdjustmentController *)self adjustment];
  double v8 = +[PICropAdjustmentController constraintHeightKey];
  double v9 = [v7 objectForKeyedSubscript:v8];
  uint64_t v10 = [v9 integerValue];

  return v6 > 0 && v10 > 0;
}

- (BOOL)isGeometryIdentityForImageSize:(CGSize)a3
{
  BOOL v4 = -[PICropAdjustmentController isCropIdentityForImageSize:](self, "isCropIdentityForImageSize:", a3.width, a3.height);
  if (v4) {
    LOBYTE(v4) = ![(PICropAdjustmentController *)self isCropConstrained];
  }
  return v4;
}

- (id)visualInputKeys
{
  v13[9] = *MEMORY[0x1E4F143B8];
  double v2 = +[PICropAdjustmentController angleKey];
  v3 = +[PICropAdjustmentController pitchKey];
  v13[1] = v3;
  BOOL v4 = +[PICropAdjustmentController yawKey];
  v13[2] = v4;
  double v5 = +[PICropAdjustmentController xOriginKey];
  v13[3] = v5;
  uint64_t v6 = +[PICropAdjustmentController yOriginKey];
  v13[4] = v6;
  double v7 = +[PICropAdjustmentController widthKey];
  v13[5] = v7;
  double v8 = +[PICropAdjustmentController heightKey];
  v13[6] = v8;
  double v9 = +[PICropAdjustmentController constraintWidthKey];
  v13[7] = v9;
  uint64_t v10 = +[PICropAdjustmentController constraintHeightKey];
  v13[8] = v10;
  CGRect v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:9];

  return v11;
}

- (PICropAdjustmentController)initWithAdjustment:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PICropAdjustmentController;
  return [(PIAdjustmentController *)&v4 initWithAdjustment:a3];
}

+ (NSString)yawKey
{
  return (NSString *)@"yaw";
}

+ (NSString)pitchKey
{
  return (NSString *)@"pitch";
}

+ (NSString)angleKey
{
  return (NSString *)@"angle";
}

+ (NSString)constraintHeightKey
{
  return (NSString *)@"constraintHeight";
}

+ (NSString)constraintWidthKey
{
  return (NSString *)@"constraintWidth";
}

+ (NSString)heightKey
{
  return (NSString *)@"height";
}

+ (NSString)widthKey
{
  return (NSString *)@"width";
}

+ (NSString)yOriginKey
{
  return (NSString *)@"yOrigin";
}

+ (NSString)xOriginKey
{
  return (NSString *)@"xOrigin";
}

@end