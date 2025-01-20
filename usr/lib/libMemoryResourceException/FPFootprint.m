@interface FPFootprint
+ (BOOL)breakDownPhysFootprint;
+ (BOOL)isSharingAnalysisDisabled;
+ (id)installCancelHandler:(id)a3;
+ (int)vmRegionInfoFlags;
+ (void)setBreakDownPhysFootprint:(BOOL)a3;
+ (void)setSharingAnalysisDisabled:(BOOL)a3;
+ (void)setVmRegionInfoFlags:(int)a3;
- (BOOL)gatherData;
- (BOOL)gatherData:(unint64_t)a3;
- (FPFootprint)initWithProcesses:(id)a3;
- (FPTime)gatherEndTime;
- (FPTime)gatherStartTime;
- (NSArray)processes;
- (id)ioAccelMemoryInfoDetailsAtAddress:(unint64_t)a3 for:(int)a4 error:(id *)a5;
- (id)ioSurfaceExtendedInfoDetailsAtAddress:(unint64_t)a3 for:(int)a4;
- (unsigned)qualityOfService;
- (void)addOutputFormatter:(id)a3;
- (void)analyzeData;
- (void)cancel;
- (void)dealloc;
- (void)printOutputVerbose:(BOOL)a3 summarize:(BOOL)a4 noCategories:(BOOL)a5;
- (void)setQualityOfService:(unsigned int)a3;
@end

@implementation FPFootprint

+ (BOOL)breakDownPhysFootprint
{
  int v2 = byte_26AB1E250;
  if (byte_26AB1E250 == 2)
  {
    int v5 = 0;
    size_t v4 = 4;
    if (sysctlbyname("vm.self_region_footprint", &v5, &v4, 0, 0) && *__error() != 2)
    {
      perror("Unable to retrieve status of physical footprint data collection");
      int v5 = 0;
    }
    int v2 = v5 != 0;
    byte_26AB1E250 = v5 != 0;
  }
  return v2 == 1;
}

+ (void)setBreakDownPhysFootprint:(BOOL)a3
{
  BOOL v3 = a3;
  if (sysctlbyname("vm.self_region_footprint", 0, 0, &v3, 4uLL) && *__error() != 2) {
    perror("Unable to configure physical footprint data collection");
  }
  byte_26AB1E250 = 2;
}

+ (int)vmRegionInfoFlags
{
  int v4 = 0;
  size_t v3 = 4;
  if (sysctlbyname("vm.self_region_info_flags", &v4, &v3, 0, 0) && *__error() != 2) {
    perror("Unable to retrieve current VM region info flags");
  }
  return v4;
}

+ (void)setVmRegionInfoFlags:(int)a3
{
  int v3 = a3;
  if (sysctlbyname("vm.self_region_info_flags", 0, 0, &v3, 4uLL))
  {
    if (*__error() != 2) {
      perror("Unable to configure VM region info flags");
    }
  }
}

+ (BOOL)isSharingAnalysisDisabled
{
  return byte_26AB1E350;
}

+ (void)setSharingAnalysisDisabled:(BOOL)a3
{
  byte_26AB1E350 = a3;
}

- (FPFootprint)initWithProcesses:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FPFootprint;
  v6 = [(FPFootprint *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_processes, a3);
    v7->_earlyExit = 0;
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    outputFormatters = v7->_outputFormatters;
    v7->_outputFormatters = v8;

    v7->_qualityOfService = 17;
    v7->_allPIDsIOSurfaceDescriptionsLock._os_unfair_lock_opaque = 0;
    v7->_allPIDsIOAccelMemoryInfosLock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (void)dealloc
{
  memoryObjects = self->_memoryObjects;
  if (memoryObjects) {
    CFRelease(memoryObjects);
  }
  sharedCacheMemoryObjectsTable = self->_sharedCacheMemoryObjectsTable;
  self->_sharedCacheMemoryObjectsTable = 0;

  textMemoryObjects = self->_textMemoryObjects;
  if (textMemoryObjects) {
    CFRelease(textMemoryObjects);
  }
  linkeditMemoryObjects = self->_linkeditMemoryObjects;
  if (linkeditMemoryObjects) {
    CFRelease(linkeditMemoryObjects);
  }
  v7.receiver = self;
  v7.super_class = (Class)FPFootprint;
  [(FPFootprint *)&v7 dealloc];
}

+ (id)installCancelHandler:(id)a3
{
  id v3 = a3;
  int v4 = dispatch_source_create(MEMORY[0x263EF83F0], 2uLL, 0, 0);
  dispatch_source_set_event_handler(v4, v3);

  signal(2, (void (__cdecl *)(int))1);
  dispatch_resume(v4);

  return v4;
}

- (void)cancel
{
  self->_earlyExit = 1;
}

- (BOOL)gatherData
{
  return [(FPFootprint *)self gatherData:1];
}

- (BOOL)gatherData:(unint64_t)a3
{
  id v5 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x263EF83A8], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v6 = dispatch_queue_attr_make_with_qos_class(v5, (dispatch_qos_class_t)self->_qualityOfService, 0);

  objc_super v7 = dispatch_queue_create("com.apple.footprint.gatherdata", v6);
  id v8 = [(FPFootprint *)self processes];
  self;
  v9 = [v8 sortedArrayUsingComparator:&unk_26CFD2630];

  v10 = +[FPTime now];
  gatherStartTime = self->_gatherStartTime;
  self->_gatherStartTime = v10;

  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  size_t v12 = [v9 count];
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  v21 = sub_21E866724;
  v22 = &unk_2644CAF78;
  v23 = self;
  v25 = &v27;
  id v13 = v9;
  id v24 = v13;
  unint64_t v26 = a3;
  dispatch_apply(v12, v7, &v19);
  if (*((unsigned char *)v28 + 24))
  {
    v14 = [v13 lastObject:v19, v20, v21, v22, v23];
    [v14 _addGlobalError:@"Footprint exited early due to SIGINT and did not finish gathering all data"];
  }
  v15 = +[FPTime now];
  gatherEndTime = self->_gatherEndTime;
  self->_gatherEndTime = v15;

  char v17 = *((unsigned char *)v28 + 24);
  _Block_object_dispose(&v27, 8);

  return v17;
}

- (void)analyzeData
{
  uint64_t v131 = *MEMORY[0x263EF8340];
  id v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  pidToFootprint = self->_pidToFootprint;
  self->_pidToFootprint = v3;

  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  NSUInteger v6 = [(NSArray *)self->_processes count];
  objc_super v7 = (const CFDictionaryValueCallBacks *)MEMORY[0x263EFFF90];
  self->_memoryObjects = CFDictionaryCreateMutable(v5, 100 * v6, &stru_26CFD2600, MEMORY[0x263EFFF90]);
  id v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  sharedCacheMemoryObjectsTable = self->_sharedCacheMemoryObjectsTable;
  self->_sharedCacheMemoryObjectsTable = v8;

  self->_textMemoryObjects = CFDictionaryCreateMutable(v5, 2 * [(NSArray *)self->_processes count], &stru_26CFD2600, v7);
  CFAllocatorRef allocator = v5;
  self->_CFDictionaryRef linkeditMemoryObjects = CFDictionaryCreateMutable(v5, 2 * [(NSArray *)self->_processes count], &stru_26CFD2600, v7);
  long long v104 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  v103 = self;
  v10 = self->_processes;
  uint64_t v84 = [(NSArray *)v10 countByEnumeratingWithState:&v104 objects:v120 count:16];
  if (v84)
  {
    uint64_t v85 = *(void *)v105;
    v83 = v10;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v105 != v85) {
          objc_enumerationMutation(v10);
        }
        id v12 = *(id *)(*((void *)&v104 + 1) + 8 * v11);
        obuint64_t j = +[FPFootprint breakDownPhysFootprint];
        uint64_t v88 = [v12 pageSize];
        uint64_t v87 = *MEMORY[0x263EF8AE0];
        id v95 = v12;
        id v13 = [v12 sharedCache];
        context = (void *)[v13 baseAddress];
        uint64_t v86 = v11;
        if (v13)
        {
          v14 = v103->_sharedCacheMemoryObjectsTable;
          v15 = [v13 uuid];
          v16 = [(NSMutableDictionary *)v14 objectForKeyedSubscript:v15];

          CFDictionaryRef v93 = (const __CFDictionary *)v16;
          if (!v16)
          {
            CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(allocator, 0, &stru_26CFD2600, MEMORY[0x263EFFF90]);
            v18 = v103->_sharedCacheMemoryObjectsTable;
            uint64_t v19 = [v13 uuid];
            [(NSMutableDictionary *)v18 setObject:Mutable forKeyedSubscript:v19];

            CFDictionaryRef v93 = Mutable;
          }
        }
        else
        {
          CFDictionaryRef v93 = 0;
        }
        long long v128 = 0u;
        long long v129 = 0u;
        long long v126 = 0u;
        long long v127 = 0u;
        uint64_t v20 = [v95 memoryRegions:v83];
        uint64_t v21 = [v20 countByEnumeratingWithState:&v126 objects:v130 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v127;
          uint64_t v90 = *(void *)v127;
          do
          {
            uint64_t v24 = 0;
            uint64_t v100 = v22;
            do
            {
              if (*(void *)v127 != v23) {
                objc_enumerationMutation(v20);
              }
              v25 = *(void **)(*((void *)&v126 + 1) + 8 * v24);
              if ([v25 inSharedCache])
              {
                if (!v13)
                {
                  _os_assert_log();
                  _os_crash();
                  __break(1u);
                }
                if ([v25 privateSharedCacheRegion])
                {
LABEL_25:
                  [v25 setMemoryObject:v25];
                  goto LABEL_44;
                }
                CFDictionaryRef linkeditMemoryObjects = v93;
                uint64_t v27 = (const void *)([v25 start] - (void)context + 1);
              }
              else
              {
                uint64_t v27 = (const void *)[v25 object_id];
                int v28 = [v25 segment];
                if (v28 == 4)
                {
                  CFDictionaryRef linkeditMemoryObjects = v103->_linkeditMemoryObjects;
                }
                else if (v28 == 2)
                {
                  CFDictionaryRef linkeditMemoryObjects = v103->_textMemoryObjects;
                }
                else
                {
                  CFDictionaryRef linkeditMemoryObjects = v103->_memoryObjects;
                }
              }
              if ((unint64_t)v27 + 1 <= 1) {
                goto LABEL_25;
              }
              if (obj) {
                int v29 = [v25 ownedExclusivelyByParentProcess];
              }
              else {
                int v29 = 0;
              }
              char v30 = CFDictionaryGetValue(linkeditMemoryObjects, v27);
              if (!v30)
              {
                if ((v29 & 1) != 0 || ([v25 eligibleForProcessView] & 1) != 0 || v88 != v87) {
                  v31 = objc_alloc_init(FPMemoryObject);
                }
                else {
                  v31 = v25;
                }
                char v30 = v31;
                CFDictionaryAddValue(linkeditMemoryObjects, v27, v31);
              }
              id v32 = v25;
              if (v30 != v25)
              {
                v33 = v20;
                v34 = v13;
                v35 = [v30 ensureMemoryObject];
                v36 = v35;
                if (v35 == v30)
                {
                  id v32 = v30;
                }
                else
                {
                  id v32 = v35;

                  CFDictionaryReplaceValue(linkeditMemoryObjects, v27, v32);
                }
                sub_21E862CC0((uint64_t)v36, v25, v95);
                if (v29) {
                  [v36 setOwnerPid:[v95 pid]];
                }

                id v13 = v34;
                uint64_t v20 = v33;
                uint64_t v23 = v90;
              }
              [v25 setMemoryObject:v32];

              uint64_t v22 = v100;
LABEL_44:
              ++v24;
            }
            while (v22 != v24);
            uint64_t v22 = [v20 countByEnumeratingWithState:&v126 objects:v130 count:16];
          }
          while (v22);
        }

        uint64_t v11 = v86 + 1;
        v10 = v83;
      }
      while (v86 + 1 != v84);
      uint64_t v84 = [(NSArray *)v83 countByEnumeratingWithState:&v104 objects:v120 count:16];
    }
    while (v84);
  }

  contexta = (void *)MEMORY[0x223C32890]();
  textMemoryObjects = v103->_textMemoryObjects;
  v38 = v103->_linkeditMemoryObjects;
  v125[0] = v103->_memoryObjects;
  v125[1] = textMemoryObjects;
  v125[2] = v38;
  v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:v125 count:3];
  v40 = (void *)[v39 mutableCopy];

  long long v118 = 0u;
  long long v119 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  v41 = [(NSMutableDictionary *)v103->_sharedCacheMemoryObjectsTable objectEnumerator];
  uint64_t v42 = [v41 countByEnumeratingWithState:&v116 objects:v130 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v117;
    do
    {
      for (uint64_t i = 0; i != v43; ++i)
      {
        if (*(void *)v117 != v44) {
          objc_enumerationMutation(v41);
        }
        [v40 addObject:*(void *)(*((void *)&v116 + 1) + 8 * i)];
      }
      uint64_t v43 = [v41 countByEnumeratingWithState:&v116 objects:v130 count:16];
    }
    while (v43);
  }

  long long v114 = 0u;
  long long v115 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  id obja = v40;
  uint64_t v46 = [obja countByEnumeratingWithState:&v112 objects:&v126 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v101 = *(void *)v113;
    do
    {
      for (uint64_t j = 0; j != v47; ++j)
      {
        if (*(void *)v113 != v101) {
          objc_enumerationMutation(obja);
        }
        v49 = *(void **)(*((void *)&v112 + 1) + 8 * j);
        v50 = CFArrayCreateMutable(allocator, 0, 0);
        v51 = (void *)MEMORY[0x223C32890]();
        long long v108 = 0u;
        long long v109 = 0u;
        long long v110 = 0u;
        long long v111 = 0u;
        id v52 = v49;
        uint64_t v53 = [v52 countByEnumeratingWithState:&v108 objects:&v121 count:16];
        if (v53)
        {
          uint64_t v54 = v53;
          uint64_t v55 = *(void *)v109;
          do
          {
            for (uint64_t k = 0; k != v54; ++k)
            {
              if (*(void *)v109 != v55) {
                objc_enumerationMutation(v52);
              }
              v57 = *(const void **)(*((void *)&v108 + 1) + 8 * k);
              v58 = CFDictionaryGetValue((CFDictionaryRef)v52, v57);
              if (([v58 finalizeObject] & 1) == 0) {
                CFArrayAppendValue(v50, v57);
              }
            }
            uint64_t v54 = [v52 countByEnumeratingWithState:&v108 objects:&v121 count:16];
          }
          while (v54);
        }

        [v52 removeObjectsForKeys:v50];
        if (v50) {
          CFRelease(v50);
        }
      }
      uint64_t v47 = [obja countByEnumeratingWithState:&v112 objects:&v126 count:16];
    }
    while (v47);
  }

  [(NSMutableDictionary *)v103->_pidToFootprint removeAllObjects];
  long long v118 = 0u;
  long long v119 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  sub_21E868D50(v103);
  id v96 = (id)objc_claimAutoreleasedReturnValue();
  id objb = (id)[v96 countByEnumeratingWithState:&v116 objects:&v126 count:16];
  if (objb)
  {
    uint64_t v59 = *(void *)v117;
    uint64_t v94 = *(void *)v117;
    do
    {
      for (m = 0; m != objb; m = (char *)m + 1)
      {
        if (*(void *)v117 != v59) {
          objc_enumerationMutation(v96);
        }
        v61 = NSNumber;
        id v62 = *(id *)(*((void *)&v116 + 1) + 8 * (void)m);
        if (+[FPFootprint breakDownPhysFootprint])
        {
          long long v123 = 0u;
          long long v124 = 0u;
          long long v121 = 0u;
          long long v122 = 0u;
          v63 = [v62 memoryRegions];
          uint64_t v64 = [v63 countByEnumeratingWithState:&v121 objects:v130 count:16];
          if (!v64)
          {
            uint64_t v66 = 0;
            goto LABEL_101;
          }
          uint64_t v65 = v64;
          v102 = v61;
          uint64_t v66 = 0;
          uint64_t v67 = *(void *)v122;
          do
          {
            for (uint64_t n = 0; n != v65; ++n)
            {
              if (*(void *)v122 != v67) {
                objc_enumerationMutation(v63);
              }
              v69 = *(void **)(*((void *)&v121 + 1) + 8 * n);
              uint64_t v70 = [v69 dirtySize];
              v66 += v70 + [v69 swappedSize];
            }
            uint64_t v65 = [v63 countByEnumeratingWithState:&v121 objects:v130 count:16];
          }
          while (v65);
        }
        else
        {
          v102 = v61;
          id v71 = objc_alloc(MEMORY[0x263EFF9C0]);
          v72 = [v62 memoryRegions];
          v63 = [v71 initWithCapacity:[v72 count]];

          long long v123 = 0u;
          long long v124 = 0u;
          long long v121 = 0u;
          long long v122 = 0u;
          v73 = [v62 memoryRegions];
          uint64_t v74 = [v73 countByEnumeratingWithState:&v121 objects:v130 count:16];
          if (v74)
          {
            uint64_t v75 = v74;
            uint64_t v66 = 0;
            uint64_t v76 = *(void *)v122;
            do
            {
              for (iuint64_t i = 0; ii != v75; ++ii)
              {
                if (*(void *)v122 != v76) {
                  objc_enumerationMutation(v73);
                }
                v78 = [*(id *)(*((void *)&v121 + 1) + 8 * ii) memoryObject];
                if (([v63 containsObject:v78] & 1) == 0)
                {
                  uint64_t v79 = [v78 dirtySize];
                  v66 += v79 + [v78 swappedSize];
                  [v63 addObject:v78];
                }
              }
              uint64_t v75 = [v73 countByEnumeratingWithState:&v121 objects:v130 count:16];
            }
            while (v75);
          }
          else
          {
            uint64_t v66 = 0;
          }

          uint64_t v59 = v94;
        }
        v61 = v102;
LABEL_101:

        v80 = [v61 numberWithUnsignedLongLong:v66];
        v81 = v103->_pidToFootprint;
        v82 = [NSNumber numberWithInt:[v62 pid]];
        [(NSMutableDictionary *)v81 setObject:v80 forKeyedSubscript:v82];
      }
      id objb = (id)[v96 countByEnumeratingWithState:&v116 objects:&v126 count:16];
    }
    while (objb);
  }
}

- (void)addOutputFormatter:(id)a3
{
}

- (void)printOutputVerbose:(BOOL)a3 summarize:(BOOL)a4 noCategories:(BOOL)a5
{
  BOOL v211 = a5;
  BOOL v221 = a4;
  BOOL v5 = a3;
  NSUInteger v6 = self;
  uint64_t v361 = *MEMORY[0x263EF8340];
  objc_super v7 = sub_21E868D50(self);
  id v8 = v7;
  if (v6)
  {
    *(void *)&long long v358 = MEMORY[0x263EF8330];
    *((void *)&v358 + 1) = 3221225472;
    *(void *)&long long v359 = sub_21E86947C;
    *((void *)&v359 + 1) = &unk_2644CAFE8;
    *(void *)&long long v360 = v6;
    v9 = [v7 sortedArrayUsingComparator:&v358];
  }
  else
  {
    v9 = 0;
  }

  long long v295 = 0u;
  long long v296 = 0u;
  long long v293 = 0u;
  long long v294 = 0u;
  v10 = v6->_outputFormatters;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v293 objects:v340 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v294;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v294 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v293 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v15 startAtTime:v6->_gatherStartTime];
        }
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v293 objects:v340 count:16];
    }
    while (v12);
  }

  uint64_t v226 = (uint64_t)v6;
  if (v5)
  {
    id v16 = v9;
    if (v6)
    {
      id v241 = (id)objc_opt_new();
      long long v349 = 0u;
      long long v350 = 0u;
      long long v351 = 0u;
      long long v352 = 0u;
      char v17 = v6->_outputFormatters;
      uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v349 objects:&v358 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v350;
        do
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v350 != v20) {
              objc_enumerationMutation(v17);
            }
            uint64_t v22 = *(void *)(*((void *)&v349 + 1) + 8 * j);
            if (objc_opt_respondsToSelector()) {
              [v241 addObject:v22];
            }
          }
          uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v349 objects:&v358 count:16];
        }
        while (v19);
      }

      if ([v241 count])
      {
        v216 = v9;
        long long v348 = 0u;
        long long v347 = 0u;
        long long v346 = 0u;
        long long v345 = 0u;
        id v227 = v16;
        obuint64_t j = v16;
        uint64_t v23 = [obj countByEnumeratingWithState:&v345 objects:v357 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v235 = *(void *)v346;
          do
          {
            for (uint64_t k = 0; k != v24; ++k)
            {
              if (*(void *)v346 != v235) {
                objc_enumerationMutation(obj);
              }
              unint64_t v26 = *(void **)(*((void *)&v345 + 1) + 8 * k);
              long long v341 = 0u;
              long long v342 = 0u;
              long long v343 = 0u;
              long long v344 = 0u;
              id v27 = v241;
              uint64_t v28 = [v27 countByEnumeratingWithState:&v341 objects:&v353 count:16];
              if (v28)
              {
                uint64_t v29 = v28;
                uint64_t v30 = *(void *)v342;
                do
                {
                  for (uint64_t m = 0; m != v29; ++m)
                  {
                    if (*(void *)v342 != v30) {
                      objc_enumerationMutation(v27);
                    }
                    id v32 = *(void **)(*((void *)&v341 + 1) + 8 * m);
                    v33 = (void *)MEMORY[0x223C32890]();
                    v34 = [v26 memoryRegions];
                    [v32 printVmmapLikeOutputForProcess:v26 regions:v34];
                  }
                  uint64_t v29 = [v27 countByEnumeratingWithState:&v341 objects:&v353 count:16];
                }
                while (v29);
              }
            }
            uint64_t v24 = [obj countByEnumeratingWithState:&v345 objects:v357 count:16];
          }
          while (v24);
        }

        NSUInteger v6 = (FPFootprint *)v226;
        id v16 = v227;
        v9 = v216;
      }
    }
  }
  v215 = objc_opt_new();
  v214 = objc_opt_new();
  v206 = 0;
  if ((unint64_t)[v9 count] >= 2 && !v211)
  {
    v35 = v9;
    if (v6)
    {
      id v36 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      long long v353 = 0u;
      long long v354 = 0u;
      long long v355 = 0u;
      long long v356 = 0u;
      v37 = v6->_processes;
      uint64_t v38 = [(NSArray *)v37 countByEnumeratingWithState:&v353 objects:&v358 count:16];
      if (v38)
      {
        uint64_t v39 = v38;
        uint64_t v40 = *(void *)v354;
        do
        {
          for (uint64_t n = 0; n != v39; ++n)
          {
            if (*(void *)v354 != v40) {
              objc_enumerationMutation(v37);
            }
            uint64_t v42 = *(void **)(*((void *)&v353 + 1) + 8 * n);
            uint64_t v43 = [v42 sharedCache];
            if (v43)
            {
              id v44 = [v36 objectForKeyedSubscript:v43];
              if (!v44)
              {
                id v44 = [[FPProcessGroupMinimal alloc] initUniqueProcessGroup];
                [v36 setObject:v44 forKeyedSubscript:v43];
              }
              [v44 addProcess:v42];
            }
          }
          uint64_t v39 = [(NSArray *)v37 countByEnumeratingWithState:&v353 objects:&v358 count:16];
        }
        while (v39);
      }

      v45 = [objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:[v36 count]];
      long long v349 = 0u;
      long long v350 = 0u;
      long long v351 = 0u;
      long long v352 = 0u;
      id v46 = v36;
      uint64_t v47 = [v46 countByEnumeratingWithState:&v349 objects:v357 count:16];
      v9 = v35;
      if (v47)
      {
        uint64_t v48 = v47;
        uint64_t v49 = *(void *)v350;
        do
        {
          for (iuint64_t i = 0; ii != v48; ++ii)
          {
            if (*(void *)v350 != v49) {
              objc_enumerationMutation(v46);
            }
            uint64_t v51 = *(void *)(*((void *)&v349 + 1) + 8 * ii);
            id v52 = [v46 objectForKeyedSubscript:v51];
            uint64_t v53 = sub_21E86A908((uint64_t)v52);
            [v45 setObject:v53 forKeyedSubscript:v51];
          }
          uint64_t v48 = [v46 countByEnumeratingWithState:&v349 objects:v357 count:16];
        }
        while (v48);
      }
      v206 = v45;
    }
    else
    {
      v206 = 0;
    }
    NSUInteger v6 = (FPFootprint *)v226;
  }
  if (v211)
  {
    id v207 = 0;
  }
  else
  {
    id v228 = v206;
    v217 = v9;
    if (v6)
    {
      uint64_t v54 = [MEMORY[0x263EFF9A0] dictionary];
      uint64_t v55 = sub_21E868D50(v6);
      id v242 = [objc_alloc(MEMORY[0x263EFF9C0]) initWithCapacity:[v55 count]];
      long long v324 = 0u;
      long long v325 = 0u;
      long long v326 = 0u;
      long long v327 = 0u;
      id v222 = v55;
      uint64_t v56 = [v222 countByEnumeratingWithState:&v324 objects:&v358 count:16];
      if (v56)
      {
        uint64_t v57 = v56;
        uint64_t v58 = *(void *)v325;
        do
        {
          for (juint64_t j = 0; jj != v57; ++jj)
          {
            if (*(void *)v325 != v58) {
              objc_enumerationMutation(v222);
            }
            v60 = [NSNumber numberWithInt:[*(id *)(*((void *)&v324 + 1) + 8 * jj) pid]];
            [v242 addObject:v60];
          }
          uint64_t v57 = [v222 countByEnumeratingWithState:&v324 objects:&v358 count:16];
        }
        while (v57);
      }

      long long v323 = 0u;
      long long v322 = 0u;
      long long v321 = 0u;
      long long v320 = 0u;
      id obja = v6->_processes;
      uint64_t v61 = [(NSArray *)obja countByEnumeratingWithState:&v320 objects:v357 count:16];
      if (v61)
      {
        uint64_t v62 = v61;
        uint64_t v236 = *(void *)v321;
        do
        {
          for (kuint64_t k = 0; kk != v62; ++kk)
          {
            if (*(void *)v321 != v236) {
              objc_enumerationMutation(obja);
            }
            uint64_t v64 = *(void **)(*((void *)&v320 + 1) + 8 * kk);
            char v65 = [v64 hiddenFromDisplay];
            uint64_t v66 = [v64 sharedCache];
            if (v66)
            {
              uint64_t v67 = v228;
              v68 = [v228 objectForKeyedSubscript:v66];
            }
            else
            {
              v68 = 0;
              uint64_t v67 = v228;
            }
            v69 = [v64 memoryRegions];
            v313[0] = MEMORY[0x263EF8330];
            v313[1] = 3221225472;
            v313[2] = sub_21E8692AC;
            v313[3] = &unk_2644CAFA0;
            char v319 = v65;
            id v314 = v242;
            id v315 = v67;
            id v316 = v68;
            id v317 = v54;
            v318 = v64;
            id v70 = v68;
            [v69 fp_enumerateObjectsWithBatchSize:256 usingBlock:v313];
          }
          uint64_t v62 = [(NSArray *)obja countByEnumeratingWithState:&v320 objects:v357 count:16];
        }
        while (v62);
      }

      id v71 = [objc_alloc(MEMORY[0x263EFF9C0]) initWithCapacity:3 * [v242 count]];
      long long v309 = 0u;
      long long v310 = 0u;
      long long v311 = 0u;
      long long v312 = 0u;
      v72 = [v54 allKeys];
      uint64_t v73 = [v72 countByEnumeratingWithState:&v309 objects:&v353 count:16];
      if (v73)
      {
        uint64_t v74 = v73;
        uint64_t v75 = *(void *)v310;
        do
        {
          for (muint64_t m = 0; mm != v74; ++mm)
          {
            if (*(void *)v310 != v75) {
              objc_enumerationMutation(v72);
            }
            uint64_t v77 = *(void *)(*((void *)&v309 + 1) + 8 * mm);
            v78 = [v54 objectForKeyedSubscript:v77];
            uint64_t v79 = [v71 member:v78];
            if (!v79)
            {
              uint64_t v79 = sub_21E86A908((uint64_t)v78);
              [v71 addObject:v79];
            }
            [v54 setObject:v79 forKeyedSubscript:v77];
          }
          uint64_t v74 = [v72 countByEnumeratingWithState:&v309 objects:&v353 count:16];
        }
        while (v74);
      }

      long long v308 = 0u;
      long long v307 = 0u;
      long long v306 = 0u;
      long long v305 = 0u;
      id v80 = v54;
      uint64_t v81 = [v80 countByEnumeratingWithState:&v305 objects:&v349 count:16];
      if (v81)
      {
        uint64_t v82 = v81;
        uint64_t v83 = *(void *)v306;
        do
        {
          for (nuint64_t n = 0; nn != v82; ++nn)
          {
            if (*(void *)v306 != v83) {
              objc_enumerationMutation(v80);
            }
            uint64_t v85 = *(void **)(*((void *)&v305 + 1) + 8 * nn);
            uint64_t v86 = [v80 objectForKeyedSubscript:v85];
            uint64_t v87 = [v85 nonretainedObjectValue];
            sub_21E86AB34((uint64_t)v86, v87);
          }
          uint64_t v82 = [v80 countByEnumeratingWithState:&v305 objects:&v349 count:16];
        }
        while (v82);
      }

      uint64_t v88 = [MEMORY[0x263EFF9A0] dictionary];
      long long v301 = 0u;
      long long v302 = 0u;
      long long v303 = 0u;
      long long v304 = 0u;
      id v219 = v71;
      id objb = (id)[v219 countByEnumeratingWithState:&v301 objects:&v345 count:16];
      if (objb)
      {
        uint64_t v224 = *(void *)v302;
        do
        {
          uint64_t v89 = 0;
          do
          {
            if (*(void *)v302 != v224) {
              objc_enumerationMutation(v219);
            }
            uint64_t v237 = v89;
            uint64_t v90 = *(void **)(*((void *)&v301 + 1) + 8 * v89);
            v91 = [v90 processes];
            uint64_t v92 = [v91 count];

            long long v300 = 0u;
            long long v299 = 0u;
            long long v297 = 0u;
            long long v298 = 0u;
            CFDictionaryRef v93 = [v90 processes];
            uint64_t v94 = [v93 countByEnumeratingWithState:&v297 objects:&v341 count:16];
            if (v94)
            {
              uint64_t v95 = v94;
              uint64_t v96 = *(void *)v298;
              do
              {
                for (uint64_t i1 = 0; i1 != v95; ++i1)
                {
                  if (*(void *)v298 != v96) {
                    objc_enumerationMutation(v93);
                  }
                  v98 = *(void **)(*((void *)&v297 + 1) + 8 * i1);
                  v99 = [v98 asNumber];
                  id v100 = [v88 objectForKeyedSubscript:v99];

                  if (!v100)
                  {
                    id v100 = objc_alloc_init(MEMORY[0x263EFF980]);
                    uint64_t v101 = [v98 asNumber];
                    [v88 setObject:v100 forKeyedSubscript:v101];
                  }
                  if (v92 == 1) {
                    [v100 insertObject:v90 atIndex:0];
                  }
                  else {
                    [v100 addObject:v90];
                  }
                }
                uint64_t v95 = [v93 countByEnumeratingWithState:&v297 objects:&v341 count:16];
              }
              while (v95);
            }

            uint64_t v89 = v237 + 1;
          }
          while ((id)(v237 + 1) != objb);
          id objb = (id)[v219 countByEnumeratingWithState:&v301 objects:&v345 count:16];
        }
        while (objb);
      }
    }
    else
    {
      uint64_t v88 = 0;
    }

    id v207 = v88;
    NSUInteger v6 = (FPFootprint *)v226;
    v102 = *(const void **)(v226 + 56);
    v9 = v217;
    if (v102)
    {
      CFRelease(v102);
      *(void *)(v226 + 56) = 0;
    }
    v103 = *(void **)(v226 + 64);
    *(void *)(v226 + 64) = 0;

    long long v104 = *(const void **)(v226 + 72);
    if (v104)
    {
      CFRelease(v104);
      *(void *)(v226 + 72) = 0;
    }
    long long v105 = *(const void **)(v226 + 80);
    if (v105)
    {
      CFRelease(v105);
      *(void *)(v226 + 80) = 0;
    }
  }
  context = (void *)MEMORY[0x223C32890]();
  long long v289 = 0u;
  long long v290 = 0u;
  long long v291 = 0u;
  long long v292 = 0u;
  long long v106 = v6->_outputFormatters;
  uint64_t v107 = [(NSMutableArray *)v106 countByEnumeratingWithState:&v289 objects:v339 count:16];
  if (v107)
  {
    uint64_t v108 = v107;
    uint64_t v109 = *(void *)v290;
    do
    {
      for (uint64_t i2 = 0; i2 != v108; ++i2)
      {
        if (*(void *)v290 != v109) {
          objc_enumerationMutation(v106);
        }
        long long v111 = *(void **)(*((void *)&v289 + 1) + 8 * i2);
        long long v112 = (void *)MEMORY[0x223C32890]();
        if (objc_opt_respondsToSelector()) {
          [v111 printHeader];
        }
      }
      uint64_t v108 = [(NSMutableArray *)v106 countByEnumeratingWithState:&v289 objects:v339 count:16];
    }
    while (v108);
  }

  long long v287 = 0u;
  long long v288 = 0u;
  long long v285 = 0u;
  long long v286 = 0u;
  id v208 = v9;
  uint64_t v212 = [v208 countByEnumeratingWithState:&v285 objects:v338 count:16];
  if (v212)
  {
    uint64_t v210 = *(void *)v286;
    v213 = (void *)MEMORY[0x263EFFA78];
    do
    {
      long long v113 = 0;
      do
      {
        if (*(void *)v286 != v210) {
          objc_enumerationMutation(v208);
        }
        long long v114 = *(void **)(*((void *)&v285 + 1) + 8 * (void)v113);
        long long v115 = [v114 errors];
        id v243 = (id)[v115 count];

        long long v116 = [v114 warnings];
        uint64_t v117 = [v116 count];

        if (v117) {
          [v214 addObject:v114];
        }
        v220 = v113;
        if (v243)
        {
          [v215 addObject:v114];
        }
        else
        {
          long long v118 = [v114 auxData];
          long long v119 = v118;
          if (v118)
          {
            uint64_t v120 = [v118 fp_mergeWithData:v213];

            v213 = (void *)v120;
          }
        }
        pidToFootprint = v6->_pidToFootprint;
        long long v122 = [NSNumber numberWithInt:[v114 pid]];
        uint64_t v123 = [(NSMutableDictionary *)pidToFootprint objectForKeyedSubscript:v122];

        long long v283 = 0u;
        long long v284 = 0u;
        long long v281 = 0u;
        long long v282 = 0u;
        long long v124 = v6->_outputFormatters;
        uint64_t v125 = [(NSMutableArray *)v124 countByEnumeratingWithState:&v281 objects:v337 count:16];
        if (v125)
        {
          uint64_t v126 = v125;
          uint64_t v127 = *(void *)v282;
          do
          {
            for (uint64_t i3 = 0; i3 != v126; ++i3)
            {
              if (*(void *)v282 != v127) {
                objc_enumerationMutation(v124);
              }
              long long v129 = *(void **)(*((void *)&v281 + 1) + 8 * i3);
              v130 = (void *)MEMORY[0x223C32890]();
              [v129 printProcessHeader:v114];
              if (!v243) {
                [v129 printProcessTotal:v123 forProcess:v114];
              }
              [v129 endProcessHeader:v114];
            }
            uint64_t v126 = [(NSMutableArray *)v124 countByEnumeratingWithState:&v281 objects:v337 count:16];
          }
          while (v126);
        }
        v218 = (void *)v123;

        if (!v211)
        {
          uint64_t v131 = [v114 asNumber];
          v132 = [v207 objectForKeyedSubscript:v131];

          if (v132)
          {
            long long v275 = 0uLL;
            long long v276 = 0uLL;
            long long v273 = 0uLL;
            long long v274 = 0uLL;
            v209 = v132;
            id v223 = v132;
            uint64_t v229 = [v223 countByEnumeratingWithState:&v273 objects:v335 count:16];
            if (v229)
            {
              uint64_t v225 = *(void *)v274;
              do
              {
                uint64_t v133 = 0;
                do
                {
                  if (*(void *)v274 != v225) {
                    objc_enumerationMutation(v223);
                  }
                  uint64_t v238 = v133;
                  v134 = *(void **)(*((void *)&v273 + 1) + 8 * v133);
                  v135 = sub_21E86AC68((uint64_t)v134);
                  long long v359 = 0u;
                  long long v360 = 0u;
                  long long v358 = 0u;
                  v357[0] = 0;
                  if (!v135)
                  {
                    if (v134) {
                      v136 = (void *)v134[4];
                    }
                    else {
                      v136 = 0;
                    }
                    id v137 = v136;
                    v138 = (void *)MEMORY[0x223C32890]();
                    v139 = [v137 objectEnumerator];
                    v135 = sub_21E868DD4(v226, v139, v114, v357, v221);

                    if (!v357[0])
                    {
                      v140 = [v134 processes];
                      unint64_t v141 = [v140 count];

                      if (v141 >= 0x1A)
                      {
                        v142 = [v134 processes];
                        sub_21E86ABDC((uint64_t)v134, v135, [v142 count] - 1);
                      }
                    }
                  }
                  if (!v243) {
                    sub_21E867224((uint64_t)FPFootprint, v135, (uint64_t)&v358);
                  }
                  id objc = (id)MEMORY[0x223C32890]();
                  long long v269 = 0u;
                  long long v270 = 0u;
                  long long v271 = 0u;
                  long long v272 = 0u;
                  id v143 = *(id *)(v226 + 88);
                  uint64_t v144 = [v143 countByEnumeratingWithState:&v269 objects:v334 count:16];
                  if (v144)
                  {
                    uint64_t v145 = v144;
                    uint64_t v146 = *(void *)v270;
                    do
                    {
                      for (uint64_t i4 = 0; i4 != v145; ++i4)
                      {
                        if (*(void *)v270 != v146) {
                          objc_enumerationMutation(v143);
                        }
                        v148 = *(void **)(*((void *)&v269 + 1) + 8 * i4);
                        v149 = [v134 processes];
                        uint64_t v150 = [v149 count];

                        if (v150 == 1) {
                          [v148 printProcessCategories:v135 total:&v358 forProcess:v114];
                        }
                        else {
                          [v148 printSharedCategories:v135 sharedWith:v134 forProcess:v114 hasProcessView:v357[0] == 2 total:&v358];
                        }
                      }
                      uint64_t v145 = [v143 countByEnumeratingWithState:&v269 objects:v334 count:16];
                    }
                    while (v145);
                  }

                  uint64_t v133 = v238 + 1;
                }
                while (v238 + 1 != v229);
                uint64_t v151 = [v223 countByEnumeratingWithState:&v273 objects:v335 count:16];
                uint64_t v229 = v151;
              }
              while (v151);
            }

            NSUInteger v6 = (FPFootprint *)v226;
            v132 = v209;
          }
          else
          {
            long long v359 = 0uLL;
            long long v360 = 0uLL;
            long long v358 = 0uLL;
            long long v277 = 0uLL;
            long long v278 = 0uLL;
            long long v279 = 0uLL;
            long long v280 = 0uLL;
            v152 = v6->_outputFormatters;
            uint64_t v153 = [(NSMutableArray *)v152 countByEnumeratingWithState:&v277 objects:v336 count:16];
            uint64_t v154 = MEMORY[0x263EFFA78];
            if (v153)
            {
              uint64_t v155 = v153;
              uint64_t v156 = *(void *)v278;
              do
              {
                for (uint64_t i5 = 0; i5 != v155; ++i5)
                {
                  if (*(void *)v278 != v156) {
                    objc_enumerationMutation(v152);
                  }
                  [*(id *)(*((void *)&v277 + 1) + 8 * i5) printProcessCategories:v154 total:&v358 forProcess:v114];
                }
                uint64_t v155 = [(NSMutableArray *)v152 countByEnumeratingWithState:&v277 objects:v336 count:16];
              }
              while (v155);
            }
          }
        }
        v158 = (void *)MEMORY[0x223C32890]();
        long long v265 = 0u;
        long long v266 = 0u;
        long long v267 = 0u;
        long long v268 = 0u;
        v159 = v6->_outputFormatters;
        uint64_t v160 = [(NSMutableArray *)v159 countByEnumeratingWithState:&v265 objects:v333 count:16];
        if (v160)
        {
          uint64_t v161 = v160;
          uint64_t v162 = *(void *)v266;
          do
          {
            for (uint64_t i6 = 0; i6 != v161; ++i6)
            {
              if (*(void *)v266 != v162) {
                objc_enumerationMutation(v159);
              }
              v164 = *(void **)(*((void *)&v265 + 1) + 8 * i6);
              v165 = [v114 auxData];
              [v164 printProcessAuxData:v165 forProcess:v114];
            }
            uint64_t v161 = [(NSMutableArray *)v159 countByEnumeratingWithState:&v265 objects:v333 count:16];
          }
          while (v161);
        }

        long long v113 = v220 + 1;
      }
      while (v220 + 1 != (char *)v212);
      uint64_t v212 = [v208 countByEnumeratingWithState:&v285 objects:v338 count:16];
    }
    while (v212);
  }
  else
  {
    v213 = (void *)MEMORY[0x263EFFA78];
  }

  id objd = (id)MEMORY[0x223C32890]();
  long long v261 = 0u;
  long long v262 = 0u;
  long long v263 = 0u;
  long long v264 = 0u;
  id v244 = v206;
  uint64_t v166 = [v244 countByEnumeratingWithState:&v261 objects:v332 count:16];
  if (v166)
  {
    uint64_t v167 = v166;
    uint64_t v239 = *(void *)v262;
    do
    {
      uint64_t v168 = 0;
      do
      {
        if (*(void *)v262 != v239) {
          objc_enumerationMutation(v244);
        }
        uint64_t v169 = *(void *)(*((void *)&v261 + 1) + 8 * v168);
        uint64_t v170 = [v244 objectForKeyedSubscript:v169];
        v171 = (void *)v170;
        if (v170) {
          v172 = *(void **)(v170 + 32);
        }
        else {
          v172 = 0;
        }
        id v173 = v172;
        v174 = (void *)MEMORY[0x223C32890]();
        v175 = [v173 objectEnumerator];
        v176 = sub_21E868DD4(v226, v175, 0, 0, v221);

        long long v359 = 0u;
        long long v360 = 0u;
        long long v358 = 0u;
        sub_21E867224((uint64_t)FPFootprint, v176, (uint64_t)&v358);
        long long v259 = 0u;
        long long v260 = 0u;
        long long v257 = 0u;
        long long v258 = 0u;
        id v177 = *(id *)(v226 + 88);
        uint64_t v178 = [v177 countByEnumeratingWithState:&v257 objects:v331 count:16];
        if (v178)
        {
          uint64_t v179 = v178;
          uint64_t v180 = *(void *)v258;
          do
          {
            for (uint64_t i7 = 0; i7 != v179; ++i7)
            {
              if (*(void *)v258 != v180) {
                objc_enumerationMutation(v177);
              }
              [*(id *)(*((void *)&v257 + 1) + 8 * i7) printSharedCache:v169 categories:v176 sharedWith:v171 total:&v358];
            }
            uint64_t v179 = [v177 countByEnumeratingWithState:&v257 objects:v331 count:16];
          }
          while (v179);
        }

        ++v168;
        NSUInteger v6 = (FPFootprint *)v226;
      }
      while (v168 != v167);
      uint64_t v182 = [v244 countByEnumeratingWithState:&v261 objects:v332 count:16];
      uint64_t v167 = v182;
    }
    while (v182);
  }

  id v183 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v253 = 0u;
  long long v254 = 0u;
  long long v255 = 0u;
  long long v256 = 0u;
  id v184 = v208;
  uint64_t v185 = [v184 countByEnumeratingWithState:&v253 objects:v330 count:16];
  if (v185)
  {
    uint64_t v186 = v185;
    uint64_t v187 = *(void *)v254;
    do
    {
      for (uint64_t i8 = 0; i8 != v186; ++i8)
      {
        if (*(void *)v254 != v187) {
          objc_enumerationMutation(v184);
        }
        v189 = [*(id *)(*((void *)&v253 + 1) + 8 * i8) globalErrors];
        [v183 addObjectsFromArray:v189];
      }
      uint64_t v186 = [v184 countByEnumeratingWithState:&v253 objects:v330 count:16];
    }
    while (v186);
  }

  v190 = (void *)MEMORY[0x223C32890]();
  long long v249 = 0u;
  long long v250 = 0u;
  long long v251 = 0u;
  long long v252 = 0u;
  v191 = v6->_outputFormatters;
  uint64_t v192 = [(NSMutableArray *)v191 countByEnumeratingWithState:&v249 objects:v329 count:16];
  if (v192)
  {
    uint64_t v193 = v192;
    uint64_t v194 = *(void *)v250;
    do
    {
      for (uint64_t i9 = 0; i9 != v193; ++i9)
      {
        if (*(void *)v250 != v194) {
          objc_enumerationMutation(v191);
        }
        [*(id *)(*((void *)&v249 + 1) + 8 * i9) printProcessesWithWarnings:v214 processesWithErrors:v215 globalErrors:v183];
      }
      uint64_t v193 = [(NSMutableArray *)v191 countByEnumeratingWithState:&v249 objects:v329 count:16];
    }
    while (v193);
  }

  long long v359 = 0u;
  long long v360 = 0u;
  long long v358 = 0u;
  v240 = sub_21E86900C(v6, v221);
  sub_21E867224((uint64_t)FPFootprint, v240, (uint64_t)&v358);
  if ([v183 count]) {
    BOOL v196 = 1;
  }
  else {
    BOOL v196 = [v215 count] != 0;
  }
  long long v247 = 0u;
  long long v248 = 0u;
  long long v245 = 0u;
  long long v246 = 0u;
  v197 = v6->_outputFormatters;
  uint64_t v198 = [(NSMutableArray *)v197 countByEnumeratingWithState:&v245 objects:v328 count:16];
  if (v198)
  {
    uint64_t v199 = v198;
    uint64_t v200 = *(void *)v246;
    if (v211) {
      v201 = 0;
    }
    else {
      v201 = v240;
    }
    do
    {
      for (uint64_t i10 = 0; i10 != v199; ++i10)
      {
        if (*(void *)v246 != v200) {
          objc_enumerationMutation(v197);
        }
        v203 = *(void **)(*((void *)&v245 + 1) + 8 * i10);
        v204 = (void *)MEMORY[0x223C32890]();
        [v203 printSummaryCategories:v201 total:&v358 hadErrors:v196];
        [v203 printGlobalAuxData:v213];
        [v203 endAtTime:*(void *)(v226 + 112)];
      }
      uint64_t v199 = [(NSMutableArray *)v197 countByEnumeratingWithState:&v245 objects:v328 count:16];
    }
    while (v199);
  }
}

- (id)ioSurfaceExtendedInfoDetailsAtAddress:(unint64_t)a3 for:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v27[4] = *MEMORY[0x263EF8340];
  p_allPIDsIOSurfaceDescriptionsLocuint64_t k = &self->_allPIDsIOSurfaceDescriptionsLock;
  os_unfair_lock_lock(&self->_allPIDsIOSurfaceDescriptionsLock);
  allPIDsIOSurfaceDescriptions = self->_allPIDsIOSurfaceDescriptions;
  if (!allPIDsIOSurfaceDescriptions)
  {
    v9 = [MEMORY[0x263F0ED08] surfaceDescriptions];
    v10 = self->_allPIDsIOSurfaceDescriptions;
    self->_allPIDsIOSurfaceDescriptions = v9;

    allPIDsIOSurfaceDescriptions = self->_allPIDsIOSurfaceDescriptions;
  }
  uint64_t v11 = [NSNumber numberWithInt:v4];
  uint64_t v12 = [(NSDictionary *)allPIDsIOSurfaceDescriptions objectForKey:v11];

  os_unfair_lock_unlock(p_allPIDsIOSurfaceDescriptionsLock);
  if (v12)
  {
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = sub_21E86986C;
    v25[3] = &unk_2644CB030;
    v25[4] = a3;
    uint64_t v13 = [MEMORY[0x263F08A98] predicateWithBlock:v25];
    v14 = [v12 filteredArrayUsingPredicate:v13];
    v15 = [v14 firstObject];

    if (v15)
    {
      v26[0] = @"surfaceID";
      id v16 = [NSNumber numberWithUnsignedInt:[v15 surfaceID]];
      v27[0] = v16;
      v26[1] = @"PixelFormat";
      char v17 = [NSNumber numberWithUnsignedInt:[v15 pixelFormat]];
      v27[1] = v17;
      v26[2] = @"Width";
      uint64_t v18 = [NSNumber numberWithUnsignedLongLong:[v15 width]];
      v27[2] = v18;
      v26[3] = @"Height";
      uint64_t v19 = [NSNumber numberWithUnsignedLongLong:[v15 height]];
      v27[3] = v19;
      uint64_t v20 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:4];
      uint64_t v21 = (void *)[v20 mutableCopy];

      uint64_t v22 = [v15 name];

      if (v22)
      {
        uint64_t v23 = [v15 name];
        [v21 setObject:v23 forKey:@"Name"];
      }
    }
    else
    {
      uint64_t v21 = 0;
    }
  }
  else
  {
    uint64_t v21 = 0;
  }

  return v21;
}

- (id)ioAccelMemoryInfoDetailsAtAddress:(unint64_t)a3 for:(int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  v69[1] = *MEMORY[0x263EF8340];
  self;
  if (objc_opt_class())
  {
    os_unfair_lock_lock(&self->_allPIDsIOAccelMemoryInfosLock);
    if (!self->_allPIDsIOAccelMemoryInfos)
    {
      uint64_t v60 = 0;
      uint64_t v61 = &v60;
      uint64_t v62 = 0x3032000000;
      v63 = sub_21E869F40;
      uint64_t v64 = sub_21E869F50;
      id v65 = [MEMORY[0x263EFF9A0] dictionary];
      uint64_t v56 = 0;
      uint64_t v57 = &v56;
      uint64_t v58 = 0x2020000000;
      char v59 = 0;
      dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
      v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v11 = dispatch_queue_create("com.apple.footprint.ioaccelmemoryinfo", v10);

      uint64_t v12 = (void *)MEMORY[0x263F4B108];
      v52[0] = MEMORY[0x263EF8330];
      v52[1] = 3221225472;
      v52[2] = sub_21E869F58;
      v52[3] = &unk_2644CB090;
      uint64_t v54 = &v56;
      uint64_t v55 = &v60;
      uint64_t v13 = v9;
      uint64_t v53 = v13;
      [v12 collectDataWithCompletionQueue:v11 completionBlock:v52];
      dispatch_time_t v14 = dispatch_time(0, 60000000000);
      dispatch_semaphore_wait(v13, v14);
      if (a5 && !*((unsigned char *)v57 + 24) && !*a5)
      {
        v15 = (void *)MEMORY[0x263F087E8];
        uint64_t v68 = *MEMORY[0x263F08320];
        v69[0] = @"Timed out waiting to fetch IOAccelMemory region infos";
        id v16 = [NSDictionary dictionaryWithObjects:v69 forKeys:&v68 count:1];
        *a5 = [v15 errorWithDomain:@"FootprintErrorDomain" code:1 userInfo:v16];
      }
      char v17 = (NSDictionary *)[(id)v61[5] copy];
      allPIDsIOAccelMemoryInfos = self->_allPIDsIOAccelMemoryInfos;
      self->_allPIDsIOAccelMemoryInfos = v17;

      _Block_object_dispose(&v56, 8);
      _Block_object_dispose(&v60, 8);
    }
    os_unfair_lock_unlock(&self->_allPIDsIOAccelMemoryInfosLock);
    uint64_t v19 = self->_allPIDsIOAccelMemoryInfos;
    uint64_t v20 = [NSNumber numberWithInt:v6];
    uint64_t v21 = [(NSDictionary *)v19 objectForKeyedSubscript:v20];

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v22 = v21;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v48 objects:v67 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v49;
      while (2)
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v49 != v24) {
            objc_enumerationMutation(v22);
          }
          unint64_t v26 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          id v27 = [v26 mappings];
          long long v46 = 0u;
          long long v47 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          id v28 = v27;
          uint64_t v29 = [v28 countByEnumeratingWithState:&v44 objects:v66 count:16];
          if (v29)
          {
            uint64_t v30 = *(void *)v45;
LABEL_15:
            uint64_t v31 = 0;
            while (1)
            {
              if (*(void *)v45 != v30) {
                objc_enumerationMutation(v28);
              }
              if ([*(id *)(*((void *)&v44 + 1) + 8 * v31) address] == a3) {
                break;
              }
              if (v29 == ++v31)
              {
                uint64_t v29 = [v28 countByEnumeratingWithState:&v44 objects:v66 count:16];
                if (v29) {
                  goto LABEL_15;
                }
                goto LABEL_21;
              }
            }
            id v32 = v26;

            if (!v32) {
              continue;
            }

            v33 = [MEMORY[0x263EFF9A0] dictionary];
            v34 = [NSNumber numberWithUnsignedInt:[v32 surfaceID]];
            [v33 setObject:v34 forKeyedSubscript:@"SurfaceID"];

            v35 = [NSNumber numberWithUnsignedLongLong:[v32 length]];
            [v33 setObject:v35 forKeyedSubscript:@"Size"];

            id v36 = [NSNumber numberWithUnsignedLongLong:[v32 dirtyLength]];
            [v33 setObject:v36 forKeyedSubscript:@"DirtySize"];

            v37 = [NSNumber numberWithUnsignedLongLong:[v32 residentLength]];
            [v33 setObject:v37 forKeyedSubscript:@"ResidentSize"];

            uint64_t v38 = [NSNumber numberWithBool:[v32 wired]];
            [v33 setObject:v38 forKeyedSubscript:@"IsWired"];

            uint64_t v39 = [NSNumber numberWithBool:[v32 purgeable]];
            [v33 setObject:v39 forKeyedSubscript:@"IsPurgeable"];

            uint64_t v40 = [NSNumber numberWithBool:[v32 cachedCopy]];
            [v33 setObject:v40 forKeyedSubscript:@"CachedCopy"];

            v41 = [NSNumber numberWithUnsignedInteger:[v32 memoryPool]];
            [v33 setObject:v41 forKeyedSubscript:@"MemoryPool"];

            uint64_t v42 = [v32 formattedDescriptions];
            [v33 setObject:v42 forKeyedSubscript:@"Descriptions"];

            goto LABEL_28;
          }
LABEL_21:
        }
        uint64_t v23 = [v22 countByEnumeratingWithState:&v48 objects:v67 count:16];
        if (v23) {
          continue;
        }
        break;
      }
    }
    v33 = 0;
    id v32 = v22;
LABEL_28:
  }
  else
  {
    v33 = 0;
  }

  return v33;
}

- (NSArray)processes
{
  return self->_processes;
}

- (unsigned)qualityOfService
{
  return self->_qualityOfService;
}

- (void)setQualityOfService:(unsigned int)a3
{
  self->_qualityOfService = a3;
}

- (FPTime)gatherStartTime
{
  return self->_gatherStartTime;
}

- (FPTime)gatherEndTime
{
  return self->_gatherEndTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gatherEndTime, 0);
  objc_storeStrong((id *)&self->_gatherStartTime, 0);
  objc_storeStrong((id *)&self->_outputFormatters, 0);
  objc_storeStrong((id *)&self->_sharedCacheMemoryObjectsTable, 0);
  objc_storeStrong((id *)&self->_allPIDsIOAccelMemoryInfos, 0);
  objc_storeStrong((id *)&self->_allPIDsIOSurfaceDescriptions, 0);
  objc_storeStrong((id *)&self->_pidToFootprint, 0);

  objc_storeStrong((id *)&self->_processes, 0);
}

@end