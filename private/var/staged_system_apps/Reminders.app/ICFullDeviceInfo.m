@interface ICFullDeviceInfo
- (BOOL)isHardwareInfoUpgradable:(ICDeviceHardwareInfo *)a3;
- (BOOL)isHardwareInfoUpgradableTo2019OSes:(ICDeviceHardwareInfo *)a3;
- (BOOL)isHardwareInfoUpgradableToSydneyRomeKincaid:(ICDeviceHardwareInfo *)a3;
- (BOOL)isIOSDevice;
- (BOOL)isOSXDevice;
- (BOOL)shouldBeHidden;
- (BOOL)upgradable;
- (BOOL)upgradableTo2019OSes;
- (BOOL)upgradableToSydneyRomeKincaid;
- (BOOL)upgraded;
- (BOOL)upgradedTo2019OSes;
- (BOOL)upgradedToMajor:(int)a3 minor:(int)a4;
- (BOOL)upgradedToSydneyRomeKincaid;
- (ICDeviceHardwareInfo)hardwareInfo;
- (ICDeviceHardwareInfo)hardwareInfoFromModelId:(SEL)a3;
- (ICFullDeviceInfo)initWithName:(id)a3 model:(id)a4 modelDisplayName:(id)a5 softwareVersion:(id)a6;
- (NSString)model;
- (NSString)modelDisplayName;
- (NSString)softwareVersion;
- (id)debugDescription;
- (id)description;
- (unint64_t)hardwareInfoNameFromString:(id)a3;
@end

@implementation ICFullDeviceInfo

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

- (id)debugDescription
{
  v12.receiver = self;
  v12.super_class = (Class)ICFullDeviceInfo;
  v3 = [(ICFullDeviceInfo *)&v12 description];
  v4 = [(ICMigrationDeviceInfo *)self name];
  v5 = [(ICFullDeviceInfo *)self model];
  v6 = [(ICFullDeviceInfo *)self modelDisplayName];
  v7 = [(ICFullDeviceInfo *)self softwareVersion];
  if ([(ICFullDeviceInfo *)self upgradable]) {
    CFStringRef v8 = @"YES";
  }
  else {
    CFStringRef v8 = @"NO";
  }
  if ([(ICFullDeviceInfo *)self upgraded]) {
    CFStringRef v9 = @"YES";
  }
  else {
    CFStringRef v9 = @"NO";
  }
  v10 = +[NSString stringWithFormat:@"%@ <name: %@, model: %@, modelDisplayName: %@, OS: %@, Upgradable: %@, Upgraded: %@", v3, v4, v5, v6, v7, v8, v9];

  return v10;
}

- (id)description
{
  v11.receiver = self;
  v11.super_class = (Class)ICFullDeviceInfo;
  v3 = [(ICFullDeviceInfo *)&v11 description];
  v4 = [(ICFullDeviceInfo *)self model];
  v5 = [(ICFullDeviceInfo *)self modelDisplayName];
  v6 = [(ICFullDeviceInfo *)self softwareVersion];
  if ([(ICFullDeviceInfo *)self upgradable]) {
    CFStringRef v7 = @"YES";
  }
  else {
    CFStringRef v7 = @"NO";
  }
  if ([(ICFullDeviceInfo *)self upgraded]) {
    CFStringRef v8 = @"YES";
  }
  else {
    CFStringRef v8 = @"NO";
  }
  CFStringRef v9 = +[NSString stringWithFormat:@"%@ <model: %@, modelDisplayName: %@, OS: %@, Upgradable: %@, Upgraded: %@", v3, v4, v5, v6, v7, v8];

  return v9;
}

- (BOOL)upgradable
{
  [(ICFullDeviceInfo *)self hardwareInfo];
  return [(ICFullDeviceInfo *)self isHardwareInfoUpgradable:v4];
}

- (BOOL)isOSXDevice
{
  [(ICFullDeviceInfo *)self hardwareInfo];
  return v3 < 9;
}

- (BOOL)isIOSDevice
{
  [(ICFullDeviceInfo *)self hardwareInfo];
  return (unint64_t)(v3 - 9) < 3;
}

- (BOOL)isHardwareInfoUpgradable:(ICDeviceHardwareInfo *)a3
{
  BOOL result = 1;
  switch(a3->modelName)
  {
    case 1uLL:
      int64_t version = a3->version;
      BOOL v7 = __OFSUB__(version, 6);
      BOOL v5 = version == 6;
      BOOL v6 = version - 6 < 0;
      goto LABEL_7;
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 7uLL:
      int64_t v4 = a3->version;
      BOOL v7 = __OFSUB__(v4, 2);
      BOOL v5 = v4 == 2;
      BOOL v6 = v4 - 2 < 0;
      goto LABEL_7;
    case 6uLL:
    case 9uLL:
      int64_t v8 = a3->version;
      BOOL v7 = __OFSUB__(v8, 4);
      BOOL v5 = v8 == 4;
      BOOL v6 = v8 - 4 < 0;
      goto LABEL_7;
    case 8uLL:
    case 0xBuLL:
      int64_t v9 = a3->version;
      BOOL v7 = __OFSUB__(v9, 1);
      BOOL v5 = v9 == 1;
      BOOL v6 = v9 - 1 < 0;
      goto LABEL_7;
    case 0xAuLL:
      int64_t v11 = a3->version;
      BOOL v7 = __OFSUB__(v11, 3);
      BOOL v5 = v11 == 3;
      BOOL v6 = v11 - 3 < 0;
LABEL_7:
      if (v6 ^ v7 | v5) {
        BOOL result = 0;
      }
      else {
        BOOL result = 1;
      }
      break;
    case 0xCuLL:
      BOOL result = 0;
      break;
    default:
      return result;
  }
  return result;
}

- (BOOL)upgradableTo2019OSes
{
  [(ICFullDeviceInfo *)self hardwareInfo];
  return [(ICFullDeviceInfo *)self isHardwareInfoUpgradableTo2019OSes:v4];
}

- (BOOL)isHardwareInfoUpgradableTo2019OSes:(ICDeviceHardwareInfo *)a3
{
  switch(a3->modelName)
  {
    case 1uLL:
      BOOL v3 = a3->version <= 12;
      goto LABEL_14;
    case 2uLL:
      BOOL v3 = a3->version <= 0;
      goto LABEL_14;
    case 3uLL:
    case 4uLL:
      BOOL v3 = a3->version <= 5;
      goto LABEL_14;
    case 5uLL:
    case 0xCuLL:
      return 0;
    case 6uLL:
    case 9uLL:
    case 0xAuLL:
      BOOL v3 = a3->version <= 7;
      goto LABEL_14;
    case 7uLL:
      BOOL v3 = a3->version <= 8;
      goto LABEL_14;
    case 8uLL:
      BOOL v3 = a3->version <= 4;
      goto LABEL_14;
    case 0xBuLL:
      int64_t version = a3->version;
      if (version == 5 || version == 6 && a3->subVersion > 2) {
        goto LABEL_12;
      }
      BOOL v3 = version <= 6;
LABEL_14:
      BOOL result = !v3;
      break;
    default:
LABEL_12:
      BOOL result = 1;
      break;
  }
  return result;
}

- (BOOL)upgradableToSydneyRomeKincaid
{
  [(ICFullDeviceInfo *)self hardwareInfo];
  return [(ICFullDeviceInfo *)self isHardwareInfoUpgradableToSydneyRomeKincaid:v4];
}

- (BOOL)isHardwareInfoUpgradableToSydneyRomeKincaid:(ICDeviceHardwareInfo *)a3
{
  switch(a3->modelName)
  {
    case 1uLL:
      int64_t version = a3->version;
      BOOL v7 = __OFSUB__(version, 17);
      BOOL v5 = version == 17;
      BOOL v6 = version - 17 < 0;
      return !(v6 ^ v7 | v5);
    case 2uLL:
      int64_t v11 = a3->version;
      BOOL v7 = 0;
      BOOL v5 = v11 == 0;
      BOOL v6 = v11 < 0;
      return !(v6 ^ v7 | v5);
    case 3uLL:
    case 8uLL:
      int64_t v4 = a3->version;
      BOOL v7 = __OFSUB__(v4, 7);
      BOOL v5 = v4 == 7;
      BOOL v6 = v4 - 7 < 0;
      return !(v6 ^ v7 | v5);
    case 4uLL:
      int64_t v12 = a3->version;
      BOOL v7 = __OFSUB__(v12, 6);
      BOOL v5 = v12 == 6;
      BOOL v6 = v12 - 6 < 0;
      return !(v6 ^ v7 | v5);
    case 5uLL:
    case 9uLL:
    case 0xCuLL:
      return 0;
    case 6uLL:
    case 0xAuLL:
      int64_t v8 = a3->version;
      BOOL v7 = __OFSUB__(v8, 9);
      BOOL v5 = v8 == 9;
      BOOL v6 = v8 - 9 < 0;
      return !(v6 ^ v7 | v5);
    case 7uLL:
      int64_t v13 = a3->version;
      BOOL v7 = __OFSUB__(v13, 13);
      BOOL v5 = v13 == 13;
      BOOL v6 = v13 - 13 < 0;
      return !(v6 ^ v7 | v5);
    case 0xBuLL:
      int64_t v9 = a3->version;
      if (v9 < 6) {
        return 0;
      }
      if ((unint64_t)v9 > 0xE) {
        return 1;
      }
      BOOL result = 1;
      switch(v9)
      {
        case 6:
          int64_t subVersion = a3->subVersion;
          BOOL v7 = __OFSUB__(subVersion, 2);
          BOOL v5 = subVersion == 2;
          BOOL v6 = subVersion - 2 < 0;
          return !(v6 ^ v7 | v5);
        case 7:
          int64_t v15 = a3->subVersion;
          BOOL v7 = __OFSUB__(v15, 4);
          BOOL v5 = v15 == 4;
          BOOL v6 = v15 - 4 < 0;
          return !(v6 ^ v7 | v5);
        case 8:
        case 11:
        case 12:
        case 13:
        case 14:
          return result;
        default:
          return 0;
      }
      return result;
    default:
      return 1;
  }
}

- (BOOL)upgradedToMajor:(int)a3 minor:(int)a4
{
  BOOL v7 = [(ICFullDeviceInfo *)self softwareVersion];

  if (!v7) {
    return 0;
  }
  id v8 = objc_alloc((Class)NSScanner);
  int64_t v9 = [(ICFullDeviceInfo *)self softwareVersion];
  id v10 = [v8 initWithString:v9];

  int64_t v11 = +[NSCharacterSet decimalDigitCharacterSet];
  int64_t v12 = [v11 invertedSet];
  [v10 setCharactersToBeSkipped:v12];

  uint64_t v16 = 0;
  if (![v10 scanInt:(char *)&v16 + 4]
    || ![v10 scanInt:&v16])
  {
    v14 = +[REMLogStore utility];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100658FF8(self, v14);
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

- (BOOL)upgradedTo2019OSes
{
  BOOL v3 = [(ICFullDeviceInfo *)self softwareVersion];

  if (!v3) {
    return 0;
  }
  int64_t v4 = [(ICFullDeviceInfo *)self softwareVersion];
  unsigned int v5 = [v4 hasPrefix:@"OSX"];

  if (v5) {
    uint64_t v6 = 10;
  }
  else {
    uint64_t v6 = 13;
  }
  if (v5) {
    uint64_t v7 = 15;
  }
  else {
    uint64_t v7 = 0;
  }

  return [(ICFullDeviceInfo *)self upgradedToMajor:v6 minor:v7];
}

- (BOOL)upgradedToSydneyRomeKincaid
{
  BOOL v3 = [(ICFullDeviceInfo *)self softwareVersion];

  if (!v3) {
    return 0;
  }
  int64_t v4 = [(ICFullDeviceInfo *)self softwareVersion];
  unsigned int v5 = [v4 hasPrefix:@"OSX"];

  if (v5) {
    uint64_t v6 = 13;
  }
  else {
    uint64_t v6 = 16;
  }

  return [(ICFullDeviceInfo *)self upgradedToMajor:v6 minor:0];
}

- (BOOL)upgraded
{
  BOOL v3 = [(ICFullDeviceInfo *)self softwareVersion];

  if (!v3) {
    return 0;
  }
  int64_t v4 = [(ICFullDeviceInfo *)self softwareVersion];
  unsigned int v5 = [v4 hasPrefix:@"OSX"];

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

- (ICDeviceHardwareInfo)hardwareInfoFromModelId:(SEL)a3
{
  BOOL result = (ICDeviceHardwareInfo *)a4;
  retstr->int64_t version = 0;
  retstr->int64_t subVersion = 0;
  retstr->modelName = 0;
  if (result)
  {
    uint64_t v7 = result;
    id v8 = [(ICDeviceHardwareInfo *)result lowercaseString];

    uint64_t v24 = 0;
    int64_t v9 = +[NSRegularExpression regularExpressionWithPattern:@"([a-z]+)([0-9]+),([0-9]+)" options:1 error:&v24];
    id v10 = [v9 firstMatchInString:v8 options:0 range:[v8 length]];
    int64_t v11 = v10;
    if (v10 && [v10 numberOfRanges] == (id)4)
    {
      id v12 = [v11 rangeAtIndex:1];
      v14 = [v8 substringWithRange:v12, v13];
      unint64_t v15 = [(ICFullDeviceInfo *)self hardwareInfoNameFromString:v14];
      retstr->modelName = v15;
      if (v15)
      {
        id v16 = [v11 rangeAtIndex:2];
        int64_t v18 = [v8 substringWithRange:v16, v17];
        id v19 = [v18 integerValue];

        id v20 = [v11 rangeAtIndex:3];
        v22 = [v8 substringWithRange:v20, v21];
        id v23 = [v22 integerValue];

        retstr->int64_t version = (int64_t)v19;
        retstr->int64_t subVersion = (int64_t)v23;
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

@end