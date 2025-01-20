@interface SKADatabaseStatus
+ (id)logger;
- (BOOL)isExpired;
- (NSData)rawData;
- (NSDate)dateCreated;
- (NSDate)dateExpired;
- (NSDate)datePublished;
- (NSDate)dateReceived;
- (NSString)channelIdentifier;
- (NSString)uniqueIdentifier;
- (SKADatabaseStatus)initWithChannelIdentifier:(id)a3 dateCreated:(id)a4 datePublished:(id)a5 dateReceived:(id)a6 dateExpired:(id)a7 rawData:(id)a8 uniqueIdentifier:(id)a9;
- (SKADatabaseStatus)initWithCoreDataStatus:(id)a3;
- (id)description;
@end

@implementation SKADatabaseStatus

- (SKADatabaseStatus)initWithCoreDataStatus:(id)a3
{
  id v4 = a3;
  v5 = [v4 channelIdentifier];
  v6 = [v4 dateCreated];
  v7 = [v4 datePublished];
  v8 = [v4 dateReceived];
  v9 = [v4 dateExpired];
  v10 = [v4 rawData];
  v11 = [v4 uniqueIdentifier];

  v12 = [(SKADatabaseStatus *)self initWithChannelIdentifier:v5 dateCreated:v6 datePublished:v7 dateReceived:v8 dateExpired:v9 rawData:v10 uniqueIdentifier:v11];
  return v12;
}

- (SKADatabaseStatus)initWithChannelIdentifier:(id)a3 dateCreated:(id)a4 datePublished:(id)a5 dateReceived:(id)a6 dateExpired:(id)a7 rawData:(id)a8 uniqueIdentifier:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v36.receiver = self;
  v36.super_class = (Class)SKADatabaseStatus;
  v22 = [(SKADatabaseStatus *)&v36 init];
  if (v22)
  {
    uint64_t v23 = [v15 copy];
    channelIdentifier = v22->_channelIdentifier;
    v22->_channelIdentifier = (NSString *)v23;

    uint64_t v25 = [v16 copy];
    dateCreated = v22->_dateCreated;
    v22->_dateCreated = (NSDate *)v25;

    uint64_t v27 = [v17 copy];
    datePublished = v22->_datePublished;
    v22->_datePublished = (NSDate *)v27;

    uint64_t v29 = [v18 copy];
    dateReceived = v22->_dateReceived;
    v22->_dateReceived = (NSDate *)v29;

    uint64_t v31 = [v19 copy];
    dateExpired = v22->_dateExpired;
    v22->_dateExpired = (NSDate *)v31;

    objc_storeStrong((id *)&v22->_rawData, a8);
    uint64_t v33 = [v21 copy];
    uniqueIdentifier = v22->_uniqueIdentifier;
    v22->_uniqueIdentifier = (NSString *)v33;
  }
  return v22;
}

- (BOOL)isExpired
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = [(SKADatabaseStatus *)self dateExpired];
  if (v3)
  {
    id v4 = [(SKADatabaseStatus *)self dateExpired];
    [v4 timeIntervalSince1970];
    double v6 = v5;
    v7 = [MEMORY[0x263EFF910] now];
    [v7 timeIntervalSince1970];
    BOOL v9 = v6 < v8;
  }
  else
  {
    BOOL v9 = 0;
  }

  v10 = +[SKADatabaseStatus logger];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [(SKADatabaseStatus *)self dateExpired];
    int v13 = 138412546;
    v14 = v11;
    __int16 v15 = 1024;
    BOOL v16 = v9;
    _os_log_impl(&dword_22480C000, v10, OS_LOG_TYPE_DEFAULT, "Date expired: %@, isExpired: %d", (uint8_t *)&v13, 0x12u);
  }
  return v9;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  double v5 = [(SKADatabaseStatus *)self uniqueIdentifier];
  double v6 = [(SKADatabaseStatus *)self channelIdentifier];
  v7 = [(SKADatabaseStatus *)self dateCreated];
  double v8 = [(SKADatabaseStatus *)self dateExpired];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; uniqueIdentifier = \"%@\"; channelIdentifier = \"%@\"; dateCreated = \"%@\"; dateExpired = \"%@\">;",
    v4,
    self,
    v5,
    v6,
    v7,
  BOOL v9 = v8);

  return v9;
}

+ (id)logger
{
  if (logger_onceToken_18 != -1) {
    dispatch_once(&logger_onceToken_18, &__block_literal_global_18);
  }
  v2 = (void *)logger__logger_18;
  return v2;
}

uint64_t __27__SKADatabaseStatus_logger__block_invoke()
{
  logger__logger_18 = (uint64_t)os_log_create("com.apple.StatusKit", "SKADatabaseStatus");
  return MEMORY[0x270F9A758]();
}

- (NSString)channelIdentifier
{
  return self->_channelIdentifier;
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (NSDate)datePublished
{
  return self->_datePublished;
}

- (NSDate)dateReceived
{
  return self->_dateReceived;
}

- (NSDate)dateExpired
{
  return self->_dateExpired;
}

- (NSData)rawData
{
  return self->_rawData;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_rawData, 0);
  objc_storeStrong((id *)&self->_dateExpired, 0);
  objc_storeStrong((id *)&self->_dateReceived, 0);
  objc_storeStrong((id *)&self->_datePublished, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_channelIdentifier, 0);
}

@end