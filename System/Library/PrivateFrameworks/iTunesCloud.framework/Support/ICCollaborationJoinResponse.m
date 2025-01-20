@interface ICCollaborationJoinResponse
- (BOOL)updateRequired;
- (unsigned)collaborationCloudLibraryID;
- (void)setCollaborationCloudLibraryID:(unsigned int)a3;
- (void)setUpdateRequired:(BOOL)a3;
@end

@implementation ICCollaborationJoinResponse

- (void)setCollaborationCloudLibraryID:(unsigned int)a3
{
  self->_collaborationCloudLibraryID = a3;
}

- (unsigned)collaborationCloudLibraryID
{
  return self->_collaborationCloudLibraryID;
}

- (void)setUpdateRequired:(BOOL)a3
{
  self->_updateRequired = a3;
}

- (BOOL)updateRequired
{
  return self->_updateRequired;
}

@end