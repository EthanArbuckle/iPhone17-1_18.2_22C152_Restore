@interface CLDurianCommand
+ (id)checkCrashesCommand;
+ (id)commandWithOpcode:(unsigned __int16)a3 payload:(id)a4;
+ (id)dumpNordicCrashesCommand;
+ (id)dumpNordicLogsCommand;
+ (id)dumpRoseCrashesCommand;
+ (id)dumpRoseLogsCommand;
+ (id)fetchAccelerometerModeCommand;
+ (id)fetchAccelerometerOrientationModeConfigurationCommand;
+ (id)fetchAccelerometerSlopeModeConfigurationCommand;
+ (id)fetchBatteryStatusCommand;
+ (id)fetchCurrentKeyIndexCommand;
+ (id)fetchUserStatsCommandWithPersistence_v0:(BOOL)a3;
+ (id)fetchUserStatsCommandWithPersistence_v1:(BOOL)a3;
+ (id)induceCrashCommand;
+ (id)initRoseCommandWithParameters:(id)a3;
+ (id)initRoseNonOwnerCommandWithParameters:(id)a3;
+ (id)prepareToStartRoseRangingCommand;
+ (id)prepareToStartRoseRangingNonOwnerCommand;
+ (id)rollWildKeyCommand;
+ (id)setAbsoluteWildModeConfigurationCommandWithConfiguration:(id)a3;
+ (id)setAccelerometerOrientationModeConfigurationCommandWithConfiguration:(id)a3;
+ (id)setAccelerometerSlopeModeConfigurationCommandWithConfiguration:(id)a3;
+ (id)setCentralReferenceTimeCommand;
+ (id)setKeyRotationTimeoutCommandWithTimeout:(unsigned int)a3;
+ (id)setNearOwnerTimeoutCommandWithTimeout:(unsigned __int16)a3;
+ (id)setRoseRangingParametersCommandWithParameters:(id)a3;
+ (id)setRoseRangingParametersNonOwnerCommandWithParameters:(id)a3;
+ (id)setTagTypeCommandWithType:(unsigned __int8)a3;
+ (id)setUnauthorizedPlaySoundRateLimitCommand:(BOOL)a3;
+ (id)setWildModeConfigurationCommandWithConfiguration:(id)a3;
+ (id)startRoseRangingCommandWithParameters:(id)a3;
+ (id)startRoseRangingNonOwnerCommandWithParameters:(id)a3;
+ (id)startSoundCommand;
+ (id)startSoundSequenceCommandWithSequence:(id)a3;
+ (id)startUnauthorizedShortSoundCommand;
+ (id)startUnauthorizedSoundCommand;
+ (id)stopRoseCommandWithParameters:(id)a3;
+ (id)stopRoseNonOwnerCommandWithParameters:(id)a3;
+ (id)stopRoseRangingCommand;
+ (id)stopRoseRangingNonOwnerCommandWithParameters:(id)a3;
+ (id)stopSoundCommand;
+ (id)stopUnauthorizedSoundCommand;
+ (id)unpairCommand;
- (CLDurianCommand)init;
- (CLDurianCommand)initWithData:(id)a3;
- (CLDurianCommand)initWithOpcode:(unsigned __int16)a3 payload:(id)a4;
- (NSData)bytes;
- (NSData)payload;
- (unsigned)opcode;
- (void)dealloc;
@end

@implementation CLDurianCommand

- (CLDurianCommand)init
{
  return 0;
}

- (CLDurianCommand)initWithData:(id)a3
{
  result = (CLDurianCommand *)[a3 length];
  if (result)
  {
    uint64_t v6 = *(unsigned __int8 *)[a3 bytes];
    id v7 = [a3 subdataWithRange:1, [a3 length] - 1];
    return [(CLDurianCommand *)self initWithOpcode:v6 payload:v7];
  }
  return result;
}

- (CLDurianCommand)initWithOpcode:(unsigned __int16)a3 payload:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CLDurianCommand;
  uint64_t v6 = [(CLDurianCommand *)&v9 init];
  id v7 = v6;
  if (v6)
  {
    v6->_opcode = a3;
    v6->_payload = (NSData *)a4;
  }
  return v7;
}

+ (id)commandWithOpcode:(unsigned __int16)a3 payload:(id)a4
{
  id v4 = [objc_alloc((Class)a1) initWithOpcode:a3 payload:a4];

  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLDurianCommand;
  [(CLDurianCommand *)&v3 dealloc];
}

- (NSData)bytes
{
  result = +[NSData dataWithBytes:&self->_opcode length:1];
  if (self->_payload)
  {
    id v4 = [(NSData *)result mutableCopy];
    [v4 appendData:self->_payload];
    id v5 = [v4 copy];
    return (NSData *)v5;
  }
  return result;
}

- (unsigned)opcode
{
  return self->_opcode;
}

- (NSData)payload
{
  return self->_payload;
}

+ (id)fetchCurrentKeyIndexCommand
{
  return [a1 commandWithOpcode:174 payload:0];
}

+ (id)fetchBatteryStatusCommand
{
  return [a1 commandWithOpcode:39 payload:0];
}

+ (id)fetchUserStatsCommandWithPersistence_v0:(BOOL)a3
{
  v4[0] = 1;
  v4[1] = !a3;
  return [a1 commandWithOpcode:24 payload:[NSData dataWithBytes:length:v4]];
}

+ (id)fetchUserStatsCommandWithPersistence_v1:(BOOL)a3
{
  BOOL v4 = !a3;
  return [a1 commandWithOpcode:25 payload:[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v4, 1)];
}

+ (id)unpairCommand
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332158);
  }
  objc_super v3 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289026;
    v5[1] = 0;
    __int16 v6 = 2082;
    id v7 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #multi incoming unpair\"}", (uint8_t *)v5, 0x12u);
  }
  return [a1 commandWithOpcode:19 payload:0];
}

+ (id)setUnauthorizedPlaySoundRateLimitCommand:(BOOL)a3
{
  BOOL v4 = a3;
  return [a1 commandWithOpcode:195 payload:[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v4, 1)];
}

+ (id)setCentralReferenceTimeCommand
{
  +[NSDate timeIntervalSinceReferenceDate];
  char v5 = 8;
  unint64_t v6 = (unint64_t)(v3 * 1000.0);
  return [a1 commandWithOpcode:197 payload:[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v5, 9)];
}

+ (id)setWildModeConfigurationCommandWithConfiguration:(id)a3
{
  return [a1 commandWithOpcode:42 payload:a3];
}

+ (id)rollWildKeyCommand
{
  return [a1 commandWithOpcode:43 payload:0];
}

+ (id)setAbsoluteWildModeConfigurationCommandWithConfiguration:(id)a3
{
  return [a1 commandWithOpcode:45 payload:a3];
}

+ (id)setTagTypeCommandWithType:(unsigned __int8)a3
{
  v4[0] = 1;
  v4[1] = a3;
  return [a1 commandWithOpcode:38 payload:[NSData dataWithBytes:length:v4]];
}

+ (id)startSoundSequenceCommandWithSequence:(id)a3
{
  return [a1 commandWithOpcode:40 payload:a3];
}

+ (id)startSoundCommand
{
  return [a1 commandWithOpcode:40 payload:0];
}

+ (id)stopSoundCommand
{
  return [a1 commandWithOpcode:8 payload:0];
}

+ (id)startUnauthorizedShortSoundCommand
{
  return [a1 commandWithOpcode:2061 payload:0];
}

+ (id)startUnauthorizedSoundCommand
{
  return [a1 commandWithOpcode:175 payload:0];
}

+ (id)stopUnauthorizedSoundCommand
{
  return [a1 commandWithOpcode:220 payload:0];
}

+ (id)setNearOwnerTimeoutCommandWithTimeout:(unsigned __int16)a3
{
  char v4 = 2;
  unsigned __int16 v5 = a3;
  return [a1 commandWithOpcode:15 payload:[NSData dataWithBytes:&v4 length:3]];
}

+ (id)setKeyRotationTimeoutCommandWithTimeout:(unsigned int)a3
{
  char v4 = 4;
  unsigned int v5 = a3;
  return [a1 commandWithOpcode:177 payload:[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v4, 5)];
}

+ (id)checkCrashesCommand
{
  return [a1 commandWithOpcode:181 payload:0];
}

+ (id)induceCrashCommand
{
  return [a1 commandWithOpcode:185 payload:0];
}

+ (id)dumpNordicLogsCommand
{
  __int16 v3 = 1;
  return [a1 commandWithOpcode:180 payload:[NSData dataWithBytes:&v3 length:2]];
}

+ (id)dumpNordicCrashesCommand
{
  __int16 v3 = 257;
  return [a1 commandWithOpcode:180 payload:[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v3, 2)];
}

+ (id)dumpRoseLogsCommand
{
  __int16 v3 = 513;
  return [a1 commandWithOpcode:180 payload:[NSData dataWithBytes:&v3 length:2]];
}

+ (id)dumpRoseCrashesCommand
{
  __int16 v3 = 769;
  return [a1 commandWithOpcode:180 payload:[NSData dataWithBytes:&v3 length:2]];
}

+ (id)initRoseNonOwnerCommandWithParameters:(id)a3
{
  return [a1 commandWithOpcode:2049 payload:a3];
}

+ (id)stopRoseNonOwnerCommandWithParameters:(id)a3
{
  return [a1 commandWithOpcode:2053 payload:a3];
}

+ (id)setRoseRangingParametersNonOwnerCommandWithParameters:(id)a3
{
  return [a1 commandWithOpcode:2050 payload:a3];
}

+ (id)prepareToStartRoseRangingNonOwnerCommand
{
  return [a1 commandWithOpcode:2051 payload:0];
}

+ (id)startRoseRangingNonOwnerCommandWithParameters:(id)a3
{
  return [a1 commandWithOpcode:2051 payload:a3];
}

+ (id)stopRoseRangingNonOwnerCommandWithParameters:(id)a3
{
  return [a1 commandWithOpcode:2052 payload:a3];
}

+ (id)initRoseCommandWithParameters:(id)a3
{
  return [a1 commandWithOpcode:1 payload:a3];
}

+ (id)stopRoseCommandWithParameters:(id)a3
{
  return [a1 commandWithOpcode:6 payload:a3];
}

+ (id)setRoseRangingParametersCommandWithParameters:(id)a3
{
  return [a1 commandWithOpcode:21 payload:a3];
}

+ (id)prepareToStartRoseRangingCommand
{
  return [a1 commandWithOpcode:22 payload:0];
}

+ (id)startRoseRangingCommandWithParameters:(id)a3
{
  return [a1 commandWithOpcode:3 payload:a3];
}

+ (id)stopRoseRangingCommand
{
  return [a1 commandWithOpcode:22 payload:0];
}

+ (id)setAccelerometerSlopeModeConfigurationCommandWithConfiguration:(id)a3
{
  return [a1 commandWithOpcode:199 payload:a3];
}

+ (id)setAccelerometerOrientationModeConfigurationCommandWithConfiguration:(id)a3
{
  return [a1 commandWithOpcode:200 payload:a3];
}

+ (id)fetchAccelerometerSlopeModeConfigurationCommand
{
  return [a1 commandWithOpcode:201 payload:0];
}

+ (id)fetchAccelerometerOrientationModeConfigurationCommand
{
  return [a1 commandWithOpcode:202 payload:0];
}

+ (id)fetchAccelerometerModeCommand
{
  return [a1 commandWithOpcode:203 payload:0];
}

@end