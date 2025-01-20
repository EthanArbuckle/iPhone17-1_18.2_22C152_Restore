@interface _TVTemplateFeatureContextHandle
+ (id)handleWithContext:(id)a3;
- (BOOL)isEqual:(id)a3;
- (id)context;
- (int64_t)rank;
- (unint64_t)hash;
- (void)setRank:(int64_t)a3;
@end

@implementation _TVTemplateFeatureContextHandle

+ (id)handleWithContext:(id)a3
{
  v4 = objc_alloc_init((Class)a1);
  v4[1] = a3;
  return v4;
}

- (unint64_t)hash
{
  return [self->_context hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (id *)a3;
  objc_opt_class();
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && v4[1] == self->_context;

  return v5;
}

- (id)context
{
  return self->_context;
}

- (int64_t)rank
{
  return self->_rank;
}

- (void)setRank:(int64_t)a3
{
  self->_rank = a3;
}

@end