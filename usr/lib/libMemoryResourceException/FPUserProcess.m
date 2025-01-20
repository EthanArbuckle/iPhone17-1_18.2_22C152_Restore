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
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
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
    mach_port_deallocate(*MEMORY[0x263EF8960], task);
  }
  v4.receiver = self;
  v4.super_class = (Class)FPUserProcess;
  [(FPUserProcess *)&v4 dealloc];
}

- (void)gatherData:(unint64_t)a3 extendedInfoProvider:(id)a4
{
  char v4 = a3;
  uint64_t v91 = *MEMORY[0x263EF8340];
  id v53 = a4;
  v54 = self;
  v6 = [(FPProcess *)self memoryRegions];

  if (v6) {
    goto LABEL_43;
  }
  if (![(FPUserProcess *)self _configurePageSize])
  {
    self->_bailedOut = 1;
    v8 = (FILE *)*MEMORY[0x263EF8348];
    images = [(FPProcess *)self displayString];
    fprintf(v8, "%s: skipping due to an error configuring page size for analysis\n", (const char *)[(NSMutableArray *)images UTF8String]);
    goto LABEL_42;
  }
  if ([(FPProcess *)self hiddenFromDisplay])
  {
    id v7 = v53;
    if (!self) {
      goto LABEL_41;
    }
  }
  else
  {
    v10 = (void *)MEMORY[0x223C32890]();
    [(FPUserProcess *)self _gatherImageData];
    [(FPUserProcess *)self _gatherPhysFootprint];
    v11 = [(FPUserProcess *)self _gatherOwnedVmObjects];
    ownedVmObjects = self->_ownedVmObjects;
    self->_ownedVmObjects = v11;

    id v13 = v53;
  }
  v14 = sub_21E86A338((id *)[FPImageEnumerator alloc], self->_images);
  id v15 = objc_alloc_init(MEMORY[0x263EFF980]);
  BOOL v16 = [(FPProcess *)self hiddenFromDisplay];
  BOOL v52 = [(FPProcess *)self breakDownPhysFootprint];
  BOOL v17 = +[FPFootprint isSharingAnalysisDisabled];
  BOOL v51 = [(FPUserProcess *)self doOwnedAccountingAdjustments];
  uint64_t v86 = 0;
  v87 = &v86;
  uint64_t v88 = 0x2020000000;
  uint64_t v89 = 0;
  uint64_t v80 = 0;
  v81 = &v80;
  uint64_t v82 = 0x3032000000;
  v83 = sub_21E86069C;
  v84 = sub_21E8606AC;
  id v85 = 0;
  unint64_t v18 = [(FPSharedCache *)self->super._sharedCache baseAddress];
  unint64_t v19 = [(FPSharedCache *)self->super._sharedCache mappedSize];
  v66[0] = MEMORY[0x263EF8330];
  v66[1] = 3221225472;
  v66[2] = sub_21E8606B4;
  v66[3] = &unk_2644CA5F0;
  unint64_t v72 = v18;
  unint64_t v73 = v19;
  BOOL v74 = v16;
  v66[4] = self;
  id v55 = v15;
  id v67 = v55;
  BOOL v75 = v52;
  v50 = v14;
  v68 = v50;
  v70 = &v80;
  BOOL v76 = (v4 & 2) != 0;
  BOOL v77 = (v4 & 4) != 0;
  BOOL v78 = v51;
  id v69 = v53;
  v71 = &v86;
  BOOL v79 = v17;
  [(FPUserProcess *)self enumerateRegions:v66];
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  v20 = [(NSMutableDictionary *)self->_ownedVmObjects objectEnumerator];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v62 objects:v90 count:16];
  if (!v21) {
    goto LABEL_24;
  }
  uint64_t v22 = *(void *)v63;
  do
  {
    for (uint64_t i = 0; i != v21; ++i)
    {
      if (*(void *)v63 != v22) {
        objc_enumerationMutation(v20);
      }
      v24 = *(void **)(*((void *)&v62 + 1) + 8 * i);
      uint64_t v61 = 0;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v58 = 0u;
      [v24 getBytes:&v58 length:56];
      v25 = objc_alloc_init(FPMemoryRegion);
      [(FPMemoryRegion *)v25 setObject_id:(void)v58];
      [(FPMemoryRegion *)v25 setOwnedExclusivelyByParentProcess:1];
      [(FPMemoryRegion *)v25 setUser_tag:0xFFFFFFFFLL];
      v26 = +[FPMemoryRegion vmLedgerNameForTag:((unint64_t)v61 >> 1) & 7];
      v27 = +[FPMemoryRegion categoryNameForTag:0xFFFFFFFFLL];
      if (v26)
      {
        v28 = (void *)[[NSString alloc] initWithFormat:@"%@ (%@)", v27, v26];
        [(FPMemoryRegion *)v25 setName:v28];
      }
      else
      {
        [(FPMemoryRegion *)v25 setName:v27];
      }
      [(FPMemoryRegion *)v25 setSize:*((void *)&v58 + 1)];
      [(FPMemoryRegion *)v25 setStart:-1];
      [(FPMemoryRegion *)v25 setShare_mode:4];
      uint64_t v56 = 0;
      int v29 = (v61 >> 4) & 3;
      if (v29 != 3 && v29)
      {
        uint64_t v32 = 0;
        uint64_t v57 = 0;
        uint64_t v31 = *((void *)&v59 + 1);
        uint64_t v30 = v59 - *((void *)&v59 + 1);
        if ((v61 & 1) == 0)
        {
LABEL_19:
          v33 = &v56;
          goto LABEL_22;
        }
      }
      else
      {
        uint64_t v30 = v60;
        uint64_t v31 = v59 - v60;
        uint64_t v32 = *((void *)&v60 + 1);
        uint64_t v57 = *((void *)&v60 + 1);
        if ((v61 & 1) == 0) {
          goto LABEL_19;
        }
      }
      uint64_t v56 = v31 + v32;
      v33 = &v57;
      uint64_t v31 = 0;
LABEL_22:
      uint64_t *v33 = 0;
      [(FPMemoryRegion *)v25 setSwappedSize:v57];
      [(FPMemoryRegion *)v25 setDirtySize:v31];
      [(FPMemoryRegion *)v25 setCleanSize:v56];
      [(FPMemoryRegion *)v25 setReclaimableSize:v30];
      [(FPMemoryRegion *)v25 setWired:*((void *)&v59 + 1) != 0];
      [v55 addObject:v25];
    }
    uint64_t v21 = [v20 countByEnumeratingWithState:&v62 objects:v90 count:16];
  }
  while (v21);
LABEL_24:

  v34 = v54->_ownedVmObjects;
  v54->_ownedVmObjects = 0;

  v35 = (void *)v81[5];
  if (v35)
  {
    if (v51)
    {
      unint64_t v36 = [v35 dirtySize];
      if (v36 >= v87[3])
      {
        [v81[5] setDirtySize:[v81[5] dirtySize] - v87[3]];
      }
      else
      {
        uint64_t v37 = [(id)v81[5] dirtySize];
        v87[3] -= v37;
        [(id)v81[5] setDirtySize:0];
        unint64_t v38 = [(id)v81[5] swappedSize];
        v39 = v87;
        v40 = (void *)v81[5];
        if (v38 >= v87[3])
        {
          uint64_t v45 = [(id)v81[5] swappedSize] - v39[3];
        }
        else
        {
          uint64_t v41 = [(id)v81[5] swappedSize];
          uint64_t v42 = v87[3] - v41;
          v87[3] = v42;
          warnings = v54->super._warnings;
          v44 = [NSString stringWithFormat:@"Footprint changed while analyzing – unmapped owned physical footprint may be over-counted by %llu bytes", v42];
          [(NSMutableArray *)warnings addObject:v44];

          uint64_t v45 = 0;
          v40 = (void *)v81[5];
        }
        [v40 setSwappedSize:v45];
      }
    }
    uint64_t v46 = [(id)v81[5] dirtySize];
    if (v46 + [(id)v81[5] swappedSize])
    {
      [(id)v81[5] setStart:-1];
      [v55 addObject:v81[5]];
    }
  }
  if (v52 && v54->_ledgers[0])
  {
    v47 = objc_alloc_init(FPMemoryRegion);
    [(FPMemoryRegion *)v47 setSize:v54->_ledgers[0]];
    [(FPMemoryRegion *)v47 setDirtySize:v54->_ledgers[0]];
    [(FPMemoryRegion *)v47 setStart:-1];
    [(FPMemoryRegion *)v47 setName:@"page table"];
    [(FPMemoryRegion *)v47 setObject_id:-1];
    [(FPMemoryRegion *)v47 setShare_mode:2];
    [v55 addObject:v47];
  }
  v48 = v54;
  if ((os_variant_has_internal_content() & v52) == 1 && v54->_ledgers[3])
  {
    v49 = objc_alloc_init(FPMemoryRegion);
    [(FPMemoryRegion *)v49 setCleanSize:v54->_ledgers[3]];
    [(FPMemoryRegion *)v49 setStart:-1];
    [(FPMemoryRegion *)v49 setName:@"Conclave"];
    [(FPMemoryRegion *)v49 setObject_id:-1];
    [(FPMemoryRegion *)v49 setShare_mode:2];
    [v55 addObject:v49];

    v48 = v54;
  }
  [(FPProcess *)v48 setMemoryRegions:v55];

  _Block_object_dispose(&v80, 8);
  _Block_object_dispose(&v86, 8);

LABEL_41:
  images = v54->_images;
  v54->_images = 0;
LABEL_42:

LABEL_43:
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
    v5 = 0;
    goto LABEL_18;
  }
  size_t v13 = 0;
  if (sysctlbyname("vm.get_owned_vmobjects", 0, &v13, &self->_task, 4uLL))
  {
    if (*__error() != 2) {
      sub_21E85F3A4((id *)&self->super.super.isa, @"vm.get_owned_vmobjects");
    }
    goto LABEL_17;
  }
  size_t v3 = v13;
  if (v13)
  {
    char v4 = 0;
    size_t v12 = 0;
    do
    {
      v3 += 896;
      char v4 = (unint64_t *)malloc_type_realloc(v4, v3, 0xD726E4B2uLL);
      size_t v12 = v3;
      if (sysctlbyname("vm.get_owned_vmobjects", v4, &v12, &self->_task, 4uLL))
      {
        sub_21E85F3A4((id *)&self->super.super.isa, @"vm.get_owned_vmobjects");
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
        v5 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:*v4];
        if (*v4)
        {
          unint64_t v6 = 0;
          id v7 = (uint64_t *)(v4 + 1);
          do
          {
            v8 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:v7 length:56];
            uint64_t v9 = *v7;
            v7 += 7;
            v10 = [NSNumber numberWithUnsignedLongLong:v9];
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
  v5 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:0];
LABEL_18:

  return v5;
}

- (BOOL)_populateMemoryRegionWithPageQueries:(id)a3 regionInfo:(vm_region_submap_info_64 *)a4
{
  id v5 = a3;
  unint64_t v6 = [(FPProcess *)self pageSize];
  uint64_t v7 = [v5 start] & -(uint64_t)v6;
  uint64_t v8 = (v6 + [v5 end] - 1) & -(uint64_t)v6;
  BOOL v9 = v7 != [v5 start];
  uint64_t v26 = [v5 end];
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2020000000;
  uint64_t v45 = 0;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  uint64_t v41 = 0;
  if ([v5 dirtySize])
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
  else if (![v5 swappedSize])
  {
    BOOL v25 = v9;
    unint64_t cachedDispositionAddress = self->_cachedDispositionAddress;
    unint64_t v27 = (v8 - v7) / v6;
    if (v7 != cachedDispositionAddress)
    {
      mach_vm_offset_t v17 = v7;
      goto LABEL_13;
    }
    int cachedDisposition = self->_cachedDisposition;
    v23 = v39;
    v24 = v43;
    id v12 = v5;
    uint64_t v13 = [v12 start];
    unint64_t v14 = [v12 size];
    unint64_t v15 = v6 - v13 + (v13 & -(uint64_t)v6);
    if (v14 < v15) {
      unint64_t v15 = [v12 size];
    }
    mach_vm_offset_t v17 = v7 + v6;
    --v27;
    BOOL v16 = v24 + 3;
    if ((cachedDisposition & 8) == 0 && (cachedDisposition & 0x81) != 1)
    {
      if ((cachedDisposition & 0x10) == 0)
      {
LABEL_12:

LABEL_13:
        if (objc_msgSend(v5, "unusedSharedCacheRegion", v23))
        {
          if (v7 == cachedDispositionAddress)
          {
            [v5 setDirtySize:v43[3]];
            [v5 setSwappedSize:v39[3]];
          }
          char v18 = 1;
          if (v8 == v26 || !v27) {
            goto LABEL_21;
          }
          unint64_t v19 = (FPMemoryRegion *)v5;
          pendingUnusedSharedRegion = self->_pendingUnusedSharedRegion;
          self->_pendingUnusedSharedRegion = v19;
          char v18 = 1;
        }
        else
        {
          v28[0] = MEMORY[0x263EF8330];
          v28[1] = 3221225472;
          v28[2] = sub_21E85F7FC;
          v28[3] = &unk_2644CA5A0;
          BOOL v35 = v7 == cachedDispositionAddress;
          BOOL v36 = v25;
          BOOL v37 = v8 != v26;
          uint64_t v21 = (FPMemoryRegion *)v5;
          uint64_t v31 = &v42;
          uint64_t v32 = &v38;
          int v29 = v21;
          uint64_t v30 = self;
          unint64_t v33 = v6;
          uint64_t v34 = v8;
          char v18 = sub_21E85FAD4((uint64_t)self, v17, v27, v28);
          [(FPMemoryRegion *)v21 setSwappedSize:v39[3]];
          [(FPMemoryRegion *)v21 setDirtySize:v43[3]];
          pendingUnusedSharedRegion = v29;
        }

LABEL_21:
        _Block_object_dispose(&v38, 8);
        _Block_object_dispose(&v42, 8);

        return v18;
      }
      BOOL v16 = v23 + 3;
    }
    *v16 += v15;
    goto LABEL_12;
  }
  _os_assert_log();
  BOOL result = _os_crash();
  __break(1u);
  return result;
}

- (void)enumerateRegions:(id)a3
{
  kern_return_t v19;
  mach_vm_address_t v20;
  BOOL v21;
  kern_return_t v22;
  mach_error_t v23;
  BOOL v24;
  int v25;
  void *v26;
  __CFString *v27;
  unint64_t v28;
  mach_vm_size_t v29;
  unint64_t v30;
  id v31;
  mach_port_t v32;
  natural_t nesting_depth[2];
  mach_vm_size_t v34;
  mach_vm_address_t v35;
  int v36[4];
  long long v37;
  int v38;
  int v39[21];
  mach_msg_type_number_t v40;
  mach_port_t object_name;
  mach_msg_type_number_t infoCnt;
  mach_vm_size_t size;
  mach_vm_address_t address;
  int info[4];
  long long v46;
  int v47;
  uint64_t v48;

  v48 = *MEMORY[0x263EF8340];
  uint64_t v31 = a3;
  memset(v39, 0, 76);
  uint64_t v38 = 0;
  *(_OWORD *)BOOL v36 = 0u;
  BOOL v37 = 0u;
  uint64_t v34 = 0;
  BOOL v35 = 0;
  unint64_t v4 = [(FPSharedCache *)self->super._sharedCache baseAddress];
  mach_vm_address_t v5 = [(FPSharedCache *)self->super._sharedCache slide];
  uint64_t v30 = [(FPSharedCache *)self->super._sharedCache mappedSize];
  v28 = [(FPSharedCache *)self->super._sharedCache slide];
  unint64_t v6 = [(FPSharedCache *)self->super._sharedCache baseAddress];
  mach_vm_size_t v7 = v6 - [(FPSharedCache *)self->super._sharedCache slide];
  uint64_t v8 = [(NSMutableArray *)self->_images firstObject];
  if (v8) {
    mach_vm_size_t v9 = v8[3] + v8[2];
  }
  else {
LABEL_53:
  }
    mach_vm_size_t v9 = 0;
  int v29 = v4 - v5;
  uint64_t v40 = 0;
  *(void *)nesting_depth = 0;
  uint64_t v32 = 0;

  size = 0;
  v47 = 0;
  *(_OWORD *)info = 0u;
  uint64_t v46 = 0u;
  object_name = 0;
  unint64_t v10 = [(FPProcess *)self pageSize];
  if (v7)
  {
    unint64_t v11 = v10;
    mach_vm_size_t v12 = v7;
    mach_vm_address_t v13 = v9;
    do
    {
      address = (v12 >> 1) + (v9 >> 1);
      infoCnt = 9;
      if (mach_vm_region(self->_task, &address, &size, 9, info, &infoCnt, &object_name)) {
        break;
      }
      if (size + address <= v7)
      {
        mach_vm_size_t v9 = size + address;
        mach_vm_address_t v13 = address;
      }
      else
      {
        if (v9 == address) {
          break;
        }
        mach_vm_size_t v12 = (v12 >> 1) + (v9 >> 1) - v11;
      }
    }
    while (v12 > v9 && v12 - v9 > 0x1000000);
  }
  else
  {
    mach_vm_address_t v13 = 0;
  }
  unint64_t v4 = 0;
  mach_vm_address_t v14 = v13;
  mach_vm_address_t v15 = v13 - 1;
  mach_vm_address_t v5 = v30 + v29 + v28;
  uint64_t v30 = (unint64_t)v31 + 16;
  while (1)
  {
    BOOL v16 = (void *)MEMORY[0x223C32890]();
    nesting_depth[1] = -1;
    uint64_t v40 = 9;
    mach_vm_address_t v17 = v35;
    if (v15 >= v35 || v5 <= v35) {
      goto LABEL_23;
    }
    unint64_t v19 = mach_vm_region(self->_task, &v35, &v34, 9, v36, &v40, &v32);
    if (v19) {
      break;
    }
    v20 = v35;
    if (v35 < v17)
    {
      BOOL v35 = v17;
LABEL_23:
      v20 = v17;
    }
    if (v20 < v14 || (v29 < v34 + v20 ? (uint64_t v21 = v20 >= v5) : (uint64_t v21 = 1), v21))
    {
      uint64_t v40 = 19;
      mach_vm_size_t v7 = 96;
      uint64_t v22 = mach_vm_region_recurse(self->_task, &v35, &v34, &nesting_depth[1], v39, &v40);
      v23 = v22;
      if (v40 <= 0x12) {
        *(void *)&v39[17] = v39[14];
      }
      if (v22 == 1 || (v4 & (v39[5] != -1)) != 0) {
        goto LABEL_46;
      }
      if (v22)
      {
        unint64_t v27 = @"mach_vm_region_recurse";
        goto LABEL_50;
      }
      v24 = v39[5] == -1;
      if (mach_vm_purgable_control(self->_task, v35, 1, (int *)nesting_depth)) {
        nesting_depth[0] = 3;
      }
      if (v39[12])
      {
        _os_assert_log();
        uint64_t v8 = (void *)_os_crash();
        __break(1u);
        goto LABEL_53;
      }
      unint64_t v4 = v24 | v4;
      if (BYTE2(v39[11])
        && [(FPUserProcess *)self _isAlive]
        && (BOOL v25 = proc_regionfilename(self->super._pid, v35, info, 0x400u)) != 0)
      {
        *((unsigned char *)info + v25) = 0;
        uint64_t v26 = (void *)[[NSString alloc] initWithUTF8String:info];
      }
      else
      {
        uint64_t v26 = 0;
      }
    }
    else
    {
      uint64_t v26 = 0;
      v39[2] = v36[2];
      *(void *)v39 = *(void *)v36;
      *(void *)&v39[3] = *(void *)((char *)&v37 + 4);
      memset(&v39[5], 0, 24);
      v39[11] = 16842752;
      v39[12] = v37;
      v39[13] = HIDWORD(v37);
      v39[14] = 1;
      LOWORD(v39[15]) = v38;
      v39[16] = 0;
      *(void *)&v39[17] = 1;
      nesting_depth[0] = 3;
    }
    if (((*((uint64_t (**)(id, mach_vm_address_t, mach_vm_size_t, int *, void, void *, void, void))v31
           + 2))(v31, v35, v34, v39, nesting_depth[0], v26, 0, 0) & 1) != 0)goto LABEL_47;
    v35 += v34;
  }
  v23 = v19;
  if (v19 == 1)
  {
LABEL_46:
    uint64_t v26 = 0;
LABEL_47:

    goto LABEL_51;
  }
  unint64_t v27 = @"mach_vm_region";
LABEL_50:
  sub_21E8600FC(self, v23, v27);
LABEL_51:
}

- (void)_addSubrangesForRegion:(id)a3 purgeState:(int)a4
{
  id v6 = a3;
  unint64_t v7 = [(FPProcess *)self pageSize];
  uint64_t v8 = [v6 start];
  uint64_t v9 = [v6 end];
  char v10 = [v6 wired];
  if ([v6 ownedExclusivelyByParentProcess])
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
  else
  {
    mach_vm_offset_t v11 = v8 & -(uint64_t)v7;
    unint64_t v12 = ((v7 + v9 - 1) & -(uint64_t)v7) - v11;
    if (a4 == 1) {
      int v13 = 1;
    }
    else {
      int v13 = 2048;
    }
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x3010000000;
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    v25[3] = &unk_21E872211;
    unint64_t v14 = v12 / v7;
    uint64_t v26 = [v6 offset];
    uint64_t v27 = 0;
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x2020000000;
    v24[3] = 0;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = sub_21E86049C;
    v16[3] = &unk_2644CA5C8;
    int v21 = 8;
    int v22 = v13;
    char v18 = v24;
    unint64_t v19 = v25;
    char v23 = v10;
    id v15 = v6;
    id v17 = v15;
    unint64_t v20 = v7;
    sub_21E85FAD4((uint64_t)self, v11, v14, v16);

    _Block_object_dispose(v24, 8);
    _Block_object_dispose(v25, 8);
  }
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
  uint64_t v9 = *MEMORY[0x263EF8340];
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
        && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = dirty;
        _os_log_error_impl(&dword_21E853000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Unable to fetch process info: %d", buf, 8u);
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
  uint64_t v30 = *MEMORY[0x263EF8340];
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
    if (qword_267D45CD0 != -1) {
      dispatch_once(&qword_267D45CD0, &unk_26CFD2650);
    }
    uint64_t v5 = qword_267D45CC8;
    if ((qword_267D45CC8 & 0x8000000000000000) == 0)
    {
      uint64_t v3 = xmmword_267D45CA8;
      if ((xmmword_267D45CA8 & 0x8000000000000000) == 0)
      {
        unsigned int v4 = malloc_type_malloc(48 * qword_267D45CC8, 0x1000040EED21634uLL);
        [(FPProcess *)v2 pid];
        if ((ledger() & 0x80000000) != 0)
        {
          sub_21E85F3A4((id *)&v2->super.super.isa, @"Unable to retrieve ledger entry info");
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
          if (qword_267D45CD0 == -1) {
            goto LABEL_10;
          }
        }
        dispatch_once(&qword_267D45CD0, &unk_26CFD2650);
LABEL_10:
        if ((qword_267D45CC8 & 0x8000000000000000) == 0 && qword_267D45CC0 >= 1) {
          v2->super._sharedCache = (FPSharedCache *)(*((void *)v4 + 6 * qword_267D45CC0) & ~(*((uint64_t *)v4
        }
                                                                                               + 6 * qword_267D45CC0) >> 63));
        goto LABEL_14;
      }
    }
  }
}

- (void)_gatherSharedCacheFromDyldSnapshot:(dyld_process_snapshot_s *)a3
{
  self->super._sharedCache = +[FPSharedCache sharedCacheForDyldSnapshot:a3];

  MEMORY[0x270F9A758]();
}

- (void)_gatherImageData
{
  mach_error_t v9 = 0;
  if (dyld_process_create_for_task())
  {
    mach_error_t v9 = 0;
    uint64_t v3 = dyld_process_snapshot_create_for_process();
    dyld_process_dispose();
    if (v3)
    {
      [(FPUserProcess *)self _gatherSharedCacheFromDyldSnapshot:v3];
      v7[0] = 0;
      v7[1] = v7;
      v7[2] = 0x2020000000;
      char v8 = 0;
      v5[0] = 0;
      v5[1] = v5;
      v5[2] = 0x3032000000;
      v5[3] = sub_21E86069C;
      v5[4] = sub_21E8606AC;
      id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
      uint64_t v4 = MEMORY[0x263EF8330];
      dyld_process_snapshot_for_each_image();
      dyld_process_snapshot_dispose();
      -[NSMutableArray sortUsingComparator:](self->_images, "sortUsingComparator:", &unk_26CFD2560, v4, 3221225472, sub_21E861850, &unk_2644CA640, self, v5, v7);
      _Block_object_dispose(v5, 8);

      _Block_object_dispose(v7, 8);
    }
  }
  else
  {
    sub_21E8600FC(self, v9, @"dyld_process_create_for_task");
  }
}

- (BOOL)_isAlive
{
  return 1;
}

- (id)auxData
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  unsigned int v4 = [(FPProcess *)self priority];
  if (os_variant_has_internal_content() && (v4 & 0x80000000) == 0)
  {
    uint64_t v5 = [[FPAuxData alloc] initWithValue:v4 shouldAggregate:0];
    [(FPAuxData *)v5 setFormatter:&unk_26CFD2580];
    [v3 setObject:v5 forKeyedSubscript:@"jetsam priority"];
  }
  unsigned int v6 = [(FPProcess *)self idleExitStatus];
  if (os_variant_has_internal_content() && v6)
  {
    long long v7 = [[FPAuxData alloc] initWithValue:v6 shouldAggregate:0];
    [(FPAuxData *)v7 setFormatter:&unk_26CFD25A0];
    [v3 setObject:v7 forKeyedSubscript:@"dirty"];
  }
  ledgers = self->_ledgers;
  if (self->_ledgers[1])
  {
    mach_error_t v9 = [[FPAuxData alloc] initWithValue:self->_ledgers[1] shouldAggregate:0];
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
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v8 = a5;
  mach_error_t v9 = v8;
  if (a3 != 100)
  {
    if (a3 != 88 || !self)
    {
      long long v16 = 0;
      goto LABEL_38;
    }
    id v10 = v8;
    id v11 = [v10 ioSurfaceExtendedInfoDetailsAtAddress:a4 for:-[FPProcess pid](self, "pid")];

    if (!v11)
    {
      long long v16 = 0;
LABEL_22:

      goto LABEL_38;
    }
    long long v12 = [v11 objectForKeyedSubscript:0x26CFD4910];
    uint64_t v13 = [v12 unsignedIntValue];

    long long v14 = [v11 objectForKeyedSubscript:0x26CFD3970];
    unsigned int v15 = [v14 unsignedIntValue];

    if ((v15 & 0x80000000) != 0)
    {
      if (__maskrune(HIBYTE(v15), 0x800uLL)) {
        goto LABEL_7;
      }
    }
    else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * HIBYTE(v15) + 60) & 0x800) != 0)
    {
LABEL_7:
      __str[0] = HIBYTE(v15);
      __str[1] = BYTE2(v15);
      __str[2] = BYTE1(v15);
      __str[3] = v15;
      __str[4] = 0;
LABEL_19:
      id v27 = objc_alloc(MEMORY[0x263F089D8]);
      long long v28 = [v11 objectForKeyedSubscript:0x26CFD3930];
      uint64_t v29 = [v28 unsignedIntValue];
      uint64_t v30 = [v11 objectForKeyedSubscript:0x26CFD3950];
      long long v16 = [v27 initWithFormat:v13, v29, [v30 unsignedIntValue], __str];

      uint64_t v31 = [v11 objectForKeyedSubscript:0x26CFD3910];
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
    id v69 = 0;
    long long v18 = [v17 ioAccelMemoryInfoDetailsAtAddress:a4 for:-[FPProcess pid](self, "pid") error:&v69];
    id v19 = v69;
    long long v20 = v19;
    if (v19)
    {
      long long v21 = [v19 localizedDescription];
      [(FPProcess *)self _addGlobalError:v21];
    }
    if (v18)
    {
      long long v62 = v9;
      long long v22 = [v18 objectForKeyedSubscript:0x26CFD29B0];
      long long v23 = [v18 objectForKeyedSubscript:0x26CFD39F0];
      long long v64 = [v18 objectForKeyedSubscript:0x26CFD39D0];
      long long v24 = [v18 objectForKeyedSubscript:0x26CFD38F0];
      long long v25 = [v18 objectForKeyedSubscript:0x26CFD3A10];
      long long v63 = [v18 objectForKeyedSubscript:0x26CFD3A30];
      long long v26 = [v18 objectForKeyedSubscript:0x26CFD3990];
      if ([v24 unsignedLongLongValue])
      {
        [NSString stringWithFormat:@"%llu", [v24 unsignedLongLongValue]];
        uint64_t v56 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v56 = @"-";
      }
      long long v58 = v25;
      long long v59 = v24;
      if ([v25 BOOLValue])
      {
        uint64_t v32 = @"Wired";
      }
      else
      {
        int v33 = [v63 BOOLValue];
        uint64_t v32 = @"Normal";
        if (v33) {
          uint64_t v32 = @"Purgeable";
        }
      }
      v54 = v32;
      long long v60 = v20;
      id v61 = v17;
      uint64_t v34 = [MEMORY[0x263F089D8] string];
      long long v65 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      id v35 = v26;
      uint64_t v36 = [v35 countByEnumeratingWithState:&v65 objects:__str count:16];
      if (v36)
      {
        uint64_t v37 = v36;
        uint64_t v38 = *(void *)v66;
        do
        {
          for (uint64_t i = 0; i != v37; ++i)
          {
            if (*(void *)v66 != v38) {
              objc_enumerationMutation(v35);
            }
            [v34 appendString:*(void *)(*((void *)&v65 + 1) + 8 * i)];
          }
          uint64_t v37 = [v35 countByEnumeratingWithState:&v65 objects:__str count:16];
        }
        while (v37);
      }

      id v53 = NSString;
      [v22 unsignedLongLongValue];
      NSLocalizedFileSizeDescription();
      id v52 = objc_claimAutoreleasedReturnValue();
      uint64_t v51 = [v52 UTF8String];
      [v23 unsignedLongLongValue];
      NSLocalizedFileSizeDescription();
      id v40 = objc_claimAutoreleasedReturnValue();
      uint64_t v41 = [v40 UTF8String];
      [v64 unsignedLongLongValue];
      NSLocalizedFileSizeDescription();
      id v42 = objc_claimAutoreleasedReturnValue();
      uint64_t v43 = [v42 UTF8String];
      uint64_t v44 = v56;
      id v57 = v22;
      uint64_t v45 = v44;
      uint64_t v46 = [(__CFString *)v44 UTF8String];
      uint64_t v47 = [(__CFString *)v54 UTF8String];
      id v55 = v23;
      uint64_t v48 = v47;
      id v49 = v34;
      long long v16 = [v53 stringWithFormat:@"Size:%s Resident:%s Dirty:%s IOSurfaceID:%s State:%s %s", v51, v41, v43, v46, v48, [v49 UTF8String]];

      id v17 = v61;
      mach_error_t v9 = v62;
      long long v20 = v60;
    }
    else
    {
      long long v16 = 0;
    }
  }
  else
  {
    long long v16 = 0;
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