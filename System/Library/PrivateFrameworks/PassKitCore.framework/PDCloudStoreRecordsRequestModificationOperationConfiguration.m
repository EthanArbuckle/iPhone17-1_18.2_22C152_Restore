@interface PDCloudStoreRecordsRequestModificationOperationConfiguration
- (BOOL)markAsParticipantNeedsNewInvitationToken;
- (id)description;
- (void)setMarkAsParticipantNeedsNewInvitationToken:(BOOL)a3;
@end

@implementation PDCloudStoreRecordsRequestModificationOperationConfiguration

- (id)description
{
  +[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", @"<%@: %p; ",
    objc_opt_class(),
  v3 = self);
  v4 = v3;
  if (self->_markAsParticipantNeedsNewInvitationToken) {
    CFStringRef v5 = @"YES";
  }
  else {
    CFStringRef v5 = @"NO";
  }
  [v3 appendFormat:@"markAsParticipantNeedsNewInvitationToken: '%@'; ", v5];
  [v4 appendString:@">"];
  v6 = +[NSString stringWithString:v4];

  return v6;
}

- (BOOL)markAsParticipantNeedsNewInvitationToken
{
  return self->_markAsParticipantNeedsNewInvitationToken;
}

- (void)setMarkAsParticipantNeedsNewInvitationToken:(BOOL)a3
{
  self->_markAsParticipantNeedsNewInvitationToken = a3;
}

@end