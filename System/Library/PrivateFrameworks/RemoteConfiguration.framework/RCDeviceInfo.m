@interface RCDeviceInfo
+ (id)defaultDeviceInfo;
+ (id)defaultDeviceInfoWithAppVersion:(id)a3;
+ (id)defaultDeviceInfoWithAppVersion:(id)a3 formatVersion:(id)a4;
+ (id)defaultDeviceInfoWithAppVersion:(id)a3 formatVersion:(id)a4 seedNumber:(id)a5 buildNumber:(id)a6;
- (BOOL)isEqual:(id)a3;
- (NSArray)preferredLanguages;
- (NSString)appVersion;
- (NSString)buildNumber;
- (NSString)countryCode;
- (NSString)description;
- (NSString)deviceType;
- (NSString)formatVersion;
- (NSString)osVersion;
- (NSString)seedNumber;
- (RCDeviceInfo)initWithPreferredLanguages:(id)a3 deviceType:(id)a4 utcOffset:(int64_t)a5 dstOffset:(int64_t)a6 appVersion:(id)a7 osVersion:(id)a8;
- (RCDeviceInfo)initWithPreferredLanguages:(id)a3 deviceType:(id)a4 utcOffset:(int64_t)a5 dstOffset:(int64_t)a6 appVersion:(id)a7 osVersion:(id)a8 countryCode:(id)a9;
- (RCDeviceInfo)initWithPreferredLanguages:(id)a3 deviceType:(id)a4 utcOffset:(int64_t)a5 dstOffset:(int64_t)a6 appVersion:(id)a7 osVersion:(id)a8 countryCode:(id)a9 formatVersion:(id)a10;
- (RCDeviceInfo)initWithPreferredLanguages:(id)a3 deviceType:(id)a4 utcOffset:(int64_t)a5 dstOffset:(int64_t)a6 appVersion:(id)a7 osVersion:(id)a8 countryCode:(id)a9 formatVersion:(id)a10 seedNumber:(id)a11 buildNumber:(id)a12;
- (id)dictionaryRepresentation;
- (int64_t)dstOffset;
- (int64_t)utcOffset;
- (unint64_t)hash;
@end

@implementation RCDeviceInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buildNumber, 0);
  objc_storeStrong((id *)&self->_seedNumber, 0);
  objc_storeStrong((id *)&self->_formatVersion, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_appVersion, 0);
  objc_storeStrong((id *)&self->_deviceType, 0);

  objc_storeStrong((id *)&self->_preferredLanguages, 0);
}

- (NSArray)preferredLanguages
{
  return self->_preferredLanguages;
}

+ (id)defaultDeviceInfo
{
  v3 = RCAppVersion();
  v4 = [a1 defaultDeviceInfoWithAppVersion:v3 formatVersion:0];

  return v4;
}

+ (id)defaultDeviceInfoWithAppVersion:(id)a3 formatVersion:(id)a4 seedNumber:(id)a5 buildNumber:(id)a6
{
  v9 = (void *)MEMORY[0x1E4F1CAF0];
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [v9 localTimeZone];
  v24 = RCDeviceOSVersion();
  v15 = RCDeviceModelString();
  v16 = [MEMORY[0x1E4F1CA20] currentLocale];
  v17 = [v16 countryCode];

  v18 = [RCDeviceInfo alloc];
  v19 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  uint64_t v20 = [v14 secondsFromGMT];
  [v14 daylightSavingTimeOffset];
  v22 = [(RCDeviceInfo *)v18 initWithPreferredLanguages:v19 deviceType:v15 utcOffset:v20 dstOffset:(uint64_t)v21 appVersion:v13 osVersion:v24 countryCode:v17 formatVersion:v12 seedNumber:v11 buildNumber:v10];

  return v22;
}

- (RCDeviceInfo)initWithPreferredLanguages:(id)a3 deviceType:(id)a4 utcOffset:(int64_t)a5 dstOffset:(int64_t)a6 appVersion:(id)a7 osVersion:(id)a8 countryCode:(id)a9 formatVersion:(id)a10 seedNumber:(id)a11 buildNumber:(id)a12
{
  id v43 = a3;
  id v18 = a4;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  id v24 = a12;
  v44.receiver = self;
  v44.super_class = (Class)RCDeviceInfo;
  v25 = [(RCDeviceInfo *)&v44 init];
  if (v25)
  {
    uint64_t v26 = [v43 copy];
    preferredLanguages = v25->_preferredLanguages;
    v25->_preferredLanguages = (NSArray *)v26;

    uint64_t v28 = [v18 copy];
    deviceType = v25->_deviceType;
    v25->_deviceType = (NSString *)v28;

    v25->_utcOffset = a5;
    v25->_dstOffset = a6;
    uint64_t v30 = [v19 copy];
    appVersion = v25->_appVersion;
    v25->_appVersion = (NSString *)v30;

    uint64_t v32 = [v20 copy];
    osVersion = v25->_osVersion;
    v25->_osVersion = (NSString *)v32;

    uint64_t v34 = [v21 copy];
    countryCode = v25->_countryCode;
    v25->_countryCode = (NSString *)v34;

    uint64_t v36 = [v22 copy];
    formatVersion = v25->_formatVersion;
    v25->_formatVersion = (NSString *)v36;

    uint64_t v38 = [v23 copy];
    seedNumber = v25->_seedNumber;
    v25->_seedNumber = (NSString *)v38;

    uint64_t v40 = [v24 copy];
    buildNumber = v25->_buildNumber;
    v25->_buildNumber = (NSString *)v40;
  }
  return v25;
}

+ (id)defaultDeviceInfoWithAppVersion:(id)a3 formatVersion:(id)a4
{
  return (id)[a1 defaultDeviceInfoWithAppVersion:a3 formatVersion:a4 seedNumber:0 buildNumber:0];
}

+ (id)defaultDeviceInfoWithAppVersion:(id)a3
{
  return (id)[a1 defaultDeviceInfoWithAppVersion:a3 formatVersion:0];
}

- (RCDeviceInfo)initWithPreferredLanguages:(id)a3 deviceType:(id)a4 utcOffset:(int64_t)a5 dstOffset:(int64_t)a6 appVersion:(id)a7 osVersion:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a4;
  id v17 = a3;
  id v18 = [RCDeviceInfo alloc];
  id v19 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v20 = [v19 countryCode];
  id v21 = [(RCDeviceInfo *)v18 initWithPreferredLanguages:v17 deviceType:v16 utcOffset:a5 dstOffset:a6 appVersion:v15 osVersion:v14 countryCode:v20 formatVersion:0];

  return v21;
}

- (RCDeviceInfo)initWithPreferredLanguages:(id)a3 deviceType:(id)a4 utcOffset:(int64_t)a5 dstOffset:(int64_t)a6 appVersion:(id)a7 osVersion:(id)a8 countryCode:(id)a9
{
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a4;
  id v20 = a3;
  id v21 = [[RCDeviceInfo alloc] initWithPreferredLanguages:v20 deviceType:v19 utcOffset:a5 dstOffset:a6 appVersion:v18 osVersion:v17 countryCode:v16 formatVersion:0];

  return v21;
}

- (RCDeviceInfo)initWithPreferredLanguages:(id)a3 deviceType:(id)a4 utcOffset:(int64_t)a5 dstOffset:(int64_t)a6 appVersion:(id)a7 osVersion:(id)a8 countryCode:(id)a9 formatVersion:(id)a10
{
  id v17 = a10;
  id v18 = a9;
  id v19 = a8;
  id v20 = a7;
  id v21 = a4;
  id v22 = a3;
  id v23 = [[RCDeviceInfo alloc] initWithPreferredLanguages:v22 deviceType:v21 utcOffset:a5 dstOffset:a6 appVersion:v20 osVersion:v19 countryCode:v18 formatVersion:v17 seedNumber:0 buildNumber:0];

  return v23;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(RCDeviceInfo *)self preferredLanguages];
    v7 = [v5 preferredLanguages];
    if ([v6 isEqual:v7])
    {
      v8 = [(RCDeviceInfo *)self deviceType];
      v9 = [v5 deviceType];
      if ([v8 isEqualToString:v9]
        && (int64_t v10 = -[RCDeviceInfo utcOffset](self, "utcOffset"), v10 == [v5 utcOffset])
        && (int64_t v11 = -[RCDeviceInfo dstOffset](self, "dstOffset"), v11 == [v5 dstOffset]))
      {
        id v12 = [(RCDeviceInfo *)self appVersion];
        id v13 = [v5 appVersion];
        if ([v12 isEqualToString:v13])
        {
          id v14 = [(RCDeviceInfo *)self osVersion];
          v33 = [v5 osVersion];
          if (objc_msgSend(v14, "isEqualToString:"))
          {
            uint64_t v30 = NSString;
            uint64_t v32 = v14;
            uint64_t v15 = [(RCDeviceInfo *)self formatVersion];
            uint64_t v16 = [v5 formatVersion];
            id v17 = v30;
            v29 = (void *)v16;
            v31 = (void *)v15;
            if (objc_msgSend(v17, "rc_string:isEqualToString:", v15))
            {
              v27 = NSString;
              uint64_t v18 = [(RCDeviceInfo *)self seedNumber];
              uint64_t v19 = [v5 seedNumber];
              id v20 = v27;
              uint64_t v26 = (void *)v19;
              uint64_t v28 = (void *)v18;
              if (objc_msgSend(v20, "rc_string:isEqualToString:", v18))
              {
                v25 = NSString;
                id v24 = [(RCDeviceInfo *)self buildNumber];
                id v21 = [v5 buildNumber];
                char v22 = objc_msgSend(v25, "rc_string:isEqualToString:", v24, v21);
              }
              else
              {
                char v22 = 0;
              }
              id v14 = v32;
            }
            else
            {
              char v22 = 0;
              id v14 = v32;
            }
          }
          else
          {
            char v22 = 0;
          }
        }
        else
        {
          char v22 = 0;
        }
      }
      else
      {
        char v22 = 0;
      }
    }
    else
    {
      char v22 = 0;
    }
  }
  else
  {
    char v22 = 0;
  }

  return v22;
}

- (unint64_t)hash
{
  id v21 = [(RCDeviceInfo *)self preferredLanguages];
  uint64_t v3 = [v21 hash];
  id v4 = [(RCDeviceInfo *)self deviceType];
  uint64_t v5 = [v4 hash] ^ v3;
  v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[RCDeviceInfo utcOffset](self, "utcOffset"));
  uint64_t v7 = v5 ^ [v6 hash];
  v8 = objc_msgSend(NSNumber, "numberWithInteger:", -[RCDeviceInfo dstOffset](self, "dstOffset"));
  uint64_t v9 = [v8 hash];
  int64_t v10 = [(RCDeviceInfo *)self appVersion];
  uint64_t v11 = v7 ^ v9 ^ [v10 hash];
  id v12 = [(RCDeviceInfo *)self osVersion];
  uint64_t v13 = [v12 hash];
  id v14 = [(RCDeviceInfo *)self formatVersion];
  uint64_t v15 = v13 ^ [v14 hash];
  uint64_t v16 = [(RCDeviceInfo *)self seedNumber];
  uint64_t v17 = v15 ^ [v16 hash];
  uint64_t v18 = [(RCDeviceInfo *)self buildNumber];
  unint64_t v19 = v11 ^ v17 ^ [v18 hash];

  return v19;
}

- (NSString)description
{
  uint64_t v15 = NSString;
  uint64_t v14 = objc_opt_class();
  uint64_t v3 = [(RCDeviceInfo *)self preferredLanguages];
  id v4 = [(RCDeviceInfo *)self deviceType];
  int64_t v5 = [(RCDeviceInfo *)self utcOffset];
  int64_t v6 = [(RCDeviceInfo *)self dstOffset];
  uint64_t v7 = [(RCDeviceInfo *)self appVersion];
  v8 = [(RCDeviceInfo *)self osVersion];
  uint64_t v9 = [(RCDeviceInfo *)self formatVersion];
  int64_t v10 = [(RCDeviceInfo *)self seedNumber];
  uint64_t v11 = [(RCDeviceInfo *)self buildNumber];
  objc_msgSend(v15, "stringWithFormat:", @"<%@: %p; preferredLanguages: %@\n deviceType: %@\n utcOffset: %ld\n dstOffset: %ld\n appVersion: %@\n osVersion: %@\n formatVersion: %@\n seedNumber: %@\n buildNumber: %@>",
    v14,
    self,
    v3,
    v4,
    v5,
    v6,
    v7,
    v8,
    v9,
    v10,
  id v12 = v11);

  return (NSString *)v12;
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(RCDeviceInfo *)self preferredLanguages];
  objc_msgSend(v3, "rc_safelySetObjectAllowingNil:forKey:", v4, @"preferredLanguages");

  int64_t v5 = [(RCDeviceInfo *)self deviceType];
  objc_msgSend(v3, "rc_safelySetObjectAllowingNil:forKey:", v5, @"deviceType");

  int64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[RCDeviceInfo utcOffset](self, "utcOffset"));
  objc_msgSend(v3, "rc_safelySetObjectAllowingNil:forKey:", v6, @"utcOffsetSecs");

  uint64_t v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[RCDeviceInfo dstOffset](self, "dstOffset"));
  objc_msgSend(v3, "rc_safelySetObjectAllowingNil:forKey:", v7, @"dstOffsetSecs");

  v8 = [(RCDeviceInfo *)self appVersion];
  objc_msgSend(v3, "rc_safelySetObjectAllowingNil:forKey:", v8, @"appVersion");

  uint64_t v9 = [(RCDeviceInfo *)self osVersion];
  objc_msgSend(v3, "rc_safelySetObjectAllowingNil:forKey:", v9, @"osVersion");

  int64_t v10 = [(RCDeviceInfo *)self countryCode];
  objc_msgSend(v3, "rc_safelySetObjectAllowingNil:forKey:", v10, @"countryCode");

  uint64_t v11 = [(RCDeviceInfo *)self formatVersion];
  objc_msgSend(v3, "rc_safelySetObjectAllowingNil:forKey:", v11, @"formatVersion");

  id v12 = [(RCDeviceInfo *)self seedNumber];
  objc_msgSend(v3, "rc_safelySetObjectAllowingNil:forKey:", v12, @"seedNumber");

  uint64_t v13 = [(RCDeviceInfo *)self buildNumber];
  objc_msgSend(v3, "rc_safelySetObjectAllowingNil:forKey:", v13, @"buildNumber");

  uint64_t v14 = NSNumber;
  if (RCIsInternalBuild_onceToken != -1) {
    dispatch_once(&RCIsInternalBuild_onceToken, &__block_literal_global_7);
  }
  uint64_t v15 = [v14 numberWithBool:RCIsInternalBuild_internalBuild];
  objc_msgSend(v3, "rc_safelySetObjectAllowingNil:forKey:", v15, @"isInternal");

  uint64_t v16 = (void *)[v3 copy];

  return v16;
}

- (NSString)deviceType
{
  return self->_deviceType;
}

- (int64_t)utcOffset
{
  return self->_utcOffset;
}

- (int64_t)dstOffset
{
  return self->_dstOffset;
}

- (NSString)appVersion
{
  return self->_appVersion;
}

- (NSString)osVersion
{
  return self->_osVersion;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (NSString)formatVersion
{
  return self->_formatVersion;
}

- (NSString)seedNumber
{
  return self->_seedNumber;
}

- (NSString)buildNumber
{
  return self->_buildNumber;
}

@end