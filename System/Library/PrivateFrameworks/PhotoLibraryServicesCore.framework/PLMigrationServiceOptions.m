@interface PLMigrationServiceOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)isPMSOption:(unsigned __int16)a3;
- (NSString)clientBundleId;
- (NSString)suggestedDestinationName;
- (PLMigrationServiceOptions)init;
- (PLMigrationServiceOptions)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)nameForOption:(unsigned __int16)a3;
- (unsigned)option;
- (void)encodeWithCoder:(id)a3;
- (void)setOption:(unsigned __int16)a3;
- (void)setSuggestedDestinationName:(id)a3;
@end

@implementation PLMigrationServiceOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedDestinationName, 0);
  objc_storeStrong((id *)&self->_clientBundleId, 0);
}

- (void)setOption:(unsigned __int16)a3
{
  self->_option = a3;
}

- (unsigned)option
{
  return self->_option;
}

- (void)setSuggestedDestinationName:(id)a3
{
}

- (NSString)suggestedDestinationName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)clientBundleId
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v12.receiver = self;
  v12.super_class = (Class)PLMigrationServiceOptions;
  v4 = [(PLMigrationServiceOptions *)&v12 description];
  v5 = [(PLMigrationServiceOptions *)self clientBundleId];
  v6 = [(PLMigrationServiceOptions *)self suggestedDestinationName];
  [v3 appendFormat:@"%@ clientBundleId=%@ suggestedDestinationName=%@ options[%d]={", v4, v5, v6, -[PLMigrationServiceOptions option](self, "option")];

  if ([(PLMigrationServiceOptions *)self option])
  {
    int v7 = 0;
    char v8 = 0;
    do
    {
      if ([(PLMigrationServiceOptions *)self isPMSOption:(unsigned __int16)(1 << v7)])
      {
        if (v8) {
          [v3 appendFormat:@","];
        }
        v9 = [(PLMigrationServiceOptions *)self nameForOption:(unsigned __int16)(1 << v7)];
        [v3 appendFormat:@"%@", v9];

        char v8 = 1;
      }
      ++v7;
    }
    while (v7 != 9);
    [v3 appendFormat:@"}"];
  }
  else
  {
    v10 = [(PLMigrationServiceOptions *)self nameForOption:0];
    [v3 appendFormat:@"%@}", v10];
  }
  return v3;
}

- (id)nameForOption:(unsigned __int16)a3
{
  if ((int)a3 > 15)
  {
    if ((int)a3 <= 63)
    {
      if (a3 == 16) {
        return @"NotifyTask";
      }
      if (a3 == 32) {
        return @"CopyResources";
      }
    }
    else
    {
      switch(a3)
      {
        case 0x40u:
          return @"PreserveProxies";
        case 0x80u:
          return @"CorruptedMigration";
        case 0x100u:
          return @"FailOnValidationErrors";
      }
    }
    return &stru_1EEBF74F0;
  }
  else
  {
    id result = @"None";
    switch(a3)
    {
      case 0u:
        return result;
      case 1u:
        id result = @"EnableMT";
        break;
      case 2u:
        id result = @"Rebuild";
        break;
      case 4u:
        id result = @"ResumeInterruptedMigration";
        break;
      case 8u:
        id result = @"SilentMigration";
        break;
      default:
        return &stru_1EEBF74F0;
    }
  }
  return result;
}

- (BOOL)isPMSOption:(unsigned __int16)a3
{
  return ([(PLMigrationServiceOptions *)self option] & a3) != 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(PLMigrationServiceOptions *)self clientBundleId];
  v6 = (void *)v4[2];
  v4[2] = v5;

  int v7 = [(PLMigrationServiceOptions *)self suggestedDestinationName];
  [v4 setSuggestedDestinationName:v7];

  objc_msgSend(v4, "setOption:", -[PLMigrationServiceOptions option](self, "option"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  v4 = [(PLMigrationServiceOptions *)self clientBundleId];
  [v6 encodeObject:v4 forKey:@"clientBundleId"];

  uint64_t v5 = [(PLMigrationServiceOptions *)self suggestedDestinationName];
  [v6 encodeObject:v5 forKey:@"suggestedDestinationName"];

  objc_msgSend(v6, "encodeInt32:forKey:", -[PLMigrationServiceOptions option](self, "option"), @"option");
}

- (PLMigrationServiceOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PLMigrationServiceOptions *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"clientBundleId"];
    clientBundleId = v5->_clientBundleId;
    v5->_clientBundleId = (NSString *)v6;

    char v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"suggestedDestinationName"];
    [(PLMigrationServiceOptions *)v5 setSuggestedDestinationName:v8];

    -[PLMigrationServiceOptions setOption:](v5, "setOption:", (unsigned __int16)[v4 decodeInt32ForKey:@"option"]);
  }

  return v5;
}

- (PLMigrationServiceOptions)init
{
  v10.receiver = self;
  v10.super_class = (Class)PLMigrationServiceOptions;
  v2 = [(PLMigrationServiceOptions *)&v10 init];
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v4 = [v3 bundleIdentifier];
    clientBundleId = v2->_clientBundleId;
    v2->_clientBundleId = (NSString *)v4;

    if (!v2->_clientBundleId)
    {
      uint64_t v6 = [MEMORY[0x1E4F28F80] processInfo];
      uint64_t v7 = [v6 processName];
      char v8 = v2->_clientBundleId;
      v2->_clientBundleId = (NSString *)v7;
    }
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end