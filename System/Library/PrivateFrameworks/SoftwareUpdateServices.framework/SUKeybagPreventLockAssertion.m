@interface SUKeybagPreventLockAssertion
- (SUKeybagPreventLockAssertion)initWithKeybagAssertion:(__MKBAssertion *)a3;
- (void)dealloc;
- (void)invalidate;
@end

@implementation SUKeybagPreventLockAssertion

- (SUKeybagPreventLockAssertion)initWithKeybagAssertion:(__MKBAssertion *)a3
{
  if (!a3)
  {
    v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SUKeybagInterface.m", 44, @"Invalid parameter not satisfying: %@", @"assertion" object file lineNumber description];
  }
  v9.receiver = self;
  v9.super_class = (Class)SUKeybagPreventLockAssertion;
  v5 = [(SUKeybagPreventLockAssertion *)&v9 init];
  if (v5)
  {
    CFRetain(a3);
    v5->_assertion = a3;
    v5->_invalidated = 0;
  }
  return v5;
}

- (void)dealloc
{
  [(SUKeybagPreventLockAssertion *)self invalidate];
  if (self->_assertion)
  {
    v4 = [MEMORY[0x263F08690] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"SUKeybagInterface.m" lineNumber:58 description:@"MKBAssertion must be nil at this point in dealloc"];
  }
  v5.receiver = self;
  v5.super_class = (Class)SUKeybagPreventLockAssertion;
  [(SUKeybagPreventLockAssertion *)&v5 dealloc];
}

- (void)invalidate
{
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    assertion = self->_assertion;
    if (assertion)
    {
      CFRelease(assertion);
      self->_assertion = 0;
    }
  }
}

@end