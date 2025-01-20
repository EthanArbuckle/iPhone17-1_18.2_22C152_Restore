@interface TIMailDataSource
+ (id)searchCriterionForSenderAddresses:(id)a3;
- (BOOL)isValid;
- (BOOL)search:(id)a3 didFindResults:(id)a4;
- (MSSearch)search;
- (NSArray)outgoingMessages;
- (NSCondition)cond;
- (TIMailDataSource)init;
- (TIMailDataSource)strongSelf;
- (id)nextOutgoingMessageBatch;
- (void)dealloc;
- (void)initializeSearchIfNecessary;
- (void)search:(id)a3 didFinishWithError:(id)a4;
- (void)searchAccounts:(id)a3;
- (void)searchMailWithSenderAddresses:(id)a3;
- (void)setOutgoingMessages:(id)a3;
- (void)setSearch:(id)a3;
- (void)setStrongSelf:(id)a3;
- (void)setValid:(BOOL)a3;
@end

@implementation TIMailDataSource

- (void)dealloc
{
  [(MSSearch *)self->_search cancel];
  [(MSSearch *)self->_search setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)TIMailDataSource;
  [(TIMailDataSource *)&v3 dealloc];
}

- (TIMailDataSource)init
{
  v6.receiver = self;
  v6.super_class = (Class)TIMailDataSource;
  v2 = [(TIMailDataSource *)&v6 init];
  if (v2)
  {
    objc_super v3 = (NSCondition *)objc_alloc_init((Class)NSCondition);
    cond = v2->_cond;
    v2->_cond = v3;

    v2->_valid = 1;
  }
  return v2;
}

- (void)initializeSearchIfNecessary
{
  objc_super v3 = [(TIMailDataSource *)self cond];
  [v3 lock];

  if ([(TIMailDataSource *)self isValid])
  {
    v4 = [(TIMailDataSource *)self search];

    v5 = [(TIMailDataSource *)self cond];
    [v5 unlock];

    if (!v4)
    {
      uint64_t v9 = MSAccountResultsKeyFromEmailAddresses;
      objc_super v6 = +[NSArray arrayWithObjects:&v9 count:1];
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_10000C2A0;
      v8[3] = &unk_10001CAB8;
      v8[4] = self;
      +[MSAccounts accountValuesForKeys:v6 completionBlock:v8];
    }
  }
  else
  {
    id v7 = [(TIMailDataSource *)self cond];
    [v7 unlock];
  }
}

- (void)searchAccounts:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    uint64_t v10 = MSAccountResultsKeyFromEmailAddresses;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v12 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * (void)v11), "objectForKey:", v10, (void)v13);
        if ([v12 count]) {
          [v5 addObjectsFromArray:v12];
        }

        v11 = (char *)v11 + 1;
      }
      while (v8 != v11);
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  [(TIMailDataSource *)self searchMailWithSenderAddresses:v5];
}

+ (id)searchCriterionForSenderAddresses:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v26;
    uint64_t v9 = MSCriterionTypeSender;
    uint64_t v10 = MSCriterionQualifierContains;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        id v13 = objc_alloc((Class)MSCriterion);
        id v14 = objc_msgSend(v13, "initWithType:qualifier:expression:", v9, v10, v12, (void)v25);
        [v4 addObject:v14];
      }
      id v7 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v7);
  }

  id v15 = [objc_alloc((Class)MSCriterion) initWithCriteria:v4 allRequired:0];
  long long v16 = +[NSCalendar currentCalendar];
  v17 = +[NSDate date];
  v18 = [v16 dateByAddingUnit:8 value:-9 toDate:v17 options:0];

  id v19 = objc_alloc((Class)MSCriterion);
  id v20 = [v19 initWithType:MSCriterionTypeReceivedDate qualifier:MSCriterionQualifierGreaterThan expression:v18];
  id v21 = objc_alloc((Class)MSCriterion);
  v29[0] = v15;
  v29[1] = v20;
  v22 = +[NSArray arrayWithObjects:v29 count:2];
  id v23 = [v21 initWithCriteria:v22 allRequired:1];

  return v23;
}

- (void)searchMailWithSenderAddresses:(id)a3
{
  uint64_t v10 = MSResultsKeyOutgoing;
  uint64_t v11 = MSResultsKeyDateSent;
  uint64_t v12 = MSResultsKeyRecipientTo;
  uint64_t v13 = MSResultsKeyRecipientCc;
  uint64_t v14 = _MSResultsKeyPredictiveModelSummary;
  id v4 = a3;
  id v5 = +[NSArray arrayWithObjects:&v10 count:5];
  id v6 = +[TIMailDataSource searchCriterionForSenderAddresses:](TIMailDataSource, "searchCriterionForSenderAddresses:", v4, v10, v11, v12, v13, v14);

  id v7 = +[MSSearch findMessageData:v5 matchingCriterion:v6 options:0 delegate:self];
  [(TIMailDataSource *)self setStrongSelf:self];
  uint64_t v8 = [(TIMailDataSource *)self cond];
  [v8 lock];

  [(TIMailDataSource *)self setSearch:v7];
  uint64_t v9 = [(TIMailDataSource *)self cond];
  [v9 unlock];
}

- (id)nextOutgoingMessageBatch
{
  [(TIMailDataSource *)self initializeSearchIfNecessary];
  id v3 = [(TIMailDataSource *)self cond];
  [v3 lock];
  while (1)
  {

    id v4 = [(TIMailDataSource *)self outgoingMessages];
    if (v4) {
      break;
    }
    if (![(TIMailDataSource *)self isValid]) {
      goto LABEL_6;
    }
    id v3 = [(TIMailDataSource *)self cond];
    [v3 wait];
  }

LABEL_6:
  id v5 = [(TIMailDataSource *)self outgoingMessages];
  id v6 = [v5 copy];

  [(TIMailDataSource *)self setOutgoingMessages:0];
  id v7 = [(TIMailDataSource *)self cond];
  [v7 unlock];

  return v6;
}

- (BOOL)search:(id)a3 didFindResults:(id)a4
{
  id v4 = a4;
  id v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v26;
    uint64_t v10 = MSResultsKeyOutgoing;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v13 = [v12 objectForKey:v10];
        unsigned int v14 = [v13 BOOLValue];

        if (v14)
        {
          id v15 = objc_alloc_init(TIMailOutgoingMessage);
          [(TIMailOutgoingMessage *)v15 setSearchResult:v12];
          [v5 addObject:v15];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v8);
  }

  long long v16 = [(TIMailDataSource *)self cond];
  [v16 lock];

  v17 = [(TIMailDataSource *)self outgoingMessages];
  uint64_t v18 = [v17 arrayByAddingObjectsFromArray:v5];
  id v19 = (void *)v18;
  if (v18) {
    id v20 = (id)v18;
  }
  else {
    id v20 = v5;
  }
  [(TIMailDataSource *)self setOutgoingMessages:v20];

  id v21 = [(TIMailDataSource *)self cond];
  [v21 broadcast];

  v22 = [(TIMailDataSource *)self cond];
  [v22 unlock];

  return 1;
}

- (void)search:(id)a3 didFinishWithError:(id)a4
{
  id v12 = a3;
  if (a4)
  {
    id v6 = a4;
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    NSLog(@"%@: Mail search failed with error: %@", v8, v6);
  }
  uint64_t v9 = [(TIMailDataSource *)self cond];
  [v9 lock];

  [(TIMailDataSource *)self setValid:0];
  [v12 cancel];
  [v12 setDelegate:0];
  [(TIMailDataSource *)self setStrongSelf:0];
  uint64_t v10 = [(TIMailDataSource *)self cond];
  [v10 broadcast];

  uint64_t v11 = [(TIMailDataSource *)self cond];
  [v11 unlock];
}

- (MSSearch)search
{
  return self->_search;
}

- (void)setSearch:(id)a3
{
}

- (TIMailDataSource)strongSelf
{
  return self->_strongSelf;
}

- (void)setStrongSelf:(id)a3
{
}

- (NSCondition)cond
{
  return self->_cond;
}

- (BOOL)isValid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (NSArray)outgoingMessages
{
  return self->_outgoingMessages;
}

- (void)setOutgoingMessages:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outgoingMessages, 0);
  objc_storeStrong((id *)&self->_cond, 0);
  objc_storeStrong((id *)&self->_strongSelf, 0);
  objc_storeStrong((id *)&self->_search, 0);
}

@end