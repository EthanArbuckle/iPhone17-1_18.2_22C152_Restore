@interface TSDExteriorTextWrap
+ (TSDExteriorTextWrap)exteriorTextWrapWithIsHTMLWrap:(BOOL)a3 type:(int)a4 direction:(int)a5 fitType:(int)a6 margin:(double)a7 alphaThreshold:(double)a8;
+ (id)exteriorTextWrap;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHTMLWrap;
- (TSDExteriorTextWrap)init;
- (TSDExteriorTextWrap)initWithIsHTMLWrap:(BOOL)a3 type:(int)a4 direction:(int)a5 fitType:(int)a6 margin:(double)a7 alphaThreshold:(double)a8;
- (double)alphaThreshold;
- (double)margin;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int)direction;
- (int)fitType;
- (int)type;
@end

@implementation TSDExteriorTextWrap

+ (id)exteriorTextWrap
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

+ (TSDExteriorTextWrap)exteriorTextWrapWithIsHTMLWrap:(BOOL)a3 type:(int)a4 direction:(int)a5 fitType:(int)a6 margin:(double)a7 alphaThreshold:(double)a8
{
  v8 = (void *)[objc_alloc((Class)a1) initWithIsHTMLWrap:a3 type:*(void *)&a4 direction:*(void *)&a5 fitType:*(void *)&a6 margin:a7 alphaThreshold:a8];

  return (TSDExteriorTextWrap *)v8;
}

- (TSDExteriorTextWrap)init
{
  return [(TSDExteriorTextWrap *)self initWithIsHTMLWrap:0 type:4 direction:2 fitType:1 margin:0.0 alphaThreshold:0.5];
}

- (TSDExteriorTextWrap)initWithIsHTMLWrap:(BOOL)a3 type:(int)a4 direction:(int)a5 fitType:(int)a6 margin:(double)a7 alphaThreshold:(double)a8
{
  v15.receiver = self;
  v15.super_class = (Class)TSDExteriorTextWrap;
  result = [(TSDExteriorTextWrap *)&v15 init];
  if (result)
  {
    result->_isHTMLWrap = a3;
    result->_type = a4;
    result->_direction = a5;
    result->_fitType = a6;
    result->_margin = a7;
    result->_alphaThreshold = a8;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  BOOL isHTMLWrap = self->_isHTMLWrap;
  uint64_t type = self->_type;
  uint64_t direction = self->_direction;
  uint64_t fitType = self->_fitType;
  double margin = self->_margin;
  double alphaThreshold = self->_alphaThreshold;

  return (id)[v4 initWithIsHTMLWrap:isHTMLWrap type:type direction:direction fitType:fitType margin:margin alphaThreshold:alphaThreshold];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = +[TSDMutableExteriorTextWrap allocWithZone:a3];
  BOOL isHTMLWrap = self->_isHTMLWrap;
  uint64_t type = self->_type;
  uint64_t direction = self->_direction;
  uint64_t fitType = self->_fitType;
  double margin = self->_margin;
  double alphaThreshold = self->_alphaThreshold;

  return [(TSDExteriorTextWrap *)v4 initWithIsHTMLWrap:isHTMLWrap type:type direction:direction fitType:fitType margin:margin alphaThreshold:alphaThreshold];
}

- (BOOL)isEqual:(id)a3
{
  v3 = self;
  BOOL v4 = a3 == self;
  LOBYTE(self) = a3 == self;
  if (a3)
  {
    if (!v4)
    {
      LODWORD(self) = [a3 isMemberOfClass:objc_opt_class()];
      if (self)
      {
        if (*((unsigned __int8 *)a3 + 8) == v3->_isHTMLWrap
          && *((_DWORD *)a3 + 3) == v3->_type
          && *((_DWORD *)a3 + 4) == v3->_direction
          && *((_DWORD *)a3 + 5) == v3->_fitType
          && ((v6 = *((double *)a3 + 3), double margin = v3->_margin, v6 == margin)
           || vabdd_f64(v6, margin) < fabs(margin * 0.000000999999997)))
        {
          double v8 = *((double *)a3 + 4);
          double alphaThreshold = v3->_alphaThreshold;
          LOBYTE(self) = v8 == alphaThreshold
                      || vabdd_f64(v8, alphaThreshold) < fabs(alphaThreshold * 0.000000999999997);
        }
        else
        {
          LOBYTE(self) = 0;
        }
      }
    }
  }
  return (char)self;
}

- (id)description
{
  BOOL isHTMLWrap = self->_isHTMLWrap;
  unsigned int v4 = [(TSDExteriorTextWrap *)self type];
  if (v4 > 5) {
    v5 = &stru_26D688A48;
  }
  else {
    v5 = off_2646B1DE8[v4];
  }
  unsigned int v6 = [(TSDExteriorTextWrap *)self direction];
  v7 = &stru_26D688A48;
  if (v6 <= 2) {
    v7 = off_2646B1E18[v6];
  }
  int v8 = [(TSDExteriorTextWrap *)self fitType];
  v9 = @"Contour";
  if (v8 != 1) {
    v9 = &stru_26D688A48;
  }
  if (v8) {
    v10 = v9;
  }
  else {
    v10 = @"Rectangular";
  }
  if (isHTMLWrap) {
    v11 = @"YES";
  }
  else {
    v11 = @"NO";
  }
  v12 = NSString;
  [(TSDExteriorTextWrap *)self margin];
  uint64_t v14 = v13;
  [(TSDExteriorTextWrap *)self alphaThreshold];
  return (id)[v12 stringWithFormat:@"TSDExteriorTextWrap isHTMLWrap=%@, type=%@, direction=%@, fitType=%@, margin=%f, alphaThreshold=%f", v11, v5, v7, v10, v14, v15];
}

- (BOOL)isHTMLWrap
{
  return self->_isHTMLWrap;
}

- (int)type
{
  return self->_type;
}

- (int)direction
{
  return self->_direction;
}

- (int)fitType
{
  return self->_fitType;
}

- (double)margin
{
  return self->_margin;
}

- (double)alphaThreshold
{
  return self->_alphaThreshold;
}

@end