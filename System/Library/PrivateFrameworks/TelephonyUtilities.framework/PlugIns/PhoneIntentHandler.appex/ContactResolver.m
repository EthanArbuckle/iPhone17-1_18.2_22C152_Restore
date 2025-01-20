@interface ContactResolver
+ (id)keysToFetch;
- (ContactResolver)initWithDataSource:(id)a3 logger:(id)a4;
- (IntentHandlerCoreAnalyticsLogging)coreAnalyticsLogger;
- (TUContactsDataSource)contactsDataSource;
- (id)_contactsMatchingIdentifiers:(id)a3;
- (id)_contactsMatchingNamesForPerson:(id)a3;
- (id)matchingContactsForPerson:(id)a3;
- (void)_sendSiriMatchAnalyticsEventForIdentifiers:(id)a3 contactsMatchingId:(id)a4 contactsMatchingName:(id)a5;
@end

@implementation ContactResolver

- (ContactResolver)initWithDataSource:(id)a3 logger:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ContactResolver;
  v9 = [(ContactResolver *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contactsDataSource, a3);
    objc_storeStrong((id *)&v10->_coreAnalyticsLogger, a4);
  }

  return v10;
}

+ (id)keysToFetch
{
  if (qword_100058930 != -1) {
    dispatch_once(&qword_100058930, &stru_10004CC18);
  }
  v2 = (void *)qword_100058928;

  return v2;
}

- (id)matchingContactsForPerson:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(v4, "tu_allContactIdentifiers");
  v6 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 134218242;
    id v22 = [v5 count];
    __int16 v23 = 2112;
    id v24 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Person contains %ld contact IDs. Person: %@", (uint8_t *)&v21, 0x16u);
  }

  id v7 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412290;
    id v22 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Looking up contact in the contact store matching identifiers: %@", (uint8_t *)&v21, 0xCu);
  }

  id v8 = [(ContactResolver *)self _contactsMatchingIdentifiers:v5];
  v9 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v8 count];
    int v21 = 134217984;
    id v22 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Found %ld contacts matching siriMatches", (uint8_t *)&v21, 0xCu);
  }

  v11 = +[StartCallIntentHandlerUtilities sortContacts:v8 withIdentifiers:v5];
  id v12 = [v11 count];
  v13 = IntentHandlerDefaultLog();
  v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Found contacts matching siriMatches", (uint8_t *)&v21, 2u);
    }

    v15 = &__NSArray0__struct;
    v16 = v11;
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000308B4(v14);
    }

    v17 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Looking up contact in the contact store by names", (uint8_t *)&v21, 2u);
    }

    v16 = [(ContactResolver *)self _contactsMatchingNamesForPerson:v4];
    v15 = v16;
  }
  id v18 = v16;
  [(ContactResolver *)self _sendSiriMatchAnalyticsEventForIdentifiers:v5 contactsMatchingId:v11 contactsMatchingName:v15];
  v19 = [[ContactPool alloc] initWithContacts:v18];

  return v19;
}

- (id)_contactsMatchingIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = &__NSArray0__struct;
  if ([v4 count])
  {
    v6 = IntentHandlerDefaultLog();
    os_signpost_id_t v7 = os_signpost_id_generate(v6);

    id v8 = IntentHandlerDefaultLog();
    v9 = v8;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "contactsMatchingIdentifiers", "", buf, 2u);
    }

    id v10 = +[CNContact predicateForContactsWithIdentifiers:v4];
    v11 = [(ContactResolver *)self contactsDataSource];
    id v12 = +[ContactResolver keysToFetch];
    id v22 = 0;
    v13 = [v11 unifiedContactsMatchingPredicate:v10 keysToFetch:v12 error:&v22];
    id v14 = v22;
    if (v13) {
      v15 = v13;
    }
    else {
      v15 = &__NSArray0__struct;
    }
    id v5 = v15;

    if (v14)
    {
      v16 = IntentHandlerDefaultLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_1000308F8((uint64_t)v14, v16);
      }
    }
    v17 = IntentHandlerDefaultLog();
    id v18 = v17;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_WORD *)int v21 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_END, v7, "contactsMatchingIdentifiers", "", v21, 2u);
    }
  }
  id v19 = [v5 copy];

  return v19;
}

- (id)_contactsMatchingNamesForPerson:(id)a3
{
  id v4 = a3;
  id v5 = IntentHandlerDefaultLog();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  os_signpost_id_t v7 = IntentHandlerDefaultLog();
  id v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "contactsMatchingName", "", buf, 2u);
  }

  v9 = [v4 displayName];

  id v10 = +[CNContact predicateForContactsMatchingName:v9 options:1];

  v11 = [(ContactResolver *)self contactsDataSource];
  id v12 = +[ContactResolver keysToFetch];
  id v24 = 0;
  v13 = [v11 unifiedContactsMatchingPredicate:v10 keysToFetch:v12 error:&v24];
  id v14 = v24;
  v15 = &__NSArray0__struct;
  if (v13) {
    v15 = v13;
  }
  id v16 = v15;

  if (v14)
  {
    v17 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1000309FC((uint64_t)v14, v17);
    }
  }
  id v18 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    sub_100030970(v16, v18);
  }

  id v19 = IntentHandlerDefaultLog();
  v20 = v19;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)__int16 v23 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_INTERVAL_END, v6, "contactsMatchingName", "", v23, 2u);
  }

  id v21 = [v16 copy];

  return v21;
}

- (void)_sendSiriMatchAnalyticsEventForIdentifiers:(id)a3 contactsMatchingId:(id)a4 contactsMatchingName:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a3 count]);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = [v9 count];

  v11 = +[NSNumber numberWithUnsignedInteger:v10];
  id v12 = [v8 count];

  v13 = +[NSNumber numberWithUnsignedInteger:v12];
  id v14 = +[INPreferences sharedPreferences];
  uint64_t v15 = [v14 _cachedSiriLanguageCode];

  if (v15) {
    id v16 = (__CFString *)v15;
  }
  else {
    id v16 = @"N/A";
  }
  v17 = [(ContactResolver *)self coreAnalyticsLogger];
  [v17 logSiriMatchEvent:v18 matchesByIdCount:v11 matchesByNameCount:v13 siriLocale:v16];
}

- (TUContactsDataSource)contactsDataSource
{
  return self->_contactsDataSource;
}

- (IntentHandlerCoreAnalyticsLogging)coreAnalyticsLogger
{
  return self->_coreAnalyticsLogger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreAnalyticsLogger, 0);

  objc_storeStrong((id *)&self->_contactsDataSource, 0);
}

@end