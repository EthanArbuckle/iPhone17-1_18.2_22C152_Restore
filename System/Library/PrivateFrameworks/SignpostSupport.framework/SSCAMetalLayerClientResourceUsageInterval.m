@interface SSCAMetalLayerClientResourceUsageInterval
- (BOOL)_hasMemoryLimitHeadroom;
- (BOOL)isEqual:(id)a3;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSNumber)deltaMemoryLimitHeadroomMiB;
- (NSString)debugDescription;
- (SSCAMetalLayerClientResourceUsageInterval)initWithStartSnapshot:(id)a3 endSnapshot:(id)a4;
- (SSCAMetalLayerClientResourceUsageSnapshot)endSnapshot;
- (SSCAMetalLayerClientResourceUsageSnapshot)startSnapshot;
- (double)deltaPeakPhysicalFootprintMiB;
- (double)deltaPhysicalFootprintMiB;
- (double)diskLogicalWritesMiB;
- (double)diskLogicalWritesMiBPerSec;
- (double)diskReadsMiB;
- (double)diskReadsMiBPerSec;
- (double)diskWritesMiB;
- (double)diskWritesMiBPerSec;
- (double)durationMs;
- (double)endMs;
- (double)endSeconds;
- (double)instructionCountPerSec;
- (double)pCoreInstructionCountPerSec;
- (double)peakPhysicalFootprintMiB;
- (double)startMs;
- (double)startSeconds;
- (double)timebaseRatio;
- (float)durationSeconds;
- (id)dictionaryRepresentation;
- (id)jsonDescription:(unint64_t)a3;
- (unint64_t)durationMachContinuousTime;
- (unint64_t)durationNanoseconds;
- (unint64_t)endMachContinuousTime;
- (unint64_t)endNanoseconds;
- (unint64_t)instructionCount;
- (unint64_t)pCoreInstructionCount;
- (unint64_t)startMachContinuousTime;
- (unint64_t)startNanoseconds;
@end

@implementation SSCAMetalLayerClientResourceUsageInterval

- (SSCAMetalLayerClientResourceUsageInterval)initWithStartSnapshot:(id)a3 endSnapshot:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  v10 = 0;
  if (v7 && v8)
  {
    unint64_t v11 = [v7 snapshotMCT];
    if (v11 >= [v9 snapshotMCT])
    {
      v10 = 0;
    }
    else
    {
      v15.receiver = self;
      v15.super_class = (Class)SSCAMetalLayerClientResourceUsageInterval;
      v12 = [(SSCAMetalLayerClientResourceUsageInterval *)&v15 init];
      p_isa = (id *)&v12->super.isa;
      if (v12)
      {
        objc_storeStrong((id *)&v12->_startSnapshot, a3);
        objc_storeStrong(p_isa + 2, a4);
      }
      self = p_isa;
      v10 = self;
    }
  }

  return v10;
}

- (double)diskReadsMiB
{
  v3 = [(SSCAMetalLayerClientResourceUsageInterval *)self endSnapshot];
  [v3 totalDiskReadsMiB];
  double v5 = v4;
  v6 = [(SSCAMetalLayerClientResourceUsageInterval *)self startSnapshot];
  [v6 totalDiskReadsMiB];
  double v8 = v5 - v7;

  return v8;
}

- (double)diskReadsMiBPerSec
{
  v3 = [(SSCAMetalLayerClientResourceUsageInterval *)self endSnapshot];
  [v3 totalDiskReadsMiB];
  double v5 = v4;
  v6 = [(SSCAMetalLayerClientResourceUsageInterval *)self startSnapshot];
  [v6 totalDiskReadsMiB];
  double v8 = v5 - v7;
  [(SSCAMetalLayerClientResourceUsageInterval *)self durationSeconds];
  double v10 = v8 / v9;

  return v10;
}

- (double)diskWritesMiB
{
  v3 = [(SSCAMetalLayerClientResourceUsageInterval *)self endSnapshot];
  [v3 totalDiskWritesMiB];
  double v5 = v4;
  v6 = [(SSCAMetalLayerClientResourceUsageInterval *)self startSnapshot];
  [v6 totalDiskWritesMiB];
  double v8 = v5 - v7;

  return v8;
}

- (double)diskWritesMiBPerSec
{
  v3 = [(SSCAMetalLayerClientResourceUsageInterval *)self endSnapshot];
  [v3 totalDiskWritesMiB];
  double v5 = v4;
  v6 = [(SSCAMetalLayerClientResourceUsageInterval *)self startSnapshot];
  [v6 totalDiskWritesMiB];
  double v8 = v5 - v7;
  [(SSCAMetalLayerClientResourceUsageInterval *)self durationSeconds];
  double v10 = v8 / v9;

  return v10;
}

- (double)diskLogicalWritesMiB
{
  v3 = [(SSCAMetalLayerClientResourceUsageInterval *)self endSnapshot];
  [v3 totalDiskLogicalWritesMiB];
  double v5 = v4;
  v6 = [(SSCAMetalLayerClientResourceUsageInterval *)self startSnapshot];
  [v6 totalDiskLogicalWritesMiB];
  double v8 = v5 - v7;

  return v8;
}

- (double)diskLogicalWritesMiBPerSec
{
  v3 = [(SSCAMetalLayerClientResourceUsageInterval *)self endSnapshot];
  [v3 totalDiskLogicalWritesMiB];
  double v5 = v4;
  v6 = [(SSCAMetalLayerClientResourceUsageInterval *)self startSnapshot];
  [v6 totalDiskLogicalWritesMiB];
  double v8 = v5 - v7;
  [(SSCAMetalLayerClientResourceUsageInterval *)self durationSeconds];
  double v10 = v8 / v9;

  return v10;
}

- (unint64_t)instructionCount
{
  v3 = [(SSCAMetalLayerClientResourceUsageInterval *)self endSnapshot];
  uint64_t v4 = [v3 totalInstructionCount];
  double v5 = [(SSCAMetalLayerClientResourceUsageInterval *)self startSnapshot];
  unint64_t v6 = v4 - [v5 totalInstructionCount];

  return v6;
}

- (double)instructionCountPerSec
{
  v3 = [(SSCAMetalLayerClientResourceUsageInterval *)self endSnapshot];
  uint64_t v4 = [v3 totalInstructionCount];
  double v5 = [(SSCAMetalLayerClientResourceUsageInterval *)self startSnapshot];
  double v6 = (double)(unint64_t)(v4 - [v5 totalInstructionCount]);
  [(SSCAMetalLayerClientResourceUsageInterval *)self durationSeconds];
  double v8 = v6 / v7;

  return v8;
}

- (unint64_t)pCoreInstructionCount
{
  v3 = [(SSCAMetalLayerClientResourceUsageInterval *)self endSnapshot];
  uint64_t v4 = [v3 totalPcoreInstructionCount];
  double v5 = [(SSCAMetalLayerClientResourceUsageInterval *)self startSnapshot];
  unint64_t v6 = v4 - [v5 totalPcoreInstructionCount];

  return v6;
}

- (double)pCoreInstructionCountPerSec
{
  v3 = [(SSCAMetalLayerClientResourceUsageInterval *)self endSnapshot];
  uint64_t v4 = [v3 totalPcoreInstructionCount];
  double v5 = [(SSCAMetalLayerClientResourceUsageInterval *)self startSnapshot];
  double v6 = (double)(unint64_t)(v4 - [v5 totalPcoreInstructionCount]);
  [(SSCAMetalLayerClientResourceUsageInterval *)self durationSeconds];
  double v8 = v6 / v7;

  return v8;
}

- (double)deltaPhysicalFootprintMiB
{
  v3 = [(SSCAMetalLayerClientResourceUsageInterval *)self endSnapshot];
  [v3 physicalFootprintMiB];
  double v5 = v4;
  double v6 = [(SSCAMetalLayerClientResourceUsageInterval *)self startSnapshot];
  [v6 physicalFootprintMiB];
  double v8 = v5 - v7;

  return v8;
}

- (double)peakPhysicalFootprintMiB
{
  v2 = [(SSCAMetalLayerClientResourceUsageInterval *)self endSnapshot];
  [v2 peakPhysicalFootprintMiB];
  double v4 = v3;

  return v4;
}

- (BOOL)_hasMemoryLimitHeadroom
{
  double v3 = [(SSCAMetalLayerClientResourceUsageInterval *)self startSnapshot];
  double v4 = [v3 memoryLimitHeadroomMiB];
  if (v4)
  {
    double v5 = [(SSCAMetalLayerClientResourceUsageInterval *)self endSnapshot];
    double v6 = [v5 memoryLimitHeadroomMiB];
    BOOL v7 = v6 != 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (NSNumber)deltaMemoryLimitHeadroomMiB
{
  if ([(SSCAMetalLayerClientResourceUsageInterval *)self _hasMemoryLimitHeadroom])
  {
    double v3 = NSNumber;
    double v4 = [(SSCAMetalLayerClientResourceUsageInterval *)self endSnapshot];
    double v5 = [v4 memoryLimitHeadroomMiB];
    [v5 doubleValue];
    double v7 = v6;
    double v8 = [(SSCAMetalLayerClientResourceUsageInterval *)self startSnapshot];
    float v9 = [v8 memoryLimitHeadroomMiB];
    [v9 doubleValue];
    unint64_t v11 = [v3 numberWithDouble:v7 - v10];
  }
  else
  {
    unint64_t v11 = 0;
  }

  return (NSNumber *)v11;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (SSCAMetalLayerClientResourceUsageInterval *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v5 = v4;
      double v6 = [(SSCAMetalLayerClientResourceUsageInterval *)self startSnapshot];
      double v7 = [(SSCAMetalLayerClientResourceUsageInterval *)v5 startSnapshot];
      if ([v6 isEqual:v7])
      {
        double v8 = [(SSCAMetalLayerClientResourceUsageInterval *)self endSnapshot];
        float v9 = [(SSCAMetalLayerClientResourceUsageInterval *)v5 endSnapshot];
        char v10 = [v8 isEqual:v9];
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (double)timebaseRatio
{
  v2 = [(SSCAMetalLayerClientResourceUsageInterval *)self startSnapshot];
  [v2 timebaseRatio];
  double v4 = v3;

  return v4;
}

- (NSDate)startDate
{
  v2 = [(SSCAMetalLayerClientResourceUsageInterval *)self startSnapshot];
  double v3 = [v2 snapshotDate];

  return (NSDate *)v3;
}

- (NSDate)endDate
{
  v2 = [(SSCAMetalLayerClientResourceUsageInterval *)self endSnapshot];
  double v3 = [v2 snapshotDate];

  return (NSDate *)v3;
}

- (unint64_t)startMachContinuousTime
{
  v2 = [(SSCAMetalLayerClientResourceUsageInterval *)self startSnapshot];
  unint64_t v3 = [v2 snapshotMCT];

  return v3;
}

- (unint64_t)endMachContinuousTime
{
  v2 = [(SSCAMetalLayerClientResourceUsageInterval *)self endSnapshot];
  unint64_t v3 = [v2 snapshotMCT];

  return v3;
}

- (double)startSeconds
{
  unint64_t v3 = [(SSCAMetalLayerClientResourceUsageInterval *)self startMachContinuousTime];
  [(SSCAMetalLayerClientResourceUsageInterval *)self timebaseRatio];
  return v4 * (double)v3 / 1000000000.0;
}

- (double)endSeconds
{
  unint64_t v3 = [(SSCAMetalLayerClientResourceUsageInterval *)self endMachContinuousTime];
  [(SSCAMetalLayerClientResourceUsageInterval *)self timebaseRatio];
  return v4 * (double)v3 / 1000000000.0;
}

- (unint64_t)durationMachContinuousTime
{
  unint64_t v3 = [(SSCAMetalLayerClientResourceUsageInterval *)self endMachContinuousTime];
  return v3 - [(SSCAMetalLayerClientResourceUsageInterval *)self startMachContinuousTime];
}

- (float)durationSeconds
{
  [(SSCAMetalLayerClientResourceUsageInterval *)self endSeconds];
  double v4 = v3;
  [(SSCAMetalLayerClientResourceUsageInterval *)self startSeconds];
  return v4 - v5;
}

- (unint64_t)startNanoseconds
{
  [(SSCAMetalLayerClientResourceUsageInterval *)self startSeconds];
  return (unint64_t)(v2 * 1000000000.0);
}

- (unint64_t)endNanoseconds
{
  [(SSCAMetalLayerClientResourceUsageInterval *)self endSeconds];
  return (unint64_t)(v2 * 1000000000.0);
}

- (unint64_t)durationNanoseconds
{
  [(SSCAMetalLayerClientResourceUsageInterval *)self durationSeconds];
  return (unint64_t)(float)(v2 * 1000000000.0);
}

- (double)startMs
{
  [(SSCAMetalLayerClientResourceUsageInterval *)self startSeconds];
  return v2 * 1000.0;
}

- (double)endMs
{
  [(SSCAMetalLayerClientResourceUsageInterval *)self endSeconds];
  return v2 * 1000.0;
}

- (double)durationMs
{
  [(SSCAMetalLayerClientResourceUsageInterval *)self durationSeconds];
  return (float)(v2 * 1000.0);
}

- (id)dictionaryRepresentation
{
  double v3 = _timeIntervalDict(self);
  double v4 = NSNumber;
  double v5 = [(SSCAMetalLayerClientResourceUsageInterval *)self startSnapshot];
  [v5 physicalFootprintMiB];
  double v6 = objc_msgSend(v4, "numberWithDouble:");
  [v3 setObject:v6 forKeyedSubscript:kSSCAMetalLayerClientResourceUsageIntervalKey_StartPhysicalFootprintMiB];

  double v7 = NSNumber;
  double v8 = [(SSCAMetalLayerClientResourceUsageInterval *)self endSnapshot];
  [v8 physicalFootprintMiB];
  float v9 = objc_msgSend(v7, "numberWithDouble:");
  [v3 setObject:v9 forKeyedSubscript:kSSCAMetalLayerClientResourceUsageIntervalKey_EndPhysicalFootprintMiB];

  char v10 = NSNumber;
  [(SSCAMetalLayerClientResourceUsageInterval *)self deltaPhysicalFootprintMiB];
  unint64_t v11 = objc_msgSend(v10, "numberWithDouble:");
  [v3 setObject:v11 forKeyedSubscript:kSSCAMetalLayerClientResourceUsageIntervalKey_DeltaPhysicalFootprintMiB];

  v12 = NSNumber;
  [(SSCAMetalLayerClientResourceUsageInterval *)self peakPhysicalFootprintMiB];
  v13 = objc_msgSend(v12, "numberWithDouble:");
  [v3 setObject:v13 forKeyedSubscript:kSSCAMetalLayerClientResourceUsageIntervalKey_PeakPhysicalFootprintMiB];

  v14 = NSNumber;
  [(SSCAMetalLayerClientResourceUsageInterval *)self deltaPeakPhysicalFootprintMiB];
  objc_super v15 = objc_msgSend(v14, "numberWithDouble:");
  [v3 setObject:v15 forKeyedSubscript:kSSCAMetalLayerClientResourceUsageIntervalKey_DeltaPeakPhysicalFootprintMiB];

  v16 = NSNumber;
  [(SSCAMetalLayerClientResourceUsageInterval *)self diskReadsMiB];
  v17 = objc_msgSend(v16, "numberWithDouble:");
  [v3 setObject:v17 forKeyedSubscript:kSSCAMetalLayerClientResourceUsageIntervalKey_DiskReadsMiB];

  v18 = NSNumber;
  [(SSCAMetalLayerClientResourceUsageInterval *)self diskReadsMiBPerSec];
  v19 = objc_msgSend(v18, "numberWithDouble:");
  [v3 setObject:v19 forKeyedSubscript:kSSCAMetalLayerClientResourceUsageIntervalKey_DiskReadsMiBPerSec];

  v20 = NSNumber;
  [(SSCAMetalLayerClientResourceUsageInterval *)self diskWritesMiB];
  v21 = objc_msgSend(v20, "numberWithDouble:");
  [v3 setObject:v21 forKeyedSubscript:kSSCAMetalLayerClientResourceUsageIntervalKey_DiskWritesMiB];

  v22 = NSNumber;
  [(SSCAMetalLayerClientResourceUsageInterval *)self diskWritesMiBPerSec];
  v23 = objc_msgSend(v22, "numberWithDouble:");
  [v3 setObject:v23 forKeyedSubscript:kSSCAMetalLayerClientResourceUsageIntervalKey_DiskWritesMiBPerSec];

  v24 = NSNumber;
  [(SSCAMetalLayerClientResourceUsageInterval *)self diskLogicalWritesMiB];
  v25 = objc_msgSend(v24, "numberWithDouble:");
  [v3 setObject:v25 forKeyedSubscript:kSSCAMetalLayerClientResourceUsageIntervalKey_DiskLogicalWritesMiB];

  v26 = NSNumber;
  [(SSCAMetalLayerClientResourceUsageInterval *)self diskLogicalWritesMiBPerSec];
  v27 = objc_msgSend(v26, "numberWithDouble:");
  [v3 setObject:v27 forKeyedSubscript:kSSCAMetalLayerClientResourceUsageIntervalKey_DiskLogicalWritesMiBPerSec];

  v28 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SSCAMetalLayerClientResourceUsageInterval instructionCount](self, "instructionCount"));
  [v3 setObject:v28 forKeyedSubscript:kSSCAMetalLayerClientResourceUsageIntervalKey_InstructionCount];

  v29 = NSNumber;
  [(SSCAMetalLayerClientResourceUsageInterval *)self instructionCountPerSec];
  v30 = objc_msgSend(v29, "numberWithDouble:");
  [v3 setObject:v30 forKeyedSubscript:kSSCAMetalLayerClientResourceUsageIntervalKey_InstructionsPerSec];

  v31 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SSCAMetalLayerClientResourceUsageInterval pCoreInstructionCount](self, "pCoreInstructionCount"));
  [v3 setObject:v31 forKeyedSubscript:kSSCAMetalLayerClientResourceUsageIntervalKey_PCoreInstructionCount];

  v32 = NSNumber;
  [(SSCAMetalLayerClientResourceUsageInterval *)self pCoreInstructionCountPerSec];
  v33 = objc_msgSend(v32, "numberWithDouble:");
  [v3 setObject:v33 forKeyedSubscript:kSSCAMetalLayerClientResourceUsageIntervalKey_PCoreInstructionsPerSec];

  if ([(SSCAMetalLayerClientResourceUsageInterval *)self _hasMemoryLimitHeadroom])
  {
    v34 = [(SSCAMetalLayerClientResourceUsageInterval *)self startSnapshot];
    v35 = [v34 memoryLimitHeadroomMiB];
    [v3 setObject:v35 forKeyedSubscript:kSSCAMetalLayerClientResourceUsageIntervalKey_StartMemoryLimitHeadroomMiB];

    v36 = [(SSCAMetalLayerClientResourceUsageInterval *)self endSnapshot];
    v37 = [v36 memoryLimitHeadroomMiB];
    [v3 setObject:v37 forKeyedSubscript:kSSCAMetalLayerClientResourceUsageIntervalKey_StartMemoryLimitHeadroomMiB];

    v38 = [(SSCAMetalLayerClientResourceUsageInterval *)self deltaMemoryLimitHeadroomMiB];
    [v3 setObject:v38 forKeyedSubscript:kSSCAMetalLayerClientResourceUsageIntervalKey_DeltaMemoryLimitHeadroomMiB];
  }

  return v3;
}

- (id)jsonDescription:(unint64_t)a3
{
  return SignpostJSONRepresentation(self, a3);
}

- (NSString)debugDescription
{
  return (NSString *)[(SSCAMetalLayerClientResourceUsageInterval *)self jsonDescription:3];
}

- (SSCAMetalLayerClientResourceUsageSnapshot)startSnapshot
{
  return self->_startSnapshot;
}

- (SSCAMetalLayerClientResourceUsageSnapshot)endSnapshot
{
  return self->_endSnapshot;
}

- (double)deltaPeakPhysicalFootprintMiB
{
  return self->_deltaPeakPhysicalFootprintMiB;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endSnapshot, 0);

  objc_storeStrong((id *)&self->_startSnapshot, 0);
}

@end