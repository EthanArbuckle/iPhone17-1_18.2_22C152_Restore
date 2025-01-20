@interface PPSpotlightScoringFeatureVector
+ (id)decodeFeatureVectorFromData:(id)a3 version:(id)a4;
+ (id)featureVectorVersion;
- (BOOL)containsQidString:(id)a3;
- (PPSpotlightScoringFeatureVector)init;
- (id)encodeAsData;
- (id)qidStrings;
- (void)addQidString:(id)a3;
@end

@implementation PPSpotlightScoringFeatureVector

- (void).cxx_destruct
{
}

- (id)qidStrings
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v4 = [(NSMutableSet *)self->_features allObjects];
  v5 = objc_msgSend(v4, "_pas_mappedArrayWithTransform:", &__block_literal_global_4642);
  v6 = (void *)[v3 initWithArray:v5];

  return v6;
}

id __45__PPSpotlightScoringFeatureVector_qidStrings__block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)NSString;
  id v3 = a2;
  id v4 = [v2 alloc];
  uint64_t v5 = [v3 unsignedIntValue];

  v6 = objc_msgSend(v4, "initWithFormat:", @"Q%u", v5);
  return v6;
}

- (BOOL)containsQidString:(id)a3
{
  uint64_t v4 = qidStringToNumeric(a3);
  features = self->_features;
  v6 = [NSNumber numberWithUnsignedInt:v4];
  LOBYTE(features) = [(NSMutableSet *)features containsObject:v6];

  return (char)features;
}

- (void)addQidString:(id)a3
{
  uint64_t v4 = qidStringToNumeric(a3);
  features = self->_features;
  id v6 = [NSNumber numberWithUnsignedInt:v4];
  [(NSMutableSet *)features addObject:v6];
}

- (id)encodeAsData
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = [(NSMutableSet *)self->_features count];
  if (v4 >= 0xC8) {
    uint64_t v5 = 200;
  }
  else {
    uint64_t v5 = v4;
  }
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:4 * v5];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v7 = self->_features;
  uint64_t v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        int v17 = 0;
        int v17 = [v12 unsignedIntValue];
        [v6 appendBytes:&v17 length:4];
      }
      uint64_t v9 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  if (([v6 length] & 3) != 0)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v15 = [v6 length];
    v16 = NSStringFromSelector(a2);
    [v14 handleFailureInMethod:a2, self, @"PPSpotlightScoringFeatureVector.m", 38, @"Invalid NSData size of %tu in %@", v15, v16 object file lineNumber description];
  }
  return v6;
}

- (PPSpotlightScoringFeatureVector)init
{
  v6.receiver = self;
  v6.super_class = (Class)PPSpotlightScoringFeatureVector;
  v2 = [(PPSpotlightScoringFeatureVector *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    features = v2->_features;
    v2->_features = (NSMutableSet *)v3;
  }
  return v2;
}

+ (id)featureVectorVersion
{
  return &unk_1EDA6ACD0;
}

+ (id)decodeFeatureVectorFromData:(id)a3 version:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (![v7 length])
  {
    v12 = pp_universal_search_log_handle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v13 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      v37 = v13;
      _os_log_debug_impl(&dword_18CAA6000, v12, OS_LOG_TYPE_DEBUG, "%@: attempt to decode empty feature vector", buf, 0xCu);
      goto LABEL_13;
    }
LABEL_14:

    long long v21 = 0;
    goto LABEL_15;
  }
  [v8 doubleValue];
  if (v9 == 1.0)
  {
    uint64_t v10 = pp_universal_search_log_handle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v32 = NSStringFromSelector(a2);
      [v8 doubleValue];
      *(_DWORD *)buf = 138412546;
      v37 = v32;
      __int16 v38 = 2048;
      uint64_t v39 = v33;
      _os_log_debug_impl(&dword_18CAA6000, v10, OS_LOG_TYPE_DEBUG, "%@: decoding feature vector of deprecated version: %f", buf, 0x16u);
    }
    unsigned int v11 = [v7 length];
    if (__ROR8__(0xAAAAAAAAAAAAAAABLL * [v7 length], 1) >= 0x2AAAAAAAAAAAAAABuLL)
    {
      v12 = pp_default_log_handle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        v13 = NSStringFromSelector(a2);
        uint64_t v14 = [v7 length];
        *(_DWORD *)buf = 138412546;
        v37 = v13;
        __int16 v38 = 2048;
        uint64_t v39 = v14;
        _os_log_fault_impl(&dword_18CAA6000, v12, OS_LOG_TYPE_FAULT, "%@: Invalid V1 NSData size of %tu", buf, 0x16u);
LABEL_13:

        goto LABEL_14;
      }
      goto LABEL_14;
    }
    long long v21 = objc_opt_new();
    if (v11 >= 6)
    {
      uint64_t v23 = 0;
      unint64_t v24 = 6 * (v11 / 6uLL);
      do
      {
        *(_DWORD *)buf = 0;
        objc_msgSend(v7, "getBytes:range:", buf, v23, 4);
        v25 = (void *)v21[1];
        v26 = [NSNumber numberWithUnsignedInt:*(unsigned int *)buf];
        [v25 addObject:v26];

        v23 += 6;
      }
      while (v24 != v23);
    }
  }
  else
  {
    [v8 doubleValue];
    double v16 = v15;
    int v17 = +[PPSpotlightScoringFeatureVector featureVectorVersion];
    [v17 doubleValue];
    double v19 = v18;

    if (v16 != v19)
    {
      v12 = pp_universal_search_log_handle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = NSStringFromSelector(a2);
        [v8 doubleValue];
        *(_DWORD *)buf = 138412546;
        v37 = v13;
        __int16 v38 = 2048;
        uint64_t v39 = v20;
        _os_log_error_impl(&dword_18CAA6000, v12, OS_LOG_TYPE_ERROR, "%@: attempt to decode feature vector of unsupported version: %f", buf, 0x16u);
        goto LABEL_13;
      }
      goto LABEL_14;
    }
    unsigned int v27 = [v7 length];
    if (([v7 length] & 3) != 0)
    {
      v34 = [MEMORY[0x1E4F28B00] currentHandler];
      v35 = NSStringFromSelector(a2);
      [v34 handleFailureInMethod:a2, a1, @"PPSpotlightScoringFeatureVector.m", 81, @"%@: Invalid NSData size of %tu", v35, objc_msgSend(v7, "length") object file lineNumber description];
    }
    long long v21 = objc_opt_new();
    if (v27 >> 2)
    {
      uint64_t v28 = 0;
      uint64_t v29 = 4 * (v27 >> 2);
      do
      {
        *(_DWORD *)buf = 0;
        objc_msgSend(v7, "getBytes:range:", buf, v28, 4);
        v30 = (void *)v21[1];
        v31 = [NSNumber numberWithUnsignedInt:*(unsigned int *)buf];
        [v30 addObject:v31];

        v28 += 4;
      }
      while (v29 != v28);
    }
  }
LABEL_15:

  return v21;
}

@end