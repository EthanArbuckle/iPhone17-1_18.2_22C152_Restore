@interface TPSCustomCapabilityValidationBuilder
+ (id)deviceCapabilityValidationMap;
+ (id)targetValidationForCapability:(id)a3;
+ (id)targetValidationForNRDeviceCapability:(id)a3;
+ (id)watchCapabilityValidationMap;
@end

@implementation TPSCustomCapabilityValidationBuilder

+ (id)targetValidationForCapability:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_alloc_init(TPSTargetingValidation);
  if ([v4 type] == 2)
  {
    v6 = [a1 deviceCapabilityValidationMap];
    v7 = [v4 key];
    v8 = (objc_class *)[v6 objectForKeyedSubscript:v7];

    if (v8)
    {
      v9 = (TPSTargetingValidation *)objc_alloc_init(v8);

      v5 = v9;
    }
    uint64_t v10 = [v4 key];
    if (v10)
    {
      v11 = (void *)v10;
      v12 = [v4 value];

      if (v12)
      {
        v13 = [v4 key];
        v17 = v13;
        v14 = [v4 value];
        v18[0] = v14;
        v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
        [(TPSTargetingValidation *)v5 setTargetContext:v15];
      }
    }
    -[TPSTargetingValidation setJoinType:](v5, "setJoinType:", [v4 joinType]);
  }

  return v5;
}

+ (id)deviceCapabilityValidationMap
{
  if (deviceCapabilityValidationMap_onceToken != -1) {
    dispatch_once(&deviceCapabilityValidationMap_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)deviceCapabilityValidationMap_capabilityMap;

  return v2;
}

void __69__TPSCustomCapabilityValidationBuilder_deviceCapabilityValidationMap__block_invoke()
{
  v3[69] = *MEMORY[0x1E4F143B8];
  v2[0] = @"BetaUser";
  v3[0] = objc_opt_class();
  v2[1] = @"6a4a9403835f9f19136d51a5fda2eb4cdbb2f115";
  v3[1] = objc_opt_class();
  v2[2] = @"62e200ccfc12f2f7df0045e62966165a84b22865";
  v3[2] = objc_opt_class();
  v2[3] = @"AppleArcadeSubscription";
  v3[3] = objc_opt_class();
  v2[4] = @"AppleCardSetup";
  v3[4] = objc_opt_class();
  v2[5] = @"AppleCashFamily";
  v3[5] = objc_opt_class();
  v2[6] = @"AppleCashSetup";
  v3[6] = objc_opt_class();
  v2[7] = @"ApplePayActivation";
  v3[7] = objc_opt_class();
  v2[8] = @"ApplePayPeer";
  v3[8] = objc_opt_class();
  v2[9] = @"ApplePaySetup";
  v3[9] = objc_opt_class();
  v2[10] = @"AppleTVHomePod";
  v3[10] = objc_opt_class();
  v2[11] = @"AppStoreRegion";
  v3[11] = objc_opt_class();
  v2[12] = @"f26177587586682d72004e360c3d302bcd88fded";
  v3[12] = objc_opt_class();
  v2[13] = @"32971e46f383403dfbcf0e9ce5455486d889c24";
  v3[13] = objc_opt_class();
  v2[14] = @"2f480e181229a3cfe6797ccd6710bd93b8303c4c";
  v3[14] = objc_opt_class();
  v2[15] = @"e2144efa67e3162124c9db7498f21dc65ced81a5";
  v3[15] = objc_opt_class();
  v2[16] = @"58656d847de7d3f11b334345d2a09a0a171e4803";
  v3[16] = objc_opt_class();
  v2[17] = @"6aac0d229f037e21ac5a19d6836811e6cf1df434";
  v3[17] = objc_opt_class();
  v2[18] = @"ContainsLanguage";
  v3[18] = objc_opt_class();
  v2[19] = @"ContextualEvent";
  v3[19] = objc_opt_class();
  v2[20] = @"DictationLanguages";
  v3[20] = objc_opt_class();
  v2[21] = @"DualSim";
  v3[21] = objc_opt_class();
  v2[22] = @"97a844593f69be5f9b53f9d6492f343887622d07";
  v3[22] = objc_opt_class();
  v2[23] = @"ExcludeApps";
  v3[23] = objc_opt_class();
  v2[24] = @"b83326572480b130f53f6be070dcdba8dbb7ffee";
  v3[24] = objc_opt_class();
  v2[25] = @"FamilyHasChild";
  v3[25] = objc_opt_class();
  v2[26] = @"FamilyIsChildAccount";
  v3[26] = objc_opt_class();
  v2[27] = @"FamilyOrganizer";
  v3[27] = objc_opt_class();
  v2[28] = @"32316fa371b1b1a819b91ee347c5db5e2841e942";
  v3[28] = objc_opt_class();
  v2[29] = @"370bbcbee5e996dc60e8b7ec961bc0310d21f150";
  v3[29] = objc_opt_class();
  v2[30] = @"b82a54bd17d8787ff536a1e2619eceea03b5e7c8";
  v3[30] = objc_opt_class();
  v2[31] = @"9e401c3ab1c7e98e989f578806e04139d2ab12c2";
  v3[31] = objc_opt_class();
  v2[32] = @"HKFeatureStatus";
  v3[32] = objc_opt_class();
  v2[33] = @"HealthRecordsAccountInfoStatus";
  v3[33] = objc_opt_class();
  v2[34] = @"HeySiriAvailable";
  v3[34] = objc_opt_class();
  v2[35] = @"HeySiriEnabled";
  v3[35] = objc_opt_class();
  v2[36] = @"HeySiriEverUsed";
  v3[36] = objc_opt_class();
  v2[37] = @"HomeSetup";
  v3[37] = objc_opt_class();
  v2[38] = @"HomeSetupWithAccessories";
  v3[38] = objc_opt_class();
  v2[39] = @"f351e061575fb4e0fd7988380c83c47ba0d52434";
  v3[39] = objc_opt_class();
  v2[40] = @"f591050f8d0408ad3bc4e62cab04daa3a0d273df";
  v3[40] = objc_opt_class();
  v2[41] = @"KeyboardExtendedSuggestions";
  v3[41] = objc_opt_class();
  v2[42] = @"HandwritingKeyboardEnabled";
  v3[42] = objc_opt_class();
  v2[43] = @"InstalledKeyboards";
  v3[43] = objc_opt_class();
  v2[44] = @"17eb06719c9d3aabf50bb59c4a7e774a60c65777";
  v3[44] = objc_opt_class();
  v2[45] = @"74d51db7850d6d7ce6338bdd62165a98508cad47";
  v3[45] = objc_opt_class();
  v2[46] = @"MedicalIDEnabled";
  v3[46] = objc_opt_class();
  v2[47] = @"MultipleLanguages";
  v3[47] = objc_opt_class();
  v2[48] = @"HavePeopleSuggestion";
  v3[48] = objc_opt_class();
  v2[49] = @"ReminderCloudKit";
  v3[49] = objc_opt_class();
  v2[50] = @"ReminderCompletedItems";
  v3[50] = objc_opt_class();
  v2[51] = @"ReminderListWithCustomBadge";
  v3[51] = objc_opt_class();
  v2[52] = @"ReminderCustomSmartList";
  v3[52] = objc_opt_class();
  v2[53] = @"ReminderHashtags";
  v3[53] = objc_opt_class();
  v2[54] = @"ScreenTimeCloudDevice";
  v3[54] = objc_opt_class();
  v2[55] = @"ScreenTimeCurrentDevice";
  v3[55] = objc_opt_class();
  v2[56] = @"773abb50868ad190f9ba0c5d33b8db96440db9f5";
  v3[56] = objc_opt_class();
  v2[57] = @"SiriEnabled";
  v3[57] = objc_opt_class();
  v2[58] = @"SiriLanguageMatchesSystemLanguage";
  v3[58] = objc_opt_class();
  v2[59] = @"SleepSetup";
  v3[59] = objc_opt_class();
  v2[60] = @"iCloudAccount";
  v3[60] = objc_opt_class();
  v2[61] = @"iCloudBackup";
  v3[61] = objc_opt_class();
  v2[62] = @"iCloudDrive";
  v3[62] = objc_opt_class();
  v2[63] = @"iCloudFindMyDevice";
  v3[63] = objc_opt_class();
  v2[64] = @"CloudMusicCatalogPlayback";
  v3[64] = objc_opt_class();
  v2[65] = @"iCloudPhotoLibrary";
  v3[65] = objc_opt_class();
  v2[66] = @"13eda8c5e84d02c01729dba5c716bebd337f48cc";
  v3[66] = objc_opt_class();
  v2[67] = @"e0be4ec01737fdec5a211693a64dad134bcfa88a";
  v3[67] = objc_opt_class();
  v2[68] = @"678eced4f962f217a8df044a40d2bde4a8f12746";
  v3[68] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:69];
  v1 = (void *)deviceCapabilityValidationMap_capabilityMap;
  deviceCapabilityValidationMap_capabilityMap = v0;
}

+ (id)watchCapabilityValidationMap
{
  if (watchCapabilityValidationMap_onceToken != -1) {
    dispatch_once(&watchCapabilityValidationMap_onceToken, &__block_literal_global_286);
  }
  v2 = (void *)watchCapabilityValidationMap_capabilityMap;

  return v2;
}

void __68__TPSCustomCapabilityValidationBuilder_watchCapabilityValidationMap__block_invoke()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v2[0] = @"FallDetection";
  v2[1] = @"ECG";
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:2];
  v1 = (void *)watchCapabilityValidationMap_capabilityMap;
  watchCapabilityValidationMap_capabilityMap = v0;
}

+ (id)targetValidationForNRDeviceCapability:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_alloc_init(TPSTargetingValidation);
  if ([v4 type] == 4)
  {
    v6 = [a1 watchCapabilityValidationMap];
    v7 = [v4 key];
    v8 = (objc_class *)[v6 objectForKeyedSubscript:v7];

    if (v8)
    {
      v9 = (TPSTargetingValidation *)objc_alloc_init(v8);

      v5 = v9;
    }
    uint64_t v10 = [v4 key];
    if (v10)
    {
      v11 = (void *)v10;
      v12 = [v4 value];

      if (v12)
      {
        v13 = [v4 key];
        v17 = v13;
        v14 = [v4 value];
        v18[0] = v14;
        v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
        [(TPSTargetingValidation *)v5 setTargetContext:v15];
      }
    }
    -[TPSTargetingValidation setJoinType:](v5, "setJoinType:", [v4 joinType]);
  }

  return v5;
}

@end