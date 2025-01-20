@interface EPScalablePipeManagerManagerFactory
+ (id)sharedPipeManagerManagerFactory;
- (EPScalablePipeManagerManagerFactory)init;
- (id)pipeManagerManagerWithName:(id)a3 type:(int64_t)a4 priority:(int64_t)a5;
@end

@implementation EPScalablePipeManagerManagerFactory

+ (id)sharedPipeManagerManagerFactory
{
  if (qword_1001A13C0 != -1) {
    dispatch_once(&qword_1001A13C0, &stru_100169488);
  }
  v2 = (void *)qword_1001A13B8;

  return v2;
}

- (EPScalablePipeManagerManagerFactory)init
{
  v6.receiver = self;
  v6.super_class = (Class)EPScalablePipeManagerManagerFactory;
  v2 = [(EPScalablePipeManagerManagerFactory *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSMapTable strongToWeakObjectsMapTable];
    pipeManagers = v2->_pipeManagers;
    v2->_pipeManagers = (NSMapTable *)v3;
  }
  return v2;
}

- (id)pipeManagerManagerWithName:(id)a3 type:(int64_t)a4 priority:(int64_t)a5
{
  id v8 = a3;
  uint64_t v9 = [(NSMapTable *)self->_pipeManagers objectForKey:v8];
  if (v9)
  {
    v10 = (EPScalablePipeManagerManager *)v9;
    v11 = sub_1000A3BC0();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

    if (!v12) {
      goto LABEL_10;
    }
    v13 = sub_1000A3BC0();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    int v18 = 134218242;
    v19 = v10;
    __int16 v20 = 2112;
    id v21 = v8;
    v14 = "EPScalablePipeManagerManagerFactory: Reusing existing EPScalablePipeManagerManager %p to manage pipe %@";
    goto LABEL_8;
  }
  v10 = [[EPScalablePipeManagerManager alloc] initWithName:v8 type:a4 priority:a5];
  [(NSMapTable *)self->_pipeManagers setObject:v10 forKey:v8];
  v15 = sub_1000A3BC0();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

  if (!v16) {
    goto LABEL_10;
  }
  v13 = sub_1000A3BC0();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 134218242;
    v19 = v10;
    __int16 v20 = 2112;
    id v21 = v8;
    v14 = "EPScalablePipeManagerManagerFactory: Created new EPScalablePipeManagerManager %p to manage pipe %@";
LABEL_8:
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v18, 0x16u);
  }
LABEL_9:

LABEL_10:

  return v10;
}

- (void).cxx_destruct
{
}

@end