@interface REMDisplayDate
+ (BOOL)supportsSecureCoding;
- (BOOL)isAllDay;
- (BOOL)isEqual:(id)a3;
- (NSDate)date;
- (NSTimeZone)timeZone;
- (REMDisplayDate)initWithCoder:(id)a3;
- (REMDisplayDate)initWithDate:(id)a3 allDay:(BOOL)a4 timeZone:(id)a5;
- (REMDisplayDate)initWithDueDateComponents:(id)a3 alarms:(id)a4;
- (REMDisplayDate)initWithFloatingDateComponents:(id)a3 nonFloatingDateComponents:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dateComponentsRepresentation;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMDisplayDate

- (REMDisplayDate)initWithDate:(id)a3 allDay:(BOOL)a4 timeZone:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    v23.receiver = self;
    v23.super_class = (Class)REMDisplayDate;
    v10 = [(REMDisplayDate *)&v23 init];
    if (v10)
    {
      uint64_t v11 = [v8 copy];
      date = v10->_date;
      v10->_date = (NSDate *)v11;

      v10->_allDay = a4;
      objc_storeStrong((id *)&v10->_timeZone, a5);
    }
    self = v10;
    v13 = self;
  }
  else
  {
    v14 = +[REMLog utility];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[REMDisplayDate initWithDate:allDay:timeZone:](v14, v15, v16, v17, v18, v19, v20, v21);
    }

    v13 = 0;
  }

  return v13;
}

- (REMDisplayDate)initWithFloatingDateComponents:(id)a3 nonFloatingDateComponents:(id)a4
{
  uint64_t v6 = (uint64_t)a3;
  uint64_t v7 = (uint64_t)a4;
  if (!(v6 | v7)) {
    goto LABEL_18;
  }
  v57.receiver = self;
  v57.super_class = (Class)REMDisplayDate;
  self = [(REMDisplayDate *)&v57 init];
  if (!self)
  {
LABEL_28:
    self = self;
    v40 = self;
    goto LABEL_29;
  }
  if (v6)
  {
    id v8 = (void *)MEMORY[0x1E4F1C9D8];
    id v9 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
    v10 = objc_msgSend(v8, "rem_dateWithDateComponents:timeZone:", v6, v9);

    if (v7) {
      goto LABEL_5;
    }
LABEL_12:
    v13 = [MEMORY[0x1E4F1C9C8] distantFuture];
    if (v10) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
  v10 = [MEMORY[0x1E4F1C9C8] distantFuture];
  if (!v7) {
    goto LABEL_12;
  }
LABEL_5:
  uint64_t v11 = (void *)MEMORY[0x1E4F1C9D8];
  v12 = [(id)v7 timeZone];
  v13 = objc_msgSend(v11, "rem_dateWithDateComponents:timeZone:", v7, v12);

  if (v10)
  {
LABEL_6:
    if (v13)
    {
      [v10 timeIntervalSinceDate:v13];
      p_date = &self->_date;
      if (v15 >= 0.0)
      {
        objc_storeStrong((id *)p_date, v13);
        self->_allDay = objc_msgSend((id)v7, "rem_isAllDayDateComponents");
        v41 = [(id)v7 timeZone];
        timeZone = self->_timeZone;
        self->_timeZone = v41;

        if (!self->_timeZone)
        {
          v43 = +[REMLog utility];
          if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT)) {
            -[REMDisplayDate initWithFloatingDateComponents:nonFloatingDateComponents:].cold.5(v7, v43, v44, v45, v46, v47, v48, v49);
          }
        }
        if (!self->_allDay) {
          goto LABEL_27;
        }
        uint64_t v18 = +[REMLog utility];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
          -[REMDisplayDate initWithFloatingDateComponents:nonFloatingDateComponents:].cold.4(v7, v18, v50, v51, v52, v53, v54, v55);
        }
      }
      else
      {
        objc_storeStrong((id *)p_date, v10);
        self->_allDay = objc_msgSend((id)v6, "rem_isAllDayDateComponents");
        uint64_t v16 = [(id)v6 timeZone];
        uint64_t v17 = self->_timeZone;
        self->_timeZone = v16;

        if (!self->_timeZone)
        {
LABEL_27:

          goto LABEL_28;
        }
        uint64_t v18 = +[REMLog utility];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
          -[REMDisplayDate initWithFloatingDateComponents:nonFloatingDateComponents:](v6, v18, v19, v20, v21, v22, v23, v24);
        }
      }

      goto LABEL_27;
    }
    v25 = +[REMLog utility];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
      -[REMDisplayDate initWithFloatingDateComponents:nonFloatingDateComponents:](v25, v33, v34, v35, v36, v37, v38, v39);
    }
    goto LABEL_17;
  }
LABEL_13:
  v25 = +[REMLog utility];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
    -[REMDisplayDate initWithFloatingDateComponents:nonFloatingDateComponents:](v25, v26, v27, v28, v29, v30, v31, v32);
  }
LABEL_17:

LABEL_18:
  v40 = 0;
LABEL_29:

  return v40;
}

- (REMDisplayDate)initWithDueDateComponents:(id)a3 alarms:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(id)objc_opt_class() displayDateWithDueDateComponents:v7 alarms:v6];

  return v8;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(REMDisplayDate *)self date];
  id v6 = [(REMDisplayDate *)self timeZone];
  id v7 = [v3 stringWithFormat:@"<%@: %p date: %@, timeZone: %@, allDay: %ld>", v4, self, v5, v6, -[REMDisplayDate isAllDay](self, "isAllDay")];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_7;
  }
  v5 = [(REMDisplayDate *)self date];
  uint64_t v6 = [v4 date];
  if (v5 == (void *)v6)
  {
  }
  else
  {
    id v7 = (void *)v6;
    id v8 = [(REMDisplayDate *)self date];
    id v9 = [v4 date];
    int v10 = [v8 isEqual:v9];

    if (!v10) {
      goto LABEL_7;
    }
  }
  int v11 = [(REMDisplayDate *)self isAllDay];
  if (v11 != [v4 isAllDay])
  {
LABEL_7:
    char v12 = 0;
    goto LABEL_8;
  }
  v14 = [(REMDisplayDate *)self timeZone];
  uint64_t v15 = [v4 timeZone];
  if (v14 == (void *)v15)
  {
    char v12 = 1;
    uint64_t v16 = v14;
  }
  else
  {
    uint64_t v16 = (void *)v15;
    uint64_t v17 = [(REMDisplayDate *)self timeZone];
    uint64_t v18 = [v4 timeZone];
    char v12 = [v17 isEqual:v18];
  }
LABEL_8:

  return v12;
}

- (unint64_t)hash
{
  v3 = [(REMDisplayDate *)self date];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = v4 + [(REMDisplayDate *)self isAllDay];
  uint64_t v6 = [(REMDisplayDate *)self timeZone];
  unint64_t v7 = [v6 hash] ^ v5;

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [REMDisplayDate alloc];
  uint64_t v5 = [(REMDisplayDate *)self date];
  BOOL v6 = [(REMDisplayDate *)self isAllDay];
  unint64_t v7 = [(REMDisplayDate *)self timeZone];
  id v8 = [(REMDisplayDate *)v4 initWithDate:v5 allDay:v6 timeZone:v7];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMDisplayDate)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
  BOOL v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isAllDay"];
  unint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timeZone"];

  id v8 = -[REMDisplayDate initWithDate:allDay:timeZone:](self, "initWithDate:allDay:timeZone:", v5, [v6 BOOLValue], v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(REMDisplayDate *)self date];
  [v4 encodeObject:v5 forKey:@"date"];

  BOOL v6 = objc_msgSend(NSNumber, "numberWithBool:", -[REMDisplayDate isAllDay](self, "isAllDay"));
  [v4 encodeObject:v6 forKey:@"isAllDay"];

  id v7 = [(REMDisplayDate *)self timeZone];
  [v4 encodeObject:v7 forKey:@"timeZone"];
}

- (id)dateComponentsRepresentation
{
  v3 = [(REMDisplayDate *)self timeZone];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
  }
  BOOL v6 = v5;

  id v7 = (void *)MEMORY[0x1E4F1C9D8];
  id v8 = [(REMDisplayDate *)self date];
  id v9 = objc_msgSend(v7, "rem_dateComponentsWithDate:timeZone:isAllDay:", v8, v6, -[REMDisplayDate isAllDay](self, "isAllDay"));

  int v10 = [(REMDisplayDate *)self timeZone];

  if (!v10)
  {
    uint64_t v11 = objc_msgSend(v9, "rem_strippingTimeZone");

    id v9 = (void *)v11;
  }

  return v9;
}

- (NSDate)date
{
  return self->_date;
}

- (BOOL)isAllDay
{
  return self->_allDay;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZone, 0);

  objc_storeStrong((id *)&self->_date, 0);
}

- (void)initWithDate:(uint64_t)a3 allDay:(uint64_t)a4 timeZone:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithFloatingDateComponents:(uint64_t)a3 nonFloatingDateComponents:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_1B9AA2000, a1, a3, "Unable to obtain a valid floating date from floating date components; returning nil",
    a5,
    a6,
    a7,
    a8,
    0);
}

- (void)initWithFloatingDateComponents:(uint64_t)a3 nonFloatingDateComponents:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_1B9AA2000, a1, a3, "Unable to obtain a valid non-floating date from non-floating date components; returning nil",
    a5,
    a6,
    a7,
    a8,
    0);
}

- (void)initWithFloatingDateComponents:(uint64_t)a3 nonFloatingDateComponents:(uint64_t)a4 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithFloatingDateComponents:(uint64_t)a3 nonFloatingDateComponents:(uint64_t)a4 .cold.4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithFloatingDateComponents:(uint64_t)a3 nonFloatingDateComponents:(uint64_t)a4 .cold.5(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end