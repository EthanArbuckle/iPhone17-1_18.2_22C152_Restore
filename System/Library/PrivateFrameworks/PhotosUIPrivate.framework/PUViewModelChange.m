@interface PUViewModelChange
- (BOOL)hasChanges;
- (void)setHasChanges;
@end

@implementation PUViewModelChange

- (BOOL)hasChanges
{
  return self->_hasChanges;
}

- (void)setHasChanges
{
  self->_hasChanges = 1;
}

@end