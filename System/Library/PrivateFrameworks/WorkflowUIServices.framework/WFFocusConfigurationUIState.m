@interface WFFocusConfigurationUIState
+ (BOOL)supportsSecureCoding;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUIValid;
- (BOOL)isValid;
- (LNAction)action;
- (LNDisplayRepresentation)displayRepresentation;
- (WFContextualAction)contextualAction;
- (WFFocusConfigurationUIState)initWithCoder:(id)a3;
- (WFFocusConfigurationUIState)initWithEnabled:(BOOL)a3 uiValidity:(BOOL)a4 action:(id)a5 displayRepresentation:(id)a6;
- (WFFocusConfigurationUIState)initWithEnabled:(BOOL)a3 uiValidity:(BOOL)a4 contextualAction:(id)a5;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFFocusConfigurationUIState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextualAction, 0);
  objc_storeStrong((id *)&self->_displayRepresentation, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

- (WFContextualAction)contextualAction
{
  return self->_contextualAction;
}

- (LNDisplayRepresentation)displayRepresentation
{
  return self->_displayRepresentation;
}

- (LNAction)action
{
  return self->_action;
}

- (BOOL)isUIValid
{
  return self->_isUIValid;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[WFFocusConfigurationUIState isEnabled](self, "isEnabled"), @"isEnabled");
  objc_msgSend(v4, "encodeBool:forKey:", -[WFFocusConfigurationUIState isUIValid](self, "isUIValid"), @"isUIValid");
  v5 = [(WFFocusConfigurationUIState *)self action];
  [v4 encodeObject:v5 forKey:@"action"];

  v6 = [(WFFocusConfigurationUIState *)self displayRepresentation];
  [v4 encodeObject:v6 forKey:@"displayRepresentation"];

  id v7 = [(WFFocusConfigurationUIState *)self contextualAction];
  [v4 encodeObject:v7 forKey:@"contextualAction"];
}

- (WFFocusConfigurationUIState)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeBoolForKey:@"isEnabled"];
  uint64_t v6 = [v4 decodeBoolForKey:@"isUIValid"];
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2050000000;
  id v7 = (void *)getLNActionClass_softClass_1792;
  uint64_t v24 = getLNActionClass_softClass_1792;
  if (!getLNActionClass_softClass_1792)
  {
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    v18 = __getLNActionClass_block_invoke_1793;
    v19 = &unk_2642A5AD8;
    v20 = &v21;
    __getLNActionClass_block_invoke_1793((uint64_t)&v16);
    id v7 = (void *)v22[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v21, 8);
  uint64_t v9 = [v4 decodeObjectOfClass:v8 forKey:@"action"];
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2050000000;
  v10 = (void *)getLNDisplayRepresentationClass_softClass;
  uint64_t v24 = getLNDisplayRepresentationClass_softClass;
  if (!getLNDisplayRepresentationClass_softClass)
  {
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    v18 = __getLNDisplayRepresentationClass_block_invoke;
    v19 = &unk_2642A5AD8;
    v20 = &v21;
    __getLNDisplayRepresentationClass_block_invoke((uint64_t)&v16);
    v10 = (void *)v22[3];
  }
  id v11 = v10;
  _Block_object_dispose(&v21, 8);
  uint64_t v12 = [v4 decodeObjectOfClass:v11 forKey:@"displayRepresentation"];
  if (v9 | v12)
  {
    v13 = [(WFFocusConfigurationUIState *)self initWithEnabled:v5 uiValidity:v6 action:v9 displayRepresentation:v12];
  }
  else
  {
    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contextualAction"];
    v13 = [(WFFocusConfigurationUIState *)self initWithEnabled:v5 uiValidity:v6 contextualAction:v14];
  }
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WFFocusConfigurationUIState *)a3;
  uint64_t v5 = v4;
  if (self != v4)
  {
    uint64_t v6 = v4;
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        BOOL v7 = [(WFFocusConfigurationUIState *)self isEnabled];
        if (v7 != [(WFFocusConfigurationUIState *)v6 isEnabled]
          || (BOOL v8 = [(WFFocusConfigurationUIState *)self isUIValid],
              v8 != [(WFFocusConfigurationUIState *)v6 isUIValid]))
        {
          LOBYTE(v9) = 0;
LABEL_11:

          goto LABEL_12;
        }
        uint64_t v12 = [(WFFocusConfigurationUIState *)self action];
        v13 = [(WFFocusConfigurationUIState *)v6 action];
        v10 = v12;
        v14 = v13;
        v15 = v14;
        if (v10 == v14)
        {
        }
        else
        {
          LOBYTE(v9) = 0;
          uint64_t v16 = v14;
          uint64_t v17 = v10;
          if (!v10 || !v14) {
            goto LABEL_32;
          }
          BOOL v18 = [(WFFocusConfigurationUIState *)v10 isEqual:v14];

          if (!v18)
          {
            LOBYTE(v9) = 0;
LABEL_33:

            goto LABEL_10;
          }
        }
        v19 = [(WFFocusConfigurationUIState *)self displayRepresentation];
        v20 = [(WFFocusConfigurationUIState *)v6 displayRepresentation];
        uint64_t v17 = v19;
        uint64_t v21 = v20;
        uint64_t v16 = v21;
        if (v17 == v21)
        {
        }
        else
        {
          LOBYTE(v9) = 0;
          v22 = v21;
          uint64_t v23 = v17;
          if (!v17 || !v21)
          {
LABEL_31:

LABEL_32:
            goto LABEL_33;
          }
          BOOL v9 = [(WFFocusConfigurationUIState *)v17 isEqual:v21];

          if (!v9) {
            goto LABEL_32;
          }
        }
        uint64_t v24 = [(WFFocusConfigurationUIState *)self contextualAction];
        v25 = [(WFFocusConfigurationUIState *)v6 contextualAction];
        uint64_t v23 = v24;
        v26 = v25;
        v22 = v26;
        if (v23 == v26)
        {
          LOBYTE(v9) = 1;
        }
        else
        {
          LOBYTE(v9) = 0;
          if (v23 && v26) {
            LOBYTE(v9) = [(WFFocusConfigurationUIState *)v23 isEqual:v26];
          }
        }

        goto LABEL_31;
      }
      LOBYTE(v9) = 0;
      v10 = v6;
      uint64_t v6 = 0;
    }
    else
    {
      v10 = 0;
      LOBYTE(v9) = 0;
    }
LABEL_10:

    goto LABEL_11;
  }
  LOBYTE(v9) = 1;
LABEL_12:

  return v9;
}

- (unint64_t)hash
{
  if ([(WFFocusConfigurationUIState *)self isEnabled]) {
    uint64_t v3 = 3405691582;
  }
  else {
    uint64_t v3 = 3133065982;
  }
  if ([(WFFocusConfigurationUIState *)self isUIValid]) {
    uint64_t v4 = 3405691582;
  }
  else {
    uint64_t v4 = 3133065982;
  }
  uint64_t v5 = v4 ^ v3;
  uint64_t v6 = [(WFFocusConfigurationUIState *)self action];
  uint64_t v7 = [v6 hash];
  BOOL v8 = [(WFFocusConfigurationUIState *)self displayRepresentation];
  uint64_t v9 = v7 ^ [v8 hash];
  v10 = [(WFFocusConfigurationUIState *)self contextualAction];
  unint64_t v11 = v5 ^ v9 ^ [v10 hash];

  return v11;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  if ([(WFFocusConfigurationUIState *)self isValid]) {
    uint64_t v6 = @"YES";
  }
  else {
    uint64_t v6 = @"NO";
  }
  if ([(WFFocusConfigurationUIState *)self isEnabled]) {
    uint64_t v7 = @"YES";
  }
  else {
    uint64_t v7 = @"NO";
  }
  if ([(WFFocusConfigurationUIState *)self isUIValid]) {
    BOOL v8 = @"YES";
  }
  else {
    BOOL v8 = @"NO";
  }
  uint64_t v9 = [(WFFocusConfigurationUIState *)self action];
  v10 = [v9 identifier];
  unint64_t v11 = [(WFFocusConfigurationUIState *)self displayRepresentation];
  uint64_t v12 = [(WFFocusConfigurationUIState *)self contextualAction];
  v13 = [v3 stringWithFormat:@"<%@: %p, isValid: %@, Enabled: %@, isUIValid: %@, link action: %@, link displayRepresentation: %@, contextual action: %@>", v5, self, v6, v7, v8, v10, v11, v12];

  return v13;
}

- (WFFocusConfigurationUIState)initWithEnabled:(BOOL)a3 uiValidity:(BOOL)a4 contextualAction:(id)a5
{
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)WFFocusConfigurationUIState;
  v10 = [(WFFocusConfigurationUIState *)&v14 init];
  unint64_t v11 = v10;
  if (v10)
  {
    v10->_enabled = a3;
    v10->_isUIValid = a4;
    objc_storeStrong((id *)&v10->_contextualAction, a5);
    uint64_t v12 = v11;
  }

  return v11;
}

- (WFFocusConfigurationUIState)initWithEnabled:(BOOL)a3 uiValidity:(BOOL)a4 action:(id)a5 displayRepresentation:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v20.receiver = self;
  v20.super_class = (Class)WFFocusConfigurationUIState;
  uint64_t v12 = [(WFFocusConfigurationUIState *)&v20 init];
  v13 = v12;
  if (v12)
  {
    v12->_enabled = a3;
    v12->_isUIValid = a4;
    uint64_t v14 = [v10 copy];
    action = v13->_action;
    v13->_action = (LNAction *)v14;

    uint64_t v16 = [v11 copy];
    displayRepresentation = v13->_displayRepresentation;
    v13->_displayRepresentation = (LNDisplayRepresentation *)v16;

    BOOL v18 = v13;
  }

  return v13;
}

- (BOOL)isValid
{
  if (![(WFFocusConfigurationUIState *)self isUIValid]) {
    return 0;
  }
  uint64_t v3 = [(WFFocusConfigurationUIState *)self action];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    uint64_t v5 = [(WFFocusConfigurationUIState *)self contextualAction];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end