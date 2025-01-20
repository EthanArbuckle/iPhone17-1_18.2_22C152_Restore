@interface WFAQIScaleCategoryCAQI(Localized)
- (NSString)scaleClassName;
- (id)description;
- (uint64_t)warningLevel;
@end

@implementation WFAQIScaleCategoryCAQI(Localized)

- (NSString)scaleClassName
{
  v0 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v0);
}

- (uint64_t)warningLevel
{
  return 3;
}

- (id)description
{
  switch([a1 categoryIndex])
  {
    case 1:
      v1 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v2 = v1;
      v3 = @"WFAQI_Scale_CAQI_Category_Very_Low";
      break;
    case 2:
      v1 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v2 = v1;
      v3 = @"WFAQI_Scale_CAQI_Category_Low";
      break;
    case 3:
      v1 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v2 = v1;
      v3 = @"WFAQI_Scale_CAQI_Category_Medium";
      break;
    case 4:
      v1 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v2 = v1;
      v3 = @"WFAQI_Scale_CAQI_Category_High";
      break;
    case 5:
      v1 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v2 = v1;
      v3 = @"WFAQI_Scale_CAQI_Category_Very_High";
      break;
    default:
      v1 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v2 = v1;
      v3 = @"WFAQI_Scale_Category_Unknown";
      break;
  }
  v4 = [v1 localizedStringForKey:v3 value:&stru_26DADC2F0 table:@"WeatherFrameworkLocalizableStrings"];

  return v4;
}

@end