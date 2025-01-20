@interface MSCMSEncryptionKeyPreferenceAttribute
- (BOOL)legacyASN1Encoding;
- (MSCMSEncryptionKeyPreferenceAttribute)initWithAttribute:(id)a3 certificates:(id)a4 LAContext:(id)a5 error:(id *)a6;
- (MSCMSEncryptionKeyPreferenceAttribute)initWithAttribute:(id)a3 error:(id *)a4;
- (MSCMSEncryptionKeyPreferenceAttribute)initWithCertificate:(__SecCertificate *)a3;
- (MSCMSEncryptionKeyPreferenceAttribute)initWithEmailAddress:(id)a3;
- (MSCMSEncryptionKeyPreferenceAttribute)initWithIdentity:(__SecIdentity *)a3;
- (MSOID)attributeType;
- (__SecCertificate)encryptionCertificate;
- (id)encodeAttributeWithError:(id *)a3;
- (void)dealloc;
- (void)setLegacyASN1Encoding:(BOOL)a3;
@end

@implementation MSCMSEncryptionKeyPreferenceAttribute

- (MSOID)attributeType
{
  return +[MSOID OIDWithString:@"1.2.840.113549.1.9.16.2.11" error:0];
}

- (MSCMSEncryptionKeyPreferenceAttribute)initWithAttribute:(id)a3 error:(id *)a4
{
  return [(MSCMSEncryptionKeyPreferenceAttribute *)self initWithAttribute:a3 certificates:0 LAContext:0 error:a4];
}

- (MSCMSEncryptionKeyPreferenceAttribute)initWithAttribute:(id)a3 certificates:(id)a4 LAContext:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v33.receiver = self;
  v33.super_class = (Class)MSCMSEncryptionKeyPreferenceAttribute;
  v13 = [(MSCMSEncryptionKeyPreferenceAttribute *)&v33 init];
  v14 = [v10 attributeType];
  char v15 = [v14 isEqualToString:@"1.2.840.113549.1.9.16.2.11"];

  if ((v15 & 1) == 0)
  {
    v27 = MSErrorCMSDomain[0];
    v28 = @"Not an Encryption Key Preference attribute according to AttributeType";
    uint64_t v29 = -26275;
    goto LABEL_15;
  }
  v16 = [v10 attributeValues];
  uint64_t v17 = [v16 count];

  if (v17 != 1)
  {
    v27 = MSErrorCMSDomain[0];
    v28 = @"Encryption Key Preference Attribute should only have one value";
    uint64_t v29 = -50;
    goto LABEL_15;
  }
  memset(&v32[1], 0, 48);
  v18 = [v10 attributeValues];
  v19 = [v18 objectAtIndex:0];
  v20 = (void *)nsheim_decode_SMIMEEncryptionKeyPreference(v19);

  if (v20)
  {
    v21 = [v10 attributeValues];
    v22 = [v21 objectAtIndex:0];
    int v23 = nsheim_decode_SecCMS_SMIMEEncryptionKeyPreference(v22);

    if (v23)
    {
      v32[0] = 0;
      asn1ErrorToNSError(v20, v32);
      id v24 = v32[0];
      id v25 = +[MSError MSErrorWithDomain:MSErrorASN1Domain[0] code:(int)v20 underlyingError:v24 description:@"unable to decode Encryption Key Preference Attribute"];

      goto LABEL_16;
    }
  }
  if (LODWORD(v32[1]) == 3 || LODWORD(v32[1]) == 2)
  {
    uint64_t CertificateBySubjectKeyID = findCertificateBySubjectKeyID(&v32[2], v11, v12, a6);
    goto LABEL_11;
  }
  if (LODWORD(v32[1]) == 1)
  {
    uint64_t CertificateBySubjectKeyID = findCertificateByIssuerAndSerialNumber(&v32[2], v11, v12, a6);
LABEL_11:
    if (CertificateBySubjectKeyID)
    {
      v13->_encryptionCertificate = (__SecCertificate *)CertificateBySubjectKeyID;
      free_SMIMEEncryptionKeyPreference();
LABEL_19:
      v30 = v13;
      id v25 = 0;
      goto LABEL_20;
    }
    v27 = MSErrorASN1Domain[0];
    v28 = @"the Encryption Key Preference Attribute did not match any certificates";
    goto LABEL_14;
  }
  v27 = MSErrorASN1Domain[0];
  v28 = @"unknown type for Encryption Key Preference Attribute";
LABEL_14:
  uint64_t v29 = 0;
LABEL_15:
  id v25 = +[MSError MSErrorWithDomain:v27 code:v29 underlyingError:0 description:v28];
LABEL_16:
  free_SMIMEEncryptionKeyPreference();
  if (!v25) {
    goto LABEL_19;
  }
  if (a6)
  {
    id v25 = v25;
    v30 = 0;
    *a6 = v25;
  }
  else
  {
    v30 = 0;
  }
LABEL_20:

  return v30;
}

- (MSCMSEncryptionKeyPreferenceAttribute)initWithCertificate:(__SecCertificate *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MSCMSEncryptionKeyPreferenceAttribute;
  v4 = [(MSCMSEncryptionKeyPreferenceAttribute *)&v6 init];
  if (v4)
  {
    if (a3) {
      CFRetain(a3);
    }
    v4->_encryptionCertificate = a3;
  }
  return v4;
}

- (MSCMSEncryptionKeyPreferenceAttribute)initWithIdentity:(__SecIdentity *)a3
{
  SecCertificateRef certificateRef = 0;
  if (!SecIdentityCopyCertificate(a3, &certificateRef)) {
    self = [(MSCMSEncryptionKeyPreferenceAttribute *)self initWithCertificate:certificateRef];
  }
  if (certificateRef) {
    CFRelease(certificateRef);
  }
  return self;
}

- (MSCMSEncryptionKeyPreferenceAttribute)initWithEmailAddress:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && (CertificateByEmailAddress = (__SecCertificate *)findCertificateByEmailAddress(v4, 0, 0)) != 0)
  {
    self->_encryptionCertificate = CertificateByEmailAddress;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)encodeAttributeWithError:(id *)a3
{
  v37[1] = *MEMORY[0x263EF8340];
  CFErrorRef error = 0;
  encryptionCertificate = self->_encryptionCertificate;
  if (!encryptionCertificate)
  {
    id v10 = 0;
    goto LABEL_33;
  }
  CFDataRef v6 = SecCertificateCopyNormalizedIssuerSequence(encryptionCertificate);
  CFDataRef v7 = SecCertificateCopySerialNumberData(self->_encryptionCertificate, &error);
  CFDataRef v8 = v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    id v10 = 0;
    if (a3) {
      *a3 = error;
    }
    goto LABEL_32;
  }
  long long v32 = 0u;
  v31[0] = 1;
  v31[1] = [(__CFData *)v6 length];
  v31[2] = [(__CFData *)v6 bytes];
  v31[3] = [(__CFData *)v8 length];
  *(void *)&long long v32 = [(__CFData *)v8 bytes];
  DWORD2(v32) = 0;
  if (![(MSCMSEncryptionKeyPreferenceAttribute *)self legacyASN1Encoding])
  {
    uint64_t v30 = 0;
    uint64_t v12 = length_SMIMEEncryptionKeyPreference((uint64_t)v31);
    v18 = [MEMORY[0x263EFF990] dataWithLength:v12];
    if (v18)
    {
      id v14 = v18;
      int v19 = encode_SMIMEEncryptionKeyPreference([v14 mutableBytes] + v12 - 1, v12, (uint64_t)v31, (uint64_t)&v30);
      if (!v19) {
        goto LABEL_20;
      }
      int v20 = v19;

      uint64_t v17 = v20;
      if (!a3) {
        goto LABEL_27;
      }
    }
    else
    {
      uint64_t v17 = 12;
      if (!a3) {
        goto LABEL_27;
      }
    }
    v21 = (void *)MEMORY[0x263F087E8];
    uint64_t v34 = *MEMORY[0x263F08320];
    v35 = @"Failed encoding type SMIMEEncryptionKeyPreference";
    v22 = NSDictionary;
    int v23 = &v35;
    id v24 = &v34;
    goto LABEL_26;
  }
  uint64_t v30 = 0;
  uint64_t v12 = length_SecCMS_SMIMEEncryptionKeyPreference((uint64_t)v31);
  v13 = [MEMORY[0x263EFF990] dataWithLength:v12];
  if (!v13) {
    goto LABEL_22;
  }
  id v14 = v13;
  int v15 = encode_SecCMS_SMIMEEncryptionKeyPreference([v14 mutableBytes] + v12 - 1, v12, (uint64_t)v31, (uint64_t)&v30);
  if (v15)
  {
    int v16 = v15;

    uint64_t v17 = v16;
    if (!a3) {
      goto LABEL_27;
    }
    goto LABEL_23;
  }
LABEL_20:
  if (v12 != v30)
  {
    asn1_abort();
LABEL_22:
    uint64_t v17 = 12;
    if (a3)
    {
LABEL_23:
      v21 = (void *)MEMORY[0x263F087E8];
      uint64_t v36 = *MEMORY[0x263F08320];
      v37[0] = @"Failed encoding type SecCMS_SMIMEEncryptionKeyPreference";
      v22 = NSDictionary;
      int v23 = (__CFString **)v37;
      id v24 = &v36;
LABEL_26:
      id v25 = [v22 dictionaryWithObjects:v23 forKeys:v24 count:1];
      *a3 = [v21 errorWithDomain:@"com.apple.HeimASN1" code:v17 userInfo:v25];
    }
LABEL_27:
    id v14 = 0;
  }
  if ([v14 length])
  {
    v26 = [MSCMSAttribute alloc];
    v27 = +[MSOID OIDWithString:@"1.2.840.113549.1.9.16.2.11" error:a3];
    v28 = [MEMORY[0x263EFF8C0] arrayWithObject:v14];
    id v10 = [(MSCMSAttribute *)v26 initWithAttributeType:v27 values:v28];
  }
  else
  {
    id v10 = 0;
  }

LABEL_32:
LABEL_33:

  return v10;
}

- (void)dealloc
{
  encryptionCertificate = self->_encryptionCertificate;
  if (encryptionCertificate) {
    CFRelease(encryptionCertificate);
  }
  v4.receiver = self;
  v4.super_class = (Class)MSCMSEncryptionKeyPreferenceAttribute;
  [(MSCMSEncryptionKeyPreferenceAttribute *)&v4 dealloc];
}

- (__SecCertificate)encryptionCertificate
{
  return self->_encryptionCertificate;
}

- (BOOL)legacyASN1Encoding
{
  return self->_legacyASN1Encoding;
}

- (void)setLegacyASN1Encoding:(BOOL)a3
{
  self->_legacyASN1Encoding = a3;
}

@end