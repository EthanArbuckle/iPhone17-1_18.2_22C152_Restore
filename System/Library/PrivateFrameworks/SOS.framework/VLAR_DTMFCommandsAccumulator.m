@interface VLAR_DTMFCommandsAccumulator
- (VLAR_DTMFCommandsAccumulator)init;
- (id)_stringFromDTMFCommand:(unint64_t)a3 withPlaybackState:(unint64_t)a4;
- (id)analyticsDataDict;
- (id)reportedCommands;
- (void)noteDidReceiveDTMFCommand:(unint64_t)a3 withPlaybackState:(unint64_t)a4;
@end

@implementation VLAR_DTMFCommandsAccumulator

- (VLAR_DTMFCommandsAccumulator)init
{
  v8.receiver = self;
  v8.super_class = (Class)VLAR_DTMFCommandsAccumulator;
  v2 = [(VLAR_DTMFCommandsAccumulator *)&v8 init];
  if (v2)
  {
    v3 = [[SOSAnalyticsEventAccumulator alloc] initWithName:@"DTMFCommand"];
    commandsAccumulator = v2->_commandsAccumulator;
    v2->_commandsAccumulator = v3;

    v5 = [[SOSAnalyticsEventAccumulator alloc] initWithName:@"DTMFCommand-PlaybackState"];
    commandsWithPlaybackStateAccumulator = v2->_commandsWithPlaybackStateAccumulator;
    v2->_commandsWithPlaybackStateAccumulator = v5;
  }
  return v2;
}

- (id)_stringFromDTMFCommand:(unint64_t)a3 withPlaybackState:(unint64_t)a4
{
  if ((uint64_t)a3 <= 199)
  {
    if (!a3)
    {
      v4 = @"None";
      goto LABEL_13;
    }
    if (a3 == 100)
    {
      v4 = @"Stop";
      goto LABEL_13;
    }
  }
  else
  {
    switch(a3)
    {
      case 0xC8uLL:
        v4 = @"Repeat";
        goto LABEL_13;
      case 0x1388uLL:
        v4 = @"Resume";
        goto LABEL_13;
      case 0x2710uLL:
        v4 = @"Unhandled";
        goto LABEL_13;
    }
  }
  v4 = @"Unknown";
LABEL_13:
  v5 = @"NotStarted";
  v6 = @"Responding";
  v7 = @"Repeating";
  if (a4 != 400) {
    v7 = @"NotStarted";
  }
  if (a4 != 300) {
    v6 = v7;
  }
  if (a4 == 200) {
    v5 = @"Stopped";
  }
  if (a4 == 100) {
    v5 = @"InitialLoop";
  }
  if ((uint64_t)a4 > 299) {
    v5 = v6;
  }
  return (id)[(__CFString *)v4 stringByAppendingFormat:@"-%@", v5];
}

- (void)noteDidReceiveDTMFCommand:(unint64_t)a3 withPlaybackState:(unint64_t)a4
{
  commandsAccumulator = self->_commandsAccumulator;
  if ((uint64_t)a3 <= 199)
  {
    if (!a3)
    {
      objc_super v8 = @"None";
      goto LABEL_13;
    }
    if (a3 == 100)
    {
      objc_super v8 = @"Stop";
      goto LABEL_13;
    }
  }
  else
  {
    switch(a3)
    {
      case 0xC8uLL:
        objc_super v8 = @"Repeat";
        goto LABEL_13;
      case 0x1388uLL:
        objc_super v8 = @"Resume";
        goto LABEL_13;
      case 0x2710uLL:
        objc_super v8 = @"Unhandled";
        goto LABEL_13;
    }
  }
  objc_super v8 = @"Unknown";
LABEL_13:
  [(SOSAnalyticsEventAccumulator *)commandsAccumulator noteEvent:v8];
  commandsWithPlaybackStateAccumulator = self->_commandsWithPlaybackStateAccumulator;
  id v10 = [(VLAR_DTMFCommandsAccumulator *)self _stringFromDTMFCommand:a3 withPlaybackState:a4];
  [(SOSAnalyticsEventAccumulator *)commandsWithPlaybackStateAccumulator noteEvent:v10];
}

- (id)reportedCommands
{
  if (+[SOSUtilities BOOLOverrideForDefaultsKey:@"debug.voiceloop.demo.allowResume" defaultValue:0])
  {
    v2 = [&unk_1F0C4ACF0 arrayByAddingObject:&unk_1F0C4AB70];
  }
  else
  {
    v2 = &unk_1F0C4ACF0;
  }

  return v2;
}

- (id)analyticsDataDict
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v3 = [(VLAR_DTMFCommandsAccumulator *)self reportedCommands];
  v23 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(&unk_1F0C4AD08, "count") * objc_msgSend(v3, "count"));
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  obuint64_t j = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v28 objects:v35 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v22 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v29 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = [*(id *)(*((void *)&v28 + 1) + 8 * i) unsignedIntegerValue];
        uint64_t v9 = v8;
        if (v8 <= 199)
        {
          id v10 = @"None";
          if (!v8) {
            goto LABEL_17;
          }
          if (v8 == 100)
          {
            id v10 = @"Stop";
            goto LABEL_17;
          }
        }
        else
        {
          switch(v8)
          {
            case 200:
              id v10 = @"Repeat";
              goto LABEL_17;
            case 5000:
              id v10 = @"Resume";
              goto LABEL_17;
            case 10000:
              id v10 = @"Unhandled";
              goto LABEL_17;
          }
        }
        id v10 = @"Unknown";
LABEL_17:
        [v23 addObject:v10];
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        uint64_t v11 = [&unk_1F0C4AD08 countByEnumeratingWithState:&v24 objects:v34 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v25;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v25 != v13) {
                objc_enumerationMutation(&unk_1F0C4AD08);
              }
              v15 = -[VLAR_DTMFCommandsAccumulator _stringFromDTMFCommand:withPlaybackState:](self, "_stringFromDTMFCommand:withPlaybackState:", v9, [*(id *)(*((void *)&v24 + 1) + 8 * j) unsignedIntegerValue]);
              [v4 addObject:v15];
            }
            uint64_t v12 = [&unk_1F0C4AD08 countByEnumeratingWithState:&v24 objects:v34 count:16];
          }
          while (v12);
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v28 objects:v35 count:16];
    }
    while (v6);
  }

  v32[0] = @"AllEventsKey";
  v32[1] = @"KnownEventsKey";
  v33[0] = @"nDTMFCommands_Total";
  v33[1] = @"nDTMFCommands_Known";
  v32[2] = @"UnknownEventsKey";
  v33[2] = @"nDTMFCommands_Unknown";
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:3];
  v17 = [(SOSAnalyticsEventAccumulator *)self->_commandsAccumulator analyticsDataDictForAccumulatedKeys:v23 outputKeyPrefix:@"nDTMFCommand_" summaryKeysDict:0];
  v18 = [(SOSAnalyticsEventAccumulator *)self->_commandsWithPlaybackStateAccumulator analyticsDataDictForAccumulatedKeys:v4 outputKeyPrefix:@"nDTMFCommand_" summaryKeysDict:v16];
  v19 = (void *)[v17 mutableCopy];
  [v19 addEntriesFromDictionary:v18];

  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandsWithPlaybackStateAccumulator, 0);

  objc_storeStrong((id *)&self->_commandsAccumulator, 0);
}

@end