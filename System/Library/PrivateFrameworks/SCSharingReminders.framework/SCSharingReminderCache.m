@interface SCSharingReminderCache
+ (BOOL)supportsSecureCoding;
+ (id)cacheWithState:(id *)a3;
+ (id)new;
- ($036EC2AD71A582527DAFF881AF25695D)toCacheState;
- (BOOL)isEqual:(id)a3;
- (NSArray)ignoredIdentifiers;
- (NSArray)scheduledReminders;
- (NSDate)lastFiredDate;
- (NSMutableDictionary)ignorableIdentifiersByType;
- (NSMutableDictionary)sharingRemindersByType;
- (NSMutableOrderedSet)scheduledSharingReminders;
- (SCSharingReminderCache)initWithCoder:(id)a3;
- (id)description;
- (id)ignoredIdentifiersForType:(id)a3;
- (id)initFromState:(id *)a3;
- (id)remindersDueBy:(id)a3;
- (int64_t)consecutiveNotificationCount;
- (void)addIgnoredIdentifiers:(id)a3 withType:(id)a4;
- (void)addSharingReminders:(id)a3;
- (void)deliverGeneralSharingReminderAfter:(double)a3;
- (void)encodeWithCoder:(id)a3;
- (void)incrementNotificationCount;
- (void)removeRemindersWithIdentifiers:(id)a3;
- (void)removeSharingReminders:(id)a3 wereDelivered:(BOOL)a4;
- (void)resetNotificationCount;
- (void)setIgnorableIdentifiersByType:(id)a3;
- (void)setLastFiredDate:(id)a3;
- (void)setScheduledSharingReminders:(id)a3;
- (void)setSharingRemindersByType:(id)a3;
@end

@implementation SCSharingReminderCache

+ (id)new
{
  long long v7 = xmmword_265496C18;
  long long v8 = unk_265496C28;
  id result = [SCSharingReminderCache alloc];
  v3[0] = 0;
  uint64_t v4 = 0;
  uint64_t v5 = MEMORY[0x263EFFA68];
  uint64_t v6 = MEMORY[0x263EFFA78];
  if (result) {
    return (id)[result initFromState:v3];
  }
  return result;
}

+ (id)cacheWithState:(id *)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id var1 = a3->var1;
  uint64_t v5 = [MEMORY[0x263EFF910] now];
  uint64_t v6 = [var1 laterDate:v5];
  int v7 = [v6 isEqualToDate:a3->var1];

  if (v7)
  {
    long long v8 = SCLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = localizedDateStringFromUTC((uint64_t)a3->var1);
      +[SCSharingReminderCache cacheWithState:v8];
    }
  }
  else
  {
    v10 = [SCSharingReminderCache alloc];
    __copy_constructor_8_8_t0w1_s8_s16_s24((uint64_t)v13, (uint64_t)a3);
    if (v10)
    {
      id v11 = [(SCSharingReminderCache *)v10 initFromState:v13];
      goto LABEL_8;
    }

    long long v8 = v13[3];
  }

  id v11 = 0;
LABEL_8:
  __destructor_8_s8_s16_s24((uint64_t)a3);
  return v11;
}

- (id)initFromState:(id *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SCSharingReminderCache;
  uint64_t v4 = [(SCSharingReminderCache *)&v12 init];
  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    scheduledSharingReminders = v4->_scheduledSharingReminders;
    v4->_scheduledSharingReminders = (NSMutableOrderedSet *)v5;

    uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
    sharingRemindersByType = v4->_sharingRemindersByType;
    v4->_sharingRemindersByType = (NSMutableDictionary *)v7;

    v4->_consecutiveNotificationCount = a3->var0;
    objc_storeStrong((id *)&v4->_lastFiredDate, a3->var1);
    uint64_t v9 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:a3->var3];
    ignorableIdentifiersByType = v4->_ignorableIdentifiersByType;
    v4->_ignorableIdentifiersByType = (NSMutableDictionary *)v9;

    [(SCSharingReminderCache *)v4 addSharingReminders:a3->var2];
  }
  __destructor_8_s8_s16_s24((uint64_t)a3);
  return v4;
}

- (void)addSharingReminders:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && [v4 count])
  {
    uint64_t v6 = [(SCSharingReminderCache *)self scheduledSharingReminders];
    [v6 addObjectsFromArray:v5];

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v21 = v5;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_super v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          v13 = [v12 type];
          v14 = [(SCSharingReminderCache *)self sharingRemindersByType];
          uint64_t v15 = [v14 valueForKey:v13];

          if (!v15)
          {
            v16 = [(SCSharingReminderCache *)self sharingRemindersByType];
            v17 = [MEMORY[0x263EFF9B0] orderedSet];
            [v16 setValue:v17 forKey:v13];
          }
          v18 = [(SCSharingReminderCache *)self sharingRemindersByType];
          v19 = [v18 valueForKey:v13];

          [v19 addObject:v12];
          v20 = [(SCSharingReminderCache *)self sharingRemindersByType];
          [v20 setValue:v19 forKey:v13];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v9);
    }

    uint64_t v5 = v21;
  }
}

- (void)removeSharingReminders:(id)a3 wereDelivered:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v35 = *MEMORY[0x263EF8340];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = a3;
  uint64_t v27 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v27)
  {
    uint64_t v6 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v29 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v9 = [(SCSharingReminderCache *)self scheduledSharingReminders];
        uint64_t v10 = [v9 indexOfObject:v8];

        if (v10 == 0x7FFFFFFFFFFFFFFFLL)
        {
          id v11 = SCLogger();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v33 = v8;
            _os_log_impl(&dword_25B654000, v11, OS_LOG_TYPE_INFO, "\"Asked to remove a reminder that cache doesn't have: [%@]\"", buf, 0xCu);
          }
        }
        else
        {
          id v11 = [(SCSharingReminderCache *)self scheduledSharingReminders];
          [v11 removeObjectAtIndex:v10];
        }

        objc_super v12 = [v8 type];
        v13 = [(SCSharingReminderCache *)self sharingRemindersByType];
        v14 = [v13 objectForKey:v12];

        if (!v14)
        {
          v16 = SCLogger();
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
            goto LABEL_18;
          }
          *(_DWORD *)buf = 138412290;
          v33 = v8;
          v17 = v16;
          v18 = "\"Asked to remove a reminder type that cache type map doesn't have: [%@]\"";
          goto LABEL_16;
        }
        uint64_t v15 = [v14 indexOfObject:v8];
        if (v15 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v16 = SCLogger();
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
            goto LABEL_18;
          }
          *(_DWORD *)buf = 138412290;
          v33 = v8;
          v17 = v16;
          v18 = "\"Asked to remove a reminder that cache type map doesn't have: [%@]\"";
LABEL_16:
          _os_log_impl(&dword_25B654000, v17, OS_LOG_TYPE_INFO, v18, buf, 0xCu);
          goto LABEL_18;
        }
        [v14 removeObjectAtIndex:v15];
        v16 = [(SCSharingReminderCache *)self sharingRemindersByType];
        [v16 setObject:v14 forKey:v12];
LABEL_18:

        if (v4)
        {
          uint64_t v19 = v6;
          BOOL v20 = v4;
          v21 = [MEMORY[0x263EFF910] now];
          [(SCSharingReminderCache *)self setLastFiredDate:v21];

          long long v22 = [v8 identifier];
          long long v23 = [(SCSharingReminderCache *)self ignorableIdentifiersByType];
          long long v24 = [v23 valueForKey:v12];

          if (!v24)
          {
            long long v24 = [MEMORY[0x263EFF9B0] orderedSet];
          }
          if ([v24 containsObject:v22])
          {
            long long v25 = SCLogger();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v33 = v8;
              _os_log_error_impl(&dword_25B654000, v25, OS_LOG_TYPE_ERROR, "@\"Delivered a reminder: %@ whose identifier is already in our delivered list\"", buf, 0xCu);
            }
          }
          else
          {
            [v24 addObject:v22];
            long long v25 = [(SCSharingReminderCache *)self ignorableIdentifiersByType];
            [v25 setObject:v24 forKey:v12];
          }

          BOOL v4 = v20;
          uint64_t v6 = v19;
        }
      }
      uint64_t v27 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v27);
  }
}

- (void)removeRemindersWithIdentifiers:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = SCLogger();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v4;
    _os_log_impl(&dword_25B654000, v5, OS_LOG_TYPE_INFO, "\"Removing sharing reminders with the following identifiers: %@\"", buf, 0xCu);
  }

  uint64_t v6 = [(SCSharingReminderCache *)self scheduledSharingReminders];
  id v7 = [v6 valueForKey:@"identifier"];

  uint64_t v8 = [MEMORY[0x263EFF980] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = objc_msgSend(v4, "indexOfObject:", *(void *)(*((void *)&v18 + 1) + 8 * v13), (void)v18);
        if (v14 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v15 = v14;
          v16 = [(SCSharingReminderCache *)self scheduledSharingReminders];
          v17 = [v16 objectAtIndexedSubscript:v15];
          [v8 addObject:v17];
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  [(SCSharingReminderCache *)self removeSharingReminders:v8 wereDelivered:0];
}

- (void)deliverGeneralSharingReminderAfter:(double)a3
{
  if (a3 >= 0.0)
  {
    uint64_t v6 = [(SCSharingReminderCache *)self sharingRemindersByType];
    id v7 = [v6 valueForKey:@"com.apple.safetycheckd.general"];
    id v4 = [v7 array];

    if ((unint64_t)[v4 count] >= 2)
    {
      uint64_t v8 = SCLogger();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[SCSharingReminderCache deliverGeneralSharingReminderAfter:](v4, v8);
      }
    }
    [(SCSharingReminderCache *)self removeSharingReminders:v4 wereDelivered:0];
  }
  else
  {
    id v4 = SCLogger();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[SCSharingReminderCache deliverGeneralSharingReminderAfter:](v4, a3);
    }
  }
}

- (void)resetNotificationCount
{
  self->_consecutiveNotificationCount = 0;
}

- (void)incrementNotificationCount
{
}

- (id)remindersDueBy:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263EFF980] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = [(SCSharingReminderCache *)self scheduledSharingReminders];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v12 = [v11 scheduledDate];
        uint64_t v13 = [v12 earlierDate:v4];
        uint64_t v14 = [v11 scheduledDate];

        if (v13 == v14) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  return v5;
}

- (NSArray)scheduledReminders
{
  v2 = [(SCSharingReminderCache *)self scheduledSharingReminders];
  v3 = [v2 array];

  return (NSArray *)v3;
}

- ($036EC2AD71A582527DAFF881AF25695D)toCacheState
{
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  retstr->var0 = [(SCSharingReminderCache *)self consecutiveNotificationCount];
  retstr->id var1 = [(SCSharingReminderCache *)self lastFiredDate];
  id v7 = [(SCSharingReminderCache *)self scheduledSharingReminders];
  retstr->var2 = (id)[v7 copy];
  uint64_t v5 = [(SCSharingReminderCache *)self ignorableIdentifiersByType];
  retstr->var3 = (id)[v5 copy];

  return result;
}

- (void)addIgnoredIdentifiers:(id)a3 withType:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(SCSharingReminderCache *)self ignorableIdentifiersByType];
  uint64_t v8 = [v7 valueForKey:v6];

  if (!v8)
  {
    uint64_t v8 = [MEMORY[0x263EFF9B0] orderedSet];
  }
  [v8 addObjectsFromArray:v10];
  uint64_t v9 = [(SCSharingReminderCache *)self ignorableIdentifiersByType];
  [v9 setValue:v8 forKey:v6];
}

- (id)ignoredIdentifiersForType:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SCSharingReminderCache *)self ignorableIdentifiersByType];
  id v6 = [v5 valueForKey:v4];

  id v7 = [v6 array];

  return v7;
}

- (NSArray)ignoredIdentifiers
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9B0] orderedSet];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(SCSharingReminderCache *)self ignorableIdentifiersByType];
  uint64_t v5 = [v4 allValues];

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
        id v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) allObjects];
        [v3 addObjectsFromArray:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  uint64_t v11 = [v3 array];

  return (NSArray *)v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SCSharingReminderCache *)self scheduledSharingReminders];
  uint64_t v6 = [v5 array];
  [v4 encodeObject:v6 forKey:@"scheduledSharingReminders"];

  uint64_t v7 = [(SCSharingReminderCache *)self ignorableIdentifiersByType];
  [v4 encodeObject:v7 forKey:@"deliveredIdentifiersMap"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[SCSharingReminderCache consecutiveNotificationCount](self, "consecutiveNotificationCount"), @"consecutiveNotificationCount");
  id v8 = [(SCSharingReminderCache *)self lastFiredDate];
  [v4 encodeObject:v8 forKey:@"lastFiredDate"];
}

- (SCSharingReminderCache)initWithCoder:(id)a3
{
  v22[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SCSharingReminderCache;
  uint64_t v5 = [(SCSharingReminderCache *)&v20 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x263EFFA08];
    v22[0] = objc_opt_class();
    v22[1] = objc_opt_class();
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
    id v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"scheduledSharingReminders"];

    uint64_t v10 = [MEMORY[0x263EFF9B0] orderedSetWithArray:v9];
    scheduledSharingReminders = v5->_scheduledSharingReminders;
    v5->_scheduledSharingReminders = (NSMutableOrderedSet *)v10;

    uint64_t v12 = (void *)MEMORY[0x263EFFA08];
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    v21[2] = objc_opt_class();
    long long v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:3];
    long long v14 = [v12 setWithArray:v13];
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"deliveredIdentifiersMap"];
    ignorableIdentifiersByType = v5->_ignorableIdentifiersByType;
    v5->_ignorableIdentifiersByType = (NSMutableDictionary *)v15;

    v5->_consecutiveNotificationCount = [v4 decodeIntegerForKey:@"consecutiveNotificationCount"];
    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastFiredDate"];
    lastFiredDate = v5->_lastFiredDate;
    v5->_lastFiredDate = (NSDate *)v17;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SCSharingReminderCache *)a3;
  if (v4 == self)
  {
    char v17 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      uint64_t v6 = [(SCSharingReminderCache *)v5 consecutiveNotificationCount];
      if (v6 != [(SCSharingReminderCache *)self consecutiveNotificationCount]) {
        goto LABEL_9;
      }
      uint64_t v7 = [(SCSharingReminderCache *)v5 scheduledSharingReminders];
      uint64_t v8 = [v7 hash];
      uint64_t v9 = [(SCSharingReminderCache *)self scheduledSharingReminders];
      uint64_t v10 = [v9 hash];

      if (v8 != v10) {
        goto LABEL_9;
      }
      uint64_t v11 = [MEMORY[0x263EFF8F0] currentCalendar];
      uint64_t v12 = [(SCSharingReminderCache *)v5 lastFiredDate];
      long long v13 = [(SCSharingReminderCache *)self lastFiredDate];
      int v14 = [v11 isDate:v12 inSameDayAsDate:v13];

      if (v14)
      {
        uint64_t v15 = [(SCSharingReminderCache *)v5 ignoredIdentifiers];
        long long v16 = [(SCSharingReminderCache *)self ignoredIdentifiers];
        char v17 = [v15 isEqualToArray:v16];
      }
      else
      {
LABEL_9:
        char v17 = 0;
      }
    }
    else
    {
      char v17 = 0;
    }
  }

  return v17;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(SCSharingReminderCache *)self scheduledSharingReminders];
  int64_t v5 = [(SCSharingReminderCache *)self consecutiveNotificationCount];
  uint64_t v6 = [(SCSharingReminderCache *)self lastFiredDate];
  uint64_t v7 = localizedDateStringFromUTC((uint64_t)v6);
  uint64_t v8 = [(SCSharingReminderCache *)self ignoredIdentifiers];
  uint64_t v9 = [v3 stringWithFormat:@"[SCSharingReminderCache] Reminders: %@ notification count: %lu last fired date: %@ ignored: %@", v4, v5, v7, v8];

  return v9;
}

- (int64_t)consecutiveNotificationCount
{
  return self->_consecutiveNotificationCount;
}

- (NSDate)lastFiredDate
{
  return self->_lastFiredDate;
}

- (void)setLastFiredDate:(id)a3
{
}

- (NSMutableOrderedSet)scheduledSharingReminders
{
  return self->_scheduledSharingReminders;
}

- (void)setScheduledSharingReminders:(id)a3
{
}

- (NSMutableDictionary)sharingRemindersByType
{
  return self->_sharingRemindersByType;
}

- (void)setSharingRemindersByType:(id)a3
{
}

- (NSMutableDictionary)ignorableIdentifiersByType
{
  return self->_ignorableIdentifiersByType;
}

- (void)setIgnorableIdentifiersByType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignorableIdentifiersByType, 0);
  objc_storeStrong((id *)&self->_sharingRemindersByType, 0);
  objc_storeStrong((id *)&self->_scheduledSharingReminders, 0);
  objc_storeStrong((id *)&self->_lastFiredDate, 0);
}

+ (void)cacheWithState:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_25B654000, log, OS_LOG_TYPE_ERROR, "\"Error: initiating cache with a nonsensical last fired date [%@]\"", buf, 0xCu);
}

- (void)deliverGeneralSharingReminderAfter:(os_log_t)log .cold.1(os_log_t log, double a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = (uint64_t)a2;
  _os_log_error_impl(&dword_25B654000, log, OS_LOG_TYPE_ERROR, "@\"Cache was asked to deliver a sharing reminder in the past: %ld\"", (uint8_t *)&v2, 0xCu);
}

- (void)deliverGeneralSharingReminderAfter:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 134217984;
  uint64_t v4 = [a1 count];
  _os_log_debug_impl(&dword_25B654000, a2, OS_LOG_TYPE_DEBUG, "\"Expected 0 or 1 general sharing reminder while resetting but found: %lu\"", (uint8_t *)&v3, 0xCu);
}

@end