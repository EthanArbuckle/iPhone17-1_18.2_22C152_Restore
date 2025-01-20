@interface NPKeyBag
- (BOOL)updateHashMatchesEdgeSet:(id)a3;
- (NPKeyBag)init;
- (NPKeyBag)initWithData:(id)a3;
- (NPKeyBag)initWithOnRamps:(id)a3 currentNetworkInfo:(id)a4 currentEdgeIndex:(int64_t)a5 currentEdgeList:(id)a6 generation:(unsigned int)a7 identifier:(id)a8 updateHash:(id)a9;
- (NSArray)keys;
- (NSArray)onRampList;
- (NSData)updateHash;
- (NSDictionary)onRampMap;
- (NSPredicate)validOnRampPredicate;
- (NSPredicate)validOnRampWithTFOPredicate;
- (double)lastUsedTimestamp;
- (double)timeSinceLastUsed;
- (id)copyUsableOnRamps:(BOOL)a3 requireTFO:(BOOL)a4;
- (id)data;
- (id)getOnRampForEndpoint:(id)a3;
- (int64_t)TFOStatusOverride;
- (int64_t)fallbackReason;
- (unsigned)generation;
- (unsigned)index;
- (void)createOnRamps;
- (void)logWithMessage:(id)a3 identifier:(id)a4;
- (void)moveToNextOnRamp;
- (void)moveToOnRamp:(id)a3;
- (void)removeIPv6Keys;
- (void)setFallbackReason:(int64_t)a3;
- (void)setGeneration:(unsigned int)a3;
- (void)setIndex:(unsigned int)a3;
- (void)setKeys:(id)a3;
- (void)setLastUsedTimestamp:(double)a3;
- (void)setOnRampList:(id)a3;
- (void)setOnRampMap:(id)a3;
- (void)setTFOStatusOverride:(int64_t)a3;
- (void)setUpdateHash:(id)a3;
- (void)setValidOnRampPredicate:(id)a3;
- (void)setValidOnRampWithTFOPredicate:(id)a3;
@end

@implementation NPKeyBag

- (NPKeyBag)init
{
  v8.receiver = self;
  v8.super_class = (Class)NPKeyBag;
  v2 = [(NPKeyBag *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1481];
    validOnRampPredicate = v2->_validOnRampPredicate;
    v2->_validOnRampPredicate = (NSPredicate *)v3;

    uint64_t v5 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1483];
    validOnRampWithTFOPredicate = v2->_validOnRampWithTFOPredicate;
    v2->_validOnRampWithTFOPredicate = (NSPredicate *)v5;
  }
  return v2;
}

BOOL __16__NPKeyBag_init__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isDayPassExpired])
  {
    BOOL v3 = 0;
  }
  else
  {
    v4 = [v2 tuscanyEndpoint];
    uint64_t v5 = [v4 hosts];
    BOOL v3 = [v5 count] != 0;
  }
  return v3;
}

BOOL __16__NPKeyBag_init__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isDayPassExpired])
  {
    BOOL v3 = 0;
  }
  else
  {
    v4 = [v2 tuscanyEndpoint];
    uint64_t v5 = [v4 hosts];
    if ([v5 count]) {
      BOOL v3 = [v2 TFOStatus] == 2;
    }
    else {
      BOOL v3 = 0;
    }
  }
  return v3;
}

- (NPKeyBag)initWithData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NPKeyBag *)self init];
  if (v5)
  {
    v6 = (void *)[v4 mutableCopy];
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__4;
    v16 = __Block_byref_object_dispose__4;
    id v17 = [MEMORY[0x1E4F1CA48] array];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __25__NPKeyBag_initWithData___block_invoke;
    v9[3] = &unk_1E5A3C400;
    v7 = v5;
    v10 = v7;
    v11 = &v12;
    -[NSMutableData enumerateTLVsUsingBlock:](v6, v9);
    objc_storeStrong(v7 + 2, (id)v13[5]);

    _Block_object_dispose(&v12, 8);
  }

  return v5;
}

uint64_t __25__NPKeyBag_initWithData___block_invoke(uint64_t a1, int a2, unsigned int a3, _DWORD *a4)
{
  if (a2 == 2 && a3 == 4)
  {
    *(_DWORD *)(*(void *)(a1 + 32) + 8) = *a4;
  }
  else if (a2 == 5 && a3 == 8)
  {
    *(void *)(*(void *)(a1 + 32) + 24) = *(void *)a4;
  }
  else if (a2 == 6 && a3 == 4)
  {
    *(_DWORD *)(*(void *)(a1 + 32) + 12) = *a4;
  }
  else
  {
    uint64_t v6 = a3;
    if (a2 == 1 && a3)
    {
      v7 = [NPKey alloc];
      objc_super v8 = [MEMORY[0x1E4F1C9B8] dataWithBytes:a4 length:v6];
      v9 = [(NPKey *)v7 initWithData:v8];

      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v9];
    }
    else if (a2 == 7 && a3 == 8)
    {
      *(void *)(*(void *)(a1 + 32) + 48) = *(void *)a4;
    }
    else if (a2 == 8 && a3)
    {
      uint64_t v10 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:a4 length:a3];
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = *(void **)(v11 + 32);
      *(void *)(v11 + 32) = v10;
    }
    else if (a2 == 9 && a3 == 8)
    {
      *(void *)(*(void *)(a1 + 32) + 40) = *(void *)a4;
    }
  }
  return 1;
}

- (NPKeyBag)initWithOnRamps:(id)a3 currentNetworkInfo:(id)a4 currentEdgeIndex:(int64_t)a5 currentEdgeList:(id)a6 generation:(unsigned int)a7 identifier:(id)a8 updateHash:(id)a9
{
  unsigned int v12 = a5;
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v75 = a6;
  id v70 = a8;
  id v17 = a9;
  v71 = v16;
  v72 = [(NPKeyBag *)self init];
  if (v72)
  {
    unsigned int v68 = v12;
    unsigned int v69 = a7;
    id v67 = v17;
    v76 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    double v18 = 0.0;
    if (v16)
    {
      v19 = [v16 lastUsed];

      if (v19)
      {
        v20 = [v16 lastUsed];
        [v20 timeIntervalSinceReferenceDate];
        double v18 = v21;
      }
    }
    if ([v15 count])
    {
      char v77 = 0;
      char v23 = 0;
      unint64_t v24 = 0;
      *(void *)&long long v22 = 138413058;
      long long v66 = v22;
      while (1)
      {
        v25 = objc_msgSend(v15, "objectAtIndexedSubscript:", v24, v66);
        v26 = objc_alloc_init(NPKey);
        if (([v25 isDayPassExpired] & 1) != 0
          || ([v25 tuscanyEndpoint],
              v27 = objc_claimAutoreleasedReturnValue(),
              BOOL v28 = v27 == 0,
              v27,
              v28))
        {
          *(void *)uu = 0;
          *(void *)&uu[8] = 0;
          uuid_clear(uu);
          [(NPKey *)v26 setInfo:0];
          [(NPKey *)v26 setSession_counter:0];
          uint64_t v36 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:uu];
          [(NPKey *)v26 setUuid:v36];

          v37 = [v25 dayPass];
          LOBYTE(v36) = v37 != 0;

          v77 |= v36;
        }
        else
        {
          v29 = [v25 dayPass];
          int v82 = 0;
          int v82 = [v25 maxFrameSize];
          uint64_t v81 = 0;
          v30 = [v25 dayPassCreationDate];
          [v30 timeIntervalSince1970];
          uint64_t v32 = v31;

          uint64_t v81 = v32;
          uint64_t v80 = 0;
          [v25 dayPassHardExpiry];
          uint64_t v80 = v33;
          unsigned int v79 = 0;
          unsigned int v79 = [v29 length];
          id v34 = v29;
          uint64_t v35 = [v34 bytes];
          if (v35) {
            unsigned int v73 = *(_DWORD *)(v35 + 92);
          }
          else {
            unsigned int v73 = 0;
          }
          uint64_t v78 = 0;
          if (!v75
            || v24 >= [v75 count]
            || ([v75 objectAtIndexedSubscript:v24],
                v38 = objc_claimAutoreleasedReturnValue(),
                BOOL v39 = v38 == 0,
                v38,
                v39))
          {
            v45 = 0;
            BOOL v47 = 0;
          }
          else
          {
            v40 = [v75 objectAtIndexedSubscript:v24];
            uint64_t v78 = [v40 TFOStatus];
            v41 = [v40 addressFamily];
            v42 = [v25 getTuscanyEndpoint:v41];

            v43 = nplog_obj();
            v44 = v43;
            if (!v42)
            {
              if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
              {
                v74 = [v40 addressFamilyString];
                v57 = [v40 TFOStatusString];
                v58 = [v40 addressFamilyString];
                *(_DWORD *)uu = v66;
                *(void *)&uu[4] = v70;
                *(_WORD *)&uu[12] = 2112;
                *(void *)&uu[14] = v74;
                __int16 v84 = 2112;
                v85 = v57;
                __int16 v86 = 2112;
                v87 = v58;
                _os_log_error_impl(&dword_1A0FEE000, v44, OS_LOG_TYPE_ERROR, "%@: Skipping onRamp with %@ <TFOStatus: %@> because it does not have a Tuscany endpoint with address family %@", uu, 0x2Au);
              }
              goto LABEL_28;
            }
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
            {
              v55 = [v40 addressFamilyString];
              v56 = [v40 TFOStatusString];
              *(_DWORD *)uu = v66;
              *(void *)&uu[4] = v70;
              *(_WORD *)&uu[12] = 2112;
              *(void *)&uu[14] = v55;
              __int16 v84 = 2112;
              v85 = v42;
              __int16 v86 = 2112;
              v87 = v56;
              _os_log_debug_impl(&dword_1A0FEE000, v44, OS_LOG_TYPE_DEBUG, "%@: Sending onRamp with %@ %@ <TFOStatus: %@> to the kernel", uu, 0x2Au);
            }
            v45 = [v42 encodedData];
            v46 = [v40 addressFamily];
            BOOL v47 = [v46 intValue] == 30;
          }
          v48 = nplog_obj();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
          {
            v54 = [v25 dayPassUUID];
            *(_DWORD *)uu = 138412802;
            *(void *)&uu[4] = v70;
            *(_WORD *)&uu[12] = 2112;
            *(void *)&uu[14] = v54;
            __int16 v84 = 1024;
            LODWORD(v85) = v73;
            _os_log_debug_impl(&dword_1A0FEE000, v48, OS_LOG_TYPE_DEBUG, "%@: Sending day pass UUID %@, counter %u to the kernel", uu, 0x1Cu);
          }
          v49 = [MEMORY[0x1E4F1CA58] data];
          v50 = v49;
          if (v49)
          {
            [v49 appendBytes:&v79 length:4];
            uint64_t v51 = [v34 bytes];
            [v50 appendBytes:v51 length:v79];
            [v50 appendBytes:&v82 length:4];
            [v50 appendBytes:&v78 length:8];
            [v50 appendBytes:&v81 length:8];
            [v50 appendBytes:&v80 length:8];
            id v52 = v45;
            objc_msgSend(v50, "appendBytes:length:", objc_msgSend(v52, "bytes"), objc_msgSend(v52, "length"));
            [(NPKey *)v26 setInfo:v50];
            [(NPKey *)v26 setSession_counter:v73];
            v53 = [v25 dayPassUUID];
            [(NPKey *)v26 setUuid:v53];

            [(NPKey *)v26 setFlags:v47];
          }

          char v23 = 1;
        }
        [v25 registerAgentWithKey:v26];
        if (v26) {
          [(NSArray *)v76 addObject:v26];
        }
LABEL_28:

        if (++v24 >= [v15 count]) {
          goto LABEL_34;
        }
      }
    }
    char v23 = 0;
    char v77 = 0;
LABEL_34:
    keys = v72->_keys;
    v72->_keys = v76;
    v60 = v76;

    v72->_index = v68;
    v72->_generation = v69;
    v72->_lastUsedTimestamp = v18;
    objc_storeStrong((id *)&v72->_updateHash, a9);

    uint64_t v61 = [v71 lastFallbackReason];
    uint64_t v62 = 34;
    if ((v77 & 1) == 0) {
      uint64_t v62 = 0;
    }
    if ((v61 != 0) | v23 & 1) {
      int64_t v63 = v61;
    }
    else {
      int64_t v63 = v62;
    }
    v72->_fallbackReason = v63;
    v64 = v72;
    id v17 = v67;
  }

  return v72;
}

- (id)data
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = [(NPKeyBag *)self keys];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v18 + 1) + 8 * i) data];
        unsigned __int16 v10 = [v9 length];
        id v11 = v9;
        -[NSMutableData appendType:length:value:](v3, 1, v10, [v11 bytes]);
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  unsigned int v17 = [(NPKeyBag *)self index];
  -[NSMutableData appendType:length:value:](v3, 2, 4u, (uint64_t)&v17);
  -[NSMutableData appendType:length:value:](v3, 5, 8u, (uint64_t)&self->_fallbackReason);
  -[NSMutableData appendType:length:value:](v3, 6, 4u, (uint64_t)&self->_generation);
  -[NSMutableData appendType:length:value:](v3, 7, 8u, (uint64_t)&self->_lastUsedTimestamp);
  unsigned int v12 = [(NPKeyBag *)self updateHash];

  if (v12)
  {
    v13 = [(NPKeyBag *)self updateHash];
    unsigned __int16 v14 = [v13 length];
    id v15 = [(NPKeyBag *)self updateHash];
    -[NSMutableData appendType:length:value:](v3, 8, v14, [v15 bytes]);
  }
  -[NSMutableData appendType:length:value:](v3, 9, 8u, (uint64_t)&self->_TFOStatusOverride);
  return v3;
}

- (void)createOnRamps
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ([(NSArray *)self->_keys count])
  {
    id v4 = 0;
    id v5 = 0;
    unint64_t v6 = 0;
    *(void *)&long long v3 = 134217984;
    long long v18 = v3;
    do
    {
      uint64_t v7 = -[NSArray objectAtIndexedSubscript:](self->_keys, "objectAtIndexedSubscript:", v6, v18);
      objc_super v8 = [[NPTuscanyOnRamp alloc] initWithKey:v7];
      if (self->_TFOStatusOverride)
      {
        v9 = nplog_obj();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          int64_t TFOStatusOverride = self->_TFOStatusOverride;
          *(_DWORD *)buf = v18;
          int64_t v20 = TFOStatusOverride;
          _os_log_impl(&dword_1A0FEE000, v9, OS_LOG_TYPE_DEFAULT, "Overriding TFO status to %ld", buf, 0xCu);
        }

        [(NPTuscanyOnRamp *)v8 setTFOStatus:self->_TFOStatusOverride];
      }
      if (!v5) {
        id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      }
      [v5 addObject:v8];
      if ([(NSPredicate *)self->_validOnRampPredicate evaluateWithObject:v8])
      {
        id v11 = [(NPTuscanyOnRamp *)v8 tuscanyEndpoint];
        unsigned int v12 = [v11 hosts];
        v13 = [v12 objectAtIndexedSubscript:0];

        if (!v4) {
          id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        }
        [v4 setObject:v8 forKeyedSubscript:v13];
      }
      ++v6;
    }
    while (v6 < [(NSArray *)self->_keys count]);
    if (v4)
    {
      unsigned __int16 v14 = (NSDictionary *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v4];
      goto LABEL_18;
    }
  }
  else
  {
    id v5 = 0;
  }
  unsigned __int16 v14 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1C9E8]);
  id v4 = 0;
LABEL_18:
  onRampMap = self->_onRampMap;
  self->_onRampMap = v14;

  if (v5) {
    id v16 = (NSArray *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v5];
  }
  else {
    id v16 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
  }
  onRampList = self->_onRampList;
  self->_onRampList = v16;
}

- (id)copyUsableOnRamps:(BOOL)a3 requireTFO:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v7 = self->_validOnRampPredicate;
  if (v4)
  {
    objc_super v8 = self->_validOnRampWithTFOPredicate;

    uint64_t v7 = v8;
  }
  if (!v5)
  {
    NSUInteger v10 = [(NPKeyBag *)self index];
    if ([(NSArray *)self->_onRampList count] <= v10)
    {
LABEL_10:
      v9 = 0;
    }
    else
    {
      NSUInteger v11 = v10;
      while (1)
      {
        unsigned int v12 = [(NSArray *)self->_onRampList objectAtIndexedSubscript:v11];
        if ([(NSPredicate *)v7 evaluateWithObject:v12]) {
          break;
        }

        NSUInteger v10 = (v10 + 1);
        NSUInteger v13 = [(NSArray *)self->_onRampList count];
        NSUInteger v11 = v10;
        if (v13 <= v10) {
          goto LABEL_10;
        }
      }
      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v12, 0);
    }
    [(NPKeyBag *)self setIndex:v10];
LABEL_13:
    if (v9) {
      goto LABEL_20;
    }
    goto LABEL_14;
  }
  v9 = [(NSArray *)self->_onRampList filteredArrayUsingPredicate:v7];
  if ([v9 count]) {
    goto LABEL_13;
  }

LABEL_14:
  if ([(NSArray *)self->_onRampList count])
  {
    if (v4) {
      uint64_t v14 = 24;
    }
    else {
      uint64_t v14 = 34;
    }
    [(NPKeyBag *)self setFallbackReason:v14];
  }
  v9 = 0;
LABEL_20:

  return v9;
}

- (void)moveToNextOnRamp
{
  if ([(NSArray *)self->_keys count]) {
    uint64_t v3 = [(NPKeyBag *)self index] + 1;
  }
  else {
    uint64_t v3 = 0;
  }
  [(NPKeyBag *)self setIndex:v3];
}

- (void)logWithMessage:(id)a3 identifier:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = nplog_obj();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

  if (v9)
  {
    NSUInteger v10 = nplog_obj();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      id v36 = v7;
      __int16 v37 = 2080;
      *(void *)v38 = [v6 UTF8String];
      _os_log_debug_impl(&dword_1A0FEE000, v10, OS_LOG_TYPE_DEBUG, "%@: %s:", buf, 0x16u);
    }

    NSUInteger v11 = [(NPKeyBag *)self keys];
    uint64_t v12 = [v11 count];

    if (v12)
    {
      uint64_t v14 = 0;
      unsigned int v15 = 1;
      *(void *)&long long v13 = 138413314;
      long long v34 = v13;
      do
      {
        id v16 = [(NPKeyBag *)self keys];
        unsigned int v17 = [v16 objectAtIndexedSubscript:v14];

        long long v18 = nplog_obj();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          long long v22 = [v17 uuid];
          uint64_t v23 = [v17 info];
          uint64_t v24 = [v23 length];
          int v25 = objc_msgSend(v17, "session_counter");
          *(_DWORD *)buf = v34;
          id v36 = v7;
          __int16 v37 = 1024;
          *(_DWORD *)v38 = v15 - 1;
          *(_WORD *)&v38[4] = 2112;
          *(void *)&v38[6] = v22;
          __int16 v39 = 2048;
          uint64_t v40 = v24;
          __int16 v41 = 1024;
          int v42 = v25;
          _os_log_debug_impl(&dword_1A0FEE000, v18, OS_LOG_TYPE_DEBUG, "%@:   %u. [%@] [%lu info bytes] [%u session counter]", buf, 0x2Cu);
        }
        uint64_t v14 = v15;
        long long v19 = [(NPKeyBag *)self keys];
        unint64_t v20 = [v19 count];
      }
      while (v20 > v15++);
    }
    v26 = nplog_obj();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v30 = [(NPKeyBag *)self index];
      *(_DWORD *)buf = 138412546;
      id v36 = v7;
      __int16 v37 = 1024;
      *(_DWORD *)v38 = v30;
      _os_log_debug_impl(&dword_1A0FEE000, v26, OS_LOG_TYPE_DEBUG, "%@:  Current index: %u", buf, 0x12u);
    }

    v27 = nplog_obj();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      int64_t v31 = [(NPKeyBag *)self fallbackReason];
      *(_DWORD *)buf = 138412546;
      id v36 = v7;
      __int16 v37 = 2048;
      *(void *)v38 = v31;
      _os_log_debug_impl(&dword_1A0FEE000, v27, OS_LOG_TYPE_DEBUG, "%@:  Fallback Reason: %ld", buf, 0x16u);
    }

    BOOL v28 = nplog_obj();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v32 = [(NPKeyBag *)self generation];
      *(_DWORD *)buf = 138412546;
      id v36 = v7;
      __int16 v37 = 1024;
      *(_DWORD *)v38 = v32;
      _os_log_debug_impl(&dword_1A0FEE000, v28, OS_LOG_TYPE_DEBUG, "%@:  Generation: %u", buf, 0x12u);
    }

    v29 = nplog_obj();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      int64_t v33 = [(NPKeyBag *)self TFOStatusOverride];
      *(_DWORD *)buf = 138412546;
      id v36 = v7;
      __int16 v37 = 2048;
      *(void *)v38 = v33;
      _os_log_debug_impl(&dword_1A0FEE000, v29, OS_LOG_TYPE_DEBUG, "%@:  TFO status override: %ld", buf, 0x16u);
    }
  }
}

- (double)timeSinceLastUsed
{
  double lastUsedTimestamp = self->_lastUsedTimestamp;
  double v3 = 0.0;
  if (lastUsedTimestamp > 0.0)
  {
    BOOL v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:lastUsedTimestamp];
    BOOL v5 = v4;
    if (v4)
    {
      [v4 timeIntervalSinceNow];
      if (v6 < 0.0)
      {
        [v5 timeIntervalSinceNow];
        double v3 = fabs(v7);
      }
    }
  }
  return v3;
}

- (BOOL)updateHashMatchesEdgeSet:(id)a3
{
  id v4 = a3;
  BOOL v5 = self->_updateHash;
  if (v5)
  {
    double v6 = [v4 updateHash];

    if (v6)
    {
      double v7 = [v4 updateHash];
      LOBYTE(v6) = [(NSData *)v5 isEqualToData:v7];
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return (char)v6;
}

- (id)getOnRampForEndpoint:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    double v6 = v4;
    do
    {
      double v7 = v6;
      objc_super v8 = [MEMORY[0x1E4F38BE8] endpointWithCEndpoint:v6];
      BOOL v9 = [(NPKeyBag *)self onRampMap];
      NSUInteger v10 = [v9 objectForKeyedSubscript:v8];

      double v6 = (void *)nw_endpoint_copy_parent_endpoint();
    }
    while (v6 && !v10);
  }
  else
  {
    NSUInteger v10 = 0;
  }

  return v10;
}

- (void)moveToOnRamp:(id)a3
{
  id v13 = a3;
  id v4 = [(NPKeyBag *)self onRampList];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    unint64_t v6 = 0;
    while (1)
    {
      double v7 = [(NPKeyBag *)self onRampList];
      objc_super v8 = [v7 objectAtIndexedSubscript:v6];

      BOOL v9 = [v8 dayPassUUID];
      int v10 = [v9 isEqual:v13];

      if (v10) {
        break;
      }

      ++v6;
      NSUInteger v11 = [(NPKeyBag *)self onRampList];
      unint64_t v12 = [v11 count];

      if (v6 >= v12) {
        goto LABEL_7;
      }
    }
    [(NPKeyBag *)self setIndex:v6];
  }
LABEL_7:
}

- (void)removeIPv6Keys
{
  id v8 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1486];
  NSUInteger v3 = [(NSArray *)self->_keys count];
  id v4 = [(NSArray *)self->_keys filteredArrayUsingPredicate:v8];
  keys = self->_keys;
  self->_keys = v4;

  unint64_t index = self->_index;
  if (v3 > index && [(NSArray *)self->_keys count] <= index)
  {
    if ([(NSArray *)self->_keys count]) {
      unsigned int v7 = [(NSArray *)self->_keys count] - 1;
    }
    else {
      unsigned int v7 = 0;
    }
    self->_unint64_t index = v7;
  }
}

BOOL __26__NPKeyBag_removeIPv6Keys__block_invoke(uint64_t a1, void *a2)
{
  return ([a2 flags] & 1) == 0;
}

- (NSArray)keys
{
  return self->_keys;
}

- (void)setKeys:(id)a3
{
}

- (unsigned)index
{
  return self->_index;
}

- (void)setIndex:(unsigned int)a3
{
  self->_unint64_t index = a3;
}

- (int64_t)fallbackReason
{
  return self->_fallbackReason;
}

- (void)setFallbackReason:(int64_t)a3
{
  self->_fallbackReason = a3;
}

- (unsigned)generation
{
  return self->_generation;
}

- (void)setGeneration:(unsigned int)a3
{
  self->_generation = a3;
}

- (NSData)updateHash
{
  return self->_updateHash;
}

- (void)setUpdateHash:(id)a3
{
}

- (int64_t)TFOStatusOverride
{
  return self->_TFOStatusOverride;
}

- (void)setTFOStatusOverride:(int64_t)a3
{
  self->_int64_t TFOStatusOverride = a3;
}

- (double)lastUsedTimestamp
{
  return self->_lastUsedTimestamp;
}

- (void)setLastUsedTimestamp:(double)a3
{
  self->_double lastUsedTimestamp = a3;
}

- (NSDictionary)onRampMap
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setOnRampMap:(id)a3
{
}

- (NSArray)onRampList
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setOnRampList:(id)a3
{
}

- (NSPredicate)validOnRampPredicate
{
  return (NSPredicate *)objc_getProperty(self, a2, 72, 1);
}

- (void)setValidOnRampPredicate:(id)a3
{
}

- (NSPredicate)validOnRampWithTFOPredicate
{
  return (NSPredicate *)objc_getProperty(self, a2, 80, 1);
}

- (void)setValidOnRampWithTFOPredicate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validOnRampWithTFOPredicate, 0);
  objc_storeStrong((id *)&self->_validOnRampPredicate, 0);
  objc_storeStrong((id *)&self->_onRampList, 0);
  objc_storeStrong((id *)&self->_onRampMap, 0);
  objc_storeStrong((id *)&self->_updateHash, 0);
  objc_storeStrong((id *)&self->_keys, 0);
}

@end