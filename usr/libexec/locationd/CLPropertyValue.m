@interface CLPropertyValue
- (BOOL)dirty;
- (CLPropertyValue)initWithValue:(id)a3 dirty:(BOOL)a4;
- (id)value;
- (void)dealloc;
- (void)setDirty:(BOOL)a3;
@end

@implementation CLPropertyValue

- (BOOL)dirty
{
  return self->_dirty;
}

- (CLPropertyValue)initWithValue:(id)a3 dirty:(BOOL)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CLPropertyValue;
  v6 = [(CLPropertyValue *)&v8 init];
  if (v6)
  {
    v6->_value = a3;
    v6->_dirty = a4;
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLPropertyValue;
  [(CLPropertyValue *)&v3 dealloc];
}

- (id)value
{
  return self->_value;
}

- (void)setDirty:(BOOL)a3
{
  self->_dirty = a3;
}

@end