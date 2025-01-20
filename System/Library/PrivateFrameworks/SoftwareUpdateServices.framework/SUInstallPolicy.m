@interface SUInstallPolicy
+ (BOOL)supportsSecureCoding;
- (BOOL)autoUpdateEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)useDarkBoot;
- (NSString)clientName;
- (SUInstallPolicy)init;
- (SUInstallPolicy)initWithCoder:(id)a3;
- (SUInstallPolicy)initWithInstallPolicyType:(unint64_t)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)skipsAllowed;
- (unint64_t)type;
- (void)_setAutoUpdateEnabled:(BOOL)a3;
- (void)_setClientName:(id)a3;
- (void)_setDarkBoolEnabled:(BOOL)a3;
- (void)_setType:(unint64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setClientName:(id)a3;
- (void)setSkipsAllowed:(unint64_t)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation SUInstallPolicy

- (SUInstallPolicy)init
{
  return [(SUInstallPolicy *)self initWithInstallPolicyType:0];
}

- (SUInstallPolicy)initWithInstallPolicyType:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SUInstallPolicy;
  v4 = [(SUInstallPolicy *)&v8 init];
  v5 = v4;
  if (v4)
  {
    clientName = v4->_clientName;
    v4->_clientName = 0;

    [(SUInstallPolicy *)v5 _setType:a3];
    *(_WORD *)&v5->_autoUpdateEnabled = 0;
  }
  return v5;
}

- (void)_setClientName:(id)a3
{
  id v5 = a3;
  clientName = self->_clientName;
  p_clientName = &self->_clientName;
  id v8 = v5;
  if (!-[NSString isEqualToString:](clientName, "isEqualToString:")) {
    objc_storeStrong((id *)p_clientName, a3);
  }
}

- (void)_setType:(unint64_t)a3
{
  BOOL v12 = +[SUUtility currentReleaseTypeIsInternal];
  self->_type = a3;
  if (a3 == 1)
  {
    SULogInfo(@"Setting required install policy of 3 days", v5, v6, v7, v8, v9, v10, v11, v36);
    [(SUInstallPolicy *)self setSkipsAllowed:3];
    if (!v12) {
      return;
    }
    SULogInfo(@"[Apple Internal] Reducing required install policy to 1", v21, v22, v23, v24, v25, v26, v27, v38);
    uint64_t v20 = 1;
  }
  else if (a3)
  {
    v28 = [NSNumber numberWithUnsignedInteger:a3];
    SULogInfo(@"Unknown InstallPolicyType provided: %@", v29, v30, v31, v32, v33, v34, v35, (uint64_t)v28);

    uint64_t v20 = -1;
  }
  else
  {
    SULogInfo(@"Setting default install policy of 7 days", v5, v6, v7, v8, v9, v10, v11, v36);
    [(SUInstallPolicy *)self setSkipsAllowed:7];
    if (!v12) {
      return;
    }
    SULogInfo(@"[Apple Internal] Reducing required install policy to 3", v13, v14, v15, v16, v17, v18, v19, v37);
    uint64_t v20 = 3;
  }
  [(SUInstallPolicy *)self setSkipsAllowed:v20];
}

- (void)_setAutoUpdateEnabled:(BOOL)a3
{
  if (self->_autoUpdateEnabled != a3) {
    self->_autoUpdateEnabled = a3;
  }
}

- (void)_setDarkBoolEnabled:(BOOL)a3
{
  if (self->_useDarkBoot != a3) {
    self->_useDarkBoot = a3;
  }
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SUInstallPolicy *)a3;
  uint64_t v5 = v4;
  if (!v4) {
    goto LABEL_9;
  }
  if (self == v4)
  {
    LOBYTE(v11) = 1;
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = v5;
    uint64_t v7 = [(SUInstallPolicy *)self clientName];
    uint64_t v8 = [(SUInstallPolicy *)v6 clientName];
    if ([v7 isEqualToString:v8]
      && (unint64_t v9 = [(SUInstallPolicy *)self type], v9 == [(SUInstallPolicy *)v6 type])
      && (BOOL v10 = [(SUInstallPolicy *)self autoUpdateEnabled],
          v10 == [(SUInstallPolicy *)v6 autoUpdateEnabled]))
    {
      BOOL v13 = [(SUInstallPolicy *)self useDarkBoot];
      BOOL v11 = v13 ^ [(SUInstallPolicy *)v6 useDarkBoot] ^ 1;
    }
    else
    {
      LOBYTE(v11) = 0;
    }
  }
  else
  {
LABEL_9:
    LOBYTE(v11) = 0;
  }
LABEL_11:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SUInstallPolicy *)self type] + 4;
  return v3 + [(SUInstallPolicy *)self autoUpdateEnabled] + 3 * v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v4 = [(SUInstallPolicy *)self clientName];
  if (self->_type) {
    uint64_t v5 = @"Required";
  }
  else {
    uint64_t v5 = @"Default";
  }
  uint64_t v6 = v5;
  unint64_t v7 = [(SUInstallPolicy *)self skipsAllowed];
  if ([(SUInstallPolicy *)self autoUpdateEnabled]) {
    uint64_t v8 = @"YES";
  }
  else {
    uint64_t v8 = @"NO";
  }
  if ([(SUInstallPolicy *)self useDarkBoot]) {
    unint64_t v9 = @"YES";
  }
  else {
    unint64_t v9 = @"NO";
  }
  BOOL v10 = [v3 stringWithFormat:@"\n            clientName:%@\n            type: %@\n            skipsAllowed: %d\n            autoUpdateEnabled: %@\n            DarkBoot: %@", v4, v6, v7, v8, v9];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUInstallPolicy)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUInstallPolicy;
  uint64_t v5 = [(SUInstallPolicy *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientName"];
    [(SUInstallPolicy *)v5 setClientName:v6];

    -[SUInstallPolicy setType:](v5, "setType:", [v4 decodeIntegerForKey:@"type"]);
    unint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"skipsAllowed"];
    -[SUInstallPolicy setSkipsAllowed:](v5, "setSkipsAllowed:", [v7 unsignedIntegerValue]);

    -[SUInstallPolicy _setAutoUpdateEnabled:](v5, "_setAutoUpdateEnabled:", [v4 decodeBoolForKey:@"autoUpdateEnabled"]);
    -[SUInstallPolicy _setDarkBoolEnabled:](v5, "_setDarkBoolEnabled:", [v4 decodeBoolForKey:@"darkBootEnabled"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  clientName = self->_clientName;
  id v6 = a3;
  [v6 encodeObject:clientName forKey:@"clientName"];
  [v6 encodeInteger:self->_type forKey:@"type"];
  uint64_t v5 = [NSNumber numberWithUnsignedInteger:self->_skipsAllowed];
  [v6 encodeObject:v5 forKey:@"skipsAllowed"];

  [v6 encodeBool:self->_autoUpdateEnabled forKey:@"autoUpdateEnabled"];
  [v6 encodeBool:self->_useDarkBoot forKey:@"darkBootEnabled"];
}

- (NSString)clientName
{
  return self->_clientName;
}

- (void)setClientName:(id)a3
{
}

- (unint64_t)skipsAllowed
{
  return self->_skipsAllowed;
}

- (void)setSkipsAllowed:(unint64_t)a3
{
  self->_skipsAllowed = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (BOOL)autoUpdateEnabled
{
  return self->_autoUpdateEnabled;
}

- (BOOL)useDarkBoot
{
  return self->_useDarkBoot;
}

- (void).cxx_destruct
{
}

@end