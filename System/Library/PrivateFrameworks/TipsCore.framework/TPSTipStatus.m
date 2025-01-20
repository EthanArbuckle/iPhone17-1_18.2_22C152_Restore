@interface TPSTipStatus
+ (BOOL)supportsSecureCoding;
+ (NSSet)_userInfoClasses;
- (BOOL)isContentViewed;
- (BOOL)isDesiredOutcomePerformed;
- (BOOL)isExpired;
- (BOOL)isHintDismissed;
- (BOOL)isHintDisplayed;
- (BOOL)isHintDisplayedOnAnyDevice;
- (BOOL)isHintDisplayedOnCloudDevices;
- (BOOL)isHintInelgibile;
- (BOOL)isPreconditionMatched;
- (BOOL)isUserKnew;
- (BOOL)overrideFrequencyControl;
- (BOOL)overrideHoldout;
- (BOOL)reenrollIfAllowed;
- (NSArray)desiredOutcomePerformedDates;
- (NSArray)hintDisplayedDates;
- (NSArray)hintNotDisplayedDueToFrequencyControlDates;
- (NSDate)contentViewedDate;
- (NSDate)dateForTriggerRestartTracking;
- (NSDate)hintDismissalDate;
- (NSDate)hintEligibleDate;
- (NSDate)hintWouldHaveBeenDisplayedDate;
- (NSDate)savedDate;
- (NSDictionary)userInfo;
- (NSString)clonedFromIdentifier;
- (NSString)correlationIdentifier;
- (NSString)identifier;
- (NSString)lastDisplayContext;
- (NSString)lastUsedVersion;
- (NSString)modelVersion;
- (NSString)variantIdentifier;
- (TPSTipStatus)initWithCoder:(id)a3;
- (TPSTipStatus)initWithIdentifier:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (int64_t)compare:(id)a3;
- (int64_t)hintIneligibleReason;
- (unint64_t)displayType;
- (unint64_t)usageFlags;
- (void)addDesiredOutcomePerformedDate:(id)a3;
- (void)addHintDisplayedDate:(id)a3;
- (void)addHintNotDisplayedDueToFrequencyControlDate:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)removeHintEligibleDateStatus;
- (void)removeUserInfo;
- (void)setClonedFromIdentifier:(id)a3;
- (void)setContentViewedDate:(id)a3;
- (void)setCorrelationIdentifier:(id)a3;
- (void)setDateForTriggerRestartTracking:(id)a3;
- (void)setDesiredOutcomePerformedDates:(id)a3;
- (void)setDisplayType:(unint64_t)a3;
- (void)setExpired:(BOOL)a3;
- (void)setHintDismissalDate:(id)a3;
- (void)setHintDisplayedDates:(id)a3;
- (void)setHintEligibleDate:(id)a3;
- (void)setHintIneligibleReason:(int64_t)a3;
- (void)setHintNotDisplayedDueToFrequencyControlDates:(id)a3;
- (void)setHintWouldHaveBeenDisplayedDate:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLastDisplayContext:(id)a3;
- (void)setLastUsedVersion:(id)a3;
- (void)setModelVersion:(id)a3;
- (void)setOverrideFrequencyControl:(BOOL)a3;
- (void)setOverrideHoldout:(BOOL)a3;
- (void)setPreconditionMatched:(BOOL)a3;
- (void)setSavedDate:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)setVariantIdentifier:(id)a3;
- (void)updateUserInfoValue:(id)a3 forKey:(id)a4;
@end

@implementation TPSTipStatus

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewedDate, 0);
  objc_storeStrong((id *)&self->_hintDismissalDate, 0);
  objc_storeStrong((id *)&self->_hintWouldHaveBeenDisplayedDate, 0);
  objc_storeStrong((id *)&self->_hintEligibleDate, 0);
  objc_storeStrong((id *)&self->_dateForTriggerRestartTracking, 0);
  objc_storeStrong((id *)&self->_lastUsedVersion, 0);
  objc_storeStrong((id *)&self->_modelVersion, 0);
  objc_storeStrong((id *)&self->_clonedFromIdentifier, 0);
  objc_storeStrong((id *)&self->_correlationIdentifier, 0);
  objc_storeStrong((id *)&self->_variantIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_savedDate, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_hintNotDisplayedDueToFrequencyControlDates, 0);
  objc_storeStrong((id *)&self->_desiredOutcomePerformedDates, 0);
  objc_storeStrong((id *)&self->_hintDisplayedDates, 0);
  objc_storeStrong((id *)&self->_lastDisplayContext, 0);
}

- (void)encodeWithCoder:(id)a3
{
  int64_t hintIneligibleReason = self->_hintIneligibleReason;
  id v5 = a3;
  [v5 encodeInteger:hintIneligibleReason forKey:@"hintIneligibleReason"];
  [v5 encodeInteger:self->_displayType forKey:@"displayType"];
  [v5 encodeBool:self->_preconditionMatched forKey:@"preconditionMatched"];
  [v5 encodeBool:self->_expired forKey:@"expired"];
  [v5 encodeBool:self->_overrideHoldout forKey:@"overrideHoldout"];
  [v5 encodeBool:self->_overrideFrequencyControl forKey:@"overrideFrequencyControl"];
  [v5 encodeObject:self->_identifier forKey:@"identifier"];
  [v5 encodeObject:self->_variantIdentifier forKey:@"variantIdentifier"];
  [v5 encodeObject:self->_correlationIdentifier forKey:@"correlationIdentifier"];
  [v5 encodeObject:self->_clonedFromIdentifier forKey:@"clonedFromIdentifier"];
  [v5 encodeObject:self->_modelVersion forKey:@"modelVersion"];
  [v5 encodeObject:self->_lastUsedVersion forKey:@"lastUsedVersion"];
  [v5 encodeObject:self->_hintEligibleDate forKey:@"hintEligibleDate"];
  [v5 encodeObject:self->_lastDisplayContext forKey:@"lastDisplayContext"];
  [v5 encodeObject:self->_hintWouldHaveBeenDisplayedDate forKey:@"hintWouldHaveBeenDisplayedDate"];
  [v5 encodeObject:self->_hintDismissalDate forKey:@"hintDismissalDate"];
  [v5 encodeObject:self->_contentViewedDate forKey:@"contentViewedDate"];
  [v5 encodeObject:self->_dateForTriggerRestartTracking forKey:@"dateForTriggerRestartTracking"];
  [v5 encodeObject:self->_savedDate forKey:@"savedDate"];
  v6 = (void *)[(NSMutableArray *)self->_hintDisplayedDates copy];
  [v5 encodeObject:v6 forKey:@"hintDisplayedDates"];

  v7 = (void *)[(NSMutableArray *)self->_desiredOutcomePerformedDates copy];
  [v5 encodeObject:v7 forKey:@"desiredOutcomePerformedDates"];

  v8 = (void *)[(NSMutableArray *)self->_hintNotDisplayedDueToFrequencyControlDates copy];
  [v5 encodeObject:v8 forKey:@"hintNotDisplayedDueToFrequencyControlDates"];

  id v9 = (id)[(NSMutableDictionary *)self->_userInfo copy];
  [v5 encodeObject:v9 forKey:@"userInfo"];
}

- (TPSTipStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  v54.receiver = self;
  v54.super_class = (Class)TPSTipStatus;
  id v5 = [(TPSTipStatus *)&v54 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeIntegerForKey:@"displayType"];
    if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v7 = 0;
    }
    else {
      unint64_t v7 = v6;
    }
    v5->_displayType = v7;
    uint64_t v8 = [v4 decodeIntegerForKey:@"hintIneligibleReason"];
    if (v8 <= 22) {
      int64_t v9 = v8;
    }
    else {
      int64_t v9 = 0;
    }
    v5->_int64_t hintIneligibleReason = v9;
    v5->_preconditionMatched = [v4 decodeBoolForKey:@"preconditionMatched"];
    v5->_expired = [v4 decodeBoolForKey:@"expired"];
    v5->_overrideHoldout = [v4 decodeBoolForKey:@"overrideHoldout"];
    v5->_overrideFrequencyControl = [v4 decodeBoolForKey:@"overrideFrequencyControl"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"variantIdentifier"];
    variantIdentifier = v5->_variantIdentifier;
    v5->_variantIdentifier = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"correlationIdentifier"];
    correlationIdentifier = v5->_correlationIdentifier;
    v5->_correlationIdentifier = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clonedFromIdentifier"];
    clonedFromIdentifier = v5->_clonedFromIdentifier;
    v5->_clonedFromIdentifier = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modelVersion"];
    modelVersion = v5->_modelVersion;
    v5->_modelVersion = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastUsedVersion"];
    lastUsedVersion = v5->_lastUsedVersion;
    v5->_lastUsedVersion = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastDisplayContext"];
    lastDisplayContext = v5->_lastDisplayContext;
    v5->_lastDisplayContext = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hintEligibleDate"];
    hintEligibleDate = v5->_hintEligibleDate;
    v5->_hintEligibleDate = (NSDate *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hintWouldHaveBeenDisplayedDate"];
    hintWouldHaveBeenDisplayedDate = v5->_hintWouldHaveBeenDisplayedDate;
    v5->_hintWouldHaveBeenDisplayedDate = (NSDate *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hintDismissalDate"];
    hintDismissalDate = v5->_hintDismissalDate;
    v5->_hintDismissalDate = (NSDate *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contentViewedDate"];
    contentViewedDate = v5->_contentViewedDate;
    v5->_contentViewedDate = (NSDate *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"savedDate"];
    savedDate = v5->_savedDate;
    v5->_savedDate = (NSDate *)v32;

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateForTriggerRestartTracking"];
    dateForTriggerRestartTracking = v5->_dateForTriggerRestartTracking;
    v5->_dateForTriggerRestartTracking = (NSDate *)v34;

    if ([MEMORY[0x1E4F1C9C8] isDateExpired:v5->_dateForTriggerRestartTracking maxTimeInterval:-2160000.0])
    {
      v36 = v5->_dateForTriggerRestartTracking;
      v5->_dateForTriggerRestartTracking = 0;
    }
    v37 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v38 = objc_opt_class();
    v39 = objc_msgSend(v37, "setWithObjects:", v38, objc_opt_class(), 0);
    v40 = [v4 decodeObjectOfClasses:v39 forKey:@"desiredOutcomePerformedDates"];
    if ([v40 count])
    {
      uint64_t v41 = [MEMORY[0x1E4F1CA48] arrayWithArray:v40];
      desiredOutcomePerformedDates = v5->_desiredOutcomePerformedDates;
      v5->_desiredOutcomePerformedDates = (NSMutableArray *)v41;
    }
    v43 = [v4 decodeObjectOfClasses:v39 forKey:@"hintDisplayedDates"];
    if ([v43 count])
    {
      uint64_t v44 = [MEMORY[0x1E4F1CA48] arrayWithArray:v43];
      hintDisplayedDates = v5->_hintDisplayedDates;
      v5->_hintDisplayedDates = (NSMutableArray *)v44;
    }
    v46 = [v4 decodeObjectOfClasses:v39 forKey:@"hintNotDisplayedDueToFrequencyControlDates"];
    if ([v46 count])
    {
      uint64_t v47 = [MEMORY[0x1E4F1CA48] arrayWithArray:v46];
      hintNotDisplayedDueToFrequencyControlDates = v5->_hintNotDisplayedDueToFrequencyControlDates;
      v5->_hintNotDisplayedDueToFrequencyControlDates = (NSMutableArray *)v47;
    }
    v49 = [(id)objc_opt_class() _userInfoClasses];
    v50 = [v4 decodeObjectOfClasses:v49 forKey:@"userInfo"];

    if ([v50 count])
    {
      uint64_t v51 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v50];
      userInfo = v5->_userInfo;
      v5->_userInfo = (NSMutableDictionary *)v51;
    }
  }

  return v5;
}

+ (NSSet)_userInfoClasses
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  return (NSSet *)objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, objc_opt_class(), 0);
}

- (NSString)correlationIdentifier
{
  return self->_correlationIdentifier;
}

- (NSDate)savedDate
{
  return self->_savedDate;
}

- (unint64_t)displayType
{
  return self->_displayType;
}

- (BOOL)isUserKnew
{
  uint64_t v3 = [(NSMutableArray *)self->_desiredOutcomePerformedDates firstObject];
  if (v3)
  {
    uint64_t v4 = [(NSMutableArray *)self->_hintDisplayedDates firstObject];
    uint64_t v5 = v4;
    if (v4 && [v4 compare:self->_contentViewedDate] == -1)
    {
      uint64_t v6 = v5;
    }
    else
    {
      uint64_t v6 = self->_contentViewedDate;
      if (!v6)
      {
        BOOL v7 = 1;
LABEL_9:

        goto LABEL_10;
      }
    }
    BOOL v7 = [v3 compare:v6] == -1;

    goto LABEL_9;
  }
  BOOL v7 = 0;
LABEL_10:

  return v7;
}

- (NSDate)hintEligibleDate
{
  return self->_hintEligibleDate;
}

- (BOOL)isDesiredOutcomePerformed
{
  v2 = [(TPSTipStatus *)self desiredOutcomePerformedDates];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)isHintDisplayed
{
  v2 = [(TPSTipStatus *)self hintDisplayedDates];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (NSArray)hintDisplayedDates
{
  if (self->_hintDisplayedDates)
  {
    v2 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithArray:");
  }
  else
  {
    v2 = 0;
  }
  return (NSArray *)v2;
}

- (NSArray)desiredOutcomePerformedDates
{
  if (self->_desiredOutcomePerformedDates)
  {
    v2 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithArray:");
  }
  else
  {
    v2 = 0;
  }
  return (NSArray *)v2;
}

- (NSDate)hintDismissalDate
{
  return self->_hintDismissalDate;
}

- (NSDate)contentViewedDate
{
  return self->_contentViewedDate;
}

- (BOOL)isExpired
{
  return self->_expired;
}

- (NSString)lastUsedVersion
{
  return self->_lastUsedVersion;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  [v4 setDisplayType:self->_displayType];
  [v4 setPreconditionMatched:self->_preconditionMatched];
  [v4 setExpired:self->_expired];
  [v4 setHintIneligibleReason:self->_hintIneligibleReason];
  [v4 setOverrideHoldout:self->_overrideHoldout];
  [v4 setOverrideFrequencyControl:self->_overrideFrequencyControl];
  [v4 setIdentifier:self->_identifier];
  [v4 setVariantIdentifier:self->_variantIdentifier];
  [v4 setCorrelationIdentifier:self->_correlationIdentifier];
  [v4 setClonedFromIdentifier:self->_clonedFromIdentifier];
  [v4 setModelVersion:self->_modelVersion];
  [v4 setLastUsedVersion:self->_lastUsedVersion];
  [v4 setDateForTriggerRestartTracking:self->_dateForTriggerRestartTracking];
  [v4 setHintEligibleDate:self->_hintEligibleDate];
  [v4 setLastDisplayContext:self->_lastDisplayContext];
  [v4 setHintDisplayedDates:self->_hintDisplayedDates];
  [v4 setHintWouldHaveBeenDisplayedDate:self->_hintWouldHaveBeenDisplayedDate];
  [v4 setHintDismissalDate:self->_hintDismissalDate];
  [v4 setContentViewedDate:self->_contentViewedDate];
  [v4 setDesiredOutcomePerformedDates:self->_desiredOutcomePerformedDates];
  [v4 setHintNotDisplayedDueToFrequencyControlDates:self->_hintNotDisplayedDueToFrequencyControlDates];
  [v4 setSavedDate:self->_savedDate];
  [v4 setUserInfo:self->_userInfo];
  return v4;
}

- (void)setVariantIdentifier:(id)a3
{
}

- (void)setCorrelationIdentifier:(id)a3
{
}

- (void)setClonedFromIdentifier:(id)a3
{
}

- (void)setDisplayType:(unint64_t)a3
{
  self->_displayType = a3;
}

- (void)setOverrideFrequencyControl:(BOOL)a3
{
  self->_overrideFrequencyControl = a3;
}

- (BOOL)isPreconditionMatched
{
  return self->_preconditionMatched;
}

- (void)setOverrideHoldout:(BOOL)a3
{
  self->_overrideHoldout = a3;
}

- (void)setUserInfo:(id)a3
{
  BOOL v3 = self;
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:");
    self = (TPSTipStatus *)objc_claimAutoreleasedReturnValue();
    userInfo = v3->_userInfo;
    v3->_userInfo = (NSMutableDictionary *)self;
  }
  else
  {
    userInfo = self->_userInfo;
    self->_userInfo = 0;
  }
  MEMORY[0x1F41817F8](self, userInfo);
}

- (void)setSavedDate:(id)a3
{
}

- (void)setPreconditionMatched:(BOOL)a3
{
  self->_preconditionMatched = a3;
}

- (void)setModelVersion:(id)a3
{
}

- (void)setLastUsedVersion:(id)a3
{
}

- (void)setLastDisplayContext:(id)a3
{
}

- (void)setIdentifier:(id)a3
{
}

- (void)setHintWouldHaveBeenDisplayedDate:(id)a3
{
}

- (void)setHintNotDisplayedDueToFrequencyControlDates:(id)a3
{
  BOOL v3 = self;
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithArray:");
    self = (TPSTipStatus *)objc_claimAutoreleasedReturnValue();
    hintNotDisplayedDueToFrequencyControlDates = v3->_hintNotDisplayedDueToFrequencyControlDates;
    v3->_hintNotDisplayedDueToFrequencyControlDates = (NSMutableArray *)self;
  }
  else
  {
    hintNotDisplayedDueToFrequencyControlDates = self->_hintNotDisplayedDueToFrequencyControlDates;
    self->_hintNotDisplayedDueToFrequencyControlDates = 0;
  }
  MEMORY[0x1F41817F8](self, hintNotDisplayedDueToFrequencyControlDates);
}

- (void)setHintIneligibleReason:(int64_t)a3
{
  self->_int64_t hintIneligibleReason = a3;
}

- (void)setHintEligibleDate:(id)a3
{
}

- (void)setHintDisplayedDates:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA48] arrayWithArray:v4];
    hintDisplayedDates = self->_hintDisplayedDates;
    self->_hintDisplayedDates = v5;

    if (self->_displayType == 1) {
      [(TPSTipStatus *)self removeHintEligibleDateStatus];
    }
  }
  else
  {
    BOOL v7 = self->_hintDisplayedDates;
    self->_hintDisplayedDates = 0;
  }
}

- (void)setHintDismissalDate:(id)a3
{
  uint64_t v5 = (NSDate *)a3;
  p_hintDismissalDate = &self->_hintDismissalDate;
  if (self->_hintDismissalDate != v5)
  {
    BOOL v7 = v5;
    objc_storeStrong((id *)p_hintDismissalDate, a3);
    p_hintDismissalDate = (NSDate **)[(TPSTipStatus *)self removeHintEligibleDateStatus];
    uint64_t v5 = v7;
  }
  MEMORY[0x1F41817F8](p_hintDismissalDate, v5);
}

- (void)setExpired:(BOOL)a3
{
  self->_expired = a3;
}

- (void)setDesiredOutcomePerformedDates:(id)a3
{
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithArray:");
    id v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    desiredOutcomePerformedDates = self->_desiredOutcomePerformedDates;
    self->_desiredOutcomePerformedDates = v4;

    [(TPSTipStatus *)self removeHintEligibleDateStatus];
  }
  else
  {
    uint64_t v6 = self->_desiredOutcomePerformedDates;
    self->_desiredOutcomePerformedDates = 0;
  }
}

- (void)setDateForTriggerRestartTracking:(id)a3
{
  uint64_t v5 = (NSDate *)a3;
  p_dateForTriggerRestartTracking = &self->_dateForTriggerRestartTracking;
  if (self->_dateForTriggerRestartTracking != v5)
  {
    BOOL v7 = v5;
    objc_storeStrong((id *)p_dateForTriggerRestartTracking, a3);
    p_dateForTriggerRestartTracking = (NSDate **)[(TPSTipStatus *)self removeHintEligibleDateStatus];
    uint64_t v5 = v7;
  }
  MEMORY[0x1F41817F8](p_dateForTriggerRestartTracking, v5);
}

- (void)setContentViewedDate:(id)a3
{
  uint64_t v5 = (NSDate *)a3;
  p_contentViewedDate = &self->_contentViewedDate;
  if (self->_contentViewedDate != v5)
  {
    BOOL v7 = v5;
    objc_storeStrong((id *)p_contentViewedDate, a3);
    p_contentViewedDate = (NSDate **)[(TPSTipStatus *)self removeHintEligibleDateStatus];
    uint64_t v5 = v7;
  }
  MEMORY[0x1F41817F8](p_contentViewedDate, v5);
}

- (TPSTipStatus)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TPSTipStatus;
  uint64_t v6 = [(TPSTipStatus *)&v11 init];
  BOOL v7 = v6;
  if (v6
    && (v6->_int64_t hintIneligibleReason = 0,
        objc_storeStrong((id *)&v6->_identifier, a3),
        modelVersion = v7->_modelVersion,
        v7->_modelVersion = (NSString *)@"1.0",
        modelVersion,
        ![(NSString *)v7->_identifier length]))
  {
    int64_t v9 = 0;
  }
  else
  {
    int64_t v9 = v7;
  }

  return v9;
}

- (void)removeHintEligibleDateStatus
{
  self->_hintEligibleDate = 0;
  MEMORY[0x1F41817F8]();
}

- (void)addHintDisplayedDate:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    hintDisplayedDates = self->_hintDisplayedDates;
    id v9 = v5;
    if (!hintDisplayedDates)
    {
      BOOL v7 = [MEMORY[0x1E4F1CA48] array];
      id v8 = self->_hintDisplayedDates;
      self->_hintDisplayedDates = v7;

      hintDisplayedDates = self->_hintDisplayedDates;
    }
    id v4 = (id)[(NSMutableArray *)hintDisplayedDates addObject:v9];
    id v5 = v9;
    if (self->_displayType == 1)
    {
      id v4 = (id)[(TPSTipStatus *)self removeHintEligibleDateStatus];
      id v5 = v9;
    }
  }
  MEMORY[0x1F41817F8](v4, v5);
}

- (void)addHintNotDisplayedDueToFrequencyControlDate:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    hintNotDisplayedDueToFrequencyControlDates = self->_hintNotDisplayedDueToFrequencyControlDates;
    id v9 = v5;
    if (!hintNotDisplayedDueToFrequencyControlDates)
    {
      BOOL v7 = [MEMORY[0x1E4F1CA48] array];
      id v8 = self->_hintNotDisplayedDueToFrequencyControlDates;
      self->_hintNotDisplayedDueToFrequencyControlDates = v7;

      hintNotDisplayedDueToFrequencyControlDates = self->_hintNotDisplayedDueToFrequencyControlDates;
    }
    id v4 = (id)[(NSMutableArray *)hintNotDisplayedDueToFrequencyControlDates addObject:v9];
    id v5 = v9;
  }
  MEMORY[0x1F41817F8](v4, v5);
}

- (NSArray)hintNotDisplayedDueToFrequencyControlDates
{
  if (self->_hintNotDisplayedDueToFrequencyControlDates)
  {
    v2 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithArray:");
  }
  else
  {
    v2 = 0;
  }
  return (NSArray *)v2;
}

- (void)addDesiredOutcomePerformedDate:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    desiredOutcomePerformedDates = self->_desiredOutcomePerformedDates;
    id v9 = v5;
    if (!desiredOutcomePerformedDates)
    {
      BOOL v7 = [MEMORY[0x1E4F1CA48] array];
      id v8 = self->_desiredOutcomePerformedDates;
      self->_desiredOutcomePerformedDates = v7;

      id v5 = v9;
      desiredOutcomePerformedDates = self->_desiredOutcomePerformedDates;
    }
    if (([(NSMutableArray *)desiredOutcomePerformedDates containsObject:v5] & 1) == 0) {
      [(NSMutableArray *)self->_desiredOutcomePerformedDates addObject:v9];
    }
    id v4 = (id)[(TPSTipStatus *)self removeHintEligibleDateStatus];
    id v5 = v9;
  }
  MEMORY[0x1F41817F8](v4, v5);
}

- (BOOL)reenrollIfAllowed
{
  if (self->_hintIneligibleReason != 22
    || self->_contentViewedDate
    || [(NSMutableArray *)self->_desiredOutcomePerformedDates count]
    || self->_hintDismissalDate)
  {
    return 0;
  }
  self->_int64_t hintIneligibleReason = 0;
  self->_expired = 0;
  [(TPSTipStatus *)self removeHintEligibleDateStatus];
  return 1;
}

- (unint64_t)usageFlags
{
  uint64_t v3 = [(TPSTipStatus *)self overrideHoldout];
  BOOL v4 = [(TPSTipStatus *)self overrideFrequencyControl];
  uint64_t v5 = 2;
  if (!v4) {
    uint64_t v5 = 0;
  }
  return v5 | v3;
}

- (void)updateUserInfoValue:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v6)
    {
      id v8 = [(id)objc_opt_class() _userInfoClasses];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __43__TPSTipStatus_updateUserInfoValue_forKey___block_invoke;
      v14[3] = &unk_1E5906B68;
      id v9 = v6;
      id v15 = v9;
      int v10 = objc_msgSend(v8, "na_any:", v14);

      if (v10)
      {
        userInfo = self->_userInfo;
        if (!userInfo)
        {
          uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
          v13 = self->_userInfo;
          self->_userInfo = v12;

          userInfo = self->_userInfo;
        }
        [(NSMutableDictionary *)userInfo setObject:v9 forKeyedSubscript:v7];
      }
    }
    else
    {
      [(NSMutableDictionary *)self->_userInfo setObject:0 forKeyedSubscript:v7];
    }
  }
}

uint64_t __43__TPSTipStatus_updateUserInfoValue_forKey___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

- (NSDictionary)userInfo
{
  if (self->_userInfo)
  {
    v2 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithDictionary:");
  }
  else
  {
    v2 = 0;
  }
  return (NSDictionary *)v2;
}

- (void)removeUserInfo
{
}

- (BOOL)isContentViewed
{
  v2 = [(TPSTipStatus *)self contentViewedDate];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isHintDisplayedOnCloudDevices
{
  BOOL v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
  BOOL v4 = [(TPSTipStatus *)self correlationIdentifier];
  objc_msgSend(v3, "na_safeAddObject:", v4);

  uint64_t v5 = [(TPSTipStatus *)self clonedFromIdentifier];
  objc_msgSend(v3, "na_safeAddObject:", v5);

  id v6 = [(TPSTipStatus *)self identifier];
  objc_msgSend(v3, "na_safeAddObject:", v6);

  id v7 = +[TPSCloudController sharedInstance];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __45__TPSTipStatus_isHintDisplayedOnCloudDevices__block_invoke;
  v10[3] = &unk_1E5906B90;
  id v11 = v7;
  id v8 = v7;
  LOBYTE(v5) = objc_msgSend(v3, "na_any:", v10);

  return (char)v5;
}

uint64_t __45__TPSTipStatus_isHintDisplayedOnCloudDevices__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isHintDisplayedForContentID:a2];
}

- (BOOL)isHintDisplayedOnAnyDevice
{
  if ([(TPSTipStatus *)self isHintDisplayed]) {
    return 1;
  }
  return [(TPSTipStatus *)self isHintDisplayedOnCloudDevices];
}

- (BOOL)isHintDismissed
{
  v2 = [(TPSTipStatus *)self hintDismissalDate];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isHintInelgibile
{
  return [(TPSTipStatus *)self hintIneligibleReason] != 0;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TPSTipStatus *)self savedDate];
  id v6 = [v4 savedDate];

  int64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)debugDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v19.receiver = self;
  v19.super_class = (Class)TPSTipStatus;
  id v4 = [(TPSTipStatus *)&v19 debugDescription];
  uint64_t v5 = (void *)[v3 initWithString:v4];

  [v5 appendFormat:@" {\n\t%@ = %@\n", @"identifier", self->_identifier];
  [v5 appendFormat:@"\t%@ = %@\n", @"variantIdentifier", self->_variantIdentifier];
  [v5 appendFormat:@"\t%@ = %@\n", @"correlationIdentifier", self->_correlationIdentifier];
  [v5 appendFormat:@"\t%@ = %@\n", @"clonedFromIdentifier", self->_clonedFromIdentifier];
  [v5 appendFormat:@"\t%@ = %@\n", @"modelVersion", self->_modelVersion];
  [v5 appendFormat:@"\t%@ = %@\n", @"lastUsedVersion", self->_lastUsedVersion];
  [v5 appendFormat:@"\t%@ = %zd\n", @"displayType", self->_displayType];
  if (self->_hintIneligibleReason)
  {
    id v6 = +[TPSAnalyticsCommonDefines ineligibleReasonStringForReason:](TPSAnalyticsCommonDefines, "ineligibleReasonStringForReason:");
    [v5 appendFormat:@"\t%@ = %@\n", @"hintIneligibleReason", v6];
  }
  if (self->_preconditionMatched) {
    [v5 appendFormat:@"\t%@ = %d\n", @"preconditionMatched", 1];
  }
  if (self->_expired) {
    [v5 appendFormat:@"\t%@ = %d\n", @"expired", 1];
  }
  if (self->_overrideHoldout) {
    [v5 appendFormat:@"\t%@ = %d\n", @"overrideHoldout", 1];
  }
  if (self->_overrideFrequencyControl) {
    [v5 appendFormat:@"\t%@ = %d\n", @"overrideFrequencyControl", 1];
  }
  dateForTriggerRestartTracking = self->_dateForTriggerRestartTracking;
  if (dateForTriggerRestartTracking) {
    [v5 appendFormat:@"\t%@ = %@\n", @"dateForTriggerRestartTracking", dateForTriggerRestartTracking];
  }
  hintEligibleDate = self->_hintEligibleDate;
  if (hintEligibleDate) {
    [v5 appendFormat:@"\t%@ = %@\n", @"hintEligibleDate", hintEligibleDate];
  }
  lastDisplayContext = self->_lastDisplayContext;
  if (lastDisplayContext) {
    [v5 appendFormat:@"\t%@ = %@\n", @"lastDisplayContext", lastDisplayContext];
  }
  hintWouldHaveBeenDisplayedDate = self->_hintWouldHaveBeenDisplayedDate;
  if (hintWouldHaveBeenDisplayedDate) {
    [v5 appendFormat:@"\t%@ = %@\n", @"hintWouldHaveBeenDisplayedDate", hintWouldHaveBeenDisplayedDate];
  }
  hintDisplayedDates = self->_hintDisplayedDates;
  if (hintDisplayedDates) {
    [v5 appendFormat:@"\t%@ = %@\n", @"hintDisplayedDates", hintDisplayedDates];
  }
  hintNotDisplayedDueToFrequencyControlDates = self->_hintNotDisplayedDueToFrequencyControlDates;
  if (hintNotDisplayedDueToFrequencyControlDates) {
    [v5 appendFormat:@"\t%@ = %@\n", @"hintNotDisplayedDueToFrequencyControlDates", hintNotDisplayedDueToFrequencyControlDates];
  }
  hintDismissalDate = self->_hintDismissalDate;
  if (hintDismissalDate) {
    [v5 appendFormat:@"\t%@ = %@\n", @"hintDismissalDate", hintDismissalDate];
  }
  contentViewedDate = self->_contentViewedDate;
  if (contentViewedDate) {
    [v5 appendFormat:@"\t%@ = %@\n", @"contentViewedDate", contentViewedDate];
  }
  desiredOutcomePerformedDates = self->_desiredOutcomePerformedDates;
  if (desiredOutcomePerformedDates) {
    [v5 appendFormat:@"\t%@ = %@\n", @"desiredOutcomePerformedDates", desiredOutcomePerformedDates];
  }
  savedDate = self->_savedDate;
  if (savedDate) {
    [v5 appendFormat:@"\t%@ = %@\n", @"savedDate", savedDate];
  }
  userInfo = self->_userInfo;
  if (userInfo) {
    [v5 appendFormat:@"\t%@ = %@\n", @"userInfo", userInfo];
  }
  [v5 appendString:@"}"];
  return v5;
}

- (BOOL)overrideHoldout
{
  return self->_overrideHoldout;
}

- (BOOL)overrideFrequencyControl
{
  return self->_overrideFrequencyControl;
}

- (int64_t)hintIneligibleReason
{
  return self->_hintIneligibleReason;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)variantIdentifier
{
  return self->_variantIdentifier;
}

- (NSString)clonedFromIdentifier
{
  return self->_clonedFromIdentifier;
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (NSDate)dateForTriggerRestartTracking
{
  return self->_dateForTriggerRestartTracking;
}

- (NSDate)hintWouldHaveBeenDisplayedDate
{
  return self->_hintWouldHaveBeenDisplayedDate;
}

- (NSString)lastDisplayContext
{
  return self->_lastDisplayContext;
}

@end