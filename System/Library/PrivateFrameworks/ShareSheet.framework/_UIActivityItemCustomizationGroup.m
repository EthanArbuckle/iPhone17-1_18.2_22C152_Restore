@interface _UIActivityItemCustomizationGroup
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)customizations;
- (NSString)identifier;
- (NSString)name;
- (_UIActivityItemCustomizationGroup)initWithBSXPCCoder:(id)a3;
- (_UIActivityItemCustomizationGroup)initWithCoder:(id)a3;
- (id)_initGroupWithName:(id)a3 identifier:(id)a4 customizations:(id)a5;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UIActivityItemCustomizationGroup

- (id)_initGroupWithName:(id)a3 identifier:(id)a4 customizations:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)_UIActivityItemCustomizationGroup;
  v11 = [(_UIActivityItemCustomizationGroup *)&v20 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    name = v11->_name;
    v11->_name = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    customizations = v11->_customizations;
    v11->_customizations = (NSArray *)v16;

    v18 = v11;
  }

  return v11;
}

- (_UIActivityItemCustomizationGroup)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_UIActivityItemCustomizationGroup;
  v5 = [(_UIActivityItemCustomizationGroup *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"customizations"];
    customizations = v5->_customizations;
    v5->_customizations = (NSArray *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(_UIActivityItemCustomizationGroup *)self name];
  [v4 encodeObject:v5 forKey:@"name"];

  uint64_t v6 = [(_UIActivityItemCustomizationGroup *)self identifier];
  [v4 encodeObject:v6 forKey:@"identifier"];

  id v7 = [(_UIActivityItemCustomizationGroup *)self customizations];
  [v4 encodeObject:v7 forKey:@"customizations"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v5 = [(_UIActivityItemCustomizationGroup *)self name];
  [v4 encodeObject:v5 forKey:@"name"];

  uint64_t v6 = [(_UIActivityItemCustomizationGroup *)self identifier];
  [v4 encodeObject:v6 forKey:@"identifier"];

  id v7 = [(_UIActivityItemCustomizationGroup *)self customizations];
  [v4 encodeCollection:v7 forKey:@"customizations"];
}

- (_UIActivityItemCustomizationGroup)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = [v4 decodeCollectionOfClass:v7 containingClass:objc_opt_class() forKey:@"customizations"];

  id v9 = [(_UIActivityItemCustomizationGroup *)self _initGroupWithName:v5 identifier:v6 customizations:v8];
  return v9;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_UIActivityItemCustomizationGroup *)a3;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(_UIActivityItemCustomizationGroup *)v5 name];
      uint64_t v7 = [(_UIActivityItemCustomizationGroup *)self name];
      id v8 = v6;
      id v9 = v7;
      uint64_t v10 = v9;
      if (v8 == v9)
      {
      }
      else
      {
        if ((v8 == 0) == (v9 != 0))
        {
          char v12 = 0;
          v17 = v9;
          id v15 = v8;
          goto LABEL_24;
        }
        int v11 = [v8 isEqual:v9];

        if (!v11)
        {
          char v12 = 0;
LABEL_25:

          goto LABEL_26;
        }
      }
      objc_super v13 = [(_UIActivityItemCustomizationGroup *)v5 identifier];
      uint64_t v14 = [(_UIActivityItemCustomizationGroup *)self identifier];
      id v15 = v13;
      id v16 = v14;
      v17 = v16;
      if (v15 == v16)
      {
      }
      else
      {
        if ((v15 == 0) == (v16 != 0))
        {
          char v12 = 0;
          v23 = v16;
          id v21 = v15;
LABEL_23:

          goto LABEL_24;
        }
        int v18 = [v15 isEqual:v16];

        if (!v18)
        {
          char v12 = 0;
LABEL_24:

          goto LABEL_25;
        }
      }
      v19 = [(_UIActivityItemCustomizationGroup *)v5 customizations];
      objc_super v20 = [(_UIActivityItemCustomizationGroup *)self customizations];
      id v21 = v19;
      id v22 = v20;
      v23 = v22;
      if (v21 == v22)
      {
        char v12 = 1;
      }
      else if ((v21 == 0) == (v22 != 0))
      {
        char v12 = 0;
      }
      else
      {
        char v12 = [v21 isEqual:v22];
      }

      goto LABEL_23;
    }
    char v12 = 0;
  }
LABEL_26:

  return v12;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSArray)customizations
{
  return self->_customizations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customizations, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end