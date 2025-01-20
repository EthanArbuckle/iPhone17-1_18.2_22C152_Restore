@interface ICASCloudOperationData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASCloudOperationData)initWithOperationID:(id)a3 operationType:(id)a4 operationGroupName:(id)a5;
- (ICASOperationType)operationType;
- (NSString)operationGroupName;
- (NSString)operationID;
- (id)toDict;
@end

@implementation ICASCloudOperationData

- (ICASCloudOperationData)initWithOperationID:(id)a3 operationType:(id)a4 operationGroupName:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ICASCloudOperationData;
  v12 = [(ICASCloudOperationData *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_operationID, a3);
    objc_storeStrong((id *)&v13->_operationType, a4);
    objc_storeStrong((id *)&v13->_operationGroupName, a5);
  }

  return v13;
}

+ (NSString)dataName
{
  return (NSString *)@"CloudOperationData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v15[3] = *MEMORY[0x1E4F143B8];
  v14[0] = @"operationID";
  v3 = [(ICASCloudOperationData *)self operationID];
  if (v3)
  {
    uint64_t v4 = [(ICASCloudOperationData *)self operationID];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v15[0] = v4;
  v14[1] = @"operationType";
  v6 = [(ICASCloudOperationData *)self operationType];
  if (v6)
  {
    uint64_t v7 = [(ICASCloudOperationData *)self operationType];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
  }
  v8 = (void *)v7;
  v15[1] = v7;
  v14[2] = @"operationGroupName";
  id v9 = [(ICASCloudOperationData *)self operationGroupName];
  if (v9)
  {
    uint64_t v10 = [(ICASCloudOperationData *)self operationGroupName];
  }
  else
  {
    uint64_t v10 = objc_opt_new();
  }
  id v11 = (void *)v10;
  v15[2] = v10;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];

  return v12;
}

- (NSString)operationID
{
  return self->_operationID;
}

- (ICASOperationType)operationType
{
  return self->_operationType;
}

- (NSString)operationGroupName
{
  return self->_operationGroupName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationGroupName, 0);
  objc_storeStrong((id *)&self->_operationType, 0);
  objc_storeStrong((id *)&self->_operationID, 0);
}

@end