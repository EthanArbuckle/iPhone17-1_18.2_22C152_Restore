@interface PKPeerPaymentPendingRequestSummary
- (BOOL)isEqual:(id)a3;
- (NSArray)actions;
- (NSDate)expiryDate;
- (NSString)requestToken;
- (NSString)status;
- (PKPeerPaymentPendingRequestSummary)initWithDictionary:(id)a3;
@end

@implementation PKPeerPaymentPendingRequestSummary

- (PKPeerPaymentPendingRequestSummary)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKPeerPaymentPendingRequestSummary;
  v5 = [(PKPeerPaymentPendingRequestSummary *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKey:@"requestToken"];
    requestToken = v5->_requestToken;
    v5->_requestToken = (NSString *)v6;

    uint64_t v8 = [v4 objectForKey:@"status"];
    status = v5->_status;
    v5->_status = (NSString *)v8;

    uint64_t v10 = [v4 PKArrayContaining:objc_opt_class() forKey:@"actions"];
    actions = v5->_actions;
    v5->_actions = (NSArray *)v10;

    v12 = [v4 objectForKey:@"expiryDate"];
    uint64_t v13 = PKISO8601DateFromDateStringContainingFractionalSeconds(v12);
    expiryDate = v5->_expiryDate;
    v5->_expiryDate = (NSDate *)v13;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_19;
  }
  requestToken = self->_requestToken;
  uint64_t v6 = (NSString *)v4[1];
  if (requestToken && v6)
  {
    if ((-[NSString isEqual:](requestToken, "isEqual:") & 1) == 0) {
      goto LABEL_19;
    }
  }
  else if (requestToken != v6)
  {
    goto LABEL_19;
  }
  status = self->_status;
  uint64_t v8 = (NSString *)v4[2];
  if (status && v8)
  {
    if ((-[NSString isEqual:](status, "isEqual:") & 1) == 0) {
      goto LABEL_19;
    }
  }
  else if (status != v8)
  {
    goto LABEL_19;
  }
  actions = self->_actions;
  uint64_t v10 = (NSArray *)v4[3];
  if (!actions || !v10)
  {
    if (actions == v10) {
      goto LABEL_15;
    }
LABEL_19:
    char v13 = 0;
    goto LABEL_20;
  }
  if ((-[NSArray isEqual:](actions, "isEqual:") & 1) == 0) {
    goto LABEL_19;
  }
LABEL_15:
  expiryDate = self->_expiryDate;
  v12 = (NSDate *)v4[4];
  if (expiryDate && v12) {
    char v13 = -[NSDate isEqual:](expiryDate, "isEqual:");
  }
  else {
    char v13 = expiryDate == v12;
  }
LABEL_20:

  return v13;
}

- (NSString)requestToken
{
  return self->_requestToken;
}

- (NSString)status
{
  return self->_status;
}

- (NSArray)actions
{
  return self->_actions;
}

- (NSDate)expiryDate
{
  return self->_expiryDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expiryDate, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_requestToken, 0);
}

@end