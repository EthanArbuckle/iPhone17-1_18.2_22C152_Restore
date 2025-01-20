@interface KTVerifierResult
+ (id)resultsForUris:(id)a3 application:(id)a4 failure:(id)a5;
- (BOOL)sentToIDS;
- (KTVerifierResult)initWithUri:(id)a3 application:(id)a4 ktResult:(unint64_t)a5 transparentData:(id)a6 loggableDatas:(id)a7;
- (KTVerifierResult)initWithUri:(id)a3 application:(id)a4 transparentData:(id)a5;
- (unint64_t)optInTernaryState;
- (void)setOptInTernaryState:(unint64_t)a3;
- (void)setSentToIDS:(BOOL)a3;
@end

@implementation KTVerifierResult

- (unint64_t)optInTernaryState
{
  v2 = objc_getAssociatedObject(self, @"optInKey");
  id v3 = [v2 unsignedIntegerValue];

  return (unint64_t)v3;
}

- (void)setOptInTernaryState:(unint64_t)a3
{
  id v4 = +[NSNumber numberWithUnsignedInteger:a3];
  objc_setAssociatedObject(self, @"optInKey", v4, (void *)1);
}

- (BOOL)sentToIDS
{
  v2 = objc_getAssociatedObject(self, @"sentToIdsKey");
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)setSentToIDS:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  objc_setAssociatedObject(self, @"sentToIdsKey", v4, (void *)1);
}

+ (id)resultsForUris:(id)a3 application:(id)a4 failure:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v7 count]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v11 = v7;
  id v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        id v17 = objc_alloc((Class)KTVerifierResult);
        id v18 = [v17 initWithUri:v16 application:v8 failure:v20];
        [v10 addObject:v18];
      }
      id v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v13);
  }

  return v10;
}

- (KTVerifierResult)initWithUri:(id)a3 application:(id)a4 transparentData:(id)a5
{
  return [(KTVerifierResult *)self initWithUri:a3 application:a4 ktResult:2 transparentData:a5 loggableDatas:0];
}

- (KTVerifierResult)initWithUri:(id)a3 application:(id)a4 ktResult:(unint64_t)a5 transparentData:(id)a6 loggableDatas:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  uint64_t v14 = [(KTVerifierResult *)self initWithUri:a3 application:a4 ktResult:a5];
  if (v14)
  {
    v15 = [v12 currentPublicID];
    [(KTVerifierResult *)v14 setPublicID:v15];

    -[KTVerifierResult setStaticAccountKeyEnforced:](v14, "setStaticAccountKeyEnforced:", [v12 staticKeyEnforced]);
    -[KTVerifierResult setStaticAccountKeyStatus:](v14, "setStaticAccountKeyStatus:", [v12 staticKeyStatus]);
    uint64_t v16 = [v12 currentPublicID];
    id v17 = [v16 publicKeyInfo];

    -[KTVerifierResult setEverOptedIn:](v14, "setEverOptedIn:", [v12 accountEverOptedIn:v17] == (id)1);
    -[KTVerifierResult setRecentlyOptedIn:](v14, "setRecentlyOptedIn:", [v12 accountRecentlyOptedIn:v17] == (id)1);
    -[KTVerifierResult setOptedIn:](v14, "setOptedIn:", [v12 currentAccountOptInState] == (id)1);
    -[KTVerifierResult setOptInTernaryState:](v14, "setOptInTernaryState:", [v12 currentAccountOptInState]);
    [(KTVerifierResult *)v14 setLoggableDatas:v13];
  }
  return v14;
}

@end