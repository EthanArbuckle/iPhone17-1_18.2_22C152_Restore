@interface STConcretePrimitiveBackgroundActivitySchedulerProvider
- (id)createSchedulerRegisteredForTypes:(id)a3 schedulerDelegate:(id)a4;
@end

@implementation STConcretePrimitiveBackgroundActivitySchedulerProvider

- (id)createSchedulerRegisteredForTypes:(id)a3 schedulerDelegate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  [v7 setDelegate:v6];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v14 = +[STLog backgroundActivity];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          id v15 = [v13 integerValue];
          CFStringRef v16 = &stru_10030A6D8;
          if ((unint64_t)v15 <= 3) {
            CFStringRef v16 = *(&off_1002FBC98 + (void)v15);
          }
          *(_DWORD *)buf = 138412290;
          CFStringRef v23 = v16;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Checking in for background activity of type: %@", buf, 0xCu);
        }

        objc_msgSend(v7, "scheduleBackgroundActivityOfType:interval:", objc_msgSend(v13, "integerValue"), &off_10030FE78);
      }
      id v10 = [v8 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v10);
  }

  return v7;
}

@end