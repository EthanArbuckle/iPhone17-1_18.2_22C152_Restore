@interface WFStaccatoActionTemplateParameter
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToActionTemplateParameter:(id)a3;
- (NSString)actionIdentifier;
- (NSString)key;
- (NSString)localizedDescription;
- (NSString)localizedLabel;
- (WFStaccatoActionTemplateParameter)initWithCoder:(id)a3;
- (WFStaccatoActionTemplateParameter)initWithKey:(id)a3 actionIdentifier:(id)a4 localizedLabel:(id)a5 localizedDescription:(id)a6 defaultValue:(id)a7;
- (WFStaccatoActionTemplateParameterValue)defaultValue;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setActionIdentifier:(id)a3;
- (void)setDefaultValue:(id)a3;
- (void)setKey:(id)a3;
- (void)setLocalizedDescription:(id)a3;
- (void)setLocalizedLabel:(id)a3;
@end

@implementation WFStaccatoActionTemplateParameter

- (WFStaccatoActionTemplateParameter)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"key"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionIdentifier"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedLabel"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedDescription"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"defaultValue"];

  v10 = 0;
  if (v5 && v6 && v7)
  {
    self = [(WFStaccatoActionTemplateParameter *)self initWithKey:v5 actionIdentifier:v6 localizedLabel:v7 localizedDescription:v8 defaultValue:v9];
    v10 = self;
  }

  return v10;
}

- (WFStaccatoActionTemplateParameter)initWithKey:(id)a3 actionIdentifier:(id)a4 localizedLabel:(id)a5 localizedDescription:(id)a6 defaultValue:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
LABEL_8:
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"WFStaccatoActionTemplateParameter.m", 36, @"Invalid parameter not satisfying: %@", @"actionIdentifier" object file lineNumber description];

    if (v15) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v29 = [MEMORY[0x1E4F28B00] currentHandler];
  [v29 handleFailureInMethod:a2, self, @"WFStaccatoActionTemplateParameter.m", 35, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];

  if (!v14) {
    goto LABEL_8;
  }
LABEL_3:
  if (v15) {
    goto LABEL_4;
  }
LABEL_9:
  v31 = [MEMORY[0x1E4F28B00] currentHandler];
  [v31 handleFailureInMethod:a2, self, @"WFStaccatoActionTemplateParameter.m", 37, @"Invalid parameter not satisfying: %@", @"localizedLabel" object file lineNumber description];

LABEL_4:
  v32.receiver = self;
  v32.super_class = (Class)WFStaccatoActionTemplateParameter;
  v18 = [(WFStaccatoActionTemplateParameter *)&v32 init];
  if (v18)
  {
    uint64_t v19 = [v13 copy];
    key = v18->_key;
    v18->_key = (NSString *)v19;

    uint64_t v21 = [v14 copy];
    actionIdentifier = v18->_actionIdentifier;
    v18->_actionIdentifier = (NSString *)v21;

    uint64_t v23 = [v15 copy];
    localizedLabel = v18->_localizedLabel;
    v18->_localizedLabel = (NSString *)v23;

    uint64_t v25 = [v16 copy];
    localizedDescription = v18->_localizedDescription;
    v18->_localizedDescription = (NSString *)v25;

    objc_storeStrong((id *)&v18->_defaultValue, a7);
    v27 = v18;
  }

  return v18;
}

- (unint64_t)hash
{
  v3 = objc_opt_new();
  id v4 = [(WFStaccatoActionTemplateParameter *)self key];
  id v5 = (id)[v3 combine:v4];

  v6 = [(WFStaccatoActionTemplateParameter *)self actionIdentifier];
  id v7 = (id)[v3 combine:v6];

  v8 = [(WFStaccatoActionTemplateParameter *)self localizedLabel];
  id v9 = (id)[v3 combine:v8];

  v10 = [(WFStaccatoActionTemplateParameter *)self localizedDescription];
  id v11 = (id)[v3 combine:v10];

  v12 = [(WFStaccatoActionTemplateParameter *)self defaultValue];
  id v13 = (id)[v3 combine:v12];

  unint64_t v14 = [v3 finalize];
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(WFStaccatoActionTemplateParameter *)self key];
  [v4 encodeObject:v5 forKey:@"key"];

  v6 = [(WFStaccatoActionTemplateParameter *)self actionIdentifier];
  [v4 encodeObject:v6 forKey:@"actionIdentifier"];

  id v7 = [(WFStaccatoActionTemplateParameter *)self localizedLabel];
  [v4 encodeObject:v7 forKey:@"localizedLabel"];

  v8 = [(WFStaccatoActionTemplateParameter *)self localizedDescription];
  [v4 encodeObject:v8 forKey:@"localizedDescription"];

  id v9 = [(WFStaccatoActionTemplateParameter *)self defaultValue];
  [v4 encodeObject:v9 forKey:@"defaultValue"];
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (NSString)key
{
  return self->_key;
}

- (NSString)localizedLabel
{
  return self->_localizedLabel;
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (WFStaccatoActionTemplateParameterValue)defaultValue
{
  return self->_defaultValue;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultValue, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_localizedLabel, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)setDefaultValue:(id)a3
{
}

- (void)setLocalizedDescription:(id)a3
{
}

- (void)setLocalizedLabel:(id)a3
{
}

- (void)setActionIdentifier:(id)a3
{
}

- (void)setKey:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(WFStaccatoActionTemplateParameter *)self isEqualToActionTemplateParameter:v4];

  return v5;
}

- (BOOL)isEqualToActionTemplateParameter:(id)a3
{
  id v4 = (WFStaccatoActionTemplateParameter *)a3;
  BOOL v5 = v4;
  if (v4 == self)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    if (v4)
    {
      v6 = [(WFStaccatoActionTemplateParameter *)self key];
      id v7 = [(WFStaccatoActionTemplateParameter *)v5 key];
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
          goto LABEL_40;
        }
        int v14 = [v8 isEqualToString:v9];

        if (!v14)
        {
          LOBYTE(v11) = 0;
LABEL_41:

          goto LABEL_42;
        }
      }
      id v15 = [(WFStaccatoActionTemplateParameter *)self actionIdentifier];
      id v16 = [(WFStaccatoActionTemplateParameter *)v5 actionIdentifier];
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
          goto LABEL_39;
        }
        int v20 = [v13 isEqualToString:v17];

        if (!v20)
        {
          LOBYTE(v11) = 0;
LABEL_40:

          goto LABEL_41;
        }
      }
      uint64_t v21 = [(WFStaccatoActionTemplateParameter *)self localizedLabel];
      v22 = [(WFStaccatoActionTemplateParameter *)v5 localizedLabel];
      id v19 = v21;
      id v23 = v22;
      v18 = v23;
      if (v19 == v23)
      {
      }
      else
      {
        LOBYTE(v11) = 0;
        v24 = v23;
        uint64_t v25 = v19;
        if (!v19 || !v23) {
          goto LABEL_38;
        }
        int v11 = [v19 isEqualToString:v23];

        if (!v11) {
          goto LABEL_39;
        }
      }
      v26 = [(WFStaccatoActionTemplateParameter *)self localizedDescription];
      v27 = [(WFStaccatoActionTemplateParameter *)v5 localizedDescription];
      id v28 = v26;
      id v29 = v27;
      v30 = v28;
      v39 = v28;
      v40 = v29;
      if (v28 != v29)
      {
        LOBYTE(v11) = 0;
        if (v30)
        {
          v31 = v29;
          if (v29)
          {
            uint64_t v25 = v39;
            int v38 = [v39 isEqualToString:v29];

            if (!v38)
            {
              LOBYTE(v11) = 0;
LABEL_37:
              v24 = v40;
LABEL_38:

LABEL_39:
              goto LABEL_40;
            }
            goto LABEL_29;
          }
        }
        else
        {
          v31 = v29;
        }
LABEL_36:

        uint64_t v25 = v39;
        goto LABEL_37;
      }

LABEL_29:
      objc_super v32 = [(WFStaccatoActionTemplateParameter *)self defaultValue];
      v33 = [(WFStaccatoActionTemplateParameter *)v5 defaultValue];
      id v34 = v32;
      id v35 = v33;
      v36 = v35;
      if (v34 == v35)
      {
        LOBYTE(v11) = 1;
      }
      else
      {
        LOBYTE(v11) = 0;
        if (v34 && v35) {
          LOBYTE(v11) = [v34 isEqual:v35];
        }
      }

      v31 = v36;
      v30 = v34;
      goto LABEL_36;
    }
    LOBYTE(v11) = 0;
  }
LABEL_42:

  return v11;
}

- (id)description
{
  v3 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)WFStaccatoActionTemplateParameter;
  id v4 = [(WFStaccatoActionTemplateParameter *)&v12 description];
  BOOL v5 = [(WFStaccatoActionTemplateParameter *)self key];
  v6 = [(WFStaccatoActionTemplateParameter *)self actionIdentifier];
  id v7 = [(WFStaccatoActionTemplateParameter *)self localizedLabel];
  id v8 = [(WFStaccatoActionTemplateParameter *)self localizedDescription];
  id v9 = [(WFStaccatoActionTemplateParameter *)self defaultValue];
  v10 = [v3 stringWithFormat:@"<%@: key: %@, action: %@, label: %@, description: %@, default: %@>", v4, v5, v6, v7, v8, v9];

  return v10;
}

@end