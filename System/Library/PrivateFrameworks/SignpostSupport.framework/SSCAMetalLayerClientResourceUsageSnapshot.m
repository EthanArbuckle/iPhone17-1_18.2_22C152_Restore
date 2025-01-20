@interface SSCAMetalLayerClientResourceUsageSnapshot
+ (id)snapshotFromSignpostEvent:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSDate)snapshotDate;
- (NSNumber)memoryLimitHeadroomMiB;
- (NSString)debugDescription;
- (SSCAMetalLayerClientResourceUsageSnapshot)initWithPhysicalFootprintMiB:(id)a3 peakPhysicalFootprint:(id)a4 totalDiskReads:(id)a5 totalDiskWrites:(id)a6 totalDiskLogicalWrites:(id)a7 totalInstructionCount:(id)a8 totalPcoreInstructionCount:(id)a9 date:(id)a10 mct:(unint64_t)a11 optionalMemoryLimitHeadroom:(id)a12 timebaseRatio:(double)a13;
- (double)peakPhysicalFootprintMiB;
- (double)physicalFootprintMiB;
- (double)timebaseRatio;
- (double)totalDiskLogicalWritesMiB;
- (double)totalDiskReadsMiB;
- (double)totalDiskWritesMiB;
- (id)dictionaryRepresentation;
- (id)jsonDescription:(unint64_t)a3;
- (unint64_t)snapshotMCT;
- (unint64_t)totalInstructionCount;
- (unint64_t)totalPcoreInstructionCount;
@end

@implementation SSCAMetalLayerClientResourceUsageSnapshot

- (id)dictionaryRepresentation
{
  v24[9] = *MEMORY[0x1E4F143B8];
  v23[0] = kSSCAMetalLayerClientResourceUsageSnapshotKey_Date;
  v22 = [(SSCAMetalLayerClientResourceUsageSnapshot *)self snapshotDate];
  v21 = _stringForDate(v22);
  v24[0] = v21;
  v23[1] = kSSCAMetalLayerClientResourceUsageSnapshotKey_MCT;
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SSCAMetalLayerClientResourceUsageSnapshot snapshotMCT](self, "snapshotMCT"));
  v24[1] = v3;
  v23[2] = kSSCAMetalLayerClientResourceUsageSnapshotKey_physicalFootprintMiB;
  v4 = NSNumber;
  [(SSCAMetalLayerClientResourceUsageSnapshot *)self physicalFootprintMiB];
  v5 = objc_msgSend(v4, "numberWithDouble:");
  v24[2] = v5;
  v23[3] = kSSCAMetalLayerClientResourceUsageSnapshotKey_peakPhysicalFootprintMiB;
  v6 = NSNumber;
  [(SSCAMetalLayerClientResourceUsageSnapshot *)self peakPhysicalFootprintMiB];
  v7 = objc_msgSend(v6, "numberWithDouble:");
  v24[3] = v7;
  v23[4] = kSSCAMetalLayerClientResourceUsageSnapshotKey_totalDiskReadsMiB;
  v8 = NSNumber;
  [(SSCAMetalLayerClientResourceUsageSnapshot *)self totalDiskReadsMiB];
  v9 = objc_msgSend(v8, "numberWithDouble:");
  v24[4] = v9;
  v23[5] = kSSCAMetalLayerClientResourceUsageSnapshotKey_totalDiskWritesMiB;
  v10 = NSNumber;
  [(SSCAMetalLayerClientResourceUsageSnapshot *)self totalDiskWritesMiB];
  v11 = objc_msgSend(v10, "numberWithDouble:");
  v24[5] = v11;
  v23[6] = kSSCAMetalLayerClientResourceUsageSnapshotKey_totalDiskLogicalWritesMiB;
  v12 = NSNumber;
  [(SSCAMetalLayerClientResourceUsageSnapshot *)self totalDiskLogicalWritesMiB];
  v13 = objc_msgSend(v12, "numberWithDouble:");
  v24[6] = v13;
  v23[7] = kSSCAMetalLayerClientResourceUsageSnapshotKey_totalInstructionCount;
  v14 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SSCAMetalLayerClientResourceUsageSnapshot totalInstructionCount](self, "totalInstructionCount"));
  v24[7] = v14;
  v23[8] = kSSCAMetalLayerClientResourceUsageSnapshotKey_totalPcoreInstructionCount;
  v15 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SSCAMetalLayerClientResourceUsageSnapshot totalPcoreInstructionCount](self, "totalPcoreInstructionCount"));
  v24[8] = v15;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:9];

  v17 = [(SSCAMetalLayerClientResourceUsageSnapshot *)self memoryLimitHeadroomMiB];

  if (v17)
  {
    id v18 = (id)[v16 mutableCopy];
    v19 = [(SSCAMetalLayerClientResourceUsageSnapshot *)self memoryLimitHeadroomMiB];
    [v18 setObject:v19 forKeyedSubscript:kSSCAMetalLayerClientResourceUsageSnapshotKey_memoryLimitHeadroomMiB];
  }
  else
  {
    id v18 = v16;
  }

  return v18;
}

- (id)jsonDescription:(unint64_t)a3
{
  return SignpostJSONRepresentation(self, a3);
}

- (NSString)debugDescription
{
  return (NSString *)[(SSCAMetalLayerClientResourceUsageSnapshot *)self jsonDescription:3];
}

- (SSCAMetalLayerClientResourceUsageSnapshot)initWithPhysicalFootprintMiB:(id)a3 peakPhysicalFootprint:(id)a4 totalDiskReads:(id)a5 totalDiskWrites:(id)a6 totalDiskLogicalWrites:(id)a7 totalInstructionCount:(id)a8 totalPcoreInstructionCount:(id)a9 date:(id)a10 mct:(unint64_t)a11 optionalMemoryLimitHeadroom:(id)a12 timebaseRatio:(double)a13
{
  id v20 = a3;
  id v21 = a4;
  id v39 = a5;
  id v22 = a6;
  id v23 = a7;
  id v24 = a8;
  id v25 = a9;
  id v26 = a10;
  id v27 = a12;
  v28 = 0;
  v38 = v20;
  if (v20)
  {
    v29 = v21;
    if (v21 && v39 && v22 && v23 && v24 && v25 && v26 && a11 && a13 != 0.0)
    {
      id v37 = v27;
      v40.receiver = self;
      v40.super_class = (Class)SSCAMetalLayerClientResourceUsageSnapshot;
      v30 = [(SSCAMetalLayerClientResourceUsageSnapshot *)&v40 init];
      if (v30)
      {
        [v38 doubleValue];
        v30->_physicalFootprintMiB = v31;
        [v21 doubleValue];
        v30->_peakPhysicalFootprintMiB = v32;
        objc_storeStrong((id *)&v30->_memoryLimitHeadroomMiB, a12);
        [v39 doubleValue];
        v30->_totalDiskReadsMiB = v33;
        [v22 doubleValue];
        v30->_totalDiskWritesMiB = v34;
        [v23 doubleValue];
        v30->_totalDiskLogicalWritesMiB = v35;
        v30->_totalInstructionCount = [v24 unsignedLongLongValue];
        v30->_totalPcoreInstructionCount = [v25 unsignedLongLongValue];
        objc_storeStrong((id *)&v30->_snapshotDate, a10);
        v30->_snapshotMCT = a11;
        v30->_timebaseRatio = a13;
      }
      self = v30;
      v28 = self;
      id v27 = v37;
    }
  }
  else
  {
    v29 = v21;
  }

  return v28;
}

+ (id)snapshotFromSignpostEvent:(id)a3
{
  id v3 = a3;
  v4 = [v3 placeholderTokenValueDictForTokenKey:@"name"];
  id v26 = [SSCAMetalLayerClientResourceUsageSnapshot alloc];
  id v5 = v4;
  objc_opt_class();
  id v25 = _objectValueForKey(@"ri_phys_footprint", v5, 3);

  id v6 = v5;
  objc_opt_class();
  id v24 = _objectValueForKey(@"ri_lifetime_max_phys_footprint", v6, 3);

  id v7 = v6;
  objc_opt_class();
  id v23 = _objectValueForKey(@"ri_diskio_bytesread", v7, 3);

  id v8 = v7;
  objc_opt_class();
  id v22 = _objectValueForKey(@"ri_diskio_byteswritten", v8, 3);

  id v9 = v8;
  objc_opt_class();
  id v21 = _objectValueForKey(@"ri_logical_writes", v9, 3);

  id v10 = v9;
  objc_opt_class();
  v11 = _objectValueForKey(@"ri_instructions", v10, 3);

  id v12 = v10;
  objc_opt_class();
  v13 = _objectValueForKey(@"ri_pinstructions", v12, 3);

  v14 = [v3 beginDate];
  uint64_t v15 = [v3 startMachContinuousTime];
  id v16 = v12;
  objc_opt_class();
  v17 = _objectValueForKey(@"os_proc_available_memory", v16, 3);

  [v3 timebaseRatio];
  double v19 = v18;

  id v27 = [(SSCAMetalLayerClientResourceUsageSnapshot *)v26 initWithPhysicalFootprintMiB:v25 peakPhysicalFootprint:v24 totalDiskReads:v23 totalDiskWrites:v22 totalDiskLogicalWrites:v21 totalInstructionCount:v11 totalPcoreInstructionCount:v19 date:v13 mct:v14 optionalMemoryLimitHeadroom:v15 timebaseRatio:v17];

  return v27;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (SSCAMetalLayerClientResourceUsageSnapshot *)a3;
  if (self == v5)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
      id v7 = [(SSCAMetalLayerClientResourceUsageSnapshot *)self memoryLimitHeadroomMiB];
      if (!v7
        || ([(SSCAMetalLayerClientResourceUsageSnapshot *)v6 memoryLimitHeadroomMiB],
            (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        id v9 = [(SSCAMetalLayerClientResourceUsageSnapshot *)self memoryLimitHeadroomMiB];
        if (v9)
        {

          if (v7)
          {
          }
        }
        else
        {
          id v10 = [(SSCAMetalLayerClientResourceUsageSnapshot *)v6 memoryLimitHeadroomMiB];

          if (v7)
          {
          }
          if (v10) {
            goto LABEL_26;
          }
        }
        v11 = [(SSCAMetalLayerClientResourceUsageSnapshot *)self memoryLimitHeadroomMiB];

        if (!v11
          || ([(SSCAMetalLayerClientResourceUsageSnapshot *)self memoryLimitHeadroomMiB],
              id v12 = objc_claimAutoreleasedReturnValue(),
              [(SSCAMetalLayerClientResourceUsageSnapshot *)v6 memoryLimitHeadroomMiB],
              v13 = objc_claimAutoreleasedReturnValue(),
              int v14 = [v12 isEqualToNumber:v13],
              v13,
              v12,
              v14))
        {
          uint64_t v15 = [(SSCAMetalLayerClientResourceUsageSnapshot *)self snapshotDate];
          id v16 = [(SSCAMetalLayerClientResourceUsageSnapshot *)v6 snapshotDate];
          int v17 = [v15 isEqualToDate:v16];

          if (v17)
          {
            unint64_t v18 = [(SSCAMetalLayerClientResourceUsageSnapshot *)self snapshotMCT];
            if (v18 == [(SSCAMetalLayerClientResourceUsageSnapshot *)v6 snapshotMCT])
            {
              [(SSCAMetalLayerClientResourceUsageSnapshot *)self physicalFootprintMiB];
              double v20 = v19;
              [(SSCAMetalLayerClientResourceUsageSnapshot *)v6 physicalFootprintMiB];
              if (v20 == v21)
              {
                [(SSCAMetalLayerClientResourceUsageSnapshot *)self peakPhysicalFootprintMiB];
                double v23 = v22;
                [(SSCAMetalLayerClientResourceUsageSnapshot *)v6 peakPhysicalFootprintMiB];
                if (v23 == v24)
                {
                  [(SSCAMetalLayerClientResourceUsageSnapshot *)self totalDiskReadsMiB];
                  double v26 = v25;
                  [(SSCAMetalLayerClientResourceUsageSnapshot *)v6 totalDiskReadsMiB];
                  if (v26 == v27)
                  {
                    [(SSCAMetalLayerClientResourceUsageSnapshot *)self totalDiskWritesMiB];
                    double v29 = v28;
                    [(SSCAMetalLayerClientResourceUsageSnapshot *)v6 totalDiskWritesMiB];
                    if (v29 == v30)
                    {
                      [(SSCAMetalLayerClientResourceUsageSnapshot *)self totalDiskLogicalWritesMiB];
                      double v32 = v31;
                      [(SSCAMetalLayerClientResourceUsageSnapshot *)v6 totalDiskLogicalWritesMiB];
                      if (v32 == v33)
                      {
                        unint64_t v34 = [(SSCAMetalLayerClientResourceUsageSnapshot *)self totalInstructionCount];
                        if (v34 == [(SSCAMetalLayerClientResourceUsageSnapshot *)v6 totalInstructionCount])
                        {
                          unint64_t v35 = [(SSCAMetalLayerClientResourceUsageSnapshot *)self totalPcoreInstructionCount];
                          if (v35 == [(SSCAMetalLayerClientResourceUsageSnapshot *)v6 totalPcoreInstructionCount])
                          {
                            [(SSCAMetalLayerClientResourceUsageSnapshot *)self timebaseRatio];
                            double v37 = v36;
                            [(SSCAMetalLayerClientResourceUsageSnapshot *)v6 timebaseRatio];
                            BOOL v8 = v37 == v38;
LABEL_27:

                            goto LABEL_28;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      else
      {
      }
LABEL_26:
      BOOL v8 = 0;
      goto LABEL_27;
    }
    BOOL v8 = 0;
  }
LABEL_28:

  return v8;
}

- (NSDate)snapshotDate
{
  return self->_snapshotDate;
}

- (unint64_t)snapshotMCT
{
  return self->_snapshotMCT;
}

- (double)physicalFootprintMiB
{
  return self->_physicalFootprintMiB;
}

- (double)peakPhysicalFootprintMiB
{
  return self->_peakPhysicalFootprintMiB;
}

- (double)totalDiskReadsMiB
{
  return self->_totalDiskReadsMiB;
}

- (double)totalDiskWritesMiB
{
  return self->_totalDiskWritesMiB;
}

- (double)totalDiskLogicalWritesMiB
{
  return self->_totalDiskLogicalWritesMiB;
}

- (unint64_t)totalInstructionCount
{
  return self->_totalInstructionCount;
}

- (unint64_t)totalPcoreInstructionCount
{
  return self->_totalPcoreInstructionCount;
}

- (NSNumber)memoryLimitHeadroomMiB
{
  return self->_memoryLimitHeadroomMiB;
}

- (double)timebaseRatio
{
  return self->_timebaseRatio;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memoryLimitHeadroomMiB, 0);

  objc_storeStrong((id *)&self->_snapshotDate, 0);
}

@end