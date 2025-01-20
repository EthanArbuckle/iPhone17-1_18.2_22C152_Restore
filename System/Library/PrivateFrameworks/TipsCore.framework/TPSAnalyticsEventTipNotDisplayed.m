@interface TPSAnalyticsEventTipNotDisplayed
+ (BOOL)supportsSecureCoding;
- (NSString)bundleID;
- (NSString)context;
- (NSString)correlationID;
- (NSString)displayType;
- (NSString)reason;
- (NSString)tipID;
- (TPSAnalyticsEventTipNotDisplayed)initWithCoder:(id)a3;
- (TPSAnalyticsEventTipNotDisplayed)initWithReason:(id)a3 lastOfferedTipID:(id)a4 lastOfferedCorrelationID:(id)a5 lastOfferedBundleID:(id)a6 lastOfferedContext:(id)a7;
- (TPSAnalyticsEventTipNotDisplayed)initWithReason:(id)a3 lastOfferedTipID:(id)a4 lastOfferedCorrelationID:(id)a5 lastOfferedBundleID:(id)a6 lastOfferedContext:(id)a7 date:(id)a8;
- (TPSAnalyticsEventTipNotDisplayed)initWithTipID:(id)a3 correlationID:(id)a4 bundleID:(id)a5 reason:(id)a6 context:(id)a7 date:(id)a8 displayType:(id)a9;
- (TPSAnalyticsEventTipNotDisplayed)initWithTipID:(id)a3 correlationID:(id)a4 bundleID:(id)a5 reason:(int64_t)a6 context:(id)a7 date:(id)a8;
- (TPSAnalyticsEventTipNotDisplayed)initWithTipID:(id)a3 correlationID:(id)a4 reason:(int64_t)a5 context:(id)a6;
- (id)eventName;
- (id)mutableAnalyticsEventRepresentation;
- (void)encodeWithCoder:(id)a3;
- (void)setDataProvider:(id)a3;
@end

@implementation TPSAnalyticsEventTipNotDisplayed

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSAnalyticsEventTipNotDisplayed)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TPSAnalyticsEventTipNotDisplayed;
  v5 = [(TPSAnalyticsEvent *)&v19 initWithCoder:v4];
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

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"display_type"];
    displayType = v5->_displayType;
    v5->_displayType = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reason"];
    reason = v5->_reason;
    v5->_reason = (NSString *)v16;
  }
  return v5;
}

- (TPSAnalyticsEventTipNotDisplayed)initWithReason:(id)a3 lastOfferedTipID:(id)a4 lastOfferedCorrelationID:(id)a5 lastOfferedBundleID:(id)a6 lastOfferedContext:(id)a7
{
  return [(TPSAnalyticsEventTipNotDisplayed *)self initWithReason:a3 lastOfferedTipID:a4 lastOfferedCorrelationID:a5 lastOfferedBundleID:a6 lastOfferedContext:a7 date:0];
}

- (TPSAnalyticsEventTipNotDisplayed)initWithReason:(id)a3 lastOfferedTipID:(id)a4 lastOfferedCorrelationID:(id)a5 lastOfferedBundleID:(id)a6 lastOfferedContext:(id)a7 date:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (!v19)
  {
    id v19 = [MEMORY[0x1E4F1C9C8] date];
  }
  v20 = [(TPSAnalyticsEventTipNotDisplayed *)self initWithTipID:v15 correlationID:v16 bundleID:v17 reason:v14 context:v18 date:v19 displayType:0];

  return v20;
}

- (TPSAnalyticsEventTipNotDisplayed)initWithTipID:(id)a3 correlationID:(id)a4 reason:(int64_t)a5 context:(id)a6
{
  return [(TPSAnalyticsEventTipNotDisplayed *)self initWithTipID:a3 correlationID:a4 bundleID:0 reason:a5 context:a6 date:0];
}

- (TPSAnalyticsEventTipNotDisplayed)initWithTipID:(id)a3 correlationID:(id)a4 bundleID:(id)a5 reason:(int64_t)a6 context:(id)a7 date:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  if (!v18)
  {
    id v18 = [MEMORY[0x1E4F1C9C8] date];
  }
  id v19 = +[TPSAnalyticsCommonDefines ineligibleReasonStringForReason:a6];
  v20 = [(TPSAnalyticsEventTipNotDisplayed *)self initWithTipID:v14 correlationID:v15 bundleID:v16 reason:v19 context:v17 date:v18 displayType:0];

  return v20;
}

- (TPSAnalyticsEventTipNotDisplayed)initWithTipID:(id)a3 correlationID:(id)a4 bundleID:(id)a5 reason:(id)a6 context:(id)a7 date:(id)a8 displayType:(id)a9
{
  id v26 = a3;
  id v25 = a4;
  id v24 = a5;
  id v22 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E4F1C9C8], "date", v22, v24, v25, v26);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  v27.receiver = self;
  v27.super_class = (Class)TPSAnalyticsEventTipNotDisplayed;
  id v19 = -[TPSAnalyticsEvent initWithDate:](&v27, sel_initWithDate_, v17, v22);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_tipID, a3);
    objc_storeStrong((id *)&v20->_correlationID, a4);
    objc_storeStrong((id *)&v20->_bundleID, a5);
    objc_storeStrong((id *)&v20->_context, a7);
    objc_storeStrong((id *)&v20->_displayType, a9);
    objc_storeStrong((id *)&v20->_reason, a6);
  }

  return v20;
}

- (void)setDataProvider:(id)a3
{
  v24.receiver = self;
  v24.super_class = (Class)TPSAnalyticsEventTipNotDisplayed;
  [(TPSAnalyticsEvent *)&v24 setDataProvider:a3];
  bundleID = self->_bundleID;
  if (bundleID)
  {
    v5 = bundleID;
    uint64_t v6 = self->_bundleID;
    self->_bundleID = v5;
  }
  else
  {
    uint64_t v6 = [(TPSAnalyticsEvent *)self dataProvider];
    v7 = [v6 bundleIDForIdentifier:self->_tipID];
    uint64_t v8 = self->_bundleID;
    self->_bundleID = v7;
  }
  context = self->_context;
  if (context)
  {
    uint64_t v10 = context;
    v11 = self->_context;
    self->_context = v10;
  }
  else
  {
    v11 = [(TPSAnalyticsEvent *)self dataProvider];
    uint64_t v12 = [v11 contextForIdentifier:self->_tipID];
    v13 = self->_context;
    self->_context = v12;
  }
  correlationID = self->_correlationID;
  if (correlationID)
  {
    id v15 = correlationID;
    id v16 = self->_correlationID;
    self->_correlationID = v15;
  }
  else
  {
    id v16 = [(TPSAnalyticsEvent *)self dataProvider];
    id v17 = [v16 correlationIDForIdentifier:self->_tipID];
    id v18 = self->_correlationID;
    self->_correlationID = v17;
  }
  displayType = self->_displayType;
  if (displayType)
  {
    v20 = displayType;
    v21 = self->_displayType;
    self->_displayType = v20;
  }
  else
  {
    v21 = [(TPSAnalyticsEvent *)self dataProvider];
    id v22 = [v21 displayTypeForIdentifier:self->_tipID];
    v23 = self->_displayType;
    self->_displayType = v22;
  }
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TPSAnalyticsEventTipNotDisplayed;
  id v4 = a3;
  [(TPSAnalyticsEvent *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_tipID, @"tip_ID", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_correlationID forKey:@"tip_correlation_ID"];
  [v4 encodeObject:self->_bundleID forKey:@"bundle_ID"];
  [v4 encodeObject:self->_context forKey:@"context"];
  [v4 encodeObject:self->_displayType forKey:@"display_type"];
  [v4 encodeObject:self->_reason forKey:@"reason"];
}

- (id)eventName
{
  return (id)[NSString stringWithFormat:@"%@.%@", @"com.apple.tips", @"tip_not_displayed"];
}

- (id)mutableAnalyticsEventRepresentation
{
  v3 = objc_opt_new();
  [v3 setObject:self->_tipID forKeyedSubscript:@"tip_ID"];
  [v3 setObject:self->_correlationID forKeyedSubscript:@"tip_correlation_ID"];
  [v3 setObject:self->_bundleID forKeyedSubscript:@"bundle_ID"];
  [v3 setObject:self->_context forKeyedSubscript:@"context"];
  [v3 setObject:self->_reason forKeyedSubscript:@"reason"];
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

- (NSString)displayType
{
  return self->_displayType;
}

- (NSString)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_displayType, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_correlationID, 0);
  objc_storeStrong((id *)&self->_tipID, 0);
}

@end