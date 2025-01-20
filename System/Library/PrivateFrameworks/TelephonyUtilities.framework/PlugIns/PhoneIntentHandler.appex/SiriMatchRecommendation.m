@interface SiriMatchRecommendation
- (BOOL)contactsAvailableInPool:(id)a3;
- (NSArray)contactIdentifiers;
- (SiriMatchRecommendation)initWithType:(int64_t)a3 contactIdentifiers:(id)a4;
- (int64_t)type;
@end

@implementation SiriMatchRecommendation

- (SiriMatchRecommendation)initWithType:(int64_t)a3 contactIdentifiers:(id)a4
{
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SiriMatchRecommendation;
  v11.receiver = [(SiriMatchRecommendation *)&v12 init];
  v11.super_class = (Class)SiriMatchRecommendation;
  v8 = [(SiriMatchRecommendation *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_contactIdentifiers, a4);
  }

  return v9;
}

- (int64_t)type
{
  return self->_type;
}

- (NSArray)contactIdentifiers
{
  return self->_contactIdentifiers;
}

- (void).cxx_destruct
{
}

- (BOOL)contactsAvailableInPool:(id)a3
{
  id v4 = a3;
  v5 = [(SiriMatchRecommendation *)self contactIdentifiers];
  v6 = +[NSSet setWithArray:v5];

  id v7 = [v4 allContactIds];

  LOBYTE(v4) = [v6 isSubsetOfSet:v7];
  return (char)v4;
}

@end