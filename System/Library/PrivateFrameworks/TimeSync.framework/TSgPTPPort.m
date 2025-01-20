@interface TSgPTPPort
+ (id)diagnosticDescriptionForInfo:(id)a3 withIndent:(id)a4;
+ (id)diagnosticInfoForClockIdentifier:(unint64_t)a3 andPortNumber:(unsigned __int16)a4;
+ (id)gPTPPortWithClockIdentifier:(unint64_t)a3 andPortNumber:(unsigned __int16)a4;
+ (id)gPTPPortWithImplDC:(id)a3;
+ (id)keyPathsForValuesAffectingClockIdentifier;
+ (id)keyPathsForValuesAffectingPortNumber;
+ (id)keyPathsForValuesAffectingPortRole;
+ (id)keyPathsForValuesAffectingPortType;
+ (id)keyPathsForValuesAffectingPropertyUpdateQueue;
- (BOOL)startAutomaticPropertyUpdates;
- (BOOL)stopAutomaticPropertyUpdates;
- (OS_dispatch_queue)propertyUpdateQueue;
- (TSgPTPPort)init;
- (TSgPTPPort)initWithClockIdentifier:(unint64_t)a3 andPortNumber:(unsigned __int16)a4;
- (TSgPTPPort)initWithImplDC:(id)a3;
- (id)getMetrics;
- (id)getMetricsWithDelta:(id)a3;
- (id)interruptionHandler;
- (int)portRole;
- (int)portType;
- (unint64_t)clockIdentifier;
- (unsigned)portNumber;
- (void)dealloc;
- (void)setInterruptionHandler:(id)a3;
- (void)setPropertyUpdateQueue:(id)a3;
- (void)updateProperties;
@end

@implementation TSgPTPPort

- (TSgPTPPort)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = [NSString stringWithUTF8String:"-[TSgPTPPort init]"];
  [v3 raise:v4, @"Do not call %@", v5 format];

  return 0;
}

+ (id)gPTPPortWithImplDC:(id)a3
{
  id v3 = a3;
  unsigned int v4 = [v3 portType];
  if (v4 > 8 || (v5 = (void *)[objc_alloc(*off_1E622AD78[v4]) initWithImplDC:v3]) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[TSgPTPPort gPTPPortWithImplDC:](v3);
    }
    v5 = 0;
  }

  return v5;
}

+ (id)gPTPPortWithClockIdentifier:(unint64_t)a3 andPortNumber:(unsigned __int16)a4
{
  unsigned int v4 = +[_TSF_TSDgPTPPort gPTPPortWithClockIdentifier:a3 portNumber:a4];
  v5 = +[TSgPTPPort gPTPPortWithImplDC:v4];

  return v5;
}

- (TSgPTPPort)initWithClockIdentifier:(unint64_t)a3 andPortNumber:(unsigned __int16)a4
{
  v5 = +[_TSF_TSDgPTPPort gPTPPortWithClockIdentifier:a3 portNumber:a4];
  v6 = [(TSgPTPPort *)self initWithImplDC:v5];

  return v6;
}

- (TSgPTPPort)initWithImplDC:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v11 = "[portImpl isKindOfClass:[TSDgPTPPort class]]";
      __int16 v12 = 2048;
      uint64_t v13 = 0;
      __int16 v14 = 2048;
      uint64_t v15 = 0;
      __int16 v16 = 2080;
      v17 = "";
      __int16 v18 = 2080;
      v19 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSgPTPPort.m";
      __int16 v20 = 1024;
      int v21 = 135;
      v8 = MEMORY[0x1E4F14500];
LABEL_10:
      _os_log_impl(&dword_1BA88B000, v8, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
LABEL_11:

    self = 0;
    goto LABEL_5;
  }
  v9.receiver = self;
  v9.super_class = (Class)TSgPTPPort;
  v6 = [(TSgPTPPort *)&v9 init];
  self = v6;
  if (v6)
  {
    if (v5)
    {
      objc_storeStrong((id *)&v6->_impl, a3);
      goto LABEL_5;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v11 = "portImpl != nil";
      __int16 v12 = 2048;
      uint64_t v13 = 0;
      __int16 v14 = 2048;
      uint64_t v15 = 0;
      __int16 v16 = 2080;
      v17 = "";
      __int16 v18 = 2080;
      v19 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSgPTPPort.m";
      __int16 v20 = 1024;
      int v21 = 141;
      v8 = MEMORY[0x1E4F14500];
      goto LABEL_10;
    }
    goto LABEL_11;
  }
LABEL_5:

  return self;
}

- (void)dealloc
{
  [(_TSF_TSDgPTPPort *)self->_impl finalizeNotifications];
  v3.receiver = self;
  v3.super_class = (Class)TSgPTPPort;
  [(TSgPTPPort *)&v3 dealloc];
}

- (void)updateProperties
{
}

- (BOOL)startAutomaticPropertyUpdates
{
  return [(_TSF_TSDgPTPPort *)self->_impl startAutomaticPropertyUpdates];
}

- (BOOL)stopAutomaticPropertyUpdates
{
  return [(_TSF_TSDgPTPPort *)self->_impl stopAutomaticPropertyUpdates];
}

+ (id)keyPathsForValuesAffectingPortNumber
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.portNumber", 0);
}

- (unsigned)portNumber
{
  return [(_TSF_TSDgPTPPort *)self->_impl portNumber];
}

+ (id)keyPathsForValuesAffectingPortRole
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.portRole", 0);
}

- (int)portRole
{
  return [(_TSF_TSDgPTPPort *)self->_impl portRole];
}

+ (id)keyPathsForValuesAffectingClockIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.clockIdentifier", 0);
}

- (unint64_t)clockIdentifier
{
  return [(_TSF_TSDgPTPPort *)self->_impl clockIdentifier];
}

+ (id)keyPathsForValuesAffectingPortType
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.portType", 0);
}

- (int)portType
{
  return [(_TSF_TSDgPTPPort *)self->_impl portType];
}

+ (id)keyPathsForValuesAffectingPropertyUpdateQueue
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.propertyUpdateQueue", 0);
}

- (void)setPropertyUpdateQueue:(id)a3
{
}

- (OS_dispatch_queue)propertyUpdateQueue
{
  return [(_TSF_TSDgPTPPort *)self->_impl propertyUpdateQueue];
}

+ (id)diagnosticDescriptionForInfo:(id)a3 withIndent:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x1E4F28E78] string];
  v8 = [v5 objectForKeyedSubscript:@"ClassName"];
  [v7 appendFormat:@"%@+%@\n", v6, v8];

  [v7 appendFormat:@"%@    Port Number: ", v6];
  objc_super v9 = [v5 objectForKeyedSubscript:@"PortNumber"];
  v10 = v9;
  if (v9) {
    objc_msgSend(v7, "appendFormat:", @"%hu\n", objc_msgSend(v9, "unsignedShortValue"));
  }
  else {
    [v7 appendString:@"Could not read property\n"];
  }
  [v7 appendFormat:@"%@    Port Role: ", v6];
  v11 = [v5 objectForKeyedSubscript:@"PortRole"];

  if (v11)
  {
    switch([v11 intValue])
    {
      case 0u:
        __int16 v12 = @"Disabled\n";
        goto LABEL_12;
      case 1u:
        __int16 v12 = @"Passive\n";
        goto LABEL_12;
      case 2u:
        __int16 v12 = @"Slave\n";
        goto LABEL_12;
      case 3u:
        __int16 v12 = @"Master\n";
        goto LABEL_12;
      default:
        objc_msgSend(v7, "appendFormat:", @"Unknown (%d)\n", objc_msgSend(v11, "intValue"));
        break;
    }
  }
  else
  {
    __int16 v12 = @"Could not read property\n";
LABEL_12:
    [v7 appendString:v12];
  }
  [v7 appendFormat:@"%@    Port Type: ", v6];
  uint64_t v13 = [v5 objectForKeyedSubscript:@"PortType"];

  if (v13)
  {
    switch([v13 intValue])
    {
      case 1u:
        __int16 v14 = @"AVB Ethernet\n";
        goto LABEL_17;
      case 2u:
        __int16 v14 = @"Unicast Point-to-Point Link Layer\n";
        goto LABEL_17;
      case 3u:
        __int16 v14 = @"Unicast Point-to-Point UDPv4\n";
        goto LABEL_17;
      case 4u:
        __int16 v14 = @"Unicast Point-to-Point UDPv6\n";
        goto LABEL_17;
      case 5u:
        __int16 v14 = @"Unicast End-to-End Link Layer\n";
        goto LABEL_17;
      case 6u:
        __int16 v14 = @"Unicast End-to-End UDPv4\n";
        goto LABEL_17;
      case 7u:
        __int16 v14 = @"Unicast End-to-End UDPv6\n";
        goto LABEL_17;
      case 8u:
        __int16 v14 = @"Local Clock\n";
        goto LABEL_17;
      default:
        objc_msgSend(v7, "appendFormat:", @"Unknown (%d)\n", objc_msgSend(v13, "intValue"));
        break;
    }
  }
  else
  {
    __int16 v14 = @"Could not read property\n";
LABEL_17:
    [v7 appendString:v14];
  }

  return v7;
}

+ (id)diagnosticInfoForClockIdentifier:(unint64_t)a3 andPortNumber:(unsigned __int16)a4
{
  return +[_TSF_TSDgPTPPort diagnosticInfoForClockIdentifier:a3 andPortNumber:a4];
}

- (id)getMetrics
{
  v2 = [(_TSF_TSDgPTPPort *)self->_impl getMetrics];
  if (v2) {
    objc_super v3 = [[TSPortMetrics alloc] initWithDaemonMetrics:v2];
  }
  else {
    objc_super v3 = 0;
  }

  return v3;
}

- (id)getMetricsWithDelta:(id)a3
{
  impl = self->_impl;
  unsigned int v4 = [a3 toDaemonMetrics];
  id v5 = [(_TSF_TSDgPTPPort *)impl getMetricsWithDelta:v4];

  if (v5) {
    id v6 = [[TSPortMetrics alloc] initWithDaemonMetrics:v5];
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_impl, 0);
}

+ (void)gPTPPortWithImplDC:(void *)a1 .cold.1(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  id v3 = objc_claimAutoreleasedReturnValue();
  int v4 = 136315650;
  uint64_t v5 = [v3 UTF8String];
  __int16 v6 = 2048;
  uint64_t v7 = objc_opt_class();
  __int16 v8 = 1024;
  int v9 = [a1 portType];
  _os_log_error_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to create port for %s %p %u", (uint8_t *)&v4, 0x1Cu);
}

@end