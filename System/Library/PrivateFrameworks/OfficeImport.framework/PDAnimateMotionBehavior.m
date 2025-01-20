@interface PDAnimateMotionBehavior
+ (id)NSStringForBezierPath:(id)a3;
+ (id)bezierPathFromNSString:(id)a3;
- (BOOL)hasAngle;
- (BOOL)hasOriginType;
- (BOOL)hasPath;
- (BOOL)hasPathEditMode;
- (BOOL)hasRotationCenter;
- (BOOL)isEqual:(id)a3;
- (CGPoint)rotationCenter;
- (double)angle;
- (id)path;
- (id)pointsTypes;
- (int)originType;
- (int)pathEditMode;
- (unint64_t)hash;
- (void)setAngle:(double)a3;
- (void)setOriginType:(int)a3;
- (void)setPath:(id)a3;
- (void)setPathEditMode:(int)a3;
- (void)setPointsTypes:(id)a3;
- (void)setRotationCenter:(CGPoint)a3;
@end

@implementation PDAnimateMotionBehavior

- (void)setPath:(id)a3
{
}

- (void)setRotationCenter:(CGPoint)a3
{
  self->mRotationCenter = a3;
  self->mHasRotationCenter = 1;
}

+ (id)bezierPathFromNSString:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v29 = +[OITSUBezierPath bezierPath];
  unint64_t v28 = [v3 length];
  {
    +[PDAnimateMotionBehavior bezierPathFromNSString:]::commandCharacterSet = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"MLCZEmlcze"];
  }
  v4 = (void *)[objc_alloc(MEMORY[0x263F08B08]) initWithString:v3];
  uint64_t v5 = 0;
  while (([v4 isAtEnd] & 1) == 0)
  {
    id v30 = 0;
    char v6 = [v4 scanCharactersFromSet:+[PDAnimateMotionBehavior bezierPathFromNSString:]::commandCharacterSet intoString:&v30];
    id v7 = v30;
    v8 = v7;
    if ((v6 & 1) == 0)
    {

      goto LABEL_57;
    }
    unint64_t v9 = [v7 length];
    if (!v9) {
      goto LABEL_52;
    }
    uint64_t v10 = 0;
    while (1)
    {
      int v11 = [v8 characterAtIndex:v10];
      uint64_t v12 = [v4 scanLocation];
      if ((v11 & 0xFFFFFFDF) == 0x45) {
        break;
      }
      uint64_t v13 = 0;
      char v14 = v11 - 67;
      if ((v11 - 67) > 0x2A) {
        goto LABEL_14;
      }
      if (((1 << v14) & 0x60000000600) != 0)
      {
        uint64_t v13 = 1;
      }
      else
      {
        if (((1 << v14) & 0x100000001) == 0) {
          goto LABEL_14;
        }
        uint64_t v13 = 3;
      }
      if (v10 + 1 < v9) {
        goto LABEL_42;
      }
LABEL_14:
      long long v32 = *MEMORY[0x263F00148];
      long long v33 = v32;
      long long v34 = v32;
      if (v13)
      {
        v15 = (void *)&v32 + 1;
        while (1)
        {
          id v16 = v4;
          uint64_t v31 = 0;
          if (([v16 scanDouble:&v31] & 1) == 0) {
            break;
          }
          *(v15 - 1) = v31;
          uint64_t v31 = 0;
          if (([v16 scanDouble:&v31] & 1) == 0) {
            break;
          }
          void *v15 = v31;

          v15 += 2;
          if (!--v13) {
            goto LABEL_19;
          }
        }

        goto LABEL_42;
      }
LABEL_19:
      if (v5) {
        goto LABEL_42;
      }
      if (v11 <= 98)
      {
        if (v11 <= 76)
        {
          if (v11 == 67)
          {
            [v29 curveToPoint:v34 controlPoint1:v32 controlPoint2:v33];
          }
          else if (v11 == 76)
          {
            [v29 lineToPoint:v32];
          }
          goto LABEL_39;
        }
        if (v11 == 77)
        {
          [v29 moveToPoint:v32];
          goto LABEL_39;
        }
        if (v11 != 90) {
          goto LABEL_39;
        }
LABEL_34:
        [v29 closePath];
        goto LABEL_39;
      }
      if (v11 <= 108)
      {
        if (v11 == 99)
        {
          [v29 relativeCurveToPoint:v34 controlPoint1:v32 controlPoint2:v33];
        }
        else if (v11 == 108)
        {
          [v29 relativeLineToPoint:v32];
        }
        goto LABEL_39;
      }
      if (v11 == 109)
      {
        [v29 relativeMoveToPoint:v32];
        goto LABEL_39;
      }
      if (v11 == 122) {
        goto LABEL_34;
      }
LABEL_39:
      uint64_t v5 = 0;
      uint64_t v17 = 0;
      if (++v10 == v9) {
        goto LABEL_53;
      }
    }
    unint64_t v18 = v12 + 1;
    if (v12 + 1 < v9)
    {
LABEL_42:
      uint64_t v17 = 1;
      goto LABEL_53;
    }
    unint64_t v19 = v28 - v18;
    if (v28 <= v18)
    {
LABEL_52:
      uint64_t v17 = v5;
      goto LABEL_53;
    }
    v20 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    uint64_t v21 = objc_msgSend(v3, "rangeOfCharacterFromSet:options:range:", v20, 0, v18, v19);
    uint64_t v23 = v22;

    BOOL v25 = v21 != v18 || v23 != v19;
    uint64_t v17 = v25 | v5;
LABEL_53:

    uint64_t v5 = v17;
  }
  if ((v5 & 1) == 0)
  {
    id v26 = v29;
    goto LABEL_58;
  }
LABEL_57:
  id v26 = 0;
LABEL_58:

  return v26;
}

+ (id)NSStringForBezierPath:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = objc_msgSend(NSString, "stringWithCString:encoding:", objc_msgSend(v3, "cString"), 1);
    uint64_t v6 = [v4 elementCount];
    uint64_t v7 = v6;
    if (v6 >= 3 && ![v4 elementAtIndex:v6 - 1] && objc_msgSend(v4, "elementAtIndex:", v7 - 2) == 3)
    {
      uint64_t v8 = [v5 rangeOfString:@"Z" options:4];
      if (v8 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v9 = [v5 substringToIndex:v8 + 1];

        uint64_t v5 = (void *)v9;
      }
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)hasPath
{
  return self->mPath != 0;
}

- (id)path
{
  return self->mPath;
}

- (BOOL)hasAngle
{
  return self->mHasAngle;
}

- (double)angle
{
  return self->mAngle;
}

- (void)setAngle:(double)a3
{
  self->mAngle = a3;
  self->mHasAngle = 1;
}

- (id)pointsTypes
{
  return self->mPointsTypes;
}

- (void)setPointsTypes:(id)a3
{
}

- (BOOL)hasOriginType
{
  return self->mHasOriginType;
}

- (int)originType
{
  return self->mOriginType;
}

- (void)setOriginType:(int)a3
{
  self->mOriginType = a3;
  self->mHasOriginType = 1;
}

- (BOOL)hasRotationCenter
{
  return self->mHasRotationCenter;
}

- (CGPoint)rotationCenter
{
  double x = self->mRotationCenter.x;
  double y = self->mRotationCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)hasPathEditMode
{
  return self->mHasPathEditMode;
}

- (int)pathEditMode
{
  return self->mPathEditMode;
}

- (void)setPathEditMode:(int)a3
{
  self->mHasPathEditMode = 1;
  self->mPathEditMode = a3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = TSUDynamicCast(v5, (uint64_t)v4);
  if (!v6) {
    goto LABEL_18;
  }
  int v7 = [(PDAnimateMotionBehavior *)self hasPath];
  if (v7 != [v6 hasPath]) {
    goto LABEL_18;
  }
  if ([(PDAnimateMotionBehavior *)self hasPath])
  {
    uint64_t v8 = +[PDAnimateMotionBehavior NSStringForBezierPath:self->mPath];
    uint64_t v9 = [v6 path];
    uint64_t v10 = +[PDAnimateMotionBehavior NSStringForBezierPath:v9];
    char v11 = [v8 isEqualToString:v10];

    if ((v11 & 1) == 0) {
      goto LABEL_18;
    }
  }
  int v12 = [(PDAnimateMotionBehavior *)self hasAngle];
  if (v12 != [v6 hasAngle]) {
    goto LABEL_18;
  }
  if ([(PDAnimateMotionBehavior *)self hasAngle])
  {
    double mAngle = self->mAngle;
    [v6 angle];
    if (mAngle != v14) {
      goto LABEL_18;
    }
  }
  v15 = [(PDAnimateMotionBehavior *)self pointsTypes];
  if (v15)
  {
    mPointsTypes = self->mPointsTypes;
    uint64_t v17 = [v6 pointsTypes];
    LOBYTE(mPointsTypes) = [(NSString *)mPointsTypes isEqualToString:v17];

    if ((mPointsTypes & 1) == 0) {
      goto LABEL_18;
    }
  }
  int v18 = [(PDAnimateMotionBehavior *)self hasOriginType];
  if (v18 != [v6 hasOriginType]) {
    goto LABEL_18;
  }
  if ([(PDAnimateMotionBehavior *)self hasOriginType])
  {
    int mOriginType = self->mOriginType;
    if (mOriginType != [v6 originType]) {
      goto LABEL_18;
    }
  }
  if ((int v20 = [(PDAnimateMotionBehavior *)self hasRotationCenter],
        v20 == [v6 hasRotationCenter])
    && (![(PDAnimateMotionBehavior *)self hasRotationCenter]
     || (double x = self->mRotationCenter.x, y = self->mRotationCenter.y, [v6 rotationCenter], x == v24)
     && y == v23)
    && (int v25 = [(PDAnimateMotionBehavior *)self hasPathEditMode],
        v25 == [v6 hasPathEditMode])
    && (![(PDAnimateMotionBehavior *)self hasPathEditMode]
     || (int mPathEditMode = self->mPathEditMode, mPathEditMode == [v6 pathEditMode])))
  {

    v29.receiver = self;
    v29.super_class = (Class)PDAnimateMotionBehavior;
    BOOL v26 = [(PDAnimateScaleBehavior *)&v29 isEqual:v4];
  }
  else
  {
LABEL_18:

    BOOL v26 = 0;
  }

  return v26;
}

- (unint64_t)hash
{
  if (self->mHasAngle) {
    unint64_t mAngle = (unint64_t)self->mAngle;
  }
  else {
    unint64_t mAngle = 0;
  }
  if (self->mHasOriginType) {
    mAngle ^= self->mOriginType;
  }
  if (self->mHasRotationCenter) {
    mAngle ^= (unint64_t)self->mRotationCenter.x ^ (unint64_t)self->mRotationCenter.y;
  }
  if (self->mHasPathEditMode) {
    mAngle ^= self->mPathEditMode;
  }
  unint64_t v4 = [(OITSUBezierPath *)self->mPath hash];
  return mAngle + (v4 << 16) + ([(NSString *)self->mPointsTypes hash] << 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mPointsTypes, 0);
  objc_storeStrong((id *)&self->mPath, 0);
}

@end