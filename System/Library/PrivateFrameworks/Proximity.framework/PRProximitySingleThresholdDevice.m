@interface PRProximitySingleThresholdDevice
- (BOOL)proxReady;
- (NSUUID)peer;
- (PRProximitySingleThresholdDevice)init;
- (PRProximitySingleThresholdDevice)initWithPeer:(id)a3 andPeerModel:(id)a4 withError:(id *)a5;
- (id).cxx_construct;
- (int64_t)deviceProximity;
- (void)addSample:(BtProxData *)a3;
@end

@implementation PRProximitySingleThresholdDevice

- (PRProximitySingleThresholdDevice)init
{
  return 0;
}

- (PRProximitySingleThresholdDevice)initWithPeer:(id)a3 andPeerModel:(id)a4 withError:(id *)a5
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v24.receiver = self;
  v24.super_class = (Class)PRProximitySingleThresholdDevice;
  id v11 = [(PRProximitySingleThresholdDevice *)&v24 init];
  if (v11)
  {
    os_log_t v12 = os_log_create("com.apple.Proximity", "SingleThreshold");
    v13 = (void *)*((void *)v11 + 1);
    *((void *)v11 + 1) = v12;

    objc_storeStrong((id *)v11 + 13, a3);
    objc_storeStrong((id *)v11 + 2, a4);
    *((void *)v11 + 9) = 0;
    *((void *)v11 + 11) = 0;
    *((void *)v11 + 12) = 0xBFF0000000000000;
    int64_t v14 = +[PRProximityDatabase getScannerDeviceModel];
    int64_t v15 = +[PRProximityDatabase getPRDeviceModelFromModelId:v10];
    if (v14 != 21)
    {
      int64_t v16 = v15;
      if (v15 != 21)
      {
        int v17 = +[PRProximityDatabase getDeviceBtTxPowerFromModel:v15];
        int v18 = +[PRProximityDatabase getDeviceBtRxOffsetFromModel:v14];
        if (!v14)
        {
          v19 = *((void *)v11 + 1);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            int v26 = v18;
            _os_log_impl(&dword_19DFF5000, v19, OS_LOG_TYPE_DEFAULT, "Unknown scanning model; using default rx offset of %d.",
              buf,
              8u);
          }
        }
        if (!v16)
        {
          v20 = *((void *)v11 + 1);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            int v26 = v17;
            _os_log_impl(&dword_19DFF5000, v20, OS_LOG_TYPE_DEFAULT, "Unknown advertising model; using default tx power of %d.",
              buf,
              8u);
          }
        }
        operator new();
      }
    }
    if (a5)
    {
      v21 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v27 = *MEMORY[0x1E4F28568];
      v28[0] = @"Unknown error getting device model; prox unavailable";
      v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
      *a5 = [v21 errorWithDomain:@"com.apple.Proximity.ErrorDomain" code:999 userInfo:v22];

      a5 = 0;
    }
  }
  else
  {
    a5 = (id *)0;
  }

  return (PRProximitySingleThresholdDevice *)a5;
}

- (void)addSample:(BtProxData *)a3
{
  obj = self;
  objc_sync_enter(obj);
  SingleThresholdProx::Estimator::addRSSISample((SingleThresholdProx::Estimator *)obj->_estimator.__ptr_.__value_, (int)a3->var1, a3->var2, a3->var0);
  if (a3->var0 > obj->_mostRecentSampleTime) {
    obj->_mostRecentSampleTime = a3->var0;
  }
  ++obj->_sampleCount;
  objc_sync_exit(obj);
}

- (BOOL)proxReady
{
  int64_t sampleCount = self->_sampleCount;
  if (sampleCount >= 2)
  {
    unsigned int v5 = 0;
    unint64_t v6 = 0xBFF0000000000000;
    char v7 = 0;
    SingleThresholdProx::Estimator::getRangeMeasurement((uint64_t)self->_estimator.__ptr_.__value_, (uint64_t)&v5, self->_mostRecentSampleTime);
    if (v5 <= 3) {
      self->_proximity = qword_19E02CEE0[v5];
    }
  }
  return sampleCount > 1;
}

- (int64_t)deviceProximity
{
  return self->_proximity;
}

- (NSUUID)peer
{
  return (NSUUID *)objc_getProperty(self, a2, 104, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peer, 0);
  value = self->_estimator.__ptr_.__value_;
  self->_estimator.__ptr_.__value_ = 0;
  if (value) {
    std::default_delete<SingleThresholdProx::Estimator>::operator()[abi:ne180100]((uint64_t)&self->_estimator, (uint64_t)value);
  }
  std::deque<BtProxData>::~deque[abi:ne180100](&self->_samples.__map_.__first_);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *((void *)self + 10) = 0;
  return self;
}

@end