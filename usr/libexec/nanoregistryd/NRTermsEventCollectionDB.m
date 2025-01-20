@interface NRTermsEventCollectionDB
+ (BOOL)deviceUnlocked;
+ (NRTermsEventCollectionDB)sharedInstance;
+ (id)pathToTermsEventLog;
- (NRTermsEventCollection)events;
- (id)reverseObjectEnumerator;
- (void)addEvent:(id)a3;
- (void)loadEvents;
- (void)saveEvents;
- (void)setEvents:(id)a3;
@end

@implementation NRTermsEventCollectionDB

+ (NRTermsEventCollectionDB)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A220C;
  block[3] = &unk_100165618;
  block[4] = a1;
  if (qword_1001A12D0 != -1) {
    dispatch_once(&qword_1001A12D0, block);
  }
  v2 = (void *)qword_1001A12D8;

  return (NRTermsEventCollectionDB *)v2;
}

+ (id)pathToTermsEventLog
{
  v2 = +[NRDataFilePaths pathToNanoRegistryStateDirectory];
  v3 = +[NSURL fileURLWithPath:v2];

  v4 = [v3 URLByAppendingPathComponent:@"termsEventLog"];

  return v4;
}

+ (BOOL)deviceUnlocked
{
  CFStringRef v5 = @"ExtendedDeviceLockState";
  v6 = &__kCFBooleanTrue;
  +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  unsigned int v2 = MKBGetDeviceLockState();
  return (v2 < 8) & (0x89u >> v2);
}

- (void)addEvent:(id)a3
{
}

- (void)loadEvents
{
  v3 = +[NRTermsEventCollectionDB pathToTermsEventLog];
  v4 = [v3 path];
  id v48 = 0;
  CFStringRef v5 = +[NSData dataWithContentsOfFile:v4 options:0 error:&v48];
  id v6 = v48;

  if (v6)
  {
    v7 = [v6 domain];
    if ([NSCocoaErrorDomain isEqual:v7])
    {
      id v8 = [v6 code];

      if (v8 == (id)260)
      {
        v9 = [v6 userInfo];
        v10 = [v9 objectForKeyedSubscript:NSUnderlyingErrorKey];

        v11 = [v10 domain];
        if ([NSPOSIXErrorDomain isEqual:v11])
        {
          id v12 = [v10 code];

          if (v12 == (id)2)
          {
            v13 = nr_daemon_log();
            BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

            if (v14)
            {
              v15 = nr_daemon_log();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "NRTermsAcknowledgementRegistryService: Creating new NRTermsEventCollection", buf, 2u);
              }
            }
            v16 = (NRTermsEventCollection *)objc_opt_new();
            events = self->_events;
            self->_events = v16;

            goto LABEL_38;
          }
        }
        else
        {
        }
      }
    }
    else
    {
    }
    id v19 = v6;
LABEL_42:
    objc_exception_throw(v19);
  }
  id v46 = 0;
  v18 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v46];
  id v19 = v46;
  if (v19) {
    goto LABEL_42;
  }
  unsigned __int8 v20 = [(NRTermsEventCollection *)v18 termsTextCleared];
  v21 = nr_daemon_log();
  BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);

  if (v20)
  {
    if (v22)
    {
      v23 = nr_daemon_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Terms text cleared already. skipping.", buf, 2u);
      }
    }
    v24 = self->_events;
    self->_events = v18;
  }
  else
  {
    v41 = self;
    if (v22)
    {
      v25 = nr_daemon_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Clearing terms text from terms event log", buf, 2u);
      }
    }
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v26 = [(NRTermsEventCollection *)v18 events];
    id v27 = [v26 countByEnumeratingWithState:&v42 objects:v49 count:16];
    if (v27)
    {
      id v28 = v27;
      uint64_t v29 = *(void *)v43;
      do
      {
        for (i = 0; i != v28; i = (char *)i + 1)
        {
          if (*(void *)v43 != v29) {
            objc_enumerationMutation(v26);
          }
          v31 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          if ([v31 hasTermsText])
          {
            v33 = [v31 termsDigest];

            if (!v33)
            {
              v34 = nr_daemon_log();
              BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);

              if (v35)
              {
                v36 = nr_daemon_log();
                if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Adding terms digest before saving", buf, 2u);
                }
              }
              v37 = [v31 termsText];
              v38 = +[NRTermsEvent digestFromData:v37];
              [v31 setTermsDigest:v38];
            }
            [v31 saveEventTextToFileIfNeeded];
            [v31 setWritable:1];
            [v31 setTermsText:0];
            [v31 setWritable:0];
            [(NRTermsEventCollection *)v18 setDirty:1];
          }
        }
        id v28 = [v26 countByEnumeratingWithState:&v42 objects:v49 count:16];
      }
      while (v28);
    }

    [(NRTermsEventCollection *)v18 setTermsTextCleared:1];
    v39 = v41->_events;
    v41->_events = v18;

    [(NRTermsEventCollectionDB *)v41 saveEvents];
    CFStringRef v5 = v40;
  }
LABEL_38:
}

- (void)saveEvents
{
  v3 = [(NRTermsEventCollectionDB *)self events];
  unsigned int v4 = [v3 dirty];

  if (v4)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    CFStringRef v5 = self->_events;
    id v6 = [(NRTermsEventCollection *)v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v22;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if ([v10 hasTermsText])
          {
            v11 = [v10 termsDigest];

            if (!v11)
            {
              id v12 = [v10 termsText];
              v13 = +[NRTermsEvent digestFromData:v12];
              [v10 setTermsDigest:v13];
            }
          }
          [v10 setWritable:1];
          [v10 setTermsText:0];
          [v10 setWritable:0];
        }
        id v7 = [(NRTermsEventCollection *)v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v7);
    }

    events = self->_events;
    id v20 = 0;
    v15 = +[NSKeyedArchiver archivedDataWithRootObject:events requiringSecureCoding:1 error:&v20];
    id v16 = v20;
    if (!v16)
    {
      v17 = [(id)objc_opt_class() pathToTermsEventLog];
      id v19 = 0;
      [v15 writeToURL:v17 options:1073741825 error:&v19];
      id v18 = v19;

      if (!v18)
      {

        return;
      }
      id v16 = v18;
    }
    objc_exception_throw(v16);
  }
}

- (id)reverseObjectEnumerator
{
  unsigned int v2 = [(NRTermsEventCollectionDB *)self events];
  v3 = [v2 reverseObjectEnumerator];

  return v3;
}

- (NRTermsEventCollection)events
{
  events = self->_events;
  if (!events)
  {
    [(NRTermsEventCollectionDB *)self loadEvents];
    events = self->_events;
  }

  return events;
}

- (void)setEvents:(id)a3
{
}

- (void).cxx_destruct
{
}

@end