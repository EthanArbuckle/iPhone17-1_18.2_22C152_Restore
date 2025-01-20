@interface DownloadPolicyChangeset
- (DownloadPolicyChangeset)initWithPolicyIdentifiers:(id)a3;
- (NSDictionary)downloadPropertiesForStoppedDownloads;
- (NSSet)policyIdentifiers;
- (id)copyWithZone:(_NSZone *)a3;
- (int)changesetType;
- (int64_t)networkType;
- (void)dealloc;
- (void)setChangesetType:(int)a3;
- (void)setDownloadPropertiesForStoppedDownloads:(id)a3;
- (void)setNetworkType:(int64_t)a3;
- (void)setPolicyIdentifiers:(id)a3;
@end

@implementation DownloadPolicyChangeset

- (DownloadPolicyChangeset)initWithPolicyIdentifiers:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DownloadPolicyChangeset;
  v4 = [(DownloadPolicyChangeset *)&v6 init];
  if (v4) {
    v4->_policyIDs = (NSSet *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)DownloadPolicyChangeset;
  [(DownloadPolicyChangeset *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[2] = [(NSDictionary *)self->_downloadProperties copyWithZone:a3];
  v5[4] = [(NSSet *)self->_policyIDs copyWithZone:a3];
  return v5;
}

- (int)changesetType
{
  return self->_changesetType;
}

- (void)setChangesetType:(int)a3
{
  self->_changesetType = a3;
}

- (NSDictionary)downloadPropertiesForStoppedDownloads
{
  return self->_downloadProperties;
}

- (void)setDownloadPropertiesForStoppedDownloads:(id)a3
{
}

- (int64_t)networkType
{
  return self->_networkType;
}

- (void)setNetworkType:(int64_t)a3
{
  self->_networkType = a3;
}

- (NSSet)policyIdentifiers
{
  return self->_policyIDs;
}

- (void)setPolicyIdentifiers:(id)a3
{
}

@end