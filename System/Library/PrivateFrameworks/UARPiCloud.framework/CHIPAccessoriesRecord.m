@interface CHIPAccessoriesRecord
- (BOOL)createAccessoryMetadata:(id)a3;
- (CHIPAccessoriesRecord)initWithCKRecord:(id)a3;
- (NSString)accessoryListSignature;
- (NSString)installationGuideURLString;
- (NSString)stonehengeCertificateID;
- (UARPAccessoryMetadata)accessoryMetadata;
@end

@implementation CHIPAccessoriesRecord

- (CHIPAccessoriesRecord)initWithCKRecord:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_9;
  }
  v20.receiver = self;
  v20.super_class = (Class)CHIPAccessoriesRecord;
  self = [(CHIPAccessoriesRecord *)&v20 init];
  if (!self) {
    goto LABEL_8;
  }
  v5 = (OS_os_log *)os_log_create("com.apple.accessoryupdater.uarp", "iCloudAssetManager");
  log = self->_log;
  self->_log = v5;

  v7 = [v4 recordType];
  int v8 = [v7 isEqualToString:@"CHIPAccessory"];

  if (!v8) {
    goto LABEL_9;
  }
  v9 = [v4 objectForKey:@"signatureV2"];
  v10 = (NSString *)[v9 copy];
  accessoryListSignature = self->_accessoryListSignature;
  self->_accessoryListSignature = v10;

  if (!self->_accessoryListSignature) {
    goto LABEL_9;
  }
  v12 = [v4 objectForKey:@"verificationCertificateKey"];
  v13 = (NSString *)[v12 copy];
  stonehengeCertificateID = self->_stonehengeCertificateID;
  self->_stonehengeCertificateID = v13;

  if (!self->_stonehengeCertificateID) {
    goto LABEL_9;
  }
  v15 = [v4 objectForKey:@"accessoryInstallationGuideURL"];
  v16 = (NSString *)[v15 copy];
  installationGuideURLString = self->_installationGuideURLString;
  self->_installationGuideURLString = v16;

  if ([(CHIPAccessoriesRecord *)self createAccessoryMetadata:v4]
    && self->_accessoryMetadata)
  {
LABEL_8:
    self = self;
    v18 = self;
  }
  else
  {
LABEL_9:
    v18 = 0;
  }

  return v18;
}

- (BOOL)createAccessoryMetadata:(id)a3
{
  id v4 = a3;
  v5 = [v4 recordID];
  v6 = [v5 recordName];
  v7 = [v6 componentsSeparatedByString:@"-"];

  uint64_t v8 = [v7 count];
  if (v8 == 2)
  {
    v9 = [v7 firstObject];
    v10 = [v7 lastObject];
    v11 = (UARPAccessoryMetadata *)[objc_alloc(MEMORY[0x263F38318]) initWithProductGroup:v9 productNumber:v10];
    accessoryMetadata = self->_accessoryMetadata;
    self->_accessoryMetadata = v11;

    v13 = [v4 objectForKey:@"accessoryCategoryNumber"];
    -[UARPAccessoryMetadata setAccessoryCategoryNumber:](self->_accessoryMetadata, "setAccessoryCategoryNumber:", [v13 unsignedLongLongValue]);

    v14 = [v4 objectForKey:@"accessoryMarketingName"];
    [(UARPAccessoryMetadata *)self->_accessoryMetadata setAccessoryMarketingName:v14];

    v15 = [v4 objectForKey:@"accessoryProductLabelV2"];
    [(UARPAccessoryMetadata *)self->_accessoryMetadata setAccessoryProductLabel:v15];

    v16 = [v4 objectForKey:@"vendorName"];
    [(UARPAccessoryMetadata *)self->_accessoryMetadata setVendorName:v16];

    v17 = [v4 objectForKey:@"companyLegalName"];
    [(UARPAccessoryMetadata *)self->_accessoryMetadata setCompanyLegalName:v17];

    v18 = [v4 objectForKey:@"companyPreferredName"];
    [(UARPAccessoryMetadata *)self->_accessoryMetadata setCompanyPreferredName:v18];

    [(UARPAccessoryMetadata *)self->_accessoryMetadata setAccessoryCapability:16];
    if (self->_installationGuideURLString)
    {
      v19 = objc_msgSend(NSURL, "URLWithString:");
      [(UARPAccessoryMetadata *)self->_accessoryMetadata setAccessoryInstallationGuideURL:v19];
    }
  }

  return v8 == 2;
}

- (UARPAccessoryMetadata)accessoryMetadata
{
  return (UARPAccessoryMetadata *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)accessoryListSignature
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)stonehengeCertificateID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)installationGuideURLString
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installationGuideURLString, 0);
  objc_storeStrong((id *)&self->_stonehengeCertificateID, 0);
  objc_storeStrong((id *)&self->_accessoryListSignature, 0);
  objc_storeStrong((id *)&self->_accessoryMetadata, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end