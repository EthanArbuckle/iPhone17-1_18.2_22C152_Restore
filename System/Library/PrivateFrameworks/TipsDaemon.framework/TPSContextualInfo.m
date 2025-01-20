@interface TPSContextualInfo
+ (BOOL)supportsSecureCoding;
+ (id)contentDictionaryWithTipDeliveryInfoId:(id)a3 deliveryInfoMap:(id)a4;
+ (id)identifierFromDictionary:(id)a3;
+ (void)eventsInfoArrayForContextualInfoDictionary:(id)a3 triggerEvents:(id *)a4 desiredOutcomeEvents:(id *)a5;
- (BOOL)hasChangesFromDictionary:(id)a3;
- (NSArray)displayBundleIDs;
- (NSArray)eligibleContext;
- (NSArray)usageEvents;
- (NSString)identifier;
- (TPSContextualCondition)desiredOutcomeCondition;
- (TPSContextualCondition)triggerCondition;
- (TPSContextualInfo)initWithCoder:(id)a3;
- (TPSContextualInfo)initWithDictionary:(id)a3;
- (TPSMonitoringEvents)monitoringEvents;
- (id)conditionForType:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)desiredOutcomeEventIdentifiers;
- (id)displayBundleID;
- (id)triggerEventIdentifiers;
- (int)priority;
- (int64_t)_lastModifiedDateFromDictionary:(id)a3;
- (int64_t)customizationID;
- (int64_t)displayMaxCount;
- (int64_t)lastModifiedDate;
- (void)encodeWithCoder:(id)a3;
- (void)restartDesiredOutcomeTracking;
- (void)restartTriggerTracking;
- (void)setCustomizationID:(int64_t)a3;
- (void)setDesiredOutcomeCondition:(id)a3;
- (void)setDisplayBundleIDs:(id)a3;
- (void)setDisplayMaxCount:(int64_t)a3;
- (void)setEligibleContext:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLastModifiedDate:(int64_t)a3;
- (void)setMonitoringEvents:(id)a3;
- (void)setTriggerCondition:(id)a3;
- (void)setUsageEvents:(id)a3;
@end

@implementation TPSContextualInfo

- (TPSContextualInfo)initWithDictionary:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)TPSContextualInfo;
  v5 = [(TPSSerializableObject *)&v48 initWithDictionary:v4];
  if (!v5) {
    goto LABEL_40;
  }
  v6 = [v4 TPSSafeNumberForKey:@"customizationId"];
  v7 = v6;
  if (v6) {
    uint64_t v8 = [v6 integerValue];
  }
  else {
    uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v5->_customizationID = v8;
  uint64_t v9 = +[TPSContextualInfo identifierFromDictionary:v4];
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v9;

  uint64_t v11 = [(TPSContextualInfo *)v5 _lastModifiedDateFromDictionary:v4];
  v5->_lastModifiedDate = v11;
  if (!v11 || v11 == 0x7FFFFFFFFFFFFFFFLL)
  {

    v12 = 0;
    goto LABEL_41;
  }
  v13 = [v4 TPSSafeNumberForKey:@"displayMaxCount"];
  v43 = v13;
  if (v13)
  {
    uint64_t v14 = [v13 integerValue];
    uint64_t v15 = 3;
    if (v14 != -1) {
      uint64_t v15 = v14;
    }
  }
  else
  {
    uint64_t v15 = 3;
  }
  v42 = v7;
  v5->_displayMaxCount = v15;
  uint64_t v16 = [v4 TPSSafeArrayForKey:@"displayBundleIds"];
  displayBundleIDs = v5->_displayBundleIDs;
  v5->_displayBundleIDs = (NSArray *)v16;

  uint64_t v18 = [v4 TPSSafeArrayForKey:@"eligibleContexts"];
  eligibleContext = v5->_eligibleContext;
  v5->_eligibleContext = (NSArray *)v18;

  v20 = [v4 TPSSafeArrayForKey:@"usageEvents"];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (!v21)
  {
    v23 = 0;
    goto LABEL_30;
  }
  uint64_t v22 = v21;
  v23 = 0;
  uint64_t v24 = *(void *)v45;
  do
  {
    for (uint64_t i = 0; i != v22; ++i)
    {
      if (*(void *)v45 != v24) {
        objc_enumerationMutation(v20);
      }
      uint64_t v26 = *(void *)(*((void *)&v44 + 1) + 8 * i);
      uint64_t v27 = [MEMORY[0x1E4FAF440] typeFromEventDictionary:v26];
      if (v27 == 3)
      {
        uint64_t v28 = [MEMORY[0x1E4FAF428] contextualBiomeEventFromDictionary:v26];
      }
      else
      {
        if (v27) {
          continue;
        }
        uint64_t v28 = [MEMORY[0x1E4FAF428] contextualBiomeEventFromDuetEventDictionary:v26];
      }
      v29 = (void *)v28;
      if (v28)
      {
        if (!v23)
        {
          v23 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v20, "count"));
        }
        [v23 addObject:v29];
      }
    }
    uint64_t v22 = [v20 countByEnumeratingWithState:&v44 objects:v49 count:16];
  }
  while (v22);
LABEL_30:
  uint64_t v30 = [v23 count];
  if (v30)
  {
    v31 = [MEMORY[0x1E4F1C978] arrayWithArray:v23];
  }
  else
  {
    v31 = 0;
  }
  objc_storeStrong((id *)&v5->_usageEvents, v31);
  if (v30) {

  }
  v32 = [v4 TPSSafeDictionaryForKey:@"triggers"];
  if (v32)
  {
    uint64_t v33 = [objc_alloc(MEMORY[0x1E4FAF430]) initWithDictionary:v32 type:0];
    triggerCondition = v5->_triggerCondition;
    v5->_triggerCondition = (TPSContextualCondition *)v33;
  }
  v35 = [v4 TPSSafeDictionaryForKey:@"desiredOutcome"];
  if (v35)
  {
    uint64_t v36 = [objc_alloc(MEMORY[0x1E4FAF430]) initWithDictionary:v35 type:1];
    desiredOutcomeCondition = v5->_desiredOutcomeCondition;
    v5->_desiredOutcomeCondition = (TPSContextualCondition *)v36;
  }
  v38 = [v4 TPSSafeDictionaryForKey:*MEMORY[0x1E4FAF578]];
  uint64_t v39 = [objc_alloc(MEMORY[0x1E4FAF490]) initWithDictionary:v38 desiredOutcomeDictionary:v35];
  monitoringEvents = v5->_monitoringEvents;
  v5->_monitoringEvents = (TPSMonitoringEvents *)v39;

LABEL_40:
  v12 = v5;
LABEL_41:

  return v12;
}

- (int64_t)_lastModifiedDateFromDictionary:(id)a3
{
  return [a3 TPSSafeIntegerForKey:@"lastModified"];
}

+ (id)identifierFromDictionary:(id)a3
{
  return (id)[a3 TPSSafeStringForKey:@"documentId"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_desiredOutcomeCondition, 0);
  objc_storeStrong((id *)&self->_triggerCondition, 0);
  objc_storeStrong((id *)&self->_usageEvents, 0);
  objc_storeStrong((id *)&self->_monitoringEvents, 0);
  objc_storeStrong((id *)&self->_eligibleContext, 0);
  objc_storeStrong((id *)&self->_displayBundleIDs, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSArray)usageEvents
{
  return self->_usageEvents;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TPSContextualInfo;
  id v4 = a3;
  [(TPSSerializableObject *)&v6 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_customizationID, @"customizationId", v6.receiver, v6.super_class);
  [v4 encodeInteger:self->_displayMaxCount forKey:@"displayMaxCount"];
  [v4 encodeObject:self->_identifier forKey:@"documentId"];
  [v4 encodeObject:self->_displayBundleIDs forKey:@"displayBundleIds"];
  [v4 encodeObject:self->_eligibleContext forKey:@"eligibleContexts"];
  [v4 encodeObject:self->_monitoringEvents forKey:*MEMORY[0x1E4FAF578]];
  [v4 encodeObject:self->_usageEvents forKey:@"usageEvents"];
  v5 = [NSNumber numberWithInteger:self->_lastModifiedDate];
  [v4 encodeObject:v5 forKey:@"lastModified"];

  [v4 encodeObject:self->_triggerCondition forKey:@"triggers"];
  [v4 encodeObject:self->_desiredOutcomeCondition forKey:@"desiredOutcome"];
}

+ (id)contentDictionaryWithTipDeliveryInfoId:(id)a3 deliveryInfoMap:(id)a4
{
  id v4 = [a4 objectForKeyedSubscript:a3];
  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  objc_super v6 = [v4 TPSSafeStringForKey:@"documentId"];
  [v5 setObject:v6 forKeyedSubscript:@"documentId"];

  v7 = [v4 TPSSafeNumberForKey:@"lastModified"];
  [v5 setObject:v7 forKeyedSubscript:@"lastModified"];

  uint64_t v8 = [v4 TPSSafeDictionaryForKey:@"triggers"];
  [v5 setObject:v8 forKeyedSubscript:@"triggers"];

  uint64_t v9 = [v4 TPSSafeDictionaryForKey:@"desiredOutcome"];
  [v5 setObject:v9 forKeyedSubscript:@"desiredOutcome"];

  uint64_t v10 = *MEMORY[0x1E4FAF578];
  uint64_t v11 = [v4 TPSSafeDictionaryForKey:*MEMORY[0x1E4FAF578]];
  [v5 setObject:v11 forKeyedSubscript:v10];

  v12 = [v4 TPSSafeArrayForKey:@"usageEvents"];
  [v5 setObject:v12 forKeyedSubscript:@"usageEvents"];

  v13 = [v4 TPSSafeNumberForKey:@"customizationId"];
  [v5 setObject:v13 forKeyedSubscript:@"customizationId"];

  uint64_t v14 = [v4 TPSSafeNumberForKey:@"displayMaxCount"];
  [v5 setObject:v14 forKeyedSubscript:@"displayMaxCount"];

  uint64_t v15 = [v4 TPSSafeArrayForKey:@"displayBundleIds"];
  [v5 setObject:v15 forKeyedSubscript:@"displayBundleIds"];

  uint64_t v16 = [v4 TPSSafeArrayForKey:@"eligibleContexts"];
  [v5 setObject:v16 forKeyedSubscript:@"eligibleContexts"];

  v17 = (void *)[v5 copy];

  return v17;
}

+ (void)eventsInfoArrayForContextualInfoDictionary:(id)a3 triggerEvents:(id *)a4 desiredOutcomeEvents:(id *)a5
{
  id v7 = a3;
  id v10 = v7;
  if (a4)
  {
    uint64_t v8 = [v7 TPSSafeDictionaryForKey:@"triggers"];
    *a4 = [MEMORY[0x1E4FAF430] eventsForConditionDictionary:v8];

    id v7 = v10;
  }
  if (a5)
  {
    uint64_t v9 = [v10 TPSSafeDictionaryForKey:@"desiredOutcome"];
    *a5 = [MEMORY[0x1E4FAF430] eventsForConditionDictionary:v9];

    id v7 = v10;
  }
}

- (TPSContextualInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)TPSContextualInfo;
  v5 = [(TPSSerializableObject *)&v29 initWithCoder:v4];
  if (v5)
  {
    v5->_customizationID = [v4 decodeIntegerForKey:@"customizationId"];
    uint64_t v6 = [v4 decodeIntegerForKey:@"displayMaxCount"];
    v5->_displayMaxCount = v6;
    if ((v6 | 0x8000000000000000) == 0xFFFFFFFFFFFFFFFFLL) {
      v5->_displayMaxCount = 3;
    }
    id v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"documentId"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClasses:v9 forKey:@"displayBundleIds"];
    displayBundleIDs = v5->_displayBundleIDs;
    v5->_displayBundleIDs = (NSArray *)v12;

    uint64_t v14 = [v4 decodeObjectOfClasses:v9 forKey:@"eligibleContexts"];
    eligibleContext = v5->_eligibleContext;
    v5->_eligibleContext = (NSArray *)v14;

    uint64_t v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"usageEvents"];
    usageEvents = v5->_usageEvents;
    v5->_usageEvents = (NSArray *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastModified"];
    v5->_lastModifiedDate = [v21 integerValue];

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"triggers"];
    triggerCondition = v5->_triggerCondition;
    v5->_triggerCondition = (TPSContextualCondition *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"desiredOutcome"];
    desiredOutcomeCondition = v5->_desiredOutcomeCondition;
    v5->_desiredOutcomeCondition = (TPSContextualCondition *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4FAF578]];
    monitoringEvents = v5->_monitoringEvents;
    v5->_monitoringEvents = (TPSMonitoringEvents *)v26;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TPSContextualInfo;
  id v4 = [(TPSSerializableObject *)&v6 copyWithZone:a3];
  [v4 setIdentifier:self->_identifier];
  [v4 setCustomizationID:self->_customizationID];
  [v4 setDisplayMaxCount:self->_displayMaxCount];
  [v4 setDisplayBundleIDs:self->_displayBundleIDs];
  [v4 setEligibleContext:self->_eligibleContext];
  [v4 setMonitoringEvents:self->_monitoringEvents];
  [v4 setUsageEvents:self->_usageEvents];
  [v4 setLastModifiedDate:self->_lastModifiedDate];
  [v4 setTriggerCondition:self->_triggerCondition];
  [v4 setDesiredOutcomeCondition:self->_desiredOutcomeCondition];
  return v4;
}

- (id)displayBundleID
{
  return [(NSArray *)self->_displayBundleIDs firstObject];
}

- (id)triggerEventIdentifiers
{
  return (id)[(TPSContextualCondition *)self->_triggerCondition eventIdentifiers];
}

- (id)desiredOutcomeEventIdentifiers
{
  return (id)[(TPSContextualCondition *)self->_desiredOutcomeCondition eventIdentifiers];
}

- (BOOL)hasChangesFromDictionary:(id)a3
{
  return [(TPSContextualInfo *)self _lastModifiedDateFromDictionary:a3] != self->_lastModifiedDate;
}

- (id)conditionForType:(unint64_t)a3
{
  v3 = &OBJC_IVAR___TPSContextualInfo__triggerCondition;
  if (a3 == 1) {
    v3 = &OBJC_IVAR___TPSContextualInfo__desiredOutcomeCondition;
  }
  return *(id *)((char *)&self->super.super.isa + *v3);
}

- (void)restartTriggerTracking
{
}

- (void)restartDesiredOutcomeTracking
{
}

- (id)debugDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v21.receiver = self;
  v21.super_class = (Class)TPSContextualInfo;
  id v4 = [(TPSSerializableObject *)&v21 debugDescription];
  v5 = (void *)[v3 initWithString:v4];

  identifier = self->_identifier;
  if (identifier) {
    [v5 appendFormat:@"%@ = %@\n", @"documentId", identifier];
  }
  int64_t customizationID = self->_customizationID;
  if (customizationID != 0x7FFFFFFFFFFFFFFFLL) {
    [v5 appendFormat:@"%@ = %zd\n", @"customizationId", customizationID];
  }
  int64_t displayMaxCount = self->_displayMaxCount;
  if (displayMaxCount != 0x7FFFFFFFFFFFFFFFLL) {
    [v5 appendFormat:@"%@ = %zd\n", @"displayMaxCount", displayMaxCount];
  }
  triggerCondition = self->_triggerCondition;
  if (triggerCondition)
  {
    uint64_t v10 = [(TPSContextualCondition *)triggerCondition debugDescription];
    [v5 appendFormat:@"%@ = %@\n", @"triggers", v10];
  }
  desiredOutcomeCondition = self->_desiredOutcomeCondition;
  if (desiredOutcomeCondition)
  {
    uint64_t v12 = [(TPSContextualCondition *)desiredOutcomeCondition debugDescription];
    [v5 appendFormat:@"%@ = %@\n", @"desiredOutcome", v12];
  }
  displayBundleIDs = self->_displayBundleIDs;
  if (displayBundleIDs) {
    [v5 appendFormat:@"%@ = %@\n", @"displayBundleIds", displayBundleIDs];
  }
  eligibleContext = self->_eligibleContext;
  if (eligibleContext) {
    [v5 appendFormat:@"%@ = %@\n", @"eligibleContexts", eligibleContext];
  }
  usageEvents = self->_usageEvents;
  if (usageEvents)
  {
    uint64_t v16 = [(NSArray *)usageEvents description];
    [v5 appendFormat:@"%@ = %@\n", @"usageEvents", v16];
  }
  monitoringEvents = self->_monitoringEvents;
  if (monitoringEvents)
  {
    uint64_t v18 = *MEMORY[0x1E4FAF578];
    uint64_t v19 = [(TPSMonitoringEvents *)monitoringEvents description];
    [v5 appendFormat:@"%@ = %@\n", v18, v19];
  }

  return v5;
}

- (int)priority
{
  return self->_priority;
}

- (int64_t)customizationID
{
  return self->_customizationID;
}

- (void)setCustomizationID:(int64_t)a3
{
  self->_int64_t customizationID = a3;
}

- (int64_t)displayMaxCount
{
  return self->_displayMaxCount;
}

- (void)setDisplayMaxCount:(int64_t)a3
{
  self->_int64_t displayMaxCount = a3;
}

- (int64_t)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (void)setLastModifiedDate:(int64_t)a3
{
  self->_lastModifiedDate = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSArray)displayBundleIDs
{
  return self->_displayBundleIDs;
}

- (void)setDisplayBundleIDs:(id)a3
{
}

- (NSArray)eligibleContext
{
  return self->_eligibleContext;
}

- (void)setEligibleContext:(id)a3
{
}

- (TPSMonitoringEvents)monitoringEvents
{
  return self->_monitoringEvents;
}

- (void)setMonitoringEvents:(id)a3
{
}

- (void)setUsageEvents:(id)a3
{
}

- (TPSContextualCondition)triggerCondition
{
  return self->_triggerCondition;
}

- (void)setTriggerCondition:(id)a3
{
}

- (TPSContextualCondition)desiredOutcomeCondition
{
  return self->_desiredOutcomeCondition;
}

- (void)setDesiredOutcomeCondition:(id)a3
{
}

@end