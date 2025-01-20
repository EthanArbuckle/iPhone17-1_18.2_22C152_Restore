@interface OTAParamRC
- (BOOL)hasBaselineR0;
- (BOOL)hasBaselineR1;
- (BOOL)hasBaselineR2;
- (BOOL)hasBaselineR3;
- (BOOL)hasBaselineR4;
- (BOOL)hasBaselineRCFreq1;
- (BOOL)hasBaselineRCFreq2;
- (BOOL)hasBaselineRCFreq3;
- (BOOL)hasBaselineRCFreq4;
- (BOOL)hasBaselineWRdc;
- (BOOL)hasBmuResistance;
- (BOOL)hasMLBConfig;
- (BOOL)hasMaxRdcR25Ratio;
- (BOOL)hasMaxRdcRatio;
- (BOOL)hasMaxRdcRatioR2Extrap;
- (BOOL)hasR0;
- (BOOL)hasR1;
- (BOOL)hasR2;
- (BOOL)hasR3;
- (BOOL)hasRCFreq1;
- (BOOL)hasRCFreq2;
- (BOOL)hasRCFreq3;
- (BOOL)hasRCFreq4;
- (BOOL)hasRdc;
- (BOOL)hasWRdcRatioThresh;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (OTABMUResistance)bmuResistance;
- (OTAResistanceData)baselineR0;
- (OTAResistanceData)baselineR1;
- (OTAResistanceData)baselineR2;
- (OTAResistanceData)baselineR3;
- (OTAResistanceData)baselineR4;
- (OTAResistanceData)baselineRCFreq1;
- (OTAResistanceData)baselineRCFreq2;
- (OTAResistanceData)baselineRCFreq3;
- (OTAResistanceData)baselineRCFreq4;
- (OTAResistanceData)r0;
- (OTAResistanceData)r1;
- (OTAResistanceData)r2;
- (OTAResistanceData)r3;
- (OTAResistanceData)rCFreq1;
- (OTAResistanceData)rCFreq2;
- (OTAResistanceData)rCFreq3;
- (OTAResistanceData)rCFreq4;
- (OTAResistanceData)rdc;
- (float)agingCoeffForR0AtIndex:(unint64_t)a3;
- (float)agingCoeffForR0TemperatureCoeffAtIndex:(unint64_t)a3;
- (float)agingCoeffForR0TemperatureCoeffs;
- (float)agingCoeffForR0s;
- (float)agingCoeffForR1AtIndex:(unint64_t)a3;
- (float)agingCoeffForR1TemperatureCoeffAtIndex:(unint64_t)a3;
- (float)agingCoeffForR1TemperatureCoeffs;
- (float)agingCoeffForR1s;
- (float)agingCoeffForR2AtIndex:(unint64_t)a3;
- (float)agingCoeffForR2TemperatureCoeffAtIndex:(unint64_t)a3;
- (float)agingCoeffForR2TemperatureCoeffs;
- (float)agingCoeffForR2s;
- (float)agingCoeffForR3AtIndex:(unint64_t)a3;
- (float)agingCoeffForR3TemperatureCoeffAtIndex:(unint64_t)a3;
- (float)agingCoeffForR3TemperatureCoeffs;
- (float)agingCoeffForR3s;
- (float)agingCoeffForRCFreq1AtIndex:(unint64_t)a3;
- (float)agingCoeffForRCFreq1TemperatureCoeffAtIndex:(unint64_t)a3;
- (float)agingCoeffForRCFreq1TemperatureCoeffs;
- (float)agingCoeffForRCFreq1s;
- (float)agingCoeffForRCFreq2AtIndex:(unint64_t)a3;
- (float)agingCoeffForRCFreq2TemperatureCoeffAtIndex:(unint64_t)a3;
- (float)agingCoeffForRCFreq2TemperatureCoeffs;
- (float)agingCoeffForRCFreq2s;
- (float)agingCoeffForRCFreq3AtIndex:(unint64_t)a3;
- (float)agingCoeffForRCFreq3TemperatureCoeffAtIndex:(unint64_t)a3;
- (float)agingCoeffForRCFreq3TemperatureCoeffs;
- (float)agingCoeffForRCFreq3s;
- (float)agingCoeffForRCFreq4AtIndex:(unint64_t)a3;
- (float)agingCoeffForRCFreq4TemperatureCoeffAtIndex:(unint64_t)a3;
- (float)agingCoeffForRCFreq4TemperatureCoeffs;
- (float)agingCoeffForRCFreq4s;
- (float)agingCoeffForRdcAtIndex:(unint64_t)a3;
- (float)agingCoeffForRdcTemperatureCoeffAtIndex:(unint64_t)a3;
- (float)agingCoeffForRdcTemperatureCoeffs;
- (float)agingCoeffForRdcs;
- (float)baselineRdcAtIndex:(unint64_t)a3;
- (float)baselineRdcs;
- (float)baselineWRdc;
- (float)coeffSOCAtIndex:(unint64_t)a3;
- (float)coeffSOCs;
- (float)coeffVAtIndex:(unint64_t)a3;
- (float)coeffVs;
- (float)gridOCVAtIndex:(unint64_t)a3;
- (float)gridOCVs;
- (float)gridWRdcRatioAtIndex:(unint64_t)a3;
- (float)gridWRdcRatios;
- (float)maxRdcR25Ratio;
- (float)maxRdcRatio;
- (float)maxRdcRatioR2Extrap;
- (float)qmaxAtIndex:(unint64_t)a3;
- (float)qmaxs;
- (float)slopeForR0ExtrapAtIndex:(unint64_t)a3;
- (float)slopeForR0Extraps;
- (float)slopeForR1ExtrapAtIndex:(unint64_t)a3;
- (float)slopeForR1Extraps;
- (float)slopeForR2ExtrapAtIndex:(unint64_t)a3;
- (float)slopeForR2Extraps;
- (float)slopeForR3ExtrapAtIndex:(unint64_t)a3;
- (float)slopeForR3Extraps;
- (float)wRdcRatioThresh;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)mLBConfigAsString:(int)a3;
- (int)StringAsMLBConfig:(id)a3;
- (int)mLBConfig;
- (unint64_t)agingCoeffForR0TemperatureCoeffsCount;
- (unint64_t)agingCoeffForR0sCount;
- (unint64_t)agingCoeffForR1TemperatureCoeffsCount;
- (unint64_t)agingCoeffForR1sCount;
- (unint64_t)agingCoeffForR2TemperatureCoeffsCount;
- (unint64_t)agingCoeffForR2sCount;
- (unint64_t)agingCoeffForR3TemperatureCoeffsCount;
- (unint64_t)agingCoeffForR3sCount;
- (unint64_t)agingCoeffForRCFreq1TemperatureCoeffsCount;
- (unint64_t)agingCoeffForRCFreq1sCount;
- (unint64_t)agingCoeffForRCFreq2TemperatureCoeffsCount;
- (unint64_t)agingCoeffForRCFreq2sCount;
- (unint64_t)agingCoeffForRCFreq3TemperatureCoeffsCount;
- (unint64_t)agingCoeffForRCFreq3sCount;
- (unint64_t)agingCoeffForRCFreq4TemperatureCoeffsCount;
- (unint64_t)agingCoeffForRCFreq4sCount;
- (unint64_t)agingCoeffForRdcTemperatureCoeffsCount;
- (unint64_t)agingCoeffForRdcsCount;
- (unint64_t)baselineRdcsCount;
- (unint64_t)coeffSOCsCount;
- (unint64_t)coeffVsCount;
- (unint64_t)gridOCVsCount;
- (unint64_t)gridWRdcRatiosCount;
- (unint64_t)hash;
- (unint64_t)qmaxsCount;
- (unint64_t)slopeForR0ExtrapsCount;
- (unint64_t)slopeForR1ExtrapsCount;
- (unint64_t)slopeForR2ExtrapsCount;
- (unint64_t)slopeForR3ExtrapsCount;
- (unsigned)chemID;
- (void)addAgingCoeffForR0:(float)a3;
- (void)addAgingCoeffForR0TemperatureCoeff:(float)a3;
- (void)addAgingCoeffForR1:(float)a3;
- (void)addAgingCoeffForR1TemperatureCoeff:(float)a3;
- (void)addAgingCoeffForR2:(float)a3;
- (void)addAgingCoeffForR2TemperatureCoeff:(float)a3;
- (void)addAgingCoeffForR3:(float)a3;
- (void)addAgingCoeffForR3TemperatureCoeff:(float)a3;
- (void)addAgingCoeffForRCFreq1:(float)a3;
- (void)addAgingCoeffForRCFreq1TemperatureCoeff:(float)a3;
- (void)addAgingCoeffForRCFreq2:(float)a3;
- (void)addAgingCoeffForRCFreq2TemperatureCoeff:(float)a3;
- (void)addAgingCoeffForRCFreq3:(float)a3;
- (void)addAgingCoeffForRCFreq3TemperatureCoeff:(float)a3;
- (void)addAgingCoeffForRCFreq4:(float)a3;
- (void)addAgingCoeffForRCFreq4TemperatureCoeff:(float)a3;
- (void)addAgingCoeffForRdc:(float)a3;
- (void)addAgingCoeffForRdcTemperatureCoeff:(float)a3;
- (void)addBaselineRdc:(float)a3;
- (void)addCoeffSOC:(float)a3;
- (void)addCoeffV:(float)a3;
- (void)addGridOCV:(float)a3;
- (void)addGridWRdcRatio:(float)a3;
- (void)addQmax:(float)a3;
- (void)addSlopeForR0Extrap:(float)a3;
- (void)addSlopeForR1Extrap:(float)a3;
- (void)addSlopeForR2Extrap:(float)a3;
- (void)addSlopeForR3Extrap:(float)a3;
- (void)clearAgingCoeffForR0TemperatureCoeffs;
- (void)clearAgingCoeffForR0s;
- (void)clearAgingCoeffForR1TemperatureCoeffs;
- (void)clearAgingCoeffForR1s;
- (void)clearAgingCoeffForR2TemperatureCoeffs;
- (void)clearAgingCoeffForR2s;
- (void)clearAgingCoeffForR3TemperatureCoeffs;
- (void)clearAgingCoeffForR3s;
- (void)clearAgingCoeffForRCFreq1TemperatureCoeffs;
- (void)clearAgingCoeffForRCFreq1s;
- (void)clearAgingCoeffForRCFreq2TemperatureCoeffs;
- (void)clearAgingCoeffForRCFreq2s;
- (void)clearAgingCoeffForRCFreq3TemperatureCoeffs;
- (void)clearAgingCoeffForRCFreq3s;
- (void)clearAgingCoeffForRCFreq4TemperatureCoeffs;
- (void)clearAgingCoeffForRCFreq4s;
- (void)clearAgingCoeffForRdcTemperatureCoeffs;
- (void)clearAgingCoeffForRdcs;
- (void)clearBaselineRdcs;
- (void)clearCoeffSOCs;
- (void)clearCoeffVs;
- (void)clearGridOCVs;
- (void)clearGridWRdcRatios;
- (void)clearQmaxs;
- (void)clearSlopeForR0Extraps;
- (void)clearSlopeForR1Extraps;
- (void)clearSlopeForR2Extraps;
- (void)clearSlopeForR3Extraps;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAgingCoeffForR0TemperatureCoeffs:(float *)a3 count:(unint64_t)a4;
- (void)setAgingCoeffForR0s:(float *)a3 count:(unint64_t)a4;
- (void)setAgingCoeffForR1TemperatureCoeffs:(float *)a3 count:(unint64_t)a4;
- (void)setAgingCoeffForR1s:(float *)a3 count:(unint64_t)a4;
- (void)setAgingCoeffForR2TemperatureCoeffs:(float *)a3 count:(unint64_t)a4;
- (void)setAgingCoeffForR2s:(float *)a3 count:(unint64_t)a4;
- (void)setAgingCoeffForR3TemperatureCoeffs:(float *)a3 count:(unint64_t)a4;
- (void)setAgingCoeffForR3s:(float *)a3 count:(unint64_t)a4;
- (void)setAgingCoeffForRCFreq1TemperatureCoeffs:(float *)a3 count:(unint64_t)a4;
- (void)setAgingCoeffForRCFreq1s:(float *)a3 count:(unint64_t)a4;
- (void)setAgingCoeffForRCFreq2TemperatureCoeffs:(float *)a3 count:(unint64_t)a4;
- (void)setAgingCoeffForRCFreq2s:(float *)a3 count:(unint64_t)a4;
- (void)setAgingCoeffForRCFreq3TemperatureCoeffs:(float *)a3 count:(unint64_t)a4;
- (void)setAgingCoeffForRCFreq3s:(float *)a3 count:(unint64_t)a4;
- (void)setAgingCoeffForRCFreq4TemperatureCoeffs:(float *)a3 count:(unint64_t)a4;
- (void)setAgingCoeffForRCFreq4s:(float *)a3 count:(unint64_t)a4;
- (void)setAgingCoeffForRdcTemperatureCoeffs:(float *)a3 count:(unint64_t)a4;
- (void)setAgingCoeffForRdcs:(float *)a3 count:(unint64_t)a4;
- (void)setBaselineR0:(id)a3;
- (void)setBaselineR1:(id)a3;
- (void)setBaselineR2:(id)a3;
- (void)setBaselineR3:(id)a3;
- (void)setBaselineR4:(id)a3;
- (void)setBaselineRCFreq1:(id)a3;
- (void)setBaselineRCFreq2:(id)a3;
- (void)setBaselineRCFreq3:(id)a3;
- (void)setBaselineRCFreq4:(id)a3;
- (void)setBaselineRdcs:(float *)a3 count:(unint64_t)a4;
- (void)setBaselineWRdc:(float)a3;
- (void)setBmuResistance:(id)a3;
- (void)setChemID:(unsigned int)a3;
- (void)setCoeffSOCs:(float *)a3 count:(unint64_t)a4;
- (void)setCoeffVs:(float *)a3 count:(unint64_t)a4;
- (void)setGridOCVs:(float *)a3 count:(unint64_t)a4;
- (void)setGridWRdcRatios:(float *)a3 count:(unint64_t)a4;
- (void)setHasBaselineWRdc:(BOOL)a3;
- (void)setHasMLBConfig:(BOOL)a3;
- (void)setHasMaxRdcR25Ratio:(BOOL)a3;
- (void)setHasMaxRdcRatio:(BOOL)a3;
- (void)setHasMaxRdcRatioR2Extrap:(BOOL)a3;
- (void)setHasWRdcRatioThresh:(BOOL)a3;
- (void)setMLBConfig:(int)a3;
- (void)setMaxRdcR25Ratio:(float)a3;
- (void)setMaxRdcRatio:(float)a3;
- (void)setMaxRdcRatioR2Extrap:(float)a3;
- (void)setQmaxs:(float *)a3 count:(unint64_t)a4;
- (void)setR0:(id)a3;
- (void)setR1:(id)a3;
- (void)setR2:(id)a3;
- (void)setR3:(id)a3;
- (void)setRCFreq1:(id)a3;
- (void)setRCFreq2:(id)a3;
- (void)setRCFreq3:(id)a3;
- (void)setRCFreq4:(id)a3;
- (void)setRdc:(id)a3;
- (void)setSlopeForR0Extraps:(float *)a3 count:(unint64_t)a4;
- (void)setSlopeForR1Extraps:(float *)a3 count:(unint64_t)a4;
- (void)setSlopeForR2Extraps:(float *)a3 count:(unint64_t)a4;
- (void)setSlopeForR3Extraps:(float *)a3 count:(unint64_t)a4;
- (void)setWRdcRatioThresh:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation OTAParamRC

- (void)dealloc
{
  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  v3.receiver = self;
  v3.super_class = (Class)OTAParamRC;
  [(OTAParamRC *)&v3 dealloc];
}

- (BOOL)hasR0
{
  return self->_r0 != 0;
}

- (BOOL)hasR1
{
  return self->_r1 != 0;
}

- (BOOL)hasBaselineR1
{
  return self->_baselineR1 != 0;
}

- (BOOL)hasR2
{
  return self->_r2 != 0;
}

- (BOOL)hasBaselineR2
{
  return self->_baselineR2 != 0;
}

- (BOOL)hasRCFreq1
{
  return self->_rCFreq1 != 0;
}

- (BOOL)hasRCFreq2
{
  return self->_rCFreq2 != 0;
}

- (BOOL)hasRCFreq3
{
  return self->_rCFreq3 != 0;
}

- (unint64_t)agingCoeffForR0sCount
{
  return self->_agingCoeffForR0s.count;
}

- (float)agingCoeffForR0s
{
  return self->_agingCoeffForR0s.list;
}

- (void)clearAgingCoeffForR0s
{
}

- (void)addAgingCoeffForR0:(float)a3
{
}

- (float)agingCoeffForR0AtIndex:(unint64_t)a3
{
  p_agingCoeffForR0s = &self->_agingCoeffForR0s;
  unint64_t count = self->_agingCoeffForR0s.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_agingCoeffForR0s->list[a3];
}

- (void)setAgingCoeffForR0s:(float *)a3 count:(unint64_t)a4
{
}

- (unint64_t)agingCoeffForR0TemperatureCoeffsCount
{
  return self->_agingCoeffForR0TemperatureCoeffs.count;
}

- (float)agingCoeffForR0TemperatureCoeffs
{
  return self->_agingCoeffForR0TemperatureCoeffs.list;
}

- (void)clearAgingCoeffForR0TemperatureCoeffs
{
}

- (void)addAgingCoeffForR0TemperatureCoeff:(float)a3
{
}

- (float)agingCoeffForR0TemperatureCoeffAtIndex:(unint64_t)a3
{
  p_agingCoeffForR0TemperatureCoeffs = &self->_agingCoeffForR0TemperatureCoeffs;
  unint64_t count = self->_agingCoeffForR0TemperatureCoeffs.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_agingCoeffForR0TemperatureCoeffs->list[a3];
}

- (void)setAgingCoeffForR0TemperatureCoeffs:(float *)a3 count:(unint64_t)a4
{
}

- (unint64_t)agingCoeffForR1sCount
{
  return self->_agingCoeffForR1s.count;
}

- (float)agingCoeffForR1s
{
  return self->_agingCoeffForR1s.list;
}

- (void)clearAgingCoeffForR1s
{
}

- (void)addAgingCoeffForR1:(float)a3
{
}

- (float)agingCoeffForR1AtIndex:(unint64_t)a3
{
  p_agingCoeffForR1s = &self->_agingCoeffForR1s;
  unint64_t count = self->_agingCoeffForR1s.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_agingCoeffForR1s->list[a3];
}

- (void)setAgingCoeffForR1s:(float *)a3 count:(unint64_t)a4
{
}

- (unint64_t)agingCoeffForR1TemperatureCoeffsCount
{
  return self->_agingCoeffForR1TemperatureCoeffs.count;
}

- (float)agingCoeffForR1TemperatureCoeffs
{
  return self->_agingCoeffForR1TemperatureCoeffs.list;
}

- (void)clearAgingCoeffForR1TemperatureCoeffs
{
}

- (void)addAgingCoeffForR1TemperatureCoeff:(float)a3
{
}

- (float)agingCoeffForR1TemperatureCoeffAtIndex:(unint64_t)a3
{
  p_agingCoeffForR1TemperatureCoeffs = &self->_agingCoeffForR1TemperatureCoeffs;
  unint64_t count = self->_agingCoeffForR1TemperatureCoeffs.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_agingCoeffForR1TemperatureCoeffs->list[a3];
}

- (void)setAgingCoeffForR1TemperatureCoeffs:(float *)a3 count:(unint64_t)a4
{
}

- (unint64_t)agingCoeffForR2sCount
{
  return self->_agingCoeffForR2s.count;
}

- (float)agingCoeffForR2s
{
  return self->_agingCoeffForR2s.list;
}

- (void)clearAgingCoeffForR2s
{
}

- (void)addAgingCoeffForR2:(float)a3
{
}

- (float)agingCoeffForR2AtIndex:(unint64_t)a3
{
  p_agingCoeffForR2s = &self->_agingCoeffForR2s;
  unint64_t count = self->_agingCoeffForR2s.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_agingCoeffForR2s->list[a3];
}

- (void)setAgingCoeffForR2s:(float *)a3 count:(unint64_t)a4
{
}

- (unint64_t)agingCoeffForR2TemperatureCoeffsCount
{
  return self->_agingCoeffForR2TemperatureCoeffs.count;
}

- (float)agingCoeffForR2TemperatureCoeffs
{
  return self->_agingCoeffForR2TemperatureCoeffs.list;
}

- (void)clearAgingCoeffForR2TemperatureCoeffs
{
}

- (void)addAgingCoeffForR2TemperatureCoeff:(float)a3
{
}

- (float)agingCoeffForR2TemperatureCoeffAtIndex:(unint64_t)a3
{
  p_agingCoeffForR2TemperatureCoeffs = &self->_agingCoeffForR2TemperatureCoeffs;
  unint64_t count = self->_agingCoeffForR2TemperatureCoeffs.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_agingCoeffForR2TemperatureCoeffs->list[a3];
}

- (void)setAgingCoeffForR2TemperatureCoeffs:(float *)a3 count:(unint64_t)a4
{
}

- (unint64_t)baselineRdcsCount
{
  return self->_baselineRdcs.count;
}

- (float)baselineRdcs
{
  return self->_baselineRdcs.list;
}

- (void)clearBaselineRdcs
{
}

- (void)addBaselineRdc:(float)a3
{
}

- (float)baselineRdcAtIndex:(unint64_t)a3
{
  p_baselineRdcs = &self->_baselineRdcs;
  unint64_t count = self->_baselineRdcs.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_baselineRdcs->list[a3];
}

- (void)setBaselineRdcs:(float *)a3 count:(unint64_t)a4
{
}

- (BOOL)hasBaselineR0
{
  return self->_baselineR0 != 0;
}

- (BOOL)hasBmuResistance
{
  return self->_bmuResistance != 0;
}

- (unint64_t)gridOCVsCount
{
  return self->_gridOCVs.count;
}

- (float)gridOCVs
{
  return self->_gridOCVs.list;
}

- (void)clearGridOCVs
{
}

- (void)addGridOCV:(float)a3
{
}

- (float)gridOCVAtIndex:(unint64_t)a3
{
  p_gridOCVs = &self->_gridOCVs;
  unint64_t count = self->_gridOCVs.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_gridOCVs->list[a3];
}

- (void)setGridOCVs:(float *)a3 count:(unint64_t)a4
{
}

- (BOOL)hasBaselineR3
{
  return self->_baselineR3 != 0;
}

- (void)setMaxRdcRatio:(float)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_maxRdcRatio = a3;
}

- (void)setHasMaxRdcRatio:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMaxRdcRatio
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setMaxRdcRatioR2Extrap:(float)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_maxRdcRatioR2Extrap = a3;
}

- (void)setHasMaxRdcRatioR2Extrap:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasMaxRdcRatioR2Extrap
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setBaselineWRdc:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_baselineWRdc = a3;
}

- (void)setHasBaselineWRdc:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBaselineWRdc
{
  return *(unsigned char *)&self->_has & 1;
}

- (unint64_t)slopeForR0ExtrapsCount
{
  return self->_slopeForR0Extraps.count;
}

- (float)slopeForR0Extraps
{
  return self->_slopeForR0Extraps.list;
}

- (void)clearSlopeForR0Extraps
{
}

- (void)addSlopeForR0Extrap:(float)a3
{
}

- (float)slopeForR0ExtrapAtIndex:(unint64_t)a3
{
  p_slopeForR0Extraps = &self->_slopeForR0Extraps;
  unint64_t count = self->_slopeForR0Extraps.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_slopeForR0Extraps->list[a3];
}

- (void)setSlopeForR0Extraps:(float *)a3 count:(unint64_t)a4
{
}

- (unint64_t)slopeForR1ExtrapsCount
{
  return self->_slopeForR1Extraps.count;
}

- (float)slopeForR1Extraps
{
  return self->_slopeForR1Extraps.list;
}

- (void)clearSlopeForR1Extraps
{
}

- (void)addSlopeForR1Extrap:(float)a3
{
}

- (float)slopeForR1ExtrapAtIndex:(unint64_t)a3
{
  p_slopeForR1Extraps = &self->_slopeForR1Extraps;
  unint64_t count = self->_slopeForR1Extraps.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_slopeForR1Extraps->list[a3];
}

- (void)setSlopeForR1Extraps:(float *)a3 count:(unint64_t)a4
{
}

- (unint64_t)slopeForR2ExtrapsCount
{
  return self->_slopeForR2Extraps.count;
}

- (float)slopeForR2Extraps
{
  return self->_slopeForR2Extraps.list;
}

- (void)clearSlopeForR2Extraps
{
}

- (void)addSlopeForR2Extrap:(float)a3
{
}

- (float)slopeForR2ExtrapAtIndex:(unint64_t)a3
{
  p_slopeForR2Extraps = &self->_slopeForR2Extraps;
  unint64_t count = self->_slopeForR2Extraps.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_slopeForR2Extraps->list[a3];
}

- (void)setSlopeForR2Extraps:(float *)a3 count:(unint64_t)a4
{
}

- (unint64_t)slopeForR3ExtrapsCount
{
  return self->_slopeForR3Extraps.count;
}

- (float)slopeForR3Extraps
{
  return self->_slopeForR3Extraps.list;
}

- (void)clearSlopeForR3Extraps
{
}

- (void)addSlopeForR3Extrap:(float)a3
{
}

- (float)slopeForR3ExtrapAtIndex:(unint64_t)a3
{
  p_slopeForR3Extraps = &self->_slopeForR3Extraps;
  unint64_t count = self->_slopeForR3Extraps.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_slopeForR3Extraps->list[a3];
}

- (void)setSlopeForR3Extraps:(float *)a3 count:(unint64_t)a4
{
}

- (BOOL)hasR3
{
  return self->_r3 != 0;
}

- (BOOL)hasRCFreq4
{
  return self->_rCFreq4 != 0;
}

- (BOOL)hasBaselineR4
{
  return self->_baselineR4 != 0;
}

- (BOOL)hasBaselineRCFreq1
{
  return self->_baselineRCFreq1 != 0;
}

- (BOOL)hasBaselineRCFreq2
{
  return self->_baselineRCFreq2 != 0;
}

- (BOOL)hasBaselineRCFreq3
{
  return self->_baselineRCFreq3 != 0;
}

- (BOOL)hasBaselineRCFreq4
{
  return self->_baselineRCFreq4 != 0;
}

- (unint64_t)agingCoeffForR3sCount
{
  return self->_agingCoeffForR3s.count;
}

- (float)agingCoeffForR3s
{
  return self->_agingCoeffForR3s.list;
}

- (void)clearAgingCoeffForR3s
{
}

- (void)addAgingCoeffForR3:(float)a3
{
}

- (float)agingCoeffForR3AtIndex:(unint64_t)a3
{
  p_agingCoeffForR3s = &self->_agingCoeffForR3s;
  unint64_t count = self->_agingCoeffForR3s.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_agingCoeffForR3s->list[a3];
}

- (void)setAgingCoeffForR3s:(float *)a3 count:(unint64_t)a4
{
}

- (unint64_t)agingCoeffForR3TemperatureCoeffsCount
{
  return self->_agingCoeffForR3TemperatureCoeffs.count;
}

- (float)agingCoeffForR3TemperatureCoeffs
{
  return self->_agingCoeffForR3TemperatureCoeffs.list;
}

- (void)clearAgingCoeffForR3TemperatureCoeffs
{
}

- (void)addAgingCoeffForR3TemperatureCoeff:(float)a3
{
}

- (float)agingCoeffForR3TemperatureCoeffAtIndex:(unint64_t)a3
{
  p_agingCoeffForR3TemperatureCoeffs = &self->_agingCoeffForR3TemperatureCoeffs;
  unint64_t count = self->_agingCoeffForR3TemperatureCoeffs.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_agingCoeffForR3TemperatureCoeffs->list[a3];
}

- (void)setAgingCoeffForR3TemperatureCoeffs:(float *)a3 count:(unint64_t)a4
{
}

- (unint64_t)agingCoeffForRCFreq1sCount
{
  return self->_agingCoeffForRCFreq1s.count;
}

- (float)agingCoeffForRCFreq1s
{
  return self->_agingCoeffForRCFreq1s.list;
}

- (void)clearAgingCoeffForRCFreq1s
{
}

- (void)addAgingCoeffForRCFreq1:(float)a3
{
}

- (float)agingCoeffForRCFreq1AtIndex:(unint64_t)a3
{
  p_agingCoeffForRCFreq1s = &self->_agingCoeffForRCFreq1s;
  unint64_t count = self->_agingCoeffForRCFreq1s.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_agingCoeffForRCFreq1s->list[a3];
}

- (void)setAgingCoeffForRCFreq1s:(float *)a3 count:(unint64_t)a4
{
}

- (unint64_t)agingCoeffForRCFreq2sCount
{
  return self->_agingCoeffForRCFreq2s.count;
}

- (float)agingCoeffForRCFreq2s
{
  return self->_agingCoeffForRCFreq2s.list;
}

- (void)clearAgingCoeffForRCFreq2s
{
}

- (void)addAgingCoeffForRCFreq2:(float)a3
{
}

- (float)agingCoeffForRCFreq2AtIndex:(unint64_t)a3
{
  p_agingCoeffForRCFreq2s = &self->_agingCoeffForRCFreq2s;
  unint64_t count = self->_agingCoeffForRCFreq2s.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_agingCoeffForRCFreq2s->list[a3];
}

- (void)setAgingCoeffForRCFreq2s:(float *)a3 count:(unint64_t)a4
{
}

- (unint64_t)agingCoeffForRCFreq3sCount
{
  return self->_agingCoeffForRCFreq3s.count;
}

- (float)agingCoeffForRCFreq3s
{
  return self->_agingCoeffForRCFreq3s.list;
}

- (void)clearAgingCoeffForRCFreq3s
{
}

- (void)addAgingCoeffForRCFreq3:(float)a3
{
}

- (float)agingCoeffForRCFreq3AtIndex:(unint64_t)a3
{
  p_agingCoeffForRCFreq3s = &self->_agingCoeffForRCFreq3s;
  unint64_t count = self->_agingCoeffForRCFreq3s.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_agingCoeffForRCFreq3s->list[a3];
}

- (void)setAgingCoeffForRCFreq3s:(float *)a3 count:(unint64_t)a4
{
}

- (unint64_t)agingCoeffForRCFreq4sCount
{
  return self->_agingCoeffForRCFreq4s.count;
}

- (float)agingCoeffForRCFreq4s
{
  return self->_agingCoeffForRCFreq4s.list;
}

- (void)clearAgingCoeffForRCFreq4s
{
}

- (void)addAgingCoeffForRCFreq4:(float)a3
{
}

- (float)agingCoeffForRCFreq4AtIndex:(unint64_t)a3
{
  p_agingCoeffForRCFreq4s = &self->_agingCoeffForRCFreq4s;
  unint64_t count = self->_agingCoeffForRCFreq4s.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_agingCoeffForRCFreq4s->list[a3];
}

- (void)setAgingCoeffForRCFreq4s:(float *)a3 count:(unint64_t)a4
{
}

- (unint64_t)agingCoeffForRCFreq1TemperatureCoeffsCount
{
  return self->_agingCoeffForRCFreq1TemperatureCoeffs.count;
}

- (float)agingCoeffForRCFreq1TemperatureCoeffs
{
  return self->_agingCoeffForRCFreq1TemperatureCoeffs.list;
}

- (void)clearAgingCoeffForRCFreq1TemperatureCoeffs
{
}

- (void)addAgingCoeffForRCFreq1TemperatureCoeff:(float)a3
{
}

- (float)agingCoeffForRCFreq1TemperatureCoeffAtIndex:(unint64_t)a3
{
  p_agingCoeffForRCFreq1TemperatureCoeffs = &self->_agingCoeffForRCFreq1TemperatureCoeffs;
  unint64_t count = self->_agingCoeffForRCFreq1TemperatureCoeffs.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_agingCoeffForRCFreq1TemperatureCoeffs->list[a3];
}

- (void)setAgingCoeffForRCFreq1TemperatureCoeffs:(float *)a3 count:(unint64_t)a4
{
}

- (unint64_t)agingCoeffForRCFreq2TemperatureCoeffsCount
{
  return self->_agingCoeffForRCFreq2TemperatureCoeffs.count;
}

- (float)agingCoeffForRCFreq2TemperatureCoeffs
{
  return self->_agingCoeffForRCFreq2TemperatureCoeffs.list;
}

- (void)clearAgingCoeffForRCFreq2TemperatureCoeffs
{
}

- (void)addAgingCoeffForRCFreq2TemperatureCoeff:(float)a3
{
}

- (float)agingCoeffForRCFreq2TemperatureCoeffAtIndex:(unint64_t)a3
{
  p_agingCoeffForRCFreq2TemperatureCoeffs = &self->_agingCoeffForRCFreq2TemperatureCoeffs;
  unint64_t count = self->_agingCoeffForRCFreq2TemperatureCoeffs.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_agingCoeffForRCFreq2TemperatureCoeffs->list[a3];
}

- (void)setAgingCoeffForRCFreq2TemperatureCoeffs:(float *)a3 count:(unint64_t)a4
{
}

- (unint64_t)agingCoeffForRCFreq3TemperatureCoeffsCount
{
  return self->_agingCoeffForRCFreq3TemperatureCoeffs.count;
}

- (float)agingCoeffForRCFreq3TemperatureCoeffs
{
  return self->_agingCoeffForRCFreq3TemperatureCoeffs.list;
}

- (void)clearAgingCoeffForRCFreq3TemperatureCoeffs
{
}

- (void)addAgingCoeffForRCFreq3TemperatureCoeff:(float)a3
{
}

- (float)agingCoeffForRCFreq3TemperatureCoeffAtIndex:(unint64_t)a3
{
  p_agingCoeffForRCFreq3TemperatureCoeffs = &self->_agingCoeffForRCFreq3TemperatureCoeffs;
  unint64_t count = self->_agingCoeffForRCFreq3TemperatureCoeffs.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_agingCoeffForRCFreq3TemperatureCoeffs->list[a3];
}

- (void)setAgingCoeffForRCFreq3TemperatureCoeffs:(float *)a3 count:(unint64_t)a4
{
}

- (unint64_t)agingCoeffForRCFreq4TemperatureCoeffsCount
{
  return self->_agingCoeffForRCFreq4TemperatureCoeffs.count;
}

- (float)agingCoeffForRCFreq4TemperatureCoeffs
{
  return self->_agingCoeffForRCFreq4TemperatureCoeffs.list;
}

- (void)clearAgingCoeffForRCFreq4TemperatureCoeffs
{
}

- (void)addAgingCoeffForRCFreq4TemperatureCoeff:(float)a3
{
}

- (float)agingCoeffForRCFreq4TemperatureCoeffAtIndex:(unint64_t)a3
{
  p_agingCoeffForRCFreq4TemperatureCoeffs = &self->_agingCoeffForRCFreq4TemperatureCoeffs;
  unint64_t count = self->_agingCoeffForRCFreq4TemperatureCoeffs.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_agingCoeffForRCFreq4TemperatureCoeffs->list[a3];
}

- (void)setAgingCoeffForRCFreq4TemperatureCoeffs:(float *)a3 count:(unint64_t)a4
{
}

- (int)mLBConfig
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_mLBConfig;
  }
  else {
    return 0;
  }
}

- (void)setMLBConfig:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_mLBConfig = a3;
}

- (void)setHasMLBConfig:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMLBConfig
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)mLBConfigAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      v4 = @"kPPMNorthSouthSplitMLB";
    }
    else
    {
      v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
    }
  }
  else
  {
    v4 = @"kPPMRegularMLB";
  }
  return v4;
}

- (int)StringAsMLBConfig:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"kPPMRegularMLB"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"kPPMNorthSouthSplitMLB"];
  }

  return v4;
}

- (void)setWRdcRatioThresh:(float)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_wRdcRatioThresh = a3;
}

- (void)setHasWRdcRatioThresh:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasWRdcRatioThresh
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (unint64_t)gridWRdcRatiosCount
{
  return self->_gridWRdcRatios.count;
}

- (float)gridWRdcRatios
{
  return self->_gridWRdcRatios.list;
}

- (void)clearGridWRdcRatios
{
}

- (void)addGridWRdcRatio:(float)a3
{
}

- (float)gridWRdcRatioAtIndex:(unint64_t)a3
{
  p_gridWRdcRatios = &self->_gridWRdcRatios;
  unint64_t count = self->_gridWRdcRatios.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_gridWRdcRatios->list[a3];
}

- (void)setGridWRdcRatios:(float *)a3 count:(unint64_t)a4
{
}

- (unint64_t)coeffSOCsCount
{
  return self->_coeffSOCs.count;
}

- (float)coeffSOCs
{
  return self->_coeffSOCs.list;
}

- (void)clearCoeffSOCs
{
}

- (void)addCoeffSOC:(float)a3
{
}

- (float)coeffSOCAtIndex:(unint64_t)a3
{
  p_coeffSOCs = &self->_coeffSOCs;
  unint64_t count = self->_coeffSOCs.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_coeffSOCs->list[a3];
}

- (void)setCoeffSOCs:(float *)a3 count:(unint64_t)a4
{
}

- (unint64_t)coeffVsCount
{
  return self->_coeffVs.count;
}

- (float)coeffVs
{
  return self->_coeffVs.list;
}

- (void)clearCoeffVs
{
}

- (void)addCoeffV:(float)a3
{
}

- (float)coeffVAtIndex:(unint64_t)a3
{
  p_coeffVs = &self->_coeffVs;
  unint64_t count = self->_coeffVs.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_coeffVs->list[a3];
}

- (void)setCoeffVs:(float *)a3 count:(unint64_t)a4
{
}

- (BOOL)hasRdc
{
  return self->_rdc != 0;
}

- (unint64_t)agingCoeffForRdcsCount
{
  return self->_agingCoeffForRdcs.count;
}

- (float)agingCoeffForRdcs
{
  return self->_agingCoeffForRdcs.list;
}

- (void)clearAgingCoeffForRdcs
{
}

- (void)addAgingCoeffForRdc:(float)a3
{
}

- (float)agingCoeffForRdcAtIndex:(unint64_t)a3
{
  p_agingCoeffForRdcs = &self->_agingCoeffForRdcs;
  unint64_t count = self->_agingCoeffForRdcs.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_agingCoeffForRdcs->list[a3];
}

- (void)setAgingCoeffForRdcs:(float *)a3 count:(unint64_t)a4
{
}

- (unint64_t)agingCoeffForRdcTemperatureCoeffsCount
{
  return self->_agingCoeffForRdcTemperatureCoeffs.count;
}

- (float)agingCoeffForRdcTemperatureCoeffs
{
  return self->_agingCoeffForRdcTemperatureCoeffs.list;
}

- (void)clearAgingCoeffForRdcTemperatureCoeffs
{
}

- (void)addAgingCoeffForRdcTemperatureCoeff:(float)a3
{
}

- (float)agingCoeffForRdcTemperatureCoeffAtIndex:(unint64_t)a3
{
  p_agingCoeffForRdcTemperatureCoeffs = &self->_agingCoeffForRdcTemperatureCoeffs;
  unint64_t count = self->_agingCoeffForRdcTemperatureCoeffs.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_agingCoeffForRdcTemperatureCoeffs->list[a3];
}

- (void)setAgingCoeffForRdcTemperatureCoeffs:(float *)a3 count:(unint64_t)a4
{
}

- (unint64_t)qmaxsCount
{
  return self->_qmaxs.count;
}

- (float)qmaxs
{
  return self->_qmaxs.list;
}

- (void)clearQmaxs
{
}

- (void)addQmax:(float)a3
{
}

- (float)qmaxAtIndex:(unint64_t)a3
{
  p_qmaxs = &self->_qmaxs;
  unint64_t count = self->_qmaxs.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_qmaxs->list[a3];
}

- (void)setQmaxs:(float *)a3 count:(unint64_t)a4
{
}

- (void)setMaxRdcR25Ratio:(float)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_maxRdcR25Ratio = a3;
}

- (void)setHasMaxRdcR25Ratio:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMaxRdcR25Ratio
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)OTAParamRC;
  char v3 = [(OTAParamRC *)&v7 description];
  int v4 = [(OTAParamRC *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  r0 = self->_r0;
  if (r0)
  {
    v5 = [(OTAResistanceData *)r0 dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"R0"];
  }
  r1 = self->_r1;
  if (r1)
  {
    objc_super v7 = [(OTAResistanceData *)r1 dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"R1"];
  }
  baselineR1 = self->_baselineR1;
  if (baselineR1)
  {
    v9 = [(OTAResistanceData *)baselineR1 dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"baselineR1"];
  }
  r2 = self->_r2;
  if (r2)
  {
    v11 = [(OTAResistanceData *)r2 dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"R2"];
  }
  baselineR2 = self->_baselineR2;
  if (baselineR2)
  {
    v13 = [(OTAResistanceData *)baselineR2 dictionaryRepresentation];
    [v3 setObject:v13 forKey:@"baselineR2"];
  }
  rCFreq1 = self->_rCFreq1;
  if (rCFreq1)
  {
    v15 = [(OTAResistanceData *)rCFreq1 dictionaryRepresentation];
    [v3 setObject:v15 forKey:@"RCFreq1"];
  }
  rCFreq2 = self->_rCFreq2;
  if (rCFreq2)
  {
    v17 = [(OTAResistanceData *)rCFreq2 dictionaryRepresentation];
    [v3 setObject:v17 forKey:@"RCFreq2"];
  }
  rCFreq3 = self->_rCFreq3;
  if (rCFreq3)
  {
    v19 = [(OTAResistanceData *)rCFreq3 dictionaryRepresentation];
    [v3 setObject:v19 forKey:@"RCFreq3"];
  }
  v20 = PBRepeatedFloatNSArray();
  [v3 setObject:v20 forKey:@"agingCoeffForR0"];

  v21 = PBRepeatedFloatNSArray();
  [v3 setObject:v21 forKey:@"agingCoeffForR0TemperatureCoeff"];

  v22 = PBRepeatedFloatNSArray();
  [v3 setObject:v22 forKey:@"agingCoeffForR1"];

  v23 = PBRepeatedFloatNSArray();
  [v3 setObject:v23 forKey:@"agingCoeffForR1TemperatureCoeff"];

  v24 = PBRepeatedFloatNSArray();
  [v3 setObject:v24 forKey:@"agingCoeffForR2"];

  v25 = PBRepeatedFloatNSArray();
  [v3 setObject:v25 forKey:@"agingCoeffForR2TemperatureCoeff"];

  v26 = PBRepeatedFloatNSArray();
  [v3 setObject:v26 forKey:@"baselineRdc"];

  baselineR0 = self->_baselineR0;
  if (baselineR0)
  {
    v28 = [(OTAResistanceData *)baselineR0 dictionaryRepresentation];
    [v3 setObject:v28 forKey:@"baselineR0"];
  }
  bmuResistance = self->_bmuResistance;
  if (bmuResistance)
  {
    v30 = [(OTABMUResistance *)bmuResistance dictionaryRepresentation];
    [v3 setObject:v30 forKey:@"bmuResistance"];
  }
  v31 = +[NSNumber numberWithUnsignedInt:self->_chemID];
  [v3 setObject:v31 forKey:@"chemID"];

  v32 = PBRepeatedFloatNSArray();
  [v3 setObject:v32 forKey:@"gridOCV"];

  baselineR3 = self->_baselineR3;
  if (baselineR3)
  {
    v35 = [(OTAResistanceData *)baselineR3 dictionaryRepresentation];
    [v3 setObject:v35 forKey:@"baselineR3"];
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(float *)&double v33 = self->_maxRdcRatio;
    v70 = +[NSNumber numberWithFloat:v33];
    [v3 setObject:v70 forKey:@"maxRdcRatio"];

    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_25:
      if ((has & 1) == 0) {
        goto LABEL_27;
      }
      goto LABEL_26;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_25;
  }
  *(float *)&double v33 = self->_maxRdcRatioR2Extrap;
  v71 = +[NSNumber numberWithFloat:v33];
  [v3 setObject:v71 forKey:@"maxRdcRatioR2Extrap"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_26:
    *(float *)&double v33 = self->_baselineWRdc;
    v37 = +[NSNumber numberWithFloat:v33];
    [v3 setObject:v37 forKey:@"baselineWRdc"];
  }
LABEL_27:
  v38 = PBRepeatedFloatNSArray();
  [v3 setObject:v38 forKey:@"slopeForR0Extrap"];

  v39 = PBRepeatedFloatNSArray();
  [v3 setObject:v39 forKey:@"slopeForR1Extrap"];

  v40 = PBRepeatedFloatNSArray();
  [v3 setObject:v40 forKey:@"slopeForR2Extrap"];

  v41 = PBRepeatedFloatNSArray();
  [v3 setObject:v41 forKey:@"slopeForR3Extrap"];

  r3 = self->_r3;
  if (r3)
  {
    v43 = [(OTAResistanceData *)r3 dictionaryRepresentation];
    [v3 setObject:v43 forKey:@"R3"];
  }
  rCFreq4 = self->_rCFreq4;
  if (rCFreq4)
  {
    v45 = [(OTAResistanceData *)rCFreq4 dictionaryRepresentation];
    [v3 setObject:v45 forKey:@"RCFreq4"];
  }
  baselineR4 = self->_baselineR4;
  if (baselineR4)
  {
    v47 = [(OTAResistanceData *)baselineR4 dictionaryRepresentation];
    [v3 setObject:v47 forKey:@"baselineR4"];
  }
  baselineRCFreq1 = self->_baselineRCFreq1;
  if (baselineRCFreq1)
  {
    v49 = [(OTAResistanceData *)baselineRCFreq1 dictionaryRepresentation];
    [v3 setObject:v49 forKey:@"baselineRCFreq1"];
  }
  baselineRCFreq2 = self->_baselineRCFreq2;
  if (baselineRCFreq2)
  {
    v51 = [(OTAResistanceData *)baselineRCFreq2 dictionaryRepresentation];
    [v3 setObject:v51 forKey:@"baselineRCFreq2"];
  }
  baselineRCFreq3 = self->_baselineRCFreq3;
  if (baselineRCFreq3)
  {
    v53 = [(OTAResistanceData *)baselineRCFreq3 dictionaryRepresentation];
    [v3 setObject:v53 forKey:@"baselineRCFreq3"];
  }
  baselineRCFreq4 = self->_baselineRCFreq4;
  if (baselineRCFreq4)
  {
    v55 = [(OTAResistanceData *)baselineRCFreq4 dictionaryRepresentation];
    [v3 setObject:v55 forKey:@"baselineRCFreq4"];
  }
  v56 = PBRepeatedFloatNSArray();
  [v3 setObject:v56 forKey:@"agingCoeffForR3"];

  v57 = PBRepeatedFloatNSArray();
  [v3 setObject:v57 forKey:@"agingCoeffForR3TemperatureCoeff"];

  v58 = PBRepeatedFloatNSArray();
  [v3 setObject:v58 forKey:@"agingCoeffForRCFreq1"];

  v59 = PBRepeatedFloatNSArray();
  [v3 setObject:v59 forKey:@"agingCoeffForRCFreq2"];

  v60 = PBRepeatedFloatNSArray();
  [v3 setObject:v60 forKey:@"agingCoeffForRCFreq3"];

  v61 = PBRepeatedFloatNSArray();
  [v3 setObject:v61 forKey:@"agingCoeffForRCFreq4"];

  v62 = PBRepeatedFloatNSArray();
  [v3 setObject:v62 forKey:@"agingCoeffForRCFreq1TemperatureCoeff"];

  v63 = PBRepeatedFloatNSArray();
  [v3 setObject:v63 forKey:@"agingCoeffForRCFreq2TemperatureCoeff"];

  v64 = PBRepeatedFloatNSArray();
  [v3 setObject:v64 forKey:@"agingCoeffForRCFreq3TemperatureCoeff"];

  v65 = PBRepeatedFloatNSArray();
  [v3 setObject:v65 forKey:@"agingCoeffForRCFreq4TemperatureCoeff"];

  char v67 = (char)self->_has;
  if ((v67 & 2) != 0)
  {
    int mLBConfig = self->_mLBConfig;
    if (mLBConfig)
    {
      if (mLBConfig == 1)
      {
        v69 = @"kPPMNorthSouthSplitMLB";
      }
      else
      {
        v69 = +[NSString stringWithFormat:@"(unknown: %i)", self->_mLBConfig];
      }
    }
    else
    {
      v69 = @"kPPMRegularMLB";
    }
    [v3 setObject:v69 forKey:@"MLBConfig"];

    char v67 = (char)self->_has;
  }
  if ((v67 & 0x20) != 0)
  {
    *(float *)&double v66 = self->_wRdcRatioThresh;
    v72 = +[NSNumber numberWithFloat:v66];
    [v3 setObject:v72 forKey:@"wRdcRatioThresh"];
  }
  v73 = PBRepeatedFloatNSArray();
  [v3 setObject:v73 forKey:@"gridWRdcRatio"];

  v74 = PBRepeatedFloatNSArray();
  [v3 setObject:v74 forKey:@"coeffSOC"];

  v75 = PBRepeatedFloatNSArray();
  [v3 setObject:v75 forKey:@"coeffV"];

  rdc = self->_rdc;
  if (rdc)
  {
    v77 = [(OTAResistanceData *)rdc dictionaryRepresentation];
    [v3 setObject:v77 forKey:@"Rdc"];
  }
  v78 = PBRepeatedFloatNSArray();
  [v3 setObject:v78 forKey:@"agingCoeffForRdc"];

  v79 = PBRepeatedFloatNSArray();
  [v3 setObject:v79 forKey:@"agingCoeffForRdcTemperatureCoeff"];

  v80 = PBRepeatedFloatNSArray();
  [v3 setObject:v80 forKey:@"Qmax"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(float *)&double v81 = self->_maxRdcR25Ratio;
    v82 = +[NSNumber numberWithFloat:v81];
    [v3 setObject:v82 forKey:@"maxRdcR25Ratio"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100007AA0((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v35 = a3;
  if (self->_r0) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_r1) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_baselineR1) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_r2) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_baselineR2) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_rCFreq1) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_rCFreq2) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_rCFreq3) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_agingCoeffForR0s.count)
  {
    unint64_t v4 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      ++v4;
    }
    while (v4 < self->_agingCoeffForR0s.count);
  }
  if (self->_agingCoeffForR0TemperatureCoeffs.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      ++v5;
    }
    while (v5 < self->_agingCoeffForR0TemperatureCoeffs.count);
  }
  if (self->_agingCoeffForR1s.count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      ++v6;
    }
    while (v6 < self->_agingCoeffForR1s.count);
  }
  if (self->_agingCoeffForR1TemperatureCoeffs.count)
  {
    unint64_t v7 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      ++v7;
    }
    while (v7 < self->_agingCoeffForR1TemperatureCoeffs.count);
  }
  if (self->_agingCoeffForR2s.count)
  {
    unint64_t v8 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      ++v8;
    }
    while (v8 < self->_agingCoeffForR2s.count);
  }
  if (self->_agingCoeffForR2TemperatureCoeffs.count)
  {
    unint64_t v9 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      ++v9;
    }
    while (v9 < self->_agingCoeffForR2TemperatureCoeffs.count);
  }
  if (self->_baselineRdcs.count)
  {
    unint64_t v10 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      ++v10;
    }
    while (v10 < self->_baselineRdcs.count);
  }
  if (self->_baselineR0) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_bmuResistance) {
    PBDataWriterWriteSubmessage();
  }
  PBDataWriterWriteUint32Field();
  if (self->_gridOCVs.count)
  {
    unint64_t v11 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      ++v11;
    }
    while (v11 < self->_gridOCVs.count);
  }
  if (self->_baselineR3) {
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  v13 = v35;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteFloatField();
    v13 = v35;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_49:
      if ((has & 1) == 0) {
        goto LABEL_51;
      }
      goto LABEL_50;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_49;
  }
  PBDataWriterWriteFloatField();
  v13 = v35;
  if (*(unsigned char *)&self->_has)
  {
LABEL_50:
    PBDataWriterWriteFloatField();
    v13 = v35;
  }
LABEL_51:
  if (self->_slopeForR0Extraps.count)
  {
    unint64_t v14 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      v13 = v35;
      ++v14;
    }
    while (v14 < self->_slopeForR0Extraps.count);
  }
  if (self->_slopeForR1Extraps.count)
  {
    unint64_t v15 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      v13 = v35;
      ++v15;
    }
    while (v15 < self->_slopeForR1Extraps.count);
  }
  if (self->_slopeForR2Extraps.count)
  {
    unint64_t v16 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      v13 = v35;
      ++v16;
    }
    while (v16 < self->_slopeForR2Extraps.count);
  }
  if (self->_slopeForR3Extraps.count)
  {
    unint64_t v17 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      v13 = v35;
      ++v17;
    }
    while (v17 < self->_slopeForR3Extraps.count);
  }
  if (self->_r3)
  {
    PBDataWriterWriteSubmessage();
    v13 = v35;
  }
  if (self->_rCFreq4)
  {
    PBDataWriterWriteSubmessage();
    v13 = v35;
  }
  if (self->_baselineR4)
  {
    PBDataWriterWriteSubmessage();
    v13 = v35;
  }
  if (self->_baselineRCFreq1)
  {
    PBDataWriterWriteSubmessage();
    v13 = v35;
  }
  if (self->_baselineRCFreq2)
  {
    PBDataWriterWriteSubmessage();
    v13 = v35;
  }
  if (self->_baselineRCFreq3)
  {
    PBDataWriterWriteSubmessage();
    v13 = v35;
  }
  if (self->_baselineRCFreq4)
  {
    PBDataWriterWriteSubmessage();
    v13 = v35;
  }
  if (self->_agingCoeffForR3s.count)
  {
    unint64_t v18 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      v13 = v35;
      ++v18;
    }
    while (v18 < self->_agingCoeffForR3s.count);
  }
  if (self->_agingCoeffForR3TemperatureCoeffs.count)
  {
    unint64_t v19 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      v13 = v35;
      ++v19;
    }
    while (v19 < self->_agingCoeffForR3TemperatureCoeffs.count);
  }
  if (self->_agingCoeffForRCFreq1s.count)
  {
    unint64_t v20 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      v13 = v35;
      ++v20;
    }
    while (v20 < self->_agingCoeffForRCFreq1s.count);
  }
  if (self->_agingCoeffForRCFreq2s.count)
  {
    unint64_t v21 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      v13 = v35;
      ++v21;
    }
    while (v21 < self->_agingCoeffForRCFreq2s.count);
  }
  if (self->_agingCoeffForRCFreq3s.count)
  {
    unint64_t v22 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      v13 = v35;
      ++v22;
    }
    while (v22 < self->_agingCoeffForRCFreq3s.count);
  }
  if (self->_agingCoeffForRCFreq4s.count)
  {
    unint64_t v23 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      v13 = v35;
      ++v23;
    }
    while (v23 < self->_agingCoeffForRCFreq4s.count);
  }
  if (self->_agingCoeffForRCFreq1TemperatureCoeffs.count)
  {
    unint64_t v24 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      v13 = v35;
      ++v24;
    }
    while (v24 < self->_agingCoeffForRCFreq1TemperatureCoeffs.count);
  }
  if (self->_agingCoeffForRCFreq2TemperatureCoeffs.count)
  {
    unint64_t v25 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      v13 = v35;
      ++v25;
    }
    while (v25 < self->_agingCoeffForRCFreq2TemperatureCoeffs.count);
  }
  if (self->_agingCoeffForRCFreq3TemperatureCoeffs.count)
  {
    unint64_t v26 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      v13 = v35;
      ++v26;
    }
    while (v26 < self->_agingCoeffForRCFreq3TemperatureCoeffs.count);
  }
  if (self->_agingCoeffForRCFreq4TemperatureCoeffs.count)
  {
    unint64_t v27 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      v13 = v35;
      ++v27;
    }
    while (v27 < self->_agingCoeffForRCFreq4TemperatureCoeffs.count);
  }
  char v28 = (char)self->_has;
  if ((v28 & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v13 = v35;
    char v28 = (char)self->_has;
  }
  if ((v28 & 0x20) != 0)
  {
    PBDataWriterWriteFloatField();
    v13 = v35;
  }
  if (self->_gridWRdcRatios.count)
  {
    unint64_t v29 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      v13 = v35;
      ++v29;
    }
    while (v29 < self->_gridWRdcRatios.count);
  }
  if (self->_coeffSOCs.count)
  {
    unint64_t v30 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      v13 = v35;
      ++v30;
    }
    while (v30 < self->_coeffSOCs.count);
  }
  if (self->_coeffVs.count)
  {
    unint64_t v31 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      v13 = v35;
      ++v31;
    }
    while (v31 < self->_coeffVs.count);
  }
  if (self->_rdc)
  {
    PBDataWriterWriteSubmessage();
    v13 = v35;
  }
  if (self->_agingCoeffForRdcs.count)
  {
    unint64_t v32 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      v13 = v35;
      ++v32;
    }
    while (v32 < self->_agingCoeffForRdcs.count);
  }
  if (self->_agingCoeffForRdcTemperatureCoeffs.count)
  {
    unint64_t v33 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      v13 = v35;
      ++v33;
    }
    while (v33 < self->_agingCoeffForRdcTemperatureCoeffs.count);
  }
  if (self->_qmaxs.count)
  {
    unint64_t v34 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      v13 = v35;
      ++v34;
    }
    while (v34 < self->_qmaxs.count);
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteFloatField();
    v13 = v35;
  }
}

- (void)copyTo:(id)a3
{
  id v91 = a3;
  if (self->_r0) {
    [v91 setR0:];
  }
  if (self->_r1) {
    [v91 setR1:];
  }
  if (self->_baselineR1) {
    [v91 setBaselineR1:];
  }
  if (self->_r2) {
    [v91 setR2:];
  }
  if (self->_baselineR2) {
    [v91 setBaselineR2:];
  }
  if (self->_rCFreq1) {
    [v91 setRCFreq1:];
  }
  if (self->_rCFreq2) {
    [v91 setRCFreq2:];
  }
  if (self->_rCFreq3) {
    [v91 setRCFreq3:];
  }
  if ([(OTAParamRC *)self agingCoeffForR0sCount])
  {
    [v91 clearAgingCoeffForR0s];
    unint64_t v4 = [(OTAParamRC *)self agingCoeffForR0sCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        [(OTAParamRC *)self agingCoeffForR0AtIndex:i];
        [v91 addAgingCoeffForR0:];
      }
    }
  }
  if ([(OTAParamRC *)self agingCoeffForR0TemperatureCoeffsCount])
  {
    [v91 clearAgingCoeffForR0TemperatureCoeffs];
    unint64_t v7 = [(OTAParamRC *)self agingCoeffForR0TemperatureCoeffsCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t j = 0; j != v8; ++j)
      {
        [(OTAParamRC *)self agingCoeffForR0TemperatureCoeffAtIndex:j];
        [v91 addAgingCoeffForR0TemperatureCoeff:];
      }
    }
  }
  if ([(OTAParamRC *)self agingCoeffForR1sCount])
  {
    [v91 clearAgingCoeffForR1s];
    unint64_t v10 = [(OTAParamRC *)self agingCoeffForR1sCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t k = 0; k != v11; ++k)
      {
        [(OTAParamRC *)self agingCoeffForR1AtIndex:k];
        [v91 addAgingCoeffForR1:];
      }
    }
  }
  if ([(OTAParamRC *)self agingCoeffForR1TemperatureCoeffsCount])
  {
    [v91 clearAgingCoeffForR1TemperatureCoeffs];
    unint64_t v13 = [(OTAParamRC *)self agingCoeffForR1TemperatureCoeffsCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t m = 0; m != v14; ++m)
      {
        [(OTAParamRC *)self agingCoeffForR1TemperatureCoeffAtIndex:m];
        [v91 addAgingCoeffForR1TemperatureCoeff:];
      }
    }
  }
  if ([(OTAParamRC *)self agingCoeffForR2sCount])
  {
    [v91 clearAgingCoeffForR2s];
    unint64_t v16 = [(OTAParamRC *)self agingCoeffForR2sCount];
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t n = 0; n != v17; ++n)
      {
        [(OTAParamRC *)self agingCoeffForR2AtIndex:n];
        [v91 addAgingCoeffForR2:];
      }
    }
  }
  if ([(OTAParamRC *)self agingCoeffForR2TemperatureCoeffsCount])
  {
    [v91 clearAgingCoeffForR2TemperatureCoeffs];
    unint64_t v19 = [(OTAParamRC *)self agingCoeffForR2TemperatureCoeffsCount];
    if (v19)
    {
      unint64_t v20 = v19;
      for (iuint64_t i = 0; ii != v20; ++ii)
      {
        [(OTAParamRC *)self agingCoeffForR2TemperatureCoeffAtIndex:ii];
        [v91 addAgingCoeffForR2TemperatureCoeff:];
      }
    }
  }
  if ([(OTAParamRC *)self baselineRdcsCount])
  {
    [v91 clearBaselineRdcs];
    unint64_t v22 = [(OTAParamRC *)self baselineRdcsCount];
    if (v22)
    {
      unint64_t v23 = v22;
      for (juint64_t j = 0; jj != v23; ++jj)
      {
        [(OTAParamRC *)self baselineRdcAtIndex:jj];
        [v91 addBaselineRdc:];
      }
    }
  }
  if (self->_baselineR0) {
    [v91 setBaselineR0:];
  }
  unint64_t v25 = v91;
  if (self->_bmuResistance)
  {
    [v91 setBmuResistance:];
    unint64_t v25 = v91;
  }
  v25[192] = self->_chemID;
  if ([(OTAParamRC *)self gridOCVsCount])
  {
    [v91 clearGridOCVs];
    unint64_t v26 = [(OTAParamRC *)self gridOCVsCount];
    if (v26)
    {
      unint64_t v27 = v26;
      for (kuint64_t k = 0; kk != v27; ++kk)
      {
        [(OTAParamRC *)self gridOCVAtIndex:kk];
        [v91 addGridOCV:];
      }
    }
  }
  if (self->_baselineR3) {
    [v91 setBaselineR3:];
  }
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      goto LABEL_57;
    }
LABEL_165:
    *((_DWORD *)v91 + 196) = LODWORD(self->_maxRdcRatioR2Extrap);
    *((unsigned char *)v91 + 868) |= 0x10u;
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_59;
    }
    goto LABEL_58;
  }
  *((_DWORD *)v91 + 195) = LODWORD(self->_maxRdcRatio);
  *((unsigned char *)v91 + 868) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) != 0) {
    goto LABEL_165;
  }
LABEL_57:
  if (has)
  {
LABEL_58:
    *((_DWORD *)v91 + 188) = LODWORD(self->_baselineWRdc);
    *((unsigned char *)v91 + 868) |= 1u;
  }
LABEL_59:
  if ([(OTAParamRC *)self slopeForR0ExtrapsCount])
  {
    [v91 clearSlopeForR0Extraps];
    unint64_t v30 = [(OTAParamRC *)self slopeForR0ExtrapsCount];
    if (v30)
    {
      unint64_t v31 = v30;
      for (muint64_t m = 0; mm != v31; ++mm)
      {
        [(OTAParamRC *)self slopeForR0ExtrapAtIndex:mm];
        [v91 addSlopeForR0Extrap:];
      }
    }
  }
  if ([(OTAParamRC *)self slopeForR1ExtrapsCount])
  {
    [v91 clearSlopeForR1Extraps];
    unint64_t v33 = [(OTAParamRC *)self slopeForR1ExtrapsCount];
    if (v33)
    {
      unint64_t v34 = v33;
      for (nuint64_t n = 0; nn != v34; ++nn)
      {
        [(OTAParamRC *)self slopeForR1ExtrapAtIndex:nn];
        [v91 addSlopeForR1Extrap:];
      }
    }
  }
  if ([(OTAParamRC *)self slopeForR2ExtrapsCount])
  {
    [v91 clearSlopeForR2Extraps];
    unint64_t v36 = [(OTAParamRC *)self slopeForR2ExtrapsCount];
    if (v36)
    {
      unint64_t v37 = v36;
      for (uint64_t i1 = 0; i1 != v37; ++i1)
      {
        [(OTAParamRC *)self slopeForR2ExtrapAtIndex:i1];
        [v91 addSlopeForR2Extrap:];
      }
    }
  }
  if ([(OTAParamRC *)self slopeForR3ExtrapsCount])
  {
    [v91 clearSlopeForR3Extraps];
    unint64_t v39 = [(OTAParamRC *)self slopeForR3ExtrapsCount];
    if (v39)
    {
      unint64_t v40 = v39;
      for (uint64_t i2 = 0; i2 != v40; ++i2)
      {
        [(OTAParamRC *)self slopeForR3ExtrapAtIndex:i2];
        [v91 addSlopeForR3Extrap:];
      }
    }
  }
  if (self->_r3) {
    [v91 setR3:];
  }
  if (self->_rCFreq4) {
    [v91 setRCFreq4:];
  }
  if (self->_baselineR4) {
    [v91 setBaselineR4:];
  }
  if (self->_baselineRCFreq1) {
    [v91 setBaselineRCFreq1:];
  }
  if (self->_baselineRCFreq2) {
    [v91 setBaselineRCFreq2:];
  }
  if (self->_baselineRCFreq3) {
    [v91 setBaselineRCFreq3:];
  }
  if (self->_baselineRCFreq4) {
    [v91 setBaselineRCFreq4:];
  }
  if ([(OTAParamRC *)self agingCoeffForR3sCount])
  {
    [v91 clearAgingCoeffForR3s];
    unint64_t v42 = [(OTAParamRC *)self agingCoeffForR3sCount];
    if (v42)
    {
      unint64_t v43 = v42;
      for (uint64_t i3 = 0; i3 != v43; ++i3)
      {
        [(OTAParamRC *)self agingCoeffForR3AtIndex:i3];
        [v91 addAgingCoeffForR3:];
      }
    }
  }
  if ([(OTAParamRC *)self agingCoeffForR3TemperatureCoeffsCount])
  {
    [v91 clearAgingCoeffForR3TemperatureCoeffs];
    unint64_t v45 = [(OTAParamRC *)self agingCoeffForR3TemperatureCoeffsCount];
    if (v45)
    {
      unint64_t v46 = v45;
      for (uint64_t i4 = 0; i4 != v46; ++i4)
      {
        [(OTAParamRC *)self agingCoeffForR3TemperatureCoeffAtIndex:i4];
        [v91 addAgingCoeffForR3TemperatureCoeff:];
      }
    }
  }
  if ([(OTAParamRC *)self agingCoeffForRCFreq1sCount])
  {
    [v91 clearAgingCoeffForRCFreq1s];
    unint64_t v48 = [(OTAParamRC *)self agingCoeffForRCFreq1sCount];
    if (v48)
    {
      unint64_t v49 = v48;
      for (uint64_t i5 = 0; i5 != v49; ++i5)
      {
        [(OTAParamRC *)self agingCoeffForRCFreq1AtIndex:i5];
        [v91 addAgingCoeffForRCFreq1:];
      }
    }
  }
  if ([(OTAParamRC *)self agingCoeffForRCFreq2sCount])
  {
    [v91 clearAgingCoeffForRCFreq2s];
    unint64_t v51 = [(OTAParamRC *)self agingCoeffForRCFreq2sCount];
    if (v51)
    {
      unint64_t v52 = v51;
      for (uint64_t i6 = 0; i6 != v52; ++i6)
      {
        [(OTAParamRC *)self agingCoeffForRCFreq2AtIndex:i6];
        [v91 addAgingCoeffForRCFreq2:];
      }
    }
  }
  if ([(OTAParamRC *)self agingCoeffForRCFreq3sCount])
  {
    [v91 clearAgingCoeffForRCFreq3s];
    unint64_t v54 = [(OTAParamRC *)self agingCoeffForRCFreq3sCount];
    if (v54)
    {
      unint64_t v55 = v54;
      for (uint64_t i7 = 0; i7 != v55; ++i7)
      {
        [(OTAParamRC *)self agingCoeffForRCFreq3AtIndex:i7];
        [v91 addAgingCoeffForRCFreq3:];
      }
    }
  }
  if ([(OTAParamRC *)self agingCoeffForRCFreq4sCount])
  {
    [v91 clearAgingCoeffForRCFreq4s];
    unint64_t v57 = [(OTAParamRC *)self agingCoeffForRCFreq4sCount];
    if (v57)
    {
      unint64_t v58 = v57;
      for (uint64_t i8 = 0; i8 != v58; ++i8)
      {
        [(OTAParamRC *)self agingCoeffForRCFreq4AtIndex:i8];
        [v91 addAgingCoeffForRCFreq4];
      }
    }
  }
  if ([(OTAParamRC *)self agingCoeffForRCFreq1TemperatureCoeffsCount])
  {
    [v91 clearAgingCoeffForRCFreq1TemperatureCoeffs];
    unint64_t v60 = [(OTAParamRC *)self agingCoeffForRCFreq1TemperatureCoeffsCount];
    if (v60)
    {
      unint64_t v61 = v60;
      for (uint64_t i9 = 0; i9 != v61; ++i9)
      {
        [(OTAParamRC *)self agingCoeffForRCFreq1TemperatureCoeffAtIndex:i9];
        [v91 addAgingCoeffForRCFreq1TemperatureCoeff];
      }
    }
  }
  if ([(OTAParamRC *)self agingCoeffForRCFreq2TemperatureCoeffsCount])
  {
    [v91 clearAgingCoeffForRCFreq2TemperatureCoeffs];
    unint64_t v63 = [(OTAParamRC *)self agingCoeffForRCFreq2TemperatureCoeffsCount];
    if (v63)
    {
      unint64_t v64 = v63;
      for (uint64_t i10 = 0; i10 != v64; ++i10)
      {
        [(OTAParamRC *)self agingCoeffForRCFreq2TemperatureCoeffAtIndex:i10];
        [v91 addAgingCoeffForRCFreq2TemperatureCoeff];
      }
    }
  }
  if ([(OTAParamRC *)self agingCoeffForRCFreq3TemperatureCoeffsCount])
  {
    [v91 clearAgingCoeffForRCFreq3TemperatureCoeffs];
    unint64_t v66 = [(OTAParamRC *)self agingCoeffForRCFreq3TemperatureCoeffsCount];
    if (v66)
    {
      unint64_t v67 = v66;
      for (uint64_t i11 = 0; i11 != v67; ++i11)
      {
        [(OTAParamRC *)self agingCoeffForRCFreq3TemperatureCoeffAtIndex:i11];
        [v91 addAgingCoeffForRCFreq3TemperatureCoeff];
      }
    }
  }
  if ([(OTAParamRC *)self agingCoeffForRCFreq4TemperatureCoeffsCount])
  {
    [v91 clearAgingCoeffForRCFreq4TemperatureCoeffs];
    unint64_t v69 = [(OTAParamRC *)self agingCoeffForRCFreq4TemperatureCoeffsCount];
    if (v69)
    {
      unint64_t v70 = v69;
      for (uint64_t i12 = 0; i12 != v70; ++i12)
      {
        [(OTAParamRC *)self agingCoeffForRCFreq4TemperatureCoeffAtIndex:i12];
        [v91 addAgingCoeffForRCFreq4TemperatureCoeff:];
      }
    }
  }
  char v72 = (char)self->_has;
  if ((v72 & 2) != 0)
  {
    *((_DWORD *)v91 + 193) = self->_mLBConfig;
    *((unsigned char *)v91 + 868) |= 2u;
    char v72 = (char)self->_has;
  }
  if ((v72 & 0x20) != 0)
  {
    *((_DWORD *)v91 + 216) = LODWORD(self->_wRdcRatioThresh);
    *((unsigned char *)v91 + 868) |= 0x20u;
  }
  if ([(OTAParamRC *)self gridWRdcRatiosCount])
  {
    [v91 clearGridWRdcRatios];
    unint64_t v73 = [(OTAParamRC *)self gridWRdcRatiosCount];
    if (v73)
    {
      unint64_t v74 = v73;
      for (uint64_t i13 = 0; i13 != v74; ++i13)
      {
        [(OTAParamRC *)self gridWRdcRatioAtIndex:i13];
        [v91 addGridWRdcRatio:];
      }
    }
  }
  if ([(OTAParamRC *)self coeffSOCsCount])
  {
    [v91 clearCoeffSOCs];
    unint64_t v76 = [(OTAParamRC *)self coeffSOCsCount];
    if (v76)
    {
      unint64_t v77 = v76;
      for (uint64_t i14 = 0; i14 != v77; ++i14)
      {
        [(OTAParamRC *)self coeffSOCAtIndex:i14];
        [v91 addCoeffSOC];
      }
    }
  }
  if ([(OTAParamRC *)self coeffVsCount])
  {
    [v91 clearCoeffVs];
    unint64_t v79 = [(OTAParamRC *)self coeffVsCount];
    if (v79)
    {
      unint64_t v80 = v79;
      for (uint64_t i15 = 0; i15 != v80; ++i15)
      {
        [(OTAParamRC *)self coeffVAtIndex:i15];
        [v91 addCoeffV:];
      }
    }
  }
  if (self->_rdc) {
    [v91 setRdc:];
  }
  if ([(OTAParamRC *)self agingCoeffForRdcsCount])
  {
    [v91 clearAgingCoeffForRdcs];
    unint64_t v82 = [(OTAParamRC *)self agingCoeffForRdcsCount];
    if (v82)
    {
      unint64_t v83 = v82;
      for (uint64_t i16 = 0; i16 != v83; ++i16)
      {
        [(OTAParamRC *)self agingCoeffForRdcAtIndex:i16];
        [v91 addAgingCoeffForRdc:];
      }
    }
  }
  if ([(OTAParamRC *)self agingCoeffForRdcTemperatureCoeffsCount])
  {
    [v91 clearAgingCoeffForRdcTemperatureCoeffs];
    unint64_t v85 = [(OTAParamRC *)self agingCoeffForRdcTemperatureCoeffsCount];
    if (v85)
    {
      unint64_t v86 = v85;
      for (uint64_t i17 = 0; i17 != v86; ++i17)
      {
        [(OTAParamRC *)self agingCoeffForRdcTemperatureCoeffAtIndex:i17];
        [v91 addAgingCoeffForRdcTemperatureCoeff:];
      }
    }
  }
  if ([(OTAParamRC *)self qmaxsCount])
  {
    [v91 clearQmaxs];
    unint64_t v88 = [(OTAParamRC *)self qmaxsCount];
    if (v88)
    {
      unint64_t v89 = v88;
      for (uint64_t i18 = 0; i18 != v89; ++i18)
      {
        [(OTAParamRC *)self qmaxAtIndex:i18];
        [v91 addQmax:];
      }
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v91 + 194) = LODWORD(self->_maxRdcR25Ratio);
    *((unsigned char *)v91 + 868) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(OTAResistanceData *)self->_r0 copyWithZone:a3];
  unint64_t v7 = (void *)v5[99];
  v5[99] = v6;

  id v8 = [(OTAResistanceData *)self->_r1 copyWithZone:a3];
  unint64_t v9 = (void *)v5[100];
  v5[100] = v8;

  id v10 = [(OTAResistanceData *)self->_baselineR1 copyWithZone:a3];
  unint64_t v11 = (void *)v5[86];
  v5[86] = v10;

  id v12 = [(OTAResistanceData *)self->_r2 copyWithZone:a3];
  unint64_t v13 = (void *)v5[101];
  v5[101] = v12;

  id v14 = [(OTAResistanceData *)self->_baselineR2 copyWithZone:a3];
  unint64_t v15 = (void *)v5[87];
  v5[87] = v14;

  id v16 = [(OTAResistanceData *)self->_rCFreq1 copyWithZone:a3];
  unint64_t v17 = (void *)v5[103];
  v5[103] = v16;

  id v18 = [(OTAResistanceData *)self->_rCFreq2 copyWithZone:a3];
  unint64_t v19 = (void *)v5[104];
  v5[104] = v18;

  id v20 = [(OTAResistanceData *)self->_rCFreq3 copyWithZone:a3];
  unint64_t v21 = (void *)v5[105];
  v5[105] = v20;

  PBRepeatedFloatCopy();
  PBRepeatedFloatCopy();
  PBRepeatedFloatCopy();
  PBRepeatedFloatCopy();
  PBRepeatedFloatCopy();
  PBRepeatedFloatCopy();
  PBRepeatedFloatCopy();
  id v22 = [(OTAResistanceData *)self->_baselineR0 copyWithZone:a3];
  unint64_t v23 = (void *)v5[85];
  v5[85] = v22;

  id v24 = [(OTABMUResistance *)self->_bmuResistance copyWithZone:a3];
  unint64_t v25 = (void *)v5[95];
  v5[95] = v24;

  *((_DWORD *)v5 + 192) = self->_chemID;
  PBRepeatedFloatCopy();
  id v26 = [(OTAResistanceData *)self->_baselineR3 copyWithZone:a3];
  unint64_t v27 = (void *)v5[88];
  v5[88] = v26;

  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)v5 + 195) = LODWORD(self->_maxRdcRatio);
    *((unsigned char *)v5 + 868) |= 8u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 196) = LODWORD(self->_maxRdcRatioR2Extrap);
  *((unsigned char *)v5 + 868) |= 0x10u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    *((_DWORD *)v5 + 188) = LODWORD(self->_baselineWRdc);
    *((unsigned char *)v5 + 868) |= 1u;
  }
LABEL_5:
  PBRepeatedFloatCopy();
  PBRepeatedFloatCopy();
  PBRepeatedFloatCopy();
  PBRepeatedFloatCopy();
  id v29 = [(OTAResistanceData *)self->_r3 copyWithZone:a3];
  unint64_t v30 = (void *)v5[102];
  v5[102] = v29;

  id v31 = [(OTAResistanceData *)self->_rCFreq4 copyWithZone:a3];
  unint64_t v32 = (void *)v5[106];
  v5[106] = v31;

  id v33 = [(OTAResistanceData *)self->_baselineR4 copyWithZone:a3];
  unint64_t v34 = (void *)v5[89];
  v5[89] = v33;

  id v35 = [(OTAResistanceData *)self->_baselineRCFreq1 copyWithZone:a3];
  unint64_t v36 = (void *)v5[90];
  v5[90] = v35;

  id v37 = [(OTAResistanceData *)self->_baselineRCFreq2 copyWithZone:a3];
  v38 = (void *)v5[91];
  v5[91] = v37;

  id v39 = [(OTAResistanceData *)self->_baselineRCFreq3 copyWithZone:a3];
  unint64_t v40 = (void *)v5[92];
  v5[92] = v39;

  id v41 = [(OTAResistanceData *)self->_baselineRCFreq4 copyWithZone:a3];
  unint64_t v42 = (void *)v5[93];
  v5[93] = v41;

  PBRepeatedFloatCopy();
  PBRepeatedFloatCopy();
  PBRepeatedFloatCopy();
  PBRepeatedFloatCopy();
  PBRepeatedFloatCopy();
  PBRepeatedFloatCopy();
  PBRepeatedFloatCopy();
  PBRepeatedFloatCopy();
  PBRepeatedFloatCopy();
  PBRepeatedFloatCopy();
  char v43 = (char)self->_has;
  if ((v43 & 2) != 0)
  {
    *((_DWORD *)v5 + 193) = self->_mLBConfig;
    *((unsigned char *)v5 + 868) |= 2u;
    char v43 = (char)self->_has;
  }
  if ((v43 & 0x20) != 0)
  {
    *((_DWORD *)v5 + 216) = LODWORD(self->_wRdcRatioThresh);
    *((unsigned char *)v5 + 868) |= 0x20u;
  }
  PBRepeatedFloatCopy();
  PBRepeatedFloatCopy();
  PBRepeatedFloatCopy();
  id v44 = [(OTAResistanceData *)self->_rdc copyWithZone:a3];
  unint64_t v45 = (void *)v5[107];
  v5[107] = v44;

  PBRepeatedFloatCopy();
  PBRepeatedFloatCopy();
  PBRepeatedFloatCopy();
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v5 + 194) = LODWORD(self->_maxRdcR25Ratio);
    *((unsigned char *)v5 + 868) |= 4u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_99;
  }
  r0 = self->_r0;
  if ((unint64_t)r0 | *((void *)v4 + 99))
  {
    if (!-[OTAResistanceData isEqual:](r0, "isEqual:")) {
      goto LABEL_99;
    }
  }
  r1 = self->_r1;
  if ((unint64_t)r1 | *((void *)v4 + 100))
  {
    if (!-[OTAResistanceData isEqual:](r1, "isEqual:")) {
      goto LABEL_99;
    }
  }
  baselineR1 = self->_baselineR1;
  if ((unint64_t)baselineR1 | *((void *)v4 + 86))
  {
    if (!-[OTAResistanceData isEqual:](baselineR1, "isEqual:")) {
      goto LABEL_99;
    }
  }
  r2 = self->_r2;
  if ((unint64_t)r2 | *((void *)v4 + 101))
  {
    if (!-[OTAResistanceData isEqual:](r2, "isEqual:")) {
      goto LABEL_99;
    }
  }
  baselineR2 = self->_baselineR2;
  if ((unint64_t)baselineR2 | *((void *)v4 + 87))
  {
    if (!-[OTAResistanceData isEqual:](baselineR2, "isEqual:")) {
      goto LABEL_99;
    }
  }
  rCFreq1 = self->_rCFreq1;
  if ((unint64_t)rCFreq1 | *((void *)v4 + 103))
  {
    if (!-[OTAResistanceData isEqual:](rCFreq1, "isEqual:")) {
      goto LABEL_99;
    }
  }
  rCFreq2 = self->_rCFreq2;
  if ((unint64_t)rCFreq2 | *((void *)v4 + 104))
  {
    if (!-[OTAResistanceData isEqual:](rCFreq2, "isEqual:")) {
      goto LABEL_99;
    }
  }
  rCFreq3 = self->_rCFreq3;
  if ((unint64_t)rCFreq3 | *((void *)v4 + 105))
  {
    if (!-[OTAResistanceData isEqual:](rCFreq3, "isEqual:")) {
      goto LABEL_99;
    }
  }
  if (!PBRepeatedFloatIsEqual()) {
    goto LABEL_99;
  }
  if (!PBRepeatedFloatIsEqual()) {
    goto LABEL_99;
  }
  if (!PBRepeatedFloatIsEqual()) {
    goto LABEL_99;
  }
  if (!PBRepeatedFloatIsEqual()) {
    goto LABEL_99;
  }
  if (!PBRepeatedFloatIsEqual()) {
    goto LABEL_99;
  }
  if (!PBRepeatedFloatIsEqual()) {
    goto LABEL_99;
  }
  if (!PBRepeatedFloatIsEqual()) {
    goto LABEL_99;
  }
  baselineR0 = self->_baselineR0;
  if ((unint64_t)baselineR0 | *((void *)v4 + 85))
  {
    if (!-[OTAResistanceData isEqual:](baselineR0, "isEqual:")) {
      goto LABEL_99;
    }
  }
  bmuResistance = self->_bmuResistance;
  if ((unint64_t)bmuResistance | *((void *)v4 + 95))
  {
    if (!-[OTABMUResistance isEqual:](bmuResistance, "isEqual:")) {
      goto LABEL_99;
    }
  }
  if (self->_chemID != *((_DWORD *)v4 + 192)) {
    goto LABEL_99;
  }
  if (!PBRepeatedFloatIsEqual()) {
    goto LABEL_99;
  }
  baselineR3 = self->_baselineR3;
  if ((unint64_t)baselineR3 | *((void *)v4 + 88))
  {
    if (!-[OTAResistanceData isEqual:](baselineR3, "isEqual:")) {
      goto LABEL_99;
    }
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 868) & 8) == 0 || self->_maxRdcRatio != *((float *)v4 + 195)) {
      goto LABEL_99;
    }
  }
  else if ((*((unsigned char *)v4 + 868) & 8) != 0)
  {
LABEL_99:
    BOOL v24 = 0;
    goto LABEL_100;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 868) & 0x10) == 0 || self->_maxRdcRatioR2Extrap != *((float *)v4 + 196)) {
      goto LABEL_99;
    }
  }
  else if ((*((unsigned char *)v4 + 868) & 0x10) != 0)
  {
    goto LABEL_99;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 868) & 1) == 0 || self->_baselineWRdc != *((float *)v4 + 188)) {
      goto LABEL_99;
    }
  }
  else if (*((unsigned char *)v4 + 868))
  {
    goto LABEL_99;
  }
  if (!PBRepeatedFloatIsEqual()) {
    goto LABEL_99;
  }
  if (!PBRepeatedFloatIsEqual()) {
    goto LABEL_99;
  }
  if (!PBRepeatedFloatIsEqual()) {
    goto LABEL_99;
  }
  if (!PBRepeatedFloatIsEqual()) {
    goto LABEL_99;
  }
  r3 = self->_r3;
  if ((unint64_t)r3 | *((void *)v4 + 102))
  {
    if (!-[OTAResistanceData isEqual:](r3, "isEqual:")) {
      goto LABEL_99;
    }
  }
  rCFreq4 = self->_rCFreq4;
  if ((unint64_t)rCFreq4 | *((void *)v4 + 106))
  {
    if (!-[OTAResistanceData isEqual:](rCFreq4, "isEqual:")) {
      goto LABEL_99;
    }
  }
  baselineR4 = self->_baselineR4;
  if ((unint64_t)baselineR4 | *((void *)v4 + 89))
  {
    if (!-[OTAResistanceData isEqual:](baselineR4, "isEqual:")) {
      goto LABEL_99;
    }
  }
  baselineRCFreq1 = self->_baselineRCFreq1;
  if ((unint64_t)baselineRCFreq1 | *((void *)v4 + 90))
  {
    if (!-[OTAResistanceData isEqual:](baselineRCFreq1, "isEqual:")) {
      goto LABEL_99;
    }
  }
  baselineRCFreq2 = self->_baselineRCFreq2;
  if ((unint64_t)baselineRCFreq2 | *((void *)v4 + 91))
  {
    if (!-[OTAResistanceData isEqual:](baselineRCFreq2, "isEqual:")) {
      goto LABEL_99;
    }
  }
  baselineRCFreq3 = self->_baselineRCFreq3;
  if ((unint64_t)baselineRCFreq3 | *((void *)v4 + 92))
  {
    if (!-[OTAResistanceData isEqual:](baselineRCFreq3, "isEqual:")) {
      goto LABEL_99;
    }
  }
  baselineRCFreq4 = self->_baselineRCFreq4;
  if ((unint64_t)baselineRCFreq4 | *((void *)v4 + 93))
  {
    if (!-[OTAResistanceData isEqual:](baselineRCFreq4, "isEqual:")) {
      goto LABEL_99;
    }
  }
  if (!PBRepeatedFloatIsEqual()
    || !PBRepeatedFloatIsEqual()
    || !PBRepeatedFloatIsEqual()
    || !PBRepeatedFloatIsEqual()
    || !PBRepeatedFloatIsEqual()
    || !PBRepeatedFloatIsEqual()
    || !PBRepeatedFloatIsEqual()
    || !PBRepeatedFloatIsEqual()
    || !PBRepeatedFloatIsEqual()
    || !PBRepeatedFloatIsEqual())
  {
    goto LABEL_99;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 868) & 2) == 0 || self->_mLBConfig != *((_DWORD *)v4 + 193)) {
      goto LABEL_99;
    }
  }
  else if ((*((unsigned char *)v4 + 868) & 2) != 0)
  {
    goto LABEL_99;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 868) & 0x20) == 0 || self->_wRdcRatioThresh != *((float *)v4 + 216)) {
      goto LABEL_99;
    }
  }
  else if ((*((unsigned char *)v4 + 868) & 0x20) != 0)
  {
    goto LABEL_99;
  }
  if (!PBRepeatedFloatIsEqual()) {
    goto LABEL_99;
  }
  if (!PBRepeatedFloatIsEqual()) {
    goto LABEL_99;
  }
  if (!PBRepeatedFloatIsEqual()) {
    goto LABEL_99;
  }
  rdc = self->_rdc;
  if ((unint64_t)rdc | *((void *)v4 + 107))
  {
    if (!-[OTAResistanceData isEqual:](rdc, "isEqual:")) {
      goto LABEL_99;
    }
  }
  if (!PBRepeatedFloatIsEqual()
    || !PBRepeatedFloatIsEqual()
    || !PBRepeatedFloatIsEqual())
  {
    goto LABEL_99;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 868) & 4) == 0 || self->_maxRdcR25Ratio != *((float *)v4 + 194)) {
      goto LABEL_99;
    }
    BOOL v24 = 1;
  }
  else
  {
    BOOL v24 = (*((unsigned char *)v4 + 868) & 4) == 0;
  }
LABEL_100:

  return v24;
}

- (unint64_t)hash
{
  unint64_t v81 = [(OTAResistanceData *)self->_r0 hash];
  unint64_t v80 = [(OTAResistanceData *)self->_r1 hash];
  unint64_t v79 = [(OTAResistanceData *)self->_baselineR1 hash];
  unint64_t v78 = [(OTAResistanceData *)self->_r2 hash];
  unint64_t v77 = [(OTAResistanceData *)self->_baselineR2 hash];
  unint64_t v76 = [(OTAResistanceData *)self->_rCFreq1 hash];
  unint64_t v75 = [(OTAResistanceData *)self->_rCFreq2 hash];
  unint64_t v74 = [(OTAResistanceData *)self->_rCFreq3 hash];
  uint64_t v73 = PBRepeatedFloatHash();
  uint64_t v72 = PBRepeatedFloatHash();
  uint64_t v71 = PBRepeatedFloatHash();
  uint64_t v70 = PBRepeatedFloatHash();
  uint64_t v69 = PBRepeatedFloatHash();
  uint64_t v68 = PBRepeatedFloatHash();
  uint64_t v67 = PBRepeatedFloatHash();
  unint64_t v66 = [(OTAResistanceData *)self->_baselineR0 hash];
  unint64_t v65 = [(OTABMUResistance *)self->_bmuResistance hash];
  unsigned int chemID = self->_chemID;
  uint64_t v64 = PBRepeatedFloatHash();
  unint64_t v63 = [(OTAResistanceData *)self->_baselineR3 hash];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    float maxRdcRatio = self->_maxRdcRatio;
    float v6 = -maxRdcRatio;
    if (maxRdcRatio >= 0.0) {
      float v6 = self->_maxRdcRatio;
    }
    float v7 = floorf(v6 + 0.5);
    float v8 = (float)(v6 - v7) * 1.8447e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmodf(v7, 1.8447e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabsf(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if ((has & 0x10) != 0)
  {
    float maxRdcRatioR2Extrap = self->_maxRdcRatioR2Extrap;
    float v11 = -maxRdcRatioR2Extrap;
    if (maxRdcRatioR2Extrap >= 0.0) {
      float v11 = self->_maxRdcRatioR2Extrap;
    }
    float v12 = floorf(v11 + 0.5);
    float v13 = (float)(v11 - v12) * 1.8447e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmodf(v12, 1.8447e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabsf(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  unint64_t v60 = v9;
  if (has)
  {
    float baselineWRdc = self->_baselineWRdc;
    float v16 = -baselineWRdc;
    if (baselineWRdc >= 0.0) {
      float v16 = self->_baselineWRdc;
    }
    float v17 = floorf(v16 + 0.5);
    float v18 = (float)(v16 - v17) * 1.8447e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmodf(v17, 1.8447e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabsf(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  unint64_t v59 = v14;
  uint64_t v58 = PBRepeatedFloatHash();
  uint64_t v57 = PBRepeatedFloatHash();
  uint64_t v56 = PBRepeatedFloatHash();
  uint64_t v55 = PBRepeatedFloatHash();
  unint64_t v54 = [(OTAResistanceData *)self->_r3 hash];
  unint64_t v53 = [(OTAResistanceData *)self->_rCFreq4 hash];
  unint64_t v52 = [(OTAResistanceData *)self->_baselineR4 hash];
  unint64_t v51 = [(OTAResistanceData *)self->_baselineRCFreq1 hash];
  unint64_t v50 = [(OTAResistanceData *)self->_baselineRCFreq2 hash];
  unint64_t v49 = [(OTAResistanceData *)self->_baselineRCFreq3 hash];
  unint64_t v48 = [(OTAResistanceData *)self->_baselineRCFreq4 hash];
  uint64_t v47 = PBRepeatedFloatHash();
  uint64_t v46 = PBRepeatedFloatHash();
  uint64_t v45 = PBRepeatedFloatHash();
  uint64_t v44 = PBRepeatedFloatHash();
  uint64_t v43 = PBRepeatedFloatHash();
  uint64_t v42 = PBRepeatedFloatHash();
  uint64_t v41 = PBRepeatedFloatHash();
  uint64_t v40 = PBRepeatedFloatHash();
  uint64_t v39 = PBRepeatedFloatHash();
  uint64_t v38 = PBRepeatedFloatHash();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v37 = 2654435761 * self->_mLBConfig;
  }
  else {
    uint64_t v37 = 0;
  }
  unint64_t v61 = v4;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    float wRdcRatioThresh = self->_wRdcRatioThresh;
    float v21 = -wRdcRatioThresh;
    if (wRdcRatioThresh >= 0.0) {
      float v21 = self->_wRdcRatioThresh;
    }
    float v22 = floorf(v21 + 0.5);
    float v23 = (float)(v21 - v22) * 1.8447e19;
    unint64_t v19 = 2654435761u * (unint64_t)fmodf(v22, 1.8447e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0) {
        v19 += (unint64_t)v23;
      }
    }
    else
    {
      v19 -= (unint64_t)fabsf(v23);
    }
  }
  else
  {
    unint64_t v19 = 0;
  }
  uint64_t v36 = PBRepeatedFloatHash();
  uint64_t v24 = PBRepeatedFloatHash();
  uint64_t v25 = PBRepeatedFloatHash();
  unint64_t v26 = [(OTAResistanceData *)self->_rdc hash];
  uint64_t v27 = PBRepeatedFloatHash();
  uint64_t v28 = PBRepeatedFloatHash();
  uint64_t v29 = PBRepeatedFloatHash();
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    float maxRdcR25Ratio = self->_maxRdcR25Ratio;
    float v32 = -maxRdcR25Ratio;
    if (maxRdcR25Ratio >= 0.0) {
      float v32 = self->_maxRdcR25Ratio;
    }
    float v33 = floorf(v32 + 0.5);
    float v34 = (float)(v32 - v33) * 1.8447e19;
    unint64_t v30 = 2654435761u * (unint64_t)fmodf(v33, 1.8447e19);
    if (v34 >= 0.0)
    {
      if (v34 > 0.0) {
        v30 += (unint64_t)v34;
      }
    }
    else
    {
      v30 -= (unint64_t)fabsf(v34);
    }
  }
  else
  {
    unint64_t v30 = 0;
  }
  return v80 ^ v81 ^ v79 ^ v78 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ (2654435761 * chemID) ^ v64 ^ v63 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v19 ^ v36 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  r0 = self->_r0;
  uint64_t v6 = v4[99];
  id v133 = v4;
  if (r0)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[OTAResistanceData mergeFrom:](r0, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[OTAParamRC setR0:](self, "setR0:");
  }
  unint64_t v4 = v133;
LABEL_7:
  r1 = self->_r1;
  uint64_t v8 = v4[100];
  if (r1)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[OTAResistanceData mergeFrom:](r1, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[OTAParamRC setR1:](self, "setR1:");
  }
  unint64_t v4 = v133;
LABEL_13:
  baselineR1 = self->_baselineR1;
  uint64_t v10 = v4[86];
  if (baselineR1)
  {
    if (!v10) {
      goto LABEL_19;
    }
    -[OTAResistanceData mergeFrom:](baselineR1, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_19;
    }
    -[OTAParamRC setBaselineR1:](self, "setBaselineR1:");
  }
  unint64_t v4 = v133;
LABEL_19:
  r2 = self->_r2;
  uint64_t v12 = v4[101];
  if (r2)
  {
    if (!v12) {
      goto LABEL_25;
    }
    -[OTAResistanceData mergeFrom:](r2, "mergeFrom:");
  }
  else
  {
    if (!v12) {
      goto LABEL_25;
    }
    -[OTAParamRC setR2:](self, "setR2:");
  }
  unint64_t v4 = v133;
LABEL_25:
  baselineR2 = self->_baselineR2;
  uint64_t v14 = v4[87];
  if (baselineR2)
  {
    if (!v14) {
      goto LABEL_31;
    }
    -[OTAResistanceData mergeFrom:](baselineR2, "mergeFrom:");
  }
  else
  {
    if (!v14) {
      goto LABEL_31;
    }
    -[OTAParamRC setBaselineR2:](self, "setBaselineR2:");
  }
  unint64_t v4 = v133;
LABEL_31:
  rCFreq1 = self->_rCFreq1;
  uint64_t v16 = v4[103];
  if (rCFreq1)
  {
    if (!v16) {
      goto LABEL_37;
    }
    -[OTAResistanceData mergeFrom:](rCFreq1, "mergeFrom:");
  }
  else
  {
    if (!v16) {
      goto LABEL_37;
    }
    -[OTAParamRC setRCFreq1:](self, "setRCFreq1:");
  }
  unint64_t v4 = v133;
LABEL_37:
  rCFreq2 = self->_rCFreq2;
  uint64_t v18 = v4[104];
  if (rCFreq2)
  {
    if (!v18) {
      goto LABEL_43;
    }
    -[OTAResistanceData mergeFrom:](rCFreq2, "mergeFrom:");
  }
  else
  {
    if (!v18) {
      goto LABEL_43;
    }
    -[OTAParamRC setRCFreq2:](self, "setRCFreq2:");
  }
  unint64_t v4 = v133;
LABEL_43:
  rCFreq3 = self->_rCFreq3;
  uint64_t v20 = v4[105];
  if (rCFreq3)
  {
    if (!v20) {
      goto LABEL_49;
    }
    -[OTAResistanceData mergeFrom:](rCFreq3, "mergeFrom:");
  }
  else
  {
    if (!v20) {
      goto LABEL_49;
    }
    -[OTAParamRC setRCFreq3:](self, "setRCFreq3:");
  }
  unint64_t v4 = v133;
LABEL_49:
  float v21 = (char *)[v4 agingCoeffForR0sCount];
  if (v21)
  {
    float v22 = v21;
    for (uint64_t i = 0; i != v22; ++i)
    {
      [v133 agingCoeffForR0AtIndex:i];
      -[OTAParamRC addAgingCoeffForR0:](self, "addAgingCoeffForR0:");
    }
  }
  uint64_t v24 = (char *)[v133 agingCoeffForR0TemperatureCoeffsCount];
  if (v24)
  {
    uint64_t v25 = v24;
    for (uint64_t j = 0; j != v25; ++j)
    {
      [v133 agingCoeffForR0TemperatureCoeffAtIndex:j];
      -[OTAParamRC addAgingCoeffForR0TemperatureCoeff:](self, "addAgingCoeffForR0TemperatureCoeff:");
    }
  }
  uint64_t v27 = (char *)[v133 agingCoeffForR1sCount];
  if (v27)
  {
    uint64_t v28 = v27;
    for (uint64_t k = 0; k != v28; ++k)
    {
      [v133 agingCoeffForR1AtIndex:k];
      -[OTAParamRC addAgingCoeffForR1:](self, "addAgingCoeffForR1:");
    }
  }
  unint64_t v30 = (char *)[v133 agingCoeffForR1TemperatureCoeffsCount];
  if (v30)
  {
    id v31 = v30;
    for (uint64_t m = 0; m != v31; ++m)
    {
      [v133 agingCoeffForR1TemperatureCoeffAtIndex:m];
      -[OTAParamRC addAgingCoeffForR1TemperatureCoeff:](self, "addAgingCoeffForR1TemperatureCoeff:");
    }
  }
  float v33 = (char *)[v133 agingCoeffForR2sCount];
  if (v33)
  {
    float v34 = v33;
    for (uint64_t n = 0; n != v34; ++n)
    {
      [v133 agingCoeffForR2AtIndex:n];
      -[OTAParamRC addAgingCoeffForR2:](self, "addAgingCoeffForR2:");
    }
  }
  uint64_t v36 = (char *)[v133 agingCoeffForR2TemperatureCoeffsCount];
  if (v36)
  {
    uint64_t v37 = v36;
    for (iuint64_t i = 0; ii != v37; ++ii)
    {
      [v133 agingCoeffForR2TemperatureCoeffAtIndex:ii];
      -[OTAParamRC addAgingCoeffForR2TemperatureCoeff:](self, "addAgingCoeffForR2TemperatureCoeff:");
    }
  }
  uint64_t v39 = (char *)[v133 baselineRdcsCount];
  if (v39)
  {
    uint64_t v40 = v39;
    for (juint64_t j = 0; jj != v40; ++jj)
    {
      [v133 baselineRdcAtIndex:jj];
      -[OTAParamRC addBaselineRdc:](self, "addBaselineRdc:");
    }
  }
  baselineR0 = self->_baselineR0;
  id v43 = v133;
  uint64_t v44 = *((void *)v133 + 85);
  if (baselineR0)
  {
    if (!v44) {
      goto LABEL_76;
    }
    -[OTAResistanceData mergeFrom:](baselineR0, "mergeFrom:");
  }
  else
  {
    if (!v44) {
      goto LABEL_76;
    }
    -[OTAParamRC setBaselineR0:](self, "setBaselineR0:");
  }
  id v43 = v133;
LABEL_76:
  bmuResistance = self->_bmuResistance;
  uint64_t v46 = *((void *)v43 + 95);
  if (bmuResistance)
  {
    if (!v46) {
      goto LABEL_82;
    }
    -[OTABMUResistance mergeFrom:](bmuResistance, "mergeFrom:");
  }
  else
  {
    if (!v46) {
      goto LABEL_82;
    }
    -[OTAParamRC setBmuResistance:](self, "setBmuResistance:");
  }
  id v43 = v133;
LABEL_82:
  self->_unsigned int chemID = *((_DWORD *)v43 + 192);
  uint64_t v47 = (char *)[v43 gridOCVsCount];
  if (v47)
  {
    unint64_t v48 = v47;
    for (kuint64_t k = 0; kk != v48; ++kk)
    {
      [v133 gridOCVAtIndex:kk];
      -[OTAParamRC addGridOCV:](self, "addGridOCV:");
    }
  }
  baselineR3 = self->_baselineR3;
  id v51 = v133;
  uint64_t v52 = *((void *)v133 + 88);
  if (baselineR3)
  {
    if (!v52) {
      goto LABEL_91;
    }
    -[OTAResistanceData mergeFrom:](baselineR3, "mergeFrom:");
  }
  else
  {
    if (!v52) {
      goto LABEL_91;
    }
    -[OTAParamRC setBaselineR3:](self, "setBaselineR3:");
  }
  id v51 = v133;
LABEL_91:
  char v53 = *((unsigned char *)v51 + 868);
  if ((v53 & 8) != 0)
  {
    self->_float maxRdcRatio = *((float *)v51 + 195);
    *(unsigned char *)&self->_has |= 8u;
    char v53 = *((unsigned char *)v51 + 868);
    if ((v53 & 0x10) == 0)
    {
LABEL_93:
      if ((v53 & 1) == 0) {
        goto LABEL_95;
      }
      goto LABEL_94;
    }
  }
  else if ((*((unsigned char *)v51 + 868) & 0x10) == 0)
  {
    goto LABEL_93;
  }
  self->_float maxRdcRatioR2Extrap = *((float *)v51 + 196);
  *(unsigned char *)&self->_has |= 0x10u;
  if (*((unsigned char *)v51 + 868))
  {
LABEL_94:
    self->_float baselineWRdc = *((float *)v51 + 188);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_95:
  unint64_t v54 = (char *)[v51 slopeForR0ExtrapsCount];
  if (v54)
  {
    uint64_t v55 = v54;
    for (muint64_t m = 0; mm != v55; ++mm)
    {
      [v133 slopeForR0ExtrapAtIndex:mm];
      -[OTAParamRC addSlopeForR0Extrap:](self, "addSlopeForR0Extrap:");
    }
  }
  uint64_t v57 = (char *)[v133 slopeForR1ExtrapsCount];
  if (v57)
  {
    uint64_t v58 = v57;
    for (nuint64_t n = 0; nn != v58; ++nn)
    {
      [v133 slopeForR1ExtrapAtIndex:nn];
      -[OTAParamRC addSlopeForR1Extrap:](self, "addSlopeForR1Extrap:");
    }
  }
  unint64_t v60 = (char *)[v133 slopeForR2ExtrapsCount];
  if (v60)
  {
    unint64_t v61 = v60;
    for (uint64_t i1 = 0; i1 != v61; ++i1)
    {
      [v133 slopeForR2ExtrapAtIndex:i1];
      -[OTAParamRC addSlopeForR2Extrap:](self, "addSlopeForR2Extrap:");
    }
  }
  unint64_t v63 = (char *)[v133 slopeForR3ExtrapsCount];
  if (v63)
  {
    uint64_t v64 = v63;
    for (uint64_t i2 = 0; i2 != v64; ++i2)
    {
      [v133 slopeForR3ExtrapAtIndex:i2];
      -[OTAParamRC addSlopeForR3Extrap:](self, "addSlopeForR3Extrap:");
    }
  }
  r3 = self->_r3;
  uint64_t v67 = v133;
  uint64_t v68 = *((void *)v133 + 102);
  if (r3)
  {
    if (!v68) {
      goto LABEL_116;
    }
    -[OTAResistanceData mergeFrom:](r3, "mergeFrom:");
  }
  else
  {
    if (!v68) {
      goto LABEL_116;
    }
    -[OTAParamRC setR3:](self, "setR3:");
  }
  uint64_t v67 = v133;
LABEL_116:
  rCFreq4 = self->_rCFreq4;
  uint64_t v70 = v67[106];
  if (rCFreq4)
  {
    if (!v70) {
      goto LABEL_122;
    }
    -[OTAResistanceData mergeFrom:](rCFreq4, "mergeFrom:");
  }
  else
  {
    if (!v70) {
      goto LABEL_122;
    }
    -[OTAParamRC setRCFreq4:](self, "setRCFreq4:");
  }
  uint64_t v67 = v133;
LABEL_122:
  baselineR4 = self->_baselineR4;
  uint64_t v72 = v67[89];
  if (baselineR4)
  {
    if (!v72) {
      goto LABEL_128;
    }
    -[OTAResistanceData mergeFrom:](baselineR4, "mergeFrom:");
  }
  else
  {
    if (!v72) {
      goto LABEL_128;
    }
    -[OTAParamRC setBaselineR4:](self, "setBaselineR4:");
  }
  uint64_t v67 = v133;
LABEL_128:
  baselineRCFreq1 = self->_baselineRCFreq1;
  uint64_t v74 = v67[90];
  if (baselineRCFreq1)
  {
    if (!v74) {
      goto LABEL_134;
    }
    -[OTAResistanceData mergeFrom:](baselineRCFreq1, "mergeFrom:");
  }
  else
  {
    if (!v74) {
      goto LABEL_134;
    }
    -[OTAParamRC setBaselineRCFreq1:](self, "setBaselineRCFreq1:");
  }
  uint64_t v67 = v133;
LABEL_134:
  baselineRCFreq2 = self->_baselineRCFreq2;
  uint64_t v76 = v67[91];
  if (baselineRCFreq2)
  {
    if (!v76) {
      goto LABEL_140;
    }
    -[OTAResistanceData mergeFrom:](baselineRCFreq2, "mergeFrom:");
  }
  else
  {
    if (!v76) {
      goto LABEL_140;
    }
    -[OTAParamRC setBaselineRCFreq2:](self, "setBaselineRCFreq2:");
  }
  uint64_t v67 = v133;
LABEL_140:
  baselineRCFreq3 = self->_baselineRCFreq3;
  uint64_t v78 = v67[92];
  if (baselineRCFreq3)
  {
    if (!v78) {
      goto LABEL_146;
    }
    -[OTAResistanceData mergeFrom:](baselineRCFreq3, "mergeFrom:");
  }
  else
  {
    if (!v78) {
      goto LABEL_146;
    }
    -[OTAParamRC setBaselineRCFreq3:](self, "setBaselineRCFreq3:");
  }
  uint64_t v67 = v133;
LABEL_146:
  baselineRCFreq4 = self->_baselineRCFreq4;
  uint64_t v80 = v67[93];
  if (baselineRCFreq4)
  {
    if (!v80) {
      goto LABEL_152;
    }
    -[OTAResistanceData mergeFrom:](baselineRCFreq4, "mergeFrom:");
  }
  else
  {
    if (!v80) {
      goto LABEL_152;
    }
    -[OTAParamRC setBaselineRCFreq4:](self, "setBaselineRCFreq4:");
  }
  uint64_t v67 = v133;
LABEL_152:
  unint64_t v81 = (char *)[v67 agingCoeffForR3sCount];
  if (v81)
  {
    unint64_t v82 = v81;
    for (uint64_t i3 = 0; i3 != v82; ++i3)
    {
      [v133 agingCoeffForR3AtIndex:i3];
      -[OTAParamRC addAgingCoeffForR3:](self, "addAgingCoeffForR3:");
    }
  }
  v84 = (char *)[v133 agingCoeffForR3TemperatureCoeffsCount];
  if (v84)
  {
    unint64_t v85 = v84;
    for (uint64_t i4 = 0; i4 != v85; ++i4)
    {
      [v133 agingCoeffForR3TemperatureCoeffAtIndex:i4];
      -[OTAParamRC addAgingCoeffForR3TemperatureCoeff:](self, "addAgingCoeffForR3TemperatureCoeff:");
    }
  }
  v87 = (char *)[v133 agingCoeffForRCFreq1sCount];
  if (v87)
  {
    unint64_t v88 = v87;
    for (uint64_t i5 = 0; i5 != v88; ++i5)
    {
      [v133 agingCoeffForRCFreq1AtIndex:i5];
      -[OTAParamRC addAgingCoeffForRCFreq1:](self, "addAgingCoeffForRCFreq1:");
    }
  }
  v90 = (char *)[v133 agingCoeffForRCFreq2sCount];
  if (v90)
  {
    id v91 = v90;
    for (uint64_t i6 = 0; i6 != v91; ++i6)
    {
      [v133 agingCoeffForRCFreq2AtIndex:i6];
      -[OTAParamRC addAgingCoeffForRCFreq2:](self, "addAgingCoeffForRCFreq2:");
    }
  }
  v93 = (char *)[v133 agingCoeffForRCFreq3sCount];
  if (v93)
  {
    v94 = v93;
    for (uint64_t i7 = 0; i7 != v94; ++i7)
    {
      [v133 agingCoeffForRCFreq3AtIndex:i7];
      -[OTAParamRC addAgingCoeffForRCFreq3:](self, "addAgingCoeffForRCFreq3:");
    }
  }
  v96 = (char *)[v133 agingCoeffForRCFreq4sCount];
  if (v96)
  {
    v97 = v96;
    for (uint64_t i8 = 0; i8 != v97; ++i8)
    {
      [v133 agingCoeffForRCFreq4AtIndex:i8];
      -[OTAParamRC addAgingCoeffForRCFreq4:](self, "addAgingCoeffForRCFreq4:");
    }
  }
  v99 = (char *)[v133 agingCoeffForRCFreq1TemperatureCoeffsCount];
  if (v99)
  {
    v100 = v99;
    for (uint64_t i9 = 0; i9 != v100; ++i9)
    {
      [v133 agingCoeffForRCFreq1TemperatureCoeffAtIndex:i9];
      -[OTAParamRC addAgingCoeffForRCFreq1TemperatureCoeff:](self, "addAgingCoeffForRCFreq1TemperatureCoeff:");
    }
  }
  v102 = (char *)[v133 agingCoeffForRCFreq2TemperatureCoeffsCount];
  if (v102)
  {
    v103 = v102;
    for (uint64_t i10 = 0; i10 != v103; ++i10)
    {
      [v133 agingCoeffForRCFreq2TemperatureCoeffAtIndex:i10];
      -[OTAParamRC addAgingCoeffForRCFreq2TemperatureCoeff:](self, "addAgingCoeffForRCFreq2TemperatureCoeff:");
    }
  }
  v105 = (char *)[v133 agingCoeffForRCFreq3TemperatureCoeffsCount];
  if (v105)
  {
    v106 = v105;
    for (uint64_t i11 = 0; i11 != v106; ++i11)
    {
      [v133 agingCoeffForRCFreq3TemperatureCoeffAtIndex:i11];
      -[OTAParamRC addAgingCoeffForRCFreq3TemperatureCoeff:](self, "addAgingCoeffForRCFreq3TemperatureCoeff:");
    }
  }
  v108 = (char *)[v133 agingCoeffForRCFreq4TemperatureCoeffsCount];
  if (v108)
  {
    v109 = v108;
    for (uint64_t i12 = 0; i12 != v109; ++i12)
    {
      [v133 agingCoeffForRCFreq4TemperatureCoeffAtIndex:i12];
      -[OTAParamRC addAgingCoeffForRCFreq4TemperatureCoeff:](self, "addAgingCoeffForRCFreq4TemperatureCoeff:");
    }
  }
  char v111 = *((unsigned char *)v133 + 868);
  if ((v111 & 2) != 0)
  {
    self->_int mLBConfig = *((_DWORD *)v133 + 193);
    *(unsigned char *)&self->_has |= 2u;
    char v111 = *((unsigned char *)v133 + 868);
  }
  if ((v111 & 0x20) != 0)
  {
    self->_float wRdcRatioThresh = *((float *)v133 + 216);
    *(unsigned char *)&self->_has |= 0x20u;
  }
  v112 = (char *)[v133 gridWRdcRatiosCount];
  if (v112)
  {
    v113 = v112;
    for (uint64_t i13 = 0; i13 != v113; ++i13)
    {
      [v133 gridWRdcRatioAtIndex:i13];
      -[OTAParamRC addGridWRdcRatio:](self, "addGridWRdcRatio:");
    }
  }
  v115 = (char *)[v133 coeffSOCsCount];
  if (v115)
  {
    v116 = v115;
    for (uint64_t i14 = 0; i14 != v116; ++i14)
    {
      [v133 coeffSOCAtIndex:i14];
      -[OTAParamRC addCoeffSOC:](self, "addCoeffSOC:");
    }
  }
  v118 = (char *)[v133 coeffVsCount];
  if (v118)
  {
    v119 = v118;
    for (uint64_t i15 = 0; i15 != v119; ++i15)
    {
      [v133 coeffVAtIndex:i15];
      -[OTAParamRC addCoeffV:](self, "addCoeffV:");
    }
  }
  rdc = self->_rdc;
  v122 = v133;
  uint64_t v123 = *((void *)v133 + 107);
  if (rdc)
  {
    if (!v123) {
      goto LABEL_201;
    }
    -[OTAResistanceData mergeFrom:](rdc, "mergeFrom:");
  }
  else
  {
    if (!v123) {
      goto LABEL_201;
    }
    -[OTAParamRC setRdc:](self, "setRdc:");
  }
  v122 = v133;
LABEL_201:
  v124 = (char *)[v122 agingCoeffForRdcsCount];
  if (v124)
  {
    v125 = v124;
    for (uint64_t i16 = 0; i16 != v125; ++i16)
    {
      [v133 agingCoeffForRdcAtIndex:i16];
      -[OTAParamRC addAgingCoeffForRdc:](self, "addAgingCoeffForRdc:");
    }
  }
  v127 = (char *)[v133 agingCoeffForRdcTemperatureCoeffsCount];
  if (v127)
  {
    v128 = v127;
    for (uint64_t i17 = 0; i17 != v128; ++i17)
    {
      [v133 agingCoeffForRdcTemperatureCoeffAtIndex:i17];
      -[OTAParamRC addAgingCoeffForRdcTemperatureCoeff:](self, "addAgingCoeffForRdcTemperatureCoeff:");
    }
  }
  v130 = (char *)[v133 qmaxsCount];
  if (v130)
  {
    v131 = v130;
    for (uint64_t i18 = 0; i18 != v131; ++i18)
    {
      [v133 qmaxAtIndex:i18];
      -[OTAParamRC addQmax:](self, "addQmax:");
    }
  }
  if ((*((unsigned char *)v133 + 868) & 4) != 0)
  {
    self->_float maxRdcR25Ratio = *((float *)v133 + 194);
    *(unsigned char *)&self->_has |= 4u;
  }
}

- (OTAResistanceData)r0
{
  return self->_r0;
}

- (void)setR0:(id)a3
{
}

- (OTAResistanceData)r1
{
  return self->_r1;
}

- (void)setR1:(id)a3
{
}

- (OTAResistanceData)baselineR1
{
  return self->_baselineR1;
}

- (void)setBaselineR1:(id)a3
{
}

- (OTAResistanceData)r2
{
  return self->_r2;
}

- (void)setR2:(id)a3
{
}

- (OTAResistanceData)baselineR2
{
  return self->_baselineR2;
}

- (void)setBaselineR2:(id)a3
{
}

- (OTAResistanceData)rCFreq1
{
  return self->_rCFreq1;
}

- (void)setRCFreq1:(id)a3
{
}

- (OTAResistanceData)rCFreq2
{
  return self->_rCFreq2;
}

- (void)setRCFreq2:(id)a3
{
}

- (OTAResistanceData)rCFreq3
{
  return self->_rCFreq3;
}

- (void)setRCFreq3:(id)a3
{
}

- (OTAResistanceData)baselineR0
{
  return self->_baselineR0;
}

- (void)setBaselineR0:(id)a3
{
}

- (OTABMUResistance)bmuResistance
{
  return self->_bmuResistance;
}

- (void)setBmuResistance:(id)a3
{
}

- (unsigned)chemID
{
  return self->_chemID;
}

- (void)setChemID:(unsigned int)a3
{
  self->_unsigned int chemID = a3;
}

- (OTAResistanceData)baselineR3
{
  return self->_baselineR3;
}

- (void)setBaselineR3:(id)a3
{
}

- (float)maxRdcRatio
{
  return self->_maxRdcRatio;
}

- (float)maxRdcRatioR2Extrap
{
  return self->_maxRdcRatioR2Extrap;
}

- (float)baselineWRdc
{
  return self->_baselineWRdc;
}

- (OTAResistanceData)r3
{
  return self->_r3;
}

- (void)setR3:(id)a3
{
}

- (OTAResistanceData)rCFreq4
{
  return self->_rCFreq4;
}

- (void)setRCFreq4:(id)a3
{
}

- (OTAResistanceData)baselineR4
{
  return self->_baselineR4;
}

- (void)setBaselineR4:(id)a3
{
}

- (OTAResistanceData)baselineRCFreq1
{
  return self->_baselineRCFreq1;
}

- (void)setBaselineRCFreq1:(id)a3
{
}

- (OTAResistanceData)baselineRCFreq2
{
  return self->_baselineRCFreq2;
}

- (void)setBaselineRCFreq2:(id)a3
{
}

- (OTAResistanceData)baselineRCFreq3
{
  return self->_baselineRCFreq3;
}

- (void)setBaselineRCFreq3:(id)a3
{
}

- (OTAResistanceData)baselineRCFreq4
{
  return self->_baselineRCFreq4;
}

- (void)setBaselineRCFreq4:(id)a3
{
}

- (float)wRdcRatioThresh
{
  return self->_wRdcRatioThresh;
}

- (OTAResistanceData)rdc
{
  return self->_rdc;
}

- (void)setRdc:(id)a3
{
}

- (float)maxRdcR25Ratio
{
  return self->_maxRdcR25Ratio;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rdc, 0);
  objc_storeStrong((id *)&self->_rCFreq4, 0);
  objc_storeStrong((id *)&self->_rCFreq3, 0);
  objc_storeStrong((id *)&self->_rCFreq2, 0);
  objc_storeStrong((id *)&self->_rCFreq1, 0);
  objc_storeStrong((id *)&self->_r3, 0);
  objc_storeStrong((id *)&self->_r2, 0);
  objc_storeStrong((id *)&self->_r1, 0);
  objc_storeStrong((id *)&self->_r0, 0);
  objc_storeStrong((id *)&self->_bmuResistance, 0);
  objc_storeStrong((id *)&self->_baselineRCFreq4, 0);
  objc_storeStrong((id *)&self->_baselineRCFreq3, 0);
  objc_storeStrong((id *)&self->_baselineRCFreq2, 0);
  objc_storeStrong((id *)&self->_baselineRCFreq1, 0);
  objc_storeStrong((id *)&self->_baselineR4, 0);
  objc_storeStrong((id *)&self->_baselineR3, 0);
  objc_storeStrong((id *)&self->_baselineR2, 0);
  objc_storeStrong((id *)&self->_baselineR1, 0);

  objc_storeStrong((id *)&self->_baselineR0, 0);
}

@end