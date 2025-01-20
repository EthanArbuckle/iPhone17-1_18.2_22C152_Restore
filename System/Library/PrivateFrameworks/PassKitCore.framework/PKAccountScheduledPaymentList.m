@interface PKAccountScheduledPaymentList
+ (BOOL)supportsSecureCoding;
- (NSArray)scheduledPayments;
- (PKAccountScheduledPaymentList)init;
- (PKAccountScheduledPaymentList)initWithCoder:(id)a3;
- (PKAccountScheduledPaymentList)initWithScheduledPayment:(id)a3;
- (id)jsonArrayRepresentationWithCertificatesResponse:(id)a3;
- (id)scheduledPaymentOfFundingSourceType:(int64_t)a3;
- (void)addScheduledPayment:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKAccountScheduledPaymentList

- (PKAccountScheduledPaymentList)init
{
  return [(PKAccountScheduledPaymentList *)self initWithScheduledPayment:0];
}

- (PKAccountScheduledPaymentList)initWithScheduledPayment:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKAccountScheduledPaymentList;
  v5 = [(PKAccountScheduledPaymentList *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    scheduledPayments = v5->_scheduledPayments;
    v5->_scheduledPayments = (NSMutableArray *)v6;

    [(NSMutableArray *)v5->_scheduledPayments safelyAddObject:v4];
  }

  return v5;
}

- (NSArray)scheduledPayments
{
  v2 = (void *)[(NSMutableArray *)self->_scheduledPayments copy];
  return (NSArray *)v2;
}

- (void)addScheduledPayment:(id)a3
{
}

- (id)jsonArrayRepresentationWithCertificatesResponse:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = self->_scheduledPayments;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "jsonDictionaryRepresentationWithCertificatesResponse:", v4, (void)v14);
        [v5 safelyAddObject:v11];
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  v12 = (void *)[v5 copy];
  return v12;
}

- (id)scheduledPaymentOfFundingSourceType:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = self->_scheduledPayments;
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
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "fundingSource", (void)v14);
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

- (PKAccountScheduledPaymentList)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKAccountScheduledPaymentList;
  uint64_t v5 = [(PKAccountScheduledPaymentList *)&v11 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    id v9 = (id)[v4 decodeObjectOfClasses:v8 forKey:@"scheduledPayments"];
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