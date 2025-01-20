@interface VKLabelNavRoadGraph(junctionlist)
- (void)offRouteGraphJunctionsWithNavContext:()junctionlist maxJunctions:isOnRoute:;
@end

@implementation VKLabelNavRoadGraph(junctionlist)

- (void)offRouteGraphJunctionsWithNavContext:()junctionlist maxJunctions:isOnRoute:
{
  while (2)
  {
    uint64_t v187 = (uint64_t)(a2 - 8);
    uint64_t v188 = (uint64_t)(a2 - 4);
    uint64_t v186 = (uint64_t)(a2 - 12);
    unint64_t v9 = a1;
    while (1)
    {
      while (1)
      {
        while (1)
        {
          a1 = v9;
          uint64_t v10 = (uint64_t)a2 - v9;
          uint64_t v11 = (uint64_t)((uint64_t)a2 - v9) >> 4;
          if (!(!v5 & v4))
          {
            switch(v11)
            {
              case 0:
              case 1:
                return;
              case 2:
                unsigned int v87 = *((unsigned __int8 *)a2 - 8);
                unsigned int v88 = *(unsigned __int8 *)(a1 + 8);
                BOOL v5 = v87 == v88;
                BOOL v89 = v87 < v88;
                if (v5) {
                  BOOL v89 = *(a2 - 1) < *(float *)(a1 + 12);
                }
                if (v89)
                {
                  v90 = *(void **)a1;
                  uint64_t v91 = *(void *)(a1 + 8);
                  *(void *)a1 = 0;
                  uint64_t v92 = *((void *)a2 - 2);
                  *((void *)a2 - 2) = 0;
                  v93 = *(void **)a1;
                  *(void *)a1 = v92;

                  *(void *)(a1 + 8) = *((void *)a2 - 1);
                  v94 = (void *)*((void *)a2 - 2);
                  *((void *)a2 - 2) = v90;

                  *((void *)a2 - 1) = v91;
                }
                break;
              case 3:
                std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,-[VKLabelNavRoadGraph(junctionlist) offRouteGraphJunctionsWithNavContext:maxJunctions:isOnRoute:]::$_2 &,OffRouteJunctionInfo *>(a1, a1 + 16, v188);
                break;
              case 4:
                std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,-[VKLabelNavRoadGraph(junctionlist) offRouteGraphJunctionsWithNavContext:maxJunctions:isOnRoute:]::$_2 &,OffRouteJunctionInfo *>(a1, a1 + 16, a1 + 32, v188);
                break;
              case 5:
                std::__sort5_maybe_branchless[abi:nn180100]<std::_ClassicAlgPolicy,[(VKLabelNavRoadGraph(junctionlist) *)a1 offRouteGraphJunctionsWithNavContext:a1 + 32 maxJunctions:a1 + 48 isOnRoute:v188];
                break;
              default:
                JUMPOUT(0);
            }
            return;
          }
          if (v10 <= 383)
          {
            v95 = (float *)(a1 + 16);
            BOOL v97 = (float *)a1 == a2 || v95 == a2;
            if (a4)
            {
              if (!v97)
              {
                uint64_t v98 = 0;
                v99 = (float *)a1;
                do
                {
                  v102 = v95;
                  unsigned int v103 = *((unsigned __int8 *)v99 + 24);
                  unsigned int v104 = *((unsigned __int8 *)v99 + 8);
                  BOOL v5 = v103 == v104;
                  BOOL v105 = v103 < v104;
                  if (v5) {
                    BOOL v105 = v99[7] < v99[3];
                  }
                  if (v105)
                  {
                    uint64_t v106 = *(void *)v102;
                    *(void *)v102 = 0;
                    int v107 = *((_DWORD *)v99 + 6);
                    float v108 = v99[7];
                    uint64_t v109 = v98;
                    do
                    {
                      v110 = (float *)(a1 + v109);
                      uint64_t v111 = *(void *)(a1 + v109);
                      *(void *)v110 = 0;
                      v112 = *(void **)(a1 + v109 + 16);
                      *((void *)v110 + 2) = v111;

                      *((void *)v110 + 3) = *((void *)v110 + 1);
                      if (!v109)
                      {
                        uint64_t v100 = a1;
                        goto LABEL_103;
                      }
                      unsigned int v113 = *((unsigned __int8 *)v110 - 8);
                      BOOL v5 = v113 == v107;
                      BOOL v114 = v113 > v107;
                      if (v5) {
                        BOOL v114 = *(v110 - 1) > v108;
                      }
                      v109 -= 16;
                    }
                    while (v114);
                    uint64_t v100 = a1 + v109 + 16;
LABEL_103:
                    v101 = *(void **)v100;
                    *(void *)uint64_t v100 = v106;

                    *(_DWORD *)(v100 + 8) = v107;
                    *(float *)(v100 + 12) = v108;
                  }
                  v95 = v102 + 4;
                  v98 += 16;
                  v99 = v102;
                }
                while (v102 + 4 != a2);
              }
            }
            else if (!v97)
            {
              v172 = (unsigned __int8 *)(a1 - 8);
              do
              {
                v173 = v95;
                unsigned int v174 = *(unsigned __int8 *)(a1 + 24);
                unsigned int v175 = *(unsigned __int8 *)(a1 + 8);
                BOOL v5 = v174 == v175;
                BOOL v176 = v174 < v175;
                if (v5) {
                  BOOL v176 = *(float *)(a1 + 28) < *(float *)(a1 + 12);
                }
                if (v176)
                {
                  uint64_t v177 = *(void *)v173;
                  *(void *)v173 = 0;
                  int v178 = *(_DWORD *)(a1 + 24);
                  float v179 = *(float *)(a1 + 28);
                  v180 = v172;
                  do
                  {
                    uint64_t v181 = *((void *)v180 + 1);
                    *((void *)v180 + 1) = 0;
                    v182 = (void *)*((void *)v180 + 3);
                    *((void *)v180 + 3) = v181;

                    *((void *)v180 + 4) = *((void *)v180 + 2);
                    unsigned int v183 = *v180;
                    BOOL v5 = v183 == v178;
                    BOOL v184 = v183 > v178;
                    if (v5) {
                      BOOL v184 = *((float *)v180 + 1) > v179;
                    }
                    v180 -= 16;
                  }
                  while (v184);
                  v185 = (void *)*((void *)v180 + 3);
                  *((void *)v180 + 3) = v177;

                  *((_DWORD *)v180 + 8) = v178;
                  *((float *)v180 + 9) = v179;
                }
                v95 = v173 + 4;
                v172 += 16;
                a1 = (uint64_t)v173;
              }
              while (v173 + 4 != a2);
            }
            return;
          }
          if (!a3)
          {
            if ((float *)a1 != a2)
            {
              int64_t v115 = (unint64_t)(v11 - 2) >> 1;
              int64_t v116 = v115;
              do
              {
                int64_t v118 = v116;
                if (v115 >= v116)
                {
                  uint64_t v119 = (2 * v116) | 1;
                  uint64_t v120 = a1 + 16 * v119;
                  if (2 * v118 + 2 < v11)
                  {
                    unsigned int v121 = *(unsigned __int8 *)(v120 + 8);
                    unsigned int v122 = *(unsigned __int8 *)(v120 + 24);
                    BOOL v5 = v121 == v122;
                    BOOL v123 = v121 < v122;
                    if (v5) {
                      BOOL v123 = *(float *)(v120 + 12) < *(float *)(v120 + 28);
                    }
                    v120 += 16 * v123;
                    if (v123) {
                      uint64_t v119 = 2 * v118 + 2;
                    }
                  }
                  uint64_t v124 = a1 + 16 * v118;
                  unsigned int v125 = *(unsigned __int8 *)(v120 + 8);
                  unsigned int v126 = *(unsigned __int8 *)(v124 + 8);
                  float v127 = *(float *)(v124 + 12);
                  BOOL v5 = v125 == v126;
                  BOOL v128 = v125 < v126;
                  if (v5) {
                    BOOL v128 = *(float *)(v120 + 12) < v127;
                  }
                  if (!v128)
                  {
                    v191 = *(void **)v124;
                    *(void *)uint64_t v124 = 0;
                    int v193 = *(_DWORD *)(v124 + 8);
                    do
                    {
                      uint64_t v131 = v124;
                      uint64_t v124 = v120;
                      uint64_t v132 = *(void *)v120;
                      *(void *)uint64_t v124 = 0;
                      v133 = *(void **)v131;
                      *(void *)uint64_t v131 = v132;

                      *(void *)(v131 + 8) = *(void *)(v124 + 8);
                      if (v115 < v119) {
                        break;
                      }
                      uint64_t v134 = (2 * v119) | 1;
                      uint64_t v120 = a1 + 16 * v134;
                      if (2 * v119 + 2 < v11)
                      {
                        unsigned int v135 = *(unsigned __int8 *)(v120 + 8);
                        unsigned int v136 = *(unsigned __int8 *)(v120 + 24);
                        BOOL v5 = v135 == v136;
                        BOOL v137 = v135 < v136;
                        if (v5) {
                          BOOL v137 = *(float *)(v120 + 12) < *(float *)(v120 + 28);
                        }
                        v120 += 16 * v137;
                        if (v137) {
                          uint64_t v134 = 2 * v119 + 2;
                        }
                      }
                      unsigned int v129 = *(unsigned __int8 *)(v120 + 8);
                      BOOL v5 = v129 == v193;
                      BOOL v130 = v129 < v193;
                      if (v5) {
                        BOOL v130 = *(float *)(v120 + 12) < v127;
                      }
                      uint64_t v119 = v134;
                    }
                    while (!v130);
                    v117 = *(void **)v124;
                    *(void *)uint64_t v124 = v191;

                    *(_DWORD *)(v124 + 8) = v193;
                    *(float *)(v124 + 12) = v127;
                  }
                }
                int64_t v116 = v118 - 1;
              }
              while (v118);
              uint64_t v138 = (unint64_t)v10 >> 4;
              do
              {
                uint64_t v141 = 0;
                v143 = *(void **)a1;
                uint64_t v142 = *(void *)(a1 + 8);
                *(void *)a1 = 0;
                uint64_t v144 = a1;
                do
                {
                  uint64_t v147 = v144 + 16 * v141 + 16;
                  uint64_t v148 = (2 * v141) | 1;
                  uint64_t v149 = 2 * v141 + 2;
                  if (v149 < v138)
                  {
                    unsigned int v150 = *(unsigned __int8 *)(v147 + 8);
                    unsigned int v151 = *(unsigned __int8 *)(v147 + 24);
                    BOOL v5 = v150 == v151;
                    BOOL v152 = v150 < v151;
                    if (v5) {
                      BOOL v152 = *(float *)(v147 + 12) < *(float *)(v147 + 28);
                    }
                    v147 += 16 * v152;
                    if (v152) {
                      uint64_t v148 = v149;
                    }
                  }
                  v145 = *(void **)v147;
                  *(void *)uint64_t v147 = 0;
                  v146 = *(void **)v144;
                  *(void *)uint64_t v144 = v145;

                  *(void *)(v144 + 8) = *(void *)(v147 + 8);
                  uint64_t v144 = v147;
                  uint64_t v141 = v148;
                }
                while (v148 <= (uint64_t)((unint64_t)(v138 - 2) >> 1));
                v153 = a2 - 4;
                if ((float *)v147 == a2 - 4)
                {
                  v139 = *(void **)v147;
                  *(void *)uint64_t v147 = v143;

                  *(void *)(v147 + 8) = v142;
                }
                else
                {
                  uint64_t v154 = *((void *)a2 - 2);
                  *((void *)a2 - 2) = 0;
                  v155 = *(void **)v147;
                  *(void *)uint64_t v147 = v154;

                  *(void *)(v147 + 8) = *((void *)a2 - 1);
                  v156 = (void *)*((void *)a2 - 2);
                  *((void *)a2 - 2) = v143;

                  *((void *)a2 - 1) = v142;
                  uint64_t v157 = v147 - a1 + 16;
                  if (v157 >= 17)
                  {
                    unint64_t v158 = (((unint64_t)v157 >> 4) - 2) >> 1;
                    uint64_t v159 = a1 + 16 * v158;
                    unsigned int v160 = *(unsigned __int8 *)(v159 + 8);
                    unsigned int v161 = *(unsigned __int8 *)(v147 + 8);
                    float v162 = *(float *)(v147 + 12);
                    BOOL v5 = v160 == v161;
                    BOOL v163 = v160 < v161;
                    if (v5) {
                      BOOL v163 = *(float *)(v159 + 12) < v162;
                    }
                    if (v163)
                    {
                      v164 = *(void **)v147;
                      *(void *)uint64_t v147 = 0;
                      int v165 = *(_DWORD *)(v147 + 8);
                      do
                      {
                        uint64_t v166 = v147;
                        uint64_t v147 = v159;
                        uint64_t v167 = *(void *)v159;
                        *(void *)uint64_t v147 = 0;
                        v168 = *(void **)v166;
                        *(void *)uint64_t v166 = v167;

                        *(void *)(v166 + 8) = *(void *)(v147 + 8);
                        if (!v158) {
                          break;
                        }
                        unint64_t v158 = (v158 - 1) >> 1;
                        uint64_t v159 = a1 + 16 * v158;
                        unsigned int v169 = *(unsigned __int8 *)(v159 + 8);
                        BOOL v5 = v169 == v165;
                        BOOL v170 = v169 < v165;
                        if (v5) {
                          BOOL v170 = *(float *)(v159 + 12) < v162;
                        }
                      }
                      while (v170);
                      v171 = *(void **)v147;
                      *(void *)uint64_t v147 = v164;

                      *(_DWORD *)(v147 + 8) = v165;
                      *(float *)(v147 + 12) = v162;
                    }
                  }
                }
                a2 = v153;
              }
              while (v138-- > 2);
            }
            return;
          }
          unint64_t v12 = (unint64_t)v11 >> 1;
          v13 = (void **)(a1 + 16 * ((unint64_t)v11 >> 1));
          if ((unint64_t)v10 < 0x801)
          {
            std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,-[VKLabelNavRoadGraph(junctionlist) offRouteGraphJunctionsWithNavContext:maxJunctions:isOnRoute:]::$_2 &,OffRouteJunctionInfo *>((uint64_t)v13, a1, v188);
          }
          else
          {
            std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,-[VKLabelNavRoadGraph(junctionlist) offRouteGraphJunctionsWithNavContext:maxJunctions:isOnRoute:]::$_2 &,OffRouteJunctionInfo *>(a1, (uint64_t)v13, v188);
            uint64_t v14 = 16 * v12;
            uint64_t v15 = a1 + v14;
            std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,-[VKLabelNavRoadGraph(junctionlist) offRouteGraphJunctionsWithNavContext:maxJunctions:isOnRoute:]::$_2 &,OffRouteJunctionInfo *>(a1 + 16, a1 + v14 - 16, v187);
            std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,-[VKLabelNavRoadGraph(junctionlist) offRouteGraphJunctionsWithNavContext:maxJunctions:isOnRoute:]::$_2 &,OffRouteJunctionInfo *>(a1 + 32, a1 + 16 + v14, v186);
            std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,-[VKLabelNavRoadGraph(junctionlist) offRouteGraphJunctionsWithNavContext:maxJunctions:isOnRoute:]::$_2 &,OffRouteJunctionInfo *>(a1 + v14 - 16, (uint64_t)v13, a1 + 16 + v14);
            v16 = *(void **)a1;
            uint64_t v17 = *(void *)(a1 + 8);
            *(void *)a1 = 0;
            v18 = *v13;
            *v13 = 0;
            v19 = *(void **)a1;
            *(void *)a1 = v18;

            *(void *)(a1 + 8) = *(void *)(v15 + 8);
            v20 = *v13;
            *v13 = v16;

            *(void *)(v15 + 8) = v17;
          }
          --a3;
          if (a4)
          {
            float v21 = *(float *)(a1 + 12);
            break;
          }
          unsigned int v22 = *(unsigned __int8 *)(a1 - 8);
          unsigned int v23 = *(unsigned __int8 *)(a1 + 8);
          float v21 = *(float *)(a1 + 12);
          BOOL v5 = v22 == v23;
          BOOL v24 = v22 < v23;
          if (v5) {
            BOOL v24 = *(float *)(a1 - 4) < v21;
          }
          if (v24) {
            break;
          }
          v56 = *(void **)a1;
          *(void *)a1 = 0;
          int v57 = *(_DWORD *)(a1 + 8);
          unsigned int v58 = *((unsigned __int8 *)a2 - 8);
          BOOL v5 = v58 == v57;
          BOOL v59 = v58 > v57;
          if (v5) {
            BOOL v59 = *(a2 - 1) > v21;
          }
          if (v59)
          {
            unint64_t v60 = a1;
            do
            {
              unint64_t v9 = v60 + 16;
              unsigned int v61 = *(unsigned __int8 *)(v60 + 24);
              BOOL v62 = *(float *)(v60 + 28) > v21;
              BOOL v5 = v61 == v57;
              BOOL v63 = v61 > v57;
              if (v5) {
                BOOL v63 = v62;
              }
              unint64_t v60 = v9;
            }
            while (!v63);
          }
          else
          {
            unint64_t v64 = a1 + 16;
            do
            {
              unint64_t v9 = v64;
              if (v64 >= (unint64_t)a2) {
                break;
              }
              unsigned int v65 = *(unsigned __int8 *)(v64 + 8);
              BOOL v66 = *(float *)(v9 + 12) > v21;
              BOOL v5 = v65 == v57;
              BOOL v67 = v65 > v57;
              if (!v5) {
                BOOL v66 = v67;
              }
              unint64_t v64 = v9 + 16;
            }
            while (!v66);
          }
          v68 = a2;
          if (v9 < (unint64_t)a2)
          {
            v69 = a2;
            do
            {
              v68 = v69 - 4;
              unsigned int v70 = *((unsigned __int8 *)v69 - 8);
              BOOL v71 = *(v69 - 1) > v21;
              BOOL v5 = v70 == v57;
              BOOL v72 = v70 > v57;
              if (v5) {
                BOOL v72 = v71;
              }
              v69 = v68;
            }
            while (v72);
          }
          while (v9 < (unint64_t)v68)
          {
            v73 = *(void **)v9;
            uint64_t v74 = *(void *)(v9 + 8);
            *(void *)unint64_t v9 = 0;
            v75 = *(void **)v68;
            *(void *)v68 = 0;
            v76 = *(void **)v9;
            *(void *)unint64_t v9 = v75;

            *(void *)(v9 + 8) = *((void *)v68 + 1);
            v77 = *(void **)v68;
            *(void *)v68 = v73;

            *((void *)v68 + 1) = v74;
            do
            {
              unsigned int v78 = *(unsigned __int8 *)(v9 + 24);
              float v79 = *(float *)(v9 + 28);
              v9 += 16;
              BOOL v5 = v78 == v57;
              BOOL v80 = v78 > v57;
              if (v5) {
                BOOL v80 = v79 > v21;
              }
            }
            while (!v80);
            do
            {
              unsigned int v81 = *((unsigned __int8 *)v68 - 8);
              float v82 = *(v68 - 1);
              v68 -= 4;
              BOOL v5 = v81 == v57;
              BOOL v83 = v81 > v57;
              if (v5) {
                BOOL v83 = v82 > v21;
              }
            }
            while (v83);
          }
          if (v9 - 16 != a1)
          {
            uint64_t v84 = *(void *)(v9 - 16);
            *(void *)(v9 - 16) = 0;
            v85 = *(void **)a1;
            *(void *)a1 = v84;

            *(void *)(a1 + 8) = *(void *)(v9 - 8);
          }
          v86 = *(void **)(v9 - 16);
          *(void *)(v9 - 16) = v56;

          a4 = 0;
          *(_DWORD *)(v9 - 8) = v57;
          *(float *)(v9 - 4) = v21;
        }
        v190 = *(void **)a1;
        *(void *)a1 = 0;
        int v25 = *(_DWORD *)(a1 + 8);
        unint64_t v26 = a1;
        do
        {
          unint64_t v27 = v26;
          v26 += 16;
          unsigned int v28 = *(unsigned __int8 *)(v27 + 24);
          BOOL v5 = v28 == v25;
          BOOL v29 = v28 < v25;
          if (v5) {
            BOOL v29 = *(float *)(v27 + 28) < v21;
          }
        }
        while (v29);
        v30 = a2;
        if (v27 == a1)
        {
          v35 = a2;
          while (v26 < (unint64_t)v35)
          {
            v31 = v35 - 4;
            unsigned int v36 = *((unsigned __int8 *)v35 - 8);
            BOOL v37 = *(v35 - 1) < v21;
            BOOL v5 = v36 == v25;
            BOOL v38 = v36 < v25;
            if (v5) {
              BOOL v38 = v37;
            }
            v35 = v31;
            if (v38) {
              goto LABEL_30;
            }
          }
          v31 = v35;
        }
        else
        {
          do
          {
            v31 = v30 - 4;
            unsigned int v32 = *((unsigned __int8 *)v30 - 8);
            BOOL v33 = *(v30 - 1) < v21;
            BOOL v5 = v32 == v25;
            BOOL v34 = v32 < v25;
            if (v5) {
              BOOL v34 = v33;
            }
            v30 = v31;
          }
          while (!v34);
        }
LABEL_30:
        uint64_t v192 = a3;
        uint64_t v39 = (uint64_t)a2;
        unint64_t v9 = v26;
        if (v26 < (unint64_t)v31)
        {
          v40 = v31;
          do
          {
            v42 = *(void **)v9;
            uint64_t v41 = *(void *)(v9 + 8);
            *(void *)unint64_t v9 = 0;
            v43 = *(void **)v40;
            *(void *)v40 = 0;
            v44 = *(void **)v9;
            *(void *)unint64_t v9 = v43;

            *(void *)(v9 + 8) = *((void *)v40 + 1);
            v45 = *(void **)v40;
            *(void *)v40 = v42;

            *((void *)v40 + 1) = v41;
            do
            {
              unsigned int v46 = *(unsigned __int8 *)(v9 + 24);
              float v47 = *(float *)(v9 + 28);
              v9 += 16;
              BOOL v5 = v46 == v25;
              BOOL v48 = v46 < v25;
              if (v5) {
                BOOL v48 = v47 < v21;
              }
            }
            while (v48);
            do
            {
              unsigned int v49 = *((unsigned __int8 *)v40 - 8);
              float v50 = *(v40 - 1);
              v40 -= 4;
              BOOL v5 = v49 == v25;
              BOOL v51 = v49 < v25;
              if (v5) {
                BOOL v51 = v50 < v21;
              }
            }
            while (!v51);
          }
          while (v9 < (unint64_t)v40);
        }
        if (v9 - 16 != a1)
        {
          uint64_t v52 = *(void *)(v9 - 16);
          *(void *)(v9 - 16) = 0;
          v53 = *(void **)a1;
          *(void *)a1 = v52;

          *(void *)(a1 + 8) = *(void *)(v9 - 8);
        }
        v54 = *(void **)(v9 - 16);
        *(void *)(v9 - 16) = v190;

        *(_DWORD *)(v9 - 8) = v25;
        *(float *)(v9 - 4) = v21;
        a2 = (float *)v39;
        a3 = v192;
        if (v26 >= (unint64_t)v31) {
          break;
        }
LABEL_45:
        std::__introsort<std::_ClassicAlgPolicy,-[VKLabelNavRoadGraph(junctionlist) offRouteGraphJunctionsWithNavContext:maxJunctions:isOnRoute:]::$_2 &,OffRouteJunctionInfo *,false>(a1, v9 - 16, v192, a4 & 1);
        a4 = 0;
      }
      BOOL v55 = std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,-[VKLabelNavRoadGraph(junctionlist) offRouteGraphJunctionsWithNavContext:maxJunctions:isOnRoute:]::$_2 &,OffRouteJunctionInfo *>(a1, v9 - 16);
      if (std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,-[VKLabelNavRoadGraph(junctionlist) offRouteGraphJunctionsWithNavContext:maxJunctions:isOnRoute:]::$_2 &,OffRouteJunctionInfo *>(v9, v39))
      {
        break;
      }
      if (!v55) {
        goto LABEL_45;
      }
    }
    a2 = (float *)(v9 - 16);
    if (!v55) {
      continue;
    }
    break;
  }
}

@end