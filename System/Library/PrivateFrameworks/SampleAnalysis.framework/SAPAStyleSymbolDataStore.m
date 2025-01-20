@interface SAPAStyleSymbolDataStore
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (unint64_t)sizeInBytesForSerializedVersion;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
@end

@implementation SAPAStyleSymbolDataStore

+ (id)classDictionaryKey
{
  return @"PASymbolDataStore";
}

- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  id v5 = a5;
  id v6 = +[SAException exceptionWithName:@"Encoding failure" reason:@"Trying to encode SAPAStyleSymbolDataStore" userInfo:0];
  objc_exception_throw(v6);
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v3 = a3;
  id v4 = +[SAException exceptionWithName:@"Encoding failure" reason:@"Trying to encode SAPAStyleSymbolDataStore" userInfo:0];
  objc_exception_throw(v4);
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  id v2 = +[SAException exceptionWithName:@"Encoding failure" reason:@"Trying to encode SAPAStyleSymbolDataStore" userInfo:0];
  objc_exception_throw(v2);
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  if ((unint64_t)(*(void *)a3 - 324506182) >= 3)
  {
    id v5 = +[SAException exceptionWithName:@"Decoding failure" reason:@"Bad PASymbolDataStore magic" userInfo:0];
    objc_exception_throw(v5);
  }
  return objc_alloc_init(SAPAStyleSymbolDataStore);
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  uint64_t v140 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v122 = a6;
  unint64_t v9 = *(void *)a3 - 324506182;
  if (v9 >= 3)
  {
    id v113 = +[SAException exceptionWithName:@"Decoding failure" reason:@"Bad PASymbolDataStore magic" userInfo:0];
    objc_exception_throw(v113);
  }
  v10 = (char *)a3 + qword_1BF3167C0[v9];
  uint64_t v11 = *((void *)a3 + 1);
  if (v11)
  {
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    id v14 = SASerializableNewMutableDictionaryFromIndexList((uint64_t)v10, v11, v8, v122, v12, v13);
    uint64_t v15 = *((void *)a3 + 1);
  }
  else
  {
    uint64_t v15 = 0;
  }
  uint64_t v16 = *((void *)a3 + 2);
  if (v16)
  {
    v17 = &v10[24 * v15];
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    v20 = SASerializableNewMutableDictionaryOfArraysFromIndexList(v17, v16, v8, v122, v18, v19);
  }
  else
  {
    v20 = 0;
  }
  if (*(void *)a3 > 0x13579246uLL)
  {
    v121 = v20;
    if (*(void *)a3 != 324506183)
    {
      unint64_t v21 = *((void *)a3 + 5);
      v22 = objc_opt_class();
      v23 = _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v21, v8, v122, v22, 0);
      v25 = v23;
      if (v23)
      {
        v26 = objc_msgSend(objc_getProperty(v23, v24, 8, 1), "binary");
        v27 = [v26 uuid];
        +[SAKernelCache kernelCacheWithUUID:loadAddress:](SAKernelCache, "kernelCacheWithUUID:loadAddress:", v27, objc_msgSend(objc_getProperty(v25, v28, 8, 1), "loadAddress"));
        v29 = (SAKernelCache *)objc_claimAutoreleasedReturnValue();
        kernelCache = self->_kernelCache;
        self->_kernelCache = v29;
      }
    }
    unint64_t v31 = *((void *)a3 + 3);
    v32 = objc_opt_class();
    Property = _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v31, v8, v122, v32, 0);
    selfa = Property;
    if (Property) {
      Property = objc_getProperty(Property, v34, 8, 1);
    }
    v35 = [Property binary];
    uint64_t v36 = [v35 uuid];

    v119 = (void *)v36;
    if (v36)
    {
      v37 = [v121 objectForKeyedSubscript:v36];
      v38 = v37;
      if (v37 && [v37 count])
      {
        id v123 = (id)a3;
        id v117 = v8;
        v127 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v38, "count"));
        long long v134 = 0u;
        long long v135 = 0u;
        long long v136 = 0u;
        long long v137 = 0u;
        v115 = v38;
        id obj = v38;
        uint64_t v39 = [obj countByEnumeratingWithState:&v134 objects:v139 count:16];
        if (v39)
        {
          uint64_t v41 = v39;
          uint64_t v42 = *(void *)v135;
          do
          {
            uint64_t v43 = 0;
            do
            {
              if (*(void *)v135 != v42) {
                objc_enumerationMutation(obj);
              }
              v44 = *(void **)(*((void *)&v134 + 1) + 8 * v43);
              if (v44) {
                id v45 = objc_getProperty(*(id *)(*((void *)&v134 + 1) + 8 * v43), v40, 8, 1);
              }
              else {
                id v45 = 0;
              }
              v46 = [v45 binary];
              v48 = -[SABinary segmentWithCleanName:](v46, @"__TEXT");
              if (!v48)
              {
                v48 = +[SASegment segmentWithBinary:name:length:]((uint64_t)SASegment, v46, @"__TEXT", [v46 length]);
                -[SABinary addSegment:](v46, v48);
              }
              if (v44) {
                id v49 = objc_getProperty(v44, v47, 8, 1);
              }
              else {
                id v49 = 0;
              }
              uint64_t v51 = [v49 loadAddress];
              id v52 = selfa;
              if (selfa) {
                id v52 = objc_getProperty(selfa, v50, 8, 1);
              }
              uint64_t v54 = [v52 loadAddress];
              if (v44)
              {
                int v55 = objc_msgSend(objc_getProperty(v44, v53, 8, 1), "isInKernelAddressSpace");
                id v57 = objc_getProperty(v44, v56, 8, 1);
              }
              else
              {
                int v55 = [0 isInKernelAddressSpace];
                id v57 = 0;
              }
              uint64_t v58 = v54 + v51;
              v59 = [v57 exclave];
              v60 = +[SABinaryLoadInfo binaryLoadInfoWithSegment:loadAddress:isInKernelAddressSpace:exclave:](SABinaryLoadInfo, v48, v58, v55, v59);
              [v127 addObject:v60];

              ++v43;
            }
            while (v41 != v43);
            uint64_t v61 = [obj countByEnumeratingWithState:&v134 objects:v139 count:16];
            uint64_t v41 = v61;
          }
          while (v61);
        }

        if (selfa) {
          id v63 = objc_getProperty(selfa, v62, 8, 1);
        }
        else {
          id v63 = 0;
        }
        id v8 = v117;
        v64 = [v63 binary];
        v66 = [v64 uuid];
        a3 = v123;
        if (selfa) {
          id v67 = objc_getProperty(selfa, v65, 8, 1);
        }
        else {
          id v67 = 0;
        }
        v38 = v115;
        uint64_t v68 = [v67 loadAddress];
        v69 = (void *)[v127 copy];
        +[SASharedCache sharedCacheWithUUID:slide:binaryLoadInfos:]((uint64_t)SASharedCache, v66, v68, v69);
        v70 = (SASharedCache *)objc_claimAutoreleasedReturnValue();
        sharedCache64Bit = self->_sharedCache64Bit;
        self->_sharedCache64Bit = v70;
      }
    }
    unint64_t v72 = *((void *)a3 + 4);
    v73 = objc_opt_class();
    v74 = _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v72, v8, v122, v73, 0);
    v76 = v74;
    if (v74) {
      v74 = objc_getProperty(v74, v75, 8, 1);
    }
    v77 = [v74 binary];
    v78 = [v77 uuid];

    v20 = v121;
    if (v78)
    {
      v79 = [v121 objectForKeyedSubscript:v78];
      v80 = v79;
      if (v79 && [v79 count])
      {
        v116 = v78;
        id v118 = v8;
        v128 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v80, "count"));
        long long v130 = 0u;
        long long v131 = 0u;
        long long v132 = 0u;
        long long v133 = 0u;
        v114 = v80;
        id v124 = v80;
        uint64_t v81 = [v124 countByEnumeratingWithState:&v130 objects:v138 count:16];
        if (v81)
        {
          uint64_t v83 = v81;
          id obja = *(id *)v131;
          do
          {
            uint64_t v84 = 0;
            do
            {
              if (*(id *)v131 != obja) {
                objc_enumerationMutation(v124);
              }
              v85 = *(void **)(*((void *)&v130 + 1) + 8 * v84);
              if (v85) {
                id v86 = objc_getProperty(*(id *)(*((void *)&v130 + 1) + 8 * v84), v82, 8, 1);
              }
              else {
                id v86 = 0;
              }
              v87 = [v86 binary];
              v89 = -[SABinary segmentWithCleanName:](v87, @"__TEXT");
              if (!v89)
              {
                v89 = +[SASegment segmentWithBinary:name:length:]((uint64_t)SASegment, v87, @"__TEXT", [v87 length]);
                -[SABinary addSegment:](v87, v89);
              }
              if (v85) {
                id v90 = objc_getProperty(v85, v88, 8, 1);
              }
              else {
                id v90 = 0;
              }
              uint64_t v92 = [v90 loadAddress];
              if (v76) {
                id v93 = objc_getProperty(v76, v91, 8, 1);
              }
              else {
                id v93 = 0;
              }
              uint64_t v95 = [v93 loadAddress];
              if (v85)
              {
                int v96 = objc_msgSend(objc_getProperty(v85, v94, 8, 1), "isInKernelAddressSpace");
                id v98 = objc_getProperty(v85, v97, 8, 1);
              }
              else
              {
                int v96 = [0 isInKernelAddressSpace];
                id v98 = 0;
              }
              uint64_t v99 = v95 + v92;
              v100 = [v98 exclave];
              v101 = +[SABinaryLoadInfo binaryLoadInfoWithSegment:loadAddress:isInKernelAddressSpace:exclave:](SABinaryLoadInfo, v89, v99, v96, v100);
              [v128 addObject:v101];

              ++v84;
            }
            while (v83 != v84);
            uint64_t v102 = [v124 countByEnumeratingWithState:&v130 objects:v138 count:16];
            uint64_t v83 = v102;
          }
          while (v102);
        }

        if (v76) {
          id v104 = objc_getProperty(v76, v103, 8, 1);
        }
        else {
          id v104 = 0;
        }
        v105 = [v104 binary];
        v107 = [v105 uuid];
        id v8 = v118;
        if (v76) {
          id v108 = objc_getProperty(v76, v106, 8, 1);
        }
        else {
          id v108 = 0;
        }
        uint64_t v109 = [v108 loadAddress];
        v110 = (void *)[v128 copy];
        +[SASharedCache sharedCacheWithUUID:slide:binaryLoadInfos:]((uint64_t)SASharedCache, v107, v109, v110);
        v111 = (SASharedCache *)objc_claimAutoreleasedReturnValue();
        sharedCache32Bit = self->_sharedCache32Bit;
        self->_sharedCache32Bit = v111;

        v20 = v121;
        v80 = v114;
        v78 = v116;
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kernelCache, 0);
  objc_storeStrong((id *)&self->_sharedCache32Bit, 0);
  objc_storeStrong((id *)&self->_sharedCache64Bit, 0);
}

@end