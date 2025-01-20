@interface WFSmartPromptState
+ (BOOL)supportsSecureCoding;
+ (id)localizedDeniedPermissionsErrorWithContentDestination:(id)a3;
+ (id)localizedUnlockedDeviceRequiredError;
+ (id)localizedUnsupportedEnvironmentError;
+ (id)objectWithWFSerializedRepresentation:(id)a3;
+ (id)stateFromDatabaseData:(id)a3;
- (BOOL)matches:(id)a3;
- (BOOL)matches:(id)a3 ignoringAccountData:(BOOL)a4;
- (NSString)actionUUID;
- (NSString)description;
- (NSString)mode;
- (NSString)status;
- (WFContentAttribution)sourceContentAttribution;
- (WFContentLocation)contentDestination;
- (WFSmartPromptState)initWithCoder:(id)a3;
- (WFSmartPromptState)initWithMode:(id)a3 sourceContentAttribution:(id)a4 actionUUID:(id)a5 contentDestination:(id)a6 status:(id)a7;
- (WFSmartPromptState)stateWithStatus:(id)a3;
- (WFSmartPromptState)stateWithStatus:(id)a3 actionUUID:(id)a4;
- (id)databaseDataWithError:(id *)a3;
- (id)localizedDeniedPermissionsError;
- (id)localizedExfiltrationRestrictedError;
- (id)siriActionToolDescription;
- (id)stateByReplacingAccountWithAppOrigin;
- (id)wfSerializedRepresentation;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFSmartPromptState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_contentDestination, 0);
  objc_storeStrong((id *)&self->_actionUUID, 0);
  objc_storeStrong((id *)&self->_mode, 0);
  objc_storeStrong((id *)&self->_sourceContentAttribution, 0);
}

- (NSString)status
{
  return self->_status;
}

- (WFContentLocation)contentDestination
{
  return self->_contentDestination;
}

- (NSString)actionUUID
{
  return self->_actionUUID;
}

- (NSString)mode
{
  return self->_mode;
}

- (WFContentAttribution)sourceContentAttribution
{
  return self->_sourceContentAttribution;
}

- (id)siriActionToolDescription
{
  v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)WFSmartPromptState;
  v4 = [(WFSmartPromptState *)&v10 description];
  mode = self->_mode;
  v6 = [(WFContentAttribution *)self->_sourceContentAttribution description];
  v7 = [(WFContentLocation *)self->_contentDestination description];
  v8 = [v3 stringWithFormat:@"%@ {\n      - Mode: %@\n      - Source: %@\n      - Destination: %@\n      - Action UUID: %@\n      - Status: %@\n}", v4, mode, v6, v7, self->_actionUUID, self->_status];

  return v8;
}

- (NSString)description
{
  v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)WFSmartPromptState;
  v4 = [(WFSmartPromptState *)&v10 description];
  mode = self->_mode;
  v6 = [(WFContentAttribution *)self->_sourceContentAttribution description];
  v7 = [(WFContentLocation *)self->_contentDestination description];
  v8 = [v3 stringWithFormat:@"%@: mode: %@, source: %@, destination: %@, actionUUID: %@, status: %@", v4, mode, v6, v7, self->_actionUUID, self->_status];

  return (NSString *)v8;
}

- (WFSmartPromptState)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mode"];
  v6 = [MEMORY[0x1E4F5A868] allContentLocationClasses];
  v7 = [v4 decodeObjectOfClasses:v6 forKey:@"contentDestination"];

  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceContentAttribution"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionUUID"];
  objc_super v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"status"];

  v11 = [(WFSmartPromptState *)self initWithMode:v5 sourceContentAttribution:v8 actionUUID:v9 contentDestination:v7 status:v10];
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WFSmartPromptState *)self mode];
  [v4 encodeObject:v5 forKey:@"mode"];

  v6 = [(WFSmartPromptState *)self sourceContentAttribution];
  [v4 encodeObject:v6 forKey:@"sourceContentAttribution"];

  v7 = [(WFSmartPromptState *)self actionUUID];
  [v4 encodeObject:v7 forKey:@"actionUUID"];

  v8 = [(WFSmartPromptState *)self contentDestination];
  [v4 encodeObject:v8 forKey:@"contentDestination"];

  id v9 = [(WFSmartPromptState *)self status];
  [v4 encodeObject:v9 forKey:@"status"];
}

- (id)stateByReplacingAccountWithAppOrigin
{
  v3 = [WFSmartPromptState alloc];
  id v4 = [(WFSmartPromptState *)self mode];
  v5 = [(WFSmartPromptState *)self sourceContentAttribution];
  v6 = [v5 attributionByReplacingAccountWithAppOrigin];
  v7 = [(WFSmartPromptState *)self actionUUID];
  v8 = [(WFSmartPromptState *)self contentDestination];
  id v9 = [(WFSmartPromptState *)self status];
  objc_super v10 = [(WFSmartPromptState *)v3 initWithMode:v4 sourceContentAttribution:v6 actionUUID:v7 contentDestination:v8 status:v9];

  return v10;
}

- (BOOL)matches:(id)a3 ignoringAccountData:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(WFSmartPromptState *)self actionUUID];
  v8 = [v6 actionUUID];
  if ([v7 isEqualToString:v8])
  {
    id v9 = [(WFSmartPromptState *)self mode];
    objc_super v10 = [v6 mode];
    if ([v9 isEqualToString:v10])
    {
      v11 = [(WFSmartPromptState *)self contentDestination];
      v12 = [v6 contentDestination];
      int v13 = [v11 matches:v12];

      if (!v13)
      {
        LOBYTE(v20) = 0;
        goto LABEL_12;
      }
      uint64_t v14 = [(WFSmartPromptState *)self sourceContentAttribution];
      if (!v14
        || (v15 = (void *)v14,
            [v6 sourceContentAttribution],
            v16 = objc_claimAutoreleasedReturnValue(),
            v16,
            v15,
            !v16))
      {
        LOBYTE(v20) = 1;
        goto LABEL_12;
      }
      v17 = [(WFSmartPromptState *)self sourceContentAttribution];
      v7 = v17;
      if (v4)
      {
        v8 = [v17 attributionByReplacingAccountWithAppOrigin];
        id v9 = [v8 origin];
        objc_super v10 = [v6 sourceContentAttribution];
        v18 = [v10 attributionByReplacingAccountWithAppOrigin];
        v19 = [v18 origin];
        LOBYTE(v20) = [v9 isEqual:v19];
      }
      else
      {
        v8 = [v17 origin];
        id v9 = [v6 sourceContentAttribution];
        objc_super v10 = [v9 origin];
        int v20 = [v8 isEqual:v10];
      }
    }
    else
    {
      LOBYTE(v20) = 0;
    }
  }
  else
  {
    LOBYTE(v20) = 0;
  }

LABEL_12:
  return v20;
}

- (BOOL)matches:(id)a3
{
  return [(WFSmartPromptState *)self matches:a3 ignoringAccountData:0];
}

- (id)wfSerializedRepresentation
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [(WFSmartPromptState *)self contentDestination];
  BOOL v4 = [v3 wfSerializedRepresentation];

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E4F1CA60];
    v17[0] = v4;
    id v6 = [(WFSmartPromptState *)self status];
    v17[1] = v6;
    v16[2] = @"Mode";
    v7 = [(WFSmartPromptState *)self mode];
    v16[3] = @"DataType";
    v17[2] = v7;
    v17[3] = @"SmartPrompt";
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:4];
    id v9 = [v5 dictionaryWithDictionary:v8];

    objc_super v10 = [(WFSmartPromptState *)self sourceContentAttribution];
    v11 = [v10 wfSerializedRepresentation];

    if (v11) {
      [v9 setValue:v11 forKey:@"SourceContentAttribution"];
    }
    v12 = [(WFSmartPromptState *)self actionUUID];

    if (v12)
    {
      int v13 = [(WFSmartPromptState *)self actionUUID];
      [v9 setValue:v13 forKey:@"ActionUUID"];
    }
  }
  else
  {
    v11 = getWFSecurityLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      uint64_t v14 = [(WFSmartPromptState *)self description];
      *(_DWORD *)buf = 136315394;
      v19 = "-[WFSmartPromptState wfSerializedRepresentation]";
      __int16 v20 = 2114;
      v21 = v14;
      _os_log_impl(&dword_1C7F0A000, v11, OS_LOG_TYPE_FAULT, "%s Couldn't serialize WFSmartPromptState because contentDestination was nil, self: %{public}@", buf, 0x16u);
    }
    id v9 = 0;
  }

  return v9;
}

- (id)localizedExfiltrationRestrictedError
{
  v19[2] = *MEMORY[0x1E4F143B8];
  v3 = NSString;
  BOOL v4 = WFLocalizedPluralString(@"This action is trying to share %lu %@ items, which is not allowed.");
  v5 = [(WFSmartPromptState *)self sourceContentAttribution];
  uint64_t v6 = [v5 count];
  v7 = [(WFSmartPromptState *)self sourceContentAttribution];
  v8 = [v7 origin];
  id v9 = [v8 localizedTitle];
  objc_super v10 = objc_msgSend(v3, "stringWithFormat:", v4, v6, v9);

  v11 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v12 = *MEMORY[0x1E4F28588];
  v19[0] = v10;
  uint64_t v13 = *MEMORY[0x1E4F28568];
  v18[0] = v12;
  v18[1] = v13;
  uint64_t v14 = WFLocalizedString(@"You can allow this in Settings.");
  v19[1] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
  v16 = [v11 errorWithDomain:@"WFSmartPromptErrorDomain" code:1 userInfo:v15];

  return v16;
}

- (id)localizedDeniedPermissionsError
{
  v3 = objc_opt_class();
  BOOL v4 = [(WFSmartPromptState *)self contentDestination];
  v5 = [v3 localizedDeniedPermissionsErrorWithContentDestination:v4];

  return v5;
}

- (id)databaseDataWithError:(id *)a3
{
  BOOL v4 = (void *)MEMORY[0x1E4F28F98];
  v5 = [(WFSmartPromptState *)self wfSerializedRepresentation];
  uint64_t v6 = [v4 dataWithPropertyList:v5 format:200 options:0 error:a3];

  return v6;
}

- (WFSmartPromptState)stateWithStatus:(id)a3 actionUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [WFSmartPromptState alloc];
  id v9 = [(WFSmartPromptState *)self mode];
  objc_super v10 = [(WFSmartPromptState *)self sourceContentAttribution];
  v11 = [(WFSmartPromptState *)self contentDestination];
  uint64_t v12 = [(WFSmartPromptState *)v8 initWithMode:v9 sourceContentAttribution:v10 actionUUID:v6 contentDestination:v11 status:v7];

  return v12;
}

- (WFSmartPromptState)stateWithStatus:(id)a3
{
  id v4 = a3;
  v5 = [(WFSmartPromptState *)self actionUUID];
  id v6 = [(WFSmartPromptState *)self stateWithStatus:v4 actionUUID:v5];

  return (WFSmartPromptState *)v6;
}

- (WFSmartPromptState)initWithMode:(id)a3 sourceContentAttribution:(id)a4 actionUUID:(id)a5 contentDestination:(id)a6 status:(id)a7
{
  id v21 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)WFSmartPromptState;
  v17 = [(WFSmartPromptState *)&v22 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_mode, a3);
    objc_storeStrong((id *)&v18->_sourceContentAttribution, a4);
    objc_storeStrong((id *)&v18->_actionUUID, a5);
    objc_storeStrong((id *)&v18->_contentDestination, a6);
    objc_storeStrong((id *)&v18->_status, a7);
    v19 = v18;
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)objectWithWFSerializedRepresentation:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 objectForKey:@"DataType"];
  id v6 = v5;
  if (v5 && ![v5 isEqualToString:@"SmartPrompt"])
  {
    v17 = 0;
    goto LABEL_23;
  }
  id v7 = [v4 objectForKey:@"ActionUUID"];
  if (!v7)
  {
    objc_super v10 = getWFWorkflowExecutionLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v20 = 136315138;
      id v21 = "+[WFSmartPromptState objectWithWFSerializedRepresentation:]";
      _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_ERROR, "%s Failed to deserialize smart prompt action UUID, returning nil", (uint8_t *)&v20, 0xCu);
    }
    v17 = 0;
    goto LABEL_22;
  }
  v8 = (void *)MEMORY[0x1E4F5A868];
  id v9 = [v4 valueForKey:@"ContentDestination"];
  objc_super v10 = [v8 objectWithWFSerializedRepresentation:v9];

  if (v10)
  {
    v11 = [v4 objectForKey:@"Status"];
    if (v11)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v12 = [v4 objectForKey:@"Mode"];
        if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          id v13 = [v4 objectForKey:@"SourceContentAttribution"];
          if (v13)
          {
            id v14 = (void *)MEMORY[0x1E4F5A820];
            id v15 = [v4 objectForKey:@"SourceContentAttribution"];
            id v16 = [v14 objectWithWFSerializedRepresentation:v15];
          }
          else
          {
            id v16 = 0;
          }
          v17 = (void *)[objc_alloc((Class)a1) initWithMode:v12 sourceContentAttribution:v16 actionUUID:v7 contentDestination:v10 status:v11];
        }
        else
        {

          uint64_t v12 = getWFWorkflowExecutionLogObject();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            int v20 = 136315138;
            id v21 = "+[WFSmartPromptState objectWithWFSerializedRepresentation:]";
            _os_log_impl(&dword_1C7F0A000, v12, OS_LOG_TYPE_ERROR, "%s Failed to deserialize smart prompt mode, returning nil", (uint8_t *)&v20, 0xCu);
          }
          v17 = 0;
        }

        goto LABEL_21;
      }
    }

    v11 = getWFWorkflowExecutionLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v20 = 136315138;
      id v21 = "+[WFSmartPromptState objectWithWFSerializedRepresentation:]";
      v18 = "%s Failed to deserialize smart prompt status, returning nil";
LABEL_19:
      _os_log_impl(&dword_1C7F0A000, v11, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v20, 0xCu);
    }
  }
  else
  {
    v11 = getWFWorkflowExecutionLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v20 = 136315138;
      id v21 = "+[WFSmartPromptState objectWithWFSerializedRepresentation:]";
      v18 = "%s Failed to deserialize smart prompt content destination, returning nil";
      goto LABEL_19;
    }
  }
  v17 = 0;
LABEL_21:

LABEL_22:
LABEL_23:

  return v17;
}

+ (id)localizedUnlockedDeviceRequiredError
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v2 = WFLocalizedString(@"This shortcut requires privacy permissions that cannot be granted while your device is locked.");
  v3 = WFLocalizedString(@"Please unlock your device to run this shortcut.");
  id v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v5 = *MEMORY[0x1E4F285A0];
  v9[0] = *MEMORY[0x1E4F28588];
  v9[1] = v5;
  v10[0] = v2;
  v10[1] = v3;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  id v7 = [v4 errorWithDomain:@"WFSmartPromptErrorDomain" code:2 userInfo:v6];

  return v7;
}

+ (id)localizedUnsupportedEnvironmentError
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = WFLocalizedString(@"This shortcut requires privacy permissions that cannot be granted while running in this environment.");
  v3 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v7 = *MEMORY[0x1E4F28588];
  v8[0] = v2;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  uint64_t v5 = [v3 errorWithDomain:@"WFSmartPromptErrorDomain" code:2 userInfo:v4];

  return v5;
}

+ (id)localizedDeniedPermissionsErrorWithContentDestination:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 localizedTitle];

  uint64_t v5 = NSString;
  if (v4) {
    id v6 = @"This shortcut can't access “%@”. You can change this in the shortcut’s privacy settings.";
  }
  else {
    id v6 = @"This shortcut can't access a required resource. You can change this in the shortcut’s privacy settings.";
  }
  uint64_t v7 = WFLocalizedString(v6);
  v8 = [v3 localizedTitle];

  id v9 = objc_msgSend(v5, "localizedStringWithFormat:", v7, v8);

  objc_super v10 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v14 = *MEMORY[0x1E4F28568];
  v15[0] = v9;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  uint64_t v12 = [v10 errorWithDomain:@"WFSmartPromptErrorDomain" code:0 userInfo:v11];

  return v12;
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
      uint64_t v7 = [v5 debugDescription];
      *(_DWORD *)buf = 136315394;
      uint64_t v14 = "+[WFSmartPromptState stateFromDatabaseData:]";
      __int16 v15 = 2112;
      id v16 = v7;
      _os_log_impl(&dword_1C7F0A000, v6, OS_LOG_TYPE_ERROR, "%s Error deserializing smart prompt state property list: %@", buf, 0x16u);
    }
  }
  else
  {
    v8 = [a1 objectWithWFSerializedRepresentation:v4];
    if (v8)
    {
      id v6 = v8;
      id v9 = v6;
      goto LABEL_10;
    }
    objc_super v10 = getWFWorkflowExecutionLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v14 = "+[WFSmartPromptState stateFromDatabaseData:]";
      _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_ERROR, "%s Failed to init smart prompt state from database data.", buf, 0xCu);
    }

    id v6 = 0;
  }
  id v9 = 0;
LABEL_10:

  return v9;
}

@end