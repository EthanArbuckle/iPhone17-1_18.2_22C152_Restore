@interface CKShareParticipant
- (CKShareParticipant)initWithUserIdentity:(id)a3;
@end

@implementation CKShareParticipant

- (CKShareParticipant)initWithUserIdentity:(id)a3
{
  return (CKShareParticipant *)[(CKShareParticipant *)self _initWithUserIdentity:a3];
}

@end