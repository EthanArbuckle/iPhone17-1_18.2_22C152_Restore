@interface PRProximityDevice
- (BOOL)proxReady;
- (NSUUID)peer;
- (PRProximityDevice)init;
- (PRProximityDevice)initWithPeer:(id)a3 andPeerModel:(id)a4 withError:(id *)a5;
- (id).cxx_construct;
- (int64_t)deviceProximity;
- (void)addSample:(BtProxData *)a3;
- (void)estimateProximity;
@end

@implementation PRProximityDevice

- (PRProximityDevice)init
{
  return 0;
}

- (PRProximityDevice)initWithPeer:(id)a3 andPeerModel:(id)a4 withError:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PRProximityDevice;
  v11 = [(PRProximityDevice *)&v20 init];
  if (v11)
  {
    os_log_t v12 = os_log_create("com.apple.Proximity", "general");
    logger = v11->_logger;
    v11->_logger = (OS_os_log *)v12;

    objc_storeStrong((id *)&v11->_peer, a3);
    objc_storeStrong((id *)&v11->_model, a4);
    v11->_proximity = 0;
    id v19 = 0;
    BOOL v14 = +[PRProximityDatabase getProximityDeviceParameters:&v19 forDeviceModel:v11->_model withError:a5];
    v15 = (PRProximityDeviceParameters *)v19;
    if (!v14)
    {

      v17 = 0;
      goto LABEL_6;
    }
    proximityParameters = v11->_proximityParameters;
    v11->_proximityParameters = v15;
  }
  v17 = v11;
LABEL_6:

  return v17;
}

- (void)addSample:(BtProxData *)a3
{
  obj = self;
  objc_sync_enter(obj);
  unint64_t value = obj->_samples.__size_.__value_;
  p_samples = &obj->_samples;
  if (value == [(PRProximityDeviceParameters *)obj->_proximityParameters samplesize])
  {
    *(int64x2_t *)&obj->_samples.__start_ = vaddq_s64(*(int64x2_t *)&obj->_samples.__start_, (int64x2_t)xmmword_19E02CED0);
    std::deque<BtProxData>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)p_samples, 1);
  }
  [(PRProximityDevice *)obj estimateProximity];
  objc_sync_exit(obj);
}

- (BOOL)proxReady
{
  unint64_t value = self->_samples.__size_.__value_;
  return value == [(PRProximityDeviceParameters *)self->_proximityParameters samplesize];
}

- (int64_t)deviceProximity
{
  return self->_proximity;
}

- (void)estimateProximity
{
}

- (NSUUID)peer
{
  return (NSUUID *)objc_getProperty(self, a2, 88, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peer, 0);
  std::deque<BtProxData>::~deque[abi:ne180100](&self->_samples.__map_.__first_);
  objc_storeStrong((id *)&self->_proximityParameters, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 2) = 0u;
  return self;
}

@end