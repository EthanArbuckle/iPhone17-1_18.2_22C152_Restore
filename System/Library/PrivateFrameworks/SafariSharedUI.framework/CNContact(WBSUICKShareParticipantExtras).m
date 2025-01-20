@interface CNContact(WBSUICKShareParticipantExtras)
- (id)safari_shareParticipantIdentifier;
- (void)safari_setShareParticipantIdentifier:()WBSUICKShareParticipantExtras;
@end

@implementation CNContact(WBSUICKShareParticipantExtras)

- (id)safari_shareParticipantIdentifier
{
  return objc_getAssociatedObject(a1, &shareParticipantIdentifierKey);
}

- (void)safari_setShareParticipantIdentifier:()WBSUICKShareParticipantExtras
{
}

@end