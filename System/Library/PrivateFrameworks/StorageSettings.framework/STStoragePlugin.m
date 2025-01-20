@interface STStoragePlugin
- (NSArray)tips;
- (NSString)identifier;
- (id)documentAppIdentifiers;
- (id)documentSpecifiersForApp:(id)a3;
- (id)externDataSizeAppIdentifiers;
- (int64_t)externDataSizeForApp:(id)a3;
- (void)notifyUsageChanged;
- (void)reloadSpecifiersForApp:(id)a3;
- (void)reloadTips;
- (void)setIdentifier:(id)a3;
- (void)setTips:(id)a3;
@end

@implementation STStoragePlugin

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  if ([(NSString *)self->_identifier length])
  {
    v3 = self->_identifier;
  }
  else
  {
    v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v3 = [v4 bundleIdentifier];
  }

  return v3;
}

- (void)setTips:(id)a3
{
}

- (NSArray)tips
{
  if (self->_tips) {
    return self->_tips;
  }
  else {
    return (NSArray *)MEMORY[0x263EFFA68];
  }
}

- (void)notifyUsageChanged
{
  id v2 = [MEMORY[0x263F7B008] sharedNotifier];
  [v2 postAppsStateChanged:0];
}

- (void)reloadTips
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:@"STStoragePluginReloadTipsNotification" object:self];
}

- (void)reloadSpecifiersForApp:(id)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263F7B008];
  id v4 = a3;
  v5 = [v3 sharedNotifier];
  v7[0] = v4;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];

  [v5 notify:@"STStoragePluginReloadSpecifiersNotification" forBundleIDs:v6];
}

- (id)documentAppIdentifiers
{
  return (id)MEMORY[0x263EFFA68];
}

- (id)documentSpecifiersForApp:(id)a3
{
  return (id)MEMORY[0x263EFFA68];
}

- (id)externDataSizeAppIdentifiers
{
  return (id)MEMORY[0x263EFFA68];
}

- (int64_t)externDataSizeForApp:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_tips, 0);
}

@end