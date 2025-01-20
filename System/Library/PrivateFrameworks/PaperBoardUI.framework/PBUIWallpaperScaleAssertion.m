@interface PBUIWallpaperScaleAssertion
- (NSString)description;
- (double)initWithVariant:(void *)a3 scale:(void *)a4 forReason:(double)a5 invalidationBlock:;
- (double)scale;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (uint64_t)variant;
- (void)dealloc;
- (void)invalidate;
- (void)invalidateWithAnimationFactory:(id)a3;
@end

@implementation PBUIWallpaperScaleAssertion

- (void).cxx_destruct
{
}

void __81__PBUIWallpaperScaleAssertion_initWithVariant_scale_forReason_invalidationBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  id v7 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      v5 = v7;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  id v6 = v5;

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (uint64_t)variant
{
  if (result) {
    return *(void *)(result + 56);
  }
  return result;
}

- (double)scale
{
  if (a1) {
    return *(double *)(a1 + 64);
  }
  else {
    return 0.0;
  }
}

- (double)initWithVariant:(void *)a3 scale:(void *)a4 forReason:(double)a5 invalidationBlock:
{
  id v9 = a3;
  id v10 = a4;
  v11 = v10;
  if (a1)
  {
    if (!v10)
    {
      v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:sel_initWithVariant_scale_forReason_invalidationBlock_, a1, @"PBUIWallpaperScaleAssertion.m", 19, @"Invalid parameter not satisfying: %@", @"invalidationBlock" object file lineNumber description];
    }
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __81__PBUIWallpaperScaleAssertion_initWithVariant_scale_forReason_invalidationBlock___block_invoke;
    v18[3] = &unk_1E62B42A8;
    id v19 = v11;
    v12 = (void *)MEMORY[0x1C1872570](v18);
    v17.receiver = a1;
    v17.super_class = (Class)PBUIWallpaperScaleAssertion;
    v13 = (double *)objc_msgSendSuper2(&v17, sel_initWithIdentifier_forReason_invalidationBlock_, @"WallpaperScale", v9, v12);
    if (v13)
    {
      *((void *)v13 + 7) = a2;
      v13[8] = a5;
    }
    v14 = v13;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)dealloc
{
  [(PBUIWallpaperScaleAssertion *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PBUIWallpaperScaleAssertion;
  [(BSSimpleAssertion *)&v3 dealloc];
}

- (void)invalidate
{
}

- (void)invalidateWithAnimationFactory:(id)a3
{
  uint64_t v4 = (BSUIAnimationFactory *)[a3 copy];
  invalidationAnimationFactory = self->_invalidationAnimationFactory;
  self->_invalidationAnimationFactory = v4;

  v6.receiver = self;
  v6.super_class = (Class)PBUIWallpaperScaleAssertion;
  [(BSSimpleAssertion *)&v6 invalidate];
}

- (NSString)description
{
  return (NSString *)[(PBUIWallpaperScaleAssertion *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(PBUIWallpaperScaleAssertion *)self succinctDescriptionBuilder];
  objc_super v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  objc_super v3 = [(PBUIWallpaperScaleAssertion *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  uint64_t v4 = [(PBUIWallpaperScaleAssertion *)self succinctDescriptionBuilder];
  if (self)
  {
    v5 = PBUIStringForWallpaperVariant(self->_variant);
    [v4 appendString:v5 withName:@"variant"];

    double scale = self->_scale;
  }
  else
  {
    id v9 = PBUIStringForWallpaperVariant(0);
    [v4 appendString:v9 withName:@"variant"];

    double scale = 0.0;
  }
  id v7 = (id)[v4 appendFloat:@"scale" withName:scale];
  return v4;
}

@end