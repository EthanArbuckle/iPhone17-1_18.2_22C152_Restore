@interface TPSAnalyticsEventContentIneligible
+ (BOOL)supportsSecureCoding;
+ (id)eventWithTipID:(id)a3 correlationID:(id)a4 bundleID:(id)a5 context:(id)a6 displayType:(unint64_t)a7 reason:(int64_t)a8 date:(id)a9;
- (NSString)bundleID;
- (NSString)context;
- (NSString)correlationID;
- (NSString)tipID;
- (TPSAnalyticsEventContentIneligible)initWithCoder:(id)a3;
- (id)_initWithTipID:(id)a3 correlationID:(id)a4 bundleID:(id)a5 context:(id)a6 displayType:(unint64_t)a7 reason:(int64_t)a8 date:(id)a9;
- (id)eventName;
- (id)mutableAnalyticsEventRepresentation;
- (int64_t)reason;
- (unint64_t)displayCount;
- (unint64_t)displayType;
- (void)encodeWithCoder:(id)a3;
- (void)setDataProvider:(id)a3;
- (void)setDisplayCount:(unint64_t)a3;
@end

@implementation TPSAnalyticsEventContentIneligible

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSAnalyticsEventContentIneligible)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)TPSAnalyticsEventContentIneligible;
  v5 = [(TPSAnalyticsEvent *)&v18 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tip_ID"];
    tipID = v5->_tipID;
    v5->_tipID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tip_correlation_ID"];
    correlationID = v5->_correlationID;
    v5->_correlationID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundle_ID"];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"context"];
    context = v5->_context;
    v5->_context = (NSString *)v12;

    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"display_type"];
    v5->_displayType = [v14 unsignedIntegerValue];

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"display_count"];
    v5->_displayCount = [v15 unsignedIntegerValue];

    v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reason"];
    v5->_reason = [v16 integerValue];
  }
  return v5;
}

- (id)_initWithTipID:(id)a3 correlationID:(id)a4 bundleID:(id)a5 context:(id)a6 displayType:(unint64_t)a7 reason:(int64_t)a8 date:(id)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v23.receiver = self;
  v23.super_class = (Class)TPSAnalyticsEventContentIneligible;
  objc_super v18 = [(TPSAnalyticsEvent *)&v23 initWithDate:a9];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_tipID, a3);
    objc_storeStrong((id *)&v19->_correlationID, a4);
    objc_storeStrong((id *)&v19->_bundleID, a5);
    objc_storeStrong((id *)&v19->_context, a6);
    v19->_displayType = a7;
    v19->_reason = a8;
  }

  return v19;
}

+ (id)eventWithTipID:(id)a3 correlationID:(id)a4 bundleID:(id)a5 context:(id)a6 displayType:(unint64_t)a7 reason:(int64_t)a8 date:(id)a9
{
  id v16 = a9;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  v21 = (void *)[objc_alloc((Class)a1) _initWithTipID:v20 correlationID:v19 bundleID:v18 context:v17 displayType:a7 reason:a8 date:v16];

  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TPSAnalyticsEventContentIneligible;
  id v4 = a3;
  [(TPSAnalyticsEvent *)&v8 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_tipID, @"tip_ID", v8.receiver, v8.super_class);
  [v4 encodeObject:self->_correlationID forKey:@"tip_correlation_ID"];
  [v4 encodeObject:self->_bundleID forKey:@"bundle_ID"];
  [v4 encodeObject:self->_context forKey:@"context"];
  v5 = [NSNumber numberWithUnsignedInteger:self->_displayType];
  [v4 encodeObject:v5 forKey:@"display_type"];

  uint64_t v6 = [NSNumber numberWithUnsignedInteger:self->_displayCount];
  [v4 encodeObject:v6 forKey:@"display_count"];

  v7 = [NSNumber numberWithInteger:self->_reason];
  [v4 encodeObject:v7 forKey:@"reason"];
}

- (id)eventName
{
  return (id)[NSString stringWithFormat:@"%@.%@", @"com.apple.tips", @"content_ineligible"];
}

- (void)setDataProvider:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TPSAnalyticsEventContentIneligible;
  [(TPSAnalyticsEvent *)&v5 setDataProvider:a3];
  if (self->_displayCount)
  {
    self->_displayCount = 1;
  }
  else
  {
    id v4 = [(TPSAnalyticsEvent *)self dataProvider];
    self->_displayCount = [v4 hintDisplayedCountForIdentifier:self->_tipID];
  }
}

- (id)mutableAnalyticsEventRepresentation
{
  v3 = objc_opt_new();
  [v3 setObject:self->_tipID forKeyedSubscript:@"tip_ID"];
  [v3 setObject:self->_correlationID forKeyedSubscript:@"tip_correlation_ID"];
  [v3 setObject:self->_bundleID forKeyedSubscript:@"bundle_ID"];
  [v3 setObject:self->_context forKeyedSubscript:@"context"];
  id v4 = +[TPSAnalyticsCommonDefines displayTypeStringForDisplayType:self->_displayType];
  [v3 setObject:v4 forKeyedSubscript:@"display_type"];

  objc_super v5 = [NSNumber numberWithUnsignedInteger:self->_displayCount];
  [v3 setObject:v5 forKeyedSubscript:@"display_count"];

  uint64_t v6 = +[TPSAnalyticsCommonDefines ineligibleReasonStringForReason:self->_reason];
  [v3 setObject:v6 forKeyedSubscript:@"reason"];

  return v3;
}

- (NSString)tipID
{
  return self->_tipID;
}

- (NSString)correlationID
{
  return self->_correlationID;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)context
{
  return self->_context;
}

- (unint64_t)displayCount
{
  return self->_displayCount;
}

- (void)setDisplayCount:(unint64_t)a3
{
  self->_displayCount = a3;
}

- (unint64_t)displayType
{
  return self->_displayType;
}

- (int64_t)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_correlationID, 0);
  objc_storeStrong((id *)&self->_tipID, 0);
}

@end