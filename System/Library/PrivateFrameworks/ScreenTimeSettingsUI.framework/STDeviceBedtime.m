@interface STDeviceBedtime
+ (STBlueprintScheduleSimpleItem)defaultBedtimeSchedule;
- (BOOL)askForMoreTime;
- (BOOL)deviceBedtimeEnabled;
- (BOOL)shouldAllowEditing;
- (NSDictionary)scheduleByWeekdayIndex;
- (NSString)scheduleText;
- (STBlueprintScheduleSimpleItem)simpleSchedule;
- (STDeviceBedtime)init;
- (STDeviceBedtime)initWithBlueprint:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAskForMoreTime:(BOOL)a3;
- (void)setDeviceBedtimeEnabled:(BOOL)a3;
- (void)setScheduleByWeekdayIndex:(id)a3;
- (void)setShouldAllowEditing:(BOOL)a3;
- (void)setSimpleSchedule:(id)a3;
@end

@implementation STDeviceBedtime

- (STDeviceBedtime)init
{
  return [(STDeviceBedtime *)self initWithBlueprint:0];
}

- (STDeviceBedtime)initWithBlueprint:(id)a3
{
  v42[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)STDeviceBedtime;
  v5 = [(STDeviceBedtime *)&v41 init];
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      v5->_deviceBedtimeEnabled = [v4 enabled];
      v7 = [v4 schedule];
      v8 = [v7 scheduleRepresentation];

      v9 = [v8 simpleSchedule];
      v10 = v9;
      if (v9)
      {
        v11 = v9;
        simpleSchedule = v6->_simpleSchedule;
        v6->_simpleSchedule = v11;
      }
      else
      {
        simpleSchedule = [v8 customScheduleItems];
        id v15 = objc_alloc(NSDictionary);
        v16 = [simpleSchedule valueForKey:@"day"];
        uint64_t v17 = [v15 initWithObjects:simpleSchedule forKeys:v16];
        scheduleByWeekdayIndex = v6->_scheduleByWeekdayIndex;
        v6->_scheduleByWeekdayIndex = (NSDictionary *)v17;

        v19 = [simpleSchedule firstObject];
        if (v19)
        {
          uint64_t v20 = objc_opt_new();
          v21 = v6->_simpleSchedule;
          v6->_simpleSchedule = (STBlueprintScheduleSimpleItem *)v20;

          v22 = [v19 startTime];
          [(STBlueprintScheduleSimpleItem *)v6->_simpleSchedule setStartTime:v22];

          v23 = [v19 endTime];
          [(STBlueprintScheduleSimpleItem *)v6->_simpleSchedule setEndTime:v23];
        }
        else
        {
          uint64_t v24 = [(id)objc_opt_class() defaultBedtimeSchedule];
          v23 = v6->_simpleSchedule;
          v6->_simpleSchedule = (STBlueprintScheduleSimpleItem *)v24;
        }
      }
      v25 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"objectID.URIRepresentation.absoluteString" ascending:1];
      v42[0] = v25;
      v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:1];

      v27 = [v4 configurations];
      v28 = [v27 sortedArrayUsingDescriptors:v26];
      v29 = [v28 firstObject];

      if (v29)
      {
        v30 = (void *)MEMORY[0x263F33378];
        v31 = [v29 payloadPlist];
        id v40 = 0;
        v32 = [v30 declarationForData:v31 error:&v40];
        id v33 = v40;

        v34 = [v32 payloadMode];
        int v35 = [v34 isEqualToString:*MEMORY[0x263F33320]];

        if (v35)
        {
          v6->_askForMoreTime = 0;
        }
        else
        {
          v36 = [v32 payloadMode];
          int v37 = [v36 isEqualToString:*MEMORY[0x263F33318]];

          if (v37)
          {
            v6->_askForMoreTime = 1;
          }
          else if (!v32 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
          {
            -[STDeviceBedtime initWithBlueprint:]();
          }
        }
        v38 = [v32 unknownPayloadKeys];
        v6->_shouldAllowEditing = [v38 count] == 0;
      }
    }
    else
    {
      *(_WORD *)&v5->_deviceBedtimeEnabled = 0;
      uint64_t v13 = [(id)objc_opt_class() defaultBedtimeSchedule];
      v14 = v6->_simpleSchedule;
      v6->_simpleSchedule = (STBlueprintScheduleSimpleItem *)v13;

      v6->_shouldAllowEditing = 1;
    }
  }

  return v6;
}

- (NSString)scheduleText
{
  v3 = [(STDeviceBedtime *)self scheduleByWeekdayIndex];
  id v4 = v3;
  if (v3)
  {
    v5 = (void *)MEMORY[0x263F67108];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __31__STDeviceBedtime_scheduleText__block_invoke;
    v18[3] = &unk_2647685C8;
    id v19 = v3;
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    id v15 = __31__STDeviceBedtime_scheduleText__block_invoke_2;
    v16 = &unk_2647685F0;
    id v17 = v19;
    v6 = [v5 scheduleTextWithLocale:0 weekdayScheduleComparator:v18 scheduleTimeGetter:&v13];
    if (!v6)
    {
      v7 = +[STScreenTimeSettingsUIBundle bundle];
      v6 = [v7 localizedStringForKey:@"DeviceDowntimeDailyScheduleOff" value:&stru_26D9391A8 table:0];
    }
  }
  else
  {
    v8 = [(STDeviceBedtime *)self simpleSchedule];
    v9 = (void *)MEMORY[0x263F67108];
    v10 = [v8 startTime];
    v11 = [v8 endTime];
    v6 = [v9 simpleScheduleTimeRangeWithStartTimeComponents:v10 endTimeComponents:v11];
  }

  return (NSString *)v6;
}

uint64_t __31__STDeviceBedtime_scheduleText__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v5 = *(void **)(a1 + 32);
  v6 = [NSNumber numberWithUnsignedInteger:a2 - 1];
  v7 = [v5 objectForKeyedSubscript:v6];

  if (v7)
  {
    v8 = *(void **)(a1 + 32);
    v9 = [NSNumber numberWithUnsignedInteger:a3 - 1];
    v10 = [v8 objectForKeyedSubscript:v9];

    v11 = [v10 startTime];
    v12 = [v7 startTime];
    if ([v11 isEqual:v12])
    {
      uint64_t v13 = [v10 endTime];
      uint64_t v14 = [v7 endTime];
      uint64_t v15 = [v13 isEqual:v14];
    }
    else
    {
      uint64_t v15 = 0;
    }
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

id __31__STDeviceBedtime_scheduleText__block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [NSNumber numberWithUnsignedInteger:a2 - 1];
  id v4 = [v2 objectForKeyedSubscript:v3];

  if (v4)
  {
    v5 = (void *)MEMORY[0x263F67108];
    v6 = [v4 startTime];
    v7 = [v4 endTime];
    v8 = [v5 customScheduleTimeRangeWithLocale:0 startTimeComponents:v6 endTimeComponents:v7];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithBlueprint:", 0);
  *(unsigned char *)(v5 + 8) = self->_deviceBedtimeEnabled;
  *(unsigned char *)(v5 + 9) = self->_askForMoreTime;
  uint64_t v6 = [(STBlueprintScheduleSimpleItem *)self->_simpleSchedule copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSDictionary *)self->_scheduleByWeekdayIndex copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  return (id)v5;
}

+ (STBlueprintScheduleSimpleItem)defaultBedtimeSchedule
{
  v2 = objc_opt_new();
  v3 = [MEMORY[0x263F67108] defaultStartTime];
  [v2 setStartTime:v3];

  id v4 = [MEMORY[0x263F67108] defaultEndTime];
  [v2 setEndTime:v4];

  return (STBlueprintScheduleSimpleItem *)v2;
}

- (BOOL)deviceBedtimeEnabled
{
  return self->_deviceBedtimeEnabled;
}

- (void)setDeviceBedtimeEnabled:(BOOL)a3
{
  self->_deviceBedtimeEnabled = a3;
}

- (BOOL)askForMoreTime
{
  return self->_askForMoreTime;
}

- (void)setAskForMoreTime:(BOOL)a3
{
  self->_askForMoreTime = a3;
}

- (BOOL)shouldAllowEditing
{
  return self->_shouldAllowEditing;
}

- (void)setShouldAllowEditing:(BOOL)a3
{
  self->_shouldAllowEditing = a3;
}

- (STBlueprintScheduleSimpleItem)simpleSchedule
{
  return (STBlueprintScheduleSimpleItem *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSimpleSchedule:(id)a3
{
}

- (NSDictionary)scheduleByWeekdayIndex
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setScheduleByWeekdayIndex:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduleByWeekdayIndex, 0);

  objc_storeStrong((id *)&self->_simpleSchedule, 0);
}

- (void)initWithBlueprint:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_225B06000, &_os_log_internal, v0, "Error creating category declaration from plist: %{public}@", v1, v2, v3, v4, v5);
}

@end