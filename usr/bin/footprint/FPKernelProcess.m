@interface FPKernelProcess
- (BOOL)_isAlive;
- (BOOL)_populateTask;
- (FPKernelProcess)initWithBsdInfo:(proc_bsdinfo *)a3;
- (id)auxData;
- (unint64_t)_gatherPageSize;
- (void)gatherData:(unint64_t)a3 extendedInfoProvider:(id)a4;
@end

@implementation FPKernelProcess

- (FPKernelProcess)initWithBsdInfo:(proc_bsdinfo *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)FPKernelProcess;
  v3 = [(FPProcess *)&v10 initWithBsdInfo:a3];
  v4 = v3;
  if (v3)
  {
    v3->super._idleExitStatus = 1;
    uint64_t v5 = +[NSMutableDictionary dictionary];
    mapsAuxData = v4->_mapsAuxData;
    v4->_mapsAuxData = (NSMutableDictionary *)v5;

    uint64_t v7 = +[NSMutableDictionary dictionary];
    otherAuxData = v4->_otherAuxData;
    v4->_otherAuxData = (NSMutableDictionary *)v7;
  }
  return v4;
}

- (unint64_t)_gatherPageSize
{
  return vm_kernel_page_size;
}

- (void)gatherData:(unint64_t)a3 extendedInfoProvider:(id)a4
{
  kern_return_t v6;
  mach_error_t v7;
  FILE *v8;
  id v9;
  FPKernelProcess *v10;
  const char *v11;
  char *v12;
  void *v13;
  void *v14;
  void *v15;
  mach_zone_name_array_t v16;
  mach_zone_info_array_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t *p_mzi_collectable;
  FPMemoryMultiRegion *v22;
  char *v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  unint64_t v28;
  uint64_t v29;
  kern_return_t v30;
  mach_error_t v31;
  FILE *v32;
  id v33;
  const char *v34;
  char *v35;
  mach_memory_info_array_t v36;
  uint64_t v37;
  id v38;
  id *p_isa;
  uint64_t v40;
  uint64_t v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  uint64_t v48;
  void *i;
  void *v50;
  void *v51;
  void **p_vtable;
  uint64_t v53;
  uint64_t flags;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  FPMemoryRegion *v58;
  FPAuxData *v59;
  FPMemoryRegion *v60;
  FPMemoryRegion *v61;
  FPMemoryRegion *v62;
  CFStringRef v63;
  id v64;
  uint64_t flags_low;
  void *v66;
  uint64_t Path;
  void *v68;
  kern_return_t v69;
  mach_error_t v70;
  FILE *v71;
  id v72;
  const char *v73;
  char *v74;
  kern_return_t v75;
  mach_error_t v76;
  FILE *v77;
  id v78;
  const char *v79;
  char *v80;
  uint64_t v81;
  void *v82;
  FPAuxData *v83;
  FPAuxData *v84;
  FPAuxData *v85;
  void *v86;
  unsigned int v87;
  mach_zone_name_array_t v88;
  void *v89;
  FPKernelProcess *v90;
  uint64_t v91;
  uint64_t v92;
  mach_msg_type_number_t memory_infoCnt;
  mach_memory_info_array_t memory_info;
  mach_msg_type_number_t infoCnt[2];
  mach_zone_name_array_t names;
  mach_zone_info_array_t info;
  long long v98;
  long long v99;
  long long v100;
  long long v101;
  rusage_info_t buffer[2];
  long long v103;
  long long v104;
  long long v105;
  long long v106;
  long long v107;
  long long v108;
  long long v109;
  long long v110;
  long long v111;
  long long v112;
  long long v113;
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
  long long v130;

  names = 0;
  info = 0;
  memory_info = 0;
  *(void *)infoCnt = 0;
  memory_infoCnt = 0;
  mach_port_t v5 = mach_host_self();
  v6 = mach_memory_info(v5, &names, &infoCnt[1], &info, infoCnt, &memory_info, &memory_infoCnt);
  if (v6)
  {
    uint64_t v7 = v6;
    v8 = __stderrp;
    v9 = [(FPProcess *)self displayString];
    objc_super v10 = self;
    v11 = (const char *)[v9 UTF8String];
    v12 = mach_error_string(v7);
    fprintf(v8, "%s: mach_memory_info: %s\n", v11, v12);

    v13 = [(FPProcess *)v10 displayString];
    v14 = +[NSString stringWithFormat:@"%@: %s", v13, mach_error_string(v7)];

    [(NSMutableArray *)v10->super._errors addObject:v14];
    goto LABEL_3;
  }
  v15 = +[NSMutableArray array];
  v16 = names;
  v17 = info;
  v18 = infoCnt[1];
  v19 = v15;
  v90 = self;
  if (self && v18)
  {
    v20 = 0;
    p_mzi_collectable = &v17->mzi_collectable;
    do
    {
      v22 = objc_alloc_init(FPMemoryMultiRegion);
      v23 = strnstr(v16->mzn_name, "kalloc", 0x50uLL);
      v24 = objc_alloc((Class)NSString);
      if (v23)
      {
        v25 = [v24 initWithFormat:@"kalloc.%llu", *(p_mzi_collectable - 4)];
        [(FPMemoryRegion *)v22 setName:v25];

        [(FPMemoryMultiRegion *)v22 setAuxDataName:@"kalloc"];
      }
      else
      {
        v26 = [v24 initWithFormat:@"%.*s", 80, v16];
        [(FPMemoryRegion *)v22 setName:v26];
      }
      v27 = [(FPMemoryRegion *)v22 name];

      if (!v27) {
        [(FPMemoryRegion *)v22 setName:@"unknown"];
      }
      v28 = *(p_mzi_collectable - 6);
      v29 = *p_mzi_collectable >> 1;
      [(FPMemoryRegion *)v22 setDirtySize:v28 - v29];
      [(FPMemoryRegion *)v22 setReclaimableSize:v29];
      if (v22)
      {
        v22->super._size = v28;
        v22->super._object_id = v20 | 0x200000000;
      }
      [(FPMemoryMultiRegion *)v22 setTotalRegions:v28 / *(p_mzi_collectable - 4)];
      [(FPMemoryMultiRegion *)v22 setRegionSize:*(p_mzi_collectable - 4)];
      [v19 addObject:v22];

      ++v20;
      p_mzi_collectable += 8;
      ++v16;
    }
    while (v18 != v20);
  }

  v30 = vm_deallocate(mach_task_self_, (vm_address_t)info, (unint64_t)infoCnt[0] << 6);
  if (v30)
  {
    v31 = v30;
    v32 = __stderrp;
    v33 = [(FPProcess *)v90 displayString];
    v34 = (const char *)[v33 UTF8String];
    v35 = mach_error_string(v31);
    fprintf(v32, "%s: vm_deallocate: %s\n", v34, v35);
  }
  v36 = memory_info;
  v37 = memory_infoCnt;
  v88 = names;
  v87 = infoCnt[1];
  v38 = v19;
  v14 = v38;
  p_isa = (id *)&v90->super.super.isa;
  if (v90)
  {
    v89 = v38;
    self;
    CSSymbolicatorGetFlagsForNListOnlyData();
    v40 = CSSymbolicatorCreateWithMachKernelFlagsAndNotification();
    v91 = v41;
    v92 = v40;
    self;
    v42 = (id)OSKextCopyLoadedKextInfo();
    self;
    v43 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v42 count]);
    v44 = +[NSString stringWithUTF8String:"OSBundleLoadTag"];
    v98 = 0u;
    v99 = 0u;
    v100 = 0u;
    v101 = 0u;
    v86 = v42;
    v45 = [v42 objectEnumerator];
    v46 = [v45 countByEnumeratingWithState:&v98 objects:buffer count:16];
    if (v46)
    {
      v47 = v46;
      v48 = *(void *)v99;
      do
      {
        for (i = 0; i != v47; i = (char *)i + 1)
        {
          if (*(void *)v99 != v48) {
            objc_enumerationMutation(v45);
          }
          v50 = *(void **)(*((void *)&v98 + 1) + 8 * i);
          v51 = [v50 objectForKeyedSubscript:v44];
          [v43 setObject:v50 forKeyedSubscript:v51];
        }
        v47 = [v45 countByEnumeratingWithState:&v98 objects:buffer count:16];
      }
      while (v47);
    }

    p_isa = (id *)&v90->super.super.isa;
    p_vtable = &OBJC_METACLASS___FPMemoryRegion.vtable;
    if (v37)
    {
      v53 = 0;
      while (1)
      {
        flags = v36->flags;
        v55 = v36->flags & 0x9FF;
        if (v55 == 3) {
          v56 = 48;
        }
        else {
          v56 = 16;
        }
        v57 = *(uint64_t *)((char *)&v36->flags + v56);
        if (!(v36->site | v57)) {
          goto LABEL_53;
        }
        if (v55 == 3) {
          break;
        }
        if ((flags & 0x1000) == 0)
        {
          v60 = objc_alloc_init(FPMemoryRegion);
          v61 = v60;
          if ((flags & 0x900) != 0x100 || (v36->flags & 0x200) != 0 || v36->site == 24)
          {
            [(FPMemoryRegion *)v60 setCleanSize:v57];
            [(FPMemoryRegion *)v61 setDirtySize:0];
            if ((v36->flags & 0x200) != 0)
            {
              v62 = v61;
              v63 = @"(hidden)";
LABEL_41:
              [(FPMemoryRegion *)v62 setDetailedName:v63];
            }
            else if (v36->site == 24)
            {
              v62 = v61;
              v63 = @"(user wired)";
              goto LABEL_41;
            }
            if (v61)
            {
LABEL_43:
              *((unsigned char *)v61 + 8) = *((unsigned char *)v61 + 8) & 0xFE | BYTE1(flags) & 1;
              [(FPMemoryRegion *)v61 setSwappedSize:0];
              [(FPMemoryRegion *)v61 setReclaimableSize:0];
              v61->_user_tag = v53;
              v61->_size = v57;
              v61->_object_id = v53 | (unint64_t)&_mh_execute_header;
              goto LABEL_44;
            }
          }
          else
          {
            [(FPMemoryRegion *)v60 setDirtySize:v57];
            [(FPMemoryRegion *)v61 setCleanSize:0];
            if (v61) {
              goto LABEL_43;
            }
          }
          [0 setSwappedSize:0];
          [0 setReclaimableSize:0];
LABEL_44:
          v58 = v61;
          v64 = v43;
          self;
          flags_low = LOBYTE(v36->flags);
          v66 = sub_10000C708((uint64_t)(p_vtable + 62), (uint64_t *)v36, v64, v92, v91, (uint64_t)v88, v87);

          if (v66)
          {
            [(FPMemoryRegion *)v58 setName:v66];
            if (flags_low == 2)
            {
              CSSymbolicatorGetSourceInfoWithAddressAtTime();
              if ((CSIsNull() & 1) == 0)
              {
                Path = CSSourceInfoGetPath();
                if (Path)
                {
                  v68 = +[NSString stringWithFormat:@"(%s:%d)", Path, CSSourceInfoGetLineNumber()];
                  [(FPMemoryRegion *)v58 setDetailedName:v68];
                }
              }
            }

            [v89 addObject:v58];
            p_isa = (id *)&v90->super.super.isa;
          }
          else
          {
          }
          p_vtable = (void **)(&OBJC_METACLASS___FPMemoryRegion + 24);
LABEL_52:
        }
LABEL_53:
        ++v53;
        ++v36;
        if (v37 == v53) {
          goto LABEL_57;
        }
      }
      sub_10000C708((uint64_t)(p_vtable + 62), (uint64_t *)v36, v43, v92, v91, 0, 0);
      v58 = (FPMemoryRegion *)objc_claimAutoreleasedReturnValue();
      v59 = [[FPAuxData alloc] initWithValue:v57 shouldAggregate:0];
      [p_isa[12] setObject:v59 forKeyedSubscript:v58];

      goto LABEL_52;
    }
LABEL_57:
    CSRelease();

    v14 = v89;
  }

  v69 = vm_deallocate(mach_task_self_, (vm_address_t)names, 80 * infoCnt[1]);
  if (v69)
  {
    v70 = v69;
    v71 = __stderrp;
    v72 = [p_isa displayString];
    v73 = (const char *)[v72 UTF8String];
    v74 = mach_error_string(v70);
    fprintf(v71, "%s: vm_deallocate: %s\n", v73, v74);
  }
  v75 = vm_deallocate(mach_task_self_, (vm_address_t)memory_info, 176 * memory_infoCnt);
  if (v75)
  {
    v76 = v75;
    v77 = __stderrp;
    v78 = [p_isa displayString];
    v79 = (const char *)[v78 UTF8String];
    v80 = mach_error_string(v76);
    fprintf(v77, "%s: vm_deallocate: %s\n", v79, v80);
  }
  [p_isa setMemoryRegions:v14];
  if (p_isa)
  {
    if (qword_100038A80 != -1) {
      dispatch_once(&qword_100038A80, &stru_100029EE0);
    }
    *(void *)&v98 = qword_100038A78;
    if ((qword_100038A78 & 0x8000000000000000) == 0)
    {
      v81 = *((void *)&xmmword_100038A58 + 1);
      if ((*((void *)&xmmword_100038A58 + 1) & 0x8000000000000000) == 0)
      {
        v82 = malloc_type_malloc(48 * qword_100038A78, 0x1000040EED21634uLL);
        [p_isa pid];
        if ((ledger() & 0x80000000) != 0)
        {
          free(v82);
        }
        else
        {
          if (v81 >= (uint64_t)v98)
          {
            _os_assert_log();
            _os_crash();
            __break(1u);
          }
          v83 = [[FPAuxData alloc] initWithValue:*((void *)v82 + 6 * v81) & ~(*((uint64_t *)v82 + 6 * v81) >> 63) shouldAggregate:0];
          [(NSMutableDictionary *)v90->_otherAuxData setObject:v83 forKeyedSubscript:@"billed footprint"];

          free(v82);
          v129 = 0u;
          v130 = 0u;
          v127 = 0u;
          v128 = 0u;
          v125 = 0u;
          v126 = 0u;
          v123 = 0u;
          v124 = 0u;
          v121 = 0u;
          v122 = 0u;
          v119 = 0u;
          v120 = 0u;
          v117 = 0u;
          v118 = 0u;
          v115 = 0u;
          v116 = 0u;
          v113 = 0u;
          v114 = 0u;
          v111 = 0u;
          v112 = 0u;
          v109 = 0u;
          v110 = 0u;
          v107 = 0u;
          v108 = 0u;
          v105 = 0u;
          v106 = 0u;
          v104 = 0u;
          *(_OWORD *)buffer = 0u;
          v103 = 0u;
          if (!proc_pid_rusage(v90->super._pid, 6, buffer))
          {
            v84 = [FPAuxData alloc];
            v85 = [(FPAuxData *)v84 initWithValue:(void)v117 shouldAggregate:0];
            [(NSMutableDictionary *)v90->_otherAuxData setObject:v85 forKeyedSubscript:@"billed footprint peak"];
          }
        }
      }
    }
  }
LABEL_3:
}

- (BOOL)_populateTask
{
  return 1;
}

- (BOOL)_isAlive
{
  return 1;
}

- (id)auxData
{
  mapsAuxData = self->_mapsAuxData;
  CFStringRef v7 = @"Maps";
  v8 = mapsAuxData;
  v4 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  if ([(NSMutableDictionary *)self->_otherAuxData count])
  {
    uint64_t v5 = [v4 fp_mergeWithData:self->_otherAuxData forceAggregate:1];

    v4 = (void *)v5;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherAuxData, 0);

  objc_storeStrong((id *)&self->_mapsAuxData, 0);
}

@end