@interface SuggestionsItemSource
+ (int64_t)itemSourceSubtypeForSuggestionsEntryType:(int64_t)a3;
- (NSArray)suggestions;
- (SuggestionsItemSource)init;
- (id)allItems;
- (void)setSuggestions:(id)a3;
@end

@implementation SuggestionsItemSource

- (SuggestionsItemSource)init
{
  v8.receiver = self;
  v8.super_class = (Class)SuggestionsItemSource;
  v2 = [(PersonalizedItemSource *)&v8 initWithSourceType:9 sourceSubtype:0];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("SuggestionsItemSource.lock", v3);
    lockQueue = v2->_lockQueue;
    v2->_lockQueue = (OS_dispatch_queue *)v4;

    suggestions = v2->_suggestions;
    v2->_suggestions = (NSArray *)&__NSArray0__struct;
  }
  return v2;
}

- (void)setSuggestions:(id)a3
{
  id v4 = a3;
  v5 = (NSArray *)[v4 copy];
  suggestions = self->_suggestions;
  self->_suggestions = v5;

  v20 = v4;
  v21 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v7 = self->_suggestions;
  id v8 = [(NSArray *)v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v8)
  {
    id v9 = v8;
    unsigned __int16 v10 = 1;
    uint64_t v11 = *(void *)v25;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v7);
        }
        v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if ([v13 type] != (id)5
          && [v13 type] != (id)24
          && (!+[LibraryUIUtilities isMyPlacesEnabled]
           || [v13 type] != (id)18
           && [v13 type] != (id)1
           && [v13 type] != (id)2
           && [v13 type] != (id)19))
        {
          int64_t v14 = [(PersonalizedItemSource *)self sourceType];
          int64_t v15 = [(PersonalizedItemSource *)self sourceSubtype];
          if (v14)
          {
            int64_t v16 = v15;
          }
          else
          {
            int64_t v14 = 9;
            int64_t v16 = 0;
          }
          if (v14 == 9 && !v16) {
            int64_t v16 = +[SuggestionsItemSource itemSourceSubtypeForSuggestionsEntryType:](SuggestionsItemSource, "itemSourceSubtypeForSuggestionsEntryType:", [v13 type]);
          }
          v17 = [[SuggestionsItem alloc] initWithSuggestion:v13 order:v10 sourceType:v14 sourceSubtype:v16 hasPriorityOverride:0 priorityOverride:0];
          if (v17)
          {
            [v21 addObject:v17];
            ++v10;
          }
        }
      }
      id v9 = [(NSArray *)v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v9);
  }

  lockQueue = self->_lockQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014B48;
  block[3] = &unk_1012E5D58;
  block[4] = self;
  id v23 = v21;
  id v19 = v21;
  dispatch_sync(lockQueue, block);
  [(PersonalizedItemSource *)self _notifyObserversItemsDidChange];
}

- (id)allItems
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_100103B6C;
  unsigned __int16 v10 = sub_100104640;
  id v11 = 0;
  lockQueue = self->_lockQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100014B94;
  v5[3] = &unk_1012E73F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lockQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (NSArray)suggestions
{
  return self->_suggestions;
}

+ (int64_t)itemSourceSubtypeForSuggestionsEntryType:(int64_t)a3
{
  if ((unint64_t)a3 > 0x18) {
    return 13;
  }
  else {
    return qword_100F6F278[a3];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockQueue, 0);
  objc_storeStrong((id *)&self->_items, 0);

  objc_storeStrong((id *)&self->_suggestions, 0);
}

@end