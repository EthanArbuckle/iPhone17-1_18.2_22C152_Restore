@interface ICCompatibilityControllerDevice
+ (BOOL)supportsSecureCoding;
+ (int64_t)maximumNotesVersionForHardwareInfo:(ICDeviceHardwareInfo *)a3;
+ (int64_t)notesVersionForDeviceInfo:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUpgradable;
- (BOOL)isUpgraded;
- (ICCompatibilityControllerDevice)initWithCoder:(id)a3;
- (ICCompatibilityControllerDevice)initWithMigrationDeviceInfo:(id)a3;
- (ICCompatibilityControllerDevice)initWithNotesVersion:(int64_t)a3 maximumNotesVersion:(int64_t)a4 name:(id)a5;
- (NSString)name;
- (id)description;
- (int64_t)maximumNotesVersion;
- (int64_t)notesVersion;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setMaximumNotesVersion:(int64_t)a3;
- (void)setName:(id)a3;
- (void)setNotesVersion:(int64_t)a3;
@end

@implementation ICCompatibilityControllerDevice

- (ICCompatibilityControllerDevice)initWithNotesVersion:(int64_t)a3 maximumNotesVersion:(int64_t)a4 name:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)ICCompatibilityControllerDevice;
  v10 = [(ICCompatibilityControllerDevice *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_notesVersion = a3;
    v10->_maximumNotesVersion = a4;
    objc_storeStrong((id *)&v10->_name, a5);
  }

  return v11;
}

- (ICCompatibilityControllerDevice)initWithMigrationDeviceInfo:(id)a3
{
  id v4 = a3;
  if (([v4 isIOSDevice] & 1) != 0 || objc_msgSend(v4, "isOSXDevice"))
  {
    uint64_t v5 = [(id)objc_opt_class() notesVersionForDeviceInfo:v4];
    v6 = objc_opt_class();
    if (v4) {
      [v4 hardwareInfo];
    }
    else {
      memset(v11, 0, sizeof(v11));
    }
    uint64_t v7 = [v6 maximumNotesVersionForHardwareInfo:v11];
    v8 = [v4 name];
    self = [(ICCompatibilityControllerDevice *)self initWithNotesVersion:v5 maximumNotesVersion:v7 name:v8];

    id v9 = self;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  int64_t v6 = [(ICCompatibilityControllerDevice *)self notesVersion];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = @"—";
  }
  else
  {
    [(ICCompatibilityControllerDevice *)self notesVersion];
    NSStringFromNotesVersion();
    uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  int64_t v8 = [(ICCompatibilityControllerDevice *)self maximumNotesVersion];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = @"—";
  }
  else
  {
    [(ICCompatibilityControllerDevice *)self maximumNotesVersion];
    NSStringFromNotesVersion();
    id v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v10 = [(ICCompatibilityControllerDevice *)self name];
  v11 = [v3 stringWithFormat:@"<%@: %p, notesVersion: %@, maximumNotesVersion: %@, name: %@>", v5, self, v7, v9, v10];

  if (v8 != 0x7FFFFFFFFFFFFFFFLL) {
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  id v4 = a3;
  objc_opt_class();
  uint64_t v5 = ICDynamicCast();

  uint64_t v6 = [v5 notesVersion];
  if (v6 == [(ICCompatibilityControllerDevice *)self notesVersion]
    && (uint64_t v7 = [v5 maximumNotesVersion],
        v7 == [(ICCompatibilityControllerDevice *)self maximumNotesVersion]))
  {
    int64_t v8 = [v5 name];
    id v9 = [(ICCompatibilityControllerDevice *)self name];
    char v10 = [v8 isEqualToString:v9];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  v3 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", -[ICCompatibilityControllerDevice notesVersion](self, "notesVersion"));
  uint64_t v4 = [v3 hash];
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", -[ICCompatibilityControllerDevice maximumNotesVersion](self, "maximumNotesVersion"));
  char v6 = [v5 hash];
  uint64_t v7 = [(ICCompatibilityControllerDevice *)self name];
  [v7 hash];
  unint64_t v15 = ICHashWithHashKeys(v4, v8, v9, v10, v11, v12, v13, v14, v6);

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ICCompatibilityControllerDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICCompatibilityControllerDevice;
  uint64_t v5 = [(ICCompatibilityControllerDevice *)&v9 init];
  if (v5)
  {
    v5->_notesVersion = [v4 decodeIntegerForKey:@"notesVersion"];
    v5->_maximumNotesVersion = [v4 decodeIntegerForKey:@"maximumNotesVersion"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[ICCompatibilityControllerDevice notesVersion](self, "notesVersion"), @"notesVersion");
  objc_msgSend(v4, "encodeInteger:forKey:", -[ICCompatibilityControllerDevice maximumNotesVersion](self, "maximumNotesVersion"), @"maximumNotesVersion");
  id v5 = [(ICCompatibilityControllerDevice *)self name];
  [v4 encodeObject:v5 forKey:@"name"];
}

- (BOOL)isUpgraded
{
  int64_t v2 = [(ICCompatibilityControllerDevice *)self notesVersion];
  return v2 >= +[ICCloudSyncingObject currentNotesVersion];
}

- (BOOL)isUpgradable
{
  int64_t v2 = [(ICCompatibilityControllerDevice *)self maximumNotesVersion];
  return v2 >= +[ICCloudSyncingObject currentNotesVersion];
}

+ (int64_t)notesVersionForDeviceInfo:(id)a3
{
  id v3 = a3;
  id v4 = [v3 softwareVersion];
  id v5 = [v4 lowercaseString];
  int v6 = [v5 hasPrefix:@"osx"];

  if (!v6)
  {
LABEL_13:
    uint64_t v7 = [v3 softwareVersion];
    uint64_t v8 = [v7 lowercaseString];
    int v9 = [v8 hasPrefix:@"ios"];

    if (!v9)
    {
LABEL_35:
      uint64_t v11 = [v3 softwareVersion];
      uint64_t v12 = [v11 lowercaseString];
      int v13 = [v12 hasPrefix:@"visionos"];

      if (!v13 || ([v3 upgradedToMajor:1 minor:0] & 1) == 0)
      {
        int64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_39;
      }
      goto LABEL_37;
    }
    if (([v3 upgradedToMajor:17 minor:0] & 1) == 0)
    {
      if ([v3 upgradedToMajor:16 minor:0]) {
        goto LABEL_16;
      }
      if ([v3 upgradedToMajor:15 minor:4])
      {
LABEL_18:
        int64_t v10 = 8;
        goto LABEL_39;
      }
      if ([v3 upgradedToMajor:15 minor:0])
      {
LABEL_20:
        int64_t v10 = 7;
        goto LABEL_39;
      }
      if ([v3 upgradedToMajor:14 minor:5])
      {
LABEL_22:
        int64_t v10 = 6;
        goto LABEL_39;
      }
      if ([v3 upgradedToMajor:14 minor:0])
      {
LABEL_24:
        int64_t v10 = 5;
        goto LABEL_39;
      }
      if ([v3 upgradedToMajor:13 minor:0])
      {
LABEL_26:
        int64_t v10 = 4;
        goto LABEL_39;
      }
      if ([v3 upgradedToMajor:12 minor:0])
      {
LABEL_28:
        int64_t v10 = 3;
        goto LABEL_39;
      }
      if ([v3 upgradedToMajor:11 minor:0])
      {
LABEL_30:
        int64_t v10 = 2;
        goto LABEL_39;
      }
      if ([v3 upgradedToMajor:10 minor:0])
      {
LABEL_32:
        int64_t v10 = 1;
        goto LABEL_39;
      }
      if ([v3 upgradedToMajor:9 minor:0])
      {
LABEL_34:
        int64_t v10 = 0;
        goto LABEL_39;
      }
      goto LABEL_35;
    }
LABEL_37:
    int64_t v10 = 13;
    goto LABEL_39;
  }
  if ([v3 upgradedToMajor:14 minor:0]) {
    goto LABEL_37;
  }
  if (([v3 upgradedToMajor:13 minor:0] & 1) == 0)
  {
    if ([v3 upgradedToMajor:12 minor:3]) {
      goto LABEL_18;
    }
    if ([v3 upgradedToMajor:12 minor:0]) {
      goto LABEL_20;
    }
    if ([v3 upgradedToMajor:11 minor:3]) {
      goto LABEL_22;
    }
    if ([v3 upgradedToMajor:11 minor:0]) {
      goto LABEL_24;
    }
    if ([v3 upgradedToMajor:10 minor:15]) {
      goto LABEL_26;
    }
    if ([v3 upgradedToMajor:10 minor:14]) {
      goto LABEL_28;
    }
    if ([v3 upgradedToMajor:10 minor:13]) {
      goto LABEL_30;
    }
    if ([v3 upgradedToMajor:10 minor:12]) {
      goto LABEL_32;
    }
    if ([v3 upgradedToMajor:10 minor:11]) {
      goto LABEL_34;
    }
    goto LABEL_13;
  }
LABEL_16:
  int64_t v10 = 9;
LABEL_39:

  return v10;
}

+ (int64_t)maximumNotesVersionForHardwareInfo:(ICDeviceHardwareInfo *)a3
{
  switch(a3->modelName)
  {
    case 0uLL:
    case 0xCuLL:
    case 0xDuLL:
      return 0x7FFFFFFFFFFFFFFFLL;
    case 1uLL:
      int64_t result = -1;
      switch(a3->version)
      {
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
          return result;
        case 9:
          goto LABEL_24;
        case 0xALL:
        case 0xBLL:
        case 0xCLL:
          goto LABEL_12;
        case 0xDLL:
          goto LABEL_26;
        case 0xELL:
          BOOL v6 = (unint64_t)(a3->subVersion - 1) >= 3;
          int64_t v7 = 6;
          int64_t v8 = 4;
          goto LABEL_30;
        case 0xFLL:
          int64_t result = 6;
          break;
        case 0x10:
        case 0x11:
          goto LABEL_23;
        case 0x12:
          goto LABEL_25;
        default:
          goto LABEL_21;
      }
      return result;
    case 2uLL:
      goto LABEL_21;
    case 3uLL:
    case 5uLL:
      unint64_t v4 = a3->version - 1;
      if (v4 >= 7) {
        goto LABEL_21;
      }
      id v5 = &unk_1C3DD3270;
      goto LABEL_19;
    case 4uLL:
      unint64_t v4 = a3->version - 1;
      if (v4 >= 6) {
        goto LABEL_21;
      }
      id v5 = &unk_1C3DD3240;
      goto LABEL_19;
    case 6uLL:
      unint64_t v4 = a3->version - 1;
      if (v4 >= 0xA) {
        goto LABEL_21;
      }
      id v5 = &unk_1C3DD32A8;
      goto LABEL_19;
    case 7uLL:
      int64_t result = -1;
      switch(a3->version)
      {
        case 1:
        case 2:
          return result;
        case 3:
        case 4:
        case 5:
          goto LABEL_24;
        case 6:
        case 7:
        case 8:
LABEL_12:
          int64_t result = 2;
          break;
        case 9:
        case 0xALL:
LABEL_26:
          int64_t result = 4;
          break;
        case 0xBLL:
          BOOL v6 = (unint64_t)(a3->subVersion - 1) >= 3;
          int64_t v7 = 8;
          int64_t v8 = 6;
LABEL_30:
          if (v6) {
            int64_t result = v7;
          }
          else {
            int64_t result = v8;
          }
          break;
        case 0xCLL:
        case 0xDLL:
          goto LABEL_23;
        case 0xELL:
          goto LABEL_25;
        default:
          goto LABEL_21;
      }
      return result;
    case 8uLL:
      unint64_t v4 = a3->version - 1;
      if (v4 >= 7) {
        goto LABEL_21;
      }
      id v5 = &unk_1C3DD32F8;
      goto LABEL_19;
    case 9uLL:
      unint64_t v4 = a3->version - 1;
      if (v4 < 7)
      {
        id v5 = &unk_1C3DD3330;
        goto LABEL_19;
      }
LABEL_23:
      int64_t result = 8;
      break;
    case 0xAuLL:
      unint64_t v4 = a3->version - 1;
      if (v4 >= 0xA)
      {
LABEL_21:
        int64_t result = +[ICCloudSyncingObject currentNotesVersion];
      }
      else
      {
        id v5 = &unk_1C3DD3368;
LABEL_19:
        int64_t result = v5[v4];
      }
      break;
    case 0xBuLL:
      int64_t result = -1;
      switch(a3->version)
      {
        case 1:
          return result;
        case 2:
LABEL_24:
          int64_t result = 0;
          break;
        case 3:
          int64_t result = (unint64_t)(a3->subVersion - 4) < 0xFFFFFFFFFFFFFFFDLL;
          break;
        case 4:
          int64_t result = 3;
          break;
        case 5:
          goto LABEL_23;
        case 6:
LABEL_25:
          int64_t result = 12;
          break;
        default:
          goto LABEL_21;
      }
      return result;
    default:
      return 13;
  }
  return result;
}

- (int64_t)notesVersion
{
  return self->_notesVersion;
}

- (void)setNotesVersion:(int64_t)a3
{
  self->_notesVersion = a3;
}

- (int64_t)maximumNotesVersion
{
  return self->_maximumNotesVersion;
}

- (void)setMaximumNotesVersion:(int64_t)a3
{
  self->_maximumNotesVersion = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end