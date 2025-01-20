@interface NEKCalendarID
+ (id)calendarInStore:(id)a3 withNEKCalendarID:(id)a4;
+ (id)listInStore:(id)a3 withNEKCalendarID:(id)a4;
+ (void)resetLocalCalendarCache;
- (BOOL)isDefaultLocalCalendar;
- (BOOL)isEqual:(id)a3;
- (NEKCalendarID)initWithCalendar:(id)a3;
- (NEKCalendarID)initWithIdentifier:(id)a3 isDefaultLocalCalendar:(BOOL)a4;
- (NEKCalendarID)initWithList:(id)a3;
- (NSString)identifier;
- (id)description;
- (id)initUniquelyWithKey:(id)a3 localFlag:(BOOL)a4;
- (unint64_t)hash;
@end

@implementation NEKCalendarID

- (id)initUniquelyWithKey:(id)a3 localFlag:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NEKCalendarID;
  v8 = [(NEKCalendarID *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a3);
    v9->_isDefaultLocalCalendar = a4;
  }

  return v9;
}

- (NEKCalendarID)initWithIdentifier:(id)a3 isDefaultLocalCalendar:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = (__CFString *)a3;
  id v7 = v6;
  v8 = @">>LOCAL<<";
  if (!v4) {
    v8 = v6;
  }
  v9 = v8;
  id v10 = [[NEKCalendarID alloc] initUniquelyWithKey:v9 localFlag:v4];

  if (qword_1000C6C00 != -1) {
    dispatch_once(&qword_1000C6C00, &stru_1000A9630);
  }
  objc_super v11 = [(id)qword_1000C6C08 cachedCopy:v10];

  return v11;
}

- (id)description
{
  if ([(NEKCalendarID *)self isDefaultLocalCalendar])
  {
    v3 = @"Default local calendar";
  }
  else
  {
    BOOL v4 = [(NEKCalendarID *)self identifier];
    v3 = +[NSString stringWithFormat:@"UUID: %@", v4];
  }
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  id v7 = +[NSString stringWithFormat:@"<%@ %p; %@>", v6, self, v3];

  return v7;
}

- (unint64_t)hash
{
  if ([(NEKCalendarID *)self isDefaultLocalCalendar]) {
    return 1;
  }
  BOOL v4 = [(NEKCalendarID *)self identifier];
  id v5 = [v4 hash];

  return (unint64_t)v5;
}

- (BOOL)isEqual:(id)a3
{
  BOOL v4 = (NEKCalendarID *)a3;
  if (v4 != self)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      unsigned __int8 v5 = 0;
      goto LABEL_8;
    }
    if (![(NEKCalendarID *)self isDefaultLocalCalendar]
      || ![(NEKCalendarID *)v4 isDefaultLocalCalendar])
    {
      v6 = [(NEKCalendarID *)self identifier];
      id v7 = [(NEKCalendarID *)v4 identifier];
      unsigned __int8 v5 = [v6 isEqualToString:v7];

      goto LABEL_8;
    }
  }
  unsigned __int8 v5 = 1;
LABEL_8:

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)isDefaultLocalCalendar
{
  return self->_isDefaultLocalCalendar;
}

- (void).cxx_destruct
{
}

- (NEKCalendarID)initWithCalendar:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 eventStore];
  v6 = (void *)v5;
  id v7 = 0;
  if (v4 && v5)
  {
    v8 = [v4 objectID];
    id v9 = [v8 isEqual:qword_1000C6C20];
    if (v9)
    {
      id v10 = 0;
    }
    else
    {
      objc_super v11 = [v4 calendarIdentifier];
      id v10 = [v11 copy];
    }
    self = [(NEKCalendarID *)self initWithIdentifier:v10 isDefaultLocalCalendar:v9];

    id v7 = self;
  }

  return v7;
}

+ (id)calendarInStore:(id)a3 withNEKCalendarID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 isDefaultLocalCalendar])
  {
    id v7 = [v5 defaultLocalCalendar];
  }
  else
  {
    v8 = [v6 identifier];
    id v7 = [v5 calendarWithIdentifier:v8];
  }

  return v7;
}

+ (void)resetLocalCalendarCache
{
  v2 = NSStringFromSelector(a2);
  id v6 = +[EKEventStore eks_eventOnlyStoreFor:v2];

  v3 = [v6 defaultLocalCalendar];
  uint64_t v4 = [v3 objectID];
  id v5 = (void *)qword_1000C6C20;
  qword_1000C6C20 = v4;
}

- (NEKCalendarID)initWithList:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 store];
  id v6 = (void *)v5;
  id v7 = 0;
  if (v4 && v5)
  {
    v8 = [v4 objectID];
    id v9 = [v8 isEqual:0];
    id v10 = 0;
    if ((v9 & 1) == 0)
    {
      objc_super v11 = [v4 objectID];
      v12 = [v11 uuid];
      id v10 = [v12 UUIDString];
    }
    self = [(NEKCalendarID *)self initWithIdentifier:v10 isDefaultLocalCalendar:v9];

    id v7 = self;
  }

  return v7;
}

+ (id)listInStore:(id)a3 withNEKCalendarID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 isDefaultLocalCalendar])
  {
    id v7 = [v5 eks_defaultLocalList];
    if (!v7)
    {
      v8 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_10006F404(v8);
      }
      id v7 = 0;
    }
  }
  else
  {
    id v9 = [v6 identifier];
    id v10 = [objc_alloc((Class)NSUUID) initWithUUIDString:v9];
    if (!v10)
    {
      objc_super v11 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        sub_10006F4F0((uint64_t)v9, v11);
      }
    }
    v12 = +[REMList objectIDWithUUID:v10];
    id v16 = 0;
    id v7 = [v5 fetchListWithObjectID:v12 error:&v16];
    id v13 = v16;
    if (!v7)
    {
      v14 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_10006F448(v14, v6);
      }
    }
  }

  return v7;
}

@end