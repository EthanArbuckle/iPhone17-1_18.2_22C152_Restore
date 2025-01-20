@interface VTEvent
+ (id)eventFromURL:(id)a3;
+ (int64_t)eventTypeFromURL:(id)a3;
- (NSDictionary)voiceTriggerEventInfo;
- (NSURL)jsonFileUrl;
- (VTEvent)initWithEventLogURL:(id)a3;
- (id)_buildContent;
- (id)_buildDetail;
- (id)_buildTitle;
- (id)_buildTriggerContent;
- (id)_buildTriggerDetail;
- (id)_getFloatStringFromVTEventWithKey:(id)a3 decimal:(BOOL)a4;
- (id)_packAudioContent:(id)a3 filepath:(id)a4;
- (id)_packAudioURLFromVTEventInfo:(id)a3 key:(id)a4;
- (id)_packBooleanFromVTEventInfo:(id)a3 key:(id)a4;
- (id)_packStringContent:(id)a3 value:(id)a4;
- (id)_packStringFromVTEventInfo:(id)a3 key:(id)a4;
- (id)eventTrackerDictionary;
- (id)jsonFileName;
- (id)timestampString;
- (void)_readJsonFile:(id)a3;
@end

@implementation VTEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceTriggerEventInfo, 0);

  objc_storeStrong((id *)&self->_jsonFileUrl, 0);
}

- (NSDictionary)voiceTriggerEventInfo
{
  return self->_voiceTriggerEventInfo;
}

- (NSURL)jsonFileUrl
{
  return self->_jsonFileUrl;
}

- (id)_packStringFromVTEventInfo:(id)a3 key:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self->_voiceTriggerEventInfo;
  v9 = [(NSDictionary *)v8 objectForKey:v7];

  if (v9)
  {
    v10 = [(NSDictionary *)v8 objectForKey:v7];
    v11 = [(VTEvent *)self _packStringContent:v6 value:v10];
  }
  else
  {
    v11 = [(VTEvent *)self _packStringContent:v6 value:&stru_26C99F218];
  }

  return v11;
}

- (id)_packBooleanFromVTEventInfo:(id)a3 key:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self->_voiceTriggerEventInfo;
  v9 = [(NSDictionary *)v8 objectForKey:v7];

  if (v9)
  {
    v10 = [(NSDictionary *)v8 objectForKey:v7];
    int v11 = [v10 BOOLValue];
    v12 = @"False";
    if (v11) {
      v12 = @"True";
    }
    v13 = v12;

    v14 = [(VTEvent *)self _packStringContent:v6 value:v13];
  }
  else
  {
    v14 = [(VTEvent *)self _packStringContent:v6 value:&stru_26C99F218];
  }

  return v14;
}

- (id)_getFloatStringFromVTEventWithKey:(id)a3 decimal:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = self->_voiceTriggerEventInfo;
  v8 = [(NSDictionary *)v7 objectForKey:v6];

  if (v8)
  {
    v9 = [(NSDictionary *)v7 objectForKey:v6];
    [v9 floatValue];
    float v11 = v10;

    if (v4) {
      v12 = @"%.2f";
    }
    else {
      v12 = @"%.0f";
    }
    objc_msgSend(NSString, "stringWithFormat:", v12, v11);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = &stru_26C99F218;
  }

  return v13;
}

- (id)_packAudioURLFromVTEventInfo:(id)a3 key:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self->_voiceTriggerEventInfo;
  v9 = [(NSDictionary *)v8 objectForKey:v7];

  if (v9)
  {
    float v10 = [(NSDictionary *)v8 objectForKey:v7];
    float v11 = [(VTEvent *)self _packAudioContent:v6 filepath:v10];
  }
  else
  {
    float v11 = [(VTEvent *)self _packAudioContent:v6 filepath:&stru_26C99F218];
  }

  return v11;
}

- (id)_packStringContent:(id)a3 value:(id)a4
{
  v11[3] = *MEMORY[0x263EF8340];
  v10[0] = @"type";
  v10[1] = @"name";
  v11[0] = @"plain";
  v11[1] = a3;
  v10[2] = @"value";
  v11[2] = a4;
  v5 = NSDictionary;
  id v6 = a4;
  id v7 = a3;
  v8 = [v5 dictionaryWithObjects:v11 forKeys:v10 count:3];

  return v8;
}

- (id)_packAudioContent:(id)a3 filepath:(id)a4
{
  v11[3] = *MEMORY[0x263EF8340];
  v10[0] = @"type";
  v10[1] = @"name";
  v11[0] = @"audio";
  v11[1] = a3;
  v10[2] = @"value";
  v11[2] = a4;
  v5 = NSDictionary;
  id v6 = a4;
  id v7 = a3;
  v8 = [v5 dictionaryWithObjects:v11 forKeys:v10 count:3];

  return v8;
}

- (id)_buildTriggerDetail
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  BOOL v4 = [(VTEvent *)self timestampString];
  v5 = [(VTEvent *)self _packStringContent:@"DateTime" value:v4];
  [v3 addObject:v5];

  voiceTriggerEventInfo = self->_voiceTriggerEventInfo;
  if (voiceTriggerEventInfo)
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v7 = [(NSDictionary *)voiceTriggerEventInfo allKeys];
    v8 = [v7 sortedArrayUsingSelector:sel_localizedCaseInsensitiveCompare_];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v31 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v14 = *(void *)(*((void *)&v30 + 1) + 8 * i);
          v15 = [(NSDictionary *)self->_voiceTriggerEventInfo objectForKey:v14];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v16 = [MEMORY[0x263F08B08] scannerWithString:v15];
            if ([v16 scanInt:0] && objc_msgSend(v16, "isAtEnd"))
            {
              v17 = self;
              uint64_t v18 = v14;
              uint64_t v19 = 0;
              goto LABEL_26;
            }
            if ([v16 scanFloat:0] && objc_msgSend(v16, "isAtEnd"))
            {
              v17 = self;
              uint64_t v18 = v14;
              uint64_t v19 = 1;
LABEL_26:
              v13 = [(VTEvent *)v17 _getFloatStringFromVTEventWithKey:v18 decimal:v19];
              v28 = [(VTEvent *)self _packStringContent:v14 value:v13];
              [v3 addObject:v28];
            }
            else
            {
              v13 = [(VTEvent *)self _packStringFromVTEventInfo:v14 key:v14];
              [v3 addObject:v13];
            }

LABEL_8:
            goto LABEL_9;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v20 = v15;
            if (!strcmp((const char *)[v20 objCType], "c")
              || (id v21 = v20, !strcmp((const char *)[v21 objCType], "i"))
              || (id v22 = v21, !strcmp((const char *)[v22 objCType], "s"))
              || (id v23 = v22, !strcmp((const char *)[v23 objCType], "q"))
              || !strcmp((const char *)[v23 objCType], "q"))
            {
              v24 = self;
              uint64_t v25 = v14;
              uint64_t v26 = v14;
              v27 = @"%.0f";
            }
            else
            {
              v24 = self;
              uint64_t v25 = v14;
              uint64_t v26 = v14;
              v27 = @"%.2f";
            }
            v16 = [(VTEvent *)v24 _packNumberFomVTEventInfo:v25 key:v26 format:v27];
            [v3 addObject:v16];
            goto LABEL_8;
          }
LABEL_9:
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v10);
    }
  }

  return v3;
}

- (id)_buildTriggerContent
{
  v3 = [MEMORY[0x263EFF980] array];
  BOOL v4 = [(VTEvent *)self _packAudioURLFromVTEventInfo:@"Audio Play" key:@"captureFilePath"];
  [v3 addObject:v4];

  v5 = [(VTEvent *)self _getFloatStringFromVTEventWithKey:@"triggerScore" decimal:1];
  id v6 = [(VTEvent *)self _packStringContent:@"Trigger Score" value:v5];
  [v3 addObject:v6];

  id v7 = [(VTEvent *)self _getFloatStringFromVTEventWithKey:@"effectiveThreshold" decimal:1];
  v8 = [(VTEvent *)self _packStringContent:@"Trigger Threshold" value:v7];
  [v3 addObject:v8];

  uint64_t v9 = [(VTEvent *)self _getFloatStringFromVTEventWithKey:@"satScore" decimal:1];
  uint64_t v10 = [(VTEvent *)self _packStringContent:@"SAT Score" value:v9];
  [v3 addObject:v10];

  uint64_t v11 = [(VTEvent *)self _getFloatStringFromVTEventWithKey:@"satThreshold" decimal:1];
  v12 = [(VTEvent *)self _packStringContent:@"SAT Threshold" value:v11];
  [v3 addObject:v12];

  return v3;
}

- (id)_buildDetail
{
  return 0;
}

- (id)_buildContent
{
  return 0;
}

- (id)_buildTitle
{
  return 0;
}

- (id)eventTrackerDictionary
{
  v15[3] = *MEMORY[0x263EF8340];
  v14[0] = @"title";
  uint64_t v3 = [(VTEvent *)self _buildTitle];
  BOOL v4 = (void *)v3;
  if (v3) {
    v5 = (__CFString *)v3;
  }
  else {
    v5 = @"???";
  }
  v15[0] = v5;
  v14[1] = @"content";
  uint64_t v6 = [(VTEvent *)self _buildContent];
  id v7 = (void *)v6;
  if (v6) {
    v8 = (__CFString *)v6;
  }
  else {
    v8 = @"???";
  }
  v15[1] = v8;
  v14[2] = @"detail";
  uint64_t v9 = [(VTEvent *)self _buildDetail];
  uint64_t v10 = (void *)v9;
  if (v9) {
    uint64_t v11 = (__CFString *)v9;
  }
  else {
    uint64_t v11 = @"???";
  }
  v15[2] = v11;
  v12 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];

  return v12;
}

- (id)timestampString
{
  v2 = [(VTEvent *)self jsonFileName];
  uint64_t v3 = &stru_26C99F218;
  BOOL v4 = [v2 stringByReplacingOccurrencesOfString:@"-almost.json" withString:&stru_26C99F218];

  v5 = [v4 stringByReplacingOccurrencesOfString:@"-rejected.json" withString:&stru_26C99F218];

  uint64_t v6 = [v5 stringByReplacingOccurrencesOfString:@"-triggered.json" withString:&stru_26C99F218];

  id v7 = [v6 stringByReplacingOccurrencesOfString:@"-prepare.json" withString:&stru_26C99F218];

  v8 = [v7 stringByReplacingOccurrencesOfString:@"-corrupted.json" withString:&stru_26C99F218];

  id v9 = objc_alloc_init(MEMORY[0x263F08790]);
  uint64_t v10 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v9 setLocale:v10];

  [v9 setDateFormat:@"yyyyMMdd-HHmmss"];
  uint64_t v11 = [v9 dateFromString:v8];
  if (v11)
  {
    [v9 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    uint64_t v3 = [v9 stringFromDate:v11];
  }

  return v3;
}

- (void)_readJsonFile:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v11 = v4;
    v5 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v6 = [v11 path];
    int v7 = [v5 fileExistsAtPath:v6];

    if (v7)
    {
      v8 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v11];
      id v9 = [MEMORY[0x263F08900] JSONObjectWithData:v8 options:0 error:0];
      voiceTriggerEventInfo = self->_voiceTriggerEventInfo;
      self->_voiceTriggerEventInfo = v9;
    }
    id v4 = v11;
  }
}

- (id)jsonFileName
{
  return [(NSURL *)self->_jsonFileUrl lastPathComponent];
}

- (VTEvent)initWithEventLogURL:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VTEvent;
  uint64_t v6 = [(VTEvent *)&v9 init];
  int v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_jsonFileUrl, a3);
    [(VTEvent *)v7 _readJsonFile:v5];
  }

  return v7;
}

+ (int64_t)eventTypeFromURL:(id)a3
{
  uint64_t v3 = [a3 lastPathComponent];
  if ([v3 hasSuffix:@"-almost.json"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 hasSuffix:@"-rejected.json"])
  {
    int64_t v4 = 3;
  }
  else if ([v3 hasSuffix:@"-triggered.json"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 hasSuffix:@"-prepare.json"])
  {
    int64_t v4 = 4;
  }
  else if ([v3 hasSuffix:@"-corrupted.json"])
  {
    int64_t v4 = 5;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

+ (id)eventFromURL:(id)a3
{
  id v3 = a3;
  int64_t v4 = +[VTEvent eventTypeFromURL:v3];
  if ((unint64_t)(v4 - 1) > 4) {
    id v5 = 0;
  }
  else {
    id v5 = (void *)[objc_alloc(*off_264325AF0[v4 - 1]) initWithEventLogURL:v3];
  }

  return v5;
}

@end