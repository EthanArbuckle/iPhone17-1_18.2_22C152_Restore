@interface PDAccountManagerExportTransactionRequest
- (BOOL)coalesceWithRequest:(id)a3;
- (NSDate)statementEndDate;
- (NSDate)statementStartDate;
- (NSSet)completionHandlers;
- (NSString)accountIdentifier;
- (NSString)description;
- (NSString)fileFormat;
- (NSString)statementIdentifier;
- (NSTimeZone)productTimeZone;
- (PDAccountManagerExportTransactionRequest)initWithAccountIdentifier:(id)a3 statementIdentifier:(id)a4 type:(unint64_t)a5 trigger:(unint64_t)a6 statementStartDate:(id)a7 statementEndDate:(id)a8 fileFormat:(id)a9 productTimeZone:(id)a10;
- (id)requestIdentifier;
- (unint64_t)requestType;
- (unint64_t)trigger;
- (unint64_t)type;
- (void)addCompletion:(id)a3;
- (void)callCompletionsWithResponse:(id)a3 error:(id)a4;
@end

@implementation PDAccountManagerExportTransactionRequest

- (PDAccountManagerExportTransactionRequest)initWithAccountIdentifier:(id)a3 statementIdentifier:(id)a4 type:(unint64_t)a5 trigger:(unint64_t)a6 statementStartDate:(id)a7 statementEndDate:(id)a8 fileFormat:(id)a9 productTimeZone:(id)a10
{
  id v27 = a3;
  id v26 = a4;
  id v25 = a7;
  id v24 = a8;
  id v16 = a9;
  id v17 = a10;
  v28.receiver = self;
  v28.super_class = (Class)PDAccountManagerExportTransactionRequest;
  v18 = [(PDAccountManagerExportTransactionRequest *)&v28 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_accountIdentifier, a3);
    objc_storeStrong((id *)&v19->_statementIdentifier, a4);
    v19->_type = a5;
    v19->_trigger = a6;
    objc_storeStrong((id *)&v19->_fileFormat, a9);
    objc_storeStrong((id *)&v19->_productTimeZone, a10);
    objc_storeStrong((id *)&v19->_statementStartDate, a7);
    objc_storeStrong((id *)&v19->_statementEndDate, a8);
    v20 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    completionHandlers = v19->_completionHandlers;
    v19->_completionHandlers = v20;
  }
  return v19;
}

- (unint64_t)requestType
{
  return 12;
}

- (id)requestIdentifier
{
  v3 = sub_10048DC70([(PDAccountManagerExportTransactionRequest *)self requestType]);
  accountIdentifier = self->_accountIdentifier;
  statementIdentifier = self->_statementIdentifier;
  v6 = PKAccountWebServiceExportTransactionDataRequestTypeToString();
  v7 = +[NSString stringWithFormat:@"%@-%@-%@-%@-%@-%@-%@", v3, accountIdentifier, statementIdentifier, v6, self->_statementStartDate, self->_statementEndDate, self->_fileFormat];

  return v7;
}

- (BOOL)coalesceWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 requestType];
  if (v5 == (id)[(PDAccountManagerExportTransactionRequest *)self requestType])
  {
    v6 = [v4 requestIdentifier];
    v7 = [(PDAccountManagerExportTransactionRequest *)self requestIdentifier];
    id v8 = v6;
    id v9 = v7;
    v10 = v9;
    if (v8 == v9)
    {
      unsigned __int8 v11 = 1;
    }
    else
    {
      unsigned __int8 v11 = 0;
      if (v8 && v9) {
        unsigned __int8 v11 = [v8 isEqualToString:v9];
      }
    }
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (void)addCompletion:(id)a3
{
  if (a3)
  {
    completionHandlers = self->_completionHandlers;
    id v4 = objc_retainBlock(a3);
    [(NSMutableSet *)completionHandlers addObject:v4];
  }
}

- (void)callCompletionsWithResponse:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = self->_completionHandlers;
  id v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v13 + 1) + 8 * (void)v12) + 16))(*(void *)(*((void *)&v13 + 1) + 8 * (void)v12));
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (NSString)description
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  id v4 = sub_10048DC70([(PDAccountManagerExportTransactionRequest *)self requestType]);
  [v3 appendFormat:@"requestType: '%@'; ", v4];

  id v5 = [(PDAccountManagerExportTransactionRequest *)self requestIdentifier];
  [v3 appendFormat:@"requestIdentifier: '%@'; ", v5];

  [v3 appendFormat:@"accountIdentifier: '%@'; ", self->_accountIdentifier];
  [v3 appendFormat:@"statementIdentifier: '%@'; ", self->_statementIdentifier];
  id v6 = PKAccountWebServiceExportTransactionDataRequestTypeToString();
  [v3 appendFormat:@"type: '%@'; ", v6];

  id v7 = PKAccountWebServiceTransactionDataTriggerToString();
  [v3 appendFormat:@"trigger: '%@'; ", v7];

  [v3 appendFormat:@"statementStartDate: '%@'; ", self->_statementStartDate];
  [v3 appendFormat:@"statementEndDate: '%@'; ", self->_statementEndDate];
  [v3 appendFormat:@"fileFormat: '%@'; ", self->_fileFormat];
  [v3 appendFormat:@">"];
  return (NSString *)v3;
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)trigger
{
  return self->_trigger;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (NSString)statementIdentifier
{
  return self->_statementIdentifier;
}

- (NSString)fileFormat
{
  return self->_fileFormat;
}

- (NSTimeZone)productTimeZone
{
  return self->_productTimeZone;
}

- (NSDate)statementStartDate
{
  return self->_statementStartDate;
}

- (NSDate)statementEndDate
{
  return self->_statementEndDate;
}

- (NSSet)completionHandlers
{
  return &self->_completionHandlers->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statementEndDate, 0);
  objc_storeStrong((id *)&self->_statementStartDate, 0);
  objc_storeStrong((id *)&self->_productTimeZone, 0);
  objc_storeStrong((id *)&self->_fileFormat, 0);
  objc_storeStrong((id *)&self->_statementIdentifier, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
}

@end