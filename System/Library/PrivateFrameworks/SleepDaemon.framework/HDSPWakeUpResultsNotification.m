@interface HDSPWakeUpResultsNotification
+ (id)goalAchievedQuantityForCategory:(unint64_t)a3 userInfo:(id)a4;
+ (id)goalAchievedUserInfoKeyForCategory:(unint64_t)a3;
+ (id)wakeUpResultsNotificationFromUserInfo:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToNotification:(id)a3;
- (BOOL)isOneNight;
- (HDSPWakeUpResultsNotification)initWithCategory:(unint64_t)a3 endMorningIndex:(int64_t)a4 goalAchieved:(id)a5 notificationVariant:(int64_t)a6 userFirstName:(id)a7;
- (HKQuantity)goalAchieved;
- (NSDictionary)userInfo;
- (NSString)categoryIdentifier;
- (NSString)identifier;
- (NSString)userFirstName;
- (int64_t)endMorningIndex;
- (int64_t)goalAchievedUserInfoValue;
- (int64_t)notificationVariant;
- (unint64_t)category;
- (unint64_t)hash;
@end

@implementation HDSPWakeUpResultsNotification

- (HDSPWakeUpResultsNotification)initWithCategory:(unint64_t)a3 endMorningIndex:(int64_t)a4 goalAchieved:(id)a5 notificationVariant:(int64_t)a6 userFirstName:(id)a7
{
  id v12 = a5;
  id v13 = a7;
  v26.receiver = self;
  v26.super_class = (Class)HDSPWakeUpResultsNotification;
  v14 = [(HDSPWakeUpResultsNotification *)&v26 init];
  v15 = v14;
  if (v14)
  {
    v14->_category = a3;
    uint64_t v16 = [v12 copy];
    goalAchieved = v15->_goalAchieved;
    v15->_goalAchieved = (HKQuantity *)v16;

    v15->_endMorningIndex = a4;
    if (a6 < 1)
    {
      int64_t v19 = 1;
    }
    else
    {
      if (a3 > 2) {
        unint64_t v18 = 0;
      }
      else {
        unint64_t v18 = qword_221AD62F8[a3];
      }
      if (v18 < a6) {
        int64_t v19 = 1;
      }
      else {
        int64_t v19 = a6;
      }
    }
    v15->_notificationVariant = v19;
    id v20 = v13;
    v21 = v20;
    if (v20 && [v20 length])
    {
      uint64_t v22 = objc_msgSend(v21, "hk_stripLeadingTrailingWhitespace");
    }
    else
    {
      uint64_t v22 = 0;
    }

    userFirstName = v15->_userFirstName;
    v15->_userFirstName = (NSString *)v22;

    v24 = v15;
  }

  return v15;
}

+ (id)wakeUpResultsNotificationFromUserInfo:(id)a3
{
  id v4 = a3;
  v5 = [v4 allKeys];
  unint64_t v6 = [v5 count];

  if (v6 < 4)
  {
    v7 = 0;
    goto LABEL_22;
  }
  v8 = [v4 objectForKeyedSubscript:*MEMORY[0x263F75D38]];
  v9 = v8;
  if (v8)
  {
    id v10 = v8;
    if ([v10 isEqualToString:*MEMORY[0x263F75AE8]])
    {
      uint64_t v11 = 0;
    }
    else if ([v10 isEqualToString:*MEMORY[0x263F75AF0]])
    {
      uint64_t v11 = 1;
    }
    else
    {
      if (![v10 isEqualToString:*MEMORY[0x263F75D00]]) {
        goto LABEL_15;
      }
      uint64_t v11 = 2;
    }

    id v10 = [v4 objectForKeyedSubscript:*MEMORY[0x263F75D48]];
    if (v10)
    {
      id v12 = [v4 objectForKeyedSubscript:*MEMORY[0x263F75D60]];
      if (v12)
      {
        id v13 = [a1 goalAchievedQuantityForCategory:v11 userInfo:v4];
        if (v13)
        {
          v14 = [v4 objectForKeyedSubscript:*MEMORY[0x263F75D40]];
          v7 = objc_msgSend(objc_alloc((Class)a1), "initWithCategory:endMorningIndex:goalAchieved:notificationVariant:userFirstName:", v11, objc_msgSend(v10, "integerValue"), v13, objc_msgSend(v12, "integerValue"), v14);
        }
        else
        {
          v7 = 0;
        }
      }
      else
      {
        v7 = 0;
      }

      goto LABEL_20;
    }
LABEL_15:
    v7 = 0;
LABEL_20:

    goto LABEL_21;
  }
  v7 = 0;
LABEL_21:

LABEL_22:

  return v7;
}

- (NSString)categoryIdentifier
{
  return (NSString *)HDSPWakeUpResultsCategoryIdentifier(self->_category);
}

- (NSString)identifier
{
  return (NSString *)(id)*MEMORY[0x263F75C48];
}

- (NSDictionary)userInfo
{
  v16[4] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263EFF9A0]);
  v15[0] = *MEMORY[0x263F75D38];
  id v4 = HDSPWakeUpResultsCategoryIdentifier(self->_category);
  v16[0] = v4;
  v15[1] = *MEMORY[0x263F75D48];
  v5 = [NSNumber numberWithInteger:self->_endMorningIndex];
  v16[1] = v5;
  v15[2] = *MEMORY[0x263F75D60];
  unint64_t v6 = [NSNumber numberWithInteger:self->_notificationVariant];
  v16[2] = v6;
  v7 = [(id)objc_opt_class() goalAchievedUserInfoKeyForCategory:self->_category];
  v15[3] = v7;
  v8 = objc_msgSend(NSNumber, "numberWithInteger:", -[HDSPWakeUpResultsNotification goalAchievedUserInfoValue](self, "goalAchievedUserInfoValue"));
  v16[3] = v8;
  v9 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:4];
  id v10 = (void *)[v3 initWithDictionary:v9];

  uint64_t v11 = [(HDSPWakeUpResultsNotification *)self userFirstName];

  if (v11)
  {
    id v12 = [(HDSPWakeUpResultsNotification *)self userFirstName];
    [v10 setObject:v12 forKeyedSubscript:*MEMORY[0x263F75D40]];
  }
  id v13 = (void *)[v10 copy];

  return (NSDictionary *)v13;
}

- (BOOL)isEqualToNotification:(id)a3
{
  id v4 = a3;
  unint64_t category = self->_category;
  if (category == [v4 category]
    && (int64_t endMorningIndex = self->_endMorningIndex, endMorningIndex == [v4 endMorningIndex]))
  {
    int64_t v7 = [(HDSPWakeUpResultsNotification *)self goalAchievedUserInfoValue];
    BOOL v8 = v7 == [v4 goalAchievedUserInfoValue];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HDSPWakeUpResultsNotification *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(HDSPWakeUpResultsNotification *)self isEqualToNotification:v4];
  }

  return v5;
}

- (unint64_t)hash
{
  unint64_t v2 = self->_endMorningIndex ^ self->_category;
  return v2 ^ [(HDSPWakeUpResultsNotification *)self goalAchievedUserInfoValue];
}

- (BOOL)isOneNight
{
  return self->_category == 0;
}

- (int64_t)goalAchievedUserInfoValue
{
  BOOL v3 = [(HDSPWakeUpResultsNotification *)self isOneNight];
  goalAchieved = self->_goalAchieved;
  if (v3) {
    [MEMORY[0x263F0A830] secondUnit];
  }
  else {
  BOOL v5 = [MEMORY[0x263F0A830] dayUnit];
  }
  [(HKQuantity *)goalAchieved doubleValueForUnit:v5];
  double v7 = v6;

  return (uint64_t)v7;
}

+ (id)goalAchievedUserInfoKeyForCategory:(unint64_t)a3
{
  BOOL v3 = (id *)MEMORY[0x263F75D58];
  if (a3) {
    BOOL v3 = (id *)MEMORY[0x263F75D50];
  }
  return *v3;
}

+ (id)goalAchievedQuantityForCategory:(unint64_t)a3 userInfo:(id)a4
{
  id v6 = a4;
  double v7 = [a1 goalAchievedUserInfoKeyForCategory:a3];
  if (a3) {
    [MEMORY[0x263F0A830] dayUnit];
  }
  else {
  BOOL v8 = [MEMORY[0x263F0A830] secondUnit];
  }
  v9 = [v6 objectForKeyedSubscript:v7];

  if (v9)
  {
    id v10 = (void *)MEMORY[0x263F0A630];
    [v9 doubleValue];
    uint64_t v11 = objc_msgSend(v10, "quantityWithUnit:doubleValue:", v8);
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (unint64_t)category
{
  return self->_category;
}

- (HKQuantity)goalAchieved
{
  return self->_goalAchieved;
}

- (int64_t)endMorningIndex
{
  return self->_endMorningIndex;
}

- (int64_t)notificationVariant
{
  return self->_notificationVariant;
}

- (NSString)userFirstName
{
  return self->_userFirstName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userFirstName, 0);

  objc_storeStrong((id *)&self->_goalAchieved, 0);
}

@end