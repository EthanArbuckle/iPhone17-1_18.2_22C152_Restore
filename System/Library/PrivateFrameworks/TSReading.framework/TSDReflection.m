@interface TSDReflection
+ (BOOL)canMixWithNilObjects;
+ (id)reflection;
- (BOOL)isEqual:(id)a3;
- (TSDReflection)init;
- (TSDReflection)initWithOpacity:(double)a3;
- (TSDReflection)initWithOpacity:(double)a3 fadeAcceleration:(double)a4;
- (double)fadeAcceleration;
- (double)opacity;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)mixingTypeWithObject:(id)a3;
- (unint64_t)hash;
@end

@implementation TSDReflection

+ (id)reflection
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

- (TSDReflection)init
{
  return [(TSDReflection *)self initWithOpacity:0.5 fadeAcceleration:1.79999995];
}

- (TSDReflection)initWithOpacity:(double)a3 fadeAcceleration:(double)a4
{
  v8.receiver = self;
  v8.super_class = (Class)TSDReflection;
  v5 = [(TSDReflection *)&v8 init];
  if (v5)
  {
    TSUClamp();
    v5->mOpacity = v6;
    v5->mFadeAcceleration = a4;
  }
  return v5;
}

- (TSDReflection)initWithOpacity:(double)a3
{
  return [(TSDReflection *)self initWithOpacity:a3 fadeAcceleration:1.79999995];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  if (!a3) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  [(TSDReflection *)self opacity];
  double v6 = v5;
  [a3 opacity];
  return v6 == v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  [(TSDReflection *)self opacity];
  double v6 = v5;
  [(TSDReflection *)self fadeAcceleration];

  return (id)[v4 initWithOpacity:v6 fadeAcceleration:v7];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = +[TSDMutableReflection allocWithZone:a3];
  [(TSDReflection *)self opacity];
  double v6 = v5;
  [(TSDReflection *)self fadeAcceleration];

  return [(TSDReflection *)v4 initWithOpacity:v6 fadeAcceleration:v7];
}

- (unint64_t)hash
{
  return TSUHash();
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  [(TSDReflection *)self opacity];
  return (id)[v3 stringWithFormat:@"<%@ %p opacity=%g>", v5, self, v6];
}

- (int64_t)mixingTypeWithObject:(id)a3
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __38__TSDReflection_mixingTypeWithObject___block_invoke;
  v4[3] = &unk_2646B1758;
  v4[4] = a3;
  v4[5] = self;
  return TSDMixingTypeWithObject((unint64_t)self, (unint64_t)a3, (uint64_t)v4);
}

uint64_t __38__TSDReflection_mixingTypeWithObject___block_invoke(uint64_t a1)
{
  objc_opt_class();
  id v2 = (void *)TSUDynamicCast();
  if (!v2)
  {
    v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDReflection mixingTypeWithObject:]_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDReflection.m"), 86, @"nil object after cast");
  }
  [*(id *)(a1 + 40) opacity];
  double v6 = v5;
  [v2 opacity];
  if (v6 == v7) {
    return 5;
  }
  else {
    return 4;
  }
}

- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __50__TSDReflection_mixedObjectWithFraction_ofObject___block_invoke;
  v5[3] = &unk_2646B1780;
  v5[4] = a4;
  v5[5] = self;
  *(double *)&v5[6] = a3;
  return (id)TSDMixingMixedObjectWithFraction(self, a4, (uint64_t)v5);
}

TSDReflection *__50__TSDReflection_mixedObjectWithFraction_ofObject___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_opt_class();
    id v2 = (void *)TSUDynamicCast();
    [*(id *)(a1 + 40) opacity];
    double v4 = v3;
    if (v2)
    {
      [v2 opacity];
      double v6 = v5;
      double v8 = *(double *)(a1 + 48);
      double v7 = (double *)(a1 + 48);
      double v9 = v8;
      [*((id *)v7 - 1) fadeAcceleration];
      double v11 = v10;
      [v2 fadeAcceleration];
      double v13 = v12;
      goto LABEL_7;
    }
  }
  else
  {
    [*(id *)(a1 + 40) opacity];
    double v4 = v14;
  }
  double v15 = *(double *)(a1 + 48);
  double v7 = (double *)(a1 + 48);
  double v9 = v15;
  [*((id *)v7 - 1) fadeAcceleration];
  double v11 = v16;
  [*((id *)v7 - 1) fadeAcceleration];
  double v13 = v17;
  double v6 = 0.0;
LABEL_7:
  double v18 = TSDMixFloats(v4, v6, v9);
  v19 = [[TSDReflection alloc] initWithOpacity:v18 fadeAcceleration:TSDMixFloats(v11, v13, *v7)];

  return v19;
}

+ (BOOL)canMixWithNilObjects
{
  return 1;
}

- (double)opacity
{
  return self->mOpacity;
}

- (double)fadeAcceleration
{
  return self->mFadeAcceleration;
}

@end