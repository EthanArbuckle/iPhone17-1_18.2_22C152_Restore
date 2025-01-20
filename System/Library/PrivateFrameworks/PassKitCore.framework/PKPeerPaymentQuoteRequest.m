@interface PKPeerPaymentQuoteRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)hasUpdatedPaymentMethod;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPeerPaymentQuoteRequest:(id)a3;
- (BOOL)preserveCurrentBalance;
- (BOOL)sendImmediately;
- (NSDate)startDate;
- (NSDecimalNumber)amount;
- (NSDecimalNumber)threshold;
- (NSString)accountNumber;
- (NSString)bankName;
- (NSString)currency;
- (NSString)dpanIdentifier;
- (NSString)fpanIdentifier;
- (NSString)orderIdentifier;
- (NSString)paymentMethodDescription;
- (NSString)paymentMethodSuffix;
- (NSString)recipientIdentifier;
- (NSString)recipientPhoneOrEmail;
- (NSString)recurringPaymentIdentifier;
- (NSString)routingNumber;
- (NSString)senderAddress;
- (PKPeerPaymentQuoteCertificatesResponse)quoteCertificatesResponse;
- (PKPeerPaymentQuoteRequest)init;
- (PKPeerPaymentQuoteRequest)initWithCoder:(id)a3;
- (PKPeerPaymentRequestToken)requestToken;
- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4 deviceIdentifier:(id)a5 deviceScore:(id)a6 odiAssessment:(id)a7 deviceMetadata:(id)a8;
- (id)description;
- (int64_t)paymentNetwork;
- (unint64_t)context;
- (unint64_t)destination;
- (unint64_t)deviceTapFlow;
- (unint64_t)externalFundingSource;
- (unint64_t)frequency;
- (unint64_t)hash;
- (unint64_t)paymentMethodType;
- (unint64_t)paymentMode;
- (unint64_t)source;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountNumber:(id)a3;
- (void)setAmount:(id)a3;
- (void)setBankName:(id)a3;
- (void)setContext:(unint64_t)a3;
- (void)setCurrency:(id)a3;
- (void)setDPANIdentifier:(id)a3;
- (void)setDestination:(unint64_t)a3;
- (void)setDeviceTapFlow:(unint64_t)a3;
- (void)setExternalFundingSource:(unint64_t)a3;
- (void)setFPANIdentifier:(id)a3;
- (void)setFrequency:(unint64_t)a3;
- (void)setHasUpdatedPaymentMethod:(BOOL)a3;
- (void)setPaymentMethodDescription:(id)a3;
- (void)setPaymentMethodSuffix:(id)a3;
- (void)setPaymentMethodType:(unint64_t)a3;
- (void)setPaymentMode:(unint64_t)a3;
- (void)setPaymentNetwork:(int64_t)a3;
- (void)setPreserveCurrentBalance:(BOOL)a3;
- (void)setQuoteCertificatesResponse:(id)a3;
- (void)setRecipientIdentifier:(id)a3;
- (void)setRecipientPhoneOrEmail:(id)a3;
- (void)setRecurringPaymentIdentifier:(id)a3;
- (void)setRequestToken:(id)a3;
- (void)setRoutingNumber:(id)a3;
- (void)setSendImmediately:(BOOL)a3;
- (void)setSenderAddress:(id)a3;
- (void)setSource:(unint64_t)a3;
- (void)setStartDate:(id)a3;
- (void)setThreshold:(id)a3;
- (void)updateWithPaymentPass:(id)a3;
- (void)updateWithPaymentPass:(id)a3 externalFundingSource:(unint64_t)a4;
@end

@implementation PKPeerPaymentQuoteRequest

- (void)updateWithPaymentPass:(id)a3
{
}

- (void)updateWithPaymentPass:(id)a3 externalFundingSource:(unint64_t)a4
{
  id v14 = a3;
  if (v14)
  {
    v6 = [v14 devicePrimaryInAppPaymentApplication];
    v7 = [v6 dpanIdentifier];
    [(PKPeerPaymentQuoteRequest *)self setDPANIdentifier:v7];

    v8 = [v14 primaryAccountIdentifier];
    [(PKPeerPaymentQuoteRequest *)self setFPANIdentifier:v8];

    if (self->_dpanIdentifier)
    {
      self->_externalFundingSource = a4;
      v9 = [v14 devicePrimaryInAppPaymentApplication];
      self->_paymentNetwork = [v9 paymentNetworkIdentifier];
      self->_paymentMethodType = [v9 paymentType];
      v10 = [v14 localizedDescription];
      paymentMethodDescription = self->_paymentMethodDescription;
      self->_paymentMethodDescription = v10;

      v12 = [v14 primaryAccountNumberSuffix];
      paymentMethodSuffix = self->_paymentMethodSuffix;
      self->_paymentMethodSuffix = v12;
    }
  }
}

- (PKPeerPaymentQuoteRequest)init
{
  v7.receiver = self;
  v7.super_class = (Class)PKPeerPaymentQuoteRequest;
  v2 = [(PKOverlayableWebServiceRequest *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v4 = [v3 UUIDString];
    orderIdentifier = v2->_orderIdentifier;
    v2->_orderIdentifier = (NSString *)v4;
  }
  return v2;
}

- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4 deviceIdentifier:(id)a5 deviceScore:(id)a6 odiAssessment:(id)a7 deviceMetadata:(id)a8
{
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v20 = v19;
  if (!v14)
  {
    v22 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v25 = (objc_class *)objc_opt_class();
      v24 = NSStringFromClass(v25);
      *(_DWORD *)buf = 138543618;
      v117 = v24;
      __int16 v118 = 2082;
      v119 = "url";
      goto LABEL_87;
    }
LABEL_88:
    id v59 = 0;
    goto LABEL_89;
  }
  if (!v15)
  {
    v22 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v26 = (objc_class *)objc_opt_class();
      v24 = NSStringFromClass(v26);
      *(_DWORD *)buf = 138543618;
      v117 = v24;
      __int16 v118 = 2082;
      v119 = "appleAccountInformation";
      goto LABEL_87;
    }
    goto LABEL_88;
  }
  if (!v16)
  {
    v22 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v27 = (objc_class *)objc_opt_class();
      v24 = NSStringFromClass(v27);
      *(_DWORD *)buf = 138543618;
      v117 = v24;
      __int16 v118 = 2082;
      v119 = "deviceIdentifier";
      goto LABEL_87;
    }
    goto LABEL_88;
  }
  if (!v19)
  {
    v22 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v28 = (objc_class *)objc_opt_class();
      v24 = NSStringFromClass(v28);
      *(_DWORD *)buf = 138543618;
      v117 = v24;
      __int16 v118 = 2082;
      v119 = "deviceMetadata";
      goto LABEL_87;
    }
    goto LABEL_88;
  }
  if (!self->_amount)
  {
    v22 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v29 = (objc_class *)objc_opt_class();
      v24 = NSStringFromClass(v29);
      *(_DWORD *)buf = 138543618;
      v117 = v24;
      __int16 v118 = 2082;
      v119 = "_amount";
      goto LABEL_87;
    }
    goto LABEL_88;
  }
  if (!self->_currency)
  {
    v22 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v30 = (objc_class *)objc_opt_class();
      v24 = NSStringFromClass(v30);
      *(_DWORD *)buf = 138543618;
      v117 = v24;
      __int16 v118 = 2082;
      v119 = "_currency";
      goto LABEL_87;
    }
    goto LABEL_88;
  }
  if (self->_externalFundingSource == 1 && !self->_dpanIdentifier)
  {
    v22 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v42 = (objc_class *)objc_opt_class();
      v24 = NSStringFromClass(v42);
      *(_DWORD *)buf = 138543618;
      v117 = v24;
      __int16 v118 = 2082;
      v119 = "_dpanIdentifier";
      goto LABEL_87;
    }
    goto LABEL_88;
  }
  unint64_t destination = self->_destination;
  if (destination == 2)
  {
    if (!self->_bankName)
    {
      v22 = PKLogFacilityTypeGetObject(0xBuLL);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v46 = (objc_class *)objc_opt_class();
        v24 = NSStringFromClass(v46);
        *(_DWORD *)buf = 138543618;
        v117 = v24;
        __int16 v118 = 2082;
        v119 = "_bankName";
        goto LABEL_87;
      }
      goto LABEL_88;
    }
    if (!self->_routingNumber)
    {
      v22 = PKLogFacilityTypeGetObject(0xBuLL);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v47 = (objc_class *)objc_opt_class();
        v24 = NSStringFromClass(v47);
        *(_DWORD *)buf = 138543618;
        v117 = v24;
        __int16 v118 = 2082;
        v119 = "_routingNumber";
        goto LABEL_87;
      }
      goto LABEL_88;
    }
    if (!self->_accountNumber)
    {
      v22 = PKLogFacilityTypeGetObject(0xBuLL);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v58 = (objc_class *)objc_opt_class();
        v24 = NSStringFromClass(v58);
        *(_DWORD *)buf = 138543618;
        v117 = v24;
        __int16 v118 = 2082;
        v119 = "_accountNumber";
        goto LABEL_87;
      }
      goto LABEL_88;
    }
  }
  else if (destination == 1)
  {
    if (!self->_recipientIdentifier)
    {
      v22 = PKLogFacilityTypeGetObject(0xBuLL);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v45 = (objc_class *)objc_opt_class();
        v24 = NSStringFromClass(v45);
        *(_DWORD *)buf = 138543618;
        v117 = v24;
        __int16 v118 = 2082;
        v119 = "_recipientIdentifier";
        goto LABEL_87;
      }
      goto LABEL_88;
    }
    if (!self->_senderAddress)
    {
      v22 = PKLogFacilityTypeGetObject(0xBuLL);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = (objc_class *)objc_opt_class();
        v24 = NSStringFromClass(v23);
        *(_DWORD *)buf = 138543618;
        v117 = v24;
        __int16 v118 = 2082;
        v119 = "_senderAddress";
LABEL_87:
        _os_log_impl(&dword_190E10000, v22, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

        goto LABEL_88;
      }
      goto LABEL_88;
    }
  }
  id v110 = v18;
  v22 = [(PKPeerPaymentWebServiceRequest *)self _murlRequestWithServiceURL:v14 endpointComponents:&unk_1EE22B558 queryParameters:0 appleAccountInformation:v15];
  [v22 setHTTPMethod:@"POST"];
  [v22 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  v31 = [MEMORY[0x1E4F1CA60] dictionary];
  id v108 = v17;
  if (v17)
  {
    v32 = [v17 hexEncoding];
    [v31 setObject:v32 forKey:@"deviceScore"];
  }
  if (v110) {
    [v31 setObject:v110 forKey:@"odiAssessment"];
  }
  v33 = [v20 dictionaryRepresentation];
  [v31 setObject:v33 forKey:@"deviceMetadata"];

  [v31 setObject:v16 forKey:@"deviceIdentifier"];
  [v31 setObject:self->_orderIdentifier forKey:@"orderIdentifier"];
  amount = self->_amount;
  if (amount)
  {
    v35 = [(NSDecimalNumber *)amount stringValue];
    [v31 setObject:v35 forKey:@"amount"];
  }
  currency = self->_currency;
  if (currency) {
    [v31 setObject:currency forKey:@"currency"];
  }
  if (self->_externalFundingSource == 1) {
    v37 = @"dpan";
  }
  else {
    v37 = @"none";
  }
  v38 = v37;
  [v31 setObject:v38 forKey:@"externalFundingSource"];

  unint64_t v39 = self->_source - 1;
  if (v39 > 2) {
    v40 = @"unknown";
  }
  else {
    v40 = off_1E56F56C8[v39];
  }
  [v31 setObject:v40 forKey:@"source"];
  if (!self->_preserveCurrentBalance) {
    goto LABEL_62;
  }
  if (self->_externalFundingSource == 1)
  {
    if (self->_dpanIdentifier)
    {
      uint64_t v41 = 1;
      goto LABEL_63;
    }
    v43 = PKLogFacilityTypeGetObject(0xBuLL);
    if (!os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_61;
    }
    *(_WORD *)buf = 0;
    v44 = "Ignoring request for preserveCurrentBalance because dpanIdentifier is missing";
    goto LABEL_60;
  }
  v43 = PKLogFacilityTypeGetObject(0xBuLL);
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v44 = "Ignoring request for preserveCurrentBalance because the externalFundingSourceType is not DPAN";
LABEL_60:
    _os_log_impl(&dword_190E10000, v43, OS_LOG_TYPE_DEFAULT, v44, buf, 2u);
  }
LABEL_61:

LABEL_62:
  uint64_t v41 = 0;
LABEL_63:
  v48 = [NSNumber numberWithBool:v41];
  [v31 setObject:v48 forKey:@"preserveCurrentBalance"];

  v49 = @"recipient";
  switch(self->_destination)
  {
    case 0uLL:
      goto LABEL_70;
    case 1uLL:
      goto LABEL_69;
    case 2uLL:
      v49 = @"bankAccount";
      goto LABEL_69;
    case 3uLL:
      v49 = @"self";
      goto LABEL_69;
    case 4uLL:
      v49 = @"instantWithdrawal";
      goto LABEL_69;
    case 5uLL:
      v49 = @"undeterminedRecipient";
      goto LABEL_69;
    default:
      v49 = @"unknown";
LABEL_69:
      [v31 setObject:v49 forKey:@"destination"];
LABEL_70:
      unint64_t v50 = self->_source - 1;
      if (v50 > 2) {
        v51 = @"unknown";
      }
      else {
        v51 = off_1E56F56C8[v50];
      }
      [v31 setObject:v51 forKey:@"source"];
      requestToken = self->_requestToken;
      if (requestToken && ![(PKPeerPaymentRequestToken *)requestToken isInformalRequestToken])
      {
        v53 = [(PKPeerPaymentRequestToken *)self->_requestToken requestToken];
        [v31 setObject:v53 forKey:@"requestToken"];
      }
      v54 = @"user";
      switch(self->_context)
      {
        case 0uLL:
          v55 = self->_requestToken;
          if (v55)
          {
            BOOL v56 = [(PKPeerPaymentRequestToken *)v55 isInformalRequestToken];
            v57 = @"formalRequest";
            if (v56) {
              v57 = @"informalRequest";
            }
          }
          else
          {
            v57 = @"user";
          }
          v61 = v57;
          [v31 setObject:v61 forKey:@"context"];

          goto LABEL_94;
        case 1uLL:
          goto LABEL_84;
        case 2uLL:
          v54 = @"formalRequest";
          goto LABEL_84;
        case 3uLL:
          v54 = @"informalRequest";
          goto LABEL_84;
        default:
          v54 = @"unknown";
LABEL_84:
          [v31 setObject:v54 forKey:@"context"];
LABEL_94:
          if (self->_externalFundingSource == 1 || self->_destination == 4)
          {
            dpanIdentifier = self->_dpanIdentifier;
            if (dpanIdentifier) {
              [v31 setObject:dpanIdentifier forKey:@"dpanIdentifier"];
            }
            fpanIdentifier = self->_fpanIdentifier;
            if (fpanIdentifier) {
              [v31 setObject:fpanIdentifier forKey:@"fpanIdentifier"];
            }
            int64_t paymentNetwork = self->_paymentNetwork;
            if (paymentNetwork)
            {
              v65 = PKPaymentNetworkNameForPaymentCredentialType(paymentNetwork);
              [v31 setObject:v65 forKey:@"paymentNetwork"];
            }
            unint64_t paymentMethodType = self->_paymentMethodType;
            if (paymentMethodType)
            {
              v67 = PKPaymentMethodTypeToString(paymentMethodType);
              [v31 setObject:v67 forKey:@"paymentMethodType"];
            }
            paymentMethodDescription = self->_paymentMethodDescription;
            if (paymentMethodDescription) {
              [v31 setObject:paymentMethodDescription forKey:@"paymentMethodDescription"];
            }
            paymentMethodSuffix = self->_paymentMethodSuffix;
            if (paymentMethodSuffix) {
              [v31 setObject:paymentMethodSuffix forKey:@"paymentMethodSuffix"];
            }
          }
          break;
      }
      break;
  }
  v70 = [NSNumber numberWithBool:self->_hasUpdatedPaymentMethod];
  [v31 setObject:v70 forKey:@"hasUpdatedPaymentMethod"];

  switch(self->_destination)
  {
    case 1uLL:
      recipientIdentifier = self->_recipientIdentifier;
      if (recipientIdentifier) {
        [v31 setObject:recipientIdentifier forKey:@"recipientIdentifier"];
      }
      senderAddress = self->_senderAddress;
      if (senderAddress)
      {
        v73 = PKIDSNormalizedAddress(senderAddress);
        if (v73) {
          [v31 setObject:v73 forKey:@"senderAddress"];
        }
      }
      recurringPaymentIdentifier = self->_recurringPaymentIdentifier;
      if (recurringPaymentIdentifier) {
        [v31 setObject:recurringPaymentIdentifier forKey:@"recurringPaymentIdentifier"];
      }
      unint64_t frequency = self->_frequency;
      if (frequency)
      {
        v76 = PKPeerPaymentRecurringPaymentFrequencyToString(frequency);
        [v31 setObject:v76 forKey:@"frequency"];
      }
      startDate = self->_startDate;
      if (startDate)
      {
        v78 = [MEMORY[0x1E4F1C9A8] currentCalendar];
        v79 = [v78 timeZone];
        v80 = PKPaymentDateStringFromDateWithTimeZone(startDate, v79);
        [v31 setObject:v80 forKey:@"startDate"];
      }
      if (!self->_recurringPaymentIdentifier)
      {
        v81 = [NSNumber numberWithBool:self->_sendImmediately];
        [v31 setObject:v81 forKey:@"sendImmediately"];
        goto LABEL_147;
      }
      goto LABEL_152;
    case 2uLL:
      quoteCertificatesResponse = self->_quoteCertificatesResponse;
      if (!quoteCertificatesResponse) {
        goto LABEL_145;
      }
      v83 = [(PKPeerPaymentQuoteCertificatesResponse *)quoteCertificatesResponse encryptionVersion];
      int v111 = [v83 isEqualToString:@"EV_ECC_v1-ASN.1"];

      if (v111)
      {
        v84 = [MEMORY[0x1E4F1CA60] dictionary];
        v85 = v84;
        bankName = self->_bankName;
        if (bankName) {
          [v84 setObject:bankName forKey:@"bankName"];
        }
        routingNumber = self->_routingNumber;
        if (routingNumber) {
          [v85 setObject:routingNumber forKey:@"routingNumber"];
        }
        v107 = v31;
        accountNumber = self->_accountNumber;
        if (accountNumber) {
          [v85 setObject:accountNumber forKey:@"accountNumber"];
        }
        v89 = PKLogFacilityTypeGetObject(0xBuLL);
        if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
        {
          v112 = NSString;
          v90 = [v85 allKeys];
          v113 = [v112 stringWithFormat:@"Encrypted Account Number keys: %@", v90];
          *(_DWORD *)buf = 138477827;
          v117 = v113;
          _os_log_impl(&dword_190E10000, v89, OS_LOG_TYPE_DEFAULT, "%{private}@", buf, 0xCu);
        }
        v91 = v89;
        v109 = v85;
        v92 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v85];
        v93 = [(PKPeerPaymentQuoteCertificatesResponse *)self->_quoteCertificatesResponse encryptionCertificates];
        id v115 = 0;
        v94 = v92;
        uint64_t v95 = PKPeerPaymentEncryptDataWithCertChain(v92, v93, &v115);
        id v114 = v115;

        v96 = (void *)v95;
        if (v95)
        {
          uint64_t v97 = [[NSString alloc] initWithData:v95 encoding:4];
          v31 = v107;
          [v107 setObject:v97 forKey:@"encryptedAccountNumbers"];
          [v107 setObject:@"EV_ECC_v1-ASN.1" forKey:@"encryptionVersion"];
          [v114 hexEncoding];
          v99 = v98 = v96;
          [v107 setObject:v99 forKey:@"publicKeyHash"];

          v100 = (void *)v97;
        }
        else
        {
          v100 = v91;
          if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_190E10000, v91, OS_LOG_TYPE_DEFAULT, "Error: Failed to generate encrypted account numbers structure. This is bad!", buf, 2u);
          }
          v98 = 0;
          v31 = v107;
        }
      }
      else
      {
        v103 = self->_quoteCertificatesResponse;
        if (v103)
        {
          v104 = PKLogFacilityTypeGetObject(0xBuLL);
          if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
          {
            v105 = [(PKPeerPaymentQuoteCertificatesResponse *)v103 encryptionVersion];
            *(_DWORD *)buf = 138543362;
            v117 = v105;
            _os_log_impl(&dword_190E10000, v104, OS_LOG_TYPE_DEFAULT, "Error: Failed to generate encrypted account numbers structure. Unknown encryption version: %{public}@", buf, 0xCu);
          }
        }
        else
        {
LABEL_145:
          v81 = PKLogFacilityTypeGetObject(0xBuLL);
          if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_190E10000, v81, OS_LOG_TYPE_DEFAULT, "Error: Failed to generate encrypted account numbers structure. Missing quoteCertificatesResponse.", buf, 2u);
          }
LABEL_147:
        }
      }
LABEL_152:
      v106 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v31];
      [v22 setHTTPBody:v106];

      id v59 = [v22 copy];
      id v17 = v108;
      id v18 = v110;
LABEL_89:

      return v59;
    case 3uLL:
      threshold = self->_threshold;
      if (threshold) {
        [v31 setObject:threshold forKey:@"threshold"];
      }
      if (self->_recurringPaymentIdentifier) {
        goto LABEL_140;
      }
      goto LABEL_152;
    case 5uLL:
      v102 = PKPeerPaymentPaymentModeToString(self->_paymentMode);
      [v31 setObject:v102 forKey:@"paymentMode"];

      if (self->_deviceTapFlow) {
LABEL_140:
      }
        objc_msgSend(v31, "setObject:forKey:");
      goto LABEL_152;
    default:
      goto LABEL_152;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentQuoteRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)PKPeerPaymentQuoteRequest;
  v5 = [(PKOverlayableWebServiceRequest *)&v46 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"orderIdentifier"];
    orderIdentifier = v5->_orderIdentifier;
    v5->_orderIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"amount"];
    amount = v5->_amount;
    v5->_amount = (NSDecimalNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currency"];
    currency = v5->_currency;
    v5->_currency = (NSString *)v10;

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"externalFundingSource"];
    v5->_externalFundingSource = [v12 unsignedIntegerValue];

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"destination"];
    v5->_unint64_t destination = [v13 unsignedIntegerValue];

    id v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"context"];
    v5->_context = [v14 unsignedIntegerValue];

    id v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"source"];
    v5->_source = [v15 unsignedIntegerValue];

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestToken"];
    requestToken = v5->_requestToken;
    v5->_requestToken = (PKPeerPaymentRequestToken *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dpanIdentifier"];
    dpanIdentifier = v5->_dpanIdentifier;
    v5->_dpanIdentifier = (NSString *)v18;

    v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentNetwork"];
    v5->_int64_t paymentNetwork = [v20 integerValue];

    v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentMethodType"];
    v5->_unint64_t paymentMethodType = [v21 unsignedIntegerValue];

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentMethodDescription"];
    paymentMethodDescription = v5->_paymentMethodDescription;
    v5->_paymentMethodDescription = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentMethodSuffix"];
    paymentMethodSuffix = v5->_paymentMethodSuffix;
    v5->_paymentMethodSuffix = (NSString *)v24;

    v5->_hasUpdatedPaymentMethod = [v4 decodeBoolForKey:@"hasUpdatedPaymentMethod"];
    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recipientIdentifier"];
    recipientIdentifier = v5->_recipientIdentifier;
    v5->_recipientIdentifier = (NSString *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"senderAddress"];
    senderAddress = v5->_senderAddress;
    v5->_senderAddress = (NSString *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recipientPhoneOrEmail"];
    recipientPhoneOrEmail = v5->_recipientPhoneOrEmail;
    v5->_recipientPhoneOrEmail = (NSString *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"routingNumber"];
    routingNumber = v5->_routingNumber;
    v5->_routingNumber = (NSString *)v32;

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountNumber"];
    accountNumber = v5->_accountNumber;
    v5->_accountNumber = (NSString *)v34;

    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"quoteCertificatesResponse"];
    quoteCertificatesResponse = v5->_quoteCertificatesResponse;
    v5->_quoteCertificatesResponse = (PKPeerPaymentQuoteCertificatesResponse *)v36;

    v5->_preserveCurrentBalance = [v4 decodeBoolForKey:@"preserveCurrentBalance"];
    uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recurringPaymentIdentifier"];
    recurringPaymentIdentifier = v5->_recurringPaymentIdentifier;
    v5->_recurringPaymentIdentifier = (NSString *)v38;

    v5->_unint64_t frequency = [v4 decodeIntegerForKey:@"frequency"];
    uint64_t v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v40;

    uint64_t v42 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"threshold"];
    threshold = v5->_threshold;
    v5->_threshold = (NSDecimalNumber *)v42;

    v5->_sendImmediately = [v4 decodeBoolForKey:@"sendImmediately"];
    v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentMode"];
    v5->_paymentMode = [v44 unsignedIntegerValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  orderIdentifier = self->_orderIdentifier;
  id v5 = a3;
  [v5 encodeObject:orderIdentifier forKey:@"orderIdentifier"];
  [v5 encodeObject:self->_amount forKey:@"amount"];
  [v5 encodeObject:self->_currency forKey:@"currency"];
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:self->_externalFundingSource];
  [v5 encodeObject:v6 forKey:@"externalFundingSource"];

  objc_super v7 = [NSNumber numberWithUnsignedInteger:self->_destination];
  [v5 encodeObject:v7 forKey:@"destination"];

  uint64_t v8 = [NSNumber numberWithUnsignedInteger:self->_context];
  [v5 encodeObject:v8 forKey:@"context"];

  v9 = [NSNumber numberWithUnsignedInteger:self->_source];
  [v5 encodeObject:v9 forKey:@"source"];

  [v5 encodeObject:self->_requestToken forKey:@"requestToken"];
  [v5 encodeObject:self->_dpanIdentifier forKey:@"dpanIdentifier"];
  uint64_t v10 = [NSNumber numberWithInteger:self->_paymentNetwork];
  [v5 encodeObject:v10 forKey:@"paymentNetwork"];

  v11 = [NSNumber numberWithUnsignedInteger:self->_paymentMethodType];
  [v5 encodeObject:v11 forKey:@"paymentMethodType"];

  [v5 encodeObject:self->_paymentMethodDescription forKey:@"paymentMethodDescription"];
  [v5 encodeObject:self->_paymentMethodSuffix forKey:@"paymentMethodSuffix"];
  [v5 encodeBool:self->_hasUpdatedPaymentMethod forKey:@"hasUpdatedPaymentMethod"];
  [v5 encodeObject:self->_recipientIdentifier forKey:@"recipientIdentifier"];
  [v5 encodeObject:self->_senderAddress forKey:@"senderAddress"];
  [v5 encodeObject:self->_recipientPhoneOrEmail forKey:@"recipientPhoneOrEmail"];
  [v5 encodeObject:self->_routingNumber forKey:@"routingNumber"];
  [v5 encodeObject:self->_accountNumber forKey:@"accountNumber"];
  [v5 encodeObject:self->_quoteCertificatesResponse forKey:@"quoteCertificatesResponse"];
  [v5 encodeBool:self->_preserveCurrentBalance forKey:@"preserveCurrentBalance"];
  [v5 encodeObject:self->_recurringPaymentIdentifier forKey:@"recurringPaymentIdentifier"];
  [v5 encodeInteger:self->_frequency forKey:@"frequency"];
  [v5 encodeObject:self->_startDate forKey:@"startDate"];
  [v5 encodeObject:self->_threshold forKey:@"threshold"];
  [v5 encodeBool:self->_sendImmediately forKey:@"sendImmediately"];
  id v12 = [NSNumber numberWithUnsignedInteger:self->_paymentMode];
  [v5 encodeObject:v12 forKey:@"paymentMode"];
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p; ", v5, self];

  [v6 appendFormat:@"orderIdentifier: '%@'; ", self->_orderIdentifier];
  [v6 appendFormat:@"amount: '%@'; ", self->_amount];
  [v6 appendFormat:@"currency: '%@'; ", self->_currency];
  objc_super v7 = [NSNumber numberWithUnsignedInteger:self->_externalFundingSource];
  [v6 appendFormat:@"externalFundingSource: '%@'; ", v7];

  uint64_t v8 = [NSNumber numberWithUnsignedInteger:self->_destination];
  [v6 appendFormat:@"destination: '%@'; ", v8];

  v9 = [NSNumber numberWithUnsignedInteger:self->_context];
  [v6 appendFormat:@"context: '%@'; ", v9];

  uint64_t v10 = [NSNumber numberWithUnsignedInteger:self->_source];
  [v6 appendFormat:@"source: '%@'; ", v10];

  [v6 appendFormat:@"requestToken: '%@'; ", self->_requestToken];
  [v6 appendFormat:@"dpanIdentifier: '%@'; ", self->_dpanIdentifier];
  v11 = [NSNumber numberWithInteger:self->_paymentNetwork];
  [v6 appendFormat:@"paymentNetwork: '%@'; ", v11];

  id v12 = [NSNumber numberWithUnsignedInteger:self->_paymentMethodType];
  [v6 appendFormat:@"paymentMethodType: '%@'; ", v12];

  [v6 appendFormat:@"paymentMethodDescription: '%@'; ", self->_paymentMethodDescription];
  [v6 appendFormat:@"paymentMethodSuffix: '%@'; ", self->_paymentMethodSuffix];
  v13 = [NSNumber numberWithBool:self->_hasUpdatedPaymentMethod];
  [v6 appendFormat:@"hasUpdatedPaymentMethod: '%@'; ", v13];

  [v6 appendFormat:@"recipientIdentifier: '%@'; ", self->_recipientIdentifier];
  [v6 appendFormat:@"senderAddress: '%@'; ", self->_senderAddress];
  [v6 appendFormat:@"recipientPhoneOrEmail: '%@'; ", self->_recipientPhoneOrEmail];
  [v6 appendFormat:@"routingNumber: '%@'; ", self->_routingNumber];
  [v6 appendFormat:@"accountNumber: '%@'; ", self->_accountNumber];
  [v6 appendFormat:@"quoteCertificatesResponse: '%@'; ", self->_quoteCertificatesResponse];
  id v14 = [NSNumber numberWithBool:self->_preserveCurrentBalance];
  [v6 appendFormat:@"preserveCurrentBalance: '%@'; ", v14];

  [v6 appendFormat:@"recurringPaymentIdentifier: '%@'; ", self->_recurringPaymentIdentifier];
  id v15 = PKPeerPaymentRecurringPaymentFrequencyToString(self->_frequency);
  [v6 appendFormat:@"frequency: '%@'; ", v15];

  [v6 appendFormat:@"startDate: '%@'; ", self->_startDate];
  [v6 appendFormat:@"threshold: '%@'; ", self->_threshold];
  uint64_t v16 = [NSNumber numberWithBool:self->_sendImmediately];
  [v6 appendFormat:@"sendImmediately: '%@'; ", v16];

  id v17 = PKPeerPaymentPaymentModeToString(self->_paymentMode);
  [v6 appendFormat:@"paymentMode: %@", v17];

  [v6 appendFormat:@">"];
  uint64_t v18 = [NSString stringWithString:v6];

  return v18;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = v3;
  if (self->_orderIdentifier) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_amount) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_currency) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_requestToken) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_dpanIdentifier) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_paymentMethodDescription) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_paymentMethodSuffix) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_recipientIdentifier) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_senderAddress) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_recipientPhoneOrEmail) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_routingNumber) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_accountNumber) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_quoteCertificatesResponse) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_recurringPaymentIdentifier) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_startDate) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_threshold) {
    objc_msgSend(v4, "addObject:");
  }
  uint64_t v5 = PKCombinedHash(17, v4);
  unint64_t v6 = self->_externalFundingSource - v5 + 32 * v5;
  unint64_t v7 = self->_destination - v6 + 32 * v6;
  unint64_t v8 = self->_context - v7 + 32 * v7;
  unint64_t v9 = self->_source - v8 + 32 * v8;
  int64_t v10 = self->_paymentNetwork - v9 + 32 * v9;
  unint64_t v11 = self->_paymentMethodType - v10 + 32 * v10;
  uint64_t v12 = self->_hasUpdatedPaymentMethod - v11 + 32 * v11;
  uint64_t v13 = self->_preserveCurrentBalance - v12 + 32 * v12;
  unint64_t v14 = self->_frequency - v13 + 32 * v13;
  uint64_t v15 = self->_sendImmediately - v14 + 32 * v14;
  unint64_t v16 = self->_paymentMode - v15 + 32 * v15;

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPeerPaymentQuoteRequest *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKPeerPaymentQuoteRequest *)self isEqualToPeerPaymentQuoteRequest:v5];

  return v6;
}

- (BOOL)isEqualToPeerPaymentQuoteRequest:(id)a3
{
  id v4 = a3;
  orderIdentifier = self->_orderIdentifier;
  BOOL v6 = (NSString *)v4[12];
  if (orderIdentifier) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (orderIdentifier != v6) {
      goto LABEL_101;
    }
  }
  else if ((-[NSString isEqual:](orderIdentifier, "isEqual:") & 1) == 0)
  {
    goto LABEL_101;
  }
  amount = self->_amount;
  unint64_t v9 = (NSDecimalNumber *)v4[13];
  if (amount) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    if (amount != v9) {
      goto LABEL_101;
    }
  }
  else if ((-[NSDecimalNumber isEqual:](amount, "isEqual:") & 1) == 0)
  {
    goto LABEL_101;
  }
  currency = self->_currency;
  uint64_t v12 = (NSString *)v4[14];
  if (currency) {
    BOOL v13 = v12 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    if (currency != v12) {
      goto LABEL_101;
    }
  }
  else if ((-[NSString isEqual:](currency, "isEqual:") & 1) == 0)
  {
    goto LABEL_101;
  }
  if (self->_externalFundingSource != v4[15]
    || self->_destination != v4[16]
    || self->_context != v4[17]
    || self->_source != v4[18])
  {
    goto LABEL_101;
  }
  requestToken = self->_requestToken;
  uint64_t v15 = (PKPeerPaymentRequestToken *)v4[19];
  if (requestToken && v15)
  {
    if (!-[PKPeerPaymentRequestToken isEqual:](requestToken, "isEqual:")) {
      goto LABEL_101;
    }
  }
  else if (requestToken != v15)
  {
    goto LABEL_101;
  }
  dpanIdentifier = self->_dpanIdentifier;
  id v17 = (NSString *)v4[20];
  if (dpanIdentifier && v17)
  {
    if ((-[NSString isEqual:](dpanIdentifier, "isEqual:") & 1) == 0) {
      goto LABEL_101;
    }
  }
  else if (dpanIdentifier != v17)
  {
    goto LABEL_101;
  }
  if (self->_paymentNetwork != v4[22] || self->_paymentMethodType != v4[23]) {
    goto LABEL_101;
  }
  paymentMethodDescription = self->_paymentMethodDescription;
  id v19 = (NSString *)v4[24];
  if (paymentMethodDescription && v19)
  {
    if ((-[NSString isEqual:](paymentMethodDescription, "isEqual:") & 1) == 0) {
      goto LABEL_101;
    }
  }
  else if (paymentMethodDescription != v19)
  {
    goto LABEL_101;
  }
  paymentMethodSuffix = self->_paymentMethodSuffix;
  v21 = (NSString *)v4[25];
  if (paymentMethodSuffix && v21)
  {
    if ((-[NSString isEqual:](paymentMethodSuffix, "isEqual:") & 1) == 0) {
      goto LABEL_101;
    }
  }
  else if (paymentMethodSuffix != v21)
  {
    goto LABEL_101;
  }
  if (self->_hasUpdatedPaymentMethod != *((unsigned __int8 *)v4 + 89)) {
    goto LABEL_101;
  }
  recipientIdentifier = self->_recipientIdentifier;
  v23 = (NSString *)v4[26];
  if (recipientIdentifier && v23)
  {
    if ((-[NSString isEqual:](recipientIdentifier, "isEqual:") & 1) == 0) {
      goto LABEL_101;
    }
  }
  else if (recipientIdentifier != v23)
  {
    goto LABEL_101;
  }
  senderAddress = self->_senderAddress;
  v25 = (NSString *)v4[27];
  if (senderAddress && v25)
  {
    if ((-[NSString isEqual:](senderAddress, "isEqual:") & 1) == 0) {
      goto LABEL_101;
    }
  }
  else if (senderAddress != v25)
  {
    goto LABEL_101;
  }
  recipientPhoneOrEmail = self->_recipientPhoneOrEmail;
  v27 = (NSString *)v4[30];
  if (recipientPhoneOrEmail && v27)
  {
    if ((-[NSString isEqual:](recipientPhoneOrEmail, "isEqual:") & 1) == 0) {
      goto LABEL_101;
    }
  }
  else if (recipientPhoneOrEmail != v27)
  {
    goto LABEL_101;
  }
  routingNumber = self->_routingNumber;
  v29 = (NSString *)v4[32];
  if (routingNumber && v29)
  {
    if ((-[NSString isEqual:](routingNumber, "isEqual:") & 1) == 0) {
      goto LABEL_101;
    }
  }
  else if (routingNumber != v29)
  {
    goto LABEL_101;
  }
  accountNumber = self->_accountNumber;
  v31 = (NSString *)v4[33];
  if (accountNumber && v31)
  {
    if ((-[NSString isEqual:](accountNumber, "isEqual:") & 1) == 0) {
      goto LABEL_101;
    }
  }
  else if (accountNumber != v31)
  {
    goto LABEL_101;
  }
  quoteCertificatesResponse = self->_quoteCertificatesResponse;
  v33 = (PKPeerPaymentQuoteCertificatesResponse *)v4[34];
  if (quoteCertificatesResponse && v33)
  {
    if ((-[PKPeerPaymentQuoteCertificatesResponse isEqual:](quoteCertificatesResponse, "isEqual:") & 1) == 0) {
      goto LABEL_101;
    }
  }
  else if (quoteCertificatesResponse != v33)
  {
    goto LABEL_101;
  }
  recurringPaymentIdentifier = self->_recurringPaymentIdentifier;
  v35 = (NSString *)v4[35];
  if (recurringPaymentIdentifier && v35)
  {
    if ((-[NSString isEqual:](recurringPaymentIdentifier, "isEqual:") & 1) == 0) {
      goto LABEL_101;
    }
  }
  else if (recurringPaymentIdentifier != v35)
  {
    goto LABEL_101;
  }
  startDate = self->_startDate;
  v37 = (NSDate *)v4[37];
  if (startDate && v37)
  {
    if ((-[NSDate isEqual:](startDate, "isEqual:") & 1) == 0) {
      goto LABEL_101;
    }
  }
  else if (startDate != v37)
  {
    goto LABEL_101;
  }
  threshold = self->_threshold;
  unint64_t v39 = (NSDecimalNumber *)v4[38];
  if (!threshold || !v39)
  {
    if (threshold == v39) {
      goto LABEL_97;
    }
LABEL_101:
    BOOL v40 = 0;
    goto LABEL_102;
  }
  if ((-[NSDecimalNumber isEqual:](threshold, "isEqual:") & 1) == 0) {
    goto LABEL_101;
  }
LABEL_97:
  if (self->_frequency != v4[36]
    || self->_sendImmediately != *((unsigned __int8 *)v4 + 90)
    || self->_paymentMode != v4[28])
  {
    goto LABEL_101;
  }
  BOOL v40 = self->_preserveCurrentBalance == *((unsigned __int8 *)v4 + 88);
LABEL_102:

  return v40;
}

- (NSString)orderIdentifier
{
  return self->_orderIdentifier;
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (void)setAmount:(id)a3
{
}

- (NSString)currency
{
  return self->_currency;
}

- (void)setCurrency:(id)a3
{
}

- (BOOL)preserveCurrentBalance
{
  return self->_preserveCurrentBalance;
}

- (void)setPreserveCurrentBalance:(BOOL)a3
{
  self->_preserveCurrentBalance = a3;
}

- (unint64_t)externalFundingSource
{
  return self->_externalFundingSource;
}

- (void)setExternalFundingSource:(unint64_t)a3
{
  self->_externalFundingSource = a3;
}

- (unint64_t)destination
{
  return self->_destination;
}

- (void)setDestination:(unint64_t)a3
{
  self->_unint64_t destination = a3;
}

- (unint64_t)context
{
  return self->_context;
}

- (void)setContext:(unint64_t)a3
{
  self->_context = a3;
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (PKPeerPaymentRequestToken)requestToken
{
  return self->_requestToken;
}

- (void)setRequestToken:(id)a3
{
}

- (NSString)dpanIdentifier
{
  return self->_dpanIdentifier;
}

- (void)setDPANIdentifier:(id)a3
{
}

- (NSString)fpanIdentifier
{
  return self->_fpanIdentifier;
}

- (void)setFPANIdentifier:(id)a3
{
}

- (int64_t)paymentNetwork
{
  return self->_paymentNetwork;
}

- (void)setPaymentNetwork:(int64_t)a3
{
  self->_int64_t paymentNetwork = a3;
}

- (unint64_t)paymentMethodType
{
  return self->_paymentMethodType;
}

- (void)setPaymentMethodType:(unint64_t)a3
{
  self->_unint64_t paymentMethodType = a3;
}

- (NSString)paymentMethodDescription
{
  return self->_paymentMethodDescription;
}

- (void)setPaymentMethodDescription:(id)a3
{
}

- (NSString)paymentMethodSuffix
{
  return self->_paymentMethodSuffix;
}

- (void)setPaymentMethodSuffix:(id)a3
{
}

- (BOOL)hasUpdatedPaymentMethod
{
  return self->_hasUpdatedPaymentMethod;
}

- (void)setHasUpdatedPaymentMethod:(BOOL)a3
{
  self->_hasUpdatedPaymentMethod = a3;
}

- (NSString)recipientIdentifier
{
  return self->_recipientIdentifier;
}

- (void)setRecipientIdentifier:(id)a3
{
}

- (NSString)senderAddress
{
  return self->_senderAddress;
}

- (void)setSenderAddress:(id)a3
{
}

- (unint64_t)paymentMode
{
  return self->_paymentMode;
}

- (void)setPaymentMode:(unint64_t)a3
{
  self->_paymentMode = a3;
}

- (unint64_t)deviceTapFlow
{
  return self->_deviceTapFlow;
}

- (void)setDeviceTapFlow:(unint64_t)a3
{
  self->_deviceTapFlow = a3;
}

- (NSString)recipientPhoneOrEmail
{
  return self->_recipientPhoneOrEmail;
}

- (void)setRecipientPhoneOrEmail:(id)a3
{
}

- (NSString)bankName
{
  return self->_bankName;
}

- (void)setBankName:(id)a3
{
}

- (NSString)routingNumber
{
  return self->_routingNumber;
}

- (void)setRoutingNumber:(id)a3
{
}

- (NSString)accountNumber
{
  return self->_accountNumber;
}

- (void)setAccountNumber:(id)a3
{
}

- (PKPeerPaymentQuoteCertificatesResponse)quoteCertificatesResponse
{
  return self->_quoteCertificatesResponse;
}

- (void)setQuoteCertificatesResponse:(id)a3
{
}

- (NSString)recurringPaymentIdentifier
{
  return self->_recurringPaymentIdentifier;
}

- (void)setRecurringPaymentIdentifier:(id)a3
{
}

- (unint64_t)frequency
{
  return self->_frequency;
}

- (void)setFrequency:(unint64_t)a3
{
  self->_unint64_t frequency = a3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDecimalNumber)threshold
{
  return self->_threshold;
}

- (void)setThreshold:(id)a3
{
}

- (BOOL)sendImmediately
{
  return self->_sendImmediately;
}

- (void)setSendImmediately:(BOOL)a3
{
  self->_sendImmediately = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threshold, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_recurringPaymentIdentifier, 0);
  objc_storeStrong((id *)&self->_quoteCertificatesResponse, 0);
  objc_storeStrong((id *)&self->_accountNumber, 0);
  objc_storeStrong((id *)&self->_routingNumber, 0);
  objc_storeStrong((id *)&self->_bankName, 0);
  objc_storeStrong((id *)&self->_recipientPhoneOrEmail, 0);
  objc_storeStrong((id *)&self->_senderAddress, 0);
  objc_storeStrong((id *)&self->_recipientIdentifier, 0);
  objc_storeStrong((id *)&self->_paymentMethodSuffix, 0);
  objc_storeStrong((id *)&self->_paymentMethodDescription, 0);
  objc_storeStrong((id *)&self->_fpanIdentifier, 0);
  objc_storeStrong((id *)&self->_dpanIdentifier, 0);
  objc_storeStrong((id *)&self->_requestToken, 0);
  objc_storeStrong((id *)&self->_currency, 0);
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_orderIdentifier, 0);
}

@end