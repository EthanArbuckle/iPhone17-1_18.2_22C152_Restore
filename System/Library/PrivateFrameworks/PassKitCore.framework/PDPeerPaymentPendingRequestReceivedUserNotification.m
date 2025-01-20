@interface PDPeerPaymentPendingRequestReceivedUserNotification
+ (BOOL)supportsSecureCoding;
+ (id)notificationIdentifierForRequestToken:(id)a3;
- (NSString)requesterName;
- (PDPeerPaymentPendingRequestReceivedUserNotification)initWithCoder:(id)a3;
- (PDPeerPaymentPendingRequestReceivedUserNotification)initWithPendingRequest:(id)a3 requesterName:(id)a4 forPassUniqueIdentifier:(id)a5;
- (PKPeerPaymentPendingRequest)pendingRequest;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDPeerPaymentPendingRequestReceivedUserNotification

- (PDPeerPaymentPendingRequestReceivedUserNotification)initWithPendingRequest:(id)a3 requesterName:(id)a4 forPassUniqueIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [v9 requestToken];
  v13 = v12;
  if (v12
    && (unsigned __int8 v14 = [v12 isEqualToString:&stru_10075AAD8], v10)
    && (v14 & 1) == 0
    && ([v10 isEqualToString:&stru_10075AAD8] & 1) == 0
    && ([v9 requestDate], v15 = objc_claimAutoreleasedReturnValue(), v15, v15))
  {
    objc_storeStrong((id *)&self->_pendingRequest, a3);
    objc_storeStrong((id *)&self->_requesterName, a4);
    v16 = +[PDPeerPaymentPendingRequestReceivedUserNotification notificationIdentifierForRequestToken:v13];
    v19.receiver = self;
    v19.super_class = (Class)PDPeerPaymentPendingRequestReceivedUserNotification;
    v17 = [(PDUserNotification *)&v19 initWithNotificationIdentifier:v16 forPassUniqueIdentifier:v11];
  }
  else
  {

    v17 = 0;
  }

  return v17;
}

- (PDPeerPaymentPendingRequestReceivedUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PDPeerPaymentPendingRequestReceivedUserNotification;
  v5 = [(PDUserNotification *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pendingRequest"];
    pendingRequest = v5->_pendingRequest;
    v5->_pendingRequest = (PKPeerPaymentPendingRequest *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requesterName"];
    requesterName = v5->_requesterName;
    v5->_requesterName = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDPeerPaymentPendingRequestReceivedUserNotification;
  id v4 = a3;
  [(PDUserNotification *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_pendingRequest, @"pendingRequest", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_requesterName forKey:@"requesterName"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)notificationIdentifierForRequestToken:(id)a3
{
  return +[NSString stringWithFormat:@"peerPaymentPendingRequest-%@", a3];
}

- (unint64_t)notificationType
{
  return 63;
}

- (id)notificationContentWithDataSource:(id)a3
{
  pendingRequest = self->_pendingRequest;
  id v5 = a3;
  uint64_t v6 = [(PKPeerPaymentPendingRequest *)pendingRequest currencyAmount];
  v7 = [v6 formattedStringValue];

  id v8 = objc_alloc_init((Class)NSDateFormatter);
  [v8 setDateFormat:@"MMM dd"];
  id v9 = [(PKPeerPaymentPendingRequest *)self->_pendingRequest requestDate];
  id v10 = [v8 stringFromDate:v9];

  objc_super v11 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_PENDING_REQUEST_RECEIVED_NOTIFICATION_MESSAGE", @"%@%@%@", self->_requesterName, v7, v10);
  v16.receiver = self;
  v16.super_class = (Class)PDPeerPaymentPendingRequestReceivedUserNotification;
  v12 = [(PDUserNotification *)&v16 notificationContentWithDataSource:v5];

  [v12 setBody:v11];
  v13 = [(PDUserNotification *)self date];
  [v12 setDate:v13];

  unsigned __int8 v14 = [(PKPeerPaymentPendingRequest *)self->_pendingRequest expiryDate];
  [v12 setExpirationDate:v14];

  return v12;
}

- (PKPeerPaymentPendingRequest)pendingRequest
{
  return self->_pendingRequest;
}

- (NSString)requesterName
{
  return self->_requesterName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requesterName, 0);
  objc_storeStrong((id *)&self->_pendingRequest, 0);
}

@end