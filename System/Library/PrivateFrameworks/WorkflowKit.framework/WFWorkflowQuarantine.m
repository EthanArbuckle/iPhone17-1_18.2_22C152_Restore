@interface WFWorkflowQuarantine
- (BOOL)isEqual:(id)a3;
- (NSDate)importDate;
- (NSString)sourceAppIdentifier;
- (WFWorkflowQuarantine)initWithSerializedData:(id)a3;
- (WFWorkflowQuarantine)initWithSourceAppIdentifier:(id)a3 importDate:(id)a4;
- (id)serializedData;
- (id)serializedRepresentation;
@end

@implementation WFWorkflowQuarantine

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_importDate, 0);
  objc_storeStrong((id *)&self->_sourceAppIdentifier, 0);
}

- (NSDate)importDate
{
  return self->_importDate;
}

- (NSString)sourceAppIdentifier
{
  return self->_sourceAppIdentifier;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WFWorkflowQuarantine *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(WFWorkflowQuarantine *)self sourceAppIdentifier];
      v7 = [(WFWorkflowQuarantine *)v5 sourceAppIdentifier];
      if ([v6 isEqualToString:v7])
      {
        v8 = [(WFWorkflowQuarantine *)self importDate];
        v9 = [(WFWorkflowQuarantine *)v5 importDate];
        char v10 = [v8 isEqualToDate:v9];
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (id)serializedRepresentation
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"WFWorkflowQuarantineSourceApp";
  v3 = [(WFWorkflowQuarantine *)self sourceAppIdentifier];
  v7[1] = @"WFWorkflowQuarantineImportDate";
  v8[0] = v3;
  v4 = [(WFWorkflowQuarantine *)self importDate];
  v8[1] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (id)serializedData
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F28DB0];
  v3 = [(WFWorkflowQuarantine *)self serializedRepresentation];
  id v8 = 0;
  v4 = [v2 archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v8];
  id v5 = v8;

  if (!v4)
  {
    v6 = getWFGeneralLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      char v10 = "-[WFWorkflowQuarantine serializedData]";
      __int16 v11 = 2114;
      id v12 = v5;
      _os_log_impl(&dword_1C7F0A000, v6, OS_LOG_TYPE_ERROR, "%s Failed to archive quarantine data: %{public}@", buf, 0x16u);
    }
  }
  return v4;
}

- (WFWorkflowQuarantine)initWithSerializedData:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  id v8 = objc_msgSend(v4, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  uint64_t v21 = 0;
  v9 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v8 fromData:v5 error:&v21];

  char v10 = [v9 objectForKey:@"WFWorkflowQuarantineSourceApp"];
  uint64_t v11 = objc_opt_class();
  id v12 = WFEnforceClass(v10, v11);

  uint64_t v13 = [v9 objectForKey:@"WFWorkflowQuarantineImportDate"];
  uint64_t v14 = objc_opt_class();
  v15 = WFEnforceClass(v13, v14);
  v16 = v15;
  if (v15)
  {
    id v17 = v15;
  }
  else
  {
    id v17 = [MEMORY[0x1E4F1C9C8] date];
  }
  v18 = v17;

  if (v12)
  {
    self = [(WFWorkflowQuarantine *)self initWithSourceAppIdentifier:v12 importDate:v18];
    v19 = self;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (WFWorkflowQuarantine)initWithSourceAppIdentifier:(id)a3 importDate:(id)a4
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
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"WFWorkflowQuarantine.m", 20, @"Invalid parameter not satisfying: %@", @"sourceAppIdentifier" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"WFWorkflowQuarantine.m", 21, @"Invalid parameter not satisfying: %@", @"importDate" object file lineNumber description];

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)WFWorkflowQuarantine;
  char v10 = [(WFWorkflowQuarantine *)&v17 init];
  if (v10)
  {
    uint64_t v11 = [v7 copy];
    sourceAppIdentifier = v10->_sourceAppIdentifier;
    v10->_sourceAppIdentifier = (NSString *)v11;

    objc_storeStrong((id *)&v10->_importDate, a4);
    uint64_t v13 = v10;
  }

  return v10;
}

@end