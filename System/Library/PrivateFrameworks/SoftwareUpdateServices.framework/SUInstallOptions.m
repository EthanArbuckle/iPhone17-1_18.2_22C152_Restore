@interface SUInstallOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)automaticInstallation;
- (BOOL)isDarkBoot;
- (BOOL)isManaged;
- (BOOL)isRequired;
- (BOOL)skipActivationCheck;
- (NSString)clientName;
- (SUInstallOptions)init;
- (SUInstallOptions)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)ignorableConstraints;
- (void)encodeWithCoder:(id)a3;
- (void)setAutomaticInstallation:(BOOL)a3;
- (void)setClientName:(id)a3;
- (void)setDarkBoot:(BOOL)a3;
- (void)setIgnorableConstraints:(unint64_t)a3;
- (void)setManaged:(BOOL)a3;
- (void)setRequired:(BOOL)a3;
- (void)setSkipActivationCheck:(BOOL)a3;
@end

@implementation SUInstallOptions

- (SUInstallOptions)init
{
  v6.receiver = self;
  v6.super_class = (Class)SUInstallOptions;
  v2 = [(SUOptionsBase *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_darkBoot = 0;
    v2->_required = 0;
    v2->_managed = 0;
    v2->_skipActivationCheck = 0;
    v2->_automaticInstallation = 0;
    clientName = v2->_clientName;
    v2->_clientName = (NSString *)@"com.apple.softwareupdateservicesd";

    v3->_ignorableConstraints = 0;
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUInstallOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SUInstallOptions;
  v5 = [(SUOptionsBase *)&v8 init];
  if (v5)
  {
    -[SUInstallOptions setDarkBoot:](v5, "setDarkBoot:", [v4 decodeBoolForKey:@"darkBootKey"]);
    -[SUInstallOptions setRequired:](v5, "setRequired:", [v4 decodeBoolForKey:@"requiredKey"]);
    -[SUInstallOptions setManaged:](v5, "setManaged:", [v4 decodeBoolForKey:@"managedKey"]);
    -[SUInstallOptions setSkipActivationCheck:](v5, "setSkipActivationCheck:", [v4 decodeBoolForKey:@"skipActivationCheck"]);
    -[SUInstallOptions setAutomaticInstallation:](v5, "setAutomaticInstallation:", [v4 decodeBoolForKey:@"automaticInstallation"]);
    objc_super v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientNameKey"];
    [(SUInstallOptions *)v5 setClientName:v6];

    -[SUInstallOptions setIgnorableConstraints:](v5, "setIgnorableConstraints:", [v4 decodeIntegerForKey:@"ignorableConstraintsKey"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL darkBoot = self->_darkBoot;
  id v5 = a3;
  [v5 encodeBool:darkBoot forKey:@"darkBootKey"];
  [v5 encodeBool:self->_required forKey:@"requiredKey"];
  [v5 encodeBool:self->_managed forKey:@"managedKey"];
  [v5 encodeBool:self->_skipActivationCheck forKey:@"skipActivationCheck"];
  [v5 encodeBool:self->_automaticInstallation forKey:@"automaticInstallation"];
  [v5 encodeObject:self->_clientName forKey:@"clientNameKey"];
  [v5 encodeInteger:self->_ignorableConstraints forKey:@"ignorableConstraintsKey"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setDarkBoot:self->_darkBoot];
  [v4 setRequired:self->_required];
  [v4 setManaged:self->_managed];
  [v4 setSkipActivationCheck:self->_skipActivationCheck];
  [v4 setAutomaticInstallation:self->_automaticInstallation];
  [v4 setClientName:self->_clientName];
  [v4 setIgnorableConstraints:self->_ignorableConstraints];
  return v4;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(SUInstallOptions *)self clientName];
  id v5 = @"NO";
  if ([(SUInstallOptions *)self isDarkBoot]) {
    objc_super v6 = @"YES";
  }
  else {
    objc_super v6 = @"NO";
  }
  if ([(SUInstallOptions *)self isManaged]) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  if ([(SUInstallOptions *)self skipActivationCheck]) {
    objc_super v8 = @"YES";
  }
  else {
    objc_super v8 = @"NO";
  }
  if ([(SUInstallOptions *)self automaticInstallation]) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  if ([(SUInstallOptions *)self isRequired]) {
    id v5 = @"YES";
  }
  v10 = SUStringFromInstallationConstraints([(SUInstallOptions *)self ignorableConstraints]);
  v11 = [v3 stringWithFormat:@"\n            ClientName: %@\n            DarkBoot: %@\n            isManaged: %@\n            skipActivationCheck: %@\n            automaticInstallation: %@\n            Installation required: %@\n            IgnorableConstraints: %@\n", v4, v6, v7, v8, v9, v5, v10];

  return v11;
}

- (BOOL)isDarkBoot
{
  return self->_darkBoot;
}

- (void)setDarkBoot:(BOOL)a3
{
  self->_BOOL darkBoot = a3;
}

- (BOOL)isRequired
{
  return self->_required;
}

- (void)setRequired:(BOOL)a3
{
  self->_required = a3;
}

- (BOOL)isManaged
{
  return self->_managed;
}

- (void)setManaged:(BOOL)a3
{
  self->_managed = a3;
}

- (BOOL)skipActivationCheck
{
  return self->_skipActivationCheck;
}

- (void)setSkipActivationCheck:(BOOL)a3
{
  self->_skipActivationCheck = a3;
}

- (BOOL)automaticInstallation
{
  return self->_automaticInstallation;
}

- (void)setAutomaticInstallation:(BOOL)a3
{
  self->_automaticInstallation = a3;
}

- (NSString)clientName
{
  return self->_clientName;
}

- (void)setClientName:(id)a3
{
}

- (unint64_t)ignorableConstraints
{
  return self->_ignorableConstraints;
}

- (void)setIgnorableConstraints:(unint64_t)a3
{
  self->_ignorableConstraints = a3;
}

- (void).cxx_destruct
{
}

@end