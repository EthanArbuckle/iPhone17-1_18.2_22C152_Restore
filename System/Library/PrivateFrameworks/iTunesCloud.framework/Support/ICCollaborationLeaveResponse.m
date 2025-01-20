@interface ICCollaborationLeaveResponse
- (BOOL)updateRequired;
- (NSString)globalPlaylistID;
- (void)setGlobalPlaylistID:(id)a3;
- (void)setUpdateRequired:(BOOL)a3;
@end

@implementation ICCollaborationLeaveResponse

- (void).cxx_destruct
{
}

- (void)setGlobalPlaylistID:(id)a3
{
}

- (NSString)globalPlaylistID
{
  return self->_globalPlaylistID;
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