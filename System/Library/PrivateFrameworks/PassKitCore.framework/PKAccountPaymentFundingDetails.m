@interface PKAccountPaymentFundingDetails
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (PKAccountPaymentFundingDetails)initWithDictionary:(id)a3;
- (id)_encryptedDataWithCertificatesResponse:(id)a3 publicKeyHash:(id *)a4;
- (id)fundingDetailsUnencryptedDictionary;
- (id)hashComponentWithCertificatesResponse:(id)a3;
- (id)jsonDictionaryRepresentation;
- (id)jsonDictionaryRepresentationWithCertificatesResponse:(id)a3;
- (id)jsonString;
@end

@implementation PKAccountPaymentFundingDetails

- (PKAccountPaymentFundingDetails)initWithDictionary:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKAccountPaymentFundingDetails;
  return [(PKAccountPaymentFundingDetails *)&v4 init];
}

- (id)jsonString
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F28D90];
  v3 = [(PKAccountPaymentFundingDetails *)self jsonDictionaryRepresentation];
  id v9 = 0;
  objc_super v4 = [v2 dataWithJSONObject:v3 options:2 error:&v9];
  id v5 = v9;

  if (v5)
  {
    v6 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v5;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Error forming json dictionary for CloudKit with error: %@", buf, 0xCu);
    }

    v7 = 0;
  }
  else
  {
    v7 = (void *)[[NSString alloc] initWithData:v4 encoding:4];
  }

  return v7;
}

- (id)jsonDictionaryRepresentation
{
  return [(PKAccountPaymentFundingDetails *)self jsonDictionaryRepresentationWithCertificatesResponse:0];
}

- (id)jsonDictionaryRepresentationWithCertificatesResponse:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_encryptedData) {
    goto LABEL_3;
  }
  id v14 = 0;
  v6 = [(PKAccountPaymentFundingDetails *)self _encryptedDataWithCertificatesResponse:v4 publicKeyHash:&v14];
  v7 = (NSData *)v14;
  encryptedData = self->_encryptedData;
  self->_encryptedData = v6;

  publicKeyHash = self->_publicKeyHash;
  self->_publicKeyHash = v7;

  if (self->_encryptedData)
  {
LABEL_3:
    v10 = (void *)[[NSString alloc] initWithData:self->_encryptedData encoding:4];
    [v5 setObject:v10 forKeyedSubscript:@"data"];
    id v11 = [(NSData *)self->_publicKeyHash hexEncoding];
    [v5 setObject:v11 forKeyedSubscript:@"publicKeyHash"];

    [v5 setObject:@"EV_ECC_v1-ASN.1" forKeyedSubscript:@"encryptionVersion"];
  }
  uint64_t v12 = (void *)[v5 copy];

  return v12;
}

- (id)fundingDetailsUnencryptedDictionary
{
  return 0;
}

- (id)hashComponentWithCertificatesResponse:(id)a3
{
  id v4 = a3;
  encryptedData = self->_encryptedData;
  if (encryptedData) {
    goto LABEL_3;
  }
  id v13 = 0;
  v6 = [(PKAccountPaymentFundingDetails *)self _encryptedDataWithCertificatesResponse:v4 publicKeyHash:&v13];
  v7 = (NSData *)v13;
  v8 = self->_encryptedData;
  self->_encryptedData = v6;

  publicKeyHash = self->_publicKeyHash;
  self->_publicKeyHash = v7;

  encryptedData = self->_encryptedData;
  if (encryptedData)
  {
LABEL_3:
    v10 = [(NSData *)encryptedData SHA256Hash];
    id v11 = [v10 base64EncodedStringWithOptions:0];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_encryptedDataWithCertificatesResponse:(id)a3 publicKeyHash:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(PKAccountPaymentFundingDetails *)self fundingDetailsUnencryptedDictionary];
  v8 = (void *)v7;
  id v9 = 0;
  if (!v6 || !v7) {
    goto LABEL_14;
  }
  v10 = [v6 encryptionVersion];
  if (([v10 isEqualToString:@"EV_ECC_v1-ASN.1"] & 1) == 0)
  {

    goto LABEL_13;
  }
  uint64_t v11 = [v8 count];

  if (!v11)
  {
LABEL_13:
    id v9 = 0;
    goto LABEL_14;
  }
  uint64_t v12 = +[PKPaymentWebService sharedService];
  id v13 = [v12 context];
  int v14 = [v13 devSigned];

  if (v14)
  {
    v15 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      v22 = v8;
      _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "Encrypting data for schedulePayment request: %{private}@", buf, 0xCu);
    }
  }
  id v20 = 0;
  v16 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v8 options:1 error:&v20];
  id v17 = v20;
  if (!v16) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"Could not create data for %@: %@", objc_opt_class(), v17 format];
  }
  v18 = [v6 encryptionCertificates];
  id v9 = PKFeatureEncryptDataWithCertChain(v16, v18, a4, 2);

LABEL_14:
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicKeyHash, 0);
  objc_storeStrong((id *)&self->_encryptedData, 0);
}

@end