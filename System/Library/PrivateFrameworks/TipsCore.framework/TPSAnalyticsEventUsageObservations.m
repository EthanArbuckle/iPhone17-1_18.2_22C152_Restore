@interface TPSAnalyticsEventUsageObservations
+ (BOOL)supportsSecureCoding;
+ (id)eventWithEventID:(id)a3 eventCount:(id)a4;
- (NSNumber)eventCount;
- (NSString)eventID;
- (NSString)experimentCampID;
- (NSString)experimentID;
- (TPSAnalyticsEventUsageObservations)initWithCoder:(id)a3;
- (id)_initWithEventID:(id)a3 eventCount:(id)a4;
- (id)eventName;
- (id)mutableAnalyticsEventRepresentation;
- (void)encodeWithCoder:(id)a3;
- (void)setDataProvider:(id)a3;
- (void)setEventCount:(id)a3;
- (void)setEventID:(id)a3;
@end

@implementation TPSAnalyticsEventUsageObservations

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSAnalyticsEventUsageObservations)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TPSAnalyticsEventUsageObservations;
  v5 = [(TPSAnalyticsEvent *)&v15 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"event_ID"];
    eventID = v5->_eventID;
    v5->_eventID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"event_count"];
    eventCount = v5->_eventCount;
    v5->_eventCount = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"experiment_ID"];
    experimentID = v5->_experimentID;
    v5->_experimentID = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"experiment_camp_ID"];
    experimentCampID = v5->_experimentCampID;
    v5->_experimentCampID = (NSString *)v12;
  }
  return v5;
}

- (id)_initWithEventID:(id)a3 eventCount:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TPSAnalyticsEventUsageObservations;
  v9 = [(TPSAnalyticsEvent *)&v12 initWithDate:0];
  p_isa = (id *)&v9->super.super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_eventID, a3);
    objc_storeStrong(p_isa + 5, a4);
  }

  return p_isa;
}

+ (id)eventWithEventID:(id)a3 eventCount:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) _initWithEventID:v7 eventCount:v6];

  return v8;
}

- (void)setDataProvider:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)TPSAnalyticsEventUsageObservations;
  [(TPSAnalyticsEvent *)&v14 setDataProvider:a3];
  experimentID = self->_experimentID;
  if (experimentID)
  {
    v5 = experimentID;
    id v6 = self->_experimentID;
    self->_experimentID = v5;
  }
  else
  {
    id v6 = [(TPSAnalyticsEvent *)self dataProvider];
    id v7 = [v6 experimentID];
    id v8 = self->_experimentID;
    self->_experimentID = v7;
  }
  experimentCampID = self->_experimentCampID;
  if (experimentCampID)
  {
    uint64_t v10 = experimentCampID;
    v11 = self->_experimentCampID;
    self->_experimentCampID = v10;
  }
  else
  {
    v11 = [(TPSAnalyticsEvent *)self dataProvider];
    objc_super v12 = [v11 experimentCampID];
    v13 = self->_experimentCampID;
    self->_experimentCampID = v12;
  }
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TPSAnalyticsEventUsageObservations;
  id v4 = a3;
  [(TPSAnalyticsEvent *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_eventID, @"event_ID", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_eventCount forKey:@"event_count"];
  [v4 encodeObject:self->_experimentID forKey:@"experiment_ID"];
  [v4 encodeObject:self->_experimentCampID forKey:@"experiment_camp_ID"];
}

- (id)eventName
{
  return (id)[NSString stringWithFormat:@"%@.%@", @"com.apple.tips", @"event_observations"];
}

- (id)mutableAnalyticsEventRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [v3 setObject:self->_eventID forKeyedSubscript:@"event_ID"];
  [v3 setObject:self->_eventCount forKeyedSubscript:@"event_count"];
  [v3 setObject:self->_experimentID forKeyedSubscript:@"experiment_ID"];
  [v3 setObject:self->_experimentCampID forKeyedSubscript:@"experiment_camp_ID"];
  return v3;
}

- (NSString)eventID
{
  return self->_eventID;
}

- (void)setEventID:(id)a3
{
}

- (NSNumber)eventCount
{
  return self->_eventCount;
}

- (void)setEventCount:(id)a3
{
}

- (NSString)experimentID
{
  return self->_experimentID;
}

- (NSString)experimentCampID
{
  return self->_experimentCampID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_experimentCampID, 0);
  objc_storeStrong((id *)&self->_experimentID, 0);
  objc_storeStrong((id *)&self->_eventCount, 0);
  objc_storeStrong((id *)&self->_eventID, 0);
}

@end