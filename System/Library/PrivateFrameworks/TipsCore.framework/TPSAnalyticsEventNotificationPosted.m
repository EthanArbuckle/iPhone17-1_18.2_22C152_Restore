@interface TPSAnalyticsEventNotificationPosted
+ (BOOL)supportsSecureCoding;
+ (id)eventWithContentID:(id)a3 collectionID:(id)a4 correlationID:(id)a5 remainingNotificationsCount:(id)a6 errorCode:(id)a7;
- (BOOL)landingPage;
- (NSNumber)notificationsPosted;
- (NSString)collectionID;
- (NSString)contentID;
- (NSString)correlationID;
- (NSString)errorCode;
- (TPSAnalyticsEventNotificationPosted)initWithCoder:(id)a3;
- (id)_initWithContentID:(id)a3 collectionID:(id)a4 correlationID:(id)a5 remainingNotificationsCount:(id)a6 errorCode:(id)a7;
- (id)eventName;
- (id)mutableAnalyticsEventRepresentation;
- (void)encodeWithCoder:(id)a3;
- (void)persistKeys;
- (void)setCollectionID:(id)a3;
- (void)setContentID:(id)a3;
- (void)setCorrelationID:(id)a3;
- (void)setErrorCode:(id)a3;
@end

@implementation TPSAnalyticsEventNotificationPosted

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSAnalyticsEventNotificationPosted)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TPSAnalyticsEventNotificationPosted;
  v5 = [(TPSAnalyticsEvent *)&v19 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"seq_num"];
    posted = v5->_posted;
    v5->_posted = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tip_ID"];
    contentID = v5->_contentID;
    v5->_contentID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"collection_ID"];
    collectionID = v5->_collectionID;
    v5->_collectionID = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tip_correlation_ID"];
    correlationID = v5->_correlationID;
    v5->_correlationID = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error_code"];
    errorCode = v5->_errorCode;
    v5->_errorCode = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"remaining"];
    remaining = v5->_remaining;
    v5->_remaining = (NSNumber *)v16;
  }
  return v5;
}

- (id)_initWithContentID:(id)a3 collectionID:(id)a4 correlationID:(id)a5 remainingNotificationsCount:(id)a6 errorCode:(id)a7
{
  id v13 = a3;
  id v21 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)TPSAnalyticsEventNotificationPosted;
  v17 = [(TPSAnalyticsEvent *)&v22 initWithDate:0];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_contentID, a3);
    objc_storeStrong((id *)&v18->_collectionID, a4);
    objc_storeStrong((id *)&v18->_correlationID, a5);
    objc_storeStrong((id *)&v18->_errorCode, a7);
    objc_storeStrong((id *)&v18->_remaining, a6);
    BOOL v19 = [(NSString *)v18->_contentID isEqualToString:@"collection"];
    if (v19) {
      LOBYTE(v19) = [(NSString *)v18->_collectionID isEqualToString:@"collection"];
    }
    v18->_landingPage = v19;
  }

  return v18;
}

+ (id)eventWithContentID:(id)a3 collectionID:(id)a4 correlationID:(id)a5 remainingNotificationsCount:(id)a6 errorCode:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = (void *)[objc_alloc((Class)a1) _initWithContentID:v16 collectionID:v15 correlationID:v14 remainingNotificationsCount:v13 errorCode:v12];

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)TPSAnalyticsEventNotificationPosted;
  id v4 = a3;
  [(TPSAnalyticsEvent *)&v10 encodeWithCoder:v4];
  v5 = [(TPSAnalyticsEventNotificationPosted *)self notificationsPosted];
  [v4 encodeObject:v5 forKey:@"seq_num"];

  uint64_t v6 = [(TPSAnalyticsEventNotificationPosted *)self contentID];
  [v4 encodeObject:v6 forKey:@"tip_ID"];

  v7 = [(TPSAnalyticsEventNotificationPosted *)self collectionID];
  [v4 encodeObject:v7 forKey:@"collection_ID"];

  uint64_t v8 = [(TPSAnalyticsEventNotificationPosted *)self correlationID];
  [v4 encodeObject:v8 forKey:@"tip_correlation_ID"];

  v9 = [(TPSAnalyticsEventNotificationPosted *)self errorCode];
  [v4 encodeObject:v9 forKey:@"error_code"];

  [v4 encodeObject:self->_remaining forKey:@"remaining"];
}

- (id)eventName
{
  return (id)[NSString stringWithFormat:@"%@.%@", @"com.apple.tips", @"notification_posted"];
}

- (NSNumber)notificationsPosted
{
  posted = self->_posted;
  if (!posted)
  {
    id v4 = +[TPSAnalyticsPersistenceController persistedObjectForKey:@"TPSNotificationCount"];
    v5 = self->_posted;
    self->_posted = v4;

    objc_msgSend(NSNumber, "numberWithInt:", -[NSNumber intValue](self->_posted, "intValue") + 1);
    uint64_t v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v7 = self->_posted;
    self->_posted = v6;

    +[TPSAnalyticsPersistenceController persistObject:self->_posted forKey:@"TPSNotificationCount"];
    posted = self->_posted;
  }
  return posted;
}

- (id)mutableAnalyticsEventRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(TPSAnalyticsEventNotificationPosted *)self notificationsPosted];
  [v3 setObject:v4 forKeyedSubscript:@"seq_num"];

  [v3 setObject:self->_remaining forKeyedSubscript:@"num_until_optout"];
  [v3 setObject:self->_contentID forKeyedSubscript:@"tip_ID"];
  [v3 setObject:self->_collectionID forKeyedSubscript:@"collection_ID"];
  [v3 setObject:self->_correlationID forKeyedSubscript:@"tip_correlation_ID"];
  [v3 setObject:self->_errorCode forKeyedSubscript:@"error_code"];
  v5 = NSNumber;
  uint64_t v6 = +[TPSCommonDefines sharedInstance];
  v7 = objc_msgSend(v5, "numberWithInteger:", objc_msgSend(v6, "daysSinceLastMajorVersionUpdate"));
  [v3 setObject:v7 forKeyedSubscript:@"time_since_os_install"];

  uint64_t v8 = objc_msgSend(NSNumber, "numberWithBool:", +[TPSCommonDefines isSeniorUser](TPSCommonDefines, "isSeniorUser"));
  [v3 setObject:v8 forKeyedSubscript:@"u65_flag"];

  return v3;
}

- (void)persistKeys
{
  v2 = [(TPSAnalyticsEventNotificationPosted *)self notificationsPosted];
  +[TPSAnalyticsPersistenceController persistObject:v2 forKey:@"TPSNotificationCount"];

  id v3 = [MEMORY[0x1E4F1C9C8] date];
  +[TPSAnalyticsPersistenceController persistObject:v3 forKey:@"TPSLastNotificationTime"];
}

- (BOOL)landingPage
{
  return self->_landingPage;
}

- (NSString)contentID
{
  return self->_contentID;
}

- (void)setContentID:(id)a3
{
}

- (NSString)collectionID
{
  return self->_collectionID;
}

- (void)setCollectionID:(id)a3
{
}

- (NSString)correlationID
{
  return self->_correlationID;
}

- (void)setCorrelationID:(id)a3
{
}

- (NSString)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorCode, 0);
  objc_storeStrong((id *)&self->_correlationID, 0);
  objc_storeStrong((id *)&self->_collectionID, 0);
  objc_storeStrong((id *)&self->_contentID, 0);
  objc_storeStrong((id *)&self->_remaining, 0);
  objc_storeStrong((id *)&self->_posted, 0);
}

@end