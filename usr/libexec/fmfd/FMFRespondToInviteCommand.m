@interface FMFRespondToInviteCommand
- (BOOL)accepted;
- (BOOL)isUserAction;
- (FMFRespondToInviteCommand)initWithClientSession:(id)a3 friendRequestId:(id)a4 accepted:(BOOL)a5;
- (NSString)friendRequestId;
- (id)jsonBodyDictionary;
- (id)pathSuffix;
- (void)setAccepted:(BOOL)a3;
- (void)setFriendRequestId:(id)a3;
@end

@implementation FMFRespondToInviteCommand

- (FMFRespondToInviteCommand)initWithClientSession:(id)a3 friendRequestId:(id)a4 accepted:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FMFRespondToInviteCommand;
  v9 = [(FMFBaseCmd *)&v12 initWithClientSession:a3];
  v10 = v9;
  if (v8 && v9)
  {
    [(FMFRespondToInviteCommand *)v9 setFriendRequestId:v8];
    [(FMFRespondToInviteCommand *)v10 setAccepted:v5];
  }
  else
  {
    [(FMFBaseCmd *)v9 initFailed];

    v10 = 0;
  }

  return v10;
}

- (id)pathSuffix
{
  return @"inviteResponse";
}

- (id)jsonBodyDictionary
{
  v7.receiver = self;
  v7.super_class = (Class)FMFRespondToInviteCommand;
  v3 = [(FMFBaseCmd *)&v7 jsonBodyDictionary];
  v4 = [(FMFRespondToInviteCommand *)self friendRequestId];
  [v3 setObject:v4 forKey:@"id"];

  if ([(FMFRespondToInviteCommand *)self accepted]) {
    CFStringRef v5 = @"true";
  }
  else {
    CFStringRef v5 = @"false";
  }
  [v3 setObject:v5 forKey:@"accepted"];

  return v3;
}

- (BOOL)isUserAction
{
  return 1;
}

- (NSString)friendRequestId
{
  return self->_friendRequestId;
}

- (void)setFriendRequestId:(id)a3
{
}

- (BOOL)accepted
{
  return self->_accepted;
}

- (void)setAccepted:(BOOL)a3
{
  self->_accepted = a3;
}

- (void).cxx_destruct
{
}

@end