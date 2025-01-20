@interface SCLScheduleSettings
+ (BOOL)supportsSecureCoding;
+ (unint64_t)version;
- (BOOL)isActiveAtDate:(id)a3 calendar:(id)a4;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (SCLSchedule)schedule;
- (SCLScheduleSettings)init;
- (SCLScheduleSettings)initWithCoder:(id)a3;
- (SCLScheduleSettings)initWithSchoolModeScheduleSettings:(id)a3;
- (id)dateIntervalForActiveScheduleOnOrAfterDate:(id)a3 calendar:(id)a4;
- (id)debugDescription;
- (id)description;
- (id)endTimeForDay:(int64_t)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)recurrenceForActiveScheduleOnOrAfterDate:(id)a3 calendar:(id)a4;
- (id)startTimeForDay:(int64_t)a3;
- (unint64_t)hash;
- (unint64_t)version;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SCLScheduleSettings

+ (unint64_t)version
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SCLScheduleSettings)init
{
  v6.receiver = self;
  v6.super_class = (Class)SCLScheduleSettings;
  v2 = [(SCLScheduleSettings *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(SCLSchedule);
    schedule = v2->_schedule;
    v2->_schedule = v3;
  }
  return v2;
}

- (SCLScheduleSettings)initWithSchoolModeScheduleSettings:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCLScheduleSettings;
  v5 = [(SCLScheduleSettings *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 schedule];
    schedule = v5->_schedule;
    v5->_schedule = (SCLSchedule *)v6;

    v5->_enabled = [v4 isEnabled];
    v5->_version = [(id)objc_opt_class() version];
  }

  return v5;
}

- (SCLScheduleSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SCLScheduleSettings;
  v5 = [(SCLScheduleSettings *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"schedule"];
    schedule = v5->_schedule;
    v5->_schedule = (SCLSchedule *)v6;

    if (!v5->_schedule)
    {
      v8 = objc_alloc_init(SCLSchedule);
      objc_super v9 = v5->_schedule;
      v5->_schedule = v8;
    }
    v5->_enabled = [v4 decodeBoolForKey:@"enabled"];
    v5->_version = [v4 decodeIntegerForKey:@"version"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  schedule = self->_schedule;
  id v5 = a3;
  [v5 encodeObject:schedule forKey:@"schedule"];
  [v5 encodeBool:self->_enabled forKey:@"enabled"];
  [v5 encodeInteger:self->_version forKey:@"version"];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [SCLMutableScheduleSettings alloc];
  return [(SCLScheduleSettings *)v4 initWithSchoolModeScheduleSettings:self];
}

- (unint64_t)hash
{
  v3 = [(SCLScheduleSettings *)self schedule];
  unint64_t v4 = [v3 hash] ^ self->_enabled;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int v6 = [v5 isEnabled];
    if (v6 == [(SCLScheduleSettings *)self isEnabled])
    {
      v8 = [v5 schedule];
      objc_super v9 = [(SCLScheduleSettings *)self schedule];
      char v7 = [v8 isEqual:v9];
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  BOOL v6 = [(SCLScheduleSettings *)self isEnabled];
  char v7 = [(SCLScheduleSettings *)self schedule];
  v8 = [v3 stringWithFormat:@"<%@ %p enabled=%u; schedule=%@>", v5, self, v6, v7];;

  return v8;
}

- (id)debugDescription
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  BOOL v6 = [(SCLScheduleSettings *)self isEnabled];
  char v7 = [(SCLScheduleSettings *)self schedule];
  v8 = [v7 debugDescription];
  objc_super v9 = [v3 stringWithFormat:@"<%@ %p enabled=%u; schedule=%@>", v5, self, v6, v8];;

  return v9;
}

- (id)startTimeForDay:(int64_t)a3
{
  id v4 = [(SCLScheduleSettings *)self schedule];
  id v5 = [v4 startTimeForDay:a3];

  return v5;
}

- (id)endTimeForDay:(int64_t)a3
{
  id v4 = [(SCLScheduleSettings *)self schedule];
  id v5 = [v4 endTimeForDay:a3];

  return v5;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (SCLSchedule)schedule
{
  return self->_schedule;
}

- (unint64_t)version
{
  return self->_version;
}

- (void).cxx_destruct
{
}

- (BOOL)isActiveAtDate:(id)a3 calendar:(id)a4
{
  id v6 = a3;
  char v7 = [(SCLScheduleSettings *)self dateIntervalForActiveScheduleOnOrAfterDate:v6 calendar:a4];
  LOBYTE(self) = [v7 containsDate:v6];

  return (char)self;
}

- (id)dateIntervalForActiveScheduleOnOrAfterDate:(id)a3 calendar:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  id v9 = 0;
  if (v6 && v7)
  {
    if (![(SCLScheduleSettings *)self isEnabled]
      || ([(SCLScheduleSettings *)self schedule],
          v10 = objc_claimAutoreleasedReturnValue(),
          char v11 = [v10 isEmpty],
          v10,
          (v11 & 1) != 0))
    {
      id v9 = 0;
      goto LABEL_21;
    }
    v12 = [(SCLScheduleSettings *)self schedule];
    v13 = [v12 recurrences];

    v14 = [(SCLScheduleSettings *)self schedule];
    uint64_t v15 = [v14 scheduledDays];

    if (v15 == 127)
    {
      uint64_t v70 = 0;
      v71 = &v70;
      uint64_t v72 = 0x2020000000;
      LOBYTE(v73) = 0;
      v16 = [v13 firstObject];
      v17 = [v13 lastObject];
      if ([v16 intersectsRecurrence:v17])
      {
        char v18 = 1;
      }
      else
      {
        v19 = [v13 lastObject];
        v20 = [v13 firstObject];
        char v18 = [v19 isContiguousWithRecurrence:v20];
      }
      LOBYTE(v73) = v18;
      if (*((unsigned char *)v71 + 24))
      {
        v76[0] = MEMORY[0x263EF8330];
        v76[1] = 3221225472;
        v76[2] = __85__SCLScheduleSettings_Extended__dateIntervalForActiveScheduleOnOrAfterDate_calendar___block_invoke;
        v76[3] = &unk_2648AC9F8;
        id v77 = v13;
        v78 = &v70;
        [v77 enumerateObjectsUsingBlock:v76];

        if (*((unsigned char *)v71 + 24))
        {
          id v21 = objc_alloc(MEMORY[0x263F08798]);
          v22 = [MEMORY[0x263EFF910] distantPast];
          v23 = [MEMORY[0x263EFF910] distantFuture];
          id v9 = (id)[v21 initWithStartDate:v22 endDate:v23];

          _Block_object_dispose(&v70, 8);
LABEL_20:

          goto LABEL_21;
        }
      }
      _Block_object_dispose(&v70, 8);
    }
    uint64_t v70 = 0;
    v71 = &v70;
    uint64_t v72 = 0x3032000000;
    v73 = __Block_byref_object_copy__2;
    v74 = __Block_byref_object_dispose__2;
    id v75 = 0;
    uint64_t v66 = 0;
    v67 = &v66;
    uint64_t v68 = 0x2020000000;
    uint64_t v69 = 0x7FFFFFFFFFFFFFFFLL;
    v61[0] = MEMORY[0x263EF8330];
    v61[1] = 3221225472;
    v61[2] = __85__SCLScheduleSettings_Extended__dateIntervalForActiveScheduleOnOrAfterDate_calendar___block_invoke_70;
    v61[3] = &unk_2648ACA20;
    id v62 = v6;
    id v24 = v8;
    id v63 = v24;
    v64 = &v70;
    v65 = &v66;
    [v13 enumerateObjectsUsingBlock:v61];
    if (v67[3] != 0x7FFFFFFFFFFFFFFFLL && (unint64_t)[v13 count] >= 2)
    {
      uint64_t v25 = [v13 objectAtIndexedSubscript:v67[3]];
      v26 = [MEMORY[0x263EFF980] array];
      uint64_t v27 = v67[3];
      uint64_t v28 = [v13 count];
      v29 = objc_msgSend(v13, "subarrayWithRange:", v27, v28 - v67[3]);
      [v26 addObjectsFromArray:v29];

      v30 = objc_msgSend(v13, "subarrayWithRange:", 0, v67[3]);
      [v26 addObjectsFromArray:v30];

      id v31 = objc_alloc_init(MEMORY[0x263EFF980]);
      [v31 addObject:v25];
      v54 = (void *)v25;
      uint64_t v32 = [v26 count];
      v33 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", 1, v32 - 1);
      v58[0] = MEMORY[0x263EF8330];
      v58[1] = 3221225472;
      v58[2] = __85__SCLScheduleSettings_Extended__dateIntervalForActiveScheduleOnOrAfterDate_calendar___block_invoke_2;
      v58[3] = &unk_2648ACA48;
      id v34 = v26;
      id v59 = v34;
      id v35 = v31;
      id v60 = v35;
      [v34 enumerateObjectsAtIndexes:v33 options:0 usingBlock:v58];

      [v34 removeObjectAtIndex:0];
      [v34 addObject:v54];
      uint64_t v36 = [v34 count];
      v37 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", 0, v36 - 1);
      v55[0] = MEMORY[0x263EF8330];
      v55[1] = 3221225472;
      v55[2] = __85__SCLScheduleSettings_Extended__dateIntervalForActiveScheduleOnOrAfterDate_calendar___block_invoke_3;
      v55[3] = &unk_2648ACA48;
      id v38 = v34;
      id v56 = v38;
      id v39 = v35;
      id v57 = v39;
      [v38 enumerateObjectsAtIndexes:v37 options:2 usingBlock:v55];

      if ((unint64_t)[v39 count] >= 2)
      {
        v53 = [v39 firstObject];
        v40 = [v53 timeInterval];
        v41 = [v40 startTime];
        v42 = [v41 dateComponents];

        objc_msgSend(v42, "setWeekday:", objc_msgSend(v53, "day"));
        v52 = v42;
        v43 = [v39 lastObject];
        v44 = [v43 timeInterval];
        v45 = [v44 endTime];
        v46 = [v45 dateComponents];

        objc_msgSend(v46, "setWeekday:", objc_msgSend(v43, "day"));
        v47 = (void *)MEMORY[0x263F08798];
        v48 = [(id)v71[5] startDate];
        uint64_t v49 = objc_msgSend(v47, "SCL_dateIntervalForActiveScheduleOnOrAfterDate:calendar:startComponents:endComponents:", v48, v24, v52, v46);
        v50 = (void *)v71[5];
        v71[5] = v49;
      }
    }
    id v9 = (id)v71[5];

    _Block_object_dispose(&v66, 8);
    _Block_object_dispose(&v70, 8);

    goto LABEL_20;
  }
LABEL_21:

  return v9;
}

void __85__SCLScheduleSettings_Extended__dateIntervalForActiveScheduleOnOrAfterDate_calendar___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if (a3)
  {
    id v10 = v7;
    v8 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3 - 1];
    if ([v10 intersectsRecurrence:v8]) {
      char v9 = 1;
    }
    else {
      char v9 = [v8 isContiguousWithRecurrence:v10];
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) &= v9;
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
      *a4 = 1;
    }

    id v7 = v10;
  }
}

void __85__SCLScheduleSettings_Extended__dateIntervalForActiveScheduleOnOrAfterDate_calendar___block_invoke_70(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id obj = [a2 dateIntervalForActiveScheduleOnOrAfterDate:a1[4] calendar:a1[5]];
  if ([obj containsDate:a1[4]])
  {
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), obj);
    *(void *)(*(void *)(a1[7] + 8) + 24) = a3;
    *a4 = 1;
  }
  id v7 = [obj startDate];
  v8 = [v7 earlierDate:a1[4]];
  char v9 = (void *)a1[4];

  if (v8 == v9)
  {
    id v10 = obj;
    uint64_t v11 = *(void *)(a1[6] + 8);
    uint64_t v13 = *(void *)(v11 + 40);
    v12 = (id *)(v11 + 40);
    if (v13)
    {
      v14 = [obj startDate];
      uint64_t v15 = [*(id *)(*(void *)(a1[6] + 8) + 40) startDate];
      uint64_t v16 = [v14 compare:v15];

      if (v16 != -1) {
        goto LABEL_8;
      }
      v12 = (id *)(*(void *)(a1[6] + 8) + 40);
      id v10 = obj;
    }
    objc_storeStrong(v12, v10);
    *(void *)(*(void *)(a1[7] + 8) + 24) = a3;
  }
LABEL_8:
}

void __85__SCLScheduleSettings_Extended__dateIntervalForActiveScheduleOnOrAfterDate_calendar___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  id v7 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3 - 1];
  if (([v7 isContiguousWithRecurrence:v8] & 1) != 0
    || [v7 intersectsRecurrence:v8])
  {
    [*(id *)(a1 + 40) addObject:v8];
  }
  else
  {
    *a4 = 1;
  }
}

void __85__SCLScheduleSettings_Extended__dateIntervalForActiveScheduleOnOrAfterDate_calendar___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  id v7 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3 + 1];
  if (([v8 isContiguousWithRecurrence:v7] & 1) != 0
    || [v8 intersectsRecurrence:v7])
  {
    [*(id *)(a1 + 40) insertObject:v8 atIndex:0];
  }
  else
  {
    *a4 = 1;
  }
}

- (id)recurrenceForActiveScheduleOnOrAfterDate:(id)a3 calendar:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  char v9 = 0;
  if (v6 && v7)
  {
    if ([(SCLScheduleSettings *)self isEnabled]
      && ([(SCLScheduleSettings *)self schedule],
          id v10 = objc_claimAutoreleasedReturnValue(),
          char v11 = [v10 isEmpty],
          v10,
          (v11 & 1) == 0))
    {
      v12 = [(SCLScheduleSettings *)self schedule];
      uint64_t v13 = [v12 recurrences];

      v27[0] = 0;
      v27[1] = v27;
      v27[2] = 0x3032000000;
      v27[3] = __Block_byref_object_copy__2;
      v27[4] = __Block_byref_object_dispose__2;
      id v28 = 0;
      uint64_t v23 = 0;
      id v24 = &v23;
      uint64_t v25 = 0x2020000000;
      uint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v15 = MEMORY[0x263EF8330];
      uint64_t v16 = 3221225472;
      v17 = __83__SCLScheduleSettings_Extended__recurrenceForActiveScheduleOnOrAfterDate_calendar___block_invoke;
      char v18 = &unk_2648ACA20;
      id v19 = v6;
      id v20 = v8;
      id v21 = v27;
      v22 = &v23;
      [v13 enumerateObjectsUsingBlock:&v15];
      if (v24[3] == 0x7FFFFFFFFFFFFFFFLL)
      {
        char v9 = 0;
      }
      else
      {
        char v9 = objc_msgSend(v13, "objectAtIndexedSubscript:", v15, v16, v17, v18, v19);
      }

      _Block_object_dispose(&v23, 8);
      _Block_object_dispose(v27, 8);
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

void __83__SCLScheduleSettings_Extended__recurrenceForActiveScheduleOnOrAfterDate_calendar___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id obj = [a2 dateIntervalForActiveScheduleOnOrAfterDate:a1[4] calendar:a1[5]];
  if ([obj containsDate:a1[4]])
  {
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), obj);
    *(void *)(*(void *)(a1[7] + 8) + 24) = a3;
    *a4 = 1;
  }
  id v7 = [obj startDate];
  id v8 = [v7 earlierDate:a1[4]];
  char v9 = (void *)a1[4];

  if (v8 == v9)
  {
    id v10 = obj;
    uint64_t v11 = *(void *)(a1[6] + 8);
    uint64_t v13 = *(void *)(v11 + 40);
    v12 = (id *)(v11 + 40);
    if (v13)
    {
      v14 = [obj startDate];
      uint64_t v15 = [*(id *)(*(void *)(a1[6] + 8) + 40) startDate];
      uint64_t v16 = [v14 compare:v15];

      if (v16 != -1) {
        goto LABEL_8;
      }
      v12 = (id *)(*(void *)(a1[6] + 8) + 40);
      id v10 = obj;
    }
    objc_storeStrong(v12, v10);
    *(void *)(*(void *)(a1[7] + 8) + 24) = a3;
  }
LABEL_8:
}

@end