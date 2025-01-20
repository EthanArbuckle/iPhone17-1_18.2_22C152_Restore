@interface URTAlert
+ (BOOL)supportsSecureCoding;
+ (id)alertWithTitle:(id)a3 message:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)allowedApplicationBundleIDs;
- (NSString)identifier;
- (NSString)message;
- (NSString)title;
- (URTAlert)initWithCoder:(id)a3;
- (URTAlert)initWithTitle:(id)a3 message:(id)a4;
- (URTAlertAction)cancelAction;
- (URTAlertAction)defaultAction;
- (URTAlertAction)otherAction;
- (id)userNotificationRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowedApplicationBundleIDs:(id)a3;
- (void)setCancelAction:(id)a3;
- (void)setDefaultAction:(id)a3;
- (void)setOtherAction:(id)a3;
@end

@implementation URTAlert

+ (id)alertWithTitle:(id)a3 message:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithTitle:v7 message:v6];

  return v8;
}

- (URTAlert)initWithTitle:(id)a3 message:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)URTAlert;
  v9 = [(URTAlert *)&v15 init];
  if (v9)
  {
    v10 = [MEMORY[0x263F08C38] UUID];
    uint64_t v11 = [v10 UUIDString];
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v11;

    objc_storeStrong((id *)&v9->_title, a3);
    objc_storeStrong((id *)&v9->_message, a4);
    allowedApplicationBundleIDs = v9->_allowedApplicationBundleIDs;
    v9->_allowedApplicationBundleIDs = (NSArray *)MEMORY[0x263EFFA68];
  }
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (URTAlert)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)URTAlert;
  v5 = [(URTAlert *)&v24 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"URTAlertIdentifierKey"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"URTAlertTitleKey"];
    title = v5->_title;
    v5->_title = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"URTAlertMessageKey"];
    message = v5->_message;
    v5->_message = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"URTAlertDefaultActionKey"];
    defaultAction = v5->_defaultAction;
    v5->_defaultAction = (URTAlertAction *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"URTAlertOtherActionKey"];
    otherAction = v5->_otherAction;
    v5->_otherAction = (URTAlertAction *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"URTAlertCancelActionKey"];
    cancelAction = v5->_cancelAction;
    v5->_cancelAction = (URTAlertAction *)v16;

    v18 = (void *)MEMORY[0x263EFFA08];
    uint64_t v19 = objc_opt_class();
    v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"URTAlertAllowedApplicationsKey"];
    allowedApplicationBundleIDs = v5->_allowedApplicationBundleIDs;
    v5->_allowedApplicationBundleIDs = (NSArray *)v21;

    if (!v5->_allowedApplicationBundleIDs)
    {
      v5->_allowedApplicationBundleIDs = (NSArray *)MEMORY[0x263EFFA68];
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v16 = a3;
  id v4 = [(URTAlert *)self identifier];
  [v16 encodeObject:v4 forKey:@"URTAlertIdentifierKey"];

  v5 = [(URTAlert *)self title];

  if (v5)
  {
    uint64_t v6 = [(URTAlert *)self title];
    [v16 encodeObject:v6 forKey:@"URTAlertTitleKey"];
  }
  id v7 = [(URTAlert *)self message];

  if (v7)
  {
    uint64_t v8 = [(URTAlert *)self message];
    [v16 encodeObject:v8 forKey:@"URTAlertMessageKey"];
  }
  v9 = [(URTAlert *)self defaultAction];

  if (v9)
  {
    uint64_t v10 = [(URTAlert *)self defaultAction];
    [v16 encodeObject:v10 forKey:@"URTAlertDefaultActionKey"];
  }
  uint64_t v11 = [(URTAlert *)self otherAction];

  if (v11)
  {
    uint64_t v12 = [(URTAlert *)self otherAction];
    [v16 encodeObject:v12 forKey:@"URTAlertOtherActionKey"];
  }
  v13 = [(URTAlert *)self cancelAction];

  if (v13)
  {
    uint64_t v14 = [(URTAlert *)self cancelAction];
    [v16 encodeObject:v14 forKey:@"URTAlertCancelActionKey"];
  }
  objc_super v15 = [(URTAlert *)self allowedApplicationBundleIDs];
  [v16 encodeObject:v15 forKey:@"URTAlertAllowedApplicationsKey"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(URTAlert *)self identifier];
    uint64_t v6 = [v4 identifier];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(URTAlert *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)message
{
  return self->_message;
}

- (URTAlertAction)defaultAction
{
  return self->_defaultAction;
}

- (void)setDefaultAction:(id)a3
{
}

- (URTAlertAction)otherAction
{
  return self->_otherAction;
}

- (void)setOtherAction:(id)a3
{
}

- (URTAlertAction)cancelAction
{
  return self->_cancelAction;
}

- (void)setCancelAction:(id)a3
{
}

- (NSArray)allowedApplicationBundleIDs
{
  return self->_allowedApplicationBundleIDs;
}

- (void)setAllowedApplicationBundleIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedApplicationBundleIDs, 0);
  objc_storeStrong((id *)&self->_cancelAction, 0);
  objc_storeStrong((id *)&self->_otherAction, 0);
  objc_storeStrong((id *)&self->_defaultAction, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (id)userNotificationRepresentation
{
  unint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [(URTAlert *)self title];

  if (v4)
  {
    v5 = [(URTAlert *)self title];
    [v3 setObject:v5 forKeyedSubscript:*MEMORY[0x263EFFFC8]];
  }
  uint64_t v6 = [(URTAlert *)self message];

  if (v6)
  {
    char v7 = [(URTAlert *)self message];
    [v3 setObject:v7 forKeyedSubscript:*MEMORY[0x263EFFFD8]];
  }
  uint64_t v8 = [(URTAlert *)self defaultAction];

  if (v8)
  {
    v9 = [(URTAlert *)self defaultAction];
    uint64_t v10 = [v9 title];
    [v3 setObject:v10 forKeyedSubscript:*MEMORY[0x263F00000]];
  }
  uint64_t v11 = [(URTAlert *)self otherAction];

  if (v11)
  {
    uint64_t v12 = [(URTAlert *)self otherAction];
    v13 = [v12 title];
    [v3 setObject:v13 forKeyedSubscript:*MEMORY[0x263F00020]];
  }
  uint64_t v14 = [(URTAlert *)self cancelAction];

  if (v14)
  {
    objc_super v15 = [(URTAlert *)self cancelAction];
    id v16 = [v15 title];
    [v3 setObject:v16 forKeyedSubscript:*MEMORY[0x263EFFFE8]];
  }
  v17 = [(URTAlert *)self allowedApplicationBundleIDs];
  uint64_t v18 = [v17 count];

  if (v18)
  {
    uint64_t v19 = [(URTAlert *)self allowedApplicationBundleIDs];
    [v3 setObject:v19 forKeyedSubscript:@"SBUserNotificationAllowedApplications"];
  }
  v20 = (void *)[v3 copy];

  return v20;
}

@end