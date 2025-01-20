@interface TPSAnalyticsEventContentLinkTapped
+ (BOOL)supportsSecureCoding;
+ (id)eventWithContentID:(id)a3 collectionID:(id)a4 correlationID:(id)a5 clientConditionID:(id)a6 url:(id)a7;
- (NSString)bundleID;
- (NSString)clientConditionID;
- (NSString)collectionID;
- (NSString)contentID;
- (NSString)context;
- (NSString)correlationID;
- (NSString)displayType;
- (NSString)url;
- (TPSAnalyticsEventContentLinkTapped)initWithCoder:(id)a3;
- (id)_initWithContentID:(id)a3 collectionID:(id)a4 correlationID:(id)a5 clientConditionID:(id)a6 url:(id)a7 bundleID:(id)a8 context:(id)a9 displayType:(id)a10;
- (id)eventName;
- (id)mutableAnalyticsEventRepresentation;
- (void)encodeWithCoder:(id)a3;
- (void)setDataProvider:(id)a3;
- (void)setDisplayType:(id)a3;
@end

@implementation TPSAnalyticsEventContentLinkTapped

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSAnalyticsEventContentLinkTapped)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)TPSAnalyticsEventContentLinkTapped;
  v5 = [(TPSAnalyticsEvent *)&v23 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tip_ID"];
    contentID = v5->_contentID;
    v5->_contentID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"collection_ID"];
    collectionID = v5->_collectionID;
    v5->_collectionID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tip_correlation_ID"];
    correlationID = v5->_correlationID;
    v5->_correlationID = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"client_condition"];
    clientConditionID = v5->_clientConditionID;
    v5->_clientConditionID = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundle_ID"];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"context"];
    context = v5->_context;
    v5->_context = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"display_type"];
    displayType = v5->_displayType;
    v5->_displayType = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"link_url"];
    url = v5->_url;
    v5->_url = (NSString *)v20;
  }
  return v5;
}

- (id)_initWithContentID:(id)a3 collectionID:(id)a4 correlationID:(id)a5 clientConditionID:(id)a6 url:(id)a7 bundleID:(id)a8 context:(id)a9 displayType:(id)a10
{
  id v29 = a3;
  id v28 = a4;
  id v27 = a5;
  id v26 = a6;
  id v17 = a7;
  id v25 = a8;
  id v24 = a9;
  id v18 = a10;
  v30.receiver = self;
  v30.super_class = (Class)TPSAnalyticsEventContentLinkTapped;
  v19 = [(TPSAnalyticsEvent *)&v30 initWithDate:0];
  uint64_t v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_contentID, a3);
    objc_storeStrong((id *)&v20->_collectionID, a4);
    objc_storeStrong((id *)&v20->_correlationID, a5);
    objc_storeStrong((id *)&v20->_clientConditionID, a6);
    uint64_t v21 = objc_msgSend(v17, "absoluteString", v24, v25, v26, v27, v28, v29);
    url = v20->_url;
    v20->_url = (NSString *)v21;

    objc_storeStrong((id *)&v20->_bundleID, a8);
    objc_storeStrong((id *)&v20->_context, a9);
    objc_storeStrong((id *)&v20->_displayType, a10);
  }

  return v20;
}

+ (id)eventWithContentID:(id)a3 collectionID:(id)a4 correlationID:(id)a5 clientConditionID:(id)a6 url:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = (void *)[objc_alloc((Class)a1) _initWithContentID:v16 collectionID:v15 correlationID:v14 clientConditionID:v13 url:v12 bundleID:0 context:0 displayType:0];

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TPSAnalyticsEventContentLinkTapped;
  id v4 = a3;
  [(TPSAnalyticsEvent *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_contentID, @"tip_ID", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_collectionID forKey:@"collection_ID"];
  [v4 encodeObject:self->_correlationID forKey:@"tip_correlation_ID"];
  [v4 encodeObject:self->_clientConditionID forKey:@"client_condition"];
  [v4 encodeObject:self->_bundleID forKey:@"bundle_ID"];
  [v4 encodeObject:self->_context forKey:@"context"];
  [v4 encodeObject:self->_displayType forKey:@"display_type"];
  [v4 encodeObject:self->_url forKey:@"link_url"];
}

- (void)setDataProvider:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)TPSAnalyticsEventContentLinkTapped;
  [(TPSAnalyticsEvent *)&v9 setDataProvider:a3];
  displayType = self->_displayType;
  if (displayType)
  {
    objc_super v5 = displayType;
    uint64_t v6 = self->_displayType;
    self->_displayType = v5;
  }
  else
  {
    uint64_t v6 = [(TPSAnalyticsEvent *)self dataProvider];
    v7 = [v6 displayTypeForIdentifier:self->_contentID];
    uint64_t v8 = self->_displayType;
    self->_displayType = v7;
  }
}

- (id)eventName
{
  return (id)[NSString stringWithFormat:@"%@.%@", @"com.apple.tips", @"link_used"];
}

- (id)mutableAnalyticsEventRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [v3 setObject:self->_contentID forKeyedSubscript:@"tip_ID"];
  [v3 setObject:self->_collectionID forKeyedSubscript:@"collection_ID"];
  [v3 setObject:self->_correlationID forKeyedSubscript:@"tip_correlation_ID"];
  [v3 setObject:self->_clientConditionID forKeyedSubscript:@"client_condition"];
  [v3 setObject:self->_bundleID forKeyedSubscript:@"bundle_ID"];
  [v3 setObject:self->_context forKeyedSubscript:@"context"];
  [v3 setObject:self->_displayType forKeyedSubscript:@"display_type"];
  [v3 setObject:self->_url forKeyedSubscript:@"link_url"];
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", +[TPSCommonDefines isSeniorUser](TPSCommonDefines, "isSeniorUser"));
  [v3 setObject:v4 forKeyedSubscript:@"u65_flag"];

  return v3;
}

- (NSString)contentID
{
  return self->_contentID;
}

- (NSString)collectionID
{
  return self->_collectionID;
}

- (NSString)correlationID
{
  return self->_correlationID;
}

- (NSString)clientConditionID
{
  return self->_clientConditionID;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)context
{
  return self->_context;
}

- (NSString)displayType
{
  return self->_displayType;
}

- (void)setDisplayType:(id)a3
{
}

- (NSString)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_displayType, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_clientConditionID, 0);
  objc_storeStrong((id *)&self->_correlationID, 0);
  objc_storeStrong((id *)&self->_collectionID, 0);
  objc_storeStrong((id *)&self->_contentID, 0);
}

@end