@interface AndConversationFilter
- (AndConversationFilter)initWithFilters:(id)a3;
- (BOOL)matches:(id)a3;
- (NSArray)filters;
@end

@implementation AndConversationFilter

- (AndConversationFilter)initWithFilters:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AndConversationFilter;
  v6 = [(AndConversationFilter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_filters, a3);
  }

  return v7;
}

- (BOOL)matches:(id)a3
{
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(AndConversationFilter *)self filters];
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (![*(id *)(*((void *)&v12 + 1) + 8 * i) matches:v4])
        {
          BOOL v10 = 0;
          goto LABEL_11;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 1;
LABEL_11:

  return v10;
}

- (NSArray)filters
{
  return self->_filters;
}

- (void).cxx_destruct
{
}

@end