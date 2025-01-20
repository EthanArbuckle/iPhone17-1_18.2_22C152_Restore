@interface STAllowance
+ (double)timeIntervalForAllowanceDateComponents:(id)a3;
+ (id)dateComponentsForDuration:(double)a3;
- (BOOL)allowanceEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldAllowEditing;
- (NSArray)bundleIdentifiers;
- (NSArray)categoryIdentifiers;
- (NSArray)webDomains;
- (NSDateComponents)time;
- (NSDictionary)timeByDay;
- (NSString)identifier;
- (NSString)scheduleText;
- (STAllowance)init;
- (STAllowance)initWithBlueprint:(id)a3;
- (double)timeToday;
- (id)copyWithZone:(_NSZone *)a3;
- (id)defaultBudgetTime;
- (id)defaultTimeByDay;
- (unint64_t)behaviorType;
- (unint64_t)hash;
- (void)setAllowanceEnabled:(BOOL)a3;
- (void)setBehaviorType:(unint64_t)a3;
- (void)setBundleIdentifiers:(id)a3;
- (void)setCategoryIdentifiers:(id)a3;
- (void)setShouldAllowEditing:(BOOL)a3;
- (void)setTime:(id)a3;
- (void)setTimeByDay:(id)a3;
- (void)setWebDomains:(id)a3;
@end

@implementation STAllowance

- (STAllowance)init
{
  return [(STAllowance *)self initWithBlueprint:0];
}

- (STAllowance)initWithBlueprint:(id)a3
{
  v98[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v96.receiver = self;
  v96.super_class = (Class)STAllowance;
  v5 = [(STAllowance *)&v96 init];
  if (v5)
  {
    if (!v4)
    {
      id v18 = [NSString alloc];
      uint64_t v19 = *MEMORY[0x263F672A8];
      v20 = objc_opt_new();
      v21 = [v20 UUIDString];
      uint64_t v22 = [v18 initWithFormat:@"%@_%@", v19, v21];

      identifier = v5->_identifier;
      v5->_identifier = (NSString *)v22;

      *(_WORD *)&v5->_allowanceEnabled = 257;
      bundleIdentifiers = v5->_bundleIdentifiers;
      v25 = (NSArray *)MEMORY[0x263EFFA68];
      v5->_bundleIdentifiers = (NSArray *)MEMORY[0x263EFFA68];

      webDomains = v5->_webDomains;
      v5->_webDomains = v25;

      categoryIdentifiers = v5->_categoryIdentifiers;
      v5->_categoryIdentifiers = v25;

      uint64_t v28 = [(STAllowance *)v5 defaultBudgetTime];
      time = v5->_time;
      v5->_time = (NSDateComponents *)v28;
LABEL_41:

      goto LABEL_42;
    }
    uint64_t v6 = [v4 identifier];
    v7 = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_allowanceEnabled = [v4 limitEnabled];
    v8 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"objectID.URIRepresentation.absoluteString" ascending:1];
    v98[0] = v8;
    time = [MEMORY[0x263EFF8C0] arrayWithObjects:v98 count:1];

    v10 = [v4 configurations];
    v11 = [v10 sortedArrayUsingDescriptors:time];
    v12 = [v11 firstObject];

    v13 = (void *)MEMORY[0x263F33378];
    v86 = v12;
    v14 = [v12 payloadPlist];
    id v95 = 0;
    v15 = [v13 declarationForData:v14 error:&v95];
    id v87 = v95;

    if (!v15)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
        -[STAllowance initWithBlueprint:]();
      }
LABEL_13:
      v29 = [v15 unknownPayloadKeys];
      v5->_shouldAllowEditing = [v29 count] == 0;

      v30 = [v4 usageLimit];
      v31 = [v30 usageItemType];
      v32 = [v30 applicationIdentifiers];
      v90 = [v30 websiteIdentifiers];
      v33 = [v30 categoryIdentifiersVersion2];
      v34 = v33;
      if (v33)
      {
        id v35 = v33;
      }
      else
      {
        id v35 = [v30 categoryIdentifiers];
      }
      v89 = v35;

      v88 = time;
      if ([v32 count] || objc_msgSend(v90, "count") || objc_msgSend(v89, "count"))
      {
        v36 = v31;
        v37 = v32;
        uint64_t v38 = [v32 copy];
        v39 = (void *)v38;
        v40 = (void *)MEMORY[0x263EFFA68];
        if (v38) {
          v41 = (void *)v38;
        }
        else {
          v41 = (void *)MEMORY[0x263EFFA68];
        }
        objc_storeStrong((id *)&v5->_bundleIdentifiers, v41);

        uint64_t v42 = [v90 copy];
        v43 = (void *)v42;
        if (v42) {
          v44 = (void *)v42;
        }
        else {
          v44 = v40;
        }
        objc_storeStrong((id *)&v5->_webDomains, v44);

        uint64_t v45 = [v89 copy];
        v46 = (void *)v45;
        if (v45) {
          v47 = (void *)v45;
        }
        else {
          v47 = v40;
        }
        objc_storeStrong((id *)&v5->_categoryIdentifiers, v47);
        goto LABEL_29;
      }
      if ([v31 isEqualToString:*MEMORY[0x263F672D8]])
      {
        v36 = v31;
        v37 = v32;
        v67 = [v30 itemIdentifiers];
        uint64_t v68 = [v67 copy];
        v69 = v5->_bundleIdentifiers;
        v5->_bundleIdentifiers = (NSArray *)v68;

        v70 = v5->_webDomains;
        v71 = (NSArray *)MEMORY[0x263EFFA68];
        v5->_webDomains = (NSArray *)MEMORY[0x263EFFA68];
      }
      else
      {
        if (![v31 isEqualToString:*MEMORY[0x263F672E8]])
        {
          if (![v31 isEqualToString:*MEMORY[0x263F672E0]]) {
            goto LABEL_30;
          }
          v36 = v31;
          v37 = v32;
          v76 = v5->_bundleIdentifiers;
          v77 = (NSArray *)MEMORY[0x263EFFA68];
          v5->_bundleIdentifiers = (NSArray *)MEMORY[0x263EFFA68];

          v78 = v5->_webDomains;
          v5->_webDomains = v77;

          v46 = [v30 itemIdentifiers];
          uint64_t v79 = [v46 copy];
          v80 = v5->_categoryIdentifiers;
          v5->_categoryIdentifiers = (NSArray *)v79;

LABEL_29:
          v32 = v37;
          v31 = v36;
          time = v88;
LABEL_30:
          v48 = v15;
          v49 = [v30 budgetLimitScheduleRepresentation];
          v50 = [v49 simpleSchedule];
          if (v50)
          {
            v51 = objc_opt_class();
            [v50 budgetLimit];
            uint64_t v52 = objc_msgSend(v51, "dateComponentsForDuration:");
            timeByDay = v5->_time;
            v5->_time = (NSDateComponents *)v52;
          }
          else
          {
            v81 = v32;
            v82 = v31;
            v83 = v30;
            v84 = v48;
            id v85 = v4;
            v54 = (NSDictionary *)objc_opt_new();
            long long v91 = 0u;
            long long v92 = 0u;
            long long v93 = 0u;
            long long v94 = 0u;
            v55 = [v49 customScheduleItems];
            uint64_t v56 = [v55 countByEnumeratingWithState:&v91 objects:v97 count:16];
            if (v56)
            {
              uint64_t v57 = v56;
              uint64_t v58 = *(void *)v92;
              do
              {
                for (uint64_t i = 0; i != v57; ++i)
                {
                  if (*(void *)v92 != v58) {
                    objc_enumerationMutation(v55);
                  }
                  v60 = *(void **)(*((void *)&v91 + 1) + 8 * i);
                  v61 = objc_opt_class();
                  [v60 budgetLimit];
                  v62 = objc_msgSend(v61, "dateComponentsForDuration:");
                  v63 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v60, "day"));
                  [(NSDictionary *)v54 setObject:v62 forKeyedSubscript:v63];
                }
                uint64_t v57 = [v55 countByEnumeratingWithState:&v91 objects:v97 count:16];
              }
              while (v57);
            }

            uint64_t v64 = [(NSDictionary *)v54 objectForKeyedSubscript:&unk_26D9673F0];
            v65 = v5->_time;
            v5->_time = (NSDateComponents *)v64;

            timeByDay = v5->_timeByDay;
            v5->_timeByDay = v54;
            v48 = v84;
            id v4 = v85;
            time = v88;
            v31 = v82;
            v30 = v83;
            v50 = 0;
            v32 = v81;
          }

          goto LABEL_41;
        }
        v36 = v31;
        v37 = v32;
        v72 = v5->_bundleIdentifiers;
        v71 = (NSArray *)MEMORY[0x263EFFA68];
        v5->_bundleIdentifiers = (NSArray *)MEMORY[0x263EFFA68];

        v73 = [v30 itemIdentifiers];
        uint64_t v74 = [v73 copy];
        v75 = v5->_webDomains;
        v5->_webDomains = (NSArray *)v74;
      }
      v46 = v5->_categoryIdentifiers;
      v5->_categoryIdentifiers = v71;
      goto LABEL_29;
    }
    v16 = [v15 payloadMode];
    if ([v16 isEqualToString:*MEMORY[0x263F33320]])
    {
      uint64_t v17 = 0;
    }
    else
    {
      if (![v16 isEqualToString:*MEMORY[0x263F33318]])
      {
LABEL_12:

        goto LABEL_13;
      }
      uint64_t v17 = 1;
    }
    v5->_behaviorType = v17;
    goto LABEL_12;
  }
LABEL_42:

  return v5;
}

- (double)timeToday
{
  v3 = [(STAllowance *)self timeByDay];
  if (v3)
  {
    id v4 = [MEMORY[0x263EFF8F0] currentCalendar];
    v5 = objc_opt_new();
    uint64_t v6 = [v4 component:16 fromDate:v5];

    v7 = [NSNumber numberWithInteger:v6];
    v8 = [v3 objectForKeyedSubscript:v7];
  }
  else
  {
    v8 = [(STAllowance *)self time];
  }
  [(id)objc_opt_class() timeIntervalForAllowanceDateComponents:v8];
  double v10 = v9;

  return v10;
}

- (NSString)scheduleText
{
  v3 = [(STAllowance *)self timeByDay];
  id v4 = objc_opt_new();
  [v4 setFormattingContext:1];
  [v4 setUnitsStyle:5];
  if (v3)
  {
    v5 = (void *)MEMORY[0x263F67108];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __27__STAllowance_scheduleText__block_invoke;
    v20[3] = &unk_2647685C8;
    id v21 = v3;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __27__STAllowance_scheduleText__block_invoke_2;
    v17[3] = &unk_264768618;
    id v18 = v21;
    id v19 = v4;
    uint64_t v6 = [v5 scheduleTextWithLocale:0 weekdayScheduleComparator:v20 scheduleTimeGetter:v17];
    if (!v6)
    {
      v7 = +[STScreenTimeSettingsUIBundle bundle];
      uint64_t v6 = [v7 localizedStringForKey:@"AppLimitOff" value:&stru_26D9391A8 table:0];
    }
  }
  else
  {
    v8 = [(STAllowance *)self time];
    +[STAllowance timeIntervalForAllowanceDateComponents:v8];
    double v10 = v9;

    v11 = [v4 stringFromTimeInterval:v10];
    v12 = +[STScreenTimeSettingsUIBundle bundle];
    v13 = [v12 localizedStringForKey:@"AppLimitEveryDayFormat" value:&stru_26D9391A8 table:0];

    id v14 = [NSString alloc];
    v15 = [MEMORY[0x263EFF960] currentLocale];
    uint64_t v6 = objc_msgSend(v14, "initWithFormat:locale:", v13, v15, v11);
  }

  return (NSString *)v6;
}

uint64_t __27__STAllowance_scheduleText__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v5 = *(void **)(a1 + 32);
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:a2];
  v7 = [v5 objectForKeyedSubscript:v6];

  if (v7)
  {
    v8 = *(void **)(a1 + 32);
    double v9 = [NSNumber numberWithUnsignedInteger:a3];
    double v10 = [v8 objectForKeyedSubscript:v9];

    uint64_t v11 = [v10 isEqual:v7];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

id __27__STAllowance_scheduleText__block_invoke_2(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = [NSNumber numberWithUnsignedInteger:a2];
  v5 = [v3 objectForKeyedSubscript:v4];

  if (v5)
  {
    +[STAllowance timeIntervalForAllowanceDateComponents:v5];
    uint64_t v6 = objc_msgSend(*(id *)(a1 + 40), "stringFromTimeInterval:");
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[STAllowance allocWithZone:](STAllowance, "allocWithZone:") initWithBlueprint:0];
  v5->_allowanceEnabled = self->_allowanceEnabled;
  objc_storeStrong((id *)&v5->_identifier, self->_identifier);
  uint64_t v6 = [(NSArray *)self->_bundleIdentifiers copyWithZone:a3];
  bundleIdentifiers = v5->_bundleIdentifiers;
  v5->_bundleIdentifiers = (NSArray *)v6;

  uint64_t v8 = [(NSArray *)self->_webDomains copyWithZone:a3];
  webDomains = v5->_webDomains;
  v5->_webDomains = (NSArray *)v8;

  uint64_t v10 = [(NSArray *)self->_categoryIdentifiers copyWithZone:a3];
  categoryIdentifiers = v5->_categoryIdentifiers;
  v5->_categoryIdentifiers = (NSArray *)v10;

  v5->_behaviorType = self->_behaviorType;
  uint64_t v12 = [(NSDateComponents *)self->_time copy];
  time = v5->_time;
  v5->_time = (NSDateComponents *)v12;

  uint64_t v14 = [(NSDictionary *)self->_timeByDay copy];
  timeByDay = v5->_timeByDay;
  v5->_timeByDay = (NSDictionary *)v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [(STAllowance *)self timeByDay];
    v7 = [v5 timeByDay];
    int v8 = [(STAllowance *)self allowanceEnabled];
    if (v8 == [v5 allowanceEnabled])
    {
      double v9 = [(STAllowance *)self identifier];
      uint64_t v10 = [v5 identifier];
      if ([v9 isEqualToString:v10]
        && (unint64_t v11 = -[STAllowance behaviorType](self, "behaviorType"), v11 == [v5 behaviorType]))
      {
        uint64_t v12 = [(STAllowance *)self bundleIdentifiers];
        v13 = [v5 bundleIdentifiers];
        if ([v12 isEqualToArray:v13])
        {
          v23 = [(STAllowance *)self webDomains];
          uint64_t v14 = [v5 webDomains];
          if ([v23 isEqualToArray:v14])
          {
            uint64_t v22 = [(STAllowance *)self categoryIdentifiers];
            id v21 = [v5 categoryIdentifiers];
            if ([v22 isEqualToArray:v21])
            {
              v20 = [(STAllowance *)self time];
              v15 = [v5 time];
              if (STCompareHourMinuteTimeComponents())
              {
                BOOL v16 = 0;
              }
              else
              {
                uint64_t v19 = [v6 count];
                BOOL v16 = v19 == [v7 count];
              }
              *((unsigned char *)v28 + 24) = v16;
            }
            else
            {
              *((unsigned char *)v28 + 24) = 0;
            }
          }
          else
          {
            *((unsigned char *)v28 + 24) = 0;
          }
        }
        else
        {
          *((unsigned char *)v28 + 24) = 0;
        }
      }
      else
      {
        *((unsigned char *)v28 + 24) = 0;
      }

      if (*((unsigned char *)v28 + 24))
      {
        v24[0] = MEMORY[0x263EF8330];
        v24[1] = 3221225472;
        v24[2] = __23__STAllowance_isEqual___block_invoke;
        v24[3] = &unk_264768640;
        id v25 = v7;
        v26 = &v27;
        [v6 enumerateKeysAndObjectsUsingBlock:v24];
      }
    }
    else
    {
      *((unsigned char *)v28 + 24) = 0;
    }
  }
  char v17 = *((unsigned char *)v28 + 24);
  _Block_object_dispose(&v27, 8);

  return v17;
}

void __23__STAllowance_isEqual___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v8 = a3;
  v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  if (!v7 || STCompareHourMinuteTimeComponents())
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (unint64_t)hash
{
  uint64_t v3 = [(STAllowance *)self allowanceEnabled];
  id v4 = [(STAllowance *)self identifier];
  uint64_t v5 = [v4 hash];
  uint64_t v6 = [(STAllowance *)self bundleIdentifiers];
  uint64_t v7 = v5 ^ [v6 hash] ^ v3;
  id v8 = [(STAllowance *)self webDomains];
  uint64_t v9 = [v8 hash];
  uint64_t v10 = [(STAllowance *)self categoryIdentifiers];
  uint64_t v11 = v9 ^ [v10 hash];
  unint64_t v12 = v7 ^ v11 ^ [(STAllowance *)self behaviorType];
  v13 = [(STAllowance *)self time];
  uint64_t v14 = [v13 hash];
  v15 = [(STAllowance *)self timeByDay];
  unint64_t v16 = v12 ^ v14 ^ [v15 hash];

  return v16;
}

+ (id)dateComponentsForDuration:(double)a3
{
  uint64_t v3 = (uint64_t)a3;
  id v4 = objc_opt_new();
  [v4 setHour:v3 / 3600 % 24];
  [v4 setMinute:v3 / 60 % 60];
  [v4 setSecond:v3 % 60];

  return v4;
}

+ (double)timeIntervalForAllowanceDateComponents:(id)a3
{
  id v3 = a3;
  uint64_t v4 = 3600 * [v3 hour];
  uint64_t v5 = [v3 minute];

  return (double)(v4 + 60 * v5);
}

- (id)defaultBudgetTime
{
  v2 = objc_opt_new();
  [v2 setHour:0];
  [v2 setMinute:0];

  return v2;
}

- (id)defaultTimeByDay
{
  v2 = [(STAllowance *)self time];
  [(id)objc_opt_class() timeIntervalForAllowanceDateComponents:v2];
  if (!v2 || v3 <= 0.0)
  {
    uint64_t v4 = objc_opt_new();

    [v4 setHour:0];
    [v4 setMinute:0];
    v2 = v4;
  }
  uint64_t v5 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:7];
  for (uint64_t i = 1; i != 8; ++i)
  {
    uint64_t v7 = [NSNumber numberWithUnsignedInteger:i];
    [v5 setObject:v2 forKeyedSubscript:v7];
  }

  return v5;
}

- (NSArray)bundleIdentifiers
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBundleIdentifiers:(id)a3
{
}

- (NSArray)webDomains
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setWebDomains:(id)a3
{
}

- (NSArray)categoryIdentifiers
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCategoryIdentifiers:(id)a3
{
}

- (BOOL)allowanceEnabled
{
  return self->_allowanceEnabled;
}

- (void)setAllowanceEnabled:(BOOL)a3
{
  self->_allowanceEnabled = a3;
}

- (BOOL)shouldAllowEditing
{
  return self->_shouldAllowEditing;
}

- (void)setShouldAllowEditing:(BOOL)a3
{
  self->_shouldAllowEditing = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)behaviorType
{
  return self->_behaviorType;
}

- (void)setBehaviorType:(unint64_t)a3
{
  self->_behaviorType = a3;
}

- (NSDateComponents)time
{
  return self->_time;
}

- (void)setTime:(id)a3
{
}

- (NSDictionary)timeByDay
{
  return self->_timeByDay;
}

- (void)setTimeByDay:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeByDay, 0);
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_categoryIdentifiers, 0);
  objc_storeStrong((id *)&self->_webDomains, 0);

  objc_storeStrong((id *)&self->_bundleIdentifiers, 0);
}

- (void)initWithBlueprint:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_225B06000, &_os_log_internal, v0, "failed to deserialize configuration plist: %{public}@", v1, v2, v3, v4, v5);
}

@end