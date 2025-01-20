@interface SCROPendingBrailleDelete
- (BOOL)isForwardDelete;
- (void)setIsForwardDelete:(BOOL)a3;
@end

@implementation SCROPendingBrailleDelete

- (BOOL)isForwardDelete
{
  return self->_isForwardDelete;
}

- (void)setIsForwardDelete:(BOOL)a3
{
  self->_isForwardDelete = a3;
}

@end