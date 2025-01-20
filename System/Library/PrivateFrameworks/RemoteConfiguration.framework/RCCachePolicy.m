@interface RCCachePolicy
+ (id)defaultCachePolicy;
+ (id)ignoreCachePolicy;
- (BOOL)isEqual:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)requestCachePolicy;
- (void)setRequestCachePolicy:(unint64_t)a3;
@end

@implementation RCCachePolicy

+ (id)defaultCachePolicy
{
  if (defaultCachePolicy_onceToken != -1) {
    dispatch_once(&defaultCachePolicy_onceToken, &__block_literal_global_9);
  }
  v2 = (void *)defaultCachePolicy_result;

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setRequestCachePolicy:", -[RCCachePolicy requestCachePolicy](self, "requestCachePolicy"));
  return v4;
}

- (void)setRequestCachePolicy:(unint64_t)a3
{
  self->_requestCachePolicy = a3;
}

- (unint64_t)requestCachePolicy
{
  return self->_requestCachePolicy;
}

uint64_t __35__RCCachePolicy_defaultCachePolicy__block_invoke()
{
  v0 = objc_alloc_init(RCCachePolicy);
  v1 = (void *)defaultCachePolicy_result;
  defaultCachePolicy_result = (uint64_t)v0;

  v2 = (void *)defaultCachePolicy_result;

  return [v2 setRequestCachePolicy:0];
}

+ (id)ignoreCachePolicy
{
  if (ignoreCachePolicy_onceToken != -1) {
    dispatch_once(&ignoreCachePolicy_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)ignoreCachePolicy_result;

  return v2;
}

uint64_t __34__RCCachePolicy_ignoreCachePolicy__block_invoke()
{
  v0 = objc_alloc_init(RCCachePolicy);
  v1 = (void *)ignoreCachePolicy_result;
  ignoreCachePolicy_result = (uint64_t)v0;

  v2 = (void *)ignoreCachePolicy_result;

  return [v2 setRequestCachePolicy:1];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t v6 = [(RCCachePolicy *)self requestCachePolicy];
    uint64_t v7 = [v5 requestCachePolicy];

    BOOL v8 = v6 == v7;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[RCCachePolicy requestCachePolicy](self, "requestCachePolicy"));
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: requestCachePolicy: %lu>", objc_opt_class(), -[RCCachePolicy requestCachePolicy](self, "requestCachePolicy")];
}

@end