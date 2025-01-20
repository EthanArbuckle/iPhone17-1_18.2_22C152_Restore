@interface SSCAMetalLayerClientResourceUsageSummary
- (NSNumber)averageMemoryLimitHeadroomMiB;
- (NSString)debugDescription;
- (SSCAMetalLayerClientResourceUsageSummary)initWithIntervals:(id)a3;
- (double)averagePhysicalFootprintMiB;
- (double)diskLogicalWritesMiB;
- (double)diskLogicalWritesMiBPerSec;
- (double)diskReadsMiB;
- (double)diskReadsMiBPerSec;
- (double)diskWritesMiB;
- (double)diskWritesMiBPerSec;
- (double)instructionCountPerSec;
- (double)pCoreInstructionCountPerSec;
- (double)peakPhysicalFootprintMiB;
- (double)totalDurationSeconds;
- (id)dictionaryRepresentation;
- (id)jsonDescription:(unint64_t)a3;
- (unint64_t)instructionCount;
- (unint64_t)pCoreInstructionCount;
@end

@implementation SSCAMetalLayerClientResourceUsageSummary

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = NSNumber;
  [(SSCAMetalLayerClientResourceUsageSummary *)self peakPhysicalFootprintMiB];
  v5 = objc_msgSend(v4, "numberWithDouble:");
  [v3 setObject:v5 forKeyedSubscript:kSSCAMetalLayerClientResourceUsageSummaryKey_PeakPhysicalFootprintMiB];

  v6 = NSNumber;
  [(SSCAMetalLayerClientResourceUsageSummary *)self averagePhysicalFootprintMiB];
  v7 = objc_msgSend(v6, "numberWithDouble:");
  [v3 setObject:v7 forKeyedSubscript:kSSCAMetalLayerClientResourceUsageSummaryKey_AveragePhysicalFootprintMiB];

  v8 = NSNumber;
  [(SSCAMetalLayerClientResourceUsageSummary *)self totalDurationSeconds];
  v9 = objc_msgSend(v8, "numberWithDouble:");
  [v3 setObject:v9 forKeyedSubscript:kSSCAMetalLayerClientResourceUsageSummaryKey_TotalDurationSeconds];

  v10 = NSNumber;
  [(SSCAMetalLayerClientResourceUsageSummary *)self diskReadsMiB];
  v11 = objc_msgSend(v10, "numberWithDouble:");
  [v3 setObject:v11 forKeyedSubscript:kSSCAMetalLayerClientResourceUsageSummaryKey_DiskReadsMiB];

  v12 = NSNumber;
  [(SSCAMetalLayerClientResourceUsageSummary *)self diskReadsMiBPerSec];
  v13 = objc_msgSend(v12, "numberWithDouble:");
  [v3 setObject:v13 forKeyedSubscript:kSSCAMetalLayerClientResourceUsageSummaryKey_DiskReadsMiBPerSec];

  v14 = NSNumber;
  [(SSCAMetalLayerClientResourceUsageSummary *)self diskWritesMiB];
  v15 = objc_msgSend(v14, "numberWithDouble:");
  [v3 setObject:v15 forKeyedSubscript:kSSCAMetalLayerClientResourceUsageSummaryKey_DiskWritesMiB];

  v16 = NSNumber;
  [(SSCAMetalLayerClientResourceUsageSummary *)self diskWritesMiBPerSec];
  v17 = objc_msgSend(v16, "numberWithDouble:");
  [v3 setObject:v17 forKeyedSubscript:kSSCAMetalLayerClientResourceUsageSummaryKey_DiskWritesMiBPerSec];

  v18 = NSNumber;
  [(SSCAMetalLayerClientResourceUsageSummary *)self diskLogicalWritesMiB];
  v19 = objc_msgSend(v18, "numberWithDouble:");
  [v3 setObject:v19 forKeyedSubscript:kSSCAMetalLayerClientResourceUsageSummaryKey_DiskLogicalWritesMiB];

  v20 = NSNumber;
  [(SSCAMetalLayerClientResourceUsageSummary *)self diskLogicalWritesMiBPerSec];
  v21 = objc_msgSend(v20, "numberWithDouble:");
  [v3 setObject:v21 forKeyedSubscript:kSSCAMetalLayerClientResourceUsageSummaryKey_DiskLogicalWritesMiBPerSec];

  v22 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SSCAMetalLayerClientResourceUsageSummary instructionCount](self, "instructionCount"));
  [v3 setObject:v22 forKeyedSubscript:kSSCAMetalLayerClientResourceUsageSummaryKey_InstructionCount];

  v23 = NSNumber;
  [(SSCAMetalLayerClientResourceUsageSummary *)self instructionCountPerSec];
  v24 = objc_msgSend(v23, "numberWithDouble:");
  [v3 setObject:v24 forKeyedSubscript:kSSCAMetalLayerClientResourceUsageSummaryKey_InstructionsPerSec];

  v25 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SSCAMetalLayerClientResourceUsageSummary pCoreInstructionCount](self, "pCoreInstructionCount"));
  [v3 setObject:v25 forKeyedSubscript:kSSCAMetalLayerClientResourceUsageSummaryKey_PCoreInstructionCount];

  v26 = NSNumber;
  [(SSCAMetalLayerClientResourceUsageSummary *)self pCoreInstructionCountPerSec];
  v27 = objc_msgSend(v26, "numberWithDouble:");
  [v3 setObject:v27 forKeyedSubscript:kSSCAMetalLayerClientResourceUsageSummaryKey_PCoreInstructionsPerSec];

  v28 = [(SSCAMetalLayerClientResourceUsageSummary *)self averageMemoryLimitHeadroomMiB];

  if (v28)
  {
    v29 = [(SSCAMetalLayerClientResourceUsageSummary *)self averageMemoryLimitHeadroomMiB];
    [v3 setObject:v29 forKeyedSubscript:kSSCAMetalLayerClientResourceUsageSummaryKey_AverageMemoryLimitHeadroomMiB];
  }

  return v3;
}

- (id)jsonDescription:(unint64_t)a3
{
  return SignpostJSONRepresentation(self, a3);
}

- (NSString)debugDescription
{
  return (NSString *)[(SSCAMetalLayerClientResourceUsageSummary *)self jsonDescription:3];
}

- (SSCAMetalLayerClientResourceUsageSummary)initWithIntervals:(id)a3
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v73.receiver = self;
  v73.super_class = (Class)SSCAMetalLayerClientResourceUsageSummary;
  v5 = [(SSCAMetalLayerClientResourceUsageSummary *)&v73 init];
  v6 = v5;
  if (v5)
  {
    v56 = v5;
    v7 = [v4 firstObject];
    v60 = [v7 deltaMemoryLimitHeadroomMiB];

    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id v57 = v4;
    id obj = v4;
    uint64_t v8 = [obj countByEnumeratingWithState:&v69 objects:v74 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      unint64_t v10 = 0;
      unint64_t v11 = 0;
      double v12 = 0.0;
      uint64_t v59 = *(void *)v70;
      double v13 = 0.0;
      double v14 = 0.0;
      double v15 = 0.0;
      double v16 = 0.0;
      double v17 = 0.0;
      double v18 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v70 != v59) {
            objc_enumerationMutation(obj);
          }
          v20 = *(void **)(*((void *)&v69 + 1) + 8 * i);
          [v20 durationSeconds];
          float v68 = v21;
          [v20 diskReadsMiB];
          double v67 = v22;
          [v20 diskWritesMiB];
          double v66 = v23;
          [v20 diskLogicalWritesMiB];
          double v65 = v24;
          uint64_t v25 = [v20 instructionCount];
          uint64_t v26 = [v20 pCoreInstructionCount];
          v27 = [v20 endSnapshot];
          [v27 peakPhysicalFootprintMiB];
          double v29 = v28;

          if (v15 < v29) {
            double v15 = v29;
          }
          [v20 durationSeconds];
          float v64 = v30;
          v31 = [v20 startSnapshot];
          [v31 physicalFootprintMiB];
          double v63 = v32;
          v33 = [v20 endSnapshot];
          [v33 physicalFootprintMiB];
          double v62 = v34;

          if (v60)
          {
            [v20 durationSeconds];
            double v61 = v35;
            v36 = [v20 startSnapshot];
            v37 = [v36 memoryLimitHeadroomMiB];
            [v37 doubleValue];
            double v38 = v17;
            double v39 = v16;
            double v40 = v18;
            double v41 = v13;
            double v42 = v12;
            double v43 = v15;
            double v44 = v14;
            double v46 = v45;
            v47 = [v20 endSnapshot];
            v48 = [v47 memoryLimitHeadroomMiB];
            [v48 doubleValue];
            double v50 = v46 + v49;
            double v51 = v44;
            double v15 = v43;
            double v12 = v42;
            double v13 = v41;
            double v18 = v40;
            double v16 = v39;
            double v17 = v38;
            double v52 = 0.5;
            double v14 = v51 + v50 * v61 * 0.5;
          }
          else
          {
            double v52 = 0.5;
          }
          double v18 = v18 + v68;
          double v17 = v17 + v67;
          double v16 = v16 + v66;
          double v12 = v12 + v65;
          v10 += v25;
          v11 += v26;
          double v13 = v13 + (v63 + v62) * v64 * v52;
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v69 objects:v74 count:16];
      }
      while (v9);
    }
    else
    {
      unint64_t v10 = 0;
      unint64_t v11 = 0;
      double v12 = 0.0;
      double v13 = 0.0;
      double v14 = 0.0;
      double v15 = 0.0;
      double v16 = 0.0;
      double v17 = 0.0;
      double v18 = 0.0;
    }

    v6 = v56;
    id v4 = v57;
    v56->_totalDurationSeconds = v18;
    v56->_diskReadsMiB = v17;
    v56->_diskWritesMiB = v16;
    v56->_diskLogicalWritesMiB = v12;
    v56->_instructionCount = v10;
    v56->_pCoreInstructionCount = v11;
    v56->_peakPhysicalFootprintMiB = v15;
    v56->_averagePhysicalFootprintMiB = v13 / v18;
    if (v60)
    {
      uint64_t v53 = [NSNumber numberWithDouble:v14 / v18];
      averageMemoryLimitHeadroomMiB = v56->_averageMemoryLimitHeadroomMiB;
      v56->_averageMemoryLimitHeadroomMiB = (NSNumber *)v53;
    }
  }

  return v6;
}

- (double)diskReadsMiBPerSec
{
  [(SSCAMetalLayerClientResourceUsageSummary *)self totalDurationSeconds];
  double v4 = v3;
  double result = 0.0;
  if (v4 != 0.0)
  {
    [(SSCAMetalLayerClientResourceUsageSummary *)self diskReadsMiB];
    double v7 = v6;
    [(SSCAMetalLayerClientResourceUsageSummary *)self totalDurationSeconds];
    return v7 / v8;
  }
  return result;
}

- (double)diskWritesMiBPerSec
{
  [(SSCAMetalLayerClientResourceUsageSummary *)self totalDurationSeconds];
  double v4 = v3;
  double result = 0.0;
  if (v4 != 0.0)
  {
    [(SSCAMetalLayerClientResourceUsageSummary *)self diskWritesMiB];
    double v7 = v6;
    [(SSCAMetalLayerClientResourceUsageSummary *)self totalDurationSeconds];
    return v7 / v8;
  }
  return result;
}

- (double)diskLogicalWritesMiBPerSec
{
  [(SSCAMetalLayerClientResourceUsageSummary *)self totalDurationSeconds];
  double v4 = v3;
  double result = 0.0;
  if (v4 != 0.0)
  {
    [(SSCAMetalLayerClientResourceUsageSummary *)self diskLogicalWritesMiB];
    double v7 = v6;
    [(SSCAMetalLayerClientResourceUsageSummary *)self totalDurationSeconds];
    return v7 / v8;
  }
  return result;
}

- (double)instructionCountPerSec
{
  [(SSCAMetalLayerClientResourceUsageSummary *)self totalDurationSeconds];
  double v4 = v3;
  double result = 0.0;
  if (v4 != 0.0)
  {
    double v6 = (double)[(SSCAMetalLayerClientResourceUsageSummary *)self instructionCount];
    [(SSCAMetalLayerClientResourceUsageSummary *)self totalDurationSeconds];
    return v6 / v7;
  }
  return result;
}

- (double)pCoreInstructionCountPerSec
{
  [(SSCAMetalLayerClientResourceUsageSummary *)self totalDurationSeconds];
  double v4 = v3;
  double result = 0.0;
  if (v4 != 0.0)
  {
    double v6 = (double)[(SSCAMetalLayerClientResourceUsageSummary *)self pCoreInstructionCount];
    [(SSCAMetalLayerClientResourceUsageSummary *)self totalDurationSeconds];
    return v6 / v7;
  }
  return result;
}

- (double)peakPhysicalFootprintMiB
{
  return self->_peakPhysicalFootprintMiB;
}

- (double)averagePhysicalFootprintMiB
{
  return self->_averagePhysicalFootprintMiB;
}

- (NSNumber)averageMemoryLimitHeadroomMiB
{
  return self->_averageMemoryLimitHeadroomMiB;
}

- (double)diskReadsMiB
{
  return self->_diskReadsMiB;
}

- (double)diskWritesMiB
{
  return self->_diskWritesMiB;
}

- (double)diskLogicalWritesMiB
{
  return self->_diskLogicalWritesMiB;
}

- (unint64_t)instructionCount
{
  return self->_instructionCount;
}

- (unint64_t)pCoreInstructionCount
{
  return self->_pCoreInstructionCount;
}

- (double)totalDurationSeconds
{
  return self->_totalDurationSeconds;
}

- (void).cxx_destruct
{
}

@end