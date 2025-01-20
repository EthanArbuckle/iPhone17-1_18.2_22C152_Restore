@interface REMExporting
+ (BOOL)_updateICSComponentWithReminder:(id)a3 icsCalendarItem:(id)a4;
+ (id)_icsCalendarItemsFromReminders:(id)a3 exportingOption:(int64_t)a4;
+ (id)exportICSCalendarFromReminders:(id)a3;
+ (id)exportICSCalendarFromReminders:(id)a3 exportingOption:(int64_t)a4;
+ (id)icsTodoFromReminder:(id)a3;
+ (id)icsTodoFromReminder:(id)a3 exportingOption:(int64_t)a4;
@end

@implementation REMExporting

+ (id)exportICSCalendarFromReminders:(id)a3
{
  return (id)[a1 exportICSCalendarFromReminders:a3 exportingOption:0];
}

+ (id)exportICSCalendarFromReminders:(id)a3 exportingOption:(int64_t)a4
{
  v4 = [a1 _icsCalendarItemsFromReminders:a3 exportingOption:a4];
  id v5 = objc_alloc_init(MEMORY[0x1E4FB7F00]);
  [v5 setComponents:v4 options:2];

  return v5;
}

+ (id)_icsCalendarItemsFromReminders:(id)a3 exportingOption:(int64_t)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = v6;
  if (v6 && [v6 count])
  {
    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v18 = v7;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          v14 = [a1 icsTodoFromReminder:v13 exportingOption:a4];
          if (v14
            && ([MEMORY[0x1E4F1C978] arrayWithObject:v14],
                (uint64_t v15 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            v16 = v15;
            [v19 addObjectsFromArray:v15];
          }
          else
          {
            v16 = +[REMLogStore read];
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
              +[REMExporting(ICSExport) _icsCalendarItemsFromReminders:exportingOption:]((uint64_t)v24, v13);
            }
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v10);
    }

    v7 = v18;
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

+ (id)icsTodoFromReminder:(id)a3
{
  return (id)[a1 icsTodoFromReminder:a3 exportingOption:0];
}

+ (id)icsTodoFromReminder:(id)a3 exportingOption:(int64_t)a4
{
  char v4 = a4;
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [v6 importedICSData];

  if (!v7) {
    goto LABEL_21;
  }
  id v8 = [v6 importedICSData];
  id v54 = 0;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4FB7F48]) initWithData:v8 options:0 error:&v54];
  id v10 = v54;
  if (v10 || !v9)
  {
    uint64_t v13 = +[REMLogStore read];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[REMExporting(ICSExport) icsTodoFromReminder:exportingOption:]((uint64_t)v10, v13);
    }
    id v21 = 0;
  }
  else
  {
    uint64_t v11 = [v9 calendar];
    v12 = [v11 components];

    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    uint64_t v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v50 objects:v56 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      char v49 = v4;
      uint64_t v16 = *(void *)v51;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v51 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v50 + 1) + 8 * i);
          uint64_t v19 = objc_opt_class();
          uint64_t v20 = REMDynamicCast(v19, v18);
          if (v20)
          {
            id v21 = (id)v20;
            goto LABEL_17;
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v50 objects:v56 count:16];
        if (v15) {
          continue;
        }
        break;
      }
      id v21 = 0;
LABEL_17:
      char v4 = v49;
    }
    else
    {
      id v21 = 0;
    }
  }
  if (!v21) {
LABEL_21:
  }
    id v21 = objc_alloc_init(MEMORY[0x1E4FB7F90]);
  long long v22 = [v6 dueDateComponents];
  if (v22)
  {
    if ([v6 allDay])
    {
      long long v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB7F28]), "initWithYear:month:day:", objc_msgSend(v22, "year"), objc_msgSend(v22, "month"), objc_msgSend(v22, "day"));
      [v21 setDue:v23];
    }
    else if ((v4 & 1) != 0 {
           || ([v6 timeZone], v24 = objc_claimAutoreleasedReturnValue(), v24, v24))
    }
    {
      v25 = (void *)MEMORY[0x1E4F1CAF0];
      uint64_t v26 = [v6 timeZone];
      v27 = [v25 timeZoneWithName:v26];

      if (!v27)
      {
        if ((v4 & 1) == 0)
        {
          v28 = +[REMLogStore read];
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
            +[REMExporting(ICSExport) icsTodoFromReminder:exportingOption:](v6, v28);
          }
        }
        v27 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
      }
      v29 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB7F28]), "initWithYear:month:day:hour:minute:second:timeZone:", objc_msgSend(v22, "year"), objc_msgSend(v22, "month"), objc_msgSend(v22, "day"), objc_msgSend(v22, "hour"), objc_msgSend(v22, "minute"), objc_msgSend(v22, "second"), v27);
      [v21 setDue:v29];
    }
    else
    {
      v48 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB7F28]), "initWithYear:month:day:hour:minute:second:", objc_msgSend(v22, "year"), objc_msgSend(v22, "month"), objc_msgSend(v22, "day"), objc_msgSend(v22, "hour"), objc_msgSend(v22, "minute"), objc_msgSend(v22, "second"));
      [v21 setDue:v48];
    }
  }
  else
  {
    [v21 setDue:0];
  }
  v30 = [v21 due];

  if (v30)
  {
    v31 = [v21 due];
    [v21 setDtstart:v31];
  }
  else
  {
    [v21 setDtstart:0];
  }
  if ([a1 _updateICSComponentWithReminder:v6 icsCalendarItem:v21])
  {
    v32 = [v6 daCalendarItemUniqueIdentifier];
    if (v32) {
      [v21 setUid:v32];
    }
    v33 = [v6 userActivity];
    v34 = v33;
    if (!v33) {
      goto LABEL_51;
    }
    uint64_t v35 = [v33 type];
    if (v35 == 2)
    {
      v36 = [v34 userActivityData];
      if (v36) {
        objc_msgSend(v21, "setX_apple_appLinkData:", v36);
      }
    }
    else
    {
      if (v35 != 1)
      {
LABEL_51:
        v39 = [v6 completionDate];
        if (v39)
        {
          v40 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"UTC"];
          v41 = rem_ICSDateFromNSDate(v39, v40);
          [v21 setCompleted:v41];

          uint64_t v42 = 4;
          uint64_t v43 = 100;
        }
        else
        {
          [v21 setCompleted:0];
          uint64_t v43 = 0;
          uint64_t v42 = 3;
        }
        [v21 setPercentComplete:v43];
        [v21 setStatus:v42];
        objc_msgSend(v21, "setX_apple_sort_order:", objc_msgSend(v6, "icsDisplayOrder"));
        v44 = objc_msgSend(v6, "alternativeDisplayDateDate_forCalendar");
        if (v44)
        {
          v45 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"UTC"];
          v46 = rem_ICSDateFromNSDate(v44, v45);

          objc_msgSend(v21, "setX_apple_alternative_due_date_for_calendar:", v46);
        }
        else
        {
          objc_msgSend(v21, "setX_apple_alternative_due_date_for_calendar:", 0);
        }

        goto LABEL_58;
      }
      v36 = [v34 universalLink];
      if (v36)
      {
        v37 = (void *)[objc_alloc(MEMORY[0x1E4FB7F70]) initWithValue:v36 type:5013];
        v55 = v37;
        v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v55 count:1];
        objc_msgSend(v21, "setX_apple_activity:", v38);
      }
    }

    goto LABEL_51;
  }
  v32 = +[REMLogStore read];
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
    +[REMExporting(ICSExport) icsTodoFromReminder:exportingOption:](v32);
  }
LABEL_58:

  return v21;
}

+ (BOOL)_updateICSComponentWithReminder:(id)a3 icsCalendarItem:(id)a4
{
  uint64_t v295 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  BOOL v9 = !v8;
  if (v8) {
    goto LABEL_221;
  }
  id v228 = v7;
  uint64_t v10 = [v6 titleAsString];
  if (v10) {
    [v228 setSummary:v10];
  }
  BOOL v224 = v9;
  uint64_t v11 = [v6 notesAsString];
  if (v11) {
    [v228 setDescription:v11];
  }
  v223 = (void *)v11;
  v245 = (void *)v10;
  v12 = [v6 icsUrl];

  if (v12)
  {
    uint64_t v13 = [v6 icsUrl];
    [v228 setUrl:v13];
  }
  uint64_t v14 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v15 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"UTC"];
  uint64_t v16 = rem_ICSDateFromNSDateInTimezone(v14, v15);
  [v228 setDtstamp:v16];

  v17 = [v6 lastModifiedDate];
  if (v17)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"UTC"];
    uint64_t v19 = rem_ICSDateFromNSDateInTimezone(v17, v18);
    objc_msgSend(v228, "setLast_modified:", v19);
  }
  v222 = v17;
  uint64_t v20 = [v6 creationDate];
  if (v20)
  {
    id v21 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"UTC"];
    long long v22 = rem_ICSDateFromNSDateInTimezone(v20, v21);
    [v228 setCreated:v22];
  }
  v221 = v20;
  objc_msgSend(v228, "setPriority:", objc_msgSend(v6, "priority"));
  id v227 = v6;
  id v246 = v228;
  long long v23 = v245;
  if (_setSubcomponentsOnICSComponent_onceToken != -1) {
    dispatch_once(&_setSubcomponentsOnICSComponent_onceToken, &__block_literal_global_41);
  }
  v235 = [MEMORY[0x1E4F1CA48] array];
  [v227 alarms];
  v226 = id v225 = v6;
  if (v226)
  {
    v248 = [MEMORY[0x1E4F1CA48] array];
    memset(v285, 0, sizeof(v285));
    long long v286 = 0u;
    long long v287 = 0u;
    v24 = [v246 components];
    uint64_t v25 = [v24 countByEnumeratingWithState:v285 objects:buf count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = **(void **)&v285[16];
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (**(void **)&v285[16] != v27) {
            objc_enumerationMutation(v24);
          }
          uint64_t v29 = *(void *)(*(void *)&v285[8] + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v248 addObject:v29];
          }
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:v285 objects:buf count:16];
      }
      while (v26);
    }

    long long v283 = 0u;
    long long v284 = 0u;
    long long v281 = 0u;
    long long v282 = 0u;
    obuint64_t j = v226;
    long long v23 = v245;
    uint64_t v237 = [obj countByEnumeratingWithState:&v281 objects:v290 count:16];
    if (v237)
    {
      uint64_t v234 = *(void *)v282;
      do
      {
        uint64_t v30 = 0;
        do
        {
          if (*(void *)v282 != v234) {
            objc_enumerationMutation(obj);
          }
          uint64_t v255 = v30;
          v257 = v4;
          v31 = *(void **)(*((void *)&v281 + 1) + 8 * v30);
          long long v277 = 0u;
          long long v278 = 0u;
          long long v279 = 0u;
          long long v280 = 0u;
          id v259 = v248;
          uint64_t v32 = [v259 countByEnumeratingWithState:&v277 objects:&v273 count:16];
          if (v32)
          {
            uint64_t v33 = v32;
            uint64_t v34 = *(void *)v278;
            while (2)
            {
              for (uint64_t j = 0; j != v33; ++j)
              {
                if (*(void *)v278 != v34) {
                  objc_enumerationMutation(v259);
                }
                v36 = *(void **)(*((void *)&v277 + 1) + 8 * j);
                v37 = [v36 uid];
                v38 = [v31 alarmUID];
                if ([v37 isEqual:v38])
                {

LABEL_47:
                  id v42 = v36;
                  goto LABEL_48;
                }
                v39 = objc_msgSend(v36, "x_wr_alarmuid");
                v40 = [v31 alarmUID];
                int v41 = [v39 isEqual:v40];

                if (v41) {
                  goto LABEL_47;
                }
              }
              uint64_t v33 = [v259 countByEnumeratingWithState:&v277 objects:&v273 count:16];
              id v42 = 0;
              if (v33) {
                continue;
              }
              break;
            }
          }
          else
          {
            id v42 = 0;
          }
LABEL_48:

          long long v263 = 0u;
          long long v264 = 0u;
          long long v261 = 0u;
          long long v262 = 0u;
          id v43 = v235;
          uint64_t v44 = [v43 countByEnumeratingWithState:&v261 objects:&v269 count:16];
          if (v44)
          {
            uint64_t v45 = v44;
            uint64_t v46 = *(void *)v262;
            char v4 = v257;
            while (2)
            {
              for (uint64_t k = 0; k != v45; ++k)
              {
                if (*(void *)v262 != v46) {
                  objc_enumerationMutation(v43);
                }
                if (*(id *)(*((void *)&v261 + 1) + 8 * k) == v42)
                {
                  char v260 = 1;
                  goto LABEL_59;
                }
              }
              uint64_t v45 = [v43 countByEnumeratingWithState:&v261 objects:&v269 count:16];
              if (v45) {
                continue;
              }
              break;
            }
            char v260 = 0;
          }
          else
          {
            char v260 = 0;
            char v4 = v257;
          }
LABEL_59:

          if (!v42) {
            id v42 = objc_alloc_init(MEMORY[0x1E4FB7EC8]);
          }
          id v48 = v31;
          id v49 = v42;
          if (!v48)
          {
            id v60 = 0;
            long long v23 = v245;
            goto LABEL_130;
          }
          uint64_t v50 = [v48 trigger];
          objc_opt_class();
          v251 = (void *)v50;
          id v253 = v48;
          if (objc_opt_isKindOfClass())
          {
            uint64_t v51 = objc_opt_class();
            long long v52 = REMDynamicCast(v51, v50);
            long long v53 = [v52 dateComponents];
            int v54 = REMIsInvalidICSAlarmDateComponents(v53);

            if (v54)
            {
              v148 = +[REMLogStore read];
              if (os_log_type_enabled(v148, OS_LOG_TYPE_FAULT)) {
                +[REMExporting(ICSExport) _updateICSComponentWithReminder:icsCalendarItem:].cold.5(&v265, v266, v148);
              }
            }
            v55 = [v52 dateComponents];
            v56 = [v55 timeZone];
            uint64_t v57 = v56;
            id v58 = v49;
            if (v56)
            {
              id v59 = v56;
            }
            else
            {
              id v59 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
            }
            v64 = v59;

            v67 = (void *)MEMORY[0x1E4F1C9D8];
            v68 = [v52 dateComponents];
            v69 = objc_msgSend(v67, "rem_dateWithDateComponents:timeZone:", v68, v64);

            v70 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"UTC"];
            v71 = rem_ICSDateFromNSDateInTimezone(v69, v70);

            id v72 = objc_alloc(MEMORY[0x1E4FB7FA8]);
            v73 = [v71 value];
            v65 = (void *)[v72 initWithDate:v73];

            id v49 = v58;
            uint64_t v50 = (uint64_t)v251;
            id v48 = v253;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  v66 = +[REMLogStore read];
                  if (os_log_type_enabled(v66, OS_LOG_TYPE_FAULT)) {
                    +[REMExporting(ICSExport) _updateICSComponentWithReminder:icsCalendarItem:].cold.6((uint64_t)v289, v50);
                  }
                }
              }
              goto LABEL_77;
            }
            uint64_t v61 = objc_opt_class();
            long long v52 = REMDynamicCast(v61, v50);
            id v62 = objc_alloc(MEMORY[0x1E4FB7F50]);
            [v52 timeInterval];
            v64 = (void *)[v62 initWithWeeks:0 days:0 hours:0 minutes:0 seconds:(uint64_t)v63];
            v65 = (void *)[objc_alloc(MEMORY[0x1E4FB7FA8]) initWithDuration:v64];
          }

          if (v65) {
            goto LABEL_79;
          }
LABEL_77:
          v74 = [v49 trigger];

          if (!v74)
          {
            v75 = REMInvalidICSAlarmDateComponents();
            id v76 = objc_alloc(MEMORY[0x1E4FB7F30]);
            uint64_t v77 = [v75 year];
            uint64_t v78 = [v75 month];
            uint64_t v79 = [v75 day];
            id v80 = v49;
            uint64_t v81 = [v75 hour];
            uint64_t v82 = [v75 minute];
            uint64_t v83 = [v75 second];
            uint64_t v84 = v78;
            uint64_t v85 = v79;
            uint64_t v50 = (uint64_t)v251;
            id v48 = v253;
            uint64_t v86 = v81;
            id v49 = v80;
            uint64_t v87 = v82;
            char v4 = v257;
            v88 = (void *)[v76 initWithYear:v77 month:v84 day:v85 hour:v86 minute:v87 second:v83];
            v65 = (void *)[objc_alloc(MEMORY[0x1E4FB7FA8]) initWithDate:v88];

            if (v65)
            {
LABEL_79:
              [v49 setTrigger:v65];
            }
          }
          if (![v49 action]) {
            [v49 setAction:1];
          }
          v89 = [v49 description];
          if (v89)
          {
          }
          else if ([v49 action] != 2)
          {
            [v49 setDescription:@"Reminder"];
          }
          uint64_t v90 = [v48 alarmUID];
          if (v90)
          {
            [v49 setUid:v90];
            objc_msgSend(v49, "setX_wr_alarmuid:", v90);
          }
          else
          {
            v91 = [MEMORY[0x1E4FB7F18] makeUID];
            [v49 setUid:v91];
            objc_msgSend(v49, "setX_wr_alarmuid:", v91);
            v92 = +[REMLogStore read];
            if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR)) {
              +[REMExporting(ICSExport) _updateICSComponentWithReminder:icsCalendarItem:].cold.4((uint64_t)v288, (uint64_t)v48);
            }
          }
          uint64_t v93 = objc_opt_class();
          v94 = REMDynamicCast(v93, v50);
          uint64_t v95 = objc_opt_class();
          v96 = REMDynamicCast(v95, v50);
          v241 = v94;
          v243 = (void *)v90;
          v239 = v96;
          if (v94)
          {
            uint64_t v97 = [v94 proximity];
            if (v97 == 1)
            {
              v98 = (id *)MEMORY[0x1E4FB8328];
LABEL_100:
              id v101 = *v98;
            }
            else
            {
              if (v97 == 2)
              {
                v98 = (id *)MEMORY[0x1E4FB8338];
                goto LABEL_100;
              }
              id v101 = 0;
            }
            objc_msgSend(v49, "setX_apple_proximity:", v101);

            id v102 = v49;
            v103 = [v94 structuredLocation];
            v104 = [v103 contactLabel];
            [v103 longitude];
            if (fabs(v105) < 2.22044605e-16)
            {
              BOOL v106 = 0;
              goto LABEL_105;
            }
            [v103 latitude];
            BOOL v106 = fabs(v107) >= 2.22044605e-16;
            if (!v106)
            {
LABEL_105:
              if (!v104)
              {
                id v108 = 0;
LABEL_108:
                v109 = [v103 title];
                [v108 setTitle:v109];

                v110 = [v103 address];
                [v108 setAddress:v110];

                v111 = [v103 routing];
                [v108 setRouting:v111];

                if (v106)
                {
                  v112 = NSString;
                  [v103 latitude];
                  uint64_t v114 = v113;
                  [v103 longitude];
                  v116 = objc_msgSend(v112, "stringWithFormat:", @"geo:%f,%f", v114, v115);
                  v117 = [MEMORY[0x1E4F1CB10] URLWithString:v116];
                  [v108 setValue:v117 type:5013];

                  v118 = [v103 referenceFrameString];

                  if (v118)
                  {
                    v119 = [v103 referenceFrameString];
                    [v108 setParameterValue:v119 forName:@"X-APPLE-REFERENCEFRAME"];
                  }
                }
                else
                {
                  [v108 setValue:0 type:5013];
                  [v108 setParameterValue:0 forName:@"X-APPLE-REFERENCEFRAME"];
                }
                [v108 setParameterValue:v104 forName:@"X-APPLE-ABUID"];
                v120 = NSNumber;
                [v103 radius];
                v121 = objc_msgSend(v120, "numberWithDouble:");
                v122 = [v121 stringValue];
                [v108 setParameterValue:v122 forName:@"X-APPLE-RADIUS"];

                v123 = [v103 mapKitHandle];
                if (v123)
                {
                  [v108 setMapKitHandle:v123];
                  id v124 = [v108 ICSStringWithOptions:0];
                  v125 = (const char *)[v124 UTF8String];
                  if (v125 && strlen(v125) >= 0x3DF)
                  {
                    id v126 = v49;
                    v127 = +[REMLogStore read];
                    if (os_log_type_enabled(v127, OS_LOG_TYPE_ERROR)) {
                      +[REMExporting(ICSExport) _updateICSComponentWithReminder:icsCalendarItem:](&v267, v268, v127);
                    }

                    [v108 setMapKitHandle:0];
                    id v49 = v126;
                  }
                }
                id v48 = v253;
                goto LABEL_126;
              }
            }
            id v108 = objc_alloc_init(MEMORY[0x1E4FB7F88]);
            objc_msgSend(v102, "setX_apple_structured_location:", v108);
            goto LABEL_108;
          }
          if (v96)
          {
            uint64_t v99 = [v96 event];
            if (v99 == 1)
            {
              v100 = (id *)MEMORY[0x1E4FB8330];
LABEL_122:
              id v128 = *v100;
            }
            else
            {
              if (v99 == 2)
              {
                v100 = (id *)MEMORY[0x1E4FB8340];
                goto LABEL_122;
              }
              id v128 = 0;
            }
            objc_msgSend(v49, "setX_apple_proximity:", v128);
          }
          objc_msgSend(v49, "setX_apple_structured_location:", 0);
LABEL_126:

          v129 = [v48 acknowledgedDate];
          if (v129)
          {
            v233 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"UTC"];
            [v129 timeIntervalSinceReferenceDate];
            v131 = rem_DateComponentsFromAbsoluteTime(v233, v130);
            id v231 = objc_alloc(MEMORY[0x1E4FB7F30]);
            uint64_t v132 = [v131 year];
            v133 = v49;
            uint64_t v134 = [v131 month];
            uint64_t v135 = [v131 day];
            uint64_t v136 = [v131 hour];
            uint64_t v137 = [v131 minute];
            uint64_t v138 = [v131 second];
            uint64_t v139 = v132;
            id v48 = v253;
            uint64_t v140 = v134;
            id v49 = v133;
            uint64_t v141 = v135;
            char v4 = v257;
            v142 = (void *)[v231 initWithYear:v139 month:v140 day:v141 hour:v136 minute:v137 second:v138];
            [v133 setAcknowledged:v142];
          }
          else
          {
            [v49 setAcknowledged:0];
          }
          long long v23 = v245;
          v143 = [v48 originalAlarmUID];
          [v49 setRelatedTo:v143];

          id v60 = v49;
LABEL_130:

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_138;
          }
          v144 = [v60 trigger];
          if (v144)
          {
            char v4 = [v60 trigger];
            if (([v4 isDurationBased] & 1) == 0)
            {

LABEL_138:
              uint64_t v146 = v255;
              goto LABEL_139;
            }
          }
          v145 = [v246 dtstart];

          if (v144)
          {
          }
          uint64_t v146 = v255;
          if (!v145) {
            [v60 setTrigger:_setSubcomponentsOnICSComponent_sInvalidTrigger];
          }
LABEL_139:
          if (v60) {
            char v147 = v260;
          }
          else {
            char v147 = 1;
          }
          if ((v147 & 1) == 0) {
            [v43 addObject:v60];
          }

          uint64_t v30 = v146 + 1;
        }
        while (v30 != v237);
        uint64_t v149 = [obj countByEnumeratingWithState:&v281 objects:v290 count:16];
        uint64_t v237 = v149;
      }
      while (v149);
    }

    id v6 = v225;
  }
  [v246 setComponents:v235];

  id v150 = v227;
  id v151 = v246;
  v152 = [v150 recurrenceRules];
  if (!v152)
  {
    v219 = 0;
    goto LABEL_220;
  }
  id v232 = v151;
  v153 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v152, "count"));
  long long v269 = 0u;
  long long v270 = 0u;
  long long v271 = 0u;
  long long v272 = 0u;
  id obja = v152;
  id v154 = v152;
  uint64_t v155 = [v154 countByEnumeratingWithState:&v269 objects:v290 count:16];
  if (!v155) {
    goto LABEL_215;
  }
  uint64_t v156 = v155;
  uint64_t v247 = *(void *)v270;
  v238 = v153;
  id v240 = v150;
  id v236 = v154;
  do
  {
    uint64_t v157 = 0;
    uint64_t v242 = v156;
    do
    {
      if (*(void *)v270 != v247) {
        objc_enumerationMutation(v154);
      }
      id v158 = *(id *)(*((void *)&v269 + 1) + 8 * v157);
      id v159 = v150;
      v254 = v159;
      if (!v158)
      {
        v163 = 0;
        goto LABEL_208;
      }
      uint64_t v252 = v157;
      unint64_t v160 = [v158 frequency];
      uint64_t v161 = v160;
      id v256 = v158;
      if (v160 >= 5)
      {
        v164 = +[REMLogStore read];
        if (os_log_type_enabled(v164, OS_LOG_TYPE_ERROR)) {
          +[REMExporting(ICSExport) _updateICSComponentWithReminder:icsCalendarItem:]((uint64_t)&v277, v161);
        }

        uint64_t v162 = 4;
        id v158 = v256;
      }
      else
      {
        uint64_t v162 = qword_1B9BF2320[v160];
      }
      v258 = (void *)[objc_alloc(MEMORY[0x1E4FB7F78]) initWithFrequency:v162];
      uint64_t v165 = [v158 interval];
      if (v165 > 1)
      {
        v166 = [NSNumber numberWithInteger:v165];
        [v258 setInterval:v166];
      }
      if ([v158 firstDayOfTheWeek] >= 1 && objc_msgSend(v158, "firstDayOfTheWeek") != 2)
      {
        v167 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v158, "firstDayOfTheWeek"));
        [v258 setWkst:v167];
      }
      v168 = [v158 recurrenceEnd];
      v169 = [v168 endDate];

      v170 = [v158 recurrenceEnd];
      uint64_t v171 = [v170 occurrenceCount];

      if (v171)
      {
        v172 = [NSNumber numberWithUnsignedInteger:v171];
        [v258 setCount:v172];
      }
      else
      {
        id v158 = v256;
        if (!v169) {
          goto LABEL_181;
        }
        v173 = [v254 timeZone];

        if (v173)
        {
          v174 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"UTC"];
          uint64_t v175 = rem_ICSDateFromNSDateInTimezone(v169, v174);
        }
        else if ([v254 allDay])
        {
          [v169 timeIntervalSinceReferenceDate];
          v174 = rem_DateComponentsFromAbsoluteTime(0, v176);
          id v249 = objc_alloc(MEMORY[0x1E4FB7F28]);
          v177 = v23;
          v178 = v169;
          uint64_t v179 = [v174 year];
          uint64_t v180 = v156;
          uint64_t v181 = [v174 month];
          uint64_t v182 = [v174 day];
          uint64_t v183 = v179;
          v169 = v178;
          long long v23 = v177;
          uint64_t v184 = v181;
          uint64_t v156 = v180;
          uint64_t v175 = [v249 initWithYear:v183 month:v184 day:v182];
        }
        else
        {
          v174 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"UTC"];
          uint64_t v175 = rem_ICSFloatingDateTimeFromNSDateInTimezone(v169, v174);
        }
        v172 = (void *)v175;

        v185 = +[REMLogStore read];
        if (os_log_type_enabled(v185, OS_LOG_TYPE_DEBUG))
        {
          [v172 value];
          v218 = v217 = v169;
          *(_DWORD *)buf = 138412546;
          v292 = v218;
          __int16 v293 = 2112;
          uint64_t v294 = (uint64_t)v217;
          _os_log_debug_impl(&dword_1B9AA2000, v185, OS_LOG_TYPE_DEBUG, "Setting ICS recurrence until date: untilDate=%@ remEndDate=%@)", buf, 0x16u);

          v169 = v217;
        }

        v186 = [v172 value];
        [v258 setUntil:v186];
      }
      id v158 = v256;

LABEL_181:
      v187 = [v158 daysOfTheWeek];
      v250 = v187;
      if (v187)
      {
        v188 = v187;
        if ([v187 count])
        {
          v244 = v169;
          id v189 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v273 = 0u;
          long long v274 = 0u;
          long long v275 = 0u;
          long long v276 = 0u;
          id v190 = v188;
          uint64_t v191 = [v190 countByEnumeratingWithState:&v273 objects:buf count:16];
          if (v191)
          {
            uint64_t v192 = v191;
            uint64_t v193 = *(void *)v274;
            do
            {
              for (uint64_t m = 0; m != v192; ++m)
              {
                if (*(void *)v274 != v193) {
                  objc_enumerationMutation(v190);
                }
                v195 = *(void **)(*((void *)&v273 + 1) + 8 * m);
                uint64_t v196 = [v195 dayOfTheWeek];
                if ((unint64_t)(v196 - 1) >= 7)
                {
                  v197 = +[REMLogStore read];
                  if (os_log_type_enabled(v197, OS_LOG_TYPE_ERROR)) {
                    +[REMExporting(ICSExport) _updateICSComponentWithReminder:icsCalendarItem:]((uint64_t)&v281, v196);
                  }

                  uint64_t v196 = 1;
                }
                id v198 = objc_alloc(MEMORY[0x1E4FB7EF8]);
                v199 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v195, "weekNumber"));
                v200 = (void *)[v198 initWithWeekday:v196 number:v199];

                [v189 addObject:v200];
              }
              uint64_t v192 = [v190 countByEnumeratingWithState:&v273 objects:buf count:16];
            }
            while (v192);
          }

          v201 = +[REMLogStore read];
          if (os_log_type_enabled(v201, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)v285 = 138412546;
            *(void *)&v285[4] = v189;
            *(_WORD *)&v285[12] = 2112;
            *(void *)&v285[14] = v190;
            _os_log_debug_impl(&dword_1B9AA2000, v201, OS_LOG_TYPE_DEBUG, "Setting ICS byday days array: %@ %@", v285, 0x16u);
          }

          [v258 setByday:v189];
          v169 = v244;
          long long v23 = v245;
          v153 = v238;
          id v150 = v240;
          id v154 = v236;
          uint64_t v156 = v242;
          id v158 = v256;
        }
      }
      v202 = [v158 monthsOfTheYear];

      if (v202)
      {
        v203 = [v158 monthsOfTheYear];
        [v258 setBymonth:v203];
      }
      v204 = [v158 daysOfTheMonth];

      if (v204)
      {
        v205 = [v158 daysOfTheMonth];
        [v258 setBymonthday:v205];
      }
      v206 = [v158 weeksOfTheYear];

      if (v206)
      {
        v207 = [v158 weeksOfTheYear];
        [v258 setByweekno:v207];
      }
      v208 = [v158 daysOfTheYear];

      if (v208)
      {
        v209 = [v158 daysOfTheYear];
        [v258 setByyearday:v209];
      }
      v210 = [v158 setPositions];

      if (v210)
      {
        v211 = [v158 setPositions];
        [v258 setBysetpos:v211];
      }
      uint64_t v157 = v252;
      id v159 = v254;
      v163 = v258;
LABEL_208:

      if (v163)
      {
        [v153 addObject:v163];
      }
      else
      {
        uint64_t v212 = v157;
        v213 = +[REMLogStore read];
        if (os_log_type_enabled(v213, OS_LOG_TYPE_ERROR))
        {
          uint64_t v214 = [v254 objectID];
          id v215 = v158;
          v216 = (void *)v214;
          *(_DWORD *)buf = 138412546;
          v292 = v215;
          __int16 v293 = 2112;
          uint64_t v294 = v214;
          _os_log_error_impl(&dword_1B9AA2000, v213, OS_LOG_TYPE_ERROR, "Couldn't create an ICSRecurrence from REMRecurrenceRule %@ {reminderID: %@}", buf, 0x16u);
        }
        uint64_t v157 = v212;
      }

      ++v157;
    }
    while (v157 != v156);
    uint64_t v156 = [v154 countByEnumeratingWithState:&v269 objects:v290 count:16];
  }
  while (v156);
LABEL_215:

  if ([v153 count]) {
    v219 = (void *)[v153 copy];
  }
  else {
    v219 = 0;
  }
  id v151 = v232;

  v152 = obja;
  id v6 = v225;
LABEL_220:
  [v151 setRrule:v219];

  BOOL v9 = v224;
  id v7 = v228;
LABEL_221:

  return v9;
}

@end