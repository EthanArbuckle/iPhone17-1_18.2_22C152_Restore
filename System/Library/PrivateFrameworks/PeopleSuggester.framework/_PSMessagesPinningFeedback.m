@interface _PSMessagesPinningFeedback
+ (BOOL)supportsSecureCoding;
+ (id)acceptedWithActualPinnings:(id)a3 OnboardingSuggestions:(id)a4;
+ (id)pinsChangedWithNowCurrentPins:(id)a3;
+ (id)skipOnboardingWithOnboardingSuggestions:(id)a3;
- (NSArray)actualPinnings;
- (NSArray)onboardingSuggestions;
- (NSDate)eventDate;
- (NSString)trialId;
- (_PSMessagesPinningFeedback)initWithAction:(int64_t)a3 actualPinnings:(id)a4 onboardingSuggestions:(id)a5 trialId:(id)a6 eventDate:(id)a7;
- (_PSMessagesPinningFeedback)initWithCoder:(id)a3;
- (int64_t)actionType;
- (int64_t)interactionMethod;
- (void)encodeWithCoder:(id)a3;
- (void)setActionType:(int64_t)a3;
- (void)setInteractionMethod:(int64_t)a3;
- (void)setTrialId:(id)a3;
@end

@implementation _PSMessagesPinningFeedback

+ (id)skipOnboardingWithOnboardingSuggestions:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  v6 = [v4 date];
  v7 = (void *)[objc_alloc((Class)a1) initWithAction:0 actualPinnings:0 onboardingSuggestions:v5 trialId:0 eventDate:v6];

  return v7;
}

+ (id)acceptedWithActualPinnings:(id)a3 OnboardingSuggestions:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F1C9C8];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 date];
  v10 = (void *)[objc_alloc((Class)a1) initWithAction:1 actualPinnings:v8 onboardingSuggestions:v7 trialId:0 eventDate:v9];

  return v10;
}

+ (id)pinsChangedWithNowCurrentPins:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  v6 = [v4 date];
  id v7 = (void *)[objc_alloc((Class)a1) initWithAction:2 actualPinnings:v5 onboardingSuggestions:0 trialId:0 eventDate:v6];

  return v7;
}

- (_PSMessagesPinningFeedback)initWithAction:(int64_t)a3 actualPinnings:(id)a4 onboardingSuggestions:(id)a5 trialId:(id)a6 eventDate:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)_PSMessagesPinningFeedback;
  v17 = [(_PSMessagesPinningFeedback *)&v20 init];
  v18 = v17;
  if (v17)
  {
    v17->_actionType = a3;
    objc_storeStrong((id *)&v17->_actualPinnings, a4);
    objc_storeStrong((id *)&v18->_onboardingSuggestions, a5);
    objc_storeStrong((id *)&v18->_trialId, a6);
    objc_storeStrong((id *)&v18->_eventDate, a7);
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_PSMessagesPinningFeedback)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_PSMessagesPinningFeedback;
  id v5 = [(_PSMessagesPinningFeedback *)&v21 init];
  if (v5)
  {
    v5->_actionType = [v4 decodeIntegerForKey:@"actionType"];
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"_actualPinnings"];
    actualPinnings = v5->_actualPinnings;
    v5->_actualPinnings = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    id v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"onboardingSuggestions"];
    onboardingSuggestions = v5->_onboardingSuggestions;
    v5->_onboardingSuggestions = (NSArray *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"trialId"];
    trialId = v5->_trialId;
    v5->_trialId = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eventDate"];
    eventDate = v5->_eventDate;
    v5->_eventDate = (NSDate *)v18;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t actionType = self->_actionType;
  id v5 = a3;
  [v5 encodeInteger:actionType forKey:@"actionType"];
  [v5 encodeObject:self->_actualPinnings forKey:@"_actualPinnings"];
  [v5 encodeObject:self->_onboardingSuggestions forKey:@"onboardingSuggestions"];
  [v5 encodeObject:self->_trialId forKey:@"trialId"];
  [v5 encodeObject:self->_eventDate forKey:@"eventDate"];
}

- (int64_t)actionType
{
  return self->_actionType;
}

- (void)setActionType:(int64_t)a3
{
  self->_int64_t actionType = a3;
}

- (int64_t)interactionMethod
{
  return self->_interactionMethod;
}

- (void)setInteractionMethod:(int64_t)a3
{
  self->_interactionMethod = a3;
}

- (NSArray)onboardingSuggestions
{
  return self->_onboardingSuggestions;
}

- (NSArray)actualPinnings
{
  return self->_actualPinnings;
}

- (NSString)trialId
{
  return self->_trialId;
}

- (void)setTrialId:(id)a3
{
}

- (NSDate)eventDate
{
  return self->_eventDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventDate, 0);
  objc_storeStrong((id *)&self->_trialId, 0);
  objc_storeStrong((id *)&self->_actualPinnings, 0);

  objc_storeStrong((id *)&self->_onboardingSuggestions, 0);
}

@end