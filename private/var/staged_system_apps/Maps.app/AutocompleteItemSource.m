@interface AutocompleteItemSource
- (AutocompleteItemSource)init;
- (AutocompleteItemSource)initWithAutocompleteItems:(id)a3;
- (AutocompleteItemSource)initWithServerCompletions:(id)a3 serverSections:(id)a4;
- (id)allItems;
- (id)debugDescription;
- (int64_t)sourceType;
- (unint64_t)count;
@end

@implementation AutocompleteItemSource

- (AutocompleteItemSource)init
{
  return 0;
}

- (AutocompleteItemSource)initWithServerCompletions:(id)a3 serverSections:(id)a4
{
  v19 = self;
  id v4 = a3;
  v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v11 = [v10 hasSortPriority:v19];
        if (v11) {
          id v12 = [v10 sortPriority];
        }
        else {
          id v12 = 0;
        }
        v13 = [AutocompleteItem alloc];
        v14 = [v10 serverResultScoreMetadata];
        v15 = [(AutocompleteItem *)v13 initWithServerCompletion:v10 hasPriorityOverride:v11 priorityOverride:v12 serverResultScoreMetadata:v14];

        [v5 addObject:v15];
      }
      id v7 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v7);
  }

  id v16 = [v5 copy];
  v17 = [(AutocompleteItemSource *)v19 initWithAutocompleteItems:v16];

  if (v17) {
    v17->_sourceType = 1;
  }

  return v17;
}

- (AutocompleteItemSource)initWithAutocompleteItems:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AutocompleteItemSource;
  v5 = [(AutocompleteItemSource *)&v9 init];
  if (v5)
  {
    id v6 = (NSArray *)[v4 copy];
    allItems = v5->_allItems;
    v5->_allItems = v6;
  }
  return v5;
}

- (id)allItems
{
  return self->_allItems;
}

- (unint64_t)count
{
  return [(NSArray *)self->_allItems count];
}

- (id)debugDescription
{
  int64_t v3 = [(AutocompleteItemSource *)self sourceType];
  CFStringRef v4 = @"Client Results";
  if (v3 == 1) {
    CFStringRef v4 = @"Server results";
  }
  return +[NSString stringWithFormat:@"%@ - type: %@", self, v4];
}

- (int64_t)sourceType
{
  return self->_sourceType;
}

- (void).cxx_destruct
{
}

@end