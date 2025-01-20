void sub_100004220(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100004238(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100004248(uint64_t a1)
{
}

void sub_100004250(uint64_t a1, void *a2, unsigned char *a3)
{
  v5 = a2;
  if (([v5 isKernelPageTableMemory] & 1) == 0)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 24);
    id v7 = [v5 address];
    BOOL v9 = v6
      && (unint64_t v8 = *(void *)(v6 + 24), v8 <= (unint64_t)v7)
      && *(void *)(v6 + 32) + v8 > (unint64_t)v7;
    memset(v46, 0, sizeof(v46));
    long long v45 = 0u;
    long long v44 = 0u;
    v41[0] = *(_DWORD *)&v5[OBJC_IVAR___VMUVMRegion_prot];
    v41[1] = *(_DWORD *)&v5[OBJC_IVAR___VMUVMRegion_maxProt];
    v41[2] = 0;
    uint64_t v42 = *(void *)&v5[OBJC_IVAR___VMUVMRegion_offset];
    int v43 = *(_DWORD *)&v5[OBJC_IVAR___VMUVMRegion_user_tag];
    if (v9)
    {
      LODWORD(v44) = *(void *)&v5[OBJC_IVAR___VMUVMRegion_resident_size];
      DWORD1(v44) = *(void *)&v5[OBJC_IVAR___VMUVMRegion_shared_now_private_size];
      DWORD2(v44) = *(void *)&v5[OBJC_IVAR___VMUVMRegion_swapped_out_size];
      unint64_t v11 = *(void *)&v5[OBJC_IVAR___VMUVMRegion_dirty_size];
    }
    else
    {
      unint64_t v10 = *(void *)&v5[OBJC_IVAR___VMUVMRegion_resident_size];
      LODWORD(v44) = v10 / (unint64_t)[*(id *)(a1 + 32) pageSize];
      unint64_t v12 = *(void *)&v5[OBJC_IVAR___VMUVMRegion_shared_now_private_size];
      DWORD1(v44) = v12 / (unint64_t)[*(id *)(a1 + 32) pageSize];
      unint64_t v13 = *(void *)&v5[OBJC_IVAR___VMUVMRegion_swapped_out_size];
      DWORD2(v44) = v13 / (unint64_t)[*(id *)(a1 + 32) pageSize];
      unint64_t v14 = *(void *)&v5[OBJC_IVAR___VMUVMRegion_dirty_size];
      unint64_t v11 = v14 / (unint64_t)[*(id *)(a1 + 32) pageSize];
    }
    HIDWORD(v44) = v11;
    LODWORD(v45) = *(unsigned __int16 *)&v5[OBJC_IVAR___VMUVMRegion_ref_count];
    WORD2(v45) = 0;
    BYTE6(v45) = v5[OBJC_IVAR___VMUVMRegion_external_pager];
    BYTE7(v45) = v5[OBJC_IVAR___VMUVMRegion_share_mode];
    *((void *)&v45 + 1) = v5[OBJC_IVAR___VMUVMRegion_is_submap] & 1;
    uint64_t v15 = *(void *)&v5[OBJC_IVAR___VMUVMRegion_object_id];
    *(_DWORD *)v46 = v15;
    *(_WORD *)&v46[4] = (v5[OBJC_IVAR___VMUVMRegion_is_wired] & 0x10) != 0;
    unint64_t v16 = *(void *)&v5[OBJC_IVAR___VMUVMRegion_reusable_size];
    if (!v9)
    {
      unint64_t v17 = (unint64_t)[*(id *)(a1 + 32) pageSize];
      uint64_t v15 = *(void *)&v5[OBJC_IVAR___VMUVMRegion_object_id];
      v16 /= v17;
    }
    *(_DWORD *)&v46[8] = v16;
    *(void *)&v46[12] = v15;
    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      v18 = objc_alloc_init(FPImage);
      uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8);
      v20 = *(void **)(v19 + 40);
      *(void *)(v19 + 40) = v18;
    }
    v21 = [v5 type];
    sub_10000D1A8(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v21);
    uint64_t v22 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (v22 && *(unsigned char *)(v22 + 8))
    {
      id v23 = [v5 address];
      uint64_t v24 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      if (v24) {
        *(void *)(v24 + 16) = v23;
      }
      id v25 = [v5 length];
      uint64_t v27 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      if (v27) {
        *(void *)(v27 + 24) = v25;
      }
      if (v9 && (v28 = *(unsigned char **)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) != 0 && v28[8] == 4)
      {
        objc_setProperty_nonatomic_copy(v28, v26, @"dyld shared cache", 40);
      }
      else
      {
        v30 = [v5 path];
        v31 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        if (v31) {
          objc_setProperty_nonatomic_copy(v31, v29, v30, 40);
        }
      }
      [*(id *)(*(void *)(a1 + 32) + 136) addObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
      uint64_t v32 = *(void *)(*(void *)(a1 + 48) + 8);
      v33 = *(void **)(v32 + 40);
      *(void *)(v32 + 40) = 0;
    }
    if (([v21 isEqualToString:@"commpage (reserved)"] & 1) != 0
      || ([v21 isEqualToString:@"GPU Carveout (reserved)"] & 1) != 0
      || *(int *)&v5[OBJC_IVAR___VMUVMRegion_user_tag] <= -2)
    {
      id v34 = v21;
      uint64_t v35 = 1;
    }
    else
    {
      id v34 = 0;
      uint64_t v35 = 0;
    }
    if (v5[OBJC_IVAR___VMUVMRegion_external_pager]) {
      BOOL v36 = 1;
    }
    else {
      BOOL v36 = *(_DWORD *)&v5[OBJC_IVAR___VMUVMRegion_user_tag] == 88;
    }
    uint64_t v37 = *(void *)(a1 + 40);
    id v38 = [v5 address];
    id v39 = [v5 length];
    if (v36) {
      uint64_t v40 = *(void *)&v5[OBJC_IVAR___VMUVMRegion_path];
    }
    else {
      uint64_t v40 = 0;
    }
    *a3 = (*(uint64_t (**)(uint64_t, id, id, _DWORD *, void, uint64_t, id, uint64_t))(v37 + 16))(v37, v38, v39, v41, *(unsigned int *)&v5[OBJC_IVAR___VMUVMRegion_purgeable], v40, v34, v35);
  }
}

int64x2_t *sub_10000493C(int64x2_t *result, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5)
{
  if (result)
  {
    BOOL v9 = result;
    unint64_t v10 = (int64x2_t *)result[6].i64[1];
    if (!v10)
    {
      unint64_t v11 = objc_alloc_init(FPRangeList);
      unint64_t v12 = (void *)v9[6].i64[1];
      v9[6].i64[1] = (uint64_t)v11;

      unint64_t v10 = (int64x2_t *)v9[6].i64[1];
    }
    return sub_10000CCAC(v10, a2, a3, a5, a4);
  }
  return result;
}

__CFString *sub_1000049C8(uint64_t a1, uint64_t a2)
{
  self;
  if ((a2 & 0xFFFFFFF0) == 0xF0)
  {
    if (qword_100034918 != -1) {
      dispatch_once(&qword_100034918, &stru_1000290B8);
    }
    v3 = (__CFString *)*((id *)&unk_100034910 + (a2 - 240) + 4);
LABEL_5:
    if (v3) {
      goto LABEL_17;
    }
    goto LABEL_14;
  }
  if (a2 > 0xFF)
  {
    if (a2 == -1)
    {
      v3 = @"Owned physical footprint (unmapped)";
      goto LABEL_17;
    }
  }
  else
  {
    v4 = off_100028868[a2];
    if (v4)
    {
      v3 = v4;
      goto LABEL_17;
    }
    VMURegionTypeDescriptionForTagShareProtAndPager();
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (![(__CFString *)v3 hasPrefix:@"Memory Tag"]) {
      goto LABEL_5;
    }
  }
LABEL_14:
  uint64_t v5 = +[NSString stringWithFormat:@"tag %d", a2];
  uint64_t v6 = (void *)v5;
  id v7 = @"unknown";
  if (v5) {
    id v7 = (__CFString *)v5;
  }
  v3 = v7;

LABEL_17:

  return v3;
}

void sub_100004B04(id a1)
{
  for (uint64_t i = 0; i != 16; ++i)
  {
    id v2 = [objc_alloc((Class)NSString) initWithFormat:@"app-specific tag %d", i + 1];
    v3 = (char *)&unk_100034910 + 8 * i;
    v4 = (void *)*((void *)v3 + 4);
    *((void *)v3 + 4) = v2;
  }
}

id sub_100004B84(uint64_t a1, unint64_t a2)
{
  self;
  if (a2 > 5) {
    id v3 = [objc_alloc((Class)NSString) initWithFormat:@"VM ledger tag %llu", a2];
  }
  else {
    id v3 = qword_100029068[a2];
  }

  return v3;
}

BOOL sub_100004C84(uint64_t a1, unint64_t a2)
{
  if (!a1 || *(_DWORD *)(a1 + 12) == -1 || (*(unsigned char *)(a1 + 8) & 2) != 0) {
    return 0;
  }
  unsigned int v2 = *(unsigned __int8 *)(a1 + 10);
  BOOL v3 = v2 > 6;
  int v4 = (1 << v2) & 0x4C;
  BOOL v5 = v3 || v4 == 0;
  if (!v5 || *(unsigned __int8 *)(a1 + 9) - 5 > 0xFFFFFFFC) {
    return 0;
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)(a1 + 8) & 8) == 0)
  {
    unint64_t v8 = *(void *)(a1 + 88);
    if (v8 > a2)
    {
      uint64_t v9 = *(void *)(a1 + 16);
      if (v9 != v8)
      {
        uint64_t v10 = *(void *)(a1 + 24);
        if (v10 != v8)
        {
          uint64_t v11 = *(void *)(a1 + 32);
          if (v11 != v8)
          {
            uint64_t v12 = *(void *)(a1 + 40);
            if (v12 != v8) {
              return (v10 | v9 | v11 | v12) != 0;
            }
          }
        }
      }
      return 0;
    }
  }
  return v6;
}

BOOL sub_100004D34(BOOL result)
{
  if (result)
  {
    if ((*(unsigned char *)(result + 8) & 2) == 0) {
      return 0;
    }
    int v1 = *(unsigned __int8 *)(result + 9);
    if (v1 == 2 || v1 == 4) {
      return 0;
    }
    else {
      return *(void *)(result + 16) || *(void *)(result + 24) != 0;
    }
  }
  return result;
}

void sub_100005144(id a1)
{
  uint64_t v1 = +[NSMapTable weakToStrongObjectsMapTable];
  uint64_t v2 = qword_100034920;
  qword_100034920 = v1;

  _objc_release_x1(v1, v2);
}

id sub_100005184()
{
  self;
  if (dyld_process_snapshot_get_shared_cache() && (dyld_shared_cache_is_mapped_private() & 1) == 0)
  {
    v14[0] = 0;
    v14[1] = 0;
    dyld_shared_cache_copy_uuid();
    id v1 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:v14];
    unint64_t base_address = dyld_shared_cache_get_base_address();
    mapped_size = (void *)dyld_shared_cache_get_mapped_size();
    int v4 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (unint64_t)[v1 hash] ^ base_address);
    os_unfair_lock_lock((os_unfair_lock_t)&unk_1000349B8);
    BOOL v5 = sub_1000053E8();
    v0 = [v5 objectForKeyedSubscript:v4];

    if (!v0)
    {
      uint64_t v10 = 0;
      uint64_t v11 = &v10;
      uint64_t v12 = 0x2020000000;
      uint64_t v13 = 0;
      dyld_shared_cache_for_each_file();
      unint64_t v6 = v11[3];
      if (base_address < v6)
      {
        _os_assert_log();
        _os_crash();
        __break(1u);
      }
      if (v6) {
        id v7 = (void *)(base_address - v6);
      }
      else {
        id v7 = 0;
      }
      unint64_t v8 = sub_1000053E8();
      v0 = sub_1000054F8((id *)[FPSharedCache alloc], v1, (void *)base_address, mapped_size, v7);
      [v8 setObject:v0 forKeyedSubscript:v4];

      _Block_object_dispose(&v10, 8);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000349B8);
  }
  else
  {
    v0 = 0;
  }

  return v0;
}

void sub_1000053C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_1000053E8()
{
  self;
  v0 = (void *)qword_1000349B0;
  if (!qword_1000349B0)
  {
    id v1 = objc_alloc_init((Class)NSMutableDictionary);
    uint64_t v2 = (void *)qword_1000349B0;
    qword_1000349B0 = (uint64_t)v1;

    v0 = (void *)qword_1000349B0;
  }

  return v0;
}

uint64_t sub_100005440(uint64_t result)
{
  if (!*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24)) {
    return dyld_shared_cache_for_file();
  }
  return result;
}

uint64_t sub_1000054C4(uint64_t a1)
{
  uint64_t result = dyld_shared_cache_get_base_address();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

id *sub_1000054F8(id *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v10 = a2;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)FPSharedCache;
    uint64_t v11 = (id *)[super init];
    a1 = v11;
    if (v11)
    {
      objc_storeStrong(v11 + 2, a2);
      a1[3] = a3;
      a1[4] = a4;
      a1[5] = a5;
      *((_DWORD *)a1 + 2) = 4096;
    }
  }

  return a1;
}

void sub_100005610(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  unint64_t v6 = v5;
  if (a1)
  {
    if (!v5)
    {
      _os_assert_log();
      _os_crash();
      __break(1u);
      return;
    }
    sub_100005698(a1, v7, (uint64_t)[v5 pageSize], v5);
  }
}

void sub_100005698(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v20 = a2;
  id v7 = a4;
  if (a1)
  {
    if (*(unsigned char *)(a1 + 8))
    {
      _os_assert_log();
      _os_crash();
      __break(1u);
      return;
    }
    [*(id *)(a1 + 16) addObject:v20];
    unint64_t v8 = v20;
    if (v20 && *((void *)v20 + 12))
    {
      if (v7)
      {
        self;
        unint64_t v8 = v20;
        if (!byte_100038A50)
        {
          if (*(void *)(a1 + 64)
            || (v20[8] & 2) == 0
            && ((unsigned int v15 = v20[10], v15 > 6) || ((1 << v15) & 0x4C) == 0)
            && v20[9] - 5 <= 0xFFFFFFFC)
          {
            uint64_t v9 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v7 pid]);
            id v10 = *(void **)(a1 + 64);
            if (!v10)
            {
              id v11 = objc_alloc_init((Class)NSMutableDictionary);
              uint64_t v12 = *(void **)(a1 + 64);
              *(void *)(a1 + 64) = v11;

              id v10 = *(void **)(a1 + 64);
            }
            id v13 = [v10 objectForKeyedSubscript:v9];
            if (!v13)
            {
              unint64_t v14 = *(void **)(a1 + 64);
              id v13 = objc_alloc_init((Class)NSMutableArray);
              [v14 setObject:v13 forKeyedSubscript:v9];
            }
            [v13 addObject:v20];

            unint64_t v8 = v20;
          }
        }
      }
      uint64_t v16 = *(void *)(a1 + 72);
      if (!v16)
      {
        unint64_t v17 = objc_alloc_init(FPRangeList);
        v18 = *(void **)(a1 + 72);
        *(void *)(a1 + 72) = v17;

        unint64_t v8 = v20;
        uint64_t v16 = *(void *)(a1 + 72);
      }
      sub_10000CFDC(v16, v8, a3);
      uint64_t v19 = (void *)*((void *)v20 + 13);
      *((void *)v20 + 13) = 0;
    }
  }
}

void sub_100005938(uint64_t a1, int a2)
{
  if (!a1) {
    return;
  }
  if (*(unsigned char *)(a1 + 8))
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
  long long v61 = 0u;
  long long v62 = 0u;
  int64x2_t v60 = 0u;
  sub_10000D0F8(*(void *)(a1 + 72), &v60);
  if (a2)
  {
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v4 = *(id *)(a1 + 16);
    id v5 = [v4 countByEnumeratingWithState:&v56 objects:v67 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v57 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v56 + 1) + 8 * i);
          *(void *)(a1 + 24) += [v9 dirtySize];
          *(void *)(a1 + 32) += [v9 swappedSize];
        }
        id v6 = [v4 countByEnumeratingWithState:&v56 objects:v67 count:16];
      }
      while (v6);
    }
LABEL_34:

    goto LABEL_35;
  }
  *(int64x2_t *)(a1 + 24) = v60;
  if (*(void *)(a1 + 64) && sub_1000113C4())
  {
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v4 = [*(id *)(a1 + 64) objectEnumerator];
    id v39 = [v4 countByEnumeratingWithState:&v52 objects:v66 count:16];
    if (v39)
    {
      uint64_t v38 = *(void *)v53;
      do
      {
        for (j = 0; j != v39; j = (char *)j + 1)
        {
          if (*(void *)v53 != v38) {
            objc_enumerationMutation(v4);
          }
          id v11 = *(void **)(*((void *)&v52 + 1) + 8 * (void)j);
          long long v48 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          id v12 = v11;
          id v13 = [v12 countByEnumeratingWithState:&v48 objects:v65 count:16];
          if (v13)
          {
            id v14 = v13;
            unint64_t v15 = 0;
            unint64_t v16 = 0;
            uint64_t v17 = *(void *)v49;
            do
            {
              for (k = 0; k != v14; k = (char *)k + 1)
              {
                if (*(void *)v49 != v17) {
                  objc_enumerationMutation(v12);
                }
                uint64_t v19 = *(void **)(*((void *)&v48 + 1) + 8 * (void)k);
                v16 += (unint64_t)[v19 dirtySize];
                v15 += (unint64_t)[v19 swappedSize];
              }
              id v14 = [v12 countByEnumeratingWithState:&v48 objects:v65 count:16];
            }
            while (v14);

            if (v16 > *(void *)(a1 + 24)) {
              *(void *)(a1 + 24) = v16;
            }
            if (v15 > *(void *)(a1 + 32)) {
              *(void *)(a1 + 32) = v15;
            }
          }
          else
          {
          }
        }
        id v39 = [v4 countByEnumeratingWithState:&v52 objects:v66 count:16];
      }
      while (v39);
      LOBYTE(a2) = 0;
    }
    goto LABEL_34;
  }
LABEL_35:
  *(_OWORD *)(a1 + 40) = v61;
  *(void *)(a1 + 56) = v62;
  v20 = *(void **)(a1 + 72);
  *(void *)(a1 + 72) = 0;

  if ((a2 & 1) == 0 && (unint64_t)[*(id *)(a1 + 64) count] >= 2)
  {
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    v21 = [*(id *)(a1 + 64) objectEnumerator];
    id v22 = [v21 countByEnumeratingWithState:&v44 objects:v64 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v45;
LABEL_39:
      uint64_t v25 = 0;
      while (1)
      {
        if (*(void *)v45 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = *(void **)(*((void *)&v44 + 1) + 8 * v25);
        if ((unint64_t)[v26 count] > 1) {
          goto LABEL_52;
        }
        uint64_t v27 = [v26 firstObject];
        if ([v27 dirtySize] != *(id *)(a1 + 24)
          || [v27 swappedSize] != *(id *)(a1 + 32)
          || [v27 cleanSize] != *(id *)(a1 + 40)
          || [v27 reclaimableSize] != *(id *)(a1 + 48)
          || [v27 wiredSize] != *(id *)(a1 + 56))
        {

          goto LABEL_52;
        }

        if (v23 == (id)++v25)
        {
          id v23 = [v21 countByEnumeratingWithState:&v44 objects:v64 count:16];
          if (v23) {
            goto LABEL_39;
          }
          break;
        }
      }
    }

    *(unsigned char *)(a1 + 8) |= 2u;
  }
  v21 = *(void **)(a1 + 64);
  *(void *)(a1 + 64) = 0;
LABEL_52:

  if ((a2 & 1) == 0 && [(id)a1 containsFakeRegion])
  {
    uint64_t v28 = sub_100005E9C(a1);
    v29 = (void *)v28;
    if (!v28 || *(_DWORD *)(v28 + 12) != -1)
    {
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v30 = *(id *)(a1 + 16);
      id v31 = [v30 countByEnumeratingWithState:&v40 objects:v63 count:16];
      if (v31)
      {
        id v32 = v31;
        uint64_t v33 = *(void *)v41;
        do
        {
          for (m = 0; m != v32; m = (char *)m + 1)
          {
            if (*(void *)v41 != v33) {
              objc_enumerationMutation(v30);
            }
            uint64_t v35 = *(_DWORD **)(*((void *)&v40 + 1) + 8 * (void)m);
            if (v35)
            {
              if (v35[3] == -1)
              {
                BOOL v36 = [v29 name];
                [v35 setName:v36];

                uint64_t v37 = [v29 detailedName];
                [v35 setDetailedName:v37];
              }
            }
          }
          id v32 = [v30 countByEnumeratingWithState:&v40 objects:v63 count:16];
        }
        while (v32);
      }
    }
  }
  *(unsigned char *)(a1 + 8) |= 1u;
}

id sub_100005E9C(uint64_t a1)
{
  if (!a1)
  {
    id v11 = 0;
    goto LABEL_24;
  }
  uint64_t v2 = [*(id *)(a1 + 16) firstObject];
  BOOL v3 = (void *)v2;
  if (v2 && (*(unsigned char *)(v2 + 8) & 2) != 0)
  {
    int v4 = 1;
    goto LABEL_7;
  }
  if (*(_DWORD *)(a1 + 12) != -1)
  {
    int v4 = 0;
LABEL_7:
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = *(id *)(a1 + 16);
    id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          if (v4)
          {
            if (!v10 || (*(unsigned char *)(v10 + 8) & 4) == 0) {
              goto LABEL_22;
            }
          }
          else if (!v10 || *(_DWORD *)(v10 + 12) != -1)
          {
LABEL_22:
            id v11 = (id)v10;

            goto LABEL_23;
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
  }
  id v11 = v3;
LABEL_23:

LABEL_24:

  return v11;
}

uint64_t sub_100006A78(int a1, _OWORD *buffer)
{
  if (proc_pidinfo(a1, 3, 0, buffer, 136) == 136) {
    return 1;
  }
  if (a1) {
    return 0;
  }
  *((void *)buffer + 16) = 0;
  buffer[4] = xmmword_100021528;
  buffer[5] = unk_100021538;
  buffer[6] = xmmword_100021548;
  buffer[7] = unk_100021558;
  *buffer = xmmword_1000214E8;
  buffer[1] = unk_1000214F8;
  uint64_t result = 1;
  buffer[2] = xmmword_100021508;
  buffer[3] = unk_100021518;
  return result;
}

__CFString *sub_100006B78(uint64_t a1, uint64_t a2)
{
  self;
  uint64_t v3 = a2 + 64;
  if (*(unsigned char *)(a2 + 64))
  {
    uint64_t v4 = 32;
LABEL_5:
    id v7 = [(__CFString *)[objc_alloc((Class)NSString) initWithFormat:@"%.*s", v4, v3];
    goto LABEL_6;
  }
  int v6 = *(unsigned __int8 *)(a2 + 48);
  uint64_t v5 = a2 + 48;
  if (v6)
  {
    uint64_t v4 = 16;
    uint64_t v3 = v5;
    goto LABEL_5;
  }
  id v7 = @"Unknown";
LABEL_6:

  return v7;
}

void *sub_100006F04(void *a1)
{
  *a1 = 0;
  int v2 = proc_listallpids(0, 0);
  if (v2 < 0) {
    return 0;
  }
  int v3 = 4 * (v2 + 20);
  uint64_t v4 = (char *)malloc_type_malloc(4 * (v2 + 20), 0x100004052888210uLL);
  unsigned int v5 = proc_listallpids(v4, v3);
  if ((v5 & 0x80000000) != 0)
  {
    long long v14 = v4;
LABEL_11:
    free(v14);
    return 0;
  }
  unsigned int v6 = v5;
  id v7 = malloc_type_malloc(136 * v5, 0x11B869D5uLL);
  uint64_t v8 = v7;
  if (!v6)
  {
    free(v4);
LABEL_10:
    long long v14 = v8;
    goto LABEL_11;
  }
  uint64_t v9 = 0;
  LODWORD(v10) = 0;
  uint64_t v11 = 4 * v6;
  id v12 = v7;
  do
  {
    unsigned int v13 = sub_100006A78(*(_DWORD *)&v4[v9], v12);
    id v12 = (_OWORD *)((char *)v12 + 136 * v13);
    uint64_t v10 = v10 + v13;
    v9 += 4;
  }
  while (v11 != v9);
  free(v4);
  if (!v10) {
    goto LABEL_10;
  }
  *a1 = v10;
  return v8;
}

uint64_t sub_100007A44(uint64_t a1, void *a2)
{
  int v3 = a2;
  if (!a1) {
    goto LABEL_12;
  }
  mach_vm_size_t v8 = 0;
  mach_vm_address_t kcd_addr_begin = 0;
  if (task_map_corpse_info_64(mach_task_self_, a1, &kcd_addr_begin, &v8))
  {
LABEL_11:
    a1 = 0;
    goto LABEL_12;
  }
  uint64_t v4 = (_DWORD *)kcd_addr_begin;
  unint64_t v5 = v8 + kcd_addr_begin;
  mach_vm_address_t v6 = kcd_addr_begin + 16;
  if (kcd_addr_begin + 16 > v8 + kcd_addr_begin
    || v6 + *(unsigned int *)(kcd_addr_begin + 4) > v5
    || *(_DWORD *)kcd_addr_begin != -559025833)
  {
    vm_deallocate(mach_task_self_, kcd_addr_begin, v8);
    goto LABEL_11;
  }
  do
  {
    if (v6 + v4[1] > v5) {
      break;
    }
    if (*v4 == -242132755) {
      break;
    }
    v3[2](v3, v4, v5);
    uint64_t v4 = (_DWORD *)(v6 + v4[1]);
    mach_vm_address_t v6 = (mach_vm_address_t)(v4 + 4);
  }
  while ((unint64_t)(v4 + 4) <= v5);
  vm_deallocate(mach_task_self_, kcd_addr_begin, v8);
  a1 = 1;
LABEL_12:

  return a1;
}

void sub_1000084A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
  _Block_object_dispose(&a49, 8);
  _Block_object_dispose((const void *)(v49 - 256), 8);
  _Unwind_Resume(a1);
}

void sub_100008728(id *a1, void *a2)
{
  if (a1)
  {
    id v3 = a2;
    uint64_t v4 = __error();
    strerror_r(*v4, __strerrbuf, 0x100uLL);
    unint64_t v5 = +[NSString stringWithFormat:@"%@ - %s", v3, __strerrbuf];

    mach_vm_address_t v6 = __stderrp;
    id v7 = [a1 displayString];
    mach_vm_size_t v8 = (const char *)[v7 UTF8String];
    id v9 = v5;
    fprintf(v6, "%s: %s\n", v8, (const char *)[v9 UTF8String]);

    [a1[5] addObject:v9];
  }
}

void sub_100008B44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v26 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_100008B7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a3)
  {
    uint64_t v7 = 0;
    uint64_t v38 = a3 - 1;
    uint64_t v39 = a5 - 1;
    do
    {
      BOOL v8 = !(v7 | a4) && !*(unsigned char *)(a1 + 80) && *(unsigned char *)(a1 + 81) != 0;
      BOOL v9 = 0;
      if (v39 == a4 && v38 == v7) {
        BOOL v9 = *(unsigned char *)(a1 + 82) != 0;
      }
      int v10 = *(_DWORD *)(a2 + 4 * v7);
      unint64_t v11 = *(void *)(a1 + 64);
      uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
      long long v14 = *(id *)(a1 + 32);
      if (v8)
      {
        if (v14)
        {
          uint64_t v15 = v14[10];
          unint64_t v16 = v14[11];
          uint64_t v17 = v15 & -(uint64_t)v11;
        }
        else
        {
          uint64_t v17 = 0;
          uint64_t v15 = 0;
          unint64_t v16 = 0;
        }
        unint64_t v11 = v11 - v15 + v17;
        if (v16 < v11) {
          goto LABEL_21;
        }
      }
      else if (v9)
      {
        if (v14)
        {
          uint64_t v19 = v14[10];
          unint64_t v18 = v14[11];
          uint64_t v20 = v19 == -1 ? -1 : v18 + v19;
          uint64_t v21 = (v11 + v20 - 1) & -(uint64_t)v11;
        }
        else
        {
          uint64_t v21 = 0;
          uint64_t v20 = 0;
          unint64_t v18 = 0;
        }
        unint64_t v11 = v11 - v21 + v20;
        if (v18 < v11)
        {
LABEL_21:
          if (v14) {
            unint64_t v11 = v14[11];
          }
          else {
            unint64_t v11 = 0;
          }
        }
      }
      BOOL v22 = (v10 & 0x81) == 1 || (v10 & 8) != 0;
      if (v22)
      {
        id v23 = (void *)(v12 + 24);
LABEL_30:
        *v23 += v11;
        goto LABEL_31;
      }
      if ((v10 & 0x10) != 0)
      {
        id v23 = (void *)(v13 + 24);
        goto LABEL_30;
      }
LABEL_31:

      if (v8)
      {
        uint64_t v24 = *(void **)(*(void *)(a1 + 40) + 168);
        if (v24)
        {
          uint64_t v25 = *(void *)(a1 + 32);
          if (v25) {
            uint64_t v25 = *(void *)(v25 + 80);
          }
          uint64_t v26 = v24[10];
          if (v26 != -1) {
            v26 += v24[11];
          }
          if (v25 != v26)
          {
            _os_assert_log();
            _os_crash();
            __break(1u);
            return;
          }
          uint64_t v42 = 0;
          uint64_t v43 = 0;
          uint64_t v27 = *(void *)(a1 + 64);
          uint64_t v28 = v24;
          uint64_t v29 = v24[10];
          unint64_t v30 = v28[11];
          if (v29 == -1) {
            uint64_t v31 = -1;
          }
          else {
            uint64_t v31 = v30 + v29;
          }
          unint64_t v32 = v27 - ((v27 + v31 - 1) & -v27) + v31;
          if (v30 < v32) {
            unint64_t v32 = v28[11];
          }
          if (v22)
          {
            uint64_t v33 = (unint64_t *)&v43;
            goto LABEL_49;
          }
          if ((v10 & 0x10) != 0)
          {
            uint64_t v33 = (unint64_t *)&v42;
LABEL_49:
            unint64_t *v33 = v32;
            uint64_t v34 = v42;
            uint64_t v35 = v43;
          }
          else
          {
            uint64_t v34 = 0;
            uint64_t v35 = 0;
          }

          [*(id *)(*(void *)(a1 + 40) + 168) setDirtySize:((char *)[*(id *)(*(void *)(a1 + 40) + 168) dirtySize]) + v35];
          [*(id *)(*(void *)(a1 + 40) + 168) setSwappedSize:((char *)[*(id *)(*(void *)(a1 + 40) + 168) swappedSize]) + v34];
          uint64_t v36 = *(void *)(a1 + 40);
          uint64_t v37 = *(void **)(v36 + 168);
          *(void *)(v36 + 168) = 0;
        }
      }
      if (v9)
      {
        *(void *)(*(void *)(a1 + 40) + 152) = *(void *)(a1 + 72) - *(void *)(a1 + 64);
        *(_DWORD *)(*(void *)(a1 + 40) + 160) = v10;
      }
      ++v7;
    }
    while (a3 != v7);
  }
}

uint64_t sub_100008E5C(uint64_t a1, mach_vm_offset_t a2, unint64_t a3, void *a4)
{
  uint64_t v7 = a4;
  if (a1)
  {
    id v8 = [(id)a1 pageSize];
    if (a3 >= 0x1000) {
      unint64_t v9 = 4096;
    }
    else {
      unint64_t v9 = a3;
    }
    if (a3 + 4095 >= 0x1000)
    {
      id v10 = v8;
      v19[1] = v19;
      uint64_t v11 = 0;
      unint64_t v12 = (a3 + 4095) >> 12;
      v19[2] = v7 + 16;
      uint64_t v20 = (unsigned char *)a1;
      if (v12 <= 1) {
        unint64_t v13 = 1;
      }
      else {
        unint64_t v13 = (a3 + 4095) >> 12;
      }
      uint64_t v14 = (void)v8 << 12;
      while (1)
      {
        mach_vm_size_t v15 = a3 >= v9 ? v9 : a3;
        mach_vm_size_t dispositions_count = v15;
        id v16 = v10;
        mach_error_t v17 = mach_vm_page_range_query(*((_DWORD *)v20 + 24), a2, v15 * (void)v10, (mach_vm_address_t)v19 - ((unsigned __int16)(4 * v9 + 15) & 0xFFF0), &dispositions_count);
        if (v17) {
          break;
        }
        (*((void (**)(char *, char *, mach_vm_size_t, uint64_t, unint64_t))v7 + 2))(v7, (char *)v19 - ((unsigned __int16)(4 * v9 + 15) & 0xFFF0), dispositions_count, v11++, v12);
        a2 += v14;
        a3 -= 4096;
        id v10 = v16;
        if (v13 == v11)
        {
          a1 = 1;
          goto LABEL_18;
        }
      }
      sub_10000945C(v20, v17, @"mach_vm_page_range_query");
      a1 = 0;
    }
    else
    {
      a1 = 1;
    }
  }
LABEL_18:

  return a1;
}

void sub_10000945C(unsigned char *a1, mach_error_t a2, void *a3)
{
  id v5 = a3;
  if (a1 && !a1[176])
  {
    a1[176] = 1;
    mach_vm_address_t v6 = "";
    if ([a1 _isAlive])
    {
      memset(buffer, 0, sizeof(buffer));
      if (proc_pidinfo((int)[a1 pid], 13, 1uLL, buffer, 64) == 64) {
        int v7 = 0;
      }
      else {
        int v7 = *__error();
      }
      BOOL v10 = v7 == 0;
      BOOL v11 = HIDWORD(buffer[0]) == 5;
      BOOL v8 = v10 && v11;
      BOOL v12 = !v10 || !v11;
      unint64_t v13 = " (zombie)";
      if (v12) {
        unint64_t v13 = "";
      }
      BOOL v9 = v7 == 3;
      if (v7 == 3) {
        mach_vm_address_t v6 = " (process exited)";
      }
      else {
        mach_vm_address_t v6 = v13;
      }
    }
    else
    {
      BOOL v8 = 0;
      BOOL v9 = 0;
    }
    uint64_t v14 = +[NSString stringWithFormat:@"%@ - %s%s", v5, mach_error_string(a2), v6];
    mach_vm_size_t v15 = &OBJC_IVAR___FPProcess__warnings;
    if (!v8 && !v9)
    {
      id v16 = __stderrp;
      id v17 = [a1 displayString];
      fprintf(v16, "%s: bailing out due to error: %s\n", (const char *)[v17 UTF8String], (const char *)[v14 UTF8String]);

      mach_vm_size_t v15 = &OBJC_IVAR___FPProcess__errors;
    }
    [*(id *)&a1[*v15] addObject:v14];
  }
}

void sub_1000097E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

int64x2_t *sub_100009804(int64x2_t *result, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a5 - 1 == a4) {
    unint64_t v5 = a3 + 1;
  }
  else {
    unint64_t v5 = a3;
  }
  if (v5)
  {
    BOOL v8 = result;
    for (unint64_t i = 0; i != v5; ++i)
    {
      if (i >= a3)
      {
        uint64_t v11 = 0;
      }
      else
      {
        int v10 = *(_DWORD *)(a2 + 4 * i);
        if ((v10 & 0x10) != 0)
        {
          uint64_t v11 = 2;
        }
        else if ((v8[4].i32[0] & v10) != 0)
        {
          uint64_t v11 = 1;
        }
        else
        {
          BOOL v17 = (v8[4].i32[1] & v10) == 0;
          uint64_t v12 = 4 * (v10 & 1);
          if (v17) {
            uint64_t v11 = v12;
          }
          else {
            uint64_t v11 = 3;
          }
        }
      }
      uint64_t v13 = v8[2].i64[1];
      uint64_t v14 = *(void *)(v13 + 8);
      uint64_t v15 = *(void *)(v14 + 24);
      if (v15 != v11)
      {
        uint64_t v16 = v8[3].i64[0];
        BOOL v17 = !v15 || *(void *)(*(void *)(v16 + 8) + 40) == 0;
        if (!v17)
        {
          long long v22 = 0u;
          long long v23 = 0u;
          long long v21 = 0u;
          switch(*(void *)(*(void *)(v13 + 8) + 24))
          {
            case 0:
              _os_crash();
              __break(1u);
              JUMPOUT(0x1000099ECLL);
            case 1:
              *(void *)&long long v21 = *(void *)(*(void *)(v16 + 8) + 40);
              break;
            case 2:
              *((void *)&v21 + 1) = *(void *)(*(void *)(v16 + 8) + 40);
              break;
            case 3:
              *((void *)&v22 + 1) = *(void *)(*(void *)(v16 + 8) + 40);
              break;
            case 4:
              *(void *)&long long v22 = *(void *)(*(void *)(v16 + 8) + 40);
              break;
            default:
              break;
          }
          uint64_t v18 = *(void *)(v16 + 8);
          if (v8[4].i8[8])
          {
            *(void *)&long long v23 = *(void *)(v18 + 40);
            uint64_t v18 = *(void *)(v16 + 8);
          }
          uint64_t result = sub_10000493C((int64x2_t *)v8[2].i64[0], *(void *)(v18 + 32), *(void *)(v18 + 40), (uint64_t *)&v21, v8[3].i64[1]);
          uint64_t v19 = *(void *)(v8[3].i64[0] + 8);
          *(void *)(v19 + 32) += *(void *)(v19 + 40);
          *(void *)(v19 + 40) = 0;
          uint64_t v14 = *(void *)(v8[2].i64[1] + 8);
        }
      }
      *(void *)(v14 + 24) = v11;
      if (*(void *)(*(void *)(v8[2].i64[1] + 8) + 24)) {
        uint64_t v20 = 40;
      }
      else {
        uint64_t v20 = 32;
      }
      *(void *)(*(void *)(v8[3].i64[0] + 8) + v20) += v8[3].i64[1];
    }
  }
  return result;
}

uint64_t sub_100009A04(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100009A14(uint64_t a1)
{
}

uint64_t sub_100009A1C(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4, unsigned int a5, void *a6, void *a7, int a8)
{
  id v14 = a6;
  id v15 = a7;
  unint64_t v16 = *(void *)(a1 + 80);
  unint64_t v17 = a3 + a2;
  BOOL v18 = v16 < a3 + a2 && *(void *)(a1 + 88) + v16 > a2;
  unint64_t v104 = a2;
  if (!v18)
  {
    id v101 = v15;
    uint64_t v19 = objc_alloc_init(FPMemoryRegion);
    uint64_t v20 = (uint64_t)v19;
    if (v19)
    {
      v19->_unint64_t start = a2;
      v19->_size = a3;
      long long v22 = (void *)(a4 + 68);
      unint64_t v21 = *(void *)(a4 + 68);
      long long v23 = (int *)(a4 + 20);
      v19->_user_tag = *(_DWORD *)(a4 + 20);
      v19->_object_id = v21;
      v19->_share_mode = *(unsigned char *)(a4 + 47);
      v19->_offset = *(void *)(a4 + 12);
      LOBYTE(v21) = *((unsigned char *)v19 + 8);
      *((unsigned char *)v19 + 8) = v21 & 0xFD;
      *((unsigned char *)v19 + 8) = v21 & 0xFC | (*(_WORD *)(a4 + 60) != 0);
    }
    else
    {
      long long v23 = (int *)(a4 + 20);
      long long v22 = (void *)(a4 + 68);
    }
    if (a5 == 2)
    {
      [(FPMemoryRegion *)v19 setDirtySize:0];
      uint64_t v26 = (void *)v20;
      unint64_t v25 = a3;
    }
    else
    {
      if (a5 != 1)
      {
        if (*(unsigned char *)(a4 + 46) || *(unsigned char *)(a1 + 97)) {
          unsigned int v67 = *(_DWORD *)(a4 + 36);
        }
        else {
          unsigned int v67 = *(_DWORD *)(a4 + 24) - *(_DWORD *)(a4 + 64);
        }
        -[FPMemoryRegion setDirtySize:](v19, "setDirtySize:", (void)[*(id *)(a1 + 32) pageSize] * v67);
        [v20 setReclaimableSize:([*(id *)(a1 + 32) pageSize] * *(unsigned int *)(a4 + 64))];
        [v20 setSwappedSize:[*(id *)(a1 + 32) pageSize] * *(unsigned int *)(a4 + 32)];
        unsigned int v68 = *(_DWORD *)(a4 + 24);
        unsigned int v69 = *(_DWORD *)(a4 + 64) + v67;
        if (*(unsigned char *)(a1 + 97) && v68 < v69) {
          uint64_t v70 = 0;
        }
        else {
          uint64_t v70 = (void)[*(id *)(a1 + 32) pageSize] * (v68 - v69);
        }
        a2 = v104;
        [(id)v20 setCleanSize:v70];
        if (*v23 == -1)
        {
          if (*(void *)(*(void *)(a1 + 32) + 144))
          {
LABEL_184:

            uint64_t v27 = 0;
LABEL_185:
            id v15 = v101;
            goto LABEL_186;
          }
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), (id)v20);
          if (v20 && !*v22) {
            *(void *)(v20 + 96) = *(unsigned int *)(a4 + 56);
          }
        }
LABEL_114:
        uint64_t v71 = sub_10000D334(*(void *)(a1 + 48), a2, v17);
        if (v20) {
          *(unsigned char *)(v20 + 9) = 1;
        }
        if (a8) {
          [(id)v20 setVerbose:1];
        }
        if (v71)
        {
          id v72 = *(id *)(v71 + 32);
          [(id)v20 setName:v72];

          id v73 = *(id *)(v71 + 40);
          [(id)v20 setDetailedName:v73];

          if (v20) {
            *(unsigned char *)(v20 + 9) = *(unsigned char *)(v71 + 8);
          }
          goto LABEL_176;
        }
        if (v101)
        {
          [v20 setName:];
          goto LABEL_176;
        }
        if ((v14 || *(unsigned char *)(a4 + 46)) && *v23 != 88)
        {
          [(id)v20 setName:@"mapped file"];
          [(id)v20 setDetailedName:v14];
          goto LABEL_176;
        }
        if (a2 == 0xFC0000000 && a3 == 0x40000000)
        {
          CFStringRef v74 = @"commpage (reserved)";
LABEL_136:
          [(id)v20 setName:v74];
          [(id)v20 setVerbose:1];
          goto LABEL_176;
        }
        if (a2 == 0x1000000000 && a3 == 0x6000000000)
        {
          CFStringRef v74 = @"GPU Carveout (reserved)";
          goto LABEL_136;
        }
        v75 = sub_1000049C8((uint64_t)FPMemoryRegion, *v23);
        [(id)v20 setName:v75];

        if (*(unsigned char *)(a1 + 98))
        {
          int v76 = *v23;
          if (*v23 == 100 || v76 == 88)
          {
            if (v14)
            {
              [(id)v20 setExtendedInfo:v14];
            }
            else if (v76 != 100 || *(unsigned char *)(a1 + 99))
            {
              v77 = [*(id *)(a1 + 32) extendedInfoForRegionType:at:extendedInfoProvider:];
              [(id)v20 setExtendedInfo:v77];
            }
          }
        }
        if (!*(unsigned char *)(a1 + 100)) {
          goto LABEL_176;
        }
        v78 = +[NSNumber numberWithUnsignedLongLong:*v22];
        v79 = [*(id *)(*(void *)(a1 + 32) + 144) objectForKeyedSubscript:v78];
        v80 = *(void **)(*(void *)(a1 + 32) + 144);
        if (v79)
        {
          [v80 removeObjectForKey:v78];
          if (v20) {
            *(unsigned char *)(v20 + 8) |= 8u;
          }
          v110 = 0;
          uint64_t v109 = 0;
          long long v107 = 0u;
          long long v108 = 0u;
          long long v106 = 0u;
          [v79 getBytes:&v106 length:56];
          unint64_t v81 = v109;
          int v82 = (v109 >> 4) & 3;
          if (v82 != 3 && v82)
          {
            uint64_t v85 = 0;
            v111 = 0;
            v84 = (char *)*((void *)&v107 + 1);
            uint64_t v83 = v107 - *((void *)&v107 + 1);
          }
          else
          {
            uint64_t v83 = v108;
            v84 = (char *)(v107 - v108);
            uint64_t v85 = *((void *)&v108 + 1);
            v111 = (char *)*((void *)&v108 + 1);
          }
          if (v109)
          {
            v110 = &v84[v85];
            v89 = &v111;
            v84 = 0;
          }
          else
          {
            v89 = &v110;
          }
          *v89 = 0;
          v90 = sub_100004B84((uint64_t)FPMemoryRegion, (v81 >> 1) & 7);
          if (v90)
          {
            id v91 = objc_alloc((Class)NSString);
            [(id)v20 name];
            v105 = v79;
            uint64_t v92 = v83;
            v94 = v93 = v78;
            id v95 = [v91 initWithFormat:@"%@ (%@)", v94, v90];
            [(id)v20 setName:v95];

            v78 = v93;
            uint64_t v83 = v92;
            v79 = v105;
          }

          v88 = v110;
          v87 = v111;
        }
        else
        {
          if (v80 || a5 == 3 || *v23 == 87 || !*(_DWORD *)(a4 + 24)) {
            goto LABEL_175;
          }
          [0 removeObjectForKey:v78];
          if (v20) {
            *(unsigned char *)(v20 + 8) |= 8u;
          }
          v86 = (char *)[(id)v20 dirtySize];
          v84 = &v86[(void)[(id)v20 cleanSize]];
          v87 = (char *)[(id)v20 swappedSize];
          v88 = 0;
          uint64_t v83 = 0;
        }
        *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) += &v87[(void)v84];
        [(id)v20 setDirtySize:v84];
        [(id)v20 setCleanSize:v88];
        [(id)v20 setSwappedSize:v87];
        [(id)v20 setReclaimableSize:v83];
LABEL_175:

LABEL_176:
        if (*(unsigned char *)(a1 + 97)
          && !*(unsigned char *)(a1 + 101)
          && !*(unsigned char *)(a1 + 96)
          && sub_100004C84(v20, (unint64_t)[*(id *)(a1 + 32) pageSize]))
        {
          [*(id *)(a1 + 32) _addSubrangesForRegion:v20 purgeState:a5];
        }
        if (v20 != *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)) {
          [*(id *)(a1 + 40) addObject:v20];
        }

        goto LABEL_184;
      }
      [(FPMemoryRegion *)v19 setDirtySize:0];
      uint64_t v24 = *(unsigned int *)(a4 + 24);
      unint64_t v25 = (void)[*(id *)(a1 + 32) pageSize] * v24;
      a2 = v104;
      uint64_t v26 = (void *)v20;
    }
    [v26 setReclaimableSize:v25];
    [(id)v20 setSwappedSize:0];
    [(id)v20 setCleanSize:0];
    goto LABEL_114;
  }
  if (!*(unsigned char *)(a1 + 96))
  {
    id v101 = v15;
    uint64_t v28 = *(void **)(a1 + 32);
    uint64_t v29 = *(void **)(a1 + 48);
    id v30 = *(id *)(a1 + 40);
    id v103 = v29;
    if (!v28)
    {

      uint64_t v27 = 1;
      goto LABEL_185;
    }
    uint64_t v31 = v28[3];
    if (v31) {
      uint64_t v32 = *(unsigned int *)(v31 + 8);
    }
    else {
      uint64_t v32 = 0;
    }
    id v99 = v14;
    uint64_t v33 = (char *)[v28 pageSize];
    uint64_t v34 = (void *)v28[21];
    v28[21] = 0;

    uint64_t v35 = sub_10000D334((uint64_t)v103, v104, v17);
    if (v17 <= v104)
    {
      v66 = 0;
LABEL_140:

      uint64_t v27 = 0;
LABEL_141:
      id v14 = v99;
      goto LABEL_185;
    }
    uint64_t v36 = 0;
    uint64_t v100 = v32 - 1;
    uint64_t v97 = -v32;
    v98 = v33 - 1;
    unint64_t v37 = v104;
    while (1)
    {
      uint64_t v38 = v35;
      if (v35 && v37 >= *(void *)(v35 + 16)) {
        goto LABEL_60;
      }
      uint64_t v39 = objc_alloc_init(FPMemoryRegion);
      uint64_t v35 = (uint64_t)v39;
      if (v39) {
        v39->_unint64_t start = v37;
      }
      unint64_t v40 = v17;
      if (v38)
      {
        if (*(void *)(v38 + 16) >= v17) {
          unint64_t v40 = v17;
        }
        else {
          unint64_t v40 = *(void *)(v38 + 16);
        }
      }
      if (v39)
      {
        unint64_t start = v39->_start;
        BOOL v42 = v40 >= start;
        unint64_t v43 = v40 - start;
        if (!v42) {
          goto LABEL_187;
        }
        v39->_size = v43;
        v39->_user_tag = *(_DWORD *)(a4 + 20);
        v39->_object_id = *(void *)(a4 + 68);
        v39->_share_mode = *(unsigned char *)(a4 + 47);
        v39->_offset = start - v104 + *(void *)(a4 + 12);
        *((unsigned char *)v39 + 8) |= 2u;
        [(FPMemoryRegion *)v39 setName:@"unused dyld shared cache area"];
        char v44 = *(unsigned char *)(v35 + 8) | 4;
        *(unsigned char *)(v35 + 8) = v44;
        *(unsigned char *)(v35 + 8) = v44 & 0xFE | (*(_WORD *)(a4 + 60) != 0);
        if (!v36)
        {
LABEL_36:
          if (!v38)
          {
            if (!v35) {
              goto LABEL_102;
            }
            *(unsigned char *)(v35 + 9) = 0;
            goto LABEL_51;
          }
          goto LABEL_37;
        }
      }
      else
      {
        [0 setName:@"unused dyld shared cache area"];
        if (!v36) {
          goto LABEL_36;
        }
      }
      int v45 = v36[8];
      if (v45 == 2)
      {
        if (!v38)
        {
          int v45 = 2;
          goto LABEL_43;
        }
      }
      else if (!v38 || v45 != 4)
      {
        goto LABEL_43;
      }
LABEL_37:
      int v45 = *(unsigned __int8 *)(v38 + 8);
      if (v45 == 4 || v45 == 2)
      {
        if (v36) {
          long long v46 = v36;
        }
        else {
          long long v46 = (unsigned __int8 *)v38;
        }
        int v45 = v46[8];
      }
LABEL_43:
      if (v35) {
        *(unsigned char *)(v35 + 9) = v45;
      }
      if (v45 != 2 && v45 != 4)
      {
        if (!v35)
        {
LABEL_102:
          uint64_t v47 = 0;
          goto LABEL_53;
        }
LABEL_51:
        uint64_t v47 = *(void *)(v35 + 80);
        if (v47 != -1) {
          v47 += *(void *)(v35 + 88);
        }
LABEL_53:
        if (((v47 | v37) & (unint64_t)v98) != 0
          && ![v28 _populateMemoryRegionWithPageQueries:v35 regionInfo:a4])
        {
          goto LABEL_149;
        }
      }
      [v30 addObject:v35];
      if (v35)
      {
        uint64_t v48 = *(void *)(v35 + 80);
        if (v48 == -1)
        {

LABEL_139:
          uint64_t v35 = v38;
          v66 = v36;
          goto LABEL_140;
        }
        unint64_t v37 = *(void *)(v35 + 88) + v48;
      }
      else
      {
        unint64_t v37 = 0;
      }

      if (!v38 || v37 >= v17) {
        goto LABEL_139;
      }
LABEL_60:
      uint64_t v49 = objc_alloc_init(FPMemoryRegion);
      long long v50 = v49;
      if (v49)
      {
        unint64_t v51 = *(void *)(v38 + 16);
        if (v51 <= v37) {
          unint64_t v51 = v37;
        }
        v49->_unint64_t start = v51;
        unint64_t v52 = *(void *)(v38 + 24) + *(void *)(v38 + 16);
        if (v52 >= v17) {
          unint64_t v52 = v17;
        }
        if (v52 < v51) {
LABEL_187:
        }
          __assert_rtn("-[FPMemoryRegion setEnd:]", "FPMemoryRegion.m", 185, "end >= self.start");
        v49->_size = v52 - v51;
        if (v51 == -1) {
          unint64_t v53 = -1;
        }
        else {
          unint64_t v53 = v52;
        }
      }
      else
      {
        unint64_t v53 = 0;
      }
      uint64_t v54 = sub_10000D334((uint64_t)v103, v53, v17);
      uint64_t v35 = v54;
      if (v38 == v54)
      {
LABEL_74:
        if (!v50) {
          goto LABEL_84;
        }
        unint64_t v57 = v50->_start;
        goto LABEL_83;
      }
      if (v50)
      {
        unint64_t v55 = v50->_start;
        if (v54) {
          goto LABEL_72;
        }
      }
      else
      {
        unint64_t v55 = 0;
        if (v54)
        {
LABEL_72:
          uint64_t v56 = *(void *)(v54 + 16);
          goto LABEL_73;
        }
      }
      uint64_t v56 = 0;
LABEL_73:
      if (((v56 | v55) & v100) != 0) {
        goto LABEL_74;
      }
      if (!v50) {
        goto LABEL_84;
      }
      unint64_t v57 = v50->_start;
      if (v57 == -1) {
        uint64_t v58 = -1;
      }
      else {
        uint64_t v58 = v50->_size + v57;
      }
      unint64_t v59 = (v58 + v100) & v97;
      BOOL v42 = v59 >= v57;
      unint64_t v60 = v59 - v57;
      if (!v42) {
        goto LABEL_187;
      }
      v50->_size = v60;
LABEL_83:
      v50->_user_tag = *(_DWORD *)(a4 + 20);
      v50->_object_id = *(void *)(a4 + 68);
      v50->_share_mode = *(unsigned char *)(a4 + 47);
      v50->_offset = v57 - v104 + *(void *)(a4 + 12);
      *((unsigned char *)v50 + 8) |= 2u;
LABEL_84:
      id v61 = *(id *)(v38 + 32);
      [(FPMemoryRegion *)v50 setName:v61];

      id v62 = *(id *)(v38 + 40);
      [(FPMemoryRegion *)v50 setDetailedName:v62];

      int v63 = *(unsigned __int8 *)(v38 + 8);
      if (v50)
      {
        v50->_segment = v63;
        *((unsigned char *)v50 + 8) = *((unsigned char *)v50 + 8) & 0xFE | (*(_WORD *)(a4 + 60) != 0);
      }
      if (v63 == 2 || v63 == 4)
      {
        v64 = (void *)v28[21];
        if (v64)
        {
          v28[21] = 0;
        }
      }
      else if (([v28 _populateMemoryRegionWithPageQueries:v50 regionInfo:a4] & 1) == 0)
      {

LABEL_149:
        uint64_t v27 = 1;
        goto LABEL_141;
      }
      [v30 addObject:v50];
      if (v50)
      {
        unint64_t v65 = v50->_start;
        if (v65 == -1) {
          unint64_t v37 = -1;
        }
        else {
          unint64_t v37 = v50->_size + v65;
        }
      }
      else
      {
        unint64_t v37 = 0;
      }
      v66 = (unsigned __int8 *)(id)v38;

      uint64_t v36 = v66;
      if (v37 >= v17) {
        goto LABEL_140;
      }
    }
  }
  uint64_t v27 = 0;
LABEL_186:

  return v27;
}

void sub_10000AC30(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 72), 8);
  _Unwind_Resume(a1);
}

void sub_10000AC5C(uint64_t a1)
{
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3032000000;
  v8[3] = sub_100009A04;
  v8[4] = sub_100009A14;
  id v9 = 0;
  if ((dyld_image_for_each_segment_info() & 1) == 0 && !*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    id v3 = +[NSString stringWithFormat:@"Unable to iterate over image segments"];
    uint64_t v4 = __stderrp;
    id v5 = [*(id *)(a1 + 32) displayString];
    mach_vm_address_t v6 = (const char *)[v5 UTF8String];
    id v7 = v3;
    fprintf(v4, "%s: %s\n", v6, (const char *)[v7 UTF8String]);

    [*(id *)(*(void *)(a1 + 32) + 40) addObject:v7];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  _Block_object_dispose(v8, 8);
}

void sub_10000ADF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000AE14(void *a1, char *__s, unint64_t a3, unint64_t a4)
{
  if (a4)
  {
    id v6 = (id)strlen(__s);
    uint64_t v7 = 0;
    BOOL v8 = 0;
    id v9 = 0;
    do
    {
      explicit = (void *)atomic_load_explicit((atomic_ullong *volatile)((char *)&unk_1000349C0 + v7), memory_order_acquire);
      uint64_t v11 = explicit;

      if (explicit)
      {
        BOOL v8 = v11;
      }
      else
      {
        if (!v9) {
          id v9 = (__CFString *)[objc_alloc((Class)NSString) initWithBytes:__s length:v6 encoding:4];
        }
        BOOL v8 = 0;
        atomic_compare_exchange_strong((atomic_ullong *volatile)((char *)&unk_1000349C0 + v7), (unint64_t *)&v8, (unint64_t)v9);
        if (!v8)
        {
          id v15 = v9;
          id v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
          BOOL v8 = v9;
          goto LABEL_18;
        }
        id v12 = v8;
      }
      if ([(__CFString *)v8 length] == v6)
      {
        uint64_t v13 = v52;
        if (([(__CFString *)v8 getCString:v52 maxLength:32 encoding:4] & 1) == 0)uint64_t v13 = (const char *)[(__CFString *)v8 UTF8String]; {
        if (!strncmp(v13, __s, (size_t)v6))
        }
        {
          BOOL v8 = v8;

          id v9 = v8;
          goto LABEL_19;
        }
      }
      v7 += 8;
    }
    while (v7 != 128);
    if (v9) {
      goto LABEL_19;
    }
    id v14 = (__CFString *)[objc_alloc((Class)NSString) initWithBytes:__s length:v6 encoding:4];
LABEL_18:
    id v9 = v14;
LABEL_19:
    unint64_t v16 = a3;

    uint64_t v17 = *(void *)(a1[4] + 24);
    if (v17 && (unint64_t v18 = *(void *)(v17 + 24), v18 <= a3) && *(void *)(v17 + 32) + v18 > a3)
    {
      if ([(__CFString *)v9 isEqualToString:@"__LINKEDIT"])
      {
        uint64_t v19 = *(void **)(*(void *)(a1[5] + 8) + 40);
        uint64_t v20 = +[NSNumber numberWithUnsignedLongLong:a3];
        LOBYTE(v19) = [v19 containsObject:v20];

        if (v19)
        {
LABEL_59:

          return;
        }
        unint64_t v21 = *(void **)(*(void *)(a1[5] + 8) + 40);
        long long v22 = +[NSNumber numberWithUnsignedLongLong:a3];
        [v21 addObject:v22];

        long long v23 = @"dyld shared cache";
LABEL_53:
        int v45 = objc_alloc_init(FPImage);
        long long v46 = v45;
        if (v45)
        {
          v45->_unint64_t start = v16;
          v45->_size = a4;
          if (v9) {
            uint64_t v47 = v9;
          }
          else {
            uint64_t v47 = @"unknown";
          }
          sub_10000D1A8((uint64_t)v45, v47);
          objc_setProperty_nonatomic_copy(v46, v48, v23, 40);
        }
        else
        {
          if (v9) {
            uint64_t v49 = v9;
          }
          else {
            uint64_t v49 = @"unknown";
          }
          sub_10000D1A8(0, v49);
        }
        [*(id *)(a1[4] + 136) addObject:v46];

        goto LABEL_59;
      }
      int v24 = 1;
    }
    else
    {
      int v24 = 0;
    }
    unint64_t v25 = *(void **)(*(void *)(a1[6] + 8) + 40);
    if (!v25)
    {
      file_path = (const char *)dyld_image_get_file_path();
      if (file_path || (file_path = (const char *)dyld_image_get_installname()) != 0)
      {
        if (v24)
        {
          id v27 = 0;
          unsigned int v28 = 0;
          id v29 = 0;
          unint64_t v30 = ((a3 >> 16) ^ (a3 >> 8) ^ (a3 >> 24) ^ a3) % 0x7FF;
          do
          {
            uint64_t v31 = (void *)atomic_load_explicit(&qword_100034A40[v30], memory_order_acquire);
            id v32 = v31;

            if (v31)
            {
              id v27 = v32;
            }
            else
            {
              if (!v29) {
                id v29 = [objc_alloc((Class)NSString) initWithUTF8String:file_path];
              }
              id v27 = 0;
              atomic_compare_exchange_strong(&qword_100034A40[v30], (unint64_t *)&v27, (unint64_t)v29);
              if (!v27)
              {
                id v43 = v29;
                id v37 = (id)objc_claimAutoreleasedReturnValue();
                id v27 = v29;
                goto LABEL_49;
              }
              id v33 = v27;
            }
            uint64_t v34 = v52;
            if (([v27 getCString:v52 maxLength:1025 encoding:4] & 1) == 0) {
              uint64_t v34 = (const char *)[v27 UTF8String];
            }
            if (!strcmp(v34, file_path))
            {
              id v27 = v27;

              id v29 = v27;
              goto LABEL_50;
            }
            uint64_t v35 = ((v30 + 1) * (unsigned __int128)0x20040080100201uLL) >> 64;
            unint64_t v30 = v30 + 1 - 2047 * ((v35 + ((v30 + 1 - v35) >> 1)) >> 10);
          }
          while (v28++ < 0x11);
          if (v29) {
            goto LABEL_50;
          }
          id v37 = [objc_alloc((Class)NSString) initWithUTF8String:file_path];
LABEL_49:
          id v29 = v37;
LABEL_50:
          unint64_t v16 = a3;

          uint64_t v44 = *(void *)(a1[6] + 8);
          id v38 = *(id *)(v44 + 40);
          *(void *)(v44 + 40) = v29;
        }
        else
        {
          id v38 = [objc_alloc((Class)NSString) initWithUTF8String:file_path];
          uint64_t v39 = [v38 stringByResolvingSymlinksInPath];
          uint64_t v40 = *(void *)(a1[6] + 8);
          long long v41 = *(void **)(v40 + 40);
          *(void *)(v40 + 40) = v39;
        }
      }
      else
      {
        uint64_t v42 = *(void *)(a1[6] + 8);
        id v38 = *(id *)(v42 + 40);
        *(void *)(v42 + 40) = @"unknown dylib";
      }

      unint64_t v25 = *(void **)(*(void *)(a1[6] + 8) + 40);
    }
    long long v23 = v25;
    goto LABEL_53;
  }
}

int64_t sub_10000B328(id a1, id a2, id a3)
{
  uint64_t v4 = a2;
  id v5 = a3;
  if (v4)
  {
    unint64_t v6 = v4[2];
    if (v5)
    {
LABEL_3:
      unint64_t v7 = v5[2];
      goto LABEL_4;
    }
  }
  else
  {
    unint64_t v6 = 0;
    if (v5) {
      goto LABEL_3;
    }
  }
  unint64_t v7 = 0;
LABEL_4:
  if (v6 >= v7)
  {
    if (v4)
    {
      unint64_t v9 = v4[2];
      if (v5)
      {
LABEL_8:
        unint64_t v10 = v5[2];
LABEL_9:
        int64_t v8 = v9 > v10;
        goto LABEL_10;
      }
    }
    else
    {
      unint64_t v9 = 0;
      if (v5) {
        goto LABEL_8;
      }
    }
    unint64_t v10 = 0;
    goto LABEL_9;
  }
  int64_t v8 = -1;
LABEL_10:

  return v8;
}

const char *__cdecl sub_10000B55C(id a1, int64_t a2)
{
  int v2 = +[NSNumber numberWithLongLong:a2];
  id v3 = [v2 stringValue];
  uint64_t v4 = (const char *)[v3 UTF8String];

  return v4;
}

const char *__cdecl sub_10000B5BC(id a1, int64_t a2)
{
  int v2 = "-";
  id v3 = "N";
  if (a2 == 3) {
    id v3 = "Y";
  }
  if (a2 != 1) {
    int v2 = v3;
  }
  if (a2) {
    return v2;
  }
  else {
    return 0;
  }
}

__CFString *sub_10000C708(uint64_t a1, uint64_t *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned int a7)
{
  id v10 = a3;
  self;
  uint64_t v11 = *a2;
  if ((*a2 & 0x400) == 0
    || (+[NSString stringWithUTF8String:a2 + 12],
        (id v12 = (__CFString *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    switch((char)v11)
    {
      case 0:
        unint64_t v13 = a2[1];
        if (v13 > 0xFF) {
          goto LABEL_7;
        }
        id v12 = off_1000292B0[v13];
        if (v12) {
          break;
        }
        unint64_t v13 = a2[1];
LABEL_7:
        +[NSString stringWithFormat:@"VM_KERN_MEMORY_%llu", v13, v22];
        goto LABEL_23;
      case 1:
        id v14 = +[NSNumber numberWithUnsignedLongLong:a2[1]];
        id v15 = [v10 objectForKeyedSubscript:v14];

        if (!v15
          || ([v15 objectForKeyedSubscript:kCFBundleIdentifierKey],
              (id v12 = (__CFString *)objc_claimAutoreleasedReturnValue()) == 0))
        {
          id v12 = +[NSString stringWithFormat:@"unloaded kmod %llu", a2[1]];
        }

        if (!v12) {
          goto LABEL_29;
        }
        break;
      case 2:
        if (a2[1])
        {
          CSSymbolicatorGetSymbolWithAddressAtTime();
          uint64_t Name = CSSymbolGetName();
          if (Name)
          {
            uint64_t v17 = +[NSString stringWithUTF8String:Name];
            goto LABEL_24;
          }
        }
        if (a2[2])
        {
          +[NSString stringWithFormat:@"site 0x%qx", a2[1], v22];
          goto LABEL_23;
        }
        id v12 = 0;
        goto LABEL_30;
      case 3:
        unint64_t v18 = a2[1];
        if (v18 > 0xE) {
          goto LABEL_20;
        }
        uint64_t v19 = off_100029AB0[v18];
        if (v18 != 14)
        {
          id v12 = v19;
          if (a6) {
            goto LABEL_26;
          }
          goto LABEL_30;
        }
        unint64_t v18 = a2[1];
LABEL_20:
        +[NSString stringWithFormat:@"VM_KERN_COUNT_%llu", v18, v22];
        uint64_t v17 = LABEL_23:;
LABEL_24:
        id v12 = (__CFString *)v17;
        if (!v17) {
          goto LABEL_29;
        }
        break;
      default:
        +[NSString stringWithFormat:@"unknown site (0x%x, 0x%qx)", v11, a2[1]];
        goto LABEL_23;
    }
  }
  if (a6)
  {
LABEL_26:
    if ((*a2 & 0x800) != 0 && *((unsigned __int16 *)a2 + 33) < a7)
    {
      uint64_t v20 = +[NSString stringWithFormat:@"%@[%.*s]", v12, 80, a6 + 80 * *((unsigned __int16 *)a2 + 33)];

      id v12 = (__CFString *)v20;
      if (!v20) {
LABEL_29:
      }
        id v12 = @"unknown";
    }
  }
LABEL_30:

  return v12;
}

int64x2_t *sub_10000CCAC(int64x2_t *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  if (result)
  {
    id v5 = result;
    uint64_t result = sub_10000CCFC((int64x2_t *)result->i64[1], a2, a3, a4, *a5, a5[1], a5[2], a5[3], a5[4]);
    v5->i64[1] = (uint64_t)result;
  }
  return result;
}

int64x2_t *sub_10000CCFC(int64x2_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v17 = (int64x2_t *)malloc_type_malloc(0x40uLL, 0x1020040D3BB1902uLL);
  unint64_t v18 = v17;
  if (!a1)
  {
    v17->i64[0] = a2;
    v17->i64[1] = a3;
    v17[1].i64[0] = a7;
    v17[1].i64[1] = a5;
    v17[2].i64[0] = a6;
    v17[2].i64[1] = a8;
    a1 = v17;
    v17[3].i64[0] = a9;
    v17[3].i64[1] = 0;
    return a1;
  }
  uint64_t v19 = 0;
  v18->i64[0] = a2;
  v18->i64[1] = a3;
  v18[1].i64[0] = a7;
  v18[1].i64[1] = a5;
  uint64_t v20 = a4 - 1;
  uint64_t v21 = -a4;
  v18[2].i64[0] = a6;
  v18[2].i64[1] = a8;
  unint64_t v22 = a2 & -a4;
  unint64_t v23 = (a2 + a3 + a4 - 1) & -a4;
  int v24 = a1;
  v18[3].i64[0] = a9;
  v18[3].i64[1] = 0;
  do
  {
    unint64_t v25 = (uint64_t *)v24;
    if (((v24->i64[0] + v20 + v24->i64[1]) & (unint64_t)v21) >= v22)
    {
      unint64_t v25 = v19;
      if ((v24->i64[0] & (unint64_t)v21) > v23)
      {
        unint64_t v25 = v19;
        if (!v19) {
          goto LABEL_12;
        }
LABEL_7:
        uint64_t v26 = (int64x2_t *)v25[7];
        if (v26 == v24)
        {
          v25[7] = (uint64_t)v18;
          v18[3].i64[1] = (uint64_t)v24;
          return a1;
        }
        id v27 = a1;
        if (v26) {
          goto LABEL_14;
        }
        return v27;
      }
    }
    int v24 = (int64x2_t *)v24[3].i64[1];
    uint64_t v19 = v25;
  }
  while (v24);
  if (v25) {
    goto LABEL_7;
  }
LABEL_12:
  if (v24 == a1)
  {
    v18[3].i64[1] = (uint64_t)a1;
    return v18;
  }
  v18[3].i64[1] = a1[3].i64[1];
  uint64_t v26 = a1;
  id v27 = v18;
LABEL_14:
  if (v26 == v24) {
    return v27;
  }
  do
  {
    unsigned int v28 = v26;
    unint64_t v29 = v26->i64[0];
    unint64_t v30 = v26->i64[0] & v21;
    unint64_t v31 = v26->i64[1] + v26->i64[0];
    unint64_t v32 = (v31 + v20) & v21;
    if (v22 > v30) {
      unint64_t v30 = v22;
    }
    if (v23 < v32) {
      unint64_t v32 = v23;
    }
    BOOL v33 = v32 >= v30;
    unint64_t v34 = v32 - v30;
    if (!v33) {
      unint64_t v34 = 0;
    }
    int64x2_t v35 = v26[1];
    uint64x2_t v36 = (uint64x2_t)vdupq_n_s64(v34);
    int64x2_t v37 = v18[1];
    int64x2_t v38 = v18[2];
    int8x16_t v39 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v37, (uint64x2_t)v35), (int8x16_t)v37, (int8x16_t)v35);
    int8x16_t v40 = (int8x16_t)vqsubq_u64((uint64x2_t)vaddq_s64(v35, v37), v36);
    v18[1] = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v40, (uint64x2_t)v39), v40, v39);
    int64x2_t v41 = v26[2];
    int8x16_t v42 = (int8x16_t)vqsubq_u64((uint64x2_t)vaddq_s64(v41, v38), v36);
    int8x16_t v43 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v38, (uint64x2_t)v41), (int8x16_t)v38, (int8x16_t)v41);
    v18[2] = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v42, (uint64x2_t)v43), v42, v43);
    unint64_t v44 = v18[3].u64[0];
    unint64_t v45 = v26[3].u64[0];
    uint64_t v46 = v26[3].i64[1];
    BOOL v33 = v45 + v44 >= v34;
    unint64_t v47 = v45 + v44 - v34;
    if (!v33) {
      unint64_t v47 = 0;
    }
    if (v44 <= v45) {
      unint64_t v44 = v26[3].u64[0];
    }
    if (v47 <= v44) {
      unint64_t v47 = v44;
    }
    if (v29 >= v18->i64[0]) {
      unint64_t v29 = v18->i64[0];
    }
    if (v18->i64[1] + v18->i64[0] > v31) {
      unint64_t v31 = v18->i64[1] + v18->i64[0];
    }
    v18->i64[0] = v29;
    v18->i64[1] = v31 - v29;
    v18[3].i64[0] = v47;
    v18[3].i64[1] = v46;
    uint64_t v26 = (int64x2_t *)v26[3].i64[1];
    free(v28);
    a1 = v18;
    if (v25)
    {
      v25[7] = (uint64_t)v18;
      a1 = v27;
    }
    if (!v26) {
      break;
    }
    id v27 = a1;
  }
  while (v26 != v24);
  return a1;
}

uint64_t sub_10000CF50(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  unint64_t v6 = v5;
  if (a1)
  {
    id v5 = *(int64x2_t **)(a1 + 8);
    unint64_t v9 = v6;
    for (unint64_t i = (uint64_t *)v6->i64[1]; i; unint64_t i = (uint64_t *)i[7])
      id v5 = sub_10000CCFC(v5, *i, i[1], a3, i[3], i[4], i[2], i[5], i[6]);
    *(void *)(a1 + 8) = v5;
    unint64_t v6 = v9;
  }

  return _objc_release_x1(v5, v6);
}

void sub_10000CFDC(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a1)
  {
    id v12 = v5;
    if (v5)
    {
      id v6 = v5[13];
      if (v6)
      {
        unint64_t v7 = v6;
        sub_10000CF50(a1, v6, a3);
LABEL_7:

        id v5 = v12;
        goto LABEL_8;
      }
      int64_t v8 = v12;
      uint64_t v9 = (uint64_t)v12[9];
      uint64_t v10 = (uint64_t)v12[11];
    }
    else
    {
      int64_t v8 = 0;
      uint64_t v9 = 0;
      uint64_t v10 = 0;
    }
    uint64_t v11 = sub_10000CCFC(*(int64x2_t **)(a1 + 8), v9, v10, a3, (uint64_t)[v8 dirtySize], (uint64_t)[v12 swappedSize], (uint64_t)[v12 cleanSize], (uint64_t)[v12 reclaimableSize], (uint64_t)[v12 wiredSize]);
    unint64_t v7 = 0;
    *(void *)(a1 + 8) = v11;
    goto LABEL_7;
  }
LABEL_8:
}

uint64_t sub_10000D0F8@<X0>(uint64_t result@<X0>, int64x2_t *a2@<X8>)
{
  int64x2_t v2 = 0uLL;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (result)
  {
    uint64_t v3 = *(void *)(result + 8);
    if (v3)
    {
      uint64_t v4 = 0;
      int64x2_t v5 = 0uLL;
      do
      {
        v4 += *(void *)(v3 + 16);
        int64x2_t v2 = vaddq_s64(*(int64x2_t *)(v3 + 24), v2);
        int64x2_t v5 = vaddq_s64(*(int64x2_t *)(v3 + 40), v5);
        uint64_t v3 = *(void *)(v3 + 56);
      }
      while (v3);
      a2[1].i64[0] = v4;
      *a2 = v2;
      *(int64x2_t *)((char *)a2 + 24) = v5;
    }
  }
  return result;
}

uint64_t sub_10000D1A8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    uint64_t v9 = v3;
    id v5 = [v3 copy];
    id v6 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = v5;

    id v3 = [v9 hasPrefix:@"__TEXT"];
    if ((v3 & 1) != 0
      || (id v3 = [v9 hasPrefix:@"__OBJC_RO"], (v3 & 1) != 0))
    {
      char v7 = 2;
LABEL_5:
      id v4 = v9;
LABEL_6:
      *(unsigned char *)(a1 + 8) = v7;
      goto LABEL_7;
    }
    id v3 = [v9 hasPrefix:@"__LINKEDIT"];
    if (v3)
    {
      char v7 = 4;
      goto LABEL_5;
    }
    id v3 = [v9 hasPrefix:@"__"];
    id v4 = v9;
    if (v3)
    {
      char v7 = 3;
      goto LABEL_6;
    }
  }
LABEL_7:

  return _objc_release_x1(v3, v4);
}

id *sub_10000D2B8(id *a1, void *a2)
{
  id v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)FPImageEnumerator;
    id v5 = (id)[super init];
    a1 = v5;
    if (v5)
    {
      v5[2] = 0;
      objc_storeStrong(v5 + 1, a2);
    }
  }

  return a1;
}

void *sub_10000D334(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (a1)
  {
    while (1)
    {
      unint64_t v6 = *(void *)(a1 + 16);
      if (v6 >= (unint64_t)[*(id *)(a1 + 8) count]) {
        break;
      }
      objc_super v7 = [*(id *)(a1 + 8) objectAtIndexedSubscript:*(void *)(a1 + 16)];
      int64_t v8 = v7;
      if (v7)
      {
        unint64_t v9 = v7[2];
        unint64_t v10 = v7[3] + v9;
        if (v9 <= a2 && v10 > a2)
        {
LABEL_16:
          id v12 = v7;
LABEL_18:

          goto LABEL_19;
        }
      }
      else
      {
        unint64_t v10 = 0;
        unint64_t v9 = 0;
      }
      if (v9 < a3 && v10 >= a3 || v9 >= a2 && v10 <= a3) {
        goto LABEL_16;
      }
      if (v9 >= a2)
      {
        id v12 = 0;
        goto LABEL_18;
      }
      ++*(void *)(a1 + 16);
    }
  }
  id v12 = 0;
LABEL_19:

  return v12;
}

NSMapTable *sub_10000DB94(uint64_t a1, void *a2)
{
  kern_return_t corpse;
  FPCorpseProcess *v85;
  id v86;
  mach_error_t v87;
  id v88;
  const char *v89;
  unsigned int v90;
  char *v91;
  id v92;
  void *v93;
  NSMapTable *v94;
  void *v95;
  id v96;
  id v97;
  uint64_t v98;
  void *i;
  uint64_t v100;
  void *v101;
  int v103;
  const char *v104;
  NSMapTable *v106;
  id v107;
  void *v108;
  NSMapTable *obj;
  id obja;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  long long v114;
  long long v115;
  long long v116;
  long long v117;
  long long v118;
  long long v119;
  long long v120;
  long long v121;
  long long v122;
  long long v123;
  long long v124;
  long long v125;
  long long v126;
  long long v127;
  long long v128;
  long long v129;
  id v130;
  id v131;
  stat v132;
  long long v133;
  long long v134;
  long long v135;
  long long v136;
  unsigned char v137[128];
  unsigned char v138[128];
  unsigned char v139[128];
  unsigned char v140[128];
  NSErrorUserInfoKey v141;
  void *v142;
  NSErrorUserInfoKey v143;
  CFStringRef v144;
  NSErrorUserInfoKey v145;
  void *v146;
  id v147;
  NSErrorUserInfoKey v148;
  void *v149;
  NSErrorUserInfoKey v150;
  void *v151;
  unsigned char v152[128];
  uint64_t vars8;

  if (a2) {
    *a2 = 0;
  }
  id v3 = +[NSMapTable strongToStrongObjectsMapTable];
  v133 = 0u;
  v134 = 0u;
  v135 = 0u;
  v136 = 0u;
  id v4 = [*(id *)(a1 + 96) copy];
  id v5 = [v4 countByEnumeratingWithState:&v133 objects:v152 count:16];
  v113 = a1;
  if (!v5)
  {
LABEL_19:

    NSUInteger v22 = [(NSMapTable *)v3 count];
    id v23 = *(id *)(a1 + 88);
    if ([v23 count] || objc_msgSend(*(id *)(a1 + 96), "count"))
    {

      int v24 = a2;
    }
    else
    {
      id v103 = *(unsigned __int8 *)(a1 + 9);

      int v24 = a2;
      if (!v103 && !v22)
      {
        if (a2)
        {
          v143 = NSLocalizedDescriptionKey;
          v144 = @"Must specify at least one process or memgraph";
          unint64_t v34 = +[NSDictionary dictionaryWithObjects:&v144 forKeys:&v143 count:1];
          +[NSError errorWithDomain:@"FPFootprintError" code:8 userInfo:v34];
          int8x16_t v40 = 0;
          *a2 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_103;
        }
        int8x16_t v40 = 0;
        goto LABEL_104;
      }
    }
    if (*(unsigned char *)(a1 + 11)) {
      sub_100011464((uint64_t)FPFootprint, 1);
    }
    id v25 = objc_alloc_init((Class)NSMutableSet);
    if (*(unsigned char *)(a1 + 16))
    {
      uint64_t v26 = +[NSNumber numberWithInt:getpid()];
      [v25 addObject:v26];
    }
    long long v108 = v25;
    if ([*(id *)(a1 + 104) count])
    {
      id v27 = [*(id *)(a1 + 104) allObjects];
      unsigned int v28 = +[FPProcess pidsForStringDescriptions:v27 errors:0];
      unint64_t v29 = [v28 allKeys];
      [v25 addObjectsFromArray:v29];
    }
    if (*(unsigned char *)(a1 + 9))
    {
      uint64_t v30 = +[FPProcess allProcessesExcludingPids:v25];
      unint64_t v31 = v3;
      id v3 = (NSMapTable *)v30;
LABEL_88:

      if (*(unsigned char *)(a1 + 10))
      {
        v93 = +[FPProcess removeIdleExitCleanProcessesFrom:v3];
        v94 = (NSMapTable *)[v93 mutableCopy];

        id v3 = v94;
      }
      if (*(void *)(a1 + 24))
      {
        v116 = 0u;
        v117 = 0u;
        v114 = 0u;
        v115 = 0u;
        id v95 = NSAllMapTableKeys(v3);
        v96 = [v95 countByEnumeratingWithState:&v114 objects:v137 count:16];
        if (v96)
        {
          uint64_t v97 = v96;
          v98 = *(void *)v115;
          do
          {
            for (unint64_t i = 0; i != v97; unint64_t i = (char *)i + 1)
            {
              if (*(void *)v115 != v98) {
                objc_enumerationMutation(v95);
              }
              uint64_t v100 = *(void *)(*((void *)&v114 + 1) + 8 * i);
              id v101 = [(NSMapTable *)v3 objectForKey:v100];
              if ((objc_opt_respondsToSelector() & 1) != 0
                && (unint64_t)[v101 physFootprint] < *(void *)(a1 + 24) << 20)
              {
                [(NSMapTable *)v3 removeObjectForKey:v100];
              }
            }
            uint64_t v97 = [v95 countByEnumeratingWithState:&v114 objects:v137 count:16];
          }
          while (v97);
        }
      }
      id v3 = v3;
      int8x16_t v40 = v3;
      unint64_t v34 = v108;
      goto LABEL_103;
    }
    int64x2_t v41 = *(void **)(a1 + 88);
    id v42 = *(id *)(a1 + 96);
    id v43 = v41;
    unint64_t v44 = [v42 allObjects];
    v130 = 0;
    unint64_t v45 = +[FPProcess pidsForStringDescriptions:v44 errors:&v130];
    uint64_t v46 = (NSMapTable *)v130;
    [v43 addEntriesFromDictionary:v45];

    if (v24 && v46)
    {
      unint64_t v47 = [(NSMapTable *)v46 componentsJoinedByString:@"\n"];
      v141 = NSLocalizedDescriptionKey;
      v142 = v47;
      SEL v48 = +[NSDictionary dictionaryWithObjects:&v142 forKeys:&v141 count:1];
      *int v24 = +[NSError errorWithDomain:@"FPFootprintError" code:4 userInfo:v48];
    }
    id v49 = *(id *)(a1 + 88);
    long long v50 = [v108 allObjects];
    [v49 removeObjectsForKeys:v50];

    if (*(unsigned char *)(a1 + 8))
    {
      unint64_t v51 = v46;
      unint64_t v52 = [*(id *)(a1 + 88) allKeys];
      unint64_t v53 = +[FPProcess childPidsForPids:v52];

      v128 = 0u;
      v129 = 0u;
      v126 = 0u;
      v127 = 0u;
      id v54 = v53;
      id v55 = [v54 countByEnumeratingWithState:&v126 objects:v140 count:16];
      if (v55)
      {
        id v56 = v55;
        uint64_t v57 = *(void *)v127;
        do
        {
          for (j = 0; j != v56; j = (char *)j + 1)
          {
            if (*(void *)v127 != v57) {
              objc_enumerationMutation(v54);
            }
            uint64_t v59 = *(void *)(*((void *)&v126 + 1) + 8 * (void)j);
            unint64_t v60 = +[NSNull null];
            [*(id *)(a1 + 88) setObject:v60 forKeyedSubscript:v59];
          }
          id v56 = [v54 countByEnumeratingWithState:&v126 objects:v140 count:16];
        }
        while (v56);
      }

      uint64_t v46 = v51;
    }
    long long v106 = v46;
    if (*(unsigned char *)(a1 + 13))
    {
      id v61 = objc_alloc((Class)NSMutableSet);
      id v62 = [*(id *)(a1 + 88) allKeys];
      id v63 = [v61 initWithArray:v62];

      [v63 unionSet:v108];
      [v63 addObject:&off_10002C188];
      v64 = +[FPProcess allProcessesExcludingPids:v63];
      v122 = 0u;
      v123 = 0u;
      v124 = 0u;
      v125 = 0u;
      unint64_t v65 = [(NSMapTable *)v64 objectEnumerator];
      id v66 = [v65 countByEnumeratingWithState:&v122 objects:v139 count:16];
      if (v66)
      {
        id v67 = v66;
        uint64_t v68 = *(void *)v123;
        do
        {
          for (k = 0; k != v67; k = (char *)k + 1)
          {
            if (*(void *)v123 != v68) {
              objc_enumerationMutation(v65);
            }
            [*(id *)(*((void *)&v122 + 1) + 8 * (void)k) setHiddenFromDisplay:1];
          }
          id v67 = [v65 countByEnumeratingWithState:&v122 objects:v139 count:16];
        }
        while (v67);
      }

      id v3 = v64;
    }
    v120 = 0u;
    v121 = 0u;
    v118 = 0u;
    v119 = 0u;
    obja = *(id *)(a1 + 88);
    id v70 = [obja countByEnumeratingWithState:&v118 objects:v138 count:16];
    p_vtable = &OBJC_METACLASS___FPMemoryRegion.vtable;
    if (!v70)
    {
LABEL_87:

      unint64_t v31 = v106;
      goto LABEL_88;
    }
    id v72 = v70;
    v112 = *(void *)v119;
LABEL_63:
    uint64_t v73 = 0;
    while (1)
    {
      if (*(void *)v119 != v112) {
        objc_enumerationMutation(obja);
      }
      CFStringRef v74 = *(void **)(*((void *)&v118 + 1) + 8 * v73);
      v75 = [*(id *)(a1 + 88) objectForKeyedSubscript:v74];
      int v76 = [p_vtable + 27 processWithPid:[v74 longValue]];
      id v77 = +[NSNull null];
      unsigned __int8 v78 = [v75 isEqual:v77];
      unsigned __int8 v79 = v78;
      if (!v76)
      {

        if (v79)
        {
          [v74 longValue];
          warnx("Unable to analyze process with pid %ld (try as root?)");
        }
        else
        {
          [v75 UTF8String];
          [v74 longValue];
          warnx("Unable to analyze process %s [%ld] (try as root?)");
        }
        goto LABEL_79;
      }
      v80 = v3;
      if ((v78 & 1) == 0)
      {
        unint64_t v81 = [v76 name];
        unsigned __int8 v82 = [v81 isEqualToString:v75];

        if (v82) {
          goto LABEL_71;
        }
        uint64_t v83 = __stderrp;
        id v77 = [v76 name];
        p_vtable = (void **)(&OBJC_METACLASS___FPMemoryRegion + 24);
        fprintf(v83, "Found process %s [%d] from partial name %s\n", (const char *)[v77 UTF8String], [v76 pid], (const char *)[v75 UTF8String]);
      }

LABEL_71:
      if (!*(unsigned char *)(v113 + 14))
      {
        id v3 = v80;
LABEL_76:
        a1 = v113;
        goto LABEL_77;
      }
      objc_opt_class();
      id v3 = v80;
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_76;
      }
      v132.st_dev = 0;
      corpse = task_generate_corpse((task_read_t)[v76 task], (mach_port_t *)&v132);
      a1 = v113;
      if (corpse)
      {
        v87 = corpse;
        v88 = [v76 name];
        v89 = (const char *)[v88 UTF8String];
        v90 = [v76 pid];
        id v91 = mach_error_string(v87);
        unint64_t v104 = v89;
        p_vtable = (void **)(&OBJC_METACLASS___FPMemoryRegion + 24);
        warnx("Unable to fork a corpse of process %s [%d]: %s", v104, v90, v91);

        goto LABEL_78;
      }
      uint64_t v85 = [FPCorpseProcess alloc];
      v86 = sub_100010EC4(v85, v132.st_dev);

      mach_port_deallocate(mach_task_self_, v132.st_dev);
      int v76 = v86;
LABEL_77:
      [(NSMapTable *)v3 setObject:v76 forKey:v74];
LABEL_78:

LABEL_79:
      if (v72 == (id)++v73)
      {
        uint64_t v92 = [obja countByEnumeratingWithState:&v118 objects:v138 count:16];
        id v72 = v92;
        if (!v92) {
          goto LABEL_87;
        }
        goto LABEL_63;
      }
    }
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v134;
  long long v107 = v4;
  obj = v3;
  v111 = *(void *)v134;
LABEL_5:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v134 != v7) {
      objc_enumerationMutation(v4);
    }
    unint64_t v9 = *(void **)(*((void *)&v133 + 1) + 8 * v8);
    memset(&v132, 0, sizeof(v132));
    id v10 = v9;
    if (stat((const char *)[v10 UTF8String], &v132)) {
      goto LABEL_17;
    }
    id v11 = v4;
    id v12 = +[NSURL fileURLWithPath:v10];
    v131 = 0;
    unint64_t v13 = +[FPMemgraphProcess processWithMemgraph:v12 error:&v131];
    id v14 = v131;

    if (v13)
    {
      id v15 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v10 hash]);
      [(NSMapTable *)v3 setObject:v13 forKey:v15];

      if (*(unsigned char *)(a1 + 12))
      {
        int v16 = *(unsigned char *)(a1 + 11) != 0;
        if (v16 != [v13 breakDownPhysFootprint])
        {
          unint64_t v32 = a2;
          BOOL v33 = v14;
          unint64_t v34 = v11;
          if (a2)
          {
            v150 = NSLocalizedDescriptionKey;
            unint64_t v18 = +[NSString stringWithFormat:@"Memgraph was gathered with an analysis mode that conflicts with other memgraphs or command line arguments: %@", v10];
            v151 = v18;
            int64x2_t v35 = &v151;
            uint64x2_t v36 = &v150;
LABEL_34:
            int64x2_t v37 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v36 count:1];
            unint64_t v34 = v11;
            *unint64_t v32 = +[NSError errorWithDomain:@"FPFootprintError" code:6 userInfo:v37];
LABEL_37:

            goto LABEL_38;
          }
          goto LABEL_39;
        }
      }
      if (*(unsigned char *)(a1 + 13))
      {
        unint64_t v32 = a2;
        BOOL v33 = v14;
        unint64_t v34 = v11;
        if (a2)
        {
          v148 = NSLocalizedDescriptionKey;
          unint64_t v18 = +[NSString stringWithFormat:@"--unmapped is not compatible with memgraphs (%@).\nRemove the flag for best effort 'unmapped' analysis (which may be more than other tools such as vmmap(1) but less than footprint(1) analyzing a running process).", v10];
          v149 = v18;
          int64x2_t v35 = &v149;
          uint64x2_t v36 = &v148;
          goto LABEL_34;
        }
        goto LABEL_39;
      }
      *(unsigned char *)(a1 + 11) = [v13 breakDownPhysFootprint];
      *(unsigned char *)(a1 + 12) = 1;
      id v4 = v11;
      goto LABEL_16;
    }
    v147 = v10;
    uint64_t v17 = +[NSArray arrayWithObjects:&v147 count:1];
    unint64_t v18 = +[FPProcess pidsForStringDescriptions:v17 errors:0];

    uint64_t v19 = [v18 allKeys];
    uint64_t v20 = [v19 firstObject];

    if (!v20) {
      break;
    }
    uint64_t v21 = [v18 objectForKeyedSubscript:v20];
    a1 = v113;
    [*(id *)(v113 + 88) setObject:v21 forKeyedSubscript:v20];

    id v4 = v107;
    id v3 = obj;
LABEL_16:
    [*(id *)(a1 + 96) removeObject:v10];

    uint64_t v7 = v111;
LABEL_17:
    if (v6 == (id)++v8)
    {
      id v6 = [v4 countByEnumeratingWithState:&v133 objects:v152 count:16];
      if (!v6) {
        goto LABEL_19;
      }
      goto LABEL_5;
    }
  }
  if (a2)
  {
    v145 = NSLocalizedDescriptionKey;
    BOOL v33 = v14;
    int64x2_t v37 = [v14 localizedDescription];
    int64x2_t v38 = +[NSString stringWithFormat:@"Error opening memgraph %@: %@", v10, v37];
    v146 = v38;
    int8x16_t v39 = +[NSDictionary dictionaryWithObjects:&v146 forKeys:&v145 count:1];
    *a2 = +[NSError errorWithDomain:@"FPFootprintError" code:7 userInfo:v39];

    unint64_t v34 = v107;
    id v3 = obj;
    goto LABEL_37;
  }
  unint64_t v34 = v107;
  id v3 = obj;
  BOOL v33 = v14;
LABEL_38:

LABEL_39:
  int8x16_t v40 = 0;
LABEL_103:

LABEL_104:

  return v40;
}

uint64_t start(int a1, char *const *a2)
{
  id v140 = objc_alloc_init((Class)NSMutableArray);
  id v4 = [FPFootprintArgs alloc];
  if (!v4) {
    goto LABEL_64;
  }
  v153.receiver = v4;
  v153.super_class = (Class)FPFootprintArgs;
  id v5 = (int64x2_t *)[super init];
  id v6 = v5;
  if (!v5)
  {
    id v4 = +[NSError errorWithDomain:@"FPFootprintError" code:0 userInfo:0];
LABEL_64:
    id v43 = v4;
    goto LABEL_98;
  }
  v5->i16[4] = 0;
  v5->i8[10] = 0;
  v5[2] = vdupq_n_s64(1uLL);
  uint64_t v7 = (void *)v5[4].i64[1];
  v5[4].i64[1] = 0;

  uint64_t v8 = +[NSMutableDictionary dictionary];
  unint64_t v9 = (void *)v6[5].i64[1];
  v6[5].i64[1] = v8;

  uint64_t v10 = +[NSMutableSet set];
  id v11 = (void *)v6[6].i64[0];
  v6[6].i64[0] = v10;

  uint64_t v12 = +[NSMutableSet set];
  unint64_t v13 = (void *)v6[6].i64[1];
  v6[6].i64[1] = v12;

  *(__int16 *)((char *)&v6->i16[5] + 1) = 1;
  v6[3].i64[0] = 0;
  objc_storeStrong((id *)&v6[4], @"Dirty");
  v6[7].i64[0] = 0;
  *(__int16 *)((char *)&v6->i16[7] + 1) = 256;
  v6[3].i64[1] = 0;
  uint64_t v157 = 0;
  v196.name = "all";
  v196.has_arg = 0;
  v196.flag = 0;
  v196.val = 97;
  v197 = "json";
  int v198 = 1;
  uint64_t v199 = 0;
  int v200 = 106;
  v201 = "perfdata";
  int v202 = 1;
  uint64_t v203 = 0;
  int v204 = 262;
  v205 = "help";
  int v206 = 0;
  uint64_t v207 = 0;
  int v208 = 104;
  v209 = "targetChildren";
  int v210 = 0;
  uint64_t v211 = 0;
  int v212 = 116;
  v213 = "";
  int v214 = 1;
  uint64_t v215 = 0;
  int v216 = 112;
  v217 = "proc";
  int v218 = 1;
  v219 = (char *)&v157 + 4;
  int v220 = 1;
  v221 = "exclude";
  int v222 = 1;
  uint64_t v223 = 0;
  int v224 = 120;
  v225 = "pid";
  int v226 = 1;
  v227 = &v157;
  int v228 = 1;
  v229 = "skip";
  int v230 = 0;
  uint64_t v231 = 0;
  int v232 = 115;
  v233 = "minFootprint";
  int v234 = 1;
  uint64_t v235 = 0;
  int v236 = 267;
  v237 = "forkCorpse";
  int v238 = 0;
  uint64_t v239 = 0;
  int v240 = 265;
  v241 = "";
  int v242 = 0;
  uint64_t v243 = 0;
  int v244 = 118;
  v245 = "format";
  int v246 = 1;
  uint64_t v247 = 0;
  int v248 = 102;
  v249 = "sort";
  int v250 = 1;
  uint64_t v251 = 0;
  int v252 = 260;
  v253 = "summary";
  int v254 = 0;
  uint64_t v255 = 0;
  int v256 = 121;
  v257 = "physFootprint";
  int v258 = 0;
  uint64_t v259 = 0;
  int v260 = 256;
  v261 = "vmObjectDirty";
  int v262 = 0;
  uint64_t v263 = 0;
  int v264 = 257;
  v265 = "wide";
  int v266 = 0;
  uint64_t v267 = 0;
  int v268 = 119;
  v269 = "swapped";
  int v270 = 0;
  uint64_t v271 = 0;
  int v272 = 258;
  v273 = "wired";
  int v274 = 0;
  uint64_t v275 = 0;
  int v276 = 259;
  v277 = "unmapped";
  int v278 = 0;
  uint64_t v279 = 0;
  int v280 = 261;
  v281 = "sample";
  int v282 = 1;
  uint64_t v283 = 0;
  int v284 = 263;
  v285 = "sample-duration";
  int v286 = 1;
  uint64_t v287 = 0;
  int v288 = 264;
  v289 = "noCategories";
  int v290 = 0;
  uint64_t v291 = 0;
  int v292 = 266;
  v293 = "layout";
  int v294 = 1;
  uint64_t v295 = 0;
  int v296 = 108;
  v297 = "ioaccel";
  int v298 = 0;
  uint64_t v299 = 0;
  int v300 = 268;
  long long v301 = 0u;
  long long v302 = 0u;
  optreset = 1;
  optind = 1;
  optarg = 0;
  while (2)
  {
    while (1)
    {
      int v14 = getopt_long_only(a1, a2, "aj:htp:x:svf:yw", &v196, 0);
      int v15 = v14;
      if (v14 <= 255) {
        break;
      }
      switch(v14)
      {
        case 256:
          warnx("WARNING: --physFootprint option is deprecated because it is the default mode");
          continue;
        case 257:
          *(__int16 *)((char *)&v6->i16[5] + 1) = 256;
          continue;
        case 258:
          v6[3].i64[0] |= 2uLL;
          continue;
        case 259:
          v6[3].i64[0] |= 1uLL;
          continue;
        case 260:
          long long v148 = 0u;
          long long v149 = 0u;
          long long v146 = 0u;
          long long v147 = 0u;
          unint64_t v29 = sub_100019BF8();
          id v30 = [v29 countByEnumeratingWithState:&v146 objects:&handler count:16];
          if (!v30) {
            goto LABEL_68;
          }
          uint64_t v31 = *(void *)v147;
LABEL_34:
          uint64_t v32 = 0;
          while (1)
          {
            if (*(void *)v147 != v31) {
              objc_enumerationMutation(v29);
            }
            id v33 = *(id *)(*((void *)&v146 + 1) + 8 * v32);
            unint64_t v34 = (const char *)[v33 UTF8String];
            if (!strcasecmp(v34, optarg)) {
              break;
            }
            if (v30 == (id)++v32)
            {
              id v30 = [v29 countByEnumeratingWithState:&v146 objects:&handler count:16];
              if (!v30)
              {
LABEL_68:

                SEL v48 = sub_100019BF8();
                id v49 = [v48 componentsJoinedByString:@", "];
                long long v50 = [v49 lowercaseString];

                unint64_t v51 = +[NSString stringWithFormat:@"Unrecognized argument '%s' to --sort.\nAccepted arguments: %@", optarg, v50];
                v161[0] = NSLocalizedDescriptionKey;
                v163 = v51;
                unint64_t v52 = +[NSDictionary dictionaryWithObjects:&v163 forKeys:v161 count:1];
                id v47 = +[NSError errorWithDomain:@"FPFootprintError" code:3 userInfo:v52];

                goto LABEL_92;
              }
              goto LABEL_34;
            }
          }
          objc_storeStrong((id *)&v6[4], v33);

          continue;
        case 261:
          v6->i8[13] = 1;
          continue;
        case 262:
          uint64_t v36 = +[NSString stringWithUTF8String:optarg];
          int64x2_t v37 = (void *)v6[5].i64[0];
          v6[5].i64[0] = v36;

          continue;
        case 263:
        case 264:
          int v16 = +[NSString stringWithUTF8String:optarg];
          [v16 doubleValue];
          double v18 = v17;

          if (v18 < 0.0 || ((*(void *)&v18 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 >= 0x3FF)
          {
            unint64_t v44 = "duration";
            if (v15 == 263) {
              unint64_t v44 = "interval";
            }
            unint64_t v45 = +[NSString stringWithFormat:@"Invalid sampling %s '%s'", v44, optarg];
            NSErrorUserInfoKey v183 = NSLocalizedDescriptionKey;
            v184 = v45;
            uint64_t v46 = +[NSDictionary dictionaryWithObjects:&v184 forKeys:&v183 count:1];
            id v47 = +[NSError errorWithDomain:@"FPFootprintError" code:9 userInfo:v46];

            goto LABEL_92;
          }
          if (v15 == 263) {
            *(double *)v6[7].i64 = v18;
          }
          else {
            *(double *)&v6[7].i64[1] = v18;
          }
          break;
        case 265:
          v6->i8[14] = 1;
          continue;
        case 266:
          v6->i8[15] = 1;
          continue;
        case 267:
          __endptr[0] = 0;
          uint64_t v35 = strtoll(optarg, __endptr, 10);
          if (*__endptr[0] || v35 < 0 || optarg == __endptr[0])
          {
            uint64_t v57 = +[NSString stringWithFormat:@"Invalid non-negative number '%s' provided to --minFootprint.", optarg];
            v169[0] = NSLocalizedDescriptionKey;
            v171[0] = v57;
            uint64_t v58 = +[NSDictionary dictionaryWithObjects:v171 forKeys:v169 count:1];
            id v47 = +[NSError errorWithDomain:@"FPFootprintError" code:12 userInfo:v58];

            goto LABEL_92;
          }
          v6[1].i64[1] = v35;
          continue;
        case 268:
          if (!sub_100014998())
          {
            NSErrorUserInfoKey v177 = NSLocalizedDescriptionKey;
            CFStringRef v178 = @"--ioaccel is not available on this device";
            uint64_t v59 = +[NSDictionary dictionaryWithObjects:&v178 forKeys:&v177 count:1];
            id v47 = +[NSError errorWithDomain:@"FPFootprintError" code:5 userInfo:v59];

            goto LABEL_92;
          }
          v6[2].i64[0] = 6;
          continue;
        default:
          goto LABEL_76;
      }
    }
    switch(v14)
    {
      case 'a':
        v6->i8[9] = 1;
        continue;
      case 'b':
      case 'c':
      case 'd':
      case 'e':
      case 'g':
      case 'i':
      case 'k':
      case 'm':
      case 'n':
      case 'o':
      case 'q':
      case 'r':
      case 'u':
        goto LABEL_76;
      case 'f':
        uint64_t v21 = optarg;
        if (!optarg) {
          goto LABEL_75;
        }
        if (!strcmp("bytes", optarg))
        {
          v6[2].i64[1] = 0;
        }
        else if (!strcmp("formatted", v21))
        {
          v6[2].i64[1] = 1;
        }
        else
        {
          if (strcmp("pages", v21))
          {
LABEL_75:
            v167[0] = NSLocalizedDescriptionKey;
            v159[0] = @"Unrecognized argument to -f / --format.\nAccepted arguments: 'bytes', 'formatted', 'pages'.";
            id v55 = +[NSDictionary dictionaryWithObjects:v159 forKeys:v167 count:1];
            id v47 = +[NSError errorWithDomain:@"FPFootprintError" code:2 userInfo:v55];

            goto LABEL_92;
          }
          v6[2].i64[1] = 2;
        }
        continue;
      case 'h':
        id v56 = +[NSError errorWithDomain:@"FPFootprintError" code:1 userInfo:0];
        goto LABEL_78;
      case 'j':
        uint64_t v22 = +[NSString stringWithUTF8String:optarg];
        id v23 = (void *)v6[4].i64[1];
        v6[4].i64[1] = v22;

        continue;
      case 'l':
        int v24 = optarg;
        if (!optarg) {
          goto LABEL_69;
        }
        if (!strcmp("v", optarg))
        {
          v6[3].i64[1] = 0;
        }
        else
        {
          if (strcmp("h", v24))
          {
LABEL_69:
            NSErrorUserInfoKey v179 = NSLocalizedDescriptionKey;
            CFStringRef v180 = @"Unrecognized argument to -l / --layout.\nAccepted arguments: 'v', 'h'.";
            unint64_t v53 = +[NSDictionary dictionaryWithObjects:&v180 forKeys:&v179 count:1];
            id v47 = +[NSError errorWithDomain:@"FPFootprintError" code:11 userInfo:v53];

            goto LABEL_92;
          }
          v6[3].i64[1] = 1;
        }
        continue;
      case 'p':
        id v25 = (void *)v6[6].i64[0];
        uint64_t v26 = +[NSString stringWithUTF8String:optarg];
        [v25 addObject:v26];

        continue;
      case 's':
        v6->i8[10] = 1;
        continue;
      case 't':
        v6->i8[8] = 1;
        continue;
      case 'v':
        v6[2].i64[0] = 2;
        continue;
      case 'w':
        v6[3].i64[0] |= 7uLL;
        continue;
      case 'x':
        id v27 = (void *)v6[6].i64[1];
        unsigned int v28 = +[NSString stringWithUTF8String:optarg];
        [v27 addObject:v28];

        continue;
      case 'y':
        warnx("WARNING: -y/--summary options are deprecated because summary is the default mode");
        continue;
      default:
        if (!v14)
        {
          if (HIDWORD(v157))
          {
            uint64_t v19 = (void *)v6[6].i64[0];
            uint64_t v20 = +[NSString stringWithUTF8String:optarg];
            [v19 addObject:v20];

            HIDWORD(v157) = 0;
          }
          else if (v157)
          {
            __endptr[0] = 0;
            uint64_t v38 = strtol(optarg, __endptr, 10);
            if (optarg == __endptr[0])
            {
              NSErrorUserInfoKey v181 = NSLocalizedDescriptionKey;
              unint64_t v65 = +[NSString stringWithFormat:@"'%s' is not a valid integer for --pid.\n\nUse -p / --proc if you meant to specify a process name.", optarg];
              v182 = v65;
              id v66 = +[NSDictionary dictionaryWithObjects:&v182 forKeys:&v181 count:1];
              id v47 = +[NSError errorWithDomain:@"FPFootprintError" code:4 userInfo:v66];

              goto LABEL_92;
            }
            uint64_t v39 = v38;
            int8x16_t v40 = +[NSNull null];
            int64x2_t v41 = (void *)v6[5].i64[1];
            id v42 = +[NSNumber numberWithInt:v39];
            [v41 setObject:v40 forKeyedSubscript:v42];

            LODWORD(v157) = 0;
          }
          continue;
        }
        if (v14 == -1)
        {
          if (v6[3].i64[1] == 1)
          {
            if ((v6[2].i8[0] & 2) != 0)
            {
              CFStringRef v54 = @"--layout is not compatible with -v";
              goto LABEL_82;
            }
            if (v6->i8[9])
            {
              CFStringRef v54 = @"--layout is not compatible with -a";
LABEL_82:
              uint64_t v60 = +[NSString stringWithFormat:v54];
              id v61 = (void *)v60;
              if (v60)
              {
                NSErrorUserInfoKey v175 = NSLocalizedDescriptionKey;
                uint64_t v176 = v60;
                id v62 = +[NSDictionary dictionaryWithObjects:&v176 forKeys:&v175 count:1];
                id v47 = +[NSError errorWithDomain:@"FPFootprintError" code:10 userInfo:v62];

                goto LABEL_92;
              }
            }
          }
          if (v6->i8[14] && v6->i8[9])
          {
            id v63 = +[NSString stringWithFormat:@"--forkCorpse is not compatible with -a/--all due to corpse resource limits"];
            NSErrorUserInfoKey v173 = NSLocalizedDescriptionKey;
            v174 = v63;
            v64 = +[NSDictionary dictionaryWithObjects:&v174 forKeys:&v173 count:1];
            id v47 = +[NSError errorWithDomain:@"FPFootprintError" code:10 userInfo:v64];

            goto LABEL_92;
          }
          if (v6->i8[11] || !v6->i8[13])
          {
            if (v6->i8[9] && v6->i8[13])
            {
              warnx("NOTICE: '--unmapped' is redundant when using -a/--all");
              goto LABEL_160;
            }
          }
          else
          {
            warnx("WARNING: ignoring '--unmapped' because the requested analysis mode '--vmObjectDirty' does not support unmapped owned VM objects");
LABEL_160:
            v6->i8[13] = 0;
          }
          double v111 = *(double *)&v6[7].i64[1];
          if (v111 > 0.0)
          {
            double v112 = *(double *)v6[7].i64;
            if (v112 == 0.0)
            {
              warnx("WARNING: ignoring '--sample-duration' because sampling was not enabled via '--sample'");
            }
            else if (v112 > v111)
            {
              warnx("WARNING: sample interval greater than duration effectively disables sampling mode");
            }
          }
          if (a1 - optind >= 1)
          {
            v126 = &a2[optind];
            unsigned int v127 = a1 - optind + 1;
            do
            {
              v128 = *v126;
              id v129 = (id)v6[6].i64[0];
              v130 = +[NSString stringWithUTF8String:v128];
              [v129 addObject:v130];

              ++v126;
              --v127;
            }
            while (v127 > 1);
          }
          id v67 = v6;
          id v47 = 0;
        }
        else
        {
LABEL_76:
          id v56 = +[NSError errorWithDomain:@"FPFootprintError" code:5 userInfo:0];
LABEL_78:
          id v47 = v56;
LABEL_92:
          id v67 = 0;
        }

        id v43 = (FPFootprintArgs *)v47;
        if (!v67)
        {
LABEL_98:
          if (v43)
          {
            unsigned int v69 = [(FPFootprintArgs *)v43 userInfo];
            id v70 = [v69 objectForKeyedSubscript:NSLocalizedDescriptionKey];

            if (v70) {
              warnx("%s", (const char *)[v70 UTF8String]);
            }
          }
          sub_1000106A8();
          uint64_t v71 = [(FPFootprintArgs *)v43 domain];
          if (v71 == @"FPFootprintError")
          {
            if ([(FPFootprintArgs *)v43 code] == (id)1)
            {
              id v67 = 0;
              uint64_t v68 = 0;
LABEL_107:

              id v72 = 0;
              goto LABEL_108;
            }
          }
          else
          {
          }
          id v67 = 0;
          uint64_t v68 = 64;
          goto LABEL_107;
        }
        if ((v67->i8[9] || v67->i8[13]) && geteuid())
        {
          warnx("Must run as root.");
          uint64_t v68 = 77;
          goto LABEL_107;
        }
        CFStringRef v74 = sub_100019CB0((id *)[FPOutputFormatterText alloc], (void *)v67[2].i64[1], (void *)v67[3].i64[0], (void *)v67[4].i64[0], (void *)v67[3].i64[1]);
        if (!v74)
        {
          warnx("Unable to initialize text output");

          id v72 = 0;
          uint64_t v68 = 73;
          goto LABEL_108;
        }
        [v140 addObject:v74];
        if (!v67[4].i64[1])
        {
          id v75 = v74;
LABEL_115:
          if (v67[5].i64[0])
          {
            int v76 = sub_100018CC0([FPOutputFormatterPerfdata alloc], (void *)v67[5].i64[0]);

            if (!v76)
            {
              warnx("Unable to create perfdata output");
              goto LABEL_131;
            }
            [v140 addObject:v76];
          }
          else
          {
            int v76 = v75;
          }
          v145 = v43;
          sub_10000DB94((uint64_t)v67, &v145);
          id v72 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
          id v77 = v145;

          if (v72)
          {
            if ([(NSMapTable *)v72 count])
            {
              if (v77)
              {
                id v78 = [(FPFootprintArgs *)v77 localizedDescription];
                warnx("%s", (const char *)[v78 UTF8String]);
              }
              if (qword_100038A38 != -1) {
                dispatch_once(&qword_100038A38, &stru_100029B28);
              }
              sub_1000114E0((uint64_t)FPFootprint, 1);
              if (*(double *)v67[7].i64 == 0.0)
              {
                BOOL v79 = (id)[(NSMapTable *)v72 count] == (id)1;
                self;
                byte_100038A50 = v79;
                NSAllMapTableValues(v72);
                id contexta = (id)objc_claimAutoreleasedReturnValue();
                id v80 = v140;
                unint64_t v81 = v67;
                unsigned __int8 v82 = sub_100011544((id *)[FPFootprint alloc], contexta);
                if (isatty(1))
                {
                  uint64_t v83 = 0;
                }
                else
                {
                  *(void *)&long long v146 = _NSConcreteStackBlock;
                  *((void *)&v146 + 1) = 3221225472;
                  *(void *)&long long v147 = sub_100010830;
                  *((void *)&v147 + 1) = &unk_100029B50;
                  *(void *)&long long v148 = v82;
                  uint64_t v83 = sub_10001165C((uint64_t)FPFootprint, &v146);
                }
                unint64_t v113 = v81[2].u64[0];
                sub_1000116DC((uint64_t)v82, v113);
                sub_10001196C((uint64_t)v82);
                if (v83)
                {
                  dispatch_source_cancel(v83);
                  signal(2, 0);
                }
                long long v187 = 0u;
                long long v188 = 0u;
                long long handler = 0u;
                long long v186 = 0u;
                id v116 = v80;
                id v117 = [v116 countByEnumeratingWithState:&handler objects:&v196 count:16];
                if (v117)
                {
                  uint64_t v118 = *(void *)v186;
                  do
                  {
                    for (unint64_t i = 0; i != v117; unint64_t i = (char *)i + 1)
                    {
                      if (*(void *)v186 != v118) {
                        objc_enumerationMutation(v116);
                      }
                      if (v82) {
                        [v82[11] addObject:*(void *)(*((void *)&handler + 1) + 8 * i)];
                      }
                    }
                    id v117 = [v116 countByEnumeratingWithState:&handler objects:&v196 count:16];
                  }
                  while (v117);
                }

                sub_1000125AC((uint64_t)v82, (v113 >> 1) & 1, v113 & 1, v81->u8[15]);
              }
              else
              {
                id v88 = v140;
                contextb = v67;
                objc_super v153 = (objc_super)0;
                long long v154 = 0u;
                long long v155 = 0u;
                long long v156 = 0u;
                id v89 = v88;
                v90 = (char *)[v89 countByEnumeratingWithState:&v153 objects:&v196 count:16];
                if (v90)
                {
                  uint64_t v91 = *(void *)v154;
                  do
                  {
                    for (j = 0; j != v90; ++j)
                    {
                      if (*(void *)v154 != v91) {
                        objc_enumerationMutation(v89);
                      }
                      v93 = (void *)*((void *)v153.super_class + (void)j);
                      if ((objc_opt_respondsToSelector() & 1) == 0)
                      {
                        v94 = (objc_class *)objc_opt_class();
                        NSStringFromClass(v94);
                        id v95 = objc_claimAutoreleasedReturnValue();
                        warnx("Selected output format (%s) does not support sampling mode", (const char *)[v95 UTF8String]);
                      }
                      [v93 configureForMultipleOutputs];
                    }
                    v90 = (char *)[v89 countByEnumeratingWithState:&v153 objects:&v196 count:16];
                  }
                  while (v90);
                }

                dispatch_semaphore_t v134 = dispatch_semaphore_create(0);
                __endptr[0] = 0;
                __endptr[1] = (char *)__endptr;
                __endptr[2] = (char *)0x3042000000;
                __endptr[3] = (char *)sub_100010860;
                __endptr[4] = (char *)sub_10001086C;
                id v152 = 0;
                v171[0] = 0;
                v171[1] = v171;
                v171[2] = 0x3032000000;
                v171[3] = sub_100010874;
                v171[4] = sub_100010884;
                id v172 = 0;
                v169[0] = 0;
                v169[1] = v169;
                v169[2] = 0x3032000000;
                v169[3] = sub_100010874;
                v169[4] = sub_100010884;
                id v170 = 0;
                v132 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
                dispatch_queue_t v96 = dispatch_queue_create("com.apple.footprint.sample-analysis", v132);
                uint64_t v97 = dispatch_queue_create("com.apple.footprint.sample-timer", 0);
                v98 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v97);
                v167[0] = 0;
                v167[1] = v167;
                v167[2] = 0x2020000000;
                char v168 = 1;
                v163 = 0;
                v164 = &v163;
                uint64_t v165 = 0x2020000000;
                unint64_t v166 = (unint64_t)(*(double *)v67[7].i64 * 1000000000.0);
                v161[0] = 0;
                v161[1] = v161;
                v161[2] = 0x2020000000;
                __uint64_t v162 = 0;
                __uint64_t v162 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW_APPROX);
                uint64_t v99 = (uint64_t)v164[3];
                unint64_t v100 = 1000000000;
                if (v99 < 0x3B9ACA00) {
                  unint64_t v100 = (unint64_t)v164[3];
                }
                unint64_t v101 = v100 >> 1;
                dispatch_source_set_timer(v98, 0, v99, v100 >> 1);
                *(void *)&long long handler = _NSConcreteStackBlock;
                *((void *)&handler + 1) = 3221225472;
                *(void *)&long long v186 = sub_10001088C;
                *((void *)&v186 + 1) = &unk_100029BA0;
                v102 = v98;
                *(void *)&long long v187 = v102;
                v189 = v167;
                v190 = v161;
                v191 = &v163;
                unint64_t v195 = v101;
                v192 = v169;
                id v103 = contextb;
                *((void *)&v187 + 1) = v103;
                v193 = v171;
                v194 = __endptr;
                unint64_t v104 = v96;
                *(void *)&long long v188 = v104;
                id v131 = v89;
                *((void *)&v188 + 1) = v131;
                dispatch_source_set_event_handler(v102, &handler);
                v159[0] = 0;
                v159[1] = v159;
                v159[2] = 0x3020000000;
                char v160 = 0;
                *(void *)&long long v146 = _NSConcreteStackBlock;
                *((void *)&v146 + 1) = 3221225472;
                *(void *)&long long v147 = sub_100010E04;
                *((void *)&v147 + 1) = &unk_100029BE8;
                *((void *)&v149 + 1) = v159;
                v105 = v102;
                *(void *)&long long v148 = v105;
                v150 = __endptr;
                v133 = v97;
                *((void *)&v148 + 1) = v133;
                contextc = v134;
                *(void *)&long long v149 = contextc;
                long long v106 = objc_retainBlock(&v146);
                long long v107 = sub_10001165C((uint64_t)FPFootprint, v106);
                fprintf(__stderrp, "Sampling at %.3gs interval", *(double *)v67[7].i64);
                if (v103[15] > 0.0) {
                  fprintf(__stderrp, " for %.1fs", v103[15]);
                }
                fwrite("... (<ctrl-c> to stop)\n", 0x17uLL, 1uLL, __stderrp);
                double v108 = v103[15];
                if (v108 > 0.0)
                {
                  dispatch_time_t v109 = dispatch_time(0, (uint64_t)(v108 * 1000000000.0));
                  v110 = dispatch_get_global_queue(21, 0);
                  dispatch_after(v109, v110, v106);
                }
                dispatch_resume(v105);
                dispatch_semaphore_wait(contextc, 0xFFFFFFFFFFFFFFFFLL);
                fwrite("Analyzing and writing output...\n", 0x20uLL, 1uLL, __stderrp);
                if (v107)
                {
                  dispatch_source_cancel(v107);
                  signal(2, 0);
                }
                dispatch_sync(v104, &stru_100029C08);

                _Block_object_dispose(v159, 8);
                _Block_object_dispose(v161, 8);
                _Block_object_dispose(&v163, 8);
                _Block_object_dispose(v167, 8);

                _Block_object_dispose(v169, 8);
                _Block_object_dispose(v171, 8);

                _Block_object_dispose(__endptr, 8);
                objc_destroyWeak(&v152);
              }
              long long v143 = 0u;
              long long v144 = 0u;
              long long v141 = 0u;
              long long v142 = 0u;
              id v121 = v140;
              id v122 = [v121 countByEnumeratingWithState:&v141 objects:v158 count:16];
              if (v122)
              {
                uint64_t v123 = *(void *)v142;
                do
                {
                  for (k = 0; k != v122; k = (char *)k + 1)
                  {
                    if (*(void *)v142 != v123) {
                      objc_enumerationMutation(v121);
                    }
                    v125 = *(void **)(*((void *)&v141 + 1) + 8 * (void)k);
                    if (objc_opt_respondsToSelector()) {
                      [v125 close];
                    }
                  }
                  id v122 = [v121 countByEnumeratingWithState:&v141 objects:v158 count:16];
                }
                while (v122);
              }

              uint64_t v68 = 0;
              goto LABEL_108;
            }
            warnx("Unable to find any processes matching the supplied process names or pids (try as root?)");
            if (!v77)
            {
              uint64_t v68 = 66;
              goto LABEL_136;
            }
            id v85 = [(FPFootprintArgs *)v77 localizedDescription];
            warnx("%s", (const char *)[v85 UTF8String]);

            uint64_t v68 = 66;
          }
          else
          {
            id v84 = [(FPFootprintArgs *)v77 localizedDescription];
            warnx("%s", (const char *)[v84 UTF8String]);

            sub_1000106A8();
            id v72 = 0;
            uint64_t v68 = 64;
          }
          id v43 = v77;
          goto LABEL_135;
        }
        id v75 = sub_100015324([FPOutputFormatterJSON alloc], (void *)v67[4].i64[1]);

        if (v75)
        {
          [v140 addObject:v75];
          goto LABEL_115;
        }
        warnx("Unable to create JSON output");
LABEL_131:
        id v72 = 0;
        int v76 = 0;
        uint64_t v68 = 73;
LABEL_135:

LABEL_136:
        v86 = (void *)v67[4].i64[1];
        if (v86) {
          unlink((const char *)[v86 UTF8String]);
        }
        v87 = (void *)v67[5].i64[0];
        if (v87) {
          unlink((const char *)[v87 UTF8String]);
        }
LABEL_108:

        return v68;
    }
  }
}

void sub_100010598(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
}

size_t sub_1000106A8()
{
  fwrite("Gather memory information about a process or set of processes\nUsage: footprint [args] [proc/pid/memgraph [proc/pid/memgraph [...]]]\n    -a, --all                             target all processes\n    -j, --json <file>                     print json output to a file\n    -h, --help                            print this output\n    -p, --proc, --pid [proc/pid]          target pid or process (or interpret for -p)\n    -x, --exclude [proc/pid]              exclude pid or process\n    -s, --skip                            skip processes that are idle-exit clean\n    --minFootprint <MiB>                  skip processes with footprint less than the provided minimum\n    --forkCorpse                          analyze a forked corpse of the target process (not compatible with --all)\n    -v                                    print all regions and vmmap-like output of address space layout (default output is a summary)\n    -f, --format (bytes|formatted|pages)  change size formatting preference (default: formatted)\n", 0x3F2uLL, 1uLL, __stdoutp);
  v0 = __stdoutp;
  id v1 = [@"Dirty" lowercaseString];
  fprintf(v0, "    --sort <column>                       change the column used for sorting (default: %s)\n", (const char *)[v1 UTF8String]);

  fwrite("    -w, --wide                            show wide output with all columns and full paths (implies --swapped --wired)\n    --swapped                             show swapped/compressed column\n    --wired                               show wired column\n    --vmObjectDirty                       interpret dirty memory as viewed by VM objects in the kernel\n    --unmapped                            search all processes for unmapped memory owned by the target processes\n    --sample <interval>                   repeatedly gather footprint at the given sampling interval in seconds (can be fractional — e.g. 0.5)\n    --sample-duration <duration>          how long to sample in seconds (default and 0 is unlimited)\n    --noCategories                        exclude categories\n", 0x307uLL, 1uLL, __stdoutp);
  size_t result = os_variant_has_internal_content();
  if (result)
  {
    fwrite("\nAppleInternal:\n", 0x10uLL, 1uLL, __stdoutp);
    fwrite("    --perfdata <file.pdj>                 print perfdata(1) output to a file\n", 0x4DuLL, 1uLL, __stdoutp);
    fwrite("    --layout (v|h)                        layout style for text formatter v:vertical h:horizontal (default: v)\n", 0x6FuLL, 1uLL, __stdoutp);
    size_t result = sub_100014998();
    if (result)
    {
      id v3 = __stdoutp;
      return fwrite("    --ioaccel                             print IOAccelMemory region descriptions, implies -v\n", 0x5EuLL, 1uLL, v3);
    }
  }
  return result;
}

void sub_1000107E4(id a1)
{
  v2.rlim_cur = 0;
  v2.rlim_t rlim_max = 0;
  getrlimit(8, &v2);
  rlim_t rlim_max = 16 * v2.rlim_cur;
  if (16 * v2.rlim_cur >= v2.rlim_max) {
    rlim_t rlim_max = v2.rlim_max;
  }
  v2.rlim_cur = rlim_max;
  setrlimit(8, &v2);
}

size_t sub_100010830(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    *(unsigned char *)(v1 + 96) = 1;
  }
  return fwrite("Exiting early due to SIGINT\n", 0x1CuLL, 1uLL, __stderrp);
}

void sub_100010860(uint64_t a1, uint64_t a2)
{
}

void sub_10001086C(uint64_t a1)
{
}

uint64_t sub_100010874(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100010884(uint64_t a1)
{
}

void sub_10001088C(uint64_t a1)
{
  __uint64_t v2 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW_APPROX);
  if (dispatch_source_get_data(*(dispatch_source_t *)(a1 + 32)) >= 2)
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
    if (*(unsigned char *)(v3 + 24))
    {
      *(unsigned char *)(v3 + 24) = 0;
    }
    else
    {
      __uint64_t v4 = v2 - *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
      uint64_t v5 = *(void *)(*(void *)(a1 + 80) + 8);
      __uint64_t v6 = *(void *)(v5 + 24);
      BOOL v7 = v4 > v6;
      unint64_t v8 = v4 - v6;
      if (v7)
      {
        *(void *)(v5 + 24) = v6 + (unint64_t)((double)v8 * 1.1);
        warnx("WARNING: Unable to keep up with sampling interval. Increasing interval to %.3gs.", (double)*(unint64_t *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) / 1000000000.0);
        uint64_t v35 = *(NSObject **)(a1 + 32);
        dispatch_time_t v36 = dispatch_time(0, *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24));
        dispatch_source_set_timer(v35, v36, *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24), *(void *)(a1 + 112));
      }
    }
  }
  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v2;
  unint64_t v9 = *(void **)(a1 + 40);
  id v10 = *(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
  if (v9)
  {
    unint64_t v9 = sub_10000DB94((uint64_t)v9, 0);
    if (v9)
    {
      if ([v10 count])
      {
        uint64_t v37 = a1;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        id v11 = v10;
        id v12 = [v11 countByEnumeratingWithState:&v43 objects:v47 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v44;
          do
          {
            for (unint64_t i = 0; i != v13; unint64_t i = (char *)i + 1)
            {
              if (*(void *)v44 != v14) {
                objc_enumerationMutation(v11);
              }
              int v16 = *(void **)(*((void *)&v43 + 1) + 8 * i);
              if (objc_opt_respondsToSelector())
              {
                double v17 = [v16 asNumber];
                double v18 = [v9 objectForKey:v17];

                if (v18)
                {
                  id v19 = [v18 physFootprint];
                  if (v19 == [v16 physFootprint])
                  {
                    uint64_t v20 = [v16 asNumber];
                    [v9 setObject:v16 forKey:v20];
                  }
                }
              }
            }
            id v13 = [v11 countByEnumeratingWithState:&v43 objects:v47 count:16];
          }
          while (v13);
        }

        a1 = v37;
      }
    }
  }

  uint64_t v21 = *(void *)(*(void *)(a1 + 88) + 8);
  uint64_t v22 = *(void **)(v21 + 40);
  *(void *)(v21 + 40) = v9;

  uint64_t v23 = *(void *)(*(void *)(a1 + 96) + 8);
  int v24 = *(void **)(v23 + 40);
  *(void *)(v23 + 40) = 0;

  id v25 = [FPFootprint alloc];
  uint64_t v26 = NSAllMapTableValues(*(NSMapTable **)(*(void *)(*(void *)(a1 + 88) + 8) + 40));
  id v27 = sub_100011544((id *)&v25->super.isa, v26);

  if (v27) {
    *((_DWORD *)v27 + 25) = 25;
  }
  uint64_t v28 = *(void *)(a1 + 40);
  if (v28) {
    uint64_t v29 = *(void *)(v28 + 32);
  }
  else {
    uint64_t v29 = 0;
  }
  objc_storeWeak((id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40), v27);
  char v31 = sub_1000116DC((uint64_t)v27, v29);
  if ((v31 & 1) == 0)
  {
    uint64_t v32 = *(NSObject **)(a1 + 48);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100010CAC;
    block[3] = &unk_100029B78;
    id v33 = v27;
    uint64_t v39 = v33;
    id v40 = *(id *)(a1 + 56);
    uint64_t v42 = v29;
    id v41 = *(id *)(a1 + 40);
    dispatch_async(v32, block);
    if (v27) {
      id v34 = v33[1];
    }
    else {
      id v34 = 0;
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40), v34);
  }
}

void sub_100010CAC(uint64_t a1)
{
  sub_10001196C(*(void *)(a1 + 32));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = *(id *)(a1 + 40);
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (unint64_t i = 0; i != v6; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(a1 + 32);
        if (v9) {
          [*(id *)(v9 + 88) addObject:*(void *)(*((void *)&v12 + 1) + 8 * i) (void)v12];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  uint64_t v10 = *(void *)(a1 + 48);
  if (v10) {
    BOOL v11 = *(unsigned __int8 *)(v10 + 15) != 0;
  }
  else {
    BOOL v11 = 0;
  }
  sub_1000125AC(*(void *)(a1 + 32), (*(void *)(a1 + 56) >> 1) & 1, *(unsigned char *)(a1 + 56) & 1, v11);
}

intptr_t sub_100010E04(intptr_t result)
{
  char v1 = 0;
  atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)(*(void *)(*(void *)(result + 56) + 8) + 40), (unsigned __int8 *)&v1, 1u, memory_order_relaxed, memory_order_relaxed);
  if (!v1)
  {
    intptr_t v2 = result;
    dispatch_source_cancel(*(dispatch_source_t *)(result + 32));
    WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(v2 + 64) + 8) + 40));
    if (WeakRetained) {
      WeakRetained[96] = 1;
    }

    fwrite("\nStopping...\n", 0xDuLL, 1uLL, __stderrp);
    dispatch_sync(*(dispatch_queue_t *)(v2 + 40), &stru_100029BC0);
    id v4 = *(NSObject **)(v2 + 48);
    return dispatch_semaphore_signal(v4);
  }
  return result;
}

id sub_100010EC4(void *a1, uint64_t a2)
{
  if (!a1) {
    return 0;
  }
  uint64_t v38 = 0;
  uint64_t v39 = &v38;
  uint64_t v40 = 0x2020000000;
  int v41 = -1;
  uint64_t v34 = 0;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x2020000000;
  int v37 = -1;
  uint64_t v30 = 0;
  char v31 = &v30;
  uint64_t v32 = 0x2020000000;
  int v33 = 0;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = sub_100011208;
  uint64_t v28 = sub_100011218;
  id v29 = 0;
  memset(v42, 0, sizeof(v42));
  long long v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  int v16 = sub_100011220;
  double v17 = &unk_100029C30;
  id v19 = &v38;
  uint64_t v20 = &v34;
  uint64_t v22 = &v24;
  uint64_t v23 = v42;
  uint64_t v21 = &v30;
  id v3 = a1;
  id v18 = v3;
  if (sub_100007A44(a2, &v14))
  {
    uint64_t v4 = *((unsigned int *)v39 + 6);
    uint64_t v5 = *((unsigned int *)v35 + 6);
    unsigned int v6 = *((_DWORD *)v31 + 6);
    id v7 = (id)v25[5];
    mach_error_t v8 = mach_port_mod_refs(mach_task_self_, a2, 0, 1);
    if (v8)
    {
      mach_error("initWithCorpse:mach_port_mod_refs", v8);
    }
    else
    {
      *((_DWORD *)v3 + 24) = a2;
      uint64_t v44 = 0;
      memset(v43, 0, sizeof(v43));
      HIDWORD(v43[0]) = v4;
      LODWORD(v43[0]) = v6 & 0x4000 | (v6 >> 9) & 1 | (16 * ((v6 >> 2) & 1)) & 0xFFFFDF7F | (((v6 >> 1) & 1) << 7) & 0xFFFFDFFF | HIWORD(v6) & 0x100 | (((v6 >> 8) & 1) << 13);
      *((unsigned char *)v3 + 13) = (v6 & 0x20000) != 0;
      id v11 = [v3 initWithBsdInfo:v43];
      long long v12 = v11;
      if (v11)
      {
        [v11 setName:v7];
        long long v13 = +[NSString stringWithFormat:@"%@ [%d] (corpse)", v7, v4, v14, v15, v16, v17];
        [v12 setDisplayString:v13];

        [v12 _setIdleExitStatusFromDirtyFlags:v5];
        [v12 addLedgerData:v42 count:4];
        id v3 = v12;
        id v9 = v3;
        goto LABEL_7;
      }
    }
    id v3 = 0;
  }
  id v9 = 0;
LABEL_7:

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);

  return v9;
}

void sub_1000111C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

uint64_t sub_100011208(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100011218(uint64_t a1)
{
}

void sub_100011220(void *a1, int *a2)
{
  int v3 = *a2;
  if ((*a2 & 0xFFFFFFF0) == 0x20) {
    int v3 = 17;
  }
  if (v3 <= 2084)
  {
    if (v3 > 2068)
    {
      if (v3 == 2069)
      {
        int v8 = a2[4];
        uint64_t v9 = a1[7];
      }
      else
      {
        if (v3 != 2073) {
          return;
        }
        int v8 = a2[4];
        uint64_t v9 = a1[6];
      }
    }
    else
    {
      if (v3 != 2053)
      {
        if (v3 == 2063)
        {
          __strlcpy_chk();
          id v4 = [objc_alloc((Class)NSString) initWithUTF8String:v10];
          uint64_t v5 = [v4 lastPathComponent];
          uint64_t v6 = *(void *)(a1[8] + 8);
          id v7 = *(void **)(v6 + 40);
          *(void *)(v6 + 40) = v5;
        }
        return;
      }
      int v8 = a2[4];
      uint64_t v9 = a1[5];
    }
    *(_DWORD *)(*(void *)(v9 + 8) + 24) = v8;
    return;
  }
  if (v3 > 2086)
  {
    if (v3 == 2087)
    {
      *(void *)(a1[9] + 16) = *((void *)a2 + 2);
    }
    else if (v3 == 2101)
    {
      *(_DWORD *)(a1[4] + 20) = a2[4];
    }
  }
  else if (v3 == 2085)
  {
    *(void *)a1[9] = *((void *)a2 + 2);
  }
  else
  {
    *(void *)(a1[9] + _Block_object_dispose(&STACK[0x2B0], 8) = *((void *)a2 + 2);
  }
}

BOOL sub_1000113C4()
{
  self;
  int v0 = byte_100034848;
  if (byte_100034848 == 2)
  {
    int v3 = 0;
    size_t v2 = 4;
    if (sysctlbyname("vm.self_region_footprint", &v3, &v2, 0, 0) && *__error() != 2)
    {
      perror("Unable to retrieve status of physical footprint data collection");
      int v3 = 0;
    }
    int v0 = v3 != 0;
    byte_100034848 = v3 != 0;
  }
  return v0 == 1;
}

void sub_100011464(uint64_t a1, int a2)
{
  self;
  int v3 = a2;
  if (sysctlbyname("vm.self_region_footprint", 0, 0, &v3, 4uLL) && *__error() != 2) {
    perror("Unable to configure physical footprint data collection");
  }
  byte_100034848 = 2;
}

void sub_1000114E0(uint64_t a1, int a2)
{
  int v2 = a2;
  self;
  if (sysctlbyname("vm.self_region_info_flags", 0, 0, &v2, 4uLL))
  {
    if (*__error() != 2) {
      perror("Unable to configure VM region info flags");
    }
  }
}

id *sub_100011544(id *a1, void *a2)
{
  id v4 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)FPFootprint;
    uint64_t v5 = (id *)[super init];
    a1 = v5;
    if (v5)
    {
      objc_storeStrong(v5 + 1, a2);
      *((unsigned char *)a1 + 96) = 0;
      id v6 = objc_alloc_init((Class)NSMutableArray);
      id v7 = a1[11];
      a1[11] = v6;

      *((_DWORD *)a1 + 25) = 17;
      *((_DWORD *)a1 + _Block_object_dispose(&STACK[0x2B0], 8) = 0;
      *((_DWORD *)a1 + 12) = 0;
    }
  }

  return a1;
}

NSObject *sub_10001165C(uint64_t a1, void *a2)
{
  id v2 = a2;
  self;
  int v3 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 2uLL, 0, 0);
  dispatch_source_set_event_handler(v3, v2);

  signal(2, (void (__cdecl *)(int))1);
  dispatch_resume(v3);

  return v3;
}

uint64_t sub_1000116DC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1;
  if (a1)
  {
    id v4 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v5 = dispatch_queue_attr_make_with_qos_class(v4, *(dispatch_qos_class_t *)(v2 + 100), 0);

    id v6 = dispatch_queue_create("com.apple.footprint.gatherdata", v5);
    id v7 = *(id *)(v2 + 8);
    self;
    int v8 = [v7 sortedArrayUsingComparator:&stru_100029CF0];

    uint64_t v9 = sub_100018B78();
    uint64_t v10 = *(void **)(v2 + 104);
    *(void *)(v2 + 104) = v9;

    uint64_t v25 = 0;
    uint64_t v26 = &v25;
    uint64_t v27 = 0x2020000000;
    char v28 = 0;
    id v11 = [v8 count];
    double v17 = _NSConcreteStackBlock;
    uint64_t v18 = 3221225472;
    id v19 = sub_1000118E4;
    uint64_t v20 = &unk_100029C58;
    uint64_t v21 = v2;
    uint64_t v23 = &v25;
    id v12 = v8;
    id v22 = v12;
    uint64_t v24 = a2;
    dispatch_apply((size_t)v11, v6, &v17);
    if (*((unsigned char *)v26 + 24))
    {
      long long v13 = [v12 lastObject:v17, v18, v19, v20, v21];
      [v13 _addGlobalError:@"Footprint exited early due to SIGINT and did not finish gathering all data"];
    }
    uint64_t v14 = sub_100018B78();
    uint64_t v15 = *(void **)(v2 + 112);
    *(void *)(v2 + 112) = v14;

    uint64_t v2 = *((unsigned char *)v26 + 24) != 0;
    _Block_object_dispose(&v25, 8);
  }
  return v2;
}

void sub_1000118CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000118E4(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 96))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    id v3 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a2];
    [v3 gatherData:*(void *)(a1 + 56) extendedInfoProvider:*(void *)(a1 + 32)];
  }
}

void sub_10001196C(uint64_t a1)
{
  if (!a1) {
    return;
  }
  uint64_t v1 = a1;
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  id v3 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = v2;

  *(void *)(v1 + 56) = CFDictionaryCreateMutable(kCFAllocatorDefault, 100 * (void)[*(id *)(v1 + 8) count], (const CFDictionaryKeyCallBacks *)&unk_100029C78, &kCFTypeDictionaryValueCallBacks);
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v5 = *(void **)(v1 + 64);
  *(void *)(v1 + 64) = v4;

  *(void *)(v1 + 72) = CFDictionaryCreateMutable(kCFAllocatorDefault, 2 * (void)[*(id *)(v1 + 8) count], (const CFDictionaryKeyCallBacks *)&unk_100029C78, &kCFTypeDictionaryValueCallBacks);
  *(void *)(v1 + 80) = CFDictionaryCreateMutable(kCFAllocatorDefault, 2 * (void)[*(id *)(v1 + 8) count], (const CFDictionaryKeyCallBacks *)&unk_100029C78, &kCFTypeDictionaryValueCallBacks);
  long long v104 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  id obj = *(id *)(v1 + 8);
  uint64_t v101 = v1;
  id v86 = [obj countByEnumeratingWithState:&v104 objects:v120 count:16];
  if (!v86) {
    goto LABEL_72;
  }
  uint64_t v87 = *(void *)v105;
  do
  {
    uint64_t v6 = 0;
    do
    {
      if (*(void *)v105 != v87) {
        objc_enumerationMutation(obj);
      }
      id v7 = *(id *)(*((void *)&v104 + 1) + 8 * v6);
      BOOL v98 = sub_1000113C4();
      id v90 = [v7 pageSize];
      vm_size_t v89 = vm_kernel_page_size;
      v94 = v7;
      uint64_t v8 = [v7 sharedCache];
      uint64_t v9 = (id *)v8;
      uint64_t v88 = v6;
      if (v8)
      {
        uint64_t v10 = *(void **)(v1 + 64);
        uint64_t v91 = *(void *)(v8 + 24);
        id v11 = *(id *)(v8 + 16);
        id v12 = [v10 objectForKeyedSubscript:v11];

        CFDictionaryRef context = (const __CFDictionary *)v12;
        if (!v12)
        {
          CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, (const CFDictionaryKeyCallBacks *)&unk_100029C78, &kCFTypeDictionaryValueCallBacks);
          uint64_t v14 = *(void **)(v1 + 64);
          id v15 = v9[2];
          [v14 setObject:Mutable forKeyedSubscript:v15];

          CFDictionaryRef context = Mutable;
        }
      }
      else
      {
        uint64_t v91 = 0;
        CFDictionaryRef context = 0;
      }
      long long v128 = 0u;
      long long v129 = 0u;
      long long v126 = 0u;
      long long v127 = 0u;
      id v102 = [v94 memoryRegions];
      id v16 = [v102 countByEnumeratingWithState:&v126 objects:v130 count:16];
      if (v16)
      {
        id v17 = v16;
        id v18 = *(id *)v127;
        id v96 = *(id *)v127;
        do
        {
          id v19 = 0;
          do
          {
            if (*(id *)v127 != v18) {
              objc_enumerationMutation(v102);
            }
            uint64_t v20 = *(void *)(*((void *)&v126 + 1) + 8 * (void)v19);
            if (!v20)
            {
              uint64_t v21 = 0;
LABEL_32:
              CFDictionaryRef v23 = *(const __CFDictionary **)(v1 + 56);
              goto LABEL_33;
            }
            if ((*(unsigned char *)(v20 + 8) & 2) == 0)
            {
              uint64_t v21 = *(const void **)(v20 + 96);
              int v22 = *(unsigned __int8 *)(v20 + 9);
              if (v22 == 4)
              {
                CFDictionaryRef v23 = *(const __CFDictionary **)(v1 + 80);
                goto LABEL_33;
              }
              if (v22 == 2)
              {
                CFDictionaryRef v23 = *(const __CFDictionary **)(v1 + 72);
                goto LABEL_33;
              }
              goto LABEL_32;
            }
            if (!v9)
            {
              _os_assert_log();
              _os_crash();
              __break(1u);
            }
            int v24 = *(unsigned __int8 *)(v20 + 9);
            BOOL v25 = v24 == 2 || v24 == 4;
            if (!v25 && (*(void *)(v20 + 16) || *(void *)(v20 + 24))) {
              goto LABEL_35;
            }
            CFDictionaryRef v23 = context;
            uint64_t v21 = (const void *)(*(void *)(v20 + 80) - v91 + 1);
LABEL_33:
            if ((unint64_t)v21 + 1 <= 1)
            {
              if (!v20) {
                goto LABEL_63;
              }
LABEL_35:
              *(void *)(v20 + 64) = v20;
              goto LABEL_63;
            }
            char v26 = !v98;
            if (!v20) {
              char v26 = 1;
            }
            if (v26) {
              int v27 = 0;
            }
            else {
              int v27 = (*(unsigned __int8 *)(v20 + 8) >> 3) & 1;
            }
            char v28 = CFDictionaryGetValue(v23, v21);
            if (!v28)
            {
              if ((v27 & 1) != 0
                || v20
                && (*(unsigned char *)(v20 + 8) & 2) == 0
                && ((v30 = *(unsigned __int8 *)(v20 + 10), v31 = v30 > 6, int v32 = (1 << v30) & 0x4C, !v31)
                  ? (BOOL v33 = v32 == 0)
                  : (BOOL v33 = 1),
                    v33 && *(unsigned __int8 *)(v20 + 9) - 5 < 0xFFFFFFFD)
                || v90 != (id)v89)
              {
                id v29 = objc_alloc_init(FPMemoryObject);
              }
              else
              {
                id v29 = (FPMemoryObject *)(id)v20;
              }
              char v28 = v29;
              CFDictionaryAddValue(v23, v21, v29);
            }
            id v34 = (id)v20;
            if (v28 != (void *)v20)
            {
              uint64_t v35 = [v28 ensureMemoryObject];
              uint64_t v36 = v35;
              if (v35 == v28)
              {
                id v34 = v28;
              }
              else
              {
                id v34 = v35;

                CFDictionaryReplaceValue(v23, v21, v34);
              }
              sub_100005610((uint64_t)v36, (void *)v20, v94);
              if (v27) {
                [v36 setOwnerPid:[v94 pid]];
              }

              uint64_t v1 = v101;
            }
            if (v20) {
              *(void *)(v20 + 64) = v34;
            }

            id v18 = v96;
LABEL_63:
            id v19 = (char *)v19 + 1;
          }
          while (v17 != v19);
          id v37 = [v102 countByEnumeratingWithState:&v126 objects:v130 count:16];
          id v17 = v37;
        }
        while (v37);
      }

      uint64_t v6 = v88 + 1;
    }
    while ((id)(v88 + 1) != v86);
    id v38 = [obj countByEnumeratingWithState:&v104 objects:v120 count:16];
    id v86 = v38;
  }
  while (v38);
LABEL_72:

  uint64_t v39 = *(void *)(v1 + 72);
  uint64_t v40 = *(void *)(v1 + 80);
  v125[0] = *(void *)(v1 + 56);
  v125[1] = v39;
  v125[2] = v40;
  int v41 = +[NSArray arrayWithObjects:v125 count:3];
  id v42 = [v41 mutableCopy];

  long long v118 = 0u;
  long long v119 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  long long v43 = [*(id *)(v1 + 64) objectEnumerator];
  id v44 = [v43 countByEnumeratingWithState:&v116 objects:v130 count:16];
  if (v44)
  {
    id v45 = v44;
    uint64_t v46 = *(void *)v117;
    do
    {
      for (unint64_t i = 0; i != v45; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v117 != v46) {
          objc_enumerationMutation(v43);
        }
        [v42 addObject:*(void *)(*((void *)&v116 + 1) + 8 * i)];
      }
      id v45 = [v43 countByEnumeratingWithState:&v116 objects:v130 count:16];
    }
    while (v45);
  }

  long long v114 = 0u;
  long long v115 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  id v99 = v42;
  id v48 = [v99 countByEnumeratingWithState:&v112 objects:&v126 count:16];
  if (v48)
  {
    id v49 = v48;
    id v103 = *(id *)v113;
    do
    {
      for (j = 0; j != v49; j = (char *)j + 1)
      {
        if (*(id *)v113 != v103) {
          objc_enumerationMutation(v99);
        }
        unint64_t v51 = *(void **)(*((void *)&v112 + 1) + 8 * (void)j);
        unint64_t v52 = CFArrayCreateMutable(kCFAllocatorDefault, 0, 0);
        long long v108 = 0u;
        long long v109 = 0u;
        long long v110 = 0u;
        long long v111 = 0u;
        id v54 = v51;
        id v55 = [v54 countByEnumeratingWithState:&v108 objects:&v121 count:16];
        if (v55)
        {
          id v56 = v55;
          uint64_t v57 = *(void *)v109;
          do
          {
            for (k = 0; k != v56; k = (char *)k + 1)
            {
              if (*(void *)v109 != v57) {
                objc_enumerationMutation(v54);
              }
              uint64_t v59 = *(const void **)(*((void *)&v108 + 1) + 8 * (void)k);
              uint64_t v60 = CFDictionaryGetValue((CFDictionaryRef)v54, v59);
              if (([v60 finalizeObject] & 1) == 0) {
                CFArrayAppendValue(v52, v59);
              }
            }
            id v56 = [v54 countByEnumeratingWithState:&v108 objects:&v121 count:16];
          }
          while (v56);
        }

        [v54 removeObjectsForKeys:v52];
        if (v52) {
          CFRelease(v52);
        }
        uint64_t v1 = v101;
      }
      id v49 = [v99 countByEnumeratingWithState:&v112 objects:&v126 count:16];
    }
    while (v49);
  }

  [*(id *)(v1 + 16) removeAllObjects];
  long long v118 = 0u;
  long long v119 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  sub_10001410C(v1);
  id v97 = (id)objc_claimAutoreleasedReturnValue();
  id v100 = [v97 countByEnumeratingWithState:&v116 objects:&v126 count:16];
  if (v100)
  {
    uint64_t v61 = *(void *)v117;
    uint64_t v95 = *(void *)v117;
    do
    {
      for (m = 0; m != v100; m = (char *)m + 1)
      {
        if (*(void *)v117 != v61) {
          objc_enumerationMutation(v97);
        }
        id v63 = *(id *)(*((void *)&v116 + 1) + 8 * (void)m);
        if (sub_1000113C4())
        {
          long long v123 = 0u;
          long long v124 = 0u;
          long long v121 = 0u;
          long long v122 = 0u;
          id v64 = [v63 memoryRegions];
          id v65 = [v64 countByEnumeratingWithState:&v121 objects:v130 count:16];
          if (v65)
          {
            id v66 = v65;
            uint64_t v67 = 0;
            uint64_t v68 = *(void *)v122;
            do
            {
              for (n = 0; n != v66; n = (char *)n + 1)
              {
                if (*(void *)v122 != v68) {
                  objc_enumerationMutation(v64);
                }
                id v70 = *(void **)(*((void *)&v121 + 1) + 8 * (void)n);
                id v71 = [v70 dirtySize];
                v67 += (uint64_t)[v70 swappedSize] + (void)v71;
              }
              id v66 = [v64 countByEnumeratingWithState:&v121 objects:v130 count:16];
            }
            while (v66);
          }
          else
          {
            uint64_t v67 = 0;
          }
        }
        else
        {
          id v72 = objc_alloc((Class)NSMutableSet);
          uint64_t v73 = [v63 memoryRegions];
          id v64 = [v72 initWithCapacity:[v73 count]];

          long long v123 = 0u;
          long long v124 = 0u;
          long long v121 = 0u;
          long long v122 = 0u;
          CFStringRef v74 = [v63 memoryRegions];
          id v75 = [v74 countByEnumeratingWithState:&v121 objects:v130 count:16];
          if (v75)
          {
            id v76 = v75;
            uint64_t v67 = 0;
            uint64_t v77 = *(void *)v122;
            do
            {
              for (iunint64_t i = 0; ii != v76; iunint64_t i = (char *)ii + 1)
              {
                if (*(void *)v122 != v77) {
                  objc_enumerationMutation(v74);
                }
                BOOL v79 = *(void **)(*((void *)&v121 + 1) + 8 * (void)ii);
                if (v79) {
                  BOOL v79 = (void *)v79[8];
                }
                id v80 = v79;
                if (([v64 containsObject:v80] & 1) == 0)
                {
                  id v81 = [v80 dirtySize];
                  v67 += (uint64_t)[v80 swappedSize] + (void)v81;
                  [v64 addObject:v80];
                }
              }
              id v76 = [v74 countByEnumeratingWithState:&v121 objects:v130 count:16];
            }
            while (v76);
          }
          else
          {
            uint64_t v67 = 0;
          }

          uint64_t v61 = v95;
        }

        unsigned __int8 v82 = +[NSNumber numberWithUnsignedLongLong:v67];
        uint64_t v83 = *(void **)(v101 + 16);
        id v84 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v63 pid]);
        [v83 setObject:v82 forKeyedSubscript:v84];
      }
      id v100 = [v97 countByEnumeratingWithState:&v116 objects:&v126 count:16];
    }
    while (v100);
  }
}

void sub_100012408(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  self;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  *(_OWORD *)(a3 + 32) = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 objectEnumerator];
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(id *)(*((void *)&v12 + 1) + 8 * (void)v9);
        *(void *)a3 += [v10 totalDirtySize];
        *(void *)(a3 + 8) += [v10 totalSwappedSize];
        *(void *)(a3 + 16) += [v10 totalCleanSize];
        *(void *)(a3 + 24) += [v10 totalReclaimableSize];
        *(void *)(a3 + 32) += [v10 totalWiredSize];
        unsigned int v11 = [v10 totalRegions];

        *(_DWORD *)(a3 + 40) += v11;
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

void sub_1000125AC(uint64_t a1, int a2, char a3, int a4)
{
  if (a1)
  {
    uint64_t v5 = a1;
    id v6 = sub_10001410C(a1);
    *(void *)&long long v374 = _NSConcreteStackBlock;
    *((void *)&v374 + 1) = 3221225472;
    *(void *)&long long v375 = sub_100014574;
    *((void *)&v375 + 1) = &unk_100029D18;
    *(void *)&long long v376 = v5;
    id v7 = [v6 sortedArrayUsingComparator:&v374];

    long long v311 = 0u;
    long long v312 = 0u;
    long long v309 = 0u;
    long long v310 = 0u;
    id v8 = *(id *)(v5 + 88);
    id v9 = [v8 countByEnumeratingWithState:&v309 objects:v356 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v310;
      do
      {
        for (unint64_t i = 0; i != v10; unint64_t i = (char *)i + 1)
        {
          if (*(void *)v310 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v13 = *(void **)(*((void *)&v309 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v13 startAtTime:*(void *)(v5 + 104)];
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v309 objects:v356 count:16];
      }
      while (v10);
    }

    uint64_t v239 = v5;
    if (a2)
    {
      id v240 = v7;
      int v256 = objc_opt_new();
      long long v365 = 0u;
      long long v366 = 0u;
      long long v367 = 0u;
      long long v368 = 0u;
      id v14 = *(id *)(v5 + 88);
      id v15 = [v14 countByEnumeratingWithState:&v365 objects:&v374 count:16];
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = *(void *)v366;
        do
        {
          for (j = 0; j != v16; j = (char *)j + 1)
          {
            if (*(void *)v366 != v17) {
              objc_enumerationMutation(v14);
            }
            uint64_t v19 = *(void *)(*((void *)&v365 + 1) + 8 * (void)j);
            if (objc_opt_respondsToSelector()) {
              [v256 addObject:v19];
            }
          }
          id v16 = [v14 countByEnumeratingWithState:&v365 objects:&v374 count:16];
        }
        while (v16);
      }

      if ([v256 count])
      {
        int v226 = v7;
        long long v364 = 0u;
        long long v363 = 0u;
        long long v362 = 0u;
        long long v361 = 0u;
        id obj = v240;
        id v20 = [obj countByEnumeratingWithState:&v361 objects:v373 count:16];
        if (v20)
        {
          id v21 = v20;
          v249 = *(void **)v362;
          do
          {
            for (k = 0; k != v21; k = (char *)k + 1)
            {
              if (*(void **)v362 != v249) {
                objc_enumerationMutation(obj);
              }
              CFDictionaryRef v23 = *(void **)(*((void *)&v361 + 1) + 8 * (void)k);
              long long v357 = 0u;
              long long v358 = 0u;
              long long v359 = 0u;
              long long v360 = 0u;
              id v24 = v256;
              id v25 = [v24 countByEnumeratingWithState:&v357 objects:&v369 count:16];
              if (v25)
              {
                id v26 = v25;
                uint64_t v27 = *(void *)v358;
                do
                {
                  for (m = 0; m != v26; m = (char *)m + 1)
                  {
                    if (*(void *)v358 != v27) {
                      objc_enumerationMutation(v24);
                    }
                    id v29 = *(void **)(*((void *)&v357 + 1) + 8 * (void)m);
                    BOOL v31 = [v23 memoryRegions];
                    [v29 printVmmapLikeOutputForProcess:v23 regions:v31];
                  }
                  id v26 = [v24 countByEnumeratingWithState:&v357 objects:&v369 count:16];
                }
                while (v26);
              }
            }
            id v21 = [obj countByEnumeratingWithState:&v361 objects:v373 count:16];
          }
          while (v21);
        }

        uint64_t v5 = v239;
        id v7 = v226;
      }
    }
    v225 = objc_opt_new();
    int v224 = objc_opt_new();
    int v216 = 0;
    if ((unint64_t)[v7 count] >= 2 && (a4 & 1) == 0)
    {
      id v32 = objc_alloc_init((Class)NSMutableDictionary);
      long long v369 = 0u;
      long long v370 = 0u;
      long long v371 = 0u;
      long long v372 = 0u;
      id v33 = *(id *)(v5 + 8);
      id v34 = [v33 countByEnumeratingWithState:&v369 objects:&v374 count:16];
      if (v34)
      {
        id v35 = v34;
        uint64_t v36 = *(void *)v370;
        do
        {
          for (n = 0; n != v35; n = (char *)n + 1)
          {
            if (*(void *)v370 != v36) {
              objc_enumerationMutation(v33);
            }
            id v38 = *(void **)(*((void *)&v369 + 1) + 8 * (void)n);
            uint64_t v39 = [v38 sharedCache];
            if (v39)
            {
              id v40 = [v32 objectForKeyedSubscript:v39];
              if (!v40)
              {
                id v40 = [[FPProcessGroupMinimal alloc] initUniqueProcessGroup];
                [v32 setObject:v40 forKeyedSubscript:v39];
              }
              [v40 addProcess:v38];
            }
          }
          id v35 = [v33 countByEnumeratingWithState:&v369 objects:&v374 count:16];
        }
        while (v35);
      }

      id v41 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:objc_msgSend(v32, "count")];
      long long v365 = 0u;
      long long v366 = 0u;
      long long v367 = 0u;
      long long v368 = 0u;
      id v42 = v32;
      id v43 = [v42 countByEnumeratingWithState:&v365 objects:v373 count:16];
      if (v43)
      {
        id v44 = v43;
        uint64_t v45 = *(void *)v366;
        do
        {
          for (iunint64_t i = 0; ii != v44; iunint64_t i = (char *)ii + 1)
          {
            if (*(void *)v366 != v45) {
              objc_enumerationMutation(v42);
            }
            uint64_t v47 = *(void *)(*((void *)&v365 + 1) + 8 * (void)ii);
            id v48 = [v42 objectForKeyedSubscript:v47];
            id v49 = sub_10001862C((uint64_t)v48);
            [v41 setObject:v49 forKeyedSubscript:v47];
          }
          id v44 = [v42 countByEnumeratingWithState:&v365 objects:v373 count:16];
        }
        while (v44);
      }
      int v216 = v41;

      uint64_t v5 = v239;
    }
    if (a4)
    {
      id v217 = 0;
    }
    else
    {
      id v241 = v216;
      long long v50 = +[NSMutableDictionary dictionary];
      unint64_t v51 = sub_10001410C(v5);
      id v257 = [objc_alloc((Class)NSMutableSet) initWithCapacity:objc_msgSend(v51, "count")];
      long long v340 = 0u;
      long long v341 = 0u;
      long long v342 = 0u;
      long long v343 = 0u;
      id v233 = v51;
      id v52 = [v233 countByEnumeratingWithState:&v340 objects:&v374 count:16];
      if (v52)
      {
        id v53 = v52;
        uint64_t v54 = *(void *)v341;
        do
        {
          for (jj = 0; jj != v53; jj = (char *)jj + 1)
          {
            if (*(void *)v341 != v54) {
              objc_enumerationMutation(v233);
            }
            id v56 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [*(id *)(*((void *)&v340 + 1) + 8 * (void)jj) pid]);
            [v257 addObject:v56];
          }
          id v53 = [v233 countByEnumeratingWithState:&v340 objects:&v374 count:16];
        }
        while (v53);
      }
      v227 = v7;

      long long v339 = 0u;
      long long v338 = 0u;
      long long v337 = 0u;
      long long v336 = 0u;
      id obja = *(id *)(v5 + 8);
      id v57 = [obja countByEnumeratingWithState:&v336 objects:v373 count:16];
      if (v57)
      {
        id v58 = v57;
        int v250 = *(void **)v337;
        do
        {
          for (kk = 0; kk != v58; kk = (char *)kk + 1)
          {
            if (*(void **)v337 != v250) {
              objc_enumerationMutation(obja);
            }
            uint64_t v60 = *(void **)(*((void *)&v336 + 1) + 8 * (void)kk);
            unsigned __int8 v61 = [v60 hiddenFromDisplay];
            id v62 = [v60 sharedCache];
            if (v62)
            {
              id v63 = v241;
              id v64 = [v241 objectForKeyedSubscript:v62];
            }
            else
            {
              id v64 = 0;
              id v63 = v241;
            }
            id v65 = [v60 memoryRegions];
            v329[0] = _NSConcreteStackBlock;
            v329[1] = 3221225472;
            v329[2] = sub_100014394;
            v329[3] = &unk_100029CB0;
            unsigned __int8 v335 = v61;
            id v330 = v257;
            id v331 = v63;
            id v332 = v64;
            id v333 = v50;
            v334 = v60;
            id v66 = v64;
            [v65 fp_enumerateObjectsWithBatchSize:256 usingBlock:v329];
          }
          id v58 = [obja countByEnumeratingWithState:&v336 objects:v373 count:16];
        }
        while (v58);
      }

      id v67 = [objc_alloc((Class)NSMutableSet) initWithCapacity:3 * [v257 count]];
      long long v325 = 0u;
      long long v326 = 0u;
      long long v327 = 0u;
      long long v328 = 0u;
      uint64_t v68 = [v50 allKeys];
      id v69 = [v68 countByEnumeratingWithState:&v325 objects:&v369 count:16];
      if (v69)
      {
        id v70 = v69;
        uint64_t v71 = *(void *)v326;
        do
        {
          for (mm = 0; mm != v70; mm = (char *)mm + 1)
          {
            if (*(void *)v326 != v71) {
              objc_enumerationMutation(v68);
            }
            uint64_t v73 = *(void *)(*((void *)&v325 + 1) + 8 * (void)mm);
            CFStringRef v74 = [v50 objectForKeyedSubscript:v73];
            id v75 = [v67 member:v74];
            if (!v75)
            {
              id v75 = sub_10001862C((uint64_t)v74);
              [v67 addObject:v75];
            }
            [v50 setObject:v75 forKeyedSubscript:v73];
          }
          id v70 = [v68 countByEnumeratingWithState:&v325 objects:&v369 count:16];
        }
        while (v70);
      }

      long long v324 = 0u;
      long long v323 = 0u;
      long long v322 = 0u;
      long long v321 = 0u;
      id v76 = v50;
      id v77 = [v76 countByEnumeratingWithState:&v321 objects:&v365 count:16];
      if (v77)
      {
        id v78 = v77;
        uint64_t v79 = *(void *)v322;
        do
        {
          for (nn = 0; nn != v78; nn = (char *)nn + 1)
          {
            if (*(void *)v322 != v79) {
              objc_enumerationMutation(v76);
            }
            id v81 = *(void **)(*((void *)&v321 + 1) + 8 * (void)nn);
            unsigned __int8 v82 = [v76 objectForKeyedSubscript:v81];
            uint64_t v83 = [v81 nonretainedObjectValue];
            sub_100018858((uint64_t)v82, v83);
          }
          id v78 = [v76 countByEnumeratingWithState:&v321 objects:&v365 count:16];
        }
        while (v78);
      }

      id v84 = +[NSMutableDictionary dictionary];
      long long v317 = 0u;
      long long v318 = 0u;
      long long v319 = 0u;
      long long v320 = 0u;
      id v230 = v67;
      objb = (char *)[v230 countByEnumeratingWithState:&v317 objects:&v361 count:16];
      if (objb)
      {
        uint64_t v236 = *(void *)v318;
        do
        {
          id v85 = 0;
          do
          {
            if (*(void *)v318 != v236) {
              objc_enumerationMutation(v230);
            }
            uint64_t v251 = v85;
            id v86 = *(void **)(*((void *)&v317 + 1) + 8 * (void)v85);
            uint64_t v87 = [v86 processes];
            id v88 = [v87 count];

            long long v316 = 0u;
            long long v315 = 0u;
            long long v313 = 0u;
            long long v314 = 0u;
            vm_size_t v89 = [v86 processes];
            id v90 = [v89 countByEnumeratingWithState:&v313 objects:&v357 count:16];
            if (v90)
            {
              id v91 = v90;
              uint64_t v92 = *(void *)v314;
              do
              {
                for (i1 = 0; i1 != v91; i1 = (char *)i1 + 1)
                {
                  if (*(void *)v314 != v92) {
                    objc_enumerationMutation(v89);
                  }
                  v94 = *(void **)(*((void *)&v313 + 1) + 8 * (void)i1);
                  uint64_t v95 = [v94 asNumber];
                  id v96 = [v84 objectForKeyedSubscript:v95];

                  if (!v96)
                  {
                    id v96 = objc_alloc_init((Class)NSMutableArray);
                    id v97 = [v94 asNumber];
                    [v84 setObject:v96 forKeyedSubscript:v97];
                  }
                  if (v88 == (id)1) {
                    [v96 insertObject:v86 atIndex:0];
                  }
                  else {
                    [v96 addObject:v86];
                  }
                }
                id v91 = [v89 countByEnumeratingWithState:&v313 objects:&v357 count:16];
              }
              while (v91);
            }

            id v85 = v251 + 1;
          }
          while (v251 + 1 != objb);
          objb = (char *)[v230 countByEnumeratingWithState:&v317 objects:&v361 count:16];
        }
        while (objb);
      }

      id v217 = v84;
      uint64_t v5 = v239;
      BOOL v98 = *(const void **)(v239 + 56);
      if (v98)
      {
        CFRelease(v98);
        *(void *)(v239 + 56) = 0;
      }
      id v99 = *(void **)(v239 + 64);
      *(void *)(v239 + 64) = 0;

      id v100 = *(const void **)(v239 + 72);
      id v7 = v227;
      if (v100)
      {
        CFRelease(v100);
        *(void *)(v239 + 72) = 0;
      }
      uint64_t v101 = *(const void **)(v239 + 80);
      if (v101)
      {
        CFRelease(v101);
        *(void *)(v239 + 80) = 0;
      }
    }
    long long v305 = 0u;
    long long v306 = 0u;
    long long v307 = 0u;
    long long v308 = 0u;
    id v102 = *(id *)(v5 + 88);
    id v103 = [v102 countByEnumeratingWithState:&v305 objects:v355 count:16];
    if (v103)
    {
      id v104 = v103;
      uint64_t v105 = *(void *)v306;
      do
      {
        for (i2 = 0; i2 != v104; i2 = (char *)i2 + 1)
        {
          if (*(void *)v306 != v105) {
            objc_enumerationMutation(v102);
          }
          long long v107 = *(void **)(*((void *)&v305 + 1) + 8 * (void)i2);
          if (objc_opt_respondsToSelector()) {
            [v107 printHeader];
          }
        }
        id v104 = [v102 countByEnumeratingWithState:&v305 objects:v355 count:16];
      }
      while (v104);
    }

    long long v303 = 0u;
    long long v304 = 0u;
    long long v301 = 0u;
    long long v302 = 0u;
    id v218 = v7;
    int v222 = (char *)[v218 countByEnumeratingWithState:&v301 objects:v354 count:16];
    if (v222)
    {
      uint64_t v220 = *(void *)v302;
      uint64_t v223 = &__NSDictionary0__struct;
      do
      {
        long long v109 = 0;
        do
        {
          if (*(void *)v302 != v220) {
            objc_enumerationMutation(v218);
          }
          long long v110 = *(void **)(*((void *)&v301 + 1) + 8 * (void)v109);
          long long v111 = [v110 errors];
          id v258 = [v111 count];

          long long v112 = [v110 warnings];
          id v113 = [v112 count];

          if (v113) {
            [v224 addObject:v110];
          }
          uint64_t v231 = v109;
          if (v258)
          {
            [v225 addObject:v110];
          }
          else
          {
            long long v114 = [v110 auxData];
            long long v115 = v114;
            if (v114)
            {
              uint64_t v116 = [v114 fp_mergeWithData:v223];

              uint64_t v223 = (void *)v116;
            }
          }
          long long v117 = *(void **)(v5 + 16);
          long long v118 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v110 pid]);
          uint64_t v119 = [v117 objectForKeyedSubscript:v118];

          long long v299 = 0u;
          long long v300 = 0u;
          long long v297 = 0u;
          long long v298 = 0u;
          id v120 = *(id *)(v5 + 88);
          id v121 = [v120 countByEnumeratingWithState:&v297 objects:v353 count:16];
          if (v121)
          {
            id v122 = v121;
            uint64_t v123 = *(void *)v298;
            do
            {
              for (i3 = 0; i3 != v122; i3 = (char *)i3 + 1)
              {
                if (*(void *)v298 != v123) {
                  objc_enumerationMutation(v120);
                }
                v125 = *(void **)(*((void *)&v297 + 1) + 8 * (void)i3);
                [v125 printProcessHeader:v110];
                if (!v258) {
                  [v125 printProcessTotal:v119 forProcess:v110];
                }
                [v125 endProcessHeader:v110];
              }
              id v122 = [v120 countByEnumeratingWithState:&v297 objects:v353 count:16];
            }
            while (v122);
          }
          int v228 = (void *)v119;

          if ((a4 & 1) == 0)
          {
            long long v127 = [v110 asNumber];
            long long v128 = [v217 objectForKeyedSubscript:v127];

            if (v128)
            {
              long long v291 = 0uLL;
              long long v292 = 0uLL;
              long long v289 = 0uLL;
              long long v290 = 0uLL;
              v219 = v128;
              id v234 = v128;
              int v242 = (char *)[v234 countByEnumeratingWithState:&v289 objects:v351 count:16];
              if (v242)
              {
                uint64_t v237 = *(void *)v290;
                do
                {
                  long long v129 = 0;
                  do
                  {
                    if (*(void *)v290 != v237) {
                      objc_enumerationMutation(v234);
                    }
                    int v252 = v129;
                    v130 = *(void **)(*((void *)&v289 + 1) + 8 * (void)v129);
                    id v131 = sub_10001898C((uint64_t)v130);
                    long long v375 = 0u;
                    long long v376 = 0u;
                    long long v374 = 0u;
                    v373[0] = 0;
                    if (!v131)
                    {
                      if (v130) {
                        v132 = (void *)v130[4];
                      }
                      else {
                        v132 = 0;
                      }
                      id v133 = v132;
                      v135 = [v133 objectEnumerator];
                      id v131 = sub_100014174(v135, v110, v373, a3);

                      if (!v373[0])
                      {
                        v136 = [v130 processes];
                        id v137 = [v136 count];

                        if ((unint64_t)v137 >= 0x1A)
                        {
                          v138 = [v130 processes];
                          sub_100018900((uint64_t)v130, v131, [v138 count] - 1);
                        }
                      }
                    }
                    if (!v258) {
                      sub_100012408((uint64_t)FPFootprint, v131, (uint64_t)&v374);
                    }
                    long long v285 = 0u;
                    long long v286 = 0u;
                    long long v287 = 0u;
                    long long v288 = 0u;
                    id v139 = *(id *)(v239 + 88);
                    id v140 = [v139 countByEnumeratingWithState:&v285 objects:v350 count:16];
                    if (v140)
                    {
                      id v141 = v140;
                      uint64_t v142 = *(void *)v286;
                      do
                      {
                        for (i4 = 0; i4 != v141; i4 = (char *)i4 + 1)
                        {
                          if (*(void *)v286 != v142) {
                            objc_enumerationMutation(v139);
                          }
                          long long v144 = *(void **)(*((void *)&v285 + 1) + 8 * (void)i4);
                          v145 = [v130 processes];
                          id v146 = [v145 count];

                          if (v146 == (id)1) {
                            [v144 printProcessCategories:v131 total:&v374 forProcess:v110];
                          }
                          else {
                            [v144 printSharedCategories:v131 sharedWith:v130 forProcess:v110 hasProcessView:v373[0] == 2 total:&v374];
                          }
                        }
                        id v141 = [v139 countByEnumeratingWithState:&v285 objects:v350 count:16];
                      }
                      while (v141);
                    }

                    long long v129 = v252 + 1;
                  }
                  while (v252 + 1 != v242);
                  long long v147 = (char *)[v234 countByEnumeratingWithState:&v289 objects:v351 count:16];
                  int v242 = v147;
                }
                while (v147);
              }

              uint64_t v5 = v239;
              long long v128 = v219;
            }
            else
            {
              long long v375 = 0uLL;
              long long v376 = 0uLL;
              long long v374 = 0uLL;
              long long v293 = 0uLL;
              long long v294 = 0uLL;
              long long v295 = 0uLL;
              long long v296 = 0uLL;
              id v148 = *(id *)(v5 + 88);
              id v149 = [v148 countByEnumeratingWithState:&v293 objects:v352 count:16];
              if (v149)
              {
                id v150 = v149;
                uint64_t v151 = *(void *)v294;
                do
                {
                  for (i5 = 0; i5 != v150; i5 = (char *)i5 + 1)
                  {
                    if (*(void *)v294 != v151) {
                      objc_enumerationMutation(v148);
                    }
                    [*(id *)(*((void *)&v293 + 1) + 8 * (void)i5) printProcessCategories:&__NSDictionary0__struct total:&v374 forProcess:v110];
                  }
                  id v150 = [v148 countByEnumeratingWithState:&v293 objects:v352 count:16];
                }
                while (v150);
              }
            }
          }
          long long v281 = 0u;
          long long v282 = 0u;
          long long v283 = 0u;
          long long v284 = 0u;
          id v154 = *(id *)(v5 + 88);
          id v155 = [v154 countByEnumeratingWithState:&v281 objects:v349 count:16];
          if (v155)
          {
            id v156 = v155;
            uint64_t v157 = *(void *)v282;
            do
            {
              for (i6 = 0; i6 != v156; i6 = (char *)i6 + 1)
              {
                if (*(void *)v282 != v157) {
                  objc_enumerationMutation(v154);
                }
                v159 = *(void **)(*((void *)&v281 + 1) + 8 * (void)i6);
                char v160 = [v110 auxData];
                [v159 printProcessAuxData:v160 forProcess:v110];
              }
              id v156 = [v154 countByEnumeratingWithState:&v281 objects:v349 count:16];
            }
            while (v156);
          }

          long long v109 = v231 + 1;
        }
        while (v231 + 1 != v222);
        int v222 = (char *)[v218 countByEnumeratingWithState:&v301 objects:v354 count:16];
      }
      while (v222);
    }
    else
    {
      uint64_t v223 = &__NSDictionary0__struct;
    }

    long long v277 = 0u;
    long long v278 = 0u;
    long long v279 = 0u;
    long long v280 = 0u;
    id objd = v216;
    id v161 = [objd countByEnumeratingWithState:&v277 objects:v348 count:16];
    if (v161)
    {
      id v162 = v161;
      uint64_t v259 = *(void *)v278;
      do
      {
        v163 = 0;
        do
        {
          if (*(void *)v278 != v259) {
            objc_enumerationMutation(objd);
          }
          uint64_t v164 = *(void *)(*((void *)&v277 + 1) + 8 * (void)v163);
          uint64_t v165 = [objd objectForKeyedSubscript:v164];
          unint64_t v166 = (void *)v165;
          if (v165) {
            v167 = *(void **)(v165 + 32);
          }
          else {
            v167 = 0;
          }
          id v168 = v167;
          id v170 = [v168 objectEnumerator];
          v171 = sub_100014174(v170, 0, 0, a3);

          long long v375 = 0u;
          long long v376 = 0u;
          long long v374 = 0u;
          sub_100012408((uint64_t)FPFootprint, v171, (uint64_t)&v374);
          long long v275 = 0u;
          long long v276 = 0u;
          long long v273 = 0u;
          long long v274 = 0u;
          id v172 = *(id *)(v239 + 88);
          id v173 = [v172 countByEnumeratingWithState:&v273 objects:v347 count:16];
          if (v173)
          {
            id v174 = v173;
            uint64_t v175 = *(void *)v274;
            do
            {
              for (i7 = 0; i7 != v174; i7 = (char *)i7 + 1)
              {
                if (*(void *)v274 != v175) {
                  objc_enumerationMutation(v172);
                }
                [*(id *)(*((void *)&v273 + 1) + 8 * (void)i7) printSharedCache:v164 categories:v171 sharedWith:v166 total:&v374];
              }
              id v174 = [v172 countByEnumeratingWithState:&v273 objects:v347 count:16];
            }
            while (v174);
          }

          v163 = (char *)v163 + 1;
        }
        while (v163 != v162);
        id v177 = [objd countByEnumeratingWithState:&v277 objects:v348 count:16];
        id v162 = v177;
      }
      while (v177);
    }

    id v178 = objc_alloc_init((Class)NSMutableArray);
    long long v269 = 0u;
    long long v270 = 0u;
    long long v271 = 0u;
    long long v272 = 0u;
    id v179 = v218;
    id v180 = [v179 countByEnumeratingWithState:&v269 objects:v346 count:16];
    if (v180)
    {
      id v181 = v180;
      uint64_t v182 = *(void *)v270;
      do
      {
        for (i8 = 0; i8 != v181; i8 = (char *)i8 + 1)
        {
          if (*(void *)v270 != v182) {
            objc_enumerationMutation(v179);
          }
          v184 = [*(id *)(*((void *)&v269 + 1) + 8 * (void)i8) globalErrors];
          [v178 addObjectsFromArray:v184];
        }
        id v181 = [v179 countByEnumeratingWithState:&v269 objects:v346 count:16];
      }
      while (v181);
    }
    id v232 = v179;

    long long v265 = 0u;
    long long v266 = 0u;
    long long v267 = 0u;
    long long v268 = 0u;
    id v186 = *(id *)(v239 + 88);
    id v187 = [v186 countByEnumeratingWithState:&v265 objects:v345 count:16];
    if (v187)
    {
      id v188 = v187;
      uint64_t v189 = *(void *)v266;
      do
      {
        for (i9 = 0; i9 != v188; i9 = (char *)i9 + 1)
        {
          if (*(void *)v266 != v189) {
            objc_enumerationMutation(v186);
          }
          [*(id *)(*((void *)&v265 + 1) + 8 * (void)i9) printProcessesWithWarnings:v224 processesWithErrors:v225 globalErrors:v178];
        }
        id v188 = [v186 countByEnumeratingWithState:&v265 objects:v345 count:16];
      }
      while (v188);
    }
    v229 = v178;

    long long v363 = 0u;
    long long v362 = 0u;
    long long v361 = 0u;
    id v191 = objc_alloc_init((Class)NSMutableSet);
    v192 = +[NSMutableDictionary dictionary];
    long long v369 = 0u;
    long long v370 = 0u;
    long long v371 = 0u;
    long long v372 = 0u;
    sub_10001410C(v239);
    id v235 = (id)objc_claimAutoreleasedReturnValue();
    id v243 = [v235 countByEnumeratingWithState:&v369 objects:&v374 count:16];
    if (v243)
    {
      uint64_t v238 = *(void *)v370;
      do
      {
        uint64_t v193 = 0;
        do
        {
          if (*(void *)v370 != v238) {
            objc_enumerationMutation(v235);
          }
          uint64_t v260 = v193;
          v194 = *(void **)(*((void *)&v369 + 1) + 8 * v193);
          long long v365 = 0u;
          long long v366 = 0u;
          long long v367 = 0u;
          long long v368 = 0u;
          unint64_t v195 = [v194 memoryRegions];
          id v196 = [v195 countByEnumeratingWithState:&v365 objects:v373 count:16];
          if (v196)
          {
            id v197 = v196;
            uint64_t v198 = *(void *)v366;
            do
            {
              for (i10 = 0; i10 != v197; i10 = (char *)i10 + 1)
              {
                if (*(void *)v366 != v198) {
                  objc_enumerationMutation(v195);
                }
                int v200 = *(void **)(*((void *)&v365 + 1) + 8 * (void)i10);
                if (v200) {
                  int v200 = (void *)v200[8];
                }
                v201 = v200;
                if (([v191 containsObject:v201] & 1) == 0)
                {
                  [v191 addObject:v201];
                  if (a3) {
                    [v201 name];
                  }
                  else {
                  int v202 = [v201 fullName];
                  }
                  uint64_t v203 = [v192 objectForKeyedSubscript:v202];
                  if (!v203)
                  {
                    double v204 = sub_10001D3CC([FPMemoryCategory alloc], a3);
                    uint64_t v203 = v205;
                    [v192 setObject:v205 forKeyedSubscript:v202];
                  }
                  sub_10001D66C((uint64_t)v203, v201);
                }
              }
              id v197 = [v195 countByEnumeratingWithState:&v365 objects:v373 count:16];
            }
            while (v197);
          }

          uint64_t v193 = v260 + 1;
        }
        while ((id)(v260 + 1) != v243);
        id v243 = [v235 countByEnumeratingWithState:&v369 objects:&v374 count:16];
      }
      while (v243);
    }

    sub_100012408((uint64_t)FPFootprint, v192, (uint64_t)&v361);
    if ([v178 count]) {
      BOOL v206 = 1;
    }
    else {
      BOOL v206 = [v225 count] != 0;
    }
    long long v263 = 0u;
    long long v264 = 0u;
    long long v261 = 0u;
    long long v262 = 0u;
    id v207 = *(id *)(v239 + 88);
    id v208 = [v207 countByEnumeratingWithState:&v261 objects:v344 count:16];
    if (v208)
    {
      id v209 = v208;
      uint64_t v210 = *(void *)v262;
      if (a4) {
        uint64_t v211 = 0;
      }
      else {
        uint64_t v211 = v192;
      }
      do
      {
        for (i11 = 0; i11 != v209; i11 = (char *)i11 + 1)
        {
          if (*(void *)v262 != v210) {
            objc_enumerationMutation(v207);
          }
          v213 = *(void **)(*((void *)&v261 + 1) + 8 * (void)i11);
          [v213 printSummaryCategories:v211 total:&v361 hadErrors:v206];
          [v213 printGlobalAuxData:v223];
          [v213 endAtTime:*(void *)(v239 + 112)];
        }
        id v209 = [v207 countByEnumeratingWithState:&v261 objects:v344 count:16];
      }
      while (v209);
    }
  }
}

id sub_10001410C(uint64_t a1)
{
  id v2 = +[NSPredicate predicateWithFormat:@"hiddenFromDisplay == NO"];
  id v3 = [*(id *)(a1 + 8) filteredArrayUsingPredicate:v2];

  return v3;
}

id sub_100014174(void *a1, void *a2, unsigned __int8 *a3, char a4)
{
  id v6 = a1;
  id v22 = a2;
  id v7 = +[NSMutableDictionary dictionary];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v6;
  id v8 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v8)
  {
    id v9 = v8;
    unsigned __int8 v10 = 0;
    uint64_t v11 = *(void *)v24;
    do
    {
      for (unint64_t i = 0; i != v9; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(obj);
        }
        long long v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if (a4) {
          [v13 name];
        }
        else {
        id v14 = [v13 fullName];
        }
        id v15 = [v7 objectForKeyedSubscript:v14];
        if (!v15)
        {
          double v16 = sub_10001D3CC([FPMemoryCategory alloc], a4);
          id v15 = v17;
          [v7 setObject:v17 forKeyedSubscript:v14];
        }
        id v18 = [v13 viewForProcess:v22];
        sub_10001D66C((uint64_t)v15, v18);
        if (v10 == 2 || v18 == v13)
        {
          if (!v10) {
            unsigned __int8 v10 = [v13 couldHaveProcessView];
          }
        }
        else
        {
          unsigned __int8 v10 = 2;
        }
      }
      id v9 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v9);
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  if (a3) {
    *a3 = v10;
  }

  return v7;
}

void sub_100014394(uint64_t a1, id *a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v3 = a3;
    while (1)
    {
      id v6 = *a2;
      id v7 = v6;
      id v8 = v6 ? (void *)*((void *)v6 + 8) : 0;
      id v9 = v8;
      unsigned __int8 v10 = v9;
      if (!*(unsigned char *)(a1 + 72)) {
        break;
      }
      if ([v9 ownerPid] != -1)
      {
        uint64_t v11 = *(void **)(a1 + 32);
        long long v12 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v10 ownerPid]);
        if (([v11 containsObject:v12] & 1) == 0) {
          goto LABEL_18;
        }
        unsigned int v13 = [v10 containsFakeRegion];

        if (v13) {
          break;
        }
      }
LABEL_19:

      ++a2;
      if (!--v3) {
        return;
      }
    }
    if (v7) {
      BOOL v14 = *(void *)(a1 + 40) == 0;
    }
    else {
      BOOL v14 = 1;
    }
    if (!v14 && (v7[8] & 2) != 0 && !sub_100004D34((BOOL)v7))
    {
      sub_100018858(*(void *)(a1 + 48), v10);
      goto LABEL_19;
    }
    long long v12 = +[NSValue valueWithNonretainedObject:v10];
    id v15 = [*(id *)(a1 + 56) objectForKeyedSubscript:v12];
    if (!v15)
    {
      id v15 = objc_alloc_init(FPProcessGroupMinimal);
      [*(id *)(a1 + 56) setObject:v15 forKeyedSubscript:v12];
    }
    [(FPProcessGroupMinimal *)v15 addProcess:*(void *)(a1 + 64)];

LABEL_18:
    goto LABEL_19;
  }
}

int64_t sub_10001451C(id a1, FPProcess *a2, FPProcess *a3)
{
  id v4 = a3;
  LODWORD(a2) = [(FPProcess *)a2 pid];
  int v5 = [(FPProcess *)v4 pid];

  if ((int)a2 > v5) {
    return -1;
  }
  else {
    return 1;
  }
}

uint64_t sub_100014574(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(*(void *)(a1 + 32) + 16);
  id v8 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v5 pid]);
  id v9 = [v7 objectForKeyedSubscript:v8];

  unsigned __int8 v10 = *(void **)(*(void *)(a1 + 32) + 16);
  uint64_t v11 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v6 pid]);
  long long v12 = [v10 objectForKeyedSubscript:v11];

  uint64_t v13 = (uint64_t)[v12 compare:v9];
  if (!v13)
  {
    int v14 = [v5 pid];
    if (v14 > (int)[v6 pid]) {
      uint64_t v13 = -1;
    }
    else {
      uint64_t v13 = 1;
    }
  }

  return v13;
}

BOOL sub_100014964(uint64_t a1, void *a2)
{
  return [a2 virtualAddress] == *(id *)(a1 + 32);
}

BOOL sub_100014998()
{
  return objc_opt_class() != 0;
}

void sub_100015038(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

uint64_t sub_100015064(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100015074(uint64_t a1)
{
}

void sub_10001507C(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v3;
  id v15 = [v3 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v15)
  {
    uint64_t v14 = *(void *)v21;
    do
    {
      for (unint64_t i = 0; i != v15; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v6 = [v5 processIDs];
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        id v7 = [v6 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v7)
        {
          id v8 = v7;
          uint64_t v9 = *(void *)v17;
          do
          {
            for (j = 0; j != v8; j = (char *)j + 1)
            {
              if (*(void *)v17 != v9) {
                objc_enumerationMutation(v6);
              }
              uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * (void)j);
              long long v12 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectForKeyedSubscript:v11];
              if (!v12)
              {
                long long v12 = +[NSMutableArray array];
                [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v12 forKeyedSubscript:v11];
              }
              [v12 addObject:v5];
            }
            id v8 = [v6 countByEnumeratingWithState:&v16 objects:v24 count:16];
          }
          while (v8);
        }
      }
      id v15 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v15);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

BOOL sub_100015310(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

unint64_t sub_10001531C(unint64_t a1)
{
  return a1 >> 8;
}

id sub_100015324(id a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    v17.receiver = a1;
    v17.super_class = (Class)FPOutputFormatterJSON;
    a1 = [super init];
    if (a1)
    {
      id v4 = objc_alloc_init((Class)NSISO8601DateFormatter);
      id v5 = (void *)*((void *)a1 + 6);
      *((void *)a1 + 6) = v4;

      [*((id *)a1 + 6) setFormatOptions:3955];
      id v6 = +[NSTimeZone systemTimeZone];
      [*((id *)a1 + 6) setTimeZone:v6];

      id v7 = (const char *)[v3 UTF8String];
      id v8 = malloc_type_malloc(0x10uLL, 0x10200405F07FB98uLL);
      uint64_t v9 = fopen(v7, "w+");
      *(void *)id v8 = v9;
      if (v9)
      {
        v8[8] = 0;
        *((void *)a1 + 5) = v8;
        fputc(123, *(FILE **)v8);
        uint64_t v10 = *((void *)a1 + 5);
        *(unsigned char *)(v10 + _Block_object_dispose(&STACK[0x2B0], 8) = 0;
        fwrite("\"unit\":", 7uLL, 1uLL, *(FILE **)v10);
        uint64_t v11 = *((void *)a1 + 5);
        *(unsigned char *)(v11 + _Block_object_dispose(&STACK[0x2B0], 8) = 0;
        fwrite("\"byte\"", 6uLL, 1uLL, *(FILE **)v11);
        uint64_t v12 = *((void *)a1 + 5);
        *(unsigned char *)(v12 + _Block_object_dispose(&STACK[0x2B0], 8) = 1;
        fputc(44, *(FILE **)v12);
        fwrite("\"bytes per unit\":", 0x11uLL, 1uLL, **((FILE ***)a1 + 5));
        uint64_t v13 = *((void *)a1 + 5);
        *(unsigned char *)(v13 + _Block_object_dispose(&STACK[0x2B0], 8) = 0;
        fprintf(*(FILE **)v13, "%d", 1);
        *(unsigned char *)(*((void *)a1 + 5) + _Block_object_dispose(&STACK[0x2B0], 8) = 1;
        if (!sub_1000113C4())
        {
          uint64_t v14 = *((void *)a1 + 5);
          if (v14)
          {
            if (*(unsigned char *)(v14 + 8))
            {
              fputc(44, *(FILE **)v14);
              uint64_t v14 = *((void *)a1 + 5);
            }
            fwrite("\"vm_object_dirty_analysis\":", 0x1BuLL, 1uLL, *(FILE **)v14);
            uint64_t v15 = *((void *)a1 + 5);
            *(unsigned char *)(v15 + _Block_object_dispose(&STACK[0x2B0], 8) = 0;
            fputs("true", *(FILE **)v15);
            *(unsigned char *)(*((void *)a1 + 5) + _Block_object_dispose(&STACK[0x2B0], 8) = 1;
          }
        }
      }
      else
      {
        free(v8);
        *((void *)a1 + 5) = 0;
        perror("Unable to open JSON writer");

        a1 = 0;
      }
    }
  }

  return a1;
}

void sub_100015748(uint64_t a1, void *a2, const char *a3)
{
  id v5 = a2;
  if (a1)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    if (v6)
    {
      long long v26 = v5;
      if (*(unsigned char *)(v6 + 8))
      {
        fputc(44, *(FILE **)v6);
        uint64_t v6 = *(void *)(a1 + 40);
      }
      fprintf(*(FILE **)v6, "\"%s\":", a3);
      uint64_t v7 = *(void *)(a1 + 40);
      *(unsigned char *)(v7 + _Block_object_dispose(&STACK[0x2B0], 8) = 0;
      fputc(123, *(FILE **)v7);
      uint64_t v8 = *(void *)(a1 + 40);
      *(unsigned char *)(v8 + _Block_object_dispose(&STACK[0x2B0], 8) = 0;
      fwrite("\"mach_absolute_time_ns\":", 0x18uLL, 1uLL, *(FILE **)v8);
      uint64_t v9 = *(void *)(a1 + 40);
      *(unsigned char *)(v9 + _Block_object_dispose(&STACK[0x2B0], 8) = 0;
      uint64_t v10 = *(FILE **)v9;
      unint64_t v11 = sub_100018BAC((unint64_t)v26);
      fprintf(v10, "%llu", v11);
      uint64_t v12 = *(void *)(a1 + 40);
      *(unsigned char *)(v12 + _Block_object_dispose(&STACK[0x2B0], 8) = 1;
      fputc(44, *(FILE **)v12);
      fwrite("\"mach_continuous_time_ns\":", 0x1AuLL, 1uLL, **(FILE ***)(a1 + 40));
      uint64_t v13 = *(void *)(a1 + 40);
      *(unsigned char *)(v13 + _Block_object_dispose(&STACK[0x2B0], 8) = 0;
      uint64_t v14 = *(FILE **)v13;
      unint64_t v15 = sub_100018C10((unint64_t)v26);
      fprintf(v14, "%llu", v15);
      uint64_t v16 = *(void *)(a1 + 40);
      *(unsigned char *)(v16 + _Block_object_dispose(&STACK[0x2B0], 8) = 1;
      fputc(44, *(FILE **)v16);
      fwrite("\"wall_time_s\":", 0xEuLL, 1uLL, **(FILE ***)(a1 + 40));
      uint64_t v17 = *(void *)(a1 + 40);
      *(unsigned char *)(v17 + _Block_object_dispose(&STACK[0x2B0], 8) = 0;
      if (v26) {
        double v18 = v26[3];
      }
      else {
        double v18 = 0.0;
      }
      fprintf(*(FILE **)v17, "%f", v18);
      uint64_t v19 = *(void *)(a1 + 40);
      *(unsigned char *)(v19 + _Block_object_dispose(&STACK[0x2B0], 8) = 1;
      fputc(44, *(FILE **)v19);
      fwrite("\"date\":", 7uLL, 1uLL, **(FILE ***)(a1 + 40));
      uint64_t v20 = *(void *)(a1 + 40);
      *(unsigned char *)(v20 + _Block_object_dispose(&STACK[0x2B0], 8) = 0;
      long long v21 = *(FILE **)v20;
      long long v22 = *(void **)(a1 + 48);
      long long v23 = sub_100018C74(v26);
      id v24 = [v22 stringFromDate:v23];
      fprintf(v21, "\"%s\"", (const char *)[v24 UTF8String]);

      uint64_t v25 = *(void *)(a1 + 40);
      *(unsigned char *)(v25 + _Block_object_dispose(&STACK[0x2B0], 8) = 1;
      fputc(125, *(FILE **)v25);
      *(unsigned char *)(*(void *)(a1 + 40) + _Block_object_dispose(&STACK[0x2B0], 8) = 1;
      id v5 = v26;
    }
  }
}

void sub_100015FD4(uint64_t a1, id *a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v3 = a3;
    uint64_t v6 = "\"addr\":";
    uint64_t v7 = "%llu";
    uint64_t v8 = "\"wired\":";
    while (1)
    {
      uint64_t v9 = *a2;
      uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 40);
      if (v10)
      {
        if (*(unsigned char *)(v10 + 8))
        {
          fputc(44, *(FILE **)v10);
          uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 40);
        }
        fputc(123, *(FILE **)v10);
        *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 40) + _Block_object_dispose(&STACK[0x2B0], 8) = 0;
        uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 40);
        if (v11)
        {
          if (*(unsigned char *)(v11 + 8))
          {
            fputc(44, *(FILE **)v11);
            uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 40);
          }
          fwrite("\"id\":", 5uLL, 1uLL, *(FILE **)v11);
          *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 40) + _Block_object_dispose(&STACK[0x2B0], 8) = 0;
          uint64_t v12 = *(FILE ***)(*(void *)(a1 + 32) + 40);
          if (v12)
          {
            uint64_t v13 = v9 ? v9[12] : 0;
            fprintf(*v12, v7, v13);
            *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 40) + _Block_object_dispose(&STACK[0x2B0], 8) = 1;
            uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 40);
            if (v14)
            {
              if (*(unsigned char *)(v14 + 8))
              {
                fputc(44, *(FILE **)v14);
                uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 40);
              }
              fwrite("\"name\":", 7uLL, 1uLL, *(FILE **)v14);
              *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 40) + _Block_object_dispose(&STACK[0x2B0], 8) = 0;
              unint64_t v15 = *(FILE ***)(*(void *)(a1 + 32) + 40);
              if (v15)
              {
                uint64_t v16 = *v15;
                uint64_t v17 = [v9 fullName];
                [v17 stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
                double v18 = v7;
                uint64_t v19 = v8;
                uint64_t v20 = v6;
                id v21 = objc_claimAutoreleasedReturnValue();
                fprintf(v16, "\"%s\"", (const char *)[v21 UTF8String]);

                uint64_t v6 = v20;
                uint64_t v8 = v19;
                uint64_t v7 = v18;

                *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 40) + _Block_object_dispose(&STACK[0x2B0], 8) = 1;
              }
            }
          }
        }
      }
      if (!v9) {
        break;
      }
      uint64_t v22 = *(void *)(a1 + 32);
      if (v9[10] != -1) {
        goto LABEL_19;
      }
LABEL_26:
      uint64_t v26 = *(void *)(v22 + 40);
      if (v26)
      {
        if (*(unsigned char *)(v26 + 8))
        {
          fputc(44, *(FILE **)v26);
          uint64_t v26 = *(void *)(*(void *)(a1 + 32) + 40);
        }
        fwrite("\"vsize\":", 8uLL, 1uLL, *(FILE **)v26);
        *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 40) + _Block_object_dispose(&STACK[0x2B0], 8) = 0;
        uint64_t v27 = *(FILE ***)(*(void *)(a1 + 32) + 40);
        if (v27)
        {
          if (v9) {
            uint64_t v28 = v9[11];
          }
          else {
            uint64_t v28 = 0;
          }
          fprintf(*v27, v7, v28);
          *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 40) + _Block_object_dispose(&STACK[0x2B0], 8) = 1;
        }
      }
      if (v9)
      {
        if (v9[9])
        {
          uint64_t v29 = *(void *)(*(void *)(a1 + 32) + 40);
          if (v29)
          {
            if (*(unsigned char *)(v29 + 8))
            {
              fputc(44, *(FILE **)v29);
              uint64_t v29 = *(void *)(*(void *)(a1 + 32) + 40);
            }
            fwrite("\"offset\":", 9uLL, 1uLL, *(FILE **)v29);
            *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 40) + _Block_object_dispose(&STACK[0x2B0], 8) = 0;
            unsigned int v30 = *(FILE ***)(*(void *)(a1 + 32) + 40);
            if (v30)
            {
              fprintf(*v30, v7, v9[9]);
              *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 40) + _Block_object_dispose(&STACK[0x2B0], 8) = 1;
            }
          }
        }
      }
      id v31 = [v9 dirtySize];
      if (v31)
      {
        uint64_t v32 = *(void *)(*(void *)(a1 + 32) + 40);
        if (v32)
        {
          id v33 = v31;
          if (*(unsigned char *)(v32 + 8))
          {
            fputc(44, *(FILE **)v32);
            uint64_t v32 = *(void *)(*(void *)(a1 + 32) + 40);
          }
          fwrite("\"dirty\":", 8uLL, 1uLL, *(FILE **)v32);
          *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 40) + _Block_object_dispose(&STACK[0x2B0], 8) = 0;
          id v34 = *(FILE ***)(*(void *)(a1 + 32) + 40);
          if (v34)
          {
            fprintf(*v34, v7, v33);
            *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 40) + _Block_object_dispose(&STACK[0x2B0], 8) = 1;
          }
        }
      }
      id v35 = [v9 swappedSize];
      if (v35)
      {
        uint64_t v36 = *(void *)(*(void *)(a1 + 32) + 40);
        if (v36)
        {
          id v37 = v35;
          if (*(unsigned char *)(v36 + 8))
          {
            fputc(44, *(FILE **)v36);
            uint64_t v36 = *(void *)(*(void *)(a1 + 32) + 40);
          }
          fwrite("\"swapped\":", 0xAuLL, 1uLL, *(FILE **)v36);
          *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 40) + _Block_object_dispose(&STACK[0x2B0], 8) = 0;
          id v38 = *(FILE ***)(*(void *)(a1 + 32) + 40);
          if (v38)
          {
            fprintf(*v38, v7, v37);
            *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 40) + _Block_object_dispose(&STACK[0x2B0], 8) = 1;
          }
        }
      }
      id v39 = [v9 cleanSize];
      if (v39)
      {
        uint64_t v40 = *(void *)(*(void *)(a1 + 32) + 40);
        if (v40)
        {
          id v41 = v39;
          if (*(unsigned char *)(v40 + 8))
          {
            fputc(44, *(FILE **)v40);
            uint64_t v40 = *(void *)(*(void *)(a1 + 32) + 40);
          }
          fwrite("\"clean\":", 8uLL, 1uLL, *(FILE **)v40);
          *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 40) + _Block_object_dispose(&STACK[0x2B0], 8) = 0;
          id v42 = *(FILE ***)(*(void *)(a1 + 32) + 40);
          if (v42)
          {
            fprintf(*v42, v7, v41);
            *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 40) + _Block_object_dispose(&STACK[0x2B0], 8) = 1;
          }
        }
      }
      id v43 = [v9 reclaimableSize];
      if (v43)
      {
        uint64_t v44 = *(void *)(*(void *)(a1 + 32) + 40);
        if (v44)
        {
          id v45 = v43;
          if (*(unsigned char *)(v44 + 8))
          {
            fputc(44, *(FILE **)v44);
            uint64_t v44 = *(void *)(*(void *)(a1 + 32) + 40);
          }
          fwrite("\"reclaimable\":", 0xEuLL, 1uLL, *(FILE **)v44);
          *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 40) + _Block_object_dispose(&STACK[0x2B0], 8) = 0;
          uint64_t v46 = *(FILE ***)(*(void *)(a1 + 32) + 40);
          if (v46)
          {
            fprintf(*v46, v7, v45);
            *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 40) + _Block_object_dispose(&STACK[0x2B0], 8) = 1;
          }
        }
      }
      id v47 = [v9 wiredSize];
      uint64_t v48 = *(void *)(a1 + 32);
      if (v47)
      {
        uint64_t v49 = *(void *)(v48 + 40);
        if (v49)
        {
          id v50 = v47;
          if (*(unsigned char *)(v49 + 8))
          {
            fputc(44, *(FILE **)v49);
            uint64_t v49 = *(void *)(*(void *)(a1 + 32) + 40);
          }
          fwrite(v8, 8uLL, 1uLL, *(FILE **)v49);
          *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 40) + _Block_object_dispose(&STACK[0x2B0], 8) = 0;
          uint64_t v48 = *(void *)(a1 + 32);
          unint64_t v51 = *(FILE ***)(v48 + 40);
          if (v51)
          {
            fprintf(*v51, v7, v50);
            *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 40) + _Block_object_dispose(&STACK[0x2B0], 8) = 1;
            uint64_t v48 = *(void *)(a1 + 32);
          }
        }
      }
      id v52 = *(FILE ***)(v48 + 40);
      if (v52)
      {
        fputc(125, *v52);
        *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 40) + _Block_object_dispose(&STACK[0x2B0], 8) = 1;
      }

      ++a2;
      if (!--v3) {
        return;
      }
    }
    uint64_t v22 = *(void *)(a1 + 32);
LABEL_19:
    uint64_t v23 = *(void *)(v22 + 40);
    if (v23)
    {
      if (*(unsigned char *)(v23 + 8))
      {
        fputc(44, *(FILE **)v23);
        uint64_t v23 = *(void *)(*(void *)(a1 + 32) + 40);
      }
      fwrite(v6, 7uLL, 1uLL, *(FILE **)v23);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 40) + _Block_object_dispose(&STACK[0x2B0], 8) = 0;
      uint64_t v22 = *(void *)(a1 + 32);
      id v24 = *(FILE ***)(v22 + 40);
      if (v24)
      {
        if (v9) {
          uint64_t v25 = v9[10];
        }
        else {
          uint64_t v25 = 0;
        }
        fprintf(*v24, v7, v25);
        *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 40) + _Block_object_dispose(&STACK[0x2B0], 8) = 1;
        uint64_t v22 = *(void *)(a1 + 32);
      }
    }
    goto LABEL_26;
  }
}

void sub_100016800(uint64_t a1, void *a2)
{
  if (a1)
  {
    uint64_t v3 = [a2 objectEnumerator];
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100017E80;
    v4[3] = &unk_100029DE8;
    v4[4] = a1;
    [v3 fp_enumerateObjectsWithBatchSize:16 usingBlock:v4];
  }
}

void sub_100016D8C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (!a1) {
    goto LABEL_27;
  }
  if (!v3)
  {
    uint64_t v16 = *(FILE ***)(a1 + 40);
    if (!v16) {
      goto LABEL_27;
    }
    fputs("null", *v16);
LABEL_26:
    *(unsigned char *)(*(void *)(a1 + 40) + _Block_object_dispose(&STACK[0x2B0], 8) = 1;
    goto LABEL_27;
  }
  if (!objc_msgSend(v3, "fp_isContainer"))
  {
    uint64_t v17 = *(FILE ***)(a1 + 40);
    if (!v17) {
      goto LABEL_27;
    }
    fprintf(*v17, "%lld", [v4 value]);
    goto LABEL_26;
  }
  id v5 = v4;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    if (*(unsigned char *)(v6 + 8))
    {
      fputc(44, *(FILE **)v6);
      uint64_t v6 = *(void *)(a1 + 40);
    }
    fputc(123, *(FILE **)v6);
    *(unsigned char *)(*(void *)(a1 + 40) + _Block_object_dispose(&STACK[0x2B0], 8) = 0;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (unint64_t i = 0; i != v9; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v13 = *(void *)(a1 + 40);
        if (v13)
        {
          if (*(unsigned char *)(v13 + 8))
          {
            fputc(44, *(FILE **)v13);
            uint64_t v13 = *(void *)(a1 + 40);
          }
          fprintf(*(FILE **)v13, "\"%s\":", (const char *)[v12 UTF8String]);
          *(unsigned char *)(*(void *)(a1 + 40) + _Block_object_dispose(&STACK[0x2B0], 8) = 0;
        }
        uint64_t v14 = [v7 objectForKeyedSubscript:v12];
        sub_100016D8C(a1, v14);
      }
      id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  unint64_t v15 = *(FILE ***)(a1 + 40);
  if (v15)
  {
    fputc(125, *v15);
    *(unsigned char *)(*(void *)(a1 + 40) + _Block_object_dispose(&STACK[0x2B0], 8) = 1;
  }

LABEL_27:
}

void sub_100017E80(uint64_t a1, id *a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v3 = a3;
    do
    {
      id v6 = *a2;
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 40);
      if (v7)
      {
        if (*(unsigned char *)(v7 + 8))
        {
          fputc(44, *(FILE **)v7);
          uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 40);
        }
        id v8 = *(FILE **)v7;
        id v9 = sub_10001D4CC((uint64_t)v6);
        id v10 = [v9 stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
        fprintf(v8, "\"%s\":", (const char *)[v10 UTF8String]);

        *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 40) + _Block_object_dispose(&STACK[0x2B0], 8) = 0;
        uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 40);
        if (v11)
        {
          if (*(unsigned char *)(v11 + 8))
          {
            fputc(44, *(FILE **)v11);
            uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 40);
          }
          fputc(123, *(FILE **)v11);
          *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 40) + _Block_object_dispose(&STACK[0x2B0], 8) = 0;
          uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 40);
          if (v12)
          {
            if (*(unsigned char *)(v12 + 8))
            {
              fputc(44, *(FILE **)v12);
              uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 40);
            }
            fwrite("\"dirty\":", 8uLL, 1uLL, *(FILE **)v12);
            *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 40) + _Block_object_dispose(&STACK[0x2B0], 8) = 0;
            uint64_t v13 = *(FILE ***)(*(void *)(a1 + 32) + 40);
            if (v13)
            {
              fprintf(*v13, "%llu", (char *)[v6 totalDirtySize] + (void)[v6 totalSwappedSize]);
              *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 40) + _Block_object_dispose(&STACK[0x2B0], 8) = 1;
              uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 40);
              if (v14)
              {
                if (*(unsigned char *)(v14 + 8))
                {
                  fputc(44, *(FILE **)v14);
                  uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 40);
                }
                fwrite("\"swapped\":", 0xAuLL, 1uLL, *(FILE **)v14);
                *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 40) + _Block_object_dispose(&STACK[0x2B0], 8) = 0;
                unint64_t v15 = *(FILE ***)(*(void *)(a1 + 32) + 40);
                if (v15)
                {
                  fprintf(*v15, "%llu", [v6 totalSwappedSize]);
                  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 40) + _Block_object_dispose(&STACK[0x2B0], 8) = 1;
                  uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 40);
                  if (v16)
                  {
                    if (*(unsigned char *)(v16 + 8))
                    {
                      fputc(44, *(FILE **)v16);
                      uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 40);
                    }
                    fwrite("\"clean\":", 8uLL, 1uLL, *(FILE **)v16);
                    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 40) + _Block_object_dispose(&STACK[0x2B0], 8) = 0;
                    uint64_t v17 = *(FILE ***)(*(void *)(a1 + 32) + 40);
                    if (v17)
                    {
                      fprintf(*v17, "%llu", [v6 totalCleanSize]);
                      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 40) + _Block_object_dispose(&STACK[0x2B0], 8) = 1;
                      uint64_t v18 = *(void *)(*(void *)(a1 + 32) + 40);
                      if (v18)
                      {
                        if (*(unsigned char *)(v18 + 8))
                        {
                          fputc(44, *(FILE **)v18);
                          uint64_t v18 = *(void *)(*(void *)(a1 + 32) + 40);
                        }
                        fwrite("\"reclaimable\":", 0xEuLL, 1uLL, *(FILE **)v18);
                        *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 40) + _Block_object_dispose(&STACK[0x2B0], 8) = 0;
                        long long v19 = *(FILE ***)(*(void *)(a1 + 32) + 40);
                        if (v19)
                        {
                          fprintf(*v19, "%llu", [v6 totalReclaimableSize]);
                          *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 40) + _Block_object_dispose(&STACK[0x2B0], 8) = 1;
                          uint64_t v20 = *(void *)(*(void *)(a1 + 32) + 40);
                          if (v20)
                          {
                            if (*(unsigned char *)(v20 + 8))
                            {
                              fputc(44, *(FILE **)v20);
                              uint64_t v20 = *(void *)(*(void *)(a1 + 32) + 40);
                            }
                            fwrite("\"wired\":", 8uLL, 1uLL, *(FILE **)v20);
                            *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 40) + _Block_object_dispose(&STACK[0x2B0], 8) = 0;
                            long long v21 = *(FILE ***)(*(void *)(a1 + 32) + 40);
                            if (v21)
                            {
                              fprintf(*v21, "%llu", [v6 totalWiredSize]);
                              *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 40) + _Block_object_dispose(&STACK[0x2B0], 8) = 1;
                              uint64_t v22 = *(void *)(*(void *)(a1 + 32) + 40);
                              if (v22)
                              {
                                if (*(unsigned char *)(v22 + 8))
                                {
                                  fputc(44, *(FILE **)v22);
                                  uint64_t v22 = *(void *)(*(void *)(a1 + 32) + 40);
                                }
                                fwrite("\"regions\":", 0xAuLL, 1uLL, *(FILE **)v22);
                                *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 40) + _Block_object_dispose(&STACK[0x2B0], 8) = 0;
                                uint64_t v23 = *(FILE ***)(*(void *)(a1 + 32) + 40);
                                if (v23)
                                {
                                  fprintf(*v23, "%u", [v6 totalRegions]);
                                  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 40) + _Block_object_dispose(&STACK[0x2B0], 8) = 1;
                                  id v24 = *(FILE ***)(*(void *)(a1 + 32) + 40);
                                  if (v24)
                                  {
                                    fputc(125, *v24);
                                    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 40) + _Block_object_dispose(&STACK[0x2B0], 8) = 1;
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }

      ++a2;
      --v3;
    }
    while (v3);
  }
}

void sub_10001838C(void *a1, unint64_t a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  if (a2 <= 1) {
    a2 = 1;
  }
  uint64_t v7 = malloc_type_malloc(8 * a2, 0x80040B8603338uLL);
  id v8 = (char *)[v5 countByEnumeratingWithState:&v16 objects:v7 count:a2];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = 0;
    char v11 = 1;
    do
    {
      uint64_t v12 = (uint64_t *)v17;
      if ((v11 & 1) == 0 && v10 != *(void *)v17)
      {
        objc_enumerationMutation(v5);
        uint64_t v12 = (uint64_t *)v17;
      }
      uint64_t v10 = *v12;
      uint64_t v13 = *((void *)&v16 + 1);
      do
      {
        if (a2 >= (unint64_t)v9) {
          unint64_t v14 = (unint64_t)v9;
        }
        else {
          unint64_t v14 = a2;
        }
        v6[2](v6, v13, v14);
        v13 += 8 * v14;
        v9 -= v14;
      }
      while (v9);
      id v9 = (char *)[v5 countByEnumeratingWithState:&v16 objects:v7 count:a2];
      char v11 = 0;
    }
    while (v9);
  }
  free(v7);
}

void *sub_1000184E4(void *a1, uint64_t a2)
{
  if (!a1) {
    return 0;
  }
  v7.receiver = a1;
  v7.super_class = (Class)FPProcessGroupMinimal;
  uint64_t v3 = [super init];
  if (v3)
  {
    id v4 = objc_alloc_init((Class)NSMutableSet);
    id v5 = (void *)v3[1];
    v3[1] = v4;

    v3[2] = a2;
  }
  return v3;
}

FPProcessGroup *sub_10001862C(uint64_t a1)
{
  if (a1)
  {
    id v2 = objc_alloc_init(FPProcessGroup);
    v2->super._hashValue = *(void *)(a1 + 16);
    objc_storeStrong((id *)&v2->super._processes, *(id *)(a1 + 8));
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

uint64_t sub_100018858(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = *(void **)(a1 + 32);
    id v9 = v4;
    if (!v5)
    {
      id v6 = objc_alloc_init((Class)NSMutableSet);
      objc_super v7 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v6;

      id v5 = *(void **)(a1 + 32);
    }
    id v3 = [v5 addObject:v9];
    id v4 = v9;
  }

  return _objc_release_x1(v3, v4);
}

void sub_100018900(uint64_t a1, void *a2, int a3)
{
  id v6 = a2;
  if (a1)
  {
    if (!a3)
    {
      _os_assert_log();
      _os_crash();
      __break(1u);
      return;
    }
    *(_DWORD *)(a1 + 24) = a3;
    id v7 = v6;
    objc_storeStrong((id *)(a1 + 40), a2);
    id v6 = v7;
  }
}

id sub_10001898C(uint64_t a1)
{
  if (a1)
  {
    id v2 = *(id *)(a1 + 40);
    if (v2)
    {
      if (!--*(_DWORD *)(a1 + 24))
      {
        id v3 = *(void **)(a1 + 40);
        *(void *)(a1 + 40) = 0;
      }
      id v4 = v2;
    }
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

FPTime *sub_100018B78()
{
  self;
  int v0 = objc_alloc_init(FPTime);

  return v0;
}

unint64_t sub_100018BAC(unint64_t result)
{
  if (result)
  {
    uint64_t v1 = *(void *)(result + 8);
    if (qword_100038A48 != -1) {
      dispatch_once(&qword_100038A48, &stru_100029E08);
    }
    return v1 * (unint64_t)dword_100038A40 / *(unsigned int *)algn_100038A44;
  }
  return result;
}

unint64_t sub_100018C10(unint64_t result)
{
  if (result)
  {
    uint64_t v1 = *(void *)(result + 16);
    if (qword_100038A48 != -1) {
      dispatch_once(&qword_100038A48, &stru_100029E08);
    }
    return v1 * (unint64_t)dword_100038A40 / *(unsigned int *)algn_100038A44;
  }
  return result;
}

double *sub_100018C74(double *a1)
{
  if (a1)
  {
    a1 = +[NSDate dateWithTimeIntervalSinceReferenceDate:a1[3]];
    uint64_t v1 = vars8;
  }
  return a1;
}

void sub_100018CB4(id a1)
{
}

void *sub_100018CC0(void *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    v6.receiver = a1;
    v6.super_class = (Class)FPOutputFormatterPerfdata;
    a1 = [super init];
    if (a1)
    {
      sub_1000113C4();
      [v3 UTF8String];
      uint64_t v4 = pdwriter_open();
      a1[1] = v4;
      if (v4)
      {
        pdwriter_set_description();
        pdwriter_set_primary_metric();
      }
      else
      {
        perror("Unable to open pdwriter");

        a1 = 0;
      }
    }
  }

  return a1;
}

void sub_100018FA0(uint64_t a1, void *a2)
{
  if (a1)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v3 = [a2 objectEnumerator];
    id v4 = [v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v18 = *(void *)v20;
      long long v17 = v3;
      do
      {
        for (unint64_t i = 0; i != v5; unint64_t i = (char *)i + 1)
        {
          if (*(void *)v20 != v18) {
            objc_enumerationMutation(v3);
          }
          id v7 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          id v8 = sub_10001D4CC((uint64_t)v7);
          id v9 = [*(id *)(a1 + 16) objectForKeyedSubscript:v8];
          uint64_t v10 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (char *)[v7 totalSwappedSize]+ (void)objc_msgSend(v7, "totalDirtySize")+ (unint64_t)objc_msgSend(v9, "unsignedLongLongValue"));
          [*(id *)(a1 + 16) setObject:v10 forKeyedSubscript:v8];

          if (!v9)
          {
            char v11 = sub_10001D514((id *)v7);
            if (v11)
            {
              uint64_t v12 = [FPAuxDataInfo alloc];
              uint64_t v13 = sub_10001D5B0((uint64_t)v7);
              id v14 = v11;
              id v15 = v13;
              if (v12)
              {
                v23.receiver = v12;
                v23.super_class = (Class)FPAuxDataInfo;
                long long v16 = (FPAuxDataInfo *)[super init];
                uint64_t v12 = v16;
                if (v16)
                {
                  objc_storeStrong((id *)&v16->_dictionary, v11);
                  objc_storeStrong((id *)&v12->_fullName, v13);
                }
              }

              [*(id *)(a1 + 24) setObject:v12 forKeyedSubscript:v8];
              id v3 = v17;
            }
          }
        }
        id v5 = [v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v5);
    }
  }
}

void sub_100019444(uint64_t a1, void *a2, const char *a3)
{
  id v5 = a2;
  objc_super v6 = v5;
  if (a1)
  {
    if (objc_msgSend(v5, "fp_isContainer"))
    {
      id v7 = v6;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v8 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v17;
        do
        {
          for (unint64_t i = 0; i != v9; unint64_t i = (char *)i + 1)
          {
            if (*(void *)v17 != v10) {
              objc_enumerationMutation(v7);
            }
            id v12 = *(id *)(*((void *)&v16 + 1) + 8 * i);
            uint64_t v13 = (const char *)[v12 UTF8String];
            id v14 = (char *)v13;
            if (a3)
            {
              id v14 = __str;
              snprintf(__str, 0x400uLL, "%s.%s", a3, v13);
            }
            id v15 = [v7 objectForKeyedSubscript:v12];
            sub_100019444(a1, v15, v14);
          }
          id v9 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
        }
        while (v9);
      }
    }
    else
    {
      if (!a3)
      {
        _os_assert_log();
        _os_crash();
        __break(1u);
      }
      id v7 = v6;
      if ([v7 supportsFormattedValue])
      {
        [v7 formattedValue];
        pdwriter_record_variable_str();
      }
      else
      {
        [v7 value];
        pdwriter_record_variable_dbl();
      }
    }
  }
}

void sub_100019618(uint64_t a1, void *a2, const char *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = v7;
  if (a1)
  {
    if (objc_msgSend(v7, "fp_isContainer"))
    {
      id v9 = v8;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v10 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v17;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v17 != v12) {
              objc_enumerationMutation(v9);
            }
            id v14 = *(id *)(*((void *)&v16 + 1) + 8 * (void)v13);
            snprintf(__str, 0x400uLL, "%s.%s", a3, (const char *)[v14 UTF8String]);
            id v15 = [v9 objectForKeyedSubscript:v14];
            sub_100019618(a1, v15, __str, a4);

            uint64_t v13 = (char *)v13 + 1;
          }
          while (v11 != v13);
          id v11 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
        }
        while (v11);
      }
    }
    else
    {
      [v8 value];
      pdwriter_new_value();
      pdwriter_record_variable_str();
      pdwriter_record_variable_str();
      pdwriter_record_tag();
    }
  }
}

id sub_100019BF8()
{
  v2[0] = @"Dirty";
  v2[1] = @"Swapped";
  v2[2] = @"Clean";
  v2[3] = @"Reclaimable";
  v2[4] = @"Wired";
  v2[5] = @"Regions";
  v2[6] = @"Category";
  int v0 = +[NSArray arrayWithObjects:v2 count:7];

  return v0;
}

id *sub_100019CB0(id *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v10 = a4;
  if (a1)
  {
    v30.receiver = a1;
    v30.super_class = (Class)FPOutputFormatterText;
    id v11 = (id *)[super init];
    a1 = v11;
    if (v11)
    {
      v11[17] = __stdoutp;
      v11[14] = a2;
      v11[15] = a3;
      objc_storeStrong(v11 + 16, a4);
      a1[8] = a5;
      if ((a3 & 2) != 0)
      {
        id v13 = [objc_alloc((Class)NSString) initWithFormat:@"(%@)", @"Swapped"];
        id v12 = a1[3];
        a1[3] = v13;
      }
      else
      {
        id v12 = a1[3];
        a1[3] = 0;
      }

      if (a3)
      {
        id v15 = [objc_alloc((Class)NSString) initWithFormat:@"(%@)", @"Wired"];
        id v14 = a1[4];
        a1[4] = v15;
      }
      else
      {
        id v14 = a1[4];
        a1[4] = 0;
      }

      id v16 = objc_alloc_init((Class)NSISO8601DateFormatter);
      id v17 = a1[6];
      a1[6] = v16;

      [a1[6] setFormatOptions:4083];
      long long v18 = +[NSTimeZone systemTimeZone];
      [a1[6] setTimeZone:v18];

      if (a5 == (void *)1)
      {
        id v19 = objc_alloc_init((Class)NSMutableDictionary);
        id v20 = a1[9];
        a1[9] = v19;

        id v21 = objc_alloc_init((Class)NSMutableArray);
        id v22 = a1[10];
        a1[10] = v21;

        id v23 = objc_alloc_init((Class)NSMutableDictionary);
        id v24 = a1[11];
        a1[11] = v23;

        id v25 = objc_alloc_init((Class)NSMutableString);
        id v26 = a1[12];
        a1[12] = v25;

        id v27 = objc_alloc_init((Class)NSMutableString);
        id v28 = a1[13];
        a1[13] = v27;
      }
    }
  }

  return a1;
}

void sub_100019F44(uint64_t a1, void *a2, int a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  id v12 = a2;
  if (!a1) {
    goto LABEL_15;
  }
  va_list v22 = &a9;
  if (!*(void *)(a1 + 64))
  {
    v21[1] = &a9;
    vfprintf(*(FILE **)(a1 + 136), a4, &a9);
    goto LABEL_15;
  }
  id v13 = v20;
  unsigned int v14 = vsnprintf(v20, 0xC8uLL, a4, v22);
  if ((v14 & 0x80000000) != 0) {
    goto LABEL_10;
  }
  if (v14 >= 0xC9)
  {
    uint64_t v15 = 200;
    while (1)
    {
      unint64_t v16 = v15 + 200;
      id v13 = (char *)v21 - ((v15 + 215) & 0xFFFFFFFFFFFFFFF0);
      unsigned int v17 = vsnprintf(v13, v15 + 200, a4, v22);
      if ((v17 & 0x80000000) != 0) {
        break;
      }
      uint64_t v15 = v16;
      if (v16 >= v17) {
        goto LABEL_8;
      }
    }
LABEL_10:
    id v18 = 0;
    goto LABEL_11;
  }
LABEL_8:
  id v18 = [objc_alloc((Class)NSString) initWithCString:v13 encoding:4];
LABEL_11:
  if (v12) {
    int v19 = a3;
  }
  else {
    int v19 = 2;
  }
  sub_10001CF08((void *)a1, v12, v19, v18);

LABEL_15:
}

void sub_10001A230(uint64_t a1, id *a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v3 = a3;
    do
    {
      objc_super v6 = *a2;
      id v7 = v6;
      if (v6)
      {
        uint64_t v8 = v6[10];
        id v9 = *(FILE **)(*(void *)(a1 + 32) + 136);
        if (v8 == -1)
        {
          fprintf(v9, "        unmapped -         unmapped [%010llx]", v7[12] & 0xFFFFFFFFFFLL);
          id v12 = [v7 swappedSize];
          id v13 = *(FILE **)(*(void *)(a1 + 32) + 136);
          goto LABEL_9;
        }
        uint64_t v10 = v7[12];
        uint64_t v11 = v7[11] + v8;
      }
      else
      {
        uint64_t v11 = 0;
        uint64_t v8 = 0;
        uint64_t v10 = 0;
        id v9 = *(FILE **)(*(void *)(a1 + 32) + 136);
      }
      fprintf(v9, "%16llx - %16llx [%010llx]", v8, v11, v10 & 0xFFFFFFFFFFLL);
      id v12 = [v7 swappedSize];
      id v13 = *(FILE **)(*(void *)(a1 + 32) + 136);
      if (!v7)
      {
        uint64_t v14 = 0;
        goto LABEL_10;
      }
LABEL_9:
      uint64_t v14 = v7[11];
LABEL_10:
      fprintf(v13, " %7llu %7llu", (unint64_t)(v14 + *(void *)(a1 + 40) - 1) / *(void *)(a1 + 40), ((unint64_t)v12 + (void)[v7 dirtySize] + *(void *)(a1 + 40) - 1)/ *(void *)(a1 + 40));
      uint64_t v15 = *(void *)(a1 + 32);
      if ((*(unsigned char *)(v15 + 120) & 2) != 0)
      {
        fprintf(*(FILE **)(v15 + 136), " %7llu", ((unint64_t)v12 + *(void *)(a1 + 40) - 1) / *(void *)(a1 + 40));
        uint64_t v15 = *(void *)(a1 + 32);
      }
      fprintf(*(FILE **)(v15 + 136), " %7llu %7llu", ((unint64_t)[v7 cleanSize] + *(void *)(a1 + 40) - 1) / *(void *)(a1 + 40), ((unint64_t)[v7 reclaimableSize] + *(void *)(a1 + 40) - 1) / *(void *)(a1 + 40));
      uint64_t v16 = *(void *)(a1 + 32);
      id v28 = a2;
      uint64_t v29 = v3;
      if (*(unsigned char *)(v16 + 120))
      {
        fprintf(*(FILE **)(v16 + 136), " %7llu", ((unint64_t)[v7 wiredSize] + *(void *)(a1 + 40) - 1) / *(void *)(a1 + 40));
        uint64_t v16 = *(void *)(a1 + 32);
      }
      unsigned int v17 = [v7 detailedName];
      id v18 = sub_10001A534(v16, v17);

      id v19 = v18;
      id v20 = (const char *)[v19 UTF8String];
      id v21 = [v7 extendedInfo];
      va_list v22 = (const char *)[v21 UTF8String];
      id v23 = *(FILE **)(*(void *)(a1 + 32) + 136);
      id v24 = [v7 name];
      id v25 = (const char *)[v24 UTF8String];
      if (v20)
      {
        unsigned int v26 = [v19 length] + 1;
        if (!v22) {
          goto LABEL_18;
        }
      }
      else
      {
        unsigned int v26 = 0;
        id v20 = "";
        if (!v22)
        {
LABEL_18:
          unsigned int v27 = 0;
          va_list v22 = "";
          goto LABEL_19;
        }
      }
      unsigned int v27 = [v21 length] + 1;
LABEL_19:
      fprintf(v23, "   %s%*s%*s\n", v25, v26, v20, v27, v22);

      a2 = v28 + 1;
      uint64_t v3 = v29 - 1;
    }
    while (v29 != 1);
  }
}

id sub_10001A534(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if ((*(unsigned char *)(a1 + 120) & 4) != 0)
    {
LABEL_5:
      id v7 = v4;
      goto LABEL_7;
    }
    id v5 = [v3 lastPathComponent];
    id v6 = [v5 length];
    if (v6 == [v4 length])
    {

      goto LABEL_5;
    }
    id v7 = [objc_alloc((Class)NSString) initWithFormat:@".../%@", v5];
  }
  else
  {
    id v7 = 0;
  }
LABEL_7:

  return v7;
}

void *sub_10001AA8C(void *a1, uint64_t a2)
{
  if (a1)
  {
    uint64_t v2 = a1[14];
    switch(v2)
    {
      case 2:
        a1 = [objc_alloc((Class)NSString) initWithFormat:@"%llu pages", (unint64_t)(a2 + a1[2] - 1) / a1[2]];
        break;
      case 1:
        humanize_number();
        a1 = [objc_alloc((Class)NSString) initWithUTF8String:v4];
        break;
      case 0:
        a1 = [objc_alloc((Class)NSString) initWithFormat:@"%lld B", a2];
        break;
    }
  }

  return a1;
}

void sub_10001AE5C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!a1) {
    goto LABEL_19;
  }
  id v7 = v5;
  uint64_t v8 = v7;
  id v9 = *(__CFString **)(a1 + 128);
  if (v9 == @"Dirty")
  {
    uint64_t v11 = &stru_100029EA0;
LABEL_17:
    id v13 = [v8 keysSortedByValueUsingComparator:v11];
    goto LABEL_18;
  }
  if (v9 == @"Category")
  {
    id v12 = [v7 allKeys];
    id v13 = [v12 sortedArrayUsingSelector:"compare:"];

LABEL_18:
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10001C52C;
    v16[3] = &unk_100029E60;
    id v17 = v8;
    uint64_t v18 = a1;
    id v19 = v6;
    [v13 fp_enumerateObjectsWithBatchSize:32 usingBlock:v16];

LABEL_19:
    return;
  }
  if (v9 == @"Swapped")
  {
    uint64_t v10 = &selRef_totalSwappedSize;
    goto LABEL_16;
  }
  if (v9 == @"Clean")
  {
    uint64_t v10 = &selRef_totalCleanSize;
    goto LABEL_16;
  }
  if (v9 == @"Reclaimable")
  {
    uint64_t v10 = &selRef_totalReclaimableSize;
    goto LABEL_16;
  }
  if (v9 == @"Wired")
  {
    uint64_t v10 = &selRef_totalWiredSize;
    goto LABEL_16;
  }
  if (v9 == @"Regions")
  {
    uint64_t v10 = &selRef_totalRegions;
LABEL_16:
    uint64_t v14 = *v10;
    id v15 = +[FPMemoryCategory instanceMethodForSelector:*v10];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10001CE98;
    v20[3] = &unk_100029EC0;
    v20[4] = v15;
    v20[5] = v14;
    uint64_t v11 = (Block_layout *)v20;
    goto LABEL_17;
  }
  _os_crash();
  __break(1u);
}

uint64_t sub_10001B0A0(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v10 = v5;
  if (a1)
  {
    if (a1[14] == 1) {
      char v11 = 7;
    }
    else {
      char v11 = 11;
    }
    uint64_t v29 = v5;
    sub_100019F44((uint64_t)a1, v5, 1, "%*s%*s%*s%*s%*s %10s    %s\n", v6, v7, v8, v9, v11);
    if (a1[14] == 1) {
      char v12 = 7;
    }
    else {
      char v12 = 11;
    }
    char v28 = v12;
    sub_10001AA8C(a1, a2[1] + *a2);
    id v13 = objc_claimAutoreleasedReturnValue();
    [v13 UTF8String];
    uint64_t v14 = a1[15];
    if ((v14 & 2) != 0)
    {
      sub_10001AA8C(a1, a2[1]);
      id v27 = objc_claimAutoreleasedReturnValue();
      [v27 UTF8String];
    }
    sub_10001AA8C(a1, a2[2]);
    id v15 = objc_claimAutoreleasedReturnValue();
    [v15 UTF8String];
    sub_10001AA8C(a1, a2[3]);
    id v16 = objc_claimAutoreleasedReturnValue();
    [v16 UTF8String];
    if (a1[15])
    {
      sub_10001AA8C(a1, a2[4]);
      id v21 = objc_claimAutoreleasedReturnValue();
      [v21 UTF8String];
      sub_100019F44((uint64_t)a1, v29, 1, "%*s%*s%*s%*s%*s %10d    %s%*s\n", v22, v23, v24, v25, v28);
    }
    else
    {
      sub_100019F44((uint64_t)a1, v29, 1, "%*s%*s%*s%*s%*s %10d    %s%*s\n", v17, v18, v19, v20, v28);
    }

    if ((v14 & 2) != 0) {
    id v10 = v29;
    }
  }

  return _objc_release_x1(v5, v10);
}

void sub_10001B920(uint64_t a1, char *__format, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a1)
  {
    va_list v18 = (va_list)&a9;
    if (!*(void *)(a1 + 64))
    {
      vfprintf(*(FILE **)(a1 + 136), __format, v18);
      return;
    }
    char v11 = v17;
    unsigned int v12 = vsnprintf(v17, 0xC8uLL, __format, v18);
    if ((v12 & 0x80000000) == 0)
    {
      if (v12 < 0xC9)
      {
LABEL_8:
        id v16 = [objc_alloc((Class)NSString) initWithCString:v11 encoding:4];
LABEL_11:
        sub_10001CF08((void *)a1, 0, 2, v16);

        return;
      }
      uint64_t v13 = 200;
      while (1)
      {
        unint64_t v14 = v13 + 200;
        char v11 = (char *)&v18 - ((v13 + 215) & 0xFFFFFFFFFFFFFFF0);
        unsigned int v15 = vsnprintf(v11, v13 + 200, __format, v18);
        if ((v15 & 0x80000000) != 0) {
          break;
        }
        uint64_t v13 = v14;
        if (v14 >= v15) {
          goto LABEL_8;
        }
      }
    }
    id v16 = 0;
    goto LABEL_11;
  }
}

void sub_10001BADC(void *a1, void *a2, void *a3)
{
  if (a1)
  {
    id v5 = a3;
    id v11 = a2;
    sub_100019F44((uint64_t)a1, v5, 1, "Auxiliary data:\n", v6, v7, v8, v9, v10);
    sub_10001C294(a1, v11, 1, v5);
  }
}

void sub_10001C294(void *a1, void *a2, int a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v9 = [v7 allKeys];
  char v10 = [v9 sortedArrayUsingSelector:"caseInsensitiveCompare:"];

  id obj = v10;
  id v44 = [v10 countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (v44)
  {
    uint64_t v11 = *(void *)v46;
    unsigned int v41 = a3 + 1;
    int v42 = a3;
    do
    {
      for (unint64_t i = 0; i != v44; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v46 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        va_list v18 = [v7 objectForKeyedSubscript:v13];
        for (int j = a3; j; --j)
          sub_100019F44((uint64_t)a1, v8, 1, "    ", v14, v15, v16, v17, v40);
        if (objc_msgSend(v18, "fp_isContainer"))
        {
          char v20 = [v13 UTF8String];
          sub_100019F44((uint64_t)a1, v8, 1, "%s:\n", v21, v22, v23, v24, v20);
          sub_10001C294(a1, v18, v41, v8);
        }
        else
        {
          uint64_t v25 = v11;
          id v26 = v7;
          id v27 = v18;
          if ([v27 supportsFormattedValue])
          {
            char v28 = [v13 UTF8String];
            [v27 formattedValue];
            sub_100019F44((uint64_t)a1, v8, 1, "%s: %s\n", v29, v30, v31, v32, v28);
          }
          else
          {
            id v33 = [v27 value];
            char v34 = [v13 UTF8String];
            sub_10001AA8C(a1, (uint64_t)v33);
            id v35 = objc_claimAutoreleasedReturnValue();
            [v35 UTF8String];
            sub_100019F44((uint64_t)a1, v8, 1, "%s: %s\n", v36, v37, v38, v39, v34);
          }
          id v7 = v26;
          uint64_t v11 = v25;
          a3 = v42;
        }
      }
      id v44 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
    }
    while (v44);
  }
}

void sub_10001C52C(uint64_t a1, id *a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v3 = a3;
    while (1)
    {
      id v6 = *a2;
      uint64_t v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
      id v8 = (void *)v7;
      uint64_t v9 = *(void *)(a1 + 40);
      if (*(unsigned char *)(v9 + 56)) {
        BOOL v10 = 1;
      }
      else {
        BOOL v10 = v7 == 0;
      }
      if (v10) {
        goto LABEL_9;
      }
      if (([*(id *)(v7 + 24) verbose] & 1) == 0) {
        break;
      }
LABEL_25:

      ++a2;
      if (!--v3) {
        return;
      }
    }
    uint64_t v9 = *(void *)(a1 + 40);
LABEL_9:
    uint64_t v11 = sub_10001D488((uint64_t)v8);
    unsigned int v12 = sub_10001A534(v9, v11);

    id v35 = v12;
    id v34 = [v35 UTF8String];
    sub_10001D42C((id *)v8);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    if (!v13) {
      id v13 = v6;
    }
    uint64_t v14 = *(void **)(a1 + 40);
    if (v14[14] == 1) {
      char v15 = 7;
    }
    else {
      char v15 = 11;
    }
    char v29 = v15;
    uint64_t v30 = *(void **)(a1 + 48);
    uint64_t v31 = *(void *)(a1 + 40);
    sub_10001AA8C(v14, (uint64_t)[v8 totalDirtySize] + [v8 totalSwappedSize]);
    id v32 = objc_claimAutoreleasedReturnValue();
    [v32 UTF8String];
    uint64_t v16 = *(void **)(a1 + 40);
    uint64_t v28 = v16[15];
    id v33 = v6;
    if ((v28 & 2) != 0)
    {
      sub_10001AA8C(v16, (uint64_t)[v8 totalSwappedSize]);
      id v26 = objc_claimAutoreleasedReturnValue();
      [v26 UTF8String];
      uint64_t v16 = *(void **)(a1 + 40);
    }
    sub_10001AA8C(v16, (uint64_t)[v8 totalCleanSize]);
    id v27 = objc_claimAutoreleasedReturnValue();
    [v27 UTF8String];
    sub_10001AA8C(*(void **)(a1 + 40), (uint64_t)[v8 totalReclaimableSize]);
    id v17 = objc_claimAutoreleasedReturnValue();
    [v17 UTF8String];
    va_list v18 = *(void **)(a1 + 40);
    uint64_t v19 = v18[15];
    if (v19)
    {
      sub_10001AA8C(v18, (uint64_t)[v8 totalWiredSize]);
      id v25 = objc_claimAutoreleasedReturnValue();
      [v25 UTF8String];
    }
    [v8 totalRegions];
    id v20 = v13;
    [v20 UTF8String];
    if (v34) {
      [v35 length];
    }
    sub_100019F44(v31, v30, 1, "%*s%*s%*s%*s%*s %10d    %s%*s\n", v21, v22, v23, v24, v29);
    if (v19) {

    }
    if ((v28 & 2) != 0) {
    id v6 = v33;
    }
    goto LABEL_25;
  }
}

int64_t sub_10001CD64(id a1, FPMemoryCategory *a2, FPMemoryCategory *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [(FPMemoryCategory *)v4 totalDirtySize];
  uint64_t v7 = &v6[[(FPMemoryCategory *)v4 totalSwappedSize]];
  id v8 = [(FPMemoryCategory *)v5 totalDirtySize];
  if (v7 > &v8[[(FPMemoryCategory *)v5 totalSwappedSize]]) {
    goto LABEL_7;
  }
  uint64_t v9 = [(FPMemoryCategory *)v4 totalDirtySize];
  BOOL v10 = &v9[[(FPMemoryCategory *)v4 totalSwappedSize]];
  uint64_t v11 = [(FPMemoryCategory *)v5 totalDirtySize];
  if (v10 >= &v11[[(FPMemoryCategory *)v5 totalSwappedSize]])
  {
    id v12 = [(FPMemoryCategory *)v4 totalReclaimableSize];
    if (v12 <= (id)[(FPMemoryCategory *)v5 totalReclaimableSize])
    {
      id v13 = [(FPMemoryCategory *)v4 totalReclaimableSize];
      if (v13 < (id)[(FPMemoryCategory *)v5 totalReclaimableSize]) {
        goto LABEL_5;
      }
      id v15 = [(FPMemoryCategory *)v4 totalCleanSize];
      if (v15 <= (id)[(FPMemoryCategory *)v5 totalCleanSize])
      {
        id v17 = [(FPMemoryCategory *)v4 totalCleanSize];
        int64_t v14 = v17 < (id)[(FPMemoryCategory *)v5 totalCleanSize];
        goto LABEL_8;
      }
    }
LABEL_7:
    int64_t v14 = -1;
    goto LABEL_8;
  }
LABEL_5:
  int64_t v14 = 1;
LABEL_8:

  return v14;
}

uint64_t sub_10001CE98(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = a3;
  unint64_t v8 = v6(a2, v5);
  unint64_t v9 = (*(uint64_t (**)(id, void))(a1 + 32))(v7, *(void *)(a1 + 40));

  if (v8 > v9) {
    return -1;
  }
  else {
    return v8 < v9;
  }
}

void sub_10001CF08(void *a1, void *a2, int a3, void *a4)
{
  id v25 = a2;
  id v7 = a4;
  if (v7)
  {
    if (a3 == 2)
    {
      unint64_t v8 = (void *)a1[13];
LABEL_7:
      [v8 appendString:v7];
      goto LABEL_17;
    }
    if (a3 != 1)
    {
      if (a3) {
        goto LABEL_17;
      }
      unint64_t v8 = (void *)a1[12];
      goto LABEL_7;
    }
    unint64_t v9 = (void *)a1[11];
    BOOL v10 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v25 pid]);
    id v11 = [v9 objectForKeyedSubscript:v10];

    if (!v11)
    {
      id v11 = objc_alloc_init((Class)NSMutableArray);
      id v12 = (void *)a1[11];
      id v13 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v25 pid]);
      [v12 setObject:v11 forKeyedSubscript:v13];
    }
    int64_t v14 = [v11 lastObject];
    id v15 = v14;
    if (v14 && ![v14 hasSuffix:@"\n"])
    {
      uint64_t v16 = [v15 stringByAppendingString:v7];
      [v11 setObject:v16 atIndexedSubscript:[v11 count] - 1];
    }
    else
    {
      [v11 addObject:v7];
    }
    id v17 = [v7 length];
    va_list v18 = (void *)a1[9];
    uint64_t v19 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v25 pid]);
    id v20 = [v18 objectForKeyedSubscript:v19];
    id v21 = [v20 integerValue];

    if (v17 > v21)
    {
      uint64_t v22 = +[NSNumber numberWithUnsignedInteger:v17];
      uint64_t v23 = (void *)a1[9];
      uint64_t v24 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v25 pid]);
      [v23 setObject:v22 forKeyedSubscript:v24];
    }
  }
LABEL_17:
}

void sub_10001D1F0(id a1)
{
  uint64_t v1 = 0;
  uint64_t v2 = 40;
  do
  {
    uint64_t v3 = 2 * v2;
    uint64_t v10 = 2 * v2;
    uint64_t v1 = malloc_type_realloc(v1, 192 * v2, 0x1000040565EDBD2uLL);
    if ((ledger() & 0x80000000) != 0)
    {
      free(v1);
      qword_100038A78 = -1;
      perror("Unable to retrieve ledger template info");
      return;
    }
    uint64_t v2 = v3;
  }
  while (v3 == v10);
  qword_100038A78 = v10;
  *(void *)&long long v4 = -1;
  *((void *)&v4 + 1) = -1;
  xmmword_100038A58 = v4;
  *(_OWORD *)algn_100038A68 = v4;
  if (v10 >= 1)
  {
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    do
    {
      unsigned __int8 v7 = 0;
      while (1)
      {
        unsigned int v8 = v7;
        unint64_t v9 = sub_10001D340(v7);
        if (v9)
        {
          if (!strcmp(v9, (const char *)v1 + 96 * v5)) {
            break;
          }
        }
        ++v7;
        if (v8 >= 3) {
          goto LABEL_12;
        }
      }
      *((void *)&xmmword_100038A58 + v7) = v5;
      if (++v6 == 4) {
        break;
      }
LABEL_12:
      ++v5;
    }
    while (v5 < qword_100038A78);
  }
  free(v1);
}

char *sub_10001D340(unsigned int a1)
{
  if (a1 < 4) {
    return off_100029F00[a1];
  }
  _os_assert_log();
  size_t result = (char *)_os_crash();
  __break(1u);
  return result;
}

double sub_10001D3CC(void *a1, char a2)
{
  if (a1)
  {
    v5.receiver = a1;
    v5.super_class = (Class)FPMemoryCategory;
    uint64_t v3 = [super init];
    if (v3)
    {
      v3[8] = a2;
      double result = 0.0;
      *((_OWORD *)v3 + 2) = 0u;
      *((_OWORD *)v3 + 3) = 0u;
      *((void *)v3 + _Block_object_dispose(&STACK[0x2B0], 8) = 0;
    }
  }
  return result;
}

id *sub_10001D42C(id *a1)
{
  if (a1)
  {
    uint64_t v2 = a1;
    id v3 = a1[2];
    if (!v3)
    {
      uint64_t v4 = [a1[3] name];
      id v5 = v2[2];
      v2[2] = (id)v4;

      id v3 = v2[2];
    }
    a1 = (id *)v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

id sub_10001D488(uint64_t a1)
{
  if (a1)
  {
    if (*(unsigned char *)(a1 + 8))
    {
      a1 = 0;
    }
    else
    {
      a1 = [*(id *)(a1 + 24) detailedName];
    }
    uint64_t v1 = vars8;
  }
  return (id)a1;
}

id sub_10001D4CC(uint64_t a1)
{
  if (a1)
  {
    if (*(unsigned char *)(a1 + 8)) {
      sub_10001D42C((id *)a1);
    }
    else {
    a1 = [*(id *)(a1 + 24) fullName];
    }
    uint64_t v1 = vars8;
  }
  return (id)a1;
}

id *sub_10001D514(id *a1)
{
  uint64_t v1 = a1;
  if (a1)
  {
    uint64_t v2 = [a1[3] auxData];
    id v3 = v2;
    if (*((unsigned char *)v1 + 8))
    {
      uint64_t v1 = v2;
    }
    else
    {
      uint64_t v1 = [v1[3] detailedAuxData];
      if (v3)
      {
        uint64_t v4 = [v3 fp_mergeWithData:v1 forceAggregate:1];

        uint64_t v1 = (id *)v4;
      }
    }
  }

  return v1;
}

id sub_10001D5B0(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = [*(id *)(a1 + 24) auxDataName];
    id v3 = v2;
    if (*(unsigned char *)(a1 + 8))
    {
      id v4 = v2;
    }
    else
    {
      id v5 = [*(id *)(a1 + 24) detailedAuxDataName];
      if ([v5 length]) {
        id v6 = [objc_alloc((Class)NSString) initWithFormat:@"%@ %@", v3, v5];
      }
      else {
        id v6 = v3;
      }
      id v4 = v6;
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

uint64_t sub_10001D66C(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v5 = v4;
  if (a1)
  {
    unsigned __int8 v7 = v4;
    if (!*(void *)(a1 + 24))
    {
      objc_storeStrong((id *)(a1 + 24), a2);
      id v5 = v7;
    }
    *(void *)(a1 + 32) += [v5 dirtySize];
    *(void *)(a1 + 40) += [v7 swappedSize];
    *(void *)(a1 + 48) += [v7 cleanSize];
    *(void *)(a1 + 56) += [v7 reclaimableSize];
    *(void *)(a1 + 64) += [v7 wiredSize];
    id v4 = [v7 totalRegions];
    id v5 = v7;
    *(_DWORD *)(a1 + 12) += v4;
  }

  return _objc_release_x1(v4, v5);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFDictionaryReplaceValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t CSIsNull()
{
  return _CSIsNull();
}

uint64_t CSRelease()
{
  return _CSRelease();
}

uint64_t CSSourceInfoGetLineNumber()
{
  return _CSSourceInfoGetLineNumber();
}

uint64_t CSSourceInfoGetPath()
{
  return _CSSourceInfoGetPath();
}

uint64_t CSSymbolGetName()
{
  return _CSSymbolGetName();
}

uint64_t CSSymbolicatorCreateWithMachKernelFlagsAndNotification()
{
  return _CSSymbolicatorCreateWithMachKernelFlagsAndNotification();
}

uint64_t CSSymbolicatorGetFlagsForNListOnlyData()
{
  return _CSSymbolicatorGetFlagsForNListOnlyData();
}

uint64_t CSSymbolicatorGetSourceInfoWithAddressAtTime()
{
  return _CSSymbolicatorGetSourceInfoWithAddressAtTime();
}

uint64_t CSSymbolicatorGetSymbolWithAddressAtTime()
{
  return _CSSymbolicatorGetSymbolWithAddressAtTime();
}

NSArray *__cdecl NSAllMapTableKeys(NSMapTable *table)
{
  return _NSAllMapTableKeys(table);
}

NSArray *__cdecl NSAllMapTableValues(NSMapTable *table)
{
  return _NSAllMapTableValues(table);
}

uint64_t NSLocalizedFileSizeDescription()
{
  return _NSLocalizedFileSizeDescription();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t OSKextCopyLoadedKextInfo()
{
  return _OSKextCopyLoadedKextInfo();
}

uint64_t VMURegionTypeDescriptionForTagShareProtAndPager()
{
  return _VMURegionTypeDescriptionForTagShareProtAndPager();
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
  return ___error();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return ___maskrune(a1, a2);
}

uint64_t __strlcpy_chk()
{
  return ___strlcpy_chk();
}

uint64_t _os_assert_log()
{
  return __os_assert_log();
}

uint64_t _os_crash()
{
  return __os_crash();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return _clock_gettime_nsec_np(__clock_id);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return _dispatch_source_get_data(source);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

uint64_t dyld_image_for_each_segment_info()
{
  return _dyld_image_for_each_segment_info();
}

uint64_t dyld_image_get_file_path()
{
  return _dyld_image_get_file_path();
}

uint64_t dyld_image_get_installname()
{
  return _dyld_image_get_installname();
}

uint64_t dyld_process_create_for_task()
{
  return _dyld_process_create_for_task();
}

uint64_t dyld_process_dispose()
{
  return _dyld_process_dispose();
}

uint64_t dyld_process_snapshot_create_for_process()
{
  return _dyld_process_snapshot_create_for_process();
}

uint64_t dyld_process_snapshot_dispose()
{
  return _dyld_process_snapshot_dispose();
}

uint64_t dyld_process_snapshot_for_each_image()
{
  return _dyld_process_snapshot_for_each_image();
}

uint64_t dyld_process_snapshot_get_shared_cache()
{
  return _dyld_process_snapshot_get_shared_cache();
}

uint64_t dyld_shared_cache_copy_uuid()
{
  return _dyld_shared_cache_copy_uuid();
}

uint64_t dyld_shared_cache_for_each_file()
{
  return _dyld_shared_cache_for_each_file();
}

uint64_t dyld_shared_cache_for_file()
{
  return _dyld_shared_cache_for_file();
}

uint64_t dyld_shared_cache_get_base_address()
{
  return _dyld_shared_cache_get_base_address();
}

uint64_t dyld_shared_cache_get_mapped_size()
{
  return _dyld_shared_cache_get_mapped_size();
}

uint64_t dyld_shared_cache_is_mapped_private()
{
  return _dyld_shared_cache_is_mapped_private();
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

int fflush(FILE *a1)
{
  return _fflush(a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return _fputc(a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return _fputs(a1, a2);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

uid_t geteuid(void)
{
  return _geteuid();
}

int getopt_long_only(int a1, char *const *a2, const char *a3, const option *a4, int *a5)
{
  return _getopt_long_only(a1, a2, a3, a4, a5);
}

pid_t getpid(void)
{
  return _getpid();
}

int getrlimit(int a1, rlimit *a2)
{
  return _getrlimit(a1, a2);
}

uint64_t humanize_number()
{
  return _humanize_number();
}

int isatty(int a1)
{
  return _isatty(a1);
}

uint64_t ledger()
{
  return _ledger();
}

void mach_error(const char *str, mach_error_t error_value)
{
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return _mach_error_string(error_value);
}

uint64_t mach_get_times()
{
  return _mach_get_times();
}

mach_port_t mach_host_self(void)
{
  return _mach_host_self();
}

kern_return_t mach_memory_info(mach_port_t host, mach_zone_name_array_t *names, mach_msg_type_number_t *namesCnt, mach_zone_info_array_t *info, mach_msg_type_number_t *infoCnt, mach_memory_info_array_t *memory_info, mach_msg_type_number_t *memory_infoCnt)
{
  return _mach_memory_info(host, names, namesCnt, info, infoCnt, memory_info, memory_infoCnt);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return _mach_port_deallocate(task, name);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return _mach_port_mod_refs(task, name, right, delta);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

kern_return_t mach_vm_page_range_query(vm_map_read_t target_map, mach_vm_offset_t address, mach_vm_size_t size, mach_vm_address_t dispositions, mach_vm_size_t *dispositions_count)
{
  return _mach_vm_page_range_query(target_map, address, size, dispositions, dispositions_count);
}

kern_return_t mach_vm_purgable_control(vm_map_t target_task, mach_vm_address_t address, vm_purgable_t control, int *state)
{
  return _mach_vm_purgable_control(target_task, address, control, state);
}

kern_return_t mach_vm_region(vm_map_read_t target_task, mach_vm_address_t *address, mach_vm_size_t *size, vm_region_flavor_t flavor, vm_region_info_t info, mach_msg_type_number_t *infoCnt, mach_port_t *object_name)
{
  return _mach_vm_region(target_task, address, size, flavor, info, infoCnt, object_name);
}

kern_return_t mach_vm_region_recurse(vm_map_read_t target_task, mach_vm_address_t *address, mach_vm_size_t *size, natural_t *nesting_depth, vm_region_recurse_info_t info, mach_msg_type_number_t *infoCnt)
{
  return _mach_vm_region_recurse(target_task, address, size, nesting_depth, info, infoCnt);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_realloc(ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

uint64_t memorystatus_control()
{
  return _memorystatus_control();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

void objc_moveWeak(id *to, id *from)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_content()
{
  return _os_variant_has_internal_content();
}

uint64_t pdwriter_close()
{
  return _pdwriter_close();
}

uint64_t pdwriter_new_group()
{
  return _pdwriter_new_group();
}

uint64_t pdwriter_new_value()
{
  return _pdwriter_new_value();
}

uint64_t pdwriter_open()
{
  return _pdwriter_open();
}

uint64_t pdwriter_record_label_str()
{
  return _pdwriter_record_label_str();
}

uint64_t pdwriter_record_tag()
{
  return _pdwriter_record_tag();
}

uint64_t pdwriter_record_variable_dbl()
{
  return _pdwriter_record_variable_dbl();
}

uint64_t pdwriter_record_variable_str()
{
  return _pdwriter_record_variable_str();
}

uint64_t pdwriter_set_description()
{
  return _pdwriter_set_description();
}

uint64_t pdwriter_set_primary_metric()
{
  return _pdwriter_set_primary_metric();
}

void perror(const char *a1)
{
}

int proc_get_dirty(pid_t pid, uint32_t *flags)
{
  return _proc_get_dirty(pid, flags);
}

int proc_listallpids(void *buffer, int buffersize)
{
  return _proc_listallpids(buffer, buffersize);
}

int proc_pid_rusage(int pid, int flavor, rusage_info_t *buffer)
{
  return _proc_pid_rusage(pid, flavor, buffer);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return _proc_pidinfo(pid, flavor, arg, buffer, buffersize);
}

int proc_regionfilename(int pid, uint64_t address, void *buffer, uint32_t buffersize)
{
  return _proc_regionfilename(pid, address, buffer, buffersize);
}

int setrlimit(int a1, const rlimit *a2)
{
  return _setrlimit(a1, a2);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return _strcasecmp(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

int strerror_r(int __errnum, char *__strerrbuf, size_t __buflen)
{
  return _strerror_r(__errnum, __strerrbuf, __buflen);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return _strnstr(__big, __little, __len);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return _strtol(__str, __endptr, __base);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return _strtoll(__str, __endptr, __base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

kern_return_t task_generate_corpse(task_read_t task, mach_port_t *corpse_task_port)
{
  return _task_generate_corpse(task, corpse_task_port);
}

kern_return_t task_map_corpse_info_64(task_t task, task_read_t corspe_task, mach_vm_address_t *kcd_addr_begin, mach_vm_size_t *kcd_size)
{
  return _task_map_corpse_info_64(task, corspe_task, kcd_addr_begin, kcd_size);
}

uint64_t task_read_for_pid()
{
  return _task_read_for_pid();
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

int vfprintf(FILE *a1, const char *a2, va_list a3)
{
  return _vfprintf(a1, a2, a3);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return _vm_deallocate(target_task, address, size);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return _vsnprintf(__str, __size, __format, a4);
}

void warnx(const char *a1, ...)
{
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__configurePageSize(void *a1, const char *a2, ...)
{
  return [a1 _configurePageSize];
}

id objc_msgSend__gatherImageData(void *a1, const char *a2, ...)
{
  return [a1 _gatherImageData];
}

id objc_msgSend__gatherIsTranslated(void *a1, const char *a2, ...)
{
  return [a1 _gatherIsTranslated];
}

id objc_msgSend__gatherLedgers(void *a1, const char *a2, ...)
{
  return [a1 _gatherLedgers];
}

id objc_msgSend__gatherOwnedVmObjects(void *a1, const char *a2, ...)
{
  return [a1 _gatherOwnedVmObjects];
}

id objc_msgSend__gatherPageSize(void *a1, const char *a2, ...)
{
  return [a1 _gatherPageSize];
}

id objc_msgSend__gatherPhysFootprint(void *a1, const char *a2, ...)
{
  return [a1 _gatherPhysFootprint];
}

id objc_msgSend__gatherProcessState(void *a1, const char *a2, ...)
{
  return [a1 _gatherProcessState];
}

id objc_msgSend__isAlive(void *a1, const char *a2, ...)
{
  return [a1 _isAlive];
}

id objc_msgSend__populateTask(void *a1, const char *a2, ...)
{
  return [a1 _populateTask];
}

id objc_msgSend_address(void *a1, const char *a2, ...)
{
  return [a1 address];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_asNumber(void *a1, const char *a2, ...)
{
  return [a1 asNumber];
}

id objc_msgSend_auxData(void *a1, const char *a2, ...)
{
  return [a1 auxData];
}

id objc_msgSend_auxDataName(void *a1, const char *a2, ...)
{
  return [a1 auxDataName];
}

id objc_msgSend_binaryImagesDescription(void *a1, const char *a2, ...)
{
  return [a1 binaryImagesDescription];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_breakDownPhysFootprint(void *a1, const char *a2, ...)
{
  return [a1 breakDownPhysFootprint];
}

id objc_msgSend_cachedCopy(void *a1, const char *a2, ...)
{
  return [a1 cachedCopy];
}

id objc_msgSend_cleanSize(void *a1, const char *a2, ...)
{
  return [a1 cleanSize];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return [a1 close];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_configureForMultipleOutputs(void *a1, const char *a2, ...)
{
  return [a1 configureForMultipleOutputs];
}

id objc_msgSend_containsFakeRegion(void *a1, const char *a2, ...)
{
  return [a1 containsFakeRegion];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_couldHaveProcessView(void *a1, const char *a2, ...)
{
  return [a1 couldHaveProcessView];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_detailedAuxData(void *a1, const char *a2, ...)
{
  return [a1 detailedAuxData];
}

id objc_msgSend_detailedAuxDataName(void *a1, const char *a2, ...)
{
  return [a1 detailedAuxDataName];
}

id objc_msgSend_detailedName(void *a1, const char *a2, ...)
{
  return [a1 detailedName];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_didPhysFootprintDirtyAccounting(void *a1, const char *a2, ...)
{
  return [a1 didPhysFootprintDirtyAccounting];
}

id objc_msgSend_dirtyLength(void *a1, const char *a2, ...)
{
  return [a1 dirtyLength];
}

id objc_msgSend_dirtySize(void *a1, const char *a2, ...)
{
  return [a1 dirtySize];
}

id objc_msgSend_displayString(void *a1, const char *a2, ...)
{
  return [a1 displayString];
}

id objc_msgSend_doOwnedAccountingAdjustments(void *a1, const char *a2, ...)
{
  return [a1 doOwnedAccountingAdjustments];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_dyldSharedCacheRange(void *a1, const char *a2, ...)
{
  return [a1 dyldSharedCacheRange];
}

id objc_msgSend_ensureMemoryObject(void *a1, const char *a2, ...)
{
  return [a1 ensureMemoryObject];
}

id objc_msgSend_errors(void *a1, const char *a2, ...)
{
  return [a1 errors];
}

id objc_msgSend_extendedInfo(void *a1, const char *a2, ...)
{
  return [a1 extendedInfo];
}

id objc_msgSend_finalizeObject(void *a1, const char *a2, ...)
{
  return [a1 finalizeObject];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_formattedDescriptions(void *a1, const char *a2, ...)
{
  return [a1 formattedDescriptions];
}

id objc_msgSend_formattedValue(void *a1, const char *a2, ...)
{
  return [a1 formattedValue];
}

id objc_msgSend_formatter(void *a1, const char *a2, ...)
{
  return [a1 formatter];
}

id objc_msgSend_fullName(void *a1, const char *a2, ...)
{
  return [a1 fullName];
}

id objc_msgSend_globalErrors(void *a1, const char *a2, ...)
{
  return [a1 globalErrors];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_height(void *a1, const char *a2, ...)
{
  return [a1 height];
}

id objc_msgSend_hiddenFromDisplay(void *a1, const char *a2, ...)
{
  return [a1 hiddenFromDisplay];
}

id objc_msgSend_idleExitStatus(void *a1, const char *a2, ...)
{
  return [a1 idleExitStatus];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_initUniqueProcessGroup(void *a1, const char *a2, ...)
{
  return [a1 initUniqueProcessGroup];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_is64bit(void *a1, const char *a2, ...)
{
  return [a1 is64bit];
}

id objc_msgSend_isKernelPageTableMemory(void *a1, const char *a2, ...)
{
  return [a1 isKernelPageTableMemory];
}

id objc_msgSend_isTranslated(void *a1, const char *a2, ...)
{
  return [a1 isTranslated];
}

id objc_msgSend_isTranslatedByRosetta(void *a1, const char *a2, ...)
{
  return [a1 isTranslatedByRosetta];
}

id objc_msgSend_kernelPageSize(void *a1, const char *a2, ...)
{
  return [a1 kernelPageSize];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return [a1 longValue];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_mappings(void *a1, const char *a2, ...)
{
  return [a1 mappings];
}

id objc_msgSend_memoryPool(void *a1, const char *a2, ...)
{
  return [a1 memoryPool];
}

id objc_msgSend_memoryRegions(void *a1, const char *a2, ...)
{
  return [a1 memoryRegions];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_newlineCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 newlineCharacterSet];
}

id objc_msgSend_nonretainedObjectValue(void *a1, const char *a2, ...)
{
  return [a1 nonretainedObjectValue];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 objectEnumerator];
}

id objc_msgSend_ownerPid(void *a1, const char *a2, ...)
{
  return [a1 ownerPid];
}

id objc_msgSend_pageSize(void *a1, const char *a2, ...)
{
  return [a1 pageSize];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_physFootprint(void *a1, const char *a2, ...)
{
  return [a1 physFootprint];
}

id objc_msgSend_physicalFootprint(void *a1, const char *a2, ...)
{
  return [a1 physicalFootprint];
}

id objc_msgSend_physicalFootprintPeak(void *a1, const char *a2, ...)
{
  return [a1 physicalFootprintPeak];
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return [a1 pid];
}

id objc_msgSend_pixelFormat(void *a1, const char *a2, ...)
{
  return [a1 pixelFormat];
}

id objc_msgSend_printHeader(void *a1, const char *a2, ...)
{
  return [a1 printHeader];
}

id objc_msgSend_priority(void *a1, const char *a2, ...)
{
  return [a1 priority];
}

id objc_msgSend_processDescriptionString(void *a1, const char *a2, ...)
{
  return [a1 processDescriptionString];
}

id objc_msgSend_processIDs(void *a1, const char *a2, ...)
{
  return [a1 processIDs];
}

id objc_msgSend_processName(void *a1, const char *a2, ...)
{
  return [a1 processName];
}

id objc_msgSend_processes(void *a1, const char *a2, ...)
{
  return [a1 processes];
}

id objc_msgSend_purgeable(void *a1, const char *a2, ...)
{
  return [a1 purgeable];
}

id objc_msgSend_reclaimableSize(void *a1, const char *a2, ...)
{
  return [a1 reclaimableSize];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_residentLength(void *a1, const char *a2, ...)
{
  return [a1 residentLength];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_sharedCache(void *a1, const char *a2, ...)
{
  return [a1 sharedCache];
}

id objc_msgSend_shouldAggregate(void *a1, const char *a2, ...)
{
  return [a1 shouldAggregate];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_stringByResolvingSymlinksInPath(void *a1, const char *a2, ...)
{
  return [a1 stringByResolvingSymlinksInPath];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_strongToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return [a1 strongToStrongObjectsMapTable];
}

id objc_msgSend_supportsFormattedValue(void *a1, const char *a2, ...)
{
  return [a1 supportsFormattedValue];
}

id objc_msgSend_surfaceDescriptions(void *a1, const char *a2, ...)
{
  return [a1 surfaceDescriptions];
}

id objc_msgSend_surfaceID(void *a1, const char *a2, ...)
{
  return [a1 surfaceID];
}

id objc_msgSend_swappedSize(void *a1, const char *a2, ...)
{
  return [a1 swappedSize];
}

id objc_msgSend_systemTimeZone(void *a1, const char *a2, ...)
{
  return [a1 systemTimeZone];
}

id objc_msgSend_task(void *a1, const char *a2, ...)
{
  return [a1 task];
}

id objc_msgSend_totalCleanSize(void *a1, const char *a2, ...)
{
  return [a1 totalCleanSize];
}

id objc_msgSend_totalDirtySize(void *a1, const char *a2, ...)
{
  return [a1 totalDirtySize];
}

id objc_msgSend_totalReclaimableSize(void *a1, const char *a2, ...)
{
  return [a1 totalReclaimableSize];
}

id objc_msgSend_totalRegions(void *a1, const char *a2, ...)
{
  return [a1 totalRegions];
}

id objc_msgSend_totalSwappedSize(void *a1, const char *a2, ...)
{
  return [a1 totalSwappedSize];
}

id objc_msgSend_totalWiredSize(void *a1, const char *a2, ...)
{
  return [a1 totalWiredSize];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_verbose(void *a1, const char *a2, ...)
{
  return [a1 verbose];
}

id objc_msgSend_virtualAddress(void *a1, const char *a2, ...)
{
  return [a1 virtualAddress];
}

id objc_msgSend_vmPageSize(void *a1, const char *a2, ...)
{
  return [a1 vmPageSize];
}

id objc_msgSend_warnings(void *a1, const char *a2, ...)
{
  return [a1 warnings];
}

id objc_msgSend_weakToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return [a1 weakToStrongObjectsMapTable];
}

id objc_msgSend_width(void *a1, const char *a2, ...)
{
  return [a1 width];
}

id objc_msgSend_wired(void *a1, const char *a2, ...)
{
  return [a1 wired];
}

id objc_msgSend_wiredSize(void *a1, const char *a2, ...)
{
  return [a1 wiredSize];
}