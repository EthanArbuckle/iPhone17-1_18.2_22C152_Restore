@interface ICFullDeviceInfo
- (BOOL)isHardwareInfoUpgradable:(ICDeviceHardwareInfo *)a3;
- (BOOL)isHardwareInfoUpgradableToIOS13:(ICDeviceHardwareInfo *)a3;
- (BOOL)isHardwareInfoUpgradableToMacOS11:(ICDeviceHardwareInfo *)a3;
- (BOOL)isIOSDevice;
- (BOOL)isOSXDevice;
- (BOOL)shouldBeHidden;
- (BOOL)upgradable;
- (BOOL)upgradableToIOS13;
- (BOOL)upgradableToIOS14orMacOS11;
- (BOOL)upgraded;
- (BOOL)upgradedToIOS13;
- (BOOL)upgradedToIOS14EorMacOS11E;
- (BOOL)upgradedToMajor:(int)a3 minor:(int)a4;
- (ICDeviceHardwareInfo)hardwareInfo;
- (ICDeviceHardwareInfo)hardwareInfoFromModelId:(SEL)a3;
- (ICFullDeviceInfo)init;
- (ICFullDeviceInfo)initWithName:(id)a3 model:(id)a4 modelDisplayName:(id)a5 softwareVersion:(id)a6;
- (NSString)model;
- (NSString)modelDisplayName;
- (NSString)softwareVersion;
- (id)description;
- (id)loggableDescription;
- (unint64_t)hardwareInfoNameFromString:(id)a3;
@end

@implementation ICFullDeviceInfo

- (ICFullDeviceInfo)init
{
  return 0;
}

- (ICFullDeviceInfo)initWithName:(id)a3 model:(id)a4 modelDisplayName:(id)a5 softwareVersion:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)ICFullDeviceInfo;
  v14 = [(ICMigrationDeviceInfo *)&v19 initWithName:a3];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_model, a4);
    objc_storeStrong((id *)&v15->_modelDisplayName, a5);
    objc_storeStrong((id *)&v15->_softwareVersion, a6);
    [(ICFullDeviceInfo *)v15 hardwareInfoFromModelId:v11];
    v15->_hardwareInfo.subVersion = v18;
    *(_OWORD *)&v15->_hardwareInfo.modelName = v17;
  }

  return v15;
}

- (id)description
{
  v13.receiver = self;
  v13.super_class = (Class)ICFullDeviceInfo;
  v3 = [(ICFullDeviceInfo *)&v13 description];
  v4 = NSString;
  v5 = [(ICMigrationDeviceInfo *)self name];
  v6 = [(ICFullDeviceInfo *)self model];
  v7 = [(ICFullDeviceInfo *)self modelDisplayName];
  v8 = [(ICFullDeviceInfo *)self softwareVersion];
  if ([(ICFullDeviceInfo *)self upgradable]) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  if ([(ICFullDeviceInfo *)self upgraded]) {
    v10 = @"YES";
  }
  else {
    v10 = @"NO";
  }
  id v11 = [v4 stringWithFormat:@"%@ <name: %@, model: %@, modelDisplayName: %@, OS: %@, Upgradable: %@, Upgraded: %@", v3, v5, v6, v7, v8, v9, v10];

  return v11;
}

- (id)loggableDescription
{
  v12.receiver = self;
  v12.super_class = (Class)ICFullDeviceInfo;
  v3 = [(ICFullDeviceInfo *)&v12 description];
  v4 = NSString;
  v5 = [(ICFullDeviceInfo *)self model];
  v6 = [(ICFullDeviceInfo *)self modelDisplayName];
  v7 = [(ICFullDeviceInfo *)self softwareVersion];
  if ([(ICFullDeviceInfo *)self upgradable]) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  if ([(ICFullDeviceInfo *)self upgraded]) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  v10 = [v4 stringWithFormat:@"%@ <model: %@, modelDisplayName: %@, OS: %@, Upgradable: %@, Upgraded: %@", v3, v5, v6, v7, v8, v9];

  return v10;
}

- (BOOL)upgradable
{
  [(ICFullDeviceInfo *)self hardwareInfo];
  return [(ICFullDeviceInfo *)self isHardwareInfoUpgradable:v4];
}

- (BOOL)isOSXDevice
{
  [(ICFullDeviceInfo *)self hardwareInfo];
  return (unint64_t)(v3 - 14) < 0xFFFFFFFFFFFFFFFBLL;
}

- (BOOL)isIOSDevice
{
  [(ICFullDeviceInfo *)self hardwareInfo];
  return (v4 < 0xF) & (0x4E00u >> v4);
}

- (BOOL)isHardwareInfoUpgradable:(ICDeviceHardwareInfo *)a3
{
  switch(a3->modelName)
  {
    case 1uLL:
      BOOL v3 = a3->version <= 6;
      goto LABEL_10;
    case 2uLL:
      BOOL v3 = a3->version <= 0;
      goto LABEL_10;
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 7uLL:
      BOOL v3 = a3->version <= 2;
      goto LABEL_10;
    case 6uLL:
    case 9uLL:
      BOOL v3 = a3->version <= 4;
      goto LABEL_10;
    case 8uLL:
    case 0xBuLL:
      BOOL v3 = a3->version <= 1;
      goto LABEL_10;
    case 0xAuLL:
      BOOL v3 = a3->version <= 3;
LABEL_10:
      BOOL result = !v3;
      break;
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
      BOOL result = 0;
      break;
    default:
      BOOL result = 1;
      break;
  }
  return result;
}

- (BOOL)upgradableToIOS13
{
  [(ICFullDeviceInfo *)self hardwareInfo];
  return [(ICFullDeviceInfo *)self isHardwareInfoUpgradableToIOS13:v4];
}

- (BOOL)isHardwareInfoUpgradableToIOS13:(ICDeviceHardwareInfo *)a3
{
  unint64_t modelName = a3->modelName;
  if (a3->modelName != 11)
  {
    if (modelName == 10 || modelName == 9)
    {
      BOOL v5 = a3->version <= 7;
      goto LABEL_7;
    }
LABEL_11:
    BOOL v7 = 1;
    goto LABEL_12;
  }
  int64_t version = a3->version;
  if (version != 6)
  {
    BOOL v7 = version > 6;
    if (version != 5) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  BOOL v5 = a3->subVersion <= 2;
LABEL_7:
  BOOL v7 = !v5;
LABEL_12:
  v8 = os_log_create("com.apple.notes", "Migration");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    [(ICFullDeviceInfo *)(uint64_t *)a3 isHardwareInfoUpgradableToIOS13:v8];
  }

  return v7;
}

- (BOOL)upgradableToIOS14orMacOS11
{
  if ([(ICFullDeviceInfo *)self isIOSDevice])
  {
    return [(ICFullDeviceInfo *)self upgradedToIOS13];
  }
  else if ([(ICFullDeviceInfo *)self isOSXDevice])
  {
    [(ICFullDeviceInfo *)self hardwareInfo];
    return [(ICFullDeviceInfo *)self isHardwareInfoUpgradableToMacOS11:v4];
  }
  else
  {
    return 1;
  }
}

- (BOOL)isHardwareInfoUpgradableToMacOS11:(ICDeviceHardwareInfo *)a3
{
  BOOL result = 1;
  switch(a3->modelName)
  {
    case 1uLL:
      int64_t version = a3->version;
      if (version <= 14)
      {
        if (version == 14)
        {
          p_subVersion = &a3->subVersion;
          uint64_t v5 = 3;
          goto LABEL_11;
        }
        return 0;
      }
      return result;
    case 2uLL:
      uint64_t v5 = 0;
      p_subVersion = &a3->version;
      goto LABEL_11;
    case 3uLL:
      p_subVersion = &a3->version;
      uint64_t v5 = 6;
      goto LABEL_11;
    case 4uLL:
    case 8uLL:
      p_subVersion = &a3->version;
      uint64_t v5 = 5;
      goto LABEL_11;
    case 6uLL:
      p_subVersion = &a3->version;
      uint64_t v5 = 7;
      goto LABEL_11;
    case 7uLL:
      p_subVersion = &a3->version;
      uint64_t v5 = 10;
LABEL_11:
      BOOL result = *p_subVersion > v5;
      break;
    default:
      return result;
  }
  return result;
}

- (BOOL)upgradedToMajor:(int)a3 minor:(int)a4
{
  BOOL v7 = [(ICFullDeviceInfo *)self softwareVersion];

  if (!v7) {
    return 0;
  }
  id v8 = objc_alloc(MEMORY[0x1E4F28FE8]);
  v9 = [(ICFullDeviceInfo *)self softwareVersion];
  v10 = (void *)[v8 initWithString:v9];

  id v11 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
  objc_super v12 = [v11 invertedSet];
  [v10 setCharactersToBeSkipped:v12];

  uint64_t v16 = 0;
  if (![v10 scanInt:(char *)&v16 + 4]
    || ![v10 scanInt:&v16])
  {
    v14 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[ICFullDeviceInfo upgradedToMajor:minor:](self, v14);
    }

    goto LABEL_11;
  }
  if (SHIDWORD(v16) <= a3 && (HIDWORD(v16) != a3 || (int)v16 < a4))
  {
LABEL_11:
    BOOL v13 = 0;
    goto LABEL_12;
  }
  BOOL v13 = 1;
LABEL_12:

  return v13;
}

- (BOOL)upgraded
{
  BOOL v3 = [(ICFullDeviceInfo *)self softwareVersion];

  if (!v3) {
    return 0;
  }
  unint64_t v4 = [(ICFullDeviceInfo *)self softwareVersion];
  int v5 = [v4 hasPrefix:@"OSX"];

  if (v5) {
    uint64_t v6 = 10;
  }
  else {
    uint64_t v6 = 9;
  }
  if (v5) {
    uint64_t v7 = 11;
  }
  else {
    uint64_t v7 = 0;
  }
  return [(ICFullDeviceInfo *)self upgradedToMajor:v6 minor:v7];
}

- (BOOL)upgradedToIOS13
{
  if (![(ICFullDeviceInfo *)self isIOSDevice]) {
    return 1;
  }
  return [(ICFullDeviceInfo *)self upgradedToMajor:13 minor:0];
}

- (BOOL)upgradedToIOS14EorMacOS11E
{
  if ([(ICFullDeviceInfo *)self isIOSDevice])
  {
    BOOL v3 = self;
    uint64_t v4 = 14;
    uint64_t v5 = 5;
  }
  else
  {
    if (![(ICFullDeviceInfo *)self isOSXDevice]) {
      return 1;
    }
    BOOL v3 = self;
    uint64_t v4 = 11;
    uint64_t v5 = 3;
  }
  return [(ICFullDeviceInfo *)v3 upgradedToMajor:v4 minor:v5];
}

- (ICDeviceHardwareInfo)hardwareInfoFromModelId:(SEL)a3
{
  BOOL result = (ICDeviceHardwareInfo *)a4;
  retstr->int64_t version = 0;
  retstr->subVersion = 0;
  retstr->unint64_t modelName = 0;
  if (result)
  {
    uint64_t v7 = result;
    id v8 = [(ICDeviceHardwareInfo *)result lowercaseString];

    uint64_t v24 = 0;
    v9 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"([a-z]+)([0-9]+),([0-9]+)" options:1 error:&v24];
    v10 = objc_msgSend(v9, "firstMatchInString:options:range:", v8, 0, 0, objc_msgSend(v8, "length"));
    id v11 = v10;
    if (v10 && [v10 numberOfRanges] == 4)
    {
      uint64_t v12 = [v11 rangeAtIndex:1];
      v14 = objc_msgSend(v8, "substringWithRange:", v12, v13);
      unint64_t v15 = [(ICFullDeviceInfo *)self hardwareInfoNameFromString:v14];
      retstr->unint64_t modelName = v15;
      if (v15)
      {
        uint64_t v16 = [v11 rangeAtIndex:2];
        int64_t v18 = objc_msgSend(v8, "substringWithRange:", v16, v17);
        int64_t v19 = [v18 integerValue];

        uint64_t v20 = [v11 rangeAtIndex:3];
        v22 = objc_msgSend(v8, "substringWithRange:", v20, v21);
        int64_t v23 = [v22 integerValue];

        retstr->int64_t version = v19;
        retstr->subVersion = v23;
      }
    }
  }
  return result;
}

- (unint64_t)hardwareInfoNameFromString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"imac"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"imacpro"])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"macmini"])
  {
    unint64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"macpro"])
  {
    unint64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"xserve"])
  {
    unint64_t v4 = 5;
  }
  else if ([v3 isEqualToString:@"macbook"])
  {
    unint64_t v4 = 6;
  }
  else if ([v3 isEqualToString:@"macbookair"])
  {
    unint64_t v4 = 8;
  }
  else if ([v3 isEqualToString:@"macbookpro"])
  {
    unint64_t v4 = 7;
  }
  else if ([v3 isEqualToString:@"ipod"])
  {
    unint64_t v4 = 9;
  }
  else if ([v3 isEqualToString:@"iphone"])
  {
    unint64_t v4 = 10;
  }
  else if ([v3 isEqualToString:@"ipad"])
  {
    unint64_t v4 = 11;
  }
  else if ([v3 isEqualToString:@"appletv"])
  {
    unint64_t v4 = 12;
  }
  else if ([v3 isEqualToString:@"audioaccessory"])
  {
    unint64_t v4 = 13;
  }
  else if ([v3 isEqualToString:@"realitydevice"])
  {
    unint64_t v4 = 14;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (BOOL)shouldBeHidden
{
  id v3 = [(ICFullDeviceInfo *)self softwareVersion];
  if ([v3 hasPrefix:@"OSX"])
  {
    BOOL v4 = 0;
  }
  else if ([v3 hasPrefix:@"iOS"] {
         && ([(ICFullDeviceInfo *)self hardwareInfo], v7 != 12))
  }
  {
    [(ICFullDeviceInfo *)self hardwareInfo];
    BOOL v4 = v6 == 13;
  }
  else
  {
    BOOL v4 = 1;
  }

  return v4;
}

- (ICDeviceHardwareInfo)hardwareInfo
{
  *retstr = self[2];
  return self;
}

- (NSString)model
{
  return self->_model;
}

- (NSString)modelDisplayName
{
  return self->_modelDisplayName;
}

- (NSString)softwareVersion
{
  return self->_softwareVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_softwareVersion, 0);
  objc_storeStrong((id *)&self->_modelDisplayName, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

- (void)isHardwareInfoUpgradableToIOS13:(os_log_t)log .cold.1(uint64_t *a1, char a2, os_log_t log)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  uint64_t v5 = @"N";
  int v6 = 134218498;
  if (a2) {
    uint64_t v5 = @"Y";
  }
  uint64_t v7 = v3;
  __int16 v8 = 2048;
  uint64_t v9 = v4;
  __int16 v10 = 2112;
  id v11 = v5;
  _os_log_debug_impl(&dword_1C3A61000, log, OS_LOG_TYPE_DEBUG, "isHardwareInfoUpgradableToIOS13 %lu %ld %@", (uint8_t *)&v6, 0x20u);
}

- (void)upgradedToMajor:(void *)a1 minor:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 softwareVersion];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_ERROR, "Failed to scan softwareVersion: %@", (uint8_t *)&v4, 0xCu);
}

@end