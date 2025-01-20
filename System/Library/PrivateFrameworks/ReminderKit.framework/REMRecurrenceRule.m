@interface REMRecurrenceRule
+ (BOOL)supportsSecureCoding;
+ (NSString)cdEntityName;
+ (id)hourlyRecurrentDueDateAfter:(id)a3 dueDate:(id)a4 interval:(int64_t)a5;
+ (id)hourlyRecurrentDueDateBefore:(id)a3 dueDate:(id)a4 interval:(int64_t)a5;
+ (id)hourlyRecurrentDueDateToward:(id)a3 dueDate:(id)a4 interval:(int64_t)a5 adjustingStepsBy:(id)a6;
+ (id)iCalendarValueFromDate:(id)a3 isDateOnly:(BOOL)a4 isFloating:(BOOL)a5;
+ (id)iCalendarValueFromRecurrenceType:(int64_t)a3;
+ (id)iCalendarValueFromWeekday:(int64_t)a3;
+ (id)newObjectID;
+ (id)nextRecurrentDueDateAfter:(id)a3 dueDate:(id)a4 timeZone:(id)a5 allDay:(BOOL)a6 recurrenceRules:(id)a7;
+ (id)objectIDWithUUID:(id)a3;
+ (id)previousRecurrentDueDateBefore:(id)a3 dueDate:(id)a4 timeZone:(id)a5 allDay:(BOOL)a6 recurrenceRules:(id)a7;
+ (id)recurrenceGeneratorConfiguredForDueDate:(id)a3 timeZone:(id)a4 allDay:(BOOL)a5 recurrenceRule:(id)a6;
+ (int)_convertREMRecurrenceFrequencyToCalRecurrenceFrequency:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRecurrenceRule:(id)a3;
- (NSArray)daysOfTheMonth;
- (NSArray)daysOfTheWeek;
- (NSArray)daysOfTheYear;
- (NSArray)monthsOfTheYear;
- (NSArray)setPositions;
- (NSArray)weeksOfTheYear;
- (REMObjectID)accountID;
- (REMObjectID)objectID;
- (REMObjectID)reminderID;
- (REMRecurrenceEnd)recurrenceEnd;
- (REMRecurrenceRule)initWithCoder:(id)a3;
- (REMRecurrenceRule)initWithRecurrenceRule:(id)a3 objectID:(id)a4 accountID:(id)a5 reminderID:(id)a6;
- (REMRecurrenceRule)initWithRecurrenceRule:(id)a3 objectID:(id)a4 end:(id)a5;
- (id)debugDescription;
- (id)description;
- (id)iCalendarDescription;
- (id)initRecurrenceRuleWithObjectID:(id)a3 accountID:(id)a4 reminderID:(id)a5 frequency:(int64_t)a6 interval:(int64_t)a7 end:(id)a8;
- (id)initRecurrenceRuleWithObjectID:(id)a3 accountID:(id)a4 reminderID:(id)a5 frequency:(int64_t)a6 interval:(int64_t)a7 firstDayOfTheWeek:(int64_t)a8 daysOfTheWeek:(id)a9 daysOfTheMonth:(id)a10 monthsOfTheYear:(id)a11 weeksOfTheYear:(id)a12 daysOfTheYear:(id)a13 setPositions:(id)a14 end:(id)a15;
- (id)stringValueAsDateOnly:(BOOL)a3 isFloating:(BOOL)a4;
- (int64_t)firstDayOfTheWeek;
- (int64_t)frequency;
- (int64_t)interval;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMRecurrenceRule

- (id)initRecurrenceRuleWithObjectID:(id)a3 accountID:(id)a4 reminderID:(id)a5 frequency:(int64_t)a6 interval:(int64_t)a7 end:(id)a8
{
  return [(REMRecurrenceRule *)self initRecurrenceRuleWithObjectID:a3 accountID:a4 reminderID:a5 frequency:a6 interval:a7 firstDayOfTheWeek:0 daysOfTheWeek:0 daysOfTheMonth:0 monthsOfTheYear:0 weeksOfTheYear:0 daysOfTheYear:0 setPositions:0 end:a8];
}

- (id)initRecurrenceRuleWithObjectID:(id)a3 accountID:(id)a4 reminderID:(id)a5 frequency:(int64_t)a6 interval:(int64_t)a7 firstDayOfTheWeek:(int64_t)a8 daysOfTheWeek:(id)a9 daysOfTheMonth:(id)a10 monthsOfTheYear:(id)a11 weeksOfTheYear:(id)a12 daysOfTheYear:(id)a13 setPositions:(id)a14 end:(id)a15
{
  id v50 = a3;
  id v49 = a4;
  id obj = a5;
  id v48 = a5;
  id v18 = a9;
  id v19 = a10;
  id v20 = a11;
  id v21 = a12;
  id v22 = a13;
  id v23 = a14;
  id v24 = a15;
  v51.receiver = self;
  v51.super_class = (Class)REMRecurrenceRule;
  v25 = [(REMRecurrenceRule *)&v51 init];
  v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_objectID, a3);
    objc_storeStrong((id *)&v26->_accountID, a4);
    objc_storeStrong((id *)&v26->_reminderID, obj);
    uint64_t v27 = [v24 copy];
    recurrenceEnd = v26->_recurrenceEnd;
    v26->_recurrenceEnd = (REMRecurrenceEnd *)v27;

    int64_t v29 = a7;
    if (a7 <= 1) {
      int64_t v29 = 1;
    }
    v26->_frequency = a6;
    v26->_interval = v29;
    v26->_firstDayOfTheWeek = a8;
    uint64_t v30 = objc_msgSend(v18, "copy", obj);
    daysOfTheWeek = v26->_daysOfTheWeek;
    v26->_daysOfTheWeek = (NSArray *)v30;

    uint64_t v32 = [v19 copy];
    daysOfTheMonth = v26->_daysOfTheMonth;
    v26->_daysOfTheMonth = (NSArray *)v32;

    uint64_t v34 = [v20 copy];
    monthsOfTheYear = v26->_monthsOfTheYear;
    v26->_monthsOfTheYear = (NSArray *)v34;

    uint64_t v36 = [v21 copy];
    weeksOfTheYear = v26->_weeksOfTheYear;
    v26->_weeksOfTheYear = (NSArray *)v36;

    uint64_t v38 = [v22 copy];
    daysOfTheYear = v26->_daysOfTheYear;
    v26->_daysOfTheYear = (NSArray *)v38;

    uint64_t v40 = [v23 copy];
    setPositions = v26->_setPositions;
    v26->_setPositions = (NSArray *)v40;
  }
  return v26;
}

- (REMRecurrenceRule)initWithRecurrenceRule:(id)a3 objectID:(id)a4 accountID:(id)a5 reminderID:(id)a6
{
  id v24 = a6;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  uint64_t v23 = [v11 frequency];
  uint64_t v22 = [v11 interval];
  uint64_t v21 = [v11 firstDayOfTheWeek];
  v12 = [v11 daysOfTheWeek];
  id v20 = [v11 daysOfTheMonth];
  v13 = [v11 monthsOfTheYear];
  v14 = [v11 weeksOfTheYear];
  v15 = [v11 daysOfTheYear];
  v16 = [v11 setPositions];
  v17 = [v11 recurrenceEnd];

  id v18 = [(REMRecurrenceRule *)self initRecurrenceRuleWithObjectID:v10 accountID:v9 reminderID:v24 frequency:v23 interval:v22 firstDayOfTheWeek:v21 daysOfTheWeek:v12 daysOfTheMonth:v20 monthsOfTheYear:v13 weeksOfTheYear:v14 daysOfTheYear:v15 setPositions:v16 end:v17];
  return v18;
}

- (REMRecurrenceRule)initWithRecurrenceRule:(id)a3 objectID:(id)a4 end:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v21 = [v9 accountID];
  id v20 = [v9 reminderID];
  uint64_t v19 = [v9 frequency];
  uint64_t v18 = [v9 interval];
  uint64_t v17 = [v9 firstDayOfTheWeek];
  id v10 = [v9 daysOfTheWeek];
  id v11 = [v9 daysOfTheMonth];
  v12 = [v9 monthsOfTheYear];
  v13 = [v9 weeksOfTheYear];
  v14 = [v9 daysOfTheYear];
  v15 = [v9 setPositions];

  uint64_t v23 = [(REMRecurrenceRule *)self initRecurrenceRuleWithObjectID:v8 accountID:v21 reminderID:v20 frequency:v19 interval:v18 firstDayOfTheWeek:v17 daysOfTheWeek:v10 daysOfTheMonth:v11 monthsOfTheYear:v12 weeksOfTheYear:v13 daysOfTheYear:v14 setPositions:v15 end:v7];
  return v23;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMRecurrenceRule)initWithCoder:(id)a3
{
  id v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)REMRecurrenceRule;
  v5 = [(REMRecurrenceRule *)&v49 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"objectID"];
    objectID = v5->_objectID;
    v5->_objectID = (REMObjectID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountID"];
    accountID = v5->_accountID;
    v5->_accountID = (REMObjectID *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reminderID"];
    reminderID = v5->_reminderID;
    v5->_reminderID = (REMObjectID *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recurrenceEnd"];
    recurrenceEnd = v5->_recurrenceEnd;
    v5->_recurrenceEnd = (REMRecurrenceEnd *)v12;

    unint64_t v14 = [v4 decodeIntegerForKey:@"frequency"];
    if (v14 >= 5)
    {
      v15 = os_log_create("com.apple.reminderkit", "default");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
        -[REMRecurrenceRule initWithCoder:](v14, v15);
      }

      unint64_t v14 = 0;
    }
    v5->_frequency = v14;
    uint64_t v16 = [v4 decodeIntegerForKey:@"interval"];
    if (v16 <= 1) {
      uint64_t v17 = 1;
    }
    else {
      uint64_t v17 = v16;
    }
    v5->_interval = v17;
    v5->_firstDayOfTheWeek = [v4 decodeIntegerForKey:@"firstDayOfTheWeek"];
    uint64_t v18 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v19 = objc_opt_class();
    id v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"daysOfTheWeek"];
    daysOfTheWeek = v5->_daysOfTheWeek;
    v5->_daysOfTheWeek = (NSArray *)v21;

    uint64_t v23 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v24 = objc_opt_class();
    v25 = objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
    uint64_t v26 = [v4 decodeObjectOfClasses:v25 forKey:@"daysOfTheMonth"];
    daysOfTheMonth = v5->_daysOfTheMonth;
    v5->_daysOfTheMonth = (NSArray *)v26;

    v28 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v29 = objc_opt_class();
    uint64_t v30 = objc_msgSend(v28, "setWithObjects:", v29, objc_opt_class(), 0);
    uint64_t v31 = [v4 decodeObjectOfClasses:v30 forKey:@"daysOfTheYear"];
    daysOfTheYear = v5->_daysOfTheYear;
    v5->_daysOfTheYear = (NSArray *)v31;

    v33 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v34 = objc_opt_class();
    v35 = objc_msgSend(v33, "setWithObjects:", v34, objc_opt_class(), 0);
    uint64_t v36 = [v4 decodeObjectOfClasses:v35 forKey:@"weeksOfTheYear"];
    weeksOfTheYear = v5->_weeksOfTheYear;
    v5->_weeksOfTheYear = (NSArray *)v36;

    uint64_t v38 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v39 = objc_opt_class();
    uint64_t v40 = objc_msgSend(v38, "setWithObjects:", v39, objc_opt_class(), 0);
    uint64_t v41 = [v4 decodeObjectOfClasses:v40 forKey:@"monthsOfTheYear"];
    monthsOfTheYear = v5->_monthsOfTheYear;
    v5->_monthsOfTheYear = (NSArray *)v41;

    v43 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v44 = objc_opt_class();
    v45 = objc_msgSend(v43, "setWithObjects:", v44, objc_opt_class(), 0);
    uint64_t v46 = [v4 decodeObjectOfClasses:v45 forKey:@"setPositions"];
    setPositions = v5->_setPositions;
    v5->_setPositions = (NSArray *)v46;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(REMRecurrenceRule *)self objectID];
  [v4 encodeObject:v5 forKey:@"objectID"];

  uint64_t v6 = [(REMRecurrenceRule *)self accountID];
  [v4 encodeObject:v6 forKey:@"accountID"];

  id v7 = [(REMRecurrenceRule *)self reminderID];
  [v4 encodeObject:v7 forKey:@"reminderID"];

  uint64_t v8 = [(REMRecurrenceRule *)self recurrenceEnd];
  [v4 encodeObject:v8 forKey:@"recurrenceEnd"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[REMRecurrenceRule frequency](self, "frequency"), @"frequency");
  objc_msgSend(v4, "encodeInteger:forKey:", -[REMRecurrenceRule interval](self, "interval"), @"interval");
  objc_msgSend(v4, "encodeInteger:forKey:", -[REMRecurrenceRule firstDayOfTheWeek](self, "firstDayOfTheWeek"), @"firstDayOfTheWeek");
  id v9 = [(REMRecurrenceRule *)self daysOfTheWeek];
  [v4 encodeObject:v9 forKey:@"daysOfTheWeek"];

  uint64_t v10 = [(REMRecurrenceRule *)self daysOfTheMonth];
  [v4 encodeObject:v10 forKey:@"daysOfTheMonth"];

  id v11 = [(REMRecurrenceRule *)self daysOfTheYear];
  [v4 encodeObject:v11 forKey:@"daysOfTheYear"];

  uint64_t v12 = [(REMRecurrenceRule *)self weeksOfTheYear];
  [v4 encodeObject:v12 forKey:@"weeksOfTheYear"];

  v13 = [(REMRecurrenceRule *)self monthsOfTheYear];
  [v4 encodeObject:v13 forKey:@"monthsOfTheYear"];

  id v14 = [(REMRecurrenceRule *)self setPositions];
  [v4 encodeObject:v14 forKey:@"setPositions"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = REMDynamicCast(v5, (uint64_t)v4);

  if (v6) {
    BOOL v7 = [(REMRecurrenceRule *)self isEqualToRecurrenceRule:v6];
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isEqualToRecurrenceRule:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(REMRecurrenceRule *)self frequency];
  if (v5 == [v4 frequency])
  {
    int64_t v6 = [(REMRecurrenceRule *)self interval];
    if (v6 == [v4 interval])
    {
      int64_t v7 = [(REMRecurrenceRule *)self firstDayOfTheWeek];
      if (v7 == [v4 firstDayOfTheWeek])
      {
        uint64_t v8 = [(REMRecurrenceRule *)self objectID];
        id v9 = [v4 objectID];
        if (v8 != v9)
        {
          uint64_t v10 = [(REMRecurrenceRule *)self objectID];
          id v11 = [v4 objectID];
          if (![v10 isEqual:v11])
          {
            char v12 = 0;
            goto LABEL_57;
          }
          v76 = v11;
          v77 = v10;
        }
        id v14 = [(REMRecurrenceRule *)self accountID];
        v15 = [v4 accountID];
        if (v14 != v15)
        {
          uint64_t v16 = [(REMRecurrenceRule *)self accountID];
          uint64_t v17 = [v4 accountID];
          if (![v16 isEqual:v17])
          {
            char v12 = 0;
LABEL_55:

LABEL_56:
            id v11 = v76;
            uint64_t v10 = v77;
            if (v8 == v9)
            {
LABEL_58:

              goto LABEL_8;
            }
LABEL_57:

            goto LABEL_58;
          }
          v74 = v17;
          v75 = v16;
        }
        uint64_t v18 = [(REMRecurrenceRule *)self reminderID];
        uint64_t v19 = [v4 reminderID];
        if (v18 != v19)
        {
          id v20 = [(REMRecurrenceRule *)self reminderID];
          v70 = [v4 reminderID];
          v71 = v20;
          if (![v20 isEqual:v70])
          {
            char v12 = 0;
LABEL_53:

LABEL_54:
            uint64_t v17 = v74;
            uint64_t v16 = v75;
            if (v14 == v15) {
              goto LABEL_56;
            }
            goto LABEL_55;
          }
        }
        uint64_t v21 = [(REMRecurrenceRule *)self recurrenceEnd];
        [v4 recurrenceEnd];
        uint64_t v73 = v72 = v21;
        if (v21 != (void *)v73)
        {
          uint64_t v22 = [(REMRecurrenceRule *)self recurrenceEnd];
          v68 = [v4 recurrenceEnd];
          v69 = v22;
          if (!objc_msgSend(v22, "isEqual:"))
          {
            char v12 = 0;
            uint64_t v23 = (void *)v73;
LABEL_51:

LABEL_52:
            if (v18 == v19) {
              goto LABEL_54;
            }
            goto LABEL_53;
          }
        }
        uint64_t v24 = [(REMRecurrenceRule *)self monthsOfTheYear];
        uint64_t v67 = [v4 monthsOfTheYear];
        if (v24 != v67)
        {
          v25 = [(REMRecurrenceRule *)self monthsOfTheYear];
          v64 = [v4 monthsOfTheYear];
          v65 = v25;
          if (!objc_msgSend(v25, "isEqual:"))
          {
            char v12 = 0;
            uint64_t v26 = (void *)v24;
            uint64_t v27 = (void *)v67;
LABEL_49:

LABEL_50:
            uint64_t v21 = v72;
            uint64_t v23 = (void *)v73;
            if (v72 == (void *)v73) {
              goto LABEL_52;
            }
            goto LABEL_51;
          }
        }
        uint64_t v28 = [(REMRecurrenceRule *)self daysOfTheMonth];
        uint64_t v62 = [v4 daysOfTheMonth];
        v63 = (void *)v28;
        v66 = v18;
        if (v28 != v62)
        {
          uint64_t v29 = [(REMRecurrenceRule *)self daysOfTheMonth];
          v58 = [v4 daysOfTheMonth];
          v59 = v29;
          if (!objc_msgSend(v29, "isEqual:"))
          {
            uint64_t v26 = (void *)v24;
            char v12 = 0;
            uint64_t v31 = (void *)v62;
            uint64_t v30 = v63;
LABEL_47:

LABEL_48:
            uint64_t v18 = v66;
            uint64_t v27 = (void *)v67;
            if (v26 == (void *)v67) {
              goto LABEL_50;
            }
            goto LABEL_49;
          }
        }
        uint64_t v32 = [(REMRecurrenceRule *)self daysOfTheYear];
        uint64_t v60 = [v4 daysOfTheYear];
        v61 = (void *)v32;
        if (v32 != v60)
        {
          v33 = [(REMRecurrenceRule *)self daysOfTheYear];
          v53 = [v4 daysOfTheYear];
          v54 = v33;
          if (!objc_msgSend(v33, "isEqual:"))
          {
            uint64_t v26 = (void *)v24;
            char v12 = 0;
            v35 = (void *)v60;
            uint64_t v34 = v61;
LABEL_45:

LABEL_46:
            uint64_t v31 = (void *)v62;
            uint64_t v30 = v63;
            if (v63 == (void *)v62) {
              goto LABEL_48;
            }
            goto LABEL_47;
          }
        }
        uint64_t v36 = [(REMRecurrenceRule *)self weeksOfTheYear];
        uint64_t v56 = [v4 weeksOfTheYear];
        v57 = (void *)v36;
        v55 = (void *)v24;
        if (v36 != v56)
        {
          v37 = [(REMRecurrenceRule *)self weeksOfTheYear];
          objc_super v51 = [v4 weeksOfTheYear];
          v52 = v37;
          if (!objc_msgSend(v37, "isEqual:"))
          {
            char v12 = 0;
            uint64_t v38 = (void *)v56;
            goto LABEL_42;
          }
        }
        uint64_t v39 = [(REMRecurrenceRule *)self daysOfTheWeek];
        uint64_t v50 = [v4 daysOfTheWeek];
        if (v39 != (void *)v50)
        {
          uint64_t v46 = v39;
          uint64_t v40 = [(REMRecurrenceRule *)self daysOfTheWeek];
          id v48 = [v4 daysOfTheWeek];
          objc_super v49 = v40;
          if (!objc_msgSend(v40, "isEqual:"))
          {
            char v12 = 0;
            v43 = (void *)v50;
            uint64_t v39 = v46;
            goto LABEL_40;
          }
          uint64_t v39 = v46;
        }
        uint64_t v41 = [(REMRecurrenceRule *)self setPositions];
        uint64_t v42 = [v4 setPositions];
        if (v41 == (void *)v42)
        {

          char v12 = 1;
        }
        else
        {
          v47 = (void *)v42;
          v45 = [(REMRecurrenceRule *)self setPositions];
          uint64_t v44 = [v4 setPositions];
          char v12 = [v45 isEqual:v44];
        }
        v43 = (void *)v50;
        if (v39 == (void *)v50)
        {
LABEL_41:

          uint64_t v38 = (void *)v56;
          if (v57 == (void *)v56)
          {
            uint64_t v26 = v55;
LABEL_44:

            v35 = (void *)v60;
            uint64_t v34 = v61;
            if (v61 == (void *)v60) {
              goto LABEL_46;
            }
            goto LABEL_45;
          }
LABEL_42:
          uint64_t v26 = v55;

          goto LABEL_44;
        }
LABEL_40:

        goto LABEL_41;
      }
    }
  }
  char v12 = 0;
LABEL_8:

  return v12;
}

- (unint64_t)hash
{
  v2 = [(REMRecurrenceRule *)self objectID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int64_t v5 = [(REMRecurrenceRule *)self objectID];
  int64_t v6 = [(REMRecurrenceRule *)self reminderID];
  int64_t v7 = [(REMRecurrenceRule *)self accountID];
  uint64_t v8 = [v3 stringWithFormat:@"<%@: %p objectID: %@, reminderID: %@, accountID: %@>", v4, self, v5, v6, v7];

  return v8;
}

- (id)debugDescription
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int64_t v5 = [(REMRecurrenceRule *)self objectID];
  int64_t v6 = [(REMRecurrenceRule *)self reminderID];
  int64_t v7 = [(REMRecurrenceRule *)self accountID];
  uint64_t v8 = [(REMRecurrenceRule *)self iCalendarDescription];
  id v9 = [v3 stringWithFormat:@"<%@: %p objectID: %@, reminderID: %@, accountID: %@> %@", v4, self, v5, v6, v7, v8];

  return v9;
}

- (id)iCalendarDescription
{
  v2 = NSString;
  unint64_t v3 = [(REMRecurrenceRule *)self stringValueAsDateOnly:0 isFloating:0];
  uint64_t v4 = [v2 stringWithFormat:@"RRULE:%@", v3];

  return v4;
}

- (id)stringValueAsDateOnly:(BOOL)a3 isFloating:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  int64_t v7 = [MEMORY[0x1E4F28E78] string];
  uint64_t v8 = +[REMRecurrenceRule iCalendarValueFromRecurrenceType:[(REMRecurrenceRule *)self frequency]];
  [v7 appendFormat:@"FREQ=%@", v8];

  if ([(REMRecurrenceRule *)self interval] != 1) {
    objc_msgSend(v7, "appendFormat:", @";INTERVAL=%lu", -[REMRecurrenceRule interval](self, "interval"));
  }
  id v9 = [(REMRecurrenceRule *)self recurrenceEnd];

  if (v9)
  {
    uint64_t v10 = [(REMRecurrenceRule *)self recurrenceEnd];
    id v11 = [v10 endDate];

    char v12 = [(REMRecurrenceRule *)self recurrenceEnd];
    if (v11)
    {
      v13 = [v12 endDate];
      id v14 = +[REMRecurrenceRule iCalendarValueFromDate:v13 isDateOnly:v5 isFloating:v4];
      [v7 appendFormat:@";UNTIL=%@", v14];
    }
    else
    {
      objc_msgSend(v7, "appendFormat:", @";COUNT=%lu", objc_msgSend(v12, "occurrenceCount"));
    }
  }
  v15 = [(REMRecurrenceRule *)self monthsOfTheYear];
  uint64_t v16 = [v15 count];

  if (v16)
  {
    uint64_t v17 = [(REMRecurrenceRule *)self monthsOfTheYear];
    uint64_t v18 = [v17 objectAtIndex:0];
    [v7 appendFormat:@";BYMONTH=%@", v18];

    if (v16 != 1)
    {
      for (uint64_t i = 1; i != v16; ++i)
      {
        id v20 = [(REMRecurrenceRule *)self monthsOfTheYear];
        uint64_t v21 = [v20 objectAtIndex:i];
        [v7 appendFormat:@",%@", v21];
      }
    }
  }
  uint64_t v22 = [(REMRecurrenceRule *)self daysOfTheMonth];
  uint64_t v23 = [v22 count];

  if (v23)
  {
    uint64_t v24 = [(REMRecurrenceRule *)self daysOfTheMonth];
    v25 = [v24 objectAtIndex:0];
    [v7 appendFormat:@";BYMONTHDAY=%@", v25];

    if (v23 != 1)
    {
      for (uint64_t j = 1; j != v23; ++j)
      {
        uint64_t v27 = [(REMRecurrenceRule *)self daysOfTheMonth];
        uint64_t v28 = [v27 objectAtIndex:j];
        [v7 appendFormat:@",%@", v28];
      }
    }
  }
  uint64_t v29 = [(REMRecurrenceRule *)self daysOfTheYear];
  uint64_t v30 = [v29 count];

  if (v30)
  {
    uint64_t v31 = [(REMRecurrenceRule *)self daysOfTheYear];
    uint64_t v32 = [v31 objectAtIndex:0];
    [v7 appendFormat:@";BYYEARDAY=%@", v32];

    if (v30 != 1)
    {
      for (uint64_t k = 1; k != v30; ++k)
      {
        uint64_t v34 = [(REMRecurrenceRule *)self daysOfTheYear];
        v35 = [v34 objectAtIndex:k];
        [v7 appendFormat:@",%@", v35];
      }
    }
  }
  uint64_t v36 = [(REMRecurrenceRule *)self weeksOfTheYear];
  uint64_t v37 = [v36 count];

  if (v37)
  {
    uint64_t v38 = [(REMRecurrenceRule *)self weeksOfTheYear];
    uint64_t v39 = [v38 objectAtIndex:0];
    [v7 appendFormat:@";BYWEEKNO=%@", v39];

    if (v37 != 1)
    {
      for (uint64_t m = 1; m != v37; ++m)
      {
        uint64_t v41 = [(REMRecurrenceRule *)self weeksOfTheYear];
        uint64_t v42 = [v41 objectAtIndex:m];
        [v7 appendFormat:@",%@", v42];
      }
    }
  }
  v43 = [(REMRecurrenceRule *)self daysOfTheWeek];
  uint64_t v44 = [v43 count];

  if (v44)
  {
    v45 = [(REMRecurrenceRule *)self daysOfTheWeek];
    uint64_t v46 = [v45 objectAtIndex:0];

    v47 = [v46 iCalendarDescription];
    [v7 appendFormat:@";BYDAY=%@", v47];

    if (v44 != 1)
    {
      for (uint64_t n = 1; n != v44; ++n)
      {
        objc_super v49 = [(REMRecurrenceRule *)self daysOfTheWeek];
        uint64_t v50 = [v49 objectAtIndex:n];

        objc_super v51 = [v50 iCalendarDescription];
        [v7 appendFormat:@",%@", v51];
      }
    }
  }
  v52 = [(REMRecurrenceRule *)self setPositions];
  uint64_t v53 = [v52 count];

  if (v53)
  {
    v54 = [(REMRecurrenceRule *)self setPositions];
    v55 = [v54 objectAtIndex:0];
    [v7 appendFormat:@";BYSETPOS=%@", v55];

    if (v53 != 1)
    {
      for (iuint64_t i = 1; ii != v53; ++ii)
      {
        v57 = [(REMRecurrenceRule *)self setPositions];
        v58 = [v57 objectAtIndex:ii];
        [v7 appendFormat:@",%@", v58];
      }
    }
  }
  if ([(REMRecurrenceRule *)self firstDayOfTheWeek])
  {
    v59 = +[REMRecurrenceRule iCalendarValueFromWeekday:[(REMRecurrenceRule *)self firstDayOfTheWeek]];
    [v7 appendFormat:@";WKST=%@", v59];
  }
  uint64_t v60 = [NSString stringWithString:v7];

  return v60;
}

+ (id)iCalendarValueFromRecurrenceType:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    return &stru_1F1339A18;
  }
  else {
    return off_1E61DDAE8[a3];
  }
}

+ (id)iCalendarValueFromDate:(id)a3 isDateOnly:(BOOL)a4 isFloating:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  int64_t v7 = (objc_class *)MEMORY[0x1E4F28C10];
  id v8 = a3;
  id v9 = objc_alloc_init(v7);
  [v9 setFormatterBehavior:1040];
  uint64_t v10 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"GMT"];
  [v9 setTimeZone:v10];

  id v11 = @"yyyyMMdd'T'HHmmss'Z'";
  if (v5) {
    id v11 = @"yyyyMMdd'T'HHmmss";
  }
  if (v6) {
    char v12 = @"yyyyMMdd";
  }
  else {
    char v12 = v11;
  }
  [v9 setDateFormat:v12];
  v13 = [v9 stringFromDate:v8];

  return v13;
}

+ (id)iCalendarValueFromWeekday:(int64_t)a3
{
  if (iCalendarValueFromWeekday__onceToken != -1) {
    dispatch_once(&iCalendarValueFromWeekday__onceToken, &__block_literal_global_28);
  }
  if (a3 > 6)
  {
    BOOL v4 = &stru_1F1339A18;
  }
  else
  {
    BOOL v4 = [(id)iCalendarValueFromWeekday____iCalendarValuesForWeekday objectAtIndexedSubscript:a3];
  }

  return v4;
}

void __47__REMRecurrenceRule_iCalendarValueFromWeekday___block_invoke()
{
  v0 = (void *)iCalendarValueFromWeekday____iCalendarValuesForWeekday;
  iCalendarValueFromWeekday____iCalendarValuesForWeekday = (uint64_t)&unk_1F136C1D0;
}

+ (id)nextRecurrentDueDateAfter:(id)a3 dueDate:(id)a4 timeZone:(id)a5 allDay:(BOOL)a6 recurrenceRules:(id)a7
{
  uint64_t v8 = a6;
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v48 = objc_opt_new();
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id obj = v15;
  uint64_t v16 = [obj countByEnumeratingWithState:&v54 objects:v59 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v55;
    unsigned int v44 = v8;
    id v43 = a1;
    uint64_t v45 = *(void *)v55;
    do
    {
      uint64_t v19 = 0;
      uint64_t v46 = v17;
      do
      {
        if (*(void *)v55 != v18) {
          objc_enumerationMutation(obj);
        }
        id v20 = *(void **)(*((void *)&v54 + 1) + 8 * v19);
        if ([v20 frequency] == 4)
        {
          uint64_t v21 = objc_msgSend(a1, "hourlyRecurrentDueDateAfter:dueDate:interval:", v12, v13, objc_msgSend(v20, "interval"));
          [v48 addObject:v21];
        }
        else
        {
          context = (void *)MEMORY[0x1BA9DB950]();
          uint64_t v22 = [a1 recurrenceGeneratorConfiguredForDueDate:v13 timeZone:v14 allDay:v8 recurrenceRule:v20];
          uint64_t v23 = [v20 recurrenceEnd];
          uint64_t v24 = [v23 occurrenceCount];

          if (v24)
          {
            v25 = [v20 recurrenceEnd];
            uint64_t v26 = [v25 occurrenceCount];

            if (v26 >= 2) {
              uint64_t v27 = 2;
            }
            else {
              uint64_t v27 = v26;
            }
          }
          else
          {
            uint64_t v27 = 2;
          }
          uint64_t v28 = [MEMORY[0x1E4F1C9C8] distantFuture];
          uint64_t v29 = (void *)[v22 copyOccurrenceDatesWithInitialDate:v13 allDay:v8 rangeStart:v12 rangeEnd:v28 timeZone:v14 limit:v27];

          long long v52 = 0u;
          long long v53 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          id v30 = v29;
          uint64_t v31 = [v30 countByEnumeratingWithState:&v50 objects:v58 count:16];
          id v32 = v30;
          if (v31)
          {
            uint64_t v33 = v31;
            id v34 = v13;
            id v35 = v14;
            uint64_t v36 = *(void *)v51;
LABEL_15:
            uint64_t v37 = 0;
            while (1)
            {
              if (*(void *)v51 != v36) {
                objc_enumerationMutation(v30);
              }
              uint64_t v38 = *(void **)(*((void *)&v50 + 1) + 8 * v37);
              [v38 timeIntervalSinceDate:v12];
              if (v39 > 0.0) {
                break;
              }
              if (v33 == ++v37)
              {
                uint64_t v33 = [v30 countByEnumeratingWithState:&v50 objects:v58 count:16];
                if (v33) {
                  goto LABEL_15;
                }
                id v32 = v30;
                id v14 = v35;
                id v13 = v34;
                uint64_t v8 = v44;
                a1 = v43;
                goto LABEL_24;
              }
            }
            id v32 = v38;

            id v14 = v35;
            id v13 = v34;
            uint64_t v8 = v44;
            a1 = v43;
            if (!v32) {
              goto LABEL_25;
            }
            [v48 addObject:v32];
          }
LABEL_24:

LABEL_25:
          uint64_t v18 = v45;
          uint64_t v17 = v46;
        }
        ++v19;
      }
      while (v19 != v17);
      uint64_t v17 = [obj countByEnumeratingWithState:&v54 objects:v59 count:16];
    }
    while (v17);
  }

  uint64_t v40 = [v48 sortedArrayUsingSelector:sel_compare_];
  uint64_t v41 = [v40 firstObject];

  return v41;
}

+ (id)previousRecurrentDueDateBefore:(id)a3 dueDate:(id)a4 timeZone:(id)a5 allDay:(BOOL)a6 recurrenceRules:(id)a7
{
  BOOL v53 = a6;
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v54 = a5;
  id v12 = a7;
  long long v51 = v11;
  unsigned int v44 = v12;
  if ([v10 compare:v11] == 1)
  {
    uint64_t v45 = objc_opt_new();
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id obj = v12;
    uint64_t v50 = [obj countByEnumeratingWithState:&v65 objects:v69 count:16];
    if (v50)
    {
      uint64_t v48 = *(void *)v66;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v66 != v48)
          {
            uint64_t v14 = v13;
            objc_enumerationMutation(obj);
            uint64_t v13 = v14;
          }
          uint64_t v52 = v13;
          id v15 = *(void **)(*((void *)&v65 + 1) + 8 * v13);
          if ([v15 frequency] == 4)
          {
            uint64_t v16 = objc_msgSend(a1, "hourlyRecurrentDueDateBefore:dueDate:interval:", v10, v51, objc_msgSend(v15, "interval"));
            if (v16) {
              [v45 addObject:v16];
            }
          }
          else
          {
            context = (void *)MEMORY[0x1BA9DB950]();
            uint64_t v17 = [a1 recurrenceGeneratorConfiguredForDueDate:v51 timeZone:v54 allDay:v53 recurrenceRule:v15];
            uint64_t v18 = [v15 recurrenceEnd];
            BOOL v19 = [v18 occurrenceCount] == 0;

            if (v19)
            {
              uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
            }
            else
            {
              id v20 = [v15 recurrenceEnd];
              uint64_t v21 = [v20 occurrenceCount];
            }
            id v22 = v51;
            id v23 = v22;
            if (v51 && v21 >= 1)
            {
              uint64_t v24 = 0;
              id v25 = v22;
              do
              {
                int v26 = [v25 isEqualToDate:v23];
                int v27 = v26;
                if (v21 + (v26 ^ 1u) >= 500) {
                  uint64_t v28 = 500;
                }
                else {
                  uint64_t v28 = v21 + (v26 ^ 1u);
                }
                uint64_t v29 = (void *)[v17 copyOccurrenceDatesWithInitialDate:v23 allDay:v53 rangeStart:v25 rangeEnd:v10 timeZone:v54 limit:v28];
                uint64_t v30 = [v29 count];
                if (v30 <= 1) {
                  uint64_t v31 = 1;
                }
                else {
                  uint64_t v31 = v30;
                }
                uint64_t v32 = v31 - 1;
                if (v27) {
                  uint64_t v33 = v30;
                }
                else {
                  uint64_t v33 = v32;
                }
                uint64_t v59 = 0;
                uint64_t v60 = &v59;
                uint64_t v61 = 0x3032000000;
                uint64_t v62 = __Block_byref_object_copy__10;
                v63 = __Block_byref_object_dispose__10;
                id v64 = 0;
                v55[0] = MEMORY[0x1E4F143A8];
                v55[1] = 3221225472;
                v55[2] = __92__REMRecurrenceRule_previousRecurrentDueDateBefore_dueDate_timeZone_allDay_recurrenceRules___block_invoke;
                v55[3] = &unk_1E61DDAA8;
                id v34 = v25;
                id v56 = v34;
                id v35 = v10;
                id v57 = v35;
                v58 = &v59;
                [v29 enumerateObjectsWithOptions:2 usingBlock:v55];
                uint64_t v36 = (void *)v60[5];
                if (v36)
                {
                  id v37 = v36;

                  uint64_t v38 = [v29 lastObject];
                  double v39 = v38;
                  if (v38 && [v38 compare:v35] == -1) {
                    id v25 = v39;
                  }
                  else {
                    id v25 = 0;
                  }

                  id v34 = v39;
                  uint64_t v24 = v37;
                }
                else
                {
                  id v25 = 0;
                }

                _Block_object_dispose(&v59, 8);
                if (!v25) {
                  break;
                }
                BOOL v40 = v21 <= v33;
                v21 -= v33;
              }
              while (!v40);
              if (v24)
              {
                [v45 addObject:v24];
              }
            }
            else
            {
              id v25 = v22;
            }
          }
          uint64_t v13 = v52 + 1;
        }
        while (v52 + 1 != v50);
        uint64_t v50 = [obj countByEnumeratingWithState:&v65 objects:v69 count:16];
      }
      while (v50);
    }

    uint64_t v41 = [v45 sortedArrayUsingSelector:sel_compare_];
    uint64_t v42 = [v41 lastObject];
  }
  else
  {
    uint64_t v42 = 0;
  }

  return v42;
}

void __92__REMRecurrenceRule_previousRecurrentDueDateBefore_dueDate_timeZone_allDay_recurrenceRules___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "compare:") == -1 && objc_msgSend(v7, "compare:", *(void *)(a1 + 40)) == -1)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    *a4 = 1;
  }
}

+ (id)recurrenceGeneratorConfiguredForDueDate:(id)a3 timeZone:(id)a4 allDay:(BOOL)a5 recurrenceRule:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = (objc_class *)MEMORY[0x1E4F577A0];
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc_init(v11);
  [v14 setEventStartDate:v13];
  [v14 setEventEndDate:v13];

  [v14 setEventTimeZone:v12];
  [v14 setAllDay:v6];
  id v15 = [v10 daysOfTheWeek];
  [v14 setDaysOfTheWeek:v15];

  uint64_t v16 = [v10 daysOfTheMonth];
  [v14 setDaysOfTheMonth:v16];

  uint64_t v17 = [v10 daysOfTheYear];
  [v14 setDaysOfTheYear:v17];

  uint64_t v18 = [v10 weeksOfTheYear];
  [v14 setWeeksOfTheYear:v18];

  BOOL v19 = [v10 monthsOfTheYear];
  [v14 setMonthsOfTheYear:v19];

  id v20 = [v10 setPositions];
  [v14 setSetPositions:v20];

  uint64_t v21 = [v10 interval];
  if (v21 <= 1) {
    uint64_t v22 = 1;
  }
  else {
    uint64_t v22 = v21;
  }
  [v14 setInterval:v22];
  objc_msgSend(v14, "setFrequency:", objc_msgSend(a1, "_convertREMRecurrenceFrequencyToCalRecurrenceFrequency:", objc_msgSend(v10, "frequency")));
  objc_msgSend(v14, "setWeekStart:", objc_msgSend(v10, "firstDayOfTheWeek"));
  if (![v14 weekStart]) {
    [v14 setWeekStart:2];
  }
  id v23 = [v10 recurrenceEnd];
  uint64_t v24 = [v23 endDate];

  id v25 = [v10 recurrenceEnd];
  int v26 = v25;
  if (v24)
  {
    int v27 = [v25 endDate];
    [v14 setEndDate:v27];
  }
  else
  {
    uint64_t v28 = [v25 occurrenceCount];

    if (!v28) {
      goto LABEL_11;
    }
    int v26 = [MEMORY[0x1E4F1C9C8] distantFuture];
    [v14 setEndDate:v26];
  }

LABEL_11:

  return v14;
}

+ (id)hourlyRecurrentDueDateToward:(id)a3 dueDate:(id)a4 interval:(int64_t)a5 adjustingStepsBy:(id)a6
{
  if (a5 <= 1) {
    int64_t v8 = 1;
  }
  else {
    int64_t v8 = a5;
  }
  double v9 = (double)v8 * 3600.0;
  id v10 = (double (**)(void, double))a6;
  id v11 = a4;
  [a3 timeIntervalSinceReferenceDate];
  double v13 = v12;
  [v11 timeIntervalSinceReferenceDate];
  double v15 = v10[2](v10, fmax(v13 - v14, 0.0) / v9);

  uint64_t v16 = [v11 dateByAddingTimeInterval:v9 * (double)(uint64_t)v15];

  return v16;
}

+ (id)hourlyRecurrentDueDateAfter:(id)a3 dueDate:(id)a4 interval:(int64_t)a5
{
  return (id)[a1 hourlyRecurrentDueDateToward:a3 dueDate:a4 interval:a5 adjustingStepsBy:&__block_literal_global_152];
}

double __66__REMRecurrenceRule_hourlyRecurrentDueDateAfter_dueDate_interval___block_invoke(double a1)
{
  return floor(a1) + 1.0;
}

+ (id)hourlyRecurrentDueDateBefore:(id)a3 dueDate:(id)a4 interval:(int64_t)a5
{
  id v8 = a4;
  double v9 = [a1 hourlyRecurrentDueDateToward:a3 dueDate:v8 interval:a5 adjustingStepsBy:&__block_literal_global_154];
  LOBYTE(a3) = [v9 isEqualToDate:v8];

  if (a3) {
    id v10 = 0;
  }
  else {
    id v10 = v9;
  }

  return v10;
}

double __67__REMRecurrenceRule_hourlyRecurrentDueDateBefore_dueDate_interval___block_invoke(double a1)
{
  return fmax(ceil(a1) + -1.0, 0.0);
}

+ (int)_convertREMRecurrenceFrequencyToCalRecurrenceFrequency:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      int result = 2;
      break;
    case 2:
      int result = 3;
      break;
    case 3:
      int result = 4;
      break;
    case 4:
      BOOL v4 = +[REMLogStore utility];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
        +[REMRecurrenceRule _convertREMRecurrenceFrequencyToCalRecurrenceFrequency:](v4);
      }

      int result = 1;
      break;
    default:
      int result = 1;
      break;
  }
  return result;
}

+ (id)newObjectID
{
  unint64_t v3 = [MEMORY[0x1E4F29128] UUID];
  BOOL v4 = [a1 objectIDWithUUID:v3];

  return v4;
}

+ (id)objectIDWithUUID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [a1 cdEntityName];
  BOOL v6 = +[REMObjectID objectIDWithUUID:v4 entityName:v5];

  return v6;
}

+ (NSString)cdEntityName
{
  return (NSString *)@"REMCDRecurrenceRule";
}

- (REMRecurrenceEnd)recurrenceEnd
{
  return self->_recurrenceEnd;
}

- (int64_t)frequency
{
  return self->_frequency;
}

- (int64_t)interval
{
  return self->_interval;
}

- (int64_t)firstDayOfTheWeek
{
  return self->_firstDayOfTheWeek;
}

- (NSArray)daysOfTheWeek
{
  return self->_daysOfTheWeek;
}

- (NSArray)daysOfTheMonth
{
  return self->_daysOfTheMonth;
}

- (NSArray)daysOfTheYear
{
  return self->_daysOfTheYear;
}

- (NSArray)weeksOfTheYear
{
  return self->_weeksOfTheYear;
}

- (NSArray)monthsOfTheYear
{
  return self->_monthsOfTheYear;
}

- (NSArray)setPositions
{
  return self->_setPositions;
}

- (REMObjectID)objectID
{
  return self->_objectID;
}

- (REMObjectID)accountID
{
  return self->_accountID;
}

- (REMObjectID)reminderID
{
  return self->_reminderID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reminderID, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_storeStrong((id *)&self->_setPositions, 0);
  objc_storeStrong((id *)&self->_monthsOfTheYear, 0);
  objc_storeStrong((id *)&self->_weeksOfTheYear, 0);
  objc_storeStrong((id *)&self->_daysOfTheYear, 0);
  objc_storeStrong((id *)&self->_daysOfTheMonth, 0);
  objc_storeStrong((id *)&self->_daysOfTheWeek, 0);

  objc_storeStrong((id *)&self->_recurrenceEnd, 0);
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1B9AA2000, a2, OS_LOG_TYPE_FAULT, "Unknown REMRecurrenceFrequency %ld", (uint8_t *)&v2, 0xCu);
}

+ (void)_convertREMRecurrenceFrequencyToCalRecurrenceFrequency:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1B9AA2000, log, OS_LOG_TYPE_FAULT, "Hourly recurrence is not supported by CalendarFoundation.", v1, 2u);
}

@end