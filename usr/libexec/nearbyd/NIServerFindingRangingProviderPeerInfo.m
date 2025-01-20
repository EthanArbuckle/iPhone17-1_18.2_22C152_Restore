@interface NIServerFindingRangingProviderPeerInfo
- (BOOL)getRangingActive;
- (NIServerFindingAdvertisement)advertisement;
- (NIServerFindingRangingProviderPeerInfo)initWithAdvertisement:(id)a3;
- (id).cxx_construct;
- (optional<rose::finding::FindeeData>)getAlgorithmAidingData;
- (optional<rose::finding::SignallingData>)getSignallingData;
- (void)resetAlgorithmAidingData;
- (void)resetSignallingData;
- (void)setAdvertisement:(id)a3;
- (void)setAlgorithmAidingData:(const void *)a3;
- (void)setRangingActive:(BOOL)a3;
- (void)setSignallingData:(const void *)a3;
@end

@implementation NIServerFindingRangingProviderPeerInfo

- (NIServerFindingRangingProviderPeerInfo)initWithAdvertisement:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NIServerFindingRangingProviderPeerInfo;
  v6 = [(NIServerFindingRangingProviderPeerInfo *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_advertisement, a3);
    if (v7->_algorithmAidingData.__engaged_) {
      v7->_algorithmAidingData.__engaged_ = 0;
    }
    if (v7->_signallingData.__engaged_) {
      v7->_signallingData.__engaged_ = 0;
    }
    *(&v7->_rangingActive + 1) = 0;
  }

  return v7;
}

- (void)setAlgorithmAidingData:(const void *)a3
{
  p_algorithmAidingData = &self->_algorithmAidingData;
  long long v4 = *(_OWORD *)a3;
  long long v5 = *((_OWORD *)a3 + 2);
  if (self->_algorithmAidingData.__engaged_)
  {
    *(_OWORD *)&self->_algorithmAidingData.var0.__val_.bounded_displacement.__engaged_ = *((_OWORD *)a3 + 1);
    *(_OWORD *)&self->_algorithmAidingData.var0.__val_.measured_displacement.var0.__val_.applicabilityTimestamp = v5;
    *(_OWORD *)&p_algorithmAidingData->var0.__null_state_ = v4;
    long long v6 = *((_OWORD *)a3 + 3);
    long long v7 = *((_OWORD *)a3 + 4);
    long long v8 = *((_OWORD *)a3 + 6);
    *(_OWORD *)&self->_algorithmAidingData.var0.__val_.measured_velocity_change.var0.__null_state_ = *((_OWORD *)a3 + 5);
    *(_OWORD *)&self->_algorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH1 = v8;
    *(_OWORD *)&self->_algorithmAidingData.var0.__val_.measured_displacement.var0.__val_.displacementH1 = v6;
    *(_OWORD *)&self->_algorithmAidingData.var0.__val_.measured_displacement.var0.__val_.displacementV = v7;
    long long v9 = *((_OWORD *)a3 + 7);
    long long v10 = *((_OWORD *)a3 + 8);
    long long v11 = *((_OWORD *)a3 + 9);
    *(_OWORD *)((char *)&self->_algorithmAidingData.var0.__val_.location_data.var0.__val_.uncertainty + 2) = *(_OWORD *)((char *)a3 + 154);
    *(_OWORD *)&self->_algorithmAidingData.var0.__val_.mach_absolute_receipt_timestamp.__engaged_ = v10;
    *(_OWORD *)&self->_algorithmAidingData.var0.__val_.location_data.var0.__val_.easterlyOffsetM = v11;
    *(_OWORD *)&self->_algorithmAidingData.var0.__val_.measured_velocity_change.__engaged_ = v9;
  }
  else
  {
    *(_OWORD *)&self->_algorithmAidingData.var0.__val_.bounded_displacement.__engaged_ = *((_OWORD *)a3 + 1);
    *(_OWORD *)&self->_algorithmAidingData.var0.__val_.measured_displacement.var0.__val_.applicabilityTimestamp = v5;
    *(_OWORD *)&p_algorithmAidingData->var0.__null_state_ = v4;
    long long v12 = *((_OWORD *)a3 + 3);
    long long v13 = *((_OWORD *)a3 + 4);
    long long v14 = *((_OWORD *)a3 + 6);
    *(_OWORD *)&self->_algorithmAidingData.var0.__val_.measured_velocity_change.var0.__null_state_ = *((_OWORD *)a3 + 5);
    *(_OWORD *)&self->_algorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH1 = v14;
    *(_OWORD *)&self->_algorithmAidingData.var0.__val_.measured_displacement.var0.__val_.displacementH1 = v12;
    *(_OWORD *)&self->_algorithmAidingData.var0.__val_.measured_displacement.var0.__val_.displacementV = v13;
    long long v15 = *((_OWORD *)a3 + 7);
    long long v16 = *((_OWORD *)a3 + 8);
    long long v17 = *((_OWORD *)a3 + 10);
    *(_OWORD *)&self->_algorithmAidingData.var0.__val_.location_data.var0.__val_.easterlyOffsetM = *((_OWORD *)a3 + 9);
    *(_OWORD *)&self->_algorithmAidingData.var0.__val_.location_data.__engaged_ = v17;
    *(_OWORD *)&self->_algorithmAidingData.var0.__val_.measured_velocity_change.__engaged_ = v15;
    *(_OWORD *)&self->_algorithmAidingData.var0.__val_.mach_absolute_receipt_timestamp.__engaged_ = v16;
    self->_algorithmAidingData.__engaged_ = 1;
  }
}

- (void)resetAlgorithmAidingData
{
  if (self->_algorithmAidingData.__engaged_) {
    self->_algorithmAidingData.__engaged_ = 0;
  }
}

- (optional<rose::finding::FindeeData>)getAlgorithmAidingData
{
  long long v3 = *(_OWORD *)&self->var0.__val_.location_data.var0.__val_.uncertainty;
  *(_OWORD *)&retstr->var0.__val_.mach_absolute_receipt_timestamp.__engaged_ = *(_OWORD *)&self->var0.__val_.location_data.var0.__null_state_;
  *(_OWORD *)&retstr->var0.__val_.location_data.var0.__val_.easterlyOffsetM = v3;
  *(_OWORD *)&retstr->var0.__val_.location_data.__engaged_ = *(_OWORD *)&self->var0.__val_.good_gnss_conditions_detected.var0.__null_state_;
  *(double *)&retstr->__engaged_ = self[1].var0.__val_.bounded_displacement.var0.__val_.enterTimestamp;
  long long v4 = *(_OWORD *)&self->var0.__val_.measured_velocity_change.var0.__val_.applicabilityTimestamp;
  *(_OWORD *)&retstr->var0.__val_.measured_displacement.var0.__val_.displacementV = *(_OWORD *)&self->var0.__val_.measured_displacement.__engaged_;
  *(_OWORD *)&retstr->var0.__val_.measured_velocity_change.var0.__null_state_ = v4;
  optional<double> mach_absolute_receipt_timestamp = self->var0.__val_.mach_absolute_receipt_timestamp;
  *(_OWORD *)&retstr->var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH1 = *(_OWORD *)&self->var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH2;
  *(optional<double> *)&retstr->var0.__val_.measured_velocity_change.__engaged_ = mach_absolute_receipt_timestamp;
  long long v6 = *(_OWORD *)&self->var0.__val_.measured_displacement.var0.__null_state_;
  *(_OWORD *)&retstr->var0.__null_state_ = *(_OWORD *)&self->var0.__val_.bounded_displacement.var0.__val_.category;
  *(_OWORD *)&retstr->var0.__val_.bounded_displacement.__engaged_ = v6;
  long long v7 = *(_OWORD *)&self->var0.__val_.measured_displacement.var0.__val_.displacementH2;
  *(_OWORD *)&retstr->var0.__val_.measured_displacement.var0.__val_.applicabilityTimestamp = *(_OWORD *)&self->var0.__val_.measured_displacement.var0.__val_.displacement_source;
  *(_OWORD *)&retstr->var0.__val_.measured_displacement.var0.__val_.displacementH1 = v7;
  return self;
}

- (void)setSignallingData:(const void *)a3
{
  BOOL engaged = self->_signallingData.__engaged_;
  char v4 = *((unsigned char *)a3 + 8);
  *(void *)&self->_signallingData.var0.__null_state_ = *(void *)a3;
  self->_signallingData.var0.__val_.isPhone = v4;
  if (!engaged) {
    self->_signallingData.__engaged_ = 1;
  }
}

- (void)resetSignallingData
{
  if (self->_signallingData.__engaged_) {
    self->_signallingData.__engaged_ = 0;
  }
}

- (optional<rose::finding::SignallingData>)getSignallingData
{
  __int16 v2 = *(_WORD *)&self->_signallingData.var0.__val_.isPhone;
  uint64_t v3 = *(void *)&self->_signallingData.var0.__null_state_;
  *(void *)&result.var0.__null_state_ = v3;
  *(_WORD *)&result.var0.__val_.isPhone = v2;
  return result;
}

- (BOOL)getRangingActive
{
  return *(&self->_rangingActive + 1);
}

- (void)setRangingActive:(BOOL)a3
{
  *(&self->_rangingActive + 1) = a3;
}

- (NIServerFindingAdvertisement)advertisement
{
  return self->_advertisement;
}

- (void)setAdvertisement:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((unsigned char *)self + 8) = 0;
  *((unsigned char *)self + 184) = 0;
  *((unsigned char *)self + 192) = 0;
  *((unsigned char *)self + 201) = 0;
  return self;
}

@end