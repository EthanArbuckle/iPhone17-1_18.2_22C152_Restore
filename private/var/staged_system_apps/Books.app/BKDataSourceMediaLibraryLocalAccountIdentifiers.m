@interface BKDataSourceMediaLibraryLocalAccountIdentifiers
- (NSString)downloadedDSID;
- (NSString)familyID;
- (NSString)purchasedDSID;
- (void)setDownloadedDSID:(id)a3;
- (void)setFamilyID:(id)a3;
- (void)setPurchasedDSID:(id)a3;
@end

@implementation BKDataSourceMediaLibraryLocalAccountIdentifiers

- (NSString)purchasedDSID
{
  return self->_purchasedDSID;
}

- (void)setPurchasedDSID:(id)a3
{
}

- (NSString)downloadedDSID
{
  return self->_downloadedDSID;
}

- (void)setDownloadedDSID:(id)a3
{
}

- (NSString)familyID
{
  return self->_familyID;
}

- (void)setFamilyID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_familyID, 0);
  objc_storeStrong((id *)&self->_downloadedDSID, 0);

  objc_storeStrong((id *)&self->_purchasedDSID, 0);
}

@end