@interface SCROIOSerialElement
- (NSString)description;
- (SCROIOSerialElement)initWithFileDescriptor:(int)a3;
- (int)fileDescriptor;
- (int)transport;
- (void)setFileDescriptor:(int)a3;
@end

@implementation SCROIOSerialElement

- (SCROIOSerialElement)initWithFileDescriptor:(int)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SCROIOSerialElement;
  v4 = [(SCROIOSerialElement *)&v6 init];
  v4->_fileDescriptor = a3;
  atomic_fetch_add_explicit(_currentIdentifier_0, 1u, memory_order_relaxed);
  -[SCROIOElement setIdentifier:](v4, "setIdentifier:");
  return v4;
}

- (int)transport
{
  return 16;
}

- (NSString)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)SCROIOSerialElement;
  v4 = [(SCROIOSerialElement *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ fd: %d", v4, self->_fileDescriptor];

  return (NSString *)v5;
}

- (int)fileDescriptor
{
  return self->_fileDescriptor;
}

- (void)setFileDescriptor:(int)a3
{
  self->_fileDescriptor = a3;
}

@end