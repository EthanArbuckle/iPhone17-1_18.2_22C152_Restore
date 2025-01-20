@interface CTSCalendarInterval
- (CTSCalendarInterval)initWithToken:(unint64_t)a3 andEvent:(id)a4;
- (NSDate)fireDate;
- (NSDateComponents)components;
- (NSString)identifier;
- (unint64_t)token;
- (void)parseComponent:(unint64_t)a3 inEvent:(id)a4;
- (void)resetFireDate;
- (void)setEveryMinuteIfNothingElseSet;
- (void)setToken:(unint64_t)a3;
@end

@implementation CTSCalendarInterval

- (void)parseComponent:(unint64_t)a3 inEvent:(id)a4
{
  v6 = (const char *)qword_109E8[3 * a3];
  v7 = xpc_dictionary_get_value(a4, v6);
  v8 = v7;
  if (v7 && xpc_get_type(v7) == (xpc_type_t)&_xpc_type_int64)
  {
    int64_t value = xpc_int64_get_value(v8);
    int64_t v10 = qword_109E8[3 * a3 + 1];
    if (value >= v10 && (uint64_t v11 = value, value <= qword_109E8[3 * a3 + 2]))
    {
      if (a3 == 512)
      {
        uint64_t v11 = value % 7 + 1;
        [(NSDateComponents *)self->_components setDay:0x7FFFFFFFFFFFFFFFLL];
        [(NSDateComponents *)self->_components setMonth:0x7FFFFFFFFFFFFFFFLL];
      }
      [(NSDateComponents *)self->_components setValue:v11 forComponent:a3];
      if (![(NSDateComponents *)self->_components isValidDate])
      {
        NSInteger v14 = [(NSDateComponents *)self->_components month];
        if (v14 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v15 = (v14 + 1) % 12 + 1;
          [(NSDateComponents *)self->_components setDay:1];
          [(NSDateComponents *)self->_components setMonth:v15];
        }
      }
    }
    else
    {
      v12 = qword_15470;
      if (os_log_type_enabled((os_log_t)qword_15470, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = qword_109E8[3 * a3 + 2];
        int v16 = 136315650;
        v17 = v6;
        __int16 v18 = 1024;
        int v19 = v10;
        __int16 v20 = 1024;
        int v21 = v13;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "The interval for key \"%s\" is not between %d and %d (inclusive).", (uint8_t *)&v16, 0x18u);
      }
    }
  }
}

- (void)setEveryMinuteIfNothingElseSet
{
  if ([(NSDateComponents *)self->_components minute] == 0x7FFFFFFFFFFFFFFFLL
    && [(NSDateComponents *)self->_components hour] == 0x7FFFFFFFFFFFFFFFLL
    && [(NSDateComponents *)self->_components day] == 0x7FFFFFFFFFFFFFFFLL
    && [(NSDateComponents *)self->_components month] == 0x7FFFFFFFFFFFFFFFLL
    && [(NSDateComponents *)self->_components weekday] == 0x7FFFFFFFFFFFFFFFLL)
  {
    components = self->_components;
    [(NSDateComponents *)components setSecond:0];
  }
}

- (void)resetFireDate
{
  id v6 = [(NSDateComponents *)self->_components calendar];
  v3 = +[NSDate date];
  v4 = [v6 nextDateAfterDate:v3 matchingComponents:self->_components options:1024];
  fireDate = self->_fireDate;
  self->_fireDate = v4;
}

- (CTSCalendarInterval)initWithToken:(unint64_t)a3 andEvent:(id)a4
{
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CTSCalendarInterval;
  v7 = [(CTSCalendarInterval *)&v14 init];
  if (v7)
  {
    memset(v15, 0, sizeof(v15));
    if ((xpc_get_event_name() & 1) == 0) {
      __strlcpy_chk();
    }
    uint64_t v8 = +[NSString stringWithUTF8String:v15];
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v8;

    v7->_token = a3;
    uint64_t v10 = objc_opt_new();
    components = v7->_components;
    v7->_components = (NSDateComponents *)v10;

    v12 = v7->_components;
    if (qword_15460 != -1) {
      dispatch_once(&qword_15460, &stru_13A00);
    }
    [(NSDateComponents *)v12 setCalendar:qword_15458];
    [(CTSCalendarInterval *)v7 parseComponent:64 inEvent:v6];
    [(CTSCalendarInterval *)v7 parseComponent:32 inEvent:v6];
    [(CTSCalendarInterval *)v7 parseComponent:16 inEvent:v6];
    [(CTSCalendarInterval *)v7 parseComponent:8 inEvent:v6];
    [(CTSCalendarInterval *)v7 parseComponent:512 inEvent:v6];
    [(CTSCalendarInterval *)v7 setEveryMinuteIfNothingElseSet];
    [(CTSCalendarInterval *)v7 resetFireDate];
  }

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)token
{
  return self->_token;
}

- (void)setToken:(unint64_t)a3
{
  self->_token = a3;
}

- (NSDateComponents)components
{
  return self->_components;
}

- (NSDate)fireDate
{
  return self->_fireDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fireDate, 0);
  objc_storeStrong((id *)&self->_components, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end