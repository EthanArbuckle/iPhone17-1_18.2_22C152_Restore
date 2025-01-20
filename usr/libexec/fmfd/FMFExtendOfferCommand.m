@interface FMFExtendOfferCommand
- (FMFExtendOfferCommand)initWithClientSession:(id)a3 handles:(id)a4 groupId:(id)a5 expiresDate:(id)a6;
- (NSDate)expiresDate;
- (NSSet)handles;
- (id)handleIdentifiers;
- (id)jsonBodyDictionary;
- (id)pathSuffix;
- (void)setExpiresDate:(id)a3;
- (void)setHandles:(id)a3;
@end

@implementation FMFExtendOfferCommand

- (FMFExtendOfferCommand)initWithClientSession:(id)a3 handles:(id)a4 groupId:(id)a5 expiresDate:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)FMFExtendOfferCommand;
  v13 = [(FMFBaseCmd *)&v16 initWithClientSession:a3];
  v14 = v13;
  if (v13)
  {
    [(FMFExtendOfferCommand *)v13 setHandles:v10];
    [(FMFExtendOfferCommand *)v14 setExpiresDate:v12];
    [(FMFBaseCmd *)v14 setGroupId:v11];
  }

  return v14;
}

- (id)pathSuffix
{
  return @"extendOffer";
}

- (id)jsonBodyDictionary
{
  v12.receiver = self;
  v12.super_class = (Class)FMFExtendOfferCommand;
  v3 = [(FMFBaseCmd *)&v12 jsonBodyDictionary];
  v4 = [(FMFExtendOfferCommand *)self expiresDate];

  if (v4)
  {
    v5 = [(FMFExtendOfferCommand *)self expiresDate];
    [v5 timeIntervalSince1970];
    v7 = +[NSNumber numberWithDouble:v6 * 1000.0];
  }
  else
  {
    v7 = &off_1000A8F38;
  }
  [v3 setObject:v7 forKey:@"expires"];
  v8 = [(FMFExtendOfferCommand *)self handleIdentifiers];
  if ([v8 count])
  {
    v9 = [v8 allObjects];
    [v3 setObject:v9 forKey:@"handles"];
  }
  id v10 = [(FMFBaseCmd *)self groupId];
  [v3 setObject:v10 forKey:@"groupId"];

  return v3;
}

- (id)handleIdentifiers
{
  v2 = [(FMFExtendOfferCommand *)self handles];
  v3 = [v2 valueForKey:@"identifier"];

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