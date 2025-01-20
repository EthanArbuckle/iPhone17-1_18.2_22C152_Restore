@interface STDowntimeOverrideTransformer
+ (id)coreOverrideFromDowntimeOverride:(id)a3 existingDowntimeOverride:(id)a4 inContext:(id)a5;
+ (id)downtimeOverrideFromCoreDowntimeOverride:(id)a3 inContext:(id)a4;
@end

@implementation STDowntimeOverrideTransformer

+ (id)coreOverrideFromDowntimeOverride:(id)a3 existingDowntimeOverride:(id)a4 inContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v7 type];
  uint64_t v11 = [v7 state];
  v12 = (STCoreDowntimeOverride *)v8;
  v13 = v12;
  if (!v12) {
    v13 = [[STCoreDowntimeOverride alloc] initWithContext:v9];
  }
  [(STCoreDowntimeOverride *)v13 setType:v10 == 1];
  [(STCoreDowntimeOverride *)v13 setState:v11 == 1];
  v14 = [v7 creationDate];
  v15 = (void *)[v14 copy];
  [(STCoreDowntimeOverride *)v13 setCreationDate:v15];

  v16 = [v7 calendar];
  v17 = [v16 calendarIdentifier];
  v18 = (void *)[v17 copy];
  [(STCoreDowntimeOverride *)v13 setCalendarIdentifier:v18];

  v19 = [v7 endDate];
  v20 = (void *)[v19 copy];
  [(STCoreDowntimeOverride *)v13 setEndDate:v20];

  [(STCoreDowntimeOverride *)v13 setIsTombstoned:0];
  return v13;
}

+ (id)downtimeOverrideFromCoreDowntimeOverride:(id)a3 inContext:(id)a4
{
  id v5 = a3;
  BOOL v6 = [v5 state] == 1;
  id v7 = (void *)MEMORY[0x1E4F1C9A8];
  id v8 = [v5 calendarIdentifier];
  id v9 = [v7 calendarWithIdentifier:v8];

  if (!v9)
  {
    uint64_t v10 = +[STLog blueprint];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[STDowntimeOverrideTransformer downtimeOverrideFromCoreDowntimeOverride:inContext:](v5, v10);
    }

    id v9 = [MEMORY[0x1E4F1C9A8] autoupdatingCurrentCalendar];
  }
  uint64_t v11 = [v5 type];
  if (v11 == 1)
  {
    v15 = NSNumber;
    v16 = [v5 endDate];
    v17 = [v5 creationDate];
    [v16 timeIntervalSinceDate:v17];
    v12 = objc_msgSend(v15, "numberWithDouble:");

    v13 = [v5 creationDate];
    uint64_t v14 = +[STDowntimeOverride overrideWithState:v6 creationDate:v13 calendar:v9 fixedDuration:v12];
  }
  else
  {
    if (v11) {
      goto LABEL_10;
    }
    v12 = [v5 creationDate];
    v13 = [v5 endDate];
    uint64_t v14 = +[STDowntimeOverride overrideWithState:v6 creationDate:v12 calendar:v9 endDate:v13];
  }
  v4 = (void *)v14;

LABEL_10:
  return v4;
}

+ (void)downtimeOverrideFromCoreDowntimeOverride:(void *)a1 inContext:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = [a1 calendarIdentifier];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_1DA519000, a2, OS_LOG_TYPE_ERROR, "Failed to get calendar from persisted identifier: %@. Falling back to current.", (uint8_t *)&v4, 0xCu);
}

@end