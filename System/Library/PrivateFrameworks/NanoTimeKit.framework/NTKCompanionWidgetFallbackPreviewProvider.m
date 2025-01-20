@interface NTKCompanionWidgetFallbackPreviewProvider
+ (id)sharedInstance;
- (BOOL)isNanoHomeDescriptor:(id)a3;
- (NTKCompanionWidgetFallbackPreviewProvider)init;
- (id)fallbackInfoForDescriptor:(id)a3;
- (id)fallbackSampleTemplateForDescriptor:(id)a3 family:(int64_t)a4;
- (id)nanoHomeDisplayStringForWidgetKind:(id)a3 intent:(id)a4;
- (id)nanoHomeFallbackInfoForDescriptor:(id)a3;
- (id)nanoHomeImageProviderForIntent:(id)a3 fallbackNTKImageKey:(id)a4;
- (id)nanoHomeWidgetFallbackCircularTemplateWithIntent:(id)a3;
- (id)nanoHomefallbackSampleTemplateForDescriptor:(id)a3 family:(int64_t)a4;
@end

@implementation NTKCompanionWidgetFallbackPreviewProvider

+ (id)sharedInstance
{
  v2 = (void *)sharedInstance_sPreviewProvider;
  if (!sharedInstance_sPreviewProvider)
  {
    v3 = objc_alloc_init(NTKCompanionWidgetFallbackPreviewProvider);
    v4 = (void *)sharedInstance_sPreviewProvider;
    sharedInstance_sPreviewProvider = (uint64_t)v3;

    v2 = (void *)sharedInstance_sPreviewProvider;
  }
  return v2;
}

- (NTKCompanionWidgetFallbackPreviewProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)NTKCompanionWidgetFallbackPreviewProvider;
  return [(NTKCompanionWidgetFallbackPreviewProvider *)&v3 init];
}

- (id)fallbackInfoForDescriptor:(id)a3
{
  id v4 = a3;
  if ([(NTKCompanionWidgetFallbackPreviewProvider *)self isNanoHomeDescriptor:v4])
  {
    v5 = [(NTKCompanionWidgetFallbackPreviewProvider *)self nanoHomeFallbackInfoForDescriptor:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)fallbackSampleTemplateForDescriptor:(id)a3 family:(int64_t)a4
{
  id v6 = a3;
  if ([(NTKCompanionWidgetFallbackPreviewProvider *)self isNanoHomeDescriptor:v6])
  {
    v7 = [(NTKCompanionWidgetFallbackPreviewProvider *)self nanoHomefallbackSampleTemplateForDescriptor:v6 family:a4];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)nanoHomeFallbackInfoForDescriptor:(id)a3
{
  id v4 = a3;
  if ([(NTKCompanionWidgetFallbackPreviewProvider *)self isNanoHomeDescriptor:v4])
  {
    v5 = [v4 intentReference];
    id v6 = [v5 intent];
    v7 = [v4 kind];
    v8 = [MEMORY[0x1E4F79CB8] launcherWidgetName];
    v9 = [(NTKCompanionWidgetFallbackPreviewProvider *)self nanoHomeDisplayStringForWidgetKind:v7 intent:v6];
    v10 = [[NTKWidgetComplicationInfo alloc] initWithAppName:v8 displayName:v9];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)nanoHomefallbackSampleTemplateForDescriptor:(id)a3 family:(int64_t)a4
{
  id v6 = a3;
  if ([(NTKCompanionWidgetFallbackPreviewProvider *)self isNanoHomeDescriptor:v6])
  {
    v7 = [v6 intentReference];
    v8 = [v7 intent];
    v9 = [v6 kind];
    v10 = 0;
    switch(a4)
    {
      case 2:
      case 3:
      case 6:
        v11 = [MEMORY[0x1E4F79CB8] launcherWidgetName];
        v12 = [MEMORY[0x1E4F19AB0] textProviderWithText:v11];
        v10 = [MEMORY[0x1E4F199E0] templateWithTextProvider:v12];

        goto LABEL_4;
      case 8:
        v14 = [(NTKCompanionWidgetFallbackPreviewProvider *)self nanoHomeDisplayStringForWidgetKind:v9 intent:v8];
        v15 = [MEMORY[0x1E4F19AB0] textProviderWithText:v14];
        v16 = [(NTKCompanionWidgetFallbackPreviewProvider *)self nanoHomeImageProviderForIntent:v8 fallbackNTKImageKey:@"SignatureCornerHome"];
        v10 = [MEMORY[0x1E4F19888] templateWithTextProvider:v15 imageProvider:v16];
        goto LABEL_17;
      case 9:
        v13 = [(NTKCompanionWidgetFallbackPreviewProvider *)self nanoHomeWidgetFallbackCircularTemplateWithIntent:v8];
        uint64_t v17 = [MEMORY[0x1E4F197B8] templateWithCircularTemplate:v13];
        goto LABEL_13;
      case 10:
        v10 = [(NTKCompanionWidgetFallbackPreviewProvider *)self nanoHomeWidgetFallbackCircularTemplateWithIntent:v8];
        goto LABEL_19;
      case 11:
        v18 = [MEMORY[0x1E4F79CC0] Accessory];
        int v19 = [v9 isEqualToString:v18];

        if (v19)
        {
          v14 = [MEMORY[0x1E4F19AB0] textProviderWithText:&stru_1F1635E90];
          v20 = [(NTKCompanionWidgetFallbackPreviewProvider *)self nanoHomeDisplayStringForWidgetKind:v9 intent:v8];
          v21 = [MEMORY[0x1E4F19AB0] textProviderWithText:v20];
          v10 = [MEMORY[0x1E4F19948] templateWithHeaderTextProvider:v14 body1TextProvider:v21];
        }
        else
        {
          v22 = [MEMORY[0x1E4F79CC0] ActionSets];
          int v23 = [v9 isEqualToString:v22];

          if (!v23) {
            NTKImageNamed(@"SignatureXLHome");
          }
          v14 = [MEMORY[0x1E4F79CB8] actionSetRectangularWidgetText];
          v15 = [MEMORY[0x1E4F19AB0] textProviderWithText:v14];
          v16 = [(NTKCompanionWidgetFallbackPreviewProvider *)self nanoHomeDisplayStringForWidgetKind:v9 intent:v8];
          v24 = [MEMORY[0x1E4F19AB0] textProviderWithText:v16];
          v10 = [MEMORY[0x1E4F19948] templateWithHeaderTextProvider:v15 body1TextProvider:v24];

LABEL_17:
        }

        goto LABEL_19;
      case 12:
        v13 = [(NTKCompanionWidgetFallbackPreviewProvider *)self nanoHomeImageProviderForIntent:v8 fallbackNTKImageKey:@"SignatureXLHome"];
        uint64_t v17 = [MEMORY[0x1E4F198B0] templateWithImageProvider:v13];
LABEL_13:
        v10 = (void *)v17;
        goto LABEL_14;
      default:
LABEL_4:
        v13 = _NTKLoggingObjectForDomain(47, (uint64_t)"NTKLoggingDomainWidget");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          -[NTKCompanionWidgetFallbackPreviewProvider nanoHomefallbackSampleTemplateForDescriptor:family:]((uint64_t)v9, a4, v13);
        }
LABEL_14:

LABEL_19:
        break;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)nanoHomeWidgetFallbackCircularTemplateWithIntent:(id)a3
{
  objc_super v3 = [(NTKCompanionWidgetFallbackPreviewProvider *)self nanoHomeImageProviderForIntent:a3 fallbackNTKImageKey:@"SignatureCircularHome"];
  id v4 = [MEMORY[0x1E4F197E0] templateWithImageProvider:v3];

  return v4;
}

- (id)nanoHomeImageProviderForIntent:(id)a3 fallbackNTKImageKey:(id)a4
{
  id v5 = a4;
  id v6 = [a3 valueForKey:@"icon"];
  if (!v6
    || ([MEMORY[0x1E4F19A60] _symbolImageProviderWithSystemName:v6],
        (v7 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    NTKImageNamed(v5);
  }

  return v7;
}

- (BOOL)isNanoHomeDescriptor:(id)a3
{
  id v3 = a3;
  id v4 = [v3 containerBundleIdentifier];
  if (v4)
  {
    id v5 = [v3 containerBundleIdentifier];
    char v6 = [v5 isEqualToString:@"com.apple.NanoHome"];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)nanoHomeDisplayStringForWidgetKind:(id)a3 intent:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x1E4F79CC0] Launcher];
  int v8 = [v5 isEqualToString:v7];

  if (v8)
  {
LABEL_2:
    uint64_t v9 = [MEMORY[0x1E4F79CB8] launcherWidgetName];
    goto LABEL_16;
  }
  v10 = [MEMORY[0x1E4F79CC0] Energy];
  int v11 = [v5 isEqualToString:v10];

  if (v11)
  {
    v12 = [v6 valueForKey:@"homeIdentifier"];
    if (!v12
      || ([v6 valueForKey:@"homeName"], (uint64_t v13 = objc_claimAutoreleasedReturnValue()) == 0)
      || (v14 = (void *)v13,
          [MEMORY[0x1E4F79CB8] homeSpecificEnergyWidgetNameWithHomeName:v13],
          v15 = objc_claimAutoreleasedReturnValue(),
          v14,
          !v15))
    {
      uint64_t v16 = [MEMORY[0x1E4F79CB8] currentLocationEnergyWidgetName];
LABEL_8:
      v15 = (void *)v16;
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  uint64_t v17 = [MEMORY[0x1E4F79CC0] Accessory];
  int v18 = [v5 isEqualToString:v17];

  if (v18)
  {
    int v19 = @"accessoryName";
LABEL_15:
    uint64_t v9 = [v6 valueForKey:v19];
    goto LABEL_16;
  }
  v20 = [MEMORY[0x1E4F79CC0] ActionSets];
  int v21 = [v5 isEqualToString:v20];

  if (v21)
  {
    int v19 = @"actionSetName";
    goto LABEL_15;
  }
  v24 = [MEMORY[0x1E4F79CC0] SmartStack];
  int v25 = [v5 isEqualToString:v24];

  if (v25)
  {
    uint64_t v9 = [MEMORY[0x1E4F79CB8] smartStackWidgetName];
LABEL_16:
    v15 = (void *)v9;
    if (v9) {
      goto LABEL_20;
    }
    goto LABEL_17;
  }
  v26 = [MEMORY[0x1E4F79CC0] ElectricityUsage];
  int v27 = [v5 isEqualToString:v26];

  if (v27)
  {
    v12 = [v6 valueForKey:@"homeID"];
    if (!v12
      || ([v6 valueForKey:@"homeName"], (uint64_t v28 = objc_claimAutoreleasedReturnValue()) == 0)
      || (v29 = (void *)v28,
          [MEMORY[0x1E4F79CB8] homeSpecificElectricityUsageWidgetNameWithHomeName:v28],
          v15 = objc_claimAutoreleasedReturnValue(),
          v29,
          !v15))
    {
      uint64_t v16 = [MEMORY[0x1E4F79CB8] electricityUsageWidgetName];
      goto LABEL_8;
    }
  }
  else
  {
    v30 = [MEMORY[0x1E4F79CC0] ElectricityRates];
    int v31 = [v5 isEqualToString:v30];

    if (!v31)
    {
      v34 = _NTKLoggingObjectForDomain(47, (uint64_t)"NTKLoggingDomainWidget");
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        -[NTKCompanionWidgetFallbackPreviewProvider nanoHomeDisplayStringForWidgetKind:intent:]((uint64_t)v5, v34);
      }

      goto LABEL_2;
    }
    v12 = [v6 valueForKey:@"homeID"];
    if (!v12
      || ([v6 valueForKey:@"homeName"], (uint64_t v32 = objc_claimAutoreleasedReturnValue()) == 0)
      || (v33 = (void *)v32,
          [MEMORY[0x1E4F79CB8] homeSpecificElectricityRatesWidgetNameWithHomeName:v32],
          v15 = objc_claimAutoreleasedReturnValue(),
          v33,
          !v15))
    {
      uint64_t v16 = [MEMORY[0x1E4F79CB8] electricityRatesWidgetName];
      goto LABEL_8;
    }
  }
LABEL_9:

  if (v15) {
    goto LABEL_20;
  }
LABEL_17:
  v22 = _NTKLoggingObjectForDomain(47, (uint64_t)"NTKLoggingDomainWidget");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    -[NTKCompanionWidgetFallbackPreviewProvider nanoHomeDisplayStringForWidgetKind:intent:]((uint64_t)v5, v22);
  }

  v15 = [MEMORY[0x1E4F79CB8] launcherWidgetName];
LABEL_20:

  return v15;
}

- (void)nanoHomefallbackSampleTemplateForDescriptor:(os_log_t)log family:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218242;
  uint64_t v4 = a2;
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  _os_log_error_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_ERROR, "Unhandled complication family %ld with kind %@ in NanoHome fallback preview provider!", (uint8_t *)&v3, 0x16u);
}

- (void)nanoHomeDisplayStringForWidgetKind:(uint64_t)a1 intent:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "Fallback preview provider failed to generate a proper display string for widget kind: %@. Using launcher display string as a final fail-safe.", (uint8_t *)&v2, 0xCu);
}

- (void)nanoHomeDisplayStringForWidgetKind:(uint64_t)a1 intent:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "Unhandled NanoHome widget kind: %@. Using launcher display string as a fallback.", (uint8_t *)&v2, 0xCu);
}

@end