@interface _MSDExpireCacheEntry
- (_MSDExpireCacheEntry)initWithValue:(id)a3;
- (double)creationTime;
- (id)value;
- (void)setCreationTime:(double)a3;
- (void)setValue:(id)a3;
@end

@implementation _MSDExpireCacheEntry

- (_MSDExpireCacheEntry)initWithValue:(id)a3
{
  id v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_MSDExpireCacheEntry;
  v6 = [(_MSDExpireCacheEntry *)&v8 init];
  if (v6)
  {
    v6->_creationTime = CFAbsoluteTimeGetCurrent();
    objc_storeStrong(&v6->_value, a3);
  }

  return v6;
}

- (double)creationTime
{
  return self->_creationTime;
}

- (void)setCreationTime:(double)a3
{
  self->_creationTime = a3;
}

- (id)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end