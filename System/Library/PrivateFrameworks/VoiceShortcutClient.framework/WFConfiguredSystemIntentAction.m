@interface WFConfiguredSystemIntentAction
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (INAppIntent)intent;
- (NSArray)contextualParameters;
- (WFConfiguredSystemIntentAction)initWithCoder:(id)a3;
- (WFConfiguredSystemIntentAction)initWithIntent:(id)a3 named:(id)a4 previewIcon:(id)a5 appShortcutIdentifier:(id)a6 contextualParameters:(id)a7 shortcutsMetadata:(id)a8;
- (WFConfiguredSystemIntentAction)initWithIntent:(id)a3 named:(id)a4 previewIcon:(id)a5 appShortcutIdentifier:(id)a6 contextualParameters:(id)a7 shortcutsMetadata:(id)a8 colorScheme:(id)a9;
- (WFExecutableAppShortcutIdentifier)appShortcutIdentifier;
- (id)associatedBundleIdentifier;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAppShortcutIdentifier:(id)a3;
- (void)setContextualParameters:(id)a3;
- (void)setIntent:(id)a3;
@end

@implementation WFConfiguredSystemIntentAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextualParameters, 0);
  objc_storeStrong((id *)&self->_appShortcutIdentifier, 0);
  objc_storeStrong((id *)&self->_intent, 0);
}

- (void)setContextualParameters:(id)a3
{
}

- (NSArray)contextualParameters
{
  return self->_contextualParameters;
}

- (void)setAppShortcutIdentifier:(id)a3
{
}

- (WFExecutableAppShortcutIdentifier)appShortcutIdentifier
{
  return self->_appShortcutIdentifier;
}

- (void)setIntent:(id)a3
{
}

- (INAppIntent)intent
{
  return self->_intent;
}

- (unint64_t)hash
{
  v3 = objc_opt_new();
  v13.receiver = self;
  v13.super_class = (Class)WFConfiguredSystemIntentAction;
  id v4 = (id)objc_msgSend(v3, "combineInteger:", -[WFConfiguredStaccatoAction hash](&v13, sel_hash));
  v5 = [(WFConfiguredSystemIntentAction *)self intent];
  id v6 = (id)[v3 combine:v5];

  v7 = [(WFConfiguredSystemIntentAction *)self appShortcutIdentifier];
  id v8 = (id)[v3 combine:v7];

  v9 = [(WFConfiguredSystemIntentAction *)self contextualParameters];
  id v10 = (id)[v3 combine:v9];

  unint64_t v11 = [v3 finalize];
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WFConfiguredSystemIntentAction *)a3;
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
        v25.receiver = self;
        v25.super_class = (Class)WFConfiguredSystemIntentAction;
        if ([(WFConfiguredStaccatoAction *)&v25 isEqual:v5])
        {
          id v6 = v5;
          v7 = [(WFConfiguredSystemIntentAction *)self intent];
          id v8 = [(WFConfiguredSystemIntentAction *)v6 intent];
          id v9 = v7;
          id v10 = v8;
          unint64_t v11 = v10;
          if (v9 == v10)
          {
          }
          else
          {
            LOBYTE(v12) = 0;
            objc_super v13 = v10;
            id v14 = v9;
            if (!v9 || !v10) {
              goto LABEL_26;
            }
            int v15 = [v9 isEqual:v10];

            if (!v15)
            {
              LOBYTE(v12) = 0;
LABEL_27:

              goto LABEL_28;
            }
          }
          v16 = [(WFConfiguredSystemIntentAction *)self appShortcutIdentifier];
          v17 = [(WFConfiguredSystemIntentAction *)v6 appShortcutIdentifier];
          id v14 = v16;
          id v18 = v17;
          objc_super v13 = v18;
          if (v14 == v18)
          {
          }
          else
          {
            LOBYTE(v12) = 0;
            v19 = v18;
            id v20 = v14;
            if (!v14 || !v18)
            {
LABEL_25:

LABEL_26:
              goto LABEL_27;
            }
            int v12 = [v14 isEqual:v18];

            if (!v12) {
              goto LABEL_26;
            }
          }
          v21 = [(WFConfiguredSystemIntentAction *)self contextualParameters];
          v22 = [(WFConfiguredSystemIntentAction *)v6 contextualParameters];
          id v20 = v21;
          id v23 = v22;
          v19 = v23;
          if (v20 == v23)
          {
            LOBYTE(v12) = 1;
          }
          else
          {
            LOBYTE(v12) = 0;
            if (v20 && v23) {
              LOBYTE(v12) = [v20 isEqualToArray:v23];
            }
          }

          goto LABEL_25;
        }
      }
    }
    LOBYTE(v12) = 0;
  }
LABEL_28:

  return v12;
}

- (id)associatedBundleIdentifier
{
  v3 = [(WFConfiguredStaccatoAction *)self identifier];
  int v4 = [v3 isEqualToString:@"com.apple.springboard.OpenCamera"];

  if (v4)
  {
    v5 = @"com.apple.camera";
    id v6 = @"com.apple.camera";
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)WFConfiguredSystemIntentAction;
    v5 = [(WFConfiguredStaccatoAction *)&v8 associatedBundleIdentifier];
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(WFConfiguredStaccatoAction *)self identifier];
  id v6 = [(WFConfiguredStaccatoAction *)self name];
  v7 = [(WFConfiguredSystemIntentAction *)self associatedBundleIdentifier];
  objc_super v8 = [(WFConfiguredSystemIntentAction *)self appShortcutIdentifier];
  id v9 = [(WFConfiguredSystemIntentAction *)self contextualParameters];
  id v10 = [(WFConfiguredSystemIntentAction *)self intent];
  unint64_t v11 = [v3 stringWithFormat:@"<%@ (%p): id: %@ name: %@, bundle: %@, asi: %@, contextual parameters: %@ intent: %@>", v4, self, v5, v6, v7, v8, v9, v10];

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WFConfiguredSystemIntentAction;
  id v4 = a3;
  [(WFConfiguredStaccatoAction *)&v8 encodeWithCoder:v4];
  v5 = [(WFConfiguredSystemIntentAction *)self intent];
  [v4 encodeObject:v5 forKey:@"intent"];

  id v6 = [(WFConfiguredSystemIntentAction *)self appShortcutIdentifier];
  [v4 encodeObject:v6 forKey:@"appShortcutIdentifier"];

  v7 = [(WFConfiguredSystemIntentAction *)self contextualParameters];
  [v4 encodeObject:v7 forKey:@"contextualParameters"];
}

- (WFConfiguredSystemIntentAction)initWithCoder:(id)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"intent"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appShortcutIdentifier"];
  objc_super v8 = (void *)MEMORY[0x1E4F1CAD0];
  v17[0] = objc_opt_class();
  v17[1] = objc_opt_class();
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  id v10 = [v8 setWithArray:v9];
  unint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"contextualParameters"];

  int v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"previewIcon"];
  objc_super v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shortcutsMetadata"];
  id v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"colorScheme"];

  int v15 = 0;
  if (v6 && v5)
  {
    self = -[WFConfiguredSystemIntentAction initWithIntent:named:previewIcon:appShortcutIdentifier:contextualParameters:shortcutsMetadata:colorScheme:](self, "initWithIntent:named:previewIcon:appShortcutIdentifier:contextualParameters:shortcutsMetadata:colorScheme:", v6, v5, v12, v7, v11, v13, v14, v17[0]);
    int v15 = self;
  }

  return v15;
}

- (WFConfiguredSystemIntentAction)initWithIntent:(id)a3 named:(id)a4 previewIcon:(id)a5 appShortcutIdentifier:(id)a6 contextualParameters:(id)a7 shortcutsMetadata:(id)a8 colorScheme:(id)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v35 = a6;
  id v37 = a6;
  id v19 = a7;
  id v36 = a8;
  id v20 = a9;
  if (v17)
  {
    if (v16) {
      goto LABEL_3;
    }
  }
  else
  {
    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2, self, @"WFConfiguredSystemIntentAction.m", 50, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];

    if (v16) {
      goto LABEL_3;
    }
  }
  v33 = [MEMORY[0x1E4F28B00] currentHandler];
  [v33 handleFailureInMethod:a2, self, @"WFConfiguredSystemIntentAction.m", 51, @"Invalid parameter not satisfying: %@", @"intent" object file lineNumber description];

LABEL_3:
  v21 = NSString;
  [v16 launchId];
  id v23 = v22 = self;
  v24 = [v16 appIntentIdentifier];
  objc_super v25 = [v21 stringWithFormat:@"%@.%@", v23, v24];

  v26 = [v16 launchId];
  v38.receiver = v22;
  v38.super_class = (Class)WFConfiguredSystemIntentAction;
  v27 = [(WFConfiguredStaccatoAction *)&v38 initWithIdentifier:v25 associatedBundleIdentifier:v26 name:v17 previewIcon:v18 shortcutsMetadata:v36 colorScheme:v20];

  if (v27)
  {
    objc_storeStrong((id *)&v27->_intent, a3);
    objc_storeStrong((id *)&v27->_appShortcutIdentifier, v35);
    uint64_t v28 = [v19 copy];
    contextualParameters = v27->_contextualParameters;
    v27->_contextualParameters = (NSArray *)v28;

    v30 = v27;
  }

  return v27;
}

- (WFConfiguredSystemIntentAction)initWithIntent:(id)a3 named:(id)a4 previewIcon:(id)a5 appShortcutIdentifier:(id)a6 contextualParameters:(id)a7 shortcutsMetadata:(id)a8
{
  return [(WFConfiguredSystemIntentAction *)self initWithIntent:a3 named:a4 previewIcon:a5 appShortcutIdentifier:a6 contextualParameters:a7 shortcutsMetadata:a8 colorScheme:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end