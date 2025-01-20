@interface FPMemgraphProcess
+ (id)processWithMemgraph:(id)a3 error:(id *)p_isa;
- (BOOL)_configurePageSize;
- (BOOL)_isAlive;
- (BOOL)_populateMemoryRegionWithPageQueries:(id)a3 regionInfo:(vm_region_submap_info_64 *)a4;
- (BOOL)_populateTask;
- (BOOL)breakDownPhysFootprint;
- (BOOL)doOwnedAccountingAdjustments;
- (id)_gatherOwnedVmObjects;
- (id)extendedInfoForRegionType:(int)a3 at:(unint64_t)a4 extendedInfoProvider:(id)a5;
- (unint64_t)_gatherPageSize;
- (void)_gatherIsTranslated;
- (void)_gatherLedgers;
- (void)_gatherPhysFootprint;
- (void)_gatherProcessState;
- (void)enumerateRegions:(id)a3;
@end

@implementation FPMemgraphProcess

+ (id)processWithMemgraph:(id)a3 error:(id *)p_isa
{
  id v5 = a3;
  v6 = [FPMemgraphProcess alloc];
  if (v6)
  {
    v7 = v6;
    v8 = +[NSData dataWithContentsOfURL:v5 options:1 error:p_isa];
    if (v8)
    {
      uint64_t v9 = +[VMUProcessObjectGraph directedGraphWithData:v8 error:p_isa];
      v10 = *(void **)(&v7->super._bailedOut + 1);
      *(void *)(&v7->super._bailedOut + 1) = v9;

      v11 = *(void **)(&v7->super._bailedOut + 1);
      if (v11)
      {
        uint64_t v38 = 0;
        memset(v37, 0, sizeof(v37));
        if ([v11 is64bit]) {
          int v12 = 16;
        }
        else {
          int v12 = 0;
        }
        LODWORD(v37[0]) = v12;
        HIDWORD(v37[0]) = [*(id *)(&v7->super._bailedOut + 1) pid];
        v13 = [(FPUserProcess *)v7 initWithBsdInfo:v37];
        v14 = v13;
        if (!v13) {
          goto LABEL_31;
        }
        v15 = [*(id *)(&v13->super._bailedOut + 1) processName];
        [(FPProcess *)v14 setName:v15];

        v16 = [(FPProcess *)v14 name];
        v17 = +[NSString stringWithFormat:@"%@ [%d] (memgraph)", v16, [(FPProcess *)v14 pid]];
        [(FPProcess *)v14 setDisplayString:v17];

        [*(id *)(&v14->super._bailedOut + 1) dyldSharedCacheRange];
        if (v18)
        {
          v19 = [FPSharedCache alloc];
          v20 = +[NSUUID UUID];
          id v21 = [*(id *)(&v14->super._bailedOut + 1) dyldSharedCacheRange];
          [*(id *)(&v14->super._bailedOut + 1) dyldSharedCacheRange];
          v23 = sub_1000054F8((id *)&v19->super.isa, v20, v21, v22, 0);
          sharedCache = v14->super.super._sharedCache;
          v14->super.super._sharedCache = (FPSharedCache *)v23;

          v25 = v23;
        }
        else
        {
          id v27 = [*(id *)(&v14->super._bailedOut + 1) processDescriptionString];
          if ([v27 containsString:@"X86-64"])
          {

            uint64_t v28 = 0x7FE000000;
            uint64_t v29 = 0x7FF800000000;
          }
          else if ([v27 containsString:@"X86"])
          {

            uint64_t v28 = 0x20000000;
            uint64_t v29 = 2415919104;
          }
          else if ([v27 containsString:@"ARM64_32"])
          {

            uint64_t v28 = 2281701376;
            uint64_t v29 = 436207616;
          }
          else if ([v27 containsString:@"ARM64"])
          {

            uint64_t v29 = 0x180000000;
            uint64_t v28 = 0x180000000;
          }
          else
          {
            unsigned int v30 = [v27 containsString:@"ARM"];

            if (!v30)
            {
              fwrite("Unable to determine platform architecture of target\n", 0x34uLL, 1uLL, __stderrp);
              v25 = 0;
              goto LABEL_30;
            }
            v31 = [*(id *)(&v14->super._bailedOut + 1) binaryImagesDescription];
            unsigned int v32 = [v31 containsString:@"arm64_32"];

            if (v32) {
              uint64_t v29 = 436207616;
            }
            else {
              uint64_t v29 = 0x40000000;
            }
            if (v32) {
              uint64_t v28 = 2281701376;
            }
            else {
              uint64_t v28 = 0x40000000;
            }
          }
          v33 = [FPSharedCache alloc];
          v34 = +[NSUUID UUID];
          v25 = sub_1000054F8((id *)&v33->super.isa, v34, (void *)v29, (void *)v28, 0);
        }
LABEL_30:
        v35 = v14->super.super._sharedCache;
        v14->super.super._sharedCache = (FPSharedCache *)v25;

LABEL_31:
        v7 = v14;
        p_isa = (id *)&v7->super.super.super.isa;
        goto LABEL_32;
      }
      if (!p_isa)
      {
LABEL_32:

        goto LABEL_33;
      }
      if (!*p_isa)
      {
        NSErrorUserInfoKey v39 = NSLocalizedDescriptionKey;
        *(void *)&v37[0] = @"memgraph initialization failed with unknown error";
        v26 = +[NSDictionary dictionaryWithObjects:v37 forKeys:&v39 count:1];
        *p_isa = +[NSError errorWithDomain:@"FootprintErrorDomain" code:1 userInfo:v26];
      }
    }
    p_isa = 0;
    goto LABEL_32;
  }
  p_isa = 0;
LABEL_33:

  return p_isa;
}

- (unint64_t)_gatherPageSize
{
  unsigned int v3 = [*(id *)(&self->super._bailedOut + 1) isTranslatedByRosetta];
  v4 = *(void **)(&self->super._bailedOut + 1);
  if (v3) {
    LODWORD(result) = [v4 vmPageSize];
  }
  else {
    LODWORD(result) = [v4 kernelPageSize];
  }
  return result;
}

- (BOOL)doOwnedAccountingAdjustments
{
  v5.receiver = self;
  v5.super_class = (Class)FPMemgraphProcess;
  unsigned int v3 = [(FPUserProcess *)&v5 doOwnedAccountingAdjustments];
  if (v3) {
    LOBYTE(v3) = [*(id *)(&self->super._bailedOut + 1) didPhysFootprintDirtyAccounting] ^ 1;
  }
  return v3;
}

- (BOOL)_populateMemoryRegionWithPageQueries:(id)a3 regionInfo:(vm_region_submap_info_64 *)a4
{
  id v5 = a3;
  if ([v5 dirtySize]) {
    __assert_rtn("-[FPMemgraphProcess _populateMemoryRegionWithPageQueries:regionInfo:]", "FPMemgraphProcess.m", 149, "memoryRegion.dirtySize == 0");
  }
  if ([v5 swappedSize]) {
    __assert_rtn("-[FPMemgraphProcess _populateMemoryRegionWithPageQueries:regionInfo:]", "FPMemgraphProcess.m", 150, "memoryRegion.swappedSize == 0");
  }
  [v5 setDirtySize:a4->pages_dirtied];
  [v5 setSwappedSize:a4->pages_swapped_out];

  return 1;
}

- (void)enumerateRegions:(id)a3
{
  id v4 = a3;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = sub_100004238;
  v11[4] = sub_100004248;
  id v12 = 0;
  if (self) {
    id v5 = *(void **)(&self->super._bailedOut + 1);
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100004250;
  v8[3] = &unk_100028848;
  v8[4] = self;
  v10 = v11;
  id v7 = v4;
  id v9 = v7;
  [v6 enumerateRegionsWithBlock:v8];

  _Block_object_dispose(v11, 8);
}

- (void)_gatherPhysFootprint
{
  self->super._ledgers[1] = (unint64_t)[*(id *)(&self->super._bailedOut + 1) physicalFootprint];
  self->super._ledgers[2] = (unint64_t)[*(id *)(&self->super._bailedOut + 1) physicalFootprintPeak];
}

- (void)_gatherLedgers
{
  unsigned int v3 = *(void **)(&self->super._bailedOut + 1);
  id v4 = +[NSString stringWithUTF8String:"page_table"];
  id v5 = [v3 ledgerValueForKey:v4 keyExists:0];
  ledgers = self->super._ledgers;
  self->super._ledgers[0] = (unint64_t)v5;

  id v7 = *(void **)(&self->super._bailedOut + 1);
  id v8 = +[NSString stringWithUTF8String:"conclave_mem"];
  ledgers[3] = (unint64_t)[v7 ledgerValueForKey:v8 keyExists:0];
}

- (void)_gatherProcessState
{
  unsigned int v3 = [*(id *)(&self->super._bailedOut + 1) idleExitStatus];
  if (v3 - 1 >= 3) {
    int v4 = 0;
  }
  else {
    int v4 = v3;
  }
  self->super.super._idleExitStatus = v4;
}

- (id)_gatherOwnedVmObjects
{
  return 0;
}

- (BOOL)_populateTask
{
  return 1;
}

- (BOOL)_isAlive
{
  return 0;
}

- (BOOL)breakDownPhysFootprint
{
  return [*(id *)(&self->super._bailedOut + 1) showsPhysFootprint];
}

- (void)_gatherIsTranslated
{
  self->super.super._isTranslated = [*(id *)(&self->super._bailedOut + 1) isTranslatedByRosetta];
}

- (BOOL)_configurePageSize
{
  return 1;
}

- (id)extendedInfoForRegionType:(int)a3 at:(unint64_t)a4 extendedInfoProvider:(id)a5
{
  return 0;
}

- (void).cxx_destruct
{
}

@end