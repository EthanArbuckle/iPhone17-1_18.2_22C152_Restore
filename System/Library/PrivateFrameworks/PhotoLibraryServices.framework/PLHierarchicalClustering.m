@interface PLHierarchicalClustering
- (BOOL)reportsProgressInDistancesMatrixCalculation;
- (BOOL)usesSortedDataRelativeDistanceCache;
- (PLHierarchicalClustering)init;
- (double)_createRelativeDistanceCacheForDataset:(id)a3;
- (double)threshold;
- (id)performWithDataset:(id)a3 progressBlock:(id)a4;
- (unint64_t)_clustroidIndexForClusters:(unint64_t *)a3 numberOfObjects:(unint64_t)a4 distances:(double *)a5 relativeDistanceCache:(double *)a6;
- (unint64_t)k;
- (unint64_t)linkage;
- (void)setK:(unint64_t)a3;
- (void)setLinkage:(unint64_t)a3;
- (void)setReportsProgressInDistancesMatrixCalculation:(BOOL)a3;
- (void)setThreshold:(double)a3;
- (void)setUsesSortedDataRelativeDistanceCache:(BOOL)a3;
@end

@implementation PLHierarchicalClustering

- (void)setReportsProgressInDistancesMatrixCalculation:(BOOL)a3
{
  self->_reportsProgressInDistancesMatrixCalculation = a3;
}

- (BOOL)reportsProgressInDistancesMatrixCalculation
{
  return self->_reportsProgressInDistancesMatrixCalculation;
}

- (void)setUsesSortedDataRelativeDistanceCache:(BOOL)a3
{
  self->_usesSortedDataRelativeDistanceCache = a3;
}

- (BOOL)usesSortedDataRelativeDistanceCache
{
  return self->_usesSortedDataRelativeDistanceCache;
}

- (void)setLinkage:(unint64_t)a3
{
  self->_linkage = a3;
}

- (unint64_t)linkage
{
  return self->_linkage;
}

- (void)setK:(unint64_t)a3
{
  self->_k = a3;
}

- (unint64_t)k
{
  return self->_k;
}

- (void)setThreshold:(double)a3
{
  self->_threshold = a3;
}

- (double)threshold
{
  return self->_threshold;
}

- (id)performWithDataset:(id)a3 progressBlock:(id)a4
{
  id v6 = a3;
  id v186 = a4;
  uint64_t v202 = 0;
  v203 = &v202;
  uint64_t v204 = 0x2020000000;
  char v205 = 0;
  v7 = (void *)MEMORY[0x1E4F28F90];
  v198 = v6;
  uint64_t v8 = [v6 count];
  if (v8 - self->_k + 2 <= 1) {
    unint64_t v9 = 1;
  }
  else {
    unint64_t v9 = v8 - self->_k + 2;
  }
  v187 = [v7 progressWithTotalUnitCount:v9];
  uint64_t v10 = [v187 totalUnitCount];
  v185 = [(PLDataClustering *)self distanceBlock];
  if (v186 && self->_reportsProgressInDistancesMatrixCalculation)
  {
    v11 = v200;
    v200[0] = MEMORY[0x1E4F143A8];
    v200[1] = 3221225472;
    v200[2] = __61__PLHierarchicalClustering_performWithDataset_progressBlock___block_invoke;
    v200[3] = &unk_1E58711F0;
    v179 = (id *)v201;
    id v12 = v186;
    *(double *)&v201[2] = 1.0 / (double)v10;
    v201[0] = v12;
    v201[1] = &v202;
    int v181 = 1;
  }
  else
  {
    int v181 = 0;
    v11 = 0;
  }
  uint64_t v13 = MEMORY[0x19F38D650](v11);
  v184 = self;
  BOOL usesSortedDataRelativeDistanceCache = self->_usesSortedDataRelativeDistanceCache;
  v180 = (void *)v13;
  if (!self->_usesSortedDataRelativeDistanceCache)
  {
    v15 = [(PLDataClustering *)self createDistancesMatrixForDataset:v198 progressBlock:v13];
    if (!*((unsigned char *)v203 + 24))
    {
      v14 = 0;
      goto LABEL_15;
    }
    [(PLDataClustering *)self freeDistancesMatrix:v15 forDataset:v198];
LABEL_13:
    v16 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_279;
  }
  if (*((unsigned char *)v203 + 24)) {
    goto LABEL_13;
  }
  v14 = [(PLHierarchicalClustering *)self _createRelativeDistanceCacheForDataset:v198];
  v15 = 0;
LABEL_15:
  v17 = (void **)malloc_type_calloc(8uLL, [v198 count], 0xC444E7BEuLL);
  unint64_t v18 = [v198 count];
  for (unint64_t i = 0; i < [v198 count]; ++i)
  {
    v20 = malloc_type_calloc(8uLL, 1uLL, 0x19BDE57uLL);
    v17[i] = v20;
    void *v20 = i;
  }
  v21 = malloc_type_calloc(8uLL, [v198 count], 0xBE8B73B8uLL);
  for (unint64_t j = 0; j < [v198 count]; ++j)
    v21[j] = 1;
  v189 = malloc_type_calloc(8uLL, [v198 count], 0xF7CA9C21uLL);
  for (unint64_t k = 0; k < [v198 count]; ++k)
    v189[k] = k;
  v24 = (unsigned __int8 *)malloc_type_calloc(1uLL, [v198 count], 0x990CF440uLL);
  v183 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v198];
  objc_msgSend(v187, "setCompletedUnitCount:", objc_msgSend(v187, "completedUnitCount") + 1);
  if (v186)
  {
    [v187 fractionCompleted];
    (*((void (**)(id, uint64_t *))v186 + 2))(v186, v203 + 3);
  }
  if (*((unsigned char *)v203 + 24))
  {
    if (v18)
    {
      v25 = v17;
      do
      {
        if (*v25) {
          free(*v25);
        }
        ++v25;
        --v18;
      }
      while (v18);
    }
    else if (!v17)
    {
      goto LABEL_244;
    }
    free(v17);
LABEL_244:
    if (v21) {
      free(v21);
    }
    if (v189) {
      free(v189);
    }
    if (v24) {
      free(v24);
    }
    if (!usesSortedDataRelativeDistanceCache) {
      goto LABEL_274;
    }
    goto LABEL_275;
  }
  unint64_t v182 = v18 - 1;
  v191 = v24;
  while (2)
  {
    v26 = v184;
    unint64_t v199 = v18;
    BOOL v27 = v18 > v184->_k;
    v195 = v21;
    v196 = v17;
    v28 = v24;
    if (!v27) {
      goto LABEL_286;
    }
    unint64_t linkage = v184->_linkage;
    switch(linkage)
    {
      case 0uLL:
        unint64_t v30 = v184->_linkage;
        unint64_t v31 = v30;
        double v32 = 3.40282347e38;
        while (1)
        {
          v33 = v17[linkage];
          if (!v33) {
            __assert_rtn("-[PLHierarchicalClustering performWithDataset:progressBlock:]", "PLHierarchicalClustering.m", 255, "clustersIndices[i] != NULL");
          }
          unint64_t v34 = linkage++;
          if (linkage < v199) {
            break;
          }
LABEL_67:
          if (linkage == v199) {
            goto LABEL_154;
          }
        }
        unint64_t v35 = linkage;
        while (!v17[v35])
        {
LABEL_66:
          if (++v35 == v199) {
            goto LABEL_67;
          }
        }
        uint64_t v36 = v21[v34];
        if (usesSortedDataRelativeDistanceCache)
        {
          if (v36)
          {
            uint64_t v37 = 0;
            double v38 = 0.0;
            do
            {
              if (v21[v35])
              {
                v39 = (uint64_t *)v17[v35];
                uint64_t v40 = v21[v35];
                do
                {
                  uint64_t v41 = *v39++;
                  double v42 = v14[v33[v37]] - v14[v41];
                  if (v42 < 0.0) {
                    double v42 = -v42;
                  }
                  if (v42 > v38) {
                    double v38 = v42;
                  }
                  --v40;
                }
                while (v40);
              }
              ++v37;
            }
            while (v37 != v36);
            goto LABEL_64;
          }
        }
        else if (v36)
        {
          uint64_t v43 = 0;
          double v38 = 0.0;
          do
          {
            if (v21[v35])
            {
              v44 = (uint64_t *)v17[v35];
              uint64_t v45 = v21[v35];
              do
              {
                uint64_t v46 = *v44++;
                double v47 = v15[v33[v43]][v46];
                if (v47 > v38) {
                  double v38 = v47;
                }
                --v45;
              }
              while (v45);
            }
            ++v43;
          }
          while (v43 != v36);
          goto LABEL_64;
        }
        double v38 = 0.0;
LABEL_64:
        if (v38 < v32)
        {
          double v32 = v38;
          unint64_t v31 = v34;
          unint64_t v30 = v35;
        }
        goto LABEL_66;
      case 1uLL:
        unint64_t v80 = 0;
        unint64_t v30 = 0;
        unint64_t v31 = 0;
        double v32 = 3.40282347e38;
        while (1)
        {
          v81 = v17[v80];
          if (!v81) {
            __assert_rtn("-[PLHierarchicalClustering performWithDataset:progressBlock:]", "PLHierarchicalClustering.m", 317, "clustersIndices[i] != NULL");
          }
          unint64_t v82 = v80++;
          if (v80 < v199) {
            break;
          }
LABEL_153:
          if (v80 == v199) {
            goto LABEL_154;
          }
        }
        unint64_t v83 = v80;
        while (!v17[v83])
        {
LABEL_152:
          if (++v83 == v199) {
            goto LABEL_153;
          }
        }
        uint64_t v84 = v21[v82];
        if (usesSortedDataRelativeDistanceCache)
        {
          if (v84)
          {
            uint64_t v85 = 0;
            double v86 = 0.0;
            do
            {
              if (v21[v83])
              {
                v87 = (uint64_t *)v17[v83];
                uint64_t v88 = v21[v83];
                do
                {
                  uint64_t v89 = *v87++;
                  double v90 = v14[v81[v85]] - v14[v89];
                  if (v90 < 0.0) {
                    double v90 = -v90;
                  }
                  double v86 = v86 + v90;
                  --v88;
                }
                while (v88);
              }
              ++v85;
            }
            while (v85 != v84);
            goto LABEL_150;
          }
        }
        else if (v84)
        {
          uint64_t v91 = 0;
          double v86 = 0.0;
          do
          {
            if (v21[v83])
            {
              v92 = (uint64_t *)v17[v83];
              uint64_t v93 = v21[v83];
              do
              {
                uint64_t v94 = *v92++;
                double v86 = v86 + v15[v81[v91]][v94];
                --v93;
              }
              while (v93);
            }
            ++v91;
          }
          while (v91 != v84);
          goto LABEL_150;
        }
        double v86 = 0.0;
LABEL_150:
        double v95 = v86 / (double)(unint64_t)(v21[v83] * v84);
        if (v95 < v32)
        {
          double v32 = v95;
          unint64_t v31 = v82;
          unint64_t v30 = v83;
        }
        goto LABEL_152;
      case 2uLL:
        unint64_t v54 = 0;
        unint64_t v30 = 0;
        unint64_t v31 = 0;
        double v32 = 3.40282347e38;
        break;
      case 3uLL:
        if (usesSortedDataRelativeDistanceCache)
        {
          unint64_t v70 = 0;
          unint64_t v71 = 0;
          unint64_t v72 = 0;
          double v73 = 3.40282347e38;
          v74 = v189;
          unint64_t v75 = v199;
          unint64_t v76 = v199;
          do
          {
            unint64_t v77 = v70 + 1;
            if (v70 + 1 < v75)
            {
              uint64_t v78 = 1;
              do
              {
                double v79 = v14[v189[v70]] - v14[v74[v78]];
                if (v79 < 0.0) {
                  double v79 = -v79;
                }
                if (v79 < v73)
                {
                  double v73 = v79;
                  unint64_t v72 = v70;
                  unint64_t v71 = v70 + v78;
                }
                ++v78;
              }
              while (v76 != v78);
            }
            --v76;
            ++v74;
            ++v70;
            unint64_t v75 = v199;
          }
          while (v77 != v199);
        }
        else
        {
          unint64_t v111 = 0;
          unint64_t v71 = 0;
          unint64_t v72 = 0;
          double v73 = 3.40282347e38;
          v112 = v189;
          unint64_t v113 = v199;
          unint64_t v114 = v199;
          do
          {
            unint64_t v115 = v111 + 1;
            if (v111 + 1 < v113)
            {
              uint64_t v117 = 1;
              do
              {
                v116 = v15[v189[v111]];
                if (v116[v112[v117]] < v73)
                {
                  double v73 = v116[v112[v117]];
                  unint64_t v72 = v111;
                  unint64_t v71 = v111 + v117;
                }
                ++v117;
              }
              while (v114 != v117);
            }
            --v114;
            ++v112;
            ++v111;
            unint64_t v113 = v199;
          }
          while (v115 != v199);
        }
        v118 = v17[v72];
        if (v118 && (v119 = v17[v71]) != 0)
        {
          unint64_t v120 = v71;
          unint64_t v121 = v72;
          uint64_t v122 = v195[v72];
          unint64_t v123 = v120;
          uint64_t v124 = v195[v120];
          if (v124 + v122)
          {
            v125 = (char *)malloc_type_calloc(8uLL, v124 + v122, 0xD933F80FuLL);
            memcpy(v125, v118, 8 * v122);
            memcpy(&v125[8 * v122], v119, 8 * v124);
          }
          else
          {
            v125 = 0;
          }
          v17 = v196;
          unint64_t v71 = v123;
          unint64_t v72 = v121;
        }
        else
        {
          v125 = 0;
        }
        v21 = v195;
        uint64_t v126 = -[PLHierarchicalClustering _clustroidIndexForClusters:numberOfObjects:distances:relativeDistanceCache:](v184, "_clustroidIndexForClusters:numberOfObjects:distances:relativeDistanceCache:", v125, v195[v71] + v195[v72], v15, v14, v73);
        if (v126 == 0x7FFFFFFF)
        {
          v26 = v184;
          if (v125) {
            free(v125);
          }
          goto LABEL_286;
        }
        v189[v72] = v126;
        if (v199 < 2)
        {
          v128 = 0;
          v131 = v189;
LABEL_195:
          free(v131);
          goto LABEL_196;
        }
        v127 = malloc_type_calloc(8uLL, v199 - 1, 0x80B826BFuLL);
        v128 = v127;
        uint64_t v129 = 0;
        uint64_t v130 = 0;
        do
        {
          if (v71 != v129) {
            v127[v130++] = v189[v129];
          }
          ++v129;
        }
        while (v199 != v129);
        v131 = v189;
        if (v189) {
          goto LABEL_195;
        }
LABEL_196:
        if (v125) {
          free(v125);
        }
        v189 = v128;
LABEL_199:
        if (v72 == v71) {
LABEL_341:
        }
          __assert_rtn("-[PLHierarchicalClustering performWithDataset:progressBlock:]", "PLHierarchicalClustering.m", 474, "idx1 != idx2");
        v132 = v17[v72];
        if (v132)
        {
          v133 = v17[v71];
          if (v133)
          {
            unint64_t v134 = v71;
            unint64_t v135 = v72;
            uint64_t v136 = v195[v72];
            unint64_t v137 = v134;
            uint64_t v138 = v195[v134];
            if (v138 + v136)
            {
              v139 = (char *)malloc_type_calloc(8uLL, v138 + v136, 0xD933F80FuLL);
              memcpy(v139, v132, 8 * v136);
              memcpy(&v139[8 * v136], v133, 8 * v138);
              v21 = v195;
              v17 = v196;
              v132 = v196[v135];
              unint64_t v71 = v137;
              unint64_t v72 = v135;
              if (!v132) {
                goto LABEL_209;
              }
            }
            else
            {
              v139 = 0;
              v21 = v195;
              v17 = v196;
              unint64_t v71 = v134;
              unint64_t v72 = v135;
            }
          }
          else
          {
            v139 = 0;
            v21 = v195;
          }
          free(v132);
        }
        else
        {
          v139 = 0;
        }
LABEL_209:
        v17[v72] = v139;
        v21[v72] += v21[v71];
        if (v184->_linkage != 4)
        {
          v145 = v17[v71];
          if (v145) {
            free(v145);
          }
          v24 = v28;
          if (v199 < 2)
          {
            v147 = 0;
          }
          else
          {
            v146 = (void **)malloc_type_calloc(8uLL, v199 - 1, 0x47D17044uLL);
            v147 = v146;
            uint64_t v148 = 0;
            uint64_t v149 = 0;
            v21 = v195;
            v17 = v196;
            do
            {
              if (v71 != v148) {
                v146[v149++] = v196[v148];
              }
              ++v148;
            }
            while (v199 != v148);
            if (!v196)
            {
LABEL_228:
              if (v199 < 2)
              {
                v151 = 0;
                if (v21) {
                  goto LABEL_234;
                }
              }
              else
              {
                v150 = malloc_type_calloc(8uLL, v199 - 1, 0x80B826BFuLL);
                v151 = v150;
                uint64_t v152 = 0;
                uint64_t v153 = 0;
                v21 = v195;
                do
                {
                  if (v71 != v152) {
                    v150[v153++] = v195[v152];
                  }
                  ++v152;
                }
                while (v199 != v152);
                if (v195) {
LABEL_234:
                }
                  free(v21);
              }
              v195 = v151;
              v196 = v147;
              goto LABEL_236;
            }
          }
          free(v17);
          goto LABEL_228;
        }
        v28[v71] = 1;
        v140 = [(PLDataClustering *)v184 clusterConsolidationBlock];
        v141 = ((void (**)(void, void **, unint64_t, void, void *))v140)[2](v140, v17, v72, v21[v72], v198);
        [v183 setObject:v141 atIndexedSubscript:v72];
        for (unint64_t m = 0; m < [v198 count]; ++m)
        {
          if (v72 != m && !(v28[m] | usesSortedDataRelativeDistanceCache))
          {
            v143 = [v183 objectAtIndexedSubscript:m];
            double v144 = ((double (**)(void, void *, void *))v185)[2](v185, v141, v143);
            v15[v72][m] = v144;
            v15[m][v72] = v144;
          }
        }
        v24 = v28;

LABEL_236:
        objc_msgSend(v187, "setCompletedUnitCount:", objc_msgSend(v187, "completedUnitCount") + 1);
        if (v186)
        {
          [v187 fractionCompleted];
          (*((void (**)(id, uint64_t *))v186 + 2))(v186, v203 + 3);
        }
        unint64_t v18 = v199 - 1;
        --v182;
        v21 = v195;
        v17 = v196;
        if (*((unsigned char *)v203 + 24))
        {
          if (v184->_linkage == 4)
          {
            uint64_t v154 = [v198 count];
            if (v154)
            {
              v155 = v196;
              do
              {
                if (*v155) {
                  free(*v155);
                }
                ++v155;
                --v154;
              }
              while (v154);
              goto LABEL_266;
            }
LABEL_265:
            if (v196) {
              goto LABEL_266;
            }
          }
          else
          {
            if (v199 == 1) {
              goto LABEL_265;
            }
            uint64_t v156 = 0;
            do
            {
              v157 = v196[v156];
              if (v157) {
                free(v157);
              }
              ++v156;
            }
            while (v18 != v156);
LABEL_266:
            free(v196);
          }
          if (v195) {
            free(v195);
          }
          if (v189) {
            free(v189);
          }
          if (v24) {
            free(v24);
          }
          if (!usesSortedDataRelativeDistanceCache) {
LABEL_274:
          }
            [(PLDataClustering *)v184 freeDistancesMatrix:v15 forDataset:v198];
LABEL_275:
          v16 = (void *)MEMORY[0x1E4F1CBF0];
          goto LABEL_276;
        }
        continue;
      case 4uLL:
        unint64_t v48 = 0;
        unint64_t v49 = 0;
        unint64_t v50 = 0;
        double v51 = 3.40282347e38;
        while (v50 < [v198 count])
        {
          if (!v17[v50]) {
            __assert_rtn("-[PLHierarchicalClustering performWithDataset:progressBlock:]", "PLHierarchicalClustering.m", 222, "clustersIndices[i] != NULL");
          }
          for (unint64_t n = v50 + 1; n < [v198 count]; ++n)
          {
            if (v17[n] && !v28[v50] && !v28[n])
            {
              double v53 = usesSortedDataRelativeDistanceCache ? 3.40282347e38 : v15[v50][n];
              if (v53 < v51)
              {
                double v51 = v53;
                unint64_t v48 = v50;
                unint64_t v49 = n;
              }
            }
          }
          ++v50;
        }
        v26 = v184;
        if (v51 > v184->_threshold) {
          goto LABEL_286;
        }
        unint64_t v71 = v49;
        unint64_t v72 = v48;
        goto LABEL_199;
      case 5uLL:
        v96 = [(PLDataClustering *)v184 clusterKeyElementBlock];
        unint64_t v97 = 0;
        unint64_t v98 = 0;
        unint64_t v99 = 0;
        v100 = v96 + 2;
        double v101 = 3.40282347e38;
        unint64_t v190 = v182;
        do
        {
          if (!v17[v97]) {
            __assert_rtn("-[PLHierarchicalClustering performWithDataset:progressBlock:]", "PLHierarchicalClustering.m", 190, "clustersIndices[i] != NULL");
          }
          unint64_t v102 = v97;
          unint64_t v103 = v97 + 1;
          unint64_t v188 = v97 + 1;
          if (v97 + 1 < v199)
          {
            unint64_t v104 = v190;
            unint64_t v192 = v97;
            do
            {
              if (v196[v103])
              {
                if (usesSortedDataRelativeDistanceCache)
                {
                  double v105 = 3.40282347e38;
                }
                else
                {
                  unint64_t v193 = v98;
                  unint64_t v194 = v99;
                  v106 = v100;
                  uint64_t v107 = ((uint64_t (**)(void, void **, unint64_t, void, void *))v96)[2](v96, v196, v102, v195[v102], v198);
                  v108 = v106;
                  double v105 = v15[v107][((uint64_t (**)(void, void **, unint64_t, void, void *))v96)[2](v96, v196, v103, v195[v103], v198)];
                  v28 = v191;
                  unint64_t v102 = v192;
                  unint64_t v98 = v193;
                  unint64_t v99 = v194;
                  v100 = v108;
                }
                if (v105 < v101)
                {
                  double v101 = v105;
                  unint64_t v99 = v102;
                  unint64_t v98 = v103;
                }
              }
              ++v103;
              --v104;
            }
            while (v104);
          }
          --v190;
          unint64_t v97 = v188;
          v17 = v196;
        }
        while (v188 != v199);
        unint64_t v72 = v99;
        unint64_t v109 = v98;
        v26 = v184;
        double threshold = v184->_threshold;

        v21 = v195;
        if (v101 > threshold) {
          goto LABEL_286;
        }
        unint64_t v71 = v109;
        goto LABEL_199;
      default:
        goto LABEL_341;
    }
    break;
  }
  do
  {
    v55 = v17[v54];
    if (!v55) {
      __assert_rtn("-[PLHierarchicalClustering performWithDataset:progressBlock:]", "PLHierarchicalClustering.m", 366, "clustersIndices[i] != NULL");
    }
    unint64_t v56 = v54++;
    if (v54 < v199)
    {
      unint64_t v57 = v54;
      while (!v17[v57])
      {
LABEL_113:
        if (++v57 == v199) {
          goto LABEL_114;
        }
      }
      uint64_t v58 = v21[v56];
      if (usesSortedDataRelativeDistanceCache)
      {
        if (v58)
        {
          uint64_t v59 = 0;
          double v60 = 3.40282347e38;
          do
          {
            if (v21[v57])
            {
              v61 = (uint64_t *)v17[v57];
              uint64_t v62 = v21[v57];
              do
              {
                uint64_t v63 = *v61++;
                double v64 = v14[v55[v59]] - v14[v63];
                if (v64 < 0.0) {
                  double v64 = -v64;
                }
                if (v64 < v60) {
                  double v60 = v64;
                }
                --v62;
              }
              while (v62);
            }
            ++v59;
          }
          while (v59 != v58);
          goto LABEL_111;
        }
      }
      else if (v58)
      {
        uint64_t v65 = 0;
        double v60 = 3.40282347e38;
        do
        {
          if (v21[v57])
          {
            v66 = (uint64_t *)v17[v57];
            uint64_t v67 = v21[v57];
            do
            {
              uint64_t v68 = *v66++;
              double v69 = v15[v55[v65]][v68];
              if (v69 < v60) {
                double v60 = v69;
              }
              --v67;
            }
            while (v67);
          }
          ++v65;
        }
        while (v65 != v58);
        goto LABEL_111;
      }
      double v60 = 3.40282347e38;
LABEL_111:
      if (v60 < v32)
      {
        double v32 = v60;
        unint64_t v31 = v56;
        unint64_t v30 = v57;
      }
      goto LABEL_113;
    }
LABEL_114:
    ;
  }
  while (v54 != v199);
LABEL_154:
  v26 = v184;
  if (v32 <= v184->_threshold)
  {
    unint64_t v71 = v30;
    unint64_t v72 = v31;
    goto LABEL_199;
  }
LABEL_286:
  v159 = v28;
  if (v26->_linkage == 4)
  {
    uint64_t v160 = [v198 count];
    v16 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v160];
    if (v160)
    {
      for (iunint64_t i = 0; ii != v160; ++ii)
      {
        if (!v191[ii])
        {
          v162 = v17[ii];
          if (!v162) {
            __assert_rtn("-[PLHierarchicalClustering performWithDataset:progressBlock:]", "PLHierarchicalClustering.m", 551, "clustersIndicesIndex != NULL");
          }
          v163 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v195[ii]];
          if (v195[ii])
          {
            unint64_t v164 = 0;
            do
            {
              v165 = [v198 objectAtIndexedSubscript:v162[v164]];
              [v163 addObject:v165];

              ++v164;
            }
            while (v164 < v195[ii]);
          }
          v166 = +[PLDataCluster clusterWithObjects:v163];
          [v16 addObject:v166];

          v17 = v196;
        }
      }
      goto LABEL_304;
    }
  }
  else
  {
    v16 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v199];
    if (v199)
    {
      for (junint64_t j = 0; jj != v199; ++jj)
      {
        v168 = v17[jj];
        if (!v168) {
          __assert_rtn("-[PLHierarchicalClustering performWithDataset:progressBlock:]", "PLHierarchicalClustering.m", 568, "clustersIndicesIndex != NULL");
        }
        v169 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v195[jj]];
        if (v195[jj])
        {
          unint64_t v170 = 0;
          do
          {
            v171 = [v198 objectAtIndexedSubscript:v168[v170]];
            [v169 addObject:v171];

            ++v170;
          }
          while (v170 < v195[jj]);
        }
        v172 = +[PLDataCluster clusterWithObjects:v169];
        [v16 addObject:v172];

        v17 = v196;
      }
LABEL_304:
      v21 = v195;
      v159 = v191;
    }
  }
  if (v184->_linkage == 3)
  {
    for (kunint64_t k = 0; kk < [v16 count]; ++kk)
    {
      v174 = [v16 objectAtIndexedSubscript:kk];
      v175 = [v198 objectAtIndexedSubscript:v189[kk]];
      [v174 setClustroid:v175];
    }
  }
  objc_msgSend(v187, "setCompletedUnitCount:", objc_msgSend(v187, "totalUnitCount"));
  if (v186)
  {
    [v187 fractionCompleted];
    (*((void (**)(id, uint64_t *))v186 + 2))(v186, v203 + 3);
  }
  if (v184->_linkage == 4)
  {
    uint64_t v176 = [v198 count];
    if (v176)
    {
      v177 = v17;
      do
      {
        if (*v177) {
          free(*v177);
        }
        ++v177;
        --v176;
      }
      while (v176);
      goto LABEL_325;
    }
LABEL_324:
    if (v17) {
      goto LABEL_325;
    }
  }
  else
  {
    if (!v199) {
      goto LABEL_324;
    }
    v178 = v17;
    do
    {
      if (*v178) {
        free(*v178);
      }
      ++v178;
      --v199;
    }
    while (v199);
LABEL_325:
    free(v17);
  }
  if (v21) {
    free(v21);
  }
  if (v189) {
    free(v189);
  }
  if (v159) {
    free(v159);
  }
  if (!usesSortedDataRelativeDistanceCache) {
    [(PLDataClustering *)v184 freeDistancesMatrix:v15 forDataset:v198];
  }
LABEL_276:
  if (v14) {
    free(v14);
  }

LABEL_279:
  if (v181) {

  }
  _Block_object_dispose(&v202, 8);
  return v16;
}

uint64_t __61__PLHierarchicalClustering_performWithDataset_progressBlock___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  uint64_t result = (*(uint64_t (**)(double))(*(void *)(a1 + 32) + 16))(*(double *)(a1 + 48) * a3);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *a2;
  return result;
}

- (double)_createRelativeDistanceCacheForDataset:(id)a3
{
  id v4 = a3;
  size_t v5 = [v4 count];
  id v6 = (double *)malloc_type_calloc(v5, 8uLL, 0x100004000313F17uLL);
  *id v6 = 0.0;
  if (v5 >= 2)
  {
    for (uint64_t i = 1; i != v5; ++i)
    {
      uint64_t v8 = [(PLDataClustering *)self distanceBlock];
      unint64_t v9 = [v4 objectAtIndexedSubscript:0];
      uint64_t v10 = [v4 objectAtIndexedSubscript:i];
      v6[i] = ((double (**)(void, void *, void *))v8)[2](v8, v9, v10);
    }
  }

  return v6;
}

- (unint64_t)_clustroidIndexForClusters:(unint64_t *)a3 numberOfObjects:(unint64_t)a4 distances:(double *)a5 relativeDistanceCache:(double *)a6
{
  if (!a3) {
    return 0x7FFFFFFFLL;
  }
  unint64_t v6 = 0;
  if (a4)
  {
    uint64_t v7 = 0;
    double v8 = 0.0;
    double v9 = 3.40282347e38;
    do
    {
      unint64_t v10 = a3[v7];
      if (self->_usesSortedDataRelativeDistanceCache)
      {
        double v11 = 0.0;
        id v12 = a3;
        unint64_t v13 = a4;
        do
        {
          uint64_t v14 = *v12++;
          double v15 = a6[v10] - a6[v14];
          if (v15 < 0.0) {
            double v15 = -v15;
          }
          if (v15 > v8) {
            double v8 = v15;
          }
          double v11 = v11 + v15;
          --v13;
        }
        while (v13);
      }
      else
      {
        double v11 = 0.0;
        v16 = a3;
        unint64_t v17 = a4;
        do
        {
          uint64_t v18 = *v16++;
          double v19 = a5[v10][v18];
          if (v19 > v8) {
            double v8 = v19;
          }
          double v11 = v11 + v19;
          --v17;
        }
        while (v17);
      }
      double v20 = v11 / (double)a4;
      if (v20 < v9)
      {
        double v9 = v20;
        unint64_t v6 = a3[v7];
      }
      ++v7;
    }
    while (v7 != a4);
  }
  else
  {
    double v8 = 0.0;
  }
  if (v8 <= self->_threshold) {
    return v6;
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

- (PLHierarchicalClustering)init
{
  v3.receiver = self;
  v3.super_class = (Class)PLHierarchicalClustering;
  uint64_t result = [(PLHierarchicalClustering *)&v3 init];
  if (result)
  {
    result->_double threshold = 0.5;
    result->_unint64_t k = 2;
    result->_unint64_t linkage = 0;
    result->_BOOL usesSortedDataRelativeDistanceCache = 0;
    result->_reportsProgressInDistancesMatrixCalculatiounint64_t n = 0;
  }
  return result;
}

@end