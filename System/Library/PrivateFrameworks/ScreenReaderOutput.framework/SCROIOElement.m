@interface SCROIOElement
- (BOOL)isEqual:(id)a3;
- (SCROIOElement)initWithIOObject:(unsigned int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int)identifier;
- (int)transport;
- (unint64_t)hash;
- (unsigned)ioObject;
- (void)dealloc;
- (void)setIdentifier:(int)a3;
@end

@implementation SCROIOElement

- (SCROIOElement)initWithIOObject:(unsigned int)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SCROIOElement;
  v4 = [(SCROIOElement *)&v6 init];
  if (v4)
  {
    if (a3)
    {
      IOObjectRetain(a3);
      v4->_ioObject = a3;
    }
    v4->_identifier = atomic_fetch_add_explicit(_currentIdentifier_1, 1u, memory_order_relaxed);
  }
  return v4;
}

- (void)dealloc
{
  io_object_t ioObject = self->_ioObject;
  if (ioObject) {
    IOObjectRelease(ioObject);
  }
  v4.receiver = self;
  v4.super_class = (Class)SCROIOElement;
  [(SCROIOElement *)&v4 dealloc];
}

- (unsigned)ioObject
{
  return self->_ioObject;
}

- (int)identifier
{
  return self->_identifier;
}

- (unint64_t)hash
{
  return self->_ioObject;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = (_DWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    io_object_t ioObject = self->_ioObject;
    if (ioObject)
    {
      IOObjectRetain(ioObject);
      v4[2] = self->_ioObject;
      v4[3] = self->_identifier;
    }
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCROIOElement;
  if ([(SCROIOElement *)&v9 isEqual:v4])
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      io_object_t v6 = [v4 ioObject];
      io_object_t ioObject = self->_ioObject;
      BOOL v5 = (ioObject | v6) == 0;
      if (ioObject && v6) {
        BOOL v5 = IOObjectIsEqualTo(ioObject, v6) != 0;
      }
    }
    else
    {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (int)transport
{
  return 0;
}

- (void)setIdentifier:(int)a3
{
  self->_identifier = a3;
}

@end