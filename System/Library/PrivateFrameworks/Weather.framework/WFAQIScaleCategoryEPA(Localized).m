@interface WFAQIScaleCategoryEPA(Localized)
- (NSString)scaleClassName;
- (id)description;
- (id)longDescription;
- (uint64_t)warningLevel;
@end

@implementation WFAQIScaleCategoryEPA(Localized)

- (NSString)scaleClassName
{
  v0 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v0);
}

- (uint64_t)warningLevel
{
  return 2;
}

- (id)description
{
  switch([a1 categoryIndex])
  {
    case 1:
      v1 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v2 = v1;
      v3 = @"WFAQI_Scale_EPA_Category_Good";
      break;
    case 2:
      v1 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v2 = v1;
      v3 = @"WFAQI_Scale_EPA_Category_Moderate";
      break;
    case 3:
      v1 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v2 = v1;
      v3 = @"WFAQI_Scale_EPA_Category_UnhealthyForSensitiveGroups";
      break;
    case 4:
      v1 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v2 = v1;
      v3 = @"WFAQI_Scale_EPA_Category_Unhealthy";
      break;
    case 5:
      v1 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v2 = v1;
      v3 = @"WFAQI_Scale_EPA_Category_Very_Unhealthy";
      break;
    case 6:
      v1 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v2 = v1;
      v3 = @"WFAQI_Scale_EPA_Category_Hazardous";
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

- (id)longDescription
{
  switch([a1 categoryIndex])
  {
    case 1:
      v1 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v2 = v1;
      v3 = @"WFAQI_Scale_EPA_Category_Good_Long";
      break;
    case 2:
      v1 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v2 = v1;
      v3 = @"WFAQI_Scale_EPA_Category_Moderate_Long";
      break;
    case 3:
      v1 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v2 = v1;
      v3 = @"WFAQI_Scale_EPA_Category_UnhealthyForSensitiveGroups_Long";
      break;
    case 4:
      v1 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v2 = v1;
      v3 = @"WFAQI_Scale_EPA_Category_Unhealthy_Long";
      break;
    case 5:
      v1 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v2 = v1;
      v3 = @"WFAQI_Scale_EPA_Category_Very_Unhealthy_Long";
      break;
    case 6:
      v1 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v2 = v1;
      v3 = @"WFAQI_Scale_EPA_Category_Hazardous_Long";
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