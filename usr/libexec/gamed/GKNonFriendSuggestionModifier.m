@interface GKNonFriendSuggestionModifier
- (GKContactsIntegrationController)contactsController;
- (GKNonFriendSuggestionModifier)initWithContactsController:(id)a3 transactionGroupProvider:(id)a4;
- (id)modifySuggestions:(id)a3;
- (id)nonFriendSuggestionsFromInitialSuggestions:(id)a3;
- (id)transactionGroupProvider;
- (void)populateContactAssocicationIDsForSuggestions:(id)a3 contactAssociationIDMap:(id)a4;
- (void)setContactsController:(id)a3;
- (void)setTransactionGroupProvider:(id)a3;
@end

@implementation GKNonFriendSuggestionModifier

- (GKNonFriendSuggestionModifier)initWithContactsController:(id)a3 transactionGroupProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)GKNonFriendSuggestionModifier;
  v9 = [(GKNonFriendSuggestionModifier *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contactsController, a3);
    id v11 = objc_retainBlock(v8);
    id transactionGroupProvider = v10->_transactionGroupProvider;
    v10->_id transactionGroupProvider = v11;
  }
  return v10;
}

- (id)modifySuggestions:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [(GKNonFriendSuggestionModifier *)self nonFriendSuggestionsFromInitialSuggestions:v4];
  }
  else
  {
    id v5 = v4;
  }
  v6 = v5;

  return v6;
}

- (id)nonFriendSuggestionsFromInitialSuggestions:(id)a3
{
  id v4 = a3;
  id v5 = [v4 _gkValuesForKeyPath:@"contactID"];
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKNonFriendSuggestionModifier.m", 55, "-[GKNonFriendSuggestionModifier nonFriendSuggestionsFromInitialSuggestions:]");
  id v7 = +[GKDispatchGroup dispatchGroupWithName:v6];

  id v8 = [(GKNonFriendSuggestionModifier *)self contactsController];
  v9 = [v8 contactStore];
  v10 = [v9 _gkContactsWithContactIDs:v5];
  id v11 = [v10 allObjects];

  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_100135CE4;
  v39[3] = &unk_1002D3980;
  v39[4] = self;
  id v12 = v11;
  id v40 = v12;
  id v13 = v7;
  id v41 = v13;
  [v13 perform:v39];
  [v13 wait];
  objc_super v14 = [v13 objectForKeyedSubscript:@"relationships"];
  v15 = [v13 objectForKeyedSubscript:@"contactAssociationIDMap"];
  v16 = [v13 error];
  if (v16)
  {
    if (!os_log_GKGeneral) {
      id v17 = (id)GKOSLoggers();
    }
    v18 = os_log_GKContacts;
    if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
      sub_1001361F4((uint64_t)v16, v18);
    }
  }
  [(GKNonFriendSuggestionModifier *)self populateContactAssocicationIDsForSuggestions:v4 contactAssociationIDMap:v15];
  if ([v14 count])
  {
    v30 = v15;
    id v31 = v12;
    v32 = v5;
    id v19 = [objc_alloc((Class)NSMutableSet) initWithCapacity:[v14 count]];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v20 = v14;
    id v21 = [v20 countByEnumeratingWithState:&v35 objects:v42 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v36;
      do
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v36 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          if ([v25 relationship] != 2)
          {
            v26 = [v25 handle];
            [v19 addObject:v26];
          }
        }
        id v22 = [v20 countByEnumeratingWithState:&v35 objects:v42 count:16];
      }
      while (v22);
    }

    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100135E50;
    v33[3] = &unk_1002D8470;
    id v34 = v19;
    id v27 = v19;
    id v28 = [v4 _gkFilterWithBlock:v33];

    id v12 = v31;
    id v5 = v32;
    v15 = v30;
  }
  else
  {
    id v28 = v4;
  }

  return v28;
}

- (void)populateContactAssocicationIDsForSuggestions:(id)a3 contactAssociationIDMap:(id)a4
{
  id v5 = a3;
  id v26 = a4;
  id v6 = [objc_alloc((Class)NSMutableSet) initWithCapacity:[v5 count]];
  id v7 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v5 count]);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v32;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        objc_super v14 = [v13 prefixedHandle];
        if ([v14 length])
        {
          v15 = [v13 prefixedHandle];
          [v6 addObject:v15];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v10);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v16 = v8;
  id v17 = [v16 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v28;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v28 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = *(void **)(*((void *)&v27 + 1) + 8 * (void)j);
        id v22 = [v21 prefixedHandle];
        if ([v22 length])
        {
          uint64_t v23 = [v21 contactAssociationID];
          id v24 = [v23 length];

          if (!v24)
          {
            v25 = [v26 objectForKeyedSubscript:v22];
            if ([v25 length] && (objc_msgSend(v7, "containsObject:", v25) & 1) == 0)
            {
              [v21 setContactAssociationID:v25];
              [v7 addObject:v25];
            }
          }
        }
      }
      id v18 = [v16 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v18);
  }
}

- (GKContactsIntegrationController)contactsController
{
  return self->_contactsController;
}

- (void)setContactsController:(id)a3
{
}

- (id)transactionGroupProvider
{
  return self->_transactionGroupProvider;
}

- (void)setTransactionGroupProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_transactionGroupProvider, 0);

  objc_storeStrong((id *)&self->_contactsController, 0);
}

@end