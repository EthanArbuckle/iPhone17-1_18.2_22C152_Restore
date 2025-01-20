@interface PSUsageBundleCategory
- (NBBackup)nanoBackup;
- (void)setNanoBackup:(id)a3;
@end

@implementation PSUsageBundleCategory

- (NBBackup)nanoBackup
{
  return (NBBackup *)objc_getAssociatedObject(self, "nanoBackup");
}

- (void)setNanoBackup:(id)a3
{
}

@end