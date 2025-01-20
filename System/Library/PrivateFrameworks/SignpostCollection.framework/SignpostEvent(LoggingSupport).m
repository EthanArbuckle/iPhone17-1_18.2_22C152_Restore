@interface SignpostEvent(LoggingSupport)
- (id)initWithOSLogEventProxy:()LoggingSupport timebaseRatio:shouldCompose:;
- (uint64_t)_checkForFormatStringFlags:()LoggingSupport shouldCompose:;
- (void)_handleSignpostDescriptionPlaceholder:()LoggingSupport;
- (void)_handleSignpostTelemetryPlaceholder:()LoggingSupport;
- (void)_parseMetadataSegments:()LoggingSupport;
@end

@implementation SignpostEvent(LoggingSupport)

- (void)_handleSignpostTelemetryPlaceholder:()LoggingSupport
{
  id v24 = a3;
  v4 = [v24 type];

  if (v4)
  {
    v5 = [a1 _nameStringFromSegment:v24];
    if ([v5 length])
    {
      v6 = [v24 type];
      int v7 = [v6 isEqualToString:@"string1"];

      if (v7)
      {
        v8 = [v24 argument];
        int v9 = [v8 type];

        if (v9 == 1)
        {
          [a1 setString1Name:v5];
          v10 = [v24 argument];
          v11 = [v10 argumentObject];
          [a1 setString1Value:v11];
LABEL_15:
        }
      }
      else
      {
        v12 = [v24 type];
        int v13 = [v12 isEqualToString:@"string2"];

        if (v13)
        {
          v14 = [v24 argument];
          int v15 = [v14 type];

          if (v15 == 1)
          {
            [a1 setString2Name:v5];
            v10 = [v24 argument];
            v11 = [v10 argumentObject];
            [a1 setString2Value:v11];
            goto LABEL_15;
          }
        }
        else
        {
          v16 = [v24 type];
          int v17 = [v16 isEqualToString:@"number1"];

          if (!v17)
          {
            v20 = [v24 type];
            int v21 = [v20 isEqualToString:@"number2"];

            if (!v21) {
              goto LABEL_16;
            }
            v22 = [v24 argument];
            int v23 = [v22 type];

            if (v23 != 3) {
              goto LABEL_16;
            }
            [a1 setNumber2Name:v5];
            v10 = [v24 argument];
            v11 = [v10 argumentObject];
            [a1 setNumber2Value:v11];
            goto LABEL_15;
          }
          v18 = [v24 argument];
          int v19 = [v18 type];

          if (v19 == 3)
          {
            [a1 setNumber1Name:v5];
            v10 = [v24 argument];
            v11 = [v10 argumentObject];
            [a1 setNumber1Value:v11];
            goto LABEL_15;
          }
        }
      }
    }
LABEL_16:
  }
}

- (void)_handleSignpostDescriptionPlaceholder:()LoggingSupport
{
  id v4 = a3;
  v5 = [v4 type];

  if (!v5) {
    goto LABEL_27;
  }
  v6 = [v4 type];
  int v7 = [v6 isEqualToString:@"attribute"];

  if (v7)
  {
    uint64_t v8 = [a1 _nameStringFromSegment:v4];
    if (!v8) {
      goto LABEL_27;
    }
    int v9 = v8;
    v10 = [v4 argument];
    int v11 = [v10 type];

    v12 = [v4 argument];
    int v13 = v12;
    if (v11 == 1)
    {
      uint64_t v14 = [v12 argumentObject];
    }
    else
    {
      int v20 = [v12 type];

      if (v20 != 3) {
        goto LABEL_26;
      }
      int v21 = [v4 argument];
      int v13 = [v21 argumentObject];

      uint64_t v14 = [v13 stringValue];
    }
    v22 = (void *)v14;

    if (v22)
    {
      int v23 = [a1 attributes];

      if (!v23)
      {
        id v24 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        [a1 setAttributes:v24];
      }
      v25 = [a1 attributes];
      [v25 setObject:v22 forKeyedSubscript:v9];

      goto LABEL_15;
    }
LABEL_26:

    goto LABEL_27;
  }
  int v15 = [v4 type];
  int v16 = [v15 isEqualToString:@"begin_time"];

  if (v16)
  {
    int v17 = [v4 argument];
    int v18 = [v17 type];

    if (v18 == 3)
    {
      int v19 = [v4 argument];
      int v9 = [v19 argumentObject];

      objc_msgSend(a1, "setOverridingBeginMachContinuousTime:", -[NSObject unsignedLongLongValue](v9, "unsignedLongLongValue"));
LABEL_15:
    }
  }
  v26 = [v4 type];
  int v27 = [v26 isEqualToString:@"end_time"];

  if (v27)
  {
    v28 = [v4 argument];
    int v29 = [v28 type];

    if (v29 == 3)
    {
      v30 = [v4 argument];
      v31 = [v30 argumentObject];

      objc_msgSend(a1, "setOverridingEndMachContinuousTime:", objc_msgSend(v31, "unsignedLongLongValue"));
LABEL_23:

      goto LABEL_27;
    }
    goto LABEL_27;
  }
  v32 = [v4 type];
  int v33 = [v32 isEqualToString:@"event_time"];

  if (!v33) {
    goto LABEL_27;
  }
  if ([a1 eventType] != 2)
  {
    int v9 = _signpostcollection_debug_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[SignpostEvent(LoggingSupport) _handleSignpostDescriptionPlaceholder:](a1);
    }
    goto LABEL_26;
  }
  v34 = [v4 argument];
  int v35 = [v34 type];

  if (v35 == 3)
  {
    v36 = [v4 argument];
    v31 = [v36 argumentObject];

    objc_msgSend(a1, "setOverridingEmitMachContinuousTime:", objc_msgSend(v31, "unsignedLongLongValue"));
    goto LABEL_23;
  }
LABEL_27:
}

- (id)initWithOSLogEventProxy:()LoggingSupport timebaseRatio:shouldCompose:
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v8 = a4;
  if ([v8 type] != 1536)
  {
    int v9 = _signpostcollection_debug_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[SignpostEvent(LoggingSupport) initWithOSLogEventProxy:timebaseRatio:shouldCompose:].cold.6(v8);
    }
    goto LABEL_7;
  }
  if ((unint64_t)[v8 signpostType] < 3)
  {
    uint64_t v12 = [v8 signpostScope];
    if (v12 != 64 && v12 != 128 && v12 != 192)
    {
      int v9 = _signpostcollection_debug_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[SignpostEvent(LoggingSupport) initWithOSLogEventProxy:timebaseRatio:shouldCompose:](v8);
      }
      goto LABEL_7;
    }
    int v13 = [v8 backtrace];
    if (v13)
    {
      v38 = a1;
      int v9 = [MEMORY[0x263EFF980] array];
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      v37 = v13;
      uint64_t v14 = [v13 frames];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v39 objects:v43 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v40;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v40 != v17) {
              objc_enumerationMutation(v14);
            }
            int v19 = *(void **)(*((void *)&v39 + 1) + 8 * i);
            id v20 = objc_alloc(MEMORY[0x263F6C580]);
            int v21 = [v19 imageUUID];
            v22 = objc_msgSend(v20, "initWithUUID:offset:", v21, objc_msgSend(v19, "imageOffset"));

            [v9 addObject:v22];
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v39 objects:v43 count:16];
        }
        while (v16);
      }

      a1 = v38;
      a5 = a5;
      int v13 = v37;
    }
    else
    {
      int v9 = 0;
    }
    int v23 = [v8 subsystem];
    id v24 = [v8 category];
    a1 = objc_msgSend(a1, "initWithSubsystem:category:timebaseRatio:unixDate:unixTimeZone:stackFrames:", v23, v24, objc_msgSend(v8, "unixDate"), objc_msgSend(v8, "unixTimeZone"), v9, a2);

    if (a1)
    {
      v25 = [v8 signpostName];

      if (!v25)
      {
        int v35 = _signpostcollection_debug_log();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
          -[SignpostEvent(LoggingSupport) initWithOSLogEventProxy:timebaseRatio:shouldCompose:](v35);
        }

        id v10 = 0;
        goto LABEL_44;
      }
      v26 = [v8 signpostName];
      [a1 setName:v26];

      if (a5)
      {
        int v27 = [v8 composedMessage];
        [a1 setMetadata:v27];

        v28 = [a1 metadata];
        int v29 = [v28 containsString:@"enableTelemetry=YES"];

        if (v29) {
          [a1 setTelemetryEnabled:1];
        }
        if (![a1 eventType])
        {
          v30 = [a1 metadata];
          int v31 = [v30 containsString:@"isAnimation=YES"];

          if (v31) {
            [a1 setIsAnimationStart:1];
          }
        }
      }
      _initOSLogEventProxyFields(a1, v8);
      objc_msgSend(a1, "setSignpostId:", objc_msgSend(v8, "signpostIdentifier"));
      unint64_t v32 = [v8 signpostType];
      if (v32 >= 3) {
        -[SignpostEvent(LoggingSupport) initWithOSLogEventProxy:timebaseRatio:shouldCompose:].cold.5();
      }
      [a1 setEventType:qword_21DE7B0E0[v32]];
      uint64_t v33 = [v8 signpostScope];
      switch(v33)
      {
        case 64:
          uint64_t v34 = 2;
          break;
        case 192:
          uint64_t v34 = 0;
          break;
        case 128:
          uint64_t v34 = 1;
          break;
        default:
          -[SignpostEvent(LoggingSupport) initWithOSLogEventProxy:timebaseRatio:shouldCompose:].cold.4();
      }
      [a1 setScope:v34];
      v36 = [MEMORY[0x263F6C5A0] placeholderArrayWithOSLogEventProxy:v8];
      [a1 setMetadataSegments:v36];

      [a1 _populateMetrics];
      [a1 _parseMetadataSegments:a5];
    }
    id v10 = a1;
LABEL_44:

    goto LABEL_8;
  }
  int v9 = _signpostcollection_debug_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[SignpostEvent(LoggingSupport) initWithOSLogEventProxy:timebaseRatio:shouldCompose:](v8);
  }
LABEL_7:
  id v10 = 0;
LABEL_8:

  return v10;
}

- (void)_parseMetadataSegments:()LoggingSupport
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = objc_msgSend(a1, "metadataSegments", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        [a1 _checkForFormatStringFlags:v10 shouldCompose:a3];
        int v11 = [v10 typeNamespace];
        int v12 = [v11 isEqualToString:@"signpost.description"];

        if (v12)
        {
          [a1 _handleSignpostDescriptionPlaceholder:v10];
        }
        else
        {
          int v13 = [v10 typeNamespace];
          int v14 = [v13 isEqualToString:@"signpost.telemetry"];

          if (v14) {
            [a1 _handleSignpostTelemetryPlaceholder:v10];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
}

- (uint64_t)_checkForFormatStringFlags:()LoggingSupport shouldCompose:
{
  id v13 = a3;
  uint64_t v6 = [v13 stringPrefix];

  if (v6)
  {
    if ((a4 & 1) == 0)
    {
      uint64_t v7 = [v13 stringPrefix];
      int v8 = [v7 containsString:@"enableTelemetry=YES"];

      if (v8) {
        [a1 setTelemetryEnabled:1];
      }
    }
    if (![a1 eventType])
    {
      id v9 = [v13 stringPrefix];
      id v10 = strstr((char *)[v9 UTF8String], "isAnimation=YES");

      if (v10)
      {
        [a1 setIsAnimationStart:1];
        int v11 = [v13 stringPrefix];
        [a1 setAnimationTypeFromRawMetadata:v11];
      }
    }
  }
  return MEMORY[0x270F9A758]();
}

- (void)_handleSignpostDescriptionPlaceholder:()LoggingSupport .cold.1(void *a1)
{
  v1 = [a1 _key];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21DE73000, v2, v3, "Attempted to override event timestamp on interval (%@)", v4, v5, v6, v7, v8);
}

- (void)initWithOSLogEventProxy:()LoggingSupport timebaseRatio:shouldCompose:.cold.1(void *a1)
{
  [a1 signpostType];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21DE73000, v1, v2, "Unexpected signpost type when trying to initialize signpost event: %#llx", v3, v4, v5, v6, v7);
}

- (void)initWithOSLogEventProxy:()LoggingSupport timebaseRatio:shouldCompose:.cold.2(void *a1)
{
  [a1 signpostScope];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21DE73000, v1, v2, "Unexpected signpost scope when trying to initialize signpost event: %#llx", v3, v4, v5, v6, v7);
}

- (void)initWithOSLogEventProxy:()LoggingSupport timebaseRatio:shouldCompose:.cold.3(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_21DE73000, log, OS_LOG_TYPE_DEBUG, "No signpostName for raw event proxy", v1, 2u);
}

- (void)initWithOSLogEventProxy:()LoggingSupport timebaseRatio:shouldCompose:.cold.4()
{
}

- (void)initWithOSLogEventProxy:()LoggingSupport timebaseRatio:shouldCompose:.cold.5()
{
}

- (void)initWithOSLogEventProxy:()LoggingSupport timebaseRatio:shouldCompose:.cold.6(void *a1)
{
  [a1 type];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21DE73000, v1, v2, "Unexpected proxy type when trying to initialize signpost event: %llu", v3, v4, v5, v6, v7);
}

@end