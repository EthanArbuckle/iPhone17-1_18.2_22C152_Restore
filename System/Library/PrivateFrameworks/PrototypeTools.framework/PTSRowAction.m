@interface PTSRowAction
- (BOOL)deselectRowOnSuccess;
- (void)setDeselectRowOnSuccess:(BOOL)a3;
@end

@implementation PTSRowAction

- (BOOL)deselectRowOnSuccess
{
  return *(&self->super._isEncodable + 1);
}

- (void)setDeselectRowOnSuccess:(BOOL)a3
{
  *(&self->super._isEncodable + 1) = a3;
}

@end