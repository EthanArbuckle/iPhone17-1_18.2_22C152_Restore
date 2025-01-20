@interface PFSecureDownloadRenewalManager
+ (id)inContextKeyDataFor:(int64_t)a3 ctx:(id)a4;
- (PFSecureDownloadRenewalManager)init;
- (void)requestSecureDeletionOfEpisodeWithAdamID:(int64_t)a3;
- (void)requestSecureDeletionOfOrphanedKeys;
- (void)updateDRMKeysForDownloads;
@end

@implementation PFSecureDownloadRenewalManager

- (PFSecureDownloadRenewalManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)PFSecureDownloadRenewalManager;
  v2 = [(PFSecureDownloadRenewalManager *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(MTSecureDownloadRenewalManager);
    manager = v2->_manager;
    v2->_manager = v3;
  }
  return v2;
}

- (void)updateDRMKeysForDownloads
{
}

- (void)requestSecureDeletionOfEpisodeWithAdamID:(int64_t)a3
{
}

- (void)requestSecureDeletionOfOrphanedKeys
{
}

+ (id)inContextKeyDataFor:(int64_t)a3 ctx:(id)a4
{
  return +[MTSecureDownloadRenewalManager inContextKeyDataFor:a3 ctx:a4];
}

- (void).cxx_destruct
{
}

@end