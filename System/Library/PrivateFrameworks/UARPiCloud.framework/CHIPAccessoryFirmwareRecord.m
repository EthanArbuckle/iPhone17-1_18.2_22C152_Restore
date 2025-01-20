@interface CHIPAccessoryFirmwareRecord
+ (BOOL)supportsSecureCoding;
- (CHIPAccessoryFirmwareRecord)initWithCKRecord:(id)a3;
- (CHIPAccessoryFirmwareRecord)initWithCoder:(id)a3;
- (CKRecord)ckRecord;
- (NSData)digest;
- (NSDate)releaseDate;
- (NSNumber)cdVersionNumber;
- (NSNumber)firmwareVersionNumber;
- (NSNumber)hashAlgorithmType;
- (NSNumber)maxFirmwareVersionNumber;
- (NSNumber)minFirmwareVersionNumber;
- (NSString)firmwareBinaryHash;
- (NSString)firmwareFileSize;
- (NSString)firmwareURL;
- (NSString)firmwareVersion;
- (NSString)recordName;
- (NSString)recordStatus;
- (NSString)releaseNotesHash;
- (NSString)releaseNotesURL;
- (NSString)signature;
- (NSString)verificationCertificateID;
- (id)copyWithZone:(_NSZone *)a3;
- (void)calculateDigestFromCKRecord:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHIPAccessoryFirmwareRecord

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CHIPAccessoryFirmwareRecord)initWithCKRecord:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_14;
  }
  v50.receiver = self;
  v50.super_class = (Class)CHIPAccessoryFirmwareRecord;
  self = [(CHIPAccessoryFirmwareRecord *)&v50 init];
  if (!self) {
    goto LABEL_14;
  }
  v5 = (OS_os_log *)os_log_create("com.apple.accessoryupdater.uarp", "iCloudAssetManager");
  log = self->_log;
  self->_log = v5;

  v7 = (CKRecord *)[v4 copy];
  ckRecord = self->_ckRecord;
  self->_ckRecord = v7;

  v9 = [v4 recordID];
  v10 = [v9 recordName];
  v11 = (NSString *)[v10 copy];
  recordName = self->_recordName;
  self->_recordName = v11;

  v13 = [v4 objectForKey:@"signatureV2"];
  v14 = (NSString *)[v13 copy];
  signature = self->_signature;
  self->_signature = v14;

  if (!self->_signature) {
    goto LABEL_14;
  }
  v16 = [v4 objectForKey:@"verificationCertificateKey"];
  v17 = (NSString *)[v16 copy];
  verificationCertificateID = self->_verificationCertificateID;
  self->_verificationCertificateID = v17;

  if (!self->_verificationCertificateID) {
    goto LABEL_14;
  }
  v19 = [v4 objectForKey:@"firmwareVersionString"];
  v20 = (NSString *)[v19 copy];
  firmwareVersion = self->_firmwareVersion;
  self->_firmwareVersion = v20;

  v22 = [v4 objectForKey:@"firmwareVersionNumber"];
  firmwareVersionNumber = self->_firmwareVersionNumber;
  self->_firmwareVersionNumber = v22;

  if (!self->_firmwareVersionNumber) {
    goto LABEL_14;
  }
  v24 = [v4 objectForKey:@"minFirmwareVersionNumber"];
  minFirmwareVersionNumber = self->_minFirmwareVersionNumber;
  self->_minFirmwareVersionNumber = v24;

  v26 = [v4 objectForKey:@"maxFirmwareVersionNumber"];
  maxFirmwareVersionNumber = self->_maxFirmwareVersionNumber;
  self->_maxFirmwareVersionNumber = v26;

  v28 = [v4 objectForKey:@"firmwareURL"];
  v29 = (NSString *)[v28 copy];
  firmwareURL = self->_firmwareURL;
  self->_firmwareURL = v29;

  v31 = [v4 objectForKey:@"firmwareBinaryHash"];
  v32 = (NSString *)[v31 copy];
  firmwareBinaryHash = self->_firmwareBinaryHash;
  self->_firmwareBinaryHash = v32;

  if (self->_firmwareURL)
  {
    if (!self->_firmwareBinaryHash) {
      goto LABEL_14;
    }
  }
  v34 = [v4 objectForKey:@"firmwareFileSize"];
  v35 = (NSString *)[v34 copy];
  firmwareFileSize = self->_firmwareFileSize;
  self->_firmwareFileSize = v35;

  if (self->_firmwareURL)
  {
    if (!self->_firmwareFileSize) {
      goto LABEL_14;
    }
  }
  v37 = [v4 objectForKey:@"hashAlgorithmType"];
  hashAlgorithmType = self->_hashAlgorithmType;
  self->_hashAlgorithmType = v37;

  if (self->_firmwareURL)
  {
    if (!self->_hashAlgorithmType) {
      goto LABEL_14;
    }
  }
  v39 = [v4 objectForKey:@"cdVersionNumber"];
  cdVersionNumber = self->_cdVersionNumber;
  self->_cdVersionNumber = v39;

  v41 = [v4 objectForKey:@"releaseNotesURL"];
  releaseNotesURL = self->_releaseNotesURL;
  self->_releaseNotesURL = v41;

  v43 = [v4 modificationDate];
  v44 = (NSDate *)[v43 copy];
  releaseDate = self->_releaseDate;
  self->_releaseDate = v44;

  v46 = [v4 objectForKey:@"recordStatus"];
  recordStatus = self->_recordStatus;
  self->_recordStatus = v46;

  if (self->_recordStatus)
  {
    [(CHIPAccessoryFirmwareRecord *)self calculateDigestFromCKRecord:v4];
    self = self;
    v48 = self;
  }
  else
  {
LABEL_14:
    v48 = 0;
  }

  return v48;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [CHIPAccessoryFirmwareRecord alloc];
  ckRecord = self->_ckRecord;
  return [(CHIPAccessoryFirmwareRecord *)v4 initWithCKRecord:ckRecord];
}

- (void)encodeWithCoder:(id)a3
{
}

- (CHIPAccessoryFirmwareRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"record"];

  v6 = [(CHIPAccessoryFirmwareRecord *)self initWithCKRecord:v5];
  return v6;
}

- (void)calculateDigestFromCKRecord:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  memset(&c, 0, sizeof(c));
  CC_SHA256_Init(&c);
  digest = self->_digest;
  self->_digest = 0;

  v6 = [v4 allKeys];
  v7 = [v6 sortedArrayUsingSelector:sel_caseInsensitiveCompare_];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v9)
  {
    unint64_t v10 = v9;
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v25;
    for (uint64_t i = *(void *)v25; ; uint64_t i = *(void *)v25)
    {
      if (i != v12) {
        objc_enumerationMutation(v8);
      }
      v14 = *(void **)(*((void *)&v24 + 1) + 8 * v11);
      if (([v14 isEqualToString:@"firmwareVersionNumber"] & 1) != 0
        || ([v14 isEqualToString:@"minFirmwareVersionNumber"] & 1) != 0
        || [v14 isEqualToString:@"maxFirmwareVersionNumber"])
      {
        break;
      }
      if ([v14 isEqualToString:@"hashAlgorithmType"])
      {
        v15 = [v4 objectForKey:v14];
        unint64_t data = 0;
        unint64_t data = bswap64([v15 unsignedLongLongValue]);
        CC_LONG v16 = 8;
        goto LABEL_9;
      }
      if ([v14 isEqualToString:@"cdVersionNumber"])
      {
        v15 = [v4 objectForKey:v14];
        LOWORD(data) = 0;
        LOWORD(data) = __rev16([v15 unsignedShortValue]);
        CC_LONG v16 = 2;
        goto LABEL_9;
      }
      if (([v14 isEqualToString:@"verificationCertificateKey"] & 1) == 0
        && ([v14 isEqualToString:@"signature"] & 1) == 0
        && ([v14 isEqualToString:@"signatureV2"] & 1) == 0)
      {
        v15 = [v4 objectForKey:v14];
        [v15 dataUsingEncoding:4];
        v22 = self;
        id v18 = objc_claimAutoreleasedReturnValue();
        CC_SHA256_Update(&c, (const void *)[v18 bytes], objc_msgSend(v18, "length"));

        self = v22;
        goto LABEL_10;
      }
LABEL_11:
      if (++v11 >= v10)
      {
        uint64_t v17 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
        if (!v17) {
          goto LABEL_23;
        }
        unint64_t v10 = v17;
        uint64_t v11 = 0;
      }
    }
    v15 = [v4 objectForKey:v14];
    LODWORD(data) = 0;
    LODWORD(data) = bswap32([v15 unsignedIntValue]);
    CC_LONG v16 = 4;
LABEL_9:
    CC_SHA256_Update(&c, &data, v16);
LABEL_10:

    goto LABEL_11;
  }
LABEL_23:

  id v19 = [MEMORY[0x263EFF990] dataWithLength:32];
  CC_SHA256_Final((unsigned __int8 *)[v19 mutableBytes], &c);
  v20 = [MEMORY[0x263EFF8F8] dataWithData:v19];
  v21 = self->_digest;
  self->_digest = v20;
}

- (NSString)firmwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)firmwareVersionNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (NSNumber)minFirmwareVersionNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (NSNumber)maxFirmwareVersionNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)firmwareURL
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)firmwareBinaryHash
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)firmwareFileSize
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)releaseNotesURL
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (NSString)releaseNotesHash
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (NSNumber)hashAlgorithmType
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (NSNumber)cdVersionNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (NSString)recordStatus
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (NSDate)releaseDate
{
  return (NSDate *)objc_getProperty(self, a2, 112, 1);
}

- (NSString)recordName
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (CKRecord)ckRecord
{
  return (CKRecord *)objc_getProperty(self, a2, 128, 1);
}

- (NSString)signature
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (NSString)verificationCertificateID
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (NSData)digest
{
  return (NSData *)objc_getProperty(self, a2, 152, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digest, 0);
  objc_storeStrong((id *)&self->_verificationCertificateID, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_ckRecord, 0);
  objc_storeStrong((id *)&self->_recordName, 0);
  objc_storeStrong((id *)&self->_releaseDate, 0);
  objc_storeStrong((id *)&self->_recordStatus, 0);
  objc_storeStrong((id *)&self->_cdVersionNumber, 0);
  objc_storeStrong((id *)&self->_hashAlgorithmType, 0);
  objc_storeStrong((id *)&self->_releaseNotesHash, 0);
  objc_storeStrong((id *)&self->_releaseNotesURL, 0);
  objc_storeStrong((id *)&self->_firmwareFileSize, 0);
  objc_storeStrong((id *)&self->_firmwareBinaryHash, 0);
  objc_storeStrong((id *)&self->_firmwareURL, 0);
  objc_storeStrong((id *)&self->_maxFirmwareVersionNumber, 0);
  objc_storeStrong((id *)&self->_minFirmwareVersionNumber, 0);
  objc_storeStrong((id *)&self->_firmwareVersionNumber, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end