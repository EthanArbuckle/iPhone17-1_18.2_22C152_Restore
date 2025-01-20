@interface PRLikenessCacheContext
+ (id)contextWithCacheSize:(unint64_t)a3;
- (BOOL)circular;
- (BOOL)forceDecode;
- (PRLikenessCacheContext)init;
- (double)scale;
- (unint64_t)cacheSize;
- (void)setCacheSize:(unint64_t)a3;
- (void)setCircular:(BOOL)a3;
- (void)setForceDecode:(BOOL)a3;
- (void)setScale:(double)a3;
@end

@implementation PRLikenessCacheContext

+ (id)contextWithCacheSize:(unint64_t)a3
{
  v4 = objc_alloc_init((Class)a1);
  v4[2] = a3;
  return v4;
}

- (PRLikenessCacheContext)init
{
  v3.receiver = self;
  v3.super_class = (Class)PRLikenessCacheContext;
  result = [(PRLikenessCacheContext *)&v3 init];
  if (result)
  {
    *(_WORD *)&result->_circular = 0;
    result->_scale = 1.0;
  }
  return result;
}

- (unint64_t)cacheSize
{
  return self->_cacheSize;
}

- (void)setCacheSize:(unint64_t)a3
{
  self->_cacheSize = a3;
}

- (BOOL)circular
{
  return self->_circular;
}

- (void)setCircular:(BOOL)a3
{
  self->_circular = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (BOOL)forceDecode
{
  return self->_forceDecode;
}

- (void)setForceDecode:(BOOL)a3
{
  self->_forceDecode = a3;
}

@end