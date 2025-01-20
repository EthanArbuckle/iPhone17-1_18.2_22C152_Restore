@interface PKPeerPaymentEncryptionCertificatesRequest
- (PKPeerPaymentEncryptionCertificatesRequest)initWithEncryptionCertificateDestination:(unint64_t)a3;
- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4;
@end

@implementation PKPeerPaymentEncryptionCertificatesRequest

- (PKPeerPaymentEncryptionCertificatesRequest)initWithEncryptionCertificateDestination:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPeerPaymentEncryptionCertificatesRequest;
  result = [(PKOverlayableWebServiceRequest *)&v5 init];
  if (result) {
    result->_destination = a3;
  }
  return result;
}

- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6)
  {
    v11 = PKLogFacilityTypeGetObject(0xBuLL);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    *(_DWORD *)buf = 138543618;
    v23 = v16;
    __int16 v24 = 2082;
    v25 = "url";
LABEL_12:
    _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_13;
  }
  if (!v7)
  {
    v11 = PKLogFacilityTypeGetObject(0xBuLL);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    v17 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v17);
    *(_DWORD *)buf = 138543618;
    v23 = v16;
    __int16 v24 = 2082;
    v25 = "appleAccountInformation";
    goto LABEL_12;
  }
  unint64_t destination = self->_destination;
  if (!destination)
  {
    v11 = PKLogFacilityTypeGetObject(0xBuLL);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    v18 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v18);
    *(_DWORD *)buf = 138543618;
    v23 = v16;
    __int16 v24 = 2082;
    v25 = "_destination";
    goto LABEL_12;
  }
  uint64_t v10 = PKPeerPaymentEncryptionCertificateDestinationToString(destination);
  v11 = v10;
  if (v10)
  {
    v20 = @"destination";
    uint64_t v21 = v10;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    v13 = [(PKPeerPaymentWebServiceRequest *)self _murlRequestWithServiceURL:v6 endpointComponents:&unk_1EE22B678 queryParameters:v12 appleAccountInformation:v8];
    [v13 setHTTPMethod:@"GET"];
    [v13 setCachePolicy:1];
    v14 = (void *)[v13 copy];

    goto LABEL_14;
  }
LABEL_13:
  v14 = 0;
LABEL_14:

  return v14;
}

@end