@interface NPKCatalogUtilities
+ (id)catalogByMergingCompanionCatalog:(id)a3 intoWatchCatalog:(id)a4 watchPasses:(id)a5;
@end

@implementation NPKCatalogUtilities

+ (id)catalogByMergingCompanionCatalog:(id)a3 intoWatchCatalog:(id)a4 watchPasses:(id)a5
{
  uint64_t v181 = *MEMORY[0x263EF8340];
  id v101 = a3;
  id v7 = a4;
  id v8 = a5;
  v9 = [MEMORY[0x263EFF9A0] dictionary];
  long long v165 = 0u;
  long long v166 = 0u;
  long long v167 = 0u;
  long long v168 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v165 objects:v180 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v166;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v166 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v165 + 1) + 8 * i);
        v16 = [v15 uniqueID];
        if (v16) {
          [v9 setObject:v15 forKey:v16];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v165 objects:v180 count:16];
    }
    while (v12);
  }
  v99 = v10;

  v105 = [MEMORY[0x263EFF980] array];
  id v117 = [MEMORY[0x263EFF980] array];
  long long v161 = 0u;
  long long v162 = 0u;
  long long v163 = 0u;
  long long v164 = 0u;
  v100 = v7;
  obuint64_t j = [v7 groups];
  uint64_t v17 = [obj countByEnumeratingWithState:&v161 objects:v179 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v162;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v162 != v19) {
          objc_enumerationMutation(obj);
        }
        v21 = *(void **)(*((void *)&v161 + 1) + 8 * j);
        long long v157 = 0u;
        long long v158 = 0u;
        long long v159 = 0u;
        long long v160 = 0u;
        v22 = [v21 uniqueIDs];
        uint64_t v23 = [v22 countByEnumeratingWithState:&v157 objects:v178 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v158;
          while (2)
          {
            for (uint64_t k = 0; k != v24; ++k)
            {
              if (*(void *)v158 != v25) {
                objc_enumerationMutation(v22);
              }
              v27 = [v9 objectForKey:*(void *)(*((void *)&v157 + 1) + 8 * k)];
              if (v27)
              {
                v28 = v27;
                uint64_t v29 = [v27 passType];
                if ([v28 style] == 6 && v29 == 1) {
                  v31 = v105;
                }
                else {
                  v31 = v117;
                }
                [v31 addObject:v21];

                goto LABEL_31;
              }
            }
            uint64_t v24 = [v22 countByEnumeratingWithState:&v157 objects:v178 count:16];
            if (v24) {
              continue;
            }
            break;
          }
        }
LABEL_31:
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v161 objects:v179 count:16];
    }
    while (v18);
  }

  id v110 = [MEMORY[0x263EFF980] array];
  long long v153 = 0u;
  long long v154 = 0u;
  long long v155 = 0u;
  long long v156 = 0u;
  id obja = [v101 groups];
  uint64_t v32 = [obja countByEnumeratingWithState:&v153 objects:v177 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v154;
    do
    {
      for (uint64_t m = 0; m != v33; ++m)
      {
        if (*(void *)v154 != v34) {
          objc_enumerationMutation(obja);
        }
        v36 = *(void **)(*((void *)&v153 + 1) + 8 * m);
        long long v149 = 0u;
        long long v150 = 0u;
        long long v151 = 0u;
        long long v152 = 0u;
        v37 = [v36 uniqueIDs];
        uint64_t v38 = [v37 countByEnumeratingWithState:&v149 objects:v176 count:16];
        if (v38)
        {
          uint64_t v39 = v38;
          uint64_t v40 = *(void *)v150;
          while (2)
          {
            for (uint64_t n = 0; n != v39; ++n)
            {
              if (*(void *)v150 != v40) {
                objc_enumerationMutation(v37);
              }
              v42 = [v9 objectForKey:*(void *)(*((void *)&v149 + 1) + 8 * n)];
              if (v42)
              {
                v43 = v42;
                uint64_t v44 = [v42 passType];
                uint64_t v45 = [v43 style];
                if (v44 != 1 || v45 != 6)
                {
                  v47 = (void *)[v36 copy];
                  [v110 addObject:v47];
                }
                goto LABEL_53;
              }
            }
            uint64_t v39 = [v37 countByEnumeratingWithState:&v149 objects:v176 count:16];
            if (v39) {
              continue;
            }
            break;
          }
        }
LABEL_53:
      }
      uint64_t v33 = [obja countByEnumeratingWithState:&v153 objects:v177 count:16];
    }
    while (v33);
  }

  v48 = [MEMORY[0x263EFF9C0] set];
  long long v145 = 0u;
  long long v146 = 0u;
  long long v147 = 0u;
  long long v148 = 0u;
  id v112 = v117;
  uint64_t v49 = [v112 countByEnumeratingWithState:&v145 objects:v175 count:16];
  if (v49)
  {
    uint64_t v50 = v49;
    id v118 = *(id *)v146;
    do
    {
      for (iuint64_t i = 0; ii != v50; ++ii)
      {
        if (*(id *)v146 != v118) {
          objc_enumerationMutation(v112);
        }
        v52 = *(void **)(*((void *)&v145 + 1) + 8 * ii);
        long long v141 = 0u;
        long long v142 = 0u;
        long long v143 = 0u;
        long long v144 = 0u;
        v53 = [v52 uniqueIDs];
        uint64_t v54 = [v53 countByEnumeratingWithState:&v141 objects:v174 count:16];
        if (v54)
        {
          uint64_t v55 = v54;
          uint64_t v56 = *(void *)v142;
          do
          {
            for (juint64_t j = 0; jj != v55; ++jj)
            {
              if (*(void *)v142 != v56) {
                objc_enumerationMutation(v53);
              }
              uint64_t v58 = *(void *)(*((void *)&v141 + 1) + 8 * jj);
              v59 = [v9 objectForKey:v58];
              if (v59) {
                [v48 addObject:v58];
              }
            }
            uint64_t v55 = [v53 countByEnumeratingWithState:&v141 objects:v174 count:16];
          }
          while (v55);
        }
      }
      uint64_t v50 = [v112 countByEnumeratingWithState:&v145 objects:v175 count:16];
    }
    while (v50);
  }

  v60 = [MEMORY[0x263EFF9C0] set];
  long long v137 = 0u;
  long long v138 = 0u;
  long long v139 = 0u;
  long long v140 = 0u;
  id v106 = v110;
  id v119 = (id)[v106 countByEnumeratingWithState:&v137 objects:v173 count:16];
  if (v119)
  {
    id objb = *(id *)v138;
    do
    {
      for (kuint64_t k = 0; kk != v119; kuint64_t k = (char *)kk + 1)
      {
        if (*(id *)v138 != objb) {
          objc_enumerationMutation(v106);
        }
        v62 = *(void **)(*((void *)&v137 + 1) + 8 * (void)kk);
        long long v133 = 0u;
        long long v134 = 0u;
        long long v135 = 0u;
        long long v136 = 0u;
        v63 = [v62 uniqueIDs];
        uint64_t v64 = [v63 countByEnumeratingWithState:&v133 objects:v172 count:16];
        if (v64)
        {
          uint64_t v65 = v64;
          uint64_t v66 = *(void *)v134;
          do
          {
            for (muint64_t m = 0; mm != v65; ++mm)
            {
              if (*(void *)v134 != v66) {
                objc_enumerationMutation(v63);
              }
              uint64_t v68 = *(void *)(*((void *)&v133 + 1) + 8 * mm);
              v69 = [v9 objectForKey:v68];
              if (v69) {
                [v60 addObject:v68];
              }
            }
            uint64_t v65 = [v63 countByEnumeratingWithState:&v133 objects:v172 count:16];
          }
          while (v65);
        }
      }
      id v119 = (id)[v106 countByEnumeratingWithState:&v137 objects:v173 count:16];
    }
    while (v119);
  }

  v70 = (void *)[v48 mutableCopy];
  [v70 minusSet:v60];
  v103 = [MEMORY[0x263EFF980] array];
  long long v129 = 0u;
  long long v130 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  id v104 = v70;
  uint64_t v108 = [v104 countByEnumeratingWithState:&v129 objects:v171 count:16];
  if (v108)
  {
    uint64_t v107 = *(void *)v130;
    do
    {
      uint64_t v71 = 0;
      do
      {
        if (*(void *)v130 != v107) {
          objc_enumerationMutation(v104);
        }
        uint64_t v72 = *(void *)(*((void *)&v129 + 1) + 8 * v71);
        long long v125 = 0u;
        long long v126 = 0u;
        long long v127 = 0u;
        long long v128 = 0u;
        id v120 = v112;
        uint64_t v73 = [v120 countByEnumeratingWithState:&v125 objects:v170 count:16];
        if (v73)
        {
          uint64_t v74 = v73;
          uint64_t v109 = v71;
          uint64_t v75 = *(void *)v126;
LABEL_94:
          uint64_t v76 = 0;
          while (1)
          {
            if (*(void *)v126 != v75) {
              objc_enumerationMutation(v120);
            }
            v77 = *(void **)(*((void *)&v125 + 1) + 8 * v76);
            v78 = [v77 uniqueIDs];
            char v79 = [v78 containsObject:v72];

            if (v79) {
              break;
            }
            if (v74 == ++v76)
            {
              uint64_t v74 = [v120 countByEnumeratingWithState:&v125 objects:v170 count:16];
              if (v74) {
                goto LABEL_94;
              }
              id v80 = 0;
              uint64_t v71 = v109;
              goto LABEL_115;
            }
          }
          id v80 = v77;

          if (!v80)
          {
            uint64_t v71 = v109;
            goto LABEL_117;
          }
          uint64_t v71 = v109;
          if ([v103 containsObject:v80]) {
            goto LABEL_117;
          }
          v81 = (void *)[v60 mutableCopy];
          v82 = (void *)MEMORY[0x263EFFA08];
          v83 = [v80 uniqueIDs];
          v84 = [v82 setWithArray:v83];
          [v81 intersectSet:v84];

          id v120 = v81;
          if ([v81 count])
          {
            id v102 = v80;
            id objc = [v81 anyObject];
            long long v121 = 0u;
            long long v122 = 0u;
            long long v123 = 0u;
            long long v124 = 0u;
            id v111 = v106;
            uint64_t v85 = [v111 countByEnumeratingWithState:&v121 objects:v169 count:16];
            if (v85)
            {
              uint64_t v86 = v85;
              uint64_t v87 = *(void *)v122;
              while (2)
              {
                for (nuint64_t n = 0; nn != v86; ++nn)
                {
                  if (*(void *)v122 != v87) {
                    objc_enumerationMutation(v111);
                  }
                  v89 = *(void **)(*((void *)&v121 + 1) + 8 * nn);
                  v90 = [v89 uniqueIDs];
                  int v91 = [v90 containsObject:objc];

                  if (v91)
                  {
                    v92 = [v89 uniqueIDs];
                    [v92 addObject:v72];

                    uint64_t v71 = v109;
                    id v80 = v102;
                    goto LABEL_115;
                  }
                }
                uint64_t v86 = [v111 countByEnumeratingWithState:&v121 objects:v169 count:16];
                if (v86) {
                  continue;
                }
                break;
              }
            }

            uint64_t v71 = v109;
            id v80 = v102;
          }
          [v103 addObject:v80];
        }
        else
        {
          id v80 = 0;
        }
LABEL_115:

LABEL_117:
        ++v71;
      }
      while (v71 != v108);
      uint64_t v93 = [v104 countByEnumeratingWithState:&v129 objects:v171 count:16];
      uint64_t v108 = v93;
    }
    while (v93);
  }

  id v94 = objc_alloc_init(MEMORY[0x263F5BDF0]);
  v95 = [v94 groups];
  [v95 addObjectsFromArray:v105];

  v96 = [v94 groups];
  [v96 addObjectsFromArray:v103];

  v97 = [v94 groups];
  [v97 addObjectsFromArray:v106];

  return v94;
}

@end