uint64_t deflate_huff(uint64_t a1, int a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;

  while (1)
  {
    if (!*(_DWORD *)(a1 + 164))
    {
      fill_window((uint64_t *)a1);
      if (!*(_DWORD *)(a1 + 164)) {
        break;
      }
    }
    *(_DWORD *)(a1 + 144) = 0;
    v4 = *(unsigned __int8 *)(*(void *)(a1 + 80) + *(unsigned int *)(a1 + 156));
    v5 = *(unsigned int *)(a1 + 5884);
    *(_WORD *)(*(void *)(a1 + 5888) + 2 * v5) = 0;
    v6 = *(void *)(a1 + 5872);
    *(_DWORD *)(a1 + 5884) = v5 + 1;
    *(unsigned char *)(v6 + v5) = v4;
    ++*(_WORD *)(a1 + 4 * v4 + 196);
    LODWORD(v6) = *(_DWORD *)(a1 + 5884);
    LODWORD(v5) = *(_DWORD *)(a1 + 5880) - 1;
    --*(_DWORD *)(a1 + 164);
    v7 = (*(_DWORD *)(a1 + 156) + 1);
    *(_DWORD *)(a1 + 156) = v7;
    if (v6 == v5)
    {
      v8 = *(void *)(a1 + 136);
      v9 = v8 < 0 ? 0 : (char *)(*(void *)(a1 + 80) + v8);
      _tr_flush_block((int *)a1, v9, v7 - v8, 0);
      *(void *)(a1 + 136) = *(unsigned int *)(a1 + 156);
      flush_pending(*(void **)a1);
      if (!*(_DWORD *)(*(void *)a1 + 32)) {
        return 0;
      }
    }
  }
  if (!a2) {
    return 0;
  }
  v10 = *(void *)(a1 + 136);
  if (v10 < 0) {
    v11 = 0;
  }
  else {
    v11 = (char *)(*(void *)(a1 + 80) + v10);
  }
  _tr_flush_block((int *)a1, v11, *(unsigned int *)(a1 + 156) - v10, a2 == 4);
  *(void *)(a1 + 136) = *(unsigned int *)(a1 + 156);
  flush_pending(*(void **)a1);
  if (!*(_DWORD *)(*(void *)a1 + 32)) {
    return 2 * (a2 == 4);
  }
  if (a2 == 4) {
    return 3;
  }
  return 1;
}

uint64_t deflate_rle(uint64_t a1, int a2)
{
  while (1)
  {
    unsigned int v4 = *(_DWORD *)(a1 + 164);
    if (v4 >= 0x102)
    {
      *(_DWORD *)(a1 + 144) = 0;
      uint64_t v5 = *(unsigned int *)(a1 + 156);
      if (!*(_DWORD *)(a1 + 156)) {
        goto LABEL_23;
      }
      goto LABEL_9;
    }
    fill_window((uint64_t *)a1);
    unsigned int v4 = *(_DWORD *)(a1 + 164);
    if (!a2 && v4 < 0x102) {
      return 0;
    }
    if (!v4) {
      break;
    }
    *(_DWORD *)(a1 + 144) = 0;
    uint64_t v5 = *(unsigned int *)(a1 + 156);
    if (v4 < 3 || !*(_DWORD *)(a1 + 156))
    {
LABEL_23:
      LODWORD(v16) = *(_DWORD *)(a1 + 5884);
LABEL_24:
      uint64_t v17 = *(unsigned __int8 *)(*(void *)(a1 + 80) + v5);
      *(_WORD *)(*(void *)(a1 + 5888) + 2 * v16) = 0;
      uint64_t v18 = *(void *)(a1 + 5872);
      *(_DWORD *)(a1 + 5884) = v16 + 1;
      *(unsigned char *)(v18 + v16) = v17;
      ++*(_WORD *)(a1 + 4 * v17 + 196);
      int v19 = *(_DWORD *)(a1 + 5884);
      int v20 = *(_DWORD *)(a1 + 5880) - 1;
      --*(_DWORD *)(a1 + 164);
      unsigned int v21 = *(_DWORD *)(a1 + 156) + 1;
      *(_DWORD *)(a1 + 156) = v21;
      goto LABEL_25;
    }
LABEL_9:
    v6 = (unsigned __int8 *)(*(void *)(a1 + 80) + v5);
    int v7 = *(v6 - 1);
    if (v7 != *v6 || v7 != v6[1] || v7 != v6[2]) {
      goto LABEL_23;
    }
    uint64_t v8 = 0;
    int v9 = v6 + 258;
    while (1)
    {
      v10 = &v6[v8];
      if (v7 != v6[v8 + 3])
      {
        int v15 = v10 + 3;
        goto LABEL_38;
      }
      if (v7 != v10[4])
      {
        int v15 = v6 + v8 + 4;
        goto LABEL_38;
      }
      v11 = &v6[v8];
      if (v7 != v6[v8 + 5])
      {
        int v15 = v11 + 5;
        goto LABEL_38;
      }
      if (v7 != v11[6])
      {
        int v15 = v6 + v8 + 6;
        goto LABEL_38;
      }
      v12 = &v6[v8];
      if (v7 != v6[v8 + 7])
      {
        int v15 = v12 + 7;
        goto LABEL_38;
      }
      if (v7 != v12[8])
      {
        int v15 = v6 + v8 + 8;
        goto LABEL_38;
      }
      v13 = &v6[v8];
      if (v7 != v6[v8 + 9]) {
        break;
      }
      unint64_t v14 = v8 + 2;
      v8 += 8;
      if (v14 > 0xF9 || v7 != v13[10])
      {
        int v15 = v6 + v8 + 2;
        goto LABEL_38;
      }
    }
    int v15 = v13 + 9;
LABEL_38:
    unsigned int v24 = v15 - v9 + 258;
    if (v24 >= v4) {
      unsigned int v24 = v4;
    }
    *(_DWORD *)(a1 + 144) = v24;
    uint64_t v16 = *(unsigned int *)(a1 + 5884);
    BOOL v25 = v24 >= 3;
    unsigned __int8 v26 = v24 - 3;
    if (!v25) {
      goto LABEL_24;
    }
    *(_WORD *)(*(void *)(a1 + 5888) + 2 * v16) = 1;
    uint64_t v27 = *(void *)(a1 + 5872);
    *(_DWORD *)(a1 + 5884) = v16 + 1;
    *(unsigned char *)(v27 + v16) = v26;
    uint64_t v28 = a1 + 4 * _length_code[v26];
    ++*(_WORD *)(v28 + 1224);
    ++*(_WORD *)(a1 + 4 * _dist_code[0] + 2488);
    int v19 = *(_DWORD *)(a1 + 5884);
    int v20 = *(_DWORD *)(a1 + 5880) - 1;
    LODWORD(v28) = *(_DWORD *)(a1 + 144);
    *(_DWORD *)(a1 + 164) -= v28;
    unsigned int v21 = *(_DWORD *)(a1 + 156) + v28;
    *(_DWORD *)(a1 + 156) = v21;
    *(_DWORD *)(a1 + 144) = 0;
LABEL_25:
    if (v19 == v20)
    {
      uint64_t v22 = *(void *)(a1 + 136);
      v23 = v22 < 0 ? 0 : (char *)(*(void *)(a1 + 80) + v22);
      _tr_flush_block((int *)a1, v23, v21 - v22, 0);
      *(void *)(a1 + 136) = *(unsigned int *)(a1 + 156);
      flush_pending(*(void **)a1);
      if (!*(_DWORD *)(*(void *)a1 + 32)) {
        return 0;
      }
    }
  }
  uint64_t v30 = *(void *)(a1 + 136);
  if (v30 < 0) {
    v31 = 0;
  }
  else {
    v31 = (char *)(*(void *)(a1 + 80) + v30);
  }
  _tr_flush_block((int *)a1, v31, *(unsigned int *)(a1 + 156) - v30, a2 == 4);
  *(void *)(a1 + 136) = *(unsigned int *)(a1 + 156);
  flush_pending(*(void **)a1);
  if (!*(_DWORD *)(*(void *)a1 + 32)) {
    return 2 * (a2 == 4);
  }
  if (a2 == 4) {
    return 3;
  }
  return 1;
}

int deflateCopy(z_streamp dest, z_streamp source)
{
  int result = -2;
  if (dest)
  {
    if (source)
    {
      state = source->state;
      if (state)
      {
        long long v6 = *(_OWORD *)&source->opaque;
        long long v5 = *(_OWORD *)&source->adler;
        long long v7 = *(_OWORD *)&source->msg;
        *(_OWORD *)&dest->zalloc = *(_OWORD *)&source->zalloc;
        *(_OWORD *)&dest->opaque = v6;
        long long v8 = *(_OWORD *)&source->total_in;
        long long v9 = *(_OWORD *)&source->avail_out;
        *(_OWORD *)&dest->next_in = *(_OWORD *)&source->next_in;
        *(_OWORD *)&dest->total_in = v8;
        *(_OWORD *)&dest->adler = v5;
        *(_OWORD *)&dest->avail_out = v9;
        *(_OWORD *)&dest->msg = v7;
        v10 = (internal_state *)((uint64_t (*)(voidpf, uint64_t, uint64_t))dest->zalloc)(dest->opaque, 1, 5936);
        if (v10)
        {
          v11 = v10;
          dest->state = v10;
          memcpy(v10, state, 0x1730uLL);
          *(void *)v11 = dest;
          *((void *)v11 + 10) = ((uint64_t (*)(voidpf, void, uint64_t))dest->zalloc)(dest->opaque, *((unsigned int *)v11 + 17), 2);
          *((void *)v11 + 12) = ((uint64_t (*)(voidpf, void, uint64_t))dest->zalloc)(dest->opaque, *((unsigned int *)v11 + 17), 2);
          *((void *)v11 + 13) = ((uint64_t (*)(voidpf, void, uint64_t))dest->zalloc)(dest->opaque, *((unsigned int *)v11 + 29), 2);
          uint64_t v12 = ((uint64_t (*)(voidpf, void, uint64_t))dest->zalloc)(dest->opaque, *((unsigned int *)v11 + 1470), 4);
          *((void *)v11 + 2) = v12;
          v13 = (void *)*((void *)v11 + 10);
          if (v13 && *((void *)v11 + 12) && *((void *)v11 + 13) && v12)
          {
            memcpy(v13, *((const void **)state + 10), (2 * *((_DWORD *)v11 + 17)));
            memcpy(*((void **)v11 + 12), *((const void **)state + 12), 2 * *((unsigned int *)v11 + 17));
            memcpy(*((void **)v11 + 13), *((const void **)state + 13), 2 * *((unsigned int *)v11 + 29));
            memcpy(*((void **)v11 + 2), *((const void **)state + 2), *((unsigned int *)v11 + 6));
            int result = 0;
            uint64_t v14 = *((void *)v11 + 2);
            *((void *)v11 + 4) = v14 + *((void *)state + 4) - *((void *)state + 2);
            uint64_t v15 = *((unsigned int *)v11 + 1470);
            *((void *)v11 + 736) = v12 + (v15 & 0xFFFFFFFE);
            *((void *)v11 + 734) = v14 + 3 * v15;
            *((void *)v11 + 361) = (char *)v11 + 196;
            *((void *)v11 + 364) = (char *)v11 + 2488;
            *((void *)v11 + 367) = (char *)v11 + 2732;
            return result;
          }
          deflateEnd(dest);
        }
        return -4;
      }
    }
  }
  return result;
}

uint64_t deflate_stored(uint64_t a1, int a2)
{
  if ((unint64_t)(*(void *)(a1 + 24) - 5) >= 0xFFFF) {
    uint64_t v4 = 0xFFFFLL;
  }
  else {
    uint64_t v4 = *(void *)(a1 + 24) - 5;
  }
  while (1)
  {
    unsigned int v5 = *(_DWORD *)(a1 + 164);
    if (v5 >= 2)
    {
      uint64_t v6 = *(void *)(a1 + 136);
      goto LABEL_9;
    }
    fill_window((uint64_t *)a1);
    unsigned int v5 = *(_DWORD *)(a1 + 164);
    if (!(v5 | a2)) {
      return 0;
    }
    uint64_t v6 = *(void *)(a1 + 136);
    if (!v5) {
      break;
    }
LABEL_9:
    unint64_t v7 = *(_DWORD *)(a1 + 156) + v5;
    *(_DWORD *)(a1 + 156) = v7;
    *(_DWORD *)(a1 + 164) = 0;
    unint64_t v8 = v6 + v4;
    if (v7) {
      BOOL v9 = v8 > v7;
    }
    else {
      BOOL v9 = 0;
    }
    if (!v9)
    {
      *(_DWORD *)(a1 + 164) = v7 - v8;
      *(_DWORD *)(a1 + 156) = v8;
      if (v6 < 0) {
        v10 = 0;
      }
      else {
        v10 = (char *)(*(void *)(a1 + 80) + v6);
      }
      _tr_flush_block((int *)a1, v10, (v6 + v4) - v6, 0);
      *(void *)(a1 + 136) = *(unsigned int *)(a1 + 156);
      flush_pending(*(void **)a1);
      if (!*(_DWORD *)(*(void *)a1 + 32)) {
        return 0;
      }
      LODWORD(v7) = *(_DWORD *)(a1 + 156);
      uint64_t v6 = *(void *)(a1 + 136);
    }
    if ((int)v7 - (int)v6 >= (*(_DWORD *)(a1 + 68) - 262))
    {
      v11 = v6 < 0 ? 0 : (char *)(*(void *)(a1 + 80) + v6);
      _tr_flush_block((int *)a1, v11, v7 - v6, 0);
      *(void *)(a1 + 136) = *(unsigned int *)(a1 + 156);
      flush_pending(*(void **)a1);
      if (!*(_DWORD *)(*(void *)a1 + 32)) {
        return 0;
      }
    }
  }
  if (v6 < 0) {
    v13 = 0;
  }
  else {
    v13 = (char *)(*(void *)(a1 + 80) + v6);
  }
  _tr_flush_block((int *)a1, v13, *(unsigned int *)(a1 + 156) - v6, a2 == 4);
  *(void *)(a1 + 136) = *(unsigned int *)(a1 + 156);
  flush_pending(*(void **)a1);
  if (!*(_DWORD *)(*(void *)a1 + 32)) {
    return 2 * (a2 == 4);
  }
  if (a2 == 4) {
    return 3;
  }
  return 1;
}

uint64_t deflate_fast(uint64_t a1, int a2)
{
  while (1)
  {
    if (*(_DWORD *)(a1 + 164) > 0x105u) {
      goto LABEL_6;
    }
    fill_window((uint64_t *)a1);
    unsigned int v4 = *(_DWORD *)(a1 + 164);
    if (!a2 && v4 < 0x106) {
      return 0;
    }
    if (!v4) {
      break;
    }
    if (v4 < 3) {
      goto LABEL_8;
    }
LABEL_6:
    unsigned int v5 = *(_DWORD *)(a1 + 156);
    unsigned int v6 = ((*(_DWORD *)(a1 + 112) << *(_DWORD *)(a1 + 128)) ^ *(unsigned __int8 *)(*(void *)(a1 + 80) + v5 + 2)) & *(_DWORD *)(a1 + 124);
    *(_DWORD *)(a1 + 112) = v6;
    uint64_t v7 = *(void *)(a1 + 104);
    unsigned int v8 = *(unsigned __int16 *)(v7 + 2 * v6);
    *(_WORD *)(*(void *)(a1 + 96) + 2 * (*(_DWORD *)(a1 + 76) & v5)) = v8;
    *(_WORD *)(v7 + 2 * v6) = v5;
    if (!v8 || v5 - v8 > *(_DWORD *)(a1 + 68) - 262)
    {
LABEL_8:
      unsigned int v9 = *(_DWORD *)(a1 + 144);
      goto LABEL_10;
    }
    unsigned int v9 = longest_match(a1, v8);
    *(_DWORD *)(a1 + 144) = v9;
LABEL_10:
    if (v9 < 3)
    {
      uint64_t v30 = *(unsigned __int8 *)(*(void *)(a1 + 80) + *(unsigned int *)(a1 + 156));
      uint64_t v31 = *(unsigned int *)(a1 + 5884);
      *(_WORD *)(*(void *)(a1 + 5888) + 2 * v31) = 0;
      uint64_t v32 = *(void *)(a1 + 5872);
      *(_DWORD *)(a1 + 5884) = v31 + 1;
      *(unsigned char *)(v32 + v31) = v30;
      ++*(_WORD *)(a1 + 4 * v30 + 196);
      int v17 = *(_DWORD *)(a1 + 5884);
      int v18 = *(_DWORD *)(a1 + 5880) - 1;
      --*(_DWORD *)(a1 + 164);
      unsigned int v29 = *(_DWORD *)(a1 + 156) + 1;
LABEL_19:
      *(_DWORD *)(a1 + 156) = v29;
      goto LABEL_21;
    }
    int v10 = *(_DWORD *)(a1 + 156) - *(_DWORD *)(a1 + 160);
    uint64_t v11 = *(unsigned int *)(a1 + 5884);
    *(_WORD *)(*(void *)(a1 + 5888) + 2 * v11) = v10;
    uint64_t v12 = *(void *)(a1 + 5872);
    *(_DWORD *)(a1 + 5884) = v11 + 1;
    *(unsigned char *)(v12 + v11) = v9 - 3;
    unsigned __int16 v13 = v10 - 1;
    uint64_t v14 = a1 + 4 * _length_code[(v9 - 3)];
    ++*(_WORD *)(v14 + 1224);
    unsigned __int16 v15 = (v13 >> 7) + 256;
    if ((v13 & 0xFF00) == 0) {
      unsigned __int16 v15 = v13;
    }
    uint64_t v16 = a1 + 4 * _dist_code[v15];
    ++*(_WORD *)(v16 + 2488);
    int v17 = *(_DWORD *)(a1 + 5884);
    int v18 = *(_DWORD *)(a1 + 5880) - 1;
    unsigned int v19 = *(_DWORD *)(a1 + 144);
    unsigned int v20 = *(_DWORD *)(a1 + 164) - v19;
    *(_DWORD *)(a1 + 164) = v20;
    if (v19 <= *(_DWORD *)(a1 + 176) && v20 >= 3)
    {
      *(_DWORD *)(a1 + 144) = v19 - 1;
      uint64_t v21 = *(void *)(a1 + 80);
      int v23 = *(_DWORD *)(a1 + 124);
      int v22 = *(_DWORD *)(a1 + 128);
      uint64_t v25 = *(void *)(a1 + 96);
      uint64_t v24 = *(void *)(a1 + 104);
      int v26 = *(_DWORD *)(a1 + 76);
      unsigned int v27 = *(_DWORD *)(a1 + 112);
      unsigned int v28 = v19 - 2;
      unsigned int v29 = *(_DWORD *)(a1 + 156) + 1;
      do
      {
        *(_DWORD *)(a1 + 156) = v29;
        unsigned int v27 = ((v27 << v22) ^ *(unsigned __int8 *)(v21 + v29 + 2)) & v23;
        *(_DWORD *)(a1 + 112) = v27;
        *(_WORD *)(v25 + 2 * (v26 & v29)) = *(_WORD *)(v24 + 2 * v27);
        *(_WORD *)(v24 + 2 * v27) = v29;
        *(_DWORD *)(a1 + 144) = v28--;
        ++v29;
      }
      while (v28 != -1);
      goto LABEL_19;
    }
    unsigned int v29 = *(_DWORD *)(a1 + 156) + v19;
    *(_DWORD *)(a1 + 156) = v29;
    *(_DWORD *)(a1 + 144) = 0;
    uint64_t v33 = *(void *)(a1 + 80);
    int v34 = *(unsigned __int8 *)(v33 + v29);
    *(_DWORD *)(a1 + 112) = v34;
    *(_DWORD *)(a1 + 112) = ((v34 << *(_DWORD *)(a1 + 128)) ^ *(unsigned __int8 *)(v33 + v29 + 1)) & *(_DWORD *)(a1 + 124);
LABEL_21:
    if (v17 == v18)
    {
      uint64_t v35 = *(void *)(a1 + 136);
      v36 = v35 < 0 ? 0 : (char *)(*(void *)(a1 + 80) + v35);
      _tr_flush_block((int *)a1, v36, v29 - v35, 0);
      *(void *)(a1 + 136) = *(unsigned int *)(a1 + 156);
      flush_pending(*(void **)a1);
      if (!*(_DWORD *)(*(void *)a1 + 32)) {
        return 0;
      }
    }
  }
  uint64_t v38 = *(void *)(a1 + 136);
  if (v38 < 0) {
    v39 = 0;
  }
  else {
    v39 = (char *)(*(void *)(a1 + 80) + v38);
  }
  _tr_flush_block((int *)a1, v39, *(unsigned int *)(a1 + 156) - v38, a2 == 4);
  *(void *)(a1 + 136) = *(unsigned int *)(a1 + 156);
  flush_pending(*(void **)a1);
  if (!*(_DWORD *)(*(void *)a1 + 32)) {
    return 2 * (a2 == 4);
  }
  if (a2 == 4) {
    return 3;
  }
  return 1;
}

uint64_t adler32_vec(uint64_t a1, uint64_t a2, uint8x16_t *a3, int a4)
{
  uint64_t v4 = a1 + (a2 << 32);
  if (a4 >= 5552)
  {
    int v5 = a4 - 5552;
    do
    {
      uint8x16_t v6 = *a3;
      uint16x8_t v7 = vmlal_high_u8(vmull_u8(*(uint8x8_t *)a3->i8, (uint8x8_t)vec_table[2]), *a3, *(uint8x16_t *)&vec_table[2]);
      v6.i16[0] = vaddlvq_u8(*a3);
      v7.i32[0] = vaddlvq_u16(v7);
      ++a3;
      uint64_t v8 = (uint64_t)vadd_s32((int32x2_t)(v4 + vshld_n_s64(v4, 0x24uLL)), vzip1_s32(*(int32x2_t *)v6.i8, *(int32x2_t *)v7.i8));
      int v9 = 173;
      do
      {
        uint8x16_t v10 = *a3;
        uint8x16_t v11 = a3[1];
        uint16x4_t v12 = (uint16x4_t)vshld_n_s64(v8, 0x25uLL);
        int32x2_t v13 = (int32x2_t)(v8 + *(void *)&v12);
        v10.i16[0] = vaddlvq_u8(*a3);
        v12.i16[0] = vaddlvq_u8(v11);
        uint16x8_t v14 = vmlal_high_u8(vmlal_u8(vmlal_high_u8(vmull_u8(*(uint8x8_t *)a3->i8, (uint8x8_t)vec_table[0]), *a3, *(uint8x16_t *)vec_table), *(uint8x8_t *)v11.i8, (uint8x8_t)vec_table[2]), v11, *(uint8x16_t *)&vec_table[2]);
        v14.i32[0] = vaddlvq_u16(v14);
        a3 += 2;
        uint64_t v8 = (uint64_t)vadd_s32(v13, vzip1_s32((int32x2_t)*(_OWORD *)&vaddl_u16(*(uint16x4_t *)v10.i8, v12), *(int32x2_t *)v14.i8));
        BOOL v15 = __OFSUB__(v9--, 1);
      }
      while (!((v9 < 0) ^ v15 | (v9 == 0)));
      uint64x2_t v16 = vshrq_n_u64(vmull_lane_u32((uint32x2_t)v8, (uint32x2_t)0x800780710000FFF1, 1), 0x2FuLL);
      v16.i32[1] = v16.i32[2];
      uint64_t v4 = (uint64_t)vmls_lane_s32((int32x2_t)v8, *(int32x2_t *)v16.i8, (int32x2_t)0x800780710000FFF1, 0);
      BOOL v15 = __OFSUB__(v5, 5552);
      v5 -= 5552;
    }
    while (v5 < 0 == v15);
    a4 = v5 + 5552;
  }
  BOOL v15 = __OFSUB__(a4, 32);
  for (int i = a4 - 32; i < 0 == v15; i -= 32)
  {
    uint8x16_t v18 = *a3;
    uint8x16_t v19 = a3[1];
    uint16x4_t v20 = (uint16x4_t)vshld_n_s64(v4, 0x25uLL);
    int32x2_t v21 = (int32x2_t)(v4 + *(void *)&v20);
    v18.i16[0] = vaddlvq_u8(*a3);
    v20.i16[0] = vaddlvq_u8(v19);
    uint16x8_t v22 = vmlal_high_u8(vmlal_u8(vmlal_high_u8(vmull_u8(*(uint8x8_t *)a3->i8, (uint8x8_t)vec_table[0]), *a3, *(uint8x16_t *)vec_table), *(uint8x8_t *)v19.i8, (uint8x8_t)vec_table[2]), v19, *(uint8x16_t *)&vec_table[2]);
    v22.i32[0] = vaddlvq_u16(v22);
    a3 += 2;
    uint64_t v4 = (uint64_t)vadd_s32(v21, vzip1_s32((int32x2_t)*(_OWORD *)&vaddl_u16(*(uint16x4_t *)v18.i8, v20), *(int32x2_t *)v22.i8));
    BOOL v15 = __OFSUB__(i, 32);
  }
  if ((i & 0x10) != 0)
  {
    uint8x16_t v23 = *a3;
    uint16x8_t v24 = vmlal_high_u8(vmull_u8(*(uint8x8_t *)a3->i8, (uint8x8_t)vec_table[2]), *a3, *(uint8x16_t *)&vec_table[2]);
    v23.i16[0] = vaddlvq_u8(*a3);
    v24.i32[0] = vaddlvq_u16(v24);
    ++a3;
    uint64_t v4 = (uint64_t)vadd_s32((int32x2_t)(v4 + vshld_n_s64(v4, 0x24uLL)), vzip1_s32(*(int32x2_t *)v23.i8, *(int32x2_t *)v24.i8));
  }
  for (int j = i & 0xF; j; v4 += v26 + vshld_n_s64(v4 + v26, 0x20uLL))
  {
    unsigned int v26 = a3->u8[0];
    a3 = (uint8x16_t *)((char *)a3 + 1);
    --j;
  }
  uint64x2_t v27 = vshrq_n_u64(vmull_lane_u32((uint32x2_t)v4, (uint32x2_t)0x800780710000FFF1, 1), 0x2FuLL);
  v27.i32[1] = v27.i32[2];
  int32x2_t v28 = vmls_lane_s32((int32x2_t)v4, *(int32x2_t *)v27.i8, (int32x2_t)0x800780710000FFF1, 0);
  return (v28.i32[0] + (v28.i32[1] << 16));
}

size_t lzma_xz_buffer_decode(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  size_t result = 0;
  if (a4 >= 0xC && a5)
  {
    if (*(_DWORD *)a3 != 1484404733 || *(_WORD *)(a3 + 4) != 90) {
      return 0;
    }
    int v12 = *(_DWORD *)(a3 + 8);
    int32x2_t v13 = (unsigned char *)(a3 + 6);
    if (v12 != xz_simple_crc32((unsigned __int8 *)(a3 + 6), 2)) {
      return 0;
    }
    if (*v13) {
      return 0;
    }
    uint64_t v14 = *(unsigned __int8 *)(a3 + 7);
    if (v14 > 0xF) {
      return 0;
    }
    size_t result = 0;
    if (*(unsigned __int8 *)(a3 + 7) > 3u)
    {
      if (v14 == 4)
      {
        uint64_t v14 = 8;
      }
      else
      {
        if (v14 != 10) {
          return result;
        }
        uint64_t v14 = 32;
      }
    }
    else if (*(unsigned char *)(a3 + 7))
    {
      if (v14 != 1) {
        return result;
      }
      uint64_t v14 = 4;
    }
    if (a4 < 0xD) {
      return 0;
    }
    size_t v15 = 0;
    unint64_t v16 = 12;
    uint64_t v33 = v14;
    while (1)
    {
      int v17 = (unsigned __int8 *)(a3 + v16);
      uint64_t v18 = *(unsigned __int8 *)(a3 + v16);
      unint64_t v19 = v16 + 1;
      if (!*(unsigned char *)(a3 + v16)) {
        break;
      }
      uint64_t v34 = 4 * v18 + 4;
      size_t v35 = v15;
      unint64_t v20 = v34 + v19;
      if (v34 + v19 <= a4)
      {
        unint64_t v21 = v16;
        int v22 = *(_DWORD *)&v17[4 * v18];
        if (v22 == xz_simple_crc32(v17, 4 * v18))
        {
          unint64_t v39 = v21 + 2;
          char v23 = *(unsigned char *)(a3 + v19);
          if ((v23 & 0x3F) == 0
            && ((*(unsigned char *)(a3 + v19) & 0x40) == 0 || (xz_read_multi_byte(a3, v20, &v39, &v38) & 0x80000000) == 0)
            && ((v23 & 0x80) == 0 || (xz_read_multi_byte(a3, v20, &v39, &v38) & 0x80000000) == 0))
          {
            uint64_t v36 = 0;
            uint64_t v37 = 0;
            if ((xz_read_multi_byte(a3, v20, &v39, &v37) & 0x80000000) == 0
              && (xz_read_multi_byte(a3, v20, &v39, &v36) & 0x80000000) == 0
              && v37 == 33
              && v36 == 1
              && v39 < v20
              && *(unsigned __int8 *)(a3 + v39) <= 0x28u)
            {
              unint64_t v24 = v34 + v21;
              unint64_t v39 = 0;
              size_t v25 = lzma2_block_decode(a1 + v35, a2 - v35, a3 + v24, a4 - v24, &v39, a5);
              if (v25)
              {
                if (v39)
                {
                  unint64_t v16 = v24 + v33 + ((v39 + 3) & 0xFFFFFFFFFFFFFFFCLL);
                  size_t v15 = v25 + v35;
                  if (v16 < a4) {
                    continue;
                  }
                }
              }
            }
          }
        }
      }
      return 0;
    }
    uint64_t v38 = 0;
    unint64_t v39 = v16 + 1;
    if ((xz_read_multi_byte(a3, a4, &v39, &v38) & 0x80000000) != 0) {
      return 0;
    }
    uint64_t v26 = v38;
    if (v38)
    {
      while ((xz_read_multi_byte(a3, a4, &v39, &v37) & 0x80000000) == 0
           && (xz_read_multi_byte(a3, a4, &v39, &v37) & 0x80000000) == 0)
      {
        if (!--v26) {
          goto LABEL_44;
        }
      }
      return 0;
    }
LABEL_44:
    unint64_t v27 = (v39 - v16 + 3) & 0xFFFFFFFFFFFFFFFCLL;
    unint64_t v28 = v27 + 4;
    if ((unint64_t)&v17[v27 + 4] > a3 + a4) {
      return 0;
    }
    int v29 = *(_DWORD *)&v17[v27];
    if (v29 != xz_simple_crc32((unsigned __int8 *)(a3 + v16), v27)) {
      return 0;
    }
    unint64_t v30 = v28 + v16;
    if (v28 + v16 + 12 > a4) {
      return 0;
    }
    uint64_t v31 = (int *)(a3 + v30);
    if (*(unsigned __int16 *)(a3 + v30 + 8) != *(unsigned __int16 *)(a3 + 6) || *((_WORD *)v31 + 5) != 23129) {
      return 0;
    }
    int v32 = *v31;
    if (v32 == xz_simple_crc32((unsigned __int8 *)v31 + 4, 6)) {
      return v15;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t lzma_xz_buffer_decode_scratch_size()
{
  return 30080;
}

uint64_t xz_simple_crc32(unsigned __int8 *a1, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  unsigned int v2 = -1;
  do
  {
    int v3 = *a1++;
    unsigned int v4 = crc32_lut4[(v2 ^ v3) & 0xF];
    unsigned int v2 = (v4 >> 4) ^ (v2 >> 8) ^ crc32_lut4[(v4 ^ ((v2 ^ v3) >> 4)) & 0xF];
    --a2;
  }
  while (a2);
  return ~v2;
}

uint64_t xz_read_multi_byte(uint64_t a1, unint64_t a2, unint64_t *a3, void *a4)
{
  unint64_t v4 = *a3;
  if (*a3 < a2)
  {
    if (v4 + 9 >= a2) {
      unint64_t v5 = a2;
    }
    else {
      unint64_t v5 = v4 + 9;
    }
    char v6 = *(unsigned char *)(a1 + v4);
    uint64_t v7 = v6 & 0x7F;
    unint64_t v8 = v4 + 1;
    if ((v6 & 0x80) == 0)
    {
LABEL_6:
      uint64_t result = 0;
      *a3 = v8;
      *a4 = v7;
      return result;
    }
    uint64_t v10 = 7;
    while (v5 != v8)
    {
      char v11 = *(unsigned char *)(a1 + v8);
      if (!v11) {
        break;
      }
      v7 |= (unint64_t)(v11 & 0x7F) << v10;
      v10 += 7;
      ++v8;
      if ((v11 & 0x80) == 0) {
        goto LABEL_6;
      }
    }
  }
  return 0xFFFFFFFFLL;
}

BOOL lzma_stream_identify_algorithm(_DWORD *a1)
{
  return *a1 == 1484404733;
}

uint64_t touchpadCodecEncodeImage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, int a6)
{
  BOOL v7 = *(void *)(a1 + 656) == 0;
  unint64_t v123 = 0;
  long long v121 = 0u;
  long long v122 = 0u;
  unint64_t v8 = *(unsigned int *)(a1 + 664);
  if (a5 < 2 * v8) {
    goto LABEL_120;
  }
  unsigned int v9 = v7 | a6;
  if (v9 > 1) {
    return 0;
  }
  uint64_t v12 = *(unsigned int *)(a1 + 668);
  *(void *)&long long v121 = a2;
  *((void *)&v121 + 1) = a3;
  unint64_t v123 = 0;
  long long v122 = 0uLL;
  unsigned __int8 v119 = v9;
  codecWriteHeader((uint64_t *)&v121, v8, v12, *(unsigned __int8 *)(a1 + 672), v9);
  unsigned __int8 v13 = v119;
  if (v119)
  {
    codecResetModel(a1);
    unsigned __int8 v13 = v119;
  }
  if (v12)
  {
    unsigned int v120 = 0;
    uint64_t v14 = 0;
    uint64_t v117 = v12;
    unint64_t v118 = a5;
    while (1)
    {
      uint64_t v15 = (v13 & (v14 != 0)) != 0 ? -(uint64_t)v8 : 0;
      if (v8) {
        break;
      }
LABEL_104:
      ++v14;
      a4 += v118;
      v120 += v8;
      unsigned __int8 v13 = v119;
      if (v14 == v117) {
        goto LABEL_105;
      }
    }
    uint64_t v16 = 0;
    uint64_t v17 = *(void *)(a1 + 632);
    int v18 = *(__int16 *)(v17 + 2 * (v8 * v14) + 2 * v15);
    uint64_t v19 = v17 + 2 * v120;
    uint64_t v20 = v19 + 2 * v15;
    int v21 = v18;
    int v22 = v18;
    int v23 = v18;
    while (1)
    {
      uint64_t v24 = v16 + 1;
      if (v16 + 1 < v8) {
        int v23 = *(__int16 *)(v20 + 2 * v16 + 2);
      }
      int v25 = *(__int16 *)(a4 + 2 * v16);
      *(_WORD *)(v19 + 2 * v16) = *(_WORD *)(a4 + 2 * v16);
      int v26 = v18 - v21;
      if (v18 - v21 <= -2) {
        int v27 = -2;
      }
      else {
        int v27 = 0;
      }
      if (v26 > 1) {
        int v27 = 2;
      }
      if (v26 < -40) {
        int v27 = -1;
      }
      if (v26 <= 40) {
        int v28 = v27;
      }
      else {
        int v28 = 1;
      }
      int v29 = 25 * v28;
      int v30 = v21 - v22;
      if (v21 - v22 <= -2) {
        int v31 = -2;
      }
      else {
        int v31 = 0;
      }
      if (v30 > 1) {
        int v31 = 2;
      }
      if (v30 < -40) {
        int v31 = -1;
      }
      if (v30 <= 40) {
        int v32 = v31;
      }
      else {
        int v32 = 1;
      }
      int v33 = 5 * v32 + v29;
      int v34 = v22 - v23;
      if (v22 - v23 <= -2) {
        int v35 = -2;
      }
      else {
        int v35 = 0;
      }
      if (v34 > 1) {
        int v35 = 2;
      }
      if (v34 < -40) {
        int v35 = -1;
      }
      if (v34 <= 40) {
        int v36 = v35;
      }
      else {
        int v36 = 1;
      }
      int v37 = v33 + v36;
      int v38 = v22 - v21 + v18;
      if (v38 <= v18) {
        int v39 = v18;
      }
      else {
        int v39 = v38;
      }
      if (v38 < v18) {
        int v18 = v38;
      }
      if (v39 >= v22) {
        int v40 = v22;
      }
      else {
        int v40 = v39;
      }
      if (v18 <= v40) {
        int v18 = v40;
      }
      int v41 = v25 - v18;
      if (v37 >= 0) {
        unsigned int v42 = v37;
      }
      else {
        unsigned int v42 = -v37;
      }
      if (v37 < 0) {
        int v41 = -v41;
      }
      uint64_t v43 = a1 + 10 * v42;
      v44 = (unsigned char *)(v43 + 8);
      int v45 = *(unsigned __int8 *)(v43 + 8);
      unsigned int v46 = v41 - ((*(_DWORD *)(v43 + 4) + 8) >> 4);
      int v47 = (__int16)v46;
      int v48 = ~(2 * (__int16)v46);
      int v49 = (2 * (__int16)v46) ^ ~(v48 >> 31);
      unsigned int v50 = (unsigned __int16)((2 * v46) ^ ~(unsigned __int16)(v48 >> 31));
      unsigned int v51 = v50 >> v45;
      if (v50 >> v45 > 0xF)
      {
        unsigned int v70 = v123;
        int v69 = HIDWORD(v123);
        int v71 = HIDWORD(v123) + 16;
        HIDWORD(v123) += 16;
        if (v69 >= 1)
        {
          unint64_t v73 = *((void *)&v121 + 1);
          unint64_t v72 = v122;
          unint64_t v74 = v122 + 1;
          *(void *)&long long v122 = v122 + 1;
          if (v72 < *((void *)&v121 + 1))
          {
            uint64_t v75 = (*((void *)&v122 + 1))++;
            *(unsigned char *)(v121 + v75) = v123;
            unsigned int v70 = v123;
            int v71 = HIDWORD(v123);
            unint64_t v73 = *((void *)&v121 + 1);
            unint64_t v74 = v122;
          }
          unsigned int v76 = v70 >> 8;
          int v77 = v71 - 8;
          unint64_t v123 = __PAIR64__(v77, v76);
          *(void *)&long long v122 = v74 + 1;
          if (v74 < v73)
          {
            uint64_t v78 = (*((void *)&v122 + 1))++;
            *(unsigned char *)(v121 + v78) = v76;
            unsigned int v76 = v123;
            int v77 = HIDWORD(v123);
          }
          unsigned int v70 = v76 >> 8;
          int v71 = v77 - 8;
        }
        unsigned int v79 = v70 | (v50 << v71);
        int v80 = v71 + 16;
        LODWORD(v123) = v79;
        HIDWORD(v123) = v71 + 16;
        if (v71 >= 1)
        {
          unint64_t v82 = *((void *)&v121 + 1);
          unint64_t v81 = v122;
          unint64_t v83 = v122 + 1;
          *(void *)&long long v122 = v122 + 1;
          if (v81 < *((void *)&v121 + 1))
          {
            uint64_t v84 = (*((void *)&v122 + 1))++;
            *(unsigned char *)(v121 + v84) = v79;
            unsigned int v79 = v123;
            int v80 = HIDWORD(v123);
            unint64_t v82 = *((void *)&v121 + 1);
            unint64_t v83 = v122;
          }
          unsigned int v67 = v79 >> 8;
          int v68 = v80 - 8;
          LODWORD(v123) = v67;
          HIDWORD(v123) = v80 - 8;
          *(void *)&long long v122 = v83 + 1;
          if (v83 < v82)
          {
LABEL_81:
            uint64_t v85 = (*((void *)&v122 + 1))++;
            *(unsigned char *)(v121 + v85) = v67;
            unsigned int v67 = v123;
            int v68 = HIDWORD(v123);
          }
LABEL_82:
          LODWORD(v123) = v67 >> 8;
          HIDWORD(v123) = v68 - 8;
        }
      }
      else
      {
        unsigned int v52 = v123 | (1 << v51 << SBYTE4(v123));
        int v53 = v51 + HIDWORD(v123) + 1;
        unint64_t v123 = __PAIR64__(v53, v52);
        if (v53 >= 17)
        {
          unint64_t v55 = *((void *)&v121 + 1);
          unint64_t v54 = v122;
          unint64_t v56 = v122 + 1;
          *(void *)&long long v122 = v122 + 1;
          if (v54 < *((void *)&v121 + 1))
          {
            uint64_t v57 = (*((void *)&v122 + 1))++;
            *(unsigned char *)(v121 + v57) = v52;
            unsigned int v52 = v123;
            int v53 = HIDWORD(v123);
            unint64_t v55 = *((void *)&v121 + 1);
            unint64_t v56 = v122;
          }
          unsigned int v58 = v52 >> 8;
          int v59 = v53 - 8;
          unint64_t v123 = __PAIR64__(v59, v58);
          *(void *)&long long v122 = v56 + 1;
          if (v56 < v55)
          {
            uint64_t v60 = (*((void *)&v122 + 1))++;
            *(unsigned char *)(v121 + v60) = v58;
            unsigned int v58 = v123;
            int v59 = HIDWORD(v123);
          }
          unsigned int v52 = v58 >> 8;
          int v53 = v59 - 8;
        }
        unsigned int v61 = v52 | ((unsigned __int16)(v49 - (v51 << v45)) << v53);
        int v62 = v53 + v45;
        unint64_t v123 = __PAIR64__(v62, v61);
        if (v62 >= 17)
        {
          unint64_t v64 = *((void *)&v121 + 1);
          unint64_t v63 = v122;
          unint64_t v65 = v122 + 1;
          *(void *)&long long v122 = v122 + 1;
          if (v63 < *((void *)&v121 + 1))
          {
            uint64_t v66 = (*((void *)&v122 + 1))++;
            *(unsigned char *)(v121 + v66) = v61;
            unsigned int v61 = v123;
            int v62 = HIDWORD(v123);
            unint64_t v64 = *((void *)&v121 + 1);
            unint64_t v65 = v122;
          }
          unsigned int v67 = v61 >> 8;
          int v68 = v62 - 8;
          unint64_t v123 = __PAIR64__(v68, v67);
          *(void *)&long long v122 = v65 + 1;
          if (v65 < v64) {
            goto LABEL_81;
          }
          goto LABEL_82;
        }
      }
      uint64_t v86 = a1 + 10 * v42;
      char v88 = *(unsigned char *)(v86 + 9);
      v87 = (unsigned char *)(v86 + 9);
      int v89 = *(_DWORD *)v43;
      unsigned __int8 v90 = v88 + 1;
      unsigned char *v87 = v88 + 1;
      int v91 = *v44;
      if (v47 >= 0) {
        int v92 = v47;
      }
      else {
        int v92 = -v47;
      }
      if (v47 <= 0)
      {
        if ((v47 & 0x80000000) == 0) {
          goto LABEL_90;
        }
        int v93 = -1;
      }
      else
      {
        int v93 = 1;
      }
      *(_DWORD *)(v43 + 4) += v93;
LABEL_90:
      int v94 = v89 + v92;
      int v95 = v90;
      int v96 = v90 << v91;
      int v98 = v96 >= 2 * v94 && v91 != 0;
      int v99 = v98 << 31 >> 31;
      if (v96 >= v94) {
        char v100 = v99;
      }
      else {
        char v100 = 1;
      }
      *(_DWORD *)uint64_t v43 = v94;
      unsigned char *v44 = v91 + v100;
      if (v95 == 64)
      {
        unsigned char *v87 = 32;
        *(_DWORD *)uint64_t v43 = v94 - (v94 >> 1);
      }
      uint64_t v16 = v24;
      int v18 = v25;
      int v21 = v22;
      int v22 = v23;
      if (v8 == v24) {
        goto LABEL_104;
      }
    }
  }
LABEL_105:
  int FooterID = codecGetFooterID(a1);
  int v102 = HIDWORD(v123);
  unsigned int v103 = v123 | (FooterID << SBYTE4(v123));
  int v104 = HIDWORD(v123) + 12;
  LODWORD(v123) = v103;
  HIDWORD(v123) += 12;
  if (v102 >= 5)
  {
    unint64_t v105 = *((void *)&v121 + 1);
    unint64_t v106 = v122;
    unint64_t v107 = v122 + 1;
    *(void *)&long long v122 = v122 + 1;
    if (v106 < *((void *)&v121 + 1))
    {
      uint64_t v108 = (*((void *)&v122 + 1))++;
      *(unsigned char *)(v121 + v108) = v103;
      unsigned int v103 = v123;
      int v104 = HIDWORD(v123);
      unint64_t v105 = *((void *)&v121 + 1);
      unint64_t v107 = v122;
    }
    unsigned int v109 = v103 >> 8;
    int v110 = v104 - 8;
    unint64_t v123 = __PAIR64__(v110, v109);
    *(void *)&long long v122 = v107 + 1;
    if (v107 < v105)
    {
      uint64_t v111 = (*((void *)&v122 + 1))++;
      *(unsigned char *)(v121 + v111) = v109;
      unsigned int v109 = v123;
      int v110 = HIDWORD(v123);
    }
    unsigned int v103 = v109 >> 8;
    int v104 = v110 - 8;
    unint64_t v123 = __PAIR64__(v104, v103);
  }
  if (v104 >= 1)
  {
    do
    {
      unint64_t v112 = v122;
      *(void *)&long long v122 = v122 + 1;
      if (v112 < *((void *)&v121 + 1))
      {
        uint64_t v113 = (*((void *)&v122 + 1))++;
        *(unsigned char *)(v121 + v113) = v103;
        unsigned int v103 = v123;
        int v104 = HIDWORD(v123);
      }
      v103 >>= 8;
      BOOL v114 = __OFSUB__(v104, 8);
      v104 -= 8;
      unint64_t v123 = __PAIR64__(v104, v103);
    }
    while (!((v104 < 0) ^ v114 | (v104 == 0)));
  }
  uint64_t result = v122;
  if (!(void)v122 || (void)v122 != *((void *)&v122 + 1))
  {
LABEL_120:
    codecResetModel(a1);
    return 0;
  }
  ++*(void *)(a1 + 656);
  return result;
}

size_t lzma2_block_decode(unint64_t a1, size_t a2, uint64_t a3, unint64_t a4, unint64_t *a5, void *a6)
{
  __n128 v32 = 0u;
  long long v33 = 0u;
  if (!a4) {
    return 0;
  }
  size_t v9 = 0;
  unint64_t v10 = 0;
  unint64_t v29 = a1 + a2;
  while (1)
  {
    unint64_t v11 = v10 + 1;
    unsigned int v12 = *(unsigned __int8 *)(a3 + v10);
    if ((*(char *)(a3 + v10) & 0x80000000) == 0) {
      break;
    }
    unint64_t v18 = v10 + 5;
    if (v10 + 5 > a4) {
      return 0;
    }
    int v19 = *(unsigned __int8 *)(a3 + v11);
    int v20 = *(unsigned __int8 *)(v10 + a3 + 2);
    unsigned int v21 = *(unsigned __int16 *)(v10 + a3 + 3);
    int v22 = (v12 >> 5) & 3;
    if ((v22 - 2) >= 2)
    {
      if (!v22) {
        goto LABEL_22;
      }
    }
    else
    {
      if (v18 >= a4) {
        return 0;
      }
      unsigned int v23 = *(unsigned __int8 *)(a3 + v18);
      if (v23 > 0xE0) {
        return 0;
      }
      __int16 v24 = *(unsigned __int8 *)(a3 + v18) / 9u;
      BYTE10(v33) = v23 - 9 * v24;
      BYTE8(v33) = (((v23 - ((unsigned __int16)(109 * v23) >> 8)) >> 1) + ((109 * v23) >> 8)) >> 5;
      BYTE9(v33) = v24 - 5 * ((unsigned __int16)(52 * v24) >> 8);
      BYTE11(v33) = ~(-1 << SBYTE9(v33));
      BYTE12(v33) = ~(-1 << SBYTE8(v33));
      if ((BYTE9(v33) + BYTE10(v33)) > 4u) {
        goto LABEL_30;
      }
      unint64_t v18 = v10 + 6;
    }
    lzma1_model_reset(&v32, a6);
LABEL_22:
    uint64_t v25 = ((v20 | (v19 << 8)) & 0xFFE0FFFF | ((v12 & 0x1F) << 16)) + 1;
    unint64_t v10 = __rev16(v21) + 1 + v18;
    size_t v16 = v9 + v25;
    BOOL v26 = v10 > a4 || v16 > a2;
    if (v26
      || lzma1_chunk_decode((unsigned int *)&v32, a1, (unsigned char *)(a1 + v9), (unsigned char *)(a1 + v9 + v25), v29, (unsigned __int8 *)(a3 + v18), a4 - v18) != v25)
    {
      return 0;
    }
LABEL_27:
    size_t v9 = v16;
    if (v10 >= a4) {
      return 0;
    }
  }
  if (*(unsigned char *)(a3 + v10))
  {
    unint64_t v13 = v10 + 3;
    if (v12 > 2 || v13 > a4) {
      return 0;
    }
    size_t v15 = (*(unsigned __int8 *)(v10 + a3 + 2) | ((unint64_t)*(unsigned __int8 *)(a3 + v11) << 8)) + 1;
    unint64_t v10 = v15 + v13;
    size_t v16 = v15 + v9;
    if (v15 + v13 > a4 || v16 > a2) {
      return 0;
    }
    memcpy((void *)(a1 + v9), (const void *)(a3 + v13), v15);
    goto LABEL_27;
  }
  *a5 = v11;
LABEL_30:
  if ((v12 & 0x80) != 0) {
    return 0;
  }
  return v9;
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x270ED87B0](__count, __size);
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x270ED9D98](a1, a2);
}

long double log2(long double __x)
{
  MEMORY[0x270EDA0D8](__x);
  return result;
}

uint64_t lzma_auto_decoder()
{
  return MEMORY[0x270F99BA8]();
}

uint64_t lzma_code()
{
  return MEMORY[0x270F99BB0]();
}

uint64_t lzma_easy_buffer_encode()
{
  return MEMORY[0x270F99BC0]();
}

uint64_t lzma_easy_encoder()
{
  return MEMORY[0x270F99BC8]();
}

uint64_t lzma_end()
{
  return MEMORY[0x270F99BD0]();
}

uint64_t lzma_stream_buffer_decode()
{
  return MEMORY[0x270F99C18]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

void memset_pattern8(void *__b, const void *__pattern8, size_t __len)
{
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x270EDA4B8](__s, __smax, *(void *)&__c, __n);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x270EDA598](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x270EDA5F8](a1, a2);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return MEMORY[0x270EDADF8](a1);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x270EDAE10](a1);
}

int pthread_attr_setstacksize(pthread_attr_t *a1, size_t a2)
{
  return MEMORY[0x270EDAE40](a1, a2);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x270EDAE50](a1);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x270EDAE58](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x270EDAE60](a1, a2);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x270EDAE88](a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x270EDAEA0](a1, a2, a3, a4);
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x270EDAF10](a1, a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF50](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x270EDAF58](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x270EDB120](*(void *)&a1, a2, a3);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x270EDB158](__ptr, __size);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDB568](a1, a2);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB6E8](__str, __endptr, *(void *)&__base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}