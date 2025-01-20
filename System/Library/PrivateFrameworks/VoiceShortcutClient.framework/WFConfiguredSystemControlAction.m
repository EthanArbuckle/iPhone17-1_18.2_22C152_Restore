@interface WFConfiguredSystemControlAction
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (INIntent)intent;
- (NSNumber)controlType;
- (NSString)containerBundleIdentifier;
- (NSString)extensionBundleIdentifier;
- (NSString)kind;
- (WFConfiguredSystemControlAction)initWithCoder:(id)a3;
- (WFConfiguredSystemControlAction)initWithIntent:(id)a3 named:(id)a4 extensionBundleIdentifier:(id)a5 containerBundleIdentifier:(id)a6 kind:(id)a7;
- (WFConfiguredSystemControlAction)initWithIntent:(id)a3 named:(id)a4 extensionBundleIdentifier:(id)a5 containerBundleIdentifier:(id)a6 kind:(id)a7 controlType:(id)a8;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFConfiguredSystemControlAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controlType, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_containerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_extensionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_intent, 0);
}

- (NSNumber)controlType
{
  return self->_controlType;
}

- (NSString)kind
{
  return self->_kind;
}

- (NSString)containerBundleIdentifier
{
  return self->_containerBundleIdentifier;
}

- (NSString)extensionBundleIdentifier
{
  return self->_extensionBundleIdentifier;
}

- (INIntent)intent
{
  return self->_intent;
}

- (unint64_t)hash
{
  v3 = objc_opt_new();
  v17.receiver = self;
  v17.super_class = (Class)WFConfiguredSystemControlAction;
  id v4 = (id)objc_msgSend(v3, "combineInteger:", -[WFConfiguredStaccatoAction hash](&v17, sel_hash));
  v5 = [(WFConfiguredSystemControlAction *)self intent];
  id v6 = (id)[v3 combine:v5];

  v7 = [(WFConfiguredSystemControlAction *)self extensionBundleIdentifier];
  id v8 = (id)[v3 combine:v7];

  v9 = [(WFConfiguredSystemControlAction *)self containerBundleIdentifier];
  id v10 = (id)[v3 combine:v9];

  v11 = [(WFConfiguredSystemControlAction *)self kind];
  id v12 = (id)[v3 combine:v11];

  v13 = [(WFConfiguredSystemControlAction *)self controlType];
  id v14 = (id)[v3 combine:v13];

  unint64_t v15 = [v3 finalize];
  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WFConfiguredSystemControlAction *)a3;
  v5 = v4;
  if (v4 == self)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v41.receiver = self;
        v41.super_class = (Class)WFConfiguredSystemControlAction;
        if ([(WFConfiguredStaccatoAction *)&v41 isEqual:v5])
        {
          id v6 = v5;
          v7 = [(WFConfiguredSystemControlAction *)self intent];
          id v8 = [(WFConfiguredSystemControlAction *)v6 intent];
          id v9 = v7;
          id v10 = v8;
          v11 = v10;
          if (v9 == v10)
          {
          }
          else
          {
            LOBYTE(v12) = 0;
            v13 = v10;
            id v14 = v9;
            if (!v9 || !v10) {
              goto LABEL_43;
            }
            int v15 = [v9 isEqual:v10];

            if (!v15)
            {
              LOBYTE(v12) = 0;
LABEL_44:

              goto LABEL_45;
            }
          }
          v16 = [(WFConfiguredSystemControlAction *)self extensionBundleIdentifier];
          objc_super v17 = [(WFConfiguredSystemControlAction *)v6 extensionBundleIdentifier];
          id v14 = v16;
          id v18 = v17;
          v13 = v18;
          if (v14 == v18)
          {
          }
          else
          {
            LOBYTE(v12) = 0;
            v19 = v18;
            id v20 = v14;
            if (!v14 || !v18) {
              goto LABEL_42;
            }
            int v21 = [v14 isEqualToString:v18];

            if (!v21)
            {
              LOBYTE(v12) = 0;
LABEL_43:

              goto LABEL_44;
            }
          }
          v22 = [(WFConfiguredSystemControlAction *)self containerBundleIdentifier];
          v23 = [(WFConfiguredSystemControlAction *)v6 containerBundleIdentifier];
          id v20 = v22;
          id v24 = v23;
          v19 = v24;
          id v40 = v20;
          if (v20 == v24)
          {
          }
          else
          {
            LOBYTE(v12) = 0;
            v25 = v24;
            if (!v20 || !v24) {
              goto LABEL_41;
            }
            int v12 = [v20 isEqualToString:v24];

            if (!v12) {
              goto LABEL_42;
            }
          }
          v26 = [(WFConfiguredSystemControlAction *)self kind];
          v27 = [(WFConfiguredSystemControlAction *)v6 kind];
          id v28 = v26;
          id v29 = v27;
          v38 = v29;
          id v39 = v28;
          if (v28 == v29)
          {
          }
          else
          {
            LOBYTE(v12) = 0;
            if (!v28)
            {
              v30 = v29;
              v19 = v37;
              goto LABEL_39;
            }
            v30 = v29;
            v19 = v37;
            if (!v29)
            {
LABEL_39:

              goto LABEL_40;
            }
            int v31 = [v28 isEqualToString:v29];

            if (!v31)
            {
              LOBYTE(v12) = 0;
              v19 = v37;
LABEL_40:
              v25 = v38;
              id v20 = v39;
LABEL_41:

              id v20 = v40;
LABEL_42:

              goto LABEL_43;
            }
          }
          v32 = [(WFConfiguredSystemControlAction *)self controlType];
          v33 = [(WFConfiguredSystemControlAction *)v6 controlType];
          id v28 = v32;
          id v34 = v33;
          v35 = v34;
          if (v28 == v34)
          {
            LOBYTE(v12) = 1;
          }
          else
          {
            LOBYTE(v12) = 0;
            if (v28)
            {
              v19 = v37;
              if (v34) {
                LOBYTE(v12) = [v28 isEqual:v34];
              }
              goto LABEL_37;
            }
          }
          v19 = v37;
LABEL_37:

          v30 = v35;
          goto LABEL_39;
        }
      }
    }
    LOBYTE(v12) = 0;
  }
LABEL_45:

  return v12;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(WFConfiguredStaccatoAction *)self identifier];
  id v6 = [(WFConfiguredStaccatoAction *)self name];
  v7 = [(WFConfiguredSystemControlAction *)self extensionBundleIdentifier];
  id v8 = [(WFConfiguredSystemControlAction *)self containerBundleIdentifier];
  id v9 = [(WFConfiguredSystemControlAction *)self kind];
  id v10 = [(WFConfiguredSystemControlAction *)self intent];
  v11 = [(WFConfiguredSystemControlAction *)self controlType];
  int v12 = [v3 stringWithFormat:@"<%@ (%p): id: %@ name: %@, extensionBundleIdentifier: %@, containerBundleIdentifier: %@, kind: %@, intent: %@, controlType: %@>", v4, self, v5, v6, v7, v8, v9, v10, v11];

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)WFConfiguredSystemControlAction;
  id v4 = a3;
  [(WFConfiguredStaccatoAction *)&v10 encodeWithCoder:v4];
  v5 = [(WFConfiguredSystemControlAction *)self intent];
  [v4 encodeObject:v5 forKey:@"intent"];

  id v6 = [(WFConfiguredSystemControlAction *)self extensionBundleIdentifier];
  [v4 encodeObject:v6 forKey:@"extensionBundleIdentifier"];

  v7 = [(WFConfiguredSystemControlAction *)self containerBundleIdentifier];
  [v4 encodeObject:v7 forKey:@"containerBundleIdentifier"];

  id v8 = [(WFConfiguredSystemControlAction *)self kind];
  [v4 encodeObject:v8 forKey:@"kind"];

  id v9 = [(WFConfiguredSystemControlAction *)self controlType];
  [v4 encodeObject:v9 forKey:@"controlType"];
}

- (WFConfiguredSystemControlAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"intent"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"extensionBundleIdentifier"];
  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"containerBundleIdentifier"];
  id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kind"];
  objc_super v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"controlType"];

  v11 = 0;
  if (v6 && v7 && v9 && v10)
  {
    self = [(WFConfiguredSystemControlAction *)self initWithIntent:v5 named:v6 extensionBundleIdentifier:v7 containerBundleIdentifier:v8 kind:v9 controlType:v10];
    v11 = self;
  }

  return v11;
}

- (WFConfiguredSystemControlAction)initWithIntent:(id)a3 named:(id)a4 extensionBundleIdentifier:(id)a5 containerBundleIdentifier:(id)a6 kind:(id)a7
{
  return [(WFConfiguredSystemControlAction *)self initWithIntent:a3 named:a4 extensionBundleIdentifier:a5 containerBundleIdentifier:a6 kind:a7 controlType:&unk_1F0CB1B38];
}

- (WFConfiguredSystemControlAction)initWithIntent:(id)a3 named:(id)a4 extensionBundleIdentifier:(id)a5 containerBundleIdentifier:(id)a6 kind:(id)a7 controlType:(id)a8
{
  int v15 = (INIntent *)a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = (NSNumber *)a8;
  if (v16)
  {
    if (v17) {
      goto LABEL_3;
    }
  }
  else
  {
    id v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2, self, @"WFConfiguredSystemControlAction.m", 24, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];

    if (v17)
    {
LABEL_3:
      if (v19) {
        goto LABEL_4;
      }
LABEL_11:
      v36 = [MEMORY[0x1E4F28B00] currentHandler];
      [v36 handleFailureInMethod:a2, self, @"WFConfiguredSystemControlAction.m", 26, @"Invalid parameter not satisfying: %@", @"kind" object file lineNumber description];

      if (v20) {
        goto LABEL_5;
      }
      goto LABEL_12;
    }
  }
  v35 = [MEMORY[0x1E4F28B00] currentHandler];
  [v35 handleFailureInMethod:a2, self, @"WFConfiguredSystemControlAction.m", 25, @"Invalid parameter not satisfying: %@", @"extensionBundleIdentifier" object file lineNumber description];

  if (!v19) {
    goto LABEL_11;
  }
LABEL_4:
  if (v20) {
    goto LABEL_5;
  }
LABEL_12:
  v37 = [MEMORY[0x1E4F28B00] currentHandler];
  [v37 handleFailureInMethod:a2, self, @"WFConfiguredSystemControlAction.m", 27, @"Invalid parameter not satisfying: %@", @"controlType" object file lineNumber description];

LABEL_5:
  int v21 = [NSString stringWithFormat:@"%@.%@", v17, v19];
  if (v18) {
    id v22 = v18;
  }
  else {
    id v22 = v17;
  }
  v38.receiver = self;
  v38.super_class = (Class)WFConfiguredSystemControlAction;
  v23 = [(WFConfiguredStaccatoAction *)&v38 initWithIdentifier:v21 associatedBundleIdentifier:v22 name:v16 previewIcon:0 shortcutsMetadata:0 colorScheme:0];
  intent = v23->_intent;
  v23->_intent = v15;
  v25 = v15;

  uint64_t v26 = [v17 copy];
  extensionBundleIdentifier = v23->_extensionBundleIdentifier;
  v23->_extensionBundleIdentifier = (NSString *)v26;

  uint64_t v28 = [v18 copy];
  containerBundleIdentifier = v23->_containerBundleIdentifier;
  v23->_containerBundleIdentifier = (NSString *)v28;

  uint64_t v30 = [v19 copy];
  kind = v23->_kind;
  v23->_kind = (NSString *)v30;

  controlType = v23->_controlType;
  v23->_controlType = v20;

  return v23;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end