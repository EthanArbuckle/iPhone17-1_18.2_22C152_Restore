@interface _DomainSize
- (_DomainSize)init;
- (id)description;
- (int64_t)cloudSize;
- (int64_t)localSize;
- (void)setCloudSize:(int64_t)a3;
- (void)setLocalSize:(int64_t)a3;
@end

@implementation _DomainSize

- (_DomainSize)init
{
  v3.receiver = self;
  v3.super_class = (Class)_DomainSize;
  result = [(_DomainSize *)&v3 init];
  if (result)
  {
    result->_cloudSize = 0;
    result->_localSize = 0;
  }
  return result;
}

- (id)description
{
  objc_super v3 = (objc_class *)objc_opt_class();
  return +[NSString stringWithFormat:@"<%s: cloud:%llu local:%llu>", class_getName(v3), self->_cloudSize, self->_localSize];
}

- (int64_t)cloudSize
{
  return self->_cloudSize;
}

- (void)setCloudSize:(int64_t)a3
{
  self->_cloudSize = a3;
}

- (int64_t)localSize
{
  return self->_localSize;
}

- (void)setLocalSize:(int64_t)a3
{
  self->_localSize = a3;
}

@end