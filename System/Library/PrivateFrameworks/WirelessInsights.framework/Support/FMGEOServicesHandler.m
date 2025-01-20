@interface FMGEOServicesHandler
+ (void)getCellularCoverageTileConfigurationAtLatitude:(double)a3 longitude:(double)a4 queue:(dispatch_queue_s *)a5 reason:(id)a6 responseBlock:(id)a7;
@end

@implementation FMGEOServicesHandler

+ (void)getCellularCoverageTileConfigurationAtLatitude:(double)a3 longitude:(double)a4 queue:(dispatch_queue_s *)a5 reason:(id)a6 responseBlock:(id)a7
{
  id v11 = a6;
  id v12 = a7;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1001D7C18, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1001D7C18))
  {
    qword_1001D7C10 = (uint64_t)dispatch_queue_create("com.apple.wirelessinsightsd.FederatedMobility.FMGEOServicesHandler", 0);
    __cxa_guard_release(&qword_1001D7C18);
  }
  if (!a5) {
    a5 = (dispatch_queue_s *)qword_1001D7C10;
  }
  dispatch_retain((dispatch_object_t)a5);
  pthread_mutex_lock(&stru_1001D67F0);
  v13 = (void *)xmmword_1001D6830;
  if (!(void)xmmword_1001D6830) {
    sub_100027A48();
  }
  v14 = (std::__shared_weak_count *)*((void *)&xmmword_1001D6830 + 1);
  if (*((void *)&xmmword_1001D6830 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&xmmword_1001D6830 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&stru_1001D67F0);
  v15 = *(NSObject **)(qword_1001D8080 + 136);
  if (v13)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "FederatedMobility[FMGEOServicesHandler]:#I Crowdsourced OOS learnings: Obtained reference to GeoServicesHandler", (uint8_t *)buf, 2u);
      v15 = *(NSObject **)(qword_1001D8080 + 136);
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      buf[0] = 134283777;
      *(double *)&buf[1] = a3;
      LOWORD(buf[3]) = 2049;
      *(double *)((char *)&buf[3] + 2) = a4;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "FederatedMobility[FMGEOServicesHandler]:#I Crowdsourced OOS learnings: Current coordinates are - latitude:%{private}lf, longitude: %{private}lf", (uint8_t *)buf, 0x16u);
    }
    if ([v11 isEqualToString:@"OutOfService"])
    {
      char v16 = 3;
    }
    else if ([v11 isEqualToString:@"LocationChangeDuringOOS"])
    {
      char v16 = 4;
    }
    else
    {
      char v16 = 0;
    }
    v17[0] = off_1001B5DD0;
    v17[1] = a5;
    v17[2] = objc_retainBlock(v12);
    v17[3] = v17;
    sub_100028A48(v13, v16, (uint64_t)v17, a3, a4);
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_100140D18(v15);
  }
  dispatch_release((dispatch_object_t)a5);
  if (v14) {
    sub_10000B678(v14);
  }
}

@end