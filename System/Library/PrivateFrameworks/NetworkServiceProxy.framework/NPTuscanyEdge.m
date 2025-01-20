@interface NPTuscanyEdge
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)probePending;
- (BOOL)reResolve;
- (NPLocation)location;
- (NPTuscanyEdge)initWithCoder:(id)a3;
- (NPTuscanyEdge)initWithLabel:(id)a3 index:(unint64_t)a4 onRampEndpoint:(id)a5 probeEndpoint:(id)a6 location:(id)a7;
- (NPWaldo)parentWaldo;
- (NSDate)lastUsed;
- (NSDictionary)currentOnRampIndexList;
- (NSDictionary)onRampLists;
- (NSString)label;
- (NWEndpoint)onRampEndpoint;
- (NWEndpoint)probeEndpoint;
- (NWEndpoint)savedEndpoint;
- (double)distance;
- (id)description;
- (id)getCurrentOnRamp:(id)a3;
- (id)getOnRamp:(int64_t)a3 addressFamily:(id)a4;
- (id)getPortFromEndpoint:(id)a3 defaultPort:(id)a4;
- (id)nextOnRampForLatency:(id)a3 outIndex:(int64_t *)a4;
- (id)unsynthesizeAddresses:(id)a3;
- (int64_t)compareByDistance:(id)a3;
- (int64_t)currentIndex:(id)a3;
- (unint64_t)hash;
- (unint64_t)index;
- (void)encodeWithCoder:(id)a3;
- (void)iterateOnRampsForAddressFamily:(id)a3 withBlock:(id)a4;
- (void)linkWithOnRampsRetainMissingAddressFamilies:(BOOL)a3;
- (void)resolveWithCompletionHandler:(id)a3;
- (void)setCurrentIndex:(int64_t)a3 addressFamily:(id)a4;
- (void)setCurrentOnRampIndexList:(id)a3;
- (void)setDistance:(double)a3;
- (void)setIndex:(unint64_t)a3;
- (void)setLastUsed:(id)a3;
- (void)setOnRampLists:(id)a3;
- (void)setParentWaldo:(id)a3;
- (void)setProbePending:(BOOL)a3;
- (void)setReResolve:(BOOL)a3;
- (void)setSavedEndpoint:(id)a3;
@end

@implementation NPTuscanyEdge

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NPTuscanyEdge)initWithLabel:(id)a3 index:(unint64_t)a4 onRampEndpoint:(id)a5 probeEndpoint:(id)a6 location:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)NPTuscanyEdge;
  v17 = [(NPTuscanyEdge *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_label, a3);
    objc_storeStrong((id *)&v18->_onRampEndpoint, a5);
    v18->_index = a4;
    objc_storeStrong((id *)&v18->_location, a7);
    objc_storeStrong((id *)&v18->_probeEndpoint, a6);
  }

  return v18;
}

- (NPTuscanyEdge)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Name"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"EdgeIndex"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProbeEndpoint"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"OnRampEndpoint"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Location"];
  v10 = [(NPTuscanyEdge *)self initWithLabel:v5 index:v6 onRampEndpoint:v8 probeEndpoint:v7 location:v9];
  if (v10)
  {
    v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    id v15 = objc_msgSend(v11, "setWithObjects:", v12, v13, v14, objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"OnRampList"];
    onRampLists = v10->_onRampLists;
    v10->_onRampLists = (NSDictionary *)v16;

    if (v10->_onRampLists)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v18 = v10->_onRampLists;
        v10->_onRampLists = 0;
      }
    }
    v19 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v20 = objc_opt_class();
    v21 = objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
    uint64_t v22 = [v4 decodeObjectOfClasses:v21 forKey:@"CurrentOnRampIndexList"];
    currentOnRampIndexList = v10->_currentOnRampIndexList;
    v10->_currentOnRampIndexList = (NSDictionary *)v22;

    [v4 decodeDoubleForKey:@"Distance"];
    v10->_distance = v24;
    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LastUsed"];
    lastUsed = v10->_lastUsed;
    v10->_lastUsed = (NSDate *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SavedEndpoint"];
    savedEndpoint = v10->_savedEndpoint;
    v10->_savedEndpoint = (NWEndpoint *)v27;
  }
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(NPTuscanyEdge *)self label];
  [v4 encodeObject:v5 forKey:@"Name"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[NPTuscanyEdge index](self, "index"), @"EdgeIndex");
  uint64_t v6 = [(NPTuscanyEdge *)self onRampLists];
  [v4 encodeObject:v6 forKey:@"OnRampList"];

  v7 = [(NPTuscanyEdge *)self currentOnRampIndexList];
  [v4 encodeObject:v7 forKey:@"CurrentOnRampIndexList"];

  v8 = [(NPTuscanyEdge *)self probeEndpoint];
  [v4 encodeObject:v8 forKey:@"ProbeEndpoint"];

  v9 = [(NPTuscanyEdge *)self onRampEndpoint];
  [v4 encodeObject:v9 forKey:@"OnRampEndpoint"];

  v10 = [(NPTuscanyEdge *)self location];
  [v4 encodeObject:v10 forKey:@"Location"];

  [(NPTuscanyEdge *)self distance];
  objc_msgSend(v4, "encodeDouble:forKey:", @"Distance");
  v11 = [(NPTuscanyEdge *)self lastUsed];
  [v4 encodeObject:v11 forKey:@"LastUsed"];

  id v12 = [(NPTuscanyEdge *)self savedEndpoint];
  [v4 encodeObject:v12 forKey:@"SavedEndpoint"];
}

- (id)description
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v18 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v3 = [(NPTuscanyEdge *)self label];
  id v4 = [(NPTuscanyEdge *)self probeEndpoint];
  if (v4)
  {
    v5 = [(NPTuscanyEdge *)self probeEndpoint];
    [v18 appendFormat:@"%@ probe: %@", v3, v5];
  }
  else
  {
    [v18 appendFormat:@"%@ probe: %@", v3, &stru_1EF4275C8];
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v6 = [(NPTuscanyEdge *)self onRampLists];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        v22[0] = 0;
        v22[1] = v22;
        v22[2] = 0x2020000000;
        char v23 = 1;
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __28__NPTuscanyEdge_description__block_invoke;
        v19[3] = &unk_1E5A3C098;
        v21 = v22;
        id v20 = v18;
        [(NPTuscanyEdge *)self iterateOnRampsForAddressFamily:v10 withBlock:v19];

        _Block_object_dispose(v22, 8);
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v7);
  }

  v11 = [(NPTuscanyEdge *)self location];

  if (v11)
  {
    [(NPTuscanyEdge *)self distance];
    uint64_t v13 = v12;
    uint64_t v14 = [(NPTuscanyEdge *)self location];
    [v18 appendFormat:@" distance: %f, location: %@", v13, v14];
  }
  id v15 = [(NPTuscanyEdge *)self lastUsed];

  if (v15)
  {
    uint64_t v16 = [(NPTuscanyEdge *)self lastUsed];
    [v18 appendFormat:@" lastUsed: %@", v16];
  }
  return v18;
}

uint64_t __28__NPTuscanyEdge_description__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a4;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    uint64_t v8 = *(void **)(a1 + 32);
    uint64_t v9 = [a3 integerValue];
    uint64_t v10 = @"IPv6";
    if (v9 == 2) {
      uint64_t v10 = @"IPv4";
    }
    [v8 appendFormat:@" onRamps: %@ currOnRamp: %ld ", v10, a2];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  [*(id *)(a1 + 32) appendFormat:@"%@,", v7];

  return 1;
}

- (id)getCurrentOnRamp:(id)a3
{
  id v4 = a3;
  v5 = [(NPTuscanyEdge *)self currentOnRampIndexList];
  uint64_t v6 = [v4 addressFamily];
  id v7 = [v5 objectForKeyedSubscript:v6];

  if (v7)
  {
    uint64_t v8 = [v7 integerValue];
    uint64_t v9 = [v4 addressFamily];
    uint64_t v10 = [(NPTuscanyEdge *)self getOnRamp:v8 addressFamily:v9];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)getOnRamp:(int64_t)a3 addressFamily:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(NPTuscanyEdge *)self onRampLists];
  if (!v7) {
    goto LABEL_6;
  }
  uint64_t v8 = (void *)v7;
  uint64_t v9 = [(NPTuscanyEdge *)self onRampLists];
  uint64_t v10 = [v9 objectForKeyedSubscript:v6];

  if (v10)
  {
    v11 = [(NPTuscanyEdge *)self onRampLists];
    uint64_t v12 = [v11 objectForKeyedSubscript:v6];

    if (a3 < 0 || [v12 count] <= (unint64_t)a3)
    {
      id v15 = 0;
    }
    else
    {
      uint64_t v13 = [v12 objectAtIndexedSubscript:a3];
      uint64_t v14 = [(NPTuscanyEdge *)self parentWaldo];
      id v15 = [v14 onRampForIndex:v13];
    }
  }
  else
  {
LABEL_6:
    id v15 = 0;
  }

  return v15;
}

- (id)nextOnRampForLatency:(id)a3 outIndex:(int64_t *)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v44 = [v6 probeEndpoint];
  *a4 = -1;
  uint64_t v7 = [(NPTuscanyEdge *)self onRampLists];

  if (!v7)
  {
    id v37 = 0;
    goto LABEL_26;
  }
  uint64_t v8 = [(NPTuscanyEdge *)self onRampLists];
  uint64_t v9 = [v6 addressFamily];
  uint64_t v10 = [v8 objectForKeyedSubscript:v9];

  if (![v10 count])
  {
    id v37 = 0;
    goto LABEL_25;
  }
  v40 = a4;
  v11 = [(NPTuscanyEdge *)self currentOnRampIndexList];
  id v41 = v6;
  uint64_t v12 = [v6 addressFamily];
  uint64_t v13 = [v11 objectForKeyedSubscript:v12];

  v39 = v13;
  unint64_t v14 = [v13 unsignedIntegerValue];
  unint64_t v15 = 0;
  uint64_t v16 = 0;
  v42 = v10;
  uint64_t v43 = -1;
  while (1)
  {
    if (v14 >= [v10 count] - 1)
    {
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v17 = v10;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v45 objects:v49 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v46;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v46 != v20) {
              objc_enumerationMutation(v17);
            }
            uint64_t v22 = *(void *)(*((void *)&v45 + 1) + 8 * i);
            char v23 = [(NPTuscanyEdge *)self parentWaldo];
            long long v24 = [v23 onRampForIndex:v22];

            [v24 setDayPassFailed:0];
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v45 objects:v49 count:16];
        }
        while (v19);
      }

      unint64_t v14 = 0;
    }
    else
    {
      ++v14;
    }
    long long v25 = [(NPTuscanyEdge *)self parentWaldo];
    long long v26 = [v10 objectAtIndexedSubscript:v14];
    long long v27 = [v25 onRampForIndex:v26];

    char v28 = [v27 dayPassFailed];
    if (v28) {
      goto LABEL_19;
    }
    char v29 = v28;
    v30 = [(NPTuscanyEdge *)self savedEndpoint];

    if (v30)
    {
      char v31 = v29 ^ 1;
      v32 = [v27 daypassEndpoint];
      v33 = [v44 hostname];
      v34 = [v32 hostname];
      char v35 = [v33 isEqualToString:v34];

      char v36 = v35 & v31;
      uint64_t v10 = v42;

      if ((v36 & 1) == 0)
      {
LABEL_19:

        long long v27 = v16;
        goto LABEL_20;
      }
    }

    uint64_t v43 = v14;
    if ((v14 & 0x8000000000000000) == 0) {
      break;
    }
LABEL_20:
    ++v15;
    uint64_t v16 = v27;
    if (v15 >= [v10 count]) {
      goto LABEL_24;
    }
  }
  uint64_t v43 = v14;
LABEL_24:
  int64_t *v40 = v43;
  id v37 = v27;

  id v6 = v41;
LABEL_25:

LABEL_26:
  return v37;
}

- (void)setCurrentIndex:(int64_t)a3 addressFamily:(id)a4
{
  id v14 = a4;
  uint64_t v6 = [(NPTuscanyEdge *)self currentOnRampIndexList];
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    uint64_t v8 = [(NPTuscanyEdge *)self currentOnRampIndexList];
    uint64_t v9 = [v8 objectForKeyedSubscript:v14];

    if (v9)
    {
      uint64_t v10 = [(NPTuscanyEdge *)self currentOnRampIndexList];
      v11 = (void *)[v10 mutableCopy];

      uint64_t v12 = [NSNumber numberWithInteger:a3];
      [v11 setObject:v12 forKeyedSubscript:v14];

      uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v11];
      [(NPTuscanyEdge *)self setCurrentOnRampIndexList:v13];
    }
  }
}

- (int64_t)currentIndex:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NPTuscanyEdge *)self currentOnRampIndexList];
  if (!v5) {
    goto LABEL_4;
  }
  uint64_t v6 = (void *)v5;
  uint64_t v7 = [(NPTuscanyEdge *)self currentOnRampIndexList];
  uint64_t v8 = [v7 objectForKeyedSubscript:v4];

  if (v8)
  {
    uint64_t v9 = [(NPTuscanyEdge *)self currentOnRampIndexList];
    uint64_t v10 = [v9 objectForKeyedSubscript:v4];
    int64_t v11 = [v10 integerValue];
  }
  else
  {
LABEL_4:
    int64_t v11 = -1;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(NPTuscanyEdge *)self label];
    uint64_t v6 = [v4 label];
    char v7 = [v5 isEqualToString:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(NPTuscanyEdge *)self label];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (int64_t)compareByDistance:(id)a3
{
  id v4 = a3;
  [(NPTuscanyEdge *)self distance];
  double v6 = v5;
  [v4 distance];
  if (v6 >= v7)
  {
    [(NPTuscanyEdge *)self distance];
    double v10 = v9;
    [v4 distance];
    int64_t v8 = v10 != v11;
  }
  else
  {
    int64_t v8 = -1;
  }

  return v8;
}

- (void)iterateOnRampsForAddressFamily:(id)a3 withBlock:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = (uint64_t (**)(id, void, id, void *))a4;
  if (v6)
  {
    int64_t v8 = [(NPTuscanyEdge *)self parentWaldo];
    uint64_t v9 = [(NPTuscanyEdge *)self currentIndex:v6];
    unint64_t v10 = v9 & ~(v9 >> 63);
    double v11 = [(NPTuscanyEdge *)self onRampLists];
    uint64_t v12 = [v11 objectForKeyedSubscript:v6];

    if (v10 < [v12 count])
    {
      unint64_t v13 = v10;
      while (1)
      {
        id v14 = [v12 objectAtIndexedSubscript:v13];
        unint64_t v15 = [v8 onRampForIndex:v14];
        if ((v7[2](v7, v13, v6, v15) & 1) == 0) {
          break;
        }
        if (v13 + 1 == [v12 count]) {
          unint64_t v13 = 0;
        }
        else {
          ++v13;
        }

        if (v13 == v10) {
          goto LABEL_19;
        }
      }
    }
LABEL_19:
  }
  else
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    int64_t v8 = [(NPTuscanyEdge *)self onRampLists];
    uint64_t v16 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v21 != v18) {
            objc_enumerationMutation(v8);
          }
          [(NPTuscanyEdge *)self iterateOnRampsForAddressFamily:*(void *)(*((void *)&v20 + 1) + 8 * i) withBlock:v7];
        }
        uint64_t v17 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v17);
    }
  }
}

- (id)unsynthesizeAddresses:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_12];
  id v6 = [v4 filteredArrayUsingPredicate:v5];
  if ([v6 count])
  {
    double v7 = [MEMORY[0x1E4F38C20] sharedDefaultEvaluator];
    int64_t v8 = [v7 path];

    if (!v8) {
      goto LABEL_33;
    }
    uint64_t v9 = [v8 interface];
    if (!v9) {
      goto LABEL_33;
    }
    unint64_t v10 = (void *)v9;
    double v11 = [v8 interface];
    uint64_t v12 = [v11 interfaceIndex];

    if (v12)
    {
      unint64_t v13 = [v8 interface];
      int v14 = [v13 interfaceIndex];

      int v52 = v14;
      v51 = 0;
      int v46 = nw_nat64_copy_prefixes();
      if (v46)
      {
        uint64_t v43 = self;
        v40 = v8;
        id v41 = v6;
        v42 = v5;
        id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        id v16 = v4;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v47 objects:v60 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v48;
          do
          {
            uint64_t v20 = 0;
            do
            {
              if (*(void *)v48 != v19) {
                objc_enumerationMutation(v16);
              }
              long long v21 = *(void **)(*((void *)&v47 + 1) + 8 * v20);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v22 = v21;
                if ([v22 addressFamily] == 30 && v46 >= 1)
                {
                  uint64_t v23 = 0;
                  while (1)
                  {
                    objc_msgSend(v22, "address", v40);
                    if (nw_nat64_extract_v4()) {
                      break;
                    }
                    v23 += 16;
                    if (16 * v46 == v23) {
                      goto LABEL_17;
                    }
                  }
                  memset(v59, 0, sizeof(v59));
                  LOWORD(v59[0]) = 528;
                  DWORD1(v59[0]) = 0;
                  WORD1(v59[0]) = *(_WORD *)([v22 address] + 2);
                  long long v24 = [MEMORY[0x1E4F38BC8] endpointWithAddress:v59];
                  uint64_t v25 = nplog_obj();
                  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
                  {
                    long long v45 = [(NPTuscanyEdge *)v43 parentWaldo];
                    v44 = [v45 identifier];
                    *(_DWORD *)buf = 138412802;
                    v54 = v44;
                    __int16 v55 = 2112;
                    id v56 = v22;
                    __int16 v57 = 2112;
                    v58 = v24;
                    _os_log_debug_impl(&dword_1A0FEE000, v25, OS_LOG_TYPE_DEBUG, "%@: Unsynthesized %@ to %@", buf, 0x20u);
                  }
                  [v15 addObject:v24];
                }
                else
                {
LABEL_17:
                  objc_msgSend(v15, "addObject:", v22, v40);
                }
              }
              ++v20;
            }
            while (v20 != v18);
            uint64_t v26 = [v16 countByEnumeratingWithState:&v47 objects:v60 count:16];
            uint64_t v18 = v26;
          }
          while (v26);
        }

        if (v51) {
          free(v51);
        }
        long long v27 = nplog_obj();
        id v6 = v41;
        double v5 = v42;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          v38 = [(NPTuscanyEdge *)v43 parentWaldo];
          v39 = [v38 identifier];
          LODWORD(v59[0]) = 138412546;
          *(void *)((char *)v59 + 4) = v39;
          WORD6(v59[0]) = 2112;
          *(void *)((char *)v59 + 14) = v15;
          _os_log_debug_impl(&dword_1A0FEE000, v27, OS_LOG_TYPE_DEBUG, "%@: Unsynthesized result %@", (uint8_t *)v59, 0x16u);
        }
        if ([v15 count]) {
          char v28 = v15;
        }
        else {
          char v28 = 0;
        }
        id v29 = v28;

        int64_t v8 = v40;
        goto LABEL_37;
      }
      v30 = nplog_obj();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        char v31 = [(NPTuscanyEdge *)self parentWaldo];
        v32 = [v31 identifier];
        LODWORD(v59[0]) = 138412290;
        *(void *)((char *)v59 + 4) = v32;
        v33 = "%@: No need to unsynthesize addresses, no prefixes";
        goto LABEL_35;
      }
    }
    else
    {
LABEL_33:
      v30 = nplog_obj();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        char v31 = [(NPTuscanyEdge *)self parentWaldo];
        v32 = [v31 identifier];
        LODWORD(v59[0]) = 138412290;
        *(void *)((char *)v59 + 4) = v32;
        v33 = "%@: Cannot unsynthesize addresses, no path";
LABEL_35:
        _os_log_impl(&dword_1A0FEE000, v30, OS_LOG_TYPE_DEFAULT, v33, (uint8_t *)v59, 0xCu);
      }
    }

    id v29 = v4;
LABEL_37:

    goto LABEL_41;
  }
  v34 = nplog_obj();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    char v35 = [(NPTuscanyEdge *)self parentWaldo];
    char v36 = [v35 identifier];
    LODWORD(v59[0]) = 138412290;
    *(void *)((char *)v59 + 4) = v36;
    _os_log_impl(&dword_1A0FEE000, v34, OS_LOG_TYPE_DEFAULT, "%@: No need to unsynthesize addresses, no IPv6 address", (uint8_t *)v59, 0xCu);
  }
  id v29 = v4;
LABEL_41:

  return v29;
}

BOOL __39__NPTuscanyEdge_unsynthesizeAddresses___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  BOOL v3 = (objc_opt_isKindOfClass() & 1) != 0 && [v2 addressFamily] == 30;

  return v3;
}

- (void)resolveWithCompletionHandler:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t, void))a3;
  if ([(NPTuscanyEdge *)self reResolve]
    && ([(NPTuscanyEdge *)self savedEndpoint],
        double v5 = objc_claimAutoreleasedReturnValue(),
        [(NPTuscanyEdge *)self setReResolve:0],
        v5)
    || ([(NPTuscanyEdge *)self probeEndpoint], (double v5 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([(NPTuscanyEdge *)self onRampEndpoint],
        (double v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      v4[2](v4, 1, 0);
    }
    else
    {
      id v6 = nplog_obj();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        double v7 = [(NPTuscanyEdge *)self parentWaldo];
        int64_t v8 = [v7 identifier];
        *(_DWORD *)buf = 138412546;
        uint64_t v18 = v8;
        __int16 v19 = 2112;
        uint64_t v20 = v5;
        _os_log_impl(&dword_1A0FEE000, v6, OS_LOG_TYPE_DEFAULT, "%@: resolving %@", buf, 0x16u);
      }
      uint64_t v9 = [(NPTuscanyEdge *)self parentWaldo];
      char v10 = [v9 isIPv6Enabled];

      if (v10)
      {
        id v11 = 0;
      }
      else
      {
        id v11 = objc_alloc_init(MEMORY[0x1E4F38C10]);
        [v11 setAllowUnusableAddresses:1];
        [v11 setRequiredAddressFamily:2];
      }
      uint64_t v12 = [(NWResolver *)[NPResolver alloc] initWithEndpoint:v5 parameters:v11];
      [(NPTuscanyEdge *)self setSavedEndpoint:v5];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __46__NPTuscanyEdge_resolveWithCompletionHandler___block_invoke;
      v14[3] = &unk_1E5A3C0C0;
      v14[4] = self;
      id v15 = v12;
      id v16 = v4;
      unint64_t v13 = v12;
      [(NPResolver *)v13 resolveWithCompletionHandler:v14];
    }
  }
  else
  {
    v4[2](v4, 0, 0);
  }
}

void __46__NPTuscanyEdge_resolveWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v2 = nplog_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v3 = [*(id *)(a1 + 32) probeEndpoint];
    id v4 = [*(id *)(a1 + 40) resolvedEndpointArray];
    int v28 = 138412546;
    id v29 = v3;
    __int16 v30 = 2112;
    char v31 = v4;
    _os_log_impl(&dword_1A0FEE000, v2, OS_LOG_TYPE_DEFAULT, "Resolved %@ to %@", (uint8_t *)&v28, 0x16u);
  }
  double v5 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) resolvedEndpointArray];
  double v7 = [v5 unsynthesizeAddresses:v6];

  int64_t v8 = [*(id *)(a1 + 32) parentWaldo];
  char v9 = [v8 isIPv6Enabled];

  if ((v9 & 1) == 0)
  {
    char v10 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_504];
    uint64_t v11 = [v7 filteredArrayUsingPredicate:v10];

    double v7 = (void *)v11;
  }
  uint64_t v12 = [[NPTunnelTuscanyEndpoint alloc] initWithHosts:v7];
  if (v12)
  {
    unint64_t v13 = [*(id *)(a1 + 32) probeEndpoint];

    if (v13)
    {
      int v14 = *(void **)(a1 + 32);
      id v15 = [v14 probeEndpoint];
      id v16 = [v14 getPortFromEndpoint:v15 defaultPort:@"5223"];

      id v17 = [(NPTunnelTuscanyEndpoint *)v12 copyHostsWithPort:v16];
      if ([v17 count])
      {
        uint64_t v18 = [[NPTunnelTuscanyEndpoint alloc] initWithHosts:v17];
        uint64_t v19 = *(void *)(a1 + 32);
        uint64_t v20 = *(void **)(v19 + 64);
        *(void *)(v19 + 64) = v18;
      }
    }
    uint64_t v21 = *(void **)(a1 + 32);
    id v22 = [v21 onRampEndpoint];
    uint64_t v23 = [v21 getPortFromEndpoint:v22 defaultPort:@"443"];

    id v24 = [(NPTunnelTuscanyEndpoint *)v12 copyHostsWithPort:v23];
    if ([v24 count])
    {
      uint64_t v25 = [[NPTunnelTuscanyEndpoint alloc] initWithHosts:v24];
      uint64_t v26 = *(void *)(a1 + 32);
      long long v27 = *(void **)(v26 + 72);
      *(void *)(v26 + 72) = v25;
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

BOOL __46__NPTuscanyEdge_resolveWithCompletionHandler___block_invoke_502(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  BOOL v3 = (objc_opt_isKindOfClass() & 1) != 0 && [v2 addressFamily] != 30;

  return v3;
}

- (id)getPortFromEndpoint:(id)a3 defaultPort:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v5;
    int64_t v8 = [v7 hosts];
    uint64_t v9 = [v8 count];

    if (v9)
    {
      char v10 = [v7 hosts];
      uint64_t v11 = [v10 objectAtIndexedSubscript:0];

      uint64_t v12 = [v11 port];
    }
    else
    {
      uint64_t v12 = v6;
    }
  }
  else
  {
    objc_opt_class();
    uint64_t v12 = v6;
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_8;
    }
    uint64_t v12 = [v5 port];
    id v7 = v6;
  }

LABEL_8:
  return v12;
}

- (void)linkWithOnRampsRetainMissingAddressFamilies:(BOOL)a3
{
  BOOL v45 = a3;
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  long long v47 = [(NPTuscanyEdge *)self parentWaldo];
  int v46 = [(NPTuscanyEdge *)self onRampLists];
  if (!v47) {
    __assert_rtn("-[NPTuscanyEdge linkWithOnRampsRetainMissingAddressFamilies:]", "NPWaldo.m", 1452, "parentWaldo != nil");
  }
  [(NPTuscanyEdge *)self setOnRampLists:0];
  [(NPTuscanyEdge *)self setCurrentOnRampIndexList:0];
  BOOL v3 = [(NPTuscanyEdge *)self onRampEndpoint];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [v47 allOnRamps];
    id v6 = [v5 mutableCopy];

    v44 = [(NPTuscanyEdge *)self onRampEndpoint];
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    obuint64_t j = [v44 hosts];
    id v7 = 0;
    uint64_t v8 = [obj countByEnumeratingWithState:&v66 objects:v72 count:16];
    if (v8)
    {
      uint64_t v51 = *(void *)v67;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v67 != v51) {
            objc_enumerationMutation(obj);
          }
          char v10 = *(void **)(*((void *)&v66 + 1) + 8 * i);
          uint64_t v11 = [v6 count];
          if ([v6 count])
          {
            uint64_t v12 = 0;
            while (1)
            {
              unint64_t v13 = [v6 objectAtIndexedSubscript:v12];
              int v14 = [v13 daypassEndpoint];
              char v15 = [v14 isEqual:v10];

              if (v15) {
                break;
              }
              if (++v12 >= (unint64_t)[v6 count]) {
                goto LABEL_14;
              }
            }
            uint64_t v11 = v12;
          }
LABEL_14:
          if (v11 == [v6 count])
          {
            id v16 = [[NPTuscanyOnRamp alloc] initWithEndpoint:v10];
            if (!v6) {
              id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            }
            [v6 addObject:v16];
          }
          id v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "addressFamily"));
          if (!v7) {
            id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          }
          uint64_t v18 = [v7 objectForKeyedSubscript:v17];
          BOOL v19 = v18 == 0;

          if (v19)
          {
            id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          }
          else
          {
            id v20 = [v7 objectForKeyedSubscript:v17];
          }
          uint64_t v21 = v20;
          id v22 = [NSNumber numberWithUnsignedInteger:v11];
          [v21 addObject:v22];

          [v7 setObject:v21 forKeyedSubscript:v17];
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v66 objects:v72 count:16];
      }
      while (v8);
    }

    if (v45)
    {
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      id v23 = v46;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v62 objects:v71 count:16];
      if (v24)
      {
        uint64_t v25 = *(void *)v63;
        do
        {
          for (uint64_t j = 0; j != v24; ++j)
          {
            if (*(void *)v63 != v25) {
              objc_enumerationMutation(v23);
            }
            uint64_t v27 = *(void *)(*((void *)&v62 + 1) + 8 * j);
            int v28 = [v7 objectForKeyedSubscript:v27];
            if (!v28)
            {
              id v29 = [v23 objectForKeyedSubscript:v27];
              int v28 = (void *)[v29 mutableCopy];

              [v7 setObject:v28 forKeyedSubscript:v27];
            }
          }
          uint64_t v24 = [v23 countByEnumeratingWithState:&v62 objects:v71 count:16];
        }
        while (v24);
      }
    }
    if (v6)
    {
      __int16 v30 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v6];
      [v47 setAllOnRamps:v30];
    }
    char v31 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v7];
    [(NPTuscanyEdge *)self setOnRampLists:v31];

    uint64_t v32 = [(NPTuscanyEdge *)self onRampLists];
    BOOL v33 = [v32 count] == 0;

    if (!v33)
    {
      id v52 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      id obja = [(NPTuscanyEdge *)self onRampLists];
      uint64_t v34 = [obja countByEnumeratingWithState:&v58 objects:v70 count:16];
      if (v34)
      {
        uint64_t v35 = *(void *)v59;
        do
        {
          for (uint64_t k = 0; k != v34; ++k)
          {
            if (*(void *)v59 != v35) {
              objc_enumerationMutation(obja);
            }
            uint64_t v37 = *(void *)(*((void *)&v58 + 1) + 8 * k);
            *(void *)buf = 0;
            __int16 v55 = buf;
            uint64_t v56 = 0x2020000000;
            uint64_t v57 = -1;
            v53[0] = MEMORY[0x1E4F143A8];
            v53[1] = 3221225472;
            v53[2] = __61__NPTuscanyEdge_linkWithOnRampsRetainMissingAddressFamilies___block_invoke;
            v53[3] = &unk_1E5A3C0E8;
            v53[4] = buf;
            [(NPTuscanyEdge *)self iterateOnRampsForAddressFamily:v37 withBlock:v53];
            uint64_t v38 = *((void *)v55 + 3);
            if (v38 < 0)
            {
              v39 = [(NPTuscanyEdge *)self onRampLists];
              v40 = [v39 objectForKeyedSubscript:v37];

              uint32_t v41 = arc4random_uniform([v40 count]);
              *((void *)v55 + 3) = v41;

              uint64_t v38 = *((void *)v55 + 3);
            }
            v42 = [NSNumber numberWithInteger:v38];
            [v52 setObject:v42 forKeyedSubscript:v37];

            _Block_object_dispose(buf, 8);
          }
          uint64_t v34 = [obja countByEnumeratingWithState:&v58 objects:v70 count:16];
        }
        while (v34);
      }

      uint64_t v43 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v52];
      [(NPTuscanyEdge *)self setCurrentOnRampIndexList:v43];
    }
  }
  else
  {
    id v6 = nplog_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A0FEE000, v6, OS_LOG_TYPE_DEFAULT, "Cannot link with onramps because the onramp endpoint is not a list of addresses", buf, 2u);
    }
  }
}

uint64_t __61__NPTuscanyEdge_linkWithOnRampsRetainMissingAddressFamilies___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t result = [a4 isDayPassExpired];
  if ((result & 1) == 0) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  }
  return result;
}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

- (NPLocation)location
{
  return (NPLocation *)objc_getProperty(self, a2, 32, 1);
}

- (double)distance
{
  return self->_distance;
}

- (void)setDistance:(double)a3
{
  self->_distance = a3;
}

- (BOOL)probePending
{
  return self->_probePending;
}

- (void)setProbePending:(BOOL)a3
{
  self->_probePending = a3;
}

- (NSDictionary)onRampLists
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setOnRampLists:(id)a3
{
}

- (NSDictionary)currentOnRampIndexList
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCurrentOnRampIndexList:(id)a3
{
}

- (NWEndpoint)probeEndpoint
{
  return (NWEndpoint *)objc_getProperty(self, a2, 64, 1);
}

- (NWEndpoint)onRampEndpoint
{
  return (NWEndpoint *)objc_getProperty(self, a2, 72, 1);
}

- (NSDate)lastUsed
{
  return (NSDate *)objc_getProperty(self, a2, 80, 1);
}

- (void)setLastUsed:(id)a3
{
}

- (NPWaldo)parentWaldo
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentWaldo);
  return (NPWaldo *)WeakRetained;
}

- (void)setParentWaldo:(id)a3
{
}

- (NWEndpoint)savedEndpoint
{
  return (NWEndpoint *)objc_getProperty(self, a2, 96, 1);
}

- (void)setSavedEndpoint:(id)a3
{
}

- (BOOL)reResolve
{
  return self->_reResolve;
}

- (void)setReResolve:(BOOL)a3
{
  self->_reResolve = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savedEndpoint, 0);
  objc_destroyWeak((id *)&self->_parentWaldo);
  objc_storeStrong((id *)&self->_lastUsed, 0);
  objc_storeStrong((id *)&self->_onRampEndpoint, 0);
  objc_storeStrong((id *)&self->_probeEndpoint, 0);
  objc_storeStrong((id *)&self->_currentOnRampIndexList, 0);
  objc_storeStrong((id *)&self->_onRampLists, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end