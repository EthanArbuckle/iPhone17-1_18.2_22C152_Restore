@interface ULWiFiScanStrategy
- (BOOL)doAbortOngoingScan;
- (BOOL)isLowLatency;
- (BOOL)isLowPriority;
- (NSArray)channels;
- (ULWiFiScanStrategy)initWithChannels:(id)a3 scanType:(unint64_t)a4 numberOfScans:(unint64_t)a5 scanIterations:(unint64_t)a6 restTime:(unint64_t)a7 dwellTime:(unint64_t)a8 acceptableCacheAge:(unint64_t)a9 maximumAge:(unint64_t)a10 isLowPriority:(BOOL)a11 isLowLatency:(BOOL)a12 doAbortOngoingScan:(BOOL)a13;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)acceptableCacheAge;
- (unint64_t)dwellTimeMilliSeconds;
- (unint64_t)maximumAge;
- (unint64_t)numberOfScans;
- (unint64_t)restTimeInMilliSeconds;
- (unint64_t)scanIterations;
- (unint64_t)scanType;
- (void)decrementScanIterationsOnWiFiScanComplete;
- (void)setAcceptableCacheAge:(unint64_t)a3;
- (void)setChannels:(id)a3;
- (void)setDoAbortOngoingScan:(BOOL)a3;
- (void)setDwellTimeMilliSeconds:(unint64_t)a3;
- (void)setIsLowLatency:(BOOL)a3;
- (void)setIsLowPriority:(BOOL)a3;
- (void)setMaximumAge:(unint64_t)a3;
- (void)setNumberOfScans:(unint64_t)a3;
- (void)setRestTimeInMilliSeconds:(unint64_t)a3;
- (void)setScanIterations:(unint64_t)a3;
- (void)setScanType:(unint64_t)a3;
@end

@implementation ULWiFiScanStrategy

- (ULWiFiScanStrategy)initWithChannels:(id)a3 scanType:(unint64_t)a4 numberOfScans:(unint64_t)a5 scanIterations:(unint64_t)a6 restTime:(unint64_t)a7 dwellTime:(unint64_t)a8 acceptableCacheAge:(unint64_t)a9 maximumAge:(unint64_t)a10 isLowPriority:(BOOL)a11 isLowLatency:(BOOL)a12 doAbortOngoingScan:(BOOL)a13
{
  id v19 = a3;
  v23.receiver = self;
  v23.super_class = (Class)ULWiFiScanStrategy;
  v20 = [(ULWiFiScanStrategy *)&v23 init];
  v21 = v20;
  if (v20)
  {
    [(ULWiFiScanStrategy *)v20 setChannels:v19];
    [(ULWiFiScanStrategy *)v21 setScanType:a4];
    [(ULWiFiScanStrategy *)v21 setNumberOfScans:a5];
    [(ULWiFiScanStrategy *)v21 setScanIterations:a6];
    [(ULWiFiScanStrategy *)v21 setRestTimeInMilliSeconds:a7];
    [(ULWiFiScanStrategy *)v21 setDwellTimeMilliSeconds:a8];
    [(ULWiFiScanStrategy *)v21 setAcceptableCacheAge:a9];
    [(ULWiFiScanStrategy *)v21 setMaximumAge:a10];
    [(ULWiFiScanStrategy *)v21 setIsLowLatency:a12];
    [(ULWiFiScanStrategy *)v21 setIsLowPriority:a11];
    [(ULWiFiScanStrategy *)v21 setDoAbortOngoingScan:a13];
  }

  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v19 = [ULWiFiScanStrategy alloc];
  v5 = [(ULWiFiScanStrategy *)self channels];
  v6 = (void *)[v5 copyWithZone:a3];
  unint64_t v18 = [(ULWiFiScanStrategy *)self scanType];
  unint64_t v17 = [(ULWiFiScanStrategy *)self numberOfScans];
  unint64_t v7 = [(ULWiFiScanStrategy *)self scanIterations];
  unint64_t v8 = [(ULWiFiScanStrategy *)self restTimeInMilliSeconds];
  unint64_t v9 = [(ULWiFiScanStrategy *)self dwellTimeMilliSeconds];
  unint64_t v10 = [(ULWiFiScanStrategy *)self acceptableCacheAge];
  unint64_t v11 = [(ULWiFiScanStrategy *)self maximumAge];
  BOOL v12 = [(ULWiFiScanStrategy *)self isLowPriority];
  BOOL v13 = [(ULWiFiScanStrategy *)self isLowLatency];
  BYTE2(v16) = [(ULWiFiScanStrategy *)self doAbortOngoingScan];
  BYTE1(v16) = v13;
  LOBYTE(v16) = v12;
  v14 = -[ULWiFiScanStrategy initWithChannels:scanType:numberOfScans:scanIterations:restTime:dwellTime:acceptableCacheAge:maximumAge:isLowPriority:isLowLatency:doAbortOngoingScan:](v19, "initWithChannels:scanType:numberOfScans:scanIterations:restTime:dwellTime:acceptableCacheAge:maximumAge:isLowPriority:isLowLatency:doAbortOngoingScan:", v6, v18, v17, v7, v8, v9, v10, v11, v16);

  return v14;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x263F089D8]);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = (void *)[v3 initWithFormat:@"<%@: ", v5];

  unint64_t v7 = [(ULWiFiScanStrategy *)self channels];
  [v6 appendFormat:@", channels: %@", v7];

  unint64_t v8 = [(ULWiFiScanStrategy *)self scanType];
  unint64_t v9 = @"Invalid";
  if (v8 == 1) {
    unint64_t v9 = @"ScanTypePassive";
  }
  if (!v8) {
    unint64_t v9 = @"ScanTypeActive";
  }
  [v6 appendFormat:@", scanType: %@", v9];
  unint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ULWiFiScanStrategy numberOfScans](self, "numberOfScans"));
  [v6 appendFormat:@", numberOfScans: %@", v10];

  unint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ULWiFiScanStrategy scanIterations](self, "scanIterations"));
  [v6 appendFormat:@", scanIterations: %@", v11];

  BOOL v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ULWiFiScanStrategy restTimeInMilliSeconds](self, "restTimeInMilliSeconds"));
  [v6 appendFormat:@", restTime: %@", v12];

  BOOL v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ULWiFiScanStrategy dwellTimeMilliSeconds](self, "dwellTimeMilliSeconds"));
  [v6 appendFormat:@", dwellTime: %@", v13];

  v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ULWiFiScanStrategy acceptableCacheAge](self, "acceptableCacheAge"));
  [v6 appendFormat:@", acceptableCacheAge: %@", v14];

  v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ULWiFiScanStrategy maximumAge](self, "maximumAge"));
  [v6 appendFormat:@", maximumAge: %@", v15];

  uint64_t v16 = objc_msgSend(NSNumber, "numberWithBool:", -[ULWiFiScanStrategy isLowPriority](self, "isLowPriority"));
  [v6 appendFormat:@", isLowPriority: %@", v16];

  unint64_t v17 = objc_msgSend(NSNumber, "numberWithBool:", -[ULWiFiScanStrategy isLowLatency](self, "isLowLatency"));
  [v6 appendFormat:@", isLowLatency: %@", v17];

  unint64_t v18 = objc_msgSend(NSNumber, "numberWithBool:", -[ULWiFiScanStrategy doAbortOngoingScan](self, "doAbortOngoingScan"));
  [v6 appendFormat:@", doAbortOngoingScan: %@", v18];

  [v6 appendString:@">"];
  return v6;
}

- (void)decrementScanIterationsOnWiFiScanComplete
{
  if ([(ULWiFiScanStrategy *)self scanIterations])
  {
    unint64_t v3 = [(ULWiFiScanStrategy *)self scanIterations] - 1;
    [(ULWiFiScanStrategy *)self setScanIterations:v3];
  }
}

- (NSArray)channels
{
  return self->_channels;
}

- (void)setChannels:(id)a3
{
}

- (unint64_t)scanType
{
  return self->_scanType;
}

- (void)setScanType:(unint64_t)a3
{
  self->_scanType = a3;
}

- (unint64_t)numberOfScans
{
  return self->_numberOfScans;
}

- (void)setNumberOfScans:(unint64_t)a3
{
  self->_numberOfScans = a3;
}

- (unint64_t)scanIterations
{
  return self->_scanIterations;
}

- (void)setScanIterations:(unint64_t)a3
{
  self->_scanIterations = a3;
}

- (BOOL)isLowPriority
{
  return self->_isLowPriority;
}

- (void)setIsLowPriority:(BOOL)a3
{
  self->_isLowPriority = a3;
}

- (BOOL)isLowLatency
{
  return self->_isLowLatency;
}

- (void)setIsLowLatency:(BOOL)a3
{
  self->_isLowLatency = a3;
}

- (BOOL)doAbortOngoingScan
{
  return self->_doAbortOngoingScan;
}

- (void)setDoAbortOngoingScan:(BOOL)a3
{
  self->_doAbortOngoingScan = a3;
}

- (unint64_t)restTimeInMilliSeconds
{
  return self->_restTimeInMilliSeconds;
}

- (void)setRestTimeInMilliSeconds:(unint64_t)a3
{
  self->_restTimeInMilliSeconds = a3;
}

- (unint64_t)dwellTimeMilliSeconds
{
  return self->_dwellTimeMilliSeconds;
}

- (void)setDwellTimeMilliSeconds:(unint64_t)a3
{
  self->_dwellTimeMilliSeconds = a3;
}

- (unint64_t)acceptableCacheAge
{
  return self->_acceptableCacheAge;
}

- (void)setAcceptableCacheAge:(unint64_t)a3
{
  self->_acceptableCacheAge = a3;
}

- (unint64_t)maximumAge
{
  return self->_maximumAge;
}

- (void)setMaximumAge:(unint64_t)a3
{
  self->_maximumAge = a3;
}

- (void).cxx_destruct
{
}

@end