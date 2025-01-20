@interface TPSAnalyticsEvent
+ (BOOL)supportsSecureCoding;
- (NSDate)date;
- (NSString)deliveryInfoVersion;
- (TPSAnalyticsDataProvider)dataProvider;
- (TPSAnalyticsEvent)initWithCoder:(id)a3;
- (TPSAnalyticsEvent)initWithDate:(id)a3;
- (id)analyticsEventRepresentation;
- (id)eventName;
- (id)mutableAnalyticsEventRepresentation;
- (void)encodeWithCoder:(id)a3;
- (void)log;
- (void)setDataProvider:(id)a3;
- (void)setDate:(id)a3;
- (void)setDeliveryInfoVersion:(id)a3;
@end

@implementation TPSAnalyticsEvent

- (NSString)deliveryInfoVersion
{
  return self->_deliveryInfoVersion;
}

- (void)log
{
  id v3 = +[TPSAnalyticsEventController sharedInstance];
  [v3 logAnalyticsEvent:self];
}

- (void)setDataProvider:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataProvider);

  id v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dataProvider, obj);
    deliveryInfoVersion = self->_deliveryInfoVersion;
    if (deliveryInfoVersion)
    {
      v8 = deliveryInfoVersion;
      v9 = self->_deliveryInfoVersion;
      self->_deliveryInfoVersion = v8;
    }
    else
    {
      v9 = [(TPSAnalyticsEvent *)self dataProvider];
      v10 = [v9 deliveryInfoVersion];
      v11 = self->_deliveryInfoVersion;
      self->_deliveryInfoVersion = v10;
    }
    id v6 = obj;
  }
  MEMORY[0x1F41817F8](v5, v6);
}

- (TPSAnalyticsDataProvider)dataProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataProvider);
  return (TPSAnalyticsDataProvider *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deliveryInfoVersion, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_destroyWeak((id *)&self->_dataProvider);
}

- (TPSAnalyticsEvent)initWithDate:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TPSAnalyticsEvent;
  uint64_t v5 = [(TPSAnalyticsEvent *)&v7 init];
  if (v5)
  {
    if (!v4)
    {
      id v4 = [MEMORY[0x1E4F1C9C8] date];
    }
    objc_storeStrong((id *)&v5->_date, v4);
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)analyticsEventRepresentation
{
  v2 = [(TPSAnalyticsEvent *)self mutableAnalyticsEventRepresentation];
  id v3 = (void *)[v2 copy];

  return v3;
}

- (TPSAnalyticsEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSAnalyticsEvent;
  uint64_t v5 = [(TPSAnalyticsEvent *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
    date = v5->_date;
    v5->_date = (NSDate *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (void)setDeliveryInfoVersion:(id)a3
{
}

- (id)eventName
{
  return &stru_1EED877F8;
}

- (id)mutableAnalyticsEventRepresentation
{
  return 0;
}

@end