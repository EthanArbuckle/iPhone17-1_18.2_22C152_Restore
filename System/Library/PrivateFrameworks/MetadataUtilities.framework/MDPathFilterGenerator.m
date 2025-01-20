@interface MDPathFilterGenerator
- (MDPathFilterGenerator)initWithDefaultFieldsAndValues:(int *)a3 ignoreFields:(int *)a4 mappedPrefixes:(id)a5 hiddenExtensions:(id)a6 mappedExtensions:(id)a7;
- (_MDPlistContainer)copyFilterMDPlistForMountDepth:(int)a3;
- (id)filterDataForMountDepth:(int)a3;
- (void)addMappedExtensions:(id)a3;
- (void)addNamed:(id)a3 auxValue:(unint64_t)a4 forPath:(id)a5;
- (void)addNamed:(id)a3 field:(int)a4 value:(int)a5 forPath:(id)a6 permitLink:(BOOL)a7;
- (void)addNamed:(id)a3 field:(int)a4 value:(int)a5 hasAuxValue:(BOOL)a6 auxValue:(unint64_t)a7 forPath:(id)a8 permitLink:(BOOL)a9 copyParentWildcardLink:(BOOL)a10;
- (void)addRules:(id *)a3 withPrefix:(id)a4;
- (void)addRules:(id *)a3 withPrefix:(id)a4 tableMapping:(id)a5;
- (void)dealloc;
- (void)dump;
- (void)setAtBundleField:(unsigned int)a3 inBundleField:(unsigned int)a4;
@end

@implementation MDPathFilterGenerator

- (MDPathFilterGenerator)initWithDefaultFieldsAndValues:(int *)a3 ignoreFields:(int *)a4 mappedPrefixes:(id)a5 hiddenExtensions:(id)a6 mappedExtensions:(id)a7
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v30.receiver = self;
  v30.super_class = (Class)MDPathFilterGenerator;
  v11 = [(MDPathFilterGenerator *)&v30 init];
  v12 = v11;
  if (v11)
  {
    if (a4)
    {
      unsigned int v13 = *a4;
      if (*a4)
      {
        unint64_t ignoreMask = v11->_ignoreMask;
        v15 = a4 + 1;
        do
        {
          ignoreMask |= ~(-1 << (v13 >> 6)) << v13;
          unsigned int v16 = *v15++;
          unsigned int v13 = v16;
        }
        while (v16);
        v11->_unint64_t ignoreMask = ignoreMask;
      }
    }
    if (a3)
    {
      unsigned int v17 = *a3;
      if (*a3)
      {
        unint64_t v18 = v11->_ignoreMask;
        v19 = a3 + 2;
        do
        {
          uint64_t v20 = ~(-1 << (v17 >> 6));
          uint64_t v21 = v20 << v17;
          if ((v18 & (v20 << v17)) == 0)
          {
            unint64_t v22 = v11->_defaultMask | v21;
            v11->_defaultRule |= (*(v19 - 1) & (unint64_t)v20) << (v17 & 0x3F);
            v11->_defaultMask = v22;
            if ((v17 & 0x1000) != 0) {
              v11->_inheritMask |= v21;
            }
          }
          unsigned int v23 = *v19;
          v19 += 2;
          unsigned int v17 = v23;
        }
        while (v23);
      }
    }
    v11->_namedRoots = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v12->_namedRootArray = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v12->_namedRootIndexes = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v12->_auxValueArray = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v12->_processExtensions = ((unint64_t)a5 | (unint64_t)a7) != 0;
    id v24 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    v25 = (void *)MEMORY[0x1E4F1CC08];
    if (a5) {
      id v26 = a5;
    }
    else {
      id v26 = (id)MEMORY[0x1E4F1CC08];
    }
    v12->_namedLinkPrefixesDictionary = (NSDictionary *)[v24 initWithDictionary:v26];
    id v27 = objc_alloc(MEMORY[0x1E4F1CA60]);
    if (a7) {
      id v28 = a7;
    }
    else {
      id v28 = v25;
    }
    v12->_namedLinkExtensionsDictionary = (NSMutableDictionary *)[v27 initWithDictionary:v28];
  }
  return v12;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)MDPathFilterGenerator;
  [(MDPathFilterGenerator *)&v3 dealloc];
}

- (void)addMappedExtensions:(id)a3
{
  namedLinkExtensionsDictionary = self->_namedLinkExtensionsDictionary;

  [(NSMutableDictionary *)namedLinkExtensionsDictionary addEntriesFromDictionary:a3];
}

- (void)setAtBundleField:(unsigned int)a3 inBundleField:(unsigned int)a4
{
  int8x8_t v4 = vand_s8((int8x8_t)__PAIR64__(a4, a3), (int8x8_t)0x3F0000003FLL);
  int8x8_t v5 = vand_s8((int8x8_t)vshr_n_u32((uint32x2_t)__PAIR64__(a4, a3), 6uLL), (int8x8_t)0x3F0000003FLL);
  v6.i64[0] = v5.u32[0];
  v6.i64[1] = v5.u32[1];
  v7.i64[0] = -1;
  v7.i64[1] = -1;
  uint64x2_t v8 = (uint64x2_t)vmvnq_s8((int8x16_t)vshlq_u64(v7, v6));
  v6.i64[0] = v4.u32[0];
  v6.i64[1] = v4.u32[1];
  *(uint64x2_t *)&self->_atBundleMask = vshlq_u64(v8, v6);
}

- (void)addNamed:(id)a3 field:(int)a4 value:(int)a5 hasAuxValue:(BOOL)a6 auxValue:(unint64_t)a7 forPath:(id)a8 permitLink:(BOOL)a9 copyParentWildcardLink:(BOOL)a10
{
  id v10 = a8;
  BOOL v28 = a6;
  uint64_t v11 = *(void *)&a5;
  uint64_t v12 = *(void *)&a4;
  if (!a4 || (self->_ignoreMask & (~(-1 << (a4 >> 6)) << a4)) == 0)
  {
    uint64_t v15 = [a8 hasSuffix:@"/*"];
    if (v15) {
      id v10 = (id)objc_msgSend(v10, "substringToIndex:", objc_msgSend(v10, "length") - 2);
    }
    if ([v10 hasPrefix:@"/"]) {
      id v10 = (id)[v10 substringFromIndex:1];
    }
    BOOL v16 = a9;
    id v17 = (id)[(NSMutableDictionary *)self->_namedRoots objectForKey:a3];
    if (!v17)
    {
      id v17 = [[FilterElementDefinition alloc] initAsRoot:a3];
      [(NSMutableDictionary *)self->_namedRoots setObject:v17 forKey:a3];
      uint64_t v18 = v15;
      v19 = NSNumber;
      unsigned int v27 = v11;
      namedRootIndexes = self->_namedRootIndexes;
      uint64_t v21 = [(NSMutableArray *)self->_namedRootArray count];
      unint64_t v22 = v19;
      uint64_t v15 = v18;
      BOOL v16 = a9;
      uint64_t v23 = [v22 numberWithLong:v21];
      id v24 = namedRootIndexes;
      uint64_t v11 = v27;
      [(NSMutableDictionary *)v24 setObject:v23 forKey:a3];
      [(NSMutableArray *)self->_namedRootArray addObject:a3];
    }
    LOBYTE(v26) = a10;
    LOBYTE(v25) = v16;
    [v17 addRuleField:v12 value:v11 hasAuxValue:v28 auxValue:a7 inside:v15 forPathComponents:objc_msgSend(v10 permitLink:"pathComponents") componentIndex:v25 parentElement:0 copyParentWildcardLink:v26];
    if (v12 != 196607 && (v12 & 0x1000) != 0) {
      self->_inheritMask |= ~(-1 << (v12 >> 6)) << v12;
    }
  }
}

- (void)addNamed:(id)a3 field:(int)a4 value:(int)a5 forPath:(id)a6 permitLink:(BOOL)a7
{
  uint64_t v7 = *(void *)&a4;
  uint64_t v8 = ~(-1 << (a4 >> 6)) << a4;
  if ((self->_ignoreMask & v8) == 0)
  {
    id v10 = a6;
    uint64_t v11 = *(void *)&a5;
    uint64_t v14 = [a6 hasSuffix:@"/*"];
    if (v14) {
      id v10 = (id)objc_msgSend(v10, "substringToIndex:", objc_msgSend(v10, "length") - 2);
    }
    if ([v10 hasPrefix:@"/"]) {
      id v10 = (id)[v10 substringFromIndex:1];
    }
    id v15 = (id)[(NSMutableDictionary *)self->_namedRoots objectForKey:a3];
    if (!v15)
    {
      id v15 = [[FilterElementDefinition alloc] initAsRoot:a3];
      [(NSMutableDictionary *)self->_namedRoots setObject:v15 forKey:a3];
      -[NSMutableDictionary setObject:forKey:](self->_namedRootIndexes, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithLong:", -[NSMutableArray count](self->_namedRootArray, "count")), a3);
      [(NSMutableArray *)self->_namedRootArray addObject:a3];
    }
    LOBYTE(v17) = 0;
    LOBYTE(v16) = a7;
    [v15 addRuleField:v7 value:v11 hasAuxValue:0 auxValue:0 inside:v14 forPathComponents:objc_msgSend(v10 permitLink:"pathComponents") componentIndex:v16 parentElement:0 copyParentWildcardLink:v17];
    if (v7 != 196607 && (v7 & 0x1000) != 0) {
      self->_inheritMask |= v8;
    }
  }
}

- (void)addNamed:(id)a3 auxValue:(unint64_t)a4 forPath:(id)a5
{
  ++self->_auxValueCount;
  LOWORD(v5) = 0;
  -[MDPathFilterGenerator addNamed:field:value:hasAuxValue:auxValue:forPath:permitLink:copyParentWildcardLink:](self, "addNamed:field:value:hasAuxValue:auxValue:forPath:permitLink:copyParentWildcardLink:", a3, 0, 0, 1, a4, a5, v5);
}

- (void)addRules:(id *)a3 withPrefix:(id)a4
{
  [(MDPathFilterGenerator *)self addRules:a3 withPrefix:a4 tableMapping:0];
}

- (void)addRules:(id *)a3 withPrefix:(id)a4 tableMapping:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (a3->var1)
  {
    id v6 = a4;
    uint64_t v7 = a3;
    uint64_t v8 = self;
    id v9 = 0;
    p_id var1 = &a3->var1;
    unsigned int v25 = self;
    id v26 = a4;
    do
    {
      for (uint64_t i = 0; ; ++i)
      {
        unint64_t v12 = v7->var0[i];
        if (v12 == 0x1FFFF)
        {
          id v9 = *p_var1;
          continue;
        }
        if (v12 == 196607)
        {
          if (!v9) {
            -[MDPathFilterGenerator addRules:withPrefix:tableMapping:]();
          }
          id v18 = *p_var1;
          if (a5)
          {
            long long v30 = 0u;
            long long v31 = 0u;
            long long v28 = 0u;
            long long v29 = 0u;
            uint64_t v19 = [a5 countByEnumeratingWithState:&v28 objects:v27 count:16];
            if (v19)
            {
              uint64_t v20 = v19;
              uint64_t v21 = *(void *)v29;
              while (2)
              {
                for (uint64_t j = 0; j != v20; ++j)
                {
                  if (*(void *)v29 != v21) {
                    objc_enumerationMutation(a5);
                  }
                  uint64_t v23 = *(void *)(*((void *)&v28 + 1) + 8 * j);
                  if (objc_msgSend(v18, "containsString:", v23, v25, v26))
                  {
                    id v18 = (id)objc_msgSend(v18, "stringByReplacingOccurrencesOfString:withString:", v23, objc_msgSend(a5, "objectForKeyedSubscript:", v23));
                    goto LABEL_22;
                  }
                }
                uint64_t v20 = [a5 countByEnumeratingWithState:&v28 objects:v27 count:16];
                if (v20) {
                  continue;
                }
                break;
              }
LABEL_22:
              uint64_t v8 = v25;
              id v6 = v26;
            }
          }
          uint64_t v13 = objc_msgSend(v6, "stringByAppendingPathComponent:", v18, v25, v26);
          id v15 = v8;
          id v16 = v9;
          uint64_t v14 = 196607;
          unint64_t v17 = 0;
          goto LABEL_24;
        }
        if (!v12) {
          break;
        }
        if (!v9) {
          -[MDPathFilterGenerator addRules:withPrefix:tableMapping:]();
        }
        uint64_t v13 = [v6 stringByAppendingPathComponent:*p_var1];
        uint64_t v14 = HIDWORD(v12);
        id v15 = v8;
        id v16 = v9;
        unint64_t v17 = v12;
LABEL_24:
        -[MDPathFilterGenerator addNamed:field:value:forPath:permitLink:](v15, "addNamed:field:value:forPath:permitLink:", v16, v14, v17, v13, 1, v25, v26);
      }
      p_id var1 = &v7[1].var1;
      id var1 = v7[1].var1;
      ++v7;
    }
    while (var1);
  }
}

- (_MDPlistContainer)copyFilterMDPlistForMountDepth:(int)a3
{
  __int16 v3 = a3;
  uint64_t v215 = *MEMORY[0x1E4F143B8];
  if (![(NSMutableDictionary *)self->_namedRoots count]) {
    return 0;
  }
  Mutable = (_MDPlistContainer *)_MDPlistContainerCreateMutable(0, 1);
  _MDPlistContainerBeginContainer((uint64_t)Mutable, 0, v6, v7, v8, v9, v10, v11);
  if (![(NSMutableDictionary *)self->_namedRoots objectForKey:@"<ROOT>"]) {
    -[MDPathFilterGenerator copyFilterMDPlistForMountDepth:]();
  }
  __int16 v12 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_namedRootIndexes, "objectForKey:", @"<ROOT>"), "intValue");
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  _MDPlistContainerBeginDictionary((uint64_t)Mutable, v14, v15, v16, v17, v18, v19, v20);
  _MDPlistContainerAddCString((uint64_t)Mutable, "ROOT_ARRAY", -1, 0, v21, v22, v23, v24);
  _MDPlistContainerBeginArray((uint64_t)Mutable, v25, v26, v27, v28, v29, v30, v31);
  long long v213 = 0u;
  long long v214 = 0u;
  long long v211 = 0u;
  long long v212 = 0u;
  namedRootArray = self->_namedRootArray;
  uint64_t v33 = [(NSMutableArray *)namedRootArray countByEnumeratingWithState:&v211 objects:v210 count:16];
  if (v33)
  {
    uint64_t v40 = v33;
    uint64_t v41 = *(void *)v212;
    do
    {
      for (uint64_t i = 0; i != v40; ++i)
      {
        if (*(void *)v212 != v41) {
          objc_enumerationMutation(namedRootArray);
        }
        objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_namedRoots, "objectForKey:", *(void *)(*((void *)&v211 + 1) + 8 * i)), "encodeInto:auxArray:namedRootMap:", Mutable, v13, self->_namedRootIndexes);
      }
      uint64_t v40 = [(NSMutableArray *)namedRootArray countByEnumeratingWithState:&v211 objects:v210 count:16];
    }
    while (v40);
  }
  _MDPlistContainerEndArray((uint64_t)Mutable, 0, v34, v35, v36, v37, v38, v39);
  _MDPlistContainerAddCString((uint64_t)Mutable, "COMMON", -1, 0, v43, v44, v45, v46);
  unsigned __int8 v189 = 0;
  unsigned int v188 = 0;
  uint64_t v47 = [v13 count];
  _MDPlistContainerAddDataValue((uint64_t)Mutable, 0, 8 * v47 + 48, (uint64_t)&v188, v48, v49, v50, v51);
  long long v186 = 0uLL;
  uint64_t v187 = 0;
  _MDPlistReferenceToPlistObject((unint64_t)Mutable, v188 | ((unint64_t)v189 << 32), v52, v53, v54, v55, v56, &v186);
  long long v184 = v186;
  uint64_t v185 = v187;
  uint64_t BytePtr = _MDPlistDataGetBytePtr((uint64_t *)&v184, 0);
  __int16 processExtensions = self->_processExtensions;
  unint64_t defaultMask = self->_defaultMask;
  int auxValueCount = self->_auxValueCount;
  long long v61 = *(_OWORD *)&self->_inheritMask;
  long long v62 = *(_OWORD *)&self->_atBundleMask;
  *(_WORD *)uint64_t BytePtr = v3;
  *(_WORD *)(BytePtr + 2) = processExtensions;
  *(_WORD *)(BytePtr + 4) = v12;
  *(_OWORD *)(BytePtr + 6) = v61;
  *(void *)(BytePtr + 22) = defaultMask;
  *(_OWORD *)(BytePtr + 30) = v62;
  *(_WORD *)(BytePtr + 46) = auxValueCount;
  long long v208 = 0u;
  long long v209 = 0u;
  long long v206 = 0u;
  long long v207 = 0u;
  uint64_t v63 = [v13 countByEnumeratingWithState:&v206 objects:v205 count:16];
  if (v63)
  {
    uint64_t v68 = v63;
    int v69 = 0;
    uint64_t v70 = *(void *)v207;
    uint64_t v71 = BytePtr + 48;
    do
    {
      uint64_t v72 = 0;
      int v73 = v69;
      uint64_t v74 = v71 + 8 * v69;
      do
      {
        if (*(void *)v207 != v70) {
          objc_enumerationMutation(v13);
        }
        *(void *)(v74 + 8 * v72) = [*(id *)(*((void *)&v206 + 1) + 8 * v72) longLongValue];
        ++v72;
      }
      while (v68 != v72);
      uint64_t v68 = [v13 countByEnumeratingWithState:&v206 objects:v205 count:16];
      int v69 = v73 + v72;
    }
    while (v68);
  }
  _MDPlistContainerAddCString((uint64_t)Mutable, "EXTENSIONS", -1, 0, v64, v65, v66, v67);
  _MDPlistContainerBeginDictionary((uint64_t)Mutable, v75, v76, v77, v78, v79, v80, v81);
  long long v203 = 0u;
  long long v204 = 0u;
  long long v201 = 0u;
  long long v202 = 0u;
  v82 = (void *)[(NSMutableDictionary *)self->_namedLinkExtensionsDictionary allKeys];
  uint64_t v83 = [v82 countByEnumeratingWithState:&v201 objects:v200 count:16];
  if (v83)
  {
    uint64_t v90 = v83;
    uint64_t v91 = *(void *)v202;
    do
    {
      for (uint64_t j = 0; j != v90; ++j)
      {
        if (*(void *)v202 != v91) {
          objc_enumerationMutation(v82);
        }
        v93 = *(void **)(*((void *)&v201 + 1) + 8 * j);
        if (![v93 hasPrefix:@"."]
          || [v93 isEqualToString:@".*"])
        {
          uint64_t v94 = [(NSMutableDictionary *)self->_namedLinkExtensionsDictionary objectForKey:v93];
          if (v94)
          {
            v95 = (void *)[(NSMutableDictionary *)self->_namedRootIndexes objectForKey:v94];
            if (!v95) {
              -[MDPathFilterGenerator copyFilterMDPlistForMountDepth:].cold.4();
            }
            uint64_t v94 = ([v95 intValue] + 1) | 0x40000;
          }
          _MDPlistContainerAddObject((uint64_t)Mutable, v93, 0);
          _MDPlistContainerAddInt32Value((uint64_t)Mutable, v94, 0, v96, v97, v98, v99, v100);
        }
      }
      uint64_t v90 = [v82 countByEnumeratingWithState:&v201 objects:v200 count:16];
    }
    while (v90);
  }
  _MDPlistContainerEndDictionary((uint64_t)Mutable, 0, v84, v85, v86, v87, v88, v89);
  _MDPlistContainerAddCString((uint64_t)Mutable, "HIDDEN_EXTENSIONS", -1, 0, v101, v102, v103, v104);
  _MDPlistContainerBeginDictionary((uint64_t)Mutable, v105, v106, v107, v108, v109, v110, v111);
  long long v198 = 0u;
  long long v199 = 0u;
  long long v196 = 0u;
  long long v197 = 0u;
  v112 = (void *)[(NSMutableDictionary *)self->_namedLinkExtensionsDictionary allKeys];
  uint64_t v113 = [v112 countByEnumeratingWithState:&v196 objects:v195 count:16];
  if (v113)
  {
    uint64_t v120 = v113;
    uint64_t v121 = *(void *)v197;
    do
    {
      for (uint64_t k = 0; k != v120; ++k)
      {
        if (*(void *)v197 != v121) {
          objc_enumerationMutation(v112);
        }
        v123 = *(void **)(*((void *)&v196 + 1) + 8 * k);
        if ([v123 hasPrefix:@"."]
          && ([v123 isEqualToString:@".*"] & 1) == 0)
        {
          uint64_t v124 = [(NSMutableDictionary *)self->_namedLinkExtensionsDictionary objectForKey:v123];
          if (v124)
          {
            v125 = (void *)[(NSMutableDictionary *)self->_namedRootIndexes objectForKey:v124];
            if (!v125) {
              -[MDPathFilterGenerator copyFilterMDPlistForMountDepth:]();
            }
            uint64_t v124 = ([v125 intValue] + 1) | 0x40000;
          }
          _MDPlistContainerAddObject((uint64_t)Mutable, (const void *)[v123 substringFromIndex:1], 0);
          _MDPlistContainerAddInt32Value((uint64_t)Mutable, v124, 0, v126, v127, v128, v129, v130);
        }
      }
      uint64_t v120 = [v112 countByEnumeratingWithState:&v196 objects:v195 count:16];
    }
    while (v120);
  }
  _MDPlistContainerEndDictionary((uint64_t)Mutable, 0, v114, v115, v116, v117, v118, v119);
  _MDPlistContainerAddCString((uint64_t)Mutable, "PREFIXES", -1, 0, v131, v132, v133, v134);
  _MDPlistContainerBeginDictionary((uint64_t)Mutable, v135, v136, v137, v138, v139, v140, v141);
  long long v193 = 0u;
  long long v194 = 0u;
  long long v191 = 0u;
  long long v192 = 0u;
  namedLinkPrefixesDictionary = self->_namedLinkPrefixesDictionary;
  uint64_t v143 = [(NSDictionary *)namedLinkPrefixesDictionary countByEnumeratingWithState:&v191 objects:v190 count:16];
  if (v143)
  {
    uint64_t v150 = v143;
    uint64_t v151 = *(void *)v192;
    do
    {
      for (uint64_t m = 0; m != v150; ++m)
      {
        if (*(void *)v192 != v151) {
          objc_enumerationMutation(namedLinkPrefixesDictionary);
        }
        v153 = *(const void **)(*((void *)&v191 + 1) + 8 * m);
        v154 = (void *)[(NSMutableDictionary *)self->_namedRootIndexes objectForKey:[(NSDictionary *)self->_namedLinkPrefixesDictionary objectForKey:v153]];
        if (!v154) {
          -[MDPathFilterGenerator copyFilterMDPlistForMountDepth:]();
        }
        uint64_t v155 = ([v154 intValue] + 1) | 0x40000;
        _MDPlistContainerAddObject((uint64_t)Mutable, v153, 0);
        _MDPlistContainerAddInt32Value((uint64_t)Mutable, v155, 0, v156, v157, v158, v159, v160);
      }
      uint64_t v150 = [(NSDictionary *)namedLinkPrefixesDictionary countByEnumeratingWithState:&v191 objects:v190 count:16];
    }
    while (v150);
  }
  _MDPlistContainerEndDictionary((uint64_t)Mutable, 0, v144, v145, v146, v147, v148, v149);
  _MDPlistContainerAddCString((uint64_t)Mutable, "IS_DATA_ROSP", 12, 0, v161, v162, v163, v164);
  _MDPlistContainerAddInt32Value((uint64_t)Mutable, 1, 0, v165, v166, v167, v168, v169);
  _MDPlistContainerEndDictionary((uint64_t)Mutable, 0, v170, v171, v172, v173, v174, v175);
  _MDPlistContainerEndContainer((uint64_t)Mutable, v176, v177, v178, v179, v180, v181, v182);

  return Mutable;
}

- (id)filterDataForMountDepth:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = (void *)MEMORY[0x1A6246FD0](self, a2);
  uint64_t v6 = [(MDPathFilterGenerator *)self copyFilterMDPlistForMountDepth:v3];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    uint64_t Bytes = _MDPlistContainerGetBytes((uint64_t)v7);
    uint64_t v10 = (void *)[v8 initWithBytes:Bytes length:_MDPlistContainerGetLength((uint64_t)v7)];
    CFRelease(v7);
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (void)dump
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  namedRoots = self->_namedRoots;
  uint64_t v4 = [(NSMutableDictionary *)namedRoots countByEnumeratingWithState:&v9 objects:v8 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(namedRoots);
        }
        objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_namedRoots, "objectForKey:", *(void *)(*((void *)&v9 + 1) + 8 * i)), "dump:", 1);
      }
      uint64_t v5 = [(NSMutableDictionary *)namedRoots countByEnumeratingWithState:&v9 objects:v8 count:16];
    }
    while (v5);
  }
}

- (void)addRules:withPrefix:tableMapping:.cold.1()
{
}

- (void)addRules:withPrefix:tableMapping:.cold.2()
{
}

- (void)copyFilterMDPlistForMountDepth:.cold.1()
{
}

- (void)copyFilterMDPlistForMountDepth:.cold.2()
{
}

- (void)copyFilterMDPlistForMountDepth:.cold.3()
{
}

- (void)copyFilterMDPlistForMountDepth:.cold.4()
{
}

@end