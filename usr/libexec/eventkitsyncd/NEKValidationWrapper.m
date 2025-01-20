@interface NEKValidationWrapper
+ (BOOL)validationEnabled;
+ (id)validationWrapperForPb:(id)a3;
+ (id)validationWrapperForRightNow;
+ (id)validationWrapperForSameSpan:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)showAlert;
- (NSDate)end;
- (NSDate)start;
- (NSString)description;
- (NSString)objectIdentifier;
- (NSString)sequencer;
- (int64_t)changeType;
- (int64_t)masterCount;
- (int64_t)occurrenceCount;
- (void)_countEvents;
- (void)setEnd:(id)a3;
- (void)setMasterCount:(int64_t)a3;
- (void)setOccurrenceCount:(int64_t)a3;
- (void)setShowAlert:(BOOL)a3;
- (void)setStart:(id)a3;
- (void)validate;
@end

@implementation NEKValidationWrapper

+ (id)validationWrapperForRightNow
{
  v2 = objc_alloc_init(NEKValidationWrapper);
  v3 = +[NSDate date];
  [(NEKValidationWrapper *)v2 setStart:v3];

  v4 = [(NEKValidationWrapper *)v2 start];
  v5 = [v4 dateByAddingTimeInterval:1209600.0];
  [(NEKValidationWrapper *)v2 setEnd:v5];

  [(NEKValidationWrapper *)v2 _countEvents];

  return v2;
}

+ (id)validationWrapperForSameSpan:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(NEKValidationWrapper);
  v5 = [v3 start];
  [(NEKValidationWrapper *)v4 setStart:v5];

  v6 = [v3 end];

  [(NEKValidationWrapper *)v4 setEnd:v6];
  [(NEKValidationWrapper *)v4 _countEvents];

  return v4;
}

+ (id)validationWrapperForPb:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(NEKValidationWrapper);
  [v3 startDate];
  v5 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  [(NEKValidationWrapper *)v4 setStart:v5];

  [v3 endDate];
  v6 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  [(NEKValidationWrapper *)v4 setEnd:v6];

  -[NEKValidationWrapper setMasterCount:](v4, "setMasterCount:", [v3 masterCount]);
  -[NEKValidationWrapper setOccurrenceCount:](v4, "setOccurrenceCount:", [v3 occurrenceCount]);
  id v7 = [v3 showAlert];

  [(NEKValidationWrapper *)v4 setShowAlert:v7];

  return v4;
}

+ (BOOL)validationEnabled
{
  return 0;
}

- (void)_countEvents
{
  [(NEKValidationWrapper *)self setMasterCount:0];
  [(NEKValidationWrapper *)self setOccurrenceCount:0];
  v26 = +[EKEventStore eks_eventOnlyStoreFor:@"ValidationWrapper"];
  [v26 sources];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v34;
    uint64_t v23 = *(void *)v34;
    do
    {
      v6 = 0;
      id v24 = v4;
      do
      {
        if (*(void *)v34 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v33 + 1) + 8 * (void)v6);
        if (sub_10000BA00(v7))
        {
          v8 = [v7 allCalendars];
          long long v29 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          id v28 = v8;
          id v9 = [v8 countByEnumeratingWithState:&v29 objects:v38 count:16];
          if (v9)
          {
            id v10 = v9;
            uint64_t v11 = *(void *)v30;
            uint64_t v27 = *(void *)v30;
            do
            {
              for (i = 0; i != v10; i = (char *)i + 1)
              {
                if (*(void *)v30 != v11) {
                  objc_enumerationMutation(v28);
                }
                v13 = *(void **)(*((void *)&v29 + 1) + 8 * i);
                if (sub_10000BACC(v13))
                {
                  v14 = [(NEKValidationWrapper *)self start];
                  v15 = [(NEKValidationWrapper *)self end];
                  v16 = [v26 predicateForMasterEventsWithOccurrencesWithStartDate:v14 endDate:v15 inCalendar:v13];

                  v17 = [v26 eventObjectIDsMatchingPredicate:v16];
                  -[NEKValidationWrapper setMasterCount:](self, "setMasterCount:", (char *)[v17 count] + -[NEKValidationWrapper masterCount](self, "masterCount"));
                  v18 = [(NEKValidationWrapper *)self start];
                  v19 = [(NEKValidationWrapper *)self end];
                  v37 = v13;
                  v20 = +[NSArray arrayWithObjects:&v37 count:1];
                  v21 = [v26 predicateForEventsWithStartDate:v18 endDate:v19 calendars:v20];

                  v22 = [v26 eventObjectIDsMatchingPredicate:v21];

                  -[NEKValidationWrapper setOccurrenceCount:](self, "setOccurrenceCount:", (char *)[v22 count]+ -[NEKValidationWrapper occurrenceCount](self, "occurrenceCount"));
                  uint64_t v11 = v27;
                }
              }
              id v10 = [v28 countByEnumeratingWithState:&v29 objects:v38 count:16];
            }
            while (v10);
          }

          uint64_t v5 = v23;
          id v4 = v24;
        }
        v6 = (char *)v6 + 1;
      }
      while (v6 != v4);
      id v4 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v4);
  }
  [(NEKValidationWrapper *)self setShowAlert:CFPreferencesGetAppBooleanValue(@"cvAlertEnabled", @"com.apple.Bridge.CalendarSyncDebug", 0) != 0];
}

- (int64_t)changeType
{
  return 2;
}

- (NSString)objectIdentifier
{
  return (NSString *)@"1";
}

- (NSString)sequencer
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(NEKValidationWrapper *)self start];
    id v7 = [v5 start];
    if ([v6 isEqual:v7])
    {
      v8 = [(NEKValidationWrapper *)self end];
      id v9 = [v5 end];
      if ([v8 isEqual:v9])
      {
        id v10 = [(NEKValidationWrapper *)self masterCount];
        BOOL v11 = v10 == [v5 masterCount];
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (NSString)description
{
  if (qword_1000C6B50 != -1) {
    dispatch_once(&qword_1000C6B50, &stru_1000A8EC0);
  }
  id v3 = (void *)qword_1000C6B58;
  id v4 = [(NEKValidationWrapper *)self start];
  id v5 = [v3 stringFromDate:v4];

  v6 = (void *)qword_1000C6B58;
  id v7 = [(NEKValidationWrapper *)self end];
  v8 = [v6 stringFromDate:v7];

  id v9 = (objc_class *)objc_opt_class();
  id v10 = NSStringFromClass(v9);
  BOOL v11 = +[NSString stringWithFormat:@"<%@:%p start:%@ end:%@ masterCount:%d occurrenceCount:%d>", v10, self, v5, v8, [(NEKValidationWrapper *)self masterCount], [(NEKValidationWrapper *)self occurrenceCount]];

  return (NSString *)v11;
}

- (void)validate
{
  id v3 = +[NEKValidationWrapper validationWrapperForSameSpan:self];
  unsigned __int8 v4 = [v3 isEqual:self];
  id v5 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (v4)
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      v8 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Validation succeeded, %@.", (uint8_t *)&v7, 0xCu);
    }
    qword_1000C6B60 = 0;
  }
  else
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR)) {
      sub_10006C5F8();
    }
    if (++qword_1000C6B60 == 2)
    {
      if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_FAULT)) {
        sub_10006C580();
      }
      if ([(NEKValidationWrapper *)self showAlert])
      {
        v6 = +[NSString stringWithFormat:@"Calendar validation failure. Please file a radar against \"EventKitSync | watchOS\""];
        CFUserNotificationDisplayNotice(0.0, 0, 0, 0, 0, @"Sync validation failure", v6, @"OK");
      }
    }
  }
}

- (NSDate)start
{
  return self->_start;
}

- (void)setStart:(id)a3
{
}

- (NSDate)end
{
  return self->_end;
}

- (void)setEnd:(id)a3
{
}

- (int64_t)masterCount
{
  return self->_masterCount;
}

- (void)setMasterCount:(int64_t)a3
{
  self->_masterCount = a3;
}

- (int64_t)occurrenceCount
{
  return self->_occurrenceCount;
}

- (void)setOccurrenceCount:(int64_t)a3
{
  self->_occurrenceCount = a3;
}

- (BOOL)showAlert
{
  return self->_showAlert;
}

- (void)setShowAlert:(BOOL)a3
{
  self->_showAlert = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_end, 0);

  objc_storeStrong((id *)&self->_start, 0);
}

@end