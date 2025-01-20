@interface UIConcreteLocalNotification
+ (BOOL)supportsSecureCoding;
- (BOOL)hasAction;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTriggeredByDate;
- (BOOL)isTriggeredByRegion;
- (BOOL)isValid;
- (BOOL)regionTriggersOnce;
- (UIConcreteLocalNotification)init;
- (UIConcreteLocalNotification)initWithCoder:(id)a3;
- (id)alertAction;
- (id)alertBody;
- (id)alertLaunchImage;
- (id)alertTitle;
- (id)category;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)fireDate;
- (id)nextFireDateAfterDate:(id)a3 localTimeZone:(id)a4;
- (id)nextFireDateForLastFireDate:(id)a3;
- (id)region;
- (id)repeatCalendar;
- (id)soundName;
- (id)timeZone;
- (id)userInfo;
- (int64_t)applicationIconBadgeNumber;
- (int64_t)compareFireDates:(id)a3;
- (unint64_t)hash;
- (unint64_t)repeatInterval;
- (void)_setUserInfoData:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAlertAction:(id)a3;
- (void)setAlertBody:(id)a3;
- (void)setAlertLaunchImage:(id)a3;
- (void)setAlertTitle:(id)a3;
- (void)setApplicationIconBadgeNumber:(int64_t)a3;
- (void)setCategory:(id)a3;
- (void)setFireDate:(id)a3;
- (void)setHasAction:(BOOL)a3;
- (void)setRegion:(id)a3;
- (void)setRegionTriggersOnce:(BOOL)a3;
- (void)setRepeatCalendar:(id)a3;
- (void)setRepeatInterval:(unint64_t)a3;
- (void)setSoundName:(id)a3;
- (void)setTimeZone:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)validate;
@end

@implementation UIConcreteLocalNotification

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIConcreteLocalNotification)init
{
  v5.receiver = self;
  v5.super_class = (Class)UIConcreteLocalNotification;
  v2 = [(UILocalNotification *)&v5 init];
  v3 = v2;
  if (v2) {
    UILocalNotificationCommonInit(v2);
  }
  return v3;
}

- (UIConcreteLocalNotification)initWithCoder:(id)a3
{
  id v5 = a3;
  if (([v5 allowsKeyedCoding] & 1) == 0)
  {
    v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2 object:self file:@"UILocalNotification.m" lineNumber:395 description:@"New properties were added so can only decode correctly if can test for keys."];
  }
  v35.receiver = self;
  v35.super_class = (Class)UIConcreteLocalNotification;
  v6 = [(UILocalNotification *)&v35 init];
  v7 = v6;
  if (v6)
  {
    UILocalNotificationCommonInit(v6);
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"_UILocalNotificationFireDate"];
    fireDate = v7->fireDate;
    v7->fireDate = (NSDate *)v9;

    uint64_t v11 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"_UILocalNotificationTimeZone"];
    timeZone = v7->timeZone;
    v7->timeZone = (NSTimeZone *)v11;

    v7->repeatInterval = [v5 decodeIntegerForKey:@"_UILocalNotificationRepeatInterval"];
    uint64_t v13 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"_UILocalNotificationRepeatCalendar"];
    repeatCalendar = v7->repeatCalendar;
    v7->repeatCalendar = (NSCalendar *)v13;

    uint64_t v15 = [v5 decodeObjectOfClass:v8 forKey:@"_UILocalNotificationAlertBody"];
    alertBody = v7->alertBody;
    v7->alertBody = (NSString *)v15;

    v7->hasAction = [v5 decodeBoolForKey:@"_UILocalNotificationHasAction"];
    uint64_t v17 = [v5 decodeObjectOfClass:v8 forKey:@"_UILocalNotificationAlertAction"];
    alertAction = v7->alertAction;
    v7->alertAction = (NSString *)v17;

    uint64_t v19 = [v5 decodeObjectOfClass:v8 forKey:@"_UILocalNotificationAlertLaunchImage"];
    alertLaunchImage = v7->alertLaunchImage;
    v7->alertLaunchImage = (NSString *)v19;

    uint64_t v21 = [v5 decodeObjectOfClass:v8 forKey:@"_UILocalNotificationAlertTitle"];
    alertTitle = v7->alertTitle;
    v7->alertTitle = (NSString *)v21;

    uint64_t v23 = [v5 decodeObjectOfClass:v8 forKey:@"_UILocalNotificationSoundName"];
    soundName = v7->soundName;
    v7->soundName = (NSString *)v23;

    v7->applicationIconBadgeNumber = [v5 decodeIntegerForKey:@"_UILocalNotificationApplicationIconBadgeNumber"];
    uint64_t v25 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"_UILocalNotificationUserInfoData"];
    userInfoData = v7->userInfoData;
    v7->userInfoData = (NSData *)v25;

    uint64_t v27 = [v5 decodeObjectOfClass:v8 forKey:@"_UILocalNotificationCategoryKey"];
    category = v7->category;
    v7->category = (NSString *)v27;

    v7->regionTriggersOnce = [v5 decodeBoolForKey:@"_UILocalNotificationRegionTriggersOnceKey"];
    uint64_t v37 = 0;
    v38 = &v37;
    uint64_t v39 = 0x2050000000;
    v29 = (void *)_MergedGlobals_1_18;
    uint64_t v40 = _MergedGlobals_1_18;
    if (!_MergedGlobals_1_18)
    {
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __getCLRegionClass_block_invoke;
      v36[3] = &unk_1E52D9900;
      v36[4] = &v37;
      __getCLRegionClass_block_invoke((uint64_t)v36);
      v29 = (void *)v38[3];
    }
    id v30 = v29;
    _Block_object_dispose(&v37, 8);
    uint64_t v31 = [v5 decodeObjectOfClass:v30 forKey:@"_UILocalNotificationRegionKey"];
    region = v7->region;
    v7->region = (CLRegion *)v31;
  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  fireDate = self->fireDate;
  id v5 = a3;
  [v5 encodeObject:fireDate forKey:@"_UILocalNotificationFireDate"];
  [v5 encodeObject:self->timeZone forKey:@"_UILocalNotificationTimeZone"];
  [v5 encodeInteger:self->repeatInterval forKey:@"_UILocalNotificationRepeatInterval"];
  [v5 encodeObject:self->repeatCalendar forKey:@"_UILocalNotificationRepeatCalendar"];
  [v5 encodeObject:self->alertBody forKey:@"_UILocalNotificationAlertBody"];
  [v5 encodeBool:self->hasAction forKey:@"_UILocalNotificationHasAction"];
  [v5 encodeObject:self->alertAction forKey:@"_UILocalNotificationAlertAction"];
  [v5 encodeObject:self->alertLaunchImage forKey:@"_UILocalNotificationAlertLaunchImage"];
  [v5 encodeObject:self->alertTitle forKey:@"_UILocalNotificationAlertTitle"];
  [v5 encodeObject:self->soundName forKey:@"_UILocalNotificationSoundName"];
  [v5 encodeInteger:self->applicationIconBadgeNumber forKey:@"_UILocalNotificationApplicationIconBadgeNumber"];
  [v5 encodeObject:self->userInfoData forKey:@"_UILocalNotificationUserInfoData"];
  [v5 encodeObject:self->category forKey:@"_UILocalNotificationCategoryKey"];
  [v5 encodeBool:self->regionTriggersOnce forKey:@"_UILocalNotificationRegionTriggersOnceKey"];
  [v5 encodeObject:self->region forKey:@"_UILocalNotificationRegionKey"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setFireDate:self->fireDate];
  [v4 setTimeZone:self->timeZone];
  [v4 setRepeatInterval:self->repeatInterval];
  [v4 setRepeatCalendar:self->repeatCalendar];
  [v4 setAlertBody:self->alertBody];
  [v4 setHasAction:self->hasAction];
  [v4 setAlertAction:self->alertAction];
  [v4 setAlertLaunchImage:self->alertLaunchImage];
  [v4 setAlertTitle:self->alertTitle];
  [v4 setSoundName:self->soundName];
  [v4 setApplicationIconBadgeNumber:self->applicationIconBadgeNumber];
  [v4 _setUserInfoData:self->userInfoData];
  [v4 setCategory:self->category];
  [v4 setRegion:self->region];
  [v4 setRegionTriggersOnce:self->regionTriggersOnce];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    fireDate = self->fireDate;
    v6 = [v4 fireDate];
    if (fireDate == v6 || [(NSDate *)fireDate isEqual:v6])
    {
      timeZone = self->timeZone;
      uint64_t v8 = [v4 timeZone];
      if ((timeZone == v8 || [(NSTimeZone *)timeZone isEqual:v8])
        && (unint64_t repeatInterval = self->repeatInterval, repeatInterval == [v4 repeatInterval]))
      {
        repeatCalendar = self->repeatCalendar;
        uint64_t v11 = [v4 repeatCalendar];
        if (repeatCalendar == v11 || [(NSCalendar *)repeatCalendar isEqual:v11])
        {
          alertBody = self->alertBody;
          uint64_t v13 = [v4 alertBody];
          if ((alertBody == v13 || [(NSString *)alertBody isEqual:v13])
            && (int hasAction = self->hasAction, hasAction == [v4 hasAction]))
          {
            alertAction = self->alertAction;
            v16 = [v4 alertAction];
            if (alertAction == v16 || [(NSString *)alertAction isEqual:v16])
            {
              alertLaunchImage = self->alertLaunchImage;
              v18 = [v4 alertLaunchImage];
              if (alertLaunchImage == v18 || [(NSString *)alertLaunchImage isEqual:v18])
              {
                alertTitle = self->alertTitle;
                v20 = [v4 alertTitle];
                if (alertTitle == v20 || [(NSString *)alertTitle isEqual:v20])
                {
                  soundName = self->soundName;
                  v22 = [v4 soundName];
                  if (soundName == v22
                    || (uint64_t v23 = soundName, v24 = v22, v25 = [(NSString *)v23 isEqual:v22], v22 = v24, v25))
                  {
                    v50 = v22;
                    int64_t applicationIconBadgeNumber = self->applicationIconBadgeNumber;
                    if (applicationIconBadgeNumber == [v4 applicationIconBadgeNumber])
                    {
                      uint64_t v27 = [(UIConcreteLocalNotification *)self userInfo];
                      uint64_t v28 = [v4 userInfo];
                      v29 = (void *)v27;
                      id v30 = (void *)v28;
                      v49 = v29;
                      if (v29 == (void *)v28 || [v29 isEqual:v28])
                      {
                        v48 = v30;
                        category = self->category;
                        v32 = [v4 category];
                        if (category == v32
                          || (v33 = category, v34 = v32,
                                              int v35 = [(NSString *)v33 isEqual:v32],
                                              v32 = v34,
                                              v35))
                        {
                          v47 = v32;
                          v36 = [(CLRegion *)self->region identifier];
                          v46 = [v4 region];
                          uint64_t v37 = [v46 identifier];
                          v45 = v36;
                          if (v36 == v37 || (v44 = v37, v38 = [v36 isEqual:v37], uint64_t v37 = v44, v38))
                          {
                            int regionTriggersOnce = self->regionTriggersOnce;
                            uint64_t v40 = v37;
                            int v41 = [v4 regionTriggersOnce];
                            uint64_t v37 = v40;
                            BOOL v42 = regionTriggersOnce == v41;
                          }
                          else
                          {
                            BOOL v42 = 0;
                          }

                          v32 = v47;
                        }
                        else
                        {
                          BOOL v42 = 0;
                        }

                        id v30 = v48;
                      }
                      else
                      {
                        BOOL v42 = 0;
                      }
                    }
                    else
                    {
                      BOOL v42 = 0;
                    }
                    v22 = v50;
                  }
                  else
                  {
                    BOOL v42 = 0;
                  }
                }
                else
                {
                  BOOL v42 = 0;
                }
              }
              else
              {
                BOOL v42 = 0;
              }
            }
            else
            {
              BOOL v42 = 0;
            }
          }
          else
          {
            BOOL v42 = 0;
          }
        }
        else
        {
          BOOL v42 = 0;
        }
      }
      else
      {
        BOOL v42 = 0;
      }
    }
    else
    {
      BOOL v42 = 0;
    }
  }
  else
  {
    BOOL v42 = 0;
  }

  return v42;
}

- (unint64_t)hash
{
  unint64_t v3 = self->repeatInterval + [(NSDate *)self->fireDate hash];
  id v4 = [(CLRegion *)self->region identifier];
  unint64_t v5 = v3 + [v4 hash] + self->regionTriggersOnce;

  return v5;
}

- (int64_t)compareFireDates:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  if (self->region
    || ([v4 region], v6 = objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    v7 = [v5 region];
    int64_t v8 = comparePotentiallyNilObjects(v7, self->region);
  }
  else
  {
    fireDate = self->fireDate;
    uint64_t v11 = [v5 fireDate];
    int64_t v8 = comparePotentiallyNilObjects(fireDate, v11);

    if (!v8)
    {
      unint64_t v12 = [v5 repeatInterval];
      unint64_t repeatInterval = self->repeatInterval;
      BOOL v14 = repeatInterval >= v12;
      BOOL v15 = repeatInterval > v12;
      if (v14) {
        int64_t v8 = v15;
      }
      else {
        int64_t v8 = -1;
      }
    }
  }

  return v8;
}

- (void)_setUserInfoData:(id)a3
{
}

- (void)setUserInfo:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v10 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"userInfo is not an NSDictionary" userInfo:0];
      objc_exception_throw(v10);
    }
    userInfoData = self->userInfoData;
    self->userInfoData = 0;

    id v15 = 0;
    v6 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v4 format:200 options:0 error:&v15];
    id v7 = v15;
    int64_t v8 = self->userInfoData;
    self->userInfoData = v6;

    if (!self->userInfoData)
    {
      uint64_t v11 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v12 = *MEMORY[0x1E4F1C3C8];
      uint64_t v13 = [NSString stringWithFormat:@"unable to serialize userInfo: %@", v7];
      id v14 = [v11 exceptionWithName:v12 reason:v13 userInfo:0];

      objc_exception_throw(v14);
    }
  }
  else
  {
    uint64_t v9 = self->userInfoData;
    self->userInfoData = 0;
  }
}

- (id)userInfo
{
  userInfoData = self->userInfoData;
  if (userInfoData)
  {
    unint64_t v3 = [MEMORY[0x1E4F28F98] propertyListWithData:userInfoData options:0 format:0 error:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_5;
    }
  }
  unint64_t v3 = 0;
LABEL_5:
  return v3;
}

- (id)description
{
  if (self->region)
  {
    unint64_t v3 = NSString;
    v21.receiver = self;
    v21.super_class = (Class)UIConcreteLocalNotification;
    id v4 = [(UIConcreteLocalNotification *)&v21 description];
    region = self->region;
    if (self->regionTriggersOnce) {
      v6 = @"YES";
    }
    else {
      v6 = @"NO";
    }
    id v7 = [(UIConcreteLocalNotification *)self userInfo];
    int64_t v8 = [v3 stringWithFormat:@"%@{region = %@, regionTriggersOnce = %@, user info = %@}", v4, region, v6, v7];
    goto LABEL_41;
  }
  int64_t repeatInterval = self->repeatInterval;
  if (repeatInterval > 255)
  {
    if (repeatInterval <= 2047)
    {
      switch(repeatInterval)
      {
        case 256:
          id v4 = @"NSWeekCalendarUnit";
          goto LABEL_40;
        case 512:
          id v4 = @"NSCalendarUnitWeekday";
          goto LABEL_40;
        case 1024:
          id v4 = @"NSCalendarUnitWeekdayOrdinal";
          goto LABEL_40;
      }
    }
    else if (repeatInterval >= 0x2000)
    {
      if (repeatInterval == 0x2000)
      {
        id v4 = @"NSCalendarUnitWeekOfYear";
        goto LABEL_40;
      }
      if (repeatInterval == 0x4000)
      {
        id v4 = @"NSCalendarUnitYearForWeekOfYear";
        goto LABEL_40;
      }
    }
    else
    {
      if (repeatInterval == 2048)
      {
        id v4 = @"NSCalendarUnitQuarter";
        goto LABEL_40;
      }
      if (repeatInterval == 4096)
      {
        id v4 = @"NSCalendarUnitWeekOfMonth";
        goto LABEL_40;
      }
    }
LABEL_39:
    objc_msgSend(NSString, "stringWithFormat:", @"%lu", self->repeatInterval);
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_40;
  }
  if (repeatInterval <= 15)
  {
    switch(repeatInterval)
    {
      case 2:
        id v4 = @"NSCalendarUnitEra";
        goto LABEL_40;
      case 4:
        id v4 = @"NSCalendarUnitYear";
        goto LABEL_40;
      case 8:
        id v4 = @"NSCalendarUnitMonth";
        goto LABEL_40;
    }
    goto LABEL_39;
  }
  if (repeatInterval > 63)
  {
    if (repeatInterval == 64)
    {
      id v4 = @"NSCalendarUnitMinute";
      goto LABEL_40;
    }
    if (repeatInterval == 128)
    {
      id v4 = @"NSCalendarUnitSecond";
      goto LABEL_40;
    }
    goto LABEL_39;
  }
  if (repeatInterval == 16)
  {
    id v4 = @"NSCalendarUnitDay";
    goto LABEL_40;
  }
  if (repeatInterval != 32) {
    goto LABEL_39;
  }
  id v4 = @"NSCalendarUnitHour";
LABEL_40:
  id v7 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v7 setDateStyle:4];
  [v7 setTimeStyle:4];
  [v7 setTimeZone:self->timeZone];
  id v10 = [v7 stringForObjectValue:self->fireDate];
  uint64_t v11 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
  [v7 setTimeZone:v11];

  uint64_t v12 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v13 = [(UIConcreteLocalNotification *)self nextFireDateForLastFireDate:v12];
  id v14 = [v7 stringForObjectValue:v13];

  id v15 = NSString;
  v20.receiver = self;
  v20.super_class = (Class)UIConcreteLocalNotification;
  v16 = [(UIConcreteLocalNotification *)&v20 description];
  timeZone = self->timeZone;
  v18 = [(UIConcreteLocalNotification *)self userInfo];
  int64_t v8 = [v15 stringWithFormat:@"%@{fire date = %@, time zone = %@, repeat interval = %@, next fire date = %@, user info = %@}", v16, v10, timeZone, v4, v14, v18];

LABEL_41:
  return v8;
}

- (id)nextFireDateForLastFireDate:(id)a3
{
  id v4 = a3;
  if ([(UIConcreteLocalNotification *)self isTriggeredByDate])
  {
    if (!v4)
    {
      id v4 = [MEMORY[0x1E4F1C9C8] distantPast];
    }
    double v5 = -60.0;
    if ((self->repeatInterval & 0xC0) == 0) {
      double v5 = -900.0;
    }
    v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:v5];
    id v7 = [v4 laterDate:v6];
    int64_t v8 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
    uint64_t v9 = [(UIConcreteLocalNotification *)self nextFireDateAfterDate:v7 localTimeZone:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)nextFireDateAfterDate:(id)a3 localTimeZone:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  unint64_t repeatInterval = self->repeatInterval;
  if (repeatInterval)
  {
    unint64_t v10 = 0;
    do
    {
      uint64_t v11 = qword_186B9B2D0[v10];
      if (v10 > 9) {
        break;
      }
      ++v10;
    }
    while (v11 != repeatInterval);
    if (v11 != repeatInterval) {
      goto LABEL_25;
    }
  }
  fireDate = self->fireDate;
  if (!fireDate)
  {
    uint64_t v13 = (NSDate *)v7;
    goto LABEL_46;
  }
  uint64_t v13 = fireDate;
  if (v8)
  {
    timeZone = self->timeZone;
    if (timeZone)
    {
      if (([(NSTimeZone *)timeZone isEqual:v8] & 1) == 0)
      {
        id v15 = self->repeatCalendar;
        if (!v15)
        {
          id v15 = [MEMORY[0x1E4F1C9A8] currentCalendar];
        }
        v16 = (void *)[(NSCalendar *)v15 copy];

        [v16 setTimeZone:self->timeZone];
        uint64_t v17 = [v16 components:254 fromDate:v13];
        [v16 setTimeZone:v8];
        uint64_t v18 = [v16 dateFromComponents:v17];

        uint64_t v13 = (NSDate *)v18;
      }
    }
  }
  uint64_t v19 = [(NSDate *)v13 earlierDate:v7];

  if (v19 != v13)
  {
    if (!v13) {
      goto LABEL_46;
    }
    goto LABEL_44;
  }
  if (!self->repeatInterval)
  {

LABEL_25:
    uint64_t v13 = 0;
    goto LABEL_46;
  }
  objc_super v20 = self->repeatCalendar;
  if (!v20)
  {
    objc_super v20 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  }
  objc_super v21 = [(NSCalendar *)v20 timeZone];
  char v22 = [v21 isEqual:v8];

  if ((v22 & 1) == 0)
  {
    uint64_t v23 = (NSCalendar *)[(NSCalendar *)v20 copy];

    [(NSCalendar *)v23 setTimeZone:v8];
    objc_super v20 = v23;
  }
  if ((objc_msgSend(MEMORY[0x1E4F1C9D8], "_ui_smallerComponentsRelativeToComponent:", self->repeatInterval) & 0x20) != 0)
  {
    v24 = -[NSCalendar components:fromDate:](v20, "components:fromDate:");
  }
  else
  {
    v24 = 0;
  }
  int v25 = [(NSCalendar *)v20 components:self->repeatInterval fromDate:v13 toDate:v7 options:0];
  if (!v25)
  {

    uint64_t v27 = 0;
    goto LABEL_43;
  }
  v36 = a2;
  _nextAdjustedFireDateForPreviousDateAndComponentsWithRepeatIntervalForCalendar((uint64_t)v13, (uint64_t)v25, self->repeatInterval, v20, v24);
  v26 = (NSDate *)objc_claimAutoreleasedReturnValue();
  if (!v26) {
    goto LABEL_40;
  }
  uint64_t v27 = v26;
  uint64_t v28 = [(NSDate *)v26 earlierDate:v7];

  if (v28 != v27) {
    goto LABEL_30;
  }
  objc_msgSend(v25, "_ui_setValue:forComponent:", objc_msgSend(v25, "_ui_valueForComponent:", self->repeatInterval) + 1, self->repeatInterval);
  _nextAdjustedFireDateForPreviousDateAndComponentsWithRepeatIntervalForCalendar((uint64_t)v13, (uint64_t)v25, self->repeatInterval, v20, v24);
  id v30 = (NSDate *)objc_claimAutoreleasedReturnValue();

  if (!v30) {
    goto LABEL_40;
  }
  uint64_t v31 = [(NSDate *)v30 earlierDate:v7];

  if (v31 != v30)
  {
    uint64_t v27 = v30;
    goto LABEL_30;
  }
  objc_msgSend(v25, "_ui_setValue:forComponent:", objc_msgSend(v25, "_ui_valueForComponent:", self->repeatInterval) + 1, self->repeatInterval);
  _nextAdjustedFireDateForPreviousDateAndComponentsWithRepeatIntervalForCalendar((uint64_t)v13, (uint64_t)v25, self->repeatInterval, v20, v24);
  uint64_t v27 = (NSDate *)objc_claimAutoreleasedReturnValue();

  if (!v27)
  {
LABEL_40:
    uint64_t v27 = 0;
    goto LABEL_41;
  }
  v32 = [(NSDate *)v27 earlierDate:v7];

  if (v32 == v27)
  {
    NSLog(&cfstr_Uilocalnotific_16.isa, v13, v27, self->repeatInterval);

    goto LABEL_40;
  }
LABEL_30:
  double v37 = 0.0;
  a2 = v36;
  if (![(NSCalendar *)v20 rangeOfUnit:self->repeatInterval startDate:0 interval:&v37 forDate:v27]|| v37 >= 59.0)
  {
    goto LABEL_42;
  }
  uint64_t v29 = [(NSDate *)v27 dateByAddingTimeInterval:59.0 - v37];

  uint64_t v27 = (NSDate *)v29;
LABEL_41:
  a2 = v36;
LABEL_42:

LABEL_43:
  uint64_t v13 = v27;
  if (!v27) {
    goto LABEL_46;
  }
LABEL_44:
  [(NSDate *)v13 timeIntervalSinceDate:v7];
  if (v33 <= 0.0)
  {
    int v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2 object:self file:@"UILocalNotification.m" lineNumber:890 description:@"invariant not satisfied"];
  }
LABEL_46:

  return v13;
}

- (BOOL)isValid
{
  if (self->repeatInterval) {
    return 1;
  }
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  double v5 = [(UIConcreteLocalNotification *)self nextFireDateForLastFireDate:v4];
  BOOL v2 = v5 != 0;

  return v2;
}

- (void)validate
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (self->region)
  {
    if (self->fireDate)
    {
      BOOL v2 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v3 = *MEMORY[0x1E4F1C3C8];
      v6 = @"UILocalNotification";
      v7[0] = self;
      id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
      id v5 = [v2 exceptionWithName:v3 reason:@"UILocalNotification may not have both a region and a fireDate defined" userInfo:v4];

      objc_exception_throw(v5);
    }
  }
}

- (BOOL)isTriggeredByDate
{
  return self->fireDate != 0;
}

- (BOOL)isTriggeredByRegion
{
  return self->region != 0;
}

- (id)fireDate
{
  return self->fireDate;
}

- (void)setFireDate:(id)a3
{
}

- (id)timeZone
{
  return self->timeZone;
}

- (void)setTimeZone:(id)a3
{
}

- (unint64_t)repeatInterval
{
  return self->repeatInterval;
}

- (void)setRepeatInterval:(unint64_t)a3
{
  self->unint64_t repeatInterval = a3;
}

- (id)repeatCalendar
{
  return self->repeatCalendar;
}

- (void)setRepeatCalendar:(id)a3
{
}

- (id)alertBody
{
  return self->alertBody;
}

- (void)setAlertBody:(id)a3
{
}

- (BOOL)hasAction
{
  return self->hasAction;
}

- (void)setHasAction:(BOOL)a3
{
  self->int hasAction = a3;
}

- (id)alertAction
{
  return self->alertAction;
}

- (void)setAlertAction:(id)a3
{
}

- (id)alertLaunchImage
{
  return self->alertLaunchImage;
}

- (void)setAlertLaunchImage:(id)a3
{
}

- (id)soundName
{
  return self->soundName;
}

- (void)setSoundName:(id)a3
{
}

- (int64_t)applicationIconBadgeNumber
{
  return self->applicationIconBadgeNumber;
}

- (void)setApplicationIconBadgeNumber:(int64_t)a3
{
  self->int64_t applicationIconBadgeNumber = a3;
}

- (id)category
{
  return self->category;
}

- (void)setCategory:(id)a3
{
}

- (id)region
{
  return self->region;
}

- (void)setRegion:(id)a3
{
}

- (BOOL)regionTriggersOnce
{
  return self->regionTriggersOnce;
}

- (void)setRegionTriggersOnce:(BOOL)a3
{
  self->int regionTriggersOnce = a3;
}

- (id)alertTitle
{
  return self->alertTitle;
}

- (void)setAlertTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->category, 0);
  objc_storeStrong((id *)&self->userInfoData, 0);
  objc_storeStrong((id *)&self->soundName, 0);
  objc_storeStrong((id *)&self->alertTitle, 0);
  objc_storeStrong((id *)&self->alertLaunchImage, 0);
  objc_storeStrong((id *)&self->alertAction, 0);
  objc_storeStrong((id *)&self->alertBody, 0);
  objc_storeStrong((id *)&self->region, 0);
  objc_storeStrong((id *)&self->repeatCalendar, 0);
  objc_storeStrong((id *)&self->timeZone, 0);
  objc_storeStrong((id *)&self->fireDate, 0);
}

@end