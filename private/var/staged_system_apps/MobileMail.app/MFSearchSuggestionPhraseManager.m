@interface MFSearchSuggestionPhraseManager
+ (id)log;
+ (id)phraseManagerWithPhrase:(id)a3 selectedSuggestions:(id)a4 vipManager:(id)a5 updatedSuggestion:(id)a6 filterQuery:(id)a7 implicitSuggestions:(id)a8 excludedMailboxes:(id)a9 inputLanguages:(id)a10 feedbackQueryID:(int64_t)a11;
+ (id)phraseManagerWithPhrase:(id)a3 selectedSuggestions:(id)a4 vipManager:(id)a5 updatedSuggestion:(id)a6 scopeIdentifierForPeopleSuggestions:(id)a7 inputLanguages:(id)a8 implicitSuggestions:(id)a9 generateCannedSuggestions:(BOOL)a10 excludedMailboxes:(id)a11 feedbackQueryID:(int64_t)a12;
- (BOOL)generateCannedSuggestions;
- (BOOL)hasCategory:(id)a3 andScope:(id)a4;
- (BOOL)hasMailboxSuggestion;
- (BOOL)hasSuggestionWithPredicate:(id)a3;
- (id)_spotlightQueryStringForVIP;
- (id)implicitAndSelectedSuggestions;
- (id)mailboxSpotlightQueryStringForPredicate:(id)a3 excluding:(BOOL)a4;
- (id)mailboxURLs;
- (id)spotlightQueryStrings;
- (void)setGenerateCannedSuggestions:(BOOL)a3;
@end

@implementation MFSearchSuggestionPhraseManager

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001DD8B4;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_100699CE0 != -1) {
    dispatch_once(&qword_100699CE0, block);
  }
  v2 = (void *)qword_100699CD8;

  return v2;
}

+ (id)phraseManagerWithPhrase:(id)a3 selectedSuggestions:(id)a4 vipManager:(id)a5 updatedSuggestion:(id)a6 filterQuery:(id)a7 implicitSuggestions:(id)a8 excludedMailboxes:(id)a9 inputLanguages:(id)a10 feedbackQueryID:(int64_t)a11
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = a10;
  id v25 = [objc_alloc((Class)a1) initWithPhrase:v17 selectedSuggestions:v18 vipManager:v19 updatedSuggestion:v20 scopeIdentifierForPeopleSuggestions:0 inputLanguages:v24 implicitSuggestions:v22 filterQuery:v21 excludedMailboxes:v23 customFlags:0 feedbackQueryID:a11];

  return v25;
}

+ (id)phraseManagerWithPhrase:(id)a3 selectedSuggestions:(id)a4 vipManager:(id)a5 updatedSuggestion:(id)a6 scopeIdentifierForPeopleSuggestions:(id)a7 inputLanguages:(id)a8 implicitSuggestions:(id)a9 generateCannedSuggestions:(BOOL)a10 excludedMailboxes:(id)a11 feedbackQueryID:(int64_t)a12
{
  id v27 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = a11;
  id v25 = [objc_alloc((Class)a1) initWithPhrase:v27 selectedSuggestions:v18 vipManager:v19 updatedSuggestion:v20 scopeIdentifierForPeopleSuggestions:v21 inputLanguages:v22 implicitSuggestions:v23 filterQuery:0 excludedMailboxes:v24 customFlags:0 feedbackQueryID:a12];
  [v25 setGenerateCannedSuggestions:a10];

  return v25;
}

- (id)implicitAndSelectedSuggestions
{
  v3 = [(MFSearchSuggestionPhraseManager *)self implicitSuggestions];
  v4 = [(MFSearchSuggestionPhraseManager *)self selectedSuggestions];
  v5 = [v3 arrayByAddingObjectsFromArray:v4];

  return v5;
}

- (BOOL)hasMailboxSuggestion
{
  v3 = +[MUISearchSuggestionCategory mailboxCategory];
  LOBYTE(self) = [(MFSearchSuggestionPhraseManager *)self hasCategory:v3 andScope:MFSearchSuggestionMailboxCategoryScope];

  return (char)self;
}

- (BOOL)hasSuggestionWithPredicate:(id)a3
{
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = [(MFSearchSuggestionPhraseManager *)self selectedSuggestions];
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) predicate];
        unsigned __int8 v10 = [v9 isEqual:v4];

        if (v10)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v6;
}

- (BOOL)hasCategory:(id)a3 andScope:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(MFSearchSuggestionPhraseManager *)self implicitAndSelectedSuggestions];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v20;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v8);
        }
        long long v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        long long v13 = [v12 category:(void)v19];
        unsigned int v14 = [v13 isGroupedInCategory:v6];

        if (v7)
        {
          long long v15 = [v12 selectedScope];
          v16 = [v15 identifier];
          unsigned int v17 = [v16 isEqualToString:v7];
        }
        else
        {
          unsigned int v17 = 1;
        }
        if (v14 & v17)
        {
          LOBYTE(v9) = 1;
          goto LABEL_14;
        }
      }
      id v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  return (char)v9;
}

- (BOOL)generateCannedSuggestions
{
  return self->_generateCannedSuggestions;
}

- (void)setGenerateCannedSuggestions:(BOOL)a3
{
  self->_generateCannedSuggestions = a3;
}

- (id)_spotlightQueryStringForVIP
{
  v2 = [(MFSearchSuggestionPhraseManager *)self vipManager];
  v3 = [v2 allVIPEmailAddresses];

  id v4 = [v3 count];
  if (v4)
  {
    id v5 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v4];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id obj = v3;
    id v6 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v17;
      uint64_t v8 = MDItemAuthorEmailAddresses;
      uint64_t v9 = MDItemAuthors;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(obj);
          }
          v11 = [*(id *)(*((void *)&v16 + 1) + 8 * i) em_stringForQuotingWithCharacter:39];
          long long v12 = +[NSString stringWithFormat:@"(%@ = '%@'cd) || (%@ = '%@'cd)", v8, v11, v9, v11];
          [v5 addObject:v12];
        }
        id v6 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v6);
    }

    long long v13 = +[EMSearchableIndexQuery queryStringByJoiningQueries:v5 withOperand:2];
  }
  else
  {
    long long v13 = 0;
  }

  return v13;
}

- (id)spotlightQueryStrings
{
  id v22 = objc_alloc_init((Class)NSMutableArray);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v3 = [(MFSearchSuggestionPhraseManager *)self implicitAndSelectedSuggestions];
  id v4 = [v3 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v24;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v24 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v8 = [v7 predicate];
        uint64_t v9 = +[EMMessageListItemPredicates predicateForIsVIP:1];
        unsigned int v10 = [v8 ef_containsSubpredicate:v9];

        if (v10)
        {
          uint64_t v11 = [(MFSearchSuggestionPhraseManager *)self _spotlightQueryStringForVIP];
        }
        else
        {
          long long v12 = [v7 category];
          long long v13 = +[MUISearchSuggestionCategory mailboxCategory];
          BOOL v14 = v12 == v13;

          if (!v14)
          {
            long long v15 = 0;
            goto LABEL_13;
          }
          uint64_t v11 = [(MFSearchSuggestionPhraseManager *)self mailboxSpotlightQueryStringForPredicate:v8 excluding:0];
        }
        long long v15 = (void *)v11;
        if (v11) {
          [v22 addObject:v11];
        }
LABEL_13:
      }
      id v4 = [v3 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v4);
  }

  long long v16 = [(MFSearchSuggestionPhraseManager *)self excludedMailboxes];
  id v17 = [v16 count];

  if (v17)
  {
    long long v18 = [(MFSearchSuggestionPhraseManager *)self excludedMailboxes];
    long long v19 = +[EMMessageListItemPredicates predicateForExcludingMessagesInMailboxes:v18];

    long long v20 = [(MFSearchSuggestionPhraseManager *)self mailboxSpotlightQueryStringForPredicate:v19 excluding:1];
    [v22 addObject:v20];
  }

  return v22;
}

- (id)mailboxSpotlightQueryStringForPredicate:(id)a3 excluding:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = +[EMMessageListItemPredicates mailboxURLsForPredicate:v5];
  if (![v6 count])
  {
    uint64_t v7 = +[MFSearchSuggestionPhraseManager log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_10045D290((uint64_t)v5, v7);
    }
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001DE6F4;
  v12[3] = &unk_10060CEC8;
  BOOL v13 = v4;
  uint64_t v8 = [v6 ef_map:v12];
  if (v4) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = 2;
  }
  unsigned int v10 = +[EMSearchableIndexQuery queryStringByJoiningQueries:v8 withOperand:v9];

  return v10;
}

- (id)mailboxURLs
{
  id v19 = objc_alloc_init((Class)NSMutableSet);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v3 = [(MFSearchSuggestionPhraseManager *)self implicitAndSelectedSuggestions];
  id v4 = [v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v21;
    uint64_t v6 = MFSearchSuggestionMailboxCategoryScope;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v21 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v9 = [v8 suggestion];
        unsigned int v10 = [v9 category];
        uint64_t v11 = +[MUISearchSuggestionCategory mailboxCategory];
        BOOL v12 = v10 == v11;

        if (v12)
        {
          BOOL v13 = [v8 selectedScope];
          BOOL v14 = [v13 identifier];
          unsigned int v15 = [v14 isEqualToString:v6];

          if (v15)
          {
            long long v16 = [v8 predicate];
            id v17 = +[EMMessageListItemPredicates mailboxURLsForPredicate:v16];
            [v19 addObjectsFromArray:v17];
          }
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v4);
  }

  return v19;
}

@end