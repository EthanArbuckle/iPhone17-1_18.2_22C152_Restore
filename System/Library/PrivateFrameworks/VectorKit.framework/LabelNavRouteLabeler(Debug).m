@interface LabelNavRouteLabeler(Debug)
- (double)drawNavOverlayDebugView:()Debug navContext:;
@end

@implementation LabelNavRouteLabeler(Debug)

- (double)drawNavOverlayDebugView:()Debug navContext:
{
  while (2)
  {
    n128_u64 = a2[-1].n128_u64;
    n128_f64 = a2[-2].n128_f64;
    v13 = a2[-3].n128_f64;
    v14 = a1;
    while (1)
    {
      while (1)
      {
        while (1)
        {
          a1 = v14;
          uint64_t v15 = (char *)a2 - (char *)v14;
          uint64_t v16 = a2 - v14;
          if (v6 || !v5)
          {
            switch(v16)
            {
              case 0:
              case 1:
                return a5.n128_f64[0];
              case 2:
                a5.n128_u64[0] = *n128_u64;
                if (*(double *)n128_u64 >= v14->n128_f64[0]) {
                  return a5.n128_f64[0];
                }
                goto LABEL_100;
              case 3:
                v62 = v14 + 1;
                a5.n128_u64[0] = v14[1].n128_u64[0];
                double v63 = *(double *)n128_u64;
                if (a5.n128_f64[0] < v14->n128_f64[0])
                {
                  if (v63 >= a5.n128_f64[0])
                  {
                    __n128 v126 = *v14;
                    __n128 *v14 = *v62;
                    __n128 *v62 = v126;
                    a5.n128_u64[0] = *n128_u64;
                    if (*(double *)n128_u64 >= v14[1].n128_f64[0]) {
                      return a5.n128_f64[0];
                    }
                    a5 = *v62;
                    __n128 *v62 = *(__n128 *)n128_u64;
                  }
                  else
                  {
LABEL_100:
                    __n128 v122 = *v14;
                    __n128 *v14 = *(__n128 *)n128_u64;
                    a5 = v122;
                  }
                  *(__n128 *)n128_u64 = a5;
                  return a5.n128_f64[0];
                }
                if (v63 < a5.n128_f64[0])
                {
                  a5 = *v62;
                  __n128 *v62 = *(__n128 *)n128_u64;
                  *(__n128 *)n128_u64 = a5;
                  a5.n128_u64[0] = v14[1].n128_u64[0];
                  if (a5.n128_f64[0] < v14->n128_f64[0])
                  {
                    __n128 v125 = *v14;
                    __n128 *v14 = *v62;
                    a5.n128_u64[0] = v125.n128_u64[0];
                    __n128 *v62 = v125;
                  }
                }
                break;
              case 4:
                a5.n128_u64[0] = std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,-[LabelNavRouteLabeler(Debug) drawNavOverlayDebugView:navContext:]::$_0 &,gm::Range<double> *>(v14, v14[1].n128_f64, v14[2].n128_f64, a2[-1].n128_u64, a5).n128_u64[0];
                return a5.n128_f64[0];
              case 5:
                v64 = v14 + 1;
                v65 = v14 + 2;
                v66 = v14 + 3;
                std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,-[LabelNavRouteLabeler(Debug) drawNavOverlayDebugView:navContext:]::$_0 &,gm::Range<double> *>(v14, v14[1].n128_f64, v14[2].n128_f64, v14[3].n128_u64, a5);
                a5.n128_u64[0] = *n128_u64;
                if (*(double *)n128_u64 < v14[3].n128_f64[0])
                {
                  a5 = *v66;
                  __n128 *v66 = *(__n128 *)n128_u64;
                  *(__n128 *)n128_u64 = a5;
                  a5.n128_u64[0] = v66->n128_u64[0];
                  if (v66->n128_f64[0] < v65->n128_f64[0])
                  {
                    a5 = *v65;
                    __n128 *v65 = *v66;
                    __n128 *v66 = a5;
                    a5.n128_u64[0] = v65->n128_u64[0];
                    if (v65->n128_f64[0] < v64->n128_f64[0])
                    {
                      a5 = *v64;
                      __n128 *v64 = *v65;
                      __n128 *v65 = a5;
                      a5.n128_u64[0] = v14[1].n128_u64[0];
                      if (a5.n128_f64[0] < v14->n128_f64[0])
                      {
                        __n128 v123 = *v14;
                        __n128 *v14 = *v64;
                        a5.n128_u64[0] = v123.n128_u64[0];
                        __n128 *v64 = v123;
                      }
                    }
                  }
                }
                return a5.n128_f64[0];
              default:
                JUMPOUT(0);
            }
            return a5.n128_f64[0];
          }
          if (v15 <= 383)
          {
            v67 = v14 + 1;
            BOOL v69 = v14 == a2 || v67 == a2;
            if (a4)
            {
              if (!v69)
              {
                uint64_t v70 = 0;
                v71 = v14;
                do
                {
                  v73 = v67;
                  a5.n128_u64[0] = v71[1].n128_u64[0];
                  if (a5.n128_f64[0] < v71->n128_f64[0])
                  {
                    unint64_t v74 = v71[1].n128_u64[1];
                    uint64_t v75 = v70;
                    do
                    {
                      *(__n128 *)((char *)v14 + v75 + 16) = *(__n128 *)((char *)v14 + v75);
                      if (!v75)
                      {
                        v72 = v14;
                        goto LABEL_120;
                      }
                      double v76 = *(double *)((char *)v14[-1].n128_f64 + v75);
                      v75 -= 16;
                    }
                    while (a5.n128_f64[0] < v76);
                    v72 = (__n128 *)((char *)v14 + v75 + 16);
LABEL_120:
                    v72->n128_u64[0] = a5.n128_u64[0];
                    v72->n128_u64[1] = v74;
                  }
                  v67 = v73 + 1;
                  v70 += 16;
                  v71 = v73;
                }
                while (&v73[1] != a2);
              }
            }
            else if (!v69)
            {
              do
              {
                v99 = v67;
                a5.n128_u64[0] = a1[1].n128_u64[0];
                if (a5.n128_f64[0] < a1->n128_f64[0])
                {
                  unint64_t v100 = a1[1].n128_u64[1];
                  v101 = v67;
                  do
                  {
                    __n128 *v101 = v101[-1];
                    double v102 = v101[-2].n128_f64[0];
                    --v101;
                  }
                  while (a5.n128_f64[0] < v102);
                  v101->n128_u64[0] = a5.n128_u64[0];
                  v101->n128_u64[1] = v100;
                }
                ++v67;
                a1 = v99;
              }
              while (&v99[1] != a2);
            }
            return a5.n128_f64[0];
          }
          if (!a3)
          {
            if (v14 != a2)
            {
              int64_t v77 = (unint64_t)(v16 - 2) >> 1;
              int64_t v78 = v77;
              do
              {
                if (v77 >= v78)
                {
                  uint64_t v80 = (2 * v78) | 1;
                  v81 = v14[v80].n128_f64;
                  if (2 * v78 + 2 < v16 && *v81 < v81[2])
                  {
                    v81 += 2;
                    uint64_t v80 = 2 * v78 + 2;
                  }
                  v82 = &v14[v78];
                  double v83 = v82->n128_f64[0];
                  if (*v81 >= v82->n128_f64[0])
                  {
                    unint64_t v84 = v82->n128_u64[1];
                    do
                    {
                      v85 = v82;
                      v82 = (__n128 *)v81;
                      __n128 *v85 = *(__n128 *)v81;
                      if (v77 < v80) {
                        break;
                      }
                      uint64_t v86 = 2 * v80;
                      uint64_t v80 = (2 * v80) | 1;
                      v81 = v14[v80].n128_f64;
                      uint64_t v87 = v86 + 2;
                      if (v87 < v16 && *v81 < v81[2])
                      {
                        v81 += 2;
                        uint64_t v80 = v87;
                      }
                    }
                    while (*v81 >= v83);
                    v82->n128_f64[0] = v83;
                    v82->n128_u64[1] = v84;
                  }
                }
                BOOL v79 = v78-- <= 0;
              }
              while (!v79);
              uint64_t v88 = (unint64_t)v15 >> 4;
              do
              {
                uint64_t v89 = 0;
                __n128 v124 = *v14;
                v90 = v14;
                do
                {
                  v91 = v90;
                  v90 += v89 + 1;
                  uint64_t v92 = 2 * v89;
                  uint64_t v89 = (2 * v89) | 1;
                  uint64_t v93 = v92 + 2;
                  if (v93 < v88 && v90->n128_f64[0] < v90[1].n128_f64[0])
                  {
                    ++v90;
                    uint64_t v89 = v93;
                  }
                  __n128 *v91 = *v90;
                }
                while (v89 <= (uint64_t)((unint64_t)(v88 - 2) >> 1));
                if (v90 == --a2)
                {
                  a5.n128_u64[0] = v124.n128_u64[0];
                  __n128 *v90 = v124;
                }
                else
                {
                  __n128 *v90 = *a2;
                  a5.n128_u64[0] = v124.n128_u64[0];
                  *a2 = v124;
                  uint64_t v94 = (char *)v90 - (char *)v14 + 16;
                  if (v94 >= 17)
                  {
                    unint64_t v95 = (((unint64_t)v94 >> 4) - 2) >> 1;
                    v96 = &v14[v95];
                    a5.n128_u64[0] = v90->n128_u64[0];
                    if (v96->n128_f64[0] < v90->n128_f64[0])
                    {
                      unint64_t v97 = v90->n128_u64[1];
                      do
                      {
                        v98 = v90;
                        v90 = v96;
                        __n128 *v98 = *v96;
                        if (!v95) {
                          break;
                        }
                        unint64_t v95 = (v95 - 1) >> 1;
                        v96 = &v14[v95];
                      }
                      while (v96->n128_f64[0] < a5.n128_f64[0]);
                      v90->n128_u64[0] = a5.n128_u64[0];
                      v90->n128_u64[1] = v97;
                    }
                  }
                }
                BOOL v79 = v88-- <= 2;
              }
              while (!v79);
            }
            return a5.n128_f64[0];
          }
          unint64_t v17 = (unint64_t)v16 >> 1;
          v18 = v14[(unint64_t)v16 >> 1].n128_f64;
          double v19 = *(double *)n128_u64;
          if ((unint64_t)v15 >= 0x801)
          {
            double v20 = *v18;
            if (*v18 >= v14->n128_f64[0])
            {
              if (v19 < v20)
              {
                __n128 v106 = *(__n128 *)v18;
                *(_OWORD *)v18 = *(_OWORD *)n128_u64;
                *(__n128 *)n128_u64 = v106;
                if (*v18 < v14->n128_f64[0])
                {
                  __n128 v107 = *v14;
                  __n128 *v14 = *(__n128 *)v18;
                  *(__n128 *)v18 = v107;
                }
              }
            }
            else
            {
              if (v19 >= v20)
              {
                __n128 v110 = *v14;
                __n128 *v14 = *(__n128 *)v18;
                *(__n128 *)v18 = v110;
                if (*(double *)n128_u64 >= *v18) {
                  goto LABEL_22;
                }
                __n128 v104 = *(__n128 *)v18;
                *(_OWORD *)v18 = *(_OWORD *)n128_u64;
              }
              else
              {
                __n128 v104 = *v14;
                __n128 *v14 = *(__n128 *)n128_u64;
              }
              *(__n128 *)n128_u64 = v104;
            }
LABEL_22:
            v22 = v14 + 1;
            v23 = &v14[v17];
            double v25 = v23[-1].n128_f64[0];
            v24 = v23 - 1;
            double v26 = v25;
            double v27 = *n128_f64;
            if (v25 >= v14[1].n128_f64[0])
            {
              if (v27 < v26)
              {
                __n128 v111 = *v24;
                __n128 *v24 = *(__n128 *)n128_f64;
                *(__n128 *)n128_f64 = v111;
                if (v24->n128_f64[0] < v22->n128_f64[0])
                {
                  __n128 v29 = *v22;
                  __n128 *v22 = *v24;
                  __n128 *v24 = v29;
                }
              }
            }
            else
            {
              if (v27 >= v26)
              {
                __n128 v30 = *v22;
                __n128 *v22 = *v24;
                __n128 *v24 = v30;
                if (*n128_f64 >= v24->n128_f64[0]) {
                  goto LABEL_34;
                }
                __n128 v113 = *v24;
                __n128 *v24 = *(__n128 *)n128_f64;
                __n128 v28 = v113;
              }
              else
              {
                __n128 v28 = *v22;
                __n128 *v22 = *(__n128 *)n128_f64;
              }
              *(__n128 *)n128_f64 = v28;
            }
LABEL_34:
            v31 = v14 + 2;
            v32 = &v14[v17];
            double v34 = v32[1].n128_f64[0];
            v33 = v32 + 1;
            double v35 = v34;
            double v36 = *v13;
            if (v34 >= v14[2].n128_f64[0])
            {
              if (v36 < v35)
              {
                __n128 v114 = *v33;
                __n128 *v33 = *(__n128 *)v13;
                *(__n128 *)v13 = v114;
                if (v33->n128_f64[0] < v31->n128_f64[0])
                {
                  __n128 v38 = *v31;
                  __n128 *v31 = *v33;
                  __n128 *v33 = v38;
                }
              }
            }
            else
            {
              if (v36 >= v35)
              {
                __n128 v39 = *v31;
                __n128 *v31 = *v33;
                __n128 *v33 = v39;
                if (*v13 >= v33->n128_f64[0]) {
                  goto LABEL_43;
                }
                __n128 v115 = *v33;
                __n128 *v33 = *(__n128 *)v13;
                __n128 v37 = v115;
              }
              else
              {
                __n128 v37 = *v31;
                __n128 *v31 = *(__n128 *)v13;
              }
              *(__n128 *)v13 = v37;
            }
LABEL_43:
            double v40 = *v18;
            double v41 = v33->n128_f64[0];
            if (*v18 >= v24->n128_f64[0])
            {
              if (v41 < v40)
              {
                __n128 v117 = *(__n128 *)v18;
                *(__n128 *)v18 = *v33;
                __n128 *v33 = v117;
                if (*v18 < v24->n128_f64[0])
                {
                  __n128 v118 = *v24;
                  __n128 *v24 = *(__n128 *)v18;
                  *(__n128 *)v18 = v118;
                }
              }
              goto LABEL_52;
            }
            if (v41 >= v40)
            {
              __n128 v119 = *v24;
              __n128 *v24 = *(__n128 *)v18;
              *(__n128 *)v18 = v119;
              if (v33->n128_f64[0] >= *v18)
              {
LABEL_52:
                __n128 v120 = *v14;
                __n128 *v14 = *(__n128 *)v18;
                a5.n128_u64[1] = v120.n128_u64[1];
                *(__n128 *)v18 = v120;
                goto LABEL_53;
              }
              __n128 v116 = *(__n128 *)v18;
              *(__n128 *)v18 = *v33;
            }
            else
            {
              __n128 v116 = *v24;
              __n128 *v24 = *v33;
            }
            __n128 *v33 = v116;
            goto LABEL_52;
          }
          double v21 = v14->n128_f64[0];
          if (v14->n128_f64[0] >= *v18)
          {
            if (v19 < v21)
            {
              __n128 v108 = *v14;
              __n128 *v14 = *(__n128 *)n128_u64;
              a5.n128_u64[1] = v108.n128_u64[1];
              *(__n128 *)n128_u64 = v108;
              if (v14->n128_f64[0] < *v18)
              {
                __n128 v109 = *(__n128 *)v18;
                *(__n128 *)v18 = *v14;
                a5.n128_u64[1] = v109.n128_u64[1];
                __n128 *v14 = v109;
              }
            }
          }
          else
          {
            if (v19 < v21)
            {
              __n128 v105 = *(__n128 *)v18;
              *(_OWORD *)v18 = *(_OWORD *)n128_u64;
LABEL_30:
              a5.n128_u64[1] = v105.n128_u64[1];
              *(__n128 *)n128_u64 = v105;
              goto LABEL_53;
            }
            __n128 v112 = *(__n128 *)v18;
            *(__n128 *)v18 = *v14;
            a5.n128_u64[1] = v112.n128_u64[1];
            __n128 *v14 = v112;
            if (*(double *)n128_u64 < v14->n128_f64[0])
            {
              __n128 v105 = *v14;
              __n128 *v14 = *(__n128 *)n128_u64;
              goto LABEL_30;
            }
          }
LABEL_53:
          --a3;
          a5.n128_u64[0] = v14->n128_u64[0];
          if ((a4 & 1) != 0 || v14[-1].n128_f64[0] < a5.n128_f64[0]) {
            break;
          }
          if (a5.n128_f64[0] < *(double *)n128_u64)
          {
            do
            {
              double v55 = v14[1].n128_f64[0];
              ++v14;
            }
            while (a5.n128_f64[0] >= v55);
          }
          else
          {
            v56 = v14 + 1;
            do
            {
              v14 = v56;
              if (v56 >= a2) {
                break;
              }
              ++v56;
            }
            while (a5.n128_f64[0] >= v14->n128_f64[0]);
          }
          v57 = a2;
          if (v14 < a2)
          {
            v57 = a2;
            do
            {
              double v58 = v57[-1].n128_f64[0];
              --v57;
            }
            while (a5.n128_f64[0] < v58);
          }
          unint64_t v59 = a1->n128_u64[1];
          while (v14 < v57)
          {
            __n128 v121 = *v14;
            __n128 *v14 = *v57;
            __n128 *v57 = v121;
            do
            {
              double v60 = v14[1].n128_f64[0];
              ++v14;
            }
            while (a5.n128_f64[0] >= v60);
            do
            {
              double v61 = v57[-1].n128_f64[0];
              --v57;
            }
            while (a5.n128_f64[0] < v61);
          }
          BOOL v5 = &v14[-1] >= a1;
          BOOL v6 = &v14[-1] == a1;
          if (&v14[-1] != a1) {
            *a1 = v14[-1];
          }
          a4 = 0;
          v14[-1].n128_u64[0] = a5.n128_u64[0];
          v14[-1].n128_u64[1] = v59;
        }
        unint64_t v42 = v14->n128_u64[1];
        v43 = v14;
        do
        {
          v44 = v43;
          double v45 = v43[1].n128_f64[0];
          ++v43;
        }
        while (v45 < a5.n128_f64[0]);
        v46 = a2;
        if (v44 == v14)
        {
          v46 = a2;
          do
          {
            if (v43 >= v46) {
              break;
            }
            double v48 = v46[-1].n128_f64[0];
            --v46;
          }
          while (v48 >= a5.n128_f64[0]);
        }
        else
        {
          do
          {
            double v47 = v46[-1].n128_f64[0];
            --v46;
          }
          while (v47 >= a5.n128_f64[0]);
        }
        v14 = v43;
        if (v43 < v46)
        {
          v49 = v46;
          do
          {
            __n128 v50 = *v14;
            __n128 *v14 = *v49;
            __n128 *v49 = v50;
            do
            {
              double v51 = v14[1].n128_f64[0];
              ++v14;
            }
            while (v51 < a5.n128_f64[0]);
            do
            {
              double v52 = v49[-1].n128_f64[0];
              --v49;
            }
            while (v52 >= a5.n128_f64[0]);
          }
          while (v14 < v49);
        }
        if (&v14[-1] != a1) {
          *a1 = v14[-1];
        }
        v14[-1].n128_u64[0] = a5.n128_u64[0];
        v14[-1].n128_u64[1] = v42;
        if (v43 >= v46) {
          break;
        }
LABEL_74:
        std::__introsort<std::_ClassicAlgPolicy,[(LabelNavRouteLabeler(Debug) *)a1 drawNavOverlayDebugView:a3 navContext:a4 & 1];
        a4 = 0;
      }
      BOOL v53 = std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,-[LabelNavRouteLabeler(Debug) drawNavOverlayDebugView:navContext:]::$_0 &,gm::Range<double> *>(a1, v14 - 1, a5);
      if (std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,-[LabelNavRouteLabeler(Debug) drawNavOverlayDebugView:navContext:]::$_0 &,gm::Range<double> *>(v14, a2, v54))
      {
        break;
      }
      if (!v53) {
        goto LABEL_74;
      }
    }
    a2 = v14 - 1;
    if (!v53) {
      continue;
    }
    return a5.n128_f64[0];
  }
}

@end