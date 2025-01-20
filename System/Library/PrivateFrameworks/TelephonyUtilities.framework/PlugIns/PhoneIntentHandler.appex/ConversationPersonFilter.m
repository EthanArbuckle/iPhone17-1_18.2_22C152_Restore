@interface ConversationPersonFilter
- (BOOL)_matchesCallerFilter:(id)a3;
- (BOOL)_matchesParticipantsFilter:(id)a3;
- (BOOL)matches:(id)a3;
- (ConversationPersonFilter)initWithCaller:(id)a3 participants:(id)a4 dataSource:(id)a5;
- (INPerson)caller;
- (NSArray)participants;
- (TUContactsDataSource)contactsDataSource;
- (id)_contactPoolForConversation:(id)a3;
- (id)_identifiersForRecommendedPerson:(id)a3;
@end

@implementation ConversationPersonFilter

- (ConversationPersonFilter)initWithCaller:(id)a3 participants:(id)a4 dataSource:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ConversationPersonFilter;
  v12 = [(ConversationPersonFilter *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_caller, a3);
    objc_storeStrong((id *)&v13->_participants, a4);
    objc_storeStrong((id *)&v13->_contactsDataSource, a5);
  }

  return v13;
}

- (BOOL)matches:(id)a3
{
  v3 = self;
  v4 = [(ConversationPersonFilter *)self _contactPoolForConversation:a3];
  unsigned __int8 v5 = [(ConversationPersonFilter *)v3 _matchesCallerFilter:v4];
  LOBYTE(v3) = v5 & [(ConversationPersonFilter *)v3 _matchesParticipantsFilter:v4];

  return (char)v3;
}

- (BOOL)_matchesCallerFilter:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(ConversationPersonFilter *)self caller];

  if (v5)
  {
    v6 = [(ConversationPersonFilter *)self caller];
    v7 = [(ConversationPersonFilter *)self _identifiersForRecommendedPerson:v6];

    unsigned int v8 = [v4 callerPoolContainsOneOf:v7];
    id v9 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v10 = @"NO";
      if (v8) {
        CFStringRef v10 = @"YES";
      }
      int v12 = 138412290;
      CFStringRef v13 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "ConversationPersonFilter: matchesCaller=%@", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    LOBYTE(v8) = 1;
  }

  return v8;
}

- (BOOL)_matchesParticipantsFilter:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(ConversationPersonFilter *)self participants];
  id v6 = [v5 count];

  if (v6)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v7 = [(ConversationPersonFilter *)self participants];
    id v8 = [v7 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v19;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          int v12 = [(ConversationPersonFilter *)self _identifiersForRecommendedPerson:*(void *)(*((void *)&v18 + 1) + 8 * i)];
          unsigned int v13 = [v4 participantsPoolContainsOneOf:v12];

          if (!v13)
          {
            BOOL v14 = 0;
            goto LABEL_12;
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v18 objects:v24 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    BOOL v14 = 1;
LABEL_12:
  }
  else
  {
    BOOL v14 = 1;
  }
  objc_super v15 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v16 = @"NO";
    if (v14) {
      CFStringRef v16 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v23 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "ConversationPersonFilter: matchesParticipants=%@", buf, 0xCu);
  }

  return v14;
}

- (id)_contactPoolForConversation:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v6 = [v4 remoteMembers];
  id v7 = [v6 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v36;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v36 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v35 + 1) + 8 * i) handle];
        [v5 addObject:v11];
      }
      id v8 = [v6 countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v8);
  }

  int v12 = [(ConversationPersonFilter *)self contactsDataSource];
  v40 = CNContactIdentifierKey;
  unsigned int v13 = +[NSArray arrayWithObjects:&v40 count:1];
  BOOL v14 = objc_msgSend(v12, "tu_contactsForHandles:keyDescriptors:error:", v5, v13, 0);

  id v15 = objc_alloc_init((Class)NSMutableArray);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  CFStringRef v16 = objc_msgSend(v14, "allValues", 0);
  id v17 = [v16 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v32;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v32 != v19) {
          objc_enumerationMutation(v16);
        }
        [v15 addObjectsFromArray:*(void *)(*((void *)&v31 + 1) + 8 * (void)j)];
      }
      id v18 = [v16 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v18);
  }

  long long v21 = [[ContactPool alloc] initWithContacts:v15];
  v22 = [v4 initiator];

  id v23 = &__NSArray0__struct;
  if (v22)
  {
    v24 = [v4 initiator];
    uint64_t v25 = [v14 objectForKeyedSubscript:v24];
    v26 = (void *)v25;
    if (v25) {
      v27 = (void *)v25;
    }
    else {
      v27 = &__NSArray0__struct;
    }
    id v23 = v27;
  }
  v28 = [[ContactPool alloc] initWithContacts:v23];
  v29 = objc_alloc_init(ConversationContactPool);
  [(ConversationContactPool *)v29 setCallerPool:v28];
  [(ConversationContactPool *)v29 setParticipantsPool:v21];

  return v29;
}

- (id)_identifiersForRecommendedPerson:(id)a3
{
  v3 = [a3 extractRecommendation];
  id v4 = [v3 contactIdentifiers];

  id v5 = +[NSSet setWithArray:v4];

  return v5;
}

- (INPerson)caller
{
  return self->_caller;
}

- (NSArray)participants
{
  return self->_participants;
}

- (TUContactsDataSource)contactsDataSource
{
  return self->_contactsDataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactsDataSource, 0);
  objc_storeStrong((id *)&self->_participants, 0);

  objc_storeStrong((id *)&self->_caller, 0);
}

@end