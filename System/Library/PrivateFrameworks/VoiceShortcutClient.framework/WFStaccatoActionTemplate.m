@interface WFStaccatoActionTemplate
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToActionTemplate:(id)a3;
- (NSArray)parameters;
- (NSString)actionIdentifier;
- (NSString)identifier;
- (NSString)localizedDescription;
- (NSString)localizedTitle;
- (NSString)sectionIdentifier;
- (WFStaccatoActionTemplate)initWithCoder:(id)a3;
- (WFStaccatoActionTemplate)initWithIdentifier:(id)a3 sectionIdentifier:(id)a4 actionIdentifier:(id)a5 localizedTitle:(id)a6 localizedDescription:(id)a7 parameters:(id)a8;
- (id)description;
- (id)tintColor;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setActionIdentifier:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLocalizedDescription:(id)a3;
- (void)setLocalizedTitle:(id)a3;
- (void)setParameters:(id)a3;
@end

@implementation WFStaccatoActionTemplate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (WFStaccatoActionTemplate)initWithIdentifier:(id)a3 sectionIdentifier:(id)a4 actionIdentifier:(id)a5 localizedTitle:(id)a6 localizedDescription:(id)a7 parameters:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
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
    v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2, self, @"WFStaccatoActionTemplate.m", 37, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

    if (v16)
    {
LABEL_3:
      if (v17) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  v35 = [MEMORY[0x1E4F28B00] currentHandler];
  [v35 handleFailureInMethod:a2, self, @"WFStaccatoActionTemplate.m", 38, @"Invalid parameter not satisfying: %@", @"sectionIdentifier" object file lineNumber description];

  if (v17)
  {
LABEL_4:
    if (v18) {
      goto LABEL_5;
    }
LABEL_12:
    v37 = [MEMORY[0x1E4F28B00] currentHandler];
    [v37 handleFailureInMethod:a2, self, @"WFStaccatoActionTemplate.m", 40, @"Invalid parameter not satisfying: %@", @"localizedTitle" object file lineNumber description];

    if (v20) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_11:
  v36 = [MEMORY[0x1E4F28B00] currentHandler];
  [v36 handleFailureInMethod:a2, self, @"WFStaccatoActionTemplate.m", 39, @"Invalid parameter not satisfying: %@", @"actionIdentifier" object file lineNumber description];

  if (!v18) {
    goto LABEL_12;
  }
LABEL_5:
  if (v20) {
    goto LABEL_6;
  }
LABEL_13:
  v38 = [MEMORY[0x1E4F28B00] currentHandler];
  [v38 handleFailureInMethod:a2, self, @"WFStaccatoActionTemplate.m", 41, @"Invalid parameter not satisfying: %@", @"parameters" object file lineNumber description];

LABEL_6:
  v39.receiver = self;
  v39.super_class = (Class)WFStaccatoActionTemplate;
  v21 = [(WFStaccatoActionTemplate *)&v39 init];
  if (v21)
  {
    uint64_t v22 = [v15 copy];
    identifier = v21->_identifier;
    v21->_identifier = (NSString *)v22;

    uint64_t v24 = [v16 copy];
    sectionIdentifier = v21->_sectionIdentifier;
    v21->_sectionIdentifier = (NSString *)v24;

    uint64_t v26 = [v17 copy];
    actionIdentifier = v21->_actionIdentifier;
    v21->_actionIdentifier = (NSString *)v26;

    uint64_t v28 = [v18 copy];
    localizedTitle = v21->_localizedTitle;
    v21->_localizedTitle = (NSString *)v28;

    uint64_t v30 = [v19 copy];
    localizedDescription = v21->_localizedDescription;
    v21->_localizedDescription = (NSString *)v30;

    objc_storeStrong((id *)&v21->_parameters, a8);
    v32 = v21;
  }

  return v21;
}

- (WFStaccatoActionTemplate)initWithCoder:(id)a3
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sectionIdentifier"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionIdentifier"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedTitle"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedDescription"];
  v10 = (void *)MEMORY[0x1E4F1CAD0];
  v16[0] = objc_opt_class();
  v16[1] = objc_opt_class();
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  v12 = [v10 setWithArray:v11];
  v13 = [v4 decodeObjectOfClasses:v12 forKey:@"parameters"];

  v14 = 0;
  if (v5 && v6 && v7 && v8 && v13)
  {
    self = [(WFStaccatoActionTemplate *)self initWithIdentifier:v5 sectionIdentifier:v6 actionIdentifier:v7 localizedTitle:v8 localizedDescription:v9 parameters:v13];
    v14 = self;
  }

  return v14;
}

- (unint64_t)hash
{
  v3 = objc_opt_new();
  id v4 = [(WFStaccatoActionTemplate *)self identifier];
  id v5 = (id)[v3 combine:v4];

  v6 = [(WFStaccatoActionTemplate *)self sectionIdentifier];
  id v7 = (id)[v3 combine:v6];

  v8 = [(WFStaccatoActionTemplate *)self actionIdentifier];
  id v9 = (id)[v3 combine:v8];

  v10 = [(WFStaccatoActionTemplate *)self localizedTitle];
  id v11 = (id)[v3 combine:v10];

  v12 = [(WFStaccatoActionTemplate *)self parameters];
  id v13 = (id)[v3 combine:v12];

  unint64_t v14 = [v3 finalize];
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(WFStaccatoActionTemplate *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  v6 = [(WFStaccatoActionTemplate *)self sectionIdentifier];
  [v4 encodeObject:v6 forKey:@"sectionIdentifier"];

  id v7 = [(WFStaccatoActionTemplate *)self actionIdentifier];
  [v4 encodeObject:v7 forKey:@"actionIdentifier"];

  v8 = [(WFStaccatoActionTemplate *)self localizedTitle];
  [v4 encodeObject:v8 forKey:@"localizedTitle"];

  id v9 = [(WFStaccatoActionTemplate *)self localizedDescription];
  [v4 encodeObject:v9 forKey:@"localizedDescription"];

  id v10 = [(WFStaccatoActionTemplate *)self parameters];
  [v4 encodeObject:v10 forKey:@"parameters"];
}

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (NSArray)parameters
{
  return self->_parameters;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(WFStaccatoActionTemplate *)self isEqualToActionTemplate:v4];

  return v5;
}

- (BOOL)isEqualToActionTemplate:(id)a3
{
  id v4 = (WFStaccatoActionTemplate *)a3;
  BOOL v5 = v4;
  if (v4 == self)
  {
    char v11 = 1;
  }
  else
  {
    if (v4)
    {
      v6 = [(WFStaccatoActionTemplate *)self identifier];
      id v7 = [(WFStaccatoActionTemplate *)v5 identifier];
      id v8 = v6;
      id v9 = v7;
      id v10 = v9;
      if (v8 == v9)
      {
      }
      else
      {
        char v11 = 0;
        v12 = v9;
        id v13 = v8;
        if (!v8 || !v9) {
          goto LABEL_33;
        }
        int v14 = [v8 isEqualToString:v9];

        if (!v14)
        {
          char v11 = 0;
LABEL_34:

          goto LABEL_35;
        }
      }
      id v15 = [(WFStaccatoActionTemplate *)self sectionIdentifier];
      id v16 = [(WFStaccatoActionTemplate *)v5 sectionIdentifier];
      id v13 = v15;
      id v17 = v16;
      v12 = v17;
      if (v13 == v17)
      {
      }
      else
      {
        char v11 = 0;
        id v18 = v17;
        id v19 = v13;
        if (!v13 || !v17) {
          goto LABEL_32;
        }
        int v20 = [v13 isEqualToString:v17];

        if (!v20)
        {
          char v11 = 0;
LABEL_33:

          goto LABEL_34;
        }
      }
      v21 = [(WFStaccatoActionTemplate *)self localizedTitle];
      uint64_t v22 = [(WFStaccatoActionTemplate *)v5 localizedTitle];
      id v19 = v21;
      id v23 = v22;
      v31 = v23;
      if (v19 != v23)
      {
        char v11 = 0;
        if (v19)
        {
          uint64_t v24 = v23;
          id v25 = v19;
          if (v23)
          {
            int v26 = [v19 isEqualToString:v23];

            if (!v26)
            {
              char v11 = 0;
LABEL_31:
              id v18 = v31;
LABEL_32:

              goto LABEL_33;
            }
            goto LABEL_23;
          }
        }
        else
        {
          uint64_t v24 = v23;
          id v25 = 0;
        }
LABEL_30:

        goto LABEL_31;
      }

LABEL_23:
      v27 = [(WFStaccatoActionTemplate *)self parameters];
      uint64_t v28 = [(WFStaccatoActionTemplate *)v5 parameters];
      id v25 = v27;
      id v29 = v28;
      uint64_t v24 = v29;
      if (v25 == v29)
      {
        char v11 = 1;
      }
      else
      {
        char v11 = 0;
        if (v25 && v29) {
          char v11 = [v25 isEqualToArray:v29];
        }
      }

      goto LABEL_30;
    }
    char v11 = 0;
  }
LABEL_35:

  return v11;
}

- (void)setActionIdentifier:(id)a3
{
}

- (void)setParameters:(id)a3
{
}

- (void)setLocalizedDescription:(id)a3
{
}

- (void)setLocalizedTitle:(id)a3
{
}

- (void)setIdentifier:(id)a3
{
}

- (id)description
{
  v3 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)WFStaccatoActionTemplate;
  id v4 = [(WFStaccatoActionTemplate *)&v12 description];
  BOOL v5 = [(WFStaccatoActionTemplate *)self identifier];
  v6 = [(WFStaccatoActionTemplate *)self sectionIdentifier];
  id v7 = [(WFStaccatoActionTemplate *)self actionIdentifier];
  id v8 = [(WFStaccatoActionTemplate *)self localizedTitle];
  id v9 = [(WFStaccatoActionTemplate *)self parameters];
  id v10 = [v3 stringWithFormat:@"<%@: id: %@ section: %@, action: %@ title: %@, parameters: %@>", v4, v5, v6, v7, v8, v9];

  return v10;
}

- (id)tintColor
{
  v2 = [(WFStaccatoActionTemplate *)self sectionIdentifier];
  v3 = WFStaccatoTintColorForSectionIdentifier(v2);

  return v3;
}

@end