@interface TPSAnalyticsEventProcessedUsageEvents
+ (BOOL)supportsSecureCoding;
- (BOOL)overrideHoldout;
- (BOOL)postHintRangeOutOfBounds;
- (BOOL)preHintRangeOutOfBounds;
- (NSDate)firstShownDate;
- (NSDate)notifiedDate;
- (NSString)identifier;
- (TPSAnalyticsEventProcessedUsageEvents)initWithCoder:(id)a3;
- (TPSAnalyticsEventProcessedUsageEvents)initWithUsageInfo:(id)a3 experiment:(id)a4 preHintUsageCount:(unint64_t)a5 postHintUsageCount:(unint64_t)a6 preHintRangeOutOfBounds:(BOOL)a7 postHintRangeOutOfBounds:(BOOL)a8 date:(id)a9;
- (TPSExperiment)experiment;
- (id)eventName;
- (id)mutableAnalyticsEventRepresentation;
- (unint64_t)desiredOutcomeCount;
- (unint64_t)postHintUsageCount;
- (unint64_t)preHintUsageCount;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TPSAnalyticsEventProcessedUsageEvents

- (TPSAnalyticsEventProcessedUsageEvents)initWithUsageInfo:(id)a3 experiment:(id)a4 preHintUsageCount:(unint64_t)a5 postHintUsageCount:(unint64_t)a6 preHintRangeOutOfBounds:(BOOL)a7 postHintRangeOutOfBounds:(BOOL)a8 date:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  v26.receiver = self;
  v26.super_class = (Class)TPSAnalyticsEventProcessedUsageEvents;
  v17 = [(TPSAnalyticsEvent *)&v26 initWithDate:a9];
  if (v17)
  {
    v18 = [v15 identifier];
    uint64_t v19 = [v18 copy];
    identifier = v17->_identifier;
    v17->_identifier = (NSString *)v19;

    uint64_t v21 = [v15 firstShownDate];
    firstShownDate = v17->_firstShownDate;
    v17->_firstShownDate = (NSDate *)v21;

    uint64_t v23 = [v15 notifiedDate];
    notifiedDate = v17->_notifiedDate;
    v17->_notifiedDate = (NSDate *)v23;

    objc_storeStrong((id *)&v17->_experiment, a4);
    v17->_overrideHoldout = [v15 overrideHoldout];
    v17->_desiredOutcomeCount = [v15 desiredOutcomeCount];
    v17->_preHintUsageCount = a5;
    v17->_postHintUsageCount = a6;
    v17->_preHintRangeOutOfBounds = a7;
    v17->_postHintRangeOutOfBounds = a8;
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSAnalyticsEventProcessedUsageEvents)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TPSAnalyticsEventProcessedUsageEvents;
  v5 = [(TPSAnalyticsEvent *)&v15 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4FAF5A8]];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"first_shown_date"];
    firstShownDate = v5->_firstShownDate;
    v5->_firstShownDate = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"notified_date"];
    notifiedDate = v5->_notifiedDate;
    v5->_notifiedDate = (NSDate *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"experiment"];
    experiment = v5->_experiment;
    v5->_experiment = (TPSExperiment *)v12;

    v5->_overrideHoldout = [v4 decodeBoolForKey:@"overrideHoldout"];
    v5->_desiredOutcomeCount = [v4 decodeIntegerForKey:@"desired_outcome_count"];
    v5->_preHintUsageCount = [v4 decodeIntegerForKey:@"pre_content_view_usage_count"];
    v5->_postHintUsageCount = [v4 decodeIntegerForKey:@"post_content_view_usage_count"];
    v5->_preHintRangeOutOfBounds = [v4 decodeBoolForKey:@"pre_content_hint_range_out_of_bounds"];
    v5->_postHintRangeOutOfBounds = [v4 decodeBoolForKey:@"post_content_range_out_of_bounds"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TPSAnalyticsEventProcessedUsageEvents;
  id v4 = a3;
  [(TPSAnalyticsEvent *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_identifier, *MEMORY[0x1E4FAF5A8], v5.receiver, v5.super_class);
  [v4 encodeObject:self->_firstShownDate forKey:@"first_shown_date"];
  [v4 encodeObject:self->_notifiedDate forKey:@"notified_date"];
  [v4 encodeObject:self->_experiment forKey:@"experiment"];
  [v4 encodeBool:self->_overrideHoldout forKey:@"overrideHoldout"];
  [v4 encodeInteger:self->_desiredOutcomeCount forKey:@"desired_outcome_count"];
  [v4 encodeInteger:self->_preHintUsageCount forKey:@"pre_content_view_usage_count"];
  [v4 encodeInteger:self->_postHintUsageCount forKey:@"post_content_view_usage_count"];
  [v4 encodeBool:self->_preHintRangeOutOfBounds forKey:@"pre_content_hint_range_out_of_bounds"];
  [v4 encodeBool:self->_postHintRangeOutOfBounds forKey:@"post_content_range_out_of_bounds"];
}

- (id)eventName
{
  return (id)[NSString stringWithFormat:@"%@.%@", *MEMORY[0x1E4FAF5B0], @"processed_usage_events"];
}

- (id)mutableAnalyticsEventRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [v3 setObject:self->_identifier forKeyedSubscript:*MEMORY[0x1E4FAF5A8]];
  id v4 = NSNumber;
  [(NSDate *)self->_firstShownDate timeIntervalSince1970];
  uint64_t v6 = [v4 numberWithLongLong:llround(v5)];
  [v3 setObject:v6 forKeyedSubscript:@"first_shown_date"];

  v7 = NSNumber;
  [(NSDate *)self->_notifiedDate timeIntervalSince1970];
  v9 = [v7 numberWithLongLong:llround(v8)];
  [v3 setObject:v9 forKeyedSubscript:@"notified_date"];

  uint64_t v10 = [NSNumber numberWithUnsignedInteger:self->_desiredOutcomeCount];
  [v3 setObject:v10 forKeyedSubscript:@"desired_outcome_count"];

  v11 = [NSNumber numberWithUnsignedInteger:self->_preHintUsageCount];
  [v3 setObject:v11 forKeyedSubscript:@"pre_content_view_usage_count"];

  uint64_t v12 = [NSNumber numberWithUnsignedInteger:self->_postHintUsageCount];
  [v3 setObject:v12 forKeyedSubscript:@"post_content_view_usage_count"];

  v13 = [NSNumber numberWithBool:self->_preHintRangeOutOfBounds];
  [v3 setObject:v13 forKeyedSubscript:@"pre_content_hint_range_out_of_bounds"];

  v14 = [NSNumber numberWithBool:self->_postHintRangeOutOfBounds];
  [v3 setObject:v14 forKeyedSubscript:@"post_content_range_out_of_bounds"];

  objc_super v15 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(MEMORY[0x1E4FAF3F8], "isSeniorUser"));
  [v3 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4FAF5A0]];

  experiment = self->_experiment;
  if (experiment)
  {
    v17 = objc_msgSend(NSNumber, "numberWithInteger:", -[TPSExperiment identifier](experiment, "identifier"));
    v18 = [v17 stringValue];
    [v3 setObject:v18 forKeyedSubscript:*MEMORY[0x1E4FAF598]];

    if (self->_overrideHoldout) {
      uint64_t v19 = 1;
    }
    else {
      uint64_t v19 = [(TPSExperiment *)self->_experiment camp];
    }
    v20 = [MEMORY[0x1E4FAF368] experimentCampIDStringForCamp:v19];
    [v3 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4FAF590]];
  }

  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDate)firstShownDate
{
  return self->_firstShownDate;
}

- (NSDate)notifiedDate
{
  return self->_notifiedDate;
}

- (TPSExperiment)experiment
{
  return self->_experiment;
}

- (unint64_t)desiredOutcomeCount
{
  return self->_desiredOutcomeCount;
}

- (unint64_t)preHintUsageCount
{
  return self->_preHintUsageCount;
}

- (unint64_t)postHintUsageCount
{
  return self->_postHintUsageCount;
}

- (BOOL)preHintRangeOutOfBounds
{
  return self->_preHintRangeOutOfBounds;
}

- (BOOL)postHintRangeOutOfBounds
{
  return self->_postHintRangeOutOfBounds;
}

- (BOOL)overrideHoldout
{
  return self->_overrideHoldout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_experiment, 0);
  objc_storeStrong((id *)&self->_notifiedDate, 0);
  objc_storeStrong((id *)&self->_firstShownDate, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end