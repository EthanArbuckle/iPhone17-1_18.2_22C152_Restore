@interface GKAppendSuggestionsModifier
- (GKAppendSuggestionsModifier)initWithSettings:(id)a3 suggestionsProvider:(id)a4;
- (GKFriendSuggesterSettings)settings;
- (id)modifySuggestions:(id)a3;
- (id)suggestionsProvider;
- (void)setSettings:(id)a3;
- (void)setSuggestionsProvider:(id)a3;
@end

@implementation GKAppendSuggestionsModifier

- (GKAppendSuggestionsModifier)initWithSettings:(id)a3 suggestionsProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)GKAppendSuggestionsModifier;
  v9 = [(GKAppendSuggestionsModifier *)&v13 init];
  if (v9)
  {
    id v10 = objc_retainBlock(v8);
    id suggestionsProvider = v9->_suggestionsProvider;
    v9->_id suggestionsProvider = v10;

    objc_storeStrong((id *)&v9->_settings, a3);
  }

  return v9;
}

- (id)modifySuggestions:(id)a3
{
  id v4 = a3;
  id v5 = [v4 count];
  v6 = [(GKAppendSuggestionsModifier *)self settings];
  id v7 = [v6 mininumIDsForContactAssociationIDsOnly];

  if (v5 >= v7)
  {
    id v23 = v4;
  }
  else
  {
    id v8 = [(GKAppendSuggestionsModifier *)self settings];
    v9 = [v8 suggestionsLimit];
    int64_t v10 = v9 - (unsigned char *)[v4 count];

    v11 = [(GKAppendSuggestionsModifier *)self suggestionsProvider];
    v12 = v11[2](v11, v10);

    objc_super v13 = [v4 _gkDistinctValuesForKeyPath:@"contactID"];
    id v14 = [v4 mutableCopy];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v15 = v12;
    id v16 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v26;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v26 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          v21 = [v20 contactID:v25];
          unsigned __int8 v22 = [v13 containsObject:v21];

          if ((v22 & 1) == 0) {
            [v14 addObject:v20];
          }
        }
        id v17 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v17);
    }

    id v23 = [v14 copy];
  }

  return v23;
}

- (GKFriendSuggesterSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
}

- (id)suggestionsProvider
{
  return self->_suggestionsProvider;
}

- (void)setSuggestionsProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_suggestionsProvider, 0);

  objc_storeStrong((id *)&self->_settings, 0);
}

@end