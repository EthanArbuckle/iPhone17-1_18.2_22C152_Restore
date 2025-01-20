@interface CRLBezierPathSource
+ (id)pathSourceWithBezierPath:(id)a3;
- (BOOL)isCircular;
- (BOOL)isClosed;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRectangular;
- (CGAffineTransform)transformToNaturalSize;
- (CGSize)naturalSize;
- (CRLBezierPathSource)init;
- (CRLBezierPathSource)initWithBezierPath:(id)a3;
- (CRLBezierPathSource)initWithNaturalSize:(CGSize)a3;
- (id)bezierPathWithoutFlips;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)inferredAccessibilityDescription;
- (id)inferredAccessibilityDescriptionNoShapeNames;
- (id)inferredLocalizedAccessibilityDescriptionPlaceholder;
- (id)name;
- (unint64_t)hash;
- (void)p_setBezierPath:(id)a3;
- (void)setNaturalSize:(CGSize)a3;
@end

@implementation CRLBezierPathSource

+ (id)pathSourceWithBezierPath:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithBezierPath:v3];

  return v4;
}

- (CRLBezierPathSource)initWithBezierPath:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CRLBezierPathSource;
  v5 = [(CRLBezierPathSource *)&v16 init];
  if (v5)
  {
    if ((uint64_t)[v4 elementCount] < 1)
    {
      double width = CGRectNull.size.width;
      double height = CGRectNull.size.height;
    }
    else
    {
      [v4 controlPointBounds];
    }
    BOOL v8 = width == CGSizeZero.width && height == CGSizeZero.height;
    if (v8 || sub_100067C6C())
    {
      int v9 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D6AC8);
      }
      v10 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10107A364((uint64_t)v4, v9, v10);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D6AE8);
      }
      v11 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010668E0(v11);
      }
      v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPathSource initWithBezierPath:]");
      v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBezierPathSource.m"];
      +[CRLAssertionHandler handleFailureInFunction:v12, v13, 31, 0, "Ignoring invalid bezier path %@", v4 file lineNumber isFatal description];

      uint64_t v14 = +[CRLBezierPath bezierPathWithDefaultsForErrorCases];

      id v4 = (id)v14;
    }
    if (v4)
    {
      [(CRLBezierPathSource *)v5 p_setBezierPath:v4];
    }
    else
    {

      v5 = 0;
    }
  }

  return v5;
}

- (CRLBezierPathSource)initWithNaturalSize:(CGSize)a3
{
  id v4 = +[CRLBezierPath bezierPathWithRect:](CRLBezierPath, "bezierPathWithRect:", 0.0, 0.0, a3.width, a3.height);
  v5 = [(CRLBezierPathSource *)self initWithBezierPath:v4];

  return v5;
}

- (CRLBezierPathSource)init
{
  return [(CRLBezierPathSource *)self initWithBezierPath:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [(CRLBezierPath *)self->mPath copy];
  id v6 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithBezierPath:", v5);
  [v6 setHasHorizontalFlip:[self hasHorizontalFlip]];
  [v6 setHasVerticalFlip:[self hasVerticalFlip]];
  v7 = [(CRLPathSource *)self localizationKey];
  [v6 setLocalizationKey:v7];

  BOOL v8 = [(CRLPathSource *)self userDefinedIdentifier];
  [v6 setUserDefinedIdentifier:v8];

  int v9 = [(CRLPathSource *)self userDefinedName];
  [v6 setUserDefinedName:v9];

  [(CRLBezierPathSource *)self naturalSize];
  [v6 setNaturalSize:];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CRLBezierPathSource *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = sub_1002469D0(v5, v4);
    BOOL v8 = v6
      && (v10.receiver = self,
          v10.super_class = (Class)CRLBezierPathSource,
          [(CRLPathSource *)&v10 isEqual:v4])
      && ((mPath = self->mPath, mPath == *(CRLBezierPath **)(v6 + 56)) || -[CRLBezierPath isEqual:](mPath, "isEqual:"))
      && self->mIsRectangular != (*(unsigned char *)(v6 + 64) == 0)
      && sub_100064084(self->mNaturalSize.width, self->mNaturalSize.height, *(double *)(v6 + 72), *(double *)(v6 + 80));
  }
  return v8;
}

- (unint64_t)hash
{
  v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  id v4 = [v3 hash];

  return (unint64_t)v4;
}

- (id)description
{
  v10.receiver = self;
  v10.super_class = (Class)CRLBezierPathSource;
  id v3 = [(CRLBezierPathSource *)&v10 description];
  id v4 = [v3 mutableCopy];

  uint64_t v5 = [(CRLPathSource *)self localizationKey];
  uint64_t v6 = [(CRLPathSource *)self userDefinedName];
  v7 = NSStringFromCGSize(self->mNaturalSize);
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"; localizationKey=%@; userDefinedName=%@; naturalSize=%@; path=%@; isRectangular=%d",
    v5,
    v6,
    v7,
    self->mPath,
  BOOL v8 = self->mIsRectangular);
  [v4 appendString:v8];

  return v4;
}

- (void)setNaturalSize:(CGSize)a3
{
  self->mNaturalSize = a3;
  mBezierPathWithoutFlips = self->mBezierPathWithoutFlips;
  self->mBezierPathWithoutFlips = 0;
}

- (CGAffineTransform)transformToNaturalSize
{
  [(CRLBezierPath *)self->mPath bounds];
  double v6 = v5;
  double v8 = v7;
  double width = self->mNaturalSize.width;
  double height = self->mNaturalSize.height;
  result = (CGAffineTransform *)sub_100064084(v5, v7, width, height);
  if (result)
  {
    long long v12 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&retstr->c = v12;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  }
  else
  {
    double v13 = 1.0;
    double v14 = 1.0;
    if (v6 > 0.01)
    {
      float v15 = width / v6;
      double v14 = v15;
    }
    if (v8 > 0.01)
    {
      float v16 = height / v8;
      double v13 = v16;
    }
    if (width == 0.0) {
      double v14 = 1.0;
    }
    float v17 = v14;
    if (height == 0.0) {
      double v13 = 1.0;
    }
    float v18 = v13;
    return CGAffineTransformMakeScale(retstr, v17, v18);
  }
  return result;
}

- (id)bezierPathWithoutFlips
{
  id v3 = [(CRLBezierPath *)self->mBezierPathWithoutFlips copy];
  if (!v3)
  {
    id v4 = (CRLBezierPath *)[(CRLBezierPath *)self->mPath copy];
    memset(&v7[1], 0, sizeof(CGAffineTransform));
    [(CRLBezierPathSource *)self transformToNaturalSize];
    v7[0] = v7[1];
    if (!CGAffineTransformIsIdentity(v7))
    {
      v7[0] = v7[1];
      [(CRLBezierPath *)v4 transformUsingAffineTransform:v7];
    }
    id v3 = [(CRLBezierPath *)v4 copy];
    mBezierPathWithoutFlips = self->mBezierPathWithoutFlips;
    self->mBezierPathWithoutFlips = v4;
  }

  return v3;
}

- (BOOL)isRectangular
{
  return self->mIsRectangular;
}

- (BOOL)isCircular
{
  return [(CRLBezierPath *)self->mPath isCircular];
}

- (BOOL)isClosed
{
  return ![(CRLBezierPath *)self->mPath isOpen];
}

- (id)name
{
  id v3 = [(CRLPathSource *)self userDefinedName];
  if (!v3)
  {
    id v4 = +[CRLShapeLibrary sharedLibrary];
    double v5 = [(CRLPathSource *)self localizationKey];
    double v6 = [v4 shapeWithLocalizationKey:v5];

    id v3 = [v6 name];
  }

  return v3;
}

- (void)p_setBezierPath:(id)a3
{
  id v4 = (CRLBezierPath *)a3;
  if (!v4)
  {
    int v5 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D6B08);
    }
    double v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10107A420(v5, v6);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D6B28);
    }
    double v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v7);
    }
    double v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPathSource p_setBezierPath:]");
    int v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBezierPathSource.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 178, 0, "invalid nil value for '%{public}s'", "path");
  }
  [(CRLBezierPath *)v4 bounds];
  double v11 = v10;
  double v13 = v12;
  if (!sub_100064084(v10, v12, CGPointZero.x, CGPointZero.y))
  {
    CGAffineTransformMakeTranslation(&v19, -v11, -v13);
    [(CRLBezierPath *)v4 transformUsingAffineTransform:&v19];
  }
  mPath = self->mPath;
  self->mPath = v4;
  float v15 = v4;

  [(CRLBezierPath *)self->mPath bounds];
  self->mNaturalSize.double width = v16;
  self->mNaturalSize.double height = v17;
  self->mIsRectangular = [(CRLBezierPath *)self->mPath isRectangular];
  mBezierPathWithoutFlips = self->mBezierPathWithoutFlips;
  self->mBezierPathWithoutFlips = 0;
}

- (id)inferredAccessibilityDescriptionNoShapeNames
{
  id v3 = [(CRLPathSource *)self userDefinedName];
  if (![v3 length])
  {
    uint64_t v4 = [(CRLBezierPath *)self->mPath inferredAccessibilityDescription];

    id v3 = (void *)v4;
  }

  return v3;
}

- (id)inferredAccessibilityDescription
{
  id v3 = [(CRLPathSource *)self userDefinedName];
  if (![v3 length])
  {
    uint64_t v4 = +[CRLShapeLibrary sharedLibrary];
    int v5 = [(CRLPathSource *)self localizationKey];
    double v6 = [v4 shapeWithLocalizationKey:v5];

    uint64_t v7 = [v6 name];

    id v3 = (void *)v7;
  }
  if (![v3 length])
  {
    uint64_t v8 = [(CRLBezierPath *)self->mPath inferredAccessibilityDescription];

    id v3 = (void *)v8;
  }

  return v3;
}

- (id)inferredLocalizedAccessibilityDescriptionPlaceholder
{
  return [(CRLBezierPath *)self->mPath inferredLocalizedAccessibilityDescriptionPlaceholder];
}

- (CGSize)naturalSize
{
  double width = self->mNaturalSize.width;
  double height = self->mNaturalSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mBezierPathWithoutFlips, 0);

  objc_storeStrong((id *)&self->mPath, 0);
}

@end