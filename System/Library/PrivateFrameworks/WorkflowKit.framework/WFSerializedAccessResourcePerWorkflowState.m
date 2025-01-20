@interface WFSerializedAccessResourcePerWorkflowState
- (BOOL)isEqual:(id)a3;
- (NSData)data;
- (NSDictionary)dictionaryRepresentation;
- (NSString)identifier;
- (WFSerializedAccessResourcePerWorkflowState)initWithDictionary:(id)a3;
- (WFSerializedAccessResourcePerWorkflowState)initWithIdentifier:(id)a3 data:(id)a4;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
@end

@implementation WFSerializedAccessResourcePerWorkflowState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSData)data
{
  return self->_data;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)hash
{
  v3 = [(WFSerializedAccessResourcePerWorkflowState *)self identifier];
  uint64_t v4 = [v3 hash];
  v5 = [(WFSerializedAccessResourcePerWorkflowState *)self data];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (WFSerializedAccessResourcePerWorkflowState *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v11 = 1;
  }
  else
  {
    unint64_t v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v7 = [(WFSerializedAccessResourcePerWorkflowState *)self identifier];
      v8 = [(WFSerializedAccessResourcePerWorkflowState *)v6 identifier];
      if ([v7 isEqualToString:v8])
      {
        v9 = [(WFSerializedAccessResourcePerWorkflowState *)self data];
        v10 = [(WFSerializedAccessResourcePerWorkflowState *)v6 data];
        char v11 = [v9 isEqualToData:v10];
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }
  return v11;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = [(WFSerializedAccessResourcePerWorkflowState *)self identifier];
    unint64_t v6 = [v4 identifier];
    int64_t v7 = [v5 compare:v6];
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (NSDictionary)dictionaryRepresentation
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"identifier";
  v3 = [(WFSerializedAccessResourcePerWorkflowState *)self identifier];
  v7[1] = @"data";
  v8[0] = v3;
  id v4 = [(WFSerializedAccessResourcePerWorkflowState *)self data];
  v8[1] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return (NSDictionary *)v5;
}

- (WFSerializedAccessResourcePerWorkflowState)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"identifier"];
  unint64_t v6 = [v4 objectForKeyedSubscript:@"data"];

  int64_t v7 = 0;
  if (v5 && v6)
  {
    self = [(WFSerializedAccessResourcePerWorkflowState *)self initWithIdentifier:v5 data:v6];
    int64_t v7 = self;
  }

  return v7;
}

- (WFSerializedAccessResourcePerWorkflowState)initWithIdentifier:(id)a3 data:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"WFSerializedAccessResourcePerWorkflowState.m", 20, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"WFSerializedAccessResourcePerWorkflowState.m", 21, @"Invalid parameter not satisfying: %@", @"data" object file lineNumber description];

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)WFSerializedAccessResourcePerWorkflowState;
  v10 = [(WFSerializedAccessResourcePerWorkflowState *)&v19 init];
  if (v10)
  {
    uint64_t v11 = [v7 copy];
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    data = v10->_data;
    v10->_data = (NSData *)v13;

    v15 = v10;
  }

  return v10;
}

@end