@interface ASClass101288420
+ (id)fetchRequest;
- (BOOL)PJ7tY2vmxQ3CBhNO;
- (id)nC4QvxwoXaT2I88i;
@end

@implementation ASClass101288420

- (id)nC4QvxwoXaT2I88i
{
  v3 = [(ASClass101288420 *)self dfVal];
  v4 = [v3 dataUsingEncoding:4];

  unsigned int v5 = [v4 length];
  v6 = (char *)malloc_type_malloc(v5 + 32, 0x3142594BuLL);
  uint64x2_t v7 = (uint64x2_t)vdupq_n_s64((int)[(ASClass101288420 *)self version]);
  int16x8_t v8 = (int16x8_t)vshlq_u64(v7, (uint64x2_t)xmmword_100583B30);
  *(int32x2_t *)v7.i8 = vmovn_s64((int64x2_t)vshlq_u64(v7, (uint64x2_t)xmmword_100583B40));
  *(int32x2_t *)v8.i8 = vmovn_s64((int64x2_t)v8);
  v8.i16[1] = v8.i16[2];
  v8.i16[2] = v7.i16[0];
  v8.i16[3] = v7.i16[2];
  *(_DWORD *)v6 = vmovn_s16(v8).u32[0];
  uint64x2_t v9 = (uint64x2_t)vdupq_n_s64((unint64_t)[(ASClass101288420 *)self dfMaxAge]);
  *(int8x8_t *)(v6 + 4) = vmovn_s16(vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vshlq_u64(v9, (uint64x2_t)xmmword_100583B30), (int32x4_t)vshlq_u64(v9, (uint64x2_t)xmmword_100583B40)), (int16x8_t)vuzp1q_s32((int32x4_t)vshlq_u64(v9, (uint64x2_t)xmmword_100583B60), (int32x4_t)vshlq_u64(v9, (uint64x2_t)xmmword_100583B50))));
  id v10 = v4;
  memcpy(v6 + 12, [v10 bytes], (size_t)[v10 length]);
  unsigned int v11 = [v10 length];
  v12 = [(ASClass101288420 *)self presentTime];
  [v12 timeIntervalSinceReferenceDate];
  uint64x2_t v14 = (uint64x2_t)vdupq_n_s64((unint64_t)v13);
  *(int8x8_t *)&v6[v11 + 12] = vmovn_s16(vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vshlq_u64(v14, (uint64x2_t)xmmword_100583B30), (int32x4_t)vshlq_u64(v14, (uint64x2_t)xmmword_100583B40)), (int16x8_t)vuzp1q_s32((int32x4_t)vshlq_u64(v14, (uint64x2_t)xmmword_100583B60), (int32x4_t)vshlq_u64(v14, (uint64x2_t)xmmword_100583B50))));

  uint64x2_t v15 = (uint64x2_t)vdupq_n_s64((unint64_t)[(ASClass101288420 *)self queryKey]);
  *(int8x8_t *)&v6[v11 + 20] = vmovn_s16(vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vshlq_u64(v15, (uint64x2_t)xmmword_100583B30), (int32x4_t)vshlq_u64(v15, (uint64x2_t)xmmword_100583B40)), (int16x8_t)vuzp1q_s32((int32x4_t)vshlq_u64(v15, (uint64x2_t)xmmword_100583B60), (int32x4_t)vshlq_u64(v15, (uint64x2_t)xmmword_100583B50))));
  uint64x2_t v16 = (uint64x2_t)vdupq_n_s64((int)[(ASClass101288420 *)self profID]);
  int16x8_t v17 = (int16x8_t)vshlq_u64(v16, (uint64x2_t)xmmword_100583B30);
  *(int32x2_t *)v16.i8 = vmovn_s64((int64x2_t)vshlq_u64(v16, (uint64x2_t)xmmword_100583B40));
  *(int32x2_t *)v17.i8 = vmovn_s64((int64x2_t)v17);
  v17.i16[1] = v17.i16[2];
  v17.i16[2] = v16.i16[0];
  v17.i16[3] = v16.i16[2];
  *(_DWORD *)&v6[v11 + 28] = vmovn_s16(v17).u32[0];
  if (v11 == v5)
  {
    sub_1003581FC();
    free(v6);
  }
  else
  {
    free(v6);
    v21[0] = 0;
    v21[1] = 0;
    v18 = qword_1006AD1A0;
    if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_FAULT)) {
      sub_10055C310(v18);
    }
  }
  id v19 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:v21];

  return v19;
}

- (BOOL)PJ7tY2vmxQ3CBhNO
{
  v3 = [(ASClass101288420 *)self nC4QvxwoXaT2I88i];
  v4 = [(ASClass101288420 *)self macVal];
  unsigned int v5 = [v4 isEqual:v3];

  if (v5)
  {
    v6 = [(ASClass101288420 *)self presentTime];
    uint64x2_t v7 = [v6 dateByAddingTimeInterval:-[ASClass101288420 dfMaxAge](self, "dfMaxAge") / 1000.0];

    [v7 timeIntervalSinceNow];
    BOOL v9 = v8 >= 0.0;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"DB_R101288420"];
}

@end