@interface STStatusServerTransactionManager
- (STLocalStatusServer)server;
- (STStatusServerTransactionManager)initWithServer:(id)a3;
- (void)systemStatusServer:(id)a3 publishedDomainsDidChange:(id)a4;
@end

@implementation STStatusServerTransactionManager

- (void)systemStatusServer:(id)a3 publishedDomainsDidChange:(id)a4
{
  id v5 = a4;
  if (self) {
    transactionsByDomain = self->_transactionsByDomain;
  }
  else {
    transactionsByDomain = 0;
  }
  v7 = transactionsByDomain;
  v8 = [(BSMutableIntegerMap *)v7 allKeys];
  v9 = sub_100002868(v8);

  v30 = v5;
  v10 = sub_100002868(v5);
  id v11 = [v9 mutableCopy];
  [v11 minusSet:v10];
  v28 = v10;
  id v12 = [v10 mutableCopy];
  v29 = v9;
  [v12 minusSet:v9];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v13 = v11;
  id v14 = [v13 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v36;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v36 != v16) {
          objc_enumerationMutation(v13);
        }
        -[BSMutableIntegerMap removeObjectForKey:](v7, "removeObjectForKey:", [*(id *)(*((void *)&v35 + 1) + 8 * i) integerValue]);
      }
      id v15 = [v13 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v15);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v18 = v12;
  id v19 = [v18 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v32;
    do
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(void *)v32 != v21) {
          objc_enumerationMutation(v18);
        }
        id v23 = [*(id *)(*((void *)&v31 + 1) + 8 * (void)j) integerValue];
        v24 = STSystemStatusDescriptionForDomain();
        v25 = +[NSString stringWithFormat:@"publishing %@ data", v24];

        id v26 = v25;
        [v26 UTF8String];
        v27 = (void *)os_transaction_create();
        [(BSMutableIntegerMap *)v7 setObject:v27 forKey:v23];
      }
      id v20 = [v18 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v20);
  }
}

- (STStatusServerTransactionManager)initWithServer:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STStatusServerTransactionManager;
  v6 = [(STStatusServerTransactionManager *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_server, a3);
    [v5 setDelegate:v7];
    v8 = (BSMutableIntegerMap *)objc_alloc_init((Class)BSMutableIntegerMap);
    transactionsByDomain = v7->_transactionsByDomain;
    v7->_transactionsByDomain = v8;
  }
  return v7;
}

- (STLocalStatusServer)server
{
  return self->_server;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionsByDomain, 0);
  objc_storeStrong((id *)&self->_server, 0);
}

@end