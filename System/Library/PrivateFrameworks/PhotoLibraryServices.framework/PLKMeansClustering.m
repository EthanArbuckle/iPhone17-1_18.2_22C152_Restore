@interface PLKMeansClustering
- (double)_dataArray:(id)a3 featureCount:(unsigned int)a4 useKeypaths:(BOOL)a5;
- (id)_performWithDataset:(id)a3 numericData:(id)a4 progressBlock:(id)a5;
- (id)performWithDataset:(id)a3 progressBlock:(id)a4;
- (unint64_t)k;
- (void)setK:(unint64_t)a3;
@end

@implementation PLKMeansClustering

- (void)setK:(unint64_t)a3
{
  self->_k = a3;
}

- (unint64_t)k
{
  return self->_k;
}

- (double)_dataArray:(id)a3 featureCount:(unsigned int)a4 useKeypaths:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = a4;
  v9 = (double *)malloc_type_calloc(8uLL, [v7 count] * a4, 0x52467F7CuLL);
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  obuint64_t j = v7;
  uint64_t v10 = [obj countByEnumeratingWithState:&v47 objects:v53 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0;
    uint64_t v38 = *(void *)v48;
    BOOL v33 = v5;
    uint64_t v36 = v8;
    do
    {
      uint64_t v13 = 0;
      uint64_t v14 = v8 * v12;
      uint64_t v32 = v11 + v12;
      uint64_t v37 = v11;
      do
      {
        if (*(void *)v48 != v38) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v47 + 1) + 8 * v13);
        if (v5)
        {
          long long v45 = 0uLL;
          long long v46 = 0uLL;
          long long v43 = 0uLL;
          long long v44 = 0uLL;
          id v16 = [(PLDataClustering *)self numericValueKeypaths];
          uint64_t v17 = [v16 countByEnumeratingWithState:&v43 objects:v52 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = 0;
            uint64_t v20 = *(void *)v44;
            do
            {
              for (uint64_t i = 0; i != v18; ++i)
              {
                if (*(void *)v44 != v20) {
                  objc_enumerationMutation(v16);
                }
                v22 = objc_msgSend(v15, "valueForKeyPath:", *(void *)(*((void *)&v43 + 1) + 8 * i), v32);
                [v22 doubleValue];
                v9[v14 + v19 + i] = v23;
              }
              v19 += i;
              uint64_t v18 = [v16 countByEnumeratingWithState:&v43 objects:v52 count:16];
            }
            while (v18);
            BOOL v5 = v33;
            uint64_t v8 = v36;
            uint64_t v11 = v37;
          }
        }
        else
        {
          long long v41 = 0uLL;
          long long v42 = 0uLL;
          long long v39 = 0uLL;
          long long v40 = 0uLL;
          id v16 = v15;
          uint64_t v24 = [v16 countByEnumeratingWithState:&v39 objects:v51 count:16];
          if (v24)
          {
            uint64_t v25 = v24;
            uint64_t v26 = v13;
            uint64_t v27 = 0;
            uint64_t v28 = *(void *)v40;
            do
            {
              for (uint64_t j = 0; j != v25; ++j)
              {
                if (*(void *)v40 != v28) {
                  objc_enumerationMutation(v16);
                }
                objc_msgSend(*(id *)(*((void *)&v39 + 1) + 8 * j), "doubleValue", v32);
                v9[v14 + v27 + j] = v30;
              }
              v27 += j;
              uint64_t v25 = [v16 countByEnumeratingWithState:&v39 objects:v51 count:16];
            }
            while (v25);
            uint64_t v13 = v26;
            uint64_t v8 = v36;
            uint64_t v11 = v37;
          }
        }

        ++v13;
        v14 += v8;
      }
      while (v13 != v11);
      uint64_t v11 = [obj countByEnumeratingWithState:&v47 objects:v53 count:16];
      uint64_t v12 = v32;
    }
    while (v11);
  }

  return v9;
}

- (id)_performWithDataset:(id)a3 numericData:(id)a4 progressBlock:(id)a5
{
  uint64_t v160 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = MEMORY[0x19F38D650]();
  uint64_t v12 = (void (**)(void, void, double))v11;
  if (v11)
  {
    LOBYTE(v152) = 0;
    (*(void (**)(uint64_t, long long *, double))(v11 + 16))(v11, &v152, 0.0);
    if ((_BYTE)v152)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v159) = 48;
        uint64_t v13 = MEMORY[0x1E4F14500];
LABEL_98:
        _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
        goto LABEL_99;
      }
      goto LABEL_99;
    }
  }
  if (v9) {
    [v9 firstObject];
  }
  else {
  uint64_t v14 = [(PLDataClustering *)self numericValueKeypaths];
  }
  uint64_t v15 = [v14 count];

  if (v15 && self->_k)
  {
    if (![v8 count])
    {
      if (!v12) {
        goto LABEL_99;
      }
      LOBYTE(v152) = 0;
      ((void (**)(void, long long *, double))v12)[2](v12, &v152, 1.0);
      if (!(_BYTE)v152 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
        goto LABEL_99;
      }
      *(_DWORD *)buf = 67109120;
      LODWORD(v159) = 60;
      uint64_t v13 = MEMORY[0x1E4F14500];
      goto LABEL_98;
    }
    id v135 = v10;
    v140 = v12;
    v136 = v8;
    if ([v8 count] > self->_k)
    {
      id v134 = v9;
      if (v9) {
        id v16 = v9;
      }
      else {
        id v16 = v8;
      }
      uint64_t v17 = [(PLKMeansClustering *)self _dataArray:v16 featureCount:v15 useKeypaths:v9 == 0];
      uint32_t v18 = [v8 count];
      uint64_t v19 = v18;
      v137 = (unsigned int *)malloc_type_calloc(4uLL, v18, 0xAC329060uLL);
      uint64_t v20 = malloc_type_calloc(4uLL, self->_k, 0x67231C3EuLL);
      v21 = (char *)malloc_type_calloc(8uLL, self->_k * v15, 0x45204A9EuLL);
      v22 = (char *)malloc_type_calloc(8uLL, self->_k * v15, 0xD989A7FEuLL);
      uint32_t __upper_bound = v18;
      v18 >>= 1;
      uint64_t __n = 8 * v15;
      memcpy(v22, &v17[v18 * v15], __n);
      [MEMORY[0x1E4F28E60] indexSetWithIndex:v18];
      v147 = v146 = v17;
      v143 = self;
      unint64_t k = self->_k;
      if (k < 2)
      {
LABEL_41:
        unsigned int v139 = 0;
        if (v15 <= 1) {
          uint64_t v41 = 1;
        }
        else {
          uint64_t v41 = v15;
        }
        do
        {
          long long v42 = v21;
          v21 = v22;
          uint64_t v17 = v146;
          if (v12)
          {
            buf[0] = 0;
            ((void (**)(void, uint8_t *, double))v12)[2](v12, buf, 0.5);
            if (buf[0])
            {
              id v78 = 0;
              int v79 = 1;
              v80 = v42;
              long long v42 = v22;
              goto LABEL_148;
            }
            unint64_t k = v143->_k;
          }
          bzero(v20, 4 * k);
          long long v43 = v137;
          if (__upper_bound)
          {
            int v44 = 0;
            uint64_t v45 = 0;
            unint64_t v46 = v143->_k;
            do
            {
              if (v46)
              {
                int v47 = 0;
                LODWORD(v48) = 0;
                unsigned int v49 = -1;
                double v50 = 1.79769313e308;
                do
                {
                  v51 = (double *)&v21[8 * v47];
                  double v52 = 0.0;
                  v53 = &v146[v44];
                  uint64_t v54 = v41;
                  do
                  {
                    double v55 = *v53++;
                    double v56 = v55;
                    double v57 = *v51++;
                    double v52 = v52 + (v56 - v57) * (v56 - v57);
                    --v54;
                  }
                  while (v54);
                  double v58 = sqrt(v52);
                  if (v58 < v50)
                  {
                    double v50 = v58;
                    unsigned int v49 = v48;
                  }
                  unint64_t v48 = (v48 + 1);
                  v47 += v15;
                }
                while (v46 > v48);
              }
              else
              {
                unsigned int v49 = -1;
              }
              v137[v45] = v49;
              ++*((_DWORD *)v20 + v49);
              ++v45;
              v44 += v15;
            }
            while (v45 != v19);
          }
          if (v12)
          {
            buf[0] = 0;
            ((void (**)(void, uint8_t *, double))v12)[2](v12, buf, 0.5);
            if (buf[0]) {
              goto LABEL_119;
            }
          }
          bzero(v42, v143->_k * __n);
          if (__upper_bound)
          {
            int v60 = 0;
            uint64_t v61 = 0;
            do
            {
              v62 = &v146[v60];
              v63 = (double *)&v42[8 * v137[v61] * v15];
              uint64_t v64 = v41;
              do
              {
                double v65 = *v62++;
                double v59 = v65 + *v63;
                *v63++ = v59;
                --v64;
              }
              while (v64);
              ++v61;
              v60 += v15;
            }
            while (v61 != v19);
          }
          if (v12)
          {
            buf[0] = 0;
            ((void (**)(void, uint8_t *, double))v12)[2](v12, buf, 0.5);
            if (buf[0])
            {
LABEL_119:
              id v78 = 0;
              int v79 = 1;
              v80 = v21;
              goto LABEL_151;
            }
          }
          unint64_t k = v143->_k;
          if (k)
          {
            int v66 = 0;
            unint64_t v67 = 0;
            do
            {
              v68 = (double *)&v42[8 * v66];
              LODWORD(v59) = *((_DWORD *)v20 + v67);
              double v59 = (double)*(unint64_t *)&v59;
              uint64_t v69 = v41;
              do
              {
                double *v68 = *v68 / v59;
                ++v68;
                --v69;
              }
              while (v69);
              unint64_t v67 = (v67 + 1);
              v66 += v15;
            }
            while (k > v67);
          }
          unsigned int v70 = ++v139;
          BOOL v72 = memcmp(v42, v21, k * __n) && v70 < 0x64;
          if (v12)
          {
            buf[0] = 0;
            ((void (**)(void, uint8_t *, double))v12)[2](v12, buf, 0.5);
            if (buf[0]) {
              goto LABEL_93;
            }
            unint64_t k = v143->_k;
          }
          if (k)
          {
            int v73 = 0;
            uint64_t v74 = 0;
            unsigned int v75 = 1;
            do
            {
              if (!*((_DWORD *)v20 + v74))
              {
                uint32_t v76 = arc4random_uniform(__upper_bound);
                memcpy(&v42[8 * v73], &v146[v76 * v15], __n);
                unint64_t k = v143->_k;
                BOOL v72 = 1;
              }
              uint64_t v74 = v75;
              BOOL v77 = k > v75++;
              v73 += v15;
            }
            while (v77);
          }
          v22 = v42;
          uint64_t v12 = v140;
        }
        while (v72);
        if (v139 >= 0x64 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v159 = 100;
          _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "KMeans failed to converge: max number of iterations reached: %ld", buf, 0xCu);
        }
        long long v43 = v137;
        if (v140)
        {
          buf[0] = 0;
          ((void (**)(void, uint8_t *, double))v140)[2](v140, buf, 0.5);
          if (buf[0])
          {
LABEL_93:
            id v78 = 0;
            int v79 = 1;
            v80 = v21;
            uint64_t v17 = v146;
            goto LABEL_151;
          }
        }
        unint64_t v102 = v143->_k;
        id v103 = v136;
        uint64_t v144 = v102;
        for (uint64_t i = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v102];
        {
          v105 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", v132);
          [i addObject:v105];
        }
        uint64_t v106 = objc_msgSend(v103, "count", v132);
        if (v106)
        {
          for (uint64_t j = 0; j != v106; ++j)
          {
            v108 = [i objectAtIndexedSubscript:v137[j]];
            v109 = [v103 objectAtIndexedSubscript:j];
            [v108 addObject:v109];
          }
        }
        v145 = v103;
        id v78 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v144];
        long long v152 = 0u;
        long long v153 = 0u;
        long long v154 = 0u;
        long long v155 = 0u;
        id v110 = i;
        uint64_t v111 = [v110 countByEnumeratingWithState:&v152 objects:buf count:16];
        if (v111)
        {
          uint64_t v112 = v111;
          uint64_t v113 = *(void *)v153;
          do
          {
            for (uint64_t m = 0; m != v112; ++m)
            {
              if (*(void *)v153 != v113) {
                objc_enumerationMutation(v110);
              }
              v115 = +[PLDataCluster clusterWithObjects:*(void *)(*((void *)&v152 + 1) + 8 * m)];
              [v78 addObject:v115];
            }
            uint64_t v112 = [v110 countByEnumeratingWithState:&v152 objects:buf count:16];
          }
          while (v112);
        }

        int v79 = 0;
        v80 = v21;
        uint64_t v12 = v140;
        uint64_t v17 = v146;
LABEL_148:
        long long v43 = v137;
LABEL_151:
        if (v17) {
          free(v17);
        }
        if (v43) {
          free(v43);
        }
        if (v20) {
          free(v20);
        }
        if (v42) {
          free(v42);
        }
        id v8 = v136;
        if (v80) {
          free(v80);
        }
        if (!v12
          || (LOBYTE(v152) = 0,
              ((void (**)(void, long long *, double))v12)[2](v12, &v152, 1.0),
              !(v152 | v79)))
        {
          id v78 = v78;
          id v81 = v78;
          id v9 = v134;
          id v10 = v135;
          goto LABEL_168;
        }
        id v9 = v134;
        id v10 = v135;
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
LABEL_166:
          id v81 = (id)MEMORY[0x1E4F1CBF0];
LABEL_168:

          goto LABEL_169;
        }
        *(_DWORD *)buf = 67109120;
        LODWORD(v159) = 287;
        v116 = MEMORY[0x1E4F14500];
      }
      else
      {
        v132 = v20;
        uint64_t v24 = 1;
        unsigned int v25 = 1;
        while (1)
        {
          if (v12)
          {
            buf[0] = 0;
            ((void (**)(void, uint8_t *, double))v12)[2](v12, buf, 0.5);
            if (buf[0]) {
              goto LABEL_133;
            }
          }
          uint64_t v138 = v24;
          if (__upper_bound)
          {
            int v26 = 0;
            uint64_t v27 = 0;
            double v28 = -1.0;
            unsigned int v29 = -1;
            do
            {
              if ((objc_msgSend(v147, "containsIndex:", v27, v132) & 1) == 0)
              {
                if (v25)
                {
                  int v30 = 0;
                  uint64_t v31 = 0;
                  double v32 = 1.79769313e308;
                  do
                  {
                    BOOL v33 = (double *)&v22[8 * v30];
                    double v34 = 0.0;
                    v35 = &v146[v26];
                    uint64_t v36 = v15;
                    do
                    {
                      double v37 = *v35++;
                      double v38 = v37;
                      double v39 = *v33++;
                      double v34 = v34 + (v38 - v39) * (v38 - v39);
                      --v36;
                    }
                    while (v36);
                    double v40 = sqrt(v34);
                    if (v40 < v32) {
                      double v32 = v40;
                    }
                    ++v31;
                    v30 += v15;
                  }
                  while (v31 != v25);
                }
                else
                {
                  double v32 = 1.79769313e308;
                }
                if (v32 > v28)
                {
                  double v28 = v32;
                  unsigned int v29 = v27;
                }
              }
              ++v27;
              v26 += v15;
            }
            while (v27 != v19);
          }
          else
          {
            unsigned int v29 = -1;
            double v28 = -1.0;
          }
          uint64_t v12 = v140;
          if (v140)
          {
            buf[0] = 0;
            ((void (**)(void, uint8_t *, double))v140)[2](v140, buf, 0.5);
            if (buf[0])
            {
              id v78 = 0;
              int v79 = 1;
              v80 = v21;
              long long v42 = v22;
              uint64_t v17 = v146;
              goto LABEL_150;
            }
          }
          uint64_t v17 = v146;
          if (v28 == 0.0) {
            break;
          }
          memcpy(&v22[8 * v25 * v15], &v146[v29 * v15], __n);
          [v147 addIndex:v29];
          unint64_t k = v143->_k;
          uint64_t v24 = ++v25;
          if (k <= v25)
          {
            uint64_t v20 = v132;
            goto LABEL_41;
          }
        }
        if (__upper_bound)
        {
          int v91 = 0;
          uint64_t v92 = 0;
          do
          {
            if (v25)
            {
              int v93 = 0;
              uint64_t v94 = 0;
              while (1)
              {
                v95 = (double *)&v22[8 * v93];
                double v96 = 0.0;
                v97 = &v146[v91];
                uint64_t v98 = v15;
                do
                {
                  double v99 = *v97++;
                  double v100 = v99;
                  double v101 = *v95++;
                  double v96 = v96 + (v100 - v101) * (v100 - v101);
                  --v98;
                }
                while (v98);
                if (sqrt(v96) == 0.0) {
                  break;
                }
                ++v94;
                v93 += v15;
                if (v94 == v25) {
                  goto LABEL_130;
                }
              }
              v137[v92] = v94;
            }
LABEL_130:
            ++v92;
            v91 += v15;
          }
          while (v92 != v19);
        }
        if (v140)
        {
          buf[0] = 0;
          ((void (**)(void, uint8_t *, double))v140)[2](v140, buf, 0.5);
          if (buf[0])
          {
LABEL_133:
            id v78 = 0;
            int v79 = 1;
            v80 = v21;
            long long v42 = v22;
LABEL_150:
            long long v43 = v137;
            uint64_t v20 = v132;
            goto LABEL_151;
          }
        }
        id v118 = v136;
        for (n = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v138];
        {
          v120 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", v132);
          [n addObject:v120];
        }
        uint64_t v121 = objc_msgSend(v118, "count", v132);
        if (v121)
        {
          for (iuint64_t i = 0; ii != v121; ++ii)
          {
            v123 = [n objectAtIndexedSubscript:v137[ii]];
            v124 = [v118 objectAtIndexedSubscript:ii];
            [v123 addObject:v124];
          }
        }
        v125 = v118;
        id v78 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v138];
        long long v152 = 0u;
        long long v153 = 0u;
        long long v154 = 0u;
        long long v155 = 0u;
        id v126 = n;
        uint64_t v127 = [v126 countByEnumeratingWithState:&v152 objects:buf count:16];
        if (v127)
        {
          uint64_t v128 = v127;
          uint64_t v129 = *(void *)v153;
          do
          {
            for (juint64_t j = 0; jj != v128; ++jj)
            {
              if (*(void *)v153 != v129) {
                objc_enumerationMutation(v126);
              }
              v131 = +[PLDataCluster clusterWithObjects:*(void *)(*((void *)&v152 + 1) + 8 * jj)];
              [v78 addObject:v131];
            }
            uint64_t v128 = [v126 countByEnumeratingWithState:&v152 objects:buf count:16];
          }
          while (v128);
        }

        if (v146) {
          free(v146);
        }
        id v9 = v134;
        id v10 = v135;
        uint64_t v12 = v140;
        if (v137) {
          free(v137);
        }
        if (v133) {
          free(v133);
        }
        if (v22) {
          free(v22);
        }
        id v8 = v136;
        if (v21) {
          free(v21);
        }
        if (!v140
          || (LOBYTE(v152) = 0,
              ((void (**)(void, long long *, double))v140)[2](v140, &v152, 1.0),
              !(_BYTE)v152))
        {
          id v78 = v78;
          id v81 = v78;
          goto LABEL_168;
        }
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
          goto LABEL_166;
        }
        *(_DWORD *)buf = 67109120;
        LODWORD(v159) = 167;
        v116 = MEMORY[0x1E4F14500];
      }
      _os_log_impl(&dword_19B3C7000, v116, OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
      goto LABEL_166;
    }
    id v82 = v9;
    v83 = [MEMORY[0x1E4F1CA48] array];
    long long v148 = 0u;
    long long v149 = 0u;
    long long v150 = 0u;
    long long v151 = 0u;
    id v84 = v8;
    uint64_t v85 = [v84 countByEnumeratingWithState:&v148 objects:v157 count:16];
    if (v85)
    {
      uint64_t v86 = v85;
      uint64_t v87 = *(void *)v149;
      do
      {
        for (kunint64_t k = 0; kk != v86; ++kk)
        {
          if (*(void *)v149 != v87) {
            objc_enumerationMutation(v84);
          }
          uint64_t v156 = *(void *)(*((void *)&v148 + 1) + 8 * kk);
          v89 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v156 count:1];
          v90 = +[PLDataCluster clusterWithObjects:v89];
          [v83 addObject:v90];
        }
        uint64_t v86 = [v84 countByEnumeratingWithState:&v148 objects:v157 count:16];
      }
      while (v86);
    }

    id v10 = v135;
    if (v140
      && (LOBYTE(v152) = 0, ((void (**)(void, long long *, double))v140)[2](v140, &v152, 1.0), (_BYTE)v152))
    {
      id v9 = v82;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v159) = 72;
        _os_log_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
      }
      id v81 = (id)MEMORY[0x1E4F1CBF0];
      id v8 = v136;
    }
    else
    {
      id v81 = v83;
      id v8 = v136;
      id v9 = v82;
    }
    uint64_t v12 = v140;
  }
  else
  {
    if (v12)
    {
      LOBYTE(v152) = 0;
      ((void (**)(void, long long *, double))v12)[2](v12, &v152, 1.0);
      if ((_BYTE)v152)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v159) = 54;
          uint64_t v13 = MEMORY[0x1E4F14500];
          goto LABEL_98;
        }
LABEL_99:
        id v81 = (id)MEMORY[0x1E4F1CBF0];
        goto LABEL_169;
      }
    }
    id v81 = 0;
  }
LABEL_169:

  return v81;
}

- (id)performWithDataset:(id)a3 progressBlock:(id)a4
{
  return [(PLKMeansClustering *)self _performWithDataset:a3 numericData:0 progressBlock:a4];
}

@end