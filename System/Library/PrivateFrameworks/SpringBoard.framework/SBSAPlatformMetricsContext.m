@interface SBSAPlatformMetricsContext
+ (Class)mutatorClass;
+ (id)instanceWithBlock:(id)a3;
- (BOOL)isEqual:(id)a3;
- (SBSAPlatformMetricsContext)init;
- (SBSAPlatformMetricsContext)initWithPlatformMetricsContext:(id)a3;
- (double)customLayoutOvalCornerRadius;
- (double)customLayoutSquareCornerRadius;
- (double)customLayoutSquareLargeCornerRadius;
- (double)customLayoutTallRectCornerRadius;
- (double)maximumCornerRadius;
- (double)minimumEdgePadding;
- (id)copyBySettingCustomLayoutOvalCornerRadius:(double)a3;
- (id)copyBySettingCustomLayoutSquareCornerRadius:(double)a3;
- (id)copyBySettingCustomLayoutSquareLargeCornerRadius:(double)a3;
- (id)copyBySettingCustomLayoutTallRectCornerRadius:(double)a3;
- (id)copyBySettingMaximumCornerRadius:(double)a3;
- (id)copyBySettingMinimumEdgePadding:(double)a3;
- (id)copyWithBlock:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)_setCustomLayoutOvalCornerRadius:(double)a3;
- (void)_setCustomLayoutSquareCornerRadius:(double)a3;
- (void)_setCustomLayoutSquareLargeCornerRadius:(double)a3;
- (void)_setCustomLayoutTallRectCornerRadius:(double)a3;
- (void)_setMaximumCornerRadius:(double)a3;
- (void)_setMinimumEdgePadding:(double)a3;
@end

@implementation SBSAPlatformMetricsContext

- (void).cxx_destruct
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  return (id)[v4 initWithPlatformMetricsContext:self];
}

- (SBSAPlatformMetricsContext)initWithPlatformMetricsContext:(id)a3
{
  id v4 = (id *)a3;
  v5 = [(SBSAPlatformMetricsContext *)self init];
  if (v5)
  {
    uint64_t v6 = [v4[1] mutableCopy];
    metricsDictionary = v5->_metricsDictionary;
    v5->_metricsDictionary = (NSMutableDictionary *)v6;
  }
  return v5;
}

- (SBSAPlatformMetricsContext)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBSAPlatformMetricsContext;
  v2 = [(SBSAPlatformMetricsContext *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    metricsDictionary = v2->_metricsDictionary;
    v2->_metricsDictionary = v3;
  }
  return v2;
}

- (double)maximumCornerRadius
{
  double v4 = 0.0;
  v2 = [(NSMutableDictionary *)self->_metricsDictionary objectForKey:@"maximumCornerRadius"];
  [v2 getValue:&v4 size:8];

  return v4;
}

- (id)copyWithBlock:(id)a3
{
  double v4 = (void (**)(id, void *))a3;
  v5 = (void *)[(SBSAPlatformMetricsContext *)self copy];
  if (v4)
  {
    objc_super v6 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "mutatorClass")), "initWithPlatformMetricsContext:", v5);
    v4[2](v4, v6);
  }
  return v5;
}

- (void)_setMinimumEdgePadding:(double)a3
{
  metricsDictionary = self->_metricsDictionary;
  id v4 = [NSNumber numberWithDouble:a3];
  [(NSMutableDictionary *)metricsDictionary setObject:v4 forKey:@"minimumEdgePadding"];
}

- (void)_setMaximumCornerRadius:(double)a3
{
  metricsDictionary = self->_metricsDictionary;
  id v4 = [NSNumber numberWithDouble:a3];
  [(NSMutableDictionary *)metricsDictionary setObject:v4 forKey:@"maximumCornerRadius"];
}

- (void)_setCustomLayoutTallRectCornerRadius:(double)a3
{
  metricsDictionary = self->_metricsDictionary;
  id v4 = [NSNumber numberWithDouble:a3];
  [(NSMutableDictionary *)metricsDictionary setObject:v4 forKey:@"customLayoutTallRectCornerRadius"];
}

- (void)_setCustomLayoutSquareLargeCornerRadius:(double)a3
{
  metricsDictionary = self->_metricsDictionary;
  id v4 = [NSNumber numberWithDouble:a3];
  [(NSMutableDictionary *)metricsDictionary setObject:v4 forKey:@"customLayoutSquareLargeCornerRadius"];
}

- (void)_setCustomLayoutSquareCornerRadius:(double)a3
{
  metricsDictionary = self->_metricsDictionary;
  id v4 = [NSNumber numberWithDouble:a3];
  [(NSMutableDictionary *)metricsDictionary setObject:v4 forKey:@"customLayoutSquareCornerRadius"];
}

- (void)_setCustomLayoutOvalCornerRadius:(double)a3
{
  metricsDictionary = self->_metricsDictionary;
  id v4 = [NSNumber numberWithDouble:a3];
  [(NSMutableDictionary *)metricsDictionary setObject:v4 forKey:@"customLayoutOvalCornerRadius"];
}

+ (Class)mutatorClass
{
  return (Class)objc_opt_class();
}

- (id)copyBySettingMaximumCornerRadius:(double)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__SBSAPlatformMetricsContext_copyBySettingMaximumCornerRadius___block_invoke;
  v4[3] = &__block_descriptor_40_e8_v16__0_8l;
  *(double *)&v4[4] = a3;
  return [(SBSAPlatformMetricsContext *)self copyWithBlock:v4];
}

uint64_t __63__SBSAPlatformMetricsContext_copyBySettingMaximumCornerRadius___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setMaximumCornerRadius:*(double *)(a1 + 32)];
}

- (double)customLayoutSquareCornerRadius
{
  double v4 = 0.0;
  v2 = [(NSMutableDictionary *)self->_metricsDictionary objectForKey:@"customLayoutSquareCornerRadius"];
  [v2 getValue:&v4 size:8];

  return v4;
}

- (id)copyBySettingCustomLayoutSquareCornerRadius:(double)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __74__SBSAPlatformMetricsContext_copyBySettingCustomLayoutSquareCornerRadius___block_invoke;
  v4[3] = &__block_descriptor_40_e8_v16__0_8l;
  *(double *)&v4[4] = a3;
  return [(SBSAPlatformMetricsContext *)self copyWithBlock:v4];
}

uint64_t __74__SBSAPlatformMetricsContext_copyBySettingCustomLayoutSquareCornerRadius___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setCustomLayoutSquareCornerRadius:*(double *)(a1 + 32)];
}

- (double)customLayoutSquareLargeCornerRadius
{
  double v4 = 0.0;
  v2 = [(NSMutableDictionary *)self->_metricsDictionary objectForKey:@"customLayoutSquareLargeCornerRadius"];
  [v2 getValue:&v4 size:8];

  return v4;
}

- (id)copyBySettingCustomLayoutSquareLargeCornerRadius:(double)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __79__SBSAPlatformMetricsContext_copyBySettingCustomLayoutSquareLargeCornerRadius___block_invoke;
  v4[3] = &__block_descriptor_40_e8_v16__0_8l;
  *(double *)&v4[4] = a3;
  return [(SBSAPlatformMetricsContext *)self copyWithBlock:v4];
}

uint64_t __79__SBSAPlatformMetricsContext_copyBySettingCustomLayoutSquareLargeCornerRadius___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setCustomLayoutSquareLargeCornerRadius:*(double *)(a1 + 32)];
}

- (double)customLayoutOvalCornerRadius
{
  double v4 = 0.0;
  v2 = [(NSMutableDictionary *)self->_metricsDictionary objectForKey:@"customLayoutOvalCornerRadius"];
  [v2 getValue:&v4 size:8];

  return v4;
}

- (id)copyBySettingCustomLayoutOvalCornerRadius:(double)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __72__SBSAPlatformMetricsContext_copyBySettingCustomLayoutOvalCornerRadius___block_invoke;
  v4[3] = &__block_descriptor_40_e8_v16__0_8l;
  *(double *)&v4[4] = a3;
  return [(SBSAPlatformMetricsContext *)self copyWithBlock:v4];
}

uint64_t __72__SBSAPlatformMetricsContext_copyBySettingCustomLayoutOvalCornerRadius___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setCustomLayoutOvalCornerRadius:*(double *)(a1 + 32)];
}

- (double)customLayoutTallRectCornerRadius
{
  double v4 = 0.0;
  v2 = [(NSMutableDictionary *)self->_metricsDictionary objectForKey:@"customLayoutTallRectCornerRadius"];
  [v2 getValue:&v4 size:8];

  return v4;
}

- (id)copyBySettingCustomLayoutTallRectCornerRadius:(double)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __76__SBSAPlatformMetricsContext_copyBySettingCustomLayoutTallRectCornerRadius___block_invoke;
  v4[3] = &__block_descriptor_40_e8_v16__0_8l;
  *(double *)&v4[4] = a3;
  return [(SBSAPlatformMetricsContext *)self copyWithBlock:v4];
}

uint64_t __76__SBSAPlatformMetricsContext_copyBySettingCustomLayoutTallRectCornerRadius___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setCustomLayoutTallRectCornerRadius:*(double *)(a1 + 32)];
}

- (double)minimumEdgePadding
{
  double v4 = 0.0;
  v2 = [(NSMutableDictionary *)self->_metricsDictionary objectForKey:@"minimumEdgePadding"];
  [v2 getValue:&v4 size:8];

  return v4;
}

- (id)copyBySettingMinimumEdgePadding:(double)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __62__SBSAPlatformMetricsContext_copyBySettingMinimumEdgePadding___block_invoke;
  v4[3] = &__block_descriptor_40_e8_v16__0_8l;
  *(double *)&v4[4] = a3;
  return [(SBSAPlatformMetricsContext *)self copyWithBlock:v4];
}

uint64_t __62__SBSAPlatformMetricsContext_copyBySettingMinimumEdgePadding___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setMinimumEdgePadding:*(double *)(a1 + 32)];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  metricsDictionary = self->_metricsDictionary;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __38__SBSAPlatformMetricsContext_isEqual___block_invoke;
  v11[3] = &unk_1E6AF9E90;
  id v12 = v4;
  id v7 = v4;
  v8 = [v5 appendObject:metricsDictionary counterpart:v11];
  char v9 = [v8 isEqual];

  return v9;
}

id __38__SBSAPlatformMetricsContext_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 8);
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = [v3 appendObject:self->_metricsDictionary];
  unint64_t v5 = [v4 hash];

  return v5;
}

+ (id)instanceWithBlock:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  unint64_t v5 = (void *)[v4 copyWithBlock:v3];

  return v5;
}

@end