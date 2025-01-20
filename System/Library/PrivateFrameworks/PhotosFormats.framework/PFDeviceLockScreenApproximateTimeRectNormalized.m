@interface PFDeviceLockScreenApproximateTimeRectNormalized
@end

@implementation PFDeviceLockScreenApproximateTimeRectNormalized

void __PFDeviceLockScreenApproximateTimeRectNormalized_SBS_block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v10 = *(double **)(*(void *)(a1 + 40) + 8);
  v10[4] = a2;
  v10[5] = a3;
  v10[6] = a4;
  v10[7] = a5;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(double *)v12 = a2;
    *(double *)&v12[1] = a3;
    *(double *)&v12[2] = a4;
    *(double *)&v12[3] = a5;
    v11 = [MEMORY[0x1E4F29238] valueWithBytes:v12 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
    *(_DWORD *)buf = 138412290;
    v14 = v11;
    _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[PFDeviceLockScreenApproximateTimeRectNormalized_SBS] Using limited occlusion bounds for time rect: %@", buf, 0xCu);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

@end