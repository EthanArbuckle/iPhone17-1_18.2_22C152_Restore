@interface PDAccountServicingTokenUserNotification
+ (BOOL)supportsSecureCoding;
+ (id)notificationIdentifierWithAccount:(id)a3;
- (BOOL)isValid;
- (PDAccountServicingTokenUserNotification)initWithAccount:(id)a3 servicingToken:(id)a4 expirationDate:(id)a5;
- (PDAccountServicingTokenUserNotification)initWithCoder:(id)a3;
- (id)_messageString;
- (id)_titleString;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDAccountServicingTokenUserNotification

+ (id)notificationIdentifierWithAccount:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)NSString);
  v5 = [v3 accountIdentifier];

  id v6 = [v4 initWithFormat:@"servicingToken-%@", v5];
  return v6;
}

- (PDAccountServicingTokenUserNotification)initWithAccount:(id)a3 servicingToken:(id)a4 expirationDate:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  v11 = [(id)objc_opt_class() notificationIdentifierWithAccount:v10];
  v12 = [v10 associatedPassUniqueID];

  v17.receiver = self;
  v17.super_class = (Class)PDAccountServicingTokenUserNotification;
  v13 = [(PDUserNotification *)&v17 initWithNotificationIdentifier:v11 forPassUniqueIdentifier:v12];
  if (v13)
  {
    v14 = (NSString *)[v8 copy];
    servicingToken = v13->_servicingToken;
    v13->_servicingToken = v14;

    objc_storeStrong((id *)&v13->_expirationDate, a5);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDAccountServicingTokenUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PDAccountServicingTokenUserNotification;
  v5 = [(PDUserNotification *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"servicingToken"];
    servicingToken = v5->_servicingToken;
    v5->_servicingToken = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expirationDate"];
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDAccountServicingTokenUserNotification;
  id v4 = a3;
  [(PDUserNotification *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_servicingToken, @"servicingToken", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_expirationDate forKey:@"expirationDate"];
}

- (unint64_t)notificationType
{
  return 39;
}

- (BOOL)isValid
{
  if (![(NSString *)self->_servicingToken length]) {
    return 0;
  }
  expirationDate = self->_expirationDate;
  id v4 = +[NSDate date];
  BOOL v5 = (id)[(NSDate *)expirationDate compare:v4] == (id)1;

  return v5;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PDAccountServicingTokenUserNotification;
  id v4 = [(PDUserNotification *)&v8 notificationContentWithDataSource:a3];
  BOOL v5 = [(PDAccountServicingTokenUserNotification *)self _titleString];
  [v4 setSubtitle:v5];

  uint64_t v6 = [(PDAccountServicingTokenUserNotification *)self _messageString];
  [v4 setBody:v6];

  [v4 setExpirationDate:self->_expirationDate];
  return v4;
}

- (id)_titleString
{
  return (id)PKLocalizedMadisonString(@"SERVICING_TOKEN_NOTIFICATION_TITLE");
}

- (id)_messageString
{
  return (id)PKLocalizedMadisonString(@"SERVICING_TOKEN_NOTIFICATION_BODY", @"%@", self->_servicingToken);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_servicingToken, 0);
}

@end