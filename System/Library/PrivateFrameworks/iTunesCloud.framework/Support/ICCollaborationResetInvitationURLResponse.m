@interface ICCollaborationResetInvitationURLResponse
- (BOOL)updateRequired;
- (NSURL)updatedInvitationURL;
- (unsigned)updatedInviteURLExpirationDate;
- (void)setUpdateRequired:(BOOL)a3;
- (void)setUpdatedInvitationURL:(id)a3;
- (void)setUpdatedInviteURLExpirationDate:(unsigned int)a3;
@end

@implementation ICCollaborationResetInvitationURLResponse

- (void).cxx_destruct
{
}

- (void)setUpdatedInviteURLExpirationDate:(unsigned int)a3
{
  self->_updatedInviteURLExpirationDate = a3;
}

- (unsigned)updatedInviteURLExpirationDate
{
  return self->_updatedInviteURLExpirationDate;
}

- (void)setUpdatedInvitationURL:(id)a3
{
}

- (NSURL)updatedInvitationURL
{
  return self->_updatedInvitationURL;
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