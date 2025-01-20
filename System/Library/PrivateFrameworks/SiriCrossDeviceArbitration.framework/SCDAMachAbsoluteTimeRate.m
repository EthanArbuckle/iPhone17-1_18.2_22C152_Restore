@interface SCDAMachAbsoluteTimeRate
@end

@implementation SCDAMachAbsoluteTimeRate

void ___SCDAMachAbsoluteTimeRate_block_invoke()
{
  kern_return_t v0;
  kern_return_t v1;
  NSObject *v2;
  uint32_t numer;
  uint32_t denom;
  double v5;
  NSObject *v6;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  uint32_t v11;
  __int16 v12;
  uint32_t v13;
  __int16 v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x263EF8340];
  info = 0;
  v0 = mach_timebase_info(&info);
  if (v0)
  {
    v1 = v0;
    v2 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v9 = "_SCDAMachAbsoluteTimeRate_block_invoke";
      v10 = 1024;
      v11 = v1;
      _os_log_error_impl(&dword_25C707000, v2, OS_LOG_TYPE_ERROR, "%s mach_timebase_info() failed with %d.", buf, 0x12u);
    }
  }
  else
  {
    numer = info.numer;
    denom = info.denom;
    v5 = (double)info.numer / (double)info.denom;
    *(double *)&_SCDAMachAbsoluteTimeRate_rate = v5;
    v6 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315906;
      v9 = "_SCDAMachAbsoluteTimeRate_block_invoke";
      v10 = 1024;
      v11 = numer;
      v12 = 1024;
      v13 = denom;
      v14 = 2048;
      v15 = v5;
      _os_log_impl(&dword_25C707000, v6, OS_LOG_TYPE_INFO, "%s machTimebaseInfo.numer = %u, machTimebaseInfo.denom = %u, rate = %f", buf, 0x22u);
    }
  }
}

@end