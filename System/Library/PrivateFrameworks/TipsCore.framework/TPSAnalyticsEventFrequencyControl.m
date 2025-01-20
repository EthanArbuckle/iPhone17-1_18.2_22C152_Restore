@interface TPSAnalyticsEventFrequencyControl
+ (BOOL)supportsSecureCoding;
- (NSNumber)displayCount;
- (NSNumber)notDisplayedDueToFrequencyControlCount;
- (NSString)displayType;
- (NSString)experimentCampID;
- (NSString)experimentID;
- (TPSAnalyticsEventFrequencyControl)initWithCoder:(id)a3;
- (TPSAnalyticsEventFrequencyControl)initWithDisplayType:(id)a3 displayCount:(id)a4 notDisplayedDueToFrequencyControlCount:(id)a5;
- (id)eventName;
- (id)mutableAnalyticsEventRepresentation;
- (void)encodeWithCoder:(id)a3;
- (void)setDataProvider:(id)a3;
- (void)setDisplayCount:(id)a3;
- (void)setDisplayType:(id)a3;
- (void)setExperimentCampID:(id)a3;
- (void)setExperimentID:(id)a3;
- (void)setNotDisplayedDueToFrequencyControlCount:(id)a3;
@end

@implementation TPSAnalyticsEventFrequencyControl

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSAnalyticsEventFrequencyControl)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)TPSAnalyticsEventFrequencyControl;
  v5 = [(TPSAnalyticsEvent *)&v17 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shown_count"];
    displayCount = v5->_displayCount;
    v5->_displayCount = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"not_shown_due_to_frequency_control_count"];
    notDisplayedDueToFrequencyControlCount = v5->_notDisplayedDueToFrequencyControlCount;
    v5->_notDisplayedDueToFrequencyControlCount = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"experiment_ID"];
    experimentID = v5->_experimentID;
    v5->_experimentID = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"display_type"];
    displayType = v5->_displayType;
    v5->_displayType = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"experiment_camp_ID"];
    experimentCampID = v5->_experimentCampID;
    v5->_experimentCampID = (NSString *)v14;
  }
  return v5;
}

- (TPSAnalyticsEventFrequencyControl)initWithDisplayType:(id)a3 displayCount:(id)a4 notDisplayedDueToFrequencyControlCount:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TPSAnalyticsEventFrequencyControl;
  uint64_t v12 = [(TPSAnalyticsEvent *)&v15 initWithDate:0];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_displayType, a3);
    objc_storeStrong((id *)&v13->_displayCount, a4);
    objc_storeStrong((id *)&v13->_notDisplayedDueToFrequencyControlCount, a5);
  }

  return v13;
}

- (void)setDataProvider:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)TPSAnalyticsEventFrequencyControl;
  [(TPSAnalyticsEvent *)&v14 setDataProvider:a3];
  experimentID = self->_experimentID;
  if (experimentID)
  {
    v5 = experimentID;
    uint64_t v6 = self->_experimentID;
    self->_experimentID = v5;
  }
  else
  {
    uint64_t v6 = [(TPSAnalyticsEvent *)self dataProvider];
    v7 = [v6 experimentID];
    uint64_t v8 = self->_experimentID;
    self->_experimentID = v7;
  }
  experimentCampID = self->_experimentCampID;
  if (experimentCampID)
  {
    id v10 = experimentCampID;
    id v11 = self->_experimentCampID;
    self->_experimentCampID = v10;
  }
  else
  {
    id v11 = [(TPSAnalyticsEvent *)self dataProvider];
    uint64_t v12 = [v11 experimentCampID];
    v13 = self->_experimentCampID;
    self->_experimentCampID = v12;
  }
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TPSAnalyticsEventFrequencyControl;
  id v4 = a3;
  [(TPSAnalyticsEvent *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_displayCount, @"shown_count", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_notDisplayedDueToFrequencyControlCount forKey:@"not_shown_due_to_frequency_control_count"];
  [v4 encodeObject:self->_experimentID forKey:@"experiment_ID"];
  [v4 encodeObject:self->_displayType forKey:@"display_type"];
  [v4 encodeObject:self->_experimentCampID forKey:@"experiment_camp_ID"];
}

- (id)eventName
{
  return (id)[NSString stringWithFormat:@"%@.%@", @"com.apple.tips", @"frequency_control_calculation"];
}

- (id)mutableAnalyticsEventRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [v3 setObject:self->_displayCount forKeyedSubscript:@"shown_count"];
  [v3 setObject:self->_notDisplayedDueToFrequencyControlCount forKeyedSubscript:@"not_shown_due_to_frequency_control_count"];
  [v3 setObject:self->_experimentID forKeyedSubscript:@"experiment_ID"];
  [v3 setObject:self->_displayType forKeyedSubscript:@"display_type"];
  [v3 setObject:self->_experimentCampID forKeyedSubscript:@"experiment_camp_ID"];
  return v3;
}

- (NSString)displayType
{
  return self->_displayType;
}

- (void)setDisplayType:(id)a3
{
}

- (NSNumber)displayCount
{
  return self->_displayCount;
}

- (void)setDisplayCount:(id)a3
{
}

- (NSNumber)notDisplayedDueToFrequencyControlCount
{
  return self->_notDisplayedDueToFrequencyControlCount;
}

- (void)setNotDisplayedDueToFrequencyControlCount:(id)a3
{
}

- (NSString)experimentID
{
  return self->_experimentID;
}

- (void)setExperimentID:(id)a3
{
}

- (NSString)experimentCampID
{
  return self->_experimentCampID;
}

- (void)setExperimentCampID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_experimentCampID, 0);
  objc_storeStrong((id *)&self->_experimentID, 0);
  objc_storeStrong((id *)&self->_notDisplayedDueToFrequencyControlCount, 0);
  objc_storeStrong((id *)&self->_displayCount, 0);
  objc_storeStrong((id *)&self->_displayType, 0);
}

@end