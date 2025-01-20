@interface WFToggleFocusModeContextualActionFocusMode
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)colorName;
- (NSString)identifier;
- (NSString)name;
- (NSString)symbolName;
- (WFColor)color;
- (WFToggleFocusModeContextualActionFocusMode)initWithCoder:(id)a3;
- (WFToggleFocusModeContextualActionFocusMode)initWithIdentifier:(id)a3 name:(id)a4 symbolName:(id)a5;
- (WFToggleFocusModeContextualActionFocusMode)initWithIdentifier:(id)a3 name:(id)a4 symbolName:(id)a5 colorName:(id)a6;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFToggleFocusModeContextualActionFocusMode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorName, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSString)colorName
{
  return self->_colorName;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_name forKey:@"name"];
  [v5 encodeObject:self->_symbolName forKey:@"symbolName"];
  [v5 encodeObject:self->_colorName forKey:@"colorName"];
}

- (WFToggleFocusModeContextualActionFocusMode)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"symbolName"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"colorName"];

  if (v5) {
    BOOL v9 = v6 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9 || v7 == 0)
  {
    v11 = 0;
  }
  else
  {
    self = [(WFToggleFocusModeContextualActionFocusMode *)self initWithIdentifier:v5 name:v6 symbolName:v7 colorName:v8];
    v11 = self;
  }

  return v11;
}

- (WFColor)color
{
  v3 = [(WFToggleFocusModeContextualActionFocusMode *)self colorName];

  if (v3)
  {
    id v4 = [(WFToggleFocusModeContextualActionFocusMode *)self colorName];
    id v5 = +[WFColor colorWithFocusColorName:v4];
    v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      id v7 = +[WFColor colorWithSystemColor:14];
    }
    v8 = v7;
  }
  else
  {
    v8 = +[WFColor colorWithSystemColor:14];
  }
  return (WFColor *)v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WFToggleFocusModeContextualActionFocusMode *)a3;
  id v5 = v4;
  if (v4 != self)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_35:

      goto LABEL_36;
    }
    id v7 = [(WFToggleFocusModeContextualActionFocusMode *)v6 identifier];
    v8 = [(WFToggleFocusModeContextualActionFocusMode *)self identifier];
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
        goto LABEL_33;
      }
      int v15 = [v9 isEqualToString:v10];

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_34:

        goto LABEL_35;
      }
    }
    v16 = [(WFToggleFocusModeContextualActionFocusMode *)v6 name];
    v17 = [(WFToggleFocusModeContextualActionFocusMode *)self name];
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
        goto LABEL_32;
      }
      int v21 = [v14 isEqualToString:v18];

      if (!v21)
      {
        LOBYTE(v12) = 0;
LABEL_33:

        goto LABEL_34;
      }
    }
    v22 = [(WFToggleFocusModeContextualActionFocusMode *)v6 symbolName];
    v23 = [(WFToggleFocusModeContextualActionFocusMode *)self symbolName];
    id v20 = v22;
    id v24 = v23;
    id v30 = v20;
    v31 = v24;
    if (v20 != v24)
    {
      LOBYTE(v12) = 0;
      if (v20)
      {
        v25 = v24;
        if (v24)
        {
          int v12 = [v20 isEqualToString:v24];

          if (!v12)
          {
            v19 = v31;
LABEL_32:

            goto LABEL_33;
          }
          goto LABEL_24;
        }
      }
      else
      {
        v25 = v24;
      }
LABEL_31:

      id v20 = v30;
      v19 = v31;
      goto LABEL_32;
    }

LABEL_24:
    v26 = [(WFToggleFocusModeContextualActionFocusMode *)v6 colorName];
    v27 = [(WFToggleFocusModeContextualActionFocusMode *)self colorName];
    id v20 = v26;
    id v28 = v27;
    v25 = v28;
    if (v20 == v28)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v20 && v28) {
        LOBYTE(v12) = [v20 isEqualToString:v28];
      }
    }

    goto LABEL_31;
  }
  LOBYTE(v12) = 1;
LABEL_36:

  return v12;
}

- (unint64_t)hash
{
  v3 = objc_opt_new();
  id v4 = [(WFToggleFocusModeContextualActionFocusMode *)self identifier];
  id v5 = (id)[v3 combineContentsOfPropertyListObject:v4];

  v6 = [(WFToggleFocusModeContextualActionFocusMode *)self name];
  id v7 = (id)[v3 combineContentsOfPropertyListObject:v6];

  v8 = [(WFToggleFocusModeContextualActionFocusMode *)self symbolName];
  id v9 = (id)[v3 combineContentsOfPropertyListObject:v8];

  id v10 = [(WFToggleFocusModeContextualActionFocusMode *)self colorName];
  id v11 = (id)[v3 combineContentsOfPropertyListObject:v10];

  unint64_t v12 = [v3 finalize];
  return v12;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [(WFToggleFocusModeContextualActionFocusMode *)self identifier];
  id v7 = [(WFToggleFocusModeContextualActionFocusMode *)self name];
  v8 = [(WFToggleFocusModeContextualActionFocusMode *)self symbolName];
  id v9 = [(WFToggleFocusModeContextualActionFocusMode *)self colorName];
  id v10 = [v3 stringWithFormat:@"<%@ %p> Identifier: %@, Name: %@, Symbol Name: %@, Color Name: %@", v5, self, v6, v7, v8, v9];

  return v10;
}

- (WFToggleFocusModeContextualActionFocusMode)initWithIdentifier:(id)a3 name:(id)a4 symbolName:(id)a5 colorName:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
LABEL_8:
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"WFToggleFocusModeContextualAction.m", 48, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];

    if (v13) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v26 = [MEMORY[0x1E4F28B00] currentHandler];
  [v26 handleFailureInMethod:a2, self, @"WFToggleFocusModeContextualAction.m", 47, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

  if (!v12) {
    goto LABEL_8;
  }
LABEL_3:
  if (v13) {
    goto LABEL_4;
  }
LABEL_9:
  id v28 = [MEMORY[0x1E4F28B00] currentHandler];
  [v28 handleFailureInMethod:a2, self, @"WFToggleFocusModeContextualAction.m", 49, @"Invalid parameter not satisfying: %@", @"symbolName" object file lineNumber description];

LABEL_4:
  v29.receiver = self;
  v29.super_class = (Class)WFToggleFocusModeContextualActionFocusMode;
  int v15 = [(WFToggleFocusModeContextualActionFocusMode *)&v29 init];
  if (v15)
  {
    uint64_t v16 = [v11 copy];
    identifier = v15->_identifier;
    v15->_identifier = (NSString *)v16;

    uint64_t v18 = [v12 copy];
    name = v15->_name;
    v15->_name = (NSString *)v18;

    uint64_t v20 = [v13 copy];
    symbolName = v15->_symbolName;
    v15->_symbolName = (NSString *)v20;

    uint64_t v22 = [v14 copy];
    colorName = v15->_colorName;
    v15->_colorName = (NSString *)v22;

    id v24 = v15;
  }

  return v15;
}

- (WFToggleFocusModeContextualActionFocusMode)initWithIdentifier:(id)a3 name:(id)a4 symbolName:(id)a5
{
  return [(WFToggleFocusModeContextualActionFocusMode *)self initWithIdentifier:a3 name:a4 symbolName:a5 colorName:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end