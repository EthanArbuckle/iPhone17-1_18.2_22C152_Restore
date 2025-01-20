@interface CRLCanvasLayoutGeometry
+ (id)geometryFromFullTransform:(CGAffineTransform *)a3;
- (BOOL)differsInMoreThanTranslationFrom:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CGAffineTransform)fullTransform;
- (CGAffineTransform)inverseTransform;
- (CGAffineTransform)transform;
- (CGAffineTransform)transformByConcatenatingTransformTo:(SEL)a3;
- (CGPoint)center;
- (CGRect)frame;
- (CGSize)size;
- (CRLCanvasInfoGeometry)infoGeometry;
- (CRLCanvasLayoutGeometry)init;
- (CRLCanvasLayoutGeometry)initWithFrame:(CGRect)a3;
- (CRLCanvasLayoutGeometry)initWithInfoGeometry:(id)a3;
- (CRLCanvasLayoutGeometry)initWithSize:(CGSize)a3 transform:(CGAffineTransform *)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)geometryByOutsettingBy:(CGSize)a3;
- (id)geometryByTransformingBy:(CGAffineTransform *)a3;
- (id)geometryByTranslatingBy:(CGPoint)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)i_setSize:(CGSize)a3;
- (void)i_setTransform:(CGAffineTransform *)a3;
@end

@implementation CRLCanvasLayoutGeometry

- (CRLCanvasLayoutGeometry)initWithSize:(CGSize)a3 transform:(CGAffineTransform *)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)CRLCanvasLayoutGeometry;
  result = [(CRLCanvasLayoutGeometry *)&v10 init];
  if (result)
  {
    result->_size.CGFloat width = width;
    result->_size.CGFloat height = height;
    long long v8 = *(_OWORD *)&a4->a;
    long long v9 = *(_OWORD *)&a4->c;
    *(_OWORD *)&result->_transform.tx = *(_OWORD *)&a4->tx;
    *(_OWORD *)&result->_transform.c = v9;
    *(_OWORD *)&result->_transform.a = v8;
  }
  return result;
}

- (CRLCanvasLayoutGeometry)init
{
  long long v2 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v4[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v4[1] = v2;
  v4[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  return -[CRLCanvasLayoutGeometry initWithSize:transform:](self, "initWithSize:transform:", v4, 100.0, 100.0);
}

- (CRLCanvasLayoutGeometry)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGAffineTransformMakeTranslation(&v7, a3.origin.x, a3.origin.y);
  return -[CRLCanvasLayoutGeometry initWithSize:transform:](self, "initWithSize:transform:", &v7, width, height);
}

- (CRLCanvasLayoutGeometry)initWithInfoGeometry:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (![v4 heightValid] || (objc_msgSend(v5, "widthValid") & 1) == 0)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FE1D0);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010B9974();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FE1F0);
      }
      v6 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010668E0(v6);
      }
      CGAffineTransform v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasLayoutGeometry initWithInfoGeometry:]");
      long long v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasLayoutGeometry.m"];
      +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:53 isFatal:0 description:"can't create layout geometry from info geometry if width and height are not valid"];
    }
    [v5 size];
    double v10 = v9;
    double v12 = v11;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v19 = 0u;
    [v5 transform];
    v18[0] = v19;
    v18[1] = v20;
    v18[2] = v21;
    self = -[CRLCanvasLayoutGeometry initWithSize:transform:](self, "initWithSize:transform:", v18, v10, v12);
    v13 = self;
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FE190);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B98C4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FE1B0);
    }
    v14 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v14);
    }
    v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasLayoutGeometry initWithInfoGeometry:]");
    v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasLayoutGeometry.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 48, 0, "invalid nil value for '%{public}s'", "infoGeometry");

    v13 = 0;
  }

  return v13;
}

+ (id)geometryFromFullTransform:(CGAffineTransform *)a3
{
  double a = a3->a;
  double b = a3->b;
  double v6 = sqrt(b * b + a * a);
  double c = a3->c;
  double d = a3->d;
  double v9 = sqrt(d * d + c * c);
  if (v6 > 0.01)
  {
    a3->double a = a / v6;
    a3->double b = b / v6;
  }
  if (v9 > 0.01)
  {
    a3->double c = c / v9;
    a3->double d = d / v9;
  }
  double v10 = [CRLCanvasLayoutGeometry alloc];
  long long v11 = *(_OWORD *)&a3->c;
  v14[0] = *(_OWORD *)&a3->a;
  v14[1] = v11;
  v14[2] = *(_OWORD *)&a3->tx;
  double v12 = -[CRLCanvasLayoutGeometry initWithSize:transform:](v10, "initWithSize:transform:", v14, v6, v9);

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  double width = self->_size.width;
  double height = self->_size.height;
  long long v7 = *(_OWORD *)&self->_transform.c;
  v9[0] = *(_OWORD *)&self->_transform.a;
  v9[1] = v7;
  v9[2] = *(_OWORD *)&self->_transform.tx;
  return [v4 initWithSize:v9 transform:width, height];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [CRLCanvasMutableLayoutGeometry alloc];
  double width = self->_size.width;
  double height = self->_size.height;
  long long v7 = *(_OWORD *)&self->_transform.c;
  v9[0] = *(_OWORD *)&self->_transform.a;
  v9[1] = v7;
  v9[2] = *(_OWORD *)&self->_transform.tx;
  return -[CRLCanvasLayoutGeometry initWithSize:transform:](v4, "initWithSize:transform:", v9, width, height);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CRLCanvasLayoutGeometry *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_9;
  }
  if (v4 == self)
  {
    BOOL v12 = 1;
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v6 = v5;
    long long v7 = v6;
    double width = self->_size.width;
    double v9 = v6->_size.width;
    if ((width == v9 || vabdd_f64(width, v9) < 0.000000001)
      && ((double height = self->_size.height, v11 = v6->_size.height, height == v11) || vabdd_f64(height, v11) < 0.000000001))
    {
      long long v13 = *(_OWORD *)&self->_transform.c;
      v17[0] = *(_OWORD *)&self->_transform.a;
      v17[1] = v13;
      v17[2] = *(_OWORD *)&self->_transform.tx;
      long long v14 = *(_OWORD *)&v6->_transform.c;
      v16[0] = *(_OWORD *)&v6->_transform.a;
      v16[1] = v14;
      v16[2] = *(_OWORD *)&v6->_transform.tx;
      BOOL v12 = sub_100064134(v17, v16);
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
LABEL_9:
    BOOL v12 = 0;
  }
LABEL_13:

  return v12;
}

- (unint64_t)hash
{
  return 0xCBF29CE484222325;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  [(CRLCanvasLayoutGeometry *)self frame];
  v5 = NSStringFromCGRect(v13);
  [(CRLCanvasLayoutGeometry *)self size];
  double v6 = NSStringFromCGSize(v12);
  [(CRLCanvasLayoutGeometry *)self transform];
  long long v7 = NSStringFromCGAffineTransform(&transform);
  long long v8 = +[NSString stringWithFormat:@"<%@ %p frame=%@ size=%@ xform=%@>", v4, self, v5, v6, v7];

  return v8;
}

- (void)i_setSize:(CGSize)a3
{
  self->_size = a3;
}

- (void)i_setTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_transform.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_transform.double c = v4;
  *(_OWORD *)&self->_transform.double a = v3;
}

- (CGPoint)center
{
  float64x2_t v2 = vaddq_f64(*(float64x2_t *)&self->_transform.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&self->_transform.c, self->_size.height * 0.5), *(float64x2_t *)&self->_transform.a, self->_size.width * 0.5));
  double v3 = v2.f64[1];
  result.x = v2.f64[0];
  result.y = v3;
  return result;
}

- (CGRect)frame
{
  v5.origin.x = sub_100064070();
  long long v3 = *(_OWORD *)&self->_transform.c;
  *(_OWORD *)&v4.double a = *(_OWORD *)&self->_transform.a;
  *(_OWORD *)&v4.double c = v3;
  *(_OWORD *)&v4.tx = *(_OWORD *)&self->_transform.tx;
  return CGRectApplyAffineTransform(v5, &v4);
}

- (CGAffineTransform)inverseTransform
{
  long long v3 = *(_OWORD *)&self->_transform.c;
  *(_OWORD *)&v5.double a = *(_OWORD *)&self->_transform.a;
  *(_OWORD *)&v5.double c = v3;
  *(_OWORD *)&v5.tx = *(_OWORD *)&self->_transform.tx;
  return CGAffineTransformInvert(retstr, &v5);
}

- (CGAffineTransform)fullTransform
{
  CGFloat v3 = fmax(self->_size.width, 0.00000001);
  CGFloat v4 = fmax(self->_size.height, 0.00000001);
  long long v5 = *(_OWORD *)&self->_transform.c;
  *(_OWORD *)&v7.double a = *(_OWORD *)&self->_transform.a;
  *(_OWORD *)&v7.double c = v5;
  *(_OWORD *)&v7.tx = *(_OWORD *)&self->_transform.tx;
  return CGAffineTransformScale(retstr, &v7, v3, v4);
}

- (CRLCanvasInfoGeometry)infoGeometry
{
  CGFloat v3 = [CRLCanvasInfoGeometry alloc];
  [(CRLCanvasLayoutGeometry *)self transform];
  [(CRLCanvasLayoutGeometry *)self size];
  CGFloat v4 = -[CRLCanvasInfoGeometry initWithTransform:size:](v3, "initWithTransform:size:", &v6);

  return v4;
}

- (id)geometryByTransformingBy:(CGAffineTransform *)a3
{
  memset(&v19, 0, sizeof(v19));
  [(CRLCanvasLayoutGeometry *)self transform];
  long long v5 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t2.double a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t2.double c = v5;
  *(_OWORD *)&t2.tx = *(_OWORD *)&a3->tx;
  CGAffineTransformConcat(&v19, &t1, &t2);
  CGAffineTransform t2 = v19;
  double v6 = sub_10007F81C(&t2.a);
  double v8 = v7;
  CGAffineTransform v16 = v19;
  memset(&t2, 0, sizeof(t2));
  CGAffineTransformScale(&t2, &v16, 1.0 / v6, 1.0 / v7);
  [(CRLCanvasLayoutGeometry *)self size];
  double v10 = v6 * v9;
  [(CRLCanvasLayoutGeometry *)self size];
  double v12 = v8 * v11;
  CGRect v13 = [CRLCanvasLayoutGeometry alloc];
  CGAffineTransform v16 = t2;
  long long v14 = -[CRLCanvasLayoutGeometry initWithSize:transform:](v13, "initWithSize:transform:", &v16, v10, v12);

  return v14;
}

- (id)geometryByTranslatingBy:(CGPoint)a3
{
  CGAffineTransformMakeTranslation(&v6, a3.x, a3.y);
  CGFloat v4 = [(CRLCanvasLayoutGeometry *)self geometryByTransformingBy:&v6];

  return v4;
}

- (id)geometryByOutsettingBy:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = [(CRLCanvasLayoutGeometry *)self mutableCopy];
  [v5 outsetBy:width, height];

  return v5;
}

- (CGAffineTransform)transformByConcatenatingTransformTo:(SEL)a3
{
  long long v4 = *(_OWORD *)&a4->c;
  *(_OWORD *)&t1.double a = *(_OWORD *)&a4->a;
  *(_OWORD *)&t1.double c = v4;
  *(_OWORD *)&t1.tx = *(_OWORD *)&a4->tx;
  long long v5 = *(_OWORD *)&self->_transform.c;
  *(_OWORD *)&v7.double a = *(_OWORD *)&self->_transform.a;
  *(_OWORD *)&v7.double c = v5;
  *(_OWORD *)&v7.tx = *(_OWORD *)&self->_transform.tx;
  return CGAffineTransformConcat(retstr, &t1, &v7);
}

- (BOOL)differsInMoreThanTranslationFrom:(id)a3
{
  id v4 = a3;
  if (v4
    && ([(CRLCanvasLayoutGeometry *)self frame],
        double v6 = v5,
        double v8 = v7,
        [v4 frame],
        sub_100064084(v6, v8, v9, v10)))
  {
    [(CRLCanvasLayoutGeometry *)self transform];
    [v4 transform];
    BOOL v11 = !sub_10007F73C(v14, &v13);
  }
  else
  {
    LOBYTE(v11) = 1;
  }

  return v11;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGAffineTransform)transform
{
  long long v3 = *(_OWORD *)&self->ty;
  *(_OWORD *)&retstr->double a = *(_OWORD *)&self->d;
  *(_OWORD *)&retstr->double c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[1].b;
  return self;
}

@end