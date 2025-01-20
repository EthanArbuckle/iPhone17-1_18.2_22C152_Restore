@interface ICQUsageStorageMonitor
+ (id)sharedMonitor;
- (ICQUsageStorageMonitor)init;
- (NSArray)footerItems;
- (float)availableSize;
- (float)usedSize;
- (id)mediaCollectionForKey:(id)a3;
- (void)_setAvailable:(float)a3;
- (void)clearUsageDataCache;
- (void)deregisterUsageStorageClient;
- (void)fetchSystemSizeStrings;
- (void)flushViews;
- (void)populateUsageDataWithProgressBlock:(id)a3;
- (void)registerUsageStorageClient;
- (void)removeMediaCollectionCacheForKey:(id)a3;
- (void)setUsedSize:(float)a3;
@end

@implementation ICQUsageStorageMonitor

+ (id)sharedMonitor
{
  if (sharedMonitor_once != -1) {
    dispatch_once(&sharedMonitor_once, &__block_literal_global_178);
  }
  v2 = (void *)sharedMonitor_monitor;
  return v2;
}

void __39__ICQUsageStorageMonitor_sharedMonitor__block_invoke()
{
  v0 = objc_alloc_init(ICQUsageStorageMonitor);
  v1 = (void *)sharedMonitor_monitor;
  sharedMonitor_monitor = (uint64_t)v0;
}

- (ICQUsageStorageMonitor)init
{
  v5.receiver = self;
  v5.super_class = (Class)ICQUsageStorageMonitor;
  v2 = [(ICQUsageStorageMonitor *)&v5 init];
  v3 = v2;
  if (v2) {
    [(ICQUsageStorageMonitor *)v2 fetchSystemSizeStrings];
  }
  return v3;
}

- (void)registerUsageStorageClient
{
  int64_t storageClientCount = self->_storageClientCount;
  self->_int64_t storageClientCount = storageClientCount + 1;
  if (!storageClientCount)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)AppDeleted, @"com.apple.mobile.application_deletion_complete", 0, CFNotificationSuspensionBehaviorCoalesce);
  }
}

- (void)deregisterUsageStorageClient
{
}

- (void)populateUsageDataWithProgressBlock:(id)a3
{
  id v6 = a3;
  [(ICQUsageStorageMonitor *)self clearUsageDataCache];
  v4 = objc_alloc_init(ICQUsageStorageCache);
  cache = self->_cache;
  self->_cache = v4;

  [(ICQUsageStorageCache *)self->_cache populateUsageDataWithProgressBlock:v6];
}

- (void)clearUsageDataCache
{
  [(ICQUsageStorageCache *)self->_cache cancelUsageDataPopulation];
  cache = self->_cache;
  self->_cache = 0;
}

- (void)removeMediaCollectionCacheForKey:(id)a3
{
}

- (id)mediaCollectionForKey:(id)a3
{
  return [(ICQUsageStorageCache *)self->_cache mediaCollectionForKey:a3];
}

- (void)fetchSystemSizeStrings
{
  id v14 = (id)MGCopyAnswer();
  v3 = [v14 objectForKey:*MEMORY[0x263F8BD30]];
  v4 = [v14 objectForKey:*MEMORY[0x263F8BD10]];
  objc_super v5 = [v14 objectForKey:*MEMORY[0x263F8BD18]];
  [v4 floatValue];
  float v7 = v6;
  [v3 floatValue];
  float v9 = v8;
  [v5 floatValue];
  float v11 = (float)(v9 - v10) - v7;
  *(float *)&double v12 = v7;
  [(ICQUsageStorageMonitor *)self _setAvailable:v12];
  *(float *)&double v13 = v11;
  [(ICQUsageStorageMonitor *)self setUsedSize:v13];
}

- (void)_setAvailable:(float)a3
{
  if (self->_availableSize != a3)
  {
    self->_availableSize = a3;
    if (self->_footerLabel)
    {
      v4 = NSString;
      id v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      objc_super v5 = [v9 localizedStringForKey:@"SIZE_available_DEVICE" value:&stru_26DFF2C90 table:@"Usage Statistics"];
      float v6 = [MEMORY[0x263F086F0] stringFromByteCount:(uint64_t)self->_availableSize countStyle:2];
      float v7 = DeviceName();
      float v8 = objc_msgSend(v4, "stringWithFormat:", v5, v6, v7);
      [(UILabel *)self->_footerLabel setText:v8];
    }
  }
}

- (NSArray)footerItems
{
  footerItems = self->_footerItems;
  if (!footerItems)
  {
    id v4 = objc_alloc(MEMORY[0x263F828E0]);
    objc_super v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    footerLabel = self->_footerLabel;
    self->_footerLabel = v5;

    float v7 = [MEMORY[0x263F81708] systemFontOfSize:14.0];
    [(UILabel *)self->_footerLabel setFont:v7];

    float v8 = PSToolbarLabelsTextColor();
    [(UILabel *)self->_footerLabel setTextColor:v8];

    id v9 = [MEMORY[0x263F825C8] clearColor];
    [(UILabel *)self->_footerLabel setBackgroundColor:v9];

    [(UILabel *)self->_footerLabel setTextAlignment:1];
    [(UILabel *)self->_footerLabel setLineBreakMode:5];
    float v10 = NSString;
    float v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    double v12 = [v11 localizedStringForKey:@"SIZE_available_DEVICE" value:&stru_26DFF2C90 table:@"Usage Statistics"];
    double v13 = [MEMORY[0x263F086F0] stringFromByteCount:(uint64_t)self->_availableSize countStyle:2];
    id v14 = DeviceName();
    v15 = objc_msgSend(v10, "stringWithFormat:", v12, v13, v14);
    [(UILabel *)self->_footerLabel setText:v15];

    [(UILabel *)self->_footerLabel sizeToFit];
    v16 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x263F824A8]) initWithCustomView:self->_footerLabel];
    footerItem = self->_footerItem;
    self->_footerItem = v16;

    v18 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:5 target:0 action:0];
    v19 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", v18, self->_footerItem, v18, 0);
    v20 = self->_footerItems;
    self->_footerItems = v19;

    footerItems = self->_footerItems;
  }
  return footerItems;
}

- (void)flushViews
{
  footerItems = self->_footerItems;
  self->_footerItems = 0;

  footerItem = self->_footerItem;
  self->_footerItem = 0;

  footerLabel = self->_footerLabel;
  self->_footerLabel = 0;
}

- (float)availableSize
{
  return self->_availableSize;
}

- (float)usedSize
{
  return self->_usedSize;
}

- (void)setUsedSize:(float)a3
{
  self->_usedSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_footerItems, 0);
  objc_storeStrong((id *)&self->_footerLabel, 0);
  objc_storeStrong((id *)&self->_footerItem, 0);
}

@end