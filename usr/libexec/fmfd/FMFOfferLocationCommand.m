@interface FMFOfferLocationCommand
- (BOOL)isUserAction;
- (FMFOfferLocationCommand)initWithClientSession:(id)a3 handles:(id)a4 groupId:(id)a5 expiresDate:(id)a6;
- (NSDate)expiresDate;
- (NSSet)handles;
- (id)handleIdentifiers;
- (id)idsValidatedHandlesStatus;
- (id)jsonBodyDictionary;
- (id)pathSuffix;
- (id)serverIds;
- (void)processCommandResponse:(id)a3;
- (void)setExpiresDate:(id)a3;
- (void)setHandles:(id)a3;
@end

@implementation FMFOfferLocationCommand

- (FMFOfferLocationCommand)initWithClientSession:(id)a3 handles:(id)a4 groupId:(id)a5 expiresDate:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)FMFOfferLocationCommand;
  v13 = [(FMFBaseCmd *)&v16 initWithClientSession:a3];
  v14 = v13;
  if (v10 && v13)
  {
    [(FMFOfferLocationCommand *)v13 setHandles:v10];
    [(FMFOfferLocationCommand *)v14 setExpiresDate:v12];
    [(FMFBaseCmd *)v14 setGroupId:v11];
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
  return @"offerLocation";
}

- (id)jsonBodyDictionary
{
  v17.receiver = self;
  v17.super_class = (Class)FMFOfferLocationCommand;
  v3 = [(FMFBaseCmd *)&v17 jsonBodyDictionary];
  v4 = [(FMFOfferLocationCommand *)self expiresDate];

  if (!v4)
  {
    v7 = &off_1000A8F50;
    goto LABEL_5;
  }
  v5 = [(FMFOfferLocationCommand *)self expiresDate];
  [v5 timeIntervalSince1970];
  v7 = +[NSNumber numberWithDouble:v6 * 1000.0];

  if (v7)
  {
LABEL_5:
    [v3 setObject:v7 forKey:@"expires"];
  }
  v8 = [(FMFBaseCmd *)self groupId];

  if (v8)
  {
    v9 = [(FMFBaseCmd *)self groupId];
    [v3 setObject:v9 forKey:@"groupId"];
  }
  id v10 = [(FMFOfferLocationCommand *)self serverIds];
  id v11 = [v10 count];
  id v12 = [(FMFOfferLocationCommand *)self handles];
  id v13 = [v12 count];

  if (v11 == v13)
  {
    v14 = [v10 allObjects];
    [v3 setObject:v14 forKey:@"friendIds"];
  }
  v15 = [(FMFOfferLocationCommand *)self idsValidatedHandlesStatus];
  if (v15) {
    [v3 setObject:v15 forKey:@"idsValidatedHandles"];
  }

  return v3;
}

- (id)idsValidatedHandlesStatus
{
  v3 = +[NSMutableDictionary dictionary];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v4 = [(FMFOfferLocationCommand *)self handles];
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v10 = [v9 qualifiedIdentifier];
        id v11 = [v10 length];

        if (v11)
        {
          [v9 setIdsStatus:1];
          id v12 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v9 idsStatus]);
          id v13 = [v9 qualifiedIdentifier];
          [v3 setObject:v12 forKey:v13];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)handleIdentifiers
{
  v2 = [(FMFOfferLocationCommand *)self handles];
  v3 = [v2 valueForKey:@"qualifiedIdentifier"];

  return v3;
}

- (id)serverIds
{
  v2 = [(FMFOfferLocationCommand *)self handles];
  v3 = [v2 valueForKey:@"serverId"];

  return v3;
}

- (void)processCommandResponse:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)FMFOfferLocationCommand;
  [(FMFBaseCmd *)&v11 processCommandResponse:a3];
  v4 = [(FMFOfferLocationCommand *)self error];

  if (!v4)
  {
    id v5 = +[NSMutableDictionary dictionary];
    id v6 = [(FMFBaseCmd *)self requestTokensStatusMap];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000341F8;
    v9[3] = &unk_1000A1EE0;
    id v7 = v5;
    id v10 = v7;
    [v6 enumerateKeysAndObjectsUsingBlock:v9];

    if ([v7 count])
    {
      v8 = +[NSError errorWithDomain:FMFErrorDomain code:204 userInfo:v7];
      [(FMFOfferLocationCommand *)self setError:v8];
    }
  }
}

- (BOOL)isUserAction
{
  return 1;
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