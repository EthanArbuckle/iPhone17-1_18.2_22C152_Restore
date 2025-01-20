@interface TPSMonitoringEvents
+ (BOOL)supportsSecureCoding;
- (BOOL)hasClientContextKeysForEventOptions:(unint64_t)a3;
- (BOOL)hasEvents;
- (BOOL)hasRegistrableContextualEventsForEventOptions:(unint64_t)a3;
- (NSDictionary)desiredOutcomeEventMap;
- (NSDictionary)dismissalEventMap;
- (NSDictionary)displayEventMap;
- (NSDictionary)initialDisplayEventMap;
- (NSDictionary)restartTrackingDisplayEventMap;
- (NSDictionary)restartTrackingTriggerEventMap;
- (TPSMonitoringEvents)initWithCoder:(id)a3;
- (TPSMonitoringEvents)initWithDictionary:(id)a3 desiredOutcomeDictionary:(id)a4;
- (id)autoDismissEvents;
- (id)clientContextEventsForMap:(id)a3;
- (id)clientContextKeysForEventOptions:(unint64_t)a3;
- (id)clientContextKeysForMap:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)eventMapFromMonitoringEventsDictionary:(id)a3;
- (id)registrableContextualEventsForEventOptions:(unint64_t)a3 type:(int64_t)a4;
- (id)registrableContextualEventsForMap:(id)a3 type:(int64_t)a4;
- (unint64_t)eventOptionsForEventIdentifier:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDesiredOutcomeEventMap:(id)a3;
- (void)setDismissalEventMap:(id)a3;
- (void)setDisplayEventMap:(id)a3;
- (void)setInitialDisplayEventMap:(id)a3;
- (void)setRestartTrackingDisplayEventMap:(id)a3;
- (void)setRestartTrackingTriggerEventMap:(id)a3;
@end

@implementation TPSMonitoringEvents

- (TPSMonitoringEvents)initWithDictionary:(id)a3 desiredOutcomeDictionary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)TPSMonitoringEvents;
  v8 = [(TPSMonitoringEvents *)&v28 init];
  if (v8)
  {
    v9 = [v6 TPSSafeDictionaryForKey:@"initialDisplayEvents"];
    uint64_t v10 = [(TPSMonitoringEvents *)v8 eventMapFromMonitoringEventsDictionary:v9];
    initialDisplayEventMap = v8->_initialDisplayEventMap;
    v8->_initialDisplayEventMap = (NSDictionary *)v10;

    v12 = [v6 TPSSafeDictionaryForKey:@"displayEvents"];
    uint64_t v13 = [(TPSMonitoringEvents *)v8 eventMapFromMonitoringEventsDictionary:v12];
    displayEventMap = v8->_displayEventMap;
    v8->_displayEventMap = (NSDictionary *)v13;

    v15 = [v6 TPSSafeDictionaryForKey:@"restartTrackingTriggerEvents"];
    uint64_t v16 = [(TPSMonitoringEvents *)v8 eventMapFromMonitoringEventsDictionary:v15];
    restartTrackingTriggerEventMap = v8->_restartTrackingTriggerEventMap;
    v8->_restartTrackingTriggerEventMap = (NSDictionary *)v16;

    v18 = [v6 TPSSafeDictionaryForKey:@"restartTrackingDisplayEvents"];
    uint64_t v19 = [(TPSMonitoringEvents *)v8 eventMapFromMonitoringEventsDictionary:v18];
    restartTrackingDisplayEventMap = v8->_restartTrackingDisplayEventMap;
    v8->_restartTrackingDisplayEventMap = (NSDictionary *)v19;

    v21 = [v6 TPSSafeDictionaryForKey:@"dismissalEvents"];
    uint64_t v22 = [(TPSMonitoringEvents *)v8 eventMapFromMonitoringEventsDictionary:v21];
    dismissalEventMap = v8->_dismissalEventMap;
    v8->_dismissalEventMap = (NSDictionary *)v22;

    uint64_t v24 = [(TPSMonitoringEvents *)v8 eventMapFromMonitoringEventsDictionary:v7];
    desiredOutcomeEventMap = v8->_desiredOutcomeEventMap;
    v8->_desiredOutcomeEventMap = (NSDictionary *)v24;
  }
  if ([(TPSMonitoringEvents *)v8 hasEvents]) {
    v26 = v8;
  }
  else {
    v26 = 0;
  }

  return v26;
}

- (id)eventMapFromMonitoringEventsDictionary:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = +[TPSContextualCondition eventsForConditionDictionary:a3];
  v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        if (+[TPSContextualEvent typeFromEventDictionary:](TPSContextualEvent, "typeFromEventDictionary:", v10, (void)v15) == 4)v11 = [[TPSContextualClientContextEvent alloc] initWithDictionary:v10]; {
        else
        }
          v11 = 0;
        v12 = [(TPSContextualEvent *)v11 identifier];
        if (v12) {
          [v4 setObject:v11 forKeyedSubscript:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  if ([v4 count]) {
    uint64_t v13 = (void *)[v4 copy];
  }
  else {
    uint64_t v13 = 0;
  }

  return v13;
}

- (BOOL)hasEvents
{
  v3 = [(TPSMonitoringEvents *)self initialDisplayEventMap];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = [(TPSMonitoringEvents *)self displayEventMap];
    if (v5)
    {
      BOOL v4 = 1;
    }
    else
    {
      uint64_t v6 = [(TPSMonitoringEvents *)self restartTrackingTriggerEventMap];
      if (v6)
      {
        BOOL v4 = 1;
      }
      else
      {
        uint64_t v7 = [(TPSMonitoringEvents *)self restartTrackingDisplayEventMap];
        if (v7)
        {
          BOOL v4 = 1;
        }
        else
        {
          uint64_t v8 = [(TPSMonitoringEvents *)self dismissalEventMap];
          if (v8)
          {
            BOOL v4 = 1;
          }
          else
          {
            v9 = [(TPSMonitoringEvents *)self desiredOutcomeEventMap];
            BOOL v4 = v9 != 0;
          }
        }
      }
    }
  }
  return v4;
}

- (NSDictionary)restartTrackingTriggerEventMap
{
  return self->_restartTrackingTriggerEventMap;
}

- (NSDictionary)restartTrackingDisplayEventMap
{
  return self->_restartTrackingDisplayEventMap;
}

- (NSDictionary)initialDisplayEventMap
{
  return self->_initialDisplayEventMap;
}

- (NSDictionary)displayEventMap
{
  return self->_displayEventMap;
}

- (NSDictionary)dismissalEventMap
{
  return self->_dismissalEventMap;
}

- (NSDictionary)desiredOutcomeEventMap
{
  return self->_desiredOutcomeEventMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_desiredOutcomeEventMap, 0);
  objc_storeStrong((id *)&self->_dismissalEventMap, 0);
  objc_storeStrong((id *)&self->_restartTrackingDisplayEventMap, 0);
  objc_storeStrong((id *)&self->_restartTrackingTriggerEventMap, 0);
  objc_storeStrong((id *)&self->_displayEventMap, 0);
  objc_storeStrong((id *)&self->_initialDisplayEventMap, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSMonitoringEvents)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)TPSMonitoringEvents;
  id v5 = [(TPSMonitoringEvents *)&v23 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"initialDisplayEvents"];
    initialDisplayEventMap = v5->_initialDisplayEventMap;
    v5->_initialDisplayEventMap = (NSDictionary *)v10;

    uint64_t v12 = [v4 decodeObjectOfClasses:v9 forKey:@"displayEvents"];
    displayEventMap = v5->_displayEventMap;
    v5->_displayEventMap = (NSDictionary *)v12;

    uint64_t v14 = [v4 decodeObjectOfClasses:v9 forKey:@"restartTrackingTriggerEvents"];
    restartTrackingTriggerEventMap = v5->_restartTrackingTriggerEventMap;
    v5->_restartTrackingTriggerEventMap = (NSDictionary *)v14;

    uint64_t v16 = [v4 decodeObjectOfClasses:v9 forKey:@"restartTrackingDisplayEvents"];
    restartTrackingDisplayEventMap = v5->_restartTrackingDisplayEventMap;
    v5->_restartTrackingDisplayEventMap = (NSDictionary *)v16;

    uint64_t v18 = [v4 decodeObjectOfClasses:v9 forKey:@"dismissalEvents"];
    dismissalEventMap = v5->_dismissalEventMap;
    v5->_dismissalEventMap = (NSDictionary *)v18;

    uint64_t v20 = [v4 decodeObjectOfClasses:v9 forKey:@"desiredOutcome"];
    desiredOutcomeEventMap = v5->_desiredOutcomeEventMap;
    v5->_desiredOutcomeEventMap = (NSDictionary *)v20;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  initialDisplayEventMap = self->_initialDisplayEventMap;
  id v5 = a3;
  [v5 encodeObject:initialDisplayEventMap forKey:@"initialDisplayEvents"];
  [v5 encodeObject:self->_displayEventMap forKey:@"displayEvents"];
  [v5 encodeObject:self->_restartTrackingTriggerEventMap forKey:@"restartTrackingTriggerEvents"];
  [v5 encodeObject:self->_restartTrackingDisplayEventMap forKey:@"restartTrackingDisplayEvents"];
  [v5 encodeObject:self->_dismissalEventMap forKey:@"dismissalEvents"];
  [v5 encodeObject:self->_desiredOutcomeEventMap forKey:@"desiredOutcome"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  [v4 setInitialDisplayEventMap:self->_initialDisplayEventMap];
  [v4 setDisplayEventMap:self->_displayEventMap];
  [v4 setRestartTrackingTriggerEventMap:self->_restartTrackingTriggerEventMap];
  [v4 setRestartTrackingDisplayEventMap:self->_restartTrackingDisplayEventMap];
  [v4 setDismissalEventMap:self->_dismissalEventMap];
  [v4 setDesiredOutcomeEventMap:self->_desiredOutcomeEventMap];
  return v4;
}

- (unint64_t)eventOptionsForEventIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(TPSMonitoringEvents *)self initialDisplayEventMap];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  uint64_t v7 = v6 != 0;
  uint64_t v8 = [(TPSMonitoringEvents *)self displayEventMap];
  v9 = [v8 objectForKeyedSubscript:v4];

  if (v9) {
    v7 |= 2uLL;
  }
  uint64_t v10 = [(TPSMonitoringEvents *)self restartTrackingTriggerEventMap];
  v11 = [v10 objectForKeyedSubscript:v4];

  if (v11) {
    uint64_t v12 = v7 | 8;
  }
  else {
    uint64_t v12 = v7;
  }
  uint64_t v13 = [(TPSMonitoringEvents *)self restartTrackingDisplayEventMap];
  uint64_t v14 = [v13 objectForKeyedSubscript:v4];
  if (v14)
  {
    long long v15 = (void *)v14;
    uint64_t v16 = [(TPSMonitoringEvents *)self displayEventMap];
    uint64_t v17 = [v16 count];

    if (v17) {
      v12 |= 4uLL;
    }
  }
  else
  {
  }
  uint64_t v18 = [(TPSMonitoringEvents *)self dismissalEventMap];
  uint64_t v19 = [v18 objectForKeyedSubscript:v4];

  if (v19) {
    uint64_t v20 = v12 | 0x10;
  }
  else {
    uint64_t v20 = v12;
  }
  v21 = [(TPSMonitoringEvents *)self desiredOutcomeEventMap];
  uint64_t v22 = [v21 objectForKeyedSubscript:v4];

  if (v22) {
    unint64_t v23 = v20 | 0x20;
  }
  else {
    unint64_t v23 = v20;
  }

  return v23;
}

- (BOOL)hasClientContextKeysForEventOptions:(unint64_t)a3
{
  v3 = [(TPSMonitoringEvents *)self clientContextKeysForEventOptions:a3];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (BOOL)hasRegistrableContextualEventsForEventOptions:(unint64_t)a3
{
  id v5 = [(TPSMonitoringEvents *)self registrableContextualEventsForEventOptions:a3 type:0];
  uint64_t v6 = [v5 count];

  if (v6) {
    return 1;
  }
  uint64_t v8 = [(TPSMonitoringEvents *)self registrableContextualEventsForEventOptions:a3 type:3];
  BOOL v7 = [v8 count] != 0;

  return v7;
}

- (id)clientContextKeysForEventOptions:(unint64_t)a3
{
  char v3 = a3;
  id v5 = [MEMORY[0x1E4F1CA80] set];
  if ((v3 & 8) != 0)
  {
    v9 = [(TPSMonitoringEvents *)self restartTrackingTriggerEventMap];
    uint64_t v10 = [(TPSMonitoringEvents *)self clientContextKeysForMap:v9];
    [v5 addObjectsFromArray:v10];

    if ((v3 & 1) == 0)
    {
LABEL_3:
      if ((v3 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((v3 & 1) == 0)
  {
    goto LABEL_3;
  }
  v11 = [(TPSMonitoringEvents *)self initialDisplayEventMap];
  uint64_t v12 = [(TPSMonitoringEvents *)self clientContextKeysForMap:v11];
  [v5 addObjectsFromArray:v12];

  if ((v3 & 2) == 0)
  {
LABEL_4:
    if ((v3 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v13 = [(TPSMonitoringEvents *)self displayEventMap];
  uint64_t v14 = [(TPSMonitoringEvents *)self clientContextKeysForMap:v13];
  [v5 addObjectsFromArray:v14];

  if ((v3 & 4) == 0)
  {
LABEL_5:
    if ((v3 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  long long v15 = [(TPSMonitoringEvents *)self restartTrackingDisplayEventMap];
  uint64_t v16 = [(TPSMonitoringEvents *)self clientContextKeysForMap:v15];
  [v5 addObjectsFromArray:v16];

  if ((v3 & 0x10) == 0)
  {
LABEL_6:
    if ((v3 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_14:
  uint64_t v17 = [(TPSMonitoringEvents *)self dismissalEventMap];
  uint64_t v18 = [(TPSMonitoringEvents *)self clientContextKeysForMap:v17];
  [v5 addObjectsFromArray:v18];

  if ((v3 & 0x20) != 0)
  {
LABEL_7:
    uint64_t v6 = [(TPSMonitoringEvents *)self desiredOutcomeEventMap];
    BOOL v7 = [(TPSMonitoringEvents *)self clientContextKeysForMap:v6];
    [v5 addObjectsFromArray:v7];
  }
LABEL_8:
  if ([v5 count])
  {
    uint64_t v8 = [v5 allObjects];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)registrableContextualEventsForEventOptions:(unint64_t)a3 type:(int64_t)a4
{
  char v5 = a3;
  BOOL v7 = [MEMORY[0x1E4F1CA80] set];
  if ((v5 & 8) != 0)
  {
    v11 = [(TPSMonitoringEvents *)self restartTrackingTriggerEventMap];
    uint64_t v12 = [(TPSMonitoringEvents *)self registrableContextualEventsForMap:v11 type:a4];
    [v7 addObjectsFromArray:v12];

    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((v5 & 1) == 0)
  {
    goto LABEL_3;
  }
  uint64_t v13 = [(TPSMonitoringEvents *)self initialDisplayEventMap];
  uint64_t v14 = [(TPSMonitoringEvents *)self registrableContextualEventsForMap:v13 type:a4];
  [v7 addObjectsFromArray:v14];

  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  long long v15 = [(TPSMonitoringEvents *)self displayEventMap];
  uint64_t v16 = [(TPSMonitoringEvents *)self registrableContextualEventsForMap:v15 type:a4];
  [v7 addObjectsFromArray:v16];

  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v17 = [(TPSMonitoringEvents *)self restartTrackingDisplayEventMap];
  uint64_t v18 = [(TPSMonitoringEvents *)self registrableContextualEventsForMap:v17 type:a4];
  [v7 addObjectsFromArray:v18];

  if ((v5 & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_14:
  uint64_t v19 = [(TPSMonitoringEvents *)self dismissalEventMap];
  uint64_t v20 = [(TPSMonitoringEvents *)self registrableContextualEventsForMap:v19 type:a4];
  [v7 addObjectsFromArray:v20];

  if ((v5 & 0x20) != 0)
  {
LABEL_7:
    uint64_t v8 = [(TPSMonitoringEvents *)self desiredOutcomeEventMap];
    v9 = [(TPSMonitoringEvents *)self registrableContextualEventsForMap:v8 type:a4];
    [v7 addObjectsFromArray:v9];
  }
LABEL_8:
  if ([v7 count])
  {
    uint64_t v10 = [v7 allObjects];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)autoDismissEvents
{
  char v3 = (void *)MEMORY[0x1E4F1CA60];
  BOOL v4 = [(TPSMonitoringEvents *)self dismissalEventMap];
  char v5 = [v3 dictionaryWithDictionary:v4];

  uint64_t v6 = [(TPSMonitoringEvents *)self desiredOutcomeEventMap];
  [v5 addEntriesFromDictionary:v6];

  BOOL v7 = [(TPSMonitoringEvents *)self displayEventMap];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    v9 = [(TPSMonitoringEvents *)self restartTrackingDisplayEventMap];
    [v5 addEntriesFromDictionary:v9];
  }
  uint64_t v10 = [v5 allValues];

  return v10;
}

- (id)registrableContextualEventsForMap:(id)a3 type:(int64_t)a4
{
  BOOL v4 = objc_msgSend(MEMORY[0x1E4F1CA80], "set", a3, a4);
  char v5 = [v4 allObjects];

  return v5;
}

- (id)clientContextKeysForMap:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = [MEMORY[0x1E4F1CA80] set];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  char v5 = objc_msgSend(v3, "allValues", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v11 = [v10 clientContextKeys];
          [v4 addObjectsFromArray:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  uint64_t v12 = [v4 allObjects];

  return v12;
}

- (id)clientContextEventsForMap:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  char v5 = objc_msgSend(v3, "allValues", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  if (v4) {
    v11 = (void *)[v4 copy];
  }
  else {
    v11 = 0;
  }

  return v11;
}

- (id)debugDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v19.receiver = self;
  v19.super_class = (Class)TPSMonitoringEvents;
  BOOL v4 = [(TPSSerializableObject *)&v19 debugDescription];
  char v5 = (void *)[v3 initWithString:v4];

  if ([(NSDictionary *)self->_initialDisplayEventMap count])
  {
    uint64_t v6 = [(NSDictionary *)self->_initialDisplayEventMap allValues];
    uint64_t v7 = [v6 debugDescription];
    [v5 appendFormat:@"%@ = %@\n", @"initialDisplayEvents", v7];
  }
  if ([(NSDictionary *)self->_displayEventMap count])
  {
    uint64_t v8 = [(NSDictionary *)self->_displayEventMap allValues];
    v9 = [v8 debugDescription];
    [v5 appendFormat:@"%@ = %@\n", @"displayEvents", v9];
  }
  if ([(NSDictionary *)self->_restartTrackingTriggerEventMap count])
  {
    uint64_t v10 = [(NSDictionary *)self->_restartTrackingTriggerEventMap allValues];
    v11 = [v10 debugDescription];
    [v5 appendFormat:@"%@ = %@\n", @"restartTrackingTriggerEvents", v11];
  }
  if ([(NSDictionary *)self->_restartTrackingDisplayEventMap count])
  {
    uint64_t v12 = [(NSDictionary *)self->_restartTrackingDisplayEventMap allValues];
    long long v13 = [v12 debugDescription];
    [v5 appendFormat:@"%@ = %@\n", @"restartTrackingDisplayEvents", v13];
  }
  if ([(NSDictionary *)self->_dismissalEventMap count])
  {
    long long v14 = [(NSDictionary *)self->_dismissalEventMap allValues];
    long long v15 = [v14 debugDescription];
    [v5 appendFormat:@"%@ = %@\n", @"dismissalEvents", v15];
  }
  if ([(NSDictionary *)self->_desiredOutcomeEventMap count])
  {
    long long v16 = [(NSDictionary *)self->_desiredOutcomeEventMap allValues];
    long long v17 = [v16 debugDescription];
    [v5 appendFormat:@"%@ = %@\n", @"desiredOutcome", v17];
  }
  return v5;
}

- (void)setInitialDisplayEventMap:(id)a3
{
}

- (void)setDisplayEventMap:(id)a3
{
}

- (void)setRestartTrackingTriggerEventMap:(id)a3
{
}

- (void)setRestartTrackingDisplayEventMap:(id)a3
{
}

- (void)setDismissalEventMap:(id)a3
{
}

- (void)setDesiredOutcomeEventMap:(id)a3
{
}

@end