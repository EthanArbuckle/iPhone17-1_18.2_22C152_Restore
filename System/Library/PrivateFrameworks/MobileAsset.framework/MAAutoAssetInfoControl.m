@interface MAAutoAssetInfoControl
+ (BOOL)supportsSecureCoding;
+ (id)nameOfSimulateEnd:(int64_t)a3;
+ (id)nameOfSimulateOperation:(int64_t)a3;
- (BOOL)clearingAfter;
- (BOOL)forceUnlock;
- (MAAutoAssetInfoControl)initWithCoder:(id)a3;
- (MAAutoAssetInfoControl)initWithVolumeToReclaim:(id)a3 withUrgency:(int)a4 targetingPurgeAmount:(int64_t)a5;
- (NSArray)limitedToAssetTypes;
- (NSString)volumeToReclaim;
- (id)initClearingAfter:(BOOL)a3;
- (id)initClearingAfter:(BOOL)a3 forcingUnlock:(BOOL)a4 limitedToAssetTypes:(id)a5 withVolumeToReclaim:(id)a6 withUrgency:(int)a7 targetingPurgeAmount:(int64_t)a8 simulateOperation:(int64_t)a9 simulateEnd:(int64_t)a10;
- (id)initClearingAfter:(BOOL)a3 limitedToAssetTypes:(id)a4;
- (id)initForSimulateOperation:(int64_t)a3 withSimulateEnd:(int64_t)a4;
- (id)initForcingUnlock:(BOOL)a3;
- (id)summary;
- (int)cacheDeleteUrgency;
- (int64_t)simulateEnd;
- (int64_t)simulateOperation;
- (int64_t)targetingPurgeAmount;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MAAutoAssetInfoControl

- (id)initClearingAfter:(BOOL)a3
{
  return [(MAAutoAssetInfoControl *)self initClearingAfter:a3 forcingUnlock:0 limitedToAssetTypes:0 withVolumeToReclaim:0 withUrgency:0 targetingPurgeAmount:0 simulateOperation:0 simulateEnd:0];
}

- (id)initClearingAfter:(BOOL)a3 limitedToAssetTypes:(id)a4
{
  return [(MAAutoAssetInfoControl *)self initClearingAfter:a3 forcingUnlock:0 limitedToAssetTypes:a4 withVolumeToReclaim:0 withUrgency:0 targetingPurgeAmount:0 simulateOperation:0 simulateEnd:0];
}

- (id)initForcingUnlock:(BOOL)a3
{
  return [(MAAutoAssetInfoControl *)self initClearingAfter:0 forcingUnlock:a3 limitedToAssetTypes:0 withVolumeToReclaim:0 withUrgency:0 targetingPurgeAmount:0 simulateOperation:0 simulateEnd:0];
}

- (MAAutoAssetInfoControl)initWithVolumeToReclaim:(id)a3 withUrgency:(int)a4 targetingPurgeAmount:(int64_t)a5
{
  return (MAAutoAssetInfoControl *)[(MAAutoAssetInfoControl *)self initClearingAfter:0 forcingUnlock:0 limitedToAssetTypes:0 withVolumeToReclaim:a3 withUrgency:*(void *)&a4 targetingPurgeAmount:a5 simulateOperation:0 simulateEnd:0];
}

- (id)initForSimulateOperation:(int64_t)a3 withSimulateEnd:(int64_t)a4
{
  return [(MAAutoAssetInfoControl *)self initClearingAfter:0 forcingUnlock:0 limitedToAssetTypes:0 withVolumeToReclaim:0 withUrgency:0 targetingPurgeAmount:0 simulateOperation:a3 simulateEnd:a4];
}

- (id)initClearingAfter:(BOOL)a3 forcingUnlock:(BOOL)a4 limitedToAssetTypes:(id)a5 withVolumeToReclaim:(id)a6 withUrgency:(int)a7 targetingPurgeAmount:(int64_t)a8 simulateOperation:(int64_t)a9 simulateEnd:(int64_t)a10
{
  id v17 = a5;
  id v18 = a6;
  v22.receiver = self;
  v22.super_class = (Class)MAAutoAssetInfoControl;
  v19 = [(MAAutoAssetInfoControl *)&v22 init];
  v20 = v19;
  if (v19)
  {
    v19->_clearingAfter = a3;
    v19->_forceUnlock = a4;
    objc_storeStrong((id *)&v19->_limitedToAssetTypes, a5);
    objc_storeStrong((id *)&v20->_volumeToReclaim, a6);
    v20->_cacheDeleteUrgency = a7;
    v20->_targetingPurgeAmount = a8;
    v20->_simulateOperation = a9;
    v20->_simulateEnd = a10;
  }

  return v20;
}

- (MAAutoAssetInfoControl)initWithCoder:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MAAutoAssetInfoControl;
  v5 = [(MAAutoAssetInfoControl *)&v14 init];
  if (v5)
  {
    v5->_clearingAfter = [v4 decodeBoolForKey:@"clearingAfter"];
    v5->_forceUnlock = [v4 decodeBoolForKey:@"forceUnlock"];
    id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
    v8 = (void *)[v6 initWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"limitedToAssetTypes"];
    limitedToAssetTypes = v5->_limitedToAssetTypes;
    v5->_limitedToAssetTypes = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"volumeToReclaim"];
    volumeToReclaim = v5->_volumeToReclaim;
    v5->_volumeToReclaim = (NSString *)v11;

    v5->_cacheDeleteUrgency = [v4 decodeIntegerForKey:@"cacheDeleteUrgency"];
    v5->_targetingPurgeAmount = [v4 decodeInt64ForKey:@"targetingPurgeAmount"];
    v5->_simulateOperation = (int)[v4 decodeIntegerForKey:@"simulateOperation"];
    v5->_simulateEnd = (int)[v4 decodeIntegerForKey:@"simulateEnd"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  objc_msgSend(v6, "encodeBool:forKey:", -[MAAutoAssetInfoControl clearingAfter](self, "clearingAfter"), @"clearingAfter");
  objc_msgSend(v6, "encodeBool:forKey:", -[MAAutoAssetInfoControl forceUnlock](self, "forceUnlock"), @"forceUnlock");
  id v4 = [(MAAutoAssetInfoControl *)self limitedToAssetTypes];
  [v6 encodeObject:v4 forKey:@"limitedToAssetTypes"];

  v5 = [(MAAutoAssetInfoControl *)self volumeToReclaim];
  [v6 encodeObject:v5 forKey:@"volumeToReclaim"];

  objc_msgSend(v6, "encodeInteger:forKey:", -[MAAutoAssetInfoControl cacheDeleteUrgency](self, "cacheDeleteUrgency"), @"cacheDeleteUrgency");
  objc_msgSend(v6, "encodeInt64:forKey:", -[MAAutoAssetInfoControl targetingPurgeAmount](self, "targetingPurgeAmount"), @"targetingPurgeAmount");
  objc_msgSend(v6, "encodeInteger:forKey:", -[MAAutoAssetInfoControl simulateOperation](self, "simulateOperation"), @"simulateOperation");
  objc_msgSend(v6, "encodeInteger:forKey:", -[MAAutoAssetInfoControl simulateEnd](self, "simulateEnd"), @"simulateEnd");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)summary
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = [(MAAutoAssetInfoControl *)self limitedToAssetTypes];

  id v4 = @"N";
  if (v3)
  {
    v5 = (__CFString *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:0];
    [(__CFString *)v5 appendString:@"["];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v6 = [(MAAutoAssetInfoControl *)self limitedToAssetTypes];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v23;
      v10 = &stru_1F0A75970;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(v6);
          }
          [(__CFString *)v5 appendFormat:@"%@%@", v10, *(void *)(*((void *)&v22 + 1) + 8 * i)];
          v10 = @",";
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
        v10 = @",";
      }
      while (v8);
    }

    [(__CFString *)v5 appendString:@"]"];
  }
  else
  {
    v5 = @"N";
  }
  v21 = NSString;
  if ([(MAAutoAssetInfoControl *)self clearingAfter]) {
    v12 = @"Y";
  }
  else {
    v12 = @"N";
  }
  if ([(MAAutoAssetInfoControl *)self forceUnlock]) {
    v13 = @"Y";
  }
  else {
    v13 = @"N";
  }
  objc_super v14 = [(MAAutoAssetInfoControl *)self volumeToReclaim];
  if (v14)
  {
    id v4 = [(MAAutoAssetInfoControl *)self volumeToReclaim];
  }
  uint64_t v15 = [(MAAutoAssetInfoControl *)self cacheDeleteUrgency];
  int64_t v16 = [(MAAutoAssetInfoControl *)self targetingPurgeAmount];
  id v17 = +[MAAutoAssetInfoControl nameOfSimulateOperation:[(MAAutoAssetInfoControl *)self simulateOperation]];
  id v18 = +[MAAutoAssetInfoControl nameOfSimulateEnd:[(MAAutoAssetInfoControl *)self simulateEnd]];
  v19 = [v21 stringWithFormat:@"clearingAfter:%@, forceUnlock:%@, limitedToAssetTypes:%@, volumeToReclaim:%@, cacheDeleteUrgency:%d, targetingPurgeAmount:%lld, simulateOperation:%@, simulateEnd:%@", v12, v13, v5, v4, v15, v16, v17, v18];

  if (v14) {
  return v19;
  }
}

+ (id)nameOfSimulateOperation:(int64_t)a3
{
  if ((unint64_t)a3 > 9) {
    return @"UNKNOWN";
  }
  else {
    return off_1E6005308[a3];
  }
}

+ (id)nameOfSimulateEnd:(int64_t)a3
{
  v3 = @"UNKNOWN";
  if (a3 == 1) {
    v3 = @"CLIENT_REQUEST";
  }
  if (a3) {
    return v3;
  }
  else {
    return @"NONE";
  }
}

- (BOOL)clearingAfter
{
  return self->_clearingAfter;
}

- (BOOL)forceUnlock
{
  return self->_forceUnlock;
}

- (NSArray)limitedToAssetTypes
{
  return self->_limitedToAssetTypes;
}

- (NSString)volumeToReclaim
{
  return self->_volumeToReclaim;
}

- (int)cacheDeleteUrgency
{
  return self->_cacheDeleteUrgency;
}

- (int64_t)targetingPurgeAmount
{
  return self->_targetingPurgeAmount;
}

- (int64_t)simulateOperation
{
  return self->_simulateOperation;
}

- (int64_t)simulateEnd
{
  return self->_simulateEnd;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volumeToReclaim, 0);
  objc_storeStrong((id *)&self->_limitedToAssetTypes, 0);
}

@end