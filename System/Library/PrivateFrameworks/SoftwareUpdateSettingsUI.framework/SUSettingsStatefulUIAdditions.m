@interface SUSettingsStatefulUIAdditions
+ (double)estimatedTimeRemainingForProgress:(id)a3 valid:(BOOL *)a4;
+ (id)buildVersionIncludingRSR;
+ (id)currentOSVersion;
+ (id)productVersionWithExtra;
+ (id)stringWithTimeRemainingForDownload:(id)a3;
@end

@implementation SUSettingsStatefulUIAdditions

+ (id)currentOSVersion
{
  v25[2] = a1;
  v25[1] = (id)a2;
  v25[0] = 0;
  id v24 = 0;
  id v20 = (id)[MEMORY[0x263F82670] currentDevice];
  char v21 = objc_msgSend(v20, "sf_isiPad");

  if (v21)
  {
    id v19 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v2 = (id)[v19 localizedStringForKey:@"iPadOS_VERSION" value:&stru_26DCD7690 table:@"Software Update"];
    id v3 = v24;
    id v24 = v2;
  }
  else
  {
    id v18 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v4 = (id)[v18 localizedStringForKey:@"iOS_VERSION" value:&stru_26DCD7690 table:@"Software Update"];
    id v5 = v24;
    id v24 = v4;
  }
  id v23 = +[SUSettingsStatefulUIAdditions productVersionWithExtra];
  if (!v23)
  {
    id v17 = (id)[MEMORY[0x263F82670] currentDevice];
    id v23 = (id)[v17 systemVersion];
  }
  id v6 = (id)[NSString stringWithValidatedFormat:v24, @"%@", 0, v23 validFormatSpecifiers error];
  id v7 = v25[0];
  v25[0] = v6;

  id v15 = (id)[MEMORY[0x263F82670] currentDevice];
  char v16 = objc_msgSend(v15, "sf_isInternalInstall");

  if (v16)
  {
    id v22 = +[SUSettingsStatefulUIAdditions buildVersionIncludingRSR];
    v12 = NSString;
    id v14 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v13 = (id)[v14 localizedStringForKey:@"%@ (%@)" value:&stru_26DCD7690 table:@"Software Update"];
    id v8 = (id)objc_msgSend(v12, "stringWithFormat:", v25[0], v22);
    id v9 = v25[0];
    v25[0] = v8;

    objc_storeStrong(&v22, 0);
  }
  id v11 = v25[0];
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(v25, 0);
  return v11;
}

+ (double)estimatedTimeRemainingForProgress:(id)a3 valid:(BOOL *)a4
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  double v7 = -1.0;
  if (a4) {
    *a4 = 0;
  }
  if (!location[0]) {
    goto LABEL_13;
  }
  [location[0] timeRemaining];
  double v7 = v4;
  if (v4 < 0.0) {
    goto LABEL_13;
  }
  if (v4 > 0.0 && v4 < 1.0) {
    double v7 = 1.0;
  }
  if (v7 < (double)0x93A80uLL && v7 > 0.0)
  {
    if (a4) {
      *a4 = 1;
    }
    double v9 = v7;
  }
  else
  {
LABEL_13:
    double v9 = v7;
  }
  objc_storeStrong(location, 0);
  return v9;
}

+ (id)stringWithTimeRemainingForDownload:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v39 = (id)[location[0] progress];
  char v37 = 0;
  BOOL v15 = 0;
  if (v39)
  {
    id v38 = (id)[v39 phase];
    char v37 = 1;
    BOOL v15 = 0;
    if ([v38 isEqualToString:*MEMORY[0x263F78428]])
    {
      [v39 percentComplete];
      BOOL v15 = v3 >= 1.0;
    }
  }
  if (v37) {

  }
  if (v15)
  {
    id v14 = (id)[location[0] descriptor];
    char v35 = 0;
    char v33 = 0;
    char v31 = 0;
    char v29 = 0;
    if ([v14 isSplatOnly])
    {
      id v36 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      char v35 = 1;
      id v34 = (id)[v36 localizedStringForKey:@"PREPARING_RSR" value:&stru_26DCD7690 table:@"Software Update"];
      char v33 = 1;
      id v4 = v34;
    }
    else
    {
      id v32 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      char v31 = 1;
      id v30 = (id)[v32 localizedStringForKey:@"PREPARING_UPDATE" value:&stru_26DCD7690 table:@"Software Update"];
      char v29 = 1;
      id v4 = v30;
    }
    id v41 = v4;
    if (v29) {

    }
    if (v31) {
    if (v33)
    }

    if (v35) {
    int v28 = 1;
    }
  }
  else
  {
    id v13 = (id)[location[0] descriptor];
    char v25 = 0;
    char v23 = 0;
    char v21 = 0;
    char v19 = 0;
    if ([v13 isSplatOnly])
    {
      id v26 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      char v25 = 1;
      id v24 = (id)[v26 localizedStringForKey:@"RSR_REQUESTED" value:&stru_26DCD7690 table:@"Software Update"];
      char v23 = 1;
      id v5 = v24;
    }
    else
    {
      id v22 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      char v21 = 1;
      id v20 = (id)[v22 localizedStringForKey:@"UPDATE_REQUESTED" value:&stru_26DCD7690 table:@"Software Update"];
      char v19 = 1;
      id v5 = v20;
    }
    id v27 = v5;
    if (v19) {

    }
    if (v21) {
    if (v23)
    }

    if (v25) {
    char v18 = 0;
    }
    +[SUSettingsStatefulUIAdditions estimatedTimeRemainingForProgress:v39 valid:&v18];
    double v17 = v6;
    if (v18)
    {
      id v16 = 0;
      id v7 = objc_alloc_init(MEMORY[0x263F08780]);
      id v8 = v16;
      id v16 = v7;

      [v16 setUnitsStyle:3];
      [v16 setAllowedUnits:240];
      [v16 setMaximumUnitCount:1];
      [v16 setIncludesApproximationPhrase:1];
      [v16 setIncludesTimeRemainingPhrase:1];
      [v16 setFormattingContext:2];
      id v9 = (id)[v16 stringFromTimeInterval:v17];
      id v10 = v27;
      id v27 = v9;

      objc_storeStrong(&v16, 0);
    }
    id v41 = v27;
    int v28 = 1;
    objc_storeStrong(&v27, 0);
  }
  objc_storeStrong(&v39, 0);
  objc_storeStrong(location, 0);
  id v11 = v41;
  return v11;
}

+ (id)productVersionWithExtra
{
  v7[2] = a1;
  v7[1] = (id)a2;
  v7[0] = 0;
  id location = (id)_CFCopySupplementalVersionDictionary();
  if (location)
  {
    id v2 = (id)[location objectForKeyedSubscript:*MEMORY[0x263EFFAC8]];
    id v3 = v7[0];
    v7[0] = v2;
  }
  id v5 = v7[0];
  objc_storeStrong(&location, 0);
  objc_storeStrong(v7, 0);
  return v5;
}

+ (id)buildVersionIncludingRSR
{
  v7[2] = a1;
  v7[1] = (id)a2;
  v7[0] = 0;
  id location = (id)_CFCopySupplementalVersionDictionary();
  if (location)
  {
    id v2 = (id)[location objectForKeyedSubscript:*MEMORY[0x263EFFAB0]];
    id v3 = v7[0];
    v7[0] = v2;
  }
  id v5 = v7[0];
  objc_storeStrong(&location, 0);
  objc_storeStrong(v7, 0);
  return v5;
}

@end