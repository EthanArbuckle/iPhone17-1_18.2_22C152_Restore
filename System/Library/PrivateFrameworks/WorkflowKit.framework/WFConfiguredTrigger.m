@interface WFConfiguredTrigger
+ (BOOL)supportsSecureCoding;
- (BOOL)editableShortcut;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldNotify;
- (BOOL)shouldPrompt;
- (BOOL)shouldRecur;
- (NSData)selectedEntryMetadata;
- (NSString)workflowID;
- (WFConfiguredTrigger)initWithCoder:(id)a3;
- (WFConfiguredTrigger)initWithIdentifier:(id)a3 workflowID:(id)a4 trigger:(id)a5 shouldPrompt:(BOOL)a6 shouldNotify:(BOOL)a7 shouldRecur:(BOOL)a8 enabled:(BOOL)a9 editableShortcut:(BOOL)a10 selectedEntryMetadata:(id)a11;
- (WFConfiguredTrigger)initWithIdentifier:(id)a3 workflowID:(id)a4 trigger:(id)a5 shouldPrompt:(BOOL)a6 shouldNotify:(BOOL)a7 shouldRecur:(BOOL)a8 enabled:(BOOL)a9 triggerSource:(int)a10 notificationLevel:(int)a11 editableShortcut:(BOOL)a12 selectedEntryMetadata:(id)a13;
- (WFTrigger)trigger;
- (int)notificationLevel;
- (int)source;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFConfiguredTrigger

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trigger, 0);
  objc_storeStrong((id *)&self->_selectedEntryMetadata, 0);
  objc_storeStrong((id *)&self->_workflowID, 0);
}

- (int)notificationLevel
{
  return self->_notificationLevel;
}

- (int)source
{
  return self->_source;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)editableShortcut
{
  return self->_editableShortcut;
}

- (BOOL)shouldRecur
{
  return self->_shouldRecur;
}

- (BOOL)shouldNotify
{
  return self->_shouldNotify;
}

- (BOOL)shouldPrompt
{
  return self->_shouldPrompt;
}

- (WFTrigger)trigger
{
  return self->_trigger;
}

- (NSData)selectedEntryMetadata
{
  return self->_selectedEntryMetadata;
}

- (NSString)workflowID
{
  return self->_workflowID;
}

- (unint64_t)hash
{
  v27.receiver = self;
  v27.super_class = (Class)WFConfiguredTrigger;
  unint64_t v3 = [(WFConfiguredTrigger *)&v27 hash];
  v4 = [(WFConfiguredTrigger *)self workflowID];
  uint64_t v5 = [v4 hash];
  v6 = [(WFConfiguredTrigger *)self trigger];
  v7 = [v6 serializedData];
  uint64_t v8 = v5 ^ [v7 hash];
  v9 = [(WFConfiguredTrigger *)self selectedEntryMetadata];
  uint64_t v10 = v8 ^ [v9 hash];
  v11 = [(WFConfiguredTrigger *)self identifier];
  uint64_t v12 = v10 ^ [v11 hash] ^ v3;
  if ([(WFConfiguredTrigger *)self shouldPrompt]) {
    uint64_t v13 = 3203381950;
  }
  else {
    uint64_t v13 = 3133065982;
  }
  BOOL v14 = [(WFConfiguredTrigger *)self isEnabled];
  uint64_t v15 = 3405774846;
  if (v14) {
    uint64_t v15 = 3133079551;
  }
  uint64_t v16 = v13 ^ v15;
  BOOL v17 = [(WFConfiguredTrigger *)self shouldNotify];
  uint64_t v18 = 3203332814;
  if (v17) {
    uint64_t v18 = 4282069247;
  }
  uint64_t v19 = v16 ^ v18;
  BOOL v20 = [(WFConfiguredTrigger *)self shouldRecur];
  uint64_t v21 = 3741249005;
  if (v20) {
    uint64_t v21 = 3735928559;
  }
  uint64_t v22 = v19 ^ v21;
  BOOL v23 = [(WFConfiguredTrigger *)self editableShortcut];
  uint64_t v24 = 3131817919;
  if (!v23) {
    uint64_t v24 = 3131817405;
  }
  unint64_t v25 = v12 ^ v22 ^ v24;

  return v25;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WFConfiguredTrigger *)a3;
  if (v4 == self)
  {
    LOBYTE(v17) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      v29.receiver = self;
      v29.super_class = (Class)WFConfiguredTrigger;
      if (![(WFConfiguredTrigger *)&v29 isEqual:v5])
      {
        LOBYTE(v17) = 0;
LABEL_29:

        goto LABEL_30;
      }
      v6 = [(WFConfiguredTrigger *)v5 trigger];
      v7 = [v6 serializedData];
      uint64_t v8 = [(WFConfiguredTrigger *)self trigger];
      v9 = [v8 serializedData];
      if (![v7 isEqual:v9])
      {
        LOBYTE(v17) = 0;
LABEL_28:

        goto LABEL_29;
      }
      uint64_t v10 = [(WFConfiguredTrigger *)v5 selectedEntryMetadata];
      v11 = [(WFConfiguredTrigger *)self selectedEntryMetadata];
      if (![v10 isEqual:v11])
      {
        LOBYTE(v17) = 0;
LABEL_27:

        goto LABEL_28;
      }
      v28 = v10;
      uint64_t v12 = [(WFConfiguredTrigger *)self workflowID];
      uint64_t v13 = [(WFConfiguredTrigger *)v5 workflowID];
      id v14 = v12;
      id v15 = v13;
      uint64_t v16 = v15;
      if (v14 == v15)
      {
        id v27 = v15;
      }
      else
      {
        if (!v14 || !v15)
        {

          uint64_t v24 = v16;
          LOBYTE(v17) = 0;
          uint64_t v10 = v28;
          goto LABEL_26;
        }
        int v26 = [v14 isEqualToString:v15];
        id v27 = v16;

        if (!v26) {
          goto LABEL_23;
        }
      }
      BOOL v18 = [(WFConfiguredTrigger *)self isEnabled];
      if (v18 == [(WFConfiguredTrigger *)v5 isEnabled])
      {
        BOOL v19 = [(WFConfiguredTrigger *)self shouldPrompt];
        if (v19 == [(WFConfiguredTrigger *)v5 shouldPrompt])
        {
          BOOL v20 = [(WFConfiguredTrigger *)self shouldNotify];
          if (v20 == [(WFConfiguredTrigger *)v5 shouldNotify])
          {
            BOOL v21 = [(WFConfiguredTrigger *)self shouldRecur];
            if (v21 == [(WFConfiguredTrigger *)v5 shouldRecur])
            {
              int v22 = [(WFConfiguredTrigger *)self notificationLevel];
              if (v22 == [(WFConfiguredTrigger *)v5 notificationLevel])
              {
                BOOL v23 = [(WFConfiguredTrigger *)self editableShortcut];
                BOOL v17 = v23 ^ [(WFConfiguredTrigger *)v5 editableShortcut] ^ 1;
LABEL_24:
                uint64_t v24 = v27;
                uint64_t v10 = v28;
LABEL_26:

                goto LABEL_27;
              }
            }
          }
        }
      }
LABEL_23:
      LOBYTE(v17) = 0;
      goto LABEL_24;
    }
    LOBYTE(v17) = 0;
  }
LABEL_30:

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFConfiguredTrigger;
  id v4 = a3;
  [(WFConfiguredTrigger *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_workflowID, @"workflowID", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_trigger forKey:@"trigger"];
  [v4 encodeBool:self->_shouldPrompt forKey:@"shouldPrompt"];
  [v4 encodeBool:self->_enabled forKey:@"enabled"];
  [v4 encodeInt:self->_source forKey:@"source"];
  [v4 encodeInt:self->_notificationLevel forKey:@"notificationLevel"];
  [v4 encodeBool:self->_shouldNotify forKey:@"shouldNotify"];
  [v4 encodeBool:self->_shouldRecur forKey:@"shouldRecur"];
  [v4 encodeBool:self->_editableShortcut forKey:@"editableShortcut"];
  [v4 encodeObject:self->_selectedEntryMetadata forKey:@"selectedEntryMetadata"];
}

- (WFConfiguredTrigger)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFConfiguredTrigger;
  objc_super v5 = [(WFConfiguredTrigger *)&v14 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"workflowID"];
    workflowID = v5->_workflowID;
    v5->_workflowID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"trigger"];
    trigger = v5->_trigger;
    v5->_trigger = (WFTrigger *)v8;

    v5->_shouldPrompt = [v4 decodeBoolForKey:@"shouldPrompt"];
    v5->_enabled = [v4 decodeBoolForKey:@"enabled"];
    v5->_source = [v4 decodeIntForKey:@"source"];
    v5->_notificationLevel = [v4 decodeIntForKey:@"notificationLevel"];
    v5->_shouldNotify = [v4 decodeBoolForKey:@"shouldNotify"];
    v5->_shouldRecur = [v4 decodeBoolForKey:@"shouldRecur"];
    v5->_editableShortcut = [v4 decodeBoolForKey:@"editableShortcut"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"selectedEntryMetadata"];
    selectedEntryMetadata = v5->_selectedEntryMetadata;
    v5->_selectedEntryMetadata = (NSData *)v10;

    uint64_t v12 = v5;
  }

  return v5;
}

- (WFConfiguredTrigger)initWithIdentifier:(id)a3 workflowID:(id)a4 trigger:(id)a5 shouldPrompt:(BOOL)a6 shouldNotify:(BOOL)a7 shouldRecur:(BOOL)a8 enabled:(BOOL)a9 triggerSource:(int)a10 notificationLevel:(int)a11 editableShortcut:(BOOL)a12 selectedEntryMetadata:(id)a13
{
  id v19 = a3;
  id v20 = a4;
  id v21 = a5;
  id v22 = a13;
  if (!v21) {
    goto LABEL_6;
  }
  if (!v19)
  {
    id v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"WFConfiguredTrigger.m", 41, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  v29.receiver = self;
  v29.super_class = (Class)WFConfiguredTrigger;
  self = [(WFConfiguredTrigger *)&v29 initWithIdentifier:v19 objectType:1];
  if (self)
  {
    BOOL v23 = (NSString *)[v20 copy];
    workflowID = self->_workflowID;
    self->_workflowID = v23;

    objc_storeStrong((id *)&self->_trigger, a5);
    self->_shouldPrompt = a6;
    self->_enabled = a9;
    self->_source = a10;
    self->_notificationLevel = a11;
    self->_shouldNotify = a7;
    self->_shouldRecur = a8;
    self->_editableShortcut = a12;
    objc_storeStrong((id *)&self->_selectedEntryMetadata, a13);
    self = self;
    unint64_t v25 = self;
  }
  else
  {
LABEL_6:
    unint64_t v25 = 0;
  }

  return v25;
}

- (WFConfiguredTrigger)initWithIdentifier:(id)a3 workflowID:(id)a4 trigger:(id)a5 shouldPrompt:(BOOL)a6 shouldNotify:(BOOL)a7 shouldRecur:(BOOL)a8 enabled:(BOOL)a9 editableShortcut:(BOOL)a10 selectedEntryMetadata:(id)a11
{
  BYTE4(v13) = a10;
  LODWORD(v13) = 0;
  LOBYTE(v12) = a9;
  return -[WFConfiguredTrigger initWithIdentifier:workflowID:trigger:shouldPrompt:shouldNotify:shouldRecur:enabled:triggerSource:notificationLevel:editableShortcut:selectedEntryMetadata:](self, "initWithIdentifier:workflowID:trigger:shouldPrompt:shouldNotify:shouldRecur:enabled:triggerSource:notificationLevel:editableShortcut:selectedEntryMetadata:", a3, a4, a5, a6, a7, a8, v12, v13, a11);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end