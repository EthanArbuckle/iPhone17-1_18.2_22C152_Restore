@interface SignpostSupportLogMessage(LoggingSupport)
- (id)initWithOSLogEventProxy:()LoggingSupport timebaseRatio:;
@end

@implementation SignpostSupportLogMessage(LoggingSupport)

- (id)initWithOSLogEventProxy:()LoggingSupport timebaseRatio:
{
  id v6 = a4;
  if ([v6 type] == 1024)
  {
    uint64_t v7 = [v6 logType];
    unint64_t v8 = [v6 logType];
    id v9 = 0;
    if (v8 <= 0x11 && ((1 << v8) & 0x30007) != 0)
    {
      v10 = [v6 subsystem];
      v11 = [v6 category];
      v12 = objc_msgSend(a1, "initWithSubsystem:category:timebaseRatio:unixDate:unixTimeZone:", v10, v11, objc_msgSend(v6, "unixDate"), objc_msgSend(v6, "unixTimeZone"), a2);

      if (v12)
      {
        _initOSLogEventProxyFields(v12, v6);
        v13 = [v6 composedMessage];
        [v12 setMessage:v13];

        if (v7 == 17) {
          int v14 = 17;
        }
        else {
          int v14 = 0;
        }
        if (v7 == 16) {
          unsigned int v15 = 16;
        }
        else {
          unsigned int v15 = v14;
        }
        if (v7 == 2) {
          int v16 = 2;
        }
        else {
          int v16 = 0;
        }
        if (v7 == 1) {
          unsigned int v17 = 1;
        }
        else {
          unsigned int v17 = v16;
        }
        if (v7 <= 15) {
          uint64_t v18 = v17;
        }
        else {
          uint64_t v18 = v15;
        }
        [v12 setMessageType:v18];
        v19 = [v6 decomposedMessage];
        v20 = v19;
        if (v19 && ![v19 state] && (uint64_t v21 = objc_msgSend(v20, "placeholderCount")) != 0)
        {
          unint64_t v22 = v21;
          uint64_t v23 = 0;
          BOOL v24 = 1;
          while (1)
          {
            v25 = [v20 argumentAtIndex:v23];
            v26 = v25;
            if (v25)
            {
              if ([v25 category]
                && [v26 category] != 1
                && ![v26 availability])
              {
                break;
              }
            }

            BOOL v24 = ++v23 < v22;
            if (v22 == v23) {
              goto LABEL_29;
            }
          }
        }
        else
        {
LABEL_29:
          BOOL v24 = 0;
        }
        [v12 setHasNonScalarDynamicData:v24];
      }
      a1 = v12;
      id v9 = a1;
    }
  }
  else
  {
    v27 = _signpostcollection_debug_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
      -[SignpostSupportLogMessage(LoggingSupport) initWithOSLogEventProxy:timebaseRatio:](v6);
    }

    id v9 = 0;
  }

  return v9;
}

- (void)initWithOSLogEventProxy:()LoggingSupport timebaseRatio:.cold.1(void *a1)
{
  [a1 type];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21DE73000, v1, v2, "Unexpected proxy type when trying to initialize log message: %llu", v3, v4, v5, v6, v7);
}

@end