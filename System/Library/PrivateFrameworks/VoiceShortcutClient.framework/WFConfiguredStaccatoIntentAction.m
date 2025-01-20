@interface WFConfiguredStaccatoIntentAction
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)templateParameterValues;
- (WFConfiguredStaccatoIntentAction)initWithCoder:(id)a3;
- (WFConfiguredStaccatoIntentAction)initWithIntent:(id)a3 named:(id)a4 previewIcon:(id)a5 appShortcutIdentifier:(id)a6 templateParameterValues:(id)a7 contextualParameters:(id)a8 shortcutsMetadata:(id)a9;
- (WFConfiguredStaccatoIntentAction)initWithIntent:(id)a3 named:(id)a4 previewIcon:(id)a5 appShortcutIdentifier:(id)a6 templateParameterValues:(id)a7 contextualParameters:(id)a8 shortcutsMetadata:(id)a9 colorScheme:(id)a10;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFConfiguredStaccatoIntentAction

- (void).cxx_destruct
{
}

- (NSDictionary)templateParameterValues
{
  return self->_templateParameterValues;
}

- (unint64_t)hash
{
  v3 = objc_opt_new();
  v11.receiver = self;
  v11.super_class = (Class)WFConfiguredStaccatoIntentAction;
  id v4 = (id)objc_msgSend(v3, "combineInteger:", -[WFConfiguredSystemIntentAction hash](&v11, sel_hash));
  v5 = [(WFConfiguredStaccatoAction *)self sectionIdentifier];
  id v6 = (id)[v3 combine:v5];

  v7 = [(WFConfiguredStaccatoIntentAction *)self templateParameterValues];
  id v8 = (id)[v3 combine:v7];

  unint64_t v9 = [v3 finalize];
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WFConfiguredStaccatoIntentAction *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v12 = 1;
  }
  else if (v4 {
         && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
  }
         && (v14.receiver = self,
             v14.super_class = (Class)WFConfiguredStaccatoIntentAction,
             [(WFConfiguredSystemIntentAction *)&v14 isEqual:v5]))
  {
    id v6 = v5;
    v7 = [(WFConfiguredStaccatoIntentAction *)self templateParameterValues];
    id v8 = [(WFConfiguredStaccatoIntentAction *)v6 templateParameterValues];
    id v9 = v7;
    id v10 = v8;
    objc_super v11 = v10;
    if (v9 == v10)
    {
      char v12 = 1;
    }
    else
    {
      char v12 = 0;
      if (v9 && v10) {
        char v12 = [v9 isEqual:v10];
      }
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFConfiguredStaccatoIntentAction;
  id v4 = a3;
  [(WFConfiguredSystemIntentAction *)&v7 encodeWithCoder:v4];
  v5 = [(WFConfiguredStaccatoAction *)self sectionIdentifier];
  [v4 encodeObject:v5 forKey:@"sectionIdentifier"];

  id v6 = [(WFConfiguredStaccatoIntentAction *)self templateParameterValues];
  [v4 encodeObject:v6 forKey:@"templateParameterValues"];
}

- (WFConfiguredStaccatoIntentAction)initWithCoder:(id)a3
{
  v23[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"previewIcon"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"intent"];
  objc_super v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appShortcutIdentifier"];
  id v8 = (void *)MEMORY[0x1E4F1CAD0];
  v23[0] = objc_opt_class();
  v23[1] = objc_opt_class();
  v23[2] = objc_opt_class();
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:3];
  id v10 = [v8 setWithArray:v9];
  objc_super v11 = [v4 decodeObjectOfClasses:v10 forKey:@"templateParameterValues"];

  char v12 = (void *)MEMORY[0x1E4F1CAD0];
  v22[0] = objc_opt_class();
  v22[1] = objc_opt_class();
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  objc_super v14 = [v12 setWithArray:v13];
  v15 = [v4 decodeObjectOfClasses:v14 forKey:@"contextualParameters"];

  v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shortcutsMetadata"];
  v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"colorScheme"];

  v18 = 0;
  if (v6 && v5)
  {
    v19 = (void *)v21;
    self = [(WFConfiguredStaccatoIntentAction *)self initWithIntent:v6 named:v5 previewIcon:v21 appShortcutIdentifier:v7 templateParameterValues:v11 contextualParameters:v15 shortcutsMetadata:v16 colorScheme:v17];
    v18 = self;
  }
  else
  {
    v19 = (void *)v21;
  }

  return v18;
}

- (WFConfiguredStaccatoIntentAction)initWithIntent:(id)a3 named:(id)a4 previewIcon:(id)a5 appShortcutIdentifier:(id)a6 templateParameterValues:(id)a7 contextualParameters:(id)a8 shortcutsMetadata:(id)a9 colorScheme:(id)a10
{
  v16 = (NSDictionary *)a7;
  v20.receiver = self;
  v20.super_class = (Class)WFConfiguredStaccatoIntentAction;
  v17 = [(WFConfiguredSystemIntentAction *)&v20 initWithIntent:a3 named:a4 previewIcon:a5 appShortcutIdentifier:a6 contextualParameters:a8 shortcutsMetadata:a9 colorScheme:a10];
  templateParameterValues = v17->_templateParameterValues;
  v17->_templateParameterValues = v16;

  return v17;
}

- (WFConfiguredStaccatoIntentAction)initWithIntent:(id)a3 named:(id)a4 previewIcon:(id)a5 appShortcutIdentifier:(id)a6 templateParameterValues:(id)a7 contextualParameters:(id)a8 shortcutsMetadata:(id)a9
{
  return [(WFConfiguredStaccatoIntentAction *)self initWithIntent:a3 named:a4 previewIcon:a5 appShortcutIdentifier:a6 templateParameterValues:a7 contextualParameters:a8 shortcutsMetadata:a9 colorScheme:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end