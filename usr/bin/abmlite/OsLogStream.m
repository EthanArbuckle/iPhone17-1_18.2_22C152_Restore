@interface OsLogStream
+ (BOOL)putOsLogStreamToFile:(id)a3 process:(id)a4 imagePath:(id)a5 history:(double)a6;
@end

@implementation OsLogStream

+ (BOOL)putOsLogStreamToFile:(id)a3 process:(id)a4 imagePath:(id)a5 history:(double)a6
{
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3052000000;
  v46 = sub_1000053E4;
  v47 = sub_1000053F4;
  uint64_t v48 = 0;
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_100005400;
  v42[3] = &unk_100020670;
  v42[4] = &v43;
  [+[OSLogEventStore localStore](OSLogEventStore, "localStore") prepareWithCompletionHandler:v42];
  if (!v44[5])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to prepare oslog stream", buf, 2u);
    }
    BOOL v27 = 0;
    goto LABEL_29;
  }
  [+[NSFileManager defaultManager] createFileAtPath:a3 contents:0 attributes:0];
  v11 = +[NSFileHandle fileHandleForWritingAtPath:a3];
  if (!v11)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      id v30 = [a3 UTF8String];
      *(_DWORD *)buf = 136315138;
      double v52 = *(double *)&v30;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to create file: %s", buf, 0xCu);
    }

    goto LABEL_36;
  }
  dispatch_group_t v12 = dispatch_group_create();
  if (!v12)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to get group", buf, 2u);
    }
    [(NSFileHandle *)v11 closeFile];

LABEL_36:
    char v28 = 0;
    BOOL v27 = 0;
    goto LABEL_37;
  }
  v13 = v12;
  [(id)v44[5] setFlags:21];
  v31 = v10;
  id v14 = +[NSMutableArray array];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v15 = [a4 countByEnumeratingWithState:&v38 objects:v50 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v39;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v39 != v16) {
          objc_enumerationMutation(a4);
        }
        [v14 addObject:+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", @"process == %@", *(void *)(*((void *)&v38 + 1) + 8 * i))];
      }
      id v15 = [a4 countByEnumeratingWithState:&v38 objects:v50 count:16];
    }
    while (v15);
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v18 = [a5 countByEnumeratingWithState:&v34 objects:v49 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v35;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v35 != v19) {
          objc_enumerationMutation(a5);
        }
        [v14 addObject:+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", @"senderImagePath CONTAINS[cd] %@", *(void *)(*((void *)&v34 + 1) + 8 * (void)j))];
      }
      id v18 = [a5 countByEnumeratingWithState:&v34 objects:v49 count:16];
    }
    while (v18);
  }
  if ([v14 count])
  {
    v21 = +[NSCompoundPredicate orPredicateWithSubpredicates:v14];
    [(id)v44[5] setFilterPredicate:v21];
  }
  v22 = (void *)v44[5];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_1000054E4;
  v33[3] = &unk_100020698;
  v33[4] = v11;
  [v22 setEventHandler:v33];
  v23 = (void *)v44[5];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100005668;
  v32[3] = &unk_1000206C0;
  v32[4] = v13;
  [v23 setInvalidationHandler:v32];
  v10 = v31;
  v24 = [+[NSDate dateWithTimeIntervalSinceReferenceDate:CFAbsoluteTimeGetCurrent()] dateByAddingTimeInterval:-a6];
  dispatch_group_enter(v13);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    double v52 = a6;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Getting oslog stream: history = %f", buf, 0xCu);
  }
  [(id)v44[5] activateStreamFromDate:v24];
  dispatch_time_t v25 = dispatch_time(0, 180000000000);
  intptr_t v26 = dispatch_group_wait(v13, v25);
  BOOL v27 = v26 == 0;
  if (v26)
  {
    [(id)v44[5] invalidate];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Timeout on getting oslog stream", buf, 2u);
    }
  }
  dispatch_release(v13);
  [(NSFileHandle *)v11 closeFile];

LABEL_29:
  char v28 = 1;
LABEL_37:
  _Block_object_dispose(&v43, 8);
  return v28 & v27;
}

@end