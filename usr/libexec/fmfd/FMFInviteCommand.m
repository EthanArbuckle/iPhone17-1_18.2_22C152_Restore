@interface FMFInviteCommand
- (BOOL)isUserAction;
- (FMFInviteCommand)initWithClientSession:(id)a3 handles:(id)a4 groupId:(id)a5 expiresDate:(id)a6;
- (NSDate)expiresDate;
- (NSSet)handles;
- (id)friendIds;
- (id)handleIdentifiers;
- (id)jsonBodyDictionary;
- (id)pathSuffix;
- (void)setExpiresDate:(id)a3;
- (void)setHandles:(id)a3;
@end

@implementation FMFInviteCommand

- (FMFInviteCommand)initWithClientSession:(id)a3 handles:(id)a4 groupId:(id)a5 expiresDate:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)FMFInviteCommand;
  v13 = [(FMFBaseCmd *)&v16 initWithClientSession:a3];
  v14 = v13;
  if (v10 && v13)
  {
    [(FMFInviteCommand *)v13 setHandles:v10];
    [(FMFBaseCmd *)v14 setGroupId:v11];
    [(FMFInviteCommand *)v14 setExpiresDate:v12];
  }
  else
  {
    [(FMFBaseCmd *)v13 initFailed];

    v14 = 0;
  }

  return v14;
}

- (id)pathSuffix
{
  return @"invite";
}

- (id)jsonBodyDictionary
{
  v14.receiver = self;
  v14.super_class = (Class)FMFInviteCommand;
  v3 = [(FMFBaseCmd *)&v14 jsonBodyDictionary];
  v4 = [(FMFInviteCommand *)self handleIdentifiers];
  if ([v4 count])
  {
    v5 = [v4 allObjects];
    [v3 setObject:v5 forKey:@"emails"];
  }
  v6 = [(FMFInviteCommand *)self friendIds];
  if ([v6 count])
  {
    v7 = [v6 allObjects];
    [v3 setObject:v7 forKey:@"ids"];
  }
  v8 = [(FMFBaseCmd *)self groupId];
  [v3 setObject:v8 forKey:@"groupId"];

  v9 = [(FMFInviteCommand *)self expiresDate];

  if (v9)
  {
    id v10 = [(FMFInviteCommand *)self expiresDate];
    [v10 timeIntervalSince1970];
    id v12 = +[NSNumber numberWithDouble:v11 * 1000.0];
  }
  else
  {
    id v12 = &off_1000A8F98;
  }
  [v3 setObject:v12 forKey:@"expires"];

  return v3;
}

- (BOOL)isUserAction
{
  return 1;
}

- (id)handleIdentifiers
{
  v2 = [(FMFInviteCommand *)self handles];
  v3 = [v2 valueForKey:@"identifier"];

  return v3;
}

- (id)friendIds
{
  v2 = [(FMFInviteCommand *)self handles];
  v3 = [v2 valueForKey:@"serverId"];

  return v3;
}

- (NSSet)handles
{
  return self->_handles;
}

- (void)setHandles:(id)a3
{
}

- (NSDate)expiresDate
{
  return self->_expiresDate;
}

- (void)setExpiresDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expiresDate, 0);

  objc_storeStrong((id *)&self->_handles, 0);
}

@end