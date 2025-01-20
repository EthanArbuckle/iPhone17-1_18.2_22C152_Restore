@interface FMCongestionMetric
- (BOOL)isCongested;
- (NSString)gci;
- (id)description;
- (id)init:(unint64_t)a3 gci:(id)a4 arfnc:(unsigned int)a5 rsrp:(int)a6 rsrq:(int)a7 sinr:(int)a8 dlBottleneckScoreInvalid:(unsigned int)a9 dlBottleneckScoreNo:(unsigned int)a10 dlBottleneckScoreLow:(unsigned int)a11 dlBottleneckScoreMedium:(unsigned int)a12 dlBottleneckScoreHigh:(unsigned int)a13 ulBottleneckScoreInvalid:(unsigned int)a14 ulBottleneckScoreNo:(unsigned int)a15 ulBottleneckScoreLow:(unsigned int)a16 ulBottleneckScoreMedium:(unsigned int)a17 ulBottleneckScoreHigh:(unsigned int)a18 dataStallIndicatorAVS:(unsigned int)a19 dataStallIndicatorUL:(unsigned int)a20 isSubway:(unsigned int)a21 psPref:(unsigned int)a22 subsId:(unsigned int)a23;
- (int)rsrp;
- (int)rsrq;
- (int)sinr;
- (unint64_t)timestamp;
- (unsigned)arfcn;
- (unsigned)dataStallIndicatorAVS;
- (unsigned)dataStallIndicatorUL;
- (unsigned)dlBottleneckScoreHigh;
- (unsigned)dlBottleneckScoreInvalid;
- (unsigned)dlBottleneckScoreLow;
- (unsigned)dlBottleneckScoreMedium;
- (unsigned)dlBottleneckScoreNo;
- (unsigned)isSubway;
- (unsigned)psPref;
- (unsigned)subsId;
- (unsigned)ulBottleneckScoreHigh;
- (unsigned)ulBottleneckScoreInvalid;
- (unsigned)ulBottleneckScoreLow;
- (unsigned)ulBottleneckScoreMedium;
- (unsigned)ulBottleneckScoreNo;
@end

@implementation FMCongestionMetric

- (id)init:(unint64_t)a3 gci:(id)a4 arfnc:(unsigned int)a5 rsrp:(int)a6 rsrq:(int)a7 sinr:(int)a8 dlBottleneckScoreInvalid:(unsigned int)a9 dlBottleneckScoreNo:(unsigned int)a10 dlBottleneckScoreLow:(unsigned int)a11 dlBottleneckScoreMedium:(unsigned int)a12 dlBottleneckScoreHigh:(unsigned int)a13 ulBottleneckScoreInvalid:(unsigned int)a14 ulBottleneckScoreNo:(unsigned int)a15 ulBottleneckScoreLow:(unsigned int)a16 ulBottleneckScoreMedium:(unsigned int)a17 ulBottleneckScoreHigh:(unsigned int)a18 dataStallIndicatorAVS:(unsigned int)a19 dataStallIndicatorUL:(unsigned int)a20 isSubway:(unsigned int)a21 psPref:(unsigned int)a22 subsId:(unsigned int)a23
{
  id v30 = a4;
  v35.receiver = self;
  v35.super_class = (Class)FMCongestionMetric;
  v31 = [(FMCongestionMetric *)&v35 init];
  v32 = v31;
  if (v31)
  {
    v31->_timestamp = a3;
    objc_storeStrong((id *)&v31->_gci, a4);
    v32->_arfcn = a5;
    v32->_rsrp = a6;
    v32->_rsrq = a7;
    v32->_sinr = a8;
    v32->_dlBottleneckScoreInvalid = a9;
    v32->_dlBottleneckScoreNo = a10;
    v32->_dlBottleneckScoreLow = a11;
    v32->_dlBottleneckScoreMedium = a12;
    v32->_dlBottleneckScoreHigh = a13;
    v32->_ulBottleneckScoreInvalid = a14;
    v32->_ulBottleneckScoreNo = a15;
    v32->_ulBottleneckScoreLow = a16;
    v32->_ulBottleneckScoreMedium = a17;
    v32->_ulBottleneckScoreHigh = a18;
    v32->_dataStallIndicatorAVS = a19;
    v32->_dataStallIndicatorUL = a20;
    v32->_isSubway = a21;
    v32->_psPref = a22;
    v32->_subsId = a23;
    v33 = v32;
  }

  return v32;
}

- (unsigned)ulBottleneckScoreHigh
{
  return self->_ulBottleneckScoreHigh;
}

- (unsigned)dlBottleneckScoreMedium
{
  return self->_dlBottleneckScoreMedium;
}

- (unsigned)dlBottleneckScoreLow
{
  return self->_dlBottleneckScoreLow;
}

- (unsigned)dlBottleneckScoreHigh
{
  return self->_dlBottleneckScoreHigh;
}

- (unsigned)ulBottleneckScoreNo
{
  return self->_ulBottleneckScoreNo;
}

- (unsigned)ulBottleneckScoreMedium
{
  return self->_ulBottleneckScoreMedium;
}

- (unsigned)ulBottleneckScoreLow
{
  return self->_ulBottleneckScoreLow;
}

- (unsigned)ulBottleneckScoreInvalid
{
  return self->_ulBottleneckScoreInvalid;
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (int)sinr
{
  return self->_sinr;
}

- (int)rsrq
{
  return self->_rsrq;
}

- (int)rsrp
{
  return self->_rsrp;
}

- (unsigned)psPref
{
  return self->_psPref;
}

- (unsigned)isSubway
{
  return self->_isSubway;
}

- (NSString)gci
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (unsigned)dlBottleneckScoreNo
{
  return self->_dlBottleneckScoreNo;
}

- (unsigned)dlBottleneckScoreInvalid
{
  return self->_dlBottleneckScoreInvalid;
}

- (unsigned)dataStallIndicatorUL
{
  return self->_dataStallIndicatorUL;
}

- (unsigned)dataStallIndicatorAVS
{
  return self->_dataStallIndicatorAVS;
}

- (void).cxx_destruct
{
}

- (BOOL)isCongested
{
  return [(FMCongestionMetric *)self dlBottleneckScoreLow]
      || [(FMCongestionMetric *)self dlBottleneckScoreMedium]
      || [(FMCongestionMetric *)self dlBottleneckScoreHigh]
      || [(FMCongestionMetric *)self ulBottleneckScoreHigh] != 0;
}

- (id)description
{
  unint64_t v5 = [(FMCongestionMetric *)self timestamp];
  v6 = [(FMCongestionMetric *)self gci];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"timestamp %llu, gci %@, arfcn %u, rsrp %d, rsrq %d, sinr %d, dlBottleneckScoreInvalid %u, dlBottleneckScoreNo %u, dlBottleneckScoreLow %u, dlBottleneckScoreMedium %u, dlBottleneckScoreHigh %u, ulBottleneckScoreInvalid %u, ulBottleneckScoreNo %u, ulBottleneckScoreLow %u, ulBottleneckScoreMedium %u, ulBottleneckScoreHigh %u, dataStallIndicatorAVS %u, dataStallIndicatorUL %u, isSubway %u, psPref %u, subsId %u", v5, v6, [(FMCongestionMetric *)self arfcn], [(FMCongestionMetric *)self rsrp], [(FMCongestionMetric *)self rsrq], [(FMCongestionMetric *)self sinr], [(FMCongestionMetric *)self dlBottleneckScoreInvalid], [(FMCongestionMetric *)self dlBottleneckScoreNo], [(FMCongestionMetric *)self dlBottleneckScoreLow], [(FMCongestionMetric *)self dlBottleneckScoreMedium], [(FMCongestionMetric *)self dlBottleneckScoreHigh], [(FMCongestionMetric *)self ulBottleneckScoreInvalid], [(FMCongestionMetric *)self ulBottleneckScoreNo], [(FMCongestionMetric *)self ulBottleneckScoreLow], [(FMCongestionMetric *)self ulBottleneckScoreMedium], [(FMCongestionMetric *)self ulBottleneckScoreHigh],
    [(FMCongestionMetric *)self dataStallIndicatorAVS],
    [(FMCongestionMetric *)self dataStallIndicatorUL],
    [(FMCongestionMetric *)self isSubway],
    [(FMCongestionMetric *)self psPref],
  v3 = [(FMCongestionMetric *)self subsId]);

  return v3;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)arfcn
{
  return self->_arfcn;
}

@end