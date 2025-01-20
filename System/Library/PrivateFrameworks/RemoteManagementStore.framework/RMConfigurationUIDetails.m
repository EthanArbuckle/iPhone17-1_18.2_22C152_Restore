@interface RMConfigurationUIDetails
+ (BOOL)supportsSecureCoding;
+ (id)configurationUIWithTitle:(id)a3 description:(id)a4 details:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToConfigurationUI:(id)a3;
- (NSArray)detailsUI;
- (NSString)descriptionUI;
- (NSString)titleUI;
- (RMConfigurationUIDetails)initWithCoder:(id)a3;
- (RMConfigurationUIDetails)initWithTitle:(id)a3 description:(id)a4 details:(id)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RMConfigurationUIDetails

+ (id)configurationUIWithTitle:(id)a3 description:(id)a4 details:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[RMConfigurationUIDetails alloc] initWithTitle:v9 description:v8 details:v7];

  return v10;
}

- (RMConfigurationUIDetails)initWithTitle:(id)a3 description:(id)a4 details:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)RMConfigurationUIDetails;
  v11 = [(RMConfigurationUIDetails *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    titleUI = v11->_titleUI;
    v11->_titleUI = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    descriptionUI = v11->_descriptionUI;
    v11->_descriptionUI = (NSString *)v14;

    objc_storeStrong((id *)&v11->_detailsUI, a5);
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RMConfigurationUIDetails)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"description"];
  id v7 = (void *)MEMORY[0x263EFFA08];
  uint64_t v8 = objc_opt_class();
  id v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  id v10 = [v4 decodeObjectOfClasses:v9 forKey:@"details"];

  v11 = [(RMConfigurationUIDetails *)self initWithTitle:v5 description:v6 details:v10];
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(RMConfigurationUIDetails *)self titleUI];
  [v4 encodeObject:v5 forKey:@"title"];

  v6 = [(RMConfigurationUIDetails *)self descriptionUI];
  [v4 encodeObject:v6 forKey:@"description"];

  id v7 = [(RMConfigurationUIDetails *)self detailsUI];
  [v4 encodeObject:v7 forKey:@"details"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RMConfigurationUIDetails *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(RMConfigurationUIDetails *)self isEqualToConfigurationUI:v4];
  }

  return v5;
}

- (BOOL)isEqualToConfigurationUI:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(RMConfigurationUIDetails *)self titleUI];
  v6 = [v4 titleUI];
  if ([v5 isEqualToString:v6])
  {
    id v7 = [(RMConfigurationUIDetails *)self descriptionUI];
    uint64_t v8 = [v4 descriptionUI];
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
      uint64_t v14 = v9;
      if (!v9 || !v10) {
        goto LABEL_10;
      }
      int v12 = [v9 isEqual:v10];

      if (!v12) {
        goto LABEL_11;
      }
    }
    uint64_t v14 = [(RMConfigurationUIDetails *)self detailsUI];
    v13 = [v4 detailsUI];
    LOBYTE(v12) = [v14 isEqualToArray:v13];
LABEL_10:

LABEL_11:
    goto LABEL_12;
  }
  LOBYTE(v12) = 0;
LABEL_12:

  return v12;
}

- (NSString)titleUI
{
  return self->_titleUI;
}

- (NSString)descriptionUI
{
  return self->_descriptionUI;
}

- (NSArray)detailsUI
{
  return self->_detailsUI;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailsUI, 0);
  objc_storeStrong((id *)&self->_descriptionUI, 0);
  objc_storeStrong((id *)&self->_titleUI, 0);
}

@end