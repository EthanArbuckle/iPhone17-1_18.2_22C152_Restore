@interface CDServiceManager
+ (id)sharedInstance;
- (CDDataMigrator)dataMigrator;
- (CDKnowledgeDaemon)knowledgeDaemon;
- (CDPeopleDaemon)peopleDaemon;
- (CDServiceManager)init;
- (_CDSpotlightItemRecorder)spotlightRecorder;
- (void)setupServices;
@end

@implementation CDServiceManager

+ (id)sharedInstance
{
  if (qword_100040E98 != -1) {
    dispatch_once(&qword_100040E98, &stru_100038990);
  }
  v2 = (void *)qword_100040E90;

  return v2;
}

- (CDServiceManager)init
{
  v3 = +[_CDLogging knowledgeSignpost];
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CDServiceManagerInit", " enableTelemetry=YES ", buf, 2u);
  }

  v22.receiver = self;
  v22.super_class = (Class)CDServiceManager;
  v4 = [(CDServiceManager *)&v22 init];
  if (v4)
  {
    uint64_t v5 = +[CDDataMigrator sharedInstance];
    dataMigrator = v4->_dataMigrator;
    v4->_dataMigrator = (CDDataMigrator *)v5;

    uint64_t v7 = +[CDKnowledgeDaemon defaultDaemon];
    knowledgeDaemon = v4->_knowledgeDaemon;
    v4->_knowledgeDaemon = (CDKnowledgeDaemon *)v7;

    v9 = [CDPeopleDaemon alloc];
    v10 = [(CDKnowledgeDaemon *)v4->_knowledgeDaemon storage];
    v11 = [(CDPeopleDaemon *)v9 initWithKnowledgeStore:v10];
    peopleDaemon = v4->_peopleDaemon;
    v4->_peopleDaemon = v11;

    v13 = [(CDKnowledgeDaemon *)v4->_knowledgeDaemon storage];
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    v16 = +[_DKKnowledgeStorage storageWithShallowCopyFromStorage:v13 clientIdentifier:v15];

    v17 = [(CDPeopleDaemon *)v4->_peopleDaemon store];
    uint64_t v18 = +[_CDSpotlightItemRecorder spotlightItemRecorderWithInteractionRecorder:v17 knowledgeStore:v16];
    spotlightRecorder = v4->_spotlightRecorder;
    v4->_spotlightRecorder = (_CDSpotlightItemRecorder *)v18;

    [(CDServiceManager *)v4 setupServices];
  }
  v20 = +[_CDLogging knowledgeSignpost];
  if (os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CDServiceManagerInit", "", buf, 2u);
  }

  return v4;
}

- (void)setupServices
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100021D2C();
  }
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_1000389D0);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100021CE4();
  }
  xpc_set_event_stream_handler("com.apple.distnoted.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_1000389F0);
}

- (CDKnowledgeDaemon)knowledgeDaemon
{
  return self->_knowledgeDaemon;
}

- (CDPeopleDaemon)peopleDaemon
{
  return self->_peopleDaemon;
}

- (_CDSpotlightItemRecorder)spotlightRecorder
{
  return self->_spotlightRecorder;
}

- (CDDataMigrator)dataMigrator
{
  return self->_dataMigrator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataMigrator, 0);
  objc_storeStrong((id *)&self->_spotlightRecorder, 0);
  objc_storeStrong((id *)&self->_peopleDaemon, 0);

  objc_storeStrong((id *)&self->_knowledgeDaemon, 0);
}

@end