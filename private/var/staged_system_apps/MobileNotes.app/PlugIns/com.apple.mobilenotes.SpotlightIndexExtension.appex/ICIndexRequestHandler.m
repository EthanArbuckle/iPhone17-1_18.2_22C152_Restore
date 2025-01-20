@interface ICIndexRequestHandler
+ (void)initialize;
- (BOOL)isValidItemIdentifier:(id)a3 typeIdentifier:(id)a4;
- (id)dataForSearchableIndex:(id)a3 itemIdentifier:(id)a4 typeIdentifier:(id)a5 error:(id *)a6;
- (id)fileURLForSearchableIndex:(id)a3 itemIdentifier:(id)a4 typeIdentifier:(id)a5 inPlace:(BOOL)a6 error:(id *)a7;
- (void)searchableIndex:(id)a3 reindexAllSearchableItemsWithAcknowledgementHandler:(id)a4;
- (void)searchableIndex:(id)a3 reindexSearchableItemsWithIdentifiers:(id)a4 acknowledgementHandler:(id)a5;
@end

@implementation ICIndexRequestHandler

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && qword_10000C5B0[0] != -1)
  {
    dispatch_once(qword_10000C5B0, &stru_1000083C0);
  }
}

- (void)searchableIndex:(id)a3 reindexAllSearchableItemsWithAcknowledgementHandler:(id)a4
{
  id v4 = a4;
  +[ICIndexerStateHandler logMethodCall:1];
  v5 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100006470();
  }

  +[ICSettingsUtilities setObject:&__kCFBooleanTrue forKey:kICReindexOnLaunchKey];
  +[ICIndexerStateHandler logMethodCall:0];
  v6 = +[ICReindexer reindexer];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100003A78;
  v8[3] = &unk_1000083E8;
  id v9 = v4;
  id v7 = v4;
  [v6 deleteAllSearchableItemsWithCompletionHandler:v8];
}

- (void)searchableIndex:(id)a3 reindexSearchableItemsWithIdentifiers:(id)a4 acknowledgementHandler:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  +[ICIndexerStateHandler logMethodCall:2];
  v8 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100006568((uint64_t)v6, v8);
  }

  id v9 = +[ICReindexer reindexer];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100003C30;
  v12[3] = &unk_100008410;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [v9 reindexSearchableItemsWithObjectIDURIs:v11 completionHandler:v12];
}

- (id)dataForSearchableIndex:(id)a3 itemIdentifier:(id)a4 typeIdentifier:(id)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v18 = NSStringFromSelector(a2);
    int v20 = 138412802;
    id v21 = v9;
    __int16 v22 = 2112;
    id v23 = v10;
    __int16 v24 = 2112;
    id v25 = v18;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Asked for data for %@ with type %@ in %@", (uint8_t *)&v20, 0x20u);
  }
  if ([(ICIndexRequestHandler *)self isValidItemIdentifier:v9 typeIdentifier:v10])
  {
    v12 = +[ICSearchIndexer sharedIndexer];
    id v13 = [v12 newContextsForAllDataSources];
    id v14 = [v12 objectForManagedObjectIDURI:v9 inContexts:v13];
    if (objc_opt_respondsToSelector())
    {
      v15 = [v14 dataForTypeIdentifier:v10];
    }
    else
    {
      v15 = 0;
    }
    v16 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      id v19 = [v15 length];
      int v20 = 134218498;
      id v21 = v19;
      __int16 v22 = 2112;
      id v23 = v9;
      __int16 v24 = 2112;
      id v25 = v10;
      _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Returning %ld bytes for %@ with type %@", (uint8_t *)&v20, 0x20u);
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)fileURLForSearchableIndex:(id)a3 itemIdentifier:(id)a4 typeIdentifier:(id)a5 inPlace:(BOOL)a6 error:(id *)a7
{
  id v10 = a4;
  id v11 = a5;
  v12 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    __int16 v24 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    id v31 = v10;
    __int16 v32 = 2112;
    id v33 = v11;
    __int16 v34 = 2112;
    id v35 = v24;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Asked for file URL for %@ with type %@ in %@", buf, 0x20u);
  }
  if ([(ICIndexRequestHandler *)self isValidItemIdentifier:v10 typeIdentifier:v11])
  {
    id v13 = +[ICSearchIndexer sharedIndexer];
    id v14 = [v13 newContextsForAllDataSources];
    v15 = [v13 objectForManagedObjectIDURI:v10 inContexts:v14];
    if (objc_opt_respondsToSelector())
    {
      v16 = [v15 fileURLForTypeIdentifier:v11];
    }
    else
    {
      v16 = 0;
    }
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v17 = v14;
    id v18 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v26;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v26 != v20) {
            objc_enumerationMutation(v17);
          }
          [*(id *)(*((void *)&v25 + 1) + 8 * i) reset:v25];
        }
        id v19 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v19);
    }

    __int16 v22 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      id v31 = v16;
      __int16 v32 = 2112;
      id v33 = v10;
      __int16 v34 = 2112;
      id v35 = v11;
      _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "Returning %@ for %@ with type %@", buf, 0x20u);
    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)isValidItemIdentifier:(id)a3 typeIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5 && [v5 length])
  {
    BOOL v7 = 1;
    if (v6) {
      goto LABEL_11;
    }
    goto LABEL_8;
  }
  v8 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_100006750();
  }

  BOOL v7 = 0;
  if (!v6)
  {
LABEL_8:
    id v9 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100006710();
    }

    BOOL v7 = 0;
  }
LABEL_11:

  return v7;
}

@end