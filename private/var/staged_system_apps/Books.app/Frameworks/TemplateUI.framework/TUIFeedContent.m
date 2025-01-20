@interface TUIFeedContent
+ (TUIFeedContent)feedContentWithEntries:(id)a3 stackName:(id)a4;
+ (TUIFeedContent)feedContentWithEntries:(id)a3 stackName:(id)a4 initialContentReadyEntryIndex:(unint64_t)a5;
+ (id)feedContentFromDictionaries:(id)a3 stackName:(id)a4;
+ (id)feedContentFromDictionaries:(id)a3 stackName:(id)a4 initialContentReadyEntryIndex:(unint64_t)a5;
- (NSMutableArray)entries;
- (NSMutableSet)stackNames;
- (TUIFeedContent)initWithDictionaries:(id)a3 stackName:(id)a4 initialContentReadyEntryIndex:(unint64_t)a5;
- (TUIFeedContent)initWithStackName:(id)a3 initialContentReadyEntryIndex:(unint64_t)a4;
- (TUIMutableDynamicValue)currentStackName;
- (id)description;
- (unint64_t)initialContentReadyEntryIndex;
- (void)setEntries:(id)a3;
- (void)setStackNames:(id)a3;
@end

@implementation TUIFeedContent

+ (id)feedContentFromDictionaries:(id)a3 stackName:(id)a4
{
  return +[TUIFeedContent feedContentFromDictionaries:a3 stackName:a4 initialContentReadyEntryIndex:0x7FFFFFFFFFFFFFFFLL];
}

+ (id)feedContentFromDictionaries:(id)a3 stackName:(id)a4 initialContentReadyEntryIndex:(unint64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = [[TUIFeedContent alloc] initWithDictionaries:v8 stackName:v7 initialContentReadyEntryIndex:a5];

  return v9;
}

+ (TUIFeedContent)feedContentWithEntries:(id)a3 stackName:(id)a4
{
  return +[TUIFeedContent feedContentWithEntries:a3 stackName:a4 initialContentReadyEntryIndex:0x7FFFFFFFFFFFFFFFLL];
}

+ (TUIFeedContent)feedContentWithEntries:(id)a3 stackName:(id)a4 initialContentReadyEntryIndex:(unint64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = [[TUIFeedContent alloc] initWithStackName:v7 initialContentReadyEntryIndex:a5];

  id v10 = [v8 mutableCopy];
  [(TUIFeedContent *)v9 setEntries:v10];

  return v9;
}

- (TUIFeedContent)initWithStackName:(id)a3 initialContentReadyEntryIndex:(unint64_t)a4
{
  id v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TUIFeedContent;
  id v8 = [(TUIFeedContent *)&v16 init];
  v9 = v8;
  if (v8)
  {
    p_currentStackName = (void **)&v8->_currentStackName;
    objc_storeStrong((id *)&v8->_currentStackName, a3);
    if (!v9->_currentStackName)
    {
      v11 = [(TUIDynamicValue *)[TUIMutableDynamicValue alloc] initWithValue:@"default"];
      v12 = *p_currentStackName;
      *p_currentStackName = v11;
    }
    uint64_t v13 = objc_opt_new();
    stackNames = v9->_stackNames;
    v9->_stackNames = (NSMutableSet *)v13;

    v9->_initialContentReadyEntryIndex = a4;
  }

  return v9;
}

- (TUIFeedContent)initWithDictionaries:(id)a3 stackName:(id)a4 initialContentReadyEntryIndex:(unint64_t)a5
{
  id v8 = a3;
  v9 = [(TUIFeedContent *)self initWithStackName:a4 initialContentReadyEntryIndex:a5];
  if (v9)
  {
    uint64_t v10 = objc_opt_new();
    entries = v9->_entries;
    v9->_entries = (NSMutableArray *)v10;

    v12 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v8 count]);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v13 = v8;
    id v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v21;
      do
      {
        v17 = 0;
        do
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = +[TUIFeedEntry feedEntryFromDictionary:](TUIFeedEntry, "feedEntryFromDictionary:", *(void *)(*((void *)&v20 + 1) + 8 * (void)v17), (void)v20);
          if (v18) {
            [v12 addObject:v18];
          }

          v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        id v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v15);
    }

    [(TUIFeedContent *)v9 setEntries:v12];
  }

  return v9;
}

- (NSMutableArray)entries
{
  id v2 = [(NSMutableArray *)self->_entries copy];

  return (NSMutableArray *)v2;
}

- (void)setEntries:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_entries, a3);
  [(NSMutableSet *)self->_stackNames removeAllObjects];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        stackNames = self->_stackNames;
        v12 = [*(id *)(*((void *)&v13 + 1) + 8 * (void)v10) stackNames:(void)v13];
        [(NSMutableSet *)stackNames unionSet:v12];

        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  id v5 = [(TUIFeedContent *)self entries];
  id v6 = [v5 valueForKey:@"description"];
  id v7 = [v6 componentsJoinedByString:@",\n\t"];
  id v8 = +[NSString stringWithFormat:@"<%@: %p> (\n\t%@\n)", v4, self, v7];

  return v8;
}

- (NSMutableSet)stackNames
{
  return self->_stackNames;
}

- (void)setStackNames:(id)a3
{
}

- (TUIMutableDynamicValue)currentStackName
{
  return self->_currentStackName;
}

- (unint64_t)initialContentReadyEntryIndex
{
  return self->_initialContentReadyEntryIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentStackName, 0);
  objc_storeStrong((id *)&self->_stackNames, 0);

  objc_storeStrong((id *)&self->_entries, 0);
}

@end