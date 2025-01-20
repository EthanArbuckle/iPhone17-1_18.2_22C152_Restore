@interface STUIAskForTimeRequestResponse
- (NSNumber)requestingUserDSID;
- (NSString)budgetedIdentifier;
- (NSString)identifier;
- (STUIAskForTimeRequestResponse)init;
- (STUIAskForTimeRequestResponse)initWithRequestResponse:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)usageType;
- (void)setBudgetedIdentifier:(id)a3;
- (void)setRequestingUserDSID:(id)a3;
- (void)setUsageType:(unint64_t)a3;
@end

@implementation STUIAskForTimeRequestResponse

- (STUIAskForTimeRequestResponse)init
{
  return [(STUIAskForTimeRequestResponse *)self initWithRequestResponse:0];
}

- (STUIAskForTimeRequestResponse)initWithRequestResponse:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)STUIAskForTimeRequestResponse;
  v5 = [(STUIAskForTimeRequestResponse *)&v18 init];
  v6 = v5;
  if (v4 && v5)
  {
    uint64_t v7 = [v4 usageType];
    if (v7 == 2)
    {
      v6->_usageType = 1;
      uint64_t v8 = [v4 requestedCategoryIdentifier];
    }
    else if (v7 == 1)
    {
      v6->_usageType = 2;
      uint64_t v8 = [v4 requestedWebDomain];
    }
    else
    {
      if (v7)
      {
LABEL_10:
        v10 = [v4 identifier];
        v11 = [v10 UUIDString];
        uint64_t v12 = [v11 copy];
        identifier = v6->_identifier;
        v6->_identifier = (NSString *)v12;

        v14 = [v4 requestingUser];
        uint64_t v15 = [v14 dsid];
        requestingUserDSID = v6->_requestingUserDSID;
        v6->_requestingUserDSID = (NSNumber *)v15;

        goto LABEL_11;
      }
      v6->_usageType = 0;
      uint64_t v8 = [v4 requestedApplicationBundleIdentifier];
    }
    budgetedIdentifier = v6->_budgetedIdentifier;
    v6->_budgetedIdentifier = (NSString *)v8;

    goto LABEL_10;
  }
LABEL_11:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(void *)(v4 + 8) = self->_usageType;
  uint64_t v5 = [(NSString *)self->_identifier copy];
  v6 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = v5;

  uint64_t v7 = [(NSString *)self->_budgetedIdentifier copy];
  uint64_t v8 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v7;

  objc_storeStrong((id *)(v4 + 32), self->_requestingUserDSID);
  return (id)v4;
}

- (unint64_t)usageType
{
  return self->_usageType;
}

- (void)setUsageType:(unint64_t)a3
{
  self->_usageType = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)budgetedIdentifier
{
  return self->_budgetedIdentifier;
}

- (void)setBudgetedIdentifier:(id)a3
{
}

- (NSNumber)requestingUserDSID
{
  return self->_requestingUserDSID;
}

- (void)setRequestingUserDSID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestingUserDSID, 0);
  objc_storeStrong((id *)&self->_budgetedIdentifier, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end