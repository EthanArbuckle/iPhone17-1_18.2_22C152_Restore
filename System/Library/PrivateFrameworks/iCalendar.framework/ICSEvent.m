@interface ICSEvent
+ (id)name;
- (BOOL)isDefaultAlarmDeleted;
- (BOOL)validate:(id *)a3;
- (BOOL)x_apple_dontschedule;
- (BOOL)x_apple_needs_reply;
- (BOOL)x_wr_itipalreadysent;
- (BOOL)x_wr_itipstatusattendeeml;
- (BOOL)x_wr_itipstatusml;
- (BOOL)x_wr_rsvpneeded;
- (NSArray)x_calendarserver_attendee_comment;
- (NSString)x_apple_creator_identity;
- (NSString)x_apple_creator_team_identity;
- (NSString)x_apple_special_day;
- (NSString)x_calendarserver_private_comment;
- (int)transp;
- (int)x_apple_ews_busystatus;
- (void)fixAttendeeComments;
- (void)fixComponent;
- (void)setTransp:(int)a3;
- (void)setX_apple_creator_identity:(id)a3;
- (void)setX_apple_creator_team_identity:(id)a3;
- (void)setX_apple_dontschedule:(BOOL)a3;
- (void)setX_apple_ews_busystatus:(int)a3;
- (void)setX_apple_needs_reply:(BOOL)a3;
- (void)setX_apple_special_day:(id)a3;
- (void)setX_calendarserver_attendee_comment:(id)a3;
- (void)setX_calendarserver_private_comment:(id)a3;
- (void)setX_wr_itipalreadysent:(BOOL)a3;
- (void)setX_wr_itipstatusattendeeml:(BOOL)a3;
- (void)setX_wr_itipstatusml:(BOOL)a3;
- (void)setX_wr_rsvpneeded:(BOOL)a3;
@end

@implementation ICSEvent

- (void)fixComponent
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E01964E0](self, a2);
  v51.receiver = self;
  v51.super_class = (Class)ICSEvent;
  [(ICSComponent *)&v51 fixComponent];
  [(ICSEvent *)self fixAttendeeComments];
  v4 = [(ICSComponent *)self propertiesForName:@"DTEND"];

  if (v4)
  {
    v5 = [(ICSComponent *)self dtend];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      [(ICSComponent *)self removePropertiesForName:@"DTEND"];
    }
  }
  v7 = [(ICSComponent *)self propertiesForName:@"LOCATION"];

  if (v7)
  {
    v8 = [(ICSComponent *)self location];
    objc_opt_class();
    char v9 = objc_opt_isKindOfClass();

    if ((v9 & 1) == 0) {
      [(ICSComponent *)self removePropertiesForName:@"LOCATION"];
    }
  }
  v10 = [(ICSComponent *)self propertiesForName:@"TRANSP"];

  if (v10)
  {
    v11 = [(ICSComponent *)self propertiesForName:@"TRANSP"];
    v12 = [v11 lastObject];
    v13 = [v12 value];
    objc_opt_class();
    char v14 = objc_opt_isKindOfClass();

    if ((v14 & 1) == 0) {
      [(ICSComponent *)self removePropertiesForName:@"TRANSP"];
    }
  }
  v15 = [(ICSComponent *)self propertiesForName:@"PRIORITY"];

  if (v15)
  {
    v16 = [(ICSComponent *)self propertiesForName:@"PRIORITY"];
    v17 = [v16 lastObject];
    v18 = [v17 value];
    objc_opt_class();
    char v19 = objc_opt_isKindOfClass();

    if ((v19 & 1) == 0) {
      [(ICSComponent *)self removePropertiesForName:@"PRIORITY"];
    }
  }
  v20 = [(ICSComponent *)self dtstart];
  objc_opt_class();
  v21 = [(ICSComponent *)self dtend];
  objc_opt_class();

  v22 = [(ICSComponent *)self propertiesForName:@"DTEND"];
  if (v22) {
    goto LABEL_14;
  }
  v23 = [(ICSComponent *)self propertiesForName:@"DURATION"];

  if (!v23)
  {
    v22 = [[ICSDuration alloc] initWithWeeks:0 days:0 hours:0 minutes:0 seconds:0];
    [(ICSComponent *)self setDuration:v22];
LABEL_14:
  }
  if ([(ICSComponent *)self isAllDay])
  {
    v24 = [(ICSComponent *)self dtstart];
    v25 = [v24 value];

    v26 = [(ICSComponent *)self dtend];
    v27 = [v26 value];

    uint64_t v28 = [v25 year];
    if (v28 == [v27 year])
    {
      uint64_t v29 = [v25 month];
      if (v29 == [v27 month])
      {
        uint64_t v30 = [v25 day];
        if (v30 == [v27 day])
        {
          v31 = [[ICSDuration alloc] initWithWeeks:0 days:1 hours:0 minutes:0 seconds:0];
          [(ICSComponent *)self setDuration:v31];
        }
      }
    }
  }
  v32 = objc_alloc_init(ICSCalendar);
  v33 = [(ICSComponent *)self propertiesForName:@"EXDATE"];

  if (v33)
  {
    v46 = v3;
    id v34 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v35 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    v36 = [(ICSComponent *)self exdate];
    uint64_t v37 = [v36 countByEnumeratingWithState:&v47 objects:v52 count:16];
    if (v37)
    {
      uint64_t v38 = v37;
      uint64_t v39 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v38; ++i)
        {
          if (*(void *)v48 != v39) {
            objc_enumerationMutation(v36);
          }
          uint64_t v41 = *(void *)(*((void *)&v47 + 1) + 8 * i);
          v42 = [(ICSCalendar *)v32 systemDateForDate:v41 options:1];
          if (([v35 containsObject:v42] & 1) == 0)
          {
            [v34 addObject:v41];
            [v35 addObject:v42];
          }
        }
        uint64_t v38 = [v36 countByEnumeratingWithState:&v47 objects:v52 count:16];
      }
      while (v38);
    }

    v43 = [(ICSComponent *)self exdate];
    uint64_t v44 = [v43 count];
    uint64_t v45 = [v34 count];

    if (v44 != v45) {
      [(ICSComponent *)self setExdate:v34];
    }

    v3 = v46;
  }
}

- (void)fixAttendeeComments
{
  v3 = [(ICSComponent *)self propertiesForName:@"X-CALENDARSERVER-ATTENDEE-COMMENT"];

  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1CA80]);
    v5 = [(ICSEvent *)self x_calendarserver_attendee_comment];
    id v11 = (id)objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

    v6 = [(ICSEvent *)self x_calendarserver_attendee_comment];
    v7 = [MEMORY[0x1E4F28E60] indexSet];
    if ([v6 count])
    {
      unint64_t v8 = 0;
      do
      {
        char v9 = [v6 objectAtIndexedSubscript:v8];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v10 = objc_msgSend(v9, "x_calendarserver_attendee_ref");
          if (v10)
          {
            if ([v11 containsObject:v10]) {
              [v7 addIndex:v8];
            }
            else {
              [v11 addObject:v10];
            }
          }
        }
        else
        {
          [v7 addIndex:v8];
        }

        ++v8;
      }
      while (v8 < [v6 count]);
    }
    [v6 removeObjectsAtIndexes:v7];
    if (![v6 count]) {
      [(ICSComponent *)self removePropertiesForName:@"X-CALENDARSERVER-ATTENDEE-COMMENT"];
    }
  }
}

+ (id)name
{
  return @"VEVENT";
}

- (BOOL)validate:(id *)a3
{
  v5 = [(ICSComponent *)self propertiesForName:@"DTSTART"];

  if (!v5)
  {
    if (a3)
    {
      v13 = (void *)MEMORY[0x1E4F28C58];
      char v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:@"DTSTART is required for VEVENT." forKey:*MEMORY[0x1E4F28568]];
      *a3 = [v13 errorWithDomain:@"com.apple.iCalendar" code:1000 userInfo:v14];
    }
    return 0;
  }
  v6 = [(ICSComponent *)self propertiesForName:@"DTEND"];

  if (v6)
  {
    v7 = [(ICSComponent *)self dtstart];
    unint64_t v8 = [(ICSComponent *)self dtend];
    char v9 = [v7 tzid];

    if (v9)
    {
      v10 = (void *)MEMORY[0x1E4F1CAF0];
      id v11 = [v7 tzid];
      uint64_t v12 = [v10 timeZoneWithName:v11];
    }
    else
    {
      uint64_t v12 = 0;
    }
    v15 = [v8 tzid];

    v43 = (void *)v12;
    if (v15
      && (v16 = (void *)MEMORY[0x1E4F1CAF0],
          [v8 tzid],
          v17 = objc_claimAutoreleasedReturnValue(),
          [v16 timeZoneWithName:v17],
          v15 = objc_claimAutoreleasedReturnValue(),
          v17,
          v12)
      && v15)
    {
      id v18 = objc_alloc(MEMORY[0x1E4F1C9A8]);
      uint64_t v19 = *MEMORY[0x1E4F1C318];
      v20 = (void *)[v18 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
      [v20 setTimeZone:v12];
      v21 = (void *)[objc_alloc(MEMORY[0x1E4F1C9A8]) initWithCalendarIdentifier:v19];
      [v21 setTimeZone:v15];
      v22 = [v7 components];
      v23 = [v20 dateFromComponents:v22];

      v24 = [v8 components];
      v25 = [v21 dateFromComponents:v24];

      uint64_t v26 = [v25 compare:v23];
      if (v26 == -1) {
        goto LABEL_13;
      }
    }
    else
    {
      v31 = [v8 value];
      v32 = [v7 value];
      uint64_t v33 = [v31 compare:v32];

      if (v33 == -1)
      {
LABEL_13:
        if (a3)
        {
          v27 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v28 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v29 = *MEMORY[0x1E4F28568];
          uint64_t v30 = @"DTEND must not be before DTSTART.";
LABEL_19:
          id v35 = [v28 dictionaryWithObject:v30 forKey:v29];
          [v27 errorWithDomain:@"com.apple.iCalendar" code:1000 userInfo:v35];
          v36 = v43;
          *a3 = (id)objc_claimAutoreleasedReturnValue();

LABEL_21:
          return 0;
        }
        goto LABEL_20;
      }
    }
    id v34 = [(ICSComponent *)self propertiesForName:@"DURATION"];

    if (v34)
    {
      if (a3)
      {
        v27 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v28 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v29 = *MEMORY[0x1E4F28568];
        uint64_t v30 = @"DTEND and DURATION cannot both be set for VEVENT.";
        goto LABEL_19;
      }
LABEL_20:
      v36 = v43;
      goto LABEL_21;
    }
  }
  else
  {
    v7 = [(ICSComponent *)self propertiesForName:@"DURATION"];
  }

  uint64_t v38 = [(ICSComponent *)self propertiesForName:@"STATUS"];

  if (v38)
  {
    unsigned int v39 = [(ICSComponent *)self status];
    unsigned int v40 = v39;
    if (v39 > 8 || ((1 << v39) & 0x107) == 0)
    {
      if (a3)
      {
        uint64_t v41 = (void *)MEMORY[0x1E4F28C58];
        v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:@"Invalid STATUS for VEVENT." forKey:*MEMORY[0x1E4F28568]];
        *a3 = [v41 errorWithDomain:@"com.apple.iCalendar" code:1000 userInfo:v42];
      }
      if (v40 != 8) {
        return 0;
      }
    }
  }
  v44.receiver = self;
  v44.super_class = (Class)ICSEvent;
  return [(ICSComponent *)&v44 validate:a3];
}

- (int)transp
{
  v3 = [(ICSComponent *)self propertiesForName:@"TRANSP"];

  if (!v3) {
    return 0;
  }
  id v4 = [(ICSComponent *)self propertiesForName:@"TRANSP"];
  v5 = [v4 lastObject];
  v6 = [v5 value];
  int v7 = [v6 longValue];

  return v7;
}

- (void)setTransp:(int)a3
{
  if (a3)
  {
    uint64_t v4 = +[ICSPredefinedValue numberWithLong:a3];
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = (id)v4;
  [(ICSComponent *)self setPropertyValue:v4 type:5004 forName:@"TRANSP"];
}

- (NSArray)x_calendarserver_attendee_comment
{
  return (NSArray *)[(ICSComponent *)self propertiesForName:@"X-CALENDARSERVER-ATTENDEE-COMMENT"];
}

- (void)setX_calendarserver_attendee_comment:(id)a3
{
}

- (NSString)x_calendarserver_private_comment
{
  v2 = [(ICSComponent *)self propertiesForName:@"X-CALENDARSERVER-PRIVATE-COMMENT"];
  v3 = [v2 lastObject];
  uint64_t v4 = [v3 value];

  return (NSString *)v4;
}

- (void)setX_calendarserver_private_comment:(id)a3
{
}

- (void)setX_apple_dontschedule:(BOOL)a3
{
  if (a3)
  {
    id v4 = [NSNumber numberWithBool:1];
    [(ICSComponent *)self setPropertyValue:v4 type:5012 forName:@"X-APPLE-DONTSCHEDULE"];
  }
  else
  {
    [(ICSComponent *)self removePropertiesForName:@"X-APPLE-DONTSCHEDULE"];
  }
}

- (BOOL)x_apple_dontschedule
{
  v2 = [(ICSComponent *)self propertiesForName:@"X-APPLE-DONTSCHEDULE"];
  v3 = [v2 lastObject];
  id v4 = [v3 value];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (BOOL)x_apple_needs_reply
{
  v2 = [(ICSComponent *)self propertiesForName:@"X-APPLE-NEEDS-REPLY"];
  v3 = [v2 lastObject];
  id v4 = [v3 value];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (void)setX_apple_needs_reply:(BOOL)a3
{
  if (a3)
  {
    uint64_t v4 = [NSNumber numberWithBool:1];
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = (id)v4;
  [(ICSComponent *)self setPropertyValue:v4 type:5012 forName:@"X-APPLE-NEEDS-REPLY"];
}

- (void)setX_wr_itipalreadysent:(BOOL)a3
{
  if (a3) {
    v3 = @"DONE";
  }
  else {
    v3 = 0;
  }
  [(ICSComponent *)self setPropertyValue:v3 forName:@"X-WR-ITIPALREADYSENT"];
}

- (BOOL)x_wr_itipalreadysent
{
  v2 = [(ICSComponent *)self propertiesForName:@"X-WR-ITIPALREADYSENT"];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setX_wr_itipstatusattendeeml:(BOOL)a3
{
  if (a3) {
    BOOL v3 = @"UNCLEAN";
  }
  else {
    BOOL v3 = 0;
  }
  [(ICSComponent *)self setPropertyValue:v3 forName:@"X-WR-ITIPSTATUSATTENDEEML"];
}

- (BOOL)x_wr_itipstatusattendeeml
{
  BOOL v3 = [(ICSComponent *)self propertiesForName:@"X-WR-ITIPSTATUSATTENDEEML"];

  if (!v3) {
    return 0;
  }
  uint64_t v4 = [(ICSComponent *)self propertiesForName:@"X-WR-ITIPSTATUSATTENDEEML"];
  id v5 = [v4 lastObject];
  v6 = [v5 value];
  char v7 = [v6 isEqualToString:@"UNCLEAN"];

  return v7;
}

- (void)setX_wr_itipstatusml:(BOOL)a3
{
  if (a3)
  {
    uint64_t v4 = [(ICSComponent *)self propertiesForName:@"ATTENDEE"];

    if (v4)
    {
      [(ICSComponent *)self setPropertyValue:@"UNCLEAN" forName:@"X-WR-ITIPSTATUSML"];
    }
  }
  else
  {
    [(ICSComponent *)self removePropertiesForName:@"X-WR-ITIPSTATUSML"];
  }
}

- (BOOL)x_wr_itipstatusml
{
  BOOL v3 = [(ICSComponent *)self propertiesForName:@"X-WR-ITIPSTATUSML"];

  if (!v3) {
    return 0;
  }
  uint64_t v4 = [(ICSComponent *)self propertiesForName:@"X-WR-ITIPSTATUSML"];
  id v5 = [v4 lastObject];
  v6 = [v5 value];
  char v7 = [v6 isEqualToString:@"UNCLEAN"];

  return v7;
}

- (void)setX_wr_rsvpneeded:(BOOL)a3
{
  if (a3) {
    BOOL v3 = @"UNCLEAN";
  }
  else {
    BOOL v3 = 0;
  }
  [(ICSComponent *)self setPropertyValue:v3 forName:@"X-WR-RSVPNEEDED"];
}

- (BOOL)x_wr_rsvpneeded
{
  v2 = [(ICSComponent *)self propertiesForName:@"X-WR-RSVPNEEDED"];
  BOOL v3 = v2 != 0;

  return v3;
}

- (int)x_apple_ews_busystatus
{
  BOOL v3 = [(ICSComponent *)self propertiesForName:@"X-APPLE-EWS-BUSYSTATUS"];

  if (!v3) {
    return 0;
  }
  uint64_t v4 = [(ICSComponent *)self propertiesForName:@"X-APPLE-EWS-BUSYSTATUS"];
  id v5 = [v4 lastObject];
  v6 = [v5 value];
  int v7 = [v6 longValue];

  return v7;
}

- (void)setX_apple_ews_busystatus:(int)a3
{
  if (a3)
  {
    uint64_t v4 = +[ICSPredefinedValue numberWithLong:a3];
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = (id)v4;
  [(ICSComponent *)self setPropertyValue:v4 type:5031 forName:@"X-APPLE-EWS-BUSYSTATUS"];
}

- (NSString)x_apple_special_day
{
  v2 = [(ICSComponent *)self propertiesForName:@"X-APPLE-SPECIAL-DAY"];
  BOOL v3 = [v2 lastObject];
  uint64_t v4 = [v3 value];

  return (NSString *)v4;
}

- (void)setX_apple_special_day:(id)a3
{
}

- (NSString)x_apple_creator_identity
{
  v2 = [(ICSComponent *)self propertiesForName:@"X-APPLE-CREATOR-IDENTITY"];
  BOOL v3 = [v2 lastObject];
  uint64_t v4 = [v3 value];

  return (NSString *)v4;
}

- (void)setX_apple_creator_identity:(id)a3
{
}

- (NSString)x_apple_creator_team_identity
{
  v2 = [(ICSComponent *)self propertiesForName:@"X-APPLE-CREATOR-TEAM-IDENTITY"];
  BOOL v3 = [v2 lastObject];
  uint64_t v4 = [v3 value];

  return (NSString *)v4;
}

- (void)setX_apple_creator_team_identity:(id)a3
{
}

- (BOOL)isDefaultAlarmDeleted
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(ICSComponent *)self components];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        v6 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v7 = v6;
          if ([v7 isNoneAlarm] && (objc_msgSend(v7, "x_apple_default_alarm") & 1) == 0)
          {

            LOBYTE(v3) = 1;
            goto LABEL_15;
          }
          char v8 = objc_msgSend(v7, "x_apple_default_alarm");

          if (v8)
          {
            LOBYTE(v3) = 0;
            goto LABEL_15;
          }
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  return v3;
}

@end