@interface MPWeighter
- (BOOL)itemAtIndex:(int64_t)a3 meetsContraints:(id)a4;
- (BOOL)itemAtIndex:(int64_t)a3 meetsContraints:(id)a4 oneMatch:(BOOL)a5;
- (MPWeighter)init;
- (id)allConstraints;
- (id)allItems;
- (id)allUsageCounts;
- (id)constraintsForItem:(id)a3;
- (id)getRandomItemMeetingNumberOfFaceLandscapes:(int64_t)a3 facePortraits:(int64_t)a4 imageLandscapes:(int64_t)a5 imagePortraits:(int64_t)a6 vPanoramas:(int64_t)a7 hPanoramas:(int64_t)a8 movies:(int64_t)a9 fitsInExtraWide:(int64_t)a10 aspectRatios:(id)a11 previousTags:(id)a12;
- (id)ignoredIndices;
- (id)imageCounts;
- (id)indicesEqualingConstraints:(id)a3;
- (id)indicesMeetingConstraints:(id)a3;
- (int64_t)count;
- (int64_t)getRandomIndex;
- (int64_t)getRandomIndexInSubset:(id)a3;
- (int64_t)getRandomIndexInSubset:(id)a3 withPreviousTags:(id)a4;
- (int64_t)getRandomIndexMeetingContraints:(id)a3;
- (int64_t)getRandomIndexMeetingContraints:(id)a3 oneMatch:(BOOL)a4;
- (int64_t)getRandomIndexWithNoPanoramasForImageCount:(int64_t)a3;
- (int64_t)numberOfItemsWithImageCount:(int64_t)a3;
- (void)addIndexToIgnore:(int64_t)a3;
- (void)addItem:(id)a3 withWeight:(int64_t)a4 andContraints:(id)a5;
- (void)clearAllItems;
- (void)clearIgnoreIndices;
- (void)dealloc;
- (void)ignoreIndex:(int64_t)a3;
- (void)ignoreIndices:(id)a3;
- (void)increaseUsageCountOfObjectAtIndex:(int64_t)a3;
- (void)setEvenlyPickByID:(BOOL)a3;
- (void)setIgnorePanoramas:(BOOL)a3;
@end

@implementation MPWeighter

- (MPWeighter)init
{
  v4.receiver = self;
  v4.super_class = (Class)MPWeighter;
  v2 = [(MPWeighter *)&v4 init];
  if (v2)
  {
    v2->_weights = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v2->_items = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v2->_constraints = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v2->_usageCount = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v2->_ignoreIndices = (NSMutableIndexSet *)objc_alloc_init((Class)NSMutableIndexSet);
    v2->_totalWeight = 0;
    v2->_ignorePanoramas = 0;
  }
  return v2;
}

- (void)dealloc
{
  self->_usageCount = 0;
  self->_constraints = 0;

  self->_ignoreIndices = 0;
  self->_weights = 0;

  self->_items = 0;
  v3.receiver = self;
  v3.super_class = (Class)MPWeighter;
  [(MPWeighter *)&v3 dealloc];
}

- (void)addItem:(id)a3 withWeight:(int64_t)a4 andContraints:(id)a5
{
  self->_totalWeight += a4;
}

- (int64_t)getRandomIndexMeetingContraints:(id)a3
{
  return [(MPWeighter *)self getRandomIndexMeetingContraints:a3 oneMatch:1];
}

- (int64_t)getRandomIndexMeetingContraints:(id)a3 oneMatch:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = [(MPWeighter *)self count];
  id v8 = +[NSMutableIndexSet indexSet];
  id v9 = +[NSMutableIndexSet indexSet];
  if (v7 >= 1)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (([(NSMutableIndexSet *)self->_ignoreIndices containsIndex:i] & 1) == 0
        && [(MPWeighter *)self itemAtIndex:i meetsContraints:a3 oneMatch:v4])
      {
        if (!self->_evenlyPickByID
          || (id v11 = +[MPUtilities idOfCombinedID:](MPUtilities, "idOfCombinedID:", -[NSMutableArray objectAtIndex:](self->_items, "objectAtIndex:", i)), v12 = -[NSMutableIndexSet firstIndex](self->_ignoreIndices, "firstIndex"), v12 == (id)0x7FFFFFFFFFFFFFFFLL)|| (v13 = objc_msgSend(-[NSMutableArray objectAtIndex:](self->_items, "objectAtIndex:", v12), "hasPrefix:", v11), v14 = v8, (v13 & 1) == 0))
        {
          v14 = v9;
        }
        [v14 addIndex:i];
      }
    }
  }
  if (![v9 count] && objc_msgSend(v8, "count")) {
    id v9 = v8;
  }
  if (![v9 count]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return [(MPWeighter *)self getRandomIndexInSubset:v9];
}

- (int64_t)getRandomIndexWithNoPanoramasForImageCount:(int64_t)a3
{
  uint64_t v5 = [(MPWeighter *)self count];
  id v6 = +[NSMutableIndexSet indexSet];
  id v7 = +[NSMutableIndexSet indexSet];
  if (v5 >= 1)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      id v9 = [(NSMutableArray *)self->_constraints objectAtIndex:i];
      uint64_t v11 = v9[10];
      uint64_t v10 = v9[11];
      uint64_t v12 = v9[15];
      if (([(NSMutableIndexSet *)self->_ignoreIndices containsIndex:i] & 1) == 0)
      {
        BOOL v13 = !*((unsigned char *)v9 + 128) || v10 + v11 == -v12;
        if (v13 && v9[1] <= a3)
        {
          if (!self->_evenlyPickByID
            || (id v14 = +[MPUtilities idOfCombinedID:](MPUtilities, "idOfCombinedID:", -[NSMutableArray objectAtIndex:](self->_items, "objectAtIndex:", i)), v15 = -[NSMutableIndexSet firstIndex](self->_ignoreIndices, "firstIndex"), v15 == (id)0x7FFFFFFFFFFFFFFFLL)|| (v16 = objc_msgSend(-[NSMutableArray objectAtIndex:](self->_items, "objectAtIndex:", v15), "hasPrefix:", v14), v17 = v6, (v16 & 1) == 0))
          {
            v17 = v7;
          }
          [v17 addIndex:i];
        }
      }
    }
  }
  if (![v7 count] && objc_msgSend(v6, "count")) {
    id v7 = v6;
  }
  if (![v7 count]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return [(MPWeighter *)self getRandomIndexInSubset:v7];
}

- (id)getRandomItemMeetingNumberOfFaceLandscapes:(int64_t)a3 facePortraits:(int64_t)a4 imageLandscapes:(int64_t)a5 imagePortraits:(int64_t)a6 vPanoramas:(int64_t)a7 hPanoramas:(int64_t)a8 movies:(int64_t)a9 fitsInExtraWide:(int64_t)a10 aspectRatios:(id)a11 previousTags:(id)a12
{
  id v132 = objc_alloc_init((Class)NSMutableIndexSet);
  long long v197 = 0u;
  long long v198 = 0u;
  long long v199 = 0u;
  long long v200 = 0u;
  v141 = self;
  obj = self->_constraints;
  id v142 = [(NSMutableArray *)obj countByEnumeratingWithState:&v197 objects:v209 count:16];
  if (v142)
  {
    uint64_t v14 = 0;
    uint64_t v139 = *(void *)v198;
    int64_t v140 = a8;
    BOOL v16 = a7 > 0 || a8 > 0;
    BOOL v134 = v16;
    int64_t v133 = a8 + a7;
    int64_t v143 = a4 + a3;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v198 != v139) {
          objc_enumerationMutation(obj);
        }
        v18 = *(int64x2_t **)(*((void *)&v197 + 1) + 8 * v17);
        int64_t v146 = v18[2].i64[0];
        int v144 = v18[2].u8[8];
        int v145 = v18[2].u8[9];
        int64_t v20 = v18[3].i64[0];
        uint64_t v19 = v18[3].i64[1];
        uint64_t v21 = v18[4].i64[0];
        uint64_t v22 = v18[4].i64[1];
        int64x2_t v23 = v18[5];
        int64_t v25 = v18[6].i64[0];
        int64_t v24 = v18[6].i64[1];
        uint64_t v27 = v18[7].i64[0];
        uint64_t v26 = v18[7].i64[1];
        v28 = (void *)v18[9].i64[0];
        id v156 = (id)v18[8].i64[1];
        uint64_t v29 = v18[5].i64[1];
        uint64_t v30 = v18[5].i64[0];
        uint64_t v151 = v19;
        uint64_t v152 = v17;
        int64_t v149 = v20;
        uint64_t v150 = v22;
        uint64_t v148 = v21;
        uint64_t v153 = v26;
        if (a8 > 0
          || a7 > 0
          || (v23.i64[1] <= 0 ? (BOOL v31 = v23.i64[0] <= 0) : (BOOL v31 = 0), v31 ? (v32 = v26 < 1) : (v32 = 0), !v32))
        {
          v34.i64[0] = v26;
          v34.i64[1] = v24;
          char v35 = vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqzq_s64(v23), (int32x4_t)vceqzq_s64(v34)))));
          BOOL v36 = v134;
          if (v27) {
            BOOL v36 = 0;
          }
          if ((v35 & 1) == 0 && !v25 && v36) {
            goto LABEL_28;
          }
          if (v26 < 1)
          {
            BOOL v33 = a7 == v29 && a8 == v30;
            BOOL v48 = v24 >= a7 && v25 >= a8;
            if (v24 > 0 || v25 >= 1) {
              BOOL v33 = v48;
            }
            if (v27 >= 1) {
              BOOL v33 = v133 <= v27;
            }
            goto LABEL_69;
          }
          if (v133 != v26 && (a7 != v29 || v26 != a8) && (a8 != v30 || v26 != a7) && (a8 <= v30 || v133 - v30 != v26))
          {
            BOOL v40 = __OFSUB__(a7, v29);
            uint64_t v41 = a7 - v29;
            if (!((v41 < 0) ^ v40 | (v41 == 0)))
            {
              uint64_t v42 = v41 + a8;
              BOOL v43 = v41 + a8 == v26;
              BOOL v44 = a8 - v30 + v41 == v26;
              if (a8 <= v30 || v42 == v26) {
                BOOL v33 = v43;
              }
              else {
                BOOL v33 = v44;
              }
              goto LABEL_69;
            }
LABEL_28:
            BOOL v33 = 0;
            goto LABEL_69;
          }
        }
        BOOL v33 = 1;
LABEL_69:
        if (v141->_ignorePanoramas) {
          BOOL v33 = 1;
        }
        BOOL v147 = v33;
        v50 = v156;
        uint64_t v154 = v14;
        id v155 = v28;
        if (![v156 count]) {
          goto LABEL_234;
        }
        id v157 = [v156 mutableCopy];
        id v163 = [a11 mutableCopy];
        long long v193 = 0u;
        long long v194 = 0u;
        long long v195 = 0u;
        long long v196 = 0u;
        id v51 = [v156 countByEnumeratingWithState:&v193 objects:v208 count:16];
        if (v51)
        {
          id v52 = v51;
          uint64_t v159 = *(void *)v194;
          do
          {
            for (uint64_t i = 0; i != v52; uint64_t i = (char *)i + 1)
            {
              if (*(void *)v194 != v159) {
                objc_enumerationMutation(v156);
              }
              v54 = *(void **)(*((void *)&v193 + 1) + 8 * i);
              [v54 floatValue];
              float v56 = v55;
              id v57 = [v163 copy];
              long long v189 = 0u;
              long long v190 = 0u;
              long long v191 = 0u;
              long long v192 = 0u;
              id v58 = [v57 countByEnumeratingWithState:&v189 objects:v207 count:16];
              if (v58)
              {
                id v59 = v58;
                uint64_t v60 = *(void *)v190;
                do
                {
                  for (j = 0; j != v59; j = (char *)j + 1)
                  {
                    if (*(void *)v190 != v60) {
                      objc_enumerationMutation(v57);
                    }
                    v62 = *(void **)(*((void *)&v189 + 1) + 8 * (void)j);
                    [v62 floatValue];
                    BOOL v64 = v63 < 1.0;
                    if (v56 >= 1.0) {
                      BOOL v64 = 0;
                    }
                    if (v63 >= 1.0 && v56 >= 1.0) {
                      BOOL v64 = 1;
                    }
                    if (v63 < v56 && v64)
                    {
                      [v163 removeObject:v62];
                      [v157 removeObject:v54];
                      goto LABEL_96;
                    }
                  }
                  id v59 = [v57 countByEnumeratingWithState:&v189 objects:v207 count:16];
                }
                while (v59);
              }
LABEL_96:
            }
            v50 = v156;
            id v52 = [v156 countByEnumeratingWithState:&v193 objects:v208 count:16];
          }
          while (v52);
        }
        if (v153 >= 1)
        {
          if ([v157 count])
          {
            long long v187 = 0u;
            long long v188 = 0u;
            long long v185 = 0u;
            long long v186 = 0u;
            id v67 = [v50 countByEnumeratingWithState:&v185 objects:v206 count:16];
            if (v67)
            {
              id v68 = v67;
              uint64_t v160 = *(void *)v186;
              do
              {
                for (k = 0; k != v68; k = (char *)k + 1)
                {
                  if (*(void *)v186 != v160) {
                    objc_enumerationMutation(v156);
                  }
                  v70 = *(void **)(*((void *)&v185 + 1) + 8 * (void)k);
                  [v70 floatValue];
                  float v72 = v71;
                  id v73 = [v163 copy];
                  long long v181 = 0u;
                  long long v182 = 0u;
                  long long v183 = 0u;
                  long long v184 = 0u;
                  id v74 = [v73 countByEnumeratingWithState:&v181 objects:v205 count:16];
                  if (v74)
                  {
                    id v75 = v74;
                    uint64_t v76 = *(void *)v182;
                    while (2)
                    {
                      for (m = 0; m != v75; m = (char *)m + 1)
                      {
                        if (*(void *)v182 != v76) {
                          objc_enumerationMutation(v73);
                        }
                        v78 = *(void **)(*((void *)&v181 + 1) + 8 * (void)m);
                        [v78 floatValue];
                        if (v79 < v72)
                        {
                          [v163 removeObject:v78];
                          [v157 removeObject:v70];
                          goto LABEL_115;
                        }
                      }
                      id v75 = [v73 countByEnumeratingWithState:&v181 objects:v205 count:16];
                      if (v75) {
                        continue;
                      }
                      break;
                    }
                  }
LABEL_115:
                }
                id v68 = [v156 countByEnumeratingWithState:&v185 objects:v206 count:16];
              }
              while (v68);
            }
          }
        }
        id v80 = [v157 count];

        uint64_t v14 = v154;
        v28 = v155;
        if (v80)
        {
          BOOL v81 = 0;
        }
        else
        {
LABEL_234:
          if ([v28 count])
          {
            id v158 = [v28 mutableCopy];
            id v164 = [a11 mutableCopy];
            long long v177 = 0u;
            long long v178 = 0u;
            long long v179 = 0u;
            long long v180 = 0u;
            id v82 = [v28 countByEnumeratingWithState:&v177 objects:v204 count:16];
            if (v82)
            {
              id v83 = v82;
              uint64_t v161 = *(void *)v178;
              do
              {
                for (n = 0; n != v83; n = (char *)n + 1)
                {
                  if (*(void *)v178 != v161) {
                    objc_enumerationMutation(v155);
                  }
                  v85 = *(void **)(*((void *)&v177 + 1) + 8 * (void)n);
                  [v85 floatValue];
                  float v87 = v86;
                  id v88 = [v164 copy];
                  long long v173 = 0u;
                  long long v174 = 0u;
                  long long v175 = 0u;
                  long long v176 = 0u;
                  id v89 = [a11 countByEnumeratingWithState:&v173 objects:v203 count:16];
                  if (v89)
                  {
                    id v90 = v89;
                    uint64_t v91 = *(void *)v174;
                    do
                    {
                      for (iuint64_t i = 0; ii != v90; iuint64_t i = (char *)ii + 1)
                      {
                        if (*(void *)v174 != v91) {
                          objc_enumerationMutation(a11);
                        }
                        v93 = *(void **)(*((void *)&v173 + 1) + 8 * (void)ii);
                        [v93 floatValue];
                        BOOL v95 = v94 < 1.0;
                        if (v87 >= 1.0) {
                          BOOL v95 = 0;
                        }
                        if (v94 >= 1.0 && v87 >= 1.0) {
                          BOOL v95 = 1;
                        }
                        if (v94 > v87 && v95)
                        {
                          [v164 removeObject:v93];
                          [v158 removeObject:v85];
                          goto LABEL_144;
                        }
                      }
                      id v90 = [a11 countByEnumeratingWithState:&v173 objects:v203 count:16];
                    }
                    while (v90);
                  }
LABEL_144:
                }
                v28 = v155;
                id v83 = [v155 countByEnumeratingWithState:&v177 objects:v204 count:16];
              }
              while (v83);
            }
            if (v153 >= 1)
            {
              if ([v158 count])
              {
                long long v171 = 0u;
                long long v172 = 0u;
                long long v169 = 0u;
                long long v170 = 0u;
                id v98 = [v28 countByEnumeratingWithState:&v169 objects:v202 count:16];
                if (v98)
                {
                  id v99 = v98;
                  uint64_t v162 = *(void *)v170;
                  do
                  {
                    for (jj = 0; jj != v99; jj = (char *)jj + 1)
                    {
                      if (*(void *)v170 != v162) {
                        objc_enumerationMutation(v155);
                      }
                      v101 = *(void **)(*((void *)&v169 + 1) + 8 * (void)jj);
                      [v101 floatValue];
                      float v103 = v102;
                      id v104 = [v164 copy];
                      long long v165 = 0u;
                      long long v166 = 0u;
                      long long v167 = 0u;
                      long long v168 = 0u;
                      id v105 = [a11 countByEnumeratingWithState:&v165 objects:v201 count:16];
                      if (v105)
                      {
                        id v106 = v105;
                        uint64_t v107 = *(void *)v166;
                        while (2)
                        {
                          for (kk = 0; kk != v106; kk = (char *)kk + 1)
                          {
                            if (*(void *)v166 != v107) {
                              objc_enumerationMutation(a11);
                            }
                            v109 = *(void **)(*((void *)&v165 + 1) + 8 * (void)kk);
                            [v109 floatValue];
                            if (v110 > v103)
                            {
                              [v164 removeObject:v109];
                              [v158 removeObject:v101];
                              goto LABEL_163;
                            }
                          }
                          id v106 = [a11 countByEnumeratingWithState:&v165 objects:v201 count:16];
                          if (v106) {
                            continue;
                          }
                          break;
                        }
                      }
LABEL_163:
                    }
                    id v99 = [v155 countByEnumeratingWithState:&v169 objects:v202 count:16];
                  }
                  while (v99);
                }
              }
            }
            BOOL v81 = [v158 count] == 0;

            uint64_t v14 = v154;
          }
          else
          {
            BOOL v81 = 1;
          }
        }
        uint64_t v111 = v148 + v149;
        uint64_t v112 = v148 + v149 + v151;
        a8 = v140;
        if (v143 == v112 + v150 && v149 <= a10 && v147 && v81)
        {
          BOOL v113 = v111 == a3 && v150 == a4;
          BOOL v114 = v113;
          if (v113)
          {
            int64_t v115 = v146;
            int v117 = v144;
            int v116 = v145;
          }
          else
          {
            int64_t v115 = v146;
            int v117 = v144;
            int v116 = v145;
            if (v151) {
              BOOL v114 = v151 == a3 && v150 == a4
            }
                  || v151 == a4 && v111 == a3
                  || v151 == v143
                  || v150 + v151 == a4
                  || v112 == a3;
          }
          int v122 = !v114;
          if (a9) {
            int v122 = 1;
          }
          if (!v117) {
            int v122 = 1;
          }
          if (a9 >= 1 && v116 != 0) {
            int v122 = 0;
          }
          int v124 = v114 & v122;
          if (v115 < a9) {
            char v125 = v124;
          }
          else {
            char v125 = 0;
          }
          if ((v125 & 1) == 0 && v124) {
            [v132 addIndex:v14];
          }
        }
        ++v14;
        uint64_t v17 = v152 + 1;
      }
      while ((id)(v152 + 1) != v142);
      id v142 = [(NSMutableArray *)obj countByEnumeratingWithState:&v197 objects:v209 count:16];
    }
    while (v142);
  }
  if (![v132 count])
  {

    return 0;
  }
  if ((unint64_t)[v132 count] >= 2)
  {
    id v126 = [v132 firstIndex];
    if (v126 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v127 = v126;
      do
      {
        if ((unint64_t)[v132 count] <= 1)
        {
          id v127 = [v132 indexGreaterThanIndex:v127];
        }
        else
        {
          unsigned int v128 = [(NSMutableIndexSet *)v141->_ignoreIndices containsIndex:v127];
          id v127 = [v132 indexGreaterThanIndex:v127];
          if (v128) {
            objc_msgSend(v132, "removeIndex:", objc_msgSend(v132, "indexLessThanIndex:", v127));
          }
        }
      }
      while (v127 != (id)0x7FFFFFFFFFFFFFFFLL);
    }
  }
  if (!a12
    || (id v129 = [(MPWeighter *)v141 getRandomIndexInSubset:v132 withPreviousTags:a12], v129 == (id)0x7FFFFFFFFFFFFFFFLL))
  {
    id v130 = [(MPWeighter *)v141 getRandomIndexInSubset:v132];

    if (v130 != (id)0x7FFFFFFFFFFFFFFFLL) {
      return [(NSMutableArray *)v141->_items objectAtIndex:v130];
    }
    return 0;
  }
  id v130 = v129;

  return [(NSMutableArray *)v141->_items objectAtIndex:v130];
}

- (int64_t)getRandomIndexInSubset:(id)a3
{
  int64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
  if (!self->_totalWeight) {
    return v3;
  }
  id v6 = [a3 firstIndex];
  if (v6 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = v6;
    uint64_t v8 = 0;
    do
    {
      if (([(NSMutableIndexSet *)self->_ignoreIndices containsIndex:v7] & 1) == 0) {
        v8 += (uint64_t)objc_msgSend(-[NSMutableArray objectAtIndex:](self->_weights, "objectAtIndex:", v7), "integerValue");
      }
      id v7 = [a3 indexGreaterThanIndex:v7];
    }
    while (v7 != (id)0x7FFFFFFFFFFFFFFFLL);
    if (v8)
    {
      uint64_t v9 = random();
      id v10 = [a3 firstIndex];
      int64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
      if (v10 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v11 = v9 % v8;
        int64_t v3 = (int64_t)v10;
        while (1)
        {
          uint64_t v12 = (uint64_t)objc_msgSend(-[NSMutableArray objectAtIndex:](self->_weights, "objectAtIndex:", v3), "integerValue");
          BOOL v13 = v11 < v12;
          v11 -= v12;
          if (v13 && ![(NSMutableIndexSet *)self->_ignoreIndices containsIndex:v3]) {
            break;
          }
          int64_t v3 = (int64_t)[a3 indexGreaterThanIndex:v3];
          if (v3 == 0x7FFFFFFFFFFFFFFFLL) {
            return 0x7FFFFFFFFFFFFFFFLL;
          }
        }
      }
      return v3;
    }
  }
  unint64_t v15 = random();
  unint64_t v16 = v15 % (unint64_t)[a3 count];
  return (int64_t)[a3 indexAtIndex:v16];
}

- (int64_t)getRandomIndexInSubset:(id)a3 withPreviousTags:(id)a4
{
  int64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  if (self->_totalWeight)
  {
    id v6 = a3;
    id v7 = self;
    id v8 = [a3 firstIndex];
    id v9 = [v6 mutableCopy];
    id v10 = v9;
    if (v8 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v25 = v6;
      uint64_t v26 = v7;
      id v24 = v9;
      do
      {
        if ([(NSMutableIndexSet *)v7->_ignoreIndices containsIndex:v8]) {
          goto LABEL_5;
        }
        if (![(MPWeighter *)v7 itemAtIndex:v8 meetsContraints:+[NSDictionary dictionaryWithObjectsAndKeys:a4, @"tags", 0] oneMatch:0])
        {
          id v11 = [a4 mutableCopy];
          long long v31 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          id v12 = [a4 countByEnumeratingWithState:&v31 objects:v36 count:16];
          if (v12)
          {
            id v13 = v12;
            uint64_t v14 = *(void *)v32;
            do
            {
              for (uint64_t i = 0; i != v13; uint64_t i = (char *)i + 1)
              {
                if (*(void *)v32 != v14) {
                  objc_enumerationMutation(a4);
                }
                unint64_t v16 = *(void **)(*((void *)&v31 + 1) + 8 * i);
                if (([v16 hasPrefix:@"X"] & 1) == 0) {
                  [v11 removeObject:v16];
                }
              }
              id v13 = [a4 countByEnumeratingWithState:&v31 objects:v36 count:16];
            }
            while (v13);
          }
          id v17 = [a4 mutableCopy];
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          id v18 = [a4 countByEnumeratingWithState:&v27 objects:v35 count:16];
          if (v18)
          {
            id v19 = v18;
            uint64_t v20 = *(void *)v28;
            do
            {
              for (j = 0; j != v19; j = (char *)j + 1)
              {
                if (*(void *)v28 != v20) {
                  objc_enumerationMutation(a4);
                }
                uint64_t v22 = *(void **)(*((void *)&v27 + 1) + 8 * (void)j);
                if (([v22 hasPrefix:@"Y"] & 1) == 0) {
                  [v17 removeObject:v22];
                }
              }
              id v19 = [a4 countByEnumeratingWithState:&v27 objects:v35 count:16];
            }
            while (v19);
          }
          id v6 = v25;
          id v7 = v26;
          id v10 = v24;
          if ((![v11 count]
             || !-[MPWeighter itemAtIndex:meetsContraints:oneMatch:](v26, "itemAtIndex:meetsContraints:oneMatch:", v8, +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v11, @"tags", 0), 0))&& (![v17 count]|| !-[MPWeighter itemAtIndex:meetsContraints:oneMatch:](v26, "itemAtIndex:meetsContraints:oneMatch:", v8, +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v17,
                     @"tags",
                     0),
                   0))
            && (![v11 count]
             || !-[MPWeighter itemAtIndex:meetsContraints:oneMatch:](v26, "itemAtIndex:meetsContraints:oneMatch:", v8, +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v11, @"tags", 0), 1))&& (![v17 count]|| !-[MPWeighter itemAtIndex:meetsContraints:oneMatch:](v26, "itemAtIndex:meetsContraints:oneMatch:", v8, +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v17,
                     @"tags",
                     0),
                   1)))
          {
LABEL_5:
            [v10 removeIndex:v8];
          }
        }
        id v8 = [v6 indexGreaterThanIndex:v8];
      }
      while (v8 != (id)0x7FFFFFFFFFFFFFFFLL);
    }
    if ([v10 count]) {
      return [(MPWeighter *)v7 getRandomIndexInSubset:v10];
    }
    else {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v4;
}

- (int64_t)getRandomIndex
{
  int64_t totalWeight = self->_totalWeight;
  int64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
  if (totalWeight)
  {
    id v5 = [(NSMutableIndexSet *)self->_ignoreIndices firstIndex];
    if (v5 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      for (id i = v5;
            i != (id)0x7FFFFFFFFFFFFFFFLL;
            id i = [(NSMutableIndexSet *)self->_ignoreIndices indexGreaterThanIndex:i])
      {
        totalWeight -= (uint64_t)objc_msgSend(-[NSMutableArray objectAtIndex:](self->_weights, "objectAtIndex:", i), "integerValue");
      }
    }
    id v7 = objc_alloc_init((Class)NSMutableIndexSet);
    uint64_t v8 = random();
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    weights = self->_weights;
    id v10 = [(NSMutableArray *)weights countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = 0;
      uint64_t v13 = v8 % totalWeight;
      uint64_t v14 = *(void *)v22;
      while (2)
      {
        for (j = 0; j != v11; j = (char *)j + 1)
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(weights);
          }
          uint64_t v16 = (uint64_t)[*(id *)(*((void *)&v21 + 1) + 8 * (void)j) integerValue];
          BOOL v17 = v13 < v16;
          v13 -= v16;
          if (v17
            && ([(NSMutableIndexSet *)self->_ignoreIndices containsIndex:(char *)j + v12] & 1) == 0)
          {
            if (!self->_evenlyPickByID
              || (v18 = +[MPUtilities idOfCombinedID:](MPUtilities, "idOfCombinedID:", -[NSMutableArray objectAtIndex:](self->_items, "objectAtIndex:", (char *)j + v12)), id v19 = -[NSMutableIndexSet firstIndex](self->_ignoreIndices, "firstIndex"), v19 == (id)0x7FFFFFFFFFFFFFFFLL)|| !objc_msgSend(-[NSMutableArray objectAtIndex:](self->_items, "objectAtIndex:", v19), "hasPrefix:", v18))
            {
              int64_t v3 = (int64_t)j + v12;
              goto LABEL_23;
            }
            [v7 addIndex:(char *)j + v12];
          }
        }
        id v11 = [(NSMutableArray *)weights countByEnumeratingWithState:&v21 objects:v25 count:16];
        v12 += (uint64_t)j;
        if (v11) {
          continue;
        }
        break;
      }
    }
    if ([v7 count]) {
      int64_t v3 = (int64_t)objc_msgSend(v7, "indexAtIndex:", random() % (unint64_t)objc_msgSend(v7, "count"));
    }
    else {
      int64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
    }
LABEL_23:
  }
  return v3;
}

- (BOOL)itemAtIndex:(int64_t)a3 meetsContraints:(id)a4
{
  return [(MPWeighter *)self itemAtIndex:a3 meetsContraints:a4 oneMatch:1];
}

- (BOOL)itemAtIndex:(int64_t)a3 meetsContraints:(id)a4 oneMatch:(BOOL)a5
{
  BOOL v5 = a5;
  id v24 = [(NSMutableArray *)self->_constraints objectAtIndex:a3];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v7 = [a4 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v23 = *(void *)v30;
    while (2)
    {
      for (id i = 0; i != v8; id i = (char *)i + 1)
      {
        if (*(void *)v30 != v23) {
          objc_enumerationMutation(a4);
        }
        uint64_t v10 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        id v11 = objc_msgSend(v24, "valueForKey:", v10, v23);
        id v12 = [a4 objectForKey:v10];
        uint64_t v13 = (objc_class *)objc_opt_class();
        uint64_t v14 = NSStringFromClass(v13);
        if (NSStringHasSuffix(v14, "Number"))
        {
          if ([v11 compare:v12] == (char *)&dword_0 + 1) {
            goto LABEL_35;
          }
        }
        else if (NSStringHasSuffix(v14, "Boolean"))
        {
          unsigned int v15 = [v12 BOOLValue];
          if (v15 != [v11 BOOLValue]) {
            goto LABEL_35;
          }
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (v5)
            {
              id v16 = [v12 count];
              if (v16 != [v11 count]) {
                goto LABEL_35;
              }
            }
            long long v27 = 0u;
            long long v28 = 0u;
            long long v25 = 0u;
            long long v26 = 0u;
            id v17 = [v12 countByEnumeratingWithState:&v25 objects:v33 count:16];
            if (!v17) {
              return (char)v17;
            }
            id v18 = v17;
            char v19 = 0;
            uint64_t v20 = *(void *)v26;
            do
            {
              for (j = 0; j != v18; j = (char *)j + 1)
              {
                if (*(void *)v26 != v20) {
                  objc_enumerationMutation(v12);
                }
                LODWORD(v17) = [v11 containsObject:*(void *)(*((void *)&v25 + 1) + 8 * (void)j)];
                if (v5)
                {
                  if (v17) {
                    goto LABEL_31;
                  }
                }
                else
                {
                  if (!v17) {
                    return (char)v17;
                  }
                  char v19 = 1;
                }
              }
              id v18 = [v12 countByEnumeratingWithState:&v25 objects:v33 count:16];
            }
            while (v18);
            if ((v19 & 1) == 0)
            {
LABEL_35:
              LOBYTE(v17) = 0;
              return (char)v17;
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0
              && ([v12 isEqualToString:v11] & 1) == 0)
            {
              goto LABEL_35;
            }
          }
        }
LABEL_31:
        ;
      }
      id v8 = [a4 countByEnumeratingWithState:&v29 objects:v34 count:16];
      LOBYTE(v17) = 1;
      if (v8) {
        continue;
      }
      break;
    }
  }
  else
  {
    LOBYTE(v17) = 1;
  }
  return (char)v17;
}

- (void)increaseUsageCountOfObjectAtIndex:(int64_t)a3
{
  BOOL v5 = (char *)objc_msgSend(-[NSMutableArray objectAtIndex:](self->_usageCount, "objectAtIndex:"), "integerValue");
  usageCount = self->_usageCount;
  id v7 = +[NSNumber numberWithInteger:v5 + 1];
  [(NSMutableArray *)usageCount replaceObjectAtIndex:a3 withObject:v7];
}

- (id)indicesMeetingConstraints:(id)a3
{
  uint64_t v5 = [(MPWeighter *)self count];
  id v6 = +[NSMutableIndexSet indexSet];
  if (v5 >= 1)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if ([(MPWeighter *)self itemAtIndex:i meetsContraints:a3]) {
        [v6 addIndex:i];
      }
    }
  }
  return v6;
}

- (id)indicesEqualingConstraints:(id)a3
{
  id v4 = +[NSMutableIndexSet indexSet];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v16 = [a3 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v16)
  {
    uint64_t v14 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v16; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(a3);
        }
        uint64_t v6 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        constraints = self->_constraints;
        id v8 = [(NSMutableArray *)constraints countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v8)
        {
          id v9 = v8;
          uint64_t v10 = 0;
          uint64_t v11 = *(void *)v18;
          do
          {
            for (j = 0; j != v9; j = (char *)j + 1)
            {
              if (*(void *)v18 != v11) {
                objc_enumerationMutation(constraints);
              }
              if (!objc_msgSend(objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * (void)j), "valueForKey:", v6), "compare:", objc_msgSend(a3, "objectForKey:", v6)))objc_msgSend(v4, "addIndex:", (char *)j + v10); {
            }
              }
            id v9 = [(NSMutableArray *)constraints countByEnumeratingWithState:&v17 objects:v25 count:16];
            v10 += (uint64_t)j;
          }
          while (v9);
        }
      }
      id v16 = [a3 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v16);
  }
  return v4;
}

- (void)setEvenlyPickByID:(BOOL)a3
{
  self->_evenlyPickByID = a3;
}

- (int64_t)numberOfItemsWithImageCount:(int64_t)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  constraints = self->_constraints;
  id v5 = [(NSMutableArray *)constraints countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  id v6 = v5;
  int64_t v7 = 0;
  uint64_t v8 = *(void *)v12;
  do
  {
    for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
    {
      if (*(void *)v12 != v8) {
        objc_enumerationMutation(constraints);
      }
      if (*(void *)(*(void *)(*((void *)&v11 + 1) + 8 * i) + 8) == a3) {
        ++v7;
      }
    }
    id v6 = [(NSMutableArray *)constraints countByEnumeratingWithState:&v11 objects:v15 count:16];
  }
  while (v6);
  return v7;
}

- (id)imageCounts
{
  id v3 = +[NSMutableIndexSet indexSet];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  constraints = self->_constraints;
  id v5 = [(NSMutableArray *)constraints countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(constraints);
        }
        [v3 addIndex:*(void *)(*(void *)(*((void *)&v10 + 1) + 8 * (void)v8) + 8)];
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSMutableArray *)constraints countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  return v3;
}

- (void)setIgnorePanoramas:(BOOL)a3
{
  self->_ignorePanoramas = a3;
}

- (id)ignoredIndices
{
  return self->_ignoreIndices;
}

- (void)ignoreIndex:(int64_t)a3
{
  [(NSMutableIndexSet *)self->_ignoreIndices removeAllIndexes];
  ignoreIndices = self->_ignoreIndices;
  [(NSMutableIndexSet *)ignoreIndices addIndex:a3];
}

- (void)ignoreIndices:(id)a3
{
  [(NSMutableIndexSet *)self->_ignoreIndices removeAllIndexes];
  ignoreIndices = self->_ignoreIndices;
  [(NSMutableIndexSet *)ignoreIndices addIndexes:a3];
}

- (void)clearIgnoreIndices
{
}

- (void)addIndexToIgnore:(int64_t)a3
{
}

- (id)allItems
{
  return self->_items;
}

- (id)allConstraints
{
  return self->_constraints;
}

- (id)allUsageCounts
{
  return self->_usageCount;
}

- (id)constraintsForItem:(id)a3
{
  if (-[NSMutableArray indexOfObject:](self->_items, "indexOfObject:") == (id)0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  constraints = self->_constraints;
  id v7 = [(NSMutableArray *)self->_items indexOfObject:a3];
  return [(NSMutableArray *)constraints objectAtIndex:v7];
}

- (int64_t)count
{
  return (int64_t)[(NSMutableArray *)self->_items count];
}

- (void)clearAllItems
{
  self->_int64_t totalWeight = 0;
  self->_evenlyPickByID = 0;
}

@end