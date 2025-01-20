@interface GKSortSuggestionsModifier
- (GKFriendSuggesterSettings)settings;
- (GKRerankNetworkRequester)networkRequester;
- (GKSortSuggestionsModifier)initWithSettings:(id)a3 networkRequester:(id)a4 cachedSortedAssociationIDs:(id)a5 transactionGroupProvider:(id)a6 featureEnabledBlock:(id)a7;
- (NSArray)cachedSortedAssociationIDs;
- (id)featureEnabledBlock;
- (id)modifySuggestions:(id)a3;
- (id)sortSuggestions:(id)a3 usingSortedContactsAssociationIDs:(id)a4 suggestionMap:(id)a5;
- (id)transactionGroupProvider;
- (void)setCachedSortedAssociationIDs:(id)a3;
- (void)setFeatureEnabledBlock:(id)a3;
- (void)setNetworkRequester:(id)a3;
- (void)setSettings:(id)a3;
- (void)setTransactionGroupProvider:(id)a3;
@end

@implementation GKSortSuggestionsModifier

- (GKSortSuggestionsModifier)initWithSettings:(id)a3 networkRequester:(id)a4 cachedSortedAssociationIDs:(id)a5 transactionGroupProvider:(id)a6 featureEnabledBlock:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v24.receiver = self;
  v24.super_class = (Class)GKSortSuggestionsModifier;
  v18 = [(GKSortSuggestionsModifier *)&v24 init];
  if (v18)
  {
    id v19 = objc_retainBlock(v16);
    id transactionGroupProvider = v18->_transactionGroupProvider;
    v18->_id transactionGroupProvider = v19;

    objc_storeStrong((id *)&v18->_networkRequester, a4);
    id v21 = objc_retainBlock(v17);
    id featureEnabledBlock = v18->_featureEnabledBlock;
    v18->_id featureEnabledBlock = v21;

    objc_storeStrong((id *)&v18->_settings, a3);
    objc_storeStrong((id *)&v18->_cachedSortedAssociationIDs, a5);
  }

  return v18;
}

- (id)modifySuggestions:(id)a3
{
  id v4 = a3;
  v5 = [(GKSortSuggestionsModifier *)self featureEnabledBlock];
  char v6 = v5[2]();

  if (v6)
  {
    v7 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v4 count]);
    v8 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v9 = v4;
    id v10 = [v9 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v40;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v40 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          id v15 = [v14 contactAssociationID];
          if ([v15 length])
          {
            [v7 setObject:v14 forKeyedSubscript:v15];
            [v8 addObject:v15];
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v39 objects:v43 count:16];
      }
      while (v11);
    }

    id v16 = [v8 count];
    id v17 = [(GKSortSuggestionsModifier *)self settings];
    id v18 = [v17 mininumIDsForServiceRequest];

    if (v16 >= v18)
    {
      v20 = [(GKSortSuggestionsModifier *)self settings];
      id v21 = [v20 suggestionsLimit];

      v22 = [(GKSortSuggestionsModifier *)self cachedSortedAssociationIDs];

      if (v22)
      {
        if (!os_log_GKGeneral) {
          id v23 = (id)GKOSLoggers();
        }
        objc_super v24 = (void *)os_log_GKContacts;
        if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
          sub_10015B104(v24, self);
        }
        id v25 = [(GKSortSuggestionsModifier *)self cachedSortedAssociationIDs];
      }
      else
      {
        if ([v8 count] <= v21)
        {
          id v26 = [v8 copy];
          v27 = 0;
        }
        else
        {
          [v8 subarrayWithRange:0, v21];
          id v26 = (id)objc_claimAutoreleasedReturnValue();
          v27 = [v8 subarrayWithRange:v21, (unsigned char *)[v8 count] - (unsigned char *)[v26 count]];
        }
        v28 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKSortSuggestionsModifier.m", 164, "-[GKSortSuggestionsModifier modifySuggestions:]");
        v29 = +[GKDispatchGroup dispatchGroupWithName:v28];

        v36[0] = _NSConcreteStackBlock;
        v36[1] = 3221225472;
        v36[2] = sub_10015AAEC;
        v36[3] = &unk_1002D3980;
        v36[4] = self;
        id v37 = v26;
        id v30 = v29;
        id v38 = v30;
        id v31 = v26;
        [v30 perform:v36];
        [v30 wait];
        v32 = [v30 result];
        id v33 = [v32 mutableCopy];

        if ([v27 count]) {
          [v33 addObjectsFromArray:v27];
        }
        id v25 = [v33 copy];
      }
      id v34 = [v7 copy];
      id v19 = [(GKSortSuggestionsModifier *)self sortSuggestions:v9 usingSortedContactsAssociationIDs:v25 suggestionMap:v34];
    }
    else
    {
      id v19 = v9;
    }
  }
  else
  {
    id v19 = v4;
  }

  return v19;
}

- (id)sortSuggestions:(id)a3 usingSortedContactsAssociationIDs:(id)a4 suggestionMap:(id)a5
{
  v8 = (GKSortSuggestionsModifier *)a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 count])
  {
    id v33 = self;
    id v11 = +[NSMutableArray arrayWithCapacity:[(GKSortSuggestionsModifier *)v8 count]];
    uint64_t v12 = +[NSMutableSet setWithCapacity:[(GKSortSuggestionsModifier *)v8 count]];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v34 = v9;
    id v13 = v9;
    id v14 = [v13 countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v40;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v40 != v16) {
            objc_enumerationMutation(v13);
          }
          id v18 = [v10 objectForKeyedSubscript:*(void *)(*((void *)&v39 + 1) + 8 * i)];
          if (v18)
          {
            [v11 addObject:v18];
            id v19 = [v18 contactID];
            [v12 addObject:v19];
          }
        }
        id v15 = [v13 countByEnumeratingWithState:&v39 objects:v44 count:16];
      }
      while (v15);
    }

    id v20 = [v11 count];
    id v21 = [(GKSortSuggestionsModifier *)v33 settings];
    id v22 = [v21 mininumIDsForContactAssociationIDsOnly];

    if (v20 < v22)
    {
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v33 = v8;
      id v23 = v8;
      id v24 = [(GKSortSuggestionsModifier *)v23 countByEnumeratingWithState:&v35 objects:v43 count:16];
      if (v24)
      {
        id v25 = v24;
        uint64_t v26 = *(void *)v36;
        do
        {
          for (j = 0; j != v25; j = (char *)j + 1)
          {
            if (*(void *)v36 != v26) {
              objc_enumerationMutation(v23);
            }
            v28 = *(void **)(*((void *)&v35 + 1) + 8 * (void)j);
            v29 = [v28 contactID:v33];
            unsigned __int8 v30 = [v12 containsObject:v29];

            if ((v30 & 1) == 0) {
              [v11 addObject:v28];
            }
          }
          id v25 = [(GKSortSuggestionsModifier *)v23 countByEnumeratingWithState:&v35 objects:v43 count:16];
        }
        while (v25);
      }

      v8 = v33;
    }
    id v31 = [(GKSortSuggestionsModifier *)[v11 copyWithZone:v33];

    id v9 = v34;
  }
  else
  {
    id v31 = v8;
  }

  return v31;
}

- (id)transactionGroupProvider
{
  return self->_transactionGroupProvider;
}

- (void)setTransactionGroupProvider:(id)a3
{
}

- (id)featureEnabledBlock
{
  return self->_featureEnabledBlock;
}

- (void)setFeatureEnabledBlock:(id)a3
{
}

- (GKRerankNetworkRequester)networkRequester
{
  return self->_networkRequester;
}

- (void)setNetworkRequester:(id)a3
{
}

- (GKFriendSuggesterSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
}

- (NSArray)cachedSortedAssociationIDs
{
  return self->_cachedSortedAssociationIDs;
}

- (void)setCachedSortedAssociationIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedSortedAssociationIDs, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_networkRequester, 0);
  objc_storeStrong(&self->_featureEnabledBlock, 0);

  objc_storeStrong(&self->_transactionGroupProvider, 0);
}

@end