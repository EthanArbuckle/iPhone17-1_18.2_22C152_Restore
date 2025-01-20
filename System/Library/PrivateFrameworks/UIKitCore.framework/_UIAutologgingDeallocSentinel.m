@interface _UIAutologgingDeallocSentinel
- (BOOL)called;
- (NSString)message;
- (void)dealloc;
- (void)setCalled:(BOOL)a3;
- (void)setMessage:(id)a3;
@end

@implementation _UIAutologgingDeallocSentinel

- (void)dealloc
{
  if (![(_UIAutologgingDeallocSentinel *)self called])
  {
    v3 = [(_UIAutologgingDeallocSentinel *)self message];
    NSLog(&stru_1ED0F89C0.isa, v3);
  }
  v4.receiver = self;
  v4.super_class = (Class)_UIAutologgingDeallocSentinel;
  [(_UIAutologgingDeallocSentinel *)&v4 dealloc];
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (BOOL)called
{
  return self->_called;
}

- (void)setCalled:(BOOL)a3
{
  self->_called = a3;
}

- (void).cxx_destruct
{
}

@end