int64x2_t *sub_21E8549C8(int64x2_t *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  int64x2_t *v5;

  if (result)
  {
    v5 = result;
    result = sub_21E854A18((int64x2_t *)result->i64[1], a2, a3, a4, *a5, a5[1], a5[2], a5[3], a5[4]);
    v5->i64[1] = (uint64_t)result;
  }
  return result;
}

int64x2_t *sub_21E854A18(int64x2_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  v17 = (int64x2_t *)malloc_type_malloc(0x40uLL, 0x1020040D3BB1902uLL);
  v18 = v17;
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
  v19 = 0;
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
  v24 = a1;
  v18[3].i64[0] = a9;
  v18[3].i64[1] = 0;
  do
  {
    v25 = (uint64_t *)v24;
    if (((v24->i64[0] + v20 + v24->i64[1]) & (unint64_t)v21) >= v22)
    {
      v25 = v19;
      if ((v24->i64[0] & (unint64_t)v21) > v23)
      {
        v25 = v19;
        if (!v19) {
          goto LABEL_12;
        }
LABEL_7:
        v26 = (int64x2_t *)v25[7];
        if (v26 == v24)
        {
          v25[7] = (uint64_t)v18;
          v18[3].i64[1] = (uint64_t)v24;
          return a1;
        }
        v27 = a1;
        if (v26) {
          goto LABEL_14;
        }
        return v27;
      }
    }
    v24 = (int64x2_t *)v24[3].i64[1];
    v19 = v25;
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
  v26 = a1;
  v27 = v18;
LABEL_14:
  if (v26 == v24) {
    return v27;
  }
  do
  {
    v28 = v26;
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
    v26 = (int64x2_t *)v26[3].i64[1];
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
    v27 = a1;
  }
  while (v26 != v24);
  return a1;
}

uint64_t sub_21E854C6C(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = a2;
  v6 = v5;
  if (a1)
  {
    v5 = *(int64x2_t **)(a1 + 8);
    v9 = v6;
    for (i = (uint64_t *)v6->i64[1]; i; i = (uint64_t *)i[7])
      v5 = sub_21E854A18(v5, *i, i[1], a3, i[3], i[4], i[2], i[5], i[6]);
    *(void *)(a1 + 8) = v5;
    v6 = v9;
  }

  return MEMORY[0x270F9A758](v5, v6);
}

void sub_21E854CF8(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a1)
  {
    id v7 = v5;
    v6 = [v5 subrangeList];
    if (v6) {
      sub_21E854C6C(a1, v6, a3);
    }
    else {
      *(void *)(a1 + 8) = sub_21E854A18(*(int64x2_t **)(a1 + 8), [v7 offset], [v7 size], a3, [v7 dirtySize], [v7 swappedSize], [v7 cleanSize], [v7 reclaimableSize], [v7 wiredSize]);
    }

    id v5 = v7;
  }
}

uint64_t sub_21E854E0C@<X0>(uint64_t result@<X0>, int64x2_t *a2@<X8>)
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

id sub_21E854EBC(void *a1)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = sub_21E8551B0;
  v31[3] = &unk_2644CA368;
  id v6 = v2;
  id v32 = v6;
  id v7 = v3;
  id v33 = v7;
  id v8 = v4;
  id v34 = v8;
  id v9 = v5;
  id v35 = v9;
  v26 = v1;
  [v1 enumerateObjectsUsingBlock:v31];
  v25 = v6;
  v10 = [v6 keysSortedByValueUsingComparator:&unk_26CFD24A0];
  id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v36 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        v18 = [v7 objectForKeyedSubscript:v17];

        if (v18)
        {
          v19 = [v7 objectForKeyedSubscript:v17];
          [v11 addObject:v19];
        }
        uint64_t v20 = [v8 objectForKeyedSubscript:v17];

        if (v20)
        {
          uint64_t v21 = [v8 objectForKeyedSubscript:v17];
          [v11 addObject:v21];
        }
        unint64_t v22 = [v9 objectForKeyedSubscript:v17];

        if (v22)
        {
          unint64_t v23 = [v9 objectForKeyedSubscript:v17];
          [v11 addObject:v23];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v36 count:16];
    }
    while (v14);
  }

  return v11;
}

void sub_21E8551B0(id *a1, void *a2)
{
  id v13 = a2;
  id v3 = sub_21E86BDF8(v13);
  if (v3)
  {
    id v4 = [a1[4] objectForKeyedSubscript:v3];
    uint64_t v5 = [v4 unsignedIntValue];

    id v6 = [NSNumber numberWithUnsignedInteger:v5 + 1];
    [a1[4] setObject:v6 forKeyedSubscript:v3];

    if ([v13 hasSuffix:@".memgraph"])
    {
      if ([v13 containsString:qword_267D45C40])
      {
        id v9 = a1[5];
        id v8 = a1 + 5;
        id v7 = v9;
      }
      else
      {
        id v11 = a1[6];
        id v8 = a1 + 6;
        id v7 = v11;
      }
    }
    else
    {
      if (![v13 hasSuffix:@".lite_diag"]) {
        goto LABEL_10;
      }
      id v10 = a1[7];
      id v8 = a1 + 7;
      id v7 = v10;
    }
    id v12 = [v7 objectForKeyedSubscript:v3];

    if (!v12) {
      [*v8 setObject:v13 forKeyedSubscript:v3];
    }
  }
LABEL_10:
}

uint64_t sub_21E8552D4(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unsigned int v6 = [v4 unsignedIntValue];
  if (v6 <= [v5 unsignedIntValue])
  {
    unsigned int v8 = [v4 unsignedIntValue];
    uint64_t v7 = v8 < [v5 unsignedIntValue];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

uint64_t sub_21E8555B0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_FAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    unsigned int v8 = [a3 localizedDescription];
    int v9 = 138412802;
    uint64_t v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    _os_log_fault_impl(&dword_21E853000, MEMORY[0x263EF8438], OS_LOG_TYPE_FAULT, "CacheEnumerator error for %@ at volume %@: %@\n", (uint8_t *)&v9, 0x20u);
  }
  return 1;
}

id sub_21E856240(void *a1, unint64_t a2, unint64_t *a3)
{
  v16 = a3;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a1;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    unint64_t v9 = 0;
    uint64_t v10 = *(void *)v19;
    uint64_t v11 = *MEMORY[0x263EFF688];
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v19 != v10) {
        objc_enumerationMutation(v6);
      }
      uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * v12);
      uint64_t v14 = [NSURL fileURLWithPath:v13, v16];
      [v5 addObject:v13];
      id v17 = 0;
      [v14 getResourceValue:&v17 forKey:v11 error:0];
      v9 += [v17 unsignedLongLongValue];

      if (v9 > a2) {
        break;
      }
      if (v8 == ++v12)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    unint64_t v9 = 0;
  }

  if (v16) {
    unint64_t *v16 = v9;
  }

  return v5;
}

id sub_21E8563E4(void *a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v2 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:-86400.0];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    uint64_t v7 = *MEMORY[0x263EFF610];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v10 = [NSURL fileURLWithPath:v9];
        id v14 = 0;
        [v10 getResourceValue:&v14 forKey:v7 error:0];
        id v11 = v14;
        if (v11 && ([v2 compare:v11] == -1 || !objc_msgSend(v2, "compare:", v11))) {
          [v13 addObject:v9];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }

  return v13;
}

id sub_21E8565A8(void *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if ((objc_msgSend(v4, "containsObject:", v11, (void)v13) & 1) == 0) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

uint64_t sub_21E8566F0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!a1) {
    goto LABEL_12;
  }
  mach_vm_size_t v9 = 0;
  mach_vm_address_t kcd_addr_begin = 0;
  id v4 = (unsigned int *)MEMORY[0x263EF8960];
  if (task_map_corpse_info_64(*MEMORY[0x263EF8960], a1, &kcd_addr_begin, &v9))
  {
LABEL_11:
    a1 = 0;
    goto LABEL_12;
  }
  id v5 = (_DWORD *)kcd_addr_begin;
  unint64_t v6 = v9 + kcd_addr_begin;
  mach_vm_address_t v7 = kcd_addr_begin + 16;
  if (kcd_addr_begin + 16 > v9 + kcd_addr_begin
    || v7 + *(unsigned int *)(kcd_addr_begin + 4) > v6
    || *(_DWORD *)kcd_addr_begin != -559025833)
  {
    MEMORY[0x223C32D90](*v4, kcd_addr_begin);
    goto LABEL_11;
  }
  do
  {
    if (v7 + v5[1] > v6) {
      break;
    }
    if (*v5 == -242132755) {
      break;
    }
    v3[2](v3, v5, v6);
    id v5 = (_DWORD *)(v7 + v5[1]);
    mach_vm_address_t v7 = (mach_vm_address_t)(v5 + 4);
  }
  while ((unint64_t)(v5 + 4) <= v6);
  MEMORY[0x223C32D90](*v4, kcd_addr_begin, v9);
  a1 = 1;
LABEL_12:

  return a1;
}

id sub_21E856820(uint64_t a1)
{
  if (a1)
  {
    a1 = [NSString stringWithFormat:@"%@ [%d]", *(void *)(a1 + 64), *(unsigned int *)(a1 + 28)];
    uint64_t v1 = vars8;
  }
  return (id)a1;
}

id sub_21E856D74(int a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  if (proc_pidpath(a1, buffer, 0x400u) < 1) {
    uint64_t v1 = 0;
  }
  else {
    uint64_t v1 = (void *)[[NSString alloc] initWithUTF8String:buffer];
  }

  return v1;
}

void *sub_21E856E04(int a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  size_t size = 0;
  *(void *)uint64_t v4 = 0xE00000001;
  int v5 = 1;
  int v6 = a1;
  if (sysctl(v4, 4u, 0, &size, 0, 0) < 0) {
    return 0;
  }
  uint64_t v1 = malloc_type_malloc(size, 0xC52EB313uLL);
  if (v1 && sysctl(v4, 4u, v1, &size, 0, 0) < 0)
  {
    free(v1);
    return 0;
  }
  return v1;
}

id sub_21E856ED4(uint64_t a1, uint64_t a2)
{
  id v3 = (void *)[objc_alloc(MEMORY[0x263EFF910]) initWithTimeIntervalSince1970:(double)a1];
  uint64_t v4 = [v3 dateByAddingTimeInterval:(double)a2 / 1000000.0];

  return v4;
}

id sub_21E856F44(unint64_t a1)
{
  if (a1 >= 2)
  {
    uint64_t v2 = xpc_coalition_copy_info();
    id v3 = (void *)v2;
    if (v2 && MEMORY[0x223C32E70](v2) == MEMORY[0x263EF8708]) {
      id v1 = v3;
    }
    else {
      id v1 = 0;
    }
  }
  else
  {
    id v1 = 0;
  }

  return v1;
}

__CFString *sub_21E856FBC(int a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    Copy = 0;
    goto LABEL_16;
  }
  if (a1 != 1)
  {
    Copy = MREBundleStringForUnbundledProcess;
    goto LABEL_16;
  }
  uint64_t v7 = (void *)[objc_alloc(NSURL) initFileURLWithPath:v5];
  if (!v7)
  {
LABEL_14:
    Copy = 0;
    goto LABEL_15;
  }
  uint64_t v8 = (__CFBundle *)_CFBundleCreateWithExecutableURLIfLooksLikeBundle();
  if (!v8) {
    goto LABEL_11;
  }
  mach_vm_size_t v9 = v8;
  CFStringRef Identifier = CFBundleGetIdentifier(v8);
  if (!Identifier)
  {
    CFRelease(v9);
    goto LABEL_11;
  }
  Copy = (__CFString *)CFStringCreateCopy(0, Identifier);
  CFRelease(v9);
  if (!Copy)
  {
LABEL_11:
    if (v6)
    {
      Copy = (__CFString *)xpc_dictionary_get_string(v6, (const char *)*MEMORY[0x263EF8308]);
      if (Copy) {
        Copy = (__CFString *)[[NSString alloc] initWithUTF8String:Copy];
      }
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_15:

LABEL_16:

  return Copy;
}

char *sub_21E8570EC(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    string = (char *)xpc_dictionary_get_string(v1, (const char *)*MEMORY[0x263EF8300]);
    if (string || (string = (char *)xpc_dictionary_get_string(v2, (const char *)*MEMORY[0x263EF8308])) != 0) {
      string = (char *)[[NSString alloc] initWithUTF8String:string];
    }
  }
  else
  {
    string = 0;
  }

  return string;
}

BOOL sub_21E857184(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (void *)[objc_alloc(MEMORY[0x263F7C058]) initWithTask:a1];

  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315650;
      mach_vm_size_t v9 = "isMSLEnabledForTask";
      __int16 v10 = 1024;
      int v11 = a2;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl(&dword_21E853000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "%s - the target process (pid%i %@) has MallocStackLogging enabled", (uint8_t *)&v8, 0x1Cu);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG))
  {
    int v8 = 136315650;
    mach_vm_size_t v9 = "isMSLEnabledForTask";
    __int16 v10 = 1024;
    int v11 = a2;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_debug_impl(&dword_21E853000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "%s - the target process  (pid%i %@) has MallocStackLogging disabled", (uint8_t *)&v8, 0x1Cu);
  }

  return v6 != 0;
}

void sub_21E8572F4(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    int v3 = *(_DWORD *)a2;
    if ((*(_DWORD *)a2 & 0xFFFFFFF0) == 0x20) {
      int v3 = 17;
    }
    switch(v3)
    {
      case 2053:
        *(_DWORD *)(v2 + 28) = *(_DWORD *)(a2 + 16);
        break;
      case 2054:
        *(_DWORD *)(v2 + 32) = *(_DWORD *)(a2 + 16);
        break;
      case 2055:
      case 2056:
      case 2057:
      case 2058:
      case 2060:
      case 2061:
      case 2064:
      case 2065:
      case 2066:
      case 2067:
      case 2068:
      case 2070:
      case 2071:
      case 2072:
      case 2075:
      case 2076:
      case 2077:
        return;
      case 2059:
        *(void *)(v2 + 184) = sub_21E856ED4(*(void *)(a2 + 16), *(void *)(a2 + 24));
        MEMORY[0x270F9A758]();
        break;
      case 2062:
        unsigned int v5 = *(_DWORD *)(a2 + 4);
        unsigned int v6 = *(_DWORD *)(a2 + 8) & 0xF;
        BOOL v7 = v5 >= v6;
        unsigned int v8 = v5 - v6;
        if (!v7) {
          unsigned int v8 = 0;
        }
        if (v8 >= 8)
        {
          uint64_t v9 = *(void *)(a2 + 16);
          *(void *)(v2 + 200) = v9;
          *(void *)(v2 + 104) = v9 & 0x1FFF;
        }
        break;
      case 2063:
        __strlcpy_chk();
        uint64_t v10 = [[NSString alloc] initWithUTF8String:v16];
        int v11 = *(void **)(v2 + 72);
        *(void *)(v2 + 72) = v10;

        __int16 v12 = *(void **)(v2 + 72);
        if (v12)
        {
          uint64_t v13 = [v12 lastPathComponent];
          uint64_t v14 = *(void **)(v2 + 64);
          *(void *)(v2 + 64) = v13;
        }
        break;
      case 2069:
        int v15 = *(_DWORD *)(a2 + 16);
        *(_DWORD *)(v2 + 40) = v15;
        *(unsigned char *)(v2 + 16) = (v15 & 4) != 0;
        break;
      case 2073:
        *(_DWORD *)(v2 + 36) = *(_DWORD *)(a2 + 16);
        break;
      case 2074:
        *(void *)(v2 + 208) = *(void *)(a2 + 16);
        break;
      case 2078:
        *(void *)(v2 + 232) = *(void *)(a2 + 16);
        break;
      case 2079:
        *(void *)(v2 + 240) = *(void *)(a2 + 16);
        break;
      case 2080:
        *(void *)(v2 + 288) = *(void *)(a2 + 16);
        break;
      case 2081:
        *(void *)(v2 + 248) = *(void *)(a2 + 16);
        break;
      case 2082:
        *(void *)(v2 + 256) = *(void *)(a2 + 16);
        break;
      case 2083:
        *(void *)(v2 + 264) = *(void *)(a2 + 16);
        break;
      case 2084:
        *(void *)(v2 + 272) = *(void *)(a2 + 16);
        break;
      case 2085:
        *(void *)(v2 + 280) = *(void *)(a2 + 16);
        break;
      case 2086:
        *(void *)(v2 + 216) = *(void *)(a2 + 16);
        break;
      case 2087:
        *(void *)(v2 + 224) = *(void *)(a2 + 16);
        break;
      case 2088:
        *(void *)(v2 + 304) = *(void *)(a2 + 16);
        break;
      case 2089:
        *(void *)(v2 + 312) = *(void *)(a2 + 16);
        break;
      case 2090:
        *(void *)(v2 + 296) = *(void *)(a2 + 16);
        break;
      default:
        if (v3 == 17 && HIDWORD(*(void *)(a2 + 8)) == 2075 && *(void *)(a2 + 8) != 0) {
          *(void *)(v2 + 176) = *(void *)(a2 + 16);
        }
        break;
    }
  }
}

uint64_t sub_21E8578DC(uint64_t a1)
{
  uint64_t result = CSIsNull();
  if (result)
  {
    int v3 = *(uint64_t **)(a1 + 32);
    *int v3 = CSSymbolicatorGetSymbolOwnerWithUUIDAtTime();
    v3[1] = v4;
    uint64_t result = CSIsNull();
    if ((result & 1) == 0)
    {
      return CSRetain();
    }
  }
  return result;
}

void sub_21E85796C(uint64_t a1, void *a2)
{
  CSRelease();

  free(a2);
}

uint64_t sub_21E858BA4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = qword_267D45A88;
  id v5 = a3;
  unsigned int v6 = [a2 objectForKeyedSubscript:v4];
  BOOL v7 = [v5 objectForKeyedSubscript:qword_267D45A88];

  unint64_t v8 = [v6 unsignedLongLongValue];
  if (v8 >= [v7 unsignedLongLongValue])
  {
    unint64_t v10 = [v6 unsignedLongLongValue];
    if (v10 <= [v7 unsignedLongLongValue]) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = -1;
    }
  }
  else
  {
    uint64_t v9 = 1;
  }

  return v9;
}

void sub_21E859634(_Unwind_Exception *a1)
{
}

void sub_21E85ABDC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 184), 8);
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_21E85AC08(uint64_t a1, void *a2, void *a3)
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5 && [v5 count])
  {
    id v40 = v6;
    [MEMORY[0x263EFF980] array];
    v42 = id v41 = v5;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v43 objects:v51 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v44 != v10) {
            objc_enumerationMutation(v7);
          }
          __int16 v12 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          uint64_t v13 = [v12 processIDs];
          uint64_t v14 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(a1 + 32) + 28)];
          int v15 = [v13 containsObject:v14];

          if (v15)
          {
            id v16 = v12;
            self;
            uint64_t v17 = [MEMORY[0x263EFF9A0] dictionary];
            uint64_t v18 = [NSNumber numberWithUnsignedInt:[v16 surfaceID]];
            [v17 setObject:v18 forKeyedSubscript:qword_267D45A70];

            long long v19 = [NSNumber numberWithUnsignedLongLong:[v16 length]];
            [v17 setObject:v19 forKeyedSubscript:qword_267D45A88];

            uint64_t v20 = [NSNumber numberWithUnsignedLongLong:[v16 dirtyLength]];
            [v17 setObject:v20 forKeyedSubscript:qword_267D45A90];

            long long v21 = [NSNumber numberWithUnsignedLongLong:[v16 residentLength]];
            [v17 setObject:v21 forKeyedSubscript:qword_267D45A98];

            unint64_t v22 = [NSNumber numberWithBool:[v16 wired]];
            [v17 setObject:v22 forKeyedSubscript:qword_267D45AA0];

            uint64_t v23 = [NSNumber numberWithBool:[v16 purgeable]];
            [v17 setObject:v23 forKeyedSubscript:qword_267D45AA8];

            v24 = [NSNumber numberWithBool:[v16 cachedCopy]];
            [v17 setObject:v24 forKeyedSubscript:qword_267D45AB0];

            v25 = [NSNumber numberWithUnsignedInteger:[v16 memoryPool]];
            [v17 setObject:v25 forKeyedSubscript:qword_267D45A80];

            v26 = [v16 formattedDescriptions];

            [v17 setObject:v26 forKeyedSubscript:qword_267D45A78];
            [v42 addObject:v17];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v43 objects:v51 count:16];
      }
      while (v9);
    }

    uint64_t v27 = *(void *)(a1 + 32);
    long long v28 = *(void **)(v27 + 160);
    *(void *)(v27 + 160) = v42;
    id v29 = v42;

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
    id v6 = v40;
    id v5 = v41;
  }
  else
  {
    if (v6 && [v6 count])
    {
      long long v30 = [MEMORY[0x263EFF980] arrayWithCapacity:[v6 count]];
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v31 = v6;
      uint64_t v32 = [v31 countByEnumeratingWithState:&v47 objects:v56 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v48;
        do
        {
          for (uint64_t j = 0; j != v33; ++j)
          {
            if (*(void *)v48 != v34) {
              objc_enumerationMutation(v31);
            }
            uint64x2_t v36 = [*(id *)(*((void *)&v47 + 1) + 8 * j) description];
            [v30 addObject:v36];
          }
          uint64_t v33 = [v31 countByEnumeratingWithState:&v47 objects:v56 count:16];
        }
        while (v33);
      }

      uint64_t v37 = *(void *)(a1 + 32);
      int64x2_t v38 = *(void **)(v37 + 168);
      *(void *)(v37 + 168) = v30;
    }
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      int8x16_t v39 = sub_21E856820(*(void *)(a1 + 32));
      *(_DWORD *)buf = 138412546;
      v53 = v39;
      __int16 v54 = 2112;
      id v55 = v6;
      _os_log_error_impl(&dword_21E853000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Didn't get any IOAccel memory info for %@ (this is not necessarily an error). Errors: %@", buf, 0x16u);
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
}

id *sub_21E85B344(id *a1, void *a2, void *a3, void *a4)
{
  v88[1] = *MEMORY[0x263EF8340];
  id v8 = a2;
  id v9 = a3;
  if (!a1) {
    goto LABEL_11;
  }
  v86.receiver = a1;
  v86.super_class = (Class)MemoryResourceException;
  a1 = (id *)[super init];
  if (!a1) {
    goto LABEL_95;
  }
  uint64_t v10 = [v8 objectForKeyedSubscript:qword_267D458E0];
  if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    [NSString stringWithFormat:@"Invalid metadata version %@. Expected non-nil number", v10, v78];
    uint64_t v11 = LABEL_8:;
    __int16 v12 = (void *)v11;
    if (a4)
    {
      uint64_t v13 = (void *)MEMORY[0x263F087E8];
      uint64_t v14 = MREErrorDomain;
      uint64_t v87 = *MEMORY[0x263F08320];
      v88[0] = v11;
      int v15 = [NSDictionary dictionaryWithObjects:v88 forKeys:&v87 count:1];
      *a4 = [v13 errorWithDomain:v14 code:18 userInfo:v15];
    }
    goto LABEL_10;
  }
  if ((unint64_t)[v10 unsignedIntegerValue] >= 2)
  {
    [NSString stringWithFormat:@"Diagnostic metadata version %@ is newer than the MRE log version %d", v10, 1];
    goto LABEL_8;
  }
  a1[17] = (id)[v10 integerValue];
  uint64_t v17 = [v8 objectForKeyedSubscript:qword_267D458F8];
  id v18 = a1[8];
  a1[8] = (id)v17;

  id v19 = a1[8];
  objc_opt_class();
  if (!v19 || (objc_opt_isKindOfClass() & 1) != 0)
  {
    uint64_t v20 = [v8 objectForKeyedSubscript:qword_267D45900];
    id v21 = a1[9];
    a1[9] = (id)v20;

    id v22 = a1[9];
    objc_opt_class();
    if (!v22 || (objc_opt_isKindOfClass() & 1) != 0)
    {
      uint64_t v23 = [v8 objectForKeyedSubscript:qword_267D45908];
      id v24 = a1[10];
      a1[10] = (id)v23;

      id v25 = a1[10];
      objc_opt_class();
      if (!v25 || (objc_opt_isKindOfClass() & 1) != 0)
      {
        uint64_t v26 = [v8 objectForKeyedSubscript:qword_267D45910];
        id v27 = a1[11];
        a1[11] = (id)v26;

        id v28 = a1[11];
        objc_opt_class();
        if (!v28 || (objc_opt_isKindOfClass() & 1) != 0)
        {
          id v29 = [v8 objectForKeyedSubscript:qword_267D458E8];
          objc_opt_class();
          if (!v29 || (objc_opt_isKindOfClass() & 1) == 0)
          {

            goto LABEL_11;
          }
          *((_DWORD *)a1 + 7) = [v29 integerValue];
          long long v30 = [v8 objectForKeyedSubscript:qword_267D458F0];
          objc_opt_class();
          if (v30 && (objc_opt_isKindOfClass() & 1) != 0)
          {
            v85 = v30;
            *((_DWORD *)a1 + 8) = [v30 integerValue];
            id v31 = [v8 objectForKeyedSubscript:qword_267D45950];
            objc_opt_class();
            if (v31 && (objc_opt_isKindOfClass() & 1) != 0)
            {
              v84 = v31;
              *((_DWORD *)a1 + 9) = [v31 unsignedIntegerValue];
              uint64_t v32 = [v8 objectForKeyedSubscript:qword_267D45918];
              objc_opt_class();
              if (!v32) {
                goto LABEL_83;
              }
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                goto LABEL_83;
              }
              a1[12] = (id)[v32 integerValue];
              uint64_t v33 = [v8 objectForKeyedSubscript:qword_267D45920];
              id v34 = a1[42];
              a1[42] = (id)v33;

              id v82 = a1[42];
              objc_opt_class();
              if (!v82 || (objc_opt_isKindOfClass() & 1) != 0)
              {
                v83 = v32;
                id v35 = [v8 objectForKeyedSubscript:qword_267D45928];
                objc_opt_class();
                if (v35)
                {
                  v81 = v35;
                  if ((objc_opt_isKindOfClass() & 1) == 0) {
                    goto LABEL_84;
                  }
                  a1[13] = (id)[v35 unsignedLongLongValue];
                  uint64_t v36 = [v8 objectForKeyedSubscript:qword_267D45930];
                  id v37 = a1[15];
                  a1[15] = (id)v36;

                  id v38 = a1[15];
                  objc_opt_class();
                  if (v38)
                  {
                    if ((objc_opt_isKindOfClass() & 1) == 0) {
                      goto LABEL_84;
                    }
                  }
                  uint64_t v39 = [v8 objectForKeyedSubscript:qword_267D45938];
                  id v40 = a1[16];
                  a1[16] = (id)v39;

                  id v41 = a1[16];
                  objc_opt_class();
                  if (!v41 || (objc_opt_isKindOfClass() & 1) != 0)
                  {
                    int8x16_t v42 = [v8 objectForKeyedSubscript:qword_267D45940];
                    objc_opt_class();
                    v80 = v42;
                    if (v42 && (objc_opt_isKindOfClass() & 1) != 0)
                    {
                      a1[14] = (id)[v42 longLongValue];
                      long long v43 = [v8 objectForKeyedSubscript:qword_267D45948];
                      objc_opt_class();
                      v79 = v43;
                      if (!v43) {
                        goto LABEL_87;
                      }
                      if ((objc_opt_isKindOfClass() & 1) == 0) {
                        goto LABEL_87;
                      }
                      *((unsigned char *)a1 + 16) = [v43 BOOLValue];
                      uint64_t v44 = [v8 objectForKeyedSubscript:qword_267D45958];
                      id v45 = a1[7];
                      a1[7] = (id)v44;

                      id v46 = a1[7];
                      objc_opt_class();
                      if (v46)
                      {
                        if ((objc_opt_isKindOfClass() & 1) == 0) {
                          goto LABEL_87;
                        }
                      }
                      uint64_t v47 = [v8 objectForKeyedSubscript:qword_267D45960];
                      id v48 = a1[40];
                      a1[40] = (id)v47;

                      id v49 = a1[40];
                      objc_opt_class();
                      if (v49)
                      {
                        if ((objc_opt_isKindOfClass() & 1) == 0) {
                          goto LABEL_87;
                        }
                      }
                      uint64_t v50 = [v8 objectForKeyedSubscript:qword_267D45970];
                      id v51 = a1[18];
                      a1[18] = (id)v50;

                      id v52 = a1[18];
                      objc_opt_class();
                      if (!v52 || (objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v53 = [v8 objectForKeyedSubscript:qword_267D45978];
                        objc_opt_class();
                        __int16 v54 = v53;
                        if (v53 && (objc_opt_isKindOfClass() & 1) == 0) {
                          goto LABEL_97;
                        }
                        a1[27] = (id)[v53 unsignedLongLongValue];
                        id v55 = [v8 objectForKeyedSubscript:qword_267D45980];

                        objc_opt_class();
                        __int16 v54 = v55;
                        if (v55)
                        {
                          if ((objc_opt_isKindOfClass() & 1) == 0) {
                            goto LABEL_97;
                          }
                        }
                        a1[28] = (id)[v55 unsignedLongLongValue];
                        v56 = [v8 objectForKeyedSubscript:qword_267D45988];

                        objc_opt_class();
                        __int16 v54 = v56;
                        if (v56)
                        {
                          if ((objc_opt_isKindOfClass() & 1) == 0) {
                            goto LABEL_97;
                          }
                        }
                        a1[29] = (id)[v56 unsignedLongLongValue];
                        uint64_t v57 = [v8 objectForKeyedSubscript:qword_267D45990];

                        objc_opt_class();
                        __int16 v54 = v57;
                        if (v57)
                        {
                          if ((objc_opt_isKindOfClass() & 1) == 0) {
                            goto LABEL_97;
                          }
                        }
                        a1[30] = (id)[v57 unsignedLongLongValue];
                        v58 = [v8 objectForKeyedSubscript:qword_267D45998];

                        objc_opt_class();
                        __int16 v54 = v58;
                        if (v58)
                        {
                          if ((objc_opt_isKindOfClass() & 1) == 0) {
                            goto LABEL_97;
                          }
                        }
                        a1[31] = (id)[v58 unsignedLongLongValue];
                        v59 = [v8 objectForKeyedSubscript:qword_267D459A0];

                        objc_opt_class();
                        __int16 v54 = v59;
                        if (v59)
                        {
                          if ((objc_opt_isKindOfClass() & 1) == 0) {
                            goto LABEL_97;
                          }
                        }
                        a1[32] = (id)[v59 unsignedLongLongValue];
                        v60 = [v8 objectForKeyedSubscript:qword_267D459A8];

                        objc_opt_class();
                        __int16 v54 = v60;
                        if (v60)
                        {
                          if ((objc_opt_isKindOfClass() & 1) == 0) {
                            goto LABEL_97;
                          }
                        }
                        a1[33] = (id)[v60 unsignedLongLongValue];
                        v61 = [v8 objectForKeyedSubscript:qword_267D459B0];

                        objc_opt_class();
                        __int16 v54 = v61;
                        if (v61)
                        {
                          if ((objc_opt_isKindOfClass() & 1) == 0) {
                            goto LABEL_97;
                          }
                        }
                        a1[34] = (id)[v61 unsignedLongLongValue];
                        v62 = [v8 objectForKeyedSubscript:qword_267D459C0];

                        objc_opt_class();
                        __int16 v54 = v62;
                        if (v62)
                        {
                          if ((objc_opt_isKindOfClass() & 1) == 0) {
                            goto LABEL_97;
                          }
                        }
                        a1[36] = (id)[v62 unsignedLongLongValue];
                        v63 = [v8 objectForKeyedSubscript:qword_267D459B8];

                        objc_opt_class();
                        __int16 v54 = v63;
                        if (v63)
                        {
                          if ((objc_opt_isKindOfClass() & 1) == 0) {
                            goto LABEL_97;
                          }
                        }
                        a1[35] = (id)[v63 unsignedLongLongValue];
                        v64 = [v8 objectForKeyedSubscript:qword_267D459C8];

                        objc_opt_class();
                        __int16 v54 = v64;
                        if (v64)
                        {
                          if ((objc_opt_isKindOfClass() & 1) == 0) {
                            goto LABEL_97;
                          }
                        }
                        a1[37] = (id)[v64 unsignedLongLongValue];
                        v65 = [v8 objectForKeyedSubscript:qword_267D459D0];

                        objc_opt_class();
                        __int16 v54 = v65;
                        if (v65)
                        {
                          if ((objc_opt_isKindOfClass() & 1) == 0) {
                            goto LABEL_97;
                          }
                        }
                        a1[38] = (id)[v65 unsignedLongLongValue];
                        v66 = [v8 objectForKeyedSubscript:qword_267D459D8];

                        objc_opt_class();
                        __int16 v54 = v66;
                        if (v66)
                        {
                          if ((objc_opt_isKindOfClass() & 1) == 0) {
                            goto LABEL_97;
                          }
                        }
                        a1[39] = (id)[v66 unsignedLongLongValue];
                        uint64_t v67 = [v8 objectForKeyedSubscript:qword_267D459E0];
                        id v68 = a1[19];
                        a1[19] = (id)v67;

                        id v69 = a1[19];
                        objc_opt_class();
                        if (v69)
                        {
                          if ((objc_opt_isKindOfClass() & 1) == 0) {
                            goto LABEL_97;
                          }
                        }
                        uint64_t v70 = [v8 objectForKeyedSubscript:qword_267D459E8];
                        id v71 = a1[20];
                        a1[20] = (id)v70;

                        id v72 = a1[20];
                        objc_opt_class();
                        if (v72)
                        {
                          if ((objc_opt_isKindOfClass() & 1) == 0) {
                            goto LABEL_97;
                          }
                        }
                        uint64_t v73 = [v8 objectForKeyedSubscript:qword_267D459F0];
                        id v74 = a1[21];
                        a1[21] = (id)v73;

                        id v75 = a1[21];
                        objc_opt_class();
                        if (v75 && (objc_opt_isKindOfClass() & 1) == 0)
                        {
LABEL_97:
                          int v76 = 1;
                        }
                        else
                        {
                          objc_storeStrong(a1 + 6, a3);
                          *((_DWORD *)a1 + 5) = 0;
                          objc_storeStrong(a1 + 41, a2);
                          int v76 = 0;
                        }
                      }
                      else
                      {
LABEL_87:
                        int v76 = 1;
                      }
                    }
                    else
                    {
                      int v76 = 1;
                    }
                  }
                  else
                  {
LABEL_84:
                    int v76 = 1;
                  }
                  id v35 = v81;
                }
                else
                {
                  int v76 = 1;
                }

                uint64_t v32 = v83;
              }
              else
              {
LABEL_83:
                int v76 = 1;
              }

              id v31 = v84;
            }
            else
            {
              int v76 = 1;
            }

            long long v30 = v85;
          }
          else
          {
            int v76 = 1;
          }

          if (v76) {
            goto LABEL_11;
          }
LABEL_95:
          a1 = a1;
          id v16 = a1;
          goto LABEL_96;
        }
      }
    }
  }
  __int16 v12 = 0;
LABEL_10:

LABEL_11:
  id v16 = 0;
LABEL_96:

  return v16;
}

__CFString *MREExceptionTypeToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 6) {
    return @"MREExceptionManual";
  }
  else {
    return off_2644CA4C8[a1 - 1];
  }
}

unint64_t sub_21E85C758(uint64_t a1)
{
  Name = (const char *)CSRegionGetName();
  if (!strncmp(Name, "__TEXT", 6uLL) || (unint64_t result = strcmp(Name, "MACH_HEADER"), !result))
  {
    unint64_t result = CSRegionGetRange();
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    if (*(void *)(v5 + 24) - 1 >= result) {
      *(void *)(v5 + 24) = result;
    }
    unint64_t v6 = v4 + result - 1;
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (v6 > *(void *)(v7 + 24)) {
      *(void *)(v7 + 24) = v6;
    }
  }
  return result;
}

void sub_21E85C808()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  size_t v4 = 0;
  sysctlbyname("hw.model", 0, &v4, 0, 0);
  if (v4 - 1 <= 0x7E && !sysctlbyname("hw.model", v5, &v4, 0, 0))
  {
    uint64_t v0 = [[NSString alloc] initWithUTF8String:v5];
    uint64_t v1 = (void *)qword_26AB1E258;
    qword_26AB1E258 = v0;
  }
  uint64_t v2 = _CFCopySupplementalVersionDictionary();
  int v3 = (void *)qword_26AB1E260;
  qword_26AB1E260 = v2;
}

void sub_21E85C8D8()
{
  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.ReportMemoryException", 0, 2uLL);
  uint64_t v1 = (void *)qword_26AB1E270;
  qword_26AB1E270 = (uint64_t)mach_service;

  if (qword_26AB1E270)
  {
    xpc_connection_set_event_handler((xpc_connection_t)qword_26AB1E270, &unk_26CFD2540);
    uint64_t v2 = (_xpc_connection_s *)qword_26AB1E270;
    xpc_connection_resume(v2);
  }
}

void sub_21E85C94C(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  uint64_t v3 = MEMORY[0x223C32E70]();
  BOOL v4 = v2 != (id)MEMORY[0x263EF86A0] && v3 == MEMORY[0x263EF8720];
  if (v4 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
  {
    string = xpc_dictionary_get_string(v2, (const char *)*MEMORY[0x263EF86B0]);
    int v6 = 136315138;
    uint64_t v7 = string;
    _os_log_error_impl(&dword_21E853000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Got xpc error message: %s\n", (uint8_t *)&v6, 0xCu);
  }
}

void ReportMemoryExceptionFromTask(uint64_t a1, char a2, const char *a3, void *a4, void *a5)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void (**)(void, void))v10;
  if ((a1 - 1) >= 0xFFFFFFFE)
  {
    if (v10)
    {
      uint64_t v14 = [MEMORY[0x263F087E8] errorWithDomain:MREErrorDomain code:9 userInfo:0];
      ((void (**)(void, void *))v11)[2](v11, v14);
    }
    goto LABEL_31;
  }
  unsigned int object_addr = 0;
  unsigned int object_type = 0;
  if (mach_port_kernel_object(*MEMORY[0x263EF8960], a1, &object_type, &object_addr)) {
    BOOL v12 = 0;
  }
  else {
    BOOL v12 = object_type == 2;
  }
  if (!v12)
  {
    if (v11)
    {
      id v13 = [MEMORY[0x263F087E8] errorWithDomain:MREErrorDomain code:9 userInfo:0];
      ((void (**)(void, id))v11)[2](v11, v13);
LABEL_30:

      goto LABEL_31;
    }
    goto LABEL_31;
  }
  uint64_t v34 = 0;
  id v35 = &v34;
  uint64_t v36 = 0x3032000000;
  id v37 = sub_21E85D324;
  id v38 = sub_21E85D334;
  id v39 = 0;
  if (a3) {
    goto LABEL_13;
  }
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = sub_21E85D33C;
  v33[3] = &unk_2644CA578;
  v33[4] = &v34;
  if ((sub_21E8566F0(a1, v33) & 1) == 0)
  {
    int x = 0;
    if (pid_for_task(a1, &x)) {
      goto LABEL_20;
    }
    if ((proc_pidpath(x, buf, 0x400u) - 1) <= 0x3FE)
    {
      uint64_t v22 = [[NSString alloc] initWithUTF8String:buf];
      uint64_t v23 = (void *)v35[5];
      v35[5] = v22;
    }
  }
  a3 = (const char *)[ (id) v35[5] UTF8String];
  if (a3)
  {
LABEL_13:
    BOOL v15 = strncmp(a3, "/usr/libexec/ReportMemoryException", 0x400uLL) == 0;
    _Block_object_dispose(&v34, 8);

    if (!v15)
    {
      if (SMJobIsEnabled())
      {
        if (qword_26AB1E278 != -1) {
          dispatch_once(&qword_26AB1E278, &unk_26CFD2520);
        }
        id v16 = (id)qword_26AB1E270;
        if (v16)
        {
          uint64_t v17 = v16;
          v24[0] = MEMORY[0x263EF8330];
          v24[1] = 3221225472;
          v24[2] = sub_21E85CF6C;
          v24[3] = &unk_2644CA550;
          id v27 = v11;
          int v28 = a1;
          char v29 = a2;
          id v13 = v17;
          id v25 = v13;
          id v26 = v9;
          id v18 = (void (**)(void, void))MEMORY[0x223C32A80](v24);
          v18[2](v18, 0);

          id v19 = v27;
        }
        else
        {
          if (!v11)
          {
            id v13 = 0;
            goto LABEL_30;
          }
          id v19 = [MEMORY[0x263F087E8] errorWithDomain:MREErrorDomain code:7 userInfo:0];
          ((void (**)(void, void *))v11)[2](v11, v19);
          id v13 = 0;
        }
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          long long v43 = @"RME is disabled. To re-enable use 'ReportMemoryExceptionTool --enable'";
          _os_log_impl(&dword_21E853000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "%@. Aborting.", buf, 0xCu);
        }
        if (!v11) {
          goto LABEL_31;
        }
        uint64_t v20 = (void *)MEMORY[0x263F087E8];
        id v21 = MREErrorDomain;
        uint64_t v40 = *MEMORY[0x263F08320];
        id v41 = @"RME is disabled. To re-enable use 'ReportMemoryExceptionTool --enable'";
        id v13 = [NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
        id v19 = [v20 errorWithDomain:v21 code:17 userInfo:v13];
        ((void (**)(void, void *))v11)[2](v11, v19);
      }

      goto LABEL_30;
    }
    goto LABEL_21;
  }
LABEL_20:
  _Block_object_dispose(&v34, 8);

LABEL_21:
  if (v11)
  {
    id v13 = [MEMORY[0x263F087E8] errorWithDomain:MREErrorDomain code:10 userInfo:0];
    ((void (**)(void, id))v11)[2](v11, v13);
    goto LABEL_30;
  }
LABEL_31:
}

void sub_21E85CF44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E85CF6C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
    if (v5)
    {
      int v19 = 0;
      if (MEMORY[0x223C32780](*MEMORY[0x263EF8960], *(unsigned int *)(a1 + 56), 0, &v19) != 15)
      {
        xpc_dictionary_set_int64(v5, "MessageType", 2);
        xpc_dictionary_set_mach_send();
        xpc_dictionary_set_BOOL(v5, "WithMemgraph", *(unsigned char *)(a1 + 60));
        uint64_t v11 = *(void **)(a1 + 48);
        if (!v11)
        {
          xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), v5);
          goto LABEL_14;
        }
        BOOL v12 = *(_xpc_connection_s **)(a1 + 32);
        id v13 = *(NSObject **)(a1 + 40);
        if (v13)
        {
          handler[0] = MEMORY[0x263EF8330];
          handler[1] = 3221225472;
          handler[2] = sub_21E85D1C4;
          handler[3] = &unk_2644CA528;
          id v17 = v11;
          xpc_connection_send_message_with_reply(v12, v5, v13, handler);

          goto LABEL_14;
        }
        id v10 = xpc_connection_send_message_with_reply_sync(*(xpc_connection_t *)(a1 + 32), v5);
        uint64_t v14 = *(void *)(a1 + 48);
        BOOL v15 = sub_21E85D224(v10);
        (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);

        goto LABEL_13;
      }
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_21E853000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Timed out on authenticating. Skipping sending corpse to RME for analysis.", buf, 2u);
      }
      uint64_t v6 = *(void *)(a1 + 48);
      if (!v6) {
        goto LABEL_14;
      }
      uint64_t v7 = (void *)MEMORY[0x263F087E8];
      uint64_t v8 = MREErrorDomain;
      uint64_t v9 = 15;
    }
    else
    {
      uint64_t v6 = *(void *)(a1 + 48);
      if (!v6)
      {
LABEL_14:

        goto LABEL_15;
      }
      uint64_t v7 = (void *)MEMORY[0x263F087E8];
      uint64_t v8 = MREErrorDomain;
      uint64_t v9 = 6;
    }
    id v10 = [v7 errorWithDomain:v8 code:v9 userInfo:0];
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v10);
LABEL_13:

    goto LABEL_14;
  }
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
LABEL_15:
}

void sub_21E85D1C4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  sub_21E85D224(a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

id sub_21E85D224(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1 && MEMORY[0x223C32E70](v1) == MEMORY[0x263EF8708])
  {
    string = (void *)xpc_dictionary_get_string(v2, "ErrorDomain");
    if (string)
    {
      int64_t int64 = xpc_dictionary_get_int64(v2, "ErrorCode");
      uint64_t v6 = (void *)MEMORY[0x263F087E8];
      uint64_t v7 = (void *)[[NSString alloc] initWithUTF8String:string];
      string = [v6 errorWithDomain:v7 code:int64 userInfo:0];
    }
  }
  else
  {
    string = [MEMORY[0x263F087E8] errorWithDomain:MREErrorDomain code:7 userInfo:0];
  }

  return string;
}

uint64_t sub_21E85D324(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_21E85D334(uint64_t a1)
{
}

void sub_21E85D33C(uint64_t a1, _DWORD *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (*a2 == 2063)
  {
    __strlcpy_chk();
    uint64_t v3 = [[NSString alloc] initWithUTF8String:v6];
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    xpc_object_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
}

void *sub_21E85D3E4(void *a1, mach_port_name_t a2, uint64_t a3, void *a4, uint64_t a5, unsigned int a6)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v11 = a4;
  if (a1)
  {
    mach_error_t v12 = mach_port_mod_refs(*MEMORY[0x263EF8960], a2, 0, 1);
    if (v12)
    {
      mach_error("initWithCorpse:mach_port_mod_refs", v12);

      a1 = 0;
    }
    else
    {
      *((_DWORD *)a1 + 24) = a2;
      uint64_t v17 = 0;
      memset(v16, 0, sizeof(v16));
      HIDWORD(v16[0]) = a3;
      LODWORD(v16[0]) = a6 & 0x4000 | (a6 >> 9) & 1 | (16 * ((a6 >> 2) & 1)) & 0xFFFFDF7F | (((a6 >> 1) & 1) << 7) & 0xFFFFDFFF | HIWORD(a6) & 0x100 | (((a6 >> 8) & 1) << 13);
      *((unsigned char *)a1 + 13) = (a6 & 0x20000) != 0;
      id v13 = (void *)[a1 initWithBsdInfo:v16];
      a1 = v13;
      if (v13)
      {
        [v13 setName:v11];
        uint64_t v14 = [NSString stringWithFormat:@"%@ [%d] (corpse)", v11, a3];
        [a1 setDisplayString:v14];

        [a1 _setIdleExitStatusFromDirtyFlags:a5];
      }
    }
  }

  return a1;
}

uint64_t sub_21E85D81C(int a1, _OWORD *buffer)
{
  if (proc_pidinfo(a1, 3, 0, buffer, 136) == 136) {
    return 1;
  }
  if (a1) {
    return 0;
  }
  *((void *)buffer + 16) = 0;
  buffer[4] = xmmword_21E86F240;
  buffer[5] = unk_21E86F250;
  buffer[6] = xmmword_21E86F260;
  buffer[7] = unk_21E86F270;
  *buffer = xmmword_21E86F200;
  buffer[1] = *(_OWORD *)algn_21E86F210;
  uint64_t result = 1;
  buffer[2] = xmmword_21E86F220;
  buffer[3] = unk_21E86F230;
  return result;
}

__CFString *sub_21E85D91C(uint64_t a1, uint64_t a2)
{
  self;
  uint64_t v3 = a2 + 64;
  if (*(unsigned char *)(a2 + 64))
  {
    uint64_t v4 = 32;
LABEL_5:
    uint64_t v7 = (__CFString *)[[NSString alloc] initWithFormat:@"%.*s", v4, v3];
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
  uint64_t v7 = @"Unknown";
LABEL_6:

  return v7;
}

void *sub_21E85DCA8(void *a1)
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
    uint64_t v14 = v4;
LABEL_11:
    free(v14);
    return 0;
  }
  unsigned int v6 = v5;
  uint64_t v7 = malloc_type_malloc(136 * v5, 0x11B869D5uLL);
  uint64_t v8 = v7;
  if (!v6)
  {
    free(v4);
LABEL_10:
    uint64_t v14 = v8;
    goto LABEL_11;
  }
  uint64_t v9 = 0;
  LODWORD(v10) = 0;
  uint64_t v11 = 4 * v6;
  mach_error_t v12 = v7;
  do
  {
    unsigned int v13 = sub_21E85D81C(*(_DWORD *)&v4[v9], v12);
    mach_error_t v12 = (_OWORD *)((char *)v12 + 136 * v13);
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

void sub_21E85F120(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
  _Block_object_dispose(&a49, 8);
  _Block_object_dispose((const void *)(v49 - 256), 8);
  _Unwind_Resume(a1);
}

void sub_21E85F3A4(id *a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (a1)
  {
    id v3 = a2;
    uint64_t v4 = __error();
    strerror_r(*v4, __strerrbuf, 0x100uLL);
    unsigned int v5 = [NSString stringWithFormat:@"%@ - %s", v3, __strerrbuf];

    unsigned int v6 = (FILE *)*MEMORY[0x263EF8348];
    id v7 = [a1 displayString];
    uint64_t v8 = (const char *)[v7 UTF8String];
    id v9 = v5;
    fprintf(v6, "%s: %s\n", v8, (const char *)[v9 UTF8String]);

    [a1[5] addObject:v9];
  }
}

void sub_21E85F7C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v26 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_21E85F7FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a3)
  {
    uint64_t v6 = 0;
    uint64_t v32 = a4;
    uint64_t v33 = a5 - 1;
    uint64_t v31 = a3 - 1;
    do
    {
      BOOL v7 = !(v6 | a4) && !*(unsigned char *)(a1 + 80) && *(unsigned char *)(a1 + 81) != 0;
      BOOL v8 = 0;
      if (v33 == a4 && v31 == v6) {
        BOOL v8 = *(unsigned char *)(a1 + 82) != 0;
      }
      int v9 = *(_DWORD *)(a2 + 4 * v6);
      unint64_t v10 = *(void *)(a1 + 64);
      uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
      id v13 = *(id *)(a1 + 32);
      uint64_t v14 = v13;
      BOOL v36 = v8;
      if (v7)
      {
        uint64_t v15 = [v13 start];
        unint64_t v16 = [v14 size];
        unint64_t v10 = v10 - v15 + (v15 & -(uint64_t)v10);
      }
      else
      {
        if (!v8) {
          goto LABEL_15;
        }
        uint64_t v17 = [v13 end];
        unint64_t v16 = [v14 size];
        unint64_t v10 = v10 - ((v10 + v17 - 1) & -(uint64_t)v10) + v17;
      }
      if (v16 < v10) {
        unint64_t v10 = [v14 size];
      }
LABEL_15:
      BOOL v18 = (v9 & 0x81) == 1 || (v9 & 8) != 0;
      if (v18)
      {
        int v19 = (void *)(v11 + 24);
LABEL_22:
        *v19 += v10;
        goto LABEL_23;
      }
      if ((v9 & 0x10) != 0)
      {
        int v19 = (void *)(v12 + 24);
        goto LABEL_22;
      }
LABEL_23:

      if (v7 && *(void *)(*(void *)(a1 + 40) + 168))
      {
        uint64_t v20 = [*(id *)(a1 + 32) start];
        if (v20 != [*(id *)(*(void *)(a1 + 40) + 168) end])
        {
          _os_assert_log();
          _os_crash();
          __break(1u);
          return;
        }
        uint64_t v37 = 0;
        uint64_t v38 = 0;
        uint64_t v21 = *(void *)(a1 + 64);
        id v22 = *(id *)(*(void *)(a1 + 40) + 168);
        uint64_t v23 = [v22 end];
        unint64_t v24 = [v22 size];
        unint64_t v25 = v21 - ((v21 + v23 - 1) & -v21) + v23;
        if (v24 < v25) {
          unint64_t v25 = [v22 size];
        }
        if (v18)
        {
          uint64_t v26 = (unint64_t *)&v38;
          goto LABEL_34;
        }
        if ((v9 & 0x10) != 0)
        {
          uint64_t v26 = (unint64_t *)&v37;
LABEL_34:
          unint64_t *v26 = v25;
          uint64_t v27 = v37;
          uint64_t v28 = v38;
        }
        else
        {
          uint64_t v27 = 0;
          uint64_t v28 = 0;
        }

        [*(id *)(*(void *)(a1 + 40) + 168) setDirtySize:[*(id *)(*(void *)(a1 + 40) + 168) dirtySize] + v28];
        [*(id *)(*(void *)(a1 + 40) + 168) setSwappedSize:*(id *)(*(void *)(a1 + 40) + 168) swappedSize + v27];
        uint64_t v29 = *(void *)(a1 + 40);
        long long v30 = *(void **)(v29 + 168);
        *(void *)(v29 + 168) = 0;
      }
      if (v36)
      {
        *(void *)(*(void *)(a1 + 40) + 152) = *(void *)(a1 + 72) - *(void *)(a1 + 64);
        *(_DWORD *)(*(void *)(a1 + 40) + 160) = v9;
      }
      ++v6;
      a4 = v32;
    }
    while (a3 != v6);
  }
}

uint64_t sub_21E85FAD4(uint64_t a1, mach_vm_offset_t a2, unint64_t a3, void *a4)
{
  dispositions_count[1] = *MEMORY[0x263EF8340];
  BOOL v7 = a4;
  if (a1)
  {
    uint64_t v8 = [(id)a1 pageSize];
    if (a3 >= 0x1000) {
      unint64_t v9 = 4096;
    }
    else {
      unint64_t v9 = a3;
    }
    if (a3 + 4095 >= 0x1000)
    {
      uint64_t v10 = v8;
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
      uint64_t v14 = v8 << 12;
      while (1)
      {
        mach_vm_size_t v15 = a3 >= v9 ? v9 : a3;
        dispositions_count[0] = v15;
        uint64_t v16 = v10;
        mach_error_t v17 = mach_vm_page_range_query(*((_DWORD *)v20 + 24), a2, v15 * v10, (mach_vm_address_t)v19 - ((unsigned __int16)(4 * v9 + 15) & 0xFFF0), dispositions_count);
        if (v17) {
          break;
        }
        (*((void (**)(char *, char *, mach_vm_size_t, uint64_t, unint64_t))v7 + 2))(v7, (char *)v19 - ((unsigned __int16)(4 * v9 + 15) & 0xFFF0), dispositions_count[0], v11++, v12);
        a2 += v14;
        a3 -= 4096;
        uint64_t v10 = v16;
        if (v13 == v11)
        {
          a1 = 1;
          goto LABEL_18;
        }
      }
      sub_21E8600FC(v20, v17, @"mach_vm_page_range_query");
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

void sub_21E8600FC(unsigned char *a1, mach_error_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a1 && !a1[176])
  {
    a1[176] = 1;
    uint64_t v6 = "";
    if ([a1 _isAlive])
    {
      memset(buffer, 0, sizeof(buffer));
      if (proc_pidinfo([a1 pid], 13, 1uLL, buffer, 64) == 64) {
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
        uint64_t v6 = " (process exited)";
      }
      else {
        uint64_t v6 = v13;
      }
    }
    else
    {
      BOOL v8 = 0;
      BOOL v9 = 0;
    }
    uint64_t v14 = [NSString stringWithFormat:@"%@ - %s%s", v5, mach_error_string(a2), v6];
    mach_vm_size_t v15 = &OBJC_IVAR___FPProcess__warnings;
    if (!v8 && !v9)
    {
      uint64_t v16 = (FILE *)*MEMORY[0x263EF8348];
      id v17 = [a1 displayString];
      fprintf(v16, "%s: bailing out due to error: %s\n", (const char *)[v17 UTF8String], (const char *)[v14 UTF8String]);

      mach_vm_size_t v15 = &OBJC_IVAR___FPProcess__errors;
    }
    [*(id *)&a1[*v15] addObject:v14];
  }
}

void sub_21E860478(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21E86049C(uint64_t result, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a5 - 1 == a4) {
    unint64_t v5 = a3 + 1;
  }
  else {
    unint64_t v5 = a3;
  }
  if (v5)
  {
    uint64_t v8 = result;
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
        else if ((*(_DWORD *)(v8 + 64) & v10) != 0)
        {
          uint64_t v11 = 1;
        }
        else
        {
          BOOL v17 = (*(_DWORD *)(v8 + 68) & v10) == 0;
          uint64_t v12 = 4 * (v10 & 1);
          if (v17) {
            uint64_t v11 = v12;
          }
          else {
            uint64_t v11 = 3;
          }
        }
      }
      uint64_t v13 = *(void *)(v8 + 40);
      uint64_t v14 = *(void *)(v13 + 8);
      uint64_t v15 = *(void *)(v14 + 24);
      if (v15 != v11)
      {
        uint64_t v16 = *(void *)(v8 + 48);
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
              JUMPOUT(0x21E860684);
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
          if (*(unsigned char *)(v8 + 72))
          {
            *(void *)&long long v23 = *(void *)(v18 + 40);
            uint64_t v18 = *(void *)(v16 + 8);
          }
          uint64_t result = [*(id *)(v8 + 32) addSubrange:*(void *)(v18 + 32) memoryTotal:*(void *)(v18 + 40) pageSize:&v21];
          uint64_t v19 = *(void *)(*(void *)(v8 + 48) + 8);
          *(void *)(v19 + 32) += *(void *)(v19 + 40);
          *(void *)(v19 + 40) = 0;
          uint64_t v14 = *(void *)(*(void *)(v8 + 40) + 8);
        }
      }
      *(void *)(v14 + 24) = v11;
      if (*(void *)(*(void *)(*(void *)(v8 + 40) + 8) + 24)) {
        uint64_t v20 = 40;
      }
      else {
        uint64_t v20 = 32;
      }
      *(void *)(*(void *)(*(void *)(v8 + 48) + 8) + v20) += *(void *)(v8 + 56);
    }
  }
  return result;
}

uint64_t sub_21E86069C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_21E8606AC(uint64_t a1)
{
}

uint64_t sub_21E8606B4(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, void *a6, void *a7, int a8)
{
  id v15 = a6;
  id v16 = a7;
  unint64_t v17 = *(void *)(a1 + 80);
  unint64_t v18 = a3 + a2;
  if (v17 >= a3 + a2 || *(void *)(a1 + 88) + v17 <= a2)
  {
    id v84 = v15;
    uint64_t v20 = objc_alloc_init(FPMemoryRegion);
    [(FPMemoryRegion *)v20 setStart:a2];
    [(FPMemoryRegion *)v20 setSize:a3];
    [(FPMemoryRegion *)v20 setUser_tag:*(unsigned int *)(a4 + 20)];
    [(FPMemoryRegion *)v20 setObject_id:*(void *)(a4 + 68)];
    [(FPMemoryRegion *)v20 setShare_mode:*(unsigned __int8 *)(a4 + 47)];
    [(FPMemoryRegion *)v20 setOffset:*(void *)(a4 + 12)];
    [(FPMemoryRegion *)v20 setInSharedCache:0];
    [(FPMemoryRegion *)v20 setWired:*(_WORD *)(a4 + 60) != 0];
    unsigned int v87 = a5;
    if (a5 == 2)
    {
      [(FPMemoryRegion *)v20 setDirtySize:0];
      long long v23 = v20;
      uint64_t v22 = a3;
    }
    else
    {
      if (a5 != 1)
      {
        if (*(unsigned char *)(a4 + 46) || *(unsigned char *)(a1 + 97)) {
          unsigned int v51 = *(_DWORD *)(a4 + 36);
        }
        else {
          unsigned int v51 = *(_DWORD *)(a4 + 24) - *(_DWORD *)(a4 + 64);
        }
        -[FPMemoryRegion setDirtySize:](v20, "setDirtySize:", [*(id *)(a1 + 32) pageSize] * v51);
        -[FPMemoryRegion setReclaimableSize:](v20, "setReclaimableSize:", [*(id *)(a1 + 32) pageSize] * *(unsigned int *)(a4 + 64));
        -[FPMemoryRegion setSwappedSize:](v20, "setSwappedSize:", [*(id *)(a1 + 32) pageSize] * *(unsigned int *)(a4 + 32));
        unsigned int v52 = *(_DWORD *)(a4 + 24);
        unsigned int v53 = *(_DWORD *)(a4 + 64) + v51;
        if (*(unsigned char *)(a1 + 97) && v52 < v53) {
          uint64_t v54 = 0;
        }
        else {
          uint64_t v54 = [*(id *)(a1 + 32) pageSize] * (v52 - v53);
        }
        [(FPMemoryRegion *)v20 setCleanSize:v54];
        if (*(_DWORD *)(a4 + 20) == -1)
        {
          if (*(void *)(*(void *)(a1 + 32) + 144))
          {
LABEL_129:

            uint64_t v24 = 0;
LABEL_130:
            id v15 = v84;
            goto LABEL_131;
          }
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v20);
          if (!*(void *)(a4 + 68)) {
            [(FPMemoryRegion *)v20 setObject_id:*(unsigned int *)(a4 + 56)];
          }
        }
LABEL_68:
        uint64_t v55 = sub_21E86A3B4(*(void *)(a1 + 48), a2, a3 + a2);
        [(FPMemoryRegion *)v20 setSegment:1];
        if (a8) {
          [(FPMemoryRegion *)v20 setVerbose:1];
        }
        if (v55)
        {
          id v56 = *(id *)(v55 + 32);
          [(FPMemoryRegion *)v20 setName:v56];

          id v57 = *(id *)(v55 + 40);
          [(FPMemoryRegion *)v20 setDetailedName:v57];

          [(FPMemoryRegion *)v20 setSegment:*(unsigned __int8 *)(v55 + 8)];
          goto LABEL_121;
        }
        if (v16)
        {
          [(FPMemoryRegion *)v20 setName:v16];
          goto LABEL_121;
        }
        if ((v84 || *(unsigned char *)(a4 + 46)) && *(_DWORD *)(a4 + 20) != 88)
        {
          [(FPMemoryRegion *)v20 setName:@"mapped file"];
          [(FPMemoryRegion *)v20 setDetailedName:v84];
          goto LABEL_121;
        }
        if (a2 == 0xFC0000000 && a3 == 0x40000000)
        {
          v58 = @"commpage (reserved)";
LABEL_89:
          [(FPMemoryRegion *)v20 setName:v58];
          [(FPMemoryRegion *)v20 setVerbose:1];
          goto LABEL_121;
        }
        if (a2 == 0x1000000000 && a3 == 0x6000000000)
        {
          v58 = @"GPU Carveout (reserved)";
          goto LABEL_89;
        }
        v59 = +[FPMemoryRegion categoryNameForTag:*(unsigned int *)(a4 + 20)];
        [(FPMemoryRegion *)v20 setName:v59];

        if (*(unsigned char *)(a1 + 98))
        {
          int v60 = *(_DWORD *)(a4 + 20);
          if (v60 == 100 || v60 == 88)
          {
            if (v84)
            {
              [(FPMemoryRegion *)v20 setExtendedInfo:v84];
            }
            else if (v60 != 100 || *(unsigned char *)(a1 + 99))
            {
              v61 = [*(id *)(a1 + 32) extendedInfoForRegionType:x0 at:x1 extendedInfoProvider:x2];
              [(FPMemoryRegion *)v20 setExtendedInfo:v61];
            }
          }
        }
        if (!*(unsigned char *)(a1 + 100)) {
          goto LABEL_121;
        }
        v62 = [NSNumber numberWithUnsignedLongLong:*(void *)(a4 + 68)];
        v63 = [*(id *)(*(void *)(a1 + 32) + 144) objectForKeyedSubscript:v62];
        v64 = *(void **)(*(void *)(a1 + 32) + 144);
        if (v63)
        {
          [v64 removeObjectForKey:v62];
          [(FPMemoryRegion *)v20 setOwnedExclusivelyByParentProcess:1];
          uint64_t v93 = 0;
          uint64_t v92 = 0;
          long long v90 = 0u;
          long long v91 = 0u;
          long long v89 = 0u;
          [v63 getBytes:&v89 length:56];
          unint64_t v65 = v92;
          int v66 = (v92 >> 4) & 3;
          if (v66 != 3 && v66)
          {
            uint64_t v69 = 0;
            uint64_t v94 = 0;
            unint64_t v68 = *((void *)&v90 + 1);
            uint64_t v67 = v90 - *((void *)&v90 + 1);
          }
          else
          {
            uint64_t v67 = v91;
            unint64_t v68 = v90 - v91;
            uint64_t v69 = *((void *)&v91 + 1);
            uint64_t v94 = *((void *)&v91 + 1);
          }
          objc_super v86 = v62;
          if (v92)
          {
            uint64_t v93 = v68 + v69;
            uint64_t v73 = &v94;
            unint64_t v68 = 0;
          }
          else
          {
            uint64_t v73 = &v93;
          }
          *uint64_t v73 = 0;
          id v74 = +[FPMemoryRegion vmLedgerNameForTag:(v65 >> 1) & 7];
          if (v74)
          {
            id v75 = [NSString alloc];
            [(FPMemoryRegion *)v20 name];
            v77 = uint64_t v76 = v67;
            uint64_t v78 = (void *)[v75 initWithFormat:@"%@ (%@)", v77, v74];
            [(FPMemoryRegion *)v20 setName:v78];

            uint64_t v67 = v76;
          }

          uint64_t v72 = v93;
          uint64_t v71 = v94;
        }
        else
        {
          if (v64 || a5 == 3 || *(_DWORD *)(a4 + 20) == 87 || !*(_DWORD *)(a4 + 24)) {
            goto LABEL_120;
          }
          objc_super v86 = v62;
          [0 removeObjectForKey:v62];
          [(FPMemoryRegion *)v20 setOwnedExclusivelyByParentProcess:1];
          uint64_t v70 = [(FPMemoryRegion *)v20 dirtySize];
          unint64_t v68 = [(FPMemoryRegion *)v20 cleanSize] + v70;
          uint64_t v71 = [(FPMemoryRegion *)v20 swappedSize];
          uint64_t v72 = 0;
          uint64_t v67 = 0;
        }
        *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) += v68 + v71;
        [(FPMemoryRegion *)v20 setDirtySize:v68];
        [(FPMemoryRegion *)v20 setCleanSize:v72];
        [(FPMemoryRegion *)v20 setSwappedSize:v71];
        [(FPMemoryRegion *)v20 setReclaimableSize:v67];
        v62 = v86;
LABEL_120:

LABEL_121:
        if (*(unsigned char *)(a1 + 97)
          && !*(unsigned char *)(a1 + 101)
          && !*(unsigned char *)(a1 + 96)
          && -[FPMemoryRegion eligibleForSubrangesUsingPageSize:](v20, "eligibleForSubrangesUsingPageSize:", [*(id *)(a1 + 32) pageSize]))
        {
          [*(id *)(a1 + 32) _addSubrangesForRegion:v20 purgeState:v87];
        }
        if (v20 != *(FPMemoryRegion **)(*(void *)(*(void *)(a1 + 64) + 8) + 40)) {
          [*(id *)(a1 + 40) addObject:v20];
        }

        goto LABEL_129;
      }
      [(FPMemoryRegion *)v20 setDirtySize:0];
      uint64_t v21 = *(unsigned int *)(a4 + 24);
      uint64_t v22 = [*(id *)(a1 + 32) pageSize] * v21;
      long long v23 = v20;
    }
    [(FPMemoryRegion *)v23 setReclaimableSize:v22];
    [(FPMemoryRegion *)v20 setSwappedSize:0];
    [(FPMemoryRegion *)v20 setCleanSize:0];
    goto LABEL_68;
  }
  if (*(unsigned char *)(a1 + 96))
  {
    uint64_t v24 = 0;
    goto LABEL_131;
  }
  id v84 = v15;
  uint64_t v25 = *(void *)(a1 + 32);
  uint64_t v26 = *(void **)(a1 + 48);
  id v88 = *(id *)(a1 + 40);
  id v27 = v26;
  uint64_t v28 = (uint64_t)v27;
  if (!v25)
  {

    uint64_t v24 = 1;
    goto LABEL_130;
  }
  id v82 = v16;
  unsigned int v29 = [*(id *)(v25 + 24) alignment];
  uint64_t v30 = [(id)v25 pageSize];
  uint64_t v31 = 0;
  uint64_t v32 = *(void **)(v25 + 168);
  *(void *)(v25 + 168) = 0;

  v85 = (void *)v28;
  sub_21E86A3B4(v28, a2, v18);
  uint64_t v33 = (FPMemoryRegion *)objc_claimAutoreleasedReturnValue();
  if (v18 <= a2)
  {
LABEL_84:

    uint64_t v24 = 0;
    goto LABEL_85;
  }
  uint64_t v34 = 0;
  uint64_t v83 = v29 - 1;
  uint64_t v80 = -(uint64_t)v29;
  uint64_t v81 = v30 - 1;
  unint64_t v35 = a2;
  while (1)
  {
    BOOL v36 = v33;
    if (v33 && v35 >= v33->_dirtySize) {
      goto LABEL_39;
    }
    uint64_t v33 = objc_alloc_init(FPMemoryRegion);
    [(FPMemoryRegion *)v33 setStart:v35];
    unint64_t dirtySize = v18;
    if (v36)
    {
      if (v36->_dirtySize >= v18) {
        unint64_t dirtySize = v18;
      }
      else {
        unint64_t dirtySize = v36->_dirtySize;
      }
    }
    [(FPMemoryRegion *)v33 setEnd:dirtySize];
    [(FPMemoryRegion *)v33 setUser_tag:*(unsigned int *)(a4 + 20)];
    [(FPMemoryRegion *)v33 setObject_id:*(void *)(a4 + 68)];
    [(FPMemoryRegion *)v33 setShare_mode:*(unsigned __int8 *)(a4 + 47)];
    [(FPMemoryRegion *)v33 setOffset:*(void *)(a4 + 12) - a2 + [(FPMemoryRegion *)v33 start]];
    [(FPMemoryRegion *)v33 setInSharedCache:1];
    [(FPMemoryRegion *)v33 setName:@"unused dyld shared cache area"];
    [(FPMemoryRegion *)v33 setUnusedSharedCacheRegion:1];
    [(FPMemoryRegion *)v33 setWired:*(_WORD *)(a4 + 60) != 0];
    if (v34)
    {
      uint64_t v38 = v34[8];
      if (v38 == 2)
      {
        if (!v36)
        {
          [(FPMemoryRegion *)v33 setSegment:2];
          goto LABEL_37;
        }
      }
      else if (!v36 || v38 != 4)
      {
        goto LABEL_33;
      }
    }
    else if (!v36)
    {
      [(FPMemoryRegion *)v33 setSegment:0];
LABEL_35:
      if ((([(FPMemoryRegion *)v33 end] | v35) & v81) != 0
        && ![(id)v25 _populateMemoryRegionWithPageQueries:v33 regionInfo:a4])
      {
        goto LABEL_93;
      }
      goto LABEL_37;
    }
    uint64_t v38 = *((unsigned __int8 *)v36 + 8);
    if (v38 == 4 || v38 == 2)
    {
      if (v34) {
        id v39 = v34;
      }
      else {
        id v39 = (unsigned __int8 *)v36;
      }
      uint64_t v38 = v39[8];
    }
LABEL_33:
    [(FPMemoryRegion *)v33 setSegment:v38];
    if (v38 != 2 && v38 != 4) {
      goto LABEL_35;
    }
LABEL_37:
    [v88 addObject:v33];
    unint64_t v35 = [(FPMemoryRegion *)v33 end];

    if (!v36 || v35 >= v18)
    {
      uint64_t v33 = v36;
      uint64_t v31 = v34;
      goto LABEL_84;
    }
LABEL_39:
    uint64_t v40 = objc_alloc_init(FPMemoryRegion);
    id v41 = v40;
    if (v36->_dirtySize <= v35) {
      unint64_t v42 = v35;
    }
    else {
      unint64_t v42 = v36->_dirtySize;
    }
    [(FPMemoryRegion *)v40 setStart:v42];
    unint64_t swappedSize = v36->_swappedSize;
    if (swappedSize + v36->_dirtySize >= v18) {
      unint64_t v44 = v18;
    }
    else {
      unint64_t v44 = swappedSize + v36->_dirtySize;
    }
    [(FPMemoryRegion *)v41 setEnd:v44];
    sub_21E86A3B4((uint64_t)v85, [(FPMemoryRegion *)v41 end], v18);
    uint64_t v33 = (FPMemoryRegion *)objc_claimAutoreleasedReturnValue();
    if (v36 != v33)
    {
      uint64_t v45 = [(FPMemoryRegion *)v41 start];
      unint64_t v46 = v33 ? v33->_dirtySize : 0;
      if (((v46 | v45) & v83) == 0) {
        [(FPMemoryRegion *)v41 setEnd:([(FPMemoryRegion *)v41 end] + v83) & v80];
      }
    }
    [(FPMemoryRegion *)v41 setUser_tag:*(unsigned int *)(a4 + 20)];
    [(FPMemoryRegion *)v41 setObject_id:*(void *)(a4 + 68)];
    [(FPMemoryRegion *)v41 setShare_mode:*(unsigned __int8 *)(a4 + 47)];
    [(FPMemoryRegion *)v41 setOffset:*(void *)(a4 + 12) - a2 + [(FPMemoryRegion *)v41 start]];
    [(FPMemoryRegion *)v41 setInSharedCache:1];
    id v47 = (id)v36->_cleanSize;
    [(FPMemoryRegion *)v41 setName:v47];

    id v48 = (id)v36->_reclaimableSize;
    [(FPMemoryRegion *)v41 setDetailedName:v48];

    int v49 = *((unsigned __int8 *)v36 + 8);
    [(FPMemoryRegion *)v41 setSegment:*((unsigned __int8 *)v36 + 8)];
    [(FPMemoryRegion *)v41 setWired:*(_WORD *)(a4 + 60) != 0];
    if (v49 == 2 || v49 == 4)
    {
      uint64_t v50 = *(void **)(v25 + 168);
      if (v50)
      {
        *(void *)(v25 + 168) = 0;
      }
      goto LABEL_55;
    }
    if (([(id)v25 _populateMemoryRegionWithPageQueries:v41 regionInfo:a4] & 1) == 0) {
      break;
    }
LABEL_55:
    [v88 addObject:v41];
    unint64_t v35 = [(FPMemoryRegion *)v41 end];
    uint64_t v31 = v36;

    uint64_t v34 = v31;
    if (v35 >= v18) {
      goto LABEL_84;
    }
  }

LABEL_93:
  uint64_t v24 = 1;
LABEL_85:
  id v15 = v84;
  id v16 = v82;
LABEL_131:

  return v24;
}

void sub_21E861824(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 72), 8);
  _Unwind_Resume(a1);
}

void sub_21E861850(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)MEMORY[0x223C32890]();
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = sub_21E86069C;
  v14[4] = sub_21E8606AC;
  id v15 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_21E861A08;
  v10[3] = &unk_2644CA618;
  long long v11 = *(_OWORD *)(a1 + 32);
  uint64_t v12 = v14;
  uint64_t v13 = a2;
  if ((MEMORY[0x223C32610](a2, v10) & 1) == 0 && !*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    unint64_t v5 = [NSString stringWithFormat:@"Unable to iterate over image segments"];
    uint64_t v6 = (FILE *)*MEMORY[0x263EF8348];
    id v7 = [*(id *)(a1 + 32) displayString];
    uint64_t v8 = (const char *)[v7 UTF8String];
    id v9 = v5;
    fprintf(v6, "%s: %s\n", v8, (const char *)[v9 UTF8String]);

    [*(id *)(*(void *)(a1 + 32) + 40) addObject:v9];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  _Block_object_dispose(v14, 8);
}

void sub_21E8619EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E861A08(void *a1, char *__s, unint64_t a3, unint64_t a4)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  if (a4)
  {
    size_t v6 = strlen(__s);
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    id v9 = 0;
    do
    {
      explicit = (void *)atomic_load_explicit((atomic_ullong *volatile)((char *)&unk_26AB1E358 + v7), memory_order_acquire);
      long long v11 = explicit;

      if (explicit)
      {
        uint64_t v8 = v11;
      }
      else
      {
        if (!v9) {
          id v9 = (__CFString *)[[NSString alloc] initWithBytes:__s length:v6 encoding:4];
        }
        uint64_t v8 = 0;
        atomic_compare_exchange_strong((atomic_ullong *volatile)((char *)&unk_26AB1E358 + v7), (unint64_t *)&v8, (unint64_t)v9);
        if (!v8)
        {
          uint64_t v14 = v15 = v9;
          uint64_t v8 = v9;
          goto LABEL_18;
        }
        id v12 = v8;
      }
      if ([(__CFString *)v8 length] == v6)
      {
        uint64_t v13 = v50;
        if (([(__CFString *)v8 getCString:v50 maxLength:32 encoding:4] & 1) == 0) {
          uint64_t v13 = (const char *)[(__CFString *)v8 UTF8String];
        }
        if (!strncmp(v13, __s, v6))
        {
          uint64_t v8 = v8;

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
    uint64_t v14 = [[NSString alloc] initWithBytes:__s length:v6 encoding:4];
LABEL_18:
    id v9 = (__CFString *)v14;
LABEL_19:
    unint64_t v16 = a3;

    int v17 = [*(id *)(a1[4] + 24) containsAddress:a3];
    if (v17 && [(__CFString *)v9 isEqualToString:@"__LINKEDIT"])
    {
      unint64_t v18 = *(void **)(*(void *)(a1[5] + 8) + 40);
      uint64_t v19 = [NSNumber numberWithUnsignedLongLong:a3];
      LOBYTE(v18) = [v18 containsObject:v19];

      if (v18)
      {
LABEL_55:

        return;
      }
      uint64_t v20 = *(void **)(*(void *)(a1[5] + 8) + 40);
      uint64_t v21 = [NSNumber numberWithUnsignedLongLong:a3];
      [v20 addObject:v21];

      uint64_t v22 = @"dyld shared cache";
    }
    else
    {
      long long v23 = *(void **)(*(void *)(a1[6] + 8) + 40);
      if (!v23)
      {
        uint64_t v24 = (const char *)MEMORY[0x223C32620](a1[7]);
        if (v24 || (uint64_t v24 = (const char *)MEMORY[0x223C32630](a1[7])) != 0)
        {
          if (v17)
          {
            id v25 = 0;
            unsigned int v26 = 0;
            id v27 = 0;
            unint64_t v28 = ((a3 >> 16) ^ (a3 >> 8) ^ (a3 >> 24) ^ a3) % 0x7FF;
            do
            {
              unsigned int v29 = (void *)atomic_load_explicit(&qword_26AB1E3D8[v28], memory_order_acquire);
              id v30 = v29;

              if (v29)
              {
                id v25 = v30;
              }
              else
              {
                if (!v27) {
                  id v27 = (void *)[[NSString alloc] initWithUTF8String:v24];
                }
                id v25 = 0;
                atomic_compare_exchange_strong(&qword_26AB1E3D8[v28], (unint64_t *)&v25, (unint64_t)v27);
                if (!v25)
                {
                  uint64_t v35 = v41 = v27;
                  id v25 = v27;
                  goto LABEL_45;
                }
                id v31 = v25;
              }
              uint64_t v32 = v50;
              if (([v25 getCString:v50 maxLength:1025 encoding:4] & 1) == 0) {
                uint64_t v32 = (const char *)[v25 UTF8String];
              }
              if (!strcmp(v32, v24))
              {
                id v25 = v25;

                id v27 = v25;
                goto LABEL_46;
              }
              uint64_t v33 = ((v28 + 1) * (unsigned __int128)0x20040080100201uLL) >> 64;
              unint64_t v28 = v28 + 1 - 2047 * ((v33 + ((v28 + 1 - v33) >> 1)) >> 10);
            }
            while (v26++ < 0x11);
            if (v27) {
              goto LABEL_46;
            }
            uint64_t v35 = [[NSString alloc] initWithUTF8String:v24];
LABEL_45:
            id v27 = (void *)v35;
LABEL_46:
            unint64_t v16 = a3;

            uint64_t v42 = *(void *)(a1[6] + 8);
            BOOL v36 = *(void **)(v42 + 40);
            *(void *)(v42 + 40) = v27;
          }
          else
          {
            BOOL v36 = (void *)[[NSString alloc] initWithUTF8String:v24];
            uint64_t v37 = [v36 stringByResolvingSymlinksInPath];
            uint64_t v38 = *(void *)(a1[6] + 8);
            id v39 = *(void **)(v38 + 40);
            *(void *)(v38 + 40) = v37;
          }
        }
        else
        {
          uint64_t v40 = *(void *)(a1[6] + 8);
          BOOL v36 = *(void **)(v40 + 40);
          *(void *)(v40 + 40) = @"unknown dylib";
        }

        long long v23 = *(void **)(*(void *)(a1[6] + 8) + 40);
      }
      uint64_t v22 = v23;
    }
    long long v43 = objc_alloc_init(FPImage);
    unint64_t v44 = v43;
    if (v43)
    {
      v43->_start = v16;
      v43->_size_t size = a4;
      if (v9) {
        uint64_t v45 = v9;
      }
      else {
        uint64_t v45 = @"unknown";
      }
      sub_21E86A228((uint64_t)v43, v45);
      objc_setProperty_nonatomic_copy(v44, v46, v22, 40);
    }
    else
    {
      if (v9) {
        id v47 = v9;
      }
      else {
        id v47 = @"unknown";
      }
      sub_21E86A228(0, v47);
    }
    [*(id *)(a1[4] + 136) addObject:v44];

    goto LABEL_55;
  }
}

uint64_t sub_21E861F00(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = a2;
  unint64_t v5 = a3;
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
        uint64_t v8 = v9 > v10;
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
  uint64_t v8 = -1;
LABEL_10:

  return v8;
}

uint64_t sub_21E862134(uint64_t a1, uint64_t a2)
{
  int v2 = [NSNumber numberWithLongLong:a2];
  id v3 = [v2 stringValue];
  uint64_t v4 = [v3 UTF8String];

  return v4;
}

const char *sub_21E862194(uint64_t a1, int a2)
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

void sub_21E862CC0(uint64_t a1, void *a2, void *a3)
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
    sub_21E862D48(a1, v7, [v5 pageSize], v5);
  }
}

void sub_21E862D48(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v17 = a2;
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
    [*(id *)(a1 + 16) addObject:v17];
    if (objc_msgSend(v17, "object_id"))
    {
      if (v7
        && !+[FPFootprint isSharingAnalysisDisabled]
        && (*(void *)(a1 + 64) || [v17 eligibleForProcessView]))
      {
        uint64_t v8 = [NSNumber numberWithInt:[v7 pid]];
        unint64_t v9 = *(void **)(a1 + 64);
        if (!v9)
        {
          id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          long long v11 = *(void **)(a1 + 64);
          *(void *)(a1 + 64) = v10;

          unint64_t v9 = *(void **)(a1 + 64);
        }
        id v12 = [v9 objectForKeyedSubscript:v8];
        if (!v12)
        {
          uint64_t v13 = *(void **)(a1 + 64);
          id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
          [v13 setObject:v12 forKeyedSubscript:v8];
        }
        [v12 addObject:v17];
      }
      uint64_t v14 = *(void *)(a1 + 72);
      if (!v14)
      {
        id v15 = objc_alloc_init(FPRangeList);
        unint64_t v16 = *(void **)(a1 + 72);
        *(void *)(a1 + 72) = v15;

        uint64_t v14 = *(void *)(a1 + 72);
      }
      sub_21E854CF8(v14, v17, a3);
      [v17 freeSubrangeList];
    }
  }
}

void sub_21E862F8C(uint64_t a1, int a2)
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  if (!a1) {
    return;
  }
  if (*(unsigned char *)(a1 + 8))
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
  long long v60 = 0u;
  long long v61 = 0u;
  int64x2_t v59 = 0u;
  sub_21E854E0C(*(void *)(a1 + 72), &v59);
  if (a2)
  {
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v4 = *(id *)(a1 + 16);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v55 objects:v66 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v56;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v56 != v7) {
            objc_enumerationMutation(v4);
          }
          unint64_t v9 = *(void **)(*((void *)&v55 + 1) + 8 * i);
          *(void *)(a1 + 24) += [v9 dirtySize];
          *(void *)(a1 + 32) += [v9 swappedSize];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v55 objects:v66 count:16];
      }
      while (v6);
    }
LABEL_34:

    goto LABEL_35;
  }
  *(int64x2_t *)(a1 + 24) = v59;
  if (*(void *)(a1 + 64)
    && +[FPFootprint breakDownPhysFootprint])
  {
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v4 = [*(id *)(a1 + 64) objectEnumerator];
    uint64_t v38 = [v4 countByEnumeratingWithState:&v51 objects:v65 count:16];
    if (v38)
    {
      uint64_t v37 = *(void *)v52;
      do
      {
        for (uint64_t j = 0; j != v38; ++j)
        {
          if (*(void *)v52 != v37) {
            objc_enumerationMutation(v4);
          }
          long long v11 = *(void **)(*((void *)&v51 + 1) + 8 * j);
          long long v47 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          id v12 = v11;
          uint64_t v13 = [v12 countByEnumeratingWithState:&v47 objects:v64 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            unint64_t v15 = 0;
            unint64_t v16 = 0;
            uint64_t v17 = *(void *)v48;
            do
            {
              for (uint64_t k = 0; k != v14; ++k)
              {
                if (*(void *)v48 != v17) {
                  objc_enumerationMutation(v12);
                }
                uint64_t v19 = *(void **)(*((void *)&v47 + 1) + 8 * k);
                v16 += [v19 dirtySize];
                v15 += [v19 swappedSize];
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v47 objects:v64 count:16];
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
        uint64_t v38 = [v4 countByEnumeratingWithState:&v51 objects:v65 count:16];
      }
      while (v38);
      LOBYTE(a2) = 0;
    }
    goto LABEL_34;
  }
LABEL_35:
  *(_OWORD *)(a1 + 40) = v60;
  *(void *)(a1 + 56) = v61;
  uint64_t v20 = *(void **)(a1 + 72);
  *(void *)(a1 + 72) = 0;

  if ((a2 & 1) == 0 && (unint64_t)[*(id *)(a1 + 64) count] >= 2)
  {
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    uint64_t v21 = [*(id *)(a1 + 64) objectEnumerator];
    uint64_t v22 = [v21 countByEnumeratingWithState:&v43 objects:v63 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v44;
LABEL_39:
      uint64_t v25 = 0;
      while (1)
      {
        if (*(void *)v44 != v24) {
          objc_enumerationMutation(v21);
        }
        unsigned int v26 = *(void **)(*((void *)&v43 + 1) + 8 * v25);
        if ((unint64_t)[v26 count] > 1) {
          goto LABEL_52;
        }
        id v27 = [v26 firstObject];
        if ([v27 dirtySize] != *(void *)(a1 + 24)
          || [v27 swappedSize] != *(void *)(a1 + 32)
          || [v27 cleanSize] != *(void *)(a1 + 40)
          || [v27 reclaimableSize] != *(void *)(a1 + 48)
          || [v27 wiredSize] != *(void *)(a1 + 56))
        {

          goto LABEL_52;
        }

        if (v23 == ++v25)
        {
          uint64_t v23 = [v21 countByEnumeratingWithState:&v43 objects:v63 count:16];
          if (v23) {
            goto LABEL_39;
          }
          break;
        }
      }
    }

    *(unsigned char *)(a1 + 8) |= 2u;
  }
  uint64_t v21 = *(void **)(a1 + 64);
  *(void *)(a1 + 64) = 0;
LABEL_52:

  if ((a2 & 1) == 0 && [(id)a1 containsFakeRegion])
  {
    unint64_t v28 = sub_21E8634E4(a1);
    if (([v28 isFake] & 1) == 0)
    {
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v29 = *(id *)(a1 + 16);
      uint64_t v30 = [v29 countByEnumeratingWithState:&v39 objects:v62 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v40;
        do
        {
          for (uint64_t m = 0; m != v31; ++m)
          {
            if (*(void *)v40 != v32) {
              objc_enumerationMutation(v29);
            }
            uint64_t v34 = *(void **)(*((void *)&v39 + 1) + 8 * m);
            if ([v34 isFake])
            {
              uint64_t v35 = [v28 name];
              [v34 setName:v35];

              BOOL v36 = [v28 detailedName];
              [v34 setDetailedName:v36];
            }
          }
          uint64_t v31 = [v29 countByEnumeratingWithState:&v39 objects:v62 count:16];
        }
        while (v31);
      }
    }
  }
  *(unsigned char *)(a1 + 8) |= 1u;
}

id sub_21E8634E4(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (a1)
  {
    int v2 = [*(id *)(a1 + 16) firstObject];
    int v3 = [v2 inSharedCache];
    if ((v3 & 1) != 0 || *(_DWORD *)(a1 + 12) != -1)
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      id v4 = *(id *)(a1 + 16);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v13;
        while (2)
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v13 != v7) {
              objc_enumerationMutation(v4);
            }
            unint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
            if (v3)
            {
              if (([v9 unusedSharedCacheRegion] & 1) == 0) {
                goto LABEL_17;
              }
            }
            else if (!objc_msgSend(v9, "isFake", (void)v12))
            {
LABEL_17:
              id v10 = v9;

              goto LABEL_18;
            }
          }
          uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
          if (v6) {
            continue;
          }
          break;
        }
      }
    }
    id v10 = v2;
LABEL_18:
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

void sub_21E8641A0()
{
  for (uint64_t i = 0; i != 16; ++i)
  {
    uint64_t v1 = [[NSString alloc] initWithFormat: @"app-specific tag %d", i + 1];
    int v2 = (char *)&unk_26AB1E280 + 8 * i;
    int v3 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v1;
  }
}

uint64_t sub_21E8648B4()
{
  uint64_t v0 = [MEMORY[0x263F08968] weakToStrongObjectsMapTable];
  uint64_t v1 = qword_26AB1E290;
  qword_26AB1E290 = v0;

  return MEMORY[0x270F9A758](v0, v1);
}

id sub_21E8651F4(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a2;
  unint64_t v16 = v3;
  if (a1)
  {
    id v4 = v3;
    id v19 = [MEMORY[0x263EFF9A0] dictionary];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    obuint64_t j = [v4 objectEnumerator];
    uint64_t v20 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v20)
    {
      uint64_t v18 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v22 != v18) {
            objc_enumerationMutation(obj);
          }
          uint64_t v6 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          v25[0] = @"dirty";
          uint64_t v7 = [NSNumber numberWithUnsignedLongLong:objc_msgSend(v6, "totalSwappedSize") + objc_msgSend(v6, "totalDirtySize")];
          v26[0] = v7;
          v25[1] = @"swapped";
          uint64_t v8 = [NSNumber numberWithUnsignedLongLong:[v6 totalSwappedSize]];
          v26[1] = v8;
          v25[2] = @"clean";
          unint64_t v9 = [NSNumber numberWithUnsignedLongLong:[v6 totalCleanSize]];
          v26[2] = v9;
          v25[3] = @"reclaimable";
          id v10 = [NSNumber numberWithUnsignedLongLong:[v6 totalReclaimableSize]];
          v26[3] = v10;
          v25[4] = @"wired";
          long long v11 = [NSNumber numberWithUnsignedLongLong:[v6 totalWiredSize]];
          v26[4] = v11;
          v25[5] = @"regions";
          long long v12 = [NSNumber numberWithUnsignedInt:[v6 totalRegions]];
          v26[5] = v12;
          long long v13 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:6];

          long long v14 = [v6 fullName];
          [v19 setObject:v13 forKeyedSubscript:v14];
        }
        uint64_t v20 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
      }
      while (v20);
    }
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

void sub_21E865FB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_21E865FD8()
{
  self;
  uint64_t v0 = (void *)qword_26AB223D8;
  if (!qword_26AB223D8)
  {
    id v1 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    int v2 = (void *)qword_26AB223D8;
    qword_26AB223D8 = (uint64_t)v1;

    uint64_t v0 = (void *)qword_26AB223D8;
  }

  return v0;
}

uint64_t sub_21E866030(uint64_t result)
{
  if (!*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24)) {
    return dyld_shared_cache_for_file();
  }
  return result;
}

uint64_t sub_21E8660B4(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x223C326D0](a2);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void sub_21E8660E8()
{
  self;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_26AB223D0);
  uint64_t v0 = (void *)qword_26AB223D8;
  qword_26AB223D8 = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_26AB223D0);
}

void sub_21E86670C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E866724(uint64_t a1, uint64_t a2)
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

void sub_21E867224(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
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
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(id *)(*((void *)&v12 + 1) + 8 * v9);
        *(void *)a3 += [v10 totalDirtySize];
        *(void *)(a3 + 8) += [v10 totalSwappedSize];
        *(void *)(a3 + 16) += [v10 totalCleanSize];
        *(void *)(a3 + 24) += [v10 totalReclaimableSize];
        *(void *)(a3 + 32) += [v10 totalWiredSize];
        int v11 = [v10 totalRegions];

        *(_DWORD *)(a3 + 40) += v11;
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

id sub_21E868D50(id a1)
{
  id v1 = a1;
  if (a1)
  {
    int v2 = [MEMORY[0x263F08A98] predicateWithFormat:@"hiddenFromDisplay == NO"];
    id v3 = [v1 processes];
    id v1 = [v3 filteredArrayUsingPredicate:v2];
  }

  return v1;
}

id sub_21E868DD4(uint64_t a1, void *a2, void *a3, char *a4, uint64_t a5)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v24 = a3;
  if (a1)
  {
    long long v21 = a4;
    id v10 = [MEMORY[0x263EFF9A0] dictionary];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v22 = v9;
    obuint64_t j = v9;
    uint64_t v11 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      char v13 = 0;
      uint64_t v14 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v26 != v14) {
            objc_enumerationMutation(obj);
          }
          unint64_t v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          if (a5) {
            [v16 name];
          }
          else {
          uint64_t v17 = [v16 fullName];
          }
          id v18 = [v10 objectForKeyedSubscript:v17];
          if (!v18)
          {
            id v18 = [[FPMemoryCategory alloc] initSummary:a5];
            [v10 setObject:v18 forKeyedSubscript:v17];
          }
          id v19 = [v16 viewForProcess:v24];
          [v18 addMemoryObject:v19];
          if (v13 == 2 || v19 == v16)
          {
            if (!v13) {
              char v13 = [v16 couldHaveProcessView];
            }
          }
          else
          {
            char v13 = 2;
          }
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v12);
    }
    else
    {
      char v13 = 0;
    }

    if (v21) {
      *long long v21 = v13;
    }
    id v9 = v22;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

id sub_21E86900C(void *a1, uint64_t a2)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  if (a1)
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    sub_21E868D50(a1);
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v19)
    {
      uint64_t v18 = *(void *)v27;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v27 != v18) {
            objc_enumerationMutation(obj);
          }
          uint64_t v21 = v6;
          uint64_t v7 = *(void **)(*((void *)&v26 + 1) + 8 * v6);
          context = (void *)MEMORY[0x223C32890]();
          long long v22 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          uint64_t v8 = [v7 memoryRegions];
          uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
          if (v9)
          {
            uint64_t v10 = v9;
            uint64_t v11 = *(void *)v23;
            do
            {
              for (uint64_t i = 0; i != v10; ++i)
              {
                if (*(void *)v23 != v11) {
                  objc_enumerationMutation(v8);
                }
                char v13 = [*(id *)(*((void *)&v22 + 1) + 8 * i) memoryObject];
                if (([v4 containsObject:v13] & 1) == 0)
                {
                  [v4 addObject:v13];
                  if (a2) {
                    [v13 name];
                  }
                  else {
                  uint64_t v14 = [v13 fullName];
                  }
                  id v15 = [v5 objectForKeyedSubscript:v14];
                  if (!v15)
                  {
                    id v15 = [[FPMemoryCategory alloc] initSummary:a2];
                    [v5 setObject:v15 forKeyedSubscript:v14];
                  }
                  [v15 addMemoryObject:v13];
                }
              }
              uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
            }
            while (v10);
          }

          uint64_t v6 = v21 + 1;
        }
        while (v21 + 1 != v19);
        uint64_t v19 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v19);
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

void sub_21E8692AC(uint64_t a1, id *a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v3 = a3;
    while (1)
    {
      id v6 = *a2;
      uint64_t v7 = [v6 memoryObject];
      uint64_t v8 = v7;
      if (!*(unsigned char *)(a1 + 72)) {
        break;
      }
      if ([v7 ownerPid] != -1)
      {
        uint64_t v9 = *(void **)(a1 + 32);
        uint64_t v10 = [NSNumber numberWithInt:[v8 ownerPid]];
        if (([v9 containsObject:v10] & 1) == 0) {
          goto LABEL_13;
        }
        int v11 = [v8 containsFakeRegion];

        if (v11) {
          break;
        }
      }
LABEL_14:

      ++a2;
      if (!--v3) {
        return;
      }
    }
    if (*(void *)(a1 + 40)
      && [v6 inSharedCache]
      && ([v6 privateSharedCacheRegion] & 1) == 0)
    {
      sub_21E86AB34(*(void *)(a1 + 48), v8);
      goto LABEL_14;
    }
    uint64_t v10 = [MEMORY[0x263F08D40] valueWithNonretainedObject:v8];
    uint64_t v12 = [*(id *)(a1 + 56) objectForKeyedSubscript:v10];
    if (!v12)
    {
      uint64_t v12 = objc_alloc_init(FPProcessGroupMinimal);
      [*(id *)(a1 + 56) setObject:v12 forKeyedSubscript:v10];
    }
    [(FPProcessGroupMinimal *)v12 addProcess:*(void *)(a1 + 64)];

LABEL_13:
    goto LABEL_14;
  }
}

uint64_t sub_21E869424(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  LODWORD(a2) = [a2 pid];
  int v5 = [v4 pid];

  if ((int)a2 > v5) {
    return -1;
  }
  else {
    return 1;
  }
}

uint64_t sub_21E86947C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 16);
  uint64_t v8 = [NSNumber numberWithInt:[v5 pid]];
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];

  uint64_t v10 = *(void **)(*(void *)(a1 + 32) + 16);
  int v11 = [NSNumber numberWithInt:[v6 pid]];
  uint64_t v12 = [v10 objectForKeyedSubscript:v11];

  uint64_t v13 = [v12 compare:v9];
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

BOOL sub_21E86986C(uint64_t a1, void *a2)
{
  return [a2 virtualAddress] == *(void *)(a1 + 32);
}

void sub_21E869F14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

uint64_t sub_21E869F40(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_21E869F50(uint64_t a1)
{
}

void sub_21E869F58(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  obuint64_t j = v3;
  uint64_t v15 = [v3 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v15)
  {
    uint64_t v14 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
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
        uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v17;
          do
          {
            for (uint64_t j = 0; j != v8; ++j)
            {
              if (*(void *)v17 != v9) {
                objc_enumerationMutation(v6);
              }
              uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * j);
              uint64_t v12 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectForKeyedSubscript:v11];
              if (!v12)
              {
                uint64_t v12 = [MEMORY[0x263EFF980] array];
                [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v12 forKeyedSubscript:v11];
              }
              [v12 addObject:v5];
            }
            uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v24 count:16];
          }
          while (v8);
        }
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v15);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

BOOL sub_21E86A214(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

unint64_t sub_21E86A220(unint64_t a1)
{
  return a1 >> 8;
}

uint64_t sub_21E86A228(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    uint64_t v9 = (void *)v3;
    uint64_t v5 = [(id)v3 copy];
    id v6 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = v5;

    uint64_t v3 = [v9 hasPrefix:@"__TEXT"];
    if (v3 & 1) != 0 || (uint64_t v3 = [v9 hasPrefix:@"__OBJC_RO"], (v3))
    {
      char v7 = 2;
LABEL_5:
      uint64_t v4 = (uint64_t)v9;
LABEL_6:
      *(unsigned char *)(a1 + 8) = v7;
      goto LABEL_7;
    }
    uint64_t v3 = [v9 hasPrefix:@"__LINKEDIT"];
    if (v3)
    {
      char v7 = 4;
      goto LABEL_5;
    }
    uint64_t v3 = [v9 hasPrefix:@"__"];
    uint64_t v4 = (uint64_t)v9;
    if (v3)
    {
      char v7 = 3;
      goto LABEL_6;
    }
  }
LABEL_7:

  return MEMORY[0x270F9A758](v3, v4);
}

id *sub_21E86A338(id *a1, void *a2)
{
  id v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)FPImageEnumerator;
    uint64_t v5 = (id *)[super init];
    a1 = v5;
    if (v5)
    {
      v5[2] = 0;
      objc_storeStrong(v5 + 1, a2);
    }
  }

  return a1;
}

void *sub_21E86A3B4(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (a1)
  {
    while (1)
    {
      unint64_t v6 = *(void *)(a1 + 16);
      if (v6 >= [*(id *)(a1 + 8) count]) {
        break;
      }
      objc_super v7 = [*(id *)(a1 + 8) objectAtIndexedSubscript:*(void *)(a1 + 16)];
      uint64_t v8 = v7;
      if (v7)
      {
        unint64_t v9 = v7[2];
        unint64_t v10 = v7[3] + v9;
        if (v9 <= a2 && v10 > a2)
        {
LABEL_16:
          uint64_t v12 = v7;
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
        uint64_t v12 = 0;
        goto LABEL_18;
      }
      ++*(void *)(a1 + 16);
    }
  }
  uint64_t v12 = 0;
LABEL_19:

  return v12;
}

void sub_21E86A4A4()
{
  uint64_t v0 = 0;
  uint64_t v1 = 40;
  do
  {
    uint64_t v2 = 2 * v1;
    uint64_t v7 = 2 * v1;
    uint64_t v0 = malloc_type_realloc(v0, 192 * v1, 0x1000040565EDBD2uLL);
    if ((ledger() & 0x80000000) != 0)
    {
      free(v0);
      qword_267D45CC8 = -1;
      perror("Unable to retrieve ledger template info");
      return;
    }
    uint64_t v1 = v2;
  }
  while (v2 == v7);
  qword_267D45CC8 = v7;
  *(void *)&long long v3 = -1;
  *((void *)&v3 + 1) = -1;
  xmmword_267D45CA8 = v3;
  *(_OWORD *)algn_267D45CB8 = v3;
  if (v7 >= 1)
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    do
    {
      uint64_t v6 = 0;
      while (v6 == 2 || strcmp(off_2644CB0B0[v6], (const char *)v0 + 96 * v4))
      {
        if (++v6 == 4) {
          goto LABEL_12;
        }
      }
      *(void *)((char *)&xmmword_267D45CA8 + v6 * 8) = v4;
      if (++v5 == 4) {
        break;
      }
LABEL_12:
      ++v4;
    }
    while (v4 != v7);
  }
  free(v0);
}

uint64_t sub_21E86A7AC()
{
  return mach_timebase_info((mach_timebase_info_t)&dword_26AB1E320);
}

void *sub_21E86A7C0(void *a1, uint64_t a2)
{
  if (!a1) {
    return 0;
  }
  v7.receiver = a1;
  v7.super_class = (Class)FPProcessGroupMinimal;
  long long v3 = [super init];
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    uint64_t v5 = (void *)v3[1];
    v3[1] = v4;

    v3[2] = a2;
  }
  return v3;
}

FPProcessGroup *sub_21E86A908(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = objc_alloc_init(FPProcessGroup);
    v2->super._hashValue = *(void *)(a1 + 16);
    objc_storeStrong((id *)&v2->super._processes, *(id *)(a1 + 8));
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

uint64_t sub_21E86AB34(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    id v9 = v4;
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
      objc_super v7 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v6;

      uint64_t v5 = *(void **)(a1 + 32);
    }
    id v3 = (id)[v5 addObject:v9];
    id v4 = v9;
  }

  return MEMORY[0x270F9A758](v3, v4);
}

void sub_21E86ABDC(uint64_t a1, void *a2, int a3)
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

id sub_21E86AC68(uint64_t a1)
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

id sub_21E86ADAC()
{
  uint64_t v0 = sub_21E86AE04(0);
  uint64_t v1 = [v0 objectForKeyedSubscript:qword_267D45C38];

  return v1;
}

id sub_21E86AE04(__CFString *a1)
{
  uint64_t v1 = @"/Library/Managed Preferences/mobile/com.apple.ReportMemoryException.plist";
  if (a1) {
    uint64_t v1 = a1;
  }
  id v2 = v1;
  id v3 = [MEMORY[0x263F08850] defaultManager];
  int v4 = [v3 fileExistsAtPath:v2];
  if (v4) {
    uint64_t v5 = v2;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  id v7 = 0;
  if (v4)
  {
    id v7 = [NSDictionary dictionaryWithContentsOfFile:v2];
  }
  uint64_t v8 = +[RMECacheEnumerator getEPLProfilePath];
  uint64_t v69 = v6;
  if (v8)
  {
    id v9 = (void *)v8;
    unint64_t v10 = [MEMORY[0x263F08850] defaultManager];
    if ([v10 fileExistsAtPath:v9]) {
      uint64_t v11 = v9;
    }
    else {
      uint64_t v11 = 0;
    }
    id v12 = v11;

    if (v12)
    {
      uint64_t v67 = v9;
      id v12 = [NSDictionary dictionaryWithContentsOfFile:v12];
    }
    else
    {
      uint64_t v67 = 0;
    }
  }
  else
  {
    uint64_t v67 = 0;
    id v12 = 0;
  }
  id v68 = v7;
  id v70 = v12;
  id v13 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  if (has_internal_diagnostics) {
    uint64_t v15 = 30;
  }
  else {
    uint64_t v15 = 0;
  }
  BOOL v16 = (has_internal_diagnostics & 1) != 0;
  if (has_internal_diagnostics) {
    uint64_t v17 = 120;
  }
  else {
    uint64_t v17 = 0;
  }
  if (has_internal_diagnostics) {
    uint64_t v18 = 2;
  }
  else {
    uint64_t v18 = 0;
  }
  if (has_internal_diagnostics) {
    uint64_t v19 = 10;
  }
  else {
    uint64_t v19 = 0;
  }
  if (has_internal_diagnostics) {
    uint64_t v20 = 12;
  }
  else {
    uint64_t v20 = 0;
  }
  uint64_t v21 = has_internal_diagnostics ^ 1u;
  long long v22 = [NSNumber numberWithInteger:v15];
  [v13 setObject:v22 forKeyedSubscript:@"FullDiagLimit"];

  long long v23 = [NSNumber numberWithInteger:v16];
  [v13 setObject:v23 forKeyedSubscript:@"GCoreDiagLimit"];

  long long v24 = [NSNumber numberWithInteger:v17];
  [v13 setObject:v24 forKeyedSubscript:@"LiteDiagLimit"];

  long long v25 = [NSNumber numberWithInteger:v16];
  [v13 setObject:v25 forKeyedSubscript:@"PerProcessLimit"];

  uint64_t v26 = [NSNumber numberWithInteger:v20];
  [v13 setObject:v26 forKeyedSubscript:@"LitePerProcessLimit"];

  long long v27 = [NSNumber numberWithInteger:v18];
  [v13 setObject:v27 forKeyedSubscript:@"PerCriticalProcessLimit"];

  long long v28 = [NSNumber numberWithInteger:v19];
  [v13 setObject:v28 forKeyedSubscript:@"MSLFullDiagLimit"];

  long long v29 = [NSNumber numberWithInteger:v19];
  [v13 setObject:v29 forKeyedSubscript:@"ThresholdFullDiagLimit"];

  uint64_t v30 = [MEMORY[0x263EFF9A0] dictionary];
  [v13 setObject:v30 forKeyedSubscript:@"ProcessSpecificFullDiagQuotas"];

  uint64_t v31 = [NSNumber numberWithBool:v21];
  [v13 setObject:v31 forKeyedSubscript:@"AllowAllProcessesInSysdiagnose"];

  uint64_t v32 = (void *)[objc_alloc(MEMORY[0x263EFF9C0]) initWithArray:&unk_26CFD82D0];
  if ([v32 count]) {
    id v33 = (id)[v32 mutableCopy];
  }
  else {
    id v33 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  }
  uint64_t v34 = v33;
  [v13 setObject:v33 forKeyedSubscript:@"ProcessesAllowedInSysdiagnose"];

  uint64_t v35 = [MEMORY[0x263EFF9C0] set];
  if (os_variant_has_internal_diagnostics())
  {
    [v35 addObject:@"mediaserverd"];
    [v35 addObject:@"cameracaptured"];
  }
  if (os_variant_has_internal_diagnostics()) {
    [v35 addObject:@"backboardd"];
  }
  [v13 setObject:v35 forKeyedSubscript:@"LargeExemptedProcesses"];

  [v13 setObject:v32 forKeyedSubscript:qword_267D45C38];
  BOOL v36 = [NSNumber numberWithBool:0];
  [v13 setObject:v36 forKeyedSubscript:@"CollectIOAccelMemInfo"];

  uint64_t v37 = [MEMORY[0x263EFF980] array];
  [v13 setObject:v37 forKeyedSubscript:@"FullContentExecNamesList"];

  id v38 = objc_alloc(MEMORY[0x263EFF9A0]);
  id v39 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v40 = [v38 initWithObjectsAndKeys:v39, @"ExecNameList", 0];
  long long v41 = MREExceptionTypeToString(2);
  [v13 setObject:v40 forKeyedSubscript:v41];

  id v42 = objc_alloc(MEMORY[0x263EFF9A0]);
  id v43 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v44 = [v42 initWithObjectsAndKeys:v43, @"ExecNameList", 0];
  long long v45 = MREExceptionTypeToString(3);
  [v13 setObject:v44 forKeyedSubscript:v45];

  id v46 = objc_alloc(MEMORY[0x263EFF9A0]);
  id v47 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v48 = [v46 initWithObjectsAndKeys:v47, @"ExecNameList", 0];
  long long v49 = MREExceptionTypeToString(4);
  [v13 setObject:v48 forKeyedSubscript:v49];

  id v50 = objc_alloc(MEMORY[0x263EFF9A0]);
  id v51 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v52 = [v50 initWithObjectsAndKeys:v51, @"ExecNameList", 0];
  long long v53 = MREExceptionTypeToString(5);
  [v13 setObject:v52 forKeyedSubscript:v53];

  id v54 = objc_alloc(MEMORY[0x263EFF9A0]);
  id v55 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v56 = [v54 initWithObjectsAndKeys:v55, @"ExecNameList", 0];
  long long v57 = MREExceptionTypeToString(1);
  [v13 setObject:v56 forKeyedSubscript:v57];

  id v58 = objc_alloc(MEMORY[0x263EFF9A0]);
  id v59 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v60 = [v58 initWithObjectsAndKeys:v59, @"ExecNameList", 0];
  long long v61 = MREExceptionTypeToString(6);
  [v13 setObject:v60 forKeyedSubscript:v61];

  id v62 = objc_alloc(MEMORY[0x263EFF9A0]);
  id v63 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v64 = [v62 initWithObjectsAndKeys:v63, @"ExecNameList", 0];
  unint64_t v65 = MREExceptionTypeToString(0);
  [v13 setObject:v64 forKeyedSubscript:v65];

  if (v70) {
    sub_21E86B5B4(v13, v70);
  }
  if (v68) {
    sub_21E86B5B4(v13, v68);
  }

  return v13;
}

uint64_t sub_21E86B564(void *a1)
{
  id v1 = a1;
  id v2 = sub_21E86ADAC();
  uint64_t v3 = [v2 containsObject:v1];

  return v3;
}

void sub_21E86B5B4(void *a1, void *a2)
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  unint64_t v5 = 0x263EFF000uLL;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v4 objectForKeyedSubscript:@"ExpirationDate"];
    if (!v6)
    {
LABEL_5:
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      unint64_t v10 = [v3 allKeys];
      uint64_t v11 = [v10 countByEnumeratingWithState:&v55 objects:v65 count:16];
      if (!v11) {
        goto LABEL_75;
      }
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v56;
      long long v44 = v10;
      while (1)
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v56 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v55 + 1) + 8 * v14);
          if (([v15 isEqualToString:@"FullDiagLimit"] & 1) != 0
            || ([v15 isEqualToString:@"GCoreDiagLimit"] & 1) != 0
            || ([v15 isEqualToString:@"MSLFullDiagLimit"] & 1) != 0
            || ([v15 isEqualToString:@"ThresholdFullDiagLimit"] & 1) != 0
            || ([v15 isEqualToString:@"LiteDiagLimit"] & 1) != 0
            || ([v15 isEqualToString:@"PerProcessLimit"] & 1) != 0
            || ([v15 isEqualToString:@"LitePerProcessLimit"] & 1) != 0
            || ([v15 isEqualToString:@"PerCriticalProcessLimit"] & 1) != 0
            || [v15 isEqualToString:@"AllowAllProcessesInSysdiagnose"])
          {
            id v16 = [v4 objectForKeyedSubscript:v15];
            if (v16)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0
                && (unint64_t)([v16 integerValue] + 1) <= 0x2711)
              {
                [v3 setObject:v16 forKeyedSubscript:v15];
              }
            }
          }
          else if ([v15 isEqualToString:@"ProcessSpecificFullDiagQuotas"])
          {
            id v16 = [v4 objectForKeyedSubscript:v15];
            if (v16)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v17 = [v3 objectForKeyedSubscript:v15];
                sub_21E86C4C4(v17, v16);
              }
            }
          }
          else if (([v15 isEqualToString:@"LargeExemptedProcesses"] & 1) != 0 {
                 || ([v15 isEqualToString:@"FullContentExecNamesList"] & 1) != 0
          }
                 || [v15 isEqualToString:qword_267D45C38])
          {
            id v16 = [v4 objectForKeyedSubscript:v15];
            if (v16)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v41 = v6;
                id v43 = v3;
                long long v53 = 0u;
                long long v54 = 0u;
                long long v51 = 0u;
                long long v52 = 0u;
                id v16 = v16;
                uint64_t v18 = [v16 countByEnumeratingWithState:&v51 objects:v64 count:16];
                if (v18)
                {
                  uint64_t v19 = v18;
                  uint64_t v45 = *(void *)v52;
                  do
                  {
                    for (uint64_t i = 0; i != v19; ++i)
                    {
                      if (*(void *)v52 != v45) {
                        objc_enumerationMutation(v16);
                      }
                      uint64_t v21 = *(void **)(*((void *)&v51 + 1) + 8 * i);
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        if (![v15 isEqualToString:@"FullContentExecNamesList"]
                          || os_variant_has_internal_diagnostics()
                          && ([v21 isEqualToString:@"mediaserverd"] & 1) != 0)
                        {
                          long long v22 = [v43 objectForKeyedSubscript:v15];
                          [v22 addObject:v21];

                          unint64_t v10 = v44;
                          if ([v15 isEqualToString:qword_267D45C38])
                          {
                            long long v23 = [v43 objectForKeyedSubscript:@"ProcessesAllowedInSysdiagnose"];
                            [v23 addObject:v21];

                            unint64_t v10 = v44;
                          }
                        }
                        else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 138412546;
                          long long v61 = v21;
                          __int16 v62 = 2112;
                          id v63 = @"FullContentExecNamesList";
                          _os_log_impl(&dword_21E853000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Ignoring process \"%@\" for \"%@\" key, since it isn't know to have received privacy approval for collecting fullContent memgraphs for this OS configuration.", buf, 0x16u);
                        }
                      }
                    }
                    uint64_t v19 = [v16 countByEnumeratingWithState:&v51 objects:v64 count:16];
                  }
                  while (v19);
                }
LABEL_49:

                id v3 = v43;
                id v6 = v41;
                unint64_t v5 = 0x263EFF000;
              }
            }
          }
          else
          {
            if (![v15 isEqualToString:@"ProcessesAllowedInSysdiagnose"])
            {
              int v30 = [v15 isEqualToString:@"CollectIOAccelMemInfo"];
              uint64_t v31 = [v4 objectForKeyedSubscript:v15];
              id v16 = (id)v31;
              if (v30)
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  [v3 setObject:v16 forKeyedSubscript:@"CollectIOAccelMemInfo"];
                }
                goto LABEL_73;
              }
              if (v31)
              {
                id v42 = v6;
                uint64_t v32 = [v3 objectForKeyedSubscript:v15];
                id v33 = [v16 objectForKeyedSubscript:@"PerProcessLimit"];
                if (v33 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  if ((unint64_t)([v33 integerValue] + 1) <= 0x2711)
                  {
                    [v32 setObject:v33 forKeyedSubscript:@"PerProcessLimit"];
                    goto LABEL_71;
                  }
                }
                else
                {
LABEL_71:
                  [v32 objectForKeyedSubscript:@"ExecNameList"];
                  uint64_t v34 = v46 = v32;
                  [v16 objectForKeyedSubscript:@"ExecNameList"];
                  unint64_t v35 = v5;
                  v37 = id v36 = v3;
                  sub_21E86C4C4(v34, v37);

                  id v3 = v36;
                  unint64_t v5 = v35;

                  uint64_t v32 = v46;
                }

                id v6 = v42;
              }
LABEL_73:
              unint64_t v10 = v44;
              goto LABEL_23;
            }
            id v16 = [v4 objectForKeyedSubscript:v15];
            if (v16)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v41 = v6;
                id v43 = v3;
                long long v49 = 0u;
                long long v50 = 0u;
                long long v47 = 0u;
                long long v48 = 0u;
                id v16 = v16;
                uint64_t v24 = [v16 countByEnumeratingWithState:&v47 objects:v59 count:16];
                if (v24)
                {
                  uint64_t v25 = v24;
                  uint64_t v26 = *(void *)v48;
                  do
                  {
                    for (uint64_t j = 0; j != v25; ++j)
                    {
                      if (*(void *)v48 != v26) {
                        objc_enumerationMutation(v16);
                      }
                      uint64_t v28 = *(void *)(*((void *)&v47 + 1) + 8 * j);
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        long long v29 = [v43 objectForKeyedSubscript:@"ProcessesAllowedInSysdiagnose"];
                        [v29 addObject:v28];

                        unint64_t v10 = v44;
                      }
                    }
                    uint64_t v25 = [v16 countByEnumeratingWithState:&v47 objects:v59 count:16];
                  }
                  while (v25);
                }
                goto LABEL_49;
              }
            }
          }
LABEL_23:

          ++v14;
        }
        while (v14 != v12);
        uint64_t v38 = [v10 countByEnumeratingWithState:&v55 objects:v65 count:16];
        uint64_t v12 = v38;
        if (!v38)
        {
LABEL_75:

          goto LABEL_79;
        }
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [MEMORY[0x263EFF910] date];
      uint64_t v8 = [v6 compare:v7];

      BOOL v9 = v8 == -1;
      unint64_t v5 = 0x263EFF000uLL;
      if (!v9) {
        goto LABEL_5;
      }
      if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        goto LABEL_79;
      }
      *(_WORD *)buf = 0;
      id v39 = MEMORY[0x263EF8438];
      long long v40 = "The input preferences have expired. Skipping.";
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
      {
LABEL_79:

        goto LABEL_80;
      }
      *(_WORD *)buf = 0;
      id v39 = MEMORY[0x263EF8438];
      long long v40 = "The input preferences are malformed. Skipping.";
    }
    _os_log_error_impl(&dword_21E853000, v39, OS_LOG_TYPE_ERROR, v40, buf, 2u);
    goto LABEL_79;
  }
LABEL_80:
}

id sub_21E86BDF8(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 rangeOfString:@"_"];
  if (v2 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_10;
  }
  uint64_t v3 = v2;
  id v4 = [NSString stringWithUTF8String:".memgraph"];
  char v5 = [v1 hasSuffix:v4];

  if (v5)
  {
    uint64_t v6 = 34;
  }
  else
  {
    id v7 = [NSString stringWithUTF8String:".lite_diag"];
    int v8 = [v1 hasSuffix:v7];

    if (!v8) {
      goto LABEL_10;
    }
    uint64_t v6 = 35;
  }
  uint64_t v9 = v3 + 1;
  if ([v1 containsString:qword_267D45C40]) {
    v9 += [(id)qword_267D45C40 length];
  }
  uint64_t v10 = v9 + v6;
  uint64_t v11 = [v1 length];
  if (v11 > v10)
  {
    uint64_t v12 = [v1 substringWithRange:v9, v11 - v10];
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v12 = 0;
LABEL_11:

  return v12;
}

id sub_21E86BF24(char a1, void *a2, void *a3)
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v44 = a2;
  id v4 = a3;
  char v5 = [MEMORY[0x263EFF980] array];
  uint64_t v6 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:-3600.0];
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v42 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v8 = [v4 nextValidURL];
  id v39 = v4;
  long long v41 = (void *)v6;
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    uint64_t v10 = *MEMORY[0x263EFF610];
    uint64_t v45 = *MEMORY[0x263EFF750];
    while (1)
    {
      uint64_t v11 = (void *)MEMORY[0x223C32890]();
      id v57 = 0;
      [v9 getResourceValue:&v57 forKey:v10 error:0];
      id v12 = v57;
      if (v12) {
        break;
      }
LABEL_25:

      uint64_t v22 = [v4 nextValidURL];

      uint64_t v9 = (void *)v22;
      if (!v22) {
        goto LABEL_26;
      }
    }
    id v56 = 0;
    [v9 getResourceValue:&v56 forKey:v45 error:0];
    id v13 = v56;
    if (!v13 || (a1 & 1) == 0 && [v12 compare:v6] != -1 && objc_msgSend(v12, "compare:", v6))
    {
LABEL_24:

      goto LABEL_25;
    }
    if (!v44 || [v13 hasSuffix:@".lite_diag"])
    {
      [v42 addObject:v9];
      goto LABEL_24;
    }
    uint64_t v14 = sub_21E86BDF8(v13);
    if (!v14) {
      goto LABEL_24;
    }
    id v40 = v14;
    id v15 = v44;
    id v16 = [v15 objectForKeyedSubscript:@"AllowAllProcessesInSysdiagnose"];
    uint64_t v17 = v16;
    if (v16 && [v16 BOOLValue])
    {

      uint64_t v18 = v40;
      id v4 = v39;
    }
    else
    {
      uint64_t v19 = [v15 objectForKeyedSubscript:@"ProcessesAllowedInSysdiagnose"];
      uint64_t v37 = v15;
      uint64_t v18 = v40;
      int v38 = [v19 containsObject:v40];

      id v4 = v39;
      uint64_t v6 = (uint64_t)v41;
      if (!v38)
      {
LABEL_23:

        goto LABEL_24;
      }
    }
    uint64_t v20 = [v7 objectForKeyedSubscript:v18];
    if (v20)
    {
      id v55 = 0;
      [v9 getResourceValue:&v55 forKey:v10 error:0];
      id v21 = v55;
      id v54 = 0;
      [v20 getResourceValue:&v54 forKey:v10 error:0];
      if ([v54 compare:v21] == -1)
      {
        [v42 addObject:];
        [v7 setObject:v9 forKeyedSubscript:v40];
      }
      else
      {
        [v42 addObject:v9];
      }
    }
    else
    {
      [v7 setObject:v9 forKeyedSubscript:v18];
    }

    uint64_t v18 = v40;
    uint64_t v6 = (uint64_t)v41;
    goto LABEL_23;
  }
LABEL_26:
  [v42 sortUsingComparator:&unk_26CFD2690];
  long long v23 = [v7 keysSortedByValueUsingComparator:&unk_26CFD2690];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v50 objects:v59 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v51 != v26) {
          objc_enumerationMutation(v23);
        }
        uint64_t v28 = [v7 objectForKeyedSubscript:*(void *)(*((void *)&v50 + 1) + 8 * i)];
        long long v29 = [v28 path];
        [v5 addObject:v29];
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v50 objects:v59 count:16];
    }
    while (v25);
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v30 = v42;
  uint64_t v31 = [v30 countByEnumeratingWithState:&v46 objects:v58 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v47;
    do
    {
      for (uint64_t j = 0; j != v32; ++j)
      {
        if (*(void *)v47 != v33) {
          objc_enumerationMutation(v30);
        }
        unint64_t v35 = [*(id *)(*((void *)&v46 + 1) + 8 * j) path];
        [v5 addObject:v35];
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v46 objects:v58 count:16];
    }
    while (v32);
  }

  return v5;
}

uint64_t sub_21E86C428(uint64_t a1, void *a2, void *a3)
{
  id v10 = 0;
  uint64_t v4 = *MEMORY[0x263EFF610];
  id v5 = a3;
  [a2 getResourceValue:&v10 forKey:v4 error:0];
  id v9 = 0;
  id v6 = v10;
  [v5 getResourceValue:&v9 forKey:v4 error:0];

  uint64_t v7 = [v9 compare:v6];
  return v7;
}

void sub_21E86C4C4(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v11 = a1;
  id v3 = a2;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      uint64_t v4 = [v3 allKeys];
      uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v13;
        do
        {
          uint64_t v8 = 0;
          do
          {
            if (*(void *)v13 != v7) {
              objc_enumerationMutation(v4);
            }
            uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * v8);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v10 = [v3 objectForKeyedSubscript:v9];
              if (v10)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0
                  && (unint64_t)([v10 integerValue] + 1) <= 0x2711)
                {
                  [v11 setObject:v10 forKeyedSubscript:v9];
                }
              }
            }
            ++v8;
          }
          while (v6 != v8);
          uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v6);
      }
    }
  }
}

uint64_t sub_21E86C67C()
{
  return 1;
}

FPAuxData *sub_21E86C684(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    int v9 = [v7 fp_isContainer];
    if (v9 != objc_msgSend(v8, "fp_isContainer")) {
      __assert_rtn("-[NSDictionary(FPAuxData) fp_mergeAuxDatum:withDatum:forceAggregate:]", "FPAuxData.m", 18, "!datum2 || datum1.fp_isContainer == datum2.fp_isContainer");
    }
  }
  if (objc_msgSend(v7, "fp_isContainer"))
  {
    [v7 fp_mergeWithData:v8 forceAggregate:a5];
    id v10 = (FPAuxData *)objc_claimAutoreleasedReturnValue();
LABEL_10:
    id v11 = v10;
    goto LABEL_11;
  }
  if ((a5 & 1) != 0 || [v7 shouldAggregate])
  {
    if (v8) {
      id v10 = [[FPAuxData alloc] initWithValue:[v8 value] + [v7 value] shouldAggregate:[v7 shouldAggregate]];
    }
    else {
      id v10 = (FPAuxData *)v7;
    }
    goto LABEL_10;
  }
  id v11 = 0;
LABEL_11:

  return v11;
}

uint64_t sub_21E86C7A8(void *a1, const char *a2, uint64_t a3)
{
  return [a1 fp_mergeWithData:a3 forceAggregate:0];
}

id sub_21E86C7B0(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v27 = a3;
  if (v27 || !a4)
  {
    id v7 = [MEMORY[0x263EFF9A0] dictionary];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v8 = a1;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v33 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          long long v14 = [v8 objectForKeyedSubscript:v13];
          long long v15 = [v27 objectForKeyedSubscript:v13];
          id v16 = [v8 fp_mergeAuxDatum:v14 withDatum:v15 forceAggregate:a4];
          [v7 setObject:v16 forKeyedSubscript:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v10);
    }

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v17 = v27;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v29;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v29 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v28 + 1) + 8 * j);
          long long v23 = [v8 objectForKeyedSubscript:v22];

          if (!v23)
          {
            uint64_t v24 = [v17 objectForKeyedSubscript:v22];
            uint64_t v25 = [v8 fp_mergeAuxDatum:v24 withDatum:0 forceAggregate:a4];
            [v7 setObject:v25 forKeyedSubscript:v22];
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v28 objects:v36 count:16];
      }
      while (v19);
    }

    if ([v7 count]) {
      id v6 = v7;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = a1;
  }

  return v6;
}

id sub_21E86CA64(void *a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263EFF9A0] dictionary];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = a1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v9 = [v3 objectForKeyedSubscript:v8];
        uint64_t v10 = [v9 fp_jsonRepresentation];
        [v2 setObject:v10 forKeyedSubscript:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  return v2;
}

void sub_21E86CE40()
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v15 = 1;
  uint64_t v0 = container_system_group_path_for_identifier();
  if (v0)
  {
    id v1 = (void *)v0;
    uint64_t v2 = [[NSString alloc] initWithFormat:@"%s/MemoryLimitViolations", v0];
    if ([v2 hasPrefix:@"/private"])
    {
      uint64_t v3 = [v2 substringFromIndex:[@"/private" length]];

      uint64_t v2 = (void *)v3;
    }
    id v4 = v2;
    uint64_t v5 = (const char *)[v4 UTF8String];
    if (!v5) {
      goto LABEL_21;
    }
    uint64_t v6 = v5;
    memset(&v18, 0, sizeof(v18));
    int v7 = stat(v5, &v18);
    if (v7)
    {
      if (v7 != -1)
      {
LABEL_21:
        free(v1);
        goto LABEL_22;
      }
      if (mkpath_np(v6, 0x1C0u))
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          uint64_t v17 = v6;
          _os_log_error_impl(&dword_21E853000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Unable to create container at %s", buf, 0xCu);
        }
        goto LABEL_21;
      }
    }
    uint64_t v8 = [NSURL fileURLWithPath:v4];
    uint64_t v9 = v8;
    if (v8)
    {
      uint64_t v10 = *MEMORY[0x263EFF6B0];
      id v14 = 0;
      int v11 = [v8 setResourceValue:MEMORY[0x263EFFA88] forKey:v10 error:&v14];
      id v12 = v14;
      long long v13 = v12;
      if (v11 && !v12)
      {

        objc_storeStrong((id *)&qword_26AB1E330, v4);
        goto LABEL_21;
      }
    }
    else
    {
      long long v13 = 0;
    }
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v17 = v6;
      _os_log_error_impl(&dword_21E853000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Unable to exclude the container from backups: %s", buf, 0xCu);
    }

    goto LABEL_21;
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
  {
    v18.st_dev = 134217984;
    *(void *)&v18.st_mode = v15;
    _os_log_error_impl(&dword_21E853000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Error fetching container: %llu", (uint8_t *)&v18, 0xCu);
  }
  id v4 = (id)qword_26AB1E330;
  qword_26AB1E330 = 0;
LABEL_22:
}

void sub_21E86D158()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v0 = container_system_group_path_for_identifier();
  if (v0)
  {
    id v1 = (void *)v0;
    uint64_t v2 = [[NSString alloc] initWithFormat:@"%s/epl_preferences.plist", v0];
    uint64_t v3 = (void *)qword_26AB1E340;
    qword_26AB1E340 = v2;

    free(v1);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v6 = 1;
      _os_log_error_impl(&dword_21E853000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Error fetching container: %llu", buf, 0xCu);
    }
    id v4 = (void *)qword_26AB1E340;
    qword_26AB1E340 = 0;
  }
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x270EE45E8](bundle);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionaryReplaceValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x270EE5098](alloc, theString);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x270EE53F0](allocator, filePath, pathStyle, isDirectory);
}

CFUUIDRef CFUUIDCreateFromString(CFAllocatorRef alloc, CFStringRef uuidStr)
{
  return (CFUUIDRef)MEMORY[0x270EE5478](alloc, uuidStr);
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x270EE5480](alloc, *(void *)&bytes.byte0, *(void *)&bytes.byte8);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x270EE5488](alloc, uuid);
}

uint64_t CSIsNull()
{
  return MEMORY[0x270F236B0]();
}

uint64_t CSRegionGetName()
{
  return MEMORY[0x270F236C8]();
}

uint64_t CSRegionGetRange()
{
  return MEMORY[0x270F236D0]();
}

uint64_t CSRelease()
{
  return MEMORY[0x270F236D8]();
}

uint64_t CSRetain()
{
  return MEMORY[0x270F236E0]();
}

uint64_t CSSymbolGetName()
{
  return MEMORY[0x270F23738]();
}

uint64_t CSSymbolGetRange()
{
  return MEMORY[0x270F23740]();
}

uint64_t CSSymbolOwnerForeachSegment()
{
  return MEMORY[0x270F23770]();
}

uint64_t CSSymbolOwnerGetArchitecture()
{
  return MEMORY[0x270F23788]();
}

uint64_t CSSymbolOwnerGetBaseAddress()
{
  return MEMORY[0x270F23790]();
}

uint64_t CSSymbolOwnerGetCFUUIDBytes()
{
  return MEMORY[0x270F23798]();
}

uint64_t CSSymbolOwnerGetName()
{
  return MEMORY[0x270F237A8]();
}

uint64_t CSSymbolOwnerGetPath()
{
  return MEMORY[0x270F237B0]();
}

uint64_t CSSymbolOwnerGetSymbolWithAddress()
{
  return MEMORY[0x270F237C0]();
}

uint64_t CSSymbolicatorCreateWithTaskFlagsAndNotification()
{
  return MEMORY[0x270F23848]();
}

uint64_t CSSymbolicatorForeachSymbolicatorWithURL()
{
  return MEMORY[0x270F23888]();
}

uint64_t CSSymbolicatorGetFlagsForNoSymbolOrSourceInfoData()
{
  return MEMORY[0x270F238A8]();
}

uint64_t CSSymbolicatorGetSymbolOwnerWithAddressAtTime()
{
  return MEMORY[0x270F238D8]();
}

uint64_t CSSymbolicatorGetSymbolOwnerWithUUIDAtTime()
{
  return MEMORY[0x270F238F0]();
}

uint64_t NSLocalizedFileSizeDescription()
{
  return MEMORY[0x270EF2B10]();
}

const NXArchInfo *__cdecl NXGetArchInfoFromCpuType(cpu_type_t cputype, cpu_subtype_t cpusubtype)
{
  return (const NXArchInfo *)MEMORY[0x270ED7C78](*(void *)&cputype, *(void *)&cpusubtype);
}

uint64_t SMJobIsEnabled()
{
  return MEMORY[0x270F5CFF8]();
}

uint64_t VMUGetFlagsForAllVMRegionStatistics()
{
  return MEMORY[0x270F794D8]();
}

uint64_t VMURegionTypeDescriptionForTagShareProtAndPager()
{
  return MEMORY[0x270F794E0]();
}

uint64_t VMUScanningMaskForAllReferences()
{
  return MEMORY[0x270F794E8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFBundleCreateWithExecutableURLIfLooksLikeBundle()
{
  return MEMORY[0x270EE55C8]();
}

uint64_t _CFCopySupplementalVersionDictionary()
{
  return MEMORY[0x270EE55E8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x270ED7E28](*(void *)&a1, a2);
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x270ED7EE0]();
}

uint64_t _os_assert_log()
{
  return MEMORY[0x270ED8050]();
}

uint64_t _os_crash()
{
  return MEMORY[0x270ED8060]();
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

uint64_t container_system_group_path_for_identifier()
{
  return MEMORY[0x270ED90F0]();
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

uint64_t dyld_image_for_each_segment_info()
{
  return MEMORY[0x270ED96B8]();
}

uint64_t dyld_image_get_file_path()
{
  return MEMORY[0x270ED96C0]();
}

uint64_t dyld_image_get_installname()
{
  return MEMORY[0x270ED96C8]();
}

uint64_t dyld_process_create_for_task()
{
  return MEMORY[0x270ED96E0]();
}

uint64_t dyld_process_dispose()
{
  return MEMORY[0x270ED96E8]();
}

uint64_t dyld_process_snapshot_create_for_process()
{
  return MEMORY[0x270ED96F0]();
}

uint64_t dyld_process_snapshot_dispose()
{
  return MEMORY[0x270ED96F8]();
}

uint64_t dyld_process_snapshot_for_each_image()
{
  return MEMORY[0x270ED9700]();
}

uint64_t dyld_process_snapshot_get_shared_cache()
{
  return MEMORY[0x270ED9708]();
}

uint64_t dyld_shared_cache_copy_uuid()
{
  return MEMORY[0x270ED9720]();
}

uint64_t dyld_shared_cache_for_each_file()
{
  return MEMORY[0x270ED9728]();
}

uint64_t dyld_shared_cache_for_file()
{
  return MEMORY[0x270ED9738]();
}

uint64_t dyld_shared_cache_get_base_address()
{
  return MEMORY[0x270ED9740]();
}

uint64_t dyld_shared_cache_get_mapped_size()
{
  return MEMORY[0x270ED9748]();
}

uint64_t dyld_shared_cache_is_mapped_private()
{
  return MEMORY[0x270ED9750]();
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

void free(void *a1)
{
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x270ED9D98](a1, a2);
}

uint64_t ledger()
{
  return MEMORY[0x270EDA040]();
}

void mach_error(const char *str, mach_error_t error_value)
{
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x270EDA168](*(void *)&error_value);
}

uint64_t mach_get_times()
{
  return MEMORY[0x270EDA170]();
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x270EDA1C8](*(void *)&task, *(void *)&name);
}

kern_return_t mach_port_get_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_urefs_t *refs)
{
  return MEMORY[0x270EDA1F0](*(void *)&task, *(void *)&name, *(void *)&right, refs);
}

kern_return_t mach_port_kernel_object(ipc_space_read_t task, mach_port_name_t name, unsigned int *object_type, unsigned int *object_addr)
{
  return MEMORY[0x270EDA208](*(void *)&task, *(void *)&name, object_type, object_addr);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x270EDA210](*(void *)&task, *(void *)&name, *(void *)&right, *(void *)&delta);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

kern_return_t mach_vm_page_range_query(vm_map_read_t target_map, mach_vm_offset_t address, mach_vm_size_t size, mach_vm_address_t dispositions, mach_vm_size_t *dispositions_count)
{
  return MEMORY[0x270EDA2B0](*(void *)&target_map, address, size, dispositions, dispositions_count);
}

kern_return_t mach_vm_purgable_control(vm_map_t target_task, mach_vm_address_t address, vm_purgable_t control, int *state)
{
  return MEMORY[0x270EDA2C0](*(void *)&target_task, address, *(void *)&control, state);
}

kern_return_t mach_vm_region(vm_map_read_t target_task, mach_vm_address_t *address, mach_vm_size_t *size, vm_region_flavor_t flavor, vm_region_info_t info, mach_msg_type_number_t *infoCnt, mach_port_t *object_name)
{
  return MEMORY[0x270EDA2C8](*(void *)&target_task, address, size, *(void *)&flavor, info, infoCnt, object_name);
}

kern_return_t mach_vm_region_recurse(vm_map_read_t target_task, mach_vm_address_t *address, mach_vm_size_t *size, natural_t *nesting_depth, vm_region_recurse_info_t info, mach_msg_type_number_t *infoCnt)
{
  return MEMORY[0x270EDA2D0](*(void *)&target_task, address, size, nesting_depth, info, infoCnt);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3A0](ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

uint64_t memorystatus_control()
{
  return MEMORY[0x270EDA490]();
}

int mkpath_np(const char *path, mode_t omode)
{
  return MEMORY[0x270EDA550](path, omode);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x270EDAB30]();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x270EDAB40]();
}

void perror(const char *a1)
{
}

kern_return_t pid_for_task(mach_port_name_t t, int *x)
{
  return MEMORY[0x270EDAC18](*(void *)&t, x);
}

int proc_get_dirty(pid_t pid, uint32_t *flags)
{
  return MEMORY[0x270EDAD40](*(void *)&pid, flags);
}

int proc_listallpids(void *buffer, int buffersize)
{
  return MEMORY[0x270EDAD48](buffer, *(void *)&buffersize);
}

int proc_pid_rusage(int pid, int flavor, rusage_info_t *buffer)
{
  return MEMORY[0x270EDAD68](*(void *)&pid, *(void *)&flavor, buffer);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x270EDAD78](*(void *)&pid, *(void *)&flavor, arg, buffer, *(void *)&buffersize);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x270EDAD88](*(void *)&pid, buffer, *(void *)&buffersize);
}

int proc_regionfilename(int pid, uint64_t address, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x270EDAD98](*(void *)&pid, address, buffer, *(void *)&buffersize);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x270EDB4D0](*(void *)&a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDB568](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

int strerror_r(int __errnum, char *__strerrbuf, size_t __buflen)
{
  return MEMORY[0x270EDB5E8](*(void *)&__errnum, __strerrbuf, __buflen);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x270EDB7D0](a1, *(void *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}

kern_return_t task_map_corpse_info_64(task_t task, task_read_t corspe_task, mach_vm_address_t *kcd_addr_begin, mach_vm_size_t *kcd_size)
{
  return MEMORY[0x270EDB870](*(void *)&task, *(void *)&corspe_task, kcd_addr_begin, kcd_size);
}

uint64_t task_read_for_pid()
{
  return MEMORY[0x270EDB880]();
}

kern_return_t task_resume2(task_suspension_token_t suspend_token)
{
  return MEMORY[0x270EDB890](*(void *)&suspend_token);
}

kern_return_t task_suspend2(task_read_t target_task, task_suspension_token_t *suspend_token)
{
  return MEMORY[0x270EDB8A8](*(void *)&target_task, suspend_token);
}

kern_return_t thread_info(thread_inspect_t target_act, thread_flavor_t flavor, thread_info_t thread_info_out, mach_msg_type_number_t *thread_info_outCnt)
{
  return MEMORY[0x270EDB8F8](*(void *)&target_act, *(void *)&flavor, thread_info_out, thread_info_outCnt);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x270EDBA90](*(void *)&target_task, address, size);
}

uint64_t xpc_coalition_copy_info()
{
  return MEMORY[0x270EDBE10]();
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDBE58](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x270EDBED0](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC088](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

uint64_t xpc_dictionary_set_mach_send()
{
  return MEMORY[0x270EDC128]();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}