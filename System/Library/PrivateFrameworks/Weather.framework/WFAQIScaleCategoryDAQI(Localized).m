@interface WFAQIScaleCategoryDAQI(Localized)
- (NSString)scaleClassName;
- (id)description;
- (uint64_t)warningLevel;
@end

@implementation WFAQIScaleCategoryDAQI(Localized)

- (NSString)scaleClassName
{
  v0 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v0);
}

- (uint64_t)warningLevel
{
  return 4;
}

- (id)description
{
  switch([a1 categoryIndex])
  {
    case 1:
      v1 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v2 = v1;
      v3 = @"WFAQI_Scale_DAQI_Category_Low_1";
      break;
    case 2:
      v1 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v2 = v1;
      v3 = @"WFAQI_Scale_DAQI_Category_Low_2";
      break;
    case 3:
      v1 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v2 = v1;
      v3 = @"WFAQI_Scale_DAQI_Category_Low_3";
      break;
    case 4:
      v1 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v2 = v1;
      v3 = @"WFAQI_Scale_DAQI_Category_Moderate_1";
      break;
    case 5:
      v1 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v2 = v1;
      v3 = @"WFAQI_Scale_DAQI_Category_Moderate_2";
      break;
    case 6:
      v1 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v2 = v1;
      v3 = @"WFAQI_Scale_DAQI_Category_Moderate_3";
      break;
    case 7:
      v1 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v2 = v1;
      v3 = @"WFAQI_Scale_DAQI_Category_High_1";
      break;
    case 8:
      v1 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v2 = v1;
      v3 = @"WFAQI_Scale_DAQI_Category_High_2";
      break;
    case 9:
      v1 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v2 = v1;
      v3 = @"WFAQI_Scale_DAQI_Category_High_3";
      break;
    case 10:
      v1 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v2 = v1;
      v3 = @"WFAQI_Scale_DAQI_Category_Very_High";
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