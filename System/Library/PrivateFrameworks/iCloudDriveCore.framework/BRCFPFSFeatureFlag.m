@interface BRCFPFSFeatureFlag
- (BRCFPFSFeatureFlag)init;
- (void)fixFPFSFeatureFlagUserDefaultsIfNeeded;
@end

@implementation BRCFPFSFeatureFlag

- (BRCFPFSFeatureFlag)init
{
  v7.receiver = self;
  v7.super_class = (Class)BRCFPFSFeatureFlag;
  v2 = [(BRCFPFSFeatureFlag *)&v7 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x263EFFA40]);
    uint64_t v4 = [v3 initWithSuiteName:*MEMORY[0x263F05308]];
    fpfsFeatureDefaults = v2->_fpfsFeatureDefaults;
    v2->_fpfsFeatureDefaults = (NSUserDefaults *)v4;
  }
  return v2;
}

- (void)fixFPFSFeatureFlagUserDefaultsIfNeeded
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F05310];
  uint64_t v4 = [(NSUserDefaults *)self->_fpfsFeatureDefaults objectForKey:*MEMORY[0x263F05310]];
  v5 = (void *)MEMORY[0x263F05318];
  if (v4)
  {
    v6 = (void *)v4;
    uint64_t v7 = [(NSUserDefaults *)self->_fpfsFeatureDefaults objectForKey:@"iCloudDrive-on-FPFS-last-boot-uuid"];
    if (v7)
    {
      v8 = (void *)v7;
      v9 = [(NSUserDefaults *)self->_fpfsFeatureDefaults objectForKey:*v5];

      if (v9) {
        goto LABEL_9;
      }
    }
    else
    {
    }
  }
  v10 = brc_bread_crumbs();
  v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    v17 = v10;
    _os_log_impl(&dword_23FA42000, v11, OS_LOG_TYPE_DEFAULT, "[NOTICE] Running as FPFS but FPFS feature user defaults are missing. Fixing FPFS feature in user defaults%@", (uint8_t *)&v16, 0xCu);
  }

  [(NSUserDefaults *)self->_fpfsFeatureDefaults setObject:&unk_26F3DD2E0 forKey:*v5];
  fpfsFeatureDefaults = self->_fpfsFeatureDefaults;
  v13 = [MEMORY[0x263F08C38] UUID];
  v14 = [v13 UUIDString];
  [(NSUserDefaults *)fpfsFeatureDefaults setObject:v14 forKey:@"iCloudDrive-on-FPFS-last-boot-uuid"];

  [(NSUserDefaults *)self->_fpfsFeatureDefaults setBool:1 forKey:v3];
LABEL_9:
  v15 = [(NSUserDefaults *)self->_fpfsFeatureDefaults objectForKey:@"iCloudDrive-moved-to-FPFS"];

  if (!v15) {
    [(NSUserDefaults *)self->_fpfsFeatureDefaults setBool:1 forKey:@"iCloudDrive-moved-to-FPFS"];
  }
}

- (void).cxx_destruct
{
}

@end