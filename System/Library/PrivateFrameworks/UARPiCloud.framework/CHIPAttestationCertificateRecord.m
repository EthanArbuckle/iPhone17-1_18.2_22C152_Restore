@interface CHIPAttestationCertificateRecord
+ (BOOL)supportsSecureCoding;
- (CHIPAttestationCertificateRecord)initWithCKRecord:(id)a3;
- (CHIPAttestationCertificateRecord)initWithCoder:(id)a3;
- (CKRecord)ckRecord;
- (NSString)intermediateCertificates;
- (NSString)recordName;
- (NSString)recordStatus;
- (NSString)rootCertificate;
- (NSString)signature;
- (NSString)verificationCertificateID;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHIPAttestationCertificateRecord

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CHIPAttestationCertificateRecord)initWithCKRecord:(id)a3
{
  id v4 = a3;
  if (v4
    && (v30.receiver = self,
        v30.super_class = (Class)CHIPAttestationCertificateRecord,
        (self = [(CHIPAttestationCertificateRecord *)&v30 init]) != 0))
  {
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

    v13 = [v4 objectForKey:@"signature"];
    v14 = (NSString *)[v13 copy];
    signature = self->_signature;
    self->_signature = v14;

    v16 = [v4 objectForKey:@"verificationCertificateKey"];
    v17 = (NSString *)[v16 copy];
    verificationCertificateID = self->_verificationCertificateID;
    self->_verificationCertificateID = v17;

    v19 = [v4 objectForKey:@"rootCertificate"];
    v20 = (NSString *)[v19 copy];
    rootCertificate = self->_rootCertificate;
    self->_rootCertificate = v20;

    v22 = [v4 objectForKey:@"intermediateCertificates"];
    v23 = (NSString *)[v22 copy];
    intermediateCertificates = self->_intermediateCertificates;
    self->_intermediateCertificates = v23;

    v25 = [v4 objectForKey:@"recordStatus"];
    v26 = (NSString *)[v25 copy];
    recordStatus = self->_recordStatus;
    self->_recordStatus = v26;

    if (!self->_signature || !self->_verificationCertificateID || !self->_rootCertificate || !self->_recordStatus)
    {

      self = 0;
    }
    self = self;
    v28 = self;
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [CHIPAttestationCertificateRecord alloc];
  ckRecord = self->_ckRecord;
  return [(CHIPAttestationCertificateRecord *)v4 initWithCKRecord:ckRecord];
}

- (void)encodeWithCoder:(id)a3
{
}

- (CHIPAttestationCertificateRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"record"];

  v6 = [(CHIPAttestationCertificateRecord *)self initWithCKRecord:v5];
  return v6;
}

- (NSString)rootCertificate
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)intermediateCertificates
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)recordStatus
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)recordName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (CKRecord)ckRecord
{
  return (CKRecord *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)signature
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)verificationCertificateID
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verificationCertificateID, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_ckRecord, 0);
  objc_storeStrong((id *)&self->_recordName, 0);
  objc_storeStrong((id *)&self->_recordStatus, 0);
  objc_storeStrong((id *)&self->_intermediateCertificates, 0);
  objc_storeStrong((id *)&self->_rootCertificate, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end