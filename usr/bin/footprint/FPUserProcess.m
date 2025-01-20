@interface FPUserProcess
+ (unsigned)_dirtyFlagsFromEntryState:(unsigned int)a3;
- (BOOL)_configurePageSize;
- (BOOL)_isAlive;
- (BOOL)_populateMemoryRegionWithPageQueries:(id)a3 regionInfo:(vm_region_submap_info_64 *)a4;
- (BOOL)_populateTask;
- (FPUserProcess)initWithBsdInfo:(proc_bsdinfo *)a3;
- (id)_gatherOwnedVmObjects;
- (id)auxData;
- (id)extendedInfoForRegionType:(int)a3 at:(unint64_t)a4 extendedInfoProvider:(id)a5;
- (unint64_t)physFootprint;
- (unsigned)task;
- (void)_addSubrangesForRegion:(id)a3 purgeState:(int)a4;
- (void)_gatherImageData;
- (void)_gatherLedgers;
- (void)_gatherPhysFootprint;
- (void)_gatherProcessState;
- (void)_gatherSharedCacheFromDyldSnapshot:(dyld_process_snapshot_s *)a3;
- (void)_setIdleExitStatusFromDirtyFlags:(unsigned int)a3;
- (void)_setPriority:(int)a3;
- (void)addLedgerData:(unint64_t *)a3 count:(unint64_t)a4;
- (void)dealloc;
- (void)enumerateRegions:(id)a3;
- (void)gatherData:(unint64_t)a3 extendedInfoProvider:(id)a4;
@end

@implementation FPUserProcess

- (FPUserProcess)initWithBsdInfo:(proc_bsdinfo *)a3
{
  self->super._pid = a3->pbi_pid;
  [(FPUserProcess *)self _gatherIsTranslated];
  v9.receiver = self;
  v9.super_class = (Class)FPUserProcess;
  v5 = [(FPProcess *)&v9 initWithBsdInfo:a3];
  if (v5)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    images = v5->_images;
    v5->_images = v6;

    [(FPUserProcess *)v5 _gatherPhysFootprint];
    [(FPUserProcess *)v5 _gatherLedgers];
    [(FPUserProcess *)v5 _gatherProcessState];
  }
  return v5;
}

- (void)dealloc
{
  mach_port_name_t task = self->_task;
  if (task) {
    mach_port_deallocate(mach_task_self_, task);
  }
  v4.receiver = self;
  v4.super_class = (Class)FPUserProcess;
  [(FPUserProcess *)&v4 dealloc];
}

- (void)gatherData:(unint64_t)a3 extendedInfoProvider:(id)a4
{
  unsigned int v4 = a3;
  id v62 = a4;
  v5 = [(FPProcess *)self memoryRegions];

  if (!v5)
  {
    v6 = self;
    if (![(FPUserProcess *)self _configurePageSize])
    {
      self->_bailedOut = 1;
      v8 = __stderrp;
      images = [(FPProcess *)self displayString];
      fprintf(v8, "%s: skipping due to an error configuring page size for analysis\n", (const char *)[(NSMutableArray *)images UTF8String]);
LABEL_62:

      goto LABEL_63;
    }
    if ([(FPProcess *)self hiddenFromDisplay])
    {
      id v7 = v62;
      if (!self)
      {
LABEL_61:

        images = self->_images;
        self->_images = 0;
        goto LABEL_62;
      }
    }
    else
    {
      [(FPUserProcess *)self _gatherImageData];
      [(FPUserProcess *)self _gatherPhysFootprint];
      v11 = [(FPUserProcess *)self _gatherOwnedVmObjects];
      v6 = self;
      ownedVmObjects = self->_ownedVmObjects;
      self->_ownedVmObjects = v11;

      id v13 = v62;
    }
    int v14 = (v4 >> 1) & 1;
    int v15 = (v4 >> 2) & 1;
    v16 = sub_10000D2B8((id *)[FPImageEnumerator alloc], v6->_images);
    id v17 = objc_alloc_init((Class)NSMutableArray);
    unsigned __int8 v18 = [(FPProcess *)v6 hiddenFromDisplay];
    unsigned int v60 = [(FPProcess *)v6 breakDownPhysFootprint];
    self;
    char v19 = byte_100038A50;
    unsigned int v59 = [(FPUserProcess *)v6 doOwnedAccountingAdjustments];
    uint64_t v93 = 0;
    v94 = &v93;
    uint64_t v95 = 0x2020000000;
    uint64_t v96 = 0;
    uint64_t v87 = 0;
    v88 = &v87;
    uint64_t v89 = 0x3032000000;
    v90 = sub_100009A04;
    v91 = sub_100009A14;
    id v92 = 0;
    sharedCache = v6->super._sharedCache;
    if (sharedCache) {
      long long v21 = *(_OWORD *)&sharedCache->_baseAddress;
    }
    else {
      long long v21 = 0uLL;
    }
    v74[0] = _NSConcreteStackBlock;
    v74[1] = 3221225472;
    v74[2] = sub_100009A1C;
    v74[3] = &unk_1000291A0;
    long long v80 = v21;
    unsigned __int8 v81 = v18;
    v74[4] = self;
    id v63 = v17;
    id v75 = v63;
    char v82 = v60;
    v58 = v16;
    v76 = v58;
    v78 = &v87;
    char v83 = v14;
    char v84 = v15;
    char v85 = v59;
    id v77 = v62;
    v79 = &v93;
    char v86 = v19;
    [(FPUserProcess *)self enumerateRegions:v74];
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    v22 = [(NSMutableDictionary *)self->_ownedVmObjects objectEnumerator];
    id v23 = [v22 countByEnumeratingWithState:&v70 objects:v97 count:16];
    if (!v23)
    {
LABEL_32:

      v38 = self->_ownedVmObjects;
      self->_ownedVmObjects = 0;

      v39 = (void *)v88[5];
      v40 = self;
      if (v39)
      {
        if (v59)
        {
          id v41 = [v39 dirtySize];
          if ((unint64_t)v41 >= v94[3])
          {
            [v88[5] setDirtySize:((char *)[v88[5] dirtySize]) - v94[3]];
          }
          else
          {
            id v42 = [(id)v88[5] dirtySize];
            v94[3] -= (uint64_t)v42;
            [(id)v88[5] setDirtySize:0];
            id v43 = [(id)v88[5] swappedSize];
            v44 = v94;
            v45 = (void *)v88[5];
            if ((unint64_t)v43 >= v94[3])
            {
              v50 = (char *)[(id)v88[5] swappedSize] - v44[3];
            }
            else
            {
              id v46 = [(id)v88[5] swappedSize];
              uint64_t v47 = v94[3] - (void)v46;
              v94[3] = v47;
              warnings = self->super._warnings;
              v49 = +[NSString stringWithFormat:@"Footprint changed while analyzing – unmapped owned physical footprint may be over-counted by %llu bytes", v47];
              [(NSMutableArray *)warnings addObject:v49];

              v50 = 0;
              v45 = (void *)v88[5];
              v40 = self;
            }
            [v45 setSwappedSize:v50];
          }
        }
        id v51 = [(id)v88[5] dirtySize];
        if ((char *)[(id)v88[5] swappedSize] + (void)v51)
        {
          v52 = v88;
          uint64_t v53 = v88[5];
          if (v53)
          {
            *(void *)(v53 + 80) = -1;
            uint64_t v54 = v52[5];
          }
          else
          {
            uint64_t v54 = 0;
          }
          [v63 addObject:v54];
        }
      }
      if (v60 && v40->_ledgers[0])
      {
        v55 = objc_alloc_init(FPMemoryRegion);
        v56 = v55;
        if (v55) {
          v55->_size = v40->_ledgers[0];
        }
        [(FPMemoryRegion *)v55 setDirtySize:v40->_ledgers[0]];
        if (v56) {
          v56->_start = -1;
        }
        [(FPMemoryRegion *)v56 setName:@"page table"];
        if (v56)
        {
          v56->_object_id = -1;
          v56->_share_mode = 2;
        }
        [v63 addObject:v56];

        v40 = self;
      }
      if ((os_variant_has_internal_content() & v60) == 1 && v40->_ledgers[3])
      {
        v57 = objc_alloc_init(FPMemoryRegion);
        [(FPMemoryRegion *)v57 setCleanSize:v40->_ledgers[3]];
        if (v57) {
          v57->_start = -1;
        }
        [(FPMemoryRegion *)v57 setName:@"Conclave"];
        if (v57)
        {
          v57->_object_id = -1;
          v57->_share_mode = 2;
        }
        [v63 addObject:v57];

        v40 = self;
      }
      [(FPProcess *)v40 setMemoryRegions:v63];

      _Block_object_dispose(&v87, 8);
      _Block_object_dispose(&v93, 8);

      goto LABEL_61;
    }
    uint64_t v24 = *(void *)v71;
LABEL_12:
    uint64_t v25 = 0;
    while (1)
    {
      if (*(void *)v71 != v24) {
        objc_enumerationMutation(v22);
      }
      v26 = *(void **)(*((void *)&v70 + 1) + 8 * v25);
      uint64_t v69 = 0;
      long long v67 = 0u;
      long long v68 = 0u;
      long long v66 = 0u;
      [v26 getBytes:&v66 length:56];
      v27 = objc_alloc_init(FPMemoryRegion);
      v28 = v27;
      if (v27)
      {
        v27->_object_id = v66;
        *((unsigned char *)v27 + 8) |= 8u;
        v27->_user_tag = -1;
      }
      v29 = sub_100004B84((uint64_t)FPMemoryRegion, ((unint64_t)v69 >> 1) & 7);
      v30 = sub_1000049C8((uint64_t)FPMemoryRegion, 0xFFFFFFFFLL);
      if (v29)
      {
        id v31 = [objc_alloc((Class)NSString) initWithFormat:@"%@ (%@)", v30, v29];
        [(FPMemoryRegion *)v28 setName:v31];
      }
      else
      {
        [(FPMemoryRegion *)v28 setName:v30];
      }
      if (v28)
      {
        unint64_t v32 = *((void *)&v66 + 1);
        v28->_start = -1;
        v28->_size = v32;
        v28->_share_mode = 4;
      }
      uint64_t v64 = 0;
      int v33 = (v69 >> 4) & 3;
      if (v33 != 3 && v33)
      {
        uint64_t v36 = 0;
        uint64_t v65 = 0;
        uint64_t v35 = *((void *)&v67 + 1);
        uint64_t v34 = v67 - *((void *)&v67 + 1);
        if (v69)
        {
LABEL_27:
          uint64_t v64 = v35 + v36;
          v37 = &v65;
          uint64_t v35 = 0;
          goto LABEL_28;
        }
      }
      else
      {
        uint64_t v34 = v68;
        uint64_t v35 = v67 - v68;
        uint64_t v36 = *((void *)&v68 + 1);
        uint64_t v65 = *((void *)&v68 + 1);
        if (v69) {
          goto LABEL_27;
        }
      }
      v37 = &v64;
LABEL_28:
      uint64_t *v37 = 0;
      [(FPMemoryRegion *)v28 setSwappedSize:v65];
      [(FPMemoryRegion *)v28 setDirtySize:v35];
      [(FPMemoryRegion *)v28 setCleanSize:v64];
      [(FPMemoryRegion *)v28 setReclaimableSize:v34];
      if (v28) {
        *((unsigned char *)v28 + 8) = *((unsigned char *)v28 + 8) & 0xFE | (*((void *)&v67 + 1) != 0);
      }
      [v63 addObject:v28];

      if (v23 == (id)++v25)
      {
        id v23 = [v22 countByEnumeratingWithState:&v70 objects:v97 count:16];
        if (!v23) {
          goto LABEL_32;
        }
        goto LABEL_12;
      }
    }
  }
LABEL_63:
}

- (BOOL)_configurePageSize
{
  return 1;
}

- (id)_gatherOwnedVmObjects
{
  if (![(FPUserProcess *)self doOwnedAccountingAdjustments])
  {
LABEL_17:
    id v5 = 0;
    goto LABEL_18;
  }
  size_t v13 = 0;
  if (sysctlbyname("vm.get_owned_vmobjects", 0, &v13, &self->_task, 4uLL))
  {
    if (*__error() != 2) {
      sub_100008728((id *)&self->super.super.isa, @"vm.get_owned_vmobjects");
    }
    goto LABEL_17;
  }
  size_t v3 = v13;
  if (v13)
  {
    unsigned int v4 = 0;
    size_t v12 = 0;
    do
    {
      v3 += 896;
      unsigned int v4 = (unint64_t *)malloc_type_realloc(v4, v3, 0xD726E4B2uLL);
      size_t v12 = v3;
      if (sysctlbyname("vm.get_owned_vmobjects", v4, &v12, &self->_task, 4uLL))
      {
        sub_100008728((id *)&self->super.super.isa, @"vm.get_owned_vmobjects");
        free(v4);
        goto LABEL_17;
      }
    }
    while (v3 == v12);
    if (v12)
    {
      if (v12 <= 7)
      {
        _os_assert_log();
        _os_crash();
        __break(1u);
      }
      else if (v12 - 8 >= 56 * *v4)
      {
        id v5 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:*v4];
        if (*v4)
        {
          unint64_t v6 = 0;
          id v7 = (uint64_t *)(v4 + 1);
          do
          {
            id v8 = [objc_alloc((Class)NSData) initWithBytes:v7 length:56];
            uint64_t v9 = *v7;
            v7 += 7;
            v10 = +[NSNumber numberWithUnsignedLongLong:v9];
            [v5 setObject:v8 forKeyedSubscript:v10];

            ++v6;
          }
          while (v6 < *v4);
        }
        free(v4);
        goto LABEL_18;
      }
      _os_assert_log();
      id result = (id)_os_crash();
      __break(1u);
      return result;
    }
    free(v4);
  }
  id v5 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:0];
LABEL_18:

  return v5;
}

- (BOOL)_populateMemoryRegionWithPageQueries:(id)a3 regionInfo:(vm_region_submap_info_64 *)a4
{
  id v5 = a3;
  unint64_t v6 = [(FPProcess *)self pageSize];
  unint64_t v7 = v6;
  if (!v5) {
    goto LABEL_29;
  }
  uint64_t v8 = v5[10];
  uint64_t v9 = -(uint64_t)v6;
  mach_vm_offset_t v10 = v8 & -(uint64_t)v6;
  if (v8 == -1)
  {
    uint64_t v12 = (v6 - 2) & v9;
    BOOL v13 = v10 != -1;
    uint64_t v11 = -1;
  }
  else
  {
    uint64_t v11 = v5[11] + v8;
    uint64_t v12 = (v6 + v11 - 1) & v9;
    BOOL v13 = v10 != v8;
  }
  while (1)
  {
    uint64_t v46 = 0;
    uint64_t v47 = &v46;
    uint64_t v48 = 0x2020000000;
    uint64_t v49 = 0;
    uint64_t v42 = 0;
    id v43 = &v42;
    uint64_t v44 = 0x2020000000;
    uint64_t v45 = 0;
    if ([v5 dirtySize])
    {
      _os_assert_log();
      _os_crash();
      __break(1u);
      goto LABEL_28;
    }
    if (![v5 swappedSize]) {
      break;
    }
LABEL_28:
    _os_assert_log();
    _os_crash();
    __break(1u);
LABEL_29:
    BOOL v13 = 0;
    mach_vm_offset_t v10 = 0;
    uint64_t v12 = 0;
    uint64_t v11 = 0;
    uint64_t v9 = -(uint64_t)v7;
  }
  BOOL v30 = v12 != v11;
  BOOL v31 = v13;
  unint64_t cachedDispositionAddress = self->_cachedDispositionAddress;
  mach_vm_offset_t v15 = v10;
  unint64_t v16 = (v12 - v10) / v7;
  BOOL v17 = v10 == cachedDispositionAddress;
  if (v10 == cachedDispositionAddress)
  {
    uint64_t v28 = v11;
    uint64_t v29 = v12;
    int cachedDisposition = self->_cachedDisposition;
    char v19 = v47 + 3;
    v27 = v43;
    v20 = v5;
    if (v5)
    {
      unint64_t v21 = v7 - v20[10] + (v20[10] & v9);
      if (v20[11] < v21) {
        unint64_t v21 = v20[11];
      }
    }
    else
    {
      unint64_t v21 = 0;
    }
    mach_vm_offset_t v15 = v10 + v7;
    --v16;
    if ((cachedDisposition & 8) != 0 || (cachedDisposition & 0x81) == 1)
    {
LABEL_15:
      *v19 += v21;
    }
    else if ((cachedDisposition & 0x10) != 0)
    {
      char v19 = v27 + 3;
      goto LABEL_15;
    }

    uint64_t v11 = v28;
    uint64_t v12 = v29;
    BOOL v17 = v10 == cachedDispositionAddress;
  }
  if (!v5 || (v5[1] & 4) == 0)
  {
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100008B7C;
    v32[3] = &unk_100029150;
    BOOL v39 = v17;
    BOOL v40 = v31;
    BOOL v41 = v30;
    v22 = v5;
    uint64_t v35 = &v46;
    uint64_t v36 = &v42;
    int v33 = v22;
    uint64_t v34 = self;
    unint64_t v37 = v7;
    uint64_t v38 = v12;
    char v23 = sub_100008E5C((uint64_t)self, v15, v16, v32);
    [(FPMemoryRegion *)v22 setSwappedSize:v43[3]];
    [(FPMemoryRegion *)v22 setDirtySize:v47[3]];
    pendingUnusedSharedRegion = v33;
    goto LABEL_25;
  }
  if (v10 == cachedDispositionAddress)
  {
    [v5 setDirtySize:v47[3]];
    [v5 setSwappedSize:v43[3]];
  }
  char v23 = 1;
  if (v12 != v11 && v16)
  {
    uint64_t v25 = v5;
    pendingUnusedSharedRegion = self->_pendingUnusedSharedRegion;
    self->_pendingUnusedSharedRegion = v25;
    char v23 = 1;
LABEL_25:
  }
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);

  return v23;
}

- (void)enumerateRegions:(id)a3
{
  kern_return_t v16;
  mach_vm_address_t v17;
  BOOL v18;
  kern_return_t v19;
  mach_error_t v20;
  BOOL v21;
  int v22;
  id v23;
  __CFString *v24;
  uint64_t v25;
  unint64_t slide;
  id v27;
  mach_vm_size_t v28;
  mach_port_t v29;
  natural_t nesting_depth[2];
  mach_vm_size_t v31;
  mach_vm_address_t v32;
  int v33[4];
  long long v34;
  int v35;
  int v36[21];
  mach_msg_type_number_t v37;
  mach_port_t object_name;
  mach_msg_type_number_t infoCnt;
  mach_vm_size_t size;
  mach_vm_address_t address;
  int info[4];
  long long v43;
  int v44;

  v27 = a3;
  memset(v36, 0, 76);
  uint64_t v35 = 0;
  *(_OWORD *)int v33 = 0u;
  uint64_t v34 = 0u;
  BOOL v31 = 0;
  unint64_t v32 = 0;
  sharedCache = self->super._sharedCache;
  if (sharedCache)
  {
    slide = sharedCache->_slide;
    mach_vm_size_t v5 = sharedCache->_baseAddress - slide;
    [(NSMutableArray *)self->_images firstObject];
  }
  else
  {
LABEL_55:
    slide = 0;
    mach_vm_size_t v5 = 0;
    [(NSMutableArray *)self->_images firstObject];
  unint64_t v6 = };
  if (v6) {
    mach_vm_size_t v7 = v6[3] + v6[2];
  }
  else {
    mach_vm_size_t v7 = 0;
  }
  unint64_t v37 = 0;
  *(void *)nesting_depth = 0;
  uint64_t v29 = 0;

  size = 0;
  uint64_t v44 = 0;
  *(_OWORD *)info = 0u;
  id v43 = 0u;
  object_name = 0;
  unint64_t v8 = [(FPProcess *)self pageSize];
  uint64_t v28 = v5;
  if (v5)
  {
    unint64_t v9 = v8;
    mach_vm_address_t v10 = v7;
    do
    {
      address = (v5 >> 1) + (v7 >> 1);
      infoCnt = 9;
      if (mach_vm_region(self->_task, &address, &size, 9, info, &infoCnt, &object_name)) {
        break;
      }
      if (size + address <= v28)
      {
        mach_vm_size_t v7 = size + address;
        mach_vm_address_t v10 = address;
      }
      else
      {
        if (v7 == address) {
          break;
        }
        mach_vm_size_t v5 = (v5 >> 1) + (v7 >> 1) - v9;
      }
    }
    while (v5 > v7 && v5 - v7 > 0x1000000);
  }
  else
  {
    mach_vm_address_t v10 = 0;
  }
  unsigned __int8 v11 = 0;
  mach_vm_address_t v12 = v28 + slide + v25;
  while (1)
  {
    nesting_depth[1] = -1;
    unint64_t v37 = 9;
    mach_vm_address_t v14 = v32;
    if (v10 - 1 >= v32 || v12 <= v32) {
      goto LABEL_25;
    }
    unint64_t v16 = mach_vm_region(self->_task, &v32, &v31, 9, v33, &v37, &v29);
    if (v16) {
      break;
    }
    BOOL v17 = v32;
    if (v32 < v14)
    {
      unint64_t v32 = v14;
LABEL_25:
      BOOL v17 = v14;
    }
    if (v17 < v10 || (v28 < v31 + v17 ? (unsigned __int8 v18 = v17 >= v12) : (unsigned __int8 v18 = 1), v18))
    {
      unint64_t v37 = 19;
      char v19 = mach_vm_region_recurse(self->_task, &v32, &v31, &nesting_depth[1], v36, &v37);
      v20 = v19;
      if (v37 <= 0x12) {
        *(void *)&v36[17] = v36[14];
      }
      if (v19 == 1 || (v11 & (v36[5] != -1)) != 0) {
        goto LABEL_48;
      }
      if (v19)
      {
        uint64_t v24 = @"mach_vm_region_recurse";
        goto LABEL_52;
      }
      unint64_t v21 = v36[5] == -1;
      if (mach_vm_purgable_control(self->_task, v32, 1, (int *)nesting_depth)) {
        nesting_depth[0] = 3;
      }
      if (v36[12])
      {
        _os_assert_log();
        _os_crash();
        __break(1u);
        goto LABEL_55;
      }
      v11 |= v21;
      if (BYTE2(v36[11])
        && [(FPUserProcess *)self _isAlive]
        && (v22 = proc_regionfilename(self->super._pid, v32, info, 0x400u)) != 0)
      {
        *((unsigned char *)info + v22) = 0;
        char v23 = [objc_alloc((Class)NSString) initWithUTF8String:info];
      }
      else
      {
        char v23 = 0;
      }
    }
    else
    {
      char v23 = 0;
      v36[2] = v33[2];
      *(void *)uint64_t v36 = *(void *)v33;
      *(void *)&v36[3] = *(void *)((char *)&v34 + 4);
      memset(&v36[5], 0, 24);
      v36[11] = 16842752;
      v36[12] = v34;
      v36[13] = HIDWORD(v34);
      v36[14] = 1;
      LOWORD(v36[15]) = v35;
      v36[16] = 0;
      *(void *)&v36[17] = 1;
      nesting_depth[0] = 3;
    }
    if ((*((uint64_t (**)(id, mach_vm_address_t, mach_vm_size_t, int *, void, id, void, void))v27 + 2))(v27, v32, v31, v36, nesting_depth[0], v23, 0, 0))goto LABEL_49; {
    v32 += v31;
    }
  }
  v20 = v16;
  if (v16 == 1)
  {
LABEL_48:
    char v23 = 0;
LABEL_49:

    goto LABEL_53;
  }
  uint64_t v24 = @"mach_vm_region";
LABEL_52:
  sub_10000945C(self, v20, v24);
LABEL_53:
}

- (void)_addSubrangesForRegion:(id)a3 purgeState:(int)a4
{
  unint64_t v6 = a3;
  unint64_t v7 = [(FPProcess *)self pageSize];
  if (v6)
  {
    if ((v6[8] & 8) == 0)
    {
      char v8 = v6[8] & 1;
      uint64_t v9 = *((void *)v6 + 10);
      if (v9 == -1) {
        uint64_t v10 = -1;
      }
      else {
        uint64_t v10 = *((void *)v6 + 11) + v9;
      }
      goto LABEL_6;
    }
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
  uint64_t v10 = 0;
  char v8 = 0;
  uint64_t v9 = 0;
LABEL_6:
  uint64_t v11 = (v7 + v10 - 1) & -(uint64_t)v7;
  mach_vm_offset_t v12 = v9 & -(uint64_t)v7;
  if (a4 == 1) {
    int v13 = 1;
  }
  else {
    int v13 = 2048;
  }
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3010000000;
  v26[3] = &unk_100026CA3;
  unint64_t v14 = (v11 - v12) / v7;
  if (v6) {
    uint64_t v15 = *((void *)v6 + 9);
  }
  else {
    uint64_t v15 = 0;
  }
  v26[4] = v15;
  v26[5] = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v25[3] = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100009804;
  v17[3] = &unk_100029178;
  int v22 = 8;
  int v23 = v13;
  char v19 = v25;
  v20 = v26;
  char v24 = v8;
  unint64_t v16 = v6;
  id v18 = v16;
  unint64_t v21 = v7;
  sub_100008E5C((uint64_t)self, v12, v14, v17);

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(v26, 8);
}

- (BOOL)_populateTask
{
  [(FPProcess *)self pid];
  mach_error_t v2 = task_read_for_pid();
  if (v2) {
    mach_error("task_read_for_pid", v2);
  }
  return v2 == 0;
}

- (void)_setIdleExitStatusFromDirtyFlags:(unsigned int)a3
{
  if ((a3 & 4) != 0) {
    int v3 = 3;
  }
  else {
    int v3 = 2;
  }
  if ((a3 & 1) == 0) {
    int v3 = 1;
  }
  self->super._idleExitStatus = v3;
}

- (void)_setPriority:(int)a3
{
  self->super._priority = a3;
}

- (void)_gatherProcessState
{
  if ([(FPUserProcess *)self _isAlive])
  {
    uint32_t flags = 0;
    pid_t v3 = [(FPProcess *)self pid];
    self;
    *(void *)buf = 0;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    if ((memorystatus_control() & 0x80000000) != 0)
    {
      int dirty = proc_get_dirty(v3, &flags);
      if (os_variant_has_internal_content()
        && dirty
        && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = dirty;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to fetch process info: %d", buf, 8u);
      }
    }
    else
    {
      [(FPUserProcess *)self _setPriority:*(unsigned int *)&buf[4]];
      uint32_t flags = +[FPUserProcess _dirtyFlagsFromEntryState:HIDWORD(v8)];
    }
    [(FPUserProcess *)self _setIdleExitStatusFromDirtyFlags:flags];
  }
}

+ (unsigned)_dirtyFlagsFromEntryState:(unsigned int)a3
{
  if ((a3 & 0x20) != 0) {
    int v3 = 5;
  }
  else {
    int v3 = 1;
  }
  unsigned int v4 = v3 | (a3 >> 3) & 2;
  if ((a3 & 8) != 0) {
    return v4;
  }
  else {
    return 0;
  }
}

- (void)_gatherPhysFootprint
{
  if ([(FPUserProcess *)self _isAlive])
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    long long v6 = 0u;
    long long v7 = 0u;
    long long v5 = 0u;
    memset(v4, 0, sizeof(v4));
    if (!proc_pid_rusage(self->super._pid, 6, (rusage_info_t *)v4))
    {
      unint64_t v3 = v16;
      self->_ledgers[1] = *((void *)&v5 + 1);
      self->_ledgers[2] = v3;
    }
  }
}

- (unint64_t)physFootprint
{
  return self->_ledgers[1];
}

- (void)_gatherLedgers
{
  mach_error_t v2 = self;
  if ([(FPProcess *)self breakDownPhysFootprint] && [(FPUserProcess *)v2 _isAlive])
  {
    if (qword_100038A80 != -1) {
      dispatch_once(&qword_100038A80, &stru_100029EE0);
    }
    uint64_t v5 = qword_100038A78;
    if ((qword_100038A78 & 0x8000000000000000) == 0)
    {
      uint64_t v3 = xmmword_100038A58;
      if ((xmmword_100038A58 & 0x8000000000000000) == 0)
      {
        unsigned int v4 = malloc_type_malloc(48 * qword_100038A78, 0x1000040EED21634uLL);
        [(FPProcess *)v2 pid];
        if ((ledger() & 0x80000000) != 0)
        {
          sub_100008728((id *)&v2->super.super.isa, @"Unable to retrieve ledger entry info");
LABEL_14:
          free(v4);
          return;
        }
        if (v3 >= v5)
        {
          _os_assert_log();
          _os_crash();
          __break(1u);
        }
        else
        {
          mach_error_t v2 = (FPUserProcess *)((char *)v2 + 104);
          v2->super.super.isa = (Class)(*((void *)v4 + 6 * v3) & ~(*((uint64_t *)v4 + 6 * v3) >> 63));
          if (qword_100038A80 == -1) {
            goto LABEL_10;
          }
        }
        dispatch_once(&qword_100038A80, &stru_100029EE0);
LABEL_10:
        if ((qword_100038A78 & 0x8000000000000000) == 0 && qword_100038A70 >= 1) {
          v2->super._sharedCache = (FPSharedCache *)(*((void *)v4 + 6 * qword_100038A70) & ~(*((uint64_t *)v4
        }
                                                                                               + 6 * qword_100038A70) >> 63));
        goto LABEL_14;
      }
    }
  }
}

- (void)_gatherSharedCacheFromDyldSnapshot:(dyld_process_snapshot_s *)a3
{
  sub_100005184();
  unsigned int v4 = (FPSharedCache *)objc_claimAutoreleasedReturnValue();
  sharedCache = self->super._sharedCache;
  self->super._sharedCache = v4;

  _objc_release_x1(v4, sharedCache);
}

- (void)_gatherImageData
{
  mach_error_t v8 = 0;
  if (dyld_process_create_for_task())
  {
    mach_error_t v8 = 0;
    uint64_t v3 = dyld_process_snapshot_create_for_process();
    dyld_process_dispose();
    if (v3)
    {
      [(FPUserProcess *)self _gatherSharedCacheFromDyldSnapshot:v3];
      v6[0] = 0;
      v6[1] = v6;
      v6[2] = 0x2020000000;
      char v7 = 0;
      v4[0] = 0;
      v4[1] = v4;
      v4[2] = 0x3032000000;
      v4[3] = sub_100009A04;
      _OWORD v4[4] = sub_100009A14;
      id v5 = objc_alloc_init((Class)NSMutableSet);
      dyld_process_snapshot_for_each_image();
      dyld_process_snapshot_dispose();
      -[NSMutableArray sortUsingComparator:](self->_images, "sortUsingComparator:", &stru_100029230, _NSConcreteStackBlock, 3221225472, sub_10000AC5C, &unk_1000291F0, self, v4, v6);
      _Block_object_dispose(v4, 8);

      _Block_object_dispose(v6, 8);
    }
  }
  else
  {
    sub_10000945C(self, v8, @"dyld_process_create_for_task");
  }
}

- (BOOL)_isAlive
{
  return 1;
}

- (id)auxData
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  unsigned int v4 = [(FPProcess *)self priority];
  if (os_variant_has_internal_content() && (v4 & 0x80000000) == 0)
  {
    id v5 = [[FPAuxData alloc] initWithValue:v4 shouldAggregate:0];
    [(FPAuxData *)v5 setFormatter:&stru_100029270];
    [v3 setObject:v5 forKeyedSubscript:@"jetsam priority"];
  }
  unsigned int v6 = [(FPProcess *)self idleExitStatus];
  if (os_variant_has_internal_content() && v6)
  {
    char v7 = [[FPAuxData alloc] initWithValue:v6 shouldAggregate:0];
    [(FPAuxData *)v7 setFormatter:&stru_100029290];
    [v3 setObject:v7 forKeyedSubscript:@"dirty"];
  }
  ledgers = self->_ledgers;
  if (self->_ledgers[1])
  {
    long long v9 = [[FPAuxData alloc] initWithValue:self->_ledgers[1] shouldAggregate:0];
    [v3 setObject:v9 forKeyedSubscript:@"phys_footprint"];

    long long v10 = [[FPAuxData alloc] initWithValue:ledgers[2] shouldAggregate:0];
    [v3 setObject:v10 forKeyedSubscript:@"phys_footprint_peak"];
  }
  if ([v3 count]) {
    id v11 = v3;
  }
  else {
    id v11 = 0;
  }

  return v11;
}

- (id)extendedInfoForRegionType:(int)a3 at:(unint64_t)a4 extendedInfoProvider:(id)a5
{
  id v8 = a5;
  long long v9 = v8;
  if (a3 != 100)
  {
    if (a3 != 88 || !self)
    {
      id v16 = 0;
      goto LABEL_38;
    }
    id v10 = v8;
    id v11 = [v10 ioSurfaceExtendedInfoDetailsAtAddress:a4 for:-[FPProcess pid](self, "pid")];

    if (!v11)
    {
      id v16 = 0;
LABEL_22:

      goto LABEL_38;
    }
    long long v12 = [v11 objectForKeyedSubscript:@"surfaceID"];
    id v13 = [v12 unsignedIntValue];

    long long v14 = [v11 objectForKeyedSubscript:@"PixelFormat"];
    unsigned int v15 = [v14 unsignedIntValue];

    if ((v15 & 0x80000000) != 0)
    {
      if (__maskrune(HIBYTE(v15), 0x800uLL)) {
        goto LABEL_7;
      }
    }
    else if ((_DefaultRuneLocale.__runetype[HIBYTE(v15)] & 0x800) != 0)
    {
LABEL_7:
      __str[0] = HIBYTE(v15);
      __str[1] = BYTE2(v15);
      __str[2] = BYTE1(v15);
      __str[3] = v15;
      __str[4] = 0;
LABEL_19:
      id v27 = objc_alloc((Class)NSMutableString);
      long long v28 = [v11 objectForKeyedSubscript:@"Width"];
      id v29 = [v28 unsignedIntValue];
      BOOL v30 = [v11 objectForKeyedSubscript:@"Height"];
      id v16 = [v27 initWithFormat:v13, v29, [v30 unsignedIntValue], __str];

      BOOL v31 = [v11 objectForKeyedSubscript:@"Name"];
      if ([v31 length]) {
        [v16 appendFormat:@"  '%@'", v31];
      }

      goto LABEL_22;
    }
    snprintf(__str, 5uLL, "%4d", v15);
    goto LABEL_19;
  }
  id v17 = v8;
  if (self)
  {
    id v68 = 0;
    long long v18 = [v17 ioAccelMemoryInfoDetailsAtAddress:a4 for:-[FPProcess pid](self, "pid") error:&v68];
    id v19 = v68;
    long long v20 = v19;
    if (v19)
    {
      long long v21 = [v19 localizedDescription];
      [(FPProcess *)self _addGlobalError:v21];
    }
    if (v18)
    {
      v61 = v9;
      long long v22 = [v18 objectForKeyedSubscript:@"Size"];
      long long v23 = [v18 objectForKeyedSubscript:@"ResidentSize"];
      id v63 = [v18 objectForKeyedSubscript:@"DirtySize"];
      long long v24 = [v18 objectForKeyedSubscript:@"SurfaceID"];
      long long v25 = [v18 objectForKeyedSubscript:@"IsWired"];
      id v62 = [v18 objectForKeyedSubscript:@"IsPurgeable"];
      long long v26 = [v18 objectForKeyedSubscript:@"Descriptions"];
      if ([v24 unsignedLongLongValue])
      {
        +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%llu", [v24 unsignedLongLongValue]);
        v55 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v55 = @"-";
      }
      v57 = v25;
      v58 = v24;
      if ([v25 BOOLValue])
      {
        CFStringRef v32 = @"Wired";
      }
      else
      {
        unsigned int v33 = [v62 BOOLValue];
        CFStringRef v32 = @"Normal";
        if (v33) {
          CFStringRef v32 = @"Purgeable";
        }
      }
      uint64_t v53 = (__CFString *)v32;
      unsigned int v59 = v20;
      id v60 = v17;
      uint64_t v34 = +[NSMutableString string];
      long long v64 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      id v35 = v26;
      id v36 = [v35 countByEnumeratingWithState:&v64 objects:__str count:16];
      if (v36)
      {
        id v37 = v36;
        uint64_t v38 = *(void *)v65;
        do
        {
          for (i = 0; i != v37; i = (char *)i + 1)
          {
            if (*(void *)v65 != v38) {
              objc_enumerationMutation(v35);
            }
            [v34 appendString:*(void *)(*((void *)&v64 + 1) + 8 * i)];
          }
          id v37 = [v35 countByEnumeratingWithState:&v64 objects:__str count:16];
        }
        while (v37);
      }

      [v22 unsignedLongLongValue];
      NSLocalizedFileSizeDescription();
      id v52 = objc_claimAutoreleasedReturnValue();
      id v51 = [v52 UTF8String];
      [v23 unsignedLongLongValue];
      NSLocalizedFileSizeDescription();
      id v40 = objc_claimAutoreleasedReturnValue();
      id v41 = [v40 UTF8String];
      [v63 unsignedLongLongValue];
      NSLocalizedFileSizeDescription();
      id v42 = objc_claimAutoreleasedReturnValue();
      id v43 = [v42 UTF8String];
      uint64_t v44 = v55;
      id v56 = v22;
      uint64_t v45 = v44;
      id v46 = [(__CFString *)v44 UTF8String];
      id v47 = [(__CFString *)v53 UTF8String];
      uint64_t v54 = v23;
      id v48 = v47;
      id v49 = v34;
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Size:%s Resident:%s Dirty:%s IOSurfaceID:%s State:%s %s", v51, v41, v43, v46, v48, [v49 UTF8String]);
      id v16 = (id)objc_claimAutoreleasedReturnValue();

      id v17 = v60;
      long long v9 = v61;
      long long v20 = v59;
    }
    else
    {
      id v16 = 0;
    }
  }
  else
  {
    id v16 = 0;
  }

LABEL_38:

  return v16;
}

- (void)addLedgerData:(unint64_t *)a3 count:(unint64_t)a4
{
  ledgers = self->_ledgers;
  unint64_t v5 = 4;
  if (a4 < 4) {
    unint64_t v5 = a4;
  }
  memcpy(ledgers, a3, 8 * v5);
}

- (unsigned)task
{
  return self->_task;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingUnusedSharedRegion, 0);
  objc_storeStrong((id *)&self->_ownedVmObjects, 0);

  objc_storeStrong((id *)&self->_images, 0);
}

@end