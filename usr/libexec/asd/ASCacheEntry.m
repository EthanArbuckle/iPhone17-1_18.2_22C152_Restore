@interface ASCacheEntry
+ (id)fetchRequest;
- (BOOL)PJ7tY2vmxQ3CBhNO;
- (id)nC4QvxwoXaT2I88i;
@end

@implementation ASCacheEntry

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"DB_C56902430"];
}

- (id)nC4QvxwoXaT2I88i
{
  v3 = [(ASCacheEntry *)self dfVal];
  v4 = [v3 dataUsingEncoding:4];

  unsigned int v5 = [v4 length];
  v6 = (int8x8_t *)malloc_type_malloc(v5 + 36, 0x3DC415C9uLL);
  uint64x2_t v7 = (uint64x2_t)vdupq_n_s64((unint64_t)[(ASCacheEntry *)self counter]);
  int8x8_t *v6 = vmovn_s16(vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vshlq_u64(v7, (uint64x2_t)xmmword_100583B30), (int32x4_t)vshlq_u64(v7, (uint64x2_t)xmmword_100583B40)), (int16x8_t)vuzp1q_s32((int32x4_t)vshlq_u64(v7, (uint64x2_t)xmmword_100583B60), (int32x4_t)vshlq_u64(v7, (uint64x2_t)xmmword_100583B50))));
  uint64x2_t v8 = (uint64x2_t)vdupq_n_s64((unint64_t)[(ASCacheEntry *)self df_ttl]);
  v6[1] = vmovn_s16(vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vshlq_u64(v8, (uint64x2_t)xmmword_100583B30), (int32x4_t)vshlq_u64(v8, (uint64x2_t)xmmword_100583B40)), (int16x8_t)vuzp1q_s32((int32x4_t)vshlq_u64(v8, (uint64x2_t)xmmword_100583B60), (int32x4_t)vshlq_u64(v8, (uint64x2_t)xmmword_100583B50))));
  id v9 = v4;
  memcpy(&v6[2], [v9 bytes], (size_t)[v9 length]);
  unsigned int v10 = [v9 length];
  v11 = [(ASCacheEntry *)self presentTime];
  [v11 timeIntervalSinceReferenceDate];
  uint64x2_t v13 = (uint64x2_t)vdupq_n_s64((unint64_t)v12);
  *(int8x8_t *)((char *)v6 + v10 + 16) = vmovn_s16(vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vshlq_u64(v13, (uint64x2_t)xmmword_100583B30), (int32x4_t)vshlq_u64(v13, (uint64x2_t)xmmword_100583B40)), (int16x8_t)vuzp1q_s32((int32x4_t)vshlq_u64(v13, (uint64x2_t)xmmword_100583B60), (int32x4_t)vshlq_u64(v13, (uint64x2_t)xmmword_100583B50))));

  uint64x2_t v14 = (uint64x2_t)vdupq_n_s64((unint64_t)[(ASCacheEntry *)self queryKey]);
  *(int8x8_t *)((char *)v6 + v10 + 24) = vmovn_s16(vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vshlq_u64(v14, (uint64x2_t)xmmword_100583B30), (int32x4_t)vshlq_u64(v14, (uint64x2_t)xmmword_100583B40)), (int16x8_t)vuzp1q_s32((int32x4_t)vshlq_u64(v14, (uint64x2_t)xmmword_100583B60), (int32x4_t)vshlq_u64(v14, (uint64x2_t)xmmword_100583B50))));
  uint64x2_t v15 = (uint64x2_t)vdupq_n_s64((int)[(ASCacheEntry *)self profID]);
  int16x8_t v16 = (int16x8_t)vshlq_u64(v15, (uint64x2_t)xmmword_100583B30);
  *(int32x2_t *)v15.i8 = vmovn_s64((int64x2_t)vshlq_u64(v15, (uint64x2_t)xmmword_100583B40));
  *(int32x2_t *)v16.i8 = vmovn_s64((int64x2_t)v16);
  v16.i16[1] = v16.i16[2];
  v16.i16[2] = v15.i16[0];
  v16.i16[3] = v15.i16[2];
  *(__int32 *)((char *)v6[4].i32 + v10) = vmovn_s16(v16).u32[0];
  if (v10 == v5)
  {
    sub_1003581FC();
    free(v6);
  }
  else
  {
    free(v6);
    v20[0] = 0;
    v20[1] = 0;
    v17 = qword_1006AD1A0;
    if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_FAULT)) {
      sub_10055C310(v17);
    }
  }
  id v18 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:v20];

  return v18;
}

- (BOOL)PJ7tY2vmxQ3CBhNO
{
  v3 = [(ASCacheEntry *)self nC4QvxwoXaT2I88i];
  v4 = [(ASCacheEntry *)self macVal];
  unsigned int v5 = [v4 isEqual:v3];

  if (v5)
  {
    v6 = [(ASCacheEntry *)self presentTime];
    uint64x2_t v7 = [v6 dateByAddingTimeInterval:-[ASCacheEntry df_ttl](self, "df_ttl") / 1000.0];

    [v7 timeIntervalSinceNow];
    BOOL v9 = v8 >= 0.0;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

@end