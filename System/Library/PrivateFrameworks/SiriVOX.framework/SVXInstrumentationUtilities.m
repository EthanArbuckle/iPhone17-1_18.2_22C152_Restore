@interface SVXInstrumentationUtilities
- (SVXInstrumentationUtilities)init;
- (SVXInstrumentationUtilities)initWithSiriAnalyticsProvider:(id)a3 powerInstrumentation:(id)a4;
- (int)convertModeToResponseMode:(unint64_t)a3;
- (int)rfSchemaRFPatternFromPatternType:(id)a3;
- (int)rfSchemaRFSiriModeFromResponseMode:(id)a3;
- (void)_emitUUFRSaidWithModeSupport:(id)a3 dialogIdentifier:(id)a4 dialogPhase:(id)a5 speakableText:(id)a6 currentMode:(unint64_t)a7;
- (void)emitPatternExecutedEvent:(id)a3 addViews:(id)a4;
- (void)emitSiriWasUnavailable:(id)a3 reason:(int)a4;
- (void)emitUUFRSaid:(id)a3 dialogIdentifier:(id)a4 dialogPhase:(id)a5;
@end

@implementation SVXInstrumentationUtilities

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerInstrumentation, 0);

  objc_storeStrong((id *)&self->_siriAnalyticsProvider, 0);
}

- (void)emitSiriWasUnavailable:(id)a3 reason:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v6 = (objc_class *)MEMORY[0x263F6EE68];
  id v7 = a3;
  id v15 = objc_alloc_init(v6);
  [v15 setReason:v4];
  [v15 setProduct:1];
  id v8 = objc_alloc_init(MEMORY[0x263F6ED28]);
  v9 = AFTurnIdentifierGenerate();
  v10 = AFTurnIdentifierGetBytes();
  [v8 setTurnID:v10];

  id v11 = objc_alloc_init(MEMORY[0x263F6ED20]);
  [v11 setUeiSiriWasUnavailable:v15];
  [v11 setEventMetadata:v8];
  v12 = [(SVXAssistantSiriAnalyticsProvider *)self->_siriAnalyticsProvider get];
  v13 = [v12 defaultMessageStream];
  uint64_t v14 = [v7 timestamp];

  [v13 emitMessage:v11 timestamp:v14];
}

- (int)convertModeToResponseMode:(unint64_t)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (a3 < 3) {
    return a3 + 1;
  }
  uint64_t v4 = *MEMORY[0x263F28348];
  int result = os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR);
  if (result)
  {
    int v5 = 136315138;
    v6 = "-[SVXInstrumentationUtilities convertModeToResponseMode:]";
    _os_log_error_impl(&dword_220062000, v4, OS_LOG_TYPE_ERROR, "%s #SVXInstrumentation - Unable to convert. Using unknown MDMode.", (uint8_t *)&v5, 0xCu);
    return 0;
  }
  return result;
}

- (int)rfSchemaRFPatternFromPatternType:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3)
  {
    if ([v3 caseInsensitiveCompare:@"pattern.ResultSet"])
    {
      if ([v4 caseInsensitiveCompare:@"pattern.TableSet"])
      {
        if ([v4 caseInsensitiveCompare:@"pattern.SimpleResult"])
        {
          if ([v4 caseInsensitiveCompare:@"pattern.DetailedResult"])
          {
            if ([v4 caseInsensitiveCompare:@"pattern.SuccessStatus"])
            {
              if ([v4 caseInsensitiveCompare:@"pattern.CancelledStatus"])
              {
                if ([v4 caseInsensitiveCompare:@"pattern.ErrorStatus"])
                {
                  if ([v4 caseInsensitiveCompare:@"pattern.ProgressStatus"])
                  {
                    if ([v4 caseInsensitiveCompare:@"pattern.OpenEndedClarification"])
                    {
                      if ([v4 caseInsensitiveCompare:@"pattern.YesNoClarification"])
                      {
                        if ([v4 caseInsensitiveCompare:@"pattern.SimpleDisambiguationClarification"])
                        {
                          if ([v4 caseInsensitiveCompare:@"pattern.DetailedDisambiguationClarification"])
                          {
                            if ([v4 caseInsensitiveCompare:@"pattern.MultiLevelResultSet"])
                            {
                              if ([v4 caseInsensitiveCompare:@"pattern.DetailedDisambiguationPrompt"])
                              {
                                if ([v4 caseInsensitiveCompare:@"pattern.OpenEndedPrompt"])
                                {
                                  if ([v4 caseInsensitiveCompare:@"pattern.SimpleDisambiguationPrompt"])
                                  {
                                    if ([v4 caseInsensitiveCompare:@"pattern.YesNoPrompt"]) {
                                      int v5 = 0;
                                    }
                                    else {
                                      int v5 = 18;
                                    }
                                  }
                                  else
                                  {
                                    int v5 = 17;
                                  }
                                }
                                else
                                {
                                  int v5 = 16;
                                }
                              }
                              else
                              {
                                int v5 = 15;
                              }
                            }
                            else
                            {
                              int v5 = 4;
                            }
                          }
                          else
                          {
                            int v5 = 10;
                          }
                        }
                        else
                        {
                          int v5 = 9;
                        }
                      }
                      else
                      {
                        int v5 = 7;
                      }
                    }
                    else
                    {
                      int v5 = 8;
                    }
                  }
                  else
                  {
                    int v5 = 14;
                  }
                }
                else
                {
                  int v5 = 12;
                }
              }
              else
              {
                int v5 = 13;
              }
            }
            else
            {
              int v5 = 11;
            }
          }
          else
          {
            int v5 = 2;
          }
        }
        else
        {
          int v5 = 1;
        }
      }
      else
      {
        int v5 = 5;
      }
    }
    else
    {
      int v5 = 3;
    }
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

- (int)rfSchemaRFSiriModeFromResponseMode:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3)
  {
    if ([v3 caseInsensitiveCompare:*MEMORY[0x263F65E88]])
    {
      if ([v4 caseInsensitiveCompare:*MEMORY[0x263F65E80]])
      {
        if ([v4 caseInsensitiveCompare:*MEMORY[0x263F65E98]])
        {
          if ([v4 caseInsensitiveCompare:*MEMORY[0x263F65E90]]) {
            int v5 = 0;
          }
          else {
            int v5 = 3;
          }
        }
        else
        {
          int v5 = 4;
        }
      }
      else
      {
        int v5 = 2;
      }
    }
    else
    {
      int v5 = 1;
    }
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

- (void)emitPatternExecutedEvent:(id)a3 addViews:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 patternId];

  if (v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x263F6EBC8]);
    v10 = [v7 patternId];
    [v9 setPatternId:v10];

    id v11 = [v7 patternType];
    objc_msgSend(v9, "setPattern:", -[SVXInstrumentationUtilities rfSchemaRFPatternFromPatternType:](self, "rfSchemaRFPatternFromPatternType:", v11));

    v12 = [v7 responseMode];
    objc_msgSend(v9, "setMode:", -[SVXInstrumentationUtilities rfSchemaRFSiriModeFromResponseMode:](self, "rfSchemaRFSiriModeFromResponseMode:", v12));

    id v13 = objc_alloc_init(MEMORY[0x263F6EB98]);
    id v14 = objc_alloc(MEMORY[0x263F6EEE0]);
    id v15 = [v6 turnIdentifier];
    v16 = (void *)[v14 initWithNSUUID:v15];
    [v13 setTurnId:v16];

    id v17 = objc_alloc_init(MEMORY[0x263F6EB90]);
    [v17 setEventMetadata:v13];
    [v17 setPatternExecuted:v9];
    v18 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      int v21 = 136315394;
      v22 = "-[SVXInstrumentationUtilities emitPatternExecutedEvent:addViews:]";
      __int16 v23 = 2112;
      id v24 = v7;
      _os_log_impl(&dword_220062000, v18, OS_LOG_TYPE_INFO, "%s #SVXInstrumentation - Emit Pattern Executed event (addViews: %@)", (uint8_t *)&v21, 0x16u);
    }
    v19 = [(SVXAssistantSiriAnalyticsProvider *)self->_siriAnalyticsProvider get];
    v20 = [v19 defaultMessageStream];
    [v20 emitMessage:v17];
  }
}

- (void)_emitUUFRSaidWithModeSupport:(id)a3 dialogIdentifier:(id)a4 dialogPhase:(id)a5 speakableText:(id)a6 currentMode:(unint64_t)a7
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = (objc_class *)MEMORY[0x263F6EDC8];
  id v16 = a3;
  id v17 = objc_alloc_init(v15);
  [v17 setDialogPhase:v13];
  [v17 setPresentationType:6];
  objc_msgSend(v17, "setSiriResponseMode:", -[SVXInstrumentationUtilities convertModeToResponseMode:](self, "convertModeToResponseMode:", a7));
  id v18 = objc_alloc_init(MEMORY[0x263F6EEB8]);
  [v18 setDialogIdentifier:v12];
  [v18 setSiriResponseContext:v17];
  int v19 = [v14 containsString:@"\\audio=/successSonicResponse"];
  v20 = (os_log_t *)MEMORY[0x263F28348];
  if (v19)
  {
    [v18 setHasSonicResponse:1];
    if ([v14 containsString:@"\\audio=/successSonicResponse&overlap"])
    {
      [v18 setSonicResponse:2];
      os_log_t v21 = *v20;
      if (!os_log_type_enabled(*v20, OS_LOG_TYPE_INFO)) {
        goto LABEL_7;
      }
    }
    else
    {
      [v18 setSonicResponse:4];
      os_log_t v21 = *v20;
      if (!os_log_type_enabled(*v20, OS_LOG_TYPE_INFO)) {
        goto LABEL_7;
      }
    }
    v22 = v21;
    *(_DWORD *)v26 = 136315394;
    *(void *)&v26[4] = "-[SVXInstrumentationUtilities _emitUUFRSaidWithModeSupport:dialogIdentifier:dialogPhase:speakab"
                         "leText:currentMode:]";
    *(_WORD *)&v26[12] = 1024;
    *(_DWORD *)&v26[14] = [v18 sonicResponse];
    _os_log_impl(&dword_220062000, v22, OS_LOG_TYPE_INFO, "%s #SVXInstrumentation - Added sonic response to UUFR said event (type: %d)", v26, 0x12u);
  }
LABEL_7:
  os_log_t v23 = *v20;
  if (os_log_type_enabled(*v20, OS_LOG_TYPE_INFO))
  {
    id v24 = v23;
    uint64_t v25 = MDModeGetName();
    *(_DWORD *)v26 = 136315906;
    *(void *)&v26[4] = "-[SVXInstrumentationUtilities _emitUUFRSaidWithModeSupport:dialogIdentifier:dialogPhase:speakab"
                         "leText:currentMode:]";
    *(_WORD *)&v26[12] = 2112;
    *(void *)&v26[14] = v12;
    *(_WORD *)&v26[22] = 2112;
    id v27 = v13;
    __int16 v28 = 2112;
    v29 = v25;
    _os_log_impl(&dword_220062000, v24, OS_LOG_TYPE_INFO, "%s #SVXInstrumentation - Emit UUFR said event (dialogIdentifier: %@, dialogPhase: %@, mode: %@)", v26, 0x2Au);
  }
  objc_msgSend(v16, "emitInstrumentation:", v18, *(_OWORD *)v26, *(void *)&v26[16]);
}

- (void)emitUUFRSaid:(id)a3 dialogIdentifier:(id)a4 dialogPhase:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  id v9 = (objc_class *)MEMORY[0x263F6EDC8];
  id v10 = a3;
  id v11 = objc_alloc_init(v9);
  [v11 setDialogPhase:v8];
  [v11 setPresentationType:6];
  [v11 setSiriResponseMode:1];
  id v12 = objc_alloc_init(MEMORY[0x263F6EEB8]);
  [v12 setDialogIdentifier:v7];
  [v12 setSiriResponseContext:v11];
  id v13 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v14 = 136315650;
    id v15 = "-[SVXInstrumentationUtilities emitUUFRSaid:dialogIdentifier:dialogPhase:]";
    __int16 v16 = 2112;
    id v17 = v7;
    __int16 v18 = 2112;
    id v19 = v8;
    _os_log_impl(&dword_220062000, v13, OS_LOG_TYPE_INFO, "%s #SVXInstrumentation - Emit UUFR said event (dialogIdentifier: %@, dialogPhase: %@)", (uint8_t *)&v14, 0x20u);
  }
  [v10 emitInstrumentation:v12];
}

- (SVXInstrumentationUtilities)initWithSiriAnalyticsProvider:(id)a3 powerInstrumentation:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SVXInstrumentationUtilities;
  id v9 = [(SVXInstrumentationUtilities *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_siriAnalyticsProvider, a3);
    objc_storeStrong((id *)&v10->_powerInstrumentation, a4);
  }

  return v10;
}

- (SVXInstrumentationUtilities)init
{
  id v3 = objc_alloc_init(SVXAssistantSiriAnalyticsProvider);
  uint64_t v4 = objc_alloc_init(SVXPowerInstrumentation);
  int v5 = [(SVXInstrumentationUtilities *)self initWithSiriAnalyticsProvider:v3 powerInstrumentation:v4];

  return v5;
}

@end