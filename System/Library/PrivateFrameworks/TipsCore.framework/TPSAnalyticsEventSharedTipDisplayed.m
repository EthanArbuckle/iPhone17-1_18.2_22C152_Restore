@interface TPSAnalyticsEventSharedTipDisplayed
+ (BOOL)supportsSecureCoding;
+ (id)eventWithTipID:(id)a3 correlationID:(id)a4 collectionID:(id)a5 variantID:(id)a6 message:(id)a7 isEligible:(BOOL)a8;
+ (id)eventWithTipID:(id)a3 invalidVariantID:(id)a4;
- (NSString)collectionID;
- (NSString)correlationID;
- (NSString)eligibility;
- (NSString)message;
- (NSString)tipID;
- (NSString)variantID;
- (TPSAnalyticsEventSharedTipDisplayed)initWithCoder:(id)a3;
- (id)_initWithTipID:(id)a3 correlationID:(id)a4 collectionID:(id)a5 variantID:(id)a6 eligibility:(id)a7 message:(id)a8;
- (id)eventName;
- (id)mutableAnalyticsEventRepresentation;
- (void)encodeWithCoder:(id)a3;
- (void)setCollectionID:(id)a3;
- (void)setCorrelationID:(id)a3;
- (void)setEligibility:(id)a3;
- (void)setMessage:(id)a3;
- (void)setTipID:(id)a3;
- (void)setVariantID:(id)a3;
@end

@implementation TPSAnalyticsEventSharedTipDisplayed

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSAnalyticsEventSharedTipDisplayed)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TPSAnalyticsEventSharedTipDisplayed;
  v5 = [(TPSAnalyticsEvent *)&v19 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tip_ID"];
    tipID = v5->_tipID;
    v5->_tipID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tip_correlation_ID"];
    correlationID = v5->_correlationID;
    v5->_correlationID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"collection_ID"];
    collectionID = v5->_collectionID;
    v5->_collectionID = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tip_variant_ID"];
    variantID = v5->_variantID;
    v5->_variantID = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eligibility"];
    eligibility = v5->_eligibility;
    v5->_eligibility = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"message"];
    message = v5->_message;
    v5->_message = (NSString *)v16;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TPSAnalyticsEventSharedTipDisplayed;
  id v4 = a3;
  [(TPSAnalyticsEvent *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_tipID, @"tip_ID", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_correlationID forKey:@"tip_correlation_ID"];
  [v4 encodeObject:self->_collectionID forKey:@"collection_ID"];
  [v4 encodeObject:self->_variantID forKey:@"tip_variant_ID"];
  [v4 encodeObject:self->_eligibility forKey:@"eligibility"];
  [v4 encodeObject:self->_message forKey:@"message"];
}

- (id)_initWithTipID:(id)a3 correlationID:(id)a4 collectionID:(id)a5 variantID:(id)a6 eligibility:(id)a7 message:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v20 = a6;
  id v15 = a7;
  id v16 = a8;
  v17 = [MEMORY[0x1E4F1C9C8] date];
  v24.receiver = self;
  v24.super_class = (Class)TPSAnalyticsEventSharedTipDisplayed;
  v18 = [(TPSAnalyticsEvent *)&v24 initWithDate:v17];

  if (v18)
  {
    objc_storeStrong((id *)&v18->_tipID, a3);
    objc_storeStrong((id *)&v18->_correlationID, a4);
    objc_storeStrong((id *)&v18->_collectionID, a5);
    objc_storeStrong((id *)&v18->_variantID, a6);
    objc_storeStrong((id *)&v18->_eligibility, a7);
    objc_storeStrong((id *)&v18->_message, a8);
  }

  return v18;
}

+ (id)eventWithTipID:(id)a3 correlationID:(id)a4 collectionID:(id)a5 variantID:(id)a6 message:(id)a7 isEligible:(BOOL)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = (__CFString *)a5;
  id v17 = a6;
  v18 = (__CFString *)a7;
  objc_super v19 = v18;
  if (a8)
  {
    id v20 = @"eligible";
  }
  else if ([(__CFString *)v18 length])
  {
    id v20 = @"ineligible";
  }
  else
  {
    id v20 = @"ineligible - with correlating tip";
  }
  if ([(__CFString *)v19 length]) {
    id v21 = v19;
  }
  else {
    id v21 = @"n/a";
  }
  id v22 = v21;
  if ([(__CFString *)v16 length]) {
    id v23 = v16;
  }
  else {
    id v23 = @"n/a";
  }
  objc_super v24 = v23;
  v25 = (void *)[objc_alloc((Class)a1) _initWithTipID:v14 correlationID:v15 collectionID:v24 variantID:v17 eligibility:v20 message:v22];

  return v25;
}

+ (id)eventWithTipID:(id)a3 invalidVariantID:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (void *)[objc_alloc((Class)a1) _initWithTipID:@"n/a" correlationID:@"n/a" collectionID:@"n/a" variantID:v5 eligibility:@"ineligible - invalid URL" message:@"ineligible - invalid URL"];

  return v6;
}

- (id)eventName
{
  return (id)[NSString stringWithFormat:@"%@.%@", @"com.apple.tips", @"tip_shared"];
}

- (id)mutableAnalyticsEventRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(TPSAnalyticsEventSharedTipDisplayed *)self tipID];
  [v3 setObject:v4 forKeyedSubscript:@"tip_ID"];

  id v5 = [(TPSAnalyticsEventSharedTipDisplayed *)self correlationID];
  [v3 setObject:v5 forKeyedSubscript:@"tip_correlation_ID"];

  uint64_t v6 = [(TPSAnalyticsEventSharedTipDisplayed *)self collectionID];
  [v3 setObject:v6 forKeyedSubscript:@"collection_ID"];

  v7 = [(TPSAnalyticsEventSharedTipDisplayed *)self variantID];
  [v3 setObject:v7 forKeyedSubscript:@"tip_variant_ID"];

  uint64_t v8 = [(TPSAnalyticsEventSharedTipDisplayed *)self eligibility];
  [v3 setObject:v8 forKeyedSubscript:@"eligibility"];

  v9 = [(TPSAnalyticsEventSharedTipDisplayed *)self message];
  [v3 setObject:v9 forKeyedSubscript:@"message"];

  return v3;
}

- (NSString)tipID
{
  return self->_tipID;
}

- (void)setTipID:(id)a3
{
}

- (NSString)correlationID
{
  return self->_correlationID;
}

- (void)setCorrelationID:(id)a3
{
}

- (NSString)collectionID
{
  return self->_collectionID;
}

- (void)setCollectionID:(id)a3
{
}

- (NSString)variantID
{
  return self->_variantID;
}

- (void)setVariantID:(id)a3
{
}

- (NSString)eligibility
{
  return self->_eligibility;
}

- (void)setEligibility:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_eligibility, 0);
  objc_storeStrong((id *)&self->_variantID, 0);
  objc_storeStrong((id *)&self->_collectionID, 0);
  objc_storeStrong((id *)&self->_correlationID, 0);
  objc_storeStrong((id *)&self->_tipID, 0);
}

@end