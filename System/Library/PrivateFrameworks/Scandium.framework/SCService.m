@interface SCService
- (BOOL)backgroundIsAllowed;
- (BOOL)ledState;
- (BOOL)previousBackgroundReadingExists;
- (BOOL)previousBackgroundReadingWasSuccessful;
- (BOOL)started;
- (OS_dispatch_queue)serviceQueue;
- (SCDevice)device;
- (SCHealthLiteConnection)connection;
- (SCPacketDropDetector)packetDropDetector;
- (SCPowerAssertion)powerAssertion;
- (SCPreferences)preferences;
- (SCProcessor)processor;
- (SCRTPTimestampReference)timestampReference;
- (SCService)initWithDevice:(__IOHIDDevice *)a3;
- (SCTimeReference)timeReference;
- (double)previousBackgroundReadingWallclock;
- (double)wallclockForRTPTimestamp:(unint64_t)a3;
- (unint64_t)systemInstance;
- (unsigned)firmwareState;
- (unsigned)operatingMode;
- (void)abortSession;
- (void)beginSession;
- (void)handleAbort:(unsigned __int8)a3 withAnalytics:(const SCAnalytics *)a4 atTimestamp:(double)a5;
- (void)handleConnectionInvalidation;
- (void)handleHealthLiteDeath;
- (void)handleInitialConnect;
- (void)handleMotionStatusChange:(BOOL)a3 atTimestamp:(double)a4;
- (void)handlePostureStatusChange:(BOOL)a3 atTimestamp:(double)a4;
- (void)handleResult:(const SCResult *)a3 withAnalytics:(const SCAnalytics *)a4 atTimestamp:(double)a5;
- (void)handleScandiumInputReport:(id)a3;
- (void)reportBackgroundIntervalAnalyticsWithSuccess:(BOOL)a3;
- (void)reportSessionAnalytics:(const SCAnalytics *)a3 withTimestamp:(double)a4;
- (void)selectAnOperatingModeOtherThanForeground;
- (void)setBackgroundAllowed:(BOOL)a3;
- (void)setBackgroundIsAllowed:(BOOL)a3;
- (void)setConnection:(id)a3;
- (void)setFirmwareState:(unsigned __int8)a3;
- (void)setLedState:(BOOL)a3;
- (void)setOperatingMode:(unsigned __int8)a3;
- (void)setPowerAssertion:(id)a3;
- (void)setPreviousBackgroundReadingExists:(BOOL)a3;
- (void)setPreviousBackgroundReadingWallclock:(double)a3;
- (void)setPreviousBackgroundReadingWasSuccessful:(BOOL)a3;
- (void)setProcessor:(id)a3;
- (void)setStarted:(BOOL)a3;
- (void)setTimeReference:(id)a3;
- (void)setTimestampReference:(SCRTPTimestampReference *)a3;
- (void)start;
@end

@implementation SCService

- (SCService)initWithDevice:(__IOHIDDevice *)a3
{
  v18.receiver = self;
  v18.super_class = (Class)SCService;
  v4 = [(SCService *)&v18 init];
  if (!v4) {
    goto LABEL_5;
  }
  v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v6 = dispatch_queue_create("com.apple.scandium.service", v5);
  serviceQueue = v4->_serviceQueue;
  v4->_serviceQueue = (OS_dispatch_queue *)v6;

  if (!v4->_serviceQueue) {
    goto LABEL_5;
  }
  v4->_firmwareState = 0;
  *(_WORD *)&v4->_ledState = 0;
  uint64_t v8 = objc_opt_new();
  packetDropDetector = v4->_packetDropDetector;
  v4->_packetDropDetector = (SCPacketDropDetector *)v8;

  v10 = [[SCDevice alloc] initWithIOHIDDevice:a3 delegate:v4 queue:v4->_serviceQueue];
  device = v4->_device;
  v4->_device = v10;

  if (v4->_device)
  {
    v12 = [[SCTimeReference alloc] initWithRTPTicksPerSecond:24000000 onQueue:v4->_serviceQueue];
    timeReference = v4->_timeReference;
    v4->_timeReference = v12;

    v14 = [[SCPreferences alloc] initWithQueue:v4->_serviceQueue];
    preferences = v4->_preferences;
    v4->_preferences = v14;

    arc4random_buf(&v4->_systemInstance, 8uLL);
    v16 = v4;
  }
  else
  {
LABEL_5:
    v16 = 0;
  }

  return v16;
}

- (void)start
{
  v3 = [(SCService *)self serviceQueue];
  v4 = v3;
  if (v3)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __18__SCService_start__block_invoke;
    v5[3] = &unk_2654A0498;
    v5[4] = self;
    dispatch_queue_t v6 = v3;
    dispatch_async(v6, v5);
  }
}

void __18__SCService_start__block_invoke(uint64_t a1)
{
  v2 = sc_get_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_25BA34000, v2, OS_LOG_TYPE_DEFAULT, "starting Scandium service", buf, 2u);
  }

  [*(id *)(a1 + 32) setStarted:1];
  v3 = [*(id *)(a1 + 32) device];
  v4 = v3;
  if (v3)
  {
    [v3 latestRTPTimestampReference];
  }
  else
  {
    long long v11 = 0uLL;
    uint64_t v12 = 0;
  }
  v5 = *(void **)(a1 + 32);
  long long v9 = v11;
  uint64_t v10 = v12;
  [v5 setTimestampReference:&v9];

  dispatch_queue_t v6 = [*(id *)(a1 + 32) device];
  [v6 setOperatingMode:*(unsigned __int8 *)(*(void *)(a1 + 32) + 9)];

  v7 = sc_get_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_25BA34000, v7, OS_LOG_TYPE_INFO, "assuming background is not allowed", buf, 2u);
  }

  uint64_t v8 = [[SCHealthLiteConnection alloc] initWithDelegate:*(void *)(a1 + 32) onQueue:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setConnection:v8];
}

- (BOOL)ledState
{
  return self->_ledState;
}

- (void)setLedState:(BOOL)a3
{
  if (self->_ledState != a3)
  {
    self->_ledState = a3;
    id v5 = [(SCService *)self connection];
    v4 = [v5 healthlite];
    [v4 ledStateDidChange:self->_ledState];
  }
}

- (unsigned)operatingMode
{
  return self->_operatingMode;
}

- (void)setOperatingMode:(unsigned __int8)a3
{
  if (self->_operatingMode != a3)
  {
    uint64_t v3 = a3;
    self->_operatingMode = a3;
    id v4 = [(SCService *)self device];
    [v4 setOperatingMode:v3];
  }
}

- (unsigned)firmwareState
{
  return self->_firmwareState;
}

- (void)setFirmwareState:(unsigned __int8)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  int firmwareState = self->_firmwareState;
  if (firmwareState != a3)
  {
    unsigned int v4 = a3;
    self->_int firmwareState = a3;
    dispatch_queue_t v6 = sc_get_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if ((char)firmwareState > 3) {
        v7 = "invalid";
      }
      else {
        v7 = off_2654A04B8[(char)firmwareState];
      }
      if (v4 > 3) {
        uint64_t v8 = "invalid";
      }
      else {
        uint64_t v8 = off_2654A04B8[(char)v4];
      }
      int v12 = 136446466;
      v13 = v7;
      __int16 v14 = 2082;
      v15 = v8;
      _os_log_impl(&dword_25BA34000, v6, OS_LOG_TYPE_DEFAULT, "firmware state: %{public}s -> %{public}s", (uint8_t *)&v12, 0x16u);
    }

    [(SCService *)self setProcessor:0];
    if (v4 == 3)
    {
      long long v9 = [[SCPowerAssertion alloc] initWithName:@"com.apple.scandium.background"];
      [(SCService *)self setPowerAssertion:v9];

      BOOL v10 = 0;
    }
    else
    {
      [(SCService *)self setPowerAssertion:0];
      BOOL v10 = v4 == 1;
      if (v4 <= 1) {
        [(SCService *)self setPreviousBackgroundReadingExists:0];
      }
    }
    uint64_t v11 = v4 == 3 || v10;
    [(SCService *)self setLedState:v11];
  }
}

- (void)selectAnOperatingModeOtherThanForeground
{
  if ([(SCService *)self backgroundIsAllowed]) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 0;
  }
  [(SCService *)self setOperatingMode:v3];
}

- (void)handleScandiumInputReport:(id)a3
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!-[SCService started](self, "started") || ![v4 length]) {
    goto LABEL_64;
  }
  id v5 = v4;
  int v6 = *(unsigned __int8 *)[v5 bytes];
  v7 = sc_get_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[SCService handleScandiumInputReport:].cold.6(v5, v7);
  }

  if (v6 <= 66)
  {
    if (v6 == 1)
    {
      if ((unint64_t)[v5 length] >= 3)
      {
        *(_WORD *)buf = 0;
        objc_msgSend(v5, "getBytes:range:", buf, 1, 2);
        v33 = [(SCService *)self packetDropDetector];
        objc_msgSend(v33, "handlePacketWithReportID:frameIndex:size:", 1, *(unsigned __int16 *)buf, objc_msgSend(v5, "length"));
      }
      long long v9 = [(SCService *)self processor];
      id v34 = v5;
      -[NSObject processPacket:ofLength:](v9, "processPacket:ofLength:", [v34 bytes], objc_msgSend(v34, "length"));
      goto LABEL_43;
    }
    if (v6 != 2) {
      goto LABEL_64;
    }
    if ((unint64_t)[v5 length] >= 3)
    {
      *(_WORD *)buf = 0;
      objc_msgSend(v5, "getBytes:range:", buf, 1, 2);
      __int16 v14 = [(SCService *)self packetDropDetector];
      objc_msgSend(v14, "handlePacketWithReportID:frameIndex:size:", 2, *(unsigned __int16 *)buf, objc_msgSend(v5, "length"));
    }
    v15 = [(SCService *)self processor];

    if (v15)
    {
      uint64_t v16 = sc_get_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        -[SCService handleScandiumInputReport:].cold.4();
      }
    }
    size_t v55 = 32;
    if (!sysctlbyname("hw.model", buf, &v55, 0, 0))
    {
      uint64_t v17 = [NSString stringWithUTF8String:buf];
      if (v17)
      {
        objc_super v18 = (void *)v17;
        v50 = [SCProcessor alloc];
        id v19 = v5;
        uint64_t v49 = [v19 bytes];
        uint64_t v20 = [v19 length];
        v21 = [(SCService *)self preferences];
        uint64_t v22 = [v21 signalQualityMetricsDisabled] ^ 1;
        v23 = [(SCService *)self preferences];
        uint64_t v24 = [v23 bypassAlgorithms];
        v25 = [(SCService *)self timeReference];
        v26 = [v25 dateForRTPTimestamp:0];
        v27 = [(SCProcessor *)v50 initWithStartPacket:v49 ofLength:v20 delegate:self withSignalQualityMetricsEnabled:v22 bypassingAlgorithms:v24 bootDate:v26 hardwareModel:v18];
        [(SCService *)self setProcessor:v27];
      }
    }
    v28 = [(SCService *)self processor];

    if (!v28)
    {
      long long v9 = sc_get_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        -[SCService handleScandiumInputReport:]();
      }
      goto LABEL_43;
    }
    v29 = [(SCService *)self device];
    v30 = v29;
    if (v29)
    {
      [v29 latestRTPTimestampReference];
    }
    else
    {
      long long v53 = 0uLL;
      uint64_t v54 = 0;
    }
    long long v51 = v53;
    uint64_t v52 = v54;
    [(SCService *)self setTimestampReference:&v51];

    v36 = [(SCService *)self processor];
    int v37 = [v36 forBackground];

    int v38 = [(SCService *)self firmwareState];
    v39 = sc_get_log();
    v40 = v39;
    if (v37)
    {
      if (v38 == 3)
      {
        if (!os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
LABEL_58:

          goto LABEL_64;
        }
        v41 = [(SCService *)self processor];
        uint64_t v42 = [v41 startTimestamp];
        v43 = [(SCService *)self processor];
        [v43 expectedDuration];
        *(_DWORD *)buf = 134218240;
        *(void *)&buf[4] = v42;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v44;
        _os_log_impl(&dword_25BA34000, v40, OS_LOG_TYPE_DEFAULT, "0.000000 :: background session started at rtp timestamp %llu with expected duration of %.6f seconds", buf, 0x16u);
LABEL_57:

        goto LABEL_58;
      }
      if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT)) {
        -[SCService handleScandiumInputReport:]();
      }
    }
    else
    {
      if (v38 == 1)
      {
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          v45 = [(SCService *)self processor];
          uint64_t v46 = [v45 startTimestamp];
          v47 = [(SCService *)self processor];
          [v47 expectedDuration];
          *(_DWORD *)buf = 134218240;
          *(void *)&buf[4] = v46;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v48;
          _os_log_impl(&dword_25BA34000, v40, OS_LOG_TYPE_DEFAULT, "0.000000 :: foreground session started at rtp timestamp %llu with expected duration of %.6f seconds", buf, 0x16u);
        }
        v40 = [(SCService *)self connection];
        v41 = [v40 healthlite];
        v43 = [(SCService *)self processor];
        [v43 expectedDuration];
        objc_msgSend(v41, "sessionDidBeginWithExpectedDuration:");
        goto LABEL_57;
      }
      if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT)) {
        -[SCService handleScandiumInputReport:]();
      }
    }

    [(SCService *)self setProcessor:0];
    goto LABEL_64;
  }
  switch(v6)
  {
    case 67:
      *(void *)buf = 0;
      *(void *)&buf[8] = 0;
      *(_DWORD *)&buf[15] = 0;
      if ([v5 length] == 19)
      {
        [v5 getBytes:buf length:19];
        if ((*(_WORD *)&buf[11] & 0x4000) != 0)
        {
          if (buf[17]) {
            LOBYTE(v31) = 3;
          }
          else {
            LOBYTE(v31) = 2;
          }
        }
        else
        {
          int v31 = (*(_DWORD *)&buf[11] >> 13) & 1;
        }
      }
      else
      {
        v35 = sc_get_log();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT)) {
          -[SCService handleScandiumInputReport:].cold.5(v35);
        }

        LOBYTE(v31) = 0;
      }
      [(SCService *)self setFirmwareState:v31];
      break;
    case 146:
      v32 = sc_get_log();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_25BA34000, v32, OS_LOG_TYPE_INFO, "escalation packet received", buf, 2u);
      }

      if ((unint64_t)[v5 length] >= 3)
      {
        *(_WORD *)buf = 0;
        objc_msgSend(v5, "getBytes:range:", buf, 1, 2);
        long long v9 = [(SCService *)self packetDropDetector];
        uint64_t v10 = *(unsigned __int16 *)buf;
        uint64_t v11 = [v5 length];
        int v12 = v9;
        uint64_t v13 = 146;
        goto LABEL_34;
      }
      break;
    case 147:
      uint64_t v8 = sc_get_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_25BA34000, v8, OS_LOG_TYPE_INFO, "de-escalation packet received", buf, 2u);
      }

      if ((unint64_t)[v5 length] >= 3)
      {
        *(_WORD *)buf = 0;
        objc_msgSend(v5, "getBytes:range:", buf, 1, 2);
        long long v9 = [(SCService *)self packetDropDetector];
        uint64_t v10 = *(unsigned __int16 *)buf;
        uint64_t v11 = [v5 length];
        int v12 = v9;
        uint64_t v13 = 147;
LABEL_34:
        [v12 handlePacketWithReportID:v13 frameIndex:v10 size:v11];
LABEL_43:
      }
      break;
  }
LABEL_64:
}

- (void)handleAbort:(unsigned __int8)a3 withAnalytics:(const SCAnalytics *)a4 atTimestamp:(double)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  switch(a3)
  {
    case 0u:
      uint64_t v8 = sc_get_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        -[SCService handleAbort:withAnalytics:atTimestamp:]();
      }

      uint64_t v9 = 0;
      uint64_t v10 = "thermistor broken";
      break;
    case 1u:
      uint64_t v10 = "motion";
      uint64_t v9 = 3;
      break;
    case 2u:
      uint64_t v10 = "posture";
      uint64_t v9 = 4;
      break;
    case 3u:
      uint64_t v10 = "low heart rate";
      goto LABEL_21;
    case 4u:
      uint64_t v10 = "high heart rate";
      goto LABEL_21;
    case 5u:
      uint64_t v10 = "poor signal";
      goto LABEL_21;
    case 6u:
      uint64_t v11 = sc_get_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        -[SCService handleAbort:withAnalytics:atTimestamp:]();
      }

      uint64_t v9 = 0;
      uint64_t v10 = "samples dropped";
      break;
    case 7u:
      int v12 = sc_get_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        -[SCService handleAbort:withAnalytics:atTimestamp:]();
      }

      uint64_t v9 = 0;
      uint64_t v10 = "hardware recovery";
      break;
    case 8u:
      uint64_t v13 = sc_get_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        -[SCService handleAbort:withAnalytics:atTimestamp:].cold.4();
      }

      uint64_t v9 = 0;
      uint64_t v10 = "general error";
      break;
    case 9u:
      uint64_t v10 = "poor accel signal";
LABEL_21:
      uint64_t v9 = 2;
      break;
    case 0xAu:
      uint64_t v9 = 0;
      uint64_t v10 = "excessive invalid samples";
      break;
    default:
      uint64_t v9 = 0;
      uint64_t v10 = "(invalid reason code)";
      break;
  }
  __int16 v14 = [(SCService *)self processor];
  int v15 = [v14 forBackground];

  uint64_t v16 = sc_get_log();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v15)
  {
    if (v17)
    {
      int v22 = 134218242;
      double v23 = a5;
      __int16 v24 = 2080;
      v25 = v10;
      _os_log_impl(&dword_25BA34000, v16, OS_LOG_TYPE_DEFAULT, "%.6f :: background session aborted due to %s", (uint8_t *)&v22, 0x16u);
    }

    objc_super v18 = [(SCService *)self device];
    id v19 = [(SCService *)self processor];
    objc_msgSend(v18, "reportBackgroundSessionOutcome:forTimestamp:", 0, objc_msgSend(v19, "startTimestamp"));

    [(SCService *)self reportBackgroundIntervalAnalyticsWithSuccess:0];
    if (!a4) {
      goto LABEL_31;
    }
LABEL_30:
    [(SCService *)self reportSessionAnalytics:a4 withTimestamp:a5];
    goto LABEL_31;
  }
  if (v17)
  {
    int v22 = 134218242;
    double v23 = a5;
    __int16 v24 = 2080;
    v25 = v10;
    _os_log_impl(&dword_25BA34000, v16, OS_LOG_TYPE_DEFAULT, "%.6f :: foreground session aborted due to %s", (uint8_t *)&v22, 0x16u);
  }

  uint64_t v20 = [(SCService *)self connection];
  v21 = [v20 healthlite];
  [v21 sessionDidNotProduceResultForReason:v9];

  [(SCService *)self selectAnOperatingModeOtherThanForeground];
  if (a4) {
    goto LABEL_30;
  }
LABEL_31:
  [(SCService *)self setProcessor:0];
}

- (void)reportBackgroundIntervalAnalyticsWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  v17[3] = *MEMORY[0x263EF8340];
  id v5 = [(SCService *)self preferences];
  char v6 = [v5 bypassAlgorithms];

  if ((v6 & 1) == 0)
  {
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    double v8 = v7;
    if ([(SCService *)self previousBackgroundReadingExists])
    {
      v16[0] = @"seconds_since_last_read";
      uint64_t v9 = NSNumber;
      [(SCService *)self previousBackgroundReadingWallclock];
      uint64_t v11 = [v9 numberWithDouble:v8 - v10];
      v17[0] = v11;
      v16[1] = @"last_read_was_successful";
      int v12 = objc_msgSend(NSNumber, "numberWithBool:", -[SCService previousBackgroundReadingWasSuccessful](self, "previousBackgroundReadingWasSuccessful"));
      v17[1] = v12;
      v16[2] = @"current_read_was_successful";
      uint64_t v13 = [NSNumber numberWithBool:v3];
      v17[2] = v13;
      __int16 v14 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:3];

      int v15 = sc_get_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        -[SCService reportBackgroundIntervalAnalyticsWithSuccess:]((uint64_t)v14, v15);
      }

      AnalyticsSendEvent();
    }
    else
    {
      [(SCService *)self setPreviousBackgroundReadingExists:1];
    }
    [(SCService *)self setPreviousBackgroundReadingWasSuccessful:v3];
    [(SCService *)self setPreviousBackgroundReadingWallclock:v8];
  }
}

- (void)handleMotionStatusChange:(BOOL)a3 atTimestamp:(double)a4
{
  BOOL v5 = a3;
  uint64_t v15 = *MEMORY[0x263EF8340];
  double v7 = sc_get_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    double v8 = "good";
    if (v5) {
      double v8 = "bad";
    }
    int v11 = 134218242;
    double v12 = a4;
    __int16 v13 = 2080;
    __int16 v14 = v8;
    _os_log_impl(&dword_25BA34000, v7, OS_LOG_TYPE_DEFAULT, "%.6f :: motion status changed to %s", (uint8_t *)&v11, 0x16u);
  }

  uint64_t v9 = [(SCService *)self connection];
  double v10 = [v9 healthlite];
  [v10 handleMotionStatusChange:v5];
}

- (void)handlePostureStatusChange:(BOOL)a3 atTimestamp:(double)a4
{
  BOOL v5 = a3;
  uint64_t v15 = *MEMORY[0x263EF8340];
  double v7 = sc_get_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    double v8 = "good";
    if (v5) {
      double v8 = "bad";
    }
    int v11 = 134218242;
    double v12 = a4;
    __int16 v13 = 2080;
    __int16 v14 = v8;
    _os_log_impl(&dword_25BA34000, v7, OS_LOG_TYPE_DEFAULT, "%.6f :: posture status changed to %s", (uint8_t *)&v11, 0x16u);
  }

  uint64_t v9 = [(SCService *)self connection];
  double v10 = [v9 healthlite];
  [v10 handlePostureStatusChange:v5];
}

- (double)wallclockForRTPTimestamp:(unint64_t)a3
{
  [(SCService *)self timestampReference];
  [(SCService *)self timestampReference];
  [(SCService *)self timestampReference];
  LODWORD(v5) = v7;
  return v9 + ((double)a3 - (double)v8) / (double)v5;
}

- (void)handleResult:(const SCResult *)a3 withAnalytics:(const SCAnalytics *)a4 atTimestamp:(double)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  double v9 = sc_get_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    double v10 = [(SCService *)self processor];
    int v11 = [v10 forBackground];
    double v12 = "foreground";
    float var0 = a3->var0;
    float var1 = a3->var1;
    int v30 = 134218755;
    if (v11) {
      double v12 = "background";
    }
    *(double *)int v31 = a5;
    *(_WORD *)&v31[8] = 2080;
    *(void *)&v31[10] = v12;
    *(_WORD *)&v31[18] = 2049;
    double v32 = var0;
    __int16 v33 = 2049;
    double v34 = var1;
    _os_log_impl(&dword_25BA34000, v9, OS_LOG_TYPE_DEFAULT, "%.6f :: %s session completed with an SpO2 of %{private}g %% and a heart rate of %{private}g BPM", (uint8_t *)&v30, 0x2Au);
  }
  float v16 = a3->var0;
  float v15 = a3->var1;
  BOOL v17 = [(SCService *)self processor];
  -[SCService wallclockForRTPTimestamp:](self, "wallclockForRTPTimestamp:", [v17 startTimestamp]);
  uint64_t v19 = v18;
  uint64_t v20 = [(SCService *)self processor];
  [v20 expectedDuration];
  uint64_t v22 = v21;

  double v23 = [(SCService *)self processor];
  int v24 = [v23 forBackground];

  v25 = [(SCService *)self connection];
  uint64_t v26 = [v25 healthlite];
  v27 = v26;
  int v30 = LODWORD(v16);
  *(float *)int v31 = v15;
  *(void *)&v31[4] = v19;
  *(void *)&v31[12] = v22;
  if (v24)
  {
    [v26 handleBackgroundMeasurement:&v30];

    v28 = [(SCService *)self device];
    v29 = [(SCService *)self processor];
    objc_msgSend(v28, "reportBackgroundSessionOutcome:forTimestamp:", 1, objc_msgSend(v29, "startTimestamp"));

    [(SCService *)self reportBackgroundIntervalAnalyticsWithSuccess:1];
  }
  else
  {
    [v26 sessionDidProduceMeasurement:&v30];

    [(SCService *)self selectAnOperatingModeOtherThanForeground];
  }
  [(SCService *)self reportSessionAnalytics:a4 withTimestamp:a5];
  [(SCService *)self setProcessor:0];
}

- (void)reportSessionAnalytics:(const SCAnalytics *)a3 withTimestamp:(double)a4
{
  int v7 = [(SCService *)self preferences];
  char v8 = [v7 bypassAlgorithms];

  if ((v8 & 1) == 0)
  {
    double v9 = [(SCService *)self processor];
    double v10 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SCService systemInstance](self, "systemInstance"));
    int v11 = [v10 stringValue];
    double v12 = [v9 dictionaryForAnalytics:a3 sessionDuration:v11 systemInterface:a4];

    if (v12)
    {
      __int16 v13 = [(SCService *)self connection];
      __int16 v14 = [v13 healthlite];
      float v15 = [(SCService *)self processor];
      objc_msgSend(v14, "reportScandiumSessionAnalytics:forBackground:", v12, objc_msgSend(v15, "forBackground"));
    }
    else
    {
      float v16 = sc_get_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        -[SCService reportSessionAnalytics:withTimestamp:]((uint64_t)a3, self, v16);
      }
    }
  }
}

- (void)handleInitialConnect
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "-[SCService handleInitialConnect]";
  _os_log_debug_impl(&dword_25BA34000, log, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v1, 0xCu);
}

- (void)handleConnectionInvalidation
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_25BA34000, v0, v1, "connection to healthlited was invalidated", v2, v3, v4, v5, v6);
}

- (void)handleHealthLiteDeath
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_25BA34000, v0, OS_LOG_TYPE_ERROR, "healthlited died", v1, 2u);
}

- (void)abortSession
{
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_25BA34000, v0, OS_LOG_TYPE_DEBUG, "asked to abort foreground session when not in the foreground operating mode", v1, 2u);
}

- (void)beginSession
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_25BA34000, v0, v1, "attempt to begin foreground session when already in the foreground operating mode", v2, v3, v4, v5, v6);
}

- (void)setBackgroundAllowed:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = sc_get_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SCService setBackgroundAllowed:](v5);
  }

  if ([(SCService *)self backgroundIsAllowed] != v3)
  {
    [(SCService *)self setBackgroundIsAllowed:v3];
    uint8_t v6 = sc_get_log();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (!v7) {
        goto LABEL_10;
      }
      __int16 v11 = 0;
      char v8 = "background is now allowed";
      double v9 = (uint8_t *)&v11;
    }
    else
    {
      if (!v7) {
        goto LABEL_10;
      }
      __int16 v10 = 0;
      char v8 = "background is no longer allowed";
      double v9 = (uint8_t *)&v10;
    }
    _os_log_impl(&dword_25BA34000, v6, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
LABEL_10:

    if ([(SCService *)self operatingMode] != 1) {
      [(SCService *)self selectAnOperatingModeOtherThanForeground];
    }
  }
}

- (OS_dispatch_queue)serviceQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (SCDevice)device
{
  return self->_device;
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (SCProcessor)processor
{
  return self->_processor;
}

- (void)setProcessor:(id)a3
{
}

- (SCTimeReference)timeReference
{
  return self->_timeReference;
}

- (void)setTimeReference:(id)a3
{
}

- (SCHealthLiteConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (BOOL)backgroundIsAllowed
{
  return self->_backgroundIsAllowed;
}

- (void)setBackgroundIsAllowed:(BOOL)a3
{
  self->_backgroundIsAllowed = a3;
}

- (SCPacketDropDetector)packetDropDetector
{
  return self->_packetDropDetector;
}

- (SCPreferences)preferences
{
  return self->_preferences;
}

- (SCPowerAssertion)powerAssertion
{
  return self->_powerAssertion;
}

- (void)setPowerAssertion:(id)a3
{
}

- (BOOL)previousBackgroundReadingExists
{
  return self->_previousBackgroundReadingExists;
}

- (void)setPreviousBackgroundReadingExists:(BOOL)a3
{
  self->_previousBackgroundReadingExists = a3;
}

- (BOOL)previousBackgroundReadingWasSuccessful
{
  return self->_previousBackgroundReadingWasSuccessful;
}

- (void)setPreviousBackgroundReadingWasSuccessful:(BOOL)a3
{
  self->_previousBackgroundReadingWasSuccessful = a3;
}

- (double)previousBackgroundReadingWallclock
{
  return self->_previousBackgroundReadingWallclock;
}

- (void)setPreviousBackgroundReadingWallclock:(double)a3
{
  self->_previousBackgroundReadingWallclock = a3;
}

- (unint64_t)systemInstance
{
  return self->_systemInstance;
}

- (SCRTPTimestampReference)timestampReference
{
  *retstr = self[4];
  return self;
}

- (void)setTimestampReference:(SCRTPTimestampReference *)a3
{
  long long v3 = *(_OWORD *)&a3->cfAbsoluteTime;
  *(void *)&self->_timestampReference.ticksPerSecond = *(void *)&a3->ticksPerSecond;
  *(_OWORD *)&self->_timestampReference.cfAbsoluteTime = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerAssertion, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_packetDropDetector, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_timeReference, 0);
  objc_storeStrong((id *)&self->_processor, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_serviceQueue, 0);
}

- (void)handleScandiumInputReport:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_25BA34000, v0, v1, "failed to instantiate the SCProcessor object", v2, v3, v4, v5, v6);
}

- (void)handleScandiumInputReport:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_25BA34000, v0, v1, "received a background start packet outside of a background escalation", v2, v3, v4, v5, v6);
}

- (void)handleScandiumInputReport:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_25BA34000, v0, v1, "received a foreground start packet outside of foreground mode", v2, v3, v4, v5, v6);
}

- (void)handleScandiumInputReport:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_25BA34000, v0, v1, "start packet received while the processor object is still instantiated", v2, v3, v4, v5, v6);
}

- (void)handleScandiumInputReport:(os_log_t)log .cold.5(os_log_t log)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 67109120;
  v1[1] = 67;
  _os_log_fault_impl(&dword_25BA34000, log, OS_LOG_TYPE_FAULT, "input report 0x%x is the wrong size", (uint8_t *)v1, 8u);
}

- (void)handleScandiumInputReport:(void *)a1 .cold.6(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 68157954;
  v4[1] = [a1 length];
  __int16 v5 = 2096;
  uint64_t v6 = [a1 bytes];
  _os_log_debug_impl(&dword_25BA34000, a2, OS_LOG_TYPE_DEBUG, "input report: %.*P", (uint8_t *)v4, 0x12u);
}

- (void)handleAbort:withAnalytics:atTimestamp:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_25BA34000, v0, v1, "scandium session aborted due to broken thermistor", v2, v3, v4, v5, v6);
}

- (void)handleAbort:withAnalytics:atTimestamp:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_25BA34000, v0, v1, "scandium session aborted due to dropped samples (e.g. pre-UVLO)", v2, v3, v4, v5, v6);
}

- (void)handleAbort:withAnalytics:atTimestamp:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_25BA34000, v0, v1, "scandium session aborted due to hardware recovery", v2, v3, v4, v5, v6);
}

- (void)handleAbort:withAnalytics:atTimestamp:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_25BA34000, v0, v1, "scandium session aborted due to general error", v2, v3, v4, v5, v6);
}

- (void)reportBackgroundIntervalAnalyticsWithSuccess:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 138412546;
  uint64_t v3 = @"com.apple.hid.scandium.background_interval";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_25BA34000, a2, OS_LOG_TYPE_DEBUG, "sending %@ to CoreAnalytics: %@", (uint8_t *)&v2, 0x16u);
}

- (void)reportSessionAnalytics:(NSObject *)a3 withTimestamp:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v5 = *(void *)(a1 + 208);
  uint64_t v6 = [a2 processor];
  if ([v6 forBackground]) {
    uint64_t v7 = "background";
  }
  else {
    uint64_t v7 = "foreground";
  }
  char v8 = [a2 processor];
  int v9 = 138543874;
  uint64_t v10 = v5;
  __int16 v11 = 2082;
  double v12 = v7;
  __int16 v13 = 2114;
  __int16 v14 = v8;
  _os_log_fault_impl(&dword_25BA34000, a3, OS_LOG_TYPE_FAULT, "stats is nil. Skip sending analytics. analytics->is_complete: %{public}@ self.processor.forBackground: %{public}s self.processor = %{public}@", (uint8_t *)&v9, 0x20u);
}

- (void)setBackgroundAllowed:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  int v2 = "-[SCService setBackgroundAllowed:]";
  _os_log_debug_impl(&dword_25BA34000, log, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v1, 0xCu);
}

@end