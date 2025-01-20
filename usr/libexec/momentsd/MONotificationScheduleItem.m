@interface MONotificationScheduleItem
+ (BOOL)supportsSecureCoding;
- (MONotificationScheduleItem)initWithCoder:(id)a3;
- (MONotificationScheduleItem)initWithHour:(id)a3 minute:(id)a4 weekdays:(id)a5;
- (NSArray)weekdays;
- (NSNumber)hour;
- (NSNumber)minute;
- (id)initScheduleWithHour:(id)a3 minute:(id)a4 weekdays:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)setHour:(id)a3;
- (void)setMinute:(id)a3;
- (void)setWeekdays:(id)a3;
@end

@implementation MONotificationScheduleItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MONotificationScheduleItem)initWithHour:(id)a3 minute:(id)a4 weekdays:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MONotificationScheduleItem;
  v12 = [(MONotificationScheduleItem *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_hour, a3);
    objc_storeStrong((id *)&v13->_minute, a4);
    objc_storeStrong((id *)&v13->_weekdays, a5);
  }

  return v13;
}

- (id)initScheduleWithHour:(id)a3 minute:(id)a4 weekdays:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v25.receiver = self;
  v25.super_class = (Class)MONotificationScheduleItem;
  v12 = [(MONotificationScheduleItem *)&v25 init];
  p_isa = (id *)&v12->super.isa;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_hour, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
    if ([v9 intValue] > 0x17 || objc_msgSend(v10, "intValue") > 0x3B)
    {
LABEL_15:
      v19 = 0;
      goto LABEL_16;
    }
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v14 = v11;
    id v15 = [v14 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v22;
      while (2)
      {
        v18 = 0;
        do
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v14);
          }
          if (objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * (void)v18), "intValue", (void)v21)
             - 8 < 0xFFFFFFF9)
          {

            goto LABEL_15;
          }
          v18 = (char *)v18 + 1;
        }
        while (v16 != v18);
        id v16 = [v14 countByEnumeratingWithState:&v21 objects:v26 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }
  }
  v19 = p_isa;
LABEL_16:

  return v19;
}

- (MONotificationScheduleItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MONotificationScheduleItem;
  v5 = [(MONotificationScheduleItem *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hour"];
    hour = v5->_hour;
    v5->_hour = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"minute"];
    minute = v5->_minute;
    v5->_minute = (NSNumber *)v8;

    unsigned int v10 = [v4 decodeIntForKey:@"weekdays"];
    id v11 = objc_opt_new();
    uint64_t v12 = 1;
    do
    {
      if ((v10 >> (v12 - 1)))
      {
        v13 = +[NSNumber numberWithInt:v12];
        [v11 addObject:v13];
      }
      uint64_t v12 = (v12 + 1);
    }
    while (v12 != 8);
    id v14 = (NSArray *)[v11 copy];
    weekdays = v5->_weekdays;
    v5->_weekdays = v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_hour forKey:@"hour"];
  [v4 encodeObject:self->_minute forKey:@"minute"];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_weekdays;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    char v7 = 0;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        unsigned __int8 v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) intValue:v12];
        int v11 = 1 << ((v10 & 7) - 1);
        if ((v10 & 7) == 0) {
          LOBYTE(v11) = 0;
        }
        v7 |= v11;
      }
      id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
    id v6 = (id)(v7 & 0x7F);
  }

  [v4 encodeInt:v6 forKey:@"weekdays"];
}

- (NSNumber)hour
{
  return self->_hour;
}

- (void)setHour:(id)a3
{
}

- (NSNumber)minute
{
  return self->_minute;
}

- (void)setMinute:(id)a3
{
}

- (NSArray)weekdays
{
  return self->_weekdays;
}

- (void)setWeekdays:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weekdays, 0);
  objc_storeStrong((id *)&self->_minute, 0);

  objc_storeStrong((id *)&self->_hour, 0);
}

@end