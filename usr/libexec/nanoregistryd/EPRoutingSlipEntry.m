@interface EPRoutingSlipEntry
+ (BOOL)supportsSecureCoding;
- (BOOL)canceled;
- (BOOL)notUnrollable;
- (BOOL)persistWhilePending;
- (BOOL)resumeEnabled;
- (BOOL)transactionBeganWithThisNR;
- (Class)transactionClass;
- (EPRoutingSlip)routingSlip;
- (EPRoutingSlipEntry)init;
- (EPRoutingSlipEntry)initWithCoder:(id)a3;
- (EPRoutingSlipEntry)initWithName:(id)a3 transactionClass:(Class)a4 operands:(id)a5;
- (NSError)routingSlipError;
- (NSMutableArray)errors;
- (NSMutableDictionary)operands;
- (NSString)identifier;
- (NSString)name;
- (NSString)printableName;
- (OS_dispatch_queue)queue;
- (id)description;
- (id)newTransaction;
- (id)objectForKeyedSubscript:(id)a3;
- (id)shortDescription;
- (id)transactionClasses;
- (void)encodeWithCoder:(id)a3;
- (void)persist;
- (void)setCanceled:(BOOL)a3;
- (void)setOperands:(id)a3;
- (void)setRoutingSlip:(id)a3;
- (void)setTransactionBeganWithThisNR:(BOOL)a3;
@end

@implementation EPRoutingSlipEntry

- (NSString)printableName
{
  v3 = NSStringFromClass(self->_transactionClass);
  v4 = +[NSString stringWithFormat:@"%@[\"%@\"]", v3, self->_name];

  return (NSString *)v4;
}

- (EPRoutingSlipEntry)init
{
  v8.receiver = self;
  v8.super_class = (Class)EPRoutingSlipEntry;
  v2 = [(EPRoutingSlipEntry *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    operands = v2->_operands;
    v2->_operands = (NSMutableDictionary *)v3;

    uint64_t v5 = +[NSMutableArray array];
    errors = v2->_errors;
    v2->_errors = (NSMutableArray *)v5;
  }
  return v2;
}

- (EPRoutingSlipEntry)initWithName:(id)a3 transactionClass:(Class)a4 operands:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v11 = [(EPRoutingSlipEntry *)self init];
  if (v11)
  {
    v12 = +[NSUUID UUID];
    uint64_t v13 = [v12 UUIDString];
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v13;

    objc_storeStrong((id *)&v11->_name, a3);
    objc_storeStrong((id *)&v11->_transactionClass, a4);
    v15 = (NSMutableDictionary *)[v10 mutableCopy];
    operands = v11->_operands;
    v11->_operands = v15;
  }
  return v11;
}

- (void)setRoutingSlip:(id)a3
{
  p_routingSlip = &self->_routingSlip;
  objc_storeWeak((id *)&self->_routingSlip, a3);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [(NSMutableDictionary *)self->_operands allValues];
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v9);
        id WeakRetained = objc_loadWeakRetained((id *)p_routingSlip);
        [v10 setRoutingSlip:WeakRetained];

        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (NSError)routingSlipError
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routingSlip);
  uint64_t v3 = [WeakRetained getLastFirstError];

  return (NSError *)v3;
}

- (OS_dispatch_queue)queue
{
  v2 = +[NRQueue registryDaemonQueue];
  uint64_t v3 = [v2 queue];

  return (OS_dispatch_queue *)v3;
}

- (BOOL)notUnrollable
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routingSlip);
  unsigned __int8 v3 = [WeakRetained notUnrollable];

  return v3;
}

- (BOOL)persistWhilePending
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routingSlip);
  unsigned __int8 v3 = [WeakRetained persistWhilePending];

  return v3;
}

- (BOOL)resumeEnabled
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routingSlip);
  unsigned __int8 v3 = [WeakRetained resumeEnabled];

  return v3;
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(EPRoutingSlipEntry *)self operands];
  id v6 = [v5 objectForKeyedSubscript:v4];

  id v7 = [v6 value];

  return v7;
}

- (id)transactionClasses
{
  if (qword_1001A14D8 != -1) {
    dispatch_once(&qword_1001A14D8, &stru_100169E80);
  }
  v2 = (void *)qword_1001A14D0;

  return v2;
}

- (id)newTransaction
{
  v2 = [(EPRoutingSlipEntry *)self transactionClass];

  return objc_alloc_init(v2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EPRoutingSlipEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(EPRoutingSlipEntry *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    if (!v5->_identifier)
    {
      uint64_t v8 = +[NSUUID UUID];
      uint64_t v9 = [v8 UUIDString];
      id v10 = v5->_identifier;
      v5->_identifier = (NSString *)v9;
    }
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v11;

    v28[0] = objc_opt_class();
    v28[1] = objc_opt_class();
    long long v13 = +[NSArray arrayWithObjects:v28 count:2];
    long long v14 = +[NSSet setWithArray:v13];
    long long v15 = sub_1000E20EC();
    v16 = [v14 setByAddingObjectsFromSet:v15];
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"operands"];
    operands = v5->_operands;
    v5->_operands = (NSMutableDictionary *)v17;

    v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionClassName"];
    uint64_t v20 = NSClassFromString(v19);
    Class transactionClass = v5->_transactionClass;
    v5->_Class transactionClass = (Class)v20;

    v27[0] = objc_opt_class();
    v27[1] = objc_opt_class();
    v22 = +[NSArray arrayWithObjects:v27 count:2];
    v23 = +[NSSet setWithArray:v22];
    uint64_t v24 = [v4 decodeObjectOfClasses:v23 forKey:@"errors"];
    errors = v5->_errors;
    v5->_errors = (NSMutableArray *)v24;

    v5->_canceled = [v4 decodeBoolForKey:@"canceled"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_identifier forKey:@"identifier"];
  [v4 encodeObject:self->_name forKey:@"name"];
  [v4 encodeObject:self->_operands forKey:@"operands"];
  uint64_t v5 = NSStringFromClass(self->_transactionClass);
  [v4 encodeObject:v5 forKey:@"transactionClassName"];

  if (self->_errors)
  {
    uint64_t v6 = +[NSMutableArray array];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = self->_errors;
    id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = [*(id *)(*((void *)&v13 + 1) + 8 * (void)v11) nr_filteredError:v13];
          [v6 addObject:v12];

          uint64_t v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  [v4 encodeObject:v6 forKey:@"errors"];
  [v4 encodeBool:self->_canceled forKey:@"canceled"];
}

- (id)description
{
  unsigned __int8 v3 = [(EPRoutingSlipEntry *)self shortDescription];
  id v4 = [(NSMutableDictionary *)self->_operands joinedDescription];
  uint64_t v5 = [(NSMutableArray *)self->_errors joinedDescription];
  uint64_t v6 = +[NSString stringWithFormat:@"%@(%@)\n%@", v3, v4, v5];

  return v6;
}

- (id)shortDescription
{
  unsigned __int8 v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  identifier = self->_identifier;
  uint64_t v6 = [(EPRoutingSlipEntry *)self printableName];
  id v7 = +[NSString stringWithFormat:@"%@[%@]: %@", v4, identifier, v6];

  return v7;
}

- (void)persist
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routingSlip);
  [WeakRetained persist];
}

- (EPRoutingSlip)routingSlip
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routingSlip);

  return (EPRoutingSlip *)WeakRetained;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSMutableDictionary)operands
{
  return self->_operands;
}

- (void)setOperands:(id)a3
{
}

- (Class)transactionClass
{
  return self->_transactionClass;
}

- (NSMutableArray)errors
{
  return self->_errors;
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (BOOL)transactionBeganWithThisNR
{
  return self->_transactionBeganWithThisNR;
}

- (void)setTransactionBeganWithThisNR:(BOOL)a3
{
  self->_transactionBeganWithThisNR = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_transactionClass, 0);
  objc_storeStrong((id *)&self->_operands, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_destroyWeak((id *)&self->_routingSlip);
}

@end