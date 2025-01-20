@interface SiriUICardLogger
+ (id)_sharedInstance;
+ (id)logCard:(id)a3;
+ (id)logCard:(id)a3 format:(unint64_t)a4;
+ (id)logCardData:(id)a3;
+ (id)logCardData:(id)a3 format:(unint64_t)a4;
- (SiriUICardLogger)init;
- (id)_currentFilenameForFormat:(unint64_t)a3;
- (id)_dateFormatter;
- (id)_nowString;
@end

@implementation SiriUICardLogger

+ (id)_sharedInstance
{
  if (_sharedInstance_onceToken != -1) {
    dispatch_once(&_sharedInstance_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)_sharedInstance_sCardLogger;
  return v2;
}

uint64_t __35__SiriUICardLogger__sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(SiriUICardLogger);
  uint64_t v1 = _sharedInstance_sCardLogger;
  _sharedInstance_sCardLogger = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

+ (id)logCardData:(id)a3
{
  return (id)[a1 logCardData:a3 format:0];
}

+ (id)logCardData:(id)a3 format:(unint64_t)a4
{
  v6 = (objc_class *)MEMORY[0x263F677D0];
  id v7 = a3;
  id v8 = [v6 alloc];
  v9 = (void *)[objc_alloc(MEMORY[0x263F67B20]) initWithData:v7];

  v10 = (void *)[v8 initWithProtobuf:v9];
  v11 = [a1 logCard:v10 format:a4];

  return v11;
}

+ (id)logCard:(id)a3
{
  return (id)[a1 logCard:a3 format:0];
}

+ (id)logCard:(id)a3 format:(unint64_t)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [v5 backingCard];
  if (v6)
  {
    id v7 = +[SiriUICardLogger _sharedInstance];
    id v8 = [v7 _currentFilenameForFormat:a4];

    v9 = (void *)[objc_alloc(MEMORY[0x263F67B20]) initWithFacade:v6];
    v10 = [v9 data];
    v11 = v10;
    switch(a4)
    {
      case 0uLL:
        if ([v10 writeToFile:v8 atomically:0]) {
          goto LABEL_13;
        }
        goto LABEL_4;
      case 1uLL:
        v13 = [v10 base64EncodedStringWithOptions:32];
        char v14 = [v13 writeToFile:v8 atomically:0 encoding:4 error:0];
        goto LABEL_12;
      case 2uLL:
        v15 = [v9 jsonData];
        goto LABEL_11;
      case 3uLL:
        v15 = [v9 dictionaryRepresentation];
LABEL_11:
        v13 = v15;
        char v14 = [v15 writeToFile:v8 atomically:0];
LABEL_12:
        char v16 = v14;

        if ((v16 & 1) == 0) {
          goto LABEL_4;
        }
LABEL_13:
        v17 = *MEMORY[0x263F28348];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
        {
          int v19 = 136315650;
          v20 = "+[SiriUICardLogger logCard:format:]";
          __int16 v21 = 2112;
          v22 = v8;
          __int16 v23 = 2112;
          id v24 = v5;
          _os_log_impl(&dword_2231EF000, v17, OS_LOG_TYPE_DEFAULT, "%s #cards Logged card to file\n    Filename: %@\n    Card: %@", (uint8_t *)&v19, 0x20u);
        }
        id v12 = v8;
        break;
      default:
LABEL_4:
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
          +[SiriUICardLogger logCard:format:]();
        }
        id v12 = 0;
        break;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (SiriUICardLogger)init
{
  v6.receiver = self;
  v6.super_class = (Class)SiriUICardLogger;
  v2 = [(SiriUICardLogger *)&v6 init];
  v3 = v2;
  if (v2)
  {
    dateFormatter = v2->_dateFormatter;
    v2->_dateFormatter = 0;
  }
  return v3;
}

- (id)_currentFilenameForFormat:(unint64_t)a3
{
  if (a3 > 3)
  {
    v4 = 0;
    id v5 = 0;
  }
  else
  {
    v4 = off_26469F060[a3];
    id v5 = off_26469F080[a3];
  }
  id v6 = [NSString alloc];
  id v7 = AFLogDirectory();
  id v8 = [v7 stringByAppendingPathComponent:@"CardLogs"];

  v9 = [MEMORY[0x263F08850] defaultManager];
  id v15 = 0;
  char v10 = [v9 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:&v15];
  id v11 = v15;

  if ((v10 & 1) == 0 && os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    -[SiriUICardLogger _currentFilenameForFormat:]();
  }

  id v12 = [(SiriUICardLogger *)self _nowString];
  v13 = (void *)[v6 initWithFormat:@"%@/siri-card-%@-%@.%@", v8, v12, v5, v4];

  return v13;
}

- (id)_dateFormatter
{
  dateFormatter = self->_dateFormatter;
  if (!dateFormatter)
  {
    v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x263F08790]);
    id v5 = self->_dateFormatter;
    self->_dateFormatter = v4;

    id v6 = self->_dateFormatter;
    id v7 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en-US"];
    [(NSDateFormatter *)v6 setLocale:v7];

    [(NSDateFormatter *)self->_dateFormatter setDateFormat:@"yyyy_MM_dd-HHmmss"];
    dateFormatter = self->_dateFormatter;
  }
  return dateFormatter;
}

- (id)_nowString
{
  v2 = [(SiriUICardLogger *)self _dateFormatter];
  v3 = [MEMORY[0x263EFF910] date];
  v4 = [v2 stringFromDate:v3];

  return v4;
}

- (void).cxx_destruct
{
}

+ (void)logCard:format:.cold.1()
{
  LODWORD(v2) = 136315650;
  *(void *)((char *)&v2 + 4) = "+[SiriUICardLogger logCard:format:]";
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2231EF000, v0, v1, "%s #cards Failed to log card \n    Filename: %@\n    Card: %@", (void)v2, DWORD2(v2));
}

- (void)_currentFilenameForFormat:.cold.1()
{
  LODWORD(v2) = 136315650;
  *(void *)((char *)&v2 + 4) = "_SiriUICardLoggerCardDataDirectory";
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2231EF000, v0, v1, "%s #cards Couldn't create card log directory at path %{public}@ %{public}@", (void)v2, DWORD2(v2));
}

@end