@interface AccessoryUwbSessionTracking
- (AccessoryUwbSessionTracking)initWithServiceRequest:(const void *)a3 startOptions:(const void *)a4 shareableConfigData:(id)a5 processName:(id)a6 accessoryConfigData:(const void *)a7 persistWhileDetached:(BOOL)a8;
- (BOOL)persistWhileDetached;
- (NSData)shareableConfigData;
- (NSMutableSet)interestedClients;
- (NSString)processName;
- (OS_dispatch_source)rangingRetryTimer;
- (double)initTime;
- (double)timeOfLatestSessionLifecycleChange;
- (id).cxx_construct;
- (unsigned)rangingRetryCount;
- (void)accessoryConfigData;
- (void)rangingSession;
- (void)serviceRequest;
- (void)setRangingRetryCount:(unsigned __int8)a3;
- (void)setRangingRetryTimer:(id)a3;
- (void)setRangingSession:(void *)a3;
- (void)startOptions;
- (void)stopRanging;
@end

@implementation AccessoryUwbSessionTracking

- (AccessoryUwbSessionTracking)initWithServiceRequest:(const void *)a3 startOptions:(const void *)a4 shareableConfigData:(id)a5 processName:(id)a6 accessoryConfigData:(const void *)a7 persistWhileDetached:(BOOL)a8
{
  id v15 = a5;
  id v16 = a6;
  v33.receiver = self;
  v33.super_class = (Class)AccessoryUwbSessionTracking;
  v17 = [(AccessoryUwbSessionTracking *)&v33 init];
  v18 = v17;
  v19 = v17;
  if (v17)
  {
    BOOL v32 = a8;
    id v20 = v16;
    id v21 = v15;
    BOOL engaged = v17->_serviceRequest.var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_;
    memcpy(&v17->_serviceRequest, a3, 0x1F8uLL);
    if (!engaged) {
      v19->_serviceRequest.var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_ = 1;
    }
    int scheduling_interval_usec_low = LOBYTE(v19->_startOptions.var0.__val_.scheduling_interval_usec);
    long long v25 = *((_OWORD *)a4 + 1);
    long long v24 = *((_OWORD *)a4 + 2);
    *(_OWORD *)&v18->_serviceRequest.var0.__val_.range_enable_params.nbamms.mms_bch.var0.__null_state_ = *(_OWORD *)a4;
    *(_OWORD *)v18->_serviceRequest.var0.__val_.range_enable_params.nbamms.irk = v25;
    *(_OWORD *)&v18->_serviceRequest.var0.__val_.range_enable_params.nbamms.antenna_diversity_mask.var0.__null_state_ = v24;
    long long v26 = *((_OWORD *)a4 + 6);
    long long v28 = *((_OWORD *)a4 + 3);
    $B8AA82CD8D4AFFAE0D229AEE9D5E519E v27 = *(($B8AA82CD8D4AFFAE0D229AEE9D5E519E *)a4 + 4);
    *(_OWORD *)&v18->_startOptions.var0.__val_.peer.var0.__val_.bt_adv_address.var0.__val_.__elems_[2] = *((_OWORD *)a4 + 5);
    *(_OWORD *)&v18->_startOptions.var0.__val_.start_time_or_offset_usec = v26;
    *(_OWORD *)&v18->_startOptions.var0.__null_state_ = v28;
    *($B8AA82CD8D4AFFAE0D229AEE9D5E519E *)((char *)&v18->_startOptions.var0.__val_.peer.var0.__val_.uuid.var0 + 12) = v27;
    if (!scheduling_interval_usec_low) {
      LOBYTE(v19->_startOptions.var0.__val_.scheduling_interval_usec) = 1;
    }
    objc_storeStrong((id *)&v18->_startOptions.var0.__val_.secondary_scheduling_interval_usec, a5);
    objc_storeStrong((id *)&v18->_startOptions.var0.__val_.secondary_duty_cycle, a6);
    id v15 = v21;
    id v16 = v20;
    sub_1002B3F98((uint64_t)&v18->_shareableConfigData, (uint64_t)a7);
    v19->_startOptions.var0.__val_.secondary_scheduling_delay_usec.var0.__null_state_ = v32;
    uint64_t v29 = objc_opt_new();
    ptr = v19->_rangingSession.__ptr_;
    v19->_rangingSession.__ptr_ = (FiRaSession *)v29;

    *(double *)&v19->_rangingSession.__cntrl_ = sub_100006C38();
    *(double *)&v19->_persistWhileDetached = sub_100006C38();
  }

  return v19;
}

- (void)stopRanging
{
  uint64_t conn_evt_trigger_desc = (uint64_t)self->_startOptions.var0.__val_.conn_evt_trigger_desc;
  if (conn_evt_trigger_desc)
  {
    sub_1002D8288(conn_evt_trigger_desc);
    v4 = *(std::__shared_weak_count **)&self->_startOptions.var0.__val_.dither_constant_msec.var0.__null_state_;
    *(_OWORD *)&self->_startOptions.var0.__val_.conn_evt_trigger_desc.var0.__null_state_ = 0u;
    if (v4) {
      sub_10001A970(v4);
    }
    *(double *)&self->_persistWhileDetached = sub_100006C38();
  }
  *(&self->_startOptions.var0.__val_.secondary_scheduling_delay_usec.var0.__null_state_ + 1) = 0;
  v5 = *(NSObject **)&self->_startOptions.__engaged_;
  if (v5)
  {
    dispatch_source_cancel(v5);
    v6 = *(void **)&self->_startOptions.__engaged_;
    *(void *)&self->_startOptions.__engaged_ = 0;
  }
}

- (void)rangingSession
{
  return &self->_startOptions.var0.__val_.conn_evt_trigger_desc;
}

- (void)setRangingSession:(void *)a3
{
  optional<rose::ConnectionEventTriggerDescriptor> v5 = *(optional<rose::ConnectionEventTriggerDescriptor> *)a3;
  uint64_t v4 = *((void *)a3 + 1);
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  self->_startOptions.var0.__val_.uint64_t conn_evt_trigger_desc = v5;
  v6 = *(std::__shared_weak_count **)&self->_startOptions.var0.__val_.dither_constant_msec.var0.__null_state_;
  *(void *)&self->_startOptions.var0.__val_.dither_constant_msec.var0.__null_state_ = v4;
  if (v6) {
    sub_10001A970(v6);
  }
  *(double *)&self->_persistWhileDetached = sub_100006C38();
}

- (void)serviceRequest
{
  if (!self->_serviceRequest.var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_) {
    sub_10000AE44();
  }
  return &self->_serviceRequest;
}

- (void)startOptions
{
  if (!LOBYTE(self->_startOptions.var0.__val_.scheduling_interval_usec)) {
    sub_10000AE44();
  }
  return &self->_serviceRequest.var0.__val_.range_enable_params.nbamms.mms_bch;
}

- (NSData)shareableConfigData
{
  return (NSData *)self->_startOptions.var0.__val_.secondary_scheduling_interval_usec;
}

- (NSString)processName
{
  return (NSString *)self->_startOptions.var0.__val_.secondary_duty_cycle;
}

- (void)accessoryConfigData
{
  return &self->_shareableConfigData;
}

- (BOOL)persistWhileDetached
{
  return self->_startOptions.var0.__val_.secondary_scheduling_delay_usec.var0.__null_state_;
}

- (unsigned)rangingRetryCount
{
  return *(&self->_startOptions.var0.__val_.secondary_scheduling_delay_usec.var0.__null_state_ + 1);
}

- (void)setRangingRetryCount:(unsigned __int8)a3
{
  *(&self->_startOptions.var0.__val_.secondary_scheduling_delay_usec.var0.__null_state_ + 1) = a3;
}

- (OS_dispatch_source)rangingRetryTimer
{
  return *(OS_dispatch_source **)&self->_startOptions.__engaged_;
}

- (void)setRangingRetryTimer:(id)a3
{
}

- (NSMutableSet)interestedClients
{
  return (NSMutableSet *)self->_rangingSession.__ptr_;
}

- (double)initTime
{
  return *(double *)&self->_rangingSession.__cntrl_;
}

- (double)timeOfLatestSessionLifecycleChange
{
  return *(double *)&self->_persistWhileDetached;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rangingSession.__ptr_, 0);
  objc_storeStrong((id *)&self->_startOptions.__engaged_, 0);
  objc_storeStrong((id *)&self->_startOptions.var0.__val_.secondary_duty_cycle, 0);
  objc_storeStrong((id *)&self->_startOptions.var0.__val_.secondary_scheduling_interval_usec, 0);
  v3 = *(std::__shared_weak_count **)&self->_startOptions.var0.__val_.dither_constant_msec.var0.__null_state_;
  if (v3)
  {
    sub_10001A970(v3);
  }
}

- (id).cxx_construct
{
  *((unsigned char *)self + 8) = 0;
  *((unsigned char *)self + 512) = 0;
  *((unsigned char *)self + 520) = 0;
  *((unsigned char *)self + 632) = 0;
  *((_OWORD *)self + 40) = 0u;
  *((unsigned char *)self + 712) = 0;
  *((unsigned char *)self + 751) = 0;
  return self;
}

@end