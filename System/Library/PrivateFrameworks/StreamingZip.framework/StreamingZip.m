id SZGetLoggingHandle()
{
  void *v0;
  uint64_t vars8;

  if (SZGetLoggingHandle_onceToken != -1) {
    dispatch_once(&SZGetLoggingHandle_onceToken, &__block_literal_global_3);
  }
  v0 = (void *)SZGetLoggingHandle_logHandle;

  return v0;
}

uint64_t __SZGetLoggingHandle_block_invoke()
{
  SZGetLoggingHandle_logHandle = (uint64_t)os_log_create("com.apple.streamingzip", "framework");

  return MEMORY[0x1F41817F8]();
}

id SZGetTraceHandle()
{
  if (SZGetTraceHandle_onceToken != -1) {
    dispatch_once(&SZGetTraceHandle_onceToken, &__block_literal_global_4);
  }
  v0 = (void *)SZGetTraceHandle_logHandle;

  return v0;
}

uint64_t __SZGetTraceHandle_block_invoke()
{
  SZGetTraceHandle_logHandle = (uint64_t)os_log_create("com.apple.streamingzip.signposts", "framework");

  return MEMORY[0x1F41817F8]();
}

uint64_t UNIX2DOSTime(uint64_t a1)
{
  memset(&v4, 0, sizeof(v4));
  time_t v5 = (a1 + 1) & 0xFFFFFFFFFFFFFFFELL;
  v1 = localtime_r(&v5, &v4);
  int tm_year = v1->tm_year;
  if (tm_year >= 80) {
    return ((tm_year << 25) + 1610612736) | (v1->tm_sec >> 1) | (32 * v1->tm_min) | (v1->tm_hour << 11) | (v1->tm_mday << 16) | ((v1->tm_mon << 21) + 0x200000);
  }
  else {
    return 2162688;
  }
}

time_t DOS2UNIXTime(unsigned int a1)
{
  time_t v6 = time(0);
  v3 = (tm *)DOS2UNIXTime_t;
  if (!DOS2UNIXTime_t)
  {
    v3 = localtime_r(&v6, &DOS2UNIXTime_buf);
    DOS2UNIXTime_t = (uint64_t)v3;
  }
  v3->tm_isdst = -1;
  v2.i32[0] = a1;
  int8x16_t v4 = (int8x16_t)vshlq_u32((uint32x4_t)vdupq_n_s32(a1), (uint32x4_t)xmmword_1DD5E4240);
  v4.i32[0] = vshlq_u32(v2, (uint32x4_t)xmmword_1DD5E4230).u32[0];
  *(int8x16_t *)&v3->tm_sec = vandq_s8(v4, (int8x16_t)xmmword_1DD5E4250);
  v3->tm_mon = ((a1 >> 21) & 0xF) - 1;
  v3->int tm_year = (a1 >> 25) + 80;
  return mktime(v3);
}

unsigned __int16 *GetExtraFieldWithSignature(uint64_t a1, unint64_t a2, unsigned __int16 *a3)
{
  if (a2)
  {
    uint64_t v3 = 0;
    int v4 = 0;
    do
    {
      uint64_t v5 = v3 + 4;
      if (v3 + 4 > a2) {
        break;
      }
      time_t v6 = (unsigned __int16 *)(a1 + v3);
      uint64_t v7 = v6[1];
      if (*v6 == *a3)
      {
        if (v5 + v7 <= a2) {
          return v6;
        }
        else {
          return 0;
        }
      }
      v4 += v7 + 4;
      uint64_t v3 = (unsigned __int16)v4;
    }
    while ((unsigned __int16)v4 < a2);
  }
  return 0;
}

unsigned __int16 *OpenLocalFile(uint64_t a1, uint64_t a2, char *__s, unsigned __int16 a4, char a5, int *a6)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  size_t v10 = *(void *)(a2 + 64) + strlen(__s) + a4 + 30;
  uint64_t v11 = *(void *)(a2 + 32);
  uint64_t v12 = *(void *)(a2 + 40);
  uint64_t v13 = *(unsigned int *)(a2 + 28);
  compression_status v14 = *(unsigned __int16 *)(a2 + 6);
  v15 = *(const char **)(a2 + 72);
  v16 = (unsigned __int16 *)malloc_type_calloc(1uLL, 0x78uLL, 0x10F00403766FA32uLL);
  *a6 = 0;
  v16[56] = v14;
  *((unsigned char *)v16 + 114) = a5;
  *((void *)v16 + 5) = v10;
  *((void *)v16 + 6) = v11;
  *((void *)v16 + 7) = v12;
  *((void *)v16 + 8) = 0;
  *((void *)v16 + 9) = a1;
  *((void *)v16 + 10) = 0;
  *((void *)v16 + 12) = crc32(0, 0, 0);
  *((void *)v16 + 13) = v13;
  *((void *)v16 + 11) = strdup(v15);
  if (!*((unsigned char *)v16 + 114))
  {
    unsigned int v17 = v16[56];
    if (v17 > 0xD)
    {
      if (v17 != 14 && v17 != 99) {
        goto LABEL_12;
      }
    }
    else
    {
      if (!v16[56]) {
        return v16;
      }
      if (v17 != 8)
      {
LABEL_12:
        v20 = SZGetLoggingHandle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          uint64_t v27 = *((void *)v16 + 11);
          int v29 = 67109378;
          compression_status v30 = v14;
          __int16 v31 = 2080;
          uint64_t v32 = v27;
          _os_log_error_impl(&dword_1DD5BF000, v20, OS_LOG_TYPE_ERROR, "Unknown compression scheme (%d) found for file %s; must use raw mode.",
            (uint8_t *)&v29,
            0x12u);
        }
        int v21 = 5;
        goto LABEL_22;
      }
    }
    *((void *)v16 + 10) = malloc_type_malloc(0x10000uLL, 0xC95C5AF3uLL);
    int v18 = v16[56];
    switch(v18)
    {
      case 8:
        compression_algorithm v19 = COMPRESSION_ZLIB;
        break;
      case 14:
        compression_algorithm v19 = COMPRESSION_LZMA;
        break;
      case 99:
        compression_algorithm v19 = COMPRESSION_LZFSE;
        break;
      default:
        v24 = SZGetLoggingHandle();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          compression_status v28 = v16[56];
          int v29 = 67109120;
          compression_status v30 = v28;
          v25 = "Failed to get compression algorithm id for method %d";
          goto LABEL_25;
        }
LABEL_21:
        int v21 = 3;
LABEL_22:
        *a6 = v21;
        free(*((void **)v16 + 11));
        free(*((void **)v16 + 10));
        free(v16);
        return 0;
    }
    compression_status v22 = compression_stream_init((compression_stream *)v16, COMPRESSION_STREAM_DECODE, v19);
    if (v22)
    {
      compression_status v23 = v22;
      v24 = SZGetLoggingHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        int v29 = 67109120;
        compression_status v30 = v23;
        v25 = "Failed to initialize compression: %d";
LABEL_25:
        _os_log_error_impl(&dword_1DD5BF000, v24, OS_LOG_TYPE_ERROR, v25, (uint8_t *)&v29, 8u);
        goto LABEL_21;
      }
      goto LABEL_21;
    }
  }
  return v16;
}

uint64_t ReadLocalFileData(uint64_t *a1, void *a2, size_t a3, size_t *a4)
{
  size_t v5 = a3;
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  int v8 = *((unsigned __int16 *)a1 + 56);
  if (!*((_WORD *)a1 + 56) || *((unsigned char *)a1 + 114))
  {
    if (a1[6])
    {
      if (fseeko(*(FILE **)a1[9], a1[5], 0))
      {
        v9 = SZGetLoggingHandle();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          size_t v10 = __error();
          uint64_t v11 = strerror(*v10);
          *(_DWORD *)buf = 136315138;
          *(void *)v61 = v11;
          uint64_t v12 = "Failed to seek to local file data: %s";
          goto LABEL_41;
        }
        return 4;
      }
      if (a1[6] < v5) {
        size_t v5 = a1[6];
      }
      if (v5 != fread(a2, 1uLL, v5, *(FILE **)a1[9]))
      {
        v9 = SZGetLoggingHandle();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          *(void *)v61 = v5;
          uint64_t v12 = "Failed to read %ld bytes of local file data";
          goto LABEL_41;
        }
        return 4;
      }
      if (!*((_WORD *)a1 + 56)) {
        a1[12] = crc32(a1[12], (const Bytef *)a2, v5);
      }
      *a4 = v5;
      size_t v37 = a1[6] - v5;
      BOOL v38 = a1[6] == v5;
      a1[5] += v5;
      a1[6] = v37;
      a1[8] += v5;
      return (2 * v38);
    }
    else
    {
      uint64_t v13 = SZGetLoggingHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        uint64_t v14 = 2;
        _os_log_error_impl(&dword_1DD5BF000, v13, OS_LOG_TYPE_ERROR, "No data remaining!", buf, 2u);
      }
      else
      {
        return 2;
      }
    }
    return v14;
  }
  if (v8 != 8 && v8 != 99 && v8 != 14)
  {
    v41 = SZGetLoggingHandle();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      int v56 = *((unsigned __int16 *)a1 + 56);
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v61 = v56;
      _os_log_error_impl(&dword_1DD5BF000, v41, OS_LOG_TYPE_ERROR, "Unknown compression method: %d", buf, 8u);
    }
    return 5;
  }
  *a1 = (uint64_t)a2;
  a1[1] = a3;
  *a4 = 0;
  while (1)
  {
    uint64_t v16 = a1[1];
    if (!v16) {
      return 0;
    }
    if (a1[3]) {
      goto LABEL_24;
    }
    unint64_t v17 = a1[6];
    if (!v17) {
      goto LABEL_24;
    }
    if (v17 >= 0x10000) {
      unint64_t v17 = 0x10000;
    }
    int v18 = (FILE **)a1[9];
    a1[2] = a1[10];
    a1[3] = v17;
    if (fseeko(*v18, a1[5], 0)) {
      break;
    }
    size_t v19 = fread((void *)a1[10], 1uLL, a1[3], *(FILE **)a1[9]);
    size_t v20 = v19;
    if (a1[3] != v19)
    {
      v54 = SZGetLoggingHandle();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        uint64_t v57 = a1[3];
        if (feof(*(FILE **)a1[9])) {
          int v58 = 121;
        }
        else {
          int v58 = 110;
        }
        int v59 = ferror(*(FILE **)a1[9]);
        *(_DWORD *)buf = 134218752;
        *(void *)v61 = v57;
        *(_WORD *)&v61[8] = 2048;
        *(void *)&v61[10] = v20;
        *(_WORD *)&v61[18] = 1024;
        *(_DWORD *)&v61[20] = v58;
        *(_WORD *)&v61[24] = 1024;
        *(_DWORD *)&v61[26] = v59;
        uint64_t v12 = "Failed to read %zu bytes of local file data; read %lu bytes; isEOF=%c; ferror=%d";
        v39 = v54;
        uint32_t v40 = 34;
        goto LABEL_42;
      }
      return 4;
    }
    size_t v21 = a1[6] - v19;
    a1[5] += v19;
    a1[6] = v21;
    uint64_t v16 = a1[1];
LABEL_24:
    compression_status v22 = (const Bytef *)*a1;
    compression_status v23 = SZGetLoggingHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v29 = a1[2];
      uint64_t v30 = a1[3];
      __int16 v31 = (const Bytef *)*a1;
      uint64_t v32 = a1[1];
      *(_DWORD *)buf = 134218752;
      *(void *)v61 = v29;
      *(_WORD *)&v61[8] = 2048;
      *(void *)&v61[10] = v30;
      *(_WORD *)&v61[18] = 2048;
      *(void *)&v61[20] = v31;
      *(_WORD *)&v61[28] = 2048;
      *(void *)&v61[30] = v32;
      _os_log_debug_impl(&dword_1DD5BF000, v23, OS_LOG_TYPE_DEBUG, "Calling compression_stream_process with src_ptr: %p, src_size: %zu, dst_ptr: %p, dst_size: %zu", buf, 0x2Au);
    }
    compression_status v24 = compression_stream_process((compression_stream *)a1, 0);
    v25 = SZGetLoggingHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v33 = a1[2];
      uint64_t v34 = a1[3];
      uint64_t v35 = *a1;
      uint64_t v36 = a1[1];
      *(_DWORD *)buf = 67110144;
      *(_DWORD *)v61 = v24;
      *(_WORD *)&v61[4] = 2048;
      *(void *)&v61[6] = v33;
      *(_WORD *)&v61[14] = 2048;
      *(void *)&v61[16] = v34;
      *(_WORD *)&v61[24] = 2048;
      *(void *)&v61[26] = v35;
      *(_WORD *)&v61[34] = 2048;
      *(void *)&v61[36] = v36;
      _os_log_debug_impl(&dword_1DD5BF000, v25, OS_LOG_TYPE_DEBUG, "After process ret %d: src_ptr: %p, src_size: %zu, dst_ptr: %p, dst_size: %zu", buf, 0x30u);
    }
    if (v24 == COMPRESSION_STATUS_ERROR)
    {
      v43 = SZGetLoggingHandle();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v61 = -1;
        v44 = "compression_stream_process returned %d";
        v45 = v43;
        uint32_t v46 = 8;
LABEL_55:
        _os_log_error_impl(&dword_1DD5BF000, v45, OS_LOG_TYPE_ERROR, v44, buf, v46);
      }
      return 3;
    }
    uint64_t v26 = v16 - a1[1];
    uint64_t v27 = SZGetLoggingHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)v61 = v26;
      _os_log_debug_impl(&dword_1DD5BF000, v27, OS_LOG_TYPE_DEBUG, "Processed %zu bytes", buf, 0xCu);
    }
    a1[12] = crc32(a1[12], v22, v26);
    *a4 += v26;
    uint64_t v28 = a1[8] + v26;
    a1[8] = v28;
    if (v24 == COMPRESSION_STATUS_END)
    {
      if (!a1[6])
      {
        if (a1[7] == v28) {
          return 2;
        }
        v49 = SZGetLoggingHandle();
        if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
          return 3;
        }
        uint64_t v51 = a1[7];
        uint64_t v50 = a1[8];
        *(_DWORD *)buf = 134218240;
        *(void *)v61 = v50;
        *(_WORD *)&v61[8] = 2048;
        *(void *)&v61[10] = v51;
        v44 = "Hit end at %llu, before expected size %llu";
        v45 = v49;
        uint32_t v46 = 22;
        goto LABEL_55;
      }
      v47 = SZGetLoggingHandle();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        uint64_t v48 = a1[6];
        *(_DWORD *)buf = 134217984;
        *(void *)v61 = v48;
        v44 = "Hit end with %llu remaining";
        v45 = v47;
        uint32_t v46 = 12;
        goto LABEL_55;
      }
      return 3;
    }
  }
  v9 = SZGetLoggingHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v52 = __error();
    v53 = strerror(*v52);
    *(_DWORD *)buf = 136315138;
    *(void *)v61 = v53;
    uint64_t v12 = "Failed to seek to local file data: %s";
LABEL_41:
    v39 = v9;
    uint32_t v40 = 12;
LABEL_42:
    _os_log_error_impl(&dword_1DD5BF000, v39, OS_LOG_TYPE_ERROR, v12, buf, v40);
  }
  return 4;
}

uint64_t CloseLocalFile(compression_stream *stream)
{
  uint64_t v2 = 0;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unsigned int state_low = LOWORD(stream[2].state);
  if (state_low > 0xD)
  {
    if (state_low != 99 && state_low != 14) {
      goto LABEL_20;
    }
    goto LABEL_10;
  }
  if (LOWORD(stream[2].state))
  {
    if (state_low != 8) {
      goto LABEL_20;
    }
LABEL_10:
    if (BYTE2(stream[2].state)) {
      BOOL v5 = state_low == 0;
    }
    else {
      BOOL v5 = 1;
    }
    if (!v5) {
      goto LABEL_16;
    }
  }
  if (stream[2].src_ptr == (const uint8_t *)stream[2].src_size)
  {
LABEL_16:
    uint64_t v2 = 0;
    goto LABEL_20;
  }
  time_t v6 = SZGetLoggingHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    src_ptr = stream[2].src_ptr;
    size_t src_size = stream[2].src_size;
    size_t dst_size = stream[2].dst_size;
    int v16 = 136315650;
    size_t v17 = dst_size;
    __int16 v18 = 2048;
    size_t v19 = src_size;
    __int16 v20 = 2048;
    size_t v21 = src_ptr;
    _os_log_error_impl(&dword_1DD5BF000, v6, OS_LOG_TYPE_ERROR, "CRC mismatch for %s; expected 0x%lx, actual 0x%lx",
      (uint8_t *)&v16,
      0x20u);
  }
  uint64_t v2 = 6;
LABEL_20:
  if (!BYTE2(stream[2].state))
  {
    int v7 = LOWORD(stream[2].state);
    if (v7 == 8 || v7 == 99 || v7 == 14)
    {
      compression_status v8 = compression_stream_destroy(stream);
      if (v8)
      {
        compression_status v9 = v8;
        size_t v10 = SZGetLoggingHandle();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          int v16 = 67109120;
          LODWORD(v17) = v9;
          _os_log_error_impl(&dword_1DD5BF000, v10, OS_LOG_TYPE_ERROR, "compression_stream_destroy returned %d", (uint8_t *)&v16, 8u);
        }
        uint64_t v2 = 3;
      }
    }
  }
  dst_ptr = stream[2].dst_ptr;
  if (dst_ptr) {
    free(dst_ptr);
  }
  free((void *)stream[2].dst_size);
  free(stream);
  return v2;
}

_WORD *CopyLocalFileHeader(FILE **a1, uint64_t a2, int *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (fseeko(*a1, *(void *)(a2 + 64), 0))
  {
    time_t v6 = SZGetLoggingHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v27[0]) = 0;
      _os_log_error_impl(&dword_1DD5BF000, v6, OS_LOG_TYPE_ERROR, "Failed to seek to local file record", (uint8_t *)v27, 2u);
    }
    goto LABEL_13;
  }
  int v7 = malloc_type_malloc(0x1EuLL, 0x10000401E9FC43BuLL);
  if (!v7)
  {
    __int16 v18 = SZGetLoggingHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v27[0]) = 0;
      uint64_t v26 = "Failed to malloc LocalFileRecord";
      goto LABEL_24;
    }
LABEL_10:
    MutableLocalFileRecord = 0;
    int v20 = 3;
    goto LABEL_14;
  }
  compression_status v8 = v7;
  if (fread(v7, 1uLL, 0x1EuLL, *a1) != 30)
  {
    size_t v21 = SZGetLoggingHandle();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    LOWORD(v27[0]) = 0;
    v15 = "Failed to read local file record";
LABEL_26:
    int v16 = v21;
    uint32_t v17 = 2;
    goto LABEL_27;
  }
  if (*v8 != 67324752)
  {
    compression_status v9 = SZGetLoggingHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = *(unsigned __int8 *)v8;
      int v11 = *((unsigned __int8 *)v8 + 1);
      int v12 = *((unsigned __int8 *)v8 + 2);
      int v13 = *((unsigned __int8 *)v8 + 3);
      off_t v14 = ftello(*a1);
      v27[0] = 67110144;
      v27[1] = v10;
      __int16 v28 = 1024;
      int v29 = v11;
      __int16 v30 = 1024;
      int v31 = v12;
      __int16 v32 = 1024;
      int v33 = v13;
      __int16 v34 = 2048;
      off_t v35 = v14 - 30;
      v15 = "Found invalid local file record with signature 0x%02hhx%02hhx%02hhx%02hhx at offset %lld";
      int v16 = v9;
      uint32_t v17 = 36;
LABEL_27:
      _os_log_error_impl(&dword_1DD5BF000, v16, OS_LOG_TYPE_ERROR, v15, (uint8_t *)v27, v17);
    }
LABEL_12:
    free(v8);
LABEL_13:
    MutableLocalFileRecord = 0;
    int v20 = 4;
    goto LABEL_14;
  }
  size_t v23 = *((unsigned __int16 *)v8 + 14) + (unint64_t)*((unsigned __int16 *)v8 + 13);
  compression_status v24 = reallocf(v8, v23 + 30);
  if (!v24)
  {
    __int16 v18 = SZGetLoggingHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v27[0]) = 0;
      uint64_t v26 = "Failed to allocate full local file record";
LABEL_24:
      _os_log_error_impl(&dword_1DD5BF000, v18, OS_LOG_TYPE_ERROR, v26, (uint8_t *)v27, 2u);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  compression_status v8 = v24;
  if (v23 != fread((char *)v24 + 30, 1uLL, v23, *a1))
  {
    size_t v21 = SZGetLoggingHandle();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    LOWORD(v27[0]) = 0;
    v15 = "Failed to read in variable-length portion of central directory record";
    goto LABEL_26;
  }
  *a3 = 0;
  MutableLocalFileRecord = CreateMutableLocalFileRecord((uint64_t)v8);
  free(v8);
  __int16 v25 = MutableLocalFileRecord[1];
  int v20 = 0;
  if ((v25 & 8) != 0)
  {
    *(_OWORD *)(MutableLocalFileRecord + 20) = *(_OWORD *)(a2 + 32);
    *((_DWORD *)MutableLocalFileRecord + 8) = *(_DWORD *)(a2 + 28);
    MutableLocalFileRecord[1] = v25 & 0xFFF7;
  }
LABEL_14:
  *a3 = v20;
  return MutableLocalFileRecord;
}

void *OpenZipFile(const char *a1, char a2)
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  int v4 = malloc_type_calloc(1uLL, 0x60uLL, 0x10200406EBF9D83uLL);
  BOOL v5 = fopen(a1, "rb");
  *int v4 = v5;
  if (v5)
  {
    if (a2)
    {
      int v6 = fileno(v5);
      if (fcntl(v6, 48, 1))
      {
        int v7 = SZGetLoggingHandle();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          int v33 = __error();
          __int16 v34 = strerror(*v33);
          *(_DWORD *)buf = 136315138;
          *(void *)v97 = v34;
          _os_log_error_impl(&dword_1DD5BF000, v7, OS_LOG_TYPE_ERROR, "Failed to set F_NOCACHE on zip file FD: %s", buf, 0xCu);
        }
      }
    }
    v4[6] = -1;
    v4[3] = 0;
    if (fseeko((FILE *)*v4, -22, 2))
    {
      compression_status v8 = SZGetLoggingHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        compression_status v9 = __error();
        int v10 = strerror(*v9);
        *(_DWORD *)buf = 136315138;
        *(void *)v97 = v10;
        int v11 = "Failed to seek to end record: %s";
        int v12 = v8;
        uint32_t v13 = 12;
LABEL_25:
        _os_log_error_impl(&dword_1DD5BF000, v12, OS_LOG_TYPE_ERROR, v11, buf, v13);
        goto LABEL_26;
      }
      goto LABEL_26;
    }
    v4[1] = ftello((FILE *)*v4) + 22;
    size_t v14 = fread(v4 + 7, 1uLL, 0x16uLL, (FILE *)*v4);
    if (v14 != 22)
    {
      size_t v16 = v14;
      uint32_t v17 = SZGetLoggingHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)v97 = 22;
        *(_WORD *)&v97[8] = 2048;
        *(void *)v98 = v16;
        int v11 = "Failed to read end record: expected to read %lu but actually read %lu";
        int v12 = v17;
        uint32_t v13 = 22;
        goto LABEL_25;
      }
LABEL_26:
      size_t v23 = SZGetLoggingHandle();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        goto LABEL_27;
      }
      *(_WORD *)buf = 0;
      __int16 v25 = "Failed to get end record";
      goto LABEL_32;
    }
    if (*((_DWORD *)v4 + 14) != 101010256)
    {
      v15 = SZGetLoggingHandle();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        goto LABEL_26;
      }
      *(_WORD *)buf = 0;
      int v11 = "Failed to locate end record";
LABEL_24:
      int v12 = v15;
      uint32_t v13 = 2;
      goto LABEL_25;
    }
    if (*((__int16 *)v4 + 32) != -1)
    {
      unsigned int v18 = *((unsigned __int16 *)v4 + 33);
      if (v18 != 0xFFFF && *((_DWORD *)v4 + 17) != -1 && *((_DWORD *)v4 + 18) != -1)
      {
LABEL_40:
        uint64_t v31 = v4[10];
        if (v31)
        {
          if (v18 == 0xFFFF) {
            uint64_t v32 = *(void *)(v31 + 32);
          }
          else {
            uint64_t v32 = v18;
          }
          v4[2] = v32;
          LODWORD(v32) = *((_DWORD *)v4 + 17);
          if (v32 == -1) {
            uint64_t v41 = *(void *)(v31 + 40);
          }
          else {
            uint64_t v41 = *((unsigned int *)v4 + 17);
          }
          v4[5] = v41;
          uint64_t v42 = *((unsigned int *)v4 + 18);
          if (v42 == -1)
          {
            uint64_t v42 = *(void *)(v31 + 48);
            LODWORD(v40) = -1;
          }
          else
          {
            LODWORD(v40) = *((_DWORD *)v4 + 18);
          }
          v4[4] = v42;
          if (v4[11])
          {
            if (*(_DWORD *)(v31 + 16))
            {
              v43 = SZGetLoggingHandle();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
              {
                int v44 = *(_DWORD *)(v4[10] + 16);
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)v97 = v44;
                __int16 v25 = "Z64: Archive says it's disk number %d; must be 0";
LABEL_97:
                uint64_t v26 = v43;
                uint32_t v27 = 8;
                goto LABEL_33;
              }
              goto LABEL_27;
            }
            if (*(_DWORD *)(v31 + 20))
            {
              v43 = SZGetLoggingHandle();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
              {
                int v50 = *(_DWORD *)(v4[10] + 20);
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)v97 = v50;
                __int16 v25 = "Z64: Archive says central directory starts on disk disk number %d; must be 0";
                goto LABEL_97;
              }
LABEL_27:
              if (*v4) {
                fclose((FILE *)*v4);
              }
              goto LABEL_29;
            }
            if (*(void *)(v31 + 24) != *(void *)(v31 + 32))
            {
              size_t v23 = SZGetLoggingHandle();
              if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
                goto LABEL_27;
              }
              *(_WORD *)buf = 0;
              __int16 v25 = "Z64: Archive must only span a single disk, but this disk does not have all of the central directory records.";
              goto LABEL_32;
            }
            unint64_t v54 = *(void *)(v31 + 40);
            unint64_t v55 = v4[1];
            if (v54 > v55)
            {
              int v56 = SZGetLoggingHandle();
              if (!os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
                goto LABEL_27;
              }
              uint64_t v57 = *(void *)(v4[10] + 40);
              uint64_t v58 = v4[1];
              *(_DWORD *)buf = 134218240;
              *(void *)v97 = v57;
              *(_WORD *)&v97[8] = 2048;
              *(void *)v98 = v58;
              __int16 v25 = "Z64: Central directory says it's %ld bytes long, which is longer than file length %ld";
              goto LABEL_102;
            }
            if (*(void *)(v31 + 48) + v54 > v55)
            {
              v69 = SZGetLoggingHandle();
              if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
              {
                uint64_t v70 = v4[10];
                uint64_t v72 = *(void *)(v70 + 40);
                uint64_t v71 = *(void *)(v70 + 48);
                uint64_t v73 = v4[1];
                *(_DWORD *)buf = 134218496;
                *(void *)v97 = v72;
                *(_WORD *)&v97[8] = 2048;
                *(void *)v98 = v71;
                *(_WORD *)&v98[8] = 2048;
                uint64_t v99 = v73;
                __int16 v25 = "Z64: Central directory length (%ld) + offset (%ld) > file length %ld";
                uint64_t v26 = v69;
                uint32_t v27 = 32;
                goto LABEL_33;
              }
              goto LABEL_27;
            }
          }
        }
        else
        {
          v4[2] = v18;
          uint64_t v32 = *((unsigned int *)v4 + 17);
          uint64_t v40 = *((unsigned int *)v4 + 18);
          v4[4] = v40;
          v4[5] = v32;
        }
        if (*((_WORD *)v4 + 30))
        {
          v43 = SZGetLoggingHandle();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            int v74 = *((unsigned __int16 *)v4 + 30);
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)v97 = v74;
            __int16 v25 = "Archive says it's disk number %hd; must be 0";
            goto LABEL_97;
          }
          goto LABEL_27;
        }
        if (*((_WORD *)v4 + 31))
        {
          v43 = SZGetLoggingHandle();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            int v75 = *((unsigned __int16 *)v4 + 31);
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)v97 = v75;
            __int16 v25 = "Archive says central directory starts on disk disk number %d; must be 0";
            goto LABEL_97;
          }
          goto LABEL_27;
        }
        if (*((unsigned __int16 *)v4 + 32) == v18)
        {
          unint64_t v76 = v4[1];
          if (v76 >= v32)
          {
            if (v32 + (unint64_t)v40 <= v76) {
              return v4;
            }
            v79 = SZGetLoggingHandle();
            if (!os_log_type_enabled(v79, OS_LOG_TYPE_ERROR)) {
              goto LABEL_27;
            }
            int v80 = *((_DWORD *)v4 + 17);
            int v81 = *((_DWORD *)v4 + 18);
            uint64_t v82 = v4[1];
            *(_DWORD *)buf = 67109632;
            *(_DWORD *)v97 = v80;
            *(_WORD *)&v97[4] = 1024;
            *(_DWORD *)&v97[6] = v81;
            *(_WORD *)v98 = 2048;
            *(void *)&v98[2] = v82;
            __int16 v25 = "Central directory length (%u) + offset (%u) > file length %ld";
            uint64_t v26 = v79;
            uint32_t v27 = 24;
            goto LABEL_33;
          }
          int v56 = SZGetLoggingHandle();
          if (!os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
            goto LABEL_27;
          }
          uint64_t v77 = *((unsigned int *)v4 + 17);
          uint64_t v78 = v4[1];
          *(_DWORD *)buf = 134218240;
          *(void *)v97 = v77;
          *(_WORD *)&v97[8] = 2048;
          *(void *)v98 = v78;
          __int16 v25 = "Central directory says it's %ld bytes long, which is longer than file length %ld";
LABEL_102:
          uint64_t v26 = v56;
          uint32_t v27 = 22;
          goto LABEL_33;
        }
        size_t v23 = SZGetLoggingHandle();
        if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          goto LABEL_27;
        }
        *(_WORD *)buf = 0;
        __int16 v25 = "Archive must only span a single disk, but this disk does not have all of the central directory records.";
LABEL_32:
        uint64_t v26 = v23;
        uint32_t v27 = 2;
LABEL_33:
        _os_log_error_impl(&dword_1DD5BF000, v26, OS_LOG_TYPE_ERROR, v25, buf, v27);
        goto LABEL_27;
      }
    }
    size_t v19 = (FILE *)*v4;
    if (fseeko((FILE *)*v4, -42, 2))
    {
      int v20 = SZGetLoggingHandle();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
LABEL_21:
        size_t v21 = 0;
        uint64_t v22 = 0;
LABEL_22:
        free(v22);
        free(v21);
        v15 = SZGetLoggingHandle();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          goto LABEL_26;
        }
        *(_WORD *)buf = 0;
        int v11 = "Failed to read Zip64 end records";
        goto LABEL_24;
      }
      uint64_t v48 = __error();
      v49 = strerror(*v48);
      *(_DWORD *)buf = 136315138;
      *(void *)v97 = v49;
      size_t v37 = "Failed to seek to zip64 end record locator: %s";
LABEL_63:
      _os_log_error_impl(&dword_1DD5BF000, v20, OS_LOG_TYPE_ERROR, v37, buf, 0xCu);
      goto LABEL_21;
    }
    __int16 v28 = (off_t *)malloc_type_calloc(1uLL, 0x14uLL, 0x1000040A86A77D5uLL);
    if (!v28)
    {
      int v20 = SZGetLoggingHandle();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        goto LABEL_21;
      }
      off_t v35 = __error();
      uint64_t v36 = strerror(*v35);
      *(_DWORD *)buf = 136315138;
      *(void *)v97 = v36;
      size_t v37 = "Failed to allocate zip64 end record locator: %s";
      goto LABEL_63;
    }
    uint64_t v22 = v28;
    size_t v29 = fread(v28, 1uLL, 0x14uLL, v19);
    if (v29 != 20)
    {
      size_t v38 = v29;
      v39 = SZGetLoggingHandle();
      if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        goto LABEL_46;
      }
      *(_DWORD *)buf = 134218240;
      *(void *)v97 = 20;
      *(_WORD *)&v97[8] = 2048;
      *(void *)v98 = v38;
      v47 = "Failed to read zip64 end record locator: expected to read %lu but actually read %lu";
LABEL_79:
      v60 = v39;
      uint32_t v61 = 22;
      goto LABEL_80;
    }
    if (*(_DWORD *)v22 != 117853008)
    {
      __int16 v30 = SZGetLoggingHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1DD5BF000, v30, OS_LOG_TYPE_ERROR, "Failed to locate zip64 end record locator; what we found doesn't have the right signature.",
          buf,
          2u);
      }
      goto LABEL_39;
    }
    if (*((_DWORD *)v22 + 1))
    {
      v45 = SZGetLoggingHandle();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        int v46 = *((_DWORD *)v22 + 1);
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v97 = v46;
        v47 = "Expected for end record to be on disk 0, but zip64 end record locator claimed disk %d";
LABEL_77:
        v60 = v45;
        uint32_t v61 = 8;
LABEL_80:
        _os_log_error_impl(&dword_1DD5BF000, v60, OS_LOG_TYPE_ERROR, v47, buf, v61);
        goto LABEL_46;
      }
      goto LABEL_46;
    }
    if (*((_DWORD *)v22 + 4) != 1)
    {
      v45 = SZGetLoggingHandle();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        int v59 = *((_DWORD *)v22 + 4);
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v97 = v59;
        v47 = "Expected total disks to be 1, but zip64 end record locator claimed %d disks";
        goto LABEL_77;
      }
LABEL_46:
      size_t v21 = 0;
      goto LABEL_22;
    }
    if (fseeko(v19, v22[1], 0))
    {
      v39 = SZGetLoggingHandle();
      if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        goto LABEL_46;
      }
      off_t v51 = v22[1];
      v52 = __error();
      v53 = strerror(*v52);
      *(_DWORD *)buf = 134218242;
      *(void *)v97 = v51;
      *(_WORD *)&v97[8] = 2080;
      *(void *)v98 = v53;
      v47 = "Failed to seek to zip64 end record at %lld: %s";
      goto LABEL_79;
    }
    __stream = v19;
    uint64_t v62 = malloc_type_calloc(1uLL, 0x38uLL, 0x100004021716A34uLL);
    if (v62)
    {
      size_t v21 = v62;
      size_t v63 = fread(v62, 1uLL, 0x38uLL, __stream);
      if (v63 != 56)
      {
        size_t v86 = v63;
        v87 = SZGetLoggingHandle();
        if (!os_log_type_enabled(v87, OS_LOG_TYPE_ERROR)) {
          goto LABEL_22;
        }
        *(_DWORD *)buf = 134218240;
        *(void *)v97 = 56;
        *(_WORD *)&v97[8] = 2048;
        *(void *)v98 = v86;
        v66 = "Failed to read zip64 end record: expected to read %lu but actually read %lu";
        v67 = v87;
        goto LABEL_113;
      }
      if (*v21 != 101075792)
      {
        v64 = SZGetLoggingHandle();
        if (!os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
          goto LABEL_22;
        }
        off_t v65 = v22[1];
        *(_DWORD *)buf = 134217984;
        *(void *)v97 = v65;
        v66 = "Failed to locate zip64 end record; what we found at offset %lld doesn't have the right signature.";
        v67 = v64;
        uint32_t v68 = 12;
LABEL_114:
        _os_log_error_impl(&dword_1DD5BF000, v67, OS_LOG_TYPE_ERROR, v66, buf, v68);
        goto LABEL_22;
      }
      uint64_t v88 = *(void *)(v21 + 1);
      uint64_t v89 = v88 + 12;
      if ((unint64_t)(v88 + 12) < 0x39)
      {
        if (v88 != 44)
        {
          v94 = SZGetLoggingHandle();
          if (!os_log_type_enabled(v94, OS_LOG_TYPE_ERROR)) {
            goto LABEL_22;
          }
          *(_DWORD *)buf = 134218240;
          *(void *)v97 = v89;
          *(_WORD *)&v97[8] = 2048;
          *(void *)v98 = 56;
          v66 = "Zip64 end record said it was %zu bytes; we expect at least %zu bytes";
LABEL_124:
          v67 = v94;
LABEL_113:
          uint32_t v68 = 22;
          goto LABEL_114;
        }
LABEL_121:
        v4[10] = v21;
        v4[11] = v22;
        uint64_t v22 = 0;
LABEL_39:
        free(v22);
        unsigned int v18 = *((unsigned __int16 *)v4 + 33);
        goto LABEL_40;
      }
      v90 = reallocf(v21, v88 + 12);
      if (v90)
      {
        size_t v21 = v90;
        uint64_t v91 = v88 - 44;
        size_t v92 = fread(v90 + 14, 1uLL, v88 - 44, __stream);
        if (v88 - 44 != v92)
        {
          size_t v93 = v92;
          v94 = SZGetLoggingHandle();
          if (!os_log_type_enabled(v94, OS_LOG_TYPE_ERROR)) {
            goto LABEL_22;
          }
          *(_DWORD *)buf = 134218240;
          *(void *)v97 = v91;
          *(_WORD *)&v97[8] = 2048;
          *(void *)v98 = v93;
          v66 = "Failed to read extensible data in zip64 end record: expected to read %lu but actually read %lu";
          goto LABEL_124;
        }
        goto LABEL_121;
      }
      v83 = SZGetLoggingHandle();
      if (!os_log_type_enabled(v83, OS_LOG_TYPE_ERROR)) {
        goto LABEL_46;
      }
      *(_DWORD *)buf = 134217984;
      *(void *)v97 = v88 + 12;
      v47 = "Failed to grow zip64 end record allocation to %zu bytes";
    }
    else
    {
      v83 = SZGetLoggingHandle();
      if (!os_log_type_enabled(v83, OS_LOG_TYPE_ERROR)) {
        goto LABEL_46;
      }
      v84 = __error();
      v85 = strerror(*v84);
      *(_DWORD *)buf = 136315138;
      *(void *)v97 = v85;
      v47 = "Failed to allocate zip64 end record: %s";
    }
    v60 = v83;
    uint32_t v61 = 12;
    goto LABEL_80;
  }
LABEL_29:
  free(v4);
  return 0;
}

void CloseZipFile(uint64_t a1)
{
  if (a1)
  {
    free(*(void **)(a1 + 80));
    free(*(void **)(a1 + 88));
    fclose(*(FILE **)a1);
    free((void *)a1);
  }
}

uint64_t GenericHashInit(uint64_t result, int a2)
{
  *(_DWORD *)(result + 212) = 0;
  *(_OWORD *)(result + 196) = 0u;
  *(_OWORD *)(result + 180) = 0u;
  *(_OWORD *)(result + 164) = 0u;
  *(_OWORD *)(result + 148) = 0u;
  *(_OWORD *)(result + 132) = 0u;
  *(_OWORD *)(result + 116) = 0u;
  *(_OWORD *)(result + 100) = 0u;
  *(_OWORD *)(result + 84) = 0u;
  *(_OWORD *)(result + 68) = 0u;
  *(_OWORD *)(result + 52) = 0u;
  *(_OWORD *)(result + 36) = 0u;
  *(_OWORD *)(result + 20) = 0u;
  *(_OWORD *)(result + 4) = 0u;
  *(_DWORD *)result = a2;
  switch(a2)
  {
    case 0:
      result = CC_MD5_Init((CC_MD5_CTX *)(result + 8));
      break;
    case 1:
      result = CC_SHA1_Init((CC_SHA1_CTX *)(result + 8));
      break;
    case 4:
      result = CC_SHA224_Init((CC_SHA256_CTX *)(result + 8));
      break;
    case 5:
      result = CC_SHA256_Init((CC_SHA256_CTX *)(result + 8));
      break;
    case 6:
      result = CC_SHA384_Init((CC_SHA512_CTX *)(result + 8));
      break;
    case 7:
      result = CC_SHA512_Init((CC_SHA512_CTX *)(result + 8));
      break;
    default:
      return result;
  }
  return result;
}

uint64_t GenericHashUpdate(uint64_t result, void *data, unint64_t a3)
{
  if (a3)
  {
    unint64_t v3 = a3;
    BOOL v5 = (_DWORD *)result;
    int v6 = (CC_MD5_CTX *)(result + 8);
    do
    {
      if (v3 >= 0xFFFFFFFF) {
        uint64_t v7 = 0xFFFFFFFFLL;
      }
      else {
        uint64_t v7 = v3;
      }
      switch(*v5)
      {
        case 0:
          result = CC_MD5_Update(v6, data, v7);
          break;
        case 1:
          result = CC_SHA1_Update((CC_SHA1_CTX *)v6, data, v7);
          break;
        case 4:
          result = CC_SHA224_Update((CC_SHA256_CTX *)v6, data, v7);
          break;
        case 5:
          result = CC_SHA256_Update((CC_SHA256_CTX *)v6, data, v7);
          break;
        case 6:
          result = CC_SHA384_Update((CC_SHA512_CTX *)v6, data, v7);
          break;
        case 7:
          result = CC_SHA512_Update((CC_SHA512_CTX *)v6, data, v7);
          break;
        default:
          break;
      }
      v3 -= v7;
    }
    while (v3);
  }
  return result;
}

unsigned __int8 *GenericHashFinal(unsigned __int8 *result, uint64_t a2)
{
  switch(*(_DWORD *)a2)
  {
    case 0:
      result = (unsigned __int8 *)CC_MD5_Final(result, (CC_MD5_CTX *)(a2 + 8));
      break;
    case 1:
      result = (unsigned __int8 *)CC_SHA1_Final(result, (CC_SHA1_CTX *)(a2 + 8));
      break;
    case 4:
      result = (unsigned __int8 *)CC_SHA224_Final(result, (CC_SHA256_CTX *)(a2 + 8));
      break;
    case 5:
      result = (unsigned __int8 *)CC_SHA256_Final(result, (CC_SHA256_CTX *)(a2 + 8));
      break;
    case 6:
      result = (unsigned __int8 *)CC_SHA384_Final(result, (CC_SHA512_CTX *)(a2 + 8));
      break;
    case 7:
      result = (unsigned __int8 *)CC_SHA512_Final(result, (CC_SHA512_CTX *)(a2 + 8));
      break;
    default:
      return result;
  }
  return result;
}

char *CreateLocalFileRecord(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 20) == -1 || *(_DWORD *)(a1 + 24) == -1) {
    __assert_rtn("CreateLocalFileRecord", "ZipStructure.c", 40, "UREAD(cdRecord->thirty_two_bit_compressed_size) < UINT32_MAX && UREAD(cdRecord->thirty_two_bit_uncompressed_size) < UINT32_MAX");
  }
  uint64_t v2 = (char *)malloc_type_calloc(1uLL, *(unsigned __int16 *)(a1 + 28) + 46, 0x73FD3DE5uLL);
  *(_DWORD *)uint64_t v2 = 67324752;
  *((_WORD *)v2 + 2) = *(_WORD *)(a1 + 6);
  *((_WORD *)v2 + 3) = *(_WORD *)(a1 + 8);
  *((_WORD *)v2 + 4) = *(_WORD *)(a1 + 10);
  *(_DWORD *)(v2 + 10) = *(_DWORD *)(a1 + 12);
  *(_DWORD *)(v2 + 14) = *(_DWORD *)(a1 + 16);
  *(_DWORD *)(v2 + 18) = *(_DWORD *)(a1 + 20);
  *(_DWORD *)(v2 + 22) = *(_DWORD *)(a1 + 24);
  size_t v3 = *(unsigned __int16 *)(a1 + 28);
  *(_DWORD *)(v2 + 26) = (unsigned __int16)v3;
  memcpy(v2 + 30, (const void *)(a1 + 46), v3);
  unint64_t v4 = *(unsigned __int16 *)(a1 + 30);
  if (v4 >= 0xC)
  {
    ExtraFieldWithSignature = GetExtraFieldWithSignature(a1 + 46 + *(unsigned __int16 *)(a1 + 28), v4, kInfoZipExtraFieldSignature);
    if (ExtraFieldWithSignature)
    {
      if (ExtraFieldWithSignature[1] >= 8u)
      {
        unsigned __int16 v6 = *ExtraFieldWithSignature;
        uint64_t v7 = &v2[v3];
        uint64_t v8 = *(void *)(ExtraFieldWithSignature + 2);
        *((_WORD *)v2 + 14) = 16;
        *((_WORD *)v7 + 15) = v6;
        *((_WORD *)v7 + 16) = 12;
        *(void *)(v7 + 34) = v8;
        *(_DWORD *)(v7 + 42) = 32834037;
      }
    }
  }
  return v2;
}

unsigned __int16 *GetInfoZipExtraFieldFromLF(uint64_t a1)
{
  if (!*(_WORD *)(a1 + 28)) {
    return 0;
  }
  result = GetExtraFieldWithSignature(a1 + *(unsigned __int16 *)(a1 + 26) + 30, *(unsigned __int16 *)(a1 + 28), kInfoZipExtraFieldSignature);
  if (result)
  {
    if (result[1] < 8u) {
      return 0;
    }
  }
  return result;
}

BOOL LocalFileRecordHasZip64ExtraField(uint64_t a1)
{
  return *(_WORD *)(a1 + 28)
      && ((ExtraFieldWithSignature = GetExtraFieldWithSignature(a1 + *(unsigned __int16 *)(a1 + 26) + 30, *(unsigned __int16 *)(a1 + 28), &kZip64ExtraFieldSignature)) == 0|| ExtraFieldWithSignature[1] >= 0x10u)&& ExtraFieldWithSignature != 0;
}

unsigned __int16 *GetZip64ExtraFieldDataFromLF(uint64_t a1, void *a2, void *a3)
{
  if (!*(_WORD *)(a1 + 28)) {
    return 0;
  }
  result = GetExtraFieldWithSignature(a1 + *(unsigned __int16 *)(a1 + 26) + 30, *(unsigned __int16 *)(a1 + 28), &kZip64ExtraFieldSignature);
  if (!result) {
    return result;
  }
  if (result[1] != 16) {
    return 0;
  }
  if (a2) {
    *a2 = *(void *)(result + 2);
  }
  if (a3) {
    *a3 = *(void *)(result + 6);
  }
  return (unsigned __int16 *)1;
}

uint64_t GetLFUncompressedSize(uint64_t a1)
{
  uint64_t v4 = 0;
  if (*(_DWORD *)(a1 + 18) == -1 || (unsigned int v2 = *(_DWORD *)(a1 + 22), v2 == -1))
  {
    if (GetZip64ExtraFieldDataFromLF(a1, &v4, 0)) {
      return v4;
    }
    return *(unsigned int *)(a1 + 22);
  }
  return v2;
}

_DWORD *CreateCDRecord(const char *a1, int a2, int a3, int a4)
{
  size_t v8 = strlen(a1);
  if (v8 >> 16) {
    return 0;
  }
  size_t v10 = v8;
  compression_status v9 = malloc_type_calloc(1uLL, v8 + 58, 0x370EF2B9uLL);
  *(void *)compression_status v9 = 0x14031E02014B50;
  time_t v11 = time(0);
  v9[3] = UNIX2DOSTime(v11);
  *((_WORD *)v9 + 14) = v10;
  *((_WORD *)v9 + 15) = 12;
  *(_DWORD *)((char *)v9 + 38) = (a2 << 16) | 0x4000;
  memcpy((char *)v9 + 46, a1, v10);
  int v12 = (_DWORD *)((char *)v9 + v10 + 46);
  *int v12 = 546901;
  v12[1] = a4;
  v12[2] = a3;
  return v9;
}

void ZipStreamAddStatisticsForCDRecord(uint64_t a1, int a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unint64_t v6 = *(void *)(a1 + 40);
  if (a3[17] < v6) {
    a3[17] = v6;
  }
  unint64_t v7 = *(void *)(a1 + 32);
  if (a3[18] < v7) {
    a3[18] = v7;
  }
  unint64_t v8 = a3[2] + v7;
  a3[1] += v6;
  a3[2] = v8;
  unint64_t v9 = (v6 + 4095) & 0xFFFFFFFFFFFFF000 | 0x800;
  if (*(unsigned char *)(a1 + 26)) {
    uint64_t v10 = 1024;
  }
  else {
    uint64_t v10 = v9;
  }
  time_t v11 = SZGetLoggingHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = *(void *)(a1 + 72);
    int v18 = 134218242;
    uint64_t v19 = v10;
    __int16 v20 = 2080;
    uint64_t v21 = v15;
    _os_log_debug_impl(&dword_1DD5BF000, v11, OS_LOG_TYPE_DEBUG, "Counting size %llu for %s", (uint8_t *)&v18, 0x16u);
  }
  *a3 += v10;
  ++a3[4];
  if (*(unsigned char *)(a1 + 26))
  {
    int v12 = a3 + 19;
LABEL_12:
    ++*v12;
    goto LABEL_16;
  }
  uint64_t v13 = 20;
  if ((*(_WORD *)(a1 + 24) & 0xF000) == 0xA000) {
    uint64_t v13 = 21;
  }
  ++a3[v13];
  if (!*(void *)(a1 + 40))
  {
    int v12 = a3 + 22;
    goto LABEL_12;
  }
LABEL_16:
  if (a2)
  {
    size_t v14 = SZGetLoggingHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v16 = *(void *)(a1 + 72);
      int v17 = *(unsigned __int16 *)(a1 + 24);
      int v18 = 136315394;
      uint64_t v19 = v16;
      __int16 v20 = 1024;
      LODWORD(v21) = v17;
      _os_log_debug_impl(&dword_1DD5BF000, v14, OS_LOG_TYPE_DEBUG, "File %s has non-standard mode %o", (uint8_t *)&v18, 0x12u);
    }
    ++a3[14];
  }
}

uint64_t ZipStreamWriteLocalFile(uint64_t a1, uint64_t *a2, void ***a3, Bytef *a4, int a5, unsigned int a6, unsigned int a7, uint64_t a8, uint64_t a9)
{
  uint64_t v219 = *MEMORY[0x1E4F143B8];
  size_t v14 = (Bytef *)malloc_type_malloc(0x20000uLL, 0x287FA4E0uLL);
  uint64_t v15 = *a3;
  uint64_t v16 = malloc_type_calloc(1uLL, 0x50uLL, 0x1010040BDAC2CBCuLL);
  _OWORD *v16 = *(_OWORD *)v15;
  long long v17 = *((_OWORD *)v15 + 4);
  long long v19 = *((_OWORD *)v15 + 1);
  long long v18 = *((_OWORD *)v15 + 2);
  v16[3] = *((_OWORD *)v15 + 3);
  v16[4] = v17;
  v16[1] = v19;
  v16[2] = v18;
  *((void *)v16 + 7) = strdup((const char *)v15[7]);
  __int16 v20 = malloc_type_malloc(*((unsigned __int16 *)v15 + 32), 0xE466B180uLL);
  *((void *)v16 + 9) = v20;
  memcpy(v20, v15[9], *((unsigned __int16 *)v15 + 32));
  uint64_t v21 = *a2;
  uint64_t v22 = (unsigned __int16 *)malloc_type_calloc(1uLL, 0x68uLL, 0x1010040E435E96EuLL);
  long long v24 = *(_OWORD *)(v21 + 16);
  long long v23 = *(_OWORD *)(v21 + 32);
  *(_OWORD *)uint64_t v22 = *(_OWORD *)v21;
  *((_OWORD *)v22 + 1) = v24;
  *((_OWORD *)v22 + 2) = v23;
  long long v26 = *(_OWORD *)(v21 + 64);
  long long v25 = *(_OWORD *)(v21 + 80);
  long long v27 = *(_OWORD *)(v21 + 48);
  *((void *)v22 + 12) = *(void *)(v21 + 96);
  *((_OWORD *)v22 + 4) = v26;
  *((_OWORD *)v22 + 5) = v25;
  *((_OWORD *)v22 + 3) = v27;
  *((void *)v22 + 9) = strdup(*(const char **)(v21 + 72));
  __int16 v28 = malloc_type_malloc(*(unsigned __int16 *)(v21 + 48), 0x1548507uLL);
  *((void *)v22 + 10) = v28;
  memcpy(v28, *(const void **)(v21 + 80), *(unsigned __int16 *)(v21 + 48));
  size_t v29 = malloc_type_malloc(*(unsigned __int16 *)(v21 + 88), 0xAD38FBFDuLL);
  *((void *)v22 + 12) = v29;
  memcpy(v29, *(const void **)(v21 + 96), *(unsigned __int16 *)(v21 + 88));
  unint64_t v207 = *((void *)v16 + 5);
  unint64_t v212 = *((void *)v16 + 6);
  int v205 = *((unsigned __int16 *)v16 + 2);
  int v213 = *((_DWORD *)v16 + 8);
  uLong v30 = crc32(0, 0, 0);
  uint64_t v203 = (*(uint64_t (**)(void))(*(void *)(a9 + 8) + 72))(*(void *)(*(void *)(a9 + 8) + 80));
  if (v203 < 0)
  {
    int v37 = *__error();
    size_t v38 = SZGetLoggingHandle();
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
LABEL_57:
      int v56 = 0;
      int v50 = 0;
      uint64_t v57 = 0;
      goto LABEL_201;
    }
    *(_DWORD *)v218 = 136315138;
    *(void *)&v218[4] = strerror(v37);
    v39 = "Failed to get offset before writing LF record: %s";
LABEL_169:
    _os_log_error_impl(&dword_1DD5BF000, v38, OS_LOG_TYPE_ERROR, v39, v218, 0xCu);
    goto LABEL_57;
  }
  v209 = a4;
  if (!a5)
  {
    if (v205 == 8 || v205 == 99 || v205 == 14)
    {
      if (*(_DWORD *)(a9 + 32) == 2)
      {
        a5 = 3;
      }
      else
      {
        a5 = 1;
        if (*(unsigned char *)(a9 + 45) && v207 > v212)
        {
          v45 = SZGetLoggingHandle();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v154 = *((void *)v22 + 9);
            *(_DWORD *)v218 = 136315394;
            *(void *)&v218[4] = v154;
            *(_WORD *)&v218[12] = 2048;
            *(void *)&v218[14] = v207 - v212;
            _os_log_debug_impl(&dword_1DD5BF000, v45, OS_LOG_TYPE_DEBUG, "%s is %llu bytes larger compressed than uncompressed; converting.",
              v218,
              0x16u);
          }
          int64x2_t v46 = vdupq_n_s64(1uLL);
          v46.i64[0] = v207 - v212;
          *(int64x2_t *)(a8 + 40) = vaddq_s64(v46, *(int64x2_t *)(a8 + 40));
          a5 = 2;
        }
      }
    }
    else
    {
      uint64_t v71 = (const char *)*((void *)v22 + 9);
      a5 = 2;
      if (strcmp(v71, "mimetype"))
      {
        if (!strcmp(v71, "META-INF/com.apple.FixedZipMetadata.bin")) {
          a5 = 2;
        }
        else {
          a5 = 3;
        }
      }
    }
  }
  if (v212) {
    int v31 = a5;
  }
  else {
    int v31 = 2;
  }
  int v32 = *(_DWORD *)(a9 + 32);
  if (v31 != 2 && v32 == 3) {
    int v31 = 4;
  }
  if (v32) {
    int v34 = v31;
  }
  else {
    int v34 = 2;
  }
  unsigned int v206 = v34 - 3;
  if ((v34 - 3) < 2)
  {
    *((_WORD *)v16 + 2) = *(_DWORD *)(a9 + 36);
    unint64_t v35 = v212;
    uint64_t v36 = a1;
  }
  else
  {
    unint64_t v35 = v207;
    uint64_t v36 = a1;
    if (v34 != 1)
    {
      if (v34 != 2) {
        __assert_rtn("ZipStreamWriteLocalFile", "ZipStream.c", 333, "false");
      }
      *((_WORD *)v16 + 2) = 0;
      *((void *)v16 + 5) = v212;
      unint64_t v35 = v212;
    }
  }
  int v40 = v22[12];
  if (*((unsigned char *)v22 + 26)) {
    unsigned int v41 = a7;
  }
  else {
    unsigned int v41 = a6;
  }
  uint64_t v42 = v209;
  if (v40 == v41)
  {
    int v197 = 0;
    if (!v35) {
      goto LABEL_35;
    }
  }
  else
  {
    *((_WORD *)v16 + 14) = v40;
    int v197 = 1;
    if (!v35)
    {
LABEL_35:
      int v199 = 0;
      *((_WORD *)v16 + 1) &= ~8u;
      v22[2] &= ~8u;
      goto LABEL_45;
    }
  }
  if (v213 && v206 > 1) {
    goto LABEL_35;
  }
  __int16 v43 = *((_WORD *)v16 + 1);
  if (*(unsigned char *)(a9 + 47))
  {
    *((_WORD *)v16 + 1) = v43 | 8;
    v22[2] |= 8u;
    int v44 = 1;
  }
  else
  {
    *((_WORD *)v16 + 1) = v43 & 0xFFF7;
    v22[2] &= ~8u;
    int v44 = 2;
  }
  int v199 = v44;
LABEL_45:
  int v200 = v34;
  uint64_t v47 = *(void *)(a9 + 8);
  uint64_t v48 = *(void (**)(void, void, void))(v47 + 24);
  unint64_t v210 = v35;
  if (v48)
  {
    v48(0, *((void *)v16 + 7), 0);
    uint64_t v47 = *(void *)(a9 + 8);
  }
  v49 = CreateAndWriteLocalFileRecord((uint64_t)v16, v47);
  if (!v49)
  {
    size_t v38 = SZGetLoggingHandle();
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      goto LABEL_57;
    }
    uint64_t v123 = *((void *)v22 + 9);
    *(_DWORD *)v218 = 136315138;
    *(void *)&v218[4] = v123;
    v39 = "Failed to write local file record for file %s to output file";
    goto LABEL_169;
  }
  int v50 = v49;
  uint64_t v193 = *((unsigned __int16 *)v49 + 14);
  unint64_t v51 = v210;
  uint64_t v194 = *((unsigned __int16 *)v49 + 13);
  if (!v210)
  {
    v189 = (void ***)a2;
    uint64_t v190 = a8;
    unint64_t v58 = 0;
    int v56 = 0;
    int v59 = 0;
    int v60 = v200;
    goto LABEL_59;
  }
  int v216 = 0;
  if (v209)
  {
    v52 = 0;
  }
  else
  {
    v52 = OpenLocalFile(v36, *a2, (char *)(*a3)[7], *((_WORD *)*a3 + 32), v200 == 1, &v216);
    if (v216)
    {
      uint64_t v62 = SZGetLoggingHandle();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        uint64_t v152 = *((void *)v22 + 9);
        *(_DWORD *)v218 = 136315138;
        *(void *)&v218[4] = v152;
        _os_log_error_impl(&dword_1DD5BF000, v62, OS_LOG_TYPE_ERROR, "Failed to open local file %s", v218, 0xCu);
      }
      int v56 = 0;
      int v59 = 0;
      goto LABEL_197;
    }
    unint64_t v51 = v210;
  }
  v185 = a3;
  stream = (uint64_t *)v52;
  if (v206 > 1)
  {
    v189 = (void ***)a2;
    uint64_t v190 = a8;
    v187 = v50;
    v188 = v22;
    int v56 = 0;
    uint32_t v61 = 0;
  }
  else
  {
    v53 = (compression_stream *)malloc_type_calloc(1uLL, 0x28uLL, 0x10D00405C4BD7A1uLL);
    int v54 = *(_DWORD *)(a9 + 36);
    switch(v54)
    {
      case 8:
        compression_algorithm v55 = COMPRESSION_ZLIB;
        break;
      case 14:
        compression_algorithm v55 = COMPRESSION_LZMA;
        break;
      case 99:
        compression_algorithm v55 = COMPRESSION_LZFSE;
        break;
      default:
        compression_algorithm v55 = 0;
        break;
    }
    uint32_t v61 = v53;
    compression_status v75 = compression_stream_init(v53, COMPRESSION_STREAM_ENCODE, v55);
    if (v75)
    {
      compression_status v76 = v75;
      uint64_t v77 = SZGetLoggingHandle();
      if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v218 = 67109120;
        *(_DWORD *)&v218[4] = v76;
        _os_log_error_impl(&dword_1DD5BF000, v77, OS_LOG_TYPE_ERROR, "Failed to initialize compression stream: %d", v218, 8u);
      }
      int v56 = 0;
      uint64_t v57 = 0;
      int v59 = v61;
      goto LABEL_155;
    }
    v189 = (void ***)a2;
    uint64_t v190 = a8;
    v187 = v50;
    v188 = v22;
    int v56 = (uint8_t *)malloc_type_malloc(0x20000uLL, 0x692F4A98uLL);
    unint64_t v51 = v210;
  }
  int v78 = 0;
  unint64_t v58 = 0;
  if (v209) {
    v79 = v209;
  }
  else {
    v79 = v14;
  }
  buf = v79;
  unint64_t v202 = 0;
  v214 = v56;
  v186 = v14;
  v215 = v61;
  while (1)
  {
    *(void *)v217 = 0;
    if (v42)
    {
      if (v51 - v202 >= 0x20000) {
        unint64_t v80 = 0x20000;
      }
      else {
        unint64_t v80 = v51 - v202;
      }
      if (v80 + v202 >= v51) {
        int v78 = 2;
      }
      unint64_t v195 = v80;
    }
    else
    {
      int LocalFileData = ReadLocalFileData(stream, buf, 0x20000uLL, (size_t *)v217);
      int v78 = LocalFileData;
      if ((LocalFileData & 5) != 0)
      {
        int v216 = LocalFileData;
        v151 = SZGetLoggingHandle();
        int v50 = v187;
        uint64_t v22 = v188;
        if (!os_log_type_enabled(v151, OS_LOG_TYPE_ERROR)) {
          goto LABEL_154;
        }
        *(_DWORD *)v218 = 67109120;
        *(_DWORD *)&v218[4] = v78;
        v131 = "ReadLocalFileData returned %d";
        v132 = v151;
        uint32_t v133 = 8;
        goto LABEL_180;
      }
      unint64_t v195 = 0;
      unint64_t v80 = *(void *)v217;
    }
    unint64_t v198 = v80;
    if (!v213 && v80)
    {
      uint64_t v82 = buf;
      do
      {
        if (v80 >= 0x7FFFFFFF) {
          uint64_t v83 = 0x7FFFFFFFLL;
        }
        else {
          uint64_t v83 = v80;
        }
        uLong v30 = crc32(v30, v82, v83);
        v82 += v83;
        v80 -= v83;
      }
      while (v80);
    }
    if (v198)
    {
      int v192 = v78;
      v202 += v198;
      uint64_t v84 = *(void *)(a9 + 8);
      int v56 = v214;
      v85 = v215;
      if (v215)
      {
        unint64_t v86 = v198;
        v87 = buf;
LABEL_122:
        uint64_t v88 = 0x7FFFFFFFFFFFFFFFLL;
        if (v86 < 0x7FFFFFFFFFFFFFFFLL) {
          uint64_t v88 = v86;
        }
        v85->src_ptr = v87;
        v85->size_t src_size = v88;
        uint64_t v191 = v88;
        while (1)
        {
          v85->dst_ptr = v56;
          v85->size_t dst_size = 0x20000;
          uint64_t v89 = SZGetLoggingHandle();
          if (os_log_type_enabled(v89, OS_LOG_TYPE_DEBUG))
          {
            src_ptr = v85->src_ptr;
            size_t src_size = v85->src_size;
            dst_ptr = v85->dst_ptr;
            size_t dst_size = v85->dst_size;
            *(_DWORD *)v218 = 134218752;
            *(void *)&v218[4] = src_ptr;
            *(_WORD *)&v218[12] = 2048;
            *(void *)&v218[14] = src_size;
            *(_WORD *)&v218[22] = 2048;
            *(void *)&v218[24] = dst_ptr;
            *(_WORD *)&v218[32] = 2048;
            *(void *)&v218[34] = dst_size;
            _os_log_debug_impl(&dword_1DD5BF000, v89, OS_LOG_TYPE_DEBUG, "Calling compression_stream_process with src_ptr: %p, src_size: %zu, dst_ptr: %p, dst_size: %zu", v218, 0x2Au);
          }
          compression_status v90 = compression_stream_process(v85, 0);
          if (v90)
          {
            compression_status v106 = v90;
            int v216 = v192;
            v107 = SZGetLoggingHandle();
            size_t v14 = v186;
            if (!os_log_type_enabled(v107, OS_LOG_TYPE_ERROR)) {
              goto LABEL_153;
            }
            *(_DWORD *)v218 = 67109120;
            *(_DWORD *)&v218[4] = v106;
            v108 = "compression_stream_process returned error %d";
            v109 = v107;
            uint32_t v110 = 8;
            goto LABEL_206;
          }
          uint64_t v91 = SZGetLoggingHandle();
          if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
          {
            v98 = v215->src_ptr;
            size_t v99 = v215->src_size;
            uint64_t v100 = v215->dst_ptr;
            size_t v101 = v215->dst_size;
            *(void *)v218 = 67110144;
            *(_WORD *)&v218[8] = 2048;
            *(void *)&v218[10] = v98;
            *(_WORD *)&v218[18] = 2048;
            *(void *)&v218[20] = v99;
            *(_WORD *)&v218[28] = 2048;
            *(void *)&v218[30] = v100;
            *(_WORD *)&v218[38] = 2048;
            *(void *)&v218[40] = v101;
            _os_log_debug_impl(&dword_1DD5BF000, v91, OS_LOG_TYPE_DEBUG, "After process ret %d: src_ptr: %p, src_size: %zu, dst_ptr: %p, dst_size: %zu", v218, 0x30u);
          }
          v85 = v215;
          size_t v92 = v215->dst_size;
          size_t v93 = 0x20000 - v92;
          if (v92 == 0x20000)
          {
            v58 += v93;
            int v56 = v214;
LABEL_135:
            v87 += v191;
            v86 -= v191;
            if (v86) {
              goto LABEL_122;
            }
            size_t v14 = v186;
            uint64_t v42 = v209;
            goto LABEL_140;
          }
          if (v93 != (*(uint64_t (**)(void, uint8_t *, size_t))(v84 + 48))(*(void *)(v84 + 80), v214, v93))break; {
          v85 = v215;
          }
          v58 += v93;
          int v56 = v214;
          if (v215->dst_size) {
            goto LABEL_135;
          }
        }
        int v216 = v192;
        int v111 = *__error();
        v112 = SZGetLoggingHandle();
        size_t v14 = v186;
        if (!os_log_type_enabled(v112, OS_LOG_TYPE_ERROR)) {
          goto LABEL_153;
        }
        v153 = strerror(v111);
        *(_DWORD *)v218 = 136315138;
        *(void *)&v218[4] = v153;
        v108 = "fwrite failed to write out entire compressed buffer: %s";
        goto LABEL_205;
      }
      uint64_t v42 = v209;
      if ((*(uint64_t (**)(void, Bytef *, unint64_t))(v84 + 48))(*(void *)(v84 + 80), buf, v198) != v198)
      {
        int v216 = v192;
        int v155 = *__error();
        v112 = SZGetLoggingHandle();
        if (!os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
        {
LABEL_153:
          v113 = SZGetLoggingHandle();
          int v50 = v187;
          uint64_t v22 = v188;
          int v56 = v214;
          if (!os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
          {
LABEL_154:
            uint64_t v57 = 0;
            int v59 = v215;
            goto LABEL_155;
          }
          *(_DWORD *)v218 = 134217984;
          *(void *)&v218[4] = v198;
          v131 = "Failed to write %ld bytes of local file data to output file";
          goto LABEL_179;
        }
        v156 = strerror(v155);
        *(_DWORD *)v218 = 136315138;
        *(void *)&v218[4] = v156;
        v108 = "fwrite failed to write out entire buffer: %s";
LABEL_205:
        v109 = v112;
        uint32_t v110 = 12;
LABEL_206:
        _os_log_error_impl(&dword_1DD5BF000, v109, OS_LOG_TYPE_ERROR, v108, v218, v110);
        goto LABEL_153;
      }
      v58 += v198;
LABEL_140:
      int v78 = v192;
    }
    else
    {
      int v56 = v214;
      uint64_t v42 = v209;
    }
    uint64_t v102 = *(void *)(a9 + 8);
    v103 = *(void (**)(uint64_t, void, unint64_t, unint64_t, void))(v102 + 24);
    unint64_t v51 = v210;
    if (v103)
    {
      v103(1, *((void *)v16 + 7), v202, v210, *(void *)(v102 + 32));
      unint64_t v51 = v210;
    }
    v104 = v215;
    if (v78 == 2) {
      break;
    }
    buf += v195;
    if (v51 <= v202)
    {
      int v216 = v78;
      v105 = SZGetLoggingHandle();
      if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v218 = 67109120;
        *(_DWORD *)&v218[4] = v78;
        _os_log_error_impl(&dword_1DD5BF000, v105, OS_LOG_TYPE_ERROR, "Consumed all data to copy without getting end of data signal; got status: %d",
          v218,
          8u);
      }
      uint64_t v57 = 0;
      int v50 = v187;
      goto LABEL_148;
    }
  }
  int v216 = 2;
  unint64_t v134 = v51 - v202;
  int v50 = v187;
  uint64_t v22 = v188;
  if (v51 != v202)
  {
    v113 = SZGetLoggingHandle();
    if (!os_log_type_enabled(v113, OS_LOG_TYPE_ERROR)) {
      goto LABEL_154;
    }
    *(_DWORD *)v218 = 134217984;
    *(void *)&v218[4] = v134;
    v131 = "Breaking read/write loop with %llu bytes remaining";
LABEL_179:
    v132 = v113;
    uint32_t v133 = 12;
LABEL_180:
    _os_log_error_impl(&dword_1DD5BF000, v132, OS_LOG_TYPE_ERROR, v131, v218, v133);
    goto LABEL_154;
  }
  if (!v215)
  {
    a3 = v185;
LABEL_214:
    int v60 = v200;
    if (stream)
    {
      int v157 = CloseLocalFile((compression_stream *)stream);
      int v60 = v200;
      if (v157)
      {
        int v158 = v157;
        v159 = SZGetLoggingHandle();
        if (!os_log_type_enabled(v159, OS_LOG_TYPE_ERROR)) {
          goto LABEL_217;
        }
        uint64_t v172 = *((void *)v22 + 9);
        *(_DWORD *)v218 = 136315394;
        *(void *)&v218[4] = v172;
        *(_WORD *)&v218[12] = 1024;
        *(_DWORD *)&v218[14] = v158;
        v173 = "Failed to close local file %s: %d";
        v174 = v159;
        uint32_t v175 = 18;
        goto LABEL_248;
      }
    }
    int v56 = v214;
    int v59 = v215;
    if (v60 != 4 && v215 && !*(unsigned char *)(a9 + 47))
    {
      if ((v205 == 8 || v205 == 99 || v205 == 14) && v58 > v207 && v207 < v212 && *(_DWORD *)(a9 + 36) == v205)
      {
        v160 = SZGetLoggingHandle();
        if (os_log_type_enabled(v160, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v181 = *((void *)v22 + 9);
          *(_DWORD *)v218 = 136315394;
          *(void *)&v218[4] = v181;
          *(_WORD *)&v218[12] = 2048;
          *(void *)&v218[14] = v58 - v207;
          _os_log_debug_impl(&dword_1DD5BF000, v160, OS_LOG_TYPE_DEBUG, "%s is %llu bytes larger when we compressed it. Using original compressed data.", v218, 0x16u);
        }
        uint64_t v161 = 1;
LABEL_256:
        if (v203 == (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a9 + 8) + 64))(*(void *)(*(void *)(a9 + 8) + 80), v203, 0))
        {
          uint64_t v57 = ZipStreamWriteLocalFile(a1, v189, a3, v209, v161, a6, a7, v190, a9);
          v52 = 0;
LABEL_218:
          int v56 = v214;
          int v59 = v215;
          if (!v215) {
            goto LABEL_199;
          }
          goto LABEL_198;
        }
        int v178 = *__error();
        v179 = SZGetLoggingHandle();
        if (!os_log_type_enabled(v179, OS_LOG_TYPE_ERROR))
        {
LABEL_217:
          v52 = 0;
          uint64_t v57 = 0;
          goto LABEL_218;
        }
        v180 = strerror(v178);
        *(_DWORD *)v218 = 136315138;
        *(void *)&v218[4] = v180;
        v173 = "Failed to seek back to start of local file header: %s";
        v174 = v179;
        uint32_t v175 = 12;
LABEL_248:
        _os_log_error_impl(&dword_1DD5BF000, v174, OS_LOG_TYPE_ERROR, v173, v218, v175);
        goto LABEL_217;
      }
      unint64_t v167 = v58 - v212;
      if (v58 >= v212)
      {
        if (v205 == 8 || v205 == 99 || v205 == 14)
        {
          int v168 = *(_DWORD *)(a9 + 36);
          v169 = SZGetLoggingHandle();
          BOOL v170 = os_log_type_enabled(v169, OS_LOG_TYPE_DEBUG);
          if (v168 == v205)
          {
            if (v170)
            {
              uint64_t v182 = *((void *)v22 + 9);
              *(_DWORD *)v218 = 136315394;
              *(void *)&v218[4] = v182;
              *(_WORD *)&v218[12] = 2048;
              *(void *)&v218[14] = v58 - v212;
              _os_log_debug_impl(&dword_1DD5BF000, v169, OS_LOG_TYPE_DEBUG, "%s is %llu bytes larger compressed than uncompressed; converting.",
                v218,
                0x16u);
            }
            int64x2_t v171 = vdupq_n_s64(1uLL);
            v171.i64[0] = v58 - v212;
            *(int64x2_t *)(v190 + 40) = vaddq_s64(v171, *(int64x2_t *)(v190 + 40));
          }
          else
          {
            if (v170)
            {
              uint64_t v183 = *((void *)v22 + 9);
              *(_DWORD *)v218 = 136315650;
              *(void *)&v218[4] = v183;
              *(_WORD *)&v218[12] = 2048;
              *(void *)&v218[14] = v58 - v207;
              *(_WORD *)&v218[22] = 2048;
              *(void *)&v218[24] = v58 - v212;
              _os_log_debug_impl(&dword_1DD5BF000, v169, OS_LOG_TYPE_DEBUG, "%s is %llu bytes larger with the new compression method and is %llu bytes larger than uncompressed; stor"
                "ing uncompressed.",
                v218,
                0x20u);
            }
            ++*(void *)(v190 + 56);
          }
          uint64_t v161 = 2;
        }
        else
        {
          v177 = SZGetLoggingHandle();
          uint64_t v161 = 2;
          if (os_log_type_enabled(v177, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v184 = *((void *)v22 + 9);
            *(_DWORD *)v218 = 136315394;
            *(void *)&v218[4] = v184;
            *(_WORD *)&v218[12] = 2048;
            *(void *)&v218[14] = v167;
            _os_log_debug_impl(&dword_1DD5BF000, v177, OS_LOG_TYPE_DEBUG, "%s was not compressed before, and was %llu bytes larger when compressed. Storing uncompressed.", v218, 0x16u);
          }
        }
        goto LABEL_256;
      }
    }
LABEL_59:
    *((void *)v22 + 8) = v203;
    if (v206 < 2)
    {
      if (!v59) {
        __assert_rtn("ZipStreamWriteLocalFile", "ZipStream.c", 617, "cmpStreamPtr");
      }
      v22[3] = *((_WORD *)v16 + 2);
      *((void *)v22 + 4) = v58;
    }
    else
    {
      if (v60 == 1)
      {
LABEL_72:
        if (!v199) {
          goto LABEL_160;
        }
        if (v199 == 1)
        {
          *(void *)&v218[12] = 0;
          *(void *)&v218[4] = 0;
          BOOL HasZip64ExtraField = LocalFileRecordHasZip64ExtraField((uint64_t)v50);
          int v73 = *((_DWORD *)v22 + 7);
          if (HasZip64ExtraField)
          {
            *(void *)&v218[4] = *((void *)v22 + 4);
            *(void *)&v218[12] = *((void *)v22 + 5);
            uint64_t v74 = 20;
          }
          else
          {
            uint64_t v114 = *((void *)v22 + 5);
            *(_DWORD *)&v218[4] = *((void *)v22 + 4);
            *(_DWORD *)&v218[8] = v114;
            uint64_t v74 = 12;
          }
          *(_DWORD *)v218 = v73;
          *__error() = 0;
          uint64_t v115 = (*(uint64_t (**)(void, const char *, uint64_t))(*(void *)(a9 + 8) + 48))(*(void *)(*(void *)(a9 + 8) + 80), "PK\a\b", 4);
          v116 = __error();
          if (v115 == 4)
          {
            int *v116 = 0;
            if (v74 == (*(uint64_t (**)(void, unsigned char *, uint64_t))(*(void *)(a9 + 8) + 48))(*(void *)(*(void *)(a9 + 8) + 80), v218, v74))goto LABEL_160; {
            int v127 = *__error();
            }
            uint32_t v68 = SZGetLoggingHandle();
            if (!os_log_type_enabled(v68, OS_LOG_TYPE_ERROR)) {
              goto LABEL_196;
            }
            v128 = strerror(v127);
            *(_DWORD *)v217 = 136315138;
            *(void *)&v217[4] = v128;
            uint64_t v70 = "Failed to write data descriptor: %s";
          }
          else
          {
            int v119 = *v116;
            uint32_t v68 = SZGetLoggingHandle();
            if (!os_log_type_enabled(v68, OS_LOG_TYPE_ERROR)) {
              goto LABEL_196;
            }
            v120 = strerror(v119);
            *(_DWORD *)v217 = 136315138;
            *(void *)&v217[4] = v120;
            uint64_t v70 = "Failed to write data descriptor signature: %s";
          }
          v126 = v217;
          goto LABEL_176;
        }
        if ((*((_WORD *)v16 + 1) & 8) != 0) {
          __assert_rtn("ZipStreamWriteLocalFile", "ZipStream.c", 638, "!(newLFRecord->flags & ZIP_FLAGS_BIT_EXPECT_DATA_DESCRIPTOR)");
        }
        *((void *)v16 + 5) = v58;
        if (!v213) {
          *((_DWORD *)v16 + 8) = v30;
        }
        uint64_t v63 = (*(uint64_t (**)(void))(*(void *)(a9 + 8) + 72))(*(void *)(*(void *)(a9 + 8) + 80));
        if (v63 < 0)
        {
          int v121 = *__error();
          uint32_t v68 = SZGetLoggingHandle();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
          {
            v122 = strerror(v121);
            *(_DWORD *)v218 = 136315138;
            *(void *)&v218[4] = v122;
            uint64_t v70 = "Failed to get current offset to restore after writing local file record: %s";
            goto LABEL_172;
          }
LABEL_196:
          v52 = 0;
          goto LABEL_197;
        }
        uint64_t v64 = v63;
        if (v203 != (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a9 + 8) + 64))(*(void *)(*(void *)(a9 + 8) + 80), v203, 0))
        {
          int v124 = *__error();
          uint32_t v68 = SZGetLoggingHandle();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
          {
            v125 = strerror(v124);
            *(_DWORD *)v218 = 136315138;
            *(void *)&v218[4] = v125;
            uint64_t v70 = "Failed to seek to local compressed size offset in local file header: %s";
            goto LABEL_172;
          }
          goto LABEL_196;
        }
        free(v50);
        off_t v65 = CreateAndWriteLocalFileRecord((uint64_t)v16, *(void *)(a9 + 8));
        if (v65)
        {
          int v50 = v65;
          unint64_t v66 = *((unsigned __int16 *)v65 + 13) + (unint64_t)*((unsigned __int16 *)v65 + 14) + 30;
          if (v194 + v193 + 30 != v66)
          {
            v149 = SZGetLoggingHandle();
            if (!os_log_type_enabled(v149, OS_LOG_TYPE_ERROR)) {
              goto LABEL_196;
            }
            uint64_t v166 = *((void *)v22 + 9);
            *(_DWORD *)v218 = 136315650;
            *(void *)&v218[4] = v166;
            *(_WORD *)&v218[12] = 2048;
            *(void *)&v218[14] = v194 + v193 + 30;
            *(_WORD *)&v218[22] = 2048;
            *(void *)&v218[24] = v66;
            uint64_t v70 = "LocalFileHeader for %s changed in size when we updated it! Originally wrote %zu bytes; it's now %zu bytes.";
            v126 = v218;
            v129 = v149;
            uint32_t v130 = 32;
            goto LABEL_177;
          }
          if (v64 != (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a9 + 8) + 64))(*(void *)(*(void *)(a9 + 8) + 80), v64, 0))
          {
            int v67 = *__error();
            uint32_t v68 = SZGetLoggingHandle();
            if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
            {
              v69 = strerror(v67);
              *(_DWORD *)v218 = 136315138;
              *(void *)&v218[4] = v69;
              uint64_t v70 = "Failed to seek to end of compressed data offset in local file header: %s";
LABEL_172:
              v126 = v218;
LABEL_176:
              v129 = v68;
              uint32_t v130 = 12;
LABEL_177:
              _os_log_error_impl(&dword_1DD5BF000, v129, OS_LOG_TYPE_ERROR, v70, v126, v130);
              goto LABEL_196;
            }
            goto LABEL_196;
          }
LABEL_160:
          ZipStreamAddStatisticsForCDRecord((uint64_t)v22, v197, (void *)v190);
          uint64_t v117 = *(void *)(a9 + 8);
          v118 = *(void (**)(uint64_t, void, void, unint64_t, void))(v117 + 24);
          if (v118) {
            v118(2, *((void *)v16 + 7), *((void *)v22 + 5), v210, *(void *)(v117 + 32));
          }
          DestroyMutableCDRecord(*v189);
          *v189 = (void **)v22;
          DestroyMutableLocalFileRecord(*a3);
          v52 = 0;
          uint64_t v22 = 0;
          *a3 = (void **)v16;
          uint64_t v57 = 1;
          uint64_t v16 = 0;
          if (!v59) {
            goto LABEL_199;
          }
LABEL_198:
          compression_stream_destroy(v59);
          free(v59);
          goto LABEL_199;
        }
        v148 = SZGetLoggingHandle();
        if (os_log_type_enabled(v148, OS_LOG_TYPE_ERROR))
        {
          uint64_t v165 = *((void *)v22 + 9);
          *(_DWORD *)v218 = 136315138;
          *(void *)&v218[4] = v165;
          _os_log_error_impl(&dword_1DD5BF000, v148, OS_LOG_TYPE_ERROR, "Failed to write local file record for file %s to output file", v218, 0xCu);
        }
        v52 = 0;
        int v50 = 0;
LABEL_197:
        uint64_t v57 = 0;
        if (!v59) {
          goto LABEL_199;
        }
        goto LABEL_198;
      }
      if (v60 != 2) {
        __assert_rtn("ZipStreamWriteLocalFile", "ZipStream.c", 627, "false");
      }
      v22[3] = 0;
      *((void *)v22 + 4) = *((void *)v22 + 5);
    }
    if (!v213) {
      *((_DWORD *)v22 + 7) = v30;
    }
    goto LABEL_72;
  }
  do
  {
    v104->dst_ptr = v56;
    v104->size_t dst_size = 0x20000;
    v135 = SZGetLoggingHandle();
    if (os_log_type_enabled(v135, OS_LOG_TYPE_DEBUG))
    {
      v140 = v104->src_ptr;
      size_t v141 = v104->src_size;
      v142 = v104->dst_ptr;
      size_t v143 = v104->dst_size;
      *(_DWORD *)v218 = 134218752;
      *(void *)&v218[4] = v140;
      *(_WORD *)&v218[12] = 2048;
      *(void *)&v218[14] = v141;
      *(_WORD *)&v218[22] = 2048;
      *(void *)&v218[24] = v142;
      *(_WORD *)&v218[32] = 2048;
      *(void *)&v218[34] = v143;
      _os_log_debug_impl(&dword_1DD5BF000, v135, OS_LOG_TYPE_DEBUG, "Calling compression_stream_process with src_ptr: %p, src_size: %zu, dst_ptr: %p, dst_size: %zu", v218, 0x2Au);
    }
    compression_status v136 = compression_stream_process(v104, 1);
    v137 = SZGetLoggingHandle();
    if (os_log_type_enabled(v137, OS_LOG_TYPE_DEBUG))
    {
      v144 = v104->src_ptr;
      size_t v145 = v104->src_size;
      v146 = v104->dst_ptr;
      size_t v147 = v104->dst_size;
      *(_DWORD *)v218 = 67110144;
      *(_DWORD *)&v218[4] = v136;
      *(_WORD *)&v218[8] = 2048;
      *(void *)&v218[10] = v144;
      *(_WORD *)&v218[18] = 2048;
      *(void *)&v218[20] = v145;
      *(_WORD *)&v218[28] = 2048;
      *(void *)&v218[30] = v146;
      *(_WORD *)&v218[38] = 2048;
      *(void *)&v218[40] = v147;
      _os_log_debug_impl(&dword_1DD5BF000, v137, OS_LOG_TYPE_DEBUG, "After process ret %d: src_ptr: %p, src_size: %zu, dst_ptr: %p, dst_size: %zu", v218, 0x30u);
    }
    size_t v138 = v104->dst_size;
    if (!(v138 >> 17))
    {
      size_t v139 = 0x20000 - v138;
      *__error() = 0;
      if (v139 != (*(uint64_t (**)(void, uint8_t *, size_t))(*(void *)(a9 + 8) + 48))(*(void *)(*(void *)(a9 + 8) + 80), v214, v139))
      {
        int v163 = *__error();
        v164 = SZGetLoggingHandle();
        if (os_log_type_enabled(v164, OS_LOG_TYPE_ERROR))
        {
          v176 = strerror(v163);
          *(_DWORD *)v218 = 136315138;
          *(void *)&v218[4] = v176;
          _os_log_error_impl(&dword_1DD5BF000, v164, OS_LOG_TYPE_ERROR, "Failed to write final compressed data: %s", v218, 0xCu);
        }
        uint64_t v57 = 0;
        size_t v14 = v186;
        int v50 = v187;
        int v56 = v214;
        int v59 = v215;
        goto LABEL_149;
      }
      v58 += v139;
      v104 = v215;
    }
    int v56 = v214;
  }
  while (v136 == COMPRESSION_STATUS_OK);
  a3 = v185;
  if (v136 == COMPRESSION_STATUS_END)
  {
    size_t v14 = v186;
    int v50 = v187;
    uint64_t v22 = v188;
    goto LABEL_214;
  }
  v162 = SZGetLoggingHandle();
  int v50 = v187;
  if (os_log_type_enabled(v162, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v218 = 67109120;
    *(_DWORD *)&v218[4] = v136;
    _os_log_error_impl(&dword_1DD5BF000, v162, OS_LOG_TYPE_ERROR, "compression_stream_process with finalize did not return compression_status_end: %d", v218, 8u);
  }
  uint64_t v57 = 0;
  size_t v14 = v186;
LABEL_148:
  int v59 = v215;
LABEL_149:
  uint64_t v22 = v188;
LABEL_155:
  v52 = (unsigned __int16 *)stream;
  if (v59) {
    goto LABEL_198;
  }
LABEL_199:
  if (v52) {
    CloseLocalFile((compression_stream *)v52);
  }
LABEL_201:
  DestroyMutableCDRecord((void **)v22);
  DestroyMutableLocalFileRecord((void **)v16);
  free(v50);
  free(v56);
  free(v14);
  return v57;
}

BOOL ZipStreamConcoctStreamData(uint64_t a1, uint64_t a2, __int16 a3, __int16 a4, uint64_t a5, void *a6, void *a7, void *a8)
{
  uint64_t v39 = a2;
  uint64_t valuePtr = a1;
  __int16 v38 = a3;
  __int16 v37 = a4;
  int v12 = time(0);
  int v13 = time(0);
  CDRecord = CreateCDRecord("META-INF/com.apple.ZipMetadata.plist", 33188, v12, v13);
  CFAllocatorRef v15 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFNumberRef v17 = CFNumberCreate(v15, kCFNumberSInt64Type, &valuePtr);
  CFDictionaryAddValue(Mutable, @"RecordCount", v17);
  CFRelease(v17);
  CFNumberRef v18 = CFNumberCreate(v15, kCFNumberSInt64Type, &v39);
  CFDictionaryAddValue(Mutable, @"TotalUncompressedBytes", v18);
  CFRelease(v18);
  int v36 = 2;
  CFNumberRef v19 = CFNumberCreate(v15, kCFNumberIntType, &v36);
  CFDictionaryAddValue(Mutable, @"Version", v19);
  CFRelease(v19);
  CFNumberRef v20 = CFNumberCreate(v15, kCFNumberSInt16Type, &v38);
  CFDictionarySetValue(Mutable, @"StandardFilePerms", v20);
  CFRelease(v20);
  CFNumberRef v21 = CFNumberCreate(v15, kCFNumberSInt16Type, &v37);
  CFDictionarySetValue(Mutable, @"StandardDirectoryPerms", v21);
  CFRelease(v21);
  uint64_t v22 = *(const void **)(a5 + 16);
  if (v22) {
    CFDictionarySetValue(Mutable, @"CreatorToolCommandLine", v22);
  }
  long long v23 = *(const void **)(a5 + 24);
  if (v23) {
    CFDictionarySetValue(Mutable, @"CreatorToolUUID", v23);
  }
  CFDataRef Data = CFPropertyListCreateData(v15, Mutable, kCFPropertyListBinaryFormat_v1_0, 0, 0);
  CFDataRef v25 = Data;
  if (Data)
  {
    size_t Length = CFDataGetLength(Data);
    if (Length >= 0xFFFFFFFF) {
      __assert_rtn("ZipStreamConcoctStreamData", "ZipStream.c", 807, "dataLength < UINT32_MAX");
    }
    uInt v27 = Length;
    __int16 v28 = malloc_type_malloc(Length, 0x724C93EBuLL);
    BytePtr = CFDataGetBytePtr(v25);
    size_t v30 = CFDataGetLength(v25);
    memcpy(v28, BytePtr, v30);
    CFRelease(v25);
    *((_WORD *)CDRecord + 5) = 0;
    CDRecord[5] = v27;
    CDRecord[6] = v27;
    uLong v31 = crc32(0, 0, 0);
    CDRecord[4] = crc32(v31, (const Bytef *)v28, v27);
    *a6 = CreateMutableCDRecord((uint64_t)CDRecord);
    LocalFileRecord = CreateLocalFileRecord((uint64_t)CDRecord);
    *a7 = CreateMutableLocalFileRecord((uint64_t)LocalFileRecord);
    free(CDRecord);
    free(LocalFileRecord);
    *a8 = v28;
  }
  else
  {
    int v33 = SZGetLoggingHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)unint64_t v35 = 0;
      _os_log_error_impl(&dword_1DD5BF000, v33, OS_LOG_TYPE_ERROR, "Failed to serialize stream data", v35, 2u);
    }
    free(CDRecord);
  }
  CFRelease(Mutable);
  return v25 != 0;
}

BOOL ZipStreamConcoctFixedStreamData(uint64_t a1, void *a2, void *a3, const Bytef **a4)
{
  int v8 = time(0);
  int v9 = time(0);
  CDRecord = CreateCDRecord("META-INF/com.apple.FixedZipMetadata.bin", 33188, v8, v9);
  size_t v11 = gHashDigestSizes[*(unsigned __int8 *)(a1 + 44)];
  int v12 = v11 + 7;
  int v13 = (char *)malloc_type_malloc(v11 + 7, 0x49817E58uLL);
  size_t v14 = (const Bytef *)v13;
  if (v13)
  {
    *(_DWORD *)int v13 = 2017879117;
    v13[4] = *(unsigned char *)(a1 + 44) + 1;
    *(_WORD *)(v13 + 5) = v11;
    bzero(v13 + 7, v11);
    *((_WORD *)CDRecord + 5) = 0;
    CDRecord[5] = v12;
    CDRecord[6] = v12;
    uLong v15 = crc32(0, 0, 0);
    CDRecord[4] = crc32(v15, v14, (int)v11 + 7);
    *a2 = CreateMutableCDRecord((uint64_t)CDRecord);
    LocalFileRecord = CreateLocalFileRecord((uint64_t)CDRecord);
    *a3 = CreateMutableLocalFileRecord((uint64_t)LocalFileRecord);
    free(LocalFileRecord);
    *a4 = v14;
  }
  free(CDRecord);
  return v14 != 0;
}

uint64_t ZipStreamShouldOrderFileEarly(const char *a1, unsigned char *a2)
{
  *a2 = 0;
  if (!strncmp(a1, "com.apple.deltainstallcommands.", 0x1FuLL)) {
    return 1;
  }
  if (!strncmp(a1, "Payload/", 8uLL))
  {
    if (strcmp(a1, "Payload/"))
    {
      BOOL v5 = strdup(a1 + 8);
      unint64_t v6 = strchr(v5, 47);
      if (v6)
      {
        unint64_t v7 = v6;
        *unint64_t v6 = 0;
        int v8 = rindex(v5, 46);
        if (!v8)
        {
LABEL_11:
          uint64_t v4 = 0;
          *unint64_t v7 = 47;
LABEL_20:
          free(v5);
          return v4;
        }
        int v9 = v8;
        size_t v10 = strlen(v8);
        uint64_t v11 = 0;
        while (strlen(bundle_extensions[v11]) != v10 || strcasecmp(v9, bundle_extensions[v11]))
        {
          if (++v11 == 3) {
            goto LABEL_11;
          }
        }
        *unint64_t v7 = 47;
        int v13 = v7[1];
        int v12 = v7 + 1;
        if (!v13
          || !strncmp(v12, "_CodeSignature/", 0xFuLL)
          || !strcmp(v12, "embedded.mobileprovision")
          || !strcmp(v12, "ResourceRules.plist"))
        {
          uint64_t v4 = 1;
          goto LABEL_20;
        }
        if (!strcmp(v12, "Info.plist"))
        {
          uint64_t v4 = 1;
          *a2 = 1;
          goto LABEL_20;
        }
      }
      uint64_t v4 = 0;
      goto LABEL_20;
    }
    return 1;
  }
  return 0;
}

uint64_t ZipStreamWriteCentralDirectoryAndEndRecords(const __CFArray *a1, CFIndex a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v160 = *MEMORY[0x1E4F143B8];
  v142[0] = 0;
  v142[1] = 0;
  *(void *)((char *)&v142[1] + 6) = 0;
  uint64_t v6 = *(void *)(a5 + 8);
  uint64_t v7 = *(void *)(v6 + 80);
  if (!*(unsigned char *)(a5 + 49))
  {
    uint64_t v10 = a5;
    uint64_t v14 = (*(uint64_t (**)(uint64_t))(v6 + 72))(v7);
    if (v14 < 0)
    {
      int v64 = *__error();
      off_t v65 = SZGetLoggingHandle();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = strerror(v64);
        unint64_t v66 = "ftello before writing central directory failed: %s";
        goto LABEL_99;
      }
      goto LABEL_100;
    }
    uint64_t v15 = v14;
    uint64_t v136 = v14;
    uint64_t v137 = a4;
    CFArrayRef v140 = a1;
    uint64_t v141 = v10;
    if (!*(void *)v10 || *(unsigned char *)(v10 + 47))
    {
      int v16 = 0;
      goto LABEL_10;
    }
    v69 = SZGetLoggingHandle();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1DD5BF000, v69, OS_LOG_TYPE_DEBUG, "Writing partial hash", buf, 2u);
    }
    ValueAtIndex = CFArrayGetValueAtIndex(a1, a2);
    uint64_t v71 = malloc_type_malloc(0x400000uLL, 0xE65EE35BuLL);
    uint64_t v159 = 0;
    long long v157 = 0u;
    long long v158 = 0u;
    long long v155 = 0u;
    long long v156 = 0u;
    long long v153 = 0u;
    long long v154 = 0u;
    long long v151 = 0u;
    long long v152 = 0u;
    long long v150 = 0u;
    memset(buf, 0, sizeof(buf));
    uint64_t v72 = (void *)v10;
    size_t v73 = gHashDigestSizes[*(unsigned __int8 *)(v10 + 44)];
    size_t v138 = ValueAtIndex;
    size_t v139 = (unsigned __int8 *)malloc_type_malloc(v73, 0xD92F0CA2uLL);
    uint64_t v74 = v15 + 4;
    uint64_t v75 = (v15 + 4) / *v72 * *v72;
    compression_status v76 = (char *)ValueAtIndex[8];
    size_t v77 = (size_t)&v76[strlen(*(const char **)(a3 + 56)) + *(unsigned __int16 *)(a3 + 64)];
    int v78 = (char *)(v77 + 37);
    if (v75 < (uint64_t)(v77 + 37 + v73))
    {
      v79 = SZGetLoggingHandle();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)size_t v143 = 0;
        unint64_t v80 = "Not computing partial hash for last chunk because last chunk includes metadata digest";
LABEL_166:
        _os_log_debug_impl(&dword_1DD5BF000, v79, OS_LOG_TYPE_DEBUG, v80, v143, 2u);
        goto LABEL_133;
      }
      goto LABEL_133;
    }
    uint64_t v87 = v74 - v75;
    if (!v87)
    {
      v79 = SZGetLoggingHandle();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)size_t v143 = 0;
        unint64_t v80 = "Not computing partial hash for last chunk because central directory signature ends at a chunk boundary.";
        goto LABEL_166;
      }
LABEL_133:
      int v16 = 0;
      uint64_t v9 = 1;
      goto LABEL_134;
    }
    if (v87 <= 0) {
      __assert_rtn("ZipStreamWritePartialHashForLastChunk", "ZipStream.c", 1016, "chunkStart < hashEndOffset");
    }
    *__error() = 0;
    if ((*(uint64_t (**)(void, void *, uint64_t))(*(void *)(v141 + 8) + 48))(*(void *)(*(void *)(v141 + 8) + 80), &kCDRecordSignature, 4) == 4)
    {
      GenericHashInit((uint64_t)buf, *(unsigned __int8 *)(v141 + 44));
      if (v75 == (*(uint64_t (**)(void, uint64_t, void))(*(void *)(v141 + 8) + 64))(*(void *)(*(void *)(v141 + 8) + 80), v75, 0))
      {
        while (v87)
        {
          if ((unint64_t)v87 >= 0x400000) {
            unint64_t v89 = 0x400000;
          }
          else {
            unint64_t v89 = v87;
          }
          uint64_t v90 = (*(uint64_t (**)(void, void *, unint64_t))(*(void *)(v141 + 8) + 56))(*(void *)(*(void *)(v141 + 8) + 80), v71, v89);
          if (v90 != v89)
          {
            v118 = (char *)v90;
            int v119 = *__error();
            v120 = SZGetLoggingHandle();
            if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)size_t v143 = 134218498;
              v144 = (char *)v89;
              __int16 v145 = 2048;
              v146 = v118;
              __int16 v147 = 2080;
              v148 = strerror(v119);
              _os_log_error_impl(&dword_1DD5BF000, v120, OS_LOG_TYPE_ERROR, "Expected to read %ld bytes, but only got %ld bytes from outfile: %s", v143, 0x20u);
            }
            int v16 = 0;
            uint64_t v9 = 0;
LABEL_134:
            a1 = v140;
LABEL_170:
            int v124 = v139;
            uint64_t v10 = v141;
LABEL_171:
            free(v71);
            free(v124);
            if (!v9)
            {
LABEL_101:
              int v56 = 0;
              int v59 = 0;
              goto LABEL_141;
            }
LABEL_10:
            int v135 = v16;
            CFNumberRef v17 = SZGetLoggingHandle();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_debug_impl(&dword_1DD5BF000, v17, OS_LOG_TYPE_DEBUG, "Writing Central Directory", buf, 2u);
            }
            CFIndex Count = CFArrayGetCount(a1);
            if (Count >= 1)
            {
              for (CFIndex i = 0; i != Count; ++i)
              {
                CFNumberRef v20 = (unsigned __int16 *)CFArrayGetValueAtIndex(a1, i);
                CFNumberRef v21 = v20;
                unsigned int v22 = v20[3];
                if (v22 > 0xD)
                {
                  long long v23 = (void *)(v137 + 88);
                  if (v22 != 14)
                  {
                    long long v23 = (void *)(v137 + 80);
                    if (v22 != 99) {
LABEL_20:
                    }
                      long long v23 = (void *)(v137 + 96);
                  }
                }
                else
                {
                  long long v23 = (void *)(v137 + 64);
                  if (v20[3])
                  {
                    long long v23 = (void *)(v137 + 72);
                    if (v22 != 8) {
                      goto LABEL_20;
                    }
                  }
                }
                ++*v23;
                uint64_t v24 = *(void *)(v10 + 8);
                *(void *)buf = 0;
                unsigned __int16 v25 = 8 * (*((void *)v20 + 5) > 0xFFFFFFFEuLL);
                if (*((void *)v20 + 4) > 0xFFFFFFFEuLL) {
                  v25 += 8;
                }
                if (*((void *)v20 + 8) > 0xFFFFFFFEuLL) {
                  v25 += 8;
                }
                if (*((_DWORD *)v20 + 13) <= 0xFFFEu) {
                  unsigned __int16 v26 = v25;
                }
                else {
                  unsigned __int16 v26 = v25 | 4;
                }
                uInt v27 = 0;
                if (_GetExtraFieldOfLength(v20 + 44, &kZip64ExtraFieldSignature, v26, buf))
                {
                  uint64_t v28 = *(void *)buf;
                  if (*(void *)buf)
                  {
                    unint64_t v29 = *((void *)v21 + 5);
                    if (v29 < 0xFFFFFFFF)
                    {
                      size_t v30 = (unint64_t *)(*(void *)buf + 4);
                    }
                    else
                    {
                      *(void *)(*(void *)buf + 4) = v29;
                      size_t v30 = (unint64_t *)(v28 + 12);
                    }
                    unint64_t v31 = *((void *)v21 + 4);
                    if (v31 >= 0xFFFFFFFF) {
                      *v30++ = v31;
                    }
                    unint64_t v32 = *((void *)v21 + 8);
                    if (v32 >= 0xFFFFFFFF) {
                      *v30++ = v32;
                    }
                    unsigned int v33 = *((_DWORD *)v21 + 13);
                    if (v33 >= 0xFFFF) {
                      *(_DWORD *)size_t v30 = v33;
                    }
                  }
                  *(void *)buf = 0;
                  uInt v27 = 0;
                  if (_GetExtraFieldOfLength(v21 + 44, kInfoZipExtraFieldSignature, 8 * (*((void *)v21 + 2) != *((void *)v21 + 1)), buf))
                  {
                    uint64_t v34 = *(void *)buf;
                    if (*(void *)buf)
                    {
                      unint64_t v35 = *((void *)v21 + 1);
                      if (v35 > 0xFFFFFFFE) {
                        LODWORD(v35) = -1;
                      }
                      *(_DWORD *)(*(void *)buf + 4) = v35;
                      unint64_t v36 = *((void *)v21 + 2);
                      if (v36 > 0xFFFFFFFE) {
                        LODWORD(v36) = -1;
                      }
                      *(_DWORD *)(v34 + 8) = v36;
                    }
                    size_t v37 = strlen(*((const char **)v21 + 9));
                    if (v37 >= 0x10000) {
                      __assert_rtn("CreateCDRecordFromMutable", "MutableZipStructure.c", 379, "file_name_length <= UINT16_MAX");
                    }
                    size_t v38 = v37;
                    uint64_t v39 = malloc_type_malloc(v37 + v21[44] + v21[24] + 46, 0x795FBF1BuLL);
                    uInt v27 = v39;
                    *(_DWORD *)uint64_t v39 = 33639248;
                    v39[2] = *v21;
                    if (v26) {
                      __int16 v40 = 45;
                    }
                    else {
                      __int16 v40 = v21[1];
                    }
                    v39[3] = v40;
                    v39[4] = v21[2];
                    v39[5] = v21[3];
                    *((_DWORD *)v39 + 3) = UNIX2DOSTime(*((void *)v21 + 2));
                    v27[4] = *((_DWORD *)v21 + 7);
                    unint64_t v41 = *((void *)v21 + 4);
                    if (v41 >= 0xFFFFFFFF) {
                      LODWORD(v41) = -1;
                    }
                    v27[5] = v41;
                    unint64_t v42 = *((void *)v21 + 5);
                    if (v42 >= 0xFFFFFFFF) {
                      LODWORD(v42) = -1;
                    }
                    v27[6] = v42;
                    *((_WORD *)v27 + 14) = v38;
                    *((_WORD *)v27 + 15) = v21[44];
                    *((_WORD *)v27 + 16) = v21[24];
                    unsigned int v43 = *((_DWORD *)v21 + 13);
                    if (v43 >= 0xFFFF) {
                      LOWORD(v43) = -1;
                    }
                    *((_WORD *)v27 + 17) = v43;
                    *((_WORD *)v27 + 18) = v21[28];
                    *(_DWORD *)((char *)v27 + 38) = (v21[12] << 16) | 0x4000;
                    unint64_t v44 = *((void *)v21 + 8);
                    if (v44 >= 0xFFFFFFFF) {
                      LODWORD(v44) = -1;
                    }
                    *(_DWORD *)((char *)v27 + 42) = v44;
                    memcpy((char *)v27 + 46, *((const void **)v21 + 9), v38);
                    memcpy((char *)v27 + v38 + 46, *((const void **)v21 + 12), v21[44]);
                    memcpy((char *)v27 + v38 + v21[44] + 46, *((const void **)v21 + 10), v21[24]);
                  }
                }
                unint64_t v45 = *((unsigned __int16 *)v27 + 14)
                    + (unint64_t)*((unsigned __int16 *)v27 + 15)
                    + *((unsigned __int16 *)v27 + 16)
                    + 46;
                uint64_t v46 = (*(uint64_t (**)(void, _DWORD *, unint64_t))(v24 + 48))(*(void *)(v24 + 80), v27, v45);
                if (v46 == v45) {
                  uint64_t v47 = 0;
                }
                else {
                  uint64_t v47 = v27;
                }
                free(v47);
                if (v46 != v45 || v27 == 0)
                {
                  off_t v65 = SZGetLoggingHandle();
                  if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
                  {
                    int v67 = __error();
                    uint32_t v68 = strerror(*v67);
                    *(_DWORD *)buf = 136315138;
                    *(void *)&uint8_t buf[4] = v68;
                    unint64_t v66 = "Failed to write central directory record: %s";
                    goto LABEL_99;
                  }
                  goto LABEL_100;
                }
                free(v27);
                a1 = v140;
                uint64_t v10 = v141;
              }
            }
            v49 = SZGetLoggingHandle();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_debug_impl(&dword_1DD5BF000, v49, OS_LOG_TYPE_DEBUG, "Writing end of central directory records", buf, 2u);
            }
            uint64_t v50 = (*(uint64_t (**)(void))(*(void *)(v10 + 8) + 72))(*(void *)(*(void *)(v10 + 8)
                                                                                              + 80));
            uint64_t v51 = v136;
            if (v50 < 0)
            {
              int v81 = *__error();
              off_t v65 = SZGetLoggingHandle();
              if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
              {
                uint64_t v82 = strerror(v81);
                *(_DWORD *)buf = 136315138;
                *(void *)&uint8_t buf[4] = v82;
                unint64_t v66 = "ftello after writing central directory failed: %s";
LABEL_99:
                _os_log_error_impl(&dword_1DD5BF000, v65, OS_LOG_TYPE_ERROR, v66, buf, 0xCu);
              }
LABEL_100:
              uint64_t v9 = 0;
              goto LABEL_101;
            }
            uint64_t v52 = v50;
            uint64_t v53 = v50 - v136;
            int v54 = SZGetLoggingHandle();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v107 = *(void *)(v137 + 136);
              uint64_t v106 = *(void *)(v137 + 144);
              *(_DWORD *)buf = 134219008;
              *(void *)&uint8_t buf[4] = Count;
              *(_WORD *)&buf[12] = 2048;
              *(void *)&buf[14] = v136;
              *(_WORD *)&buf[22] = 2048;
              *(void *)&buf[24] = v53;
              *(_WORD *)&buf[32] = 2048;
              *(void *)&buf[34] = v106;
              *(_WORD *)&buf[42] = 2048;
              *(void *)&buf[44] = v107;
              _os_log_debug_impl(&dword_1DD5BF000, v54, OS_LOG_TYPE_DEBUG, "Zip64 triggers: total_cd_records %lu; cd_offset %lld; cd_length %llu; max compressed_size %llu; max unco"
                "mpressed_size %llu",
                buf,
                0x34u);
            }
            if (v136 <= 4294967294
              && Count <= 65534
              && v53 <= 4294967294
              && *(void *)(v137 + 136) <= 0xFFFFFFFEuLL
              && *(void *)(v137 + 144) <= 0xFFFFFFFEuLL)
            {
              int v59 = 0;
              int v56 = 0;
              memset((char *)v142 + 4, 0, 18);
              LODWORD(v142[0]) = 101010256;
              goto LABEL_118;
            }
            compression_algorithm v55 = SZGetLoggingHandle();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_debug_impl(&dword_1DD5BF000, v55, OS_LOG_TYPE_DEBUG, "Writing Zip64 records", buf, 2u);
            }
            *(unsigned char *)(v137 + 200) = 1;
            int v56 = malloc_type_calloc(1uLL, 0x14uLL, 0x1000040A86A77D5uLL);
            v56[4] = 1;
            *int v56 = 117853008;
            uint64_t v57 = (char *)malloc_type_calloc(1uLL, 0x38uLL, 0x100004021716A34uLL);
            *(_DWORD *)uint64_t v57 = 101075792;
            *(void *)(v57 + 4) = 44;
            *((_DWORD *)v57 + 3) = 2949918;
            *((void *)v56 + 1) = v52;
            *((void *)v57 + 3) = Count;
            *((void *)v57 + 4) = Count;
            *((void *)v57 + 5) = v53;
            *((void *)v57 + 6) = v136;
            unint64_t v58 = *(void *)(v57 + 4) + 12;
            if (v58 >= 0x7FFFFFFFFFFFFFFFLL) {
              __assert_rtn("ZipStreamWriteCentralDirectoryAndEndRecords", "ZipStream.c", 1242, "writeSize < INTPTR_MAX");
            }
            int v59 = v57;
            *__error() = 0;
            uint64_t v60 = (*(uint64_t (**)(void, void *, unint64_t))(*(void *)(v10 + 8) + 48))(*(void *)(*(void *)(v10 + 8) + 80), v59, v58);
            uint32_t v61 = __error();
            if (v58 == v60)
            {
              *uint32_t v61 = 0;
              if ((*(uint64_t (**)(void, _DWORD *, uint64_t))(*(void *)(v10 + 8) + 48))(*(void *)(*(void *)(v10 + 8) + 80), v56, 20) == 20)
              {
                memset((char *)v142 + 4, 0, 18);
                LODWORD(v142[0]) = 101010256;
                if (Count >= 0x10000) {
                  LOWORD(Count) = -1;
                }
                uint64_t v51 = v136;
LABEL_118:
                LOWORD(v142[1]) = Count;
                WORD1(v142[1]) = Count;
                int v93 = -1;
                if (v53 >= 0xFFFFFFFFLL) {
                  int v94 = -1;
                }
                else {
                  int v94 = v53;
                }
                if (v51 < 0xFFFFFFFFLL) {
                  int v93 = v51;
                }
                HIDWORD(v142[1]) = v94;
                LODWORD(v142[2]) = v93;
                *__error() = 0;
                if ((*(uint64_t (**)(void, void *, uint64_t))(*(void *)(v10 + 8) + 48))(*(void *)(*(void *)(v10 + 8) + 80), v142, 22) == 22)
                {
                  unint64_t v95 = (*(uint64_t (**)(void))(*(void *)(v10 + 8) + 72))(*(void *)(*(void *)(v10 + 8) + 80));
                  if ((v95 & 0x8000000000000000) == 0)
                  {
                    if (!*(void *)v10 || v135)
                    {
                      unint64_t v96 = v51 + 4;
                    }
                    else
                    {
                      unint64_t v96 = *(void *)v10 + (unint64_t)v51 / *(void *)v10 * *(void *)v10;
                      if (v96 >= v95) {
                        unint64_t v96 = v95;
                      }
                    }
                    *(void *)(v137 + 128) = v96;
                    *(void *)(v137 + 104) = v95 - v51;
                    uint64_t v9 = 1;
                    goto LABEL_141;
                  }
                  int v103 = *__error();
                  uint64_t v84 = SZGetLoggingHandle();
                  if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
                  {
                    v104 = strerror(v103);
                    *(_DWORD *)buf = 136315138;
                    *(void *)&uint8_t buf[4] = v104;
                    unint64_t v86 = "Failed to determine offset of output file: %s";
LABEL_139:
                    _os_log_error_impl(&dword_1DD5BF000, v84, OS_LOG_TYPE_ERROR, v86, buf, 0xCu);
                  }
                }
                else
                {
                  int v97 = *__error();
                  uint64_t v84 = SZGetLoggingHandle();
                  if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
                  {
                    v98 = strerror(v97);
                    *(_DWORD *)buf = 136315138;
                    *(void *)&uint8_t buf[4] = v98;
                    unint64_t v86 = "Failed to write end record: %s";
                    goto LABEL_139;
                  }
                }
              }
              else
              {
                int v91 = *__error();
                uint64_t v84 = SZGetLoggingHandle();
                if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
                {
                  size_t v92 = strerror(v91);
                  *(_DWORD *)buf = 136315138;
                  *(void *)&uint8_t buf[4] = v92;
                  unint64_t v86 = "Failed to write zip64 end record locator: %s";
                  goto LABEL_139;
                }
              }
            }
            else
            {
              int v83 = *v61;
              uint64_t v84 = SZGetLoggingHandle();
              if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
              {
                v85 = strerror(v83);
                *(_DWORD *)buf = 136315138;
                *(void *)&uint8_t buf[4] = v85;
                unint64_t v86 = "Failed to write zip64 end record: %s";
                goto LABEL_139;
              }
            }
            uint64_t v9 = 0;
LABEL_141:
            free(v59);
            free(v56);
            return v9;
          }
          GenericHashUpdate((uint64_t)buf, v71, v89);
          v87 -= v89;
          if (v87 < 0) {
            __assert_rtn("ZipStreamWritePartialHashForLastChunk", "ZipStream.c", 1048, "remaining >= 0");
          }
        }
        uint64_t v88 = (char *)(v77 + 30);
        GenericHashFinal(v139, (uint64_t)buf);
        uint64_t v111 = (*(uint64_t (**)(void, char *, void))(*(void *)(v141 + 8) + 64))(*(void *)(*(void *)(v141 + 8) + 80), v78, 0);
        v112 = __error();
        if (v78 != (char *)v111)
        {
          size_t v99 = v71;
          int v121 = *v112;
          v122 = SZGetLoggingHandle();
          if (!os_log_type_enabled(v122, OS_LOG_TYPE_ERROR)) {
            goto LABEL_168;
          }
          *(_DWORD *)size_t v143 = 134218242;
          v144 = v78;
          __int16 v145 = 2080;
          v146 = strerror(v121);
          uint64_t v102 = "Failed to seek to digest offset %llu in fixed metadata: %s";
          v109 = v122;
          uint32_t v110 = 22;
          goto LABEL_148;
        }
        int *v112 = 0;
        if (v73 == (*(uint64_t (**)(void, unsigned __int8 *, size_t))(*(void *)(v141 + 8) + 48))(*(void *)(*(void *)(v141 + 8) + 80), v139, v73))
        {
          uint64_t v10 = v141;
          if (v88 == (char *)(*(uint64_t (**)(void, char *, void))(*(void *)(v141 + 8) + 64))(*(void *)(*(void *)(v141 + 8) + 80), v88, 0))
          {
            uLong v113 = crc32(0, 0, 0);
            uint64_t v114 = *(void *)(a3 + 48);
            while (v114 >= 1)
            {
              if ((unint64_t)v114 >= 0x400000) {
                uint64_t v115 = 0x400000;
              }
              else {
                uint64_t v115 = v114;
              }
              uint64_t v116 = (*(uint64_t (**)(void, void *, uint64_t))(*(void *)(v10 + 8) + 56))(*(void *)(*(void *)(v10 + 8) + 80), v71, v115);
              uint64_t v117 = v71;
              if (v116 != v115)
              {
                v129 = (char *)v116;
                int v130 = *__error();
                v131 = SZGetLoggingHandle();
                if (os_log_type_enabled(v131, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)size_t v143 = 134218498;
                  v144 = (char *)v115;
                  __int16 v145 = 2048;
                  v146 = v129;
                  __int16 v147 = 2080;
                  v148 = strerror(v130);
                  _os_log_error_impl(&dword_1DD5BF000, v131, OS_LOG_TYPE_ERROR, "Expected to read %ld bytes, but only got %ld bytes from outfile: %s", v143, 0x20u);
                }
                int v16 = 0;
                uint64_t v9 = 0;
                a1 = v140;
                uint64_t v71 = v117;
                goto LABEL_170;
              }
              uLong v113 = crc32(v113, (const Bytef *)v71, v115);
              v114 -= v115;
              uint64_t v10 = v141;
              if (v114 < 0) {
                __assert_rtn("ZipStreamWritePartialHashForLastChunk", "ZipStream.c", 1089, "remaining >= 0");
              }
            }
            size_t v99 = v71;
            *(_DWORD *)(a3 + 32) = v113;
            if (v76 == (char *)(*(uint64_t (**)(void, char *, void))(*(void *)(v10 + 8) + 64))(*(void *)(*(void *)(v10 + 8) + 80), v76, 0))
            {
              v128 = CreateAndWriteLocalFileRecord(a3, *(void *)(v10 + 8));
              if (v128)
              {
                free(v128);
                *((_DWORD *)v138 + 7) = *(_DWORD *)(a3 + 32);
                if ((*(uint64_t (**)(void, uint64_t, void))(*(void *)(v141 + 8) + 64))(*(void *)(*(void *)(v141 + 8) + 80), v136, 0) == v136)
                {
                  int v16 = 1;
                  uint64_t v9 = 1;
                  goto LABEL_169;
                }
                int v134 = *__error();
                size_t v101 = SZGetLoggingHandle();
                if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)size_t v143 = 136315138;
                  v144 = strerror(v134);
                  uint64_t v102 = "Failed to seek to the beginning of the central directory: %s";
                  goto LABEL_147;
                }
                goto LABEL_168;
              }
              uint32_t v133 = SZGetLoggingHandle();
              if (!os_log_type_enabled(v133, OS_LOG_TYPE_ERROR)) {
                goto LABEL_168;
              }
              *(_WORD *)size_t v143 = 0;
              uint64_t v102 = "Failed to write updated fixed metadata LF record";
              v109 = v133;
              uint32_t v110 = 2;
              goto LABEL_148;
            }
            int v132 = *__error();
            v126 = SZGetLoggingHandle();
            if (!os_log_type_enabled(v126, OS_LOG_TYPE_ERROR)) {
              goto LABEL_186;
            }
            *(_DWORD *)size_t v143 = 134218242;
            v144 = v76;
            __int16 v145 = 2080;
            v146 = strerror(v132);
            int v127 = "Failed to seek to fixed metadata LF header at offset %llu: %s";
          }
          else
          {
            size_t v99 = v71;
            int v125 = *__error();
            v126 = SZGetLoggingHandle();
            if (!os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
            {
LABEL_186:
              int v16 = 0;
              uint64_t v9 = 0;
              int v124 = v139;
              a1 = v140;
              uint64_t v71 = v99;
              goto LABEL_171;
            }
            *(_DWORD *)size_t v143 = 134218242;
            v144 = v88;
            __int16 v145 = 2080;
            v146 = strerror(v125);
            int v127 = "Failed to seek to beginning of fixed metadata file data %llu: %s";
          }
          _os_log_error_impl(&dword_1DD5BF000, v126, OS_LOG_TYPE_ERROR, v127, v143, 0x16u);
          goto LABEL_186;
        }
        size_t v99 = v71;
        int v123 = *__error();
        size_t v101 = SZGetLoggingHandle();
        if (!os_log_type_enabled(v101, OS_LOG_TYPE_ERROR)) {
          goto LABEL_168;
        }
        *(_DWORD *)size_t v143 = 136315138;
        v144 = strerror(v123);
        uint64_t v102 = "Failed to write digest to fixed metadata: %s";
      }
      else
      {
        size_t v99 = v71;
        int v108 = *__error();
        size_t v101 = SZGetLoggingHandle();
        if (!os_log_type_enabled(v101, OS_LOG_TYPE_ERROR)) {
          goto LABEL_168;
        }
        *(_DWORD *)size_t v143 = 136315138;
        v144 = strerror(v108);
        uint64_t v102 = "Failed to seek to start of last partial chunk before CD: %s";
      }
    }
    else
    {
      size_t v99 = v71;
      int v100 = *__error();
      size_t v101 = SZGetLoggingHandle();
      if (!os_log_type_enabled(v101, OS_LOG_TYPE_ERROR)) {
        goto LABEL_168;
      }
      *(_DWORD *)size_t v143 = 136315138;
      v144 = strerror(v100);
      uint64_t v102 = "Failed to write out first CD record signature: %s";
    }
LABEL_147:
    v109 = v101;
    uint32_t v110 = 12;
LABEL_148:
    _os_log_error_impl(&dword_1DD5BF000, v109, OS_LOG_TYPE_ERROR, v102, v143, v110);
LABEL_168:
    int v16 = 0;
    uint64_t v9 = 0;
LABEL_169:
    a1 = v140;
    uint64_t v71 = v99;
    goto LABEL_170;
  }
  if ((*(uint64_t (**)(uint64_t, void *, uint64_t))(v6 + 48))(v7, &kCDRecordSignature, 4) == 4)
  {
    int v8 = SZGetLoggingHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1DD5BF000, v8, OS_LOG_TYPE_DEBUG, "Wrote central directory header to trigger stream end", buf, 2u);
    }
    return 1;
  }
  else
  {
    int v62 = *__error();
    uint64_t v63 = SZGetLoggingHandle();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = strerror(v62);
      _os_log_error_impl(&dword_1DD5BF000, v63, OS_LOG_TYPE_ERROR, "Failed to write central directory record signature: %s", buf, 0xCu);
    }
    return 0;
  }
}

BOOL ZipStreamConfigureOutput(void *a1, char a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v2 = *(unsigned __int8 *)a1;
  if (v2 != 1)
  {
    BOOL v5 = SZGetLoggingHandle();
    BOOL result = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    v10[0] = 67109120;
    v10[1] = v2;
    uint64_t v6 = "Only version 1 of callbacks struct is supported; you specified %hhu";
    uint64_t v7 = v5;
    uint32_t v8 = 8;
    goto LABEL_15;
  }
  uint64_t v3 = a1[5];
  if (v3)
  {
    a1[6] = ZipStreamFILEWriteCallback;
    a1[7] = ZipStreamFILEReadCallback;
    a1[8] = ZipStreamFILESeekCallback;
    a1[9] = ZipStreamFILETellCallback;
    a1[10] = v3;
    a1[11] = ZipStreamFILEFlushCallback;
    a1[12] = ZipStreamFILETruncateCallback;
    return 1;
  }
  if (a1[6] && (a1[7] && a1[8] && a1[12] || a2) && a1[9]) {
    return 1;
  }
  uint64_t v9 = SZGetLoggingHandle();
  BOOL result = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
  if (result)
  {
    LOWORD(v10[0]) = 0;
    uint64_t v6 = "Must specify either outFILE or appropriate output contexts in configuration struct. HINT: you must specify writ"
         "e and tell callbacks for non-seakable output; you must specify all for seekable output.";
    uint64_t v7 = v9;
    uint32_t v8 = 2;
LABEL_15:
    _os_log_error_impl(&dword_1DD5BF000, v7, OS_LOG_TYPE_ERROR, v6, (uint8_t *)v10, v8);
    return 0;
  }
  return result;
}

uint64_t ZipStreamFILETruncateCallback(FILE *a1, off_t a2)
{
  int v3 = fileno(a1);

  return ftruncate(v3, a2);
}

off_t ZipStreamFILESeekCallback(FILE *__stream, off_t a2, int a3)
{
  if ((a2 || a3 != 1) && fseeko(__stream, a2, a3) == -1) {
    return -1;
  }

  return ftello(__stream);
}

size_t ZipStreamFILEReadCallback(FILE *__stream, void *__ptr, size_t a3)
{
  size_t v3 = a3;
  if (fread(__ptr, 1uLL, a3, __stream) != a3) {
    return -1;
  }
  if ((v3 & 0x8000000000000000) != 0)
  {
    uint64_t v4 = SZGetLoggingHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6[0] = 0;
      _os_log_error_impl(&dword_1DD5BF000, v4, OS_LOG_TYPE_ERROR, "fread returned result > INTPTR_MAX and so is not representable as a ssize_t", (uint8_t *)v6, 2u);
    }
    return -1;
  }
  return v3;
}

size_t ZipStreamFILEWriteCallback(FILE *__stream, void *__ptr, size_t a3)
{
  size_t v3 = a3;
  if (fwrite(__ptr, 1uLL, a3, __stream) != a3) {
    return -1;
  }
  if ((v3 & 0x8000000000000000) != 0)
  {
    uint64_t v4 = SZGetLoggingHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6[0] = 0;
      _os_log_error_impl(&dword_1DD5BF000, v4, OS_LOG_TYPE_ERROR, "fwrite returned result > INTPTR_MAX and so is not representable as a ssize_t", (uint8_t *)v6, 2u);
    }
    return -1;
  }
  return v3;
}

void ZipStreamCallPreflightResultCallback(uint64_t a1, uint64_t a2, uint64_t a3, __int16 a4)
{
  keys[3] = *(void **)MEMORY[0x1E4F143B8];
  uint64_t v11 = a3;
  uint64_t valuePtr = a2;
  __int16 v10 = a4;
  if (*(void *)(a1 + 8))
  {
    CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFNumberRef v6 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt64Type, &valuePtr);
    CFNumberRef v7 = CFNumberCreate(v5, kCFNumberSInt64Type, &v11);
    CFNumberRef v8 = CFNumberCreate(v5, kCFNumberSInt16Type, &v10);
    keys[0] = @"PreflightResultTotalFileCount";
    keys[1] = @"PreflightResultTotalFileSize";
    keys[2] = @"PreflightTargetPathMode";
    values[0] = v6;
    values[1] = v7;
    values[2] = v8;
    CFDictionaryRef v9 = CFDictionaryCreate(v5, (const void **)keys, (const void **)values, 3, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    (*(void (**)(CFDictionaryRef, void))(a1 + 8))(v9, *(void *)(a1 + 16));
    CFRelease(v6);
    CFRelease(v7);
    CFRelease(v8);
    CFRelease(v9);
  }
}

_WORD *CreateMutableLocalFileRecord(uint64_t a1)
{
  int v2 = malloc_type_calloc(1uLL, 0x50uLL, 0x1010040BDAC2CBCuLL);
  *int v2 = *(_WORD *)(a1 + 4);
  v2[1] = *(_WORD *)(a1 + 6);
  v2[2] = *(_WORD *)(a1 + 8);
  InfoZipExtraFieldFromLF = GetInfoZipExtraFieldFromLF(a1);
  if (!InfoZipExtraFieldFromLF)
  {
    time_t v4 = DOS2UNIXTime(*(_DWORD *)(a1 + 10));
    *((void *)v2 + 1) = v4;
    *((void *)v2 + 2) = v4;
    goto LABEL_5;
  }
  *((void *)v2 + 1) = *((unsigned int *)InfoZipExtraFieldFromLF + 1);
  *((void *)v2 + 2) = *((unsigned int *)InfoZipExtraFieldFromLF + 2);
  if (InfoZipExtraFieldFromLF[1] < 0xCu)
  {
LABEL_5:
    *((_DWORD *)v2 + 6) = -1;
    goto LABEL_6;
  }
  v2[12] = InfoZipExtraFieldFromLF[6];
  v2[13] = InfoZipExtraFieldFromLF[7];
LABEL_6:
  *((unsigned char *)v2 + 30) = *(unsigned char *)(*(unsigned __int16 *)(a1 + 26) + a1 + 29) == 47;
  *((_DWORD *)v2 + 8) = *(_DWORD *)(a1 + 14);
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v5 = *(unsigned int *)(a1 + 18);
  if (v5 != -1)
  {
    LODWORD(v6) = *(_DWORD *)(a1 + 22);
    if (v6 != -1) {
      goto LABEL_11;
    }
  }
  if (!GetZip64ExtraFieldDataFromLF(a1, &v11, &v12))
  {
    LODWORD(v6) = *(_DWORD *)(a1 + 22);
LABEL_11:
    uint64_t v6 = v6;
    uint64_t v11 = v6;
    uint64_t v12 = v5;
    goto LABEL_12;
  }
  uint64_t v6 = v11;
  uint64_t v5 = v12;
LABEL_12:
  *((void *)v2 + 5) = v5;
  *((void *)v2 + 6) = v6;
  v2[32] = *(_WORD *)(a1 + 28);
  size_t v7 = *(unsigned __int16 *)(a1 + 26);
  CFNumberRef v8 = malloc_type_calloc(v7 + 1, 1uLL, 0xCB3B20E1uLL);
  memcpy(v8, (const void *)(a1 + 30), v7);
  *((void *)v2 + 7) = v8;
  CFDictionaryRef v9 = malloc_type_malloc(*(unsigned __int16 *)(a1 + 28), 0xCD3ECFDCuLL);
  *((void *)v2 + 9) = v9;
  memcpy(v9, (const void *)(a1 + 30 + *(unsigned __int16 *)(a1 + 26)), *(unsigned __int16 *)(a1 + 28));
  return v2;
}

void DestroyMutableLocalFileRecord(void **a1)
{
  if (a1)
  {
    free(a1[7]);
    free(a1[9]);
    free(a1);
  }
}

uint64_t _GetExtraFieldOfLength(unsigned __int16 *a1, unsigned __int16 *a2, unsigned int a3, void *a4)
{
  unsigned int v8 = *a1;
  ExtraFieldWithSignature = GetExtraFieldWithSignature(*((void *)a1 + 1), *a1, a2);
  if (ExtraFieldWithSignature)
  {
    unsigned __int16 v10 = ExtraFieldWithSignature[1];
    if ((unsigned __int16)(a3 - 1) < v10) {
      goto LABEL_13;
    }
    unsigned __int16 v11 = v10 + 4;
    if (v8 > (unsigned __int16)(v10 + 4))
    {
      memmove(ExtraFieldWithSignature, (char *)ExtraFieldWithSignature + (unsigned __int16)(v10 + 4), (unsigned __int16)(v10 + 4));
      unsigned int v8 = *a1;
    }
    if (v8 < v11) {
      __assert_rtn("_RemoveExtraField", "MutableZipStructure.c", 81, "fieldLength <= extraInfo->length");
    }
    LOWORD(v8) = v8 - v11;
    *a1 = v8;
  }
  if (a3)
  {
    size_t v12 = a3 + (unint64_t)(unsigned __int16)v8 + 4;
    if (v12 >> 16)
    {
      ExtraFieldWithSignature = 0;
LABEL_14:
      uint64_t v13 = 0;
      goto LABEL_15;
    }
    ExtraFieldWithSignature = reallocf(*((void **)a1 + 1), v12);
    *((void *)a1 + 1) = ExtraFieldWithSignature;
    if (!ExtraFieldWithSignature) {
      goto LABEL_14;
    }
    ExtraFieldWithSignature = (_WORD *)((char *)ExtraFieldWithSignature + *a1);
    *a1 = v12;
    _WORD *ExtraFieldWithSignature = *a2;
    ExtraFieldWithSignature[1] = a3;
  }
  else
  {
    ExtraFieldWithSignature = 0;
  }
LABEL_13:
  uint64_t v13 = 1;
LABEL_15:
  *a4 = ExtraFieldWithSignature;
  return v13;
}

char *CreateAndWriteLocalFileRecord(uint64_t a1, uint64_t a2)
{
  uint64_t v26 = 0;
  if (*(void *)(a1 + 40) <= 0xFFFFFFFEuLL && *(void *)(a1 + 48) < 0xFFFFFFFFuLL)
  {
    unsigned int v5 = 0;
    int v4 = 1;
  }
  else
  {
    int v4 = 0;
    unsigned int v5 = 16;
  }
  uint64_t v6 = (unsigned __int16 *)(a1 + 64);
  if (_GetExtraFieldOfLength((unsigned __int16 *)(a1 + 64), &kZip64ExtraFieldSignature, v5, &v26))
  {
    uint64_t v7 = v26;
    if (v26)
    {
      *(void *)(v26 + 4) = *(void *)(a1 + 48);
      *(void *)(v7 + 12) = *(void *)(a1 + 40);
    }
    uint64_t v26 = 0;
    unsigned int v8 = 0;
    if (_GetExtraFieldOfLength((unsigned __int16 *)(a1 + 64), &kStreamingZipLFExtraFieldSignature, 2 * (*(_WORD *)(a1 + 28) != 0), &v26))
    {
      if (v26) {
        *(_WORD *)(v26 + 4) = *(_WORD *)(a1 + 28);
      }
      unsigned int v9 = 8 * (*(void *)(a1 + 16) != *(void *)(a1 + 8));
      if (*(__int16 *)(a1 + 24) != -1 && *(unsigned __int16 *)(a1 + 26) != 0xFFFF) {
        unsigned int v9 = 12;
      }
      uint64_t v26 = 0;
      unsigned int v8 = 0;
      if (_GetExtraFieldOfLength((unsigned __int16 *)(a1 + 64), kInfoZipExtraFieldSignature, v9, &v26))
      {
        uint64_t v10 = v26;
        if (v26)
        {
          unint64_t v11 = *(void *)(a1 + 8);
          if (v11 > 0xFFFFFFFE) {
            LODWORD(v11) = -1;
          }
          *(_DWORD *)(v26 + 4) = v11;
          unint64_t v12 = *(void *)(a1 + 16);
          if (v12 > 0xFFFFFFFE) {
            LODWORD(v12) = -1;
          }
          *(_DWORD *)(v10 + 8) = v12;
          if (v9 == 12)
          {
            *(_WORD *)(v10 + 12) = *(_WORD *)(a1 + 24);
            *(_WORD *)(v10 + 14) = *(_WORD *)(a1 + 26);
          }
        }
        size_t v13 = strlen(*(const char **)(a1 + 56));
        if (v13 >= 0x10000) {
          __assert_rtn("CreateLocalFileRecordFromMutable", "MutableZipStructure.c", 188, "file_name_length <= UINT16_MAX");
        }
        size_t v14 = v13;
        uint64_t v15 = (char *)malloc_type_malloc(v13 + *v6 + 30, 0x270560D7uLL);
        unsigned int v8 = v15;
        *(_DWORD *)uint64_t v15 = 67324752;
        if (v4) {
          __int16 v16 = *(_WORD *)a1;
        }
        else {
          __int16 v16 = 45;
        }
        *((_WORD *)v15 + 2) = v16;
        *((_WORD *)v15 + 3) = *(_WORD *)(a1 + 2);
        *((_WORD *)v15 + 4) = *(_WORD *)(a1 + 4);
        *(_DWORD *)(v15 + 10) = UNIX2DOSTime(*(void *)(a1 + 16));
        char v23 = v4 ^ 1;
        if ((*(_WORD *)(a1 + 2) & 8) == 0) {
          char v23 = 1;
        }
        if ((v23 & 1) != 0 || !*(_WORD *)(a1 + 4))
        {
          *(_DWORD *)(v8 + 14) = *(_DWORD *)(a1 + 32);
          unint64_t v25 = *(void *)(a1 + 40);
          if (v25 >= 0xFFFFFFFF) {
            LODWORD(v25) = -1;
          }
          *(_DWORD *)(v8 + 18) = v25;
          unint64_t v24 = *(void *)(a1 + 48);
          if (v24 >= 0xFFFFFFFF) {
            LODWORD(v24) = -1;
          }
        }
        else
        {
          LODWORD(v24) = 0;
          *(void *)(v8 + 14) = 0;
        }
        *(_DWORD *)(v8 + 22) = v24;
        *((_WORD *)v8 + 13) = v14;
        memcpy(v8 + 30, *(const void **)(a1 + 56), v14);
        if (!strcmp(*(const char **)(a1 + 56), "mimetype"))
        {
          *((_WORD *)v8 + 14) = 0;
        }
        else
        {
          *((_WORD *)v8 + 14) = *(_WORD *)(a1 + 64);
          memcpy(&v8[v14 + 30], *(const void **)(a1 + 72), *(unsigned __int16 *)(a1 + 64));
        }
      }
    }
  }
  else
  {
    unsigned int v8 = 0;
  }
  unint64_t v17 = *((unsigned __int16 *)v8 + 13) + (unint64_t)*((unsigned __int16 *)v8 + 14) + 30;
  uint64_t v18 = (*(uint64_t (**)(void, char *, unint64_t))(a2 + 48))(*(void *)(a2 + 80), v8, v17);
  BOOL v19 = v18 == v17;
  if (v18 == v17) {
    CFNumberRef v20 = 0;
  }
  else {
    CFNumberRef v20 = v8;
  }
  if (v19) {
    CFNumberRef v21 = v8;
  }
  else {
    CFNumberRef v21 = 0;
  }
  free(v20);
  return v21;
}

_WORD *CreateMutableCDRecord(uint64_t a1)
{
  int v2 = malloc_type_calloc(1uLL, 0x68uLL, 0x1010040E435E96EuLL);
  *int v2 = *(_WORD *)(a1 + 4);
  v2[1] = *(_WORD *)(a1 + 6);
  v2[2] = *(_WORD *)(a1 + 8);
  v2[3] = *(_WORD *)(a1 + 10);
  if (*(_WORD *)(a1 + 30)
    && (ExtraFieldWithSignature = GetExtraFieldWithSignature(a1 + *(unsigned __int16 *)(a1 + 28) + 46, *(unsigned __int16 *)(a1 + 30), kInfoZipExtraFieldSignature)) != 0&& ExtraFieldWithSignature[1] >= 8u)
  {
    *((void *)v2 + 2) = *((unsigned int *)ExtraFieldWithSignature + 2);
    time_t v4 = *((unsigned int *)ExtraFieldWithSignature + 1);
  }
  else
  {
    time_t v4 = DOS2UNIXTime(*(_DWORD *)(a1 + 12));
    *((void *)v2 + 2) = v4;
  }
  *((void *)v2 + 1) = v4;
  if (*(unsigned char *)(a1 + 5) != 3 && *(unsigned char *)(a1 + 5)
    || (int v5 = HIWORD(*(_DWORD *)(a1 + 38)), v6 = v5 & 0xF000, v6 != 0x4000) && v6 != 40960 && v6 != 0x8000
    || !v5)
  {
    if (*(unsigned char *)(*(unsigned __int16 *)(a1 + 28) + a1 + 45) == 47) {
      LOWORD(v5) = 16893;
    }
    else {
      LOWORD(v5) = -32332;
    }
  }
  v2[12] = v5 & 0xF1FF;
  *((unsigned char *)v2 + 26) = *(unsigned char *)(*(unsigned __int16 *)(a1 + 28) + a1 + 45) == 47;
  *((_DWORD *)v2 + 7) = *(_DWORD *)(a1 + 16);
  uint64_t v7 = *(unsigned int *)(a1 + 20);
  if (v7 == -1)
  {
    if (*(_WORD *)(a1 + 30)
      && (v8 = GetExtraFieldWithSignature(a1 + *(unsigned __int16 *)(a1 + 28) + 46, *(unsigned __int16 *)(a1 + 30), &kZip64ExtraFieldSignature)) != 0&& ((v9 = *(_DWORD *)(a1 + 24), v9 != -1) ? (unsigned int v10 = 8) : (unsigned int v10 = 16), v10 <= v8[1]))
    {
      uint64_t v7 = *(void *)&v8[4 * (v9 == -1) + 2];
    }
    else
    {
      uint64_t v7 = 0xFFFFFFFFLL;
    }
  }
  *((void *)v2 + 4) = v7;
  uint64_t v11 = *(unsigned int *)(a1 + 24);
  if (v11 == -1)
  {
    if (*(_WORD *)(a1 + 30)
      && (unint64_t v12 = GetExtraFieldWithSignature(a1 + *(unsigned __int16 *)(a1 + 28) + 46, *(unsigned __int16 *)(a1 + 30), &kZip64ExtraFieldSignature)) != 0&& v12[1] >= 8u)
    {
      uint64_t v11 = *(void *)(v12 + 2);
    }
    else
    {
      uint64_t v11 = 0xFFFFFFFFLL;
    }
  }
  *((void *)v2 + 5) = v11;
  v2[44] = *(_WORD *)(a1 + 30);
  v2[24] = *(_WORD *)(a1 + 32);
  *((_DWORD *)v2 + 13) = *(unsigned __int16 *)(a1 + 34);
  v2[28] = *(_WORD *)(a1 + 36);
  uint64_t v13 = *(unsigned int *)(a1 + 42);
  if (v13 == -1)
  {
    if (!*(_WORD *)(a1 + 30)) {
      goto LABEL_39;
    }
    size_t v14 = GetExtraFieldWithSignature(a1 + *(unsigned __int16 *)(a1 + 28) + 46, *(unsigned __int16 *)(a1 + 30), &kZip64ExtraFieldSignature);
    if (!v14) {
      goto LABEL_39;
    }
    int v16 = *(_DWORD *)(a1 + 20);
    int v15 = *(_DWORD *)(a1 + 24);
    if (v15 == -1) {
      unsigned int v17 = 16;
    }
    else {
      unsigned int v17 = 8;
    }
    if (v16 == -1) {
      v17 += 8;
    }
    if (v14[1] >= v17)
    {
      LODWORD(v18) = 8 * (v15 == -1);
      if (v16 == -1) {
        uint64_t v18 = (v18 + 8);
      }
      else {
        uint64_t v18 = v18;
      }
      uint64_t v13 = *(void *)((char *)v14 + v18 + 4);
    }
    else
    {
LABEL_39:
      uint64_t v13 = 0xFFFFFFFFLL;
    }
  }
  *((void *)v2 + 8) = v13;
  BOOL v19 = malloc_type_calloc(*(unsigned __int16 *)(a1 + 28) + 1, 1uLL, 0xB4C978A6uLL);
  memcpy(v19, (const void *)(a1 + 46), *(unsigned __int16 *)(a1 + 28));
  *((void *)v2 + 9) = v19;
  CFNumberRef v20 = malloc_type_malloc(*(unsigned __int16 *)(a1 + 30), 0x955D5096uLL);
  *((void *)v2 + 12) = v20;
  memcpy(v20, (const void *)(a1 + 46 + *(unsigned __int16 *)(a1 + 28)), *(unsigned __int16 *)(a1 + 30));
  CFNumberRef v21 = malloc_type_malloc(*(unsigned __int16 *)(a1 + 32), 0x5D785B4EuLL);
  *((void *)v2 + 10) = v21;
  memcpy(v21, (const void *)(a1 + 46 + *(unsigned __int16 *)(a1 + 32) + *(unsigned __int16 *)(a1 + 30)), *(unsigned __int16 *)(a1 + 32));
  return v2;
}

void DestroyMutableCDRecord(void **a1)
{
  if (a1)
  {
    free(a1[9]);
    free(a1[12]);
    free(a1[10]);
    free(a1);
  }
}

uint64_t _ReadOriginalCentralDirectory(uint64_t a1, void ****a2, size_t *a3, void *a4, size_t *a5, size_t *a6, _WORD *a7, _WORD *a8)
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  size_t v11 = *(void *)(a1 + 16);
  int v62 = (void ***)malloc_type_calloc(v11, 8uLL, 0x2004093837F09uLL);
  CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 0);
  CFDictionaryRef theDict = CFDictionaryCreateMutable(v12, 0, 0, 0);
  uint64_t v14 = 0;
  size_t v15 = 0;
  uint32_t v61 = a5;
  *a5 = -1;
  compression_algorithm v55 = a6;
  *a6 = -1;
  do
  {
    while (1)
    {
      if (v15 >= v11)
      {
        size_t v37 = SZGetLoggingHandle();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          LODWORD(context) = 134217984;
          *(void *)((char *)&context + 4) = v11;
          _os_log_error_impl(&dword_1DD5BF000, v37, OS_LOG_TYPE_ERROR, "Too many CD records found in file; expected %llu",
            (uint8_t *)&context,
            0xCu);
        }
        size_t v38 = v62;
        if (v11) {
          goto LABEL_54;
        }
        goto LABEL_58;
      }
      off_t v16 = *(void *)(a1 + 48);
      if (v16 == -1)
      {
        off_t v16 = *(void *)(a1 + 32);
        *(void *)(a1 + 48) = v16;
        *(void *)(a1 + 24) = 0;
      }
      if (fseeko(*(FILE **)a1, v16, 0))
      {
        CFDictionaryRef v39 = Mutable;
        __int16 v40 = SZGetLoggingHandle();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          LOWORD(context) = 0;
          _os_log_error_impl(&dword_1DD5BF000, v40, OS_LOG_TYPE_ERROR, "Failed to seek to central directory record", (uint8_t *)&context, 2u);
        }
        uint64_t v18 = 0;
LABEL_49:
        int v51 = 4;
LABEL_50:
        size_t v38 = v62;
LABEL_51:
        *(void *)(a1 + 48) = -1;
        *(void *)(a1 + 24) = 0;
        free(v18);
        uint64_t v52 = SZGetLoggingHandle();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          LODWORD(context) = 67109120;
          DWORD1(context) = v51;
          _os_log_error_impl(&dword_1DD5BF000, v52, OS_LOG_TYPE_ERROR, "CopyNextCDRecord returned error %d", (uint8_t *)&context, 8u);
        }
        CFDictionaryRef Mutable = v39;
LABEL_54:
        uint64_t v53 = v38;
        do
        {
          if (*v53) {
            DestroyMutableCDRecord(*v53);
          }
          ++v53;
          --v11;
        }
        while (v11);
LABEL_58:
        free(v38);
        uint64_t v36 = 0;
        goto LABEL_59;
      }
      unsigned int v17 = malloc_type_malloc(0x2EuLL, 0x10000401E1C372CuLL);
      if (!v17)
      {
        CFDictionaryRef v39 = Mutable;
        unint64_t v41 = SZGetLoggingHandle();
        if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
LABEL_44:
          uint64_t v18 = 0;
          int v51 = 3;
          goto LABEL_50;
        }
        LOWORD(context) = 0;
        unint64_t v42 = "Failed to allocate record";
LABEL_61:
        _os_log_error_impl(&dword_1DD5BF000, v41, OS_LOG_TYPE_ERROR, v42, (uint8_t *)&context, 2u);
        goto LABEL_44;
      }
      uint64_t v18 = v17;
      if (fread(v17, 1uLL, 0x2EuLL, *(FILE **)a1) != 46)
      {
        unsigned int v43 = SZGetLoggingHandle();
        size_t v38 = v62;
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          CFDictionaryRef v39 = Mutable;
          LOWORD(context) = 0;
          unint64_t v44 = "Failed to read central directory record";
LABEL_63:
          v49 = v43;
          uint32_t v50 = 2;
          goto LABEL_64;
        }
LABEL_46:
        CFDictionaryRef v39 = Mutable;
LABEL_47:
        free(v18);
        uint64_t v18 = 0;
        int v51 = 4;
        goto LABEL_51;
      }
      if (*v18 != 33639248)
      {
        unint64_t v45 = SZGetLoggingHandle();
        size_t v38 = v62;
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          CFDictionaryRef v39 = Mutable;
          int v46 = *((unsigned __int8 *)v18 + 1);
          int v47 = *((unsigned __int8 *)v18 + 2);
          int v48 = *((unsigned __int8 *)v18 + 3);
          *(void *)&long long context = __PAIR64__(*(unsigned __int8 *)v18, 67109888);
          WORD4(context) = 1024;
          *(_DWORD *)((char *)&context + 10) = v46;
          HIWORD(context) = 1024;
          int v65 = v47;
          __int16 v66 = 1024;
          int v67 = v48;
          unint64_t v44 = "Found invalid central directory record with signature 0x%02hhx%02hhx%02hhx%02hhx";
          v49 = v45;
          uint32_t v50 = 26;
LABEL_64:
          _os_log_error_impl(&dword_1DD5BF000, v49, OS_LOG_TYPE_ERROR, v44, (uint8_t *)&context, v50);
          goto LABEL_47;
        }
        goto LABEL_46;
      }
      size_t v19 = *((unsigned __int16 *)v18 + 15)
          + (unint64_t)*((unsigned __int16 *)v18 + 14)
          + *((unsigned __int16 *)v18 + 16);
      CFNumberRef v20 = reallocf(v18, v19 + 46);
      if (!v20)
      {
        CFDictionaryRef v39 = Mutable;
        unint64_t v41 = SZGetLoggingHandle();
        if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
          goto LABEL_44;
        }
        LOWORD(context) = 0;
        unint64_t v42 = "Failed to allocate full central directory record";
        goto LABEL_61;
      }
      uint64_t v18 = v20;
      if (v19 != fread((char *)v20 + 46, 1uLL, v19, *(FILE **)a1))
      {
        unsigned int v43 = SZGetLoggingHandle();
        size_t v38 = v62;
        if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
          goto LABEL_46;
        }
        CFDictionaryRef v39 = Mutable;
        LOWORD(context) = 0;
        unint64_t v44 = "Failed to read in variable-length portion of central directory record";
        goto LABEL_63;
      }
      off_t v21 = ftello(*(FILE **)a1);
      *(void *)(a1 + 48) = v21;
      off_t v22 = *(void *)(a1 + 40) + *(void *)(a1 + 32);
      if (v22 == v21)
      {
        *(void *)(a1 + 48) = -1;
        *(void *)(a1 + 24) = 0;
        MutableCDRecord = CreateMutableCDRecord((uint64_t)v18);
        char v24 = 1;
      }
      else
      {
        if (v21 > v22)
        {
          CFDictionaryRef v39 = Mutable;
          goto LABEL_49;
        }
        unint64_t v25 = *(void *)(a1 + 16);
        unint64_t v26 = *(void *)(a1 + 24) + 1;
        *(void *)(a1 + 24) = v26;
        if (v26 > v25) {
          __assert_rtn("CopyNextCDRecord", "ParseZipFile.c", 496, "ctx->cd_records_processed <= ctx->total_cd_records");
        }
        MutableCDRecord = CreateMutableCDRecord((uint64_t)v18);
        char v24 = 0;
      }
      free(v18);
      uInt v27 = (const char *)*((void *)MutableCDRecord + 9);
      if (!strcmp("META-INF/", v27))
      {
        uint64_t v28 = v61;
LABEL_24:
        *uint64_t v28 = v15;
        break;
      }
      if (!strcmp("mimetype", v27))
      {
        uint64_t v28 = v55;
        goto LABEL_24;
      }
      if (strcmp("META-INF/com.apple.ZipMetadata.plist", v27) && strcmp("META-INF/com.apple.FixedZipMetadata.bin", v27)) {
        break;
      }
      DestroyMutableCDRecord((void **)MutableCDRecord);
      --v11;
      if (v24) {
        goto LABEL_28;
      }
    }
    v62[v15++] = (void **)MutableCDRecord;
    unint64_t v29 = (unsigned __int16)MutableCDRecord[12];
    CFDictionaryRef v30 = Mutable;
    if (*((unsigned char *)MutableCDRecord + 26)) {
      CFDictionaryRef Mutable = theDict;
    }
    unint64_t v31 = (char *)CFDictionaryGetValue(Mutable, (const void *)(unsigned __int16)MutableCDRecord[12]) + 1;
    unint64_t v32 = Mutable;
    CFDictionaryRef Mutable = v30;
    CFDictionarySetValue(v32, (const void *)v29, v31);
    v14 += *((void *)MutableCDRecord + 5);
  }
  while ((v24 & 1) == 0);
LABEL_28:
  if (v15 != v11) {
    __assert_rtn("_ReadOriginalCentralDirectory", "ConvertZipToStream.c", 245, "cdIndex == origCDRecordCount");
  }
  long long context = 0uLL;
  CFDictionaryApplyFunction(Mutable, (CFDictionaryApplierFunction)_FindHighestCount, &context);
  CFDictionaryRef v33 = Mutable;
  __int16 v34 = WORD4(context);
  long long context = 0uLL;
  CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_FindHighestCount, &context);
  __int16 v35 = WORD4(context);
  *a2 = v62;
  *a3 = v11;
  *a4 = v14;
  *a7 = v34;
  CFDictionaryRef Mutable = v33;
  *a8 = v35;
  uint64_t v36 = 1;
LABEL_59:
  CFRelease(Mutable);
  CFRelease(theDict);
  return v36;
}

BOOL _GetCDIndexOfBundleExecutableForInfoPlist(FILE **a1, uint64_t a2, unint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  int v5 = *(char **)(a4 + 72);
  int v69 = 0;
  CFErrorRef error = 0;
  size_t v6 = *(void *)(a4 + 40);
  if (v6 < 0x40000001)
  {
    bytes = (UInt8 *)malloc_type_malloc(*(void *)(a4 + 40), 0x1CCC7DF3uLL);
    off_t v21 = CopyLocalFileHeader(a1, a4, &v69);
    if (!v21)
    {
      uint64_t v28 = SZGetLoggingHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v71 = v5;
        __int16 v72 = 1024;
        LODWORD(v73) = v69;
        _os_log_error_impl(&dword_1DD5BF000, v28, OS_LOG_TYPE_ERROR, "Failed to get local file record for info plist %s: %d", buf, 0x12u);
      }
      int v9 = 0;
      unsigned int v10 = 0;
      goto LABEL_43;
    }
    unsigned int v10 = (void **)v21;
    off_t v22 = (uint64_t *)OpenLocalFile((uint64_t)a1, a4, *((char **)v21 + 7), v21[32], 0, &v69);
    int v9 = (compression_stream *)v22;
    if (v22) {
      BOOL v23 = v69 == 0;
    }
    else {
      BOOL v23 = 0;
    }
    if (!v23)
    {
      char v24 = SZGetLoggingHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        unint64_t v25 = "Failed to open plist file in zip archive";
        unint64_t v26 = v24;
        uint32_t v27 = 2;
LABEL_21:
        _os_log_error_impl(&dword_1DD5BF000, v26, OS_LOG_TYPE_ERROR, v25, buf, v27);
        goto LABEL_43;
      }
      goto LABEL_43;
    }
    size_t v67 = 0;
    int v29 = ReadLocalFileData(v22, bytes, v6, &v67);
    if (v29 != 2)
    {
      int v36 = v29;
      size_t v37 = SZGetLoggingHandle();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v71 = v5;
        __int16 v72 = 1024;
        LODWORD(v73) = v36;
        unint64_t v25 = "Failed to read file data for info plist %s: %d";
        unint64_t v26 = v37;
        uint32_t v27 = 18;
        goto LABEL_21;
      }
LABEL_43:
      CFDataRef v11 = 0;
LABEL_44:
      CFDictionaryRef v12 = 0;
LABEL_45:
      CFStringRef v13 = 0;
      CFStringRef v14 = 0;
      goto LABEL_46;
    }
    int v30 = CloseLocalFile(v9);
    int v69 = v30;
    if (v30)
    {
      int v31 = v30;
      unint64_t v32 = SZGetLoggingHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v71) = v31;
        CFDictionaryRef v33 = "Failed to close local file: %d";
        __int16 v34 = v32;
        uint32_t v35 = 8;
LABEL_41:
        _os_log_error_impl(&dword_1DD5BF000, v34, OS_LOG_TYPE_ERROR, v33, buf, v35);
        goto LABEL_42;
      }
      goto LABEL_42;
    }
    size_t v38 = v67;
    if (v67 != v6)
    {
      int v51 = SZGetLoggingHandle();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v71 = v5;
        __int16 v72 = 2048;
        size_t v73 = v38;
        __int16 v74 = 2048;
        size_t v75 = v6;
        CFDictionaryRef v33 = "Failed to read full info plist %s; read %ld bytes; expected %lld bytes";
        __int16 v34 = v51;
        uint32_t v35 = 32;
        goto LABEL_41;
      }
LABEL_42:
      int v9 = 0;
      goto LABEL_43;
    }
    CFAllocatorRef v39 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFDataRef v40 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], bytes, v6, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
    if (!v40)
    {
      uint64_t v52 = SZGetLoggingHandle();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        CFDictionaryRef v33 = "Failed to create data from uncompressed bytes";
        __int16 v34 = v52;
        uint32_t v35 = 2;
        goto LABEL_41;
      }
      goto LABEL_42;
    }
    CFDataRef v11 = v40;
    CFDictionaryRef v41 = (const __CFDictionary *)CFPropertyListCreateWithData(v39, v40, 0, 0, &error);
    if (!v41)
    {
      int v54 = SZGetLoggingHandle();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v71 = v5;
        _os_log_error_impl(&dword_1DD5BF000, v54, OS_LOG_TYPE_ERROR, "Failed to deserialize Info plist %s", buf, 0xCu);
      }
      int v9 = 0;
      goto LABEL_44;
    }
    CFDictionaryRef v12 = v41;
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (TypeID == CFGetTypeID(v12))
    {
      unsigned int v43 = strrchr(v5, 47);
      if (v43)
      {
        char *v43 = 0;
        unint64_t v44 = v43;
        CFStringRef v45 = CFStringCreateWithFileSystemRepresentation(v39, v5);
        char *v44 = 47;
        if (v45)
        {
          CFStringRef v14 = v45;
          Value = CFDictionaryGetValue(v12, (const void *)*MEMORY[0x1E4F1CFF0]);
          if (Value)
          {
            int v47 = Value;
            CFTypeID v64 = CFStringGetTypeID();
            if (v64 == CFGetTypeID(v47))
            {
              CFStringRef v48 = CFStringCreateWithFormat(v39, 0, @"%@/%@", v14, v47);
              if (v48)
              {
                CFStringRef v13 = v48;
                if (CFStringGetFileSystemRepresentation(v48, (char *)buf, 1024))
                {
                  uint64_t v49 = 0;
                  BOOL v15 = 1;
                  while (1)
                  {
                    uint64_t v50 = *(void *)(a2 + 8 * v49);
                    if (v50)
                    {
                      if (!strcmp(*(const char **)(v50 + 72), (const char *)buf)) {
                        break;
                      }
                    }
                    BOOL v15 = ++v49 < a3;
                    if (a3 == v49) {
                      goto LABEL_82;
                    }
                  }
                  uint64_t v63 = v49;
                  int v9 = 0;
                  *a5 = v63;
                  goto LABEL_47;
                }
                int v62 = SZGetLoggingHandle();
                if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)__int16 v66 = 0;
                  _os_log_error_impl(&dword_1DD5BF000, v62, OS_LOG_TYPE_ERROR, "Failed to convert CF executable path string to C string", v66, 2u);
                }
LABEL_82:
                int v9 = 0;
LABEL_46:
                BOOL v15 = 0;
LABEL_47:
                unsigned int v8 = bytes;
                goto LABEL_48;
              }
              uint32_t v61 = SZGetLoggingHandle();
              if (!os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
              {
LABEL_79:
                int v9 = 0;
                CFStringRef v13 = 0;
                goto LABEL_46;
              }
              *(_WORD *)buf = 0;
              unint64_t v58 = "Failed to construct path to bundle executable";
              int v59 = v61;
              uint32_t v60 = 2;
LABEL_77:
              _os_log_error_impl(&dword_1DD5BF000, v59, OS_LOG_TYPE_ERROR, v58, buf, v60);
              goto LABEL_79;
            }
            uint64_t v57 = SZGetLoggingHandle();
            if (!os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
              goto LABEL_79;
            }
            *(_DWORD *)buf = 136315138;
            uint64_t v71 = v5;
            unint64_t v58 = "CFBundleExecutable was not a CFString for plist %s";
          }
          else
          {
            uint64_t v57 = SZGetLoggingHandle();
            if (!os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
              goto LABEL_79;
            }
            *(_DWORD *)buf = 136315138;
            uint64_t v71 = v5;
            unint64_t v58 = "Plist %s did not contain a value for kCFBundleExecutableKey";
          }
          int v59 = v57;
          uint32_t v60 = 12;
          goto LABEL_77;
        }
        compression_algorithm v55 = SZGetLoggingHandle();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          uint64_t v71 = v5;
          int v56 = "Failed to create CF string from plist path %s";
          goto LABEL_70;
        }
LABEL_71:
        int v9 = 0;
        goto LABEL_45;
      }
      compression_algorithm v55 = SZGetLoggingHandle();
      if (!os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
        goto LABEL_71;
      }
      *(_DWORD *)buf = 136315138;
      uint64_t v71 = v5;
      int v56 = "Failed to find last slash in plist path %s";
    }
    else
    {
      compression_algorithm v55 = SZGetLoggingHandle();
      if (!os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
        goto LABEL_71;
      }
      *(_DWORD *)buf = 136315138;
      uint64_t v71 = v5;
      int v56 = "Plist %s did not contain a dictionary";
    }
LABEL_70:
    _os_log_error_impl(&dword_1DD5BF000, v55, OS_LOG_TYPE_ERROR, v56, buf, 0xCu);
    goto LABEL_71;
  }
  uint64_t v7 = SZGetLoggingHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v71 = v5;
    _os_log_error_impl(&dword_1DD5BF000, v7, OS_LOG_TYPE_ERROR, "Found plist at %s greater than 1 GB in size; something must be wrong.",
      buf,
      0xCu);
  }
  unsigned int v8 = 0;
  int v9 = 0;
  unsigned int v10 = 0;
  CFDataRef v11 = 0;
  CFDictionaryRef v12 = 0;
  CFStringRef v13 = 0;
  CFStringRef v14 = 0;
  BOOL v15 = 0;
LABEL_48:
  free(v8);
  DestroyMutableLocalFileRecord(v10);
  if (v11) {
    CFRelease(v11);
  }
  if (v12) {
    CFRelease(v12);
  }
  if (error) {
    CFRelease(error);
  }
  CFErrorRef error = 0;
  if (v14) {
    CFRelease(v14);
  }
  if (v13) {
    CFRelease(v13);
  }
  if (v9) {
    CloseLocalFile(v9);
  }
  return v15;
}

uint64_t _SortZipEntries(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  if (!(*a1 | *a2)) {
    return 0;
  }
  if (v2) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = v3 == 0;
  }
  if (!v4) {
    return 0xFFFFFFFFLL;
  }
  if (v2) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5) {
    return 1;
  }
  size_t v6 = *(const char **)(v2 + 72);
  uint64_t v7 = *(const char **)(v3 + 72);
  uint64_t result = _SortLateIfPrefix(v6, v7, "__MACOSX/", 9uLL);
  if (!result)
  {
    unsigned int v8 = rindex(v6, 47);
    int v9 = rindex(v7, 47);
    unsigned int v10 = v9;
    if (v8) {
      *unsigned int v8 = 0;
    }
    if (v9) {
      char *v9 = 0;
    }
    if (strcmp(v6, v7)
      || (v8 ? (CFDataRef v11 = v8 + 1) : (CFDataRef v11 = v6),
          v10 ? (CFDictionaryRef v12 = v10 + 1) : (CFDictionaryRef v12 = v7),
          uint64_t result = _SortLateIfPrefix(v11, v12, "._", 2uLL),
          !result))
    {
      if (v8) {
        *unsigned int v8 = 47;
      }
      if (v10) {
        *unsigned int v10 = 47;
      }
      return strcmp(v6, v7);
    }
  }
  return result;
}

uint64_t _SortLateIfPrefix(const char *a1, const char *a2, char *__s2, size_t __n)
{
  BOOL v7 = strncmp(a1, __s2, __n) == 0;
  int v8 = strncmp(a2, __s2, __n);
  if (v8) {
    int v9 = 1;
  }
  else {
    int v9 = v7;
  }
  unsigned int v10 = v9 - 1;
  if (v7 && v8 != 0) {
    return 1;
  }
  else {
    return v10;
  }
}

void _AddIndexToDictionary(const void *a1, uint64_t a2, __CFDictionary *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a2 != -1)
  {
    if (a2 < 0)
    {
      BOOL v7 = SZGetLoggingHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)int v8 = 134217984;
        *(void *)&v8[4] = a2;
        _os_log_error_impl(&dword_1DD5BF000, v7, OS_LOG_TYPE_ERROR, "can't represent index %llu as an SInt64\n", v8, 0xCu);
      }
    }
    else
    {
      *(void *)int v8 = a2;
      CFNumberRef v6 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt64Type, v8);
      CFDictionarySetValue(a3, a1, v6);
      CFRelease(v6);
    }
  }
}

uint64_t _Prescan(char *a1, const __CFArray *a2, _WORD *a3, _WORD *a4, void *a5, void *a6)
{
  uint64_t v114 = *MEMORY[0x1E4F143B8];
  v106[0] = a1;
  v106[1] = 0;
  CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 0);
  CFDictionaryRef v13 = CFDictionaryCreateMutable(v11, 0, 0, 0);
  size_t v102 = strlen(a1);
  CFStringRef v14 = fts_open(v106, 84, 0);
  if (v14)
  {
    v98 = a4;
    uint64_t v99 = 0;
    uint64_t v100 = 0;
    key = (void *)*MEMORY[0x1E4F1CFF0];
    CFAllocatorRef bytesDeallocator = (const __CFAllocator *)*MEMORY[0x1E4F1CFA0];
    while (1)
    {
      do
      {
        while (1)
        {
          BOOL v15 = fts_read(v14);
          if (!v15)
          {
            if (*__error())
            {
              uint64_t v70 = SZGetLoggingHandle();
              if (!os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
                goto LABEL_103;
              }
              uint64_t v71 = __error();
              __int16 v72 = strerror(*v71);
              *(_DWORD *)__str = 136315138;
              *(void *)&__str[4] = v72;
              int v69 = "fts_read returned NULL and set errno: %s";
              size_t v73 = v70;
              uint32_t v74 = 12;
              goto LABEL_97;
            }
            *(void *)__str = 0;
            *(void *)&__str[8] = 0;
            CFDictionaryApplyFunction(Mutable, (CFDictionaryApplierFunction)_FindHighestCount, __str);
            size_t v77 = a6;
            __int16 v78 = *(_WORD *)&__str[8];
            *(void *)__str = 0;
            *(void *)&__str[8] = 0;
            CFDictionaryApplyFunction(v13, (CFDictionaryApplierFunction)_FindHighestCount, __str);
            __int16 v79 = *(_WORD *)&__str[8];
            *a3 = v78;
            _WORD *v98 = v79;
            *a5 = v100;
            *size_t v77 = v99;
            unint64_t v80 = SZGetLoggingHandle();
            if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)__str = 134217984;
              *(void *)&__str[4] = v100;
              _os_log_debug_impl(&dword_1DD5BF000, v80, OS_LOG_TYPE_DEBUG, "Prescan says record count should be %llu", (uint8_t *)__str, 0xCu);
            }
            uint64_t v81 = 1;
            if (Mutable) {
              goto LABEL_104;
            }
            goto LABEL_105;
          }
          off_t v16 = v15;
          unsigned int fts_info = v15->fts_info;
          if (fts_info > 0xD) {
            goto LABEL_102;
          }
          if (((1 << fts_info) & 0x3102) != 0) {
            break;
          }
          if (fts_info != 6)
          {
            if (((1 << fts_info) & 0x490) != 0)
            {
              __int16 v66 = SZGetLoggingHandle();
              if (!os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
                goto LABEL_103;
              }
              fts_path = v16->fts_path;
              uint64_t v76 = strerror(v16->fts_errno);
              *(_DWORD *)__str = 136315394;
              *(void *)&__str[4] = fts_path;
              *(_WORD *)&__str[12] = 2080;
              *(void *)&__str[14] = v76;
              int v69 = "fts_read gave error for file %s: %s";
              goto LABEL_96;
            }
LABEL_102:
            uint64_t v82 = SZGetLoggingHandle();
            if (!os_log_type_enabled(v82, OS_LOG_TYPE_ERROR)) {
              goto LABEL_103;
            }
            int v84 = v16->fts_info;
            *(_DWORD *)__str = 67109120;
            *(_DWORD *)&__str[4] = v84;
            int v69 = "fts_read returned unhandled fts_info value %d";
            size_t v73 = v82;
            uint32_t v74 = 8;
            goto LABEL_97;
          }
        }
      }
      while (!v15->fts_level);
      buffer = _CopyArchivePath((uint64_t)v15->fts_path, v102, v15->fts_statp->st_mode);
      if (_IsExcludedFileName(buffer))
      {
        uint64_t v18 = buffer;
        goto LABEL_45;
      }
      CFDictionaryRef v93 = Mutable;
      int v94 = a6;
      int v19 = v16->fts_info;
      if (v19 == 1) {
        CFDictionaryRef Mutable = v13;
      }
      st_mode = (const void *)v16->fts_statp->st_mode;
      Value = (char *)CFDictionaryGetValue(Mutable, st_mode);
      CFDictionarySetValue(Mutable, st_mode, Value + 1);
      CFDictionaryRef v92 = v13;
      if (v19 != 1) {
        v99 += v16->fts_statp->st_size;
      }
      uint64_t v18 = buffer;
      CFStringRef v22 = CFStringCreateWithFileSystemRepresentation(v11, buffer);
      v115.length = CFArrayGetCount(a2);
      v115.location = 0;
      CFDictionaryRef Mutable = v93;
      a6 = v94;
      if (!CFArrayContainsValue(a2, v115, v22))
      {
        char v103 = 0;
        if (ZipStreamShouldOrderFileEarly(buffer, &v103))
        {
          CFArrayAppendValue(a2, v22);
          if (v103) {
            break;
          }
        }
      }
LABEL_42:
      if (v22) {
        CFRelease(v22);
      }
      ++v100;
      CFDictionaryRef v13 = v92;
LABEL_45:
      free(v18);
    }
    CFStringRef v89 = v22;
    bzero(__str, 0x400uLL);
    memset(&v105, 0, sizeof(v105));
    CFTypeRef v104 = 0;
    snprintf(__str, 0x400uLL, "%s/%s", a1, buffer);
    int v23 = open(__str, 0, 0);
    if (v23 < 0)
    {
      int v30 = SZGetLoggingHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        CFStringRef v48 = __error();
        uint64_t v49 = strerror(*v48);
        int buf = 136315394;
        off_t st_size = (off_t)__str;
        __int16 v109 = 2080;
        uint32_t v110 = v49;
        _os_log_error_impl(&dword_1DD5BF000, v30, OS_LOG_TYPE_ERROR, "Failed to open Info.plist at path %s: %s", (uint8_t *)&buf, 0x16u);
      }
      CFStringRef v90 = 0;
      CFStringRef v31 = 0;
      uint64_t v18 = buffer;
      goto LABEL_35;
    }
    int v88 = v23;
    if (fstat(v23, &v105))
    {
      char v24 = SZGetLoggingHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        unint64_t v25 = __error();
        unint64_t v26 = strerror(*v25);
        int buf = 136315394;
        off_t st_size = (off_t)__str;
        __int16 v109 = 2080;
        uint32_t v110 = v26;
        uint32_t v27 = v24;
        uint64_t v28 = "Failed to stat Info.plist at path %s: %s";
        uint32_t v29 = 22;
LABEL_28:
        _os_log_error_impl(&dword_1DD5BF000, v27, OS_LOG_TYPE_ERROR, v28, (uint8_t *)&buf, v29);
        goto LABEL_29;
      }
      goto LABEL_29;
    }
    if (v105.st_size >= 524288000)
    {
      unint64_t v32 = SZGetLoggingHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        int buf = 134217984;
        off_t st_size = v105.st_size;
        uint32_t v27 = v32;
        uint64_t v28 = "Found Info.plist but it was too big (larger than 500 MB): was %lld bytes";
        uint32_t v29 = 12;
        goto LABEL_28;
      }
LABEL_29:
      CFDictionaryRef v33 = 0;
      CFDataRef v34 = 0;
      CFStringRef v86 = 0;
      CFDictionaryRef cf = 0;
      CFStringRef v90 = 0;
      int v35 = v88;
LABEL_30:
      close(v35);
      free(v33);
      uint64_t v18 = buffer;
      if (v34) {
        CFRelease(v34);
      }
      if (cf) {
        CFRelease(cf);
      }
      CFStringRef v31 = v86;
LABEL_35:
      if (v104) {
        CFRelease(v104);
      }
      CFTypeRef v104 = 0;
      if (v31) {
        CFRelease(v31);
      }
      if (v90) {
        CFRelease(v90);
      }
      CFStringRef v22 = v89;
      goto LABEL_42;
    }
    int v36 = malloc_type_malloc(v105.st_size, 0xB9D05B6CuLL);
    off_t v37 = v105.st_size;
    if (v37 != read(v88, v36, v105.st_size))
    {
      int v47 = SZGetLoggingHandle();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        off_t v54 = v105.st_size;
        compression_algorithm v55 = __error();
        int v56 = strerror(*v55);
        int buf = 134218498;
        off_t st_size = v54;
        a6 = v94;
        __int16 v109 = 2080;
        uint32_t v110 = __str;
        __int16 v111 = 2080;
        v112 = v56;
        _os_log_error_impl(&dword_1DD5BF000, v47, OS_LOG_TYPE_ERROR, "Failed to read %lld bytes from Info.plist at path %s: %s", (uint8_t *)&buf, 0x20u);
      }
      CFStringRef v86 = 0;
      CFDictionaryRef cf = 0;
      CFStringRef v90 = 0;
      int v35 = v88;
      CFDictionaryRef v33 = v36;
      CFDataRef v34 = 0;
      goto LABEL_30;
    }
    v85 = v36;
    CFDataRef v38 = CFDataCreateWithBytesNoCopy(v11, (const UInt8 *)v36, v105.st_size, bytesDeallocator);
    if (v38)
    {
      CFDataRef v34 = v38;
      CFDictionaryRef v39 = (const __CFDictionary *)CFPropertyListCreateWithData(v11, v38, 0, 0, (CFErrorRef *)&v104);
      if (v39)
      {
        CFDictionaryRef v40 = v39;
        CFTypeRef TypeID = (CFTypeRef)CFDictionaryGetTypeID();
        CFDictionaryRef cf = v40;
        if (TypeID == (CFTypeRef)CFGetTypeID(v40))
        {
          CFDictionaryRef v41 = strrchr(buffer, 47);
          if (v41)
          {
            unint64_t v42 = v41;
            char *v41 = 0;
            CFStringRef v43 = CFStringCreateWithFileSystemRepresentation(v11, buffer);
            *unint64_t v42 = 47;
            CFStringRef v86 = v43;
            if (!v43)
            {
              uint64_t v57 = SZGetLoggingHandle();
              if (!os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
              {
                CFStringRef v86 = 0;
                goto LABEL_80;
              }
              int buf = 136315138;
              off_t st_size = (off_t)__str;
              _os_log_error_impl(&dword_1DD5BF000, v57, OS_LOG_TYPE_ERROR, "Failed to create CF string from plist path %s", (uint8_t *)&buf, 0xCu);
              CFStringRef v86 = 0;
LABEL_86:
              CFStringRef v90 = 0;
              CFDictionaryRef Mutable = v93;
              goto LABEL_82;
            }
            unint64_t v44 = CFDictionaryGetValue(v40, key);
            if (v44)
            {
              CFStringRef v45 = v44;
              CFTypeID v46 = CFStringGetTypeID();
              if (v46 == CFGetTypeID(v45))
              {
                CFStringRef v90 = CFStringCreateWithFormat(v11, 0, @"%@/%@", v86, v45);
                if (v90)
                {
                  CFArrayAppendValue(a2, v90);
LABEL_81:
                  CFDictionaryRef Mutable = v93;
LABEL_82:
                  a6 = v94;
                  goto LABEL_67;
                }
                int v65 = SZGetLoggingHandle();
                if (!os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
                {
LABEL_80:
                  CFStringRef v90 = 0;
                  goto LABEL_81;
                }
                LOWORD(buf) = 0;
                int v59 = v65;
                uint32_t v60 = "Failed to construct path to bundle executable";
                uint32_t v62 = 2;
                goto LABEL_77;
              }
              uint32_t v61 = SZGetLoggingHandle();
              if (!os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
                goto LABEL_80;
              }
              int buf = 136315138;
              off_t st_size = (off_t)__str;
              int v59 = v61;
              uint32_t v60 = "CFBundleExecutable was not a CFString for plist %s";
            }
            else
            {
              unint64_t v58 = SZGetLoggingHandle();
              if (!os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
                goto LABEL_80;
              }
              int buf = 136315138;
              off_t st_size = (off_t)__str;
              int v59 = v58;
              uint32_t v60 = "Plist %s did not contain a value for kCFBundleExecutableKey";
            }
            uint32_t v62 = 12;
LABEL_77:
            _os_log_error_impl(&dword_1DD5BF000, v59, OS_LOG_TYPE_ERROR, v60, (uint8_t *)&buf, v62);
            goto LABEL_86;
          }
          uint64_t v53 = SZGetLoggingHandle();
          if (!os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          {
            CFStringRef v86 = 0;
            CFStringRef v90 = 0;
            goto LABEL_67;
          }
          int buf = 136315138;
          off_t st_size = (off_t)buffer;
          uint64_t v63 = v53;
          CFTypeID v64 = "Failed to find last slash in plist path %s";
          goto LABEL_84;
        }
        uint64_t v52 = SZGetLoggingHandle();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          int buf = 136315138;
          off_t st_size = (off_t)__str;
          uint64_t v63 = v52;
          CFTypeID v64 = "Plist %s did not contain a dictionary";
LABEL_84:
          _os_log_error_impl(&dword_1DD5BF000, v63, OS_LOG_TYPE_ERROR, v64, (uint8_t *)&buf, 0xCu);
        }
LABEL_66:
        CFStringRef v86 = 0;
        CFStringRef v90 = 0;
LABEL_67:
        int v35 = v88;
        CFDictionaryRef v33 = v85;
        goto LABEL_30;
      }
      int v51 = SZGetLoggingHandle();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        int buf = 136315138;
        off_t st_size = (off_t)__str;
        _os_log_error_impl(&dword_1DD5BF000, v51, OS_LOG_TYPE_ERROR, "Failed to deserialize Info plist %s", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      uint64_t v50 = SZGetLoggingHandle();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_error_impl(&dword_1DD5BF000, v50, OS_LOG_TYPE_ERROR, "Failed to create data from malloc allocation", (uint8_t *)&buf, 2u);
      }
      CFDataRef v34 = 0;
    }
    CFDictionaryRef cf = 0;
    goto LABEL_66;
  }
  __int16 v66 = SZGetLoggingHandle();
  if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
  {
    size_t v67 = __error();
    uint64_t v68 = strerror(*v67);
    *(_DWORD *)__str = 136315394;
    *(void *)&__str[4] = a1;
    *(_WORD *)&__str[12] = 2080;
    *(void *)&__str[14] = v68;
    int v69 = "fts_open failed for path %s: %s";
LABEL_96:
    size_t v73 = v66;
    uint32_t v74 = 22;
LABEL_97:
    _os_log_error_impl(&dword_1DD5BF000, v73, OS_LOG_TYPE_ERROR, v69, (uint8_t *)__str, v74);
  }
LABEL_103:
  uint64_t v81 = 0;
  if (Mutable) {
LABEL_104:
  }
    CFRelease(Mutable);
LABEL_105:
  if (v13) {
    CFRelease(v13);
  }
  if (v14) {
    fts_close(v14);
  }
  return v81;
}

uint64_t _WriteLocalFile(const char *a1, const char *a2, size_t a3, int a4, void *a5, void *a6, __int16 a7, __int16 a8, uint64_t a9, uint64_t a10, unsigned __int16 a11, unsigned __int16 a12, CFMutableArrayRef theArray)
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  value = 0;
  CFNumberRef v20 = (void **)malloc_type_calloc(1uLL, 0x50uLL, 0x1010040BDAC2CBCuLL);
  off_t v21 = v20;
  int v59 = v20;
  *(_WORD *)CFNumberRef v20 = 20;
  v20[1] = a5;
  v20[2] = a6;
  int v22 = a4 & 0xF000;
  *((_WORD *)v20 + 12) = a7;
  *((_WORD *)v20 + 13) = a8;
  *((unsigned char *)v20 + 30) = v22 == 0x4000;
  if (v22 == 0x4000)
  {
    if (a4 != a12) {
      *((_WORD *)v20 + 14) = a4;
    }
  }
  else
  {
    if (a4 != a11) {
      *((_WORD *)v20 + 14) = a4;
    }
    if (v22 == 0x8000)
    {
      v20[5] = (void *)a3;
      v20[6] = (void *)a3;
    }
    else
    {
      v20[5] = 0;
      v20[6] = 0;
    }
  }
  *((_WORD *)v20 + 2) = 0;
  *((_DWORD *)v20 + 8) = 0;
  *((_WORD *)v20 + 1) |= 0x800u;
  CFStringRef v23 = CFStringCreateWithFileSystemRepresentation((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a2);
  if (!CFStringGetCString(v23, buffer, 1024, 0x8000100u))
  {
    unint64_t v32 = SZGetLoggingHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 136315138;
      uint64_t v61 = (uint64_t)a2;
      CFDictionaryRef v33 = "Failed to get path %s as UTF8 string";
      CFDataRef v34 = v32;
      uint32_t v35 = 12;
LABEL_51:
      _os_log_error_impl(&dword_1DD5BF000, v34, OS_LOG_TYPE_ERROR, v33, buf, v35);
      goto LABEL_21;
    }
    goto LABEL_21;
  }
  v21[7] = strdup(buffer);
  char v24 = (char *)malloc_type_calloc(1uLL, 0x68uLL, 0x1010040E435E96EuLL);
  if (!v24)
  {
    value = 0;
    int v36 = SZGetLoggingHandle();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int buf = 0;
      CFDictionaryRef v33 = "Failed to create mutable CD record from LF record";
      CFDataRef v34 = v36;
      uint32_t v35 = 2;
      goto LABEL_51;
    }
    goto LABEL_21;
  }
  unint64_t v25 = v24;
  *(_WORD *)char v24 = 798;
  *((_WORD *)v24 + 1) = *(_WORD *)v21;
  *((_DWORD *)v24 + 1) = *(_DWORD *)((char *)v21 + 2);
  *(_OWORD *)(v24 + 8) = *(_OWORD *)(v21 + 1);
  *((_WORD *)v24 + 12) = *((_WORD *)v21 + 14);
  v24[26] = *((unsigned char *)v21 + 30);
  *((_DWORD *)v24 + 7) = *((_DWORD *)v21 + 8);
  *((_OWORD *)v24 + 2) = *(_OWORD *)(v21 + 5);
  *((void *)v24 + 9) = strdup((const char *)v21[7]);
  value = v25;
  *((_WORD *)v25 + 12) = a4;
  if (v22 == 40960)
  {
    CFDictionaryRef v39 = a1;
    ssize_t v40 = readlink(a1, buffer, 0x400uLL);
    if (v40 < 0)
    {
      CFStringRef v45 = SZGetLoggingHandle();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        CFTypeID v46 = __error();
        int v47 = strerror(*v46);
        *(_DWORD *)int buf = 136315394;
        uint64_t v61 = (uint64_t)v39;
        __int16 v62 = 2080;
        size_t v63 = (size_t)v47;
        CFDictionaryRef v33 = "Failed to read symlink destination for file \"%s\": %s";
LABEL_47:
        CFDataRef v34 = v45;
        uint32_t v35 = 22;
        goto LABEL_51;
      }
LABEL_21:
      DestroyMutableLocalFileRecord(v21);
      goto LABEL_22;
    }
    v21[5] = (void *)v40;
    v21[6] = (void *)v40;
    int v28 = -1;
    uint64_t v31 = -1;
    int v30 = buffer;
    *((void *)v25 + 4) = v40;
    *((void *)v25 + 5) = v40;
  }
  else if (v22 == 0x8000)
  {
    if (a3)
    {
      unint64_t v26 = a1;
      int v27 = open(a1, 0, 0);
      if ((v27 & 0x80000000) == 0)
      {
        int v28 = v27;
        if (a3 == -1)
        {
          uint64_t v50 = SZGetLoggingHandle();
          if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          {
LABEL_53:
            close(v28);
            goto LABEL_21;
          }
          *(_DWORD *)int buf = 134218242;
          uint64_t v61 = -1;
          __int16 v62 = 2080;
          size_t v63 = (size_t)v26;
          int v51 = "File with size %lld is to big to map: %s";
          uint64_t v52 = v50;
          uint32_t v53 = 22;
        }
        else
        {
          uint32_t v29 = (char *)mmap(0, a3, 1, 1026, v27, 0);
          if (v29 != (char *)-1)
          {
            int v30 = v29;
            uint64_t v31 = (uint64_t)v29;
            goto LABEL_29;
          }
          off_t v54 = SZGetLoggingHandle();
          if (!os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
            goto LABEL_53;
          }
          compression_algorithm v55 = __error();
          int v56 = strerror(*v55);
          *(_DWORD *)int buf = 136315650;
          uint64_t v61 = (uint64_t)a1;
          __int16 v62 = 2048;
          size_t v63 = a3;
          __int16 v64 = 2080;
          int v65 = v56;
          int v51 = "Failed to map file \"%s\" of size %llu: %s";
          uint64_t v52 = v54;
          uint32_t v53 = 32;
        }
        _os_log_error_impl(&dword_1DD5BF000, v52, OS_LOG_TYPE_ERROR, v51, buf, v53);
        goto LABEL_53;
      }
      CFStringRef v45 = SZGetLoggingHandle();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        CFStringRef v48 = __error();
        uint64_t v49 = strerror(*v48);
        *(_DWORD *)int buf = 136315394;
        uint64_t v61 = (uint64_t)v26;
        __int16 v62 = 2080;
        size_t v63 = (size_t)v49;
        CFDictionaryRef v33 = "Failed to open file: \"%s\" : %s";
        goto LABEL_47;
      }
      goto LABEL_21;
    }
    buffer[0] = 0;
    int v28 = -1;
    uint64_t v31 = -1;
    int v30 = buffer;
  }
  else
  {
    int v30 = 0;
    int v28 = -1;
    uint64_t v31 = -1;
  }
LABEL_29:
  char v41 = ZipStreamWriteLocalFile(0, (uint64_t *)&value, &v59, (Bytef *)v30, 0, a11, a12, a9, a10);
  if (v41)
  {
    if (*(unsigned char *)(a10 + 49)) {
      DestroyMutableCDRecord((void **)value);
    }
    else {
      CFArrayAppendValue(theArray, value);
    }
    size_t v43 = a3;
  }
  else
  {
    unint64_t v42 = SZGetLoggingHandle();
    size_t v43 = a3;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      unint64_t v44 = v59[7];
      *(_DWORD *)int buf = 136315138;
      uint64_t v61 = (uint64_t)v44;
      _os_log_error_impl(&dword_1DD5BF000, v42, OS_LOG_TYPE_ERROR, "Failed to write local file named %s to archive", buf, 0xCu);
    }
  }
  if (v31 != -1) {
    munmap((void *)v31, v43);
  }
  if ((v28 & 0x80000000) == 0) {
    close(v28);
  }
  DestroyMutableLocalFileRecord(v59);
  if (v41)
  {
    uint64_t v37 = 1;
    if (!v23) {
      return v37;
    }
    goto LABEL_23;
  }
LABEL_22:
  DestroyMutableCDRecord((void **)value);
  uint64_t v37 = 0;
  if (v23) {
LABEL_23:
  }
    CFRelease(v23);
  return v37;
}

char *_CopyArchivePath(uint64_t a1, uint64_t a2, __int16 a3)
{
  if (*(unsigned char *)(a1 + a2) == 47) {
    uint64_t v3 = a2 + 1;
  }
  else {
    uint64_t v3 = a2;
  }
  CFNumberRef v6 = 0;
  BOOL v4 = (const char *)(a1 + v3);
  if ((a3 & 0xF000) == 0x4000)
  {
    asprintf(&v6, "%s/", v4);
    return v6;
  }
  else
  {
    return strdup(v4);
  }
}

uint64_t _IsExcludedFileName(char *__s2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (strcmp("META-INF/", __s2)
    && strcmp("META-INF/com.apple.ZipMetadata.plist", __s2)
    && strcmp("META-INF/com.apple.FixedZipMetadata.bin", __s2)
    && strcmp("mimetype", __s2))
  {
    return 0;
  }
  uint64_t v3 = SZGetLoggingHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 136315138;
    BOOL v5 = __s2;
    _os_log_debug_impl(&dword_1DD5BF000, v3, OS_LOG_TYPE_DEBUG, "Path %s is excluded", (uint8_t *)&v4, 0xCu);
  }
  return 1;
}

uint64_t _IsOrderedEarly(char *buffer, const __CFArray *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!a2) {
    return 0;
  }
  CFArrayRef v2 = a2;
  CFStringRef v4 = CFStringCreateWithFileSystemRepresentation((CFAllocatorRef)*MEMORY[0x1E4F1CF80], buffer);
  v10.length = CFArrayGetCount(v2);
  v10.location = 0;
  LODWORD(v2) = CFArrayContainsValue(v2, v10, v4);
  CFRelease(v4);
  if (!v2) {
    return 0;
  }
  BOOL v5 = SZGetLoggingHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315138;
    int v8 = buffer;
    _os_log_debug_impl(&dword_1DD5BF000, v5, OS_LOG_TYPE_DEBUG, "Path %s was ordered early", (uint8_t *)&v7, 0xCu);
  }
  return 1;
}

unint64_t _FindHighestCount(unint64_t result, unint64_t a2, unint64_t *a3)
{
  if (*a3 < a2)
  {
    *a3 = a2;
    a3[1] = result;
  }
  return result;
}

CFArrayRef SZArchiverCopyStatsKeys()
{
  uint64_t v0 = 0;
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v1 = &sStatsData;
  memset(v4, 0, sizeof(v4));
  do
  {
    CFArrayRef v2 = *v1;
    v1 += 5;
    *(void *)((char *)v4 + v0) = *v2;
    v0 += 8;
  }
  while (v0 != 208);
  return CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)v4, 26, MEMORY[0x1E4F1D510]);
}

CFArrayRef SZArchiverCopyStatsDescriptions()
{
  uint64_t v0 = 0;
  unint64_t v1 = 0;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  do
  {
    unint64_t Length = CFStringGetLength(*(&sStatsData)[v0]);
    if (Length > v1) {
      unint64_t v1 = Length;
    }
    v0 += 5;
  }
  while (v0 != 130);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  *(_OWORD *)values = 0u;
  uint64_t v3 = malloc_type_malloc(v1 + 4, 0x8911849FuLL);
  uint64_t v4 = 0;
  uint64_t v5 = &off_1E6CD1550;
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  do
  {
    int v7 = (CFStringRef *)*(v5 - 4);
    size_t v8 = v1 - CFStringGetLength(*v7) + 4;
    memset(v3, 32, v8);
    *((unsigned char *)v3 + v8) = 0;
    uint64_t v9 = "CFNumber:uint64_t";
    if (v4 == 13) {
      uint64_t v9 = "CFNumber:int64_t";
    }
    if (v4 == 14) {
      uint64_t v9 = "CFNumber:double";
    }
    if (v4 == 21) {
      uint64_t v9 = "CFBoolean     ";
    }
    CFRange v10 = *v5;
    v5 += 5;
    values[v4++] = (void *)CFStringCreateWithFormat(v6, 0, @"       %@%s%s\t%s", *v7, v3, v9, v10, values[0], values[1], v15, v16, v17, v18, v19, v20, v21, v22, v23, v24,
                             v25,
                             v26,
                             v27);
  }
  while (v4 != 26);
  CFArrayRef v11 = CFArrayCreate(v6, (const void **)values, 26, MEMORY[0x1E4F1D510]);
  for (uint64_t i = 0; i != 26; ++i)
    CFRelease(values[i]);
  free(v3);
  return v11;
}

uint64_t SZArchiverConvertZipArchiveToStreamable(const char *a1, unsigned __int8 *a2, const __CFDictionary *a3, CFDictionaryRef *a4)
{
  uint64_t v129 = *MEMORY[0x1E4F143B8];
  uint64_t v90 = 0;
  memset(v89, 0, sizeof(v89));
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  uint64_t v94 = 0;
  long long v92 = 0u;
  long long v93 = 0u;
  memset(v91, 0, sizeof(v91));
  uint64_t result = _UpgradeCallbacksToCurrent(a2, (uint64_t)v89);
  if (!result) {
    return result;
  }
  uint64_t result = _ConvertOptionsToConfiguration(a3, (uint64_t)v91);
  if (!result) {
    return result;
  }
  *((void *)&v91[0] + 1) = v89;
  memset(&v108, 0, sizeof(v108));
  if (!ZipStreamConfigureOutput(v89, SHIBYTE(v92))) {
    goto LABEL_29;
  }
  if (*(void *)&v91[0] && HIBYTE(v92))
  {
    size_t v8 = SZGetLoggingHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int buf = 0;
      _os_log_error_impl(&dword_1DD5BF000, v8, OS_LOG_TYPE_ERROR, "Ignoring hashed chunk size supplied because output seeking is disallowed.", buf, 2u);
    }
    *(void *)&v91[0] = 0;
  }
  if (lstat(a1, &v108))
  {
    uint64_t v9 = SZGetLoggingHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      CFRange v10 = __error();
      CFArrayRef v11 = strerror(*v10);
      *(_DWORD *)int buf = 136315394;
      uint64_t v126 = (uint64_t)a1;
      __int16 v127 = 2080;
      CFIndex v128 = (CFIndex)v11;
      CFDictionaryRef v12 = "Failed to stat %s : %s";
      CFDictionaryRef v13 = v9;
      uint32_t v14 = 22;
LABEL_28:
      _os_log_error_impl(&dword_1DD5BF000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
      goto LABEL_29;
    }
    goto LABEL_29;
  }
  if ((v108.st_mode & 0xF000) != 0x8000)
  {
    int v28 = SZGetLoggingHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 136315394;
      uint64_t v126 = (uint64_t)a1;
      __int16 v127 = 1024;
      LODWORD(v128) = v108.st_mode;
      CFDictionaryRef v12 = "Object at input path %s was not a file; mode 0%ho";
      CFDictionaryRef v13 = v28;
      uint32_t v14 = 18;
      goto LABEL_28;
    }
LABEL_29:
    uint64_t v16 = 0;
LABEL_30:
    CloseZipFile(v16);
    return 0;
  }
  long long v15 = OpenZipFile(a1, SBYTE14(v92));
  if (!v15)
  {
    uint32_t v29 = SZGetLoggingHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 136315138;
      uint64_t v126 = (uint64_t)a1;
      CFDictionaryRef v12 = "Failed to open zip file %s";
      CFDictionaryRef v13 = v29;
      uint32_t v14 = 12;
      goto LABEL_28;
    }
    goto LABEL_29;
  }
  uint64_t v16 = (uint64_t)v15;
  ZipStreamCallPreflightResultCallback(*((uint64_t *)&v91[0] + 1), *(void *)(v16 + 16), *(void *)(v16 + 8), v108.st_mode);
  uint64_t v123 = 0;
  size_t v124 = 0;
  int v121 = 0;
  v122 = 0;
  int v119 = 0;
  v120 = 0;
  uint64_t v117 = 0;
  v118 = 0;
  MutableLocalFileRecord = 0;
  uint64_t v116 = 0;
  size_t v113 = -1;
  size_t v114 = -1;
  int v112 = 0;
  if (!_ReadOriginalCentralDirectory(v16, &v122, &v124, &v123, &v114, &v113, (_WORD *)&v112 + 1, &v112))
  {
    CFArrayRef v23 = 0;
    uint64_t v21 = 0;
    goto LABEL_86;
  }
  unint64_t v17 = v124;
  size_t v18 = v114;
  uint64_t v19 = 1;
  if (v114 == -1) {
    uint64_t v19 = 2;
  }
  uint64_t v20 = v19 + v124;
  if (*(void *)&v91[0]) {
    uint64_t v21 = v20 + 1;
  }
  else {
    uint64_t v21 = v20;
  }
  CFDictionaryRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v124 + 3, 0);
  CFArrayRef v23 = Mutable;
  size_t v24 = v113;
  if (v113 != -1)
  {
    long long v25 = v122;
    CFArrayAppendValue(Mutable, v122[v113]);
    v25[v24] = 0;
  }
  if (v18 == -1)
  {
    CFIndex Count = CFArrayGetCount(v23);
    int v31 = time(0);
    int v32 = time(0);
    CDRecord = CreateCDRecord("META-INF/", 16877, v31, v32);
    MutableCDRecord = CreateMutableCDRecord((uint64_t)CDRecord);
    CFArrayAppendValue(v23, MutableCDRecord);
    LocalFileRecord = CreateLocalFileRecord((uint64_t)CDRecord);
    MutableLocalFileRecord = (void **)CreateMutableLocalFileRecord((uint64_t)LocalFileRecord);
    int v36 = LocalFileRecord;
    uint64_t v27 = Count;
    free(v36);
    free(CDRecord);
  }
  else
  {
    long long v26 = v122;
    CFArrayAppendValue(v23, v122[v18]);
    v26[v18] = 0;
    uint64_t v27 = -1;
  }
  unsigned int v87 = (unsigned __int16)v112;
  unsigned int v88 = HIWORD(v112);
  if (!ZipStreamConcoctStreamData(v21, v123, SHIWORD(v112), v112, (uint64_t)v91, &v121, &v120, &v119))
  {
    CFStringRef v45 = SZGetLoggingHandle();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int buf = 0;
      CFTypeID v46 = "Failed to concoct stream data";
LABEL_52:
      int v47 = v45;
      uint32_t v48 = 2;
LABEL_80:
      _os_log_error_impl(&dword_1DD5BF000, v47, OS_LOG_TYPE_ERROR, v46, buf, v48);
    }
LABEL_86:
    char v59 = 0;
    goto LABEL_87;
  }
  CFIndex v86 = CFArrayGetCount(v23);
  CFArrayAppendValue(v23, v121);
  int v121 = 0;
  CFIndex v85 = -1;
  if (*(void *)&v91[0] && !HIBYTE(v92))
  {
    if (!ZipStreamConcoctFixedStreamData((uint64_t)v91, &v118, &v117, (const Bytef **)&v116))
    {
      CFStringRef v45 = SZGetLoggingHandle();
      if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
        goto LABEL_86;
      }
      *(_WORD *)int buf = 0;
      CFTypeID v46 = "Failed to concoct fixed stream data";
      goto LABEL_52;
    }
    CFIndex v85 = CFArrayGetCount(v23);
    CFArrayAppendValue(v23, v118);
    v118 = 0;
  }
  uint64_t v37 = (const void **)v122;
  if (v17)
  {
    uint64_t v83 = v27;
    for (uint64_t i = 0; i != v17; ++i)
    {
      CFDictionaryRef v39 = v37[i];
      if (v39)
      {
        ssize_t v40 = (const char *)*((void *)v39 + 9);
        LOBYTE(v110) = 0;
        if (ZipStreamShouldOrderFileEarly(v40, &v110))
        {
          CFArrayAppendValue(v23, v37[i]);
          uint64_t v41 = (uint64_t)v37[i];
          v37[i] = 0;
          if ((_BYTE)v110)
          {
            __int16 v111 = 0;
            if (_GetCDIndexOfBundleExecutableForInfoPlist((FILE **)v16, (uint64_t)v37, v17, v41, &v111))
            {
              unint64_t v42 = v111;
              size_t v43 = v37[(void)v111];
              *((void *)&v102 + 1) = v43[5];
              CFArrayAppendValue(v23, v43);
              v37[(void)v42] = 0;
            }
            else
            {
              unint64_t v44 = SZGetLoggingHandle();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)int buf = 136315138;
                uint64_t v126 = (uint64_t)v40;
                _os_log_debug_impl(&dword_1DD5BF000, v44, OS_LOG_TYPE_DEBUG, "Failed to find executable for bundle Info.plist %s", buf, 0xCu);
              }
            }
          }
        }
      }
    }
    qsort(v37, v17, 8uLL, (int (__cdecl *)(const void *, const void *))_SortZipEntries);
    uint64_t v27 = v83;
    do
    {
      if (*v37)
      {
        CFArrayAppendValue(v23, *v37);
        *uint64_t v37 = 0;
      }
      ++v37;
      --v17;
    }
    while (v17);
  }
  else
  {
    qsort(v122, 0, 8uLL, (int (__cdecl *)(const void *, const void *))_SortZipEntries);
  }
  uint64_t v49 = SZGetLoggingHandle();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)int buf = 0;
    _os_log_debug_impl(&dword_1DD5BF000, v49, OS_LOG_TYPE_DEBUG, "Writing local files", buf, 2u);
  }
  if (v21 != CFArrayGetCount(v23))
  {
    uint64_t v57 = SZGetLoggingHandle();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      CFIndex v58 = CFArrayGetCount(v23);
      *(_DWORD *)int buf = 134218240;
      uint64_t v126 = v21;
      __int16 v127 = 2048;
      CFIndex v128 = v58;
      CFTypeID v46 = "Mismatched record count: expected %llu records, but we have %ld records";
      int v47 = v57;
      uint32_t v48 = 22;
      goto LABEL_80;
    }
    goto LABEL_86;
  }
  if (v21)
  {
    CFIndex v50 = 0;
    uint64_t v82 = v116;
    int v84 = v119;
    while (1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v23, v50);
      uint32_t v110 = 0;
      __int16 v111 = ValueAtIndex;
      int v109 = 0;
      uint64_t v52 = ValueAtIndex[9];
      uint32_t v53 = SZGetLoggingHandle();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)int buf = 136315138;
        uint64_t v126 = v52;
        _os_log_debug_impl(&dword_1DD5BF000, v53, OS_LOG_TYPE_DEBUG, "Processing file %s", buf, 0xCu);
      }
      if (v86 == v50)
      {
        int v54 = 0;
        p_MutableLocalFileRecord = &v120;
        int v56 = v84;
      }
      else if (v85 == v50)
      {
        int v54 = 0;
        p_MutableLocalFileRecord = &v117;
        int v56 = v82;
      }
      else if (v27 == v50)
      {
        int v54 = 0;
        int v56 = 0;
        p_MutableLocalFileRecord = &MutableLocalFileRecord;
      }
      else
      {
        uint32_t v110 = (void **)CopyLocalFileHeader((FILE **)v16, (uint64_t)ValueAtIndex, &v109);
        if (!v110)
        {
          uint64_t v81 = SZGetLoggingHandle();
          if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)int buf = 67109120;
            LODWORD(v126) = v109;
            _os_log_error_impl(&dword_1DD5BF000, v81, OS_LOG_TYPE_ERROR, "CopyLocalFileHeader returned error %d", buf, 8u);
          }
          goto LABEL_122;
        }
        int v56 = 0;
        int v54 = 1;
        p_MutableLocalFileRecord = &v110;
      }
      if ((ZipStreamWriteLocalFile(v16, (uint64_t *)&v111, p_MutableLocalFileRecord, v56, 0, v88, v87, (uint64_t)&v95, (uint64_t)v91) & 1) == 0)break; {
      CFArraySetValueAtIndex(v23, v50, v111);
      }
      if (v54) {
        DestroyMutableLocalFileRecord(v110);
      }
      if (v21 == ++v50) {
        goto LABEL_83;
      }
    }
    unint64_t v80 = SZGetLoggingHandle();
    if (!os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
    {
      if (!v54) {
        goto LABEL_122;
      }
      goto LABEL_121;
    }
    *(_DWORD *)int buf = 136315138;
    uint64_t v126 = v52;
    _os_log_error_impl(&dword_1DD5BF000, v80, OS_LOG_TYPE_ERROR, "Failed to write local file %s", buf, 0xCu);
    if (v54) {
LABEL_121:
    }
      free(v110);
LABEL_122:
    char v59 = 0;
    goto LABEL_87;
  }
LABEL_83:
  if ((ZipStreamWriteCentralDirectoryAndEndRecords(v23, v85, (uint64_t)v117, (uint64_t)&v95, (uint64_t)v91) & 1) == 0)
  {
    CFStringRef v45 = SZGetLoggingHandle();
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
      goto LABEL_86;
    }
    *(_WORD *)int buf = 0;
    CFTypeID v46 = "Failed to finish writing archive.";
    goto LABEL_52;
  }
  char v59 = 1;
LABEL_87:
  uint32_t v60 = v122;
  if (v122)
  {
    size_t v61 = v124;
    if (v124)
    {
      __int16 v62 = v122;
      do
      {
        if (*v62) {
          DestroyMutableCDRecord(*v62);
        }
        ++v62;
        --v61;
      }
      while (v61);
    }
    free(v60);
  }
  if (v23)
  {
    if (v21)
    {
      for (CFIndex j = 0; j != v21; ++j)
      {
        __int16 v64 = (void **)CFArrayGetValueAtIndex(v23, j);
        DestroyMutableCDRecord(v64);
      }
    }
    CFRelease(v23);
  }
  DestroyMutableCDRecord(v121);
  DestroyMutableLocalFileRecord(v120);
  free(v119);
  DestroyMutableCDRecord(v118);
  DestroyMutableLocalFileRecord(v117);
  free(v116);
  DestroyMutableLocalFileRecord(MutableLocalFileRecord);
  if ((v59 & 1) == 0)
  {
    uint64_t v70 = SZGetLoggingHandle();
    if (!os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
      goto LABEL_30;
    }
    *(_DWORD *)int buf = 136315138;
    uint64_t v126 = (uint64_t)a1;
    uint64_t v71 = "Failed to process file %s";
    __int16 v72 = v70;
LABEL_118:
    _os_log_error_impl(&dword_1DD5BF000, v72, OS_LOG_TYPE_ERROR, v71, buf, 0xCu);
    goto LABEL_30;
  }
  uint64_t v65 = *((void *)&v91[0] + 1);
  __int16 v66 = *(unsigned int (**)(void))(*((void *)&v91[0] + 1) + 88);
  if (v66)
  {
    if (v66(*(void *)(*((void *)&v91[0] + 1) + 80)) == -1)
    {
      int v76 = *__error();
      uint32_t v74 = SZGetLoggingHandle();
      if (!os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
        goto LABEL_30;
      }
      size_t v77 = strerror(v76);
      *(_DWORD *)int buf = 136315138;
      uint64_t v126 = (uint64_t)v77;
      uint64_t v71 = "Failed to flush output: %s";
      goto LABEL_117;
    }
    uint64_t v65 = *((void *)&v91[0] + 1);
  }
  uint64_t v67 = (*(uint64_t (**)(void))(v65 + 72))(*(void *)(v65 + 80));
  if (v67 < 0)
  {
    int v73 = *__error();
    uint32_t v74 = SZGetLoggingHandle();
    if (!os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
      goto LABEL_30;
    }
    size_t v75 = strerror(v73);
    *(_DWORD *)int buf = 136315138;
    uint64_t v126 = (uint64_t)v75;
    uint64_t v71 = "Failed to get offset in file at end of writing: %s";
    goto LABEL_117;
  }
  unint64_t v68 = v67;
  if (!HIBYTE(v92)
    && (*(unsigned int (**)(void, uint64_t))(*((void *)&v91[0] + 1) + 96))(*(void *)(*((void *)&v91[0] + 1) + 80), v67))
  {
    int v78 = *__error();
    uint32_t v74 = SZGetLoggingHandle();
    if (!os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
      goto LABEL_30;
    }
    __int16 v79 = strerror(v78);
    *(_DWORD *)int buf = 136315138;
    uint64_t v126 = (uint64_t)v79;
    uint64_t v71 = "Failed to truncate output: %s";
LABEL_117:
    __int16 v72 = v74;
    goto LABEL_118;
  }
  *((void *)&v96 + 1) = v68;
  unint64_t v69 = *(void *)(v16 + 8);
  *((void *)&v106 + 1) = v68 - v69;
  *(double *)&long long v107 = (double)v68 / (double)v69 * 100.0;
  CloseZipFile(v16);
  if (a4) {
    *a4 = _ConvertStatsToDict((uint64_t)&v95);
  }
  return 1;
}

BOOL _UpgradeCallbacksToCurrent(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (*a1 == 1)
  {
    long long v8 = *(_OWORD *)a1;
    long long v9 = *((_OWORD *)a1 + 2);
    *(_OWORD *)(a2 + 16) = *((_OWORD *)a1 + 1);
    *(_OWORD *)(a2 + 32) = v9;
    *(_OWORD *)a2 = v8;
    long long v10 = *((_OWORD *)a1 + 3);
    long long v11 = *((_OWORD *)a1 + 4);
    long long v12 = *((_OWORD *)a1 + 5);
    *(void *)(a2 + 96) = *((void *)a1 + 12);
    *(_OWORD *)(a2 + 64) = v11;
    *(_OWORD *)(a2 + 80) = v12;
    *(_OWORD *)(a2 + 48) = v10;
    return 1;
  }
  else if (*a1)
  {
    CFDictionaryRef v13 = SZGetLoggingHandle();
    BOOL result = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (result)
    {
      int v14 = *a1;
      v15[0] = 67109120;
      v15[1] = v14;
      _os_log_error_impl(&dword_1DD5BF000, v13, OS_LOG_TYPE_ERROR, "Don't know how to handle callbacks struct version %hhu", (uint8_t *)v15, 8u);
      return 0;
    }
  }
  else
  {
    long long v3 = *((_OWORD *)a1 + 1);
    *(_OWORD *)a2 = *(_OWORD *)a1;
    *(_OWORD *)(a2 + 16) = v3;
    long long v4 = *((_OWORD *)a1 + 2);
    long long v5 = *((_OWORD *)a1 + 4);
    uint64_t v6 = *((void *)a1 + 10);
    *(_OWORD *)(a2 + 48) = *((_OWORD *)a1 + 3);
    *(_OWORD *)(a2 + 64) = v5;
    *(_OWORD *)(a2 + 32) = v4;
    BOOL result = 1;
    *(unsigned char *)a2 = 1;
    *(void *)(a2 + 88) = 0;
    *(void *)(a2 + 96) = 0;
    *(void *)(a2 + 80) = v6;
  }
  return result;
}

uint64_t _ConvertOptionsToConfiguration(const __CFDictionary *a1, uint64_t a2)
{
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a1, @"HashedChunkSize");
  if (Value)
  {
    uint64_t result = CFNumberGetValue(Value, kCFNumberLongLongType, (void *)a2);
    if (!result) {
      return result;
    }
  }
  *(void *)(a2 + 16) = CFDictionaryGetValue(a1, @"CommandLineString");
  *(void *)(a2 + 24) = CFDictionaryGetValue(a1, @"ExecutableUUID");
  CFStringRef v6 = (const __CFString *)CFDictionaryGetValue(a1, @"CompressionOptions");
  if (v6 && (CFStringRef v7 = v6, CFStringCompare(v6, @"ForceUncompressed", 0)))
  {
    if (CFStringCompare(v7, @"PreserveCompression", 0))
    {
      if (CFStringCompare(v7, @"TryRecompress", 0))
      {
        if (CFStringCompare(v7, @"ForceCompressed", 0)) {
          return 0;
        }
        int v8 = 3;
      }
      else
      {
        int v8 = 2;
      }
    }
    else
    {
      int v8 = 1;
    }
  }
  else
  {
    int v8 = 0;
  }
  *(_DWORD *)(a2 + 32) = v8;
  CFNumberRef v9 = (const __CFNumber *)CFDictionaryGetValue(a1, @"ZlibCompressionLevel");
  long long v10 = (_DWORD *)(a2 + 40);
  if (v9)
  {
    uint64_t result = CFNumberGetValue(v9, kCFNumberIntType, (void *)(a2 + 40));
    if (!result) {
      return result;
    }
    if (*v10 > 9u) {
      return 0;
    }
  }
  else
  {
    *long long v10 = 9;
  }
  CFStringRef v11 = (const __CFString *)CFDictionaryGetValue(a1, @"HashType");
  if (!v11) {
    goto LABEL_31;
  }
  CFStringRef v12 = v11;
  if (CFEqual(v11, @"MD5"))
  {
    char v13 = 0;
    goto LABEL_30;
  }
  if (CFEqual(v12, @"SHA1"))
  {
    char v13 = 1;
    goto LABEL_30;
  }
  if (CFEqual(v12, @"SHA224"))
  {
    char v13 = 4;
    goto LABEL_30;
  }
  if (CFEqual(v12, @"SHA256"))
  {
    char v13 = 5;
    goto LABEL_30;
  }
  if (CFEqual(v12, @"SHA384"))
  {
    char v13 = 6;
    goto LABEL_30;
  }
  if (CFStringCompare(v12, @"SHA512", 0)) {
    return 0;
  }
  char v13 = 7;
LABEL_30:
  *(unsigned char *)(a2 + 44) = v13;
LABEL_31:
  CFStringRef v14 = (const __CFString *)CFDictionaryGetValue(a1, @"CompressionMethod");
  if (v14 && (CFStringRef v15 = v14, CFStringCompare(v14, @"DEFLATE", 0)))
  {
    if (CFStringCompare(v15, @"LZFSE", 0))
    {
      if (CFStringCompare(v15, @"LZMA", 0)) {
        return 0;
      }
      int v16 = 14;
    }
    else
    {
      int v16 = 99;
    }
  }
  else
  {
    int v16 = 8;
  }
  *(_DWORD *)(a2 + 36) = v16;
  _FetchAndSetBoolean(a1, @"UncompressBloatedFiles", (BOOL *)(a2 + 45), 1);
  _FetchAndSetBoolean(a1, @"NoCache", (BOOL *)(a2 + 46), 0);
  _FetchAndSetBoolean(a1, @"NoSeekOutput", (BOOL *)(a2 + 47), 0);
  _FetchAndSetBoolean(a1, @"SkipPrescan", (BOOL *)(a2 + 48), 0);
  _FetchAndSetBoolean(a1, @"NoCentralDirectory", (BOOL *)(a2 + 49), 0);
  unint64_t v17 = CFDictionaryGetValue(a1, @"CustomPathOrdering");
  if (v17) {
    *(unsigned char *)(a2 + 48) = 1;
  }
  *(void *)(a2 + 56) = v17;
  _FetchAndSetBoolean(a1, @"IncludeContainingDirectory", (BOOL *)(a2 + 64), 0);
  _FetchAndSetBoolean(a1, @"FollowAllSymlinks", (BOOL *)(a2 + 65), 0);
  return 1;
}

CFDictionaryRef _ConvertStatsToDict(uint64_t a1)
{
  uint64_t v2 = 0;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  *(_OWORD *)keys = 0u;
  memset(v11, 0, sizeof(v11));
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  uint64_t v4 = 0x1FFFFFFFFFFFFF7ELL;
  CFNumberRef v5 = (const __CFNumber *)*MEMORY[0x1E4F1CFD0];
  CFNumberRef v6 = (const __CFNumber *)*MEMORY[0x1E4F1CFC8];
  do
  {
    keys[v2] = *(&sStatsData)[v4 + 130];
    if (v4 == -25)
    {
      if (*(unsigned char *)(a1 + 200)) {
        CFNumberRef v7 = v5;
      }
      else {
        CFNumberRef v7 = v6;
      }
      CFRetain(v7);
    }
    else
    {
      CFNumberRef v7 = CFNumberCreate(v3, (CFNumberType)(&sStatsData)[v4 + 131], (char *)(&sStatsData)[v4 + 133] + a1);
    }
    *(void *)((char *)v11 + v2 * 8) = v7;
    ++v2;
    v4 += 5;
  }
  while (v4 * 8);
  CFDictionaryRef v8 = CFDictionaryCreate(v3, (const void **)keys, (const void **)v11, 26, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  for (uint64_t i = 0; i != 208; i += 8)
    CFRelease(*(CFTypeRef *)((char *)v11 + i));
  return v8;
}

const void *_FetchAndSetBoolean(const __CFDictionary *a1, const void *a2, BOOL *a3, BOOL a4)
{
  uint64_t result = CFDictionaryGetValue(a1, a2);
  if (result)
  {
    uint64_t result = (const void *)CFEqual(result, (CFTypeRef)*MEMORY[0x1E4F1CFD0]);
    a4 = result != 0;
  }
  *a3 = a4;
  return result;
}

uint64_t SZArchiverCreateStreamableZip(const char *a1, unsigned __int8 *a2, const __CFDictionary *a3, CFDictionaryRef *a4)
{
  uint64_t v164 = *MEMORY[0x1E4F143B8];
  uint64_t v126 = 0;
  memset(v125, 0, sizeof(v125));
  long long v131 = 0u;
  long long v132 = 0u;
  long long v133 = 0u;
  long long v134 = 0u;
  long long v135 = 0u;
  long long v136 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  long long v139 = 0u;
  long long v140 = 0u;
  long long v141 = 0u;
  long long v142 = 0u;
  long long v143 = 0u;
  uint64_t v130 = 0;
  long long v128 = 0u;
  *(_OWORD *)theArray = 0u;
  memset(v127, 0, sizeof(v127));
  uint64_t result = _UpgradeCallbacksToCurrent(a2, (uint64_t)v125);
  if (!result) {
    return result;
  }
  uint64_t result = _ConvertOptionsToConfiguration(a3, (uint64_t)v127);
  if (!result) {
    return result;
  }
  *((void *)&v127[0] + 1) = v125;
  *(_DWORD *)long long v153 = 0;
  uint64_t v152 = 0;
  off_t v151 = 0;
  value = 0;
  v149 = 0;
  v148 = 0;
  CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
  __int16 v147 = 0;
  bzero(__str, 0x400uLL);
  memset(&v146, 0, sizeof(v146));
  memset(&v145, 0, sizeof(v145));
  bzero(__s, 0x400uLL);
  v161[0] = __s;
  v161[1] = 0;
  if (!realpath_DARWIN_EXTSN(a1, __s))
  {
    int v18 = *__error();
    long long v19 = SZGetLoggingHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      long long v20 = strerror(v18);
      buf[0].st_dev = 136315906;
      *(void *)&buf[0].mode_t st_mode = a1;
      WORD2(buf[0].st_ino) = 2080;
      *(__darwin_ino64_t *)((char *)&buf[0].st_ino + 6) = (__darwin_ino64_t)__s;
      HIWORD(buf[0].st_gid) = 2080;
      *(void *)&buf[0].st_rdev = v20;
      LOWORD(buf[0].st_atimespec.tv_sec) = 1024;
      *(_DWORD *)((char *)&buf[0].st_atimespec.tv_sec + 2) = v18;
      long long v15 = "Realpath for \"%s\" failed at \"%s\" : %s (%d)";
      long long v16 = v19;
      uint32_t v17 = 38;
      goto LABEL_49;
    }
LABEL_12:
    long long v22 = 0;
LABEL_13:
    long long v23 = 0;
    long long v24 = 0;
LABEL_14:
    uint64_t v25 = 0;
LABEL_15:
    int v26 = 0;
    goto LABEL_16;
  }
  size_t v10 = strlen(__s);
  if (!v10)
  {
    long long v21 = SZGetLoggingHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf[0].st_dev) = 0;
      long long v15 = "Source path supplied was an empty string";
      long long v16 = v21;
      uint32_t v17 = 2;
      goto LABEL_49;
    }
    goto LABEL_12;
  }
  uint64_t v11 = v10;
  if (!ZipStreamConfigureOutput(*((void **)&v127[0] + 1), SHIBYTE(v128))) {
    goto LABEL_12;
  }
  if (lstat(__s, &v146))
  {
    CFStringRef v12 = SZGetLoggingHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      long long v13 = __error();
      long long v14 = strerror(*v13);
      buf[0].st_dev = 136315394;
      *(void *)&buf[0].mode_t st_mode = __s;
      WORD2(buf[0].st_ino) = 2080;
      *(__darwin_ino64_t *)((char *)&buf[0].st_ino + 6) = (__darwin_ino64_t)v14;
      long long v15 = "Failed to stat source path %s : %s";
      long long v16 = v12;
      uint32_t v17 = 22;
LABEL_49:
      _os_log_error_impl(&dword_1DD5BF000, v16, OS_LOG_TYPE_ERROR, v15, (uint8_t *)buf, v17);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  mode_t st_mode = v146.st_mode;
  int v36 = v146.st_mode & 0xF000;
  if (v36 == 0x4000)
  {
    if ((_BYTE)v130) {
      uint64_t v11 = strrchr(__s, 47) - __s;
    }
    if (!LOBYTE(theArray[0]))
    {
      if (!_Prescan(__s, Mutable, &v153[1], v153, &v152, &v151)) {
        goto LABEL_12;
      }
      CFIndex v37 = v152;
      off_t st_size = v151;
      mode_t st_mode = v146.st_mode;
      goto LABEL_52;
    }
LABEL_45:
    off_t st_size = 0;
    CFIndex v37 = 16;
    uint64_t v152 = 16;
    v153[0] = 16877;
    v153[1] = -32348;
    goto LABEL_55;
  }
  if (v36 != 0x8000)
  {
    CFDictionaryRef v39 = SZGetLoggingHandle();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      buf[0].st_dev = 67109120;
      *(_DWORD *)&buf[0].mode_t st_mode = v146.st_mode;
      long long v15 = "Unsupported type for source path: mode = 0%ho";
      long long v16 = v39;
      uint32_t v17 = 8;
      goto LABEL_49;
    }
    goto LABEL_12;
  }
  if (LOBYTE(theArray[0])) {
    goto LABEL_45;
  }
  v153[1] = v146.st_mode;
  v153[0] = 16877;
  CFIndex v37 = 1;
  uint64_t v152 = 1;
  off_t st_size = v146.st_size;
  off_t v151 = v146.st_size;
LABEL_52:
  uint64_t v40 = 2;
  if (!HIBYTE(v128)) {
    uint64_t v40 = 3;
  }
  ZipStreamCallPreflightResultCallback(*((uint64_t *)&v127[0] + 1), v40 + v37, st_size, st_mode);
LABEL_55:
  long long v22 = CFArrayCreateMutable(v8, v37, 0);
  snprintf(__str, 0x400uLL, "%s/mimetype", __s);
  if (!lstat(__str, &v145)
    && (_WriteLocalFile(__str, "mimetype", v145.st_size, v145.st_mode, (void *)v145.st_atimespec.tv_sec, (void *)v145.st_mtimespec.tv_sec, v145.st_uid, v145.st_gid, (uint64_t)&v131, (uint64_t)v127, v153[1], v153[0], v22) & 1) == 0)
  {
    uint32_t v60 = SZGetLoggingHandle();
    if (!os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    LOWORD(buf[0].st_dev) = 0;
    size_t v61 = "Failed to write mimetype file out to archive";
    goto LABEL_140;
  }
  snprintf(__str, 0x400uLL, "%s/%s", __s, "META-INF/");
  if (lstat(__str, &v145))
  {
    memset(&v145, 0, sizeof(v145));
    v145.mode_t st_mode = 16877;
    tv_sec = (void *)time(0);
    v145.st_mtimespec.tv_sec = (__darwin_time_t)tv_sec;
    __int16 st_gid = 501;
    *(int32x2_t *)&v145.__int16 st_uid = vdup_n_s32(0x1F5u);
    __int16 st_uid = 501;
  }
  else
  {
    tv_sec = (void *)v145.st_mtimespec.tv_sec;
    __int16 st_uid = v145.st_uid;
    __int16 st_gid = v145.st_gid;
  }
  unsigned int v44 = (unsigned __int16)v153[1];
  unsigned int v45 = (unsigned __int16)v153[0];
  if ((_WriteLocalFile(__str, "META-INF/", v145.st_size, v145.st_mode, (void *)v145.st_atimespec.tv_sec, tv_sec, st_uid, st_gid, (uint64_t)&v131, (uint64_t)v127, v153[1], v153[0], v22) & 1) == 0)
  {
    uint32_t v60 = SZGetLoggingHandle();
    if (!os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    LOWORD(buf[0].st_dev) = 0;
    size_t v61 = "Failed to write metadata directory to archive";
    goto LABEL_140;
  }
  if (!ZipStreamConcoctStreamData(v37, st_size, v44, v45, (uint64_t)v127, &value, &v149, &v147))
  {
    uint32_t v60 = SZGetLoggingHandle();
    if (!os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    LOWORD(buf[0].st_dev) = 0;
    size_t v61 = "failed to create stream metadata";
    goto LABEL_140;
  }
  uint64_t v27 = v147;
  if ((ZipStreamWriteLocalFile(0, (uint64_t *)&value, &v149, (Bytef *)v147, 0, v44, v45, (uint64_t)&v131, (uint64_t)v127) & 1) == 0)
  {
    uint32_t v60 = SZGetLoggingHandle();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf[0].st_dev) = 0;
      size_t v61 = "Failed to write stream metadata";
LABEL_140:
      unsigned int v88 = (uint8_t *)buf;
LABEL_141:
      CFStringRef v89 = v60;
      uint32_t v90 = 2;
LABEL_142:
      _os_log_error_impl(&dword_1DD5BF000, v89, OS_LOG_TYPE_ERROR, v61, v88, v90);
      goto LABEL_13;
    }
LABEL_94:
    long long v23 = 0;
    long long v24 = 0;
    uint64_t v25 = 0;
    int v26 = 0;
    if (!v27) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  CFArrayAppendValue(v22, value);
  value = 0;
  free(v27);
  __int16 v147 = 0;
  DestroyMutableLocalFileRecord(v149);
  v149 = 0;
  CFIndex Count = -1;
  if (*(void *)&v127[0] && !HIBYTE(v128))
  {
    if (!ZipStreamConcoctFixedStreamData((uint64_t)v127, &value, &v148, (const Bytef **)&v147))
    {
      uint32_t v60 = SZGetLoggingHandle();
      if (!os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
        goto LABEL_13;
      }
      LOWORD(buf[0].st_dev) = 0;
      size_t v61 = "Failed to concoct fixed stream data";
      goto LABEL_140;
    }
    uint64_t v27 = v147;
    if (ZipStreamWriteLocalFile(0, (uint64_t *)&value, &v148, (Bytef *)v147, 0, v44, v45, (uint64_t)&v131, (uint64_t)v127))
    {
      CFIndex Count = CFArrayGetCount(v22);
      CFArrayAppendValue(v22, value);
      value = 0;
      free(v27);
      __int16 v147 = 0;
      goto LABEL_68;
    }
    uint32_t v60 = SZGetLoggingHandle();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf[0].st_dev) = 0;
      size_t v61 = "Failed to write stream metadata";
      goto LABEL_140;
    }
    goto LABEL_94;
  }
LABEL_68:
  CFIndex v121 = Count;
  unsigned __int16 v123 = v45;
  unsigned __int16 v124 = v44;
  if (Mutable)
  {
    CFIndex v122 = CFArrayGetCount(Mutable);
    if (v122 >= 1)
    {
      CFIndex v47 = 0;
      while (1)
      {
        bzero(buf, 0x400uLL);
        CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(Mutable, v47);
        CFStringRef v49 = CFStringCreateWithFileSystemRepresentation(0, __s);
        if (!v49) {
          break;
        }
        CFIndex v50 = (char *)v49;
        CFStringRef v51 = CFStringCreateWithFormat(v8, 0, @"%@/%@", v49, ValueAtIndex);
        if (!v51)
        {
          long long v95 = SZGetLoggingHandle();
          if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long v154 = 138412546;
            long long v155 = v50;
            __int16 v156 = 2112;
            long long v157 = (stat *)ValueAtIndex;
            _os_log_error_impl(&dword_1DD5BF000, v95, OS_LOG_TYPE_ERROR, "unable to create fullPath from: %@ and %@", v154, 0x16u);
          }
          CFRelease(v50);
          goto LABEL_13;
        }
        CFStringRef v52 = v51;
        int FileSystemRepresentation = CFStringGetFileSystemRepresentation(v51, __str, 1024);
        CFRelease(v50);
        CFRelease(v52);
        if (!FileSystemRepresentation)
        {
          uint32_t v60 = SZGetLoggingHandle();
          if (!os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
            goto LABEL_13;
          }
          *(_WORD *)long long v154 = 0;
          size_t v61 = "Failed to convert full path to C string";
LABEL_174:
          unsigned int v88 = v154;
          goto LABEL_141;
        }
        if (!CFStringGetFileSystemRepresentation(ValueAtIndex, (char *)buf, 1024))
        {
          uint32_t v60 = SZGetLoggingHandle();
          if (!os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
            goto LABEL_13;
          }
          *(_WORD *)long long v154 = 0;
          size_t v61 = "Failed to convert archive path to C string";
          goto LABEL_174;
        }
        LOWORD(v45) = v123;
        LOWORD(v44) = v124;
        if (!lstat(__str, &v145)
          && (_WriteLocalFile(__str, (const char *)buf, v145.st_size, v145.st_mode, (void *)v145.st_atimespec.tv_sec, (void *)v145.st_mtimespec.tv_sec, v145.st_uid, v145.st_gid, (uint64_t)&v131, (uint64_t)v127, v124, v123, v22) & 1) == 0)
        {
          uint32_t v60 = SZGetLoggingHandle();
          if (!os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
            goto LABEL_13;
          }
          *(_WORD *)long long v154 = 0;
          size_t v61 = "Failed to write mimetype file out to archive";
          goto LABEL_174;
        }
        if (v122 == ++v47) {
          goto LABEL_78;
        }
      }
      uint64_t v94 = SZGetLoggingHandle();
      if (!os_log_type_enabled(v94, OS_LOG_TYPE_ERROR)) {
        goto LABEL_13;
      }
      *(_DWORD *)long long v154 = 136315138;
      long long v155 = __s;
      size_t v61 = "unable to create dirPathStr from: %s";
      unsigned int v88 = v154;
      CFStringRef v89 = v94;
      uint32_t v90 = 12;
      goto LABEL_142;
    }
  }
LABEL_78:
  int v54 = v146.st_mode;
  if ((v146.st_mode & 0xF000) != 0x4000)
  {
    __int16 v62 = strrchr(__s, 47);
    if (v62) {
      size_t v63 = v62;
    }
    else {
      size_t v63 = __s;
    }
    int v64 = _WriteLocalFile(__s, v63, v146.st_size, v54, (void *)v146.st_atimespec.tv_sec, (void *)v146.st_mtimespec.tv_sec, v146.st_uid, v146.st_gid, (uint64_t)&v131, (uint64_t)v127, v44, v45, v22);
    long long v23 = 0;
    if (!v64)
    {
      int v26 = 0;
      long long v24 = 0;
      uint64_t v25 = 0;
      goto LABEL_16;
    }
    long long v24 = 0;
    uint64_t v25 = 0;
LABEL_103:
    if ((ZipStreamWriteCentralDirectoryAndEndRecords(v22, v121, (uint64_t)v148, (uint64_t)&v131, (uint64_t)v127) & 1) == 0)
    {
      int v91 = SZGetLoggingHandle();
      if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf[0].st_dev) = 0;
        CFIndex v85 = "Failed to write end of archive.";
        CFIndex v86 = v91;
        uint32_t v87 = 2;
LABEL_181:
        _os_log_error_impl(&dword_1DD5BF000, v86, OS_LOG_TYPE_ERROR, v85, (uint8_t *)buf, v87);
        goto LABEL_183;
      }
      goto LABEL_183;
    }
    uint64_t v65 = *((void *)&v127[0] + 1);
    __int16 v66 = *(unsigned int (**)(void))(*((void *)&v127[0] + 1) + 88);
    if (v66)
    {
      if (v66(*(void *)(*((void *)&v127[0] + 1) + 80)) == -1)
      {
        int v109 = *__error();
        long long v97 = SZGetLoggingHandle();
        if (!os_log_type_enabled(v97, OS_LOG_TYPE_ERROR)) {
          goto LABEL_183;
        }
        uint32_t v110 = strerror(v109);
        buf[0].st_dev = 136315138;
        *(void *)&buf[0].mode_t st_mode = v110;
        CFIndex v85 = "Failed to flush output: %s";
        goto LABEL_180;
      }
      uint64_t v65 = *((void *)&v127[0] + 1);
    }
    uint64_t v67 = (*(uint64_t (**)(void))(v65 + 72))(*(void *)(v65 + 80));
    if ((v67 & 0x8000000000000000) == 0)
    {
      uint64_t v68 = v67;
      if (HIBYTE(v128)
        || !(*(unsigned int (**)(void, uint64_t))(*((void *)&v127[0] + 1) + 96))(*(void *)(*((void *)&v127[0] + 1) + 80), v67))
      {
        long long v23 = 0;
        *((void *)&v132 + 1) = v68;
        int v26 = 1;
        goto LABEL_16;
      }
      int v111 = *__error();
      long long v97 = SZGetLoggingHandle();
      if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
      {
        int v112 = strerror(v111);
        buf[0].st_dev = 136315138;
        *(void *)&buf[0].mode_t st_mode = v112;
        CFIndex v85 = "Failed to truncate output: %s";
        goto LABEL_180;
      }
LABEL_183:
      long long v23 = 0;
      goto LABEL_15;
    }
    int v107 = *__error();
    long long v97 = SZGetLoggingHandle();
    if (!os_log_type_enabled(v97, OS_LOG_TYPE_ERROR)) {
      goto LABEL_183;
    }
    stat v108 = strerror(v107);
    buf[0].st_dev = 136315138;
    *(void *)&buf[0].mode_t st_mode = v108;
    CFIndex v85 = "Failed to get offset in file at end of writing: %s";
LABEL_180:
    CFIndex v86 = v97;
    uint32_t v87 = 12;
    goto LABEL_181;
  }
  if (!theArray[1])
  {
    long long v24 = 0;
    uint64_t v57 = (char *const *)v161;
LABEL_114:
    unint64_t v69 = fts_open(v57, 84, 0);
    if (!v69)
    {
      long long v96 = SZGetLoggingHandle();
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        size_t v114 = __error();
        CFRange v115 = strerror(*v114);
        buf[0].st_dev = 136315394;
        *(void *)&buf[0].mode_t st_mode = __s;
        WORD2(buf[0].st_ino) = 2080;
        *(__darwin_ino64_t *)((char *)&buf[0].st_ino + 6) = (__darwin_ino64_t)v115;
        _os_log_error_impl(&dword_1DD5BF000, v96, OS_LOG_TYPE_ERROR, "fts_open failed for path %s: %s", (uint8_t *)buf, 0x16u);
      }
      long long v23 = 0;
      goto LABEL_14;
    }
    uint64_t v25 = v69;
    while (1)
    {
      uint64_t v70 = fts_read(v25);
      if (!v70)
      {
        if (!*__error()) {
          goto LABEL_103;
        }
        long long v97 = SZGetLoggingHandle();
        if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
        {
          long long v98 = __error();
          long long v99 = strerror(*v98);
          buf[0].st_dev = 136315138;
          *(void *)&buf[0].mode_t st_mode = v99;
          CFIndex v85 = "fts_read returned NULL and set errno: %s";
          goto LABEL_180;
        }
        goto LABEL_183;
      }
      uint64_t v71 = v70;
      unsigned int fts_info = v70->fts_info;
      if (fts_info > 0xD) {
        break;
      }
      if (((1 << fts_info) & 0x3102) != 0)
      {
        if (v70->fts_level) {
          BOOL v73 = 0;
        }
        else {
          BOOL v73 = theArray[1] == 0;
        }
        if (!v73 || v130 != 0)
        {
          long long v23 = _CopyArchivePath((uint64_t)v70->fts_path, v11, v70->fts_statp->st_mode);
          if ((_IsExcludedFileName(v23) & 1) == 0 && (_IsOrderedEarly(v23, Mutable) & 1) == 0)
          {
            memset(buf, 0, 144);
            if (v71->fts_info != 12 || !BYTE1(v130)) {
              goto LABEL_132;
            }
            if (stat(v71->fts_path, buf))
            {
              uint64_t v116 = SZGetLoggingHandle();
              if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
              {
                fts_path = v71->fts_path;
                v118 = __error();
                int v119 = strerror(*v118);
                *(_DWORD *)long long v154 = 136315394;
                long long v155 = fts_path;
                __int16 v156 = 2080;
                long long v157 = (stat *)v119;
                _os_log_error_impl(&dword_1DD5BF000, v116, OS_LOG_TYPE_ERROR, "stat failed for path %s: %s", v154, 0x16u);
              }
              goto LABEL_15;
            }
            int v75 = buf[0].st_mode;
            p_off_t st_size = &buf[0].st_size;
            p_st_atimespec = (void **)&buf[0].st_atimespec;
            p_st_mtimespec = (void **)&buf[0].st_mtimespec;
            p___int16 st_uid = &buf[0].st_uid;
            p___int16 st_gid = &buf[0].st_gid;
            if ((buf[0].st_mode & 0xF000) != 0x8000)
            {
LABEL_132:
              fts_statp = v71->fts_statp;
              p___int16 st_gid = &fts_statp->st_gid;
              p___int16 st_uid = &fts_statp->st_uid;
              p_st_mtimespec = (void **)&fts_statp->st_mtimespec;
              p_st_atimespec = (void **)&fts_statp->st_atimespec;
              p_off_t st_size = &fts_statp->st_size;
              int v75 = fts_statp->st_mode;
            }
            if ((_WriteLocalFile(v71->fts_path, v23, *p_st_size, v75, *p_st_atimespec, *p_st_mtimespec, *p_st_uid, *p_st_gid, (uint64_t)&v131, (uint64_t)v127, v124, v123, v22) & 1) == 0)goto LABEL_15; {
          }
            }
          free(v23);
        }
      }
      else if (fts_info != 6)
      {
        if (((1 << fts_info) & 0x490) != 0)
        {
          uint64_t v82 = SZGetLoggingHandle();
          if (!os_log_type_enabled(v82, OS_LOG_TYPE_ERROR)) {
            goto LABEL_183;
          }
          uint64_t v83 = v71->fts_path;
          int v84 = strerror(v71->fts_errno);
          buf[0].st_dev = 136315394;
          *(void *)&buf[0].mode_t st_mode = v83;
          WORD2(buf[0].st_ino) = 2080;
          *(__darwin_ino64_t *)((char *)&buf[0].st_ino + 6) = (__darwin_ino64_t)v84;
          CFIndex v85 = "fts_read gave error for file %s: %s";
          CFIndex v86 = v82;
          uint32_t v87 = 22;
          goto LABEL_181;
        }
        break;
      }
    }
    size_t v113 = SZGetLoggingHandle();
    if (!os_log_type_enabled(v113, OS_LOG_TYPE_ERROR)) {
      goto LABEL_183;
    }
    int v120 = v71->fts_info;
    buf[0].st_dev = 67109120;
    *(_DWORD *)&buf[0].mode_t st_mode = v120;
    CFIndex v85 = "fts_read returned unhandled fts_info value %d";
    CFIndex v86 = v113;
    uint32_t v87 = 8;
    goto LABEL_181;
  }
  CFIndex v55 = CFArrayGetCount(theArray[1]);
  bzero(buf, 0x400uLL);
  if (v55 <= 0)
  {
    long long v92 = SZGetLoggingHandle();
    if (!os_log_type_enabled(v92, OS_LOG_TYPE_ERROR)) {
      goto LABEL_163;
    }
    *(_WORD *)long long v154 = 0;
    long long v93 = "The custom path ordering array is empty";
LABEL_185:
    _os_log_error_impl(&dword_1DD5BF000, v92, OS_LOG_TYPE_ERROR, v93, v154, 2u);
    goto LABEL_163;
  }
  int v56 = (char *const *)malloc_type_calloc(v55 + 1, 8uLL, 0x10040436913F5uLL);
  if (v56)
  {
    uint64_t v57 = v56;
    CFIndex v58 = 0;
    while (1)
    {
      CFStringRef v59 = (const __CFString *)CFArrayGetValueAtIndex(theArray[1], v58);
      if (!CFStringGetFileSystemRepresentation(v59, (char *)buf, 1024))
      {
        long long v100 = SZGetLoggingHandle();
        if (!os_log_type_enabled(v100, OS_LOG_TYPE_ERROR)) {
          goto LABEL_164;
        }
        *(_WORD *)long long v154 = 0;
        long long v101 = "Failed to convert path to C string";
        long long v102 = v100;
        uint32_t v103 = 2;
        goto LABEL_169;
      }
      v144 = 0;
      if (asprintf(&v144, "%s/%s", __s, (const char *)buf) < 0) {
        break;
      }
      v57[v58++] = v144;
      if (v55 == v58)
      {
        v57[v55] = 0;
        long long v24 = (void **)v57;
        goto LABEL_114;
      }
    }
    int v104 = *__error();
    long long v105 = SZGetLoggingHandle();
    if (!os_log_type_enabled(v105, OS_LOG_TYPE_ERROR)) {
      goto LABEL_164;
    }
    long long v106 = strerror(v104);
    *(_DWORD *)long long v154 = 136315650;
    long long v155 = __s;
    __int16 v156 = 2080;
    long long v157 = buf;
    __int16 v158 = 2080;
    uint64_t v159 = v106;
    long long v101 = "Failed to create path from %s/%s : %s";
    long long v102 = v105;
    uint32_t v103 = 32;
LABEL_169:
    _os_log_error_impl(&dword_1DD5BF000, v102, OS_LOG_TYPE_ERROR, v101, v154, v103);
    goto LABEL_164;
  }
  long long v92 = SZGetLoggingHandle();
  if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long v154 = 0;
    long long v93 = "Malloc failed for path buffer array";
    goto LABEL_185;
  }
LABEL_163:
  uint64_t v57 = 0;
LABEL_164:
  long long v23 = 0;
  uint64_t v25 = 0;
  int v26 = 0;
  long long v24 = (void **)v57;
LABEL_16:
  uint64_t v27 = v147;
  if (v147) {
LABEL_17:
  }
    free(v27);
LABEL_18:
  DestroyMutableCDRecord((void **)value);
  DestroyMutableLocalFileRecord(v149);
  DestroyMutableLocalFileRecord(v148);
  if (v22)
  {
    CFIndex v28 = CFArrayGetCount(v22);
    if (v28)
    {
      CFIndex v29 = v28;
      for (CFIndex i = 0; i != v29; ++i)
      {
        int v31 = (void **)CFArrayGetValueAtIndex(v22, i);
        DestroyMutableCDRecord(v31);
      }
    }
    CFRelease(v22);
  }
  free(v23);
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (v25) {
    fts_close(v25);
  }
  if (v24)
  {
    int v32 = *v24;
    if (*v24)
    {
      CFDictionaryRef v33 = v24 + 1;
      do
      {
        free(v32);
        *(v33 - 1) = 0;
        CFDataRef v34 = *v33++;
        int v32 = v34;
      }
      while (v34);
    }
    free(v24);
  }
  if (!v26) {
    return 0;
  }
  if (a4) {
    *a4 = _ConvertStatsToDict((uint64_t)&v131);
  }
  return 1;
}

uint64_t SZArchiverExtractFile()
{
  uint64_t v0 = MEMORY[0x1F4188790]();
  uint64_t v2 = v1;
  CFDictionaryRef v4 = v3;
  size_t v6 = v5;
  CFNumberRef v7 = (const char *)v0;
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  uint64_t v68 = 0;
  memset(v67, 0, sizeof(v67));
  memset(v73, 0, sizeof(v73));
  uint64_t v72 = 0;
  long long v70 = 0u;
  long long v71 = 0u;
  memset(v69, 0, sizeof(v69));
  uint64_t result = _UpgradeCallbacksToCurrent(v8, (uint64_t)v67);
  if (!result) {
    return result;
  }
  uint64_t result = _ConvertOptionsToConfiguration(v4, (uint64_t)v69);
  if (!result) {
    return result;
  }
  *((void *)&v69[0] + 1) = v67;
  if (!ZipStreamConfigureOutput(v67, SHIBYTE(v70))) {
    goto LABEL_15;
  }
  size_t v10 = (FILE **)OpenZipFile(v7, SBYTE14(v70));
  if (!v10)
  {
    long long v20 = SZGetLoggingHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 136315138;
      size_t v86 = (size_t)v7;
      _os_log_error_impl(&dword_1DD5BF000, v20, OS_LOG_TYPE_ERROR, "Failed to open zip file %s", buf, 0xCu);
    }
LABEL_15:
    uint64_t v11 = 0;
LABEL_16:
    CloseZipFile((uint64_t)v11);
    return 0;
  }
  uint64_t v11 = v10;
  uint64_t v79 = 0;
  size_t v80 = 0;
  uint64_t v77 = -1;
  int v78 = 0;
  uint64_t v75 = -1;
  uint64_t v76 = -1;
  int v74 = 0;
  if (!_ReadOriginalCentralDirectory((uint64_t)v10, (void ****)&v78, &v80, &v79, (size_t *)&v77, (size_t *)&v76, (_WORD *)&v74 + 1, &v74))goto LABEL_50; {
  if (v6 != -1)
  }
  {
    size_t v12 = v80;
    if (v80 <= v6)
    {
      CFDataRef v34 = SZGetLoggingHandle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)int buf = 134218240;
        size_t v86 = v6;
        __int16 v87 = 2048;
        size_t v88 = v12 - 1;
        _os_log_error_impl(&dword_1DD5BF000, v34, OS_LOG_TYPE_ERROR, "Central directory index %llu is out of range, must be between 0 and %llu", buf, 0x16u);
      }
      char v19 = 0;
    }
    else
    {
      uint64_t v13 = *((void *)v78 + v6);
      uint64_t v14 = *((void *)&v69[0] + 1);
      int v82 = 2;
      printf("Extracting %s\n", *(const char **)(v13 + 72));
      long long v15 = CopyLocalFileHeader(v11, v13, &v82);
      long long v16 = v15;
      if (v15)
      {
        uint32_t v17 = (uint64_t *)OpenLocalFile((uint64_t)v11, v13, *((char **)v15 + 7), v15[32], 0, &v82);
        if (v82)
        {
          int v18 = SZGetLoggingHandle();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)int buf = 0;
            _os_log_error_impl(&dword_1DD5BF000, v18, OS_LOG_TYPE_ERROR, "Failed to open local file", buf, 2u);
          }
          char v19 = 0;
        }
        else
        {
          __int16 v66 = v16;
          size_t v50 = v16[6];
          if (v50)
          {
            size_t v51 = 0;
            while (1)
            {
              size_t v81 = 0;
              CFStringRef v52 = v17;
              int v53 = ReadLocalFileData(v17, buf, 0x1000uLL, &v81);
              if ((v53 & 5) != 0) {
                break;
              }
              size_t v54 = v81;
              if (v81)
              {
                if (v54 != (*(uint64_t (**)(void, uint8_t *, size_t))(v14 + 48))(*(void *)(v14 + 80), buf, v81))
                {
                  int v60 = *__error();
                  size_t v61 = SZGetLoggingHandle();
                  if (!os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
                    goto LABEL_84;
                  }
                  int v64 = strerror(v60);
                  *(_DWORD *)uint64_t v83 = 136315138;
                  int v84 = v64;
                  uint64_t v57 = "fwrite failed to write out entire buffer: %s";
                  CFIndex v58 = v61;
                  uint32_t v59 = 12;
                  goto LABEL_94;
                }
                v51 += v54;
              }
              uint32_t v17 = v52;
              if (v51 >= v50)
              {
                if (v53 != 2) {
                  goto LABEL_78;
                }
                if (v51 == v50)
                {
                  char v19 = 1;
                }
                else
                {
                  size_t v63 = SZGetLoggingHandle();
                  if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)int buf = 134218240;
                    size_t v86 = v51;
                    __int16 v87 = 2048;
                    size_t v88 = v50;
                    _os_log_error_impl(&dword_1DD5BF000, v63, OS_LOG_TYPE_ERROR, "Failed to read entire file size; expected %llu, got %llu",
                      buf,
                      0x16u);
                  }
                  char v19 = 0;
                }
                goto LABEL_86;
              }
            }
            int v56 = SZGetLoggingHandle();
            if (!os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
            {
LABEL_84:
              char v19 = 0;
              goto LABEL_85;
            }
            *(_DWORD *)uint64_t v83 = 67109120;
            LODWORD(v84) = v53;
            uint64_t v57 = "ReadLocalFileData returned %d";
            CFIndex v58 = v56;
            uint32_t v59 = 8;
LABEL_94:
            _os_log_error_impl(&dword_1DD5BF000, v58, OS_LOG_TYPE_ERROR, v57, v83, v59);
            goto LABEL_84;
          }
          int v53 = 0;
LABEL_78:
          CFStringRef v52 = v17;
          CFIndex v55 = SZGetLoggingHandle();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)int buf = 67109120;
            LODWORD(v86) = v53;
            _os_log_error_impl(&dword_1DD5BF000, v55, OS_LOG_TYPE_ERROR, "Failed to read file data: %d", buf, 8u);
          }
          char v19 = 0;
LABEL_85:
          uint32_t v17 = v52;
LABEL_86:
          long long v16 = v66;
        }
        if (v17) {
          CloseLocalFile((compression_stream *)v17);
        }
      }
      else
      {
        CFStringRef v49 = SZGetLoggingHandle();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)int buf = 67109120;
          LODWORD(v86) = v82;
          _os_log_error_impl(&dword_1DD5BF000, v49, OS_LOG_TYPE_ERROR, "Failed to get local file record: %d", buf, 8u);
        }
        char v19 = 0;
      }
      free(v16);
    }
    goto LABEL_51;
  }
  CFArrayRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
  unint64_t v22 = v80;
  if (!v80)
  {
    uint64_t v25 = -1;
    goto LABEL_41;
  }
  uint64_t v23 = 0;
  long long v24 = v78;
  int v65 = HIWORD(v74);
  uint64_t v25 = -1;
  int v26 = (unsigned __int16)v74;
  do
  {
    uint64_t v27 = v24[v23];
    if (!v27) {
      goto LABEL_32;
    }
    if (v25 == -1)
    {
      buf[0] = 0;
      unsigned __int8 ShouldOrderFileEarly = ZipStreamShouldOrderFileEarly(*(const char **)(v27 + 72), buf);
      if ((ShouldOrderFileEarly & (buf[0] != 0)) != 0) {
        uint64_t v25 = v23;
      }
      else {
        uint64_t v25 = -1;
      }
      uint64_t v27 = v24[v23];
    }
    CFStringRef v29 = CFStringCreateWithFileSystemRepresentation(0, *(const char **)(v27 + 72));
    CFArrayAppendValue(Mutable, v29);
    CFRelease(v29);
    uint64_t v30 = v24[v23];
    int v31 = *(unsigned __int16 *)(v30 + 24);
    if (*(unsigned char *)(v30 + 26))
    {
      if (v31 != v26) {
        goto LABEL_30;
      }
    }
    else if (v31 != v65)
    {
LABEL_30:
      int v32 = 1;
      goto LABEL_31;
    }
    int v32 = 0;
LABEL_31:
    ZipStreamAddStatisticsForCDRecord(v30, v32, v73);
LABEL_32:
    ++v23;
  }
  while (v22 != v23);
  if (v25 == -1)
  {
LABEL_41:
    uint64_t v33 = -1;
    goto LABEL_42;
  }
  if (_GetCDIndexOfBundleExecutableForInfoPlist(v11, (uint64_t)v24, v22, v24[v25], &v75)) {
    uint64_t v33 = v75;
  }
  else {
    uint64_t v33 = -1;
  }
LABEL_42:
  CFAllocatorRef v35 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  int v36 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFDictionarySetValue(v36, @"paths", Mutable);
  _AddIndexToDictionary(@"META-INF", v77, v36);
  _AddIndexToDictionary(@"mimetype", v76, v36);
  _AddIndexToDictionary(@"Info.plist", v25, v36);
  _AddIndexToDictionary(@"Executable", v33, v36);
  CFDataRef Data = CFPropertyListCreateData(v35, v36, kCFPropertyListXMLFormat_v1_0, 0, 0);
  if (Data)
  {
    CFDataRef v38 = Data;
    CFIndex Length = CFDataGetLength(Data);
    *__error() = 0;
    uint64_t v40 = *((void *)&v69[0] + 1);
    BytePtr = CFDataGetBytePtr(v38);
    if (Length != (*(uint64_t (**)(void, const UInt8 *, CFIndex))(v40 + 48))(*(void *)(v40 + 80), BytePtr, Length))
    {
      int v42 = *__error();
      size_t v43 = SZGetLoggingHandle();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        __int16 v62 = strerror(v42);
        *(_DWORD *)int buf = 136315138;
        size_t v86 = (size_t)v62;
        _os_log_error_impl(&dword_1DD5BF000, v43, OS_LOG_TYPE_ERROR, "Failed to write entire output dictionary: %s", buf, 0xCu);
      }
    }
    CFRelease(v38);
  }
  else
  {
    unsigned int v44 = SZGetLoggingHandle();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int buf = 0;
      _os_log_error_impl(&dword_1DD5BF000, v44, OS_LOG_TYPE_ERROR, "Failed to create output dictionary", buf, 2u);
    }
  }
  CFRelease(v36);
LABEL_50:
  char v19 = 1;
LABEL_51:
  unsigned int v45 = v78;
  if (v78)
  {
    size_t v46 = v80;
    if (v80)
    {
      CFIndex v47 = (void **)v78;
      do
      {
        if (*v47) {
          free(*v47);
        }
        ++v47;
        --v46;
      }
      while (v46);
    }
    free(v45);
  }
  if ((v19 & 1) == 0)
  {
    uint32_t v48 = SZGetLoggingHandle();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 136315138;
      size_t v86 = (size_t)v7;
      _os_log_error_impl(&dword_1DD5BF000, v48, OS_LOG_TYPE_ERROR, "Failed to process file %s", buf, 0xCu);
    }
    goto LABEL_16;
  }
  CloseZipFile((uint64_t)v11);
  if (v2) {
    *uint64_t v2 = _ConvertStatsToDict((uint64_t)v73);
  }
  return 1;
}

id _CreateError(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8, uint64_t a9)
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (v17) {
    uint64_t v19 = [v17 mutableCopy];
  }
  else {
    uint64_t v19 = objc_opt_new();
  }
  long long v20 = (void *)v19;
  if (v18)
  {
    long long v21 = (void *)[[NSString alloc] initWithFormat:v18 arguments:&a9];
    [v20 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F28568]];
  }
  if (v16) {
    [v20 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
  }
  unint64_t v22 = [NSString stringWithUTF8String:a1];
  [v20 setObject:v22 forKeyedSubscript:@"SZExtractorFunctionNameErrorKey"];

  uint64_t v23 = [NSNumber numberWithInt:a2];
  [v20 setObject:v23 forKeyedSubscript:@"SZExtractorSourceFileLineErrorKey"];

  long long v24 = [MEMORY[0x1E4F28C58] errorWithDomain:v15 code:a4 userInfo:v20];

  return v24;
}

void sub_1DD5CEAD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose((const void *)(v30 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_1DD5CF950(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
}

uint64_t _CheckRealpathHasBasePrefix(void *a1, void *a2, void *a3)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  bzero(__s, 0x400uLL);
  id v7 = v5;
  if (realpath_DARWIN_EXTSN((const char *)[v7 fileSystemRepresentation], __s) || *__error() == 2)
  {
    CFAllocatorRef v35 = a3;
    CFAllocatorRef v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    CFNumberRef v9 = [v8 stringWithFileSystemRepresentation:__s length:strlen(__s)];

    size_t v10 = [v9 pathComponents];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    uint64_t v11 = [v6 pathComponents];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v36 objects:v48 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = 0;
      uint64_t v15 = *(void *)v37;
      CFDataRef v34 = v9;
      while (2)
      {
        id v16 = v7;
        id v17 = v6;
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v37 != v15) {
            objc_enumerationMutation(v11);
          }
          uint64_t v19 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          if (v14 + i < (unint64_t)[v10 count])
          {
            long long v20 = [v10 objectAtIndexedSubscript:v14 + i];
            char v21 = [v19 isEqualToString:v20];

            if (v21) {
              continue;
            }
          }
          long long v24 = SZGetLoggingHandle();
          id v6 = v17;
          id v7 = v16;
          CFNumberRef v9 = v34;
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            uint64_t v33 = [v7 fileSystemRepresentation];
            *(_DWORD *)int buf = 136315650;
            uint64_t v43 = v33;
            __int16 v44 = 2112;
            unsigned int v45 = (char *)v34;
            __int16 v46 = 2112;
            id v47 = v6;
            _os_log_error_impl(&dword_1DD5BF000, v24, OS_LOG_TYPE_ERROR, "Rejecting \"%s\" because its resolved path \"%@\" points outside or to the unzip dir %@", buf, 0x20u);
          }

          uint64_t v40 = *MEMORY[0x1E4F28328];
          id v41 = v7;
          uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
          uint64_t v26 = [v7 fileSystemRepresentation];
          unint64_t v22 = _CreateError((uint64_t)"_CheckRealpathHasBasePrefix", 442, @"SZExtractorErrorDomain", 5, 0, v25, @"Rejecting \"%s\" because its resolved path \"%@\" points outside or to the unzip dir %@", v27, v26);

          uint64_t v23 = 0;
          goto LABEL_17;
        }
        v14 += i;
        uint64_t v13 = [v11 countByEnumeratingWithState:&v36 objects:v48 count:16];
        unint64_t v22 = 0;
        uint64_t v23 = 1;
        id v6 = v17;
        id v7 = v16;
        CFNumberRef v9 = v34;
        if (v13) {
          continue;
        }
        break;
      }
    }
    else
    {
      unint64_t v22 = 0;
      uint64_t v23 = 1;
    }
LABEL_17:

    a3 = v35;
  }
  else
  {
    uint64_t v29 = *__error();
    uint64_t v30 = SZGetLoggingHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 136315394;
      uint64_t v43 = [v7 fileSystemRepresentation];
      __int16 v44 = 2080;
      unsigned int v45 = strerror(v29);
      _os_log_error_impl(&dword_1DD5BF000, v30, OS_LOG_TYPE_ERROR, "Call to realpath failed for suspicious path %s: %s", buf, 0x16u);
    }

    CFNumberRef v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:v29 userInfo:0];
    uint64_t v49 = *MEMORY[0x1E4F28328];
    id v50 = v7;
    size_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
    uint64_t v31 = [v7 fileSystemRepresentation];
    strerror(v29);
    unint64_t v22 = _CreateError((uint64_t)"_CheckRealpathHasBasePrefix", 430, @"SZExtractorErrorDomain", 5, v9, v10, @"Call to realpath failed for suspicious path %s: %s", v32, v31);
    uint64_t v23 = 0;
  }

  if (a3 && (v23 & 1) == 0) {
    *a3 = v22;
  }

  return v23;
}

void sub_1DD5D2174(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__457(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__458(uint64_t a1)
{
}

id _CopyStreamBytesToRecord(uint64_t a1, uint64_t a2, void *a3, const void **a4, size_t *a5)
{
  size_t v9 = *a5;
  id v10 = a3;
  uint64_t v11 = [v10 thisStageBytesComplete];
  if (v9 >= a2 - v11) {
    size_t v12 = a2 - v11;
  }
  else {
    size_t v12 = v9;
  }
  memcpy((void *)(a1 + [v10 thisStageBytesComplete]), *a4, v12);
  objc_msgSend(v10, "setThisStageBytesComplete:", objc_msgSend(v10, "thisStageBytesComplete") + v12);
  uint64_t v13 = [v10 unsureData];
  [v13 appendBytes:*a4 length:v12];

  objc_msgSend(v10, "setCurrentOffset:", objc_msgSend(v10, "currentOffset") + v12);
  uint64_t v14 = objc_msgSend(v10, "updateHashFromOffset:withBytes:length:", objc_msgSend(v10, "currentOffset") - v12, *a4, v12);

  if (!v14)
  {
    *a4 = (char *)*a4 + v12;
    *a5 -= v12;
  }

  return v14;
}

uint64_t _GetUncompressedSize(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 currentLFRecord];
  if (*(_WORD *)([v1 currentLFRecord] + 8)
    && [v1 currentLFRequiresDataDescriptor])
  {
    if ([v1 streamState] <= 3) {
      __assert_rtn("_GetUncompressedSize", "StreamingUnzipper.m", 339, "currentState.streamState > kStreamStateIncompleteDataDescriptor");
    }
    if (![v1 dataDescriptor]) {
      __assert_rtn("_GetUncompressedSize", "StreamingUnzipper.m", 340, "NULL != currentState.dataDescriptor");
    }
    BOOL HasZip64ExtraField = LocalFileRecordHasZip64ExtraField([v1 currentLFRecord]);
    uint64_t v4 = [v1 dataDescriptor];
    if (HasZip64ExtraField) {
      uint64_t LFUncompressedSize = *(void *)(v4 + 16);
    }
    else {
      uint64_t LFUncompressedSize = *(unsigned int *)(v4 + 12);
    }
  }
  else
  {
    uint64_t LFUncompressedSize = GetLFUncompressedSize(v2);
  }

  return LFUncompressedSize;
}

uint64_t _GetCompressedSize(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 currentLFRecord];
  if (*(_WORD *)([v1 currentLFRecord] + 8)
    && [v1 currentLFRequiresDataDescriptor])
  {
    if ([v1 streamState] <= 3) {
      __assert_rtn("_GetCompressedSize", "StreamingUnzipper.m", 356, "currentState.streamState > kStreamStateIncompleteDataDescriptor");
    }
    if (![v1 dataDescriptor]) {
      __assert_rtn("_GetCompressedSize", "StreamingUnzipper.m", 357, "NULL != currentState.dataDescriptor");
    }
    BOOL HasZip64ExtraField = LocalFileRecordHasZip64ExtraField([v1 currentLFRecord]);
    uint64_t v4 = [v1 dataDescriptor];
    if (HasZip64ExtraField) {
      uint64_t v5 = *(void *)(v4 + 8);
    }
    else {
      uint64_t v5 = *(unsigned int *)(v4 + 8);
    }
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v5 = *(unsigned int *)(v2 + 18);
    if ((v5 == -1 || *(_DWORD *)(v2 + 22) == -1) && GetZip64ExtraFieldDataFromLF(v2, 0, &v7)) {
      uint64_t v5 = v7;
    }
  }

  return v5;
}

id GetFileNameStringFromLocalFileRecord(_WORD *a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  size_t v2 = (unsigned __int16)a1[13];
  CFDictionaryRef v3 = (unsigned __int8 *)malloc_type_calloc(v2 + 1, 1uLL, 0xCB3B20E1uLL);
  memcpy(v3, a1 + 15, v2);
  if (!v3)
  {
    uint64_t v11 = SZGetLoggingHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int buf = 0;
      _os_log_error_impl(&dword_1DD5BF000, v11, OS_LOG_TYPE_ERROR, "Failed to get name from local file record.", buf, 2u);
    }

    id v10 = 0;
    goto LABEL_67;
  }
  uint64_t v4 = 0;
  char v5 = 0;
  int v6 = 0;
  int v7 = 0;
  do
  {
    int v8 = v3[v4];
    if ((char)v3[v4] < 0)
    {
      char v5 = 1;
    }
    else if (v2 != v4 && !v3[v4])
    {
      size_t v12 = SZGetLoggingHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)int buf = 136315650;
        CFIndex v28 = v3;
        __int16 v29 = 2048;
        size_t v30 = v2;
        __int16 v31 = 2048;
        uint64_t v32 = v4;
        _os_log_error_impl(&dword_1DD5BF000, v12, OS_LOG_TYPE_ERROR, "Found NUL in path %s length %zu at %zu", buf, 0x20u);
      }

LABEL_43:
      id v10 = 0;
      goto LABEL_66;
    }
    switch(v7)
    {
      case 0:
        if (v8 == 47) {
          int v7 = 0;
        }
        else {
          int v7 = 3;
        }
        if (v8 == 46) {
          int v7 = 1;
        }
        break;
      case 1:
        if (v8 == 47) {
          int v7 = 0;
        }
        else {
          int v7 = 3;
        }
        if (v8 == 46) {
          int v7 = 2;
        }
        break;
      case 2:
        if (v8 == 47) {
          int v7 = 0;
        }
        else {
          int v7 = 3;
        }
        if (v8 == 47) {
          int v9 = 1;
        }
        else {
          int v9 = v6;
        }
        if (v3[v4])
        {
          int v6 = v9;
        }
        else
        {
          int v7 = 0;
          int v6 = 1;
        }
        break;
      case 3:
        if (v8 == 47) {
          int v7 = 0;
        }
        else {
          int v7 = 3;
        }
        break;
      default:
        break;
    }
    ++v4;
  }
  while (v2 + 1 != v4);
  if (v5)
  {
    if (!(((a1[3] & 0x800) == 0) | v6 & 1))
    {
LABEL_36:
      id v10 = (void *)[[NSString alloc] initWithBytes:v3 length:v2 encoding:4];
      goto LABEL_66;
    }
  }
  else if ((v6 & 1) == 0)
  {
    goto LABEL_36;
  }
  id v10 = (void *)[[NSString alloc] initWithBytes:v3 length:v2 encoding:4];
  if (!v10)
  {
    id v14 = [NSString alloc];
    id v10 = objc_msgSend(v14, "initWithBytes:length:encoding:", v3, v2, objc_msgSend(NSString, "defaultCStringEncoding"));
    if (!v10)
    {
      id v10 = (void *)[[NSString alloc] initWithBytes:v3 length:v2 encoding:CFStringConvertEncodingToNSStringEncoding(0x600u)];
      if (!v10)
      {
        id v10 = (void *)[[NSString alloc] initWithBytes:v3 length:v2 encoding:CFStringConvertEncodingToNSStringEncoding(0x400u)];
        if (!v10)
        {
          long long v24 = SZGetLoggingHandle();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)int buf = 136315138;
            CFIndex v28 = v3;
            _os_log_error_impl(&dword_1DD5BF000, v24, OS_LOG_TYPE_ERROR, "Failed to convert path to string: %s", buf, 0xCu);
          }

          goto LABEL_43;
        }
      }
    }
  }
  if (v6)
  {
    uint64_t v26 = v10;
    uint64_t v25 = [v10 componentsSeparatedByString:@"/"];
    uint64_t v15 = (void *)[v25 mutableCopy];
    uint64_t v16 = [v15 count];
    if (v16)
    {
      uint64_t v17 = v16;
      for (uint64_t i = 0; i != v17; ++i)
      {
        uint64_t v19 = [v15 count];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = 0;
          while (1)
          {
            unint64_t v22 = [v15 objectAtIndex:v21];
            if ([v22 isEqualToString:@".."]) {
              break;
            }
            if (v21
              && (([v22 isEqualToString:@"."] & 1) != 0
               || [v22 isEqualToString:&stru_1F38CF300]))
            {
              goto LABEL_62;
            }

            if (v20 == ++v21) {
              goto LABEL_64;
            }
          }
          [v15 removeObjectAtIndex:v21];
          if (!v21) {
            goto LABEL_63;
          }
          --v21;
LABEL_62:
          [v15 removeObjectAtIndex:v21];
LABEL_63:
        }
LABEL_64:
        ;
      }
    }
    id v10 = [v15 componentsJoinedByString:@"/"];
  }
LABEL_66:
  free(v3);
LABEL_67:

  return v10;
}

uint64_t _GetCRC32(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 currentLFRecord];
  if ([v1 currentLFRequiresDataDescriptor])
  {
    if ([v1 streamState] <= 3) {
      __assert_rtn("_GetCRC32", "StreamingUnzipper.m", 322, "currentState.streamState > kStreamStateIncompleteDataDescriptor");
    }
    if (![v1 dataDescriptor]) {
      __assert_rtn("_GetCRC32", "StreamingUnzipper.m", 323, "NULL != currentState.dataDescriptor");
    }
    LocalFileRecordHasZip64ExtraField([v1 currentLFRecord]);
    CFDictionaryRef v3 = (unsigned int *)([v1 dataDescriptor] + 4);
  }
  else
  {
    CFDictionaryRef v3 = (unsigned int *)(v2 + 14);
  }
  uint64_t v4 = *v3;

  return v4;
}

id StringFromDigest(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v2 = a2;
  for (uint64_t i = [MEMORY[0x1E4F28E78] stringWithCapacity:a2];
  {
    unsigned int v5 = *a1++;
    objc_msgSend(i, "appendFormat:", @"%02x", v5);
  }

  return i;
}

uint64_t _GetAndValidatePathDepth(const char *a1, int a2, int *a3)
{
  int v6 = strndup(a1, 0x400uLL);
  __stringp = v6;
  if (!v6) {
    return 0;
  }
  int v7 = v6;
  if (*v6 == 47 || !*a1)
  {
LABEL_14:
    uint64_t v9 = 0;
    goto LABEL_15;
  }
  while (1)
  {
    int v8 = strsep(&__stringp, "/");
    if (!v8) {
      break;
    }
    if (*v8)
    {
      if (*v8 != 46) {
        goto LABEL_10;
      }
      if (v8[1])
      {
        if (v8[1] == 46 && !v8[2])
        {
          --a2;
          goto LABEL_11;
        }
LABEL_10:
        ++a2;
      }
    }
LABEL_11:
    if (a2 < 1) {
      goto LABEL_14;
    }
  }
  *a3 = a2;
  uint64_t v9 = 1;
LABEL_15:
  free(v7);
  return v9;
}

void sub_1DD5DB3D0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t _RemoveAndRecreateDirectoryAtPath(void *a1, void *a2)
{
  *(void *)&v70[13] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  uint64_t v65 = *MEMORY[0x1E4F28330];
  uint64_t v4 = [NSNumber numberWithUnsignedShort:16877];
  __int16 v66 = v4;
  unsigned int v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v66 forKeys:&v65 count:1];

  id v6 = v3;
  int v7 = open((const char *)[v6 fileSystemRepresentation], 256);
  if (v7 < 0)
  {
    uint64_t v12 = *__error();
    uint64_t v13 = SZGetLoggingHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v53 = [v6 fileSystemRepresentation];
      size_t v54 = strerror(v12);
      *(_DWORD *)int buf = 136315394;
      uint64_t v68 = v53;
      __int16 v69 = 2080;
      *(void *)long long v70 = v54;
      _os_log_error_impl(&dword_1DD5BF000, v13, OS_LOG_TYPE_ERROR, "Failed to open %s : %s", buf, 0x16u);
    }

    id v14 = (void *)*MEMORY[0x1E4F28798];
    uint64_t v15 = [v6 fileSystemRepresentation];
    strerror(v12);
    uint64_t v17 = _CreateError((uint64_t)"_GetDataProtectionClassForPath", 586, v14, v12, 0, 0, @"Failed to open %s : %s", v16, v15);
  }
  else
  {
    int v8 = v7;
    uint64_t v9 = fcntl(v7, 63);
    if ((v9 & 0x80000000) == 0)
    {
      uint64_t v10 = v9;
      close(v8);

      int v11 = 1;
      goto LABEL_14;
    }
    uint64_t v18 = *__error();
    uint64_t v19 = SZGetLoggingHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v57 = [v6 fileSystemRepresentation];
      CFIndex v58 = strerror(v18);
      *(_DWORD *)int buf = 136315394;
      uint64_t v68 = v57;
      __int16 v69 = 2080;
      *(void *)long long v70 = v58;
      _os_log_error_impl(&dword_1DD5BF000, v19, OS_LOG_TYPE_ERROR, "Failed to get protection class on %s : %s", buf, 0x16u);
    }

    id v14 = (void *)*MEMORY[0x1E4F28798];
    uint64_t v20 = [v6 fileSystemRepresentation];
    strerror(v18);
    uint64_t v17 = _CreateError((uint64_t)"_GetDataProtectionClassForPath", 593, v14, v18, 0, 0, @"Failed to get protection class on %s : %s", v21, v20);
    close(v8);
  }
  id v22 = v17;

  id v23 = v22;
  uint64_t v24 = [v23 domain];
  if (v14 != (void *)v24)
  {
    uint64_t v25 = v24;
    goto LABEL_29;
  }
  uint64_t v26 = [v23 code];

  if (v26 != 2) {
    goto LABEL_30;
  }

  int v11 = 0;
  uint64_t v10 = 0xFFFFFFFFLL;
LABEL_14:
  uint64_t v27 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v64 = 0;
  char v28 = [v27 removeItemAtPath:v6 error:&v64];
  id v23 = v64;

  if (v28)
  {
LABEL_15:
    __int16 v29 = v23;
    size_t v30 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v63 = v23;
    char v31 = [v30 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:v5 error:&v63];
    id v23 = v63;

    if (v31)
    {
      if (!v11)
      {
        uint64_t v45 = 1;
        goto LABEL_42;
      }
      id v32 = v6;
      int v33 = open((const char *)[v32 fileSystemRepresentation], 256);
      if (v33 < 0)
      {
        uint64_t v46 = *__error();
        id v47 = SZGetLoggingHandle();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          uint64_t v61 = [v32 fileSystemRepresentation];
          __int16 v62 = strerror(v46);
          *(_DWORD *)int buf = 136315394;
          uint64_t v68 = v61;
          __int16 v69 = 2080;
          *(void *)long long v70 = v62;
          _os_log_error_impl(&dword_1DD5BF000, v47, OS_LOG_TYPE_ERROR, "Failed to open %s : %s", buf, 0x16u);
        }

        uint32_t v48 = (void *)*MEMORY[0x1E4F28798];
        uint64_t v49 = [v32 fileSystemRepresentation];
        strerror(v46);
        uint64_t v40 = _CreateError((uint64_t)"_SetDataProtectionClassOnPath", 615, v48, v46, 0, 0, @"Failed to open %s : %s", v50, v49);
      }
      else
      {
        int v34 = v33;
        if (!fcntl(v33, 64, v10))
        {
          close(v34);
          char v52 = 1;
          id v51 = v23;
LABEL_38:

          id v55 = v51;
          if (v52)
          {
            uint64_t v45 = 1;
            id v23 = v55;
            goto LABEL_42;
          }
          id v23 = v55;
          if (!a2)
          {
LABEL_41:
            uint64_t v45 = 0;
            goto LABEL_42;
          }
          goto LABEL_31;
        }
        uint64_t v35 = *__error();
        long long v36 = SZGetLoggingHandle();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          uint64_t v59 = [v32 fileSystemRepresentation];
          int v60 = strerror(v35);
          *(_DWORD *)int buf = 136315650;
          uint64_t v68 = v59;
          __int16 v69 = 1024;
          *(_DWORD *)long long v70 = v10;
          v70[2] = 2080;
          *(void *)&v70[3] = v60;
          _os_log_error_impl(&dword_1DD5BF000, v36, OS_LOG_TYPE_ERROR, "Failed to set protection class on %s to %d: %s", buf, 0x1Cu);
        }

        long long v37 = (void *)*MEMORY[0x1E4F28798];
        uint64_t v38 = [v32 fileSystemRepresentation];
        strerror(v35);
        uint64_t v40 = _CreateError((uint64_t)"_SetDataProtectionClassOnPath", 621, v37, v35, 0, 0, @"Failed to set protection class on %s to %d: %s", v39, v38);
        close(v34);
      }
      id v51 = v40;

      char v52 = 0;
      goto LABEL_38;
    }
    uint64_t v25 = SZGetLoggingHandle();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    *(_DWORD *)int buf = 138412546;
    uint64_t v68 = (uint64_t)v6;
    __int16 v69 = 2112;
    *(void *)long long v70 = v23;
    uint64_t v43 = "Failed to create extraction directory at path %@: %@";
    goto LABEL_44;
  }
  id v41 = (void *)*MEMORY[0x1E4F281F8];
  int v42 = [v23 domain];
  if (v41 == v42)
  {
    uint64_t v44 = [v23 code];

    if (v44 == 4)
    {

      id v23 = 0;
      goto LABEL_15;
    }
  }
  else
  {
  }
  uint64_t v25 = SZGetLoggingHandle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)int buf = 138412546;
    uint64_t v68 = (uint64_t)v6;
    __int16 v69 = 2112;
    *(void *)long long v70 = v23;
    uint64_t v43 = "Failed to remove bad extraction path at %@: %@";
LABEL_44:
    _os_log_error_impl(&dword_1DD5BF000, v25, OS_LOG_TYPE_ERROR, v43, buf, 0x16u);
  }
LABEL_29:

LABEL_30:
  if (!a2) {
    goto LABEL_41;
  }
LABEL_31:
  id v23 = v23;
  uint64_t v45 = 0;
  *a2 = v23;
LABEL_42:

  return v45;
}

uint64_t _ValidateDictionaryKeyValueType(void *a1, void *a2, objc_class *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = [a1 objectForKey:v5];
  if (v6 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    int v8 = SZGetLoggingHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = NSStringFromClass(a3);
      int v11 = (objc_class *)objc_opt_class();
      uint64_t v12 = NSStringFromClass(v11);
      int v13 = 138412802;
      id v14 = v5;
      __int16 v15 = 2112;
      uint64_t v16 = v10;
      __int16 v17 = 2112;
      uint64_t v18 = v12;
      _os_log_error_impl(&dword_1DD5BF000, v8, OS_LOG_TYPE_ERROR, "Value of key %@ in options dictionary was not an object of type %@. Was %@", (uint8_t *)&v13, 0x20u);
    }
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

id FetchGroupIDs(void *a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v2 = getgroups(16, v19);
  if (v2 != -1)
  {
    int v3 = v2;
    uint64_t v4 = objc_opt_new();
    if (v3 >= 1)
    {
      uint64_t v5 = v3;
      id v6 = v19;
      do
      {
        unsigned int v7 = *v6++;
        int v8 = [NSNumber numberWithUnsignedInt:v7];
        [v4 addObject:v8];

        --v5;
      }
      while (v5);
    }
    uint64_t v9 = (void *)[v4 copy];
    uint64_t v10 = 0;
    if (!a1) {
      goto LABEL_12;
    }
LABEL_10:
    if (!v9) {
      *a1 = v10;
    }
    goto LABEL_12;
  }
  uint64_t v11 = *__error();
  uint64_t v12 = SZGetLoggingHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)int buf = 136315138;
    uint64_t v18 = strerror(v11);
    _os_log_error_impl(&dword_1DD5BF000, v12, OS_LOG_TYPE_ERROR, "Failed to get current group access list: %s", buf, 0xCu);
  }

  int v13 = (void *)*MEMORY[0x1E4F28798];
  id v14 = strerror(v11);
  uint64_t v10 = _CreateError((uint64_t)"FetchGroupIDs", 250, v13, v11, 0, 0, @"Failed to get current group access list: %s", v15, (uint64_t)v14);
  uint64_t v4 = 0;
  uint64_t v9 = 0;
  if (a1) {
    goto LABEL_10;
  }
LABEL_12:

  return v9;
}

void sub_1DD5E1288(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,id location)
{
  objc_destroyWeak(v38);
  objc_destroyWeak(v37);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD5E18B4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1DD5E2670(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x1F40C9718](md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return MEMORY[0x1F40C9720](c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9728](c, data, *(void *)&len);
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x1F40C9738](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x1F40C9740](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9748](c, data, *(void *)&len);
}

int CC_SHA224_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9758](md, c);
}

int CC_SHA224_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9760](c);
}

int CC_SHA224_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9768](c, data, *(void *)&len);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9778](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9780](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9788](c, data, *(void *)&len);
}

int CC_SHA384_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x1F40C9798](md, c);
}

int CC_SHA384_Init(CC_SHA512_CTX *c)
{
  return MEMORY[0x1F40C97A0](c);
}

int CC_SHA384_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C97A8](c, data, *(void *)&len);
}

int CC_SHA512_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x1F40C97B8](md, c);
}

int CC_SHA512_Init(CC_SHA512_CTX *c)
{
  return MEMORY[0x1F40C97C0](c);
}

int CC_SHA512_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C97C8](c, data, *(void *)&len);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1F40D7160](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1F40D7170](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1F40D7818](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7978](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1F40D7A00]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1F40D7F18](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7F50](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

unint64_t CFStringConvertEncodingToNSStringEncoding(CFStringEncoding encoding)
{
  return MEMORY[0x1F40D83A8](*(void *)&encoding);
}

CFStringRef CFStringCreateWithFileSystemRepresentation(CFAllocatorRef alloc, const char *buffer)
{
  return (CFStringRef)MEMORY[0x1F40D8478](alloc, buffer);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1F40D8490](alloc, formatOptions, format);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8510](theString, buffer, bufferSize, *(void *)&encoding);
}

Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x1F40D8558](string, buffer, maxBufLen);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1F40C9C28]();
}

uint64_t _os_crash_msg()
{
  return MEMORY[0x1F40C9FA8]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x1F40C9FF8]();
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1F40CA440](a1, a2);
}

void bzero(void *a1, size_t a2)
{
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1F40CB3A0](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

compression_status compression_stream_destroy(compression_stream *stream)
{
  return MEMORY[0x1F417F0C0](stream);
}

uint64_t compression_stream_get_state_size()
{
  return MEMORY[0x1F417F0C8]();
}

compression_status compression_stream_init(compression_stream *stream, compression_stream_operation operation, compression_algorithm algorithm)
{
  return MEMORY[0x1F417F0D0](stream, *(void *)&operation, *(void *)&algorithm);
}

uint64_t compression_stream_is_state_valid()
{
  return MEMORY[0x1F417F0D8]();
}

compression_status compression_stream_process(compression_stream *stream, int flags)
{
  return MEMORY[0x1F417F0E0](stream, *(void *)&flags);
}

uint64_t compression_stream_reinit()
{
  return MEMORY[0x1F417F0E8]();
}

uLong crc32(uLong crc, const Bytef *buf, uInt len)
{
  return MEMORY[0x1F4182BC0](crc, buf, *(void *)&len);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

int fchmod(int a1, mode_t a2)
{
  return MEMORY[0x1F40CC028](*(void *)&a1, a2);
}

int fchown(int a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1F40CC038](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1F40CC050](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1F40CC058](*(void *)&a1, *(void *)&a2);
}

int feof(FILE *a1)
{
  return MEMORY[0x1F40CC098](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x1F40CC0A0](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1F40CC0C8](a1);
}

int fileno(FILE *a1)
{
  return MEMORY[0x1F40CC110](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1F40CC1C0](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC200](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fseeko(FILE *__stream, off_t a2, int __whence)
{
  return MEMORY[0x1F40CC298](__stream, a2, *(void *)&__whence);
}

int fsetxattr(int fd, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1F40CC2A8](*(void *)&fd, name, value, size, *(void *)&position, *(void *)&options);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1F40CC2B8](*(void *)&a1, a2);
}

off_t ftello(FILE *__stream)
{
  return MEMORY[0x1F40CC2E8](__stream);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1F40CC2F0](*(void *)&a1, a2);
}

int fts_close(FTS *a1)
{
  return MEMORY[0x1F40CC2F8](a1);
}

FTS *__cdecl fts_open(char *const *a1, int a2, int (__cdecl *a3)(const FTSENT **, const FTSENT **))
{
  return (FTS *)MEMORY[0x1F40CC300](a1, *(void *)&a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return (FTSENT *)MEMORY[0x1F40CC308](a1);
}

int futimes(int a1, const timeval *a2)
{
  return MEMORY[0x1F40CC330](*(void *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC338](__ptr, __size, __nitems, __stream);
}

int getgroups(int a1, gid_t a2[])
{
  return MEMORY[0x1F40CC3F0](*(void *)&a1, a2);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

uid_t getuid(void)
{
  return MEMORY[0x1F40CC570]();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1F40CC590](path, name, value, size, *(void *)&position, *(void *)&options);
}

int lchmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1F40CC7F0](a1, a2);
}

int lchown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1F40CC7F8](a1, *(void *)&a2, *(void *)&a3);
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1F40CC870](a1, a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1F40CC8F8](*(void *)&a1, a2, *(void *)&a3);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CC900](a1, a2);
}

int lutimes(const char *a1, const timeval *a2)
{
  return MEMORY[0x1F40CC908](a1, a2);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1F40CCDD0](a1, a2);
}

int mkpath_np(const char *path, mode_t omode)
{
  return MEMORY[0x1F40CCE00](path, omode);
}

time_t mktime(tm *a1)
{
  return MEMORY[0x1F40CCE30](a1);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1F40CCE40](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1F40CCE88](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1F40CD838](a1);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x1F40CD978](a1);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x1F40CD9A8](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1F40CDBD8]();
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1F40CDC50](*(void *)&a1, a2, a3);
}

ssize_t readlink(const char *a1, char *a2, size_t a3)
{
  return MEMORY[0x1F40CDC70](a1, a2, a3);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1F40CDC88](__ptr, __size);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1F40CDC98](a1, a2);
}

int removexattr(const char *path, const char *name, int options)
{
  return MEMORY[0x1F40CDD48](path, name, *(void *)&options);
}

char *__cdecl rindex(const char *a1, int a2)
{
  return (char *)MEMORY[0x1F40CDD88](a1, *(void *)&a2);
}

uint64_t sandbox_check_by_audit_token()
{
  return MEMORY[0x1F40CDDD8]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1F40CDDF8]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1F40CDE00]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1F40CDE50]();
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1F40CDFD8](path, name, value, size, *(void *)&position, *(void *)&options);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CE110](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1F40CE138](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1F40CE150](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1F40CE178](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CE1F0](__s1, __s2, __n);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x1F40CE200](__s1, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1F40CE230](__s, *(void *)&__c);
}

char *__cdecl strsep(char **__stringp, const char *__delim)
{
  return (char *)MEMORY[0x1F40CE238](__stringp, __delim);
}

int symlink(const char *a1, const char *a2)
{
  return MEMORY[0x1F40CE360](a1, a2);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1F40CE588](a1);
}

int unlink(const char *a1)
{
  return MEMORY[0x1F40CE5E0](a1);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1F40CE928](*(void *)&__fd, __buf, __nbyte);
}