@interface WFAQIScaleCategoryNAQI(Localized)
- (NSString)scaleClassName;
- (id)description;
- (uint64_t)warningLevel;
@end

@implementation WFAQIScaleCategoryNAQI(Localized)

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
      v3 = @"WFAQI_Scale_IMECA_Category_Good";
      break;
    case 2:
      v1 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v2 = v1;
      v3 = @"WFAQI_Scale_NAQI_Category_Satisfactory";
      break;
    case 3:
      v1 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v2 = v1;
      v3 = @"WFAQI_Scale_NAQI_Category_Moderately_Polluted";
      break;
    case 4:
      v1 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v2 = v1;
      v3 = @"WFAQI_Scale_NAQI_Category_Poor";
      break;
    case 5:
      v1 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v2 = v1;
      v3 = @"WFAQI_Scale_NAQI_Category_Very_Poor";
      break;
    case 6:
      v1 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v2 = v1;
      v3 = @"WFAQI_Scale_NAQI_Category_Severe";
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