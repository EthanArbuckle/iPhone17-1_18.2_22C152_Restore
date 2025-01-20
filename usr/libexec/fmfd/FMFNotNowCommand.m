@interface FMFNotNowCommand
- (BOOL)isUserAction;
- (FMFNotNowCommand)initWithClientSession:(id)a3 handles:(id)a4;
- (NSSet)handles;
- (id)friendIds;
- (id)jsonBodyDictionary;
- (id)pathSuffix;
- (void)setHandles:(id)a3;
@end

@implementation FMFNotNowCommand

- (FMFNotNowCommand)initWithClientSession:(id)a3 handles:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)FMFNotNowCommand;
  v7 = [(FMFBaseCmd *)&v10 initWithClientSession:a3];
  v8 = v7;
  if (v6 && v7)
  {
    [(FMFNotNowCommand *)v7 setHandles:v6];
  }
  else
  {
    [(FMFBaseCmd *)v7 initFailed];

    v8 = 0;
  }

  return v8;
}

- (id)pathSuffix
{
  return @"notNow";
}

- (id)jsonBodyDictionary
{
  v8.receiver = self;
  v8.super_class = (Class)FMFNotNowCommand;
  v3 = [(FMFBaseCmd *)&v8 jsonBodyDictionary];
  v4 = [(FMFNotNowCommand *)self friendIds];
  if ([v4 count])
  {
    v5 = [v4 allObjects];
    id v6 = [v5 firstObject];
    [v3 setObject:v6 forKey:@"id"];
  }

  return v3;
}

- (BOOL)isUserAction
{
  return 1;
}

- (id)friendIds
{
  v2 = [(FMFNotNowCommand *)self handles];
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

- (void).cxx_destruct
{
}

@end