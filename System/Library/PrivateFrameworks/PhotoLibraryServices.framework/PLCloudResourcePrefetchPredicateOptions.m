@interface PLCloudResourcePrefetchPredicateOptions
- (BOOL)excludeDynamicResources;
- (PLCloudResourcePrefetchPredicateOptions)initWithPrefetchMode:(int64_t)a3 prefetchOptimizeMode:(int64_t)a4 excludeDynamicResources:(BOOL)a5 prefetchConfiguration:(id)a6;
- (PLPrefetchConfiguration)prefetchConfiguration;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)prefetchMode;
- (int64_t)prefetchOptimizeMode;
- (void)setExcludeDynamicResources:(BOOL)a3;
- (void)setPrefetchConfiguration:(id)a3;
- (void)setPrefetchMode:(int64_t)a3;
- (void)setPrefetchOptimizeMode:(int64_t)a3;
@end

@implementation PLCloudResourcePrefetchPredicateOptions

- (void).cxx_destruct
{
}

- (void)setPrefetchConfiguration:(id)a3
{
}

- (PLPrefetchConfiguration)prefetchConfiguration
{
  return self->_prefetchConfiguration;
}

- (void)setExcludeDynamicResources:(BOOL)a3
{
  self->_excludeDynamicResources = a3;
}

- (BOOL)excludeDynamicResources
{
  return self->_excludeDynamicResources;
}

- (void)setPrefetchOptimizeMode:(int64_t)a3
{
  self->_prefetchOptimizeMode = a3;
}

- (int64_t)prefetchOptimizeMode
{
  return self->_prefetchOptimizeMode;
}

- (void)setPrefetchMode:(int64_t)a3
{
  self->_prefetchMode = a3;
}

- (int64_t)prefetchMode
{
  return self->_prefetchMode;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  int64_t v5 = [(PLCloudResourcePrefetchPredicateOptions *)self prefetchMode];
  int64_t v6 = [(PLCloudResourcePrefetchPredicateOptions *)self prefetchOptimizeMode];
  BOOL v7 = [(PLCloudResourcePrefetchPredicateOptions *)self excludeDynamicResources];
  v8 = [(PLCloudResourcePrefetchPredicateOptions *)self prefetchConfiguration];
  v9 = (void *)[v4 initWithPrefetchMode:v5 prefetchOptimizeMode:v6 excludeDynamicResources:v7 prefetchConfiguration:v8];

  return v9;
}

- (PLCloudResourcePrefetchPredicateOptions)initWithPrefetchMode:(int64_t)a3 prefetchOptimizeMode:(int64_t)a4 excludeDynamicResources:(BOOL)a5 prefetchConfiguration:(id)a6
{
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)PLCloudResourcePrefetchPredicateOptions;
  v12 = [(PLCloudResourcePrefetchPredicateOptions *)&v15 init];
  v13 = v12;
  if (v12)
  {
    v12->_prefetchMode = a3;
    v12->_prefetchOptimizeMode = a4;
    v12->_excludeDynamicResources = a5;
    objc_storeStrong((id *)&v12->_prefetchConfiguration, a6);
  }

  return v13;
}

@end