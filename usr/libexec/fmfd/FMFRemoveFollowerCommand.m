@interface FMFRemoveFollowerCommand
- (BOOL)isUserAction;
- (FMFRemoveFollowerCommand)initWithClientSession:(id)a3 handles:(id)a4 groupId:(id)a5;
- (NSArray)packetsToInvalidate;
- (NSSet)handles;
- (id)dsIds;
- (id)handleIdentifiers;
- (id)jsonBodyDictionary;
- (id)pathSuffix;
- (id)serverIds;
- (void)setHandles:(id)a3;
- (void)setPacketsToInvalidate:(id)a3;
@end

@implementation FMFRemoveFollowerCommand

- (FMFRemoveFollowerCommand)initWithClientSession:(id)a3 handles:(id)a4 groupId:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)FMFRemoveFollowerCommand;
  v10 = [(FMFBaseCmd *)&v13 initWithClientSession:a3];
  v11 = v10;
  if (v10)
  {
    [(FMFRemoveFollowerCommand *)v10 setHandles:v8];
    [(FMFBaseCmd *)v11 setGroupId:v9];
  }
  else
  {
    [0 initFailed];
  }

  return v11;
}

- (id)pathSuffix
{
  return @"stopOffer";
}

- (id)jsonBodyDictionary
{
  v23.receiver = self;
  v23.super_class = (Class)FMFRemoveFollowerCommand;
  v3 = [(FMFBaseCmd *)&v23 jsonBodyDictionary];
  v4 = [(FMFBaseCmd *)self groupId];

  if (v4)
  {
    v5 = [(FMFBaseCmd *)self groupId];
    [v3 setObject:v5 forKey:@"groupId"];
  }
  v6 = [(FMFRemoveFollowerCommand *)self packetsToInvalidate];

  if (v6)
  {
    v7 = [(FMFRemoveFollowerCommand *)self packetsToInvalidate];
    [v3 setObject:v7 forKey:@"urls"];
  }
  id v8 = [(FMFRemoveFollowerCommand *)self dsIds];
  id v9 = [v8 count];
  v10 = [(FMFRemoveFollowerCommand *)self handles];
  id v11 = [v10 count];

  if (v9 == v11)
  {
    v12 = [v8 allObjects];
    [v3 setObject:v12 forKey:@"dsIds"];

    objc_super v13 = [v8 anyObject];
    if (v13) {
      [v3 setObject:v13 forKey:@"id"];
    }
  }
  v14 = [(FMFRemoveFollowerCommand *)self serverIds];
  id v15 = [v14 count];
  v16 = [(FMFRemoveFollowerCommand *)self handles];
  id v17 = [v16 count];

  if (v15 == v17)
  {
    v18 = [v14 allObjects];
    [v3 setObject:v18 forKey:@"friendIds"];
  }
  v19 = [(FMFRemoveFollowerCommand *)self handleIdentifiers];
  v20 = v19;
  if (v19)
  {
    v21 = [v19 allObjects];
    [v3 setObject:v21 forKey:@"handles"];
  }

  return v3;
}

- (BOOL)isUserAction
{
  return 1;
}

- (id)handleIdentifiers
{
  v2 = [(FMFRemoveFollowerCommand *)self handles];
  v3 = [v2 valueForKey:@"identifier"];

  return v3;
}

- (id)serverIds
{
  v2 = [(FMFRemoveFollowerCommand *)self handles];
  v3 = [v2 valueForKey:@"serverId"];

  return v3;
}

- (id)dsIds
{
  v2 = [(FMFRemoveFollowerCommand *)self handles];
  v3 = [v2 valueForKey:@"dsid"];

  return v3;
}

- (NSArray)packetsToInvalidate
{
  return self->_packetsToInvalidate;
}

- (void)setPacketsToInvalidate:(id)a3
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

  objc_storeStrong((id *)&self->_packetsToInvalidate, 0);
}

@end