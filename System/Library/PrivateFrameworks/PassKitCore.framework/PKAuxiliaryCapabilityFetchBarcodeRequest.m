@interface PKAuxiliaryCapabilityFetchBarcodeRequest
- (NSArray)encryptionCertificateChain;
- (NSData)signatureData;
- (NSString)dpanIdentifier;
- (NSString)lastUsedBarcodeIdentifier;
- (PKSecureElementSignatureInfo)signatureInfo;
- (id)_dataToSign;
- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5;
- (int64_t)barcodeCount;
- (int64_t)fetchReason;
- (void)setBarcodeCount:(int64_t)a3;
- (void)setDpanIdentifier:(id)a3;
- (void)setEncryptionCertificateChain:(id)a3;
- (void)setFetchReason:(int64_t)a3;
- (void)setLastUsedBarcodeIdentifier:(id)a3;
- (void)setSignatureData:(id)a3;
- (void)setSignatureInfo:(id)a3;
@end

@implementation PKAuxiliaryCapabilityFetchBarcodeRequest

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5
{
  v25[7] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  v11 = [(PKAuxiliaryCapabilityWebServiceRequest *)self pass];
  v12 = objc_msgSend(v11, "passTypeIdentifier", @"devices", v8, @"passes");
  v25[3] = v12;
  v13 = [v11 serialNumber];
  v25[4] = v13;
  v25[5] = @"barcodes";
  v25[6] = @"fetchBarcodes";
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:7];
  v15 = [(PKAuxiliaryCapabilityWebServiceRequest *)self _murlRequestWithServiceURL:v10 endpointComponents:v14 queryParameters:0 appleAccountInformation:v9];

  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v17 = v16;
  v18 = 0;
  unint64_t fetchReason = self->_fetchReason;
  if (fetchReason <= 3) {
    v18 = off_1E56E0040[fetchReason];
  }
  [v16 setObject:self->_dpanIdentifier forKey:@"dpanIdentifier"];
  v20 = [NSNumber numberWithInteger:self->_barcodeCount];
  [v17 setObject:v20 forKey:@"barcodeCount"];

  lastUsedBarcodeIdentifier = self->_lastUsedBarcodeIdentifier;
  if (lastUsedBarcodeIdentifier) {
    [v17 setObject:lastUsedBarcodeIdentifier forKey:@"lastUsedBarcodeIdentifier"];
  }
  v22 = [(NSArray *)self->_encryptionCertificateChain pk_arrayByApplyingBlock:&__block_literal_global_173_0];
  [v17 setObject:v22 forKey:@"encryptionCertificateChain"];
  [v17 setObject:v18 forKey:@"fetchReason"];
  v23 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v17];
  [v15 setHTTPBody:v23];

  [v15 setHTTPMethod:@"POST"];
  [v15 setValue:v18 forHTTPHeaderField:@"X-Apple-Barcode-Fetch-Reason"];
  PKUpdateURLRequestWithSignatureDataAndInfo(v15, self->_signatureData, self->_signatureInfo);

  return v15;
}

uint64_t __111__PKAuxiliaryCapabilityFetchBarcodeRequest__urlRequestWithServiceURL_deviceIdentifier_appleAccountInformation___block_invoke(uint64_t a1, void *a2)
{
  return [a2 base64EncodedStringWithOptions:0];
}

- (id)_dataToSign
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  v4 = [(NSString *)self->_dpanIdentifier dataUsingEncoding:4];
  [v3 appendData:v4];

  v5 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", self->_barcodeCount);
  v6 = [v5 dataUsingEncoding:4];
  [v3 appendData:v6];

  v7 = [v3 SHA256Hash];

  return v7;
}

- (NSString)dpanIdentifier
{
  return self->_dpanIdentifier;
}

- (void)setDpanIdentifier:(id)a3
{
}

- (int64_t)barcodeCount
{
  return self->_barcodeCount;
}

- (void)setBarcodeCount:(int64_t)a3
{
  self->_barcodeCount = a3;
}

- (NSString)lastUsedBarcodeIdentifier
{
  return self->_lastUsedBarcodeIdentifier;
}

- (void)setLastUsedBarcodeIdentifier:(id)a3
{
}

- (NSArray)encryptionCertificateChain
{
  return self->_encryptionCertificateChain;
}

- (void)setEncryptionCertificateChain:(id)a3
{
}

- (int64_t)fetchReason
{
  return self->_fetchReason;
}

- (void)setFetchReason:(int64_t)a3
{
  self->_unint64_t fetchReason = a3;
}

- (NSData)signatureData
{
  return self->_signatureData;
}

- (void)setSignatureData:(id)a3
{
}

- (PKSecureElementSignatureInfo)signatureInfo
{
  return self->_signatureInfo;
}

- (void)setSignatureInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signatureInfo, 0);
  objc_storeStrong((id *)&self->_signatureData, 0);
  objc_storeStrong((id *)&self->_encryptionCertificateChain, 0);
  objc_storeStrong((id *)&self->_lastUsedBarcodeIdentifier, 0);
  objc_storeStrong((id *)&self->_dpanIdentifier, 0);
}

@end