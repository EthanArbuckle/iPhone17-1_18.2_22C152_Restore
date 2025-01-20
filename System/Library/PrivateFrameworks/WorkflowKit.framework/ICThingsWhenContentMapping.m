@interface ICThingsWhenContentMapping
- (void)getStringRepresentation:(id)a3 withInput:(id)a4 parameters:(id)a5;
@end

@implementation ICThingsWhenContentMapping

- (void)getStringRepresentation:(id)a3 withInput:(id)a4 parameters:(id)a5
{
  v30 = a3;
  id v6 = a5;
  v7 = [v6 objectForKey:@"thingsWhen"];
  if ([v7 isEqualToString:@"This Evening"])
  {
    v8 = (void (*)(void))v30[2];
LABEL_5:
    v8();
    goto LABEL_19;
  }
  if ([v7 isEqualToString:@"Someday"])
  {
    v8 = (void (*)(void))v30[2];
    goto LABEL_5;
  }
  v9 = [v6 objectForKey:@"thingsWhenCustomDate"];
  v10 = [MEMORY[0x1E4F5A8B0] datesInString:v9 error:0];
  v11 = [v10 firstObject];

  if ([v7 isEqualToString:@"Today"])
  {
    id v12 = [MEMORY[0x1E4F1C9C8] date];
LABEL_12:
    v14 = v12;
LABEL_13:
    v15 = objc_opt_new();
    v16 = [v6 objectForKey:@"thingsWhenReminderTime"];
    v17 = [MEMORY[0x1E4F5A8B0] datesInString:v16 error:0];
    v18 = [v17 firstObject];

    if ([v16 length] && v18)
    {
      v19 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      [v19 components:224 fromDate:v18];
      v20 = v28 = v18;
      v29 = v11;
      v21 = v9;
      uint64_t v22 = [v20 hour];
      uint64_t v23 = [v20 minute];
      uint64_t v24 = [v20 second];
      uint64_t v25 = v22;
      v9 = v21;
      v11 = v29;
      uint64_t v26 = [v19 dateBySettingHour:v25 minute:v23 second:v24 ofDate:v14 options:0];

      [v15 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"];
      v18 = v28;

      v14 = (void *)v26;
    }
    else
    {
      [v15 setDateFormat:@"yyyy-MM-dd"];
    }
    v27 = [v15 stringFromDate:v14];
    ((void (*)(void *, void *, void))v30[2])(v30, v27, 0);

    goto LABEL_18;
  }
  if ([v7 isEqualToString:@"Tomorrow"])
  {
    v13 = [MEMORY[0x1E4F1C9C8] date];
    v14 = [v13 dateByAddingTimeInterval:86400.0];

    goto LABEL_13;
  }
  if ([v7 isEqualToString:@"On Date"])
  {
    id v12 = v11;
    goto LABEL_12;
  }
  ((void (*)(void *, void, void))v30[2])(v30, 0, 0);
LABEL_18:

LABEL_19:
}

@end