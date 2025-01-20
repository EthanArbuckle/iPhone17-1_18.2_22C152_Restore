@interface SBSAPlatformMetricsContextMutator
- (SBSAPlatformMetricsContext)mutatable;
- (SBSAPlatformMetricsContextMutator)initWithPlatformMetricsContext:(id)a3;
- (double)customLayoutOvalCornerRadius;
- (double)customLayoutSquareCornerRadius;
- (double)customLayoutSquareLargeCornerRadius;
- (double)customLayoutTallRectCornerRadius;
- (double)maximumCornerRadius;
- (double)minimumEdgePadding;
- (id)description;
- (void)setCustomLayoutOvalCornerRadius:(double)a3;
- (void)setCustomLayoutSquareCornerRadius:(double)a3;
- (void)setCustomLayoutSquareLargeCornerRadius:(double)a3;
- (void)setCustomLayoutTallRectCornerRadius:(double)a3;
- (void)setMaximumCornerRadius:(double)a3;
- (void)setMinimumEdgePadding:(double)a3;
@end

@implementation SBSAPlatformMetricsContextMutator

- (void)setMinimumEdgePadding:(double)a3
{
}

- (void)setMaximumCornerRadius:(double)a3
{
}

- (void)setCustomLayoutTallRectCornerRadius:(double)a3
{
}

- (void)setCustomLayoutSquareLargeCornerRadius:(double)a3
{
}

- (void)setCustomLayoutSquareCornerRadius:(double)a3
{
}

- (void)setCustomLayoutOvalCornerRadius:(double)a3
{
}

- (SBSAPlatformMetricsContextMutator)initWithPlatformMetricsContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSAPlatformMetricsContextMutator;
  v6 = [(SBSAPlatformMetricsContextMutator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_mutatable, a3);
  }

  return v7;
}

- (void).cxx_destruct
{
}

- (double)maximumCornerRadius
{
  [(SBSAPlatformMetricsContext *)self->_mutatable maximumCornerRadius];
  return result;
}

- (double)customLayoutSquareCornerRadius
{
  [(SBSAPlatformMetricsContext *)self->_mutatable customLayoutSquareCornerRadius];
  return result;
}

- (double)customLayoutSquareLargeCornerRadius
{
  [(SBSAPlatformMetricsContext *)self->_mutatable customLayoutSquareLargeCornerRadius];
  return result;
}

- (double)customLayoutOvalCornerRadius
{
  [(SBSAPlatformMetricsContext *)self->_mutatable customLayoutOvalCornerRadius];
  return result;
}

- (double)customLayoutTallRectCornerRadius
{
  [(SBSAPlatformMetricsContext *)self->_mutatable customLayoutTallRectCornerRadius];
  return result;
}

- (double)minimumEdgePadding
{
  [(SBSAPlatformMetricsContext *)self->_mutatable minimumEdgePadding];
  return result;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; defaultsContext: %@>",
               objc_opt_class(),
               self,
               self->_mutatable);
}

- (SBSAPlatformMetricsContext)mutatable
{
  return self->_mutatable;
}

@end