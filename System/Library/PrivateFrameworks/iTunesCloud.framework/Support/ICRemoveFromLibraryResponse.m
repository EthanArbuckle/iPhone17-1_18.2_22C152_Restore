@interface ICRemoveFromLibraryResponse
- (BOOL)updateRequired;
- (void)setUpdateRequired:(BOOL)a3;
@end

@implementation ICRemoveFromLibraryResponse

- (void)setUpdateRequired:(BOOL)a3
{
  self->_updateRequired = a3;
}

- (BOOL)updateRequired
{
  return self->_updateRequired;
}

@end