@interface STOrganizationControllerConfigurationChangeContent
+ (BOOL)supportsSecureCoding;
+ (int64_t)contentType;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToOrganizationControllerConfigurationChangeContent:(id)a3;
- (NSString)description;
- (STConfigurationChange)configurationChange;
- (STOrganizationControllerConfigurationChangeContent)initWithCoder:(id)a3;
- (STOrganizationControllerConfigurationChangeContent)initWithConfigurationChange:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STOrganizationControllerConfigurationChangeContent

- (STOrganizationControllerConfigurationChangeContent)initWithConfigurationChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)STOrganizationControllerConfigurationChangeContent;
  id v3 = a3;
  v4 = [(STOrganizationControllerConfigurationChangeContent *)&v8 init];
  v5 = (STConfigurationChange *)objc_msgSend(v3, "copy", v8.receiver, v8.super_class);

  configurationChange = v4->_configurationChange;
  v4->_configurationChange = v5;

  return v4;
}

+ (int64_t)contentType
{
  return 1;
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class();
  v4 = [(STOrganizationControllerConfigurationChangeContent *)self configurationChange];
  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@ { Configuration Change: %@, Type: %ld }>", v3, v4, [(id)objc_opt_class() contentType]);

  return (NSString *)v5;
}

- (STOrganizationControllerConfigurationChangeContent)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"configurationChange"];

  v6 = [(STOrganizationControllerConfigurationChangeContent *)self initWithConfigurationChange:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(STOrganizationControllerConfigurationChangeContent *)self configurationChange];
  [v4 encodeObject:v5 forKey:@"configurationChange"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  configurationChange = self->_configurationChange;
  return [v4 initWithConfigurationChange:configurationChange];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (STOrganizationControllerConfigurationChangeContent *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(STOrganizationControllerConfigurationChangeContent *)self isEqualToOrganizationControllerConfigurationChangeContent:v4];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isEqualToOrganizationControllerConfigurationChangeContent:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  id v4 = a3;
  BOOL v5 = [(STOrganizationControllerConfigurationChangeContent *)self configurationChange];
  v6 = [v4 configurationChange];

  LOBYTE(v4) = [v5 isEqualToConfigurationChange:v6];
  return (char)v4;
}

- (unint64_t)hash
{
  v2 = [(STOrganizationControllerConfigurationChangeContent *)self configurationChange];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (STConfigurationChange)configurationChange
{
  return (STConfigurationChange *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end