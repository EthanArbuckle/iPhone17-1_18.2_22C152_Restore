@interface PDAnimationShapeTarget
- (BOOL)isEqual:(id)a3;
- (PDAnimationShapeTarget)init;
- (id)drawable;
- (unint64_t)hash;
- (void)setDrawable:(id)a3;
@end

@implementation PDAnimationShapeTarget

- (PDAnimationShapeTarget)init
{
  v3.receiver = self;
  v3.super_class = (Class)PDAnimationShapeTarget;
  return [(PDAnimationShapeTarget *)&v3 init];
}

- (void)setDrawable:(id)a3
{
}

- (id)drawable
{
  return self->mDrawable;
}

- (unint64_t)hash
{
  v2 = [(PDAnimationShapeTarget *)self drawable];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(PDAnimationShapeTarget *)self drawable];
    v6 = [v4 drawable];
    BOOL v7 = v5 == v6;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
}

@end