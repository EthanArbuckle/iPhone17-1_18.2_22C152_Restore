@interface NSSExternalAnalyticsRequestMetadata
+ (BOOL)supportsSecureCoding;
- (NSSExternalAnalyticsRequestMetadata)initWithCoder:(id)a3;
- (NSSExternalAnalyticsRequestMetadata)initWithSession:(id)a3 eventIdentifier:(id)a4 externalAnalyticsIdentifier:(id)a5 contentViewedIdentifier:(id)a6 publisherIdentifier:(id)a7 eventType:(int)a8;
- (NSString)contentViewedIdentifier;
- (NSString)eventIdentifier;
- (NSString)externalAnalyticsIdentifier;
- (NSString)publisherIdentifier;
- (NTPBSession)session;
- (int)eventType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSSExternalAnalyticsRequestMetadata

- (NSSExternalAnalyticsRequestMetadata)initWithSession:(id)a3 eventIdentifier:(id)a4 externalAnalyticsIdentifier:(id)a5 contentViewedIdentifier:(id)a6 publisherIdentifier:(id)a7 eventType:(int)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v31.receiver = self;
  v31.super_class = (Class)NSSExternalAnalyticsRequestMetadata;
  v19 = [(NSSExternalAnalyticsRequestMetadata *)&v31 init];
  if (v19)
  {
    uint64_t v20 = [v14 copy];
    session = v19->_session;
    v19->_session = (NTPBSession *)v20;

    uint64_t v22 = [v15 copy];
    eventIdentifier = v19->_eventIdentifier;
    v19->_eventIdentifier = (NSString *)v22;

    uint64_t v24 = [v16 copy];
    externalAnalyticsIdentifier = v19->_externalAnalyticsIdentifier;
    v19->_externalAnalyticsIdentifier = (NSString *)v24;

    uint64_t v26 = [v17 copy];
    contentViewedIdentifier = v19->_contentViewedIdentifier;
    v19->_contentViewedIdentifier = (NSString *)v26;

    uint64_t v28 = [v18 copy];
    publisherIdentifier = v19->_publisherIdentifier;
    v19->_publisherIdentifier = (NSString *)v28;

    v19->_eventType = a8;
  }

  return v19;
}

- (NSSExternalAnalyticsRequestMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectForKey:@"session"];
  v6 = [v4 decodeObjectForKey:@"eventIdentifier"];
  v7 = [v4 decodeObjectForKey:@"externalAnalyticsIdentifier"];
  v8 = [v4 decodeObjectForKey:@"contentViewedIdentifier"];
  v9 = [v4 decodeObjectForKey:@"publisherIdentifier"];
  uint64_t v10 = [v4 decodeInt32ForKey:@"eventType"];

  v11 = [(NSSExternalAnalyticsRequestMetadata *)self initWithSession:v5 eventIdentifier:v6 externalAnalyticsIdentifier:v7 contentViewedIdentifier:v8 publisherIdentifier:v9 eventType:v10];
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  id v4 = [(NSSExternalAnalyticsRequestMetadata *)self session];
  [v9 encodeObject:v4 forKey:@"session"];

  v5 = [(NSSExternalAnalyticsRequestMetadata *)self eventIdentifier];
  [v9 encodeObject:v5 forKey:@"eventIdentifier"];

  v6 = [(NSSExternalAnalyticsRequestMetadata *)self externalAnalyticsIdentifier];
  [v9 encodeObject:v6 forKey:@"externalAnalyticsIdentifier"];

  v7 = [(NSSExternalAnalyticsRequestMetadata *)self contentViewedIdentifier];
  [v9 encodeObject:v7 forKey:@"contentViewedIdentifier"];

  v8 = [(NSSExternalAnalyticsRequestMetadata *)self publisherIdentifier];
  [v9 encodeObject:v8 forKey:@"publisherIdentifier"];

  objc_msgSend(v9, "encodeInt32:forKey:", -[NSSExternalAnalyticsRequestMetadata eventType](self, "eventType"), @"eventType");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)eventIdentifier
{
  return self->_eventIdentifier;
}

- (NSString)externalAnalyticsIdentifier
{
  return self->_externalAnalyticsIdentifier;
}

- (NTPBSession)session
{
  return self->_session;
}

- (NSString)contentViewedIdentifier
{
  return self->_contentViewedIdentifier;
}

- (NSString)publisherIdentifier
{
  return self->_publisherIdentifier;
}

- (int)eventType
{
  return self->_eventType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisherIdentifier, 0);
  objc_storeStrong((id *)&self->_contentViewedIdentifier, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_externalAnalyticsIdentifier, 0);
  objc_storeStrong((id *)&self->_eventIdentifier, 0);
}

@end