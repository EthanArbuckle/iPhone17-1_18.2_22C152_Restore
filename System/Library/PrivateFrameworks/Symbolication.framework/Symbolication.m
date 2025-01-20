_DWORD *copySamplingResultToCallstack(_DWORD *result, int a2, const void *a3, const void *a4, unsigned int a5, int a6)
{
  _DWORD *v7;
  size_t v11;
  void *v12;
  void *v13;

  v7 = result;
  result[10] = a5;
  if (a5)
  {
    v11 = 8 * a5;
    v12 = malloc_type_malloc(v11, 0x9CF6DC70uLL);
    *((void *)v7 + 3) = v12;
    result = memcpy(v12, a3, v11);
    if (a6)
    {
      v13 = malloc_type_malloc(v11, 0x857BF787uLL);
      *((void *)v7 + 4) = v13;
      result = memcpy(v13, a4, v11);
    }
  }
  v7[1] = a2;
  return result;
}

void markStacks(void *a1, void *a2)
{
  id v25 = a1;
  id v3 = a2;
  unint64_t v4 = [v25 count];
  int v5 = [v3 threadCount];
  if (v5)
  {
    LODWORD(v6) = v5;
    do
    {
      uint64_t v6 = (v6 - 1);
      unint64_t v7 = [v3 stackPointerForThreadNum:v6];
      uint64_t v26 = 0;
      unint64_t RegionForAddress = findRegionForAddress(v25, v7, (void **)&v26);
      uint64_t v9 = v26;
      if (v26)
      {
        unint64_t v10 = RegionForAddress;
        while (!*(void *)(v9 + 32))
        {
          if (*(_DWORD *)(v9 + 24)) {
            break;
          }
          if (*(unsigned char *)(v9 + 50) != 3) {
            break;
          }
          if (![(id)v9 isStack]) {
            break;
          }
          if (++v10 >= v4) {
            break;
          }
          uint64_t v11 = [v25 objectAtIndex:v10];

          uint64_t v9 = v11;
          if (!v11) {
            goto LABEL_13;
          }
        }
        if (!*(void *)(v9 + 32) && *(_DWORD *)(v9 + 24) && [(id)v9 isStack])
        {
          v12 = *(void **)(v9 + 32);
          *(void *)(v9 + 32) = @"Stack";

          uint64_t v13 = [NSString stringWithFormat:@"thread %d", v6];
          v14 = *(void **)(v9 + 40);
          *(void *)(v9 + 40) = v13;

          if (v10 + 1 < v4)
          {
            uint64_t v15 = [v25 objectAtIndex:];
            if (!*(void *)(v15 + 32)
              && [(id)v9 isStack]
              && *(void *)(v9 + 16) + *(void *)(v9 + 8) == *(void *)(v15 + 8)
              && [(id)v9 hasSameInfoAsRegion:v15])
            {
              objc_storeStrong((id *)(v15 + 32), *(id *)(v9 + 32));
              objc_storeStrong((id *)(v15 + 40), *(id *)(v9 + 40));
            }
          }
          if (v10 >= 2)
          {
            unint64_t v16 = v10 - 1;
            while (1)
            {
              uint64_t v17 = [v25 objectAtIndex:v16];
              unint64_t v18 = v16 + 1;
              uint64_t v19 = [v25 objectAtIndex:v16 + 1];
              v20 = (void *)v19;
              if (*(void *)(v17 + 32)
                || *(void *)(v17 + 16) + *(void *)(v17 + 8) != *(void *)(v19 + 8)
                || ![(id)v17 isStack])
              {
                break;
              }
              int v21 = *(_DWORD *)(v17 + 24);
              if (v21 == 3)
              {
                objc_storeStrong((id *)(v17 + 32), *(id *)(v9 + 32));
                objc_storeStrong((id *)(v17 + 40), *(id *)(v9 + 40));
              }
              else if (!v21)
              {
                v22 = *(void **)(v17 + 32);
                *(void *)(v17 + 32) = @"STACK GUARD";

                uint64_t v23 = [NSString stringWithFormat:@"stack guard for thread %d", v6];
                v24 = *(void **)(v17 + 40);
                *(void *)(v17 + 40) = v23;

                break;
              }

              unint64_t v16 = v18 - 2;
              if (v18 == 2) {
                goto LABEL_13;
              }
            }
          }
        }
      }
LABEL_13:
    }
    while (v6);
  }
}

void __markMachOLibraries_block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1AD0D9F90]();
  unint64_t Range = CSRegionGetRange();
  uint64_t v5 = v4;
  if (VMURangeIntersectsRange(Range, v4, *(void *)(a1 + 80), *(void *)(a1 + 88)))
  {
    uint64_t v6 = getBinarySegmentName();
    unint64_t v7 = v6;
    if (*(unsigned char *)(a1 + 112) || *(unsigned char *)(a1 + 113))
    {
      if ([v6 isEqualToString:@"__LINKEDIT"])
      {
        uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
        if (*(unsigned char *)(v8 + 24))
        {
LABEL_17:

          goto LABEL_18;
        }
        *(unsigned char *)(v8 + 24) = 1;
        if (*(unsigned char *)(a1 + 113)) {
          uint64_t v9 = @"kernelcache combined __LINKEDIT";
        }
        else {
          uint64_t v9 = @"dyld shared cache combined __LINKEDIT";
        }
        goto LABEL_13;
      }
      if (*(unsigned char *)(a1 + 114))
      {
        unint64_t v10 = *(void **)(a1 + 32);
        uint64_t v11 = [NSNumber numberWithUnsignedLong:Range];
        [v10 addObject:v11];
LABEL_16:

        goto LABEL_17;
      }
    }
    uint64_t v9 = *(__CFString **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    if (!v9)
    {
      v12 = [NSString stringWithUTF8String:CSSymbolOwnerGetPath()];
      uint64_t v13 = [v12 stringByResolvingSymlinksInPath];
      uint64_t v14 = *(void *)(*(void *)(a1 + 72) + 8);
      uint64_t v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;

      uint64_t v9 = *(__CFString **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    }
LABEL_13:
    uint64_t v11 = v9;
    id v16 = [*(id *)(a1 + 40) member:v7];
    if (!v16)
    {
      [*(id *)(a1 + 40) addObject:v7];
      id v16 = v7;
    }
    setTypeAndPath(*(void **)(a1 + 48), *(void **)(a1 + 56), Range, v5, v16, v11, 1, 1);

    goto LABEL_16;
  }
LABEL_18:
}

__CFString *getBinarySegmentName()
{
  uint64_t Name = CSRegionGetName();
  if (!strcmp((const char *)Name, "MACH_HEADER")) {
    v1 = @"__TEXT";
  }
  else {
    v1 = (__CFString *)[NSString initWithBytes:Name length:strchr((char *)Name, 32)[-Name] encoding:4];
  }

  return v1;
}

void setTypeAndPath(void *a1, void *a2, unint64_t a3, uint64_t a4, void *a5, void *a6, int a7, uint64_t a8)
{
  id v35 = a1;
  id v15 = a2;
  id v36 = a5;
  VMUSanitizePath(a6);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  v40 = 0;
  unint64_t RegionForAddress = findRegionForAddress(v15, a3, &v40);
  unint64_t v17 = [v15 count];
  unint64_t v18 = v40;
  if (RegionForAddress < v17)
  {
    unint64_t v19 = v17;
    if (a7) {
      char v20 = 2;
    }
    else {
      char v20 = 0;
    }
    char v37 = v20;
    int v21 = v36;
    while (1)
    {
      uint64_t v22 = [v15 objectAtIndex:RegionForAddress];

      if ((*(unsigned char *)(v22 + 132) & 1) == 0) {
        break;
      }
LABEL_32:
      ++RegionForAddress;
      unint64_t v18 = (void *)v22;
      if (RegionForAddress >= v19) {
        goto LABEL_35;
      }
    }
    if (*(void *)(v22 + 8) > *MEMORY[0x1E4F14B00] + a4 + a3) {
      goto LABEL_35;
    }
    context = (void *)MEMORY[0x1AD0D9F90]();
    if (!VMURangeIntersectsRange(*(void *)(v22 + 8), *(void *)(v22 + 16), a3, a4))
    {
LABEL_31:
      goto LABEL_32;
    }
    unint64_t v23 = *(void *)(v22 + 8);
    if (a3 > v23)
    {
      v24 = [(id)v22 breakAtLength:a3 - v23];
      if (v24)
      {
        [v15 insertObject:v24 atIndex:++RegionForAddress];
        uint64_t v25 = a8;
        id v26 = v24;

        ++v19;
        uint64_t v22 = (uint64_t)v26;
        a8 = v25;
        int v21 = v36;
      }

      unint64_t v23 = *(void *)(v22 + 8);
    }
    uint64_t v27 = *(void *)(v22 + 16);
    if (a4 + a3 >= v27 + v23)
    {
      a3 += v27;
      a4 -= v27;
    }
    else if (*MEMORY[0x1E4F14B00] <= 0x1000uLL {
           || [v35 rangeIsInSharedCache:a3, a4] != NO
    }
           || !*(unsigned char *)(v22 + 49)
           || ([v21 isEqualToString:@"__LINKEDIT"] & 1) == 0)
    {
      v28 = [(id)v22 breakAtLength:a4];
      if (v28)
      {
        [v15 insertObject:v28 atIndex:RegionForAddress + 1];
        ++v19;
      }
    }
    *(unsigned char *)(v22 + 132) = *(unsigned char *)(v22 + 132) & 0xFD | v37;
    if ((a8 & 1) == 0 && (*(unsigned char *)(v22 + 24) & 2) != 0) {
      *(unsigned char *)(v22 + 132) |= 4u;
    }
    v29 = *(void **)(v22 + 32);
    if (v29)
    {
      [v29 rangeOfString:v21];
      if (v30)
      {
LABEL_30:
        objc_storeStrong((id *)(v22 + 40), obj);
        goto LABEL_31;
      }
      id v31 = *(id *)(v22 + 32);
      uint64_t v32 = [v31 stringByAppendingPathComponent:v21];
      v33 = *(void **)(v22 + 32);
      *(void *)(v22 + 32) = v32;
    }
    else
    {
      id v34 = v21;
      id v31 = *(id *)(v22 + 32);
      *(void *)(v22 + 32) = v34;
    }

    goto LABEL_30;
  }
  uint64_t v22 = (uint64_t)v40;
  int v21 = v36;
LABEL_35:
}

BOOL VMURangeIntersectsRange(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  if (a1 >= a3) {
    return a3 + a4 > a1;
  }
  else {
    return a1 + a2 > a3;
  }
}

BOOL VMURangeContainsRange(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  return a3 >= a1 && a3 + a4 <= a1 + a2;
}

unint64_t findRegionForAddress(void *a1, unint64_t a2, void **a3)
{
  id v5 = a1;
  uint64_t v6 = 0;
  unint64_t v7 = 0;
  unint64_t v8 = [v5 count] - 1;
  while (1)
  {
    uint64_t v9 = v6;
    unint64_t v10 = v7 + ((v8 - v7) >> 1);
    uint64_t v6 = [v5 objectAtIndex:v10];

    if (v6[1] > a2)
    {
      if (!v10) {
        goto LABEL_9;
      }
      unint64_t v8 = v10 - 1;
      goto LABEL_8;
    }
    if (v6[2] + v6[1] > a2) {
      break;
    }
    if (v10 >= v8) {
      goto LABEL_9;
    }
    unint64_t v7 = v10 + 1;
LABEL_8:
    if (v7 > v8)
    {
LABEL_9:
      uint64_t v11 = 0;
      unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_10;
    }
  }
  uint64_t v11 = v6;
LABEL_10:
  v12 = *a3;
  *a3 = v11;

  return v10;
}

id VMUSanitizePath(void *a1)
{
  id v1 = a1;

  return v1;
}

void coalesceIdenticalRegions(void *a1, char a2)
{
  id v8 = a1;
  if ((a2 & 0x80) == 0)
  {
    unint64_t v3 = [v8 count];
    if (v3 >= 2)
    {
      unint64_t v4 = v3;
      unint64_t v5 = 1;
      do
      {
        uint64_t v6 = [v8 objectAtIndex:v5 - 1];
        unint64_t v7 = [v8 objectAtIndex:v5];
        if (shouldProbablyCoalesceRegions(v6, v7) && ([v6 hasSameInfoAsRegion:v7] & 1) != 0)
        {
          [v6 addInfoFromRegion:v7];
          [v8 removeObjectAtIndex:v5];
          --v4;
        }
        else
        {
          ++v5;
        }
      }
      while (v5 < v4);
    }
  }
}

BOOL shouldProbablyCoalesceRegions(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  BOOL v5 = *((void *)v3 + 2) + *((void *)v3 + 1) == *((void *)v4 + 1)
    && sameString(*((void **)v3 + 4), *((void **)v4 + 4))
    && (!*((void *)v3 + 4) && !*((void *)v4 + 4)
     || (sameString(*((void **)v3 + 5), *((void **)v4 + 5)) & 1) != 0
     || (sameString(0, *((void **)v4 + 5)) & 1) != 0);

  return v5;
}

uint64_t sameString(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  BOOL v5 = v4;
  if (v3 == v4)
  {
    uint64_t v6 = 1;
  }
  else
  {
    uint64_t v6 = 0;
    if (v3 && v4) {
      uint64_t v6 = [v3 isEqualToString:v4];
    }
  }

  return v6;
}

id VMUidentifyRegionTypeFromUserTag(int a1, unsigned __int8 a2, int a3, int a4)
{
  if (a1) {
    VMUExclaveRegionTypeDescriptionForTagShareProtAndPager(a2);
  }
  else {
  uint64_t v6 = VMURegionTypeDescriptionForTagShareProtAndPager(a2, a3, a4, 0);
  }
  if (a3 == 3 && a4)
  {
    uint64_t v7 = [NSString stringWithFormat:@"%@%@", v6, VMUreservedLabelSuffix];

    uint64_t v6 = (void *)v7;
  }

  return v6;
}

__CFString *VMURegionTypeDescriptionForTagShareProtAndPager(uint64_t a1, int a2, int a3, int a4)
{
  if (a1 != 30)
  {
    if (a1 == 1)
    {
      uint64_t v9 = @"MALLOC metadata";
      if (a2 == 3) {
        uint64_t v9 = @"MALLOC";
      }
      if (a3) {
        uint64_t v7 = v9;
      }
      else {
        uint64_t v7 = @"MALLOC guard page";
      }
      goto LABEL_23;
    }
    if (a1)
    {
      uint64_t v7 = vmRegionLabels[a1];
      if (!v7)
      {
        [NSString stringWithFormat:@"Memory Tag %d", a1];
        uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_23;
    }
    if (a4 == 1)
    {
      uint64_t v6 = VMUmappedFileLabel[0];
    }
    else
    {
      if (a2 == 5)
      {
        uint64_t v7 = @"shared memory";
        goto LABEL_23;
      }
      uint64_t v6 = (__CFString *)VMUuntaggedRegionLabel;
    }
    uint64_t v7 = v6;
LABEL_23:
    return v7;
  }
  if (a3) {
    uint64_t v7 = @"Stack";
  }
  else {
    uint64_t v7 = @"Stack Guard";
  }
  return v7;
}

void recursivelyListAllRegions(void *a1, void *a2, uint64_t a3, unint64_t a4, uint64_t a5, int a6, unsigned char *a7)
{
  id v13 = a1;
  id v14 = a2;
  unint64_t v22 = a4;
  if (!*a7)
  {
    while (1)
    {
      uint64_t v21 = 0;
      int v20 = a6;
      uint64_t v15 = getRegionData(v13, &v22, &v21, &v20);
      id v16 = (void *)v15;
      if (!v15) {
        break;
      }
      if (!VMURangeContainsRange(a4, a5, *(void *)(v15 + 8), *(void *)(v15 + 16)) || v20 != a6) {
        break;
      }
      char v18 = [v16 isNullRegion];
      if ((a3 & 0x20) != 0 || (v18 & 1) == 0)
      {
        if (![v13 isCore]
          || (char v19 = [v16 isOwnedUnmappedMemory], (a3 & 0x10000) != 0)
          || (v19 & 1) == 0)
        {
          [v14 addObject:v16];
        }
      }
      if ([v16 isSubmap]) {
        recursivelyListAllRegions(v13, v14, a3, v16[1], v16[2], (a6 + 1), a7);
      }
      v22 += v21;

      if (*a7) {
        goto LABEL_19;
      }
    }
  }
LABEL_19:
}

id getRegionData(void *a1, void *a2, void *a3, int *a4)
{
  id v7 = a1;
  id v8 = v7;
  long long v19 = 0u;
  memset(v20, 0, sizeof(v20));
  memset(v18, 0, sizeof(v18));
  int v17 = 9999;
  if (a4) {
    uint64_t v9 = a4;
  }
  else {
    uint64_t v9 = &v17;
  }
  unint64_t v10 = [v7 memoryCache];
  mach_error_t v11 = [v10 machVMRegionRecurseSubmapInfo64onAddress:a2 size:a3 nestingDepth:v9 info:v18];

  if (v11)
  {
    if (v11 != 1) {
      mach_error("vm_region", v11);
    }
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v12 = objc_opt_new();
    *(void *)(v12 + 8) = *a2;
    *(void *)(v12 + 16) = *a3;
    *(void *)(v12 + 24) = *(void *)&v18[0];
    *(unsigned char *)(v12 + 49) = BYTE14(v19);
    *(_DWORD *)(v12 + 128) = *v9;
    *(unsigned char *)(v12 + 132) = *(unsigned char *)(v12 + 132) & 0xFE | (v20[0] != 0);
    *(unsigned char *)(v12 + 132) = *(unsigned char *)(v12 + 132) & 0xEF | (16 * (LOWORD(v20[3]) != 0));
    *(unsigned char *)(v12 + 50) = HIBYTE(v19);
    *(void *)(v12 + 56) = 0;
    *(void *)(v12 + 96) = DWORD2(v19);
    *(_DWORD *)(v12 + 104) = DWORD1(v18[1]);
    *(void *)(v12 + 112) = v20[2];
    *(void *)(v12 + 120) = *(void *)((char *)v18 + 12);
    *(void *)(v12 + 224) = *(void *)&v20[5];
    id v13 = [v8 memoryCache];
    int v14 = [v13 machVMPurgableControlWithAddress:*a2 control:1 state:v12 + 52];

    if (v14) {
      *(_DWORD *)(v12 + 52) = 3;
    }
    *(unsigned char *)(v12 + 232) = [v8 isExclave];
    if (*(unsigned char *)(v12 + 232))
    {
      uint64_t v15 = [v8 memoryCache];
      -[VMUTaskMemoryCache getExclaveVMFlagsForAddress:exclaveVMFlags:]((uint64_t)v15);
    }
  }

  return (id)v12;
}

void appendStatsLine(void *a1, __int16 a2, unsigned int a3, char a4, unsigned int a5, uint64_t a6, unint64_t a7, unint64_t a8, unint64_t a9, unint64_t a10, unint64_t a11, unint64_t a12, unint64_t a13, unsigned int a14, uint64_t a15)
{
  id v31 = a1;
  context = (void *)MEMORY[0x1AD0D9F90]();
  uint64_t v19 = pageCountString(a7, a3, a4);
  uint64_t v20 = pageCountString(a8, a3, a4);
  uint64_t v21 = pageCountString(a9, a3, a4);
  uint64_t v22 = pageCountString(a10, a3, a4);
  uint64_t v23 = pageCountString(a11, a3, a4);
  uint64_t v24 = pageCountString(a12, a3, a4);
  uint64_t v25 = pageCountString(a13, a3, a4);
  [NSString stringWithFormat:@"%8u", a14];
  id v26 = objc_claimAutoreleasedReturnValue();
  appendTextLine(v31, a2, a3 > 1, a5, a6, v19, v20, v21, v22, v23, v24, v25, [v26 UTF8String], a15);
}

uint64_t memorySizeString(unint64_t a1)
{
  if (a1)
  {
    double v1 = (double)a1 * 0.0009765625;
    if (v1 >= 4.0)
    {
      if (v1 >= 10000.0)
      {
        double v3 = v1 * 0.0009765625;
        if (v3 >= 1000.0)
        {
          double v4 = v3 * 0.0009765625;
          if (v4 >= 1000.0) {
            [NSString stringWithFormat:@"%.1fT", v4 * 0.0009765625];
          }
          else {
            [NSString stringWithFormat:@"%.1fG", *(void *)&v4];
          }
        }
        else
        {
          [NSString stringWithFormat:@"%.1fM", v3];
        }
      }
      else
      {
        [NSString stringWithFormat:@"%.0fK", *(void *)&v1];
      }
    }
    else
    {
      [NSString stringWithFormat:@"%lu", a1];
    }
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = @"0K";
  }
  BOOL v5 = v2;
  uint64_t v6 = [(__CFString *)v5 UTF8String];

  return v6;
}

void appendTextLine(void *a1, __int16 a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  id v23 = a1;
  [v23 appendFormat:@"%-*s", a4, a5];
  uint64_t v21 = 8;
  if (a3) {
    uint64_t v22 = 10;
  }
  else {
    uint64_t v22 = 8;
  }
  if (a3) {
    uint64_t v21 = 10;
  }
  [v23 appendFormat:@" %*s", v21, a6];
  if ((a2 & 4) != 0)
  {
    [v23 appendFormat:@" %*s", v22, a7];
    if ((a2 & 8) == 0)
    {
LABEL_8:
      if ((a2 & 0x800) == 0) {
        goto LABEL_9;
      }
      goto LABEL_16;
    }
  }
  else if ((a2 & 8) == 0)
  {
    goto LABEL_8;
  }
  [v23 appendFormat:@" %*s", v22, a8];
  if ((a2 & 0x800) == 0)
  {
LABEL_9:
    if ((a2 & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_16:
  [v23 appendFormat:@" %*s", v22, a9];
  if ((a2 & 0x10) != 0) {
LABEL_10:
  }
    [v23 appendFormat:@" %*s %*s %*s", v22, a10, v22, a11, v22, a12];
LABEL_11:
  [v23 appendFormat:@" %8s", a13];
  [v23 appendFormat:@" %s", a14];
  [v23 appendString:@"\n"];
}

uint64_t pageCountString(unint64_t a1, unsigned int a2, char a3)
{
  if (a2 < 2)
  {
    return memorySizeString(a1);
  }
  else
  {
    if (a3)
    {
      if (a1 % a2) {
        [NSString stringWithFormat:@"%.2f", (double)a1 / (double)a2];
      }
      else {
        [NSString stringWithFormat:@"%llu   ", a1 / a2];
      }
    }
    else
    {
      [NSString stringWithFormat:@"%llu", a1 / a2];
    }
    id v4 = objc_claimAutoreleasedReturnValue();
    uint64_t v5 = [v4 UTF8String];

    return v5;
  }
}

void cumulateLibraries(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a1;
  id v9 = a2;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if (!*(unsigned char *)(v14 + 48)
          && [*(id *)(v14 + 32) isEqual:v9]
          && *(unsigned char *)(v14 + 50) == 1)
        {
          *a3 += *(void *)(v14 + 16);
          *a4 += *(void *)(v14 + 160);
          *a5 += *(void *)(v14 + 16) - *(void *)(v14 + 160);
          *(unsigned char *)(v14 + 48) = 1;
        }
      }
      uint64_t v11 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }
}

void __markMachOLibraries_block_invoke(id *a1)
{
  CSSymbolOwnerIsDyldSharedCache();
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = __Block_byref_object_copy__7;
  v6[4] = __Block_byref_object_dispose__7;
  id v7 = 0;
  id v2 = a1[4];
  id v3 = a1[5];
  id v4 = a1[6];
  id v5 = a1[7];
  CSSymbolOwnerForeachSegment();

  _Block_object_dispose(v6, 8);
}

void sub_1A7CCD298(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t VMUGetFlagsForAllVMRegionStatistics()
{
  return 2076;
}

uint64_t task_stop_peeking()
{
  uint64_t result = task_lookup_mapped_memory_cache();
  if (result)
  {
    uint64_t v1 = mapped_memory_resume_target();
    task_release_mapped_memory_cache();
    return v1;
  }
  return result;
}

uint64_t task_start_peeking()
{
  uint64_t mapped_memory_cache_with_label = task_get_mapped_memory_cache_with_label();

  return MEMORY[0x1F4115BE8](mapped_memory_cache_with_label, v1);
}

uint64_t task_peek_to_end_of_region(vm_map_read_t a1, mach_vm_address_t a2, mach_vm_size_t a3, mach_vm_address_t *a4, void *a5)
{
  *a4 = 0;
  if (a3)
  {
    if (*MEMORY[0x1E4F14B00] > a2) {
      return 1;
    }
    IsSelf_portOfCachedResult = (vm_map_read_t *)VMUTaskIsSelf_portOfCachedResult();
    if (*IsSelf_portOfCachedResult == a1)
    {
      if (*(unsigned char *)VMUTaskIsSelf_cachedResult())
      {
LABEL_5:
        if (HIDWORD(a2) && memoryExists(a1, a2, a3))
        {
          uint64_t result = 0;
          *a4 = a2;
          return result;
        }
        return 1;
      }
    }
    else
    {
      vm_map_read_t *IsSelf_portOfCachedResult = a1;
      mach_task_is_self(a1);
      IsSelf_cachedResult = (unsigned char *)VMUTaskIsSelf_cachedResult();
      unsigned char *IsSelf_cachedResult = v13;
      if (v13) {
        goto LABEL_5;
      }
    }
    uint64_t v14 = (const char *)task_lookup_mapped_memory_cache();
    if (!v14)
    {
      NSLog(&cfstr_ErrorCallingTa_0.isa);
      return 0xFFFFFFFFLL;
    }
    node = (uint64_t *)find_node(v14, (tree *)a2);
    if (!node)
    {
      node = (uint64_t *)map_new_node();
      if (!node) {
        return 0;
      }
    }
    uint64_t v16 = *node;
    *a4 = node[2] + a2 - *node;
    if (a5)
    {
      uint64_t result = 0;
      *a5 = v16 - a2 + node[1];
      return result;
    }
  }
  return 0;
}

uint64_t task_peek(vm_map_read_t a1, mach_vm_address_t a2, mach_vm_size_t a3, mach_vm_address_t *a4)
{
  return task_peek_to_end_of_region(a1, a2, a3, a4, 0);
}

void markMallocAreas(void *a1, void *a2, void *a3, void *a4, int a5, void *a6)
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v11 = a1;
  id v12 = a2;
  int v13 = a3;
  id v14 = a6;
  if ((a5 & 0x400) == 0)
  {
    if ([v11 taskType] == 2)
    {
      uint64_t v15 = malloc_type_calloc(1uLL, 0x50uLL, 0x10000404247E4FDuLL);
      NSMapInsertKnownAbsent(v13, @"zalloc (no zone)", v15);
    }
    else
    {
      uint64_t v16 = [v12 objectAtIndexedSubscript:0];
      long long v17 = (void *)[v16 range];

      long long v18 = [v12 lastObject];
      v45 = v13;
      uint64_t v19 = [v18 range];
      uint64_t v21 = v20;

      uint64_t v22 = (void *)(v21 - (void)v17 + v19);
      id v23 = " Aborting";
      if ([v11 isCore])
      {
        BOOL v24 = 0;
      }
      else
      {
        int v25 = [v11 taskPort];
        BOOL v24 = v25 == *MEMORY[0x1E4F14960];
        if (v25 == *MEMORY[0x1E4F14960]) {
          id v23 = "";
        }
      }
      v53[0] = v12;
      v53[1] = v17;
      v53[2] = v22;
      v53[3] = a4;
      BOOL v54 = v24;
      *(_DWORD *)((char *)&v54 + 1) = (a5 & 0x800000) != 0;
      v55 = v23;
      uint64_t v56 = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v58 = 0;
      uint64_t v59 = 0;
      uint64_t v57 = 0;
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __markMallocAreas_block_invoke;
      v50[3] = &unk_1E5D24710;
      id v26 = v53[0];
      id v51 = v26;
      BOOL v52 = (a5 & 0x800000) != 0;
      VMUTask_foreach_malloc_zone(v11, v50);
      int v13 = v45;
      if (v14 && [v14 signpostID])
      {
        uint64_t v27 = [v14 logHandle];
        os_signpost_id_t v28 = [v14 signpostID];
        if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v27, OS_SIGNPOST_INTERVAL_END, v28, "recordRegions", "", buf, 2u);
        }
      }
      [v14 endEvent:"recordRegions"];
      [v14 startWithCategory:"recordRegions" message:"marking malloc VM regions"];
      if (v14)
      {
        v29 = [v14 logHandle];
        os_signpost_id_t v30 = [v14 signpostID];
        if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v29, OS_SIGNPOST_INTERVAL_BEGIN, v30, "recordRegions", "marking malloc VM regions", buf, 2u);
        }
      }
      id v31 = v11;
      *(void *)buf = MEMORY[0x1E4F143A8];
      uint64_t v61 = 3221225472;
      v62 = ___markRegionsForMallocZones_block_invoke;
      v63 = &unk_1E5D247B0;
      id v64 = v31;
      v65 = v53;
      LOBYTE(v66) = BYTE1(v54);
      id v32 = v31;
      withPeekFunctionForVMUTask(v32, buf);

      if ((a5 & 0x100) == 0)
      {
        if (v14 && [v14 signpostID])
        {
          v33 = [v14 logHandle];
          os_signpost_id_t v34 = [v14 signpostID];
          if (v34 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v33, OS_SIGNPOST_INTERVAL_END, v34, "recordRegions", "", buf, 2u);
          }
        }
        [v14 endEvent:"recordRegions"];
        [v14 startWithCategory:"recordRegions" message:"marking malloc allocations in VM regions"];
        if (v14)
        {
          id v35 = [v14 logHandle];
          os_signpost_id_t v36 = [v14 signpostID];
          if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v35, OS_SIGNPOST_INTERVAL_BEGIN, v36, "recordRegions", "marking malloc allocations in VM regions", buf, 2u);
          }
        }
        id v37 = v32;
        v38 = v45;
        *(void *)buf = MEMORY[0x1E4F143A8];
        uint64_t v61 = 3221225472;
        v62 = ___getRegionMallocStatistics_block_invoke;
        v63 = &unk_1E5D24828;
        id v64 = v37;
        v65 = v38;
        v66 = v53;
        char v67 = BYTE1(v54);
        v39 = v38;
        id v40 = v37;
        withPeekFunctionForVMUTask(v40, buf);
      }
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v41 = v26;
      uint64_t v42 = [v41 countByEnumeratingWithState:&v46 objects:v68 count:16];
      if (v42)
      {
        uint64_t v43 = *(void *)v47;
        do
        {
          for (uint64_t i = 0; i != v42; ++i)
          {
            if (*(void *)v47 != v43) {
              objc_enumerationMutation(v41);
            }
            setTypeIfMallocRegion(*(void **)(*((void *)&v46 + 1) + 8 * i));
          }
          uint64_t v42 = [v41 countByEnumeratingWithState:&v46 objects:v68 count:16];
        }
        while (v42);
      }

      __destructor_8_s0_s56_s64_sb72((uint64_t)v53);
    }
  }
}

void sub_1A7CCE274(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  __destructor_8_s0_s56_s64_sb72((uint64_t)va);
  _Unwind_Resume(a1);
}

void markIOSurfaces(void *a1, void *a2, __int16 a3)
{
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  id v81 = a1;
  id v5 = a2;
  if ((a3 & 0x400) != 0) {
    goto LABEL_69;
  }
  long long v110 = 0u;
  long long v111 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  id v72 = v5;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v108 objects:v116 count:16];
  if (!v7)
  {
LABEL_10:

    goto LABEL_68;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v109;
LABEL_4:
  uint64_t v10 = 0;
  while (1)
  {
    if (*(void *)v109 != v9) {
      objc_enumerationMutation(v6);
    }
    if ([*(id *)(*((void *)&v108 + 1) + 8 * v10) isIOSurface]) {
      break;
    }
    if (v8 == ++v10)
    {
      uint64_t v8 = [v6 countByEnumeratingWithState:&v108 objects:v116 count:16];
      if (!v8) {
        goto LABEL_10;
      }
      goto LABEL_4;
    }
  }

  context = (void *)MEMORY[0x1AD0D9F90]();
  id v11 = [v81 ioSurfaceDescriptions];
  if (!v11) {
    goto LABEL_67;
  }
  uint64_t v69 = v6;
  id v12 = v11;
  int v13 = objc_opt_new();
  v83 = objc_opt_new();
  v82 = objc_opt_new();
  v80 = objc_opt_new();
  long long v104 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  id v70 = v12;
  id obj = v12;
  unint64_t v14 = 0x1E4F28000uLL;
  v84 = v13;
  uint64_t v74 = [obj countByEnumeratingWithState:&v104 objects:v115 count:16];
  if (!v74) {
    goto LABEL_37;
  }
  uint64_t v73 = *(void *)v105;
  do
  {
    uint64_t v15 = 0;
    do
    {
      if (*(void *)v105 != v73) {
        objc_enumerationMutation(obj);
      }
      uint64_t v78 = v15;
      uint64_t v16 = *(void **)(*((void *)&v104 + 1) + 8 * v15);
      int v89 = [v81 pid];
      int v87 = [v16 integerValue];
      long long v17 = v16;
      long long v18 = [obj objectForKeyedSubscript:v16];
      long long v100 = 0u;
      long long v101 = 0u;
      long long v102 = 0u;
      long long v103 = 0u;
      id v85 = v18;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v100 objects:v114 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v101;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v101 != v21) {
              objc_enumerationMutation(v85);
            }
            id v23 = *(void **)(*((void *)&v100 + 1) + 8 * i);
            uint64_t v24 = [v23 surfaceID];
            int v25 = [NSNumber numberWithUnsignedInt:v24];
            id v26 = [v13 objectForKeyedSubscript:v25];

            if (!v26)
            {
              id v26 = objc_opt_new();
              uint64_t v27 = [NSNumber numberWithUnsignedInt:v24];
              [v13 setObject:v26 forKeyedSubscript:v27];
            }
            [v26 addObject:v17];
            if (v89 == v87)
            {
              unsigned int v28 = [v23 pixelFormat];
              int v29 = v28;
              unsigned int v30 = HIBYTE(v28);
              if ((v28 & 0x80000000) != 0)
              {
                if (!__maskrune(HIBYTE(v28), 0x800uLL)) {
                  goto LABEL_29;
                }
LABEL_27:
                __str[0] = v30;
                __str[1] = BYTE2(v29);
                __str[2] = BYTE1(v29);
                __str[3] = v29;
                __str[4] = 0;
              }
              else
              {
                if ((*(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v30 + 60) & 0x800) != 0) {
                  goto LABEL_27;
                }
LABEL_29:
                snprintf(__str, 5uLL, "%4d", v29);
              }
              id v31 = [NSNumber numberWithUnsignedInt:v24];
              id v32 = [NSNumber numberWithUnsignedLongLong:[v23 virtualAddress]];
              [v82 setObject:v31 forKeyedSubscript:v32];

              v33 = [[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat: @"SurfaceID: %#x  %llux%llu (%s) %s", v24, objc_msgSend(v23, "width"), objc_msgSend(v23, "height"), __str, VMUMemorySizeString(objc_msgSend(v23, "allocationSize"))];
              os_signpost_id_t v34 = [v23 name];
              uint64_t v35 = [v34 length];

              if (v35)
              {
                os_signpost_id_t v36 = [v23 name];
                [v33 appendFormat:@"  '%@'", v36];
              }
              unint64_t v14 = 0x1E4F28000uLL;
              id v37 = [NSNumber numberWithUnsignedLongLong:[v23 virtualAddress]];
              [v83 setObject:v33 forKeyedSubscript:v37];

              int v13 = v84;
            }
          }
          uint64_t v20 = [v85 countByEnumeratingWithState:&v100 objects:v114 count:16];
        }
        while (v20);
      }

      uint64_t v15 = v78 + 1;
    }
    while (v78 + 1 != v74);
    uint64_t v74 = [obj countByEnumeratingWithState:&v104 objects:v115 count:16];
  }
  while (v74);
LABEL_37:

  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  id v38 = v69;
  uint64_t v39 = [v38 countByEnumeratingWithState:&v95 objects:v113 count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = *(void *)v96;
    uint64_t v75 = *(void *)v96;
    id obja = v38;
    do
    {
      uint64_t v42 = 0;
      uint64_t v79 = v40;
      do
      {
        if (*(void *)v96 != v41) {
          objc_enumerationMutation(v38);
        }
        uint64_t v43 = *(void **)(*((void *)&v95 + 1) + 8 * v42);
        if ([v43 isIOSurface])
        {
          uint64_t v90 = v42;
          v44 = [*(id *)(v14 + 3792) numberWithUnsignedLongLong:v43[1]];
          [v83 objectForKeyedSubscript:v44];
          long long v46 = v45 = v43;

          v88 = v45;
          long long v47 = [*(id *)(v14 + 3792) numberWithUnsignedLongLong:v45[1]];
          uint64_t v48 = [v82 objectForKeyedSubscript:v47];

          long long v49 = (void *)v48;
          v50 = [v84 objectForKeyedSubscript:v48];
          if ((unint64_t)[v50 count] >= 2)
          {
            id v86 = (id)v48;
            long long v93 = 0u;
            long long v94 = 0u;
            long long v91 = 0u;
            long long v92 = 0u;
            id v51 = v50;
            uint64_t v52 = [v51 countByEnumeratingWithState:&v91 objects:v112 count:16];
            if (v52)
            {
              uint64_t v53 = v52;
              char v54 = 0;
              uint64_t v55 = *(void *)v92;
              do
              {
                for (uint64_t j = 0; j != v53; ++j)
                {
                  if (*(void *)v92 != v55) {
                    objc_enumerationMutation(v51);
                  }
                  uint64_t v57 = [*(id *)(*((void *)&v91 + 1) + 8 * j) intValue];
                  int v58 = [v81 pid];
                  if (v57) {
                    BOOL v59 = v57 == v58;
                  }
                  else {
                    BOOL v59 = 1;
                  }
                  if (!v59)
                  {
                    if ((v54 & 1) == 0) {
                      [v46 appendString:@", shared with"];
                    }
                    v60 = [*(id *)(v14 + 3792) numberWithInt:v57];
                    uint64_t v61 = [v80 objectForKeyedSubscript:v60];

                    if (!v61)
                    {
                      v62 = [[VMUProcInfo alloc] initWithPid:v57];
                      uint64_t v63 = [(VMUProcInfo *)v62 name];
                      id v64 = (void *)v63;
                      v65 = @"<unknown>";
                      if (v63) {
                        v65 = (__CFString *)v63;
                      }
                      uint64_t v61 = v65;

                      v66 = [NSNumber numberWithInt:v57];
                      [v80 setObject:v61 forKeyedSubscript:v66];
                    }
                    char v67 = v61;
                    [v46 appendFormat:@" %s[%u]", -[__CFString UTF8String](v67, "UTF8String"), v57];

                    char v54 = 1;
                    unint64_t v14 = 0x1E4F28000;
                  }
                }
                uint64_t v53 = [v51 countByEnumeratingWithState:&v91 objects:v112 count:16];
              }
              while (v53);
            }

            uint64_t v41 = v75;
            id v38 = obja;
            uint64_t v40 = v79;
            long long v49 = v86;
          }
          v68 = (void *)v88[5];
          v88[5] = v46;

          uint64_t v42 = v90;
        }
        ++v42;
      }
      while (v42 != v40);
      uint64_t v40 = [v38 countByEnumeratingWithState:&v95 objects:v113 count:16];
    }
    while (v40);
  }

  id v11 = v70;
LABEL_67:

LABEL_68:
  id v5 = v72;
LABEL_69:
}

uint64_t VMUTaskIsSelf()
{
  IsSelf_portOfCachedResult = (task_name_t *)VMUTaskIsSelf_portOfCachedResult();
  if (*IsSelf_portOfCachedResult == v1)
  {
    IsSelf_cachedResult = (unsigned __int8 *)VMUTaskIsSelf_cachedResult();
  }
  else
  {
    task_name_t *IsSelf_portOfCachedResult = v1;
    mach_task_is_self(v1);
    IsSelf_cachedResult = (unsigned __int8 *)VMUTaskIsSelf_cachedResult();
    unsigned __int8 *IsSelf_cachedResult = v3;
  }
  return *IsSelf_cachedResult;
}

uint64_t _determine_pthread_offsets(uint64_t (*a1)())
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  unsigned __int8 v3 = (void *)gPthreadOffsets;
  gPthreadOffsets = (uint64_t)v2;

  pthread_t v4 = pthread_self();
  uint64_t v5 = 0;
  while (1)
  {
    id v6 = *(uint64_t (**)())((char *)&v4->__sig + v5);
    if (v6 == _determine_pthread_offsets)
    {
      uint64_t v7 = [NSNumber numberWithLong:v5];
      [(id)gPthreadOffsets setObject:v7 forKeyedSubscript:@"StartRoutineOffsetKey"];

      id v6 = *(uint64_t (**)())((char *)&v4->__sig + v5);
    }
    if (v6 == a1) {
      break;
    }
    if (++v5 == 8184) {
      goto LABEL_8;
    }
  }
  uint64_t v8 = [NSNumber numberWithLong:v5];
  [(id)gPthreadOffsets setObject:v8 forKeyedSubscript:@"StartRoutineArgumentOffsetKey"];

LABEL_8:
  *(void *)thread_info_out = 0;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  mach_msg_type_number_t thread_info_outCnt = 6;
  thread_inspect_t v9 = MEMORY[0x1AD0D98E0]();
  thread_info(v9, 4u, thread_info_out, &thread_info_outCnt);
  uint64_t v10 = v18;
  uint64_t v11 = v18 - (void)v4 + 4088;
  id v12 = [NSNumber numberWithUnsignedLongLong:];
  [(id)gPthreadOffsets setObject:v12 forKeyedSubscript:@"FirstTLSslotKey"];

  int v13 = [NSNumber numberWithUnsignedLongLong:v11];
  [(id)gPthreadOffsets setObject:v13 forKeyedSubscript:@"LastTLSslotKey"];

  unint64_t v14 = [NSNumber numberWithUnsignedLongLong:((v10 + *MEMORY[0x1E4F14B00] + 4087) & -*MEMORY[0x1E4F14B00]) - (void)v4];
  [(id)gPthreadOffsets setObject:v14 forKeyedSubscript:@"RegionEndOffsetKey"];

  return 0;
}

void sub_1A7CD1F8C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
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

BOOL task_exists(void *a1)
{
  id v1 = a1;
  if ([v1 isCore])
  {
    BOOL v2 = 1;
  }
  else
  {
    uint64_t v7 = 0;
    *(_OWORD *)task_info_out = 0u;
    long long v6 = 0u;
    mach_msg_type_number_t task_info_outCnt = 10;
    BOOL v2 = [v1 taskPort]
      && [v1 taskPort] != -1
      && task_info([v1 taskPort], 0x12u, task_info_out, &task_info_outCnt) == 0;
  }

  return v2;
}

uint64_t _task_peek_transformer_function(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (!a3)
  {
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    if (!a4) {
      return v6;
    }
    goto LABEL_6;
  }
  uint64_t v5 = (*(uint64_t (**)(void))(s_peekBlock + 16))();
  if (v5) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = 5;
  }
  if (a4) {
LABEL_6:
  }
    *a4 = v5;
  return v6;
}

void _withPeekTransformerFunctionForMemoryReader(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (_withPeekTransformerFunctionForMemoryReader_s_onceToken != -1) {
    dispatch_once(&_withPeekTransformerFunctionForMemoryReader_s_onceToken, &__block_literal_global_81);
  }
  uint64_t v5 = _withPeekTransformerFunctionForMemoryReader_s_peekingTransformerGuard;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = ___withPeekTransformerFunctionForMemoryReader_block_invoke_2;
  v8[3] = &unk_1E5D22E20;
  id v9 = v3;
  id v10 = v4;
  id v6 = v4;
  id v7 = v3;
  dispatch_sync(v5, v8);
}

void ___withPeekTransformerFunctionForMemoryReader_block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("task peeking transformer guard queue", 0);
  id v1 = (void *)_withPeekTransformerFunctionForMemoryReader_s_peekingTransformerGuard;
  _withPeekTransformerFunctionForMemoryReader_s_peekingTransformerGuard = (uint64_t)v0;
}

void ___withPeekTransformerFunctionForMemoryReader_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1AD0DA230](*(void *)(a1 + 32));
  id v3 = (void *)s_peekBlock;
  s_peekBlock = v2;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v4 = (void *)s_peekBlock;
  s_peekBlock = 0;
}

void sub_1A7CD3744(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t failingPeekFunction()
{
  return 5;
}

uint64_t _pointerRecorderBlockContextAdapter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a2 + 16))(a2, a3, a4, a5);
}

void sub_1A7CD5674(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1A7CD8E34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _debugSwiftAsyncPrintfIsEnabled()
{
  if (_debugSwiftAsyncPrintfIsEnabled_onceToken != -1) {
    dispatch_once(&_debugSwiftAsyncPrintfIsEnabled_onceToken, &__block_literal_global_201);
  }
  return _debugSwiftAsyncPrintfIsEnabled_enabled;
}

const char *___debugSwiftAsyncPrintfIsEnabled_block_invoke()
{
  uint64_t result = getenv("SYMBOLICATION_DEBUG_SWIFT_ASYNC");
  if (result)
  {
    uint64_t v1 = result;
    uint64_t result = (const char *)strcmp(result, "YES");
    if (!result || (uint64_t result = (const char *)strcmp(v1, "1"), !result)) {
      _debugSwiftAsyncPrintfIsEnabled_enabled = 1;
    }
  }
  return result;
}

uint64_t _debugSwiftAsyncPrintf(int a1, char *a2, ...)
{
  va_start(va, a2);
  if (a1)
  {
    int v3 = a1;
    id v4 = (FILE **)MEMORY[0x1E4F143C8];
    do
    {
      fwrite("  ", 2uLL, 1uLL, *v4);
      --v3;
    }
    while (v3);
  }
  return vfprintf((FILE *)*MEMORY[0x1E4F143C8], a2, va);
}

void sub_1A7CDB528(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_1A7CDC9EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Block_object_dispose((const void *)(v11 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1A7CDE6B4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 224), 8);
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_1A7CE070C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a61, 8);
  _Block_object_dispose(&a65, 8);
  _Block_object_dispose(&a71, 8);
  _Block_object_dispose(&STACK[0x220], 8);
  _Block_object_dispose(&STACK[0x298], 8);
  _Block_object_dispose(&STACK[0x2B8], 8);
  _Block_object_dispose(&STACK[0x2E8], 8);
  _Unwind_Resume(a1);
}

void sub_1A7CE2D34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t ___unmapRegion_block_invoke(uint64_t a1)
{
  unint64_t v12 = 0;
  unint64_t v13 = 0;
  uint64_t result = [*(id *)(a1 + 32) unmapAddress:*(void *)(**(void **)(a1 + 48) + 8) size:*(void *)(*(void *)(a1 + 48) + 40) returnedAddress:&v13 returnedSize:&v12];
  if (result)
  {
    uint64_t v3 = *(void *)(a1 + 48);
    uint64_t result = fprintf((FILE *)*MEMORY[0x1E4F143C8], "Failed to deallocate mapped region %#llx-%#llx[%llu] with local addresses %p-%p[%llu]\n", *(void *)(*(void *)v3 + 8), *(void *)(*(void *)v3 + 16) + *(void *)(*(void *)v3 + 8), *(void *)(*(void *)v3 + 16), *(const void **)(v3 + 48), (const void *)(*(void *)(v3 + 48) + *(void *)(v3 + 40)), *(void *)(v3 + 40));
LABEL_3:
    id v4 = *(void **)(a1 + 48);
    v4[5] = 0;
    v4[6] = 0;
    v4[7] = 0;
    return result;
  }
  if (!v13) {
    goto LABEL_3;
  }
  uint64_t result = [*(id *)(a1 + 40) flushRemoteMirrorMemoryCacheEntryForAddress:*(void *)(**(void **)(a1 + 48) + 8)];
  uint64_t v5 = *(void **)(a1 + 48);
  for (unint64_t i = *(void *)(a1 + 56); (unint64_t)v5 > i; v5 -= 8)
  {
    if (v13 >= *(void *)(*v5 + 8)) {
      break;
    }
  }
  unint64_t v7 = v12;
  if (v12)
  {
    do
    {
      v5[5] = 0;
      v5[6] = 0;
      v5[7] = 0;
      uint64_t v8 = *v5;
      v5 += 8;
      unint64_t v9 = *(void *)(v8 + 16);
      BOOL v10 = v7 >= v9;
      v7 -= v9;
      BOOL v11 = v7 != 0 && v10;
      if (!v10) {
        unint64_t v7 = 0;
      }
    }
    while (v11);
  }
  return result;
}

void sub_1A7CE4C10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

uint64_t _pointerRecorderBlockContextAdapter_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a2 + 16))(a2, a3, a4, a5);
}

void sub_1A7CE9918(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1A7CEC010(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1A7CEC228(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Block_object_dispose((const void *)(v11 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1A7CEDB98(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 224), 8);
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_1A7CEF748(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  _Block_object_dispose(&a53, 8);
  _Block_object_dispose(&a57, 8);
  _Block_object_dispose(&a63, 8);
  _Block_object_dispose(&a69, 8);
  _Block_object_dispose(&STACK[0x250], 8);
  _Block_object_dispose(&STACK[0x270], 8);
  _Block_object_dispose(&STACK[0x2A0], 8);
  _Unwind_Resume(a1);
}

void sub_1A7CF16D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t ___unmapRegion_block_invoke_0(uint64_t a1)
{
  unint64_t v12 = 0;
  unint64_t v13 = 0;
  uint64_t result = [*(id *)(a1 + 32) unmapAddress:*(void *)(**(void **)(a1 + 40) + 8) size:*(void *)(*(void *)(a1 + 40) + 40) returnedAddress:&v13 returnedSize:&v12];
  if (result)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t result = fprintf((FILE *)*MEMORY[0x1E4F143C8], "Failed to deallocate mapped region %#llx-%#llx[%llu] with local addresses %p-%p[%llu]\n", *(void *)(*(void *)v3 + 8), *(void *)(*(void *)v3 + 16) + *(void *)(*(void *)v3 + 8), *(void *)(*(void *)v3 + 16), *(const void **)(v3 + 48), (const void *)(*(void *)(v3 + 48) + *(void *)(v3 + 40)), *(void *)(v3 + 40));
LABEL_3:
    id v4 = *(void **)(a1 + 40);
    v4[5] = 0;
    v4[6] = 0;
    v4[7] = 0;
    return result;
  }
  if (!v13) {
    goto LABEL_3;
  }
  uint64_t v5 = *(void **)(a1 + 40);
  for (unint64_t i = *(void *)(a1 + 48); (unint64_t)v5 > i; v5 -= 8)
  {
    if (v13 >= *(void *)(*v5 + 8)) {
      break;
    }
  }
  unint64_t v7 = v12;
  if (v12)
  {
    do
    {
      v5[5] = 0;
      v5[6] = 0;
      v5[7] = 0;
      uint64_t v8 = *v5;
      v5 += 8;
      unint64_t v9 = *(void *)(v8 + 16);
      BOOL v10 = v7 >= v9;
      v7 -= v9;
      BOOL v11 = v7 != 0 && v10;
      if (!v10) {
        unint64_t v7 = 0;
      }
    }
    while (v11);
  }
  return result;
}

char *___shouldScanVMregion_block_invoke()
{
  uint64_t result = getenv("SCAN_VM_REGIONS_WITH_UNKNOWN_PATHS");
  _shouldScanVMregion_scanVMRegionWithUnknownPathsEnvVar = (uint64_t)result;
  return result;
}

unint64_t VMUUnionRange(unint64_t result, uint64_t a2, unint64_t a3)
{
  if (result >= a3) {
    return a3;
  }
  return result;
}

unint64_t VMUIntersectionRange(unint64_t result, uint64_t a2, unint64_t a3, uint64_t a4)
{
  if (a3 > result || result >= a3 + a4)
  {
    if (a3 < result + a2) {
      unint64_t v4 = a3;
    }
    else {
      unint64_t v4 = 0;
    }
    if (result <= a3) {
      return v4;
    }
    else {
      return 0;
    }
  }
  return result;
}

BOOL VMURangeIntersectsOrAbutsRange(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  if (a1 >= a3) {
    return a3 + a4 >= a1;
  }
  else {
    return a1 + a2 >= a3;
  }
}

uint64_t VMURangeDescription(uint64_t a1, uint64_t a2)
{
  return [NSString stringWithFormat:@"%#llx-%#llx[%llu]", a1, a1 + a2, a2];
}

void sub_1A7CF25F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7CF2660(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  BOOL v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)VMUSymbolStore;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void sub_1A7CF27B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7CF2A14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7CF2B2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A7CF2BF0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *_uuidStringForOwner@<X0>(_CSTypeRef a1@<0:X0, 8:X1>, void *a2@<X8>)
{
  void v6[5] = *MEMORY[0x1E4F143B8];
  uint64_t CFUUIDBytes = CSSymbolOwnerGetCFUUIDBytes();
  if (!CFUUIDBytes || (unint64_t v4 = (char *)v6, (MEMORY[0x1AD0D8FD0](CFUUIDBytes, v6, 40) & 1) == 0)) {
    unint64_t v4 = "<null-uuid>";
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v4);
}

void sub_1A7CF2E08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *__p,uint64_t a29)
{
  unsigned int v30 = v29;

  _Block_object_dispose(&a22, 8);
  if (__p)
  {
    a29 = (uint64_t)__p;
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__1(__n128 *a1, __n128 *a2)
{
  a1[3].n128_u64[0] = 0;
  a1[3].n128_u64[1] = 0;
  a1[4].n128_u64[0] = 0;
  __n128 result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(void *)(a1 + 56) = v2;
    operator delete(v2);
  }
}

void sub_1A7CF3070(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va1, a4);
  va_start(va, a4);
  uint64_t v6 = va_arg(va1, void);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table((uint64_t)va);
  std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table((uint64_t)va1);
  if (*(char *)(v4 - 49) < 0) {
    operator delete(*(void **)(v4 - 72));
  }
  _Unwind_Resume(a1);
}

uint64_t _sparsifySymbolOwner(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __p = 0;
  int v25 = 0;
  id v26 = 0;
  uint64_t v3 = *(void **)(a3 + 16);
  if (v3)
  {
    do
    {
      uint64_t SymbolWithAddress = CSSymbolOwnerGetSymbolWithAddress();
      uint64_t v6 = v5;
      if ((CSIsNull() & 1) == 0)
      {
        unint64_t v7 = v25;
        if (v25 >= v26)
        {
          uint64_t v9 = (char *)__p;
          uint64_t v10 = (v25 - (unsigned char *)__p) >> 4;
          unint64_t v11 = v10 + 1;
          if ((unint64_t)(v10 + 1) >> 60) {
            std::vector<_CSTypeRef>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v12 = v26 - (unsigned char *)__p;
          if ((v26 - (unsigned char *)__p) >> 3 > v11) {
            unint64_t v11 = v12 >> 3;
          }
          if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v13 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v13 = v11;
          }
          if (v13)
          {
            uint64_t v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_CSTypeRef>>((uint64_t)&v26, v13);
            uint64_t v9 = (char *)__p;
            unint64_t v7 = v25;
          }
          else
          {
            uint64_t v14 = 0;
          }
          uint64_t v15 = (uint64_t *)&v14[16 * v10];
          *uint64_t v15 = SymbolWithAddress;
          v15[1] = v6;
          uint64_t v16 = v15;
          if (v7 != v9)
          {
            do
            {
              *((_OWORD *)v16 - 1) = *((_OWORD *)v7 - 1);
              v16 -= 2;
              v7 -= 16;
            }
            while (v7 != v9);
            uint64_t v9 = (char *)__p;
          }
          uint64_t v8 = (char *)(v15 + 2);
          __p = v16;
          int v25 = (char *)(v15 + 2);
          id v26 = &v14[16 * v13];
          if (v9) {
            operator delete(v9);
          }
        }
        else
        {
          *(void *)int v25 = SymbolWithAddress;
          *((void *)v7 + 1) = v6;
          uint64_t v8 = v7 + 16;
        }
        int v25 = v8;
      }
      uint64_t v3 = (void *)*v3;
    }
    while (v3);
    uint64_t v17 = __p;
    uint64_t v18 = (uint64_t)v25;
  }
  else
  {
    uint64_t v18 = 0;
    uint64_t v17 = 0;
  }
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  uint64_t v21 = 0;
  std::vector<_CSTypeRef>::__init_with_size[abi:ne180100]<_CSTypeRef*,_CSTypeRef*>(&v21, v17, v18, (v18 - (uint64_t)v17) >> 4);
  uint64_t SparseDataWithBlock = CSSymbolOwnerCreateSparseDataWithBlock();
  if (v21)
  {
    uint64_t v22 = v21;
    operator delete(v21);
  }
  if (__p)
  {
    int v25 = (char *)__p;
    operator delete(__p);
  }
  return SparseDataWithBlock;
}

void sub_1A7CF32B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, void *a16, uint64_t a17)
{
  if (__p) {
    operator delete(__p);
  }
  if (a16) {
    operator delete(a16);
  }
  _Unwind_Resume(exception_object);
}

void sub_1A7CF33F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7CF3538(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va1, a2);
  va_start(va, a2);
  uint64_t v4 = va_arg(va1, void);
  uint64_t v6 = va_arg(va1, void);
  uint64_t v7 = va_arg(va1, void);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table((uint64_t)va);
  std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table((uint64_t)va1);
  if (*(char *)(v2 - 49) < 0) {
    operator delete(*(void **)(v2 - 72));
  }
  _Unwind_Resume(a1);
}

void sub_1A7CF3AF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,void *a21)
{
  _Unwind_Resume(a1);
}

void sub_1A7CF3CEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_1A7CF3E08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_1A7CF3FA4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (*(char *)(v20 - 33) < 0) {
    operator delete(*(void **)(v20 - 56));
  }
  _Unwind_Resume(exception_object);
}

void __copy_helper_block_ea8_40c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (std::string *)(a1 + 40);
  if (*(char *)(a2 + 63) < 0)
  {
    std::string::__init_copy_ctor_external(v2, *(const std::string::value_type **)(a2 + 40), *(void *)(a2 + 48));
  }
  else
  {
    long long v3 = *(_OWORD *)(a2 + 40);
    v2->__r_.__value_.__r.__words[2] = *(void *)(a2 + 56);
    *(_OWORD *)&v2->__r_.__value_.__l.__data_ = v3;
  }
}

void __destroy_helper_block_ea8_40c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(uint64_t a1)
{
  if (*(char *)(a1 + 63) < 0) {
    operator delete(*(void **)(a1 + 40));
  }
}

void sub_1A7CF45D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,id a46)
{
  _Block_object_dispose(&a41, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__39(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__40(uint64_t a1)
{
}

void sub_1A7CF47C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1A7CF48D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_1A7CF4A80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void *std::string::basic_string[abi:ne180100]<0>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    uint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E5D22C40, MEMORY[0x1E4FBA1C8]);
}

void sub_1A7CF4C94(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  __n128 result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D0] + 16);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E4FBA350], MEMORY[0x1E4FBA1F8]);
}

BOOL ___ZL20_sparsifySymbolOwner10_CSTypeRefNSt3__113unordered_setIyNS0_4hashIyEENS0_8equal_toIyEENS0_9allocatorIyEEEE_block_invoke(uint64_t a1, unint64_t a2, _OWORD *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  unint64_t v4 = (*(void *)(a1 + 40) - v3) >> 4;
  if (v4 > a2) {
    *a3 = *(_OWORD *)(v3 + 16 * a2);
  }
  return v4 <= a2;
}

void *__copy_helper_block_ea8_32c52_ZTSNSt3__16vectorI10_CSTypeRefNS_9allocatorIS1_EEEE(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0;
  uint64_t v2 = (void *)(a1 + 32);
  v2[2] = 0;
  return std::vector<_CSTypeRef>::__init_with_size[abi:ne180100]<_CSTypeRef*,_CSTypeRef*>(v2, *(const void **)(a2 + 32), *(void *)(a2 + 40), (uint64_t)(*(void *)(a2 + 40) - *(void *)(a2 + 32)) >> 4);
}

void __destroy_helper_block_ea8_32c52_ZTSNSt3__16vectorI10_CSTypeRefNS_9allocatorIS1_EEEE(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    *(void *)(a1 + 40) = v2;
    operator delete(v2);
  }
}

void *std::vector<_CSTypeRef>::__init_with_size[abi:ne180100]<_CSTypeRef*,_CSTypeRef*>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    __n128 result = std::vector<_CSTypeRef>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      __n128 result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1A7CF4DCC(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<_CSTypeRef>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::vector<_CSTypeRef>::__throw_length_error[abi:ne180100]();
  }
  __n128 result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_CSTypeRef>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

void std::vector<_CSTypeRef>::__throw_length_error[abi:ne180100]()
{
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<_CSTypeRef>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(16 * a2);
}

void *std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__emplace_unique_key_args<unsigned long long,unsigned long long &>(uint64_t a1, unint64_t *a2, void *a3)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = *a2;
      if (v6 >= v7) {
        unint64_t v3 = v6 % v7;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
    uint64_t v9 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      for (unint64_t i = *v9; i; unint64_t i = (void *)*i)
      {
        unint64_t v11 = i[1];
        if (v11 == v6)
        {
          if (i[2] == v6) {
            return i;
          }
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7) {
              v11 %= v7;
            }
          }
          else
          {
            v11 &= v7 - 1;
          }
          if (v11 != v3) {
            break;
          }
        }
      }
    }
  }
  unint64_t i = operator new(0x18uLL);
  *unint64_t i = 0;
  i[1] = v6;
  i[2] = *a3;
  float v12 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    BOOL v14 = 1;
    if (v7 >= 3) {
      BOOL v14 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v15 = v14 | (2 * v7);
    unint64_t v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16) {
      size_t v17 = v16;
    }
    else {
      size_t v17 = v15;
    }
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>(a1, v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7) {
        unint64_t v3 = v6 % v7;
      }
      else {
        unint64_t v3 = v6;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
  }
  uint64_t v18 = *(void *)a1;
  uint64_t v19 = *(void **)(*(void *)a1 + 8 * v3);
  if (v19)
  {
    *unint64_t i = *v19;
LABEL_38:
    *uint64_t v19 = i;
    goto LABEL_39;
  }
  *unint64_t i = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = i;
  *(void *)(v18 + 8 * v3) = a1 + 16;
  if (*i)
  {
    unint64_t v20 = *(void *)(*i + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v20 >= v7) {
        v20 %= v7;
      }
    }
    else
    {
      v20 &= v7 - 1;
    }
    uint64_t v19 = (void *)(*(void *)a1 + 8 * v20);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return i;
}

void sub_1A7CF5084(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2;
  }
  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }
  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }
    else
    {
      uint64_t v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }
    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4)
    {
LABEL_16:
      std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__do_rehash<true>(a1, prime);
    }
  }
}

void std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0;
    *(void *)(a1 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    uint64_t v7 = *(void **)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v8) = a1 + 16;
      unint64_t v11 = (void *)*v7;
      if (*v7)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2) {
              v12 %= a2;
            }
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(void *)(*(void *)a1 + 8 * v12))
            {
              *(void *)(*(void *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            *uint64_t v7 = *v11;
            *unint64_t v11 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = v11;
            unint64_t v11 = v7;
          }
          unint64_t v12 = v8;
LABEL_24:
          uint64_t v7 = v11;
          unint64_t v11 = (void *)*v11;
          unint64_t v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    uint64_t v10 = *(void **)a1;
    *(void *)a1 = 0;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0;
  }
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(uint64_t a1, unsigned __int8 *a2, uint64_t a3, long long **a4)
{
  unint64_t v8 = (void *)(a1 + 24);
  unint64_t v9 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  unint64_t v10 = v9;
  unint64_t v11 = *(void *)(a1 + 8);
  if (v11)
  {
    uint8x8_t v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    unint64_t v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      unint64_t v4 = v9;
      if (v9 >= v11) {
        unint64_t v4 = v9 % v11;
      }
    }
    else
    {
      unint64_t v4 = (v11 - 1) & v9;
    }
    BOOL v14 = *(unsigned __int8 ***)(*(void *)a1 + 8 * v4);
    if (v14)
    {
      for (unint64_t i = *v14; i; unint64_t i = *(unsigned __int8 **)i)
      {
        unint64_t v16 = *((void *)i + 1);
        if (v16 == v10)
        {
          if (std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, i + 16, a2)) {
            return i;
          }
        }
        else
        {
          if (v13 > 1)
          {
            if (v16 >= v11) {
              v16 %= v11;
            }
          }
          else
          {
            v16 &= v11 - 1;
          }
          if (v16 != v4) {
            break;
          }
        }
      }
    }
  }
  size_t v17 = (char *)operator new(0x50uLL);
  v29[0] = v17;
  v29[1] = a1 + 16;
  *(void *)size_t v17 = 0;
  *((void *)v17 + 1) = v10;
  uint64_t v18 = *a4;
  long long v19 = **a4;
  *((void *)v17 + 4) = *((void *)*a4 + 2);
  *((_OWORD *)v17 + 1) = v19;
  *((void *)v18 + 1) = 0;
  *((void *)v18 + 2) = 0;
  *(void *)uint64_t v18 = 0;
  *(_OWORD *)(v17 + 40) = 0u;
  *(_OWORD *)(v17 + 56) = 0u;
  *((_DWORD *)v17 + 18) = 1065353216;
  char v30 = 1;
  float v20 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v21 = *(float *)(a1 + 32);
  if (!v11 || (float)(v21 * (float)v11) < v20)
  {
    BOOL v22 = 1;
    if (v11 >= 3) {
      BOOL v22 = (v11 & (v11 - 1)) != 0;
    }
    unint64_t v23 = v22 | (2 * v11);
    unint64_t v24 = vcvtps_u32_f32(v20 / v21);
    if (v23 <= v24) {
      size_t v25 = v24;
    }
    else {
      size_t v25 = v23;
    }
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>(a1, v25);
    unint64_t v11 = *(void *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11) {
        unint64_t v4 = v10 % v11;
      }
      else {
        unint64_t v4 = v10;
      }
    }
    else
    {
      unint64_t v4 = (v11 - 1) & v10;
    }
  }
  id v26 = *(void **)(*(void *)a1 + 8 * v4);
  if (v26)
  {
    *(void *)v29[0] = *v26;
    *id v26 = v29[0];
  }
  else
  {
    *(void *)v29[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v29[0];
    *(void *)(*(void *)a1 + 8 * v4) = a1 + 16;
    if (*(void *)v29[0])
    {
      unint64_t v27 = *(void *)(*(void *)v29[0] + 8);
      if ((v11 & (v11 - 1)) != 0)
      {
        if (v27 >= v11) {
          v27 %= v11;
        }
      }
      else
      {
        v27 &= v11 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v27) = v29[0];
    }
  }
  unint64_t i = (unsigned __int8 *)v29[0];
  v29[0] = 0;
  ++*v8;
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,void *>>>>::reset[abi:ne180100]((uint64_t)v29, 0);
  return i;
}

void sub_1A7CF5580(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,void *>>>>::reset[abi:ne180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

unint64_t std::__string_hash<char>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v3 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(void *)a2;
    unint64_t v3 = v2;
  }
  return std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100]((uint64_t)&v5, (uint64_t *)a2, v3);
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100](uint64_t a1, uint64_t *a2, unint64_t a3)
{
  if (a3 > 0x20)
  {
    if (a3 > 0x40)
    {
      uint64_t v4 = *(uint64_t *)((char *)a2 + a3 - 48);
      uint64_t v5 = *(uint64_t *)((char *)a2 + a3 - 40);
      uint64_t v6 = *(uint64_t *)((char *)a2 + a3 - 24);
      uint64_t v8 = *(uint64_t *)((char *)a2 + a3 - 64);
      uint64_t v7 = *(uint64_t *)((char *)a2 + a3 - 56);
      uint64_t v9 = *(uint64_t *)((char *)a2 + a3 - 16);
      uint64_t v10 = *(uint64_t *)((char *)a2 + a3 - 8);
      unint64_t v11 = v7 + v9;
      unint64_t v12 = 0x9DDFEA08EB382D69
          * (v6 ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))) >> 47) ^ (0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))));
      unint64_t v13 = 0x9DDFEA08EB382D69 * (v12 ^ (v12 >> 47));
      unint64_t v14 = v8 + a3 + v7 + v4;
      uint64_t v15 = v14 + v5;
      unint64_t v16 = __ROR8__(v14, 44) + v8 + a3 + __ROR8__(v5 + v8 + a3 - 0x622015F714C7D297 * (v12 ^ (v12 >> 47)), 21);
      uint64_t v17 = v7 + v9 + *(uint64_t *)((char *)a2 + a3 - 32) - 0x4B6D499041670D8DLL;
      uint64_t v18 = v17 + v6 + v9;
      uint64_t v19 = __ROR8__(v18, 44);
      uint64_t v20 = v18 + v10;
      uint64_t v21 = v19 + v17 + __ROR8__(v17 + v5 + v10, 21);
      uint64_t v23 = *a2;
      BOOL v22 = a2 + 4;
      unint64_t v24 = v23 - 0x4B6D499041670D8DLL * v5;
      uint64_t v25 = -(uint64_t)((a3 - 1) & 0xFFFFFFFFFFFFFFC0);
      do
      {
        uint64_t v26 = *(v22 - 3);
        uint64_t v27 = v24 + v15 + v11 + v26;
        uint64_t v28 = v22[2];
        uint64_t v29 = v22[3];
        uint64_t v30 = v22[1];
        unint64_t v11 = v30 + v15 - 0x4B6D499041670D8DLL * __ROR8__(v11 + v16 + v28, 42);
        uint64_t v31 = v13 + v20;
        uint64_t v32 = *(v22 - 2);
        uint64_t v33 = *(v22 - 1);
        uint64_t v34 = *(v22 - 4) - 0x4B6D499041670D8DLL * v16;
        uint64_t v35 = v34 + v20 + v33;
        uint64_t v36 = v34 + v26 + v32;
        uint64_t v15 = v36 + v33;
        uint64_t v37 = __ROR8__(v36, 44) + v34;
        unint64_t v38 = (0xB492B66FBE98F273 * __ROR8__(v27, 37)) ^ v21;
        unint64_t v24 = 0xB492B66FBE98F273 * __ROR8__(v31, 33);
        unint64_t v16 = v37 + __ROR8__(v35 + v38, 21);
        unint64_t v39 = v24 + v21 + *v22;
        uint64_t v20 = v39 + v30 + v28 + v29;
        uint64_t v21 = __ROR8__(v39 + v30 + v28, 44) + v39 + __ROR8__(v11 + v32 + v39 + v29, 21);
        v22 += 8;
        unint64_t v13 = v38;
        v25 += 64;
      }
      while (v25);
      unint64_t v40 = v24
          - 0x622015F714C7D297
          * ((0x9DDFEA08EB382D69
            * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) ^ ((0x9DDFEA08EB382D69 * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) >> 47));
      unint64_t v41 = 0x9DDFEA08EB382D69
          * (v40 ^ (v38
                  - 0x4B6D499041670D8DLL * (v11 ^ (v11 >> 47))
                  - 0x622015F714C7D297
                  * ((0x9DDFEA08EB382D69
                    * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) ^ ((0x9DDFEA08EB382D69 * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) >> 47))));
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) ^ ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) >> 47));
    }
    else
    {
      return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:ne180100](a2, a3);
    }
  }
  else if (a3 > 0x10)
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:ne180100](a2, a3);
  }
  else
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:ne180100](a2, a3);
  }
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:ne180100](_DWORD *a1, unint64_t a2)
{
  if (a2 < 9)
  {
    if (a2 < 4)
    {
      unint64_t result = 0x9AE16A3B2F90404FLL;
      if (a2)
      {
        unint64_t v8 = (0xC949D7C7509E6557 * (a2 + 4 * *((unsigned __int8 *)a1 + a2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                      * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8)));
        return 0x9AE16A3B2F90404FLL * (v8 ^ (v8 >> 47));
      }
    }
    else
    {
      uint64_t v6 = *(unsigned int *)((char *)a1 + a2 - 4);
      unint64_t v7 = 0x9DDFEA08EB382D69 * (((8 * *a1) + a2) ^ v6);
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) >> 47));
    }
  }
  else
  {
    uint64_t v3 = *(void *)((char *)a1 + a2 - 8);
    uint64_t v4 = __ROR8__(v3 + a2, a2);
    return (0x9DDFEA08EB382D69
          * ((0x9DDFEA08EB382D69
            * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)))) ^ ((0x9DDFEA08EB382D69 * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)))) >> 47))) ^ v3;
  }
  return result;
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:ne180100](void *a1, uint64_t a2)
{
  uint64_t v2 = a1[1];
  unint64_t v3 = 0xB492B66FBE98F273 * *a1;
  uint64_t v4 = __ROR8__(0x9AE16A3B2F90404FLL * *(void *)((char *)a1 + a2 - 8), 30) + __ROR8__(v3 - v2, 43);
  unint64_t v5 = v3 + a2 + __ROR8__(v2 ^ 0xC949D7C7509E6557, 20) - 0x9AE16A3B2F90404FLL * *(void *)((char *)a1 + a2 - 8);
  unint64_t v6 = 0x9DDFEA08EB382D69 * (v5 ^ (v4 - 0x3C5A37A36834CED9 * *(void *)((char *)a1 + a2 - 16)));
  return 0x9DDFEA08EB382D69
       * ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) ^ ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) >> 47));
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:ne180100](void *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)((char *)a1 + a2 - 16);
  uint64_t v3 = *a1 - 0x3C5A37A36834CED9 * (v2 + a2);
  uint64_t v5 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v6 = __ROR8__(v3 + v4, 52);
  uint64_t v7 = v3 + a1[1];
  uint64_t v8 = __ROR8__(v7, 7);
  uint64_t v9 = v7 + v5;
  uint64_t v10 = *(void *)((char *)a1 + a2 - 32) + v5;
  uint64_t v11 = v8 + __ROR8__(*a1 - 0x3C5A37A36834CED9 * (v2 + a2), 37) + v6 + __ROR8__(v9, 31);
  uint64_t v12 = *(void *)((char *)a1 + a2 - 24) + v10 + v2;
  unint64_t v13 = 0xC3A5C85C97CB3127 * (v12 + *(void *)((char *)a1 + a2 - 8) + v4 + v11)
      - 0x651E95C4D06FBFB1
      * (v9
       + v4
       + __ROR8__(v10, 37)
       + __ROR8__(*(void *)((char *)a1 + a2 - 24) + v10, 7)
       + __ROR8__(*(void *)((char *)a1 + a2 - 8) + v4 + v10, 52)
       + __ROR8__(v12, 31));
  return 0x9AE16A3B2F90404FLL
       * ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) ^ ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) >> 47));
}

uint64_t std::equal_to<std::string>::operator()[abi:ne180100](uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  uint64_t v3 = a3;
  uint64_t v4 = a2[23];
  if ((v4 & 0x80u) == 0) {
    uint64_t v5 = a2[23];
  }
  else {
    uint64_t v5 = *((void *)a2 + 1);
  }
  uint64_t v6 = a3[23];
  int v7 = (char)v6;
  if ((v6 & 0x80u) != 0) {
    uint64_t v6 = *((void *)a3 + 1);
  }
  if (v5 != v6) {
    return 0;
  }
  if (v7 < 0) {
    uint64_t v3 = *(unsigned __int8 **)a3;
  }
  if ((v4 & 0x80) != 0) {
    return memcmp(*(const void **)a2, v3, *((void *)a2 + 1)) == 0;
  }
  if (!a2[23]) {
    return 1;
  }
  uint64_t v8 = v4 - 1;
  do
  {
    int v10 = *a2++;
    int v9 = v10;
    int v12 = *v3++;
    int v11 = v12;
    BOOL v14 = v8-- != 0;
    uint64_t result = v9 == v11;
  }
  while (v9 == v11 && v14);
  return result;
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::unordered_set<unsigned long long>>,0>((uint64_t)v2 + 16);
    }
    operator delete(v2);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::unordered_set<unsigned long long>>,0>(uint64_t a1)
{
  std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table(a1 + 24);
  if (*(char *)(a1 + 23) < 0)
  {
    uint64_t v2 = *(void **)a1;
    operator delete(v2);
  }
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>>>::find<std::string>(void *a1, unsigned __int8 *a2)
{
  unint64_t v4 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)(a1 + 3), (uint64_t)a2);
  int8x8_t v5 = (int8x8_t)a1[1];
  if (!*(void *)&v5) {
    return 0;
  }
  unint64_t v6 = v4;
  uint8x8_t v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  unint64_t v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    unint64_t v9 = v4;
    if (v4 >= *(void *)&v5) {
      unint64_t v9 = v4 % *(void *)&v5;
    }
  }
  else
  {
    unint64_t v9 = (*(void *)&v5 - 1) & v4;
  }
  int v10 = *(unsigned __int8 ***)(*a1 + 8 * v9);
  if (!v10) {
    return 0;
  }
  int v11 = *v10;
  if (*v10)
  {
    uint64_t v12 = (uint64_t)(a1 + 4);
    do
    {
      unint64_t v13 = *((void *)v11 + 1);
      if (v13 == v6)
      {
        if (std::equal_to<std::string>::operator()[abi:ne180100](v12, v11 + 16, a2)) {
          return v11;
        }
      }
      else
      {
        if (v8 > 1)
        {
          if (v13 >= *(void *)&v5) {
            v13 %= *(void *)&v5;
          }
        }
        else
        {
          v13 &= *(void *)&v5 - 1;
        }
        if (v13 != v9) {
          return 0;
        }
      }
      int v11 = *(unsigned __int8 **)v11;
    }
    while (v11);
  }
  return v11;
}

{
  unint64_t v4;
  int8x8_t v5;
  unint64_t v6;
  uint8x8_t v7;
  unint64_t v8;
  unint64_t v9;
  unsigned __int8 **v10;
  unsigned __int8 *v11;
  uint64_t v12;
  unint64_t v13;

  unint64_t v4 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)(a1 + 3), (uint64_t)a2);
  int8x8_t v5 = (int8x8_t)a1[1];
  if (!*(void *)&v5) {
    return 0;
  }
  unint64_t v6 = v4;
  uint8x8_t v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  unint64_t v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    unint64_t v9 = v4;
    if (v4 >= *(void *)&v5) {
      unint64_t v9 = v4 % *(void *)&v5;
    }
  }
  else
  {
    unint64_t v9 = (*(void *)&v5 - 1) & v4;
  }
  int v10 = *(unsigned __int8 ***)(*a1 + 8 * v9);
  if (!v10) {
    return 0;
  }
  int v11 = *v10;
  if (*v10)
  {
    uint64_t v12 = (uint64_t)(a1 + 4);
    do
    {
      unint64_t v13 = *((void *)v11 + 1);
      if (v6 == v13)
      {
        if (std::equal_to<std::string>::operator()[abi:ne180100](v12, v11 + 16, a2)) {
          return v11;
        }
      }
      else
      {
        if (v8 > 1)
        {
          if (v13 >= *(void *)&v5) {
            v13 %= *(void *)&v5;
          }
        }
        else
        {
          v13 &= *(void *)&v5 - 1;
        }
        if (v13 != v9) {
          return 0;
        }
      }
      int v11 = *(unsigned __int8 **)v11;
    }
    while (v11);
  }
  return v11;
}

uint64_t std::unordered_set<unsigned long long>::unordered_set(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>(a1, *(void *)(a2 + 8));
  for (unint64_t i = *(void **)(a2 + 16); i; unint64_t i = (void *)*i)
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__emplace_unique_key_args<unsigned long long,unsigned long long const&>(a1, i + 2, i + 2);
  return a1;
}

void sub_1A7CF5CF8(_Unwind_Exception *a1)
{
  std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

void *std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__emplace_unique_key_args<unsigned long long,unsigned long long const&>(uint64_t a1, unint64_t *a2, void *a3)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = *a2;
      if (v6 >= v7) {
        unint64_t v3 = v6 % v7;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
    unint64_t v9 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      for (unint64_t i = *v9; i; unint64_t i = (void *)*i)
      {
        unint64_t v11 = i[1];
        if (v11 == v6)
        {
          if (i[2] == v6) {
            return i;
          }
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7) {
              v11 %= v7;
            }
          }
          else
          {
            v11 &= v7 - 1;
          }
          if (v11 != v3) {
            break;
          }
        }
      }
    }
  }
  unint64_t i = operator new(0x18uLL);
  *unint64_t i = 0;
  i[1] = v6;
  i[2] = *a3;
  float v12 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    BOOL v14 = 1;
    if (v7 >= 3) {
      BOOL v14 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v15 = v14 | (2 * v7);
    unint64_t v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16) {
      size_t v17 = v16;
    }
    else {
      size_t v17 = v15;
    }
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>(a1, v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7) {
        unint64_t v3 = v6 % v7;
      }
      else {
        unint64_t v3 = v6;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
  }
  uint64_t v18 = *(void *)a1;
  uint64_t v19 = *(void **)(*(void *)a1 + 8 * v3);
  if (v19)
  {
    *unint64_t i = *v19;
LABEL_38:
    *uint64_t v19 = i;
    goto LABEL_39;
  }
  *unint64_t i = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = i;
  *(void *)(v18 + 8 * v3) = a1 + 16;
  if (*i)
  {
    unint64_t v20 = *(void *)(*i + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v20 >= v7) {
        v20 %= v7;
      }
    }
    else
    {
      v20 &= v7 - 1;
    }
    uint64_t v19 = (void *)(*(void *)a1 + 8 * v20);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return i;
}

void sub_1A7CF5F18(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      unint64_t v3 = (void *)*v2;
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
  unint64_t v4 = *(void **)a1;
  *(void *)a1 = 0;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1, unsigned __int8 *a2, uint64_t a3, long long **a4)
{
  uint8x8_t v8 = (void *)(a1 + 24);
  unint64_t v9 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  unint64_t v10 = v9;
  unint64_t v11 = *(void *)(a1 + 8);
  if (v11)
  {
    uint8x8_t v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    unint64_t v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      unint64_t v4 = v9;
      if (v9 >= v11) {
        unint64_t v4 = v9 % v11;
      }
    }
    else
    {
      unint64_t v4 = (v11 - 1) & v9;
    }
    BOOL v14 = *(unsigned __int8 ***)(*(void *)a1 + 8 * v4);
    if (v14)
    {
      for (unint64_t i = *v14; i; unint64_t i = *(unsigned __int8 **)i)
      {
        unint64_t v16 = *((void *)i + 1);
        if (v16 == v10)
        {
          if (std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, i + 16, a2)) {
            return i;
          }
        }
        else
        {
          if (v13 > 1)
          {
            if (v16 >= v11) {
              v16 %= v11;
            }
          }
          else
          {
            v16 &= v11 - 1;
          }
          if (v16 != v4) {
            break;
          }
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(a1, v10, a4, (uint64_t)v26);
  float v17 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v18 = *(float *)(a1 + 32);
  if (!v11 || (float)(v18 * (float)v11) < v17)
  {
    BOOL v19 = 1;
    if (v11 >= 3) {
      BOOL v19 = (v11 & (v11 - 1)) != 0;
    }
    unint64_t v20 = v19 | (2 * v11);
    unint64_t v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21) {
      size_t v22 = v21;
    }
    else {
      size_t v22 = v20;
    }
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>(a1, v22);
    unint64_t v11 = *(void *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11) {
        unint64_t v4 = v10 % v11;
      }
      else {
        unint64_t v4 = v10;
      }
    }
    else
    {
      unint64_t v4 = (v11 - 1) & v10;
    }
  }
  uint64_t v23 = *(void **)(*(void *)a1 + 8 * v4);
  if (v23)
  {
    *(void *)v26[0] = *v23;
    *uint64_t v23 = v26[0];
  }
  else
  {
    *(void *)v26[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v26[0];
    *(void *)(*(void *)a1 + 8 * v4) = a1 + 16;
    if (*(void *)v26[0])
    {
      unint64_t v24 = *(void *)(*(void *)v26[0] + 8);
      if ((v11 & (v11 - 1)) != 0)
      {
        if (v24 >= v11) {
          v24 %= v11;
        }
      }
      else
      {
        v24 &= v11 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v24) = v26[0];
    }
  }
  unint64_t i = (unsigned __int8 *)v26[0];
  v26[0] = 0;
  ++*v8;
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,void *>>>>::reset[abi:ne180100]((uint64_t)v26, 0);
  return i;
}

void sub_1A7CF6300(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,void *>>>>::reset[abi:ne180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

double std::__hash_table<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, long long **a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 16;
  uint8x8_t v8 = (char *)operator new(0x50uLL);
  *(void *)a4 = v8;
  *(void *)(a4 + 8) = v7;
  *(unsigned char *)(a4 + 16) = 0;
  *(void *)uint8x8_t v8 = 0;
  *((void *)v8 + 1) = a2;
  unint64_t v9 = (std::string *)(v8 + 16);
  unint64_t v10 = *a3;
  if (*((char *)*a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)v10, *((void *)v10 + 1));
  }
  else
  {
    long long v11 = *v10;
    *((void *)v8 + 4) = *((void *)v10 + 2);
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = v11;
  }
  double result = 0.0;
  *(_OWORD *)(v8 + 56) = 0u;
  *(_OWORD *)(v8 + 40) = 0u;
  *((_DWORD *)v8 + 18) = 1065353216;
  *(unsigned char *)(a4 + 16) = 1;
  return result;
}

void sub_1A7CF63B0(_Unwind_Exception *a1)
{
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,void *>>>>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  int8x8_t v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    std::string::size_type v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17) {
      std::string::size_type v6 = __sz | 7;
    }
    std::string::size_type v7 = v6 + 1;
    uint8x8_t v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    int8x8_t v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }

  memmove(v5, __s, __sz + 1);
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>>>::~__hash_table(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>>>::__deallocate_node(a1, *(void **)(a1 + 16));
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>>>::__deallocate_node(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v2 = a2;
    do
    {
      unint64_t v3 = (void *)*v2;
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::unordered_set<unsigned long long>>,0>((uint64_t)(v2 + 2));
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
}

id VMUVMLedgerNameForTag(unint64_t a1)
{
  if (a1 > 5) {
    id v1 = [[NSString alloc] initWithFormat: @"VM ledger tag %llu", a1];
  }
  else {
    id v1 = gVMLedgerNames[a1];
  }

  return v1;
}

id VMUGatherOwnedVmObjects(void *a1)
{
  id v1 = a1;
  size_t v16 = 0;
  uint64_t v2 = [v1 memoryCache];
  int v3 = -[VMUTaskMemoryCache getOwnedVMObjectsIntoBuffer:byteCount:]((uint64_t)v2, 0, &v16);

  unint64_t v4 = 0;
  if (!v3)
  {
    size_t v5 = v16;
    if (v16)
    {
      std::string::size_type v6 = 0;
      size_t v15 = 0;
      do
      {
        v5 += 896;
        std::string::size_type v6 = (unint64_t *)malloc_type_realloc(v6, v5, 0x8FC1A16uLL);
        size_t v15 = v5;
        std::string::size_type v7 = [v1 memoryCache];
        int v8 = -[VMUTaskMemoryCache getOwnedVMObjectsIntoBuffer:byteCount:]((uint64_t)v7, v6, &v15);

        if (v8)
        {
          unint64_t v4 = 0;
          goto LABEL_12;
        }
      }
      while (v5 == v15);
      unint64_t v4 = objc_opt_new();
      if (v15)
      {
        if (v15 > 7)
        {
          if (v15 - 8 >= 56 * *v6)
          {
            if (*v6)
            {
              unint64_t v10 = 0;
              long long v11 = (uint64_t *)(v6 + 1);
              do
              {
                uint8x8_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v11 length:56];
                uint64_t v13 = *v11;
                v11 += 7;
                BOOL v14 = [NSNumber numberWithUnsignedLongLong:v13];
                [v4 setObject:v12 forKeyedSubscript:v14];

                ++v10;
              }
              while (v10 < *v6);
            }
          }
          else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            VMUGatherOwnedVmObjects_cold_2();
          }
        }
        else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          VMUGatherOwnedVmObjects_cold_1();
        }
      }
LABEL_12:
      free(v6);
    }
    else
    {
      unint64_t v4 = objc_opt_new();
    }
  }

  return v4;
}

uint64_t VMUFootprintForVmObject(uint64_t result, void *a2, void *a3)
{
  unsigned int v3 = *(unsigned __int8 *)(result + 48);
  if (v3)
  {
    uint64_t v6 = 0;
    *a2 = 0;
  }
  else
  {
    int v4 = (v3 >> 4) & 3;
    if (v4 == 3 || v4 == 0)
    {
      *a2 = *(void *)(result + 16) - *(void *)(result + 32);
      uint64_t v6 = *(void *)(result + 40);
    }
    else
    {
      uint64_t v6 = 0;
      *a2 = *(void *)(result + 24);
    }
  }
  *a3 = v6;
  return result;
}

id _removeReturnValueFromCPlusPlusSymbolName(void *a1)
{
  id v1 = a1;
  if ([v1 containsString:@"::"])
  {
    uint64_t v2 = [v1 stringByReplacingOccurrencesOfString:@"__1::" withString:&stru_1EFE27F38];

    if (([v2 hasPrefix:@"invocation function "] & 1) != 0
      || ([v2 hasPrefix:@"operator "] & 1) != 0
      || (unint64_t v3 = _lengthOfSubclauseInCPlusPlusSymbolName(v2, 0, 0, 1)) == 0)
    {
      id v1 = v2;
    }
    else
    {
      id v1 = [v2 substringFromIndex:v3];
    }
  }
  id v4 = v1;

  return v4;
}

id _removeStdArgumentsFromCPlusPlusSymbolName(void *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if ([v1 containsString:@"std::"])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v2 = [&unk_1EFE3FFE8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v2)
    {
      uint64_t v3 = v2;
      uint64_t v4 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v15 != v4) {
            objc_enumerationMutation(&unk_1EFE3FFE8);
          }
          uint64_t v6 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          uint64_t v7 = [v1 rangeOfString:v6];
          if (v7 != 0x7FFFFFFFFFFFFFFFLL)
          {
            for (unint64_t j = v7; j != 0x7FFFFFFFFFFFFFFFLL; unint64_t j = [v1 rangeOfString:v6])
            {
              unint64_t v9 = _lengthOfSubclauseInCPlusPlusSymbolName(v1, j, 1, 0);
              if (v9)
              {
                unint64_t v10 = [v1 substringWithRange:j, v9];
                uint64_t v11 = [v1 stringByReplacingOccurrencesOfString:v10 withString:&stru_1EFE27F38];

                id v1 = (id)v11;
              }
            }
          }
        }
        uint64_t v3 = [&unk_1EFE3FFE8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v3);
    }
  }
  id v12 = v1;

  return v12;
}

void _printCPlusPlusNameSimplification(void *a1, void *a2)
{
  id v5 = a1;
  id v3 = a2;
  if (_printCPlusPlusNameSimplification_onceToken != -1) {
    dispatch_once(&_printCPlusPlusNameSimplification_onceToken, &__block_literal_global_535);
  }
  if (_printCPlusPlusNameSimplification_printCPlusPlusNameSimplification == 1
    && ([v5 isEqualToString:v3] & 1) == 0)
  {
    uint64_t v4 = (FILE **)MEMORY[0x1E4F143C8];
    fprintf((FILE *)*MEMORY[0x1E4F143C8], "ORIGINAL: %s\n", (const char *)[v5 UTF8String]);
    fprintf(*v4, " SIMPLER: %s\n", (const char *)[v3 UTF8String]);
    fputc(10, *v4);
  }
}

id VMUSimplifyCPlusPlusSymbolName(void *a1)
{
  id v1 = a1;
  uint64_t v2 = _removeReturnValueFromCPlusPlusSymbolName(v1);
  id v3 = _removeStdArgumentsFromCPlusPlusSymbolName(v2);

  _printCPlusPlusNameSimplification(v1, v3);

  return v3;
}

unint64_t _lengthOfSubclauseInCPlusPlusSymbolName(void *a1, unint64_t a2, int a3, char a4)
{
  id v7 = a1;
  if ([v7 length] <= a2)
  {
LABEL_19:
    unint64_t v15 = 0;
    goto LABEL_20;
  }
  unint64_t v8 = 0;
  int v9 = 0;
  int v10 = a3 ^ 1;
  unint64_t v11 = a2;
  while (1)
  {
    int v12 = [v7 characterAtIndex:v11];
    if (v9) {
      int v13 = 0;
    }
    else {
      int v13 = v10;
    }
    if (v13 == 1 && v12 == 32)
    {
      int v9 = 0;
      unint64_t v8 = v11 + 1;
      goto LABEL_16;
    }
    if (!v9 && v12 == 40) {
      goto LABEL_17;
    }
    if (v12 != 62)
    {
      if (v12 == 60)
      {
        unint64_t v14 = v8;
        if (v8) {
          goto LABEL_28;
        }
        ++v9;
      }
      goto LABEL_16;
    }
    if (!--v9) {
      break;
    }
LABEL_16:
    if (++v11 >= [v7 length]) {
      goto LABEL_17;
    }
  }
  unint64_t v14 = v11 + 1;
  if (v11 + 1 < [v7 length] && [v7 characterAtIndex:v11 + 1] == 38) {
    unint64_t v14 = v11 + 2;
  }
  if (v14 < [v7 length] && [v7 characterAtIndex:v14] == 32)
  {
    ++v14;
LABEL_28:
    unint64_t v15 = v14 - a2;
    goto LABEL_20;
  }
  if ((a4 & 1) == 0) {
    goto LABEL_28;
  }
LABEL_17:
  if (!v8) {
    goto LABEL_19;
  }
  unint64_t v15 = v8 - a2;
LABEL_20:

  return v15;
}

char *___printCPlusPlusNameSimplification_block_invoke()
{
  double result = getenv("DT_PRINT_NAME_SIMPLIFICATION");
  if (result)
  {
    if ((*result | 0x20) != 0x6E) {
      _printCPlusPlusNameSimplification_printCPlusPlusNameSimplification = 1;
    }
  }
  return result;
}

void sub_1A7CFAB9C(_Unwind_Exception *a1)
{
}

void sub_1A7CFAFB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 144), 8);
  _Block_object_dispose((const void *)(v31 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_1A7CFC434(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v26 - 120), 8);
  _Unwind_Resume(a1);
}

uint64_t _parseAllocationSizeBound(const char **__endptr)
{
  char v2 = 10;
  uint64_t result = strtoll(*__endptr, (char **)__endptr, 10);
  int v4 = **__endptr & 0xDF;
  if (v4 != 75)
  {
    if (v4 != 77) {
      return result;
    }
    char v2 = 20;
  }
  result <<= v2;
  ++*__endptr;
  return result;
}

void sub_1A7CFE380(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7CFE534(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_1A7CFE5F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7CFE898(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *__p,uint64_t a26)
{
  _Block_object_dispose(&a19, 8);
  if (__p)
  {
    a26 = (uint64_t)__p;
    operator delete(__p);
  }
  _Block_object_dispose((const void *)(v28 - 136), 8);
  uint64_t v30 = *(void **)(v28 - 88);
  if (v30)
  {
    *(void *)(v28 - 80) = v30;
    operator delete(v30);
  }

  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__3(__n128 *a1, __n128 *a2)
{
  a1[3].n128_u64[0] = 0;
  a1[3].n128_u64[1] = 0;
  a1[4].n128_u64[0] = 0;
  __n128 result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
  char v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(void *)(a1 + 56) = v2;
    operator delete(v2);
  }
}

__n128 __Block_byref_object_copy__14(__n128 *a1, __n128 *a2)
{
  a1[3].n128_u64[0] = 0;
  a1[3].n128_u64[1] = 0;
  a1[4].n128_u64[0] = 0;
  __n128 result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  return result;
}

void __Block_byref_object_dispose__15(uint64_t a1)
{
  char v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(void *)(a1 + 56) = v2;
    operator delete(v2);
  }
}

void sub_1A7CFEEE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7CFEFE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7CFF6D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id obj, uint64_t a14, uint64_t a15, void *a16, id location, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A7CFF8B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{
  _Unwind_Resume(a1);
}

void sub_1A7CFF934(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A7CFFBAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7D00470(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  small_objc_portable_task_crash_info_t::~small_objc_portable_task_crash_info_t((id *)va);
  _Unwind_Resume(a1);
}

void small_objc_portable_task_crash_info_t::~small_objc_portable_task_crash_info_t(id *this)
{
}

void sub_1A7D008D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7D00D28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1A7D00E58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7D00F8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7D0105C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7D01610(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

uint64_t _compareBinaryImageDicts(objc_object *a1, objc_object *a2, void *a3)
{
  int v4 = a2;
  id v5 = [(objc_object *)a1 objectForKey:@"StartAddress"];
  unint64_t v6 = [v5 unsignedLongLongValue];

  id v7 = [(objc_object *)v4 objectForKey:@"StartAddress"];
  unint64_t v8 = [v7 unsignedLongLongValue];

  uint64_t v9 = 1;
  if (v6 <= v8) {
    uint64_t v9 = -1;
  }
  if (v6 == v8) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = v9;
  }

  return v10;
}

void sub_1A7D0177C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7D0189C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7D01AF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1A7D02104(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21)
{
  _Unwind_Resume(a1);
}

void sub_1A7D02538(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A7D02678(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7D02714(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7D02854(_Unwind_Exception *a1)
{
  int v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A7D02924(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7D02A30(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1A7D02DF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,uint64_t a23,void *a24,uint64_t a25,void *a26,int a27,uint64_t a28,void *a29)
{
  if (v32) {

  }
  if (v34)
  {
  }
  if (v30) {

  }
  if (a23) {
  if (a25)
  }

  if (a27) {
  if (a28)
  }

  _Unwind_Resume(a1);
}

void sub_1A7D02F1C()
{
}

void sub_1A7D03038(_Unwind_Exception *a1)
{
  id v5 = v3;

  _Unwind_Resume(a1);
}

void sub_1A7D032F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7D033B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)VMUProcessDescription;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<_CSBinaryRelocationInformation>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x666666666666667) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(40 * a2);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<_CSBinaryImageInformation>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 58) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(a2 << 6);
}

id VMUOptionParserError(int a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v10 = a2;
  if (v10)
  {
    uint64_t v11 = [[NSString alloc] initWithFormat:v10 arguments:&a9];
    int v12 = (void *)v11;
    if (v11)
    {
      uint64_t v16 = *MEMORY[0x1E4F28568];
      v17[0] = v11;
      int v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    }
    else
    {
      int v13 = 0;
    }
  }
  else
  {
    int v13 = 0;
    int v12 = 0;
  }
  unint64_t v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"VMUOptionParserDomain" code:a1 userInfo:v13];

  return v14;
}

void _arrayFreeValue(int a1, void *a2)
{
  if (a2) {
    free(a2);
  }
}

void VMUOptionParserRegisterFlag(void *a1, uint64_t a2, int a3, uint64_t a4, void *a5)
{
  id v9 = a1;
  id v10 = a5;
  if (!v10) {
    goto LABEL_16;
  }
  if (a2)
  {
    uint64_t v11 = [NSString stringWithUTF8String:a2];
    if (a3) {
      goto LABEL_4;
    }
LABEL_7:
    int v12 = 0;
    if (a4) {
      goto LABEL_5;
    }
LABEL_8:
    int v13 = 0;
    goto LABEL_9;
  }
  uint64_t v11 = 0;
  if (!a3) {
    goto LABEL_7;
  }
LABEL_4:
  int v12 = [NSString stringWithFormat:@"%c", a3];
  if (!a4) {
    goto LABEL_8;
  }
LABEL_5:
  int v13 = [NSString stringWithUTF8String:a4];
LABEL_9:
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __VMUOptionParserRegisterFlag_block_invoke;
  v14[3] = &unk_1E5D23970;
  id v15 = v10;
  [v9 registerOptionWithLongName:v11 shortName:v12 argumentKind:0 argumentName:0 optionDescription:v13 handler:v14];
  if (a4) {

  }
  if (a3) {
  if (a2)
  }

LABEL_16:
}

uint64_t __VMUOptionParserRegisterFlag_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void VMUOptionParserRegisterFlagInternal(void *a1, uint64_t a2, int a3, uint64_t a4, void *a5)
{
  id v9 = a1;
  id v10 = a5;
  if (!v10) {
    goto LABEL_16;
  }
  if (a2)
  {
    uint64_t v11 = [NSString stringWithUTF8String:a2];
    if (a3) {
      goto LABEL_4;
    }
LABEL_7:
    int v12 = 0;
    if (a4) {
      goto LABEL_5;
    }
LABEL_8:
    int v13 = 0;
    goto LABEL_9;
  }
  uint64_t v11 = 0;
  if (!a3) {
    goto LABEL_7;
  }
LABEL_4:
  int v12 = [NSString stringWithFormat:@"%c", a3];
  if (!a4) {
    goto LABEL_8;
  }
LABEL_5:
  int v13 = [NSString stringWithUTF8String:a4];
LABEL_9:
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __VMUOptionParserRegisterFlagInternal_block_invoke;
  v14[3] = &unk_1E5D23970;
  id v15 = v10;
  [v9 registerOptionWithLongName:v11 shortName:v12 argumentKind:0 argumentName:0 optionDescription:v13 flags:1 handler:v14];
  if (a4) {

  }
  if (a3) {
  if (a2)
  }

LABEL_16:
}

uint64_t __VMUOptionParserRegisterFlagInternal_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void VMUSetCrashReporterInfo(void *a1)
{
  id v2 = a1;
  if (v2)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&crashreporterInfoLock);
    objc_storeStrong((id *)&gVMUCrashLogMessage, a1);
    qword_1EB5788C8 = [(id)gVMUCrashLogMessage UTF8String];
    os_unfair_lock_unlock((os_unfair_lock_t)&crashreporterInfoLock);
  }
  else
  {
    VMUClearCrashReporterInfo();
  }
}

void VMUClearCrashReporterInfo()
{
  if (gVMUCrashLogMessage)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&crashreporterInfoLock);
    qword_1EB5788C8 = 0;
    dispatch_queue_t v0 = (void *)gVMUCrashLogMessage;
    gVMUCrashLogMessage = 0;

    os_unfair_lock_unlock((os_unfair_lock_t)&crashreporterInfoLock);
  }
}

void *vmu_swift_reflection_createReflectionContext(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  int v12 = malloc_type_calloc(0x58uLL, 1uLL, 0x391CAB93uLL);
  void *v12 = a1;
  v12[1] = a2;
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = a5;
  v12[5] = a6;
  v12[10] = CFDictionaryCreateMutable(0, 0, 0, 0);
  return v12;
}

uint64_t vmu_swift_reflection_interop_addLibrary(void *a1, void *a2)
{
  int v4 = (char *)malloc_type_realloc((void *)a1[6], 288 * *((int *)a1 + 14) + 288, 0x637C0AE7uLL);
  a1[6] = v4;
  if (!a2) {
    return 0;
  }
  id v5 = v4;
  int v6 = *((_DWORD *)a1 + 14);
  id v7 = &v4[288 * v6];
  *((void *)v7 + 1) = dlsym(a2, "swift_reflection_classIsSwiftMask");
  uint64_t result = (uint64_t)dlsym(a2, "swift_reflection_getSupportedMetadataVersion");
  *((void *)v7 + 2) = result;
  if (!result) {
    return result;
  }
  if (((unsigned int (*)(void))result)() < 3) {
    return 0;
  }
  id v9 = dlsym(a2, "swift_reflection_addImage");
  BOOL v10 = v9 == 0;
  uint64_t result = (uint64_t)dlsym(a2, "swift_reflection_createReflectionContext");
  uint64_t v11 = &v5[288 * v6];
  if (v9)
  {
    *((void *)v11 + 3) = result;
    if (!result) {
      return result;
    }
    uint64_t result = (uint64_t)dlsym(a2, "swift_reflection_addReflectionInfo");
    *(void *)&v5[288 * v6 + 56] = result;
    if (!result) {
      return result;
    }
    uint64_t result = (uint64_t)dlsym(a2, "swift_reflection_addImage");
    *(void *)&v5[288 * v6 + 72] = result;
    if (!result) {
      return result;
    }
    uint64_t result = (uint64_t)dlsym(a2, "swift_reflection_ownsObject");
    *(void *)&v5[288 * v6 + 96] = result;
    if (!result) {
      return result;
    }
    uint64_t result = (uint64_t)dlsym(a2, "swift_reflection_ownsAddress");
    *(void *)&v5[288 * v6 + 104] = result;
    if (!result) {
      return result;
    }
    uint64_t result = (uint64_t)dlsym(a2, "swift_reflection_metadataForObject");
    *(void *)&v5[288 * v6 + 112] = result;
    if (!result) {
      return result;
    }
    *(void *)&v5[288 * v6 + 32] = dlsym(a2, "swift_reflection_createReflectionContextWithDataLayout");
  }
  else
  {
    *((void *)v11 + 5) = result;
    if (!result) {
      return result;
    }
    uint64_t result = (uint64_t)dlsym(a2, "swift_reflection_addReflectionInfo");
    *(void *)&v5[288 * v6 + 64] = result;
    if (!result) {
      return result;
    }
  }
  uint64_t result = (uint64_t)dlsym(a2, "swift_reflection_destroyReflectionContext");
  *(void *)&v5[288 * v6 + 48] = result;
  if (result)
  {
    uint64_t result = (uint64_t)dlsym(a2, "swift_reflection_readIsaMask");
    *(void *)&v5[288 * v6 + 80] = result;
    if (result)
    {
      uint64_t result = (uint64_t)dlsym(a2, "swift_reflection_typeRefForMetadata");
      *(void *)&v5[288 * v6 + 88] = result;
      if (result)
      {
        uint64_t result = (uint64_t)dlsym(a2, "swift_reflection_typeRefForInstance");
        *(void *)&v5[288 * v6 + 120] = result;
        if (result)
        {
          uint64_t result = (uint64_t)dlsym(a2, "swift_reflection_typeRefForMangledTypeName");
          *(void *)&v5[288 * v6 + 128] = result;
          if (result)
          {
            int v12 = &v5[288 * v6];
            *((void *)v12 + 17) = dlsym(a2, "swift_reflection_copyDemangledNameForTypeRef");
            uint64_t result = (uint64_t)dlsym(a2, "swift_reflection_infoForTypeRef");
            *((void *)v12 + 20) = result;
            if (result)
            {
              uint64_t result = (uint64_t)dlsym(a2, "swift_reflection_childOfTypeRef");
              *(void *)&v5[288 * v6 + 168] = result;
              if (result)
              {
                uint64_t result = (uint64_t)dlsym(a2, "swift_reflection_infoForMetadata");
                *(void *)&v5[288 * v6 + 176] = result;
                if (result)
                {
                  uint64_t result = (uint64_t)dlsym(a2, "swift_reflection_childOfMetadata");
                  *(void *)&v5[288 * v6 + 184] = result;
                  if (result)
                  {
                    uint64_t result = (uint64_t)dlsym(a2, "swift_reflection_infoForInstance");
                    *(void *)&v5[288 * v6 + 192] = result;
                    if (result)
                    {
                      uint64_t result = (uint64_t)dlsym(a2, "swift_reflection_childOfInstance");
                      *(void *)&v5[288 * v6 + 200] = result;
                      if (result)
                      {
                        uint64_t result = (uint64_t)dlsym(a2, "swift_reflection_genericArgumentCountOfTypeRef");
                        *(void *)&v5[288 * v6 + 208] = result;
                        if (result)
                        {
                          uint64_t result = (uint64_t)dlsym(a2, "swift_reflection_genericArgumentOfTypeRef");
                          *(void *)&v5[288 * v6 + 216] = result;
                          if (result)
                          {
                            uint64_t result = (uint64_t)dlsym(a2, "swift_reflection_projectExistential");
                            *(void *)&v5[288 * v6 + 224] = result;
                            if (result)
                            {
                              int v13 = &v5[288 * v6];
                              *((void *)v13 + 29) = dlsym(a2, "swift_reflection_projectEnumValue");
                              *((void *)v13 + 1_Block_object_dispose(&STACK[0x280], 8) = dlsym(a2, "swift_reflection_asyncTaskSlabPointer");
                              *((void *)v13 + 19) = dlsym(a2, "swift_reflection_asyncTaskSlabAllocations");
                              uint64_t result = (uint64_t)dlsym(a2, "swift_reflection_dumpTypeRef");
                              *((void *)v13 + 30) = result;
                              if (result)
                              {
                                uint64_t result = (uint64_t)dlsym(a2, "swift_reflection_dumpInfoForTypeRef");
                                *(void *)&v5[288 * v6 + 248] = result;
                                if (result)
                                {
                                  uint64_t result = (uint64_t)dlsym(a2, "swift_reflection_dumpInfoForInstance");
                                  *(void *)&v5[288 * v6 + 264] = result;
                                  if (result)
                                  {
                                    uint64_t result = (uint64_t)dlsym(a2, "swift_reflection_dumpInfoForMetadata");
                                    *(void *)&v5[288 * v6 + 256] = result;
                                    if (result)
                                    {
                                      *(_DWORD *)&v5[288 * v6 + 280] = v10;
                                      int v14 = *((_DWORD *)a1 + 14);
                                      *((_DWORD *)a1 + 14) = v14 + 1;
                                      uint64_t v15 = a1[6];
                                      uint64_t v16 = v15 + 288 * v14;
                                      if (*(_DWORD *)(v16 + 280))
                                      {
                                        uint64_t v17 = (*(uint64_t (**)(void *, uint64_t (*)(), uint64_t (*)(), uint64_t (*)(void *, uint64_t, void *, size_t), uint64_t (*)(uint64_t), uint64_t (*)(uint64_t)))(v15 + 288 * v14 + 40))(a1, swift_reflection_interop_getSizeAdapter, swift_reflection_interop_getSizeAdapter, swift_reflection_interop_readBytesAdapter, swift_reflection_interop_GetStringLengthAdapter, swift_reflection_interop_GetSymbolAddressAdapter);
                                      }
                                      else
                                      {
                                        float v18 = *(uint64_t (**)(void, void, void, void, void, void))(v15 + 288 * v14 + 32);
                                        if (v18)
                                        {
                                          uint64_t v17 = v18(*a1, a1[1], a1[2], a1[3], a1[4], a1[5]);
                                        }
                                        else
                                        {
                                          unsigned __int8 v19 = 0;
                                          if (!((unsigned int (*)(void, void, void, unsigned __int8 *))a1[1])(*a1, 0, 0, &v19))abort(); {
                                          uint64_t v17 = (*(uint64_t (**)(void, void, void, void, void, void))(v15 + 288 * v14 + 24))(*a1, v19, a1[2], a1[3], a1[4], a1[5]);
                                          }
                                        }
                                      }
                                      *(void *)uint64_t v16 = v17;
                                      return 1;
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
      }
    }
  }
  return result;
}

void vmu_swift_reflection_destroyReflectionContext(int *a1)
{
  id v2 = (void *)*((void *)a1 + 6);
  if (a1[14] >= 1)
  {
    do
    {
      ((void (*)(void))v2[6])(*v2);
      v2 += 36;
    }
    while ((unint64_t)v2 < *((void *)a1 + 6) + 288 * a1[14]);
    id v2 = (void *)*((void *)a1 + 6);
  }
  free(v2);
  id v3 = (void *)*((void *)a1 + 9);
  if (v3)
  {
    do
    {
      int v4 = (void *)*v3;
      free(v3);
      id v3 = v4;
    }
    while (v4);
  }
  id v5 = (void *)*((void *)a1 + 8);
  if (v5)
  {
    do
    {
      (*((void (**)(void, void, void))a1 + 2))(*(void *)a1, v5[1], v5[2]);
      int v6 = (void *)*v5;
      free(v5);
      id v5 = v6;
    }
    while (v6);
  }
  CFRelease(*((CFTypeRef *)a1 + 10));

  free(a1);
}

uint64_t vmu_swift_reflection_addImage(int *a1, unint64_t a2)
{
  if (a1[14] < 1) {
    return 0;
  }
  unint64_t v4 = *((void *)a1 + 6);
  while (1)
  {
    if (!*(_DWORD *)(v4 + 280))
    {
      LODWORD(v5) = (*(uint64_t (**)(void, unint64_t))(v4 + 72))(*(void *)v4, a2);
LABEL_29:
      if (v5) {
        return 1;
      }
      goto LABEL_30;
    }
    v41[0] = 0;
    id v5 = (const mach_header_64 *)(*((uint64_t (**)(void, unint64_t, uint64_t, void *))a1 + 3))(*(void *)a1, a2, 32, v41);
    if (!v5) {
      goto LABEL_29;
    }
    int v6 = v5;
    if (v5->magic >> 1 == 2138504551) {
      break;
    }
    uint64_t v30 = (void (*)(uint64_t, const mach_header_64 *, uint64_t))*((void *)a1 + 2);
    if (v30)
    {
      uint64_t v31 = *(void *)a1;
      uint64_t v32 = v41[0];
LABEL_34:
      v30(v31, v6, v32);
    }
LABEL_30:
    v4 += 288;
    if (v4 >= *((void *)a1 + 6) + 288 * a1[14]) {
      return 0;
    }
  }
  uint64_t sizeofcmds = v5->sizeofcmds;
  unint64_t v8 = (void (*)(void, const mach_header_64 *, void))*((void *)a1 + 2);
  if (v8) {
    v8(*(void *)a1, v5, v41[0]);
  }
  id v5 = (const mach_header_64 *)(*((uint64_t (**)(void, unint64_t, uint64_t, void *))a1 + 3))(*(void *)a1, a2, sizeofcmds, v41);
  if (!v5) {
    goto LABEL_29;
  }
  id v9 = v5;
  unint64_t size = 0;
  BOOL v10 = getsegmentdata(v5, "__TEXT", &size);
  uint64_t v11 = (void (*)(void, const mach_header_64 *, void))*((void *)a1 + 2);
  if (v11) {
    v11(*(void *)a1, v9, v41[0]);
  }
  if (!v10) {
    goto LABEL_30;
  }
  id v5 = (const mach_header_64 *)(*((uint64_t (**)(void, unint64_t, unint64_t, void *))a1 + 3))(*(void *)a1, a2, v10 - (uint8_t *)v9 + size, v41);
  if (!v5) {
    goto LABEL_29;
  }
  int v12 = v5;
  v39[0] = 0;
  int v13 = getsectiondata(v5, "__TEXT", "__swift3_fieldmd", v39);
  int v14 = &v13[v39[0]];
  if (!v13) {
    int v14 = 0;
  }
  unint64_t v38 = (unint64_t)v14;
  v39[0] = 0;
  uint64_t v15 = getsectiondata(v12, "__TEXT", "__swift3_assocty", v39);
  uint64_t v16 = &v15[v39[0]];
  if (!v15) {
    uint64_t v16 = 0;
  }
  unint64_t v37 = (unint64_t)v16;
  v39[0] = 0;
  uint64_t v17 = getsectiondata(v12, "__TEXT", "__swift3_builtin", v39);
  float v18 = &v17[v39[0]];
  if (!v17) {
    float v18 = 0;
  }
  unint64_t v36 = (unint64_t)v18;
  v39[0] = 0;
  unsigned __int8 v19 = getsectiondata(v12, "__TEXT", "__swift3_capture", v39);
  unint64_t v20 = &v19[v39[0]];
  if (!v19) {
    unint64_t v20 = 0;
  }
  unint64_t v35 = (unint64_t)v20;
  v39[0] = 0;
  unint64_t v21 = getsectiondata(v12, "__TEXT", "__swift3_typeref", v39);
  size_t v22 = &v21[v39[0]];
  if (!v21) {
    size_t v22 = 0;
  }
  unint64_t v34 = (unint64_t)v22;
  v39[0] = 0;
  uint64_t v23 = getsectiondata(v12, "__TEXT", "__swift3_reflstr", v39);
  if (!v23)
  {
    unint64_t v24 = 0;
    if (v21 || v19 || v17 || v15 || v13) {
      goto LABEL_25;
    }
    uint64_t v30 = (void (*)(uint64_t, const mach_header_64 *, uint64_t))*((void *)a1 + 2);
    if (v30)
    {
      uint64_t v31 = *(void *)a1;
      uint64_t v32 = v41[0];
      int v6 = v12;
      goto LABEL_34;
    }
    goto LABEL_30;
  }
  unint64_t v24 = (unint64_t)&v23[v39[0]];
LABEL_25:
  uint64_t v25 = *(void (**)(uint64_t, unint64_t *))(v4 + 64);
  uint64_t v26 = *(void *)v4;
  v39[0] = (unint64_t)v13;
  v39[1] = v38;
  v39[2] = (unint64_t)v15;
  v39[3] = v37;
  v39[4] = (unint64_t)v17;
  v39[5] = v36;
  v39[6] = (unint64_t)v19;
  v39[7] = v35;
  v39[8] = (unint64_t)v21;
  v39[9] = v34;
  v39[10] = (unint64_t)v23;
  v39[11] = v24;
  v39[12] = (unint64_t)v12;
  v39[13] = a2;
  v25(v26, v39);
  v39[0] = 0;
  uint64_t v27 = getsegmentdata(v12, "__DATA", v39);
  uint64_t v28 = malloc_type_malloc(0x18uLL, 0x102004024DAA5DEuLL);
  void *v28 = *((void *)a1 + 9);
  v28[1] = a2;
  v28[2] = &v27[a2 - (void)v12 + v39[0]];
  *((void *)a1 + 9) = v28;
  if (*((void *)a1 + 2))
  {
    uint64_t v29 = malloc_type_malloc(0x18uLL, 0xE00400670D255uLL);
    void *v29 = *((void *)a1 + 8);
    v29[1] = v12;
    void v29[2] = v41[0];
    *((void *)a1 + _Block_object_dispose(&STACK[0x280], 8) = v29;
  }
  return 1;
}

uint64_t vmu_swift_reflection_interop_typeRefForMetadata(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = *(void *)(a1 + 48) + 288 * a3;
  return (*(uint64_t (**)(void))(v3 + 88))(*(void *)v3);
}

uint64_t vmu_swift_reflection_interop_metadataForObject(uint64_t a1, uint64_t a2)
{
  int v2 = *(_DWORD *)(a1 + 56);
  if (v2 >= 1)
  {
    unint64_t v5 = *(void *)(a1 + 48);
    unint64_t v6 = v5;
    do
    {
      if (!*(_DWORD *)(v6 + 280))
      {
        uint64_t result = (*(uint64_t (**)(void, uint64_t))(v6 + 112))(*(void *)v6, a2);
        if (result) {
          return result;
        }
        unint64_t v5 = *(void *)(a1 + 48);
        int v2 = *(_DWORD *)(a1 + 56);
      }
      v6 += 288;
    }
    while (v6 < v5 + 288 * v2);
  }
  return 0;
}

char *vmu_swift_reflection_interop_copyDemangledNameForTypeRef(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = *(void *)(a1 + 48);
  unint64_t v4 = *(uint64_t (**)(void))(v3 + 288 * a3 + 136);
  if (v4)
  {
    unint64_t v5 = (char *)v4(*(void *)(v3 + 288 * a3));
    if (v5) {
      unint64_t v5 = (char *)[[NSString alloc] initWithBytesNoCopy:v5 length:strlen(v5) encoding:4 freeWhenDone:1];
    }
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

uint64_t vmu_swift_reflection_infoForTypeRef(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = *(void *)(a1 + 48) + 288 * a3;
  return (*(uint64_t (**)(void))(v3 + 160))(*(void *)v3);
}

double vmu_swift_reflection_childOfTypeRef@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, double *a5@<X8>)
{
  uint64_t v7 = *(void *)(a1 + 48) + 288 * a3;
  uint64_t v9 = 0;
  double v10 = 0.0;
  uint64_t v11 = 0;
  (*(void (**)(uint64_t *__return_ptr, void, uint64_t, uint64_t))(v7 + 168))(&v9, *(void *)v7, a2, a4);
  *(void *)a5 = v9;
  double result = v10;
  a5[1] = v10;
  *((void *)a5 + 2) = v11;
  a5[3] = 0.0;
  *((_DWORD *)a5 + 6) = a3;
  return result;
}

const void *vmu_swift_reflection_interop_lookupMetadata(uint64_t a1, const void *a2)
{
  int v2 = a2;
  value = 0;
  if (CFDictionaryGetValueIfPresent(*(CFDictionaryRef *)(a1 + 80), a2, (const void **)&value))
  {
    if (*(void *)(a1 + 48) + 288 * (void)value) {
      return v2;
    }
    return 0;
  }
  int v4 = *(_DWORD *)(a1 + 56);
  if (v4 < 1) {
    return 0;
  }
  unint64_t v5 = *(void *)(a1 + 48);
  unint64_t v6 = v5;
  while (!*(_DWORD *)(v6 + 280))
  {
    int v8 = (*(uint64_t (**)(void, const void *))(v6 + 104))(*(void *)v6, v2);
    unint64_t v5 = *(void *)(a1 + 48);
    if (v8) {
      goto LABEL_16;
    }
    int v4 = *(_DWORD *)(a1 + 56);
LABEL_14:
    v6 += 288;
    if (v6 >= v5 + 288 * v4) {
      return 0;
    }
  }
  uint64_t v7 = *(void **)(a1 + 72);
  if (!v7) {
    goto LABEL_14;
  }
  while (v7[1] > (unint64_t)v2 || v7[2] <= (unint64_t)v2)
  {
    uint64_t v7 = (void *)*v7;
    if (!v7) {
      goto LABEL_14;
    }
  }
LABEL_16:
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 80), v2, (const void *)(0x8E38E38E38E38E39 * ((uint64_t)(v6 - v5) >> 5)));
  if (!v6) {
    return 0;
  }
  return v2;
}

uint64_t vmu_swift_reflection_infoForMetadata(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = *(void *)(a1 + 48) + 288 * a3;
  return (*(uint64_t (**)(void))(v3 + 176))(*(void *)v3);
}

double vmu_swift_reflection_childOfMetadata@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, double *a5@<X8>)
{
  uint64_t v7 = *(void *)(a1 + 48) + 288 * a3;
  uint64_t v9 = 0;
  double v10 = 0.0;
  uint64_t v11 = 0;
  (*(void (**)(uint64_t *__return_ptr, void, uint64_t, uint64_t))(v7 + 184))(&v9, *(void *)v7, a2, a4);
  *(void *)a5 = v9;
  double result = v10;
  a5[1] = v10;
  *((void *)a5 + 2) = v11;
  a5[3] = 0.0;
  *((_DWORD *)a5 + 6) = a3;
  return result;
}

void *vmu_swift_reflection_infoForInstance@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)a3 = 0;
  *(void *)(a3 + _Block_object_dispose(&STACK[0x280], 8) = 0;
  *(_DWORD *)(a3 + 16) = 0;
  double result = (void *)swift_reflection_interop_libraryForObject(a1, a2);
  if (result)
  {
    double result = ((void *(*)(long long *__return_ptr, void, uint64_t))result[24])(&v6, *result, a2);
    *(_OWORD *)a3 = v6;
    *(_DWORD *)(a3 + 16) = v7;
  }
  else
  {
    *(_DWORD *)a3 = 0;
  }
  return result;
}

void *vmu_swift_reflection_childOfInstance@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  *(_OWORD *)a4 = 0u;
  *(_OWORD *)(a4 + 16) = 0u;
  double result = (void *)swift_reflection_interop_libraryForObject(a1, a2);
  if (result)
  {
    uint64_t v9 = result;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    double result = ((void *(*)(uint64_t *__return_ptr, void, uint64_t, uint64_t))result[25])(&v11, *result, a2, a3);
    *(void *)a4 = v11;
    int v10 = HIDWORD(v12);
    *(_DWORD *)(a4 + _Block_object_dispose(&STACK[0x280], 8) = v12;
    *(void *)(a4 + 16) = v13;
    *(_DWORD *)(a4 + 24) = 954437177 * (((unint64_t)v9 - *(void *)(a1 + 48)) >> 5);
  }
  else
  {
    int v10 = 0;
  }
  *(_DWORD *)(a4 + 12) = v10;
  return result;
}

uint64_t vmu_swift_reflection_interop_setClassIsSwiftMask(uint64_t result, uint64_t a2)
{
  int v2 = *(_DWORD *)(result + 56);
  if (v2 >= 1)
  {
    unint64_t v3 = *(void *)(result + 48);
    unint64_t v4 = v3 + 288 * v2;
    do
    {
      unint64_t v5 = *(void **)(v3 + 8);
      if (v5) {
        *unint64_t v5 = a2;
      }
      v3 += 288;
    }
    while (v3 < v4);
  }
  return result;
}

BOOL vmu_swift_reflection_projectEnumValue(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5)
{
  uint64_t v5 = *(void *)(a1 + 48);
  long long v6 = *(unsigned int (**)(void, uint64_t, uint64_t, uint64_t))(v5 + 288 * a4 + 232);
  return v6 && v6(*(void *)(v5 + 288 * a4), a2, a3, a5) != 0;
}

const char *vmu_swift_reflection_asyncTaskSlabPointer(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 56);
  if (v1 < 1) {
    return "Failed to find Remote Mirror function asyncTaskSlabPointer";
  }
  int v2 = *(void **)(a1 + 48);
  unint64_t v3 = &v2[36 * v1];
  double result = "Failed to find Remote Mirror function asyncTaskSlabPointer";
  while (1)
  {
    uint64_t v5 = (uint64_t (*)(void))v2[18];
    if (v5) {
      break;
    }
    v2 += 36;
    if (v2 >= v3) {
      return result;
    }
  }
  return (const char *)v5(*v2);
}

uint64_t vmu_reflection_interop_asyncTaskSlabAllocations@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  int v2 = *(_DWORD *)(result + 56);
  if (v2 < 1)
  {
LABEL_5:
    a2[2] = 0;
    a2[3] = 0;
    *a2 = "Failed to find Remote Mirror function asyncTaskSlabAllocations";
    a2[1] = 0;
  }
  else
  {
    unint64_t v3 = *(void **)(result + 48);
    unint64_t v4 = &v3[36 * v2];
    while (1)
    {
      uint64_t v5 = (uint64_t (*)(void))v3[19];
      if (v5) {
        return v5(*v3);
      }
      v3 += 36;
      if (v3 >= v4) {
        goto LABEL_5;
      }
    }
  }
  return result;
}

uint64_t vmu_swift_reflection_interop_ownsObject(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 56);
  if (v1 < 1) {
    return 0;
  }
  int v2 = *(void **)(a1 + 48);
  unint64_t v3 = &v2[36 * v1];
  while (1)
  {
    unint64_t v4 = (uint64_t (*)(void))v2[12];
    if (v4) {
      break;
    }
    v2 += 36;
    if (v2 >= v3) {
      return 0;
    }
  }
  return v4(*v2);
}

uint64_t vmu_swift_reflection_interop_typeRefForMangledTypeName(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(int *)(a1 + 56) < 1) {
    return 0;
  }
  unint64_t v6 = *(void *)(a1 + 48);
  unint64_t v7 = v6;
  while (1)
  {
    uint64_t result = (*(uint64_t (**)(void, uint64_t, uint64_t))(v7 + 128))(*(void *)v7, a2, a3);
    if (result) {
      break;
    }
    v7 += 288;
    v6 += 288;
    if (v7 >= *(void *)(a1 + 48) + 288 * *(int *)(a1 + 56)) {
      return 0;
    }
  }
  return result;
}

uint64_t swift_reflection_interop_getSizeAdapter()
{
  return 8;
}

uint64_t swift_reflection_interop_readBytesAdapter(void *a1, uint64_t a2, void *a3, size_t a4)
{
  uint64_t v10 = 0;
  uint64_t result = ((uint64_t (*)(void, uint64_t, size_t, uint64_t *))a1[3])(*a1, a2, a4, &v10);
  if (result)
  {
    uint64_t v8 = result;
    memcpy(a3, (const void *)result, a4);
    uint64_t v9 = (void (*)(void, uint64_t, uint64_t))a1[2];
    if (v9) {
      v9(*a1, v8, v10);
    }
    return 1;
  }
  return result;
}

uint64_t swift_reflection_interop_GetStringLengthAdapter(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))(*(void *)a1);
}

uint64_t swift_reflection_interop_GetSymbolAddressAdapter(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 40))(*(void *)a1);
}

uint64_t swift_reflection_interop_libraryForObject(uint64_t a1, uint64_t a2)
{
  int v2 = *(_DWORD *)(a1 + 56);
  if (v2 < 1) {
    return 0;
  }
  unint64_t v5 = *(void *)(a1 + 48);
  unint64_t v6 = v5;
  while (*(_DWORD *)(v6 + 280))
  {
LABEL_6:
    v6 += 288;
    unint64_t v8 = v5 + 288 * v2;
    if (v6 >= v8)
    {
      if (v2 >= 1)
      {
        while (!*(_DWORD *)(v5 + 280))
        {
          v5 += 288;
          if (v5 >= v8) {
            return 0;
          }
        }
        return v5;
      }
      return 0;
    }
  }
  unint64_t v7 = (const void *)(*(uint64_t (**)(void, uint64_t))(v6 + 112))(*(void *)v6, a2);
  if (!v7)
  {
    unint64_t v5 = *(void *)(a1 + 48);
    int v2 = *(_DWORD *)(a1 + 56);
    goto LABEL_6;
  }
  uint64_t v10 = v7;
  value = 0;
  if (CFDictionaryGetValueIfPresent(*(CFDictionaryRef *)(a1 + 80), v7, (const void **)&value)) {
    return *(void *)(a1 + 48) + 288 * (void)value;
  }
  int v11 = *(_DWORD *)(a1 + 56);
  if (v11 < 1) {
    return 0;
  }
  unint64_t v12 = *(void *)(a1 + 48);
  unint64_t v5 = v12;
  while (2)
  {
    if (!*(_DWORD *)(v5 + 280))
    {
      int v14 = (*(uint64_t (**)(void, const void *))(v5 + 104))(*(void *)v5, v10);
      unint64_t v12 = *(void *)(a1 + 48);
      if (v14) {
        goto LABEL_26;
      }
      int v11 = *(_DWORD *)(a1 + 56);
      goto LABEL_24;
    }
    uint64_t v13 = *(void **)(a1 + 72);
    if (!v13)
    {
LABEL_24:
      v5 += 288;
      if (v5 >= v12 + 288 * v11) {
        return 0;
      }
      continue;
    }
    break;
  }
  while (v13[1] > (unint64_t)v10 || v13[2] <= (unint64_t)v10)
  {
    uint64_t v13 = (void *)*v13;
    if (!v13) {
      goto LABEL_24;
    }
  }
LABEL_26:
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 80), v10, (const void *)(0x8E38E38E38E38E39 * ((uint64_t)(v5 - v12) >> 5)));
  return v5;
}

void sub_1A7D06300(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7D064D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7D067DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7D068E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7D069B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1A7D06A38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7D06E30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1A7D07058(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,unsigned int &,unsigned int &>(uint64_t a1, unsigned int *a2, _DWORD *a3, int *a4)
{
  unint64_t v8 = *a2;
  unint64_t v9 = *(void *)(a1 + 8);
  if (v9)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v9 <= v8) {
        unint64_t v4 = v8 % v9;
      }
    }
    else
    {
      unint64_t v4 = (v9 - 1) & v8;
    }
    int v11 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v11)
    {
      unint64_t v12 = *v11;
      if (*v11)
      {
        do
        {
          unint64_t v13 = v12[1];
          if (v13 == v8)
          {
            if (*((_DWORD *)v12 + 4) == v8) {
              return v12;
            }
          }
          else
          {
            if (v10.u32[0] > 1uLL)
            {
              if (v13 >= v9) {
                v13 %= v9;
              }
            }
            else
            {
              v13 &= v9 - 1;
            }
            if (v13 != v4) {
              break;
            }
          }
          unint64_t v12 = (void *)*v12;
        }
        while (v12);
      }
    }
  }
  unint64_t v12 = operator new(0x18uLL);
  void *v12 = 0;
  v12[1] = v8;
  int v14 = *a4;
  *((_DWORD *)v12 + 4) = *a3;
  *((_DWORD *)v12 + 5) = v14;
  float v15 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v16 = *(float *)(a1 + 32);
  if (!v9 || (float)(v16 * (float)v9) < v15)
  {
    BOOL v17 = 1;
    if (v9 >= 3) {
      BOOL v17 = (v9 & (v9 - 1)) != 0;
    }
    unint64_t v18 = v17 | (2 * v9);
    unint64_t v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19) {
      size_t v20 = v19;
    }
    else {
      size_t v20 = v18;
    }
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>(a1, v20);
    unint64_t v9 = *(void *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v9 <= v8) {
        unint64_t v4 = v8 % v9;
      }
      else {
        unint64_t v4 = v8;
      }
    }
    else
    {
      unint64_t v4 = (v9 - 1) & v8;
    }
  }
  uint64_t v21 = *(void *)a1;
  size_t v22 = *(void **)(*(void *)a1 + 8 * v4);
  if (v22)
  {
    void *v12 = *v22;
LABEL_38:
    void *v22 = v12;
    goto LABEL_39;
  }
  void *v12 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v12;
  *(void *)(v21 + 8 * v4) = a1 + 16;
  if (*v12)
  {
    unint64_t v23 = *(void *)(*v12 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v23 >= v9) {
        v23 %= v9;
      }
    }
    else
    {
      v23 &= v9 - 1;
    }
    size_t v22 = (void *)(*(void *)a1 + 8 * v23);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return v12;
}

void sub_1A7D07318(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *std::__hash_table<std::__hash_value_type<NSString * {__strong},unsigned int>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringHashFunctor,NSStringEqualsFunctor,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringEqualsFunctor,NSStringHashFunctor,true>,std::allocator<std::__hash_value_type<NSString * {__strong},unsigned int>>>::__emplace_unique_key_args<NSString * {__strong},NSString * {__strong}&,unsigned int &>(uint64_t a1, id *a2, id *a3, _DWORD *a4)
{
  unint64_t v9 = [*a2 hash];
  unint64_t v10 = v9;
  unint64_t v11 = *(void *)(a1 + 8);
  if (v11)
  {
    uint8x8_t v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    unint64_t v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      unint64_t v4 = v9;
      if (v9 >= v11) {
        unint64_t v4 = v9 % v11;
      }
    }
    else
    {
      unint64_t v4 = (v11 - 1) & v9;
    }
    int v14 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v14)
    {
      for (uint64_t i = *v14; i; uint64_t i = *(void **)i)
      {
        unint64_t v16 = *((void *)i + 1);
        if (v16 == v10)
        {
          if (NSStringEqualsFunctor::operator()(a1 + 32, *((void **)i + 2), *a2)) {
            return i;
          }
        }
        else
        {
          if (v13 > 1)
          {
            if (v16 >= v11) {
              v16 %= v11;
            }
          }
          else
          {
            v16 &= v11 - 1;
          }
          if (v16 != v4) {
            break;
          }
        }
      }
    }
  }
  BOOL v17 = (void *)(a1 + 16);
  uint64_t i = operator new(0x20uLL);
  *(void *)uint64_t i = 0;
  *((void *)i + 1) = v10;
  *((void *)i + 2) = *a3;
  *((_DWORD *)i + 6) = *a4;
  float v18 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v19 = *(float *)(a1 + 32);
  if (!v11 || (float)(v19 * (float)v11) < v18)
  {
    BOOL v20 = 1;
    if (v11 >= 3) {
      BOOL v20 = (v11 & (v11 - 1)) != 0;
    }
    unint64_t v21 = v20 | (2 * v11);
    unint64_t v22 = vcvtps_u32_f32(v18 / v19);
    if (v21 <= v22) {
      size_t v23 = v22;
    }
    else {
      size_t v23 = v21;
    }
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>(a1, v23);
    unint64_t v11 = *(void *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11) {
        unint64_t v4 = v10 % v11;
      }
      else {
        unint64_t v4 = v10;
      }
    }
    else
    {
      unint64_t v4 = (v11 - 1) & v10;
    }
  }
  uint64_t v24 = *(void *)a1;
  uint64_t v25 = *(void **)(*(void *)a1 + 8 * v4);
  if (v25)
  {
    *(void *)uint64_t i = *v25;
LABEL_38:
    *uint64_t v25 = i;
    goto LABEL_39;
  }
  *(void *)uint64_t i = *v17;
  *BOOL v17 = i;
  *(void *)(v24 + 8 * v4) = v17;
  if (*(void *)i)
  {
    unint64_t v26 = *(void *)(*(void *)i + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v26 >= v11) {
        v26 %= v11;
      }
    }
    else
    {
      v26 &= v11 - 1;
    }
    uint64_t v25 = (void *)(*(void *)a1 + 8 * v26);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return i;
}

void sub_1A7D07590(_Unwind_Exception *a1)
{
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<NSString * {__strong},unsigned int>,void *>>>::operator()[abi:ne180100](v2, v1);
  _Unwind_Resume(a1);
}

uint64_t NSStringEqualsFunctor::operator()(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (v4 == v5) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = [v4 isEqualToString:v5];
  }

  return v6;
}

void sub_1A7D07610(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<NSString * {__strong},unsigned int>,void *>>>::operator()[abi:ne180100](uint64_t a1, id *a2)
{
  if (*(unsigned char *)(a1 + 8))
  {
  }
  else if (!a2)
  {
    return;
  }

  operator delete(a2);
}

uint64_t **std::__hash_table<std::__hash_value_type<NSString * {__strong},unsigned int>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringHashFunctor,NSStringEqualsFunctor,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringEqualsFunctor,NSStringHashFunctor,true>,std::allocator<std::__hash_value_type<NSString * {__strong},unsigned int>>>::find<NSString * {__strong}>(void *a1, id *a2)
{
  unint64_t v4 = [*a2 hash];
  int8x8_t v5 = (int8x8_t)a1[1];
  if (!*(void *)&v5) {
    return 0;
  }
  unint64_t v6 = v4;
  uint8x8_t v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  unint64_t v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    unint64_t v9 = v4;
    if (v4 >= *(void *)&v5) {
      unint64_t v9 = v4 % *(void *)&v5;
    }
  }
  else
  {
    unint64_t v9 = (*(void *)&v5 - 1) & v4;
  }
  unint64_t v10 = *(uint64_t ****)(*a1 + 8 * v9);
  if (!v10) {
    return 0;
  }
  unint64_t v11 = *v10;
  if (*v10)
  {
    uint64_t v12 = (uint64_t)(a1 + 4);
    do
    {
      unint64_t v13 = (unint64_t)v11[1];
      if (v13 == v6)
      {
        if (NSStringEqualsFunctor::operator()(v12, v11[2], *a2)) {
          return v11;
        }
      }
      else
      {
        if (v8 > 1)
        {
          if (v13 >= *(void *)&v5) {
            v13 %= *(void *)&v5;
          }
        }
        else
        {
          v13 &= *(void *)&v5 - 1;
        }
        if (v13 != v9) {
          return 0;
        }
      }
      unint64_t v11 = (uint64_t **)*v11;
    }
    while (v11);
  }
  return v11;
}

uint64_t *std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::find<unsigned int>(void *a1, unsigned int *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0;
  }
  unint64_t v3 = *a2;
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    unint64_t v5 = *a2;
    if (*(void *)&v2 <= v3) {
      unint64_t v5 = v3 % *(void *)&v2;
    }
  }
  else
  {
    unint64_t v5 = (v2.i32[0] - 1) & v3;
  }
  unint64_t v6 = *(uint64_t ***)(*a1 + 8 * v5);
  if (!v6) {
    return 0;
  }
  for (uint64_t result = *v6; result; uint64_t result = (uint64_t *)*result)
  {
    unint64_t v8 = result[1];
    if (v8 == v3)
    {
      if (*((_DWORD *)result + 4) == v3) {
        return result;
      }
    }
    else
    {
      if (v4.u32[0] > 1uLL)
      {
        if (v8 >= *(void *)&v2) {
          v8 %= *(void *)&v2;
        }
      }
      else
      {
        v8 &= *(void *)&v2 - 1;
      }
      if (v8 != v5) {
        return 0;
      }
    }
  }
  return result;
}

void std::__throw_out_of_range[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E5D22C48, MEMORY[0x1E4FBA1D0]);
}

void sub_1A7D0787C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D8] + 16);
  return result;
}

uint64_t std::__hash_table<std::__hash_value_type<NSString * {__strong},unsigned int>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringHashFunctor,NSStringEqualsFunctor,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringEqualsFunctor,NSStringHashFunctor,true>,std::allocator<std::__hash_value_type<NSString * {__strong},unsigned int>>>::~__hash_table(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<NSString * {__strong},unsigned int>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringHashFunctor,NSStringEqualsFunctor,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringEqualsFunctor,NSStringHashFunctor,true>,std::allocator<std::__hash_value_type<NSString * {__strong},unsigned int>>>::__deallocate_node(a1, *(id **)(a1 + 16));
  int8x8_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<NSString * {__strong},unsigned int>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringHashFunctor,NSStringEqualsFunctor,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringEqualsFunctor,NSStringHashFunctor,true>,std::allocator<std::__hash_value_type<NSString * {__strong},unsigned int>>>::__deallocate_node(uint64_t a1, id *a2)
{
  if (a2)
  {
    int8x8_t v2 = a2;
    do
    {
      unint64_t v3 = (id *)*v2;

      operator delete(v2);
      int8x8_t v2 = v3;
    }
    while (v3);
  }
}

void sub_1A7D094E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

uint64_t _isSwiftRootClass(void *a1)
{
  id v1 = a1;
  int8x8_t v2 = [v1 superclassInfo];
  if (v2)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint8x8_t v4 = [v1 className];
    uint64_t v3 = [v4 containsString:@"Swift"];
  }
  return v3;
}

void _variantForCFBasicHash(void *a1)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  int8x8_t v2 = [v1 firstFieldWithName:@"_callbacks"];
  uint64_t v3 = v2;
  if (v2) {
    [v2 setScanType:0];
  }
  uint8x8_t v4 = [v1 firstFieldWithName:@"_bits"];
  if (v4)
  {
    unint64_t v5 = [v1 firstFieldWithName:@"_keys"];
    unint64_t v6 = v5;
    if (v5)
    {
      uint8x8_t v7 = [v5 ivarName];
      unint64_t v8 = _destinationLayoutStorageVariant(v1, 48, v7, 2, @"Key");

      v18[0] = v8;
      unint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
      [v1 replaceField:v6 withFields:v9];

      unint64_t v10 = [v6 ivarName];
      unint64_t v11 = _destinationLayoutStorageVariant(v1, 48, v10, 4, @"Key");

      [v1 addVariant:v11 forField:v8 withEvaluator:&__block_literal_global_683];
    }
    uint64_t v12 = [v1 firstFieldWithName:@"_values"];
    unint64_t v13 = v12;
    if (v12)
    {
      int v14 = [v12 ivarName];
      float v15 = _destinationLayoutStorageVariant(v1, 40, v14, 2, @"Value");

      BOOL v17 = v15;
      unint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
      [v1 replaceField:v13 withFields:v16];
    }
  }
}

VMUMutableFieldInfo *_destinationLayoutStorageVariant(void *a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v9 = a5;
  id v10 = a3;
  id v11 = a1;
  uint64_t v12 = [v11 displayName];
  if (a4 == 4) {
    unint64_t v13 = "Weak ";
  }
  else {
    unint64_t v13 = "";
  }
  uint64_t v14 = [v9 length];
  float v15 = " ";
  if (!v14) {
    float v15 = "";
  }
  unint64_t v16 = [v12 stringByAppendingFormat:@" (%s%@%sStorage)", v13, v9, v15];

  BOOL v17 = [v11 binaryPath];
  float v18 = +[VMUClassInfo classInfoWithClassName:v16 binaryPath:v17 type:16];

  [v18 setDefaultScanType:a4];
  float v19 = [VMUMutableFieldInfo alloc];
  uint64_t v20 = [v11 pointerSize];

  unint64_t v21 = [(VMUFieldInfo *)v19 initWithName:v10 type:@"^@" scan:2 offset:a2 size:v20];
  [(VMUFieldInfo *)v21 setDestinationLayout:v18];

  return v21;
}

void _variantForNSSlice(void *a1, void *a2, void *a3)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  if (+[VMUScanOverlay foundationHasNSSliceMemoryOptimization])
  {
    id v8 = v5;
    id v9 = v6;
    id v10 = v7;
    id v11 = [v8 firstFieldWithName:v9];
    uint64_t v12 = [v9 stringByAppendingString:@".items"];
    if (v11)
    {
      uint64_t v13 = [v11 offset];
      unint64_t v35 = _destinationLayoutStorageVariant(v8, v13, v12, 2, v10);
      id v42 = v5;
      id v38 = v7;
      uint64_t v14 = [VMUMutableFieldInfo alloc];
      [v9 stringByAppendingString:@".acquisitionProps"];
      float v15 = v40 = v6;
      unint64_t v16 = [(VMUFieldInfo *)v14 initWithName:v15 type:@"^{NSSliceExternalAcquisitionProperties}" scan:1 offset:(v13 + 8) size:8];

      BOOL v17 = [VMUMutableFieldInfo alloc];
      float v18 = [v9 stringByAppendingString:@".personalityProps"];
      unint64_t v37 = v12;
      float v19 = [(VMUFieldInfo *)v17 initWithName:v18 type:@"^{NSSliceExternalPersonalityProperties}" scan:1 offset:(v13 + 16) size:8];

      uint64_t v20 = [VMUMutableFieldInfo alloc];
      unint64_t v21 = [v9 stringByAppendingString:@".internalProps"];
      unint64_t v22 = [(VMUFieldInfo *)v20 initWithName:v21 type:@"^{NSSliceInternalProperties}" scan:1 offset:(v13 + 24) size:8];

      v50 = v35;
      id v51 = v16;
      uint64_t v52 = v19;
      uint64_t v53 = v22;
      size_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:4];
      [v8 replaceField:v11 withFields:v23];

      uint64_t v24 = _destinationLayoutStorageVariant(v8, v13, v37, 4, v10);
      uint64_t v44 = MEMORY[0x1E4F143A8];
      uint64_t v45 = 3221225472;
      long long v46 = ___variantForNSSlice_Version2_block_invoke;
      long long v47 = &__block_descriptor_36_e45_B32__0Q8__VMUTaskMemoryScanner_16____v__QQ_24l;
      int v48 = v13;
      [v8 addVariant:v24 forField:v35 withEvaluator:&v44];

      id v5 = v42;
      id v6 = v40;

      uint64_t v12 = v37;
      id v7 = v38;
    }
  }
  else
  {
    id v8 = v5;
    id v9 = v6;
    id v25 = v7;
    unint64_t v26 = [v8 firstFieldWithName:v9];
    uint64_t v27 = [v9 stringByAppendingString:@".items"];
    if (v26)
    {
      int v28 = [v8 pointerSize];
      id v39 = v7;
      uint64_t v29 = [v26 offset];
      unint64_t v36 = _destinationLayoutStorageVariant(v8, v29, v27, 2, v25);
      id v41 = v6;
      uint64_t v30 = [VMUMutableFieldInfo alloc];
      [v9 stringByAppendingString:@".fields"];
      uint64_t v31 = v43 = v5;
      uint64_t v32 = [[VMUFieldInfo alloc] initWithName:v31 type:@"{NSSliceFields}" scan:0 offset:[v26 offset] + v28 size:[v26 size] - v28];

      uint64_t v33 = _destinationLayoutStorageVariant(v8, v29, v27, 4, v25);
      v50 = v36;
      id v51 = v32;
      unint64_t v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:2];
      [v8 replaceField:v26 withFields:v34];

      uint64_t v44 = MEMORY[0x1E4F143A8];
      uint64_t v45 = 3221225472;
      long long v46 = ___variantForNSSlice_Version1_block_invoke;
      long long v47 = &__block_descriptor_40_e45_B32__0Q8__VMUTaskMemoryScanner_16____v__QQ_24l;
      int v48 = v29;
      id v7 = v39;
      int v49 = v28;
      [v8 addVariant:v33 forField:v36 withEvaluator:&v44];

      id v5 = v43;
      id v6 = v41;
    }
  }
}

void ___variantForSwiftClass_block_invoke(uint64_t a1, void *a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint8x8_t v4 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v6 = [WeakRetained pointerSize];

  if ([v3 offset] == v6)
  {
    id v7 = [VMUMutableFieldInfo alloc];
    id v8 = objc_loadWeakRetained((id *)(a1 + 40));
    id v9 = -[VMUFieldInfo initWithName:type:scan:offset:size:](v7, "initWithName:type:scan:offset:size:", @"_refcounts", @"^v", 5, v6, [v8 pointerSize]);

    id v10 = [*(id *)(a1 + 32) sideTableLayoutWithScannableOwnerPointer];
    [(VMUFieldInfo *)v9 setDestinationLayout:v10];

    id v11 = objc_loadWeakRetained(v4);
    v13[0] = v9;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    [v11 replaceField:v3 withFields:v12];
  }
}

void ___variantForSwiftClass_block_invoke_2(void **a1, void *a2, int a3)
{
  id v5 = a2;
  uint64_t v6 = [v5 offset] + a3;
  if ([v5 scanType] == 4)
  {
    id v7 = _createSwiftWeakExactVariant(v5, a1[4], 1);
    unint64_t v16 = _createSwiftWeakExactVariant(v5, a1[4], 2);
    id WeakRetained = objc_loadWeakRetained(a1 + 6);
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = ___variantForSwiftClass_block_invoke_3;
    v43[3] = &unk_1E5D23B10;
    objc_copyWeak(&v47, a1 + 6);
    id v44 = a1[4];
    id v45 = a1[5];
    objc_copyWeak(&v48, a1 + 7);
    id v9 = v5;
    id v46 = v9;
    int v49 = a3;
    [WeakRetained addVariantRecursively:v7 forField:v9 atOffset:v6 withEvaluator:v43];

    id v10 = objc_loadWeakRetained(a1 + 6);
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = ___variantForSwiftClass_block_invoke_4;
    v36[3] = &unk_1E5D23B10;
    objc_copyWeak(&v40, a1 + 6);
    id v37 = a1[4];
    id v38 = a1[5];
    objc_copyWeak(&v41, a1 + 7);
    id v39 = v9;
    int v42 = a3;
    [v10 addVariantRecursively:v16 forField:v39 atOffset:v6 withEvaluator:v36];

    objc_destroyWeak(&v41);
    objc_destroyWeak(&v40);

    objc_destroyWeak(&v48);
    objc_destroyWeak(&v47);
  }
  else if ([v5 scanType] == 3)
  {
    id v11 = _createSwiftExactUnownedVariant(v5, a1[4]);
    uint64_t v12 = a1 + 6;
    id v13 = objc_loadWeakRetained(a1 + 6);
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = ___variantForSwiftClass_block_invoke_5;
    v32[3] = &unk_1E5D23B38;
    objc_copyWeak(&v34, v12);
    id v33 = v5;
    int v35 = a3;
    [v13 addVariantRecursively:v11 forField:v33 atOffset:v6 withEvaluator:v32];

    objc_destroyWeak(&v34);
  }
  else if ([v5 kind] == 6)
  {
    id v14 = objc_loadWeakRetained(a1 + 6);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = ___variantForSwiftClass_block_invoke_6;
    v24[3] = &unk_1E5D23B60;
    objc_copyWeak(&v28, a1 + 6);
    id v25 = a1[4];
    id v26 = a1[5];
    objc_copyWeak(&v29, a1 + 7);
    id v15 = v5;
    id v27 = v15;
    int v30 = a3;
    int v31 = v6;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    void v17[2] = ___variantForSwiftClass_block_invoke_7;
    v17[3] = &unk_1E5D23B88;
    objc_copyWeak(&v21, a1 + 6);
    id v18 = a1[4];
    id v19 = a1[5];
    objc_copyWeak(&v22, a1 + 7);
    id v20 = v15;
    int v23 = a3;
    [v14 addComplexAction:v24 withEvaluator:v17];

    objc_destroyWeak(&v22);
    objc_destroyWeak(&v21);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&v28);
  }
}

void sub_1A7D0B6A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location)
{
  objc_destroyWeak(v12);
  objc_destroyWeak(v13);
  objc_destroyWeak(v14);
  objc_destroyWeak(location);
  _Unwind_Resume(a1);
}

id _createSwiftWeakExactVariant(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = (void *)[a1 mutableCopy];
  id v7 = v6;
  if (a3 == 2)
  {
    [v6 setScanType:5];
    uint64_t v8 = [v5 sideTableLayoutWithUnscannableOwnerPointer];
  }
  else
  {
    if (a3 != 1) {
      goto LABEL_6;
    }
    [v6 setScanType:5];
    uint64_t v8 = [v5 sideTableLayoutWithScannableOwnerPointer];
  }
  id v9 = (void *)v8;
  [v7 setDestinationLayout:v8];

LABEL_6:

  return v7;
}

BOOL ___variantForSwiftClass_block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6 = (id *)(a1 + 56);
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained(v6);
  unsigned int v9 = [WeakRetained pointerSize];
  id v10 = *(void **)(a1 + 32);
  id v11 = *(void **)(a1 + 40);
  id v12 = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v13 = _determineSwiftWeakExactVariant(v9, v10, v11, v12, *(void **)(a1 + 48), v7, *(_DWORD *)(a1 + 72), a2);

  return v13 == 1;
}

uint64_t _determineSwiftWeakExactVariant(unsigned int a1, void *a2, void *a3, void *a4, void *a5, void *a6, unsigned int a7, uint64_t a8)
{
  id v15 = a2;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  if (!v15 || ![v15 nativeWeakReferencePointerIsSideTable]) {
    goto LABEL_42;
  }
  if (!v16 || ([v16 nativeWeakReferencePointerIsSideTable] & 1) != 0) {
    goto LABEL_12;
  }
  id v20 = (uint64_t (*)(void *, uint64_t, uint64_t))v19[2];
  if (a1 == 8)
  {
    id v21 = (uint64_t *)v20(v19, a8, 8);
    if (v21)
    {
      uint64_t v22 = *v21;
      goto LABEL_11;
    }
  }
  else
  {
    int v23 = (unsigned int *)v20(v19, a8, 4);
    if (v23)
    {
      uint64_t v22 = *v23;
      goto LABEL_11;
    }
  }
  uint64_t v22 = 0;
LABEL_11:
  uint64_t v24 = [v17 classInfoForMemory:v22 length:a1 remoteAddress:a8];

  if (v24) {
    goto LABEL_42;
  }
LABEL_12:
  uint64_t v25 = a8 + a7 + [v18 offset];
  id v26 = (uint64_t (*)(void *, uint64_t, uint64_t))v19[2];
  if (a1 == 8)
  {
    id v27 = (uint64_t *)v26(v19, v25, 8);
    if (!v27) {
      goto LABEL_42;
    }
    uint64_t v28 = *v27;
    if (!*v27) {
      goto LABEL_42;
    }
  }
  else
  {
    id v29 = (_DWORD *)v26(v19, v25, 4);
    if (!v29) {
      goto LABEL_42;
    }
    uint64_t v28 = *v29;
    if (!*v29) {
      goto LABEL_42;
    }
  }
  int v30 = [v17 vmuTask];
  char v31 = [v30 isExclaveCore];

  if ((v31 & 1) == 0)
  {
    uint64_t v32 = [v15 nativeWeakReferenceMarkerMask] & v28;
    if (v32 == [v15 nativeWeakReferenceMarkerValue])
    {
      v28 &= [v15 nativeWeakReferencePointerMask];
      goto LABEL_23;
    }
LABEL_42:
    uint64_t v41 = 0;
    goto LABEL_43;
  }
LABEL_23:
  uint64_t v33 = ((uint64_t (*)(void *, uint64_t, uint64_t))v19[2])(v19, v28 + 16, 8);
  if (!v33 || (*(unsigned char *)(v33 + 4) & 1) == 0)
  {
    id v34 = (uint64_t (*)(void *, uint64_t, uint64_t))v19[2];
    if (a1 == 8)
    {
      int v35 = (void *)v34(v19, v28, 8);
      if (v35 && *v35)
      {
        unint64_t v36 = (uint64_t *)((uint64_t (*)(void *, uint64_t, uint64_t))v19[2])(v19, *v35 + 8, 8);
        if (v36)
        {
          uint64_t v37 = *v36;
LABEL_36:
          if (v37)
          {
            id v42 = v15;
            uint64_t v43 = [v42 refcountIsSideTableMarkerMask] & v37;
            if (v43 == [v42 refcountIsSideTableMarkerValue])
            {
              unint64_t v44 = [v42 sideTablePointerMask] & v37;
              unint64_t v45 = v44 >> [v42 sideTablePointerRightShift];
              unint64_t v46 = v45 << [v42 sideTablePointerLeftShift];
            }
            else
            {
              unint64_t v46 = 0;
            }

            if (v46 != v28) {
              goto LABEL_42;
            }
          }
          goto LABEL_41;
        }
        goto LABEL_35;
      }
    }
    else
    {
      id v38 = (unsigned int *)v34(v19, v28, 4);
      if (v38)
      {
        uint64_t v39 = *v38;
        if (v39)
        {
          id v40 = (unsigned int *)((uint64_t (*)(void *, uint64_t, uint64_t))v19[2])(v19, v39 + a1, 4);
          if (v40)
          {
            uint64_t v37 = *v40;
            goto LABEL_36;
          }
LABEL_35:
          uint64_t v37 = 0;
          goto LABEL_36;
        }
      }
    }
LABEL_41:
    uint64_t v41 = 1;
    goto LABEL_43;
  }
  uint64_t v41 = 2;
LABEL_43:

  return v41;
}

BOOL ___variantForSwiftClass_block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6 = (id *)(a1 + 56);
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained(v6);
  unsigned int v9 = [WeakRetained pointerSize];
  id v10 = *(void **)(a1 + 32);
  id v11 = *(void **)(a1 + 40);
  id v12 = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v13 = _determineSwiftWeakExactVariant(v9, v10, v11, v12, *(void **)(a1 + 48), v7, *(_DWORD *)(a1 + 72), a2);

  return v13 == 2;
}

id _createSwiftExactUnownedVariant(void *a1, void *a2)
{
  id v3 = a2;
  uint8x8_t v4 = (void *)[a1 mutableCopy];
  id v5 = [v3 unownedExtraDataLayout];

  [v4 setDestinationLayout:v5];

  return v4;
}

uint64_t ___variantForSwiftClass_block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = (id *)(a1 + 40);
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained(v5);
  uint64_t shouldApplySwiftExactUnownedVariant = _shouldApplySwiftExactUnownedVariant([WeakRetained pointerSize], *(void **)(a1 + 32), v6);

  return shouldApplySwiftExactUnownedVariant;
}

uint64_t _shouldApplySwiftExactUnownedVariant(int a1, void *a2, void *a3)
{
  id v5 = a3;
  [a2 offset];
  id v6 = v5;
  id v7 = (uint64_t (*)(void))v6[2];
  if (a1 != 8)
  {
    id v10 = (_DWORD *)v7();
    if (v10)
    {
      LODWORD(v9) = *v10;
      goto LABEL_7;
    }
LABEL_6:
    LOBYTE(v9) = 0;
    goto LABEL_7;
  }
  uint64_t v8 = (uint64_t *)v7();
  if (!v8) {
    goto LABEL_6;
  }
  uint64_t v9 = *v8;
LABEL_7:

  return v9 & 1;
}

void ___variantForSwiftClass_block_invoke_6(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v13 = a2;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v9 = *(void **)(a1 + 32);
  id v10 = *(void **)(a1 + 40);
  id v11 = objc_loadWeakRetained((id *)(a1 + 64));
  id v12 = _recursivelyCreateSwiftEnumPayloadVariant(WeakRetained, v9, v10, v11, *(void **)(a1 + 48), v7, *(_DWORD *)(a1 + 72), a3);

  if (v12) {
    [v13 replaceFieldRecursively:*(void *)(a1 + 48) atOffset:*(unsigned int *)(a1 + 76) withField:v12];
  }
}

id _recursivelyCreateSwiftEnumPayloadVariant(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, unsigned int a7, uint64_t a8)
{
  id v15 = a1;
  id v16 = a2;
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  unsigned int active = _determineActiveSwiftEnumPayloadCaseIndex(v18, v19, a7, a8);
  if ((active & 0x80000000) != 0)
  {
    uint64_t v28 = 0;
  }
  else
  {
    unsigned int v22 = active;
    uint64_t v33 = v15;
    int v23 = [v19 possibleEnumPayloadFieldArray];
    int v24 = [v23 count];

    if ((int)v22 >= v24)
    {
      uint64_t v28 = 0;
    }
    else
    {
      uint64_t v25 = [v19 possibleEnumPayloadFieldArray];
      id v26 = [v25 objectAtIndexedSubscript:v22];

      uint64_t v27 = swiftEnumDummyNoPayloadSubField;
      uint64_t v28 = (void *)[v19 mutableCopy];
      [v28 setScanType:0];
      if (v26 != (void *)v27)
      {
        uint64_t v29 = _recursivelyCreateSwiftVariant(v33, v16, v17, v18, v26, v20, [v19 offset] + a7, a8);
        int v30 = (void *)v29;
        if (v29) {
          char v31 = (void *)v29;
        }
        else {
          char v31 = v26;
        }
        [v28 addSubField:v31];
      }
    }
    id v15 = v33;
  }

  return v28;
}

uint64_t ___variantForSwiftClass_block_invoke_7(uint64_t a1, const void *a2, void *a3, uint64_t *a4)
{
  id v7 = a3;
  uint64_t v14 = [@"seed" hash];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v9 = *(void **)(a1 + 32);
  id v10 = *(void **)(a1 + 40);
  id v11 = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v12 = _recursivelyDetermineSwiftEnumPayloadVariantHash(WeakRetained, v9, v10, v11, *(void **)(a1 + 48), v7, *(_DWORD *)(a1 + 72), a2, &v14, 0);

  *a4 = v14;
  return v12;
}

uint64_t _recursivelyDetermineSwiftEnumPayloadVariantHash(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, unsigned int a7, const void *a8, void *a9, int a10)
{
  id v17 = a1;
  id v49 = a2;
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v48 = a8;
  unsigned int active = _determineActiveSwiftEnumPayloadCaseIndex(v19, v20, a7, (uint64_t)a8);
  if ((active & 0x80000000) != 0
    || (unsigned int v23 = active,
        [v20 possibleEnumPayloadFieldArray],
        int v24 = objc_claimAutoreleasedReturnValue(),
        int v25 = [v24 count],
        v24,
        (int)v23 >= v25))
  {
    if (debugSwiftSubfieldIsEnabled())
    {
      id v30 = [v20 ivarName];
      id v47 = (const char *)[v30 UTF8String];
      uint64_t v31 = *(void *)[v19 swiftMirror];
      uint64_t v32 = (uint64_t *)[v20 swiftTyperef];
      vmu_swift_reflection_interop_copyDemangledNameForTypeRef(v31, *v32, v32[1]);
      id v33 = objc_claimAutoreleasedReturnValue();
      id v34 = (const char *)[v33 UTF8String];
      id v35 = [v17 className];
      _debugSwiftAsyncPrintf(a10, "Failed to project enum case for field %s (type %s), of object at %p of class %s. Falling back to conservative scanning.\n", v47, v34, v48, (const char *)[v35 UTF8String]);

      if (!a10) {
        fputc(10, (FILE *)*MEMORY[0x1E4F143C8]);
      }
    }
    VMUClassInfoComplexVariantEvaluatorCombineHashes(a9, [@"No-Change" hash]);
    uint64_t v36 = 0;
  }
  else
  {
    id v26 = [v20 possibleEnumPayloadFieldArray];
    uint64_t v27 = [v26 objectAtIndexedSubscript:v23];

    uint64_t v28 = swiftEnumDummyNoPayloadSubField;
    int IsEnabled = debugSwiftSubfieldIsEnabled();
    if (v27 == (void *)v28)
    {
      if (IsEnabled)
      {
        id v37 = [v20 ivarName];
        id v38 = (const char *)[v37 UTF8String];
        id v39 = [v17 className];
        _debugSwiftAsyncPrintf(a10, "Detected no-payload of field %s, of object at %p of class %s. Treating as a non-payload case and not scanning the subfield.\n", v38, a8, (const char *)[v39 UTF8String]);

        if (!a10) {
          fputc(10, (FILE *)*MEMORY[0x1E4F143C8]);
        }
      }
      VMUClassInfoComplexVariantEvaluatorCombineHashes(a9, [@"Payload-Empty" hash]);
    }
    else
    {
      if (IsEnabled)
      {
        id v46 = [v27 ivarName];
        unint64_t v45 = (const char *)[v46 UTF8String];
        unint64_t v44 = VMUScanTypeScanDescription([v27 scanType]);
        id v43 = [v20 ivarName];
        id v42 = (const char *)[v43 UTF8String];
        id v41 = [v17 className];
        _debugSwiftAsyncPrintf(a10, "enum payload  %s  scanType %s (may be changed), of field %s, of object at %p of class %s  size %u stride %u\n", v45, v44, v42, a8, (const char *)[v41 UTF8String], [v27 size], [v27 stride]);

        if (!a10) {
          fputc(10, (FILE *)*MEMORY[0x1E4F143C8]);
        }
      }
      VMUClassInfoComplexVariantEvaluatorCombineHashes(a9, [@"Payload-" hash] + v23);
      _recursivelyDetermineComplexSwiftVariantHash(v17, v49, v18, v19, v27, v21, [v20 offset] + a7, (uint64_t)a8, a9, a10 + 1);
    }

    uint64_t v36 = 1;
  }

  return v36;
}

uint64_t _determineActiveSwiftEnumPayloadCaseIndex(void *a1, void *a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5 = a4 + a3;
  id v6 = a2;
  id v7 = a1;
  uint64_t v8 = v5 + [v6 offset];
  uint64_t v9 = (uint64_t *)[v6 swiftTyperef];

  uint64_t v10 = *v9;
  uint64_t v11 = v9[1];
  uint64_t v12 = (uint64_t *)[v7 swiftMirror];

  uint64_t v13 = *v12;
  unsigned int v15 = 0x80000000;
  if (vmu_swift_reflection_projectEnumValue(v13, v8, v10, v11, (uint64_t)&v15)) {
    return v15;
  }
  else {
    return 0x80000000;
  }
}

id _recursivelyCreateSwiftVariant(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, uint64_t a8)
{
  id v15 = a1;
  id v16 = a2;
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v43 = v15;
  unsigned int v21 = [v15 pointerSize];
  id v42 = v18;
  if ([v19 scanType] == 4)
  {
    uint64_t v22 = a8;
    unsigned int v23 = v17;
    uint64_t v24 = _determineSwiftWeakExactVariant(v21, v16, v17, v18, v19, v20, a7, v22);
    if (v24)
    {
      uint64_t v25 = _createSwiftWeakExactVariant(v19, v16, v24);
LABEL_8:
      uint64_t v27 = (void *)v25;
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  if ([v19 scanType] == 3)
  {
    uint64_t v26 = a8;
    unsigned int v23 = v17;
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = ___recursivelyCreateSwiftVariant_block_invoke_2;
    v47[3] = &unk_1E5D23BD8;
    unsigned int v51 = v21;
    id v48 = v19;
    int v52 = a7;
    id v49 = v20;
    uint64_t v50 = v26;
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = ___recursivelyCreateSwiftVariant_block_invoke_3;
    v44[3] = &unk_1E5D23C00;
    id v45 = v48;
    id v46 = v16;
    uint64_t v27 = ___recursivelyCreateSwiftVariant_block_invoke((uint64_t)v46, (uint64_t)v47, v44);

    goto LABEL_20;
  }
  if ([v19 kind] == 6)
  {
    uint64_t v28 = a8;
    unsigned int v23 = v17;
    uint64_t v25 = _recursivelyCreateSwiftEnumPayloadVariant(v15, v16, v17, v18, v19, v20, a7, v28, v18);
    goto LABEL_8;
  }
  uint64_t v29 = [v19 subFieldArray];
  uint64_t v30 = [v29 count];

  if (!v30)
  {
    unsigned int v23 = v17;
LABEL_19:
    uint64_t v27 = 0;
    goto LABEL_20;
  }
  int v31 = [v19 offset];
  uint64_t v32 = [v19 subFieldArray];
  uint64_t v27 = (void *)[v32 count];

  if (v27)
  {
    uint64_t v33 = a8;
    unsigned int v23 = v17;
    unint64_t v34 = 0;
    uint64_t v27 = 0;
    uint64_t v35 = (v31 + a7);
    do
    {
      uint64_t v36 = [v19 subFieldArray];
      id v37 = [v36 objectAtIndexedSubscript:v34];

      id v38 = _recursivelyCreateSwiftVariant(v43, v16, v23, v42, v37, v20, v35, v33);
      if (v38)
      {
        if (!v27) {
          uint64_t v27 = (void *)[v19 mutableCopy];
        }
        [v27 replaceFieldRecursively:v37 atOffset:[v37 offset] withField:v38];
      }

      ++v34;
      id v39 = [v19 subFieldArray];
      unint64_t v40 = [v39 count];
    }
    while (v34 < v40);
  }
  else
  {
    unsigned int v23 = v17;
  }
LABEL_20:

  return v27;
}

id ___recursivelyCreateSwiftVariant_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint8x8_t v4 = a3;
  if ((*(unsigned int (**)(uint64_t))(a2 + 16))(a2))
  {
    uint64_t v5 = v4[2](v4);
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

uint64_t ___recursivelyCreateSwiftVariant_block_invoke_2(uint64_t a1)
{
  return _shouldApplySwiftExactUnownedVariant(*(_DWORD *)(a1 + 56), *(void **)(a1 + 32), *(void **)(a1 + 40));
}

id ___recursivelyCreateSwiftVariant_block_invoke_3(uint64_t a1)
{
  return _createSwiftExactUnownedVariant(*(void **)(a1 + 32), *(void **)(a1 + 40));
}

void _recursivelyDetermineComplexSwiftVariantHash(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, uint64_t a8, void *a9, int a10)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v17 = a1;
  id v18 = a2;
  id v19 = a3;
  id v20 = a4;
  id v21 = a5;
  id v22 = a6;
  if ([v21 scanType] == 4)
  {
    uint64_t v23 = _determineSwiftWeakExactVariant([v17 pointerSize], v18, v19, v20, v21, v22, a7, a8);
    if (v23 == 2)
    {
      uint64_t v24 = @"Weak-With-Unscannable-Owner-Pointer-Applied";
      goto LABEL_14;
    }
    if (v23 == 1)
    {
      uint64_t v24 = @"Weak-With-Scannable-Owner-Pointer-Applied";
      goto LABEL_14;
    }
    if (v23) {
      goto LABEL_15;
    }
    goto LABEL_11;
  }
  if ([v21 scanType] == 3)
  {
    if (_shouldApplySwiftExactUnownedVariant([v17 pointerSize], v21, v22))
    {
      uint64_t v24 = @"Unowned-Applied";
LABEL_14:
      VMUClassInfoComplexVariantEvaluatorCombineHashes(a9, [(__CFString *)v24 hash]);
      goto LABEL_15;
    }
LABEL_11:
    uint64_t v24 = @"No-Change";
    goto LABEL_14;
  }
  if ([v21 kind] == 6)
  {
    _recursivelyDetermineSwiftEnumPayloadVariantHash(v17, v18, v19, v20, v21, v22, a7, a8, a9, a10);
  }
  else
  {
    uint64_t v25 = [v21 subFieldArray];
    uint64_t v26 = [v25 count];

    if (v26)
    {
      id v37 = v22;
      id v27 = v20;
      id v28 = v19;
      id v29 = v17;
      int v30 = [v21 offset];
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id obj = [v21 subFieldArray];
      uint64_t v31 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (v31)
      {
        uint64_t v32 = v31;
        uint64_t v33 = (v30 + a7);
        uint64_t v34 = *(void *)v39;
        do
        {
          for (uint64_t i = 0; i != v32; ++i)
          {
            if (*(void *)v39 != v34) {
              objc_enumerationMutation(obj);
            }
            _recursivelyDetermineComplexSwiftVariantHash(v29, v18, v28, v27, *(void *)(*((void *)&v38 + 1) + 8 * i), v37, v33, a8, a9, a10 + 1);
          }
          uint64_t v32 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
        }
        while (v32);
      }

      id v17 = v29;
      id v19 = v28;
      id v20 = v27;
      id v22 = v37;
    }
  }
LABEL_15:
}

uint64_t ___variantForCFBasicHash_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a4 + 16))(a4, a2, 48);
  if (result) {
    return (*(void *)(result + 24) & 0x3FF003FF000000 | *(void *)(result + 32) & 0x3FF003FF0) == 0;
  }
  return result;
}

void sub_1A7D0D588(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7D0D6E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7D0E3C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t zoneEnumeratorBlockAdapter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a2 + 16))(a2, a3, a4, a5);
}

void sub_1A7D0ED54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL memoryExists(vm_map_read_t target_task, mach_vm_address_t a2, mach_vm_size_t a3)
{
  if (!a3) {
    return 0;
  }
  mach_vm_size_t v3 = a3;
  long long v6 = 0uLL;
  do
  {
    natural_t nesting_depth = 0;
    long long v14 = v6;
    long long v15 = v6;
    *(_OWORD *)info = v6;
    mach_vm_size_t size = 0;
    mach_vm_address_t address = a2;
    mach_msg_type_number_t infoCnt = 12;
    while (1)
    {
      if (mach_vm_region_recurse(target_task, &address, &size, &nesting_depth, info, &infoCnt)
        || !info[0]
        || address > a2)
      {
        return 0;
      }
      if (!v15) {
        break;
      }
      ++nesting_depth;
      mach_vm_address_t address = a2;
    }
    if (size + address <= a2) {
      return 0;
    }
    mach_vm_size_t v7 = size + address - a2;
    BOOL v8 = v3 > v7;
    v3 -= v7;
    BOOL result = !v8;
    long long v6 = 0uLL;
  }
  while (v8);
  return result;
}

uint64_t task_peek_natural_size(vm_map_read_t a1, mach_vm_address_t a2, mach_vm_size_t a3, mach_vm_address_t *a4)
{
  return task_peek_to_end_of_region(a1, a2, a3, a4, 0);
}

uint64_t *task_try_peek(uint64_t a1, tree *a2, void *a3)
{
  uint64_t v5 = (const char *)task_lookup_mapped_memory_cache();
  if (v5)
  {
    BOOL result = (uint64_t *)find_node(v5, a2);
    if (result || (BOOL result = (uint64_t *)map_new_node()) != 0)
    {
      uint64_t v7 = result[1];
      uint64_t v8 = *result;
      *a3 = (char *)a2 + result[2] - *result;
      return (uint64_t *)(v8 - (void)a2 + v7);
    }
  }
  else
  {
    NSLog(&cfstr_ErrorCallingTa.isa);
    return 0;
  }
  return result;
}

uint64_t task_read_ptr_at(vm_map_read_t a1, mach_vm_address_t a2, void *a3)
{
  long long v6 = 0;
  uint64_t result = task_peek_to_end_of_region(a1, a2, 8uLL, (mach_vm_address_t *)&v6, 0);
  uint64_t v5 = 0;
  if (!result && v6) {
    uint64_t v5 = *v6;
  }
  *a3 = v5;
  return result;
}

uint64_t task_read_unsigned_at(vm_map_read_t a1, mach_vm_address_t a2, _DWORD *a3)
{
  long long v6 = 0;
  uint64_t result = task_peek_to_end_of_region(a1, a2, 4uLL, (mach_vm_address_t *)&v6, 0);
  int v5 = 0;
  if (!result && v6) {
    int v5 = *v6;
  }
  *a3 = v5;
  return result;
}

mach_vm_address_t task_peek_string(task_name_t a1, mach_vm_address_t a2)
{
  IsSelf_portOfCachedResult = (task_name_t *)VMUTaskIsSelf_portOfCachedResult();
  if (*IsSelf_portOfCachedResult == a1)
  {
    if (*(unsigned char *)VMUTaskIsSelf_cachedResult()) {
      return a2;
    }
  }
  else
  {
    task_name_t *IsSelf_portOfCachedResult = a1;
    mach_task_is_self(a1);
    IsSelf_cachedResult = (unsigned char *)VMUTaskIsSelf_cachedResult();
    unsigned char *IsSelf_cachedResult = v7;
    if (v7) {
      return a2;
    }
  }
  mach_vm_address_t v18 = 0;
  unint64_t v19 = 1;
  int v8 = task_peek_to_end_of_region(a1, a2, 1uLL, &v18, &v19);
  mach_vm_address_t result = 0;
  if (!v8)
  {
    mach_vm_address_t v9 = v18;
    if (v18)
    {
      unint64_t v10 = 0;
      uint64_t v11 = MEMORY[0x1E4F14390];
      uint64_t v12 = (void *)MEMORY[0x1E4F14B00];
      while (1)
      {
        while (v10 >= v19)
        {
          mach_vm_size_t v15 = *v12 + v19;
          unint64_t v19 = v15;
          if (v15 <= 0x19000)
          {
            mach_vm_address_t v18 = 0;
            int v16 = task_peek_to_end_of_region(a1, a2, v15, &v18, &v19);
            mach_vm_address_t v9 = v18;
            if (!v16 && v18 != 0) {
              continue;
            }
          }
          return 0;
        }
        unsigned int v13 = *(char *)(v9 + v10);
        if (!*(unsigned char *)(v9 + v10)) {
          return v9;
        }
        if ((v13 & 0x80000000) != 0)
        {
          if (__maskrune(*(char *)(v9 + v10), 0x40000uLL)) {
            goto LABEL_21;
          }
        }
        else if ((*(_DWORD *)(v11 + 4 * v13 + 60) & 0x40000) != 0)
        {
          goto LABEL_21;
        }
        BOOL v14 = v13 > 0xD || ((1 << v13) & 0x2600) == 0;
        if (v14 && v13 - 169 >= 2) {
          return 0;
        }
LABEL_21:
        ++v10;
      }
    }
  }
  return result;
}

BOOL objectIsDeallocatingOrDeallocated(BOOL result)
{
  if (result) {
    return (*(unsigned char *)(result + 10) & 0xE0) != 0;
  }
  return result;
}

BOOL stringHasInlineContents(BOOL result)
{
  if (result)
  {
    char v1 = atomic_load((unint64_t *)(result + 8));
    return (v1 & 0x60) == 0;
  }
  return result;
}

__CFString *stringFromMappedNSCFString(void *a1, uint64_t a2, unint64_t a3, uint64_t a4, void *a5, int *a6)
{
  id v11 = a1;
  uint64_t v56 = a2;
  id v12 = a5;
  if (a6) {
    *a6 = 0;
  }
  if (!a2 || a3 - 1 < 0xF) {
    goto LABEL_5;
  }
  char v15 = atomic_load((unint64_t *)(a2 + 8));
  unsigned int v16 = atomic_load((unint64_t *)(a2 + 8));
  char v17 = atomic_load((unint64_t *)(a2 + 8));
  uint64_t v18 = v56;
  if (v56)
  {
    char v19 = atomic_load((unint64_t *)(v56 + 8));
    BOOL v20 = (v19 & 0x60) == 0;
    uint64_t v18 = v56;
  }
  else
  {
    BOOL v20 = 0;
  }
  char v21 = v15 | ((v17 & 4) == 0);
  unint64_t v22 = atomic_load((unint64_t *)(v18 + 8));
  if (!v20 && !(v15 & 1 | ((v17 & 4) == 0)))
  {
    unsigned int v13 = 0;
    uint64_t v55 = 0;
    goto LABEL_6;
  }
  unint64_t v23 = 32;
  if (v20) {
    unint64_t v23 = 24;
  }
  if (v23 > a3) {
    goto LABEL_5;
  }
  unint64_t v53 = v22;
  char v54 = v15;
  unint64_t Length2 = _CFStringGetLength2();
  if (Length2 > 0x3B9ACA00) {
    goto LABEL_5;
  }
  int v25 = (v16 >> 4) & 1;
  if (!Length2)
  {
    if (a6)
    {
      int v32 = (v54 & 1) != 0 ? 11 : 3;
      *a6 = v32;
      if (v25) {
        *a6 = v32 | 0x10;
      }
    }
    unsigned int v13 = &stru_1EFE27F38;
    goto LABEL_6;
  }
  uint64_t v55 = 0;
  unint64_t v52 = Length2;
  if (v20)
  {
    if (!remoteAddressIsOKtoRead(a4, v12)) {
      goto LABEL_5;
    }
    int64_t v26 = v52;
    if (a3)
    {
      unint64_t v27 = (v52 << v25) + 16;
      if (v27 > a3)
      {
        id v28 = [v11 memoryCache];
        int v29 = [v28 peekAtAddress:a4 size:v27 returnsBuf:&v56];

        unsigned int v13 = 0;
        if (v29) {
          goto LABEL_6;
        }
        int64_t v26 = v52;
        if (!v56) {
          goto LABEL_6;
        }
      }
    }
    uint64_t v30 = 8;
    if ((v21 & 1) == 0) {
      uint64_t v30 = 0;
    }
    uint64_t v31 = (_WORD *)(v56 + v30 + 16);
    uint64_t v55 = v31;
  }
  else
  {
    if (v25 && (v17 & 4) != 0) {
      goto LABEL_5;
    }
    uint64_t v33 = *(void *)(v56 + 16);
    if (!remoteAddressIsOKtoRead(v33, v12)) {
      goto LABEL_5;
    }
    if (v25) {
      uint64_t v34 = 2 * v52;
    }
    else {
      uint64_t v34 = v52 + ((unint64_t)(v17 & 4) >> 2);
    }
    uint64_t v35 = [v11 memoryCache];
    int v36 = [v35 peekAtAddress:v33 size:v34 returnsBuf:&v55];

    unsigned int v13 = 0;
    if (v36) {
      goto LABEL_6;
    }
    uint64_t v31 = v55;
    int64_t v26 = v52;
    if (!v55) {
      goto LABEL_6;
    }
  }
  if (v25)
  {
    char v45 = v54;
    if (!*v31) {
      goto LABEL_5;
    }
    uint64_t v46 = 1;
    do
    {
      uint64_t v47 = v46;
      if (v26 == v46) {
        break;
      }
      ++v46;
    }
    while (v31[v47]);
    if (v47 < v26) {
      goto LABEL_5;
    }
    int64_t v48 = v26;
    id v49 = [NSString alloc];
    unsigned int v13 = (__CFString *)[v49 initWithCharactersNoCopy:v55 length:v48 freeWhenDone:0];
LABEL_71:
    if (a6 && v13)
    {
      if (v20) {
        int v50 = 3;
      }
      else {
        int v50 = 35;
      }
      if (!HIDWORD(v53)) {
        v50 |= 0x40u;
      }
      if (v45) {
        v50 |= 8u;
      }
      *a6 = v50;
      if (v25) {
        *a6 = v50 | 0x10;
      }
    }
    goto LABEL_6;
  }
  if ((v17 & 4) != 0)
  {
    uint64_t v31 = (_WORD *)((char *)v31 + 1);
    uint64_t v55 = v31;
  }
  uint64_t v37 = 0;
  uint64_t v38 = MEMORY[0x1E4F14390];
  char v51 = 1;
  while (1)
  {
    unsigned int v39 = *((unsigned __int8 *)v31 + v37);
    uint64_t v40 = *((unsigned __int8 *)v31 + v37);
    if (*((char *)v31 + v37) < 0) {
      break;
    }
    if ((*(_DWORD *)(v38 + 4 * v40 + 60) & 0x40000) == 0) {
      goto LABEL_52;
    }
LABEL_62:
    if (v26 == ++v37) {
      goto LABEL_63;
    }
  }
  int v41 = __maskrune(*((unsigned __int8 *)v31 + v37), 0x40000uLL);
  int64_t v26 = v52;
  if (v41) {
    goto LABEL_62;
  }
LABEL_52:
  BOOL v42 = v39 > 0xD || ((1 << v39) & 0x2600) == 0;
  if (v42 && v39 - 169 >= 2) {
    char v51 = 0;
  }
  if (v40 <= 0xD && ((1 << v40) & 0x2600) != 0 || (v40 - 169) < 2) {
    goto LABEL_62;
  }
LABEL_63:
  if (v51)
  {
    int64_t v43 = v26;
    id v44 = [NSString alloc];
    unsigned int v13 = (__CFString *)[v44 initWithBytes:v55 length:v43 encoding:4];
    char v45 = v54;
    int v25 = 0;
    goto LABEL_71;
  }
LABEL_5:
  unsigned int v13 = 0;
LABEL_6:

  return v13;
}

BOOL remoteAddressIsOKtoRead(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint8x8_t v4 = v3;
  BOOL v5 = !v3 || [v3 containsLocation:a1];

  return v5;
}

unsigned __int8 *stringFromBytes(unsigned __int8 *a1, unint64_t a2, int *a3)
{
  if (a1)
  {
    BOOL v5 = a1;
    a1 = 0;
    if (a2)
    {
      unint64_t v6 = *v5;
      unsigned int v7 = (char)v6;
      if ((_BYTE)v6)
      {
        uint64_t v9 = MEMORY[0x1E4F14390];
        if ((char)v6 < 0) {
          int v10 = __maskrune((char)v6, 0x40000uLL);
        }
        else {
          int v10 = *(_DWORD *)(MEMORY[0x1E4F14390] + 4 * (char)v6 + 60) & 0x40000;
        }
        int v11 = 1;
        if (!v10 && (v6 > 0xD || ((1 << v6) & 0x2600) == 0) && (v6 - 169) >= 2) {
          int v11 = 0;
        }
        if (a2 >= 2)
        {
          unint64_t v12 = 1;
          while (1)
          {
            unsigned int v7 = (char)v5[v12];
            if (!v5[v12]) {
              goto LABEL_28;
            }
            if ((v7 & 0x80000000) != 0)
            {
              if (__maskrune((char)v5[v12], 0x40000uLL)) {
                goto LABEL_25;
              }
            }
            else if ((*(_DWORD *)(v9 + 4 * v7 + 60) & 0x40000) != 0)
            {
              goto LABEL_25;
            }
            BOOL v13 = v7 > 0xD || ((1 << v7) & 0x2600) == 0;
            if (v13 && v7 - 169 >= 2)
            {
              if (v12 == 1) {
                char v25 = v11;
              }
              else {
                char v25 = 1;
              }
              if (v25) {
                goto LABEL_33;
              }
              goto LABEL_66;
            }
LABEL_25:
            if (a2 == ++v12)
            {
              unint64_t v12 = a2;
              goto LABEL_33;
            }
          }
        }
        unint64_t v12 = 1;
LABEL_28:
        unint64_t v14 = v12 - 1;
        if (v12 == 1) {
          char v15 = v11;
        }
        else {
          char v15 = 1;
        }
        if (v15)
        {
          if (v7)
          {
LABEL_33:
            if (a2 > 0x100 || v12 < v6)
            {
              int v17 = 0;
              int v16 = 0;
              if ((v11 & (v12 > 3)) != 0) {
                unint64_t v6 = v12;
              }
              else {
                unint64_t v6 = 0;
              }
            }
            else
            {
              int v16 = 0;
              int v17 = 1;
            }
          }
          else
          {
            if (a2 <= 0x100 && v14 >= v6) {
              int v19 = v11;
            }
            else {
              int v19 = 1;
            }
            if (v11) {
              unint64_t v20 = v12;
            }
            else {
              unint64_t v20 = 0;
            }
            BOOL v21 = v19 == 1;
            BOOL v22 = v19 != 1;
            if (v21) {
              int v23 = v11;
            }
            else {
              int v23 = 0;
            }
            if (!v21) {
              unint64_t v20 = v6;
            }
            BOOL v24 = v14 == v6;
            int v17 = v14 == v6 || v22;
            if (v14 == v6) {
              int v16 = 1;
            }
            else {
              int v16 = v23;
            }
            if (!v24) {
              unint64_t v6 = v20;
            }
          }
        }
        else
        {
LABEL_66:
          int v17 = 0;
          int v16 = 0;
          unint64_t v6 = 0;
        }
        if (a2 < 0x11 || v6 >= 4)
        {
          a1 = 0;
          if ((v17 | v16) == 1 && v6)
          {
            if (v17) {
              ++v5;
            }
            a1 = (unsigned __int8 *)[[NSString alloc] initWithBytesNoCopy:v5 length:v6 encoding:4 freeWhenDone:0];
            if (a3)
            {
              if (v17) {
                int v27 = 2;
              }
              else {
                int v27 = 1;
              }
              *a3 = v27;
            }
          }
        }
        else
        {
          a1 = 0;
        }
      }
    }
    uint64_t v3 = vars8;
  }
  return a1;
}

id shortenString(void *a1)
{
  id v1 = a1;
  if (!v1)
  {
    char v15 = 0;
    goto LABEL_43;
  }
  int8x8_t v2 = v1;
  if (shortenString_onceToken != -1) {
    dispatch_once(&shortenString_onceToken, &__block_literal_global_6);
  }
  if ([v2 containsString:@"binary plist:  {"])
  {
    id v3 = v2;
    if (!flattenPlistString_newlineCharacterSet)
    {
      uint64_t v4 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
      BOOL v5 = (void *)flattenPlistString_newlineCharacterSet;
      flattenPlistString_newlineCharacterSet = v4;

      unint64_t v6 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
      uint64_t v7 = [v6 invertedSet];
      int v8 = (void *)flattenPlistString_nonwhitespaceCharacterSet;
      flattenPlistString_nonwhitespaceCharacterSet = v7;
    }
    unint64_t v9 = [v3 length];
    unint64_t v10 = [v3 rangeOfCharacterFromSet:flattenPlistString_newlineCharacterSet options:0 range:v9];
    unint64_t v11 = 96;
    if (v9 < 0x60) {
      unint64_t v11 = v9;
    }
    if (v10 == 0x7FFFFFFFFFFFFFFFLL || (unint64_t v12 = v10, v10 > v11))
    {
      char v15 = v3;
    }
    else
    {
      do
      {
        uint64_t v13 = [v3 rangeOfCharacterFromSet:flattenPlistString_nonwhitespaceCharacterSet options:0 range:v12 v9 - v12];
        unint64_t v14 = v13 - v12;
        char v15 = [v3 stringByReplacingCharactersInRange:v12 withString:@" "];

        unint64_t v9 = v9 - v14 + 1;
        uint64_t v16 = [v15 rangeOfString:@" =  " options:0 range:v12 v9 - v12];
        if (v16 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v18 = [v15 rangeOfCharacterFromSet:flattenPlistString_nonwhitespaceCharacterSet options:0 range:NSMakeRange(v16+ v17, v9 - (v16 + v17))- (v16+ v17- 1)];
          if (v18)
          {
            uint64_t v19 = [v15 stringByReplacingCharactersInRange:];

            char v15 = (void *)v19;
          }
          v9 -= v18;
        }
        unint64_t v20 = [v15 rangeOfCharacterFromSet:flattenPlistString_newlineCharacterSet options:0 range:v12 v9 - v12];
        unint64_t v12 = v20;
        if (v9 >= 0x60) {
          unint64_t v21 = 96;
        }
        else {
          unint64_t v21 = v9;
        }
        BOOL v22 = v20 == 0x7FFFFFFFFFFFFFFFLL || v20 > v21;
        id v3 = v15;
      }
      while (!v22);
    }
  }
  else
  {
    unint64_t v23 = [v2 length];
    if (v23 >= 0x60) {
      uint64_t v24 = 96;
    }
    else {
      uint64_t v24 = v23;
    }
    char v15 = [v2 stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n" options:0 range:v24];
  }

  if ((unint64_t)[v15 length] >= 0x61)
  {
    id v25 = [v15 substringToIndex:96];
    if ([v25 UTF8String])
    {
      if (!v25) {
        goto LABEL_43;
      }
    }
    else
    {
      int64_t v26 = [v15 substringToIndex:95];

      id v27 = v26;
      if (![v27 UTF8String])
      {
        uint64_t v30 = @"<<couldn't convert to UTF8>>";
        id v25 = v15;
LABEL_42:

        char v15 = v30;
        goto LABEL_43;
      }
      id v25 = v27;
      if (!v27) {
        goto LABEL_43;
      }
    }
    uint64_t v28 = [v25 length];
    if (v28 == [v15 length] - 2 && [v15 hasSuffix:@"\n\"]) {
      int v29 = @"\"";
    }
    else {
      int v29 = @"...\"";
    }
    uint64_t v30 = [v25 stringByAppendingString:v29];
    id v27 = v15;
    goto LABEL_42;
  }
LABEL_43:

  return v15;
}

void __shortenString_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  id v1 = (void *)shortenString_newlineCharacterSet;
  shortenString_newlineCharacterSet = v0;

  id v4 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  uint64_t v2 = [v4 invertedSet];
  id v3 = (void *)shortenString_nonwhitespaceCharacterSet;
  shortenString_nonwhitespaceCharacterSet = v2;
}

__CFString *stringFromMappedNSCFData(void *a1, unint64_t *a2, uint64_t a3, void *a4, int a5, int a6, void *a7)
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v13 = a1;
  id v14 = a4;
  id v15 = a7;
  if (stringFromMappedNSCFData_onceToken != -1) {
    dispatch_once(&stringFromMappedNSCFData_onceToken, &__block_literal_global_32);
  }
  uint64_t v79 = 0;
  CFIndex Length = CFDataGetLength((CFDataRef)a2);
  if (!Length)
  {
    unint64_t v20 = @"content length 0";
    goto LABEL_118;
  }
  uint64_t v17 = Length;
  v77 = v13;
  BytePtr = (const char *)CFDataGetBytePtr((CFDataRef)a2);
  if (a6)
  {
    char v19 = atomic_load(a2 + 1);
    if ((v19 & 4) == 0) {
      goto LABEL_77;
    }
  }
  else if (!a5)
  {
    goto LABEL_77;
  }
  if (!remoteAddressIsOKtoRead(a3, v14))
  {
    BOOL v22 = 0;
    unint64_t v20 = 0;
    id v13 = v77;
    goto LABEL_117;
  }
  if (BytePtr - (const char *)a2 < (unint64_t)stringFromMappedNSCFData_cfDataSize)
  {
    id v76 = v15;
    id v21 = v14;
    uint64_t v79 = BytePtr;
    BOOL v22 = [NSString stringWithFormat:@"inline content length %ld", v17];
    unint64_t v23 = "inline ";
    goto LABEL_12;
  }
LABEL_77:
  int64_t v43 = [v15 vmuVMRegionForAddress:BytePtr];
  id v44 = v43;
  if (!v43) {
    goto LABEL_79;
  }
  uint64_t v45 = [v43 range];
  if ((unint64_t)&BytePtr[v17] > v45 + v46) {
    goto LABEL_79;
  }
  uint64_t v47 = [v44 type];
  char v48 = [v47 hasPrefix:@"MALLOC_"];

  if ((v48 & 1) == 0)
  {
    id v49 = [v44 descriptionWithOptions:VMUGetFlagsForAllVMRegionStatistics() | 0x201 maximumLength:0];
    int v50 = [v44 type];
    int v51 = [v50 hasPrefix:@"__"];

    if (v51 && (CSSymbolicatorGetSymbolWithAddressAtTime(), (uint64_t Name = CSSymbolGetName()) != 0))
    {
      uint64_t v53 = Name;
      uint64_t Range = CSSymbolGetRange();
      if ((const char *)Range == BytePtr) {
        [NSString stringWithFormat:@"content length %ld  %s in VM:  %@", v17, v53, v49, v69];
      }
      else {
        [NSString stringWithFormat:@"content length %ld  %s + %llu in VM:  %@", v17, v53, &BytePtr[-Range], v49];
      }
    }
    else if ([v44 range] == BytePtr && v17 == v55)
    {
      [NSString stringWithFormat:@"content length %ld entire VM:  %@", v17, v49, v68, v69];
    }
    else
    {
      NSString *v10 = [NSString stringWithFormat:@"content length %ld at offset %llu in VM:  %@", v17, &BytePtr[-[v44 range]], v49, v69];
    }
    unint64_t v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    id v13 = v77;

    goto LABEL_81;
  }
  if (!remoteAddressIsOKtoRead(a3, v14))
  {
LABEL_79:
    unint64_t v20 = 0;
LABEL_80:
    id v13 = v77;
LABEL_81:

    BOOL v22 = 0;
    goto LABEL_117;
  }
  task_peek_if_pages_exist(v77, (uint64_t)BytePtr, v17, &v79);
  if (!v79)
  {
    [NSString stringWithFormat:@"content length %ld -- failed to read data from %#llx", v17, BytePtr];
    unint64_t v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_80;
  }
  id v76 = v15;
  id v21 = v14;
  BOOL v22 = [NSString stringWithFormat:@"content length %ld at %#llx", v17, BytePtr];

  unint64_t v23 = "";
  BytePtr = v79;
LABEL_12:
  if (!strncmp(BytePtr, "bplist0", 7uLL))
  {
    uint64_t v56 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:BytePtr length:v17 freeWhenDone:0];
    uint64_t v57 = [MEMORY[0x1E4F28F98] propertyListWithData:v56 options:0 format:0 error:0];
    uint64_t v58 = [v57 description];
    if (v58)
    {
      BOOL v59 = (void *)v58;
      unint64_t v20 = [NSString stringWithFormat:@"%sbinary plist:  %@", v23, v58];

LABEL_98:
      id v14 = v21;
      id v15 = v76;
      id v13 = v77;
      goto LABEL_117;
    }
  }
  if (v17 == 1) {
    size_t v24 = 5;
  }
  else {
    size_t v24 = 3 * v17 + 1;
  }
  id v25 = (char *)malloc_type_malloc(v24, 0x8485E948uLL);
  if (!v25)
  {
    unint64_t v20 = 0;
    goto LABEL_98;
  }
  id v70 = v25;
  v71 = v22;
  int64_t v26 = &v25[v24];
  id v14 = v21;
  uint64_t v73 = &v25[v24];
  if (v17 < 1)
  {
    uint64_t v28 = 0;
    uint64_t v31 = v25;
    id v15 = v76;
    goto LABEL_100;
  }
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = v17 - 2;
  unint64_t v72 = (unint64_t)(v26 - 2);
  uint64_t v30 = MEMORY[0x1E4F14390];
  char v75 = 1;
  uint64_t v31 = v25;
  uint64_t v74 = v21;
  do
  {
    uint64_t v32 = 0;
    while (1)
    {
      uint64_t v33 = v79[v27 + v32];
      if (v79[v27 + v32] < 0) {
        break;
      }
      if ((*(_DWORD *)(v30 + 4 * v33 + 60) & 0x40000) == 0) {
        goto LABEL_24;
      }
LABEL_30:
      ++v32;
      uint64_t v35 = v27 + v32;
      if (v27 + v32 >= v17)
      {
        if (v32 > 3)
        {
          BOOL v36 = 0;
LABEL_33:
          id v15 = v76;
          uint64_t v37 = 0;
          id v14 = v74;
          if (v27 >= 1 && !v36)
          {
            BOOL v36 = 0;
            uint64_t v37 = 0;
            v31 -= v35 - v27 == v79[v27 - 1];
          }
          goto LABEL_66;
        }
        goto LABEL_38;
      }
    }
    if (__maskrune(v79[v27 + v32], 0x40000uLL)) {
      goto LABEL_30;
    }
LABEL_24:
    BOOL v34 = v33 > 0xD || ((1 << v33) & 0x2600) == 0;
    if (!v34 || (v33 - 169) < 2) {
      goto LABEL_30;
    }
    if (v32 > 3)
    {
      uint64_t v35 = v27 + v32;
      BOOL v36 = v79[v27 + v32] == 0;
      goto LABEL_33;
    }
LABEL_38:
    uint64_t v35 = v27;
    if (v27 >= v29)
    {
LABEL_52:
      if (v35 - v27 > 7)
      {
        BOOL v36 = 0;
        uint64_t v37 = 1;
        id v14 = v74;
        goto LABEL_65;
      }
LABEL_57:
      id v14 = v74;
      if ((v75 & 1) == 0)
      {
        id v15 = v76;
        goto LABEL_61;
      }
      id v15 = v76;
      if ((unint64_t)v31 < v72)
      {
        *(_WORD *)uint64_t v31 = 30768;
        v31 += 2;
LABEL_61:
        if ((unint64_t)v31 < v72)
        {
          char v75 = 0;
          *uint64_t v31 = stringFromMappedNSCFData_hex[(unint64_t)v79[v27] >> 4];
          v31[1] = stringFromMappedNSCFData_hex[v79[v27] & 0xF];
          goto LABEL_75;
        }
      }
LABEL_104:
      free(v70);
      unint64_t v20 = 0;
      id v13 = v77;
      BOOL v22 = v71;
      goto LABEL_117;
    }
    uint64_t v38 = 0;
    while (2)
    {
      if (!v79[v27 + v38])
      {
        uint64_t v39 = v79[v27 + 1 + v38];
        if (v79[v27 + 1 + v38] < 0)
        {
          if (!__maskrune(v79[v27 + 1 + v38], 0x40000uLL))
          {
LABEL_45:
            BOOL v40 = v39 > 0xD || ((1 << v39) & 0x2600) == 0;
            if (v40 && (v39 - 169) >= 2) {
              break;
            }
          }
        }
        else if ((*(_DWORD *)(v30 + 4 * v39 + 60) & 0x40000) == 0)
        {
          goto LABEL_45;
        }
        v38 += 2;
        uint64_t v35 = v27 + v38;
        if (v27 + v38 >= v29) {
          goto LABEL_52;
        }
        continue;
      }
      break;
    }
    if (v38 <= 7) {
      goto LABEL_57;
    }
    uint64_t v35 = v27 + v38;
    id v14 = v74;
    if (v79[v27 + v38]) {
      BOOL v36 = 0;
    }
    else {
      BOOL v36 = v79[v27 + 1 + v38] == 0;
    }
    uint64_t v37 = 1;
LABEL_65:
    id v15 = v76;
LABEL_66:
    if (v31 >= &v73[v27 - v35 - 4]) {
      goto LABEL_104;
    }
    *(_WORD *)uint64_t v31 = 8736;
    v31 += 2;
    if (v27 >= v35)
    {
      uint64_t v41 = v27;
    }
    else
    {
      do
      {
        uint64_t v41 = v27 + v37 + 1;
        *v31++ = v79[v37 + v27];
        ++v28;
        uint64_t v27 = v41;
      }
      while (v41 < v35);
    }
    *(_WORD *)uint64_t v31 = 8226;
    if (v36) {
      uint64_t v42 = v37;
    }
    else {
      uint64_t v42 = -1;
    }
    uint64_t v27 = v42 + v41;
    char v75 = 1;
LABEL_75:
    v31 += 2;
    ++v27;
  }
  while (v27 < v17);
LABEL_100:
  if (v31 >= v73) {
    goto LABEL_104;
  }
  *uint64_t v31 = 0;
  if (v17 >= 128 && (double)v28 * 100.0 / (double)v17 <= 25.0)
  {
    id v61 = v15;
    id v62 = v14;
    memset(&c, 0, sizeof(c));
    CC_SHA256_Init(&c);
    uint64_t v63 = 0;
    uint64_t v64 = 0x100000;
    BOOL v22 = v71;
    do
    {
      if (v17 - v63 < v64) {
        uint64_t v64 = v17 - v63;
      }
      CC_SHA256_Update(&c, &v79[v63], v64);
      v63 += v64;
    }
    while (v63 < v17);
    CC_SHA256_Final(md, &c);
    id v65 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    uint64_t v66 = 0;
    id v13 = v77;
    do
      [v65 appendFormat:@"%02x", md[v66++]];
    while (v66 != 16);
    unint64_t v20 = [NSString stringWithFormat:@"%@: %.128s...   SHA256: %@", v71, v70, v65];

    id v14 = v62;
    id v15 = v61;
    v60 = v70;
  }
  else
  {
    v60 = v70;
    BOOL v22 = v71;
    unint64_t v20 = [NSString stringWithFormat:@"%@: %s", v71, v70];
    id v13 = v77;
  }
  free(v60);
LABEL_117:

LABEL_118:

  return v20;
}

void __stringFromMappedNSCFData_block_invoke()
{
  UInt8 bytes = 97;
  CFDataRef v0 = CFDataCreate(0, &bytes, 1);
  stringFromMappedNSCFData_cfDataSize = malloc_size(v0);
  CFRelease(v0);
}

void task_peek_if_pages_exist(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a1;
  *a4 = 0;
  uint64_t v8 = *MEMORY[0x1E4F14AE0];
  if (*MEMORY[0x1E4F14AE0] >= *MEMORY[0x1E4F14AF0]) {
    uint64_t v8 = *MEMORY[0x1E4F14AF0];
  }
  uint64_t v9 = a2 & ~v8;
  unint64_t v10 = ((a3 + a2 + v8) & ~v8) - v9;
  unint64_t v11 = *MEMORY[0x1E4F14AE8];
  if (*MEMORY[0x1E4F14AE8] >= *MEMORY[0x1E4F14B00]) {
    unint64_t v11 = *MEMORY[0x1E4F14B00];
  }
  unint64_t v18 = v10 / v11;
  unint64_t v12 = malloc_type_malloc(4 * (v10 / v11), 0x30CAE2CEuLL);
  id v13 = [v7 memoryCache];
  int v14 = [v13 machVMPageRangeQueryWithAddress:v9 size:v10 dispositions:v12 dispositionsCount:&v18];

  if (!v14)
  {
    if (!v18)
    {
LABEL_12:
      uint64_t v17 = [v7 memoryCache];
      [v17 peekAtAddress:a2 size:a3 returnsBuf:a4];

      goto LABEL_13;
    }
    if ((*v12 & 0x91) != 0)
    {
      unint64_t v15 = 0;
      while (v18 - 1 != v15)
      {
        int v16 = *(_DWORD *)&v12[4 * v15++ + 4];
        if ((v16 & 0x91) == 0)
        {
          if (v15 < v18) {
            goto LABEL_13;
          }
          goto LABEL_12;
        }
      }
      goto LABEL_12;
    }
  }
LABEL_13:
  free(v12);
}

uint64_t checkStringIsValidHexAddress(void *a1)
{
  id v1 = a1;
  if ((unint64_t)[v1 length] < 6) {
    goto LABEL_6;
  }
  if ((unint64_t)[v1 length] > 0x12) {
    goto LABEL_6;
  }
  if (![v1 hasPrefix:@"0x"]) {
    goto LABEL_6;
  }
  uint64_t v2 = [v1 substringFromIndex:2];
  id v3 = [v2 uppercaseString];

  id v4 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"0123456789ABCDEF"];
  BOOL v5 = [v4 invertedSet];

  uint64_t v6 = [v3 rangeOfCharacterFromSet:v5];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v7 = 1;
  }
  else {
LABEL_6:
  }
    uint64_t v7 = 0;

  return v7;
}

void sub_1A7D10BFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

void invertRecursiveWithNewInvertedRoot(void *a1, void *a2, void *a3)
{
  id v23 = a1;
  id v5 = a2;
  id v6 = a3;
  [v6 addObject:v23];
  int v7 = [v23 numChildren];
  if (v7)
  {
    int v8 = v7;
    uint64_t v9 = [v23 pseudoNodeTopOfStackChild];
    uint64_t v10 = v9;
    if (v9) {
      invertRecursiveWithNewInvertedRoot(v9, v5, v6);
    }
    uint64_t v11 = 0;
    do
    {
      unint64_t v12 = [v23 childAtIndex:v11];
      invertRecursiveWithNewInvertedRoot(v12, v5, v6);

      uint64_t v11 = (v11 + 1);
    }
    while (v8 != v11);
  }
  else
  {
    id v13 = v5;
    id v14 = v6;
    uint64_t v15 = [v14 lastObject];
    BOOL v22 = (void *)v15;
    if (v15
      && (int v16 = *(_DWORD *)(v15 + 40),
          uint64_t v17 = *(void *)(v15 + 32),
          *((_DWORD *)v13 + 10) += v16,
          *((void *)v13 + 4) += v17,
          (uint64_t v18 = [v14 count]) != 0))
    {
      uint64_t v19 = v18 - 1;
      do
      {
        unint64_t v20 = [v14 objectAtIndex:v19];
        id v21 = [v20 name];
        uint64_t v10 = [v13 findOrAddChildWithName:v21 address:[v20 address] nodeSearchType:1 isLeafNode:0];

        *(_DWORD *)(v10 + 40) += v16;
        *(void *)(v10 + 32) += v17;

        --v19;
        id v13 = (id)v10;
      }
      while (v19 != -1);
    }
    else
    {
      uint64_t v10 = (uint64_t)v13;
    }
  }
  [v6 removeLastObject];
}

BOOL isSystemPath(const char *a1)
{
  if (!a1) {
    return 1;
  }
  if (!strncmp(a1, "/System/", 8uLL)) {
    return 1;
  }
  return strncmp(a1, "/usr/", 5uLL) == 0;
}

uint64_t __printTotalNumberInStack_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unint64_t v7 = [*(id *)(a1 + 32) countForObject:v5];
  unint64_t v8 = [*(id *)(a1 + 32) countForObject:v6];
  if (v7 <= v8)
  {
    if (v7 >= v8) {
      uint64_t v9 = [v5 compare:v6];
    }
    else {
      uint64_t v9 = 1;
    }
  }
  else
  {
    uint64_t v9 = -1;
  }

  return v9;
}

uint64_t __printCollapsedTops_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unint64_t v7 = NSMapGet(*(NSMapTable **)(a1 + 32), v5);
  unint64_t v8 = NSMapGet(*(NSMapTable **)(a1 + 32), v6);
  if (*v7 <= *v8)
  {
    if (*v7 >= *v8) {
      uint64_t v9 = [v5 compare:v6];
    }
    else {
      uint64_t v9 = 1;
    }
  }
  else
  {
    uint64_t v9 = -1;
  }

  return v9;
}

void sub_1A7D13DA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7D13F88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7D1437C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1A7D144AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL CompareRangeAndString(void *a1, void *a2)
{
  return *a1 < *a2;
}

void sub_1A7D14648(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1A7D147F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A7D14A4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7D14BDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7D14CA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A7D14E44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<RangeAndString>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(24 * a2);
}

void std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*,false>(uint64_t a1, __n128 *a2, uint64_t (**a3)(long long *, long long *), uint64_t a4, char a5, __n128 a6)
{
LABEL_1:
  unint64_t v12 = (long long *)&a2[-2].n128_i8[8];
  id v13 = (long long *)a1;
LABEL_2:
  uint64_t v14 = 1 - a4;
  while (1)
  {
    a1 = (uint64_t)v13;
    uint64_t v15 = v14;
    uint64_t v16 = (char *)a2 - (char *)v13;
    unint64_t v17 = 0xAAAAAAAAAAAAAAABLL * (((char *)a2 - (char *)v13) >> 3);
    if (!(!v7 & v6))
    {
      switch(v17)
      {
        case 0uLL:
        case 1uLL:
          return;
        case 2uLL:
          if ((*a3)((long long *)&a2[-2].n128_i8[8], v13))
          {
            unint64_t v32 = *((void *)v13 + 2);
            long long v30 = *v13;
            long long v28 = *v12;
            *((void *)v13 + 2) = a2[-1].n128_u64[1];
            *id v13 = v28;
            long long *v12 = v30;
            a2[-1].n128_u64[1] = v32;
          }
          break;
        case 3uLL:
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>(v13, (long long *)((char *)v13 + 24), (long long *)&a2[-2].n128_i8[8], a3);
          break;
        case 4uLL:
          std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>((uint64_t)v13, (uint64_t)v13 + 24, (uint64_t)(v13 + 3), (uint64_t)&a2[-2].n128_i64[1], a3);
          break;
        case 5uLL:
          std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>((__n128 *)v13, (uint64_t)v13 + 24, (uint64_t)(v13 + 3), (uint64_t)v13 + 72, (uint64_t)&a2[-2].n128_i64[1], a3);
          break;
        default:
          JUMPOUT(0);
      }
      return;
    }
    if (v16 <= 575) {
      break;
    }
    if (v15 == 1)
    {
      if (v13 != (long long *)a2)
      {
        std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*,RangeAndString*>((__n128 *)v13, a2, a2, (unsigned int (**)(uint64_t, __int8 *))a3, a6);
      }
      return;
    }
    unint64_t v18 = v17 >> 1;
    uint64_t v19 = (long long *)((char *)v13 + 24 * (v17 >> 1));
    if ((unint64_t)v16 >= 0xC01)
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>(v13, (long long *)((char *)v13 + 24 * (v17 >> 1)), (long long *)&a2[-2].n128_i8[8], a3);
      uint64_t v20 = 3 * v18;
      id v21 = (long long *)((char *)v13 + 24 * v18 - 24);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>((long long *)((char *)v13 + 24), v21, (long long *)&a2[-3], a3);
      BOOL v22 = v13 + 3;
      id v23 = (long long *)((char *)v13 + 8 * v20 + 24);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>(v22, v23, (long long *)&a2[-5].n128_i8[8], a3);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>(v21, v19, v23, a3);
      uint64_t v31 = *(void *)(a1 + 16);
      long long v29 = *(_OWORD *)a1;
      long long v24 = *v19;
      *(void *)(a1 + 16) = *((void *)v19 + 2);
      *(_OWORD *)a1 = v24;
      *((void *)v19 + 2) = v31;
      *uint64_t v19 = v29;
      if (a5) {
        goto LABEL_13;
      }
    }
    else
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>((long long *)((char *)v13 + 24 * (v17 >> 1)), v13, (long long *)&a2[-2].n128_i8[8], a3);
      if (a5) {
        goto LABEL_13;
      }
    }
    if (((*a3)((long long *)(a1 - 24), (long long *)a1) & 1) == 0)
    {
      id v13 = std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,RangeAndString *,BOOL (*&)(RangeAndString const&,RangeAndString const&)>((long long *)a1, (long long *)a2, a3);
      goto LABEL_18;
    }
LABEL_13:
    uint64_t v25 = std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,RangeAndString *,BOOL (*&)(RangeAndString const&,RangeAndString const&)>((long long *)a1, (unint64_t)a2, (uint64_t (**)(char *, long long *))a3);
    if ((v26 & 1) == 0) {
      goto LABEL_16;
    }
    BOOL v27 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>(a1, v25, a3);
    id v13 = (long long *)(v25 + 24);
    if (std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>(v25 + 24, (uint64_t)a2, a3))
    {
      a4 = -v15;
      a2 = (__n128 *)v25;
      if (v27) {
        return;
      }
      goto LABEL_1;
    }
    uint64_t v14 = v15 + 1;
    if (!v27)
    {
LABEL_16:
      std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*,false>(a1, v25, a3, -v15, a5 & 1);
      id v13 = (long long *)(v25 + 24);
LABEL_18:
      a5 = 0;
      a4 = -v15;
      goto LABEL_2;
    }
  }
  if (a5)
  {
    std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>((uint64_t)v13, (uint64_t)a2, (uint64_t (**)(uint64_t, uint64_t))a3);
  }
  else
  {
    std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>((uint64_t)v13, (uint64_t)a2, (uint64_t (**)(uint64_t, uint64_t))a3);
  }
}

uint64_t std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>(uint64_t result, uint64_t a2, uint64_t (**a3)(uint64_t, uint64_t))
{
  if (result != a2)
  {
    uint64_t v17 = v3;
    uint64_t v18 = v4;
    uint64_t v6 = result;
    uint64_t v7 = result + 24;
    if (result + 24 != a2)
    {
      uint64_t v9 = 0;
      uint64_t v10 = result;
      do
      {
        uint64_t v11 = v10;
        uint64_t v10 = v7;
        mach_vm_address_t result = (*a3)(v7, v11);
        if (result)
        {
          long long v15 = *(_OWORD *)v10;
          uint64_t v16 = *(void *)(v10 + 16);
          uint64_t v12 = v9;
          while (1)
          {
            uint64_t v13 = v6 + v12;
            *(_OWORD *)(v13 + 24) = *(_OWORD *)(v6 + v12);
            *(void *)(v13 + 40) = *(void *)(v6 + v12 + 16);
            if (!v12) {
              break;
            }
            v12 -= 24;
            mach_vm_address_t result = (*a3)((uint64_t)&v15, v12 + v6);
            if ((result & 1) == 0)
            {
              uint64_t v14 = v6 + v12 + 24;
              goto LABEL_10;
            }
          }
          uint64_t v14 = v6;
LABEL_10:
          *(_OWORD *)uint64_t v14 = v15;
          *(void *)(v14 + 16) = v16;
        }
        uint64_t v7 = v10 + 24;
        v9 += 24;
      }
      while (v10 + 24 != a2);
    }
  }
  return result;
}

uint64_t std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>(uint64_t result, uint64_t a2, uint64_t (**a3)(uint64_t, uint64_t))
{
  if (result != a2)
  {
    uint64_t v14 = v3;
    uint64_t v15 = v4;
    uint64_t v6 = result;
    uint64_t v7 = result + 24;
    if (result + 24 != a2)
    {
      uint64_t v9 = result - 24;
      do
      {
        uint64_t v10 = v6;
        uint64_t v6 = v7;
        mach_vm_address_t result = (*a3)(v7, v10);
        if (result)
        {
          long long v12 = *(_OWORD *)v6;
          uint64_t v13 = *(void *)(v6 + 16);
          uint64_t v11 = v9;
          do
          {
            *(_OWORD *)(v11 + 4_Block_object_dispose(&STACK[0x280], 8) = *(_OWORD *)(v11 + 24);
            *(void *)(v11 + 64) = *(void *)(v11 + 40);
            mach_vm_address_t result = (*a3)((uint64_t)&v12, v11);
            v11 -= 24;
          }
          while ((result & 1) != 0);
          *(_OWORD *)(v11 + 4_Block_object_dispose(&STACK[0x280], 8) = v12;
          *(void *)(v11 + 64) = v13;
        }
        uint64_t v7 = v6 + 24;
        v9 += 24;
      }
      while (v6 + 24 != a2);
    }
  }
  return result;
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>(long long *a1, long long *a2, long long *a3, uint64_t (**a4)(long long *, long long *))
{
  char v8 = (*a4)(a2, a1);
  uint64_t result = (*a4)(a3, a2);
  if ((v8 & 1) == 0)
  {
    if (!result) {
      return result;
    }
    uint64_t v13 = *((void *)a2 + 2);
    long long v14 = *a2;
    uint64_t v15 = *((void *)a3 + 2);
    *a2 = *a3;
    *((void *)a2 + 2) = v15;
    *a3 = v14;
    *((void *)a3 + 2) = v13;
    if (!(*a4)(a2, a1)) {
      return 1;
    }
    uint64_t v16 = *((void *)a1 + 2);
    long long v17 = *a1;
    uint64_t v18 = *((void *)a2 + 2);
    *a1 = *a2;
    *((void *)a1 + 2) = v18;
    *a2 = v17;
    *((void *)a2 + 2) = v16;
    return 2;
  }
  if (!result)
  {
    uint64_t v19 = *((void *)a1 + 2);
    long long v20 = *a1;
    uint64_t v21 = *((void *)a2 + 2);
    *a1 = *a2;
    *((void *)a1 + 2) = v21;
    *a2 = v20;
    *((void *)a2 + 2) = v19;
    if (!(*a4)(a3, a2)) {
      return 1;
    }
    uint64_t v22 = *((void *)a2 + 2);
    long long v23 = *a2;
    uint64_t v24 = *((void *)a3 + 2);
    *a2 = *a3;
    *((void *)a2 + 2) = v24;
    *a3 = v23;
    *((void *)a3 + 2) = v22;
    return 2;
  }
  uint64_t v10 = *((void *)a1 + 2);
  long long v11 = *a1;
  uint64_t v12 = *((void *)a3 + 2);
  *a1 = *a3;
  *((void *)a1 + 2) = v12;
  *a3 = v11;
  *((void *)a3 + 2) = v10;
  return 1;
}

long long *std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,RangeAndString *,BOOL (*&)(RangeAndString const&,RangeAndString const&)>(long long *a1, long long *a2, uint64_t (**a3)(long long *, long long *))
{
  uint64_t v4 = a2;
  long long v16 = *a1;
  uint64_t v17 = *((void *)a1 + 2);
  if ((*a3)(&v16, (long long *)((char *)a2 - 24)))
  {
    uint64_t v6 = a1;
    do
      uint64_t v6 = (long long *)((char *)v6 + 24);
    while (((*a3)(&v16, v6) & 1) == 0);
  }
  else
  {
    uint64_t v7 = (long long *)((char *)a1 + 24);
    do
    {
      uint64_t v6 = v7;
      if (v7 >= v4) {
        break;
      }
      int v8 = (*a3)(&v16, v7);
      uint64_t v7 = (long long *)((char *)v6 + 24);
    }
    while (!v8);
  }
  if (v6 < v4)
  {
    do
      uint64_t v4 = (long long *)((char *)v4 - 24);
    while (((*a3)(&v16, v4) & 1) != 0);
  }
  while (v6 < v4)
  {
    long long v9 = *v6;
    uint64_t v19 = *((void *)v6 + 2);
    long long v18 = v9;
    long long v10 = *v4;
    *((void *)v6 + 2) = *((void *)v4 + 2);
    *uint64_t v6 = v10;
    long long v11 = v18;
    *((void *)v4 + 2) = v19;
    *uint64_t v4 = v11;
    do
      uint64_t v6 = (long long *)((char *)v6 + 24);
    while (!(*a3)(&v16, v6));
    do
      uint64_t v4 = (long long *)((char *)v4 - 24);
    while (((*a3)(&v16, v4) & 1) != 0);
  }
  uint64_t v12 = (long long *)((char *)v6 - 24);
  if ((long long *)((char *)v6 - 24) != a1)
  {
    long long v13 = *v12;
    *((void *)a1 + 2) = *((void *)v6 - 1);
    *a1 = v13;
  }
  long long v14 = v16;
  *((void *)v6 - 1) = v17;
  long long *v12 = v14;
  return v6;
}

uint64_t std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,RangeAndString *,BOOL (*&)(RangeAndString const&,RangeAndString const&)>(long long *a1, unint64_t a2, uint64_t (**a3)(char *, long long *))
{
  uint64_t v6 = 0;
  long long v17 = *a1;
  uint64_t v18 = *((void *)a1 + 2);
  do
    v6 += 24;
  while (((*a3)((char *)a1 + v6, &v17) & 1) != 0);
  unint64_t v7 = (unint64_t)a1 + v6;
  uint64_t v8 = (uint64_t)a1 + v6 - 24;
  if (v6 == 24)
  {
    do
    {
      if (v7 >= a2) {
        break;
      }
      a2 -= 24;
    }
    while (((*a3)((char *)a2, &v17) & 1) == 0);
  }
  else
  {
    do
      a2 -= 24;
    while (!(*a3)((char *)a2, &v17));
  }
  if (v7 < a2)
  {
    long long v9 = (long long *)((char *)a1 + v6);
    unint64_t v10 = a2;
    do
    {
      long long v19 = *v9;
      long long v11 = v19;
      uint64_t v20 = *((void *)v9 + 2);
      uint64_t v12 = v20;
      uint64_t v13 = *(void *)(v10 + 16);
      *long long v9 = *(_OWORD *)v10;
      *((void *)v9 + 2) = v13;
      *(void *)(v10 + 16) = v12;
      *(_OWORD *)unint64_t v10 = v11;
      do
        long long v9 = (long long *)((char *)v9 + 24);
      while (((*a3)((char *)v9, &v17) & 1) != 0);
      do
        v10 -= 24;
      while (!(*a3)((char *)v10, &v17));
    }
    while ((unint64_t)v9 < v10);
    uint64_t v8 = (uint64_t)v9 - 24;
  }
  if ((long long *)v8 != a1)
  {
    long long v14 = *(_OWORD *)v8;
    *((void *)a1 + 2) = *(void *)(v8 + 16);
    *a1 = v14;
  }
  long long v15 = v17;
  *(void *)(v8 + 16) = v18;
  *(_OWORD *)uint64_t v8 = v15;
  return v8;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>(uint64_t a1, uint64_t a2, uint64_t (**a3)(long long *, long long *))
{
  uint64_t v6 = (a2 - a1) >> 3;
  BOOL result = 1;
  switch(0xAAAAAAAAAAAAAAABLL * v6)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      uint64_t v8 = (long long *)(a2 - 24);
      if ((*a3)((long long *)(a2 - 24), (long long *)a1))
      {
        uint64_t v9 = *(void *)(a1 + 16);
        long long v10 = *(_OWORD *)a1;
        uint64_t v11 = *(void *)(a2 - 8);
        *(_OWORD *)a1 = *v8;
        *(void *)(a1 + 16) = v11;
        *uint64_t v8 = v10;
        *(void *)(a2 - _Block_object_dispose(&STACK[0x280], 8) = v9;
      }
      return 1;
    case 3uLL:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>((long long *)a1, (long long *)(a1 + 24), (long long *)(a2 - 24), a3);
      return 1;
    case 4uLL:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>(a1, a1 + 24, a1 + 48, a2 - 24, a3);
      return 1;
    case 5uLL:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>((__n128 *)a1, a1 + 24, a1 + 48, a1 + 72, a2 - 24, a3);
      return 1;
    default:
      uint64_t v12 = (long long *)(a1 + 48);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>((long long *)a1, (long long *)(a1 + 24), (long long *)(a1 + 48), a3);
      uint64_t v13 = a1 + 72;
      if (a1 + 72 == a2) {
        return 1;
      }
      uint64_t v14 = 0;
      int v15 = 0;
      break;
  }
  while (1)
  {
    if ((*a3)((long long *)v13, v12))
    {
      long long v19 = *(_OWORD *)v13;
      uint64_t v20 = *(void *)(v13 + 16);
      uint64_t v16 = v14;
      while (1)
      {
        uint64_t v17 = a1 + v16;
        *(_OWORD *)(v17 + 72) = *(_OWORD *)(a1 + v16 + 48);
        *(void *)(v17 + 8_Block_object_dispose(&STACK[0x280], 8) = *(void *)(a1 + v16 + 64);
        if (v16 == -48) {
          break;
        }
        v16 -= 24;
        if (((*a3)(&v19, (long long *)(v17 + 24)) & 1) == 0)
        {
          uint64_t v18 = a1 + v16 + 72;
          goto LABEL_12;
        }
      }
      uint64_t v18 = a1;
LABEL_12:
      *(_OWORD *)uint64_t v18 = v19;
      *(void *)(v18 + 16) = v20;
      if (++v15 == 8) {
        return v13 + 24 == a2;
      }
    }
    uint64_t v12 = (long long *)v13;
    v14 += 24;
    v13 += 24;
    if (v13 == a2) {
      return 1;
    }
  }
}

__n128 std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (**a5)(long long *, long long *))
{
  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>((long long *)a1, (long long *)a2, (long long *)a3, a5);
  if ((*a5)((long long *)a4, (long long *)a3))
  {
    uint64_t v11 = *(void *)(a3 + 16);
    long long v12 = *(_OWORD *)a3;
    uint64_t v13 = *(void *)(a4 + 16);
    *(_OWORD *)a3 = *(_OWORD *)a4;
    *(void *)(a3 + 16) = v13;
    *(_OWORD *)a4 = v12;
    *(void *)(a4 + 16) = v11;
    if ((*a5)((long long *)a3, (long long *)a2))
    {
      uint64_t v14 = *(void *)(a2 + 16);
      long long v15 = *(_OWORD *)a2;
      uint64_t v16 = *(void *)(a3 + 16);
      *(_OWORD *)a2 = *(_OWORD *)a3;
      *(void *)(a2 + 16) = v16;
      *(_OWORD *)a3 = v15;
      *(void *)(a3 + 16) = v14;
      if ((*a5)((long long *)a2, (long long *)a1))
      {
        uint64_t v17 = *(void *)(a1 + 16);
        __n128 result = *(__n128 *)a1;
        uint64_t v18 = *(void *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(void *)(a1 + 16) = v18;
        *(__n128 *)a2 = result;
        *(void *)(a2 + 16) = v17;
      }
    }
  }
  return result;
}

__n128 std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>(__n128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (**a6)(long long *, long long *))
{
  __n128 v12 = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>((uint64_t)a1, a2, a3, a4, a6);
  if (((unsigned int (*)(uint64_t, uint64_t, __n128))*a6)(a5, a4, v12))
  {
    uint64_t v14 = *(void *)(a4 + 16);
    long long v15 = *(_OWORD *)a4;
    uint64_t v16 = *(void *)(a5 + 16);
    *(_OWORD *)a4 = *(_OWORD *)a5;
    *(void *)(a4 + 16) = v16;
    *(_OWORD *)a5 = v15;
    *(void *)(a5 + 16) = v14;
    if ((*a6)((long long *)a4, (long long *)a3))
    {
      uint64_t v17 = *(void *)(a3 + 16);
      long long v18 = *(_OWORD *)a3;
      uint64_t v19 = *(void *)(a4 + 16);
      *(_OWORD *)a3 = *(_OWORD *)a4;
      *(void *)(a3 + 16) = v19;
      *(_OWORD *)a4 = v18;
      *(void *)(a4 + 16) = v17;
      if ((*a6)((long long *)a3, (long long *)a2))
      {
        uint64_t v20 = *(void *)(a2 + 16);
        __n128 v21 = *(__n128 *)a2;
        uint64_t v22 = *(void *)(a3 + 16);
        *(_OWORD *)a2 = *(_OWORD *)a3;
        *(void *)(a2 + 16) = v22;
        *(__n128 *)a3 = v21;
        *(void *)(a3 + 16) = v20;
        if ((*a6)((long long *)a2, (long long *)a1))
        {
          unint64_t v23 = a1[1].n128_u64[0];
          __n128 result = *a1;
          unint64_t v24 = *(void *)(a2 + 16);
          *a1 = *(__n128 *)a2;
          a1[1].n128_u64[0] = v24;
          *(__n128 *)a2 = result;
          *(void *)(a2 + 16) = v23;
        }
      }
    }
  }
  return result;
}

__n128 *std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*,RangeAndString*>(__n128 *a1, __n128 *a2, __n128 *a3, unsigned int (**a4)(uint64_t, __int8 *), __n128 a5)
{
  if (a1 != a2)
  {
    unint64_t v7 = a2;
    uint64_t v9 = (char *)a2 - (char *)a1;
    uint64_t v10 = ((char *)a2 - (char *)a1) / 24;
    if ((char *)a2 - (char *)a1 >= 25)
    {
      unint64_t v11 = (unint64_t)(v10 - 2) >> 1;
      unint64_t v12 = v11 + 1;
      uint64_t v13 = (__n128 *)((char *)a1 + 24 * v11);
      do
      {
        a5 = std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>((uint64_t)a1, a4, v10, v13);
        uint64_t v13 = (__n128 *)((char *)v13 - 24);
        --v12;
      }
      while (v12);
    }
    uint64_t v14 = v7;
    if (v7 != a3)
    {
      long long v15 = v7;
      do
      {
        if (((unsigned int (*)(__n128 *, __n128 *, __n128))*a4)(v15, a1, a5))
        {
          unint64_t v16 = v15[1].n128_u64[0];
          __n128 v17 = *v15;
          unint64_t v18 = a1[1].n128_u64[0];
          *long long v15 = *a1;
          v15[1].n128_u64[0] = v18;
          *a1 = v17;
          a1[1].n128_u64[0] = v16;
          a5 = std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>((uint64_t)a1, a4, v10, a1);
        }
        long long v15 = (__n128 *)((char *)v15 + 24);
      }
      while (v15 != a3);
      uint64_t v14 = a3;
    }
    if (v9 < 25)
    {
      return v14;
    }
    else
    {
      long long v29 = v14;
      int64_t v19 = v9 / 0x18uLL;
      do
      {
        long long v30 = v7;
        uint64_t v20 = 0;
        __n128 v31 = *a1;
        unint64_t v32 = a1[1].n128_u64[0];
        uint64_t v21 = (uint64_t)a1;
        do
        {
          uint64_t v22 = v21 + 24 * v20 + 24;
          uint64_t v23 = (2 * v20) | 1;
          uint64_t v24 = 2 * v20 + 2;
          if (v24 < v19 && (*a4)(v21 + 24 * v20 + 24, (__int8 *)(v21 + 24 * v20 + 48)))
          {
            v22 += 24;
            uint64_t v23 = v24;
          }
          long long v25 = *(_OWORD *)v22;
          *(void *)(v21 + 16) = *(void *)(v22 + 16);
          *(_OWORD *)uint64_t v21 = v25;
          uint64_t v21 = v22;
          uint64_t v20 = v23;
        }
        while (v23 <= (uint64_t)((unint64_t)(v19 - 2) >> 1));
        unint64_t v7 = (__n128 *)((char *)v30 - 24);
        if ((__int8 *)v22 == &v30[-2].n128_i8[8])
        {
          *(void *)(v22 + 16) = v32;
          *(__n128 *)uint64_t v22 = v31;
        }
        else
        {
          __n128 v26 = *v7;
          *(void *)(v22 + 16) = v30[-1].n128_u64[1];
          *(__n128 *)uint64_t v22 = v26;
          *unint64_t v7 = v31;
          v30[-1].n128_u64[1] = v32;
          std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>((uint64_t)a1, v22 + 24, (uint64_t (**)(long long *, long long *))a4, 0xAAAAAAAAAAAAAAABLL * ((v22 + 24 - (uint64_t)a1) >> 3));
        }
      }
      while (v19-- > 2);
      return v29;
    }
  }
  return a3;
}

__n128 std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>(uint64_t a1, unsigned int (**a2)(uint64_t, __int8 *), uint64_t a3, __n128 *a4)
{
  unint64_t v6 = a3 - 2;
  if (a3 >= 2)
  {
    uint64_t v22 = v4;
    uint64_t v23 = v5;
    unint64_t v7 = a4;
    uint64_t v9 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) >= (uint64_t)(0xAAAAAAAAAAAAAAABLL * (((uint64_t)a4 - a1) >> 3)))
    {
      uint64_t v12 = (0x5555555555555556 * (((uint64_t)a4 - a1) >> 3)) | 1;
      uint64_t v13 = (__n128 *)(a1 + 24 * v12);
      uint64_t v14 = 0x5555555555555556 * (((uint64_t)a4 - a1) >> 3) + 2;
      if (v14 < a3 && (*a2)(a1 + 24 * v12, &v13[1].n128_i8[8]))
      {
        uint64_t v13 = (__n128 *)((char *)v13 + 24);
        uint64_t v12 = v14;
      }
      if ((((uint64_t (*)(__n128 *, __n128 *))*a2)(v13, v7) & 1) == 0)
      {
        __n128 v20 = *v7;
        unint64_t v21 = v7[1].n128_u64[0];
        do
        {
          unint64_t v16 = v13;
          __n128 v17 = *v13;
          v7[1].n128_u64[0] = v13[1].n128_u64[0];
          *unint64_t v7 = v17;
          if (v9 < v12) {
            break;
          }
          uint64_t v18 = (2 * v12) | 1;
          uint64_t v13 = (__n128 *)(a1 + 24 * v18);
          uint64_t v19 = 2 * v12 + 2;
          if (v19 < a3)
          {
            if ((*a2)(a1 + 24 * v18, &v13[1].n128_i8[8]))
            {
              uint64_t v13 = (__n128 *)((char *)v13 + 24);
              uint64_t v18 = v19;
            }
          }
          unint64_t v7 = v16;
          uint64_t v12 = v18;
        }
        while (!(*a2)((uint64_t)v13, (__int8 *)&v20));
        __n128 result = v20;
        v16[1].n128_u64[0] = v21;
        *unint64_t v16 = result;
      }
    }
  }
  return result;
}

double std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>(uint64_t a1, uint64_t a2, uint64_t (**a3)(long long *, long long *), uint64_t a4)
{
  unint64_t v6 = a4 - 2;
  if (a4 >= 2)
  {
    uint64_t v17 = v4;
    uint64_t v18 = v5;
    unint64_t v9 = v6 >> 1;
    uint64_t v10 = (long long *)(a1 + 24 * (v6 >> 1));
    unint64_t v11 = (long long *)(a2 - 24);
    if ((*a3)(v10, (long long *)(a2 - 24)))
    {
      long long v15 = *v11;
      uint64_t v16 = *((void *)v11 + 2);
      do
      {
        uint64_t v13 = v10;
        long long v14 = *v10;
        *((void *)v11 + 2) = *((void *)v10 + 2);
        *unint64_t v11 = v14;
        if (!v9) {
          break;
        }
        unint64_t v9 = (v9 - 1) >> 1;
        uint64_t v10 = (long long *)(a1 + 24 * v9);
        unint64_t v11 = v13;
      }
      while (((*a3)(v10, &v15) & 1) != 0);
      double result = *(double *)&v15;
      *uint64_t v13 = v15;
      *((void *)v13 + 2) = v16;
    }
  }
  return result;
}

void sub_1A7D168F0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1A7D17CA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void sub_1A7D183CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xEu);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id vmuTaskMemoryCacheInitializationError(void *a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v8[0] = a1;
  uint64_t v2 = (void *)MEMORY[0x1E4F1C9E8];
  id v3 = a1;
  uint64_t v4 = [v2 dictionaryWithObjects:v8 forKeys:&v7 count:1];
  uint64_t v5 = [v1 errorWithDomain:@"VMUTaskMemoryCache initialization" code:0 userInfo:v4];

  return v5;
}

void sub_1A7D1A5BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7D1AA78(_Unwind_Exception *exc_buf, int a2)
{
  if (a2)
  {
    objc_begin_catch(exc_buf);
    JUMPOUT(0x1A7D1A9B4);
  }
  _Unwind_Resume(exc_buf);
}

unsigned __int8 *_appendToBuffer(unsigned __int8 *ptr, unsigned int *a2, unsigned int *a3, void *__src, size_t __n)
{
  unsigned int v5 = __n;
  uint64_t v8 = ptr;
  int v9 = *a3;
  int v10 = *a2;
  if (*a3 + __n > *a2)
  {
    LODWORD(v11) = 2 * v10;
    unsigned int v12 = v10 + __n;
    if (v11 <= v12) {
      LODWORD(v11) = v12;
    }
    if (v11 <= 0x400) {
      size_t v11 = 1024;
    }
    else {
      size_t v11 = v11;
    }
    *a2 = v11;
    uint64_t v8 = (unsigned __int8 *)malloc_type_realloc(ptr, v11, 0xE99C43A3uLL);
    int v9 = *a3;
  }
  memcpy(&v8[v9], __src, v5);
  *a3 += v5;
  return v8;
}

void sub_1A7D1B640(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7D1B880(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7D1B98C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _nextField(uint64_t a1, unsigned int a2, _DWORD *a3, void *a4)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *a3;
  if (v4 + 4 <= (unint64_t)a2)
  {
    uint64_t result = *(unsigned int *)(a1 + v4);
    *a3 = v4 + 4;
  }
  else
  {
    unint64_t v6 = serializerLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      _nextField(v6, v7, v8, v9, v10, v11, v12, v13);
    }

    if (a4)
    {
      long long v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v15 = OOBDOMAIN;
      uint64_t v18 = *MEMORY[0x1E4F28568];
      v19[0] = @"Out-of-bound access.";
      uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
      *a4 = [v14 errorWithDomain:v15 code:1 userInfo:v16];
    }
    return 0;
  }
  return result;
}

void sub_1A7D1BAD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7D1BD50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

id serializerLogHandle(void)
{
  if (serializerLogHandle(void)::onceToken != -1) {
    dispatch_once(&serializerLogHandle(void)::onceToken, &__block_literal_global_9);
  }
  CFDataRef v0 = (void *)serializerLogHandle(void)::log;

  return v0;
}

void sub_1A7D1BFE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZL19serializerLogHandlev_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.Symbolication", "VMUSimpleSerializer");
  uint64_t v1 = (void *)serializerLogHandle(void)::log;
  serializerLogHandle(void)::log = (uint64_t)v0;
}

void *std::__hash_table<std::__hash_value_type<char const*,unsigned int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,unsigned int>,cstring_callbacks,cstring_callbacks,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,unsigned int>,cstring_callbacks,cstring_callbacks,true>,std::allocator<std::__hash_value_type<char const*,unsigned int>>>::__emplace_unique_key_args<char const*,char const*,unsigned int &>(uint64_t a1, const char **a2, void *a3, _DWORD *a4)
{
  uint64_t v8 = *a2;
  char v9 = **a2;
  if (v9)
  {
    unint64_t v10 = 0;
    uint64_t v11 = (unsigned __int8 *)(v8 + 1);
    do
    {
      unint64_t v10 = 5 * v10 + v9;
      int v12 = *v11++;
      char v9 = v12;
    }
    while (v12);
  }
  else
  {
    unint64_t v10 = 0;
  }
  unint64_t v13 = *(void *)(a1 + 8);
  if (v13)
  {
    uint8x8_t v14 = (uint8x8_t)vcnt_s8((int8x8_t)v13);
    v14.i16[0] = vaddlv_u8(v14);
    unint64_t v15 = v14.u32[0];
    if (v14.u32[0] > 1uLL)
    {
      unint64_t v4 = v10;
      if (v10 >= v13) {
        unint64_t v4 = v10 % v13;
      }
    }
    else
    {
      unint64_t v4 = (v13 - 1) & v10;
    }
    uint64_t v16 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v16)
    {
      for (uint64_t i = *v16; i; uint64_t i = *(void **)i)
      {
        unint64_t v18 = *((void *)i + 1);
        if (v18 == v10)
        {
          if (!strcmp(*((const char **)i + 2), v8)) {
            return i;
          }
        }
        else
        {
          if (v15 > 1)
          {
            if (v18 >= v13) {
              v18 %= v13;
            }
          }
          else
          {
            v18 &= v13 - 1;
          }
          if (v18 != v4) {
            break;
          }
        }
      }
    }
  }
  uint64_t i = operator new(0x20uLL);
  *(void *)uint64_t i = 0;
  *((void *)i + 1) = v10;
  *((void *)i + 2) = *a3;
  *((_DWORD *)i + 6) = *a4;
  float v19 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v20 = *(float *)(a1 + 32);
  if (!v13 || (float)(v20 * (float)v13) < v19)
  {
    BOOL v21 = 1;
    if (v13 >= 3) {
      BOOL v21 = (v13 & (v13 - 1)) != 0;
    }
    unint64_t v22 = v21 | (2 * v13);
    unint64_t v23 = vcvtps_u32_f32(v19 / v20);
    if (v22 <= v23) {
      size_t v24 = v23;
    }
    else {
      size_t v24 = v22;
    }
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>(a1, v24);
    unint64_t v13 = *(void *)(a1 + 8);
    if ((v13 & (v13 - 1)) != 0)
    {
      if (v10 >= v13) {
        unint64_t v4 = v10 % v13;
      }
      else {
        unint64_t v4 = v10;
      }
    }
    else
    {
      unint64_t v4 = (v13 - 1) & v10;
    }
  }
  uint64_t v25 = *(void *)a1;
  __n128 v26 = *(void **)(*(void *)a1 + 8 * v4);
  if (v26)
  {
    *(void *)uint64_t i = *v26;
LABEL_43:
    *__n128 v26 = i;
    goto LABEL_44;
  }
  *(void *)uint64_t i = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = i;
  *(void *)(v25 + 8 * v4) = a1 + 16;
  if (*(void *)i)
  {
    unint64_t v27 = *(void *)(*(void *)i + 8);
    if ((v13 & (v13 - 1)) != 0)
    {
      if (v27 >= v13) {
        v27 %= v13;
      }
    }
    else
    {
      v27 &= v13 - 1;
    }
    __n128 v26 = (void *)(*(void *)a1 + 8 * v27);
    goto LABEL_43;
  }
LABEL_44:
  ++*(void *)(a1 + 24);
  return i;
}

void sub_1A7D1C2FC(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *std::__hash_table<std::__hash_value_type<unsigned int,NSString * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,NSString * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,NSString * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,NSString * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::pair<unsigned int,NSString * {__strong}>>(uint64_t a1, unsigned int *a2, uint64_t a3)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = *a2;
      if (v7 <= v6) {
        unint64_t v3 = v6 % v7;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
    char v9 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      unint64_t v10 = *v9;
      if (*v9)
      {
        do
        {
          unint64_t v11 = v10[1];
          if (v11 == v6)
          {
            if (*((_DWORD *)v10 + 4) == v6) {
              return v10;
            }
          }
          else
          {
            if (v8.u32[0] > 1uLL)
            {
              if (v11 >= v7) {
                v11 %= v7;
              }
            }
            else
            {
              v11 &= v7 - 1;
            }
            if (v11 != v3) {
              break;
            }
          }
          unint64_t v10 = (void *)*v10;
        }
        while (v10);
      }
    }
  }
  int v12 = (void *)(a1 + 16);
  unint64_t v10 = operator new(0x20uLL);
  *unint64_t v10 = 0;
  v10[1] = v6;
  *((_DWORD *)v10 + 4) = *(_DWORD *)a3;
  uint64_t v13 = *(void *)(a3 + 8);
  *(void *)(a3 + _Block_object_dispose(&STACK[0x280], 8) = 0;
  v10[3] = v13;
  float v14 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v15 = *(float *)(a1 + 32);
  if (!v7 || (float)(v15 * (float)v7) < v14)
  {
    BOOL v16 = 1;
    if (v7 >= 3) {
      BOOL v16 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v17 = v16 | (2 * v7);
    unint64_t v18 = vcvtps_u32_f32(v14 / v15);
    if (v17 <= v18) {
      size_t v19 = v18;
    }
    else {
      size_t v19 = v17;
    }
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>(a1, v19);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6) {
        unint64_t v3 = v6 % v7;
      }
      else {
        unint64_t v3 = v6;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
  }
  uint64_t v20 = *(void *)a1;
  BOOL v21 = *(void **)(*(void *)a1 + 8 * v3);
  if (v21)
  {
    *unint64_t v10 = *v21;
LABEL_38:
    *BOOL v21 = v10;
    goto LABEL_39;
  }
  *unint64_t v10 = *v12;
  void *v12 = v10;
  *(void *)(v20 + 8 * v3) = v12;
  if (*v10)
  {
    unint64_t v22 = *(void *)(*v10 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v22 >= v7) {
        v22 %= v7;
      }
    }
    else
    {
      v22 &= v7 - 1;
    }
    BOOL v21 = (void *)(*(void *)a1 + 8 * v22);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return v10;
}

void sub_1A7D1C54C(_Unwind_Exception *a1)
{
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned int,NSString * {__strong}>,void *>>>::operator()[abi:ne180100](v2, v1);
  _Unwind_Resume(a1);
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned int,NSString * {__strong}>,void *>>>::operator()[abi:ne180100](uint64_t a1, id *a2)
{
  if (*(unsigned char *)(a1 + 8))
  {
  }
  else if (!a2)
  {
    return;
  }

  operator delete(a2);
}

uint64_t std::__hash_table<std::__hash_value_type<unsigned int,NSString * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,NSString * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,NSString * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,NSString * {__strong}>>>::~__hash_table(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<unsigned int,NSString * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,NSString * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,NSString * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,NSString * {__strong}>>>::__deallocate_node(a1, *(id **)(a1 + 16));
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<unsigned int,NSString * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,NSString * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,NSString * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,NSString * {__strong}>>>::__deallocate_node(uint64_t a1, id *a2)
{
  if (a2)
  {
    uint64_t v2 = a2;
    do
    {
      unint64_t v3 = (id *)*v2;

      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
}

uint64_t compareRange(void *a1, void *a2)
{
  if (*a1 >= *a2) {
    unsigned int v2 = 0;
  }
  else {
    unsigned int v2 = -1;
  }
  if (*a1 > *a2) {
    return 1;
  }
  else {
    return v2;
  }
}

void RangeArrayInsertRangeAtIndex(void *a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  unint64_t v7 = a1;
  unsigned int v8 = v7[2];
  float v14 = v7;
  if (v8 >= v7[6])
  {
    unsigned int v9 = (3 * v8 + 3) >> 1;
    v7[6] = v9;
    *((void *)v7 + 2) = malloc_type_realloc(*((void **)v7 + 2), 16 * v9, 0x1000040451B5BE8uLL);
    unint64_t v7 = v14;
    unsigned int v8 = v14[2];
  }
  unsigned int v10 = v8 - a4;
  uint64_t v11 = a4;
  if (v10)
  {
    uint64_t v12 = *((void *)v7 + 2) + 16 * a4;
    memmove((void *)(v12 + 16), (const void *)v12, 16 * v10);
    unint64_t v7 = v14;
    a4 = v14[2];
  }
  uint64_t v13 = (void *)(*((void *)v7 + 2) + 16 * v11);
  *uint64_t v13 = a2;
  v13[1] = a3;
  v7[2] = a4 + 1;
}

void RangeArrayRemoveRangeAtIndex(void *a1, unsigned int a2)
{
  unint64_t v3 = a1;
  unsigned int v4 = v3[2];
  if (v4 > a2)
  {
    int v5 = v4 - 1;
    if (v4 - 1 > a2)
    {
      unint64_t v7 = v3;
      uint64_t v6 = *((void *)v3 + 2) + 16 * a2;
      memmove((void *)v6, (const void *)(v6 + 16), 16 * (v4 + ~a2));
      unint64_t v3 = v7;
      int v5 = v7[2] - 1;
    }
    v3[2] = v5;
  }
}

uint64_t VMUIsMetaclass(void *a1, void *a2, int a3, uint64_t a4)
{
  id v7 = a1;
  id v8 = a2;
  if (a3)
  {
    unsigned int v9 = (unsigned char *)_classDataRWV1ofClass(v7, v8, a4);
  }
  else
  {
    uint64_t v10 = _classDataRWV0ofClass(v7, v8, a4);
    if (!v10)
    {
LABEL_7:
      uint64_t v11 = 0;
      goto LABEL_8;
    }
    unsigned int v9 = (unsigned char *)(*((uint64_t (**)(id, void, uint64_t))v8 + 2))(v8, *(void *)(v10 + 8), 4);
  }
  if (!v9) {
    goto LABEL_7;
  }
  uint64_t v11 = *v9 & 1;
LABEL_8:

  return v11;
}

void sub_1A7D1D6F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _classDataRWV0ofClass(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  uint64_t v6 = a2;
  uint64_t v7 = _classDataRWAddressofClass(v5, (uint64_t)v6, a3);
  if (v7) {
    uint64_t v8 = v6[2](v6, v7, 64);
  }
  else {
    uint64_t v8 = 0;
  }

  return v8;
}

void sub_1A7D1D790(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _classDataRWV1ofClass(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  uint64_t v6 = a2;
  uint64_t v7 = _classDataRWAddressofClass(v5, (uint64_t)v6, a3);
  if (v7) {
    uint64_t v8 = v6[2](v6, v7, 32);
  }
  else {
    uint64_t v8 = 0;
  }

  return v8;
}

void sub_1A7D1D824(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t VMUGetNextSiblingOfClass(void *a1, void *a2, int a3, uint64_t a4)
{
  id v7 = a1;
  id v8 = a2;
  if (!a3)
  {
    uint64_t v11 = _classDataRWV0ofClass(v7, v8, a4);
    if (v11)
    {
      uint64_t v10 = (uint64_t *)(v11 + 48);
      goto LABEL_6;
    }
LABEL_7:
    uint64_t v12 = 0;
    goto LABEL_8;
  }
  uint64_t v9 = _classDataRWV1ofClass(v7, v8, a4);
  if (!v9) {
    goto LABEL_7;
  }
  uint64_t v10 = (uint64_t *)(v9 + 24);
LABEL_6:
  uint64_t v12 = *v10;
LABEL_8:

  return v12;
}

void sub_1A7D1D8C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t VMUGetFirstSubclassOfClass(void *a1, void *a2, int a3, uint64_t a4)
{
  id v7 = a1;
  id v8 = a2;
  if (!a3)
  {
    uint64_t v11 = _classDataRWV0ofClass(v7, v8, a4);
    if (v11)
    {
      uint64_t v10 = (uint64_t *)(v11 + 40);
      goto LABEL_6;
    }
LABEL_7:
    uint64_t v12 = 0;
    goto LABEL_8;
  }
  uint64_t v9 = _classDataRWV1ofClass(v7, v8, a4);
  if (!v9) {
    goto LABEL_7;
  }
  uint64_t v10 = (uint64_t *)(v9 + 16);
LABEL_6:
  uint64_t v12 = *v10;
LABEL_8:

  return v12;
}

void sub_1A7D1D970(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id VMUGetClassNameFromClassDataRO(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  uint64_t v6 = a2;
  uint64_t v7 = v6[2](v6, a3, 72);
  if (v7
    && ([v5 memoryCache],
        id v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = (const char *)[v8 peekStringAtAddress:*(void *)(v7 + 24)],
        v8,
        v9))
  {
    if (!strncmp(v9, "_Tt", 3uLL)) {
      demangleSwiftClassName(v9);
    }
    else {
    uint64_t v10 = [NSString stringWithUTF8String:v9];
    }
    if (*(unsigned char *)v7)
    {
      uint64_t v11 = [NSString stringWithFormat:@"metaclass for %@", v10];

      uint64_t v10 = (void *)v11;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

void sub_1A7D1DAAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id demangleSwiftClassName(const char *a1)
{
  uint64_t v1 = CSDemangleSymbolName();
  if (v1)
  {
    unsigned int v2 = (void *)v1;
    unint64_t v3 = (void *)[[NSString alloc] initWithUTF8String:v1];
    free(v2);
    if (demangleSwiftClassName(char const*)::onceToken != -1) {
      dispatch_once(&demangleSwiftClassName(char const*)::onceToken, &__block_literal_global_442);
    }
    id v4 = v3;
    id v5 = v4;
    if ([::s_removeUUIDRegex numberOfMatchesInString:v4 options:0 range:[v4 length]])
    {
      uint64_t v6 = [::s_removeUUIDRegex stringByReplacingMatchesInString:v4 options:0 range:NSMakeRange(0, [v4 length]) withTemplate:@"$1"];

      id v5 = (id)v6;
    }
    if ([::s_unsuffixRegex numberOfMatchesInString:v5 options:0 range:NSMakeRange(0, [v5 length])])
    {
      uint64_t v7 = [((id)demangleSwiftClassName(char const*)::s_unsuffixRegex) stringByReplacingMatchesInString:v5 options:0 range:NSMakeRange(0, [v5 length]) withTemplate:@"$1"];

      id v5 = (id)v7;
    }
    if ([::s_demodularRegex numberOfMatchesInString:v5 options:0 range:NSMakeRange(0, [v5 length])])
    {
      uint64_t v8 = [::s_demodularRegex stringByReplacingMatchesInString:v5 options:0 range:NSMakeRange(0, [v5 length]) withTemplate:@"$2"];

      id v5 = (id)v8;
    }
    if (v5 != v4)
    {
      id v9 = v5;

      id v4 = v9;
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

void sub_1A7D1DCD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id VMUGetClassNameFromClassDataExtRW(void *a1, void *a2, int a3, uint64_t a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = v8;
  if (a3
    && (uint64_t v10 = (uint64_t *)(*((uint64_t (**)(id, unint64_t, uint64_t))v8 + 2))(v8, a4 & 0xFFFFFFFFFFFFFFFELL, 48)) != 0)
  {
    uint64_t v11 = -[VMUTask ptrauthStripDataPointer:]((uint64_t)v7, *v10);
    uint64_t v12 = VMUGetClassNameFromClassDataRO(v7, v9, v11);
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

void sub_1A7D1DD90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id VMUGetClassNameFromClassDataRW(void *a1, void *a2, int a3, uint64_t a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = v8;
  uint64_t v10 = v8[2];
  if (a3)
  {
    uint64_t v11 = v10(v8, a4, 32);
    if (!v11) {
      goto LABEL_10;
    }
    uint64_t v12 = -[VMUTask ptrauthStripDataPointer:]((uint64_t)v7, *(void *)(v11 + 8));
    if (v12)
    {
      uint64_t v13 = VMUGetClassNameFromClassDataExtRW(v7, v9, a3, v12);
LABEL_9:
      float v15 = (void *)v13;
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v14 = v10(v8, a4, 64);
    if (!v14) {
      goto LABEL_10;
    }
    uint64_t v12 = *(void *)(v14 + 8);
  }
  if (v12)
  {
    uint64_t v13 = VMUGetClassNameFromClassDataRO(v7, v9, v12);
    goto LABEL_9;
  }
LABEL_10:
  float v15 = 0;
LABEL_11:

  return v15;
}

void sub_1A7D1DE8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id VMUGetClassNameFromClassStructure(void *a1, void *a2, int a3, uint64_t a4)
{
  id v7 = a1;
  id v8 = a2;
  uint64_t v9 = _classDataRWAddressofClass(v7, (uint64_t)v8, a4);
  if (v9)
  {
    uint64_t v10 = VMUGetClassNameFromClassDataRW(v7, v8, a3, v9);
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

void sub_1A7D1DF40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _classDataRWAddressofClass(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  uint64_t v6 = (uint64_t *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a2 + 16))(a2, a3 + 32, 8);
  if (v6) {
    uint64_t v7 = *v6;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = -[VMUTask ptrauthStripDataPointer:]((uint64_t)v5, v7) & 0x7FFFFFFFFFF8;

  return v8;
}

void sub_1A7D1DFC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7D1E328(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A7D1E3C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A7D1E44C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A7D1E4E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t debugSwiftSubfieldIsEnabled()
{
  if (debugSwiftSubfieldIsEnabled::dispatchToken != -1) {
    dispatch_once(&debugSwiftSubfieldIsEnabled::dispatchToken, &__block_literal_global_29);
  }
  return debugSwiftSubfieldIsEnabled::isEnabled;
}

void __debugSwiftSubfieldIsEnabled_block_invoke()
{
  if (_debugSwiftSubfieldEnvironmentVariableIsEnabled("SYMBOLICATION_DEBUG_SWIFT_SUBFIELDS"))
  {
    BOOL v0 = 1;
  }
  else
  {
    if (_debugRemoteMirrorOutputForSwiftSubfieldIsEnabled(void)::dispatchToken != -1) {
      dispatch_once(&_debugRemoteMirrorOutputForSwiftSubfieldIsEnabled(void)::dispatchToken, &__block_literal_global_462);
    }
    BOOL v0 = _debugRemoteMirrorOutputForSwiftSubfieldIsEnabled(void)::isEnabled != 0;
  }
  debugSwiftSubfieldIsEnabled::isEnabled = v0;
}

char *_debugSwiftSubfieldEnvironmentVariableIsEnabled(const char *a1)
{
  uint64_t result = getenv(a1);
  if (result)
  {
    unsigned int v2 = result;
    if (!strcmp(result, "YES")) {
      return (char *)1;
    }
    else {
      return (char *)(strcmp(v2, "1") == 0);
    }
  }
  return result;
}

void sub_1A7D1E7AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7D1E884(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7D1EBEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void _debugSwiftSubfieldDumpSwiftChildInfo(int a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (*(void *)a3) {
    uint64_t v8 = *(const char **)a3;
  }
  else {
    uint64_t v8 = "NULL";
  }
  int v9 = *(_DWORD *)(a3 + 8);
  uint64_t v10 = nameOfSwiftLayoutKind(*(_DWORD *)(a3 + 12));
  uint64_t v11 = v10;
  uint64_t v12 = *(const void **)(a3 + 16);
  if (v12)
  {
    vmu_swift_reflection_interop_copyDemangledNameForTypeRef(a4, *(void *)(a3 + 16), *(void *)(a3 + 24));
    id v13 = objc_claimAutoreleasedReturnValue();
    _debugSwiftAsyncPrintf(a1, "%s gave { .name = \"%s\", .Offset = %u, .Kind = %s, .TR = { .Typeref = %p (type %s), .Library = %d } }\n", a2, v8, v9, v11, v12, (const char *)[v13 UTF8String], *(_DWORD *)(a3 + 24));
  }
  else
  {
    _debugSwiftAsyncPrintf(a1, "%s gave { .name = \"%s\", .Offset = %u, .Kind = %s, .TR = { .Typeref = %p (type %s), .Library = %d } }\n", a2, v8, v9, v10, 0, "?", *(_DWORD *)(a3 + 24));
  }
}

void sub_1A7D1ED4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id a16)
{
  _Unwind_Resume(a1);
}

id _createFieldInfoFromChild(uint64_t *a1, const char *a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, void *a7, void *a8, unsigned char *a9, int a10)
{
  int v11 = a6;
  id v16 = a9;
  uint64_t v31 = a5;
  uint64_t v32 = a6;
  id v17 = a7;
  id v18 = a8;
  if (!a4 || a4 >= 19)
  {
    if (a4)
    {
      unint64_t v22 = "has invalid kind";
    }
    else
    {
      *a9 = 1;
      unint64_t v22 = "has kind SWIFT_UNKNOWN";
    }
    if (debugSwiftSubfieldIsEnabled::dispatchToken != -1) {
      dispatch_once(&debugSwiftSubfieldIsEnabled::dispatchToken, &__block_literal_global_29);
    }
    if (debugSwiftSubfieldIsEnabled::isEnabled)
    {
      if (!a5)
      {
        _debugSwiftAsyncPrintf(a10, "Bailing because field \"%s\" (type %s) %s\n", a2, "?", v22);
        if (a4) {
          goto LABEL_22;
        }
        goto LABEL_28;
      }
      vmu_swift_reflection_interop_copyDemangledNameForTypeRef(*a1, a5, v11);
      id v16 = objc_claimAutoreleasedReturnValue();
      _debugSwiftAsyncPrintf(a10, "Bailing because field \"%s\" (type %s) %s\n", a2, (const char *)[v16 UTF8String], v22);
    }
    if (a4)
    {
LABEL_22:
      id v21 = 0;
      goto LABEL_23;
    }
LABEL_28:
    if (_logSwiftUnknownFieldsIsEnabled(void)::onceToken != -1) {
      dispatch_once(&_logSwiftUnknownFieldsIsEnabled(void)::onceToken, &__block_literal_global_508);
    }
    if (_logSwiftUnknownFieldsIsEnabled(void)::isEnabled)
    {
      size_t v24 = (FILE *)*MEMORY[0x1E4F143C8];
      if (a5)
      {
        vmu_swift_reflection_interop_copyDemangledNameForTypeRef(*a1, a5, v11);
        id v16 = objc_claimAutoreleasedReturnValue();
        uint64_t v25 = (const char *)[v16 UTF8String];
      }
      else
      {
        uint64_t v25 = "?";
      }
      fprintf(v24, "Found SWIFT_UNKNOWN field \"%s\" (type %s) in class %s\n", a2, v25, (const char *)[v18 UTF8String]);
      if (a5) {
    }
      }
    goto LABEL_22;
  }
  if (a2) {
    size_t v19 = a2;
  }
  else {
    size_t v19 = "";
  }
  unint64_t v27 = v19;
  uint64_t v20 = [v17 swiftFieldWithName:v18 offset:v19 kind:v20 typeref:v21];
  if (v20)
  {
    if (debugSwiftSubfieldIsEnabled::dispatchToken != -1) {
      dispatch_once(&debugSwiftSubfieldIsEnabled::dispatchToken, &__block_literal_global_29);
    }
    if (debugSwiftSubfieldIsEnabled::isEnabled) {
      _debugSwiftAsyncPrintf(a10, "Found cached field \"%s\"\n", v27);
    }
    id v21 = v20;
  }
  else
  {
    if (_createFieldInfoFromChild(libSwiftRemoteMirrorWrapper *,char const*,unsigned int,swift_layout_kind,swift_typeref_interop,VMUClassInfoMap *,unsigned int,NSString *,BOOL *,unsigned int)::dispatchEnumConfigOnceToken != -1) {
      dispatch_once(&_createFieldInfoFromChild(libSwiftRemoteMirrorWrapper *,char const*,unsigned int,swift_layout_kind,swift_typeref_interop,VMUClassInfoMap *,unsigned int,NSString *,BOOL *,unsigned int)::dispatchEnumConfigOnceToken, &__block_literal_global_491);
    }
    uint64_t v28 = 0;
    uint64_t v29 = 0;
    int v30 = 0;
    vmu_swift_reflection_infoForTypeRef(*a1, a5, v11);
    if (_debugRemoteMirrorOutputForSwiftSubfieldIsEnabled(void)::dispatchToken != -1) {
      dispatch_once(&_debugRemoteMirrorOutputForSwiftSubfieldIsEnabled(void)::dispatchToken, &__block_literal_global_462);
    }
    if (_debugRemoteMirrorOutputForSwiftSubfieldIsEnabled(void)::isEnabled)
    {
      __n128 v26 = nameOfSwiftLayoutKind(v28);
      _debugSwiftAsyncPrintf(a10, "infoForTypeRef() gave { .Kind = %s, .Size = %u, .Alignment = %u, .Stride = %u, .NumFields = %u}\n", v26, HIDWORD(v28), v29, HIDWORD(v29), v30);
    }
    id v21 = 0;
    *a9 = 1;
  }

LABEL_23:

  return v21;
}

void sub_1A7D1F60C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7D1F790(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7D1F810(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7D201DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t VMUGetClassDataROofClass(void *a1, void *a2, int a3, uint64_t a4)
{
  id v7 = a1;
  id v8 = a2;
  if (!a3)
  {
    uint64_t v14 = _classDataRWV0ofClass(v7, v8, a4);
    if (v14)
    {
      if ((*(_WORD *)(v14 + 2) & 0xC008) != 0)
      {
        uint64_t v11 = *(void *)(v14 + 8);
        goto LABEL_13;
      }
LABEL_11:
      uint64_t v13 = _classDataRWAddressofClass(v7, (uint64_t)v8, a4);
      goto LABEL_12;
    }
LABEL_10:
    uint64_t v11 = 0;
    goto LABEL_13;
  }
  uint64_t v9 = _classDataRWV1ofClass(v7, v8, a4);
  if (!v9) {
    goto LABEL_10;
  }
  if ((*(_WORD *)(v9 + 2) & 0xC008) == 0) {
    goto LABEL_11;
  }
  uint64_t v10 = -[VMUTask ptrauthStripDataPointer:]((uint64_t)v7, *(void *)(v9 + 8));
  uint64_t v11 = v10;
  if (v10)
  {
    uint64_t v12 = (uint64_t *)(*((uint64_t (**)(id, unint64_t, uint64_t))v8 + 2))(v8, v10 & 0xFFFFFFFFFFFFFFFELL, 48);
    if (v12)
    {
      uint64_t v13 = -[VMUTask ptrauthStripDataPointer:]((uint64_t)v7, *v12);
LABEL_12:
      uint64_t v11 = v13;
      goto LABEL_13;
    }
    goto LABEL_10;
  }
LABEL_13:

  return v11;
}

void sub_1A7D20404(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _swiftFieldsForClass(const void *a1, NSString *a2, libSwiftRemoteMirrorWrapper *a3, VMUClassInfoMap *a4)
{
  uint64_t v13 = a2;
  uint64_t v12 = a4;
  id v7 = (id)objc_opt_new();
  uint64_t v9 = vmu_swift_reflection_interop_lookupMetadata((uint64_t)a3->var0, a1);
  if (v9)
  {
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    int v16 = 0;
    vmu_swift_reflection_infoForMetadata((uint64_t)a3->var0, (uint64_t)v9, v8);
    if (debugSwiftSubfieldIsEnabled::dispatchToken != -1) {
      dispatch_once(&debugSwiftSubfieldIsEnabled::dispatchToken, &__block_literal_global_29);
    }
    if (debugSwiftSubfieldIsEnabled::isEnabled)
    {
      [(NSString *)v13 UTF8String];
      _debugSwiftAsyncPrintf(0, "Failed to get info for metadata of class %s\n\n");
    }
    id v7 = v7;
    uint64_t v10 = v7;
  }
  else
  {
    if (debugSwiftSubfieldIsEnabled::dispatchToken != -1) {
      dispatch_once(&debugSwiftSubfieldIsEnabled::dispatchToken, &__block_literal_global_29);
    }
    if (debugSwiftSubfieldIsEnabled::isEnabled) {
      _debugSwiftAsyncPrintf(0, "Failed to look up metadata for class %s\n\n", [(NSString *)v13 UTF8String]);
    }
    uint64_t v10 = 0;
  }

  return v10;
}

void sub_1A7D20744(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

void _destroyLocalIvar(objc_ivar *a1)
{
  if (a1)
  {
    if (*((unsigned char *)a1 + 32))
    {
      unsigned int v2 = (void *)*((void *)a1 + 1);
      if (v2)
      {
        free(v2);
        *((void *)a1 + 1) = 0;
      }
      unint64_t v3 = (void *)*((void *)a1 + 2);
      if (v3)
      {
        free(v3);
        *((void *)a1 + 2) = 0;
      }
    }
    if (*(void *)a1) {
      free(*(void **)a1);
    }
    free(a1);
  }
}

unint64_t copy_remote_layout_at(unint64_t a1, void *a2)
{
  unint64_t v3 = a2;
  if (a1)
  {
    unsigned int v4 = 0;
    LODWORD(v5) = 0;
    uint64_t v6 = 0;
    id v7 = (_DWORD *)MEMORY[0x1E4F14B00];
    uint64_t v8 = *MEMORY[0x1E4F14B00] - ((*MEMORY[0x1E4F14B00] + 0xFFFFFFFFLL) & a1);
    while (1)
    {
      uint64_t v9 = v8;
      uint64_t v10 = (const char *)v3[2](v3, (void *)a1, v8);
      if (!v10)
      {
        if (v6) {
          free(v6);
        }
LABEL_9:
        a1 = 0;
        goto LABEL_11;
      }
      size_t v5 = (v5 + v8);
      uint64_t v11 = reallocf(v6, v5);
      if (!v11) {
        goto LABEL_9;
      }
      uint64_t v6 = v11;
      strncpy((char *)v11 + v4, v10, v8);
      uint64_t v12 = (v5 - 1);
      if (!*((unsigned char *)v6 + v12)) {
        break;
      }
      v4 += v8;
      LODWORD(v_Block_object_dispose(&STACK[0x280], 8) = *v7;
      a1 += v9;
    }
    *((unsigned char *)v6 + v12) = 0;
    size_t v13 = strlen((const char *)v6);
    a1 = (unint64_t)reallocf(v6, v13 + 1);
  }
LABEL_11:

  return a1;
}

void sub_1A7D20910(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7D20CB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void sub_1A7D20EAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)VMUClassInfo;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1A7D213F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, void *a20,void *a21,void *a22,void *a23)
{
  _Unwind_Resume(a1);
}

unint64_t VMUGetClassDataExtOfClass(void *a1, void *a2, int a3, uint64_t a4)
{
  id v7 = a1;
  id v8 = a2;
  if (a3 && (uint64_t v9 = _classDataRWV1ofClass(v7, v8, a4)) != 0)
  {
    uint64_t v10 = -[VMUTask ptrauthStripDataPointer:]((uint64_t)v7, *(void *)(v9 + 8));
    unint64_t v11 = v10 & (v10 << 63 >> 63) & 0xFFFFFFFFFFFFFFFELL;
  }
  else
  {
    unint64_t v11 = 0;
  }

  return v11;
}

void sub_1A7D21590(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7D2173C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

unint64_t maskPointerToMethodList(uint64_t a1, unint64_t a2, VMUTaskMemoryScanner *a3)
{
  size_t v5 = a3;
  uint64_t v6 = v5;
  if (HIBYTE(a2))
  {
    a2 &= 0xFFFFFFFFFFFFFFuLL;
    [(VMUTaskMemoryScanner *)v5 setClassStructureFieldScanValueAtSourceAddress:a1 toCorrectedAddress:a2];
  }

  return a2;
}

void sub_1A7D217A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7D218E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7D21D74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *_createLocalIvar(const char *a1, const char *a2, int a3, int a4, char a5)
{
  uint64_t v10 = malloc_type_malloc(0x28uLL, 0x1050040749D65F6uLL);
  v10[1] = a1;
  v10[2] = a2;
  unint64_t v11 = malloc_type_malloc(4uLL, 0x100004052888210uLL);
  *uint64_t v10 = v11;
  *unint64_t v11 = a3;
  *((_DWORD *)v10 + 7) = a4;
  *((unsigned char *)v10 + 32) = a5;
  return v10;
}

void sub_1A7D21E8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7D221D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *_decodeNullTerminatedBytes(NSCoder *a1)
{
  uint64_t v1 = a1;
  unsigned int v4 = 0;
  [(NSCoder *)v1 decodeValueOfObjCType:"I" at:&v4 size:4];
  if (v4)
  {
    unsigned int v2 = malloc_type_calloc(v4 + 1, 1uLL, 0x100004077774924uLL);
    [(NSCoder *)v1 decodeArrayOfObjCType:"c" count:v4 at:v2];
  }
  else
  {
    unsigned int v2 = 0;
  }

  return v2;
}

void sub_1A7D22298(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7D22450(_Unwind_Exception *a1)
{
  if (v9 != v3) {
  _Unwind_Resume(a1);
  }
}

void sub_1A7D2281C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21)
{
  _Unwind_Resume(a1);
}

id _formatIvar(VMUFieldInfo *a1, uint64_t a2)
{
  unint64_t v3 = a1;
  unsigned int v4 = VMUScanTypeKeywordDescription([(VMUFieldInfo *)v3 scanType]);
  if (*v4) {
    size_t v5 = " ";
  }
  else {
    size_t v5 = "";
  }
  BOOL v6 = [(VMUFieldInfo *)v3 isCapture];
  id v7 = NSString;
  if (v6)
  {
    uint64_t v8 = [(VMUFieldInfo *)v3 offset];
    BOOL v9 = [(VMUFieldInfo *)v3 isByref];
    uint64_t v10 = "__block ";
    if (!v9) {
      uint64_t v10 = "";
    }
    unint64_t v11 = [v7 stringWithFormat:@"%+*d: %s%s%s[capture]", a2, v8, v10, v4, v5];
  }
  else
  {
    uint64_t v12 = [(VMUFieldInfo *)v3 offset];
    id v21 = [(VMUFieldInfo *)v3 typeName];
    size_t v13 = (unsigned __int8 *)[v21 UTF8String];
    id v20 = [(VMUFieldInfo *)v3 ivarName];
    uint64_t v14 = descriptionForTypeEncoding(v13, [v20 UTF8String]);
    uint64_t v15 = [(VMUFieldInfo *)v3 destinationLayout];
    if (v15)
    {
      int v16 = NSString;
      size_t v19 = [(VMUFieldInfo *)v3 destinationLayout];
      size_t v13 = [v19 className];
      id v17 = [v16 stringWithFormat:@"  [->%@]", v13];
    }
    else
    {
      id v17 = &stru_1EFE27F38;
    }
    unint64_t v11 = [v7 stringWithFormat:@"%*u: %s%s%@;%@", a2, v12, v4, v5, v14, v17];
    if (v15)
    {
    }
  }

  return v11;
}

void sub_1A7D22A7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_1A7D22D1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7D22F70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v8 - 96), 8);
  _Unwind_Resume(a1);
}

void _processExtendedLayout(unint64_t a1, void *a2)
{
  unint64_t v3 = a2;
  BOOL v9 = v3;
  if (a1 >= 0x1000)
  {
    unsigned int v4 = *(unsigned __int8 *)a1;
    if (*(unsigned char *)a1)
    {
      size_t v5 = (unsigned __int8 *)(a1 + 1);
      do
      {
        uint64_t v6 = 0;
        uint64_t v7 = 1;
        switch(v4 >> 4)
        {
          case 2u:
            goto LABEL_10;
          case 3u:
            uint64_t v6 = 0;
            uint64_t v7 = 2;
            goto LABEL_10;
          case 4u:
            uint64_t v6 = 1;
            goto LABEL_10;
          case 5u:
            uint64_t v6 = 0;
            uint64_t v7 = 4;
            goto LABEL_10;
          case 6u:
            uint64_t v6 = 0;
            uint64_t v7 = 8;
LABEL_10:
            v9[2](v9, v7, v6, (v4 & 0xF) + 1);
            break;
          default:
            break;
        }
        unsigned int v8 = *v5++;
        unsigned int v4 = v8;
      }
      while (v8);
    }
  }
  else
  {
    v3[2](v3, 2, 0, (a1 >> 8) & 0xF);
    v9[2](v9, 1, 1, a1 >> 4);
    v9[2](v9, 4, 0, a1 & 0xF);
  }
}

void sub_1A7D230D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A7D23218(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *VMUClassInfoComplexVariantEvaluatorCombineHashes(void *result, uint64_t a2)
{
  *uint64_t result = a2 + 37 * *result;
  return result;
}

void sub_1A7D23BF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7D23DEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7D23EA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7D24104(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7D24184(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A7D24208(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A7D247A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,id a40,char a41)
{
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose((const void *)(v42 - 256), 8);

  _Unwind_Resume(a1);
}

void sub_1A7D24974(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A7D24B40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A7D24CE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1A7D24DBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1A7D24EC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7D24F3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A7D24FAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A7D25058(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7D25510(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7D25650(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Unwind_Resume(a1);
}

void sub_1A7D25704(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A7D25820(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_1A7D258E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A7D25990(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A7D25AA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7D25C74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7D25DE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A7D25ECC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A7D25FBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A7D260C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A7D2634C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A7D2644C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A7D2660C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  _Block_object_dispose((const void *)(v18 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1A7D266E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A7D267AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7D26944(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7D26D34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A7D26DF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A7D26E8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A7D26FB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1A7D270B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7D271F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_1A7D272CC(_Unwind_Exception *a1)
{
  unint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1A7D273E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7D27480(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZL22demangleSwiftClassNamePKc_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"\\((.+) in _([0-9A-Z]+)\\)" options:0 error:0];
  uint64_t v1 = (void *)demangleSwiftClassName(char const*)::s_removeUUIDRegex;
  demangleSwiftClassName(char const*)::s_removeUUIDRegex = v0;

  uint64_t v2 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"^([0-9a-zA-Z]+)\\.([0-9a-zA-Z].+)" options:0 error:0];
  unint64_t v3 = (void *)demangleSwiftClassName(char const*)::s_demodularRegex;
  demangleSwiftClassName(char const*)::s_demodularRegex = v2;

  uint64_t v4 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"^(.+) with unmangled suffix (.+)" options:0 error:0];
  size_t v5 = (void *)demangleSwiftClassName(char const*)::s_unsuffixRegex;
  demangleSwiftClassName(char const*)::s_unsuffixRegex = v4;
}

char *___ZL49_debugRemoteMirrorOutputForSwiftSubfieldIsEnabledv_block_invoke()
{
  uint64_t result = _debugSwiftSubfieldEnvironmentVariableIsEnabled("SYMBOLICATION_DEBUG_REMOTE_MIRROR_OUTPUT_FOR_SWIFT_SUBFIELDS");
  _debugRemoteMirrorOutputForSwiftSubfieldIsEnabled(void)::isEnabled = (char)result;
  return result;
}

const char *nameOfSwiftLayoutKind(int a1)
{
  if ((a1 - 1) > 0x11) {
    return "SWIFT_UNKNOWN";
  }
  else {
    return off_1E5D242D0[a1 - 1];
  }
}

void ___ZL25_createFieldInfoFromChildP27libSwiftRemoteMirrorWrapperPKcj17swift_layout_kind21swift_typeref_interopP15VMUClassInfoMapjP8NSStringPbj_block_invoke()
{
  _createFieldInfoFromChild(libSwiftRemoteMirrorWrapper *,char const*,unsigned int,swift_layout_kind,swift_typeref_interop,VMUClassInfoMap *,unsigned int,NSString *,BOOL *,unsigned int)::preciselyScanSinglePayloadEnums = getenv("DT_PRECISELY_SCAN_SWIFT_SINGLE_PAYLOAD_ENUMS") != 0;
  _createFieldInfoFromChild(libSwiftRemoteMirrorWrapper *,char const*,unsigned int,swift_layout_kind,swift_typeref_interop,VMUClassInfoMap *,unsigned int,NSString *,BOOL *,unsigned int)::preciselyScanMultiPayloadEnums = getenv("DT_DO_NOT_PRECISELY_SCAN_SWIFT_MULTI_PAYLOAD_ENUMS") == 0;
  uint64_t v0 = [(VMUFieldInfo *)[VMUMutableFieldInfo alloc] initWithName:@"Dummy no payload field" type:0 scan:0 offset:0 size:0];
  uint64_t v1 = (void *)swiftEnumDummyNoPayloadSubField;
  swiftEnumDummyNoPayloadSubField = (uint64_t)v0;
}

char *___ZL31_logSwiftUnknownFieldsIsEnabledv_block_invoke()
{
  uint64_t result = _debugSwiftSubfieldEnvironmentVariableIsEnabled("SYMBOLICATION_LOG_SWIFT_UNKNOWN_FIELDS");
  _logSwiftUnknownFieldsIsEnabled(void)::isEnabled = (char)result;
  return result;
}

uint64_t _classDataExtV1ofClass(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  unint64_t v7 = VMUGetClassDataExtOfClass(v5, v6, 1, a3);
  if (v7) {
    uint64_t v8 = (*((uint64_t (**)(id, unint64_t, uint64_t))v6 + 2))(v6, v7 & 0xFFFFFFFFFFFFFFFELL, 48);
  }
  else {
    uint64_t v8 = 0;
  }

  return v8;
}

void sub_1A7D276E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7D28D44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void VMUMarkObject(void *a1)
{
  unint64_t v1 = a1;
  uint64_t v2 = (void *)v1;
  if (v1 && (s_markingDisabled & 1) == 0 && (*MEMORY[0x1E4FBA8D8] & v1) == 0)
  {
    id v3 = (id)v1;
    if (_retainCount_onceToken != -1) {
      dispatch_once(&_retainCount_onceToken, &__block_literal_global_11);
    }
    if ([v3 retainCount] == (id)-1)
    {

      goto LABEL_4;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      NSClassFromString(&cfstr_Nsmallocblock.isa);
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0) {
        goto LABEL_4;
      }
    }
    else
    {
    }
    id v5 = objc_getAssociatedObject(v3, "__VMUAssociatedObjectsObjcAbandonedMarkerKey");

    if (!v5)
    {
      id v6 = objc_opt_new();
      uint64_t v10 = 0;
      unint64_t v11 = &v10;
      uint64_t v12 = 0x2020000000;
      int v13 = 0;
      uint64_t v8 = 0;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = ___addEntryToMarkingRegion_block_invoke;
      v9[3] = &unk_1E5D24498;
      v9[4] = &v10;
      v9[5] = v2;
      v9[6] = &v8;
      _singleThreadedMarking(v9);
      uint64_t v7 = *((unsigned int *)v11 + 6);
      _Block_object_dispose(&v10, 8);
      [v6 setEntryIndex:v7];
      [v6 setRegion:v8];
      objc_setAssociatedObject(v3, "__VMUAssociatedObjectsObjcAbandonedMarkerKey", v6, (void *)0x301);
    }
  }
LABEL_4:
}

void sub_1A7D295B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _VMUEnumerateMarkedObjects(void *a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = (void (**)(void, void))v1;
  if (s_markingDisabled)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v18 = 0;
    size_t v19 = &v18;
    uint64_t v20 = 0x2020000000;
    int v21 = 0;
    if (v1) {
      uint64_t v4 = objc_opt_new();
    }
    else {
      uint64_t v4 = 0;
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = ___VMUEnumerateMarkedObjects_block_invoke;
    v15[3] = &unk_1E5D24450;
    id v17 = &v18;
    id v5 = v4;
    id v16 = v5;
    _singleThreadedMarking(v15);
    if (v2)
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      id v6 = v5;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v22 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v12;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v12 != v8) {
              objc_enumerationMutation(v6);
            }
            v2[2](v2, *(void *)(*((void *)&v11 + 1) + 8 * i));
          }
          uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v22 count:16];
        }
        while (v7);
      }
    }
    uint64_t v3 = *((unsigned int *)v19 + 6);

    _Block_object_dispose(&v18, 8);
  }

  return v3;
}

void sub_1A7D297A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _singleThreadedMarking(void *a1)
{
  id v1 = a1;
  if (_singleThreadedMarking_onceToken != -1)
  {
    uint64_t v8 = v1;
    dispatch_once(&_singleThreadedMarking_onceToken, &__block_literal_global_33);
    id v1 = v8;
  }
  if ((s_markingDisabled & 1) == 0)
  {
    uint64_t v7 = v1;
    uint64_t v2 = _singleThreadedMarking_s_markingLock;
    dispatch_time_t v3 = dispatch_time(0, 1000000000);
    if (dispatch_semaphore_wait(v2, v3))
    {
      uint64_t v4 = (FILE *)*MEMORY[0x1E4F143C8];
      id v5 = getprogname();
      pid_t v6 = getpid();
      fprintf(v4, "%s[%d]: warning: memory marking timeout encountered - marked objects may be incorrect from this point forward\n", v5, v6);
      s_markingDisabled = 1;
    }
    else if ((s_markingDisabled & 1) == 0)
    {
      v7[2]();
    }
    dispatch_semaphore_signal((dispatch_semaphore_t)_singleThreadedMarking_s_markingLock);
    id v1 = v7;
  }
}

uint64_t ___removeEntryFromMarkingRegion_block_invoke(uint64_t result)
{
  uint64_t v1 = *(unsigned int *)(result + 40);
  mach_vm_address_t v2 = *(void *)(result + 32);
  if (v1 >= *(_DWORD *)(v2 + 20)) {
    ___removeEntryFromMarkingRegion_block_invoke_cold_1();
  }
  *(void *)(v2 + *(unsigned int *)(v2 + 12) + 8 * v1) = 0;
  int v3 = *(_DWORD *)(v2 + 28) - 1;
  *(_DWORD *)(v2 + 2_Block_object_dispose(&STACK[0x280], 8) = v3;
  if (!v3)
  {
    uint64_t v4 = s_currentMarkingContext;
    if (s_currentMarkingContext == v2)
    {
      if (!*(void *)(v2 + 32)) {
        return result;
      }
      s_currentMarkingContext = *(void *)(v2 + 32);
    }
    else
    {
      for (uint64_t i = *(void *)(s_currentMarkingContext + 32); i != v2; uint64_t i = *(void *)(i + 32))
        uint64_t v4 = i;
      *(void *)(v4 + 32) = *(void *)(v2 + 32);
    }
    vm_map_t v6 = *MEMORY[0x1E4F14960];
    mach_vm_size_t v7 = *MEMORY[0x1E4F14B00];
    return mach_vm_deallocate(v6, v2, v7);
  }
  return result;
}

SEL ___retainCount_block_invoke()
{
  SEL result = NSSelectorFromString(&cfstr_Retaincount.isa);
  _retainCount_retainCountSelector = (uint64_t)result;
  return result;
}

void *___addEntryToMarkingRegion_block_invoke(void *result)
{
  uint64_t v1 = result;
  mach_vm_address_t v2 = (unsigned int *)s_currentMarkingContext;
  if (!s_currentMarkingContext
    || *(_DWORD *)(s_currentMarkingContext + 28) == *(_DWORD *)(s_currentMarkingContext + 20))
  {
    vm_address_t address = 0;
    int v3 = (void *)MEMORY[0x1E4F14B00];
    SEL result = (void *)vm_allocate(*MEMORY[0x1E4F14960], &address, *MEMORY[0x1E4F14B00], 167772161);
    if (result)
    {
      s_currentMarkingContext = 0;
      uint64_t v4 = (FILE *)*MEMORY[0x1E4F143C8];
      id v5 = getprogname();
      pid_t v6 = getpid();
      SEL result = (void *)fprintf(v4, "%s[%d]: error: memory marking region could not be allocated\n", v5, v6);
      s_markingDisabled = 1;
      return result;
    }
    vm_address_t v7 = address;
    unint64_t v8 = (unint64_t)(*v3 + 0x7FFFFFFD8) >> 3;
    *(void *)vm_address_t address = 0x1DE67829AD1A2FBBLL;
    *(void *)(v7 + _Block_object_dispose(&STACK[0x280], 8) = 0x2800000001;
    *(_DWORD *)(v7 + 16) = 8;
    *(_DWORD *)(v7 + 20) = v8;
    *(void *)(v7 + 24) = 0;
    *(void *)(v7 + 32) = v2;
    s_currentMarkingContext = v7;
    mach_vm_address_t v2 = (unsigned int *)v7;
  }
  BOOL v9 = (char *)v2 + v2[3];
  *(_DWORD *)(*(void *)(v1[4] + 8) + 24) = v2[6];
  unsigned int v10 = v2[5];
  if (v10)
  {
    for (unsigned int i = 0; i < v10; ++i)
    {
      uint64_t v12 = *(void *)(v1[4] + 8);
      uint64_t v13 = *(unsigned int *)(v12 + 24);
      if (!*(void *)&v9[8 * v13]) {
        break;
      }
      int v14 = v13 + 1 == v10 ? 0 : v13 + 1;
      *(_DWORD *)(v12 + 24) = v14;
      unsigned int v10 = v2[5];
    }
  }
  v2[6] = *(_DWORD *)(*(void *)(v1[4] + 8) + 24);
  uint64_t v15 = *(unsigned int *)(*(void *)(v1[4] + 8) + 24);
  if (*(void *)&v9[8 * v15]) {
    ___addEntryToMarkingRegion_block_invoke_cold_1();
  }
  id v16 = (unsigned int **)v1[6];
  *(void *)&v9[8 * v15] = v1[5];
  ++v2[7];
  if (v16) {
    *id v16 = v2;
  }
  return result;
}

char *___singleThreadedMarking_block_invoke()
{
  dispatch_semaphore_t v0 = dispatch_semaphore_create(1);
  uint64_t v1 = (void *)_singleThreadedMarking_s_markingLock;
  _singleThreadedMarking_s_markingLock = (uint64_t)v0;

  SEL result = getenv("NSZombieEnabled");
  if (result)
  {
    int v3 = result;
    if ((*result | 0x20) == 0x79)
    {
      uint64_t v4 = (FILE *)*MEMORY[0x1E4F143C8];
      id v5 = getprogname();
      pid_t v6 = getpid();
      SEL result = (char *)fprintf(v4, "%s[%d]: notice: memory marking disabled due to presence of NSZombieEnabled=\"%s\" environment variable\n", v5, v6, v3);
      s_markingDisabled = 1;
    }
  }
  return result;
}

id VMUExclaveOrDarwinRegionTypeDescriptionForTagShareProtAndPager(int a1, uint64_t a2, int a3, int a4, int a5)
{
  if (a1) {
    VMUExclaveRegionTypeDescriptionForTagShareProtAndPager(a2);
  }
  else {
  id v5 = VMURegionTypeDescriptionForTagShareProtAndPager(a2, a3, a4, a5);
  }

  return v5;
}

id VMUExclaveRegionTypeDescriptionForTagShareProtAndPager(unsigned int a1)
{
  char v1 = a1 + 5;
  if (a1 + 5) <= 0x18u && ((0x1FFFEFFu >> v1))
  {
    mach_vm_address_t v2 = [NSString stringWithUTF8String:off_1E5D24848[v1]];
  }
  else
  {
    mach_vm_address_t v2 = [NSString stringWithFormat:@"Exclave memory tag %hhu", a1];
  }

  return v2;
}

id dispositionDescription(__int16 a1)
{
  mach_vm_address_t v2 = objc_opt_new();
  int v3 = v2;
  if (a1)
  {
    [v2 appendString:@"  PRESENT"];
    if ((a1 & 2) == 0)
    {
LABEL_3:
      if ((a1 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((a1 & 2) == 0)
  {
    goto LABEL_3;
  }
  [v3 appendString:@"  FICTITIOUS"];
  if ((a1 & 4) == 0)
  {
LABEL_4:
    if ((a1 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  [v3 appendString:@"  REF"];
  if ((a1 & 8) == 0)
  {
LABEL_5:
    if ((a1 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  [v3 appendString:@"  DIRTY"];
  if ((a1 & 0x10) == 0)
  {
LABEL_6:
    if ((a1 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  [v3 appendString:@"  PAGED_OUT"];
  if ((a1 & 0x20) == 0)
  {
LABEL_7:
    if ((a1 & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  [v3 appendString:@"  COPIED"];
  if ((a1 & 0x40) == 0)
  {
LABEL_8:
    if ((a1 & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  [v3 appendString:@"  SPECULATIVE"];
  if ((a1 & 0x80) == 0)
  {
LABEL_9:
    if ((a1 & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  [v3 appendString:@"  EXTERNAL"];
  if ((a1 & 0x100) == 0)
  {
LABEL_10:
    if ((a1 & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  [v3 appendString:@"  CS_VALIDATED"];
  if ((a1 & 0x200) == 0)
  {
LABEL_11:
    if ((a1 & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  [v3 appendString:@"  CS_TAINTED"];
  if ((a1 & 0x400) == 0)
  {
LABEL_12:
    if ((a1 & 0x800) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_27:
  [v3 appendString:@"  CS_NX"];
  if ((a1 & 0x800) != 0) {
LABEL_13:
  }
    [v3 appendString:@"  REUSABLE"];
LABEL_14:

  return v3;
}

BOOL collectPhysFootprint()
{
  int v2 = 0;
  size_t v1 = 4;
  return (!sysctlbyname("vm.self_region_footprint", &v2, &v1, 0, 0) || *__error() == 2) && v2 != 0;
}

id ownedPhysFootprintAdjustmentForMemgraph(void *a1, _DWORD *a2, unint64_t a3, uint64_t a4)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  if ([v7 count] != *a2) {
    ownedPhysFootprintAdjustmentForMemgraph_cold_1();
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  unint64_t v8 = [v7 reverseObjectEnumerator];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v49;
LABEL_4:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v49 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = *(void **)(*((void *)&v48 + 1) + 8 * v12);
      if ([v13 isOwnedUnmappedMemory]) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v48 objects:v53 count:16];
        if (!v10) {
          goto LABEL_10;
        }
        goto LABEL_4;
      }
    }
    int v14 = v13;

    if (v14)
    {
      uint64_t v39 = a2;
      BOOL v40 = v14;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v41 = v7;
      id v15 = v7;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v44 objects:v52 count:16];
      if (!v16)
      {
        unint64_t v42 = 0;
        goto LABEL_37;
      }
      uint64_t v17 = v16;
      unint64_t v42 = 0;
      uint64_t v18 = *(void *)v45;
      size_t v19 = &OBJC_IVAR___VMUVMRegion_range;
      uint64_t v20 = &OBJC_IVAR___VMUVMRegion_user_tag;
      int v21 = &OBJC_IVAR___VMUVMRegion_purgeable;
      unint64_t v43 = a3;
      while (1)
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v45 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v23 = *(char **)(*((void *)&v44 + 1) + 8 * i);
          if (!VMURangeContainsRange(a3, a4, *(void *)&v23[*v19], *(void *)&v23[*v19 + 8]))
          {
            size_t v24 = v23;
            uint64_t v25 = v24;
            if (*(_DWORD *)&v24[*v20] == 87 || *(_DWORD *)&v24[*v21] == 3)
            {

              continue;
            }
            uint64_t v26 = a4;
            unint64_t v27 = v19;
            id v28 = v15;
            uint64_t v29 = v20;
            int v30 = v21;
            uint64_t v31 = *((void *)v24 + 20);

            if (v31)
            {
              int v21 = v30;
              if (!*(_DWORD *)((char *)v25 + *v30))
              {
                uint64_t v20 = v29;
                if (!*((unsigned char *)v25 + 49))
                {
                  id v15 = v28;
                  if ((*((unsigned char *)v25 + 132) & 2) == 0)
                  {
                    uint64_t v32 = v25[20] - v25[27];
                    v25[23] = v32;
                    unint64_t v33 = v25[20];
                    uint64_t v34 = v25[23];
                    uint64_t v35 = v25[27];
                    uint64_t v36 = v33 - v35 - v32;
                    if (v33 < v35 + v34) {
                      uint64_t v36 = 0;
                    }
                    v42 += v34 + v36;
                  }
                  goto LABEL_31;
                }
LABEL_30:
                id v15 = v28;
LABEL_31:
                size_t v19 = v27;
                a4 = v26;
                a3 = v43;
                continue;
              }
            }
            else
            {
              int v21 = v30;
            }
            uint64_t v20 = v29;
            goto LABEL_30;
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v44 objects:v52 count:16];
        if (!v17)
        {
LABEL_37:

          int v14 = v40;
          adjustOwnedMemoryRegionFootprint(v40, v42);
          if (v14[23] + v14[22])
          {
            uint64_t v37 = 0;
          }
          else
          {
            --*v39;
            int v14 = v40;
            uint64_t v37 = v14;
          }
          id v7 = v41;
          goto LABEL_41;
        }
      }
    }
  }
  else
  {
LABEL_10:

    int v14 = 0;
  }
  uint64_t v37 = 0;
LABEL_41:

  return v37;
}

void adjustOwnedMemoryRegionFootprint(void *a1, unint64_t a2)
{
  int v3 = a1;
  uint64_t v4 = v3;
  unint64_t v5 = v3[23];
  if (v5 >= a2)
  {
    v3[23] = v5 - a2;
  }
  else
  {
    unint64_t v6 = a2 - v5;
    v3[23] = 0;
    unint64_t v7 = v3[22];
    if (v7 >= v6)
    {
      v3[22] = v7 - v6;
    }
    else
    {
      v3[22] = 0;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        adjustOwnedMemoryRegionFootprint_cold_1(v6, v7);
      }
    }
  }
}

void withPeekFunctionForVMUTask(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1 memoryCache];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __withPeekFunctionForVMUTask_block_invoke;
  v7[3] = &unk_1E5D244C8;
  id v8 = v4;
  id v5 = v4;
  unint64_t v6 = (void *)MEMORY[0x1AD0DA230](v7);
  _withPeekTransformerFunctionForMemoryReader(v6, v3);
}

uint64_t __withPeekFunctionForVMUTask_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = 0;
  if ([*(id *)(a1 + 32) peekAtAddress:a2 size:a3 returnsBuf:&v4]) {
    return 0;
  }
  else {
    return v4;
  }
}

char *VMUMallocRangeTypeString(int a1)
{
  if ((a1 - 1) >= 7) {
    VMUMallocRangeTypeString_cold_1(a1);
  }
  return off_1E5D24910[a1 - 1];
}

void sub_1A7D2C8A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void addMallocRegionPageStatistics(void *a1, void *a2)
{
  id v3 = a1;
  if (v3 && a2 && *((unsigned char *)v3 + 50) != 3)
  {
    uint64_t v4 = a2[3];
    a2[2] += v3[2];
    a2[3] = v4 + v3[20];
    uint64_t v5 = a2[5];
    a2[4] += v3[21];
    a2[5] = v5 + v3[22];
    a2[6] += v3[23];
  }
}

void setTypeIfMallocRegion(void *a1)
{
  size_t v1 = a1;
  if (!v1[6]) {
    goto LABEL_26;
  }
  if (*((void *)v1 + 17)) {
    goto LABEL_3;
  }
  if (*((unsigned char *)v1 + 232))
  {
    if (*((unsigned char *)v1 + 238)) {
      int v2 = @"MALLOC (empty)";
    }
    else {
      int v2 = 0;
    }
  }
  else
  {
    unsigned int v3 = v1[26] - 2;
    if (v3 > 0xB)
    {
LABEL_3:
      int v2 = 0;
      goto LABEL_10;
    }
    int v2 = off_1E5D24948[v3];
  }
LABEL_10:
  uint64_t v10 = (unsigned __int8 *)v1;
  if (v1[36])
  {
    uint64_t v4 = (void *)MEMORY[0x1AD0D9F90]();
    VMUidentifyRegionTypeFromUserTag(v10[232], *((_DWORD *)v10 + 26), v10[50], *((_DWORD *)v10 + 6));
    int v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if ([v10 isUntaggedRegion])
    {
      [v10 setAsMallocRegion];
      uint64_t v5 = (__CFString *)(id)VMUmallocOtherRegionLabel;

      int v2 = v5;
    }
    unint64_t v6 = v10;
    if (!*((_DWORD *)v10 + 6) || v10[50] == 3) {
      goto LABEL_22;
    }
    if (*((_DWORD *)v10 + 36) != 4 && !v10[232] && *((_DWORD *)v10 + 26) == 1)
    {
      if ([(__CFString *)v2 isEqualToString:@"MALLOC metadata"])
      {

        int v2 = @"MALLOC";
      }
      unint64_t v6 = v10;
    }
    if (*((void *)v6 + 17)) {
      goto LABEL_22;
    }
    int v7 = *((_DWORD *)v6 + 36);
    if (v7 == 4)
    {
      id v8 = @"metadata";
    }
    else
    {
      if ((v7 & 2) == 0)
      {
LABEL_22:
        goto LABEL_23;
      }
      id v8 = @"(empty)";
    }
    if (([(__CFString *)v2 hasSuffix:v8] & 1) == 0)
    {
      uint64_t v9 = [NSString stringWithFormat:@"%@ %@", v2, v8];

      int v2 = (__CFString *)v9;
    }
    goto LABEL_22;
  }
LABEL_23:
  if (v2) {
    objc_storeStrong((id *)v10 + 4, v2);
  }

  size_t v1 = v10;
LABEL_26:
}

uint64_t recordRegions(void *a1, unint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  uint64_t v305 = *MEMORY[0x1E4F143B8];
  id v11 = a1;
  id v256 = a3;
  id v249 = a4;
  id v250 = a5;
  id v247 = a6;
  v257 = v11;
  uint64_t v12 = [v11 memoryCache];
  mach_error_t v13 = [v12 startPeeking];

  if (v13)
  {
    mach_error_t v14 = v13;
    id v15 = (FILE *)*MEMORY[0x1E4F143C8];
    int v16 = [v11 pid];
    unsigned int v265 = v14;
    uint64_t v17 = mach_error_string(v14);
    fprintf(v15, "*** Can't suspend task %d: %s\n", v16, v17);
    goto LABEL_383;
  }
  v260 = +[VMUDebugTimer sharedTimerIfCreated];
  if ([v11 isCore])
  {
    uint64_t v18 = [v11 createSymbolicatorWithFlags:0 andNotification:0];
    uint64_t v20 = v19;
  }
  else
  {
    id v21 = v11;
    uint64_t v18 = [v21 createSymbolicatorWithFlags:CSSymbolicatorGetFlagsForNoSymbolOrSourceInfoData() | 0x20100000 andNotification:0];
    uint64_t v20 = v22;

    uint64_t v23 = getprogname();
    if (!strcmp(v23, "ReportCrash"))
    {
      CSSymbolicatorGetSymbolOwnerWithNameAtTime();
      if (CSIsNull()) {
        CSSymbolicatorGetSymbolOwnerWithNameAtTime();
      }
      if ((CSIsNull() & 1) == 0)
      {
        CSRelease();
        uint64_t v20 = 0;
        uint64_t v18 = 0;
      }
    }
  }
  size_t v24 = v260;
  id v269 = (id)v18;
  if ((a7 & 0x10000) != 0)
  {
    BOOL v240 = collectPhysFootprint();
    setCollectPhysFootprint(1);
  }
  else
  {
    BOOL v240 = 0;
  }
  id obj = v20;
  if (v260)
  {
    if ([v260 signpostID])
    {
      uint64_t v25 = [v260 logHandle];
      uint64_t v26 = [v260 signpostID];
      if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v27 = v26;
        if (os_signpost_enabled(v25))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v25, OS_SIGNPOST_INTERVAL_END, v27, "recordRegions", "", buf, 2u);
        }
      }

      size_t v24 = v260;
    }
    [v24 endEvent:"recordRegions"];
    [v260 startWithCategory:"recordRegions" message:"gather VM region data"];
    id v28 = [v260 logHandle];
    os_signpost_id_t v29 = [v260 signpostID];
    if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v28, OS_SIGNPOST_INTERVAL_BEGIN, v29, "recordRegions", "gather VM region data", buf, 2u);
    }
  }
  else
  {
    [0 endEvent:"recordRegions"];
    [0 startWithCategory:"recordRegions" message:"gather VM region data"];
  }
  if ([v11 taskType] == 2)
  {
    int v30 = [v11 memoryCache];
    id v31 = v256;
    id v32 = v30;
    [v32 memoryRegions];
    *(void *)buf = MEMORY[0x1E4F143A8];
    uint64_t v293 = 3221225472;
    v294 = __listKernelCoreRegions_block_invoke;
    v295 = &unk_1E5D245F8;
    unint64_t v33 = (long long *)v31;
    v296 = v33;
    enumerate_mapped_memory_core_file_dumped_regions();
    *(void *)&long long v301 = MEMORY[0x1E4F143A8];
    *((void *)&v301 + 1) = 3221225472;
    *(void *)&long long v302 = __listKernelCoreRegions_block_invoke_2;
    *((void *)&v302 + 1) = &unk_1E5D23FA8;
    uint64_t v34 = v33;
    *(void *)&long long v303 = v34;
    CSSymbolicatorForeachSegmentAtTime();
    *(void *)&long long v288 = 0;
    CSSymbolicatorGetAOutSymbolOwner();
    CSSymbolOwnerGetSymbolWithName();
    uint64_t Range = CSSymbolGetRange();
    [v32 peekAtAddress:Range size:v36 returnsBuf:&v288];

    *(void *)&long long v297 = MEMORY[0x1E4F143A8];
    *((void *)&v297 + 1) = 3221225472;
    *(void *)&long long v298 = __listKernelCoreRegions_block_invoke_3;
    *((void *)&v298 + 1) = &unk_1E5D24620;
    uint64_t v37 = v34;
    *(void *)&long long v299 = v37;
    uint64_t v38 = MEMORY[0x1AD0DA230](&v297);
    uint64_t v39 = (void *)v38;
    if ((void)v288)
    {
      BOOL v40 = (void (**)(void *, __CFString *, void, void, uint64_t, uint64_t))(v38 + 16);
      (*(void (**)(uint64_t, __CFString *, void, void, void, void))(v38 + 16))(v38, @"MALLOC", *(void *)v288, *(void *)(v288 + 8), 0, 0);
      (*v40)(v39, @"Zalloc read-only", *(void *)(v288 + 16), *(void *)(v288 + 24), 0, 1);
      (*v40)(v39, @"MALLOC metadata", *(void *)(v288 + 32), *(void *)(v288 + 40), 4, 0);
      (*v40)(v39, @"Zalloc bits", *(void *)(v288 + 48), *(void *)(v288 + 56), 4, 0);
      (*v40)(v39, @"PGZ", *(void *)(v288 + 80), *(void *)(v288 + 88), 0, 0);
    }
  }
  else if (a2)
  {
    id v41 = v11;
    id v261 = v256;
    if (*MEMORY[0x1E4F14AE0] >= *MEMORY[0x1E4F14AF0]) {
      uint64_t v42 = *MEMORY[0x1E4F14AF0];
    }
    else {
      uint64_t v42 = *MEMORY[0x1E4F14AE0];
    }
    if ([v41 isTranslated]) {
      uint64_t v43 = -4096;
    }
    else {
      uint64_t v43 = ~v42;
    }
    if ((v43 & a2) != 0) {
      unint64_t v44 = (v43 & a2) - 1;
    }
    else {
      unint64_t v44 = 0;
    }
    *(void *)buf = a2;
    *(void *)&long long v301 = 0;
    long long v45 = getRegionData(v41, buf, &v301, 0);
    long long v46 = v45;
    if (v45)
    {
      long long v47 = *(uint64_t **)buf;
      id v266 = v45;
      if ((unint64_t)v47 <= a2)
      {
        unint64_t v52 = *(uint64_t **)buf;
        *(void *)buf += v301;
        getRegionData(v41, buf, &v301, 0);
        unint64_t v44 = (unint64_t)v52 - 1;
        v253 = v266;
        id v266 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v253 = 0;
      }
    }
    else
    {
      v253 = 0;
      id v266 = 0;
    }
    *(void *)buf = v44;
    uint64_t v53 = getRegionData(v41, buf, &v301, 0);

    if (*(void *)buf > v44 || (id v54 = v53, (v55 = v54) == 0))
    {
      uint64_t v56 = 0;
      id v54 = 0;
      unint64_t v57 = 0;
      int v58 = 50;
      unint64_t v59 = v44;
      while (1)
      {
        *(void *)buf = v57;
        uint64_t v55 = getRegionData(v41, buf, &v301, 0);

        if (v55 && *(void *)buf < v44)
        {
          id v60 = v55;

          id v54 = v60;
        }
        if ((v56 & (unint64_t)v43) >= (v59 & v43)) {
          break;
        }
        if (!v55 || (uint64_t v61 = v301 + *(void *)buf, (void)v301 + *(void *)buf >= v44))
        {
          uint64_t v61 = v56;
          unint64_t v59 = v57;
        }
        if (!v58)
        {

          id v54 = 0;
          goto LABEL_60;
        }
        unint64_t v57 = v61 + ((v59 - v61) >> 1);
        --v58;
        uint64_t v53 = v55;
        uint64_t v56 = v61;
      }
      if (!v54) {
        goto LABEL_60;
      }
    }
    [v261 addObject:v54];
LABEL_60:
    id v62 = v266;
    if (v253)
    {
      [v261 addObject:v253];
      id v62 = v266;
    }
    if (v62)
    {
      [v261 addObject:];
      id v62 = v266;
    }
  }
  else
  {
    id v48 = v11;
    id v49 = v256;
    *(void *)&long long v301 = 0;
    *((void *)&v301 + 1) = &v301;
    *(void *)&long long v302 = 0x2020000000;
    BYTE8(v302) = 0;
    if ((a7 & 0x400) != 0)
    {
      uint64_t v63 = dispatch_get_global_queue(2, 0);
      long long v50 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v63);
      dispatch_time_t v64 = dispatch_time(0, 10000000000);
      dispatch_source_set_timer(v50, v64, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
      *(void *)buf = MEMORY[0x1E4F143A8];
      uint64_t v293 = 3221225472;
      v294 = __listAllRegions_block_invoke;
      v295 = &unk_1E5D24648;
      v296 = &v301;
      dispatch_source_set_event_handler(v50, buf);
      dispatch_resume(v50);

      long long v51 = (long long *)*((void *)&v301 + 1);
    }
    else
    {
      long long v50 = 0;
      long long v51 = &v301;
    }
    recursivelyListAllRegions(v48, v49, a7, 0, -1, 0, (unsigned char *)v51 + 24);
    if (*(unsigned char *)(*((void *)&v301 + 1) + 24)) {
      [v49 removeAllObjects];
    }
    if (v50) {
      dispatch_source_cancel(v50);
    }
    _Block_object_dispose(&v301, 8);
  }
  if (![v256 count])
  {
    CSRelease();
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7CC9000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "VMURegionIdentifier did not detect any regions in the target task", buf, 2u);
    }
    goto LABEL_330;
  }
  context = (void *)MEMORY[0x1AD0D9F90]();
  if (v260)
  {
    if ([v260 signpostID])
    {
      id v65 = [v260 logHandle];
      os_signpost_id_t v66 = [v260 signpostID];
      if (v66 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v65))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v65, OS_SIGNPOST_INTERVAL_END, v66, "recordRegions", "", buf, 2u);
      }
    }
    [v260 endEvent:"recordRegions"];
    [v260 startWithCategory:"recordRegions" message:"markMachOLibraries"];
    char v67 = [v260 logHandle];
    os_signpost_id_t v68 = [v260 signpostID];
    if (v68 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v67))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v67, OS_SIGNPOST_INTERVAL_BEGIN, v68, "recordRegions", "markMachOLibraries", buf, 2u);
    }
  }
  else
  {
    [0 endEvent:"recordRegions"];
    [0 startWithCategory:"recordRegions" message:"markMachOLibraries"];
  }
  markMachOLibraries(v257, (uint64_t)v269, (uint64_t)obj, v256, a2, a7);
  CSRelease();
  if (v260)
  {
    if ([v260 signpostID])
    {
      uint64_t v69 = [v260 logHandle];
      os_signpost_id_t v70 = [v260 signpostID];
      if (v70 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v69))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v69, OS_SIGNPOST_INTERVAL_END, v70, "recordRegions", "", buf, 2u);
      }
    }
    [v260 endEvent:"recordRegions"];
    [v260 startWithCategory:"recordRegions" message:"markMallocAreas"];
    v71 = [v260 logHandle];
    os_signpost_id_t v72 = [v260 signpostID];
    if (v72 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v71))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v71, OS_SIGNPOST_INTERVAL_BEGIN, v72, "recordRegions", "markMallocAreas", buf, 2u);
    }

    markMallocAreas(v257, v256, v250, (void *)a2, a7, v260);
    if ([v260 signpostID])
    {
      uint64_t v73 = [v260 logHandle];
      os_signpost_id_t v74 = [v260 signpostID];
      if (v74 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v73))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v73, OS_SIGNPOST_INTERVAL_END, v74, "recordRegions", "", buf, 2u);
      }
    }
    [v260 endEvent:"recordRegions"];
    [v260 startWithCategory:"recordRegions" message:"markStacks"];
    char v75 = [v260 logHandle];
    os_signpost_id_t v76 = [v260 signpostID];
    if (v76 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v75))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v75, OS_SIGNPOST_INTERVAL_BEGIN, v76, "recordRegions", "markStacks", buf, 2u);
    }

    markStacks(v256, v249);
    if ([v260 signpostID])
    {
      v77 = [v260 logHandle];
      os_signpost_id_t v78 = [v260 signpostID];
      if (v78 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v77))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v77, OS_SIGNPOST_INTERVAL_END, v78, "recordRegions", "", buf, 2u);
      }
    }
    [v260 endEvent:"recordRegions"];
    [v260 startWithCategory:"recordRegions" message:"markIOSurfaces"];
    uint64_t v79 = [v260 logHandle];
    os_signpost_id_t v80 = [v260 signpostID];
    if (v80 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v79))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v79, OS_SIGNPOST_INTERVAL_BEGIN, v80, "recordRegions", "markIOSurfaces", buf, 2u);
    }

    markIOSurfaces(v257, v256, a7);
    if ([v260 signpostID])
    {
      uint64_t v81 = [v260 logHandle];
      os_signpost_id_t v82 = [v260 signpostID];
      if (v82 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v81))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v81, OS_SIGNPOST_INTERVAL_END, v82, "recordRegions", "", buf, 2u);
      }
    }
    [v260 endEvent:"recordRegions"];
    [v260 startWithCategory:"recordRegions" message:"markOthers"];
    v83 = [v260 logHandle];
    os_signpost_id_t v84 = [v260 signpostID];
    if (v84 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v83))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v83, OS_SIGNPOST_INTERVAL_BEGIN, v84, "recordRegions", "markOthers", buf, 2u);
    }
  }
  else
  {
    [0 endEvent:"recordRegions"];
    [0 startWithCategory:"recordRegions" message:"markMallocAreas"];
    markMallocAreas(v257, v256, v250, (void *)a2, a7, 0);
    [0 endEvent:"recordRegions"];
    [0 startWithCategory:"recordRegions" message:"markStacks"];
    markStacks(v256, v249);
    [0 endEvent:"recordRegions"];
    [0 startWithCategory:"recordRegions" message:"markIOSurfaces"];
    markIOSurfaces(v257, v256, a7);
    [0 endEvent:"recordRegions"];
    [0 startWithCategory:"recordRegions" message:"markOthers"];
  }
  id v85 = v257;
  id v86 = v256;
  v267 = v85;
  int v87 = [v85 memoryCache];
  -[VMUTaskMemoryCache createSymbolicatorWithFlags:andNotification:]((uint64_t)v87, 0, 0);

  if ((CSIsNull() & 1) == 0)
  {
    CSSymbolicatorGetSymbolOwnerWithNameAtTime();
    if (CSIsNull()) {
      goto LABEL_127;
    }
    CSSymbolOwnerGetSymbolWithMangledName();
    if (CSIsNull()) {
      goto LABEL_127;
    }
    uint64_t v90 = CSSymbolGetRange();
    uint64_t v88 = 0;
    if (!v90 || v89 < 8) {
      goto LABEL_128;
    }
    *(void *)buf = 0;
    long long v91 = [v85 memoryCache];
    BOOL v92 = [v91 peekAtAddress:v90 size:8 returnsBuf:buf] == 0;

    if (!v92) {
LABEL_127:
    }
      uint64_t v88 = 0;
    else {
      uint64_t v88 = **(void **)buf;
    }
LABEL_128:
    CSRelease();
    goto LABEL_129;
  }
  uint64_t v88 = 0;
LABEL_129:
  long long v300 = 0u;
  long long v299 = 0u;
  long long v298 = 0u;
  long long v297 = 0u;
  id obja = v86;
  uint64_t v93 = [obja countByEnumeratingWithState:&v297 objects:&v301 count:16];
  if (v93)
  {
    char v270 = 0;
    uint64_t v94 = *(void *)v298;
    do
    {
      uint64_t v95 = 0;
      do
      {
        if (*(void *)v298 != v94) {
          objc_enumerationMutation(obja);
        }
        uint64_t v96 = *(void *)(*((void *)&v297 + 1) + 8 * v95);
        if (!*(void *)(v96 + 32))
        {
          long long v97 = (void *)MEMORY[0x1AD0D9F90]();
          if (*(unsigned char *)(v96 + 132))
          {
            long long v100 = *(void **)(v96 + 32);
            *(void *)(v96 + 32) = @"Submap";

            if (*(unsigned char *)(v96 + 50) == 5) {
              long long v101 = @"machine-wide VM submap";
            }
            else {
              long long v101 = @"process-only VM submap";
            }
            objc_storeStrong((id *)(v96 + 40), v101);
          }
          else if ([(id)v96 isSanitizer])
          {
            uint64_t v98 = VMUidentifyRegionTypeFromUserTag(*(unsigned __int8 *)(v96 + 232), *(_DWORD *)(v96 + 104), *(unsigned __int8 *)(v96 + 50), *(_DWORD *)(v96 + 24));
            v99 = *(void **)(v96 + 32);
            *(void *)(v96 + 32) = v98;
          }
          else if ([v267 rangeIsInSharedCache:*(void *)(v96 + 8) :*(void *)(v96 + 16)])
          {
            if (([(id)v96 isUnsharedPmap] & 1) != 0 || (int v104 = *(_DWORD *)(v96 + 24), (v104 & 2) != 0))
            {
              objc_storeStrong((id *)(v96 + 32), (id)VMUunusedSharedLibDataLabel);
              if (!*(void *)(v96 + 40)) {
                objc_storeStrong((id *)(v96 + 40), (id)VMUunusedSharedLibDataPath);
              }
              *(unsigned char *)(v96 + 132) |= 4u;
            }
            else
            {
              int v105 = *(_DWORD *)(v96 + 104);
              if (v105)
              {
                uint64_t v106 = VMUidentifyRegionTypeFromUserTag(*(unsigned __int8 *)(v96 + 232), v105, *(unsigned __int8 *)(v96 + 50), v104);
                long long v107 = *(void **)(v96 + 32);
                *(void *)(v96 + 32) = v106;
              }
              else
              {
                objc_storeStrong((id *)(v96 + 32), VMUunusedSharedLibTextLabel[0]);
                if (!*(void *)(v96 + 40)) {
                  objc_storeStrong((id *)(v96 + 40), (id)VMUunusedSharedLibTextPath);
                }
              }
            }
          }
          else if (*(unsigned char *)(v96 + 49) == 1)
          {
            long long v108 = *(void **)(v96 + 32);
            *(void *)(v96 + 32) = @"mapped file";

            long long v109 = *(void **)(v96 + 40);
            *(void *)(v96 + 40) = 0;

            if ((a7 & 0x40000) == 0)
            {
              long long v110 = [v267 memoryCache];
              int v111 = [v110 procRegionFileNameForAddress:*(void *)(v96 + 8) buffer:buf bufferSize:1024];

              if (v111 >= 1)
              {
                buf[v111] = 0;
                v112 = [NSString stringWithUTF8String:buf];
                uint64_t v113 = VMUSanitizePath(v112);
                v114 = *(void **)(v96 + 40);
                *(void *)(v96 + 40) = v113;
              }
            }
            if (!*(void *)(v96 + 40))
            {
              uint64_t v115 = [(__CFString *)kVMUUnknownMappedFileNamePrefix[0] stringByAppendingFormat:@"%lx", *(void *)(v96 + 112)];
              v116 = *(void **)(v96 + 40);
              *(void *)(v96 + 40) = v115;
            }
          }
          else if ([(id)v96 isNullRegion])
          {
            uint64_t v117 = (id *)(v96 + 32);
            if (v270) {
              objc_storeStrong(v117, (id)VMUGPUCarveoutRegionLabel);
            }
            else {
              objc_storeStrong(v117, (id)VMUcommpageRegionLabel);
            }
            objc_storeStrong((id *)(v96 + 40), (id)VMUreservedVMaddressSpaceString);
            char v270 = 1;
          }
          else if ([(id)v96 isOwnedUnmappedMemory])
          {
            objc_storeStrong((id *)(v96 + 32), (id)VMUOwnedUnmappedMemoryRegionLabel);
            v118 = *(void **)(v96 + 40);
            *(void *)(v96 + 40) = @"owned physical footprint (unmapped)";
          }
          else
          {
            int v119 = *(_DWORD *)(v96 + 104);
            if (!v119 && v88 && *(void *)(v96 + 8) == v88)
            {
              v120 = *(void **)(v96 + 32);
              *(void *)(v96 + 32) = @"AttributeGraph Data";
            }
            else
            {
              uint64_t v121 = VMUidentifyRegionTypeFromUserTag(*(unsigned __int8 *)(v96 + 232), v119, *(unsigned __int8 *)(v96 + 50), *(_DWORD *)(v96 + 24));
              v122 = *(void **)(v96 + 32);
              *(void *)(v96 + 32) = v121;
            }
          }
          if (!*(void *)(v96 + 40))
          {
            if (*(_DWORD *)(v96 + 24) && *(unsigned char *)(v96 + 50) == 3)
            {
              long long v102 = (__CFString *)(id)VMUreservedVMaddressSpaceString;
              long long v103 = *(void **)(v96 + 40);
            }
            else
            {
              long long v103 = 0;
              long long v102 = &stru_1EFE27F38;
            }
            *(void *)(v96 + 40) = v102;
          }
        }
        ++v95;
      }
      while (v93 != v95);
      uint64_t v123 = [obja countByEnumeratingWithState:&v297 objects:&v301 count:16];
      uint64_t v93 = v123;
    }
    while (v123);
  }

  if ([v267 taskType] == 2)
  {
    if (v260)
    {
      if ([v260 signpostID])
      {
        v124 = [v260 logHandle];
        os_signpost_id_t v125 = [v260 signpostID];
        if (v125 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v124))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v124, OS_SIGNPOST_INTERVAL_END, v125, "recordRegions", "", buf, 2u);
        }
      }
      [v260 endEvent:"recordRegions"];
      [v260 startWithCategory:"recordRegions" message:"fixupCoreRegions"];
      v126 = [v260 logHandle];
      os_signpost_id_t v127 = [v260 signpostID];
      if (v127 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v126))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v126, OS_SIGNPOST_INTERVAL_BEGIN, v127, "recordRegions", "fixupCoreRegions", buf, 2u);
      }
    }
    else
    {
      [0 endEvent:"recordRegions"];
      [0 startWithCategory:"recordRegions" message:"fixupCoreRegions"];
    }
    id v128 = obja;
    long long v301 = 0u;
    long long v302 = 0u;
    long long v303 = 0u;
    long long v304 = 0u;
    uint64_t v129 = [v128 countByEnumeratingWithState:&v301 objects:buf count:16];
    if (v129)
    {
      v130 = 0;
      v131 = &OBJC_IVAR___VMUVMRegion_user_tag;
      id v271 = *(id *)v302;
      while (1)
      {
        uint64_t v132 = 0;
        v133 = v130;
        id v262 = (id)v129;
        do
        {
          if (*(id *)v302 != v271) {
            objc_enumerationMutation(v128);
          }
          uint64_t v134 = *(void *)(*((void *)&v301 + 1) + 8 * v132);
          id v135 = *(id *)(v134 + 32);
          v136 = v135;
          char v137 = *(unsigned char *)(v134 + 132);
          if ((v137 & 2) != 0)
          {
            if ([v135 hasSuffix:@"DATA"]) {
              goto LABEL_202;
            }
            char v137 = *(unsigned char *)(v134 + 132);
          }
          if ((v137 & 2) == 0)
          {
            if (*(_DWORD *)(v134 + *v131)) {
              goto LABEL_205;
            }
LABEL_202:
            *(_DWORD *)(v134 + 24) |= 2u;
            *(_DWORD *)(v134 + 28) |= 2u;
            if ((*(unsigned char *)(v134 + 132) & 2) == 0) {
              goto LABEL_205;
            }
          }
          if ([v136 hasSuffix:@"DATA_CONST"]) {
            *(_DWORD *)(v134 + 28) |= 2u;
          }
LABEL_205:
          if ((*(unsigned char *)(v134 + 132) & 2) != 0 && [v136 hasSuffix:@"TEXT_EXEC"])
          {
            *(_DWORD *)(v134 + 24) |= 4u;
            *(_DWORD *)(v134 + 28) |= 4u;
          }
          if ([*(id *)(v134 + 40) isEqualToString:VMUunusedButDirtySharedLibDataPath])
          {
            if (v133 && (*((unsigned char *)v133 + 132) & 2) != 0)
            {
              v139 = v131;
              id v140 = v128;
              v141 = NSString;
              uint64_t v142 = VMUunusedSharedLibLabelOrPathPrefix;
              id v143 = v133[4];
              v144 = v141;
              id v128 = v140;
              v131 = v139;
              uint64_t v129 = (uint64_t)v262;
              uint64_t v145 = [v144 stringWithFormat:@"%@%@", v142, v143];
              v146 = *(void **)(v134 + 32);
              *(void *)(v134 + 32) = v145;

              uint64_t v147 = [NSString stringWithFormat:@"%@%@", VMUunusedButDirtySharedLibPrefix, v143];
              v148 = *(void **)(v134 + 40);
              *(void *)(v134 + 40) = v147;

              *(unsigned char *)(v134 + 132) |= 4u;
              *(_DWORD *)(v134 + 24) = *((_DWORD *)v133 + 6);
              *(_DWORD *)(v134 + 2_Block_object_dispose(&STACK[0x280], 8) = *((_DWORD *)v133 + 7);
            }
            else
            {
              v138 = *(void **)(v134 + 40);
              *(void *)(v134 + 40) = 0;

              *(unsigned char *)(v134 + 132) &= ~2u;
            }
          }
          if ([(id)v134 isUntaggedRegion])
          {
            v149 = *(void **)(v134 + 32);
            *(void *)(v134 + 32) = @"Unknown core region";
          }
          v130 = (id *)(id)v134;

          ++v132;
          v133 = v130;
        }
        while (v129 != v132);
        uint64_t v129 = [v128 countByEnumeratingWithState:&v301 objects:buf count:16];
        if (!v129)
        {

          break;
        }
      }
    }
  }
  if (v260)
  {
    if ([v260 signpostID])
    {
      v150 = [v260 logHandle];
      os_signpost_id_t v151 = [v260 signpostID];
      if (v151 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v150))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v150, OS_SIGNPOST_INTERVAL_END, v151, "recordRegions", "", buf, 2u);
      }
    }
    [v260 endEvent:"recordRegions"];
    [v260 startWithCategory:"recordRegions" message:"coalesceIdenticalRegions"];
    v152 = [v260 logHandle];
    os_signpost_id_t v153 = [v260 signpostID];
    if (v153 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v152))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v152, OS_SIGNPOST_INTERVAL_BEGIN, v153, "recordRegions", "coalesceIdenticalRegions", buf, 2u);
    }

    coalesceIdenticalRegions(obja, a7);
    if ([v260 signpostID])
    {
      v154 = [v260 logHandle];
      os_signpost_id_t v155 = [v260 signpostID];
      if (v155 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v154))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v154, OS_SIGNPOST_INTERVAL_END, v155, "recordRegions", "", buf, 2u);
      }
    }
    [v260 endEvent:"recordRegions"];
    [v260 startWithCategory:"recordRegions" message:"collectVMpageStatistics"];
    v156 = [v260 logHandle];
    os_signpost_id_t v157 = [v260 signpostID];
    if (v157 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v156))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v156, OS_SIGNPOST_INTERVAL_BEGIN, v157, "recordRegions", "collectVMpageStatistics", buf, 2u);
    }
  }
  else
  {
    [0 endEvent:"recordRegions"];
    [0 startWithCategory:"recordRegions" message:"coalesceIdenticalRegions"];
    coalesceIdenticalRegions(obja, a7);
    [0 endEvent:"recordRegions"];
    [0 startWithCategory:"recordRegions" message:"collectVMpageStatistics"];
  }
  id v246 = v267;
  id v158 = obja;
  table = (NSMapTable *)v250;
  id objb = v158;
  unint64_t v268 = [v158 count];
  uint64_t v245 = VMUGetFlagsForAllVMRegionStatistics() & a7;
  if (v245)
  {
    v251 = malloc_type_calloc(0x400uLL, 4uLL, 0x100004052888210uLL);
    v241 = objc_opt_new();
  }
  else
  {
    v241 = 0;
    v251 = 0;
  }
  if (v268)
  {
    int v238 = 0;
    int v242 = 0;
    uint64_t v159 = 0;
    unint64_t v243 = 1024;
    v244 = 0;
    while (1)
    {
      uint64_t v160 = [objb objectAtIndex:v159];
      v161 = (char *)v160;
      if ((*(unsigned char *)(v160 + 132) & 1) != 0 || *(unsigned char *)(v160 + 50) == 3) {
        goto LABEL_326;
      }
      if ((a7 & 0x10000) != 0)
      {
        int v162 = [v246 rangeIsInSharedCache:*(void *)(v160 + 8) :*(void *)(v160 + 16)] ^ 1;
        if ((v242 & 1) == v162)
        {
          int v163 = v162 | v242;
          setCollectPhysFootprint((v162 | v242) & 1);
          int v242 = v163 ^ 1;
        }
      }
      *((void *)v161 + 20) = 0;
      *((void *)v161 + 21) = 0;
      *((void *)v161 + 22) = 0;
      *((void *)v161 + 23) = 0;
      *((void *)v161 + 12) = 0;
      *((void *)v161 + _Block_object_dispose(&STACK[0x280], 8) = 0;
      *((void *)v161 + 9) = 0;
      *((void *)v161 + 10) = 0;
      *((void *)v161 + 11) = 0;
      if (!v245) {
        goto LABEL_322;
      }
      if (*MEMORY[0x1E4F14AE8] >= *MEMORY[0x1E4F14B00]) {
        unint64_t v164 = *MEMORY[0x1E4F14B00];
      }
      else {
        unint64_t v164 = *MEMORY[0x1E4F14AE8];
      }
      if (*MEMORY[0x1E4F14AE0] >= *MEMORY[0x1E4F14AF0]) {
        uint64_t v165 = *MEMORY[0x1E4F14AF0];
      }
      else {
        uint64_t v165 = *MEMORY[0x1E4F14AE0];
      }
      uint64_t v166 = *((void *)v161 + 1);
      v167 = (char *)(v166 & ~v165);
      uint64_t v254 = v165;
      unint64_t v168 = (v166 + v165 + *((void *)v161 + 2)) & ~v165;
      unint64_t v272 = v164;
      unint64_t v169 = (v168 - (unint64_t)v167) / v164;
      unint64_t v170 = v169;
      if (v169 > v243)
      {
        free(v251);
        v251 = malloc_type_malloc(4 * v169, 0x100004052888210uLL);
        unint64_t v243 = v169;
      }
      *(void *)buf = v169;
      v171 = v251;
      v172 = v167;
      if (v167 == v244)
      {
        _DWORD *v251 = v238;
        v171 = v251 + 1;
        v172 = &v244[v272];
        unint64_t v170 = v169 - 1;
        *(void *)buf = v169 - 1;
      }
      if (!v170) {
        goto LABEL_264;
      }
      v173 = [v246 memoryCache];
      mach_error_t v174 = [v173 machVMPageRangeQueryWithAddress:v172 size:v168 - (void)v172 dispositions:v171 dispositionsCount:buf];

      if (!v174) {
        break;
      }
      mach_error("collectVMpageStatistics: error in mach_vm_page_range_query", v174);
LABEL_326:

      if (++v159 >= v268) {
        goto LABEL_327;
      }
    }
    if (*((void *)v161 + 2) + *((void *)v161 + 1) < v168)
    {
      v244 = (char *)(v168 - v272);
      int v238 = v251[v169 - 1];
    }
LABEL_264:
    if (v272 <= v168 - (unint64_t)v167)
    {
      char v175 = 0;
      if (v169 <= 1) {
        uint64_t v176 = 1;
      }
      else {
        uint64_t v176 = v169;
      }
      v177 = v251;
      do
      {
        if (v175)
        {
          uint64_t v178 = [objb objectAtIndex:++v159];

          v161 = (char *)v178;
        }
        unint64_t v179 = *((void *)v161 + 1);
        if ((unint64_t)v167 <= v179) {
          unint64_t v180 = *((void *)v161 + 1);
        }
        else {
          unint64_t v180 = (unint64_t)v167;
        }
        v167 += v272;
        if ((unint64_t)v167 >= *((void *)v161 + 2) + v179) {
          unint64_t v181 = *((void *)v161 + 2) + v179;
        }
        else {
          unint64_t v181 = (unint64_t)v167;
        }
        int v182 = *v177;
        if ((*v177 & 0x18) == 0
          || ![*((id *)v161 + 4) hasPrefix:VMUunusedSharedLibLabelPrefix])
        {
          char v175 = 0;
          goto LABEL_301;
        }
        id v263 = (id)VMUunusedButDirtySharedLibDataPath;
        v183 = (void *)*((void *)v161 + 5);
        if (v183)
        {
          if (([v183 hasPrefix:VMUunusedSharedLibPathPrefix] & 1) == 0
            && ([*((id *)v161 + 5) hasPrefix:VMUunusedButDirtyPrefix] & 1) == 0)
          {
            uint64_t v184 = [v241 objectForKeyedSubscript:*((void *)v161 + 5)];

            id v263 = (id)v184;
            if (!v184)
            {
              id v263 = [(id)VMUunusedButDirtyPrefix stringByAppendingString:*((void *)v161 + 5)];
              [v241 setObject:v263 forKeyedSubscript:*((void *)v161 + 5)];
            }
          }
        }
        unint64_t v185 = *((void *)v161 + 1);
        if ((v180 & v254) == 0 && v180 > v185)
        {
          uint64_t v190 = [v161 breakAtLength:v180 - v185];
          v189 = (char *)v190;
          if (!v190) {
            goto LABEL_299;
          }
          *(unsigned char *)(v190 + 132) |= 8u;
          objc_storeStrong((id *)(v190 + 40), v263);
          [objb insertObject:v189 atIndex:++v159];
          v189 = v189;

          char v175 = 0;
          ++v268;
          v161 = v189;
        }
        else if ((v181 & v254) != 0 || v181 >= *((void *)v161 + 2) + v185)
        {
          v161[132] |= 8u;
          id v188 = v263;
          char v175 = 0;
          v189 = (char *)*((void *)v161 + 5);
          *((void *)v161 + 5) = v188;
        }
        else
        {
          uint64_t v191 = [v161 breakAtLength:v181 - v185];
          v189 = (char *)v191;
          if (!v191)
          {
LABEL_299:
            char v175 = 0;
            goto LABEL_300;
          }
          v161[132] |= 8u;
          objc_storeStrong((id *)v161 + 5, v263);
          [objb insertObject:v189 atIndex:v159 + 1];
          ++v268;
          char v175 = 1;
        }
LABEL_300:

LABEL_301:
        unint64_t v192 = v181 - v180;
        if (v182)
        {
          *((void *)v161 + 20) += v192;
          ++*((void *)v161 + 8);
          if ((v182 & 8) != 0)
          {
            v193 = &OBJC_IVAR___VMUVMRegion_dirty_size;
            v194 = &OBJC_IVAR___VMUVMRegion_pages_dirtied;
            goto LABEL_306;
          }
        }
        else if ((v182 & 0x10) != 0)
        {
          v193 = &OBJC_IVAR___VMUVMRegion_swapped_out_size;
          v194 = &OBJC_IVAR___VMUVMRegion_pages_swapped_out;
LABEL_306:
          *(void *)&v161[*v193] += v192;
          ++*(void *)&v161[*v194];
        }
        if ((v182 & 0x20) != 0)
        {
          *((void *)v161 + 21) += v192;
          ++*((void *)v161 + 9);
        }
        if ((v182 & 0x800) != 0) {
          *((void *)v161 + 27) += v192;
        }
        ++v177;
        --v176;
      }
      while (v176);
    }
    if ((a7 & 0x10) != 0)
    {
      unint64_t v195 = *((void *)v161 + 20);
      if (*((void *)v161 + 2) < v195) {
        unint64_t v195 = *((void *)v161 + 2);
      }
      int v196 = *((_DWORD *)v161 + 13);
      switch(v196)
      {
        case 2:
          v197 = &OBJC_IVAR___VMUVMRegion_purgable_empty_size;
          unint64_t v195 = *((void *)v161 + 2);
          goto LABEL_321;
        case 1:
          v197 = &OBJC_IVAR___VMUVMRegion_purgable_vol_size;
          goto LABEL_321;
        case 0:
          v197 = &OBJC_IVAR___VMUVMRegion_purgable_non_vol_size;
LABEL_321:
          *(void *)&v161[*v197] += v195;
          break;
      }
    }
LABEL_322:
    if ((a7 & 0x100) == 0 && *((_DWORD *)v161 + 37) != -1)
    {
      v198 = NSMapGet(table, *((const void **)v161 + 5));
      if (v198)
      {
        addMallocRegionPageStatistics(v161, v198);
        ++v198[7];
      }
    }
    goto LABEL_326;
  }
LABEL_327:
  if (v251) {
    free(v251);
  }

LABEL_330:
  v199 = [v257 memoryCache];
  unsigned int v265 = [v199 stopPeeking];

  if (!a2)
  {
    id v255 = v257;
    id v200 = v256;
    id v264 = v247;
    v259 = v200;
    if ([v200 count])
    {
      id v201 = v200;
      if (v264)
      {
        v202 = [v264 objectForKeyedSubscript:@"page_table"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v203 = [v202 unsignedLongLongValue];
          if (v203)
          {
            uint64_t v204 = [v201 lastObject];
            v205 = (void *)v204;
            if (v204)
            {
              unint64_t v206 = *(void *)(v204 + 16) + *(void *)(v204 + 8);
              if (!__CFADD__(v206, v203))
              {
                v207 = objc_alloc_init(VMUVMRegion);
                v207->range.location = v206;
                v207->range.length = v203;
                v207->resident_mach_vm_size_t size = v203;
                v207->dirty_mach_vm_size_t size = v203;
                v207->user_tag = -2;
                type = v207->type;
                v207->type = (NSString *)@"page table in kernel";

                path = v207->path;
                v207->path = (NSString *)@"charged to process physical footprint";

                v207->prot = 3;
                v207->maxProt = 3;
                v207->share_mode = 2;
                v207->purgeable = 3;
                [v201 addObject:v207];
              }
            }
          }
        }
      }
      VMUGatherOwnedVmObjects(v255);
      objCC_SHA256_CTX c = (id)objc_claimAutoreleasedReturnValue();
      if (objc && [objc count])
      {
        long long v290 = 0u;
        long long v291 = 0u;
        long long v288 = 0u;
        long long v289 = 0u;
        v210 = [v201 reverseObjectEnumerator];
        uint64_t v211 = [v210 countByEnumeratingWithState:&v288 objects:buf count:16];
        if (v211)
        {
          uint64_t v212 = *(void *)v289;
LABEL_344:
          uint64_t v213 = 0;
          while (1)
          {
            if (*(void *)v289 != v212) {
              objc_enumerationMutation(v210);
            }
            v214 = *(void **)(*((void *)&v288 + 1) + 8 * v213);
            if ([v214 isOwnedUnmappedMemory]) {
              break;
            }
            if (v211 == ++v213)
            {
              uint64_t v211 = [v210 countByEnumeratingWithState:&v288 objects:buf count:16];
              if (v211) {
                goto LABEL_344;
              }
              goto LABEL_373;
            }
          }
          v252 = v214;

          if (!v252) {
            goto LABEL_374;
          }
          long long v286 = 0u;
          long long v287 = 0u;
          long long v284 = 0u;
          long long v285 = 0u;
          id v273 = v201;
          unint64_t v215 = 0;
          uint64_t v216 = [v273 countByEnumeratingWithState:&v284 objects:&v301 count:16];
          if (v216)
          {
            uint64_t v217 = *(void *)v285;
            do
            {
              for (uint64_t i = 0; i != v216; ++i)
              {
                if (*(void *)v285 != v217) {
                  objc_enumerationMutation(v273);
                }
                v219 = *(void **)(*((void *)&v284 + 1) + 8 * i);
                v220 = [NSNumber numberWithUnsignedLongLong:v219[28]];
                v221 = [objc objectForKeyedSubscript:v220];
                v222 = v221;
                if (v221)
                {
                  *(void *)&long long v300 = 0;
                  long long v299 = 0u;
                  long long v298 = 0u;
                  long long v297 = 0u;
                  [v221 getBytes:&v297 length:56];
                  [objc removeObjectForKey:v220];
                  *(void *)&long long v280 = 0;
                  *(void *)&v278[0] = 0;
                  VMUFootprintForVmObject((uint64_t)&v297, &v280, v278);
                  v219[23] = v280;
                  v219[22] = *(void *)&v278[0];
                  uint64_t v223 = v280;
                  uint64_t v224 = *(void *)&v278[0];
                  v225 = VMUVMLedgerNameForTag(((unint64_t)v300 >> 1) & 7);
                  if (v225)
                  {
                    uint64_t v226 = [[NSString alloc] initWithFormat:@"%@ (%@)", v219[4], v225];
                    v227 = (void *)v219[4];
                    v219[4] = v226;
                  }
                  v215 += v223 + v224;
                }
              }
              uint64_t v216 = [v273 countByEnumeratingWithState:&v284 objects:&v301 count:16];
            }
            while (v216);
          }

          adjustOwnedMemoryRegionFootprint(v252, v215);
          if (v252[23] + v252[22])
          {
            long long v282 = 0u;
            long long v283 = 0u;
            long long v280 = 0u;
            long long v281 = 0u;
            v228 = [objc objectEnumerator];
            uint64_t v229 = 0;
            uint64_t v230 = [v228 countByEnumeratingWithState:&v280 objects:&v297 count:16];
            if (v230)
            {
              uint64_t v231 = *(void *)v281;
              do
              {
                for (uint64_t j = 0; j != v230; ++j)
                {
                  if (*(void *)v281 != v231) {
                    objc_enumerationMutation(v228);
                  }
                  v233 = *(void **)(*((void *)&v280 + 1) + 8 * j);
                  uint64_t v279 = 0;
                  memset(v278, 0, sizeof(v278));
                  [v233 getBytes:v278 length:56];
                  v229 += *((void *)&v278[0] + 1);
                }
                uint64_t v230 = [v228 countByEnumeratingWithState:&v280 objects:&v297 count:16];
              }
              while (v230);
            }

            v210 = v252;
            v252[2] = v229;
            v252[20] = 0;
          }
          else
          {
            [v273 removeObject:v252];
            v210 = v252;
          }
        }
LABEL_373:
      }
LABEL_374:
    }
  }
  setCollectPhysFootprint(v240);
  if (v260 && [v260 signpostID])
  {
    v234 = [v260 logHandle];
    os_signpost_id_t v235 = [v260 signpostID];
    if (v235 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v234))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v234, OS_SIGNPOST_INTERVAL_END, v235, "recordRegions", "", buf, 2u);
    }
  }
  [v260 endEvent:"recordRegions"];

LABEL_383:
  return v265;
}

void sub_1A7D2FDCC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 240), 8);
  _Unwind_Resume(a1);
}

void appendMallocZoneTextLine(void *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  id v25 = a1;
  [v25 appendFormat:@"%-*s", a3, a4];
  [v25 appendFormat:@" %10s", a5];
  if ((a2 & 4) != 0) {
    [v25 appendFormat:@" %10s", a6];
  }
  if ((a2 & 8) != 0) {
    [v25 appendFormat:@" %10s", a7];
  }
  uint64_t v20 = v25;
  if ((a2 & 0x800) != 0)
  {
    [v25 appendFormat:@" %10s", a8];
    uint64_t v20 = v25;
  }
  if ((a2 & 0x400000) != 0)
  {
    [v20 appendFormat:@" %10s", a9];
    [v25 appendFormat:@" %10s %10s %10s %7s", a10, a11, a12, a13];
  }
  else
  {
    [v20 appendFormat:@" %10s %10s %10s %7s", a10, a11, a12, a13];
    [v25 appendFormat:@" %7s", a14, v21, v22, v23];
  }
  [v25 appendString:@"\n"];
}

void appendMallocZoneStatsLine(void *a1, int a2, unsigned int a3, char a4, unsigned int a5, uint64_t a6, unint64_t *a7)
{
  id v26 = a1;
  context = (void *)MEMORY[0x1AD0D9F90]();
  uint64_t v21 = pageCountString(a7[2], a3, a4);
  uint64_t v20 = pageCountString(a7[3], a3, a4);
  uint64_t v19 = pageCountString(a7[6], a3, a4);
  uint64_t v10 = pageCountString(a7[5], a3, a4);
  uint64_t v11 = pageCountString(a7[5] + a7[6], a3, a4);
  [NSString stringWithFormat:@"%10qu", a7[1]];
  id v12 = objc_claimAutoreleasedReturnValue();
  uint64_t v13 = [v12 UTF8String];
  uint64_t v14 = memorySizeString(*a7);
  uint64_t v15 = memorySizeString(a7[9]);
  [NSString stringWithFormat:@"%3llu%%", a7[8]];
  id v16 = objc_claimAutoreleasedReturnValue();
  uint64_t v17 = [v16 UTF8String];
  [NSString stringWithFormat:@"%7llu", a7[7]];
  id v18 = objc_claimAutoreleasedReturnValue();
  appendMallocZoneTextLine(v26, a2, a5, a6, v21, v20, v19, v10, v11, v13, v14, v15, v17, [v18 UTF8String]);
}

int *setCollectPhysFootprint(int a1)
{
  int v4 = a1;
  SEL result = (int *)sysctlbyname("vm.self_region_footprint", 0, 0, &v4, 4uLL);
  if (result)
  {
    SEL result = __error();
    if (*result != 2)
    {
      int v2 = (FILE *)*MEMORY[0x1E4F143C8];
      unsigned int v3 = __error();
      return (int *)fprintf(v2, "Error setting sysctl: %s. %d.\n", "vm.self_region_footprint", *v3);
    }
  }
  return result;
}

void markMachOLibraries(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, __int16 a6)
{
  id v34 = a1;
  id v9 = a4;
  uint64_t v10 = [v9 objectAtIndexedSubscript:0];
  uint64_t v11 = [v10 range];

  id v12 = [v9 lastObject];
  uint64_t v32 = [v12 range];
  uint64_t v14 = v13;

  uint64_t v15 = objc_opt_new();
  id v16 = objc_opt_new();
  v58[0] = 0;
  v58[1] = v58;
  v58[2] = 0x2020000000;
  char v59 = 0;
  char IsKernelSymbolicator = CSSymbolicatorIsKernelSymbolicator();
  if ((a6 & 0x400) == 0 && (!a5 || [v34 addressIsInSharedCache:a5])) {
    CSSymbolicatorCreateForTaskSharedCache();
  }
  char v18 = CSIsNull();
  uint64_t v46 = MEMORY[0x1E4F143A8];
  uint64_t v47 = 3221225472;
  id v48 = __markMachOLibraries_block_invoke;
  id v49 = &unk_1E5D24698;
  uint64_t v55 = v11;
  uint64_t v56 = v14 - v11 + v32;
  LOBYTE(v57) = IsKernelSymbolicator;
  id v54 = v58;
  BYTE1(v57) = v18 ^ 1;
  id v50 = v15;
  id v51 = v16;
  id v52 = v34;
  id v53 = v9;
  CSSymbolicatorForeachSymbolOwnerAtTime();
  uint64_t v36 = MEMORY[0x1E4F143A8];
  uint64_t v37 = 3221225472;
  uint64_t v38 = __markMachOLibraries_block_invoke_3;
  uint64_t v39 = &unk_1E5D246E8;
  uint64_t v44 = v11;
  uint64_t v45 = v56;
  id v35 = v50;
  BOOL v40 = v35;
  id v31 = v51;
  id v41 = v31;
  id v33 = v52;
  uint64_t v42 = v33;
  id v19 = v53;
  uint64_t v43 = v19;
  CSSymbolicatorForeachSymbolOwnerAtTime();
  CSRelease();
  unint64_t v20 = [v19 count];
  if (v20)
  {
    for (unint64_t i = 0; i < v20; ++i)
    {
      [v19 objectAtIndexedSubscript:i v31, v33, v35, v36, v37, v38, v39, v40, v41, v42, v43, v44, v45, v46, v47, v48];
        v49,
        v50,
        v51,
        v52,
        v53,
        v54,
        v55,
        v56,
      uint64_t v22 = v57);
      uint64_t v23 = v22[1];
      if ((v23 & 0xFFF) == 0)
      {
        uint64_t v24 = v22[2];
        unint64_t v25 = v24 + v23;
        uint64_t v26 = (v24 + v23) & 0xFFF;
        if (v26)
        {
          if (i == v20 - 1)
          {
            v22[2] = v24 - v26 + 4096;
          }
          else
          {
            os_signpost_id_t v27 = [v19 objectAtIndexedSubscript:i + 1];
            id v28 = v27;
            uint64_t v29 = v27[1];
            if ((v29 ^ v25) >= 0x1000)
            {
              v22[2] = v22[2] - v26 + 4096;
            }
            else if (!v27[4])
            {
              if (v27[2] + v29 <= (unint64_t)(v22[1] + v22[2] + 4096 - v26))
              {
                [v22 addInfoFromRegion:v27];
                [v19 removeObjectAtIndex:i + 1];
                --v20;
              }
              else
              {
                int v30 = [v27 breakAtLength:];
                if (v30)
                {
                  [v22 addInfoFromRegion:v28];
                  [v19 replaceObjectAtIndex:i + 1 withObject:v30];
                }
              }
            }
          }
        }
      }
    }
  }

  _Block_object_dispose(v58, 8);
}

void sub_1A7D324C8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void __listKernelCoreRegions_block_invoke(uint64_t a1, uint64_t a2)
{
  int v4 = (char *)objc_opt_new();
  *(_OWORD *)(v4 + _Block_object_dispose(&STACK[0x280], 8) = *(_OWORD *)a2;
  *((_DWORD *)v4 + 6) = *(_DWORD *)(a2 + 32);
  *((_DWORD *)v4 + 7) = *(_DWORD *)(a2 + 36);
  v4[50] = 2;
  *((_DWORD *)v4 + 13) = 3;
  [*(id *)(a1 + 32) addObject:v4];
}

void __listKernelCoreRegions_block_invoke_2(uint64_t a1)
{
  unint64_t Range = CSRegionGetRange();
  uint64_t v5 = 0;
  findRegionForAddress(*(void **)(a1 + 32), Range, (void **)&v5);
  unsigned int v3 = v5;
  if (v5)
  {
    *((unsigned char *)v5 + 132) |= 2u;
    if (!v3[4])
    {
      int v4 = v3;
      objc_storeStrong(v3 + 5, (id)VMUunusedButDirtySharedLibDataPath);
      unsigned int v3 = v4;
    }
  }
}

void __listKernelCoreRegions_block_invoke_3(uint64_t a1, void *a2, unint64_t a3, uint64_t a4, int a5, int a6)
{
  uint64_t v10 = a2;
  id v27 = a2;
  if ([*(id *)(a1 + 32) count])
  {
    unint64_t v12 = 0;
    uint64_t v13 = a4 - a3;
    if (a6) {
      int v14 = 1;
    }
    else {
      int v14 = 3;
    }
    uint64_t v15 = (void *)MEMORY[0x1E4F14B00];
    int v32 = a5;
    int v30 = v10;
    unint64_t v31 = a3;
    uint64_t v29 = v13;
    int v28 = v14;
    do
    {
      uint64_t v16 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v12];
      if (VMURangeIntersectsRange(a3, v13, *(void *)(v16 + 8), *(void *)(v16 + 16)))
      {
        *(_DWORD *)(v16 + 104) = 1;
        objc_storeStrong((id *)(v16 + 32), v10);
        *(_DWORD *)(v16 + 2_Block_object_dispose(&STACK[0x280], 8) = 3;
        *(_DWORD *)(v16 + 24) = v14;
        if (a5)
        {
          *(_DWORD *)(v16 + 144) = a5;
          uint64_t v17 = *(void **)(v16 + 40);
          *(void *)(v16 + 40) = @"zalloc (no zone)";
        }
        unint64_t v18 = *(void *)(v16 + 16) >> *MEMORY[0x1E4F14AF8];
        if (v18 >= 2)
        {
          unint64_t v19 = v18 - 1;
          unint64_t v20 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v18 - 1];
          id v21 = (id)v16;
          unint64_t v22 = v19;
          do
          {
            uint64_t v23 = [v21 breakAtLength:*v15];
            if (v23)
            {
              [v20 addObject:v23];
              id v24 = v23;

              id v21 = v24;
            }

            --v22;
          }
          while (v22);
          unint64_t v25 = *(void **)(a1 + 32);
          uint64_t v26 = [MEMORY[0x1E4F28D60] indexSetWithIndexesInRange:v12 + 1, v19];
          [v25 insertObjects:v20 atIndexes:v26];

          v12 += v19;
          a5 = v32;
          uint64_t v10 = v30;
          a3 = v31;
          uint64_t v13 = v29;
          int v14 = v28;
        }
      }

      ++v12;
    }
    while (v12 < [*(id *)(a1 + 32) count]);
  }
}

uint64_t __listAllRegions_block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

void __markMachOLibraries_block_invoke_3(id *a1)
{
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = __Block_byref_object_copy__7;
  v6[4] = __Block_byref_object_dispose__7;
  id v7 = 0;
  id v2 = a1[4];
  id v3 = a1[5];
  id v4 = a1[6];
  id v5 = a1[7];
  CSSymbolOwnerForeachSegment();

  _Block_object_dispose(v6, 8);
}

void sub_1A7D32A28(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void __markMachOLibraries_block_invoke_4(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1AD0D9F90]();
  unint64_t Range = CSRegionGetRange();
  uint64_t v5 = v4;
  if (VMURangeIntersectsRange(Range, v4, *(void *)(a1 + 72), *(void *)(a1 + 80)))
  {
    unint64_t v6 = getBinarySegmentName();
    if (([v6 isEqualToString:@"__LINKEDIT"] & 1) == 0)
    {
      id v7 = *(void **)(a1 + 32);
      id v8 = [NSNumber numberWithUnsignedLong:Range];
      uint64_t v9 = [v7 containsObject:v8];

      if ((v9 & 1) == 0)
      {
        uint64_t v10 = [(id)VMUunusedSharedLibLabelOrPathPrefix stringByAppendingString:v6];

        unint64_t v6 = (void *)v10;
      }
      id v11 = [*(id *)(a1 + 40) member:v6];
      if (!v11)
      {
        [*(id *)(a1 + 40) addObject:v6];
        id v11 = v6;
      }
      uint64_t v12 = *(void *)(a1 + 64);
      if (!*(void *)(*(void *)(v12 + 8) + 40))
      {
        uint64_t v13 = [NSString stringWithUTF8String:CSSymbolOwnerGetPath()];
        uint64_t v14 = [v13 stringByResolvingSymlinksInPath];
        uint64_t v15 = *(void *)(*(void *)(a1 + 64) + 8);
        uint64_t v16 = *(void **)(v15 + 40);
        *(void *)(v15 + 40) = v14;

        uint64_t v12 = *(void *)(a1 + 64);
        if ((v9 & 1) == 0)
        {
          uint64_t v17 = [(id)VMUunusedSharedLibLabelOrPathPrefix stringByAppendingString:*(void *)(*(void *)(v12 + 8) + 40)];
          uint64_t v18 = *(void *)(*(void *)(a1 + 64) + 8);
          unint64_t v19 = *(void **)(v18 + 40);
          *(void *)(v18 + 40) = v17;

          uint64_t v12 = *(void *)(a1 + 64);
        }
      }
      setTypeAndPath(*(void **)(a1 + 48), *(void **)(a1 + 56), Range, v5, v11, *(void **)(*(void *)(v12 + 8) + 40), v9, v9);
    }
  }
}

uint64_t __markMallocAreas_block_invoke(uint64_t a1, unint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  uint64_t v12 = 0;
  findRegionForAddress(*(void **)(a1 + 32), a2, (void **)&v12);
  id v7 = v12;
  if (v12)
  {
    if (!v12[5])
    {
      uint64_t v8 = [v6 stringByAppendingString:@" zone structure"];
      uint64_t v9 = (void *)v7[5];
      v7[5] = v8;

      if (*(unsigned char *)(a1 + 40))
      {
        id v10 = [v7 description];
        printf("Setting region name in %s based on malloc zone structure address for  %s\n", "markMallocAreas_block_invoke", (const char *)[v10 UTF8String]);
      }
    }
  }

  return 0;
}

void __destructor_8_s0_s56_s64_sb72(uint64_t a1)
{
  id v2 = *(void **)(a1 + 72);
}

void ___markRegionsForMallocZones_block_invoke(uint64_t a1, uint64_t a2)
{
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  int v12 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = ___markRegionsForMallocZones_block_invoke_2;
  v5[3] = &unk_1E5D24788;
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v7 = v11;
  uint64_t v8 = v4;
  char v10 = *(unsigned char *)(a1 + 48);
  id v6 = v3;
  uint64_t v9 = a2;
  VMUTask_foreach_malloc_zone(v6, v5);

  _Block_object_dispose(v11, 8);
}

void sub_1A7D32DF8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t ___markRegionsForMallocZones_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t (**a3)(uint64_t, void, uint64_t, uint64_t, void, void (*)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5)), void *a4)
{
  id v8 = a4;
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  uint64_t v37 = 0;
  uint64_t v38 = &v37;
  uint64_t v39 = 0x3010000000;
  BOOL v40 = &unk_1A7D91765;
  long long v41 = xmmword_1A7D79BF0;
  uint64_t v9 = *(void *)(a1 + 48);
  char v10 = *(void **)(v9 + 56);
  *(void *)(v9 + 4_Block_object_dispose(&STACK[0x280], 8) = 0x7FFFFFFFFFFFFFFFLL;
  *(void *)(v9 + 56) = 0;

  objc_storeStrong((id *)(*(void *)(a1 + 48) + 64), a4);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = ___markRegionsForMallocZones_block_invoke_3;
  v32[3] = &unk_1E5D24738;
  uint64_t v36 = *(void *)(a1 + 48);
  id v34 = &v37;
  id v11 = v8;
  uint64_t v12 = *(void *)(a1 + 40);
  id v33 = v11;
  uint64_t v35 = v12;
  uint64_t v13 = (void *)MEMORY[0x1AD0DA230](v32);
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  id v24 = ___markRegionsForMallocZones_block_invoke_4;
  unint64_t v25 = &unk_1E5D24760;
  uint64_t v30 = *(void *)(a1 + 48);
  int v28 = &v37;
  id v14 = v13;
  id v27 = v14;
  id v15 = v11;
  uint64_t v16 = *(void *)(a1 + 40);
  id v26 = v15;
  uint64_t v29 = v16;
  char v31 = *(unsigned char *)(a1 + 64);
  uint64_t v17 = MEMORY[0x1AD0DA230](&v22);
  uint64_t v18 = *(void *)(a1 + 48);
  unint64_t v19 = *(void **)(v18 + 72);
  *(void *)(v18 + 72) = v17;

  uint64_t v20 = (*a3)(objc_msgSend(*(id *)(a1 + 32), "taskPort", v22, v23, v24, v25), *(void *)(a1 + 48), 6, a2, *(void *)(a1 + 56), _mallocEnumerationHandler);
  if (v38[4] != 0x7FFFFFFFFFFFFFFFLL) {
    (*((void (**)(id, __CFString *))v14 + 2))(v14, @"Range remaining after enumeration");
  }

  _Block_object_dispose(&v37, 8);
  return v20;
}

void sub_1A7D33058(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void ___markRegionsForMallocZones_block_invoke_3(uint64_t a1, uint64_t a2)
{
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 56) + 56) splitOutRange:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) fromRegionIndex:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) regions:*(void *)(*(void *)(a1 + 56) + 48) newZoneName:**(void **)(a1 + 56) reason:*(void *)(a1 + 32)];
  id v3 = (id *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    uint64_t v4 = v3;
    objc_storeStrong(v3 + 5, *(id *)(a1 + 32));
    id v3 = v4;
    *((_DWORD *)v4 + 37) = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
  *(_OWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = xmmword_1A7D79BF0;
}

void ___markRegionsForMallocZones_block_invoke_4(uint64_t a1, id a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v9 = (id *)*(id *)(*(void *)(a1 + 64) + 56);
  char v10 = v9;
  if (a5 != 1)
  {
    if (a5) {
      ___markRegionsForMallocZones_block_invoke_4_cold_1();
    }
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v12 = *(void *)(v11 + 40);
    if (v12 && (id)(*(void *)(v11 + 32) + v12) != a2)
    {
      uint64_t v13 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
      unint64_t v25 = v9;
LABEL_28:
      v13();
LABEL_29:
      char v10 = v25;
      goto LABEL_30;
    }
    goto LABEL_30;
  }
  id v14 = v9[5];
  unint64_t v25 = v10;
  if (!v14)
  {
    id v16 = 0;
LABEL_14:
    id v22 = v16;
    objc_storeStrong(v25 + 5, *(id *)(a1 + 32));
    *((_DWORD *)v25 + 37) = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    *(_OWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 32) = xmmword_1A7D79BF0;
    if ([v25 isUntaggedRegion])
    {
      [v25 setAsMallocRegion];
      objc_storeStrong(v25 + 4, (id)VMUmallocOtherRegionLabel);
      if (*(unsigned char *)(a1 + 72))
      {
        id v23 = [v25 description];
        printf("ISSUE:  Region user_tag should already be set; setting to VM_MEMORY_MALLOC in %s based on enumeration range for  %s\n",
          "_markRegionsForMallocZones_block_invoke_4",
          (const char *)[v23 UTF8String]);
      }
    }
    if (*(unsigned char *)(a1 + 72))
    {
      if (([v22 isEqualToString:v25[5]] & 1) == 0)
      {
        id v24 = [v25 description];
        printf("Setting region name in %s based on enumeration range for  %s\n", "_markRegionsForMallocZones_block_invoke_4", (const char *)[v24 UTF8String]);

        if (v22) {
          printf(" Old region name was %s\n", (const char *)[v22 UTF8String]);
        }
      }
    }

    goto LABEL_29;
  }
  int v15 = [v14 hasSuffix:@" zone structure"];
  char v10 = v25;
  id v16 = v25[5];
  if (v15) {
    goto LABEL_14;
  }
  if (v16 != *(id *)(a1 + 32))
  {
    id v17 = v25[1];
    unint64_t v18 = (unint64_t)v17 + (void)v25[2];
    if ((unint64_t)a2 + a3 < v18) {
      unint64_t v18 = (unint64_t)a2 + a3;
    }
    uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v20 = *(void *)(v19 + 32);
    if (v20 == 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v21 = v18 - (void)a2;
      *(void *)(v19 + 32) = a2;
    }
    else
    {
      if (a2 > v17) {
        id v17 = a2;
      }
      if ((id)(*(void *)(v19 + 40) + v20) != v17) {
        ___markRegionsForMallocZones_block_invoke_4_cold_2();
      }
      unint64_t v21 = v18 - v20;
    }
    *(void *)(v19 + 40) = v21;
    if ((char *)(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)
                + *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 32)) == (char *)v25[1] + (void)v25[2])
    {
      uint64_t v13 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
      goto LABEL_28;
    }
  }
LABEL_30:
}

void _mallocEnumerationHandler(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  if (a5)
  {
    uint64_t v6 = 0;
    uint64_t v18 = a5;
    id v7 = (void **)(a2 + 56);
    do
    {
      id v8 = (unint64_t *)(a4 + 16 * v6);
      unint64_t v9 = *v8;
      uint64_t v10 = v8[1];
      unint64_t v11 = *v8 + v10;
      if (__CFADD__(*v8, v10))
      {
        NSLog(&cfstr_ErrorInEnumera.isa, *(void *)(a2 + 64), v9, v11, v10, *(void *)(a2 + 40));
        if (!*(unsigned char *)(a2 + 32)) {
LABEL_23:
        }
          abort();
      }
      unint64_t v12 = v9;
      if (*(void *)(a2 + 24))
      {
        if (!VMURangeIntersectsRange(v9, v10, *(void *)(a2 + 8), *(void *)(a2 + 16))) {
          goto LABEL_21;
        }
        if (v9 <= *(void *)(a2 + 8)) {
          unint64_t v12 = *(void *)(a2 + 8);
        }
        else {
          unint64_t v12 = v9;
        }
      }
      (*(void (**)(void))(*(void *)(a2 + 72) + 16))();
      if (v12 < v11)
      {
        while (1)
        {
          if (!*v7 || v12 - *((void *)*v7 + 1) >= *((void *)*v7 + 2))
          {
            *(void *)(a2 + 4_Block_object_dispose(&STACK[0x280], 8) = findRegionForAddress(*(void **)a2, v12, v7);
            if (!*(void *)(a2 + 56)) {
              break;
            }
          }
          (*(void (**)(void))(*(void *)(a2 + 72) + 16))();
          unint64_t v12 = *(void *)(*(void *)(a2 + 56) + 16) + *(void *)(*(void *)(a2 + 56) + 8);
          if (v12 >= v11) {
            goto LABEL_21;
          }
          unint64_t v13 = *(void *)(a2 + 48) + 1;
          *(void *)(a2 + 4_Block_object_dispose(&STACK[0x280], 8) = v13;
          if (v13 >= [*(id *)a2 count])
          {
            uint64_t v14 = 0;
          }
          else
          {
            uint64_t v14 = [*(id *)a2 objectAtIndexedSubscript:*(void *)(a2 + 48)];
          }
          int v15 = *v7;
          *id v7 = (void *)v14;
        }
        uint64_t v16 = *(void *)(a2 + 64);
        id v17 = VMURangeDescription(v9, v10);
        NSLog(&cfstr_ErrorInEnumera_0.isa, v16, v17, *(void *)(a2 + 40));

        if (!*(unsigned char *)(a2 + 32)) {
          goto LABEL_23;
        }
      }
LABEL_21:
      ++v6;
    }
    while (v6 != v18);
  }
}

void ___getRegionMallocStatistics_block_invoke(uint64_t a1, uint64_t a2)
{
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  int v15 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = ___getRegionMallocStatistics_block_invoke_2;
  v7[3] = &unk_1E5D24800;
  uint64_t v10 = v14;
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v8 = v5;
  uint64_t v11 = v6;
  char v13 = *(unsigned char *)(a1 + 56);
  id v9 = *(id *)(a1 + 32);
  uint64_t v12 = a2;
  VMUTask_foreach_malloc_zone(v4, v7);

  _Block_object_dispose(v14, 8);
}

void sub_1A7D336DC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t ___getRegionMallocStatistics_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t (**a3)(uint64_t, void, uint64_t, uint64_t, void, void (*)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5)), void *a4)
{
  id v8 = a4;
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  id v9 = malloc_type_calloc(1uLL, 0x50uLL, 0x10000404247E4FDuLL);
  NSMapInsertKnownAbsent(*(NSMapTable **)(a1 + 32), v8, v9);
  uint64_t v10 = *(void *)(a1 + 56);
  uint64_t v11 = *(void **)(v10 + 56);
  *(void *)(v10 + 4_Block_object_dispose(&STACK[0x280], 8) = 0x7FFFFFFFFFFFFFFFLL;
  *(void *)(v10 + 56) = 0;

  objc_storeStrong((id *)(*(void *)(a1 + 56) + 64), a4);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = ___getRegionMallocStatistics_block_invoke_3;
  v20[3] = &unk_1E5D247D8;
  uint64_t v13 = *(void *)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 56);
  id v23 = v9;
  uint64_t v24 = v12;
  id v21 = v8;
  uint64_t v22 = v13;
  char v25 = *(unsigned char *)(a1 + 72);
  id v14 = v8;
  uint64_t v15 = MEMORY[0x1AD0DA230](v20);
  uint64_t v16 = *(void *)(a1 + 56);
  id v17 = *(void **)(v16 + 72);
  *(void *)(v16 + 72) = v15;

  uint64_t v18 = (*a3)([*(id *)(a1 + 40) taskPort], *(void *)(a1 + 56), 7, a2, *(void *)(a1 + 64), _mallocEnumerationHandler);
  return v18;
}

void ___getRegionMallocStatistics_block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  if (a5 == 1)
  {
    id v8 = *(id *)(*(void *)(a1 + 56) + 56);
    if (*((_DWORD *)v8 + 37) == -1 || !*((void *)v8 + 5))
    {
      *((_DWORD *)v8 + 37) = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      id v10 = v8;
      objc_storeStrong((id *)v8 + 5, *(id *)(a1 + 32));
      id v8 = v10;
      if (*(unsigned char *)(a1 + 64))
      {
        id v9 = [v10 description];
        printf("Setting region name in %s based on enumeration for  %s\n", "_getRegionMallocStatistics_block_invoke_3", (const char *)[v9 UTF8String]);

        id v8 = v10;
      }
    }
    if (*((_DWORD *)v8 + 37) == *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      if (a4) {
        ++*((void *)v8 + 17);
      }
      *((_DWORD *)v8 + 36) |= a4;
    }
  }
  else
  {
    if (a5) {
      ___getRegionMallocStatistics_block_invoke_3_cold_1();
    }
    if (a4)
    {
      int64x2_t v7 = vdupq_n_s64(1uLL);
      v7.i64[0] = a3;
      *(int64x2_t *)*(void *)(a1 + 4_Block_object_dispose(&STACK[0x280], 8) = vaddq_s64(*(int64x2_t *)*(void *)(a1 + 48), v7);
    }
  }
}

BOOL _copy_remote_mangled_symbol_value(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, size_t a5, void *a6)
{
  id v8 = (const void *)_map_remote_mangled_symbol_value(a1, a2, a3, a4, a5);
  if (v8) {
    memcpy(a6, v8, a5);
  }
  else {
    bzero(a6, a5);
  }
  return v8 != 0;
}

uint64_t _map_remote_mangled_symbol_value(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = a1;
  CSSymbolOwnerGetSymbolWithMangledName();
  uint64_t Range = CSSymbolGetRange();
  if (Range) {
    uint64_t v8 = v6[2](v6, Range, a5);
  }
  else {
    uint64_t v8 = 0;
  }

  return v8;
}

void printFigSubclassInfo(void *a1, void *a2, void *a3)
{
  id v8 = a1;
  id v5 = a2;
  id v6 = a3;
  if ((printFigSubclassInfo_printedHeader & 1) == 0)
  {
    if (getenv("DT_PRINT_FIG_SUBCLASSES"))
    {
      printFigSubclassInfo_printIt = 1;
      int64x2_t v7 = (FILE **)MEMORY[0x1E4F143C8];
      fprintf((FILE *)*MEMORY[0x1E4F143C8], "%-36s  %-60s  %s\n", "CFType", "Fig Subclass", "FigBaseClass symbol name");
      fprintf(*v7, "%-36s  %-60s  %s\n", "======", "============", "========================");
    }
    printFigSubclassInfo_printedHeader = 1;
  }
  if (printFigSubclassInfo_printIt == 1) {
    fprintf((FILE *)*MEMORY[0x1E4F143C8], "%-36s %-60s %s\n", (const char *)[v8 UTF8String], (const char *)[v5 UTF8String], (const char *)[v6 UTF8String]);
  }
}

uint64_t closureContextMayHaveGenericCaptures(uint64_t a1, void *a2)
{
  v6[0] = 0;
  v6[1] = 0;
  uint64_t v7 = 0;
  uint64_t result = [a2 copyRange:a1 to:24];
  if (result)
  {
    LODWORD(v5[1]) = 0;
    v5[0] = 0;
    int v4 = [a2 copyRange:v7 to:12, v5];
    uint64_t result = 0;
    if (v4) {
      return *(void *)((char *)v5 + 4) != 0;
    }
  }
  return result;
}

void sub_1A7D36BCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

#error "1A7D3AFF8: call analysis failed (funcsize=52)"

void sub_1A7D3B034(_Unwind_Exception *a1)
{
}

void sub_1A7D3B64C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1A7D3BBC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7D3C044(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  __destructor_8_sb16_s24_s32_w56_w64((id *)va);
  _Unwind_Resume(a1);
}

void __copy_assignment_8_8_t0w16_sb16_s24_s32_t40w16_w56_w64(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v4 = MEMORY[0x1AD0DA230](*(void *)(a2 + 16));
  id v5 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v4;

  objc_storeStrong((id *)(a1 + 24), *(id *)(a2 + 24));
  objc_storeStrong((id *)(a1 + 32), *(id *)(a2 + 32));
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a2 + 56));
  objc_storeWeak((id *)(a1 + 56), WeakRetained);
  id v6 = objc_loadWeakRetained((id *)(a2 + 64));
  objc_storeWeak((id *)(a1 + 64), v6);
}

uint64_t _query_data_layout_function(uint64_t a1, int a2, uint64_t a3, unsigned char *a4)
{
  switch(a2)
  {
    case 0:
    case 1:
      *a4 = 8;
      goto LABEL_11;
    case 2:
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
      uint64_t v7 = [WeakRetained vmuTask];
      *(void *)a4 = -[VMUTask ptrauthStripFunctionPointer:]((uint64_t)v7, 0x7FFFFFFFFFFFFLL);
      goto LABEL_10;
    case 3:
      id v8 = objc_loadWeakRetained((id *)(a1 + 56));
      uint64_t v9 = [v8 vmuTask];
      [v9 isExclaveCore];

      *a4 = 0;
      goto LABEL_11;
    case 4:
      id v10 = objc_loadWeakRetained((id *)(a1 + 56));
      uint64_t v11 = [v10 vmuTask];
      int v12 = [v11 isExclaveCore];

      uint64_t v13 = 4096;
      if (!v12) {
        uint64_t v13 = 0x100000000;
      }
      *(void *)a4 = v13;
      goto LABEL_11;
    case 5:
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
      uint64_t v7 = [WeakRetained vmuTask];
      *a4 = [v7 isExclaveCore] ^ 1;
LABEL_10:

LABEL_11:
      uint64_t result = 1;
      break;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

uint64_t _read_bytes_function(uint64_t a1, void *key, unint64_t a3, void *a4)
{
  unint64_t v24 = 0;
  uint64_t v25 = 0;
  ++*(_DWORD *)(a1 + 48);
  if (a4) {
    *a4 = 0;
  }
  uint64_t v7 = NSMapGet(*(NSMapTable **)(a1 + 24), key);
  if (!v7)
  {
LABEL_8:
    int v11 = *(unsigned __int8 *)(a1 + 40);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    uint64_t v13 = WeakRetained;
    if (!v11)
    {
      uint64_t v20 = [WeakRetained memoryCache];
      [v20 mapAddress:key size:a3 returnedAddress:&v25 returnedSize:&v24];

      int v21 = *(_DWORD *)(a1 + 44);
      if (v25)
      {
        if ((v21 & 0xFFFFFFFE) == 2) {
          fprintf((FILE *)*MEMORY[0x1E4F143C8], "%#llx[%llu] --> %#llx[%llu]  READ_BYTES CACHE MISS (UNVALIDATED)\n");
        }
      }
      else if ((v21 - 1) <= 2)
      {
        fprintf((FILE *)*MEMORY[0x1E4F143C8], "%#llx[%llu] FAIL! READ_BYTES (UNVALIDATED) COULD NOT MAP\n");
      }
      goto LABEL_28;
    }
    id v14 = (id *)[WeakRetained validateAddressRangeForSwiftRemoteMirror:key allowUnusedSplitLibs:a3];

    if (!v14)
    {
      if ((*(_DWORD *)(a1 + 44) - 1) <= 2) {
        fprintf((FILE *)*MEMORY[0x1E4F143C8], "%#llx[%llu] FAIL! READ_BYTES REGION NOT FOUND\n");
      }
      goto LABEL_28;
    }
    [*v14 range];
    id v15 = objc_loadWeakRetained((id *)(a1 + 64));
    uint64_t v16 = [v15 memoryCache];
    [v16 mapAddress:key size:a3 returnedAddress:&v25 returnedSize:&v24];

    int v17 = *(_DWORD *)(a1 + 44);
    if (v25)
    {
      if ((v17 & 0xFFFFFFFE) == 2)
      {
        uint64_t v18 = (FILE *)*MEMORY[0x1E4F143C8];
        id v19 = [*v14 description];
        [v19 UTF8String];
        fprintf(v18, "%#llx[%llu] --> %#llx[%llu] in %s  READ_BYTES CACHE MISS (VALIDATED)  -------------\n");
LABEL_25:
      }
    }
    else if ((v17 - 1) <= 2)
    {
      uint64_t v22 = (FILE *)*MEMORY[0x1E4F143C8];
      id v19 = [*v14 description];
      [v19 UTF8String];
      fprintf(v22, "%#llx[%llu] FAIL! READ_BYTES COULD NOT MAP, ALTHOUGH FOUND REGION %s\n");
      goto LABEL_25;
    }
LABEL_28:
    if (!v7)
    {
      uint64_t v7 = malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
      NSMapInsert(*(NSMapTable **)(a1 + 24), key, v7);
    }
    uint64_t v8 = v25;
    *uint64_t v7 = v25;
    v7[1] = v24;
    return v8;
  }
  VMUClearCrashReporterInfo();
  uint64_t v8 = *v7;
  if (*v7)
  {
    unint64_t v9 = v7[1];
    unint64_t v24 = v9;
    uint64_t v25 = v8;
    int v10 = *(_DWORD *)(a1 + 44);
    if (v9 < a3)
    {
      if ((v10 - 1) <= 2) {
        fprintf((FILE *)*MEMORY[0x1E4F143C8], "%#llx[%llu] --> %#llx[%llu]  FAIL! READ_BYTES CACHE HIT, BUT NEED TO MAP MORE\n", key, a3, v8, v9);
      }
      goto LABEL_8;
    }
    if (v10 == 3) {
      fprintf((FILE *)*MEMORY[0x1E4F143C8], "%#llx[%llu] --> %#llx[%llu]  READ_BYTES CACHE HIT\n", key, a3, v8, v9);
    }
  }
  else
  {
    if ((*(_DWORD *)(a1 + 44) - 1) <= 2) {
      fprintf((FILE *)*MEMORY[0x1E4F143C8], "%#llx[%llu] --> 0x0[0]  NOT FOUND  READ_BYTES CACHE HIT\n", key, a3);
    }
    return 0;
  }
  return v8;
}

size_t _get_string_length(uint64_t a1, const void *a2)
{
  size_t __n = 0;
  __s1 = 0;
  ++*(_DWORD *)(a1 + 52);
  uint64_t v4 = NSMapGet(*(NSMapTable **)(a1 + 32), a2);
  if (v4)
  {
    if (v4 == (void *)0xFFFFFFFFLL) {
      size_t v5 = 0;
    }
    else {
      size_t v5 = (size_t)v4;
    }
    if (*(_DWORD *)(a1 + 44) == 3) {
      fprintf((FILE *)*MEMORY[0x1E4F143C8], "%#llx --> %llu  STRING_LENGTH CACHE HIT\n", a2, v5);
    }
    return v5;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v7 = (id *)[WeakRetained validateAddressRangeForSwiftRemoteMirror:a2 allowUnusedSplitLibs:0];

  if (v7)
  {
    uint64_t v8 = [*v7 range];
    uint64_t v10 = v9 - (void)a2 + v8;
    id v11 = objc_loadWeakRetained((id *)(a1 + 64));
    int v12 = [v11 memoryCache];
    [v12 mapAddress:a2 size:v10 returnedAddress:&__s1 returnedSize:&__n];

    uint64_t v13 = __s1;
    if (__s1)
    {
      size_t v5 = __n;
      size_t v14 = strnlen(__s1, __n);
      int v15 = *(_DWORD *)(a1 + 44);
      if (v14 == v5)
      {
        if ((v15 - 1) <= 2) {
          fprintf((FILE *)*MEMORY[0x1E4F143C8], "%#llx  FAIL! STRING_LENGTH DID NOT FIND NULL TERMINATOR IN %llu BYTES FOR STRING LENGTH OF %.*s\n", a2, v5, v5, v13);
        }
      }
      else
      {
        size_t v18 = v14;
        if ((v15 & 0xFFFFFFFE) == 2) {
          fprintf((FILE *)*MEMORY[0x1E4F143C8], "%#llx --> %llu  STRING_LENGTH CACHE MISS OF %s\n", a2, v14, v13);
        }
        size_t v5 = v18;
      }
      goto LABEL_20;
    }
    if ((*(_DWORD *)(a1 + 44) - 1) <= 2)
    {
      uint64_t v16 = (FILE *)*MEMORY[0x1E4F143C8];
      id v17 = [*v7 description];
      fprintf(v16, "%#llx FAIL! STRING_LENGTH COULD NOT MAP, ALTHOUGH FOUND REGION %s\n", a2, (const char *)[v17 UTF8String]);
    }
  }
  else if ((*(_DWORD *)(a1 + 44) - 1) <= 2)
  {
    fprintf((FILE *)*MEMORY[0x1E4F143C8], "%#llx  FAIL! NO VM REGION FOR STRING LENGTH\n", a2);
  }
  size_t v5 = 0;
LABEL_20:
  if (!NSMapGet(*(NSMapTable **)(a1 + 24), a2))
  {
    id v19 = malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
    size_t v20 = __n;
    *id v19 = __s1;
    v19[1] = v20;
    NSMapInsert(*(NSMapTable **)(a1 + 24), a2, v19);
  }
  if (v5) {
    uint64_t v21 = v5;
  }
  else {
    uint64_t v21 = 0xFFFFFFFFLL;
  }
  NSMapInsert(*(NSMapTable **)(a1 + 32), a2, (const void *)v21);
  return v5;
}

uint64_t _get_symbol_address(uint64_t a1, const char *a2)
{
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3010000000;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  id v19 = &unk_1A7D91765;
  if (isatty(0)) {
    BOOL v4 = isatty(2) != 0;
  }
  else {
    BOOL v4 = 0;
  }
  if (!strncmp(a2, "objc", 4uLL))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    [WeakRetained libobjcSymbolOwner];
LABEL_14:

    goto LABEL_15;
  }
  if (!strncmp(a2, "swift", 5uLL) || !strncmp(a2, "_swift_debug", 0xCuLL))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    id v6 = [WeakRetained vmuTask];
    if (![v6 isExclaveCore])
    {
LABEL_12:
      CSSymbolicatorGetSymbolOwnerWithNameAtTime();
      goto LABEL_13;
    }
LABEL_10:
    CSSymbolicatorGetSymbolOwner();
LABEL_13:

    goto LABEL_14;
  }
  if (!strncmp(a2, "_swift_concurrency", 0x12uLL))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    id v6 = [WeakRetained vmuTask];
    if (![v6 isExclaveCore]) {
      goto LABEL_12;
    }
    goto LABEL_10;
  }
LABEL_15:
  if (!CSIsNull())
  {
    SymbolWithuint64_t Name = CSSymbolOwnerGetSymbolWithName();
    uint64_t v8 = v17;
    void v17[4] = SymbolWithName;
    v8[5] = v9;
  }
  if (CSIsNull())
  {
    CSSymbolicatorForeachSymbolOwnerAtTime();
    if (CSIsNull())
    {
      uint64_t SymbolWithNameAtTime = CSSymbolicatorGetSymbolWithNameAtTime();
      id v11 = v17;
      void v17[4] = SymbolWithNameAtTime;
      v11[5] = v12;
      if ((CSIsNull() & 1) == 0)
      {
        CSSymbolGetSymbolOwner();
        uint64_t Name = (const char *)CSSymbolOwnerGetName();
        if (((CSIsNull() | !v4) & 1) == 0) {
          fprintf((FILE *)*MEMORY[0x1E4F143C8], "Symbolication.framework _get_symbol_owner found requested symbol %s in unexpected non-Swift library %s\n", a2, Name);
        }
      }
    }
  }
  if (CSIsNull())
  {
    if (v4) {
      fprintf((FILE *)*MEMORY[0x1E4F143C8], "Symbolication.framework _get_symbol_owner did not find requested symbol %s\n", a2);
    }
    uint64_t Range = 0;
  }
  else
  {
    uint64_t Range = CSSymbolGetRange();
  }
  _Block_object_dispose(&v16, 8);
  return Range;
}

void sub_1A7D3CB50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __destructor_8_sb16_s24_s32_w56_w64(id *a1)
{
  objc_destroyWeak(a1 + 7);

  objc_destroyWeak(a1 + 8);
}

uint64_t ___get_symbol_address_block_invoke(uint64_t a1)
{
  uint64_t result = CSIsNull();
  if (result)
  {
    uint64_t Name = (const char *)CSSymbolOwnerGetName();
    uint64_t result = strncmp(Name, "libswift", 8uLL);
    if (!result)
    {
      SymbolWithuint64_t Name = CSSymbolOwnerGetSymbolWithName();
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
      *(void *)(v5 + 32) = SymbolWithName;
      *(void *)(v5 + 40) = v6;
      uint64_t result = CSIsNull();
      if ((result & 1) == 0)
      {
        if (*(unsigned char *)(a1 + 48)) {
          return fprintf((FILE *)*MEMORY[0x1E4F143C8], "Symbolication.framework _get_symbol_owner found requested symbol %s in unexpected Swift library %s\n", *(const char **)(a1 + 40), Name);
        }
      }
    }
  }
  return result;
}

uint64_t btref_decode_unslide(void *a1, unsigned int a2, void *a3, uint64_t a4, uint64_t a5)
{
  if ((a2 & 0xC000003E) != 0) {
    return 0;
  }
  uint64_t v16 = v5;
  uint64_t v17 = v6;
  unsigned int v10 = 12 - __clz(a2);
  if (!(a2 >> 20)) {
    unsigned int v10 = 0;
  }
  uint64_t v15 = *(void *)(a4 + 8 * v10 + 88) + a2;
  [a1 peekAtAddress:size:returnsBuf:];
  int v11 = *(_DWORD *)(v15 + 4);
  uint64_t result = v11 & 0xF;
  if ((v11 & 0xF) != 0)
  {
    uint64_t v12 = (int *)(v15 + 12);
    uint64_t v13 = v11 & 0xF;
    do
    {
      uint64_t v14 = *v12++;
      *a3++ = v14 + a5;
      --v13;
    }
    while (v13);
  }
  return result;
}

void sub_1A7D41B8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id descriptionForCallstackFrames(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = objc_opt_new();
  uint64_t v5 = v4;
  uint64_t v17 = v3;
  if (*(void *)(a1 + 24))
  {
    uint64_t v6 = [v4 stringByAppendingString:v3];

    uint64_t v7 = [v6 stringByAppendingString:@"\n"];

    if (*(_DWORD *)(a1 + 40))
    {
      unint64_t v8 = 0;
      do
      {
        CSSymbolicatorGetSymbolWithAddressAtTime();
        CSSymbolGetSymbolOwner();
        CSSymbolicatorGetSectionWithAddressAtTime();
        uint64_t Name = CSSymbolGetName();
        if (Name) {
          unsigned int v10 = (const char *)Name;
        }
        else {
          unsigned int v10 = "symbol name not found";
        }
        uint64_t v11 = *(void *)(*(void *)(a1 + 24) + 8 * v8);
        uint64_t v12 = CSSymbolOwnerGetName();
        uint64_t v13 = CSRegionGetName();
        uint64_t v5 = [v7 stringByAppendingFormat:@"\t[%3d] %#08.8qx  {%s.%s + %#qx} %s\n", v8, v11, v12, v13, *(void *)(*(void *)(a1 + 24) + 8 * v8) - CSRegionGetRange(), v10];

        uint64_t v14 = *(void *)(a1 + 32);
        if (v14)
        {
          uint64_t v15 = [v5 stringByAppendingFormat:@"\t\tframe pointer %#llx\n", *(void *)(v14 + 8 * v8)];

          uint64_t v5 = (void *)v15;
        }
        ++v8;
        uint64_t v7 = v5;
      }
      while (v8 < *(unsigned int *)(a1 + 40));
    }
    else
    {
      uint64_t v5 = v7;
    }
  }

  return v5;
}

__CFString *VMUPlatformNameForPlatform(uint64_t a1)
{
  if ((a1 - 1) >= 0x18)
  {
    [NSString stringWithFormat:@"unknown-%u", a1];
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E5D24E30[(int)a1 - 1];
  }

  return v1;
}

__CFString *VMUPlatformNameForTask()
{
  uint64_t v0 = CSPlatformForTask();

  return VMUPlatformNameForPlatform(v0);
}

BOOL VMUProcessIsAnalyzable(BOOL result)
{
  if (result)
  {
    pid_t v1 = result;
    return !kill(result, 0) || !getuid() && getpgid(v1) > 0;
  }
  return result;
}

uint64_t pidFromHint(void *a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = v1;
  if (!v1 || ![v1 length])
  {
    uint64_t v5 = 0;
    goto LABEL_41;
  }
  id v3 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
  BOOL v4 = [v3 invertedSet];

  if ([v2 rangeOfCharacterFromSet:v4] == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = [v2 integerValue];
    goto LABEL_40;
  }
  id v36 = v2;
  uint64_t v32 = MEMORY[0x1AD0D9F90]();
  pid_t v6 = getpid();
  id v34 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = +[VMUProcInfo getProcessIds];
  uint64_t v7 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (!v7)
  {
    uint64_t v9 = 0;
    goto LABEL_26;
  }
  uint64_t v8 = v7;
  uint64_t v9 = 0;
  uint64_t v10 = *(void *)v38;
  do
  {
    uint64_t v11 = 0;
    uint64_t v12 = v9;
    do
    {
      if (*(void *)v38 != v10) {
        objc_enumerationMutation(obj);
      }
      uint64_t v13 = *(void **)(*((void *)&v37 + 1) + 8 * v11);
      uint64_t v14 = (void *)MEMORY[0x1AD0D9F90]();
      uint64_t v15 = [v13 integerValue];
      if (v6 == v15)
      {
        uint64_t v9 = v12;
        goto LABEL_22;
      }
      uint64_t v9 = [[VMUProcInfo alloc] initWithPid:v15];

      uint64_t v16 = [(VMUProcInfo *)v9 procTableName];
      uint64_t v17 = [(VMUProcInfo *)v9 name];
      if (([v17 isEqualToString:v36] & 1) != 0
        || [v16 isEqualToString:v36])
      {
        BOOL haveSufficientAccessToProcess = _haveSufficientAccessToProcess(v15);
        id v19 = v34;
        if (!haveSufficientAccessToProcess) {
          goto LABEL_21;
        }
      }
      else
      {
        [v17 rangeOfString:v36];
        if (!v20)
        {
          [v16 rangeOfString:v36];
          if (!v21) {
            goto LABEL_21;
          }
        }
        BOOL v22 = _haveSufficientAccessToProcess(v15);
        id v19 = v33;
        if (!v22) {
          goto LABEL_21;
        }
      }
      [v19 addObject:v9];
LABEL_21:

      uint64_t v12 = v9;
LABEL_22:
      ++v11;
    }
    while (v8 != v11);
    uint64_t v8 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
  }
  while (v8);
LABEL_26:

  uint64_t v23 = [v34 count];
  if (!v23)
  {
    uint64_t v26 = [v33 count];
    id v2 = v36;
    unint64_t v24 = (void *)v32;
    if (v26)
    {
      if (v26 == 1)
      {
        uint64_t v25 = [v33 lastObject];

        uint64_t v5 = [(VMUProcInfo *)v25 pid];
        id v27 = (FILE *)*MEMORY[0x1E4F143C8];
        id v28 = [(VMUProcInfo *)v25 name];
        fprintf(v27, "Found process %d (%s) from partial name %s\n", v5, (const char *)[v28 UTF8String], (const char *)[v36 UTF8String]);

LABEL_32:
        uint64_t v9 = v25;
        goto LABEL_39;
      }
      if (isatty(0) && isatty(2))
      {
        uint64_t v29 = (FILE **)MEMORY[0x1E4F143C8];
        fprintf((FILE *)*MEMORY[0x1E4F143C8], "You have access to multiple processes that match the partial name %s:\n", (const char *)[v36 UTF8String]);
        uint64_t v30 = v33;
        goto LABEL_34;
      }
    }
    uint64_t v5 = 0;
    goto LABEL_39;
  }
  id v2 = v36;
  unint64_t v24 = (void *)v32;
  if (v23 == 1)
  {
    uint64_t v25 = [v34 lastObject];

    uint64_t v5 = [(VMUProcInfo *)v25 pid];
    goto LABEL_32;
  }
  uint64_t v29 = (FILE **)MEMORY[0x1E4F143C8];
  fprintf((FILE *)*MEMORY[0x1E4F143C8], "You have access to multiple processes named %s:\n", (const char *)[v36 UTF8String]);
  uint64_t v30 = v34;
LABEL_34:
  uint64_t v5 = choosePid(v30);
  fputc(10, *v29);
LABEL_39:

LABEL_40:

LABEL_41:
  return v5;
}

BOOL _haveSufficientAccessToProcess(BOOL a1)
{
  if (!VMUProcessIsAnalyzable(a1)) {
    return 0;
  }
  id v1 = (ipc_space_t *)MEMORY[0x1E4F14960];
  int v2 = task_read_for_pid();
  BOOL v3 = v2 == 0;
  if (!v2) {
    mach_port_deallocate(*v1, 0);
  }
  return v3;
}

uint64_t choosePid(void *a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  unint64_t v25 = [v1 count];
  if (v25)
  {
    uint64_t v2 = 0;
    unsigned int v3 = 0;
    BOOL v4 = 0;
    do
    {
      id v5 = [v1 objectAtIndexedSubscript:v2];

      if (v3 > 0x19) {
        __strlcpy_chk();
      }
      else {
        snprintf(__str, 3uLL, "%c)", v3 + 97);
      }
      pid_t v6 = (FILE *)*MEMORY[0x1E4F143C8];
      int v7 = [v5 pid];
      id v8 = [v5 userAppName];
      fprintf(v6, "    %s %5d %s\n", __str, v7, (const char *)[v8 UTF8String]);

      uint64_t v2 = ++v3;
      BOOL v4 = v5;
    }
    while (v25 > v3);
  }
  else
  {
    id v5 = 0;
  }
  if (isatty(0) && isatty(2))
  {
    uint64_t v9 = "Which process? (letter or PID) ";
    uint64_t v10 = (FILE **)MEMORY[0x1E4F143D0];
    while (1)
    {
      fwrite(v9, 0x1FuLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
      for (unint64_t i = *v10; !fgets(__str, 8, i); clearerr(i))
      {
        if (!ferror(i) || *__error() != 4) {
          exit(0);
        }
      }
      if (__str[0] >= 97 && __str[1] == 10 && __str[0] - 97 < v25)
      {
        uint64_t v13 = [v1 objectAtIndexedSubscript:];
        uint64_t v14 = [v13 pid];

        if (v14) {
          break;
        }
      }
      unsigned int v30 = 0;
      if (sscanf(__str, "%d", &v30) == 1)
      {
        uint64_t v15 = v10;
        uint64_t v16 = v9;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v17 = v1;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v31 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          LODWORD(v14) = 0;
          uint64_t v20 = *(void *)v27;
          do
          {
            uint64_t v21 = 0;
            BOOL v22 = v5;
            do
            {
              if (*(void *)v27 != v20) {
                objc_enumerationMutation(v17);
              }
              id v5 = *(id *)(*((void *)&v26 + 1) + 8 * v21);

              int v23 = [v5 pid];
              if (v23 == v30) {
                uint64_t v14 = v30;
              }
              else {
                uint64_t v14 = v14;
              }
              ++v21;
              BOOL v22 = v5;
            }
            while (v19 != v21);
            uint64_t v19 = [v17 countByEnumeratingWithState:&v26 objects:v31 count:16];
          }
          while (v19);
        }
        else
        {
          uint64_t v14 = 0;
        }

        id v5 = 0;
        uint64_t v9 = v16;
        uint64_t v10 = v15;
        if (v14) {
          break;
        }
      }
    }
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

id psName(uint64_t a1)
{
  id v1 = [[VMUProcInfo alloc] initWithPid:a1];
  uint64_t v2 = [(VMUProcInfo *)v1 userAppName];
  unsigned int v3 = v2;
  if (v2)
  {
    BOOL v4 = [v2 lastPathComponent];
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

uint64_t _CRGetOSVersionDictionary()
{
  if (_CRGetOSVersionDictionary_onceToken != -1) {
    dispatch_once(&_CRGetOSVersionDictionary_onceToken, &__block_literal_global_16);
  }
  return _CRGetOSVersionDictionary__osVersionDict;
}

CFStringRef _CRCopyProcessNameForPID(int a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = buffer;
  bzero(buffer, 0x401uLL);
  int v3 = proc_name(a1, buffer, 0x400u);
  if (v3 < 0 || (buffer[v3] = 0, (v3 - 15) <= 0xFFFFFFF1))
  {
    uint64_t v2 = buffer;
    int v4 = proc_pidpath(a1, buffer, 0x400u);
    if ((v4 & 0x80000000) == 0)
    {
      buffer[v4] = 0;
      id v5 = strrchr(buffer, 47);
      if (v5) {
        uint64_t v2 = v5 + 1;
      }
    }
  }
  return CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v2, 0x8000100u);
}

CFStringRef _CRCopyExecutablePathForPID(int a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  bzero(buffer, 0x401uLL);
  int v2 = proc_pidpath(a1, buffer, 0x400u);
  if ((v2 & 0x80000000) == 0) {
    buffer[v2] = 0;
  }
  return CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E4F1CF80], buffer, 0x8000100u);
}

CFStringRef _CRCopyExecutablePathAndNameForPIDDetectingInconsistencies(int a1, CFStringRef *a2, unsigned char *a3, CFStringRef *a4, unsigned char *a5)
{
  uint64_t v5 = a5;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  *a3 = 0;
  *a5 = 0;
  uint64_t v10 = buffer;
  bzero(buffer, 0x401uLL);
  int v11 = proc_pidpath(a1, buffer, 0x400u);
  if ((v11 & 0x80000000) == 0) {
    buffer[v11] = 0;
  }
  uint64_t v12 = strrchr(buffer, 47);
  if (v12) {
    uint64_t v10 = v12 + 1;
  }
  bzero(__s1, 0x401uLL);
  int v13 = proc_name(a1, __s1, 0x400u);
  if (v13 < 0) {
    goto LABEL_9;
  }
  __s1[v13] = 0;
  if ((v13 - 15) > 0xFFFFFFF1)
  {
    int v14 = strcmp(__s1, v10);
    uint64_t v5 = a3;
    uint64_t v10 = __s1;
    if (!v14)
    {
      uint64_t v10 = __s1;
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (!v13 || strncmp(__s1, v10, 0xFuLL))
  {
LABEL_9:
    *a3 = 1;
LABEL_11:
    *uint64_t v5 = 1;
  }
LABEL_12:
  CFAllocatorRef v15 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  *a2 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E4F1CF80], buffer, 0x8000100u);
  CFStringRef result = CFStringCreateWithCString(v15, v10, 0x8000100u);
  *a4 = result;
  return result;
}

_DWORD *VMUCreateRootNodeMarkingMap(void *a1)
{
  id v1 = a1;
  int v2 = [v1 nodeNamespaceSize];
  int v3 = malloc_type_calloc(1uLL, ((v2 + 7) >> 3) + 4, 0xFF42C4F3uLL);
  *int v3 = v2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __VMUCreateRootNodeMarkingMap_block_invoke;
  v5[3] = &__block_descriptor_40_e25_v44__0I8___Qb60b4__12_B36l;
  void v5[4] = v3;
  [v1 enumerateObjectsWithBlock:v5];

  return v3;
}

BOOL __VMUCreateRootNodeMarkingMap_block_invoke(uint64_t a1, unsigned int a2, uint64_t a3)
{
  BOOL result = VMUGraphNodeType_IsRoot(*(void *)(a3 + 8) >> 60);
  if (result)
  {
    pid_t v6 = *(unsigned int **)(a1 + 32);
    if (*v6 > a2) {
      *((unsigned char *)v6 + (a2 >> 3) + 4) |= 1 << (a2 & 7);
    }
  }
  return result;
}

void VMUWithRootNodeMarkingMap(void *a1, void *a2)
{
  id v5 = a1;
  int v3 = a2;
  if (v3)
  {
    int v4 = VMUCreateRootNodeMarkingMap(v5);
    v3[2](v3, v4);
    if (v4) {
      free(v4);
    }
  }
}

uint64_t VMULiteZoneIndex(void *a1)
{
  id v1 = a1;
  if ([v1 zoneCount])
  {
    uint64_t v2 = 0;
    LODWORD(v3) = -1;
    do
    {
      int v4 = [v1 zoneNameForIndex:v2];
      if ([v4 hasPrefix:@"MallocStackLoggingLiteZone"]) {
        int v5 = [v4 hasPrefix:@"MallocStackLoggingLiteZone_Wrapper"] ^ 1;
      }
      else {
        int v5 = 0;
      }

      if (v5) {
        uint64_t v3 = v2;
      }
      else {
        uint64_t v3 = v3;
      }
      uint64_t v2 = (v2 + 1);
    }
    while (v2 < [v1 zoneCount]);
  }
  else
  {
    uint64_t v3 = 0xFFFFFFFFLL;
  }

  return v3;
}

void VMUEnumerateVMAnnotatedMallocObjectsWithBlock(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  int v5 = v4;
  if (v3 && v4)
  {
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x2020000000;
    int v13 = 0;
    int v6 = [v3 nodeCount];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __VMUEnumerateVMAnnotatedMallocObjectsWithBlock_block_invoke;
    v7[3] = &unk_1E5D24F80;
    uint64_t v10 = v12;
    int v11 = v6;
    id v8 = v3;
    id v9 = v5;
    [v8 enumerateRegionsWithBlock:v7];

    _Block_object_dispose(v12, 8);
  }
}

void sub_1A7D44A64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __VMUEnumerateVMAnnotatedMallocObjectsWithBlock_block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  int v5 = a2;
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v8 = *(void *)(v6 + 8);
  uint64_t v7 = v6 + 8;
  if (*(_DWORD *)(v8 + 24) < *(_DWORD *)(a1 + 56))
  {
    do
    {
      long long v18 = 0uLL;
      uint64_t v19 = 0;
      id v9 = *(void **)(a1 + 32);
      if (v9)
      {
        [v9 nodeDetails:*(unsigned int *)(*(void *)v7 + 24)];
        if (((*((void *)&v18 + 1) >> 60) | 4) == 5 && *((void *)&v18 + 1) != 0x1000000000000000)
        {
          if ((void)v18 - v5[1] >= v5[2]) {
            break;
          }
          uint64_t v11 = *(void *)(a1 + 40);
          uint64_t v12 = *(unsigned int *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
          int v13 = *(void (**)(uint64_t, uint64_t, long long *))(v11 + 16);
          long long v16 = v18;
          uint64_t v17 = v19;
          v13(v11, v12, &v16);
          if (*a3) {
            break;
          }
        }
      }
      ++*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      uint64_t v14 = *(void *)(a1 + 48);
      uint64_t v15 = *(void *)(v14 + 8);
      uint64_t v7 = v14 + 8;
    }
    while (*(_DWORD *)(v15 + 24) < *(_DWORD *)(a1 + 56));
  }
}

void sub_1A7D48288(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7D48598(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7D4A458(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 176), 8);
  _Block_object_dispose((const void *)(v31 - 144), 8);
  _Block_object_dispose((const void *)(v31 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A7D4AB9C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1A7D4B35C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

const char *VMUScanTypeScanDescription(unsigned int a1)
{
  if (a1 > 8) {
    return "";
  }
  else {
    return off_1E5D25218[a1];
  }
}

const char *VMUScanTypeKeywordDescription(int a1)
{
  if ((a1 - 2) > 6) {
    return "";
  }
  else {
    return off_1E5D25260[a1 - 2];
  }
}

const char *VMUScanTypeAsString(unsigned int a1)
{
  if (a1 > 8) {
    return "Unknown";
  }
  else {
    return off_1E5D25298[a1];
  }
}

uint64_t VMUScanningMaskForAllReferences()
{
  return 318;
}

uint64_t VMUScanningMaskForOwningReferences()
{
  return 46;
}

BOOL VMUIsOwningReference(char a1)
{
  return ((1 << a1) & 0x26) != 0;
}

BOOL task_get_malloc_zones_array_address_and_count(void *a1, uint64_t a2, uint64_t a3, void *a4, _DWORD *a5, void *a6)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v9 = a1;
  *a4 = 0;
  *a5 = 0;
  if ([v9 isExclaveCore])
  {
    CSSymbolicatorGetSymbolOwner();
    if (CSIsNull())
    {
      id v10 = [NSString stringWithFormat:@"expected 1 binary in ExclaveCore target, but found %zu", CSSymbolicatorGetSymbolOwnerCountAtTime()];
      if (a6)
      {
        BOOL v11 = 0;
        goto LABEL_13;
      }
LABEL_18:
      BOOL v11 = 0;
      goto LABEL_21;
    }
    goto LABEL_11;
  }
  CSSymbolicatorGetSymbolOwnerWithNameAtTime();
  if (!CSIsNull()) {
    goto LABEL_11;
  }
  int v23 = a6;
  uint64_t v12 = [v9 processDescription];
  id v13 = [v12 valueForEnvVar:@"DYLD_IMAGE_SUFFIX"];
  uint64_t v14 = (const char *)[v13 UTF8String];

  if (v14)
  {
    snprintf(__str, 0x7FuLL, "libsystem_malloc%s.dylib", v14);
    CSSymbolicatorGetSymbolOwnerWithNameAtTime();
  }
  a6 = v23;
  if (!CSIsNull())
  {
LABEL_11:
    CSSymbolOwnerGetSymbolWithMangledName();
    uint64_t Range = CSSymbolGetRange();
    CSSymbolOwnerGetSymbolWithMangledName();
    uint64_t v16 = CSSymbolGetRange();
    *(void *)__str = 0;
    uint64_t v17 = [v9 memoryCache];
    uint64_t v18 = [v17 peekAtAddress:v16 size:4 returnsBuf:__str];

    if (!v18)
    {
      int v19 = **(_DWORD **)__str;
      *a5 = **(_DWORD **)__str;
      if (!v19)
      {
        BOOL v11 = 1;
        goto LABEL_21;
      }
      unint64_t v24 = 0;
      uint64_t v20 = [v9 memoryCache];
      uint64_t v21 = [v20 peekAtAddress:Range size:8 returnsBuf:&v24];

      BOOL v11 = v21 == 0;
      if (!v21)
      {
        *a4 = *v24;
        goto LABEL_21;
      }
      [NSString stringWithFormat:@"error %d reading zones_address at %qx", v21, Range];
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      if (!a6) {
        goto LABEL_21;
      }
      goto LABEL_13;
    }
    [NSString stringWithFormat:@"error %d reading num_zones at %qx", v18, v16];
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v11 = 0;
    if (a6)
    {
LABEL_13:
      *a6 = v10;
      goto LABEL_21;
    }
    goto LABEL_21;
  }
  if (!v23) {
    goto LABEL_18;
  }
  BOOL v11 = 0;
  *int v23 = @"couldn't find libsystem_malloc dylib in target task";
LABEL_21:

  return v11;
}

uint64_t get_local_zone_count()
{
  return 0;
}

void unregister_new_local_zones()
{
}

void task_foreach_malloc_zone(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[VMUTask alloc] initWithTask:a1];
  VMUTask_foreach_malloc_zone(v4, v3);
}

void VMUTask_foreach_malloc_zone(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  int v5 = getenv("SYMBOLICATION_LOG_ZONE_INTROSPECTION_LOOKUP");
  if (v5 && !strcmp(v5, "YES")) {
    logZoneIntrospectionLookup = 1;
  }
  id v6 = v3;
  unsigned int v111 = 0;
  char v7 = [v6 isExclave];
  uint64_t FlagsForNListOnlyData = 0;
  if ((v7 & 1) == 0) {
    uint64_t FlagsForNListOnlyData = CSSymbolicatorGetFlagsForNListOnlyData();
  }
  uint64_t v9 = [v6 createSymbolicatorWithFlags:FlagsForNListOnlyData andNotification:0];
  uint64_t v11 = v10;
  if (!CSIsNull())
  {
    v112[0] = 0;
    v121[0] = 0;
    BOOL malloc_zones_array_address_and_count = task_get_malloc_zones_array_address_and_count(v6, v9, v11, v112, &v111, v121);
    id v15 = v121[0];
    if (malloc_zones_array_address_and_count)
    {
      unint64_t v12 = v111;
      if (v111)
      {
        v119[0] = 0;
        uint64_t v16 = [v6 memoryCache];
        uint64_t v17 = v112[0];
        uint64_t v18 = [v16 peekAtAddress:v112[0] size:8 * v12 returnsBuf:v119];

        if (!v18)
        {
          int v19 = (char *)malloc_type_malloc(8 * v12, 0x100004000313F17uLL);
          id v13 = v19;
          uint64_t v20 = 0;
          uint64_t v21 = v119[0];
          do
          {
            *(void *)&v19[v20] = *(void *)(v21 + v20);
            v20 += 8;
          }
          while (8 * v12 != v20);
          goto LABEL_17;
        }
        NSLog(&cfstr_TaskMallocGetA_2.isa, v18, v17);
        CSRelease();
      }
      else
      {
        CSRelease();
        NSLog(&cfstr_TaskMallocGetA_1.isa);
        unint64_t v12 = 0;
      }
      id v13 = 0;
    }
    else
    {
      CSRelease();
      NSLog(&cfstr_TaskMallocGetA_0.isa, v15);
      id v13 = 0;
      unint64_t v12 = v111;
    }
LABEL_17:

    goto LABEL_18;
  }
  NSLog(&cfstr_TaskMallocGetA.isa);
  unint64_t v12 = 0;
  id v13 = 0;
LABEL_18:

  char v22 = CSIsNull();
  if (v13 && (v22 & 1) == 0 && v12)
  {
    uint64_t v23 = 0;
    unint64_t v24 = 0x1E4F29000uLL;
    id v98 = v4;
    long long v102 = v13;
    id v103 = v6;
    while (1)
    {
      unint64_t v25 = (void *)MEMORY[0x1AD0D9F90]();
      uint64_t v26 = v13[v23];
      uint64_t v110 = 0;
      long long v27 = [v6 memoryCache];
      uint64_t v28 = [v27 peekAtAddress:v26 size:200 returnsBuf:&v110];

      if (!v28) {
        break;
      }
      NSLog(&cfstr_SymbolicationC_1.isa, v26, v28);
LABEL_135:
      if (++v23 >= v12) {
        goto LABEL_143;
      }
    }
    long long v108 = v25;
    uint64_t v29 = v110;
    id v30 = v6;
    uint64_t v31 = v30;
    if (*(void *)(v29 + 72)
      && ([v30 memoryCache],
          uint64_t v32 = objc_claimAutoreleasedReturnValue(),
          uint64_t v33 = [v32 peekStringAtAddress:*(void *)(v29 + 72)],
          v32,
          v33))
    {
      [*(id *)(v24 + 24) stringWithFormat:@"%s_0x%qx", v33, v26];
    }
    else
    {
      [*(id *)(v24 + 24) stringWithFormat:@"unnamed_zone_0x%qx", v26, v92];
    id v34 = };

    long long v109 = [*(id *)(v24 + 24) stringWithFormat:@"preparing to enumerate %@\n", v34];
    VMUSetCrashReporterInfo(v109);
    uint64_t v35 = v110;
    id v36 = v31;
    id v37 = v34;
    uint64_t v128 = 0;
    uint64_t v129 = &v128;
    uint64_t v130 = 0x2020000000;
    uint64_t v131 = 0;
    uint64_t v124 = 0;
    os_signpost_id_t v125 = &v124;
    uint64_t v126 = 0x2020000000;
    char v127 = 0;
    if (remoteZoneIntrospection_onceToken != -1) {
      dispatch_once(&remoteZoneIntrospection_onceToken, &__block_literal_global_17);
    }
    v121[0] = (id)MEMORY[0x1E4F143A8];
    v121[1] = (id)3221225472;
    v121[2] = __remoteZoneIntrospection_block_invoke_2;
    v121[3] = &unk_1E5D25330;
    id v38 = v36;
    id v122 = v38;
    id v39 = v37;
    id v123 = v39;
    long long v40 = (void *)MEMORY[0x1AD0DA230](v121);
    v119[0] = MEMORY[0x1E4F143A8];
    v119[1] = 3221225472;
    v119[2] = __remoteZoneIntrospection_block_invoke_3;
    v119[3] = &unk_1E5D25358;
    id v41 = v40;
    id v120 = v41;
    uint64_t v42 = (void *)MEMORY[0x1AD0DA230](v119);
    v117[0] = MEMORY[0x1E4F143A8];
    v117[1] = 3221225472;
    v117[2] = __remoteZoneIntrospection_block_invoke_4;
    v117[3] = &unk_1E5D25358;
    id v43 = v41;
    id v118 = v43;
    uint64_t v106 = (uint64_t (**)(void))MEMORY[0x1AD0DA230](v117);
    v112[0] = MEMORY[0x1E4F143A8];
    v112[1] = 3221225472;
    v112[2] = __remoteZoneIntrospection_block_invoke_5;
    v112[3] = &unk_1E5D25380;
    int v105 = v42;
    v114 = v105;
    id v44 = v39;
    id v113 = v44;
    uint64_t v115 = &v124;
    v116 = &v128;
    long long v107 = (void (**)(void, void))MEMORY[0x1AD0DA230](v112);
    unint64_t v25 = v108;
    if ([v38 isExclave])
    {
      if (remoteZoneIntrospection_exclaveIntrospectionDetailsToken != -1) {
        dispatch_once(&remoteZoneIntrospection_exclaveIntrospectionDetailsToken, &__block_literal_global_76_0);
      }
      uint64_t v45 = v109;
      uint64_t v46 = &remoteZoneIntrospection_exclaveIntrospectionDetails;
      if ((remoteZoneIntrospection_getExclaveIntrospectionSucceeded & 1) == 0)
      {
        ((void (**)(void, __CFString *))v107)[2](v107, @"Failed to find xzm zone introspection structure");
        uint64_t v47 = 0;
        uint64_t v45 = v109;
LABEL_130:

        _Block_object_dispose(&v124, 8);
        _Block_object_dispose(&v128, 8);

        id v90 = v45;
        id v13 = v102;
        id v6 = v103;
        if (v47)
        {
          VMUSetCrashReporterInfo(v90);
          v112[0] = 0;
          LODWORD(v121[0]) = 0;
          malloc_get_all_zones();
          uint64_t v91 = (*((uint64_t (**)(id, uint64_t, uint64_t, id))v4 + 2))(v4, v26, v47, v44);
          if (v91) {
            NSLog(&cfstr_SymbolicationC_2.isa, v44, v91);
          }
          VMUClearCrashReporterInfo();
          unregister_new_local_zones();
          unint64_t v25 = v108;
        }

        unint64_t v12 = v111;
        unint64_t v24 = 0x1E4F29000;
        goto LABEL_135;
      }
LABEL_129:
      uint64_t v47 = *v46;
      goto LABEL_130;
    }
    uint64_t v48 = -[VMUTask ptrauthStripDataPointer:]((uint64_t)v38, *(void *)(v35 + 96));
    CSSymbolicatorGetSymbolOwnerWithAddressAtTime();
    uint64_t CFUUIDBytes = (CFUUIDBytes *)CSSymbolOwnerGetCFUUIDBytes();
    id v101 = v43;
    if (CFUUIDBytes) {
      CFUUIDRef cf2 = CFUUIDCreateFromUUIDBytes(0, *CFUUIDBytes);
    }
    else {
      CFUUIDRef cf2 = 0;
    }
    uint64_t v50 = remoteZoneIntrospection_analysisProcessLibmallocAddr;
    if (v50 == CSSymbolOwnerGetBaseAddress()
      && remoteZoneIntrospection_analysisProcessLibmallocUUID
      && cf2
      && CFEqual((CFTypeRef)remoteZoneIntrospection_analysisProcessLibmallocUUID, cf2)
      && *MEMORY[0x1E4F14978])
    {
      uint64_t v51 = 0;
      while (1)
      {
        uint64_t v52 = *(void *)(*(void *)(*MEMORY[0x1E4F14980] + 8 * v51) + 96)
            ? *(void *)(*(void *)(*MEMORY[0x1E4F14980] + 8 * v51) + 96)
            : 0;
        if (-[VMUTask ptrauthStripDataPointer:]((uint64_t)v38, v52) == v48) {
          break;
        }
        if (++v51 >= (unint64_t)*MEMORY[0x1E4F14978]) {
          goto LABEL_49;
        }
      }
      int v60 = 0;
      v129[3] = v48;
      goto LABEL_110;
    }
LABEL_49:
    Path = (char *)CSSymbolOwnerGetPath();
    if (!CSSymbolOwnerGetName())
    {
      ((void (**)(void, __CFString *))v107)[2](v107, @"couldn't get framework name associated with the malloc zone");
      int v60 = 0;
      goto LABEL_110;
    }
    CSSymbolicatorGetFlagsForNListOnlyData();
    CSSymbolicatorCreateWithTaskFlagsAndNotification();
    CSSymbolicatorGetSymbolOwnerWithNameAtTime();
    if ((CSIsNull() & 1) == 0)
    {
      if (logZoneIntrospectionLookup == 1)
      {
        uint64_t v61 = [v44 UTF8String];
        uint64_t v62 = CSSymbolOwnerGetPath();
        NSLog(&cfstr_ZoneSUsingAnal.isa, v61, v62, Path);
      }
LABEL_82:
      if (CSIsNull())
      {
        int v60 = 0;
        goto LABEL_110;
      }
      os_signpost_id_t v66 = (const char *)CSSymbolOwnerGetPath();
      id v97 = 0;
      if (Path)
      {
        char v67 = v66;
        if (v66)
        {
          if (!strcmp(Path, v66))
          {
            id v97 = 0;
          }
          else
          {
            id v97 = [NSString stringWithFormat:@"%s in analysis process, for %s in target process", v67, Path];
            Path = (char *)[v97 UTF8String];
          }
        }
      }
      CSSymbolOwnerGetSymbolWithAddress();
      if (!CSSymbolGetMangledName())
      {
        ((void (**)(void, __CFString *))v107)[2](v107, @"couldn't get introspect structure symbol name from %s");
        goto LABEL_108;
      }
      CSSymbolOwnerGetSymbolWithMangledName();
      if (CSIsNull())
      {
        BOOL v92 = Path;
        ((void (**)(void, __CFString *))v107)[2](v107, @"couldn't find introspect structure symbol %s in %s");
LABEL_108:
        int v60 = 0;
LABEL_109:

LABEL_110:
        uint64_t v76 = v129[3];
        uint64_t v45 = v109;
        if (!v76) {
          goto LABEL_150;
        }
        CSSymbolOwnerGetSymbolWithAddress();
        uint64_t Name = CSSymbolGetName();
        int v78 = v60;
        if (Name)
        {
          uint64_t v79 = [NSString stringWithUTF8String:Name];
        }
        else
        {
          uint64_t v79 = @"<no symbol>";
        }
        os_signpost_id_t v80 = [NSString stringWithUTF8String:CSSymbolOwnerGetPath()];
        uint64_t v81 = VMUSanitizePath(v80);

        uint64_t v82 = -[__CFString rangeOfString:](v79, "rangeOfString:", @"(");
        if (v83)
        {
          uint64_t v84 = [(__CFString *)v79 substringToIndex:v82];

          uint64_t v79 = (__CFString *)v84;
        }
        uint64_t v85 = [v44 rangeOfString:@"_0x"];
        if (v85 == 0x7FFFFFFFFFFFFFFFLL)
        {
          id v86 = v44;
        }
        else
        {
          id v86 = [v44 substringToIndex:v85];
        }
        int v87 = v86;
        uint64_t v88 = "";
        if (v78) {
          uint64_t v88 = " -- loaded from target process";
        }
        id v89 = [NSString stringWithFormat:@"enumerating %@ by calling %@ in %@%s\n", v86, v79, v81, v88];
        uint64_t v45 = v89;
        if (logZoneIntrospectionLookup == 1) {
          NSLog(&stru_1EFE29AB8.isa, v89);
        }

        if (!v129[3])
        {
LABEL_150:
          if (!*((unsigned char *)v125 + 24)) {
            ((void (**)(void, __CFString *))v107)[2](v107, @"unknown");
          }
        }
        CSRelease();
        if (cf2) {
          CFRelease(cf2);
        }
        uint64_t v46 = v129 + 3;
        id v4 = v98;
        unint64_t v25 = v108;
        id v43 = v101;
        goto LABEL_129;
      }
      uint64_t Range = (uint64_t *)CSSymbolGetRange();
      uint64_t v69 = Range;
      if (Range)
      {
        if (*Range)
        {
          __s1a = (char *)-[VMUTask ptrauthStripFunctionPointer:]((uint64_t)v38, *Range);
          CSSymbolOwnerGetSymbolWithAddress();
          if (!CSSymbolIsFunction() || (char *)CSSymbolGetRange() != __s1a)
          {
            BOOL v92 = __s1a;
            ((void (**)(void, __CFString *))v107)[2](v107, @"introspect structure %s for the malloc zone has invalid enumerator function address %#llx in %s");
            goto LABEL_108;
          }
          if (!v105[2]())
          {
LABEL_142:
            v129[3] = (uint64_t)v69;
            int v60 = 1;
            goto LABEL_109;
          }
          id v70 = v38;
          if ((CSIsNull() & 1) == 0)
          {
            v71 = (CFUUIDBytes *)CSSymbolOwnerGetCFUUIDBytes();
            if (v71)
            {
              CFUUIDRef v72 = CFUUIDCreateFromUUIDBytes(0, *v71);
              CFUUIDRef v73 = v72;
              if (cf2 && v72)
              {
                if (!CFEqual(v72, cf2))
                {
                  __s1b = (char *)CSSymbolOwnerGetName();
                  os_signpost_id_t v74 = [v70 memoryCache];
                  char v100 = [v74 isDriverKit];

                  if ((v100 & 1) == 0) {
                    NSLog(&cfstr_SInTargetProce.isa, __s1b);
                  }
                }
                goto LABEL_140;
              }
              if (v72) {
LABEL_140:
              }
                CFRelease(v73);
            }
          }

          goto LABEL_142;
        }
        char v75 = @"introspect structure %s for the malloc zone has no enumerator function in %s";
      }
      else
      {
        char v75 = @"couldn't get address of introspect structure symbol %s in %s";
      }
      BOOL v92 = Path;
      ((void (**)(void, __CFString *))v107)[2](v107, v75);
      goto LABEL_108;
    }
    if ((v106[2]() & 1) == 0)
    {
      *((unsigned char *)v125 + 24) = 1;
      goto LABEL_82;
    }
    id v53 = v44;
    __s1 = (char *)CSSymbolOwnerGetPath();
    CSSymbolOwnerGetName();
    id v96 = v53;
    id v54 = __s1;
    uint64_t v55 = strstr(__s1, "libclang_rt.asan");
    uint64_t v56 = @"for security, cannot load non-system library %s";
    if (v55) {
      goto LABEL_54;
    }
    uint64_t v57 = strstr(__s1, "libclang_rt.tsan");
    uint64_t v56 = @"for security, cannot load non-system library %s";
    if (v57) {
      goto LABEL_54;
    }
    if (strncmp(__s1, "/System/", 8uLL) && strncmp(__s1, "/usr/", 5uLL))
    {
      uint64_t v63 = getprogname();
      if (!strcmp(v63, "ReportCrash"))
      {
        uint64_t v56 = @"for security, cannot load non-system library %s from unsafe path into ReportCrash";
        id v54 = __s1;
LABEL_54:
        int v58 = [NSString stringWithFormat:v56, v54];
        goto LABEL_55;
      }
      if ((dyld_process_is_restricted() & 1) != 0 || !getuid())
      {
        int v132 = 0;
        getpid();
        if (csops() || (v132 & 0x2000) == 0)
        {
          int v58 = [NSString stringWithFormat:@"for security, cannot load non-system library %s", __s1];
LABEL_55:
          id v59 = v58;

          if (v59) {
            goto LABEL_79;
          }
LABEL_71:
          if (dlopen(__s1, 389))
          {
            if (logZoneIntrospectionLookup == 1) {
              NSLog(&cfstr_LoadedSForIntr.isa, __s1, v96);
            }
            CSRelease();
            CSSymbolicatorGetFlagsForNListOnlyData();
            CSSymbolicatorCreateWithTaskFlagsAndNotification();
            CSSymbolicatorGetSymbolOwnerWithNameAtTime();
            if (!CSIsNull())
            {
              id v59 = 0;
              goto LABEL_79;
            }
            dispatch_time_t v64 = [NSString stringWithFormat:@"couldn't create symbolicator for %s", __s1];
          }
          else
          {
            dispatch_time_t v64 = [NSString stringWithFormat:@"%s", dlerror()];
          }
          id v59 = v64;
LABEL_79:

          id v65 = v59;
          if (CSIsNull()) {
            ((void (**)(void, __CFString *))v107)[2](v107, @"%@");
          }

          goto LABEL_82;
        }
      }
    }

    goto LABEL_71;
  }
LABEL_143:
  if (v13) {
    free(v13);
  }
  if ((CSIsNull() & 1) == 0) {
    CSRelease();
  }
}

void sub_1A7D4D518(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void task_enumerate_malloc_blocks(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __task_enumerate_malloc_blocks_block_invoke;
  v4[3] = &__block_descriptor_56_e82_i32__0Q8__malloc_introspection_t_________________________________I_16__NSString_24l;
  int v5 = a1;
  int v6 = a3;
  v4[4] = a2;
  v4[5] = a4;
  task_foreach_malloc_zone(a1, v4);
}

uint64_t __task_enumerate_malloc_blocks_block_invoke(uint64_t a1, uint64_t a2, uint64_t (**a3)(void, void, void, uint64_t, uint64_t (*)(vm_map_read_t a1, mach_vm_address_t a2, mach_vm_size_t a3, mach_vm_address_t *a4), void))
{
  return (*a3)(*(unsigned int *)(a1 + 48), *(void *)(a1 + 32), *(unsigned int *)(a1 + 52), a2, task_peek_natural_size, *(void *)(a1 + 40));
}

id task_get_malloc_ptrs_by_zone(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __task_get_malloc_ptrs_by_zone_block_invoke;
  v10[3] = &unk_1E5D25308;
  id v11 = v3;
  int v13 = a1;
  id v5 = v4;
  id v12 = v5;
  id v6 = v3;
  task_foreach_malloc_zone(a1, v10);
  char v7 = v12;
  id v8 = v5;

  return v8;
}

uint64_t __task_get_malloc_ptrs_by_zone_block_invoke(uint64_t a1, uint64_t a2, uint64_t (**a3)(void, VMURangeArray *, uint64_t, uint64_t, uint64_t (*)(vm_map_read_t a1, mach_vm_address_t a2, mach_vm_size_t a3, mach_vm_address_t *a4), uint64_t (*)(uint64_t a1, void *a2, uint64_t a3, uint64_t *a4, int a5)), void *a4)
{
  id v7 = a4;
  if (!*(void *)(a1 + 32)
    || (id v8 = objc_alloc_init(VMUNonOverlappingRangeArray),
        uint64_t v9 = (*a3)(*(unsigned int *)(a1 + 48), &v8->super, 6, a2, task_peek_natural_size, nonOverlappingRecorder),
        [(VMUNonOverlappingRangeArray *)v8 sortAndMergeRanges],
        [*(id *)(a1 + 32) setObject:v8 forKey:v7],
        v8,
        !v9))
  {
    uint64_t v10 = objc_alloc_init(VMURangeArray);
    uint64_t v9 = (*a3)(*(unsigned int *)(a1 + 48), v10, 1, a2, task_peek_natural_size, ptrsRecorder);
    [*(id *)(a1 + 40) setObject:v10 forKey:v7];
  }
  return v9;
}

uint64_t nonOverlappingRecorder(uint64_t a1, void *a2, uint64_t a3, uint64_t *a4, int a5)
{
  if (a5)
  {
    int v5 = a5;
    do
    {
      --v5;
      uint64_t v8 = *a4;
      uint64_t v9 = a4[1];
      a4 += 2;
      uint64_t result = [a2 addOrExtendRange:v8, v9];
    }
    while (v5);
  }
  return result;
}

uint64_t ptrsRecorder(uint64_t a1, void *a2, uint64_t a3, uint64_t *a4, int a5)
{
  if (a5)
  {
    int v5 = a5;
    do
    {
      --v5;
      uint64_t v8 = *a4;
      uint64_t v9 = a4[1];
      a4 += 2;
      uint64_t result = [a2 addRange:v8, v9];
    }
    while (v5);
  }
  return result;
}

id task_get_malloc_ptrs(uint64_t a1)
{
  uint64_t v2 = objc_opt_new();
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __task_enumerate_malloc_blocks_block_invoke;
  v4[3] = &__block_descriptor_56_e82_i32__0Q8__malloc_introspection_t_________________________________I_16__NSString_24l;
  int v5 = a1;
  int v6 = 1;
  v4[4] = v2;
  v4[5] = ptrsRecorder;
  task_foreach_malloc_zone(a1, v4);

  return v2;
}

id task_find_all_malloc_regions(void *a1)
{
  id v1 = a1;
  uint64_t v2 = objc_opt_new();
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  id v7 = __VMUTask_enumerate_malloc_blocks_block_invoke;
  uint64_t v8 = &unk_1E5D253D0;
  id v9 = v1;
  uint64_t v10 = v2;
  int v12 = 6;
  id v11 = nonOverlappingRecorder;
  id v3 = v1;
  withPeekFunctionForVMUTask(v3, &v5);

  [v2 sortAndMergeRanges:v5, v6, v7, v8];

  return v2;
}

void __remoteZoneIntrospection_block_invoke()
{
  CSSymbolicatorGetFlagsForNListOnlyData();
  CSSymbolicatorCreateWithTaskFlagsAndNotification();
  CSSymbolicatorGetSymbolOwnerWithNameAtTime();
  uint64_t CFUUIDBytes = (CFUUIDBytes *)CSSymbolOwnerGetCFUUIDBytes();
  if (CFUUIDBytes) {
    remoteZoneIntrospection_analysisProcessLibmallocUUID = (uint64_t)CFUUIDCreateFromUUIDBytes(0, *CFUUIDBytes);
  }
  remoteZoneIntrospection_analysisProcessLibmallocAddr = CSSymbolOwnerGetBaseAddress();
  CSRelease();
  uint64_t v1 = objc_opt_new();
  uint64_t v2 = (void *)remoteZoneIntrospection_previouslySeenTasksAndZones;
  remoteZoneIntrospection_previouslySeenTasksAndZones = v1;

  uint64_t v3 = objc_opt_new();
  id v4 = (void *)remoteZoneIntrospection_previouslySeenTasksAndZonesLock;
  remoteZoneIntrospection_previouslySeenTasksAndZonesLock = v3;
}

uint64_t __remoteZoneIntrospection_block_invoke_2(uint64_t a1, int a2)
{
  [(id)remoteZoneIntrospection_previouslySeenTasksAndZonesLock lock];
  if ([*(id *)(a1 + 32) isCore]) {
    [*(id *)(a1 + 32) coreFilePath];
  }
  else {
  id v4 = [NSString stringWithFormat:@"%d", [*(id *)(a1 + 32) taskPort]];
  }
  uint64_t v5 = [NSString stringWithFormat:@"%@ %@", v4, *(void *)(a1 + 40)];
  int v6 = [(id)remoteZoneIntrospection_previouslySeenTasksAndZones containsObject:v5];
  if ((v6 & 1) == 0 && a2) {
    [(id)remoteZoneIntrospection_previouslySeenTasksAndZones addObject:v5];
  }
  [(id)remoteZoneIntrospection_previouslySeenTasksAndZonesLock unlock];

  return v6 ^ 1u;
}

uint64_t __remoteZoneIntrospection_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __remoteZoneIntrospection_block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __remoteZoneIntrospection_block_invoke_5(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10 = a2;
  if ((*(unsigned int (**)(void))(a1[5] + 16))())
  {
    id v11 = (void *)[[NSString alloc] initWithFormat:v10 arguments:&a9];
    int v12 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"Can't examine target process's malloc zone %@, so memory analysis will be incomplete or incorrect.\n", a1[4]];
    [v12 appendFormat:@"Reason: %@\n\n", v11];
    int v13 = (FILE *)*MEMORY[0x1E4F143C8];
    id v14 = v12;
    fputs((const char *)[v14 UTF8String], v13);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      __remoteZoneIntrospection_block_invoke_5_cold_1((uint64_t)v14);
    }
  }
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  *(void *)(*(void *)(a1[7] + 8) + 24) = 0;
}

void *__remoteZoneIntrospection_block_invoke_74()
{
  uint64_t v0 = "/System/Library/PrivateFrameworks/libmalloc_exclaves_introspector.framework/libmalloc_exclaves_introspector";
  if (os_variant_has_internal_content())
  {
    uint64_t v1 = getenv("SYMBOLICATION_EXCLAVES_INTROSPECTOR_FRAMEWORK_PATH");
    if (v1) {
      uint64_t v0 = v1;
    }
  }
  uint64_t result = dlopen(v0, 133);
  if (result)
  {
    uint64_t result = dlsym(result, "xzm_malloc_zone_introspect");
    remoteZoneIntrospection_exclaveIntrospectionDetails = (uint64_t)result;
    if (result) {
      remoteZoneIntrospection_getExclaveIntrospectionSucceeded = 1;
    }
  }
  return result;
}

uint64_t VMUOAHRuntimeLocation()
{
  if (findOahFuncs_onceToken != -1) {
    dispatch_once(&findOahFuncs_onceToken, &__block_literal_global_18);
  }
  return oahRuntimeLocation;
}

id VMURegisterNameForIndex(uint64_t a1)
{
  if (a1 > 0x22) {
    [NSString stringWithFormat:@"<unknown register index %u>", a1];
  }
  else {
  uint64_t v1 = [NSString stringWithUTF8String:VMURegisterNameForIndex_regNames[a1]];
  }

  return v1;
}

void *__findOahFuncs_block_invoke()
{
  uint64_t result = dlopen("/usr/lib/liboah.dylib", 1);
  if (result)
  {
    uint64_t v1 = result;
    oahFuncs = (uint64_t)dlsym(result, "oah_get_x86_thread_state");
    uint64_t result = dlsym(v1, "oah_get_runtime_location");
    qword_1E973BCE8 = (uint64_t)result;
    if (result)
    {
      uint64_t result = (void *)((uint64_t (*)(void))result)();
      oahRuntimeLocation = (uint64_t)result;
    }
  }
  return result;
}

uint64_t _compareSizeCount(int a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v9 = a4;
  id v10 = a5;
  if (a1) {
    uint64_t v11 = a3;
  }
  else {
    uint64_t v11 = a2;
  }
  if (v11 <= 0)
  {
    if ((v11 & 0x8000000000000000) == 0)
    {
      if (a1) {
        uint64_t v14 = a2;
      }
      else {
        uint64_t v14 = a3;
      }
      if (v14 > 0) {
        goto LABEL_5;
      }
      if ((v14 & 0x8000000000000000) == 0)
      {
        uint64_t v12 = [v9 compare:v10];
        goto LABEL_6;
      }
    }
    uint64_t v12 = 1;
    goto LABEL_6;
  }
LABEL_5:
  uint64_t v12 = -1;
LABEL_6:

  return v12;
}

void sub_1A7D53184(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7D534FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7D53AC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25)
{
  _Unwind_Resume(a1);
}

void sub_1A7D53C48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A7D53CF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1A7D53F44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7D53FFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A7D540A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1A7D54364(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7D544D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7D54658(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_1A7D546E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1A7D54864(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(a10);
  }
  _Unwind_Resume(exception_object);
}

void sub_1A7D549A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_1A7D54A9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7D54C6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7D54D1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A7D55034(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void *std::__hash_table<std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUFieldInfo * {__strong},std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>,std::hash<VMUFieldInfo * {__strong}>,std::equal_to<VMUFieldInfo * {__strong}>,true>,std::__unordered_map_equal<VMUFieldInfo * {__strong},std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>,std::equal_to<VMUFieldInfo * {__strong}>,std::hash<VMUFieldInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>>>::__emplace_unique_key_args<VMUFieldInfo * {__strong},std::pair<VMUFieldInfo * {__strong},unsigned int>>(uint64_t a1, id *a2, uint64_t *a3)
{
  unint64_t v7 = [*a2 hash];
  unint64_t v8 = v7;
  unint64_t v9 = *(void *)(a1 + 8);
  if (v9)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    unint64_t v11 = v10.u32[0];
    if (v10.u32[0] > 1uLL)
    {
      unint64_t v3 = v7;
      if (v7 >= v9) {
        unint64_t v3 = v7 % v9;
      }
    }
    else
    {
      unint64_t v3 = (v9 - 1) & v7;
    }
    uint64_t v12 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v12)
    {
      int v13 = *v12;
      if (*v12)
      {
        do
        {
          unint64_t v14 = v13[1];
          if (v14 == v8)
          {
            id v15 = (id)v13[2];
            if (v15 == *a2 || [v15 isEqual:]) {
              return v13;
            }
          }
          else
          {
            if (v11 > 1)
            {
              if (v14 >= v9) {
                v14 %= v9;
              }
            }
            else
            {
              v14 &= v9 - 1;
            }
            if (v14 != v3) {
              break;
            }
          }
          int v13 = (void *)*v13;
        }
        while (v13);
      }
    }
  }
  uint64_t v16 = (void *)(a1 + 16);
  int v13 = operator new(0x20uLL);
  *int v13 = 0;
  v13[1] = v8;
  uint64_t v17 = *a3;
  *a3 = 0;
  void v13[2] = v17;
  *((_DWORD *)v13 + 6) = *((_DWORD *)a3 + 2);
  float v18 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v19 = *(float *)(a1 + 32);
  if (!v9 || (float)(v19 * (float)v9) < v18)
  {
    BOOL v20 = 1;
    if (v9 >= 3) {
      BOOL v20 = (v9 & (v9 - 1)) != 0;
    }
    unint64_t v21 = v20 | (2 * v9);
    unint64_t v22 = vcvtps_u32_f32(v18 / v19);
    if (v21 <= v22) {
      size_t v23 = v22;
    }
    else {
      size_t v23 = v21;
    }
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>(a1, v23);
    unint64_t v9 = *(void *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9) {
        unint64_t v3 = v8 % v9;
      }
      else {
        unint64_t v3 = v8;
      }
    }
    else
    {
      unint64_t v3 = (v9 - 1) & v8;
    }
  }
  uint64_t v24 = *(void *)a1;
  unint64_t v25 = *(void **)(*(void *)a1 + 8 * v3);
  if (v25)
  {
    *int v13 = *v25;
LABEL_39:
    *unint64_t v25 = v13;
    goto LABEL_40;
  }
  *int v13 = *v16;
  *uint64_t v16 = v13;
  *(void *)(v24 + 8 * v3) = v16;
  if (*v13)
  {
    unint64_t v26 = *(void *)(*v13 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v26 >= v9) {
        v26 %= v9;
      }
    }
    else
    {
      v26 &= v9 - 1;
    }
    unint64_t v25 = (void *)(*(void *)a1 + 8 * v26);
    goto LABEL_39;
  }
LABEL_40:
  ++*(void *)(a1 + 24);
  return v13;
}

void sub_1A7D553AC(_Unwind_Exception *a1)
{
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<NSString * {__strong},unsigned int>,void *>>>::operator()[abi:ne180100](v2, v1);
  _Unwind_Resume(a1);
}

void *std::__hash_table<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::hash<VMUClassInfo * {__strong}>,std::equal_to<VMUClassInfo * {__strong}>,true>,std::__unordered_map_equal<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::equal_to<VMUClassInfo * {__strong}>,std::hash<VMUClassInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>>>::__emplace_unique_key_args<VMUClassInfo * {__strong},std::pair<VMUClassInfo * {__strong},unsigned int>>(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = *a2;
      if (v7 <= v6) {
        unint64_t v3 = v6 % v7;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
    unint64_t v9 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      uint8x8_t v10 = *v9;
      if (*v9)
      {
        do
        {
          unint64_t v11 = v10[1];
          if (v11 == v6)
          {
            if (v10[2] == v6) {
              return v10;
            }
          }
          else
          {
            if (v8.u32[0] > 1uLL)
            {
              if (v11 >= v7) {
                v11 %= v7;
              }
            }
            else
            {
              v11 &= v7 - 1;
            }
            if (v11 != v3) {
              break;
            }
          }
          uint8x8_t v10 = (void *)*v10;
        }
        while (v10);
      }
    }
  }
  uint64_t v12 = (void *)(a1 + 16);
  uint8x8_t v10 = operator new(0x20uLL);
  *uint8x8_t v10 = 0;
  v10[1] = v6;
  uint64_t v13 = *a3;
  *a3 = 0;
  v10[2] = v13;
  *((_DWORD *)v10 + 6) = *((_DWORD *)a3 + 2);
  float v14 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v15 = *(float *)(a1 + 32);
  if (!v7 || (float)(v15 * (float)v7) < v14)
  {
    BOOL v16 = 1;
    if (v7 >= 3) {
      BOOL v16 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v17 = v16 | (2 * v7);
    unint64_t v18 = vcvtps_u32_f32(v14 / v15);
    if (v17 <= v18) {
      size_t v19 = v18;
    }
    else {
      size_t v19 = v17;
    }
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>(a1, v19);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6) {
        unint64_t v3 = v6 % v7;
      }
      else {
        unint64_t v3 = v6;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
  }
  uint64_t v20 = *(void *)a1;
  unint64_t v21 = *(void **)(*(void *)a1 + 8 * v3);
  if (v21)
  {
    *uint8x8_t v10 = *v21;
LABEL_38:
    *unint64_t v21 = v10;
    goto LABEL_39;
  }
  *uint8x8_t v10 = *v12;
  void *v12 = v10;
  *(void *)(v20 + 8 * v3) = v12;
  if (*v10)
  {
    unint64_t v22 = *(void *)(*v10 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v22 >= v7) {
        v22 %= v7;
      }
    }
    else
    {
      v22 &= v7 - 1;
    }
    unint64_t v21 = (void *)(*(void *)a1 + 8 * v22);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return v10;
}

void sub_1A7D55600(_Unwind_Exception *a1)
{
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<NSString * {__strong},unsigned int>,void *>>>::operator()[abi:ne180100](v2, v1);
  _Unwind_Resume(a1);
}

void *std::__hash_table<std::__hash_value_type<unsigned long long,unsigned int>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned int>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned int>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned int>>>::__emplace_unique_key_args<unsigned long long,std::pair<unsigned long long,unsigned int>>(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = *a2;
      if (v6 >= v7) {
        unint64_t v3 = v6 % v7;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
    unint64_t v9 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      uint8x8_t v10 = *v9;
      if (*v9)
      {
        do
        {
          unint64_t v11 = v10[1];
          if (v11 == v6)
          {
            if (v10[2] == v6) {
              return v10;
            }
          }
          else
          {
            if (v8.u32[0] > 1uLL)
            {
              if (v11 >= v7) {
                v11 %= v7;
              }
            }
            else
            {
              v11 &= v7 - 1;
            }
            if (v11 != v3) {
              break;
            }
          }
          uint8x8_t v10 = (void *)*v10;
        }
        while (v10);
      }
    }
  }
  uint8x8_t v10 = operator new(0x20uLL);
  *uint8x8_t v10 = 0;
  v10[1] = v6;
  v10[2] = *(void *)a3;
  *((_DWORD *)v10 + 6) = *(_DWORD *)(a3 + 8);
  float v12 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    BOOL v14 = 1;
    if (v7 >= 3) {
      BOOL v14 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v15 = v14 | (2 * v7);
    unint64_t v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16) {
      size_t v17 = v16;
    }
    else {
      size_t v17 = v15;
    }
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>(a1, v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7) {
        unint64_t v3 = v6 % v7;
      }
      else {
        unint64_t v3 = v6;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
  }
  uint64_t v18 = *(void *)a1;
  size_t v19 = *(void **)(*(void *)a1 + 8 * v3);
  if (v19)
  {
    *uint8x8_t v10 = *v19;
LABEL_38:
    *size_t v19 = v10;
    goto LABEL_39;
  }
  *uint8x8_t v10 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v10;
  *(void *)(v18 + 8 * v3) = a1 + 16;
  if (*v10)
  {
    unint64_t v20 = *(void *)(*v10 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v20 >= v7) {
        v20 %= v7;
      }
    }
    else
    {
      v20 &= v7 - 1;
    }
    size_t v19 = (void *)(*(void *)a1 + 8 * v20);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return v10;
}

void sub_1A7D5582C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *std::__hash_table<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::hash<VMUClassInfo * {__strong}>,std::equal_to<VMUClassInfo * {__strong}>,true>,std::__unordered_map_equal<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::equal_to<VMUClassInfo * {__strong}>,std::hash<VMUClassInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>>>::find<VMUClassInfo * {__strong}>(void *a1, unint64_t *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0;
  }
  unint64_t v3 = *a2;
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL) {
    uint64_t v5 = *(void *)&v2 <= v3 ? v3 % *(void *)&v2 : *a2;
  }
  else {
    uint64_t v5 = (*(void *)&v2 - 1) & v3;
  }
  unint64_t v6 = *(void **)(*a1 + 8 * v5);
  if (!v6) {
    return 0;
  }
  uint64_t result = (void *)*v6;
  if (*v6)
  {
    do
    {
      unint64_t v8 = result[1];
      if (v8 == v3)
      {
        if (result[2] == v3) {
          return result;
        }
      }
      else
      {
        if (v4.u32[0] > 1uLL)
        {
          if (v8 >= *(void *)&v2) {
            v8 %= *(void *)&v2;
          }
        }
        else
        {
          v8 &= *(void *)&v2 - 1;
        }
        if (v8 != v5) {
          return 0;
        }
      }
      uint64_t result = (void *)*result;
    }
    while (result);
  }
  return result;
}

void *std::__hash_table<std::__hash_value_type<unsigned long long,unsigned int>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned int>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned int>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned int>>>::__emplace_unique_key_args<unsigned long long,unsigned long long &,unsigned int &>(uint64_t a1, unint64_t *a2, void *a3, _DWORD *a4)
{
  unint64_t v8 = *a2;
  unint64_t v9 = *(void *)(a1 + 8);
  if (v9)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v8 >= v9) {
        unint64_t v4 = v8 % v9;
      }
    }
    else
    {
      unint64_t v4 = (v9 - 1) & v8;
    }
    unint64_t v11 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v11)
    {
      float v12 = *v11;
      if (*v11)
      {
        do
        {
          unint64_t v13 = v12[1];
          if (v13 == v8)
          {
            if (v12[2] == v8) {
              return v12;
            }
          }
          else
          {
            if (v10.u32[0] > 1uLL)
            {
              if (v13 >= v9) {
                v13 %= v9;
              }
            }
            else
            {
              v13 &= v9 - 1;
            }
            if (v13 != v4) {
              break;
            }
          }
          float v12 = (void *)*v12;
        }
        while (v12);
      }
    }
  }
  float v12 = operator new(0x20uLL);
  void *v12 = 0;
  v12[1] = v8;
  v12[2] = *a3;
  *((_DWORD *)v12 + 6) = *a4;
  float v14 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v15 = *(float *)(a1 + 32);
  if (!v9 || (float)(v15 * (float)v9) < v14)
  {
    BOOL v16 = 1;
    if (v9 >= 3) {
      BOOL v16 = (v9 & (v9 - 1)) != 0;
    }
    unint64_t v17 = v16 | (2 * v9);
    unint64_t v18 = vcvtps_u32_f32(v14 / v15);
    if (v17 <= v18) {
      size_t v19 = v18;
    }
    else {
      size_t v19 = v17;
    }
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>(a1, v19);
    unint64_t v9 = *(void *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9) {
        unint64_t v4 = v8 % v9;
      }
      else {
        unint64_t v4 = v8;
      }
    }
    else
    {
      unint64_t v4 = (v9 - 1) & v8;
    }
  }
  uint64_t v20 = *(void *)a1;
  unint64_t v21 = *(void **)(*(void *)a1 + 8 * v4);
  if (v21)
  {
    void *v12 = *v21;
LABEL_38:
    *unint64_t v21 = v12;
    goto LABEL_39;
  }
  void *v12 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v12;
  *(void *)(v20 + 8 * v4) = a1 + 16;
  if (*v12)
  {
    unint64_t v22 = *(void *)(*v12 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v22 >= v9) {
        v22 %= v9;
      }
    }
    else
    {
      v22 &= v9 - 1;
    }
    unint64_t v21 = (void *)(*(void *)a1 + 8 * v22);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return v12;
}

void sub_1A7D55B14(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *std::__hash_table<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::hash<VMUClassInfo * {__strong}>,std::equal_to<VMUClassInfo * {__strong}>,true>,std::__unordered_map_equal<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::equal_to<VMUClassInfo * {__strong}>,std::hash<VMUClassInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>>>::__emplace_unique_key_args<VMUClassInfo * {__strong},VMUClassInfo * {__strong}&,unsigned int &>(uint64_t a1, unint64_t *a2, id *a3, _DWORD *a4)
{
  unint64_t v8 = *a2;
  unint64_t v9 = *(void *)(a1 + 8);
  if (v9)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v9 <= v8) {
        unint64_t v4 = v8 % v9;
      }
    }
    else
    {
      unint64_t v4 = (v9 - 1) & v8;
    }
    unint64_t v11 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v11)
    {
      float v12 = *v11;
      if (*v11)
      {
        do
        {
          unint64_t v13 = v12[1];
          if (v13 == v8)
          {
            if (v12[2] == v8) {
              return v12;
            }
          }
          else
          {
            if (v10.u32[0] > 1uLL)
            {
              if (v13 >= v9) {
                v13 %= v9;
              }
            }
            else
            {
              v13 &= v9 - 1;
            }
            if (v13 != v4) {
              break;
            }
          }
          float v12 = (void *)*v12;
        }
        while (v12);
      }
    }
  }
  float v14 = (void *)(a1 + 16);
  float v12 = operator new(0x20uLL);
  void *v12 = 0;
  v12[1] = v8;
  v12[2] = *a3;
  *((_DWORD *)v12 + 6) = *a4;
  float v15 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v16 = *(float *)(a1 + 32);
  if (!v9 || (float)(v16 * (float)v9) < v15)
  {
    BOOL v17 = 1;
    if (v9 >= 3) {
      BOOL v17 = (v9 & (v9 - 1)) != 0;
    }
    unint64_t v18 = v17 | (2 * v9);
    unint64_t v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19) {
      size_t v20 = v19;
    }
    else {
      size_t v20 = v18;
    }
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>(a1, v20);
    unint64_t v9 = *(void *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v9 <= v8) {
        unint64_t v4 = v8 % v9;
      }
      else {
        unint64_t v4 = v8;
      }
    }
    else
    {
      unint64_t v4 = (v9 - 1) & v8;
    }
  }
  uint64_t v21 = *(void *)a1;
  unint64_t v22 = *(void **)(*(void *)a1 + 8 * v4);
  if (v22)
  {
    void *v12 = *v22;
LABEL_38:
    void *v22 = v12;
    goto LABEL_39;
  }
  void *v12 = *v14;
  void *v14 = v12;
  *(void *)(v21 + 8 * v4) = v14;
  if (*v12)
  {
    unint64_t v23 = *(void *)(*v12 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v23 >= v9) {
        v23 %= v9;
      }
    }
    else
    {
      v23 &= v9 - 1;
    }
    unint64_t v22 = (void *)(*(void *)a1 + 8 * v23);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return v12;
}

void sub_1A7D55D64(_Unwind_Exception *a1)
{
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<NSString * {__strong},unsigned int>,void *>>>::operator()[abi:ne180100](v2, v1);
  _Unwind_Resume(a1);
}

void *std::__hash_table<std::__hash_value_type<unsigned long long,unsigned int>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned int>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned int>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned int>>>::find<unsigned long long>(void *a1, unint64_t *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0;
  }
  unint64_t v3 = *a2;
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    unint64_t v5 = *a2;
    if (v3 >= *(void *)&v2) {
      unint64_t v5 = v3 % *(void *)&v2;
    }
  }
  else
  {
    unint64_t v5 = (*(void *)&v2 - 1) & v3;
  }
  unint64_t v6 = *(void **)(*a1 + 8 * v5);
  if (!v6) {
    return 0;
  }
  uint64_t result = (void *)*v6;
  if (*v6)
  {
    do
    {
      unint64_t v8 = result[1];
      if (v8 == v3)
      {
        if (result[2] == v3) {
          return result;
        }
      }
      else
      {
        if (v4.u32[0] > 1uLL)
        {
          if (v8 >= *(void *)&v2) {
            v8 %= *(void *)&v2;
          }
        }
        else
        {
          v8 &= *(void *)&v2 - 1;
        }
        if (v8 != v5) {
          return 0;
        }
      }
      uint64_t result = (void *)*result;
    }
    while (result);
  }
  return result;
}

void *std::__hash_table<std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUFieldInfo * {__strong},std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>,std::hash<VMUFieldInfo * {__strong}>,std::equal_to<VMUFieldInfo * {__strong}>,true>,std::__unordered_map_equal<VMUFieldInfo * {__strong},std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>,std::equal_to<VMUFieldInfo * {__strong}>,std::hash<VMUFieldInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>>>::__emplace_unique_key_args<VMUFieldInfo * {__strong},std::piecewise_construct_t const&,std::tuple<VMUFieldInfo * const {__strong}&>,std::tuple<>>(uint64_t a1, id *a2, uint64_t a3, id **a4)
{
  unint64_t v8 = [*a2 hash];
  unint64_t v9 = v8;
  unint64_t v10 = *(void *)(a1 + 8);
  if (v10)
  {
    uint8x8_t v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    unint64_t v12 = v11.u32[0];
    if (v11.u32[0] > 1uLL)
    {
      unint64_t v4 = v8;
      if (v8 >= v10) {
        unint64_t v4 = v8 % v10;
      }
    }
    else
    {
      unint64_t v4 = (v10 - 1) & v8;
    }
    unint64_t v13 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v13)
    {
      float v14 = *v13;
      if (*v13)
      {
        do
        {
          unint64_t v15 = v14[1];
          if (v15 == v9)
          {
            id v16 = (id)v14[2];
            if (v16 == *a2 || [v16 isEqual:]) {
              return v14;
            }
          }
          else
          {
            if (v12 > 1)
            {
              if (v15 >= v10) {
                v15 %= v10;
              }
            }
            else
            {
              v15 &= v10 - 1;
            }
            if (v15 != v4) {
              break;
            }
          }
          float v14 = (void *)*v14;
        }
        while (v14);
      }
    }
  }
  BOOL v17 = (void *)(a1 + 16);
  float v14 = operator new(0x20uLL);
  void *v14 = 0;
  v14[1] = v9;
  v14[2] = **a4;
  *((_DWORD *)v14 + 6) = 0;
  float v18 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v19 = *(float *)(a1 + 32);
  if (!v10 || (float)(v19 * (float)v10) < v18)
  {
    BOOL v20 = 1;
    if (v10 >= 3) {
      BOOL v20 = (v10 & (v10 - 1)) != 0;
    }
    unint64_t v21 = v20 | (2 * v10);
    unint64_t v22 = vcvtps_u32_f32(v18 / v19);
    if (v21 <= v22) {
      size_t v23 = v22;
    }
    else {
      size_t v23 = v21;
    }
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>(a1, v23);
    unint64_t v10 = *(void *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10) {
        unint64_t v4 = v9 % v10;
      }
      else {
        unint64_t v4 = v9;
      }
    }
    else
    {
      unint64_t v4 = (v10 - 1) & v9;
    }
  }
  uint64_t v24 = *(void *)a1;
  unint64_t v25 = *(void **)(*(void *)a1 + 8 * v4);
  if (v25)
  {
    void *v14 = *v25;
LABEL_39:
    *unint64_t v25 = v14;
    goto LABEL_40;
  }
  void *v14 = *v17;
  *BOOL v17 = v14;
  *(void *)(v24 + 8 * v4) = v17;
  if (*v14)
  {
    unint64_t v26 = *(void *)(*v14 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v26 >= v10) {
        v26 %= v10;
      }
    }
    else
    {
      v26 &= v10 - 1;
    }
    unint64_t v25 = (void *)(*(void *)a1 + 8 * v26);
    goto LABEL_39;
  }
LABEL_40:
  ++*(void *)(a1 + 24);
  return v14;
}

void sub_1A7D5608C(_Unwind_Exception *a1)
{
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<NSString * {__strong},unsigned int>,void *>>>::operator()[abi:ne180100](v2, v1);
  _Unwind_Resume(a1);
}

void *std::__hash_table<std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUFieldInfo * {__strong},std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>,std::hash<VMUFieldInfo * {__strong}>,std::equal_to<VMUFieldInfo * {__strong}>,true>,std::__unordered_map_equal<VMUFieldInfo * {__strong},std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>,std::equal_to<VMUFieldInfo * {__strong}>,std::hash<VMUFieldInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>>>::find<VMUFieldInfo * {__strong}>(void *a1, id *a2)
{
  unint64_t v4 = [*a2 hash];
  int8x8_t v5 = (int8x8_t)a1[1];
  if (!*(void *)&v5) {
    return 0;
  }
  unint64_t v6 = v4;
  uint8x8_t v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  unint64_t v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    unint64_t v9 = v4;
    if (v4 >= *(void *)&v5) {
      unint64_t v9 = v4 % *(void *)&v5;
    }
  }
  else
  {
    unint64_t v9 = (*(void *)&v5 - 1) & v4;
  }
  unint64_t v10 = *(void **)(*a1 + 8 * v9);
  if (!v10) {
    return 0;
  }
  uint8x8_t v11 = (void *)*v10;
  if (*v10)
  {
    do
    {
      unint64_t v12 = v11[1];
      if (v12 == v6)
      {
        id v13 = (id)v11[2];
        if (v13 == *a2 || [v13 isEqual:]) {
          return v11;
        }
      }
      else
      {
        if (v8 > 1)
        {
          if (v12 >= *(void *)&v5) {
            v12 %= *(void *)&v5;
          }
        }
        else
        {
          v12 &= *(void *)&v5 - 1;
        }
        if (v12 != v9) {
          return 0;
        }
      }
      uint8x8_t v11 = (void *)*v11;
    }
    while (v11);
  }
  return v11;
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<SwiftFieldKey,unsigned int>,std::__unordered_map_hasher<SwiftFieldKey,std::__hash_value_type<SwiftFieldKey,unsigned int>,std::hash<SwiftFieldKey>,std::equal_to<SwiftFieldKey>,true>,std::__unordered_map_equal<SwiftFieldKey,std::__hash_value_type<SwiftFieldKey,unsigned int>,std::equal_to<SwiftFieldKey>,std::hash<SwiftFieldKey>,true>,std::allocator<std::__hash_value_type<SwiftFieldKey,unsigned int>>>::find<SwiftFieldKey>(void *a1, uint64_t a2)
{
  unint64_t v4 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)&v14, a2);
  int8x8_t v5 = (int8x8_t)a1[1];
  if (!*(void *)&v5) {
    return 0;
  }
  unint64_t v6 = v4 ^ *(unsigned int *)(a2 + 24) ^ *(unsigned int *)(a2 + 28) ^ *(void *)(a2 + 32) ^ *(int *)(a2 + 40);
  uint8x8_t v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  unint64_t v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    unint64_t v9 = v4 ^ *(unsigned int *)(a2 + 24) ^ *(unsigned int *)(a2 + 28) ^ *(void *)(a2 + 32) ^ *(int *)(a2 + 40);
    if (v6 >= *(void *)&v5) {
      unint64_t v9 = v6 % *(void *)&v5;
    }
  }
  else
  {
    unint64_t v9 = (*(void *)&v5 - 1) & v6;
  }
  unint64_t v10 = *(unsigned __int8 ***)(*a1 + 8 * v9);
  if (!v10) {
    return 0;
  }
  for (unint64_t i = *v10; i; unint64_t i = *(unsigned __int8 **)i)
  {
    unint64_t v12 = *((void *)i + 1);
    if (v12 == v6)
    {
      if (SwiftFieldKey::operator==(i + 16, (unsigned __int8 *)a2)) {
        return i;
      }
    }
    else
    {
      if (v8 > 1)
      {
        if (v12 >= *(void *)&v5) {
          v12 %= *(void *)&v5;
        }
      }
      else
      {
        v12 &= *(void *)&v5 - 1;
      }
      if (v12 != v9) {
        return 0;
      }
    }
  }
  return i;
}

BOOL SwiftFieldKey::operator==(unsigned __int8 *a1, unsigned __int8 *a2)
{
  uint64_t v2 = a1[23];
  if ((v2 & 0x80u) == 0) {
    uint64_t v3 = a1[23];
  }
  else {
    uint64_t v3 = *((void *)a1 + 1);
  }
  uint64_t v4 = a2[23];
  int v5 = (char)v4;
  if ((v4 & 0x80u) != 0) {
    uint64_t v4 = *((void *)a2 + 1);
  }
  if (v3 != v4) {
    return 0;
  }
  unint64_t v6 = a2;
  if (v5 < 0) {
    a2 = *(unsigned __int8 **)a2;
  }
  if ((v2 & 0x80) != 0)
  {
    if (memcmp(*(const void **)a1, a2, *((void *)a1 + 1))) {
      return 0;
    }
  }
  else if (a1[23])
  {
    unint64_t v8 = a1;
    while (*v8 == *a2)
    {
      ++v8;
      ++a2;
      if (!--v2) {
        goto LABEL_16;
      }
    }
    return 0;
  }
LABEL_16:
  if (*((_DWORD *)a1 + 6) == *((_DWORD *)v6 + 6)
    && *((_DWORD *)a1 + 7) == *((_DWORD *)v6 + 7)
    && *((void *)a1 + 4) == *((void *)v6 + 4))
  {
    return *((_DWORD *)a1 + 10) == *((_DWORD *)v6 + 10);
  }
  return 0;
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<SwiftFieldKey,unsigned int>,std::__unordered_map_hasher<SwiftFieldKey,std::__hash_value_type<SwiftFieldKey,unsigned int>,std::hash<SwiftFieldKey>,std::equal_to<SwiftFieldKey>,true>,std::__unordered_map_equal<SwiftFieldKey,std::__hash_value_type<SwiftFieldKey,unsigned int>,std::equal_to<SwiftFieldKey>,std::hash<SwiftFieldKey>,true>,std::allocator<std::__hash_value_type<SwiftFieldKey,unsigned int>>>::__emplace_unique_key_args<SwiftFieldKey,std::piecewise_construct_t const&,std::tuple<SwiftFieldKey const&>,std::tuple<>>(uint64_t a1, uint64_t a2, uint64_t a3, long long **a4)
{
  unint64_t v8 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)v26, a2) ^ *(unsigned int *)(a2 + 24) ^ *(unsigned int *)(a2 + 28) ^ *(void *)(a2 + 32);
  uint64_t v9 = *(int *)(a2 + 40);
  unint64_t v10 = v8 ^ v9;
  unint64_t v11 = *(void *)(a1 + 8);
  if (v11)
  {
    uint8x8_t v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    unint64_t v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      unint64_t v4 = v8 ^ v9;
      if (v10 >= v11) {
        unint64_t v4 = v10 % v11;
      }
    }
    else
    {
      unint64_t v4 = (v11 - 1) & v10;
    }
    char v14 = *(unsigned __int8 ***)(*(void *)a1 + 8 * v4);
    if (v14)
    {
      for (unint64_t i = *v14; i; unint64_t i = *(unsigned __int8 **)i)
      {
        unint64_t v16 = *((void *)i + 1);
        if (v16 == v10)
        {
          if (SwiftFieldKey::operator==(i + 16, (unsigned __int8 *)a2)) {
            return i;
          }
        }
        else
        {
          if (v13 > 1)
          {
            if (v16 >= v11) {
              v16 %= v11;
            }
          }
          else
          {
            v16 &= v11 - 1;
          }
          if (v16 != v4) {
            break;
          }
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<SwiftFieldKey,unsigned int>,std::__unordered_map_hasher<SwiftFieldKey,std::__hash_value_type<SwiftFieldKey,unsigned int>,std::hash<SwiftFieldKey>,std::equal_to<SwiftFieldKey>,true>,std::__unordered_map_equal<SwiftFieldKey,std::__hash_value_type<SwiftFieldKey,unsigned int>,std::equal_to<SwiftFieldKey>,std::hash<SwiftFieldKey>,true>,std::allocator<std::__hash_value_type<SwiftFieldKey,unsigned int>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<SwiftFieldKey const&>,std::tuple<>>(a1, v10, a4, (uint64_t)v26);
  float v17 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v18 = *(float *)(a1 + 32);
  if (!v11 || (float)(v18 * (float)v11) < v17)
  {
    BOOL v19 = 1;
    if (v11 >= 3) {
      BOOL v19 = (v11 & (v11 - 1)) != 0;
    }
    unint64_t v20 = v19 | (2 * v11);
    unint64_t v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21) {
      size_t v22 = v21;
    }
    else {
      size_t v22 = v20;
    }
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>(a1, v22);
    unint64_t v11 = *(void *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11) {
        unint64_t v4 = v10 % v11;
      }
      else {
        unint64_t v4 = v10;
      }
    }
    else
    {
      unint64_t v4 = (v11 - 1) & v10;
    }
  }
  size_t v23 = *(void **)(*(void *)a1 + 8 * v4);
  if (v23)
  {
    *(void *)v26[0] = *v23;
    *size_t v23 = v26[0];
  }
  else
  {
    *(void *)v26[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v26[0];
    *(void *)(*(void *)a1 + 8 * v4) = a1 + 16;
    if (*(void *)v26[0])
    {
      unint64_t v24 = *(void *)(*(void *)v26[0] + 8);
      if ((v11 & (v11 - 1)) != 0)
      {
        if (v24 >= v11) {
          v24 %= v11;
        }
      }
      else
      {
        v24 &= v11 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v24) = v26[0];
    }
  }
  unint64_t i = (unsigned __int8 *)v26[0];
  ++*(void *)(a1 + 24);
  return i;
}

void sub_1A7D56624(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p) {
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<SwiftFieldKey,unsigned int>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  }
  _Unwind_Resume(exception_object);
}

__n128 std::__hash_table<std::__hash_value_type<SwiftFieldKey,unsigned int>,std::__unordered_map_hasher<SwiftFieldKey,std::__hash_value_type<SwiftFieldKey,unsigned int>,std::hash<SwiftFieldKey>,std::equal_to<SwiftFieldKey>,true>,std::__unordered_map_equal<SwiftFieldKey,std::__hash_value_type<SwiftFieldKey,unsigned int>,std::equal_to<SwiftFieldKey>,std::hash<SwiftFieldKey>,true>,std::allocator<std::__hash_value_type<SwiftFieldKey,unsigned int>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<SwiftFieldKey const&>,std::tuple<>>@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, long long **a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 16;
  unint64_t v8 = (char *)operator new(0x48uLL);
  *(void *)a4 = v8;
  *(void *)(a4 + _Block_object_dispose(&STACK[0x280], 8) = v7;
  *(unsigned char *)(a4 + 16) = 0;
  *(void *)unint64_t v8 = 0;
  *((void *)v8 + 1) = a2;
  uint64_t v9 = (std::string *)(v8 + 16);
  unint64_t v10 = *a3;
  if (*((char *)v10 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)v10, *((void *)v10 + 1));
  }
  else
  {
    long long v11 = *v10;
    *((void *)v8 + 4) = *((void *)v10 + 2);
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = v11;
  }
  __n128 result = *(__n128 *)((char *)v10 + 24);
  *((_DWORD *)v8 + 14) = *((_DWORD *)v10 + 10);
  *(__n128 *)(v8 + 40) = result;
  *((_DWORD *)v8 + 16) = 0;
  *(unsigned char *)(a4 + 16) = 1;
  return result;
}

void sub_1A7D566E8(_Unwind_Exception *a1)
{
  void *v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<SwiftFieldKey,unsigned int>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<SwiftFieldKey,unsigned int>,void *>>>::operator()[abi:ne180100](uint64_t a1, void **__p)
{
  if (*(unsigned char *)(a1 + 8))
  {
    if (*((char *)__p + 39) < 0) {
      operator delete(__p[2]);
    }
  }
  else if (!__p)
  {
    return;
  }

  operator delete(__p);
}

void std::__hash_table<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::hash<VMUClassInfo * {__strong}>,std::equal_to<VMUClassInfo * {__strong}>,true>,std::__unordered_map_equal<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::equal_to<VMUClassInfo * {__strong}>,std::hash<VMUClassInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>>>::clear(uint64_t a1)
{
  if (*(void *)(a1 + 24))
  {
    std::__hash_table<std::__hash_value_type<NSString * {__strong},unsigned int>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringHashFunctor,NSStringEqualsFunctor,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringEqualsFunctor,NSStringHashFunctor,true>,std::allocator<std::__hash_value_type<NSString * {__strong},unsigned int>>>::__deallocate_node(a1, *(id **)(a1 + 16));
    *(void *)(a1 + 16) = 0;
    uint64_t v2 = *(void *)(a1 + 8);
    if (v2)
    {
      for (uint64_t i = 0; i != v2; ++i)
        *(void *)(*(void *)a1 + 8 * i) = 0;
    }
    *(void *)(a1 + 24) = 0;
  }
}

void *std::__hash_table<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::hash<VMUClassInfo * {__strong}>,std::equal_to<VMUClassInfo * {__strong}>,true>,std::__unordered_map_equal<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::equal_to<VMUClassInfo * {__strong}>,std::hash<VMUClassInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>>>::__emplace_unique_impl<std::pair<VMUMutableClassInfo * {__strong},unsigned int>>(void *a1, uint64_t *a2)
{
  unint64_t v4 = operator new(0x20uLL);
  uint64_t v5 = *a2;
  *a2 = 0;
  v4[1] = v5;
  v4[2] = v5;
  *((_DWORD *)v4 + 6) = *((_DWORD *)a2 + 2);
  *unint64_t v4 = 0;
  inserted = std::__hash_table<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::hash<VMUClassInfo * {__strong}>,std::equal_to<VMUClassInfo * {__strong}>,true>,std::__unordered_map_equal<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::equal_to<VMUClassInfo * {__strong}>,std::hash<VMUClassInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>>>::__node_insert_unique(a1, v4);
  if ((v7 & 1) == 0)
  {

    operator delete(v4);
  }
  return inserted;
}

void sub_1A7D56864(_Unwind_Exception *a1)
{
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<NSString * {__strong},unsigned int>,void *>>>::operator()[abi:ne180100](v2, v1);
  _Unwind_Resume(a1);
}

void *std::__hash_table<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::hash<VMUClassInfo * {__strong}>,std::equal_to<VMUClassInfo * {__strong}>,true>,std::__unordered_map_equal<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::equal_to<VMUClassInfo * {__strong}>,std::hash<VMUClassInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>>>::__node_insert_unique(void *a1, void *a2)
{
  uint64_t v2 = a2;
  uint64_t v5 = a2 + 2;
  unint64_t v4 = a2[2];
  *(v5 - 1) = v4;
  unint64_t v6 = std::__hash_table<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::hash<VMUClassInfo * {__strong}>,std::equal_to<VMUClassInfo * {__strong}>,true>,std::__unordered_map_equal<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::equal_to<VMUClassInfo * {__strong}>,std::hash<VMUClassInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>>>::__node_insert_unique_prepare[abi:ne180100]((uint64_t)a1, v4, v5);
  if (v6) {
    return v6;
  }
  std::__hash_table<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::hash<VMUClassInfo * {__strong}>,std::equal_to<VMUClassInfo * {__strong}>,true>,std::__unordered_map_equal<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::equal_to<VMUClassInfo * {__strong}>,std::hash<VMUClassInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>>>::__node_insert_unique_perform[abi:ne180100](a1, v2);
  return v2;
}

void *std::__hash_table<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::hash<VMUClassInfo * {__strong}>,std::equal_to<VMUClassInfo * {__strong}>,true>,std::__unordered_map_equal<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::equal_to<VMUClassInfo * {__strong}>,std::hash<VMUClassInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>>>::__node_insert_unique_prepare[abi:ne180100](uint64_t a1, unint64_t a2, void *a3)
{
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3)
  {
    uint8x8_t v4 = (uint8x8_t)vcnt_s8((int8x8_t)v3);
    v4.i16[0] = vaddlv_u8(v4);
    if (v4.u32[0] > 1uLL) {
      uint64_t v5 = v3 <= a2 ? a2 % v3 : a2;
    }
    else {
      uint64_t v5 = (v3 - 1) & a2;
    }
    unint64_t v6 = *(void **)(*(void *)a1 + 8 * v5);
    if (v6)
    {
      for (uint64_t i = (void *)*v6; i; uint64_t i = (void *)*i)
      {
        unint64_t v8 = i[1];
        if (v8 == a2)
        {
          if (i[2] == *a3) {
            return i;
          }
        }
        else
        {
          if (v4.u32[0] > 1uLL)
          {
            if (v8 >= v3) {
              v8 %= v3;
            }
          }
          else
          {
            v8 &= v3 - 1;
          }
          if (v8 != v5) {
            break;
          }
        }
      }
    }
  }
  float v9 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v10 = *(float *)(a1 + 32);
  if (!v3 || (float)(v10 * (float)v3) < v9)
  {
    uint64_t v11 = 2 * v3;
    BOOL v12 = v3 < 3 || (v3 & (v3 - 1)) != 0;
    size_t v13 = v12 | v11;
    unint64_t v14 = vcvtps_u32_f32(v9 / v10);
    if (v13 <= v14) {
      size_t v15 = v14;
    }
    else {
      size_t v15 = v13;
    }
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>(a1, v15);
  }
  return 0;
}

void *std::__hash_table<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::hash<VMUClassInfo * {__strong}>,std::equal_to<VMUClassInfo * {__strong}>,true>,std::__unordered_map_equal<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::equal_to<VMUClassInfo * {__strong}>,std::hash<VMUClassInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>>>::__node_insert_unique_perform[abi:ne180100](void *result, void *a2)
{
  int8x8_t v2 = (int8x8_t)result[1];
  unint64_t v3 = a2[1];
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    if (v3 >= *(void *)&v2) {
      v3 %= *(void *)&v2;
    }
  }
  else
  {
    v3 &= *(void *)&v2 - 1;
  }
  uint64_t v5 = *(void **)(*result + 8 * v3);
  if (v5)
  {
    *a2 = *v5;
LABEL_13:
    *uint64_t v5 = a2;
    goto LABEL_14;
  }
  *a2 = result[2];
  result[2] = a2;
  *(void *)(*result + 8 * v3) = result + 2;
  if (*a2)
  {
    unint64_t v6 = *(void *)(*a2 + 8);
    if (v4.u32[0] > 1uLL)
    {
      if (v6 >= *(void *)&v2) {
        v6 %= *(void *)&v2;
      }
    }
    else
    {
      v6 &= *(void *)&v2 - 1;
    }
    uint64_t v5 = (void *)(*result + 8 * v6);
    goto LABEL_13;
  }
LABEL_14:
  ++result[3];
  return result;
}

uint64_t std::__hash_table<std::__hash_value_type<SwiftFieldKey,unsigned int>,std::__unordered_map_hasher<SwiftFieldKey,std::__hash_value_type<SwiftFieldKey,unsigned int>,std::hash<SwiftFieldKey>,std::equal_to<SwiftFieldKey>,true>,std::__unordered_map_equal<SwiftFieldKey,std::__hash_value_type<SwiftFieldKey,unsigned int>,std::equal_to<SwiftFieldKey>,std::hash<SwiftFieldKey>,true>,std::allocator<std::__hash_value_type<SwiftFieldKey,unsigned int>>>::~__hash_table(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<SwiftFieldKey,unsigned int>,std::__unordered_map_hasher<SwiftFieldKey,std::__hash_value_type<SwiftFieldKey,unsigned int>,std::hash<SwiftFieldKey>,std::equal_to<SwiftFieldKey>,true>,std::__unordered_map_equal<SwiftFieldKey,std::__hash_value_type<SwiftFieldKey,unsigned int>,std::equal_to<SwiftFieldKey>,std::hash<SwiftFieldKey>,true>,std::allocator<std::__hash_value_type<SwiftFieldKey,unsigned int>>>::__deallocate_node(a1, *(void ***)(a1 + 16));
  int8x8_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<SwiftFieldKey,unsigned int>,std::__unordered_map_hasher<SwiftFieldKey,std::__hash_value_type<SwiftFieldKey,unsigned int>,std::hash<SwiftFieldKey>,std::equal_to<SwiftFieldKey>,true>,std::__unordered_map_equal<SwiftFieldKey,std::__hash_value_type<SwiftFieldKey,unsigned int>,std::equal_to<SwiftFieldKey>,std::hash<SwiftFieldKey>,true>,std::allocator<std::__hash_value_type<SwiftFieldKey,unsigned int>>>::__deallocate_node(int a1, void **__p)
{
  if (__p)
  {
    int8x8_t v2 = __p;
    do
    {
      unint64_t v3 = (void **)*v2;
      if (*((char *)v2 + 39) < 0) {
        operator delete(v2[2]);
      }
      operator delete(v2);
      int8x8_t v2 = v3;
    }
    while (v3);
  }
}

id descriptionForTypeEncoding(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v5 = 0;
  unint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  unint64_t v8 = __Block_byref_object_copy__8;
  float v9 = __Block_byref_object_dispose__8;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __descriptionForTypeEncoding_block_invoke;
  v4[3] = &unk_1E5D25798;
  v4[4] = &v5;
  v4[5] = a2;
  _parse_type(a1, 1, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void sub_1A7D56C1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void _parse_type(unsigned __int8 *a1, int a2, void *a3)
{
  uint64_t v35 = a3;
  if (a2)
  {
    uint64_t v5 = [MEMORY[0x1E4F28E78] string];
    if (!a1) {
      goto LABEL_128;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if (!a1) {
      goto LABEL_128;
    }
  }
  unsigned __int8 v6 = *a1;
  if (*a1)
  {
    int v7 = 0;
    unint64_t v8 = 0;
    int v9 = 1;
    while (1)
    {
      if (v6 > 0x5Au)
      {
        if (v6 == 91)
        {
          if (!v8 && a2)
          {
            unint64_t v8 = [MEMORY[0x1E4F28E78] string];
          }
          unint64_t v16 = a1 + 1;
          int v17 = a1[1];
          if ((v17 - 48) > 9)
          {
            int v18 = 0;
            BOOL v19 = a1 + 1;
            if (a2) {
              goto LABEL_40;
            }
          }
          else
          {
            int v18 = 0;
            BOOL v19 = a1 + 1;
            do
            {
              int v18 = v17 + 10 * v18 - 48;
              int v20 = *++v19;
              int v17 = v20;
            }
            while ((v20 - 48) < 0xA);
            if (a2) {
LABEL_40:
            }
              [v8 appendFormat:@"[%.*s]", v19 - v16, v16];
          }
          a1 = v19 - 1;
          v9 *= v18;
          goto LABEL_71;
        }
        if (v6 != 123) {
          goto LABEL_42;
        }
      }
      else if (v6 != 40)
      {
        if (v6 == 64)
        {
          int v10 = a1[1];
          if (v10 == 34)
          {
            uint64_t v24 = 0;
            unint64_t v25 = a1 + 2;
            int v26 = a1[2];
            int v27 = v26;
            if (a1[2])
            {
              do
              {
                if (v27 == 34) {
                  break;
                }
                int v27 = a1[v24++ + 3];
              }
              while (v27);
            }
            a1 += v24 + 2;
            if (a2)
            {
              BOOL v28 = v26 == 60;
              uint64_t v29 = "";
              id v30 = "id ";
              if (!v28)
              {
                id v30 = "";
                uint64_t v29 = "*";
              }
              [v5 appendFormat:@"%s%.*s%s", v30, v24, v25, v29];
            }
          }
          else if (v10 == 63)
          {
            if (a2) {
              [v5 appendString:@"id?"];
            }
            ++a1;
          }
          else if (a2)
          {
            [v5 appendString:@"id"];
          }
          goto LABEL_71;
        }
LABEL_42:
        if ((char)v6 > 92)
        {
          switch(v6)
          {
            case ']':
              goto LABEL_71;
            case '^':
              ++v7;
              goto LABEL_71;
            case 'b':
              if (!a2) {
                goto LABEL_71;
              }
              unint64_t v21 = v5;
              size_t v22 = @"bitfield:";
              break;
            case 'c':
              if (!a2) {
                goto LABEL_71;
              }
              unint64_t v21 = v5;
              size_t v22 = @"char";
              break;
            case 'd':
              if (!a2) {
                goto LABEL_71;
              }
              unint64_t v21 = v5;
              size_t v22 = @"double";
              break;
            case 'f':
              if (!a2) {
                goto LABEL_71;
              }
              unint64_t v21 = v5;
              size_t v22 = @"float";
              break;
            case 'i':
              if (!a2) {
                goto LABEL_71;
              }
              unint64_t v21 = v5;
              size_t v22 = @"int32_t";
              break;
            case 'l':
              if (!a2) {
                goto LABEL_71;
              }
              unint64_t v21 = v5;
              size_t v22 = @"long";
              break;
            case 'q':
              if (!a2) {
                goto LABEL_71;
              }
              unint64_t v21 = v5;
              size_t v22 = @"int64_t";
              break;
            case 'r':
              if (!a2) {
                goto LABEL_71;
              }
              unint64_t v21 = v5;
              size_t v22 = @"const ";
              break;
            case 's':
              if (!a2) {
                goto LABEL_71;
              }
              unint64_t v21 = v5;
              size_t v22 = @"short";
              break;
            case 'v':
              if (!a2) {
                goto LABEL_71;
              }
              unint64_t v21 = v5;
              size_t v22 = @"void";
              break;
            default:
              goto LABEL_105;
          }
        }
        else if ((char)v6 <= 57)
        {
          switch(v6)
          {
            case '#':
              if (!a2) {
                goto LABEL_71;
              }
              unint64_t v21 = v5;
              size_t v22 = @"Class";
              break;
            case '%':
              if (!a2) {
                goto LABEL_71;
              }
              unint64_t v21 = v5;
              size_t v22 = @"atomic ";
              break;
            case '*':
              if (!a2) {
                goto LABEL_71;
              }
              unint64_t v21 = v5;
              size_t v22 = @"char*";
              break;
            default:
LABEL_105:
              if (a2) {
                [v5 appendFormat:@"%c", (char)v6];
              }
              goto LABEL_71;
          }
        }
        else
        {
          switch(v6)
          {
            case '?':
              if (!a2) {
                goto LABEL_71;
              }
              unint64_t v21 = v5;
              size_t v22 = @"?";
              break;
            case '@':
              if (!a2) {
                goto LABEL_71;
              }
              unint64_t v21 = v5;
              size_t v22 = @"id";
              break;
            case 'A':
              if (!a2) {
                goto LABEL_71;
              }
              unint64_t v21 = v5;
              size_t v22 = @"_Atomic ";
              break;
            case 'B':
              if (!a2) {
                goto LABEL_71;
              }
              unint64_t v21 = v5;
              size_t v22 = @"BOOL";
              break;
            case 'C':
              if (!a2) {
                goto LABEL_71;
              }
              unint64_t v21 = v5;
              size_t v22 = @"unsigned char";
              break;
            case 'D':
            case 'E':
            case 'F':
            case 'G':
            case 'H':
            case 'J':
            case 'K':
            case 'M':
            case 'N':
            case 'O':
            case 'P':
            case 'R':
              goto LABEL_105;
            case 'I':
              if (!a2) {
                goto LABEL_71;
              }
              unint64_t v21 = v5;
              size_t v22 = @"uint32_t";
              break;
            case 'L':
              if (!a2) {
                goto LABEL_71;
              }
              unint64_t v21 = v5;
              size_t v22 = @"ulong";
              break;
            case 'Q':
              if (!a2) {
                goto LABEL_71;
              }
              unint64_t v21 = v5;
              size_t v22 = @"uint64_t";
              break;
            case 'S':
              if (!a2) {
                goto LABEL_71;
              }
              unint64_t v21 = v5;
              size_t v22 = @"ushort";
              break;
            default:
              if (v6 != 58) {
                goto LABEL_105;
              }
              if (!a2) {
                goto LABEL_71;
              }
              unint64_t v21 = v5;
              size_t v22 = @"SEL";
              break;
          }
        }
        [v21 appendString:v22];
        goto LABEL_71;
      }
      uint64_t v11 = a1 + 1;
      int v12 = 1;
      ++a1;
      while (1)
      {
        unsigned int v13 = *a1;
        int v14 = 1;
        if (v13 > 0x7A) {
          break;
        }
        if (v13 == 40) {
          goto LABEL_26;
        }
        if (v13 == 41) {
          goto LABEL_25;
        }
        if (!*a1) {
          goto LABEL_28;
        }
LABEL_27:
        ++a1;
      }
      if (v13 != 123)
      {
        if (v13 != 125) {
          goto LABEL_27;
        }
LABEL_25:
        int v14 = -1;
      }
LABEL_26:
      v12 += v14;
      if (v12) {
        goto LABEL_27;
      }
LABEL_28:
      for (uint64_t i = 0; ; ++i)
      {
        if (!v11[i]) {
          goto LABEL_124;
        }
        if (v11[i] == 61) {
          break;
        }
        if (&v11[i] >= a1)
        {
          if (*a1 && v11[i]) {
            goto LABEL_51;
          }
LABEL_124:
          uint64_t v32 = (void (*)(void))v35[2];
          goto LABEL_127;
        }
      }
      if (!*a1) {
        goto LABEL_124;
      }
LABEL_51:
      if (a2)
      {
        size_t v23 = "struct";
        if (v6 == 40) {
          size_t v23 = "union";
        }
        if (*v11 == 63) {
          [v5 appendFormat:@"<unnamed %s>", v23, v33, v34];
        }
        else {
          [v5 appendFormat:@"%s %.*s", v23, i, v11];
        }
      }
LABEL_71:
      int v31 = *++a1;
      unsigned __int8 v6 = v31;
      if (!v31)
      {
        for (; v7; --v7)
        {
          if (a2) {
            [v5 appendString:@"*"];
          }
        }
        goto LABEL_126;
      }
    }
  }
  unint64_t v8 = 0;
LABEL_126:
  uint64_t v32 = (void (*)(void))v35[2];
LABEL_127:
  v32();

LABEL_128:
}

void __descriptionForTypeEncoding_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5, uint64_t a6)
{
  id v15 = a4;
  int v9 = a5;
  if (a6)
  {
    NSLog(&cfstr_ErrorForIvarS.isa, a6, *(void *)(a1 + 40));
  }
  else
  {
    id v10 = [NSString alloc];
    uint64_t v11 = &stru_1EFE27F38;
    if (v9) {
      uint64_t v11 = v9;
    }
    uint64_t v12 = [v10 initWithFormat:@"%@ %s%@", v15, *(void *)(a1 + 40), v11];
    uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
    int v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
}

uint64_t typeEncodingDescribesReferencedAllocation(uint64_t result)
{
  if (result)
  {
    int v1 = *(unsigned __int8 *)result;
    if (!*(unsigned char *)result) {
      return 0;
    }
    if ((v1 == 114 || v1 == 65) && (int v1 = *(unsigned __int8 *)(result + 1), !*(unsigned char *)(result + 1)))
    {
      return 0;
    }
    else
    {
      unsigned int v2 = v1 - 64;
      BOOL v3 = v2 > 0x31;
      unint64_t v4 = (0x1EFFFFFFFFFFEuLL >> v2) & 1;
      if (v3) {
        return 1;
      }
      else {
        return v4;
      }
    }
  }
  return result;
}

id descriptionForTypeOfReferencedAllocation(char *a1, _DWORD *a2)
{
  if (!a1) {
    goto LABEL_10;
  }
  unsigned int v2 = a1;
  int v3 = *a1;
  if (!*a1) {
    goto LABEL_10;
  }
  if (v3 == 114 || (int v5 = *a1, v3 == 65))
  {
    int v5 = a1[1];
    if (!a1[1]) {
      goto LABEL_10;
    }
  }
  unsigned int v6 = v5 - 64;
  BOOL v7 = v6 > 0x31;
  uint64_t v8 = (1 << v6) & 0x2100000000001;
  if (!v7 && v8 != 0)
  {
LABEL_10:
    id v10 = 0;
    goto LABEL_11;
  }
  if (v3 == 114 || v3 == 65) {
    unsigned int v2 = a1 + 1;
  }
  uint64_t v12 = objc_opt_new();
  *a2 = 16;
  if (*v2 == 94)
  {
    do
    {
      uint64_t v13 = v2;
      int v14 = *++v2;
      if (v14 != 94) {
        break;
      }
      [v12 appendString:@"[]"];
      uint64_t v13 = v2;
    }
    while (*v2 == 94);
  }
  else
  {
    uint64_t v13 = v2;
  }
  id v15 = (void *)[[NSString alloc] initWithBytesNoCopy:v13 length:strlen(v13) encoding:4 freeWhenDone:0];
  unsigned int v16 = *v13;
  if (v16 > 0x50)
  {
    if (*v13 <= 0x5Du)
    {
      if (v16 != 81 && v16 != 91) {
        goto LABEL_83;
      }
      goto LABEL_30;
    }
    if (v16 == 123)
    {
      if (!strncmp(v13, "{vector<", 8uLL)
        || !strncmp(v13, "{shared_ptr<", 0xCuLL)
        || !strncmp(v13, "{unique_ptr<", 0xCuLL))
      {
        unint64_t v21 = strchr(v13, 44);
        if (v21 || (unint64_t v21 = strchr(v13, 62)) != 0)
        {
          size_t v22 = [v15 substringWithRange:1, &v21[~(unint64_t)v13]];
          int v17 = [v22 stringByAppendingString:@">"];
        }
        else
        {
          [v15 substringWithRange:NSMakeRange(1, strchr(v13, 60)[~(unint64_t)v13])];
          int v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        *a2 = 2;
        goto LABEL_84;
      }
      if (!strncmp(v13, "{unordered_map<", 0x10uLL))
      {
        unint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F28FE8]) initWithString:v15];
        [v25 setScanLocation:1];
        id v34 = 0;
        int v26 = [v25 scanUpToString:@"," intoString:&v34];
        id v27 = v34;
        id v28 = 0;
        uint64_t v29 = 0;
        if (v26)
        {
          [v25 setScanLocation:[v25 scanLocation] + 1];
          id v33 = 0;
          int v30 = [v25 scanUpToString:@"," intoString:&v33];
          id v28 = v33;
          if (v30)
          {
            uint64_t v29 = [NSString stringWithFormat:@"%@,%@>", v27, v28];
          }
          else
          {
            uint64_t v29 = 0;
          }
        }
        int v31 = @"unordered_map";
        if (v29) {
          int v31 = v29;
        }
        int v17 = v31;
        *a2 = 2;

        goto LABEL_84;
      }
    }
    else
    {
      if (v16 != 94) {
        goto LABEL_83;
      }
      int v18 = v13[1];
      if (!v13[1]) {
        goto LABEL_83;
      }
      int v19 = v13[2];
      if (!v13[2])
      {
        if (v18 > 80)
        {
          switch(v13[1])
          {
            case 'c':
              goto LABEL_67;
            case 'd':
              int v17 = @"double[]";
              goto LABEL_84;
            case 'e':
            case 'g':
            case 'h':
            case 'j':
            case 'k':
            case 'm':
            case 'n':
            case 'o':
            case 'p':
            case 'r':
            case 't':
            case 'u':
              goto LABEL_83;
            case 'f':
              int v17 = @"float[]";
              goto LABEL_84;
            case 'i':
              int v17 = @"int32_t[]";
              goto LABEL_84;
            case 'l':
              int v17 = @"long[]";
              goto LABEL_84;
            case 'q':
              int v17 = @"int64_t[]";
              goto LABEL_84;
            case 's':
              int v17 = @"short[]";
              goto LABEL_84;
            case 'v':
              goto LABEL_31;
            default:
              if (v18 == 81)
              {
                int v17 = @"uint64_t[]";
              }
              else
              {
                if (v18 != 83) {
                  goto LABEL_83;
                }
                int v17 = @"ushort[]";
              }
              break;
          }
          goto LABEL_84;
        }
        if (v18 > 57)
        {
          int v17 = @"id[]";
          switch(v18)
          {
            case ':':
              int v17 = @"SEL[]";
              goto LABEL_84;
            case ';':
            case '<':
            case '=':
            case '>':
            case '?':
            case 'A':
              goto LABEL_83;
            case '@':
              goto LABEL_84;
            case 'B':
              int v17 = @"BOOL[]";
              goto LABEL_84;
            case 'C':
              int v17 = @"uchar[]";
              goto LABEL_84;
            default:
              if (v18 == 73)
              {
                int v17 = @"uint32_t[]";
              }
              else
              {
                if (v18 != 76) {
                  goto LABEL_83;
                }
                int v17 = @"ulong[]";
              }
              break;
          }
          goto LABEL_84;
        }
        if (v18 == 35)
        {
          int v17 = @"Class[]";
          goto LABEL_84;
        }
        if (v18 != 42) {
          goto LABEL_83;
        }
        int v17 = @"char*[]";
        goto LABEL_84;
      }
      if (v18 == 64)
      {
        if (v19 == 34)
        {
          size_t v23 = [NSString stringWithUTF8String:v13 + 3];
          if ([v23 hasSuffix:@"\""])
          {
            uint64_t v24 = [v23 substringToIndex:[v23 length] - 1];

            size_t v23 = (void *)v24;
          }
          if ([v23 length])
          {
            int v17 = [v23 stringByAppendingString:@"*[]"];
          }
          else
          {
            int v17 = 0;
          }

          goto LABEL_84;
        }
        goto LABEL_83;
      }
      if (v13[1] != 123)
      {
LABEL_83:
        int v17 = 0;
        goto LABEL_84;
      }
      if (v19 != 63)
      {
        int v20 = strchr(v13, 61);
        if (v20 || (int v20 = strchr(v13, 125)) != 0)
        {
          [v15 substringWithRange:NSMakeRange(2, v20 - v13 - 2)];
          int v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if ([(__CFString *)v17 length])
          {
            if ([(__CFString *)v17 isEqualToString:@"__CFString"])
            {

              int v17 = @"CFString";
              goto LABEL_84;
            }
            uint64_t v32 = [NSString stringWithFormat:@"struct %@", v17];

            int v17 = (__CFString *)v32;
          }
          if (v17) {
            goto LABEL_84;
          }
        }
      }
    }
    [v12 setString:&stru_1EFE27F38];
    int v17 = @"struct";
    goto LABEL_84;
  }
  if (*v13 > 0x29u)
  {
    if (v16 == 42)
    {
LABEL_67:
      int v17 = @"char[]";
      goto LABEL_84;
    }
    if (v16 == 58)
    {
      int v17 = @"SEL";
      goto LABEL_84;
    }
    goto LABEL_83;
  }
  if (v16 != 35)
  {
    if (v16 != 40) {
      goto LABEL_83;
    }
LABEL_30:
    [v12 setString:&stru_1EFE27F38];
LABEL_31:
    int v17 = @"malloc";
    goto LABEL_84;
  }
  int v17 = @"Class";
LABEL_84:
  id v10 = [(__CFString *)v17 stringByAppendingString:v12];

LABEL_11:

  return v10;
}

id descriptionOfValueAtAddressWithTypeEncoding(uint64_t a1, unsigned __int8 *a2, int a3, void *a4)
{
  id v7 = a4;
  uint64_t v8 = v7;
  id v9 = 0;
  if (a1 && a2)
  {
    uint64_t v17 = 0;
    int v18 = &v17;
    uint64_t v19 = 0x3032000000;
    int v20 = __Block_byref_object_copy__8;
    unint64_t v21 = __Block_byref_object_dispose__8;
    id v22 = 0;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __descriptionOfValueAtAddressWithTypeEncoding_block_invoke;
    void v11[3] = &unk_1E5D257C0;
    uint64_t v13 = &v17;
    uint64_t v14 = a1;
    id v12 = v7;
    id v15 = a2;
    int v16 = a3;
    _parse_type(a2, 0, v11);
    id v9 = (id)v18[5];

    _Block_object_dispose(&v17, 8);
  }

  return v9;
}

void sub_1A7D57CCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __descriptionOfValueAtAddressWithTypeEncoding_block_invoke(uint64_t a1, int a2, uint64_t a3, void *a4, void *a5, void *a6)
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12) {
    goto LABEL_96;
  }
  if (a2 <= 82)
  {
    if (a2 > 57)
    {
      switch(a2)
      {
        case '?':
        case '@':
          goto LABEL_15;
        case 'A':
        case 'D':
        case 'E':
        case 'F':
        case 'G':
        case 'H':
        case 'J':
        case 'K':
          goto LABEL_35;
        case 'B':
          if (**(unsigned char **)(a1 + 48)) {
            uint64_t v13 = "YES";
          }
          else {
            uint64_t v13 = "NO";
          }
          [NSString stringWithFormat:@"%s", v13, v80, v81, v82];
          goto LABEL_93;
        case 'C':
          [NSString stringWithFormat:@"%u %c", **(unsigned __int8 **)(a1 + 48), **(unsigned __int8 **)(a1 + 48), v81, v82];
          goto LABEL_93;
        case 'I':
          dispatch_time_t v64 = NSString;
          uint64_t v65 = **(unsigned int **)(a1 + 48);
          goto LABEL_88;
        case 'L':
          [NSString stringWithFormat:@"%lu", *(unsigned long *)(*(void **)(a1 + 48)), v80, v81, v82];
          goto LABEL_93;
        default:
          if (a2 == 58)
          {
            mach_vm_address_t v66 = task_peek_string([*(id *)(a1 + 32) task], **(void **)(a1 + 48));
            if (!v66) {
              goto LABEL_96;
            }
            [NSString stringWithFormat:@"@selector(%s)", v66, v80, v81, v82];
          }
          else
          {
            if (a2 != 81) {
              goto LABEL_35;
            }
            [NSString stringWithFormat:@"%llu", **(void **)(a1 + 48), v80, v81, v82];
          }
          break;
      }
      goto LABEL_93;
    }
    if (a2 != 35)
    {
      if (a2 == 40)
      {
        printf("    UNION TYPE ENCODING: %s\n", *(const char **)(a1 + 56));
      }
      else if (a2 == 42)
      {
LABEL_15:
        uint64_t v14 = **(void **)(a1 + 48);
        if (v14)
        {
          id v15 = [*(id *)(a1 + 32) objectIdentifier];
          uint64_t v16 = [v15 taggedPointerMask];

          if ((v16 & v14) != 0)
          {
            uint64_t v17 = [*(id *)(a1 + 32) objectIdentifier];
            uint64_t v18 = [v17 labelForTaggedPointer:v14];
            uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 8);
            int v20 = *(void **)(v19 + 40);
            *(void *)(v19 + 40) = v18;

            if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
            {
              uint64_t v21 = [NSString stringWithFormat:@"tagged pointer %@", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
              uint64_t v22 = *(void *)(*(void *)(a1 + 40) + 8);
              size_t v23 = *(void **)(v22 + 40);
              *(void *)(v22 + 40) = v21;
            }
          }
          if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
          {
            uint64_t v24 = [*(id *)(a1 + 32) objectIdentifier];
            unint64_t v25 = [v24 classInfoForObjectWithRange:v14];

            int v26 = [v25 className];

            id v27 = NSString;
            if (v26)
            {
              id v28 = [v25 className];
              uint64_t v29 = [v27 stringWithFormat:@"<%@ %p>", v28, v14];
              uint64_t v30 = *(void *)(*(void *)(a1 + 40) + 8);
              int v31 = *(void **)(v30 + 40);
              *(void *)(v30 + 40) = v29;
            }
            else
            {
              uint64_t v68 = [NSString stringWithFormat:@"%p", v14];
              uint64_t v69 = *(void *)(*(void *)(a1 + 40) + 8);
              id v28 = *(void **)(v69 + 40);
              *(void *)(v69 + 40) = v68;
            }

            id v70 = [*(id *)(a1 + 32) objectIdentifier];
            v71 = [v70 labelForMallocBlock:v14 capacity:1024];

            if (v71)
            {
              uint64_t v72 = [NSString stringWithFormat:@"%@ %@", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v71];
              uint64_t v73 = *(void *)(*(void *)(a1 + 40) + 8);
              os_signpost_id_t v74 = *(void **)(v73 + 40);
              *(void *)(v73 + 40) = v72;
            }
          }
          goto LABEL_96;
        }
        goto LABEL_31;
      }
LABEL_35:
      uint64_t v45 = *(void *)(*(void *)(a1 + 40) + 8);
      id v39 = *(void **)(v45 + 40);
      *(void *)(v45 + 40) = 0;
      goto LABEL_95;
    }
    long long v40 = [*(id *)(a1 + 32) objectIdentifier];
    id v41 = [(__CFString *)v40 classInfoForMemory:*(void *)(a1 + 48) length:1024];
    uint64_t v42 = [(__CFString *)v41 className];
LABEL_33:
    uint64_t v43 = *(void *)(*(void *)(a1 + 40) + 8);
    id v44 = *(void **)(v43 + 40);
    *(void *)(v43 + 40) = v42;

    goto LABEL_96;
  }
  if (a2 > 98)
  {
    switch(a2)
    {
      case 'c':
        [NSString stringWithFormat:@"%d %c", **(char **)(a1 + 48), **(char **)(a1 + 48), v81, v82];
        goto LABEL_93;
      case 'd':
        int v60 = NSString;
        double v61 = **(double **)(a1 + 48);
        goto LABEL_79;
      case 'e':
      case 'g':
      case 'h':
      case 'j':
      case 'k':
      case 'm':
      case 'n':
      case 'o':
      case 'p':
      case 'r':
        goto LABEL_35;
      case 'f':
        int v60 = NSString;
        double v61 = **(float **)(a1 + 48);
LABEL_79:
        [v60 stringWithFormat:@"%g", *(void *)&v61, v80, v81, v82];
        goto LABEL_93;
      case 'i':
        uint64_t v62 = NSString;
        uint64_t v63 = **(unsigned int **)(a1 + 48);
        goto LABEL_84;
      case 'l':
        [NSString stringWithFormat:@"%ld", *(long *)(*(void **)(a1 + 48)), v80, v81, v82];
        goto LABEL_93;
      case 'q':
        [NSString stringWithFormat:@"%lld", *(long long *)(*(void **)(a1 + 48)), v80, v81, v82];
        goto LABEL_93;
      case 's':
        uint64_t v62 = NSString;
        uint64_t v63 = **(__int16 **)(a1 + 48);
LABEL_84:
        [v62 stringWithFormat:@"%d", v63, v80, v81, v82];
        goto LABEL_93;
      default:
        if (a2 != 123) {
          goto LABEL_35;
        }
        uint64_t v46 = *(const char **)(a1 + 56);
        if (!strncmp(v46, "{CGRect=", 8uLL))
        {
          [NSString stringWithFormat:@"x:%g y:%g w:%g h:%g", **(void **)(a1 + 48), *(void *)(*(void *)(a1 + 48) + 8), *(void *)(*(void *)(a1 + 48) + 16), *(void *)(*(void *)(a1 + 48) + 24)];
          goto LABEL_93;
        }
        int v47 = strncmp(v46, "{_NSRange=", 0xAuLL);
        unint64_t v48 = *(void *)(a1 + 48);
        if (!v47)
        {
          if (*(void *)v48 == 0x7FFFFFFFFFFFFFFFLL)
          {
            long long v40 = @"NSNotFound";
          }
          else
          {
            [NSString stringWithFormat:@"%lu", *(void *)v48];
            long long v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          if (*(void *)(v48 + 8) == 0x7FFFFFFFFFFFFFFFLL)
          {
            id v41 = @"NSNotFound";
          }
          else
          {
            [NSString stringWithFormat:@"%lu", *(void *)(v48 + 8)];
            id v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          uint64_t v42 = [NSString stringWithFormat:@"{ location:%@  length:%@ }", v40, v41];
          goto LABEL_33;
        }
        uint64_t v83 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"{"];
        id v49 = strchr(*(char **)(a1 + 56), 61);
        if (!v49) {
          goto LABEL_112;
        }
        uint64_t v51 = v49 + 1;
        int v50 = v49[1];
        break;
    }
    while (1)
    {
      if (v50 != 34) {
        goto LABEL_109;
      }
      uint64_t v52 = v51 + 1;
      id v53 = strchr(v52, 34);
      if (!v53 || (id v54 = v53, v55 = v53[1], !memchr("LiIcCqQsSfdB@*?#:^", v55, 0x13uLL)))
      {
        int v50 = *v52;
LABEL_109:
        if (v50 == 125)
        {
          [v83 appendString:@"}"];
          uint64_t v75 = *(void *)(*(void *)(a1 + 40) + 8);
          id v76 = v83;
          v77 = *(void **)(v75 + 40);
          *(void *)(v75 + 40) = v76;
        }
        else
        {
LABEL_112:
          int v78 = *(const char **)(a1 + 56);
          if (strncmp(v78, "{RefCounts<swift::", 0x12uLL)) {
            printf("    FAILED STRUCTURE TYPE ENCODING: %s\n", v78);
          }
          uint64_t v79 = *(void *)(*(void *)(a1 + 40) + 8);
          v77 = *(void **)(v79 + 40);
          *(void *)(v79 + 40) = 0;
        }

        goto LABEL_96;
      }
      uint64_t v56 = 0;
      int v84 = v55;
      if (v55 > 82) {
        break;
      }
      if (v55 <= 65)
      {
        if (v55 > 57)
        {
          if (v55 != 58 && v55 != 64) {
            goto LABEL_70;
          }
        }
        else if (v55 != 35 && v55 != 42)
        {
          goto LABEL_70;
        }
      }
      else
      {
        if (v55 <= 75)
        {
          if ((v55 - 66) < 2)
          {
LABEL_56:
            uint64_t v56 = 1;
          }
          else if (v55 == 73)
          {
LABEL_51:
            uint64_t v56 = 4;
          }
LABEL_70:
          __int16 v85 = v84;
          descriptionOfValueAtAddressWithTypeEncoding(v48, &v85, *(unsigned int *)(a1 + 64), *(void *)(a1 + 32));
          int v58 = (__CFString *)objc_claimAutoreleasedReturnValue();
          uint64_t v57 = v56;
          goto LABEL_71;
        }
        if (v55 != 76 && v55 != 81) {
          goto LABEL_70;
        }
      }
LABEL_65:
      if (!HIDWORD(v48))
      {
        uint64_t v57 = 8;
        int v58 = &stru_1EFE27F38;
        goto LABEL_71;
      }
      uint64_t v56 = 8;
      uint64_t v57 = 8;
      int v58 = &stru_1EFE27F38;
      if ((v48 & 7) == 0) {
        goto LABEL_70;
      }
LABEL_71:
      [v83 appendFormat:@" %.*s:%@ ", v54 - v52, v52, v58];
      uint64_t v51 = v54 + 2;
      if (v84 == 94)
      {
        if (*v51 == 123)
        {
          id v59 = strchr(v54 + 2, 125);
          if (!v59)
          {

            goto LABEL_112;
          }
          uint64_t v51 = v59 + 1;
        }
        else
        {
          uint64_t v51 = v54 + 3;
        }
      }
      v48 += v57;

      int v50 = *v51;
    }
    switch(v55)
    {
      case 'c':
        goto LABEL_56;
      case 'd':
      case 'l':
      case 'q':
        goto LABEL_65;
      case 'e':
      case 'g':
      case 'h':
      case 'j':
      case 'k':
      case 'm':
      case 'n':
      case 'o':
      case 'p':
      case 'r':
        goto LABEL_70;
      case 'f':
      case 'i':
        goto LABEL_51;
      case 's':
        goto LABEL_69;
      default:
        if (v55 == 83)
        {
LABEL_69:
          uint64_t v56 = 2;
        }
        else if (v55 == 94)
        {
          goto LABEL_65;
        }
        break;
    }
    goto LABEL_70;
  }
  if (a2 == 83)
  {
    dispatch_time_t v64 = NSString;
    uint64_t v65 = **(unsigned __int16 **)(a1 + 48);
LABEL_88:
    [v64 stringWithFormat:@"%u", v65, v80, v81, v82];
    uint64_t v37 = LABEL_93:;
    goto LABEL_94;
  }
  if (a2 != 94) {
    goto LABEL_35;
  }
  uint64_t v32 = **(void **)(a1 + 48);
  if (!v32)
  {
LABEL_31:
    uint64_t v38 = *(void *)(*(void *)(a1 + 40) + 8);
    id v39 = *(void **)(v38 + 40);
    *(void *)(v38 + 40) = @"0x0";
LABEL_95:

    goto LABEL_96;
  }
  id v33 = [*(id *)(a1 + 32) objectIdentifier];
  [v33 symbolForAddress:v32];

  if ((CSIsNull() & 1) == 0)
  {
    uint64_t v34 = [NSString stringWithFormat:@"%p %s", v32, CSSymbolGetName()];
    uint64_t v35 = *(void *)(*(void *)(a1 + 40) + 8);
    id v36 = *(void **)(v35 + 40);
    *(void *)(v35 + 40) = v34;

    CSSymbolGetSymbolOwner();
    if ((CSIsNull() & 1) == 0)
    {
      uint64_t v37 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) stringByAppendingFormat:@" (in %s)", CSSymbolOwnerGetName()];
LABEL_94:
      uint64_t v67 = *(void *)(*(void *)(a1 + 40) + 8);
      id v39 = *(void **)(v67 + 40);
      *(void *)(v67 + 40) = v37;
      goto LABEL_95;
    }
  }
LABEL_96:
}

uint64_t pointerScanSizeForTypeEncoding(unsigned __int8 *a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v4 = a2;
  if (a1)
  {
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x2020000000;
    int v14 = a2;
    if ((a2 & 0x80000000) != 0
      || ((uint64_t v5 = 0, a2 < 8) ? (v6 = a3) : (v6 = 0), a2 >= 4 && (v6 & 1) == 0))
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __pointerScanSizeForTypeEncoding_block_invoke;
      v9[3] = &unk_1E5D257E8;
      v9[4] = &v11;
      v9[5] = a4;
      char v10 = a3;
      _parse_type(a1, 0, v9);
      int v7 = *((_DWORD *)v12 + 6);
      if (v7 >= (int)v4) {
        uint64_t v5 = v4;
      }
      else {
        uint64_t v5 = v7;
      }
    }
    _Block_object_dispose(&v11, 8);
    return v5;
  }
  return v4;
}

void sub_1A7D5884C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t __pointerScanSizeForTypeEncoding_block_invoke(uint64_t result, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a6) {
    return result;
  }
  char v6 = *(unsigned char **)(result + 40);
  if (v6) {
    *char v6 = a2;
  }
  int v7 = 0;
  if (a2 <= 80)
  {
    if (a2 <= 65)
    {
      if (a2 > 57)
      {
        if (a2 != 58 && a2 != 64) {
          return result;
        }
      }
      else if (a2 != 35 && a2 != 42)
      {
        return result;
      }
      goto LABEL_22;
    }
    if ((a2 - 66) >= 2)
    {
      if (a2 != 73)
      {
        if (a2 != 76) {
          return result;
        }
LABEL_22:
        if (*(unsigned char *)(result + 48)) {
          char v9 = 3;
        }
        else {
          char v9 = 2;
        }
        int v7 = a3 << v9;
        goto LABEL_35;
      }
LABEL_26:
      if (*(unsigned char *)(result + 48)) {
        int v7 = 0;
      }
      else {
        int v7 = 4 * a3;
      }
    }
LABEL_35:
    *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v7;
    return result;
  }
  switch(a2)
  {
    case '^':
    case 'l':
      goto LABEL_22;
    case '_':
    case 'a':
    case 'e':
    case 'g':
    case 'h':
    case 'j':
    case 'k':
    case 'm':
    case 'n':
    case 'o':
    case 'p':
    case 'r':
      return result;
    case 'b':
    case 'd':
    case 'f':
    case 's':
      goto LABEL_35;
    case 'c':
      if (*(unsigned char *)(result + 48)) {
        int v8 = -8;
      }
      else {
        int v8 = -4;
      }
      int v7 = v8 & a3;
      goto LABEL_35;
    case 'i':
      goto LABEL_26;
    case 'q':
      goto LABEL_32;
    default:
      if (a2 == 81)
      {
LABEL_32:
        if (*(unsigned char *)(result + 48)) {
          int v7 = 8 * a3;
        }
        else {
          int v7 = 0;
        }
        goto LABEL_35;
      }
      if (a2 == 83) {
        goto LABEL_35;
      }
      break;
  }
  return result;
}

uint64_t getStructureLayoutDescription(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4 = a4;
  CSSymbolOwnerGetSymbolWithName();
  if (CSIsNull())
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t Range = CSSymbolGetRange();
    uint64_t v5 = v4[2](v4, Range, v7);
  }

  return v5;
}

const char *VMUVMRegionShareModeName(int a1)
{
  if ((a1 - 1) > 6) {
    return "   ";
  }
  else {
    return off_1E5D25848[(char)(a1 - 1)];
  }
}

uint64_t VMUPurgeableDisplayCharacter(unsigned int a1)
{
  unsigned int v1 = 0x5845564Eu >> (8 * a1);
  if (a1 >= 4) {
    LOBYTE(v1) = 63;
  }
  return v1 & 0x7F;
}

uint64_t VMUSortIndexForLibraryPath(void *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if ([v1 length])
  {
    unsigned int v2 = (void *)MEMORY[0x1AD0D9F90]();
    id v3 = v1;
    uint64_t v4 = (char *)[v3 UTF8String];
    if ((_isApplicationUI__tried & 1) == 0)
    {
      if (!regcomp(&_isApplicationUI__localPreg, "/(AppKit|UIKit(Core))\\.framework|/libswiftAppKit.dylib", 5)) {
        _isApplicationUI__createdSuccessfully = 1;
      }
      _isApplicationUI__tried = 1;
    }
    if (_isApplicationUI__createdSuccessfully == 1 && !regexec(&_isApplicationUI__localPreg, v4, 0, 0, 0))
    {
      uint64_t v5 = 1;
    }
    else
    {
      if ((_isFoundation__tried & 1) == 0)
      {
        if (!regcomp(&_isFoundation__localPreg, "/Foundation.framework|/libswiftFoundation.dylib", 5)) {
          _isFoundation__createdSuccessfully = 1;
        }
        _isFoundation__tried = 1;
      }
      if (_isFoundation__createdSuccessfully == 1 && !regexec(&_isFoundation__localPreg, v4, 0, 0, 0))
      {
        uint64_t v5 = 2;
      }
      else
      {
        if ((_isCoreFoundation__tried & 1) == 0)
        {
          if (!regcomp(&_isCoreFoundation__localPreg, "/CoreFoundation.framework", 5)) {
            _isCoreFoundation__createdSuccessfully = 1;
          }
          _isCoreFoundation__tried = 1;
        }
        if (_isCoreFoundation__createdSuccessfully == 1 && !regexec(&_isCoreFoundation__localPreg, v4, 0, 0, 0))
        {
          uint64_t v5 = 3;
        }
        else
        {
          if ((_isDatabase__tried & 1) == 0)
          {
            if (!regcomp(&_isDatabase__localPreg, "/CoreData\\.framework/|/libsql[^/]*\\.dylib|/libswiftCoreData.dylib", 5))_isDatabase__createdSuccessfully = 1; {
            _isDatabase__tried = 1;
            }
          }
          if (_isDatabase__createdSuccessfully == 1 && !regexec(&_isDatabase__localPreg, v4, 0, 0, 0))
          {
            uint64_t v5 = 4;
          }
          else if (_isWeb(v4))
          {
            uint64_t v5 = 5;
          }
          else if (_isNetworkIO(v4))
          {
            uint64_t v5 = 6;
          }
          else if (_isGraphics(v4))
          {
            uint64_t v5 = 7;
          }
          else if (_isAudio(v4))
          {
            uint64_t v5 = 8;
          }
          else if (_isSecurity(v4))
          {
            uint64_t v5 = 9;
          }
          else if (_isLanguage(v4))
          {
            uint64_t v5 = 10;
          }
          else if (_isSystem(v4))
          {
            uint64_t v5 = 11;
          }
          else if (_isFramework(v4))
          {
            uint64_t v5 = 12;
          }
          else
          {
            long long v15 = 0u;
            long long v16 = 0u;
            long long v13 = 0u;
            long long v14 = 0u;
            uint64_t v6 = [&unk_1EFE400C0 countByEnumeratingWithState:&v13 objects:v17 count:16];
            if (v6)
            {
              uint64_t v7 = v6;
              uint64_t v8 = *(void *)v14;
              int v9 = 12;
              while (2)
              {
                uint64_t v10 = 0;
                int v11 = v9;
                v9 += v7;
                do
                {
                  if (*(void *)v14 != v8) {
                    objc_enumerationMutation(&unk_1EFE400C0);
                  }
                  if ([v3 hasPrefix:*(void *)(*((void *)&v13 + 1) + 8 * v10)])
                  {
                    uint64_t v5 = (v11 + v10 + 1);
                    goto LABEL_57;
                  }
                  ++v10;
                }
                while (v7 != v10);
                uint64_t v7 = [&unk_1EFE400C0 countByEnumeratingWithState:&v13 objects:v17 count:16];
                if (v7) {
                  continue;
                }
                break;
              }
            }
            uint64_t v5 = 0;
          }
        }
      }
    }
LABEL_57:
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

BOOL _isWeb(char *a1)
{
  if ((_isWeb__tried & 1) == 0)
  {
    if (!regcomp(&_isWeb__localPreg, "/(Web(Kit|Core)|JavaScriptCore)\\.framework/", 5)) {
      _isWeb__createdSuccessfully = 1;
    }
    _isWeb__tried = 1;
  }
  return _isWeb__createdSuccessfully == 1 && regexec(&_isWeb__localPreg, a1, 0, 0, 0) == 0;
}

BOOL _isNetworkIO(char *a1)
{
  if ((_isNetworkIO__tried & 1) == 0)
  {
    if (!regcomp(&_isNetworkIO__localPreg, "/(CFNetwork|IO)\\.framework/", 5)) {
      _isNetworkIO__createdSuccessfully = 1;
    }
    _isNetworkIO__tried = 1;
  }
  return _isNetworkIO__createdSuccessfully == 1 && regexec(&_isNetworkIO__localPreg, a1, 0, 0, 0) == 0;
}

BOOL _isGraphics(char *a1)
{
  if ((_isGraphics__tried & 1) == 0)
  {
    if (!regcomp(&_isGraphics__localPreg, "/(Core(Text|UI|Graphics|Video|Image|Media(IOServices)?|PDF)|ATS|ColorSync|ImageIO|Metal(Kit)?|OpenGL|Quartz(Core)?|QTKit|VideoToolbox|OpenCL|QD|IOSurface)\\.framework|/libswiftCore(Graphics|Image).dylib", 5))_isGraphics__createdSuccessfully = 1; {
    _isGraphics__tried = 1;
    }
  }
  return _isGraphics__createdSuccessfully == 1 && regexec(&_isGraphics__localPreg, a1, 0, 0, 0) == 0;
}

BOOL _isAudio(char *a1)
{
  if ((_isAudio__tried & 1) == 0)
  {
    if (!regcomp(&_isAudio__localPreg, "/(Speech[^/]*\\.framework|[^/]*(A|a)udio[^/]*\\.(framework|component|bundle|kext)|AppleHDA.kext)/", 5))_isAudio__createdSuccessfully = 1; {
    _isAudio__tried = 1;
    }
  }
  return _isAudio__createdSuccessfully == 1 && regexec(&_isAudio__localPreg, a1, 0, 0, 0) == 0;
}

BOOL _isSecurity(char *a1)
{
  if ((_isSecurity__tried & 1) == 0)
  {
    if (!regcomp(&_isSecurity__localPreg, "/(Security(Foundation|Interface|HI)?|Kerberos(Helper)?|TrustEvaluationAgent)\\.framework/|/lib(crypto|ssl|sasl2)[^/]*\\.dylib|/sasl2/", 5))_isSecurity__createdSuccessfully = 1; {
    _isSecurity__tried = 1;
    }
  }
  return _isSecurity__createdSuccessfully == 1 && regexec(&_isSecurity__localPreg, a1, 0, 0, 0) == 0;
}

BOOL _isLanguage(char *a1)
{
  if ((_isLanguage__tried & 1) == 0)
  {
    if (!regcomp(&_isLanguage__localPreg, "/(JavaVM|Ruby|Python|Tcl|Tk)\\.framework/|/ruby/|/lib(tcl|tk|python|perl|swiftCore|swiftObjectiveC|c\\+\\+abi)[^/]*\\.dylib", 5))_isLanguage__createdSuccessfully = 1; {
    _isLanguage__tried = 1;
    }
  }
  return _isLanguage__createdSuccessfully == 1 && regexec(&_isLanguage__localPreg, a1, 0, 0, 0) == 0;
}

BOOL _isSystem(char *a1)
{
  if ((_isSystem__tried & 1) == 0)
  {
    if (!regcomp(&_isSystem__localPreg, "/usr/lib/((lib[^/]*\\.dylib)|dyld|system)|/libswift(Darwin|Dispatch).dylib", 5))_isSystem__createdSuccessfully = 1; {
    _isSystem__tried = 1;
    }
  }
  return _isSystem__createdSuccessfully == 1 && regexec(&_isSystem__localPreg, a1, 0, 0, 0) == 0;
}

BOOL _isFramework(char *a1)
{
  if ((_isFramework__tried & 1) == 0)
  {
    if (!regcomp(&_isFramework__localPreg, "/System/Library/(Private)?Frameworks/[^/]*\\.framework/", 5)) {
      _isFramework__createdSuccessfully = 1;
    }
    _isFramework__tried = 1;
  }
  return _isFramework__createdSuccessfully == 1 && regexec(&_isFramework__localPreg, a1, 0, 0, 0) == 0;
}

void sub_1A7D5CDCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  __destructor_8_s8_s16_s24_sb48((uint64_t)va);
  _Unwind_Resume(a1);
}

id visit(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)a1) {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  else {
    id v4 = 0;
  }
  for (uint64_t i = *(unsigned int *)(*(void *)(a1 + 32) + 4 * a2);
        i != -1;
        uint64_t i = *(unsigned int *)(*(void *)(a1 + 40) + 4 * i))
  {
    uint64_t v6 = visit(a1, i);
    if (!v6)
    {
      int v11 = 0;
      goto LABEL_19;
    }
    uint64_t v7 = (void *)v6;
    if (v4) {
      [v4 addObject:v6];
    }
  }
  uint64_t v14 = 0;
  unint64_t v15 = 0;
  uint64_t v16 = 0;
  (*(void (**)(uint64_t *__return_ptr, void, char *, uint64_t))(a1 + 56))(&v14, *(void *)(a1 + 16), sel_nodeDetails_, a2);
  if (v15 >> 60 == 5 || v15 >> 60 == 2)
  {
    int v9 = *(void **)(a1 + 8);
    uint64_t v10 = [NSNumber numberWithUnsignedLongLong:v14];
    id v12 = [v9 objectForKey:v10];

    if (!v12)
    {
      id v12 = [*(id *)(a1 + 24) nonSubmapRegionContainingAddress:v14];
    }
  }
  else
  {
    id v12 = 0;
  }
  (*(void (**)(void, char *, uint64_t))(a1 + 64))(*(void *)(a1 + 16), sel_stackIDForNode_, a2);
  int v11 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48));

LABEL_19:

  return v11;
}

void __destructor_8_s8_s16_s24_sb48(uint64_t a1)
{
  unsigned int v2 = *(void **)(a1 + 48);
}

void sub_1A7D5D618(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1A7D5DFD0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1A7D605A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v26 - 176), 8);
  _Block_object_dispose((const void *)(v26 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1A7D60E24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v26 - 192), 8);
  _Block_object_dispose((const void *)(v26 - 160), 8);
  _Unwind_Resume(a1);
}

id VMUDirectedGraphErrorWithExtraUserInfo(unsigned int a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v11 = a2;
  id v12 = a3;
  if (v12) {
    long long v13 = (void *)[[NSString alloc] initWithFormat:v12 arguments:&a9];
  }
  else {
    long long v13 = 0;
  }
  uint64_t v14 = objc_opt_new();
  [v14 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F28568]];
  if (v11) {
    [v14 addEntriesFromDictionary:v11];
  }
  unint64_t v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"VMUDirectedGraphDomain" code:a1 userInfo:v14];

  return v15;
}

void sub_1A7D61D30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t nsfilehandle_write(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = (void *)MEMORY[0x1E4F1C9B8];
  id v8 = a1;
  int v9 = [v7 dataWithBytesNoCopy:a2 length:a3 freeWhenDone:0];
  uint64_t v10 = [v8 writeData:v9 error:a4];

  return v10;
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

void sub_1A7D64120(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void __VMUCompressedBuffer_block_invoke(void *a1, uint64_t a2, int a3, void *a4)
{
  uint64_t v6 = (void *)MEMORY[0x1E4F1CA58];
  uint64_t v7 = a2 + 16;
  id v8 = a4;
  id v14 = [v6 dataWithLength:v7];
  uint64_t v9 = v8[2](v8, [v14 mutableBytes] + 16);

  if (v9)
  {
    [v14 setLength:v9 + 16];
    id v10 = v14;
    id v11 = (_DWORD *)[v10 mutableBytes];
    uint64_t v12 = a1[6];
    int v13 = a3 | (*(_DWORD *)(*(void *)(a1[4] + 8) + 24) << 16);
    *id v11 = 16;
    v11[1] = v9;
    v11[2] = v12;
    void v11[3] = v13;
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), v10);
  }
  else
  {
    [v14 setLength:0];
  }
}

uint64_t __VMUCompressedBuffer_block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 56) = a2;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 64) = v3;
  uint64_t v4 = deflate((z_streamp)(*(void *)(*(void *)(a1 + 32) + 8) + 32), 4);
  deflateEnd((z_streamp)(*(void *)(*(void *)(a1 + 32) + 8) + 32));
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v4 == 1) {
    return *(void *)(v5 + 72);
  }
  NSLog(&cfstr_UnableToCompre.isa, v4, *(void *)(v5 + 80));
  return 0;
}

uint8_t *__VMUCompressedBuffer_block_invoke_3(void *a1, uint8_t *a2)
{
  uint64_t v3 = (const uint8_t *)a1[4];
  size_t v4 = a1[5];
  size_t v5 = a1[6];
  memset(&v9, 0, sizeof(v9));
  if (compression_stream_init(&v9, COMPRESSION_STREAM_ENCODE, COMPRESSION_LZFSE) == COMPRESSION_STATUS_ERROR)
  {
    NSLog(&cfstr_UnableToInitia_0.isa);
    return 0;
  }
  v9.src_ptr = v3;
  v9.src_mach_vm_size_t size = v4;
  v9.dst_ptr = a2;
  v9.dst_mach_vm_size_t size = v5;
  compression_status v6 = compression_stream_process(&v9, 1);
  switch(v6)
  {
    case COMPRESSION_STATUS_ERROR:
      NSLog(&cfstr_ErrorCompressi.isa);
      return 0;
    case COMPRESSION_STATUS_OK:
      NSLog(&cfstr_ErrorCompressi_0.isa);
      return 0;
    case COMPRESSION_STATUS_END:
      if (v9.dst_ptr > a2) {
        uint64_t v7 = (uint8_t *)(v9.dst_ptr - a2);
      }
      else {
        uint64_t v7 = 0;
      }
      break;
    default:
      uint64_t v7 = 0;
      break;
  }
  compression_stream_destroy(&v9);
  return v7;
}

uint64_t __VMUCompressedBuffer_block_invoke_4(uint64_t a1, void *__dst)
{
  return *(void *)(a1 + 40);
}

const char *VMUGraphNodeTypeDescription(unsigned int a1)
{
  if (a1 > 5) {
    return "";
  }
  else {
    return off_1E5D25F28[a1];
  }
}

BOOL VMUGraphNodeType_IsVMRegion(int a1)
{
  return a1 == 2 || a1 == 5;
}

BOOL VMUGraphNodeType_IsRoot(int a1)
{
  return (a1 - 2) < 3;
}

uint64_t VMUGraphNodeType_IsAddressValid(unsigned int a1)
{
  return (a1 > 4) | (6u >> a1) & 1;
}

void sub_1A7D67854(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
}

void sub_1A7D68280(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1A7D699D4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1A7D69BD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A7D6AB94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

unint64_t *sortNodesInMap(unint64_t *result, void *__base, size_t __nel)
{
  if (__nel >= 2)
  {
    __compar[5] = v3;
    __compar[6] = v4;
    unint64_t v5 = result[2];
    if (v5 < *result) {
      goto LABEL_7;
    }
    compression_status v6 = result + 4;
    uint64_t v7 = 2;
    do
    {
      unint64_t v8 = v7;
      if (__nel == v7) {
        break;
      }
      unint64_t v9 = *v6;
      v6 += 2;
      ++v7;
      BOOL v10 = v9 >= v5;
      unint64_t v5 = v9;
    }
    while (v10);
    if (v8 < __nel)
    {
LABEL_7:
      __compar[0] = MEMORY[0x1E4F143A8];
      __compar[1] = 3221225472;
      __compar[2] = __sortNodesInMap_block_invoke;
      __compar[3] = &__block_descriptor_40_e15_i24__0r_v8r_v16l;
      __compar[4] = result;
      return (unint64_t *)mergesort_b(__base, __nel, 4uLL, __compar);
    }
  }
  return result;
}

void sub_1A7D6B084(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

id _subgraphWithPaths(void *a1, uint64_t a2, uint64_t a3, char a4)
{
  id v7 = a1;
  unint64_t v8 = (void *)[v7 copy];
  int v9 = [v7 edgeNamespaceSize];
  BOOL v10 = malloc_type_calloc(1uLL, ((v9 + 7) >> 3) + 4, 0xFF42C4F3uLL);
  *BOOL v10 = v9;
  size_t v11 = 4 * [v7 nodeNamespaceSize];
  uint64_t v12 = malloc_type_malloc(v11, 0x100004052888210uLL);
  int __pattern4 = -1;
  memset_pattern4(v12, &__pattern4, v11);
  size_t v13 = 4 * [v7 nodeNamespaceSize];
  id v14 = malloc_type_malloc(v13, 0x100004052888210uLL);
  int __pattern4 = -1;
  memset_pattern4(v14, &__pattern4, v13);
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  uint64_t v24 = ___subgraphWithPaths_block_invoke_2;
  unint64_t v25 = &unk_1E5D25F08;
  id v15 = v7;
  id v26 = v15;
  id v27 = v12;
  id v28 = v14;
  uint64_t v29 = a3;
  uint64_t v30 = v10;
  char v31 = a4;
  [v15 breadthFirstSearch:a2 nodeVisitBlock:&__block_literal_global_187 edgeVisitBlock:&v22];
  int v16 = *v10;
  unint64_t v17 = (*v10 + 7);
  if (v17 >= 8)
  {
    uint64_t v18 = v10 + 1;
    uint64_t v19 = v17 >> 3;
    if (v17 >> 3 <= 1) {
      uint64_t v19 = 1;
    }
    do
    {
      *uint64_t v18 = ~*v18;
      ++v18;
      --v19;
    }
    while (v19);
  }
  int v20 = v16 & 7;
  if (v20) {
    *((unsigned char *)v10 + (v17 >> 3) + 3) ^= -1 << v20;
  }
  [v8 removeMarkedEdges:v10, v22, v23, v24, v25];
  if (v12) {
    free(v12);
  }
  if (v14) {
    free(v14);
  }
  free(v10);

  return v8;
}

void sub_1A7D6B5B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __sortNodesInMap_block_invoke(uint64_t a1, unsigned int *a2, unsigned int *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  unint64_t v4 = *(void *)(v3 + 16 * *a2);
  unint64_t v5 = *(void *)(v3 + 16 * *a3);
  BOOL v6 = v4 >= v5;
  BOOL v7 = v4 > v5;
  if (v6) {
    return v7;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t ___subgraphWithPaths_block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  if (((a3 + 1) & 0xFE) != 0) {
    return 2;
  }
  else {
    return (a3 + 1);
  }
}

BOOL ___subgraphWithPaths_block_invoke_2(uint64_t a1, uint64_t a2, int a3, unsigned int a4, unsigned char *a5)
{
  if (*a5) {
    return 0;
  }
  int v8 = a2;
  BOOL v10 = *(void **)(a1 + 32);
  if (v10)
  {
    [v10 referenceInfoWithName:a2];
    LOBYTE(v10) = v20;
  }
  BOOL result = VMUIsOwningReference((char)v10);
  if (result)
  {
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 48);
    *(_DWORD *)(v11 + 4 * a4) = a3;
    uint64_t v13 = a4;
    *(_DWORD *)(v12 + 4 * a4) = v8;
    id v14 = *(unsigned int **)(a1 + 56);
    if (*v14 <= (unint64_t)a4)
    {
      return 1;
    }
    else
    {
      BOOL result = 1;
      if (((unint64_t)*((unsigned __int8 *)v14 + ((unint64_t)a4 >> 3) + 4) >> (a4 & 7)))
      {
        do
        {
          id v15 = *(_DWORD **)(a1 + 64);
          unint64_t v16 = *(unsigned int *)(*(void *)(a1 + 48) + 4 * v13);
          if (*v15 > v16)
          {
            uint64_t v17 = (v16 >> 3) + 4;
            int v18 = *((unsigned __int8 *)v15 + v17);
            int v19 = 1 << (v16 & 7);
            if ((v19 & v18) != 0) {
              return *(unsigned char *)(a1 + 72) == 0;
            }
            *((unsigned char *)v15 + v17) = v18 | v19;
            uint64_t v11 = *(void *)(a1 + 40);
          }
          uint64_t v13 = *(unsigned int *)(v11 + 4 * v13);
        }
        while (v13 != -1);
        return *(unsigned char *)(a1 + 72) == 0;
      }
    }
  }
  return result;
}

uint64_t shouldGetLabelForObject(void *a1, int a2)
{
  id v3 = a1;
  unint64_t v4 = v3;
  uint64_t v5 = 1;
  if (v3 && a2)
  {
    BOOL v6 = [v3 className];
    uint64_t v5 = 1;
    [v6 rangeOfString:@"String" options:1];
    if (!v7)
    {
      if ([v6 isEqualToString:@"NSPathStore2"]) {
        uint64_t v5 = 1;
      }
      else {
        uint64_t v5 = [v4 isDerivedFromStackBacktrace];
      }
    }
  }
  return v5;
}

uint64_t totalSizeOfRanges(NSMapTable *a1)
{
  memset(&enumerator, 0, sizeof(enumerator));
  NSEnumerateMapTable(&enumerator, a1);
  value = 0;
  key = 0;
  uint64_t v1 = 0;
  if (NSNextMapEnumeratorPair(&enumerator, &key, &value))
  {
    uint64_t v1 = 0;
    do
      v1 += (uint64_t)value;
    while (NSNextMapEnumeratorPair(&enumerator, &key, &value));
  }
  NSEndMapTableEnumeration(&enumerator);
  return v1;
}

void sub_1A7D6CDB8(_Unwind_Exception *a1)
{
}

void sub_1A7D6F884(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50)
{
}

_DWORD *vmu_create_backtrace_uniquing_table(unsigned int a1, int a2)
{
  unint64_t v4 = malloc_type_calloc(1uLL, 0x108uLL, 0x1080040AD5D41FBuLL);
  uint64_t v5 = v4;
  if ((a2 & 2) != 0) {
    unint64_t v6 = 24;
  }
  else {
    unint64_t v6 = 16;
  }
  v4[10] = v6;
  if (a1)
  {
    if (a1 <= 0x400) {
      int v7 = 1024;
    }
    else {
      int v7 = a1;
    }
    uint64_t v8 = (v6 * v7);
    uint64_t v9 = *MEMORY[0x1E4F14B00];
    uint64_t v10 = (((unint64_t)(v8 + *MEMORY[0x1E4F14B00] - 1) & -*MEMORY[0x1E4F14B00])
                       / *MEMORY[0x1E4F14B00]);
  }
  else
  {
    uint64_t v9 = *MEMORY[0x1E4F14B00];
    uint64_t v10 = 512;
  }
  unint64_t v11 = (v9 * v10 / v6) & 0xFFFFFFFFFFFFFFELL;
  *((void *)v4 + 1) = v10;
  *((void *)v4 + 2) = v11;
  *((void *)v4 + 3) = v9 * v10;
  if (v11 >= 0xFFFFFFFF) {
    vmu_create_backtrace_uniquing_table_cold_1();
  }
  mach_vm_address_t address = 0;
  if (mach_vm_allocate(*MEMORY[0x1E4F14960], &address, v9 * v10, 167772161)) {
    vmu_create_backtrace_uniquing_table_cold_2();
  }
  *(void *)uint64_t v5 = address;
  *((void *)v5 + 4) = 0;
  v5[14] = ((a2 & 6) == 0) | a2;
  v5[11] = 10;
  unint64_t v12 = *((void *)v5 + 2);
  if (v12 >= 0x401)
  {
    int v13 = 10;
    do
    {
      v12 >>= 2;
      v13 += 3;
    }
    while (v12 > 0x400);
    v5[11] = v13;
  }
  pthread_rwlock_init((pthread_rwlock_t *)(v5 + 16), 0);
  return v5;
}

char *vmu_create_backtrace_uniquing_table_from_archive(unint64_t a1, int a2, uint64_t a3)
{
  unint64_t v6 = (char *)malloc_type_calloc(1uLL, 0x108uLL, 0x1080040AD5D41FBuLL);
  *((_DWORD *)v6 + 14) = a2;
  if ((a2 & 2) != 0) {
    unint64_t v7 = 24;
  }
  else {
    unint64_t v7 = 16;
  }
  *((_DWORD *)v6 + 10) = v7;
  *(void *)unint64_t v6 = a3;
  unint64_t v8 = (a1 / v7) & 0xFFFFFFFFFFFFFFELL;
  *((void *)v6 + 2) = v8;
  *((void *)v6 + 3) = a1;
  if (v8 >= 0xFFFFFFFF) {
    vmu_create_backtrace_uniquing_table_from_archive_cold_1();
  }
  uint64_t v9 = v6;
  *((void *)v6 + 1) = 0;
  *((void *)v6 + 4) = 0;
  *((_DWORD *)v6 + 11) = 0;
  pthread_rwlock_init((pthread_rwlock_t *)(v6 + 64), 0);
  return v9;
}

void vmu_destroy_backtrace_uniquing_table(uint64_t a1)
{
  if (*(void *)(a1 + 8)) {
    mach_vm_deallocate(*MEMORY[0x1E4F14960], *(void *)a1, *(void *)(a1 + 24));
  }
  else {
    free(*(void **)a1);
  }
  pthread_rwlock_destroy((pthread_rwlock_t *)(a1 + 64));

  free((void *)a1);
}

uint64_t vmu_context_for_uniqued_stack(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(a1 + 56) & 2) != 0) {
    return *(void *)a1 + *(unsigned int *)(a1 + 40) * a2 + 16;
  }
  else {
    return 0;
  }
}

uint64_t vmu_enter_stack_in_backtrace_uniquing_table(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = MEMORY[0x1F4188790](a1, a2, a3, a4, a5);
  address[512] = *MEMORY[0x1E4F143B8];
  if (!*(void *)(v5 + 8)) {
    return 0;
  }
  unsigned int v9 = v8;
  uint64_t v10 = v7;
  unint64_t v11 = v6;
  uint64_t v12 = v5;
  uint64_t v37 = 0;
  int v13 = (pthread_rwlock_t *)(v5 + 64);
  pthread_rwlock_wrlock((pthread_rwlock_t *)(v5 + 64));
  int v14 = _enter_frames_in_table_while_locked(v12, &v37, v10, v9);
  pthread_rwlock_unlock(v13);
  if (v14)
  {
    uint64_t result = 1;
  }
  else
  {
    uint64_t v35 = v10;
    unsigned int v36 = v9;
    while (1)
    {
      uint64_t v16 = 4 * *(void *)(v12 + 8);
      int v17 = *(_DWORD *)(v12 + 44);
      pthread_rwlock_wrlock(v13);
      uint64_t v18 = *(void *)(v12 + 16);
      mach_vm_size_t v19 = *MEMORY[0x1E4F14B00] * v16;
      unint64_t v20 = v19 / *(unsigned int *)(v12 + 40);
      unint64_t v21 = v20 & 0xFFFFFFFFFFFFFFFELL;
      if (HIDWORD(v20))
      {
        fprintf((FILE *)*MEMORY[0x1E4F143C8], "can't expand backtrace uniquing table from %llu nodes to %llu nodes (exceeds maximum %u)\n", v18, v21, -1);
        goto LABEL_34;
      }
      uint64_t v22 = v13;
      mach_vm_address_t v23 = *(void *)v12;
      mach_vm_size_t v24 = *(void *)(v12 + 24);
      address[0] = 0;
      if (mach_vm_allocate(*MEMORY[0x1E4F14960], address, v19, 167772161)) {
        vmu_create_backtrace_uniquing_table_cold_2();
      }
      mach_vm_address_t v25 = address[0];
      if (!address[0]) {
        break;
      }
      *(void *)uint64_t v12 = address[0];
      *(void *)(v12 + _Block_object_dispose(&STACK[0x230], 8) = v16;
      *(void *)(v12 + 16) = v21;
      *(void *)(v12 + 24) = v19;
      *(void *)(v12 + 32) = v18;
      *(_DWORD *)(v12 + 44) = v17 + 3;
      int v26 = *(_DWORD *)(v12 + 56);
      if (v26)
      {
        *(void *)(v12 + 4_Block_object_dispose(&STACK[0x230], 8) = 0;
      }
      else if ((v26 & 4) != 0)
      {
        if (mach_vm_copy(*MEMORY[0x1E4F14960], v23, v24, v25)) {
          printf("(VMUBacktraceUniquing) expandUniquingTable(): VMCopyFailed");
        }
      }
      else if ((v26 & 2) != 0)
      {
        *(void *)(v12 + 4_Block_object_dispose(&STACK[0x230], 8) = 0;
        if (v18)
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            uint64_t v28 = *(unsigned int *)(v12 + 40);
            mach_vm_address_t v29 = v23 + i * v28;
            uint64_t v30 = *(void *)(v29 + 16);
            if (v30)
            {
              int v31 = *(_DWORD *)(v29 + 8);
              if (v31 == -1)
              {
                int v33 = 0;
              }
              else
              {
                int v32 = 0;
                do
                {
                  address[v32] = *(void *)v29;
                  int v33 = v32 + 1;
                  mach_vm_address_t v29 = v23 + (v31 * v28);
                  int v31 = *(_DWORD *)(v29 + 8);
                  ++v32;
                }
                while (v31 != -1);
              }
              address[v33] = *(void *)v29;
              uint64_t v38 = 0;
              if (_enter_frames_in_table_while_locked(v12, &v38, (uint64_t)address, v33 + 1)) {
                *(void *)(*(void *)v12 + v38 * *(unsigned int *)(v12 + 40) + 16) = v30;
              }
              else {
                fwrite("unable to reinsert node when expanding backtrace uniquing table - bad hashing function?\n", 0x58uLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
              }
            }
          }
        }
      }
      if (mach_vm_deallocate(*MEMORY[0x1E4F14960], v23, v24)) {
        printf("(VMUBacktraceUniquing) expandUniquingTable(): mach_vm_deallocate failed. [%p]\n", *(const void **)v12);
      }
      int v13 = v22;
      pthread_rwlock_unlock(v22);
      pthread_rwlock_wrlock(v22);
      int v34 = _enter_frames_in_table_while_locked(v12, &v37, v35, v36);
      pthread_rwlock_unlock(v22);
      if (v34)
      {
        uint64_t result = 1;
        goto LABEL_35;
      }
    }
    fprintf((FILE *)*MEMORY[0x1E4F143C8], "failed to expand uniquing table to %llu bytes\n", v19);
    int v13 = v22;
LABEL_34:
    pthread_rwlock_unlock(v13);
    uint64_t result = 0;
    uint64_t v37 = -1;
  }
LABEL_35:
  *unint64_t v11 = v37;
  return result;
}

uint64_t vmu_remove_stack_from_backtrace_uniquing_table(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xFFFFFFFF) {
    vmu_remove_stack_from_backtrace_uniquing_table_cold_1();
  }
  unint64_t v4 = (pthread_rwlock_t *)(a1 + 64);
  pthread_rwlock_wrlock((pthread_rwlock_t *)(a1 + 64));
  int v5 = *(_DWORD *)(a1 + 52);
  int v6 = a2;
  while (1)
  {
    size_t v7 = *(unsigned int *)(a1 + 40);
    unsigned int v8 = (_DWORD *)(*(void *)a1 + (v7 * v6));
    int v10 = v8[2];
    int v9 = v8[3];
    if (!*(void *)v8 && v10 == 0) {
      break;
    }
    if (v9 != -1)
    {
      int v12 = v9 - 1;
      v8[3] = v12;
      if (!v12)
      {
        bzero(v8, v7);
        --*(_DWORD *)(a1 + 48);
        if (v6 == a2) {
          --*(_DWORD *)(a1 + 52);
        }
      }
    }
    int v6 = v10;
    if (v10 == -1) {
      goto LABEL_14;
    }
  }
  if (v9) {
    vmu_remove_stack_from_backtrace_uniquing_table_cold_3();
  }
LABEL_14:
  if ((v5 - *(_DWORD *)(a1 + 52)) >= 2) {
    vmu_remove_stack_from_backtrace_uniquing_table_cold_2();
  }

  return pthread_rwlock_unlock(v4);
}

uint64_t vmu_stack_frames_for_uniqued_stack(uint64_t a1, unint64_t a2, uint64_t a3, int a4)
{
  if (a2 >= 0xFFFFFFFF) {
    vmu_stack_frames_for_uniqued_stack_cold_1();
  }
  int v6 = a2;
  unsigned int v8 = (pthread_rwlock_t *)(a1 + 64);
  pthread_rwlock_rdlock((pthread_rwlock_t *)(a1 + 64));
  if (a4)
  {
    uint64_t v9 = 0;
    int v10 = *(_DWORD *)(a1 + 40);
    int v11 = v6;
    while (1)
    {
      if (*(void *)(a1 + 24) <= (unint64_t)(v10 + v10 * v11))
      {
        fprintf((FILE *)*MEMORY[0x1E4F143C8], "(VMUBacktraceUniquing): Invalid parent node %#x\n");
        goto LABEL_15;
      }
      int v12 = (uint64_t *)(*(void *)a1 + (v10 * v11));
      uint64_t v13 = *v12;
      int v11 = *((_DWORD *)v12 + 2);
      if (!v13 && v11 == 0) {
        break;
      }
      *(void *)(a3 + 8 * v9) = v13;
      int v15 = v9++;
      if (a4 - 1 == v15 || v11 == -1) {
        goto LABEL_15;
      }
    }
    fprintf((FILE *)*MEMORY[0x1E4F143C8], "(VMUBacktraceUniquing): Invalid PC 0x%llx at frame %u for stackID %llu\n");
  }
  else
  {
    uint64_t v9 = 0;
  }
LABEL_15:
  pthread_rwlock_unlock(v8);
  return v9;
}

void *vmu_enumerate_backtrace_uniquing_table(void *result, uint64_t a2)
{
  unint64_t v2 = result[2];
  if (v2)
  {
    unint64_t v4 = result;
    unint64_t v5 = 0;
    uint64_t v6 = *result;
    do
    {
      uint64_t v7 = v6 + v5 * *((unsigned int *)v4 + 10);
      if (*(void *)v7 || *(_DWORD *)(v7 + 8))
      {
        uint64_t result = (void *)(*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
        unint64_t v2 = v4[2];
      }
      ++v5;
    }
    while (v5 < v2);
  }
  return result;
}

uint64_t vmu_print_backtrace_uniquing_table(uint64_t result)
{
  unint64_t v1 = *(void *)(result + 16);
  if (v1)
  {
    uint64_t v2 = result;
    unint64_t v3 = 0;
    uint64_t v4 = *(void *)result;
    int v5 = *(_DWORD *)(result + 56);
    uint64_t v6 = (FILE **)MEMORY[0x1E4F143C8];
    do
    {
      uint64_t v7 = v4 + v3 * *(unsigned int *)(v2 + 40);
      int v8 = *(_DWORD *)(v7 + 8);
      if (*(void *)v7) {
        BOOL v9 = 0;
      }
      else {
        BOOL v9 = v8 == 0;
      }
      if (!v9)
      {
        fprintf(*v6, "%8llu  address %#llx  parent %u", v3, *(void *)v7, v8);
        if ((v5 & 2) != 0) {
          fprintf(*v6, "  context %#llx", *(void *)(v7 + 16));
        }
        uint64_t result = fputc(10, *v6);
        unint64_t v1 = *(void *)(v2 + 16);
      }
      ++v3;
    }
    while (v3 < v1);
  }
  return result;
}

uint64_t _enter_frames_in_table_while_locked(uint64_t a1, void *a2, uint64_t a3, unsigned int a4)
{
  unint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(int *)(a1 + 44);
  unint64_t v7 = (v4 - v5) / ((2 * v6) | 1uLL);
  uint64_t v8 = a4;
  unsigned int v9 = -1;
  while (1)
  {
    unsigned int v10 = v9;
    if ((int)v8 < 1) {
      break;
    }
    if (v6)
    {
      --v8;
      unint64_t v11 = *(void *)(a3 + 8 * v8);
      unsigned int v9 = ((16 * v9) ^ (v11 >> 2)) % (v4 - v5 - 1) + v5;
      int v12 = (v6 - 1) * v7 + 1;
      int v13 = v6;
      while (1)
      {
        uint64_t v14 = *(void *)a1 + *(_DWORD *)(a1 + 40) * v9;
        if (!*(void *)v14 && !*(_DWORD *)(v14 + 8)) {
          break;
        }
        if (*(void *)v14 == v11 && *(_DWORD *)(v14 + 8) == v10)
        {
          int v19 = *(_DWORD *)(v14 + 12);
          uint64_t v18 = (_DWORD *)(v14 + 12);
          int v17 = v19;
          if (v19 == -1) {
            goto LABEL_19;
          }
          goto LABEL_18;
        }
        unint64_t v15 = v9 + v12;
        if (v4 <= v15) {
          int v16 = v5 - v4;
        }
        else {
          int v16 = 0;
        }
        v12 -= v7;
        unsigned int v9 = v15 + v16;
        if (!--v13) {
          return 0;
        }
      }
      *(void *)uint64_t v14 = v11;
      *(_DWORD *)(v14 + _Block_object_dispose(&STACK[0x230], 8) = v10;
      *(_DWORD *)(v14 + 12) = 1;
      ++*(_DWORD *)(a1 + 48);
      if (v8) {
        goto LABEL_19;
      }
      int v17 = *(_DWORD *)(a1 + 52);
      uint64_t v18 = (_DWORD *)(a1 + 52);
LABEL_18:
      *uint64_t v18 = v17 + 1;
LABEL_19:
      if (v13 >= 1) {
        continue;
      }
    }
    return 0;
  }
  *a2 = v9;
  return 1;
}

void VMUGatherOwnedVmObjects_cold_1()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl(&dword_1A7CC9000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "VMUGatherOwnedVmObjects returned buffer should be large enough to describe its own length.\n", v0, 2u);
}

void VMUGatherOwnedVmObjects_cold_2()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl(&dword_1A7CC9000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "VMUGatherOwnedVmObjects returned buffer should be large enough to have the data for all the entries.\n", v0, 2u);
}

void _nextField(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ___removeEntryFromMarkingRegion_block_invoke_cold_1()
{
}

void ___addEntryToMarkingRegion_block_invoke_cold_1()
{
  __assert_rtn("_addEntryToMarkingRegion_block_invoke", "VMUMemoryMarking.m", 95, "entries[entryIndex] == 0");
}

void ownedPhysFootprintAdjustmentForMemgraph_cold_1()
{
  __assert_rtn("ownedPhysFootprintAdjustmentForMemgraph", "VMUVMRegionIdentifier.m", 709, "regions.count == *regionCountInOut");
}

void adjustOwnedMemoryRegionFootprint_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1 - a2;
  _os_log_error_impl(&dword_1A7CC9000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Footprint changed while analyzing – attempting to adjust more owned unmapped physical footprint than is present in the process by %llu bytes", (uint8_t *)&v2, 0xCu);
}

void VMUMallocRangeTypeString_cold_1(int a1)
{
}

void ___markRegionsForMallocZones_block_invoke_4_cold_1()
{
}

void ___markRegionsForMallocZones_block_invoke_4_cold_2()
{
  __assert_rtn("_markRegionsForMallocZones_block_invoke_4", "VMUVMRegionIdentifier.m", 1466, "VMUMaxRange(newVMRangeForZone) == rangeStartInRegion");
}

void ___getRegionMallocStatistics_block_invoke_3_cold_1()
{
}

void __remoteZoneIntrospection_block_invoke_5_cold_1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_1A7CC9000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v1, 0xCu);
}

void vmu_create_backtrace_uniquing_table_cold_1()
{
}

void vmu_create_backtrace_uniquing_table_cold_2()
{
}

void vmu_create_backtrace_uniquing_table_from_archive_cold_1()
{
}

void vmu_remove_stack_from_backtrace_uniquing_table_cold_1()
{
}

void vmu_remove_stack_from_backtrace_uniquing_table_cold_2()
{
  __assert_rtn("vmu_remove_stack_from_backtrace_uniquing_table", "VMUBacktraceUniquing.c", 424, "old_backtraces_contained - uniquing_table->backtraces_contained <= 1");
}

void vmu_remove_stack_from_backtrace_uniquing_table_cold_3()
{
  __assert_rtn("vmu_remove_stack_from_backtrace_uniquing_table", "VMUBacktraceUniquing.c", 408, "node->refcount == 0");
}

void vmu_stack_frames_for_uniqued_stack_cold_1()
{
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

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
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

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1F40D7568](bundle);
}

CFTypeRef CFBundleGetValueForInfoDictionaryKey(CFBundleRef bundle, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1F40D75D0](bundle, key);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1F40D77E8](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x1F40D7A18](theDict, key, value);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

uint64_t CFLog()
{
  return MEMORY[0x1F40D7C50]();
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x1F40D7E08](number);
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8448](alloc, cStr, *(void *)&encoding);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1F40D88A0](allocator, filePath, pathStyle, isDirectory);
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x1F40D89A0](alloc, *(void *)&bytes.byte0, *(void *)&bytes.byte8);
}

uint64_t CSArchitectureGetCurrent()
{
  return MEMORY[0x1F4115598]();
}

uint64_t CSArchitectureIs64Bit()
{
  return MEMORY[0x1F41155C0]();
}

uint64_t CSArchitectureIsArm()
{
  return MEMORY[0x1F41155D0]();
}

uint64_t CSArchitectureIsArm64()
{
  return MEMORY[0x1F41155D8]();
}

uint64_t CSArchitectureIsX86_64()
{
  return MEMORY[0x1F41155E8]();
}

uint64_t CSDemangleSymbolName()
{
  return MEMORY[0x1F4115600]();
}

uint64_t CSIsNull()
{
  return MEMORY[0x1F4115608]();
}

uint64_t CSPlatformForTask()
{
  return MEMORY[0x1F4115618]();
}

uint64_t CSRegionGetName()
{
  return MEMORY[0x1F4115640]();
}

uint64_t CSRegionGetRange()
{
  return MEMORY[0x1F4115650]();
}

uint64_t CSRelease()
{
  return MEMORY[0x1F4115668]();
}

uint64_t CSRetain()
{
  return MEMORY[0x1F4115678]();
}

uint64_t CSSourceInfoGetFilename()
{
  return MEMORY[0x1F4115690]();
}

uint64_t CSSourceInfoGetLineNumber()
{
  return MEMORY[0x1F41156A0]();
}

uint64_t CSSourceInfoGetPath()
{
  return MEMORY[0x1F41156A8]();
}

uint64_t CSSourceInfoGetRange()
{
  return MEMORY[0x1F41156B0]();
}

uint64_t CSSymbolGetMangledName()
{
  return MEMORY[0x1F41156C8]();
}

uint64_t CSSymbolGetName()
{
  return MEMORY[0x1F41156D0]();
}

uint64_t CSSymbolGetRange()
{
  return MEMORY[0x1F41156E0]();
}

uint64_t CSSymbolGetSymbolOwner()
{
  return MEMORY[0x1F41156E8]();
}

uint64_t CSSymbolIsFunction()
{
  return MEMORY[0x1F41156F0]();
}

uint64_t CSSymbolIsUnnamed()
{
  return MEMORY[0x1F41156F8]();
}

uint64_t CSSymbolOwnerCreateSparseDataWithBlock()
{
  return MEMORY[0x1F4115700]();
}

uint64_t CSSymbolOwnerForeachSection()
{
  return MEMORY[0x1F4115718]();
}

uint64_t CSSymbolOwnerForeachSegment()
{
  return MEMORY[0x1F4115728]();
}

uint64_t CSSymbolOwnerForeachSymbol()
{
  return MEMORY[0x1F4115730]();
}

uint64_t CSSymbolOwnerGetArchitecture()
{
  return MEMORY[0x1F4115740]();
}

uint64_t CSSymbolOwnerGetBaseAddress()
{
  return MEMORY[0x1F4115750]();
}

uint64_t CSSymbolOwnerGetCFUUIDBytes()
{
  return MEMORY[0x1F4115760]();
}

uint64_t CSSymbolOwnerGetContentForRange()
{
  return MEMORY[0x1F4115768]();
}

uint64_t CSSymbolOwnerGetName()
{
  return MEMORY[0x1F4115780]();
}

uint64_t CSSymbolOwnerGetPath()
{
  return MEMORY[0x1F4115788]();
}

uint64_t CSSymbolOwnerGetRegionWithName()
{
  return MEMORY[0x1F4115798]();
}

uint64_t CSSymbolOwnerGetSegmentWithAddress()
{
  return MEMORY[0x1F41157A0]();
}

uint64_t CSSymbolOwnerGetSourceInfoWithAddress()
{
  return MEMORY[0x1F41157A8]();
}

uint64_t CSSymbolOwnerGetSymbolCount()
{
  return MEMORY[0x1F41157B0]();
}

uint64_t CSSymbolOwnerGetSymbolWithAddress()
{
  return MEMORY[0x1F41157B8]();
}

uint64_t CSSymbolOwnerGetSymbolWithMangledName()
{
  return MEMORY[0x1F41157C0]();
}

uint64_t CSSymbolOwnerGetSymbolWithName()
{
  return MEMORY[0x1F41157C8]();
}

uint64_t CSSymbolOwnerGetVersion()
{
  return MEMORY[0x1F41157D8]();
}

uint64_t CSSymbolOwnerIsDyldSharedCache()
{
  return MEMORY[0x1F41157F8]();
}

uint64_t CSSymbolOwnerSetPathForSymbolication()
{
  return MEMORY[0x1F4115808]();
}

uint64_t CSSymbolOwnerUsesCPlusPlus()
{
  return MEMORY[0x1F4115810]();
}

uint64_t CSSymbolicatorCreateForTaskSharedCache()
{
  return MEMORY[0x1F4115818]();
}

uint64_t CSSymbolicatorCreateNonFaultingWithSignatureAndGroupKey()
{
  return MEMORY[0x1F4115820]();
}

uint64_t CSSymbolicatorCreateSignature()
{
  return MEMORY[0x1F4115828]();
}

uint64_t CSSymbolicatorCreateWithBinaryImageListCountPidFlagsAndNotification()
{
  return MEMORY[0x1F4115838]();
}

uint64_t CSSymbolicatorCreateWithCoreFilePathAndFlags()
{
  return MEMORY[0x1F4115840]();
}

uint64_t CSSymbolicatorCreateWithMachKernel()
{
  return MEMORY[0x1F4115858]();
}

uint64_t CSSymbolicatorCreateWithPathAndArchitecture()
{
  return MEMORY[0x1F4115868]();
}

uint64_t CSSymbolicatorCreateWithPid()
{
  return MEMORY[0x1F4115880]();
}

uint64_t CSSymbolicatorCreateWithSymbolOwners()
{
  return MEMORY[0x1F4115898]();
}

uint64_t CSSymbolicatorCreateWithTask()
{
  return MEMORY[0x1F41158A0]();
}

uint64_t CSSymbolicatorCreateWithTaskFlagsAndNotification()
{
  return MEMORY[0x1F41158A8]();
}

uint64_t CSSymbolicatorFixupFrames()
{
  return MEMORY[0x1F41158B8]();
}

uint64_t CSSymbolicatorForeachSegmentAtTime()
{
  return MEMORY[0x1F41158C8]();
}

uint64_t CSSymbolicatorForeachSymbolOwnerAtTime()
{
  return MEMORY[0x1F41158D0]();
}

uint64_t CSSymbolicatorForeachSymbolOwnerWithNameAtTime()
{
  return MEMORY[0x1F41158E0]();
}

uint64_t CSSymbolicatorForeachSymbolicatorWithPath()
{
  return MEMORY[0x1F41158F0]();
}

uint64_t CSSymbolicatorGetAOutSymbolOwner()
{
  return MEMORY[0x1F4115910]();
}

uint64_t CSSymbolicatorGetArchitecture()
{
  return MEMORY[0x1F4115918]();
}

uint64_t CSSymbolicatorGetFlagsForNListOnlyData()
{
  return MEMORY[0x1F4115928]();
}

uint64_t CSSymbolicatorGetFlagsForNoSymbolOrSourceInfoData()
{
  return MEMORY[0x1F4115930]();
}

uint64_t CSSymbolicatorGetSectionWithAddressAtTime()
{
  return MEMORY[0x1F4115940]();
}

uint64_t CSSymbolicatorGetSourceInfoWithAddressAtTime()
{
  return MEMORY[0x1F4115950]();
}

uint64_t CSSymbolicatorGetSymbolOwner()
{
  return MEMORY[0x1F4115960]();
}

uint64_t CSSymbolicatorGetSymbolOwnerCountAtTime()
{
  return MEMORY[0x1F4115978]();
}

uint64_t CSSymbolicatorGetSymbolOwnerWithAddressAtTime()
{
  return MEMORY[0x1F4115980]();
}

uint64_t CSSymbolicatorGetSymbolOwnerWithNameAtTime()
{
  return MEMORY[0x1F4115990]();
}

uint64_t CSSymbolicatorGetSymbolWithAddressAtTime()
{
  return MEMORY[0x1F4115998]();
}

uint64_t CSSymbolicatorGetSymbolWithMangledNameFromSymbolOwnerWithNameAtTime()
{
  return MEMORY[0x1F41159A8]();
}

uint64_t CSSymbolicatorGetSymbolWithNameAtTime()
{
  return MEMORY[0x1F41159B0]();
}

uint64_t CSSymbolicatorGetTask()
{
  return MEMORY[0x1F41159B8]();
}

uint64_t CSSymbolicatorGetTaskIsTranslated()
{
  return MEMORY[0x1F41159C0]();
}

uint64_t CSSymbolicatorIsKernelSymbolicator()
{
  return MEMORY[0x1F41159C8]();
}

uint64_t CSTaskHasStarted()
{
  return MEMORY[0x1F41159D0]();
}

uint64_t CSTaskIs64Bit()
{
  return MEMORY[0x1F41159D8]();
}

uint64_t CSTaskIsTranslated()
{
  return MEMORY[0x1F41159E0]();
}

uint64_t CSUUIDCFUUIDBytesToString()
{
  return MEMORY[0x1F41159E8]();
}

uint64_t CSUUIDStringToCFUUIDBytes()
{
  return MEMORY[0x1F41159F0]();
}

NSArray *__cdecl NSAllMapTableKeys(NSMapTable *table)
{
  return (NSArray *)MEMORY[0x1F40E6FD8](table);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

void NSEndMapTableEnumeration(NSMapEnumerator *enumerator)
{
}

NSMapEnumerator *__cdecl NSEnumerateMapTable(NSMapEnumerator *__return_ptr retstr, NSMapTable *table)
{
  return (NSMapEnumerator *)MEMORY[0x1F40E70B0](retstr, table);
}

void *__cdecl NSHashGet(NSHashTable *table, const void *pointer)
{
  return (void *)MEMORY[0x1F40E70E8](table, pointer);
}

void NSHashInsert(NSHashTable *table, const void *pointer)
{
}

void NSLog(NSString *format, ...)
{
}

void *__cdecl NSMapGet(NSMapTable *table, const void *key)
{
  return (void *)MEMORY[0x1F40E7180](table, key);
}

void NSMapInsert(NSMapTable *table, const void *key, const void *value)
{
}

void NSMapInsertKnownAbsent(NSMapTable *table, const void *key, const void *value)
{
}

void NSMapRemove(NSMapTable *table, const void *key)
{
}

BOOL NSNextMapEnumeratorPair(NSMapEnumerator *enumerator, void **key, void **value)
{
  return MEMORY[0x1F40E71B0](enumerator, key, value);
}

void NSResetMapTable(NSMapTable *table)
{
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

uint64_t OSKextCopyLoadedKextInfo()
{
  return MEMORY[0x1F40E9290]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFBundleCreateWithExecutableURLIfLooksLikeBundle()
{
  return MEMORY[0x1F40D8C38]();
}

uint64_t _CFCopyServerVersionDictionary()
{
  return MEMORY[0x1F40D8D00]();
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x1F40D8D10]();
}

uint64_t _CFStringGetLength2()
{
  return MEMORY[0x1F40D9168]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1F417E530](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1F417E588](__n);
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

uint64_t __CFGenericTypeID()
{
  return MEMORY[0x1F40D9570]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1F40C9C18](*(void *)&a1, a2);
}

uint64_t __strcpy_chk()
{
  return MEMORY[0x1F40C9CC8]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1F40C9CD8]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1F40CA210](a1, *(void *)&a2);
}

int atoi(const char *a1)
{
  return MEMORY[0x1F40CA4A8](a1);
}

void *__cdecl bsearch_b(const void *__key, const void *__base, size_t __nel, size_t __width, void *__compar)
{
  return (void *)MEMORY[0x1F40CA578](__key, __base, __nel, __width, __compar);
}

void bzero(void *a1, size_t a2)
{
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1F40CB3A0](a1, a2);
}

size_t class_getInstanceSize(Class cls)
{
  return MEMORY[0x1F4181530](cls);
}

Ivar class_getInstanceVariable(Class cls, const char *name)
{
  return (Ivar)MEMORY[0x1F4181538](cls, name);
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x1F4181548](cls);
}

void clearerr(FILE *a1)
{
}

int closedir(DIR *a1)
{
  return MEMORY[0x1F40CB400](a1);
}

compression_status compression_stream_destroy(compression_stream *stream)
{
  return MEMORY[0x1F417F0C0](stream);
}

compression_status compression_stream_init(compression_stream *stream, compression_stream_operation operation, compression_algorithm algorithm)
{
  return MEMORY[0x1F417F0D0](stream, *(void *)&operation, *(void *)&algorithm);
}

compression_status compression_stream_process(compression_stream *stream, int flags)
{
  return MEMORY[0x1F417F0E0](stream, *(void *)&flags);
}

uint64_t create_mapped_memory_cache_for_core_file_with_label()
{
  return MEMORY[0x1F4115A00]();
}

uint64_t create_sampling_context_for_task_pid_symbolicator()
{
  return MEMORY[0x1F4115A10]();
}

uint64_t csops()
{
  return MEMORY[0x1F40CB8C8]();
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x1F4182BD0](strm, *(void *)&flush);
}

uLong deflateBound(z_streamp strm, uLong sourceLen)
{
  return MEMORY[0x1F4182BD8](strm, sourceLen);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x1F4182BE0](strm);
}

int deflateInit2_(z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  return MEMORY[0x1F4182BE8](strm, *(void *)&level, *(void *)&method, *(void *)&windowBits, *(void *)&memLevel, *(void *)&strategy, version, *(void *)&stream_size);
}

uint64_t destroy_sampling_context()
{
  return MEMORY[0x1F4115A20]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x1F40CBBD8](queue);
}

dispatch_qos_class_t dispatch_queue_get_qos_class(dispatch_queue_t queue, int *relative_priority_ptr)
{
  return MEMORY[0x1F40CBBE0](queue, relative_priority_ptr);
}

uint64_t dispatch_queue_name_for_serial_number()
{
  return MEMORY[0x1F4115A28]();
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
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
  return MEMORY[0x1F40CBD30](when, delta);
}

int dlclose(void *__handle)
{
  return MEMORY[0x1F40CBDA8](__handle);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

uint64_t dyld_is_simulator_platform()
{
  return MEMORY[0x1F40CBE78]();
}

uint64_t dyld_process_create_for_task()
{
  return MEMORY[0x1F40CBE88]();
}

uint64_t dyld_process_dispose()
{
  return MEMORY[0x1F40CBE90]();
}

uint64_t dyld_process_is_restricted()
{
  return MEMORY[0x1F40CBE98]();
}

uint64_t dyld_process_snapshot_create_for_process()
{
  return MEMORY[0x1F40CBEA0]();
}

uint64_t dyld_process_snapshot_dispose()
{
  return MEMORY[0x1F40CBEA8]();
}

uint64_t dyld_process_snapshot_get_shared_cache()
{
  return MEMORY[0x1F40CBEB8]();
}

uint64_t dyld_shared_cache_get_base_address()
{
  return MEMORY[0x1F40CBEF0]();
}

uint64_t dyld_shared_cache_get_mapped_size()
{
  return MEMORY[0x1F40CBEF8]();
}

uint64_t dyld_shared_cache_is_mapped_private()
{
  return MEMORY[0x1F40CBF00]();
}

uint64_t enumerate_mapped_memory_cache()
{
  return MEMORY[0x1F4115A30]();
}

uint64_t enumerate_mapped_memory_core_file_dumped_regions()
{
  return MEMORY[0x1F4115A38]();
}

void exit(int a1)
{
}

int fclose(FILE *a1)
{
  return MEMORY[0x1F40CC050](a1);
}

FILE *__cdecl fdopen(int a1, const char *a2)
{
  return (FILE *)MEMORY[0x1F40CC070](*(void *)&a1, a2);
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

char *__cdecl fgetln(FILE *a1, size_t *a2)
{
  return (char *)MEMORY[0x1F40CC0F0](a1, a2);
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return (char *)MEMORY[0x1F40CC100](a1, *(void *)&a2, a3);
}

tree *__cdecl find_node(const char *a1, tree *a2)
{
  return (tree *)MEMORY[0x1F4115A40](a1, a2);
}

int flsll(uint64_t a1)
{
  return MEMORY[0x1F40CC188](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1F40CC1C0](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x1F40CC1E8](*(void *)&a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x1F40CC1F0](a1, a2);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC338](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1F40CC3B0](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1F40CC3B8]();
}

int getopt_long_only(int a1, char *const *a2, const char *a3, const option *a4, int *a5)
{
  return MEMORY[0x1F40CC478](*(void *)&a1, a2, a3, a4, a5);
}

pid_t getpgid(pid_t a1)
{
  return MEMORY[0x1F40CC490](*(void *)&a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1F40CC4C0]();
}

uint8_t *__cdecl getsectiondata(const mach_header_64 *mhp, const char *segname, const char *sectname, unint64_t *size)
{
  return (uint8_t *)MEMORY[0x1F40CC528](mhp, segname, sectname, size);
}

uint8_t *__cdecl getsegmentdata(const mach_header_64 *mhp, const char *segname, unint64_t *size)
{
  return (uint8_t *)MEMORY[0x1F40CC538](mhp, segname, size);
}

uid_t getuid(void)
{
  return MEMORY[0x1F40CC570]();
}

kern_return_t host_info(host_t host, host_flavor_t flavor, host_info_t host_info_out, mach_msg_type_number_t *host_info_outCnt)
{
  return MEMORY[0x1F40CC608](*(void *)&host, *(void *)&flavor, host_info_out, host_info_outCnt);
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x1F4182CB0](strm, *(void *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x1F4182CB8](strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return MEMORY[0x1F4182CC8](strm, *(void *)&windowBits, version, *(void *)&stream_size);
}

int isatty(int a1)
{
  return MEMORY[0x1F40CC6B0](*(void *)&a1);
}

const char *__cdecl ivar_getName(Ivar v)
{
  return (const char *)MEMORY[0x1F41815B8](v);
}

ptrdiff_t ivar_getOffset(Ivar v)
{
  return MEMORY[0x1F41815C0](v);
}

const char *__cdecl ivar_getTypeEncoding(Ivar v)
{
  return (const char *)MEMORY[0x1F41815C8](v);
}

int kill(pid_t a1, int a2)
{
  return MEMORY[0x1F40CC728](*(void *)&a1, *(void *)&a2);
}

uint64_t ledger()
{
  return MEMORY[0x1F40CC818]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

uint64_t mach_continuous_approximate_time(void)
{
  return MEMORY[0x1F40CC928]();
}

void mach_error(const char *str, mach_error_t error_value)
{
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1F40CC940](*(void *)&error_value);
}

uint64_t mach_get_times()
{
  return MEMORY[0x1F40CC948]();
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x1F40CC950]();
}

kern_return_t mach_memory_info(mach_port_t host, mach_zone_name_array_t *names, mach_msg_type_number_t *namesCnt, mach_zone_info_array_t *info, mach_msg_type_number_t *infoCnt, mach_memory_info_array_t *memory_info, mach_msg_type_number_t *memory_infoCnt)
{
  return MEMORY[0x1F40CC968](*(void *)&host, names, namesCnt, info, infoCnt, memory_info, memory_infoCnt);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1F40CC9B8](*(void *)&task, *(void *)&name);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x1F40CCA10](*(void *)&task, *(void *)&name, *(void *)&right, *(void *)&delta);
}

BOOLean_t mach_task_is_self(task_name_t task)
{
  return MEMORY[0x1F40CCA50](*(void *)&task);
}

mach_port_t mach_thread_self(void)
{
  return MEMORY[0x1F40CCA58]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

kern_return_t mach_vm_allocate(vm_map_t target, mach_vm_address_t *address, mach_vm_size_t size, int flags)
{
  return MEMORY[0x1F40CCA68](*(void *)&target, address, size, *(void *)&flags);
}

kern_return_t mach_vm_copy(vm_map_t target_task, mach_vm_address_t source_address, mach_vm_size_t size, mach_vm_address_t dest_address)
{
  return MEMORY[0x1F40CCA70](*(void *)&target_task, source_address, size, dest_address);
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return MEMORY[0x1F40CCA78](*(void *)&target, address, size);
}

kern_return_t mach_vm_page_range_query(vm_map_read_t target_map, mach_vm_offset_t address, mach_vm_size_t size, mach_vm_address_t dispositions, mach_vm_size_t *dispositions_count)
{
  return MEMORY[0x1F40CCA88](*(void *)&target_map, address, size, dispositions, dispositions_count);
}

kern_return_t mach_vm_purgable_control(vm_map_t target_task, mach_vm_address_t address, vm_purgable_t control, int *state)
{
  return MEMORY[0x1F40CCA98](*(void *)&target_task, address, *(void *)&control, state);
}

kern_return_t mach_vm_region_recurse(vm_map_read_t target_task, mach_vm_address_t *address, mach_vm_size_t *size, natural_t *nesting_depth, vm_region_recurse_info_t info, mach_msg_type_number_t *infoCnt)
{
  return MEMORY[0x1F40CCAB0](*(void *)&target_task, address, size, nesting_depth, info, infoCnt);
}

kern_return_t mach_wait_until(uint64_t deadline)
{
  return MEMORY[0x1F40CCAD0](deadline);
}

const char *__cdecl macho_arch_name_for_cpu_type(cpu_type_t type, cpu_subtype_t subtype)
{
  return (const char *)MEMORY[0x1F40CCAD8](*(void *)&type, *(void *)&subtype);
}

BOOL macho_cpu_type_for_arch_name(const char *archName, cpu_type_t *type, cpu_subtype_t *subtype)
{
  return MEMORY[0x1F40CCAE8](archName, type, subtype);
}

uint64_t malloc_get_all_zones()
{
  return MEMORY[0x1F40CCB48]();
}

size_t malloc_good_size(size_t size)
{
  return MEMORY[0x1F40CCB58](size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCBA8](ptr, size, type_id);
}

void malloc_zone_unregister(malloc_zone_t *zone)
{
}

uint64_t map_new_node()
{
  return MEMORY[0x1F4115A48]();
}

uint64_t mapped_memory_core_file_get_architecture()
{
  return MEMORY[0x1F4115A58]();
}

uint64_t mapped_memory_core_file_get_dyld_shared_cache_range()
{
  return MEMORY[0x1F4115A70]();
}

uint64_t mapped_memory_core_file_get_parent_proc_name()
{
  return MEMORY[0x1F4115B30]();
}

uint64_t mapped_memory_core_file_get_parent_proc_path()
{
  return MEMORY[0x1F4115B38]();
}

uint64_t mapped_memory_core_file_get_proc_name()
{
  return MEMORY[0x1F4115B60]();
}

uint64_t mapped_memory_core_file_get_proc_path()
{
  return MEMORY[0x1F4115B68]();
}

uint64_t mapped_memory_core_file_has_info_for_memory_analysis()
{
  return MEMORY[0x1F4115B90]();
}

uint64_t mapped_memory_core_file_is_exclave()
{
  return MEMORY[0x1F4115B98]();
}

uint64_t mapped_memory_core_file_is_exclavecore()
{
  return MEMORY[0x1F4115BA0]();
}

uint64_t mapped_memory_is_64_bit()
{
  return MEMORY[0x1F4115BD0]();
}

uint64_t mapped_memory_resume_target()
{
  return MEMORY[0x1F4115BE0]();
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCD8](__s, *(void *)&__c, __n);
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

void memset_pattern4(void *__b, const void *__pattern4, size_t __len)
{
}

int mergesort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  return MEMORY[0x1F40CCD48](__base, __nel, __width, __compar);
}

int mergesort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
  return MEMORY[0x1F40CCD50](__base, __nel, __width, __compar);
}

int mkstemps(char *a1, int a2)
{
  return MEMORY[0x1F40CCE18](a1, *(void *)&a2);
}

uint64_t msl_coldest_frame_is_threadid()
{
  return MEMORY[0x1F412C518]();
}

uint64_t msl_disk_stack_logs_enumerate_from_buffer()
{
  return MEMORY[0x1F412C528]();
}

uint64_t msl_disk_stack_logs_enumerate_from_task_with_block()
{
  return MEMORY[0x1F412C530]();
}

uint64_t msl_get_frames_for_address()
{
  return MEMORY[0x1F412C538]();
}

uint64_t msl_payload_create_from_index()
{
  return MEMORY[0x1F412C540]();
}

uint64_t msl_payload_from_lite_zone_ptr()
{
  return MEMORY[0x1F412C550]();
}

uint64_t msl_payload_get_allocation_timestamp()
{
  return MEMORY[0x1F412C558]();
}

uint64_t msl_payload_get_invalid()
{
  return MEMORY[0x1F412C560]();
}

uint64_t msl_payload_get_uniquing_table_index()
{
  return MEMORY[0x1F412C568]();
}

uint64_t msl_payload_is_invalid()
{
  return MEMORY[0x1F412C570]();
}

uint64_t msl_payload_version_from_task()
{
  return MEMORY[0x1F412C578]();
}

uint64_t msl_start_reading()
{
  return MEMORY[0x1F412C580]();
}

uint64_t msl_stop_reading()
{
  return MEMORY[0x1F412C588]();
}

uint64_t msl_uniquing_table_copy_from_serialized()
{
  return MEMORY[0x1F412C598]();
}

uint64_t msl_uniquing_table_copy_from_task()
{
  return MEMORY[0x1F412C5A0]();
}

uint64_t msl_uniquing_table_enumerate()
{
  return MEMORY[0x1F412C5A8]();
}

uint64_t msl_uniquing_table_get_frames_from_table()
{
  return MEMORY[0x1F412C5B0]();
}

uint64_t msl_uniquing_table_get_frames_from_task()
{
  return MEMORY[0x1F412C5B8]();
}

uint64_t msl_uniquing_table_release()
{
  return MEMORY[0x1F412C5C0]();
}

uint64_t msl_uniquing_table_serialize()
{
  return MEMORY[0x1F412C5C8]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

[a1 a2, ...];
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

[super a2];
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
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

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x1F4181A58](a1);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1F40CD120](a1);
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

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1F40CD558](log);
}

uint64_t os_transaction_copy_description()
{
  return MEMORY[0x1F40CD598]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1F40CD648]();
}

void perror(const char *a1)
{
}

kern_return_t pid_for_task(mach_port_name_t t, int *x)
{
  return MEMORY[0x1F40CD750](*(void *)&t, x);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1F40CD838](a1);
}

int proc_get_dirty(pid_t pid, uint32_t *flags)
{
  return MEMORY[0x1F40CD860](*(void *)&pid, flags);
}

uint64_t proc_list_uptrs()
{
  return MEMORY[0x1F40CD868]();
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1F40CD888](*(void *)&pid, buffer, *(void *)&buffersize);
}

int proc_pid_rusage(int pid, int flavor, rusage_info_t *buffer)
{
  return MEMORY[0x1F40CD890](*(void *)&pid, *(void *)&flavor, buffer);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x1F40CD8A8](*(void *)&pid, *(void *)&flavor, arg, buffer, *(void *)&buffersize);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1F40CD8B8](*(void *)&pid, buffer, *(void *)&buffersize);
}

int proc_regionfilename(int pid, uint64_t address, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1F40CD8C8](*(void *)&pid, address, buffer, *(void *)&buffersize);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x1F40CD9B8](a1, a2, a3, a4);
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x1F40CDA38](a1, a2);
}

int pthread_rwlock_destroy(pthread_rwlock_t *a1)
{
  return MEMORY[0x1F40CDAE8](a1);
}

int pthread_rwlock_init(pthread_rwlock_t *a1, const pthread_rwlockattr_t *a2)
{
  return MEMORY[0x1F40CDAF0](a1, a2);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1F40CDAF8](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1F40CDB10](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1F40CDB18](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1F40CDB30]();
}

int putchar(int a1)
{
  return MEMORY[0x1F40CDBA8](*(void *)&a1);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1F40CDC60](a1);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1F40CDC88](__ptr, __size);
}

int regcomp(regex_t *a1, const char *a2, int a3)
{
  return MEMORY[0x1F40CDCD8](a1, a2, *(void *)&a3);
}

size_t regerror(int a1, const regex_t *a2, char *a3, size_t a4)
{
  return MEMORY[0x1F40CDCE0](*(void *)&a1, a2, a3, a4);
}

int regexec(const regex_t *a1, const char *a2, size_t a3, regmatch_t __pmatch[], int a5)
{
  return MEMORY[0x1F40CDCE8](a1, a2, a3, __pmatch, *(void *)&a5);
}

void regfree(regex_t *a1)
{
}

uint64_t release_core_file_mapped_memory_cache()
{
  return MEMORY[0x1F4115C00]();
}

uint64_t sample_remote_thread_with_dispatch_queue_regular_and_swift_async()
{
  return MEMORY[0x1F4115C08]();
}

uint64_t sampling_context_clear_cache()
{
  return MEMORY[0x1F4115C10]();
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1F4181B28](sel);
}

uint64_t set_mapped_memory_cache_region_info_block()
{
  return MEMORY[0x1F4115C18]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CE0D0](a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CE110](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1F40CE150](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

size_t strcspn(const char *__s, const char *__charset)
{
  return MEMORY[0x1F40CE170](__s, __charset);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1F40CE1B0](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CE1F0](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1F40CE1F8](__dst, __src, __n);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x1F40CE200](__s1, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1F40CE208](__s1, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1F40CE230](__s, *(void *)&__c);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1F40CE258](__s1, __s2);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2A0](__str, __endptr, *(void *)&__base);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2C0](__str, __endptr, *(void *)&__base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1F40CE3C0](a1, *(void *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
}

int sysctlnametomib(const char *a1, int *a2, size_t *a3)
{
  return MEMORY[0x1F40CE3E0](a1, a2, a3);
}

uint64_t task_get_mapped_memory_cache_with_label()
{
  return MEMORY[0x1F4115C20]();
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1F40CE470](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}

uint64_t task_lookup_mapped_memory_cache()
{
  return MEMORY[0x1F4115C28]();
}

kern_return_t task_map_corpse_info_64(task_t task, task_read_t corspe_task, mach_vm_address_t *kcd_addr_begin, mach_vm_size_t *kcd_size)
{
  return MEMORY[0x1F40CE478](*(void *)&task, *(void *)&corspe_task, kcd_addr_begin, kcd_size);
}

uint64_t task_read_for_pid()
{
  return MEMORY[0x1F40CE490]();
}

uint64_t task_release_mapped_memory_cache()
{
  return MEMORY[0x1F4115C30]();
}

kern_return_t task_resume2(task_suspension_token_t suspend_token)
{
  return MEMORY[0x1F40CE4B8](*(void *)&suspend_token);
}

kern_return_t task_suspend2(task_read_t target_task, task_suspension_token_t *suspend_token)
{
  return MEMORY[0x1F40CE4D0](*(void *)&target_task, suspend_token);
}

kern_return_t task_threads(task_inspect_t target_task, thread_act_array_t *act_list, mach_msg_type_number_t *act_listCnt)
{
  return MEMORY[0x1F40CE4D8](*(void *)&target_task, act_list, act_listCnt);
}

kern_return_t thread_get_state(thread_read_t target_act, thread_state_flavor_t flavor, thread_state_t old_state, mach_msg_type_number_t *old_stateCnt)
{
  return MEMORY[0x1F40CE528](*(void *)&target_act, *(void *)&flavor, old_state, old_stateCnt);
}

kern_return_t thread_info(thread_inspect_t target_act, thread_flavor_t flavor, thread_info_t thread_info_out, mach_msg_type_number_t *thread_info_outCnt)
{
  return MEMORY[0x1F40CE530](*(void *)&target_act, *(void *)&flavor, thread_info_out, thread_info_outCnt);
}

uint64_t thread_name_for_thread_port()
{
  return MEMORY[0x1F4115C38]();
}

kern_return_t thread_policy_set(thread_act_t thread, thread_policy_flavor_t flavor, thread_policy_t policy_info, mach_msg_type_number_t policy_infoCnt)
{
  return MEMORY[0x1F40CE540](*(void *)&thread, *(void *)&flavor, policy_info, *(void *)&policy_infoCnt);
}

kern_return_t thread_resume(thread_read_t target_act)
{
  return MEMORY[0x1F40CE548](*(void *)&target_act);
}

kern_return_t thread_suspend(thread_read_t target_act)
{
  return MEMORY[0x1F40CE578](*(void *)&target_act);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x1F40CE680](a1, a2, a3);
}

int vfprintf(FILE *a1, const char *a2, va_list a3)
{
  return MEMORY[0x1F40CE690](a1, a2, a3);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x1F40CE6A8](*(void *)&target_task, address, size, *(void *)&flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1F40CE6C0](*(void *)&target_task, address, size);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x1F40CEC20](connection);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x1F40CEEE0](xdict);
}

uint64_t xpc_inspect_copy_description()
{
  return MEMORY[0x1F40CF170]();
}