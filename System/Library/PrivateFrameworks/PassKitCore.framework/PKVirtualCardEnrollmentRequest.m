@interface PKVirtualCardEnrollmentRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPeerPaymentPass;
- (PKVirtualCardEnrollmentRequest)initWithCoder:(id)a3;
- (PKVirtualCardEnrollmentRequest)initWithPaymentPass:(id)a3;
- (id)initRefreshRequestWithPaymentPass:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKVirtualCardEnrollmentRequest

- (PKVirtualCardEnrollmentRequest)initWithPaymentPass:(id)a3
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PKVirtualCardEnrollmentRequest;
  v5 = [(PKPaymentRequest *)&v22 init];
  v6 = v5;
  if (v5)
  {
    [(PKPaymentRequest *)v5 setRequestType:12];
    v7 = [v4 devicePrimaryInAppPaymentApplication];
    v8 = PKLocalizedVirtualCardString(&cfstr_VirtualCardSet.isa, 0);
    v9 = [MEMORY[0x1E4F28C28] decimalNumberWithString:@"0"];
    v10 = +[PKPaymentSummaryItem summaryItemWithLabel:v8 amount:v9 type:0];
    v26[0] = v10;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
    [(PKPaymentRequest *)v6 setPaymentSummaryItems:v11];

    [(PKPaymentRequest *)v6 setCurrencyCode:@"USD"];
    [(PKPaymentRequest *)v6 setCountryCode:@"US"];
    v12 = PKPaymentNetworkNameForPaymentCredentialType([v7 paymentNetworkIdentifier]);
    v25 = v12;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
    [(PKPaymentRequest *)v6 setSupportedNetworks:v13];

    v14 = +[PKPaymentWebService sharedService];
    v15 = +[PKWebServiceVirtualCardFeature virtualCardFeatureWithWebService:v14];

    v16 = [v15 merchantId];
    [(PKPaymentRequest *)v6 setMerchantIdentifier:v16];

    [(PKPaymentRequest *)v6 setMerchantCapabilities:1];
    v17 = PKLocalizedVirtualCardString(&cfstr_VirtualCardSet_0.isa, 0);
    [(PKPaymentRequest *)v6 setLocalizedErrorMessage:v17];

    [(PKPaymentRequest *)v6 setConfirmationStyle:1];
    v18 = [v4 serialNumber];
    [(PKPaymentRequest *)v6 setPassSerialNumber:v18];

    v19 = [v4 passTypeIdentifier];
    [(PKPaymentRequest *)v6 setPassTypeIdentifier:v19];

    v23[0] = @"subject";
    v23[1] = @"pageTag";
    v24[0] = @"passManagement";
    v24[1] = @"virtualNumberAuthorization";
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
    [(PKPaymentRequest *)v6 setClientAnalyticsParameters:v20];

    [(PKPaymentRequest *)v6 setUseLocationBasedAuthorization:1];
    v6->_isPeerPaymentPass = [v4 isPeerPaymentPass];
  }
  return v6;
}

- (id)initRefreshRequestWithPaymentPass:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v3 = [(PKVirtualCardEnrollmentRequest *)self initWithPaymentPass:a3];
  id v4 = v3;
  if (v3)
  {
    [(PKPaymentRequest *)v3 setRequestType:14];
    v5 = PKLocalizedVirtualCardString(&cfstr_VirtualCardRef_1.isa, 0);
    v6 = [MEMORY[0x1E4F28C28] decimalNumberWithString:@"0"];
    v7 = +[PKPaymentSummaryItem summaryItemWithLabel:v5 amount:v6 type:0];
    v10[0] = v7;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    [(PKPaymentRequest *)v4 setPaymentSummaryItems:v8];
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKVirtualCardEnrollmentRequest *)a3;
  v5 = v4;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else if (v4 {
         && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
  }
         && (v9.receiver = self,
             v9.super_class = (Class)PKVirtualCardEnrollmentRequest,
             [(PKPaymentRequest *)&v9 isEqual:v5]))
  {
    BOOL isPeerPaymentPass = self->_isPeerPaymentPass;
    BOOL v7 = isPeerPaymentPass == [(PKVirtualCardEnrollmentRequest *)v5 isPeerPaymentPass];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_isPeerPaymentPass - v4 + 32 * v4;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKVirtualCardEnrollmentRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKVirtualCardEnrollmentRequest;
  unint64_t v5 = [(PKPaymentRequest *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_BOOL isPeerPaymentPass = [v4 decodeBoolForKey:@"isPeerPaymentPass"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKVirtualCardEnrollmentRequest;
  id v4 = a3;
  [(PKPaymentRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", self->_isPeerPaymentPass, @"isPeerPaymentPass", v5.receiver, v5.super_class);
}

- (BOOL)isPeerPaymentPass
{
  return self->_isPeerPaymentPass;
}

@end