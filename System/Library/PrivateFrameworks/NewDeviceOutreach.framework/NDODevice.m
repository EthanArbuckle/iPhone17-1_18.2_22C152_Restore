@interface NDODevice
+ (BOOL)supportsSecureCoding;
+ (NDODevice)deviceWithCBDevice:(id)a3;
+ (NDODevice)deviceWithCBDevice:(id)a3 isVisibleInCC:(BOOL)a4;
+ (NDODevice)deviceWithDeviceListDevice:(id)a3;
+ (NDODevice)deviceWithName:(id)a3 serialNumber:(id)a4 activationDate:(id)a5 deviceType:(unint64_t)a6;
+ (NDODevice)deviceWithName:(id)a3 serialNumber:(id)a4 activationDate:(id)a5 deviceType:(unint64_t)a6 productID:(id)a7 productName:(id)a8;
+ (NDODevice)deviceWithName:(id)a3 serialNumber:(id)a4 activationDate:(id)a5 deviceType:(unint64_t)a6 productID:(id)a7 productName:(id)a8 isVisibleInCC:(BOOL)a9;
+ (id)watchDeviceWithName:(id)a3 serialNumber:(id)a4 activationDate:(id)a5 isActive:(BOOL)a6 productID:(id)a7 productName:(id)a8;
- (BOOL)acOfferEligible;
- (BOOL)cachingPolicy;
- (BOOL)covered;
- (BOOL)isActiveWatch;
- (BOOL)isVisibleInCC;
- (NDODevice)initWithCoder:(id)a3;
- (NDODevice)initWithName:(id)a3 serialNumber:(id)a4 activationDate:(id)a5 deviceType:(unint64_t)a6 productID:(id)a7 productName:(id)a8 isVisibleInCC:(BOOL)a9 cachingPolicy:(BOOL)a10;
- (NSDate)acOfferEligibleUntil;
- (NSDate)activationDate;
- (NSString)acLocalizedOfferStatusLabel;
- (NSString)acLocalizedUnlinkedPlanStatusLabel;
- (NSString)coverageLocalizedLabel;
- (NSString)description;
- (NSString)deviceDesc;
- (NSString)deviceImageUrl;
- (NSString)name;
- (NSString)parentId;
- (NSString)pfcId;
- (NSString)pgfId;
- (NSString)productID;
- (NSString)productName;
- (NSString)serialNumber;
- (NSString)sgId;
- (NSString)sourceFromDeviceType;
- (id)deviceTypeString;
- (id)productPlaceholderImage;
- (int64_t)colorCode;
- (unint64_t)deviceType;
- (void)encodeWithCoder:(id)a3;
- (void)setAcLocalizedOfferStatusLabel:(id)a3;
- (void)setAcLocalizedUnlinkedPlanStatusLabel:(id)a3;
- (void)setAcOfferEligible:(BOOL)a3;
- (void)setAcOfferEligibleUntil:(id)a3;
- (void)setActivationDate:(id)a3;
- (void)setCachingPolicy:(BOOL)a3;
- (void)setColorCode:(int64_t)a3;
- (void)setCoverageLocalizedLabel:(id)a3;
- (void)setCovered:(BOOL)a3;
- (void)setDeviceDesc:(id)a3;
- (void)setDeviceImageUrl:(id)a3;
- (void)setDeviceType:(unint64_t)a3;
- (void)setIsActiveWatch:(BOOL)a3;
- (void)setIsVisibleInCC:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setParentId:(id)a3;
- (void)setPfcId:(id)a3;
- (void)setPgfId:(id)a3;
- (void)setProductID:(id)a3;
- (void)setProductName:(id)a3;
- (void)setSerialNumber:(id)a3;
- (void)setSgId:(id)a3;
- (void)updateWithWarranty:(id)a3;
@end

@implementation NDODevice

+ (id)watchDeviceWithName:(id)a3 serialNumber:(id)a4 activationDate:(id)a5 isActive:(BOOL)a6 productID:(id)a7 productName:(id)a8
{
  BOOL v8 = a6;
  v9 = +[NDODevice deviceWithName:a3 serialNumber:a4 activationDate:a5 deviceType:1 productID:a7 productName:a8];
  [v9 setIsActiveWatch:v8];
  return v9;
}

+ (NDODevice)deviceWithName:(id)a3 serialNumber:(id)a4 activationDate:(id)a5 deviceType:(unint64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  LOWORD(v15) = 257;
  v13 = objc_msgSend(objc_alloc((Class)a1), "initWithName:serialNumber:activationDate:deviceType:productID:productName:isVisibleInCC:cachingPolicy:", v12, v11, v10, a6, 0, 0, v15);

  return (NDODevice *)v13;
}

+ (NDODevice)deviceWithName:(id)a3 serialNumber:(id)a4 activationDate:(id)a5 deviceType:(unint64_t)a6 productID:(id)a7 productName:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  LOWORD(v21) = 257;
  v19 = objc_msgSend(objc_alloc((Class)a1), "initWithName:serialNumber:activationDate:deviceType:productID:productName:isVisibleInCC:cachingPolicy:", v18, v17, v16, a6, v15, v14, v21);

  return (NDODevice *)v19;
}

+ (NDODevice)deviceWithName:(id)a3 serialNumber:(id)a4 activationDate:(id)a5 deviceType:(unint64_t)a6 productID:(id)a7 productName:(id)a8 isVisibleInCC:(BOOL)a9
{
  id v15 = a8;
  id v16 = a7;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  BYTE1(v22) = 1;
  LOBYTE(v22) = a9;
  v20 = objc_msgSend(objc_alloc((Class)a1), "initWithName:serialNumber:activationDate:deviceType:productID:productName:isVisibleInCC:cachingPolicy:", v19, v18, v17, a6, v16, v15, v22);

  return (NDODevice *)v20;
}

- (NDODevice)initWithName:(id)a3 serialNumber:(id)a4 activationDate:(id)a5 deviceType:(unint64_t)a6 productID:(id)a7 productName:(id)a8 isVisibleInCC:(BOOL)a9 cachingPolicy:(BOOL)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a7;
  id v20 = a8;
  v24.receiver = self;
  v24.super_class = (Class)NDODevice;
  uint64_t v21 = [(NDODevice *)&v24 init];
  uint64_t v22 = v21;
  if (v21)
  {
    [(NDODevice *)v21 setName:v16];
    [(NDODevice *)v22 setSerialNumber:v17];
    [(NDODevice *)v22 setDeviceType:a6];
    [(NDODevice *)v22 setActivationDate:v18];
    [(NDODevice *)v22 setProductID:v19];
    [(NDODevice *)v22 setProductName:v20];
    [(NDODevice *)v22 setIsVisibleInCC:a9];
    [(NDODevice *)v22 setCachingPolicy:a10];
  }

  return v22;
}

+ (NDODevice)deviceWithDeviceListDevice:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"coverageInfo"];
  v5 = [v3 objectForKeyedSubscript:@"deviceInfo"];
  v6 = [v3 objectForKeyedSubscript:@"deviceType"];
  if ([v6 isEqualToString:@"APPLE_ID"])
  {
    uint64_t v7 = 2;
  }
  else if ([v6 isEqualToString:@"PRIMARY"])
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = 3;
  }
  BOOL v8 = [v3 objectForKeyedSubscript:@"cachePolicy"];
  char v9 = [v8 isEqualToString:@"NO_CACHE"];

  id v10 = [v5 objectForKeyedSubscript:@"nickName"];
  if (![v10 length])
  {
    uint64_t v11 = [v5 objectForKeyedSubscript:@"deviceDesc"];

    id v10 = (void *)v11;
  }
  id v12 = [NDODevice alloc];
  v13 = [v5 objectForKeyedSubscript:@"serialNumber"];
  id v14 = [v5 objectForKeyedSubscript:@"deviceDesc"];
  BYTE1(v30) = v9 ^ 1;
  LOBYTE(v30) = 1;
  id v15 = -[NDODevice initWithName:serialNumber:activationDate:deviceType:productID:productName:isVisibleInCC:cachingPolicy:](v12, "initWithName:serialNumber:activationDate:deviceType:productID:productName:isVisibleInCC:cachingPolicy:", v10, v13, 0, v7, 0, v14, v30);

  id v16 = [v4 objectForKeyedSubscript:@"acOfferEligible"];
  -[NDODevice setAcOfferEligible:](v15, "setAcOfferEligible:", [v16 BOOLValue]);

  id v17 = [v4 objectForKeyedSubscript:@"acOfferEligibleUntil"];
  id v18 = +[NDOUtilities dateWithEpochNumber:v17];
  [(NDODevice *)v15 setAcOfferEligibleUntil:v18];

  id v19 = [v4 objectForKeyedSubscript:@"covered"];
  -[NDODevice setCovered:](v15, "setCovered:", [v19 BOOLValue]);

  id v20 = [v4 objectForKeyedSubscript:@"coverageLocalizedLabel"];
  [(NDODevice *)v15 setCoverageLocalizedLabel:v20];

  uint64_t v21 = [v4 objectForKeyedSubscript:@"acLocalizedOfferStatusLabel"];
  [(NDODevice *)v15 setAcLocalizedOfferStatusLabel:v21];

  uint64_t v22 = [v4 objectForKeyedSubscript:@"acLocalizedUnlinkedPlanStatusLabel"];
  [(NDODevice *)v15 setAcLocalizedUnlinkedPlanStatusLabel:v22];

  v23 = [v5 objectForKeyedSubscript:@"deviceImageUrl"];
  [(NDODevice *)v15 setDeviceImageUrl:v23];

  objc_super v24 = [v5 objectForKeyedSubscript:@"deviceDesc"];
  [(NDODevice *)v15 setDeviceDesc:v24];

  v25 = [v5 objectForKeyedSubscript:@"sgId"];
  [(NDODevice *)v15 setSgId:v25];

  v26 = [v5 objectForKeyedSubscript:@"pfcId"];
  [(NDODevice *)v15 setPfcId:v26];

  v27 = [v5 objectForKeyedSubscript:@"pgfId"];
  [(NDODevice *)v15 setPgfId:v27];

  v28 = [v5 objectForKeyedSubscript:@"parentId"];
  [(NDODevice *)v15 setParentId:v28];

  return v15;
}

+ (NDODevice)deviceWithCBDevice:(id)a3
{
  return +[NDODevice deviceWithCBDevice:a3 isVisibleInCC:1];
}

+ (NDODevice)deviceWithCBDevice:(id)a3 isVisibleInCC:(BOOL)a4
{
  id v5 = a3;
  v6 = [v5 name];
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = v6;
LABEL_3:
    char v9 = v8;
    goto LABEL_44;
  }
  uint64_t v10 = [v5 productID];
  uint64_t v11 = v10;
  if ((int)v10 <= 665)
  {
    if ((int)v10 > 570)
    {
      if ((int)v10 > 598)
      {
        switch((int)v10)
        {
          case 613:
            goto LABEL_27;
          case 614:
          case 616:
          case 618:
          case 619:
            goto LABEL_113;
          case 615:
            goto LABEL_37;
          case 617:
            goto LABEL_36;
          case 620:
            id v12 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
            v13 = v12;
            id v14 = @"apple_magic_keyboard_keypad";
            goto LABEL_42;
          default:
            if (v10 != 599) {
              goto LABEL_113;
            }
            goto LABEL_41;
        }
      }
      if (v10 != 571 && v10 != 597 && v10 != 598) {
        goto LABEL_113;
      }
    }
    else if ((int)v10 <= 555)
    {
      if ((int)v10 > 520)
      {
        if (v10 != 521 && v10 != 522) {
          goto LABEL_113;
        }
      }
      else
      {
        if (!v10)
        {
LABEL_54:
          objc_msgSend(v5, "deviceType", v11);
          CBDeviceTypeToNSLocalizedString();
          id v8 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_3;
        }
        if (v10 != 520) {
          goto LABEL_113;
        }
      }
    }
    else if ((int)v10 > 558 && v10 != 569 && v10 != 570)
    {
      goto LABEL_113;
    }
LABEL_41:
    id v12 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
    v13 = v12;
    id v14 = @"apple_wireless_keyboard";
LABEL_42:
    uint64_t v15 = [v12 localizedStringForKey:v14 value:&stru_26EF9F650 table:@"CBLocalizable"];
    goto LABEL_43;
  }
  if ((int)v10 > 799)
  {
    if ((int)v10 <= 8212)
    {
      switch((int)v10)
      {
        case 800:
          goto LABEL_37;
        case 801:
          goto LABEL_69;
        case 802:
          goto LABEL_35;
        case 803:
          goto LABEL_36;
        case 804:
          goto LABEL_27;
        default:
          goto LABEL_113;
      }
    }
    if (v10 != 8220 && v10 != 8216 && v10 != 8213) {
      goto LABEL_113;
    }
    id v12 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
    v13 = v12;
    id v14 = @"apple_airpods_case";
    goto LABEL_42;
  }
  if ((int)v10 > 776)
  {
    switch((int)v10)
    {
      case 777:
        id v12 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
        v13 = v12;
        id v14 = @"apple_wireless_mouse";
        goto LABEL_42;
      case 780:
        id v12 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
        v13 = v12;
        id v14 = @"apple_mighty_mouse";
        goto LABEL_42;
      case 781:
LABEL_36:
        id v12 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
        v13 = v12;
        id v14 = @"apple_magic_mouse";
        goto LABEL_42;
      case 782:
LABEL_27:
        id v12 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
        v13 = v12;
        id v14 = @"apple_magic_trackpad";
        goto LABEL_42;
      default:
        goto LABEL_113;
    }
  }
  switch(v10)
  {
    case 0x29A:
LABEL_69:
      id v12 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v13 = v12;
      id v14 = @"apple_magic_keyboard_touch";
      goto LABEL_42;
    case 0x29C:
LABEL_37:
      id v12 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v13 = v12;
      id v14 = @"apple_magic_keyboard";
      goto LABEL_42;
    case 0x29F:
LABEL_35:
      id v12 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CoreBluetooth"];
      v13 = v12;
      id v14 = @"apple_magic_keyboard_touch_keypad";
      goto LABEL_42;
  }
LABEL_113:
  v13 = [MEMORY[0x263EFEF68] productInfoWithProductID:v10];
  uint64_t v15 = [v13 productName];
LABEL_43:
  char v9 = (void *)v15;

  if (!v9) {
    goto LABEL_54;
  }
LABEL_44:

  id v16 = [v5 serialNumber];
  id v17 = NSString;
  int v18 = [v5 productID];
  if (v18 > 21759)
  {
    if (v18 <= 28943)
    {
      if (v18 > 28935)
      {
        if (v18 == 28936)
        {
          id v19 = "AppleTV6,2";
          goto LABEL_108;
        }
        if (v18 == 28943)
        {
          id v19 = "AudioAccessory1,1";
          goto LABEL_108;
        }
      }
      else
      {
        if (v18 == 21760)
        {
          id v19 = "Device1,21760";
          goto LABEL_108;
        }
        if (v18 == 28420)
        {
          id v19 = "AppleTV5,3";
          goto LABEL_108;
        }
      }
    }
    else if (v18 <= 29714)
    {
      if (v18 == 28944)
      {
        id v19 = "AudioAccessory1,2";
        goto LABEL_108;
      }
      if (v18 == 29455)
      {
        id v19 = "AppleTV11,2";
        goto LABEL_108;
      }
    }
    else
    {
      switch(v18)
      {
        case 29715:
          id v19 = "AudioAccessory5,1";
          goto LABEL_108;
        case 65533:
          id v19 = "HeGn";
          goto LABEL_108;
        case 65534:
          id v19 = "ApGn";
          goto LABEL_108;
      }
    }
    goto LABEL_107;
  }
  if (v18 <= 8193)
  {
    switch(v18)
    {
      case 0:
        id v19 = "Invalid";
        goto LABEL_108;
      case 614:
        id v19 = "ATVRemote1,1";
        goto LABEL_108;
      case 621:
        id v19 = "ATVRemote1,2";
        goto LABEL_108;
    }
LABEL_107:
    id v19 = "?";
    goto LABEL_108;
  }
  switch(v18)
  {
    case 8194:
      id v19 = "AirPods1,1";
      break;
    case 8195:
      id v19 = "PowerBeats3,1";
      break;
    case 8197:
      id v19 = "BeatsX1,1";
      break;
    case 8198:
      id v19 = "BeatsSolo3,1";
      break;
    case 8201:
      id v19 = "BeatsStudio3,2";
      break;
    case 8202:
      id v19 = "Device1,8202";
      break;
    case 8203:
      id v19 = "PowerbeatsPro1,1";
      break;
    case 8204:
      id v19 = "BeatsSoloPro1,1";
      break;
    case 8205:
      id v19 = "Powerbeats4,1";
      break;
    case 8206:
      id v19 = "AirPodsPro1,1";
      break;
    case 8207:
      id v19 = "AirPods1,3";
      break;
    case 8208:
      id v19 = "Device1,8208";
      break;
    case 8209:
      id v19 = "BeatsStudioBuds1,1";
      break;
    case 8210:
      id v19 = "Device1,8210";
      break;
    case 8211:
      id v19 = "Device1,8211";
      break;
    case 8212:
      id v19 = "Device1,8212";
      break;
    case 8213:
      id v19 = "Device1,8213";
      break;
    case 8214:
      id v19 = "BeatsStudioBuds1,2";
      break;
    case 8215:
      id v19 = "BeatsStudioPro1,1";
      break;
    case 8216:
      id v19 = "Device1,8216";
      break;
    case 8217:
      id v19 = "Device1,8217";
      break;
    case 8218:
      id v19 = "Device1,8218";
      break;
    case 8219:
      id v19 = "Device1,8219";
      break;
    case 8220:
      id v19 = "Device1,8220";
      break;
    case 8221:
      id v19 = "Device1,8221";
      break;
    case 8222:
      id v19 = "Device1,8222";
      break;
    case 8223:
      id v19 = "Device1,8223";
      break;
    case 8224:
      id v19 = "Device1,8224";
      break;
    case 8228:
      id v19 = "Device1,8228";
      break;
    case 8229:
      id v19 = "Device1,8229";
      break;
    case 8230:
      id v19 = "Device1,8230";
      break;
    default:
      goto LABEL_107;
  }
LABEL_108:
  id v20 = [v17 stringWithUTF8String:v19];
  uint64_t v21 = [v5 productName];
  LOBYTE(v24) = a4;
  uint64_t v22 = +[NDODevice deviceWithName:v9 serialNumber:v16 activationDate:0 deviceType:3 productID:v20 productName:v21 isVisibleInCC:v24];

  objc_msgSend(v22, "setColorCode:", objc_msgSend(v5, "colorCodeBest"));
  return (NDODevice *)v22;
}

- (NSString)sourceFromDeviceType
{
  unint64_t v2 = [(NDODevice *)self deviceType];
  if (v2 - 1 > 2) {
    return (NSString *)@"DEFAULT";
  }
  else {
    return &off_264E26408[v2 - 1]->isa;
  }
}

- (id)deviceTypeString
{
  unint64_t v2 = [(NDODevice *)self deviceType];
  if (v2 - 1 > 2) {
    return @"Default";
  }
  else {
    return off_264E26420[v2 - 1];
  }
}

- (id)productPlaceholderImage
{
  if ([(NDODevice *)self deviceType])
  {
    if ([(NDODevice *)self deviceType] == 1)
    {
      id v3 = (void *)MEMORY[0x263F827E8];
      v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v5 = @"watch";
      goto LABEL_18;
    }
    id v8 = [(NDODevice *)self productID];

    if (!v8) {
      goto LABEL_17;
    }
    char v9 = [(NDODevice *)self productID];
    int v10 = CBProductIDFromNSString();

    char v11 = v10 - 2;
    if ((v10 - 8194) > 0x24) {
      goto LABEL_17;
    }
    if (((1 << v11) & 0x180931CE9ALL) != 0)
    {
      id v3 = (void *)MEMORY[0x263F827E8];
      v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v5 = @"Beats";
      goto LABEL_18;
    }
    if (((1 << v11) & 0x452863001) != 0)
    {
      id v3 = (void *)MEMORY[0x263F827E8];
      v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v5 = @"airpods";
      goto LABEL_18;
    }
    if (((1 << v11) & 0x20000100) != 0)
    {
      id v3 = (void *)MEMORY[0x263F827E8];
      v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v5 = @"airpodMax";
    }
    else
    {
LABEL_17:
      id v3 = (void *)MEMORY[0x263F827E8];
      v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v5 = @"audio";
    }
  }
  else
  {
    v6 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v7 = [v6 userInterfaceIdiom];

    if (v7 == 1)
    {
      id v3 = (void *)MEMORY[0x263F827E8];
      v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v5 = @"iPad";
    }
    else
    {
      id v12 = [MEMORY[0x263F82670] currentDevice];
      uint64_t v13 = [v12 userInterfaceIdiom];

      id v3 = (void *)MEMORY[0x263F827E8];
      v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      if (v13 == 6) {
        id v5 = @"visonpro";
      }
      else {
        id v5 = @"iPhone";
      }
    }
  }
LABEL_18:
  id v14 = [v3 imageNamed:v5 inBundle:v4 withConfiguration:0];

  return v14;
}

- (NSString)description
{
  id v3 = NSString;
  v4 = [(NDODevice *)self name];
  id v5 = [(NDODevice *)self serialNumber];
  v6 = [(NDODevice *)self activationDate];
  uint64_t v7 = [(NDODevice *)self deviceTypeString];
  id v8 = [(NDODevice *)self productID];
  char v9 = [(NDODevice *)self productName];
  int v10 = [v3 stringWithFormat:@"%@ :: (%@) :: (%@) :: %@ - %@ :: (%@) :: (isActiveWatch:%d) :: %d", v4, v5, v6, v7, v8, v9, -[NDODevice isActiveWatch](self, "isActiveWatch"), -[NDODevice isVisibleInCC](self, "isVisibleInCC")];

  return (NSString *)v10;
}

- (void)updateWithWarranty:(id)a3
{
  id v9 = a3;
  -[NDODevice setAcOfferEligible:](self, "setAcOfferEligible:", [v9 acOfferEligible]);
  -[NDODevice setCovered:](self, "setCovered:", [v9 covered]);
  v4 = [v9 coverageLocalizedLabel];
  [(NDODevice *)self setCoverageLocalizedLabel:v4];

  id v5 = [v9 acLocalizedOfferStatusLabel];
  [(NDODevice *)self setAcLocalizedOfferStatusLabel:v5];

  v6 = [v9 acLocalizedUnlinkedPlanStatusLabel];
  [(NDODevice *)self setAcLocalizedUnlinkedPlanStatusLabel:v6];

  uint64_t v7 = [(NDODevice *)self deviceImageUrl];

  if (!v7)
  {
    id v8 = [v9 deviceImageUrl];
    [(NDODevice *)self setDeviceImageUrl:v8];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(NDODevice *)self name];
  [v4 encodeObject:v5 forKey:@"name"];

  v6 = [(NDODevice *)self serialNumber];
  [v4 encodeObject:v6 forKey:@"serialNumber"];

  uint64_t v7 = [(NDODevice *)self activationDate];
  [v4 encodeObject:v7 forKey:@"activationDate"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[NDODevice deviceType](self, "deviceType"), @"deviceType");
  objc_msgSend(v4, "encodeInteger:forKey:", -[NDODevice colorCode](self, "colorCode"), @"colorCode");
  id v8 = [(NDODevice *)self productID];
  [v4 encodeObject:v8 forKey:@"productID"];

  id v9 = [(NDODevice *)self productName];
  [v4 encodeObject:v9 forKey:@"productName"];

  objc_msgSend(v4, "encodeBool:forKey:", -[NDODevice isActiveWatch](self, "isActiveWatch"), @"isActiveWatch");
  objc_msgSend(v4, "encodeBool:forKey:", -[NDODevice isVisibleInCC](self, "isVisibleInCC"), @"isVisibleInCC");
  objc_msgSend(v4, "encodeBool:forKey:", -[NDODevice acOfferEligible](self, "acOfferEligible"), @"acOfferEligible");
  objc_msgSend(v4, "encodeBool:forKey:", -[NDODevice covered](self, "covered"), @"covered");
  int v10 = [(NDODevice *)self coverageLocalizedLabel];
  [v4 encodeObject:v10 forKey:@"coverageLocalizedLabel"];

  char v11 = [(NDODevice *)self acLocalizedOfferStatusLabel];
  [v4 encodeObject:v11 forKey:@"acLocalizedOfferStatusLabel"];

  id v12 = [(NDODevice *)self acLocalizedUnlinkedPlanStatusLabel];
  [v4 encodeObject:v12 forKey:@"acLocalizedUnlinkedPlanStatusLabel"];

  uint64_t v13 = [(NDODevice *)self deviceImageUrl];
  [v4 encodeObject:v13 forKey:@"deviceImageUrl"];

  id v14 = [(NDODevice *)self deviceDesc];
  [v4 encodeObject:v14 forKey:@"deviceDesc"];

  uint64_t v15 = [(NDODevice *)self sgId];
  [v4 encodeObject:v15 forKey:@"sgId"];

  id v16 = [(NDODevice *)self pfcId];
  [v4 encodeObject:v16 forKey:@"pfcId"];

  id v17 = [(NDODevice *)self pgfId];
  [v4 encodeObject:v17 forKey:@"pgfId"];

  int v18 = [(NDODevice *)self parentId];
  [v4 encodeObject:v18 forKey:@"parentId"];

  id v19 = [(NDODevice *)self acOfferEligibleUntil];
  [v4 encodeObject:v19 forKey:@"acOfferEligibleUntil"];
}

- (NDODevice)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)NDODevice;
  id v5 = [(NDODevice *)&v22 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    [(NDODevice *)v5 setName:v6];

    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serialNumber"];
    [(NDODevice *)v5 setSerialNumber:v7];

    id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activationDate"];
    [(NDODevice *)v5 setActivationDate:v8];

    -[NDODevice setDeviceType:](v5, "setDeviceType:", [v4 decodeIntegerForKey:@"deviceType"]);
    -[NDODevice setColorCode:](v5, "setColorCode:", [v4 decodeIntegerForKey:@"colorCode"]);
    id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productID"];
    [(NDODevice *)v5 setProductID:v9];

    int v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productName"];
    [(NDODevice *)v5 setProductName:v10];

    -[NDODevice setIsActiveWatch:](v5, "setIsActiveWatch:", [v4 decodeBoolForKey:@"isActiveWatch"]);
    -[NDODevice setIsVisibleInCC:](v5, "setIsVisibleInCC:", [v4 decodeBoolForKey:@"isVisibleInCC"]);
    -[NDODevice setAcOfferEligible:](v5, "setAcOfferEligible:", [v4 decodeBoolForKey:@"acOfferEligible"]);
    -[NDODevice setCovered:](v5, "setCovered:", [v4 decodeBoolForKey:@"covered"]);
    char v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"coverageLocalizedLabel"];
    [(NDODevice *)v5 setCoverageLocalizedLabel:v11];

    id v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"acLocalizedOfferStatusLabel"];
    [(NDODevice *)v5 setAcLocalizedOfferStatusLabel:v12];

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"acLocalizedUnlinkedPlanStatusLabel"];
    [(NDODevice *)v5 setAcLocalizedUnlinkedPlanStatusLabel:v13];

    id v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceImageUrl"];
    [(NDODevice *)v5 setDeviceImageUrl:v14];

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceDesc"];
    [(NDODevice *)v5 setDeviceDesc:v15];

    id v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sgId"];
    [(NDODevice *)v5 setSgId:v16];

    id v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pfcId"];
    [(NDODevice *)v5 setPfcId:v17];

    int v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pgfId"];
    [(NDODevice *)v5 setPgfId:v18];

    id v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parentId"];
    [(NDODevice *)v5 setParentId:v19];

    id v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"acOfferEligibleUntil"];
    [(NDODevice *)v5 setAcOfferEligibleUntil:v20];
  }
  return v5;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setName:(id)a3
{
}

- (NSString)serialNumber
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSerialNumber:(id)a3
{
}

- (NSDate)activationDate
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setActivationDate:(id)a3
{
}

- (unint64_t)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(unint64_t)a3
{
  self->_deviceType = a3;
}

- (NSString)productID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setProductID:(id)a3
{
}

- (NSString)productName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setProductName:(id)a3
{
}

- (int64_t)colorCode
{
  return self->_colorCode;
}

- (void)setColorCode:(int64_t)a3
{
  self->_colorCode = a3;
}

- (BOOL)isActiveWatch
{
  return self->_isActiveWatch;
}

- (void)setIsActiveWatch:(BOOL)a3
{
  self->_isActiveWatch = a3;
}

- (BOOL)cachingPolicy
{
  return self->_cachingPolicy;
}

- (void)setCachingPolicy:(BOOL)a3
{
  self->_cachingPolicy = a3;
}

- (BOOL)isVisibleInCC
{
  return self->_isVisibleInCC;
}

- (void)setIsVisibleInCC:(BOOL)a3
{
  self->_isVisibleInCC = a3;
}

- (BOOL)acOfferEligible
{
  return self->_acOfferEligible;
}

- (void)setAcOfferEligible:(BOOL)a3
{
  self->_acOfferEligible = a3;
}

- (NSString)coverageLocalizedLabel
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCoverageLocalizedLabel:(id)a3
{
}

- (NSString)acLocalizedOfferStatusLabel
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setAcLocalizedOfferStatusLabel:(id)a3
{
}

- (NSString)acLocalizedUnlinkedPlanStatusLabel
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setAcLocalizedUnlinkedPlanStatusLabel:(id)a3
{
}

- (BOOL)covered
{
  return self->_covered;
}

- (void)setCovered:(BOOL)a3
{
  self->_covered = a3;
}

- (NSString)deviceImageUrl
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDeviceImageUrl:(id)a3
{
}

- (NSString)deviceDesc
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setDeviceDesc:(id)a3
{
}

- (NSString)sgId
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setSgId:(id)a3
{
}

- (NSString)pfcId
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setPfcId:(id)a3
{
}

- (NSString)pgfId
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setPgfId:(id)a3
{
}

- (NSString)parentId
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setParentId:(id)a3
{
}

- (NSDate)acOfferEligibleUntil
{
  return (NSDate *)objc_getProperty(self, a2, 144, 1);
}

- (void)setAcOfferEligibleUntil:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acOfferEligibleUntil, 0);
  objc_storeStrong((id *)&self->_parentId, 0);
  objc_storeStrong((id *)&self->_pgfId, 0);
  objc_storeStrong((id *)&self->_pfcId, 0);
  objc_storeStrong((id *)&self->_sgId, 0);
  objc_storeStrong((id *)&self->_deviceDesc, 0);
  objc_storeStrong((id *)&self->_deviceImageUrl, 0);
  objc_storeStrong((id *)&self->_acLocalizedUnlinkedPlanStatusLabel, 0);
  objc_storeStrong((id *)&self->_acLocalizedOfferStatusLabel, 0);
  objc_storeStrong((id *)&self->_coverageLocalizedLabel, 0);
  objc_storeStrong((id *)&self->_productName, 0);
  objc_storeStrong((id *)&self->_productID, 0);
  objc_storeStrong((id *)&self->_activationDate, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end