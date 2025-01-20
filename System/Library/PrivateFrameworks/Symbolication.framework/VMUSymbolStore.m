@interface VMUSymbolStore
+ (BOOL)supportsSecureCoding;
- (BOOL)_getDsymPathsForUUIDs:(id)a3 andReportProgress:(id)a4;
- (BOOL)_readContentsOfDsymFile:(id)a3 error:(id *)a4;
- (BOOL)_refillSymbolOwnersWithDataAndReportProgress:(id)a3;
- (BOOL)resymbolicateWithDsymPath:(id)a3 libraryNames:(id)a4 all:(BOOL)a5 progress:(id)a6 showDebugInfo:(BOOL)a7 error:(id *)a8;
- (VMUProcessObjectGraph)graph;
- (VMUSymbolStore)initWithCoder:(id)a3;
- (VMUSymbolStore)initWithSymbolicator:(_CSTypeRef)a3 debugTimer:(id)a4;
- (_CSTypeRef)symbolicator;
- (id).cxx_construct;
- (id)_createResymbolicatedSignature;
- (id)_createSymbolicatorSignature;
- (void)_extractAddressesFromSymbolicator;
- (void)_flagSymbolOwnersForResymbolication;
- (void)_groupAddressTrackerByUuid;
- (void)addAddress:(unint64_t)a3 origin:(int)a4;
- (void)addBacktrace:(id)a3 origin:(int)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setGraph:(id)a3;
@end

@implementation VMUSymbolStore

- (VMUSymbolStore)initWithSymbolicator:(_CSTypeRef)a3 debugTimer:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)VMUSymbolStore;
  v7 = [(VMUSymbolStore *)&v10 init];
  if (v7)
  {
    v7->_symbolicator._opaque_1 = CSRetain();
    v7->_symbolicator._opaque_2 = v8;
    objc_storeStrong((id *)&v7->_debugTimer, a4);
    v7->_debugStore = 0;
  }

  return v7;
}

- (void)dealloc
{
  CSRelease();
  v3.receiver = self;
  v3.super_class = (Class)VMUSymbolStore;
  [(VMUSymbolStore *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VMUSymbolStore)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VMUSymbolStore;
  v5 = [(VMUSymbolStore *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signature"];
    signature = v5->_signature;
    v5->_signature = (NSData *)v6;

    unint64_t v8 = v5->_signature;
    if (v8)
    {
      v5->_symbolicator._opaque_1 = MEMORY[0x1AD0D8DA0](v8, 0);
      v5->_symbolicator._opaque_2 = v9;
      if (CSIsNull() && v5->_debugStore)
      {
        objc_super v10 = (FILE *)*MEMORY[0x1E4F143C8];
        v11 = "VMUSymbolStore failed to create the symbolicator from signature.\n";
        size_t v12 = 65;
LABEL_8:
        fwrite(v11, v12, 1uLL, v10);
      }
    }
    else if (v5->_debugStore)
    {
      objc_super v10 = (FILE *)*MEMORY[0x1E4F143C8];
      v11 = "VMUSymbolStore failed to decode symbolicator signature or it is missing.\n";
      size_t v12 = 73;
      goto LABEL_8;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if (self->_resymbolicatedSuccessfully && self->_signature)
  {
    v5 = [(VMUSymbolStore *)self _createResymbolicatedSignature];
    signature = self->_signature;
    self->_signature = v5;
  }
  v7 = self->_signature;
  if (!v7)
  {
    debugTimer = self->_debugTimer;
    if (debugTimer)
    {
      uint64_t v9 = [(VMUDebugTimer *)debugTimer signpostID];
      debugTimer = self->_debugTimer;
      if (v9)
      {
        objc_super v10 = [(VMUDebugTimer *)debugTimer logHandle];
        os_signpost_id_t v11 = [(VMUDebugTimer *)self->_debugTimer signpostID];
        if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v10, OS_SIGNPOST_INTERVAL_END, v11, "VMUSymbolStore", "", buf, 2u);
        }

        debugTimer = self->_debugTimer;
      }
    }
    [(VMUDebugTimer *)debugTimer endEvent:"VMUSymbolStore"];
    [(VMUDebugTimer *)self->_debugTimer startWithCategory:"VMUSymbolStore" message:"creating symbolicator signature"];
    size_t v12 = self->_debugTimer;
    if (v12)
    {
      v13 = [(VMUDebugTimer *)v12 logHandle];
      os_signpost_id_t v14 = [(VMUDebugTimer *)self->_debugTimer signpostID];
      if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
      {
        *(_WORD *)v22 = 0;
        _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v14, "VMUSymbolStore", "creating symbolicator signature", v22, 2u);
      }
    }
    v15 = [(VMUSymbolStore *)self _createSymbolicatorSignature];
    v16 = self->_signature;
    self->_signature = v15;

    v17 = self->_debugTimer;
    if (v17)
    {
      uint64_t v18 = [(VMUDebugTimer *)v17 signpostID];
      v17 = self->_debugTimer;
      if (v18)
      {
        v19 = [(VMUDebugTimer *)v17 logHandle];
        os_signpost_id_t v20 = [(VMUDebugTimer *)self->_debugTimer signpostID];
        if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
        {
          *(_WORD *)v21 = 0;
          _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v19, OS_SIGNPOST_INTERVAL_END, v20, "VMUSymbolStore", "", v21, 2u);
        }

        v17 = self->_debugTimer;
      }
    }
    [(VMUDebugTimer *)v17 endEvent:"VMUSymbolStore"];
    v7 = self->_signature;
  }
  [v4 encodeObject:v7 forKey:@"signature"];
}

- (void)addAddress:(unint64_t)a3 origin:(int)a4
{
  unint64_t v8 = a3;
  if (a3)
  {
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__emplace_unique_key_args<unsigned long long,unsigned long long &>((uint64_t)&self->_addressesTracker, &v8, &v8);
    if (self->_debugStore)
    {
      BOOL v6 = a4 >= 4;
      BOOL v7 = a4 == 4;
    }
    else
    {
      BOOL v6 = 1;
      BOOL v7 = 0;
    }
    if (v7 || !v6) {
      ++*(&self->backtraceSample + a4);
    }
  }
}

- (void)addBacktrace:(id)a3 origin:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v7 = a3;
  for (unint64_t i = 0; i < [v7 backtraceLength]; ++i)
    -[VMUSymbolStore addAddress:origin:](self, "addAddress:origin:", *(void *)([v7 backtrace] + 8 * i), v4);
}

- (void)_groupAddressTrackerByUuid
{
  next = self->_addressesTracker.__table_.__p1_.__value_.__next_;
  if (next)
  {
    p_addressesGroupedByUuid = &self->_addressesGroupedByUuid;
    do
    {
      unint64_t v7 = next[2];
      v9._opaque_1 = CSSymbolicatorGetSymbolOwnerWithAddressAtTime();
      _uuidStringForOwner(v9, __p);
      unint64_t v8 = __p;
      uint64_t v4 = std::__hash_table<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)p_addressesGroupedByUuid, (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, (long long **)&v8);
      std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__emplace_unique_key_args<unsigned long long,unsigned long long &>((uint64_t)(v4 + 40), &v7, &v7);
      if (v6 < 0) {
        operator delete(__p[0]);
      }
      next = (void *)*next;
    }
    while (next);
  }
}

- (id)_createSymbolicatorSignature
{
  [(VMUSymbolStore *)self _groupAddressTrackerByUuid];
  if (self->_debugStore) {
    fprintf((FILE *)*MEMORY[0x1E4F143C8], "Number of addresses sent to VMUSymbolStore by client classes:\nFor backtrace sample: %zu\nFor binary sections: %zu\nFor global variables: %zu\nFor malloc stack logging: %zu\nFor hex found in node labels: %zu\nTotal unique addresses to be saved to symbolicator signature: %zu\nNumber of UUIDs in the signature: %zu\n", self->backtraceSample, self->binarySection, self->globalVariable, self->mallocStackLogging, self->hexFromLabels, self->_addressesTracker.__table_.__p2_.__value_, self->_addressesGroupedByUuid.__table_.__p2_.__value_);
  }
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x4812000000;
  v5[3] = __Block_byref_object_copy__1;
  v5[4] = __Block_byref_object_dispose__1;
  v5[5] = &unk_1A7D91765;
  unint64_t v7 = 0;
  uint64_t v8 = 0;
  __p = 0;
  CSSymbolicatorForeachSymbolOwnerAtTime();
  CSSymbolicatorCreateWithSymbolOwners();
  Signature = (void *)CSSymbolicatorCreateSignature();
  CSRelease();
  _Block_object_dispose(v5, 8);
  if (__p)
  {
    unint64_t v7 = __p;
    operator delete(__p);
  }

  return Signature;
}

void __46__VMUSymbolStore__createSymbolicatorSignature__block_invoke(uint64_t a1, _CSTypeRef a2)
{
  unint64_t opaque_2 = a2._opaque_2;
  unint64_t opaque_1 = a2._opaque_1;
  _uuidStringForOwner(a2, v26);
  v5 = std::__hash_table<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>>>::find<std::string>((void *)(*(void *)(a1 + 32) + 16), (unsigned __int8 *)v26);
  if (v5)
  {
    std::unordered_set<unsigned long long>::unordered_set((uint64_t)v25, (uint64_t)(v5 + 40));
    std::unordered_set<unsigned long long>::unordered_set((uint64_t)v24, (uint64_t)v25);
    uint64_t v6 = _sparsifySymbolOwner(opaque_1, opaque_2, (uint64_t)v24);
    uint64_t v8 = v7;
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table((uint64_t)v24);
    if (CSIsNull())
    {
      if (*(unsigned char *)(*(void *)(a1 + 32) + 120))
      {
        _CSTypeRef v9 = (FILE *)*MEMORY[0x1E4F143C8];
        Name = (const char *)CSSymbolOwnerGetName();
        os_signpost_id_t v11 = (const char *)v26;
        if (v27 < 0) {
          os_signpost_id_t v11 = (const char *)v26[0];
        }
        fprintf(v9, "VMUSymbolStore failed to create a sparse version of symbol owner '%s' with UUID: %s \n", Name, v11);
      }
    }
    else
    {
      size_t v12 = *(void **)(*(void *)(a1 + 40) + 8);
      v13 = (uint64_t *)v12[7];
      unint64_t v14 = v12[8];
      if ((unint64_t)v13 >= v14)
      {
        v16 = (uint64_t *)v12[6];
        uint64_t v17 = ((char *)v13 - (char *)v16) >> 4;
        unint64_t v18 = v17 + 1;
        if ((unint64_t)(v17 + 1) >> 60) {
          std::vector<_CSTypeRef>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v19 = v14 - (void)v16;
        if (v19 >> 3 > v18) {
          unint64_t v18 = v19 >> 3;
        }
        if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v20 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v20 = v18;
        }
        if (v20)
        {
          v21 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_CSTypeRef>>((uint64_t)(v12 + 8), v20);
          v16 = (uint64_t *)v12[6];
          v13 = (uint64_t *)v12[7];
        }
        else
        {
          v21 = 0;
        }
        v22 = (uint64_t *)&v21[16 * v17];
        v23 = &v21[16 * v20];
        uint64_t *v22 = v6;
        v22[1] = v8;
        v15 = v22 + 2;
        if (v13 != v16)
        {
          do
          {
            *((_OWORD *)v22 - 1) = *((_OWORD *)v13 - 1);
            v22 -= 2;
            v13 -= 2;
          }
          while (v13 != v16);
          v16 = (uint64_t *)v12[6];
        }
        v12[6] = v22;
        v12[7] = v15;
        v12[8] = v23;
        if (v16) {
          operator delete(v16);
        }
      }
      else
      {
        uint64_t *v13 = v6;
        v13[1] = v8;
        v15 = v13 + 2;
      }
      v12[7] = v15;
    }
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table((uint64_t)v25);
  }
  if (v27 < 0) {
    operator delete(v26[0]);
  }
}

- (id)_createResymbolicatedSignature
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 1;
  CSSymbolicatorForeachSymbolOwnerAtTime();
  if (self->_debugStore && !*((unsigned char *)v6 + 24)) {
    fwrite("VMUSymbolStore failed to sparsify some of resymbolicated symbol owners.\n", 0x48uLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
  }
  Signature = (void *)CSSymbolicatorCreateSignature();
  _Block_object_dispose(&v5, 8);

  return Signature;
}

void __48__VMUSymbolStore__createResymbolicatedSignature__block_invoke(uint64_t a1, _CSTypeRef a2)
{
  unint64_t opaque_2 = a2._opaque_2;
  unint64_t opaque_1 = a2._opaque_1;
  _uuidStringForOwner(a2, v12);
  uint64_t v5 = std::__hash_table<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>>>::find<std::string>((void *)(*(void *)(a1 + 32) + 16), (unsigned __int8 *)v12);
  uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 112);
  if (v13 >= 0) {
    uint64_t v7 = v12;
  }
  else {
    uint64_t v7 = (void **)v12[0];
  }
  char v8 = [NSString stringWithUTF8String:v7];
  _CSTypeRef v9 = [v6 objectForKeyedSubscript:v8];
  if (v9)
  {

    if (v5)
    {
      std::unordered_set<unsigned long long>::unordered_set((uint64_t)v11, (uint64_t)(v5 + 40));
      std::unordered_set<unsigned long long>::unordered_set((uint64_t)v10, (uint64_t)v11);
      _sparsifySymbolOwner(opaque_1, opaque_2, (uint64_t)v10);
      std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table((uint64_t)v10);
      if (CSIsNull()) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
      }
      std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table((uint64_t)v11);
    }
  }
  else
  {
  }
  if (v13 < 0) {
    operator delete(v12[0]);
  }
}

- (BOOL)resymbolicateWithDsymPath:(id)a3 libraryNames:(id)a4 all:(BOOL)a5 progress:(id)a6 showDebugInfo:(BOOL)a7 error:(id *)a8
{
  BOOL v11 = a5;
  v52[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  uint64_t v17 = v16;
  self->_debugStore = a7;
  if (v14 && v16)
  {

    uint64_t v17 = 0;
  }
  unint64_t v18 = [MEMORY[0x1E4F1CA60] dictionary];
  resymbolicationUUIDs = self->_resymbolicationUUIDs;
  self->_resymbolicationUUIDs = v18;

  if (self->_signature)
  {
    if (CSSymbolicatorIsKernelSymbolicator())
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_graph);
      v21 = [WeakRetained stackLogReader];

      if (v21)
      {
        id v22 = objc_loadWeakRetained((id *)&self->_graph);
        v23 = [v22 stackLogReader];
        v44[0] = MEMORY[0x1E4F143A8];
        v44[1] = 3221225472;
        v44[2] = __90__VMUSymbolStore_resymbolicateWithDsymPath_libraryNames_all_progress_showDebugInfo_error___block_invoke;
        v44[3] = &unk_1E5D23600;
        v44[4] = self;
        [v23 enumerateUniquingTable:v44];

        [(VMUSymbolStore *)self _groupAddressTrackerByUuid];
      }
    }
    [(VMUSymbolStore *)self _extractAddressesFromSymbolicator];
  }
  else
  {
    [(VMUSymbolStore *)self _groupAddressTrackerByUuid];
  }
  if (self->_addressesGroupedByUuid.__table_.__p2_.__value_)
  {
    v24 = [MEMORY[0x1E4F1CA60] dictionary];
    if (v14)
    {
      if (![(VMUSymbolStore *)self _readContentsOfDsymFile:v14 error:a8]) {
        goto LABEL_31;
      }
    }
    else if (v15)
    {
      id v27 = [MEMORY[0x1E4F1CAD0] setWithArray:v15];
      v28 = v24;
      CSSymbolicatorForeachSymbolOwnerAtTime();
      if (![(__CFString *)v28 count])
      {
        if (a8)
        {
          v36 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v49 = *MEMORY[0x1E4F28568];
          v50 = @"No matching libraries found in this memgraph";
          v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
          *a8 = [v36 errorWithDomain:@"Memgraph Resymbolication Error" code:3 userInfo:v37];
        }
        LOBYTE(a8) = 0;
        v24 = v28;
        goto LABEL_32;
      }
    }
    else if (v11)
    {
      v29 = (void *)MEMORY[0x1AD0D9F90]();
      uint64_t v38 = MEMORY[0x1E4F143A8];
      uint64_t v39 = 3221225472;
      v40 = __90__VMUSymbolStore_resymbolicateWithDsymPath_libraryNames_all_progress_showDebugInfo_error___block_invoke_3;
      v41 = &unk_1E5D23650;
      v42 = self;
      v43 = v24;
      CSSymbolicatorForeachSymbolOwnerAtTime();
    }
    if ([(__CFString *)v24 count]
      && ![(VMUSymbolStore *)self _getDsymPathsForUUIDs:v24 andReportProgress:v17])
    {
      if (!a8) {
        goto LABEL_32;
      }
      v33 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v47 = *MEMORY[0x1E4F28568];
      v48 = @"No dSYMs were found";
      v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
      *a8 = [v33 errorWithDomain:@"Memgraph Resymbolication Error" code:4 userInfo:v34];
    }
    else
    {
      [(VMUSymbolStore *)self _flagSymbolOwnersForResymbolication];
      if ([(VMUSymbolStore *)self _refillSymbolOwnersWithDataAndReportProgress:v17])
      {
        id v30 = objc_loadWeakRetained((id *)&self->_graph);
        [v30 resymbolicatePrivateMaps];

        LOBYTE(a8) = 1;
        self->_resymbolicatedSuccessfully = 1;
LABEL_32:

        goto LABEL_33;
      }
      if (!a8) {
        goto LABEL_32;
      }
      v31 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v45 = *MEMORY[0x1E4F28568];
      v46 = @"CoreSymbolication failed to resymbolicate all symbol owners";
      v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
      *a8 = [v31 errorWithDomain:@"Memgraph Resymbolication Error" code:5 userInfo:v32];
    }
LABEL_31:
    LOBYTE(a8) = 0;
    goto LABEL_32;
  }
  if (a8)
  {
    v24 = @"Nothing to symbolicate. All addresses in the memgraph are already symbolicated.";
    if (os_variant_has_internal_content())
    {
      v24 = [@"Nothing to symbolicate. All addresses in the memgraph are already symbolicated." stringByAppendingString:@"\n\nIf after processing this memgraph with other cli tools you still see non-symbolicated addresses for some binary images, please file a Radar to 'Symbolication | Xcode' and attach the memgraph and the non-symbolicated output of interest."];
    }
    v25 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v51 = *MEMORY[0x1E4F28568];
    v52[0] = v24;
    v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:&v51 count:1];
    *a8 = [v25 errorWithDomain:@"Memgraph Resymbolication Error" code:0 userInfo:v26];

    goto LABEL_31;
  }
LABEL_33:

  return (char)a8;
}

uint64_t __90__VMUSymbolStore_resymbolicateWithDsymPath_libraryNames_all_progress_showDebugInfo_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addAddress:a2 origin:3];
}

void __90__VMUSymbolStore_resymbolicateWithDsymPath_libraryNames_all_progress_showDebugInfo_error___block_invoke_2(void *a1, unint64_t a2, unint64_t a3)
{
  uint64_t Name = CSSymbolOwnerGetName();
  uint64_t v7 = (void *)a1[4];
  char v8 = [NSString stringWithUTF8String:Name];
  LODWORD(v7) = [v7 containsObject:v8];

  if (v7)
  {
    v15._unint64_t opaque_1 = a2;
    v15._unint64_t opaque_2 = a3;
    _uuidStringForOwner(v15, __p);
    if (std::__hash_table<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>>>::find<std::string>((void *)(a1[5] + 16), (unsigned __int8 *)__p))
    {
      _CSTypeRef v9 = [NSString stringWithUTF8String:Name];
      objc_super v10 = (void *)a1[6];
      if (v14 >= 0) {
        BOOL v11 = __p;
      }
      else {
        BOOL v11 = (void **)__p[0];
      }
      size_t v12 = [NSString stringWithUTF8String:v11];
      [v10 setObject:v9 forKeyedSubscript:v12];
    }
    if (v14 < 0) {
      operator delete(__p[0]);
    }
  }
}

void __90__VMUSymbolStore_resymbolicateWithDsymPath_libraryNames_all_progress_showDebugInfo_error___block_invoke_3(uint64_t a1, _CSTypeRef a2)
{
  _uuidStringForOwner(a2, __p);
  if (std::__hash_table<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>>>::find<std::string>((void *)(*(void *)(a1 + 32) + 16), (unsigned __int8 *)__p))
  {
    objc_super v3 = [NSString stringWithUTF8String:CSSymbolOwnerGetName()];
    uint64_t v4 = *(void **)(a1 + 40);
    if (v8 >= 0) {
      uint64_t v5 = __p;
    }
    else {
      uint64_t v5 = (void **)__p[0];
    }
    uint64_t v6 = [NSString stringWithUTF8String:v5];
    [v4 setObject:v3 forKeyedSubscript:v6];
  }
  if (v8 < 0) {
    operator delete(__p[0]);
  }
}

- (void)_extractAddressesFromSymbolicator
{
}

void __51__VMUSymbolStore__extractAddressesFromSymbolicator__block_invoke(int a1, _CSTypeRef a2)
{
  _uuidStringForOwner(a2, &v3);
  if (SHIBYTE(v3.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&__p, v3.__r_.__value_.__l.__data_, v3.__r_.__value_.__l.__size_);
  }
  else {
    std::string __p = v3;
  }
  CSSymbolOwnerForeachSymbol();
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v3.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v3.__r_.__value_.__l.__data_);
  }
}

void *__51__VMUSymbolStore__extractAddressesFromSymbolicator__block_invoke_2(uint64_t a1)
{
  unint64_t Range = CSSymbolGetRange();
  uint64_t v2 = *(void *)(a1 + 32) + 16;
  uint64_t v6 = (long long *)(a1 + 40);
  std::string v3 = std::__hash_table<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v2, (unsigned __int8 *)(a1 + 40), (uint64_t)&std::piecewise_construct, &v6);
  return std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__emplace_unique_key_args<unsigned long long,unsigned long long &>((uint64_t)(v3 + 40), &Range, &Range);
}

- (BOOL)_readContentsOfDsymFile:(id)a3 error:(id *)a4
{
  v58[1] = *MEMORY[0x1E4F143B8];
  uint64_t v46 = 0;
  uint64_t v47 = &v46;
  uint64_t v48 = 0x3032000000;
  uint64_t v49 = __Block_byref_object_copy__39;
  v50 = __Block_byref_object_dispose__40;
  id v51 = 0;
  id v31 = a3;
  v36 = [v31 stringByAppendingString:@"/Contents/Resources/DWARF/"];
  uint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v45 = 0;
  v33 = [v4 subpathsOfDirectoryAtPath:v36 error:&v45];
  id v32 = v45;

  if (!v33 || ![v33 count])
  {
    unint64_t v18 = NSString;
    if (v32)
    {
      uint64_t v19 = [v32 localizedDescription];
    }
    else
    {
      uint64_t v19 = &stru_1EFE27F38;
    }
    uint64_t v5 = [v18 stringWithFormat:@"Failed to find the binary in the dSYM: '%@'. %@\n", v31, v19];
    if (v32) {

    }
    if (a4)
    {
      unint64_t v20 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v57 = *MEMORY[0x1E4F28568];
      v58[0] = v5;
      v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:&v57 count:1];
      *a4 = [v20 errorWithDomain:@"Memgraph Resymbolication Error" code:1 userInfo:v21];
    }
    goto LABEL_23;
  }
  context = (void *)MEMORY[0x1AD0D9F90]();
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v33;
  uint64_t v5 = 0;
  uint64_t v6 = [obj countByEnumeratingWithState:&v41 objects:v56 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v42;
LABEL_5:
    uint64_t v8 = 0;
    while (1)
    {
      _CSTypeRef v9 = v5;
      if (*(void *)v42 != v7) {
        objc_enumerationMutation(obj);
      }
      objc_super v10 = [v36 stringByAppendingString:*(void *)(*((void *)&v41 + 1) + 8 * v8)];
      uint64_t v37 = 0;
      uint64_t v38 = &v37;
      uint64_t v39 = 0x2020000000;
      uint64_t v40 = 0;
      id v11 = v10;
      [v11 UTF8String];
      id v12 = v11;
      CSSymbolicatorForeachSymbolicatorWithPath();
      uint64_t v13 = v38[3];
      if (!v13)
      {
        uint64_t v14 = [NSString stringWithFormat:@"Failed to read symbol data from the dSYM: '%@'.", v12];

        _CSTypeRef v9 = (void *)v14;
      }
      BOOL v15 = v13 == 0;

      uint64_t v5 = v9;
      _Block_object_dispose(&v37, 8);

      if (v15) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [obj countByEnumeratingWithState:&v41 objects:v56 count:16];
        if (v6) {
          goto LABEL_5;
        }
        break;
      }
    }
  }

  if (v5)
  {
    if (a4)
    {
      id v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v54 = *MEMORY[0x1E4F28568];
      v55 = v5;
      uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
      *a4 = [v16 errorWithDomain:@"Memgraph Resymbolication Error" code:2 userInfo:v17];
    }
LABEL_23:
    BOOL v22 = 0;
    goto LABEL_24;
  }
  uint64_t v24 = [(NSMutableDictionary *)self->_resymbolicationUUIDs count];
  uint64_t v5 = 0;
  if (a4 && !v24)
  {
    v25 = [NSString stringWithFormat:@"Nothing to symbolicate. This dSYM does not contain symbols for '%@' binary. For more information, please compare the UUIDs.", v47[5]];
    if (os_variant_has_internal_content())
    {
      uint64_t v26 = [v25 stringByAppendingFormat:@"\n\nIf after processing this memgraph with other cli tools and verifying the UUIDs you still see non-symbolicated addresses for '%@', please file a Radar to 'Symbolication | Xcode' and attach the memgraph, the dSYM and the non-symbolicated output of interest.", v47[5]];

      uint64_t v5 = (void *)v26;
    }
    else
    {
      uint64_t v5 = v25;
    }
    id v27 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v52 = *MEMORY[0x1E4F28568];
    v53 = v5;
    v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
    *a4 = [v27 errorWithDomain:@"Memgraph Resymbolication Error" code:0 userInfo:v28];
  }
  BOOL v22 = [(NSMutableDictionary *)self->_resymbolicationUUIDs count] != 0;
LABEL_24:

  _Block_object_dispose(&v46, 8);
  return v22;
}

void __48__VMUSymbolStore__readContentsOfDsymFile_error___block_invoke(uint64_t a1)
{
  long long v2 = *(_OWORD *)(a1 + 40);
  id v1 = (id)v2;
  CSSymbolicatorForeachSymbolOwnerAtTime();
}

void __48__VMUSymbolStore__readContentsOfDsymFile_error___block_invoke_2(void *a1, unint64_t a2, unint64_t a3)
{
  uint64_t v6 = [NSString stringWithUTF8String:CSSymbolOwnerGetName()];
  uint64_t v7 = *(void *)(a1[6] + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  ++*(void *)(*(void *)(a1[7] + 8) + 24);
  v15._unint64_t opaque_1 = a2;
  v15._unint64_t opaque_2 = a3;
  _uuidStringForOwner(v15, __p);
  if (std::__hash_table<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>>>::find<std::string>((void *)(a1[4] + 16), (unsigned __int8 *)__p))
  {
    uint64_t v9 = a1[5];
    objc_super v10 = *(void **)(a1[4] + 112);
    if (v14 >= 0) {
      id v11 = __p;
    }
    else {
      id v11 = (void **)__p[0];
    }
    id v12 = [NSString stringWithUTF8String:v11];
    [v10 setObject:v9 forKeyedSubscript:v12];
  }
  if (v14 < 0) {
    operator delete(__p[0]);
  }
}

- (BOOL)_getDsymPathsForUUIDs:(id)a3 andReportProgress:(id)a4
{
  return [(NSMutableDictionary *)self->_resymbolicationUUIDs count] != 0;
}

- (void)_flagSymbolOwnersForResymbolication
{
  long long v2 = (void *)MEMORY[0x1AD0D9F90](self, a2);
  CSSymbolicatorForeachSymbolOwnerAtTime();
}

void __53__VMUSymbolStore__flagSymbolOwnersForResymbolication__block_invoke(uint64_t a1, _CSTypeRef a2)
{
  _uuidStringForOwner(a2, __p);
  std::string v3 = *(void **)(*(void *)(a1 + 32) + 112);
  if (v8 >= 0) {
    uint64_t v4 = __p;
  }
  else {
    uint64_t v4 = (void **)__p[0];
  }
  uint64_t v5 = [NSString stringWithUTF8String:v4];
  uint64_t v6 = [v3 objectForKeyedSubscript:v5];

  if (v6)
  {
    [v6 UTF8String];
    CSSymbolOwnerSetPathForSymbolication();
  }

  if (v8 < 0) {
    operator delete(__p[0]);
  }
}

- (BOOL)_refillSymbolOwnersWithDataAndReportProgress:(id)a3
{
  return 0;
}

- (VMUProcessObjectGraph)graph
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_graph);

  return (VMUProcessObjectGraph *)WeakRetained;
}

- (void)setGraph:(id)a3
{
}

- (_CSTypeRef)symbolicator
{
  unint64_t opaque_2 = self->_symbolicator._opaque_2;
  unint64_t opaque_1 = self->_symbolicator._opaque_1;
  result._unint64_t opaque_2 = opaque_2;
  result._unint64_t opaque_1 = opaque_1;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_graph);
  objc_storeStrong((id *)&self->_resymbolicationUUIDs, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table((uint64_t)&self->_addressesTracker);
  std::__hash_table<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>>>::~__hash_table((uint64_t)&self->_addressesGroupedByUuid);

  objc_storeStrong((id *)&self->_debugTimer, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_DWORD *)self + 12) = 1065353216;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *((_DWORD *)self + 22) = 1065353216;
  return self;
}

@end