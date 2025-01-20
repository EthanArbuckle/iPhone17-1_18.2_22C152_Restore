@interface WFINShortcutContextualAction
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (INShortcut)shortcut;
- (WFINShortcutContextualAction)initWithCoder:(id)a3;
- (WFINShortcutContextualAction)initWithINShortcut:(id)a3;
- (id)icon;
- (id)runDescriptorForSurface:(unint64_t)a3;
- (id)runRequestForSurface:(unint64_t)a3;
- (id)uniqueIdentifier;
- (id)workflowRunKind;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFINShortcutContextualAction

- (void).cxx_destruct
{
}

- (INShortcut)shortcut
{
  return self->_shortcut;
}

- (id)workflowRunKind
{
  v2 = @"INShortcut";
  return @"INShortcut";
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFINShortcutContextualAction;
  id v4 = a3;
  [(WFContextualAction *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_shortcut, @"shortcut", v5.receiver, v5.super_class);
}

- (WFINShortcutContextualAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WFINShortcutContextualAction;
  objc_super v5 = [(WFContextualAction *)&v9 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shortcut"];
    if (v6)
    {
      objc_storeStrong((id *)&v5->_shortcut, v6);
      v7 = v5;
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WFINShortcutContextualAction;
  if ([(WFContextualAction *)&v13 isEqual:v4])
  {
    id v5 = v4;
    if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v6 = [v5 shortcut];
      v7 = [(WFINShortcutContextualAction *)self shortcut];
      id v8 = v6;
      id v9 = v7;
      v10 = v9;
      if (v8 == v9)
      {
        char v11 = 1;
      }
      else
      {
        char v11 = 0;
        if (v8 && v9) {
          char v11 = [v8 isEqual:v9];
        }
      }
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

  return v11;
}

- (unint64_t)hash
{
  v3 = objc_opt_new();
  v10.receiver = self;
  v10.super_class = (Class)WFINShortcutContextualAction;
  id v4 = (id)objc_msgSend(v3, "combineInteger:", -[WFContextualAction hash](&v10, sel_hash));
  id v5 = [(WFINShortcutContextualAction *)self shortcut];

  if (v5)
  {
    v6 = [(WFINShortcutContextualAction *)self shortcut];
    id v7 = (id)[v3 combine:v6];
  }
  unint64_t v8 = [v3 finalize];

  return v8;
}

- (id)uniqueIdentifier
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v4 = [(WFContextualAction *)self identifier];
  v13[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  v6 = (void *)[v3 initWithArray:v5];

  id v7 = [(INShortcut *)self->_shortcut intent];

  if (v7)
  {
    unint64_t v8 = NSString;
    id v9 = [(INShortcut *)self->_shortcut intent];
    objc_super v10 = objc_msgSend(v8, "stringWithFormat:", @"%lld", objc_msgSend(v9, "_indexingHash"));
    [v6 addObject:v10];
  }
  char v11 = [v6 componentsJoinedByString:@"."];

  return v11;
}

- (id)icon
{
  v2 = [(WFINShortcutContextualAction *)self shortcut];
  id v3 = [v2 intent];
  id v4 = [v3 keyImage];
  id v5 = [v4 _imageData];

  if (v5)
  {
    v6 = +[WFContextualActionIcon iconWithImageData:v5 scale:0 displayStyle:0.0];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (WFINShortcutContextualAction)initWithINShortcut:(id)a3
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v30[0] = @"com.apple.shortcuts.contextual-actions.inshortcut";
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
  unint64_t v8 = (void *)[v6 initWithArray:v7];

  id v9 = [(INShortcut *)self->_shortcut intent];

  shortcut = self->_shortcut;
  if (v9)
  {
    char v11 = [(INShortcut *)shortcut intent];
    v12 = objc_msgSend(v11, "_intents_bundleIdForDisplay");

    if (v12) {
      [v8 addObject:v12];
    }
    objc_super v13 = [(INShortcut *)self->_shortcut intent];
    v14 = [v13 _className];
    [v8 addObject:v14];
  }
  else
  {
    v15 = [(INShortcut *)shortcut userActivity];
    v16 = [v15 _uniqueIdentifier];
    v12 = [v16 UUIDString];

    if (v12) {
      [v8 addObject:v12];
    }
  }

  v17 = [v8 componentsJoinedByString:@"."];
  v18 = [(INShortcut *)self->_shortcut intent];
  v19 = [v18 _title];
  v20 = v19;
  if (v19)
  {
    id v21 = v19;
  }
  else
  {
    v22 = [(INShortcut *)self->_shortcut userActivity];
    id v21 = [v22 title];
  }
  v23 = [(INShortcut *)self->_shortcut intent];
  v24 = objc_msgSend(v23, "_intents_bundleIdForDisplay");

  if (!v24)
  {
    v25 = [(INShortcut *)self->_shortcut userActivity];
    v24 = [v25 _determineMatchingApplicationBundleIdentifierWithOptions:MEMORY[0x1E4F1CC08]];
  }
  v26 = [(WFContextualAction *)self initWithIdentifier:v17 wfActionIdentifier:0 associatedAppBundleIdentifier:v24 parameters:MEMORY[0x1E4F1CBF0] displayFormatString:v21 title:v21 subtitleFormatString:0 icon:0];
  v27 = v26;
  if (v26)
  {
    objc_storeStrong((id *)&v26->_shortcut, a3);
    v28 = v27;
  }

  return v27;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)runRequestForSurface:(unint64_t)a3
{
  if (a3 - 1 > 3) {
    unint64_t v3 = 0;
  }
  else {
    unint64_t v3 = qword_1B3D88C60[a3 - 1];
  }
  id v4 = [[WFWorkflowRunRequest alloc] initWithInput:0 presentationMode:1];
  id v5 = WFRunSourceForSpotlightExecutionContext(v3);
  [(WFWorkflowRunRequest *)v4 setRunSource:v5];

  [(WFWorkflowRunRequest *)v4 setDonateInteraction:0];
  return v4;
}

- (id)runDescriptorForSurface:(unint64_t)a3
{
  unint64_t v3 = self;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }
  id v5 = v4;

  id v6 = [(WFINShortcutContextualAction *)v5 shortcut];

  id v7 = WFWorkflowRunDescriptorForINShortcut(v6);

  return v7;
}

@end