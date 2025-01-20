@interface MFSearchSuggestionsTableViewModel
- (MFSearchSuggestionsTableViewModel)init;
- (MFSearchSuggestionsTableViewModel)initWithSectionComparator:(id)a3 defaultReuseConfiguration:(id)a4;
- (MFSearchSuggestionsTableViewModelReuseConfiguration)defaultReuseConfiguration;
- (NSMutableArray)orderedIdentifiers;
- (NSMutableDictionary)categoryConfiguration;
- (NSMutableDictionary)objectsByIdentifier;
- (NSString)description;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_reuseConfigurationForSuggestion:(id)a3;
- (id)comparator;
- (id)copyWithZone:(_NSZone *)a3;
- (id)identifierAtIndex:(unint64_t)a3;
- (id)indexPathForSuggestion:(id)a3;
- (id)objectForKeyedSubscript:(id)a3;
- (id)sectionAtIndex:(unint64_t)a3;
- (id)sectionForIdentifier:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableViewModelByRemovingItemsAtIndexPaths:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)indexOfIdentifier:(id)a3;
- (unint64_t)numberOfSections;
- (void)enumerateSections:(id)a3;
- (void)registerCategory:(id)a3 forReuseConfiguration:(id)a4;
- (void)setCategoryConfiguration:(id)a3;
- (void)setComparator:(id)a3;
- (void)setDefaultReuseConfiguration:(id)a3;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
- (void)setObjectsByIdentifier:(id)a3;
- (void)setOrderedIdentifiers:(id)a3;
- (void)setSection:(id)a3 forIdentifier:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation MFSearchSuggestionsTableViewModel

- (MFSearchSuggestionsTableViewModel)init
{
}

- (MFSearchSuggestionsTableViewModel)initWithSectionComparator:(id)a3 defaultReuseConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MFSearchSuggestionsTableViewModel;
  v8 = [(MFSearchSuggestionsTableViewModel *)&v16 init];
  if (v8)
  {
    id v9 = [v6 copy];
    id comparator = v8->_comparator;
    v8->_id comparator = v9;

    v11 = (MFSearchSuggestionsTableViewModelReuseConfiguration *)[v7 copy];
    defaultReuseConfiguration = v8->_defaultReuseConfiguration;
    v8->_defaultReuseConfiguration = v11;

    [(MFSearchSuggestionsTableViewModelReuseConfiguration *)v8->_defaultReuseConfiguration validate];
    v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    categoryConfiguration = v8->_categoryConfiguration;
    v8->_categoryConfiguration = v13;
  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [objc_alloc((Class)objc_opt_class()) initWithSectionComparator:self->_comparator defaultReuseConfiguration:self->_defaultReuseConfiguration];
  if (!v4) {
    __assert_rtn("-[MFSearchSuggestionsTableViewModel copyWithZone:]", "MFSearchSuggestionsTableViewModel.m", 103, "copy");
  }
  id v5 = [objc_alloc((Class)NSMutableArray) initWithArray:self->_orderedIdentifiers];
  id v6 = (void *)v4[3];
  v4[3] = v5;

  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  v8 = (void *)v4[1];
  v4[1] = v7;

  objectsByIdentifier = self->_objectsByIdentifier;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001E0AD4;
  v14[3] = &unk_10060CF70;
  v10 = v4;
  id v15 = v10;
  [(NSMutableDictionary *)objectsByIdentifier enumerateKeysAndObjectsUsingBlock:v14];
  v11 = [(MFSearchSuggestionsTableViewModel *)self categoryConfiguration];
  id v12 = [v11 mutableCopy];
  [v10 setCategoryConfiguration:v12];

  return v10;
}

- (id)objectForKeyedSubscript:(id)a3
{
  v3 = [(MFSearchSuggestionsTableViewModel *)self sectionForIdentifier:a3];

  return v3;
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
}

- (unint64_t)numberOfSections
{
  return (unint64_t)[(NSMutableArray *)self->_orderedIdentifiers count];
}

- (void)enumerateSections:(id)a3
{
  v4 = (void (**)(id, uint64_t, uint64_t, void *, char *))a3;
  char v16 = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = self->_orderedIdentifiers;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v13;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
      v11 = -[NSMutableDictionary objectForKeyedSubscript:](self->_objectsByIdentifier, "objectForKeyedSubscript:", v10, (void)v12);
      v4[2](v4, v7 + v9, v10, v11, &v16);

      if (v16) {
        break;
      }
      if (v6 == (id)++v9)
      {
        id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
        v7 += v9;
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (id)sectionAtIndex:(unint64_t)a3
{
  v4 = [(NSMutableArray *)self->_orderedIdentifiers objectAtIndexedSubscript:a3];
  id v5 = [(MFSearchSuggestionsTableViewModel *)self sectionForIdentifier:v4];

  return v5;
}

- (id)identifierAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_orderedIdentifiers objectAtIndexedSubscript:a3];
}

- (unint64_t)indexOfIdentifier:(id)a3
{
  return (unint64_t)[(NSMutableArray *)self->_orderedIdentifiers indexOfObject:a3];
}

- (id)sectionForIdentifier:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_objectsByIdentifier objectForKeyedSubscript:a3];
  v4 = +[NSArray arrayWithArray:v3];

  return v4;
}

- (void)setSection:(id)a3 forIdentifier:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  id v7 = [v14 count];
  orderedIdentifiers = self->_orderedIdentifiers;
  if (v7)
  {
    if (!orderedIdentifiers)
    {
      uint64_t v9 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      uint64_t v10 = self->_orderedIdentifiers;
      self->_orderedIdentifiers = v9;

      v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      objectsByIdentifier = self->_objectsByIdentifier;
      self->_objectsByIdentifier = v11;

      orderedIdentifiers = self->_orderedIdentifiers;
    }
    [(NSMutableArray *)orderedIdentifiers ef_insertObject:v6 usingComparator:self->_comparator allowDuplicates:0];
    long long v13 = +[NSMutableArray arrayWithArray:v14];
    [(NSMutableDictionary *)self->_objectsByIdentifier setObject:v13 forKeyedSubscript:v6];
  }
  else
  {
    [(NSMutableArray *)orderedIdentifiers ef_removeObject:v6 usingComparator:self->_comparator];
    [(NSMutableDictionary *)self->_objectsByIdentifier removeObjectForKey:v6];
  }
}

- (void)registerCategory:(id)a3 forReuseConfiguration:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  [v6 validate];
  id v7 = [(MFSearchSuggestionsTableViewModel *)self categoryConfiguration];
  [v7 setObject:v6 forKeyedSubscript:v8];
}

- (id)tableViewModelByRemovingItemsAtIndexPaths:(id)a3
{
  id v18 = a3;
  id v17 = [(MFSearchSuggestionsTableViewModel *)self copy];
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = v18;
  id v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v22;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v10 = [v9 section];
        if (v10 != (id)0x7FFFFFFFFFFFFFFFLL && v10 < [(NSMutableArray *)self->_orderedIdentifiers count])
        {
          v11 = [(MFSearchSuggestionsTableViewModel *)self identifierAtIndex:v10];
          id v12 = [v9 row];
          long long v13 = [v4 objectForKeyedSubscript:v11];
          id v14 = v13;
          if (v13)
          {
            [v13 addIndex:v12];
          }
          else
          {
            id v14 = [objc_alloc((Class)NSMutableIndexSet) initWithIndex:v12];
            [v4 setObject:v14 forKeyedSubscript:v11];
          }
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v6);
  }

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1001E1298;
  v19[3] = &unk_10060CF98;
  id v15 = v17;
  id v20 = v15;
  [v4 enumerateKeysAndObjectsUsingBlock:v19];

  return v15;
}

- (id)indexPathForSuggestion:(id)a3
{
  id v4 = a3;
  id v5 = [v4 category];
  id v6 = [(NSMutableArray *)self->_orderedIdentifiers indexOfObject:v5];
  uint64_t v7 = [(NSMutableDictionary *)self->_objectsByIdentifier objectForKeyedSubscript:v5];
  id v8 = [v7 indexOfObject:v4];

  uint64_t v9 = +[NSIndexPath indexPathForRow:v8 inSection:v6];

  return v9;
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(MFSearchSuggestionsTableViewModel *)self objectsByIdentifier];
  id v5 = +[NSString stringWithFormat:@"<%@: %p> %@", v3, self, v4];

  return (NSString *)v5;
}

- (id)_reuseConfigurationForSuggestion:(id)a3
{
  id v4 = a3;
  id v5 = [v4 category];
  id v6 = [(MFSearchSuggestionsTableViewModel *)self categoryConfiguration];
  uint64_t v7 = [v6 objectForKeyedSubscript:v5];

  if (!v7)
  {
    uint64_t v7 = [(MFSearchSuggestionsTableViewModel *)self defaultReuseConfiguration];
    if (!v7) {
      __assert_rtn("-[MFSearchSuggestionsTableViewModel _reuseConfigurationForSuggestion:]", "MFSearchSuggestionsTableViewModel.m", 226, "reuseConfiguration");
    }
  }

  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(MFSearchSuggestionsTableViewModel *)self objectAtIndexedSubscript:a4];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v4 = [(MFSearchSuggestionsTableViewModel *)self identifierAtIndex:a4];
  id v5 = [v4 displayName];

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = -[MFSearchSuggestionsTableViewModel objectAtIndexedSubscript:](self, "objectAtIndexedSubscript:", [v7 section]);
  uint64_t v9 = [v8 objectAtIndexedSubscript:[v7 row]];

  id v10 = [(MFSearchSuggestionsTableViewModel *)self _reuseConfigurationForSuggestion:v9];
  v11 = [v10 reuseIdentifier];
  id v12 = [v6 dequeueReusableCellWithIdentifier:v11 forIndexPath:v7];

  long long v13 = [v10 cellPopulator];
  ((void (**)(void, void *, id, void *))v13)[2](v13, v9, v7, v12);

  return v12;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = -[MFSearchSuggestionsTableViewModel objectAtIndexedSubscript:](self, "objectAtIndexedSubscript:", [v5 section]);
  id v7 = [v6 objectAtIndexedSubscript:[v5 row]];

  id v8 = [(MFSearchSuggestionsTableViewModel *)self _reuseConfigurationForSuggestion:v7];
  uint64_t v9 = [v8 rowHeightCalculator];
  double v10 = ((double (**)(void, void *, id))v9)[2](v9, v7, v5);

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v9 = a4;
  id v5 = -[MFSearchSuggestionsTableViewModel objectAtIndexedSubscript:](self, "objectAtIndexedSubscript:", [v9 section]);
  id v6 = [v5 objectAtIndexedSubscript:[v9 row]];

  id v7 = [(MFSearchSuggestionsTableViewModel *)self _reuseConfigurationForSuggestion:v6];
  id v8 = [v7 rowSelector];
  ((void (**)(void, void *, id))v8)[2](v8, v6, v9);
}

- (NSMutableDictionary)objectsByIdentifier
{
  return self->_objectsByIdentifier;
}

- (void)setObjectsByIdentifier:(id)a3
{
}

- (id)comparator
{
  return self->_comparator;
}

- (void)setComparator:(id)a3
{
}

- (NSMutableArray)orderedIdentifiers
{
  return self->_orderedIdentifiers;
}

- (void)setOrderedIdentifiers:(id)a3
{
}

- (MFSearchSuggestionsTableViewModelReuseConfiguration)defaultReuseConfiguration
{
  return self->_defaultReuseConfiguration;
}

- (void)setDefaultReuseConfiguration:(id)a3
{
}

- (NSMutableDictionary)categoryConfiguration
{
  return self->_categoryConfiguration;
}

- (void)setCategoryConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoryConfiguration, 0);
  objc_storeStrong((id *)&self->_defaultReuseConfiguration, 0);
  objc_storeStrong((id *)&self->_orderedIdentifiers, 0);
  objc_storeStrong(&self->_comparator, 0);

  objc_storeStrong((id *)&self->_objectsByIdentifier, 0);
}

@end