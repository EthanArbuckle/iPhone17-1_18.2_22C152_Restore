@interface PXCPLStatusSettings
+ (PXCPLStatusSettings)sharedInstance;
+ (id)settingsControllerModule;
- (BOOL)cloudQuotaOfferIncludeAssetCounts;
- (NSNumber)resumeOverrideHours;
- (NSNumber)shouldHideMockStatusWarning;
- (id)parentSettings;
- (int64_t)cloudQuotaOfferLevel;
- (void)setCloudQuotaOfferIncludeAssetCounts:(BOOL)a3;
- (void)setCloudQuotaOfferLevel:(int64_t)a3;
- (void)setDefaultValues;
- (void)setResumeOverrideHours:(id)a3;
- (void)setShouldHideMockStatusWarning:(id)a3;
@end

@implementation PXCPLStatusSettings

+ (PXCPLStatusSettings)sharedInstance
{
  if (sharedInstance_onceToken_133847 != -1) {
    dispatch_once(&sharedInstance_onceToken_133847, &__block_literal_global_133848);
  }
  v2 = (void *)sharedInstance_sharedInstance_133849;
  return (PXCPLStatusSettings *)v2;
}

- (int64_t)cloudQuotaOfferLevel
{
  return self->_cloudQuotaOfferLevel;
}

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PXCPLStatusSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(PXCPLStatusSettings *)self setCloudQuotaOfferLevel:0];
  [(PXCPLStatusSettings *)self setCloudQuotaOfferIncludeAssetCounts:0];
  [(PXCPLStatusSettings *)self setResumeOverrideHours:&unk_1F02D8290];
}

- (void)setResumeOverrideHours:(id)a3
{
}

- (void)setCloudQuotaOfferLevel:(int64_t)a3
{
  self->_cloudQuotaOfferLevel = a3;
}

- (void)setCloudQuotaOfferIncludeAssetCounts:(BOOL)a3
{
  self->_cloudQuotaOfferIncludeAssetCounts = a3;
}

void __37__PXCPLStatusSettings_sharedInstance__block_invoke()
{
  id v2 = +[PXRootSettings sharedInstance];
  uint64_t v0 = [v2 cplStatusSettings];
  v1 = (void *)sharedInstance_sharedInstance_133849;
  sharedInstance_sharedInstance_133849 = v0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shouldHideMockStatusWarning, 0);
  objc_storeStrong((id *)&self->_resumeOverrideHours, 0);
}

- (void)setShouldHideMockStatusWarning:(id)a3
{
}

- (NSNumber)shouldHideMockStatusWarning
{
  return self->_shouldHideMockStatusWarning;
}

- (NSNumber)resumeOverrideHours
{
  return self->_resumeOverrideHours;
}

- (BOOL)cloudQuotaOfferIncludeAssetCounts
{
  return self->_cloudQuotaOfferIncludeAssetCounts;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance];
}

+ (id)settingsControllerModule
{
  v67[2] = *MEMORY[0x1E4F143B8];
  id v63 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v2 = (void *)MEMORY[0x1E4F94160];
  objc_super v3 = (void *)MEMORY[0x1E4F94108];
  v4 = NSStringFromSelector(sel_cloudQuotaOfferLevel);
  v5 = [v3 rowWithTitle:@"Offer Level" valueKeyPath:v4];
  v6 = [v5 possibleValues:&unk_1F02D4660 titles:&unk_1F02D4678];
  v67[0] = v6;
  v7 = (void *)MEMORY[0x1E4F941F0];
  v8 = NSStringFromSelector(sel_cloudQuotaOfferIncludeAssetCounts);
  v9 = [v7 rowWithTitle:@"Offer Include Asset Counts" valueKeyPath:v8];
  v67[1] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:2];
  v11 = [v2 sectionWithRows:v10 title:@"Cloud Quota"];
  [v63 addObject:v11];

  v12 = (void *)MEMORY[0x1E4F94160];
  v13 = (void *)MEMORY[0x1E4F940F8];
  v62 = _SetMockRowAction(@"{enabled=1 syncing=1; upload=25; progress=50}");;
  v61 = [v13 rowWithTitle:@"Active Upload" action:v62];
  v66[0] = v61;
  v14 = (void *)MEMORY[0x1E4F940F8];
  v60 = _SetMockRowAction(@"{enabled=1 upload=25; progress=50; battery-budget=1}");;
  v59 = [v14 rowWithTitle:@"Paused Upload (Battery)" action:v60];
  v66[1] = v59;
  v15 = (void *)MEMORY[0x1E4F940F8];
  v58 = _SetMockRowAction(@"{enabled=1 upload=25; progress=50; cellular-budget=1}");;
  v57 = [v15 rowWithTitle:@"Paused Upload (Cellular)" action:v58];
  v66[2] = v57;
  v16 = (void *)MEMORY[0x1E4F940F8];
  v56 = _SetMockRowAction(@"{enabled=1 upload=25; progress=50; low-data-mode=1}");;
  v55 = [v16 rowWithTitle:@"Paused Upload (Low Data)" action:v56];
  v66[3] = v55;
  v17 = (void *)MEMORY[0x1E4F94108];
  v54 = NSStringFromSelector(sel_resumeOverrideHours);
  v53 = [v17 rowWithTitle:@"Resume Override Time" valueKeyPath:v54];
  v52 = [v53 possibleValues:&unk_1F02D4690 titles:&unk_1F02D46A8];
  v66[4] = v52;
  v18 = (void *)MEMORY[0x1E4F940F8];
  v19 = _SetMockRowAction(@"{enabled=1 upload=25; progress=50; cloud-quota=1}");;
  v20 = [v18 rowWithTitle:@"iCloud Quota Full" action:v19];
  v66[5] = v20;
  v21 = (void *)MEMORY[0x1E4F940F8];
  v22 = _SetMockRowAction(@"{enabled=1 upload=25; progress=50; cloud-quota=1; offer=1}");;
  v23 = [v21 rowWithTitle:@"iCloud Quota Full + Offer" action:v22];
  v66[6] = v23;
  v24 = (void *)MEMORY[0x1E4F940F8];
  v25 = _SetMockRowAction(@"{enabled=0}");
  v26 = [v24 rowWithTitle:@"iCPL Disabled" action:v25];
  v66[7] = v26;
  v27 = (void *)MEMORY[0x1E4F941F0];
  v28 = NSStringFromSelector(sel_shouldHideMockStatusWarning);
  v29 = [v27 rowWithTitle:@"Hide Warning Message" valueKeyPath:v28];
  v66[8] = v29;
  v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:9];
  v31 = [v12 sectionWithRows:v30 title:@"Mocks"];
  [v63 addObject:v31];

  v32 = (void *)MEMORY[0x1E4F94160];
  v33 = (void *)MEMORY[0x1E4F940F8];
  v34 = [MEMORY[0x1E4F94190] actionWithHandler:&__block_literal_global_131_133741];
  v35 = [v33 rowWithTitle:@"Set WelcomeViewLastPresentationDate to Now" action:v34];
  v65[0] = v35;
  v36 = (void *)MEMORY[0x1E4F940F8];
  v37 = [MEMORY[0x1E4F94190] actionWithHandler:&__block_literal_global_137];
  v38 = [v36 rowWithTitle:@"Clear WelcomeViewLastPresentationDate" action:v37];
  v65[1] = v38;
  v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:2];
  v40 = [v32 sectionWithRows:v39 title:@"Cloud Quota Upsell"];
  [v63 addObject:v40];

  v41 = (void *)MEMORY[0x1E4F94160];
  v42 = (void *)MEMORY[0x1E4F940F8];
  v43 = [MEMORY[0x1E4F94190] actionWithHandler:&__block_literal_global_145];
  v44 = [v42 rowWithTitle:@"Clear Mocks" action:v43];
  v64[0] = v44;
  v45 = (void *)MEMORY[0x1E4F940F8];
  v46 = [MEMORY[0x1E4F94170] actionWithSettingsKeyPath:0];
  v47 = [v45 rowWithTitle:@"Restore Default Settings" action:v46];
  v64[1] = v47;
  v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:2];
  v49 = [v41 sectionWithRows:v48];
  [v63 addObject:v49];

  v50 = [MEMORY[0x1E4F94160] moduleWithTitle:@"CPL Status" contents:v63];

  return v50;
}

uint64_t __47__PXCPLStatusSettings_settingsControllerModule__block_invoke_3()
{
  uint64_t v0 = PXSharedUserDefaults();
  [v0 removeObjectForKey:@"CPLStatusProviderMock"];

  return 1;
}

uint64_t __47__PXCPLStatusSettings_settingsControllerModule__block_invoke_2()
{
  return 1;
}

uint64_t __47__PXCPLStatusSettings_settingsControllerModule__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1C9C8] now];
  PXPreferencesSetWelcomeViewLastPresentationDate(v0);

  return 1;
}

@end