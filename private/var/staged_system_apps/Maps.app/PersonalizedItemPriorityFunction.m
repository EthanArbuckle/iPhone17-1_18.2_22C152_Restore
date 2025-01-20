@interface PersonalizedItemPriorityFunction
+ (id)defaultPriorityFunction;
+ (id)defaultPriorityFunctionForAutocomplete;
+ (id)defaultPriorityFunctionForAutocompleteObject;
+ (id)defaultPriorityFunctionForCompoundItemResolution;
+ (id)priorityFunctionForGEOSortPriorityMapping:(id)a3;
+ (int64_t)sourceSubtypeForGEOResultSubtype:(int64_t)a3;
+ (int64_t)sourceTypeForGEOResultType:(int64_t)a3;
- (NSArray)entries;
- (PersonalizedItemPriorityFunction)initWithEntries:(id)a3;
- (int64_t)priorityForPersonalizedAutocompleteItem:(id)a3;
@end

@implementation PersonalizedItemPriorityFunction

- (PersonalizedItemPriorityFunction)initWithEntries:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PersonalizedItemPriorityFunction;
  v5 = [(PersonalizedItemPriorityFunction *)&v9 init];
  if (v5)
  {
    v6 = (NSArray *)[v4 copy];
    entries = v5->_entries;
    v5->_entries = v6;
  }
  return v5;
}

+ (id)defaultPriorityFunction
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007C78C;
  block[3] = &unk_1012E63F0;
  block[4] = a1;
  if (qword_10160EB10 != -1) {
    dispatch_once(&qword_10160EB10, block);
  }
  if (qword_10160EB18) {
    v2 = (void *)qword_10160EB18;
  }
  else {
    v2 = (void *)qword_10160EB20;
  }

  return v2;
}

+ (id)defaultPriorityFunctionForCompoundItemResolution
{
  return _[a1 defaultPriorityFunction];
}

- (int64_t)priorityForPersonalizedAutocompleteItem:(id)a3
{
  id v4 = a3;
  if ([v4 hasPriorityOverride])
  {
    id v5 = [v4 priorityOverride];
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v6 = [(PersonalizedItemPriorityFunction *)self entries];
    id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v14;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if ([v11 matches:v4])
          {
            id v5 = [v11 priority];

            goto LABEL_13;
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    id v5 = 0;
  }
LABEL_13:

  return (int64_t)v5;
}

+ (id)priorityFunctionForGEOSortPriorityMapping:(id)a3
{
  id v4 = a3;
  long long v15 = +[NSMutableArray array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v13 = v4;
  id obj = [v4 entries];
  id v5 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v10 = -[PersonalizedItemPriorityFunctionEntry initWithPriority:matchesAnySourceType:sourceType:matchesAnySourceSubtype:sourceSubtype:matchBlock:]([PersonalizedItemPriorityFunctionEntry alloc], "initWithPriority:matchesAnySourceType:sourceType:matchesAnySourceSubtype:sourceSubtype:matchBlock:", [v9 priority], objc_msgSend(v9, "resultType") == (id)1, objc_msgSend(a1, "sourceTypeForGEOResultType:", objc_msgSend(v9, "resultType")), objc_msgSend(v9, "resultSubtype") == (id)1, objc_msgSend(a1, "sourceSubtypeForGEOResultSubtype:", objc_msgSend(v9, "resultSubtype")), 0);
        [v15 addObject:v10];
      }
      id v6 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  v11 = [[PersonalizedItemPriorityFunction alloc] initWithEntries:v15];

  return v11;
}

+ (int64_t)sourceTypeForGEOResultType:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) >= 9) {
    return 0;
  }
  else {
    return a3 - 1;
  }
}

+ (int64_t)sourceSubtypeForGEOResultSubtype:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) >= 0x1E) {
    return 0;
  }
  else {
    return a3 - 1;
  }
}

+ (id)defaultPriorityFunctionForAutocomplete
{
  return _[a1 defaultPriorityFunction];
}

+ (id)defaultPriorityFunctionForAutocompleteObject
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003D9F54;
  block[3] = &unk_1012E63F0;
  block[4] = a1;
  if (qword_10160EB28 != -1) {
    dispatch_once(&qword_10160EB28, block);
  }
  v2 = (void *)qword_10160EB30;

  return v2;
}

- (NSArray)entries
{
  return self->_entries;
}

- (void).cxx_destruct
{
}

@end