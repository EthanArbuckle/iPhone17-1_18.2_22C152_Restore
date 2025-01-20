@interface DMDEventSubscriptionRegistrationController
- (DMDEventReportingSchedule)schedule;
- (DMDEventSubscriptionRegistrationController)initWithSubscriptionRegistration:(id)a3 streamEventsHandler:(id)a4;
- (NSDate)lastDateScheduleElapsed;
- (NSMutableDictionary)eventStreamByEventType;
- (NSString)identifier;
- (NSString)organizationIdentifier;
- (NSString)payloadIdentifier;
- (id)eventStatusesSinceStartDate:(id)a3;
- (id)streamEventsHandler;
- (void)_updateEventStreams:(id)a3;
- (void)setEventStreamByEventType:(id)a3;
- (void)setLastDateScheduleElapsed:(id)a3;
- (void)setSchedule:(id)a3;
- (void)updateWithSubscriptionRegistration:(id)a3;
@end

@implementation DMDEventSubscriptionRegistrationController

- (DMDEventSubscriptionRegistrationController)initWithSubscriptionRegistration:(id)a3 streamEventsHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)DMDEventSubscriptionRegistrationController;
  v8 = [(DMDEventSubscriptionRegistrationController *)&v24 init];
  if (v8)
  {
    v9 = [v6 payloadMetadata];
    v10 = [v9 organization];
    uint64_t v11 = [v10 identifier];
    organizationIdentifier = v8->_organizationIdentifier;
    v8->_organizationIdentifier = (NSString *)v11;

    uint64_t v13 = [v9 identifier];
    payloadIdentifier = v8->_payloadIdentifier;
    v8->_payloadIdentifier = (NSString *)v13;

    uint64_t v15 = [v6 identifier];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v15;

    id v17 = objc_retainBlock(v7);
    id streamEventsHandler = v8->_streamEventsHandler;
    v8->_id streamEventsHandler = v17;

    uint64_t v19 = objc_opt_new();
    eventStreamByEventType = v8->_eventStreamByEventType;
    v8->_eventStreamByEventType = (NSMutableDictionary *)v19;

    uint64_t v21 = objc_opt_new();
    lastDateScheduleElapsed = v8->_lastDateScheduleElapsed;
    v8->_lastDateScheduleElapsed = (NSDate *)v21;

    [(DMDEventSubscriptionRegistrationController *)v8 updateWithSubscriptionRegistration:v6];
  }

  return v8;
}

- (void)updateWithSubscriptionRegistration:(id)a3
{
  id v12 = a3;
  if (!v12)
  {
    v10 = +[NSAssertionHandler currentHandler];
    [v10 handleFailureInMethod:a2, self, @"DMDEventSubscriptionRegistrationController.m", 49, @"Invalid parameter not satisfying: %@", @"subscriptionRegistration" object file lineNumber description];
  }
  v5 = [(DMDEventSubscriptionRegistrationController *)self identifier];
  id v6 = [v12 identifier];
  unsigned __int8 v7 = [v5 isEqualToString:v6];

  if ((v7 & 1) == 0)
  {
    uint64_t v11 = +[NSAssertionHandler currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"DMDEventSubscriptionRegistrationController.m" lineNumber:51 description:@"Cannot update subscription controller with a subscription registration with a different identifier"];
  }
  v8 = [v12 events];
  [(DMDEventSubscriptionRegistrationController *)self _updateEventStreams:v8];

  v9 = [[DMDEventReportingSchedule alloc] initWithScheduleRegistration:v12];
  [(DMDEventSubscriptionRegistrationController *)self setSchedule:v9];
}

- (void)_updateEventStreams:(id)a3
{
  id v4 = a3;
  v5 = [(DMDEventSubscriptionRegistrationController *)self eventStreamByEventType];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v21;
    *(void *)&long long v8 = 138543362;
    long long v19 = v8;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v13 = [v12 payloadType:v19, v20];
        v14 = [v13 lowercaseString];

        uint64_t v15 = [v5 objectForKeyedSubscript:v14];
        v16 = v15;
        if (v15)
        {
          [v15 updateEvent:v12];
          goto LABEL_14;
        }
        if ([v14 isEqualToString:@"com.apple.event.management.test"])
        {
          uint64_t v17 = objc_opt_new();
          if (!v17) {
            goto LABEL_14;
          }
          v18 = v17;
          [v5 setObject:v17 forKeyedSubscript:v14];
        }
        else
        {
          v18 = DMFConfigurationEngineLog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v19;
            v25 = v14;
            _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Unknown event stream type %{public}@, skipping", buf, 0xCu);
          }
        }

LABEL_14:
      }
      id v9 = [v6 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v9);
  }
}

- (void)setSchedule:(id)a3
{
  id v5 = a3;
  if (![(DMDEventReportingSchedule *)self->_schedule isEqual:v5])
  {
    objc_storeStrong((id *)&self->_schedule, a3);
    if ([v5 frequency])
    {
      objc_initWeak(&location, self);
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_10004946C;
      v7[3] = &unk_1000CA800;
      objc_copyWeak(&v8, &location);
      [v5 startWithScheduleElapsedHandler:v7];
      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
    else
    {
      id v6 = [(DMDEventSubscriptionRegistrationController *)self eventStreamByEventType];
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100049408;
      v10[3] = &unk_1000CB0C0;
      v10[4] = self;
      [v6 enumerateKeysAndObjectsUsingBlock:v10];
    }
  }
}

- (id)eventStatusesSinceStartDate:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = [(DMDEventSubscriptionRegistrationController *)self eventStreamByEventType];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100049608;
  v12[3] = &unk_1000CB0E8;
  id v13 = v4;
  id v7 = v5;
  id v14 = v7;
  id v8 = v4;
  [v6 enumerateKeysAndObjectsUsingBlock:v12];

  id v9 = v14;
  id v10 = v7;

  return v10;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)organizationIdentifier
{
  return self->_organizationIdentifier;
}

- (NSString)payloadIdentifier
{
  return self->_payloadIdentifier;
}

- (DMDEventReportingSchedule)schedule
{
  return self->_schedule;
}

- (NSMutableDictionary)eventStreamByEventType
{
  return self->_eventStreamByEventType;
}

- (void)setEventStreamByEventType:(id)a3
{
}

- (id)streamEventsHandler
{
  return self->_streamEventsHandler;
}

- (NSDate)lastDateScheduleElapsed
{
  return self->_lastDateScheduleElapsed;
}

- (void)setLastDateScheduleElapsed:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastDateScheduleElapsed, 0);
  objc_storeStrong(&self->_streamEventsHandler, 0);
  objc_storeStrong((id *)&self->_eventStreamByEventType, 0);
  objc_storeStrong((id *)&self->_schedule, 0);
  objc_storeStrong((id *)&self->_payloadIdentifier, 0);
  objc_storeStrong((id *)&self->_organizationIdentifier, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end