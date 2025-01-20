@interface WFAXSDSettings
+ (BOOL)isApplianceSoundDetectionType:(id)a3;
+ (BOOL)soundDetectionEnabled;
+ (id)allBMApplianceTypes;
+ (id)bmTypeForAXSDSoundDetectionType:(id)a3;
+ (id)localizedNameForSoundDetectionType:(id)a3;
+ (id)mapLocalizedSupportedSoundDetectionTypesUsingBlock:(id)a3;
@end

@implementation WFAXSDSettings

+ (id)mapLocalizedSupportedSoundDetectionTypesUsingBlock:(id)a3
{
  id v3 = a3;
  v4 = [getAXSDSettingsClass() sharedInstance];
  v5 = [v4 supportedSoundDetectionTypes];
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  char v14 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__WFAXSDSettings_mapLocalizedSupportedSoundDetectionTypesUsingBlock___block_invoke;
  v12[3] = &unk_1E654EE20;
  v12[4] = v13;
  v6 = objc_msgSend(v5, "if_objectsPassingTest:", v12);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__WFAXSDSettings_mapLocalizedSupportedSoundDetectionTypesUsingBlock___block_invoke_2;
  v10[3] = &unk_1E654EE48;
  id v7 = v3;
  id v11 = v7;
  v8 = objc_msgSend(v6, "if_map:", v10);

  _Block_object_dispose(v13, 8);
  return v8;
}

uint64_t __69__WFAXSDSettings_mapLocalizedSupportedSoundDetectionTypesUsingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!+[WFAXSDSettings isApplianceSoundDetectionType:a2])return 1; {
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  }
  if (*(unsigned char *)(v3 + 24)) {
    return 0;
  }
  uint64_t result = 1;
  *(unsigned char *)(v3 + 24) = 1;
  return result;
}

id __69__WFAXSDSettings_mapLocalizedSupportedSoundDetectionTypesUsingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[WFAXSDSettings localizedNameForSoundDetectionType:v3];
  v5 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  return v5;
}

+ (id)allBMApplianceTypes
{
  v10[3] = *MEMORY[0x1E4F143B8];
  v2 = getAXSDSoundDetectionTypeApplianceBeeps();
  id v3 = soft_bmTypeForSoundDetectionType(v2);
  v10[0] = v3;
  v4 = getAXSDSoundDetectionTypeApplianceBuzzes();
  v5 = soft_bmTypeForSoundDetectionType(v4);
  v10[1] = v5;
  v6 = getAXSDSoundDetectionTypeApplianceBellDings();
  id v7 = soft_bmTypeForSoundDetectionType(v6);
  v10[2] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:3];

  return v8;
}

+ (BOOL)isApplianceSoundDetectionType:(id)a3
{
  id v3 = a3;
  v4 = getAXSDSoundDetectionTypeApplianceBeeps();
  char v5 = [v3 isEqualToString:v4];

  v6 = getAXSDSoundDetectionTypeApplianceBuzzes();
  char v7 = [v3 isEqualToString:v6];

  v8 = getAXSDSoundDetectionTypeApplianceBellDings();
  char v9 = [v3 isEqualToString:v8];

  return v5 | v7 | v9;
}

+ (id)bmTypeForAXSDSoundDetectionType:(id)a3
{
  soft_bmTypeForSoundDetectionType(a3);
  return result;
}

+ (id)localizedNameForSoundDetectionType:(id)a3
{
  id v3 = a3;
  v4 = [getAXSDSettingsClass() sharedInstance];
  char v5 = [v4 localizedNameForSoundDetectionType:v3];

  return v5;
}

+ (BOOL)soundDetectionEnabled
{
  v2 = [getAXSDSettingsClass() sharedInstance];
  char v3 = [v2 soundDetectionEnabled];

  return v3;
}

@end