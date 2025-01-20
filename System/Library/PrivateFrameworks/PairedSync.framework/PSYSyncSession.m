@interface PSYSyncSession
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)supportsMigrationSync;
- (NSArray)activities;
- (NSUUID)pairingIdentifier;
- (NSUUID)sessionIdentifier;
- (PSYSyncSession)initWithCoder:(id)a3;
- (PSYSyncSession)initWithPairingIdentifier:(id)a3 switchIndex:(int64_t)a4 sessionIdentifier:(id)a5 syncSessionType:(unint64_t)a6 supportsMigrationSync:(BOOL)a7 activities:(id)a8 state:(unint64_t)a9;
- (double)sessionProgress;
- (id)_deepCopy;
- (id)activityForLabel:(id)a3;
- (id)activityForService:(id)a3;
- (id)completedActivities;
- (id)completedActivityLabelsSet;
- (id)description;
- (id)firstIncompleteActivity;
- (id)incompleteActivities;
- (id)runningActivities;
- (id)syncSessionByReplacingActivity:(id)a3;
- (id)syncSessionByUpdatingActivities:(id)a3;
- (id)syncSessionByUpdatingSyncSessionState:(unint64_t)a3;
- (int64_t)switchIndex;
- (unint64_t)hash;
- (unint64_t)syncSessionState;
- (unint64_t)syncSessionType;
- (void)encodeWithCoder:(id)a3;
- (void)setActivities:(id)a3;
- (void)setPairingIdentifier:(id)a3;
- (void)setSessionIdentifier:(id)a3;
- (void)setSupportsMigrationSync:(BOOL)a3;
- (void)setSwitchIndex:(int64_t)a3;
- (void)setSyncSessionState:(unint64_t)a3;
- (void)setSyncSessionType:(unint64_t)a3;
@end

@implementation PSYSyncSession

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_deepCopy
{
  id v3 = objc_alloc_init((Class)objc_opt_class());
  v4 = [(PSYSyncSession *)self pairingIdentifier];
  [v3 setPairingIdentifier:v4];

  objc_msgSend(v3, "setSwitchIndex:", -[PSYSyncSession switchIndex](self, "switchIndex"));
  v5 = [(PSYSyncSession *)self sessionIdentifier];
  [v3 setSessionIdentifier:v5];

  objc_msgSend(v3, "setSyncSessionType:", -[PSYSyncSession syncSessionType](self, "syncSessionType"));
  objc_msgSend(v3, "setSupportsMigrationSync:", -[PSYSyncSession supportsMigrationSync](self, "supportsMigrationSync"));
  id v6 = objc_alloc(MEMORY[0x263EFF8C0]);
  v7 = [(PSYSyncSession *)self activities];
  v8 = (void *)[v6 initWithArray:v7 copyItems:1];
  [v3 setActivities:v8];

  objc_msgSend(v3, "setSyncSessionState:", -[PSYSyncSession syncSessionState](self, "syncSessionState"));

  return v3;
}

- (PSYSyncSession)initWithPairingIdentifier:(id)a3 switchIndex:(int64_t)a4 sessionIdentifier:(id)a5 syncSessionType:(unint64_t)a6 supportsMigrationSync:(BOOL)a7 activities:(id)a8 state:(unint64_t)a9
{
  id v16 = a3;
  id v17 = a5;
  id v18 = a8;
  v24.receiver = self;
  v24.super_class = (Class)PSYSyncSession;
  v19 = [(PSYSyncSession *)&v24 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_pairingIdentifier, a3);
    v20->_switchIndex = a4;
    objc_storeStrong((id *)&v20->_sessionIdentifier, a5);
    v20->_supportsMigrationSync = a7;
    v20->_syncSessionType = a6;
    uint64_t v21 = [v18 copy];
    activities = v20->_activities;
    v20->_activities = (NSArray *)v21;

    v20->_syncSessionState = a9;
  }

  return v20;
}

- (PSYSyncSession)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PSYSyncSession;
  v5 = [(PSYSyncSession *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pairingIdentifier"];
    pairingIdentifier = v5->_pairingIdentifier;
    v5->_pairingIdentifier = (NSUUID *)v6;

    v5->_switchIndex = [v4 decodeIntegerForKey:@"switchIndex"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sessionIdentifier"];
    sessionIdentifier = v5->_sessionIdentifier;
    v5->_sessionIdentifier = (NSUUID *)v8;

    v5->_syncSessionType = [v4 decodeIntegerForKey:@"syncSessionType"];
    v5->_supportsMigrationSync = [v4 decodeBoolForKey:@"isMigrationSync"];
    v10 = (void *)MEMORY[0x263EFFA08];
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v13 = [v4 decodeObjectOfClasses:v12 forKey:@"activities"];

    [(PSYSyncSession *)v5 setActivities:v13];
    v5->_syncSessionState = [v4 decodeIntegerForKey:@"syncSessionState"];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  pairingIdentifier = self->_pairingIdentifier;
  id v5 = a3;
  [v5 encodeObject:pairingIdentifier forKey:@"pairingIdentifier"];
  [v5 encodeObject:self->_sessionIdentifier forKey:@"sessionIdentifier"];
  [v5 encodeInteger:self->_syncSessionType forKey:@"syncSessionType"];
  [v5 encodeBool:self->_supportsMigrationSync forKey:@"isMigrationSync"];
  [v5 encodeObject:self->_activities forKey:@"activities"];
  [v5 encodeInteger:self->_syncSessionState forKey:@"syncSessionState"];
  [v5 encodeInteger:self->_switchIndex forKey:@"switchIndex"];
}

- (void)setActivities:(id)a3
{
  if (self->_activities != a3)
  {
    id v4 = a3;
    id v5 = (NSArray *)[v4 copy];
    activities = self->_activities;
    self->_activities = v5;

    id v9 = [v4 valueForKeyPath:@"activityInfo.label"];
    v7 = [NSDictionary dictionaryWithObjects:v4 forKeys:v9];

    activityMap = self->_activityMap;
    self->_activityMap = v7;
  }
}

- (id)firstIncompleteActivity
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(PSYSyncSession *)self activities];
  id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ([v6 activityState] != 2)
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)runningActivities
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF980] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(PSYSyncSession *)self activities];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 activityState] == 1) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)incompleteActivities
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF980] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(PSYSyncSession *)self activities];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 activityState] != 2) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)completedActivities
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF980] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(PSYSyncSession *)self activities];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 activityState] == 2) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)completedActivityLabelsSet
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [(PSYSyncSession *)self activities];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v9 activityState] == 2)
        {
          long long v10 = [v9 activityInfo];
          long long v11 = [v10 label];
          [v3 addObject:v11];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)activityForLabel:(id)a3
{
  return [(NSDictionary *)self->_activityMap objectForKeyedSubscript:a3];
}

- (id)activityForService:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = self->_activityMap;
  uint64_t v6 = [(NSDictionary *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v16 != v8) {
        objc_enumerationMutation(v5);
      }
      long long v10 = -[NSDictionary objectForKeyedSubscript:](self->_activityMap, "objectForKeyedSubscript:", *(void *)(*((void *)&v15 + 1) + 8 * v9), (void)v15);
      long long v11 = [v10 activityInfo];
      long long v12 = [v11 machServiceName];
      char v13 = [v12 isEqual:v4];

      if (v13) {
        break;
      }

      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSDictionary *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    long long v10 = 0;
  }

  return v10;
}

- (id)syncSessionByUpdatingActivities:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = self;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      long long v10 = v5;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v5 = [(PSYSyncSession *)v10 syncSessionByReplacingActivity:*(void *)(*((void *)&v12 + 1) + 8 * v9)];

        ++v9;
        long long v10 = v5;
      }
      while (v7 != v9);
      uint64_t v7 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v5;
}

- (id)syncSessionByReplacingActivity:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 activityInfo];
  uint64_t v6 = [v5 label];

  activities = self->_activities;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __49__PSYSyncSession_syncSessionByReplacingActivity___block_invoke;
  v21[3] = &unk_2642B4240;
  id v8 = v6;
  id v22 = v8;
  uint64_t v9 = [(NSArray *)activities indexOfObjectPassingTest:v21];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    long long v10 = 0;
  }
  else
  {
    uint64_t v11 = v9;
    long long v12 = [(NSArray *)self->_activities objectAtIndexedSubscript:v9];
    if ([v12 isEqual:v4])
    {
      long long v10 = self;
    }
    else
    {
      size_t v13 = [(NSArray *)self->_activities count];
      long long v14 = malloc_type_calloc(v13, 8uLL, 0x80040B8603338uLL);
      if (!v14)
      {
        long long v18 = psy_log();
        BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);

        if (v19)
        {
          uint64_t v20 = psy_log();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            -[PSYSyncSession syncSessionByReplacingActivity:](v20);
          }
        }
        abort();
      }
      long long v15 = v14;
      -[NSArray getObjects:range:](self->_activities, "getObjects:range:", v14, 0, v13);
      v15[v11] = v4;
      long long v10 = [(PSYSyncSession *)self _deepCopy];
      long long v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:v13];
      [(PSYSyncSession *)v10 setActivities:v16];
      free(v15);
    }
  }

  return v10;
}

uint64_t __49__PSYSyncSession_syncSessionByReplacingActivity___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 activityInfo];
  id v4 = [v3 label];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

- (id)syncSessionByUpdatingSyncSessionState:(unint64_t)a3
{
  if (self->_syncSessionState == a3)
  {
    id v4 = self;
  }
  else
  {
    id v4 = (PSYSyncSession *)objc_alloc_init((Class)objc_opt_class());
    objc_storeStrong((id *)&v4->_pairingIdentifier, self->_pairingIdentifier);
    v4->_switchIndex = self->_switchIndex;
    objc_storeStrong((id *)&v4->_sessionIdentifier, self->_sessionIdentifier);
    [(PSYSyncSession *)v4 setActivities:self->_activities];
    v4->_syncSessionType = self->_syncSessionType;
    v4->_supportsMigrationSync = self->_supportsMigrationSync;
    v4->_syncSessionState = a3;
  }

  return v4;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSUUID *)self->_sessionIdentifier hash];
  uint64_t v4 = [(NSUUID *)self->_pairingIdentifier hash] ^ v3;
  return v4 ^ [(NSArray *)self->_activities hash] ^ self->_switchIndex;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PSYSyncSession *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      uint64_t v6 = v5;
      if (v5->_syncSessionType == self->_syncSessionType
        && v5->_supportsMigrationSync == self->_supportsMigrationSync
        && v5->_syncSessionState == self->_syncSessionState
        && [(NSUUID *)v5->_pairingIdentifier isEqual:self->_pairingIdentifier]
        && v6->_switchIndex == self->_switchIndex
        && [(NSUUID *)v6->_sessionIdentifier isEqual:self->_sessionIdentifier])
      {
        char v7 = [(NSArray *)v6->_activities isEqualToArray:self->_activities];
      }
      else
      {
        char v7 = 0;
      }
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (double)sessionProgress
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  double result = 1.0;
  if (self->_syncSessionState != 2)
  {
    NSUInteger v4 = [(NSArray *)self->_activities count];
    if (v4)
    {
      unint64_t v5 = v4;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      uint64_t v6 = self->_activities;
      uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        unint64_t v9 = 0;
        uint64_t v10 = *(void *)v16;
        double v11 = 0.0;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v16 != v10) {
              objc_enumerationMutation(v6);
            }
            size_t v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
            if (objc_msgSend(v13, "activityState", (void)v15) == 2)
            {
              ++v9;
            }
            else if ([v13 activityState] == 1)
            {
              [v13 activityProgress];
              double v11 = v11 + v14;
            }
          }
          uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v8);
      }
      else
      {
        unint64_t v9 = 0;
        double v11 = 0.0;
      }

      return v11 / (double)v5 + (double)v9 / (double)v5;
    }
    else
    {
      return 0.0;
    }
  }
  return result;
}

- (id)description
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263F089D8] string];
  NSUInteger v4 = (objc_class *)objc_opt_class();
  unint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [(NSUUID *)self->_pairingIdentifier UUIDString];
  uint64_t v7 = [NSNumber numberWithInteger:self->_switchIndex];
  uint64_t v8 = [(NSUUID *)self->_sessionIdentifier UUIDString];
  unint64_t v9 = NSStringfromPSYSyncSessionType(self->_syncSessionType);
  if (self->_supportsMigrationSync) {
    uint64_t v10 = @"YES";
  }
  else {
    uint64_t v10 = @"NO";
  }
  unint64_t syncSessionState = self->_syncSessionState;
  if (syncSessionState > 2) {
    long long v12 = &stru_26C7F6DA8;
  }
  else {
    long long v12 = off_2642B4260[syncSessionState];
  }
  [(PSYSyncSession *)self sessionProgress];
  objc_msgSend(v3, "appendFormat:", @"<%@ %p;\n\tpairingID=%@[%@] session=%@ type=%@ migration=%@ state='%@' progress=%1.3f activities:\n",
    v5,
    self,
    v6,
    v7,
    v8,
    v9,
    v10,
    v12,
    v13);

  uint64_t v40 = 0;
  int v34 = [MEMORY[0x263F5BAC0] getDropoutCounter:&v40];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  obj = self->_activities;
  uint64_t v14 = [(NSArray *)obj countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v37 != v16) {
          objc_enumerationMutation(obj);
        }
        long long v18 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        BOOL v19 = (void *)[@"\t" mutableCopy];
        uint64_t v20 = [v18 activityInfo];
        uint64_t v21 = [v20 label];
        id v22 = [v21 stringByReplacingOccurrencesOfString:@"com.apple.pairedsync." withString:&stru_26C7F6DA8];

        unint64_t v23 = [v18 activityState];
        objc_super v24 = &stru_26C7F6DA8;
        if (v23 <= 2) {
          objc_super v24 = off_2642B4260[v23];
        }
        [v19 appendFormat:@"%@ '%@'", v22, v24];
        if ([v18 activityState] != 1)
        {
          if (![v18 activityState])
          {
            uint64_t v25 = 63;
            goto LABEL_28;
          }
          BOOL v28 = [v18 sawADropout] == 0;
          goto LABEL_24;
        }
        if ([v18 sawADropout]) {
          uint64_t v25 = 49;
        }
        else {
          uint64_t v25 = 63;
        }
        if ([v18 startDropoutCount])
        {
          uint64_t v26 = [v18 startDropoutCount];
          int v27 = v34;
          if (v26 != v40) {
            int v27 = 1;
          }
          BOOL v28 = v27 == 0;
LABEL_24:
          if (v28) {
            uint64_t v25 = 48;
          }
          else {
            uint64_t v25 = 49;
          }
        }
LABEL_28:
        v29 = objc_msgSend(NSString, "stringWithFormat:", @" X%c", v25);
        [v19 appendString:v29];

        if ([v18 activityState] == 1)
        {
          [v18 activityProgress];
          objc_msgSend(v19, "appendFormat:", @"; progress=%1.3f", v30);
        }
        else if ([v18 activityState] == 2)
        {
          v31 = [v18 error];

          if (v31)
          {
            v32 = [v18 error];
            [v19 appendFormat:@"; error=\"%@\"", v32];
          }
        }
        [v3 appendString:v19];
        [v3 appendString:@"\n"];
      }
      uint64_t v15 = [(NSArray *)obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v15);
  }

  [v3 appendString:@">"];

  return v3;
}

- (unint64_t)syncSessionType
{
  if (self->_syncSessionType == 2 && !self->_supportsMigrationSync) {
    return 0;
  }
  else {
    return self->_syncSessionType;
  }
}

- (NSUUID)pairingIdentifier
{
  return self->_pairingIdentifier;
}

- (void)setPairingIdentifier:(id)a3
{
}

- (int64_t)switchIndex
{
  return self->_switchIndex;
}

- (void)setSwitchIndex:(int64_t)a3
{
  self->_switchIndex = a3;
}

- (NSUUID)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
}

- (void)setSyncSessionType:(unint64_t)a3
{
  self->_syncSessionType = a3;
}

- (BOOL)supportsMigrationSync
{
  return self->_supportsMigrationSync;
}

- (void)setSupportsMigrationSync:(BOOL)a3
{
  self->_supportsMigrationSync = a3;
}

- (NSArray)activities
{
  return self->_activities;
}

- (unint64_t)syncSessionState
{
  return self->_syncSessionState;
}

- (void)setSyncSessionState:(unint64_t)a3
{
  self->_unint64_t syncSessionState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activities, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_pairingIdentifier, 0);

  objc_storeStrong((id *)&self->_activityMap, 0);
}

- (void)syncSessionByReplacingActivity:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2179FA000, log, OS_LOG_TYPE_ERROR, "Error allocating memory. Aborting!!!", v1, 2u);
}

@end