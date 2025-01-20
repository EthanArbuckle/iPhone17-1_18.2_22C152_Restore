@interface ICCollaborationBeginResponse
- (BOOL)isCollaborative;
- (BOOL)updateRequired;
- (NSString)collaborationGlobalID;
- (NSString)collaborationInviteURL;
- (unsigned)collaborationCloudLibraryID;
- (unsigned)collaborationInviteURLExpirationDate;
- (unsigned)collaborationMode;
- (unsigned)playlistCloudLibraryIDToDelete;
- (void)setCollaborationCloudLibraryID:(unsigned int)a3;
- (void)setCollaborationGlobalID:(id)a3;
- (void)setCollaborationInviteURL:(id)a3;
- (void)setCollaborationInviteURLExpirationDate:(unsigned int)a3;
- (void)setCollaborationMode:(unsigned int)a3;
- (void)setIsCollaborative:(BOOL)a3;
- (void)setPlaylistCloudLibraryIDToDelete:(unsigned int)a3;
- (void)setUpdateRequired:(BOOL)a3;
@end

@implementation ICCollaborationBeginResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collaborationInviteURL, 0);

  objc_storeStrong((id *)&self->_collaborationGlobalID, 0);
}

- (void)setCollaborationInviteURLExpirationDate:(unsigned int)a3
{
  self->_collaborationInviteURLExpirationDate = a3;
}

- (unsigned)collaborationInviteURLExpirationDate
{
  return self->_collaborationInviteURLExpirationDate;
}

- (void)setPlaylistCloudLibraryIDToDelete:(unsigned int)a3
{
  self->_playlistCloudLibraryIDToDelete = a3;
}

- (unsigned)playlistCloudLibraryIDToDelete
{
  return self->_playlistCloudLibraryIDToDelete;
}

- (void)setUpdateRequired:(BOOL)a3
{
  self->_updateRequired = a3;
}

- (BOOL)updateRequired
{
  return self->_updateRequired;
}

- (void)setCollaborationInviteURL:(id)a3
{
}

- (NSString)collaborationInviteURL
{
  return self->_collaborationInviteURL;
}

- (void)setCollaborationMode:(unsigned int)a3
{
  self->_collaborationMode = a3;
}

- (unsigned)collaborationMode
{
  return self->_collaborationMode;
}

- (void)setIsCollaborative:(BOOL)a3
{
  self->_isCollaborative = a3;
}

- (BOOL)isCollaborative
{
  return self->_isCollaborative;
}

- (void)setCollaborationGlobalID:(id)a3
{
}

- (NSString)collaborationGlobalID
{
  return self->_collaborationGlobalID;
}

- (void)setCollaborationCloudLibraryID:(unsigned int)a3
{
  self->_collaborationCloudLibraryID = a3;
}

- (unsigned)collaborationCloudLibraryID
{
  return self->_collaborationCloudLibraryID;
}

@end