@interface GKFriendSuggester
+ (id)serialQueue;
- (GKFriendSuggester)initWithDeniedContactIDs:(id)a3 settingsProvider:(id)a4;
- (GKFriendSuggesterSettingsProvider)settingsProvider;
- (NSSet)deniedContactIDs;
- (id)cachedContactAssocicationIDsWithContext:(id)a3;
- (id)modifiersWithSettings:(id)a3 contactsIntegrationController:(id)a4 hasCachedSuggestions:(BOOL)a5 cachedSortedAssociationIDs:(id)a6 rerankRequester:(id)a7 transactionGroupProvider:(id)a8;
- (id)peopleSuggesterConvertedFriendSuggestionsWithLimit:(unint64_t)a3;
- (id)peopleSuggesterGameInviteSuggestionsWithLimit:(unint64_t)a3;
- (id)rerankedHandlesWithContactsIntegrationController:(id)a3 context:(id)a4;
- (unint64_t)calculateCoreRecencyUpperLimit:(id)a3;
- (void)gameInviteSuggestionsWithHandler:(id)a3;
- (void)modifyCachedSuggestions:(id)a3 modifiers:(id)a4 handler:(id)a5;
- (void)setDeniedContactIDs:(id)a3;
- (void)setSettingsProvider:(id)a3;
- (void)suggestionsWithRerankRequester:(id)a3 contactsIntegrationController:(id)a4 transactionGroupProvider:(id)a5 handler:(id)a6;
@end

@implementation GKFriendSuggester

+ (id)serialQueue
{
  if (qword_100329788 != -1) {
    dispatch_once(&qword_100329788, &stru_1002DA530);
  }
  v2 = (void *)qword_100329780;

  return v2;
}

- (GKFriendSuggester)initWithDeniedContactIDs:(id)a3 settingsProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GKFriendSuggester;
  v9 = [(GKFriendSuggester *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_deniedContactIDs, a3);
    objc_storeStrong((id *)&v10->_settingsProvider, a4);
  }

  return v10;
}

- (void)suggestionsWithRerankRequester:(id)a3 contactsIntegrationController:(id)a4 transactionGroupProvider:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  objc_super v12 = (void (**)(void))a5;
  id v13 = a6;
  v14 = v12[2](v12);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000FDC9C;
  v19[3] = &unk_1002DA5C0;
  v19[4] = self;
  id v20 = v11;
  id v21 = v10;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  v16 = v12;
  id v17 = v10;
  id v18 = v11;
  [v14 performOnManagedObjectContext:v19];
}

- (id)cachedContactAssocicationIDsWithContext:(id)a3
{
  id v3 = a3;
  v4 = +[GKCDSuggestedFriends _gkFetchRequest];
  [v4 setReturnsDistinctResults:1];
  v5 = +[NSManagedObject _gkRetrieveCleanEntry:v3 request:v4];

  if (v5
    && ([v5 expirationDate],
        v6 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v7 = [v5 _gkIsExpired:v6],
        v6,
        (v7 & 1) == 0))
  {
    id v8 = [v5 contactAssociationIDs];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)rerankedHandlesWithContactsIntegrationController:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(GKFriendSuggester *)self cachedContactAssocicationIDsWithContext:v7];
  v9 = +[NSSet setWithArray:v8];
  id v10 = [v6 handleMapForContactAssociationIDs:v9 withContext:v7];

  id v11 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v8 count]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v12 = v8;
  id v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = [v10 objectForKeyedSubscript:*(void *)(*((void *)&v20 + 1) + 8 * i), (void)v20];
        if ([v17 length]) {
          [v11 addObject:v17];
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v14);
  }

  id v18 = [v11 copy];

  return v18;
}

- (void)gameInviteSuggestionsWithHandler:(id)a3
{
  id v4 = a3;
  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKFriendSuggester.m", 164, "-[GKFriendSuggester gameInviteSuggestionsWithHandler:]");
  id v6 = +[GKDispatchGroup dispatchGroupWithName:v5];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000FE4F8;
  v15[3] = &unk_1002D3A70;
  v15[4] = self;
  id v7 = v6;
  id v16 = v7;
  [v7 perform:v15];
  id v8 = [(id)objc_opt_class() serialQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000FE688;
  v11[3] = &unk_1002D3A48;
  id v12 = v7;
  id v13 = self;
  id v14 = v4;
  id v9 = v4;
  id v10 = v7;
  [v10 notifyOnQueue:v8 block:v11];
}

- (id)peopleSuggesterGameInviteSuggestionsWithLimit:(unint64_t)a3
{
  id v4 = +[NSNumber numberWithUnsignedInteger:a3];
  id v5 = objc_alloc_init((Class)_PSContactSuggester);
  id v6 = [v5 gameCenterSuggestionsWithMaxSuggestions:-[GKFriendSuggester calculateCoreRecencyUpperLimit:](self, "calculateCoreRecencyUpperLimit:", v4), 0, 1, 1, &__NSArray0__struct];

  return v6;
}

- (id)peopleSuggesterConvertedFriendSuggestionsWithLimit:(unint64_t)a3
{
  id v4 = +[NSNumber numberWithUnsignedInteger:a3];
  id v5 = objc_alloc_init((Class)_PSContactSuggester);
  unint64_t v6 = [(GKFriendSuggester *)self calculateCoreRecencyUpperLimit:v4];
  id v7 = [(GKFriendSuggester *)self deniedContactIDs];
  id v8 = [v7 allObjects];
  id v9 = [v5 gameCenterSuggestionsWithMaxSuggestions:v6 interactionDomains:0 appleUsersOnly:1 includeGroupSuggestions:0 excludeContactsByIdentifiers:v8];

  id v10 = [v9 _gkMapWithBlock:&stru_1002DA628];
  if (!os_log_GKGeneral) {
    id v11 = (id)GKOSLoggers();
  }
  if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
    sub_1000FF600();
  }

  return v10;
}

- (void)modifyCachedSuggestions:(id)a3 modifiers:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKFriendSuggester.m", 226, "-[GKFriendSuggester modifyCachedSuggestions:modifiers:handler:]");
  id v12 = +[GKDispatchGroup dispatchGroupWithName:v11];

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000FEB38;
  v25[3] = &unk_1002D3A70;
  v25[4] = self;
  id v13 = v12;
  id v26 = v13;
  [v13 perform:v25];
  id v14 = [(id)objc_opt_class() serialQueue];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000FEC60;
  v19[3] = &unk_1002DA650;
  id v20 = v13;
  id v21 = v8;
  long long v22 = self;
  id v23 = v10;
  id v24 = v9;
  id v15 = v9;
  id v16 = v10;
  id v17 = v8;
  id v18 = v13;
  [v18 notifyOnQueue:v14 block:v19];
}

- (id)modifiersWithSettings:(id)a3 contactsIntegrationController:(id)a4 hasCachedSuggestions:(BOOL)a5 cachedSortedAssociationIDs:(id)a6 rerankRequester:(id)a7 transactionGroupProvider:(id)a8
{
  BOOL v11 = a5;
  id v13 = a3;
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a4;
  id v18 = [[GKTrimSuggestionsModifier alloc] initWithSettings:v13];
  v19 = [[GKNonFriendSuggestionModifier alloc] initWithContactsController:v17 transactionGroupProvider:v14];

  id v20 = [[GKSortSuggestionsModifier alloc] initWithSettings:v13 networkRequester:v15 cachedSortedAssociationIDs:v16 transactionGroupProvider:v14 featureEnabledBlock:&stru_1002DA690];
  if (v11)
  {
    id v21 = [GKDeniedSuggestionsModifier alloc];
    long long v22 = [(GKFriendSuggester *)self deniedContactIDs];
    id v23 = [(GKDeniedSuggestionsModifier *)v21 initWithDeniedContactIDs:v22];

    id v24 = [GKAppendSuggestionsModifier alloc];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_1000FF150;
    v30[3] = &unk_1002DA6B8;
    v25 = v19;
    v31 = v25;
    v32 = self;
    id v26 = [(GKAppendSuggestionsModifier *)v24 initWithSettings:v13 suggestionsProvider:v30];
    v34[0] = v23;
    v34[1] = v25;
    v34[2] = v20;
    v34[3] = v26;
    v34[4] = v18;
    v27 = +[NSArray arrayWithObjects:v34 count:5];
  }
  else
  {
    v33[0] = v19;
    v33[1] = v20;
    v33[2] = v18;
    v27 = +[NSArray arrayWithObjects:v33 count:3];
  }

  return v27;
}

- (unint64_t)calculateCoreRecencyUpperLimit:(id)a3
{
  id v3 = a3;
  id v4 = +[GKPreferences shared];
  id v5 = [v4 coreRecentUpperLimit];

  unint64_t v6 = +[GKPreferences shared];
  id v7 = [v6 coreRecentMultiplier];

  unint64_t v8 = (void)[v3 longValue] * (void)v7;
  id v9 = [v3 longValue];

  if (v8 < (unint64_t)v9 || v8 > (unint64_t)v5) {
    return 50;
  }
  if (!os_log_GKGeneral) {
    id v11 = (id)GKOSLoggers();
  }
  id v12 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    id v13 = v12;
    id v14 = +[NSNumber numberWithUnsignedInteger:v8];
    int v16 = 136315394;
    id v17 = "-[GKFriendSuggester calculateCoreRecencyUpperLimit:]";
    __int16 v18 = 2112;
    v19 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Limiting upper boundry for core recent query to: %@", (uint8_t *)&v16, 0x16u);
  }
  return v8;
}

- (NSSet)deniedContactIDs
{
  return self->_deniedContactIDs;
}

- (void)setDeniedContactIDs:(id)a3
{
}

- (GKFriendSuggesterSettingsProvider)settingsProvider
{
  return self->_settingsProvider;
}

- (void)setSettingsProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsProvider, 0);

  objc_storeStrong((id *)&self->_deniedContactIDs, 0);
}

@end