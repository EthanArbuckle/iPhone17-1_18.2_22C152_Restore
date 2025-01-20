@interface VMUProcessLedger
+ (id)_getProcessLedgerDictFromCrashInfo:(unint64_t)a3 DataSize:(unint64_t)a4;
+ (id)_getProcessLedgerDictFromKernelLedger:(int)a3;
+ (id)_getProcessLedgerForCore:(id)a3;
+ (id)ledgerForVMUTask:(id)a3;
@end

@implementation VMUProcessLedger

+ (id)ledgerForVMUTask:(id)a3
{
  kern_return_t v6;
  void *v7;
  mach_vm_size_t v9;
  mach_vm_address_t kcd_addr_begin;
  uint64_t vars8;

  id v4 = a3;
  if ([v4 isCore])
  {
    uint64_t v5 = +[VMUProcessLedger _getProcessLedgerForCore:v4];
  }
  else
  {
    v9 = 0;
    kcd_addr_begin = 0;
    v6 = task_map_corpse_info_64(*MEMORY[0x1E4F14960], [v4 taskPort], &kcd_addr_begin, &v9);
    if (v6)
    {
      v7 = 0;
      if (v6 != 4) {
        goto LABEL_8;
      }
      uint64_t v5 = [a1 _getProcessLedgerDictFromKernelLedger:[v4 pid]];
    }
    else
    {
      uint64_t v5 = [a1 _getProcessLedgerDictFromCrashInfo:kcd_addr_begin DataSize:v9];
    }
  }
  v7 = (void *)v5;
LABEL_8:

  return v7;
}

+ (id)_getProcessLedgerForCore:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v5 = [v3 memoryCache];
  int v6 = -[VMUTaskMemoryCache getCoreFileLedgerInternal:]((uint64_t)v5);

  if (!v6)
  {
    v7 = [NSNumber numberWithUnsignedLongLong:0];
    [v4 setObject:v7 forKeyedSubscript:@"internal"];
  }
  v8 = [v3 memoryCache];
  int v9 = -[VMUTaskMemoryCache getCoreFileLedgerInternalCompressed:]((uint64_t)v8);

  if (!v9)
  {
    v10 = [NSNumber numberWithUnsignedLongLong:0];
    [v4 setObject:v10 forKeyedSubscript:@"internal_compressed"];
  }
  v11 = [v3 memoryCache];
  int v12 = -[VMUTaskMemoryCache getCoreFileLedgerIokitMapped:]((uint64_t)v11);

  if (!v12)
  {
    v13 = [NSNumber numberWithUnsignedLongLong:0];
    [v4 setObject:v13 forKeyedSubscript:@"iokit_mapped"];
  }
  v14 = [v3 memoryCache];
  int v15 = -[VMUTaskMemoryCache getCoreFileLedgerAlternateAccounting:]((uint64_t)v14);

  if (!v15)
  {
    v16 = [NSNumber numberWithUnsignedLongLong:0];
    [v4 setObject:v16 forKeyedSubscript:@"alternate_accounting"];
  }
  v17 = [v3 memoryCache];
  int v18 = -[VMUTaskMemoryCache getCoreFileLedgerAlternateAccountingCompressed:]((uint64_t)v17);

  if (!v18)
  {
    v19 = [NSNumber numberWithUnsignedLongLong:0];
    [v4 setObject:v19 forKeyedSubscript:@"alternate_accounting_compressed"];
  }
  v20 = [v3 memoryCache];
  int v21 = -[VMUTaskMemoryCache getCoreFileLedgerPurgeableNonvolatile:]((uint64_t)v20);

  if (!v21)
  {
    v22 = [NSNumber numberWithUnsignedLongLong:0];
    [v4 setObject:v22 forKeyedSubscript:@"purgeable_nonvolatile"];
  }
  v23 = [v3 memoryCache];
  int v24 = -[VMUTaskMemoryCache getCoreFileLedgerPurgeableNonvolatileCompressed:]((uint64_t)v23);

  if (!v24)
  {
    v25 = [NSNumber numberWithUnsignedLongLong:0];
    [v4 setObject:v25 forKeyedSubscript:@"purgeable_nonvolatile_compressed"];
  }
  v26 = [v3 memoryCache];
  int v27 = -[VMUTaskMemoryCache getCoreFileLedgerPhysFootprint:]((uint64_t)v26);

  if (!v27)
  {
    v28 = [NSNumber numberWithUnsignedLongLong:0];
    [v4 setObject:v28 forKeyedSubscript:@"phys_footprint"];
  }
  v29 = [v3 memoryCache];
  int v30 = -[VMUTaskMemoryCache getCoreFileLedgerPhysFootprintLifetimeMax:]((uint64_t)v29);

  if (!v30)
  {
    v31 = [NSNumber numberWithUnsignedLongLong:0];
    [v4 setObject:v31 forKeyedSubscript:@"phys_footprint_lifetime_max"];
  }
  v32 = [v3 memoryCache];
  int v33 = -[VMUTaskMemoryCache getCoreFileLedgerPageTable:]((uint64_t)v32);

  if (!v33)
  {
    v34 = [NSNumber numberWithUnsignedLongLong:0];
    [v4 setObject:v34 forKeyedSubscript:@"page_table"];
  }
  v35 = [v3 memoryCache];
  int v36 = -[VMUTaskMemoryCache getCoreFileLedgerNetworkNonvolatile:]((uint64_t)v35);

  if (!v36)
  {
    v37 = [NSNumber numberWithUnsignedLongLong:0];
    [v4 setObject:v37 forKeyedSubscript:@"network_nonvolatile"];
  }
  v38 = [v3 memoryCache];
  int v39 = -[VMUTaskMemoryCache getCoreFileLedgerNetworkNonvolatileCompressed:]((uint64_t)v38);

  if (!v39)
  {
    v40 = [NSNumber numberWithUnsignedLongLong:0];
    [v4 setObject:v40 forKeyedSubscript:@"network_nonvolatile_compressed"];
  }
  v41 = [v3 memoryCache];
  int v42 = -[VMUTaskMemoryCache getCoreFileLedgerWiredMem:]((uint64_t)v41);

  if (!v42)
  {
    v43 = [NSNumber numberWithUnsignedLongLong:0];
    [v4 setObject:v43 forKeyedSubscript:@"wired_mem"];
  }
  v44 = [v3 memoryCache];
  int v45 = -[VMUTaskMemoryCache getCoreFileLedgerTaggedFootprint:]((uint64_t)v44);

  if (!v45)
  {
    v46 = [NSNumber numberWithUnsignedLongLong:0];
    [v4 setObject:v46 forKeyedSubscript:@"tagged_footprint"];
  }
  v47 = [v3 memoryCache];
  int v48 = -[VMUTaskMemoryCache getCoreFileLedgerTaggedFootprintCompressed:]((uint64_t)v47);

  if (!v48)
  {
    v49 = [NSNumber numberWithUnsignedLongLong:0];
    [v4 setObject:v49 forKeyedSubscript:@"tagged_footprint_compressed"];
  }
  v50 = [v3 memoryCache];
  int v51 = -[VMUTaskMemoryCache getCoreFileLedgerMediaFootprint:]((uint64_t)v50);

  if (!v51)
  {
    v52 = [NSNumber numberWithUnsignedLongLong:0];
    [v4 setObject:v52 forKeyedSubscript:@"media_footprint"];
  }
  v53 = [v3 memoryCache];
  int v54 = -[VMUTaskMemoryCache getCoreFileLedgerMediaFootprintCompressed:]((uint64_t)v53);

  if (!v54)
  {
    v55 = [NSNumber numberWithUnsignedLongLong:0];
    [v4 setObject:v55 forKeyedSubscript:@"media_footprint_compressed"];
  }
  v56 = [v3 memoryCache];
  int v57 = -[VMUTaskMemoryCache getCoreFileLedgerGraphicsFootprint:]((uint64_t)v56);

  if (!v57)
  {
    v58 = [NSNumber numberWithUnsignedLongLong:0];
    [v4 setObject:v58 forKeyedSubscript:@"graphics_footprint"];
  }
  v59 = [v3 memoryCache];
  int v60 = -[VMUTaskMemoryCache getCoreFileLedgerGraphicsFootprintCompressed:]((uint64_t)v59);

  if (!v60)
  {
    v61 = [NSNumber numberWithUnsignedLongLong:0];
    [v4 setObject:v61 forKeyedSubscript:@"graphics_footprint_compressed"];
  }
  v62 = [v3 memoryCache];
  int v63 = -[VMUTaskMemoryCache getCoreFileLedgerNeuralFootprint:]((uint64_t)v62);

  if (!v63)
  {
    v64 = [NSNumber numberWithUnsignedLongLong:0];
    [v4 setObject:v64 forKeyedSubscript:@"neural_footprint"];
  }
  v65 = [v3 memoryCache];
  int v66 = -[VMUTaskMemoryCache getCoreFileLedgerNeuralFootprintCompressed:]((uint64_t)v65);

  if (!v66)
  {
    v67 = [NSNumber numberWithUnsignedLongLong:0];
    [v4 setObject:v67 forKeyedSubscript:@"neural_footprint_compressed"];
  }
  v68 = (void *)[v4 copy];

  return v68;
}

+ (id)_getProcessLedgerDictFromCrashInfo:(unint64_t)a3 DataSize:(unint64_t)a4
{
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (a3 && a4)
  {
    unint64_t v7 = a4 + a3;
    unint64_t v8 = a3 + 16;
    if (a3 + 16 <= a4 + a3 && v8 + *(unsigned int *)(a3 + 4) <= v7 && *(_DWORD *)a3 == -559025833)
    {
      unint64_t v9 = a3;
      do
      {
        if (v8 + *(unsigned int *)(v9 + 4) > v7) {
          break;
        }
        int v10 = *(_DWORD *)v9;
        if (*(_DWORD *)v9 == -242132755) {
          break;
        }
        if ((v10 & 0xFFFFFFF0) == 0x20) {
          int v10 = 17;
        }
        switch(v10)
        {
          case 2078:
            v11 = [NSNumber numberWithUnsignedLongLong:*(void *)(v9 + 16)];
            int v12 = v6;
            v13 = v11;
            v14 = @"internal";
            goto LABEL_33;
          case 2079:
            v11 = [NSNumber numberWithUnsignedLongLong:*(void *)(v9 + 16)];
            int v12 = v6;
            v13 = v11;
            v14 = @"internal_compressed";
            goto LABEL_33;
          case 2080:
            v11 = [NSNumber numberWithUnsignedLongLong:*(void *)(v9 + 16)];
            int v12 = v6;
            v13 = v11;
            v14 = @"iokit_mapped";
            goto LABEL_33;
          case 2081:
            v11 = [NSNumber numberWithUnsignedLongLong:*(void *)(v9 + 16)];
            int v12 = v6;
            v13 = v11;
            v14 = @"alternate_accounting";
            goto LABEL_33;
          case 2082:
            v11 = [NSNumber numberWithUnsignedLongLong:*(void *)(v9 + 16)];
            int v12 = v6;
            v13 = v11;
            v14 = @"alternate_accounting_compressed";
            goto LABEL_33;
          case 2083:
            v11 = [NSNumber numberWithUnsignedLongLong:*(void *)(v9 + 16)];
            int v12 = v6;
            v13 = v11;
            v14 = @"purgeable_nonvolatile";
            goto LABEL_33;
          case 2084:
            v11 = [NSNumber numberWithUnsignedLongLong:*(void *)(v9 + 16)];
            int v12 = v6;
            v13 = v11;
            v14 = @"purgeable_nonvolatile_compressed";
            goto LABEL_33;
          case 2085:
            v11 = [NSNumber numberWithUnsignedLongLong:*(void *)(v9 + 16)];
            int v12 = v6;
            v13 = v11;
            v14 = @"page_table";
            goto LABEL_33;
          case 2086:
            v11 = [NSNumber numberWithUnsignedLongLong:*(void *)(v9 + 16)];
            int v12 = v6;
            v13 = v11;
            v14 = @"phys_footprint";
            goto LABEL_33;
          case 2087:
            v11 = [NSNumber numberWithUnsignedLongLong:*(void *)(v9 + 16)];
            int v12 = v6;
            v13 = v11;
            v14 = @"phys_footprint_lifetime_max";
            goto LABEL_33;
          case 2088:
            v11 = [NSNumber numberWithUnsignedLongLong:*(void *)(v9 + 16)];
            int v12 = v6;
            v13 = v11;
            v14 = @"network_nonvolatile";
            goto LABEL_33;
          case 2089:
            v11 = [NSNumber numberWithUnsignedLongLong:*(void *)(v9 + 16)];
            int v12 = v6;
            v13 = v11;
            v14 = @"network_nonvolatile_compressed";
            goto LABEL_33;
          case 2090:
            v11 = [NSNumber numberWithUnsignedLongLong:*(void *)(v9 + 16)];
            int v12 = v6;
            v13 = v11;
            v14 = @"wired_mem";
            goto LABEL_33;
          case 2093:
            v11 = [NSNumber numberWithUnsignedLongLong:*(void *)(v9 + 16)];
            int v12 = v6;
            v13 = v11;
            v14 = @"tagged_footprint";
            goto LABEL_33;
          case 2094:
            v11 = [NSNumber numberWithUnsignedLongLong:*(void *)(v9 + 16)];
            int v12 = v6;
            v13 = v11;
            v14 = @"tagged_footprint_compressed";
            goto LABEL_33;
          case 2095:
            v11 = [NSNumber numberWithUnsignedLongLong:*(void *)(v9 + 16)];
            int v12 = v6;
            v13 = v11;
            v14 = @"media_footprint";
            goto LABEL_33;
          case 2096:
            v11 = [NSNumber numberWithUnsignedLongLong:*(void *)(v9 + 16)];
            int v12 = v6;
            v13 = v11;
            v14 = @"media_footprint_compressed";
            goto LABEL_33;
          case 2097:
            v11 = [NSNumber numberWithUnsignedLongLong:*(void *)(v9 + 16)];
            int v12 = v6;
            v13 = v11;
            v14 = @"graphics_footprint";
            goto LABEL_33;
          case 2098:
            v11 = [NSNumber numberWithUnsignedLongLong:*(void *)(v9 + 16)];
            int v12 = v6;
            v13 = v11;
            v14 = @"graphics_footprint_compressed";
            goto LABEL_33;
          case 2099:
            v11 = [NSNumber numberWithUnsignedLongLong:*(void *)(v9 + 16)];
            int v12 = v6;
            v13 = v11;
            v14 = @"neural_footprint";
            goto LABEL_33;
          case 2100:
            v11 = [NSNumber numberWithUnsignedLongLong:*(void *)(v9 + 16)];
            int v12 = v6;
            v13 = v11;
            v14 = @"neural_footprint_compressed";
LABEL_33:
            [v12 setObject:v13 forKeyedSubscript:v14];

            break;
          default:
            break;
        }
        unint64_t v9 = v8 + *(unsigned int *)(v9 + 4);
        unint64_t v8 = v9 + 16;
      }
      while (v9 + 16 <= v7);
    }
    else
    {
      NSLog(&cfstr_InvalidTaskCor.isa);
    }
    mach_vm_deallocate(*MEMORY[0x1E4F14960], a3, a4);
  }
  int v15 = (void *)[v6 copy];

  return v15;
}

+ (id)_getProcessLedgerDictFromKernelLedger:(int)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  *(_OWORD *)buffer = 0u;
  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (!proc_pid_rusage(a3, 6, buffer))
  {
    id v4 = [NSNumber numberWithUnsignedLongLong:(void)v35];
    [v18 setObject:v4 forKeyedSubscript:@"phys_footprint_lifetime_max"];
  }
  uint64_t v5 = 0;
  uint64_t v6 = 40;
  do
  {
    uint64_t v7 = 2 * v6;
    uint64_t v19 = 2 * v6;
    uint64_t v5 = (char *)malloc_type_realloc(v5, 192 * v6, 0x1000040565EDBD2uLL);
    if ((ledger() & 0x80000000) != 0)
    {
      free(v5);
      NSLog(&cfstr_UnableToRetrie.isa);
LABEL_20:
      int v15 = 0;
      goto LABEL_21;
    }
    uint64_t v6 = v7;
  }
  while (v7 == v19);
  unint64_t v8 = (char *)malloc_type_malloc(48 * v19, 0x1000040EED21634uLL);
  if ((ledger() & 0x80000000) != 0)
  {
    free(v8);
    free(v5);
    NSLog(&cfstr_UnableToRetrie_0.isa);
    goto LABEL_20;
  }
  if (v19 >= 1)
  {
    uint64_t v9 = 0;
    v17 = v8;
    do
    {
      uint64_t v10 = 0;
      v11 = &v8[48 * v9];
      do
      {
        if (!strcmp(ledgerNameDict[v10], &v5[96 * v9]))
        {
          if (!strcmp(&v5[96 * v9], "purgeable_nonvolatile_compress")) {
            int v12 = "purgeable_nonvolatile_compressed";
          }
          else {
            int v12 = &v5[96 * v9];
          }
          v13 = [NSNumber numberWithLongLong:*(void *)v11];
          v14 = [NSString stringWithUTF8String:v12];
          [v18 setObject:v13 forKeyedSubscript:v14];
        }
        ++v10;
      }
      while (v10 != 22);
      ++v9;
      unint64_t v8 = v17;
    }
    while (v9 < v19);
  }
  free(v5);
  free(v8);
  int v15 = (void *)[v18 copy];
LABEL_21:

  return v15;
}

@end