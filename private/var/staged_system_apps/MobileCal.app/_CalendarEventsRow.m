@interface _CalendarEventsRow
- (BOOL)isFilledForDay:(unint64_t)a3;
- (_CalendarEventsRow)init;
- (id)occurrenceBlocks;
- (id)occurrenceForDay:(unint64_t)a3;
- (unint64_t)spaceGapFor:(id)a3;
- (void)addOccurrenceBlock:(id)a3;
@end

@implementation _CalendarEventsRow

- (_CalendarEventsRow)init
{
  v6.receiver = self;
  v6.super_class = (Class)_CalendarEventsRow;
  v2 = [(_CalendarEventsRow *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    blocks = v2->_blocks;
    v2->_blocks = v3;

    v2->_occupyingDays = 0;
  }
  return v2;
}

- (void)addOccurrenceBlock:(id)a3
{
  id v19 = a3;
  [(NSMutableArray *)self->_blocks addObject:v19];
  unint64_t v4 = (unint64_t)[v19 startRange];
  id v5 = [v19 length];
  int v6 = self->_occupyingDays | (1 << v4);
  if (v5 != (id)1)
  {
    uint64_t v7 = 0;
    uint64x2_t v8 = (uint64x2_t)vdupq_n_s64((unint64_t)v5 - 2);
    int64x2_t v9 = vdupq_n_s64(v4);
    int32x4_t v10 = (int32x4_t)vaddq_s64(v9, (int64x2_t)xmmword_1001C1360);
    int32x4_t v11 = (int32x4_t)vaddq_s64(v9, (int64x2_t)xmmword_1001C1370);
    unsigned long long v12 = self->_occupyingDays | (unsigned __int128)(1 << v4);
    v13.i64[0] = 0x100000001;
    v13.i64[1] = 0x100000001;
    int64x2_t v14 = vdupq_n_s64(4uLL);
    do
    {
      int8x16_t v15 = (int8x16_t)v12;
      unsigned long long v12 = (unsigned __int128)vorrq_s8((int8x16_t)vshlq_u32((uint32x4_t)v13, (uint32x4_t)vaddq_s32(vuzp1q_s32(v11, v10), v13)), (int8x16_t)v12);
      v7 += 4;
      int32x4_t v10 = (int32x4_t)vaddq_s64((int64x2_t)v10, v14);
      int32x4_t v11 = (int32x4_t)vaddq_s64((int64x2_t)v11, v14);
    }
    while ((((unint64_t)v5 + 2) & 0xFFFFFFFFFFFFFFFCLL) != v7);
    int8x16_t v16 = (int8x16_t)vdupq_n_s64(v7 - 4);
    int8x16_t v17 = vbslq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_u64((uint64x2_t)vorrq_s8(v16, (int8x16_t)xmmword_1001C1370), v8), (int32x4_t)vcgtq_u64((uint64x2_t)vorrq_s8(v16, (int8x16_t)xmmword_1001C1360), v8)), v15, (int8x16_t)v12);
    int8x8_t v18 = vorr_s8(*(int8x8_t *)v17.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v17, v17, 8uLL));
    int v6 = v18.i32[0] | v18.i32[1];
  }
  self->_occupyingDays = v6;
}

- (BOOL)isFilledForDay:(unint64_t)a3
{
  return !(((self->_occupyingDays & (1 << a3)) < 0) ^ v3 | ((self->_occupyingDays & (1 << a3)) == 0));
}

- (id)occurrenceForDay:(unint64_t)a3
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  unint64_t v4 = self->_blocks;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        int64x2_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v10 = [v9 startRange:v14];
        int32x4_t v11 = (char *)[v9 length];
        if ((unint64_t)v10 <= a3 && &v11[(void)v10 - 1] >= (char *)a3)
        {
          id v12 = v9;
          goto LABEL_12;
        }
      }
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v12 = 0;
LABEL_12:

  return v12;
}

- (unint64_t)spaceGapFor:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = self->_blocks;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    unint64_t v8 = 0;
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = [*(id *)(*((void *)&v13 + 1) + 8 * i) gapBetweenBlock:v4 v13];
        if (v11 == (id)-1)
        {
          unint64_t v8 = -1;
          goto LABEL_14;
        }
        if ((unint64_t)v11 > v8) {
          unint64_t v8 = (unint64_t)v11;
        }
      }
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    unint64_t v8 = 0;
  }
LABEL_14:

  return v8;
}

- (id)occurrenceBlocks
{
  return self->_blocks;
}

- (void).cxx_destruct
{
}

@end