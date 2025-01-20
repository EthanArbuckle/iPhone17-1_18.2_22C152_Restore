@interface TIKeyboardAssertionManagerMock
- (BOOL)hasAssertions;
- (BOOL)hasBackgroundActivityAssertions;
- (TIKeyboardAssertionManagerDelegate)delegate;
- (void)setDelegate:(id)a3;
@end

@implementation TIKeyboardAssertionManagerMock

- (void)setDelegate:(id)a3
{
  self->_delegate = (TIKeyboardAssertionManagerDelegate *)a3;
}

- (TIKeyboardAssertionManagerDelegate)delegate
{
  return self->_delegate;
}

- (BOOL)hasBackgroundActivityAssertions
{
  return 0;
}

- (BOOL)hasAssertions
{
  return 0;
}

@end