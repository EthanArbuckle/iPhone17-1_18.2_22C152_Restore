@interface ICNetworkConstraints
+ (id)constraintsForSystemApplicationType:(int64_t)a3;
+ (id)mediaTypeNetworkConstraintsFromURLBag:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldAllowDataForCellularNetworkTypes;
- (BOOL)shouldAllowDataForNetworkType:(int64_t)a3;
- (BOOL)shouldAllowDataForWiFiNetworkTypes;
- (ICNetworkConstraints)init;
- (ICNetworkConstraints)initWithBundleIdentifier:(id)a3;
- (id)_copyWithClass:(Class)a3 zone:(_NSZone *)a4;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)sizeLimitForNetworkType:(int64_t)a3;
- (unint64_t)hash;
@end

@implementation ICNetworkConstraints

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkTypeToSizeLimit, 0);

  objc_storeStrong((id *)&self->_networkTypeToDataAllowed, 0);
}

- (id)_copyWithClass:(Class)a3 zone:(_NSZone *)a4
{
  v6 = [[(objc_class *)a3 allocWithZone:a4] init];
  v7 = v6;
  if (v6)
  {
    *((unsigned char *)v6 + 8) = self->_dataAllowedFallbackValue;
    uint64_t v8 = [(NSMutableDictionary *)self->_networkTypeToDataAllowed copyWithZone:a4];
    v9 = (void *)*((void *)v7 + 2);
    *((void *)v7 + 2) = v8;

    uint64_t v10 = [(NSMutableDictionary *)self->_networkTypeToSizeLimit copyWithZone:a4];
    v11 = (void *)*((void *)v7 + 3);
    *((void *)v7 + 3) = v10;

    *((unsigned char *)v7 + 9) = self->_cellularDataAllowedFallbackValue;
    *((unsigned char *)v7 + 10) = self->_wiFiDataAllowedFallbackValue;
  }
  return v7;
}

- (id)sizeLimitForNetworkType:(int64_t)a3
{
  networkTypeToSizeLimit = self->_networkTypeToSizeLimit;
  v4 = [NSNumber numberWithInteger:a3];
  v5 = [(NSMutableDictionary *)networkTypeToSizeLimit objectForKey:v4];

  return v5;
}

- (BOOL)shouldAllowDataForWiFiNetworkTypes
{
  return self->_wiFiDataAllowedFallbackValue;
}

- (BOOL)shouldAllowDataForCellularNetworkTypes
{
  return self->_cellularDataAllowedFallbackValue;
}

- (BOOL)shouldAllowDataForNetworkType:(int64_t)a3
{
  networkTypeToDataAllowed = self->_networkTypeToDataAllowed;
  v6 = objc_msgSend(NSNumber, "numberWithInteger:");
  v7 = [(NSMutableDictionary *)networkTypeToDataAllowed objectForKey:v6];

  if (v7)
  {
    char v8 = [v7 BOOLValue];
  }
  else if (self->_dataAllowedFallbackValue)
  {
    if ((unint64_t)(a3 - 1) > 0x1F2)
    {
      if ((unint64_t)(a3 - 1000) > 0x3E7)
      {
        char v8 = 1;
        goto LABEL_11;
      }
      BOOL wiFiDataAllowedFallbackValue = self->_wiFiDataAllowedFallbackValue;
    }
    else
    {
      BOOL wiFiDataAllowedFallbackValue = self->_cellularDataAllowedFallbackValue;
    }
    char v8 = wiFiDataAllowedFallbackValue;
  }
  else
  {
    char v8 = 0;
  }
LABEL_11:

  return v8;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();

  return [(ICNetworkConstraints *)self _copyWithClass:v5 zone:a3];
}

+ (id)constraintsForSystemApplicationType:(int64_t)a3
{
  v3 = ICBundleIdentifierForSystemApplicationType(a3);
  v4 = [[ICNetworkConstraints alloc] initWithBundleIdentifier:v3];

  return v4;
}

+ (id)mediaTypeNetworkConstraintsFromURLBag:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  v3 = [a3 arrayForBagKey:@"mobile-network-constraints"];
  if (_NSIsNSArray())
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    v36 = v3;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v52 objects:v58 count:16];
    if (!v6) {
      goto LABEL_60;
    }
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v53;
    uint64_t v40 = *(void *)v53;
    id v37 = v5;
    while (1)
    {
      uint64_t v9 = 0;
      uint64_t v41 = v7;
      do
      {
        if (*(void *)v53 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v52 + 1) + 8 * v9);
        if (!_NSIsNSDictionary()) {
          goto LABEL_58;
        }
        v11 = [v10 objectForKey:@"kinds"];
        if (!_NSIsNSArray() || ![v11 count]) {
          goto LABEL_57;
        }
        uint64_t v12 = [v10 objectForKey:@"enabled"];
        v42 = (void *)v12;
        uint64_t v43 = v9;
        if (v12)
        {
          v13 = (void *)v12;
          if ((objc_opt_respondsToSelector() & 1) == 0 || ([v13 BOOLValue] & 1) == 0)
          {
            v16 = objc_alloc_init(ICMutableNetworkConstraints);
            [(ICMutableNetworkConstraints *)v16 setShouldAllowDataForAllNetworkTypes:0];
            goto LABEL_47;
          }
        }
        v14 = objc_msgSend(v10, "objectForKey:", @"size-limits", v36);
        int v15 = _NSIsNSDictionary();
        v16 = objc_alloc_init(ICMutableNetworkConstraints);
        if (!v15) {
          goto LABEL_45;
        }
        v38 = v14;
        v39 = v11;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        id v17 = v14;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v48 objects:v57 count:16];
        if (!v18) {
          goto LABEL_44;
        }
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v49;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v49 != v20) {
              objc_enumerationMutation(v17);
            }
            v22 = *(void **)(*((void *)&v48 + 1) + 8 * i);
            v23 = [v17 objectForKey:v22];
            if (_NSIsNSString())
            {
              if (objc_opt_respondsToSelector())
              {
                uint64_t v24 = [v23 longLongValue];
                if (v24)
                {
                  uint64_t v25 = v24;
                  id v26 = v22;
                  if ([v26 isEqualToString:@"2G"])
                  {
                    uint64_t v27 = 1;
                    goto LABEL_40;
                  }
                  if ([v26 isEqualToString:@"3G"])
                  {
                    uint64_t v27 = 2;
                    goto LABEL_40;
                  }
                  if ([v26 isEqualToString:@"4G"])
                  {
                    uint64_t v27 = 3;
                    goto LABEL_40;
                  }
                  if ([v26 isEqualToString:@"5G"])
                  {
                    uint64_t v27 = 4;
                    goto LABEL_40;
                  }
                  if ([v26 isEqualToString:@"6G"])
                  {
                    uint64_t v27 = 5;
                    goto LABEL_40;
                  }
                  if ([v26 isEqualToString:@"7G"])
                  {
                    uint64_t v27 = 6;
                    goto LABEL_40;
                  }
                  if ([v26 isEqualToString:@"8G"])
                  {
                    uint64_t v27 = 7;
                    goto LABEL_40;
                  }
                  if ([v26 isEqualToString:@"9G"])
                  {
                    uint64_t v27 = 8;
                    goto LABEL_40;
                  }
                  if ([v26 isEqualToString:@"WiFi"])
                  {
                    uint64_t v27 = 1000;
LABEL_40:

                    id v26 = [NSNumber numberWithLongLong:v25];
                    [(ICMutableNetworkConstraints *)v16 setSizeLimit:v26 forNetworkType:v27];
                  }
                }
              }
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v48 objects:v57 count:16];
        }
        while (v19);
LABEL_44:

        id v5 = v37;
        v14 = v38;
        v11 = v39;
LABEL_45:

LABEL_47:
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        v28 = v11;
        id v29 = v11;
        uint64_t v30 = [v29 countByEnumeratingWithState:&v44 objects:v56 count:16];
        if (v30)
        {
          uint64_t v31 = v30;
          uint64_t v32 = *(void *)v45;
          do
          {
            for (uint64_t j = 0; j != v31; ++j)
            {
              if (*(void *)v45 != v32) {
                objc_enumerationMutation(v29);
              }
              uint64_t v34 = *(void *)(*((void *)&v44 + 1) + 8 * j);
              if (_NSIsNSString()) {
                [v4 setObject:v16 forKey:v34];
              }
            }
            uint64_t v31 = [v29 countByEnumeratingWithState:&v44 objects:v56 count:16];
          }
          while (v31);
        }

        uint64_t v8 = v40;
        uint64_t v7 = v41;
        uint64_t v9 = v43;
        v11 = v28;
LABEL_57:

LABEL_58:
        ++v9;
      }
      while (v9 != v7);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v52 objects:v58 count:16];
      if (!v7)
      {
LABEL_60:

        v3 = v36;
        goto LABEL_62;
      }
    }
  }
  id v4 = 0;
LABEL_62:

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ICNetworkConstraints *)a3;
  if (self == v4)
  {
    char v12 = 1;
    goto LABEL_12;
  }
  if (![(ICNetworkConstraints *)v4 isMemberOfClass:objc_opt_class()])
  {
    char v12 = 0;
    goto LABEL_12;
  }
  id v5 = v4;
  uint64_t v6 = v5;
  if (!self->_dataAllowedFallbackValue == v5->_dataAllowedFallbackValue
    || !self->_cellularDataAllowedFallbackValue == v5->_cellularDataAllowedFallbackValue
    || !self->_wiFiDataAllowedFallbackValue == v5->_wiFiDataAllowedFallbackValue)
  {
    goto LABEL_8;
  }
  networkTypeToDataAllowed = self->_networkTypeToDataAllowed;
  uint64_t v8 = v5->_networkTypeToDataAllowed;
  if (networkTypeToDataAllowed == v8)
  {

    goto LABEL_14;
  }
  uint64_t v9 = v8;
  uint64_t v10 = networkTypeToDataAllowed;
  int v11 = [(NSMutableDictionary *)v10 isEqual:v9];

  if (v11)
  {
LABEL_14:
    networkTypeToSizeLimit = self->_networkTypeToSizeLimit;
    int v15 = v6->_networkTypeToSizeLimit;
    v16 = networkTypeToSizeLimit;
    id v17 = v16;
    if (v16 == v15) {
      char v12 = 1;
    }
    else {
      char v12 = [(NSMutableDictionary *)v16 isEqual:v15];
    }

    goto LABEL_9;
  }
LABEL_8:
  char v12 = 0;
LABEL_9:

LABEL_12:
  return v12;
}

- (unint64_t)hash
{
  uint64_t v3 = MSVHasherSharedSeed();
  uint64_t v5 = v4;
  uint64_t v6 = v3 ^ 0x736F6D6570736575;
  uint64_t v7 = v4 ^ 0x646F72616E646F6DLL;
  uint64_t v8 = v3 ^ 0x6C7967656E657261;
  uint64_t v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v10 hash];
  uint64_t v12 = v5 ^ 0x7465646279746573 ^ v11;
  uint64_t v13 = (v6 + v7) ^ __ROR8__(v7, 51);
  uint64_t v14 = v8 + v12;
  uint64_t v15 = (v8 + v12) ^ __ROR8__(v12, 48);
  uint64_t v16 = v15 + __ROR8__(v6 + v7, 32);
  uint64_t v17 = v14 + v13;
  uint64_t v118 = __ROR8__(v17, 32);
  uint64_t v122 = v16 ^ __ROR8__(v15, 43);
  uint64_t v110 = v16 ^ v11;
  uint64_t v114 = v17 ^ __ROR8__(v13, 47);

  uint64_t v126 = self->_dataAllowedFallbackValue | 0xC00000000000000;
  unint64_t v18 = v126 & 0xFFFFFFFFFFFFFFLL | ((unint64_t)self->_cellularDataAllowedFallbackValue << 32);
  uint64_t v19 = (v110 + v114) ^ __ROR8__(v114, 51);
  uint64_t v20 = v118 + (v18 ^ v122);
  uint64_t v21 = __ROR8__(v18 ^ v122, 48);
  uint64_t v22 = (v20 ^ v21) + __ROR8__(v110 + v114, 32);
  uint64_t v23 = v22 ^ __ROR8__(v20 ^ v21, 43);
  uint64_t v24 = v20 + v19;
  uint64_t v119 = __ROR8__(v24, 32);
  uint64_t v123 = v23;
  unint64_t v111 = v22 ^ v18;
  uint64_t v115 = v24 ^ __ROR8__(v19, 47);
  uint64_t wiFiDataAllowedFallbackValue = self->_wiFiDataAllowedFallbackValue;
  unint64_t v26 = (v126 & 0xFF00000000000000) + 0x400000000000000;
  unint64_t v127 = v26;
  if ((v26 & 0x400000000000000) != 0)
  {
    if ((v26 & 0x300000000000000) != 0)
    {
      v102 = [MEMORY[0x1E4F28B00] currentHandler];
      v103 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append32(MSVHasherSipHash_1_3 *, uint32_t)");
      objc_msgSend(v102, "handleFailureInFunction:file:lineNumber:description:", v103, @"MSVHasher+SipHash.h", 91, @"_MSVHasher_SipHash_1_3_Append32: invalid byte count detected [byteCount & 3]: %lld", v127);

      unint64_t v26 = v127;
    }
    uint64_t v28 = v26 & 0xFFFFFFFFFFFFFFLL | (wiFiDataAllowedFallbackValue << 32);
    unint64_t v29 = (v111 + v115) ^ __ROR8__(v115, 51);
    uint64_t v30 = v119 + (v28 ^ v123);
    uint64_t v31 = __ROR8__(v28 ^ v123, 48);
    uint64_t v32 = (v30 ^ v31) + __ROR8__(v111 + v115, 32);
    uint64_t v33 = v32 ^ __ROR8__(v30 ^ v31, 43);
    uint64_t v34 = v30 + v29;
    uint64_t v119 = __ROR8__(v34, 32);
    uint64_t v123 = v33;
    unint64_t v111 = v32 ^ v28;
    uint64_t v115 = v34 ^ __ROR8__(v29, 47);
    unint64_t v27 = v26 & 0xFF00000000000000;
  }
  else
  {
    if ((v26 & 0x7FFFFFFFFFFFFFFLL) != 0)
    {
      v96 = [MEMORY[0x1E4F28B00] currentHandler];
      v97 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append32(MSVHasherSipHash_1_3 *, uint32_t)");
      [v96 handleFailureInFunction:v97, @"MSVHasher+SipHash.h", 88, @"_MSVHasher_SipHash_1_3_Append32: invalid byte count detected [byteCount & 7, tail == 0]: %lld", v127 file lineNumber description];

      unint64_t v26 = v127;
    }
    unint64_t v27 = v26 | wiFiDataAllowedFallbackValue;
  }
  unint64_t v128 = v27 + 0x400000000000000;
  v35 = self->_networkTypeToDataAllowed;
  uint64_t v36 = [(NSMutableDictionary *)v35 hash];
  unint64_t v37 = v128;
  if ((v128 & 0x400000000000000) != 0)
  {
    if ((v128 & 0x300000000000000) != 0)
    {
      uint64_t v109 = v36;
      v104 = [MEMORY[0x1E4F28B00] currentHandler];
      v105 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
      objc_msgSend(v104, "handleFailureInFunction:file:lineNumber:description:", v105, @"MSVHasher+SipHash.h", 105, @"_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 3]: %lld", v128);

      uint64_t v36 = v109;
      unint64_t v37 = v128;
    }
    uint64_t v44 = v37 & 0xFFFFFFFFFFFFFFLL | (v36 << 32);
    unint64_t v45 = (v111 + v115) ^ __ROR8__(v115, 51);
    uint64_t v46 = v119 + (v44 ^ v123);
    uint64_t v47 = __ROR8__(v44 ^ v123, 48);
    uint64_t v48 = (v46 ^ v47) + __ROR8__(v111 + v115, 32);
    uint64_t v49 = v48 ^ __ROR8__(v46 ^ v47, 43);
    uint64_t v50 = v46 + v45;
    uint64_t v120 = __ROR8__(v50, 32);
    uint64_t v124 = v49;
    uint64_t v112 = v48 ^ v44;
    uint64_t v116 = v50 ^ __ROR8__(v45, 47);
    unint64_t v37 = v37 & 0xFF00000000000000 | HIDWORD(v36);
  }
  else
  {
    if ((v128 & 0x7FFFFFFFFFFFFFFLL) != 0)
    {
      uint64_t v108 = v36;
      v98 = [MEMORY[0x1E4F28B00] currentHandler];
      v99 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
      [v98 handleFailureInFunction:v99, @"MSVHasher+SipHash.h", 101, @"_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 7, tail == 0]: %lld", v128 file lineNumber description];

      uint64_t v36 = v108;
      unint64_t v37 = v128;
    }
    unint64_t v38 = (v111 + v115) ^ __ROR8__(v115, 51);
    uint64_t v39 = v119 + (v123 ^ v36);
    uint64_t v40 = __ROR8__(v123 ^ v36, 48);
    uint64_t v41 = (v39 ^ v40) + __ROR8__(v111 + v115, 32);
    uint64_t v42 = v41 ^ __ROR8__(v39 ^ v40, 43);
    uint64_t v43 = v39 + v38;
    uint64_t v120 = __ROR8__(v43, 32);
    uint64_t v124 = v42;
    uint64_t v112 = v41 ^ v36;
    uint64_t v116 = v43 ^ __ROR8__(v38, 47);
  }
  unint64_t v129 = v37 + 0x800000000000000;

  long long v51 = self->_networkTypeToSizeLimit;
  uint64_t v52 = [(NSMutableDictionary *)v51 hash];
  unint64_t v53 = v129;
  if ((v129 & 0x400000000000000) != 0)
  {
    if ((v129 & 0x300000000000000) != 0)
    {
      v106 = [MEMORY[0x1E4F28B00] currentHandler];
      v107 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
      objc_msgSend(v106, "handleFailureInFunction:file:lineNumber:description:", v107, @"MSVHasher+SipHash.h", 105, @"_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 3]: %lld", v129);

      unint64_t v53 = v129;
    }
    uint64_t v60 = v53 & 0xFFFFFFFFFFFFFFLL | (v52 << 32);
    uint64_t v61 = (v112 + v116) ^ __ROR8__(v116, 51);
    uint64_t v62 = v120 + (v60 ^ v124);
    uint64_t v63 = __ROR8__(v60 ^ v124, 48);
    uint64_t v64 = (v62 ^ v63) + __ROR8__(v112 + v116, 32);
    uint64_t v65 = v64 ^ __ROR8__(v62 ^ v63, 43);
    uint64_t v66 = v62 + v61;
    uint64_t v121 = __ROR8__(v66, 32);
    uint64_t v125 = v65;
    uint64_t v113 = v64 ^ v60;
    uint64_t v117 = v66 ^ __ROR8__(v61, 47);
    unint64_t v53 = v53 & 0xFF00000000000000 | HIDWORD(v52);
  }
  else
  {
    if ((v129 & 0x7FFFFFFFFFFFFFFLL) != 0)
    {
      v100 = [MEMORY[0x1E4F28B00] currentHandler];
      v101 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
      [v100 handleFailureInFunction:v101, @"MSVHasher+SipHash.h", 101, @"_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 7, tail == 0]: %lld", v129 file lineNumber description];

      unint64_t v53 = v129;
    }
    uint64_t v54 = (v112 + v116) ^ __ROR8__(v116, 51);
    uint64_t v55 = v120 + (v124 ^ v52);
    uint64_t v56 = __ROR8__(v124 ^ v52, 48);
    uint64_t v57 = (v55 ^ v56) + __ROR8__(v112 + v116, 32);
    uint64_t v58 = v57 ^ __ROR8__(v55 ^ v56, 43);
    uint64_t v59 = v55 + v54;
    uint64_t v121 = __ROR8__(v59, 32);
    uint64_t v125 = v58;
    uint64_t v113 = v57 ^ v52;
    uint64_t v117 = v59 ^ __ROR8__(v54, 47);
  }
  unint64_t v130 = v53 + 0x800000000000000;

  uint64_t v67 = (v113 + v117) ^ __ROR8__(v117, 51);
  uint64_t v68 = v121 + (v125 ^ v130);
  uint64_t v69 = __ROR8__(v125 ^ v130, 48);
  uint64_t v70 = (v68 ^ v69) + __ROR8__(v113 + v117, 32);
  uint64_t v71 = v70 ^ __ROR8__(v68 ^ v69, 43);
  uint64_t v72 = v68 + v67;
  uint64_t v73 = v72 ^ __ROR8__(v67, 47);
  unint64_t v74 = (v70 ^ v130) + v73;
  uint64_t v75 = v74 ^ __ROR8__(v73, 51);
  uint64_t v76 = (__ROR8__(v72, 32) ^ 0xFFLL) + v71;
  uint64_t v77 = __ROR8__(v71, 48);
  uint64_t v78 = __ROR8__(v74, 32) + (v76 ^ v77);
  uint64_t v79 = v78 ^ __ROR8__(v76 ^ v77, 43);
  uint64_t v80 = v75 + v76;
  uint64_t v81 = v80 ^ __ROR8__(v75, 47);
  uint64_t v82 = v81 + v78;
  uint64_t v83 = v82 ^ __ROR8__(v81, 51);
  uint64_t v84 = __ROR8__(v80, 32) + v79;
  uint64_t v85 = __ROR8__(v79, 48);
  uint64_t v86 = __ROR8__(v82, 32) + (v84 ^ v85);
  uint64_t v87 = v86 ^ __ROR8__(v84 ^ v85, 43);
  uint64_t v88 = v83 + v84;
  uint64_t v89 = v88 ^ __ROR8__(v83, 47);
  uint64_t v90 = v89 + v86;
  uint64_t v91 = v90 ^ __ROR8__(v89, 51);
  uint64_t v92 = __ROR8__(v88, 32) + v87;
  uint64_t v93 = __ROR8__(v87, 48);
  uint64_t v94 = __ROR8__(v90, 32) + (v92 ^ v93);
  return (v91 + v92) ^ __ROR8__(v91, 47) ^ v94 ^ __ROR8__(v91 + v92, 32) ^ v94 ^ __ROR8__(v92 ^ v93, 43);
}

- (ICNetworkConstraints)initWithBundleIdentifier:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(ICNetworkConstraints *)self init];
  if (v5)
  {
    uint64_t v6 = _CTServerConnectionCreateOnTargetQueue();
    if (v6)
    {
      uint64_t v7 = (const void *)v6;
      _CTServerConnectionCopyCellularUsagePolicy();
      CFRelease(v7);
    }
  }

  return v5;
}

- (ICNetworkConstraints)init
{
  v3.receiver = self;
  v3.super_class = (Class)ICNetworkConstraints;
  result = [(ICNetworkConstraints *)&v3 init];
  if (result)
  {
    *(_WORD *)&result->_dataAllowedFallbackValue = 257;
    result->_uint64_t wiFiDataAllowedFallbackValue = 1;
  }
  return result;
}

@end