@interface WFLinkContextualAction
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)showsUserInterfaceWhenRunning;
- (LNAction)linkAction;
- (NSString)appBundleIdentifier;
- (NSString)extensionBundleIdentifier;
- (WFLinkContextualAction)initWithAction:(id)a3 appBundleIdentifier:(id)a4 extensionBundleIdentifier:(id)a5 authenticationPolicy:(int64_t)a6;
- (WFLinkContextualAction)initWithAction:(id)a3 appBundleIdentifier:(id)a4 extensionBundleIdentifier:(id)a5 contextualParameters:(id)a6 authenticationPolicy:(int64_t)a7 icon:(id)a8;
- (WFLinkContextualAction)initWithAction:(id)a3 bundleIdentifier:(id)a4;
- (WFLinkContextualAction)initWithCoder:(id)a3;
- (id)copyWithParameters:(id)a3;
- (id)workflowRunKind;
- (int64_t)authenticationPolicy;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)wf_launchAppIfNeededUsingSurface:(unint64_t)a3;
@end

@implementation WFLinkContextualAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_linkAction, 0);
}

- (int64_t)authenticationPolicy
{
  return self->_authenticationPolicy;
}

- (NSString)extensionBundleIdentifier
{
  return self->_extensionBundleIdentifier;
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (LNAction)linkAction
{
  return self->_linkAction;
}

- (id)workflowRunKind
{
  v2 = @"AppIntent";
  return @"AppIntent";
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFLinkContextualAction;
  id v4 = a3;
  [(WFContextualAction *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_linkAction, @"linkAction", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_appBundleIdentifier forKey:@"appBundleIdentifier"];
  [v4 encodeObject:self->_extensionBundleIdentifier forKey:@"extensionBundleIdentifier"];
  [v4 encodeInteger:self->_authenticationPolicy forKey:@"authenticationPolicy"];
}

- (WFLinkContextualAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WFLinkContextualAction;
  objc_super v5 = [(WFContextualAction *)&v13 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appBundleIdentifier"];
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"extensionBundleIdentifier"];
    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"linkAction"];
    uint64_t v9 = [v4 decodeIntegerForKey:@"authenticationPolicy"];
    v10 = 0;
    if (v6 && v8)
    {
      int64_t v11 = v9;
      objc_storeStrong((id *)&v5->_linkAction, v8);
      objc_storeStrong((id *)&v5->_appBundleIdentifier, v6);
      objc_storeStrong((id *)&v5->_extensionBundleIdentifier, v7);
      v5->_authenticationPolicy = v11;
      v10 = v5;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)WFLinkContextualAction;
  if ([(WFContextualAction *)&v25 isEqual:v4])
  {
    id v5 = v4;
    if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v11) = 0;
LABEL_29:

      goto LABEL_30;
    }
    v6 = [v5 appBundleIdentifier];
    v7 = [(WFLinkContextualAction *)self appBundleIdentifier];
    id v8 = v6;
    id v9 = v7;
    v10 = v9;
    if (v8 == v9)
    {
    }
    else
    {
      LOBYTE(v11) = 0;
      v12 = v9;
      id v13 = v8;
      if (!v8 || !v9) {
        goto LABEL_27;
      }
      int v14 = [v8 isEqualToString:v9];

      if (!v14)
      {
        LOBYTE(v11) = 0;
LABEL_28:

        goto LABEL_29;
      }
    }
    v15 = [v5 extensionBundleIdentifier];
    v16 = [(WFLinkContextualAction *)self extensionBundleIdentifier];
    id v13 = v15;
    id v17 = v16;
    v12 = v17;
    if (v13 == v17)
    {
    }
    else
    {
      LOBYTE(v11) = 0;
      v18 = v17;
      id v19 = v13;
      if (!v13 || !v17) {
        goto LABEL_26;
      }
      int v20 = [v13 isEqualToString:v17];

      if (!v20)
      {
        LOBYTE(v11) = 0;
LABEL_27:

        goto LABEL_28;
      }
    }
    v21 = [v5 linkAction];
    v22 = [(WFLinkContextualAction *)self linkAction];
    id v19 = v21;
    id v23 = v22;
    v18 = v23;
    if (v19 == v23)
    {
    }
    else
    {
      if (!v19 || !v23)
      {

        LOBYTE(v11) = 0;
        goto LABEL_26;
      }
      LODWORD(v11) = [v19 isEqual:v23];

      if (!v11) {
        goto LABEL_26;
      }
    }
    uint64_t v11 = [v5 authenticationPolicy];
    LOBYTE(v11) = v11 == [(WFLinkContextualAction *)self authenticationPolicy];
LABEL_26:

    goto LABEL_27;
  }
  LOBYTE(v11) = 0;
LABEL_30:

  return v11;
}

- (unint64_t)hash
{
  v3 = objc_opt_new();
  v14.receiver = self;
  v14.super_class = (Class)WFLinkContextualAction;
  id v4 = (id)objc_msgSend(v3, "combineInteger:", -[WFContextualAction hash](&v14, sel_hash));
  id v5 = [(WFLinkContextualAction *)self appBundleIdentifier];
  id v6 = (id)[v3 combineContentsOfPropertyListObject:v5];

  v7 = [(WFLinkContextualAction *)self extensionBundleIdentifier];
  id v8 = (id)[v3 combineContentsOfPropertyListObject:v7];

  id v9 = [(WFLinkContextualAction *)self linkAction];
  id v10 = (id)[v3 combine:v9];

  id v11 = (id)objc_msgSend(v3, "combineInteger:", -[WFLinkContextualAction authenticationPolicy](self, "authenticationPolicy"));
  unint64_t v12 = [v3 finalize];

  return v12;
}

- (BOOL)showsUserInterfaceWhenRunning
{
  return 1;
}

- (id)copyWithParameters:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  id v6 = [(WFLinkContextualAction *)self linkAction];
  v7 = [(WFLinkContextualAction *)self appBundleIdentifier];
  id v8 = [(WFLinkContextualAction *)self extensionBundleIdentifier];
  int64_t v9 = [(WFLinkContextualAction *)self authenticationPolicy];
  id v10 = [(WFContextualAction *)self icon];
  id v11 = (void *)[v5 initWithAction:v6 appBundleIdentifier:v7 extensionBundleIdentifier:v8 contextualParameters:v4 authenticationPolicy:v9 icon:v10];

  return v11;
}

- (WFLinkContextualAction)initWithAction:(id)a3 appBundleIdentifier:(id)a4 extensionBundleIdentifier:(id)a5 contextualParameters:(id)a6 authenticationPolicy:(int64_t)a7 icon:(id)a8
{
  v37[2] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  if (v15)
  {
    if (v16) {
      goto LABEL_3;
    }
  }
  else
  {
    v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2, self, @"WFLinkContextualAction.m", 28, @"Invalid parameter not satisfying: %@", @"action" object file lineNumber description];

    if (v16) {
      goto LABEL_3;
    }
  }
  v35 = [MEMORY[0x1E4F28B00] currentHandler];
  [v35 handleFailureInMethod:a2, self, @"WFLinkContextualAction.m", 29, @"Invalid parameter not satisfying: %@", @"appBundleIdentifier" object file lineNumber description];

LABEL_3:
  v37[0] = v16;
  int v20 = [v15 identifier];
  v37[1] = v20;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
  v22 = [v21 componentsJoinedByString:@"."];

  uint64_t v23 = [v18 copy];
  v24 = (void *)v23;
  objc_super v25 = (void *)MEMORY[0x1E4F1CBF0];
  if (v23) {
    objc_super v25 = (void *)v23;
  }
  id v26 = v25;

  v27 = [(WFContextualAction *)self initWithIdentifier:v22 wfActionIdentifier:&stru_1F0C7EBE0 associatedAppBundleIdentifier:v16 parameters:v26 displayFormatString:@"Run Link Action" title:@"Run Link Action" subtitleFormatString:0 icon:v19];
  if (v27)
  {
    objc_storeStrong((id *)&v27->_linkAction, a3);
    uint64_t v28 = [v16 copy];
    appBundleIdentifier = v27->_appBundleIdentifier;
    v27->_appBundleIdentifier = (NSString *)v28;

    uint64_t v30 = [v17 copy];
    extensionBundleIdentifier = v27->_extensionBundleIdentifier;
    v27->_extensionBundleIdentifier = (NSString *)v30;

    v27->_authenticationPolicy = a7;
    v32 = v27;
  }

  return v27;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WFLinkContextualAction)initWithAction:(id)a3 bundleIdentifier:(id)a4
{
  return [(WFLinkContextualAction *)self initWithAction:a3 appBundleIdentifier:a4 extensionBundleIdentifier:0 authenticationPolicy:0];
}

- (WFLinkContextualAction)initWithAction:(id)a3 appBundleIdentifier:(id)a4 extensionBundleIdentifier:(id)a5 authenticationPolicy:(int64_t)a6
{
  return [(WFLinkContextualAction *)self initWithAction:a3 appBundleIdentifier:a4 extensionBundleIdentifier:a5 contextualParameters:0 authenticationPolicy:a6 icon:0];
}

- (void)wf_launchAppIfNeededUsingSurface:(unint64_t)a3
{
  id v8 = [(WFLinkContextualAction *)self linkAction];
  id v5 = [(WFLinkContextualAction *)self appBundleIdentifier];
  id v6 = [(WFLinkContextualAction *)self linkAction];
  v7 = [v6 identifier];
  [(WFContextualAction *)self wf_launchAppIfNeededUsingSurface:a3 linkAction:v8 appBundleIdentifier:v5 actionIdentifier:v7];
}

@end