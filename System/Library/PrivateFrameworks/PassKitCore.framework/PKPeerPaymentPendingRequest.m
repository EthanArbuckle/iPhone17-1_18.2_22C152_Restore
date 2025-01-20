@interface PKPeerPaymentPendingRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)actions;
- (NSDate)expiryDate;
- (NSDate)lastDismissedDate;
- (NSDate)requestDate;
- (NSString)memo;
- (NSString)requestToken;
- (NSString)requesteeAddress;
- (NSString)requesterAddress;
- (NSString)sessionID;
- (NSString)status;
- (PKCurrencyAmount)currencyAmount;
- (PKPeerPaymentPendingRequest)initWithCoder:(id)a3;
- (PKPeerPaymentPendingRequest)initWithRequestToken:(id)a3 requesterAddress:(id)a4 requesteeAddress:(id)a5 currencyAmount:(id)a6 memo:(id)a7 sessionID:(id)a8 requestDate:(id)a9 expiryDate:(id)a10 lastDismissedDate:(id)a11 actions:(id)a12 status:(id)a13;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setActions:(id)a3;
- (void)setCurrencyAmount:(id)a3;
- (void)setExpiryDate:(id)a3;
- (void)setLastDismissedDate:(id)a3;
- (void)setMemo:(id)a3;
- (void)setRequestDate:(id)a3;
- (void)setRequestToken:(id)a3;
- (void)setRequesteeAddress:(id)a3;
- (void)setRequesterAddress:(id)a3;
- (void)setSessionID:(id)a3;
- (void)setStatus:(id)a3;
@end

@implementation PKPeerPaymentPendingRequest

- (PKPeerPaymentPendingRequest)initWithRequestToken:(id)a3 requesterAddress:(id)a4 requesteeAddress:(id)a5 currencyAmount:(id)a6 memo:(id)a7 sessionID:(id)a8 requestDate:(id)a9 expiryDate:(id)a10 lastDismissedDate:(id)a11 actions:(id)a12 status:(id)a13
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v55 = a6;
  id v21 = a7;
  id obj = a8;
  id v22 = a8;
  v23 = v21;
  id v54 = v22;
  v24 = v19;
  id v25 = a9;
  id v26 = a10;
  id v27 = a11;
  id v28 = a12;
  id v29 = a13;
  v56.receiver = self;
  v56.super_class = (Class)PKPeerPaymentPendingRequest;
  v30 = [(PKPeerPaymentPendingRequest *)&v56 init];
  if (v30)
  {
    uint64_t v31 = [v18 copy];
    requestToken = v30->_requestToken;
    v30->_requestToken = (NSString *)v31;

    uint64_t v33 = [v24 copy];
    requesterAddress = v30->_requesterAddress;
    v30->_requesterAddress = (NSString *)v33;

    uint64_t v35 = [v20 copy];
    requesteeAddress = v30->_requesteeAddress;
    v30->_requesteeAddress = (NSString *)v35;

    uint64_t v37 = [v55 copy];
    currencyAmount = v30->_currencyAmount;
    v30->_currencyAmount = (PKCurrencyAmount *)v37;

    uint64_t v39 = [v23 copy];
    memo = v30->_memo;
    v30->_memo = (NSString *)v39;

    objc_storeStrong((id *)&v30->_sessionID, obj);
    uint64_t v41 = [v25 copy];
    requestDate = v30->_requestDate;
    v30->_requestDate = (NSDate *)v41;

    uint64_t v43 = [v26 copy];
    expiryDate = v30->_expiryDate;
    v30->_expiryDate = (NSDate *)v43;

    uint64_t v45 = [v27 copy];
    lastDismissedDate = v30->_lastDismissedDate;
    v30->_lastDismissedDate = (NSDate *)v45;

    uint64_t v47 = [v28 copy];
    actions = v30->_actions;
    v30->_actions = (NSArray *)v47;

    uint64_t v49 = [v29 copy];
    status = v30->_status;
    v30->_status = (NSString *)v49;
  }
  return v30;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentPendingRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)PKPeerPaymentPendingRequest;
  v5 = [(PKPeerPaymentPendingRequest *)&v29 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestToken"];
    requestToken = v5->_requestToken;
    v5->_requestToken = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requesterAddress"];
    requesterAddress = v5->_requesterAddress;
    v5->_requesterAddress = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requesteeAddress"];
    requesteeAddress = v5->_requesteeAddress;
    v5->_requesteeAddress = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currencyAmount"];
    currencyAmount = v5->_currencyAmount;
    v5->_currencyAmount = (PKCurrencyAmount *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"memo"];
    memo = v5->_memo;
    v5->_memo = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sessionID"];
    sessionID = v5->_sessionID;
    v5->_sessionID = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestDate"];
    requestDate = v5->_requestDate;
    v5->_requestDate = (NSDate *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expiryDate"];
    expiryDate = v5->_expiryDate;
    v5->_expiryDate = (NSDate *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastDismissedDate"];
    lastDismissedDate = v5->_lastDismissedDate;
    v5->_lastDismissedDate = (NSDate *)v22;

    uint64_t v24 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"actions"];
    actions = v5->_actions;
    v5->_actions = (NSArray *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"status"];
    status = v5->_status;
    v5->_status = (NSString *)v26;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  requestToken = self->_requestToken;
  id v5 = a3;
  [v5 encodeObject:requestToken forKey:@"requestToken"];
  [v5 encodeObject:self->_requesterAddress forKey:@"requesterAddress"];
  [v5 encodeObject:self->_requesteeAddress forKey:@"requesteeAddress"];
  [v5 encodeObject:self->_currencyAmount forKey:@"currencyAmount"];
  [v5 encodeObject:self->_memo forKey:@"memo"];
  [v5 encodeObject:self->_sessionID forKey:@"sessionID"];
  [v5 encodeObject:self->_requestDate forKey:@"requestDate"];
  [v5 encodeObject:self->_expiryDate forKey:@"expiryDate"];
  [v5 encodeObject:self->_lastDismissedDate forKey:@"lastDismissedDate"];
  [v5 encodeObject:self->_actions forKey:@"actions"];
  [v5 encodeObject:self->_status forKey:@"status"];
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p; ", v5, self];

  [v6 appendFormat:@"requestToken: '%@'; ", self->_requestToken];
  [v6 appendFormat:@"requesterAddress: '%@'; ", self->_requesterAddress];
  [v6 appendFormat:@"requesteeAddress: '%@'; ", self->_requesteeAddress];
  [v6 appendFormat:@"currencyAmount: '%@'; ", self->_currencyAmount];
  [v6 appendFormat:@"memo: '%@'; ", self->_memo];
  [v6 appendFormat:@"sessionID: '%@'; ", self->_sessionID];
  [v6 appendFormat:@"requestDate: '%@'; ", self->_requestDate];
  [v6 appendFormat:@"expiryDate: '%@'; ", self->_expiryDate];
  [v6 appendFormat:@"lastDismissedDate: '%@'; ", self->_lastDismissedDate];
  [v6 appendFormat:@"actions: '%@'; ", self->_actions];
  [v6 appendFormat:@"status: '%@'; ", self->_status];
  [v6 appendFormat:@">"];
  v7 = [NSString stringWithString:v6];

  return v7;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = v3;
  if (self->_requestToken) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_requesterAddress) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_requesteeAddress) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_currencyAmount) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_memo) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_sessionID) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_requestDate) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_expiryDate) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_lastDismissedDate) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_actions) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_status) {
    objc_msgSend(v4, "addObject:");
  }
  unint64_t v5 = PKCombinedHash(17, v4);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_54;
  }
  requestToken = self->_requestToken;
  uint64_t v6 = (NSString *)v4[1];
  if (requestToken && v6)
  {
    if ((-[NSString isEqual:](requestToken, "isEqual:") & 1) == 0) {
      goto LABEL_54;
    }
  }
  else if (requestToken != v6)
  {
    goto LABEL_54;
  }
  requesterAddress = self->_requesterAddress;
  uint64_t v8 = (NSString *)v4[2];
  if (requesterAddress && v8)
  {
    if ((-[NSString isEqual:](requesterAddress, "isEqual:") & 1) == 0) {
      goto LABEL_54;
    }
  }
  else if (requesterAddress != v8)
  {
    goto LABEL_54;
  }
  requesteeAddress = self->_requesteeAddress;
  uint64_t v10 = (NSString *)v4[3];
  if (requesteeAddress && v10)
  {
    if ((-[NSString isEqual:](requesteeAddress, "isEqual:") & 1) == 0) {
      goto LABEL_54;
    }
  }
  else if (requesteeAddress != v10)
  {
    goto LABEL_54;
  }
  currencyAmount = self->_currencyAmount;
  uint64_t v12 = (PKCurrencyAmount *)v4[4];
  if (currencyAmount && v12)
  {
    if (!-[PKCurrencyAmount isEqual:](currencyAmount, "isEqual:")) {
      goto LABEL_54;
    }
  }
  else if (currencyAmount != v12)
  {
    goto LABEL_54;
  }
  memo = self->_memo;
  uint64_t v14 = (NSString *)v4[5];
  if (memo && v14)
  {
    if ((-[NSString isEqual:](memo, "isEqual:") & 1) == 0) {
      goto LABEL_54;
    }
  }
  else if (memo != v14)
  {
    goto LABEL_54;
  }
  sessionID = self->_sessionID;
  uint64_t v16 = (NSString *)v4[6];
  if (sessionID && v16)
  {
    if ((-[NSString isEqual:](sessionID, "isEqual:") & 1) == 0) {
      goto LABEL_54;
    }
  }
  else if (sessionID != v16)
  {
    goto LABEL_54;
  }
  requestDate = self->_requestDate;
  uint64_t v18 = (NSDate *)v4[7];
  if (requestDate && v18)
  {
    if ((-[NSDate isEqual:](requestDate, "isEqual:") & 1) == 0) {
      goto LABEL_54;
    }
  }
  else if (requestDate != v18)
  {
    goto LABEL_54;
  }
  expiryDate = self->_expiryDate;
  uint64_t v20 = (NSDate *)v4[8];
  if (expiryDate && v20)
  {
    if ((-[NSDate isEqual:](expiryDate, "isEqual:") & 1) == 0) {
      goto LABEL_54;
    }
  }
  else if (expiryDate != v20)
  {
    goto LABEL_54;
  }
  lastDismissedDate = self->_lastDismissedDate;
  uint64_t v22 = (NSDate *)v4[9];
  if (lastDismissedDate && v22)
  {
    if ((-[NSDate isEqual:](lastDismissedDate, "isEqual:") & 1) == 0) {
      goto LABEL_54;
    }
  }
  else if (lastDismissedDate != v22)
  {
    goto LABEL_54;
  }
  actions = self->_actions;
  uint64_t v24 = (NSArray *)v4[10];
  if (!actions || !v24)
  {
    if (actions == v24) {
      goto LABEL_50;
    }
LABEL_54:
    char v27 = 0;
    goto LABEL_55;
  }
  if ((-[NSArray isEqual:](actions, "isEqual:") & 1) == 0) {
    goto LABEL_54;
  }
LABEL_50:
  status = self->_status;
  uint64_t v26 = (NSString *)v4[11];
  if (status && v26) {
    char v27 = -[NSString isEqual:](status, "isEqual:");
  }
  else {
    char v27 = status == v26;
  }
LABEL_55:

  return v27;
}

- (NSString)requestToken
{
  return self->_requestToken;
}

- (void)setRequestToken:(id)a3
{
}

- (NSString)requesterAddress
{
  return self->_requesterAddress;
}

- (void)setRequesterAddress:(id)a3
{
}

- (NSString)requesteeAddress
{
  return self->_requesteeAddress;
}

- (void)setRequesteeAddress:(id)a3
{
}

- (PKCurrencyAmount)currencyAmount
{
  return self->_currencyAmount;
}

- (void)setCurrencyAmount:(id)a3
{
}

- (NSString)memo
{
  return self->_memo;
}

- (void)setMemo:(id)a3
{
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (NSDate)requestDate
{
  return self->_requestDate;
}

- (void)setRequestDate:(id)a3
{
}

- (NSDate)expiryDate
{
  return self->_expiryDate;
}

- (void)setExpiryDate:(id)a3
{
}

- (NSDate)lastDismissedDate
{
  return self->_lastDismissedDate;
}

- (void)setLastDismissedDate:(id)a3
{
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
}

- (NSString)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_lastDismissedDate, 0);
  objc_storeStrong((id *)&self->_expiryDate, 0);
  objc_storeStrong((id *)&self->_requestDate, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_memo, 0);
  objc_storeStrong((id *)&self->_currencyAmount, 0);
  objc_storeStrong((id *)&self->_requesteeAddress, 0);
  objc_storeStrong((id *)&self->_requesterAddress, 0);
  objc_storeStrong((id *)&self->_requestToken, 0);
}

@end