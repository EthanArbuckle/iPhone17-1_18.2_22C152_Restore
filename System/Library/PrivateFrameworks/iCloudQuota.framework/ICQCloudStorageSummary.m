@interface ICQCloudStorageSummary
+ (BOOL)supportsSecureCoding;
- (BOOL)shouldUseNativeManageStorage;
- (ICQBackupInfo)backupInfo;
- (ICQCloudStorageSummary)initWithCoder:(id)a3;
- (ICQManageStoragePageInfo)manageStoragePage;
- (ICQSubscriptionInfo)subscriptionInfo;
- (ICQiCloudDetailsPageInfo)iCloudDetailsPageInfo;
- (NSArray)mediaStorage;
- (NSArray)tips;
- (NSNumber)commerceStorage;
- (NSNumber)freeStorage;
- (NSNumber)totalStorage;
- (NSNumber)usedStorage;
- (NSString)displayLabel;
- (NSString)manageStorageActionButtonText;
- (NSString)manageStorageTitle;
- (NSURL)manageStorageURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setBackupInfo:(id)a3;
- (void)setCommerceStorage:(id)a3;
- (void)setDisplayLabel:(id)a3;
- (void)setFreeStorage:(id)a3;
- (void)setICloudDetailsPageInfo:(id)a3;
- (void)setManageStorageActionButtonText:(id)a3;
- (void)setManageStoragePage:(id)a3;
- (void)setManageStorageTitle:(id)a3;
- (void)setManageStorageURL:(id)a3;
- (void)setMediaStorage:(id)a3;
- (void)setSubscriptionInfo:(id)a3;
- (void)setTips:(id)a3;
- (void)setTotalStorage:(id)a3;
- (void)setUsedStorage:(id)a3;
@end

@implementation ICQCloudStorageSummary

- (id)description
{
  v2 = [MEMORY[0x1E4F28E78] stringWithFormat:@"displayLabel: %@, totalStorage: %@, usedStorage: %@, freeStorage: %@, commerceStorage: %@, mediaStorage: %@, tips: %@, backupInfo: %@, subscriptionInfo: %@, manageStorageURL: %@, manageStorageTitle: %@, manageStorageActionButtonText: %@, manageStoragePage: %@, detailsPageInfo: %@,", self->_displayLabel, self->_totalStorage, self->_usedStorage, self->_freeStorage, self->_commerceStorage, self->_mediaStorage, self->_tips, self->_backupInfo, self->_subscriptionInfo, self->_manageStorageURL, self->_manageStorageTitle, self->_manageStorageActionButtonText, self->_manageStoragePage, self->_iCloudDetailsPageInfo];
  v3 = (void *)[v2 copy];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(ICQCloudStorageSummary);
  [(ICQCloudStorageSummary *)v4 setDisplayLabel:self->_displayLabel];
  [(ICQCloudStorageSummary *)v4 setTotalStorage:self->_totalStorage];
  [(ICQCloudStorageSummary *)v4 setUsedStorage:self->_usedStorage];
  [(ICQCloudStorageSummary *)v4 setFreeStorage:self->_freeStorage];
  [(ICQCloudStorageSummary *)v4 setCommerceStorage:self->_commerceStorage];
  [(ICQCloudStorageSummary *)v4 setMediaStorage:self->_mediaStorage];
  [(ICQCloudStorageSummary *)v4 setTips:self->_tips];
  [(ICQCloudStorageSummary *)v4 setBackupInfo:self->_backupInfo];
  [(ICQCloudStorageSummary *)v4 setSubscriptionInfo:self->_subscriptionInfo];
  [(ICQCloudStorageSummary *)v4 setManageStorageURL:self->_manageStorageURL];
  [(ICQCloudStorageSummary *)v4 setManageStorageTitle:self->_manageStorageTitle];
  [(ICQCloudStorageSummary *)v4 setManageStorageActionButtonText:self->_manageStorageActionButtonText];
  [(ICQCloudStorageSummary *)v4 setManageStoragePage:self->_manageStoragePage];
  [(ICQCloudStorageSummary *)v4 setICloudDetailsPageInfo:self->_iCloudDetailsPageInfo];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  displayLabel = self->_displayLabel;
  id v5 = a3;
  [v5 encodeObject:displayLabel forKey:@"displayLabel"];
  [v5 encodeObject:self->_totalStorage forKey:@"totalStorage"];
  [v5 encodeObject:self->_usedStorage forKey:@"usedStorage"];
  [v5 encodeObject:self->_freeStorage forKey:@"freeStorage"];
  [v5 encodeObject:self->_commerceStorage forKey:@"commerceStorageQuota"];
  [v5 encodeObject:self->_mediaStorage forKey:@"usageByMedia"];
  [v5 encodeObject:self->_tips forKey:@"tips"];
  [v5 encodeObject:self->_backupInfo forKey:@"backupInfo"];
  [v5 encodeObject:self->_subscriptionInfo forKey:@"subscriptionInfo"];
  [v5 encodeObject:self->_manageStorageURL forKey:@"manageStorageURL"];
  [v5 encodeObject:self->_manageStorageTitle forKey:@"manageStorageTitle"];
  [v5 encodeObject:self->_manageStorageActionButtonText forKey:@"manageStorageActionButtonText"];
  [v5 encodeObject:self->_manageStoragePage forKey:@"manageStoragePage"];
  [v5 encodeObject:self->_iCloudDetailsPageInfo forKey:@"iCloudDetailsPageInfo"];
}

- (ICQCloudStorageSummary)initWithCoder:(id)a3
{
  v43[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)ICQCloudStorageSummary;
  id v5 = [(ICQCloudStorageSummary *)&v41 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayLabel"];
    displayLabel = v5->_displayLabel;
    v5->_displayLabel = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalStorage"];
    totalStorage = v5->_totalStorage;
    v5->_totalStorage = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"usedStorage"];
    usedStorage = v5->_usedStorage;
    v5->_usedStorage = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"freeStorage"];
    freeStorage = v5->_freeStorage;
    v5->_freeStorage = (NSNumber *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"commerceStorageQuota"];
    commerceStorage = v5->_commerceStorage;
    v5->_commerceStorage = (NSNumber *)v14;

    v16 = (void *)MEMORY[0x1E4F1CAD0];
    v43[0] = objc_opt_class();
    v43[1] = objc_opt_class();
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:2];
    v18 = [v16 setWithArray:v17];

    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"usageByMedia"];
    mediaStorage = v5->_mediaStorage;
    v5->_mediaStorage = (NSArray *)v19;

    v21 = (void *)MEMORY[0x1E4F1CAD0];
    v42[0] = objc_opt_class();
    v42[1] = objc_opt_class();
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];
    v23 = [v21 setWithArray:v22];

    uint64_t v24 = [v4 decodeObjectOfClasses:v23 forKey:@"tips"];
    tips = v5->_tips;
    v5->_tips = (NSArray *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"backupInfo"];
    backupInfo = v5->_backupInfo;
    v5->_backupInfo = (ICQBackupInfo *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subscriptionInfo"];
    subscriptionInfo = v5->_subscriptionInfo;
    v5->_subscriptionInfo = (ICQSubscriptionInfo *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"manageStorageURL"];
    manageStorageURL = v5->_manageStorageURL;
    v5->_manageStorageURL = (NSURL *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"manageStorageTitle"];
    manageStorageTitle = v5->_manageStorageTitle;
    v5->_manageStorageTitle = (NSString *)v32;

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"manageStorageActionButtonText"];
    manageStorageActionButtonText = v5->_manageStorageActionButtonText;
    v5->_manageStorageActionButtonText = (NSString *)v34;

    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"manageStoragePage"];
    manageStoragePage = v5->_manageStoragePage;
    v5->_manageStoragePage = (ICQManageStoragePageInfo *)v36;

    uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iCloudDetailsPageInfo"];
    iCloudDetailsPageInfo = v5->_iCloudDetailsPageInfo;
    v5->_iCloudDetailsPageInfo = (ICQiCloudDetailsPageInfo *)v38;
  }
  return v5;
}

- (BOOL)shouldUseNativeManageStorage
{
  return self->_manageStoragePage != 0;
}

- (NSString)displayLabel
{
  return self->_displayLabel;
}

- (void)setDisplayLabel:(id)a3
{
}

- (NSNumber)totalStorage
{
  return self->_totalStorage;
}

- (void)setTotalStorage:(id)a3
{
}

- (NSNumber)usedStorage
{
  return self->_usedStorage;
}

- (void)setUsedStorage:(id)a3
{
}

- (NSNumber)freeStorage
{
  return self->_freeStorage;
}

- (void)setFreeStorage:(id)a3
{
}

- (NSNumber)commerceStorage
{
  return self->_commerceStorage;
}

- (void)setCommerceStorage:(id)a3
{
}

- (NSArray)mediaStorage
{
  return self->_mediaStorage;
}

- (void)setMediaStorage:(id)a3
{
}

- (NSArray)tips
{
  return self->_tips;
}

- (void)setTips:(id)a3
{
}

- (ICQBackupInfo)backupInfo
{
  return self->_backupInfo;
}

- (void)setBackupInfo:(id)a3
{
}

- (ICQSubscriptionInfo)subscriptionInfo
{
  return self->_subscriptionInfo;
}

- (void)setSubscriptionInfo:(id)a3
{
}

- (ICQiCloudDetailsPageInfo)iCloudDetailsPageInfo
{
  return self->_iCloudDetailsPageInfo;
}

- (void)setICloudDetailsPageInfo:(id)a3
{
}

- (NSURL)manageStorageURL
{
  return self->_manageStorageURL;
}

- (void)setManageStorageURL:(id)a3
{
}

- (NSString)manageStorageTitle
{
  return self->_manageStorageTitle;
}

- (void)setManageStorageTitle:(id)a3
{
}

- (NSString)manageStorageActionButtonText
{
  return self->_manageStorageActionButtonText;
}

- (void)setManageStorageActionButtonText:(id)a3
{
}

- (ICQManageStoragePageInfo)manageStoragePage
{
  return self->_manageStoragePage;
}

- (void)setManageStoragePage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manageStoragePage, 0);
  objc_storeStrong((id *)&self->_manageStorageActionButtonText, 0);
  objc_storeStrong((id *)&self->_manageStorageTitle, 0);
  objc_storeStrong((id *)&self->_manageStorageURL, 0);
  objc_storeStrong((id *)&self->_iCloudDetailsPageInfo, 0);
  objc_storeStrong((id *)&self->_subscriptionInfo, 0);
  objc_storeStrong((id *)&self->_backupInfo, 0);
  objc_storeStrong((id *)&self->_tips, 0);
  objc_storeStrong((id *)&self->_mediaStorage, 0);
  objc_storeStrong((id *)&self->_commerceStorage, 0);
  objc_storeStrong((id *)&self->_freeStorage, 0);
  objc_storeStrong((id *)&self->_usedStorage, 0);
  objc_storeStrong((id *)&self->_totalStorage, 0);
  objc_storeStrong((id *)&self->_displayLabel, 0);
}

@end