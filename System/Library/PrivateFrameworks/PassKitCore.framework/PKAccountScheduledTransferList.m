@interface PKAccountScheduledTransferList
+ (BOOL)supportsSecureCoding;
- (NSArray)scheduledTransfers;
- (PKAccountScheduledTransferList)init;
- (PKAccountScheduledTransferList)initWithCoder:(id)a3;
- (PKAccountScheduledTransferList)initWithScheduledTransfer:(id)a3;
- (id)jsonArrayRepresentation;
- (id)scheduledTransferOfFundingSourceType:(int64_t)a3;
- (void)addScheduledTransfer:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKAccountScheduledTransferList

- (PKAccountScheduledTransferList)init
{
  return [(PKAccountScheduledTransferList *)self initWithScheduledTransfer:0];
}

- (PKAccountScheduledTransferList)initWithScheduledTransfer:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKAccountScheduledTransferList;
  v5 = [(PKAccountScheduledTransferList *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    scheduledTransfers = v5->_scheduledTransfers;
    v5->_scheduledTransfers = (NSMutableArray *)v6;

    [(NSMutableArray *)v5->_scheduledTransfers safelyAddObject:v4];
  }

  return v5;
}

- (NSArray)scheduledTransfers
{
  v2 = (void *)[(NSMutableArray *)self->_scheduledTransfers copy];
  return (NSArray *)v2;
}

- (void)addScheduledTransfer:(id)a3
{
}

- (id)jsonArrayRepresentation
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_scheduledTransfers;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_super v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "jsonDictionaryRepresentation", (void)v12);
        [v3 safelyAddObject:v9];
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  v10 = (void *)[v3 copy];
  return v10;
}

- (id)scheduledTransferOfFundingSourceType:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = self->_scheduledTransfers;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_super v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "externalAccount", (void)v14);
        uint64_t v11 = [v10 type];

        if (v11 == a3)
        {
          id v12 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v12 = 0;
LABEL_11:

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountScheduledTransferList)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKAccountScheduledTransferList;
  uint64_t v5 = [(PKAccountScheduledTransferList *)&v11 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    id v9 = (id)[v4 decodeObjectOfClasses:v8 forKey:@"scheduledTransfers"];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (void).cxx_destruct
{
}

@end