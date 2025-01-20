@interface WFConfiguredSystemWorkflowAction
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)workflowIdentifier;
- (WFConfiguredSystemWorkflowAction)initWithCoder:(id)a3;
- (WFConfiguredSystemWorkflowAction)initWithName:(id)a3 workflowIdentifier:(id)a4 workflowIcon:(id)a5 associatedBundleIdentifier:(id)a6 shortcutsMetadata:(id)a7;
- (WFConfiguredSystemWorkflowAction)initWithName:(id)a3 workflowIdentifier:(id)a4 workflowIcon:(id)a5 associatedBundleIdentifier:(id)a6 shortcutsMetadata:(id)a7 colorScheme:(id)a8;
- (WFConfiguredSystemWorkflowAction)initWithWorkflow:(id)a3 shortcutsMetadata:(id)a4;
- (WFConfiguredSystemWorkflowAction)initWithWorkflow:(id)a3 shortcutsMetadata:(id)a4 colorScheme:(id)a5;
- (WFWorkflowIcon)workflowIcon;
- (id)description;
- (id)previewIcon;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setWorkflowIcon:(id)a3;
- (void)setWorkflowIdentifier:(id)a3;
@end

@implementation WFConfiguredSystemWorkflowAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workflowIcon, 0);
  objc_storeStrong((id *)&self->_workflowIdentifier, 0);
}

- (void)setWorkflowIcon:(id)a3
{
}

- (WFWorkflowIcon)workflowIcon
{
  return self->_workflowIcon;
}

- (void)setWorkflowIdentifier:(id)a3
{
}

- (NSString)workflowIdentifier
{
  return self->_workflowIdentifier;
}

- (id)previewIcon
{
  v3 = [(WFConfiguredStaccatoAction *)self associatedBundleIdentifier];
  char v4 = [v3 isEqualToString:@"com.apple.shortcuts"];

  if (v4)
  {
    v5 = [(WFConfiguredSystemWorkflowAction *)self workflowIcon];
    v6 = [v5 icon];

    if (v6)
    {
      v7 = [(WFConfiguredSystemWorkflowAction *)self workflowIcon];
      v8 = [v7 icon];
    }
    else
    {
      v12.receiver = self;
      v12.super_class = (Class)WFConfiguredSystemWorkflowAction;
      v8 = [(WFConfiguredStaccatoAction *)&v12 previewIcon];
    }
  }
  else
  {
    v9 = [WFAppIcon alloc];
    v10 = [(WFConfiguredStaccatoAction *)self associatedBundleIdentifier];
    v8 = [(WFAppIcon *)v9 initWithBundleIdentifier:v10];
  }
  return v8;
}

- (unint64_t)hash
{
  v3 = objc_opt_new();
  v9.receiver = self;
  v9.super_class = (Class)WFConfiguredSystemWorkflowAction;
  id v4 = (id)objc_msgSend(v3, "combineInteger:", -[WFConfiguredStaccatoAction hash](&v9, sel_hash));
  v5 = [(WFConfiguredSystemWorkflowAction *)self workflowIdentifier];
  id v6 = (id)[v3 combine:v5];

  unint64_t v7 = [v3 finalize];
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WFConfiguredSystemWorkflowAction *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v12 = 1;
  }
  else if (v4 {
         && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
  }
         && (v14.receiver = self,
             v14.super_class = (Class)WFConfiguredSystemWorkflowAction,
             [(WFConfiguredStaccatoAction *)&v14 isEqual:v5]))
  {
    id v6 = v5;
    unint64_t v7 = [(WFConfiguredSystemWorkflowAction *)self workflowIdentifier];
    v8 = [(WFConfiguredSystemWorkflowAction *)v6 workflowIdentifier];
    id v9 = v7;
    id v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {
      char v12 = 1;
    }
    else
    {
      char v12 = 0;
      if (v9 && v10) {
        char v12 = [v9 isEqualToString:v10];
      }
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(WFConfiguredStaccatoAction *)self identifier];
  id v6 = [(WFConfiguredStaccatoAction *)self name];
  unint64_t v7 = [(WFConfiguredStaccatoAction *)self associatedBundleIdentifier];
  v8 = [(WFConfiguredSystemWorkflowAction *)self workflowIdentifier];
  id v9 = [v3 stringWithFormat:@"<%@ (%p): id: %@ name: %@, bundle: %@, workflow: %@>", v4, self, v5, v6, v7, v8];

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFConfiguredSystemWorkflowAction;
  id v4 = a3;
  [(WFConfiguredStaccatoAction *)&v7 encodeWithCoder:v4];
  v5 = [(WFConfiguredSystemWorkflowAction *)self workflowIcon];
  [v4 encodeObject:v5 forKey:@"workflowIcon"];

  id v6 = [(WFConfiguredSystemWorkflowAction *)self workflowIdentifier];
  [v4 encodeObject:v6 forKey:@"workflowIdentifier"];
}

- (WFConfiguredSystemWorkflowAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"workflowIdentifier"];
  objc_super v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"associatedBundleIdentifier"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shortcutsMetadata"];
  id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"colorScheme"];
  id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"workflowIcon"];

  v11 = 0;
  if (v5 && v6)
  {
    self = [(WFConfiguredSystemWorkflowAction *)self initWithName:v5 workflowIdentifier:v6 workflowIcon:v10 associatedBundleIdentifier:v7 shortcutsMetadata:v8 colorScheme:v9];
    v11 = self;
  }

  return v11;
}

- (WFConfiguredSystemWorkflowAction)initWithName:(id)a3 workflowIdentifier:(id)a4 workflowIcon:(id)a5 associatedBundleIdentifier:(id)a6 shortcutsMetadata:(id)a7 colorScheme:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  v18 = (__CFString *)a6;
  id v19 = a7;
  id v20 = a8;
  if (v15)
  {
    if (v16) {
      goto LABEL_3;
    }
  }
  else
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"WFConfiguredSystemWorkflowAction.m", 60, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];

    if (v16)
    {
LABEL_3:
      if (v18) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  v29 = [MEMORY[0x1E4F28B00] currentHandler];
  [v29 handleFailureInMethod:a2, self, @"WFConfiguredSystemWorkflowAction.m", 61, @"Invalid parameter not satisfying: %@", @"workflowIdentifier" object file lineNumber description];

  if (!v18)
  {
LABEL_4:
    v18 = @"com.apple.shortcuts";
    v21 = @"com.apple.shortcuts";
  }
LABEL_5:
  v22 = [v17 icon];
  v30.receiver = self;
  v30.super_class = (Class)WFConfiguredSystemWorkflowAction;
  v23 = [(WFConfiguredStaccatoAction *)&v30 initWithIdentifier:v16 associatedBundleIdentifier:v18 name:v15 previewIcon:v22 shortcutsMetadata:v19 colorScheme:v20];

  if (v23)
  {
    uint64_t v24 = [v16 copy];
    workflowIdentifier = v23->_workflowIdentifier;
    v23->_workflowIdentifier = (NSString *)v24;

    objc_storeStrong((id *)&v23->_workflowIcon, a5);
    v26 = v23;
  }

  return v23;
}

- (WFConfiguredSystemWorkflowAction)initWithName:(id)a3 workflowIdentifier:(id)a4 workflowIcon:(id)a5 associatedBundleIdentifier:(id)a6 shortcutsMetadata:(id)a7
{
  return [(WFConfiguredSystemWorkflowAction *)self initWithName:a3 workflowIdentifier:a4 workflowIcon:a5 associatedBundleIdentifier:a6 shortcutsMetadata:a7 colorScheme:0];
}

- (WFConfiguredSystemWorkflowAction)initWithWorkflow:(id)a3 shortcutsMetadata:(id)a4 colorScheme:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"WFConfiguredSystemWorkflowAction.m", 34, @"Invalid parameter not satisfying: %@", @"workflowDescriptor" object file lineNumber description];
  }
  char v12 = [v9 name];
  v13 = [v9 identifier];
  objc_super v14 = -[WFWorkflowIcon initWithBackgroundColorValue:glyphCharacter:customImageData:]([WFWorkflowIcon alloc], "initWithBackgroundColorValue:glyphCharacter:customImageData:", [v9 color], objc_msgSend(v9, "glyphCharacter"), 0);
  id v15 = [v9 associatedAppBundleIdentifier];
  id v16 = [(WFConfiguredSystemWorkflowAction *)self initWithName:v12 workflowIdentifier:v13 workflowIcon:v14 associatedBundleIdentifier:v15 shortcutsMetadata:v10 colorScheme:v11];

  return v16;
}

- (WFConfiguredSystemWorkflowAction)initWithWorkflow:(id)a3 shortcutsMetadata:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFConfiguredSystemWorkflowAction.m", 26, @"Invalid parameter not satisfying: %@", @"workflowDescriptor" object file lineNumber description];
  }
  id v9 = [(WFConfiguredSystemWorkflowAction *)self initWithWorkflow:v7 shortcutsMetadata:v8 colorScheme:0];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end