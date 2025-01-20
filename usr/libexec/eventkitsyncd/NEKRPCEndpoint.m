@interface NEKRPCEndpoint
- (BOOL)_calendarItem:(id)a3 snoozeAlarmID:(id)a4 withTimeIntervalFromNow:(double)a5;
- (BOOL)_disableMutation;
- (NEKRPCEndpoint)initWithReminderKitEnabled:(BOOL)a3 clientName:(id)a4;
- (void)_recvDeleteEventEndpoint:(id)a3;
- (void)_recvSetEventKitAlarmSnoozeEndpoint:(id)a3;
- (void)_recvSetEventKitReminderCompletedEndpoint:(id)a3;
- (void)_recvSetParticipantStatusEndpoint:(id)a3;
- (void)_recvSetReminderKitAlarmSnoozeEndpoint:(id)a3;
- (void)_recvSetReminderKitReminderCompletedEndpoint:(id)a3;
@end

@implementation NEKRPCEndpoint

- (NEKRPCEndpoint)initWithReminderKitEnabled:(BOOL)a3 clientName:(id)a4
{
  v31.receiver = self;
  v31.super_class = (Class)NEKRPCEndpoint;
  v5 = [(NEKRPCEndpoint *)&v31 init];
  if (v5)
  {
    uint64_t v6 = +[NDTLog facilityWithSubsystem:@"com.apple.eventkitsync" category:@"backchannel"];
    messageLogging = v5->_messageLogging;
    v5->_messageLogging = (NDTLogFacility *)v6;

    v8 = [[NDTMessaging alloc] initWithIDSServiceName:@"com.apple.private.alloy.eventkitmutation" logging:v5->_messageLogging];
    messaging = v5->_messaging;
    v5->_messaging = v8;

    v10 = v5->_messaging;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1000283CC;
    v28[3] = &unk_1000A9330;
    BOOL v30 = a3;
    v11 = v5;
    v29 = v11;
    [(NDTMessaging *)v10 registerMessageType:@"setRemCom" handler:v28];
    v12 = v5->_messaging;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000283E4;
    v26[3] = &unk_1000A9358;
    v13 = v11;
    v27 = v13;
    [(NDTMessaging *)v12 registerMessageType:@"setParStt" handler:v26];
    v14 = v5->_messaging;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000283F0;
    v23[3] = &unk_1000A9330;
    BOOL v25 = a3;
    v15 = v13;
    v24 = v15;
    [(NDTMessaging *)v14 registerMessageType:@"setAlmSno" handler:v23];
    v16 = v5->_messaging;
    v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472;
    v20 = sub_100028408;
    v21 = &unk_1000A9358;
    v22 = v15;
    [(NDTMessaging *)v16 registerMessageType:@"deleEvent" handler:&v18];
    -[NDTMessaging setCloudFallback:](v5->_messaging, "setCloudFallback:", 1, v18, v19, v20, v21);
    [(NDTMessaging *)v5->_messaging resume];
  }
  return v5;
}

- (BOOL)_disableMutation
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"internal_disablePhoneMutator", @"com.apple.EventKitSync", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v3 = AppBooleanValue == 0;
  }
  else {
    BOOL v3 = 1;
  }
  return !v3;
}

- (void)_recvSetParticipantStatusEndpoint:(id)a3
{
  id v5 = a3;
  if ([(NEKRPCEndpoint *)self _disableMutation])
  {
    uint64_t v6 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "_recvSetParticipantStatusEndpoint ignored", buf, 2u);
    }
  }
  else
  {
    v7 = [NEKPBProtoBuffMessage alloc];
    v8 = [v5 data];
    v9 = [(NEKPBProtoBuffMessage *)v7 initWithData:v8];

    if ([(NEKPBProtoBuffMessage *)v9 hasSetParticipantStatus])
    {
      v10 = [(NEKPBProtoBuffMessage *)v9 setParticipantStatus];
      v11 = NSStringFromSelector(a2);
      v12 = +[EKEventStore eks_eventOnlyStoreFor:v11];

      v13 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = v13;
        v15 = [v12 eventStoreIdentifier];
        v16 = [v10 storeIdentifier];
        *(_DWORD *)buf = 138412546;
        id v29 = v15;
        __int16 v30 = 2112;
        objc_super v31 = v16;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Local store ID %@, remote store ID %@", buf, 0x16u);
      }
      v17 = [v10 itemIdentifier];
      v18 = [v12 eventWithIdentifier:v17];

      uint64_t v19 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = v19;
        v21 = [v10 itemIdentifier];
        *(_DWORD *)buf = 138412546;
        id v29 = v21;
        __int16 v30 = 2048;
        objc_super v31 = v18;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "itemIdentifier: %@, event: <%p>", buf, 0x16u);
      }
      unsigned int v22 = [v10 status];
      if ([v18 participationStatus] != (id)v22)
      {
        [v18 setParticipationStatus:[v10 status]];
        [v18 setInvitationStatus:0];
        v23 = [v18 eventStore];
        id v27 = 0;
        unsigned __int8 v24 = [v23 saveEvent:v18 span:[v10 span] error:&v27];
        id v25 = v27;

        if ((v24 & 1) == 0)
        {
          v26 = *(NSObject **)(qword_1000C6CA8 + 8);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v29 = v25;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Failure to save event: %{public}@", buf, 0xCu);
          }
        }
      }
    }
    else if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR))
    {
      sub_10006DE34();
    }
  }
}

- (void)_recvSetEventKitReminderCompletedEndpoint:(id)a3
{
  id v5 = a3;
  uint64_t v6 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v26 = "NEKRPCEndpoint.m";
    __int16 v27 = 1024;
    int v28 = 308;
    __int16 v29 = 2080;
    __int16 v30 = "-[NEKRPCEndpoint _recvSetEventKitReminderCompletedEndpoint:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}s:%d %s --mark--", buf, 0x1Cu);
  }
  if ([(NEKRPCEndpoint *)self _disableMutation])
  {
    v7 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "_recvSetEventKitReminderCompletedEndpoint ignored", buf, 2u);
    }
  }
  else
  {
    v8 = [NEKPBProtoBuffMessage alloc];
    v9 = [v5 data];
    v10 = [(NEKPBProtoBuffMessage *)v8 initWithData:v9];

    if ([(NEKPBProtoBuffMessage *)v10 hasSetReminderComplete])
    {
      v11 = [(NEKPBProtoBuffMessage *)v10 setReminderComplete];
      v12 = NSStringFromSelector(a2);
      v13 = +[EKEventStore eks_eventOnlyStoreFor:v12];

      v14 = [v11 calendarName];
      v15 = [v11 reminderTitle];
      v16 = [v11 externalIdentifier];
      v17 = sub_100028BB4(v13, v14, v15, v16);

      if (v17)
      {
        sub_100028FB0(v17);
        v18 = [v17 completionDate];
        BOOL v19 = v18 == 0;

        if (((v19 ^ [v11 isComplete]) & 1) == 0)
        {
          [v17 setCompleted:[v11 isComplete]];
          id v24 = 0;
          unsigned __int8 v20 = [v13 saveReminder:v17 error:&v24];
          id v21 = v24;
          unsigned int v22 = *(NSObject **)(qword_1000C6CA8 + 8);
          if (v20)
          {
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Reminder saved successfully.", buf, 2u);
            }
          }
          else if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            sub_10006DF38();
          }
        }
      }
      else
      {
        v23 = *(NSObject **)(qword_1000C6CA8 + 8);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          sub_10006DE68(v23);
        }
      }
    }
    else if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR))
    {
      sub_10006DE34();
    }
  }
}

- (void)_recvSetReminderKitReminderCompletedEndpoint:(id)a3
{
  id v4 = a3;
  id v5 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    __int16 v27 = "NEKRPCEndpoint.m";
    __int16 v28 = 1024;
    int v29 = 350;
    __int16 v30 = 2080;
    objc_super v31 = "-[NEKRPCEndpoint _recvSetReminderKitReminderCompletedEndpoint:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s:%d %s --mark--", buf, 0x1Cu);
  }
  if ([(NEKRPCEndpoint *)self _disableMutation])
  {
    uint64_t v6 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "_recvSetReminderKitReminderCompletedEndpoint ignored", buf, 2u);
    }
  }
  else
  {
    v7 = [NEKPBProtoBuffMessage alloc];
    v8 = [v4 data];
    v9 = [(NEKPBProtoBuffMessage *)v7 initWithData:v8];

    if ([(NEKPBProtoBuffMessage *)v9 hasSetReminderComplete])
    {
      v10 = [(NEKPBProtoBuffMessage *)v9 setReminderComplete];
      id v11 = objc_alloc_init((Class)REMStore);
      v12 = [v10 externalIdentifier];
      id v25 = 0;
      v13 = [v11 fetchReminderWithExternalIdentifier:v12 inList:0 error:&v25];
      id v14 = v25;

      if (v13)
      {
        id v23 = v14;
        id v15 = [objc_alloc((Class)REMSaveRequest) initWithStore:v11];
        [v15 setAuthor:self->_clientName];
        v16 = [v15 updateReminder:v13];
        sub_100028FB0(v16);
        unsigned int v17 = [v13 isCompleted];
        if (v17 != [v10 isComplete])
        {
          [v16 setCompleted:[v10 isComplete]];
          id v24 = 0;
          unsigned __int8 v18 = [v15 saveSynchronouslyWithError:&v24];
          id v22 = v24;
          BOOL v19 = *(NSObject **)(qword_1000C6CA8 + 8);
          if (v18)
          {
            unsigned __int8 v20 = v22;
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Reminder saved successfully.", buf, 2u);
            }
          }
          else
          {
            unsigned __int8 v20 = v22;
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
              sub_10006DF38();
            }
          }
        }
        id v14 = v23;
      }
      else
      {
        id v21 = *(NSObject **)(qword_1000C6CA8 + 8);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          sub_10006DE68(v21);
        }
      }
    }
    else if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR))
    {
      sub_10006DE34();
    }
  }
}

- (void)_recvDeleteEventEndpoint:(id)a3
{
  id v5 = a3;
  uint64_t v6 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v56 = "NEKRPCEndpoint.m";
    __int16 v57 = 1024;
    int v58 = 400;
    __int16 v59 = 2080;
    v60 = "-[NEKRPCEndpoint _recvDeleteEventEndpoint:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}s:%d %s --mark--", buf, 0x1Cu);
  }
  if ([(NEKRPCEndpoint *)self _disableMutation])
  {
    v7 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "_recvDeleteEventEndpoint ignored", buf, 2u);
    }
  }
  else
  {
    v8 = [NEKPBProtoBuffMessage alloc];
    v9 = [v5 data];
    v10 = [(NEKPBProtoBuffMessage *)v8 initWithData:v9];

    if ([(NEKPBProtoBuffMessage *)v10 hasDeleteEvent])
    {
      id v11 = NSStringFromSelector(a2);
      v12 = +[EKEventStore eks_eventOnlyStoreFor:v11];

      v13 = [(NEKPBProtoBuffMessage *)v10 deleteEvent];
      [v13 eventStart];
      id v14 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:");

      v41 = [v14 dateByAddingTimeInterval:604800.0];
      v42 = v14;
      uint64_t v15 = [v12 predicateForEventsWithStartDate:v14];
      v16 = objc_opt_new();
      v51[0] = _NSConcreteStackBlock;
      v51[1] = 3221225472;
      v51[2] = sub_100029920;
      v51[3] = &unk_1000A9380;
      v45 = v10;
      v52 = v45;
      id v17 = v16;
      id v53 = v17;
      v40 = (void *)v15;
      [v12 enumerateEventsMatchingPredicate:v15 usingBlock:v51];
      id v18 = v17;
      v43 = v18;
      if ((unint64_t)[v18 count] >= 2)
      {
        v37 = v12;
        v38 = v10;
        id v39 = v5;
        v44 = objc_opt_new();
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        id v19 = v18;
        id v20 = [v19 countByEnumeratingWithState:&v47 objects:v54 count:16];
        if (v20)
        {
          id v21 = v20;
          uint64_t v22 = *(void *)v48;
          do
          {
            for (i = 0; i != v21; i = (char *)i + 1)
            {
              if (*(void *)v48 != v22) {
                objc_enumerationMutation(v19);
              }
              id v24 = *(void **)(*((void *)&v47 + 1) + 8 * i);
              id v25 = [v24 calendar:v37:v38:v39];
              v26 = [v25 title];
              __int16 v27 = [(NEKPBProtoBuffMessage *)v45 deleteEvent];
              __int16 v28 = [v27 calendarTitle];
              unsigned int v29 = [v26 isEqual:v28];

              if (v29) {
                [v44 addObject:v24];
              }
            }
            id v21 = [v19 countByEnumeratingWithState:&v47 objects:v54 count:16];
          }
          while (v21);
        }

        v10 = v38;
        id v5 = v39;
        v12 = v37;
        id v18 = v44;
      }
      if (objc_msgSend(v18, "count", v37, v38, v39) == (id)1)
      {
        __int16 v30 = v18;
        objc_super v31 = [v18 objectAtIndexedSubscript:0];
        v32 = [(NEKPBProtoBuffMessage *)v45 deleteEvent];
        id v46 = 0;
        unsigned __int8 v33 = [v12 removeEvent:v31 span:[v32 span] error:&v46];
        id v34 = v46;

        if ((v33 & 1) == 0)
        {
          if (v34)
          {
            v35 = *(NSObject **)(qword_1000C6CA8 + 8);
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
              sub_10006E014(v35, v45, (uint64_t)v34);
            }
          }
        }
      }
      else
      {
        __int16 v30 = v18;
        v36 = *(NSObject **)(qword_1000C6CA8 + 8);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
          sub_10006E0E0(v36, v18);
        }
      }
    }
    else if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR))
    {
      sub_10006DE34();
    }
  }
}

- (BOOL)_calendarItem:(id)a3 snoozeAlarmID:(id)a4 withTimeIntervalFromNow:(double)a5
{
  id v7 = a3;
  id v8 = a4;
  [v7 alarms];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v14 = [v13 externalID:v17];
        unsigned int v15 = [v14 isEqualToString:v8];

        if (v15)
        {
          [v7 snoozeAlarm:v13 withTimeIntervalFromNow:a5];
          LOBYTE(v10) = 1;
          goto LABEL_11;
        }
      }
      id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v10;
}

- (void)_recvSetEventKitAlarmSnoozeEndpoint:(id)a3
{
  id v5 = a3;
  if (![(NEKRPCEndpoint *)self _disableMutation])
  {
    id v7 = [NEKPBProtoBuffMessage alloc];
    id v8 = [v5 data];
    id v9 = [(NEKPBProtoBuffMessage *)v7 initWithData:v8];

    if (![(NEKPBProtoBuffMessage *)v9 hasSetAlarmSnooze])
    {
      if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR)) {
        sub_10006DE34();
      }
      goto LABEL_38;
    }
    id v10 = [(NEKPBProtoBuffMessage *)v9 setAlarmSnooze];
    uint64_t v11 = NSStringFromSelector(a2);
    v12 = +[EKEventStore eks_eventOnlyStoreFor:v11];

    if ([v10 hasCalendarName] && objc_msgSend(v10, "hasReminderTitle"))
    {
      v13 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        log = v13;
        [v10 snoozeAmount];
        uint64_t v15 = v14;
        v16 = [v10 calendarName];
        sub_10002D3E0(v16);
        os_log_t v42 = (os_log_t)objc_claimAutoreleasedReturnValue();
        long long v17 = [v10 reminderTitle];
        long long v18 = sub_10002D3E0(v17);
        long long v19 = [v10 externalIdentifier];
        *(_DWORD *)buf = 134218754;
        uint64_t v49 = v15;
        __int16 v50 = 2114;
        os_log_t v51 = v42;
        __int16 v52 = 2114;
        id v53 = v18;
        __int16 v54 = 2112;
        v55 = v19;
        _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Snooze Reminder: time:%.1f calendar: '%{public}@' reminder: '%{public}@' externalId: %@", buf, 0x2Au);
      }
      long long v20 = [v10 calendarName];
      id v21 = [v10 reminderTitle];
      uint64_t v22 = [v10 externalIdentifier];
      id v23 = sub_100028BB4(v12, v20, v21, v22);

      if (!v23)
      {
        v40 = *(NSObject **)(qword_1000C6CA8 + 8);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
          sub_10006DE68(v40);
        }
        goto LABEL_36;
      }
      sub_100028FB0(v23);
      id v24 = [v10 alarmIdentifier];
      [v10 snoozeAmount];
      unsigned int v25 = -[NEKRPCEndpoint _calendarItem:snoozeAlarmID:withTimeIntervalFromNow:](self, "_calendarItem:snoozeAlarmID:withTimeIntervalFromNow:", v23, v24);

      if (!v25)
      {
        if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR)) {
          sub_10006E17C();
        }
        goto LABEL_36;
      }
      id v47 = 0;
      unsigned __int8 v26 = [v12 saveReminder:v23 error:&v47];
      id v27 = v47;
      __int16 v28 = *(NSObject **)(qword_1000C6CA8 + 8);
      if ((v26 & 1) == 0)
      {
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          sub_10006DF38();
        }
        goto LABEL_35;
      }
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        unsigned int v29 = "Reminder saved successfully.";
LABEL_24:
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, v29, buf, 2u);
      }
    }
    else
    {
      if (![v10 hasItemIdentifier]
        || ![v10 hasStoreIdentifier])
      {
        goto LABEL_37;
      }
      __int16 v30 = [v10 itemIdentifier];
      id v23 = [v12 eventWithIdentifier:v30];

      objc_super v31 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v43 = v31;
        [v10 snoozeAmount];
        uint64_t v33 = v32;
        os_log_t loga = [v10 calendarName];
        v41 = sub_10002D3E0(loga);
        id v34 = [v10 itemIdentifier];
        v35 = [v12 eventStoreIdentifier];
        v36 = [v10 storeIdentifier];
        *(_DWORD *)buf = 134219266;
        uint64_t v49 = v33;
        __int16 v50 = 2114;
        os_log_t v51 = v41;
        __int16 v52 = 2112;
        id v53 = v34;
        __int16 v54 = 2048;
        v55 = v23;
        __int16 v56 = 2112;
        __int16 v57 = v35;
        __int16 v58 = 2112;
        __int16 v59 = v36;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Snooze Event: time:%.1f calendar: '%{public}@' itemIdentifier: %@ event: <%p> local store ID: %@, remote store ID: %@", buf, 0x3Eu);
      }
      v37 = [v10 alarmIdentifier];
      [v10 snoozeAmount];
      unsigned int v38 = -[NEKRPCEndpoint _calendarItem:snoozeAlarmID:withTimeIntervalFromNow:](self, "_calendarItem:snoozeAlarmID:withTimeIntervalFromNow:", v23, v37);

      if (!v38)
      {
        if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR)) {
          sub_10006E218();
        }
        goto LABEL_36;
      }
      id v46 = 0;
      unsigned __int8 v39 = [v12 saveEvent:v23 span:2 error:&v46];
      id v27 = v46;
      __int16 v28 = *(NSObject **)(qword_1000C6CA8 + 8);
      if ((v39 & 1) == 0)
      {
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          sub_10006E1B0();
        }
        goto LABEL_35;
      }
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        unsigned int v29 = "Event saved successfully.";
        goto LABEL_24;
      }
    }
LABEL_35:

LABEL_36:
LABEL_37:

LABEL_38:
    goto LABEL_39;
  }
  uint64_t v6 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "_recvSetEventKitAlarmSnoozeEndpoint ignored", buf, 2u);
  }
LABEL_39:
}

- (void)_recvSetReminderKitAlarmSnoozeEndpoint:(id)a3
{
  id v5 = a3;
  if (![(NEKRPCEndpoint *)self _disableMutation])
  {
    id v7 = [NEKPBProtoBuffMessage alloc];
    id v8 = [v5 data];
    id v9 = [(NEKPBProtoBuffMessage *)v7 initWithData:v8];

    if (![(NEKPBProtoBuffMessage *)v9 hasSetAlarmSnooze])
    {
      if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR)) {
        sub_10006DE34();
      }
      goto LABEL_37;
    }
    id v10 = [(NEKPBProtoBuffMessage *)v9 setAlarmSnooze];
    if ([v10 hasCalendarName] && objc_msgSend(v10, "hasReminderTitle"))
    {
      id v11 = objc_alloc_init((Class)REMStore);
      v12 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = v12;
        [v10 snoozeAmount];
        uint64_t v15 = v14;
        v16 = [v10 calendarName];
        long long v17 = sub_10002D3E0(v16);
        long long v18 = [v10 reminderTitle];
        sub_10002D3E0(v18);
        long long v19 = v47 = v11;
        long long v20 = [v10 externalIdentifier];
        *(_DWORD *)buf = 134218754;
        uint64_t v52 = v15;
        __int16 v53 = 2114;
        __int16 v54 = v17;
        __int16 v55 = 2114;
        __int16 v56 = v19;
        __int16 v57 = 2112;
        __int16 v58 = v20;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Snooze Reminder: time:%.1f calendar: '%{public}@' reminder: '%{public}@' externalId: %@", buf, 0x2Au);

        id v11 = v47;
      }
      id v21 = [v10 externalIdentifier];
      id v50 = 0;
      uint64_t v22 = [v11 fetchReminderWithExternalIdentifier:v21 inList:0 error:&v50];
      id v23 = v50;

      if (v22)
      {
        id v24 = [objc_alloc((Class)REMSaveRequest) initWithStore:v11];
        [v24 setAuthor:self->_clientName];
        unsigned int v25 = [v24 updateReminder:v22];
        sub_100028FB0(v25);
        [v10 snoozeAmount];
        [v25 snoozeFromNowForTimeInterval:];
        id v49 = v23;
        unsigned __int8 v26 = [v24 saveSynchronouslyWithError:&v49];
        id v27 = v49;

        __int16 v28 = *(NSObject **)(qword_1000C6CA8 + 8);
        if (v26)
        {
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Reminder saved successfully.", buf, 2u);
          }
        }
        else if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          sub_10006DF38();
        }
      }
      else
      {
        v44 = *(NSObject **)(qword_1000C6CA8 + 8);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
          sub_10006DE68(v44);
        }
        id v27 = v23;
      }
    }
    else
    {
      if (![v10 hasItemIdentifier]
        || ![v10 hasStoreIdentifier])
      {
        goto LABEL_36;
      }
      unsigned int v29 = NSStringFromSelector(a2);
      id v27 = +[EKEventStore eks_eventOnlyStoreFor:v29];

      __int16 v30 = [v10 itemIdentifier];
      id v11 = [v27 eventWithIdentifier:v30];

      objc_super v31 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        log = v31;
        [v10 snoozeAmount];
        uint64_t v33 = v32;
        id v46 = [v10 calendarName];
        id v34 = sub_10002D3E0(v46);
        [v10 itemIdentifier];
        v36 = id v35 = v11;
        v37 = [v27 eventStoreIdentifier];
        unsigned int v38 = [v10 storeIdentifier];
        *(_DWORD *)buf = 134219266;
        uint64_t v52 = v33;
        __int16 v53 = 2114;
        __int16 v54 = v34;
        __int16 v55 = 2112;
        __int16 v56 = v36;
        __int16 v57 = 2048;
        __int16 v58 = v35;
        __int16 v59 = 2112;
        v60 = v37;
        __int16 v61 = 2112;
        v62 = v38;
        _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Snooze Event: time:%.1f calendar: '%{public}@' itemIdentifier: %@ event: <%p> local store ID: %@, remote store ID: %@", buf, 0x3Eu);

        id v11 = v35;
      }
      unsigned __int8 v39 = [v10 alarmIdentifier];
      [v10 snoozeAmount];
      unsigned int v40 = -[NEKRPCEndpoint _calendarItem:snoozeAlarmID:withTimeIntervalFromNow:](self, "_calendarItem:snoozeAlarmID:withTimeIntervalFromNow:", v11, v39);

      if (v40)
      {
        id v48 = 0;
        unsigned __int8 v41 = [v27 saveEvent:v11 span:2 error:&v48];
        id v42 = v48;
        v43 = *(NSObject **)(qword_1000C6CA8 + 8);
        if (v41)
        {
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Event saved successfully.", buf, 2u);
          }
        }
        else if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          sub_10006E1B0();
        }
      }
      else if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR))
      {
        sub_10006E218();
      }
    }

LABEL_36:
LABEL_37:

    goto LABEL_38;
  }
  uint64_t v6 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "_recvSetReminderKitAlarmSnoozeEndpoint ignored", buf, 2u);
  }
LABEL_38:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageLogging, 0);
  objc_storeStrong((id *)&self->_messaging, 0);

  objc_storeStrong((id *)&self->_clientName, 0);
}

@end