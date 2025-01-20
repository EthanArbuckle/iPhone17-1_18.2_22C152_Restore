@interface TPSContextualEvent
+ (BOOL)supportsSecureCoding;
+ (id)eventDictionaryForIdentifier:(id)a3 type:(int64_t)a4 status:(int64_t)a5;
+ (id)identifierFromEventInfoDictionary:(id)a3;
+ (int64_t)typeFromEventDictionary:(id)a3;
- (BOOL)canBeRemoved;
- (BOOL)hasDaysSinceLastMajorUpdate;
- (BOOL)hasLookBackDays;
- (BOOL)observedWithResults:(id)a3;
- (NSDate)eventSinceDate;
- (NSDate)matchedDate;
- (NSDictionary)userInfoPersistent;
- (NSDictionary)userInfoQuery;
- (NSMutableDictionary)observationMap;
- (NSMutableSet)observerIdentifiers;
- (NSString)identifier;
- (NSString)key;
- (TPSContextualEvent)initWithCoder:(id)a3;
- (TPSContextualEvent)initWithDictionary:(id)a3;
- (TPSContextualEvent)state;
- (TPSContextualEventBookmark)bookmark;
- (double)daysSinceLastMajorUpdateTimeIntervalInSeconds;
- (double)eventTimeToLiveInterval;
- (double)lookbackTimeIntervalInSeconds;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (id)eventSinceLastMajorUpdateDate;
- (id)newStateFromStateDictionary:(id)a3;
- (int64_t)daysSinceLastMajorUpdate;
- (int64_t)lookBackDays;
- (int64_t)status;
- (int64_t)type;
- (unsigned)currentObservationCount;
- (unsigned)minObservationCount;
- (void)addObserverIdentifier:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)removeAllObservations;
- (void)removeObserverIdentifiers:(id)a3;
- (void)removeOutdatedObservationDates;
- (void)setBookmark:(id)a3;
- (void)setDaysSinceLastMajorUpdate:(int64_t)a3;
- (void)setEventSinceDate:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setKey:(id)a3;
- (void)setLookBackDays:(int64_t)a3;
- (void)setMatchedDate:(id)a3;
- (void)setMinObservationCount:(unsigned int)a3;
- (void)setObservationMap:(id)a3;
- (void)setObserverIdentifiers:(id)a3;
- (void)setState:(id)a3;
- (void)setStatus:(int64_t)a3;
- (void)setType:(int64_t)a3;
- (void)setUserInfoPersistent:(id)a3;
- (void)setUserInfoQuery:(id)a3;
@end

@implementation TPSContextualEvent

- (TPSContextualEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)TPSContextualEvent;
  v5 = [(TPSSerializableObject *)&v23 initWithDictionary:v4];
  if (!v5)
  {
LABEL_13:
    v13 = v5;
    goto LABEL_14;
  }
  uint64_t v6 = +[TPSContextualEvent identifierFromEventInfoDictionary:v4];
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  uint64_t v8 = [v4 TPSSafeStringForKey:@"key"];
  key = v5->_key;
  v5->_key = (NSString *)v8;

  if ([(NSString *)v5->_identifier length])
  {
    v5->_type = +[TPSContextualEvent typeFromEventDictionary:v4];
    v10 = [v4 TPSSafeNumberForKey:@"status"];
    v11 = v10;
    if (v10) {
      uint64_t v12 = (int)[v10 intValue];
    }
    else {
      uint64_t v12 = 1;
    }
    v5->_status = v12;
    unsigned int v14 = [v4 TPSSafeIntForKey:@"minObservations"];
    v5->_minObservationCount = v14;
    if (!v14 || !v5->_status) {
      v5->_minObservationCount = 1;
    }
    v15 = [v4 TPSSafeDictionaryForKey:@"state"];
    uint64_t v16 = [(TPSContextualEvent *)v5 newStateFromStateDictionary:v15];
    state = v5->_state;
    v5->_state = (TPSContextualEvent *)v16;

    [(TPSContextualEvent *)v5->_state setType:v5->_type];
    v5->_lookBackDays = [v4 TPSSafeIntegerForKey:@"lookBackDays"];
    v5->_daysSinceLastMajorUpdate = 0x7FFFFFFFFFFFFFFFLL;
    v18 = [v4 TPSSafeNumberForKey:@"daysSinceLastMajorUpdate"];
    v19 = v18;
    if (v18) {
      v5->_daysSinceLastMajorUpdate = [v18 integerValue];
    }
    uint64_t v20 = [v4 TPSSafeDictionaryForKey:@"userInfoPersistent"];
    userInfoPersistent = v5->_userInfoPersistent;
    v5->_userInfoPersistent = (NSDictionary *)v20;

    goto LABEL_13;
  }
  v13 = 0;
LABEL_14:

  return v13;
}

+ (int64_t)typeFromEventDictionary:(id)a3
{
  v3 = [a3 TPSSafeNumberForKey:@"type"];
  id v4 = v3;
  if (v3) {
    int64_t v5 = (int)[v3 intValue];
  }
  else {
    int64_t v5 = -1;
  }

  return v5;
}

+ (id)identifierFromEventInfoDictionary:(id)a3
{
  return (id)[a3 TPSSafeStringForKey:@"id"];
}

- (id)newStateFromStateDictionary:(id)a3
{
  return 0;
}

+ (id)eventDictionaryForIdentifier:(id)a3 type:(int64_t)a4 status:(int64_t)a5
{
  v15[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v14[0] = @"id";
  v9 = v8;
  if (!v8)
  {
    int64_t v5 = [MEMORY[0x1E4F29128] UUID];
    v9 = [v5 UUIDString];
  }
  v15[0] = v9;
  v14[1] = @"type";
  v10 = [NSNumber numberWithInteger:a4];
  v15[1] = v10;
  v14[2] = @"status";
  v11 = [NSNumber numberWithInteger:a5];
  v15[2] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];

  if (!v8)
  {
  }
  return v12;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)status
{
  return self->_status;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unsigned)currentObservationCount
{
  LODWORD(self) = [(NSMutableDictionary *)self->_observationMap count];
  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedEventLock);
  return self;
}

- (NSDate)eventSinceDate
{
  v3 = self->_eventSinceDate;
  if (!v3)
  {
    if ([(TPSContextualEvent *)self hasLookBackDays])
    {
      id v4 = (void *)MEMORY[0x1E4F1C9C8];
      [(TPSContextualEvent *)self lookbackTimeIntervalInSeconds];
      objc_msgSend(v4, "dateWithTimeIntervalSinceNow:");
      v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }
  }
  int64_t v5 = [(TPSContextualEvent *)self eventSinceLastMajorUpdateDate];
  uint64_t v6 = v5;
  if (v5)
  {
    if (v3)
    {
      uint64_t v7 = [(NSDate *)v3 laterDate:v5];

      v3 = (NSDate *)v7;
    }
    else
    {
      v3 = v5;
    }
  }

  return v3;
}

- (BOOL)hasLookBackDays
{
  return [(TPSContextualEvent *)self lookBackDays] > 0;
}

- (int64_t)lookBackDays
{
  return self->_lookBackDays;
}

- (id)eventSinceLastMajorUpdateDate
{
  if ([(TPSContextualEvent *)self hasDaysSinceLastMajorUpdate])
  {
    v3 = +[TPSCommonDefines sharedInstance];
    id v4 = [v3 lastMajorVersionUpdateDate];

    if (v4)
    {
      [(TPSContextualEvent *)self daysSinceLastMajorUpdateTimeIntervalInSeconds];
      int64_t v5 = objc_msgSend(v4, "dateByAddingTimeInterval:");
    }
    else
    {
      int64_t v5 = 0;
    }
  }
  else
  {
    int64_t v5 = 0;
  }
  return v5;
}

- (BOOL)hasDaysSinceLastMajorUpdate
{
  return [(TPSContextualEvent *)self daysSinceLastMajorUpdate] != 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)daysSinceLastMajorUpdate
{
  return self->_daysSinceLastMajorUpdate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observerIdentifiers, 0);
  objc_storeStrong((id *)&self->_observationMap, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_bookmark, 0);
  objc_storeStrong((id *)&self->_eventSinceDate, 0);
  objc_storeStrong((id *)&self->_matchedDate, 0);
  objc_storeStrong((id *)&self->_userInfoPersistent, 0);
  objc_storeStrong((id *)&self->_userInfoQuery, 0);
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TPSContextualEvent;
  id v4 = a3;
  [(TPSSerializableObject *)&v7 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_type, @"type", v7.receiver, v7.super_class);
  [v4 encodeInteger:self->_status forKey:@"status"];
  [v4 encodeInt:self->_minObservationCount forKey:@"minObservations"];
  [v4 encodeInteger:self->_lookBackDays forKey:@"lookBackDays"];
  int64_t v5 = [NSNumber numberWithInteger:self->_daysSinceLastMajorUpdate];
  [v4 encodeObject:v5 forKey:@"daysSinceLastMajorUpdate"];

  [v4 encodeObject:self->_userInfoPersistent forKey:@"userInfoPersistent"];
  [v4 encodeObject:self->_bookmark forKey:@"bookmark"];
  [v4 encodeObject:self->_matchedDate forKey:@"matchedDate"];
  [v4 encodeObject:self->_eventSinceDate forKey:@"eventSinceDate"];
  [v4 encodeObject:self->_identifier forKey:@"id"];
  [v4 encodeObject:self->_key forKey:@"key"];
  [v4 encodeObject:self->_state forKey:@"state"];
  [v4 encodeObject:self->_observationMap forKey:@"observationMap"];
  uint64_t v6 = [(NSMutableSet *)self->_observerIdentifiers allObjects];
  [v4 encodeObject:v6 forKey:@"observerIdentifiers"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSContextualEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)TPSContextualEvent;
  int64_t v5 = [(TPSSerializableObject *)&v39 initWithCoder:v4];
  if (v5)
  {
    v5->_type = (int)[v4 decodeIntForKey:@"type"];
    v5->_status = (int)[v4 decodeIntForKey:@"status"];
    v5->_minObservationCount = [v4 decodeIntForKey:@"minObservations"];
    v5->_lookBackDays = [v4 decodeIntegerForKey:@"lookBackDays"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"daysSinceLastMajorUpdate"];
    objc_super v7 = v6;
    if (v6) {
      uint64_t v8 = [v6 integerValue];
    }
    else {
      uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v5->_daysSinceLastMajorUpdate = v8;
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = [v4 decodeDictionaryWithKeysOfClass:v9 objectsOfClass:objc_opt_class() forKey:@"userInfoPersistent"];
    userInfoPersistent = v5->_userInfoPersistent;
    v5->_userInfoPersistent = (NSDictionary *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"matchedDate"];
    matchedDate = v5->_matchedDate;
    v5->_matchedDate = (NSDate *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bookmark"];
    bookmark = v5->_bookmark;
    v5->_bookmark = (TPSContextualEventBookmark *)v14;

    if (v5->_matchedDate
      && objc_msgSend(MEMORY[0x1E4F1C9C8], "isDateExpired:maxTimeInterval:", -63072000.0))
    {
      uint64_t v16 = v5->_matchedDate;
      v5->_matchedDate = 0;
    }
    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eventSinceDate"];
    eventSinceDate = v5->_eventSinceDate;
    v5->_eventSinceDate = (NSDate *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"id"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"key"];
    key = v5->_key;
    v5->_key = (NSString *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"state"];
    state = v5->_state;
    v5->_state = (TPSContextualEvent *)v23;

    v25 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v26 = objc_opt_class();
    uint64_t v27 = objc_opt_class();
    uint64_t v28 = objc_opt_class();
    v29 = objc_msgSend(v25, "setWithObjects:", v26, v27, v28, objc_opt_class(), 0);
    uint64_t v30 = [v4 decodeObjectOfClasses:v29 forKey:@"observationMap"];
    observationMap = v5->_observationMap;
    v5->_observationMap = (NSMutableDictionary *)v30;

    [(TPSContextualEvent *)v5 removeOutdatedObservationDates];
    v32 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v33 = objc_opt_class();
    v34 = objc_msgSend(v32, "setWithObjects:", v33, objc_opt_class(), 0);
    v35 = [v4 decodeObjectOfClasses:v34 forKey:@"observerIdentifiers"];

    if (v35)
    {
      uint64_t v36 = [MEMORY[0x1E4F1CA80] setWithArray:v35];
      observerIdentifiers = v5->_observerIdentifiers;
      v5->_observerIdentifiers = (NSMutableSet *)v36;
    }
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  [v4 setType:self->_type];
  [v4 setStatus:self->_status];
  [v4 setMinObservationCount:self->_minObservationCount];
  [v4 setLookBackDays:self->_lookBackDays];
  [v4 setDaysSinceLastMajorUpdate:self->_daysSinceLastMajorUpdate];
  [v4 setUserInfoPersistent:self->_userInfoPersistent];
  [v4 setBookmark:self->_bookmark];
  [v4 setMatchedDate:self->_matchedDate];
  [v4 setIdentifier:self->_identifier];
  [v4 setKey:self->_key];
  [v4 setState:self->_state];
  [v4 setObservationMap:self->_observationMap];
  [v4 setObserverIdentifiers:self->_observerIdentifiers];
  return v4;
}

- (BOOL)canBeRemoved
{
  LOBYTE(self) = [(NSMutableSet *)self->_observerIdentifiers count] == 0;
  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedEventLock);
  return (char)self;
}

- (double)lookbackTimeIntervalInSeconds
{
  +[TPSDefaultsManager contextualEventLookBackDaysInSeconds];
  if (v3 <= 0.0) {
    double v3 = (double)(86400 * [(TPSContextualEvent *)self lookBackDays]);
  }
  return -v3;
}

- (double)daysSinceLastMajorUpdateTimeIntervalInSeconds
{
  double v3 = +[TPSDefaultsManager contextualEventDaysSinceLastMajorUpdateInSeconds];
  id v4 = v3;
  if (v3)
  {
    [v3 doubleValue];
    double v6 = v5;
  }
  else
  {
    double v6 = (double)(86400 * [(TPSContextualEvent *)self daysSinceLastMajorUpdate]);
  }

  return v6;
}

- (void)addObserverIdentifier:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_sharedEventLock);
  if (!self->_observerIdentifiers)
  {
    double v5 = [MEMORY[0x1E4F1CA80] set];
    observerIdentifiers = self->_observerIdentifiers;
    self->_observerIdentifiers = v5;
  }
  objc_super v7 = +[TPSLogger default];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = self->_observerIdentifiers;
    identifier = self->_identifier;
    int v10 = 138412802;
    id v11 = v4;
    __int16 v12 = 2112;
    v13 = v8;
    __int16 v14 = 2112;
    v15 = identifier;
    _os_log_debug_impl(&dword_19C8DC000, v7, OS_LOG_TYPE_DEBUG, "Add observerIdentifer %@ to map %@ for event identifier %@", (uint8_t *)&v10, 0x20u);
  }

  [(NSMutableSet *)self->_observerIdentifiers addObject:v4];
  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedEventLock);
}

- (BOOL)observedWithResults:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_sharedEventLock);
  if ([v4 count] && !self->_observationMap)
  {
    double v5 = [MEMORY[0x1E4F1CA60] dictionary];
    observationMap = self->_observationMap;
    self->_observationMap = v5;
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __42__TPSContextualEvent_observedWithResults___block_invoke;
  v10[3] = &unk_1E59081A8;
  v10[4] = self;
  [v4 enumerateKeysAndObjectsUsingBlock:v10];
  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedEventLock);
  if ([(TPSContextualEvent *)self hasLookBackDays]) {
    [(TPSContextualEvent *)self removeOutdatedObservationDates];
  }
  if (self->_matchedDate)
  {
    BOOL v7 = 0;
  }
  else
  {
    unsigned int minObservationCount = self->_minObservationCount;
    BOOL v7 = minObservationCount <= [(TPSContextualEvent *)self currentObservationCount];
  }

  return v7;
}

uint64_t __42__TPSContextualEvent_observedWithResults___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(a1 + 32) + 112) setObject:a3 forKeyedSubscript:a2];
}

- (void)removeObserverIdentifiers:(id)a3
{
  id v5 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_sharedEventLock);
  id v4 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
  [(NSMutableSet *)self->_observerIdentifiers minusSet:v4];

  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedEventLock);
}

- (void)removeAllObservations
{
  os_unfair_lock_lock((os_unfair_lock_t)&_sharedEventLock);
  [(NSMutableDictionary *)self->_observationMap removeAllObjects];
  bookmark = self->_bookmark;
  self->_bookmark = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedEventLock);
}

- (void)removeOutdatedObservationDates
{
  double v3 = [MEMORY[0x1E4F1C9C8] date];
  [(TPSContextualEvent *)self eventTimeToLiveInterval];
  uint64_t v5 = v4;
  os_unfair_lock_lock((os_unfair_lock_t)&_sharedEventLock);
  double v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSMutableDictionary count](self->_observationMap, "count"));
  observationMap = self->_observationMap;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__TPSContextualEvent_removeOutdatedObservationDates__block_invoke;
  v10[3] = &unk_1E59081D0;
  uint64_t v13 = v5;
  id v11 = v3;
  id v12 = v6;
  id v8 = v6;
  id v9 = v3;
  [(NSMutableDictionary *)observationMap enumerateKeysAndObjectsUsingBlock:v10];
  [(NSMutableDictionary *)self->_observationMap removeObjectsForKeys:v8];
  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedEventLock);
}

void __52__TPSContextualEvent_removeOutdatedObservationDates__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if (([a3 isTimeToDate:*(void *)(a1 + 32) withinTimeInterval:*(double *)(a1 + 48)] & 1) == 0) {
    [*(id *)(a1 + 40) addObject:v5];
  }
}

- (double)eventTimeToLiveInterval
{
  if (![(TPSContextualEvent *)self hasLookBackDays]) {
    return -63072000.0;
  }
  [(TPSContextualEvent *)self lookbackTimeIntervalInSeconds];
  return result;
}

- (id)description
{
  return self->_identifier;
}

- (id)debugDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v20.receiver = self;
  v20.super_class = (Class)TPSContextualEvent;
  uint64_t v4 = [(TPSSerializableObject *)&v20 debugDescription];
  id v5 = (void *)[v3 initWithString:v4];

  [v5 appendFormat:@"\n %@ = %lu\n", @"status", self->_status];
  [v5 appendFormat:@"%@ = %ld\n", @"type", self->_type];
  [v5 appendFormat:@"%@ = %d\n", @"minObservations", self->_minObservationCount];
  int64_t lookBackDays = self->_lookBackDays;
  if ((unint64_t)(lookBackDays - 0x7FFFFFFFFFFFFFFFLL) >= 0x8000000000000002) {
    [v5 appendFormat:@"%@ = %ld\n", @"lookBackDays", lookBackDays];
  }
  int64_t daysSinceLastMajorUpdate = self->_daysSinceLastMajorUpdate;
  if (daysSinceLastMajorUpdate != 0x7FFFFFFFFFFFFFFFLL) {
    [v5 appendFormat:@"%@ = %ld\n", @"daysSinceLastMajorUpdate", daysSinceLastMajorUpdate];
  }
  userInfoPersistent = self->_userInfoPersistent;
  if (userInfoPersistent) {
    [v5 appendFormat:@"%@ = %@\n", @"userInfoPersistent", userInfoPersistent];
  }
  bookmark = self->_bookmark;
  if (bookmark) {
    [v5 appendFormat:@"%@ = %@\n", @"bookmark", bookmark];
  }
  matchedDate = self->_matchedDate;
  if (matchedDate) {
    [v5 appendFormat:@"%@ = %@\n", @"matchedDate", matchedDate];
  }
  eventSinceDate = self->_eventSinceDate;
  if (eventSinceDate) {
    [v5 appendFormat:@"%@ = %@\n", @"eventSinceDate", eventSinceDate];
  }
  identifier = self->_identifier;
  if (identifier) {
    [v5 appendFormat:@"%@ = %@\n", @"id", identifier];
  }
  key = self->_key;
  if (key) {
    [v5 appendFormat:@"%@ = %@\n", @"key", key];
  }
  state = self->_state;
  if (state) {
    [v5 appendFormat:@"%@ = %@\n", @"state", state];
  }
  observationMap = self->_observationMap;
  if (observationMap)
  {
    uint64_t v16 = [(NSMutableDictionary *)observationMap debugDescription];
    [v5 appendFormat:@"%@ = %@\n", @"observationMap", v16];
  }
  observerIdentifiers = self->_observerIdentifiers;
  if (observerIdentifiers)
  {
    v18 = [(NSMutableSet *)observerIdentifiers debugDescription];
    [v5 appendFormat:@"%@ = %@\n", @"observerIdentifiers", v18];
  }
  return v5;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void)setLookBackDays:(int64_t)a3
{
  self->_int64_t lookBackDays = a3;
}

- (void)setDaysSinceLastMajorUpdate:(int64_t)a3
{
  self->_int64_t daysSinceLastMajorUpdate = a3;
}

- (unsigned)minObservationCount
{
  return self->_minObservationCount;
}

- (void)setMinObservationCount:(unsigned int)a3
{
  self->_unsigned int minObservationCount = a3;
}

- (NSDictionary)userInfoQuery
{
  return self->_userInfoQuery;
}

- (void)setUserInfoQuery:(id)a3
{
}

- (NSDictionary)userInfoPersistent
{
  return self->_userInfoPersistent;
}

- (void)setUserInfoPersistent:(id)a3
{
}

- (NSDate)matchedDate
{
  return self->_matchedDate;
}

- (void)setMatchedDate:(id)a3
{
}

- (void)setEventSinceDate:(id)a3
{
}

- (TPSContextualEventBookmark)bookmark
{
  return self->_bookmark;
}

- (void)setBookmark:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (void)setIdentifier:(id)a3
{
}

- (TPSContextualEvent)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (NSMutableDictionary)observationMap
{
  return self->_observationMap;
}

- (void)setObservationMap:(id)a3
{
}

- (NSMutableSet)observerIdentifiers
{
  return self->_observerIdentifiers;
}

- (void)setObserverIdentifiers:(id)a3
{
}

@end