@interface MSCMSIdentifier
+ (id)decodeIdentifier:(heim_base_data *)a3 error:(id *)a4;
- (IssuerAndSerialNumber)issuerAndSerialNumber;
- (MSCMSIdentifier)initWithIssuerName:(id)a3 serialNumber:(id)a4;
- (MSCMSIdentifier)initWithIssuerName:(id)a3 serialNumber:(id)a4 negativeNumber:(BOOL)a5;
- (MSCMSIdentifier)initWithSkid:(id)a3;
- (NSData)issuerNameData;
- (NSData)serialNumberData;
- (NSData)skidData;
- (heim_base_data)subjectKeyId;
- (id)encodeMessageSecurityObject:(id *)a3;
- (int)type;
- (void)setIssuerAndSerialNumber:(IssuerAndSerialNumber *)a3;
- (void)setIssuerNameData:(id)a3;
- (void)setSerialNumberData:(id)a3;
- (void)setSkidData:(id)a3;
- (void)setSubjectKeyId:(heim_base_data *)a3;
- (void)setType:(int)a3;
@end

@implementation MSCMSIdentifier

- (MSCMSIdentifier)initWithIssuerName:(id)a3 serialNumber:(id)a4 negativeNumber:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)MSCMSIdentifier;
  v10 = [(MSCMSIdentifier *)&v17 init];
  v11 = v10;
  if (v10)
  {
    [(MSCMSIdentifier *)v10 setType:1];
    [(MSCMSIdentifier *)v11 setIssuerNameData:v8];
    [(MSCMSIdentifier *)v11 setSerialNumberData:v9];
    [(MSCMSIdentifier *)v11 setIssuerAndSerialNumber:&_iAndSN];
    id v12 = [(MSCMSIdentifier *)v11 issuerNameData];
    qword_26AB59D98 = [v12 bytes];

    v13 = [(MSCMSIdentifier *)v11 issuerNameData];
    _iAndSN = [v13 length];

    id v14 = [(MSCMSIdentifier *)v11 serialNumberData];
    qword_26AB59DA8 = [v14 bytes];

    v15 = [(MSCMSIdentifier *)v11 serialNumberData];
    qword_26AB59DA0 = [v15 length];

    dword_26AB59DB0 = v5;
  }

  return v11;
}

- (NSData)serialNumberData
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (NSData)issuerNameData
{
  return (NSData *)objc_getProperty(self, a2, 48, 1);
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (void)setSerialNumberData:(id)a3
{
}

- (void)setIssuerNameData:(id)a3
{
}

- (void)setIssuerAndSerialNumber:(IssuerAndSerialNumber *)a3
{
  self->_issuerAndSerialNumber = a3;
}

- (int)type
{
  return self->_type;
}

+ (id)decodeIdentifier:(heim_base_data *)a3 error:(id *)a4
{
  if (a4 && *a4) {
    v6 = (void *)[*a4 copy];
  }
  else {
    v6 = 0;
  }
  int v7 = decode_CMSIdentifier();
  if (v7)
  {
    id v8 = MSErrorASN1Domain[0];
    uint64_t v10 = v7;
    id v9 = @"unable to decode CMS Identifier";
  }
  else
  {
    id v8 = MSErrorASN1Domain[0];
    if (a3->var0)
    {
      id v9 = @"unable to decode CMS Identifier";
      uint64_t v10 = 1859794442;
    }
    else
    {
      id v9 = @"invalid CMS Identifier choice";
      uint64_t v10 = 0;
    }
  }
  v11 = +[MSError MSErrorWithDomain:v8 code:v10 underlyingError:v6 description:v9];

  if (a4 && v11) {
    *a4 = v11;
  }
  free_CMSIdentifier();

  return 0;
}

- (IssuerAndSerialNumber)issuerAndSerialNumber
{
  return self->_issuerAndSerialNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_issuerNameData, 0);
  objc_storeStrong((id *)&self->_serialNumberData, 0);

  objc_storeStrong((id *)&self->_skidData, 0);
}

- (MSCMSIdentifier)initWithSkid:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MSCMSIdentifier;
  BOOL v5 = [(MSCMSIdentifier *)&v10 init];
  v6 = v5;
  if (v5)
  {
    [(MSCMSIdentifier *)v5 setType:2];
    [(MSCMSIdentifier *)v6 setSkidData:v4];
    [(MSCMSIdentifier *)v6 setSubjectKeyId:&_skid];
    int v7 = [(MSCMSIdentifier *)v6 skidData];
    _skid = [v7 length];

    id v8 = [(MSCMSIdentifier *)v6 skidData];
    qword_26AB59D88 = [v8 bytes];
  }
  return v6;
}

- (MSCMSIdentifier)initWithIssuerName:(id)a3 serialNumber:(id)a4
{
  return [(MSCMSIdentifier *)self initWithIssuerName:a3 serialNumber:a4 negativeNumber:0];
}

- (id)encodeMessageSecurityObject:(id *)a3
{
  v28[1] = *MEMORY[0x263EF8340];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v24 = 0u;
  LODWORD(v24) = [(MSCMSIdentifier *)self type];
  int v5 = [(MSCMSIdentifier *)self type];
  if (v5 == 2)
  {
    if ([(MSCMSIdentifier *)self subjectKeyId])
    {
      *(void *)&long long v25 = (void)[(MSCMSIdentifier *)self subjectKeyId][8];
      *((void *)&v24 + 1) = *(void *)[(MSCMSIdentifier *)self subjectKeyId];
      goto LABEL_7;
    }
    v15 = MSErrorCMSDomain[0];
    id v14 = @"CMSIdentifier has inconsistent type and stored values: expected subjectKeyId";
LABEL_11:
    v16 = +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", v15, -50, 0, v14, v22);
    goto LABEL_14;
  }
  if (v5 != 1)
  {
    id v12 = MSErrorCMSDomain[0];
    uint64_t v13 = [(MSCMSIdentifier *)self type];
    id v14 = @"CMSIdentifer has unknown type: %d";
    uint64_t v22 = v13;
    v15 = v12;
    goto LABEL_11;
  }
  if (![(MSCMSIdentifier *)self issuerAndSerialNumber])
  {
    v15 = MSErrorCMSDomain[0];
    id v14 = @"CMSIdentifier has inconsistent type and stored values: expected issuerAndSerialNumber";
    goto LABEL_11;
  }
  *(void *)&long long v25 = (void)[(MSCMSIdentifier *)self issuerAndSerialNumber][8];
  *((void *)&v24 + 1) = *(void *)[(MSCMSIdentifier *)self issuerAndSerialNumber];
  *(void *)&long long v26 = (void)[(MSCMSIdentifier *)self issuerAndSerialNumber][24];
  *((void *)&v25 + 1) = (void)[(MSCMSIdentifier *)self issuerAndSerialNumber][16];
  DWORD2(v26) = [(MSCMSIdentifier *)self issuerAndSerialNumber][32];
LABEL_7:
  uint64_t v23 = 0;
  uint64_t v6 = length_CMSIdentifier((uint64_t)&v24);
  int v7 = [MEMORY[0x263EFF990] dataWithLength:v6];
  if (v7)
  {
    id v8 = v7;
    int v9 = encode_CMSIdentifier([v8 mutableBytes] + v6 - 1, v6, (uint64_t)&v24, (uint64_t)&v23);
    if (!v9)
    {
      if (v6 != v23)
      {
        v20 = (MSCMSIdentifier *)asn1_abort();
        return [(MSCMSIdentifier *)v20 subjectKeyId];
      }
      v16 = 0;
      if (a3) {
        goto LABEL_15;
      }
      goto LABEL_17;
    }
    int v10 = v9;

    uint64_t v11 = v10;
  }
  else
  {
    uint64_t v11 = 12;
  }
  objc_super v17 = (void *)MEMORY[0x263F087E8];
  uint64_t v27 = *MEMORY[0x263F08320];
  v28[0] = @"Failed encoding type CMSIdentifier";
  v18 = [NSDictionary dictionaryWithObjects:v28 forKeys:&v27 count:1];
  v16 = [v17 errorWithDomain:@"com.apple.HeimASN1" code:v11 userInfo:v18];

LABEL_14:
  id v8 = 0;
  if (a3)
  {
LABEL_15:
    if (v16) {
      *a3 = v16;
    }
  }
LABEL_17:

  return v8;
}

- (heim_base_data)subjectKeyId
{
  return self->_subjectKeyId;
}

- (void)setSubjectKeyId:(heim_base_data *)a3
{
  self->_subjectKeyId = a3;
}

- (NSData)skidData
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSkidData:(id)a3
{
}

@end