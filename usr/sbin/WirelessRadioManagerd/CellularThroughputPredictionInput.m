@interface CellularThroughputPredictionInput
- (CellularThroughputPredictionInput)initWithMaxOfActualLowBandwidth_d:(double)a3 cellSinr:(double)a4 cellNrRSRQ:(double)a5 cellLteRSRQ:(double)a6 cellNrRSRP:(double)a7 lqmScorecellular:(double)a8 cellChannelBW:(double)a9 cellNrSNR:(double)a10 cellRsrp:(double)a11 ratType:(double)a12 cellEstimatedBW:(double)a13 cellNsaEnabled:(double)a14 cellBandInfo:(double)a15 pActualLowBandwidth:(double)a16 NRType:(double)a17;
- (NSSet)featureNames;
- (double)NRType;
- (double)cellBandInfo;
- (double)cellChannelBW;
- (double)cellEstimatedBW;
- (double)cellLteRSRQ;
- (double)cellNrRSRP;
- (double)cellNrRSRQ;
- (double)cellNrSNR;
- (double)cellNsaEnabled;
- (double)cellRsrp;
- (double)cellSinr;
- (double)lqmScorecellular;
- (double)maxOfActualLowBandwidth_d;
- (double)pActualLowBandwidth;
- (double)ratType;
- (id)featureValueForName:(id)a3;
- (void)setCellBandInfo:(double)a3;
- (void)setCellChannelBW:(double)a3;
- (void)setCellEstimatedBW:(double)a3;
- (void)setCellLteRSRQ:(double)a3;
- (void)setCellNrRSRP:(double)a3;
- (void)setCellNrRSRQ:(double)a3;
- (void)setCellNrSNR:(double)a3;
- (void)setCellNsaEnabled:(double)a3;
- (void)setCellRsrp:(double)a3;
- (void)setCellSinr:(double)a3;
- (void)setLqmScorecellular:(double)a3;
- (void)setMaxOfActualLowBandwidth_d:(double)a3;
- (void)setNRType:(double)a3;
- (void)setPActualLowBandwidth:(double)a3;
- (void)setRatType:(double)a3;
@end

@implementation CellularThroughputPredictionInput

- (CellularThroughputPredictionInput)initWithMaxOfActualLowBandwidth_d:(double)a3 cellSinr:(double)a4 cellNrRSRQ:(double)a5 cellLteRSRQ:(double)a6 cellNrRSRP:(double)a7 lqmScorecellular:(double)a8 cellChannelBW:(double)a9 cellNrSNR:(double)a10 cellRsrp:(double)a11 ratType:(double)a12 cellEstimatedBW:(double)a13 cellNsaEnabled:(double)a14 cellBandInfo:(double)a15 pActualLowBandwidth:(double)a16 NRType:(double)a17
{
  v26.receiver = self;
  v26.super_class = (Class)CellularThroughputPredictionInput;
  result = [(CellularThroughputPredictionInput *)&v26 init];
  if (result)
  {
    result->_maxOfActualLowBandwidth_d = a3;
    result->_cellSinr = a4;
    result->_cellNrRSRQ = a5;
    result->_cellLteRSRQ = a6;
    result->_cellNrRSRP = a7;
    result->_lqmScorecellular = a8;
    result->_cellChannelBW = a9;
    result->_cellNrSNR = a10;
    result->_cellRsrp = a11;
    result->_ratType = a12;
    result->_cellEstimatedBW = a13;
    result->_cellNsaEnabled = a14;
    result->_cellBandInfo = a15;
    result->_pActualLowBandwidth = a16;
    result->_NRType = a17;
  }
  return result;
}

- (NSSet)featureNames
{
  return +[NSSet setWithArray:&off_10024E188];
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"maxOfActualLowBandwidth_d"])
  {
    uint64_t v5 = 8;
LABEL_31:
    v6 = [sub_1000A368C() featureValueWithDouble:*(double *)((char *)&self->super.isa + v5)];
    goto LABEL_32;
  }
  if ([v4 isEqualToString:@"cellSinr"])
  {
    uint64_t v5 = 16;
    goto LABEL_31;
  }
  if ([v4 isEqualToString:@"cellNrRSRQ"])
  {
    uint64_t v5 = 24;
    goto LABEL_31;
  }
  if ([v4 isEqualToString:@"cellLteRSRQ"])
  {
    uint64_t v5 = 32;
    goto LABEL_31;
  }
  if ([v4 isEqualToString:@"cellNrRSRP"])
  {
    uint64_t v5 = 40;
    goto LABEL_31;
  }
  if ([v4 isEqualToString:@"lqmScorecellular"])
  {
    uint64_t v5 = 48;
    goto LABEL_31;
  }
  if ([v4 isEqualToString:@"cellChannelBW"])
  {
    uint64_t v5 = 56;
    goto LABEL_31;
  }
  if ([v4 isEqualToString:@"cellNrSNR"])
  {
    uint64_t v5 = 64;
    goto LABEL_31;
  }
  if ([v4 isEqualToString:@"cellRsrp"])
  {
    uint64_t v5 = 72;
    goto LABEL_31;
  }
  if ([v4 isEqualToString:@"ratType"])
  {
    uint64_t v5 = 80;
    goto LABEL_31;
  }
  if ([v4 isEqualToString:@"cellEstimatedBW"])
  {
    uint64_t v5 = 88;
    goto LABEL_31;
  }
  if ([v4 isEqualToString:@"cellNsaEnabled"])
  {
    uint64_t v5 = 96;
    goto LABEL_31;
  }
  if ([v4 isEqualToString:@"cellBandInfo"])
  {
    uint64_t v5 = 104;
    goto LABEL_31;
  }
  if ([v4 isEqualToString:@"pActualLowBandwidth"])
  {
    uint64_t v5 = 112;
    goto LABEL_31;
  }
  if ([v4 isEqualToString:@"NRType"])
  {
    uint64_t v5 = 120;
    goto LABEL_31;
  }
  v6 = 0;
LABEL_32:

  return v6;
}

- (double)maxOfActualLowBandwidth_d
{
  return self->_maxOfActualLowBandwidth_d;
}

- (void)setMaxOfActualLowBandwidth_d:(double)a3
{
  self->_maxOfActualLowBandwidth_d = a3;
}

- (double)cellSinr
{
  return self->_cellSinr;
}

- (void)setCellSinr:(double)a3
{
  self->_cellSinr = a3;
}

- (double)cellNrRSRQ
{
  return self->_cellNrRSRQ;
}

- (void)setCellNrRSRQ:(double)a3
{
  self->_cellNrRSRQ = a3;
}

- (double)cellLteRSRQ
{
  return self->_cellLteRSRQ;
}

- (void)setCellLteRSRQ:(double)a3
{
  self->_cellLteRSRQ = a3;
}

- (double)cellNrRSRP
{
  return self->_cellNrRSRP;
}

- (void)setCellNrRSRP:(double)a3
{
  self->_cellNrRSRP = a3;
}

- (double)lqmScorecellular
{
  return self->_lqmScorecellular;
}

- (void)setLqmScorecellular:(double)a3
{
  self->_lqmScorecellular = a3;
}

- (double)cellChannelBW
{
  return self->_cellChannelBW;
}

- (void)setCellChannelBW:(double)a3
{
  self->_cellChannelBW = a3;
}

- (double)cellNrSNR
{
  return self->_cellNrSNR;
}

- (void)setCellNrSNR:(double)a3
{
  self->_cellNrSNR = a3;
}

- (double)cellRsrp
{
  return self->_cellRsrp;
}

- (void)setCellRsrp:(double)a3
{
  self->_cellRsrp = a3;
}

- (double)ratType
{
  return self->_ratType;
}

- (void)setRatType:(double)a3
{
  self->_ratType = a3;
}

- (double)cellEstimatedBW
{
  return self->_cellEstimatedBW;
}

- (void)setCellEstimatedBW:(double)a3
{
  self->_cellEstimatedBW = a3;
}

- (double)cellNsaEnabled
{
  return self->_cellNsaEnabled;
}

- (void)setCellNsaEnabled:(double)a3
{
  self->_cellNsaEnabled = a3;
}

- (double)cellBandInfo
{
  return self->_cellBandInfo;
}

- (void)setCellBandInfo:(double)a3
{
  self->_cellBandInfo = a3;
}

- (double)pActualLowBandwidth
{
  return self->_pActualLowBandwidth;
}

- (void)setPActualLowBandwidth:(double)a3
{
  self->_pActualLowBandwidth = a3;
}

- (double)NRType
{
  return self->_NRType;
}

- (void)setNRType:(double)a3
{
  self->_NRType = a3;
}

@end