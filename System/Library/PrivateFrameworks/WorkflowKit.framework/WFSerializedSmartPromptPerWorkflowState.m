@interface WFSerializedSmartPromptPerWorkflowState
- (BOOL)isEqual:(id)a3;
- (NSData)data;
- (NSDictionary)dictionaryRepresentation;
- (NSString)actionUUID;
- (WFSerializedSmartPromptPerWorkflowState)initWithData:(id)a3 actionUUID:(id)a4;
- (WFSerializedSmartPromptPerWorkflowState)initWithDictionary:(id)a3;
@end

@implementation WFSerializedSmartPromptPerWorkflowState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_actionUUID, 0);
}

- (NSData)data
{
  return self->_data;
}

- (NSString)actionUUID
{
  return self->_actionUUID;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WFSerializedSmartPromptPerWorkflowState *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v13 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v7 = [(WFSerializedSmartPromptPerWorkflowState *)self data];
      v8 = +[WFSmartPromptState stateFromDatabaseData:v7];
      v9 = [v8 wfSerializedRepresentation];

      v10 = [(WFSerializedSmartPromptPerWorkflowState *)v6 data];
      v11 = +[WFSmartPromptState stateFromDatabaseData:v10];
      v12 = [v11 wfSerializedRepresentation];

      char v13 = [v9 isEqualToDictionary:v12];
    }
    else
    {
      char v13 = 0;
    }
  }
  return v13;
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(WFSerializedSmartPromptPerWorkflowState *)self data];
  [v3 setObject:v4 forKey:@"data"];

  v5 = [(WFSerializedSmartPromptPerWorkflowState *)self actionUUID];

  if (v5)
  {
    v6 = [(WFSerializedSmartPromptPerWorkflowState *)self actionUUID];
    [v3 setObject:v6 forKey:@"actionUUID"];
  }
  return (NSDictionary *)v3;
}

- (WFSerializedSmartPromptPerWorkflowState)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"actionUUID"];
  v6 = [v4 objectForKeyedSubscript:@"data"];

  if (v6)
  {
    self = [(WFSerializedSmartPromptPerWorkflowState *)self initWithData:v6 actionUUID:v5];
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (WFSerializedSmartPromptPerWorkflowState)initWithData:(id)a3 actionUUID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"WFSerializedSmartPromptPerWorkflowState.m", 21, @"Invalid parameter not satisfying: %@", @"data" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)WFSerializedSmartPromptPerWorkflowState;
  v9 = [(WFSerializedSmartPromptPerWorkflowState *)&v17 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    actionUUID = v9->_actionUUID;
    v9->_actionUUID = (NSString *)v10;

    uint64_t v12 = [v7 copy];
    data = v9->_data;
    v9->_data = (NSData *)v12;

    v14 = v9;
  }

  return v9;
}

@end