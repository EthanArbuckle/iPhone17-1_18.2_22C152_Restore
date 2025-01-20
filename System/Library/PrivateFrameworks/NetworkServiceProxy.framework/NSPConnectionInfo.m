@interface NSPConnectionInfo
+ (BOOL)shouldMoveToNextEdgeForFallbackReason:(int64_t)a3;
+ (BOOL)shouldResolveForFallbackReason:(int64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (id)getFallbackReasonDescription:(int64_t)a3;
+ (int)fallbackReasonToErrno:(int64_t)a3;
- (BOOL)TFOSucceeded;
- (BOOL)isMultipath;
- (BOOL)isTFOProbeSucceeded;
- (NSArray)timingIntervals;
- (NSDate)firstTxByteTimeStamp;
- (NSDictionary)TCPInfo;
- (NSDictionary)exceptions;
- (NSDictionary)multipathSubflowSwitchCounts;
- (NSPConnectionInfo)initWithCoder:(id)a3;
- (NSString)edgeAddress;
- (NSString)interfaceName;
- (double)connectionDelay;
- (double)fallbackDelay;
- (double)firstTxByteDelay;
- (double)timeIntervalSinceLastUsage;
- (double)timeToFirstByte;
- (id)copyDictionary;
- (id)timingIntervalAtIndex:(unint64_t)a3 forKey:(id)a4;
- (int64_t)IPType;
- (int64_t)edgeType;
- (int64_t)fallbackReason;
- (int64_t)fallbackReasonCategory;
- (int64_t)interfaceType;
- (int64_t)pathType;
- (int64_t)tunnelConnectionError;
- (unint64_t)initialBytesLeftOver;
- (unint64_t)minimumRTT;
- (unint64_t)multipathConnectedSubflowCount;
- (unint64_t)multipathPrimarySubflowInterfaceIndex;
- (unint64_t)multipathSubflowCount;
- (void)encodeWithCoder:(id)a3;
- (void)setConnectionDelay:(double)a3;
- (void)setEdgeAddress:(id)a3;
- (void)setEdgeType:(int64_t)a3;
- (void)setExceptions:(id)a3;
- (void)setFallbackDelay:(double)a3;
- (void)setFallbackReason:(int64_t)a3;
- (void)setFirstTxByteDelay:(double)a3;
- (void)setFirstTxByteTimeStamp:(id)a3;
- (void)setIPType:(int64_t)a3;
- (void)setInitialBytesLeftOver:(unint64_t)a3;
- (void)setInterfaceName:(id)a3;
- (void)setInterfaceType:(int64_t)a3;
- (void)setIsMultipath:(BOOL)a3;
- (void)setIsTFOProbeSucceeded:(BOOL)a3;
- (void)setMinimumRTT:(unint64_t)a3;
- (void)setMultipathConnectedSubflowCount:(unint64_t)a3;
- (void)setMultipathPrimarySubflowInterfaceIndex:(unint64_t)a3;
- (void)setMultipathSubflowCount:(unint64_t)a3;
- (void)setMultipathSubflowSwitchCounts:(id)a3;
- (void)setPathType:(int64_t)a3;
- (void)setTCPInfo:(id)a3;
- (void)setTFOSucceeded:(BOOL)a3;
- (void)setTimeIntervalSinceLastUsage:(double)a3;
- (void)setTimeToFirstByte:(double)a3;
- (void)setTimingIntervals:(id)a3;
- (void)setTunnelConnectionError:(int64_t)a3;
@end

@implementation NSPConnectionInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSPConnectionInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)NSPConnectionInfo;
  v5 = [(NSPConnectionInfo *)&v27 init];
  if (v5)
  {
    v5->_pathType = [v4 decodeIntegerForKey:@"pathType"];
    v5->_fallbackReason = [v4 decodeIntegerForKey:@"fallbackReason"];
    v5->_fallbackReasonCategory = [v4 decodeIntegerForKey:@"fallbackCategory"];
    [v4 decodeDoubleForKey:@"fallbackDelay"];
    v5->_fallbackDelay = v6;
    v5->_edgeType = [v4 decodeIntegerForKey:@"edgeType"];
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"edgeAddress"];
    edgeAddress = v5->_edgeAddress;
    v5->_edgeAddress = (NSString *)v7;

    v5->_isMultipath = [v4 decodeBoolForKey:@"isMultipath"];
    v5->_multipathSubflowCount = [v4 decodeIntegerForKey:@"multipathSubflowCountKey"];
    v5->_multipathConnectedSubflowCount = [v4 decodeIntegerForKey:@"multipathConnectedSubflowCountKey"];
    v5->_multipathPrimarySubflowInterfaceIndex = [v4 decodeIntegerForKey:@"multipathPrimarySubflowInterfaceIndex"];
    v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v9, "setWithObjects:", v10, v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"multipathSubflowSwitchCounts"];
    multipathSubflowSwitchCounts = v5->_multipathSubflowSwitchCounts;
    v5->_multipathSubflowSwitchCounts = (NSDictionary *)v13;

    v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v15, "setWithObjects:", v16, v17, objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"TCPInfo"];
    TCPInfo = v5->_TCPInfo;
    v5->_TCPInfo = (NSDictionary *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"firstTxByteTimeStamp"];
    firstTxByteTimeStamp = v5->_firstTxByteTimeStamp;
    v5->_firstTxByteTimeStamp = (NSDate *)v21;

    [v4 decodeDoubleForKey:@"firstTxByteDelay"];
    v5->_firstTxByteDelay = v23;
    [v4 decodeDoubleForKey:@"connectionDelay"];
    v5->_connectionDelay = v24;
    v5->_TFOSucceeded = [v4 decodeBoolForKey:@"TFOSucceeded"];
    v5->_IPType = [v4 decodeIntegerForKey:@"IPType"];
    v5->_interfaceType = [v4 decodeIntegerForKey:@"interfaceType"];
    [v4 decodeDoubleForKey:@"timeIntervalSinceLastUsage"];
    v5->_timeIntervalSinceLastUsage = v25;
    v5->_timeToFirstByte = (double)[v4 decodeIntegerForKey:@"timeToFirstByte"];
    v5->_tunnelConnectionError = [v4 decodeIntegerForKey:@"tunnelConnectionError"];
    v5->_isTFOProbeSucceeded = [v4 decodeBoolForKey:@"isTFOProbeSucceeded"];
    v5->_initialBytesLeftOver = [v4 decodeIntegerForKey:@"initialBytesLeftOver"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  objc_msgSend(v8, "encodeInteger:forKey:", -[NSPConnectionInfo pathType](self, "pathType"), @"pathType");
  objc_msgSend(v8, "encodeInteger:forKey:", -[NSPConnectionInfo fallbackReason](self, "fallbackReason"), @"fallbackReason");
  objc_msgSend(v8, "encodeInteger:forKey:", -[NSPConnectionInfo fallbackReasonCategory](self, "fallbackReasonCategory"), @"fallbackCategory");
  [(NSPConnectionInfo *)self fallbackDelay];
  objc_msgSend(v8, "encodeDouble:forKey:", @"fallbackDelay");
  objc_msgSend(v8, "encodeInteger:forKey:", -[NSPConnectionInfo edgeType](self, "edgeType"), @"edgeType");
  id v4 = [(NSPConnectionInfo *)self edgeAddress];
  [v8 encodeObject:v4 forKey:@"edgeAddress"];

  objc_msgSend(v8, "encodeBool:forKey:", -[NSPConnectionInfo isMultipath](self, "isMultipath"), @"isMultipath");
  objc_msgSend(v8, "encodeInteger:forKey:", -[NSPConnectionInfo multipathSubflowCount](self, "multipathSubflowCount"), @"multipathSubflowCountKey");
  objc_msgSend(v8, "encodeInteger:forKey:", -[NSPConnectionInfo multipathConnectedSubflowCount](self, "multipathConnectedSubflowCount"), @"multipathConnectedSubflowCountKey");
  objc_msgSend(v8, "encodeInteger:forKey:", -[NSPConnectionInfo multipathPrimarySubflowInterfaceIndex](self, "multipathPrimarySubflowInterfaceIndex"), @"multipathPrimarySubflowInterfaceIndex");
  v5 = [(NSPConnectionInfo *)self multipathSubflowSwitchCounts];
  [v8 encodeObject:v5 forKey:@"multipathSubflowSwitchCounts"];

  double v6 = [(NSPConnectionInfo *)self TCPInfo];
  [v8 encodeObject:v6 forKey:@"TCPInfo"];

  uint64_t v7 = [(NSPConnectionInfo *)self firstTxByteTimeStamp];
  [v8 encodeObject:v7 forKey:@"firstTxByteTimeStamp"];

  [(NSPConnectionInfo *)self firstTxByteDelay];
  objc_msgSend(v8, "encodeDouble:forKey:", @"firstTxByteDelay");
  [(NSPConnectionInfo *)self connectionDelay];
  objc_msgSend(v8, "encodeDouble:forKey:", @"connectionDelay");
  objc_msgSend(v8, "encodeBool:forKey:", -[NSPConnectionInfo TFOSucceeded](self, "TFOSucceeded"), @"TFOSucceeded");
  objc_msgSend(v8, "encodeInteger:forKey:", -[NSPConnectionInfo IPType](self, "IPType"), @"IPType");
  objc_msgSend(v8, "encodeInteger:forKey:", -[NSPConnectionInfo interfaceType](self, "interfaceType"), @"interfaceType");
  [(NSPConnectionInfo *)self timeIntervalSinceLastUsage];
  objc_msgSend(v8, "encodeDouble:forKey:", @"timeIntervalSinceLastUsage");
  [(NSPConnectionInfo *)self timeToFirstByte];
  objc_msgSend(v8, "encodeDouble:forKey:", @"timeToFirstByte");
  objc_msgSend(v8, "encodeInteger:forKey:", -[NSPConnectionInfo tunnelConnectionError](self, "tunnelConnectionError"), @"tunnelConnectionError");
  objc_msgSend(v8, "encodeBool:forKey:", -[NSPConnectionInfo isTFOProbeSucceeded](self, "isTFOProbeSucceeded"), @"isTFOProbeSucceeded");
  objc_msgSend(v8, "encodeInteger:forKey:", -[NSPConnectionInfo initialBytesLeftOver](self, "initialBytesLeftOver"), @"initialBytesLeftOver");
}

- (id)copyDictionary
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = objc_msgSend(objc_alloc(NSNumber), "initWithInteger:", -[NSPConnectionInfo pathType](self, "pathType"));
  [v3 setObject:v4 forKeyedSubscript:@"pathType"];

  v5 = objc_msgSend(objc_alloc(NSNumber), "initWithInteger:", -[NSPConnectionInfo fallbackReason](self, "fallbackReason"));
  [v3 setObject:v5 forKeyedSubscript:@"fallbackReason"];

  double v6 = objc_msgSend(objc_alloc(NSNumber), "initWithInteger:", -[NSPConnectionInfo fallbackReasonCategory](self, "fallbackReasonCategory"));
  [v3 setObject:v6 forKeyedSubscript:@"fallbackCategory"];

  id v7 = objc_alloc(NSNumber);
  [(NSPConnectionInfo *)self fallbackDelay];
  id v8 = objc_msgSend(v7, "initWithDouble:");
  [v3 setObject:v8 forKeyedSubscript:@"fallbackDelay"];

  v9 = [(NSPConnectionInfo *)self edgeAddress];

  if (v9)
  {
    uint64_t v10 = objc_msgSend(objc_alloc(NSNumber), "initWithInteger:", -[NSPConnectionInfo edgeType](self, "edgeType"));
    [v3 setObject:v10 forKeyedSubscript:@"edgeType"];

    uint64_t v11 = [(NSPConnectionInfo *)self edgeAddress];
    [v3 setObject:v11 forKeyedSubscript:@"edgeAddress"];
  }
  if ([(NSPConnectionInfo *)self isMultipath])
  {
    v12 = objc_msgSend(objc_alloc(NSNumber), "initWithBool:", -[NSPConnectionInfo isMultipath](self, "isMultipath"));
    [v3 setObject:v12 forKeyedSubscript:@"isMultipath"];

    uint64_t v13 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInteger:", -[NSPConnectionInfo multipathSubflowCount](self, "multipathSubflowCount"));
    [v3 setObject:v13 forKeyedSubscript:@"multipathSubflowCountKey"];

    v14 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInteger:", -[NSPConnectionInfo multipathConnectedSubflowCount](self, "multipathConnectedSubflowCount"));
    [v3 setObject:v14 forKeyedSubscript:@"multipathConnectedSubflowCountKey"];

    v15 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInteger:", -[NSPConnectionInfo multipathPrimarySubflowInterfaceIndex](self, "multipathPrimarySubflowInterfaceIndex"));
    [v3 setObject:v15 forKeyedSubscript:@"multipathPrimarySubflowInterfaceIndex"];

    uint64_t v16 = [(NSPConnectionInfo *)self multipathSubflowSwitchCounts];
    uint64_t v17 = [v16 count];

    if (v17)
    {
      v18 = [(NSPConnectionInfo *)self multipathSubflowSwitchCounts];
      [v3 setObject:v18 forKeyedSubscript:@"multipathSubflowSwitchCounts"];
    }
  }
  uint64_t v19 = [(NSPConnectionInfo *)self TCPInfo];
  uint64_t v20 = [v19 count];

  if (v20)
  {
    v57 = self;
    v58 = v3;
    uint64_t v21 = [(NSPConnectionInfo *)self TCPInfo];
    v22 = (void *)[v21 mutableCopy];

    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v23 = v22;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v59 objects:v63 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v60;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v60 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = *(void *)(*((void *)&v59 + 1) + 8 * i);
          v29 = [v23 objectForKeyedSubscript:v28];
          if ([v29 length] == 408)
          {
            uint64_t v30 = [v29 bytes];
            id v31 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            v32 = (void *)[objc_alloc(NSNumber) initWithUnsignedLongLong:*(void *)(v30 + 100)];
            [v31 setObject:v32 forKeyedSubscript:@"rxPackets"];

            v33 = (void *)[objc_alloc(NSNumber) initWithUnsignedLongLong:*(void *)(v30 + 108)];
            [v31 setObject:v33 forKeyedSubscript:@"rxBytes"];

            v34 = (void *)[objc_alloc(NSNumber) initWithUnsignedLongLong:*(void *)(v30 + 68)];
            [v31 setObject:v34 forKeyedSubscript:@"txPackets"];

            v35 = (void *)[objc_alloc(NSNumber) initWithUnsignedLongLong:*(void *)(v30 + 76)];
            [v31 setObject:v35 forKeyedSubscript:@"txBytes"];

            v36 = (void *)[objc_alloc(NSNumber) initWithUnsignedLongLong:*(void *)(v30 + 84)];
            [v31 setObject:v36 forKeyedSubscript:@"retransmitBytes"];

            v37 = (void *)[objc_alloc(NSNumber) initWithUnsignedLongLong:*(void *)(v30 + 284)];
            [v31 setObject:v37 forKeyedSubscript:@"retransmitPackets"];

            v38 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v31];
            [v23 setObject:v38 forKeyedSubscript:v28];
          }
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v59 objects:v63 count:16];
      }
      while (v25);
    }

    v39 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v23];
    id v3 = v58;
    [v58 setObject:v39 forKeyedSubscript:@"TCPInfo"];

    self = v57;
  }
  v40 = objc_msgSend(objc_alloc(NSNumber), "initWithInteger:", -[NSPConnectionInfo interfaceType](self, "interfaceType"));
  [v3 setObject:v40 forKeyedSubscript:@"interfaceType"];

  v41 = objc_msgSend(objc_alloc(NSNumber), "initWithBool:", -[NSPConnectionInfo isTFOProbeSucceeded](self, "isTFOProbeSucceeded"));
  [v3 setObject:v41 forKeyedSubscript:@"isTFOProbeSucceeded"];

  v42 = objc_msgSend(objc_alloc(NSNumber), "initWithInteger:", -[NSPConnectionInfo tunnelConnectionError](self, "tunnelConnectionError"));
  [v3 setObject:v42 forKeyedSubscript:@"tunnelConnectionError"];

  if ([(NSPConnectionInfo *)self pathType] == 1)
  {
    id v43 = objc_alloc(NSNumber);
    [(NSPConnectionInfo *)self firstTxByteDelay];
    v44 = objc_msgSend(v43, "initWithDouble:");
    [v3 setObject:v44 forKeyedSubscript:@"firstTxByteDelay"];

    id v45 = objc_alloc(NSNumber);
    [(NSPConnectionInfo *)self connectionDelay];
    v46 = objc_msgSend(v45, "initWithDouble:");
    [v3 setObject:v46 forKeyedSubscript:@"connectionDelay"];

    v47 = objc_msgSend(objc_alloc(NSNumber), "initWithBool:", -[NSPConnectionInfo TFOSucceeded](self, "TFOSucceeded"));
    [v3 setObject:v47 forKeyedSubscript:@"TFOSucceeded"];

    v48 = objc_msgSend(objc_alloc(NSNumber), "initWithInteger:", -[NSPConnectionInfo IPType](self, "IPType"));
    [v3 setObject:v48 forKeyedSubscript:@"IPType"];

    v49 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInteger:", -[NSPConnectionInfo minimumRTT](self, "minimumRTT"));
    [v3 setObject:v49 forKeyedSubscript:@"minimumRTT"];

    id v50 = objc_alloc(NSNumber);
    [(NSPConnectionInfo *)self timeIntervalSinceLastUsage];
    v51 = objc_msgSend(v50, "initWithDouble:");
    [v3 setObject:v51 forKeyedSubscript:@"timeIntervalSinceLastUsage"];

    id v52 = objc_alloc(NSNumber);
    [(NSPConnectionInfo *)self timeToFirstByte];
    v53 = objc_msgSend(v52, "initWithDouble:");
    [v3 setObject:v53 forKeyedSubscript:@"timeToFirstByte"];

    v54 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInteger:", -[NSPConnectionInfo initialBytesLeftOver](self, "initialBytesLeftOver"));
    [v3 setObject:v54 forKeyedSubscript:@"initialBytesLeftOver"];
  }
  v55 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v3];

  return v55;
}

+ (id)getFallbackReasonDescription:(int64_t)a3
{
  if ((unint64_t)a3 > 0x2D) {
    return 0;
  }
  else {
    return off_1E5A3BCA0[a3];
  }
}

+ (int)fallbackReasonToErrno:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0x2C) {
    return 0;
  }
  else {
    return dword_1A1092E30[a3 - 1];
  }
}

- (void)setFallbackReason:(int64_t)a3
{
  self->_fallbackReason = a3;
  if ((unint64_t)(a3 - 1) <= 0x2C) {
    self->_fallbackReasonCategory = qword_1A1092EE8[a3 - 1];
  }
}

- (int64_t)fallbackReason
{
  return self->_fallbackReason;
}

+ (BOOL)shouldMoveToNextEdgeForFallbackReason:(int64_t)a3
{
  return ((unint64_t)a3 < 0x24) & (0x808C00026uLL >> a3);
}

+ (BOOL)shouldResolveForFallbackReason:(int64_t)a3
{
  BOOL result = +[NSPConnectionInfo shouldMoveToNextEdgeForFallbackReason:](NSPConnectionInfo, "shouldMoveToNextEdgeForFallbackReason:");
  if (a3 == 4) {
    return 1;
  }
  return result;
}

- (id)timingIntervalAtIndex:(unint64_t)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = [(NSPConnectionInfo *)self timingIntervals];
  unint64_t v8 = [v7 count];

  if (v8 <= a3)
  {
    uint64_t v11 = 0;
  }
  else
  {
    v9 = [(NSPConnectionInfo *)self timingIntervals];
    uint64_t v10 = [v9 objectAtIndexedSubscript:a3];

    uint64_t v11 = [v10 objectForKeyedSubscript:v6];
  }
  return v11;
}

- (int64_t)pathType
{
  return self->_pathType;
}

- (void)setPathType:(int64_t)a3
{
  self->_pathType = a3;
}

- (int64_t)fallbackReasonCategory
{
  return self->_fallbackReasonCategory;
}

- (double)fallbackDelay
{
  return self->_fallbackDelay;
}

- (void)setFallbackDelay:(double)a3
{
  self->_fallbackDelay = a3;
}

- (int64_t)edgeType
{
  return self->_edgeType;
}

- (void)setEdgeType:(int64_t)a3
{
  self->_edgeType = a3;
}

- (NSString)edgeAddress
{
  return self->_edgeAddress;
}

- (void)setEdgeAddress:(id)a3
{
}

- (BOOL)isMultipath
{
  return self->_isMultipath;
}

- (void)setIsMultipath:(BOOL)a3
{
  self->_isMultipath = a3;
}

- (unint64_t)multipathSubflowCount
{
  return self->_multipathSubflowCount;
}

- (void)setMultipathSubflowCount:(unint64_t)a3
{
  self->_multipathSubflowCount = a3;
}

- (unint64_t)multipathConnectedSubflowCount
{
  return self->_multipathConnectedSubflowCount;
}

- (void)setMultipathConnectedSubflowCount:(unint64_t)a3
{
  self->_multipathConnectedSubflowCount = a3;
}

- (unint64_t)multipathPrimarySubflowInterfaceIndex
{
  return self->_multipathPrimarySubflowInterfaceIndex;
}

- (void)setMultipathPrimarySubflowInterfaceIndex:(unint64_t)a3
{
  self->_multipathPrimarySubflowInterfaceIndex = a3;
}

- (NSDictionary)multipathSubflowSwitchCounts
{
  return self->_multipathSubflowSwitchCounts;
}

- (void)setMultipathSubflowSwitchCounts:(id)a3
{
}

- (NSDictionary)TCPInfo
{
  return self->_TCPInfo;
}

- (void)setTCPInfo:(id)a3
{
}

- (NSDate)firstTxByteTimeStamp
{
  return self->_firstTxByteTimeStamp;
}

- (void)setFirstTxByteTimeStamp:(id)a3
{
}

- (double)firstTxByteDelay
{
  return self->_firstTxByteDelay;
}

- (void)setFirstTxByteDelay:(double)a3
{
  self->_firstTxByteDelay = a3;
}

- (double)connectionDelay
{
  return self->_connectionDelay;
}

- (void)setConnectionDelay:(double)a3
{
  self->_connectionDelay = a3;
}

- (BOOL)TFOSucceeded
{
  return self->_TFOSucceeded;
}

- (void)setTFOSucceeded:(BOOL)a3
{
  self->_TFOSucceeded = a3;
}

- (int64_t)IPType
{
  return self->_IPType;
}

- (void)setIPType:(int64_t)a3
{
  self->_IPType = a3;
}

- (int64_t)interfaceType
{
  return self->_interfaceType;
}

- (void)setInterfaceType:(int64_t)a3
{
  self->_interfaceType = a3;
}

- (unint64_t)minimumRTT
{
  return self->_minimumRTT;
}

- (void)setMinimumRTT:(unint64_t)a3
{
  self->_minimumRTT = a3;
}

- (double)timeIntervalSinceLastUsage
{
  return self->_timeIntervalSinceLastUsage;
}

- (void)setTimeIntervalSinceLastUsage:(double)a3
{
  self->_timeIntervalSinceLastUsage = a3;
}

- (double)timeToFirstByte
{
  return self->_timeToFirstByte;
}

- (void)setTimeToFirstByte:(double)a3
{
  self->_timeToFirstByte = a3;
}

- (int64_t)tunnelConnectionError
{
  return self->_tunnelConnectionError;
}

- (void)setTunnelConnectionError:(int64_t)a3
{
  self->_tunnelConnectionError = a3;
}

- (BOOL)isTFOProbeSucceeded
{
  return self->_isTFOProbeSucceeded;
}

- (void)setIsTFOProbeSucceeded:(BOOL)a3
{
  self->_isTFOProbeSucceeded = a3;
}

- (unint64_t)initialBytesLeftOver
{
  return self->_initialBytesLeftOver;
}

- (void)setInitialBytesLeftOver:(unint64_t)a3
{
  self->_initialBytesLeftOver = a3;
}

- (NSDictionary)exceptions
{
  return self->_exceptions;
}

- (void)setExceptions:(id)a3
{
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setInterfaceName:(id)a3
{
}

- (NSArray)timingIntervals
{
  return self->_timingIntervals;
}

- (void)setTimingIntervals:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timingIntervals, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_exceptions, 0);
  objc_storeStrong((id *)&self->_firstTxByteTimeStamp, 0);
  objc_storeStrong((id *)&self->_TCPInfo, 0);
  objc_storeStrong((id *)&self->_multipathSubflowSwitchCounts, 0);
  objc_storeStrong((id *)&self->_edgeAddress, 0);
}

@end