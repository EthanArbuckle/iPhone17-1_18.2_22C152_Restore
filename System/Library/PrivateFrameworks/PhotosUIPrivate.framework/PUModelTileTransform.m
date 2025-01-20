@interface PUModelTileTransform
- (BOOL)hasUserInput;
- (BOOL)hasUserZoomedIn;
- (BOOL)hasUserZoomedOut;
- (BOOL)isEqual:(id)a3;
- (BOOL)isZoomedOut;
- (CGPoint)normalizedTranslation;
- (CGPoint)overscroll;
- (NSString)userInputOriginIdentifier;
- (PUModelTileTransform)init;
- (PUModelTileTransform)initWithNoUserInput;
- (PUModelTileTransform)initWithNormalizedTranslation:(CGPoint)a3 overscroll:(CGPoint)a4 scale:(double)a5 userInputOriginIdentifier:(id)a6 isZoomedOut:(BOOL)a7;
- (double)scale;
- (id)copyWithScale:(double)a3 normalizedTranslation:(CGPoint)a4;
- (id)description;
- (unint64_t)hash;
@end

@implementation PUModelTileTransform

- (void).cxx_destruct
{
}

- (BOOL)isZoomedOut
{
  return self->_isZoomedOut;
}

- (NSString)userInputOriginIdentifier
{
  return self->_userInputOriginIdentifier;
}

- (CGPoint)overscroll
{
  double x = self->_overscroll.x;
  double y = self->_overscroll.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)normalizedTranslation
{
  double x = self->_normalizedTranslation.x;
  double y = self->_normalizedTranslation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)scale
{
  return self->_scale;
}

- (BOOL)hasUserInput
{
  return self->_hasUserInput;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  BOOL hasUserInput = self->_hasUserInput;
  v6 = NSStringFromCGPoint(self->_normalizedTranslation);
  v7 = NSStringFromCGPoint(self->_overscroll);
  v8 = [v3 stringWithFormat:@"<%@ %p hasUserInput:%i referencePoint:%@ overScroll:%@ scale:%f>", v4, self, hasUserInput, v6, v7, *(void *)&self->_scale];

  return v8;
}

- (BOOL)hasUserZoomedOut
{
  BOOL v3 = [(PUModelTileTransform *)self hasUserInput];
  if (v3)
  {
    [(PUModelTileTransform *)self scale];
    LOBYTE(v3) = v4 < 1.0;
  }
  return v3;
}

- (BOOL)hasUserZoomedIn
{
  BOOL v3 = [(PUModelTileTransform *)self hasUserInput];
  if (v3)
  {
    [(PUModelTileTransform *)self scale];
    LOBYTE(v3) = v4 > 1.0;
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int v6 = [(PUModelTileTransform *)self hasUserInput];
    if (v6 == [v5 hasUserInput])
    {
      [(PUModelTileTransform *)self normalizedTranslation];
      double v9 = v8;
      double v11 = v10;
      [v5 normalizedTranslation];
      BOOL v7 = 0;
      if (v9 == v13 && v11 == v12)
      {
        [(PUModelTileTransform *)self overscroll];
        double v15 = v14;
        double v17 = v16;
        [v5 overscroll];
        BOOL v7 = 0;
        if (v15 == v19 && v17 == v18)
        {
          [(PUModelTileTransform *)self scale];
          double v21 = v20;
          [v5 scale];
          BOOL v7 = v21 == v22;
        }
      }
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  if (![(PUModelTileTransform *)self hasUserInput]) {
    return 0;
  }
  [(PUModelTileTransform *)self normalizedTranslation];
  uint64_t v4 = (uint64_t)(v3 * 100.0);
  [(PUModelTileTransform *)self normalizedTranslation];
  uint64_t v6 = (uint64_t)(v5 * 100.0);
  [(PUModelTileTransform *)self overscroll];
  uint64_t v8 = (uint64_t)v7;
  [(PUModelTileTransform *)self overscroll];
  uint64_t v10 = (uint64_t)v9;
  [(PUModelTileTransform *)self scale];
  return v4 ^ v6 ^ v8 ^ v10 ^ (uint64_t)(v11 * 100.0) ^ 0x2A;
}

- (id)copyWithScale:(double)a3 normalizedTranslation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v8 = [PUModelTileTransform alloc];
  [(PUModelTileTransform *)self overscroll];
  double v10 = v9;
  double v12 = v11;
  double v13 = [(PUModelTileTransform *)self userInputOriginIdentifier];
  double v14 = -[PUModelTileTransform initWithNormalizedTranslation:overscroll:scale:userInputOriginIdentifier:isZoomedOut:](v8, "initWithNormalizedTranslation:overscroll:scale:userInputOriginIdentifier:isZoomedOut:", v13, [(PUModelTileTransform *)self isZoomedOut], x, y, v10, v12, a3);

  return v14;
}

- (PUModelTileTransform)initWithNormalizedTranslation:(CGPoint)a3 overscroll:(CGPoint)a4 scale:(double)a5 userInputOriginIdentifier:(id)a6 isZoomedOut:(BOOL)a7
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  CGFloat v11 = a3.y;
  CGFloat v12 = a3.x;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)PUModelTileTransform;
  double v15 = [(PUModelTileTransform *)&v20 init];
  double v16 = v15;
  if (v15)
  {
    v15->_BOOL hasUserInput = 1;
    v15->_normalizedTranslation.CGFloat x = v12;
    v15->_normalizedTranslation.CGFloat y = v11;
    v15->_overscroll.CGFloat x = x;
    v15->_overscroll.CGFloat y = y;
    v15->_scale = a5;
    uint64_t v17 = [v14 copy];
    userInputOriginIdentifier = v16->_userInputOriginIdentifier;
    v16->_userInputOriginIdentifier = (NSString *)v17;

    v16->_isZoomedOut = a7;
  }

  return v16;
}

- (PUModelTileTransform)initWithNoUserInput
{
  v3.receiver = self;
  v3.super_class = (Class)PUModelTileTransform;
  CGPoint result = [(PUModelTileTransform *)&v3 init];
  if (result) {
    result->_scale = 1.0;
  }
  return result;
}

- (PUModelTileTransform)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PUModelTileTransform.m" lineNumber:15 description:@"please use a designated initializer"];

  return [(PUModelTileTransform *)self initWithNoUserInput];
}

@end