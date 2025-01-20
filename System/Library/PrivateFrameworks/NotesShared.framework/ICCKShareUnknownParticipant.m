@interface ICCKShareUnknownParticipant
- (ICCKShareUnknownParticipant)initWithParticipantUserID:(id)a3;
- (NSString)displayName;
- (NSString)participantUserID;
@end

@implementation ICCKShareUnknownParticipant

- (ICCKShareUnknownParticipant)initWithParticipantUserID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICCKShareUnknownParticipant;
  v6 = [(ICCKShareUnknownParticipant *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_participantUserID, a3);
  }

  return v7;
}

- (NSString)displayName
{
  return (NSString *)[MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Somebody" value:@"Somebody" table:0 allowSiri:1];
}

- (NSString)participantUserID
{
  return self->_participantUserID;
}

- (void).cxx_destruct
{
}

@end