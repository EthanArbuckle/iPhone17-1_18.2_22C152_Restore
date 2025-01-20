@interface SearchAddressBookOperation
- (SearchAddressBookOperation)initWithSearchQuery:(id)a3 context:(id)a4;
- (SearchAddressBookOperationDelegate)delegate;
- (void)main;
- (void)setDelegate:(id)a3;
@end

@implementation SearchAddressBookOperation

- (SearchAddressBookOperation)initWithSearchQuery:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SearchAddressBookOperation;
  v8 = [(SearchAddressBookOperation *)&v15 init];
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    searchQuery = v8->_searchQuery;
    v8->_searchQuery = v9;

    objc_storeStrong((id *)&v8->_context, a4);
    v11 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
    uint64_t v12 = [v6 componentsSeparatedByCharactersInSet:v11];
    searchTerms = v8->_searchTerms;
    v8->_searchTerms = (NSArray *)v12;
  }
  return v8;
}

- (void)main
{
  v3 = sub_100109E50();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "SearchAddressBookOperation - collecting results", buf, 2u);
  }

  if (+[AddressBookManager addressBookAllowed])
  {
    id v4 = objc_alloc_init((Class)NSMutableArray);
    v5 = +[NSMutableArray array];
    id v6 = +[NSMutableDictionary dictionary];
    id v7 = +[NSMutableDictionary dictionary];
    v8 = +[AddressBookManager sharedManager];
    v9 = [v8 contactStore];

    id v10 = objc_alloc((Class)CNContactFetchRequest);
    v11 = +[AddressBookManager sharedManager];
    uint64_t v12 = [v11 properties];
    id v13 = [v10 initWithKeysToFetch:v12];

    v14 = +[CNContact predicateForContactsMatchingName:self->_searchQuery options:3];
    [v13 setPredicate:v14];

    [v13 setSortOrder:1];
    id v61 = 0;
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = sub_100AC4160;
    v57[3] = &unk_101316AC8;
    v57[4] = self;
    id v15 = v5;
    id v58 = v15;
    id v50 = v6;
    id v59 = v50;
    id v16 = v7;
    id v60 = v16;
    [v9 enumerateContactsWithFetchRequest:v13 error:&v61 usingBlock:v57];
    id v17 = v61;
    if (GEOConfigGetBOOL() && [v15 count])
    {
      id v44 = v17;
      id v45 = v15;
      id v46 = v13;
      id v47 = v4;
      v48 = v9;
      v49 = self;
      v18 = +[_CDPeopleSuggesterContext currentContext];
      [v18 setConsumerIdentifier:@"com.apple.Maps.autocomplete"];
      v19 = +[NSDate date];
      [v18 setDate:v19];

      v20 = +[_CDPeopleSuggesterSettings defaultSettings];
      [v20 setMaxNumberOfPeopleSuggested:100];
      [v20 setAggregateByIdentifier:1];
      v21 = +[_CDPeopleSuggester peopleSuggester];
      v43 = v18;
      [v21 setContext:v18];
      v42 = v20;
      [v21 setSettings:v20];
      v41 = v21;
      v22 = [v21 suggestPeopleWithError:0];
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v23 = [v22 countByEnumeratingWithState:&v53 objects:v64 count:16];
      if (!v23) {
        goto LABEL_27;
      }
      id v24 = v23;
      uint64_t v25 = *(void *)v54;
      while (1)
      {
        for (i = 0; i != v24; i = (char *)i + 1)
        {
          if (*(void *)v54 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = *(void **)(*((void *)&v53 + 1) + 8 * i);
          v28 = [v27 contact];
          v29 = v28;
          if (v28)
          {
            v30 = [v28 personId];
            if ([v29 personIdType] == (id)1)
            {
              v31 = [v16 objectForKeyedSubscript:v30];
            }
            else
            {
              v31 = 0;
            }
            if ([v29 personIdType] == (id)3)
            {
              uint64_t v32 = [v50 objectForKeyedSubscript:v30];

              v31 = (void *)v32;
              if (!v32)
              {
                v31 = [v16 objectForKeyedSubscript:v30];
                goto LABEL_18;
              }
LABEL_19:
              [v31 peopleSuggesterRank];
              if (v33 == 0.0
                || ([v31 peopleSuggesterRank], double v35 = v34, objc_msgSend(v27, "rank"), v35 >= v36))
              {
                [v27 rank];
              }
              else
              {
                [v31 peopleSuggesterRank];
              }
              [v31 setPeopleSuggesterRank:];
            }
            else
            {
LABEL_18:
              if (v31) {
                goto LABEL_19;
              }
            }
          }
        }
        id v24 = [v22 countByEnumeratingWithState:&v53 objects:v64 count:16];
        if (!v24)
        {
LABEL_27:

          v9 = v48;
          self = v49;
          id v13 = v46;
          id v4 = v47;
          id v17 = v44;
          id v15 = v45;
          break;
        }
      }
    }
    [v15 sortUsingSelector:"compare:"];
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_100AC4284;
    v51[3] = &unk_101316AF0;
    v51[4] = self;
    id v37 = v4;
    id v52 = v37;
    [v15 enumerateObjectsUsingBlock:v51];
  }
  else
  {
    id v37 = 0;
  }
  v38 = sub_100109E50();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    id v39 = [v37 count];
    *(_DWORD *)buf = 134217984;
    id v63 = v39;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "SearchAddressBookOperation - collected %lu results", buf, 0xCu);
  }

  if (([(SearchAddressBookOperation *)self isCancelled] & 1) == 0)
  {
    v40 = [(SearchAddressBookOperation *)self delegate];
    [v40 searchAddressBookOperation:self didMatchResults:v37];
  }
}

- (SearchAddressBookOperationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);

  return (SearchAddressBookOperationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_searchTerms, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_searchQuery, 0);
}

@end