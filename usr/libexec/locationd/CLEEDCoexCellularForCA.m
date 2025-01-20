@interface CLEEDCoexCellularForCA
- (CLEEDCoexCellularForCA)initWithCoexMetricDict:(id)a3;
- (int)cellularRAT;
- (int64_t)bottleneckRsrp;
- (int64_t)bottleneckState;
- (int64_t)cellularBand;
- (int64_t)maxCellularRSRP;
- (int64_t)minCellularRSRP;
- (unint64_t)bottleneckToggleCount;
- (void)setBottleneckRsrp:(int64_t)a3;
- (void)setBottleneckState:(int64_t)a3;
- (void)setBottleneckToggleCount:(unint64_t)a3;
- (void)setCellularBand:(int64_t)a3;
- (void)setCellularRAT:(int)a3;
- (void)setMaxCellularRSRP:(int64_t)a3;
- (void)setMinCellularRSRP:(int64_t)a3;
@end

@implementation CLEEDCoexCellularForCA

- (CLEEDCoexCellularForCA)initWithCoexMetricDict:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CLEEDCoexCellularForCA;
  v4 = [(CLEEDCoexCellularForCA *)&v8 init];
  v5 = v4;
  if (v4)
  {
    if (a3)
    {
      v4->_cellularRAT = [[objc_msgSend(objc_msgSend(a3, "valueForKey:", @"cellularRAT"), "intValue");
      v5->_cellularBand = (int)[objc_msgSend(objc_msgSend(a3, "valueForKey:", @"cellularBand"), "intValue");
      v5->_minCellularRSRP = (int)[objc_msgSend(objc_msgSend(a3, "valueForKey:", @"minCellularRSRP"), "intValue");
      v5->_maxCellularRSRP = (int)[objc_msgSend(objc_msgSend(a3, "valueForKey:", @"maxCellularRSRP"), "intValue");
      v5->_bottleneckState = (int)[objc_msgSend(a3, "valueForKey:", @"bottleneckEmergency") intValue];
      v5->_bottleneckToggleCount = [[objc_msgSend(a3, "valueForKey:", @"bottleneckToggleCount") unsignedIntValue];
      uint64_t v6 = (int)[(int)[a3 valueForKey:@"bottleneckRsrp"] intValue];
    }
    else
    {
      *(_OWORD *)&v4->_maxCellularRSRP = xmmword_101D73220;
      v4->_cellularBand = -1;
      v4->_bottleneckState = -1;
      v4->_bottleneckToggleCount = 0;
      uint64_t v6 = -150;
    }
    v5->_bottleneckRsrp = v6;
  }
  return v5;
}

- (int64_t)maxCellularRSRP
{
  return self->_maxCellularRSRP;
}

- (void)setMaxCellularRSRP:(int64_t)a3
{
  self->_maxCellularRSRP = a3;
}

- (int64_t)minCellularRSRP
{
  return self->_minCellularRSRP;
}

- (void)setMinCellularRSRP:(int64_t)a3
{
  self->_minCellularRSRP = a3;
}

- (int64_t)cellularBand
{
  return self->_cellularBand;
}

- (void)setCellularBand:(int64_t)a3
{
  self->_cellularBand = a3;
}

- (int)cellularRAT
{
  return self->_cellularRAT;
}

- (void)setCellularRAT:(int)a3
{
  self->_cellularRAT = a3;
}

- (int64_t)bottleneckState
{
  return self->_bottleneckState;
}

- (void)setBottleneckState:(int64_t)a3
{
  self->_bottleneckState = a3;
}

- (unint64_t)bottleneckToggleCount
{
  return self->_bottleneckToggleCount;
}

- (void)setBottleneckToggleCount:(unint64_t)a3
{
  self->_bottleneckToggleCount = a3;
}

- (int64_t)bottleneckRsrp
{
  return self->_bottleneckRsrp;
}

- (void)setBottleneckRsrp:(int64_t)a3
{
  self->_bottleneckRsrp = a3;
}

@end