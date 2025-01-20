@interface NFLazy
- (NFLazy)initWithConstructor:(id)a3;
- (NFUnfairLock)lock;
- (id)constructor;
- (id)value;
- (void)reset;
@end

@implementation NFLazy

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong(&self->_constructor, 0);
  objc_storeStrong(&self->_value, 0);
}

- (void)reset
{
  v3 = [(NFLazy *)self lock];
  [v3 lock];

  id value = self->_value;
  self->_id value = 0;

  id v5 = [(NFLazy *)self lock];
  [v5 unlock];
}

- (NFLazy)initWithConstructor:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFLazy;
  id v5 = [(NFLazy *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id constructor = v5->_constructor;
    v5->_id constructor = (id)v6;

    v8 = [[NFUnfairLock alloc] initWithOptions:1];
    lock = v5->_lock;
    v5->_lock = v8;
  }
  return v5;
}

- (id)value
{
  v3 = [(NFLazy *)self lock];
  [v3 lock];

  if (!self->_value)
  {
    id v4 = [(NFLazy *)self constructor];
    id v5 = v4[2]();
    id value = self->_value;
    self->_id value = v5;
  }
  v7 = [(NFLazy *)self lock];
  [v7 unlock];

  id v8 = self->_value;
  return v8;
}

- (NFUnfairLock)lock
{
  return self->_lock;
}

- (id)constructor
{
  return self->_constructor;
}

@end