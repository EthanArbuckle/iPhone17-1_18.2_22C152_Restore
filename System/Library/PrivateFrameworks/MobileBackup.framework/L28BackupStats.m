@interface L28BackupStats
+ (id)l28BackupStatsForAccount:(id)a3 backupReason:(int64_t)a4 backupError:(id)a5 error:(id *)a6;
- (BOOL)isQuotaExceeded;
- (BOOL)singleOSVersionMajor;
- (BOOL)singleOSVersionMinor;
- (L28BackupStats)initWithPlistDict:(id)a3;
- (id)_dictionaryRepresentation;
- (id)l28StatsTelemetryPolicy:(int64_t)a3 plistPath:(id)a4 backupReason:(int64_t)a5 backupError:(id)a6 error:(id *)a7;
- (int)lastSuccessfulBackup;
- (int)maxIntervalBetweenSuccessfulBackups;
- (unsigned)backupHistorySize;
- (unsigned)successfulBackupCount;
- (unsigned)successfulManualBackupCount;
- (void)_nullifyL28Stats;
- (void)computeStatsOnL28BackupHistory;
- (void)setBackupHistorySize:(unsigned int)a3;
- (void)setIsQuotaExceeded:(BOOL)a3;
- (void)setLastSuccessfulBackup:(int)a3;
- (void)setMaxIntervalBetweenSuccessfulBackups:(int)a3;
- (void)setSingleOSVersionMajor:(BOOL)a3;
- (void)setSingleOSVersionMinor:(BOOL)a3;
- (void)setSuccessfulBackupCount:(unsigned int)a3;
- (void)setSuccessfulManualBackupCount:(unsigned int)a3;
- (void)updateL28HistoryWithCurrentBackupState:(BOOL)a3 isSuccessful:(BOOL)a4 quotaExceeded:(BOOL)a5 osVersion:(id)a6 currentDay:(int64_t)a7 isNewDay:(BOOL)a8;
@end

@implementation L28BackupStats

+ (id)l28BackupStatsForAccount:(id)a3 backupReason:(int64_t)a4 backupError:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a5;
  v11 = [v9 persona];
  v12 = [v11 l28BackupTelemetryPlistPath];

  if (!v12) {
    __assert_rtn("+[L28BackupStats l28BackupStatsForAccount:backupReason:backupError:error:]", "L28BackupStats.m", 160, "plistPath");
  }
  v13 = +[NSDate date];
  id v14 = [v13 absoluteDay];

  v15 = +[NSData dataWithContentsOfFile:v12];
  if (!v15)
  {
    v16 = 0;
    goto LABEL_8;
  }
  v16 = +[NSPropertyListSerialization propertyListWithData:v15 options:2 format:0 error:a6];
  if (v16)
  {
LABEL_8:
    v19 = [[L28BackupStats alloc] initWithPlistDict:v16];
    v20 = v19;
    if (v19)
    {
      v18 = [(L28BackupStats *)v19 l28StatsTelemetryPolicy:v14 plistPath:v12 backupReason:a4 backupError:v10 error:a6];
    }
    else
    {
      v18 = 0;
    }

    goto LABEL_12;
  }
  v16 = MBGetDefaultLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = *a6;
    *(_DWORD *)buf = 138412546;
    v23 = v12;
    __int16 v24 = 2112;
    id v25 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Error deserializing plist %@ : %@", buf, 0x16u);
    _MBLog();
  }
  v18 = 0;
LABEL_12:

  return v18;
}

- (L28BackupStats)initWithPlistDict:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)L28BackupStats;
  v5 = [(L28BackupStats *)&v15 init];
  if (v5)
  {
    v6 = [L28BackupBuffer alloc];
    v7 = [v4 objectForKeyedSubscript:@"L28Buffer"];
    v8 = [v4 objectForKeyedSubscript:@"L28BufferNextDayIndex"];
    id v9 = [v8 intValue];
    id v10 = [v4 objectForKeyedSubscript:@"L28BufferEndDay"];
    v11 = -[L28BackupBuffer _initWithBuffer:nextDayIndex:endDay:](v6, "_initWithBuffer:nextDayIndex:endDay:", v7, v9, [v10 integerValue]);
    buffer = v5->_buffer;
    v5->_buffer = v11;

    v13 = [v4 objectForKeyedSubscript:@"L28lastTelemetryDay"];
    v5->_lastTelemetryDay = (int)[v13 intValue];

    [(L28BackupStats *)v5 _nullifyL28Stats];
  }

  return v5;
}

- (id)l28StatsTelemetryPolicy:(int64_t)a3 plistPath:(id)a4 backupReason:(int64_t)a5 backupError:(id)a6 error:(id *)a7
{
  id v29 = a4;
  id v11 = a6;
  int64_t lastTelemetryDay = self->_lastTelemetryDay;
  if (lastTelemetryDay != a3)
  {
    self->_int64_t lastTelemetryDay = a3;
    [(L28BackupStats *)self computeStatsOnL28BackupHistory];
  }
  uint64_t IsManual = MBBackupReasonIsManual();
  BOOL v14 = +[MBError isCKError:v11 withCode:25];
  objc_super v15 = MBProductVersion();
  [(L28BackupStats *)self updateL28HistoryWithCurrentBackupState:IsManual isSuccessful:v11 == 0 quotaExceeded:v14 osVersion:v15 currentDay:a3 isNewDay:lastTelemetryDay != a3];

  v16 = +[NSMutableDictionary dictionary];
  id v17 = [(L28BackupBuffer *)self->_buffer _slots];
  [v16 setObject:v17 forKeyedSubscript:@"L28Buffer"];

  v18 = +[NSNumber numberWithInt:[(L28BackupBuffer *)self->_buffer nextDayIndex]];
  [v16 setObject:v18 forKeyedSubscript:@"L28BufferNextDayIndex"];

  v19 = +[NSNumber numberWithInteger:[(L28BackupBuffer *)self->_buffer endDay]];
  [v16 setObject:v19 forKeyedSubscript:@"L28BufferEndDay"];

  v20 = +[NSNumber numberWithInteger:self->_lastTelemetryDay];
  [v16 setObject:v20 forKeyedSubscript:@"L28lastTelemetryDay"];

  v21 = +[NSPropertyListSerialization dataWithPropertyList:v16 format:200 options:0 error:a7];
  v22 = v21;
  if (v21)
  {
    v23 = v29;
    if ([v21 writeToFile:v29 atomically:1])
    {
      if (lastTelemetryDay != a3)
      {
        __int16 v24 = [(L28BackupStats *)self _dictionaryRepresentation];
        goto LABEL_14;
      }
    }
    else
    {
      v27 = MBGetDefaultLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Error writing plist to file", buf, 2u);
        _MBLog();
      }
    }
  }
  else
  {
    id v25 = MBGetDefaultLog();
    v23 = v29;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      id v26 = *a7;
      *(_DWORD *)buf = 138412290;
      id v31 = v26;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Error serializing dictionary: %@", buf, 0xCu);
      _MBLog();
    }
  }
  __int16 v24 = 0;
LABEL_14:

  return v24;
}

- (void)updateL28HistoryWithCurrentBackupState:(BOOL)a3 isSuccessful:(BOOL)a4 quotaExceeded:(BOOL)a5 osVersion:(id)a6 currentDay:(int64_t)a7 isNewDay:(BOOL)a8
{
  BOOL v10 = a5;
  BOOL v11 = a4;
  BOOL v12 = a3;
  if (a8)
  {
    id v14 = a6;
    id v24 = +[NSMutableDictionary dictionary];
  }
  else
  {
    buffer = self->_buffer;
    id v16 = a6;
    id v17 = [(L28BackupBuffer *)buffer _latestBackup];
    id v24 = [v17 mutableCopy];
  }
  [v24 setObject:a6 forKeyedSubscript:@"osVersion"];

  v18 = [v24 objectForKeyedSubscript:@"isQuotaExceeded"];
  v19 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v18 BOOLValue] | v10);
  [v24 setObject:v19 forKeyedSubscript:@"isQuotaExceeded"];

  v20 = [v24 objectForKeyedSubscript:@"successfulBackupCount"];
  v21 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v20 intValue] + v11);
  [v24 setObject:v21 forKeyedSubscript:@"successfulBackupCount"];

  v22 = [v24 objectForKeyedSubscript:@"successfulBackupManualCount"];
  v23 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v22 intValue] + (v12 && v11));
  [v24 setObject:v23 forKeyedSubscript:@"successfulBackupManualCount"];

  [(L28BackupBuffer *)self->_buffer _updateCurrentMetrics:v24 forDay:a7];
}

- (void)computeStatsOnL28BackupHistory
{
  [(L28BackupStats *)self _nullifyL28Stats];
  unsigned int v3 = [(L28BackupBuffer *)self->_buffer nextDayIndex];
  id v25 = 0;
  id v26 = 0;
  int v4 = 0;
  int v5 = 27;
  CFStringRef v6 = @"successfulBackupCount";
  do
  {
    CFStringRef v7 = v6;
    v8 = -[L28BackupBuffer _slotAtIndex:](self->_buffer, "_slotAtIndex:", v3 % 0x1C, v25);
    id v9 = [v8 objectForKeyedSubscript:@"init"];
    unsigned __int8 v10 = [v9 BOOLValue];

    if (v10) {
      goto LABEL_23;
    }
    BOOL v11 = [v8 objectForKeyedSubscript:v6];
    int v12 = [v11 intValue];

    if (v12 < 1)
    {
      int maxIntervalBetweenSuccessfulBackups = self->_maxIntervalBetweenSuccessfulBackups;
      if (maxIntervalBetweenSuccessfulBackups <= v4 + 1) {
        int maxIntervalBetweenSuccessfulBackups = v4 + 1;
      }
      self->_int maxIntervalBetweenSuccessfulBackups = maxIntervalBetweenSuccessfulBackups;
      ++v4;
      if (!v8) {
        goto LABEL_21;
      }
LABEL_9:
      if (self->_isQuotaExceeded)
      {
        self->_isQuotaExceeded = 1;
      }
      else
      {
        id v16 = [v8 objectForKeyedSubscript:@"isQuotaExceeded"];
        self->_isQuotaExceeded = [v16 BOOLValue];
      }
      id v17 = v26;
      v18 = [v8 objectForKeyedSubscript:@"osVersion"];
      v19 = [v18 componentsSeparatedByString:@"."];
      v20 = [v19 firstObject];

      if (!v26)
      {
        id v17 = v18;
        id v21 = v20;

        id v25 = v21;
      }
      if (self->_singleOSVersionMinor) {
        unsigned __int8 v22 = [v18 isEqualToString:v17];
      }
      else {
        unsigned __int8 v22 = 0;
      }
      self->_singleOSVersionMinor = v22;
      id v26 = v17;
      if (self->_singleOSVersionMajor) {
        unsigned __int8 v23 = [v20 isEqualToString:v25];
      }
      else {
        unsigned __int8 v23 = 0;
      }
      self->_singleOSVersionMajor = v23;

      CFStringRef v6 = v7;
      goto LABEL_21;
    }
    self->_lastSuccessfulBackup = v5;
    v13 = [v8 objectForKeyedSubscript:v6];
    self->_successfulBackupCount += [v13 intValue];

    id v14 = [v8 objectForKeyedSubscript:@"successfulBackupManualCount"];
    self->_successfulManualBackupCount += [v14 intValue];

    int v4 = 0;
    if (v8) {
      goto LABEL_9;
    }
LABEL_21:
    unsigned int backupHistorySize = self->_backupHistorySize;
    if (backupHistorySize <= 0x1B) {
      self->_unsigned int backupHistorySize = backupHistorySize + 1;
    }
LABEL_23:

    --v5;
    ++v3;
  }
  while (v5 != -1);
}

- (void)_nullifyL28Stats
{
  *(_WORD *)&self->_isQuotaExceeded = 256;
  self->_singleOSVersionMajor = 1;
  *(void *)&long long v2 = 0xFFFFFFFFLL;
  *((void *)&v2 + 1) = 0xFFFFFFFFLL;
  *(_OWORD *)&self->_lastSuccessfulBackup = v2;
  self->_successfulManualBackupCount = 0;
}

- (id)_dictionaryRepresentation
{
  v13[0] = @"L28LastSuccessfulBackup";
  unsigned int v3 = +[NSNumber numberWithInt:self->_lastSuccessfulBackup];
  v14[0] = v3;
  v13[1] = @"L28SuccessfulBackupCount";
  int v4 = +[NSNumber numberWithUnsignedInt:self->_successfulBackupCount];
  v14[1] = v4;
  v13[2] = @"L28MaxIntervalBetweenSuccessfulBackups";
  int v5 = +[NSNumber numberWithInt:self->_maxIntervalBetweenSuccessfulBackups];
  v14[2] = v5;
  v13[3] = @"L28IsQuotaExceeded";
  CFStringRef v6 = +[NSNumber numberWithBool:self->_isQuotaExceeded];
  v14[3] = v6;
  v13[4] = @"L28SingleOSVersionMinor";
  CFStringRef v7 = +[NSNumber numberWithBool:self->_singleOSVersionMinor];
  v14[4] = v7;
  v13[5] = @"L28SingleOSVersionMajor";
  v8 = +[NSNumber numberWithBool:self->_singleOSVersionMajor];
  v14[5] = v8;
  v13[6] = @"L28BackupHistorySize";
  id v9 = +[NSNumber numberWithUnsignedInt:self->_backupHistorySize];
  v14[6] = v9;
  v13[7] = @"L28SuccessfulManualBackupCount";
  unsigned __int8 v10 = +[NSNumber numberWithUnsignedInt:self->_successfulManualBackupCount];
  v14[7] = v10;
  BOOL v11 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:8];

  return v11;
}

- (int)lastSuccessfulBackup
{
  return self->_lastSuccessfulBackup;
}

- (void)setLastSuccessfulBackup:(int)a3
{
  self->_lastSuccessfulBackup = a3;
}

- (unsigned)successfulBackupCount
{
  return self->_successfulBackupCount;
}

- (void)setSuccessfulBackupCount:(unsigned int)a3
{
  self->_successfulBackupCount = a3;
}

- (int)maxIntervalBetweenSuccessfulBackups
{
  return self->_maxIntervalBetweenSuccessfulBackups;
}

- (void)setMaxIntervalBetweenSuccessfulBackups:(int)a3
{
  self->_int maxIntervalBetweenSuccessfulBackups = a3;
}

- (BOOL)isQuotaExceeded
{
  return self->_isQuotaExceeded;
}

- (void)setIsQuotaExceeded:(BOOL)a3
{
  self->_isQuotaExceeded = a3;
}

- (BOOL)singleOSVersionMinor
{
  return self->_singleOSVersionMinor;
}

- (void)setSingleOSVersionMinor:(BOOL)a3
{
  self->_singleOSVersionMinor = a3;
}

- (BOOL)singleOSVersionMajor
{
  return self->_singleOSVersionMajor;
}

- (void)setSingleOSVersionMajor:(BOOL)a3
{
  self->_singleOSVersionMajor = a3;
}

- (unsigned)backupHistorySize
{
  return self->_backupHistorySize;
}

- (void)setBackupHistorySize:(unsigned int)a3
{
  self->_unsigned int backupHistorySize = a3;
}

- (unsigned)successfulManualBackupCount
{
  return self->_successfulManualBackupCount;
}

- (void)setSuccessfulManualBackupCount:(unsigned int)a3
{
  self->_successfulManualBackupCount = a3;
}

- (void).cxx_destruct
{
}

@end