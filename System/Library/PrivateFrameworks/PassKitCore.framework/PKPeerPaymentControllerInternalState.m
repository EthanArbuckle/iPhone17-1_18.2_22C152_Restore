@interface PKPeerPaymentControllerInternalState
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPeerPaymentControllerInternalState:(id)a3;
- (PKPeerPaymentControllerInternalState)initWithCoder:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKPeerPaymentControllerInternalState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentControllerInternalState)initWithCoder:(id)a3
{
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)PKPeerPaymentControllerInternalState;
  v5 = [(PKPeerPaymentControllerInternalState *)&v41 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"state"];
    v5->state = [v6 unsignedIntegerValue];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mode"];
    v5->mode = [v7 unsignedIntegerValue];

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"senderPhoneOrEmail"];
    senderPhoneOrEmail = v5->senderPhoneOrEmail;
    v5->senderPhoneOrEmail = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recipientPhoneOrEmail"];
    recipientPhoneOrEmail = v5->recipientPhoneOrEmail;
    v5->recipientPhoneOrEmail = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recipient"];
    recipient = v5->recipient;
    v5->recipient = (PKPeerPaymentRecipient *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recipientDisplayName"];
    recipientDisplayName = v5->recipientDisplayName;
    v5->recipientDisplayName = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestToken"];
    requestToken = v5->requestToken;
    v5->requestToken = (PKPeerPaymentRequestToken *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"quote"];
    quote = v5->quote;
    v5->quote = (PKPeerPaymentQuote *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"authorizedQuote"];
    authorizedQuote = v5->authorizedQuote;
    v5->authorizedQuote = (PKAuthorizedPeerPaymentQuote *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"performQuoteResponse"];
    performQuoteResponse = v5->performQuoteResponse;
    v5->performQuoteResponse = (PKPeerPaymentPerformResponse *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"quoteCertificatesResponse"];
    quoteCertificatesResponse = v5->quoteCertificatesResponse;
    v5->quoteCertificatesResponse = (PKPeerPaymentQuoteCertificatesResponse *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountNumber"];
    accountNumber = v5->accountNumber;
    v5->accountNumber = (NSString *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"routingNumber"];
    routingNumber = v5->routingNumber;
    v5->routingNumber = (NSString *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountName"];
    accountName = v5->accountName;
    v5->accountName = (NSString *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"quoteRequest"];
    quoteRequest = v5->quoteRequest;
    v5->quoteRequest = (PKPeerPaymentQuoteRequest *)v32;

    v5->supportsPreserveCurrentBalance = [v4 decodeBoolForKey:@"supportsPreserveCurrentBalance"];
    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recurringPaymentIdentifier"];
    recurringPaymentIdentifier = v5->recurringPaymentIdentifier;
    v5->recurringPaymentIdentifier = (NSString *)v34;

    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
    startDate = v5->startDate;
    v5->startDate = (NSDate *)v36;

    v5->frequency = [v4 decodeIntegerForKey:@"frequency"];
    uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"threshold"];
    threshold = v5->threshold;
    v5->threshold = (NSDecimalNumber *)v38;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  unint64_t state = self->state;
  id v8 = a3;
  v6 = [v4 numberWithUnsignedInteger:state];
  [v8 encodeObject:v6 forKey:@"state"];

  v7 = [NSNumber numberWithUnsignedInteger:self->mode];
  [v8 encodeObject:v7 forKey:@"mode"];

  [v8 encodeObject:self->senderPhoneOrEmail forKey:@"senderPhoneOrEmail"];
  [v8 encodeObject:self->recipientPhoneOrEmail forKey:@"recipientPhoneOrEmail"];
  [v8 encodeObject:self->recipient forKey:@"recipient"];
  [v8 encodeObject:self->recipientDisplayName forKey:@"recipientDisplayName"];
  [v8 encodeObject:self->requestToken forKey:@"requestToken"];
  [v8 encodeObject:self->quote forKey:@"quote"];
  [v8 encodeObject:self->authorizedQuote forKey:@"authorizedQuote"];
  [v8 encodeObject:self->performQuoteResponse forKey:@"performQuoteResponse"];
  [v8 encodeObject:self->quoteCertificatesResponse forKey:@"quoteCertificatesResponse"];
  [v8 encodeObject:self->accountNumber forKey:@"accountNumber"];
  [v8 encodeObject:self->routingNumber forKey:@"routingNumber"];
  [v8 encodeObject:self->accountName forKey:@"accountName"];
  [v8 encodeObject:self->quoteRequest forKey:@"quoteRequest"];
  [v8 encodeBool:self->supportsPreserveCurrentBalance forKey:@"supportsPreserveCurrentBalance"];
  [v8 encodeObject:self->recurringPaymentIdentifier forKey:@"recurringPaymentIdentifier"];
  [v8 encodeObject:self->startDate forKey:@"startDate"];
  [v8 encodeInteger:self->frequency forKey:@"frequency"];
  [v8 encodeObject:self->threshold forKey:@"threshold"];
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p; ", v5, self];

  v7 = [NSNumber numberWithUnsignedInteger:self->state];
  [v6 appendFormat:@"state: '%@'; ", v7];

  id v8 = [NSNumber numberWithUnsignedInteger:self->mode];
  [v6 appendFormat:@"mode: '%@'; ", v8];

  [v6 appendFormat:@"senderPhoneOrEmail: '%@'; ", self->senderPhoneOrEmail];
  [v6 appendFormat:@"recipientPhoneOrEmail: '%@'; ", self->recipientPhoneOrEmail];
  [v6 appendFormat:@"recipient: '%@'; ", self->recipient];
  [v6 appendFormat:@"recipientDisplayName: '%@'; ", self->recipientDisplayName];
  [v6 appendFormat:@"requestToken: '%@'; ", self->requestToken];
  [v6 appendFormat:@"quote: '%@'; ", self->quote];
  [v6 appendFormat:@"authorizedQuote: '%@'; ", self->authorizedQuote];
  [v6 appendFormat:@"performQuoteResponse: '%@'; ", self->performQuoteResponse];
  [v6 appendFormat:@"quoteCertificatesResponse: '%@'; ", self->quoteCertificatesResponse];
  [v6 appendFormat:@"accountNumber: '%@'; ", self->accountNumber];
  [v6 appendFormat:@"routingNumber: '%@'; ", self->routingNumber];
  [v6 appendFormat:@"accountName: '%@'; ", self->accountName];
  [v6 appendFormat:@"quoteRequest: '%@'; ", self->quoteRequest];
  v9 = [NSNumber numberWithBool:self->supportsPreserveCurrentBalance];
  [v6 appendFormat:@"supportsPreserveCurrentBalance: '%@'; ", v9];

  [v6 appendFormat:@"recurringPaymentIdentifier: '%@'; ", self->recurringPaymentIdentifier];
  [v6 appendFormat:@"startDate: '%@'; ", self->startDate];
  uint64_t v10 = [NSNumber numberWithUnsignedInteger:self->frequency];
  [v6 appendFormat:@"frequency: '%@'; ", v10];

  [v6 appendFormat:@"threshold: '%@'; ", self->threshold];
  [v6 appendFormat:@">"];
  v11 = [NSString stringWithString:v6];

  return v11;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = v3;
  if (self->senderPhoneOrEmail) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->recipientPhoneOrEmail) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->recipient) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->recipientDisplayName) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->requestToken) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->quote) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->authorizedQuote) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->performQuoteResponse) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->quoteCertificatesResponse) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->accountNumber) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->routingNumber) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->accountName) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->quoteRequest) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->recurringPaymentIdentifier) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->startDate) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->threshold) {
    objc_msgSend(v4, "addObject:");
  }
  uint64_t v5 = PKCombinedHash(17, v4);
  unint64_t v6 = self->state - v5 + 32 * v5;
  unint64_t v7 = self->mode - v6 + 32 * v6;
  uint64_t v8 = self->supportsPreserveCurrentBalance - v7 + 32 * v7;
  unint64_t v9 = self->frequency - v8 + 32 * v8;

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPeerPaymentControllerInternalState *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKPeerPaymentControllerInternalState *)self isEqualToPeerPaymentControllerInternalState:v5];

  return v6;
}

- (BOOL)isEqualToPeerPaymentControllerInternalState:(id)a3
{
  id v4 = (char *)a3;
  uint64_t v5 = v4;
  if (*(_OWORD *)&self->state != *(_OWORD *)(v4 + 8) || self->supportsPreserveCurrentBalance != v4[88]) {
    goto LABEL_82;
  }
  senderPhoneOrEmail = self->senderPhoneOrEmail;
  unint64_t v7 = (NSString *)v5[3];
  if (senderPhoneOrEmail && v7)
  {
    if ((-[NSString isEqual:](senderPhoneOrEmail, "isEqual:") & 1) == 0) {
      goto LABEL_82;
    }
  }
  else if (senderPhoneOrEmail != v7)
  {
    goto LABEL_82;
  }
  recipientPhoneOrEmail = self->recipientPhoneOrEmail;
  unint64_t v9 = (NSString *)v5[4];
  if (recipientPhoneOrEmail && v9)
  {
    if ((-[NSString isEqual:](recipientPhoneOrEmail, "isEqual:") & 1) == 0) {
      goto LABEL_82;
    }
  }
  else if (recipientPhoneOrEmail != v9)
  {
    goto LABEL_82;
  }
  recipient = self->recipient;
  v11 = (PKPeerPaymentRecipient *)v5[5];
  if (recipient && v11)
  {
    if (!-[PKPeerPaymentRecipient isEqual:](recipient, "isEqual:")) {
      goto LABEL_82;
    }
  }
  else if (recipient != v11)
  {
    goto LABEL_82;
  }
  recipientDisplayName = self->recipientDisplayName;
  v13 = (NSString *)v5[6];
  if (recipientDisplayName && v13)
  {
    if ((-[NSString isEqual:](recipientDisplayName, "isEqual:") & 1) == 0) {
      goto LABEL_82;
    }
  }
  else if (recipientDisplayName != v13)
  {
    goto LABEL_82;
  }
  requestToken = self->requestToken;
  v15 = (PKPeerPaymentRequestToken *)v5[7];
  if (requestToken && v15)
  {
    if (!-[PKPeerPaymentRequestToken isEqual:](requestToken, "isEqual:")) {
      goto LABEL_82;
    }
  }
  else if (requestToken != v15)
  {
    goto LABEL_82;
  }
  quote = self->quote;
  v17 = (PKPeerPaymentQuote *)v5[8];
  if (quote && v17)
  {
    if (!-[PKPeerPaymentQuote isEqual:](quote, "isEqual:")) {
      goto LABEL_82;
    }
  }
  else if (quote != v17)
  {
    goto LABEL_82;
  }
  authorizedQuote = self->authorizedQuote;
  v19 = (PKAuthorizedPeerPaymentQuote *)v5[9];
  if (authorizedQuote && v19)
  {
    if ((-[PKAuthorizedPeerPaymentQuote isEqual:](authorizedQuote, "isEqual:") & 1) == 0) {
      goto LABEL_82;
    }
  }
  else if (authorizedQuote != v19)
  {
    goto LABEL_82;
  }
  performQuoteResponse = self->performQuoteResponse;
  v21 = (PKPeerPaymentPerformResponse *)v5[10];
  if (performQuoteResponse && v21)
  {
    if ((-[PKPeerPaymentPerformResponse isEqual:](performQuoteResponse, "isEqual:") & 1) == 0) {
      goto LABEL_82;
    }
  }
  else if (performQuoteResponse != v21)
  {
    goto LABEL_82;
  }
  quoteCertificatesResponse = self->quoteCertificatesResponse;
  v23 = (PKPeerPaymentQuoteCertificatesResponse *)v5[12];
  if (quoteCertificatesResponse && v23)
  {
    if ((-[PKPeerPaymentQuoteCertificatesResponse isEqual:](quoteCertificatesResponse, "isEqual:") & 1) == 0) {
      goto LABEL_82;
    }
  }
  else if (quoteCertificatesResponse != v23)
  {
    goto LABEL_82;
  }
  accountNumber = self->accountNumber;
  v25 = (NSString *)v5[14];
  if (accountNumber && v25)
  {
    if ((-[NSString isEqual:](accountNumber, "isEqual:") & 1) == 0) {
      goto LABEL_82;
    }
  }
  else if (accountNumber != v25)
  {
    goto LABEL_82;
  }
  routingNumber = self->routingNumber;
  v27 = (NSString *)v5[15];
  if (routingNumber && v27)
  {
    if ((-[NSString isEqual:](routingNumber, "isEqual:") & 1) == 0) {
      goto LABEL_82;
    }
  }
  else if (routingNumber != v27)
  {
    goto LABEL_82;
  }
  accountName = self->accountName;
  v29 = (NSString *)v5[13];
  if (accountName && v29)
  {
    if ((-[NSString isEqual:](accountName, "isEqual:") & 1) == 0) {
      goto LABEL_82;
    }
  }
  else if (accountName != v29)
  {
    goto LABEL_82;
  }
  quoteRequest = self->quoteRequest;
  v31 = (PKPeerPaymentQuoteRequest *)v5[16];
  if (quoteRequest && v31)
  {
    if (!-[PKPeerPaymentQuoteRequest isEqual:](quoteRequest, "isEqual:")) {
      goto LABEL_82;
    }
  }
  else if (quoteRequest != v31)
  {
    goto LABEL_82;
  }
  recurringPaymentIdentifier = self->recurringPaymentIdentifier;
  v33 = (NSString *)v5[17];
  if (recurringPaymentIdentifier && v33)
  {
    if ((-[NSString isEqual:](recurringPaymentIdentifier, "isEqual:") & 1) == 0) {
      goto LABEL_82;
    }
  }
  else if (recurringPaymentIdentifier != v33)
  {
    goto LABEL_82;
  }
  startDate = self->startDate;
  v35 = (NSDate *)v5[18];
  if (!startDate || !v35)
  {
    if (startDate == v35) {
      goto LABEL_78;
    }
LABEL_82:
    char v38 = 0;
    goto LABEL_83;
  }
  if ((-[NSDate isEqual:](startDate, "isEqual:") & 1) == 0) {
    goto LABEL_82;
  }
LABEL_78:
  if (self->frequency != v5[19]) {
    goto LABEL_82;
  }
  threshold = self->threshold;
  v37 = (NSDecimalNumber *)v5[20];
  if (threshold && v37) {
    char v38 = -[NSDecimalNumber isEqual:](threshold, "isEqual:");
  }
  else {
    char v38 = threshold == v37;
  }
LABEL_83:

  return v38;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->threshold, 0);
  objc_storeStrong((id *)&self->startDate, 0);
  objc_storeStrong((id *)&self->recurringPaymentIdentifier, 0);
  objc_storeStrong((id *)&self->quoteRequest, 0);
  objc_storeStrong((id *)&self->routingNumber, 0);
  objc_storeStrong((id *)&self->accountNumber, 0);
  objc_storeStrong((id *)&self->accountName, 0);
  objc_storeStrong((id *)&self->quoteCertificatesResponse, 0);
  objc_storeStrong((id *)&self->performQuoteResponse, 0);
  objc_storeStrong((id *)&self->authorizedQuote, 0);
  objc_storeStrong((id *)&self->quote, 0);
  objc_storeStrong((id *)&self->requestToken, 0);
  objc_storeStrong((id *)&self->recipientDisplayName, 0);
  objc_storeStrong((id *)&self->recipient, 0);
  objc_storeStrong((id *)&self->recipientPhoneOrEmail, 0);
  objc_storeStrong((id *)&self->senderPhoneOrEmail, 0);
}

@end