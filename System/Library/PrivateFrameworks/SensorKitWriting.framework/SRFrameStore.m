@interface SRFrameStore
+ (void)initialize;
- (SRFramesStoreOffsetEnumerator)enumerateFromOffset:(SRFramesStoreOffsetEnumerator *)result;
- (uint64_t)initWithFileHandle:(unint64_t)a3 maxSize:(uint64_t)a4 permission:(uint64_t)a5 defaults:;
- (uint64_t)isValidFrame:(uint64_t)result;
- (uint64_t)resizeBackingFileTo:(uint64_t)result;
- (uint64_t)resizeMappedRegionTo:(uint64_t)a1;
- (uint64_t)writeFrameForBytes:(z_size_t)a3 length:(SRError *)a4 timestamp:(double)a5 error:;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)dealloc;
- (void)sync;
@end

@implementation SRFrameStore

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    SRLogFrameStore = (uint64_t)os_log_create("com.apple.SensorKit", "FrameStore");
  }
}

- (uint64_t)initWithFileHandle:(unint64_t)a3 maxSize:(uint64_t)a4 permission:(uint64_t)a5 defaults:
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  if (!a1) {
    return 0;
  }
  v53.receiver = a1;
  v53.super_class = (Class)SRFrameStore;
  v9 = objc_msgSendSuper2(&v53, sel_init);
  uint64_t v10 = (uint64_t)v9;
  if (!v9) {
    return v10;
  }
  if (a5) {
    unint64_t v11 = *(void *)(a5 + 8);
  }
  else {
    unint64_t v11 = 0;
  }
  if (v11 >= 0xFFFFFFFF) {
    int v12 = -1;
  }
  else {
    int v12 = v11;
  }
  v9[2] = v12;
  uint64_t v56 = 0;
  long long v55 = 0u;
  memset(v54, 0, sizeof(v54));
  self;
  unint64_t v13 = [a2 seekToEndOfFile];
  [a2 seekToFileOffset:0];
  if (a2)
  {
    v14 = (void *)[-[NSFileHandle pathname](a2) lastPathComponent];
    if (!v13) {
      goto LABEL_21;
    }
  }
  else
  {
    v14 = 0;
    if (!v13) {
      goto LABEL_21;
    }
  }
  v15 = -[NSFileHandle pathname](a2);
  if (v13 > 0x37)
  {
    v21 = (void *)[a2 readDataOfLength:56];
    [a2 seekToFileOffset:0];
    if (v21 && (unint64_t)[v21 length] > 0x37)
    {
      uint64_t v24 = [v21 bytes];
      uint64_t v25 = v24;
      if (*(_DWORD *)v24 == 1195725633)
      {
        long long v52 = *(_OWORD *)(v24 + 16);
        v54[0] = *(_OWORD *)v24;
        v54[1] = v52;
        long long v55 = *(_OWORD *)(v24 + 32);
        uint64_t v56 = *(void *)(v24 + 48);
        goto LABEL_22;
      }
      uint64_t v26 = SRLogFrameStore;
      if (os_log_type_enabled((os_log_t)SRLogFrameStore, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289794;
        *(_DWORD *)v58 = 4;
        *(_WORD *)&v58[4] = 2082;
        *(void *)&v58[6] = "ASEG";
        *(_WORD *)&v58[14] = 1042;
        *(_DWORD *)&v58[16] = 4;
        *(_WORD *)v59 = 2082;
        *(void *)&v59[2] = v25;
        __int16 v60 = 2114;
        v61 = v15;
        v17 = "Segment header magic number %{public}.4s doesn't match %{public}.4s in file %{public}@. Potentially overwr"
              "iting whatever data is currently there";
        v18 = v26;
        os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
        uint32_t v20 = 44;
        goto LABEL_20;
      }
    }
    else
    {
      uint64_t v22 = SRLogFrameStore;
      if (os_log_type_enabled((os_log_t)SRLogFrameStore, OS_LOG_TYPE_INFO))
      {
        uint64_t v23 = [v21 length];
        *(_DWORD *)buf = 138543618;
        *(void *)v58 = v15;
        *(_WORD *)&v58[8] = 2050;
        *(void *)&v58[10] = v23;
        v17 = "Unable to read frames file segment header %{public}@. Received data of %{public}lu length. Potentially ove"
              "rwriting whatever data is currently there";
        v18 = v22;
        os_log_type_t v19 = OS_LOG_TYPE_INFO;
        uint32_t v20 = 22;
        goto LABEL_20;
      }
    }
  }
  else
  {
    uint64_t v16 = SRLogFrameStore;
    if (os_log_type_enabled((os_log_t)SRLogFrameStore, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)v58 = v15;
      v17 = "Frames file %{public}@ is invalid because the current size is less than a valid segment header. Potentially "
            "overwriting whatever data is currently there.";
      v18 = v16;
      os_log_type_t v19 = OS_LOG_TYPE_INFO;
      uint32_t v20 = 12;
LABEL_20:
      _os_log_impl(&dword_25C11B000, v18, v19, v17, buf, v20);
    }
  }
LABEL_21:
  SRMakeSegmentHeader((uint64_t)v54, 0, v14, v12);
LABEL_22:
  unint64_t v27 = [a2 seekToEndOfFile];
  [a2 seekToFileOffset:0];
  v29 = -[NSFileHandle pathname](a2);
  unint64_t v30 = *(void *)((char *)v54 + 4);
  if (*(void *)((char *)v54 + 4) > v27)
  {
    uint64_t v31 = SRLogFrameStore;
    if (os_log_type_enabled((os_log_t)SRLogFrameStore, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543874;
      *(void *)v58 = v29;
      *(_WORD *)&v58[8] = 2048;
      *(void *)&v58[10] = v30;
      *(_WORD *)&v58[18] = 2050;
      *(void *)v59 = a3;
      v32 = "Segment header in %{public}@ says file size is %llu but that is larger than the max size (%{public}lu) we can support.";
      v33 = v31;
      os_log_type_t v34 = OS_LOG_TYPE_INFO;
      uint32_t v35 = 32;
LABEL_43:
      _os_log_impl(&dword_25C11B000, v33, v34, v32, buf, v35);
      goto LABEL_44;
    }
    goto LABEL_44;
  }
  if (!(*(void *)((char *)v54 + 4) | a4 & 0xFFFFFFFFFFFFFFFDLL))
  {
    uint64_t v45 = SRLogFrameStore;
    if (os_log_type_enabled((os_log_t)SRLogFrameStore, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)v58 = v29;
      v32 = "Not mapping an empty file %{public}@";
      v33 = v45;
      os_log_type_t v34 = OS_LOG_TYPE_DEFAULT;
      uint32_t v35 = 12;
      goto LABEL_43;
    }
LABEL_44:

    return 0;
  }
  int v36 = DWORD1(v54[1]);
  int v37 = *(_DWORD *)(v10 + 8);
  if (DWORD1(v54[1]) != v37)
  {
    v38 = SRLogFrameStore;
    if (os_log_type_enabled((os_log_t)SRLogFrameStore, OS_LOG_TYPE_DEFAULT))
    {
      v39 = "";
      *(_DWORD *)buf = 138544130;
      *(void *)v58 = v29;
      *(_WORD *)&v58[8] = 1026;
      if (a4 == 1) {
        v39 = "Potentially overwriting whatever data is currently there";
      }
      *(_DWORD *)&v58[10] = v36;
      *(_WORD *)&v58[14] = 1026;
      *(_DWORD *)&v58[16] = v37;
      *(_WORD *)v59 = 2080;
      *(void *)&v59[2] = v39;
      _os_log_impl(&dword_25C11B000, v38, OS_LOG_TYPE_DEFAULT, "Segment versions of %{public}@ don't match. Received %{public}d, expected %{public}d.%s", buf, 0x22u);
    }
    unint64_t v30 = 0;
    *(void *)((char *)v54 + 4) = 0;
  }
  if (a2) {
    v40 = (void *)[-[NSFileHandle pathname](a2) lastPathComponent];
  }
  else {
    v40 = 0;
  }
  objc_setProperty_nonatomic_copy((id)v10, v28, v40, 40);
  if (v30 <= a3) {
    uint64_t v41 = a3;
  }
  else {
    uint64_t v41 = v30;
  }
  *(void *)(v10 + 32) = a4;
  v42 = (void *)memoryMappingsForPermission(a4, (uint64_t)v54, v41, v30);
  *(void *)(v10 + 56) = a2;
  if (a4 == 1 && (-[SRFrameStore resizeBackingFileTo:](v10, v41) & 1) == 0)
  {
    v51 = SRLogFrameStore;
    if (os_log_type_enabled((os_log_t)SRLogFrameStore, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_25C11B000, v51, OS_LOG_TYPE_ERROR, "Failed to resize backing file", buf, 2u);
    }
    goto LABEL_44;
  }
  *(void *)(v10 + 16) = (id)[v42 lastObject];
  if ((unint64_t)[v42 count] <= 1)
  {
    id v44 = *(id *)(v10 + 24);
  }
  else
  {
    id v44 = (id)[v42 firstObject];
    *(void *)(v10 + 24) = v44;
  }
  id Property = objc_getProperty((id)v10, v43, 56, 1);
  -[SRMemoryMapping mapWithFileHandle:]((uint64_t)v44, Property);
  uint64_t v47 = *(void *)(v10 + 16);
  id v49 = objc_getProperty((id)v10, v48, 56, 1);
  -[SRMemoryMapping mapWithFileHandle:](v47, v49);
  *(void *)(v10 + 48) = *(void *)((char *)v54 + 12);
  return v10;
}

- (uint64_t)resizeBackingFileTo:(uint64_t)result
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  if (result)
  {
    if (*(void *)(result + 32) == 1)
    {
      [*(id *)(result + 56) truncateFileAtOffset:a2];
      return 1;
    }
    else
    {
      v2 = SRLogFrameStore;
      result = os_log_type_enabled((os_log_t)SRLogFrameStore, OS_LOG_TYPE_ERROR);
      if (result)
      {
        *(_WORD *)v3 = 0;
        _os_log_error_impl(&dword_25C11B000, v2, OS_LOG_TYPE_ERROR, "Attempting to resize a non-writable file", v3, 2u);
        return 0;
      }
    }
  }
  return result;
}

- (void)dealloc
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (self)
  {
    header = self->_header;
    if (header && (start = (char *)header->_start) != 0)
    {
      uint64_t v5 = *(void *)(start + 4);
    }
    else
    {
      frames = self->_frames;
      if (frames) {
        uint64_t v5 = (char *)frames->_currentPosition - (char *)frames->_start + 56;
      }
      else {
        uint64_t v5 = 56;
      }
    }
    v7 = SRLogFrameStore;
    if (os_log_type_enabled((os_log_t)SRLogFrameStore, OS_LOG_TYPE_INFO))
    {
      id Property = objc_getProperty(self, v8, 56, 1);
LABEL_9:
      *(_DWORD *)buf = 138543362;
      v17 = -[NSFileHandle pathname](Property);
      _os_log_impl(&dword_25C11B000, v7, OS_LOG_TYPE_INFO, "Tearing down frame store for %{public}@", buf, 0xCu);
    }
  }
  else
  {
    v7 = SRLogFrameStore;
    uint64_t v5 = 0;
    if (os_log_type_enabled((os_log_t)SRLogFrameStore, OS_LOG_TYPE_INFO))
    {
      id Property = 0;
      goto LABEL_9;
    }
  }

  self->_header = 0;
  self->_frames = 0;
  if (self->_permission == 1)
  {
    unint64_t v11 = SRLogFrameStore;
    if (os_log_type_enabled((os_log_t)SRLogFrameStore, OS_LOG_TYPE_INFO))
    {
      id v13 = objc_getProperty(self, v12, 56, 1);
      v14 = -[NSFileHandle pathname](v13);
      *(_DWORD *)buf = 138543618;
      v17 = v14;
      __int16 v18 = 2050;
      uint64_t v19 = v5;
      _os_log_impl(&dword_25C11B000, v11, OS_LOG_TYPE_INFO, "Finalizing %{public}@ to %{public}llu bytes", buf, 0x16u);
    }
    -[SRFrameStore resizeBackingFileTo:]((uint64_t)self, v5);
  }
  objc_setProperty_atomic(self, v10, 0, 56);

  self->_segmentName = 0;
  v15.receiver = self;
  v15.super_class = (Class)SRFrameStore;
  [(SRFrameStore *)&v15 dealloc];
}

- (uint64_t)resizeMappedRegionTo:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  NSUInteger v3 = NSRoundUpToMultipleOfPageSize(bytes);
  if (!-[SRFrameStore resizeBackingFileTo:](a1, v3)) {
    return 0;
  }
  uint64_t v4 = *(void *)(a1 + 24);
  if (!v4) {
    return 0;
  }
  uint64_t v5 = *(void *)(v4 + 16);
  if (!v5) {
    return 0;
  }
  v6 = (void *)memoryMappingsForPermission(*(void *)(a1 + 32), v5, v3, *(void *)(v5 + 4));

  id v7 = (id)[v6 lastObject];
  *(void *)(a1 + 16) = v7;
  v8 = *(void **)(a1 + 56);

  return -[SRMemoryMapping mapWithFileHandle:]((uint64_t)v7, v8);
}

- (uint64_t)isValidFrame:(uint64_t)result
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (result)
  {
    NSUInteger v3 = (const Bytef *)(a2 + 20);
    z_size_t v4 = *(unsigned int *)(a2 + 16);
    unint64_t v5 = *(void *)(result + 16);
    if (v5) {
      unint64_t v5 = *(void *)(v5 + 24);
    }
    if (a2 + 20 + v4 > v5) {
      return 0;
    }
    uLong v6 = adler32(0, 0, 0);
    uLong v7 = adler32_z(v6, v3, v4);
    uint64_t v8 = *(void *)(a2 + 8);
    result = v7 == v8;
    if (v7 != v8 && v8 != 0)
    {
      uint64_t v10 = SRLogFrameStore;
      result = os_log_type_enabled((os_log_t)SRLogFrameStore, OS_LOG_TYPE_INFO);
      if (result)
      {
        int v11 = 134218240;
        uint64_t v12 = v8;
        __int16 v13 = 2050;
        uLong v14 = v7;
        _os_log_impl(&dword_25C11B000, v10, OS_LOG_TYPE_INFO, "Checksums don't match. Header: %llu, Generated checksum: %{public}lu. Skipping frame.", (uint8_t *)&v11, 0x16u);
        return 0;
      }
    }
  }
  return result;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  frames = self->_frames;
  if (frames)
  {
    unint64_t v10 = 0;
    var0 = (unsigned int *)((char *)frames->_start + a3->var0);
    while (var0 < frames->_currentPosition && v10 < a5)
    {
      if (-[SRFrameStore isValidFrame:]((uint64_t)self, (uint64_t)var0)) {
        a4[v10++] = var0;
      }
      var0 = (unsigned int *)((char *)var0 + var0[4] + 20);
      frames = self->_frames;
      if (!frames) {
        goto LABEL_12;
      }
    }
    frames = (SRMemoryMapping *)frames->_start;
  }
  else
  {
    unint64_t v10 = 0;
    var0 = (unsigned int *)a3->var0;
  }
LABEL_12:
  a3->var0 = (char *)var0 - (char *)frames;
  a3->var1 = a4;
  a3->var2 = (unint64_t *)self;
  return v10;
}

- (SRFramesStoreOffsetEnumerator)enumerateFromOffset:(SRFramesStoreOffsetEnumerator *)result
{
  if (result)
  {
    NSUInteger v3 = (SRFrameStore *)result;
    z_size_t v4 = [SRFramesStoreOffsetEnumerator alloc];
    if (v4)
    {
      v5.receiver = v4;
      v5.super_class = (Class)SRFramesStoreOffsetEnumerator;
      z_size_t v4 = (SRFramesStoreOffsetEnumerator *)[(SRFramesStoreOffsetEnumerator *)&v5 init];
      if (v4)
      {
        v4->_framesStore = v3;
        v4->_offset = a2;
      }
    }
    return v4;
  }
  return result;
}

- (uint64_t)writeFrameForBytes:(z_size_t)a3 length:(SRError *)a4 timestamp:(double)a5 error:
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (result)
  {
    uint64_t v6 = result;
    uint64_t v7 = *(void *)(result + 24);
    if (!v7 || (uint64_t v8 = *(void *)(v7 + 16)) == 0)
    {
      uint64_t v15 = SRLogFrameStore;
      if (os_log_type_enabled((os_log_t)SRLogFrameStore, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_25C11B000, v15, OS_LOG_TYPE_ERROR, "Failed to find a segment header while writing. Dropping incoming data", buf, 2u);
        if (!a4) {
          return 0;
        }
      }
      else if (!a4)
      {
        return 0;
      }
      uint64_t v14 = 12294;
      goto LABEL_27;
    }
    if (!*(void *)(v8 + 4))
    {
      uint64_t v29 = 0;
      long long v28 = 0u;
      memset(buf, 0, sizeof(buf));
      SRMakeSegmentHeader((uint64_t)buf, 56, *(void **)(result + 40), *(_DWORD *)(result + 8));
      -[SRMemoryMapping writeBytes:toOffset:length:](*(void **)(v6 + 24), buf, 0, 0x38uLL);
    }
    uint64_t v12 = *(void **)(v6 + 16);
    if (v12) {
      uint64_t v12 = (void *)(v12[6] - v12[3] + v12[2]);
    }
    if ((unint64_t)v12 < a3 + 20)
    {
      __int16 v13 = SRLogFrameStore;
      if (os_log_type_enabled((os_log_t)SRLogFrameStore, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_25C11B000, v13, OS_LOG_TYPE_ERROR, "No space left to write to the mapped region", buf, 2u);
        if (a4) {
          goto LABEL_11;
        }
      }
      else if (a4)
      {
LABEL_11:
        uint64_t v14 = 12291;
LABEL_27:
        uint64_t v22 = +[SRError errorWithCode:v14];
        result = 0;
        *a4 = v22;
        return result;
      }
      return 0;
    }
    double v16 = *(double *)(v6 + 48);
    if (v16 >= a5)
    {
      uint64_t v20 = SRLogFrameStore;
      if (os_log_type_enabled((os_log_t)SRLogFrameStore, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        *(double *)&uint8_t buf[4] = a5;
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = v16;
        _os_log_error_impl(&dword_25C11B000, v20, OS_LOG_TYPE_ERROR, "Frame should come in chronological order. Input %f < last %f", buf, 0x16u);
        if (!a4) {
          return 0;
        }
      }
      else if (!a4)
      {
        return 0;
      }
      uint64_t v14 = 12292;
      goto LABEL_27;
    }
    uint64_t v17 = mach_continuous_time();
    double v18 = SRAbsoluteTimeFromContinuousTime(v17);
    if (v18 + 10.0 < a5)
    {
      uint64_t v19 = SRLogFrameStore;
      if (os_log_type_enabled((os_log_t)SRLogFrameStore, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        *(double *)&uint8_t buf[4] = a5;
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = v18;
        _os_log_error_impl(&dword_25C11B000, v19, OS_LOG_TYPE_ERROR, "Timestamp is from the future. Input %f, Current: %f", buf, 0x16u);
        if (a4) {
          goto LABEL_19;
        }
      }
      else if (a4)
      {
LABEL_19:
        uint64_t v14 = 12296;
        goto LABEL_27;
      }
      return 0;
    }
    if (HIDWORD(a3))
    {
      v21 = SRLogFrameStore;
      if (os_log_type_enabled((os_log_t)SRLogFrameStore, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134349312;
        *(void *)&uint8_t buf[4] = a3;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = -1;
        _os_log_error_impl(&dword_25C11B000, v21, OS_LOG_TYPE_ERROR, "Sample too large %{public}zu but only %u supported", buf, 0x12u);
        if (!a4) {
          return 0;
        }
      }
      else if (!a4)
      {
        return 0;
      }
      uint64_t v14 = 12293;
      goto LABEL_27;
    }
    uLong v23 = adler32(0, 0, 0);
    uLong v24 = adler32_z(v23, a2, a3);
    *(double *)buf = a5;
    *(void *)&buf[8] = v24;
    *(_DWORD *)&buf[16] = a3;
    -[SRMemoryMapping appendBytes:length:](*(void **)(v6 + 16), buf, 0x14uLL);
    -[SRMemoryMapping appendBytes:length:](*(void **)(v6 + 16), a2, a3);
    *(double *)(v6 + 48) = a5;
    uint64_t v25 = *(void **)(v6 + 16);
    if (v25) {
      uint64_t v25 = (void *)(v25[3] + v25[4] - v25[2]);
    }
    uint64_t v26 = v25;
    -[SRMemoryMapping writeBytes:toOffset:length:](*(void **)(v6 + 24), &v26, 4, 8uLL);
    -[SRMemoryMapping writeBytes:toOffset:length:](*(void **)(v6 + 24), (const void *)(v6 + 48), 12, 8uLL);
    return 1;
  }
  return result;
}

- (void)sync
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (a1)
  {
    v2 = SRLogFrameStore;
    if (os_log_type_enabled((os_log_t)SRLogFrameStore, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = a1[2];
      if (v4) {
        uint64_t v5 = *(void *)(v4 + 24) - *(void *)(v4 + 16);
      }
      else {
        uint64_t v5 = 0;
      }
      id Property = objc_getProperty(a1, v3, 56, 1);
      int v7 = 134349314;
      uint64_t v8 = v5;
      __int16 v9 = 2114;
      unint64_t v10 = -[NSFileHandle pathname](Property);
      _os_log_impl(&dword_25C11B000, v2, OS_LOG_TYPE_DEFAULT, "Syncing %{public}zu bytes from segment %{public}@ to disk", (uint8_t *)&v7, 0x16u);
    }
    -[SRMemoryMapping sync](a1[3]);
    -[SRMemoryMapping sync](a1[2]);
  }
}

@end