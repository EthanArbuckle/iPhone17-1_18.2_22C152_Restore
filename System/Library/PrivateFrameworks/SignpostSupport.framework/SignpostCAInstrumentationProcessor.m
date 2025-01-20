@interface SignpostCAInstrumentationProcessor
+ (BOOL)filterPassesRequiredSCForCAInstrumentation:(id)a3;
+ (BOOL)filterPassesRequiredSCForCAMetalInstrumentation:(id)a3;
+ (void)addNeededMetalSCToAllowlist:(id)a3;
+ (void)addNeededSCToAllowlist:(id)a3;
+ (void)addNeededSCToWhitelist:(id)a3;
- (BOOL)handleSignpostEvent:(id)a3;
- (BOOL)handleSignpostInterval:(id)a3;
- (BOOL)isConciseFormat;
- (NSMutableDictionary)frameSeedToAccumulatedRenderStateDict;
- (NSMutableDictionary)frameSeedToAccumulatedStateDict;
- (NSMutableDictionary)queueIDToSurfaceIDToClientDrawableIntervalDict;
- (SignpostCAInstrumentationProcessor)init;
- (SignpostEvent)curFrameLifetimeBegin;
- (SignpostEvent)curLongFrameLifetimeBegin;
- (SignpostFrameLifetimeInterval)previousFrameLifetime;
- (id)_renderStateForFrameSeed:(unsigned int)a3;
- (id)_stateForFrameSeed:(unsigned int)a3;
- (id)clientDrawableIntervalBlock;
- (id)commitIntervalBlock;
- (id)contextInfoBlock;
- (id)frameLatencyBlock;
- (id)frameLifetimeBlock;
- (id)hidLatencyBlock;
- (id)imageQueueSampleEventBlock;
- (id)newConfiguredExtractor;
- (id)renderBlock;
- (id)transactionLifetimeBlock;
- (unsigned)curFrameSeed;
- (void)_cleanupStateWithSeed:(unsigned int)a3;
- (void)_handleClientDrawableInterval:(id)a3;
- (void)_handleContextInfo:(id)a3;
- (void)_handleFrameLatencyInterval:(id)a3;
- (void)_handleFrameLifetimeBegin:(id)a3;
- (void)_handleFrameLifetimeInterval:(id)a3;
- (void)_handleHIDInterval:(id)a3;
- (void)_handleImageQueueSampleEvent:(id)a3;
- (void)_handleLongFrameLifetimeBegin:(id)a3;
- (void)_handleRenderInterval:(id)a3;
- (void)handleDeviceReboot;
- (void)handleSignpostIntervalBegin:(id)a3;
- (void)setClientDrawableIntervalBlock:(id)a3;
- (void)setCommitIntervalBlock:(id)a3;
- (void)setContextInfoBlock:(id)a3;
- (void)setCurFrameLifetimeBegin:(id)a3;
- (void)setCurFrameSeed:(unsigned int)a3;
- (void)setCurLongFrameLifetimeBegin:(id)a3;
- (void)setFrameLatencyBlock:(id)a3;
- (void)setFrameLifetimeBlock:(id)a3;
- (void)setHidLatencyBlock:(id)a3;
- (void)setImageQueueSampleEventBlock:(id)a3;
- (void)setIsConciseFormat:(BOOL)a3;
- (void)setPreviousFrameLifetime:(id)a3;
- (void)setRenderBlock:(id)a3;
- (void)setTransactionLifetimeBlock:(id)a3;
@end

@implementation SignpostCAInstrumentationProcessor

- (void)handleSignpostIntervalBegin:(id)a3
{
  id v14 = a3;
  v4 = [v14 name];
  int v5 = [v4 isEqualToString:@"FrameLifetime"];

  if (v5)
  {
    v6 = [v14 subsystem];
    int IsHitchSubsystem = _subsystemIsHitchSubsystem(v6);

    if (IsHitchSubsystem)
    {
      v8 = [v14 category];
      if ([v8 isEqualToString:@"IOMFBServer"])
      {

LABEL_6:
        [(SignpostCAInstrumentationProcessor *)self _handleFrameLifetimeBegin:v14];
        goto LABEL_11;
      }
      v9 = [v14 category];
      int v10 = [v9 isEqualToString:@"tracing"];

      if (v10) {
        goto LABEL_6;
      }
      v11 = [v14 category];
      if ([v11 isEqualToString:@"IOMFBServer.Stalls"])
      {
      }
      else
      {
        v12 = [v14 category];
        int v13 = [v12 isEqualToString:@"tracing.stalls"];

        if (!v13) {
          goto LABEL_11;
        }
      }
      [(SignpostCAInstrumentationProcessor *)self _handleLongFrameLifetimeBegin:v14];
    }
  }
LABEL_11:
}

- (BOOL)handleSignpostEvent:(id)a3
{
  id v4 = a3;
  int v5 = SSCAEventTypeForSignpost(v4);
  if (v5 == 1)
  {
    v6 = [[SignpostImageQueueSampleEvent alloc] initWithImageQueueSampleEvent:v4];
    if (!v6) {
      goto LABEL_10;
    }
    [(SignpostCAInstrumentationProcessor *)self _handleImageQueueSampleEvent:v6];
    v9 = [(SignpostCAInstrumentationProcessor *)self imageQueueSampleEventBlock];

    if (!v9) {
      goto LABEL_10;
    }
    uint64_t v8 = [(SignpostCAInstrumentationProcessor *)self imageQueueSampleEventBlock];
    goto LABEL_9;
  }
  if (v5)
  {
    BOOL v11 = 0;
    goto LABEL_12;
  }
  v6 = [[SignpostContextInfo alloc] initWithContextInfoEvent:v4];
  if (v6)
  {
    [(SignpostCAInstrumentationProcessor *)self _handleContextInfo:v6];
    v7 = [(SignpostCAInstrumentationProcessor *)self contextInfoBlock];

    if (v7)
    {
      uint64_t v8 = [(SignpostCAInstrumentationProcessor *)self contextInfoBlock];
LABEL_9:
      int v10 = (void *)v8;
      (*(void (**)(uint64_t, SignpostImageQueueSampleEvent *))(v8 + 16))(v8, v6);
    }
  }
LABEL_10:

  BOOL v11 = 1;
LABEL_12:

  return v11;
}

- (id)contextInfoBlock
{
  return self->_contextInfoBlock;
}

- (void)_handleContextInfo:(id)a3
{
  id v4 = a3;
  if ([(SignpostCAInstrumentationProcessor *)self curFrameSeed]
    && (int v5 = [v4 frameSeed],
        v5 != [(SignpostCAInstrumentationProcessor *)self curFrameSeed]))
  {
    v9 = _signpost_debug_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[SignpostCAInstrumentationProcessor _handleContextInfo:](v4, self);
    }
  }
  else
  {
    v6 = -[SignpostCAInstrumentationProcessor _stateForFrameSeed:](self, "_stateForFrameSeed:", [v4 frameSeed]);
    v7 = [v6 contextIDtoContextInfoDict];
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v4, "contextId"));
    [v7 setObject:v4 forKeyedSubscript:v8];
  }
}

- (unsigned)curFrameSeed
{
  return self->_curFrameSeed;
}

- (BOOL)handleSignpostInterval:(id)a3
{
  id v4 = a3;
  int v5 = SSCAIntervalTypeForSignpostInterval(v4);
  if (![(SignpostCAInstrumentationProcessor *)self isConciseFormat]
    && [v4 isSyntheticInterval])
  {
    [(SignpostCAInstrumentationProcessor *)self setIsConciseFormat:1];
  }
  BOOL v6 = 0;
  switch(v5)
  {
    case 0:
      goto LABEL_6;
    case 1:
      BOOL v6 = 1;
LABEL_6:
      v7 = [(SignpostCAInstrumentationProcessor *)self commitIntervalBlock];

      if (!v7) {
        goto LABEL_49;
      }
      uint64_t v8 = [[SignpostCommitInterval alloc] initWithCommitInterval:v4];
      if (!v8) {
        goto LABEL_48;
      }
      uint64_t v9 = [(SignpostCAInstrumentationProcessor *)self commitIntervalBlock];
      goto LABEL_32;
    case 2:
      goto LABEL_10;
    case 3:
      BOOL v6 = 1;
LABEL_10:
      [(SignpostCAInstrumentationProcessor *)self setIsConciseFormat:0];
      int v10 = [(SignpostCAInstrumentationProcessor *)self transactionLifetimeBlock];

      if (!v10) {
        goto LABEL_49;
      }
      uint64_t v8 = [[SignpostAnimationTransactionLifetime alloc] initWithTransactionSeedInterval:v4];
      if (!v8) {
        goto LABEL_48;
      }
      uint64_t v9 = [(SignpostCAInstrumentationProcessor *)self transactionLifetimeBlock];
      goto LABEL_32;
    case 4:
      goto LABEL_14;
    case 5:
      BOOL v6 = 1;
LABEL_14:
      [(SignpostCAInstrumentationProcessor *)self setIsConciseFormat:0];
      uint64_t v8 = [[SignpostHIDLatencyInterval alloc] initWithHIDLatencyInterval:v4];
      if (!v8) {
        goto LABEL_48;
      }
      [(SignpostCAInstrumentationProcessor *)self _handleHIDInterval:v8];
      BOOL v11 = [(SignpostCAInstrumentationProcessor *)self hidLatencyBlock];

      if (!v11) {
        goto LABEL_48;
      }
      uint64_t v9 = [(SignpostCAInstrumentationProcessor *)self hidLatencyBlock];
      goto LABEL_32;
    case 6:
      goto LABEL_18;
    case 7:
      BOOL v6 = 1;
LABEL_18:
      [(SignpostCAInstrumentationProcessor *)self setIsConciseFormat:0];
      uint64_t v8 = [[SignpostFrameLatencyInterval alloc] initWithFrameLatencyInterval:v4 isLong:v6];
      if (!v8) {
        goto LABEL_48;
      }
      [(SignpostCAInstrumentationProcessor *)self _handleFrameLatencyInterval:v8];
      v12 = [(SignpostCAInstrumentationProcessor *)self frameLatencyBlock];

      if (!v12) {
        goto LABEL_48;
      }
      uint64_t v9 = [(SignpostCAInstrumentationProcessor *)self frameLatencyBlock];
      goto LABEL_32;
    case 8:
      goto LABEL_22;
    case 9:
      BOOL v6 = 1;
LABEL_22:
      uint64_t v8 = [[SignpostRenderServerRenderInterval alloc] initWithRenderServerRenderInterval:v4];
      if (!v8) {
        goto LABEL_48;
      }
      [(SignpostCAInstrumentationProcessor *)self _handleRenderInterval:v8];
      int v13 = [(SignpostCAInstrumentationProcessor *)self renderBlock];

      if (!v13) {
        goto LABEL_48;
      }
      uint64_t v9 = [(SignpostCAInstrumentationProcessor *)self renderBlock];
      goto LABEL_32;
    case 10:
      goto LABEL_26;
    case 11:
      BOOL v6 = 1;
LABEL_26:
      id v14 = [v4 beginEvent];
      uint64_t v8 = +[SignpostFrameLifetimeInterval _frameSeedForLifetimeIntervalBegin:v14];

      v15 = [(SignpostCAInstrumentationProcessor *)self frameSeedToAccumulatedStateDict];
      v16 = [v15 objectForKeyedSubscript:v8];

      BOOL v17 = [(SignpostCAInstrumentationProcessor *)self isConciseFormat];
      v18 = [SignpostFrameLifetimeInterval alloc];
      v19 = [v16 contextIDtoContextInfoDict];
      v20 = [v19 allValues];
      if (v17)
      {
        v21 = [v16 renderInterval];
        v22 = [v16 frameSeedToSkippedRenderIntervals];
        v23 = [(SignpostFrameLifetimeInterval *)v18 initWithInterval:v4 contextArray:v20 renderInterval:v21 frameSeedToSkippedRenderIntervals:v22];
      }
      else
      {
        v42 = [v16 hidLatency];
        [v16 renderInterval];
        v25 = v43 = v19;
        v26 = [v16 frameLatency];
        v27 = [v16 frameSeedToSkippedRenderIntervals];
        v23 = [(SignpostFrameLifetimeInterval *)v18 initWithInterval:v4 contextArray:v20 hidLatencyInterval:v42 renderInterval:v25 frameLatencyInterval:v26 frameSeedToSkippedRenderIntervals:v27];

        v28 = [(SignpostFrameLifetimeInterval *)v23 frameLatencyInterval];

        if (!v28) {
          goto LABEL_36;
        }
        v19 = [(SignpostFrameLifetimeInterval *)v23 frameLatencyInterval];
        [(SignpostCAInstrumentationProcessor *)self _handleFrameLatencyInterval:v19];
      }

LABEL_36:
      if (v23)
      {
        [(SignpostFrameLifetimeInterval *)v23 setLifetimeIsLong:v6];
        if ([(SignpostCAInstrumentationProcessor *)self isConciseFormat])
        {
          uint64_t v29 = [(SignpostCAInstrumentationProcessor *)self hidLatencyBlock];
          if (v29)
          {
            v30 = (void *)v29;
            v31 = [(SignpostFrameLifetimeInterval *)v23 hidLatencyInterval];

            if (v31)
            {
              v32 = [(SignpostCAInstrumentationProcessor *)self hidLatencyBlock];
              v33 = [(SignpostFrameLifetimeInterval *)v23 hidLatencyInterval];
              ((void (**)(void, void *, BOOL))v32)[2](v32, v33, [(SignpostFrameLifetimeInterval *)v23 hidLatencyIsLong]);
            }
          }
          uint64_t v34 = [(SignpostCAInstrumentationProcessor *)self frameLatencyBlock];
          if (v34)
          {
            v35 = (void *)v34;
            v36 = [(SignpostFrameLifetimeInterval *)v23 frameLatencyInterval];

            if (v36)
            {
              v37 = [(SignpostCAInstrumentationProcessor *)self frameLatencyBlock];
              v38 = [(SignpostFrameLifetimeInterval *)v23 frameLatencyInterval];
              ((void (**)(void, void *, BOOL))v37)[2](v37, v38, [(SignpostFrameLifetimeInterval *)v23 frameLatencyIsLong]);
            }
          }
        }
        [(SignpostCAInstrumentationProcessor *)self _handleFrameLifetimeInterval:v23];
        v39 = [(SignpostCAInstrumentationProcessor *)self frameLifetimeBlock];

        if (v39)
        {
          v40 = [(SignpostCAInstrumentationProcessor *)self frameLifetimeBlock];
          ((void (**)(void, SignpostFrameLifetimeInterval *, BOOL))v40)[2](v40, v23, v6);
        }
      }

LABEL_47:
LABEL_48:

LABEL_49:
      LOBYTE(v6) = 1;
LABEL_50:

      return v6;
    case 12:
      goto LABEL_29;
    case 13:
      BOOL v6 = 1;
LABEL_29:
      uint64_t v8 = [[SignpostClientDrawableInterval alloc] initWithClientDrawableInterval:v4];
      if (!v8) {
        goto LABEL_48;
      }
      [(SignpostCAInstrumentationProcessor *)self _handleClientDrawableInterval:v8];
      v24 = [(SignpostCAInstrumentationProcessor *)self clientDrawableIntervalBlock];

      if (!v24) {
        goto LABEL_48;
      }
      uint64_t v9 = [(SignpostCAInstrumentationProcessor *)self clientDrawableIntervalBlock];
LABEL_32:
      v16 = (void *)v9;
      (*(void (**)(uint64_t, SignpostCommitInterval *, BOOL))(v9 + 16))(v9, v8, v6);
      goto LABEL_47;
    default:
      goto LABEL_50;
  }
}

- (BOOL)isConciseFormat
{
  return self->_isConciseFormat;
}

- (id)renderBlock
{
  return self->_renderBlock;
}

- (id)frameLifetimeBlock
{
  return self->_frameLifetimeBlock;
}

- (id)frameLatencyBlock
{
  return self->_frameLatencyBlock;
}

- (id)commitIntervalBlock
{
  return self->_commitIntervalBlock;
}

- (void)_handleRenderInterval:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v19 = -[SignpostCAInstrumentationProcessor _renderStateForFrameSeed:](self, "_renderStateForFrameSeed:", [v4 frameSeed]);
  int v5 = [v19 imageQueueSampleEvents];
  [v4 setImageQueueSampleEvents:v5];

  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = [v4 imageQueueSampleEvents];
  uint64_t v7 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(obj);
        }
        BOOL v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v12 = [(SignpostCAInstrumentationProcessor *)self queueIDToSurfaceIDToClientDrawableIntervalDict];
        int v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v11, "queueID"));
        id v14 = [v12 objectForKeyedSubscript:v13];

        v15 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v11, "surfaceID"));
        v16 = [v14 objectForKeyedSubscript:v15];

        if (v16)
        {
          [v6 addObject:v16];
          BOOL v17 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v11, "surfaceID"));
          [v14 removeObjectForKey:v17];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }

  if ([v6 count]) {
    [v4 setClientDrawableIntervals:v6];
  }
  v18 = -[SignpostCAInstrumentationProcessor _stateForFrameSeed:](self, "_stateForFrameSeed:", [v4 frameSeed]);
  if ([v4 didSkipRender]) {
    [v18 _addSkippedRender:v4];
  }
  else {
    [v18 setRenderInterval:v4];
  }
}

- (id)hidLatencyBlock
{
  return self->_hidLatencyBlock;
}

- (void)_handleFrameLifetimeInterval:(id)a3
{
  id v6 = a3;
  -[SignpostFrameLifetimeInterval setNextFrameBufferCount:](self->_previousFrameLifetime, "setNextFrameBufferCount:", [v6 bufferCount]);
  objc_msgSend(v6, "setPreviousFrameBufferCount:", -[SignpostFrameLifetimeInterval bufferCount](self->_previousFrameLifetime, "bufferCount"));
  objc_storeStrong((id *)&self->_previousFrameLifetime, a3);
  if ([v6 lifetimeIsLong])
  {
    -[SignpostCAInstrumentationProcessor _cleanupStateWithSeed:](self, "_cleanupStateWithSeed:", [v6 frameSeed]);
    [(SignpostCAInstrumentationProcessor *)self setCurLongFrameLifetimeBegin:0];
  }
  else
  {
    int v5 = [(SignpostCAInstrumentationProcessor *)self curLongFrameLifetimeBegin];

    if (!v5)
    {
      -[SignpostCAInstrumentationProcessor _cleanupStateWithSeed:](self, "_cleanupStateWithSeed:", [v6 frameSeed]);
      [(SignpostCAInstrumentationProcessor *)self setCurFrameLifetimeBegin:0];
    }
  }
}

- (void)_cleanupStateWithSeed:(unsigned int)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  int v5 = [(SignpostCAInstrumentationProcessor *)self frameSeedToAccumulatedRenderStateDict];
  id v6 = [v5 allKeys];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v6);
        }
        BOOL v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if ([v11 unsignedLongLongValue] <= (unint64_t)a3)
        {
          v12 = [(SignpostCAInstrumentationProcessor *)self frameSeedToAccumulatedRenderStateDict];
          [v12 removeObjectForKey:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v8);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  int v13 = [(SignpostCAInstrumentationProcessor *)self frameSeedToAccumulatedStateDict];
  id v14 = [v13 allKeys];

  uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v23;
    unint64_t v18 = a3;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v14);
        }
        v20 = *(void **)(*((void *)&v22 + 1) + 8 * j);
        if ([v20 unsignedLongLongValue] <= v18)
        {
          long long v21 = [(SignpostCAInstrumentationProcessor *)self frameSeedToAccumulatedStateDict];
          [v21 removeObjectForKey:v20];
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v16);
  }

  [(SignpostCAInstrumentationProcessor *)self setCurFrameSeed:0];
}

- (id)_stateForFrameSeed:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = [(SignpostCAInstrumentationProcessor *)self frameSeedToAccumulatedStateDict];
  id v6 = [NSNumber numberWithUnsignedInt:v3];
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];

  if (!v7)
  {
    uint64_t v7 = [[SignpostFrameAccumulatedState alloc] initWithFrameSeed:v3];
    uint64_t v8 = [(SignpostCAInstrumentationProcessor *)self frameSeedToAccumulatedStateDict];
    uint64_t v9 = [NSNumber numberWithUnsignedInt:v3];
    [v8 setObject:v7 forKeyedSubscript:v9];
  }

  return v7;
}

- (NSMutableDictionary)frameSeedToAccumulatedStateDict
{
  return self->_frameSeedToAccumulatedStateDict;
}

- (void)setCurFrameSeed:(unsigned int)a3
{
  self->_curFrameSeed = a3;
}

- (id)_renderStateForFrameSeed:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = [(SignpostCAInstrumentationProcessor *)self frameSeedToAccumulatedRenderStateDict];
  id v6 = [NSNumber numberWithUnsignedInt:v3];
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];

  if (!v7)
  {
    uint64_t v7 = [[SignpostRenderAccumulatedState alloc] initWithFrameSeed:v3];
    uint64_t v8 = [(SignpostCAInstrumentationProcessor *)self frameSeedToAccumulatedRenderStateDict];
    uint64_t v9 = [NSNumber numberWithUnsignedInt:v3];
    [v8 setObject:v7 forKeyedSubscript:v9];
  }

  return v7;
}

- (NSMutableDictionary)frameSeedToAccumulatedRenderStateDict
{
  return self->_frameSeedToAccumulatedRenderStateDict;
}

- (void)_handleFrameLifetimeBegin:(id)a3
{
  id v4 = a3;
  int v5 = +[SignpostFrameLifetimeInterval _frameSeedForLifetimeIntervalBegin:v4];
  id v6 = v5;
  if (v5)
  {
    -[SignpostCAInstrumentationProcessor setCurFrameSeed:](self, "setCurFrameSeed:", [v5 unsignedLongLongValue]);
    [(SignpostCAInstrumentationProcessor *)self setCurFrameLifetimeBegin:v4];
  }
  else
  {
    uint64_t v7 = _signpost_debug_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[SignpostCAInstrumentationProcessor _handleFrameLifetimeBegin:](v7);
    }
  }
}

- (void)setCurFrameLifetimeBegin:(id)a3
{
}

- (SignpostEvent)curLongFrameLifetimeBegin
{
  return self->_curLongFrameLifetimeBegin;
}

- (void)_handleLongFrameLifetimeBegin:(id)a3
{
  id v4 = a3;
  int v5 = +[SignpostFrameLifetimeInterval _frameSeedForLifetimeIntervalBegin:v4];
  id v6 = v5;
  if (v5)
  {
    -[SignpostCAInstrumentationProcessor setCurFrameSeed:](self, "setCurFrameSeed:", [v5 unsignedLongLongValue]);
    [(SignpostCAInstrumentationProcessor *)self setCurLongFrameLifetimeBegin:v4];
  }
  else
  {
    uint64_t v7 = _signpost_debug_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[SignpostCAInstrumentationProcessor _handleFrameLifetimeBegin:](v7);
    }
  }
}

- (void)setCurLongFrameLifetimeBegin:(id)a3
{
}

- (void)setIsConciseFormat:(BOOL)a3
{
  self->_isConciseFormat = a3;
}

+ (void)addNeededSCToAllowlist:(id)a3
{
  id v3 = a3;
  [v3 addSubsystem:@"com.apple.coreanimation" category:@"Transaction.Stalls"];
  [v3 addSubsystem:@"com.apple.coreanimation" category:@"Transaction"];
  [v3 addSubsystem:@"com.apple.coreanimation" category:@"IOMFBServer.Stalls"];
  [v3 addSubsystem:@"com.apple.coreanimation" category:@"IOMFBServer"];
  [v3 addSubsystem:@"com.apple.coreanimation" category:@"WindowServer.Stalls"];
  [v3 addSubsystem:@"com.apple.coreanimation" category:@"WindowServer"];
  [v3 addSubsystem:@"com.apple.coreanimation" category:@"WindowServer"];
  [v3 addSubsystem:@"com.apple.SkyLight" category:@"tracing"];
  [v3 addSubsystem:@"com.apple.SkyLight" category:@"tracing.stalls"];
}

- (void)setTransactionLifetimeBlock:(id)a3
{
}

- (void)setRenderBlock:(id)a3
{
}

- (void)setHidLatencyBlock:(id)a3
{
}

- (void)setFrameLifetimeBlock:(id)a3
{
}

- (void)setFrameLatencyBlock:(id)a3
{
}

- (void)setCommitIntervalBlock:(id)a3
{
}

- (void)setClientDrawableIntervalBlock:(id)a3
{
}

- (SignpostCAInstrumentationProcessor)init
{
  v10.receiver = self;
  v10.super_class = (Class)SignpostCAInstrumentationProcessor;
  v2 = [(SignpostCAInstrumentationProcessor *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    frameSeedToAccumulatedStateDict = v2->_frameSeedToAccumulatedStateDict;
    v2->_frameSeedToAccumulatedStateDict = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    frameSeedToAccumulatedRenderStateDict = v2->_frameSeedToAccumulatedRenderStateDict;
    v2->_frameSeedToAccumulatedRenderStateDict = (NSMutableDictionary *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    queueIDToSurfaceIDToClientDrawableIntervalDict = v2->_queueIDToSurfaceIDToClientDrawableIntervalDict;
    v2->_queueIDToSurfaceIDToClientDrawableIntervalDict = (NSMutableDictionary *)v7;

    v2->_isConciseFormat = 0;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curFrameLifetimeBegin, 0);
  objc_storeStrong((id *)&self->_curLongFrameLifetimeBegin, 0);
  objc_storeStrong((id *)&self->_previousFrameLifetime, 0);
  objc_storeStrong((id *)&self->_queueIDToSurfaceIDToClientDrawableIntervalDict, 0);
  objc_storeStrong((id *)&self->_frameSeedToAccumulatedRenderStateDict, 0);
  objc_storeStrong((id *)&self->_frameSeedToAccumulatedStateDict, 0);
  objc_storeStrong(&self->_imageQueueSampleEventBlock, 0);
  objc_storeStrong(&self->_contextInfoBlock, 0);
  objc_storeStrong(&self->_frameLifetimeBlock, 0);
  objc_storeStrong(&self->_renderBlock, 0);
  objc_storeStrong(&self->_hidLatencyBlock, 0);
  objc_storeStrong(&self->_frameLatencyBlock, 0);
  objc_storeStrong(&self->_transactionLifetimeBlock, 0);
  objc_storeStrong(&self->_clientDrawableIntervalBlock, 0);

  objc_storeStrong(&self->_commitIntervalBlock, 0);
}

+ (BOOL)filterPassesRequiredSCForCAInstrumentation:(id)a3
{
  id v3 = a3;
  if ([v3 passesSubsystem:@"com.apple.coreanimation" category:@"Transaction.Stalls"]&& objc_msgSend(v3, "passesSubsystem:category:", @"com.apple.coreanimation", @"Transaction")&& objc_msgSend(v3, "passesSubsystem:category:", @"com.apple.coreanimation", @"IOMFBServer.Stalls")&& objc_msgSend(v3, "passesSubsystem:category:", @"com.apple.coreanimation", @"IOMFBServer")
    && [v3 passesSubsystem:@"com.apple.coreanimation" category:@"WindowServer.Stalls"]&& objc_msgSend(v3, "passesSubsystem:category:", @"com.apple.coreanimation", @"WindowServer")&& objc_msgSend(v3, "passesSubsystem:category:", @"com.apple.SkyLight", @"tracing"))
  {
    char v4 = [v3 passesSubsystem:@"com.apple.SkyLight" category:@"tracing.stalls"];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

+ (BOOL)filterPassesRequiredSCForCAMetalInstrumentation:(id)a3
{
  id v3 = a3;
  if ([v3 passesSubsystem:@"com.apple.coreanimation" category:@"CAMetalLayer"]&& objc_msgSend(v3, "passesSubsystem:category:", @"com.apple.coreanimation", @"CAMetalLayer.Stalls"))
  {
    char v4 = [v3 passesSubsystem:@"com.apple.coreanimation" category:@"CAImageQueue"];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

+ (void)addNeededSCToWhitelist:(id)a3
{
  id v3 = a3;
  [(id)objc_opt_class() addNeededSCToAllowlist:v3];
}

+ (void)addNeededMetalSCToAllowlist:(id)a3
{
  id v3 = a3;
  [v3 addSubsystem:@"com.apple.coreanimation" category:@"CAMetalLayer"];
  [v3 addSubsystem:@"com.apple.coreanimation" category:@"CAMetalLayer.Stalls"];
  [v3 addSubsystem:@"com.apple.coreanimation" category:@"CAImageQueue"];
  [v3 addSubsystem:@"com.apple.coreanimation" category:@"CAImageQueue.Stalls"];
}

- (void)_handleHIDInterval:(id)a3
{
  id v4 = a3;
  if ([(SignpostCAInstrumentationProcessor *)self curFrameSeed]
    && (int v5 = [v4 frameSeed],
        v5 != [(SignpostCAInstrumentationProcessor *)self curFrameSeed]))
  {
    uint64_t v7 = _signpost_debug_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[SignpostCAInstrumentationProcessor _handleHIDInterval:](v4, self);
    }
  }
  else
  {
    id v6 = [(SignpostCAInstrumentationProcessor *)self _stateForFrameSeed:[(SignpostCAInstrumentationProcessor *)self curFrameSeed]];
    [v6 setHidLatency:v4];
  }
}

- (void)_handleClientDrawableInterval:(id)a3
{
  id v14 = a3;
  id v4 = [(SignpostCAInstrumentationProcessor *)self queueIDToSurfaceIDToClientDrawableIntervalDict];
  int v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v14, "queueID"));
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (!v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v8 = [(SignpostCAInstrumentationProcessor *)self queueIDToSurfaceIDToClientDrawableIntervalDict];
    uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v14, "queueID"));
    [v8 setObject:v7 forKeyedSubscript:v9];
  }
  objc_super v10 = [(SignpostCAInstrumentationProcessor *)self queueIDToSurfaceIDToClientDrawableIntervalDict];
  BOOL v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v14, "queueID"));
  v12 = [v10 objectForKeyedSubscript:v11];
  int v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v14, "surfaceID"));
  [v12 setObject:v14 forKeyedSubscript:v13];
}

- (void)_handleFrameLatencyInterval:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(SignpostCAInstrumentationProcessor *)self curFrameSeed]
    && (int v5 = [v4 frameSeed],
        v5 != [(SignpostCAInstrumentationProcessor *)self curFrameSeed]))
  {
    id v6 = _signpost_debug_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[SignpostCAInstrumentationProcessor _handleFrameLatencyInterval:](v4, self);
    }
  }
  else
  {
    id v6 = [(SignpostCAInstrumentationProcessor *)self _stateForFrameSeed:[(SignpostCAInstrumentationProcessor *)self curFrameSeed]];
    [v6 setFrameLatency:v4];
    uint64_t v7 = [v6 contextIDtoContextInfoDict];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      uint64_t v9 = [MEMORY[0x1E4F1CA80] set];
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      objc_super v10 = [v6 contextIDtoContextInfoDict];
      BOOL v11 = [v10 objectEnumerator];

      uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v18;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v18 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v15), "pid"));
            [v9 addObject:v16];

            ++v15;
          }
          while (v13 != v15);
          uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v13);
      }

      [v4 setContributingPids:v9];
    }
  }
}

- (void)_handleImageQueueSampleEvent:(id)a3
{
  id v4 = a3;
  -[SignpostCAInstrumentationProcessor _renderStateForFrameSeed:](self, "_renderStateForFrameSeed:", [v4 frameSeed]);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  int v5 = [v6 imageQueueSampleEvents];
  [v5 addObject:v4];
}

- (void)handleDeviceReboot
{
  self->_frameSeedToAccumulatedStateDict = [MEMORY[0x1E4F1CA60] dictionary];

  MEMORY[0x1F41817F8]();
}

- (id)newConfiguredExtractor
{
  id v3 = objc_alloc_init(SignpostSupportObjectExtractor);
  id v4 = objc_alloc_init(SignpostSupportSubsystemCategoryAllowlist);
  [(id)objc_opt_class() addNeededSCToAllowlist:v4];
  [(id)objc_opt_class() addNeededMetalSCToAllowlist:v4];
  [(SignpostSupportObjectExtractor *)v3 setSubsystemCategoryFilter:v4];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__SignpostCAInstrumentationProcessor_newConfiguredExtractor__block_invoke;
  v9[3] = &unk_1E5B400C0;
  v9[4] = self;
  [(SignpostSupportObjectExtractor *)v3 setIntervalCompletionProcessingBlock:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__SignpostCAInstrumentationProcessor_newConfiguredExtractor__block_invoke_2;
  v8[3] = &unk_1E5B400E8;
  v8[4] = self;
  [(SignpostSupportObjectExtractor *)v3 setBeginEventProcessingBlock:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__SignpostCAInstrumentationProcessor_newConfiguredExtractor__block_invoke_3;
  v7[3] = &unk_1E5B400E8;
  v7[4] = self;
  [(SignpostSupportObjectExtractor *)v3 setEmitEventProcessingBlock:v7];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__SignpostCAInstrumentationProcessor_newConfiguredExtractor__block_invoke_4;
  v6[3] = &unk_1E5B40110;
  v6[4] = self;
  [(SignpostSupportObjectExtractor *)v3 setDeviceRebootProcessingBlock:v6];

  return v3;
}

uint64_t __60__SignpostCAInstrumentationProcessor_newConfiguredExtractor__block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

uint64_t __60__SignpostCAInstrumentationProcessor_newConfiguredExtractor__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return 1;
}

uint64_t __60__SignpostCAInstrumentationProcessor_newConfiguredExtractor__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return 1;
}

uint64_t __60__SignpostCAInstrumentationProcessor_newConfiguredExtractor__block_invoke_4(uint64_t a1)
{
  return 1;
}

- (id)clientDrawableIntervalBlock
{
  return self->_clientDrawableIntervalBlock;
}

- (id)transactionLifetimeBlock
{
  return self->_transactionLifetimeBlock;
}

- (void)setContextInfoBlock:(id)a3
{
}

- (id)imageQueueSampleEventBlock
{
  return self->_imageQueueSampleEventBlock;
}

- (void)setImageQueueSampleEventBlock:(id)a3
{
}

- (NSMutableDictionary)queueIDToSurfaceIDToClientDrawableIntervalDict
{
  return self->_queueIDToSurfaceIDToClientDrawableIntervalDict;
}

- (SignpostFrameLifetimeInterval)previousFrameLifetime
{
  return self->_previousFrameLifetime;
}

- (void)setPreviousFrameLifetime:(id)a3
{
}

- (SignpostEvent)curFrameLifetimeBegin
{
  return self->_curFrameLifetimeBegin;
}

- (void)_handleHIDInterval:(void *)a1 .cold.1(void *a1, void *a2)
{
  [a1 frameSeed];
  [a2 curFrameSeed];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1A4576000, v3, v4, "HID latency seed mismatch: %#x v. %#x", v5, v6, v7, v8, v9);
}

- (void)_handleFrameLatencyInterval:(void *)a1 .cold.1(void *a1, void *a2)
{
  [a1 frameSeed];
  [a2 curFrameSeed];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1A4576000, v3, v4, "Frame latency seed mismatch: %#x v. %#x", v5, v6, v7, v8, v9);
}

- (void)_handleContextInfo:(void *)a1 .cold.1(void *a1, void *a2)
{
  [a1 frameSeed];
  [a2 curFrameSeed];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1A4576000, v3, v4, "Context info frame seed mismatch: %#x v. %#x", v5, v6, v7, v8, v9);
}

- (void)_handleFrameLifetimeBegin:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A4576000, log, OS_LOG_TYPE_DEBUG, "Could not find frame seed for frame lifetime begin", v1, 2u);
}

@end