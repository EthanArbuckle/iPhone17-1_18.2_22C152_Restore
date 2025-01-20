@interface PECopyEditsSetting
+ (BOOL)_isSettingIdentifierEnabledByDefault:(unint64_t)a3;
+ (id)allSettings;
- (BOOL)enabled;
- (BOOL)isApplicableToCompositionController:(id)a3 asset:(id)a4;
- (NSArray)compositionKeys;
- (NSString)localizedTitle;
- (PECopyEditsSetting)initWithIdentifier:(unint64_t)a3;
- (unint64_t)identifier;
- (void)setEnabled:(BOOL)a3;
@end

@implementation PECopyEditsSetting

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (NSArray)compositionKeys
{
  v24[1] = *MEMORY[0x263EF8340];
  unint64_t v2 = [(PECopyEditsSetting *)self identifier];
  v3 = (void *)MEMORY[0x263EFFA68];
  switch(v2)
  {
    case 0uLL:
      v24[0] = *MEMORY[0x263F5D788];
      v4 = (void *)MEMORY[0x263EFF8C0];
      v5 = v24;
      goto LABEL_13;
    case 1uLL:
      uint64_t v6 = *MEMORY[0x263F5D768];
      v23[0] = *MEMORY[0x263F5D6F8];
      v23[1] = v6;
      v4 = (void *)MEMORY[0x263EFF8C0];
      v5 = v23;
      goto LABEL_6;
    case 2uLL:
      uint64_t v7 = *MEMORY[0x263F5D860];
      v22[0] = *MEMORY[0x263F5D868];
      v22[1] = v7;
      uint64_t v8 = *MEMORY[0x263F5D730];
      v22[2] = *MEMORY[0x263F5D858];
      v22[3] = v8;
      uint64_t v9 = *MEMORY[0x263F5D848];
      v22[4] = *MEMORY[0x263F5D890];
      v22[5] = v9;
      uint64_t v10 = *MEMORY[0x263F5D758];
      v22[6] = *MEMORY[0x263F5D6F0];
      v22[7] = v10;
      uint64_t v11 = *MEMORY[0x263F5D6E8];
      v22[8] = *MEMORY[0x263F5D888];
      v22[9] = v11;
      uint64_t v12 = *MEMORY[0x263F5D7B8];
      v22[10] = *MEMORY[0x263F5D748];
      v22[11] = v12;
      v4 = (void *)MEMORY[0x263EFF8C0];
      v5 = v22;
      uint64_t v13 = 12;
      goto LABEL_14;
    case 3uLL:
      uint64_t v14 = *MEMORY[0x263F5D720];
      v21[0] = *MEMORY[0x263F5D728];
      v21[1] = v14;
      v4 = (void *)MEMORY[0x263EFF8C0];
      v5 = v21;
LABEL_6:
      uint64_t v13 = 2;
      goto LABEL_14;
    case 4uLL:
      uint64_t v20 = *MEMORY[0x263F5D6E0];
      v4 = (void *)MEMORY[0x263EFF8C0];
      v5 = &v20;
      goto LABEL_13;
    case 5uLL:
      uint64_t v19 = *MEMORY[0x263F5D760];
      v4 = (void *)MEMORY[0x263EFF8C0];
      v5 = &v19;
      goto LABEL_13;
    case 7uLL:
      uint64_t v18 = *MEMORY[0x263F5D6B8];
      v4 = (void *)MEMORY[0x263EFF8C0];
      v5 = &v18;
      goto LABEL_13;
    case 8uLL:
      uint64_t v17 = *MEMORY[0x263F5D7C0];
      v4 = (void *)MEMORY[0x263EFF8C0];
      v5 = &v17;
      goto LABEL_13;
    case 9uLL:
      if (_os_feature_enabled_impl())
      {
        uint64_t v16 = *MEMORY[0x263F5D850];
        v4 = (void *)MEMORY[0x263EFF8C0];
        v5 = &v16;
LABEL_13:
        uint64_t v13 = 1;
LABEL_14:
        v3 = [v4 arrayWithObjects:v5 count:v13];
      }
      else
      {
        v3 = (void *)MEMORY[0x263EFFA68];
      }
LABEL_15:
      return (NSArray *)v3;
    default:
      goto LABEL_15;
  }
}

- (NSString)localizedTitle
{
  unint64_t v2 = [(PECopyEditsSetting *)self identifier];
  if (v2 > 9) {
    v3 = 0;
  }
  else {
    v3 = off_2642BE4A0[v2];
  }
  return (NSString *)PELocalizedString(v3);
}

- (BOOL)isApplicableToCompositionController:(id)a3 asset:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PECopyEditsSetting *)self identifier] == 6)
  {
    if (+[PESmartPasteablePreset isAssetTypeEligibleForSmartPaste:v7])
    {
      char IsValid = +[PESmartPasteablePreset isCompositionControllerEligibleForSmartPaste:v6];
LABEL_9:
      char v9 = IsValid;
      goto LABEL_10;
    }
  }
  else
  {
    if ([(PECopyEditsSetting *)self identifier] != 5)
    {
      uint64_t v10 = [(PECopyEditsSetting *)self compositionKeys];
      id v12 = v6;
      char v9 = PFExists();

      goto LABEL_10;
    }
    if ([v6 userOrientation] != 1)
    {
      char IsValid = NUOrientationIsValid();
      goto LABEL_9;
    }
  }
  char v9 = 0;
LABEL_10:

  return v9;
}

uint64_t __64__PECopyEditsSetting_isApplicableToCompositionController_asset___block_invoke(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = [*(id *)(a1 + 32) adjustmentControllerForKey:a2];
  v3 = v2;
  if (v2)
  {
    if ([v2 canBeEnabled]) {
      uint64_t v4 = [v3 enabled];
    }
    else {
      uint64_t v4 = 1;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (PECopyEditsSetting)initWithIdentifier:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PECopyEditsSetting;
  uint64_t v4 = [(PECopyEditsSetting *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_identifier = a3;
    v4->_enabled = +[PECopyEditsSetting _isSettingIdentifierEnabledByDefault:a3];
  }
  return v5;
}

+ (id)allSettings
{
  v14[10] = *MEMORY[0x263EF8340];
  uint64_t v13 = [[PECopyEditsSetting alloc] initWithIdentifier:7];
  v14[0] = v13;
  unint64_t v2 = [[PECopyEditsSetting alloc] initWithIdentifier:8];
  v14[1] = v2;
  v3 = [[PECopyEditsSetting alloc] initWithIdentifier:9];
  v14[2] = v3;
  uint64_t v4 = [[PECopyEditsSetting alloc] initWithIdentifier:0];
  v14[3] = v4;
  v5 = [[PECopyEditsSetting alloc] initWithIdentifier:1];
  v14[4] = v5;
  id v6 = [[PECopyEditsSetting alloc] initWithIdentifier:2];
  v14[5] = v6;
  objc_super v7 = [[PECopyEditsSetting alloc] initWithIdentifier:3];
  v14[6] = v7;
  uint64_t v8 = [[PECopyEditsSetting alloc] initWithIdentifier:4];
  v14[7] = v8;
  char v9 = [[PECopyEditsSetting alloc] initWithIdentifier:5];
  v14[8] = v9;
  uint64_t v10 = [[PECopyEditsSetting alloc] initWithIdentifier:6];
  v14[9] = v10;
  uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:10];

  return v11;
}

+ (BOOL)_isSettingIdentifierEnabledByDefault:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) != 4;
}

@end