@interface VTSiriNotifications
- (VTSiriNotifications)init;
- (void)broadcastAudioPayload:(id)a3 numSamples:(unint64_t)a4 superVectorScore:(double)a5 absoluteTime:(unint64_t)a6;
@end

@implementation VTSiriNotifications

- (void).cxx_destruct
{
}

- (void)broadcastAudioPayload:(id)a3 numSamples:(unint64_t)a4 superVectorScore:(double)a5 absoluteTime:(unint64_t)a6
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  unint64_t v35 = a6;
  uint64_t v10 = [a3 bytes];
  v11 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349312;
    unint64_t v37 = a4;
    __int16 v38 = 2050;
    unint64_t v39 = a6;
    _os_log_impl(&dword_21844F000, v11, OS_LOG_TYPE_DEFAULT, "BTLE raw audio size = %{public}ld, absTime = %{public}llu", buf, 0x16u);
  }
  v12 = (float32x4_t *)malloc_type_malloc(0xC170uLL, 0x100004052888210uLL);
  v13 = v12;
  if (a4 >= 0x305C) {
    unint64_t v14 = 12380;
  }
  else {
    unint64_t v14 = a4;
  }
  if (v14)
  {
    if (v14 <= 0xF)
    {
      unint64_t v15 = 0;
LABEL_12:
      unint64_t v22 = v14 - v15;
      v23 = &v12->f32[v15];
      v24 = (__int16 *)(v10 + 2 * v15);
      do
      {
        int v25 = *v24++;
        *v23++ = (float)v25;
        --v22;
      }
      while (v22);
      goto LABEL_14;
    }
    unint64_t v15 = v14 & 0x3FF0;
    v16 = v12 + 2;
    v17 = (int16x4_t *)(v10 + 16);
    unint64_t v18 = v15;
    do
    {
      int16x8_t v19 = *(int16x8_t *)v17[-2].i8;
      float32x4_t v20 = vcvtq_f32_s32(vmovl_s16(*v17));
      int32x4_t v21 = vmovl_high_s16(*(int16x8_t *)v17->i8);
      v16[-2] = vcvtq_f32_s32(vmovl_s16(*(int16x4_t *)v19.i8));
      v16[-1] = vcvtq_f32_s32(vmovl_high_s16(v19));
      float32x4_t *v16 = v20;
      v16[1] = vcvtq_f32_s32(v21);
      v16 += 4;
      v17 += 4;
      v18 -= 16;
    }
    while (v18);
    if (v14 != v15) {
      goto LABEL_12;
    }
  }
LABEL_14:
  if (a4 >> 2 <= 0xC16)
  {
    bzero(&v12->f32[v14], 49520 - 4 * v14);
    v26 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349056;
      unint64_t v37 = 12380 - v14;
      _os_log_impl(&dword_21844F000, v26, OS_LOG_TYPE_DEFAULT, "BTLE padded %{public}ld samples to fill out buffer", buf, 0xCu);
    }
  }
  unsigned __int16 v34 = [(VTSiriPHash *)self->_hasher pHash:v13 length:12380];
  char v33 = [(VTSiriPHash *)self->_hasher signalEstimate];
  unsigned __int8 v32 = [(VTSiriPHash *)self->_hasher signalFractional];
  free(v13);
  char v31 = 0;
  if (!+[VTUtilities VTIsHorseman]) {
    char v31 = (int)(a5 * 10.0);
  }
  v27 = [MEMORY[0x263EFF990] dataWithCapacity:13];
  [v27 appendBytes:&v34 length:2];
  [v27 appendBytes:&v33 length:1];
  [v27 appendBytes:&v31 length:1];
  [v27 appendBytes:&v35 length:8];
  [v27 appendBytes:&v32 length:1];
  v28 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    unint64_t v37 = (unint64_t)v27;
    _os_log_impl(&dword_21844F000, v28, OS_LOG_TYPE_INFO, "Advert data: %{public}@", buf, 0xCu);
  }
  if (([v27 writeToFile:@"/private/var/tmp/siriBC" atomically:0] & 1) == 0)
  {
    v29 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_21844F000, v29, OS_LOG_TYPE_ERROR, "advert data write failed", buf, 2u);
    }
  }
  CFNotificationCenterPostNotification(self->_center, @"com.apple.siri.myriad.payload", 0, 0, 1u);
  v30 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21844F000, v30, OS_LOG_TYPE_INFO, "Posted siri audio hash notification", buf, 2u);
  }
}

- (VTSiriNotifications)init
{
  v6.receiver = self;
  v6.super_class = (Class)VTSiriNotifications;
  v2 = [(VTSiriNotifications *)&v6 init];
  if (v2)
  {
    v2->_center = CFNotificationCenterGetDarwinNotifyCenter();
    uint64_t v3 = +[VTSiriPHash sharedPhash];
    hasher = v2->_hasher;
    v2->_hasher = (VTSiriPHash *)v3;
  }
  return v2;
}

@end