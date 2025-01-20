@interface SDLogAgentContainer
+ (id)containerAtLocation:(id)a3 forTaskType:(int)a4 withTimeout:(double)a5 withDelegate:(id)a6 withMsgContents:(id)a7 withReplyBlock:(id)a8;
- (BOOL)_execute;
- (BOOL)sendHelperMessage;
- (NSDictionary)msgContents;
- (NSString)outputDir;
- (NSString)taskName;
- (OS_xpc_object)logAgentConnection;
- (OS_xpc_object)reply;
- (id)helperRepliedHandler;
- (id)replyBlock;
- (unint64_t)taskType;
- (void)setLogAgentConnection:(id)a3;
- (void)setMsgContents:(id)a3;
- (void)setOutputDir:(id)a3;
- (void)setReply:(id)a3;
- (void)setReplyBlock:(id)a3;
- (void)setTaskName:(id)a3;
- (void)setTaskType:(unint64_t)a3;
@end

@implementation SDLogAgentContainer

+ (id)containerAtLocation:(id)a3 forTaskType:(int)a4 withTimeout:(double)a5 withDelegate:(id)a6 withMsgContents:(id)a7 withReplyBlock:(id)a8
{
  id v13 = a3;
  id v14 = a7;
  id v15 = a8;
  id v16 = a6;
  v17 = sub_100047A04(a4);
  v18 = sub_100028D20(v13, v17);

  v19 = [(SDContainer *)[SDLogAgentContainer alloc] initWithName:v18 andDestination:0 withDelegate:v16];
  if (v19)
  {
    [(SDTaskContainer *)v19 setTimeout:a5];
    [(SDLogAgentContainer *)v19 setTaskType:a4];
    v20 = sub_100047A04(a4);
    [(SDLogAgentContainer *)v19 setTaskName:v20];

    [(SDLogAgentContainer *)v19 setOutputDir:v13];
    [(SDLogAgentContainer *)v19 setMsgContents:v14];
    [(SDLogAgentContainer *)v19 setReplyBlock:v15];
    [(SDLogAgentContainer *)v19 setReply:0];
  }

  return v19;
}

- (id)helperRepliedHandler
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100046D70;
  v4[3] = &unk_10009D9E8;
  v4[4] = self;
  v2 = objc_retainBlock(v4);

  return v2;
}

- (BOOL)sendHelperMessage
{
  v3 = +[SDTaskDepot sharedTaskDepot];
  [v3 recordHelperTaskStart];
  v4 = sub_100025C18(&stru_10009DD28);
  [(SDLogAgentContainer *)self setLogAgentConnection:v4];

  v5 = [(SDLogAgentContainer *)self logAgentConnection];

  if (v5)
  {
    xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
    if (v6)
    {
      xpc_dictionary_set_int64(v6, "taskType", [(SDLogAgentContainer *)self taskType]);
      unsigned __int8 v7 = [(SDTaskContainer *)self runByItself];
      [(SDTaskContainer *)self timeout];
      double v9 = v8;
      if ((v7 & 1) == 0)
      {
        [v3 minimumTimeBeforeTimeouts];
        double v9 = v9 + v10;
      }
      xpc_dictionary_set_double(v6, "taskTimeout", v9);
      v11 = [(SDLogAgentContainer *)self outputDir];

      if (v11)
      {
        id v12 = [(SDLogAgentContainer *)self outputDir];
        xpc_dictionary_set_string(v6, "taskOutputDir", (const char *)[v12 fileSystemRepresentation]);
      }
      else
      {
        xpc_dictionary_set_BOOL(v6, "taskNoOutputDir", 1);
      }
      id v16 = [(SDLogAgentContainer *)self msgContents];

      if (v16)
      {
        v34 = v3;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        v17 = [(SDLogAgentContainer *)self msgContents];
        id v18 = [v17 countByEnumeratingWithState:&v35 objects:v41 count:16];
        if (v18)
        {
          id v19 = v18;
          uint64_t v20 = *(void *)v36;
          do
          {
            v21 = 0;
            do
            {
              if (*(void *)v36 != v20) {
                objc_enumerationMutation(v17);
              }
              id v22 = *(id *)(*((void *)&v35 + 1) + 8 * (void)v21);
              v23 = (const char *)[v22 UTF8String];
              v24 = [(SDLogAgentContainer *)self msgContents];
              v25 = [v24 objectForKey:v22];
              xpc_dictionary_set_value(v6, v23, v25);

              v21 = (char *)v21 + 1;
            }
            while (v19 != v21);
            id v19 = [v17 countByEnumeratingWithState:&v35 objects:v41 count:16];
          }
          while (v19);
        }

        v3 = v34;
      }
      v26 = [(SDContainer *)self runtimeFlagDelegate];
      xpc_dictionary_set_int64(v6, "startTimeClockNS", (int64_t)[v26 startDiagnosticTimeClockNS]);

      v27 = sub_100028174();
      v28 = v27;
      if ((unint64_t)&self->super.super.super.super.isa + 1 >= 2 && os_signpost_enabled(v27))
      {
        v29 = [(SDLogAgentContainer *)self taskName];
        *(_DWORD *)buf = 138412290;
        v40 = v29;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "Helper Task", "%@", buf, 0xCu);
      }
      v30 = [(SDLogAgentContainer *)self logAgentConnection];
      v31 = [v3 taskQueue];
      v32 = [(SDLogAgentContainer *)self helperRepliedHandler];
      xpc_connection_send_message_with_reply(v30, v6, v31, v32);
    }
  }
  else
  {
    id v13 = sub_10002820C();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10006511C(self);
    }

    id v14 = +[SDResourceManager sharedResourceManager];
    id v15 = [(SDLogAgentContainer *)self taskName];
    [v14 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"No connection with sysdiagnose_helper. Cannot execute task: %@", v15 category msg];

    [v3 recordHelperTaskEnd];
  }

  return v5 != 0;
}

- (BOOL)_execute
{
  return [(SDLogAgentContainer *)self sendHelperMessage];
}

- (OS_xpc_object)logAgentConnection
{
  return self->_logAgentConnection;
}

- (void)setLogAgentConnection:(id)a3
{
}

- (unint64_t)taskType
{
  return self->_taskType;
}

- (void)setTaskType:(unint64_t)a3
{
  self->_taskType = a3;
}

- (NSString)taskName
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setTaskName:(id)a3
{
}

- (NSString)outputDir
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (void)setOutputDir:(id)a3
{
}

- (NSDictionary)msgContents
{
  return (NSDictionary *)objc_getProperty(self, a2, 176, 1);
}

- (void)setMsgContents:(id)a3
{
}

- (id)replyBlock
{
  return objc_getProperty(self, a2, 184, 1);
}

- (void)setReplyBlock:(id)a3
{
}

- (OS_xpc_object)reply
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 192, 1);
}

- (void)setReply:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reply, 0);
  objc_storeStrong(&self->_replyBlock, 0);
  objc_storeStrong((id *)&self->_msgContents, 0);
  objc_storeStrong((id *)&self->_outputDir, 0);
  objc_storeStrong((id *)&self->_taskName, 0);

  objc_storeStrong((id *)&self->_logAgentConnection, 0);
}

@end