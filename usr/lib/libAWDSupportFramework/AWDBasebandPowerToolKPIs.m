@interface AWDBasebandPowerToolKPIs
- (BOOL)hasArmUtilityThresholdPoint;
- (BOOL)hasRadarPriority;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)armUtilityPDFAtIndex:(unint64_t)a3;
- (int)armUtilityPDFs;
- (int)armUtilityThresholdPoint;
- (int)causeCodeBackgroundActivityARMUtilityAtIndex:(unint64_t)a3;
- (int)causeCodeBackgroundActivityARMUtilitys;
- (int)causeCodeBackgroundActivityDurations;
- (int)causeCodeBackgroundActivityDurationsAtIndex:(unint64_t)a3;
- (int)causeCodeCumulativeARMUtilityAtIndex:(unint64_t)a3;
- (int)causeCodeCumulativeARMUtilitys;
- (int)causeCodeCumulativeDurations;
- (int)causeCodeCumulativeDurationsAtIndex:(unint64_t)a3;
- (int)causeCodeMarginalCoverageARMUtilityAtIndex:(unint64_t)a3;
- (int)causeCodeMarginalCoverageARMUtilitys;
- (int)causeCodeMarginalCoverageDurations;
- (int)causeCodeMarginalCoverageDurationsAtIndex:(unint64_t)a3;
- (int)causeCodeOOSARMUtilityAtIndex:(unint64_t)a3;
- (int)causeCodeOOSARMUtilitys;
- (int)causeCodeOOSDurations;
- (int)causeCodeOOSDurationsAtIndex:(unint64_t)a3;
- (int)causeCodeRACHFailARMUtilityAtIndex:(unint64_t)a3;
- (int)causeCodeRACHFailARMUtilitys;
- (int)causeCodeRACHFailDurations;
- (int)causeCodeRACHFailDurationsAtIndex:(unint64_t)a3;
- (int)causeCodeStruckInDCHARMUtilityAtIndex:(unint64_t)a3;
- (int)causeCodeStruckInDCHARMUtilitys;
- (int)causeCodeStruckInDCHDurations;
- (int)causeCodeStruckInDCHDurationsAtIndex:(unint64_t)a3;
- (int)causeCodeTcXONotShuttingARMUtilityAtIndex:(unint64_t)a3;
- (int)causeCodeTcXONotShuttingARMUtilitys;
- (int)causeCodeTcXONotShuttingDurations;
- (int)causeCodeTcXONotShuttingDurationsAtIndex:(unint64_t)a3;
- (int)causeCodeUnknownARMUtilityAtIndex:(unint64_t)a3;
- (int)causeCodeUnknownARMUtilitys;
- (int)causeCodeUnknownDurations;
- (int)causeCodeUnknownDurationsAtIndex:(unint64_t)a3;
- (int)radarPriority;
- (unint64_t)armUtilityPDFsCount;
- (unint64_t)causeCodeBackgroundActivityARMUtilitysCount;
- (unint64_t)causeCodeBackgroundActivityDurationsCount;
- (unint64_t)causeCodeCumulativeARMUtilitysCount;
- (unint64_t)causeCodeCumulativeDurationsCount;
- (unint64_t)causeCodeMarginalCoverageARMUtilitysCount;
- (unint64_t)causeCodeMarginalCoverageDurationsCount;
- (unint64_t)causeCodeOOSARMUtilitysCount;
- (unint64_t)causeCodeOOSDurationsCount;
- (unint64_t)causeCodeRACHFailARMUtilitysCount;
- (unint64_t)causeCodeRACHFailDurationsCount;
- (unint64_t)causeCodeStruckInDCHARMUtilitysCount;
- (unint64_t)causeCodeStruckInDCHDurationsCount;
- (unint64_t)causeCodeTcXONotShuttingARMUtilitysCount;
- (unint64_t)causeCodeTcXONotShuttingDurationsCount;
- (unint64_t)causeCodeUnknownARMUtilitysCount;
- (unint64_t)causeCodeUnknownDurationsCount;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)addArmUtilityPDF:(int)a3;
- (void)addCauseCodeBackgroundActivityARMUtility:(int)a3;
- (void)addCauseCodeBackgroundActivityDurations:(int)a3;
- (void)addCauseCodeCumulativeARMUtility:(int)a3;
- (void)addCauseCodeCumulativeDurations:(int)a3;
- (void)addCauseCodeMarginalCoverageARMUtility:(int)a3;
- (void)addCauseCodeMarginalCoverageDurations:(int)a3;
- (void)addCauseCodeOOSARMUtility:(int)a3;
- (void)addCauseCodeOOSDurations:(int)a3;
- (void)addCauseCodeRACHFailARMUtility:(int)a3;
- (void)addCauseCodeRACHFailDurations:(int)a3;
- (void)addCauseCodeStruckInDCHARMUtility:(int)a3;
- (void)addCauseCodeStruckInDCHDurations:(int)a3;
- (void)addCauseCodeTcXONotShuttingARMUtility:(int)a3;
- (void)addCauseCodeTcXONotShuttingDurations:(int)a3;
- (void)addCauseCodeUnknownARMUtility:(int)a3;
- (void)addCauseCodeUnknownDurations:(int)a3;
- (void)clearArmUtilityPDFs;
- (void)clearCauseCodeBackgroundActivityARMUtilitys;
- (void)clearCauseCodeBackgroundActivityDurations;
- (void)clearCauseCodeCumulativeARMUtilitys;
- (void)clearCauseCodeCumulativeDurations;
- (void)clearCauseCodeMarginalCoverageARMUtilitys;
- (void)clearCauseCodeMarginalCoverageDurations;
- (void)clearCauseCodeOOSARMUtilitys;
- (void)clearCauseCodeOOSDurations;
- (void)clearCauseCodeRACHFailARMUtilitys;
- (void)clearCauseCodeRACHFailDurations;
- (void)clearCauseCodeStruckInDCHARMUtilitys;
- (void)clearCauseCodeStruckInDCHDurations;
- (void)clearCauseCodeTcXONotShuttingARMUtilitys;
- (void)clearCauseCodeTcXONotShuttingDurations;
- (void)clearCauseCodeUnknownARMUtilitys;
- (void)clearCauseCodeUnknownDurations;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setArmUtilityPDFs:(int *)a3 count:(unint64_t)a4;
- (void)setArmUtilityThresholdPoint:(int)a3;
- (void)setCauseCodeBackgroundActivityARMUtilitys:(int *)a3 count:(unint64_t)a4;
- (void)setCauseCodeBackgroundActivityDurations:(int *)a3 count:(unint64_t)a4;
- (void)setCauseCodeCumulativeARMUtilitys:(int *)a3 count:(unint64_t)a4;
- (void)setCauseCodeCumulativeDurations:(int *)a3 count:(unint64_t)a4;
- (void)setCauseCodeMarginalCoverageARMUtilitys:(int *)a3 count:(unint64_t)a4;
- (void)setCauseCodeMarginalCoverageDurations:(int *)a3 count:(unint64_t)a4;
- (void)setCauseCodeOOSARMUtilitys:(int *)a3 count:(unint64_t)a4;
- (void)setCauseCodeOOSDurations:(int *)a3 count:(unint64_t)a4;
- (void)setCauseCodeRACHFailARMUtilitys:(int *)a3 count:(unint64_t)a4;
- (void)setCauseCodeRACHFailDurations:(int *)a3 count:(unint64_t)a4;
- (void)setCauseCodeStruckInDCHARMUtilitys:(int *)a3 count:(unint64_t)a4;
- (void)setCauseCodeStruckInDCHDurations:(int *)a3 count:(unint64_t)a4;
- (void)setCauseCodeTcXONotShuttingARMUtilitys:(int *)a3 count:(unint64_t)a4;
- (void)setCauseCodeTcXONotShuttingDurations:(int *)a3 count:(unint64_t)a4;
- (void)setCauseCodeUnknownARMUtilitys:(int *)a3 count:(unint64_t)a4;
- (void)setCauseCodeUnknownDurations:(int *)a3 count:(unint64_t)a4;
- (void)setHasArmUtilityThresholdPoint:(BOOL)a3;
- (void)setHasRadarPriority:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setRadarPriority:(int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDBasebandPowerToolKPIs

- (void)dealloc
{
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDBasebandPowerToolKPIs;
  [(AWDBasebandPowerToolKPIs *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setRadarPriority:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_radarPriority = a3;
}

- (void)setHasRadarPriority:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRadarPriority
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setArmUtilityThresholdPoint:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_armUtilityThresholdPoint = a3;
}

- (void)setHasArmUtilityThresholdPoint:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasArmUtilityThresholdPoint
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (unint64_t)armUtilityPDFsCount
{
  return self->_armUtilityPDFs.count;
}

- (int)armUtilityPDFs
{
  return self->_armUtilityPDFs.list;
}

- (void)clearArmUtilityPDFs
{
}

- (void)addArmUtilityPDF:(int)a3
{
}

- (int)armUtilityPDFAtIndex:(unint64_t)a3
{
  p_armUtilityPDFs = &self->_armUtilityPDFs;
  unint64_t count = self->_armUtilityPDFs.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count], "raise" reason userInfo];
  }
  return p_armUtilityPDFs->list[a3];
}

- (void)setArmUtilityPDFs:(int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)causeCodeOOSARMUtilitysCount
{
  return self->_causeCodeOOSARMUtilitys.count;
}

- (int)causeCodeOOSARMUtilitys
{
  return self->_causeCodeOOSARMUtilitys.list;
}

- (void)clearCauseCodeOOSARMUtilitys
{
}

- (void)addCauseCodeOOSARMUtility:(int)a3
{
}

- (int)causeCodeOOSARMUtilityAtIndex:(unint64_t)a3
{
  p_causeCodeOOSARMUtilitys = &self->_causeCodeOOSARMUtilitys;
  unint64_t count = self->_causeCodeOOSARMUtilitys.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count] raise];
  }
  return p_causeCodeOOSARMUtilitys->list[a3];
}

- (void)setCauseCodeOOSARMUtilitys:(int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)causeCodeOOSDurationsCount
{
  return self->_causeCodeOOSDurations.count;
}

- (int)causeCodeOOSDurations
{
  return self->_causeCodeOOSDurations.list;
}

- (void)clearCauseCodeOOSDurations
{
}

- (void)addCauseCodeOOSDurations:(int)a3
{
}

- (int)causeCodeOOSDurationsAtIndex:(unint64_t)a3
{
  p_causeCodeOOSDurations = &self->_causeCodeOOSDurations;
  unint64_t count = self->_causeCodeOOSDurations.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count], "raise" reason userInfo];
  }
  return p_causeCodeOOSDurations->list[a3];
}

- (void)setCauseCodeOOSDurations:(int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)causeCodeTcXONotShuttingARMUtilitysCount
{
  return self->_causeCodeTcXONotShuttingARMUtilitys.count;
}

- (int)causeCodeTcXONotShuttingARMUtilitys
{
  return self->_causeCodeTcXONotShuttingARMUtilitys.list;
}

- (void)clearCauseCodeTcXONotShuttingARMUtilitys
{
}

- (void)addCauseCodeTcXONotShuttingARMUtility:(int)a3
{
}

- (int)causeCodeTcXONotShuttingARMUtilityAtIndex:(unint64_t)a3
{
  p_causeCodeTcXONotShuttingARMUtilitys = &self->_causeCodeTcXONotShuttingARMUtilitys;
  unint64_t count = self->_causeCodeTcXONotShuttingARMUtilitys.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count] raise];
  }
  return p_causeCodeTcXONotShuttingARMUtilitys->list[a3];
}

- (void)setCauseCodeTcXONotShuttingARMUtilitys:(int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)causeCodeTcXONotShuttingDurationsCount
{
  return self->_causeCodeTcXONotShuttingDurations.count;
}

- (int)causeCodeTcXONotShuttingDurations
{
  return self->_causeCodeTcXONotShuttingDurations.list;
}

- (void)clearCauseCodeTcXONotShuttingDurations
{
}

- (void)addCauseCodeTcXONotShuttingDurations:(int)a3
{
}

- (int)causeCodeTcXONotShuttingDurationsAtIndex:(unint64_t)a3
{
  p_causeCodeTcXONotShuttingDurations = &self->_causeCodeTcXONotShuttingDurations;
  unint64_t count = self->_causeCodeTcXONotShuttingDurations.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count], "raise" reason userInfo];
  }
  return p_causeCodeTcXONotShuttingDurations->list[a3];
}

- (void)setCauseCodeTcXONotShuttingDurations:(int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)causeCodeBackgroundActivityARMUtilitysCount
{
  return self->_causeCodeBackgroundActivityARMUtilitys.count;
}

- (int)causeCodeBackgroundActivityARMUtilitys
{
  return self->_causeCodeBackgroundActivityARMUtilitys.list;
}

- (void)clearCauseCodeBackgroundActivityARMUtilitys
{
}

- (void)addCauseCodeBackgroundActivityARMUtility:(int)a3
{
}

- (int)causeCodeBackgroundActivityARMUtilityAtIndex:(unint64_t)a3
{
  p_causeCodeBackgroundActivityARMUtilitys = &self->_causeCodeBackgroundActivityARMUtilitys;
  unint64_t count = self->_causeCodeBackgroundActivityARMUtilitys.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count) 0], "raise" reason userInfo];
  }
  return p_causeCodeBackgroundActivityARMUtilitys->list[a3];
}

- (void)setCauseCodeBackgroundActivityARMUtilitys:(int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)causeCodeBackgroundActivityDurationsCount
{
  return self->_causeCodeBackgroundActivityDurations.count;
}

- (int)causeCodeBackgroundActivityDurations
{
  return self->_causeCodeBackgroundActivityDurations.list;
}

- (void)clearCauseCodeBackgroundActivityDurations
{
}

- (void)addCauseCodeBackgroundActivityDurations:(int)a3
{
}

- (int)causeCodeBackgroundActivityDurationsAtIndex:(unint64_t)a3
{
  p_causeCodeBackgroundActivityDurations = &self->_causeCodeBackgroundActivityDurations;
  unint64_t count = self->_causeCodeBackgroundActivityDurations.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count] raise];
  }
  return p_causeCodeBackgroundActivityDurations->list[a3];
}

- (void)setCauseCodeBackgroundActivityDurations:(int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)causeCodeRACHFailARMUtilitysCount
{
  return self->_causeCodeRACHFailARMUtilitys.count;
}

- (int)causeCodeRACHFailARMUtilitys
{
  return self->_causeCodeRACHFailARMUtilitys.list;
}

- (void)clearCauseCodeRACHFailARMUtilitys
{
}

- (void)addCauseCodeRACHFailARMUtility:(int)a3
{
}

- (int)causeCodeRACHFailARMUtilityAtIndex:(unint64_t)a3
{
  p_causeCodeRACHFailARMUtilitys = &self->_causeCodeRACHFailARMUtilitys;
  unint64_t count = self->_causeCodeRACHFailARMUtilitys.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count), 0), "raise" reason userInfo];
  }
  return p_causeCodeRACHFailARMUtilitys->list[a3];
}

- (void)setCauseCodeRACHFailARMUtilitys:(int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)causeCodeRACHFailDurationsCount
{
  return self->_causeCodeRACHFailDurations.count;
}

- (int)causeCodeRACHFailDurations
{
  return self->_causeCodeRACHFailDurations.list;
}

- (void)clearCauseCodeRACHFailDurations
{
}

- (void)addCauseCodeRACHFailDurations:(int)a3
{
}

- (int)causeCodeRACHFailDurationsAtIndex:(unint64_t)a3
{
  p_causeCodeRACHFailDurations = &self->_causeCodeRACHFailDurations;
  unint64_t count = self->_causeCodeRACHFailDurations.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count)], "raise" reason userInfo];
  }
  return p_causeCodeRACHFailDurations->list[a3];
}

- (void)setCauseCodeRACHFailDurations:(int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)causeCodeStruckInDCHARMUtilitysCount
{
  return self->_causeCodeStruckInDCHARMUtilitys.count;
}

- (int)causeCodeStruckInDCHARMUtilitys
{
  return self->_causeCodeStruckInDCHARMUtilitys.list;
}

- (void)clearCauseCodeStruckInDCHARMUtilitys
{
}

- (void)addCauseCodeStruckInDCHARMUtility:(int)a3
{
}

- (int)causeCodeStruckInDCHARMUtilityAtIndex:(unint64_t)a3
{
  p_causeCodeStruckInDCHARMUtilitys = &self->_causeCodeStruckInDCHARMUtilitys;
  unint64_t count = self->_causeCodeStruckInDCHARMUtilitys.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count) 0], "raise" reason userInfo];
  }
  return p_causeCodeStruckInDCHARMUtilitys->list[a3];
}

- (void)setCauseCodeStruckInDCHARMUtilitys:(int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)causeCodeStruckInDCHDurationsCount
{
  return self->_causeCodeStruckInDCHDurations.count;
}

- (int)causeCodeStruckInDCHDurations
{
  return self->_causeCodeStruckInDCHDurations.list;
}

- (void)clearCauseCodeStruckInDCHDurations
{
}

- (void)addCauseCodeStruckInDCHDurations:(int)a3
{
}

- (int)causeCodeStruckInDCHDurationsAtIndex:(unint64_t)a3
{
  p_causeCodeStruckInDCHDurations = &self->_causeCodeStruckInDCHDurations;
  unint64_t count = self->_causeCodeStruckInDCHDurations.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count] raise];
  }
  return p_causeCodeStruckInDCHDurations->list[a3];
}

- (void)setCauseCodeStruckInDCHDurations:(int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)causeCodeMarginalCoverageARMUtilitysCount
{
  return self->_causeCodeMarginalCoverageARMUtilitys.count;
}

- (int)causeCodeMarginalCoverageARMUtilitys
{
  return self->_causeCodeMarginalCoverageARMUtilitys.list;
}

- (void)clearCauseCodeMarginalCoverageARMUtilitys
{
}

- (void)addCauseCodeMarginalCoverageARMUtility:(int)a3
{
}

- (int)causeCodeMarginalCoverageARMUtilityAtIndex:(unint64_t)a3
{
  p_causeCodeMarginalCoverageARMUtilitys = &self->_causeCodeMarginalCoverageARMUtilitys;
  unint64_t count = self->_causeCodeMarginalCoverageARMUtilitys.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count] raise];
  }
  return p_causeCodeMarginalCoverageARMUtilitys->list[a3];
}

- (void)setCauseCodeMarginalCoverageARMUtilitys:(int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)causeCodeMarginalCoverageDurationsCount
{
  return self->_causeCodeMarginalCoverageDurations.count;
}

- (int)causeCodeMarginalCoverageDurations
{
  return self->_causeCodeMarginalCoverageDurations.list;
}

- (void)clearCauseCodeMarginalCoverageDurations
{
}

- (void)addCauseCodeMarginalCoverageDurations:(int)a3
{
}

- (int)causeCodeMarginalCoverageDurationsAtIndex:(unint64_t)a3
{
  p_causeCodeMarginalCoverageDurations = &self->_causeCodeMarginalCoverageDurations;
  unint64_t count = self->_causeCodeMarginalCoverageDurations.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count], "raise" reason userInfo];
  }
  return p_causeCodeMarginalCoverageDurations->list[a3];
}

- (void)setCauseCodeMarginalCoverageDurations:(int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)causeCodeUnknownARMUtilitysCount
{
  return self->_causeCodeUnknownARMUtilitys.count;
}

- (int)causeCodeUnknownARMUtilitys
{
  return self->_causeCodeUnknownARMUtilitys.list;
}

- (void)clearCauseCodeUnknownARMUtilitys
{
}

- (void)addCauseCodeUnknownARMUtility:(int)a3
{
}

- (int)causeCodeUnknownARMUtilityAtIndex:(unint64_t)a3
{
  p_causeCodeUnknownARMUtilitys = &self->_causeCodeUnknownARMUtilitys;
  unint64_t count = self->_causeCodeUnknownARMUtilitys.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count)], "raise" reason userInfo];
  }
  return p_causeCodeUnknownARMUtilitys->list[a3];
}

- (void)setCauseCodeUnknownARMUtilitys:(int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)causeCodeUnknownDurationsCount
{
  return self->_causeCodeUnknownDurations.count;
}

- (int)causeCodeUnknownDurations
{
  return self->_causeCodeUnknownDurations.list;
}

- (void)clearCauseCodeUnknownDurations
{
}

- (void)addCauseCodeUnknownDurations:(int)a3
{
}

- (int)causeCodeUnknownDurationsAtIndex:(unint64_t)a3
{
  p_causeCodeUnknownDurations = &self->_causeCodeUnknownDurations;
  unint64_t count = self->_causeCodeUnknownDurations.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count), 0), "raise" reason userInfo];
  }
  return p_causeCodeUnknownDurations->list[a3];
}

- (void)setCauseCodeUnknownDurations:(int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)causeCodeCumulativeARMUtilitysCount
{
  return self->_causeCodeCumulativeARMUtilitys.count;
}

- (int)causeCodeCumulativeARMUtilitys
{
  return self->_causeCodeCumulativeARMUtilitys.list;
}

- (void)clearCauseCodeCumulativeARMUtilitys
{
}

- (void)addCauseCodeCumulativeARMUtility:(int)a3
{
}

- (int)causeCodeCumulativeARMUtilityAtIndex:(unint64_t)a3
{
  p_causeCodeCumulativeARMUtilitys = &self->_causeCodeCumulativeARMUtilitys;
  unint64_t count = self->_causeCodeCumulativeARMUtilitys.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count], "raise" reason userInfo];
  }
  return p_causeCodeCumulativeARMUtilitys->list[a3];
}

- (void)setCauseCodeCumulativeARMUtilitys:(int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)causeCodeCumulativeDurationsCount
{
  return self->_causeCodeCumulativeDurations.count;
}

- (int)causeCodeCumulativeDurations
{
  return self->_causeCodeCumulativeDurations.list;
}

- (void)clearCauseCodeCumulativeDurations
{
}

- (void)addCauseCodeCumulativeDurations:(int)a3
{
}

- (int)causeCodeCumulativeDurationsAtIndex:(unint64_t)a3
{
  p_causeCodeCumulativeDurations = &self->_causeCodeCumulativeDurations;
  unint64_t count = self->_causeCodeCumulativeDurations.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count] raise];
  }
  return p_causeCodeCumulativeDurations->list[a3];
}

- (void)setCauseCodeCumulativeDurations:(int *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDBasebandPowerToolKPIs;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDBasebandPowerToolKPIs description](&v3, sel_description), -[AWDBasebandPowerToolKPIs dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    [v3 setObject:[NSNumber numberWithInt:self->_radarPriority] forKey:@"radarPriority"];
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 2) != 0) {
LABEL_4:
  }
    [v3 setObject:[NSNumber numberWithInt:self->_armUtilityThresholdPoint] forKey:@"armUtilityThresholdPoint"];
LABEL_5:
  [v3 setObject:PBRepeatedInt32NSArray() forKey:@"armUtilityPDF"];
  [v3 setObject:PBRepeatedInt32NSArray() forKey:@"causeCode_OOS_ARMUtility"];
  [v3 setObject:PBRepeatedInt32NSArray() forKey:@"causeCode_OOS_Durations"];
  [v3 setObject:PBRepeatedInt32NSArray() forKey:@"causeCode_TcXONotShutting_ARMUtility"];
  [v3 setObject:PBRepeatedInt32NSArray() forKey:@"causeCode_TcXONotShutting_Durations"];
  [v3 setObject:PBRepeatedInt32NSArray() forKey:@"causeCode_BackgroundActivity_ARMUtility"];
  [v3 setObject:PBRepeatedInt32NSArray() forKey:@"causeCode_BackgroundActivity_Durations"];
  [v3 setObject:PBRepeatedInt32NSArray() forKey:@"causeCode_RACHFail_ARMUtility"];
  [v3 setObject:PBRepeatedInt32NSArray() forKey:@"causeCode_RACHFail_Durations"];
  [v3 setObject:PBRepeatedInt32NSArray() forKey:@"causeCode_StruckInDCH_ARMUtility"];
  [v3 setObject:PBRepeatedInt32NSArray() forKey:@"causeCode_StruckInDCH_Durations"];
  [v3 setObject:PBRepeatedInt32NSArray() forKey:@"causeCode_MarginalCoverage_ARMUtility"];
  [v3 setObject:PBRepeatedInt32NSArray() forKey:@"causeCode_MarginalCoverage_Durations"];
  [v3 setObject:PBRepeatedInt32NSArray() forKey:@"causeCode_Unknown_ARMUtility"];
  [v3 setObject:PBRepeatedInt32NSArray() forKey:@"causeCode_Unknown_Durations"];
  [v3 setObject:PBRepeatedInt32NSArray() forKey:@"causeCode_Cumulative_ARMUtility"];
  [v3 setObject:PBRepeatedInt32NSArray() forKey:@"causeCode_Cumulative_Durations"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDBasebandPowerToolKPIsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_4:
  }
    PBDataWriterWriteInt32Field();
LABEL_5:
  if (self->_armUtilityPDFs.count)
  {
    PBDataWriterPlaceMark();
    if (self->_armUtilityPDFs.count)
    {
      unint64_t v5 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v5;
      }
      while (v5 < self->_armUtilityPDFs.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_causeCodeOOSARMUtilitys.count)
  {
    PBDataWriterPlaceMark();
    if (self->_causeCodeOOSARMUtilitys.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v6;
      }
      while (v6 < self->_causeCodeOOSARMUtilitys.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_causeCodeOOSDurations.count)
  {
    PBDataWriterPlaceMark();
    if (self->_causeCodeOOSDurations.count)
    {
      unint64_t v7 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v7;
      }
      while (v7 < self->_causeCodeOOSDurations.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_causeCodeTcXONotShuttingARMUtilitys.count)
  {
    PBDataWriterPlaceMark();
    if (self->_causeCodeTcXONotShuttingARMUtilitys.count)
    {
      unint64_t v8 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v8;
      }
      while (v8 < self->_causeCodeTcXONotShuttingARMUtilitys.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_causeCodeTcXONotShuttingDurations.count)
  {
    PBDataWriterPlaceMark();
    if (self->_causeCodeTcXONotShuttingDurations.count)
    {
      unint64_t v9 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v9;
      }
      while (v9 < self->_causeCodeTcXONotShuttingDurations.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_causeCodeBackgroundActivityARMUtilitys.count)
  {
    PBDataWriterPlaceMark();
    if (self->_causeCodeBackgroundActivityARMUtilitys.count)
    {
      unint64_t v10 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v10;
      }
      while (v10 < self->_causeCodeBackgroundActivityARMUtilitys.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_causeCodeBackgroundActivityDurations.count)
  {
    PBDataWriterPlaceMark();
    if (self->_causeCodeBackgroundActivityDurations.count)
    {
      unint64_t v11 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v11;
      }
      while (v11 < self->_causeCodeBackgroundActivityDurations.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_causeCodeRACHFailARMUtilitys.count)
  {
    PBDataWriterPlaceMark();
    if (self->_causeCodeRACHFailARMUtilitys.count)
    {
      unint64_t v12 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v12;
      }
      while (v12 < self->_causeCodeRACHFailARMUtilitys.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_causeCodeRACHFailDurations.count)
  {
    PBDataWriterPlaceMark();
    if (self->_causeCodeRACHFailDurations.count)
    {
      unint64_t v13 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v13;
      }
      while (v13 < self->_causeCodeRACHFailDurations.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_causeCodeStruckInDCHARMUtilitys.count)
  {
    PBDataWriterPlaceMark();
    if (self->_causeCodeStruckInDCHARMUtilitys.count)
    {
      unint64_t v14 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v14;
      }
      while (v14 < self->_causeCodeStruckInDCHARMUtilitys.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_causeCodeStruckInDCHDurations.count)
  {
    PBDataWriterPlaceMark();
    if (self->_causeCodeStruckInDCHDurations.count)
    {
      unint64_t v15 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v15;
      }
      while (v15 < self->_causeCodeStruckInDCHDurations.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_causeCodeMarginalCoverageARMUtilitys.count)
  {
    PBDataWriterPlaceMark();
    if (self->_causeCodeMarginalCoverageARMUtilitys.count)
    {
      unint64_t v16 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v16;
      }
      while (v16 < self->_causeCodeMarginalCoverageARMUtilitys.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_causeCodeMarginalCoverageDurations.count)
  {
    PBDataWriterPlaceMark();
    if (self->_causeCodeMarginalCoverageDurations.count)
    {
      unint64_t v17 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v17;
      }
      while (v17 < self->_causeCodeMarginalCoverageDurations.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_causeCodeUnknownARMUtilitys.count)
  {
    PBDataWriterPlaceMark();
    if (self->_causeCodeUnknownARMUtilitys.count)
    {
      unint64_t v18 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v18;
      }
      while (v18 < self->_causeCodeUnknownARMUtilitys.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_causeCodeUnknownDurations.count)
  {
    PBDataWriterPlaceMark();
    if (self->_causeCodeUnknownDurations.count)
    {
      unint64_t v19 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v19;
      }
      while (v19 < self->_causeCodeUnknownDurations.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_causeCodeCumulativeARMUtilitys.count)
  {
    PBDataWriterPlaceMark();
    if (self->_causeCodeCumulativeARMUtilitys.count)
    {
      unint64_t v20 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v20;
      }
      while (v20 < self->_causeCodeCumulativeARMUtilitys.count);
    }
    PBDataWriterRecallMark();
  }
  p_causeCodeCumulativeDurations = &self->_causeCodeCumulativeDurations;
  if (p_causeCodeCumulativeDurations->count)
  {
    PBDataWriterPlaceMark();
    if (p_causeCodeCumulativeDurations->count)
    {
      unint64_t v22 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v22;
      }
      while (v22 < p_causeCodeCumulativeDurations->count);
    }
    PBDataWriterRecallMark();
  }
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_3;
    }
LABEL_75:
    *((_DWORD *)a3 + 107) = self->_radarPriority;
    *((unsigned char *)a3 + 432) |= 4u;
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *((void *)a3 + 52) = self->_timestamp;
  *((unsigned char *)a3 + 432) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_75;
  }
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    *((_DWORD *)a3 + 106) = self->_armUtilityThresholdPoint;
    *((unsigned char *)a3 + 432) |= 2u;
  }
LABEL_5:
  if ([(AWDBasebandPowerToolKPIs *)self armUtilityPDFsCount])
  {
    [a3 clearArmUtilityPDFs];
    unint64_t v6 = [(AWDBasebandPowerToolKPIs *)self armUtilityPDFsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [a3 addArmUtilityPDF:-[AWDBasebandPowerToolKPIs armUtilityPDFAtIndex:](self, "armUtilityPDFAtIndex:", i)];
    }
  }
  if ([(AWDBasebandPowerToolKPIs *)self causeCodeOOSARMUtilitysCount])
  {
    [a3 clearCauseCodeOOSARMUtilitys];
    unint64_t v9 = [(AWDBasebandPowerToolKPIs *)self causeCodeOOSARMUtilitysCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
        [a3 addCauseCodeOOSARMUtility:-[AWDBasebandPowerToolKPIs causeCodeOOSARMUtilityAtIndex:](self, "causeCodeOOSARMUtilityAtIndex:", j)];
    }
  }
  if ([(AWDBasebandPowerToolKPIs *)self causeCodeOOSDurationsCount])
  {
    [a3 clearCauseCodeOOSDurations];
    unint64_t v12 = [(AWDBasebandPowerToolKPIs *)self causeCodeOOSDurationsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
        [a3 addCauseCodeOOSDurations:-[AWDBasebandPowerToolKPIs causeCodeOOSDurationsAtIndex:](self, "causeCodeOOSDurationsAtIndex:", k)];
    }
  }
  if ([(AWDBasebandPowerToolKPIs *)self causeCodeTcXONotShuttingARMUtilitysCount])
  {
    [a3 clearCauseCodeTcXONotShuttingARMUtilitys];
    unint64_t v15 = [(AWDBasebandPowerToolKPIs *)self causeCodeTcXONotShuttingARMUtilitysCount];
    if (v15)
    {
      unint64_t v16 = v15;
      for (uint64_t m = 0; m != v16; ++m)
        [a3 addCauseCodeTcXONotShuttingARMUtility:-[AWDBasebandPowerToolKPIs causeCodeTcXONotShuttingARMUtilityAtIndex:](self, "causeCodeTcXONotShuttingARMUtilityAtIndex:", m)];
    }
  }
  if ([(AWDBasebandPowerToolKPIs *)self causeCodeTcXONotShuttingDurationsCount])
  {
    [a3 clearCauseCodeTcXONotShuttingDurations];
    unint64_t v18 = [(AWDBasebandPowerToolKPIs *)self causeCodeTcXONotShuttingDurationsCount];
    if (v18)
    {
      unint64_t v19 = v18;
      for (uint64_t n = 0; n != v19; ++n)
        [a3 addCauseCodeTcXONotShuttingDurations:-[AWDBasebandPowerToolKPIs causeCodeTcXONotShuttingDurationsAtIndex:](self, "causeCodeTcXONotShuttingDurationsAtIndex:", n)];
    }
  }
  if ([(AWDBasebandPowerToolKPIs *)self causeCodeBackgroundActivityARMUtilitysCount])
  {
    [a3 clearCauseCodeBackgroundActivityARMUtilitys];
    unint64_t v21 = [(AWDBasebandPowerToolKPIs *)self causeCodeBackgroundActivityARMUtilitysCount];
    if (v21)
    {
      unint64_t v22 = v21;
      for (iuint64_t i = 0; ii != v22; ++ii)
        [a3 addCauseCodeBackgroundActivityARMUtility:-[AWDBasebandPowerToolKPIs causeCodeBackgroundActivityARMUtilityAtIndex:](self, "causeCodeBackgroundActivityARMUtilityAtIndex:", ii)];
    }
  }
  if ([(AWDBasebandPowerToolKPIs *)self causeCodeBackgroundActivityDurationsCount])
  {
    [a3 clearCauseCodeBackgroundActivityDurations];
    unint64_t v24 = [(AWDBasebandPowerToolKPIs *)self causeCodeBackgroundActivityDurationsCount];
    if (v24)
    {
      unint64_t v25 = v24;
      for (juint64_t j = 0; jj != v25; ++jj)
        [a3 addCauseCodeBackgroundActivityDurations:-[AWDBasebandPowerToolKPIs causeCodeBackgroundActivityDurationsAtIndex:](self, "causeCodeBackgroundActivityDurationsAtIndex:", jj)];
    }
  }
  if ([(AWDBasebandPowerToolKPIs *)self causeCodeRACHFailARMUtilitysCount])
  {
    [a3 clearCauseCodeRACHFailARMUtilitys];
    unint64_t v27 = [(AWDBasebandPowerToolKPIs *)self causeCodeRACHFailARMUtilitysCount];
    if (v27)
    {
      unint64_t v28 = v27;
      for (kuint64_t k = 0; kk != v28; ++kk)
        [a3 addCauseCodeRACHFailARMUtility:-[AWDBasebandPowerToolKPIs causeCodeRACHFailARMUtilityAtIndex:](self, "causeCodeRACHFailARMUtilityAtIndex:", kk)];
    }
  }
  if ([(AWDBasebandPowerToolKPIs *)self causeCodeRACHFailDurationsCount])
  {
    [a3 clearCauseCodeRACHFailDurations];
    unint64_t v30 = [(AWDBasebandPowerToolKPIs *)self causeCodeRACHFailDurationsCount];
    if (v30)
    {
      unint64_t v31 = v30;
      for (muint64_t m = 0; mm != v31; ++mm)
        [a3 addCauseCodeRACHFailDurations:-[AWDBasebandPowerToolKPIs causeCodeRACHFailDurationsAtIndex:](self, "causeCodeRACHFailDurationsAtIndex:", mm)];
    }
  }
  if ([(AWDBasebandPowerToolKPIs *)self causeCodeStruckInDCHARMUtilitysCount])
  {
    [a3 clearCauseCodeStruckInDCHARMUtilitys];
    unint64_t v33 = [(AWDBasebandPowerToolKPIs *)self causeCodeStruckInDCHARMUtilitysCount];
    if (v33)
    {
      unint64_t v34 = v33;
      for (nuint64_t n = 0; nn != v34; ++nn)
        [a3 addCauseCodeStruckInDCHARMUtility:-[AWDBasebandPowerToolKPIs causeCodeStruckInDCHARMUtilityAtIndex:](self, "causeCodeStruckInDCHARMUtilityAtIndex:", nn)];
    }
  }
  if ([(AWDBasebandPowerToolKPIs *)self causeCodeStruckInDCHDurationsCount])
  {
    [a3 clearCauseCodeStruckInDCHDurations];
    unint64_t v36 = [(AWDBasebandPowerToolKPIs *)self causeCodeStruckInDCHDurationsCount];
    if (v36)
    {
      unint64_t v37 = v36;
      for (uint64_t i1 = 0; i1 != v37; ++i1)
        [a3 addCauseCodeStruckInDCHDurations:-[AWDBasebandPowerToolKPIs causeCodeStruckInDCHDurationsAtIndex:](self, "causeCodeStruckInDCHDurationsAtIndex:", i1)];
    }
  }
  if ([(AWDBasebandPowerToolKPIs *)self causeCodeMarginalCoverageARMUtilitysCount])
  {
    [a3 clearCauseCodeMarginalCoverageARMUtilitys];
    unint64_t v39 = [(AWDBasebandPowerToolKPIs *)self causeCodeMarginalCoverageARMUtilitysCount];
    if (v39)
    {
      unint64_t v40 = v39;
      for (uint64_t i2 = 0; i2 != v40; ++i2)
        [a3 addCauseCodeMarginalCoverageARMUtility:-[AWDBasebandPowerToolKPIs causeCodeMarginalCoverageARMUtilityAtIndex:](self, "causeCodeMarginalCoverageARMUtilityAtIndex:", i2)];
    }
  }
  if ([(AWDBasebandPowerToolKPIs *)self causeCodeMarginalCoverageDurationsCount])
  {
    [a3 clearCauseCodeMarginalCoverageDurations];
    unint64_t v42 = [(AWDBasebandPowerToolKPIs *)self causeCodeMarginalCoverageDurationsCount];
    if (v42)
    {
      unint64_t v43 = v42;
      for (uint64_t i3 = 0; i3 != v43; ++i3)
        [a3 addCauseCodeMarginalCoverageDurations:-[AWDBasebandPowerToolKPIs causeCodeMarginalCoverageDurationsAtIndex:](self, "causeCodeMarginalCoverageDurationsAtIndex:", i3)];
    }
  }
  if ([(AWDBasebandPowerToolKPIs *)self causeCodeUnknownARMUtilitysCount])
  {
    [a3 clearCauseCodeUnknownARMUtilitys];
    unint64_t v45 = [(AWDBasebandPowerToolKPIs *)self causeCodeUnknownARMUtilitysCount];
    if (v45)
    {
      unint64_t v46 = v45;
      for (uint64_t i4 = 0; i4 != v46; ++i4)
        [a3 addCauseCodeUnknownARMUtility:-[AWDBasebandPowerToolKPIs causeCodeUnknownARMUtilityAtIndex:](self, "causeCodeUnknownARMUtilityAtIndex:", i4)];
    }
  }
  if ([(AWDBasebandPowerToolKPIs *)self causeCodeUnknownDurationsCount])
  {
    [a3 clearCauseCodeUnknownDurations];
    unint64_t v48 = [(AWDBasebandPowerToolKPIs *)self causeCodeUnknownDurationsCount];
    if (v48)
    {
      unint64_t v49 = v48;
      for (uint64_t i5 = 0; i5 != v49; ++i5)
        [a3 addCauseCodeUnknownDurations:[[self causeCodeUnknownDurationsAtIndex:i5]];
    }
  }
  if ([(AWDBasebandPowerToolKPIs *)self causeCodeCumulativeARMUtilitysCount])
  {
    [a3 clearCauseCodeCumulativeARMUtilitys];
    unint64_t v51 = [(AWDBasebandPowerToolKPIs *)self causeCodeCumulativeARMUtilitysCount];
    if (v51)
    {
      unint64_t v52 = v51;
      for (uint64_t i6 = 0; i6 != v52; ++i6)
        [a3 addCauseCodeCumulativeARMUtility:-[AWDBasebandPowerToolKPIs causeCodeCumulativeARMUtilityAtIndex:](self, "causeCodeCumulativeARMUtilityAtIndex:", i6)];
    }
  }
  if ([(AWDBasebandPowerToolKPIs *)self causeCodeCumulativeDurationsCount])
  {
    [a3 clearCauseCodeCumulativeDurations];
    unint64_t v54 = [(AWDBasebandPowerToolKPIs *)self causeCodeCumulativeDurationsCount];
    if (v54)
    {
      unint64_t v55 = v54;
      for (uint64_t i7 = 0; i7 != v55; ++i7)
        [a3 addCauseCodeCumulativeDurations:-[AWDBasebandPowerToolKPIs causeCodeCumulativeDurationsAtIndex:](self, "causeCodeCumulativeDurationsAtIndex:", i7)];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  unint64_t v5 = (void *)v4;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(_DWORD *)(v4 + 428) = self->_radarPriority;
    *(unsigned char *)(v4 + 432) |= 4u;
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(void *)(v4 + 416) = self->_timestamp;
  *(unsigned char *)(v4 + 432) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    *(_DWORD *)(v4 + 424) = self->_armUtilityThresholdPoint;
    *(unsigned char *)(v4 + 432) |= 2u;
  }
LABEL_5:
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  if (![a3 isMemberOfClass:objc_opt_class()]) {
    return 0;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)a3 + 432) & 1) == 0 || self->_timestamp != *((void *)a3 + 52)) {
      return 0;
    }
  }
  else if (*((unsigned char *)a3 + 432))
  {
    return 0;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)a3 + 432) & 4) == 0 || self->_radarPriority != *((_DWORD *)a3 + 107)) {
      return 0;
    }
  }
  else if ((*((unsigned char *)a3 + 432) & 4) != 0)
  {
    return 0;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)a3 + 432) & 2) == 0 || self->_armUtilityThresholdPoint != *((_DWORD *)a3 + 106)) {
      return 0;
    }
  }
  else if ((*((unsigned char *)a3 + 432) & 2) != 0)
  {
    return 0;
  }
  if (!PBRepeatedInt32IsEqual()
    || !PBRepeatedInt32IsEqual()
    || !PBRepeatedInt32IsEqual()
    || !PBRepeatedInt32IsEqual()
    || !PBRepeatedInt32IsEqual()
    || !PBRepeatedInt32IsEqual()
    || !PBRepeatedInt32IsEqual()
    || !PBRepeatedInt32IsEqual()
    || !PBRepeatedInt32IsEqual()
    || !PBRepeatedInt32IsEqual()
    || !PBRepeatedInt32IsEqual()
    || !PBRepeatedInt32IsEqual()
    || !PBRepeatedInt32IsEqual()
    || !PBRepeatedInt32IsEqual()
    || !PBRepeatedInt32IsEqual()
    || !PBRepeatedInt32IsEqual())
  {
    return 0;
  }

  return PBRepeatedInt32IsEqual();
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    unint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    goto LABEL_8;
  }
  unint64_t v2 = 2654435761u * self->_timestamp;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_radarPriority;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_armUtilityThresholdPoint;
LABEL_8:
  uint64_t v5 = v3 ^ v2 ^ v4 ^ PBRepeatedInt32Hash();
  uint64_t v6 = PBRepeatedInt32Hash();
  uint64_t v7 = v5 ^ v6 ^ PBRepeatedInt32Hash();
  uint64_t v8 = PBRepeatedInt32Hash();
  uint64_t v9 = v8 ^ PBRepeatedInt32Hash();
  uint64_t v10 = v7 ^ v9 ^ PBRepeatedInt32Hash();
  uint64_t v11 = PBRepeatedInt32Hash();
  uint64_t v12 = v11 ^ PBRepeatedInt32Hash();
  uint64_t v13 = v12 ^ PBRepeatedInt32Hash();
  uint64_t v14 = v10 ^ v13 ^ PBRepeatedInt32Hash();
  uint64_t v15 = PBRepeatedInt32Hash();
  uint64_t v16 = v15 ^ PBRepeatedInt32Hash();
  uint64_t v17 = v16 ^ PBRepeatedInt32Hash();
  uint64_t v18 = v17 ^ PBRepeatedInt32Hash();
  uint64_t v19 = v14 ^ v18 ^ PBRepeatedInt32Hash();
  uint64_t v20 = PBRepeatedInt32Hash();
  return v19 ^ v20 ^ PBRepeatedInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  char v5 = *((unsigned char *)a3 + 432);
  if (v5)
  {
    self->_timestamp = *((void *)a3 + 52);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)a3 + 432);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)a3 + 432) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_radarPriority = *((_DWORD *)a3 + 107);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)a3 + 432) & 2) != 0)
  {
LABEL_4:
    self->_armUtilityThresholdPoint = *((_DWORD *)a3 + 106);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_5:
  uint64_t v6 = [a3 armUtilityPDFsCount];
  if (v6)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
      -[AWDBasebandPowerToolKPIs addArmUtilityPDF:](self, "addArmUtilityPDF:", [a3 armUtilityPDFAtIndex:i]);
  }
  uint64_t v9 = [a3 causeCodeOOSARMUtilitysCount];
  if (v9)
  {
    uint64_t v10 = v9;
    for (uint64_t j = 0; j != v10; ++j)
      -[AWDBasebandPowerToolKPIs addCauseCodeOOSARMUtility:](self, "addCauseCodeOOSARMUtility:", [a3 causeCodeOOSARMUtilityAtIndex:j]);
  }
  uint64_t v12 = [a3 causeCodeOOSDurationsCount];
  if (v12)
  {
    uint64_t v13 = v12;
    for (uint64_t k = 0; k != v13; ++k)
      -[AWDBasebandPowerToolKPIs addCauseCodeOOSDurations:](self, "addCauseCodeOOSDurations:", [a3 causeCodeOOSDurationsAtIndex:k]);
  }
  uint64_t v15 = [a3 causeCodeTcXONotShuttingARMUtilitysCount];
  if (v15)
  {
    uint64_t v16 = v15;
    for (uint64_t m = 0; m != v16; ++m)
      -[AWDBasebandPowerToolKPIs addCauseCodeTcXONotShuttingARMUtility:](self, "addCauseCodeTcXONotShuttingARMUtility:", [a3 causeCodeTcXONotShuttingARMUtilityAtIndex:m]);
  }
  uint64_t v18 = [a3 causeCodeTcXONotShuttingDurationsCount];
  if (v18)
  {
    uint64_t v19 = v18;
    for (uint64_t n = 0; n != v19; ++n)
      -[AWDBasebandPowerToolKPIs addCauseCodeTcXONotShuttingDurations:](self, "addCauseCodeTcXONotShuttingDurations:", [a3 causeCodeTcXONotShuttingDurationsAtIndex:n]);
  }
  uint64_t v21 = [a3 causeCodeBackgroundActivityARMUtilitysCount];
  if (v21)
  {
    uint64_t v22 = v21;
    for (iuint64_t i = 0; ii != v22; ++ii)
      -[AWDBasebandPowerToolKPIs addCauseCodeBackgroundActivityARMUtility:](self, "addCauseCodeBackgroundActivityARMUtility:", [a3 causeCodeBackgroundActivityARMUtilityAtIndex:ii]);
  }
  uint64_t v24 = [a3 causeCodeBackgroundActivityDurationsCount];
  if (v24)
  {
    uint64_t v25 = v24;
    for (juint64_t j = 0; jj != v25; ++jj)
      -[AWDBasebandPowerToolKPIs addCauseCodeBackgroundActivityDurations:](self, "addCauseCodeBackgroundActivityDurations:", [a3 causeCodeBackgroundActivityDurationsAtIndex:jj]);
  }
  uint64_t v27 = [a3 causeCodeRACHFailARMUtilitysCount];
  if (v27)
  {
    uint64_t v28 = v27;
    for (kuint64_t k = 0; kk != v28; ++kk)
      -[AWDBasebandPowerToolKPIs addCauseCodeRACHFailARMUtility:](self, "addCauseCodeRACHFailARMUtility:", [a3 causeCodeRACHFailARMUtilityAtIndex:kk]);
  }
  uint64_t v30 = [a3 causeCodeRACHFailDurationsCount];
  if (v30)
  {
    uint64_t v31 = v30;
    for (muint64_t m = 0; mm != v31; ++mm)
      -[AWDBasebandPowerToolKPIs addCauseCodeRACHFailDurations:](self, "addCauseCodeRACHFailDurations:", [a3 causeCodeRACHFailDurationsAtIndex:mm]);
  }
  uint64_t v33 = [a3 causeCodeStruckInDCHARMUtilitysCount];
  if (v33)
  {
    uint64_t v34 = v33;
    for (nuint64_t n = 0; nn != v34; ++nn)
      -[AWDBasebandPowerToolKPIs addCauseCodeStruckInDCHARMUtility:](self, "addCauseCodeStruckInDCHARMUtility:", [a3 causeCodeStruckInDCHARMUtilityAtIndex:nn]);
  }
  uint64_t v36 = [a3 causeCodeStruckInDCHDurationsCount];
  if (v36)
  {
    uint64_t v37 = v36;
    for (uint64_t i1 = 0; i1 != v37; ++i1)
      -[AWDBasebandPowerToolKPIs addCauseCodeStruckInDCHDurations:](self, "addCauseCodeStruckInDCHDurations:", [a3 causeCodeStruckInDCHDurationsAtIndex:i1]);
  }
  uint64_t v39 = [a3 causeCodeMarginalCoverageARMUtilitysCount];
  if (v39)
  {
    uint64_t v40 = v39;
    for (uint64_t i2 = 0; i2 != v40; ++i2)
      -[AWDBasebandPowerToolKPIs addCauseCodeMarginalCoverageARMUtility:](self, "addCauseCodeMarginalCoverageARMUtility:", [a3 causeCodeMarginalCoverageARMUtilityAtIndex:i2]);
  }
  uint64_t v42 = [a3 causeCodeMarginalCoverageDurationsCount];
  if (v42)
  {
    uint64_t v43 = v42;
    for (uint64_t i3 = 0; i3 != v43; ++i3)
      -[AWDBasebandPowerToolKPIs addCauseCodeMarginalCoverageDurations:](self, "addCauseCodeMarginalCoverageDurations:", [a3 causeCodeMarginalCoverageDurationsAtIndex:i3]);
  }
  uint64_t v45 = [a3 causeCodeUnknownARMUtilitysCount];
  if (v45)
  {
    uint64_t v46 = v45;
    for (uint64_t i4 = 0; i4 != v46; ++i4)
      -[AWDBasebandPowerToolKPIs addCauseCodeUnknownARMUtility:](self, "addCauseCodeUnknownARMUtility:", [a3 causeCodeUnknownARMUtilityAtIndex:i4]);
  }
  uint64_t v48 = [a3 causeCodeUnknownDurationsCount];
  if (v48)
  {
    uint64_t v49 = v48;
    for (uint64_t i5 = 0; i5 != v49; ++i5)
      -[AWDBasebandPowerToolKPIs addCauseCodeUnknownDurations:](self, "addCauseCodeUnknownDurations:", [a3 causeCodeUnknownDurationsAtIndex:i5]);
  }
  uint64_t v51 = [a3 causeCodeCumulativeARMUtilitysCount];
  if (v51)
  {
    uint64_t v52 = v51;
    for (uint64_t i6 = 0; i6 != v52; ++i6)
      -[AWDBasebandPowerToolKPIs addCauseCodeCumulativeARMUtility:](self, "addCauseCodeCumulativeARMUtility:", [a3 causeCodeCumulativeARMUtilityAtIndex:i6]);
  }
  uint64_t v54 = [a3 causeCodeCumulativeDurationsCount];
  if (v54)
  {
    uint64_t v55 = v54;
    for (uint64_t i7 = 0; i7 != v55; ++i7)
      -[AWDBasebandPowerToolKPIs addCauseCodeCumulativeDurations:](self, "addCauseCodeCumulativeDurations:", [a3 causeCodeCumulativeDurationsAtIndex:i7]);
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int)radarPriority
{
  return self->_radarPriority;
}

- (int)armUtilityThresholdPoint
{
  return self->_armUtilityThresholdPoint;
}

@end