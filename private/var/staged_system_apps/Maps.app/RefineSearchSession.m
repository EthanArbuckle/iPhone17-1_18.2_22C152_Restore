@interface RefineSearchSession
- (NSArray)items;
- (RefineSearchSession)initWithObjects:(id)a3 forType:(int)a4;
- (id)description;
- (int)listType;
- (void)updateWithFilterView:(id)a3;
- (void)updateWithSelection:(unint64_t)a3;
@end

@implementation RefineSearchSession

- (RefineSearchSession)initWithObjects:(id)a3 forType:(int)a4
{
  id v6 = a3;
  if ([v6 count])
  {
    v25.receiver = self;
    v25.super_class = (Class)RefineSearchSession;
    v7 = [(RefineSearchSession *)&v25 init];
    v8 = v7;
    if (v7)
    {
      v7->_resultsItemsInitialized = 0;
      v7->_listType = a4;
      v9 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v6 count]);
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v10 = v6;
      id v11 = [v10 countByEnumeratingWithState:&v21 objects:v26 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v22;
        do
        {
          v14 = 0;
          do
          {
            if (*(void *)v22 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 8 * (void)v14);
            id v16 = objc_alloc_init((Class)GEOSuggestionItem);
            [v16 setSuggestionString:v15];
            [v9 addObject:v16];

            v14 = (char *)v14 + 1;
          }
          while (v12 != v14);
          id v12 = [v10 countByEnumeratingWithState:&v21 objects:v26 count:16];
        }
        while (v12);
      }

      v17 = (NSArray *)[v9 copy];
      items = v8->_items;
      v8->_items = v17;
    }
    self = v8;
    v19 = self;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void)updateWithSelection:(unint64_t)a3
{
  if ([(NSArray *)self->_items count] > a3)
  {
    id v5 = [(NSArray *)self->_items objectAtIndexedSubscript:a3];
    [v5 setTappingCount:[v5 tappingCount] + 1];
  }
}

- (void)updateWithFilterView:(id)a3
{
  v4 = [a3 visibleSuggestions];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) tag];
        if (v9 < (id)[(NSArray *)self->_items count])
        {
          id v10 = [(NSArray *)self->_items objectAtIndexedSubscript:v9];
          id v11 = v10;
          if (self->_resultsItemsInitialized) {
            [v10 setEventuallyVisible:1];
          }
          else {
            [v10 setInitiallyVisible:1];
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  self->_resultsItemsInitialized = 1;
}

- (id)description
{
  uint64_t listType = self->_listType;
  if (listType >= 3)
  {
    v4 = +[NSString stringWithFormat:@"(unknown: %i)", listType];
  }
  else
  {
    v4 = off_1012F54C0[listType];
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  obj = self->_items;
  id v5 = [(NSArray *)obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      v8 = 0;
      id v9 = v4;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * (void)v8);
        id v11 = [v10 suggestionString];
        if ([v10 initiallyVisible]) {
          CFStringRef v12 = @"YES";
        }
        else {
          CFStringRef v12 = @"NO";
        }
        if ([v10 eventuallyVisible]) {
          CFStringRef v13 = @"YES";
        }
        else {
          CFStringRef v13 = @"NO";
        }
        -[__CFString stringByAppendingFormat:](v9, "stringByAppendingFormat:", @"\nListSession %@ initVisible %@ eventVisible %@ tap %d", v11, v12, v13, [v10 tappingCount]);
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

        v8 = (char *)v8 + 1;
        id v9 = v4;
      }
      while (v6 != v8);
      id v6 = [(NSArray *)obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  return v4;
}

- (NSArray)items
{
  return self->_items;
}

- (int)listType
{
  return self->_listType;
}

- (void).cxx_destruct
{
}

@end