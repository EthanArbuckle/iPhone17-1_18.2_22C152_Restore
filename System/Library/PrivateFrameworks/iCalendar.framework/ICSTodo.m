@interface ICSTodo
+ (id)name;
- (BOOL)validate:(id *)a3;
- (ICSDate)completed;
- (ICSDate)due;
- (ICSDate)x_apple_alternative_due_date_for_calendar;
- (NSArray)x_apple_activity;
- (NSData)x_apple_appLinkData;
- (int64_t)percentComplete;
- (unint64_t)x_apple_sort_order;
- (void)fixComponent;
- (void)setCompleted:(id)a3;
- (void)setDue:(id)a3;
- (void)setPercentComplete:(int64_t)a3;
- (void)setX_apple_activity:(id)a3;
- (void)setX_apple_alternative_due_date_for_calendar:(id)a3;
- (void)setX_apple_appLinkData:(id)a3;
- (void)setX_apple_sort_order:(unint64_t)a3;
@end

@implementation ICSTodo

- (void)fixComponent
{
  v29.receiver = self;
  v29.super_class = (Class)ICSTodo;
  [(ICSComponent *)&v29 fixComponent];
  v3 = [(ICSComponent *)self propertiesForName:@"COMPLETED"];

  if (v3)
  {
    v4 = [(ICSTodo *)self completed];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      [(ICSComponent *)self removePropertiesForName:@"COMPLETED"];
    }
  }
  v6 = [(ICSComponent *)self propertiesForName:@"PERCENT-COMPLETE"];

  if (v6)
  {
    v7 = [(ICSComponent *)self propertiesForName:@"PERCENT-COMPLETE"];
    v8 = [v7 lastObject];
    v9 = [v8 value];
    objc_opt_class();
    char v10 = objc_opt_isKindOfClass();

    if ((v10 & 1) == 0) {
      [(ICSComponent *)self removePropertiesForName:@"PERCENT-COMPLETE"];
    }
  }
  v11 = [(ICSComponent *)self propertiesForName:@"DUE"];

  if (v11)
  {
    v12 = [(ICSTodo *)self due];
    objc_opt_class();
    char v13 = objc_opt_isKindOfClass();

    if ((v13 & 1) == 0) {
      [(ICSComponent *)self removePropertiesForName:@"DUE"];
    }
  }
  v14 = [(ICSComponent *)self propertiesForName:@"PRIORITY"];

  if (v14)
  {
    v15 = [(ICSComponent *)self propertiesForName:@"PRIORITY"];
    v16 = [v15 lastObject];
    v17 = [v16 value];
    objc_opt_class();
    char v18 = objc_opt_isKindOfClass();

    if ((v18 & 1) == 0) {
      [(ICSComponent *)self removePropertiesForName:@"PRIORITY"];
    }
  }
  v19 = [(ICSComponent *)self propertiesForName:@"DURATION"];

  if (v19)
  {
    v20 = [(ICSComponent *)self propertiesForName:@"DURATION"];
    v21 = [v20 lastObject];
    v22 = [v21 value];
    objc_opt_class();
    char v23 = objc_opt_isKindOfClass();

    if ((v23 & 1) == 0) {
      [(ICSComponent *)self removePropertiesForName:@"DURATION"];
    }
  }
  v24 = [(ICSComponent *)self propertiesForName:@"X-APPLE-SORT-ORDER"];

  if (v24)
  {
    v25 = [(ICSComponent *)self propertiesForName:@"X-APPLE-SORT-ORDER"];
    v26 = [v25 lastObject];
    v27 = [v26 value];
    objc_opt_class();
    char v28 = objc_opt_isKindOfClass();

    if ((v28 & 1) == 0) {
      [(ICSComponent *)self removePropertiesForName:@"X-APPLE-SORT-ORDER"];
    }
  }
}

+ (id)name
{
  return @"VTODO";
}

- (BOOL)validate:(id *)a3
{
  v5 = [(ICSComponent *)self propertiesForName:@"STATUS"];

  if (v5)
  {
    unsigned int v6 = [(ICSComponent *)self status];
    unsigned int v7 = v6;
    if (v6 > 8 || ((1 << v6) & 0x139) == 0)
    {
      if (a3)
      {
        v9 = (void *)MEMORY[0x1E4F28C58];
        char v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:@"Invalid STATUS for VTODO." forKey:*MEMORY[0x1E4F28568]];
        *a3 = [v9 errorWithDomain:@"com.apple.iCalendar" code:1000 userInfo:v10];
      }
      if ((v7 | 8) != 8) {
        return 0;
      }
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)ICSTodo;
  return [(ICSComponent *)&v11 validate:a3];
}

- (ICSDate)completed
{
  v2 = [(ICSComponent *)self propertiesForName:@"COMPLETED"];
  v3 = [v2 lastObject];

  return (ICSDate *)v3;
}

- (void)setCompleted:(id)a3
{
}

- (int64_t)percentComplete
{
  v2 = [(ICSComponent *)self propertiesForName:@"PERCENT-COMPLETE"];
  v3 = [v2 lastObject];
  v4 = [v3 value];
  int64_t v5 = [v4 integerValue];

  return v5;
}

- (void)setPercentComplete:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0x63)
  {
    [(ICSComponent *)self removePropertiesForName:@"PERCENT-COMPLETE"];
  }
  else
  {
    objc_msgSend(NSNumber, "numberWithInteger:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(ICSComponent *)self setPropertyValue:v4 type:5008 forName:@"PERCENT-COMPLETE"];
  }
}

- (ICSDate)due
{
  v2 = [(ICSComponent *)self propertiesForName:@"DUE"];
  v3 = [v2 lastObject];

  return (ICSDate *)v3;
}

- (void)setDue:(id)a3
{
}

- (unint64_t)x_apple_sort_order
{
  v2 = [(ICSComponent *)self propertiesForName:@"X-APPLE-SORT-ORDER"];
  v3 = [v2 lastObject];
  id v4 = [v3 value];
  unint64_t v5 = [v4 unsignedIntegerValue];

  return v5;
}

- (void)setX_apple_sort_order:(unint64_t)a3
{
  if (a3)
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(ICSComponent *)self setPropertyValue:v4 type:5008 forName:@"X-APPLE-SORT-ORDER"];
  }
  else
  {
    [(ICSComponent *)self removePropertiesForName:@"X-APPLE-SORT-ORDER"];
  }
}

- (void)setX_apple_activity:(id)a3
{
}

- (NSArray)x_apple_activity
{
  return (NSArray *)[(ICSComponent *)self propertiesForName:@"X-APPLE-ACTIVITY"];
}

- (void)setX_apple_appLinkData:(id)a3
{
}

- (NSData)x_apple_appLinkData
{
  v2 = [(ICSComponent *)self propertiesForName:@"X-APPLE-APP-LINK-DATA"];
  v3 = [v2 lastObject];
  id v4 = [v3 value];

  return (NSData *)v4;
}

- (ICSDate)x_apple_alternative_due_date_for_calendar
{
  v2 = [(ICSComponent *)self propertiesForName:@"X-APPLE-ALTERNATIVE-DUE-DATE-FOR-CALENDAR"];
  v3 = [v2 lastObject];

  return (ICSDate *)v3;
}

- (void)setX_apple_alternative_due_date_for_calendar:(id)a3
{
}

@end