@interface FMFStatusCommand
- (FMFStatusCommand)initWithClientSession:(id)a3 handles:(id)a4 groupId:(id)a5;
- (NSArray)invitePending;
- (NSArray)offerPending;
- (NSDictionary)follower;
- (NSDictionary)following;
- (NSSet)handles;
- (id)jsonBodyDictionary;
- (id)pathSuffix;
- (void)processCommandResponse:(id)a3;
- (void)setFollower:(id)a3;
- (void)setFollowing:(id)a3;
- (void)setHandles:(id)a3;
- (void)setInvitePending:(id)a3;
- (void)setOfferPending:(id)a3;
@end

@implementation FMFStatusCommand

- (FMFStatusCommand)initWithClientSession:(id)a3 handles:(id)a4 groupId:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)FMFStatusCommand;
  v10 = [(FMFBaseCmd *)&v13 initWithClientSession:a3];
  v11 = v10;
  if (v8 && v10)
  {
    [(FMFStatusCommand *)v10 setHandles:v8];
    [(FMFBaseCmd *)v11 setGroupId:v9];
  }
  else
  {
    [(FMFBaseCmd *)v10 initFailed];

    v11 = 0;
  }

  return v11;
}

- (id)pathSuffix
{
  return @"status";
}

- (id)jsonBodyDictionary
{
  v17.receiver = self;
  v17.super_class = (Class)FMFStatusCommand;
  v3 = [(FMFBaseCmd *)&v17 jsonBodyDictionary];
  v4 = +[NSMutableArray array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(FMFStatusCommand *)self handles];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) identifier];
        [v4 addObject:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v7);
  }

  [v3 setObject:v4 forKey:@"handles"];
  v11 = [(FMFBaseCmd *)self groupId];
  [v3 setObject:v11 forKey:@"groupId"];

  return v3;
}

- (void)processCommandResponse:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)FMFStatusCommand;
  id v4 = a3;
  [(FMFBaseCmd *)&v18 processCommandResponse:v4];
  v5 = [v4 objectForKeyedSubscript:@"commandResponse" receiver:v18.receiver super_class:v18.super_class];

  id v6 = [v5 objectForKeyedSubscript:@"follower"];
  id v7 = +[NSNull null];
  if (v6 == v7)
  {
    [(FMFStatusCommand *)self setFollower:0];
  }
  else
  {
    uint64_t v8 = [v5 objectForKeyedSubscript:@"follower"];
    [(FMFStatusCommand *)self setFollower:v8];
  }
  id v9 = [v5 objectForKeyedSubscript:@"following"];
  v10 = +[NSNull null];
  if (v9 == v10)
  {
    [(FMFStatusCommand *)self setFollowing:0];
  }
  else
  {
    v11 = [v5 objectForKeyedSubscript:@"following"];
    [(FMFStatusCommand *)self setFollowing:v11];
  }
  v12 = [v5 objectForKeyedSubscript:@"offerPending"];
  long long v13 = +[NSNull null];
  if (v12 == v13)
  {
    [(FMFStatusCommand *)self setOfferPending:0];
  }
  else
  {
    long long v14 = [v5 objectForKeyedSubscript:@"offerPending"];
    [(FMFStatusCommand *)self setOfferPending:v14];
  }
  long long v15 = [v5 objectForKeyedSubscript:@"invitePending"];
  long long v16 = +[NSNull null];
  if (v15 == v16)
  {
    [(FMFStatusCommand *)self setInvitePending:0];
  }
  else
  {
    objc_super v17 = [v5 objectForKeyedSubscript:@"invitePending"];
    [(FMFStatusCommand *)self setInvitePending:v17];
  }
}

- (NSDictionary)following
{
  return self->_following;
}

- (void)setFollowing:(id)a3
{
}

- (NSDictionary)follower
{
  return self->_follower;
}

- (void)setFollower:(id)a3
{
}

- (NSArray)offerPending
{
  return self->_offerPending;
}

- (void)setOfferPending:(id)a3
{
}

- (NSArray)invitePending
{
  return self->_invitePending;
}

- (void)setInvitePending:(id)a3
{
}

- (NSSet)handles
{
  return self->_handles;
}

- (void)setHandles:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handles, 0);
  objc_storeStrong((id *)&self->_invitePending, 0);
  objc_storeStrong((id *)&self->_offerPending, 0);
  objc_storeStrong((id *)&self->_follower, 0);

  objc_storeStrong((id *)&self->_following, 0);
}

@end