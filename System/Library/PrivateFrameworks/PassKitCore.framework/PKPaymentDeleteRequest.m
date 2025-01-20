@interface PKPaymentDeleteRequest
- (PKPaymentDeleteRequest)initWithPaymentPass:(id)a3;
- (PKPaymentPass)pass;
- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4;
- (void)setPass:(id)a3;
@end

@implementation PKPaymentDeleteRequest

- (PKPaymentDeleteRequest)initWithPaymentPass:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentDeleteRequest;
  v6 = [(PKOverlayableWebServiceRequest *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_pass, a3);
  }

  return v7;
}

- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(PKPass *)self->_pass passTypeIdentifier];
  if (v8
    && (objc_super v9 = (void *)v8,
        [(PKPass *)self->_pass serialNumber],
        v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        v9,
        v10))
  {
    v19[0] = @"passes";
    v11 = [(PKPass *)self->_pass passTypeIdentifier];
    v19[1] = v11;
    v12 = [(PKPass *)self->_pass serialNumber];
    v19[2] = v12;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:3];
    v14 = [(PKPaymentWebServiceRequest *)self _murlRequestWithServiceURL:v6 endpointComponents:v13 queryParameters:0 appleAccountInformation:v7];

    [v14 setHTTPMethod:@"DELETE"];
    id v15 = [v14 copy];
  }
  else
  {
    v14 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v16 = [(PKPass *)self->_pass passTypeIdentifier];
      v17 = [(PKPass *)self->_pass serialNumber];
      *(_DWORD *)buf = 138412546;
      v21 = v16;
      __int16 v22 = 2112;
      v23 = v17;
      _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "PKPaymentDeleteRequest: endpoint component was nil. exiting early. passTypeIdentifier: %@, serialNumber: %@", buf, 0x16u);
    }
    id v15 = 0;
  }

  return v15;
}

- (PKPaymentPass)pass
{
  return self->_pass;
}

- (void)setPass:(id)a3
{
}

- (void).cxx_destruct
{
}

@end