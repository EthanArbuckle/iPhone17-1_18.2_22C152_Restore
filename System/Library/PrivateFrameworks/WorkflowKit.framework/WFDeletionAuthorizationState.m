@interface WFDeletionAuthorizationState
+ (BOOL)supportsSecureCoding;
+ (id)deniedPermissionsErrorForContentItemClass:(Class)a3;
+ (id)dontDeleteErrorForContentItemClass:(Class)a3;
+ (id)objectWithWFSerializedRepresentation:(id)a3;
+ (id)stateFromDatabaseData:(id)a3;
- (NSString)actionUUID;
- (NSString)contentItemClassName;
- (NSString)description;
- (NSString)status;
- (WFDeletionAuthorizationState)initWithCoder:(id)a3;
- (WFDeletionAuthorizationState)initWithStatus:(id)a3 contentItemClassName:(id)a4 actionUUID:(id)a5 count:(unint64_t)a6;
- (WFDeletionAuthorizationState)stateWithStatus:(id)a3 count:(unint64_t)a4;
- (id)databaseDataWithError:(id *)a3;
- (id)deniedPermissionsError;
- (id)localizedExfiltrationRestrictedError;
- (id)siriActionToolDescription;
- (id)wfSerializedRepresentation;
- (unint64_t)count;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFDeletionAuthorizationState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionUUID, 0);
  objc_storeStrong((id *)&self->_contentItemClassName, 0);
  objc_storeStrong((id *)&self->_status, 0);
}

- (unint64_t)count
{
  return self->_count;
}

- (NSString)actionUUID
{
  return self->_actionUUID;
}

- (NSString)contentItemClassName
{
  return self->_contentItemClassName;
}

- (NSString)status
{
  return self->_status;
}

- (id)siriActionToolDescription
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)WFDeletionAuthorizationState;
  v4 = [(WFDeletionAuthorizationState *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ {\n      - Action UUID: %@\n      - ContentItemClass: %@\n      - Status: %@\n      - Count: %lu\n}", v4, self->_actionUUID, self->_contentItemClassName, self->_status, self->_count];

  return v5;
}

- (NSString)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)WFDeletionAuthorizationState;
  v4 = [(WFDeletionAuthorizationState *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@: actionUUID: %@, contentItemClass: %@, status: %@, count: %lu", v4, self->_actionUUID, self->_contentItemClassName, self->_status, self->_count];

  return (NSString *)v5;
}

- (WFDeletionAuthorizationState)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"status"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contentItemClassName"];
  objc_super v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionUUID"];
  uint64_t v8 = [v4 decodeIntegerForKey:@"count"];

  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9 || v8 == 0)
  {
    v11 = 0;
  }
  else
  {
    self = [(WFDeletionAuthorizationState *)self initWithStatus:v5 contentItemClassName:v6 actionUUID:v7 count:v8];
    v11 = self;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = [(WFDeletionAuthorizationState *)self status];
  [v7 encodeObject:v4 forKey:@"status"];

  v5 = [(WFDeletionAuthorizationState *)self contentItemClassName];
  [v7 encodeObject:v5 forKey:@"contentItemClassName"];

  v6 = [(WFDeletionAuthorizationState *)self actionUUID];
  [v7 encodeObject:v6 forKey:@"actionUUID"];

  objc_msgSend(v7, "encodeInteger:forKey:", -[WFDeletionAuthorizationState count](self, "count"), @"count");
}

- (id)wfSerializedRepresentation
{
  v10[5] = *MEMORY[0x1E4F143B8];
  v9[0] = @"ActionUUID";
  v3 = [(WFDeletionAuthorizationState *)self actionUUID];
  v10[0] = v3;
  v9[1] = @"Status";
  id v4 = [(WFDeletionAuthorizationState *)self status];
  v10[1] = v4;
  v9[2] = @"ContentItemClassName";
  v5 = [(WFDeletionAuthorizationState *)self contentItemClassName];
  v10[2] = v5;
  v9[3] = @"Count";
  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[WFDeletionAuthorizationState count](self, "count"));
  v9[4] = @"DataType";
  v10[3] = v6;
  v10[4] = @"DeletionAuthorization";
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:5];

  return v7;
}

- (id)databaseDataWithError:(id *)a3
{
  id v4 = (void *)MEMORY[0x1E4F28F98];
  v5 = [(WFDeletionAuthorizationState *)self wfSerializedRepresentation];
  v6 = [v4 dataWithPropertyList:v5 format:200 options:0 error:a3];

  return v6;
}

- (id)deniedPermissionsError
{
  v3 = objc_opt_class();
  id v4 = [(WFDeletionAuthorizationState *)self contentItemClassName];
  v5 = [v3 deniedPermissionsErrorForContentItemClass:NSClassFromString(v4)];

  return v5;
}

- (id)localizedExfiltrationRestrictedError
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v3 = [(WFDeletionAuthorizationState *)self contentItemClassName];
  Class v4 = NSClassFromString(v3);

  v5 = [(objc_class *)v4 localizedPluralFilterDescription];
  if ([(objc_class *)v4 canLowercaseTypeDescription])
  {
    uint64_t v6 = [v5 localizedLowercaseString];

    v5 = (void *)v6;
  }
  if (objc_opt_respondsToSelector())
  {
    id v7 = [(objc_class *)v4 localizedCountDescriptionWithValue:[(WFDeletionAuthorizationState *)self count]];
    if (v7)
    {
LABEL_5:
      uint64_t v8 = NSString;
      BOOL v9 = WFLocalizedString(@"This action is trying to delete %@, which is not allowed.");
      objc_msgSend(v8, "stringWithFormat:", v9, v7);
      v17 = LABEL_11:;

      goto LABEL_12;
    }
  }
  else
  {
    v10 = NSString;
    v11 = [(objc_class *)v4 countDescription];
    v12 = objc_msgSend(v10, "localizedStringWithFormat:", v11, -[WFDeletionAuthorizationState count](self, "count"));
    id v7 = [v12 localizedLowercaseString];

    if (v7) {
      goto LABEL_5;
    }
  }
  v13 = getWFWorkflowExecutionLogObject();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_FAULT);
  if (v5)
  {
    if (v14)
    {
      v15 = [(WFDeletionAuthorizationState *)self contentItemClassName];
      *(_DWORD *)buf = 136315394;
      v29 = "-[WFDeletionAuthorizationState localizedExfiltrationRestrictedError]";
      __int16 v30 = 2112;
      v31 = v15;
      _os_log_impl(&dword_1C7F0A000, v13, OS_LOG_TYPE_FAULT, "%s Missing countDescription for %@", buf, 0x16u);
    }
    v16 = NSString;
    BOOL v9 = WFLocalizedString(@"This action is trying to delete a large amount of %@, which is not allowed.");
    objc_msgSend(v16, "stringWithFormat:", v9, v5);
    goto LABEL_11;
  }
  if (v14)
  {
    v25 = [(WFDeletionAuthorizationState *)self contentItemClassName];
    *(_DWORD *)buf = 136315394;
    v29 = "-[WFDeletionAuthorizationState localizedExfiltrationRestrictedError]";
    __int16 v30 = 2112;
    v31 = v25;
    _os_log_impl(&dword_1C7F0A000, v13, OS_LOG_TYPE_FAULT, "%s Missing countDescription and typeDescription for %@", buf, 0x16u);
  }
  v17 = WFLocalizedString(@"This action is trying to delete a large amount of data, which is not allowed.");
LABEL_12:
  v18 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v19 = *MEMORY[0x1E4F28588];
  v27[0] = v17;
  uint64_t v20 = *MEMORY[0x1E4F28568];
  v26[0] = v19;
  v26[1] = v20;
  v21 = WFLocalizedString(@"You can allow this in Settings.");
  v27[1] = v21;
  v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];
  v23 = [v18 errorWithDomain:@"WFSmartPromptErrorDomain" code:1 userInfo:v22];

  return v23;
}

- (WFDeletionAuthorizationState)stateWithStatus:(id)a3 count:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [WFDeletionAuthorizationState alloc];
  uint64_t v8 = [(WFDeletionAuthorizationState *)self contentItemClassName];
  BOOL v9 = [(WFDeletionAuthorizationState *)self actionUUID];
  v10 = [(WFDeletionAuthorizationState *)v7 initWithStatus:v6 contentItemClassName:v8 actionUUID:v9 count:a4];

  return v10;
}

- (WFDeletionAuthorizationState)initWithStatus:(id)a3 contentItemClassName:(id)a4 actionUUID:(id)a5 count:(unint64_t)a6
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = v14;
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"WFDeletionAuthorizationState.m", 21, @"Invalid parameter not satisfying: %@", @"contentItemClassName" object file lineNumber description];

    if (v15) {
      goto LABEL_3;
    }
  }
  v25 = [MEMORY[0x1E4F28B00] currentHandler];
  [v25 handleFailureInMethod:a2, self, @"WFDeletionAuthorizationState.m", 22, @"Invalid parameter not satisfying: %@", @"actionUUID" object file lineNumber description];

LABEL_3:
  v26.receiver = self;
  v26.super_class = (Class)WFDeletionAuthorizationState;
  v16 = [(WFDeletionAuthorizationState *)&v26 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_status, a3);
    uint64_t v18 = [v13 copy];
    contentItemClassName = v17->_contentItemClassName;
    v17->_contentItemClassName = (NSString *)v18;

    uint64_t v20 = [v15 copy];
    actionUUID = v17->_actionUUID;
    v17->_actionUUID = (NSString *)v20;

    v17->_count = a6;
    v22 = v17;
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)objectWithWFSerializedRepresentation:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 objectForKey:@"DataType"];
  id v6 = v5;
  if (v5 && [v5 isEqualToString:@"DeletionAuthorization"])
  {
    id v7 = [v4 objectForKey:@"ContentItemClassName"];
    if (v7)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v8 = v7;
      }
      else {
        uint64_t v8 = 0;
      }
    }
    else
    {
      uint64_t v8 = 0;
    }
    id v10 = v8;

    v11 = [v4 objectForKey:@"Status"];
    if (v11)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v12 = v11;
      }
      else {
        id v12 = 0;
      }
    }
    else
    {
      id v12 = 0;
    }
    id v13 = v12;

    id v14 = [v4 objectForKey:@"ActionUUID"];
    if (v14)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v15 = v14;
      }
      else {
        v15 = 0;
      }
    }
    else
    {
      v15 = 0;
    }
    id v16 = v15;

    v17 = [v4 objectForKey:@"Count"];
    if (v17)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v18 = v17;
      }
      else {
        uint64_t v18 = 0;
      }
    }
    else
    {
      uint64_t v18 = 0;
    }
    id v19 = v18;

    uint64_t v20 = [v19 unsignedIntegerValue];
    if (v10 && v13 && v16 && v20)
    {
      BOOL v9 = (void *)[objc_alloc((Class)a1) initWithStatus:v13 contentItemClassName:v10 actionUUID:v16 count:v20];
    }
    else
    {
      v21 = getWFWorkflowExecutionLogObject();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        int v23 = 136315394;
        v24 = "+[WFDeletionAuthorizationState objectWithWFSerializedRepresentation:]";
        __int16 v25 = 2114;
        id v26 = v4;
        _os_log_impl(&dword_1C7F0A000, v21, OS_LOG_TYPE_FAULT, "%s Failed to deserialize WFDeletionAuthorizationState, returning nil: %{public}@", (uint8_t *)&v23, 0x16u);
      }

      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

+ (id)stateFromDatabaseData:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v12 = 0;
  id v4 = [MEMORY[0x1E4F28F98] propertyListWithData:a3 options:0 format:0 error:&v12];
  id v5 = v12;
  if (v5)
  {
    id v6 = getWFWorkflowExecutionLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [v5 debugDescription];
      *(_DWORD *)buf = 136315394;
      id v14 = "+[WFDeletionAuthorizationState stateFromDatabaseData:]";
      __int16 v15 = 2112;
      id v16 = v7;
      _os_log_impl(&dword_1C7F0A000, v6, OS_LOG_TYPE_ERROR, "%s Error deserializing WFDeletionAuthorizationState property list: %@", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v8 = [a1 objectWithWFSerializedRepresentation:v4];
    if (v8)
    {
      id v6 = v8;
      BOOL v9 = v6;
      goto LABEL_10;
    }
    id v10 = getWFWorkflowExecutionLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v14 = "+[WFDeletionAuthorizationState stateFromDatabaseData:]";
      _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_ERROR, "%s Failed to init WFDeletionAuthorizationState from database data.", buf, 0xCu);
    }

    id v6 = 0;
  }
  BOOL v9 = 0;
LABEL_10:

  return v9;
}

+ (id)dontDeleteErrorForContentItemClass:(Class)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = getWFWorkflowExecutionLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v19 = "+[WFDeletionAuthorizationState dontDeleteErrorForContentItemClass:]";
    _os_log_impl(&dword_1C7F0A000, v4, OS_LOG_TYPE_DEFAULT, "%s User tapped 'Don't Delete'.", buf, 0xCu);
  }

  id v5 = [(objc_class *)a3 localizedPluralFilterDescription];
  if ([(objc_class *)a3 canLowercaseTypeDescription])
  {
    uint64_t v6 = [v5 localizedLowercaseString];

    id v5 = (void *)v6;
  }
  if (v5)
  {
    id v7 = NSString;
    uint64_t v8 = WFLocalizedString(@"You opted not to delete any %@.");
    BOOL v9 = objc_msgSend(v7, "localizedStringWithFormat:", v8, v5);
  }
  else
  {
    id v10 = getWFWorkflowExecutionLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      v11 = NSStringFromClass(a3);
      *(_DWORD *)buf = 136315394;
      id v19 = "+[WFDeletionAuthorizationState dontDeleteErrorForContentItemClass:]";
      __int16 v20 = 2112;
      v21 = v11;
      _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_FAULT, "%s Missing pluralTypeDescription for %@", buf, 0x16u);
    }
    BOOL v9 = WFLocalizedString(@"You opted not to delete some content.");
  }
  id v12 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v16 = *MEMORY[0x1E4F28588];
  uint64_t v17 = v9;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  id v14 = [v12 errorWithDomain:@"WFSmartPromptErrorDomain" code:3 userInfo:v13];

  return v14;
}

+ (id)deniedPermissionsErrorForContentItemClass:(Class)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = [(objc_class *)a3 localizedPluralFilterDescription];
  if ([(objc_class *)a3 canLowercaseTypeDescription])
  {
    uint64_t v5 = [v4 localizedLowercaseString];

    id v4 = (void *)v5;
  }
  if (v4)
  {
    uint64_t v6 = NSString;
    id v7 = WFLocalizedString(@"This shortcut can’t delete %@. You can change this in the shortcut’s privacy settings.");
    uint64_t v8 = objc_msgSend(v6, "localizedStringWithFormat:", v7, v4);
  }
  else
  {
    BOOL v9 = getWFWorkflowExecutionLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      id v10 = NSStringFromClass(a3);
      *(_DWORD *)buf = 136315394;
      uint64_t v18 = "+[WFDeletionAuthorizationState deniedPermissionsErrorForContentItemClass:]";
      __int16 v19 = 2112;
      __int16 v20 = v10;
      _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_FAULT, "%s Missing pluralTypeDescription for %@", buf, 0x16u);
    }
    uint64_t v8 = WFLocalizedString(@"This shortcut can’t delete this content. You can change this in the shortcut’s privacy settings.");
  }
  v11 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v15 = *MEMORY[0x1E4F28588];
  uint64_t v16 = v8;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  id v13 = [v11 errorWithDomain:@"WFSmartPromptErrorDomain" code:0 userInfo:v12];

  return v13;
}

@end