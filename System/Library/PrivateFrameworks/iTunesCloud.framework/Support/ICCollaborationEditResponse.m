@interface ICCollaborationEditResponse
- (BOOL)updateRequired;
- (void)setUpdateRequired:(BOOL)a3;
@end

@implementation ICCollaborationEditResponse

- (void)setUpdateRequired:(BOOL)a3
{
  self->_updateRequired = a3;
}

- (BOOL)updateRequired
{
  return self->_updateRequired;
}

@end