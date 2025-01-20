@interface REMDisplayDateUtils
+ (id)_displayDateWithDueDateComponents:(id)a3 alarms:(id)a4 hasAlarmDateComponents:(BOOL)a5 floatingDateComponents:(id)a6 nonFloatingDateComponents:(id)a7 displayDateUtils:(id)a8;
+ (id)displayDateWithDueDateComponents:(id)a3 alarms:(id)a4;
- (BOOL)hasAlarmDateComponents;
- (BOOL)isCacheSet;
- (NSDateComponents)dueDateComponents;
- (NSDateComponents)floatingDateComponents;
- (NSDateComponents)nonFloatingDateComponents;
- (REMDisplayDateUtilsDelegate)delegete;
- (id)displayDateWithDueDateComponents:(id)a3 alarms:(id)a4;
- (id)updateDisplayDateWithDueDateComponents:(id)a3 alarm:(id)a4 alarmsProviding:(id)a5;
- (void)setDelegete:(id)a3;
- (void)setDueDateComponents:(id)a3;
- (void)setFloatingDateComponents:(id)a3;
- (void)setHasAlarmDateComponents:(BOOL)a3;
- (void)setIsCacheSet:(BOOL)a3;
- (void)setNonFloatingDateComponents:(id)a3;
@end

@implementation REMDisplayDateUtils

+ (id)_displayDateWithDueDateComponents:(id)a3 alarms:(id)a4 hasAlarmDateComponents:(BOOL)a5 floatingDateComponents:(id)a6 nonFloatingDateComponents:(id)a7 displayDateUtils:(id)a8
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v54 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  id v52 = a8;
  v53 = [MEMORY[0x1E4F1CA48] array];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id obj = v12;
  uint64_t v15 = [obj countByEnumeratingWithState:&v60 objects:v65 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v61;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v61 != v17) {
          objc_enumerationMutation(obj);
        }
        v19 = *(void **)(*((void *)&v60 + 1) + 8 * v18);
        if ([v19 isOriginal])
        {
          uint64_t v20 = objc_opt_class();
          v21 = [v19 trigger];
          v22 = REMDynamicCast(v20, (uint64_t)v21);

          uint64_t v23 = objc_opt_class();
          v24 = [v19 trigger];
          v25 = REMDynamicCast(v23, (uint64_t)v24);

          if (v22)
          {
            v26 = [v22 dateComponents];

            if (v26)
            {
              uint64_t v27 = [v22 dateComponents];
              goto LABEL_10;
            }
          }
          if (v25)
          {
            [v25 timeInterval];
            if (v54)
            {
              if (v29 != 0.0 && (objc_msgSend(v54, "rem_isAllDayDateComponents") & 1) == 0)
              {
                [v25 timeInterval];
                uint64_t v27 = objc_msgSend(v54, "rem_dateComponentsByAddingTimeInterval:");
LABEL_10:
                v28 = (void *)v27;
                [v53 addObject:v27];
              }
            }
          }
        }
        ++v18;
      }
      while (v16 != v18);
      uint64_t v30 = [obj countByEnumeratingWithState:&v60 objects:v65 count:16];
      uint64_t v16 = v30;
    }
    while (v30);
  }

  if (a5 || [v53 count])
  {
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v31 = v53;
    uint64_t v32 = [v31 countByEnumeratingWithState:&v56 objects:v64 count:16];
    if (!v32) {
      goto LABEL_39;
    }
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v57;
    while (1)
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v57 != v34) {
          objc_enumerationMutation(v31);
        }
        v36 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        v37 = [v36 timeZone];

        if (v37)
        {
          if (!v14)
          {
            v39 = 0;
            id v40 = v36;
            id v41 = v13;
LABEL_36:
            id v42 = v36;

            id v14 = v40;
            id v13 = v41;
            continue;
          }
          uint64_t v38 = objc_msgSend(v14, "rem_compare:", v36);
          v39 = v14;
          id v40 = v36;
          id v41 = v13;
        }
        else
        {
          if (!v13)
          {
            v39 = 0;
            id v40 = v14;
            id v41 = v36;
            goto LABEL_36;
          }
          uint64_t v38 = objc_msgSend(v13, "rem_compare:", v36);
          v39 = v13;
          id v40 = v14;
          id v41 = v36;
        }
        if (v38 == 1) {
          goto LABEL_36;
        }
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v56 objects:v64 count:16];
      if (!v33)
      {
LABEL_39:

        v43 = [[REMDisplayDate alloc] initWithFloatingDateComponents:v13 nonFloatingDateComponents:v14];
        uint64_t v44 = 1;
        v45 = v54;
        goto LABEL_40;
      }
    }
  }
  v45 = v54;
  v47 = [v54 timeZone];

  v48 = [REMDisplayDate alloc];
  if (v47)
  {
    id v49 = 0;
    id v50 = v54;
  }
  else
  {
    id v49 = v54;
    id v50 = 0;
  }
  v43 = [(REMDisplayDate *)v48 initWithFloatingDateComponents:v49 nonFloatingDateComponents:v50];
  uint64_t v44 = 0;
LABEL_40:
  if (v52)
  {
    [v52 setIsCacheSet:1];
    [v52 setDueDateComponents:v45];
    [v52 setFloatingDateComponents:v13];
    [v52 setNonFloatingDateComponents:v14];
    [v52 setHasAlarmDateComponents:v44];
  }

  return v43;
}

+ (id)displayDateWithDueDateComponents:(id)a3 alarms:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [(id)objc_opt_class() _displayDateWithDueDateComponents:v6 alarms:v5 hasAlarmDateComponents:0 floatingDateComponents:0 nonFloatingDateComponents:0 displayDateUtils:0];

  return v7;
}

- (id)displayDateWithDueDateComponents:(id)a3 alarms:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(id)objc_opt_class() _displayDateWithDueDateComponents:v7 alarms:v6 hasAlarmDateComponents:0 floatingDateComponents:0 nonFloatingDateComponents:0 displayDateUtils:self];

  return v8;
}

- (id)updateDisplayDateWithDueDateComponents:(id)a3 alarm:(id)a4 alarmsProviding:(id)a5
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(REMDisplayDateUtils *)self dueDateComponents];
  if (v11 == v8)
  {
    int v14 = 0;
  }
  else
  {
    id v12 = [(REMDisplayDateUtils *)self dueDateComponents];
    int v13 = [v12 isEqual:v8];

    int v14 = v13 ^ 1;
  }

  BOOL v15 = [(REMDisplayDateUtils *)self isCacheSet];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegete);
  uint64_t v17 = WeakRetained;
  if (!v15 || v14)
  {
    [WeakRetained invokeWithCache:0];

    v24 = [v10 alarms];
    uint64_t v23 = [(REMDisplayDateUtils *)self displayDateWithDueDateComponents:v8 alarms:v24];
  }
  else
  {
    [WeakRetained invokeWithCache:1];

    uint64_t v18 = objc_opt_class();
    v26[0] = v9;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
    BOOL v20 = [(REMDisplayDateUtils *)self hasAlarmDateComponents];
    v21 = [(REMDisplayDateUtils *)self floatingDateComponents];
    v22 = [(REMDisplayDateUtils *)self nonFloatingDateComponents];
    uint64_t v23 = [v18 _displayDateWithDueDateComponents:v8 alarms:v19 hasAlarmDateComponents:v20 floatingDateComponents:v21 nonFloatingDateComponents:v22 displayDateUtils:self];
  }

  return v23;
}

- (REMDisplayDateUtilsDelegate)delegete
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegete);

  return (REMDisplayDateUtilsDelegate *)WeakRetained;
}

- (void)setDelegete:(id)a3
{
}

- (BOOL)isCacheSet
{
  return self->_isCacheSet;
}

- (void)setIsCacheSet:(BOOL)a3
{
  self->_isCacheSet = a3;
}

- (BOOL)hasAlarmDateComponents
{
  return self->_hasAlarmDateComponents;
}

- (void)setHasAlarmDateComponents:(BOOL)a3
{
  self->_hasAlarmDateComponents = a3;
}

- (NSDateComponents)dueDateComponents
{
  return self->_dueDateComponents;
}

- (void)setDueDateComponents:(id)a3
{
}

- (NSDateComponents)floatingDateComponents
{
  return self->_floatingDateComponents;
}

- (void)setFloatingDateComponents:(id)a3
{
}

- (NSDateComponents)nonFloatingDateComponents
{
  return self->_nonFloatingDateComponents;
}

- (void)setNonFloatingDateComponents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonFloatingDateComponents, 0);
  objc_storeStrong((id *)&self->_floatingDateComponents, 0);
  objc_storeStrong((id *)&self->_dueDateComponents, 0);

  objc_destroyWeak((id *)&self->_delegete);
}

@end