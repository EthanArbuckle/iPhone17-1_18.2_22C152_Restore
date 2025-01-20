@interface ICSAlarm
+ (id)ICSStringFromAction:(int)a3;
+ (id)createNoneAlarm;
+ (id)name;
+ (id)parseableDocumentFromICS:(id)a3;
+ (id)parseableDocumentFromICS:(id)a3 options:(unint64_t)a4;
+ (int)actionFromICSString:(id)a3;
- (BOOL)isNoneAlarm;
- (BOOL)x_apple_default_alarm;
- (BOOL)x_apple_local_default_alarm;
- (BOOL)x_apple_travel_default_alarm;
- (ICSDateTimeUTCValue)acknowledged;
- (NSData)bookmark;
- (NSString)relatedTo;
- (NSString)x_apple_proximity;
- (NSString)x_wr_alarmuid;
- (int)action;
- (void)fixAlarm;
- (void)setAcknowledged:(id)a3;
- (void)setAction:(int)a3;
- (void)setBookmark:(id)a3;
- (void)setRelatedTo:(id)a3;
- (void)setX_apple_default_alarm:(BOOL)a3;
- (void)setX_apple_local_default_alarm:(BOOL)a3;
- (void)setX_apple_proximity:(id)a3;
- (void)setX_apple_travel_default_alarm:(BOOL)a3;
- (void)setX_wr_alarmuid:(id)a3;
@end

@implementation ICSAlarm

- (void)fixAlarm
{
  v3 = [(ICSComponent *)self trigger];
  [v3 fixAlarmTrigger];

  v4 = [(ICSComponent *)self propertiesForName:@"TRIGGER"];

  if (v4)
  {
    v5 = [(ICSComponent *)self propertiesForName:@"TRIGGER"];
    v6 = [v5 lastObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      [(ICSComponent *)self removePropertiesForName:@"TRIGGER"];
    }
  }
}

+ (id)name
{
  return @"VALARM";
}

+ (int)actionFromICSString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"AUDIO"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"DISPLAY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"EMAIL"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"PROCEDURE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"NONE"])
  {
    int v4 = 0;
  }
  else
  {
    int v4 = 5;
  }

  return v4;
}

+ (id)ICSStringFromAction:(int)a3
{
  if (a3 > 4) {
    return 0;
  }
  else {
    return off_1E6C25A20[a3];
  }
}

+ (id)parseableDocumentFromICS:(id)a3
{
  return (id)[a1 parseableDocumentFromICS:a3 options:0];
}

+ (id)parseableDocumentFromICS:(id)a3 options:(unint64_t)a4
{
  v5 = [a3 stringByReplacingOccurrencesOfString:@"\r" withString:&stru_1F3601330];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 stringByAppendingString:@"END:VCALENDAR\n"];
    v8 = [@"BEGIN:VCALENDAR\n" stringByAppendingString:v7];
  }
  else
  {
    v8 = [@"BEGIN:VCALENDAR\n" stringByAppendingString:@"END:VCALENDAR\n"];
  }
  v9 = [[ICSDocument alloc] initWithICSString:v8 options:a4 error:0];

  return v9;
}

+ (id)createNoneAlarm
{
  v2 = objc_alloc_init(ICSAlarm);
  [(ICSAlarm *)v2 setAction:0];
  id v3 = +[ICSDateValue dateFromICSString:@"19760401T005545Z"];
  int v4 = [[ICSTrigger alloc] initWithDate:v3];
  [(ICSComponent *)v2 setTrigger:v4];

  return v2;
}

- (BOOL)isNoneAlarm
{
  uint64_t v3 = [(ICSComponent *)self x_apple_structured_location];
  if (v3)
  {
    int v4 = (void *)v3;
LABEL_4:
    BOOL v5 = 0;
    goto LABEL_5;
  }
  int v4 = [(ICSAlarm *)self x_apple_proximity];
  if ([v4 isEqualToString:@"CONNECT"]) {
    goto LABEL_4;
  }
  v7 = [(ICSAlarm *)self x_apple_proximity];
  char v8 = [v7 isEqualToString:@"DISCONNECT"];

  if (v8) {
    return 0;
  }
  if (![(ICSAlarm *)self action]) {
    return 1;
  }
  v9 = [(ICSComponent *)self trigger];
  char v10 = [v9 isDurationBased];

  if (v10) {
    return 0;
  }
  v11 = [(ICSComponent *)self trigger];
  int v4 = [v11 value];

  v12 = [v4 icsString];
  if ([v12 isEqualToString:@"19760401T005545Z"])
  {
    [(ICSAlarm *)self setAction:0];
    BOOL v5 = 1;
  }
  else
  {
    BOOL v5 = 0;
  }

LABEL_5:
  return v5;
}

- (int)action
{
  v2 = [(ICSComponent *)self propertiesForName:@"ACTION"];
  uint64_t v3 = [v2 lastObject];
  int v4 = [v3 value];
  int v5 = [v4 longValue];

  return v5;
}

- (void)setAction:(int)a3
{
  id v4 = +[ICSPredefinedValue numberWithLong:a3];
  [(ICSComponent *)self setPropertyValue:v4 type:5020 forName:@"ACTION"];
}

- (NSString)x_wr_alarmuid
{
  v2 = [(ICSComponent *)self propertiesForName:@"X-WR-ALARMUID"];
  uint64_t v3 = [v2 lastObject];
  id v4 = [v3 value];

  return (NSString *)v4;
}

- (void)setX_wr_alarmuid:(id)a3
{
}

- (ICSDateTimeUTCValue)acknowledged
{
  v2 = [(ICSComponent *)self propertiesForName:@"ACKNOWLEDGED"];
  uint64_t v3 = [v2 lastObject];
  id v4 = [v3 value];

  return (ICSDateTimeUTCValue *)v4;
}

- (void)setAcknowledged:(id)a3
{
}

- (NSString)relatedTo
{
  v2 = [(ICSComponent *)self propertiesForName:@"RELATED-TO"];
  uint64_t v3 = [v2 lastObject];
  id v4 = [v3 value];

  return (NSString *)v4;
}

- (void)setRelatedTo:(id)a3
{
}

- (NSString)x_apple_proximity
{
  v2 = [(ICSComponent *)self propertiesForName:@"X-APPLE-PROXIMITY"];
  uint64_t v3 = [v2 lastObject];
  id v4 = [v3 value];

  return (NSString *)v4;
}

- (void)setX_apple_proximity:(id)a3
{
}

- (void)setX_apple_default_alarm:(BOOL)a3
{
  if (a3)
  {
    id v4 = [NSNumber numberWithBool:1];
    [(ICSComponent *)self setPropertyValue:v4 type:5012 forName:@"X-APPLE-DEFAULT-ALARM"];
  }
  else
  {
    [(ICSComponent *)self removePropertiesForName:@"X-APPLE-DEFAULT-ALARM"];
  }
}

- (BOOL)x_apple_default_alarm
{
  v2 = [(ICSComponent *)self propertiesForName:@"X-APPLE-DEFAULT-ALARM"];
  uint64_t v3 = [v2 lastObject];
  id v4 = [v3 value];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (void)setX_apple_travel_default_alarm:(BOOL)a3
{
  if (a3)
  {
    id v4 = [NSNumber numberWithBool:1];
    [(ICSComponent *)self setPropertyValue:v4 type:5012 forName:@"X-APPLE-TRAVEL-DEFAULT-ALARM"];
  }
  else
  {
    [(ICSComponent *)self removePropertiesForName:@"X-APPLE-TRAVEL-DEFAULT-ALARM"];
  }
}

- (BOOL)x_apple_travel_default_alarm
{
  v2 = [(ICSComponent *)self propertiesForName:@"X-APPLE-TRAVEL-DEFAULT-ALARM"];
  uint64_t v3 = [v2 lastObject];
  id v4 = [v3 value];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (void)setX_apple_local_default_alarm:(BOOL)a3
{
  if (a3)
  {
    id v4 = [NSNumber numberWithBool:1];
    [(ICSComponent *)self setPropertyValue:v4 type:5012 forName:@"X-APPLE-LOCAL-DEFAULT-ALARM"];
  }
  else
  {
    [(ICSComponent *)self removePropertiesForName:@"X-APPLE-LOCAL-DEFAULT-ALARM"];
  }
}

- (BOOL)x_apple_local_default_alarm
{
  v2 = [(ICSComponent *)self propertiesForName:@"X-APPLE-LOCAL-DEFAULT-ALARM"];
  uint64_t v3 = [v2 lastObject];
  id v4 = [v3 value];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (NSData)bookmark
{
  v2 = [(ICSComponent *)self propertiesForName:@"X-APPLE-BOOKMARK"];
  uint64_t v3 = [v2 lastObject];
  id v4 = [v3 value];

  if ([v4 length]) {
    char v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v4 options:0];
  }
  else {
    char v5 = 0;
  }

  return (NSData *)v5;
}

- (void)setBookmark:(id)a3
{
  if (a3)
  {
    id v4 = [a3 base64EncodedStringWithOptions:0];
    [(ICSComponent *)self setPropertyValue:v4 forName:@"X-APPLE-BOOKMARK"];
  }
  else
  {
    [(ICSComponent *)self removePropertiesForName:@"X-APPLE-BOOKMARK"];
  }
}

@end