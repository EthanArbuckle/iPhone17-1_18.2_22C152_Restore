@interface EPDynamicTransactionListContainer
+ (BOOL)supportsSecureCoding;
- (EPDynamicTransactionContainer)current;
- (EPDynamicTransactionListContainer)init;
- (EPDynamicTransactionListContainer)initWithCoder:(id)a3;
- (NSMutableSet)transactions;
- (void)encodeWithCoder:(id)a3;
- (void)setCurrent:(id)a3;
- (void)setTransactions:(id)a3;
@end

@implementation EPDynamicTransactionListContainer

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableSet set];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v6 = self->_transactions;
  id v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v12 = [v11 routingSlip:v14];
        unsigned int v13 = [v12 persistWhilePending];

        if (v13) {
          [v5 addObject:v11];
        }
      }
      id v8 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  [v4 encodeObject:v5 forKey:@"transactions"];
  [v4 encodeObject:self->_current forKey:@"current"];
}

- (EPDynamicTransactionListContainer)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(EPDynamicTransactionListContainer *)self init];
  if (v5)
  {
    v12[0] = objc_opt_class();
    v12[1] = objc_opt_class();
    v6 = +[NSArray arrayWithObjects:v12 count:2];
    id v7 = +[NSSet setWithArray:v6];
    id v8 = [v4 decodeObjectOfClasses:v7 forKey:@"transactions"];

    if (v8) {
      objc_storeStrong((id *)&v5->_transactions, v8);
    }
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"current"];
    current = v5->_current;
    v5->_current = (EPDynamicTransactionContainer *)v9;
  }
  return v5;
}

- (EPDynamicTransactionListContainer)init
{
  v6.receiver = self;
  v6.super_class = (Class)EPDynamicTransactionListContainer;
  v2 = [(EPDynamicTransactionListContainer *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableSet set];
    transactions = v2->_transactions;
    v2->_transactions = (NSMutableSet *)v3;
  }
  return v2;
}

- (NSMutableSet)transactions
{
  return self->_transactions;
}

- (void)setTransactions:(id)a3
{
}

- (EPDynamicTransactionContainer)current
{
  return self->_current;
}

- (void)setCurrent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_current, 0);

  objc_storeStrong((id *)&self->_transactions, 0);
}

@end