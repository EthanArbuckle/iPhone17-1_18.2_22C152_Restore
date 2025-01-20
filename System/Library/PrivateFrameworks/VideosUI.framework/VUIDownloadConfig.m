@interface VUIDownloadConfig
- (BOOL)allowEnhancedDownloads;
- (NSArray)blacklistedEarlyRenewalBrands;
- (VUIDownloadConfig)init;
- (void)setAllowEnhancedDownloads:(BOOL)a3;
- (void)setBlacklistedEarlyRenewalBrands:(id)a3;
@end

@implementation VUIDownloadConfig

- (VUIDownloadConfig)init
{
  v8.receiver = self;
  v8.super_class = (Class)VUIDownloadConfig;
  v2 = [(VUIDownloadConfig *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_allowEnhancedDownloads = 0;
    v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v5 = [v4 objectForKey:@"allowEnhancedDownloads"];

    if (v5)
    {
      v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      v3->_allowEnhancedDownloads = [v6 BOOLForKey:@"allowEnhancedDownloads"];
    }
  }
  return v3;
}

- (NSArray)blacklistedEarlyRenewalBrands
{
  return self->_blacklistedEarlyRenewalBrands;
}

- (void)setBlacklistedEarlyRenewalBrands:(id)a3
{
}

- (BOOL)allowEnhancedDownloads
{
  return self->_allowEnhancedDownloads;
}

- (void)setAllowEnhancedDownloads:(BOOL)a3
{
  self->_allowEnhancedDownloads = a3;
}

- (void).cxx_destruct
{
}

@end