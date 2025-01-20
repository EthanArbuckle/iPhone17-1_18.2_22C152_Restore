@interface RMManagementPayload
- (BOOL)_loadAnyDeclaration:(id)a3 error:(id *)a4;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)reloadReturningError:(id *)a3;
- (void)failedLoadingWithError:(id)a3;
@end

@implementation RMManagementPayload

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned __int8 v7 = [(RMManagementPayload *)self _loadAnyDeclaration:v6 error:a4];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v6;
      id v19 = 0;
      v9 = [v8 serializeAsDataWithType:0 error:&v19];
      id v10 = v19;
      v11 = v10;
      unsigned __int8 v7 = v9 != 0;
      if (v9)
      {
        [(RMManagementPayload *)self setPayload:v9];
        v12 = [v8 declarationType];
        [(RMManagementPayload *)self setDeclarationType:v12];

        v13 = [(RMManagementPayload *)self serverToken];
        v14 = [v8 declarationServerToken];
        if (v13 != v14 && ([v13 isEqualToString:v14] & 1) == 0) {
          [(RMManagementPayload *)self setServerToken:v14];
        }
        [(RMManagementPayload *)self setLoadState:1];
      }
      else
      {
        if (a4 && v10) {
          *a4 = v10;
        }
        [(RMManagementPayload *)self failedLoadingWithError:v11];
      }
    }
    else
    {
      v15 = +[RMModelManagementBase rm_payloadTypeName];
      v16 = objc_msgSend((id)objc_opt_class(), "rm_payloadTypeName");
      v17 = +[RMErrorUtilities createIncorrectPayloadTypeErrorWithExpectedType:v15 actualType:v16];

      if (a4 && v17) {
        *a4 = v17;
      }
      [(RMManagementPayload *)self failedLoadingWithError:v17];

      unsigned __int8 v7 = 0;
    }
  }

  return v7;
}

- (BOOL)reloadReturningError:(id *)a3
{
  v5 = [(RMManagementPayload *)self payload];
  id v13 = 0;
  id v6 = +[RMModelDeclarationBase loadData:v5 serializationType:0 error:&v13];
  id v7 = v13;

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v8 = 1;
      [(RMManagementPayload *)self setLoadState:1];
    }
    else
    {
      v9 = +[RMModelManagementBase rm_payloadTypeName];
      id v10 = objc_msgSend((id)objc_opt_class(), "rm_payloadTypeName");
      v11 = +[RMErrorUtilities createIncorrectPayloadTypeErrorWithExpectedType:v9 actualType:v10];

      if (a3 && v11) {
        *a3 = v11;
      }
      [(RMManagementPayload *)self failedLoadingWithError:v11];

      BOOL v8 = 0;
    }
  }

  return v8;
}

- (BOOL)_loadAnyDeclaration:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v14 = 0;
  id v7 = [v6 serializeAsDataWithType:0 error:&v14];
  id v8 = v14;
  v9 = v8;
  if (v7)
  {
    [(RMManagementPayload *)self setPayload:v7];
    id v10 = [v6 declarationType];
    [(RMManagementPayload *)self setDeclarationType:v10];

    v11 = [(RMManagementPayload *)self serverToken];
    v12 = [v6 declarationServerToken];
    if (v11 != v12 && ([v11 isEqualToString:v12] & 1) == 0) {
      [(RMManagementPayload *)self setServerToken:v12];
    }
    [(RMManagementPayload *)self setLoadState:4];
  }
  else
  {
    if (a4 && v8) {
      *a4 = v8;
    }
    [(RMManagementPayload *)self failedLoadingWithError:v9];
  }

  return v7 != 0;
}

- (void)failedLoadingWithError:(id)a3
{
}

@end