@interface WFAppIntentBasedTopHitContextualAction
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)showsUserInterfaceWhenRunning;
- (LNAction)linkAction;
- (LNProperty)parameterValue;
- (NSString)appBundleIdentifier;
- (NSString)extensionBundleIdentifier;
- (WFAppIntentBasedTopHitContextualAction)initWithAction:(id)a3 appBundleIdentifier:(id)a4 extensionBundleIdentifier:(id)a5 authenticationPolicy:(int64_t)a6 associatedAppBundleIdentifier:(id)a7 parameterValue:(id)a8 displayFormatString:(id)a9 title:(id)a10 subtitleFormatString:(id)a11 primaryColor:(unint64_t)a12 icon:(id)a13 accessoryIcon:(id)a14 namedQueryInfo:(id)a15;
- (WFAppIntentBasedTopHitContextualAction)initWithCoder:(id)a3;
- (id)uniqueIdentifier;
- (int64_t)authenticationPolicy;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFAppIntentBasedTopHitContextualAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_parameterValue, 0);
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

- (LNProperty)parameterValue
{
  return self->_parameterValue;
}

- (LNAction)linkAction
{
  return self->_linkAction;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFAppIntentBasedTopHitContextualAction;
  id v4 = a3;
  [(WFContextualAction *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_linkAction, @"linkAction", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_parameterValue forKey:@"parameterValue"];
  [v4 encodeObject:self->_appBundleIdentifier forKey:@"appBundleIdentifier"];
  [v4 encodeObject:self->_extensionBundleIdentifier forKey:@"extensionBundleIdentifier"];
  [v4 encodeInteger:self->_authenticationPolicy forKey:@"authenticationPolicy"];
}

- (WFAppIntentBasedTopHitContextualAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFAppIntentBasedTopHitContextualAction;
  objc_super v5 = [(WFContextualAction *)&v14 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appBundleIdentifier"];
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"extensionBundleIdentifier"];
    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"linkAction"];
    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parameterValue"];
    uint64_t v10 = [v4 decodeIntegerForKey:@"authenticationPolicy"];
    v11 = 0;
    if (v6 && v8)
    {
      int64_t v12 = v10;
      objc_storeStrong((id *)&v5->_linkAction, v8);
      objc_storeStrong((id *)&v5->_parameterValue, v9);
      objc_storeStrong((id *)&v5->_appBundleIdentifier, v6);
      objc_storeStrong((id *)&v5->_extensionBundleIdentifier, v7);
      v5->_authenticationPolicy = v12;
      v11 = v5;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)WFAppIntentBasedTopHitContextualAction;
  if ([(WFTopHitItemContextualAction *)&v35 isEqual:v4])
  {
    id v5 = v4;
    if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v11) = 0;
LABEL_37:

      goto LABEL_38;
    }
    v6 = [v5 appBundleIdentifier];
    v7 = [(WFAppIntentBasedTopHitContextualAction *)self appBundleIdentifier];
    id v8 = v6;
    id v9 = v7;
    uint64_t v10 = v9;
    if (v8 == v9)
    {
    }
    else
    {
      LOBYTE(v11) = 0;
      int64_t v12 = v9;
      id v13 = v8;
      if (!v8 || !v9) {
        goto LABEL_35;
      }
      int v14 = [v8 isEqualToString:v9];

      if (!v14)
      {
        LOBYTE(v11) = 0;
LABEL_36:

        goto LABEL_37;
      }
    }
    v15 = [v5 extensionBundleIdentifier];
    v16 = [(WFAppIntentBasedTopHitContextualAction *)self extensionBundleIdentifier];
    id v13 = v15;
    id v17 = v16;
    int64_t v12 = v17;
    if (v13 == v17)
    {
    }
    else
    {
      LOBYTE(v11) = 0;
      v18 = v17;
      id v19 = v13;
      if (!v13 || !v17) {
        goto LABEL_34;
      }
      int v20 = [v13 isEqualToString:v17];

      if (!v20)
      {
        LOBYTE(v11) = 0;
LABEL_35:

        goto LABEL_36;
      }
    }
    v21 = [v5 linkAction];
    v22 = [(WFAppIntentBasedTopHitContextualAction *)self linkAction];
    id v19 = v21;
    id v23 = v22;
    v18 = v23;
    id v34 = v19;
    if (v19 == v23)
    {
    }
    else
    {
      LOBYTE(v11) = 0;
      v24 = v23;
      if (!v19 || !v23) {
        goto LABEL_33;
      }
      LODWORD(v11) = [v19 isEqual:v23];

      if (!v11) {
        goto LABEL_34;
      }
    }
    v25 = [v5 parameterValue];
    v32 = [(WFAppIntentBasedTopHitContextualAction *)self parameterValue];
    id v11 = v25;
    id v26 = v32;
    if (v11 == v26)
    {
      id v31 = v26;

      id v33 = v11;
    }
    else
    {
      if (!v11 || !v26)
      {
        id v28 = v26;

        v24 = v28;
        id v19 = v11;
        LOBYTE(v11) = 0;
        goto LABEL_33;
      }
      v27 = v26;
      int v30 = [v11 isEqual:v26];
      id v31 = v27;

      id v33 = v11;
      if (!v30)
      {
        LOBYTE(v11) = 0;
LABEL_31:
        v24 = v31;
        id v19 = v33;
LABEL_33:

        id v19 = v34;
LABEL_34:

        goto LABEL_35;
      }
    }
    id v11 = (id)[v5 authenticationPolicy];
    LOBYTE(v11) = v11 == (id)[(WFAppIntentBasedTopHitContextualAction *)self authenticationPolicy];
    goto LABEL_31;
  }
  LOBYTE(v11) = 0;
LABEL_38:

  return (char)v11;
}

- (unint64_t)hash
{
  v3 = objc_opt_new();
  v18.receiver = self;
  v18.super_class = (Class)WFAppIntentBasedTopHitContextualAction;
  id v4 = (id)objc_msgSend(v3, "combineInteger:", -[WFTopHitItemContextualAction hash](&v18, sel_hash));
  id v5 = [(WFAppIntentBasedTopHitContextualAction *)self linkAction];
  id v6 = (id)[v3 combine:v5];

  v7 = [(WFAppIntentBasedTopHitContextualAction *)self appBundleIdentifier];
  id v8 = (id)[v3 combineContentsOfPropertyListObject:v7];

  id v9 = [(WFAppIntentBasedTopHitContextualAction *)self extensionBundleIdentifier];

  if (v9)
  {
    uint64_t v10 = [(WFAppIntentBasedTopHitContextualAction *)self extensionBundleIdentifier];
    id v11 = (id)[v3 combineContentsOfPropertyListObject:v10];
  }
  id v12 = (id)objc_msgSend(v3, "combineInteger:", -[WFAppIntentBasedTopHitContextualAction authenticationPolicy](self, "authenticationPolicy"));
  id v13 = [(WFAppIntentBasedTopHitContextualAction *)self parameterValue];

  if (v13)
  {
    int v14 = [(WFAppIntentBasedTopHitContextualAction *)self parameterValue];
    id v15 = (id)[v3 combine:v14];
  }
  unint64_t v16 = [v3 finalize];

  return v16;
}

- (BOOL)showsUserInterfaceWhenRunning
{
  return 1;
}

- (WFAppIntentBasedTopHitContextualAction)initWithAction:(id)a3 appBundleIdentifier:(id)a4 extensionBundleIdentifier:(id)a5 authenticationPolicy:(int64_t)a6 associatedAppBundleIdentifier:(id)a7 parameterValue:(id)a8 displayFormatString:(id)a9 title:(id)a10 subtitleFormatString:(id)a11 primaryColor:(unint64_t)a12 icon:(id)a13 accessoryIcon:(id)a14 namedQueryInfo:(id)a15
{
  v56[2] = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v20 = a4;
  id v49 = a5;
  id v48 = a7;
  id v45 = a8;
  id v21 = a8;
  v22 = v19;
  id v23 = v21;
  id v47 = a9;
  id v46 = a10;
  id v54 = a11;
  id v53 = a13;
  id v52 = a14;
  id v51 = a15;
  if (!v19)
  {
    v41 = [MEMORY[0x1E4F28B00] currentHandler];
    [v41 handleFailureInMethod:a2, self, @"WFAppIntentBasedTopHitContextualAction.m", 47, @"Invalid parameter not satisfying: %@", @"action" object file lineNumber description];
  }
  v56[0] = v20;
  v24 = [v19 identifier];
  v56[1] = v24;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:2];
  id v26 = [v25 componentsJoinedByString:@"."];

  if (v23)
  {
    v55[0] = v26;
    v27 = [v23 identifier];
    v55[1] = v27;
    id v28 = [v23 value];
    [v28 value];
    int v30 = v29 = v20;
    v55[2] = v30;
    id v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:3];
    id v32 = [v31 componentsJoinedByString:@":"];

    id v20 = v29;
  }
  else
  {
    id v32 = v26;
  }
  id v33 = [(WFTopHitItemContextualAction *)self initWithItem:v22 identifier:v26 wfActionIdentifier:&stru_1F0C7EBE0 associatedAppBundleIdentifier:v48 parameters:MEMORY[0x1E4F1CBF0] displayFormatString:v47 title:v46 subtitleFormatString:v54 primaryColor:a12 icon:v53 accessoryIcon:v52 namedQueryInfo:v51];
  id v34 = v33;
  if (v33)
  {
    objc_storeStrong((id *)&v33->_linkAction, a3);
    uint64_t v35 = [v20 copy];
    appBundleIdentifier = v34->_appBundleIdentifier;
    v34->_appBundleIdentifier = (NSString *)v35;

    uint64_t v37 = [v49 copy];
    extensionBundleIdentifier = v34->_extensionBundleIdentifier;
    v34->_extensionBundleIdentifier = (NSString *)v37;

    v34->_authenticationPolicy = a6;
    objc_storeStrong((id *)&v34->_parameterValue, v45);
    v39 = v34;
  }

  return v34;
}

- (id)uniqueIdentifier
{
  v14[3] = *MEMORY[0x1E4F143B8];
  v3 = [(WFAppIntentBasedTopHitContextualAction *)self parameterValue];

  uint64_t v4 = [(WFContextualAction *)self identifier];
  id v5 = (void *)v4;
  if (v3)
  {
    id v6 = [(WFAppIntentBasedTopHitContextualAction *)self parameterValue];
    v7 = [v6 identifier];
    v14[1] = v7;
    id v8 = [(WFAppIntentBasedTopHitContextualAction *)self parameterValue];
    id v9 = [v8 value];
    uint64_t v10 = [v9 value];
    v14[2] = v10;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:3];
    uint64_t v12 = [v11 componentsJoinedByString:@":"];

    id v5 = (void *)v12;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end