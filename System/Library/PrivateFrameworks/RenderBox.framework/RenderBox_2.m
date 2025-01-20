void std::__introsort<std::_ClassicAlgPolicy,RB::Path::ClipStroke::make_keyframes(std::span<RB::Path::ClipStroke::Keyframe const,18446744073709551615ul>,RB::Path::ClipStroke::Subpath const&,RB::vector<RB::Path::ClipStroke::SingleKeyframe,0ul,unsigned long> &,double &)::$_0 &,RB::Path::ClipStroke::SingleKeyframe*,false>(unint64_t a1, unint64_t a2, uint64_t a3, char a4)
{
  BOOL v4;
  BOOL v5;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  long long *v16;
  long long *v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  double v21;
  unint64_t v22;
  unint64_t v23;
  double v24;
  double v25;
  unint64_t v26;
  long long v27;
  double v28;
  double v29;
  long long v30;
  BOOL v31;
  double v32;
  unint64_t v33;
  unint64_t v34;
  double v35;
  long long v36;
  double v37;
  double v38;
  long long v39;
  unint64_t v40;
  double v41;
  long long v42;
  long long *v43;
  long long *v44;
  long long *v45;
  unint64_t v46;
  double v47;
  long long v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  long long v52;
  uint64_t v53;
  long long v54;
  unint64_t v55;
  BOOL v57;
  uint64_t v58;
  unint64_t v59;
  unint64_t v60;
  double v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  int64_t v65;
  int64_t v66;
  int64_t v67;
  uint64_t v68;
  unint64_t v69;
  unint64_t v70;
  double v71;
  unint64_t v72;
  long long v73;
  uint64_t v74;
  uint64_t v75;
  int64_t v76;
  uint64_t v77;
  unint64_t v78;
  unint64_t v79;
  uint64_t v80;
  int64_t v81;
  long long v82;
  long long v83;
  uint64_t v84;
  unint64_t v85;
  unint64_t v86;
  double v87;
  unint64_t v88;
  long long v89;
  unint64_t v91;
  double v92;
  unint64_t v93;
  double v94;
  long long v95;
  long long v96;
  long long v97;
  long long v98;
  long long v99;
  long long v100;
  long long v101;
  long long v102;
  long long v103;
  long long v104;
  long long v105;
  long long v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t vars8;

  while (2)
  {
    v10 = a1;
    while (1)
    {
      while (1)
      {
        while (1)
        {
          a1 = v10;
          v11 = a2 - v10;
          v12 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(a2 - v10) >> 3);
          if (v5 || !v4)
          {
            switch(v12)
            {
              case 0uLL:
              case 1uLL:
                return;
              case 2uLL:
                v41 = *(double *)(a2 - 24);
                v40 = a2 - 24;
                if (v41 < *(double *)v10)
                {
                  v110 = *(void *)(v10 + 16);
                  v101 = *(_OWORD *)v10;
                  v42 = *(_OWORD *)v40;
                  *(void *)(v10 + 16) = *(void *)(v40 + 16);
                  *(_OWORD *)v10 = v42;
                  *(void *)(v40 + 16) = v110;
                  *(_OWORD *)v40 = v101;
                }
                break;
              case 3uLL:
                std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,RB::Path::ClipStroke::make_keyframes(std::span<RB::Path::ClipStroke::Keyframe const,18446744073709551615ul>,RB::Path::ClipStroke::Subpath const&,RB::vector<RB::Path::ClipStroke::SingleKeyframe,0ul,unsigned long> &,double &)::$_0 &,RB::Path::ClipStroke::SingleKeyframe*>((long long *)v10, (long long *)(v10 + 24), (long long *)(a2 - 24));
                break;
              case 4uLL:
                std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,RB::Path::ClipStroke::make_keyframes(std::span<RB::Path::ClipStroke::Keyframe const,18446744073709551615ul>,RB::Path::ClipStroke::Subpath const&,RB::vector<RB::Path::ClipStroke::SingleKeyframe,0ul,unsigned long> &,double &)::$_0 &,RB::Path::ClipStroke::SingleKeyframe*>(v10, v10 + 24, v10 + 48, (unint64_t *)(a2 - 24));
                break;
              case 5uLL:
                v43 = (long long *)(v10 + 24);
                v44 = (long long *)(v10 + 48);
                v45 = (long long *)(v10 + 72);
                std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,RB::Path::ClipStroke::make_keyframes(std::span<RB::Path::ClipStroke::Keyframe const,18446744073709551615ul>,RB::Path::ClipStroke::Subpath const&,RB::vector<RB::Path::ClipStroke::SingleKeyframe,0ul,unsigned long> &,double &)::$_0 &,RB::Path::ClipStroke::SingleKeyframe*>(v10, v10 + 24, v10 + 48, (unint64_t *)(v10 + 72));
                v47 = *(double *)(a2 - 24);
                v46 = a2 - 24;
                if (v47 < *(double *)(v10 + 72))
                {
                  v48 = *v45;
                  v49 = *(void *)(v10 + 88);
                  v50 = *(void *)(v46 + 16);
                  *v45 = *(_OWORD *)v46;
                  *(void *)(v10 + 88) = v50;
                  *(void *)(v46 + 16) = v49;
                  *(_OWORD *)v46 = v48;
                  if (*(double *)v45 < *(double *)v44)
                  {
                    v51 = *(void *)(v10 + 64);
                    v52 = *v44;
                    *v44 = *v45;
                    *(void *)(v10 + 64) = *(void *)(v10 + 88);
                    *v45 = v52;
                    *(void *)(v10 + 88) = v51;
                    if (*(double *)v44 < *(double *)v43)
                    {
                      v53 = *(void *)(v10 + 40);
                      v54 = *v43;
                      *v43 = *v44;
                      *(void *)(v10 + 40) = *(void *)(v10 + 64);
                      *v44 = v54;
                      *(void *)(v10 + 64) = v53;
                      if (*(double *)(v10 + 24) < *(double *)v10)
                      {
                        v111 = *(void *)(v10 + 16);
                        v102 = *(_OWORD *)v10;
                        *(_OWORD *)v10 = *v43;
                        *(void *)(v10 + 16) = *(void *)(v10 + 40);
                        *v43 = v102;
                        *(void *)(v10 + 40) = v111;
                      }
                    }
                  }
                }
                break;
              default:
                JUMPOUT(0);
            }
            return;
          }
          if (v11 <= 575)
          {
            v55 = v10 + 24;
            v57 = v10 == a2 || v55 == a2;
            if (a4)
            {
              if (!v57)
              {
                v58 = 0;
                v59 = v10;
                do
                {
                  v60 = v55;
                  v61 = *(double *)(v59 + 24);
                  if (v61 < *(double *)v59)
                  {
                    v103 = *(_OWORD *)(v59 + 32);
                    v62 = v58;
                    while (1)
                    {
                      v63 = v10 + v62;
                      *(_OWORD *)(v63 + 24) = *(_OWORD *)(v10 + v62);
                      *(void *)(v63 + 40) = *(void *)(v10 + v62 + 16);
                      if (!v62) {
                        break;
                      }
                      v62 -= 24;
                      if (v61 >= *(double *)(v63 - 24))
                      {
                        v64 = v10 + v62 + 24;
                        goto LABEL_80;
                      }
                    }
                    v64 = v10;
LABEL_80:
                    *(double *)v64 = v61;
                    *(_OWORD *)(v64 + 8) = v103;
                  }
                  v55 = v60 + 24;
                  v58 += 24;
                  v59 = v60;
                }
                while (v60 + 24 != a2);
              }
            }
            else if (!v57)
            {
              do
              {
                v91 = v55;
                v92 = *(double *)(a1 + 24);
                if (v92 < *(double *)a1)
                {
                  v106 = *(_OWORD *)(a1 + 32);
                  v93 = v55;
                  do
                  {
                    *(_OWORD *)v93 = *(_OWORD *)(v93 - 24);
                    *(void *)(v93 + 16) = *(void *)(v93 - 8);
                    v94 = *(double *)(v93 - 48);
                    v93 -= 24;
                  }
                  while (v92 < v94);
                  *(double *)v93 = v92;
                  *(_OWORD *)(v93 + 8) = v106;
                }
                v55 += 24;
                a1 = v91;
              }
              while (v91 + 24 != a2);
            }
            return;
          }
          if (!a3)
          {
            if (v10 != a2)
            {
              v65 = (v12 - 2) >> 1;
              v66 = v65;
              do
              {
                v67 = v66;
                if (v65 >= v66)
                {
                  v68 = (2 * v66) | 1;
                  v69 = v10 + 24 * v68;
                  if (2 * v67 + 2 < (uint64_t)v12 && *(double *)v69 < *(double *)(v69 + 24))
                  {
                    v69 += 24;
                    v68 = 2 * v67 + 2;
                  }
                  v70 = v10 + 24 * v67;
                  v71 = *(double *)v70;
                  if (*(double *)v69 >= *(double *)v70)
                  {
                    v104 = *(_OWORD *)(v70 + 8);
                    do
                    {
                      v72 = v70;
                      v70 = v69;
                      v73 = *(_OWORD *)v69;
                      *(void *)(v72 + 16) = *(void *)(v69 + 16);
                      *(_OWORD *)v72 = v73;
                      if (v65 < v68) {
                        break;
                      }
                      v74 = 2 * v68;
                      v68 = (2 * v68) | 1;
                      v69 = v10 + 24 * v68;
                      v75 = v74 + 2;
                      if (v75 < (uint64_t)v12 && *(double *)v69 < *(double *)(v69 + 24))
                      {
                        v69 += 24;
                        v68 = v75;
                      }
                    }
                    while (*(double *)v69 >= v71);
                    *(double *)v70 = v71;
                    *(_OWORD *)(v70 + 8) = v104;
                  }
                }
                v66 = v67 - 1;
              }
              while (v67);
              v76 = v11 / 0x18uLL;
              do
              {
                v77 = 0;
                v112 = *(void *)(v10 + 16);
                v105 = *(_OWORD *)v10;
                v78 = v10;
                do
                {
                  v79 = v78;
                  v78 += 24 * v77 + 24;
                  v80 = 2 * v77;
                  v77 = (2 * v77) | 1;
                  v81 = v80 + 2;
                  if (v81 < v76 && *(double *)v78 < *(double *)(v78 + 24))
                  {
                    v78 += 24;
                    v77 = v81;
                  }
                  v82 = *(_OWORD *)v78;
                  *(void *)(v79 + 16) = *(void *)(v78 + 16);
                  *(_OWORD *)v79 = v82;
                }
                while (v77 <= (uint64_t)((unint64_t)(v76 - 2) >> 1));
                a2 -= 24;
                if (v78 == a2)
                {
                  *(void *)(v78 + 16) = v112;
                  *(_OWORD *)v78 = v105;
                }
                else
                {
                  v83 = *(_OWORD *)a2;
                  *(void *)(v78 + 16) = *(void *)(a2 + 16);
                  *(_OWORD *)v78 = v83;
                  *(void *)(a2 + 16) = v112;
                  *(_OWORD *)a2 = v105;
                  v84 = v78 - v10 + 24;
                  if (v84 >= 25)
                  {
                    v85 = (v84 / 0x18uLL - 2) >> 1;
                    v86 = v10 + 24 * v85;
                    v87 = *(double *)v78;
                    if (*(double *)v86 < *(double *)v78)
                    {
                      v97 = *(_OWORD *)(v78 + 8);
                      do
                      {
                        v88 = v78;
                        v78 = v86;
                        v89 = *(_OWORD *)v86;
                        *(void *)(v88 + 16) = *(void *)(v86 + 16);
                        *(_OWORD *)v88 = v89;
                        if (!v85) {
                          break;
                        }
                        v85 = (v85 - 1) >> 1;
                        v86 = v10 + 24 * v85;
                      }
                      while (*(double *)v86 < v87);
                      *(double *)v78 = v87;
                      *(_OWORD *)(v78 + 8) = v97;
                    }
                  }
                }
              }
              while (v76-- > 2);
            }
            return;
          }
          v13 = v12 >> 1;
          v14 = v10 + 24 * (v12 >> 1);
          if ((unint64_t)v11 >= 0xC01)
          {
            std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,RB::Path::ClipStroke::make_keyframes(std::span<RB::Path::ClipStroke::Keyframe const,18446744073709551615ul>,RB::Path::ClipStroke::Subpath const&,RB::vector<RB::Path::ClipStroke::SingleKeyframe,0ul,unsigned long> &,double &)::$_0 &,RB::Path::ClipStroke::SingleKeyframe*>((long long *)a1, (long long *)(a1 + 24 * (v12 >> 1)), (long long *)(a2 - 24));
            v15 = 3 * v13;
            v16 = (long long *)(a1 + 24 * v13 - 24);
            std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,RB::Path::ClipStroke::make_keyframes(std::span<RB::Path::ClipStroke::Keyframe const,18446744073709551615ul>,RB::Path::ClipStroke::Subpath const&,RB::vector<RB::Path::ClipStroke::SingleKeyframe,0ul,unsigned long> &,double &)::$_0 &,RB::Path::ClipStroke::SingleKeyframe*>((long long *)(a1 + 24), v16, (long long *)(a2 - 48));
            v17 = (long long *)(a1 + 24 + 8 * v15);
            std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,RB::Path::ClipStroke::make_keyframes(std::span<RB::Path::ClipStroke::Keyframe const,18446744073709551615ul>,RB::Path::ClipStroke::Subpath const&,RB::vector<RB::Path::ClipStroke::SingleKeyframe,0ul,unsigned long> &,double &)::$_0 &,RB::Path::ClipStroke::SingleKeyframe*>((long long *)(a1 + 48), v17, (long long *)(a2 - 72));
            std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,RB::Path::ClipStroke::make_keyframes(std::span<RB::Path::ClipStroke::Keyframe const,18446744073709551615ul>,RB::Path::ClipStroke::Subpath const&,RB::vector<RB::Path::ClipStroke::SingleKeyframe,0ul,unsigned long> &,double &)::$_0 &,RB::Path::ClipStroke::SingleKeyframe*>(v16, (long long *)v14, v17);
            v107 = *(void *)(a1 + 16);
            v98 = *(_OWORD *)a1;
            v18 = *(void *)(v14 + 16);
            *(_OWORD *)a1 = *(_OWORD *)v14;
            *(void *)(a1 + 16) = v18;
            *(void *)(v14 + 16) = v107;
            *(_OWORD *)v14 = v98;
          }
          else
          {
            std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,RB::Path::ClipStroke::make_keyframes(std::span<RB::Path::ClipStroke::Keyframe const,18446744073709551615ul>,RB::Path::ClipStroke::Subpath const&,RB::vector<RB::Path::ClipStroke::SingleKeyframe,0ul,unsigned long> &,double &)::$_0 &,RB::Path::ClipStroke::SingleKeyframe*>((long long *)(a1 + 24 * (v12 >> 1)), (long long *)a1, (long long *)(a2 - 24));
          }
          --a3;
          v19 = *(double *)a1;
          if ((a4 & 1) != 0 || *(double *)(a1 - 24) < v19) {
            break;
          }
          v96 = *(_OWORD *)(a1 + 8);
          if (v19 >= *(double *)(a2 - 24))
          {
            v33 = a1 + 24;
            do
            {
              v10 = v33;
              if (v33 >= a2) {
                break;
              }
              v33 += 24;
            }
            while (v19 >= *(double *)v10);
          }
          else
          {
            v10 = a1;
            do
            {
              v32 = *(double *)(v10 + 24);
              v10 += 24;
            }
            while (v19 >= v32);
          }
          v34 = a2;
          if (v10 < a2)
          {
            v34 = a2;
            do
            {
              v35 = *(double *)(v34 - 24);
              v34 -= 24;
            }
            while (v19 < v35);
          }
          while (v10 < v34)
          {
            v109 = *(void *)(v10 + 16);
            v100 = *(_OWORD *)v10;
            v36 = *(_OWORD *)v34;
            *(void *)(v10 + 16) = *(void *)(v34 + 16);
            *(_OWORD *)v10 = v36;
            *(void *)(v34 + 16) = v109;
            *(_OWORD *)v34 = v100;
            do
            {
              v37 = *(double *)(v10 + 24);
              v10 += 24;
            }
            while (v19 >= v37);
            do
            {
              v38 = *(double *)(v34 - 24);
              v34 -= 24;
            }
            while (v19 < v38);
          }
          v4 = v10 - 24 >= a1;
          v5 = v10 - 24 == a1;
          if (v10 - 24 != a1)
          {
            v39 = *(_OWORD *)(v10 - 24);
            *(void *)(a1 + 16) = *(void *)(v10 - 8);
            *(_OWORD *)a1 = v39;
          }
          a4 = 0;
          *(double *)(v10 - 24) = v19;
          *(_OWORD *)(v10 - 16) = v96;
        }
        v20 = 0;
        v95 = *(_OWORD *)(a1 + 8);
        do
        {
          v21 = *(double *)(a1 + v20 + 24);
          v20 += 24;
        }
        while (v21 < v19);
        v22 = a1 + v20;
        v23 = a2;
        if (v20 == 24)
        {
          v23 = a2;
          do
          {
            if (v22 >= v23) {
              break;
            }
            v25 = *(double *)(v23 - 24);
            v23 -= 24;
          }
          while (v25 >= v19);
        }
        else
        {
          do
          {
            v24 = *(double *)(v23 - 24);
            v23 -= 24;
          }
          while (v24 >= v19);
        }
        v10 = a1 + v20;
        if (v22 < v23)
        {
          v26 = v23;
          do
          {
            v108 = *(void *)(v10 + 16);
            v99 = *(_OWORD *)v10;
            v27 = *(_OWORD *)v26;
            *(void *)(v10 + 16) = *(void *)(v26 + 16);
            *(_OWORD *)v10 = v27;
            *(void *)(v26 + 16) = v108;
            *(_OWORD *)v26 = v99;
            do
            {
              v28 = *(double *)(v10 + 24);
              v10 += 24;
            }
            while (v28 < v19);
            do
            {
              v29 = *(double *)(v26 - 24);
              v26 -= 24;
            }
            while (v29 >= v19);
          }
          while (v10 < v26);
        }
        if (v10 - 24 != a1)
        {
          v30 = *(_OWORD *)(v10 - 24);
          *(void *)(a1 + 16) = *(void *)(v10 - 8);
          *(_OWORD *)a1 = v30;
        }
        *(double *)(v10 - 24) = v19;
        *(_OWORD *)(v10 - 16) = v95;
        if (v22 >= v23) {
          break;
        }
LABEL_30:
        std::__introsort<std::_ClassicAlgPolicy,RB::Path::ClipStroke::make_keyframes(std::span<RB::Path::ClipStroke::Keyframe const,18446744073709551615ul>,RB::Path::ClipStroke::Subpath const&,RB::vector<RB::Path::ClipStroke::SingleKeyframe,0ul,unsigned long> &,double &)::$_0 &,RB::Path::ClipStroke::SingleKeyframe*,false>(a1, v10 - 24, a3, a4 & 1);
        a4 = 0;
      }
      v31 = std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,RB::Path::ClipStroke::make_keyframes(std::span<RB::Path::ClipStroke::Keyframe const,18446744073709551615ul>,RB::Path::ClipStroke::Subpath const&,RB::vector<RB::Path::ClipStroke::SingleKeyframe,0ul,unsigned long> &,double &)::$_0 &,RB::Path::ClipStroke::SingleKeyframe*>(a1, v10 - 24);
      if (std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,RB::Path::ClipStroke::make_keyframes(std::span<RB::Path::ClipStroke::Keyframe const,18446744073709551615ul>,RB::Path::ClipStroke::Subpath const&,RB::vector<RB::Path::ClipStroke::SingleKeyframe,0ul,unsigned long> &,double &)::$_0 &,RB::Path::ClipStroke::SingleKeyframe*>(v10, a2))
      {
        break;
      }
      if (!v31) {
        goto LABEL_30;
      }
    }
    a2 = v10 - 24;
    if (!v31) {
      continue;
    }
    break;
  }
}

long long *std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,RB::Path::ClipStroke::make_keyframes(std::span<RB::Path::ClipStroke::Keyframe const,18446744073709551615ul>,RB::Path::ClipStroke::Subpath const&,RB::vector<RB::Path::ClipStroke::SingleKeyframe,0ul,unsigned long> &,double &)::$_0 &,RB::Path::ClipStroke::SingleKeyframe*>(long long *result, long long *a2, long long *a3)
{
  double v3 = *(double *)a2;
  double v4 = *(double *)a3;
  if (*(double *)a2 >= *(double *)result)
  {
    if (v4 < v3)
    {
      uint64_t v8 = *((void *)a2 + 2);
      long long v9 = *a2;
      uint64_t v10 = *((void *)a3 + 2);
      *a2 = *a3;
      *((void *)a2 + 2) = v10;
      *a3 = v9;
      *((void *)a3 + 2) = v8;
      if (*(double *)a2 < *(double *)result)
      {
        uint64_t v11 = *((void *)result + 2);
        long long v12 = *result;
        uint64_t v13 = *((void *)a2 + 2);
        *result = *a2;
        *((void *)result + 2) = v13;
        *a2 = v12;
        *((void *)a2 + 2) = v11;
      }
    }
  }
  else
  {
    if (v4 >= v3)
    {
      uint64_t v14 = *((void *)result + 2);
      long long v15 = *result;
      uint64_t v16 = *((void *)a2 + 2);
      *result = *a2;
      *((void *)result + 2) = v16;
      *a2 = v15;
      *((void *)a2 + 2) = v14;
      if (*(double *)a3 >= *(double *)a2) {
        return result;
      }
      uint64_t v5 = *((void *)a2 + 2);
      long long v6 = *a2;
      uint64_t v17 = *((void *)a3 + 2);
      *a2 = *a3;
      *((void *)a2 + 2) = v17;
    }
    else
    {
      uint64_t v5 = *((void *)result + 2);
      long long v6 = *result;
      uint64_t v7 = *((void *)a3 + 2);
      *result = *a3;
      *((void *)result + 2) = v7;
    }
    *a3 = v6;
    *((void *)a3 + 2) = v5;
  }
  return result;
}

BOOL std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,RB::Path::ClipStroke::make_keyframes(std::span<RB::Path::ClipStroke::Keyframe const,18446744073709551615ul>,RB::Path::ClipStroke::Subpath const&,RB::vector<RB::Path::ClipStroke::SingleKeyframe,0ul,unsigned long> &,double &)::$_0 &,RB::Path::ClipStroke::SingleKeyframe*>(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (a2 - a1) >> 3;
  BOOL result = 1;
  switch(0xAAAAAAAAAAAAAAABLL * v4)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      long long v6 = (long long *)(a2 - 24);
      if (*(double *)(a2 - 24) < *(double *)a1)
      {
        uint64_t v7 = *(void *)(a1 + 16);
        long long v8 = *(_OWORD *)a1;
        uint64_t v9 = *(void *)(a2 - 8);
        *(_OWORD *)a1 = *v6;
        *(void *)(a1 + 16) = v9;
        *long long v6 = v8;
        *(void *)(a2 - 8) = v7;
      }
      return result;
    case 3uLL:
      std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,RB::Path::ClipStroke::make_keyframes(std::span<RB::Path::ClipStroke::Keyframe const,18446744073709551615ul>,RB::Path::ClipStroke::Subpath const&,RB::vector<RB::Path::ClipStroke::SingleKeyframe,0ul,unsigned long> &,double &)::$_0 &,RB::Path::ClipStroke::SingleKeyframe*>((long long *)a1, (long long *)(a1 + 24), (long long *)(a2 - 24));
      return 1;
    case 4uLL:
      std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,RB::Path::ClipStroke::make_keyframes(std::span<RB::Path::ClipStroke::Keyframe const,18446744073709551615ul>,RB::Path::ClipStroke::Subpath const&,RB::vector<RB::Path::ClipStroke::SingleKeyframe,0ul,unsigned long> &,double &)::$_0 &,RB::Path::ClipStroke::SingleKeyframe*>(a1, a1 + 24, a1 + 48, (unint64_t *)(a2 - 24));
      return 1;
    case 5uLL:
      v18 = (long long *)(a1 + 24);
      v19 = (long long *)(a1 + 48);
      v20 = (long long *)(a1 + 72);
      std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,RB::Path::ClipStroke::make_keyframes(std::span<RB::Path::ClipStroke::Keyframe const,18446744073709551615ul>,RB::Path::ClipStroke::Subpath const&,RB::vector<RB::Path::ClipStroke::SingleKeyframe,0ul,unsigned long> &,double &)::$_0 &,RB::Path::ClipStroke::SingleKeyframe*>(a1, a1 + 24, a1 + 48, (unint64_t *)(a1 + 72));
      double v22 = *(double *)(a2 - 24);
      uint64_t v21 = a2 - 24;
      if (v22 < *(double *)(a1 + 72))
      {
        uint64_t v23 = *(void *)(a1 + 88);
        long long v24 = *v20;
        uint64_t v25 = *(void *)(v21 + 16);
        long long *v20 = *(_OWORD *)v21;
        *(void *)(a1 + 88) = v25;
        *(_OWORD *)uint64_t v21 = v24;
        *(void *)(v21 + 16) = v23;
        if (*(double *)v20 < *(double *)v19)
        {
          uint64_t v26 = *(void *)(a1 + 64);
          long long v27 = *v19;
          long long *v19 = *v20;
          *(void *)(a1 + 64) = *(void *)(a1 + 88);
          long long *v20 = v27;
          *(void *)(a1 + 88) = v26;
          if (*(double *)v19 < *(double *)v18)
          {
            uint64_t v28 = *(void *)(a1 + 40);
            long long v29 = *v18;
            long long *v18 = *v19;
            *(void *)(a1 + 40) = *(void *)(a1 + 64);
            long long *v19 = v29;
            *(void *)(a1 + 64) = v28;
            if (*(double *)(a1 + 24) < *(double *)a1)
            {
              uint64_t v30 = *(void *)(a1 + 16);
              long long v31 = *(_OWORD *)a1;
              *(_OWORD *)a1 = *v18;
              *(void *)(a1 + 16) = *(void *)(a1 + 40);
              long long *v18 = v31;
              *(void *)(a1 + 40) = v30;
            }
          }
        }
      }
      return 1;
    default:
      uint64_t v10 = (double *)(a1 + 48);
      std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,RB::Path::ClipStroke::make_keyframes(std::span<RB::Path::ClipStroke::Keyframe const,18446744073709551615ul>,RB::Path::ClipStroke::Subpath const&,RB::vector<RB::Path::ClipStroke::SingleKeyframe,0ul,unsigned long> &,double &)::$_0 &,RB::Path::ClipStroke::SingleKeyframe*>((long long *)a1, (long long *)(a1 + 24), (long long *)(a1 + 48));
      uint64_t v11 = a1 + 72;
      if (a1 + 72 == a2) {
        return 1;
      }
      uint64_t v12 = 0;
      int v13 = 0;
      break;
  }
  while (1)
  {
    double v14 = *(double *)v11;
    if (*(double *)v11 < *v10)
    {
      long long v32 = *(_OWORD *)(v11 + 8);
      uint64_t v15 = v12;
      while (1)
      {
        uint64_t v16 = a1 + v15;
        *(_OWORD *)(v16 + 72) = *(_OWORD *)(a1 + v15 + 48);
        *(void *)(v16 + 88) = *(void *)(a1 + v15 + 64);
        if (v15 == -48) {
          break;
        }
        v15 -= 24;
        if (v14 >= *(double *)(v16 + 24))
        {
          uint64_t v17 = a1 + v15 + 72;
          goto LABEL_12;
        }
      }
      uint64_t v17 = a1;
LABEL_12:
      *(double *)uint64_t v17 = v14;
      *(_OWORD *)(v17 + 8) = v32;
      if (++v13 == 8) {
        return v11 + 24 == a2;
      }
    }
    uint64_t v10 = (double *)v11;
    v12 += 24;
    v11 += 24;
    if (v11 == a2) {
      return 1;
    }
  }
}

__n128 std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,RB::Path::ClipStroke::make_keyframes(std::span<RB::Path::ClipStroke::Keyframe const,18446744073709551615ul>,RB::Path::ClipStroke::Subpath const&,RB::vector<RB::Path::ClipStroke::SingleKeyframe,0ul,unsigned long> &,double &)::$_0 &,RB::Path::ClipStroke::SingleKeyframe*>(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,RB::Path::ClipStroke::make_keyframes(std::span<RB::Path::ClipStroke::Keyframe const,18446744073709551615ul>,RB::Path::ClipStroke::Subpath const&,RB::vector<RB::Path::ClipStroke::SingleKeyframe,0ul,unsigned long> &,double &)::$_0 &,RB::Path::ClipStroke::SingleKeyframe*>((long long *)a1, (long long *)a2, (long long *)a3);
  result.n128_u64[0] = *a4;
  if (*(double *)a4 < *(double *)a3)
  {
    unint64_t v9 = *(void *)(a3 + 16);
    __n128 result = *(__n128 *)a3;
    unint64_t v10 = a4[2];
    *(_OWORD *)a3 = *(_OWORD *)a4;
    *(void *)(a3 + 16) = v10;
    *(__n128 *)a4 = result;
    a4[2] = v9;
    result.n128_u64[0] = *(void *)a3;
    if (*(double *)a3 < *(double *)a2)
    {
      uint64_t v11 = *(void *)(a2 + 16);
      __n128 result = *(__n128 *)a2;
      uint64_t v12 = *(void *)(a3 + 16);
      *(_OWORD *)a2 = *(_OWORD *)a3;
      *(void *)(a2 + 16) = v12;
      *(__n128 *)a3 = result;
      *(void *)(a3 + 16) = v11;
      result.n128_u64[0] = *(void *)a2;
      if (*(double *)a2 < *(double *)a1)
      {
        uint64_t v13 = *(void *)(a1 + 16);
        __n128 result = *(__n128 *)a1;
        uint64_t v14 = *(void *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(void *)(a1 + 16) = v14;
        *(__n128 *)a2 = result;
        *(void *)(a2 + 16) = v13;
      }
    }
  }
  return result;
}

void RB::Path::ClipStroke::Subpath::add<CG::LineSegment>(RB::Path::ClipStroke::Subpath *this, float64x2_t *a2, void *a3, double a4, double a5, double a6, double a7)
{
  double v8 = a5 + a4;
  if (a6 < a4) {
    a6 = a4;
  }
  if (a6 <= v8) {
    double v9 = a6;
  }
  else {
    double v9 = v8;
  }
  if (a7 >= a4) {
    double v10 = a7;
  }
  else {
    double v10 = a4;
  }
  if (v10 > v8) {
    double v10 = v8;
  }
  double v11 = v10 - v9;
  if (v10 - v9 >= 0.0001)
  {
    double v15 = v10 - a4;
    double v16 = 0.0;
    if (v9 - a4 >= 0.0001) {
      double v16 = CG::LineSegment::index(a2, v9 - a4);
    }
    double v17 = 1.0;
    if (v15 <= a5 + -0.0001) {
      double v17 = CG::LineSegment::index(a2, v15);
    }
    if (v16 <= 0.0001 && v17 >= 0.9999)
    {
      double v18 = RB::Path::ClipStroke::Subpath::add(this, a2, a5);
      double v11 = a5;
      if (!a3) {
        return;
      }
LABEL_26:
      RB::Path::ClipStroke::DistanceMap::append(a3, v9, v18, v11);
      return;
    }
    float64x2_t v19 = a2[1];
    float64x2_t v21 = *a2;
    float64x2_t v22 = v19;
    if (v16 <= 0.0001)
    {
      if (v17 >= 0.9999) {
        goto LABEL_25;
      }
    }
    else
    {
      CG::LineSegment::split(&v21, v16, (uint64_t)v20);
      float64x2_t v21 = (float64x2_t)v20[2];
      float64x2_t v22 = (float64x2_t)v20[3];
      if (v17 >= 0.9999) {
        goto LABEL_25;
      }
      double v17 = (v17 - v16) / (1.0 - v16);
    }
    CG::LineSegment::split(&v21, v17, (uint64_t)v20);
    float64x2_t v21 = (float64x2_t)v20[0];
    float64x2_t v22 = (float64x2_t)v20[1];
LABEL_25:
    double v18 = RB::Path::ClipStroke::Subpath::add(this, &v21, INFINITY);
    if (!a3) {
      return;
    }
    goto LABEL_26;
  }
}

void RB::Path::ClipStroke::Subpath::add<CG::Quadratic>(__n128 *this, CG::Quadratic *a2, void *a3, double a4, double a5, double a6, double a7)
{
  double v8 = a5 + a4;
  if (a6 < a4) {
    a6 = a4;
  }
  if (a6 <= v8) {
    double v9 = a6;
  }
  else {
    double v9 = v8;
  }
  if (a7 >= a4) {
    double v10 = a7;
  }
  else {
    double v10 = a4;
  }
  if (v10 > v8) {
    double v10 = v8;
  }
  double v11 = v10 - v9;
  if (v10 - v9 >= 0.0001)
  {
    double v15 = v10 - a4;
    double v16 = 0.0;
    if (v9 - a4 >= 0.0001)
    {
      CG::Quadratic::index((double *)a2, v9 - a4);
      double v16 = v17;
    }
    double v18 = 1.0;
    if (v15 <= a5 + -0.0001)
    {
      CG::Quadratic::index((double *)a2, v15);
      double v18 = v19;
    }
    if (v16 <= 0.0001 && v18 >= 0.9999)
    {
      double v20 = RB::Path::ClipStroke::Subpath::add(this, a2, a5);
      double v11 = a5;
      if (!a3) {
        return;
      }
LABEL_26:
      RB::Path::ClipStroke::DistanceMap::append(a3, v9, v20, v11);
      return;
    }
    long long v21 = *((_OWORD *)a2 + 3);
    long long v26 = *((_OWORD *)a2 + 2);
    long long v27 = v21;
    long long v28 = *((_OWORD *)a2 + 4);
    long long v22 = *((_OWORD *)a2 + 1);
    long long v24 = *(_OWORD *)a2;
    long long v25 = v22;
    if (v16 <= 0.0001)
    {
      if (v18 >= 0.9999) {
        goto LABEL_25;
      }
    }
    else
    {
      CG::Quadratic::split((CG::Quadratic *)&v24, v16, (uint64_t)v23);
      long long v26 = v23[7];
      long long v27 = v23[8];
      long long v28 = v23[9];
      long long v24 = v23[5];
      long long v25 = v23[6];
      if (v18 >= 0.9999) {
        goto LABEL_25;
      }
      double v18 = (v18 - v16) / (1.0 - v16);
    }
    CG::Quadratic::split((CG::Quadratic *)&v24, v18, (uint64_t)v23);
    long long v26 = v23[2];
    long long v27 = v23[3];
    long long v28 = v23[4];
    long long v24 = v23[0];
    long long v25 = v23[1];
LABEL_25:
    double v20 = RB::Path::ClipStroke::Subpath::add(this, (const CG::Quadratic *)&v24, INFINITY);
    if (!a3) {
      return;
    }
    goto LABEL_26;
  }
}

void RB::Path::ClipStroke::Subpath::add<CG::Cubic>(__n128 *this, float64x2_t *a2, void *a3, double a4, double a5, double a6, double a7)
{
  double v8 = a5 + a4;
  if (a6 < a4) {
    a6 = a4;
  }
  if (a6 <= v8) {
    double v9 = a6;
  }
  else {
    double v9 = v8;
  }
  if (a7 >= a4) {
    double v10 = a7;
  }
  else {
    double v10 = a4;
  }
  if (v10 <= v8) {
    double v8 = v10;
  }
  double v11 = v8 - v9;
  if (v8 - v9 >= 0.0001)
  {
    double v15 = v8 - a4;
    double v16 = 0.0;
    if (v9 - a4 >= 0.0001) {
      double v16 = CG::Cubic::index(a2, v9 - a4, 0.5);
    }
    double v17 = 1.0;
    if (v15 <= a5 + -0.0001) {
      double v17 = CG::Cubic::index(a2, v15, 0.5);
    }
    if (v16 <= 0.0001 && v17 >= 0.9999)
    {
      double v18 = RB::Path::ClipStroke::Subpath::add(this, (const CG::Cubic *)a2, a5);
      double v11 = a5;
      if (!a3) {
        return;
      }
LABEL_26:
      RB::Path::ClipStroke::DistanceMap::append(a3, v9, v18, v11);
      return;
    }
    float64x2_t v19 = a2[5];
    float64x2_t v27 = a2[4];
    float64x2_t v28 = v19;
    float64x2_t v29 = a2[6];
    float64x2_t v20 = a2[1];
    float64x2_t v23 = *a2;
    float64x2_t v24 = v20;
    float64x2_t v21 = a2[3];
    float64x2_t v25 = a2[2];
    float64x2_t v26 = v21;
    if (v16 <= 0.0001)
    {
      if (v17 >= 0.9999) {
        goto LABEL_25;
      }
    }
    else
    {
      CG::Cubic::split(&v23, v16, v22);
      float64x2_t v27 = v22[11];
      float64x2_t v28 = v22[12];
      float64x2_t v29 = v22[13];
      float64x2_t v23 = v22[7];
      float64x2_t v24 = v22[8];
      float64x2_t v25 = v22[9];
      float64x2_t v26 = v22[10];
      if (v17 >= 0.9999) {
        goto LABEL_25;
      }
      double v17 = (v17 - v16) / (1.0 - v16);
    }
    CG::Cubic::split(&v23, v17, v22);
    float64x2_t v27 = v22[4];
    float64x2_t v28 = v22[5];
    float64x2_t v29 = v22[6];
    float64x2_t v23 = v22[0];
    float64x2_t v24 = v22[1];
    float64x2_t v25 = v22[2];
    float64x2_t v26 = v22[3];
LABEL_25:
    double v18 = RB::Path::ClipStroke::Subpath::add(this, (const CG::Cubic *)&v23, INFINITY);
    if (!a3) {
      return;
    }
    goto LABEL_26;
  }
}

void RB::Path::ClipStroke::Clipper::split_segment<CG::LineSegment>(uint64_t a1, float64_t a2, float64_t a3, float64_t a4, float64_t a5, double a6)
{
  double v6 = a6;
  v16.f64[0] = a2;
  v16.f64[1] = a3;
  v17.f64[0] = a4;
  v17.f64[1] = a5;
  double v8 = *(double *)(a1 + 56);
  double v9 = v8 + a6;
  double v10 = *(double *)(a1 + 88);
  if (v10 < v8 + a6)
  {
    do
    {
      v11.n128_f64[0] = CG::LineSegment::index(&v16, v10 - v8);
      if (v11.n128_f64[0] <= 0.0001)
      {
        v11.n128_u64[0] = *(void *)(a1 + 88);
      }
      else
      {
        CG::LineSegment::split(&v16, v11.n128_f64[0], (uint64_t)v15);
        float64x2_t v12 = vsubq_f64(v15[1], v15[0]);
        double v13 = sqrt(vaddvq_f64(vmulq_f64(v12, v12)));
        RB::Path::ClipStroke::Clipper::clip_segment<CG::LineSegment>(a1, v15, v13, *(float *)(a1 + 96));
        v11.n128_u64[0] = *(void *)(a1 + 88);
        float64x2_t v16 = v15[2];
        float64x2_t v17 = v15[3];
        double v6 = v6 - v13;
        double v8 = v11.n128_f64[0];
      }
      RB::Path::ClipStroke::Clipper::advance_keyframes((RB::Path::ClipStroke::Clipper *)a1, v11);
      double v10 = *(double *)(a1 + 88);
    }
    while (v10 < v9);
  }
  float v14 = (v9 - *(double *)(a1 + 64)) / (v10 - *(double *)(a1 + 64));
  RB::Path::ClipStroke::Clipper::clip_segment<CG::LineSegment>(a1, &v16, v6, *(float *)(a1 + 72) + (float)((float)(*(float *)(a1 + 96) - *(float *)(a1 + 72)) * v14));
  *(double *)(a1 + 56) = v9;
}

unsigned char *RB::Path::ClipStroke::Clipper::emit_segment<CG::LineSegment>(unsigned char *result, float64x2_t *a2)
{
  float64x2_t v2 = vsubq_f64(a2[1], *a2);
  if (vaddvq_f64(vmulq_f64(v2, v2)) > 0.00000001)
  {
    uint64_t v4 = result;
    if (!result[205])
    {
      *((float64x2_t *)result + 10) = *a2;
      *((float64x2_t *)result + 11) = vsubq_f64(*a2, a2[1]);
      (*(void (**)(void))(**(void **)(*(void *)result + 8) + 16))(*(void *)(*(void *)result
                                                                                                 + 8));
      v4[205] = 1;
    }
    __n128 result = (unsigned char *)(*(uint64_t (**)(void, __n128))(**(void **)(*(void *)v4 + 8) + 24))(*(void *)(*(void *)v4 + 8), (__n128)a2[1]);
    *(float64x2_t *)(v4 + 120) = a2[1];
    *(float64x2_t *)(v4 + 136) = vsubq_f64(a2[1], *a2);
    if (v4[104])
    {
      double v6 = INFINITY;
    }
    else
    {
      double v5 = *(double *)(*((void *)v4 + 1) + 16);
      double v6 = vabdd_f64(*((double *)v4 + 11), *((double *)v4 + 8));
      if (v5 - v6 < v6) {
        double v6 = v5 - v6;
      }
    }
    *((double *)v4 + 19) = v6;
  }
  return result;
}

void RB::Path::ClipStroke::Clipper::clip_segment<CG::LineSegment>(uint64_t a1, float64x2_t *a2, double a3, float a4)
{
  int v8 = *(unsigned __int8 *)(a1 + 204);
  double v9 = *(RB::Path::ClipStroke **)a1;
  int v10 = RB::Path::ClipStroke::value_clipped(*(RB::Path::ClipStroke **)a1, a4);
  if (v8 != v10)
  {
    char v11 = v10;
    float v12 = *(float *)(a1 + 112);
    if (v12 == a4)
    {
      double v14 = 0.0;
    }
    else
    {
      float v13 = *((float *)v9 + 5);
      if (v13 < 0.0) {
        float v13 = 0.0;
      }
      if (v13 > 1.0) {
        float v13 = 1.0;
      }
      double v14 = (float)((float)(v13 - v12) / (float)(a4 - v12));
    }
    double v15 = CG::LineSegment::index(a2, v14 * a3);
    if (v15 <= 0.9999)
    {
      CG::LineSegment::split(a2, v15, (uint64_t)v25);
      if (v8)
      {
        float64x2_t v21 = v26;
        double v22 = v26[0].f64[0];
        float64x2_t v24 = vsubq_f64(v26[0], v26[1]);
        if (*(unsigned char *)(a1 + 104))
        {
          double v23 = INFINITY;
        }
        else
        {
          double v16 = *(double *)(*(void *)(a1 + 8) + 16);
          double v23 = vabdd_f64(*(double *)(a1 + 88), *(double *)(a1 + 64));
          double v22 = v16 - v23;
          if (v16 - v23 < v23) {
            double v23 = v16 - v23;
          }
        }
        RB::Path::ClipStroke::Clipper::emit_cap((uint64_t *)a1, v26, &v24, v23, v22, v16, v17, v18, v19, v20);
      }
      else
      {
        if (v15 <= 0.0001)
        {
LABEL_22:
          *(unsigned char *)(a1 + 204) = v11;
          goto LABEL_23;
        }
        float64x2_t v21 = (float64x2_t *)v25;
      }
      RB::Path::ClipStroke::Clipper::emit_segment<CG::LineSegment>((unsigned char *)a1, v21);
      goto LABEL_22;
    }
  }
  if (!v8) {
    RB::Path::ClipStroke::Clipper::emit_segment<CG::LineSegment>((unsigned char *)a1, a2);
  }
LABEL_23:
  *(float *)(a1 + 112) = a4;
}

void RB::Path::ClipStroke::Clipper::split_segment<CG::Quadratic>(uint64_t a1, float64x2_t *this, double a3)
{
  double v3 = a3;
  double v6 = *(double *)(a1 + 56);
  double v7 = v6 + a3;
  for (double i = *(double *)(a1 + 88); i < v7; double i = *(double *)(a1 + 88))
  {
    CG::Quadratic::index(this->f64, i - v6);
    if (v9.n128_f64[0] > 0.0001)
    {
      CG::Quadratic::split((CG::Quadratic *)this, v9.n128_f64[0], (uint64_t)v14);
      CG::Quadratic::length(v14[0].f64, 0);
      double v11 = v10;
      RB::Path::ClipStroke::Clipper::clip_segment<CG::Quadratic>(a1, v14, v10, *(float *)(a1 + 96));
      double v6 = *(double *)(a1 + 88);
      float64x2_t v12 = v14[8];
      this[2] = v14[7];
      this[3] = v12;
      this[4] = v14[9];
      __n128 v9 = (__n128)v14[6];
      double v3 = v3 - v11;
      *this = v14[5];
      this[1] = (float64x2_t)v9;
    }
    v9.n128_u64[0] = *(void *)(a1 + 88);
    RB::Path::ClipStroke::Clipper::advance_keyframes((RB::Path::ClipStroke::Clipper *)a1, v9);
  }
  float v13 = (v7 - *(double *)(a1 + 64)) / (i - *(double *)(a1 + 64));
  RB::Path::ClipStroke::Clipper::clip_segment<CG::Quadratic>(a1, this, v3, *(float *)(a1 + 72) + (float)((float)(*(float *)(a1 + 96) - *(float *)(a1 + 72)) * v13));
  *(double *)(a1 + 56) = v7;
}

void RB::Path::ClipStroke::Clipper::emit_segment<CG::Quadratic>(__n128 *a1, float64x2_t *this)
{
  double v4 = this[1].f64[0];
  double v5 = this[1].f64[1];
  if ((v4 - this->f64[0]) * (v4 - this->f64[0]) + (v5 - this->f64[1]) * (v5 - this->f64[1]) > 0.00000001
    || (this[2].f64[0] - v4) * (this[2].f64[0] - v4) + (this[2].f64[1] - v5) * (this[2].f64[1] - v5) > 0.00000001)
  {
    if (!a1[12].n128_u8[13])
    {
      a1[10].n128_f64[0] = CG::Quadratic::start_point((CG::Quadratic *)this);
      a1[10].n128_u64[1] = v6;
      a1[11].n128_f64[0] = -CG::Quadratic::derivative(this, 0.0);
      a1[11].n128_f64[1] = -v7;
      (*(void (**)(void, __n128))(**(void **)(a1->n128_u64[0] + 8) + 16))(*(void *)(a1->n128_u64[0] + 8), a1[10]);
      a1[12].n128_u8[13] = 1;
    }
    (*(void (**)(void, __n128, __n128))(**(void **)(a1->n128_u64[0] + 8) + 32))(*(void *)(a1->n128_u64[0] + 8), (__n128)this[1], (__n128)this[2]);
    a1[7].n128_f64[1] = CG::Quadratic::end_point((CG::Quadratic *)this);
    a1[8].n128_u64[0] = v8;
    a1[8].n128_f64[1] = CG::Quadratic::derivative(this, 1.0);
    a1[9].n128_u64[0] = v9;
    if (a1[6].n128_u8[8])
    {
      double v11 = INFINITY;
    }
    else
    {
      double v10 = *(double *)(a1->n128_u64[1] + 16);
      double v11 = vabdd_f64(a1[5].n128_f64[1], a1[4].n128_f64[0]);
      if (v10 - v11 < v11) {
        double v11 = v10 - v11;
      }
    }
    a1[9].n128_f64[1] = v11;
  }
}

void RB::Path::ClipStroke::Clipper::clip_segment<CG::Quadratic>(uint64_t a1, float64x2_t *a2, double a3, float a4)
{
  int v8 = *(unsigned __int8 *)(a1 + 204);
  unint64_t v9 = *(RB::Path::ClipStroke **)a1;
  int v10 = RB::Path::ClipStroke::value_clipped(*(RB::Path::ClipStroke **)a1, a4);
  if (v8 != v10)
  {
    char v11 = v10;
    float v12 = *(float *)(a1 + 112);
    if (v12 == a4)
    {
      double v14 = 0.0;
    }
    else
    {
      float v13 = *((float *)v9 + 5);
      if (v13 < 0.0) {
        float v13 = 0.0;
      }
      if (v13 > 1.0) {
        float v13 = 1.0;
      }
      double v14 = (float)((float)(v13 - v12) / (float)(a4 - v12));
    }
    CG::Quadratic::index(a2->f64, v14 * a3);
    double v16 = v15;
    if (v15 <= 0.9999)
    {
      CG::Quadratic::split((CG::Quadratic *)a2, v15, (uint64_t)v28);
      if (v8)
      {
        double v17 = v29;
        double v18 = CG::Quadratic::derivative(v29, 0.0);
        double v25 = -v24;
        v27.f64[0] = -v18;
        v27.f64[1] = v25;
        if (*(unsigned char *)(a1 + 104))
        {
          double v26 = INFINITY;
        }
        else
        {
          double v19 = *(double *)(*(void *)(a1 + 8) + 16);
          double v26 = vabdd_f64(*(double *)(a1 + 88), *(double *)(a1 + 64));
          double v25 = v19 - v26;
          if (v19 - v26 < v26) {
            double v26 = v19 - v26;
          }
        }
        RB::Path::ClipStroke::Clipper::emit_cap((uint64_t *)a1, v29, &v27, v26, v25, v19, v20, v21, v22, v23);
      }
      else
      {
        if (v16 <= 0.0001)
        {
LABEL_22:
          *(unsigned char *)(a1 + 204) = v11;
          goto LABEL_23;
        }
        double v17 = (float64x2_t *)v28;
      }
      RB::Path::ClipStroke::Clipper::emit_segment<CG::Quadratic>((__n128 *)a1, v17);
      goto LABEL_22;
    }
  }
  if (!v8) {
    RB::Path::ClipStroke::Clipper::emit_segment<CG::Quadratic>((__n128 *)a1, a2);
  }
LABEL_23:
  *(float *)(a1 + 112) = a4;
}

void RB::Path::ClipStroke::Clipper::split_segment<CG::Cubic>(uint64_t a1, float64x2_t *this, double a3)
{
  double v3 = a3;
  double v6 = *(double *)(a1 + 56);
  double v7 = v6 + a3;
  for (double i = *(double *)(a1 + 88); i < v7; double i = *(double *)(a1 + 88))
  {
    v9.n128_f64[0] = CG::Cubic::index(this, i - v6, 0.5);
    if (v9.n128_f64[0] > 0.0001)
    {
      CG::Cubic::split(this, v9.n128_f64[0], v14);
      double v10 = CG::Cubic::length(v14, 0.5);
      RB::Path::ClipStroke::Clipper::clip_segment<CG::Cubic>(a1, v14, v10, *(float *)(a1 + 96));
      double v6 = *(double *)(a1 + 88);
      float64x2_t v11 = v14[12];
      this[4] = v14[11];
      this[5] = v11;
      this[6] = v14[13];
      float64x2_t v12 = v14[8];
      *this = v14[7];
      this[1] = v12;
      double v3 = v3 - v10;
      __n128 v9 = (__n128)v14[10];
      this[2] = v14[9];
      this[3] = (float64x2_t)v9;
    }
    v9.n128_u64[0] = *(void *)(a1 + 88);
    RB::Path::ClipStroke::Clipper::advance_keyframes((RB::Path::ClipStroke::Clipper *)a1, v9);
  }
  float v13 = (v7 - *(double *)(a1 + 64)) / (i - *(double *)(a1 + 64));
  RB::Path::ClipStroke::Clipper::clip_segment<CG::Cubic>(a1, this, v3, *(float *)(a1 + 72) + (float)((float)(*(float *)(a1 + 96) - *(float *)(a1 + 72)) * v13));
  *(double *)(a1 + 56) = v7;
}

void RB::Path::ClipStroke::Clipper::emit_segment<CG::Cubic>(uint64_t a1, __n128 *this)
{
  double v4 = this[1].n128_f64[0];
  double v5 = this[1].n128_f64[1];
  double v6 = this->n128_f64[1];
  if ((v4 - this->n128_f64[0]) * (v4 - this->n128_f64[0]) + (v5 - v6) * (v5 - v6) > 0.00000001
    || (double v7 = this[2].n128_f64[0], v8 = this[2].n128_f64[1], (v7 - v4) * (v7 - v4) + (v8 - v5) * (v8 - v5) > 0.00000001)
    || (this[3].n128_f64[0] - v7) * (this[3].n128_f64[0] - v7) + (this[3].n128_f64[1] - v8) * (this[3].n128_f64[1] - v8) > 0.00000001)
  {
    if (!*(unsigned char *)(a1 + 205))
    {
      *(void *)(a1 + 160) = this->n128_u64[0];
      *(double *)(a1 + 168) = v6;
      *(double *)(a1 + 176) = -CG::Cubic::derivative((CG::Cubic *)this, 0.0);
      *(double *)(a1 + 184) = -v9;
      (*(void (**)(void, __n128))(**(void **)(*(void *)a1 + 8) + 16))(*(void *)(*(void *)a1 + 8), *(__n128 *)(a1 + 160));
      *(unsigned char *)(a1 + 205) = 1;
    }
    (*(void (**)(void, __n128, __n128, __n128))(**(void **)(*(void *)a1 + 8) + 40))(*(void *)(*(void *)a1 + 8), this[1], this[2], this[3]);
    *(__n128 *)(a1 + 120) = this[3];
    *(double *)(a1 + 136) = CG::Cubic::derivative((CG::Cubic *)this, 1.0);
    *(void *)(a1 + 144) = v10;
    if (*(unsigned char *)(a1 + 104))
    {
      double v12 = INFINITY;
    }
    else
    {
      double v11 = *(double *)(*(void *)(a1 + 8) + 16);
      double v12 = vabdd_f64(*(double *)(a1 + 88), *(double *)(a1 + 64));
      if (v11 - v12 < v12) {
        double v12 = v11 - v12;
      }
    }
    *(double *)(a1 + 152) = v12;
  }
}

void RB::Path::ClipStroke::Clipper::clip_segment<CG::Cubic>(uint64_t a1, float64x2_t *a2, double a3, float a4)
{
  int v8 = *(unsigned __int8 *)(a1 + 204);
  double v9 = *(RB::Path::ClipStroke **)a1;
  int v10 = RB::Path::ClipStroke::value_clipped(*(RB::Path::ClipStroke **)a1, a4);
  if (v8 != v10)
  {
    char v11 = v10;
    float v12 = *(float *)(a1 + 112);
    if (v12 == a4)
    {
      double v14 = 0.0;
    }
    else
    {
      float v13 = *((float *)v9 + 5);
      if (v13 < 0.0) {
        float v13 = 0.0;
      }
      if (v13 > 1.0) {
        float v13 = 1.0;
      }
      double v14 = (float)((float)(v13 - v12) / (float)(a4 - v12));
    }
    double v15 = CG::Cubic::index(a2, v14 * a3, 0.5);
    if (v15 <= 0.9999)
    {
      CG::Cubic::split(a2, v15, v27);
      if (v8)
      {
        double v16 = v28;
        double v17 = CG::Cubic::derivative((CG::Cubic *)v28, 0.0);
        double v24 = -v23;
        v26.f64[0] = -v17;
        v26.f64[1] = v24;
        if (*(unsigned char *)(a1 + 104))
        {
          double v25 = INFINITY;
        }
        else
        {
          double v18 = *(double *)(*(void *)(a1 + 8) + 16);
          double v25 = vabdd_f64(*(double *)(a1 + 88), *(double *)(a1 + 64));
          double v24 = v18 - v25;
          if (v18 - v25 < v25) {
            double v25 = v18 - v25;
          }
        }
        RB::Path::ClipStroke::Clipper::emit_cap((uint64_t *)a1, v28, &v26, v25, v24, v18, v19, v20, v21, v22);
      }
      else
      {
        if (v15 <= 0.0001)
        {
LABEL_22:
          *(unsigned char *)(a1 + 204) = v11;
          goto LABEL_23;
        }
        double v16 = v27;
      }
      RB::Path::ClipStroke::Clipper::emit_segment<CG::Cubic>(a1, (__n128 *)v16);
      goto LABEL_22;
    }
  }
  if (!v8) {
    RB::Path::ClipStroke::Clipper::emit_segment<CG::Cubic>(a1, (__n128 *)a2);
  }
LABEL_23:
  *(float *)(a1 + 112) = a4;
}

float RB::Symbol::Keyframes::eval(RB::Symbol::Keyframes *this, float a2, const RB::Symbol::KeyframeStorage *a3, double a4)
{
  unint64_t v4 = *((void *)this + 1);
  if (v4)
  {
    double v5 = (const RB::Symbol::KeyframeStorage *)*((void *)a3 + 96);
    if (!v5) {
      double v5 = a3;
    }
    unint64_t v4 = (unint64_t)v5 + 12 * (v4 >> 1);
  }
  LODWORD(a4) = *(_DWORD *)(v4 + 4);
  if (*(float *)&a4 < 0.0)
  {
    unsigned int v6 = 0;
    return *(float *)(v4 + 12 * v6 + 8);
  }
  float v8 = a2 - *((float *)this + 1);
  if (v8 >= *(float *)&a4)
  {
    unsigned int v9 = 1;
    while (1)
    {
      unsigned int v6 = v9;
      float v10 = *(float *)(v4 + 12 * v9 + 4);
      if (v10 < 0.0) {
        break;
      }
      float v8 = fmaxf(v8 - *(float *)&a4, 0.0);
      ++v9;
      *(float *)&a4 = v10;
      if (v8 < v10) {
        return *(float *)(v4 + 12 * v6 + 8)
      }
             + (float)((float)(*(float *)(v4 + 12 * v9 + 8) - *(float *)(v4 + 12 * v6 + 8))
                     * RB::Symbol::Keyframes::Value::interpolant((RB::Symbol::Keyframes::Value *)(v4 + 12 * v6), v8, *(float32x2_t *)&a4));
    }
    return *(float *)(v4 + 12 * v6 + 8);
  }
  unsigned int v6 = 0;
  unsigned int v9 = 1;
  return *(float *)(v4 + 12 * v6 + 8)
       + (float)((float)(*(float *)(v4 + 12 * v9 + 8) - *(float *)(v4 + 12 * v6 + 8))
               * RB::Symbol::Keyframes::Value::interpolant((RB::Symbol::Keyframes::Value *)(v4 + 12 * v6), v8, *(float32x2_t *)&a4));
}

float RB::Symbol::Keyframes::Value::interpolant(RB::Symbol::Keyframes::Value *this, float a2, float32x2_t a3)
{
  a3.i32[0] = *((_DWORD *)this + 1);
  float32x2_t v3 = vrecpe_f32(a3);
  float32x2_t v4 = vmul_f32(vrecps_f32(a3, v3), v3);
  float result = a2 * vmul_f32(v4, vrecps_f32(a3, v4)).f32[0];
  if (result < 0.0) {
    float result = 0.0;
  }
  if (result > 1.0) {
    float result = 1.0;
  }
  int v6 = *(_DWORD *)this;
  if (*(_DWORD *)this <= 0x27u)
  {
    BOOL v8 = v7 == 0.0 && v6 == 0;
    if (!v8 || ((0xFFFFEFCAFFuLL >> v6) & 1) == 0)
    {
      if (v7 == 0.33
        && ((0xFFFFEFCAFFuLL >> v6) & 1) != 0
        && ((0x1957D041DAuLL >> v6) & 1) != 0
        && ((0xFF7FF6E5FFuLL >> v6) & 1) != 0)
      {
        return (float)(result * result) * (float)((float)(result * -2.0) + 3.0);
      }
      else
      {
      }
    }
  }
  return result;
}

void RB::Symbol::Keyframes::print(int *a1, std::string *this, int a3, uint64_t a4)
{
  int v4 = (*a1 >> 4) & 7;
  if (v4) {
    BOOL v5 = v4 == a3;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5) {
    return;
  }
  uint64_t v9 = *a1 & 0xFLL;
  if (v9 == 15) {
    float v10 = "unknown-property";
  }
  else {
    float v10 = RB::Symbol::Keyframes::print(RB::SexpString &,RB::Symbol::Keyframes::Symbol,RB::Symbol::KeyframeStorage const*)const::property_names[v9];
  }
  RB::SexpString::push(this, v10);
  float v11 = *((float *)a1 + 1);
  if (v11 != 0.0) {
    RB::SexpString::printf(this, 0, "(begin %.4f)", v11);
  }
  unsigned int v12 = *a1;
  int v13 = (*a1 >> 4) & 7;
  if (v13)
  {
    double v14 = "to";
    if (v13 == 1) {
      double v14 = "from";
    }
    RB::SexpString::printf(this, 0, "(symbol %s)", v14);
    unsigned int v12 = *a1;
  }
  if (((v12 >> 10) & 0x7FF) != 0x7FF)
  {
    RB::SexpString::printf(this, 0, "(timing-group %u)", (v12 >> 10) & 0x7FF);
    unsigned int v12 = *a1;
  }
  unsigned int v15 = v12 >> 21;
  if (v15 != 2047) {
    RB::SexpString::printf(this, 0, "(value-index %u)", v15);
  }
  unint64_t v16 = *((void *)a1 + 1);
  if ((v16 & 1) == 0) {
    goto LABEL_24;
  }
  if (a4)
  {
    uint64_t v17 = *(void *)(a4 + 768);
    if (!v17) {
      uint64_t v17 = a4;
    }
    unint64_t v16 = v17 + 12 * (v16 >> 1);
LABEL_24:
    if (v16)
    {
      double v18 = (float *)(v16 + 4);
      do
      {
        RB::SexpString::push(this, "value");
        RB::SexpString::printf(this, 0, "(value %.2f)", v18[1]);
        if (*v18 >= 0.0)
        {
          RB::SexpString::printf(this, 0, "(duration %.4f)", *v18);
          int v19 = *((_DWORD *)v18 - 1);
          if ((v19 - 1) <= 0x26) {
        }
          }
        RB::SexpString::pop(this);
        float v20 = *v18;
        v18 += 3;
      }
      while (v20 >= 0.0);
    }
  }
  RB::SexpString::pop(this);
}

uint64_t RB::Symbol::KeyframeStorage::clear(uint64_t this)
{
  *(_DWORD *)(this + 776) = 0;
  *(_DWORD *)(this + 1816) = 0;
  *(unsigned char *)(this + 1824) = 0;
  return this;
}

_DWORD *RB::Symbol::KeyframeStorage::push_value(_DWORD *__dst, int a2, float a3, float a4)
{
  float v7 = __dst;
  int v8 = __dst[194];
  unsigned int v9 = v8 + 1;
  if (__dst[195] < (v8 + 1))
  {
    __dst = RB::vector<RB::Symbol::Keyframes::Value,64ul,unsigned int>::reserve_slow(__dst, v9);
    int v8 = v7[194];
    unsigned int v9 = v8 + 1;
  }
  float v10 = (_DWORD *)*((void *)v7 + 96);
  if (!v10) {
    float v10 = v7;
  }
  float v11 = (float *)&v10[3 * v8];
  *(_DWORD *)float v11 = a2;
  float v12 = 0.0;
  if (a4 >= 0.0) {
    float v12 = a4;
  }
  v11[1] = v12;
  v11[2] = a3;
  v7[194] = v9;
  return __dst;
}

_DWORD *RB::Symbol::KeyframeStorage::push_value(_DWORD *this, float a2)
{
  float32x2_t v3 = this;
  int v4 = this[194];
  unsigned int v5 = v4 + 1;
  if (this[195] < (v4 + 1))
  {
    this = RB::vector<RB::Symbol::Keyframes::Value,64ul,unsigned int>::reserve_slow(this, v5);
    int v4 = v3[194];
    unsigned int v5 = v4 + 1;
  }
  int v6 = (_DWORD *)*((void *)v3 + 96);
  if (!v6) {
    int v6 = v3;
  }
  float v7 = (float *)&v6[3 * v4];
  *(void *)float v7 = 0xBF80000000000000;
  v7[2] = a2;
  v3[194] = v5;
  return this;
}

__n128 RB::Symbol::KeyframeStorage::push_keyframes(RB::Symbol::KeyframeStorage *this, __n128 *a2)
{
  int v4 = (char *)this + 784;
  int v5 = *((_DWORD *)this + 454);
  if (*((_DWORD *)this + 455) < (v5 + 1))
  {
    RB::vector<RB::Symbol::Keyframes,64ul,unsigned int>::reserve_slow((char *)this + 784, v5 + 1);
    int v5 = *((_DWORD *)this + 454);
  }
  int v6 = (char *)*((void *)this + 226);
  if (!v6) {
    int v6 = v4;
  }
  __n128 result = *a2;
  *(__n128 *)&v6[16 * v5] = *a2;
  ++*((_DWORD *)this + 454);
  return result;
}

uint64_t RB::Symbol::KeyframeStorage::commit(RB::Symbol::KeyframeStorage *this)
{
  if (!*((unsigned char *)this + 1824))
  {
    int v2 = *((_DWORD *)this + 454);
    if (*((_DWORD *)this + 455) < (v2 + 1))
    {
      RB::vector<RB::Symbol::Keyframes,64ul,unsigned int>::reserve_slow((char *)this + 784, v2 + 1);
      int v2 = *((_DWORD *)this + 454);
    }
    float32x2_t v3 = (char *)*((void *)this + 226);
    if (!v3) {
      float32x2_t v3 = (char *)this + 784;
    }
    int v4 = &v3[16 * v2];
    *(void *)int v4 = 4294966272;
    *((void *)v4 + 1) = 0;
    ++*((_DWORD *)this + 454);
    *((unsigned char *)this + 1824) = 1;
  }
  if (*((void *)this + 226)) {
    return *((void *)this + 226);
  }
  else {
    return (uint64_t)this + 784;
  }
}

uint64_t RB::vector<RB::SharedSurface::AsyncUpdate,0ul,unsigned int>::~vector(uint64_t a1)
{
  int v2 = *(id **)a1;
  if (*(_DWORD *)(a1 + 8))
  {
    unint64_t v3 = 0;
    int v4 = v2 + 10;
    do
    {

      RB::SharedSubsurface::~SharedSubsurface(v4 - 9);
      int v5 = (atomic_uint *)*(v4 - 10);
      if (v5 && atomic_fetch_add_explicit(v5 + 2, 0xFFFFFFFF, memory_order_release) == 1)
      {
        __dmb(9u);
        (*(void (**)(atomic_uint *))(*(void *)v5 + 8))(v5);
      }
      ++v3;
      v4 += 18;
    }
    while (v3 < *(unsigned int *)(a1 + 8));
    int v2 = *(id **)a1;
  }
  if (v2) {
    free(v2);
  }
  return a1;
}

uint64_t RB::vector<RB::SharedSurface::Copy,0ul,unsigned int>::~vector(uint64_t a1)
{
  int v2 = *(atomic_uint ***)a1;
  if (*(_DWORD *)(a1 + 8))
  {
    unint64_t v3 = 0;
    do
    {
      int v4 = *v2;
      if (*v2 && atomic_fetch_add_explicit(v4 + 2, 0xFFFFFFFF, memory_order_release) == 1)
      {
        __dmb(9u);
        (*(void (**)(atomic_uint *))(*(void *)v4 + 8))(v4);
      }
      ++v3;
      v2 += 6;
    }
    while (v3 < *(unsigned int *)(a1 + 8));
    int v2 = *(atomic_uint ***)a1;
  }
  if (v2) {
    free(v2);
  }
  return a1;
}

uint64_t RB::vector<RB::SharedSurface::Update,0ul,unsigned int>::~vector(uint64_t a1)
{
  int v2 = *(void ***)a1;
  if (*(_DWORD *)(a1 + 8))
  {
    unint64_t v3 = 0;
    do
    {
      int v4 = *v2;
      v2 += 8;

      ++v3;
    }
    while (v3 < *(unsigned int *)(a1 + 8));
    int v2 = *(void ***)a1;
  }
  if (v2) {
    free(v2);
  }
  return a1;
}

uint64_t RB::vector<RB::SharedSurface::Remove,0ul,unsigned int>::~vector(uint64_t a1)
{
  int v2 = *(id **)a1;
  if (*(_DWORD *)(a1 + 8))
  {
    unint64_t v3 = 0;
    int v4 = v2 + 4;
    do
    {

      int v5 = (atomic_uint *)*(v4 - 4);
      if (v5 && atomic_fetch_add_explicit(v5 + 2, 0xFFFFFFFF, memory_order_release) == 1)
      {
        __dmb(9u);
        (*(void (**)(atomic_uint *))(*(void *)v5 + 8))(v5);
      }
      ++v3;
      v4 += 7;
    }
    while (v3 < *(unsigned int *)(a1 + 8));
    int v2 = *(id **)a1;
  }
  if (v2) {
    free(v2);
  }
  return a1;
}

uint64_t RB::vector<RB::SharedSurface::Allocation,0ul,unsigned int>::~vector(uint64_t a1)
{
  int v2 = *(atomic_uint ***)a1;
  if (*(_DWORD *)(a1 + 8))
  {
    unint64_t v3 = 0;
    do
    {
      int v4 = *v2;
      if (*v2 && atomic_fetch_add_explicit(v4 + 2, 0xFFFFFFFF, memory_order_release) == 1)
      {
        __dmb(9u);
        (*(void (**)(atomic_uint *))(*(void *)v4 + 8))(v4);
      }
      ++v3;
      v2 += 4;
    }
    while (v3 < *(unsigned int *)(a1 + 8));
    int v2 = *(atomic_uint ***)a1;
  }
  if (v2) {
    free(v2);
  }
  return a1;
}

void RB::BinAllocator::~BinAllocator(RB::BinAllocator *this)
{
  int v2 = (void **)*((void *)this + 2);
  unint64_t v3 = *((unsigned int *)this + 6);
  if (v3)
  {
    unint64_t v4 = 0;
    int v5 = v2 + 2;
    do
    {
      if (*v5)
      {
        free(*v5);
        unint64_t v3 = *((unsigned int *)this + 6);
      }
      ++v4;
      v5 += 4;
    }
    while (v4 < v3);
    int v2 = (void **)*((void *)this + 2);
  }
  if (v2) {
    free(v2);
  }
}

void RB::SharedSurface::~SharedSurface(RB::Surface **this)
{
  *this = (RB::Surface *)&unk_26C4ED130;
  int v2 = (os_unfair_lock_s *)RB::SurfacePool::shared((RB::SurfacePool *)this);
  RB::SurfacePool::dealloc(v2, this[3], 0);
  unint64_t v3 = (id *)this[19];
  if (*((_DWORD *)this + 40))
  {
    unint64_t v4 = 0;
    int v5 = v3 + 10;
    do
    {

      RB::SharedSubsurface::~SharedSubsurface(v5 - 9);
      int v6 = (atomic_uint *)*(v5 - 10);
      if (v6 && atomic_fetch_add_explicit(v6 + 2, 0xFFFFFFFF, memory_order_release) == 1)
      {
        __dmb(9u);
        (*(void (**)(atomic_uint *))(*(void *)v6 + 8))(v6);
      }
      ++v4;
      v5 += 18;
    }
    while (v4 < *((unsigned int *)this + 40));
    unint64_t v3 = (id *)this[19];
  }
  if (v3) {
    free(v3);
  }
  float v7 = (atomic_uint **)this[17];
  if (*((_DWORD *)this + 36))
  {
    unint64_t v8 = 0;
    do
    {
      unsigned int v9 = *v7;
      if (*v7 && atomic_fetch_add_explicit(v9 + 2, 0xFFFFFFFF, memory_order_release) == 1)
      {
        __dmb(9u);
        (*(void (**)(atomic_uint *))(*(void *)v9 + 8))(v9);
      }
      ++v8;
      v7 += 6;
    }
    while (v8 < *((unsigned int *)this + 36));
    float v7 = (atomic_uint **)this[17];
  }
  if (v7) {
    free(v7);
  }
  float v10 = (void **)this[15];
  if (*((_DWORD *)this + 32))
  {
    unint64_t v11 = 0;
    do
    {
      float v12 = *v10;
      v10 += 8;

      ++v11;
    }
    while (v11 < *((unsigned int *)this + 32));
    float v10 = (void **)this[15];
  }
  if (v10) {
    free(v10);
  }
  int v13 = (id *)this[11];
  if (*((_DWORD *)this + 24))
  {
    unint64_t v14 = 0;
    unsigned int v15 = v13 + 4;
    do
    {

      unint64_t v16 = (atomic_uint *)*(v15 - 4);
      if (v16 && atomic_fetch_add_explicit(v16 + 2, 0xFFFFFFFF, memory_order_release) == 1)
      {
        __dmb(9u);
        (*(void (**)(atomic_uint *))(*(void *)v16 + 8))(v16);
      }
      ++v14;
      v15 += 7;
    }
    while (v14 < *((unsigned int *)this + 24));
    int v13 = (id *)this[11];
  }
  if (v13) {
    free(v13);
  }
  uint64_t v17 = (atomic_uint **)this[9];
  if (*((_DWORD *)this + 20))
  {
    unint64_t v18 = 0;
    do
    {
      int v19 = *v17;
      if (*v17 && atomic_fetch_add_explicit(v19 + 2, 0xFFFFFFFF, memory_order_release) == 1)
      {
        __dmb(9u);
        (*(void (**)(atomic_uint *))(*(void *)v19 + 8))(v19);
      }
      ++v18;
      v17 += 4;
    }
    while (v18 < *((unsigned int *)this + 20));
    uint64_t v17 = (atomic_uint **)this[9];
  }
  if (v17) {
    free(v17);
  }
  float v20 = (void **)this[6];
  unint64_t v21 = *((unsigned int *)this + 14);
  if (v21)
  {
    unint64_t v22 = 0;
    double v23 = v20 + 2;
    do
    {
      if (*v23)
      {
        free(*v23);
        unint64_t v21 = *((unsigned int *)this + 14);
      }
      ++v22;
      v23 += 4;
    }
    while (v22 < v21);
    float v20 = (void **)this[6];
  }
  if (v20) {
    free(v20);
  }
}

{
  uint64_t vars8;

  RB::SharedSurface::~SharedSurface(this);
  JUMPOUT(0x21669AC10);
}

void sub_2141F8090(_Unwind_Exception *a1)
{
  RB::vector<RB::SharedSurface::AsyncUpdate,0ul,unsigned int>::~vector(v1 + 152);
  RB::vector<RB::SharedSurface::Copy,0ul,unsigned int>::~vector(v1 + 136);
  RB::vector<RB::SharedSurface::Update,0ul,unsigned int>::~vector(v1 + 120);
  RB::vector<RB::SharedSurface::Remove,0ul,unsigned int>::~vector(v1 + 88);
  RB::vector<RB::SharedSurface::Allocation,0ul,unsigned int>::~vector(v1 + 72);
  RB::BinAllocator::~BinAllocator((RB::BinAllocator *)(v1 + 32));
  _Unwind_Resume(a1);
}

void RB::SharedSurfaceGroup::cancel_async_updates(os_unfair_lock_s *this, atomic_uint *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  float64x2_t v27 = 0;
  uint64_t v28 = 0x400000000;
  double v24 = this + 4;
  os_unfair_lock_lock(this + 4);
  double v23 = this;
  uint64_t v4 = *(void *)&this[8]._os_unfair_lock_opaque;
  double v25 = (char *)&this[6];
  if ((os_unfair_lock_s *)v4 != &this[6])
  {
    do
    {
      uint64_t v5 = *(void *)(v4 + 16);
      os_unfair_lock_lock((os_unfair_lock_t)(v5 + 112));
      uint64_t v6 = *(unsigned int *)(v5 + 160);
      if (v6)
      {
        do
        {
          uint64_t v7 = (v6 - 1);
          uint64_t v8 = *(void *)(v5 + 152);
          if (*(atomic_uint **)(v8 + 144 * v7) == a2)
          {
            atomic_fetch_add_explicit(a2 + 8, 0xFFFFFFFF, memory_order_relaxed);
            int v9 = v28;
            if (HIDWORD(v28) < (v28 + 1))
            {
              RB::vector<RB::SharedSubsurface,4ul,unsigned int>::reserve_slow(__dst, v28 + 1);
              int v9 = v28;
            }
            uint64_t v10 = v8 + 144 * v7;
            unint64_t v11 = v27;
            if (!v27) {
              unint64_t v11 = __dst;
            }
            float v12 = &v11[56 * v9];
            *(void *)float v12 = *(void *)(v10 + 8);
            uint64_t v13 = v8 + 144 * v7;
            *((void *)v12 + 1) = *(void *)(v13 + 16);
            *((void *)v12 + 2) = *(void *)(v13 + 24);
            *((void *)v12 + 3) = 0;
            *((_DWORD *)v12 + 12) = *(_DWORD *)(v13 + 56);
            v12[52] = *(unsigned char *)(v13 + 60);
            *(void *)(v10 + 8) = 0;
            LODWORD(v28) = v28 + 1;
            uint64_t v14 = *(void *)(v5 + 152) + 144 * v7;

            RB::SharedSubsurface::~SharedSubsurface((id *)(v14 + 8));
            unsigned int v15 = *(atomic_uint **)v14;
            if (*(void *)v14 && atomic_fetch_add_explicit(v15 + 2, 0xFFFFFFFF, memory_order_release) == 1)
            {
              __dmb(9u);
              (*(void (**)(atomic_uint *))(*(void *)v15 + 8))(v15);
            }
            uint64_t v16 = *(unsigned int *)(v5 + 160);
            uint64_t v17 = (v16 - 1);
            *(_DWORD *)(v5 + 160) = v17;
            if (v6 != v16) {
              memmove((void *)v14, (const void *)(v14 + 144), 144 * (v17 - v7));
            }
          }
          --v6;
        }
        while (v7);
      }
      os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 112));
      uint64_t v4 = *(void *)(v4 + 8);
    }
    while ((char *)v4 != v25);
  }
  os_unfair_lock_unlock(v24);
  unint64_t v18 = v27;
  if (v27) {
    int v19 = (RB::SharedSubsurface *)v27;
  }
  else {
    int v19 = (RB::SharedSubsurface *)__dst;
  }
  if (v28)
  {
    uint64_t v20 = 56 * v28;
    do
    {
      RB::SharedSurfaceGroup::remove_subsurface(v23, v19, 0);
      int v19 = (RB::SharedSubsurface *)((char *)v19 + 56);
      v20 -= 56;
    }
    while (v20);
    unint64_t v18 = v27;
    unint64_t v21 = (id *)(v27 ? v27 : __dst);
    if (v28)
    {
      unint64_t v22 = 0;
      do
      {
        RB::SharedSubsurface::~SharedSubsurface(v21);
        ++v22;
        v21 += 7;
      }
      while (v22 < v28);
      unint64_t v18 = v27;
    }
  }
  if (v18) {
    free(v18);
  }
}

void sub_2141F83B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_unfair_lock_t a10, uint64_t a11, os_unfair_lock_t lock, char a13)
{
}

void RB::SharedSurface::AsyncUpdate::~AsyncUpdate(id *this)
{
  RB::SharedSubsurface::~SharedSubsurface(this + 1);
  int v2 = (atomic_uint *)*this;
  if (*this)
  {
    if (atomic_fetch_add_explicit(v2 + 2, 0xFFFFFFFF, memory_order_release) == 1)
    {
      __dmb(9u);
      (*(void (**)(atomic_uint *))(*(void *)v2 + 8))(v2);
    }
  }
}

void ___ZN2RB18SharedSurfaceGroup14add_subsurfaceERNS_19SharedSurfaceClientE14MTLPixelFormatNS_10ColorSpaceEjDv2_ifPU33objcproto22_RBDisplayListContents11objc_objectjDv4_fU13block_pointerFvRNS_16SharedSubsurfaceEE_block_invoke(RB::_anonymous_namespace_ *a1)
{
  uint64_t v1 = *((void *)a1 + 4);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = ___ZN2RB18SharedSurfaceGroup14add_subsurfaceERNS_19SharedSurfaceClientE14MTLPixelFormatNS_10ColorSpaceEjDv2_ifPU33objcproto22_RBDisplayListContents11objc_objectjDv4_fU13block_pointerFvRNS_16SharedSubsurfaceEE_block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v1;
  dispatch_async(v2, block);
}

void ___ZN2RB18SharedSurfaceGroup14add_subsurfaceERNS_19SharedSurfaceClientE14MTLPixelFormatNS_10ColorSpaceEjDv2_ifPU33objcproto22_RBDisplayListContents11objc_objectjDv4_fU13block_pointerFvRNS_16SharedSubsurfaceEE_block_invoke_2(uint64_t a1)
{
}

void RB::SharedSurfaceGroup::render_async(os_unfair_lock_s *this)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  long long v46 = 0u;
  unint64_t v47 = 8;
  int v2 = this + 4;
  os_unfair_lock_lock(this + 4);
  unint64_t v3 = this + 6;
  uint64_t v4 = *(os_unfair_lock_s **)&this[8]._os_unfair_lock_opaque;
  if (v4 == &this[6])
  {
    BYTE1(this[15]._os_unfair_lock_opaque) = 0;
    os_unfair_lock_unlock(v2);
  }
  else
  {
    v36 = this;
    v37 = v2;
    BOOL v5 = 0;
    do
    {
      uint64_t v6 = (os_unfair_lock_s *)(*(void *)&v4[4]._os_unfair_lock_opaque + 112);
      os_unfair_lock_lock(v6);
      uint64_t v7 = *(void *)&v4[4]._os_unfair_lock_opaque;
      unsigned int v10 = *(_DWORD *)(v7 + 160);
      int v9 = (_DWORD *)(v7 + 160);
      unsigned int v8 = v10;
      if (v10)
      {
        uint64_t v11 = *((void *)v9 - 1);
        uint64_t v12 = v11 + 144 * v8;
        do
        {
          atomic_fetch_add_explicit((atomic_uint *volatile)(*(void *)v11 + 32), 0xFFFFFFFF, memory_order_relaxed);
          uint64_t v13 = *(void *)&v4[4]._os_unfair_lock_opaque;
          unsigned int v14 = *(_DWORD *)(v13 + 128);
          if (*(_DWORD *)(v13 + 132) < v14 + 1)
          {
            RB::vector<RB::SharedSurface::Update,0ul,unsigned int>::reserve_slow(v13 + 120, v14 + 1);
            unsigned int v14 = *(_DWORD *)(v13 + 128);
          }
          unint64_t v15 = *(void *)(v13 + 120) + ((unint64_t)v14 << 6);
          *(void *)unint64_t v15 = *(void *)(v11 + 80);
          *(void *)(v11 + 80) = 0;
          long long v16 = *(_OWORD *)(v11 + 88);
          long long v17 = *(_OWORD *)(v11 + 104);
          *(_OWORD *)(v15 + 40) = *(_OWORD *)(v11 + 120);
          *(_OWORD *)(v15 + 24) = v17;
          *(_OWORD *)(v15 + 8) = v16;
          ++*(_DWORD *)(v13 + 128);
          id v18 = *(id *)(v11 + 64);
          id v38 = v18;
          *(void *)(v11 + 64) = 0;
          id v39 = *(id *)(v11 + 8);
          uint64_t v40 = *(void *)(v11 + 16);
          uint64_t v41 = *(void *)(v11 + 24);
          uint64_t v42 = 0;
          int v43 = *(_DWORD *)(v11 + 56);
          char v44 = *(unsigned char *)(v11 + 60);
          *(void *)(v11 + 8) = 0;
          uint64_t v19 = *((void *)&v46 + 1);
          if (v47 < *((void *)&v46 + 1) + 1)
          {
            RB::vector<RB::SharedSurfaceGroup::render_async(void)::Completion,8ul,unsigned long>::reserve_slow(__dst, *((void *)&v46 + 1) + 1);
            uint64_t v19 = *((void *)&v46 + 1);
            id v18 = v38;
          }
          uint64_t v20 = (unsigned char *)v46;
          if (!(void)v46) {
            uint64_t v20 = __dst;
          }
          unint64_t v21 = &v20[64 * v19];
          *(void *)unint64_t v21 = v18;
          *((void *)v21 + 1) = v39;
          *((void *)v21 + 2) = v40;
          *((void *)v21 + 3) = v41;
          *((void *)v21 + 4) = 0;
          *((_DWORD *)v21 + 14) = v43;
          v21[60] = v44;
          id v39 = 0;
          ++*((void *)&v46 + 1);
          RB::SharedSubsurface::~SharedSubsurface(&v39);

          v11 += 144;
        }
        while (v11 != v12);
        uint64_t v22 = *(void *)&v4[4]._os_unfair_lock_opaque;
        unsigned int v24 = *(_DWORD *)(v22 + 160);
        int v9 = (_DWORD *)(v22 + 160);
        uint64_t v23 = v24;
        if (v24)
        {
          uint64_t v25 = 144 * v23;
          float64x2_t v26 = (id *)(*((void *)v9 - 1) + 80);
          do
          {

            RB::SharedSubsurface::~SharedSubsurface(v26 - 9);
            float64x2_t v27 = (atomic_uint *)*(v26 - 10);
            if (v27 && atomic_fetch_add_explicit(v27 + 2, 0xFFFFFFFF, memory_order_release) == 1)
            {
              __dmb(9u);
              (*(void (**)(atomic_uint *))(*(void *)v27 + 8))(v27);
            }
            v26 += 18;
            v25 -= 144;
          }
          while (v25);
        }
      }
      *int v9 = 0;
      BOOL v5 = v5 || (v28 = *(void *)&v4[4]._os_unfair_lock_opaque, *(_DWORD *)(v28 + 128)) || *(unsigned char *)(v28 + 172) != 0;
      os_unfair_lock_unlock(v6);
      uint64_t v4 = *(os_unfair_lock_s **)&v4[2]._os_unfair_lock_opaque;
    }
    while (v4 != v3);
    BYTE1(v36[15]._os_unfair_lock_opaque) = 0;
    os_unfair_lock_unlock(v37);
    if (v5) {
      RB::SharedSurfaceGroup::render_updates((RB::SharedSurfaceGroup *)v36);
    }
  }
  if (!*((void *)&v46 + 1)) {
    goto LABEL_43;
  }
  int v29 = pthread_main_np();
  if (!v29) {
    [MEMORY[0x263F158F8] activateBackground:1];
  }
  if ((void)v46) {
    uint64_t v30 = (unsigned char *)v46;
  }
  else {
    uint64_t v30 = __dst;
  }
  if (*((void *)&v46 + 1))
  {
    long long v31 = &v30[64 * *((void *)&v46 + 1)];
    do
    {
      (*(void (**)(void))(*(void *)v30 + 16))();
      v30 += 64;
    }
    while (v30 != v31);
  }
  if (!v29) {
    [MEMORY[0x263F158F8] flush];
  }
  long long v32 = (void *)v46;
  v33 = __dst;
  if ((void)v46) {
    v33 = (unsigned char *)v46;
  }
  if (*((void *)&v46 + 1))
  {
    unint64_t v34 = 0;
    v35 = (id *)(v33 + 8);
    do
    {
      RB::SharedSubsurface::~SharedSubsurface(v35);

      ++v34;
      v35 += 8;
    }
    while (v34 < *((void *)&v46 + 1));
LABEL_43:
    long long v32 = (void *)v46;
  }
  if (v32) {
    free(v32);
  }
}

void sub_2141F88C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_unfair_lock_t lock, id a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20)
{
  RB::SharedSubsurface::~SharedSubsurface(v20);

  os_unfair_lock_unlock(v21);
  os_unfair_lock_unlock(lock);
  RB::vector<RB::SharedSurfaceGroup::render_async(void)::Completion,8ul,unsigned long>::~vector(&a20);
  _Unwind_Resume(a1);
}

void RB::SharedSurface::Remove::~Remove(id *this)
{
  int v2 = (atomic_uint *)*this;
  if (*this)
  {
    if (atomic_fetch_add_explicit(v2 + 2, 0xFFFFFFFF, memory_order_release) == 1)
    {
      __dmb(9u);
      (*(void (**)(atomic_uint *))(*(void *)v2 + 8))(v2);
    }
  }
}

void RB::SharedSurfaceGroup::move_subsurface(os_unfair_lock_s *this, RB::SharedSurface *a2, uint64_t a3, RB::SharedSubsurface *a4)
{
  uint64_t v7 = this + 4;
  os_unfair_lock_lock(this + 4);
  uint64_t v8 = *((unsigned int *)a2 + 20);
  if (!v8) {
    goto LABEL_11;
  }
  int v9 = (unsigned char *)(*((void *)a2 + 9) + 29);
  uint64_t v10 = 32 * v8;
  while (*(_DWORD *)(v9 - 5) != a3)
  {
    v9 += 32;
    v10 -= 32;
    if (!v10) {
      goto LABEL_11;
    }
  }
  uint64_t v11 = *(void **)(*(void *)(v9 - 29) + 16);
  if (![v11 _willMoveSubsurface:a3])
  {
    *int v9 = 0;
    goto LABEL_11;
  }
  if (!v11)
  {
LABEL_11:
    os_unfair_lock_unlock(v7);
    id v12 = 0;
    goto LABEL_12;
  }

  id v12 = v11;
  os_unfair_lock_unlock(v7);
  if (v12) {
    [v12 _moveSubsurface:a4];
  }
LABEL_12:
}

void sub_2141F8A68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

char *RB::vector<RB::SharedSurfaceGroup::render_async(void)::Completion,8ul,unsigned long>::~vector(char *a1)
{
  int v2 = (char *)*((void *)a1 + 64);
  if (v2) {
    unint64_t v3 = v2;
  }
  else {
    unint64_t v3 = a1;
  }
  if (*((void *)a1 + 65))
  {
    unint64_t v4 = 0;
    BOOL v5 = (id *)(v3 + 8);
    do
    {
      RB::SharedSubsurface::~SharedSubsurface(v5);

      ++v4;
      v5 += 8;
    }
    while (v4 < *((void *)a1 + 65));
    int v2 = (char *)*((void *)a1 + 64);
  }
  if (v2) {
    free(v2);
  }
  return a1;
}

intptr_t RB::SharedSurfaceGroup::finish_async(os_unfair_lock_s *this)
{
  RB::SharedSurfaceGroup::render_async(this);
  intptr_t v2 = *(void *)&this[2]._os_unfair_lock_opaque;
  return RB::Drawable::finish(v2);
}

uint64_t RB::vector<RB::SharedSubsurface,4ul,unsigned int>::~vector(uint64_t a1)
{
  uint64_t v1 = a1;
  intptr_t v2 = *(void **)(a1 + 224);
  if (v2) {
    a1 = *(void *)(a1 + 224);
  }
  if (*(_DWORD *)(v1 + 232))
  {
    unint64_t v3 = 0;
    do
    {
      RB::SharedSubsurface::~SharedSubsurface((id *)a1);
      ++v3;
      a1 = v4 + 56;
    }
    while (v3 < *(unsigned int *)(v1 + 232));
    intptr_t v2 = *(void **)(v1 + 224);
  }
  if (v2) {
    free(v2);
  }
  return v1;
}

void RB::SharedSurfaceGroup::relocate_surface(RB::SharedSurfaceGroup *this, int32x2_t *a2, int a3)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  float64x2_t v27 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = 4;
  if (!a2[10].i32[0]) {
    return;
  }
  BOOL v5 = (uint64_t *)this;
  unsigned __int32 v6 = 0;
  uint64_t v7 = (char *)this + 24;
  do
  {
    int32x2_t v8 = a2[9];
    if (*(unsigned char *)(*(void *)&v8 + 32 * v6 + 29)) {
      goto LABEL_16;
    }
    v25[0] = v5;
    v25[1] = v26;
    v25[2] = *(void *)&v8 + 32 * v6;
    v25[3] = a2;
    uint64_t v9 = v5[4];
    if ((char *)v9 == v7)
    {
LABEL_13:
      if (a3)
      {
        int32x2_t v14 = a2[4];
        uint32x2_t v15 = (uint32x2_t)vcgt_s32(v14, (int32x2_t)0x10000000100);
        if ((vpmin_u32(v15, v15).u32[0] & 0x80000000) != 0)
        {
          int32x2_t v16 = vshr_n_s32(v14, 1uLL);
          uint32x2_t v17 = (uint32x2_t)vcge_s32(v16, *(int32x2_t *)(*(void *)&v8 + 32 * v6 + 16));
          if ((vpmin_u32(v17, v17).u32[0] & 0x80000000) != 0)
          {
            id v18 = (os_unfair_lock_s *)RB::SurfacePool::shared(this);
            this = (RB::SharedSurfaceGroup *)RB::SurfacePool::alloc(v18, *v5, *(void *)(*(void *)&a2[3] + 32), *(unsigned __int8 *)(*(void *)&a2[3] + 44), *(_DWORD *)(*(void *)&a2[3] + 40), 0, v16, 0);
            if (this) {
              operator new();
            }
          }
        }
      }
LABEL_16:
      ++v6;
      continue;
    }
    while (1)
    {
      double v24 = 0.0;
      uint64_t v10 = *(void *)(v9 + 16);
      if ((int32x2_t *)v10 != a2)
      {
        uint64_t v11 = *(void *)(v10 + 24);
        int32x2_t v12 = a2[3];
        if (*(void *)(v11 + 32) == *(void *)(*(void *)&v12 + 32)
          && *(_DWORD *)(v11 + 40) == *(_DWORD *)(*(void *)&v12 + 40)
          && *(unsigned __int8 *)(v11 + 44) == *(unsigned __int8 *)(*(void *)&v12 + 44)
          && *(float *)(v10 + 64) == *(float *)a2[8].i32)
        {
          this = (RB::SharedSurfaceGroup *)(v10 + 32);
          uint32x2_t v13 = (uint32x2_t)vcgt_s32(a2[4], *(int32x2_t *)(v10 + 32));
          if ((vpmax_u32(v13, v13).u32[0] & 0x80000000) != 0)
          {
            this = (RB::SharedSurfaceGroup *)RB::BinAllocator::alloc((int32x2_t *)this, &v24, *(int32x2_t *)(*(void *)&v8 + 32 * v6 + 16));
            if (this) {
              break;
            }
          }
        }
      }
      uint64_t v9 = *(void *)(v9 + 8);
      if ((char *)v9 == v7) {
        goto LABEL_13;
      }
    }
    ++*(_DWORD *)(v10 + 104);
    RB::SharedSurfaceGroup::relocate_surface(RB::SharedSurface *,BOOL)::$_0::operator()((uint64_t)v25, *(void *)(v9 + 16), v24);
  }
  while (v6 < a2[10].i32[0]);
  if (v28)
  {
    if (v27) {
      uint64_t v20 = (atomic_uint **)v27;
    }
    else {
      uint64_t v20 = (atomic_uint **)v26;
    }
    if (v28)
    {
      unint64_t v21 = v19;
      uint64_t v22 = 8 * v28;
      do
      {
        uint64_t v23 = *v20++;
        atomic_fetch_add_explicit(v23 + 2, 1u, memory_order_relaxed);
        dispatch_async_f(v21, v23, (dispatch_function_t)RB::SharedSurfaceGroup::relocate_surface(RB::SharedSurface *,BOOL)::$_1::__invoke);
        v22 -= 8;
      }
      while (v22);
    }
  }
  if (v27) {
    free(v27);
  }
}

void sub_2141F8EA0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19)
{
  if (a19) {
    free(a19);
  }
  _Unwind_Resume(exception_object);
}

char **RB::vector<std::pair<RB::SharedSurface *,RB::vector<RB::SharedSurface::Remove,0ul,unsigned int>>,0ul,unsigned int>::~vector(char **a1)
{
  intptr_t v2 = *a1;
  if (*((_DWORD *)a1 + 2))
  {
    unint64_t v3 = 0;
    do
    {
      uint64_t v4 = &v2[24 * v3];
      uint64_t v7 = (id *)*((void *)v4 + 1);
      unsigned __int32 v6 = v4 + 8;
      BOOL v5 = v7;
      if (*((_DWORD *)v6 + 2))
      {
        unint64_t v8 = 0;
        uint64_t v9 = v5 + 4;
        do
        {

          uint64_t v10 = (atomic_uint *)*(v9 - 4);
          if (v10 && atomic_fetch_add_explicit(v10 + 2, 0xFFFFFFFF, memory_order_release) == 1)
          {
            __dmb(9u);
            (*(void (**)(atomic_uint *))(*(void *)v10 + 8))(v10);
          }
          ++v8;
          v9 += 7;
        }
        while (v8 < *((unsigned int *)v6 + 2));
        BOOL v5 = *(id **)v6;
      }
      if (v5) {
        free(v5);
      }
      ++v3;
    }
    while (v3 < *((unsigned int *)a1 + 2));
    intptr_t v2 = *a1;
  }
  if (v2) {
    free(v2);
  }
  return a1;
}

void RB::SharedSurfaceGroup::relocate_surface(RB::SharedSurface *,BOOL)::$_0::operator()(uint64_t a1, uint64_t a2, double a3)
{
  unsigned int add_explicit = atomic_fetch_add_explicit((atomic_uint *volatile)(*(void *)a1 + 56), 1u, memory_order_relaxed);
  uint64_t v7 = (os_unfair_lock_s *)(a2 + 112);
  os_unfair_lock_lock((os_unfair_lock_t)(a2 + 112));
  if (!*(_DWORD *)(a2 + 128) && !*(_DWORD *)(a2 + 144))
  {
    unint64_t v8 = *(void **)(a1 + 8);
    uint64_t v9 = v8[5];
    size_t v10 = v9 + 1;
    if (v8[6] < (unint64_t)(v9 + 1))
    {
      RB::vector<RB::DisplayList::Clip *,4ul,unsigned long>::reserve_slow(*(void **)(a1 + 8), v10);
      uint64_t v9 = v8[5];
      size_t v10 = v9 + 1;
    }
    uint64_t v11 = (void *)v8[4];
    if (!v11) {
      uint64_t v11 = v8;
    }
    v11[v9] = a2;
    v8[5] = v10;
  }
  uint64_t v12 = *(void *)(a1 + 24);
  if (v12) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v12 + 8), 1u, memory_order_relaxed);
  }
  uint64_t v13 = *(void *)(a1 + 16);
  int v14 = *(_DWORD *)(v13 + 24);
  uint64_t v16 = *(void *)(v13 + 8);
  uint64_t v15 = *(void *)(v13 + 16);
  char v17 = *(unsigned char *)(v13 + 28);
  unsigned int v18 = *(_DWORD *)(a2 + 144);
  if (*(_DWORD *)(a2 + 148) < v18 + 1)
  {
    RB::vector<RB::DisplayList::LayerTask::ClipInfo,0ul,unsigned int>::reserve_slow(a2 + 136, v18 + 1);
    unsigned int v18 = *(_DWORD *)(a2 + 144);
  }
  unsigned int v19 = add_explicit + 1;
  uint64_t v20 = *(void *)(a2 + 136) + 48 * v18;
  *(void *)uint64_t v20 = v12;
  *(_DWORD *)(v20 + 8) = v14;
  *(_DWORD *)(v20 + 12) = v19;
  *(void *)(v20 + 16) = v16;
  *(double *)(v20 + 24) = a3;
  *(void *)(v20 + 32) = v15;
  *(unsigned char *)(v20 + 40) = v17;
  ++*(_DWORD *)(a2 + 144);
  atomic_fetch_add_explicit((atomic_uint *volatile)(**(void **)(a1 + 16) + 24), 1u, memory_order_relaxed);
  unint64_t v21 = *(uint64_t **)(a1 + 16);
  uint64_t v22 = *v21;
  if (*v21)
  {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v22 + 8), 1u, memory_order_relaxed);
    unint64_t v21 = *(uint64_t **)(a1 + 16);
  }
  uint64_t v23 = v21[2];
  char v24 = *((unsigned char *)v21 + 28);
  unsigned int v25 = *(_DWORD *)(a2 + 80);
  if (*(_DWORD *)(a2 + 84) < v25 + 1)
  {
    RB::vector<RB::BinAllocator::Shelf,0ul,unsigned int>::reserve_slow(a2 + 72, v25 + 1);
    unsigned int v25 = *(_DWORD *)(a2 + 80);
  }
  uint64_t v26 = *(void *)(a2 + 72) + 32 * v25;
  *(void *)uint64_t v26 = v22;
  *(double *)(v26 + 8) = a3;
  *(void *)(v26 + 16) = v23;
  *(_DWORD *)(v26 + 24) = v19;
  *(unsigned char *)(v26 + 28) = v24;
  *(unsigned char *)(v26 + 29) = 0;
  ++*(_DWORD *)(a2 + 80);
  *(unsigned char *)(*(void *)(a1 + 16) + 29) = 1;
  os_unfair_lock_unlock(v7);
}

void sub_2141F91C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  os_unfair_lock_unlock(v9);
  _Unwind_Resume(a1);
}

atomic_uint *RB::Refcount<RB::SharedSurface,std::atomic<unsigned int>>::release(atomic_uint *result)
{
  if (atomic_fetch_add_explicit(result + 2, 0xFFFFFFFF, memory_order_release) == 1)
  {
    __dmb(9u);
    return (atomic_uint *)(*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

uint64_t RB::Refcount<RB::SharedSurface,std::atomic<unsigned int>>::finalize(uint64_t result)
{
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 24))();
  }
  return result;
}

uint64_t RB::SharedSurfaceGroup::render_updates_device(void)::$_1::__invoke(uint64_t a1)
{
  unsigned int v2 = *(_DWORD *)(a1 + 8);
  if (v2)
  {
    unint64_t v3 = *(char **)a1;
    uint64_t v4 = *(void *)a1 + 40 * v2;
    do
    {
      uint64_t v5 = *((unsigned int *)v3 + 8);
      if (v5)
      {
        uint64_t v6 = 48 * v5;
        uint64_t v7 = *((void *)v3 + 3) + 24;
        do
        {
          v10[3] = 0;
          v10[0] = *(id *)v3;
          v10[1] = *(id *)v7;
          v10[2] = *(id *)(v7 + 8);
          int v11 = *(_DWORD *)(v7 - 12);
          char v12 = *(unsigned char *)(v7 + 16);
          RB::SharedSurfaceGroup::move_subsurface(*((os_unfair_lock_s **)v10[0] + 2), *(RB::SharedSurface **)(v7 - 24), *(unsigned int *)(v7 - 16), (RB::SharedSubsurface *)v10);
          v7 += 48;
          RB::SharedSubsurface::~SharedSubsurface(v10);
          v6 -= 48;
        }
        while (v6);
      }
      v3 += 40;
    }
    while (v3 != (char *)v4);
  }
  unint64_t v8 = RB::vector<RB::SharedSurfaceGroup::render_updates_device(void)::SurfaceData,0ul,unsigned int>::~vector((char **)a1);
  return MEMORY[0x21669AC10](v8, 0x1020C40EDED9539);
}

void sub_2141F9368(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  RB::SharedSubsurface::~SharedSubsurface((id *)va);
  _Unwind_Resume(a1);
}

void std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:nn180100]<RB::SharedSurface::Remove *&,RB::SharedSurface::Remove *&>(uint64_t **a1, uint64_t *a2)
{
  unsigned int v2 = *a1;
  uint64_t v3 = *a2;
  uint64_t v4 = **a1;
  *unsigned int v2 = 0;
  long long v13 = *(_OWORD *)(v2 + 1);
  int v14 = *((_DWORD *)v2 + 6);
  uint64_t v5 = v2[4];
  v2[4] = 0;
  uint64_t v6 = v2[5];
  int v7 = *((_DWORD *)v2 + 12);
  *unsigned int v2 = *(void *)v3;
  *(void *)uint64_t v3 = 0;
  long long v8 = *(_OWORD *)(v3 + 8);
  *((_DWORD *)v2 + 6) = *(_DWORD *)(v3 + 24);
  *(_OWORD *)(v2 + 1) = v8;
  uint64_t v9 = v2[4];
  v2[4] = *(void *)(v3 + 32);
  *(void *)(v3 + 32) = v9;
  v2[5] = *(void *)(v3 + 40);
  *((_DWORD *)v2 + 12) = *(_DWORD *)(v3 + 48);
  size_t v10 = *(atomic_uint **)v3;
  *(void *)uint64_t v3 = v4;
  *(_OWORD *)(v3 + 8) = v13;
  *(_DWORD *)(v3 + 24) = v14;
  int v11 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v5;
  *(void *)(v3 + 40) = v6;
  *(_DWORD *)(v3 + 48) = v7;

  if (v10 && atomic_fetch_add_explicit(v10 + 2, 0xFFFFFFFF, memory_order_release) == 1)
  {
    __dmb(9u);
    char v12 = *(void (**)(atomic_uint *))(*(void *)v10 + 8);
    v12(v10);
  }
}

void std::__sort5_maybe_branchless[abi:nn180100]<std::_ClassicAlgPolicy,RB::SharedSurface::update_removes(RB::vector<RB::SharedSurface::Remove,0ul,unsigned int> &)::$_0 &,RB::SharedSurface::Remove*,0>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v21 = (uint64_t *)a2;
  uint64_t v22 = (uint64_t *)a1;
  unsigned int v19 = (uint64_t *)a4;
  uint64_t v20 = (uint64_t *)a3;
  uint64_t v18 = a5;
  std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,RB::SharedSurface::update_removes(RB::vector<RB::SharedSurface::Remove,0ul,unsigned int> &)::$_0 &,RB::SharedSurface::Remove*>(a1, a2, a3, a4);
  unint64_t v10 = *(void *)(a5 + 32);
  unint64_t v11 = *(void *)(a4 + 32);
  if (v10 < v11 || v10 == v11 && *(_DWORD *)(a5 + 48) > *(_DWORD *)(a4 + 48))
  {
    std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:nn180100]<RB::SharedSurface::Remove *&,RB::SharedSurface::Remove *&>(&v19, &v18);
    unint64_t v12 = v19[4];
    unint64_t v13 = *(void *)(a3 + 32);
    if (v12 < v13 || v12 == v13 && *((_DWORD *)v19 + 12) > *(_DWORD *)(a3 + 48))
    {
      std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:nn180100]<RB::SharedSurface::Remove *&,RB::SharedSurface::Remove *&>(&v20, (uint64_t *)&v19);
      unint64_t v14 = v20[4];
      unint64_t v15 = *(void *)(a2 + 32);
      if (v14 < v15 || v14 == v15 && *((_DWORD *)v20 + 12) > *(_DWORD *)(a2 + 48))
      {
        std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:nn180100]<RB::SharedSurface::Remove *&,RB::SharedSurface::Remove *&>(&v21, (uint64_t *)&v20);
        unint64_t v16 = v21[4];
        unint64_t v17 = *(void *)(a1 + 32);
        if (v16 < v17 || v16 == v17 && *((_DWORD *)v21 + 12) > *(_DWORD *)(a1 + 48)) {
          std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:nn180100]<RB::SharedSurface::Remove *&,RB::SharedSurface::Remove *&>(&v22, (uint64_t *)&v21);
        }
      }
    }
  }
}

void std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,RB::SharedSurface::update_removes(RB::vector<RB::SharedSurface::Remove,0ul,unsigned int> &)::$_0 &,RB::SharedSurface::Remove*>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v15 = (uint64_t *)a1;
  uint64_t v13 = a3;
  unint64_t v14 = (uint64_t *)a2;
  unint64_t v3 = *(void *)(a2 + 32);
  unint64_t v4 = *(void *)(a1 + 32);
  if (v3 < v4 || v3 == v4 && *(_DWORD *)(a2 + 48) > *(_DWORD *)(a1 + 48))
  {
    unint64_t v5 = *(void *)(a3 + 32);
    if (v5 < v3 || v5 == v3 && *(_DWORD *)(a3 + 48) > *(_DWORD *)(a2 + 48))
    {
      uint64_t v6 = &v15;
    }
    else
    {
      std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:nn180100]<RB::SharedSurface::Remove *&,RB::SharedSurface::Remove *&>(&v15, (uint64_t *)&v14);
      unint64_t v11 = *(void *)(v13 + 32);
      unint64_t v12 = v14[4];
      if (v11 >= v12 && (v11 != v12 || *(_DWORD *)(v13 + 48) <= *((_DWORD *)v14 + 12))) {
        return;
      }
      uint64_t v6 = &v14;
    }
    unint64_t v10 = &v13;
LABEL_14:
    std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:nn180100]<RB::SharedSurface::Remove *&,RB::SharedSurface::Remove *&>(v6, v10);
    return;
  }
  unint64_t v7 = *(void *)(a3 + 32);
  if (v7 < v3 || v7 == v3 && *(_DWORD *)(a3 + 48) > *(_DWORD *)(a2 + 48))
  {
    std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:nn180100]<RB::SharedSurface::Remove *&,RB::SharedSurface::Remove *&>(&v14, &v13);
    unint64_t v8 = v14[4];
    unint64_t v9 = v15[4];
    if (v8 < v9 || v8 == v9 && *((_DWORD *)v14 + 12) > *((_DWORD *)v15 + 12))
    {
      uint64_t v6 = &v15;
      unint64_t v10 = (uint64_t *)&v14;
      goto LABEL_14;
    }
  }
}

BOOL std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,RB::SharedSurface::update_removes(RB::vector<RB::SharedSurface::Remove,0ul,unsigned int> &)::$_0 &,RB::SharedSurface::Remove*>(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v24 = a2;
  unsigned int v25 = (uint64_t *)a1;
  uint64_t v4 = (a2 - a1) >> 3;
  BOOL result = 1;
  switch(0x6DB6DB6DB6DB6DB7 * v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      uint64_t v24 = a2 - 56;
      unint64_t v6 = *(void *)(a2 - 24);
      unint64_t v7 = *(void *)(a1 + 32);
      if (v6 < v7 || v6 == v7 && *(_DWORD *)(a2 - 8) > *(_DWORD *)(a1 + 48))
      {
        std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:nn180100]<RB::SharedSurface::Remove *&,RB::SharedSurface::Remove *&>(&v25, &v24);
        return 1;
      }
      return result;
    case 3:
      std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,RB::SharedSurface::update_removes(RB::vector<RB::SharedSurface::Remove,0ul,unsigned int> &)::$_0 &,RB::SharedSurface::Remove*>(a1, a1 + 56, a2 - 56);
      return 1;
    case 4:
      std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,RB::SharedSurface::update_removes(RB::vector<RB::SharedSurface::Remove,0ul,unsigned int> &)::$_0 &,RB::SharedSurface::Remove*>(a1, a1 + 56, a1 + 112, a2 - 56);
      return 1;
    case 5:
      std::__sort5_maybe_branchless[abi:nn180100]<std::_ClassicAlgPolicy,RB::SharedSurface::update_removes(RB::vector<RB::SharedSurface::Remove,0ul,unsigned int> &)::$_0 &,RB::SharedSurface::Remove*,0>(a1, a1 + 56, a1 + 112, a1 + 168, a2 - 56);
      return 1;
    default:
      uint64_t v8 = a1 + 112;
      std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,RB::SharedSurface::update_removes(RB::vector<RB::SharedSurface::Remove,0ul,unsigned int> &)::$_0 &,RB::SharedSurface::Remove*>(a1, a1 + 56, a1 + 112);
      uint64_t v9 = a1 + 168;
      if (v9 == v2) {
        return 1;
      }
      int v10 = 0;
      break;
  }
  while (1)
  {
    unint64_t v11 = *(void *)(v9 + 32);
    unint64_t v12 = *(void *)(v8 + 32);
    if (v11 >= v12)
    {
      if (v11 != v12) {
        goto LABEL_21;
      }
      unsigned int v13 = *(_DWORD *)(v9 + 48);
      if (v13 <= *(_DWORD *)(v8 + 48)) {
        goto LABEL_21;
      }
    }
    else
    {
      unsigned int v13 = *(_DWORD *)(v9 + 48);
    }
    uint64_t v14 = 0;
    uint64_t v15 = *(void *)v9;
    *(void *)uint64_t v9 = 0;
    long long v26 = *(_OWORD *)(v9 + 8);
    int v27 = *(_DWORD *)(v9 + 24);
    *(void *)(v9 + 32) = 0;
    uint64_t v16 = *(void *)(v9 + 40);
    while (1)
    {
      *(void *)(v8 + 56) = *(void *)v8;
      *(void *)uint64_t v8 = v14;
      *(_OWORD *)(v8 + 64) = *(_OWORD *)(v8 + 8);
      *(_DWORD *)(v8 + 80) = *(_DWORD *)(v8 + 24);
      uint64_t v17 = *(void *)(v8 + 88);
      *(void *)(v8 + 88) = *(void *)(v8 + 32);
      *(void *)(v8 + 32) = v17;
      uint64_t v18 = *(void *)(v8 + 96);
      *(void *)(v8 + 96) = *(void *)(v8 + 40);
      *(void *)(v8 + 40) = v18;
      LODWORD(v17) = *(_DWORD *)(v8 + 104);
      *(_DWORD *)(v8 + 104) = *(_DWORD *)(v8 + 48);
      *(_DWORD *)(v8 + 48) = v17;
      if ((uint64_t *)v8 == v25) {
        break;
      }
      unint64_t v19 = *(void *)(v8 - 24);
      if (v11 >= v19 && (v11 != v19 || v13 <= *(_DWORD *)(v8 - 8))) {
        break;
      }
      uint64_t v20 = *(void *)v8;
      v8 -= 56;
      uint64_t v14 = v20;
    }
    unint64_t v21 = *(atomic_uint **)v8;
    *(void *)uint64_t v8 = v15;
    long long v22 = v26;
    *(_DWORD *)(v8 + 24) = v27;
    *(_OWORD *)(v8 + 8) = v22;
    uint64_t v23 = *(void **)(v8 + 32);
    *(void *)(v8 + 32) = v11;
    *(void *)(v8 + 40) = v16;
    *(_DWORD *)(v8 + 48) = v13;

    if (v21 && atomic_fetch_add_explicit(v21 + 2, 0xFFFFFFFF, memory_order_release) == 1)
    {
      __dmb(9u);
      (*(void (**)(atomic_uint *))(*(void *)v21 + 8))(v21);
    }
    if (++v10 == 8) {
      return v9 + 56 == v24;
    }
    uint64_t v2 = v24;
LABEL_21:
    uint64_t v8 = v9;
    v9 += 56;
    if (v9 == v2) {
      return 1;
    }
  }
}

void std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,RB::SharedSurface::update_removes(RB::vector<RB::SharedSurface::Remove,0ul,unsigned int> &)::$_0 &,RB::SharedSurface::Remove*>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v16 = (uint64_t *)a2;
  uint64_t v17 = (uint64_t *)a1;
  uint64_t v14 = a4;
  uint64_t v15 = (uint64_t *)a3;
  std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,RB::SharedSurface::update_removes(RB::vector<RB::SharedSurface::Remove,0ul,unsigned int> &)::$_0 &,RB::SharedSurface::Remove*>(a1, a2, a3);
  unint64_t v8 = *(void *)(a4 + 32);
  unint64_t v9 = *(void *)(a3 + 32);
  if (v8 < v9 || v8 == v9 && *(_DWORD *)(a4 + 48) > *(_DWORD *)(a3 + 48))
  {
    std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:nn180100]<RB::SharedSurface::Remove *&,RB::SharedSurface::Remove *&>(&v15, &v14);
    unint64_t v10 = v15[4];
    unint64_t v11 = *(void *)(a2 + 32);
    if (v10 < v11 || v10 == v11 && *((_DWORD *)v15 + 12) > *(_DWORD *)(a2 + 48))
    {
      std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:nn180100]<RB::SharedSurface::Remove *&,RB::SharedSurface::Remove *&>(&v16, (uint64_t *)&v15);
      unint64_t v12 = v16[4];
      unint64_t v13 = *(void *)(a1 + 32);
      if (v12 < v13 || v12 == v13 && *((_DWORD *)v16 + 12) > *(_DWORD *)(a1 + 48)) {
        std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:nn180100]<RB::SharedSurface::Remove *&,RB::SharedSurface::Remove *&>(&v17, (uint64_t *)&v16);
      }
    }
  }
}

void RB::SharedSurfaceGroup::relocate_surface(RB::SharedSurface *,BOOL)::$_1::__invoke(uint64_t a1)
{
  RB::SharedSurfaceGroup::render_updates(*(RB::SharedSurfaceGroup **)(a1 + 16));
  if (atomic_fetch_add_explicit((atomic_uint *volatile)(a1 + 8), 0xFFFFFFFF, memory_order_release) == 1)
  {
    __dmb(9u);
    uint64_t v2 = *(void (**)(uint64_t))(*(void *)a1 + 8);
    v2(a1);
  }
}

void sub_2141F9BAC(_Unwind_Exception *exception_object)
{
  if (atomic_fetch_add_explicit((atomic_uint *volatile)(v1 + 8), 0xFFFFFFFF, memory_order_release) == 1) {
    RB::SharedSurfaceGroup::relocate_surface(RB::SharedSurface *,BOOL)::$_1::__invoke();
  }
  _Unwind_Resume(exception_object);
}

void *RB::vector<RB::SharedSurface::AsyncUpdate,0ul,unsigned int>::reserve_slow(uint64_t a1, unsigned int a2)
{
  if (*(_DWORD *)(a1 + 12) + (*(_DWORD *)(a1 + 12) >> 1) <= a2) {
    unsigned int v3 = a2;
  }
  else {
    unsigned int v3 = *(_DWORD *)(a1 + 12) + (*(_DWORD *)(a1 + 12) >> 1);
  }
  BOOL result = RB::details::realloc_vector<unsigned int,144ul>(*(void **)a1, (_DWORD *)(a1 + 12), v3);
  *(void *)a1 = result;
  return result;
}

void *RB::details::realloc_vector<unsigned int,144ul>(void *a1, _DWORD *a2, unsigned int a3)
{
  uint64_t v4 = a1;
  if (a3)
  {
    size_t v5 = malloc_good_size(144 * a3);
    unint64_t v6 = v5 / 0x90;
    if (*a2 != (v5 / 0x90))
    {
      unint64_t v7 = malloc_type_realloc(v4, v5, 0x2F8905C9uLL);
      if (!v7) {
        RB::precondition_failure((RB *)"allocation failure", v8);
      }
      uint64_t v4 = v7;
      *a2 = v6;
    }
  }
  else
  {
    *a2 = 0;
    free(a1);
    return 0;
  }
  return v4;
}

void *RB::vector<RB::SharedSurfaceGroup::render_async(void)::Completion,8ul,unsigned long>::reserve_slow(void *__dst, size_t a2)
{
  if (*((void *)__dst + 66) + (*((void *)__dst + 66) >> 1) <= a2) {
    size_t v3 = a2;
  }
  else {
    size_t v3 = *((void *)__dst + 66) + (*((void *)__dst + 66) >> 1);
  }
  BOOL result = RB::details::realloc_vector<unsigned long,64ul>(*((void **)__dst + 64), __dst, 8uLL, (size_t *)__dst + 66, v3);
  *((void *)__dst + 64) = result;
  return result;
}

void *RB::details::realloc_vector<unsigned long,64ul>(void *__src, void *__dst, size_t a3, size_t *a4, size_t a5)
{
  unint64_t v7 = __src;
  if (a5 <= a3)
  {
    if (__src)
    {
      size_t v9 = a3;
      memcpy(__dst, __src, a5 << 6);
      free(v7);
      unint64_t v12 = 0;
LABEL_8:
      *a4 = v9;
      return v12;
    }
  }
  else
  {
    size_t v8 = malloc_good_size(a5 << 6);
    size_t v9 = v8 >> 6;
    if (v8 >> 6 != *a4)
    {
      unint64_t v10 = malloc_type_realloc(v7, v8, 0x66ED1BA4uLL);
      if (!v10) {
        RB::precondition_failure((RB *)"allocation failure", v11);
      }
      unint64_t v12 = v10;
      if (!v7) {
        memcpy(v10, __dst, *a4 << 6);
      }
      goto LABEL_8;
    }
  }
  return v7;
}

void *RB::vector<RB::SharedSubsurface,4ul,unsigned int>::reserve_slow(void *__dst, unsigned int a2)
{
  if (*((_DWORD *)__dst + 59) + (*((_DWORD *)__dst + 59) >> 1) <= a2) {
    unsigned int v3 = a2;
  }
  else {
    unsigned int v3 = *((_DWORD *)__dst + 59) + (*((_DWORD *)__dst + 59) >> 1);
  }
  BOOL result = RB::details::realloc_vector<unsigned int,56ul>(*((void **)__dst + 28), __dst, 4u, (_DWORD *)__dst + 59, v3);
  *((void *)__dst + 28) = result;
  return result;
}

void *RB::details::realloc_vector<unsigned int,56ul>(void *__src, void *__dst, unsigned int a3, _DWORD *a4, unsigned int a5)
{
  unint64_t v7 = __src;
  if (a5 <= a3)
  {
    if (__src)
    {
      LODWORD(v9) = a3;
      memcpy(__dst, __src, 56 * a5);
      free(v7);
      unint64_t v12 = 0;
LABEL_8:
      *a4 = v9;
      return v12;
    }
  }
  else
  {
    size_t v8 = malloc_good_size(56 * a5);
    unint64_t v9 = v8 / 0x38;
    if (*a4 != (v8 / 0x38))
    {
      unint64_t v10 = malloc_type_realloc(v7, v8, 0x66ED1BA4uLL);
      if (!v10) {
        RB::precondition_failure((RB *)"allocation failure", v11);
      }
      unint64_t v12 = v10;
      if (!v7) {
        memcpy(v10, __dst, 56 * *a4);
      }
      goto LABEL_8;
    }
  }
  return v7;
}

unint64_t RB::Fill::Color::converted(__int16 *a1, int a2, uint16x4_t a3)
{
  a3.i16[0] = *a1;
  a3.i16[2] = a1[1];
  unsigned __int16 v3 = a1[2];
  uint64_t v4 = (unsigned __int16)a1[3];
  unsigned int v5 = (unsigned __int16)a1[4];
  if (v5 >= 0x100 && a2 != v5)
  {
    a3.i16[1] = a1[1];
    a3.i16[2] = a1[2];
    double v6 = RB::Fill::Color::convert_color((RB::Shader::Tables *)a1[4], a2, a3);
    unsigned __int16 v3 = WORD2(v6);
    a3 = (uint16x4_t)vmovl_u16(*(uint16x4_t *)&v6).u64[0];
  }
  return (v4 << 48) | ((unint64_t)v3 << 32) | ((unint64_t)a3.u16[2] << 16) | a3.u16[0];
}

double RB::Fill::Color::convert_to_oklab(RB::Fill::Color *this)
{
  _H0 = *(_WORD *)this;
  __asm { FCVT            S0, H0 }
  _H2 = *((_WORD *)this + 1);
  __asm { FCVT            S2, H2 }
  _H3 = *((_WORD *)this + 2);
  __asm { FCVT            S3, H3 }
  _S9 = (float)((float)(_S0 * 0.41222) + (float)(_S2 * 0.53633)) + (float)(_S3 * 0.051446);
  _S10 = (float)((float)(_S0 * 0.2119) + (float)(_S2 * 0.6807)) + (float)(_S3 * 0.1074);
  _S11 = (float)((float)(_S0 * 0.088302) + (float)(_S2 * 0.28172)) + (float)(_S3 * 0.62998);
  *(float *)_Q0.i32 = powf(fabsf(_S9), 0.33333);
  __asm
  {
    FCVT            H0, S0
    FCVT            H1, S9
  }
  v17.i64[0] = 0x8000800080008000;
  v17.i64[1] = 0x8000800080008000;
  *(_WORD *)this = vbslq_s8(v17, _Q0, _Q1).u16[0];
  *(float *)_Q0.i32 = powf(fabsf(_S10), 0.33333);
  __asm
  {
    FCVT            H0, S0
    FCVT            H1, S10
  }
  v20.i64[0] = 0x8000800080008000;
  v20.i64[1] = 0x8000800080008000;
  *((_WORD *)this + 1) = vbslq_s8(v20, _Q0, _Q1).u16[0];
  *(float *)_Q0.i32 = powf(fabsf(_S11), 0.33333);
  __asm
  {
    FCVT            H0, S0
    FCVT            H1, S11
  }
  v23.i64[0] = 0x8000800080008000;
  v23.i64[1] = 0x8000800080008000;
  *(void *)&double result = vbslq_s8(v23, _Q0, _Q1).u64[0];
  *((_WORD *)this + 2) = LOWORD(result);
  return result;
}

__int16 RB::Fill::Color::convert_from_oklab@<H0>(RB::Fill::Color *this@<X0>)
{
  short float v1 = (short float)(*(short float *)this * *(short float *)this) * *(short float *)this;
  short float v2 = (short float)(*((short float *)this + 1) * *((short float *)this + 1)) * *((short float *)this + 1);
  short float v3 = (short float)(*((short float *)this + 2) * *((short float *)this + 2)) * *((short float *)this + 2);
  *(short float *)this = (short float)((short float)(v1 * COERCE_SHORT_FLOAT(17428))
                                     + (short float)(v2 * COERCE_SHORT_FLOAT(-15714)))
                       + (short float)(v3 * COERCE_SHORT_FLOAT(13156));
  *((short float *)this + 1) = (short float)((short float)(v1 * COERCE_SHORT_FLOAT(-17133))
                                           + (short float)(v2 * COERCE_SHORT_FLOAT(16696)))
                             + (short float)(v3 * COERCE_SHORT_FLOAT(-19082));
  *(short float *)&__int16 result = (short float)((short float)(v1 * COERCE_SHORT_FLOAT(-25524))
                                        + (short float)(v2 * COERCE_SHORT_FLOAT(-18015)))
                          + (short float)(v3 * COERCE_SHORT_FLOAT(16085));
  *((short float *)this + 2) = *(short float *)&result;
  return result;
}

float16x4_t RB::Fill::Color::prepare(uint64_t a1, int a2, int a3, uint16x4_t a4, int8x8_t a5)
{
  if (*(unsigned char *)(a1 + 9) && *(unsigned __int8 *)(a1 + 8) != a2)
  {
    double v8 = COERCE_DOUBLE(RB::Fill::Color::converted((__int16 *)a1, a2, a4));
    v9.i32[0] = LODWORD(v8);
    v9.i16[2] = WORD2(v8);
    v9.i16[3] = COERCE_UNSIGNED_INT(1.0);
    float16x4_t result = vmul_n_f16(v9, *((short float *)&v8 + 3));
    if (!a3) {
      *(double *)&float16x4_t result = v8;
    }
  }
  else if (a3)
  {
    v6.i16[3] = 15360;
    v6.i16[0] = *(_WORD *)a1;
    *(__int32 *)((char *)v6.i32 + 2) = *(_DWORD *)(a1 + 2);
    return vmul_n_f16(v6, *(short float *)(a1 + 6));
  }
  else
  {
    a5.i16[0] = *(_WORD *)a1;
    a4.i32[0] = *(_DWORD *)(a1 + 2);
    float16x4_t result = (float16x4_t)vext_s8(vext_s8(a5, a5, 2uLL), (int8x8_t)a4, 6uLL);
    result.i16[3] = *(_WORD *)(a1 + 6);
  }
  return result;
}

__int16 RB::Fill::Color::append_color_matrix@<H0>(short float *a1@<X0>, float16x4_t *a2@<X1>, int a3@<W2>, __int16 a4@<W3>, uint16x4_t a5@<D0>)
{
  if ((a4 & 0xFF00) != 0) {
    RB::Fill::Color::convert((uint64_t)a1, a4, a5);
  }
  if (a3)
  {
    short float v8 = a1[3];
    *a1 = v8 * *a1;
    a1[1] = a1[1] * v8;
    a1[2] = a1[2] * v8;
    RB::operator*=((uint64_t)a1, a2);
    __asm { FCMP            H0, #0 }
    if (_ZF)
    {
      LOWORD(_H0) = 0;
    }
    else
    {
      __asm { FCVT            S0, H0 }
      unsigned int v15 = _S0;
      float32x2_t v16 = vrecpe_f32((float32x2_t)_S0);
      _D0 = vmul_f32(vrecps_f32((float32x2_t)v15, v16), v16);
      _D0.i32[0] = vmul_f32(_D0, vrecps_f32((float32x2_t)v15, _D0)).u32[0];
      __asm { FCVT            H0, S0 }
    }
    *a1 = *a1 * _H0;
    a1[1] = a1[1] * _H0;
    *(short float *)&__int16 result = a1[2] * _H0;
    a1[2] = *(short float *)&result;
  }
  else
  {
    return RB::operator*=((uint64_t)a1, a2).u16[0];
  }
  return result;
}

uint64_t RB::Fill::Color::can_mix(RB::Fill::Color *this, const RB::Fill::Color *a2)
{
  if (*((unsigned char *)this + 9)) {
    BOOL v2 = *((unsigned char *)a2 + 9) == 0;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2 || *((unsigned __int8 *)this + 8) == *((unsigned __int8 *)a2 + 8))
  {
    v3.i16[0] = *(_WORD *)this;
    v4.i16[0] = *(_WORD *)a2;
    if (*(short float *)this == *(short float *)a2
      && *((short float *)this + 1) == *((short float *)a2 + 1)
      && *((short float *)this + 2) == *((short float *)a2 + 2)
      && *((short float *)this + 3) == *((short float *)a2 + 3))
    {
      return 4;
    }
  }
  else
  {
    v3.i16[0] = *(_WORD *)this;
    v4.i16[0] = *(_WORD *)a2;
  }
  v3.i16[1] = *((_WORD *)this + 1);
  v3.i32[1] = *((_DWORD *)this + 1);
  v4.i16[1] = *((_WORD *)a2 + 1);
  v4.i32[1] = *((_DWORD *)a2 + 1);
  return (vminvq_u32((uint32x4_t)vmovl_s16((int16x4_t)vmvn_s8(veor_s8((int8x8_t)vceq_f16(v3, (float16x4_t)0xF800F800F800F800), (int8x8_t)vceq_f16(v4, (float16x4_t)0xF800F800F800F800))))) >> 30) & 2;
}

void RB::Fill::Color::fill(uint64_t a1, uint64_t a2, uint16x4_t a3)
{
  if (*(unsigned char *)(a2 + 121)) {
    BOOL v4 = *(unsigned char *)(a1 + 9) == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4 && *(unsigned __int8 *)(a2 + 120) != *(unsigned __int8 *)(a1 + 8)
    || (a3.i16[0] = *(_WORD *)(a2 + 112), *(short float *)a3.i16 != *(short float *)a1)
    || (a3.i16[0] = *(_WORD *)(a2 + 114), *(short float *)a3.i16 != *(short float *)(a1 + 2))
    || (a3.i16[0] = *(_WORD *)(a2 + 116), *(short float *)a3.i16 != *(short float *)(a1 + 4))
    || (a3.i16[0] = *(_WORD *)(a2 + 118), *(short float *)a3.i16 != *(short float *)(a1 + 6)))
  {
    RB::CGContext::set_fill_color_slow((RB::CGContext *)a2, (const RB::Fill::Color *)a1, a3);
  }
  unsigned int v5 = *(CGContext **)a2;
  CGRect ClipBoundingBox = CGContextGetClipBoundingBox(v5);
  CGContextFillRect(v5, ClipBoundingBox);
}

void *RB::Fill::Color::encode(RB::Fill::Color *this, RB::Encoder *a2)
{
  RB::ProtobufEncoder::color_field(a2, 1, *(double *)this);
  __int16 result = (void *)rb_color_space(*((_WORD *)this + 4));
  if (result != 1)
  {
    int v5 = (int)result;
    RB::ProtobufEncoder::encode_varint(a2, 0x10uLL);
    return RB::ProtobufEncoder::encode_varint(a2, v5);
  }
  return result;
}

unint64_t RB::Fill::Color::decode(uint64_t a1, RB::ProtobufDecoder *this)
{
  *(_WORD *)(a1 + 8) = 257;
  unint64_t result = RB::ProtobufDecoder::next_field(this);
  if (result)
  {
    unint64_t v5 = result;
    do
    {
      if ((v5 >> 3) == 2)
      {
        unsigned int v6 = RB::ProtobufDecoder::uint_field((uint64_t **)this, v5);
        *(_WORD *)(a1 + 8) = rb_color_space(v6);
      }
      else if ((v5 >> 3) == 1)
      {
        *(double *)a1 = RB::ProtobufDecoder::color_field((unint64_t *)this, v5);
      }
      else
      {
        RB::ProtobufDecoder::skip_field(this, v5);
      }
      unint64_t result = RB::ProtobufDecoder::next_field(this);
      unint64_t v5 = result;
    }
    while (result);
  }
  return result;
}

void RB::Fill::Color::attributes(RB::Fill::Color *this, RB::XML::Element *a2)
{
  RB::XML::Value::Color::Color((RB::XML::Value::Color *)&v2, this);
  RB::XML::Element::set<RB::XML::Value::Color>();
}

void RB::Fill::Color::print(RB::Fill::Color *this, std::string *a2)
{
  RB::SexpString::push(a2, "color");
  _H0 = *(_WORD *)this;
  __asm { FCVT            D0, H0 }
  _H1 = *((_WORD *)this + 1);
  __asm { FCVT            D1, H1 }
  _H2 = *((_WORD *)this + 2);
  __asm { FCVT            D2, H2 }
  _H3 = *((_WORD *)this + 3);
  __asm { FCVT            D3, H3 }
  RB::SexpString::printf(a2, 0, "[%g %g %g %g]", _D0, _D1, _D2, _D3);
  RB::SexpString::pop(a2);
}

uint64_t RB::Path::Dilator::Dilator(uint64_t result, uint64_t a2, __n128 a3)
{
  *(void *)unint64_t result = &unk_26C4E70E0;
  *(void *)(result + 8) = a2;
  *(__n128 *)(result + 16) = a3;
  *(_OWORD *)(result + 32) = 0u;
  *(_OWORD *)(result + 48) = 0u;
  *(void *)(result + 64) = 0;
  *(unsigned char *)(result + 72) = 1;
  return result;
}

uint64_t RB::Path::Dilator::closepath(uint64_t this)
{
  if (!*(unsigned char *)(this + 72))
  {
    uint64_t v1 = this;
    __n128 v2 = *(__n128 *)(this + 48);
    int8x16_t v3 = (int8x16_t)vceqq_f64((float64x2_t)v2, *(float64x2_t *)(this + 32));
    if ((vornq_s8((int8x16_t)vdupq_laneq_s64((int64x2_t)vmvnq_s8(v3), 1), v3).u64[0] & 0x8000000000000000) != 0) {
      __n128 v2 = RB::Path::Dilator::lineto(this, (float64x2_t)v2);
    }
    this = (*(uint64_t (**)(void, __n128))(**(void **)(v1 + 8) + 8))(*(void *)(v1 + 8), v2);
    *(unsigned char *)(v1 + 72) = 1;
  }
  return this;
}

__n128 RB::Path::Dilator::lineto(uint64_t a1, float64x2_t a2)
{
  float64x2_t v3 = *(float64x2_t *)(a1 + 32);
  float64x2_t v4 = vsubq_f64(a2, v3);
  if (v4.f64[1] >= 0.0)
  {
    v5.f64[0] = 0.0;
    if (v4.f64[1] > 0.0) {
      v5.f64[0] = *(float64_t *)(a1 + 16);
    }
  }
  else
  {
    v5.f64[0] = -*(double *)(a1 + 16);
  }
  BOOL v6 = v4.f64[0] <= 0.0;
  if (v4.f64[0] >= 0.0)
  {
    double v7 = 0.0;
    if (!v6) {
      double v7 = -*(double *)(a1 + 24);
    }
  }
  else
  {
    double v7 = *(double *)(a1 + 24);
  }
  v5.f64[1] = v7;
  float64x2_t v8 = *(float64x2_t *)(a1 + 16);
  v8.f64[0] = *(float64_t *)(a1 + 64);
  float64x2_t v12 = vaddq_f64(v8, v5);
  __n128 v9 = (__n128)vaddq_f64(v12, v3);
  uint64_t v10 = **(void **)(a1 + 8);
  if (*(unsigned char *)(a1 + 72))
  {
    (*(void (**)(__n128))(v10 + 16))(v9);
    *(unsigned char *)(a1 + 72) = 0;
  }
  else
  {
    (*(void (**)(__n128))(v10 + 24))(v9);
  }
  (*(void (**)(void, __n128))(**(void **)(a1 + 8) + 24))(*(void *)(a1 + 8), (__n128)vaddq_f64(v12, a2));
  __n128 result = (__n128)a2;
  *(float64x2_t *)(a1 + 32) = a2;
  return result;
}

__n128 *RB::Path::Dilator::moveto(__n128 *this, __n128 a2)
{
  __n128 v2 = this;
  if (!this[4].n128_u8[8])
  {
    __n128 v3 = a2;
    this = (__n128 *)RB::Path::Dilator::closepath((uint64_t)this);
    a2 = v3;
  }
  v2[2] = a2;
  v2[3] = a2;
  return this;
}

__n128 RB::Path::Dilator::quadto_monotonic_xy(uint64_t a1, float64x2_t a2, float64x2_t a3)
{
  float64x2_t v4 = *(float64x2_t *)(a1 + 32);
  float64x2_t v5 = vsubq_f64(a3, v4);
  if (v5.f64[1] >= 0.0)
  {
    v6.f64[0] = 0.0;
    if (v5.f64[1] > 0.0) {
      v6.f64[0] = *(float64_t *)(a1 + 16);
    }
  }
  else
  {
    v6.f64[0] = -*(double *)(a1 + 16);
  }
  BOOL v7 = v5.f64[0] <= 0.0;
  if (v5.f64[0] >= 0.0)
  {
    double v8 = 0.0;
    if (!v7) {
      double v8 = -*(double *)(a1 + 24);
    }
  }
  else
  {
    double v8 = *(double *)(a1 + 24);
  }
  v6.f64[1] = v8;
  float64x2_t v9 = *(float64x2_t *)(a1 + 16);
  v9.f64[0] = *(float64_t *)(a1 + 64);
  float64x2_t v13 = vaddq_f64(v9, v6);
  __n128 v10 = (__n128)vaddq_f64(v13, v4);
  uint64_t v11 = **(void **)(a1 + 8);
  if (*(unsigned char *)(a1 + 72))
  {
    (*(void (**)(__n128))(v11 + 16))(v10);
    *(unsigned char *)(a1 + 72) = 0;
  }
  else
  {
    (*(void (**)(__n128))(v11 + 24))(v10);
  }
  (*(void (**)(void, __n128, __n128))(**(void **)(a1 + 8) + 32))(*(void *)(a1 + 8), (__n128)vaddq_f64(v13, a2), (__n128)vaddq_f64(v13, a3));
  __n128 result = (__n128)a3;
  *(float64x2_t *)(a1 + 32) = a3;
  return result;
}

double RB::Path::Dilator::quadto_monotonic_x(uint64_t a1, float64x2_t a2, float64x2_t a3)
{
  float64x2_t v3 = a3;
  float64x2_t v6 = *(float64x2_t *)(a1 + 32);
  float64x2_t v7 = vsubq_f64(v6, a3);
  if (v7.f64[1] != 0.0)
  {
    float64x2_t v8 = vdivq_f64(vsubq_f64(v6, a2), v7);
    if (v8.f64[1] >= 0.0001 && v8.f64[1] <= 0.9999)
    {
      float64x2_t v9 = vmlaq_laneq_f64(v6, vsubq_f64(a2, v6), v8, 1);
      float64x2_t v11 = vmlaq_laneq_f64(a2, vsubq_f64(v3, a2), v8, 1);
      float64x2_t v12 = v3;
      RB::Path::Dilator::quadto_monotonic_xy(a1, v9, vmlaq_laneq_f64(v9, vsubq_f64(v11, v9), v8, 1));
      a2 = v11;
      float64x2_t v3 = v12;
    }
  }
  *(void *)&double result = RB::Path::Dilator::quadto_monotonic_xy(a1, a2, v3).n128_u64[0];
  return result;
}

double RB::Path::Dilator::quadto(uint64_t a1, float64x2_t a2, float64x2_t a3)
{
  float64x2_t v5 = *(float64x2_t *)(a1 + 32);
  float64x2_t v6 = vsubq_f64(v5, a3);
  if (v6.f64[0] != 0.0)
  {
    double v7 = vdivq_f64(vsubq_f64(v5, a2), v6).f64[0];
    if (v7 >= 0.0001 && v7 <= 0.9999)
    {
      float64x2_t v8 = vmlaq_n_f64(v5, vsubq_f64(a2, v5), v7);
      float64x2_t v10 = vmlaq_n_f64(a2, vsubq_f64(a3, a2), v7);
      float64x2_t v11 = a3;
      RB::Path::Dilator::quadto_monotonic_x(a1, v8, vmlaq_n_f64(v8, vsubq_f64(v10, v8), v7));
      a2 = v10;
      a3 = v11;
    }
  }
  return RB::Path::Dilator::quadto_monotonic_x(a1, a2, a3);
}

__n128 RB::Path::Dilator::cubeto_monotonic_xy(uint64_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4)
{
  float64x2_t v5 = *(float64x2_t *)(a1 + 32);
  float64x2_t v6 = vsubq_f64(a4, v5);
  if (v6.f64[1] >= 0.0)
  {
    v7.f64[0] = 0.0;
    if (v6.f64[1] > 0.0) {
      v7.f64[0] = *(float64_t *)(a1 + 16);
    }
  }
  else
  {
    v7.f64[0] = -*(double *)(a1 + 16);
  }
  BOOL v8 = v6.f64[0] <= 0.0;
  if (v6.f64[0] >= 0.0)
  {
    double v9 = 0.0;
    if (!v8) {
      double v9 = -*(double *)(a1 + 24);
    }
  }
  else
  {
    double v9 = *(double *)(a1 + 24);
  }
  v7.f64[1] = v9;
  float64x2_t v10 = *(float64x2_t *)(a1 + 16);
  v10.f64[0] = *(float64_t *)(a1 + 64);
  float64x2_t v14 = vaddq_f64(v10, v7);
  __n128 v11 = (__n128)vaddq_f64(v14, v5);
  uint64_t v12 = **(void **)(a1 + 8);
  if (*(unsigned char *)(a1 + 72))
  {
    (*(void (**)(__n128))(v12 + 16))(v11);
    *(unsigned char *)(a1 + 72) = 0;
  }
  else
  {
    (*(void (**)(__n128))(v12 + 24))(v11);
  }
  (*(void (**)(void, __n128, __n128, __n128))(**(void **)(a1 + 8) + 40))(*(void *)(a1 + 8), (__n128)vaddq_f64(v14, a2), (__n128)vaddq_f64(v14, a3), (__n128)vaddq_f64(v14, a4));
  __n128 result = (__n128)a4;
  *(float64x2_t *)(a1 + 32) = a4;
  return result;
}

double RB::Path::Dilator::cubeto_monotonic_x(uint64_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4)
{
  float64x2_t v4 = a3;
  uint64_t v6 = a1;
  float64x2_t v7 = *(float64x2_t *)(a1 + 32);
  double v8 = *(double *)(a1 + 40);
  a3.f64[0] = COERCE_DOUBLE(*(void *)&vsubq_f64(a4, v7).f64[1]) + (a2.f64[1] - a3.f64[1]) * 3.0;
  double v9 = a3.f64[1] - (a2.f64[1] + a2.f64[1]) + v8 + a3.f64[1] - (a2.f64[1] + a2.f64[1]) + v8;
  double v10 = a2.f64[1] - v8;
  double v11 = a3.f64[0] * (-4.0 * (a2.f64[1] - v8)) + v9 * v9;
  if (v11 < 0.0) {
    goto LABEL_25;
  }
  double v12 = sqrt(v11);
  if (v9 < 0.0) {
    double v12 = -v12;
  }
  double v13 = v12 + v9;
  double v14 = v13 * -0.5;
  double v15 = v13 * -0.5 / a3.f64[0];
  if (a3.f64[0] == 0.0) {
    double v15 = -1.0;
  }
  double v16 = v10 * -2.0 / v13;
  if (v14 == 0.0) {
    double v16 = -1.0;
  }
  double v17 = v16 >= v15 ? v15 : v16;
  double v18 = v15 >= v16 ? v15 : v16;
  double v19 = v17 >= 0.0001 ? v17 : v18;
  if (v19 < 0.0001 || v19 > 0.9999)
  {
LABEL_25:
    float64x2_t v24 = a2;
    float64x2_t v25 = v4;
  }
  else
  {
    if (v17 >= 0.0001) {
      double v20 = v18;
    }
    else {
      double v20 = 2.0;
    }
    float64x2_t v21 = vmlaq_n_f64(v7, vsubq_f64(a2, v7), v19);
    float64x2_t v22 = vmlaq_n_f64(a2, vsubq_f64(v4, a2), v19);
    float64x2_t v33 = a4;
    float64x2_t v23 = vmlaq_n_f64(v21, vsubq_f64(v22, v21), v19);
    float64x2_t v35 = vmlaq_n_f64(v4, vsubq_f64(a4, v4), v19);
    float64x2_t v34 = vmlaq_n_f64(v22, vsubq_f64(v35, v22), v19);
    float64x2_t v31 = vmlaq_n_f64(v23, vsubq_f64(v34, v23), v19);
    double v32 = v19;
    RB::Path::Dilator::cubeto_monotonic_xy(a1, v21, v23, v31);
    if (1.0 - v20 >= 0.0001)
    {
      double v27 = (v20 - v32) / (1.0 - v32);
      float64x2_t v28 = vmlaq_n_f64(v31, vsubq_f64(v34, v31), v27);
      float64x2_t v29 = vmlaq_n_f64(v34, vsubq_f64(v35, v34), v27);
      float64x2_t v30 = vmlaq_n_f64(v28, vsubq_f64(v29, v28), v27);
      float64x2_t v35 = vmlaq_n_f64(v35, vsubq_f64(v33, v35), v27);
      float64x2_t v34 = vmlaq_n_f64(v29, vsubq_f64(v35, v29), v27);
      RB::Path::Dilator::cubeto_monotonic_xy(v6, v28, v30, vmlaq_n_f64(v30, vsubq_f64(v34, v30), v27));
    }
    a1 = v6;
    a4 = v33;
    float64x2_t v24 = v34;
    float64x2_t v25 = v35;
  }
  *(void *)&double result = RB::Path::Dilator::cubeto_monotonic_xy(a1, v24, v25, a4).n128_u64[0];
  return result;
}

double RB::Path::Dilator::cubeto(uint64_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4)
{
  uint64_t v6 = a1;
  float64x2_t v7 = *(float64x2_t *)(a1 + 32);
  double v8 = vmlad_n_f64(vsubq_f64(a4, v7).f64[0], 3.0, vsubq_f64(a2, a3).f64[0]);
  double v9 = a3.f64[0] - (a2.f64[0] + a2.f64[0]) + v7.f64[0] + a3.f64[0] - (a2.f64[0] + a2.f64[0]) + v7.f64[0];
  float64x2_t v10 = vsubq_f64(a2, v7);
  double v11 = v8 * (-4.0 * v10.f64[0]) + v9 * v9;
  if (v11 < 0.0) {
    goto LABEL_24;
  }
  double v12 = sqrt(v11);
  if (v9 < 0.0) {
    double v12 = -v12;
  }
  double v13 = v12 + v9;
  double v14 = v13 * -0.5;
  double v15 = v13 * -0.5 / v8;
  if (v8 == 0.0) {
    double v15 = -1.0;
  }
  double v16 = v10.f64[0] * -2.0 / v13;
  if (v14 == 0.0) {
    double v16 = -1.0;
  }
  if (v16 >= v15) {
    double v17 = v15;
  }
  else {
    double v17 = v16;
  }
  if (v15 >= v16) {
    double v16 = v15;
  }
  double v18 = v17 >= 0.0001 ? v17 : v16;
  if (v18 < 0.0001 || v18 > 0.9999)
  {
LABEL_24:
    float64x2_t v23 = a2;
    float64x2_t v24 = a3;
  }
  else
  {
    if (v17 >= 0.0001) {
      double v19 = v16;
    }
    else {
      double v19 = 2.0;
    }
    float64x2_t v20 = vmlaq_n_f64(v7, v10, v18);
    float64x2_t v21 = vmlaq_n_f64(a2, vsubq_f64(a3, a2), v18);
    float64x2_t v32 = a4;
    float64x2_t v22 = vmlaq_n_f64(v20, vsubq_f64(v21, v20), v18);
    float64x2_t v34 = vmlaq_n_f64(a3, vsubq_f64(a4, a3), v18);
    float64x2_t v33 = vmlaq_n_f64(v21, vsubq_f64(v34, v21), v18);
    float64x2_t v30 = vmlaq_n_f64(v22, vsubq_f64(v33, v22), v18);
    double v31 = v18;
    RB::Path::Dilator::cubeto_monotonic_x(a1, v20, v22, v30);
    if (1.0 - v19 >= 0.0001)
    {
      double v26 = (v19 - v31) / (1.0 - v31);
      float64x2_t v27 = vmlaq_n_f64(v30, vsubq_f64(v33, v30), v26);
      float64x2_t v28 = vmlaq_n_f64(v33, vsubq_f64(v34, v33), v26);
      float64x2_t v29 = vmlaq_n_f64(v27, vsubq_f64(v28, v27), v26);
      float64x2_t v34 = vmlaq_n_f64(v34, vsubq_f64(v32, v34), v26);
      float64x2_t v33 = vmlaq_n_f64(v28, vsubq_f64(v34, v28), v26);
      RB::Path::Dilator::cubeto_monotonic_x(v6, v27, v29, vmlaq_n_f64(v29, vsubq_f64(v33, v29), v26));
    }
    a1 = v6;
    a4 = v32;
    float64x2_t v23 = v33;
    float64x2_t v24 = v34;
  }
  return RB::Path::Dilator::cubeto_monotonic_x(a1, v23, v24, a4);
}

void RB::CustomEffect::transform_border(float32x2_t *a1, float64x2_t *a2, double a3, int32x4_t a4)
{
  *(float32x2_t *)a4.i8 = *a1;
  uint32x2_t v4 = (uint32x2_t)vceqz_f32(*a1);
  if ((vpmin_u32(v4, v4).u32[0] & 0x80000000) == 0)
  {
    float64x2_t v6 = *a2;
    float64x2_t v7 = a2[1];
    double v8 = a2[1].f64[1];
    double v9 = a2->f64[1];
    if (a2->f64[0] == v8 && v9 == 0.0 && v7.f64[0] == 0.0
      || v8 == 0.0 && (v6.f64[0] == 0.0 ? (BOOL v10 = v9 == v7.f64[0]) : (BOOL v10 = 0), v10))
    {
      double v11 = fabs(v6.f64[0]);
      double v12 = fabs(v9);
      if (v9 == 0.0) {
        double v13 = v11;
      }
      else {
        double v13 = v12;
      }
      float v14 = v13;
      float32x2_t v15 = vmul_n_f32(*(float32x2_t *)a4.i8, v14);
    }
    else
    {
      float32x2_t v16 = vneg_f32(*(float32x2_t *)a4.i8);
      *(float32x2_t *)a4.i8 = vadd_f32(*(float32x2_t *)a4.i8, *(float32x2_t *)a4.i8);
      v21[0] = *a2;
      v21[1] = v7;
      uint64_t v22 = 0;
      uint64_t v23 = 0;
      float32x2_t v17 = RB::operator*(v21, v16, a4);
      *(int32x2_t *)v19.i8 = vcltz_f32(v18);
      float32x2_t v20 = (float32x2_t)vbsl_s8((int8x8_t)*(_OWORD *)&vcltzq_s32(v19), (int8x8_t)vadd_f32(v18, v17), (int8x8_t)v17);
      float32x2_t v15 = vmaxnm_f32(vneg_f32(v20), vadd_f32(v20, vabs_f32(v18)));
    }
    *a1 = v15;
  }
}

RB::CustomEffect *RB::CustomEffect::CustomEffect(RB::DisplayList::Layer **this, RB::DisplayList::Layer **a2, atomic_uint *a3)
{
  v12[37] = *(int32x2_t *)MEMORY[0x263EF8340];
  float64x2_t v6 = RB::CustomShader::Closure::Closure((RB::CustomShader::Closure *)this, (const RB::CustomShader::Closure *)a2);
  *((void *)v6 + 16) = 0;
  *((void *)v6 + 17) = a2[17];
  *((void *)v6 + 18) = a2[18];
  long long v7 = *((_OWORD *)a2 + 10);
  long long v8 = *((_OWORD *)a2 + 12);
  *((_OWORD *)v6 + 11) = *((_OWORD *)a2 + 11);
  *((_OWORD *)v6 + 12) = v8;
  *((_OWORD *)v6 + 10) = v7;
  *((_OWORD *)v6 + 13) = *((_OWORD *)a2 + 13);
  *((_DWORD *)v6 + 56) = *((_DWORD *)a2 + 56);
  if (a2[16])
  {
    RB::DisplayList::Builder::Builder(v12, a3);
    uint64_t v9 = RB::DisplayList::Layer::copy(a2[16], (RB::DisplayList::Builder *)v12, 0);
    BOOL v10 = this[16];
    this[16] = (RB::DisplayList::Layer *)v9;
    if (v10) {
      RB::DisplayList::Layer::~Layer(v10);
    }
    RB::DisplayList::Builder::~Builder((RB::DisplayList::Builder *)v12);
  }
  return (RB::CustomEffect *)this;
}

void sub_2141FB1F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  RB::DisplayList::Builder::~Builder((RB::DisplayList::Builder *)&a9);
  double v11 = (RB::DisplayList::Layer *)*((void *)v9 + 16);
  *((void *)v9 + 16) = 0;
  if (v11) {
    RB::DisplayList::Layer::~Layer(v11);
  }
  RB::CustomShader::Closure::~Closure(v9);
  _Unwind_Resume(a1);
}

void RB::CustomShader::Closure::~Closure(RB::CustomShader::Closure *this)
{
  __n128 v2 = (const void **)((char *)this + 8);
  float64x2_t v3 = (const void **)*((void *)this + 13);
  if (v3) {
    uint32x2_t v4 = v3;
  }
  else {
    uint32x2_t v4 = v2;
  }
  if (*((void *)this + 14))
  {
    unint64_t v5 = 0;
    do
    {
      RB::CustomShader::Value::reset_data(v4);
      ++v5;
      v4 += 3;
    }
    while (v5 < *((void *)this + 14));
    float64x2_t v3 = (const void **)*((void *)this + 13);
  }
  if (v3) {
    free(v3);
  }
  float64x2_t v6 = *(atomic_uint **)this;
  if (*(void *)this)
  {
    if (atomic_fetch_add_explicit(v6 + 2, 0xFFFFFFFF, memory_order_release) == 1)
    {
      __dmb(9u);
      (*(void (**)(atomic_uint *))(*(void *)v6 + 8))(v6);
    }
  }
}

void RB::CustomEffect::apply_transform(RB::CustomEffect *this, float64x2_t *a2)
{
  uint32x2_t v4 = a2 + 68;
  *(double *)&long long v5 = RB::operator*((float64x2_t *)this + 10, a2 + 68);
  *((_OWORD *)this + 10) = v5;
  *((int32x4_t *)this + 11) = v6;
  *((_OWORD *)this + 12) = v7;
  RB::CustomEffect::transform_border((float32x2_t *)this + 17, v4, *(double *)&v5, v6);
  if (*((void *)this + 16))
  {
    RB::CustomEffect::transform_border((float32x2_t *)this + 18, v4, v8, v9);
    BOOL v10 = (RB::DisplayList::Layer *)*((void *)this + 16);
    RB::DisplayList::Layer::apply_transform(v10, (const RB::DisplayList::CachedTransform *)a2);
  }
}

float32x2_t RB::CustomEffect::roi(RB::CustomEffect *this, float32x2_t *a2, double a3, double a4, double a5, int32x4_t a6)
{
  uint64_t v6 = *((void *)this + 17) & 0x7FFFFFFF7FFFFFFFLL;
  float32x2_t v7 = a2[1];
  int8x8_t v8 = (int8x8_t)vmla_f32(v7, (float32x2_t)0x4000000040000000, (float32x2_t)v6);
  *(int32x2_t *)a6.i8 = vcgt_f32((float32x2_t)vdup_n_s32(0x7F7FFFFFu), v7);
  int8x8_t v9 = (int8x8_t)vcltzq_s32(a6).u64[0];
  float32x2_t result = (float32x2_t)vbsl_s8(v9, (int8x8_t)vsub_f32(*a2, (float32x2_t)v6), (int8x8_t)*a2);
  *a2 = result;
  a2[1] = (float32x2_t)vbsl_s8(v9, v8, (int8x8_t)v7);
  return result;
}

void RB::CustomEffect::dod(RB::CustomEffect *this, float32x2_t *a2, double a3, int32x4_t a4, double a5, int32x4_t a6)
{
  uint64_t v7 = *((void *)this + 17) & 0x7FFFFFFF7FFFFFFFLL;
  float32x2_t v8 = a2[1];
  int8x8_t v9 = (int8x8_t)vmla_f32(v8, (float32x2_t)0x4000000040000000, (float32x2_t)v7);
  *(int32x2_t *)a6.i8 = vcgt_f32((float32x2_t)vdup_n_s32(0x7F7FFFFFu), v8);
  int8x8_t v10 = (int8x8_t)vcltzq_s32(a6).u64[0];
  double v11 = COERCE_DOUBLE(vbsl_s8(v10, (int8x8_t)vsub_f32(*a2, (float32x2_t)v7), (int8x8_t)*a2));
  *(int8x8_t *)a4.i8 = vbsl_s8(v10, v9, (int8x8_t)v8);
  *(double *)a2 = v11;
  a2[1] = *(float32x2_t *)a4.i8;
  double v12 = (RB::DisplayList::Layer *)*((void *)this + 16);
  if (v12 && (*((unsigned char *)this + 224) & 0x10) == 0)
  {
    float32x2_t v14 = RB::DisplayList::Layer::bounds(v12, v11, a4);
    uint64_t v15 = *((void *)this + 18) & 0x7FFFFFFF7FFFFFFFLL;
    *(int32x2_t *)v16.i8 = vcgt_f32((float32x2_t)vdup_n_s32(0x7F7FFFFFu), *(float32x2_t *)v20.i8);
    int8x8_t v17 = (int8x8_t)vcltzq_s32(v16).u64[0];
    double v18 = COERCE_DOUBLE(vbsl_s8(v17, (int8x8_t)vsub_f32(v14, (float32x2_t)v15), (int8x8_t)v14));
    *(float32x2_t *)v19.i8 = vmla_f32(*(float32x2_t *)v20.i8, (float32x2_t)0x4000000040000000, (float32x2_t)v15);
    *(int8x8_t *)v20.i8 = vbsl_s8(v17, *(int8x8_t *)v19.i8, *(int8x8_t *)v20.i8);
    RB::Rect::Union(a2, v18, v20, *(double *)&v15, *(double *)&v17, 2.00000048, v19);
  }
}

RB::RenderTask *RB::CustomEffect::add_tasks(uint64_t a1, MTLPixelFormat a2, __n128 *a3, double a4, double a5)
{
  double v15 = a4;
  double v16 = a5;
  float32x2_t result = *(RB::RenderTask **)(a1 + 128);
  if (result)
  {
    double v9 = *(double *)(a1 + 144);
    uint32x2_t v10 = (uint32x2_t)vmvn_s8((int8x8_t)vceqz_f32(*(float32x2_t *)&v9));
    int32x2_t v11 = (int32x2_t)vpmax_u32(v10, v10);
    if (v11.i32[0] < 0)
    {
      *(float *)&a4 = -ceilf(fabsf(*((float *)&v9 + 1)));
      RB::Bounds::inset((int32x2_t *)&v15, (int)(float)-ceilf(fabsf(*(float *)&v9)), (int)*(float *)&a4, a4, a5, v9, v11);
      float32x2_t result = *(RB::RenderTask **)(a1 + 128);
      a4 = v15;
      a5 = v16;
    }
    RB::DisplayList::Layer::make_task((uint64_t)result, a2, a3, 2u, 0, 0, (uint64_t *)&v14, a4, a5, v9, v11);
    float32x2_t result = v14;
    if (v14)
    {
      *(void *)(a2 + 72) += RB::RenderTask::bytes(v14, v12);
      RB::DisplayList::LayerTask::add_task(*(void *)(a2 + 32), *(void *)(a1 + 128), 0, (uint64_t *)&v14);
      float32x2_t result = v14;
      if (v14)
      {
        int v13 = *((_DWORD *)v14 + 2) - 1;
        *((_DWORD *)v14 + 2) = v13;
        if (!v13) {
          return (RB::RenderTask *)(*(uint64_t (**)(RB::RenderTask *))(*(void *)result + 8))(result);
        }
      }
    }
  }
  return result;
}

void sub_2141FB57C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _DWORD *a10)
{
  if (a10) {
    RB::CustomEffect::add_tasks(a10);
  }
  _Unwind_Resume(exception_object);
}

uint64_t RB::CustomEffect::splits_parent(float32x2_t *this, int32x2_t *a2, const RB::BoundsAccumulator *a3, double a4, int32x4_t a5)
{
  uint64_t result = (uint64_t)this[16];
  if (result)
  {
    if (*(unsigned char *)(result + 60))
    {
      if (!a3) {
        return 1;
      }
      float32x2_t v9 = RB::DisplayList::Layer::bounds((RB::DisplayList::Layer *)result, a4, a5);
      RB::Bounds::Bounds(v19, v9, v10);
      RB::Bounds::intersect(v19, *a2, a2[1]);
      uint32x2_t v16 = (uint32x2_t)vcgtz_s32(v19[1]);
      float32x2_t v17 = (float32x2_t)vpmin_u32(v16, v16);
      if (v17.i32[0] < 0)
      {
        float32x2_t v17 = this[18];
        uint32x2_t v18 = (uint32x2_t)vmvn_s8((int8x8_t)vceqz_f32(v17));
        double v11 = COERCE_DOUBLE(vpmax_u32(v18, v18));
        if ((LODWORD(v11) & 0x80000000) != 0)
        {
          *(float *)&double v11 = -ceilf(fabsf(v17.f32[0]));
          v17.f32[0] = -ceilf(fabsf(v17.f32[1]));
          RB::Bounds::inset(v19, (int)*(float *)&v11, (int)v17.f32[0], *(double *)&v17, v11, v12, *(int32x2_t *)&v13);
        }
      }
      uint64_t result = RB::BoundsAccumulator::intersects(a3, v19, *(double *)&v17, v11, v12, v13, v14, v15);
      if (result) {
        return 1;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t RB::CustomEffect::prepare(uint64_t a1, uint64_t **a2)
{
  RB::CustomShader::Closure::prepare(a1, a2);
  uint64_t result = *(void *)(a1 + 128);
  if (result)
  {
    return RB::DisplayList::Layer::prepare(result, (uint64_t)a2);
  }
  return result;
}

int32x2_t *RB::CustomEffect::render(uint64_t a1, uint64_t a2, uint64_t **a3, long long *a4, RB::Texture *a5, int32x2_t a6, float a7, uint64_t a8, float64x2_t *a9, float32x2_t *a10, char a11, __int16 a12, char a13)
{
  uint64_t result = *(int32x2_t **)a1;
  if (result)
  {
    _S8 = a7;
    if ((*(_DWORD *)(a1 + 224) & 3) == 2)
    {
      unsigned int v22 = 3;
    }
    else if ((*(_DWORD *)(a1 + 224) & 3) != 0)
    {
      unsigned int v22 = 0;
    }
    else if (*(void *)(a1 + 128))
    {
      unsigned int v22 = 4;
    }
    else
    {
      unsigned int v22 = 2;
    }
    uint64_t v23 = **a3;
    *(void *)&float64_t v24 = a1 + 8;
    float64_t v25 = *(double *)(a1 + 112);
    if (*(void *)(a1 + 104)) {
      float64_t v24 = *(double *)(a1 + 104);
    }
    *(float64_t *)v127.i64 = v24;
    *(float64_t *)&v127.i64[1] = v25;
    uint64_t result = (int32x2_t *)RB::CustomShader::Function::function((uint64_t)result, v23, v22, &v127);
    if (result)
    {
      double v26 = result;
      RB::RenderFrame::add_function(**a3, (Function *)result);
      uint64_t result = (int32x2_t *)RB::RenderFrame::alloc_buffer_region((RB::RenderFrame *)**a3, (RB::Device *)(v26[10].u32[0] + 56), 4uLL, 0, &v125);
      if (v125)
      {
        v106 = a5;
        int8x16_t v27 = *(int8x16_t *)(a1 + 176);
        int8x16_t v127 = *(int8x16_t *)(a1 + 160);
        int8x16_t v128 = v27;
        int8x16_t v129 = *(int8x16_t *)(a1 + 192);
        float64x2_t v28 = v26;
        BOOL v29 = RB::AffineTransform::invert((RB::AffineTransform *)&v127);
        float64x2_t v30 = v29 ? (float64x2_t *)&v127 : (float64x2_t *)(a1 + 160);
        float64x2_t v31 = *v30;
        float64x2_t v32 = v29 ? &v128 : (int8x16_t *)(a1 + 176);
        float64x2_t v33 = *(float64x2_t *)v32;
        float64x2_t v34 = v29 ? (float64x2_t *)&v129 : (float64x2_t *)(a1 + 192);
        float64x2_t v35 = vmlaq_n_f64(vmlaq_n_f64(*v34, v31, (double)-a6.i32[0]), v33, (double)-a6.i32[1]);
        float64x2_t v122 = v31;
        float64x2_t v123 = v33;
        float64x2_t v124 = v35;
        *(double *)v36.i64 = RB::operator*(a9, &v122);
        int8x16_t v107 = v37;
        int8x16_t v108 = v36;
        int8x16_t v109 = v38;
        int8x16_t v127 = v36;
        int8x16_t v128 = v37;
        int8x16_t v129 = v38;
        unint64_t v39 = RB::AffineTransform::invert((RB::AffineTransform *)&v127) ? -1 : 0;
        int8x16_t v40 = (int8x16_t)vdupq_n_s64(v39);
        int32x4_t v41 = (int32x4_t)vbslq_s8(v40, v128, v107);
        v121[0] = (float64x2_t)vbslq_s8(v40, v127, v108);
        v121[1] = (float64x2_t)v41;
        long long v120 = *a4;
        float32x2_t v42 = vabs_f32(*(float32x2_t *)(a1 + 136));
        *(int32x2_t *)v41.i8 = vcgt_f32((float32x2_t)vdup_n_s32(0x7F7FFFFFu), *(float32x2_t *)((char *)&v120 + 8));
        int8x16_t v43 = (int8x16_t)vcltzq_s32(v41);
        int8x8_t v44 = (int8x8_t)vmvnq_s8(v43).u64[0];
        int8x8_t v45 = (int8x8_t)vmla_f32(*(float32x2_t *)((char *)&v120 + 8), (float32x2_t)0x4000000040000000, v42);
        *(int8x8_t *)&long long v46 = vorr_s8(vand_s8((int8x8_t)vsub_f32(*(float32x2_t *)&v120, v42), *(int8x8_t *)v43.i8), vand_s8(*(int8x8_t *)&v120, v44));
        *((int8x8_t *)&v46 + 1) = vorr_s8(vand_s8(v45, *(int8x8_t *)v43.i8), vand_s8(*(int8x8_t *)((char *)&v120 + 8), v44));
        v121[2] = (float64x2_t)vbslq_s8(v40, v129, v109);
        long long v120 = v46;
        uint64_t v47 = *((void *)v125 + 7) + v126.i64[0];
        v118 = 0;
        int64x2_t v119 = 0uLL;
        v117 = 0;
        uint64_t result = (int32x2_t *)RB::CustomShader::Closure::marshal_args((void *)a1, (uint64_t)a3, (uint64_t)v26, (_OWORD *)(a1 + 208), v47 + 56, (uint64_t)&v118, &v117);
        if (result)
        {
          uint64_t result = (int32x2_t *)RB::CustomShader::Closure::marshal_layer_arg(a1, (uint64_t)a3, v47 + 56, v26[10].i32[1], v121, a10);
          if (result)
          {
            unint64_t v51 = *(void *)(a1 + 128);
            if (!v51)
            {
              v55 = 0;
LABEL_43:
              v48.i32[0] = 0;
              int32x2_t v87 = (int32x2_t)a3[21];
              uint32x2_t v88 = (uint32x2_t)vceq_s32(v87, (int32x2_t)0x8000000080000000);
              int8x8_t v89 = (int8x8_t)vdup_lane_s32(vcgt_s32(v48, (int32x2_t)vpmin_u32(v88, v88)), 0);
              int8x8_t v90 = (int8x8_t)vcvt_f32_s32(v87);
              int8x8_t v91 = (int8x8_t)vdup_n_s32(0x7F7FFFFFu);
              RB::Rect::intersect((float32x2_t *)&v120, COERCE_DOUBLE(vbsl_s8(v89, (int8x8_t)0x100000001000000, (int8x8_t)vcvt_f32_s32((int32x2_t)a3[20]))), (float32x2_t)vbsl_s8(v89, v91, v90), *(double *)&v91, *(double *)&v89, v49, v50);
              RB::Coverage::set_plane((float32x2_t *)v47, (float32x2_t *)a3, *(float32x2_t *)&v120, *((double *)&v120 + 1));
              v92 = a3[13];
              v93.i64[0] = (int)v92;
              v93.i64[1] = SHIDWORD(v92);
              __asm { FMOV            V1.2D, #0.5 }
              _Q0 = vmulq_f64(vcvtq_f64_s64(v93), _Q1);
              float64x2_t v96 = vmulq_n_f64(v122, _Q0.f64[0]);
              float64x2_t v97 = vmulq_n_f64(v123, -_Q0.f64[1]);
              float64x2_t v98 = vmlaq_laneq_f64(vaddq_f64(v96, v124), v123, _Q0, 1);
              *(float32x2_t *)(v47 + 28) = vcvt_f32_f64(v96);
              *(float32x2_t *)(v47 + 36) = vcvt_f32_f64(v97);
              *(float32x2_t *)(v47 + 44) = vcvt_f32_f64(v98);
              __asm { FCVT            H0, S8 }
              *(_WORD *)(v47 + 52) = LOWORD(_Q0.f64[0]);
              *((_DWORD *)a3 + 46) = RB::RenderFrame::buffer_id((RB::RenderFrame *)**a3, v125);
              *(uint64_t **)((char *)a3 + 188) = (uint64_t *)vmovn_s64(v126);
              *((_DWORD *)a3 + 55) = RB::RenderFrame::buffer_id((RB::RenderFrame *)**a3, v118);
              a3[28] = (uint64_t *)vmovn_s64(v119);
              if (v117) {
                *((_DWORD *)a3 + 58) = RB::RenderFrame::texture_id((RB::RenderFrame *)**a3, (uint64_t)v117);
              }
              unsigned int v99 = *(_DWORD *)(a1 + 224);
              unsigned __int32 v100 = v26[12].u32[1];
              if (*((_DWORD *)a3 + 34) == 2) {
                int v101 = 131110;
              }
              else {
                int v101 = 38;
              }
              if (a11) {
                int v102 = 0x10000;
              }
              else {
                int v102 = 0;
              }
              __int32 v103 = v26->i32[0];
              __int32 v104 = v28->i32[1];
              id v105 = v106;
              if (!v106) {
                id v105 = RB::Device::clear_texture(*(id **)**a3);
              }
              if (!v55) {
                v55 = (int32x2_t *)RB::Device::clear_texture(*(id **)**a3);
              }
              *((_DWORD *)a3 + 60) = RB::RenderFrame::texture_id((RB::RenderFrame *)**a3, (uint64_t)v105);
              *((unsigned char *)a3 + 244) = 2;
              *((_DWORD *)a3 + 62) = RB::RenderFrame::texture_id((RB::RenderFrame *)**a3, (uint64_t)v55);
              *((unsigned char *)a3 + 252) = 2;
              RB::Bounds::Bounds(v112, *(float32x2_t *)&v120, *(float32x2_t *)((char *)&v120 + 8));
              uint64_t result = RB::RenderPass::draw_indexed_primitives((int32x2_t *)a3, (const char *)((v102 | v101 | (((v100 >> 30) & 2 | (v99 >> 2) & 1 | (4 * (v104 & 7))) << 6)) ^ 0x80 | ((unint64_t)(a13 & 0x3F | (v103 << 6)) << 32)), 4, *(void *)**a3 + 80, 0, 1uLL, v112[0], v112[1]);
              *((_DWORD *)a3 + 62) = 0;
              *((unsigned char *)a3 + 252) = 0;
              *((_DWORD *)a3 + 60) = 0;
              *((unsigned char *)a3 + 244) = 0;
              *(uint64_t **)((char *)a3 + 220) = 0;
              *(uint64_t **)((char *)a3 + 228) = 0;
              *((unsigned char *)a3 + 236) = 0;
              return result;
            }
            uint64_t result = *(int32x2_t **)(a2 + 32);
            if (result)
            {
              int8x16_t v127 = (int8x16_t)xmmword_2142181C0;
              int8x16_t v128 = (int8x16_t)xmmword_2142181D0;
              int8x16_t v129 = 0uLL;
              float32x2_t v115 = 0;
              float32x2_t v116 = 0;
              task = (int32x2_t *)RB::DisplayList::LayerTask::find_task((RB::DisplayList::LayerTask *)result, v51, 0);
              if (!task) {
                goto LABEL_34;
              }
              v53 = task;
              int32x2_t v54 = task[11];
              if (v54)
              {
                v55 = *(int32x2_t **)(*(void *)&v54 + 16);
                int32x2_t v56 = task[15];
                uint32x2_t v57 = (uint32x2_t)vceq_s32(v56, (int32x2_t)0x8000000080000000);
                if ((vpmin_u32(v57, v57).u32[0] & 0x80000000) != 0)
                {
                  float32x2_t v60 = (float32x2_t)vdup_n_s32(0x7F7FFFFFu);
                  float32x2_t v59 = (float32x2_t)0x100000001000000;
                  float32x2_t v61 = (float32x2_t)0x100000001000000;
                }
                else
                {
                  int32x2_t v58 = task[14];
                  float32x2_t v59 = vcvt_f32_s32(vadd_s32(v58, a6));
                  float32x2_t v60 = vcvt_f32_s32(v56);
                  float32x2_t v61 = vcvt_f32_s32(vsub_s32(vadd_s32(task[8], v58), task[13]));
                }
                float32x2_t v115 = v61;
                float32x2_t v116 = v60;
                float32x2_t v111 = vcvt_f32_s32(v55[8]);
                float32x2_t v62 = vdiv_f32(vmul_f32(v60, v111), v60);
                v63.f64[0] = 0.0;
                v63.f64[1] = v62.f32[1];
                v114[0] = (float64x2_t)COERCE_UNSIGNED_INT64(v62.f32[0]);
                v114[1] = v63;
                v114[2] = vcvtq_f64_f32(vsub_f32(v59, vdiv_f32(vmul_f32(v61, v60), v60)));
                *(double *)&long long v64 = RB::operator*(v114, &v122);
                v113[0] = v64;
                v113[1] = v65;
                v113[2] = v66;
                __n128 v67 = RB::AffineTransform::inverse((RB::AffineTransform *)v113);
                int8x16_t v127 = (int8x16_t)v67;
                int8x16_t v128 = (int8x16_t)v68;
                int8x16_t v129 = v70;
                if ((*(unsigned char *)(a1 + 224) & 0x10) == 0)
                {
                  *(float32x2_t *)v68.i8 = vabs_f32(*(float32x2_t *)(a1 + 144));
                  v67.n128_u64[0] = (unint64_t)vcgt_f32((float32x2_t)vdup_n_s32(0x7F7FFFFFu), v60);
                  int8x8_t v71 = (int8x8_t)vcltzq_s32((int32x4_t)v67).u64[0];
                  double v72 = COERCE_DOUBLE(vbsl_s8(v71, (int8x8_t)vsub_f32(v59, *(float32x2_t *)v68.i8), (int8x8_t)v59));
                  int8x8_t v73 = (int8x8_t)vmla_f32(v60, (float32x2_t)0x4000000040000000, *(float32x2_t *)v68.i8);
                  *(int8x8_t *)v68.i8 = vbsl_s8(v71, v73, (int8x8_t)v60);
                  RB::Rect::Union((float32x2_t *)&v120, v72, v68, 2.00000048, *(double *)&v71, *(double *)&v73, v69);
                }
                if (v53[16].i8[0])
                {
                  v67.n128_u64[0] = (unint64_t)vcgt_f32((float32x2_t)vdup_n_s32(0x7F7FFFFFu), v116);
                  int8x8_t v76 = (int8x8_t)vcltzq_s32((int32x4_t)v67).u64[0];
                  float32x2_t v74 = (float32x2_t)vbsl_s8(v76, (int8x8_t)vadd_f32(v115, (float32x2_t)0xBF000000BF000000), (int8x8_t)v115);
                  __asm { FMOV            V2.2S, #1.0 }
                  float32x2_t v75 = (float32x2_t)vbsl_s8(v76, (int8x8_t)vadd_f32(v116, _D2), (int8x8_t)v116);
                }
                else
                {
                  v67.n128_u32[0] = 0.5;
                  RB::Rect::inset(&v115, (float32x2_t)v67.n128_u64[0], 0.5);
                  float32x2_t v74 = v115;
                  float32x2_t v75 = v116;
                }
                float32x2_t v82 = vrecpe_f32((float32x2_t)v111.u32[0]);
                float32x2_t v83 = vmul_f32(vrecps_f32((float32x2_t)v111.u32[0], v82), v82);
                float32x2_t v84 = vrecpe_f32((float32x2_t)v111.u32[1]);
                float32x2_t v85 = vmul_f32(vrecps_f32((float32x2_t)v111.u32[1], v84), v84);
                float32x2_t v86 = (float32x2_t)vzip1_s32((int32x2_t)vmul_f32(v83, vrecps_f32((float32x2_t)v111.u32[0], v83)), (int32x2_t)vmul_f32(v85, vrecps_f32((float32x2_t)v111.u32[1], v85)));
                float32x2_t v115 = vmul_f32(v86, v74);
                float32x2_t v116 = vmul_f32(v75, v86);
              }
              else
              {
LABEL_34:
                v55 = 0;
              }
              uint64_t result = (int32x2_t *)RB::CustomShader::Closure::marshal_layer_arg(a1, (uint64_t)a3, v47 + 56, v26[11].i32[0], (float64x2_t *)&v127, &v115);
              if (result) {
                goto LABEL_43;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_2141FBDA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  *(_DWORD *)(a20 + 240) = 0;
  *(unsigned char *)(a20 + 244) = 0;
  _Unwind_Resume(a1);
}

uint64_t *RB::CustomEffect::prepare_encode(uint64_t **this, RB::Encoder *a2)
{
  RB::CustomShader::Closure::prepare_encode((RB::CustomShader::Closure *)this, a2);
  uint64_t result = this[16];
  if (result)
  {
    return RB::DisplayList::Layer::prepare_encode(result, a2);
  }
  return result;
}

void *RB::CustomEffect::encode(RB::CustomEffect *this, RB::Encoder *a2)
{
  RB::ProtobufEncoder::encode_varint(a2, 0xAuLL);
  RB::ProtobufEncoder::begin_length_delimited(a2);
  RB::CustomShader::Closure::encode((RB::CustomShader::Function **)this, a2);
  RB::ProtobufEncoder::end_length_delimited(a2);
  uint64_t result = RB::ProtobufEncoder::float2_field(a2, 2, *((double *)this + 17));
  int64x2_t v5 = (int64x2_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f64(*((float64x2_t *)this + 11), (float64x2_t)xmmword_2142181D0), (int8x16_t)vceqq_f64(*((float64x2_t *)this + 10), (float64x2_t)xmmword_2142181C0)), (int8x16_t)vceqzq_f64(*((float64x2_t *)this + 12)));
  if ((vandq_s8((int8x16_t)vdupq_laneq_s64(v5, 1), (int8x16_t)v5).u64[0] & 0x8000000000000000) == 0)
  {
    RB::ProtobufEncoder::encode_varint(a2, 0x1AuLL);
    RB::ProtobufEncoder::begin_length_delimited(a2);
    RB::AffineTransform::encode((double *)this + 20, a2);
    uint64_t result = RB::ProtobufEncoder::end_length_delimited(a2);
  }
  int v6 = *((_DWORD *)this + 56);
  if ((v6 & 3) == 2)
  {
    RB::ProtobufEncoder::encode_varint(a2, 0x20uLL);
    uint64_t result = RB::ProtobufEncoder::encode_varint(a2, 1uLL);
    int v6 = *((_DWORD *)this + 56);
  }
  if ((v6 & 4) != 0)
  {
    RB::ProtobufEncoder::encode_varint(a2, 0x28uLL);
    uint64_t result = RB::ProtobufEncoder::encode_varint(a2, 1uLL);
  }
  uint32x2_t v7 = (uint32x2_t)vcgtz_f32(*(float32x2_t *)((char *)this + 216));
  if ((vpmin_u32(v7, v7).u32[0] & 0x80000000) != 0) {
    uint64_t result = RB::ProtobufEncoder::float4_field(a2, 6, *((float32x4_t *)this + 13));
  }
  if ((*((unsigned char *)this + 224) & 8) != 0)
  {
    RB::ProtobufEncoder::encode_varint(a2, 0x38uLL);
    uint64_t result = RB::ProtobufEncoder::encode_varint(a2, 1uLL);
  }
  float32x2_t v8 = (void **)*((void *)this + 16);
  if (v8)
  {
    RB::ProtobufEncoder::encode_varint(a2, 0x42uLL);
    RB::ProtobufEncoder::begin_length_delimited(a2);
    RB::DisplayList::Layer::encode(v8, a2);
    RB::ProtobufEncoder::end_length_delimited(a2);
    double v9 = *((double *)this + 18);
    return RB::ProtobufEncoder::float2_field(a2, 9, v9);
  }
  return result;
}

unint64_t RB::CustomEffect::decode(RB::DisplayList::Layer **this, size_t **a2)
{
  unint64_t result = RB::ProtobufDecoder::next_field((RB::ProtobufDecoder *)a2);
  if (result)
  {
    unint64_t v6 = result;
    do
    {
      switch((v6 >> 3))
      {
        case 1u:
          if ((v6 & 7) != 2) {
            goto LABEL_29;
          }
          RB::ProtobufDecoder::begin_message((RB::ProtobufDecoder *)a2);
          RB::CustomShader::Closure::decode((RB::CustomShader::Closure *)this, (RB::Decoder *)a2);
          goto LABEL_25;
        case 2u:
          this[17] = (RB::DisplayList::Layer *)RB::ProtobufDecoder::float2_field((RB::ProtobufDecoder *)a2, v6, v5).n128_u64[0];
          break;
        case 3u:
          if ((v6 & 7) != 2) {
            goto LABEL_29;
          }
          RB::ProtobufDecoder::begin_message((RB::ProtobufDecoder *)a2);
          RB::AffineTransform::decode((RB::AffineTransform *)(this + 20), (RB::ProtobufDecoder *)a2);
          goto LABEL_25;
        case 4u:
          *((_DWORD *)this + 56) &= 0xFFFFFFFC;
          if (!RB::ProtobufDecoder::BOOL_field((RB::ProtobufDecoder *)a2, v6)) {
            break;
          }
          int v7 = *((_DWORD *)this + 56) | 2;
          goto LABEL_20;
        case 5u:
          if (RB::ProtobufDecoder::BOOL_field((RB::ProtobufDecoder *)a2, v6)) {
            int v8 = 4;
          }
          else {
            int v8 = 0;
          }
          goto LABEL_19;
        case 6u:
          *((__n128 *)this + 13) = RB::ProtobufDecoder::float4_field((RB::ProtobufDecoder *)a2, v6);
          break;
        case 7u:
          if (RB::ProtobufDecoder::BOOL_field((RB::ProtobufDecoder *)a2, v6)) {
            int v8 = 8;
          }
          else {
            int v8 = 0;
          }
LABEL_19:
          int v7 = *((_DWORD *)this + 56) | v8;
LABEL_20:
          *((_DWORD *)this + 56) = v7;
          break;
        case 8u:
          uint64_t v12 = 0;
          uint64_t v9 = RB::Heap::emplace<RB::DisplayList::Layer,unsigned int,int>(a2[8], (int *)&v12 + 1, (int *)&v12);
          float32x2_t v10 = this[16];
          this[16] = (RB::DisplayList::Layer *)v9;
          if (v10) {
            RB::DisplayList::Layer::~Layer(v10);
          }
          if ((v6 & 7) == 2)
          {
            double v11 = this[16];
            RB::ProtobufDecoder::begin_message((RB::ProtobufDecoder *)a2);
            RB::DisplayList::Layer::decode(v11, (RB::Decoder *)a2);
LABEL_25:
            RB::ProtobufDecoder::end_message((uint64_t)a2);
          }
          else
          {
LABEL_29:
            *((unsigned char *)a2 + 56) = 1;
            *a2 = a2[1];
          }
          break;
        case 9u:
          this[18] = (RB::DisplayList::Layer *)RB::ProtobufDecoder::float2_field((RB::ProtobufDecoder *)a2, v6, v5).n128_u64[0];
          break;
        default:
          RB::ProtobufDecoder::skip_field((RB::ProtobufDecoder *)a2, v6);
          break;
      }
      unint64_t result = RB::ProtobufDecoder::next_field((RB::ProtobufDecoder *)a2);
      unint64_t v6 = result;
    }
    while (result);
  }
  return result;
}

void RB::CustomEffect::print(RB::CustomEffect *this, std::string *a2)
{
  RB::SexpString::push(a2, "custom-filter");
  if ((*((_DWORD *)this + 56) & 3) == 2) {
    uint32x2_t v4 = "warp";
  }
  else {
    uint32x2_t v4 = "layer";
  }
  RB::SexpString::printf(a2, 0, "#:type %s", v4);
  if (*(void *)this) {
    RB::SexpString::printf(a2, 0, "#:shader %s", (const char *)[*(id *)(*(void *)this + 24) UTF8String]);
  }
  int v5 = *((_DWORD *)this + 56);
  if ((v5 & 4) != 0)
  {
    RB::SexpString::printf(a2, 0, "#:dither");
    int v5 = *((_DWORD *)this + 56);
  }
  if ((v5 & 8) != 0) {
    RB::SexpString::printf(a2, 0, "#:alpha-only");
  }
  float32x2_t v6 = *(float32x2_t *)((char *)this + 216);
  uint32x2_t v7 = (uint32x2_t)vcgtz_f32(v6);
  if ((vpmin_u32(v7, v7).u32[0] & 0x80000000) != 0) {
    RB::SexpString::printf(a2, 0, "(bounds %g %g %g %g)", COERCE_FLOAT(*((void *)this + 26)), COERCE_FLOAT(HIDWORD(*((void *)this + 26))), v6.f32[0], v6.f32[1]);
  }
  int v8 = (RB::DisplayList::Layer *)*((void *)this + 16);
  if (v8) {
    RB::DisplayList::Layer::print(v8, a2);
  }
  RB::SexpString::pop(a2);
}

std::string *RB::XML::Value::Bool::to_string(uint64_t a1, std::string *this)
{
  if (*(unsigned char *)(a1 + 8)) {
    return std::string::append(this, "true", 4uLL);
  }
  else {
    return std::string::append(this, "false", 5uLL);
  }
}

std::string *RB::XML::Value::Int::to_string(uint64_t a1, std::string *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  snprintf_l(__s, 0x80uLL, 0, "%ld", *(void *)(a1 + 8));
  size_t v3 = strlen(__s);
  return std::string::append(a2, __s, v3);
}

std::string *RB::XML::Value::Float::to_string(uint64_t a1, std::string *a2, char a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  double v4 = *(double *)(a1 + 8);
  double v5 = round(v4 * 32.0) * 0.03125;
  if ((a3 & 2) != 0) {
    double v4 = v5;
  }
  snprintf_l(__s, 0x80uLL, 0, "%g", v4);
  size_t v6 = strlen(__s);
  return std::string::append(a2, __s, v6);
}

std::string *RB::XML::Value::ConstantString::to_string(uint64_t a1, std::string *a2)
{
  size_t v3 = *(const char **)(a1 + 8);
  size_t v4 = strlen(v3);
  return std::string::append(a2, v3, v4);
}

std::string *RB::XML::Value::StateID::to_string(uint64_t a1, std::string *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  snprintf_l(__s, 0x80uLL, 0, "#%ld", *(void *)(a1 + 8));
  size_t v3 = strlen(__s);
  return std::string::append(a2, __s, v3);
}

std::string *RB::XML::Value::Angle::to_string(uint64_t a1, std::string *a2, char a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  double v4 = *(double *)(a1 + 8);
  double v5 = v4 * 57.2957795;
  double v6 = round(v4 * 1833.46494) * 0.03125;
  if ((a3 & 2) == 0) {
    double v6 = v5;
  }
  snprintf_l(__s, 0x80uLL, 0, "%g deg", v6);
  size_t v7 = strlen(__s);
  return std::string::append(a2, __s, v7);
}

std::string *RB::XML::Value::Vec2::to_string(uint64_t a1, std::string *a2, char a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  double v4 = *(double *)(a1 + 8);
  double v5 = round(v4 * 32.0) * 0.03125;
  if ((a3 & 2) != 0) {
    double v4 = v5;
  }
  double v6 = round(*(double *)(a1 + 16) * 32.0) * 0.03125;
  if ((a3 & 2) == 0) {
    double v6 = *(double *)(a1 + 16);
  }
  snprintf_l(__s, 0x80uLL, 0, "%g %g", v4, v6);
  size_t v7 = strlen(__s);
  return std::string::append(a2, __s, v7);
}

std::string *RB::XML::Value::Vec3::to_string(double *a1, std::string *a2, char a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  double v4 = a1[1];
  double v5 = a1[2];
  double v6 = round(v4 * 32.0) * 0.03125;
  if ((a3 & 2) != 0) {
    double v4 = v6;
  }
  double v7 = round(v5 * 32.0) * 0.03125;
  if ((a3 & 2) != 0) {
    double v5 = v7;
  }
  double v8 = round(a1[3] * 32.0) * 0.03125;
  if ((a3 & 2) == 0) {
    double v8 = a1[3];
  }
  snprintf_l(__s, 0xC0uLL, 0, "%g %g %g", v4, v5, v8);
  size_t v9 = strlen(__s);
  return std::string::append(a2, __s, v9);
}

std::string *RB::XML::Value::Vec4::to_string(double *a1, std::string *a2, char a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  double v4 = a1[1];
  double v5 = a1[2];
  double v6 = round(v4 * 32.0) * 0.03125;
  if ((a3 & 2) != 0) {
    double v4 = v6;
  }
  double v7 = round(v5 * 32.0) * 0.03125;
  if ((a3 & 2) != 0) {
    double v5 = v7;
  }
  double v8 = a1[3];
  double v9 = round(v8 * 32.0) * 0.03125;
  if ((a3 & 2) != 0) {
    double v8 = v9;
  }
  double v10 = round(a1[4] * 32.0) * 0.03125;
  if ((a3 & 2) == 0) {
    double v10 = a1[4];
  }
  snprintf_l(__s, 0x100uLL, 0, "%g %g %g %g", v4, v5, v8, v10);
  size_t v11 = strlen(__s);
  return std::string::append(a2, __s, v11);
}

std::string *RB::XML::Value::AffineMatrix::to_string(double *a1, std::string *a2, char a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  double v4 = a1[1];
  double v5 = a1[2];
  double v6 = round(v4 * 32.0) * 0.03125;
  if ((a3 & 2) != 0) {
    double v4 = v6;
  }
  double v7 = round(v5 * 32.0) * 0.03125;
  if ((a3 & 2) != 0) {
    double v5 = v7;
  }
  double v8 = a1[3];
  double v9 = a1[4];
  double v10 = round(v8 * 32.0) * 0.03125;
  if ((a3 & 2) != 0) {
    double v8 = v10;
  }
  double v11 = round(v9 * 32.0) * 0.03125;
  if ((a3 & 2) != 0) {
    double v9 = v11;
  }
  double v12 = a1[5];
  double v13 = round(v12 * 32.0) * 0.03125;
  if ((a3 & 2) != 0) {
    double v12 = v13;
  }
  double v14 = round(a1[6] * 32.0) * 0.03125;
  if ((a3 & 2) == 0) {
    double v14 = a1[6];
  }
  snprintf_l(__s, 0x100uLL, 0, "%g %g %g %g %g %g", v4, v5, v8, v9, v12, v14);
  size_t v15 = strlen(__s);
  return std::string::append(a2, __s, v15);
}

std::string *RB::XML::Value::Transform::to_string(uint64_t a1, std::string *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  double v3 = *(double *)(a1 + 8);
  if (v3 == 1.0 && *(double *)(a1 + 16) == 0.0 && *(double *)(a1 + 24) == 0.0 && *(double *)(a1 + 32) == 1.0)
  {
    snprintf_l(__s, 0x100uLL, 0, "translate(%g, %g)");
    goto LABEL_17;
  }
  if (*(double *)(a1 + 40) != 0.0 || *(double *)(a1 + 48) != 0.0)
  {
LABEL_16:
    snprintf_l(__s, 0x100uLL, 0, "matrix(%g, %g; %g, %g; %g, %g)");
    goto LABEL_17;
  }
  long double v4 = *(double *)(a1 + 16);
  if (v4 != 0.0 || *(double *)(a1 + 24) != 0.0)
  {
    if (v3 == *(double *)(a1 + 32) && v4 == -*(double *)(a1 + 24))
    {
      double v5 = acos(*(long double *)(a1 + 8));
      if (vabdd_f64(asin(v4), v5) < 0.0001)
      {
        snprintf_l(__s, 0x100uLL, 0, "rotate(%g)");
        goto LABEL_17;
      }
    }
    goto LABEL_16;
  }
  if (v3 == *(double *)(a1 + 32)) {
    snprintf_l(__s, 0x100uLL, 0, "scale(%g)");
  }
  else {
    snprintf_l(__s, 0x100uLL, 0, "scale(%g, %g)");
  }
LABEL_17:
  size_t v6 = strlen(__s);
  return std::string::append(a2, __s, v6);
}

std::string *RB::XML::Value::BlendMode::to_string(std::string *result, std::string *a2)
{
  uint64_t v3 = LODWORD(result->__r_.__value_.__r.__words[1]);
  if (v3 > 0x1B)
  {
    unsigned int v5 = v3 - 1000;
    if (v5 > 9) {
      return result;
    }
    long double v4 = &RB::XML::Value::BlendMode::to_string(std::string &,unsigned int)const::custom_names[v5];
  }
  else
  {
    long double v4 = &RB::XML::Value::BlendMode::to_string(std::string &,unsigned int)const::cg_names[v3];
  }
  size_t v6 = *v4;
  size_t v7 = strlen(*v4);
  return std::string::append(a2, v6, v7);
}

std::string *RB::XML::Value::AlphaBlendMode::to_string(std::string *result, std::string *a2)
{
  uint64_t v2 = LODWORD(result->__r_.__value_.__r.__words[1]);
  if (v2 <= 3)
  {
    long double v4 = off_2641F9910[v2];
    size_t v5 = strlen(v4);
    return std::string::append(a2, v4, v5);
  }
  return result;
}

std::string *RB::XML::Value::ClipMode::to_string(std::string *result, std::string *a2)
{
  uint64_t v2 = LODWORD(result->__r_.__value_.__r.__words[1]);
  if (v2 <= 1)
  {
    long double v4 = off_2641F9930[v2];
    size_t v5 = strlen(v4);
    return std::string::append(a2, v4, v5);
  }
  return result;
}

std::string *RB::XML::Value::InterpolationMode::to_string(std::string *result, std::string *a2)
{
  uint64_t v2 = LODWORD(result->__r_.__value_.__r.__words[1]);
  if (v2 <= 0xC)
  {
    long double v4 = off_2641F9940[v2];
    size_t v5 = strlen(v4);
    return std::string::append(a2, v4, v5);
  }
  return result;
}

std::string *RB::XML::Value::LineCap::to_string(std::string *result, std::string *a2)
{
  unint64_t v2 = result->__r_.__value_.__s.__data_[8];
  if (v2 <= 6)
  {
    long double v4 = off_2641F99A8[v2];
    size_t v5 = strlen(v4);
    return std::string::append(a2, v4, v5);
  }
  return result;
}

std::string *RB::XML::Value::LineJoin::to_string(std::string *result, std::string *a2)
{
  unint64_t v2 = result->__r_.__value_.__s.__data_[8];
  if (v2 <= 2)
  {
    long double v4 = off_2641F99E0[v2];
    size_t v5 = strlen(v4);
    return std::string::append(a2, v4, v5);
  }
  return result;
}

RB::XML::Value::Color *RB::XML::Value::Color::Color(RB::XML::Value::Color *this, float16x4_t *a2)
{
  *(void *)this = &unk_26C4ED578;
  *(float32x4_t *)((char *)this + 8) = vcvtq_f32_f16(*a2);
  *((_DWORD *)this + 6) = rb_color_space(a2[1].i16[0]);
  return this;
}

std::string *RB::XML::Value::Color::to_string(uint64_t a1, std::string *a2, int a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  int v4 = *(_DWORD *)(a1 + 24);
  if (v4) {
    BOOL v5 = v4 == 2;
  }
  else {
    BOOL v5 = a3 < 0;
  }
  float v7 = *(float *)(a1 + 8);
  float v6 = *(float *)(a1 + 12);
  float v8 = *(float *)(a1 + 20);
  if (v5)
  {
    float v9 = -v7;
    if (v7 > 0.0) {
      float v9 = *(float *)(a1 + 8);
    }
    float v14 = *(float *)(a1 + 12);
    float v15 = *(float *)(a1 + 16);
    if (v9 > 0.0031308)
    {
      powf(v9, 0.41667);
      float v6 = v14;
    }
    float v10 = -v6;
    if (v6 > 0.0) {
      float v10 = v6;
    }
    if (v10 > 0.0031308) {
      powf(v10, 0.41667);
    }
    float v11 = -v15;
    if (v15 > 0.0) {
      float v11 = v15;
    }
    if (v11 > 0.0031308) {
      powf(v11, 0.41667);
    }
  }
  if (v8 == 1.0) {
    snprintf_l(__s, 0x100uLL, 0, "rgb(%g, %g, %g)");
  }
  else {
    snprintf_l(__s, 0x100uLL, 0, "rgba(%g, %g, %g, %g)");
  }
  size_t v12 = strlen(__s);
  return std::string::append(a2, __s, v12);
}

std::string *RB::XML::Value::ColorSpace::to_string(std::string *result, std::string *a2)
{
  uint64_t v2 = LODWORD(result->__r_.__value_.__r.__words[1]);
  if (v2 <= 4)
  {
    int v4 = off_2641F99F8[v2];
    size_t v5 = strlen(v4);
    return std::string::append(a2, v4, v5);
  }
  return result;
}

std::string *RB::XML::Value::ColorMatrix::to_string(uint64_t a1, std::string *a2, char a3, int32x4_t a4, double a5, double a6, int32x4_t a7)
{
  uint64_t v8 = 0;
  uint64_t v15 = *MEMORY[0x263EF8340];
  v9.i64[0] = 0x4200000042000000;
  v9.i64[1] = 0x4200000042000000;
  v10.i64[0] = 0x3D0000003D000000;
  v10.i64[1] = 0x3D0000003D000000;
  do
  {
    a7.i32[0] = 0;
    a4.i32[0] = a3 & 2;
    a7 = (int32x4_t)vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vceqq_s32(a4, a7), 0), *(int8x16_t *)(a1 + 8 + v8 * 4), (int8x16_t)vmulq_f32(vrndaq_f32(vmulq_f32(*(float32x4_t *)(a1 + 8 + v8 * 4), v9)), v10));
    *(int32x4_t *)&v14[v8] = a7;
    v8 += 4;
  }
  while (v8 != 20);
  snprintf_l(__s, 0x500uLL, 0, "%g %g %g %g; %g %g %g %g; %g %g %g %g; %g %g %g %g; %g %g %g %g",
    v14[0],
    v14[1],
    v14[2],
    v14[3],
    v14[4],
    v14[5],
    v14[6],
    v14[7],
    v14[8],
    v14[9],
    v14[10],
    v14[11],
    v14[12],
    v14[13],
    v14[14],
    v14[15],
    v14[16],
    v14[17],
    v14[18],
    v14[19]);
  size_t v11 = strlen(__s);
  return std::string::append(a2, __s, v11);
}

std::string *RB::XML::Value::ColorArray::to_string(std::string *result, std::string *this, int a3)
{
  if (result->__r_.__value_.__r.__words[2])
  {
    uint64_t v5 = (uint64_t)result;
    unint64_t v6 = 0;
    do
    {
      int v7 = *(_DWORD *)(v5 + 32);
      float32x4_t v8 = vcvtq_f32_f16(*(float16x4_t *)(*(void *)(v5 + 8) + 8 * v6));
      float32x4_t v9 = &unk_26C4ED578;
      float32x4_t v10 = v8;
      int v11 = v7;
      if (v6) {
        std::string::push_back(this, 32);
      }
      unint64_t result = RB::XML::Value::Color::to_string((uint64_t)&v9, this, a3);
      ++v6;
    }
    while (v6 < *(void *)(v5 + 16));
  }
  return result;
}

uint64_t RB::XML::Value::Path::to_string(uint64_t a1, uint64_t a2, int a3)
{
  return RBPathXMLDescription(*(void *)(a1 + 8), *(void *)(a1 + 16), a2, a3);
}

std::string *RB::XML::Value::Image::to_string(uint64_t a1, std::string *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  int v4 = *(_DWORD *)(a1 + 8);
  if (v4)
  {
LABEL_2:
    RB::ImageDescription::ImageDescription((RB::ImageDescription *)v11, v4, *(const void **)(a1 + 16));
    if (v12) {
      uint64_t v5 = ", 1";
    }
    else {
      uint64_t v5 = "";
    }
    snprintf_l(__s, 0x40uLL, 0, "placeholder(%llu, %llu, %llu%s)", v11[0], v11[1], v11[2], v5);
    size_t v6 = strlen(__s);
    return std::string::append(a2, __s, v6);
  }
  float32x4_t v8 = (void *)RBXMLRecorderExportCGImage(*(CGImage **)(a1 + 16));
  if (!v8)
  {
    int v4 = *(_DWORD *)(a1 + 8);
    goto LABEL_2;
  }
  float32x4_t v9 = (const char *)[v8 UTF8String];
  size_t v10 = strlen(v9);
  return std::string::append(a2, v9, v10);
}

void RB::XML::Value::Font::to_string(uint64_t a1, std::string *a2)
{
  CFStringRef v3 = CGFontCopyPostScriptName(*(CGFontRef *)(a1 + 8));
  if (v3)
  {
    int v4 = (void *)v3;
    std::string::append(a2, "name(", 5uLL);
    uint64_t v5 = (const char *)[v4 UTF8String];
    size_t v6 = strlen(v5);
    std::string::append(a2, v5, v6);
    std::string::append(a2, ")", 1uLL);
  }
  else
  {
    uint64_t v7 = CGFontCopyURL();
    if (!v7) {
      return;
    }
    int v4 = (void *)v7;
    float32x4_t v8 = (void *)MEMORY[0x21669B110]();
    float32x4_t v9 = (const char *)objc_msgSend((id)objc_msgSend(v4, "path"), "UTF8String");
    size_t v10 = strlen(v9);
    std::string::append(a2, v9, v10);
  }
  CFRelease(v4);
}

void sub_2141FD68C(_Unwind_Exception *a1)
{
  CFRelease(v1);
  _Unwind_Resume(a1);
}

std::string *RB::XML::Value::IntArray::to_string(std::string *result, std::string *this)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (result->__r_.__value_.__r.__words[2])
  {
    uint64_t v3 = (uint64_t)result;
    unint64_t v4 = 0;
    do
    {
      if (v4) {
        std::string::push_back(this, 32);
      }
      snprintf_l(__s, 0x40uLL, 0, "%ld", *(void *)(*(void *)(v3 + 8) + 8 * v4));
      size_t v5 = strlen(__s);
      unint64_t result = std::string::append(this, __s, v5);
      ++v4;
    }
    while (v4 < *(void *)(v3 + 16));
  }
  return result;
}

std::string *RB::XML::Value::FloatArray::to_string(std::string *result, std::string *this, char a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (result->__r_.__value_.__r.__words[2])
  {
    uint64_t v5 = (uint64_t)result;
    unint64_t v6 = 0;
    do
    {
      if (v6) {
        std::string::push_back(this, 32);
      }
      double v7 = *(double *)(*(void *)(v5 + 8) + 8 * v6);
      double v8 = round(v7 * 32.0) * 0.03125;
      if ((a3 & 2) != 0) {
        double v7 = v8;
      }
      snprintf_l(__s, 0x40uLL, 0, "%g", v7);
      size_t v9 = strlen(__s);
      unint64_t result = std::string::append(this, __s, v9);
      ++v6;
    }
    while (v6 < *(void *)(v5 + 16));
  }
  return result;
}

void RB::XML::Value::GlyphArray::to_string(uint64_t a1, std::string *this)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 48))
  {
    unint64_t v4 = 0;
    do
    {
      if (v4) {
        std::string::push_back(this, 32);
      }
      uint64_t v5 = (__CFString *)CGFontCopyGlyphNameForGlyph(*(CGFontRef *)(a1 + 32), *(_WORD *)(*(void *)(a1 + 40) + 2 * v4));
      if (v5)
      {
        std::string::push_back(this, 92);
        unint64_t v6 = (const char *)[(__CFString *)v5 UTF8String];
        size_t v7 = strlen(v6);
        std::string::append(this, v6, v7);
        CFRelease(v5);
      }
      else
      {
        snprintf_l(__s, 0x40uLL, 0, "%d", *(unsigned __int16 *)(*(void *)(a1 + 40) + 2 * v4));
        size_t v8 = strlen(__s);
        std::string::append(this, __s, v8);
      }
      ++v4;
    }
    while (v4 < *(void *)(a1 + 48));
  }
}

void sub_2141FD994(_Unwind_Exception *a1)
{
  CFRelease(v1);
  _Unwind_Resume(a1);
}

uint64_t RB::XML::Value::Stroke::to_string(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 8) applyFunction:RB::XML::Value::Stroke::to_string(std::string &,unsigned int)const::$_0::__invoke info:a2];
}

std::string *RB::XML::Value::StrokeType::to_string(std::string *result, std::string *this)
{
  int v2 = result->__r_.__value_.__r.__words[1];
  if (v2 == 1) {
    return std::string::append(this, "particles", 9uLL);
  }
  if (!v2) {
    return std::string::append(this, "lines", 5uLL);
  }
  return result;
}

RB::XML::Value::Gradient *RB::XML::Value::Gradient::Gradient(RB::XML::Value::Gradient *this, const RB::Fill::Gradient *a2)
{
  *((void *)this + 1) = 0;
  unint64_t v4 = (char *)this + 8;
  *(void *)this = &unk_26C4ED6B8;
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  *((_DWORD *)this + 8) = *((_DWORD *)a2 + 12);
  unint64_t v5 = *(void *)a2;
  if (v5)
  {
    RB::vector<RB::Fill::Gradient::Stop,0ul,unsigned long>::reserve_slow((uint64_t)this + 8, v5);
    if (*(void *)a2)
    {
      uint64_t v7 = 0;
      unint64_t v8 = 0;
      uint64_t v9 = *((void *)this + 2);
      do
      {
        uint64_t v10 = *((void *)a2 + 1);
        if (*((void *)this + 3) < (unint64_t)(v9 + 1))
        {
          RB::vector<RB::Fill::Gradient::Stop,0ul,unsigned long>::reserve_slow((uint64_t)v4, v9 + 1);
          uint64_t v9 = *((void *)this + 2);
        }
        *(_OWORD *)(*((void *)this + 1) + 16 * v9) = *(_OWORD *)(v10 + v7);
        uint64_t v9 = *((void *)this + 2) + 1;
        *((void *)this + 2) = v9;
        ++v8;
        v7 += 16;
      }
      while (v8 < *(void *)a2);
    }
  }
  return this;
}

void sub_2141FDAF4(_Unwind_Exception *exception_object)
{
  if (*v1) {
    free(*v1);
  }
  _Unwind_Resume(exception_object);
}

std::string *RB::XML::Value::Gradient::to_string(std::string *result, std::string *this, int a3)
{
  uint64_t v5 = (uint64_t)result;
  uint64_t v41 = *MEMORY[0x263EF8340];
  int v6 = result[1].__r_.__value_.__r.__words[1] & 0xC0;
  if (v6 == 192)
  {
    uint64_t v7 = "[perceptual] ";
LABEL_7:
    unint64_t v8 = this;
    std::string::size_type v9 = 13;
    goto LABEL_8;
  }
  if (v6 == 128)
  {
    uint64_t v7 = "[non-linear] ";
    goto LABEL_7;
  }
  if (v6 != 64) {
    goto LABEL_9;
  }
  uint64_t v7 = "[linear] ";
  unint64_t v8 = this;
  std::string::size_type v9 = 9;
LABEL_8:
  unint64_t result = std::string::append(v8, v7, v9);
LABEL_9:
  uint64_t v10 = *(void *)(v5 + 16);
  if (v10)
  {
    uint64_t v11 = 0;
    for (uint64_t i = 24; ; i += 16)
    {
      if (v11) {
        std::string::push_back(this, 32);
      }
      if (*(unsigned char *)(v5 + 34))
      {
        float v13 = *(float *)(*(void *)(v5 + 8) + i - 16);
        float v14 = roundf(v13 * 32.0) * 0.03125;
        if ((a3 & 2) != 0) {
          float v13 = v14;
        }
        snprintf_l(__s, 0x80uLL, 0, "%g: ", v13);
        size_t v15 = strlen(__s);
        std::string::append(this, __s, v15);
      }
      float16x4_t v16 = *(float16x4_t *)(*(void *)(v5 + 8) + i - 24);
      int8x16_t v37 = &unk_26C4ED578;
      float32x4_t v38 = vcvtq_f32_f16(v16);
      int v39 = rb_color_space(0);
      unint64_t result = RB::XML::Value::Color::to_string((uint64_t)&v37, this, a3);
      if ((unint64_t)++v11 >= *(void *)(v5 + 16)) {
        goto LABEL_33;
      }
      if ((*(_DWORD *)(v5 + 32) & 0xF00) == 0x200) {
        break;
      }
      if ((*(_DWORD *)(v5 + 32) & 0xF00) == 0x100)
      {
        float v21 = *(float *)(*(void *)(v5 + 8) + i - 16)
            + (float)((float)(*(float *)(*(void *)(v5 + 8) + i) - *(float *)(*(void *)(v5 + 8) + i - 16))
                    * *(float *)(*(void *)(v5 + 8) + i - 12));
        float v22 = roundf(v21 * 32.0) * 0.03125;
        if ((a3 & 2) != 0) {
          float v21 = v22;
        }
        snprintf_l(__s, 0x80uLL, 0, " midpoint(%g)", v21);
LABEL_32:
        size_t v36 = strlen(__s);
        unint64_t result = std::string::append(this, __s, v36);
      }
LABEL_33:
      if (v10 == v11) {
        return result;
      }
    }
    uint64_t v23 = *(void *)(v5 + 8) + i;
    LOBYTE(v17) = *(unsigned char *)(v23 - 12);
    float v24 = (float)v17;
    float v25 = v24 * 0.0039216;
    LOBYTE(v18) = *(unsigned char *)(v23 - 11);
    float v26 = (float)v18;
    LOBYTE(v19) = *(unsigned char *)(v23 - 10);
    float v27 = (float)v19;
    LOBYTE(v20) = *(unsigned char *)(v23 - 9);
    float v28 = (float)v20;
    float v29 = roundf(v24 * 0.12549) * 0.03125;
    if ((a3 & 2) == 0) {
      float v29 = v25;
    }
    double v30 = v29;
    float v31 = roundf(v26 * 0.12549) * 0.03125;
    if ((a3 & 2) == 0) {
      float v31 = v26 * 0.0039216;
    }
    double v32 = v31;
    float v33 = roundf(v27 * 0.12549) * 0.03125;
    if ((a3 & 2) == 0) {
      float v33 = v27 * 0.0039216;
    }
    double v34 = v33;
    float v35 = roundf(v28 * 0.12549) * 0.03125;
    if ((a3 & 2) == 0) {
      float v35 = v28 * 0.0039216;
    }
    snprintf_l(__s, 0x80uLL, 0, " cubic-bezier(%g, %g, %g, %g)", v30, v32, v34, v35);
    goto LABEL_32;
  }
  return result;
}

void RB::XML::Value::Shader::to_string(uint64_t a1, std::string *a2, int a3)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v4 = -[RBShape shapeData](*(void *)(a1 + 8));
  if (*(void *)v4)
  {
    uint64_t v5 = v4;
    int v6 = (const char *)[*(id *)(*(void *)v4 + 24) UTF8String];
    size_t v7 = strlen(v6);
    std::string::append(a2, v6, v7);
    std::string::push_back(a2, 40);
    uint64_t v8 = *(void *)(v5 + 112);
    if (*(void *)(v5 + 104)) {
      std::string::size_type v9 = *(unsigned int **)(v5 + 104);
    }
    else {
      std::string::size_type v9 = (unsigned int *)(v5 + 8);
    }
    if (v8)
    {
      double v30 = &v9[6 * v8];
      char v10 = 1;
      do
      {
        if ((v10 & 1) == 0) {
          std::string::append(a2, ", ", 2uLL);
        }
        if (*((unsigned char *)v9 + 7))
        {
          std::string::push_back(a2, 42);
          if ((*((unsigned char *)v9 + 7) & 2) != 0) {
            std::string::push_back(a2, 35);
          }
        }
        if (*v9)
        {
          uint64_t v11 = *((unsigned __int8 *)v9 + 4);
          switch(*((unsigned char *)v9 + 4))
          {
            case 1:
              goto LABEL_18;
            case 2:
              uint64_t v11 = 2;
              goto LABEL_18;
            case 3:
            case 4:
              if (v11 == 3) {
                uint64_t v11 = 3;
              }
              else {
                uint64_t v11 = 4;
              }
LABEL_18:
              char v12 = RB::CustomShader::Value::data_ptr((RB::CustomShader::Value *)v9);
              if (*v9)
              {
                float v13 = v12;
                uint64_t v14 = 0;
                unint64_t v15 = 0;
                do
                {
                  if (v15) {
                    std::string::append(a2, "; ", 2uLL);
                  }
                  uint64_t v16 = 0;
                  do
                  {
                    if (v16) {
                      std::string::push_back(a2, 32);
                    }
                    snprintf_l(__s, 0x40uLL, 0, "%g", *((float *)v13 + v14 + v16));
                    size_t v17 = strlen(__s);
                    std::string::append(a2, __s, v17);
                    ++v16;
                  }
                  while (v11 != v16);
                  ++v15;
                  v14 += v16;
                }
                while (v15 < *v9);
              }
              break;
            case 5:
              unsigned int v18 = RB::CustomShader::Value::data_ptr((RB::CustomShader::Value *)v9);
              if (*v9)
              {
                unsigned int v19 = v18;
                unint64_t v20 = 0;
                do
                {
                  if (v20) {
                    std::string::push_back(a2, 32);
                  }
                  __int16 v21 = *(_WORD *)((char *)v9 + 5);
                  float16x4_t v22 = vcvt_f16_f32(*(float32x4_t *)&v19[2 * v20]);
                  *(void *)__s = &unk_26C4ED578;
                  *(float32x4_t *)cf = vcvtq_f32_f16(v22);
                  int v34 = rb_color_space(v21);
                  RB::XML::Value::Color::to_string((uint64_t)__s, a2, a3);
                  ++v20;
                }
                while (v20 < *v9);
              }
              break;
            case 6:
              std::string::append(a2, "bounds()", 8uLL);
              break;
            case 7:
              std::string::append(a2, "image", 5uLL);
              goto LABEL_37;
            case 8:
              std::string::append(a2, "mipmapped-image", 0xFuLL);
LABEL_37:
              std::string::push_back(a2, 40);
              uint64_t v23 = RB::CustomShader::Value::image((RB::CustomShader::Value *)v9);
              if (v23)
              {
                int v24 = *(_DWORD *)(v23 + 8);
                float v25 = *(const void **)v23;
                *(void *)__s = &unk_26C4ED5C8;
                LODWORD(cf[0]) = v24;
                if (v25) {
                  CFRetain(v25);
                }
                cf[1] = v25;
                RB::XML::Value::Image::to_string((uint64_t)__s, a2);
                *(void *)__s = &unk_26C4ED5C8;
                if (cf[1]) {
                  CFRelease(cf[1]);
                }
              }
              std::string::push_back(a2, 41);
              break;
            case 9:
              float v26 = RB::CustomShader::Value::data_ptr((RB::CustomShader::Value *)v9);
              if (*v9)
              {
                float v27 = v26;
                unint64_t v28 = 0;
                do
                {
                  if (v28) {
                    std::string::append(a2, "; ", 2uLL);
                  }
                  snprintf_l(__s, 0x40uLL, 0, "%d", *((_DWORD *)v27 + v28));
                  size_t v29 = strlen(__s);
                  std::string::append(a2, __s, v29);
                  ++v28;
                }
                while (v28 < *v9);
              }
              break;
            default:
              break;
          }
        }
        char v10 = 0;
        v9 += 6;
      }
      while (v9 != v30);
    }
    std::string::push_back(a2, 41);
  }
}

void sub_2141FE234(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
  _Unwind_Resume(exception_object);
}

void RB::XML::Value::Image::~Image(RB::XML::Value::Image *this)
{
  *(void *)this = &unk_26C4ED5C8;
  uint64_t v1 = (const void *)*((void *)this + 2);
  if (v1) {
    CFRelease(v1);
  }
}

{
  const void *v1;
  uint64_t vars8;

  *(void *)this = &unk_26C4ED5C8;
  uint64_t v1 = (const void *)*((void *)this + 2);
  if (v1) {
    CFRelease(v1);
  }
  JUMPOUT(0x21669AC10);
}

std::string *RB::XML::Value::UUID::to_string(uint64_t a1, std::string *this, char a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (a3)
  {
    return std::string::append(this, "redacted", 8uLL);
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    uuid_unparse((const unsigned __int8 *)(a1 + 8), v6);
    size_t v4 = strlen(v6);
    return std::string::append(this, v6, v4);
  }
}

std::string *RB::XML::Value::TransitionEffectType::to_string(std::string *result, std::string *a2)
{
  unint64_t v2 = result->__r_.__value_.__s.__data_[8];
  if (v2 <= 0x14)
  {
    size_t v4 = off_2641F9A20[v2];
    size_t v5 = strlen(v4);
    return std::string::append(a2, v4, v5);
  }
  return result;
}

std::string *RB::XML::Value::TransitionMethod::to_string(std::string *result, std::string *a2)
{
  unint64_t v2 = result->__r_.__value_.__s.__data_[8];
  if (v2 <= 8)
  {
    size_t v4 = off_2641F9AC8[v2];
    size_t v5 = strlen(v4);
    return std::string::append(a2, v4, v5);
  }
  return result;
}

void RB::XML::Value::Bool::~Bool(RB::XML::Value::Bool *this)
{
}

void RB::XML::Value::Int::~Int(RB::XML::Value::Int *this)
{
}

void RB::XML::Value::Float::~Float(RB::XML::Value::Float *this)
{
}

void RB::XML::Value::ConstantString::~ConstantString(RB::XML::Value::ConstantString *this)
{
}

void RB::XML::Value::StateID::~StateID(RB::XML::Value::StateID *this)
{
}

void RB::XML::Value::Angle::~Angle(RB::XML::Value::Angle *this)
{
}

void RB::XML::Value::Vec2::~Vec2(RB::XML::Value::Vec2 *this)
{
}

void RB::XML::Value::Vec3::~Vec3(RB::XML::Value::Vec3 *this)
{
}

void RB::XML::Value::Vec4::~Vec4(RB::XML::Value::Vec4 *this)
{
}

void RB::XML::Value::AffineMatrix::~AffineMatrix(RB::XML::Value::AffineMatrix *this)
{
}

void RB::XML::Value::Transform::~Transform(RB::XML::Value::Transform *this)
{
}

void RB::XML::Value::BlendMode::~BlendMode(RB::XML::Value::BlendMode *this)
{
}

void RB::XML::Value::AlphaBlendMode::~AlphaBlendMode(RB::XML::Value::AlphaBlendMode *this)
{
}

void RB::XML::Value::ClipMode::~ClipMode(RB::XML::Value::ClipMode *this)
{
}

void RB::XML::Value::InterpolationMode::~InterpolationMode(RB::XML::Value::InterpolationMode *this)
{
}

void RB::XML::Value::LineCap::~LineCap(RB::XML::Value::LineCap *this)
{
}

void RB::XML::Value::LineJoin::~LineJoin(RB::XML::Value::LineJoin *this)
{
}

void RB::XML::Value::Color::~Color(RB::XML::Value::Color *this)
{
}

void RB::XML::Value::ColorSpace::~ColorSpace(RB::XML::Value::ColorSpace *this)
{
}

void RB::XML::Value::ColorMatrix::~ColorMatrix(RB::XML::Value::ColorMatrix *this)
{
}

void RB::XML::Value::ColorArray::~ColorArray(RB::XML::Value::ColorArray *this)
{
  *(void *)this = &unk_26C4E8108;
  uint64_t v1 = (void *)*((void *)this + 1);
  if (v1) {
    free(v1);
  }
}

{
  void *v1;
  uint64_t vars8;

  *(void *)this = &unk_26C4E8108;
  uint64_t v1 = (void *)*((void *)this + 1);
  if (v1) {
    free(v1);
  }
  JUMPOUT(0x21669AC10);
}

void RB::XML::Value::Path::~Path(RB::XML::Value::Path *this)
{
  *(void *)this = &unk_26C4ED488;
  RBPathRelease(*((void *)this + 1), *((void *)this + 2));
}

{
  uint64_t vars8;

  *(void *)this = &unk_26C4ED488;
  RBPathRelease(*((void *)this + 1), *((void *)this + 2));
  JUMPOUT(0x21669AC10);
}

void RB::XML::Value::Font::~Font(RB::XML::Value::Font *this)
{
  *(void *)this = &unk_26C4ED460;
  uint64_t v1 = (const void *)*((void *)this + 1);
  if (v1) {
    CFRelease(v1);
  }
}

{
  const void *v1;
  uint64_t vars8;

  *(void *)this = &unk_26C4ED460;
  uint64_t v1 = (const void *)*((void *)this + 1);
  if (v1) {
    CFRelease(v1);
  }
  JUMPOUT(0x21669AC10);
}

void RB::XML::Value::IntArray::~IntArray(RB::XML::Value::IntArray *this)
{
  *(void *)this = &unk_26C4ED6E0;
  uint64_t v1 = (void *)*((void *)this + 1);
  if (v1) {
    free(v1);
  }
}

{
  void *v1;
  uint64_t vars8;

  *(void *)this = &unk_26C4ED6E0;
  uint64_t v1 = (void *)*((void *)this + 1);
  if (v1) {
    free(v1);
  }
  JUMPOUT(0x21669AC10);
}

void RB::XML::Value::Stroke::~Stroke(id *this)
{
  *this = &unk_26C4ED618;
}

{
  uint64_t vars8;

  *this = &unk_26C4ED618;

  JUMPOUT(0x21669AC10);
}

void RB::XML::Value::StrokeType::~StrokeType(RB::XML::Value::StrokeType *this)
{
}

void RB::XML::Value::Shader::~Shader(id *this)
{
  *this = &unk_26C4ED5F0;
}

{
  uint64_t vars8;

  *this = &unk_26C4ED5F0;

  JUMPOUT(0x21669AC10);
}

void RB::XML::Value::UUID::~UUID(RB::XML::Value::UUID *this)
{
}

void RB::XML::Value::TransitionEffectType::~TransitionEffectType(RB::XML::Value::TransitionEffectType *this)
{
}

void RB::XML::Value::TransitionMethod::~TransitionMethod(RB::XML::Value::TransitionMethod *this)
{
}

void RB::XML::Value::FloatArray::~FloatArray(RB::XML::Value::FloatArray *this)
{
  *(void *)this = &unk_26C4ED280;
  uint64_t v1 = (void *)*((void *)this + 1);
  if (v1) {
    free(v1);
  }
}

{
  void *v1;
  uint64_t vars8;

  *(void *)this = &unk_26C4ED280;
  uint64_t v1 = (void *)*((void *)this + 1);
  if (v1) {
    free(v1);
  }
  JUMPOUT(0x21669AC10);
}

void RB::XML::Value::Gradient::~Gradient(RB::XML::Value::Gradient *this)
{
  *(void *)this = &unk_26C4ED6B8;
  uint64_t v1 = (void *)*((void *)this + 1);
  if (v1) {
    free(v1);
  }
}

{
  void *v1;
  uint64_t vars8;

  *(void *)this = &unk_26C4ED6B8;
  uint64_t v1 = (void *)*((void *)this + 1);
  if (v1) {
    free(v1);
  }
  JUMPOUT(0x21669AC10);
}

void RB::XML::Value::Stroke::to_string(std::string &,unsigned int)const::$_0::__invoke(uint64_t a1, uint64_t a2, uint64_t a3, std::string *this)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (a1)
  {
    uint64_t v8 = 0;
    while ((SHIBYTE(this->__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      if (*((unsigned char *)&this->__r_.__value_.__s + 23)) {
        goto LABEL_5;
      }
LABEL_6:
      std::string::value_type v9 = 109;
      uint64_t v10 = 2;
      switch(*(unsigned char *)(a2 + v8))
      {
        case 0:
          goto LABEL_25;
        case 1:
          std::string::value_type v9 = 108;
          uint64_t v10 = 2;
          goto LABEL_25;
        case 2:
          std::string::value_type v9 = 113;
          uint64_t v10 = 4;
          goto LABEL_25;
        case 3:
          std::string::value_type v9 = 99;
          uint64_t v10 = 6;
          goto LABEL_25;
        case 4:
          uint64_t v10 = 0;
          std::string::value_type v9 = 104;
          break;
        case 5:
          std::string::value_type v9 = 119;
          goto LABEL_24;
        case 6:
          std::string::value_type v9 = 100;
          goto LABEL_24;
        case 7:
          std::string::value_type v9 = 120;
          goto LABEL_24;
        case 8:
          std::string::value_type v9 = 115;
          goto LABEL_24;
        case 9:
          std::string::value_type v9 = 83;
          goto LABEL_24;
        case 0xA:
          std::string::value_type v9 = 114;
          goto LABEL_24;
        case 0xB:
          std::string::value_type v9 = 82;
          goto LABEL_24;
        case 0xC:
          std::string::value_type v9 = 111;
          goto LABEL_24;
        case 0xD:
          std::string::value_type v9 = 79;
          goto LABEL_24;
        case 0xE:
          std::string::value_type v9 = 97;
          goto LABEL_24;
        case 0xF:
          std::string::value_type v9 = 65;
LABEL_24:
          uint64_t v10 = 1;
LABEL_25:
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (i) {
              std::string::push_back(this, 32);
            }
            snprintf_l(__s, 0x40uLL, 0, "%g", *(float *)(a3 + 4 * i));
            size_t v12 = strlen(__s);
            std::string::append(this, __s, v12);
          }
          break;
        default:
          uint64_t v10 = 0;
          std::string::value_type v9 = 0;
          break;
      }
      std::string::push_back(this, 32);
      std::string::push_back(this, v9);
      a3 += 4 * v10;
      if (++v8 == a1) {
        return;
      }
    }
    if (!this->__r_.__value_.__l.__size_) {
      goto LABEL_6;
    }
LABEL_5:
    std::string::push_back(this, 32);
    goto LABEL_6;
  }
}

int *RB::RenderState::set_image(int *result, uint64_t a2, int a3)
{
  unsigned int v3 = *(_DWORD *)(a2 + 80);
  int v4 = (v3 >> 7) & 1;
  if (((v3 >> 4) & 3) != a3) {
    int v4 = 1;
  }
  if (v4) {
    __int16 v5 = 256;
  }
  else {
    __int16 v5 = 0;
  }
  if ((v3 & 0x100) == 0) {
    __int16 v5 = 0;
  }
  *unint64_t result = *result & 0xFFFFF | ((unsigned __int16)(v5 | v3 & 0xFEFF) << 20);
  return result;
}

BOOL RB::RenderState::set_color_conversion(int *a1, int a2, int a3, _DWORD *a4)
{
  *a4 = 1065353216;
  if (a2 == a3)
  {
    int v5 = 0;
    int v4 = 0;
  }
  else
  {
    int v4 = ((a3 & 0xFE) != a3) | (4 * ((a2 & 0xFE) != a2));
    if ((a2 & 0xFE) != 0 || (a3 & 0xFE) != 2)
    {
      if ((a3 & 0xFE) == 0 && (a2 & 0xFE) == 2) {
        int v5 = 512;
      }
      else {
        int v5 = 0;
      }
    }
    else
    {
      int v5 = 1024;
    }
  }
  *a1 = v5 | *a1 & 0xF003F | (v4 << 20);
  return a2 != a3;
}

unsigned int *RB::RenderState::simplify_plus_lighter(unsigned int *this, unint64_t a2)
{
  unsigned int v2 = *this & 0x3F;
  BOOL v3 = v2 > 0x26;
  uint64_t v4 = (1 << v2) & 0x70007C39E0;
  if (!v3 && v4 != 0)
  {
    int v6 = this;
    this = RB::pixel_format_traits(a2, (MTLPixelFormat)a2);
    if ((((unint64_t)*((unsigned __int16 *)this + 2) << 32) & 0xA00000000) == 0) {
      v6[1] = v6[1] & 0xFFFFFFC0 | 0xB;
    }
  }
  return this;
}

RB::FormattedRenderState::ID *RB::FormattedRenderState::ID::ID(RB::FormattedRenderState::ID *this, const char *a2)
{
  BOOL v3 = (void *)[[NSString alloc] initWithUTF8String:a2];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v3 options:0];
  if ([v4 length] == 12)
  {
    uint64_t v5 = [v4 bytes];
    uint64_t v6 = *(void *)v5;
    *((_DWORD *)this + 2) = *(_DWORD *)(v5 + 8);
    *(void *)this = v6;
  }
  else
  {
    *((_DWORD *)this + 2) = 0;
    *(void *)this = 0;
  }

  return this;
}

void sub_2141FF354(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t RB::blend_into_zero(unsigned int a1)
{
  uint64_t result = 1;
  if (a1 <= 0x30)
  {
    if (((1 << a1) & 0x5FFFFF04FE55) != 0)
    {
      return 2;
    }
    else if (a1 == 17)
    {
      return 17;
    }
    else if (((1 << a1) & 0x1000000F80000) != 0)
    {
      abort();
    }
  }
  return result;
}

uint64_t RB::image_filter_sampler(unsigned int a1)
{
  if (a1 > 4) {
    return 1;
  }
  else {
    return RB::image_filter_sampler(RB::ImageFilter)::sampler_states[a1];
  }
}

void RB::SurfacePool::erase_queue(uint64_t a1, CFTypeRef *a2)
{
  if (*a2)
  {
    os_unfair_lock_lock((os_unfair_lock_t)a1);
    double v4 = CACurrentMediaTime();
    uint64_t v5 = *(void *)(a1 + 80);
    size_t v6 = v5 + 1;
    if (*(void *)(a1 + 88) < (unint64_t)(v5 + 1))
    {
      uint64_t v5 = *(void *)(a1 + 80);
      size_t v6 = v5 + 1;
    }
    uint64_t v7 = *(void *)(a1 + 72);
    if (!v7) {
      uint64_t v7 = a1 + 40;
    }
    uint64_t v8 = v7 + 16 * v5;
    *(void *)uint64_t v8 = *a2;
    *a2 = 0;
    *(double *)(v8 + 8) = v4 + 0.1;
    *(void *)(a1 + 80) = v6;
    int v9 = *(unsigned __int8 *)(a1 + 128);
    if (!*(unsigned char *)(a1 + 128)) {
      *(unsigned char *)(a1 + 128) = 1;
    }
    RB::SurfacePool::remove_watched_queue_locked((RB::SurfacePool *)a1, 0, 0);
    os_unfair_lock_unlock((os_unfair_lock_t)a1);
    if (*a2) {
      CFRelease(*a2);
    }
    *a2 = 0;
    if (!v9)
    {
      uint64_t v10 = *(NSObject **)(a1 + 8);
      dispatch_async_f(v10, (void *)a1, (dispatch_function_t)RB::SurfacePool::AsyncCollection::~AsyncCollection()::$_0::__invoke);
    }
  }
}

void sub_2141FF52C(_Unwind_Exception *exception_object)
{
  if (v2) {
    dispatch_async_f(v1[1], v1, (dispatch_function_t)RB::SurfacePool::AsyncCollection::~AsyncCollection()::$_0::__invoke);
  }
  _Unwind_Resume(exception_object);
}

void *RB::vector<RB::cf_ptr<_CAImageQueue *>,8ul,unsigned long>::~vector(void *a1)
{
  int v2 = (void *)a1[8];
  unint64_t v3 = a1[9];
  if (v2) {
    double v4 = v2;
  }
  else {
    double v4 = a1;
  }
  if (v3)
  {
    for (unint64_t i = 0; i < v3; ++i)
    {
      size_t v6 = (const void *)v4[i];
      if (v6)
      {
        CFRelease(v6);
        unint64_t v3 = a1[9];
      }
    }
    int v2 = (void *)a1[8];
  }
  if (v2) {
    free(v2);
  }
  return a1;
}

uint64_t RB::SurfacePool::print_locked(RB::SurfacePool *this, int a2)
{
  CFTimeInterval v4 = CACurrentMediaTime();
  printf("SurfacePool %p at %f\n", this, v4);
  uint64_t v5 = *((void *)this + 10);
  if (*((void *)this + 9)) {
    size_t v6 = (double *)*((void *)this + 9);
  }
  else {
    size_t v6 = (double *)((char *)this + 40);
  }
  if (v5)
  {
    uint64_t v7 = (char *)&v6[2 * v5];
    do
    {
      printf("  Erased Queue %p; deadline %f\n", *(const void **)v6, v6[1]);
      v6 += 2;
    }
    while (v6 != (double *)v7);
  }
  float16x4_t v22 = (unint64_t *)this;
  uint64_t v8 = *((void *)this + 3);
  if (v8)
  {
    uint64_t v9 = *((void *)this + 2);
    uint64_t v10 = v9 + 8 * v8;
    do
    {
      uint64_t v11 = *(const void **)v9;
      int v12 = HIDWORD(*(void *)(*(void *)v9 + 24));
      int v13 = *(void *)(*(void *)v9 + 24);
      IOSurfaceID ID = IOSurfaceGetID(*(IOSurfaceRef *)(*(void *)v9 + 48));
      if (*(unsigned char *)(*(void *)v9 + 45)) {
        unint64_t v15 = " volatile";
      }
      else {
        unint64_t v15 = "";
      }
      printf("  Surface %p; [%d %d]; IOSurface %lx%s; owner %p; last used %f\n",
        v11,
        v13,
        v12,
        ID,
        v15,
        *(const void **)(*(void *)v9 + 120),
        *(double *)(*(void *)v9 + 128));
      if (a2)
      {
        uint64_t v16 = *(void *)(*(void *)v9 + 104);
        if (*(void *)(*(void *)v9 + 96)) {
          uint64_t v17 = *(void *)(*(void *)v9 + 96);
        }
        else {
          uint64_t v17 = *(void *)v9 + 64;
        }
        if (v16)
        {
          uint64_t v18 = v17 + 16 * v16;
          do
          {
            unsigned int v19 = *(const void **)v17;
            uint64_t v20 = *(void *)(v17 + 8);
            v17 += 16;
            printf("    queue %p -> %llx\n", v19, v20);
          }
          while (v17 != v18);
        }
      }
      v9 += 8;
    }
    while (v9 != v10);
  }
  return printf("  Resident: %.2f MB (max %.2f), volatile: %.2f MB (max %.2f).\n\n", (double)v22[17] * 0.000000953674316, (double)v22[19] * 0.000000953674316, (double)v22[18] * 0.000000953674316, (double)v22[20] * 0.000000953674316);
}

void RB::SurfacePool::watch_queue(os_unfair_lock_s *this, CALayer *a2, CALayer *a3)
{
  os_unfair_lock_lock(this);
  uint64_t v6 = *(void *)&this[24]._os_unfair_lock_opaque;
  uint64_t v7 = *(void *)&this[26]._os_unfair_lock_opaque;
  if (v7)
  {
    uint64_t v8 = 16 * v7;
    uint64_t v9 = (CALayer **)(v6 + 8);
    while (*(v9 - 1) != a2 || *v9 != a3)
    {
      v9 += 2;
      v8 -= 16;
      if (!v8) {
        goto LABEL_6;
      }
    }
  }
  else
  {
LABEL_6:
    unint64_t v10 = v7 + 1;
    if (*(void *)&this[28]._os_unfair_lock_opaque < (unint64_t)(v7 + 1))
    {
      RB::vector<RB::Fill::Gradient::Stop,0ul,unsigned long>::reserve_slow((uint64_t)&this[24], v10);
      uint64_t v6 = *(void *)&this[24]._os_unfair_lock_opaque;
      uint64_t v7 = *(void *)&this[26]._os_unfair_lock_opaque;
      unint64_t v10 = v7 + 1;
    }
    uint64_t v11 = (CALayer **)(v6 + 16 * v7);
    *uint64_t v11 = a2;
    v11[1] = a3;
    *(void *)&this[26]._os_unfair_lock_opaque = v10;
  }
  os_unfair_lock_unlock(this);
}

void sub_2141FF844(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void RB::SurfacePool::unwatch_queues(os_unfair_lock_s *this, CALayer *a2)
{
  os_unfair_lock_lock(this);
  unint64_t v4 = *(void *)&this[26]._os_unfair_lock_opaque;
  if (v4)
  {
    unint64_t v5 = 0;
    do
    {
      uint64_t v6 = *(void *)&this[24]._os_unfair_lock_opaque;
      if (*(CALayer **)(v6 + 16 * v5 + 8) == a2)
      {
        uint64_t v7 = v6 + 16 * v4;
        uint64_t v8 = *(void *)(v6 + 16 * v5);
        *(_OWORD *)(v6 + 16 * v5) = *(_OWORD *)(v7 - 16);
        *(void *)(v7 - 16) = v8;
        *(void *)(v7 - 8) = a2;
        unint64_t v4 = *(void *)&this[26]._os_unfair_lock_opaque - 1;
        *(void *)&this[26]._os_unfair_lock_opaque = v4;
      }
      else
      {
        ++v5;
      }
    }
    while (v5 < v4);
  }
  os_unfair_lock_unlock(this);
}

void RB::Surface::~Surface(RB::Surface *this)
{
  *(void *)this = &unk_26C4EDCC8;
  RB::Surface::destroy_queue_ids((uint64_t)this);
  int v2 = (void *)*((void *)this + 12);
  if (v2) {
    free(v2);
  }

  unint64_t v3 = (const void *)*((void *)this + 6);
  if (v3) {
    CFRelease(v3);
  }
}

{
  uint64_t vars8;

  RB::Surface::~Surface(this);
  JUMPOUT(0x21669AC10);
}

void sub_2141FF994(_Unwind_Exception *a1)
{
  unint64_t v3 = *(void **)(v1 + 96);
  if (v3) {
    free(v3);
  }
  RB::Surface::~Surface(v1);
  _Unwind_Resume(a1);
}

atomic_uint *RB::Refcount<RB::Surface,std::atomic<unsigned int>>::release(atomic_uint *result)
{
  if (atomic_fetch_add_explicit(result + 2, 0xFFFFFFFF, memory_order_release) == 1)
  {
    __dmb(9u);
    return (atomic_uint *)(*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

uint64_t RB::Refcount<RB::Surface,std::atomic<unsigned int>>::finalize(uint64_t result)
{
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 24))();
  }
  return result;
}

void RB::SurfacePool::remove_watched_queue_locked(_CAImageQueue *,BOOL)::$_0::__invoke(void *a1)
{
  [a1 setNeedsDisplay];
}

void sub_2141FFA94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

RB::DisplayList::EditAdaptor *RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::EditAdaptor *this, RB::Transition ***a2, const RB::DisplayList::Item *a3, const RB::DisplayList::Item *a4)
{
  *((_OWORD *)this + 1) = 0u;
  uint64_t v8 = (uint64_t *)((char *)this + 16);
  *((void *)this + 12) = 0;
  *(_OWORD *)this = 0u;
  *((void *)this + 13) = 0x800000000;
  *((void *)this + 22) = 0;
  *((void *)this + 23) = 0x800000000;
  *((_OWORD *)this + 12) = 0u;
  uint64_t v9 = (void *)((char *)this + 192);
  *((_OWORD *)this + 13) = 0u;
  *((unsigned char *)this + 224) = 0;
  *(void *)((char *)this + 228) = 0x80000000;
  char v10 = RB::Transition::properties(**a2);
  unsigned int v47 = 0;
  v45[0] = (uint64_t)this;
  v45[1] = (uint64_t)&v47;
  v45[2] = (uint64_t)a2;
  char v46 = v10;
  if (RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_1::operator()(v45, (uint64_t)this, (uint64_t)this + 32, (uint64_t)a3)&& RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_1::operator()(v45, (uint64_t)v8, (uint64_t)this + 112, (uint64_t)a4))
  {
    if (*((unsigned char *)this + 232))
    {
      *((unsigned char *)this + 232) = 1;
LABEL_7:
      int v12 = *(__n128 **)this;
      unint64_t v13 = *((unsigned int *)this + 2);
      uint64_t v14 = (__n128 *)(*(void *)this + 24 * v13);
      if (v13 < 0x81)
      {
        unint64_t v15 = 0;
        uint64_t v17 = 0;
      }
      else
      {
        unint64_t v15 = (__n128 *)std::get_temporary_buffer[abi:nn180100]<RB::DisplayList::EditAdaptor::Element>(*((unsigned int *)this + 2));
        uint64_t v17 = v16;
      }
      __n128 v18 = std::__stable_sort<std::_ClassicAlgPolicy,RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_2 &,RB::DisplayList::EditAdaptor::Element *>(v12, v14, v13, v15, v17, v11);
      if (v15) {
        operator delete(v15);
      }
      unsigned int v19 = (__n128 *)*((void *)this + 2);
      unint64_t v20 = *((unsigned int *)this + 6);
      if (v20 < 0x81)
      {
        __int16 v21 = 0;
        uint64_t v23 = 0;
      }
      else
      {
        __int16 v21 = (__n128 *)std::get_temporary_buffer[abi:nn180100]<RB::DisplayList::EditAdaptor::Element>(*((unsigned int *)this + 6));
        uint64_t v23 = v22;
      }
      std::__stable_sort<std::_ClassicAlgPolicy,RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_2 &,RB::DisplayList::EditAdaptor::Element *>(v19, (__n128 *)((char *)v19 + 24 * v20), v20, v21, v23, v18);
      if (v21) {
        operator delete(v21);
      }
      unint64_t v24 = 0;
      unsigned int v39 = 0;
      unsigned int v37 = 0;
      unsigned int v25 = 0;
      for (i = 0; ; unint64_t v24 = HIDWORD(i))
      {
        unsigned int v26 = i;
        unsigned int v38 = *((_DWORD *)this + 6);
        if (v24 >= *((unsigned int *)this + 2))
        {
          if (i >= v38)
          {
            *((unsigned char *)this + 235) = v25 > 1;
            goto LABEL_30;
          }
        }
        else
        {
          uint64_t v27 = *(void *)this + 24 * v24;
          if (i >= v38) {
            goto LABEL_24;
          }
          if (RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_2::operator()(v27, *v8 + 24 * i))
          {
            uint64_t v27 = *(void *)this + 24 * v24;
            goto LABEL_24;
          }
        }
        uint64_t v27 = *v8 + 24 * v26;
LABEL_24:
        int v28 = *(_DWORD *)(*(void *)v27 + 40);
        uint64_t v42 = *(void *)(*(void *)v27 + 32);
        int v43 = v28;
        int8x16_t v40 = &v42;
        unsigned int v41 = v25;
        unsigned int v29 = RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_0::operator()<RB::vector<RB::DisplayList::EditAdaptor::Element,0ul,unsigned int>,unsigned int>(&v40, (uint64_t *)this, (unsigned int *)&i + 1);
        unsigned int v30 = RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_0::operator()<RB::vector<RB::DisplayList::EditAdaptor::Element,0ul,unsigned int>,unsigned int>(&v40, v8, (unsigned int *)&i);
        if (v37 <= v29) {
          unsigned int v37 = v29;
        }
        if (v39 <= v30) {
          unsigned int v39 = v30;
        }
        ++v25;
      }
    }
    v11.n128_u64[0] = (unint64_t)vcnt_s8((int8x8_t)v47);
    v11.n128_u16[0] = vaddlv_u8((uint8x8_t)v11.n128_u64[0]);
    *((unsigned char *)this + 232) = v11.n128_u32[0] > 1;
    if (v11.n128_u32[0] > 1) {
      goto LABEL_7;
    }
    unsigned int v37 = *((_DWORD *)this + 2);
    unsigned int v38 = *((_DWORD *)this + 6);
    *((unsigned char *)this + 235) = 0;
    unsigned int v39 = v38;
LABEL_30:
    unsigned int v31 = v37 * v39 + 7;
    if (v31 <= 0x800007)
    {
      unsigned int v32 = v31 >> 3;
      if (v37 != 1 && v38)
      {
        uint64_t v33 = 24 * v38;
        int v34 = (_DWORD *)(*v8 + 16);
        do
        {
          *v34 *= v37;
          v34 += 6;
          v33 -= 24;
        }
        while (v33);
      }
      unsigned int v35 = *((_DWORD *)this + 50);
      if (v35 < v32)
      {
        if (*((_DWORD *)this + 51) < v32)
        {
          RB::vector<RB::Animation::TermOrArg,0ul,unsigned int>::reserve_slow((uint64_t)v9, v32);
          unsigned int v35 = *((_DWORD *)this + 50);
        }
        if (v35 < v32) {
          bzero((void *)(*v9 + 4 * v35), 4 * (v32 + ~v35) + 4);
        }
      }
      *((_DWORD *)this + 50) = v32;
      *((unsigned char *)this + 234) = 1;
    }
  }
  return this;
}

void sub_2141FFE08(_Unwind_Exception *exception_object)
{
  if (*v3) {
    free(*v3);
  }
  unint64_t v5 = *(void **)(v1 + 176);
  if (v5) {
    free(v5);
  }
  uint64_t v6 = *(void **)(v1 + 96);
  if (v6) {
    free(v6);
  }
  if (*v2) {
    free(*v2);
  }
  if (*(void *)v1) {
    free(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

BOOL RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_1::operator()(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *a1;
  uint64_t v33 = a4;
  uint64_t v34 = 0;
  uint64_t v37 = 1;
  uint64_t v38 = 1;
  uint64_t v39 = 0;
  uint64_t v40 = 1;
  uint64_t v41 = 1;
  uint64_t v42 = 0;
  uint64_t v43 = 0;
  uint64_t v44 = 0;
  char v45 = 0;
  uint64_t v46 = 0;
  uint64_t v47 = 0;
  __int16 v48 = 256;
  if (a4) {
    int v8 = (*(uint64_t (**)(uint64_t))(*(void *)a4 + 40))(a4);
  }
  else {
    int v8 = 0;
  }
  BOOL v36 = v8 != -1;
  if (v8 == -1) {
    int v9 = 1;
  }
  else {
    int v9 = v8;
  }
  unsigned int v35 = v9;
  int v10 = 0;
  if (v9 && !(*(_DWORD *)(a2 + 8) >> 13))
  {
    uint64_t v11 = 0;
    do
    {
      uint64_t v12 = v33;
      if (*(unsigned char *)(v7 + 232) || *(_DWORD *)(v33 + 40)) {
        LOBYTE(v13) = 1;
      }
      else {
        int v13 = (*(unsigned __int16 *)(v33 + 46) >> 11) & 1;
      }
      *(unsigned char *)(v7 + 232) = v13;
      uint64_t v14 = *(void *)(v12 + 32);
      if (v14)
      {
        if (v14 != v11)
        {
          unint64_t v15 = (RB::DisplayList::Interpolator::Layer *)a1[2];
          uint64_t v16 = RB::DisplayList::Metadata::transition(*(uint64_t **)(v12 + 32));
          uint64_t v17 = RB::DisplayList::Interpolator::Layer::item_transition(v15, (const RB::Transition *)v16);
          unsigned int v18 = *(unsigned __int8 *)(v7 + 224);
          unsigned int v19 = *((unsigned __int8 *)v17 + 12);
          if (v18 <= v19) {
            LOBYTE(v18) = *((unsigned char *)v17 + 12);
          }
          *(unsigned char *)(v7 + 224) = v18;
          *(_DWORD *)a1[1] |= 1 << v19;
          int v20 = *((_DWORD *)v17 + 4);
          if (*(_DWORD *)(v7 + 228) > v20) {
            int v20 = *(_DWORD *)(v7 + 228);
          }
          *(_DWORD *)(v7 + 228) = v20;
          *(unsigned char *)(v7 + 233) |= RB::Transition::properties(v17);
          uint64_t v12 = v33;
          uint64_t v11 = v14;
        }
      }
      else
      {
        *(_DWORD *)a1[1] |= 1u;
        *(unsigned char *)(v7 + 233) |= *((unsigned char *)a1 + 24);
      }
      int v21 = v34;
      if (v36) {
        int v22 = HIDWORD(v34);
      }
      else {
        int v22 = -1;
      }
      int v23 = *(_DWORD *)(a2 + 8);
      unsigned int v24 = v23 + 1;
      if (*(_DWORD *)(a2 + 12) < (v23 + 1))
      {
        RB::vector<std::pair<std::pair<unsigned long,unsigned long>,RB::DisplayList::LayerTask *>,0ul,unsigned int>::reserve_slow(a2, v24);
        unsigned int v26 = *(_DWORD *)(a2 + 8);
        int v25 = v34;
        unsigned int v24 = v26 + 1;
      }
      else
      {
        int v25 = v34;
        unsigned int v26 = *(_DWORD *)(a2 + 8);
      }
      uint64_t v27 = *(void *)a2 + 24 * v26;
      *(void *)uint64_t v27 = v12;
      *(_DWORD *)(v27 + 8) = v21;
      *(_DWORD *)(v27 + 12) = v22;
      *(_DWORD *)(v27 + 16) = v23;
      *(_DWORD *)(v27 + 20) = 0;
      *(_DWORD *)(a2 + 8) = v24;
      unsigned int v28 = *(_DWORD *)(a3 + 72);
      if (v25 != v28 - 1)
      {
        uint64_t v29 = v33;
        unsigned int v30 = v28 + 1;
        if (*(_DWORD *)(a3 + 76) < v28 + 1)
        {
          RB::vector<RB::objc_ptr<void({block_pointer})(NSError *)>,8ul,unsigned int>::reserve_slow((void *)a3, v30);
          unsigned int v28 = *(_DWORD *)(a3 + 72);
          unsigned int v30 = v28 + 1;
        }
        uint64_t v31 = *(void *)(a3 + 64);
        if (!v31) {
          uint64_t v31 = a3;
        }
        *(void *)(v31 + 8 * v28) = v29;
        *(_DWORD *)(a3 + 72) = v30;
      }
      RB::DisplayList::AtomizedItems::advance(&v33, 1);
      int v10 = HIDWORD(v34);
      int v9 = v35;
    }
    while (HIDWORD(v34) < v35 && !(*(_DWORD *)(a2 + 8) >> 13) && v34 <= 0x1FFFFFFE);
  }
  return v10 == v9;
}

BOOL RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_2::operator()(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(uint64_t **)(*(void *)a1 + 32);
  unint64_t v5 = *(uint64_t **)(*(void *)a2 + 32);
  if (v4 == v5) {
    goto LABEL_12;
  }
  if (!v4)
  {
    uint64_t v6 = 0;
    if (v5) {
      goto LABEL_4;
    }
LABEL_6:
    uint64_t v7 = 0;
    goto LABEL_7;
  }
  uint64_t v6 = (unint64_t *)RB::DisplayList::Metadata::identity_ns(*(uint64_t **)(*(void *)a1 + 32));
  if (!v5) {
    goto LABEL_6;
  }
LABEL_4:
  uint64_t v7 = (unint64_t *)RB::DisplayList::Metadata::identity_ns(v5);
LABEL_7:
  if (v6 == v7) {
    goto LABEL_12;
  }
  if (!v6 || !v7)
  {
    BOOL v12 = v6 >= v7;
    return !v12;
  }
  unint64_t v8 = bswap64(*v6);
  unint64_t v9 = bswap64(*v7);
  if (v8 == v9)
  {
    unint64_t v8 = bswap64(v6[1]);
    unint64_t v9 = bswap64(v7[1]);
    if (v8 == v9)
    {
LABEL_12:
      unsigned int v10 = *(_DWORD *)(*(void *)a1 + 40);
      unsigned int v11 = *(_DWORD *)(*(void *)a2 + 40);
      BOOL v12 = v10 >= v11;
      if (v10 == v11)
      {
        int v13 = RB::DisplayList::Metadata::transition(v4);
        unsigned int v14 = v13 ? *((unsigned __int8 *)v13 + 12) : 0;
        uint64_t v17 = RB::DisplayList::Metadata::transition(v5);
        unsigned int v18 = v17 ? *((unsigned __int8 *)v17 + 12) : 0;
        BOOL v12 = v14 >= v18;
        if (v14 == v18) {
          return (*(_WORD *)(*(void *)a1 + 46) & 0x800) != 0 && (*(_WORD *)(*(void *)a2 + 46) & 0x800) == 0;
        }
      }
      return !v12;
    }
  }
  if (v8 < v9) {
    unsigned int v15 = -1;
  }
  else {
    unsigned int v15 = 1;
  }
  return v15 >> 31;
}

uint64_t RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_0::operator()<RB::vector<RB::DisplayList::EditAdaptor::Element,0ul,unsigned int>,unsigned int>(_DWORD *a1, uint64_t *a2, unsigned int *a3)
{
  unsigned int v3 = *a3;
  if (*a3 < *((_DWORD *)a2 + 2))
  {
    uint64_t v7 = 0;
    while (1)
    {
      uint64_t v8 = *a2;
      unint64_t v9 = *(uint64_t ***)a1;
      uint64_t v10 = *(void *)(*a2 + 24 * v3);
      int v11 = *(_DWORD *)(v10 + 40);
      if (v11 != *(_DWORD *)(*(void *)a1 + 8)) {
        return v7;
      }
      BOOL v12 = *(uint64_t **)(v10 + 32);
      if (v11)
      {
        int v13 = *v9;
        if (v12 != *v9) {
          break;
        }
      }
      uint64_t v16 = RB::DisplayList::Metadata::transition(v12);
      if (v16) {
        int v17 = *((unsigned __int8 *)v16 + 12);
      }
      else {
        int v17 = 0;
      }
      unsigned int v18 = RB::DisplayList::Metadata::transition(*v9);
      if (v18) {
        int v19 = *((unsigned __int8 *)v18 + 12);
      }
      else {
        int v19 = 0;
      }
      if (v17 != v19) {
        return v7;
      }
LABEL_24:
      int v20 = a1[2];
      uint64_t v21 = v8 + 24 * v3;
      *(_DWORD *)(v21 + 16) = v7;
      *(_DWORD *)(v21 + 20) = v20;
      unsigned int v3 = *a3 + 1;
      *a3 = v3;
      uint64_t v7 = (v7 + 1);
      if (v3 >= *((_DWORD *)a2 + 2)) {
        return v7;
      }
    }
    if (v12)
    {
      unsigned int v14 = RB::DisplayList::Metadata::identity_ns(v12);
      int v13 = *v9;
      if (!*v9)
      {
LABEL_9:
        if (v14 != v13)
        {
          if (!v14 || !v13) {
            return v7;
          }
          if (*v14 != *v13 || v14[1] != v13[1]) {
            return v7;
          }
        }
        goto LABEL_24;
      }
    }
    else
    {
      unsigned int v14 = 0;
      if (!v13) {
        goto LABEL_9;
      }
    }
    int v13 = RB::DisplayList::Metadata::identity_ns(v13);
    goto LABEL_9;
  }
  return 0;
}

uint64_t RB::DisplayList::EditAdaptor::make_matrix_value(uint64_t a1, void *a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t v7 = *a3;
  uint64_t v8 = *a4;
  if (*a3) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    uint64_t result = 1;
  }
  else
  {
    long long v11 = *(_OWORD *)(a3 + 1);
    long long v12 = *(_OWORD *)(a4 + 1);
    uint64_t v16 = 0x1000000000;
    *((void *)&v11 + 1) = v12;
    long long v17 = v11;
    uint64_t v18 = 0x100000000;
    uint64_t v19 = 0;
    (*(void (**)(uint64_t, void, uint64_t *))(*(void *)v7 + 208))(v7, *a2, &v16);
    unsigned int v13 = v16 & 0xF;
    if ((0x303u >> v13)) {
      unsigned int v14 = 1;
    }
    else {
      unsigned int v14 = v16 & 0xF;
    }
    if (v13 >= 0xA) {
      uint64_t result = v16 & 0xF;
    }
    else {
      uint64_t result = v14;
    }
  }
  unsigned int v15 = *((_DWORD *)a3 + 4) + *((_DWORD *)a4 + 4);
  *(_DWORD *)(*(void *)(a1 + 192) + 4 * (v15 >> 3)) = *(_DWORD *)(*(void *)(a1 + 192) + 4 * (v15 >> 3)) & ~(15 << (4 * (v15 & 7))) | (result << (4 * (v15 & 7)));
  return result;
}

void RB::DisplayList::EditAdaptor::finalize(RB::DisplayList::EditAdaptor *this, uint64_t **a2)
{
  uint64_t v115 = *MEMORY[0x263EF8340];
  if (!*((unsigned char *)this + 234)) {
    return;
  }
  unsigned int v3 = this;
  unint64_t v4 = (__n128 *)(a2 + 25);
  int v5 = *((_DWORD *)a2 + 60);
  if (*((_DWORD *)a2 + 61) < (v5 + 1))
  {
    RB::vector<RB::Rect,2ul,unsigned int>::reserve_slow(v4, v5 + 1);
    int v5 = *((_DWORD *)a2 + 60);
  }
  uint64_t v6 = (__n128 *)a2[29];
  if (!v6) {
    uint64_t v6 = v4;
  }
  uint64_t v7 = (char *)&v6[v5];
  *(void *)uint64_t v7 = 0;
  *((void *)v7 + 1) = 0;
  int v8 = *((_DWORD *)a2 + 60);
  unsigned int v9 = *((_DWORD *)a2 + 61);
  int v10 = v8 + 1;
  *((_DWORD *)a2 + 60) = v8 + 1;
  if (v9 < v8 + 2)
  {
    RB::vector<RB::Rect,2ul,unsigned int>::reserve_slow(v4, v8 + 2);
    int v10 = *((_DWORD *)a2 + 60);
  }
  long long v11 = (__n128 *)a2[29];
  if (!v11) {
    long long v11 = v4;
  }
  long long v12 = (char *)&v11[v10];
  *(void *)long long v12 = 0;
  *((void *)v12 + 1) = 0;
  ++*((_DWORD *)a2 + 60);
  if (!*((unsigned char *)v3 + 235) && (*((unsigned char *)v3 + 233) & 8) == 0)
  {
    uint64_t v13 = **a2;
    int v14 = *((unsigned __int8 *)v3 + 224);
    if (!*((unsigned char *)v3 + 224)) {
      int v14 = *(unsigned __int8 *)(v13 + 12);
    }
    unsigned int v15 = *((_DWORD *)v3 + 57);
    if (v15 == 0x80000000) {
      unsigned int v15 = *(_DWORD *)(v13 + 16);
    }
    if (!RB::DisplayList::EditAdaptor::finalize_group((uint64_t)v3, (RB::DisplayList::Interpolator::Layer *)a2, v14, v15, 0, *(unsigned int ***)v3, *((_DWORD *)v3 + 2), *((unsigned int ***)v3 + 2), *((_DWORD *)v3 + 6))&& !*((unsigned char *)a2 + 251)&& !(a2[24] & 0x200 | *((unsigned char *)v3 + 233) & 8))
    {
      RB::DisplayList::Interpolator::Layer::failed((uint64_t)a2);
      return;
    }
    goto LABEL_127;
  }
  unsigned int v110 = 0;
  unsigned int v109 = 0;
  v112 = 0;
  size_t v113 = 0;
  unint64_t v114 = 8;
  __n128 v108 = 0uLL;
  __n128 v107 = 0uLL;
  int v17 = *((_DWORD *)v3 + 6);
  BOOL v18 = v17 != 0;
  if (*((_DWORD *)v3 + 2) | v17)
  {
    int v19 = 0;
    unsigned int v20 = 0;
    v94 = (void *)((char *)v3 + 16);
    char v93 = 1;
    int8x8_t v90 = v4;
    int8x8_t v91 = v3;
    do
    {
      if (v18) {
        LODWORD(v21) = *(_DWORD *)(*v94 + 24 * v20 + 8);
      }
      else {
        LODWORD(v21) = 0;
      }
      unsigned __int8 v106 = 0;
      unsigned int v105 = 0x80000000;
      char v104 = 0;
      unsigned int v99 = (RB::DisplayList::Interpolator::Layer *)a2;
      int v100 = v19;
      int v101 = &v106;
      int v102 = &v105;
      __int32 v103 = &v104;
      RB::DisplayList::EditAdaptor::finalize(RB::DisplayList::Interpolator::Layer &)::$_0::operator()<RB::vector<RB::DisplayList::EditAdaptor::Element,0ul,unsigned int>,unsigned int>((uint64_t)&v99, (uint64_t)v3, &v110, (uint64_t)&v97);
      RB::DisplayList::EditAdaptor::finalize(RB::DisplayList::Interpolator::Layer &)::$_0::operator()<RB::vector<RB::DisplayList::EditAdaptor::Element,0ul,unsigned int>,unsigned int>((uint64_t)&v99, (uint64_t)v94, &v109, (uint64_t)&v95);
      v22.i64[0] = v98.n128_i64[1];
      RB::Rect::Union((float32x2_t *)&v108, v98.n128_f64[0], v22, v23, v24, v25, v26);
      v27.i64[0] = v96.n128_i64[1];
      RB::Rect::Union((float32x2_t *)&v107, v96.n128_f64[0], v27, v28, v29, v30, v31);
      if (v104)
      {
        if (v97)
        {
          int v32 = *((_DWORD *)a2 + 60);
          int v33 = v32;
          if (*((_DWORD *)a2 + 61) < (v32 + 1))
          {
            RB::vector<RB::Rect,2ul,unsigned int>::reserve_slow(v4, v32 + 1);
            int v33 = *((_DWORD *)a2 + 60);
          }
          uint64_t v34 = (__n128 *)a2[29];
          if (!v34) {
            uint64_t v34 = v4;
          }
          v34[v33] = v98;
          ++*((_DWORD *)a2 + 60);
        }
        else
        {
          int v32 = 0;
        }
        unsigned int v36 = v95;
        if (v95)
        {
          int v35 = *((_DWORD *)a2 + 60);
          unsigned int v37 = v35;
          if (*((_DWORD *)a2 + 61) < (v35 + 1))
          {
            RB::vector<RB::Rect,2ul,unsigned int>::reserve_slow(v4, v35 + 1);
            unsigned int v37 = *((_DWORD *)a2 + 60);
          }
          uint64_t v38 = (__n128 *)a2[29];
          if (!v38) {
            uint64_t v38 = v4;
          }
          v38[v37] = v96;
          ++*((_DWORD *)a2 + 60);
        }
        else
        {
          int v35 = 1;
        }
      }
      else
      {
        int v32 = 0;
        int v35 = 1;
        unsigned int v36 = v95;
      }
      if (v36) {
        uint64_t v21 = v21;
      }
      else {
        uint64_t v21 = 0xFFFFFFFLL;
      }
      uint64_t v39 = **a2;
      int v40 = v106;
      if (!v106)
      {
        int v40 = *(unsigned __int8 *)(v39 + 12);
        unsigned __int8 v106 = *(unsigned char *)(v39 + 12);
      }
      unsigned int v41 = v105;
      if (v105 == 0x80000000)
      {
        unsigned int v41 = *(_DWORD *)(v39 + 16);
        unsigned int v105 = v41;
      }
      unsigned int v42 = v110;
      unsigned int v20 = v109;
      if (v97 | v36)
      {
        uint64_t v43 = *((unsigned int *)a2 + 46);
        unsigned int v92 = v110;
        BOOL v44 = RB::DisplayList::EditAdaptor::finalize_group((uint64_t)v3, (RB::DisplayList::Interpolator::Layer *)a2, v40, v41, (const RB::DisplayList::Item *)v21, (unsigned int **)(*(void *)v3 + 24 * (v110 - v97)), v97, (unsigned int **)(*((void *)v3 + 2) + 24 * (v109 - v36)), v36);
        uint64_t v45 = *((unsigned int *)a2 + 46);
        BOOL v46 = v35 == 1 && v32 == 0;
        if (!v46 && v43 < v45)
        {
          uint64_t v47 = (char *)a2[22];
          if (!v47) {
            uint64_t v47 = (char *)(a2 + 2);
          }
          __int16 v48 = (int *)&v47[40 * v43 + 28];
          uint64_t v49 = v45 - v43;
          do
          {
            *(v48 - 1) = v32;
            *__int16 v48 = v35;
            v48 += 10;
            --v49;
          }
          while (v49);
        }
        if (v21 == 0xFFFFFFF && v43 < v45)
        {
          size_t v50 = v113;
          size_t v51 = v113 + 1;
          if (v114 < v113 + 1)
          {
            RB::vector<RBDevice *,8ul,unsigned long>::reserve_slow(__dst, v51);
            size_t v50 = v113;
            size_t v51 = v113 + 1;
          }
          v52 = v112;
          if (!v112) {
            v52 = __dst;
          }
          v53 = &v52[8 * v50];
          _DWORD *v53 = v43;
          v53[1] = v45;
          size_t v113 = v51;
        }
        v93 &= !v44;
        unsigned int v3 = v91;
        uint64_t v54 = *((unsigned int *)v91 + 50);
        if (v54) {
          bzero(*((void **)v91 + 24), 4 * v54);
        }
        unint64_t v4 = v90;
        unsigned int v42 = v92;
      }
      ++v19;
      unsigned int v55 = *((_DWORD *)v3 + 6);
      BOOL v18 = v20 < v55;
    }
    while (v42 < *((_DWORD *)v3 + 2) || v20 < v55);
  }
  else
  {
    char v93 = 1;
  }
  if ((v93 & 1) == 0 || *((unsigned char *)a2 + 251) || a2[24] & 0x200 | *((unsigned char *)v3 + 233) & 8)
  {
    int32x2_t v58 = (__n128 *)a2[29];
    if (!v58) {
      int32x2_t v58 = v4;
    }
    *int32x2_t v58 = v108;
    float32x2_t v59 = (__n128 *)a2[29];
    if (!v59) {
      float32x2_t v59 = v4;
    }
    __n128 v16 = v107;
    v59[1] = v107;
    float32x2_t v60 = (unsigned int *)v112;
    if (!v112) {
      float32x2_t v60 = (unsigned int *)__dst;
    }
    if (v113)
    {
      float32x2_t v61 = &v60[2 * v113];
      do
      {
        unint64_t v62 = *v60;
        float64x2_t v63 = (char *)a2[22];
        if (!v63) {
          float64x2_t v63 = (char *)(a2 + 2);
        }
        uint64_t v64 = *((unsigned int *)a2 + 46);
        if (v64)
        {
          long long v65 = &v63[40 * v62];
          uint64_t v66 = 40 * v64;
          int v67 = *((_DWORD *)v65 + 2);
          int v68 = *((_DWORD *)v65 + 3);
          int32x4_t v69 = v63 + 12;
          int v70 = 0x7FFFFFFF;
          unsigned int v71 = 536870910;
          int v72 = 0x7FFFFFFF;
          do
          {
            uint64_t v73 = *(void *)(v69 - 3);
            int v74 = v73 & 0xF;
            if ((~v73 & 0xFFFFFFF0) != 0 && v74 != 1 && v74 != 8)
            {
              int v77 = *(v69 - 1) - v67;
              int v78 = *v69 - v68;
              BOOL v79 = v77 >= 1 && v77 < v72;
              if (v79 || (!v77 ? (BOOL v80 = v78 < 1) : (BOOL v80 = 1), !v80 ? (v81 = v78 < v70) : (v81 = 0), v81))
              {
                unsigned int v71 = v73 >> 4;
                int v72 = *(v69 - 1) - v67;
                int v70 = *v69 - v68;
              }
            }
            v69 += 10;
            v66 -= 40;
          }
          while (v66);
        }
        else
        {
          unsigned int v71 = 536870910;
        }
        if (v62 < v60[1])
        {
          uint64_t v82 = 16 * v71;
          uint64_t v83 = 40 * v62;
          do
          {
            float32x2_t v84 = (char *)a2[22];
            if (!v84) {
              float32x2_t v84 = (char *)(a2 + 2);
            }
            *(void *)&v84[v83] = *(void *)&v84[v83] & 0xFFFFFFFF0000000FLL | v82;
            ++v62;
            v83 += 40;
          }
          while (v62 < v60[1]);
        }
        v60 += 2;
      }
      while (v60 != v61);
    }
    char v57 = 1;
  }
  else
  {
    RB::DisplayList::Interpolator::Layer::failed((uint64_t)a2);
    char v57 = 0;
  }
  if (v112) {
    free(v112);
  }
  if (v57)
  {
LABEL_127:
    if (a2[22]) {
      float32x2_t v85 = (long long *)a2[22];
    }
    else {
      float32x2_t v85 = (long long *)(a2 + 2);
    }
    unint64_t v86 = *((unsigned int *)a2 + 46);
    if (v86 < 0x81)
    {
      int32x2_t v87 = 0;
      uint64_t v89 = 0;
    }
    else
    {
      int32x2_t v87 = (uint64_t *)std::get_temporary_buffer[abi:nn180100]<RB::DisplayList::Interpolator::Op>(v86);
      uint64_t v89 = v88;
    }
    std::__stable_sort<std::_ClassicAlgPolicy,RB::DisplayList::EditAdaptor::finalize(RB::DisplayList::Interpolator::Layer &)::$_1 &,RB::DisplayList::Interpolator::Op *>(v85, (long long *)((char *)v85 + 40 * v86), v86, v87, v89, v16);
    if (v87) {
      operator delete(v87);
    }
  }
}

void sub_214200BB8(_Unwind_Exception *exception_object)
{
  unsigned int v3 = *(void **)(v1 - 120);
  if (v3) {
    free(v3);
  }
  _Unwind_Resume(exception_object);
}

BOOL RB::DisplayList::EditAdaptor::finalize_group(uint64_t a1, RB::DisplayList::Interpolator::Layer *a2, int a3, unsigned int a4, const RB::DisplayList::Item *a5, unsigned int **a6, unsigned int a7, unsigned int **a8, unsigned int a9)
{
  unsigned int v9 = a7;
  int v10 = a6;
  LODWORD(v350) = a9;
  uint64_t v394 = *MEMORY[0x263EF8340];
  v373 = a8;
  v374 = a6;
  uint64_t v345 = (16 * a5);
  uint64_t v361 = a1;
  if (a7)
  {
    do
    {
      unsigned int v14 = *((unsigned __int16 *)*v10 + 23);
      int v15 = (v14 >> 11) & 1;
      if ((v14 & 0x800) == 0) {
        break;
      }
      int v16 = *((_DWORD *)a2 + 46);
      if (*((_DWORD *)a2 + 47) < (v16 + 1))
      {
        RB::vector<RB::DisplayList::Interpolator::Op,4ul,unsigned int>::reserve_slow((char *)a2 + 16, v16 + 1);
        int v16 = *((_DWORD *)a2 + 46);
      }
      int v17 = (char *)*((void *)a2 + 22);
      if (!v17) {
        int v17 = (char *)a2 + 16;
      }
      BOOL v18 = &v17[40 * v16];
      int v19 = v10[1];
      *(void *)BOOL v18 = 0x1000000000;
      *((void *)v18 + 1) = v19;
      *((_OWORD *)v18 + 1) = xmmword_21421CE00;
      *((void *)v18 + 4) = 0;
      int v20 = *((_DWORD *)a2 + 46);
      *((_DWORD *)a2 + 46) = v20 + 1;
      uint64_t v21 = (char *)*((void *)a2 + 22);
      if (!v21) {
        uint64_t v21 = (char *)a2 + 16;
      }
      *(void *)&v21[40 * v20] = *(void *)&v21[40 * v20] & 0xFFFFFFFF0000000FLL | v345;
      *((_DWORD *)a2 + 48) |= 1u;
      RB::DisplayList::Interpolator::Layer::merge_tail((uint64_t)a2);
      int v10 = v374 + 3;
      v374 += 3;
      --v9;
    }
    while (v9);
    a1 = v361;
    unsigned int v22 = a4;
  }
  else
  {
    unsigned int v22 = a4;
    LOBYTE(v15) = 1;
  }
  v360 = (char *)a2 + 16;
  uint64_t v356 = *((unsigned int *)a2 + 46);
  v372[0] = a1;
  v372[1] = (uint64_t)a2;
  v362 = a2;
  if (a3 == 1 && v22)
  {
    LOBYTE(v370) = 1;
    if (a9)
    {
      unsigned int v23 = v9;
      if (v9)
      {
        while (1)
        {
          __dst[0] = 0;
          LODWORD(v366) = 0;
          uint64_t v371 = 0;
          unsigned int v375 = a5;
          v376 = __dst;
          v377 = (char *)&v371 + 4;
          uint64_t v378 = v361;
          v379 = a2;
          v380 = &v374;
          v381 = &v373;
          v382 = &v370;
          v383 = &v366;
          v384 = &v371;
          unsigned int v24 = v23;
          LOBYTE(v370) = 0;
          if (!RB::lcs_diff<RB::DisplayList::EditAdaptor::Element,RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element*,unsigned int,RB::DisplayList::EditAdaptor::Element*,unsigned int)::$_0,RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element*,unsigned int,RB::DisplayList::EditAdaptor::Element*,unsigned int)::$_1>(v23, v374, v350, v373, (unsigned int *)(2 * v22), v372, &v375))
          {
            float32x2_t v60 = (char *)a2 + 16;
            uint64_t v61 = v361;
            goto LABEL_103;
          }
          unsigned int v25 = __dst[0];
          if (__dst[0] < v24)
          {
            unsigned int v26 = HIDWORD(v371);
            do
            {
              RB::DisplayList::EditAdaptor::mix_elements(v361, (uint64_t)a2, a5, (uint64_t)&v374[3 * v25], (uint64_t)&v373[3 * v26]);
              unsigned int v25 = __dst[0] + 1;
              __dst[0] = v25;
              unsigned int v26 = ++HIDWORD(v371);
            }
            while (v25 < v24);
          }
          LODWORD(v350) = v371;
          if (!(_BYTE)v370 || !v371) {
            break;
          }
          unsigned int v23 = v366;
          if (!v366) {
            goto LABEL_102;
          }
        }
        unsigned int v23 = v366;
      }
    }
    else
    {
      unsigned int v23 = v9;
    }
LABEL_102:
    float32x2_t v60 = (char *)a2 + 16;
    uint64_t v61 = v361;
    unsigned int v24 = v23;
    if (v23 + v350 > a4)
    {
LABEL_103:
      uint64_t v82 = (char *)*((void *)a2 + 22);
      if (!v82) {
        uint64_t v82 = v60;
      }
      uint64_t v83 = &v82[40 * v356];
      unsigned int v84 = *((_DWORD *)a2 + 46);
      unint64_t v85 = 0xCCCCCCCCCCCCCCCDLL * ((40 * v84 - 40 * v356) >> 3);
      uint64_t v86 = v84 - v85;
      *((_DWORD *)a2 + 46) = v86;
      if (v356 != v86) {
        memmove(v83, &v83[40 * v85], 40 * (v86 - v356));
      }
    }
    goto LABEL_215;
  }
  uint64_t v371 = 0;
  v387 = 0;
  uint64_t v388 = 0x8000000000;
  int v370 = 0;
  v366 = (char *)&v371 + 4;
  v367 = &v371;
  v368 = &v375;
  v369 = &v370;
  int v27 = 1;
  int v28 = 1;
  switch(a3)
  {
    case 2:
      unsigned int v352 = v9;
      unint64_t v363 = v9;
      if (v9 >= (unint64_t)a9) {
        uint64_t v29 = a9;
      }
      else {
        uint64_t v29 = v9;
      }
      if (v29)
      {
        uint64_t v30 = 0;
        int32x4_t v31 = v373;
        do
        {
          unsigned int v32 = *((_DWORD *)v10 + 4) + *((_DWORD *)v31 + 4);
          int matrix_value = (*(_DWORD *)(*(void *)(v361 + 192) + 4 * (v32 >> 3)) >> (4 * (v32 & 7))) & 0xF;
          if (!matrix_value) {
            int matrix_value = RB::DisplayList::EditAdaptor::make_matrix_value(v361, a2, (uint64_t *)v10, (uint64_t *)v31);
          }
          if (matrix_value == 1)
          {
            int v34 = HIDWORD(v371);
            int v35 = v30 - HIDWORD(v371);
            if (v30 == HIDWORD(v371))
            {
              unsigned int v36 = v371;
              int v37 = v30;
            }
            else
            {
              int v38 = v388;
              if (v388
                && (v387 ? (uint64_t v39 = (unsigned int *)v387) : (uint64_t v39 = &v375),
                    int v40 = &v39[3 * (v388 - 1)],
                    unsigned int v43 = v40[2],
                    unsigned int v41 = v40 + 2,
                    unsigned int v42 = v43,
                    __PAIR64__(v43 + v39[3 * (v388 - 1)], v39[3 * (v388 - 1) + 1] + v43) == v371))
              {
                *unsigned int v41 = v30 + v42 - HIDWORD(v371);
              }
              else
              {
                unsigned int v44 = v388 + 1;
                if (HIDWORD(v388) < (v388 + 1))
                {
                  RB::vector<RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int)::Mixed,128ul,unsigned int>::reserve_slow(&v375, v44);
                  int v38 = v388;
                  unsigned int v44 = v388 + 1;
                }
                uint64_t v45 = (unsigned int *)v387;
                if (!v387) {
                  uint64_t v45 = &v375;
                }
                unsigned int v46 = v371;
                uint64_t v47 = &v45[3 * v38];
                *uint64_t v47 = HIDWORD(v371);
                v47[1] = v46;
                v47[2] = v30 - v34;
                LODWORD(v388) = v44;
              }
              int v37 = HIDWORD(v371) + v35;
              unsigned int v36 = v30 + v371 - v34;
              int v370 = v30 + v370 - v34;
              LODWORD(v371) = v36;
            }
            unsigned int v48 = v37 + 1;
            HIDWORD(v371) = v48;
            if (v30 == v36)
            {
              int v49 = v30;
            }
            else
            {
              int v50 = v388;
              if (v388
                && (v387 ? (size_t v51 = (unsigned int *)v387) : (size_t v51 = &v375),
                    (v52 = &v51[3 * (v388 - 1)],
                     unsigned int v55 = v52[2],
                     v53 = v52 + 2,
                     unsigned int v54 = v55,
                     v55 + v51[3 * (v388 - 1)] == v48)
                 && v51[3 * (v388 - 1) + 1] + v54 == v36))
              {
                _DWORD *v53 = v30 + v54 - v36;
              }
              else
              {
                unsigned int v56 = v388 + 1;
                if (HIDWORD(v388) < (v388 + 1))
                {
                  RB::vector<RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int)::Mixed,128ul,unsigned int>::reserve_slow(&v375, v56);
                  int v50 = v388;
                  unsigned int v56 = v388 + 1;
                  unsigned int v57 = v371;
                  unsigned int v48 = HIDWORD(v371);
                }
                else
                {
                  unsigned int v57 = v36;
                }
                int32x2_t v58 = (unsigned int *)v387;
                if (!v387) {
                  int32x2_t v58 = &v375;
                }
                float32x2_t v59 = &v58[3 * v50];
                *float32x2_t v59 = v48;
                v59[1] = v57;
                v59[2] = v30 - v36;
                LODWORD(v388) = v56;
              }
              HIDWORD(v371) = v30 + HIDWORD(v371) - v36;
              int v49 = v371 + v30 - v36;
              int v370 = v30 + v370 - v36;
            }
            LODWORD(v371) = v49 + 1;
          }
          ++v30;
          v31 += 3;
          v10 += 3;
        }
        while (v29 != v30);
      }
      unsigned int v79 = a9;
      unsigned int v9 = v352;
      BOOL v80 = v352 > a9;
      if (v363 > a9) {
        unsigned int v79 = v363;
      }
      int v81 = v79 - v29;
      unsigned int v22 = a4;
      goto LABEL_167;
    case 3:
      int v62 = v9;
      long long v392 = 0u;
      unint64_t v393 = 128;
      if (a9 && v9)
      {
        uint64_t v63 = 0;
        uint64_t v64 = &v373[3 * a9 - 3];
        uint64_t v65 = (uint64_t)&v10[3 * v9 - 3];
        do
        {
          unsigned int v66 = *(_DWORD *)(v65 + 16) + *((_DWORD *)v64 + 4);
          int v67 = (*(_DWORD *)(*(void *)(v361 + 192) + 4 * (v66 >> 3)) >> (4 * (v66 & 7))) & 0xF;
          if (!v67) {
            int v67 = RB::DisplayList::EditAdaptor::make_matrix_value(v361, a2, (uint64_t *)v65, (uint64_t *)v64);
          }
          if (v67 == 1)
          {
            uint64_t v68 = *((void *)&v392 + 1);
            size_t v69 = *((void *)&v392 + 1) + 1;
            if (v393 < *((void *)&v392 + 1) + 1)
            {
              RB::vector<double,128ul,unsigned long>::reserve_slow(__dst, v69);
              uint64_t v68 = *((void *)&v392 + 1);
              size_t v69 = *((void *)&v392 + 1) + 1;
            }
            int v70 = (_DWORD *)v392;
            if (!(void)v392) {
              int v70 = __dst;
            }
            unsigned int v71 = &v70[2 * v68];
            *unsigned int v71 = v9 - 1 + v63;
            v71[1] = a9 - 1 + v63;
            *((void *)&v392 + 1) = v69;
          }
          int v72 = v63 - 1;
          if ((unint64_t)a9 + v63 < 2) {
            break;
          }
          unint64_t v73 = v9 + v63;
          v64 -= 3;
          v65 -= 24;
          --v63;
        }
        while (v73 > 1);
        unsigned int v87 = a9;
        unsigned int v88 = a9 + v72;
        int v62 = v9 + v72;
      }
      else
      {
        unsigned int v87 = a9;
        unsigned int v88 = a9;
      }
      if (v9 <= v87) {
        int v89 = v88;
      }
      else {
        int v89 = v62;
      }
      RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int)::$_2::operator()(&v366, v9 > v87, 0, v89);
      if (*((void *)&v392 + 1))
      {
        unsigned int v90 = HIDWORD(v371);
        uint64_t v91 = *((void *)&v392 + 1) - 1;
        do
        {
          unsigned int v92 = (_DWORD *)v392;
          if (!(void)v392) {
            unsigned int v92 = __dst;
          }
          v94 = &v92[2 * v91];
          int v93 = v94[1];
          unsigned int v95 = *v94 - v90;
          if (*v94 == v90)
          {
            unsigned int v96 = v371;
          }
          else
          {
            int v97 = v388;
            if (v388
              && (v387 ? (__n128 v98 = (unsigned int *)v387) : (__n128 v98 = &v375),
                  (unsigned int v99 = &v98[3 * (v388 - 1)],
                   unsigned int v102 = v99[2],
                   int v100 = v99 + 2,
                   int v101 = v102,
                   v102 + v98[3 * (v388 - 1)] == v90)
               && v98[3 * (v388 - 1) + 1] + v101 == v371))
            {
              *int v100 = v101 + v95;
            }
            else
            {
              unsigned int v103 = v388 + 1;
              if (HIDWORD(v388) < (v388 + 1))
              {
                RB::vector<RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int)::Mixed,128ul,unsigned int>::reserve_slow(&v375, v103);
                int v97 = v388;
                unsigned int v103 = v388 + 1;
                unsigned int v90 = HIDWORD(v371);
              }
              char v104 = (unsigned int *)v387;
              if (!v387) {
                char v104 = &v375;
              }
              unsigned int v105 = v371;
              unsigned __int8 v106 = &v104[3 * v97];
              unsigned int *v106 = v90;
              v106[1] = v105;
              v106[2] = v95;
              LODWORD(v388) = v103;
            }
            unsigned int v90 = HIDWORD(v371) + v95;
            unsigned int v96 = v371 + v95;
            v370 += v95;
            LODWORD(v371) = v371 + v95;
          }
          HIDWORD(v371) = ++v90;
          unsigned int v107 = v93 - v96;
          if (v93 != v96)
          {
            int v108 = v388;
            if (v388
              && (v387 ? (unsigned int v109 = (unsigned int *)v387) : (unsigned int v109 = &v375),
                  (unsigned int v110 = &v109[3 * (v388 - 1)],
                   unsigned int v113 = v110[2],
                   float32x2_t v111 = v110 + 2,
                   int v112 = v113,
                   v113 + v109[3 * (v388 - 1)] == v90)
               && v109[3 * (v388 - 1) + 1] + v112 == v96))
            {
              *float32x2_t v111 = v112 + v107;
            }
            else
            {
              unsigned int v114 = v388 + 1;
              if (HIDWORD(v388) < (v388 + 1))
              {
                RB::vector<RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int)::Mixed,128ul,unsigned int>::reserve_slow(&v375, v114);
                int v108 = v388;
                unsigned int v114 = v388 + 1;
                unsigned int v96 = v371;
                unsigned int v90 = HIDWORD(v371);
              }
              uint64_t v115 = (unsigned int *)v387;
              if (!v387) {
                uint64_t v115 = &v375;
              }
              float32x2_t v116 = &v115[3 * v108];
              *float32x2_t v116 = v90;
              v116[1] = v96;
              v116[2] = v107;
              LODWORD(v388) = v114;
            }
            unsigned int v90 = HIDWORD(v371) + v107;
            HIDWORD(v371) += v107;
            int v93 = v371 + v107;
            v370 += v107;
          }
          LODWORD(v371) = v93 + 1;
          --v91;
        }
        while (v91 != -1);
      }
      if ((void)v392) {
        free((void *)v392);
      }
      char v74 = 0;
      unsigned int v22 = a4;
      goto LABEL_169;
    case 4:
      goto LABEL_84;
    case 5:
      int v28 = 0;
      goto LABEL_84;
    case 6:
      int v27 = 0;
LABEL_84:
      RB::prefix_suffix_diff<RB::DisplayList::EditAdaptor::Element,RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element*,unsigned int,RB::DisplayList::EditAdaptor::Element*,unsigned int)::$_0,RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element*,unsigned int,RB::DisplayList::EditAdaptor::Element*,unsigned int)::$_2>(v9, (uint64_t)v10, a9, (uint64_t)v373, (uint64_t)v372, &v366, v27, v28);
      goto LABEL_168;
    case 7:
      if (v9 != a9) {
        goto LABEL_107;
      }
      char v74 = a9;
      if (!a9) {
        goto LABEL_169;
      }
      uint64_t v75 = v9;
      int8x8_t v76 = v373;
      break;
    default:
      if ((v15 & 1) == 0) {
        HIDWORD(v371) = v9;
      }
      if (a9) {
        LODWORD(v371) = a9;
      }
      char v74 = 1;
      goto LABEL_169;
  }
  while (1)
  {
    unsigned int v77 = *((_DWORD *)v10 + 4) + *((_DWORD *)v76 + 4);
    int v78 = (*(_DWORD *)(*(void *)(v361 + 192) + 4 * (v77 >> 3)) >> (4 * (v77 & 7))) & 0xF;
    if (!v78) {
      int v78 = RB::DisplayList::EditAdaptor::make_matrix_value(v361, a2, (uint64_t *)v10, (uint64_t *)v76);
    }
    if (v78 == 1) {
      break;
    }
    char v74 = 0;
    v76 += 3;
    v10 += 3;
    if (!--v75) {
      goto LABEL_169;
    }
  }
LABEL_107:
  if (v15)
  {
    BOOL v80 = 0;
    LODWORD(v29) = 0;
  }
  else
  {
    int v117 = HIDWORD(v371);
    if (HIDWORD(v371))
    {
      int v118 = v388;
      if (v388
        && (v387 ? (int64x2_t v119 = (unsigned int *)v387) : (int64x2_t v119 = &v375),
            long long v120 = &v119[3 * (v388 - 1)],
            unsigned int v123 = v120[2],
            v121 = v120 + 2,
            unsigned int v122 = v123,
            __PAIR64__(v123 + v119[3 * (v388 - 1)], v119[3 * (v388 - 1) + 1] + v123) == v371))
      {
        _DWORD *v121 = v122 - HIDWORD(v371);
      }
      else
      {
        unsigned int v124 = v388 + 1;
        if (HIDWORD(v388) < (v388 + 1))
        {
          RB::vector<RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int)::Mixed,128ul,unsigned int>::reserve_slow(&v375, v124);
          int v118 = v388;
          unsigned int v124 = v388 + 1;
        }
        v125 = (unsigned int *)v387;
        if (!v387) {
          v125 = &v375;
        }
        unsigned int v126 = v371;
        int8x16_t v127 = &v125[3 * v118];
        *int8x16_t v127 = HIDWORD(v371);
        v127[1] = v126;
        v127[2] = -v117;
        LODWORD(v388) = v124;
      }
      int v128 = HIDWORD(v371) - v117;
      LODWORD(v371) = v371 - v117;
      v370 -= v117;
    }
    else
    {
      int v128 = 0;
    }
    BOOL v80 = 0;
    LODWORD(v29) = 0;
    HIDWORD(v371) = v128 + v9;
  }
  int v81 = a9;
LABEL_167:
  RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int)::$_2::operator()(&v366, v80, v29, v81);
LABEL_168:
  char v74 = 0;
LABEL_169:
  unsigned int v24 = HIDWORD(v371);
  int v129 = v370 + v9 - HIDWORD(v371);
  int v370 = v129;
  if (v22 != -1 && (v74 & 1) == 0)
  {
    unsigned int v130 = v9 - v129;
    unsigned int v131 = a9 - v129;
    BOOL v132 = v130 > v22 || v131 > v22;
    uint64_t v61 = v361;
    if (!v132) {
      goto LABEL_175;
    }
LABEL_201:
    unsigned int v24 = v9;
    goto LABEL_212;
  }
  uint64_t v61 = v361;
  if (v74) {
    goto LABEL_201;
  }
LABEL_175:
  if (v387) {
    v133 = (unsigned int *)v387;
  }
  else {
    v133 = &v375;
  }
  if (v388)
  {
    unsigned int v353 = v9;
    unsigned int v134 = 0;
    v135 = 0;
    LODWORD(v136) = 0;
    v137 = 0;
    v364 = &v133[3 * v388];
    do
    {
      v138 = (unsigned int **)*v133;
      v139 = (unsigned int **)v133[1];
      unsigned int v140 = *v133;
      uint64_t v141 = v133[2];
      v142 = v138;
      if (v134 != v135)
      {
        if (v134 >= v138)
        {
          v142 = v135;
        }
        else
        {
          v143 = v374;
          v144 = &v374[3 * v134];
          uint64_t v145 = (uint64_t)v138 - v134;
          do
          {
            v142 = (unsigned int **)(v135 + 1);
            long long v146 = *(_OWORD *)v144;
            v135 = &v143[3 * v135];
            v135[2] = v144[2];
            *(_OWORD *)v135 = v146;
            v144 += 3;
            LODWORD(v135) = v142;
            --v145;
          }
          while (v145);
        }
      }
      v147 = v139;
      if (v136 != v137)
      {
        if (v136 >= v139)
        {
          v147 = v137;
        }
        else
        {
          v148 = v373;
          v149 = &v373[3 * v136];
          uint64_t v150 = (uint64_t)v139 - v136;
          do
          {
            v147 = (unsigned int **)(v137 + 1);
            long long v151 = *(_OWORD *)v149;
            v137 = &v148[3 * v137];
            v137[2] = v149[2];
            *(_OWORD *)v137 = v151;
            v149 += 3;
            LODWORD(v137) = v147;
            --v150;
          }
          while (v150);
        }
      }
      v350 = v147;
      uint64_t v152 = v141;
      unsigned int v153 = v139;
      if (v141)
      {
        do
        {
          RB::DisplayList::EditAdaptor::mix_elements(v361, (uint64_t)v362, a5, (uint64_t)&v374[3 * v140++], (uint64_t)&v373[3 * v153++]);
          --v152;
        }
        while (v152);
      }
      unsigned int v134 = v141 + v138;
      uint64_t v136 = (v141 + v139);
      v133 += 3;
      v135 = v142;
      v137 = v350;
      a2 = v362;
    }
    while (v133 != v364);
    unsigned int v154 = HIDWORD(v371);
    unsigned int v24 = HIDWORD(v371);
    float32x2_t v60 = v360;
    uint64_t v61 = v361;
    unsigned int v9 = v353;
    if (v134 != v142)
    {
      if (v134 >= HIDWORD(v371))
      {
        unsigned int v24 = v142;
      }
      else
      {
        v155 = v374;
        v156 = &v374[3 * v134];
        unint64_t v157 = HIDWORD(v371) - (unint64_t)v134;
        do
        {
          unsigned int v24 = v142 + 1;
          long long v158 = *(_OWORD *)v156;
          v159 = &v155[3 * v142];
          v159[2] = v156[2];
          *(_OWORD *)v159 = v158;
          v156 += 3;
          LODWORD(v142) = v142 + 1;
          --v157;
        }
        while (v157);
      }
    }
    uint64_t v160 = v371;
    if (v136 == v350)
    {
      LODWORD(v350) = v371;
    }
    else if (v136 < v371)
    {
      v161 = v373;
      v162 = &v373[3 * v136];
      unsigned int v163 = v350;
      do
      {
        ++v136;
        long long v164 = *(_OWORD *)v162;
        v165 = &v161[3 * v163++];
        v165[2] = v162[2];
        *(_OWORD *)v165 = v164;
        v162 += 3;
      }
      while (v160 != v136);
      LODWORD(v350) = v163;
    }
  }
  else
  {
    LODWORD(v160) = v371;
    unsigned int v154 = HIDWORD(v371);
    LODWORD(v350) = v371;
    float32x2_t v60 = (char *)a2 + 16;
  }
  if (v154 >= v9) {
    goto LABEL_213;
  }
  do
  {
    RB::DisplayList::EditAdaptor::mix_elements(v61, (uint64_t)a2, a5, (uint64_t)&v374[3 * v154], (uint64_t)&v373[3 * v160]);
    unsigned int v154 = HIDWORD(v371) + 1;
    LODWORD(v160) = v371 + 1;
    LODWORD(v371) = v371 + 1;
    HIDWORD(v371) = v154;
  }
  while (v154 < v9);
LABEL_212:
  float32x2_t v60 = v360;
LABEL_213:
  uint64_t v166 = v356;
  if (!v387) {
    goto LABEL_216;
  }
  free(v387);
LABEL_215:
  uint64_t v166 = v356;
LABEL_216:
  uint64_t v167 = *((unsigned int *)a2 + 46);
  if (v167 == v166)
  {
    uint64_t v166 = v356;
    BOOL v336 = (*(unsigned char *)(v61 + 233) & 4) == 0;
  }
  else
  {
    BOOL v336 = 0;
  }
  if (v167 <= v166)
  {
    int v177 = 0;
  }
  else
  {
    uint64_t v168 = v166;
    int v169 = 0;
    v170 = (char *)*((void *)a2 + 22);
    if (!v170) {
      v170 = v60;
    }
    v171 = &v170[40 * v168];
    uint64_t v172 = v167 - v168;
    do
    {
      int v173 = *(_DWORD *)v171;
      v171 += 40;
      v169 |= 1 << (v173 & 0xF);
      --v172;
    }
    while (v172);
    if ((v169 & 0x44) != 0)
    {
      uint64_t v174 = 40 * v356;
      uint64_t v175 = v167 - v356;
      do
      {
        v176 = (char *)*((void *)a2 + 22);
        if (!v176) {
          v176 = v60;
        }
        *(void *)&v176[v174] |= 0x200000000uLL;
        v174 += 40;
        --v175;
      }
      while (v175);
      int v177 = 1;
    }
    else
    {
      int v177 = 0;
    }
  }
  int v335 = v177;
  if ((*(unsigned char *)(v61 + 233) & 0x10) != 0)
  {
    float v178 = 0.0;
    float v179 = 0.0;
    if (v24)
    {
      v180 = (uint64_t *)*((void *)*v374 + 4);
      if (v180)
      {
        v181 = RB::DisplayList::Metadata::numeric_value(v180);
        if (v181) {
          float v179 = *(float *)v181;
        }
      }
    }
    if (v350)
    {
      v182 = (uint64_t *)*((void *)*v373 + 4);
      if (v182)
      {
        v183 = RB::DisplayList::Metadata::numeric_value(v182);
        if (v183) {
          float v178 = *(float *)v183;
        }
      }
    }
    BOOL v365 = v178 < v179;
  }
  else
  {
    BOOL v365 = 0;
  }
  v385 = 0;
  uint64_t v386 = 0x800000000;
  v390 = 0;
  uint64_t v391 = 0x800000000;
  v366 = 0;
  v367 = 0;
  if (v336) {
    int v184 = 4;
  }
  else {
    int v184 = 8;
  }
  BOOL v185 = v350 != 0;
  int v347 = v167;
  if (v24)
  {
    uint64_t v186 = 0;
    char v187 = 0;
    uint64_t v188 = 0x100000000;
    if (!v336) {
      uint64_t v188 = 0;
    }
    uint64_t v189 = 0x200000000;
    if (!v335) {
      uint64_t v189 = 0;
    }
    uint64_t v190 = 0x800000000;
    if (!v365) {
      uint64_t v190 = 0;
    }
    unint64_t v338 = v345 | ((unint64_t)(v350 == 0) << 34) | v188 | v189 | v190;
    int v358 = v184 | 2;
    unsigned int v354 = v167 - v356;
    float v191 = -INFINITY;
    uint64_t v348 = v24;
    int v337 = v184;
    while (1)
    {
      v192 = v374;
      v193 = (RB::DisplayList::AtomizedItems *)&v374[3 * v186];
      v194 = RB::DisplayList::AtomizedItems::transition(v193, a2);
      if (!RB::Transition::empty_transition(v194, 2))
      {
        uint64_t animation = RB::DisplayList::find_animation(*(RB::DisplayList **)v193, 0, v195);
        v198 = (RB::Animation *)animation;
        if (!animation || *(_DWORD *)(animation + 32)) {
          break;
        }
      }
LABEL_315:
      if (++v186 == v348) {
        goto LABEL_318;
      }
    }
    int v199 = *((_DWORD *)a2 + 46);
    if (*((_DWORD *)a2 + 47) < (v199 + 1))
    {
      LODWORD(animation) = RB::vector<RB::DisplayList::Interpolator::Op,4ul,unsigned int>::reserve_slow(v360, v199 + 1);
      int v199 = *((_DWORD *)a2 + 46);
    }
    v343 = v198;
    v200 = (char *)*((void *)a2 + 22);
    v201 = v360;
    if (!v200) {
      v200 = v360;
    }
    v202 = &v200[40 * v199];
    v203 = v192[3 * v186 + 1];
    *(void *)v202 = 0x1000000000;
    *((void *)v202 + 1) = v203;
    *((_OWORD *)v202 + 1) = xmmword_21421CE00;
    *((void *)v202 + 4) = 0;
    int v204 = *((_DWORD *)a2 + 46);
    *((_DWORD *)a2 + 46) = v204 + 1;
    if (*((void *)a2 + 22)) {
      v201 = (char *)*((void *)a2 + 22);
    }
    v205 = &v201[40 * v204];
    *(void *)v205 = v338 | *(void *)v205 & 0xFFFFFFF00000000FLL;
    *((_DWORD *)a2 + 48) |= 1u;
    BOOL v206 = v185 && (*(_WORD *)(*(void *)v193 + 46) & 0x3F) == 2;
    unsigned int v207 = *((_DWORD *)v194 + 12);
    if (v207)
    {
      v339 = v201;
      int v340 = v204;
      unsigned int v208 = 0;
      char v209 = 0;
      char v210 = 0;
      BOOL v212 = v167 == v356 || (*((unsigned char *)v194 + 14) + 1) < 2u;
      do
      {
        v213 = (char *)*((void *)v194 + 5);
        if (!v213) {
          v213 = (char *)v194 + 24;
        }
        v214 = (EffectOrArg *)&v213[4 * v208];
        if ((v205[4] & 4) != 0) {
          int v215 = 16;
        }
        else {
          int v215 = 32;
        }
        unsigned int arg_low = LOWORD(v214->arg);
        if (((v215 | v358) & (arg_low >> 8)) == 2)
        {
          unsigned __int16 v217 = RB::Transition::Effect::anchor_direction((RB::Transition::Effect *)v214, 2u, v365);
          if (v217 >= 0x100u)
          {
            v221 = (char *)*((void *)v362 + 22);
            if (!v221) {
              v221 = v360;
            }
            RB::DisplayList::EditAdaptor::find_motion_projection(v361, (uint64_t)v362, (unsigned int *)v193, v205, v217, (uint64_t)&v221[40 * v356], v354, (uint64_t)&v366);
          }
          else
          {
            unsigned __int16 v218 = RB::Transition::Effect::sequence_direction((RB::Transition::Effect *)v214, 2u, v365);
            if ((v218 < 0x100u) | v210 & 1)
            {
              v210 |= v218 > 0xFFu;
            }
            else
            {
              if ((LOWORD(v214->arg) & 0x80) != 0)
              {
                v220.i32[0] = 1.0;
                LODWORD(v219) = 0;
              }
              else
              {
                LOBYTE(v219) = v214->effect.begin_or_insert_animation;
                *(float *)&double v219 = (float)LODWORD(v219) * 0.0039216;
                v220.i8[0] = v214->effect.dur_or_remove_animation;
                v220.f32[0] = (float)v220.u32[0] * 0.0039216;
              }
              char v210 = RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int)::$_5::operator()((uint64_t)&v375, *((_DWORD *)v362 + 46) - 1, (unsigned int *)v193, v218, *(float *)&v219, v220.f32[0]);
            }
          }
          uint64_t animation = RB::Transition::Effect::custom_duration((RB::Transition::Effect *)v214, 2, v214 + 1, v219, v220);
          float v222 = *(float *)&animation;
          if (v191 >= *(float *)&animation) {
            float v222 = v191;
          }
          if ((animation & 0xFF00000000) != 0) {
            float v191 = v222;
          }
          v209 |= (animation & 0xFF00000000) == 0;
          LOWORD(arg_low) = LOWORD(v214->arg);
          BOOL v223 = (LOWORD(v214->arg) & 0x7F) == 1 && v212;
          BOOL v206 = v206 && v223;
          unsigned int v207 = *((_DWORD *)v194 + 12);
        }
        v208 += RB::Transition::_effect_args[arg_low & 0x7F] + 1;
      }
      while (v208 < v207);
      if (v209)
      {
        a2 = v362;
        RB::DisplayList::EditAdaptor::set_animation(animation, v362, v205, v197, v343, (uint64_t)v194);
        LODWORD(v167) = v347;
        int v184 = v337;
        v201 = v339;
        int v204 = v340;
LABEL_309:
        if (*((unsigned char *)a2 + 251)) {
          BOOL v225 = 1;
        }
        else {
          BOOL v225 = *(_DWORD *)&v201[40 * v204 + 32] != *(_DWORD *)(*(void *)a2 + 20);
        }
        *((unsigned char *)a2 + 251) = v225;
        if ((v210 & 1) == 0) {
          RB::DisplayList::Interpolator::Layer::merge_tail((uint64_t)a2);
        }
        BOOL v185 = v206;
        char v187 = 1;
        goto LABEL_315;
      }
      a2 = v362;
      LODWORD(v167) = v347;
      int v184 = v337;
      v201 = v339;
      int v204 = v340;
    }
    else
    {
      char v210 = 0;
    }
    if (v191 <= 0.0) {
      int v224 = -1;
    }
    else {
      int v224 = -2;
    }
    *(_DWORD *)&v201[40 * v204 + 32] = v224;
    goto LABEL_309;
  }
  char v187 = 0;
  float v191 = -INFINITY;
LABEL_318:
  unsigned int v341 = *((_DWORD *)a2 + 46);
  if (v350)
  {
    uint64_t v226 = 0;
    uint64_t v227 = 0x100000000;
    if (!v336) {
      uint64_t v227 = 0;
    }
    uint64_t v228 = 0x200000000;
    if (!v335) {
      uint64_t v228 = 0;
    }
    uint64_t v229 = 0x400000000;
    if (v187) {
      uint64_t v229 = 0;
    }
    uint64_t v230 = 0x800000000;
    if (!v365) {
      uint64_t v230 = 0;
    }
    uint64_t v344 = v227 | v345 | v228 | v230 | v229;
    int v231 = v184 | 1;
    unsigned int v355 = v167 - v356;
    uint64_t v342 = v350;
    while (1)
    {
      v232 = a2;
      v233 = v373;
      v359 = (RB::DisplayList::AtomizedItems *)&v373[3 * v226];
      v234 = RB::DisplayList::AtomizedItems::transition(v359, v232);
      char v235 = *((unsigned char *)v234 + 14);
      if (RB::Transition::empty_transition(v234, 1)) {
        uint64_t v237 = 8;
      }
      else {
        uint64_t v237 = 1;
      }
      v238 = v362;
      int v239 = *((_DWORD *)v362 + 46);
      if (*((_DWORD *)v362 + 47) < (v239 + 1))
      {
        RB::vector<RB::DisplayList::Interpolator::Op,4ul,unsigned int>::reserve_slow(v360, v239 + 1);
        v238 = v362;
        int v239 = *((_DWORD *)v362 + 46);
      }
      BOOL v240 = 0;
      v241 = (char *)*((void *)v238 + 22);
      if (!v241) {
        v241 = v360;
      }
      v242 = (uint64_t *)&v241[40 * v239];
      v243 = v233[3 * v226 + 1];
      uint64_t *v242 = v237 | 0x1000000000;
      v242[1] = 0;
      v242[2] = (uint64_t)v243;
      v242[3] = 0x100000000;
      v242[4] = 0;
      unsigned int v244 = *((_DWORD *)v238 + 46);
      *((_DWORD *)v238 + 46) = v244 + 1;
      v245 = (char *)*((void *)v238 + 22);
      if (!v245) {
        v245 = v360;
      }
      v349 = v245;
      unsigned int v351 = v244;
      v246 = &v245[40 * v244];
      *(void *)v246 = v344 | *(void *)v246 & 0xFFFFFFF00000000FLL;
      *((_DWORD *)v238 + 48) |= 1 << v237;
      a2 = v238;
      if (v185) {
        BOOL v240 = (*(_WORD *)(*(void *)v359 + 46) & 0x3F) == 2;
      }
      unsigned int v247 = *((_DWORD *)v234 + 12);
      if (!v247) {
        break;
      }
      uint64_t v346 = v226;
      unsigned int v248 = 0;
      char v249 = 0;
      char v250 = 0;
      BOOL v252 = v347 == v356 || (v235 + 1) < 2u;
      do
      {
        v253 = (char *)*((void *)v234 + 5);
        if (!v253) {
          v253 = (char *)v234 + 24;
        }
        v254 = (EffectOrArg *)&v253[4 * v248];
        if ((v246[4] & 4) != 0) {
          int v255 = 16;
        }
        else {
          int v255 = 32;
        }
        unsigned int v256 = LOWORD(v254->arg);
        if (((v255 | v231) & (v256 >> 8)) == 1)
        {
          unsigned __int16 v257 = RB::Transition::Effect::anchor_direction((RB::Transition::Effect *)v254, 1u, v365);
          if (v257 >= 0x100u)
          {
            v261 = (char *)*((void *)v362 + 22);
            if (!v261) {
              v261 = v360;
            }
            RB::DisplayList::EditAdaptor::find_motion_projection(v361, (uint64_t)v362, (unsigned int *)v359, v246, v257, (uint64_t)&v261[40 * v356], v355, (uint64_t)&v366);
          }
          else
          {
            unsigned __int16 v258 = RB::Transition::Effect::sequence_direction((RB::Transition::Effect *)v254, 1u, v365);
            if ((v258 < 0x100u) | v250 & 1)
            {
              v250 |= v258 > 0xFFu;
            }
            else
            {
              if ((LOWORD(v254->arg) & 0x80) != 0)
              {
                v260.i32[0] = 1.0;
                LODWORD(v259) = 0;
              }
              else
              {
                LOBYTE(v259) = v254->effect.begin_or_insert_animation;
                *(float *)&double v259 = (float)LODWORD(v259) * 0.0039216;
                v260.i8[0] = v254->effect.dur_or_remove_animation;
                v260.f32[0] = (float)v260.u32[0] * 0.0039216;
              }
              char v250 = RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int)::$_5::operator()((uint64_t)__dst, *((_DWORD *)v362 + 46) - 1, (unsigned int *)v359, v258, *(float *)&v259, v260.f32[0]);
            }
          }
          uint64_t v262 = RB::Transition::Effect::custom_duration((RB::Transition::Effect *)v254, 1, v254 + 1, v259, v260);
          float v263 = *(float *)&v262;
          if (v191 >= *(float *)&v262) {
            float v263 = v191;
          }
          if ((v262 & 0xFF00000000) != 0) {
            float v191 = v263;
          }
          v249 |= (v262 & 0xFF00000000) == 0;
          LOWORD(v256) = LOWORD(v254->arg);
          BOOL v264 = (LOWORD(v254->arg) & 0x7F) == 1 && v252;
          BOOL v240 = v240 && v264;
          unsigned int v247 = *((_DWORD *)v234 + 12);
        }
        v248 += RB::Transition::_effect_args[v256 & 0x7F] + 1;
      }
      while (v248 < v247);
      v266 = v349;
      unsigned int v265 = v351;
      if ((v249 & 1) == 0)
      {
        a2 = v362;
        uint64_t v226 = v346;
        goto LABEL_378;
      }
      v267 = (RB::Animation *)RB::DisplayList::find_animation(0, *(const RB::DisplayList::Item **)v359, v236);
      a2 = v362;
      uint64_t v226 = v346;
      RB::DisplayList::EditAdaptor::set_animation((int)v267, v362, v246, v268, v267, (uint64_t)v234);
LABEL_382:
      if (*((unsigned char *)a2 + 251)) {
        BOOL v270 = 1;
      }
      else {
        BOOL v270 = *(_DWORD *)&v266[40 * v265 + 32] != *(_DWORD *)(*(void *)a2 + 20);
      }
      *((unsigned char *)a2 + 251) = v270;
      if ((v250 & 1) == 0) {
        RB::DisplayList::Interpolator::Layer::merge_tail((uint64_t)a2);
      }
      ++v226;
      BOOL v185 = v240;
      LODWORD(v167) = v347;
      if (v226 == v342) {
        goto LABEL_388;
      }
    }
    char v250 = 0;
    v266 = v349;
    unsigned int v265 = v244;
LABEL_378:
    if (v191 <= 0.0) {
      int v269 = -1;
    }
    else {
      int v269 = -2;
    }
    *(_DWORD *)&v266[40 * v265 + 32] = v269;
    goto LABEL_382;
  }
LABEL_388:
  if (v191 > 0.0)
  {
    float v271 = *(float *)(*(void *)a2 + 72);
    if (v271 <= v191) {
      float v271 = v191;
    }
    *(float *)(*(void *)a2 + 72) = v271;
  }
  if (v185 && v341 > v167)
  {
    unsigned int v272 = *((_DWORD *)a2 + 46);
    if (v272 > v341)
    {
      if ((int)v167 + 1 >= v341)
      {
        BOOL v276 = 1;
        v273 = v360;
      }
      else
      {
        v273 = v360;
        if (*((void *)a2 + 22)) {
          v274 = (char *)*((void *)a2 + 22);
        }
        else {
          v274 = v360;
        }
        v275 = &v274[40 * v167 + 48];
        LOBYTE(v276) = 1;
        int v277 = v167;
        do
        {
          BOOL v276 = v276 && *(_DWORD *)v275 == *(_DWORD *)&v274[40 * v277++ + 8] + 1;
          v275 += 40;
        }
        while (v341 - 1 != v277);
      }
      if (v341 + 1 < v272)
      {
        v278 = (char *)*((void *)a2 + 22);
        if (!v278) {
          v278 = v273;
        }
        v279 = &v278[40 * v341 + 56];
        unsigned int v280 = v341;
        do
        {
          BOOL v276 = v276 && *(_DWORD *)v279 == *(_DWORD *)&v278[40 * v280++ + 16] + 1;
          v279 += 40;
        }
        while (v272 - 1 != v280);
      }
      if (v276)
      {
        v281 = (char *)*((void *)a2 + 22);
        v282 = v360;
        if (v281) {
          v282 = (char *)*((void *)a2 + 22);
        }
        v283 = &v282[40 * v167];
        int v284 = *((_DWORD *)v283 + 2);
        int v285 = *(_DWORD *)&v282[40 * v341 - 32];
        int v286 = *(_DWORD *)&v282[40 * v341 + 16];
        int v287 = *(_DWORD *)&v282[40 * v272 - 24];
        uint64_t v288 = v283 + 40 - v282;
        unint64_t v289 = 0xCCCCCCCCCCCCCCCDLL * ((&v282[40 * v272] - (v283 + 40)) >> 3);
        uint64_t v290 = v288 >> 3;
        uint64_t v291 = v272 - v289;
        *((_DWORD *)a2 + 46) = v291;
        if (v291 != 0xCCCCCCCCCCCCCCCDLL * v290)
        {
          memmove(v283 + 40, &v283[40 * v289 + 40], 40 * (v291 - 0xCCCCCCCCCCCCCCCDLL * v290));
          v281 = (char *)*((void *)a2 + 22);
          LODWORD(v291) = *((_DWORD *)a2 + 46);
        }
        if (!v281) {
          v281 = v360;
        }
        v292 = &v281[40 * (v291 - 1)];
        *(void *)v292 = *(void *)v292 & 0xFFFFFFFFFFFFFFF0 | 9;
        *((_DWORD *)a2 + 48) |= 0x200u;
        *(void *)v292 &= 0xFFFFFFFFFuLL;
        *((_DWORD *)v292 + 2) = v284;
        *((_DWORD *)v292 + 3) = v285 - v284 + 1;
        *((_DWORD *)v292 + 4) = v286;
        *((_DWORD *)v292 + 5) = v287 - v286 + 1;
      }
    }
  }
  v293 = a2;
  if (v386 >= 2)
  {
    v294 = (float *)(v385 ? v385 : &v375);
    std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int)::SequenceElement *,false>((unint64_t)v294, &v294[4 * v386], 126 - 2 * __clz(v386), 1);
    uint64_t v295 = v386;
    if (v386)
    {
      uint64_t v296 = 0;
      uint64_t v297 = 0;
      do
      {
        if (v385) {
          v298 = (unsigned int *)v385;
        }
        else {
          v298 = &v375;
        }
        unsigned int v299 = v298[v296];
        if (*((void *)v293 + 22)) {
          v300 = (char *)*((void *)v293 + 22);
        }
        else {
          v300 = v360;
        }
        float v301 = RB::DisplayList::Interpolator::Contents::animation_max_duration(*(RB::DisplayList::Interpolator::Contents **)v293, *(_DWORD *)&v300[40 * v299 + 32]);
        float v302 = *(float *)&v298[v296 + 2];
        float v303 = *(float *)&v298[v296 + 3];
        if (v303 < 1.0)
        {
          unsigned int v304 = v298[v296 + 3];
          float32x2_t v305 = vrecpe_f32((float32x2_t)LODWORD(v303));
          float32x2_t v306 = vmul_f32(vrecps_f32((float32x2_t)v304, v305), v305);
          v306.i32[0] = vmul_f32(v306, vrecps_f32((float32x2_t)v304, v306)).u32[0];
          float v307 = vmlas_n_f32(-v301, v301, v306.f32[0]);
          float32x2_t v306 = (float32x2_t)v306.u32[0];
          v306.f32[0] = (float)(v386 - 1);
          float32x2_t v308 = vrecpe_f32(v306);
          float32x2_t v309 = vmul_f32(vrecps_f32(v306, v308), v308);
          float v310 = v307 * vmul_f32(v309, vrecps_f32(v306, v309)).f32[0];
          if (v310 < v302) {
            float v302 = v310;
          }
        }
        float v311 = v301 * (float)((float)v297 * v302);
        *(float *)&v300[40 * v299 + 36] = v311;
        v293 = v362;
        BOOL v313 = v311 != 0.0 || *((unsigned char *)v362 + 251) != 0;
        *((unsigned char *)v362 + 251) = v313;
        ++v297;
        v296 += 4;
      }
      while (v295 != v297);
    }
  }
  if (v391 >= 2)
  {
    v314 = (float *)(v390 ? v390 : __dst);
    std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int)::SequenceElement *,false>((unint64_t)v314, &v314[4 * v391], 126 - 2 * __clz(v391), 1);
    uint64_t v315 = v391;
    if (v391)
    {
      uint64_t v316 = 0;
      uint64_t v317 = 0;
      do
      {
        if (v390) {
          v318 = v390;
        }
        else {
          v318 = __dst;
        }
        int v319 = v318[v316];
        if (*((void *)v293 + 22)) {
          v320 = (char *)*((void *)v293 + 22);
        }
        else {
          v320 = v360;
        }
        float v321 = RB::DisplayList::Interpolator::Contents::animation_max_duration(*(RB::DisplayList::Interpolator::Contents **)v293, *(_DWORD *)&v320[40 * v319 + 32]);
        float v322 = *(float *)&v318[v316 + 2];
        float v323 = *(float *)&v318[v316 + 3];
        if (v323 < 1.0)
        {
          unsigned int v324 = v318[v316 + 3];
          float32x2_t v325 = vrecpe_f32((float32x2_t)LODWORD(v323));
          float32x2_t v326 = vmul_f32(vrecps_f32((float32x2_t)v324, v325), v325);
          v326.i32[0] = vmul_f32(v326, vrecps_f32((float32x2_t)v324, v326)).u32[0];
          float v327 = vmlas_n_f32(-v321, v321, v326.f32[0]);
          float32x2_t v326 = (float32x2_t)v326.u32[0];
          v326.f32[0] = (float)(v391 - 1);
          float32x2_t v328 = vrecpe_f32(v326);
          float32x2_t v329 = vmul_f32(vrecps_f32(v326, v328), v328);
          float v330 = v327 * vmul_f32(v329, vrecps_f32(v326, v329)).f32[0];
          if (v330 < v322) {
            float v322 = v330;
          }
        }
        float v331 = v321 * (float)((float)v317 * v322);
        *(float *)&v320[40 * v319 + 36] = v331;
        v293 = v362;
        BOOL v333 = v331 != 0.0 || *((unsigned char *)v362 + 251) != 0;
        *((unsigned char *)v362 + 251) = v333;
        ++v317;
        v316 += 4;
      }
      while (v315 != v317);
    }
  }
  if (v366) {
    free(v366);
  }
  if (v390) {
    free(v390);
  }
  if (v385) {
    free(v385);
  }
  return !v336;
}

void sub_214202808(_Unwind_Exception *a1)
{
  if (STACK[0xB18]) {
    free((void *)STACK[0xB18]);
  }
  if (STACK[0x708]) {
    free((void *)STACK[0x708]);
  }
  _Unwind_Resume(a1);
}

double RB::DisplayList::EditAdaptor::finalize(RB::DisplayList::Interpolator::Layer &)::$_0::operator()<RB::vector<RB::DisplayList::EditAdaptor::Element,0ul,unsigned int>,unsigned int>@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned int *a3@<X2>, uint64_t a4@<X8>)
{
  long long v35 = 0uLL;
  unsigned int v4 = *a3;
  if (*a3 >= *(_DWORD *)(a2 + 8))
  {
    int v9 = 0;
  }
  else
  {
    uint64_t v8 = 0;
    int v9 = 0;
    do
    {
      if (*(_DWORD *)(*(void *)a2 + 24 * v4 + 20) != *(_DWORD *)(a1 + 8)) {
        break;
      }
      int v10 = *(uint64_t **)(*(void *)(*(void *)a2 + 24 * v4) + 32);
      if (v10)
      {
        long long v11 = *(RB::DisplayList::Interpolator::Layer **)a1;
        long long v12 = RB::DisplayList::Metadata::transition(v10);
        uint64_t v13 = RB::DisplayList::Interpolator::Layer::item_transition(v11, (const RB::Transition *)v12);
        unsigned int v14 = *(unsigned char **)(a1 + 16);
        unsigned int v15 = *v14;
        if (v15 <= *((unsigned __int8 *)v13 + 12)) {
          LOBYTE(v15) = *((unsigned char *)v13 + 12);
        }
        *unsigned int v14 = v15;
        int v16 = *(int **)(a1 + 24);
        int v17 = *((_DWORD *)v13 + 4);
        if (*v16 > v17) {
          int v17 = *v16;
        }
        *int v16 = v17;
        BOOL v18 = *(unsigned char **)(a1 + 32);
        if (!*v18)
        {
          unsigned int v19 = *((_DWORD *)v13 + 12);
          if (v19)
          {
            unsigned int v20 = 0;
            uint64_t v21 = (char *)v13 + 24;
            if (*((void *)v13 + 5)) {
              uint64_t v21 = (char *)*((void *)v13 + 5);
            }
            do
            {
              unsigned int v22 = &v21[4 * v20];
              __int16 v23 = *(_WORD *)v22;
              if ((*(_WORD *)v22 & 0x7Fu) <= 0x12 && ((1 << (*(_WORD *)v22 & 0x7F)) & 0x60020) != 0)
              {
                unsigned char *v18 = 1;
                __int16 v23 = *(_WORD *)v22;
              }
              v20 += RB::Transition::_effect_args[v23 & 0x7F] + 1;
            }
            while (v20 < v19);
          }
        }
      }
      unsigned int v25 = *a3;
      uint64_t v26 = *(void *)(*(void *)a2 + 24 * *a3);
      if (v26 != v8)
      {
        *(float32x2_t *)&double v27 = RB::DisplayList::Item::styled_bounds(*(RB::DisplayList::Item **)(*(void *)a2 + 24 * v25), 0);
        RB::Rect::Union((float32x2_t *)&v35, v27, v28, v29, v30, v31, v32);
        unsigned int v25 = *a3;
        uint64_t v8 = v26;
      }
      unsigned int v4 = v25 + 1;
      *a3 = v25 + 1;
      ++v9;
    }
    while (v25 + 1 < *(_DWORD *)(a2 + 8));
  }
  *(_DWORD *)a4 = v9;
  double result = *(double *)&v35;
  *(_OWORD *)(a4 + 8) = v35;
  return result;
}

uint64_t RB::lcs_diff<RB::DisplayList::EditAdaptor::Element,RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element*,unsigned int,RB::DisplayList::EditAdaptor::Element*,unsigned int)::$_0,RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element*,unsigned int,RB::DisplayList::EditAdaptor::Element*,unsigned int)::$_1>(uint64_t matrix_value, unsigned int **a2, uint64_t a3, unsigned int **a4, unsigned int *a5, uint64_t *a6, unsigned int *a7)
{
  int v97 = a6;
  int v93 = a5;
  uint64_t v8 = a3;
  uint64_t v9 = matrix_value;
  uint64_t v102 = *MEMORY[0x263EF8340];
  if (matrix_value >= a3) {
    uint64_t v10 = a3;
  }
  else {
    uint64_t v10 = matrix_value;
  }
  unsigned int v95 = a2;
  unsigned int v96 = a4;
  uint64_t v11 = 0;
  if (v10 >= 1)
  {
    long long v12 = a2;
    uint64_t v13 = a4;
    while (1)
    {
      int matrix_value = *v97;
      unsigned int v14 = *((_DWORD *)v12 + 4) + *((_DWORD *)v13 + 4);
      int v15 = (*(_DWORD *)(*(void *)(*v97 + 192) + 4 * (v14 >> 3)) >> (4 * (v14 & 7))) & 0xF;
      if (!v15)
      {
        int matrix_value = RB::DisplayList::EditAdaptor::make_matrix_value(matrix_value, (void *)v97[1], (uint64_t *)v12, (uint64_t *)v13);
        int v15 = matrix_value;
      }
      if (v15 == 1) {
        break;
      }
      ++v11;
      v13 += 3;
      v12 += 3;
      if (v10 == v11)
      {
        uint64_t v11 = v10;
        break;
      }
    }
  }
  uint64_t v16 = v8 + v9;
  uint64_t v17 = -v9;
  do
  {
    uint64_t v18 = v9;
    uint64_t v19 = v8;
    uint64_t v20 = v16;
    uint64_t v21 = v17;
    --v9;
    if (v11 >= v8 || v11 >= v18) {
      break;
    }
    --v8;
    int matrix_value = *v97;
    unsigned int v22 = LODWORD(v95[3 * v9 + 2]) + LODWORD(v96[3 * v19 - 1]);
    int v23 = (*(_DWORD *)(*(void *)(*v97 + 192) + 4 * (v22 >> 3)) >> (4 * (v22 & 7))) & 0xF;
    if (!v23)
    {
      int matrix_value = RB::DisplayList::EditAdaptor::make_matrix_value(matrix_value, (void *)v97[1], (uint64_t *)&v95[3 * v9], (uint64_t *)&v96[3 * v8]);
      int v23 = matrix_value;
    }
    uint64_t v16 = v20 - 2;
    uint64_t v17 = v21 + 1;
  }
  while (v23 != 1);
  if (v18 + v19 >= (uint64_t)v93) {
    uint64_t v24 = (uint64_t)v93;
  }
  else {
    uint64_t v24 = v18 + v19;
  }
  if (v18 == v11) {
    unsigned int v25 = (unsigned int *)(v18 + 1);
  }
  else {
    unsigned int v25 = (unsigned int *)v9;
  }
  if (v19 == v11)
  {
    if (v18 == v11)
    {
      char v26 = 1;
      return v26 & 1;
    }
  }
  else
  {
    uint64_t v9 = v18 + 1;
  }
  if (v24 < 1 || (v18 <= v19 ? (uint64_t v27 = v19) : (uint64_t v27 = v18), v27 >= 0x8000 || (((unint64_t)v27 >> 60) & 7) != 0))
  {
    char v26 = 0;
    return v26 & 1;
  }
  v94 = v25;
  size_t v29 = (16 * v27) | 8;
  if (v29 <= 0x1000)
  {
    MEMORY[0x270FA5388](matrix_value, a2);
    unint64_t v92 = (v29 + 15) & 0xFFFFFFFFFFFFFFF0;
    unsigned int v90 = &v79[-v92];
    bzero(&v79[-v92], v29);
    MEMORY[0x270FA5388](v30, v31);
    int v89 = &v79[-v92];
    bzero(&v79[-v92], v29);
    int v32 = 0;
    goto LABEL_39;
  }
  unsigned int v90 = malloc_type_malloc((16 * v27) | 8, 0x5560CE4DuLL);
  int v89 = malloc_type_malloc(v29, 0x14FC10C4uLL);
  if (v90)
  {
    int v32 = 1;
    if (v89)
    {
LABEL_39:
      uint64_t v83 = v24;
      int v80 = v32;
      unint64_t v81 = v29;
      RB::Heap::Heap((RB::Heap *)v98, v101, 1024, 0);
      int v33 = v90;
      *(void *)&v90[8 * v18] = v11;
      int v34 = v89;
      *(void *)&v89[8 * v18] = 0;
      long long v35 = v93;
      unsigned int v36 = v94;
      if ((uint64_t)v93 >= v20) {
        long long v35 = (unsigned int *)v20;
      }
      uint64_t v82 = v35;
      BOOL v84 = 1;
      uint64_t v37 = 1;
      int v38 = (unsigned int *)v9;
      while (1)
      {
        uint64_t v85 = v37;
        if ((uint64_t)v36 <= (uint64_t)v38) {
          break;
        }
        int v93 = v36;
LABEL_44:
        unsigned int v36 = (unsigned int *)((char *)v93 - 1);
        int v38 = (unsigned int *)((char *)v38 + 1);
        uint64_t v37 = v85 + 1;
        BOOL v84 = v85 < v83;
        if ((unsigned int *)v85 == v82)
        {
LABEL_98:
          RB::Heap::~Heap((RB::Heap *)v98);
          int v32 = v80;
          char v26 = v84;
          if (v81 <= 0x1000) {
            goto LABEL_103;
          }
          goto LABEL_102;
        }
      }
      uint64_t v88 = v37 + v18;
      unint64_t v92 = v18 - v37;
      int v93 = v36;
      uint64_t v86 = v37 + v18 - 1;
      uint64_t v87 = v18 - v37 + 1;
      uint64_t v39 = (uint64_t)v36 + v21;
      while (1)
      {
        unint64_t v40 = (v99 + 7) & 0xFFFFFFFFFFFFFFF8;
        if (v40 + 32 > v100) {
          unint64_t v40 = RB::Heap::alloc_slow(v98, 0x20uLL, 7);
        }
        else {
          unint64_t v99 = v40 + 32;
        }
        v94 = v36;
        if ((unsigned int *)v92 == v36) {
          break;
        }
        if ((unsigned int *)v88 == v36)
        {
          int v44 = 0;
          uint64_t v41 = v86;
          uint64_t v43 = v33[v86];
        }
        else
        {
          uint64_t v41 = (uint64_t)v36 + 1;
          uint64_t v42 = v33[(void)v36 + 1];
          uint64_t v45 = (uint64_t)v36 - 1;
          uint64_t v43 = v33[(void)v36 - 1];
          if (v42 >= v43) {
            goto LABEL_51;
          }
          int v44 = 0;
          uint64_t v41 = v45;
        }
LABEL_56:
        *(void *)unint64_t v40 = v34[v41];
        *(_DWORD *)(v40 + 8) = v44;
        unsigned int v46 = v94;
        uint64_t v47 = (char *)v94 + v43 - v18;
        *(void *)(v40 + 16) = v43 - 1;
        *(void *)(v40 + 24) = v47 - 1;
        v34[(void)v46] = v40;
        if (v43 < v18 && (uint64_t)v47 < v19)
        {
          uint64_t v91 = v38;
          int v49 = v97;
          int v50 = &(&v96[3 * v43])[3 * v39];
          size_t v51 = &v95[3 * v43];
          do
          {
            unsigned int v52 = *((_DWORD *)v51 + 4) + *((_DWORD *)v50 + 4);
            int v53 = (*(_DWORD *)(*(void *)(*v49 + 192) + 4 * (v52 >> 3)) >> (4 * (v52 & 7))) & 0xF;
            if (!v53) {
              int v53 = RB::DisplayList::EditAdaptor::make_matrix_value(*v49, (void *)v49[1], (uint64_t *)v51, (uint64_t *)v50);
            }
            if (v53 == 1) {
              break;
            }
            if (++v43 >= v18) {
              break;
            }
            v50 += 3;
            v51 += 3;
          }
          while (v43 + v39 < v19);
          uint64_t v47 = (char *)(v39 + v43);
          int v34 = v89;
          int v33 = v90;
          int v38 = v91;
        }
        v33[(void)v94] = v43;
        if (v18 == v43 && (char *)v19 == v47)
        {
          unsigned int v55 = (void *)v34[(void)v94];
          if (!v55) {
            goto LABEL_98;
          }
          unsigned int v56 = 0;
          do
          {
            unsigned int v57 = v55;
            unsigned int v55 = (void *)*v55;
            *unsigned int v57 = v56;
            unsigned int v56 = v57;
          }
          while (v55);
          int32x2_t v58 = (unsigned int **)(a7 + 2);
          int v93 = a7 + 12;
          v94 = a7 + 10;
          unsigned int v96 = (unsigned int **)(a7 + 18);
          int v97 = (uint64_t *)(a7 + 4);
          unsigned int v95 = (unsigned int **)(a7 + 16);
          while (1)
          {
            int v59 = *((_DWORD *)v57 + 2);
            if (v59 == 1) {
              uint64_t v60 = 2;
            }
            else {
              uint64_t v60 = 3;
            }
            unsigned int v61 = v57[v60];
            if (v59 == 1) {
              uint64_t v62 = 2;
            }
            else {
              uint64_t v62 = 4;
            }
            if (**(_DWORD **)&a7[v62] < v61)
            {
              uint64_t v63 = *((void *)a7 + 3);
              uint64_t v64 = *v58;
              unsigned int v65 = *(_DWORD *)*v97;
              do
              {
                RB::DisplayList::EditAdaptor::mix_elements(v63, *((void *)a7 + 4), (const RB::DisplayList::Item *)*a7, **((void **)a7 + 5) + 24 * *v64, **((void **)a7 + 6) + 24 * v65);
                **((unsigned char **)a7 + 7) = 1;
                uint64_t v64 = (unsigned int *)*((void *)a7 + 1);
                ++*v64;
                unsigned int v66 = (unsigned int *)*((void *)a7 + 2);
                unsigned int v65 = *v66 + 1;
                *unsigned int v66 = v65;
              }
              while (**(_DWORD **)&a7[v62] < v61);
            }
            if (v59 == 1)
            {
              int v67 = *v58;
              unsigned int v68 = **v58;
              size_t v69 = *v95;
              unsigned int v70 = **v95;
              if (v68 != v70)
              {
                unsigned int v71 = v94;
                int v72 = (uint64_t *)(a7 + 2);
                unint64_t v73 = v95;
LABEL_95:
                uint64_t v74 = **(void **)v71;
                uint64_t v75 = (long long *)(v74 + 24 * v68);
                uint64_t v76 = v74 + 24 * v70;
                long long v77 = *v75;
                *(void *)(v76 + 16) = *((void *)v75 + 2);
                *(_OWORD *)uint64_t v76 = v77;
                int v67 = (unsigned int *)*v72;
                unsigned int v68 = *v67;
                size_t v69 = *v73;
              }
            }
            else
            {
              int v67 = (unsigned int *)*v97;
              unsigned int v68 = *(_DWORD *)*v97;
              size_t v69 = *v96;
              unsigned int v70 = **v96;
              if (v68 != v70)
              {
                unsigned int v71 = v93;
                int v72 = v97;
                unint64_t v73 = v96;
                goto LABEL_95;
              }
            }
            *int v67 = v68 + 1;
            ++*v69;
            unsigned int v57 = (void *)*v57;
            if (!v57)
            {
              int v34 = v89;
              int v33 = v90;
              goto LABEL_98;
            }
          }
        }
        unsigned int v54 = v93;
        if (v18 == v43) {
          unsigned int v54 = (unsigned int *)((char *)v94 + 2);
        }
        int v93 = v54;
        if ((char *)v19 == v47) {
          int v38 = (unsigned int *)((char *)v94 - 2);
        }
        v39 += 2;
        unsigned int v36 = (unsigned int *)((char *)v94 + 2);
        if ((uint64_t)((char *)v94 + 2) > (uint64_t)v38) {
          goto LABEL_44;
        }
      }
      uint64_t v41 = v87;
      uint64_t v42 = v33[v87];
LABEL_51:
      uint64_t v43 = v42 + 1;
      int v44 = 1;
      goto LABEL_56;
    }
    char v26 = 0;
    int v34 = 0;
    int v33 = v90;
  }
  else
  {
    char v26 = 0;
    int v33 = 0;
    int v32 = 1;
    int v34 = v89;
  }
LABEL_102:
  int v78 = v32;
  free(v34);
  int v32 = v78;
LABEL_103:
  if (v32) {
    free(v33);
  }
  return v26 & 1;
}

void sub_2142031A8(_Unwind_Exception *a1)
{
  RB::Heap::~Heap((RB::Heap *)(v1 + 152));
  if (*(void *)(v1 + 16) > 0x1000uLL)
  {
    free(*(void **)(v1 + 80));
    free(*(void **)(v1 + 88));
  }
  _Unwind_Resume(a1);
}

uint64_t RB::DisplayList::EditAdaptor::mix_elements(uint64_t result, uint64_t a2, const RB::DisplayList::Item *a3, uint64_t a4, uint64_t a5)
{
  unsigned int v5 = *(_DWORD *)(a4 + 16) + *(_DWORD *)(a5 + 16);
  unsigned int v6 = (*(_DWORD *)(*(void *)(result + 192) + 4 * (v5 >> 3)) >> (4 * (v5 & 7))) & 0xF;
  if (v6 >= 2)
  {
    int v9 = (int)a3;
    uint64_t v11 = (char *)(a2 + 16);
    int v12 = *(_DWORD *)(a2 + 184);
    if (*(_DWORD *)(a2 + 188) < (v12 + 1))
    {
      RB::vector<RB::DisplayList::Interpolator::Op,4ul,unsigned int>::reserve_slow(v11, v12 + 1);
      int v12 = *(_DWORD *)(a2 + 184);
    }
    uint64_t v13 = *(char **)(a2 + 176);
    if (!v13) {
      uint64_t v13 = v11;
    }
    unsigned int v14 = &v13[40 * v12];
    *((void *)v14 + 1) = 0;
    *((void *)v14 + 2) = 0;
    *(void *)unsigned int v14 = 0xFFFFFFF000000000;
    *((_DWORD *)v14 + 6) = 0;
    *(void *)(v14 + 28) = 1;
    *((_DWORD *)v14 + 9) = 0;
    int v15 = *(_DWORD *)(a2 + 184);
    *(_DWORD *)(a2 + 184) = v15 + 1;
    uint64_t v16 = *(char **)(a2 + 176);
    if (!v16) {
      uint64_t v16 = v11;
    }
    uint64_t v17 = &v16[40 * v15];
    *(void *)uint64_t v17 = *(void *)v17 & 0xF00000000 | v6 | (16 * v9) | 0x1000000000;
    long long v18 = *(_OWORD *)(a4 + 8);
    *((void *)&v18 + 1) = *(void *)(a5 + 8);
    *(_OWORD *)(v17 + 8) = v18;
    uint64_t animation = (RB::Animation *)RB::DisplayList::find_animation(*(RB::DisplayList **)a4, *(const RB::DisplayList::Item **)a5, a3);
    RB::DisplayList::EditAdaptor::set_animation((int)animation, (unsigned char *)a2, v17, v20, animation, 0);
    *(_DWORD *)(a2 + 192) |= 1 << (*(_DWORD *)v17 & 0xF);
    return RB::DisplayList::Interpolator::Layer::merge_tail(a2);
  }
  return result;
}

void *RB::prefix_suffix_diff<RB::DisplayList::EditAdaptor::Element,RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element*,unsigned int,RB::DisplayList::EditAdaptor::Element*,unsigned int)::$_0,RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element*,unsigned int,RB::DisplayList::EditAdaptor::Element*,unsigned int)::$_2>(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, void *a6, int a7, int a8)
{
  int v9 = a6;
  unint64_t v12 = a3;
  unint64_t v14 = a1;
  if (a7 && (a1 >= a3 ? (unint64_t v15 = a3) : (unint64_t v15 = a1), v15))
  {
    unint64_t v16 = 0;
    uint64_t v17 = a2;
    uint64_t v18 = a4;
    while (1)
    {
      unsigned int v19 = *(_DWORD *)(v17 + 16) + *(_DWORD *)(v18 + 16);
      int matrix_value = (*(_DWORD *)(*(void *)(*(void *)a5 + 192) + 4 * (v19 >> 3)) >> (4 * (v19 & 7))) & 0xF;
      if (!matrix_value) {
        int matrix_value = RB::DisplayList::EditAdaptor::make_matrix_value(*(void *)a5, *(void **)(a5 + 8), (uint64_t *)v17, (uint64_t *)v18);
      }
      if (matrix_value == 1) {
        break;
      }
      ++v16;
      v18 += 24;
      v17 += 24;
      if (v15 == v16)
      {
        unint64_t v16 = v15;
        break;
      }
    }
    int v9 = a6;
    if (!a8) {
      goto LABEL_13;
    }
  }
  else
  {
    unint64_t v16 = 0;
    if (!a8)
    {
LABEL_13:
      int v21 = v12;
      int v22 = v14;
      goto LABEL_21;
    }
  }
  uint64_t v23 = a4 + 24 * v12 - 24;
  uint64_t v24 = a2 + 24 * v14 - 24;
  do
  {
    int v22 = v14;
    int v21 = v12;
    if (v12 <= v16 || v14 <= v16) {
      break;
    }
    unsigned int v25 = *(_DWORD *)(v24 + 16) + *(_DWORD *)(v23 + 16);
    int v26 = (*(_DWORD *)(*(void *)(*(void *)a5 + 192) + 4 * (v25 >> 3)) >> (4 * (v25 & 7))) & 0xF;
    if (!v26) {
      int v26 = RB::DisplayList::EditAdaptor::make_matrix_value(*(void *)a5, *(void **)(a5 + 8), (uint64_t *)v24, (uint64_t *)v23);
    }
    v23 -= 24;
    v24 -= 24;
    --v12;
    --v14;
  }
  while (v26 != 1);
LABEL_21:
  RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int)::$_2::operator()(v9, 1, v16, v22 - v16);
  return RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int)::$_2::operator()(v9, 0, v16, v21 - (int)v16);
}

void *RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int)::$_2::operator()(void *result, int a2, int a3, int a4)
{
  if (a4)
  {
    unsigned int v4 = (_DWORD **)(result + 1);
    uint64_t v5 = 1;
    if (a2)
    {
      uint64_t v5 = 0;
      unsigned int v6 = (_DWORD **)result;
    }
    else
    {
      unsigned int v6 = (_DWORD **)(result + 1);
    }
    int v7 = *(_DWORD *)result[v5];
    int v8 = a3 - v7;
    if (a3 == v7) {
      goto LABEL_20;
    }
    uint64_t v9 = result[2];
    unsigned int v10 = *(_DWORD *)(v9 + 1544);
    uint64_t v11 = (_DWORD *)*result;
    if (v10)
    {
      if (*(void *)(v9 + 1536)) {
        uint64_t v12 = *(void *)(v9 + 1536);
      }
      else {
        uint64_t v12 = result[2];
      }
      uint64_t v13 = v12 + 12 * (v10 - 1);
      int v16 = *(_DWORD *)(v13 + 8);
      unint64_t v14 = (_DWORD *)(v13 + 8);
      int v15 = v16;
      uint64_t v17 = *v4;
      if (v16 + *(_DWORD *)(v12 + 12 * (v10 - 1)) == *v11 && *(_DWORD *)(v12 + 12 * (v10 - 1) + 4) + v15 == *v17)
      {
        *unint64_t v14 = v15 + v8;
LABEL_19:
        *v11 += v8;
        *v17 += v8;
        *(_DWORD *)result[3] += v8;
LABEL_20:
        **v6 += a4;
        return result;
      }
    }
    else
    {
      uint64_t v17 = *v4;
    }
    unsigned int v18 = v10 + 1;
    if (*(_DWORD *)(v9 + 1548) < v10 + 1)
    {
      int v29 = a4;
      uint64_t v30 = result;
      uint64_t v26 = result[2];
      int32x4_t v28 = v6;
      int v25 = v8;
      uint64_t v27 = (_DWORD *)*result;
      uint64_t v24 = v17;
      RB::vector<RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int)::Mixed,128ul,unsigned int>::reserve_slow((void *)v9, v18);
      uint64_t v17 = v24;
      uint64_t v9 = v26;
      uint64_t v11 = v27;
      int v8 = v25;
      unsigned int v6 = v28;
      a4 = v29;
      double result = v30;
      unsigned int v10 = *(_DWORD *)(v26 + 1544);
      int v20 = (_DWORD *)*v30;
      unsigned int v19 = (_DWORD *)v30[1];
      unsigned int v18 = v10 + 1;
    }
    else
    {
      unsigned int v19 = v17;
      int v20 = (_DWORD *)*result;
    }
    uint64_t v21 = *(void *)(v9 + 1536);
    if (!v21) {
      uint64_t v21 = v9;
    }
    int v22 = (_DWORD *)(v21 + 12 * v10);
    int v23 = *v17;
    *int v22 = *v11;
    v22[1] = v23;
    v22[2] = v8;
    *(_DWORD *)(v9 + 1544) = v18;
    uint64_t v17 = v19;
    uint64_t v11 = v20;
    goto LABEL_19;
  }
  return result;
}

void RB::DisplayList::EditAdaptor::find_motion_projection(uint64_t a1, uint64_t a2, unsigned int *a3, void *a4, int a5, uint64_t a6, unsigned int a7, uint64_t a8)
{
  float32x2_t v85 = COERCE_FLOAT32X2_T((*(double (**)(void, void, uint64_t))(**(void **)a3 + 64))(*(void *)a3, a3[3], 1));
  uint32x2_t v13 = (uint32x2_t)vclez_f32(v12);
  if ((vpmax_u32(v13, v13).u32[0] & 0x80000000) == 0 && a7)
  {
    uint64_t v14 = a1;
    int v15 = a4;
    uint64_t v16 = 0;
    unint64_t v17 = 0;
    uint64_t v87 = a1 + 112;
    uint64_t v83 = a4;
    uint64_t v84 = a1 + 32;
    int32x2_t v18 = (int32x2_t)vadd_f32(v12, v85);
    float v19 = *(float *)&v18.i32[1];
    int32x2_t v81 = v18;
    int8x8_t v20 = (int8x8_t)vzip2_s32(v18, (int32x2_t)v85);
    uint64_t v21 = (unsigned int *)(a6 + 12);
    unsigned int v80 = -1;
    int v22 = 0x7FFFFFFF;
    int32x2_t v23 = vdup_n_s32(0x7FC00000u);
    float32x2_t v24 = 0;
    float32x2_t v25 = 0;
    uint64_t v82 = v14;
    do
    {
      uint64_t v26 = *v15 & 0xFLL;
      if (v26)
      {
        uint64_t v27 = v21 + 1;
        uint64_t v28 = *(void *)(v14 + 176);
        BOOL v29 = v28 == 0;
        uint64_t v30 = v87;
      }
      else
      {
        uint64_t v27 = (unsigned int *)(a6 + 40 * v17 + 8);
        uint64_t v28 = *(void *)(v14 + 96);
        BOOL v29 = v28 == 0;
        uint64_t v30 = v84;
      }
      if (v29) {
        uint64_t v28 = v30;
      }
      uint64_t v31 = *(void *)(v28 + 8 * *v27);
      int v32 = v21 + 2;
      if (!v26) {
        int v32 = v21;
      }
      uint64_t v33 = *v32;
      unint64_t v34 = *(unsigned int *)(a8 + 8);
      if (v17 >= v34)
      {
        if (*(_DWORD *)(a8 + 12) < (v34 + 1))
        {
          RB::vector<RB::BinAllocator::Shelf,0ul,unsigned int>::reserve_slow(a8, v34 + 1);
          uint64_t v14 = v82;
          int v15 = v83;
          unint64_t v34 = *(unsigned int *)(a8 + 8);
        }
        long long v35 = (void *)(*(void *)a8 + 32 * v34);
        void *v35 = 0;
        v35[1] = v23;
        v35[2] = 0;
        v35[3] = v23;
        ++*(_DWORD *)(a8 + 8);
        uint64_t v26 = *v15 & 0xFLL;
      }
      if (v26) {
        unsigned int v36 = (float32x2_t *)(*(void *)a8 + v16 + 16);
      }
      else {
        unsigned int v36 = (float32x2_t *)(*(void *)a8 + v16);
      }
      float32x2_t v37 = v36[1];
      uint32x2_t v38 = (uint32x2_t)vmvn_s8(vorr_s8((int8x8_t)vcltz_f32(v37), (int8x8_t)vcgez_f32(v37)));
      if ((vpmax_u32(v38, v38).u32[0] & 0x80000000) != 0)
      {
        double v39 = (*(double (**)(uint64_t, uint64_t, void))(*(void *)v31 + 64))(v31, v33, *(void *)(v21 - 3) >> 36);
        uint64_t v14 = v82;
        int v15 = v83;
        *(double *)unsigned int v36 = v39;
        v36[1] = v37;
      }
      uint32x2_t v40 = (uint32x2_t)vclez_f32(v37);
      if ((vpmax_u32(v40, v40).u32[0] & 0x80000000) == 0)
      {
        switch(a5)
        {
          case 0:
            int32x2_t v41 = (int32x2_t)*v36;
            unsigned __int32 v42 = vsub_f32((float32x2_t)v81, vadd_f32(v37, *v36)).u32[0];
            goto LABEL_24;
          case 1:
            int32x2_t v41 = (int32x2_t)*v36;
            unsigned __int32 v42 = vsub_f32(*v36, v85).u32[0];
LABEL_24:
            if (*(float *)&v42 < 0.0 || *(float *)&v42 >= (float)v22) {
              break;
            }
            int32x2_t v44 = (int32x2_t)vadd_f32((float32x2_t)v41, v37);
            int32x2_t v45 = (int32x2_t)vbsl_s8((int8x8_t)vcgt_f32((float32x2_t)vzip2_s32(v81, v41), (float32x2_t)vzip2_s32(v44, (int32x2_t)v85)), (int8x8_t)vzip2_s32(v44, v41), v20);
            if ((vmvn_s8((int8x8_t)vcge_f32((float32x2_t)vdup_lane_s32(v45, 1), (float32x2_t)v45)).u32[0] & 1) == 0) {
              break;
            }
            int v22 = (int)*(float *)&v42;
            float32x2_t v25 = (float32x2_t)v41;
            goto LABEL_45;
          case 2:
            float v46 = v19 - (float)(v37.f32[1] + v36->f32[1]);
            goto LABEL_33;
          case 3:
            float v46 = v36->f32[1] - v85.f32[1];
LABEL_33:
            if (v46 < 0.0 || v46 >= (float)v22) {
              break;
            }
            float32x2_t v48 = vadd_f32(*v36, v37);
            if ((vcgt_f32((float32x2_t)v81, v48).u8[0] & 1) == 0) {
              v48.f32[0] = *(float *)v81.i32;
            }
            if (vcgt_f32(*v36, v85).u32[0]) {
              LODWORD(v49) = *(float32x2_t *)v36->f32;
            }
            else {
              float v49 = v85.f32[0];
            }
            if (v48.f32[0] <= v49) {
              break;
            }
            int v22 = (int)v46;
            float32x2_t v25 = *v36;
LABEL_45:
            float32x2_t v24 = v37;
            unsigned int v80 = v17;
            break;
          case 4:
          case 5:
            return;
          default:
            break;
        }
      }
      if (!v22) {
        break;
      }
      ++v17;
      v21 += 10;
      v16 += 32;
    }
    while (v17 < a7);
    if (v80 < a7)
    {
      uint64_t v50 = *v15;
      uint64_t v51 = *(void *)a8;
      if ((*v15 & 0xFLL) != 0)
      {
        uint64_t v52 = a6 + 40 * v80;
        uint64_t v53 = *(void *)(v14 + 96);
        if (!v53) {
          uint64_t v53 = v84;
        }
        unsigned int v54 = (void *)(v53 + 8 * *(unsigned int *)(v52 + 8));
        unsigned int v55 = (unsigned int *)(v52 + 12);
        uint64_t v56 = v51 + 32 * v80;
      }
      else
      {
        uint64_t v57 = a6 + 40 * v80;
        uint64_t v58 = *(void *)(v14 + 176);
        if (!v58) {
          uint64_t v58 = v87;
        }
        unsigned int v54 = (void *)(v58 + 8 * *(unsigned int *)(v57 + 16));
        unsigned int v55 = (unsigned int *)(v57 + 20);
        uint64_t v56 = v51 + 32 * v80 + 16;
      }
      float32x2_t v59 = *(float32x2_t *)(v56 + 8);
      uint32x2_t v60 = (uint32x2_t)vmvn_s8(vorr_s8((int8x8_t)vcltz_f32(v59), (int8x8_t)vcgez_f32(v59)));
      if ((vpmax_u32(v60, v60).u32[0] & 0x80000000) != 0)
      {
        double v61 = (*(double (**)(void, void, void))(*(void *)*v54 + 64))(*v54, *v55, *(void *)(a6 + 40 * v80) >> 36);
        int v15 = v83;
        *(double *)uint64_t v56 = v61;
        *(float32x2_t *)(v56 + 8) = v59;
        uint64_t v50 = *v83;
      }
      else
      {
        double v61 = *(double *)v56;
      }
      int v62 = v50 & 0xF;
      if (v62 == 8 || v62 == 1)
      {
        float32x2_t v63 = v59;
        float32x2_t v64 = *(float32x2_t *)&v61;
      }
      else
      {
        float32x2_t v63 = v24;
        float32x2_t v64 = v25;
        float32x2_t v24 = v59;
        float32x2_t v25 = *(float32x2_t *)&v61;
      }
      unsigned int v65 = *(_DWORD *)(a2 + 240);
      if (v65 < 2) {
        goto LABEL_68;
      }
      uint64_t v66 = *(void *)(a2 + 232);
      if (!v66) {
        uint64_t v66 = a2 + 200;
      }
      uint32x2_t v67 = (uint32x2_t)vand_s8((int8x8_t)vceq_f32(*(float32x2_t *)(v66 + 16 * (v65 - 2) + 8), v63), (int8x8_t)vceq_f32(*(float32x2_t *)(v66 + 16 * (v65 - 2)), v64));
      if ((vpmin_u32(v67, v67).u32[0] & 0x80000000) != 0
        && (unsigned int v68 = v65 - 1,
            uint32x2_t v69 = (uint32x2_t)vand_s8((int8x8_t)vceq_f32(*(float32x2_t *)(v66 + 16 * v68 + 8), v24), (int8x8_t)vceq_f32(*(float32x2_t *)(v66 + 16 * v68), v25)), (vpmin_u32(v69, v69).u32[0] & 0x80000000) != 0))
      {
        v65 -= 2;
      }
      else
      {
LABEL_68:
        unsigned int v68 = v65 + 1;
        unsigned int v70 = *(_DWORD *)(a2 + 240);
        if (*(_DWORD *)(a2 + 244) < v65 + 1)
        {
          RB::vector<RB::Rect,2ul,unsigned int>::reserve_slow((void *)(a2 + 200), v65 + 1);
          int v15 = v83;
          unsigned int v70 = *(_DWORD *)(a2 + 240);
        }
        uint64_t v71 = *(void *)(a2 + 232);
        if (!v71) {
          uint64_t v71 = a2 + 200;
        }
        int v72 = (float32x2_t *)(v71 + 16 * v70);
        *int v72 = v64;
        v72[1] = v63;
        int v73 = *(_DWORD *)(a2 + 240);
        unsigned int v74 = *(_DWORD *)(a2 + 244);
        unsigned int v75 = v73 + 1;
        *(_DWORD *)(a2 + 240) = v73 + 1;
        if (v74 < v73 + 2)
        {
          RB::vector<RB::Rect,2ul,unsigned int>::reserve_slow((void *)(a2 + 200), v73 + 2);
          int v15 = v83;
          unsigned int v75 = *(_DWORD *)(a2 + 240);
        }
        uint64_t v76 = *(void *)(a2 + 232);
        if (!v76) {
          uint64_t v76 = a2 + 200;
        }
        long long v77 = (float32x2_t *)(v76 + 16 * v75);
        *long long v77 = v25;
        v77[1] = v24;
        ++*(_DWORD *)(a2 + 240);
      }
      *((_DWORD *)v15 + 6) = v65;
      *((_DWORD *)v15 + 7) = v68;
    }
  }
}

uint64_t RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int)::$_5::operator()(uint64_t a1, unsigned int a2, unsigned int *a3, unsigned int a4, float a5, float a6)
{
  if (a4 >= 4)
  {
    if (a4 - 4 >= 2)
    {
      float v14 = 0.0;
    }
    else
    {
      int v15 = *(uint64_t **)(*(void *)a3 + 32);
      unsigned int v16 = a2;
      if (v15)
      {
        unint64_t v17 = RB::DisplayList::Metadata::text_identity(v15);
        unsigned int v16 = a2;
        if (v17)
        {
          unsigned int v18 = *(_DWORD *)v17;
          unsigned int v16 = a2;
          if (*(_DWORD *)v17 >= 4u)
          {
            unsigned int v19 = v18 >> 3;
            unsigned int v20 = a3[3];
            unsigned int v21 = (v18 >> 2) - 1;
            if (v21 >= v20) {
              unsigned int v21 = a3[3];
            }
            if (v20 != -1) {
              unsigned int v19 = v21;
            }
            unsigned int v16 = *((_DWORD *)v17 + v19 + 1);
          }
        }
      }
      if (a4 == 5) {
        float v14 = -(float)v16;
      }
      else {
        float v14 = (float)v16;
      }
    }
  }
  else
  {
    uint64_t v12 = (*(uint64_t (**)(void, void))(**(void **)a3 + 56))(*(void *)a3, a3[3]);
    if (!v13) {
      return 0;
    }
    if (a4)
    {
      if (a4 == 3)
      {
        float v14 = -*((float *)&v12 + 1);
      }
      else if (a4 == 1)
      {
        LODWORD(v14) = v12 ^ 0x80000000;
      }
      else
      {
        float v14 = *((float *)&v12 + 1);
      }
    }
    else
    {
      float v14 = *(float *)&v12;
    }
  }
  unsigned int v23 = *(_DWORD *)(a1 + 136);
  if (*(_DWORD *)(a1 + 140) < v23 + 1)
  {
    RB::vector<RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int)::SequenceElement,8ul,unsigned int>::reserve_slow((void *)a1, v23 + 1);
    unsigned int v23 = *(_DWORD *)(a1 + 136);
  }
  uint64_t v24 = *(void *)(a1 + 128);
  if (!v24) {
    uint64_t v24 = a1;
  }
  uint64_t v25 = v24 + 16 * v23;
  *(_DWORD *)uint64_t v25 = a2;
  *(float *)(v25 + 4) = v14;
  *(float *)(v25 + 8) = a5;
  *(float *)(v25 + 12) = a6;
  ++*(_DWORD *)(a1 + 136);
  return 1;
}

uint64_t RB::DisplayList::EditAdaptor::set_animation(int a1, unsigned char *a2, _DWORD *a3, int a4, RB::Animation *a5, uint64_t a6)
{
  unsigned int v8 = *a3 & 0xF;
  BOOL v9 = v8 > 8;
  int v10 = (1 << v8) & 0x130;
  if (v9 || v10 == 0)
  {
    if (a6)
    {
      if (*(_DWORD *)(a6 + 88)) {
        char v13 = (const RB::Animation *)(a6 + 56);
      }
      else {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
    float v14 = *(unsigned int **)a2;
    if ((unint64_t)a5 | (unint64_t)v13) {
      uint64_t result = RB::DisplayList::Interpolator::Contents::intern_animation((RB::DisplayList::Interpolator::Contents *)v14, a5, v13);
    }
    else {
      uint64_t result = v14[4];
    }
  }
  else
  {
    uint64_t result = 0xFFFFFFFFLL;
  }
  a3[8] = result;
  if (result != *(_DWORD *)(*(void *)a2 + 20)) {
    a2[251] = 1;
  }
  return result;
}

void RB::DisplayList::make_interpolator(RB::DisplayList *this, RB::DisplayList::Interpolator::Layer *a2, const RB::DisplayList::Item *a3, const RB::DisplayList::Item *a4)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)this;
  if (!*(void *)this) {
    RB::precondition_failure((RB *)"missing contents", (const char *)a2, a3, a4);
  }
  int v8 = *(_DWORD *)(v4 + 72);
  *(_DWORD *)(v4 + 72) = 0;
  RB::DisplayList::Interpolator::Layer::clear(this);
  unint64_t v9 = *(void *)(v4 + 24);
  if (v9 < 8)
  {
    *(void *)(v4 + 24) = v9 + 1;
    RB::DisplayList::EditAdaptor::EditAdaptor((RB::DisplayList::EditAdaptor *)v19, (RB::Transition ***)this, a2, a3);
    RB::DisplayList::EditAdaptor::finalize((RB::DisplayList::EditAdaptor *)v19, (uint64_t **)this);
    char v10 = v25;
    *((unsigned char *)this + 250) |= v25 & 1;
    *((unsigned char *)this + 249) = (*((unsigned __int8 *)this + 249) | v24) != 0;
    *((_DWORD *)this + 2) = *(_DWORD *)(v4 + 72);
    if ((v10 & 2) != 0)
    {
      if (*((unsigned char *)this + 251))
      {
        uint64_t v11 = (char *)this + 16;
        if (*((void *)this + 22)) {
          uint64_t v11 = (char *)*((void *)this + 22);
        }
        uint64_t v12 = *((unsigned int *)this + 46);
        if (v12)
        {
          uint64_t v13 = 40 * v12;
          float v14 = (float *)(v11 + 36);
          do
          {
            float v15 = RB::DisplayList::Interpolator::Contents::animation_max_duration(*(RB::DisplayList::Interpolator::Contents **)this, *((_DWORD *)v14 - 1));
            float v16 = *v14;
            v14 += 10;
            float v17 = v16 + v15;
            if (*((float *)this + 2) >= v17) {
              float v17 = *((float *)this + 2);
            }
            *((float *)this + 2) = v17;
            v13 -= 40;
          }
          while (v13);
        }
      }
      else
      {
        float v18 = RB::DisplayList::Interpolator::Contents::animation_max_duration((RB::DisplayList::Interpolator::Contents *)v4, *(_DWORD *)(v4 + 20));
        if (*((float *)this + 2) >= v18) {
          float v18 = *((float *)this + 2);
        }
        *((float *)this + 2) = v18;
      }
    }
    *(_DWORD *)(v4 + 72) = v8;
    --*(void *)(v4 + 24);
    if (v23) {
      free(v23);
    }
    if (v22) {
      free(v22);
    }
    if (v21) {
      free(v21);
    }
    if (v20) {
      free(v20);
    }
    if (v19[0]) {
      free(v19[0]);
    }
  }
  else
  {
    RB::DisplayList::Interpolator::Layer::failed((uint64_t)this);
  }
}

void sub_214204098(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  RB::DisplayList::EditAdaptor::~EditAdaptor((RB::DisplayList::EditAdaptor *)va);
  _Unwind_Resume(a1);
}

void RB::DisplayList::EditAdaptor::~EditAdaptor(RB::DisplayList::EditAdaptor *this)
{
  int v2 = (void *)*((void *)this + 24);
  if (v2) {
    free(v2);
  }
  unsigned int v3 = (void *)*((void *)this + 22);
  if (v3) {
    free(v3);
  }
  uint64_t v4 = (void *)*((void *)this + 12);
  if (v4) {
    free(v4);
  }
  uint64_t v5 = (void *)*((void *)this + 2);
  if (v5) {
    free(v5);
  }
  if (*(void *)this) {
    free(*(void **)this);
  }
}

void RB::DisplayList::make_interpolator(RB::DisplayList *this, RB::DisplayList::Interpolator::Layer **a2, const RB::DisplayList::Item **a3, const RB::DisplayList::Contents *a4)
{
  {
    uint64_t v15 = RB::debug_int((RB *)"RB_PRINT_TREE", v14);
    unsigned int v16 = (v15 >> 2) & 1;
    if ((v15 & 0xFF00000000) == 0) {
      LOBYTE(v16) = 0;
    }
    RB::DisplayList::make_interpolator(RB::DisplayList::Interpolator::Layer &,RB::DisplayList::Contents const*,RB::DisplayList::Contents const*)::print_tree = v16;
  }
  int v7 = (FILE **)MEMORY[0x263EF8348];
  if (!RB::DisplayList::make_interpolator(RB::DisplayList::Interpolator::Layer &,RB::DisplayList::Contents const*,RB::DisplayList::Contents const*)::print_tree) {
    goto LABEL_11;
  }
  memset(__p, 0, 41);
  RB::SexpString::push(__p, "make-interpolator");
  RB::SexpString::push(__p, "from");
  if (a2) {
    RB::DisplayList::Contents::print((RB::DisplayList::Contents *)a2, __p);
  }
  RB::SexpString::pop(__p);
  RB::SexpString::push(__p, "to");
  if (a3) {
    RB::DisplayList::Contents::print((RB::DisplayList::Contents *)a3, __p);
  }
  RB::SexpString::pop(__p);
  RB::SexpString::pop(__p);
  RB::SexpString::newline(__p);
  int v8 = (__p[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
     ? __p
     : (std::string *)__p[0].__r_.__value_.__r.__words[0];
  fputs((const char *)v8, *v7);
  if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p[0].__r_.__value_.__l.__data_);
    if (a2)
    {
LABEL_12:
      if (!*((unsigned char *)a2 + 400)) {
        goto LABEL_18;
      }
    }
  }
  else
  {
LABEL_11:
    if (a2) {
      goto LABEL_12;
    }
  }
  if (!a3 || *((unsigned char *)a3 + 400))
  {
    if (a2)
    {
      unint64_t v9 = a2[40];
      if (a3)
      {
LABEL_17:
        char v10 = a3[40];
LABEL_23:
        RB::DisplayList::make_interpolator(this, v9, v10, a4);
        goto LABEL_24;
      }
    }
    else
    {
      unint64_t v9 = 0;
      if (a3) {
        goto LABEL_17;
      }
    }
    char v10 = 0;
    goto LABEL_23;
  }
LABEL_18:
  RB::DisplayList::Interpolator::Layer::failed((uint64_t)this);
LABEL_24:
  {
    unsigned int v18 = (unsigned __int16)RB::debug_BOOL((RB *)"RB_PRINT_INTERPOLATORS", v17);
    if (v18 <= 0x100) {
      LOBYTE(v18) = 0;
    }
    RB::DisplayList::make_interpolator(RB::DisplayList::Interpolator::Layer &,RB::DisplayList::Contents const*,RB::DisplayList::Contents const*)::print_interpolators = v18 != 0;
  }
  if (RB::DisplayList::make_interpolator(RB::DisplayList::Interpolator::Layer &,RB::DisplayList::Contents const*,RB::DisplayList::Contents const*)::print_interpolators)
  {
    memset(__p, 0, 41);
    RB::SexpString::push(__p, "interpolator");
    RB::DisplayList::Interpolator::Layer::print(this, __p);
    uint64_t v11 = *(void *)this + 48;
    while (1)
    {
      uint64_t v11 = *(void *)v11;
      if (!v11) {
        break;
      }
      RB::SexpString::push(__p, "layer");
      RB::SexpString::printf(__p, 0, "#:ids (%d . %d)", *(_DWORD *)(v11 + 16), *(_DWORD *)(v11 + 20));
      uint64_t v12 = *(RB::DisplayList::Interpolator::Layer **)(v11 + 24);
      if (v12) {
        RB::DisplayList::Interpolator::Layer::print(v12, __p);
      }
      RB::SexpString::pop(__p);
    }
    RB::SexpString::pop(__p);
    RB::SexpString::newline(__p);
    uint64_t v13 = (__p[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
        ? __p
        : (std::string *)__p[0].__r_.__value_.__r.__words[0];
    fputs((const char *)v13, *v7);
    if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p[0].__r_.__value_.__l.__data_);
    }
  }
}

void sub_2142043E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
}

void *RB::vector<RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int)::Mixed,128ul,unsigned int>::reserve_slow(void *__dst, unsigned int a2)
{
  if (*((_DWORD *)__dst + 387) + (*((_DWORD *)__dst + 387) >> 1) <= a2) {
    unsigned int v3 = a2;
  }
  else {
    unsigned int v3 = *((_DWORD *)__dst + 387) + (*((_DWORD *)__dst + 387) >> 1);
  }
  uint64_t result = RB::details::realloc_vector<unsigned int,12ul>(*((void **)__dst + 192), __dst, 0x80u, (_DWORD *)__dst + 387, v3);
  *((void *)__dst + 192) = result;
  return result;
}

void *RB::vector<RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int)::SequenceElement,8ul,unsigned int>::reserve_slow(void *__dst, unsigned int a2)
{
  if (*((_DWORD *)__dst + 35) + (*((_DWORD *)__dst + 35) >> 1) <= a2) {
    unsigned int v3 = a2;
  }
  else {
    unsigned int v3 = *((_DWORD *)__dst + 35) + (*((_DWORD *)__dst + 35) >> 1);
  }
  uint64_t result = RB::details::realloc_vector<unsigned int,16ul>(*((void **)__dst + 16), __dst, 8u, (_DWORD *)__dst + 35, v3);
  *((void *)__dst + 16) = result;
  return result;
}

void std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int)::SequenceElement *,false>(unint64_t a1, float *a2, uint64_t a3, char a4)
{
  while (2)
  {
    char v10 = (float *)a1;
    while (1)
    {
      while (1)
      {
        while (1)
        {
          a1 = (unint64_t)v10;
          uint64_t v11 = (char *)a2 - (char *)v10;
          unint64_t v12 = ((char *)a2 - (char *)v10) >> 4;
          if (v5 || !v4)
          {
            switch(v12)
            {
              case 0uLL:
              case 1uLL:
                return;
              case 2uLL:
                if (*(a2 - 3) < v10[1])
                {
                  long long v93 = *(_OWORD *)v10;
                  *(_OWORD *)char v10 = *((_OWORD *)a2 - 1);
                  *((_OWORD *)a2 - 1) = v93;
                }
                break;
              case 3uLL:
                std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int)::SequenceElement *>(v10, v10 + 4, a2 - 4);
                break;
              case 4uLL:
                std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int)::SequenceElement *>(v10, (uint64_t)(v10 + 4), (uint64_t)(v10 + 8), (uint64_t)(a2 - 4));
                break;
              case 5uLL:
                int32x2_t v41 = (long long *)(v10 + 4);
                unsigned __int32 v42 = (long long *)(v10 + 8);
                uint64_t v43 = (long long *)(v10 + 12);
                std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int)::SequenceElement *>(v10, (uint64_t)(v10 + 4), (uint64_t)(v10 + 8), (uint64_t)(v10 + 12));
                if (*(a2 - 3) < v10[13])
                {
                  long long v44 = *v43;
                  *uint64_t v43 = *((_OWORD *)a2 - 1);
                  *((_OWORD *)a2 - 1) = v44;
                  if (v10[13] < v10[9])
                  {
                    long long v45 = *v42;
                    *unsigned __int32 v42 = *v43;
                    *uint64_t v43 = v45;
                    if (v10[9] < v10[5])
                    {
                      long long v46 = *v41;
                      *int32x2_t v41 = *v42;
                      *unsigned __int32 v42 = v46;
                      if (v10[5] < v10[1])
                      {
                        long long v94 = *(_OWORD *)v10;
                        *(_OWORD *)char v10 = *v41;
                        *int32x2_t v41 = v94;
                      }
                    }
                  }
                }
                break;
              default:
                JUMPOUT(0);
            }
            return;
          }
          if (v11 <= 383)
          {
            uint64_t v47 = v10 + 4;
            BOOL v49 = v10 == a2 || v47 == a2;
            if (a4)
            {
              if (!v49)
              {
                uint64_t v50 = 0;
                uint64_t v51 = v10;
                do
                {
                  uint64_t v52 = v47;
                  float v53 = v51[5];
                  if (v53 < v51[1])
                  {
                    int v54 = *(_DWORD *)v47;
                    uint64_t v55 = *((void *)v51 + 3);
                    uint64_t v56 = v50;
                    while (1)
                    {
                      *(_OWORD *)((char *)v10 + v56 + 16) = *(_OWORD *)((char *)v10 + v56);
                      if (!v56) {
                        break;
                      }
                      float v57 = *(float *)((char *)v10 + v56 - 12);
                      v56 -= 16;
                      if (v53 >= v57)
                      {
                        uint64_t v58 = (uint64_t)v10 + v56 + 16;
                        goto LABEL_84;
                      }
                    }
                    uint64_t v58 = (uint64_t)v10;
LABEL_84:
                    *(_DWORD *)uint64_t v58 = v54;
                    *(float *)(v58 + 4) = v53;
                    *(void *)(v58 + 8) = v55;
                  }
                  uint64_t v47 = v52 + 4;
                  v50 += 16;
                  uint64_t v51 = v52;
                }
                while (v52 + 4 != a2);
              }
            }
            else if (!v49)
            {
              do
              {
                uint64_t v84 = v47;
                float v85 = *(float *)(a1 + 20);
                if (v85 < *(float *)(a1 + 4))
                {
                  int v86 = *(_DWORD *)v47;
                  uint64_t v87 = *(void *)(a1 + 24);
                  uint64_t v88 = v84;
                  do
                  {
                    *(_OWORD *)uint64_t v88 = *((_OWORD *)v88 - 1);
                    float v89 = *(v88 - 7);
                    v88 -= 4;
                  }
                  while (v85 < v89);
                  *(_DWORD *)uint64_t v88 = v86;
                  v88[1] = v85;
                  *((void *)v88 + 1) = v87;
                }
                uint64_t v47 = v84 + 4;
                a1 = (unint64_t)v84;
              }
              while (v84 + 4 != a2);
            }
            return;
          }
          if (!a3)
          {
            if (v10 != a2)
            {
              int64_t v59 = (v12 - 2) >> 1;
              int64_t v60 = v59;
              do
              {
                int64_t v61 = v60;
                if (v59 >= v60)
                {
                  uint64_t v62 = (2 * v60) | 1;
                  float32x2_t v63 = &v10[4 * v62];
                  if (2 * v61 + 2 < (uint64_t)v12 && v63[1] < v63[5])
                  {
                    v63 += 4;
                    uint64_t v62 = 2 * v61 + 2;
                  }
                  float v64 = v10[4 * v61 + 1];
                  if (v63[1] >= v64)
                  {
                    unsigned int v65 = &v10[4 * v61];
                    int v66 = *(_DWORD *)v65;
                    uint64_t v67 = *((void *)v65 + 1);
                    do
                    {
                      unsigned int v68 = v65;
                      unsigned int v65 = v63;
                      *(_OWORD *)unsigned int v68 = *(_OWORD *)v63;
                      if (v59 < v62) {
                        break;
                      }
                      uint64_t v69 = 2 * v62;
                      uint64_t v62 = (2 * v62) | 1;
                      float32x2_t v63 = &v10[4 * v62];
                      uint64_t v70 = v69 + 2;
                      if (v70 < (uint64_t)v12 && v63[1] < v63[5])
                      {
                        v63 += 4;
                        uint64_t v62 = v70;
                      }
                    }
                    while (v63[1] >= v64);
                    *(_DWORD *)unsigned int v65 = v66;
                    v65[1] = v64;
                    *((void *)v65 + 1) = v67;
                  }
                }
                int64_t v60 = v61 - 1;
              }
              while (v61);
              uint64_t v71 = (unint64_t)v11 >> 4;
              do
              {
                uint64_t v72 = 0;
                long long v95 = *(_OWORD *)v10;
                int v73 = v10;
                do
                {
                  unsigned int v74 = v73;
                  v73 += 4 * v72 + 4;
                  uint64_t v75 = 2 * v72;
                  uint64_t v72 = (2 * v72) | 1;
                  uint64_t v76 = v75 + 2;
                  if (v76 < v71 && v73[1] < v73[5])
                  {
                    v73 += 4;
                    uint64_t v72 = v76;
                  }
                  *(_OWORD *)unsigned int v74 = *(_OWORD *)v73;
                }
                while (v72 <= (uint64_t)((unint64_t)(v71 - 2) >> 1));
                a2 -= 4;
                if (v73 == a2)
                {
                  *(_OWORD *)int v73 = v95;
                }
                else
                {
                  *(_OWORD *)int v73 = *(_OWORD *)a2;
                  *(_OWORD *)a2 = v95;
                  uint64_t v77 = (char *)v73 - (char *)v10 + 16;
                  if (v77 >= 17)
                  {
                    unint64_t v78 = (((unint64_t)v77 >> 4) - 2) >> 1;
                    float v79 = v73[1];
                    if (v10[4 * v78 + 1] < v79)
                    {
                      int v80 = *(_DWORD *)v73;
                      uint64_t v81 = *((void *)v73 + 1);
                      do
                      {
                        uint64_t v82 = v73;
                        int v73 = &v10[4 * v78];
                        *(_OWORD *)uint64_t v82 = *(_OWORD *)v73;
                        if (!v78) {
                          break;
                        }
                        unint64_t v78 = (v78 - 1) >> 1;
                      }
                      while (v10[4 * v78 + 1] < v79);
                      *(_DWORD *)int v73 = v80;
                      v73[1] = v79;
                      *((void *)v73 + 1) = v81;
                    }
                  }
                }
              }
              while (v71-- > 2);
            }
            return;
          }
          unint64_t v13 = v12 >> 1;
          float v14 = &v10[4 * (v12 >> 1)];
          if ((unint64_t)v11 >= 0x801)
          {
            std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int)::SequenceElement *>((float *)a1, (float *)(a1 + 16 * (v12 >> 1)), a2 - 4);
            std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int)::SequenceElement *>((float *)(a1 + 16), v14 - 4, a2 - 8);
            std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int)::SequenceElement *>((float *)(a1 + 32), (float *)(a1 + 16 + 16 * v13), a2 - 12);
            std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int)::SequenceElement *>(v14 - 4, v14, (float *)(a1 + 16 + 16 * v13));
            long long v90 = *(_OWORD *)a1;
            *(_OWORD *)a1 = *(_OWORD *)v14;
            *(_OWORD *)float v14 = v90;
          }
          else
          {
            std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int)::SequenceElement *>((float *)(a1 + 16 * (v12 >> 1)), (float *)a1, a2 - 4);
          }
          --a3;
          if (a4) {
            break;
          }
          float v15 = *(float *)(a1 + 4);
          if (*(float *)(a1 - 12) < v15) {
            goto LABEL_12;
          }
          if (v15 >= *(a2 - 3))
          {
            int v32 = (float *)(a1 + 16);
            do
            {
              char v10 = v32;
              if (v32 >= a2) {
                break;
              }
              float v33 = v32[1];
              v32 += 4;
            }
            while (v15 >= v33);
          }
          else
          {
            unint64_t v30 = a1;
            do
            {
              char v10 = (float *)(v30 + 16);
              float v31 = *(float *)(v30 + 20);
              v30 += 16;
            }
            while (v15 >= v31);
          }
          unint64_t v34 = a2;
          if (v10 < a2)
          {
            long long v35 = a2;
            do
            {
              unint64_t v34 = v35 - 4;
              float v36 = *(v35 - 3);
              v35 -= 4;
            }
            while (v15 < v36);
          }
          float v37 = *(float *)a1;
          uint64_t v38 = *(void *)(a1 + 8);
          while (v10 < v34)
          {
            long long v92 = *(_OWORD *)v10;
            *(_OWORD *)char v10 = *(_OWORD *)v34;
            *(_OWORD *)unint64_t v34 = v92;
            do
            {
              float v39 = v10[5];
              v10 += 4;
            }
            while (v15 >= v39);
            do
            {
              float v40 = *(v34 - 3);
              v34 -= 4;
            }
            while (v15 < v40);
          }
          BOOL v4 = (unint64_t)(v10 - 4) >= a1;
          BOOL v5 = v10 - 4 == (float *)a1;
          if (v10 - 4 != (float *)a1) {
            *(_OWORD *)a1 = *((_OWORD *)v10 - 1);
          }
          a4 = 0;
          *(v10 - 4) = v37;
          *(v10 - 3) = v15;
          *((void *)v10 - 1) = v38;
        }
        float v15 = *(float *)(a1 + 4);
LABEL_12:
        uint64_t v16 = 0;
        float v17 = *(float *)a1;
        uint64_t v18 = *(void *)(a1 + 8);
        do
        {
          float v19 = *(float *)(a1 + v16 + 20);
          v16 += 16;
        }
        while (v19 < v15);
        unsigned int v20 = (float *)(a1 + v16);
        unsigned int v21 = a2;
        if (v16 == 16)
        {
          unsigned __int8 v24 = a2;
          while (v20 < v24)
          {
            int v22 = v24 - 4;
            float v25 = *(v24 - 3);
            v24 -= 4;
            if (v25 < v15) {
              goto LABEL_22;
            }
          }
          int v22 = v24;
        }
        else
        {
          do
          {
            int v22 = v21 - 4;
            float v23 = *(v21 - 3);
            v21 -= 4;
          }
          while (v23 >= v15);
        }
LABEL_22:
        char v10 = v20;
        if (v20 < v22)
        {
          uint64_t v26 = v22;
          do
          {
            long long v91 = *(_OWORD *)v10;
            *(_OWORD *)char v10 = *(_OWORD *)v26;
            *(_OWORD *)uint64_t v26 = v91;
            do
            {
              float v27 = v10[5];
              v10 += 4;
            }
            while (v27 < v15);
            do
            {
              float v28 = *(v26 - 3);
              v26 -= 4;
            }
            while (v28 >= v15);
          }
          while (v10 < v26);
        }
        if (v10 - 4 != (float *)a1) {
          *(_OWORD *)a1 = *((_OWORD *)v10 - 1);
        }
        *(v10 - 4) = v17;
        *(v10 - 3) = v15;
        *((void *)v10 - 1) = v18;
        if (v20 >= v22) {
          break;
        }
LABEL_33:
        std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int)::SequenceElement *,false>(a1, v10 - 4, a3, a4 & 1);
        a4 = 0;
      }
      BOOL v29 = std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int)::SequenceElement *>((float *)a1, v10 - 4);
      if (std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int)::SequenceElement *>(v10, a2))
      {
        break;
      }
      if (!v29) {
        goto LABEL_33;
      }
    }
    a2 = v10 - 4;
    if (!v29) {
      continue;
    }
    break;
  }
}

float *std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int)::SequenceElement *>(float *result, float *a2, float *a3)
{
  float v3 = a2[1];
  float v4 = a3[1];
  if (v3 >= result[1])
  {
    if (v4 < v3)
    {
      long long v6 = *(_OWORD *)a2;
      *(_OWORD *)a2 = *(_OWORD *)a3;
      *(_OWORD *)a3 = v6;
      if (a2[1] < result[1])
      {
        long long v7 = *(_OWORD *)result;
        *(_OWORD *)uint64_t result = *(_OWORD *)a2;
        *(_OWORD *)a2 = v7;
      }
    }
  }
  else
  {
    if (v4 >= v3)
    {
      long long v8 = *(_OWORD *)result;
      *(_OWORD *)uint64_t result = *(_OWORD *)a2;
      *(_OWORD *)a2 = v8;
      if (a3[1] >= a2[1]) {
        return result;
      }
      long long v5 = *(_OWORD *)a2;
      *(_OWORD *)a2 = *(_OWORD *)a3;
    }
    else
    {
      long long v5 = *(_OWORD *)result;
      *(_OWORD *)uint64_t result = *(_OWORD *)a3;
    }
    *(_OWORD *)a3 = v5;
  }
  return result;
}

BOOL std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int)::SequenceElement *>(float *a1, float *a2)
{
  uint64_t v4 = ((char *)a2 - (char *)a1) >> 4;
  BOOL result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      if (*(a2 - 3) < a1[1])
      {
        long long v6 = *(_OWORD *)a1;
        *(_OWORD *)a1 = *((_OWORD *)a2 - 1);
        *((_OWORD *)a2 - 1) = v6;
      }
      return result;
    case 3:
      std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int)::SequenceElement *>(a1, a1 + 4, a2 - 4);
      return 1;
    case 4:
      std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int)::SequenceElement *>(a1, (uint64_t)(a1 + 4), (uint64_t)(a1 + 8), (uint64_t)(a2 - 4));
      return 1;
    case 5:
      float v17 = (long long *)(a1 + 4);
      uint64_t v18 = (long long *)(a1 + 8);
      float v19 = (long long *)(a1 + 12);
      std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int)::SequenceElement *>(a1, (uint64_t)(a1 + 4), (uint64_t)(a1 + 8), (uint64_t)(a1 + 12));
      if (*(a2 - 3) < a1[13])
      {
        long long v20 = *v19;
        long long *v19 = *((_OWORD *)a2 - 1);
        *((_OWORD *)a2 - 1) = v20;
        if (a1[13] < a1[9])
        {
          long long v21 = *v18;
          long long *v18 = *v19;
          long long *v19 = v21;
          if (a1[9] < a1[5])
          {
            long long v22 = *v17;
            *float v17 = *v18;
            long long *v18 = v22;
            if (a1[5] < a1[1])
            {
              long long v23 = *(_OWORD *)a1;
              *(_OWORD *)a1 = *v17;
              *float v17 = v23;
            }
          }
        }
      }
      return 1;
    default:
      long long v7 = a1 + 8;
      std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int)::SequenceElement *>(a1, a1 + 4, a1 + 8);
      long long v8 = a1 + 12;
      if (a1 + 12 == a2) {
        return 1;
      }
      uint64_t v9 = 0;
      int v10 = 0;
      break;
  }
  while (1)
  {
    float v11 = v8[1];
    if (v11 < v7[1])
    {
      int v12 = *(_DWORD *)v8;
      uint64_t v13 = *((void *)v8 + 1);
      uint64_t v14 = v9;
      while (1)
      {
        *(_OWORD *)((char *)a1 + v14 + 48) = *(_OWORD *)((char *)a1 + v14 + 32);
        if (v14 == -32) {
          break;
        }
        float v15 = *(float *)((char *)a1 + v14 + 20);
        v14 -= 16;
        if (v11 >= v15)
        {
          uint64_t v16 = (uint64_t)a1 + v14 + 48;
          goto LABEL_13;
        }
      }
      uint64_t v16 = (uint64_t)a1;
LABEL_13:
      *(_DWORD *)uint64_t v16 = v12;
      *(float *)(v16 + 4) = v11;
      *(void *)(v16 + 8) = v13;
      if (++v10 == 8) {
        return v8 + 4 == a2;
      }
    }
    long long v7 = v8;
    v9 += 16;
    v8 += 4;
    if (v8 == a2) {
      return 1;
    }
  }
}

__n128 std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int)::SequenceElement *>(float *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int)::SequenceElement *>(a1, (float *)a2, (float *)a3);
  result.n128_u32[0] = *(_DWORD *)(a4 + 4);
  if (result.n128_f32[0] < *(float *)(a3 + 4))
  {
    __n128 result = *(__n128 *)a3;
    *(_OWORD *)a3 = *(_OWORD *)a4;
    *(__n128 *)a4 = result;
    result.n128_u32[0] = *(_DWORD *)(a3 + 4);
    if (result.n128_f32[0] < *(float *)(a2 + 4))
    {
      __n128 result = *(__n128 *)a2;
      *(_OWORD *)a2 = *(_OWORD *)a3;
      *(__n128 *)a3 = result;
      result.n128_u32[0] = *(_DWORD *)(a2 + 4);
      if (result.n128_f32[0] < a1[1])
      {
        __n128 result = *(__n128 *)a1;
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(__n128 *)a2 = result;
      }
    }
  }
  return result;
}

void *std::get_temporary_buffer[abi:nn180100]<RB::DisplayList::EditAdaptor::Element>(uint64_t a1)
{
  if (a1 < 1) {
    return 0;
  }
  if (a1 >= 0x555555555555555) {
    unint64_t v1 = 0x555555555555555;
  }
  else {
    unint64_t v1 = a1;
  }
  int v2 = (const std::nothrow_t *)MEMORY[0x263F8C180];
  while (1)
  {
    __n128 result = operator new(24 * v1, v2);
    if (result) {
      break;
    }
    BOOL v4 = v1 > 1;
    v1 >>= 1;
    if (!v4) {
      return 0;
    }
  }
  return result;
}

__n128 std::__stable_sort<std::_ClassicAlgPolicy,RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_2 &,RB::DisplayList::EditAdaptor::Element *>(__n128 *a1, __n128 *a2, unint64_t a3, __n128 *a4, uint64_t a5, __n128 result)
{
  if (a3 >= 2)
  {
    long long v7 = a1;
    if (a3 == 2)
    {
      long long v8 = (__n128 *)((char *)a2 - 24);
      if (RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_2::operator()((uint64_t)&a2[-2].n128_i64[1], (uint64_t)a1))
      {
        unint64_t v9 = v7[1].n128_u64[0];
        __n128 result = *v7;
        unint64_t v10 = a2[-1].n128_u64[1];
        *long long v7 = *v8;
        v7[1].n128_u64[0] = v10;
        *long long v8 = result;
        a2[-1].n128_u64[1] = v9;
      }
    }
    else if ((uint64_t)a3 > 128)
    {
      uint64_t v20 = (uint64_t)a4;
      unint64_t v21 = a3 >> 1;
      long long v22 = (__n128 *)((char *)a1 + 24 * (a3 >> 1));
      unint64_t v23 = a3 >> 1;
      if ((uint64_t)a3 <= a5)
      {
        __n128 v24 = std::__stable_sort_move<std::_ClassicAlgPolicy,RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_2 &,RB::DisplayList::EditAdaptor::Element *>(a1, v22, v23, a4, result);
        float v25 = (__n128 *)(v20 + 24 * v21);
        result.n128_u64[0] = std::__stable_sort_move<std::_ClassicAlgPolicy,RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_2 &,RB::DisplayList::EditAdaptor::Element *>((__n128 *)((char *)v7 + 24 * (a3 >> 1)), a2, a3 - (a3 >> 1), v25, v24).n128_u64[0];
        uint64_t v26 = (__n128 *)(v20 + 24 * a3);
        float v27 = v25;
        while (v27 != v26)
        {
          if (RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_2::operator()((uint64_t)v27, v20))
          {
            __n128 result = *v27;
            v7[1].n128_u64[0] = v27[1].n128_u64[0];
            *long long v7 = result;
            float v27 = (__n128 *)((char *)v27 + 24);
          }
          else
          {
            __n128 result = *(__n128 *)v20;
            v7[1].n128_u64[0] = *(void *)(v20 + 16);
            *long long v7 = result;
            v20 += 24;
          }
          long long v7 = (__n128 *)((char *)v7 + 24);
          if ((__n128 *)v20 == v25)
          {
            if (v27 != v26)
            {
              unint64_t v28 = 0;
              do
              {
                BOOL v29 = (__n128 *)((char *)v7 + v28);
                __n128 result = *(__n128 *)((char *)v27 + v28);
                v29[1].n128_u64[0] = v27[1].n128_u64[v28 / 8];
                *BOOL v29 = result;
                v28 += 24;
              }
              while ((__n128 *)((char *)v27 + v28) != v26);
            }
            return result;
          }
        }
        if ((__n128 *)v20 != v25)
        {
          uint64_t v30 = 0;
          do
          {
            float v31 = (__n128 *)((char *)v7 + v30);
            __n128 result = *(__n128 *)(v20 + v30);
            v31[1].n128_u64[0] = *(void *)(v20 + v30 + 16);
            *float v31 = result;
            v30 += 24;
          }
          while ((__n128 *)(v20 + v30) != v25);
        }
      }
      else
      {
        std::__stable_sort<std::_ClassicAlgPolicy,RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_2 &,RB::DisplayList::EditAdaptor::Element *>(a1, v22, v23, a4, a5);
        std::__stable_sort<std::_ClassicAlgPolicy,RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_2 &,RB::DisplayList::EditAdaptor::Element *>((char *)v7 + 24 * (a3 >> 1), a2, a3 - (a3 >> 1), v20, a5);
        std::__inplace_merge<std::_ClassicAlgPolicy,RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_2 &,RB::DisplayList::EditAdaptor::Element *>((uint64_t)v7, (uint64_t)v7 + 24 * (a3 >> 1), (long long *)a2, a3 >> 1, a3 - (a3 >> 1), (char *)v20, a5);
      }
    }
    else if (a1 != a2)
    {
      uint64_t v12 = (uint64_t)&a1[1].n128_i64[1];
      if (&a1[1].n128_i8[8] != (__int8 *)a2)
      {
        uint64_t v13 = 0;
        uint64_t v14 = (uint64_t)a1;
        do
        {
          uint64_t v15 = v14;
          uint64_t v14 = v12;
          if (RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_2::operator()(v12, v15))
          {
            long long v32 = *(_OWORD *)v14;
            uint64_t v33 = *(void *)(v14 + 16);
            uint64_t v16 = v13;
            while (1)
            {
              float v17 = (char *)v7 + v16;
              *(__n128 *)(v17 + 24) = *(__n128 *)((char *)v7 + v16);
              *((void *)v17 + 5) = *(unint64_t *)((char *)v7[1].n128_u64 + v16);
              if (!v16) {
                break;
              }
              v16 -= 24;
              if (!RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_2::operator()((uint64_t)&v32, (uint64_t)v7 + v16))
              {
                uint64_t v18 = (uint64_t)&v7[1].n128_i64[1] + v16;
                goto LABEL_15;
              }
            }
            uint64_t v18 = (uint64_t)v7;
LABEL_15:
            result.n128_u64[0] = v32;
            *(_OWORD *)uint64_t v18 = v32;
            *(void *)(v18 + 16) = v33;
          }
          uint64_t v12 = v14 + 24;
          v13 += 24;
        }
        while ((__n128 *)(v14 + 24) != a2);
      }
    }
  }
  return result;
}

__n128 std::__stable_sort_move<std::_ClassicAlgPolicy,RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_2 &,RB::DisplayList::EditAdaptor::Element *>(__n128 *a1, __n128 *a2, unint64_t a3, __n128 *a4, __n128 result)
{
  if (a3)
  {
    long long v5 = a4;
    long long v8 = a1;
    if (a3 == 2)
    {
      unint64_t v9 = (__n128 *)((char *)a2 - 24);
      if (RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_2::operator()((uint64_t)&a2[-2].n128_i64[1], (uint64_t)a1))
      {
        __n128 v10 = *v9;
        v5[1].n128_u64[0] = v9[1].n128_u64[0];
        *long long v5 = v10;
        __n128 result = *v8;
        unint64_t v11 = v8[1].n128_u64[0];
      }
      else
      {
        __n128 v18 = *v8;
        v5[1].n128_u64[0] = v8[1].n128_u64[0];
        *long long v5 = v18;
        __n128 result = *v9;
        unint64_t v11 = v9[1].n128_u64[0];
      }
      v5[2].n128_u64[1] = v11;
      *(__n128 *)((char *)v5 + 24) = result;
    }
    else if (a3 == 1)
    {
      __n128 result = *a1;
      a4[1].n128_u64[0] = a1[1].n128_u64[0];
      *a4 = result;
    }
    else if ((uint64_t)a3 > 8)
    {
      float v19 = (__n128 *)((char *)a1 + 24 * (a3 >> 1));
      std::__stable_sort<std::_ClassicAlgPolicy,RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_2 &,RB::DisplayList::EditAdaptor::Element *>(a1, v19, a3 >> 1, a4, a3 >> 1);
      std::__stable_sort<std::_ClassicAlgPolicy,RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_2 &,RB::DisplayList::EditAdaptor::Element *>((char *)v8 + 24 * (a3 >> 1), a2, a3 - (a3 >> 1), (char *)v5 + 24 * (a3 >> 1), a3 - (a3 >> 1));
      uint64_t v20 = (__n128 *)((char *)v8 + 24 * (a3 >> 1));
      while (v20 != a2)
      {
        if (RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_2::operator()((uint64_t)v20, (uint64_t)v8))
        {
          __n128 result = *v20;
          v5[1].n128_u64[0] = v20[1].n128_u64[0];
          *long long v5 = result;
          uint64_t v20 = (__n128 *)((char *)v20 + 24);
        }
        else
        {
          __n128 result = *v8;
          v5[1].n128_u64[0] = v8[1].n128_u64[0];
          *long long v5 = result;
          long long v8 = (__n128 *)((char *)v8 + 24);
        }
        long long v5 = (__n128 *)((char *)v5 + 24);
        if (v8 == v19)
        {
          if (v20 != a2)
          {
            unint64_t v21 = 0;
            do
            {
              long long v22 = (__n128 *)((char *)v5 + v21);
              __n128 result = *(__n128 *)((char *)v20 + v21);
              v22[1].n128_u64[0] = v20[1].n128_u64[v21 / 8];
              *long long v22 = result;
              v21 += 24;
            }
            while ((__n128 *)((char *)v20 + v21) != a2);
          }
          return result;
        }
      }
      if (v8 != v19)
      {
        unint64_t v23 = 0;
        do
        {
          __n128 v24 = (__n128 *)((char *)v5 + v23);
          __n128 result = *(__n128 *)((char *)v8 + v23);
          v24[1].n128_u64[0] = v8[1].n128_u64[v23 / 8];
          *__n128 v24 = result;
          v23 += 24;
        }
        while ((__n128 *)((char *)v8 + v23) != v19);
      }
    }
    else if (a1 != a2)
    {
      __n128 result = *a1;
      a4[1].n128_u64[0] = a1[1].n128_u64[0];
      *a4 = result;
      uint64_t v12 = (__n128 *)((char *)a1 + 24);
      if (&a1[1].n128_i8[8] != (__int8 *)a2)
      {
        uint64_t v13 = 0;
        uint64_t v14 = a4;
        do
        {
          uint64_t v15 = (uint64_t)v14;
          uint64_t v14 = (__n128 *)((char *)v14 + 24);
          uint64_t v16 = v14;
          if (RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_2::operator()((uint64_t)v12, v15))
          {
            *uint64_t v14 = *(__n128 *)v15;
            v14[1].n128_u64[0] = *(void *)(v15 + 16);
            uint64_t v16 = v5;
            if ((__n128 *)v15 != v5)
            {
              uint64_t v17 = v13;
              while (1)
              {
                uint64_t v16 = (__n128 *)((char *)v5 + v17);
                if (!RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_2::operator()((uint64_t)v12, (uint64_t)&v5[-1] + v17 - 8))break; {
                *uint64_t v16 = *(__n128 *)((char *)v5 + v17 - 24);
                }
                v16[1].n128_u64[0] = *(unint64_t *)((char *)&v5->n128_u64[-1] + v17);
                v17 -= 24;
                if (!v17)
                {
                  uint64_t v16 = v5;
                  break;
                }
              }
            }
          }
          __n128 result = *v12;
          v16[1].n128_u64[0] = v12[1].n128_u64[0];
          *uint64_t v16 = result;
          uint64_t v12 = (__n128 *)((char *)v12 + 24);
          v13 += 24;
        }
        while (v12 != a2);
      }
    }
  }
  return result;
}

uint64_t std::__inplace_merge<std::_ClassicAlgPolicy,RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_2 &,RB::DisplayList::EditAdaptor::Element *>(uint64_t result, uint64_t a2, long long *a3, uint64_t a4, uint64_t a5, char *a6, uint64_t a7)
{
  uint64_t v57 = a5;
  if (a5)
  {
    uint64_t v12 = (char *)result;
    while (v57 > a7 && a4 > a7)
    {
      if (!a4) {
        return result;
      }
      for (uint64_t i = v12; ; i += 24)
      {
        __n128 result = RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_2::operator()(a2, (uint64_t)v12);
        if (result) {
          break;
        }
        v12 += 24;
        if (!--a4) {
          return result;
        }
      }
      uint64_t v14 = v57;
      __src = a6;
      uint64_t v56 = a3;
      if (a4 >= v57)
      {
        if (a4 == 1)
        {
          uint64_t v59 = *((void *)v12 + 2);
          long long v58 = *(_OWORD *)v12;
          long long v47 = *(_OWORD *)a2;
          *((void *)v12 + 2) = *(void *)(a2 + 16);
          *(_OWORD *)uint64_t v12 = v47;
          *(void *)(a2 + 16) = v59;
          *(_OWORD *)a2 = v58;
          return result;
        }
        if (a4 >= 0) {
          uint64_t v20 = a4;
        }
        else {
          uint64_t v20 = a4 + 1;
        }
        uint64_t v18 = v20 >> 1;
        uint64_t v16 = &v12[24 * (v20 >> 1)];
        if (a3 != (long long *)a2)
        {
          uint64_t v52 = v20 >> 1;
          uint64_t v54 = a7;
          unint64_t v21 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)a3 - a2) >> 3);
          a3 = (long long *)a2;
          do
          {
            uint64_t v22 = (uint64_t)a3 + 24 * (v21 >> 1);
            BOOL v23 = RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_2::operator()(v22, (uint64_t)v16);
            if (v23) {
              v21 += ~(v21 >> 1);
            }
            else {
              v21 >>= 1;
            }
            if (v23) {
              a3 = (long long *)(v22 + 24);
            }
          }
          while (v21);
          uint64_t v18 = v52;
          a7 = v54;
          uint64_t v14 = v57;
        }
        unint64_t v19 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)a3 - a2) >> 3);
      }
      else
      {
        if (v57 >= 0) {
          uint64_t v15 = v57;
        }
        else {
          uint64_t v15 = v57 + 1;
        }
        uint64_t v51 = v15 >> 1;
        uint64_t v53 = a7;
        a3 = (long long *)(a2 + 24 * (v15 >> 1));
        uint64_t v16 = (char *)a2;
        if (v12 != (char *)a2)
        {
          unint64_t v17 = 0xAAAAAAAAAAAAAAABLL * ((a2 - (uint64_t)i) >> 3);
          uint64_t v16 = v12;
          do
          {
            if (RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_2::operator()((uint64_t)a3, (uint64_t)&v16[24 * (v17 >> 1)]))
            {
              v17 >>= 1;
            }
            else
            {
              v16 += 24 * (v17 >> 1) + 24;
              v17 += ~(v17 >> 1);
            }
          }
          while (v17);
        }
        uint64_t v18 = 0xAAAAAAAAAAAAAAABLL * ((v16 - i) >> 3);
        unint64_t v19 = v51;
        a7 = v53;
        uint64_t v14 = v57;
      }
      uint64_t v24 = a4 - v18;
      unint64_t v25 = v14 - v19;
      uint64_t v26 = (long long *)a2;
      uint64_t v27 = v14;
      uint64_t v28 = v18;
      BOOL v29 = std::__rotate[abi:nn180100]<std::_ClassicAlgPolicy,RB::DisplayList::EditAdaptor::Element *,RB::DisplayList::EditAdaptor::Element *>(v16, v26, a3);
      uint64_t v30 = v28;
      float v31 = v29;
      if ((uint64_t)(v30 + v19) >= (uint64_t)(v27 - (v30 + v19) + a4))
      {
        uint64_t v33 = v30;
        __n128 result = std::__inplace_merge<std::_ClassicAlgPolicy,RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_2 &,RB::DisplayList::EditAdaptor::Element *>(v29, a3, v56, v24, v25, __src, a7);
        a3 = (long long *)v16;
        a6 = __src;
        unint64_t v25 = v19;
        uint64_t v24 = v33;
        uint64_t v56 = v31;
      }
      else
      {
        long long v32 = v16;
        a6 = __src;
        __n128 result = std::__inplace_merge<std::_ClassicAlgPolicy,RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_2 &,RB::DisplayList::EditAdaptor::Element *>(v12, v32, v29, v30, v19, __src, a7);
        uint64_t v12 = (char *)v31;
      }
      a4 = v24;
      uint64_t v57 = v25;
      a2 = (uint64_t)a3;
      a3 = v56;
      if (!v25) {
        return result;
      }
    }
    if (a4 <= v57)
    {
      if (v12 != (char *)a2)
      {
        uint64_t v41 = 0;
        do
        {
          unsigned __int32 v42 = &a6[v41];
          long long v43 = *(_OWORD *)&v12[v41];
          *((void *)v42 + 2) = *(void *)&v12[v41 + 16];
          *(_OWORD *)unsigned __int32 v42 = v43;
          v41 += 24;
        }
        while (&v12[v41] != (char *)a2);
        if (v41)
        {
          long long v44 = a6;
          while ((long long *)a2 != a3)
          {
            __n128 result = RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_2::operator()(a2, (uint64_t)v44);
            if (result)
            {
              long long v45 = *(_OWORD *)a2;
              *((void *)v12 + 2) = *(void *)(a2 + 16);
              *(_OWORD *)uint64_t v12 = v45;
              a2 += 24;
            }
            else
            {
              long long v46 = *(_OWORD *)v44;
              *((void *)v12 + 2) = *((void *)v44 + 2);
              *(_OWORD *)uint64_t v12 = v46;
              v44 += 24;
            }
            v12 += 24;
            if (&a6[v41] == v44) {
              return result;
            }
          }
          return (uint64_t)memmove(v12, v44, a6 - v44 + v41);
        }
      }
    }
    else if ((long long *)a2 != a3)
    {
      uint64_t v34 = 0;
      do
      {
        long long v35 = &a6[v34];
        long long v36 = *(_OWORD *)(a2 + v34);
        *((void *)v35 + 2) = *(void *)(a2 + v34 + 16);
        *(_OWORD *)long long v35 = v36;
        v34 += 24;
      }
      while ((long long *)(a2 + v34) != a3);
      if (v34)
      {
        float v37 = &a6[v34];
        uint64_t v38 = (char *)a3 - 24;
        while ((char *)a2 != v12)
        {
          __n128 result = RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_2::operator()((uint64_t)(v37 - 24), a2 - 24);
          if (result) {
            uint64_t v39 = a2 - 24;
          }
          else {
            uint64_t v39 = (uint64_t)(v37 - 24);
          }
          if (result) {
            a2 -= 24;
          }
          uint64_t v40 = *(void *)(v39 + 16);
          if (!result) {
            v37 -= 24;
          }
          *(_OWORD *)uint64_t v38 = *(_OWORD *)v39;
          *((void *)v38 + 2) = v40;
          v38 -= 24;
          if (v37 == a6) {
            return result;
          }
        }
        uint64_t v48 = 0;
        do
        {
          BOOL v49 = &v38[v48];
          long long v50 = *(_OWORD *)&v37[v48 - 24];
          *((void *)v49 + 2) = *(void *)&v37[v48 - 8];
          *(_OWORD *)BOOL v49 = v50;
          v48 -= 24;
        }
        while (&v37[v48] != a6);
      }
    }
  }
  return result;
}

long long *std::__rotate[abi:nn180100]<std::_ClassicAlgPolicy,RB::DisplayList::EditAdaptor::Element *,RB::DisplayList::EditAdaptor::Element *>(char *__src, long long *a2, long long *a3)
{
  BOOL v4 = a3;
  if (__src != (char *)a2)
  {
    if (a2 == a3)
    {
      return (long long *)__src;
    }
    else if (__src + 24 == (char *)a2)
    {
      long long v9 = *(_OWORD *)__src;
      uint64_t v11 = *((void *)__src + 2);
      int64_t v6 = (char *)a3 - (char *)a2;
      memmove(__src, a2, (char *)a3 - (char *)a2);
      BOOL v4 = (long long *)&__src[v6];
      *BOOL v4 = v9;
      *((void *)v4 + 2) = v11;
    }
    else if ((long long *)((char *)a2 + 24) == a3)
    {
      BOOL v4 = (long long *)(__src + 24);
      long long v10 = *(long long *)((char *)a3 - 24);
      uint64_t v12 = *((void *)a3 - 1);
      size_t v7 = (char *)a3 - 24 - __src;
      if ((char *)a3 - 24 != __src) {
        memmove(__src + 24, __src, v7);
      }
      *(_OWORD *)__src = v10;
      *((void *)__src + 2) = v12;
    }
    else
    {
      return std::__rotate_gcd[abi:nn180100]<std::_ClassicAlgPolicy,RB::DisplayList::EditAdaptor::Element *>((long long *)__src, a2, a3);
    }
  }
  return v4;
}

long long *std::__rotate_gcd[abi:nn180100]<std::_ClassicAlgPolicy,RB::DisplayList::EditAdaptor::Element *>(long long *a1, long long *a2, long long *a3)
{
  unint64_t v3 = 0xAAAAAAAAAAAAAAABLL * (((char *)a2 - (char *)a1) >> 3);
  if (v3 == 0xAAAAAAAAAAAAAAABLL * (((char *)a3 - (char *)a2) >> 3))
  {
    if (a1 != a2 && a2 != a3)
    {
      uint64_t v4 = 0;
      do
      {
        uint64_t v5 = (uint64_t)a2 + v4;
        uint64_t v6 = (uint64_t)a1 + v4;
        uint64_t v7 = *(void *)((char *)a1 + v4 + 16);
        long long v8 = *(long long *)((char *)a1 + v4);
        uint64_t v9 = *(void *)((char *)a2 + v4 + 16);
        *(_OWORD *)uint64_t v6 = *(long long *)((char *)a2 + v4);
        *(void *)(v6 + 16) = v9;
        *(_OWORD *)uint64_t v5 = v8;
        *(void *)(v5 + 16) = v7;
        if ((long long *)((char *)a1 + v4 + 24) == a2) {
          break;
        }
        v4 += 24;
      }
      while ((long long *)(v5 + 24) != a3);
    }
  }
  else
  {
    uint64_t v10 = 0xAAAAAAAAAAAAAAABLL * (((char *)a3 - (char *)a2) >> 3);
    unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * (((char *)a2 - (char *)a1) >> 3);
    do
    {
      uint64_t v12 = v11;
      unint64_t v11 = v10;
      uint64_t v10 = v12 % v10;
    }
    while (v10);
    if (v11)
    {
      uint64_t v13 = (long long *)((char *)a1 + 24 * v11);
      do
      {
        long long v14 = *(long long *)((char *)v13 - 24);
        uint64_t v15 = *((void *)v13 - 1);
        uint64_t v13 = (long long *)((char *)v13 - 24);
        long long v25 = v14;
        uint64_t v26 = v15;
        uint64_t v16 = (long long *)((char *)v13 + 8 * (((char *)a2 - (char *)a1) >> 3));
        unint64_t v17 = v13;
        do
        {
          uint64_t v18 = v17;
          unint64_t v17 = v16;
          long long v19 = *v16;
          *((void *)v18 + 2) = *((void *)v16 + 2);
          long long *v18 = v19;
          unint64_t v20 = 0xAAAAAAAAAAAAAAABLL * (((char *)a3 - (char *)v16) >> 3);
          BOOL v21 = __OFSUB__(v3, v20);
          uint64_t v23 = v3 - v20;
          char v22 = (v23 < 0) ^ v21;
          uint64_t v16 = (long long *)((char *)a1 + 24 * v23);
          if (v22) {
            uint64_t v16 = (long long *)((char *)v17 + 8 * (((char *)a2 - (char *)a1) >> 3));
          }
        }
        while (v16 != v13);
        *((void *)v17 + 2) = v26;
        *unint64_t v17 = v25;
      }
      while (v13 != a1);
    }
    return (long long *)((char *)a1 + 8 * (((char *)a3 - (char *)a2) >> 3));
  }
  return a2;
}

void *RB::vector<RB::Rect,2ul,unsigned int>::reserve_slow(void *__dst, unsigned int a2)
{
  if (*((_DWORD *)__dst + 11) + (*((_DWORD *)__dst + 11) >> 1) <= a2) {
    unsigned int v3 = a2;
  }
  else {
    unsigned int v3 = *((_DWORD *)__dst + 11) + (*((_DWORD *)__dst + 11) >> 1);
  }
  __n128 result = RB::details::realloc_vector<unsigned int,16ul>(*((void **)__dst + 4), __dst, 2u, (_DWORD *)__dst + 11, v3);
  *((void *)__dst + 4) = result;
  return result;
}

void *std::get_temporary_buffer[abi:nn180100]<RB::DisplayList::Interpolator::Op>(uint64_t a1)
{
  if (a1 < 1) {
    return 0;
  }
  if (a1 >= 0x333333333333333) {
    unint64_t v1 = 0x333333333333333;
  }
  else {
    unint64_t v1 = a1;
  }
  int v2 = (const std::nothrow_t *)MEMORY[0x263F8C180];
  while (1)
  {
    __n128 result = operator new(40 * v1, v2);
    if (result) {
      break;
    }
    BOOL v4 = v1 > 1;
    v1 >>= 1;
    if (!v4) {
      return 0;
    }
  }
  return result;
}

void std::__stable_sort<std::_ClassicAlgPolicy,RB::DisplayList::EditAdaptor::finalize(RB::DisplayList::Interpolator::Layer &)::$_1 &,RB::DisplayList::Interpolator::Op *>(long long *a1, long long *a2, unint64_t a3, uint64_t *a4, uint64_t a5, __n128 a6)
{
  if (a3 < 2) {
    return;
  }
  uint64_t v7 = a1;
  if (a3 == 2)
  {
    long long v8 = (long long *)((char *)a2 - 40);
    uint64_t v9 = *((void *)a2 - 5);
    uint64_t v10 = *(void *)a1;
    if (v9 >> 4 == *(void *)a1 >> 4)
    {
      uint64_t v11 = *(void *)a1 & 0xFLL;
      BOOL v12 = (v9 & 0xF) == 0 || v11 == 0;
      if (v12
        || (v67 = *((_DWORD *)a2 - 6), v68 = *((_DWORD *)a1 + 4), BOOL v56 = v67 >= v68, v67 == v68)
        && (v69 = *((_DWORD *)a2 - 5), v70 = *((_DWORD *)a1 + 5), BOOL v56 = v69 >= v70, v69 == v70))
      {
        int v13 = v9 & 0xF;
        if (v13 == 1
          || v13 == 8
          || (int v14 = v10 & 0xF, v14 == 1)
          || v14 == 8
          || (v106 = *((_DWORD *)a2 - 8), v107 = *((_DWORD *)a1 + 2), BOOL v56 = v106 >= v107, v106 == v107)
          && (v108 = *((_DWORD *)a2 - 7), v109 = *((_DWORD *)a1 + 3), BOOL v56 = v108 >= v109, v108 == v109))
        {
          if ((*((void *)a2 - 5) & 0xFLL) == 0 || v11) {
            return;
          }
LABEL_80:
          long long v57 = *a1;
          long long v58 = a1[1];
          uint64_t v59 = *((void *)a1 + 4);
          uint64_t v60 = *((void *)a2 - 1);
          long long v61 = *(long long *)((char *)a2 - 24);
          *a1 = *v8;
          a1[1] = v61;
          *((void *)a1 + 4) = v60;
          *((void *)a2 - 1) = v59;
          *long long v8 = v57;
          *(long long *)((char *)a2 - 24) = v58;
          return;
        }
      }
    }
    else
    {
      BOOL v56 = v9 >> 4 >= v10 >> 4;
    }
    if (v56) {
      return;
    }
    goto LABEL_80;
  }
  if ((uint64_t)a3 > 128)
  {
    float32x2_t v63 = a4;
    unint64_t v64 = a3 >> 1;
    unsigned int v65 = (uint64_t *)a1 + 5 * (a3 >> 1);
    unint64_t v66 = a3 >> 1;
    if ((uint64_t)a3 > a5)
    {
      std::__stable_sort<std::_ClassicAlgPolicy,RB::DisplayList::EditAdaptor::finalize(RB::DisplayList::Interpolator::Layer &)::$_1 &,RB::DisplayList::Interpolator::Op *>(a1, v65, v66, a4, a5);
      std::__stable_sort<std::_ClassicAlgPolicy,RB::DisplayList::EditAdaptor::finalize(RB::DisplayList::Interpolator::Layer &)::$_1 &,RB::DisplayList::Interpolator::Op *>((char *)v7 + 40 * (a3 >> 1), a2, a3 - (a3 >> 1), v63, a5);
      std::__inplace_merge<std::_ClassicAlgPolicy,RB::DisplayList::EditAdaptor::finalize(RB::DisplayList::Interpolator::Layer &)::$_1 &,RB::DisplayList::Interpolator::Op *>(v7, (long long *)((char *)v7 + 40 * (a3 >> 1)), a2, a3 >> 1, a3 - (a3 >> 1), (char *)v63, a5);
      return;
    }
    __n128 v71 = std::__stable_sort_move<std::_ClassicAlgPolicy,RB::DisplayList::EditAdaptor::finalize(RB::DisplayList::Interpolator::Layer &)::$_1 &,RB::DisplayList::Interpolator::Op *>((uint64_t *)a1, v65, v66, a4, a6);
    uint64_t v72 = &v63[5 * v64];
    std::__stable_sort_move<std::_ClassicAlgPolicy,RB::DisplayList::EditAdaptor::finalize(RB::DisplayList::Interpolator::Layer &)::$_1 &,RB::DisplayList::Interpolator::Op *>((uint64_t *)v7 + 5 * (a3 >> 1), (uint64_t *)a2, a3 - (a3 >> 1), v72, v71);
    int v73 = &v63[5 * a3];
    unsigned int v74 = v72;
    while (1)
    {
      if (v74 == v73)
      {
        if (v63 != v72)
        {
          uint64_t v98 = 0;
          do
          {
            uint64_t v99 = (uint64_t)v7 + v98 * 8;
            long long v100 = *(_OWORD *)&v63[v98];
            long long v101 = *(_OWORD *)&v63[v98 + 2];
            *(void *)(v99 + 32) = v63[v98 + 4];
            *(_OWORD *)uint64_t v99 = v100;
            *(_OWORD *)(v99 + 16) = v101;
            v98 += 5;
          }
          while (&v63[v98] != v72);
        }
        return;
      }
      uint64_t v75 = *v74;
      unsigned int v76 = *v74 >> 4;
      uint64_t v77 = *v63;
      if (v76 != *v63 >> 4) {
        break;
      }
      uint64_t v78 = *v63 & 0xF;
      if ((v75 & 0xF) != 0 && v78 != 0)
      {
        unsigned int v80 = *((_DWORD *)v74 + 4);
        unsigned int v81 = *((_DWORD *)v63 + 4);
        BOOL v82 = v80 >= v81;
        if (v80 != v81) {
          goto LABEL_112;
        }
        unsigned int v83 = *((_DWORD *)v74 + 5);
        unsigned int v84 = *((_DWORD *)v63 + 5);
        BOOL v82 = v83 >= v84;
        if (v83 != v84) {
          goto LABEL_112;
        }
      }
      int v85 = v75 & 0xF;
      BOOL v86 = v85 == 1 || v85 == 8;
      int v87 = v77 & 0xF;
      BOOL v88 = v86 || v87 == 1;
      if (!v88 && v87 != 8)
      {
        unsigned int v94 = *((_DWORD *)v74 + 2);
        unsigned int v95 = *((_DWORD *)v63 + 2);
        BOOL v82 = v94 >= v95;
        if (v94 != v95) {
          goto LABEL_112;
        }
        unsigned int v96 = *((_DWORD *)v74 + 3);
        unsigned int v97 = *((_DWORD *)v63 + 3);
        BOOL v82 = v96 >= v97;
        if (v96 != v97) {
          goto LABEL_112;
        }
      }
      if ((*v74 & 0xF) == 0 || v78)
      {
LABEL_114:
        long long v92 = *(_OWORD *)v63;
        long long v93 = *((_OWORD *)v63 + 1);
        *((void *)v7 + 4) = v63[4];
        *uint64_t v7 = v92;
        v7[1] = v93;
        v63 += 5;
        goto LABEL_115;
      }
LABEL_110:
      long long v90 = *(_OWORD *)v74;
      long long v91 = *((_OWORD *)v74 + 1);
      *((void *)v7 + 4) = v74[4];
      *uint64_t v7 = v90;
      v7[1] = v91;
      v74 += 5;
LABEL_115:
      uint64_t v7 = (long long *)((char *)v7 + 40);
      if (v63 == v72)
      {
        if (v74 != v73)
        {
          uint64_t v102 = 0;
          do
          {
            uint64_t v103 = (uint64_t)v7 + v102 * 8;
            long long v104 = *(_OWORD *)&v74[v102];
            long long v105 = *(_OWORD *)&v74[v102 + 2];
            *(void *)(v103 + 32) = v74[v102 + 4];
            *(_OWORD *)uint64_t v103 = v104;
            *(_OWORD *)(v103 + 16) = v105;
            v102 += 5;
          }
          while (&v74[v102] != v73);
        }
        return;
      }
    }
    BOOL v82 = v76 >= v77 >> 4;
LABEL_112:
    if (v82) {
      goto LABEL_114;
    }
    goto LABEL_110;
  }
  if (a1 == a2) {
    return;
  }
  uint64_t v16 = (uint64_t *)a1 + 5;
  if ((long long *)((char *)a1 + 40) == a2) {
    return;
  }
  uint64_t v17 = 0;
  uint64_t v18 = (uint64_t *)a1;
  do
  {
    long long v19 = v18;
    uint64_t v18 = v16;
    uint64_t v20 = v19[5];
    unsigned int v21 = v20 >> 4;
    uint64_t v22 = *v19;
    if (v20 >> 4 == *v19 >> 4)
    {
      uint64_t v23 = *v19 & 0xF;
      BOOL v24 = (v20 & 0xF) == 0 || v23 == 0;
      if (v24
        || (v48 = *((_DWORD *)v19 + 14), v49 = *((_DWORD *)v19 + 4), BOOL v29 = v48 >= v49, v48 == v49)
        && (v50 = *((_DWORD *)v19 + 15), v51 = *((_DWORD *)v19 + 5), BOOL v29 = v50 >= v51, v50 == v51))
      {
        BOOL v25 = (v20 & 0xF) == 1 || (v20 & 0xF) == 8;
        int v26 = v22 & 0xF;
        BOOL v27 = v25 || v26 == 1;
        BOOL v28 = v27 || v26 == 8;
        if (v28
          || (v52 = *((_DWORD *)v19 + 12), v53 = *((_DWORD *)v19 + 2), BOOL v29 = v52 >= v53, v52 == v53)
          && (v54 = *((_DWORD *)v19 + 13), v55 = *((_DWORD *)v19 + 3), BOOL v29 = v54 >= v55, v54 == v55))
        {
          if ((v20 & 0xF) == 0 || v23) {
            goto LABEL_73;
          }
          goto LABEL_43;
        }
      }
    }
    else
    {
      BOOL v29 = v21 >= v22 >> 4;
    }
    if (v29) {
      goto LABEL_73;
    }
LABEL_43:
    unsigned int v30 = *((_DWORD *)v19 + 12);
    unsigned int v31 = *((_DWORD *)v19 + 13);
    unsigned int v32 = *((_DWORD *)v19 + 14);
    unsigned int v33 = *((_DWORD *)v19 + 15);
    long long v110 = *((_OWORD *)v19 + 4);
    v18[4] = v19[4];
    long long v34 = *((_OWORD *)v19 + 1);
    *(_OWORD *)uint64_t v18 = *(_OWORD *)v19;
    *((_OWORD *)v18 + 1) = v34;
    long long v35 = (uint64_t *)v7;
    if (v19 == (uint64_t *)v7) {
      goto LABEL_72;
    }
    int v36 = v20 & 0xF;
    uint64_t v37 = v17;
    while (1)
    {
      uint64_t v38 = (uint64_t)v7 + v37;
      uint64_t v39 = *(void *)((char *)v7 + v37 - 40);
      if (v21 != v39 >> 4)
      {
        BOOL v41 = v21 >= v39 >> 4;
LABEL_61:
        if (v41) {
          goto LABEL_71;
        }
        goto LABEL_62;
      }
      if ((v20 & 0xF) != 0 && (v39 & 0xF) != 0)
      {
        unsigned int v40 = *(_DWORD *)((char *)v7 + v37 - 24);
        BOOL v41 = v32 >= v40;
        if (v32 != v40) {
          goto LABEL_61;
        }
        unsigned int v42 = *(_DWORD *)((char *)v7 + v37 - 20);
        BOOL v41 = v33 >= v42;
        if (v33 != v42) {
          goto LABEL_61;
        }
      }
      if (v36 == 1 || v36 == 8) {
        break;
      }
      int v43 = v39 & 0xF;
      if (v43 == 1 || v43 == 8) {
        break;
      }
      unsigned int v46 = *(_DWORD *)((char *)v7 + v37 - 32);
      BOOL v41 = v30 >= v46;
      if (v30 != v46) {
        goto LABEL_61;
      }
      unsigned int v47 = *(_DWORD *)((char *)v7 + v37 - 28);
      if (v31 == v47) {
        break;
      }
      if (v31 >= v47)
      {
        long long v35 = (uint64_t *)((char *)v7 + v37);
        goto LABEL_72;
      }
LABEL_62:
      v19 -= 5;
      long long v45 = *(long long *)((char *)v7 + v37 - 24);
      *(_OWORD *)uint64_t v38 = *(long long *)((char *)v7 + v37 - 40);
      *(_OWORD *)(v38 + 16) = v45;
      *(void *)(v38 + 32) = *(void *)((char *)v7 + v37 - 8);
      v37 -= 40;
      if (!v37)
      {
        long long v35 = (uint64_t *)v7;
        goto LABEL_72;
      }
    }
    if ((v20 & 0xF) != 0 && (*(void *)((unsigned char *)v7 + v37 - 40) & 0xFLL) == 0) {
      goto LABEL_62;
    }
LABEL_71:
    long long v35 = v19;
LABEL_72:
    uint64_t *v35 = v20;
    *((_DWORD *)v35 + 2) = v30;
    *((_DWORD *)v35 + 3) = v31;
    *((_DWORD *)v35 + 4) = v32;
    *((_DWORD *)v35 + 5) = v33;
    *(_OWORD *)(v35 + 3) = v110;
LABEL_73:
    uint64_t v16 = v18 + 5;
    v17 += 40;
  }
  while (v18 + 5 != (uint64_t *)a2);
}

__n128 std::__stable_sort_move<std::_ClassicAlgPolicy,RB::DisplayList::EditAdaptor::finalize(RB::DisplayList::Interpolator::Layer &)::$_1 &,RB::DisplayList::Interpolator::Op *>(uint64_t *a1, uint64_t *a2, unint64_t a3, uint64_t *a4, __n128 result)
{
  if (!a3) {
    return result;
  }
  uint64_t v5 = a4;
  long long v8 = a1;
  if (a3 == 2)
  {
    uint64_t v10 = (__n128 *)(a2 - 5);
    uint64_t v11 = *(a2 - 5);
    uint64_t v12 = *a1;
    if (v11 >> 4 == *a1 >> 4)
    {
      uint64_t v13 = *a1 & 0xF;
      BOOL v14 = (v11 & 0xF) == 0 || v13 == 0;
      if (v14
        || (v108 = *((_DWORD *)a2 - 6), v109 = *((_DWORD *)a1 + 4), BOOL v19 = v108 >= v109, v108 == v109)
        && (v110 = *((_DWORD *)a2 - 5), v111 = *((_DWORD *)a1 + 5), BOOL v19 = v110 >= v111, v110 == v111))
      {
        int v15 = v11 & 0xF;
        if (v15 == 1
          || v15 == 8
          || (int v16 = v12 & 0xF, v16 == 1)
          || v16 == 8
          || (unsigned int v17 = *((_DWORD *)a2 - 8), v18 = *((_DWORD *)a1 + 2), v19 = v17 >= v18, v17 == v18)
          && (v20 = *((_DWORD *)a2 - 7), unsigned int v21 = *((_DWORD *)a1 + 3), v19 = v20 >= v21, v20 == v21))
        {
          if ((*(a2 - 5) & 0xF) != 0 && !v13) {
            goto LABEL_19;
          }
          goto LABEL_91;
        }
      }
    }
    else
    {
      BOOL v19 = v11 >> 4 >= v12 >> 4;
    }
    if (!v19)
    {
LABEL_19:
      __n128 v22 = *v10;
      long long v23 = *(_OWORD *)(a2 - 3);
      a4[4] = *(a2 - 1);
      *(__n128 *)a4 = v22;
      *((_OWORD *)a4 + 1) = v23;
      __n128 result = *(__n128 *)a1;
      long long v24 = *((_OWORD *)a1 + 1);
      uint64_t v25 = a1[4];
LABEL_92:
      a4[9] = v25;
      *(_OWORD *)(a4 + 7) = v24;
      *(__n128 *)(a4 + 5) = result;
      return result;
    }
LABEL_91:
    __n128 v77 = *(__n128 *)a1;
    long long v78 = *((_OWORD *)a1 + 1);
    a4[4] = a1[4];
    *(__n128 *)a4 = v77;
    *((_OWORD *)a4 + 1) = v78;
    __n128 result = *v10;
    long long v24 = *(_OWORD *)(a2 - 3);
    uint64_t v25 = *(a2 - 1);
    goto LABEL_92;
  }
  if (a3 == 1)
  {
    __n128 result = *(__n128 *)a1;
    long long v9 = *((_OWORD *)a1 + 1);
    a4[4] = a1[4];
    *(__n128 *)a4 = result;
    *((_OWORD *)a4 + 1) = v9;
    return result;
  }
  if ((uint64_t)a3 > 8)
  {
    float v79 = &a1[5 * (a3 >> 1)];
    std::__stable_sort<std::_ClassicAlgPolicy,RB::DisplayList::EditAdaptor::finalize(RB::DisplayList::Interpolator::Layer &)::$_1 &,RB::DisplayList::Interpolator::Op *>(a1, v79, a3 >> 1, a4, a3 >> 1);
    std::__stable_sort<std::_ClassicAlgPolicy,RB::DisplayList::EditAdaptor::finalize(RB::DisplayList::Interpolator::Layer &)::$_1 &,RB::DisplayList::Interpolator::Op *>(&v8[5 * (a3 >> 1)], a2, a3 - (a3 >> 1), &v5[5 * (a3 >> 1)], a3 - (a3 >> 1));
    unsigned int v80 = &v8[5 * (a3 >> 1)];
    while (1)
    {
      if (v80 == a2)
      {
        if (v8 != v79)
        {
          uint64_t v105 = 0;
          do
          {
            unsigned int v106 = &v5[v105];
            __n128 result = *(__n128 *)&v8[v105];
            long long v107 = *(_OWORD *)&v8[v105 + 2];
            v106[4] = v8[v105 + 4];
            *(__n128 *)unsigned int v106 = result;
            *((_OWORD *)v106 + 1) = v107;
            v105 += 5;
          }
          while (&v8[v105] != v79);
        }
        return result;
      }
      uint64_t v81 = *v80;
      unsigned int v82 = *v80 >> 4;
      uint64_t v83 = *v8;
      if (v82 != *v8 >> 4) {
        break;
      }
      uint64_t v84 = *v8 & 0xF;
      if ((v81 & 0xF) != 0 && v84 != 0)
      {
        unsigned int v93 = *((_DWORD *)v80 + 4);
        unsigned int v94 = *((_DWORD *)v8 + 4);
        BOOL v92 = v93 >= v94;
        if (v93 != v94) {
          goto LABEL_122;
        }
        unsigned int v95 = *((_DWORD *)v80 + 5);
        unsigned int v96 = *((_DWORD *)v8 + 5);
        BOOL v92 = v95 >= v96;
        if (v95 != v96) {
          goto LABEL_122;
        }
      }
      int v86 = v81 & 0xF;
      BOOL v87 = v86 == 1 || v86 == 8;
      int v88 = v83 & 0xF;
      BOOL v89 = v87 || v88 == 1;
      if (!v89 && v88 != 8)
      {
        unsigned int v97 = *((_DWORD *)v80 + 2);
        unsigned int v98 = *((_DWORD *)v8 + 2);
        BOOL v92 = v97 >= v98;
        if (v97 != v98) {
          goto LABEL_122;
        }
        unsigned int v99 = *((_DWORD *)v80 + 3);
        unsigned int v100 = *((_DWORD *)v8 + 3);
        BOOL v92 = v99 >= v100;
        if (v99 != v100) {
          goto LABEL_122;
        }
      }
      if ((*v80 & 0xF) == 0 || v84)
      {
LABEL_124:
        __n128 result = *(__n128 *)v8;
        long long v101 = *((_OWORD *)v8 + 1);
        v5[4] = v8[4];
        *(__n128 *)uint64_t v5 = result;
        *((_OWORD *)v5 + 1) = v101;
        v8 += 5;
        goto LABEL_125;
      }
LABEL_115:
      __n128 result = *(__n128 *)v80;
      long long v91 = *((_OWORD *)v80 + 1);
      v5[4] = v80[4];
      *(__n128 *)uint64_t v5 = result;
      *((_OWORD *)v5 + 1) = v91;
      v80 += 5;
LABEL_125:
      v5 += 5;
      if (v8 == v79)
      {
        if (v80 != a2)
        {
          uint64_t v102 = 0;
          do
          {
            uint64_t v103 = &v5[v102];
            __n128 result = *(__n128 *)&v80[v102];
            long long v104 = *(_OWORD *)&v80[v102 + 2];
            v103[4] = v80[v102 + 4];
            *(__n128 *)uint64_t v103 = result;
            *((_OWORD *)v103 + 1) = v104;
            v102 += 5;
          }
          while (&v80[v102] != a2);
        }
        return result;
      }
    }
    BOOL v92 = v82 >= v83 >> 4;
LABEL_122:
    if (v92) {
      goto LABEL_124;
    }
    goto LABEL_115;
  }
  if (a1 != a2)
  {
    __n128 result = *(__n128 *)a1;
    long long v26 = *((_OWORD *)a1 + 1);
    a4[4] = a1[4];
    *(__n128 *)a4 = result;
    *((_OWORD *)a4 + 1) = v26;
    BOOL v27 = a1 + 5;
    if (a1 + 5 != a2)
    {
      uint64_t v28 = 0;
      BOOL v29 = a4;
      do
      {
        unsigned int v30 = v8;
        unsigned int v31 = v29;
        long long v8 = v27;
        uint64_t v33 = *v29;
        v29 += 5;
        unsigned int v32 = v33;
        uint64_t v34 = v30[5];
        if (v34 >> 4 == v33 >> 4)
        {
          uint64_t v35 = v32 & 0xF;
          if ((v34 & 0xF) != 0 && v35 != 0)
          {
            unsigned int v44 = *((_DWORD *)v30 + 14);
            unsigned int v45 = *((_DWORD *)v31 + 4);
            BOOL v46 = v44 >= v45;
            if (v44 != v45) {
              goto LABEL_51;
            }
            unsigned int v47 = *((_DWORD *)v30 + 15);
            unsigned int v48 = *((_DWORD *)v31 + 5);
            BOOL v46 = v47 >= v48;
            if (v47 != v48) {
              goto LABEL_51;
            }
          }
          int v37 = v34 & 0xF;
          BOOL v38 = v37 == 1 || v37 == 8;
          int v39 = v32 & 0xF;
          BOOL v40 = v38 || v39 == 1;
          if (!v40 && v39 != 8)
          {
            unsigned int v49 = *((_DWORD *)v30 + 12);
            unsigned int v50 = *((_DWORD *)v31 + 2);
            BOOL v46 = v49 >= v50;
            if (v49 != v50 || (v51 = *((_DWORD *)v30 + 13), v52 = *((_DWORD *)v31 + 3), BOOL v46 = v51 >= v52, v51 != v52))
            {
LABEL_51:
              unsigned int v42 = v29;
              if (v46) {
                goto LABEL_86;
              }
LABEL_52:
              long long v53 = *((_OWORD *)v31 + 1);
              *(_OWORD *)BOOL v29 = *(_OWORD *)v31;
              *((_OWORD *)v29 + 1) = v53;
              v29[4] = v31[4];
              unsigned int v42 = v5;
              if (v31 == v5) {
                goto LABEL_86;
              }
              uint64_t v54 = v28;
              while (2)
              {
                uint64_t v55 = (uint64_t)v5 + v54;
                uint64_t v56 = *(uint64_t *)((char *)v5 + v54 - 40);
                uint64_t v57 = *v8;
                unsigned int v58 = *v8 >> 4;
                if (v58 == v56 >> 4)
                {
                  uint64_t v59 = *(uint64_t *)((char *)v5 + v54 - 40) & 0xF;
                  if ((v57 & 0xF) != 0 && v59 != 0)
                  {
                    unsigned int v68 = *((_DWORD *)v30 + 14);
                    unsigned int v69 = *(_DWORD *)((char *)v5 + v54 - 24);
                    BOOL v66 = v68 >= v69;
                    if (v68 != v69) {
                      goto LABEL_75;
                    }
                    unsigned int v70 = *((_DWORD *)v30 + 15);
                    unsigned int v71 = *(_DWORD *)((char *)v5 + v54 - 20);
                    BOOL v66 = v70 >= v71;
                    if (v70 != v71) {
                      goto LABEL_75;
                    }
                  }
                  int v61 = v57 & 0xF;
                  BOOL v62 = v61 == 1 || v61 == 8;
                  int v63 = v56 & 0xF;
                  BOOL v64 = v62 || v63 == 1;
                  if (!v64 && v63 != 8)
                  {
                    unsigned int v72 = *((_DWORD *)v30 + 12);
                    unsigned int v73 = *(_DWORD *)((char *)v5 + v54 - 32);
                    BOOL v66 = v72 >= v73;
                    if (v72 != v73) {
                      goto LABEL_75;
                    }
                    unsigned int v74 = *((_DWORD *)v30 + 13);
                    unsigned int v75 = *(_DWORD *)((char *)v5 + v54 - 28);
                    BOOL v66 = v74 >= v75;
                    if (v74 != v75) {
                      goto LABEL_75;
                    }
                  }
                  if ((*v8 & 0xF) == 0 || v59)
                  {
                    unsigned int v42 = (uint64_t *)((char *)v5 + v54);
                    goto LABEL_86;
                  }
                }
                else
                {
                  BOOL v66 = v58 >= v56 >> 4;
LABEL_75:
                  if (v66)
                  {
                    unsigned int v42 = v31;
                    goto LABEL_86;
                  }
                }
                v31 -= 5;
                long long v67 = *(_OWORD *)((char *)v5 + v54 - 24);
                *(_OWORD *)uint64_t v55 = *(_OWORD *)((char *)v5 + v54 - 40);
                *(_OWORD *)(v55 + 16) = v67;
                *(void *)(v55 + 32) = *(uint64_t *)((char *)v5 + v54 - 8);
                v54 -= 40;
                if (!v54)
                {
                  unsigned int v42 = v5;
                  goto LABEL_86;
                }
                continue;
              }
            }
          }
          unsigned int v42 = v29;
          if ((v30[5] & 0xF) != 0)
          {
            unsigned int v42 = v29;
            if (!v35) {
              goto LABEL_52;
            }
          }
        }
        else
        {
          unsigned int v43 = v32 >> 4;
          unsigned int v42 = v29;
          if (v34 >> 4 < v43) {
            goto LABEL_52;
          }
        }
LABEL_86:
        __n128 result = *(__n128 *)v8;
        long long v76 = *((_OWORD *)v8 + 1);
        v42[4] = v8[4];
        *(__n128 *)unsigned int v42 = result;
        *((_OWORD *)v42 + 1) = v76;
        BOOL v27 = v8 + 5;
        v28 += 40;
      }
      while (v8 + 5 != a2);
    }
  }
  return result;
}

long long *std::__inplace_merge<std::_ClassicAlgPolicy,RB::DisplayList::EditAdaptor::finalize(RB::DisplayList::Interpolator::Layer &)::$_1 &,RB::DisplayList::Interpolator::Op *>(long long *result, long long *a2, long long *a3, uint64_t a4, uint64_t a5, char *a6, uint64_t a7)
{
  if (!a5) {
    return result;
  }
  uint64_t v9 = a5;
  while (v9 > a7 && a4 > a7)
  {
    if (!a4) {
      return result;
    }
    uint64_t v12 = 0;
    unsigned int v13 = *(void *)a2 >> 4;
    uint64_t v14 = *(void *)a2 & 0xFLL;
    uint64_t v15 = -a4;
    while (1)
    {
      uint64_t v16 = *(void *)((char *)result + v12);
      if (v13 != v16 >> 4)
      {
        BOOL v19 = v13 >= v16 >> 4;
LABEL_23:
        if (!v19) {
          break;
        }
        goto LABEL_25;
      }
      if (v14)
      {
        if ((v16 & 0xF) != 0)
        {
          unsigned int v17 = *((_DWORD *)a2 + 4);
          unsigned int v18 = *(_DWORD *)((char *)result + v12 + 16);
          BOOL v19 = v17 >= v18;
          if (v17 != v18) {
            goto LABEL_23;
          }
          unsigned int v20 = *((_DWORD *)a2 + 5);
          unsigned int v21 = *(_DWORD *)((char *)result + v12 + 20);
          BOOL v19 = v20 >= v21;
          if (v20 != v21) {
            goto LABEL_23;
          }
        }
      }
      if (v14 != 1 && v14 != 8)
      {
        int v22 = v16 & 0xF;
        if (v22 != 1 && v22 != 8)
        {
          unsigned int v24 = *((_DWORD *)a2 + 2);
          unsigned int v25 = *(_DWORD *)((char *)result + v12 + 8);
          BOOL v19 = v24 >= v25;
          if (v24 != v25) {
            goto LABEL_23;
          }
          unsigned int v26 = *((_DWORD *)a2 + 3);
          unsigned int v27 = *(_DWORD *)((char *)result + v12 + 12);
          BOOL v19 = v26 >= v27;
          if (v26 != v27) {
            goto LABEL_23;
          }
        }
      }
      if (v14 && (*(void *)((unsigned char *)result + v12) & 0xFLL) == 0) {
        break;
      }
LABEL_25:
      v12 += 40;
      BOOL v19 = __CFADD__(v15++, 1);
      if (v19) {
        return result;
      }
    }
    uint64_t v28 = -v15;
    BOOL v29 = (long long *)((char *)result + v12);
    v144 = a3;
    __src = a6;
    v142 = (char *)result + v12;
    uint64_t v143 = a7;
    if (-v15 >= v9)
    {
      if (v15 == -1)
      {
        v135 = (char *)result + v12;
        uint64_t v148 = *((void *)v135 + 4);
        long long v146 = *(_OWORD *)v135;
        long long v147 = *((_OWORD *)v135 + 1);
        long long v136 = *a2;
        long long v137 = a2[1];
        *((void *)v135 + 4) = *((void *)a2 + 4);
        *(_OWORD *)v135 = v136;
        *((_OWORD *)v135 + 1) = v137;
        *((void *)a2 + 4) = v148;
        *a2 = v146;
        a2[1] = v147;
        return result;
      }
      if (v15 > 0) {
        uint64_t v28 = 1 - v15;
      }
      uint64_t v53 = v28 >> 1;
      unsigned int v42 = (long long *)((char *)result + 40 * (v28 >> 1) + v12);
      if (a3 == a2)
      {
        unsigned int v32 = a3;
LABEL_94:
        uint64_t v31 = 0xCCCCCCCCCCCCCCCDLL * (((char *)v32 - (char *)a2) >> 3);
        goto LABEL_95;
      }
      unint64_t v54 = 0xCCCCCCCCCCCCCCCDLL * (((char *)a3 - (char *)a2) >> 3);
      unsigned int v55 = *(void *)v42 >> 4;
      uint64_t v56 = *(void *)v42 & 0xFLL;
      uint64_t v57 = (_DWORD *)((char *)result + 40 * v53 + v12);
      unsigned int v58 = v57[4];
      unsigned int v59 = v57[5];
      unsigned int v60 = v57[2];
      unsigned int v61 = v57[3];
      unsigned int v32 = a2;
      while (2)
      {
        unint64_t v62 = v54 >> 1;
        int v63 = (void *)v32 + 5 * (v54 >> 1);
        uint64_t v64 = *v63;
        unsigned int v65 = *v63 >> 4;
        BOOL v66 = v65 >= v55;
        if (v65 != v55) {
          goto LABEL_87;
        }
        if (v56)
        {
          if ((v64 & 0xF) != 0)
          {
            unsigned int v67 = *((_DWORD *)v32 + 10 * v62 + 4);
            BOOL v66 = v67 >= v58;
            if (v67 != v58) {
              goto LABEL_87;
            }
            unsigned int v68 = *((_DWORD *)v32 + 10 * v62 + 5);
            BOOL v66 = v68 >= v59;
            if (v68 != v59) {
              goto LABEL_87;
            }
          }
        }
        int v69 = v64 & 0xF;
        BOOL v70 = v69 == 1 || v69 == 8;
        BOOL v71 = v70 || v56 == 1;
        BOOL v72 = v71 || v56 == 8;
        if (v72
          || (v73 = *((_DWORD *)v32 + 10 * v62 + 2), BOOL v66 = v73 >= v60, v73 == v60)
          && (v74 = *((_DWORD *)v32 + 10 * v62 + 3), BOOL v66 = v74 >= v61, v74 == v61))
        {
          if (!v56 && (*v63 & 0xFLL) != 0)
          {
LABEL_88:
            unsigned int v32 = (long long *)(v63 + 5);
            unint64_t v62 = v54 + ~v62;
          }
        }
        else
        {
LABEL_87:
          if (!v66) {
            goto LABEL_88;
          }
        }
        unint64_t v54 = v62;
        if (!v62) {
          goto LABEL_94;
        }
        continue;
      }
    }
    if (v9 >= 0) {
      uint64_t v30 = v9;
    }
    else {
      uint64_t v30 = v9 + 1;
    }
    uint64_t v31 = v30 >> 1;
    unsigned int v32 = (long long *)((char *)a2 + 40 * (v30 >> 1));
    if (v29 != a2)
    {
      uint64_t v33 = (char *)result + v12;
      unint64_t v34 = 0xCCCCCCCCCCCCCCCDLL * (((char *)a2 - (char *)result - v12) >> 3);
      unsigned int v35 = *(void *)v32 >> 4;
      uint64_t v36 = *(void *)v32 & 0xFLL;
      int v37 = (_DWORD *)a2 + 10 * v31;
      unsigned int v38 = v37[4];
      unsigned int v39 = v37[5];
      unsigned int v40 = v37[2];
      unsigned int v41 = v37[3];
      unsigned int v42 = v29;
      while (1)
      {
        unint64_t v43 = v34 >> 1;
        unsigned int v44 = (void *)v42 + 5 * (v34 >> 1);
        uint64_t v45 = *v44;
        if (v35 != *v44 >> 4) {
          break;
        }
        if (v36)
        {
          if ((v45 & 0xF) != 0)
          {
            unsigned int v46 = *((_DWORD *)v42 + 10 * v43 + 4);
            BOOL v47 = v38 >= v46;
            if (v38 != v46) {
              goto LABEL_53;
            }
            unsigned int v48 = *((_DWORD *)v42 + 10 * v43 + 5);
            BOOL v47 = v39 >= v48;
            if (v39 != v48) {
              goto LABEL_53;
            }
          }
        }
        if (v36 != 1 && v36 != 8)
        {
          int v49 = v45 & 0xF;
          if (v49 != 1 && v49 != 8)
          {
            unsigned int v51 = *((_DWORD *)v42 + 10 * v43 + 2);
            BOOL v47 = v40 >= v51;
            if (v40 != v51) {
              goto LABEL_53;
            }
            unsigned int v52 = *((_DWORD *)v42 + 10 * v43 + 3);
            BOOL v47 = v41 >= v52;
            if (v41 != v52) {
              goto LABEL_53;
            }
          }
        }
        if (v36 && (*v44 & 0xFLL) == 0) {
          goto LABEL_56;
        }
LABEL_55:
        unsigned int v42 = (long long *)(v44 + 5);
        unint64_t v43 = v34 + ~v43;
LABEL_56:
        unint64_t v34 = v43;
        if (!v43) {
          goto LABEL_92;
        }
      }
      BOOL v47 = v35 >= v45 >> 4;
LABEL_53:
      if (!v47) {
        goto LABEL_56;
      }
      goto LABEL_55;
    }
    uint64_t v33 = (char *)result + v12;
    unsigned int v42 = a2;
LABEL_92:
    uint64_t v53 = 0xCCCCCCCCCCCCCCCDLL * (((char *)v42 - v33) >> 3);
LABEL_95:
    a4 = -(v53 + v15);
    uint64_t v75 = v9 - v31;
    long long v76 = std::__rotate[abi:nn180100]<std::_ClassicAlgPolicy,RB::DisplayList::Interpolator::Op *,RB::DisplayList::Interpolator::Op *>(v42, a2, v32);
    a3 = v76;
    if (v53 + v31 >= v9 - (v53 + v31) - v15)
    {
      std::__inplace_merge<std::_ClassicAlgPolicy,RB::DisplayList::EditAdaptor::finalize(RB::DisplayList::Interpolator::Layer &)::$_1 &,RB::DisplayList::Interpolator::Op *>(v76, v32, v144, -(v53 + v15), v75, __src, v143);
      unsigned int v32 = v42;
      a7 = v143;
      uint64_t v75 = v31;
      a6 = __src;
      a4 = v53;
      __n128 result = (long long *)v142;
    }
    else
    {
      __n128 v77 = v42;
      uint64_t v78 = v31;
      a6 = __src;
      a7 = v143;
      std::__inplace_merge<std::_ClassicAlgPolicy,RB::DisplayList::EditAdaptor::finalize(RB::DisplayList::Interpolator::Layer &)::$_1 &,RB::DisplayList::Interpolator::Op *>(v142, v77, v76, v53, v78, __src, v143);
      __n128 result = a3;
      a3 = v144;
    }
    uint64_t v9 = v75;
    a2 = v32;
    if (!v75) {
      return result;
    }
  }
  if (a4 > v9)
  {
    if (a2 == a3) {
      return result;
    }
    uint64_t v79 = 0;
    do
    {
      unsigned int v80 = &a6[v79];
      long long v81 = *(long long *)((char *)a2 + v79);
      long long v82 = *(long long *)((char *)a2 + v79 + 16);
      *((void *)v80 + 4) = *(void *)((char *)a2 + v79 + 32);
      *(_OWORD *)unsigned int v80 = v81;
      *((_OWORD *)v80 + 1) = v82;
      v79 += 40;
    }
    while ((long long *)((char *)a2 + v79) != a3);
    if (!v79) {
      return result;
    }
    uint64_t v83 = &a6[v79];
    for (uint64_t i = (char *)a3 - 40; ; i -= 40)
    {
      if (a2 == result)
      {
        uint64_t v138 = 0;
        do
        {
          v139 = &i[v138];
          long long v140 = *(_OWORD *)&v83[v138 - 40];
          long long v141 = *(_OWORD *)&v83[v138 - 24];
          *((void *)v139 + 4) = *(void *)&v83[v138 - 8];
          *(_OWORD *)v139 = v140;
          *((_OWORD *)v139 + 1) = v141;
          v138 -= 40;
        }
        while (&v83[v138] != a6);
        return result;
      }
      int v85 = (char *)a2 - 40;
      uint64_t v86 = *((void *)a2 - 5);
      uint64_t v87 = *((void *)v83 - 5);
      if (v87 >> 4 == v86 >> 4) {
        break;
      }
      unsigned int v95 = (long long *)((char *)a2 - 40);
      if (v87 >> 4 >= v86 >> 4) {
        goto LABEL_128;
      }
LABEL_129:
      long long v96 = *(_OWORD *)v85;
      long long v97 = *((_OWORD *)v85 + 1);
      *((void *)i + 4) = *((void *)v85 + 4);
      *(_OWORD *)uint64_t i = v96;
      *((_OWORD *)i + 1) = v97;
      a2 = v95;
      if (v83 == a6) {
        return result;
      }
    }
    uint64_t v88 = *((void *)a2 - 5) & 0xFLL;
    if ((v87 & 0xF) != 0 && v88 != 0)
    {
      unsigned int v98 = *((_DWORD *)v83 - 6);
      unsigned int v99 = *((_DWORD *)a2 - 6);
      BOOL v100 = v98 >= v99;
      if (v98 != v99) {
        goto LABEL_136;
      }
      unsigned int v101 = *((_DWORD *)v83 - 5);
      unsigned int v102 = *((_DWORD *)a2 - 5);
      BOOL v100 = v101 >= v102;
      if (v101 != v102) {
        goto LABEL_136;
      }
    }
    int v90 = v87 & 0xF;
    BOOL v91 = v90 == 1 || v90 == 8;
    int v92 = v86 & 0xF;
    BOOL v93 = v91 || v92 == 1;
    BOOL v94 = v93 || v92 == 8;
    if (v94
      || (v103 = *((_DWORD *)v83 - 8), v104 = *((_DWORD *)a2 - 8), BOOL v100 = v103 >= v104, v103 == v104)
      && (v105 = *((_DWORD *)v83 - 7), v106 = *((_DWORD *)a2 - 7), BOOL v100 = v105 >= v106, v105 == v106))
    {
      if ((*((void *)v83 - 5) & 0xFLL) != 0)
      {
        unsigned int v95 = (long long *)((char *)a2 - 40);
        if (!v88) {
          goto LABEL_129;
        }
      }
    }
    else
    {
LABEL_136:
      unsigned int v95 = (long long *)((char *)a2 - 40);
      if (!v100) {
        goto LABEL_129;
      }
    }
LABEL_128:
    int v85 = v83 - 40;
    unsigned int v95 = a2;
    v83 -= 40;
    goto LABEL_129;
  }
  if (result == a2) {
    return result;
  }
  uint64_t v107 = 0;
  do
  {
    unsigned int v108 = &a6[v107];
    long long v109 = *(long long *)((char *)result + v107);
    long long v110 = *(long long *)((char *)result + v107 + 16);
    *((void *)v108 + 4) = *(void *)((char *)result + v107 + 32);
    *(_OWORD *)unsigned int v108 = v109;
    *((_OWORD *)v108 + 1) = v110;
    v107 += 40;
  }
  while ((long long *)((char *)result + v107) != a2);
  if (!v107) {
    return result;
  }
  unsigned int v111 = a6;
  while (a2 != a3)
  {
    uint64_t v112 = *(void *)a2;
    unsigned int v113 = *(void *)a2 >> 4;
    uint64_t v114 = *(void *)v111;
    if (v113 != *(void *)v111 >> 4)
    {
      BOOL v124 = v113 >= v114 >> 4;
LABEL_165:
      if (v124) {
        goto LABEL_167;
      }
      goto LABEL_163;
    }
    uint64_t v115 = *(void *)v111 & 0xFLL;
    if ((v112 & 0xF) != 0 && v115 != 0)
    {
      unsigned int v127 = *((_DWORD *)a2 + 4);
      unsigned int v128 = *((_DWORD *)v111 + 4);
      BOOL v124 = v127 >= v128;
      if (v127 != v128) {
        goto LABEL_165;
      }
      unsigned int v129 = *((_DWORD *)a2 + 5);
      unsigned int v130 = *((_DWORD *)v111 + 5);
      BOOL v124 = v129 >= v130;
      if (v129 != v130) {
        goto LABEL_165;
      }
    }
    int v117 = v112 & 0xF;
    BOOL v118 = v117 == 1 || v117 == 8;
    int v119 = v114 & 0xF;
    BOOL v120 = v118 || v119 == 1;
    if (!v120 && v119 != 8)
    {
      unsigned int v131 = *((_DWORD *)a2 + 2);
      unsigned int v132 = *((_DWORD *)v111 + 2);
      BOOL v124 = v131 >= v132;
      if (v131 != v132) {
        goto LABEL_165;
      }
      unsigned int v133 = *((_DWORD *)a2 + 3);
      unsigned int v134 = *((_DWORD *)v111 + 3);
      BOOL v124 = v133 >= v134;
      if (v133 != v134) {
        goto LABEL_165;
      }
    }
    if ((*(void *)a2 & 0xFLL) == 0 || v115)
    {
LABEL_167:
      long long v125 = *(_OWORD *)v111;
      long long v126 = *((_OWORD *)v111 + 1);
      *((void *)result + 4) = *((void *)v111 + 4);
      *__n128 result = v125;
      result[1] = v126;
      v111 += 40;
      goto LABEL_168;
    }
LABEL_163:
    long long v122 = *a2;
    long long v123 = a2[1];
    *((void *)result + 4) = *((void *)a2 + 4);
    *__n128 result = v122;
    result[1] = v123;
    a2 = (long long *)((char *)a2 + 40);
LABEL_168:
    __n128 result = (long long *)((char *)result + 40);
    if (&a6[v107] == v111) {
      return result;
    }
  }
  return (long long *)memmove(result, v111, a6 - v111 + v107);
}

long long *std::__rotate[abi:nn180100]<std::_ClassicAlgPolicy,RB::DisplayList::Interpolator::Op *,RB::DisplayList::Interpolator::Op *>(long long *__src, long long *a2, long long *a3)
{
  BOOL v4 = a3;
  if (__src != a2)
  {
    if (a2 == a3)
    {
      return __src;
    }
    else if ((long long *)((char *)__src + 40) == a2)
    {
      long long v9 = *__src;
      long long v11 = __src[1];
      uint64_t v13 = *((void *)__src + 4);
      int64_t v6 = (char *)a3 - (char *)a2;
      memmove(__src, a2, (char *)a3 - (char *)a2);
      BOOL v4 = (long long *)((char *)__src + v6);
      *BOOL v4 = v9;
      v4[1] = v11;
      *((void *)v4 + 4) = v13;
    }
    else if ((long long *)((char *)a2 + 40) == a3)
    {
      BOOL v4 = (long long *)((char *)__src + 40);
      long long v10 = *(long long *)((char *)a3 - 40);
      long long v12 = *(long long *)((char *)a3 - 24);
      uint64_t v14 = *((void *)a3 - 1);
      size_t v7 = (char *)a3 - 40 - (char *)__src;
      if ((long long *)((char *)a3 - 40) != __src) {
        memmove((char *)__src + 40, __src, v7);
      }
      char *__src = v10;
      __src[1] = v12;
      *((void *)__src + 4) = v14;
    }
    else
    {
      return std::__rotate_gcd[abi:nn180100]<std::_ClassicAlgPolicy,RB::DisplayList::Interpolator::Op *>(__src, a2, a3);
    }
  }
  return v4;
}

long long *std::__rotate_gcd[abi:nn180100]<std::_ClassicAlgPolicy,RB::DisplayList::Interpolator::Op *>(long long *a1, long long *a2, long long *a3)
{
  unint64_t v3 = 0xCCCCCCCCCCCCCCCDLL * (((char *)a2 - (char *)a1) >> 3);
  if (v3 == 0xCCCCCCCCCCCCCCCDLL * (((char *)a3 - (char *)a2) >> 3))
  {
    if (a1 != a2 && a2 != a3)
    {
      uint64_t v4 = 0;
      do
      {
        uint64_t v5 = (uint64_t)a2 + v4;
        uint64_t v6 = (uint64_t)a1 + v4;
        long long v7 = *(long long *)((char *)a1 + v4);
        long long v8 = *(long long *)((char *)a1 + v4 + 16);
        uint64_t v9 = *(void *)((char *)a1 + v4 + 32);
        uint64_t v10 = *(void *)((char *)a2 + v4 + 32);
        long long v11 = *(long long *)((char *)a2 + v4 + 16);
        *(_OWORD *)uint64_t v6 = *(long long *)((char *)a2 + v4);
        *(_OWORD *)(v6 + 16) = v11;
        *(void *)(v6 + 32) = v10;
        *(void *)(v5 + 32) = v9;
        *(_OWORD *)uint64_t v5 = v7;
        *(_OWORD *)(v5 + 16) = v8;
        if ((long long *)((char *)a1 + v4 + 40) == a2) {
          break;
        }
        v4 += 40;
      }
      while ((long long *)(v5 + 40) != a3);
    }
  }
  else
  {
    uint64_t v12 = 0xCCCCCCCCCCCCCCCDLL * (((char *)a3 - (char *)a2) >> 3);
    unint64_t v13 = 0xCCCCCCCCCCCCCCCDLL * (((char *)a2 - (char *)a1) >> 3);
    do
    {
      uint64_t v14 = v13;
      unint64_t v13 = v12;
      uint64_t v12 = v14 % v12;
    }
    while (v12);
    if (v13)
    {
      uint64_t v15 = (long long *)((char *)a1 + 40 * v13);
      do
      {
        long long v16 = *(long long *)((char *)v15 - 40);
        long long v17 = *(long long *)((char *)v15 - 24);
        uint64_t v18 = *((void *)v15 - 1);
        uint64_t v15 = (long long *)((char *)v15 - 40);
        long long v29 = v16;
        long long v30 = v17;
        uint64_t v31 = v18;
        BOOL v19 = (long long *)((char *)v15 + 8 * (((char *)a2 - (char *)a1) >> 3));
        unsigned int v20 = v15;
        do
        {
          unsigned int v21 = v20;
          unsigned int v20 = v19;
          long long v22 = *v19;
          long long v23 = v19[1];
          *((void *)v21 + 4) = *((void *)v19 + 4);
          *unsigned int v21 = v22;
          v21[1] = v23;
          unint64_t v24 = 0xCCCCCCCCCCCCCCCDLL * (((char *)a3 - (char *)v19) >> 3);
          BOOL v25 = __OFSUB__(v3, v24);
          uint64_t v27 = v3 - v24;
          char v26 = (v27 < 0) ^ v25;
          BOOL v19 = (long long *)((char *)a1 + 40 * v27);
          if (v26) {
            BOOL v19 = (long long *)((char *)v20 + 8 * (((char *)a2 - (char *)a1) >> 3));
          }
        }
        while (v19 != v15);
        *((void *)v20 + 4) = v31;
        long long *v20 = v29;
        v20[1] = v30;
      }
      while (v15 != a1);
    }
    return (long long *)((char *)a1 + 8 * (((char *)a3 - (char *)a2) >> 3));
  }
  return a2;
}

void *RB::vector<RB::DisplayList::Interpolator::Op,4ul,unsigned int>::reserve_slow(void *__dst, unsigned int a2)
{
  if (*((_DWORD *)__dst + 43) + (*((_DWORD *)__dst + 43) >> 1) <= a2) {
    unsigned int v3 = a2;
  }
  else {
    unsigned int v3 = *((_DWORD *)__dst + 43) + (*((_DWORD *)__dst + 43) >> 1);
  }
  __n128 result = RB::details::realloc_vector<unsigned int,40ul>(*((void **)__dst + 20), __dst, 4u, (_DWORD *)__dst + 43, v3);
  *((void *)__dst + 20) = result;
  return result;
}

void *RB::details::realloc_vector<unsigned int,40ul>(void *__src, void *__dst, unsigned int a3, _DWORD *a4, unsigned int a5)
{
  long long v7 = __src;
  if (a5 <= a3)
  {
    if (__src)
    {
      LODWORD(v9) = a3;
      memcpy(__dst, __src, 40 * a5);
      free(v7);
      uint64_t v12 = 0;
LABEL_8:
      *a4 = v9;
      return v12;
    }
  }
  else
  {
    size_t v8 = malloc_good_size(40 * a5);
    unint64_t v9 = v8 / 0x28;
    if (*a4 != (v8 / 0x28))
    {
      uint64_t v10 = malloc_type_realloc(v7, v8, 0x66ED1BA4uLL);
      if (!v10) {
        RB::precondition_failure((RB *)"allocation failure", v11);
      }
      uint64_t v12 = v10;
      if (!v7) {
        memcpy(v10, __dst, 40 * *a4);
      }
      goto LABEL_8;
    }
  }
  return v7;
}

void RB::Fill::MeshGradient::Data::finalize(RB::Fill::MeshGradient::Data *this)
{
  (*(void (**)(RB::Fill::MeshGradient::Data *))(*(void *)this + 16))(this);
  free(this);
}

uint64_t RB::Fill::MeshGradient::valid_config(unsigned __int8 *a1, unint64_t a2, unint64_t a3, void *a4)
{
  int v4 = *a1;
  uint64_t result = 1;
  switch(v4)
  {
    case 0:
      return result;
    case 1:
    case 2:
    case 5:
      uint64_t result = 0;
      if (a2 >= 4 && a3 >= 2 && !((a3 | a2) >> 32))
      {
        unsigned int v6 = a2 / a3;
        if (a2 / a3 * a3 != a2) {
          goto LABEL_12;
        }
        BOOL v7 = v4 == 5;
        unint64_t v8 = 0x4000;
        if (v7) {
          unint64_t v8 = 0x10000;
        }
        if ((a3 - 1) * (unint64_t)(v6 - 1) >= v8) {
          goto LABEL_12;
        }
        if (a4) {
          *a4 = __PAIR64__(v6, a3);
        }
        uint64_t result = 1;
      }
      break;
    case 3:
    case 4:
      BOOL v9 = a2 - 1 >= 0x4000;
      goto LABEL_16;
    case 6:
      BOOL v9 = a2 - 1 >= 0x5555;
LABEL_16:
      uint64_t result = !v9;
      break;
    default:
LABEL_12:
      uint64_t result = 0;
      break;
  }
  return result;
}

uint64_t RB::Fill::MeshGradient::MeshGradient(uint64_t a1, int a2, unint64_t a3, unint64_t a4, const void *a5, float32x4_t *a6, uint64_t a7, char a8)
{
  unsigned __int8 v22 = a2;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = 0;
  *(_DWORD *)(a1 + 24) = 0;
  __int16 v13 = *(_WORD *)(a7 + 8);
  *(void *)(a1 + 28) = *(void *)a7;
  *(_WORD *)(a1 + 36) = v13;
  *(unsigned char *)(a1 + 38) = a8;
  *(unsigned char *)(a1 + 39) = *(unsigned char *)(a1 + 39) & 0xE0 | 0x10;
  *(unsigned char *)(a1 + 40) = 0;
  if (RB::Fill::MeshGradient::valid_config(&v22, a3, a4, (void *)a1))
  {
    unsigned int v20 = 0;
    uint64_t v21 = 0;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    if (RB::Fill::MeshGradient::allocate_data(a1, a2, a3, &v20, &v18))
    {
      memcpy(v20, a5, 8 * v21);
      uint64_t v14 = v19;
      if (v19)
      {
        uint64_t v15 = v18;
        do
        {
          float32x4_t v16 = *a6++;
          *v15++ = vcvt_f16_f32(v16);
          --v14;
        }
        while (v14);
      }
      RB::Fill::MeshGradient::update_colors((RB::Fill::MeshGradient *)a1);
    }
  }
  return a1;
}

void sub_214207400(_Unwind_Exception *exception_object)
{
  unsigned int v3 = *(atomic_uint **)(v1 + 8);
  if (v3) {
    RB::Fill::MeshGradient::MeshGradient(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t RB::Fill::MeshGradient::allocate_data(uint64_t a1, int a2, unint64_t a3, void *a4, void *a5)
{
  uint64_t v5 = RB::Fill::MeshGradient::points_per_elt[a2];
  uint64_t v6 = RB::Fill::MeshGradient::colors_per_elt[a2];
  uint64_t v7 = 8 * (v6 + v5);
  int v8 = a3 * v7;
  BOOL v10 = (a3 * (unsigned __int128)(unint64_t)v7) >> 64 == 0;
  unint64_t v9 = (a3 * v7) >> 32;
  BOOL v10 = v10 && v9 == 0;
  int v11 = !v10;
  if (v10)
  {
    char v15 = a2;
    long long v17 = malloc_type_malloc((v8 & 0xFFFFFFF8) + 16, 0x8AEC0A08uLL);
    uint64_t v18 = v17;
    if (v17)
    {
      v17[2] = 1;
      v17[3] = v8;
      *(void *)long long v17 = &unk_26C4E8158;
    }
    uint64_t v19 = *(atomic_uint **)(a1 + 8);
    *(void *)(a1 + 8) = v18;
    if (v19 && atomic_fetch_add_explicit(v19 + 2, 0xFFFFFFFF, memory_order_release) == 1)
    {
      __dmb(9u);
      (*(void (**)(atomic_uint *))(*(void *)v19 + 8))(v19);
    }
    *(unsigned char *)(a1 + 39) = *(unsigned char *)(a1 + 39) & 0xF0 | v15 & 0xF;
    *(_DWORD *)(a1 + 24) = a3;
    *a4 = v18 + 4;
    a4[1] = v5 * a3;
    *a5 = &v18[2 * v5 * a3 + 4];
    a5[1] = v6 * a3;
  }
  return v11 ^ 1u;
}

uint64_t RB::Fill::MeshGradient::update_colors(RB::Fill::MeshGradient *this)
{
  int v2 = *((_DWORD *)this + 6);
  char v3 = *((unsigned char *)this + 39);
  uint64_t v4 = v2 * RB::Fill::MeshGradient::colors_per_elt[v3 & 0xF];
  if (v4)
  {
    uint64_t v5 = (float16x4_t *)(*((void *)this + 1)
                       + 8 * v2 * RB::Fill::MeshGradient::points_per_elt[v3 & 0xF]
                       + 16);
    uint64_t v6 = 8 * v4;
    LOBYTE(v4) = 1;
    float v7 = -INFINITY;
    float v8 = INFINITY;
    do
    {
      float16x4_t v9 = *v5++;
      float32x4_t v10 = vcvtq_f32_f16(v9);
      LODWORD(v4) = v4 & (v10.f32[3] == 1.0);
      float v11 = fminf(fminf(v10.f32[0], v10.f32[2]), v10.f32[1]);
      if (v11 < v8) {
        float v8 = v11;
      }
      float v12 = fmaxf(fmaxf(v10.f32[0], v10.f32[2]), v10.f32[1]);
      if (v7 < v12) {
        float v7 = v12;
      }
      v6 -= 8;
    }
    while (v6);
    if (v4) {
      char v13 = 16;
    }
    else {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 16;
    float v8 = INFINITY;
    float v7 = -INFINITY;
  }
  *((unsigned char *)this + 39) = v13 | v3 & 0xEF;
  uint64_t v14 = (RB *)RB::Fill::Color::required_depth((float16x4_t *)((char *)this + 28));
  unsigned int v15 = v14;
  int v16 = RB::required_color_depth(v14, v8, v7);
  uint64_t result = RB::max_color_depth(v15, v16);
  *((unsigned char *)this + 40) = result;
  return result;
}

uint64_t RB::Fill::MeshGradient::MeshGradient(uint64_t a1, uint64_t a2, __int16 a3, RB::Heap *this)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  if (v5) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v5 + 8), 1u, memory_order_relaxed);
  }
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = 0;
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  if (*(unsigned char *)(a2 + 37)) {
    a3 = *(_WORD *)(a2 + 36);
  }
  *(void *)(a1 + 28) = *(void *)(a2 + 28);
  *(_WORD *)(a1 + 36) = a3;
  *(unsigned char *)(a1 + 38) = *(unsigned char *)(a2 + 38);
  char v7 = *(unsigned char *)(a1 + 39) & 0xF0 | *(unsigned char *)(a2 + 39) & 0xF;
  *(unsigned char *)(a1 + 39) = v7;
  *(unsigned char *)(a1 + 39) = v7 & 0xEF | *(unsigned char *)(a2 + 39) & 0x10;
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  float v8 = *(long long **)(a2 + 16);
  if (v8)
  {
    float16x4_t v9 = (_OWORD *)((*((void *)this + 2) + 15) & 0xFFFFFFFFFFFFFFF0);
    if ((unint64_t)(v9 + 3) > *((void *)this + 3)) {
      float16x4_t v9 = (_OWORD *)RB::Heap::alloc_slow((size_t *)this, 0x30uLL, 15);
    }
    else {
      *((void *)this + 2) = v9 + 3;
    }
    long long v10 = *v8;
    long long v11 = v8[2];
    v9[1] = v8[1];
    v9[2] = v11;
    *float16x4_t v9 = v10;
    *(void *)(a1 + 16) = v9;
  }
  return a1;
}

void sub_214207768(_Unwind_Exception *exception_object)
{
  char v3 = *(atomic_uint **)(v1 + 8);
  if (v3) {
    RB::Fill::MeshGradient::MeshGradient(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t RB::Fill::MeshGradient::MeshGradient(uint64_t a1, uint64_t a2, __int16 a3, RB::Heap *a4)
{
  return RB::Fill::MeshGradient::MeshGradient(a1, a2, a3, a4);
}

uint64_t RB::Fill::MeshGradient::copy_on_write_data(uint64_t a1, uint64_t *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 8);
  if (!v3) {
    return 0;
  }
  if (*(_DWORD *)(v3 + 8) == 1)
  {
    __dmb(9u);
    uint64_t v7 = *(void *)(a1 + 8) + 16;
  }
  else
  {
    size_t v9 = *(unsigned int *)(v3 + 12);
    uint64_t result = (uint64_t)malloc_type_malloc(v9 + 16, 0x8AEC0A08uLL);
    if (!result) {
      return result;
    }
    uint64_t v10 = result;
    *(_DWORD *)(result + 8) = 1;
    *(_DWORD *)(result + 12) = v9;
    *(void *)uint64_t result = &unk_26C4E8158;
    uint64_t v7 = result + 16;
    memcpy((void *)(result + 16), (const void *)(*(void *)(a1 + 8) + 16), v9);
    long long v11 = *(atomic_uint **)(a1 + 8);
    *(void *)(a1 + 8) = v10;
    if (v11)
    {
      if (atomic_fetch_add_explicit(v11 + 2, 0xFFFFFFFF, memory_order_release) == 1)
      {
        __dmb(9u);
        (*(void (**)(atomic_uint *))(*(void *)v11 + 8))(v11);
      }
    }
  }
  int v12 = *(_DWORD *)(a1 + 24);
  uint64_t v13 = *(unsigned char *)(a1 + 39) & 0xF;
  uint64_t v14 = v12 * RB::Fill::MeshGradient::points_per_elt[v13];
  uint64_t v15 = v12 * RB::Fill::MeshGradient::colors_per_elt[v13];
  *a2 = v7;
  a2[1] = v14;
  *a3 = v7 + 8 * v14;
  a3[1] = v15;
  return 1;
}

void RB::Fill::MeshGradient::append_color_matrix(uint64_t a1, float16x4_t *a2, uint64_t a3, __int16 a4)
{
  unsigned __int8 v4 = a4;
  *(unsigned char *)(a1 + 39) |= 0x10u;
  int v7 = HIBYTE(a4);
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  if (RB::Fill::MeshGradient::copy_on_write_data(a1, &v21, &v19) && v20)
  {
    size_t v9 = v19;
    uint64_t v10 = 8 * v20;
    do
    {
      uint16x4_t v11 = *v9;
      __int16 v12 = *(_WORD *)(a1 + 36);
      uint16x4_t v17 = *v9;
      __int16 v18 = v12;
      if (v7) {
        RB::Fill::Color::convert((uint64_t)&v17, v4, v11);
      }
      RB::operator*=((uint64_t)&v17, a2);
      uint16x4_t v8 = v17;
      short float v13 = *(short float *)&v17.i16[3];
      *v9++ = v17;
      unsigned int v14 = *(unsigned __int8 *)(a1 + 39);
      if (((v13 == COERCE_SHORT_FLOAT(COERCE_UNSIGNED_INT(1.0))) & (v14 >> 4)) != 0) {
        char v15 = 16;
      }
      else {
        char v15 = 0;
      }
      *(unsigned char *)(a1 + 39) = v15 | v14 & 0xEF;
      v10 -= 8;
    }
    while (v10);
  }
  if (v7)
  {
    uint64_t v16 = a1 + 28;
    RB::Fill::Color::convert(v16, v4, v8);
    RB::operator*=(v16, a2);
  }
}

uint64_t RB::Fill::MeshGradient::can_mix(RB::Fill::MeshGradient *this, const RB::Fill::MeshGradient *a2, const RB::AffineTransform *a3)
{
  if (((*((unsigned char *)a2 + 39) ^ *((unsigned char *)this + 39)) & 0xF) != 0
    || *((_DWORD *)this + 6) != *((_DWORD *)a2 + 6)
    || *((unsigned __int8 *)this + 38) != *((unsigned __int8 *)a2 + 38))
  {
    return 0;
  }
  LODWORD(result) = RB::can_mix(*((float64x2_t **)this + 2), *((float64x2_t **)a2 + 2), a3);
  if ((result & 0xFC) != 0) {
    return 2;
  }
  else {
    return result;
  }
}

void RB::Fill::MeshGradient::mix(RB::Fill::MeshGradient *this, const RB::DisplayList::Interpolator::Op *a2, const RB::Fill::MeshGradient *a3, double a4, RB::Heap *a5)
{
  if ((*(void *)a2 & 0xELL) == 2) {
    RB::Fill::MeshGradient::mix(this, a3, a4, a3);
  }
}

void RB::Fill::MeshGradient::mix(RB::Fill::MeshGradient *this, const RB::Fill::MeshGradient *a2, double a3, RB::Heap *a4)
{
  uint64_t v6 = (CGAffineTransform *)*((void *)this + 2);
  if (v6)
  {
    int v7 = (float64x2_t *)*((void *)a2 + 2);
    if (v7)
    {
      RB::mix(v6, v7, a4, *(float *)&a3);
      uint16x4_t v8 = (_OWORD *)*((void *)this + 2);
      *uint16x4_t v8 = v9;
      v8[1] = v10;
      v8[2] = v11;
    }
  }
  *((unsigned char *)this + 39) |= 0x10u;
  unsigned int v39 = 0;
  uint64_t v40 = 0;
  int v37 = 0;
  uint64_t v38 = 0;
  int v12 = RB::Fill::MeshGradient::copy_on_write_data((uint64_t)this, (uint64_t *)&v39, &v37);
  float v13 = *(float *)&a3;
  if (v12)
  {
    int v14 = *((_DWORD *)a2 + 6);
    char v15 = *((unsigned char *)a2 + 39);
    uint64_t v16 = *((void *)a2 + 1) + 16;
    uint64_t v17 = v40;
    if (v40)
    {
      __int16 v18 = v39;
      float32x2_t v19 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a3, 0);
      uint64_t v20 = (float32x2_t *)(*((void *)a2 + 1) + 16);
      do
      {
        float32x2_t v21 = *v20++;
        float32x2_t *v18 = vmla_f32(*v18, v19, vsub_f32(v21, *v18));
        ++v18;
        --v17;
      }
      while (v17);
    }
    uint64_t v22 = v38;
    if (v38)
    {
      long long v23 = (uint64_t *)(v16 + 8 * v14 * RB::Fill::MeshGradient::points_per_elt[v15 & 0xF]);
      unint64_t v24 = v37;
      do
      {
        __int16 v25 = *((_WORD *)this + 18);
        uint64_t v35 = *v24;
        __int16 v36 = v25;
        uint64_t v26 = *v23++;
        __int16 v27 = *((_WORD *)a2 + 18);
        uint64_t v33 = v26;
        __int16 v34 = v27;
        RB::Fill::Color::mix((uint64_t)&v35, (uint64_t)&v33, 0, v13);
        float v13 = *(float *)&a3;
        unsigned int v28 = *((unsigned __int8 *)this + 39);
        __int16 v29 = HIWORD(v35);
        if (((*((short float *)&v35 + 3) == COERCE_SHORT_FLOAT(COERCE_UNSIGNED_INT(1.0))) & (v28 >> 4)) != 0) {
          char v30 = 16;
        }
        else {
          char v30 = 0;
        }
        *((unsigned char *)this + 39) = v30 | v28 & 0xEF;
        uint64_t v31 = v35;
        HIWORD(v31) = v29;
        *v24++ = v31;
        --v22;
      }
      while (v22);
    }
  }
  RB::Fill::Color::mix((uint64_t)this + 28, (uint64_t)a2 + 28, 0, v13);
}

uint64_t RB::Fill::MeshGradient::get_alpha(RB::Fill::MeshGradient *this, float *a2)
{
  if ((*((unsigned char *)this + 39) & 0x10) == 0
    || *((short float *)this + 17) != COERCE_SHORT_FLOAT(COERCE_UNSIGNED_INT(1.0)))
  {
    return 0;
  }
  *a2 = 1.0;
  return 1;
}

float16x4_t RB::Fill::MeshGradient::ColorConversion::convert(uint64_t a1, float16x4_t *a2)
{
  float32x4_t v4 = vcvtq_f32_f16(*a2);
  int v5 = *(unsigned __int8 *)(a1 + 4);
  _S1 = v4.i32[3];
  __asm { FCVT            H1, S1 }
  __int16 v17 = v5 | 0x100;
  __asm { FCVT            S1, H1 }
  v4.f32[3] = *(float *)a1 * _S1;
  uint16x4_t v12 = (uint16x4_t)vcvt_f16_f32(v4);
  uint16x4_t v16 = v12;
  int v13 = *(unsigned __int8 *)(a1 + 5);
  if (v5 != v13) {
    RB::Fill::Color::convert((uint64_t)&v16, v13, v12);
  }
  if (*(unsigned char *)(a1 + 6)) {
    RB::Fill::Color::convert_to_oklab((RB::Fill::Color *)&v16);
  }
  v14.i32[0] = v16.i32[0];
  v14.i16[2] = v16.i16[2];
  v14.i16[3] = COERCE_UNSIGNED_INT(1.0);
  float16x4_t result = vmul_n_f16(v14, *(short float *)&v16.i16[3]);
  *a2 = result;
  return result;
}

void RB::Fill::MeshGradient::ColorConversion::convert_out_slow(uint64_t a1, RB::Fill::Color *this, int a3, uint16x4_t _D0)
{
  _D0.i16[0] = *((_WORD *)this + 3);
  if (*(short float *)_D0.i16 != COERCE_SHORT_FLOAT(COERCE_UNSIGNED_INT(1.0)))
  {
    __asm { FCMP            H0, #0 }
    if (!_ZF)
    {
      short float v11 = COERCE_SHORT_FLOAT(COERCE_UNSIGNED_INT(1.0)) / *(short float *)_D0.i16;
      *(short float *)this = *(short float *)this * v11;
      *((short float *)this + 1) = *((short float *)this + 1) * v11;
      *(short float *)_D0.i16 = *((short float *)this + 2) * v11;
      *((_WORD *)this + 2) = _D0.i16[0];
    }
  }
  if (*(unsigned char *)(a1 + 6)) {
    _D0 = (uint16x4_t)RB::Fill::Color::convert_from_oklab(this);
  }
  if (*(unsigned __int8 *)(a1 + 4) != a3)
  {
    RB::Fill::Color::convert((uint64_t)this, a3, _D0);
  }
}

float32x2_t *RB::Fill::MeshGradient::PatchBuffer::PatchBuffer(float32x2_t *a1, __int32 a2, __int32 a3, uint64_t a4, __int32 a5, int32x2_t a6, int32x2_t a7, int32x2_t a8)
{
  a8.i32[0] = 0;
  a1->i32[0] = a2;
  a1->i32[1] = a3;
  a1[1].i32[0] = a5;
  a1[4] = 0;
  a1[5].i32[0] = 0;
  a1[6] = 0;
  uint32x2_t v10 = (uint32x2_t)vceq_s32(a7, (int32x2_t)0x8000000080000000);
  int8x8_t v11 = (int8x8_t)vdup_lane_s32(vcgt_s32(a8, (int32x2_t)vpmin_u32(v10, v10)), 0);
  float32x2_t v12 = (float32x2_t)vbsl_s8(v11, (int8x8_t)0x100000001000000, (int8x8_t)vcvt_f32_s32(a6));
  int8x8_t v13 = vbsl_s8(v11, (int8x8_t)vdup_n_s32(0x7F7FFFFFu), (int8x8_t)vcvt_f32_s32(a7));
  int32x4_t v14 = *(int32x4_t *)(a4 + 16);
  float64x2_t v21 = *(float64x2_t *)a4;
  int32x4_t v22 = v14;
  float64x2_t v23 = *(float64x2_t *)(a4 + 32);
  if (RB::AffineTransform::invert((RB::AffineTransform *)&v21)) {
    char v15 = &v21;
  }
  else {
    char v15 = (float64x2_t *)a4;
  }
  int32x4_t v16 = (int32x4_t)v15[1];
  float64x2_t v17 = v15[2];
  float64x2_t v21 = *v15;
  int32x4_t v22 = v16;
  float64x2_t v23 = v17;
  *(int8x8_t *)v16.i8 = v13;
  float32x2_t v18 = RB::operator*(&v21, v12, v16);
  a1[2] = v18;
  a1[3] = vadd_f32(v19, v18);
  a1[5].f32[1] = RB::AffineTransform::scale((float64x2_t *)a4);
  return a1;
}

uint64_t RB::Fill::MeshGradient::PatchBuffer::alloc_patch(RB::Fill::MeshGradient::PatchBuffer *this)
{
  if (*((unsigned char *)this + 56))
  {
    uint64_t v2 = *((unsigned int *)this + 12);
    if (*((void *)this + 9) >= (unint64_t)(*(_DWORD *)this + v2)) {
      return *((void *)this + 8) + v2;
    }
    return 0;
  }
  uint64_t v4 = *((void *)this + 8);
  int v5 = *(_DWORD *)(v4 + 136);
  if (v5)
  {
    uint64_t v6 = *((unsigned int *)this + 12);
    uint64_t v7 = *(void *)(v4 + 128);
    if (v7) {
      uint64_t v8 = *(void *)(v4 + 128);
    }
    else {
      uint64_t v8 = *((void *)this + 8);
    }
    uint64_t v9 = (v5 - 1);
    uint64_t v10 = v8 + 32 * v9;
    if (*(void *)(v10 + 16) >= (unint64_t)(*(_DWORD *)this + v6)) {
      goto LABEL_16;
    }
    RB::RenderFrame::commit_buffer_region_size(*((void *)this + 9), v10, v6);
  }
  RB::RenderFrame::alloc_buffer_region(*((RB::RenderFrame **)this + 9), (RB::Device *)*(unsigned int *)this, *((unsigned int *)this + 1), 1, &v20);
  uint64_t v11 = v20;
  if (!v20) {
    return 0;
  }
  uint64_t v12 = *((void *)this + 8);
  long long v13 = v21;
  unsigned int v14 = *(_DWORD *)(v12 + 136);
  if (*(_DWORD *)(v12 + 140) < v14 + 1)
  {
    uint64_t v18 = v20;
    uint64_t v19 = *((void *)this + 8);
    long long v17 = v21;
    RB::vector<RB::Fill::MeshGradient::MeshBuffer,4ul,unsigned int>::reserve_slow((void *)v12, v14 + 1);
    long long v13 = v17;
    uint64_t v11 = v18;
    uint64_t v12 = v19;
    unsigned int v14 = *(_DWORD *)(v19 + 136);
  }
  LODWORD(v6) = 0;
  uint64_t v15 = *(void *)(v12 + 128);
  if (!v15) {
    uint64_t v15 = v12;
  }
  uint64_t v16 = v15 + 32 * v14;
  *(void *)uint64_t v16 = v11;
  *(_OWORD *)(v16 + 8) = v13;
  *(void *)(v16 + 24) = 0;
  ++*(_DWORD *)(v12 + 136);
  *((_DWORD *)this + 12) = 0;
  uint64_t v4 = *((void *)this + 8);
  uint64_t v7 = *(void *)(v4 + 128);
  uint64_t v9 = (*(_DWORD *)(v4 + 136) - 1);
LABEL_16:
  if (v7) {
    uint64_t v4 = v7;
  }
  return *(void *)(*(void *)(v4 + 32 * v9) + 56) + *(void *)(v4 + 32 * v9 + 8) + v6;
}

float32x2_t *RB::Fill::MeshGradient::PatchBuffer::commit_patch(float32x2_t *result, uint64_t a2)
{
  float32x2_t v7 = *(float32x2_t *)a2;
  float32x2_t v6 = *(float32x2_t *)(a2 + 8);
  float32x2_t v9 = *(float32x2_t *)(a2 + 16);
  float32x2_t v8 = *(float32x2_t *)(a2 + 24);
  float16x4_t v10 = (float16x4_t)vcvtq_f32_f16(*(float16x4_t *)(a2 + 32)).u64[0];
  float32x2_t v11 = vadd_f32(*(float32x2_t *)a2, (float32x2_t)v10);
  v10.i32[0] = *(_DWORD *)(a2 + 36);
  float32x2_t v12 = vadd_f32(v6, (float32x2_t)*(_OWORD *)&vcvtq_f32_f16(v10));
  float16x4_t v13 = (float16x4_t)vcvtq_f32_f16(*(float16x4_t *)(a2 + 40)).u64[0];
  float32x2_t v14 = vadd_f32(*(float32x2_t *)a2, (float32x2_t)v13);
  v13.i32[0] = *(_DWORD *)(a2 + 44);
  float32x2_t v15 = vadd_f32(v6, (float32x2_t)*(_OWORD *)&vcvtq_f32_f16(v13));
  float16x4_t v16 = (float16x4_t)vcvtq_f32_f16(*(float16x4_t *)(a2 + 48)).u64[0];
  float32x2_t v17 = vadd_f32(v9, (float32x2_t)v16);
  v16.i32[0] = *(_DWORD *)(a2 + 52);
  float32x2_t v18 = vadd_f32(v8, (float32x2_t)*(_OWORD *)&vcvtq_f32_f16(v16));
  float32x2_t v19 = vadd_f32(v9, (float32x2_t)*(_OWORD *)&vcvtq_f32_f16(*(float16x4_t *)(a2 + 56)));
  v2.i32[0] = *(_DWORD *)(a2 + 60);
  float32x2_t v20 = vadd_f32(v8, (float32x2_t)*(_OWORD *)&vcvtq_f32_f16(v2));
  if (result[1].i8[0])
  {
    __asm
    {
      FMOV            V20.2S, #-4.0
      FMOV            V22.2S, #6.0
    }
    *(float32x2_t *)v5.f32 = vmul_f32(vadd_f32(v9, v6), (float32x2_t)0xC0000000C0000000);
    __asm { FMOV            V26.2S, #3.0 }
    float32x2_t v26 = (float32x2_t)vdup_n_s32(0x3DE38E39u);
    float32x2_t v27 = vmla_f32(vmla_f32(vsub_f32(*(float32x2_t *)v5.f32, vmls_f32(v8, *(float32x2_t *)_Q20.f32, v7)), *(float32x2_t *)_Q22.f32, vadd_f32(v14, v11)), _D26, vadd_f32(v19, v15));
    float32x2_t v28 = vmul_f32(vadd_f32(v8, v7), (float32x2_t)0xC0000000C0000000);
    float32x2_t v29 = vmla_f32(vmla_f32(vsub_f32(v28, vmls_f32(v9, *(float32x2_t *)_Q20.f32, v6)), *(float32x2_t *)_Q22.f32, vadd_f32(v15, v12)), _D26, vadd_f32(v20, v14));
    float32x2_t v30 = vmla_f32(vmla_f32(vsub_f32(v28, vmls_f32(v6, *(float32x2_t *)_Q20.f32, v9)), _D26, vadd_f32(v18, v11)), *(float32x2_t *)_Q22.f32, vadd_f32(v19, v17));
    *(float32x2_t *)_Q20.f32 = vmla_f32(vmla_f32(vsub_f32(*(float32x2_t *)v5.f32, vmls_f32(v7, *(float32x2_t *)_Q20.f32, v8)), _D26, vadd_f32(v17, v12)), *(float32x2_t *)_Q22.f32, vadd_f32(v20, v18));
    *(float32x2_t *)_Q22.f32 = vneg_f32(vmls_f32(v7, v26, v27));
    *(float32x2_t *)v5.f32 = vneg_f32(vmls_f32(v9, v26, v30));
    *(float32x2_t *)_Q20.f32 = vneg_f32(vmls_f32(v8, v26, *(float32x2_t *)_Q20.f32));
    int32x4_t v31 = (int32x4_t)vcvt_hight_f16_f32((int16x4_t)vcvt_f16_f32(v5), _Q20);
    *(float32x2_t *)_Q20.f32 = vneg_f32(vmls_f32(v6, v26, v29));
    *(int32x4_t *)(a2 + 64) = vuzp1q_s32((int32x4_t)vcvt_hight_f16_f32((int16x4_t)vcvt_f16_f32(_Q22), _Q20), v31);
  }
  float32x2_t v32 = vminnm_f32(vminnm_f32(vminnm_f32(vminnm_f32(vminnm_f32(vminnm_f32(vminnm_f32(vminnm_f32(vminnm_f32(vminnm_f32(vminnm_f32(v7, v11), v12), v6), v14), v15), v17), v18), v9), v19), v20), v8);
  float32x2_t v33 = vmaxnm_f32(vmaxnm_f32(vmaxnm_f32(vmaxnm_f32(vmaxnm_f32(vmaxnm_f32(vmaxnm_f32(vmaxnm_f32(vmaxnm_f32(vmaxnm_f32(vmaxnm_f32(v7, v11), v12), v6), v14), v15), v17), v18), v9), v19), v20), v8);
  uint32x2_t v34 = (uint32x2_t)vorr_s8((int8x8_t)vcgt_f32(result[2], v33), (int8x8_t)vcgt_f32(v32, result[3]));
  if ((vpmax_u32(v34, v34).u32[0] & 0x80000000) == 0)
  {
    result[4] = vmaxnm_f32(result[4], vmaxnm_f32(vmaxnm_f32(vmaxnm_f32(vabs_f32(vadd_f32(vsub_f32(v7, vadd_f32(v11, v11)), v12)), vabd_f32(vadd_f32(v11, v6), vadd_f32(v12, v12))), vmaxnm_f32(vabs_f32(vadd_f32(vsub_f32(v9, vadd_f32(v19, v19)), v20)), vabd_f32(vadd_f32(v19, v8), vadd_f32(v20, v20)))), vmaxnm_f32(vmaxnm_f32(vabs_f32(vadd_f32(vsub_f32(v7, vadd_f32(v14, v14)), v17)), vabd_f32(vadd_f32(v14, v9), vadd_f32(v17, v17))), vmaxnm_f32(vabs_f32(vadd_f32(vsub_f32(v6, vadd_f32(v15, v15)), v18)), vabd_f32(vadd_f32(v15, v8), vadd_f32(v18, v18))))));
    float32x2_t v35 = vsub_f32(v33, v32);
    float v36 = vmul_lane_f32(v35, v35, 1).f32[0];
    if (result[5].f32[0] >= v36) {
      float v36 = result[5].f32[0];
    }
    result[5].f32[0] = v36;
    __int32 v37 = result[1].i32[0];
    if ((v37 & 2) == 0) {
      goto LABEL_13;
    }
    float16x4_t v39 = *(float16x4_t *)(a2 + 80);
    float16x4_t v38 = *(float16x4_t *)(a2 + 88);
    float16x4_t v41 = *(float16x4_t *)(a2 + 96);
    float16x4_t v40 = *(float16x4_t *)(a2 + 104);
    float16x4_t v42 = *(float16x4_t *)(a2 + 112);
    float16x4_t v43 = *(float16x4_t *)(a2 + 120);
    float16x4_t v45 = *(float16x4_t *)(a2 + 128);
    float16x4_t v44 = *(float16x4_t *)(a2 + 136);
    float16x4_t v47 = *(float16x4_t *)(a2 + 144);
    float16x4_t v46 = *(float16x4_t *)(a2 + 152);
    float16x4_t v48 = *(float16x4_t *)(a2 + 160);
    float16x4_t v49 = *(float16x4_t *)(a2 + 168);
    if (v37)
    {
      float16x4_t v54 = vmul_f16(vadd_f16(v41, v38), (float16x4_t)0xC000C000C000C000);
      float16x4_t v55 = (float16x4_t)vdup_n_s16(0x2F1Cu);
      float16x4_t v50 = vmul_f16(vmla_f16(vmla_f16(vadd_f16(vmla_f16(vneg_f16(v40), (float16x4_t)0xC400C400C400C400, v39), v54), (float16x4_t)0x4600460046004600, vadd_f16(v45, v42)), (float16x4_t)0x4200420042004200, vadd_f16(v48, v44)), v55);
      float16x4_t v56 = vmul_f16(vadd_f16(v40, v39), (float16x4_t)0xC000C000C000C000);
      float16x4_t v51 = vmul_f16(vmla_f16(vmla_f16(vadd_f16(vmla_f16(vneg_f16(v41), (float16x4_t)0xC400C400C400C400, v38), v56), (float16x4_t)0x4600460046004600, vadd_f16(v44, v43)), (float16x4_t)0x4200420042004200, vadd_f16(v49, v45)), v55);
      float16x4_t v52 = vmul_f16(vmla_f16(vmla_f16(vadd_f16(vmla_f16(vneg_f16(v38), (float16x4_t)0xC400C400C400C400, v41), v56), (float16x4_t)0x4200420042004200, vadd_f16(v46, v42)), (float16x4_t)0x4600460046004600, vadd_f16(v48, v47)), v55);
      float16x4_t v53 = vmul_f16(vmla_f16(vmla_f16(vadd_f16(vmla_f16(vneg_f16(v39), (float16x4_t)0xC400C400C400C400, v40), v54), (float16x4_t)0x4200420042004200, vadd_f16(v47, v43)), (float16x4_t)0x4600460046004600, vadd_f16(v49, v46)), v55);
      if ((v37 & 4) == 0)
      {
LABEL_12:
        *(float16x4_t *)(a2 + 88) = v38;
        *(float16x4_t *)(a2 + 104) = v40;
        *(float16x4_t *)(a2 + 112) = v42;
        *(float16x4_t *)(a2 + 120) = v43;
        *(float16x4_t *)(a2 + 136) = v44;
        *(float16x4_t *)(a2 + 152) = v46;
        *(float16x4_t *)(a2 + 160) = v48;
        *(float16x4_t *)(a2 + 168) = v49;
        *(float16x4_t *)(a2 + 176) = v50;
        *(float16x4_t *)(a2 + 184) = v51;
        *(float16x4_t *)(a2 + 192) = v52;
        *(float16x4_t *)(a2 + 200) = v53;
LABEL_13:
        ++result[6].i32[1];
        if (!result[7].i8[0])
        {
          float32x2_t v57 = result[8];
          float32x2_t v58 = *(float32x2_t *)(*(void *)&v57 + 128);
          if (!*(void *)&v58) {
            float32x2_t v58 = result[8];
          }
          uint64_t v59 = *(void *)&v58 + 32 * (*(_DWORD *)(*(void *)&v57 + 136) - 1);
          ++*(_DWORD *)(v59 + 28);
        }
        result[6].i32[0] += result->i32[0];
        return result;
      }
    }
    else
    {
      float16x4_t v50 = *(float16x4_t *)(a2 + 176);
      float16x4_t v51 = *(float16x4_t *)(a2 + 184);
      float16x4_t v52 = *(float16x4_t *)(a2 + 192);
      float16x4_t v53 = *(float16x4_t *)(a2 + 200);
      if ((v37 & 4) == 0) {
        goto LABEL_12;
      }
    }
    float16x4_t v38 = vmla_f16(vsub_f16(v38, v39), (float16x4_t)0x4200420042004200, vsub_f16(v42, v43));
    float16x4_t v43 = vmul_f16(vadd_f16(vsub_f16(v39, vadd_f16(v42, v42)), v43), (float16x4_t)0x4200420042004200);
    float16x4_t v42 = vmul_f16(vsub_f16(v42, v39), (float16x4_t)0x4200420042004200);
    float16x4_t v44 = vmla_f16(vsub_f16(v44, v45), (float16x4_t)0x4200420042004200, vsub_f16(v50, v51));
    float16x4_t v51 = vmul_f16(vadd_f16(vsub_f16(v45, vadd_f16(v50, v50)), v51), (float16x4_t)0x4200420042004200);
    float16x4_t v50 = vmul_f16(vsub_f16(v50, v45), (float16x4_t)0x4200420042004200);
    float16x4_t v46 = vmla_f16(vsub_f16(v46, v47), (float16x4_t)0x4200420042004200, vsub_f16(v52, v53));
    float16x4_t v53 = vmul_f16(vadd_f16(vsub_f16(v47, vadd_f16(v52, v52)), v53), (float16x4_t)0x4200420042004200);
    float16x4_t v52 = vmul_f16(vsub_f16(v52, v47), (float16x4_t)0x4200420042004200);
    float16x4_t v40 = vmla_f16(vsub_f16(v40, v41), (float16x4_t)0x4200420042004200, vsub_f16(v48, v49));
    float16x4_t v49 = vmul_f16(vadd_f16(vsub_f16(v41, vadd_f16(v48, v48)), v49), (float16x4_t)0x4200420042004200);
    float16x4_t v48 = vmul_f16(vsub_f16(v48, v41), (float16x4_t)0x4200420042004200);
    goto LABEL_12;
  }
  return result;
}

uint64_t RB::Fill::MeshGradient::PatchBuffer::finalize(uint64_t this)
{
  if (!*(unsigned char *)(this + 56))
  {
    uint64_t v1 = *(void *)(this + 64);
    int v2 = *(_DWORD *)(v1 + 136);
    if (v2)
    {
      if (*(void *)(v1 + 128)) {
        uint64_t v1 = *(void *)(v1 + 128);
      }
      return RB::RenderFrame::commit_buffer_region_size(*(void *)(this + 72), v1 + 32 * (v2 - 1), *(unsigned int *)(this + 48));
    }
  }
  return this;
}

uint64_t RB::Fill::MeshGradient::make_buffers(int32x2_t *this, uint64_t a2, uint64_t a3, RB::RenderFrame ***a4, uint64_t a5, int32x2_t *a6, float a7)
{
  int v13 = *((unsigned __int8 *)a4 + 124);
  int v14 = v13;
  if (this[4].i8[5]) {
    int v14 = this[4].u8[4];
  }
  int v15 = 0;
  __int8 v16 = this[4].i8[7];
  __int8 v17 = this[4].i8[6];
  float v58 = a7;
  char v59 = v14;
  char v60 = v13;
  char v61 = 0;
  int v18 = v17 & 0xF;
  if (v18 == 1) {
    goto LABEL_8;
  }
  if (v18 == 3)
  {
    int v15 = 1;
    char v61 = 1;
LABEL_8:
    v13 &= 0xFEu;
    goto LABEL_9;
  }
  if (v18 != 2) {
    goto LABEL_10;
  }
  int v15 = 0;
  v13 |= 1u;
LABEL_9:
  char v60 = v13;
LABEL_10:
  BOOL v20 = (v16 & 0x10) == 0 || v15 != 0 || a7 != 1.0;
  char v21 = v13 != v14 || v20;
  char v62 = v21;
  uint64_t v22 = v16 & 0xF;
  if ((v16 & 0xF) == 0) {
    return v22;
  }
  if (v22 == 5)
  {
    uint64_t v22 = (2 * (HIDWORD(*(unint64_t *)this) + this[3].i32[0] - *(void *)this) - 4);
LABEL_24:
    RB::RenderFrame::alloc_buffer_region(**a4, (RB::Device *)(16 * v22), 8uLL, 0, &v51);
    if (!*(void *)&v51) {
      return 0;
    }
    unint64_t v24 = (float16x4_t *)(*(void *)(*(void *)&v51 + 56) + v52);
    if ((this[4].i8[7] & 0xF) == 6) {
      RB::Fill::MeshGradient::make_triangles((uint64_t)this, v24, v22, (uint64_t)&v58);
    }
    else {
      RB::Fill::MeshGradient::make_triangle_grid((uint64_t *)this, (uint64_t)v24, v23, (uint64_t)&v58);
    }
    *(_DWORD *)(a3 + 14) = 0;
    *(_DWORD *)(a3 + 4) = 0;
    *(_DWORD *)(a3 + 8) = 0;
    *(_DWORD *)(a3 + 20) = 0;
    if ((this[4].i8[7] & 0xF) == 6) {
      uint64_t v35 = this[3].u32[0];
    }
    else {
      uint64_t v35 = v22;
    }
    float32x2_t v36 = v51;
    long long v37 = v52;
    uint64_t v38 = v35 << 32;
    unsigned int v39 = *(_DWORD *)(a2 + 136);
    if (*(_DWORD *)(a2 + 140) < v39 + 1)
    {
      long long v50 = v52;
      RB::vector<RB::Fill::MeshGradient::MeshBuffer,4ul,unsigned int>::reserve_slow((void *)a2, v39 + 1);
      long long v37 = v50;
      unsigned int v39 = *(_DWORD *)(a2 + 136);
    }
    uint64_t v40 = *(void *)(a2 + 128);
    if (!v40) {
      uint64_t v40 = a2;
    }
    uint64_t v41 = v40 + 32 * v39;
    *(float32x2_t *)uint64_t v41 = v36;
    *(_OWORD *)(v41 + 8) = v37;
    *(void *)(v41 + 24) = v38;
    ++*(_DWORD *)(a2 + 136);
    return v22;
  }
  if (v22 == 6)
  {
    uint64_t v22 = (3 * this[3].i32[0]);
    goto LABEL_24;
  }
  uint64_t v25 = RB::Fill::MeshGradient::patches_info(this);
  float32x2_t v26 = **a4;
  RB::Fill::MeshGradient::PatchBuffer::PatchBuffer(&v51, SHIDWORD(v25), v27, a5, v28, *a6, a6[1], v29);
  char v55 = 0;
  uint64_t v56 = a2;
  float32x2_t v57 = v26;
  RB::Fill::MeshGradient::make_patches((float32x2_t *)this, (RB::Fill::MeshGradient::PatchBuffer *)&v51, (uint64_t)&v58);
  RB::Fill::MeshGradient::PatchBuffer::finalize((uint64_t)&v51);
  if (*(void *)(a2 + 128)) {
    uint64_t v30 = *(void *)(a2 + 128);
  }
  else {
    uint64_t v30 = a2;
  }
  uint64_t v31 = *(unsigned int *)(a2 + 136);
  if (v31)
  {
    LODWORD(v22) = 0;
    uint64_t v32 = 32 * v31;
    float32x2_t v33 = (int *)(v30 + 28);
    do
    {
      *(v33 - 1) = v22;
      int v34 = *v33;
      v33 += 8;
      uint64_t v22 = (v34 + v22);
      v32 -= 32;
    }
    while (v32);
  }
  else
  {
    uint64_t v22 = 0;
  }
  float v42 = ceilf(log2f(fmaxf(sqrtf((float)(v54 * 0.25) * sqrtf(vaddv_f32(vmul_f32(v53, v53)))), 1.0)));
  if (v42 > 7.0) {
    float v42 = 7.0;
  }
  unsigned int v43 = v42 + 1;
  unsigned int v44 = 2 * v42;
  do
  {
    char v45 = v44 - 2;
    if (!--v43) {
      break;
    }
    unsigned int v46 = v22 << v44;
    LOBYTE(v44) = v44 - 2;
  }
  while (v46 > 0x10000);
  *(_DWORD *)(a3 + 4) = (1 << v43) - 1;
  *(_DWORD *)(a3 + 8) = ~(-1 << (v45 + 2));
  *(_WORD *)(a3 + 14) = 2 * v43;
  *(_WORD *)(a3 + 16) = v43;
  float32x2_t v47 = vrecpe_f32((float32x2_t)COERCE_UNSIGNED_INT((float)(1 << v43)));
  float32x2_t v48 = vmul_f32(vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT((float)(1 << v43)), v47), v47);
  *(_DWORD *)(a3 + 20) = vmul_f32(v48, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT((float)(1 << v43)), v48)).u32[0];
  return v22;
}

void RB::Fill::MeshGradient::make_triangles(uint64_t a1, float16x4_t *a2, int a3, uint64_t a4)
{
  if (a3)
  {
    uint64_t v5 = *(_DWORD *)(a1 + 24) * RB::Fill::MeshGradient::points_per_elt[*(unsigned char *)(a1 + 39) & 0xF];
    float32x2_t v6 = (float16x4_t *)(*(void *)(a1 + 8) + 16);
    if ((3 * a3) <= 1) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = (3 * a3);
    }
    float32x2_t v8 = a2 + 1;
    do
    {
      v8[-1] = *v6;
      *float32x2_t v8 = v6[v5];
      if (*(unsigned char *)(a4 + 7)) {
        RB::Fill::MeshGradient::ColorConversion::convert(a4, v8);
      }
      v8 += 2;
      ++v6;
      --v7;
    }
    while (v7);
  }
}

void RB::Fill::MeshGradient::make_triangle_grid(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (HIDWORD(*a1) != 1)
  {
    unsigned int v6 = 0;
    unsigned int v7 = 0;
    uint64_t v8 = a1[1] + 16;
    int v20 = *a1;
    uint64_t v9 = v8
       + 8 * *((_DWORD *)a1 + 6) * RB::Fill::MeshGradient::points_per_elt[*((unsigned char *)a1 + 39) & 0xF];
    do
    {
      uint64_t v10 = *a1;
      if (*a1)
      {
        unint64_t v11 = 0;
        int v12 = v6 * v20;
        unsigned int v21 = v6 + 1;
        unsigned int v22 = v6;
        int v13 = (v6 + 1) * v20;
        do
        {
          int v14 = (float16x4_t *)(a2 + 16 * v7);
          *int v14 = *(float16x4_t *)(v8 + 8 * (v12 + v11));
          v14[1] = *(float16x4_t *)(v9 + 8 * (v12 + v11));
          if (*(unsigned char *)(a4 + 7)) {
            RB::Fill::MeshGradient::ColorConversion::convert(a4, v14 + 1);
          }
          unsigned int v15 = v7 + 1;
          if (v22 && !v11)
          {
            *(_OWORD *)(a2 + 16 * v15) = *(_OWORD *)v14->i8;
            unsigned int v15 = v7 + 2;
          }
          __int8 v16 = (float16x4_t *)(a2 + 16 * v15);
          *__int8 v16 = *(float16x4_t *)(v8 + 8 * (v13 + v11));
          v16[1] = *(float16x4_t *)(v9 + 8 * (v13 + v11));
          __int8 v17 = v16 + 1;
          if (*(unsigned char *)(a4 + 7)) {
            RB::Fill::MeshGradient::ColorConversion::convert(a4, v17);
          }
          unsigned int v7 = v15 + 1;
          ++v11;
          uint64_t v10 = *a1;
        }
        while (v11 < *a1);
        int v18 = HIDWORD(*a1);
        unsigned int v19 = v21;
        unsigned int v6 = v22;
      }
      else
      {
        int v18 = HIDWORD(*a1);
        unsigned int v19 = v6 + 1;
      }
      if (v6 != HIDWORD(v10) - 2)
      {
        *(_OWORD *)(a2 + 16 * v7) = *(_OWORD *)(a2 + 16 * (v7 - 1));
        ++v7;
        int v18 = *((_DWORD *)a1 + 1);
      }
      unsigned int v6 = v19;
    }
    while (v19 < v18 - 1);
  }
}

uint64_t RB::Fill::MeshGradient::patches_info(int32x2_t *this)
{
  int v1 = this[4].i8[7] & 0xF;
  if ((v1 - 1) < 2)
  {
    int32x2_t v2 = vadd_s32(*this, (int32x2_t)-1);
    unsigned __int32 v3 = vmul_lane_s32(v2, v2, 1).u32[0];
    uint64_t v4 = 0xD000000000;
    if ((this[4].i8[6] & 0x10) == 0) {
      uint64_t v4 = 0x7000000000;
    }
  }
  else if (v1 == 3 || v1 == 4)
  {
    unsigned __int32 v3 = this[3].u32[0];
    uint64_t v4 = 0x7000000000;
  }
  else
  {
    unsigned __int32 v3 = 0;
    uint64_t v4 = 0;
  }
  return v4 | v3;
}

float32x2_t *RB::Fill::MeshGradient::make_patches(float32x2_t *result, RB::Fill::MeshGradient::PatchBuffer *this, uint64_t a3)
{
  switch(result[4].i8[7] & 0xF)
  {
    case 1:
      float16x4_t result = RB::Fill::MeshGradient::make_vertex_grid(result, this, a3);
      break;
    case 2:
      float16x4_t result = RB::Fill::MeshGradient::make_bezier_grid(result, this, a3);
      break;
    case 3:
      float16x4_t result = RB::Fill::MeshGradient::make_coons_patches(result, this);
      break;
    case 4:
      float16x4_t result = RB::Fill::MeshGradient::make_tensor_patches(result, this, a3);
      break;
    default:
      return result;
  }
  return result;
}

uint64_t RB::Fill::MeshGradient::primitive_type(RB::Fill::MeshGradient *this)
{
  uint64_t v1 = *((unsigned char *)this + 39) & 0xF;
  if (v1 > 6) {
    return 4;
  }
  else {
    return qword_21421CE20[v1];
  }
}

float32x2_t *RB::Fill::MeshGradient::make_vertex_grid(float32x2_t *result, RB::Fill::MeshGradient::PatchBuffer *this, uint64_t a3)
{
  v139 = result;
  uint64_t v3 = *(void *)&result[1] + 16;
  uint64_t v4 = (uint64_t)*result;
  v146[0] = v3 + 8 * result[3].i32[0] * RB::Fill::MeshGradient::points_per_elt[result[4].i8[7] & 0xF];
  v146[1] = v4;
  unint64_t v5 = v4;
  int v147 = v4;
  unsigned int v6 = HIDWORD(v4);
  if (HIDWORD(v4) != 1)
  {
    int v8 = 0;
    unsigned int v9 = 0;
    int v142 = 2 * v4;
    int v141 = -(int)v4;
    int v138 = v4 - 1;
    int v137 = -1;
    int v10 = v4;
    while (1)
    {
      unsigned int v145 = v9 + 1;
      if (v4 != 1) {
        break;
      }
LABEL_72:
      v142 += v5;
      v141 += v5;
      v10 += v5;
      v8 += v5;
      v138 += v5;
      v137 += v5;
      ++v9;
      if (v145 >= HIDWORD(v4) - 1) {
        return result;
      }
    }
    unint64_t v11 = 0;
    unsigned int v143 = v9 + 2;
    unsigned int v144 = v9 - 1;
    while (1)
    {
      float16x4_t result = (float32x2_t *)RB::Fill::MeshGradient::PatchBuffer::alloc_patch(this);
      if (!result) {
        break;
      }
      uint64_t v19 = (uint64_t)result;
      v14.i64[0] = *(void *)(v3 + 8 * (v8 + v11));
      float32x2_t v20 = *(float32x2_t *)(v3 + 8 * (v8 + v11 + 1));
      float32x2_t v21 = *(float32x2_t *)(v3 + 8 * (v10 + v11));
      float32x2_t v22 = *(float32x2_t *)(v3 + 8 * (v10 + v11 + 1));
      *float16x4_t result = *(float32x2_t *)v14.f32;
      result[1] = v21;
      result[2] = v20;
      result[3] = v22;
      float32x2_t v23 = *(float32x2_t *)v14.f32;
      if (v5 > (int)v11 - 1)
      {
        float32x2_t v23 = *(float32x2_t *)v14.f32;
        if (v6 > v9) {
          float32x2_t v23 = *(float32x2_t *)(v3 + 8 * (v137 + v11));
        }
      }
      float32x2_t v24 = v20;
      if (v5 > (int)v11 + 2)
      {
        float32x2_t v24 = v20;
        if (v6 > v9) {
          float32x2_t v24 = *(float32x2_t *)(v3 + 8 * (v8 + v11 + 2));
        }
      }
      float32x2_t v25 = v21;
      if (v5 > (int)v11 - 1)
      {
        float32x2_t v25 = v21;
        if (v6 > v145) {
          float32x2_t v25 = *(float32x2_t *)(v3 + 8 * (v138 + v11));
        }
      }
      float32x2_t v26 = v22;
      if (v5 > (int)v11 + 2)
      {
        float32x2_t v26 = v22;
        if (v6 > v145) {
          float32x2_t v26 = *(float32x2_t *)(v3 + 8 * (v10 + v11 + 2));
        }
      }
      float32x2_t v27 = vsub_f32(*(float32x2_t *)v14.f32, v23);
      float v28 = sqrtf(vaddv_f32(vmul_f32(v27, v27)));
      if (v28 != 0.0)
      {
        float v29 = v28;
        float32x2_t v30 = vrecpe_f32((float32x2_t)LODWORD(v28));
        float32x2_t v31 = vmul_f32(vrecps_f32((float32x2_t)LODWORD(v29), v30), v30);
        float32x2_t v27 = vmul_n_f32(v27, vmul_f32(v31, vrecps_f32((float32x2_t)LODWORD(v29), v31)).f32[0]);
      }
      float32x2_t v32 = vsub_f32(v20, *(float32x2_t *)v14.f32);
      v16.f32[0] = sqrtf(vaddv_f32(vmul_f32(v32, v32)));
      if (v16.f32[0] != 0.0)
      {
        float32x2_t v33 = vrecpe_f32((float32x2_t)v16.u32[0]);
        float32x2_t v34 = vmul_f32(vrecps_f32((float32x2_t)v16.u32[0], v33), v33);
        float32x2_t v32 = vmul_n_f32(v32, vmul_f32(v34, vrecps_f32((float32x2_t)v16.u32[0], v34)).f32[0]);
      }
      float32x2_t v35 = vsub_f32(v24, v20);
      float v36 = sqrtf(vaddv_f32(vmul_f32(v35, v35)));
      if (v36 != 0.0)
      {
        float v37 = v36;
        float32x2_t v38 = vrecpe_f32((float32x2_t)LODWORD(v36));
        float32x2_t v39 = vmul_f32(vrecps_f32((float32x2_t)LODWORD(v37), v38), v38);
        float32x2_t v35 = vmul_n_f32(v35, vmul_f32(v39, vrecps_f32((float32x2_t)LODWORD(v37), v39)).f32[0]);
      }
      float32x2_t v40 = vadd_f32(v32, v27);
      v17.i64[0] = 0;
      uint32x2_t v41 = (uint32x2_t)vmvn_s8((int8x8_t)vceqz_f32(v40));
      unsigned __int32 v42 = vpmax_u32(v41, v41).u32[0];
      v15.i64[0] = 0;
      if ((v42 & 0x80000000) != 0)
      {
        int32x2_t v43 = (int32x2_t)vmul_f32(v40, v40);
        v43.i32[0] = vadd_f32((float32x2_t)v43, (float32x2_t)vdup_lane_s32(v43, 1)).u32[0];
        float32x2_t v44 = vrsqrte_f32((float32x2_t)v43.u32[0]);
        float32x2_t v45 = vmul_f32(vrsqrts_f32((float32x2_t)v43.u32[0], vmul_f32(v44, v44)), v44);
        *(float32x2_t *)v15.f32 = vmul_n_f32(v40, vmul_f32(v45, vrsqrts_f32((float32x2_t)v43.u32[0], vmul_f32(v45, v45))).f32[0]);
      }
      float32x2_t v46 = vadd_f32(v35, v32);
      uint32x2_t v47 = (uint32x2_t)vmvn_s8((int8x8_t)vceqz_f32(v46));
      if ((vpmax_u32(v47, v47).u32[0] & 0x80000000) != 0)
      {
        int32x2_t v48 = (int32x2_t)vmul_f32(v46, v46);
        v48.i32[0] = vadd_f32((float32x2_t)v48, (float32x2_t)vdup_lane_s32(v48, 1)).u32[0];
        float32x2_t v49 = vrsqrte_f32((float32x2_t)v48.u32[0]);
        float32x2_t v50 = vmul_f32(vrsqrts_f32((float32x2_t)v48.u32[0], vmul_f32(v49, v49)), v49);
        *(float32x2_t *)v17.f32 = vmul_n_f32(v46, vmul_f32(v50, vrsqrts_f32((float32x2_t)v48.u32[0], vmul_f32(v50, v50))).f32[0]);
      }
      float32x2_t v51 = vsub_f32(v21, v25);
      float v52 = sqrtf(vaddv_f32(vmul_f32(v51, v51)));
      if (v52 != 0.0)
      {
        float v53 = v52;
        float32x2_t v54 = vrecpe_f32((float32x2_t)LODWORD(v52));
        float32x2_t v55 = vmul_f32(vrecps_f32((float32x2_t)LODWORD(v53), v54), v54);
        float32x2_t v51 = vmul_n_f32(v51, vmul_f32(v55, vrecps_f32((float32x2_t)LODWORD(v53), v55)).f32[0]);
      }
      float32x2_t v56 = vsub_f32(v22, v21);
      v18.f32[0] = sqrtf(vaddv_f32(vmul_f32(v56, v56)));
      if (v18.f32[0] != 0.0)
      {
        float32x2_t v57 = vrecpe_f32((float32x2_t)v18.u32[0]);
        float32x2_t v58 = vmul_f32(vrecps_f32((float32x2_t)v18.u32[0], v57), v57);
        float32x2_t v56 = vmul_n_f32(v56, vmul_f32(v58, vrecps_f32((float32x2_t)v18.u32[0], v58)).f32[0]);
      }
      float32x2_t v59 = vsub_f32(v26, v22);
      float v60 = sqrtf(vaddv_f32(vmul_f32(v59, v59)));
      if (v60 != 0.0)
      {
        float v61 = v60;
        float32x2_t v62 = vrecpe_f32((float32x2_t)LODWORD(v60));
        float32x2_t v63 = vmul_f32(vrecps_f32((float32x2_t)LODWORD(v61), v62), v62);
        float32x2_t v59 = vmul_n_f32(v59, vmul_f32(v63, vrecps_f32((float32x2_t)LODWORD(v61), v63)).f32[0]);
      }
      float32x2_t v64 = vadd_f32(v56, v51);
      float32x2_t v65 = 0;
      uint32x2_t v66 = (uint32x2_t)vmvn_s8((int8x8_t)vceqz_f32(v64));
      unsigned __int32 v67 = vpmax_u32(v66, v66).u32[0];
      float32x2_t v68 = 0;
      if ((v67 & 0x80000000) != 0)
      {
        int32x2_t v69 = (int32x2_t)vmul_f32(v64, v64);
        v69.i32[0] = vadd_f32((float32x2_t)v69, (float32x2_t)vdup_lane_s32(v69, 1)).u32[0];
        float32x2_t v70 = vrsqrte_f32((float32x2_t)v69.u32[0]);
        float32x2_t v71 = vmul_f32(vrsqrts_f32((float32x2_t)v69.u32[0], vmul_f32(v70, v70)), v70);
        float32x2_t v68 = vmul_n_f32(v64, vmul_f32(v71, vrsqrts_f32((float32x2_t)v69.u32[0], vmul_f32(v71, v71))).f32[0]);
      }
      float32x2_t v72 = vadd_f32(v59, v56);
      uint32x2_t v73 = (uint32x2_t)vmvn_s8((int8x8_t)vceqz_f32(v72));
      if ((vpmax_u32(v73, v73).u32[0] & 0x80000000) != 0)
      {
        int32x2_t v74 = (int32x2_t)vmul_f32(v72, v72);
        v74.i32[0] = vadd_f32((float32x2_t)v74, (float32x2_t)vdup_lane_s32(v74, 1)).u32[0];
        float32x2_t v75 = vrsqrte_f32((float32x2_t)v74.u32[0]);
        float32x2_t v76 = vmul_f32(vrsqrts_f32((float32x2_t)v74.u32[0], vmul_f32(v75, v75)), v75);
        float32x2_t v65 = vmul_n_f32(v72, vmul_f32(v76, vrsqrts_f32((float32x2_t)v74.u32[0], vmul_f32(v76, v76))).f32[0]);
      }
      float32x2_t v77 = (float32x2_t)vdup_n_s32(0x3EAAAAABu);
      *(float32x2_t *)v15.f32 = vmul_f32(vmul_n_f32(v77, v16.f32[0]), *(float32x2_t *)v15.f32);
      int16x4_t v78 = (int16x4_t)vcvt_f16_f32(v15);
      float32x2_t v79 = (float32x2_t)vdup_n_s32(0xBEAAAAAB);
      *(float32x2_t *)v16.f32 = vmul_f32(vmul_n_f32(v79, v16.f32[0]), *(float32x2_t *)v17.f32);
      *(float32x2_t *)v17.f32 = vmul_f32(vmul_n_f32(v77, v18.f32[0]), v68);
      *(float32x2_t *)v18.f32 = vmul_f32(vmul_n_f32(v79, v18.f32[0]), v65);
      float32x4_t v80 = (float32x4_t)vuzp1q_s32((int32x4_t)vcvt_hight_f16_f32(v78, v17), (int32x4_t)vcvt_hight_f16_f32((int16x4_t)vcvt_f16_f32(v16), v18));
      *(float32x4_t *)result[5].f32 = v80;
      float32x2_t v81 = *(float32x2_t *)v14.f32;
      if (v11 < v5)
      {
        float32x2_t v81 = *(float32x2_t *)v14.f32;
        if (v6 > v144) {
          float32x2_t v81 = *(float32x2_t *)(v3 + 8 * (v141 + v11));
        }
      }
      unint64_t v82 = v11 + 1;
      float32x2_t v83 = v20;
      if (v11 + 1 < v5)
      {
        float32x2_t v83 = v20;
        if (v6 > v144) {
          float32x2_t v83 = *(float32x2_t *)(v3 + 8 * (v141 + v11 + 1));
        }
      }
      float32x2_t v84 = v21;
      if (v11 < v5)
      {
        float32x2_t v84 = v21;
        if (v6 > v143) {
          float32x2_t v84 = *(float32x2_t *)(v3 + 8 * (v142 + v11));
        }
      }
      float32x2_t v85 = v22;
      if (v82 < v5)
      {
        float32x2_t v85 = v22;
        if (v6 > v143) {
          float32x2_t v85 = *(float32x2_t *)(v3 + 8 * (v142 + v11 + 1));
        }
      }
      float32x2_t v86 = vsub_f32(*(float32x2_t *)v14.f32, v81);
      float v87 = sqrtf(vaddv_f32(vmul_f32(v86, v86)));
      if (v87 != 0.0)
      {
        float v88 = v87;
        float32x2_t v89 = vrecpe_f32((float32x2_t)LODWORD(v87));
        float32x2_t v90 = vmul_f32(vrecps_f32((float32x2_t)LODWORD(v88), v89), v89);
        float32x2_t v86 = vmul_n_f32(v86, vmul_f32(v90, vrecps_f32((float32x2_t)LODWORD(v88), v90)).f32[0]);
      }
      float32x2_t v91 = vsub_f32(v21, *(float32x2_t *)v14.f32);
      v14.f32[0] = sqrtf(vaddv_f32(vmul_f32(v91, v91)));
      if (v14.f32[0] != 0.0)
      {
        float32x2_t v92 = vrecpe_f32((float32x2_t)v14.u32[0]);
        float32x2_t v93 = vmul_f32(vrecps_f32((float32x2_t)v14.u32[0], v92), v92);
        float32x2_t v91 = vmul_n_f32(v91, vmul_f32(v93, vrecps_f32((float32x2_t)v14.u32[0], v93)).f32[0]);
      }
      float32x2_t v94 = vsub_f32(v84, v21);
      float v95 = sqrtf(vaddv_f32(vmul_f32(v94, v94)));
      if (v95 != 0.0)
      {
        float v96 = v95;
        float32x2_t v97 = vrecpe_f32((float32x2_t)LODWORD(v95));
        float32x2_t v98 = vmul_f32(vrecps_f32((float32x2_t)LODWORD(v96), v97), v97);
        float32x2_t v94 = vmul_n_f32(v94, vmul_f32(v98, vrecps_f32((float32x2_t)LODWORD(v96), v98)).f32[0]);
      }
      float32x2_t v99 = vadd_f32(v91, v86);
      v13.i64[0] = 0;
      uint32x2_t v100 = (uint32x2_t)vmvn_s8((int8x8_t)vceqz_f32(v99));
      unsigned __int32 v101 = vpmax_u32(v100, v100).u32[0];
      float32x2_t v102 = 0;
      if ((v101 & 0x80000000) != 0)
      {
        int32x2_t v103 = (int32x2_t)vmul_f32(v99, v99);
        v103.i32[0] = vadd_f32((float32x2_t)v103, (float32x2_t)vdup_lane_s32(v103, 1)).u32[0];
        float32x2_t v104 = vrsqrte_f32((float32x2_t)v103.u32[0]);
        float32x2_t v105 = vmul_f32(vrsqrts_f32((float32x2_t)v103.u32[0], vmul_f32(v104, v104)), v104);
        float32x2_t v102 = vmul_n_f32(v99, vmul_f32(v105, vrsqrts_f32((float32x2_t)v103.u32[0], vmul_f32(v105, v105))).f32[0]);
      }
      float32x2_t v106 = vadd_f32(v94, v91);
      uint32x2_t v107 = (uint32x2_t)vmvn_s8((int8x8_t)vceqz_f32(v106));
      if ((vpmax_u32(v107, v107).u32[0] & 0x80000000) != 0)
      {
        int32x2_t v108 = (int32x2_t)vmul_f32(v106, v106);
        v108.i32[0] = vadd_f32((float32x2_t)v108, (float32x2_t)vdup_lane_s32(v108, 1)).u32[0];
        float32x2_t v109 = vrsqrte_f32((float32x2_t)v108.u32[0]);
        float32x2_t v110 = vmul_f32(vrsqrts_f32((float32x2_t)v108.u32[0], vmul_f32(v109, v109)), v109);
        *(float32x2_t *)v13.f32 = vmul_n_f32(v106, vmul_f32(v110, vrsqrts_f32((float32x2_t)v108.u32[0], vmul_f32(v110, v110))).f32[0]);
      }
      float32x2_t v111 = vsub_f32(v20, v83);
      float v112 = sqrtf(vaddv_f32(vmul_f32(v111, v111)));
      if (v112 != 0.0)
      {
        float v113 = v112;
        float32x2_t v114 = vrecpe_f32((float32x2_t)LODWORD(v112));
        float32x2_t v115 = vmul_f32(vrecps_f32((float32x2_t)LODWORD(v113), v114), v114);
        float32x2_t v111 = vmul_n_f32(v111, vmul_f32(v115, vrecps_f32((float32x2_t)LODWORD(v113), v115)).f32[0]);
      }
      float32x2_t v116 = vsub_f32(v22, v20);
      float v117 = sqrtf(vaddv_f32(vmul_f32(v116, v116)));
      if (v117 != 0.0)
      {
        float32x2_t v118 = vrecpe_f32((float32x2_t)LODWORD(v117));
        float32x2_t v119 = vmul_f32(vrecps_f32((float32x2_t)LODWORD(v117), v118), v118);
        float32x2_t v116 = vmul_n_f32(v116, vmul_f32(v119, vrecps_f32((float32x2_t)LODWORD(v117), v119)).f32[0]);
      }
      float32x2_t v120 = vsub_f32(v85, v22);
      float v121 = sqrtf(vaddv_f32(vmul_f32(v120, v120)));
      if (v121 != 0.0)
      {
        float v122 = v121;
        float32x2_t v123 = vrecpe_f32((float32x2_t)LODWORD(v121));
        float32x2_t v124 = vmul_f32(vrecps_f32((float32x2_t)LODWORD(v122), v123), v123);
        float32x2_t v120 = vmul_n_f32(v120, vmul_f32(v124, vrecps_f32((float32x2_t)LODWORD(v122), v124)).f32[0]);
      }
      float32x2_t v125 = vadd_f32(v116, v111);
      v12.i64[0] = 0;
      uint32x2_t v126 = (uint32x2_t)vmvn_s8((int8x8_t)vceqz_f32(v125));
      unsigned __int32 v127 = vpmax_u32(v126, v126).u32[0];
      float32x2_t v128 = 0;
      if ((v127 & 0x80000000) != 0)
      {
        int32x2_t v129 = (int32x2_t)vmul_f32(v125, v125);
        v129.i32[0] = vadd_f32((float32x2_t)v129, (float32x2_t)vdup_lane_s32(v129, 1)).u32[0];
        float32x2_t v130 = vrsqrte_f32((float32x2_t)v129.u32[0]);
        float32x2_t v131 = vmul_f32(vrsqrts_f32((float32x2_t)v129.u32[0], vmul_f32(v130, v130)), v130);
        float32x2_t v128 = vmul_n_f32(v125, vmul_f32(v131, vrsqrts_f32((float32x2_t)v129.u32[0], vmul_f32(v131, v131))).f32[0]);
      }
      float32x2_t v132 = vadd_f32(v120, v116);
      uint32x2_t v133 = (uint32x2_t)vmvn_s8((int8x8_t)vceqz_f32(v132));
      if ((vpmax_u32(v133, v133).u32[0] & 0x80000000) != 0)
      {
        int32x2_t v134 = (int32x2_t)vmul_f32(v132, v132);
        v134.i32[0] = vadd_f32((float32x2_t)v134, (float32x2_t)vdup_lane_s32(v134, 1)).u32[0];
        float32x2_t v135 = vrsqrte_f32((float32x2_t)v134.u32[0]);
        float32x2_t v136 = vmul_f32(vrsqrts_f32((float32x2_t)v134.u32[0], vmul_f32(v135, v135)), v135);
        *(float32x2_t *)v12.f32 = vmul_n_f32(v132, vmul_f32(v136, vrsqrts_f32((float32x2_t)v134.u32[0], vmul_f32(v136, v136))).f32[0]);
      }
      *(float32x2_t *)v80.f32 = vmul_f32(vmul_n_f32(v77, v14.f32[0]), v102);
      *(float32x2_t *)v13.f32 = vmul_f32(vmul_n_f32(v79, v14.f32[0]), *(float32x2_t *)v13.f32);
      *(float32x2_t *)v14.f32 = vmul_f32(vmul_n_f32(v77, v117), v128);
      *(float32x2_t *)v12.f32 = vmul_f32(vmul_n_f32(v79, v117), *(float32x2_t *)v12.f32);
      result[4] = (float32x2_t)vzip1_s32((int32x2_t)vcvt_f16_f32(v80), (int32x2_t)vcvt_f16_f32(v13));
      result[7] = (float32x2_t)vzip1_s32((int32x2_t)vcvt_f16_f32(v14), (int32x2_t)vcvt_f16_f32(v12));
      float16x4_t result = RB::Fill::MeshGradient::PatchBuffer::commit_patch((float32x2_t *)this, v19);
      uint64_t v4 = (uint64_t)*v139;
      ++v11;
      if (v82 >= v139->u32[0] - 1) {
        goto LABEL_72;
      }
    }
  }
  return result;
}

float32x2_t *RB::Fill::MeshGradient::make_bezier_grid(float32x2_t *result, RB::Fill::MeshGradient::PatchBuffer *this, uint64_t a3)
{
  uint64_t v3 = *(void *)&result[1] + 16;
  uint64_t v4 = (uint64_t)*result;
  v33[0] = v3 + 8 * result[3].i32[0] * RB::Fill::MeshGradient::points_per_elt[result[4].i8[7] & 0xF];
  v33[1] = v4;
  int v31 = v4;
  int v34 = v4;
  if (HIDWORD(v4) != 1)
  {
    unsigned int v6 = result;
    int v7 = 0;
    unsigned int v8 = 0;
    int v9 = v4;
    while (v4 == 1)
    {
LABEL_8:
      ++v8;
      v9 += v31;
      v7 += v31;
      if (v8 >= HIDWORD(v4) - 1) {
        return result;
      }
    }
    uint64_t v10 = 0;
    while (1)
    {
      float16x4_t result = (float32x2_t *)RB::Fill::MeshGradient::PatchBuffer::alloc_patch(this);
      if (!result) {
        break;
      }
      uint64_t v15 = (uint64_t)result;
      float32x4_t v16 = (uint64_t *)(v3 + 40 * (v7 + v10));
      v11.i64[0] = *v16;
      float32x4_t v17 = (uint64_t *)(v3 + 40 * (v9 + v10));
      v12.i64[0] = *v17;
      v14.i64[0] = v16[3];
      v13.i64[0] = v16[4];
      float32x2_t v18 = (float32x2_t)v17[2];
      float32x2_t v19 = (float32x2_t)v17[3];
      float32x2_t v20 = (float32x2_t *)(v3 + 40 * (v7 + v10 + 1));
      float32x2_t v21 = (float32x2_t *)(v3 + 40 * (v9 + v10 + 1));
      float32x2_t v23 = *v20;
      float32x2_t v22 = v20[1];
      float32x2_t v24 = v20[4];
      float32x2_t v26 = v21[1];
      float32x2_t v25 = v21[2];
      float32x2_t v27 = *v21;
      *float16x4_t result = *(float32x2_t *)v11.f32;
      result[1] = *(float32x2_t *)v12.f32;
      result[2] = v23;
      result[3] = v27;
      *(float32x2_t *)v13.f32 = vsub_f32(*(float32x2_t *)v13.f32, *(float32x2_t *)v11.f32);
      *(float32x2_t *)v11.f32 = vsub_f32(*(float32x2_t *)v14.f32, *(float32x2_t *)v11.f32);
      *(float32x2_t *)v14.f32 = vsub_f32(v19, *(float32x2_t *)v12.f32);
      *(float32x2_t *)v12.f32 = vsub_f32(v18, *(float32x2_t *)v12.f32);
      float32x4_t v28 = (float32x4_t)vcvt_hight_f16_f32((int16x4_t)vcvt_f16_f32(v13), v12);
      int32x4_t v29 = vuzp1q_s32((int32x4_t)v28, (int32x4_t)vcvt_hight_f16_f32((int16x4_t)vcvt_f16_f32(v11), v14));
      *(float32x2_t *)v12.f32 = vsub_f32(v22, v23);
      *(float32x2_t *)v28.f32 = vsub_f32(v24, v23);
      *(float32x2_t *)v14.f32 = vsub_f32(v25, v27);
      int32x4_t v30 = (int32x4_t)vcvt_hight_f16_f32((int16x4_t)vcvt_f16_f32(v28), v14);
      *(float32x2_t *)v14.f32 = vsub_f32(v26, v27);
      *(int32x4_t *)result[4].f32 = v29;
      *(int32x4_t *)result[6].f32 = vuzp1q_s32((int32x4_t)vcvt_hight_f16_f32((int16x4_t)vcvt_f16_f32(v12), v14), v30);
      float16x4_t result = RB::Fill::MeshGradient::PatchBuffer::commit_patch((float32x2_t *)this, v15);
      uint64_t v4 = (uint64_t)*v6;
      if (++v10 >= (unint64_t)(v6->u32[0] - 1)) {
        goto LABEL_8;
      }
    }
  }
  return result;
}

float32x2_t *RB::Fill::MeshGradient::make_coons_patches(float32x2_t *result, RB::Fill::MeshGradient::PatchBuffer *this)
{
  __int32 v2 = result[3].i32[0];
  if (v2)
  {
    uint64_t v4 = result;
    unint64_t v5 = 0;
    float32x2_t v6 = result[1];
    uint64_t v7 = *(void *)&v6 + 8 * v2 * RB::Fill::MeshGradient::points_per_elt[result[4].i8[7] & 0xF] + 24;
    unsigned int v8 = (float32x2_t *)(*(void *)&v6 + 56);
    do
    {
      float16x4_t result = (float32x2_t *)RB::Fill::MeshGradient::PatchBuffer::alloc_patch(this);
      if (!result) {
        break;
      }
      *(float32x2_t *)v9.f32 = v8[-5];
      *(float32x2_t *)v10.f32 = v8[-4];
      *(float32x2_t *)v11.f32 = v8[-3];
      *(float32x2_t *)v12.f32 = v8[-2];
      *(float32x2_t *)v13.f32 = v8[-1];
      float32x2_t v14 = *v8;
      float32x2_t v15 = v8[1];
      float32x2_t v16 = v8[2];
      float32x2_t v17 = v8[3];
      float32x2_t v18 = v8[4];
      float32x2_t v19 = v8[5];
      float32x2_t v20 = v8[6];
      *float16x4_t result = *(float32x2_t *)v9.f32;
      result[1] = *(float32x2_t *)v12.f32;
      result[2] = v18;
      result[3] = v15;
      *(float32x2_t *)v10.f32 = vsub_f32(*(float32x2_t *)v10.f32, *(float32x2_t *)v9.f32);
      *(float32x2_t *)v9.f32 = vsub_f32(v20, *(float32x2_t *)v9.f32);
      *(float32x2_t *)v13.f32 = vsub_f32(*(float32x2_t *)v13.f32, *(float32x2_t *)v12.f32);
      *(float32x2_t *)v11.f32 = vsub_f32(*(float32x2_t *)v11.f32, *(float32x2_t *)v12.f32);
      float32x4_t v21 = (float32x4_t)vcvt_hight_f16_f32((int16x4_t)vcvt_f16_f32(v10), v11);
      int32x4_t v22 = vuzp1q_s32((int32x4_t)v21, (int32x4_t)vcvt_hight_f16_f32((int16x4_t)vcvt_f16_f32(v9), v13));
      *(float32x2_t *)v21.f32 = vsub_f32(v19, v18);
      *(float32x2_t *)v11.f32 = vsub_f32(v17, v18);
      *(float32x2_t *)v12.f32 = vsub_f32(v16, v15);
      int32x4_t v23 = (int32x4_t)vcvt_hight_f16_f32((int16x4_t)vcvt_f16_f32(v11), v12);
      *(float32x2_t *)v12.f32 = vsub_f32(v14, v15);
      *(int32x4_t *)result[4].f32 = v22;
      *(int32x4_t *)result[6].f32 = vuzp1q_s32((int32x4_t)vcvt_hight_f16_f32((int16x4_t)vcvt_f16_f32(v21), v12), v23);
      v21.i64[0] = *(void *)(v7 + 8);
      v23.i64[0] = *(void *)(v7 + 16);
      *(_OWORD *)result[10].f32 = *(_OWORD *)(v7 - 8);
      result[12] = *(float32x2_t *)v23.i8;
      result[13] = *(float32x2_t *)v21.f32;
      float16x4_t result = RB::Fill::MeshGradient::PatchBuffer::commit_patch((float32x2_t *)this, (uint64_t)result);
      ++v5;
      v7 += 32;
      v8 += 12;
    }
    while (v5 < v4[3].u32[0]);
  }
  return result;
}

float32x2_t *RB::Fill::MeshGradient::make_tensor_patches(float32x2_t *result, RB::Fill::MeshGradient::PatchBuffer *this, uint64_t a3)
{
  __int32 v3 = result[3].i32[0];
  if (v3)
  {
    float32x2_t v6 = result;
    unint64_t v7 = 0;
    float32x2_t v8 = result[1];
    float32x4_t v9 = (float16x4_t *)(*(void *)&v8
                       + 8 * v3 * RB::Fill::MeshGradient::points_per_elt[result[4].i8[7] & 0xF]
                       + 24);
    float32x4_t v10 = (uint64_t *)(*(void *)&v8 + 72);
    do
    {
      float16x4_t result = (float32x2_t *)RB::Fill::MeshGradient::PatchBuffer::alloc_patch(this);
      if (!result) {
        break;
      }
      float32x2_t v17 = (float16x4_t *)result;
      v12.i64[0] = *(v10 - 7);
      v13.i64[0] = *(v10 - 6);
      v14.i64[0] = *(v10 - 5);
      v11.i64[0] = *(v10 - 4);
      v15.i64[0] = *(v10 - 3);
      float32x2_t v18 = (float32x2_t)*(v10 - 2);
      float32x2_t v19 = (float32x2_t)*(v10 - 1);
      v16.i64[0] = *v10;
      float32x2_t v20 = (float32x2_t)v10[1];
      float32x2_t v21 = (float32x2_t)v10[2];
      float32x2_t v22 = (float32x2_t)v10[3];
      float32x2_t v23 = (float32x2_t)v10[4];
      float32x2_t v24 = (float32x2_t)v10[5];
      float32x2_t v25 = (float32x2_t)v10[6];
      float32x2_t v26 = (float32x2_t)v10[7];
      float32x2_t v27 = (float32x2_t)v10[8];
      *float16x4_t result = *(float32x2_t *)v12.f32;
      result[1] = *(float32x2_t *)v11.f32;
      result[2] = v24;
      result[3] = v27;
      *(float32x2_t *)v13.f32 = vsub_f32(*(float32x2_t *)v13.f32, *(float32x2_t *)v12.f32);
      *(float32x2_t *)v15.f32 = vsub_f32(*(float32x2_t *)v15.f32, *(float32x2_t *)v12.f32);
      *(float32x2_t *)v16.f32 = vsub_f32(*(float32x2_t *)v16.f32, *(float32x2_t *)v11.f32);
      float32x4_t v28 = (float32x4_t)vcvt_hight_f16_f32((int16x4_t)vcvt_f16_f32(v15), v16);
      *(float32x2_t *)v14.f32 = vsub_f32(*(float32x2_t *)v14.f32, *(float32x2_t *)v11.f32);
      float32x4_t v29 = (float32x4_t)vuzp1q_s32((int32x4_t)vcvt_hight_f16_f32((int16x4_t)vcvt_f16_f32(v13), v14), (int32x4_t)v28);
      *(float32x2_t *)v14.f32 = vsub_f32(v20, v24);
      *(float32x2_t *)v28.f32 = vsub_f32(v25, v24);
      *(float32x2_t *)v16.f32 = vsub_f32(v26, v27);
      int32x4_t v30 = (int32x4_t)vcvt_hight_f16_f32((int16x4_t)vcvt_f16_f32(v28), v16);
      *(float32x2_t *)v16.f32 = vsub_f32(v23, v27);
      float32x4_t v31 = (float32x4_t)vuzp1q_s32((int32x4_t)vcvt_hight_f16_f32((int16x4_t)vcvt_f16_f32(v14), v16), v30);
      *(float32x4_t *)result[4].f32 = v29;
      *(float32x4_t *)result[6].f32 = v31;
      *(float32x2_t *)v12.f32 = vsub_f32(v18, *(float32x2_t *)v12.f32);
      *(float32x2_t *)v29.f32 = vsub_f32(v21, v24);
      *(float32x2_t *)v31.f32 = vsub_f32(v22, v27);
      *(float32x2_t *)v11.f32 = vsub_f32(v19, *(float32x2_t *)v11.f32);
      *(int32x4_t *)result[8].f32 = vuzp1q_s32((int32x4_t)vcvt_hight_f16_f32((int16x4_t)vcvt_f16_f32(v12), v11), (int32x4_t)vcvt_hight_f16_f32((int16x4_t)vcvt_f16_f32(v29), v31));
      float16x4_t v32 = *v9;
      float16x4_t v34 = v9[1];
      float16x4_t v33 = v9[2];
      result[10] = (float32x2_t)v9[-1];
      if (*(unsigned char *)(a3 + 7)) {
        RB::Fill::MeshGradient::ColorConversion::convert(a3, (float16x4_t *)&result[10]);
      }
      v17[11] = v32;
      if (*(unsigned char *)(a3 + 7)) {
        RB::Fill::MeshGradient::ColorConversion::convert(a3, v17 + 11);
      }
      v17[12] = v34;
      if (*(unsigned char *)(a3 + 7)) {
        RB::Fill::MeshGradient::ColorConversion::convert(a3, v17 + 12);
      }
      v17[13] = v33;
      if (*(unsigned char *)(a3 + 7)) {
        RB::Fill::MeshGradient::ColorConversion::convert(a3, v17 + 13);
      }
      float16x4_t result = RB::Fill::MeshGradient::PatchBuffer::commit_patch((float32x2_t *)this, (uint64_t)v17);
      ++v7;
      v9 += 4;
      v10 += 16;
    }
    while (v7 < v6[3].u32[0]);
  }
  return result;
}

void RB::Fill::anonymous namespace'::make_grid_color(float16x4_t *a1, uint64_t *a2, unsigned int a3, unsigned int a4, uint64_t a5, int a6)
{
  uint64_t v12 = *a2;
  int v13 = *((_DWORD *)a2 + 4);
  float16x4_t v14 = *(float16x4_t *)(*a2 + 8 * (v13 * a4 + a3));
  float16x4_t v112 = v14;
  if (!*(unsigned char *)(a5 + 7))
  {
    unsigned int v16 = a3 + 1;
    float16x4_t v17 = *(float16x4_t *)(v12 + 8 * (v13 * a4 + a3 + 1));
    goto LABEL_7;
  }
  RB::Fill::MeshGradient::ColorConversion::convert(a5, &v112);
  float16x4_t v14 = v112;
  uint64_t v12 = *a2;
  int v13 = *((_DWORD *)a2 + 4);
  int v15 = *(unsigned __int8 *)(a5 + 7);
  unsigned int v16 = a3 + 1;
  float16x4_t v17 = *(float16x4_t *)(*a2 + 8 * (a3 + 1 + v13 * a4));
  float16x4_t v112 = v17;
  if (!v15)
  {
LABEL_7:
    unsigned int v19 = a4 + 1;
    int v20 = v13 * (a4 + 1);
    float16x4_t v21 = *(float16x4_t *)(v12 + 8 * (v20 + a3));
    goto LABEL_8;
  }
  RB::Fill::MeshGradient::ColorConversion::convert(a5, &v112);
  float16x4_t v17 = v112;
  uint64_t v12 = *a2;
  int v18 = *(unsigned __int8 *)(a5 + 7);
  unsigned int v19 = a4 + 1;
  int v20 = *((_DWORD *)a2 + 4) * (a4 + 1);
  float16x4_t v21 = *(float16x4_t *)(*a2 + 8 * (v20 + a3));
  float16x4_t v112 = v21;
  if (!v18)
  {
LABEL_8:
    float16x4_t v23 = *(float16x4_t *)(v12 + 8 * (v20 + v16));
    goto LABEL_9;
  }
  RB::Fill::MeshGradient::ColorConversion::convert(a5, &v112);
  float16x4_t v21 = v112;
  int v22 = *(unsigned __int8 *)(a5 + 7);
  float16x4_t v23 = *(float16x4_t *)(*a2 + 8 * (v16 + *((_DWORD *)a2 + 4) * v19));
  float16x4_t v112 = v23;
  if (v22)
  {
    RB::Fill::MeshGradient::ColorConversion::convert(a5, &v112);
    float16x4_t v23 = v112;
  }
LABEL_9:
  a1[10] = v14;
  a1[11] = v21;
  a1[12] = v17;
  a1[13] = v23;
  if (a6)
  {
    unsigned int v24 = a3 - 1;
    unsigned int v25 = *((_DWORD *)a2 + 2);
    unsigned int v26 = *((_DWORD *)a2 + 3);
    if (v25 <= a3 - 1 || v26 <= a4)
    {
      float16x4_t v27 = v14;
    }
    else
    {
      float16x4_t v27 = *(float16x4_t *)(*a2 + 8 * (v24 + *((_DWORD *)a2 + 4) * a4));
      float16x4_t v112 = v27;
      if (*(unsigned char *)(a5 + 7))
      {
        RB::Fill::MeshGradient::ColorConversion::convert(a5, &v112);
        float16x4_t v27 = v112;
        unsigned int v25 = *((_DWORD *)a2 + 2);
        unsigned int v26 = *((_DWORD *)a2 + 3);
      }
    }
    unsigned int v28 = a3 + 2;
    if (v25 <= a3 + 2 || v26 <= a4)
    {
      float16x4_t v29 = v17;
    }
    else
    {
      float16x4_t v29 = *(float16x4_t *)(*a2 + 8 * (v28 + *((_DWORD *)a2 + 4) * a4));
      float16x4_t v112 = v29;
      if (*(unsigned char *)(a5 + 7))
      {
        RB::Fill::MeshGradient::ColorConversion::convert(a5, &v112);
        float16x4_t v29 = v112;
        unsigned int v25 = *((_DWORD *)a2 + 2);
        unsigned int v26 = *((_DWORD *)a2 + 3);
      }
    }
    if (v25 <= v24 || v26 <= v19)
    {
      float16x4_t v30 = v21;
    }
    else
    {
      float16x4_t v30 = *(float16x4_t *)(*a2 + 8 * (v24 + *((_DWORD *)a2 + 4) * v19));
      float16x4_t v112 = v30;
      if (*(unsigned char *)(a5 + 7))
      {
        RB::Fill::MeshGradient::ColorConversion::convert(a5, &v112);
        float16x4_t v30 = v112;
        unsigned int v25 = *((_DWORD *)a2 + 2);
        unsigned int v26 = *((_DWORD *)a2 + 3);
      }
    }
    float16x4_t v31 = v23;
    if (v25 > v28)
    {
      float16x4_t v31 = v23;
      if (v26 > v19)
      {
        float16x4_t v31 = *(float16x4_t *)(*a2 + 8 * (v28 + *((_DWORD *)a2 + 4) * v19));
        float16x4_t v112 = v31;
        if (*(unsigned char *)(a5 + 7))
        {
          RB::Fill::MeshGradient::ColorConversion::convert(a5, &v112);
          float16x4_t v31 = v112;
        }
      }
    }
    float32x4_t v32 = vcvtq_f32_f16(v14);
    float32x4_t v33 = vsubq_f32(v32, vcvtq_f32_f16(v27));
    float32x4_t v34 = vcvtq_f32_f16(v17);
    float32x4_t v35 = vsubq_f32(v34, v32);
    float32x4_t v36 = vsubq_f32(vcvtq_f32_f16(v29), v34);
    v37.i64[0] = 0x3F0000003F000000;
    v37.i64[1] = 0x3F0000003F000000;
    int8x16_t v38 = (int8x16_t)vmulq_f32(vaddq_f32(v36, v35), v37);
    int8x16_t v39 = (int8x16_t)vcltzq_f32(v35);
    float32x4_t v40 = (float32x4_t)vbicq_s8((int8x16_t)vmulq_f32(vaddq_f32(v33, v35), v37), veorq_s8((int8x16_t)vcltzq_f32(v33), v39));
    __asm { FMOV            V18.4S, #3.0 }
    float32x4_t v46 = vmulq_f32(v33, _Q18);
    float32x4_t v47 = (float32x4_t)vbslq_s8((int8x16_t)vcagtq_f32(v40, v46), (int8x16_t)v46, (int8x16_t)v40);
    float32x4_t v48 = vmulq_f32(v35, _Q18);
    float32x4_t v49 = (float32x4_t)vbslq_s8((int8x16_t)vcagtq_f32(v47, v48), (int8x16_t)v48, (int8x16_t)v47);
    float32x4_t v50 = (float32x4_t)vbicq_s8(v38, veorq_s8((int8x16_t)vcltzq_f32(v36), v39));
    float32x4_t v51 = (float32x4_t)vbslq_s8((int8x16_t)vcagtq_f32(v50, v48), (int8x16_t)v48, (int8x16_t)v50);
    float32x4_t v52 = vmulq_f32(v36, _Q18);
    float32x4_t v53 = (float32x4_t)vbslq_s8((int8x16_t)vcagtq_f32(v51, v52), (int8x16_t)v52, (int8x16_t)v51);
    float32x4_t v54 = (float32x4_t)vdupq_n_s32(0x3EAAAAABu);
    float32x4_t v108 = v32;
    float32x4_t v55 = vmlaq_f32(v32, v54, v49);
    float32x4_t v110 = v34;
    float32x4_t v56 = vmlsq_f32(v34, v54, v53);
    *(float16x4_t *)v53.f32 = vcvt_f16_f32(v55);
    float32x4_t v57 = vcvtq_f32_f16(v21);
    float32x4_t v58 = vsubq_f32(v57, vcvtq_f32_f16(v30));
    float32x4_t v59 = vcvtq_f32_f16(v23);
    float32x4_t v60 = vsubq_f32(v59, v57);
    float32x4_t v61 = vsubq_f32(vcvtq_f32_f16(v31), v59);
    int8x16_t v62 = (int8x16_t)vmulq_f32(vaddq_f32(v58, v60), v37);
    int8x16_t v63 = (int8x16_t)vmulq_f32(vaddq_f32(v61, v60), v37);
    int8x16_t v64 = (int8x16_t)vcltzq_f32(v60);
    float32x4_t v65 = (float32x4_t)vbicq_s8(v62, veorq_s8((int8x16_t)vcltzq_f32(v58), v64));
    float32x4_t v66 = vmulq_f32(v58, _Q18);
    float32x4_t v67 = (float32x4_t)vbslq_s8((int8x16_t)vcagtq_f32(v65, v66), (int8x16_t)v66, (int8x16_t)v65);
    float32x4_t v68 = vmulq_f32(v60, _Q18);
    float32x4_t v69 = (float32x4_t)vbicq_s8(v63, veorq_s8((int8x16_t)vcltzq_f32(v61), v64));
    float32x4_t v70 = (float32x4_t)vbslq_s8((int8x16_t)vcagtq_f32(v69, v68), (int8x16_t)v68, (int8x16_t)v69);
    float32x4_t v109 = _Q18;
    float32x4_t v71 = vmulq_f32(v61, _Q18);
    float32x4_t v107 = v57;
    a1[16] = *(float16x4_t *)v53.f32;
    a1[17] = vcvt_f16_f32(vmlaq_f32(v57, v54, (float32x4_t)vbslq_s8((int8x16_t)vcagtq_f32(v67, v68), (int8x16_t)v68, (int8x16_t)v67)));
    a1[18] = vcvt_f16_f32(v56);
    a1[19] = vcvt_f16_f32(vmlsq_f32(v59, v54, (float32x4_t)vbslq_s8((int8x16_t)vcagtq_f32(v70, v71), (int8x16_t)v71, (int8x16_t)v70)));
    unsigned int v72 = a4 - 1;
    unsigned int v73 = *((_DWORD *)a2 + 2);
    unsigned int v74 = *((_DWORD *)a2 + 3);
    float32x4_t v111 = v59;
    if (v73 > a3 && v74 > v72)
    {
      float16x4_t v14 = *(float16x4_t *)(*a2 + 8 * (a3 + *((_DWORD *)a2 + 4) * v72));
      float16x4_t v112 = v14;
      if (*(unsigned char *)(a5 + 7))
      {
        RB::Fill::MeshGradient::ColorConversion::convert(a5, &v112);
        float32x4_t v59 = v111;
        float16x4_t v14 = v112;
        unsigned int v73 = *((_DWORD *)a2 + 2);
        unsigned int v74 = *((_DWORD *)a2 + 3);
      }
    }
    if (v73 > v16 && v74 > v72)
    {
      float16x4_t v17 = *(float16x4_t *)(*a2 + 8 * (v16 + *((_DWORD *)a2 + 4) * v72));
      float16x4_t v112 = v17;
      if (*(unsigned char *)(a5 + 7))
      {
        RB::Fill::MeshGradient::ColorConversion::convert(a5, &v112);
        float32x4_t v59 = v111;
        float16x4_t v17 = v112;
        unsigned int v73 = *((_DWORD *)a2 + 2);
        unsigned int v74 = *((_DWORD *)a2 + 3);
      }
    }
    unsigned int v75 = a4 + 2;
    if (v73 > a3 && v74 > v75)
    {
      float16x4_t v21 = *(float16x4_t *)(*a2 + 8 * (a3 + *((_DWORD *)a2 + 4) * v75));
      float16x4_t v112 = v21;
      if (*(unsigned char *)(a5 + 7))
      {
        RB::Fill::MeshGradient::ColorConversion::convert(a5, &v112);
        float32x4_t v59 = v111;
        float16x4_t v21 = v112;
        unsigned int v73 = *((_DWORD *)a2 + 2);
        unsigned int v74 = *((_DWORD *)a2 + 3);
      }
    }
    float32x4_t v76 = v59;
    if (v73 > v16)
    {
      float32x4_t v76 = v59;
      if (v74 > v75)
      {
        float16x4_t v77 = *(float16x4_t *)(*a2 + 8 * (v16 + *((_DWORD *)a2 + 4) * v75));
        float16x4_t v112 = v77;
        if (*(unsigned char *)(a5 + 7))
        {
          RB::Fill::MeshGradient::ColorConversion::convert(a5, &v112);
          float32x4_t v59 = v111;
          float16x4_t v77 = v112;
        }
        float32x4_t v76 = vcvtq_f32_f16(v77);
      }
    }
    float32x4_t v78 = vsubq_f32(v108, vcvtq_f32_f16(v14));
    float32x4_t v79 = vsubq_f32(v107, v108);
    float32x4_t v80 = vsubq_f32(vcvtq_f32_f16(v21), v107);
    v81.i64[0] = 0x3F0000003F000000;
    v81.i64[1] = 0x3F0000003F000000;
    int8x16_t v82 = (int8x16_t)vmulq_f32(vaddq_f32(v80, v79), v81);
    int8x16_t v83 = (int8x16_t)vcltzq_f32(v79);
    float32x4_t v84 = (float32x4_t)vbicq_s8((int8x16_t)vmulq_f32(vaddq_f32(v78, v79), v81), veorq_s8((int8x16_t)vcltzq_f32(v78), v83));
    float32x4_t v85 = vmulq_f32(v78, v109);
    float32x4_t v86 = (float32x4_t)vbslq_s8((int8x16_t)vcagtq_f32(v84, v85), (int8x16_t)v85, (int8x16_t)v84);
    float32x4_t v87 = vmulq_f32(v79, v109);
    float32x4_t v88 = (float32x4_t)vbslq_s8((int8x16_t)vcagtq_f32(v86, v87), (int8x16_t)v87, (int8x16_t)v86);
    float32x4_t v89 = (float32x4_t)vbicq_s8(v82, veorq_s8((int8x16_t)vcltzq_f32(v80), v83));
    float32x4_t v90 = (float32x4_t)vbslq_s8((int8x16_t)vcagtq_f32(v89, v87), (int8x16_t)v87, (int8x16_t)v89);
    float32x4_t v91 = vmulq_f32(v80, v109);
    float32x4_t v92 = (float32x4_t)vbslq_s8((int8x16_t)vcagtq_f32(v90, v91), (int8x16_t)v91, (int8x16_t)v90);
    float32x4_t v93 = (float32x4_t)vdupq_n_s32(0x3EAAAAABu);
    float32x4_t v94 = vsubq_f32(v110, vcvtq_f32_f16(v17));
    float32x4_t v95 = vsubq_f32(v59, v110);
    float32x4_t v96 = vsubq_f32(v76, v59);
    int8x16_t v97 = (int8x16_t)vmulq_f32(vaddq_f32(v94, v95), v81);
    int8x16_t v98 = (int8x16_t)vmulq_f32(vaddq_f32(v96, v95), v81);
    int8x16_t v99 = (int8x16_t)vcltzq_f32(v95);
    float32x4_t v100 = (float32x4_t)vbicq_s8(v97, veorq_s8((int8x16_t)vcltzq_f32(v94), v99));
    float32x4_t v101 = vmulq_f32(v94, v109);
    float32x4_t v102 = (float32x4_t)vbslq_s8((int8x16_t)vcagtq_f32(v100, v101), (int8x16_t)v101, (int8x16_t)v100);
    float32x4_t v103 = vmulq_f32(v95, v109);
    float32x4_t v104 = (float32x4_t)vbicq_s8(v98, veorq_s8((int8x16_t)vcltzq_f32(v96), v99));
    float32x4_t v105 = (float32x4_t)vbslq_s8((int8x16_t)vcagtq_f32(v104, v103), (int8x16_t)v103, (int8x16_t)v104);
    float32x4_t v106 = vmulq_f32(v96, v109);
    a1[14] = vcvt_f16_f32(vmlaq_f32(v108, v93, v88));
    a1[15] = vcvt_f16_f32(vmlsq_f32(v107, v93, v92));
    a1[20] = vcvt_f16_f32(vmlaq_f32(v110, v93, (float32x4_t)vbslq_s8((int8x16_t)vcagtq_f32(v102, v103), (int8x16_t)v103, (int8x16_t)v102)));
    a1[21] = vcvt_f16_f32(vmlsq_f32(v59, v93, (float32x4_t)vbslq_s8((int8x16_t)vcagtq_f32(v105, v106), (int8x16_t)v106, (int8x16_t)v105)));
  }
}

uint64_t RB::Fill::MeshGradient::set_fill_state(uint64_t this, RB::RenderState *a2, const RB::RenderPass *a3, float a4, char a5)
{
  unsigned int v5 = *(unsigned __int8 *)(this + 39);
  int v6 = v5 & 0xF;
  if ((v6 - 1) < 2)
  {
    int v8 = (*(unsigned __int8 *)(this + 38) >> 1) & 8;
    if (a5) {
      goto LABEL_22;
    }
  }
  else
  {
    if (v6 == 6) {
      __int16 v7 = 16;
    }
    else {
      __int16 v7 = 0;
    }
    if (v6 == 5) {
      LOWORD(v8) = 24;
    }
    else {
      LOWORD(v8) = v7;
    }
    if (a5) {
      goto LABEL_22;
    }
  }
  int v9 = *(unsigned char *)(this + 38) & 0xF;
  switch(v9)
  {
    case 1:
      goto LABEL_16;
    case 3:
      LOWORD(v8) = v8 | 4;
LABEL_16:
      __int16 v10 = *((unsigned char *)a3 + 124) & 1;
      goto LABEL_17;
    case 2:
      __int16 v10 = (*((unsigned char *)a3 + 124) & 1) == 0;
LABEL_17:
      LOWORD(v8) = v8 | v10;
      break;
  }
  int v11 = (v5 >> 3) & 2;
  if (a4 != 1.0) {
    LOWORD(v11) = 0;
  }
  __int16 v12 = v8 & 0xFFFD | v11;
  if (v8) {
    LOWORD(v8) = v12;
  }
LABEL_22:
  *(_DWORD *)a2 = *(_DWORD *)a2 & 0xFFFFF | ((unsigned __int16)v8 << 20);
  return this;
}

void RB::Fill::MeshGradient::fill(int32x2_t *a1, int8x8_t *a2, int32x2_t a3, int32x2_t a4)
{
  int32x2_t v5 = a3;
  a3.i32[0] = 0;
  v171[112] = *MEMORY[0x263EF8340];
  uint32x2_t v8 = (uint32x2_t)vceq_s32(a4, (int32x2_t)0x8000000080000000);
  int8x8_t v9 = (int8x8_t)vdup_lane_s32(vcgt_s32(a3, (int32x2_t)vpmin_u32(v8, v8)), 0);
  float32x2_t v10 = (float32x2_t)vbsl_s8(v9, (int8x8_t)vdup_n_s32(0x7F7FFFFFu), (int8x8_t)vcvt_f32_s32(a4));
  float32x2_t v96 = (float32x2_t)vbsl_s8(v9, (int8x8_t)0x100000001000000, (int8x8_t)vcvt_f32_s32(v5));
  float32x2_t v168 = v96;
  float32x2_t v169 = v10;
  CGRect ClipBoundingBox = CGContextGetClipBoundingBox((CGContextRef)*(void *)a2);
  CGFloat y = ClipBoundingBox.origin.y;
  CGFloat height = ClipBoundingBox.size.height;
  RB::Rect::intersect(&v168, COERCE_DOUBLE(vcvt_f32_f64((float64x2_t)ClipBoundingBox.origin)), vcvt_f32_f64((float64x2_t)ClipBoundingBox.size), ClipBoundingBox.size.width, ClipBoundingBox.size.height, v13, v14);
  uint32x2_t v15 = (uint32x2_t)vclez_f32(v169);
  if ((vpmax_u32(v15, v15).u32[0] & 0x80000000) != 0) {
    return;
  }
  RB::CGContext::begin_bitmap(a2, &v168, 2, 0, 0, 0, &v167);
  if (!v167) {
    return;
  }
  __asm { FMOV            V0.2S, #1.0 }
  RB::CGContext::CGContext(v171, v167, a2[1].u8[0], _D0);
  RB::Fill::Color::fill((uint64_t)&a1[3] + 4, (uint64_t)v171, (uint16x4_t)v5);
  RB::CGContext::Raster::Raster((RB::CGContext::Raster *)v170, (RB::CGContext *)v171);
  int v20 = a2[1].u8[0];
  int v21 = v20;
  if (a1[4].i8[5]) {
    int v21 = a1[4].u8[4];
  }
  int v22 = 0;
  __int8 v23 = a1[4].i8[7];
  __int8 v24 = a1[4].i8[6];
  int v162 = 1065353216;
  char v163 = v21;
  unsigned __int8 v164 = v20;
  char v165 = 0;
  int v25 = v24 & 0xF;
  if (v25 == 1) {
    goto LABEL_10;
  }
  if (v25 == 3)
  {
    int v22 = 1;
    char v165 = 1;
LABEL_10:
    v20 &= 0xFEu;
    goto LABEL_11;
  }
  if (v25 != 2) {
    goto LABEL_12;
  }
  int v22 = 0;
  v20 |= 1u;
LABEL_11:
  unsigned __int8 v164 = v20;
LABEL_12:
  BOOL v27 = v20 != v21 || (v23 & 0x10) == 0 || v22 != 0;
  BOOL v166 = v27;
  v161[0] = (uint64_t)a1;
  v161[1] = (uint64_t)v170;
  v161[2] = (uint64_t)&v162;
  int v28 = v23 & 0xF;
  if ((v28 - 1) >= 4)
  {
    if (v28 == 6)
    {
      if (a1[3].i32[0])
      {
        unsigned __int32 v82 = 0;
        int v83 = 2;
        do
        {
          RB::Fill::MeshGradient::fill(RB::CGContext &,RB::Bounds)const::$_0::operator()(v161, v83 - 2, v83 - 1, v83);
          ++v82;
          v83 += 3;
        }
        while (v82 < a1[3].i32[0]);
      }
    }
    else if (v28 == 5 && a1->i32[1] != 1)
    {
      unsigned int v37 = 0;
      int32x2_t v38 = *a1;
      do
      {
        __int32 v39 = v38.i32[0];
        if (v38.i32[0] != 1)
        {
          unsigned int v40 = 0;
          do
          {
            __int32 v41 = v38.i32[1];
            unsigned int v42 = v40 + v37 * v38.i32[1];
            unsigned int v43 = v42 + 1;
            int v44 = v42 + v39;
            RB::Fill::MeshGradient::fill(RB::CGContext &,RB::Bounds)const::$_0::operator()(v161, v42, v42 + 1, v42 + v39);
            RB::Fill::MeshGradient::fill(RB::CGContext &,RB::Bounds)const::$_0::operator()(v161, v43, v39 + v40++ + v37 * v41 + 1, v44);
            int32x2_t v38 = *a1;
            __int32 v39 = (__int32)*a1;
          }
          while (v40 < v39 - 1);
        }
        ++v37;
      }
      while (v37 < v38.i32[1] - 1);
    }
    goto LABEL_67;
  }
  unint64_t v29 = RB::Fill::MeshGradient::patches_info(a1);
  uint64_t v31 = v30;
  unint64_t v32 = HIDWORD(v29);
  size_t v33 = v29 * (unint64_t)HIDWORD(v29);
  unint64_t v86 = v33;
  if (v33 <= 0x1000)
  {
    MEMORY[0x270FA5388](v33, v30);
    float32x4_t v35 = (char *)&v85 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v35, v34);
    goto LABEL_33;
  }
  float32x4_t v35 = (char *)malloc_type_malloc(v33, 0x8CB3090EuLL);
  if (v35)
  {
LABEL_33:
    float32x2_t v45 = (long long *)a1[2];
    if (v45)
    {
      long long v46 = *v45;
      long long v36 = v45[2];
      long long v150 = v45[1];
      long long v151 = v36;
      long long v149 = v46;
    }
    else
    {
      long long v149 = xmmword_2142181C0;
      long long v150 = xmmword_2142181D0;
      long long v151 = 0uLL;
    }
    RB::Fill::MeshGradient::PatchBuffer::PatchBuffer(&v152, v32, v31, (uint64_t)&v149, HIDWORD(v31) & 0xFFFFFFFB, v5, a4, *(int32x2_t *)&v36);
    char v158 = 1;
    v159 = v35;
    unint64_t v160 = v86;
    RB::Fill::MeshGradient::make_patches((float32x2_t *)a1, (RB::Fill::MeshGradient::PatchBuffer *)&v152, (uint64_t)&v162);
    float v47 = fmaxf(sqrtf((float)(v156 * 4.0) * sqrtf(vaddv_f32(vmul_f32(v154, v154)))), 1.0);
    float v48 = sqrtf(v155) * 0.125;
    if (v47 < v48) {
      float v47 = v48;
    }
    float v49 = ceilf(log2f(v47));
    if (v49 > 7.0) {
      float v49 = 7.0;
    }
    if (v157)
    {
      unint64_t v50 = 0;
      uint64_t v51 = (1 << v49);
      float32x2_t v52 = vadd_f32(v10, v96);
      float16x4_t v87 = (float16x4_t)vdup_n_s16(0x3955u);
      float16x4_t v88 = (float16x4_t)vdup_n_s16(0x3555u);
      do
      {
        float32x4_t v53 = (float16x4_t *)&v35[v32 * v50];
        float16x4_t v95 = v53[3];
        float16x4_t v54 = (float16x4_t)vcvtq_f32_f16(v53[4]).u64[0];
        v54.i32[0] = v53[4].i32[1];
        float32x4_t v55 = vcvtq_f32_f16(v54);
        float16x4_t v56 = v53[6];
        v55.i32[0] = v53[6].i32[1];
        float16x4_t v93 = *(float16x4_t *)v55.f32;
        float16x4_t v89 = v53[7];
        v55.i32[1] = v89.i32[1];
        v55.i32[0] = v53[7].i32[1];
        uint64_t v90 = v55.i64[0];
        float16x4_t v91 = v56;
        float16x4_t v92 = v53[9];
        v55.i32[1] = v92.i32[1];
        v55.i32[0] = v53[9].i32[1];
        float16x4_t v94 = *(float16x4_t *)v55.f32;
        _ZN2RB13CubicIteratorIDv2_fEC1ES1_S1_S1_S1_i(&v149, v51);
        _ZN2RB13CubicIteratorIDv2_fEC1ES1_S1_S1_S1_i(&v145, v51);
        _ZN2RB13CubicIteratorIDv2_fEC1ES1_S1_S1_S1_i(&v141, v51);
        _ZN2RB13CubicIteratorIDv2_fEC1ES1_S1_S1_S1_i(&v137, v51);
        float16x4_t v57 = v53[11];
        float16x4_t v58 = v53[12];
        float16x4_t v59 = v53[13];
        float16x4_t v94 = v58;
        float16x4_t v91 = v59;
        if ((v153 & 2) != 0)
        {
          float16x4_t v95 = v53[19];
          float16x4_t v61 = v53[20];
          float16x4_t v92 = v53[21];
          float16x4_t v93 = v61;
        }
        else
        {
          float16x4_t v60 = vsub_f16(v59, v58);
          float16x4_t v92 = vmla_f16(v58, v87, v60);
          float16x4_t v93 = vmla_f16(v58, v88, v60);
          float16x4_t v95 = vmla_f16(v57, v87, vsub_f16(v59, v57));
        }
        _ZN2RB13CubicIteratorIDv4_DF16_EC1ES1_S1_S1_S1_i(&v133, v51);
        _ZN2RB13CubicIteratorIDv4_DF16_EC1ES1_S1_S1_S1_i(&v129, v51);
        _ZN2RB13CubicIteratorIDv4_DF16_EC1ES1_S1_S1_S1_i(&v125, v51);
        _ZN2RB13CubicIteratorIDv4_DF16_EC1ES1_S1_S1_S1_i(&v121, v51);
        int v62 = 0;
        do
        {
          _ZN2RB13CubicIteratorIDv2_fEC1ES1_S1_S1_S1_i(&v117, v51);
          *(float32x2_t *)&long long v149 = vadd_f32(*(float32x2_t *)&v149, *(float32x2_t *)((char *)&v149 + 8));
          *((float32x2_t *)&v149 + 1) = vadd_f32(*(float32x2_t *)&v150, *(float32x2_t *)((char *)&v149 + 8));
          *(float32x2_t *)&long long v150 = vadd_f32(*(float32x2_t *)((char *)&v150 + 8), *(float32x2_t *)&v150);
          float32x2_t v145 = vadd_f32(v145, v146);
          float32x2_t v146 = vadd_f32(v147, v146);
          float32x2_t v147 = vadd_f32(v148, v147);
          float32x2_t v141 = vadd_f32(v141, v142);
          float32x2_t v142 = vadd_f32(v143, v142);
          float32x2_t v143 = vadd_f32(v144, v143);
          float32x2_t v137 = vadd_f32(v137, v138);
          float32x2_t v138 = vadd_f32(v139, v138);
          float32x2_t v139 = vadd_f32(v140, v139);
          _ZN2RB13CubicIteratorIDv2_fEC1ES1_S1_S1_S1_i(&v113, v51);
          _ZN2RB13CubicIteratorIDv4_DF16_EC1ES1_S1_S1_S1_i(&v109, v51);
          float16x4_t v133 = vadd_f16(v133, v134);
          float16x4_t v134 = vadd_f16(v135, v134);
          float16x4_t v135 = vadd_f16(v136, v135);
          float16x4_t v129 = vadd_f16(v129, v130);
          float16x4_t v130 = vadd_f16(v131, v130);
          float16x4_t v131 = vadd_f16(v132, v131);
          float16x4_t v125 = vadd_f16(v125, v126);
          float16x4_t v126 = vadd_f16(v127, v126);
          float16x4_t v127 = vadd_f16(v128, v127);
          float16x4_t v121 = vadd_f16(v121, v122);
          float16x4_t v122 = vadd_f16(v123, v122);
          float16x4_t v123 = vadd_f16(v124, v123);
          _ZN2RB13CubicIteratorIDv4_DF16_EC1ES1_S1_S1_S1_i(&v105, v51);
          int v63 = v51;
          do
          {
            float32x2_t v64 = v117;
            float32x2_t v65 = vadd_f32(v118, v117);
            float32x2_t v117 = v65;
            float32x2_t v118 = vadd_f32(v119, v118);
            float32x2_t v119 = vadd_f32(v120, v119);
            float32x2_t v66 = v113;
            float32x2_t v67 = vadd_f32(v114, v113);
            float32x2_t v113 = v67;
            float32x2_t v114 = vadd_f32(v115, v114);
            float32x2_t v115 = vadd_f32(v116, v115);
            uint16x4_t v68 = v109;
            float16x4_t v69 = vadd_f16(v110, (float16x4_t)v109);
            uint16x4_t v109 = (uint16x4_t)v69;
            float16x4_t v110 = vadd_f16(v111, v110);
            float16x4_t v111 = vadd_f16(v112, v111);
            float16x4_t v70 = v105;
            float16x4_t v71 = vadd_f16(v106, v105);
            float16x4_t v105 = v71;
            float16x4_t v106 = vadd_f16(v107, v106);
            float16x4_t v107 = vadd_f16(v108, v107);
            unsigned int v72 = (float64x2_t *)a1[2];
            if (v72)
            {
              float64x2_t v73 = vcvtq_f64_f32(v64);
              float64x2_t v74 = v72[1];
              float32x2_t v64 = vcvt_f32_f64(vmlaq_laneq_f64(vmlaq_n_f64(v72[2], *v72, v73.f64[0]), v74, v73, 1));
              float64x2_t v75 = vcvtq_f64_f32(v66);
              float32x2_t v66 = vcvt_f32_f64(vmlaq_laneq_f64(vmlaq_n_f64(v72[2], *v72, v75.f64[0]), v74, v75, 1));
              float64x2_t v76 = vcvtq_f64_f32(v65);
              float32x2_t v65 = vcvt_f32_f64(vmlaq_laneq_f64(vmlaq_n_f64(v72[2], *v72, v76.f64[0]), v74, v76, 1));
              float64x2_t v77 = vcvtq_f64_f32(v67);
              float32x2_t v67 = vcvt_f32_f64(vmlaq_laneq_f64(vmlaq_n_f64(v72[2], *v72, v77.f64[0]), v74, v77, 1));
            }
            uint32x2_t v78 = (uint32x2_t)vorr_s8((int8x8_t)vcgt_f32(v96, vmaxnm_f32(vmaxnm_f32(v64, v66), vmaxnm_f32(v65, v67))), (int8x8_t)vcgt_f32(vminnm_f32(vminnm_f32(v64, v66), vminnm_f32(v65, v67)), v52));
            if ((vpmax_u32(v78, v78).u32[0] & 0x80000000) == 0)
            {
              uint64_t v101 = 0x3C00000000000000;
              __int16 v102 = 0;
              uint64_t v99 = 0x3C00000000000000;
              __int16 v100 = 0;
              uint64_t v97 = 0x3C00000000000000;
              __int16 v98 = 0;
              int v79 = v164;
              uint16x4_t v103 = v68;
              __int16 v80 = v164 | 0x100;
              __int16 v104 = v80;
              BOOL v81 = v166;
              if (v166)
              {
                RB::Fill::MeshGradient::ColorConversion::convert_out_slow((uint64_t)&v162, (RB::Fill::Color *)&v103, v164, v68);
                int v79 = v164;
                BOOL v81 = v166;
                __int16 v80 = v164 | 0x100;
              }
              uint64_t v101 = (uint64_t)v70;
              __int16 v102 = v80;
              if (v81)
              {
                RB::Fill::MeshGradient::ColorConversion::convert_out_slow((uint64_t)&v162, (RB::Fill::Color *)&v101, v79, v68);
                int v79 = v164;
                BOOL v81 = v166;
                __int16 v80 = v164 | 0x100;
              }
              uint64_t v99 = (uint64_t)v69;
              __int16 v100 = v80;
              if (v81)
              {
                RB::Fill::MeshGradient::ColorConversion::convert_out_slow((uint64_t)&v162, (RB::Fill::Color *)&v99, v79, v68);
                int v79 = v164;
                BOOL v81 = v166;
                __int16 v80 = v164 | 0x100;
              }
              uint64_t v97 = (uint64_t)v71;
              __int16 v98 = v80;
              if (v81) {
                RB::Fill::MeshGradient::ColorConversion::convert_out_slow((uint64_t)&v162, (RB::Fill::Color *)&v97, v79, v68);
              }
              RB::CGContext::Raster::fill_triangle((uint64_t)v170, (uint64_t)&v103, (uint64_t)&v97, (uint64_t)&v101, v64, v67, v66);
              RB::CGContext::Raster::fill_triangle((uint64_t)v170, (uint64_t)&v103, (uint64_t)&v99, (uint64_t)&v97, v64, v65, v67);
            }
            --v63;
          }
          while (v63);
          ++v62;
        }
        while (v62 != v51);
        ++v50;
      }
      while (v50 < v157);
    }
    if (v86 <= 0x1000) {
      goto LABEL_67;
    }
  }
  free(v35);
LABEL_67:
  Image = CGBitmapContextCreateImage(v167);
  v173.origin.x = v168.f32[0];
  v173.origin.CGFloat y = v168.f32[1];
  v173.size.width = v169.f32[0];
  v173.size.CGFloat height = v169.f32[1];
  CGContextDrawImage(*(CGContextRef *)a2, v173, Image);
  if (Image) {
    CFRelease(Image);
  }
  RB::CGContext::~CGContext((RB::CGContext *)v171);
  if (v167) {
    CFRelease(v167);
  }
}

void sub_21420A94C(_Unwind_Exception *a1)
{
  RB::CGContext::~CGContext((RB::CGContext *)(v1 + 784));
  __int32 v3 = *(const void **)(v1 + 680);
  if (v3) {
    CFRelease(v3);
  }
  _Unwind_Resume(a1);
}

void RB::Fill::MeshGradient::fill(RB::CGContext &,RB::Bounds)const::$_0::operator()(uint64_t *a1, unsigned int a2, int a3, int a4)
{
  uint64_t v8 = 0;
  v29[3] = *(float32x2_t *)MEMORY[0x263EF8340];
  uint64_t v9 = *a1;
  uint64_t v10 = *(_DWORD *)(*a1 + 24) * RB::Fill::MeshGradient::points_per_elt[*(unsigned char *)(*a1 + 39) & 0xF];
  uint64_t v11 = *(void *)(*a1 + 8);
  do
  {
    __int16 v12 = &v26[v8];
    *(void *)__int16 v12 = 0x3C00000000000000;
    *((_WORD *)v12 + 4) = 0;
    v8 += 10;
  }
  while (v8 != 30);
  uint64_t v13 = 0;
  uint64_t v14 = v11 + 16;
  uint64_t v15 = v11 + 16 + 8 * v10;
  unsigned int v16 = v29;
  do
  {
    if (v13 == 10) {
      LODWORD(v17) = a3;
    }
    else {
      LODWORD(v17) = a4;
    }
    if (v13) {
      uint64_t v17 = v17;
    }
    else {
      uint64_t v17 = a2;
    }
    float32x2_t v18 = *(float32x2_t *)(v14 + 8 * v17);
    *unsigned int v16 = v18;
    unsigned int v19 = *(float64x2_t **)(v9 + 16);
    if (v19)
    {
      float64x2_t v20 = vcvtq_f64_f32(v18);
      *unsigned int v16 = vcvt_f32_f64(vmlaq_laneq_f64(vmlaq_n_f64(v19[2], *v19, v20.f64[0]), v19[1], v20, 1));
    }
    uint16x4_t v21 = *(uint16x4_t *)(v15 + 8 * v17);
    uint16x4_t v25 = v21;
    uint64_t v22 = a1[2];
    if (*(unsigned char *)(v22 + 7))
    {
      RB::Fill::MeshGradient::ColorConversion::convert(v22, (float16x4_t *)&v25);
      uint16x4_t v21 = v25;
      uint64_t v22 = a1[2];
    }
    __int8 v23 = (RB::Fill::Color *)&v26[v13];
    int v24 = *(unsigned __int8 *)(v22 + 5);
    *(uint16x4_t *)__int8 v23 = v21;
    *((_WORD *)v23 + 4) = v24 | 0x100;
    if (*(unsigned char *)(v22 + 7) || *(unsigned __int8 *)(v22 + 5) != v24) {
      RB::Fill::MeshGradient::ColorConversion::convert_out_slow(v22, v23, v24, v21);
    }
    v13 += 10;
    ++v16;
  }
  while (v13 != 30);
  RB::CGContext::Raster::fill_triangle(a1[1], (uint64_t)v26, (uint64_t)&v27, (uint64_t)&v28, v29[0], v29[1], v29[2]);
}

void *RB::Fill::MeshGradient::encode(RB::Fill::MeshGradient *this, RB::Encoder *a2)
{
  unint64_t v4 = *((unsigned char *)this + 39) & 0xF;
  RB::ProtobufEncoder::encode_varint(a2, 8uLL);
  RB::ProtobufEncoder::encode_varint(a2, v4);
  RB::ProtobufEncoder::packed_fixed32_field(a2, 2, (const unsigned int *)(*((void *)this + 1) + 16), 2 * *((_DWORD *)this + 6) * RB::Fill::MeshGradient::points_per_elt[*((unsigned char *)this + 39) & 0xF]);
  float16x4_t result = RB::ProtobufEncoder::packed_fixed64_field(a2, 3, (const unint64_t *)(*((void *)this + 1)+ 8* *((_DWORD *)this + 6)* RB::Fill::MeshGradient::points_per_elt[*((unsigned char *)this + 39) & 0xF]+ 16), *((_DWORD *)this + 6) * RB::Fill::MeshGradient::colors_per_elt[*((unsigned char *)this + 39) & 0xF]);
  unint64_t v6 = *(void *)this;
  if (v6)
  {
    RB::ProtobufEncoder::encode_varint(a2, 0x20uLL);
    float16x4_t result = RB::ProtobufEncoder::encode_varint(a2, v6);
  }
  __asm { FCMP            H0, #0 }
  if (!_ZF) {
    goto LABEL_10;
  }
  __asm { FCMP            H0, #0 }
  if (!_ZF) {
    goto LABEL_10;
  }
  __asm { FCMP            H0, #0 }
  if (!_ZF) {
    goto LABEL_10;
  }
  __asm { FCMP            H0, #0 }
  if (!_ZF)
  {
LABEL_10:
    RB::ProtobufEncoder::encode_varint(a2, 0x2AuLL);
    RB::ProtobufEncoder::begin_length_delimited(a2);
    RB::Fill::Color::encode((RB::Fill::MeshGradient *)((char *)this + 28), a2);
    float16x4_t result = RB::ProtobufEncoder::end_length_delimited(a2);
  }
  uint64_t v15 = (float64x2_t *)*((void *)this + 2);
  if (v15)
  {
    int64x2_t v16 = (int64x2_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f64(v15[1], (float64x2_t)xmmword_2142181D0), (int8x16_t)vceqq_f64(*v15, (float64x2_t)xmmword_2142181C0)), (int8x16_t)vceqzq_f64(v15[2]));
    if ((vandq_s8((int8x16_t)vdupq_laneq_s64(v16, 1), (int8x16_t)v16).u64[0] & 0x8000000000000000) == 0)
    {
      RB::ProtobufEncoder::encode_varint(a2, 0x32uLL);
      RB::ProtobufEncoder::begin_length_delimited(a2);
      RB::AffineTransform::encode(v15->f64, a2);
      float16x4_t result = RB::ProtobufEncoder::end_length_delimited(a2);
    }
  }
  if ((*((unsigned char *)this + 38) & 0xFu) - 1 <= 2)
  {
    RB::ProtobufEncoder::encode_varint(a2, 8 * ((*((unsigned char *)this + 38) & 0xFu) - 1) + 56);
    float16x4_t result = RB::ProtobufEncoder::encode_varint(a2, 1uLL);
  }
  if ((*((unsigned char *)this + 38) & 0x10) != 0)
  {
    RB::ProtobufEncoder::encode_varint(a2, 0x50uLL);
    return RB::ProtobufEncoder::encode_varint(a2, 1uLL);
  }
  return result;
}

void RB::Fill::MeshGradient::decode(RB::Fill::MeshGradient *this, RB::Heap **a2)
{
  unsigned __int8 v4 = 0;
  unsigned int v5 = 0;
  __src = 0;
  unint64_t v24 = 0;
  unint64_t v25 = 0;
  float64x2_t v20 = 0;
  unint64_t v21 = 0;
  unint64_t v22 = 0;
  *(void *)((char *)this + 28) = 0;
  unint64_t v6 = (char *)this + 28;
  *((_WORD *)this + 18) = 0;
  while (1)
  {
    unint64_t field = RB::ProtobufDecoder::next_field((RB::ProtobufDecoder *)a2);
    if (!field) {
      break;
    }
    switch((field >> 3))
    {
      case 1u:
        unint64_t v8 = RB::ProtobufDecoder::uint_field((uint64_t **)a2, field);
        if (v8 <= 6) {
          unsigned __int8 v4 = v8;
        }
        else {
          unsigned __int8 v4 = 0;
        }
        continue;
      case 2u:
        float v9 = RB::ProtobufDecoder::float_field((RB::ProtobufDecoder *)a2, field);
        unint64_t v10 = v24;
        unint64_t v11 = v24 + 1;
        if (v25 < v24 + 1)
        {
          RB::vector<float,0ul,unsigned long>::reserve_slow((uint64_t)&__src, v11);
          unint64_t v10 = v24;
          unint64_t v11 = v24 + 1;
        }
        *((float *)__src + v10) = v9;
        unint64_t v24 = v11;
        continue;
      case 3u:
        double v12 = RB::ProtobufDecoder::color_field((unint64_t *)a2, field);
        unint64_t v13 = v21;
        if (v22 < v21 + 1)
        {
          RB::vector<unsigned long,0ul,unsigned long>::reserve_slow((uint64_t)&v20, v21 + 1);
          unint64_t v13 = v21;
        }
        *((double *)v20 + v13) = v12;
        ++v21;
        continue;
      case 4u:
        unsigned int v5 = RB::ProtobufDecoder::uint_field((uint64_t **)a2, field);
        continue;
      case 5u:
        if ((field & 7) == 2)
        {
          RB::ProtobufDecoder::begin_message((RB::ProtobufDecoder *)a2);
          RB::Fill::Color::decode((uint64_t)v6, (RB::ProtobufDecoder *)a2);
          RB::ProtobufDecoder::end_message((uint64_t)a2);
        }
        else
        {
          *((unsigned char *)a2 + 56) = 1;
          *a2 = a2[1];
        }
        continue;
      case 6u:
        v17[0] = (float64x2_t)xmmword_2142181C0;
        v17[1] = (float64x2_t)xmmword_2142181D0;
        uint64_t v18 = 0;
        uint64_t v19 = 0;
        if ((field & 7) == 2)
        {
          RB::ProtobufDecoder::begin_message((RB::ProtobufDecoder *)a2);
          RB::AffineTransform::decode((RB::AffineTransform *)v17, (RB::ProtobufDecoder *)a2);
          RB::ProtobufDecoder::end_message((uint64_t)a2);
        }
        else
        {
          *((unsigned char *)a2 + 56) = 1;
          *a2 = a2[1];
        }
        RB::Fill::Gradient::concat(this, v17, a2[8]);
        continue;
      case 7u:
        *((unsigned char *)this + 38) &= 0xF0u;
        *((unsigned char *)this + 38) |= RB::ProtobufDecoder::BOOL_field((RB::ProtobufDecoder *)a2, field);
        continue;
      case 8u:
        *((unsigned char *)this + 38) &= 0xF0u;
        if (RB::ProtobufDecoder::BOOL_field((RB::ProtobufDecoder *)a2, field)) {
          char v14 = 2;
        }
        else {
          char v14 = 0;
        }
        goto LABEL_29;
      case 9u:
        *((unsigned char *)this + 38) &= 0xF0u;
        if (RB::ProtobufDecoder::BOOL_field((RB::ProtobufDecoder *)a2, field)) {
          char v14 = 3;
        }
        else {
          char v14 = 0;
        }
        goto LABEL_29;
      case 0xAu:
        *((unsigned char *)this + 38) &= ~0x10u;
        if (RB::ProtobufDecoder::BOOL_field((RB::ProtobufDecoder *)a2, field)) {
          char v14 = 16;
        }
        else {
          char v14 = 0;
        }
LABEL_29:
        *((unsigned char *)this + 38) |= v14;
        break;
      default:
        continue;
    }
  }
  unint64_t v15 = 0;
  unsigned __int8 v26 = v4;
  if (v4 <= 6u)
  {
    if (((1 << v4) & 0x26) != 0)
    {
      unint64_t v15 = v21;
    }
    else if (((1 << v4) & 0x18) != 0)
    {
      unint64_t v15 = v21 >> 2;
    }
    else if (v4 == 6)
    {
      unint64_t v15 = v21 / 3;
    }
  }
  if (RB::Fill::MeshGradient::valid_config(&v26, v15, v5, this))
  {
    v17[0] = 0uLL;
    __dst[0] = 0;
    __dst[1] = 0;
    if (RB::Fill::MeshGradient::allocate_data((uint64_t)this, v4, v15, v17, __dst))
    {
      if (v15)
      {
        memcpy(*(void **)&v17[0].f64[0], __src, 8 * *(void *)&v17[0].f64[1]);
        if (v21) {
          memmove(__dst[0], v20, 8 * v21);
        }
      }
      RB::Fill::MeshGradient::update_colors(this);
    }
  }
  if (v20) {
    free(v20);
  }
  if (__src) {
    free(__src);
  }
}

void sub_21420B144(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24,void *a25)
{
  if (a22) {
    free(a22);
  }
  if (a25) {
    free(a25);
  }
  _Unwind_Resume(exception_object);
}

void RB::Fill::MeshGradient::attributes(RB::Fill::MeshGradient *this, RB::XML::Element *a2)
{
  __int32 v2 = "coons-patches";
  switch(*((unsigned char *)this + 39) & 0xF)
  {
    case 1:
      __int32 v2 = "vertex-grid";
      break;
    case 2:
      __int32 v2 = "bezier-grid";
      break;
    case 3:
      break;
    case 4:
      __int32 v2 = "tensor-product-patches";
      break;
    case 5:
      __int32 v2 = "triangle-grid";
      break;
    case 6:
      __int32 v2 = "triangles";
      break;
    default:
      uint64_t v3 = (*((unsigned char *)this + 38) & 0xF) - 1;
      if (v3 <= 2)
      {
        unsigned __int8 v4 = off_2641F9C50[v3];
        uint64_t v19 = &unk_26C4ED370;
        v20[0] = v4;
        RB::XML::Element::set<RB::XML::Value::ConstantString>();
      }
      unsigned int v5 = (float64x2_t *)*((void *)this + 2);
      if (v5)
      {
        float64x2_t v6 = *v5;
        float64x2_t v7 = v5[1];
        float64x2_t v8 = v5[2];
        int64x2_t v9 = (int64x2_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f64(v7, (float64x2_t)xmmword_2142181D0), (int8x16_t)vceqq_f64(*v5, (float64x2_t)xmmword_2142181C0)), (int8x16_t)vceqzq_f64(v8));
        if ((vandq_s8((int8x16_t)vdupq_laneq_s64(v9, 1), (int8x16_t)v9).u64[0] & 0x8000000000000000) == 0)
        {
          uint64_t v19 = &unk_26C4ED320;
          *(float64x2_t *)float64x2_t v20 = v6;
          float64x2_t v21 = v7;
          float64x2_t v22 = v8;
          RB::XML::Element::set<RB::XML::Value::AffineMatrix>();
        }
      }
      __asm { FCMP            H0, #0 }
      if (!_ZF) {
        goto LABEL_20;
      }
      __asm { FCMP            H0, #0 }
      if (!_ZF) {
        goto LABEL_20;
      }
      __asm { FCMP            H0, #0 }
      if (!_ZF) {
        goto LABEL_20;
      }
      __asm { FCMP            H0, #0 }
      if (!_ZF)
      {
LABEL_20:
        RB::XML::Value::Color::Color((RB::XML::Value::Color *)&v19, (RB::Fill::MeshGradient *)((char *)this + 28));
        RB::XML::Element::set<RB::XML::Value::Color>();
      }
      if (*((unsigned char *)this + 37))
      {
        int v18 = rb_color_space(*((unsigned __int8 *)this + 36) | 0x100u);
        uint64_t v19 = &unk_26C4E8130;
        LODWORD(v20[0]) = v18;
        RB::XML::Element::set<RB::XML::Value::ColorSpace>();
      }
      RB::XML::Value::FloatArray::FloatArray<float>(&v19, (float *)(*((void *)this + 1) + 16), 2 * *((_DWORD *)this + 6) * RB::Fill::MeshGradient::points_per_elt[*((unsigned char *)this + 39) & 0xF]);
      RB::XML::Element::set<RB::XML::Value::FloatArray>();
  }
  uint64_t v19 = &unk_26C4ED370;
  v20[0] = (void *)v2;
  RB::XML::Element::set<RB::XML::Value::ConstantString>();
}

void sub_21420B594(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11)
{
  if (a11) {
    free(a11);
  }
  _Unwind_Resume(exception_object);
}

void RB::XML::Element::set<RB::XML::Value::ColorArray>()
{
}

void sub_21420B718(_Unwind_Exception *a1)
{
  if (*v2) {
    free(*v2);
  }
  MEMORY[0x21669AC10](v1, 0x1081C40B7564605);
  _Unwind_Resume(a1);
}

atomic_uint *RB::Refcount<RB::Fill::MeshGradient::Data,std::atomic<unsigned int>>::release(atomic_uint *result)
{
  if (atomic_fetch_add_explicit(result + 2, 0xFFFFFFFF, memory_order_release) == 1)
  {
    __dmb(9u);
    return (atomic_uint *)(*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

void RB::Fill::MeshGradient::Data::~Data(RB::Fill::MeshGradient::Data *this)
{
}

void *RB::vector<RB::Fill::MeshGradient::MeshBuffer,4ul,unsigned int>::reserve_slow(void *__dst, unsigned int a2)
{
  if (*((_DWORD *)__dst + 35) + (*((_DWORD *)__dst + 35) >> 1) <= a2) {
    unsigned int v3 = a2;
  }
  else {
    unsigned int v3 = *((_DWORD *)__dst + 35) + (*((_DWORD *)__dst + 35) >> 1);
  }
  float16x4_t result = RB::details::realloc_vector<unsigned int,32ul>(*((void **)__dst + 16), __dst, 4u, (_DWORD *)__dst + 35, v3);
  *((void *)__dst + 16) = result;
  return result;
}

uint64_t _ZN2RB13CubicIteratorIDv4_DF16_EC2ES1_S1_S1_S1_i(uint64_t result, int a2, float16x4_t a3, float16x4_t a4, float16x4_t a5, float16x4_t a6)
{
  float16x4_t v6 = vmul_f16(vsub_f16(a4, a3), (float16x4_t)0x4200420042004200);
  float16x4_t v7 = vmla_f16(vneg_f16(v6), (float16x4_t)0x4200420042004200, vsub_f16(a5, a4));
  float16x4_t v8 = vsub_f16(a6, vadd_f16(vadd_f16(v6, a3), v7));
  _S3 = 1.0 / (float)a2;
  _S5 = _S3 * _S3;
  _S6 = (float)(_S3 * _S3) * _S3;
  __asm
  {
    FCVT            H6, S6
    FCVT            H5, S5
  }
  float16x4_t v16 = vmul_n_f16(vmul_f16(v8, (float16x4_t)0x4600460046004600), *(short float *)&_S6);
  *(float16x4_t *)(result + 24) = v16;
  float16x4_t v17 = vmul_n_f16(v7, *(short float *)&_S5);
  __asm { FCVT            H3, S3 }
  *(double *)float16x4_t result = *(double *)&a3;
  *(float16x4_t *)(result + 8) = vmla_n_f16(vmla_n_f16(v17, v6, *(short float *)&_S3), v8, *(short float *)&_S6);
  *(float16x4_t *)(result + 16) = vmla_f16(v16, (float16x4_t)0x4000400040004000, v17);
  return result;
}

uint64_t _ZN2RB3XML5Value10ColorArrayC2IDF16_EEPKDv4_T_m12RBColorSpace(uint64_t a1, uint64_t *a2, unint64_t a3, int a4)
{
  *(void *)a1 = &unk_26C4E8108;
  *(void *)(a1 + 8) = 0;
  uint64_t v5 = a1 + 8;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  *(_DWORD *)(a1 + 32) = a4;
  if (a3)
  {
    unint64_t v7 = a3;
    RB::vector<unsigned long,0ul,unsigned long>::reserve_slow(a1 + 8, a3);
    uint64_t v9 = *(void *)(a1 + 16);
    do
    {
      uint64_t v10 = *a2;
      if (*(void *)(a1 + 24) < (unint64_t)(v9 + 1))
      {
        RB::vector<unsigned long,0ul,unsigned long>::reserve_slow(v5, v9 + 1);
        uint64_t v9 = *(void *)(a1 + 16);
      }
      *(void *)(*(void *)(a1 + 8) + 8 * v9) = v10;
      uint64_t v9 = *(void *)(a1 + 16) + 1;
      *(void *)(a1 + 16) = v9;
      ++a2;
      --v7;
    }
    while (v7);
  }
  return a1;
}

void sub_21420B920(_Unwind_Exception *exception_object)
{
  if (*v1) {
    free(*v1);
  }
  _Unwind_Resume(exception_object);
}

void std::shared_ptr<RB::XML::Value::Base>::shared_ptr[abi:nn180100]<RB::XML::Value::ColorArray,void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_21420B9A4(_Unwind_Exception *exception_object)
{
  if (v1) {
    std::shared_ptr<RB::XML::Value::Base>::shared_ptr[abi:nn180100]<RB::XML::Value::Font,void>(v1);
  }
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_pointer<RB::XML::Value::ColorArray *,std::shared_ptr<RB::XML::Value::Base>::__shared_ptr_default_delete<RB::XML::Value::Base,RB::XML::Value::ColorArray>,std::allocator<RB::XML::Value::ColorArray>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x21669AC10);
}

uint64_t std::__shared_ptr_pointer<RB::XML::Value::ColorArray *,std::shared_ptr<RB::XML::Value::Base>::__shared_ptr_default_delete<RB::XML::Value::Base,RB::XML::Value::ColorArray>,std::allocator<RB::XML::Value::ColorArray>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

void sub_21420BEC0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_21420C3D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void free_data(void *a1, void *a2)
{
}

BOOL RBSurfaceIsOpaque(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 65)) {
    return 1;
  }
  if (*(unsigned char *)(a1 + 64)) {
    return *(float *)(a1 + 108) >= 1.0;
  }
  return 0;
}

uint64_t RBSurfacePrepareTexture(uint64_t a1, RB::Device ***a2)
{
  RB::ColorMode::ColorMode(v5, *(unsigned int *)(a1 + 68));
  return -[RBSurface _updateWithDevice:frame:synchronized:](a1, **a2, (RB::RenderFrame *)*a2, 0);
}

uint64_t RBSurfaceGetTexture(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

uint64_t RB::Transition::set_add_remove_duration(uint64_t this, float a2)
{
  if (a2 < 0.0) {
    a2 = 0.0;
  }
  float v2 = (float)(a2 * 255.0) + 0.5;
  BOOL v3 = a2 <= 1.0;
  float v4 = 255.5;
  if (v3) {
    float v4 = v2;
  }
  *(unsigned char *)(this + 14) = (int)v4;
  return this;
}

uint64_t RB::Transition::properties(RB::Transition *this)
{
  unsigned int v1 = *((_DWORD *)this + 12);
  if (v1)
  {
    unsigned int v2 = 0;
    BOOL v3 = (char *)this + 24;
    if (*((void *)this + 5)) {
      BOOL v3 = (char *)*((void *)this + 5);
    }
    int v4 = 2;
    do
    {
      __int16 v5 = *(_WORD *)&v3[4 * v2];
      uint64_t v6 = v5 & 0x7F;
      int v7 = 1 << (v5 & 0x7F);
      int v8 = v4 | 4;
      if ((v5 & 0x400) != 0) {
        int v8 = v4;
      }
      int v9 = v4 | 9;
      if ((v7 & 0x60020) == 0) {
        int v9 = v4;
      }
      if ((v7 & 0x187800) == 0) {
        int v8 = v9;
      }
      if ((v7 & 0x187DC) != 0) {
        int v10 = v4 | 1;
      }
      else {
        int v10 = v8;
      }
      if (v6 <= 0x14) {
        int v4 = v10;
      }
      if (v5 < 0) {
        v4 |= 0x10u;
      }
      v2 += RB::Transition::_effect_args[v6] + 1;
    }
    while (v2 < v1);
  }
  else
  {
    LOBYTE(v4) = 1;
  }
  return v4;
}

BOOL RB::Transition::empty_transition(RB::Transition *this, char a2)
{
  unsigned int v2 = *((_DWORD *)this + 12);
  if (!v2) {
    return 1;
  }
  unsigned int v3 = 0;
  int v4 = (char *)this + 24;
  if (*((void *)this + 5)) {
    int v4 = (char *)*((void *)this + 5);
  }
  int v5 = a2 & 0x3F;
  do
  {
    unsigned int v6 = *(unsigned __int16 *)&v4[4 * v3];
    BOOL result = (v5 & (v6 >> 8)) == 0;
    if ((v5 & (v6 >> 8)) != 0) {
      break;
    }
    v3 += RB::Transition::_effect_args[v6 & 0x7F] + 1;
  }
  while (v3 < v2);
  return result;
}

BOOL RB::Transition::operator==(uint64_t a1, uint64_t a2)
{
  if (*(unsigned __int8 *)(a1 + 12) == *(unsigned __int8 *)(a2 + 12)
    && *(unsigned __int8 *)(a1 + 13) == *(unsigned __int8 *)(a2 + 13)
    && *(unsigned __int8 *)(a1 + 14) == *(unsigned __int8 *)(a2 + 14)
    && *(_DWORD *)(a1 + 16) == *(_DWORD *)(a2 + 16)
    && *(_DWORD *)(a1 + 48) == *(_DWORD *)(a2 + 48))
  {
    BOOL result = RB::Animation::operator==(a1 + 56, a2 + 56);
    if (!result) {
      return result;
    }
    unsigned int v5 = *(_DWORD *)(a1 + 48);
    if (!v5) {
      return 1;
    }
    unsigned int v6 = 0;
    uint64_t v7 = a1 + 24;
    uint64_t v8 = a2 + 24;
    if (*(void *)(a1 + 40)) {
      uint64_t v7 = *(void *)(a1 + 40);
    }
    if (*(void *)(a2 + 40)) {
      uint64_t v8 = *(void *)(a2 + 40);
    }
    while (1)
    {
      int v9 = (unsigned __int16 *)(v7 + 4 * v6);
      int v10 = (unsigned __int16 *)(v8 + 4 * v6);
      int v11 = *v9;
      if (*v10 != v11
        || *((unsigned __int8 *)v9 + 2) != *((unsigned __int8 *)v10 + 2)
        || *((unsigned __int8 *)v9 + 3) != *((unsigned __int8 *)v10 + 3))
      {
        break;
      }
      unsigned int v12 = RB::Transition::_effect_args[v11 & 0x7F];
      if (((0x187FA3uLL >> v11) & 1) == 0)
      {
        unint64_t v13 = (int *)(v9 + 2);
        char v14 = (int *)(v10 + 2);
        if (v12 <= 1) {
          uint64_t v15 = 1;
        }
        else {
          uint64_t v15 = RB::Transition::_effect_args[v11 & 0x7F];
        }
        do
        {
          int v17 = *v13++;
          int v16 = v17;
          int v18 = *v14++;
          if (v16 != v18) {
            return 0;
          }
        }
        while (--v15);
      }
      v6 += v12 + 1;
      BOOL result = 1;
      if (v6 >= v5) {
        return result;
      }
    }
  }
  return 0;
}

uint64_t RB::Transition::Effect::set_begin_time(uint64_t this, float a2)
{
  if ((*(_WORD *)this & 0x80) != 0)
  {
    *(_WORD *)this &= ~0x80u;
    *(unsigned char *)(this + 3) = -1;
  }
  if (a2 < 0.0) {
    a2 = 0.0;
  }
  float v2 = (float)(a2 * 255.0) + 0.5;
  BOOL v3 = a2 <= 1.0;
  float v4 = 255.5;
  if (v3) {
    float v4 = v2;
  }
  *(unsigned char *)(this + 2) = (int)v4;
  return this;
}

uint64_t RB::Transition::Effect::set_duration(uint64_t this, float a2)
{
  if ((*(_WORD *)this & 0x80) != 0)
  {
    *(_WORD *)this &= ~0x80u;
    *(unsigned char *)(this + 2) = 0;
  }
  if (a2 < 0.0) {
    a2 = 0.0;
  }
  float v2 = (float)(a2 * 255.0) + 0.5;
  BOOL v3 = a2 <= 1.0;
  float v4 = 255.5;
  if (v3) {
    float v4 = v2;
  }
  *(unsigned char *)(this + 3) = (int)v4;
  return this;
}

uint64_t RB::Transition::Effect::set_insert_animation(uint64_t this, char a2)
{
  if ((*(_WORD *)this & 0x80) == 0)
  {
    *(_WORD *)this |= 0x80u;
    *(unsigned char *)(this + 3) = 0;
  }
  *(unsigned char *)(this + 2) = a2;
  return this;
}

uint64_t RB::Transition::Effect::set_remove_animation(uint64_t this, char a2)
{
  if ((*(_WORD *)this & 0x80) == 0)
  {
    *(_WORD *)this |= 0x80u;
    *(unsigned char *)(this + 2) = 0;
  }
  *(unsigned char *)(this + 3) = a2;
  return this;
}

unint64_t RB::Transition::Effect::hash(RB::Transition::Effect *this)
{
  return ((unint64_t)*(unsigned __int16 *)this >> 2) & 0x3000 | *(_WORD *)this & 0x3FFF | ((unint64_t)*((unsigned __int8 *)this + 2) << 16) | ((unint64_t)*((unsigned __int8 *)this + 3) << 24);
}

uint64_t RB::Transition::Effect::custom_duration(RB::Transition::Effect *this, char a2, const EffectOrArg *a3, double a4, float32x2_t a5)
{
  int v5 = *(_WORD *)this & 0x7F;
  if (v5 == 18)
  {
    float v6 = 0.5;
    if ((a3->int_arg & 0xF) == 4) {
      float v6 = 0.25;
    }
  }
  else
  {
    if (v5 != 17)
    {
      uint64_t v10 = 0;
      float v9 = 0.0;
      return v10 | LODWORD(v9);
    }
    float v6 = 0.16667;
    if (a2) {
      float v6 = 0.25;
    }
  }
  a5.f32[0] = a3[1].arg;
  float32x2_t v7 = vrecpe_f32(a5);
  float32x2_t v8 = vmul_f32(vrecps_f32(a5, v7), v7);
  float v9 = v6 * vmul_f32(v8, vrecps_f32(a5, v8)).f32[0];
  uint64_t v10 = 0x100000000;
  return v10 | LODWORD(v9);
}

uint64_t RB::Transition::Effect::anchor_direction(RB::Transition::Effect *this, unsigned int a2, int a3)
{
  int v3 = *(__int16 *)this;
  LOBYTE(v4) = (v3 & 0x7F) - 7;
  if (((*(_WORD *)this & 0x7F) - 7) > 3u)
  {
    LOBYTE(v4) = 0;
    int v7 = 0;
  }
  else
  {
    if (v3 < 0) {
      int v5 = a3;
    }
    else {
      int v5 = 0;
    }
    if (v5 != ((a2 >> 1) & ((unsigned __int16)(v3 & 0x4000) >> 14)))
    {
      unsigned int v6 = ((v3 & 0x7F) - 7);
      if (v6 > 3) {
        LOBYTE(v4) = 1;
      }
      else {
        unsigned int v4 = 0x2030001u >> (8 * v6);
      }
    }
    int v7 = 1;
  }
  return v4 | (v7 << 8);
}

uint64_t RB::Transition::Effect::sequence_direction(RB::Transition::Effect *this, unsigned int a2, int a3)
{
  uint64_t v3 = (*(_WORD *)this & 0x7FLL) - 11;
  if ((*(_WORD *)this & 0x7F) - 11) <= 9u && ((0x30Fu >> v3))
  {
    int v7 = *(__int16 *)this;
    LOBYTE(v4) = byte_21421CE90[v3];
    if (v7 < 0) {
      int v8 = a3;
    }
    else {
      int v8 = 0;
    }
    if (v8 != ((a2 >> 1) & ((unsigned __int16)(v7 & 0x4000) >> 14))) {
      unint64_t v4 = 0x40502030001uLL >> (8 * v4);
    }
    int v5 = 1;
  }
  else
  {
    LOBYTE(v4) = 0;
    int v5 = 0;
  }
  return v4 | (v5 << 8);
}

_DWORD *RB::Transition::add_default_effect(_DWORD *this)
{
  unsigned int v1 = this;
  float v2 = this + 6;
  int v3 = this[12];
  if (this[13] < (v3 + 1))
  {
    this = RB::vector<RB::Symbol::Tag,4ul,unsigned int>::reserve_slow(this + 6, v3 + 1);
    int v3 = v1[12];
  }
  unint64_t v4 = (_DWORD *)*((void *)v1 + 5);
  if (!v4) {
    unint64_t v4 = v2;
  }
  v4[v3] = -16776447;
  ++v1[12];
  return this;
}

void *RB::Transition::encode(RB::Transition *this, RB::Encoder *a2)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  BOOL result = (void *)rb_transition_method((Method)*((unsigned __int8 *)this + 12));
  if (result)
  {
    unsigned int v5 = result;
    RB::ProtobufEncoder::encode_varint(a2, 8uLL);
    BOOL result = RB::ProtobufEncoder::encode_varint(a2, v5);
  }
  if (*((_DWORD *)this + 12))
  {
    unsigned int v6 = 0;
    do
    {
      if (*((void *)this + 5)) {
        int v7 = (char *)*((void *)this + 5);
      }
      else {
        int v7 = (char *)this + 24;
      }
      RB::ProtobufEncoder::encode_varint(a2, 0x12uLL);
      RB::ProtobufEncoder::begin_length_delimited(a2);
      int v8 = &v7[4 * v6];
      uint64_t v10 = (unsigned int *)(v8 + 4);
      LOBYTE(v9) = *(_WORD *)v8;
      unint64_t v11 = *(_WORD *)v8 & 0x7F;
      if (v11 != 1)
      {
        RB::ProtobufEncoder::encode_varint(a2, 8uLL);
        RB::ProtobufEncoder::encode_varint(a2, v11);
        __int16 v9 = *(_WORD *)v8;
      }
      unint64_t v12 = v8[2];
      if ((v9 & 0x80) != 0)
      {
        if (v12 == v8[3])
        {
          RB::ProtobufEncoder::encode_varint(a2, 0x48uLL);
          RB::ProtobufEncoder::encode_varint(a2, v12);
        }
        else
        {
          RB::ProtobufEncoder::encode_varint(a2, 0x50uLL);
          RB::ProtobufEncoder::encode_varint(a2, v12);
          if ((*(_WORD *)v8 & 0x80) != 0) {
            unint64_t v16 = v8[3];
          }
          else {
            unint64_t v16 = 0;
          }
          RB::ProtobufEncoder::encode_varint(a2, 0x58uLL);
          RB::ProtobufEncoder::encode_varint(a2, v16);
        }
      }
      else
      {
        float v13 = (float)v12;
        *(float *)&int v14 = (float)v12 * 0.0039216;
        if (*(float *)&v14 != 0.0)
        {
          RB::ProtobufEncoder::encode_varint(a2, 0x1DuLL);
          RB::ProtobufEncoder::encode_fixed32(a2, v14);
          __int16 v9 = *(_WORD *)v8;
        }
        if ((v9 & 0x80) == 0)
        {
          LOBYTE(v13) = v8[3];
          *(float *)&int v15 = (float)LODWORD(v13) * 0.0039216;
          if (*(float *)&v15 != 1.0)
          {
            RB::ProtobufEncoder::encode_varint(a2, 0x25uLL);
            RB::ProtobufEncoder::encode_fixed32(a2, v15);
          }
        }
      }
      unint64_t v17 = *(unsigned __int16 *)v8;
      unint64_t v18 = (v17 >> 8) & 0x3F;
      if (v18 == 3)
      {
        __int16 v19 = *(_WORD *)v8;
        if ((v17 & 0x4000) == 0) {
          goto LABEL_24;
        }
      }
      else
      {
        RB::ProtobufEncoder::encode_varint(a2, 0x28uLL);
        RB::ProtobufEncoder::encode_varint(a2, v18);
        __int16 v19 = *(_WORD *)v8;
        if ((*(_WORD *)v8 & 0x4000) == 0)
        {
LABEL_24:
          if (v19 < 0) {
            goto LABEL_28;
          }
          goto LABEL_29;
        }
      }
      RB::ProtobufEncoder::encode_varint(a2, 0x30uLL);
      RB::ProtobufEncoder::encode_varint(a2, 1uLL);
      __int16 v19 = *(_WORD *)v8;
      if ((*(_WORD *)v8 & 0x8000) != 0)
      {
LABEL_28:
        RB::ProtobufEncoder::encode_varint(a2, 0x40uLL);
        RB::ProtobufEncoder::encode_varint(a2, 1uLL);
        __int16 v19 = *(_WORD *)v8;
      }
LABEL_29:
      if (((0x187FA3uLL >> v19) & 1) == 0)
      {
        float64x2_t v20 = 0;
        uint64_t v21 = 0;
        unsigned int v22 = RB::Transition::_effect_args[v19 & 0x7F];
        unint64_t v32 = 0;
        uint64_t v33 = 0;
        unint64_t v34 = 4;
        if (v22 <= 1) {
          uint64_t v23 = 1;
        }
        else {
          uint64_t v23 = v22;
        }
        do
        {
          uint64_t v24 = v21 + 1;
          if (v34 < v21 + 1)
          {
            RB::vector<float,4ul,unsigned long>::reserve_slow(v31, v21 + 1);
            float64x2_t v20 = (const unsigned int *)v32;
            uint64_t v21 = v33;
            uint64_t v24 = v33 + 1;
          }
          unsigned int v25 = *v10++;
          unsigned int v26 = v25;
          if (v20) {
            int v27 = v20;
          }
          else {
            int v27 = (const unsigned int *)v31;
          }
          v27[v21] = v26;
          uint64_t v33 = v24;
          uint64_t v21 = v24;
          --v23;
        }
        while (v23);
        RB::ProtobufEncoder::packed_fixed32_field(a2, 2, v27, v24);
        if (v32) {
          free(v32);
        }
      }
      BOOL result = RB::ProtobufEncoder::end_length_delimited(a2);
      v6 += RB::Transition::_effect_args[*(_WORD *)v8 & 0x7F] + 1;
    }
    while (v6 < *((_DWORD *)this + 12));
  }
  unsigned int v28 = *((unsigned __int8 *)this + 14);
  if (v28 != 32)
  {
    *(float *)&int v29 = (float)v28 * 0.0039216;
    if (*(float *)&v29 != 0.0)
    {
      RB::ProtobufEncoder::encode_varint(a2, 0x1DuLL);
      BOOL result = RB::ProtobufEncoder::encode_fixed32(a2, v29);
    }
  }
  unint64_t v30 = *((unsigned int *)this + 4);
  if ((v30 + 1) >= 2)
  {
    RB::ProtobufEncoder::encode_varint(a2, 0x20uLL);
    BOOL result = RB::ProtobufEncoder::encode_varint(a2, v30);
  }
  if (*((unsigned char *)this + 13))
  {
    RB::ProtobufEncoder::encode_varint(a2, 0x28uLL);
    BOOL result = RB::ProtobufEncoder::encode_varint(a2, 1uLL);
  }
  if (*((_DWORD *)this + 22))
  {
    RB::ProtobufEncoder::encode_varint(a2, 0x32uLL);
    RB::ProtobufEncoder::begin_length_delimited(a2);
    RB::Animation::encode((void *)this + 7, a2);
    return RB::ProtobufEncoder::end_length_delimited(a2);
  }
  return result;
}

void sub_21420D078(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11)
{
  if (a11) {
    free(a11);
  }
  _Unwind_Resume(exception_object);
}

unint64_t RB::Transition::decode(RB::Transition *this, RB::Decoder *a2)
{
  unint64_t result = RB::ProtobufDecoder::next_field(a2);
  if (result)
  {
    unint64_t v5 = result;
    do
    {
      switch((v5 >> 3))
      {
        case 1u:
          unint64_t v6 = RB::ProtobufDecoder::uint_field((uint64_t **)a2, v5);
          if (v6 <= 8) {
            *((unsigned char *)this + 12) = rb_transition_method(v6);
          }
          break;
        case 2u:
          uint64_t v7 = *((unsigned int *)this + 12);
          int v8 = *((_DWORD *)this + 12);
          if (*((_DWORD *)this + 13) < (v7 + 1))
          {
            RB::vector<RB::Symbol::Tag,4ul,unsigned int>::reserve_slow((char *)this + 24, v7 + 1);
            int v8 = *((_DWORD *)this + 12);
          }
          __int16 v9 = (char *)*((void *)this + 5);
          if (!v9) {
            __int16 v9 = (char *)this + 24;
          }
          *(_DWORD *)&v9[4 * v8] = -16776447;
          int v10 = *((_DWORD *)this + 12) + 1;
          *((_DWORD *)this + 12) = v10;
          if ((v5 & 7) == 2)
          {
            RB::ProtobufDecoder::begin_message(a2);
            uint64_t field = RB::ProtobufDecoder::next_field(a2);
            if (field)
            {
              unint64_t v12 = field;
              do
              {
                float v13 = (char *)*((void *)this + 5);
                if (!v13) {
                  float v13 = (char *)this + 24;
                }
                uint64_t v14 = (uint64_t)&v13[4 * v7];
                switch((v12 >> 3))
                {
                  case 1u:
                    unint64_t v15 = RB::ProtobufDecoder::uint_field((uint64_t **)a2, v12);
                    if (v15 <= 0x14)
                    {
                      __int16 v16 = *(_WORD *)v14 & 0xFF80 | v15;
                      goto LABEL_32;
                    }
                    break;
                  case 2u:
                    float v17 = RB::ProtobufDecoder::float_field(a2, v12);
                    int v18 = *((_DWORD *)this + 12);
                    if (*((_DWORD *)this + 13) < (v18 + 1))
                    {
                      RB::vector<RB::Symbol::Tag,4ul,unsigned int>::reserve_slow((char *)this + 24, v18 + 1);
                      int v18 = *((_DWORD *)this + 12);
                    }
                    __int16 v19 = (char *)*((void *)this + 5);
                    if (!v19) {
                      __int16 v19 = (char *)this + 24;
                    }
                    *(float *)&v19[4 * v18] = v17;
                    goto LABEL_38;
                  case 3u:
                    float v20 = RB::ProtobufDecoder::float_field(a2, v12);
                    RB::Transition::Effect::set_begin_time(v14, v20);
                    break;
                  case 4u:
                    float v21 = RB::ProtobufDecoder::float_field(a2, v12);
                    RB::Transition::Effect::set_duration(v14, v21);
                    break;
                  case 5u:
                    __int16 v16 = ((RB::ProtobufDecoder::uint_field((uint64_t **)a2, v12) & 0x3F) << 8) | *(_WORD *)v14 & 0xC0FF;
                    goto LABEL_32;
                  case 6u:
                    if (RB::ProtobufDecoder::BOOL_field(a2, v12)) {
                      __int16 v22 = 0x4000;
                    }
                    else {
                      __int16 v22 = 0;
                    }
                    __int16 v16 = *(_WORD *)v14 | v22;
LABEL_32:
                    *(_WORD *)uint64_t v14 = v16;
                    break;
                  case 7u:
                    int v23 = RB::ProtobufDecoder::uint_field((uint64_t **)a2, v12);
                    int v24 = *((_DWORD *)this + 12);
                    if (*((_DWORD *)this + 13) < (v24 + 1))
                    {
                      RB::vector<RB::Symbol::Tag,4ul,unsigned int>::reserve_slow((char *)this + 24, v24 + 1);
                      int v24 = *((_DWORD *)this + 12);
                    }
                    unsigned int v25 = (char *)*((void *)this + 5);
                    if (!v25) {
                      unsigned int v25 = (char *)this + 24;
                    }
                    *(_DWORD *)&v25[4 * v24] = v23;
LABEL_38:
                    ++*((_DWORD *)this + 12);
                    break;
                  case 8u:
                    if (RB::ProtobufDecoder::BOOL_field(a2, v12)) {
                      char v26 = 2;
                    }
                    else {
                      char v26 = 0;
                    }
                    *(_WORD *)uint64_t v14 = *(_WORD *)v14 & 0x3FFF | ((v26 & 3 | (*(_WORD *)v14 >> 14)) << 14);
                    break;
                  case 9u:
                    char v27 = RB::ProtobufDecoder::uint_field((uint64_t **)a2, v12);
                    __int16 v28 = *(_WORD *)v14;
                    if ((*(_WORD *)v14 & 0x80) == 0)
                    {
                      v28 |= 0x80u;
                      *(_WORD *)uint64_t v14 = v28;
                    }
                    *(unsigned char *)(v14 + 2) = v27;
                    if ((v28 & 0x80) == 0) {
                      goto LABEL_46;
                    }
                    goto LABEL_47;
                  case 0xAu:
                    char v29 = RB::ProtobufDecoder::uint_field((uint64_t **)a2, v12);
                    if ((*(_WORD *)v14 & 0x80) == 0)
                    {
                      *(_WORD *)v14 |= 0x80u;
                      *(unsigned char *)(v14 + 3) = 0;
                    }
                    *(unsigned char *)(v14 + 2) = v29;
                    break;
                  case 0xBu:
                    char v27 = RB::ProtobufDecoder::uint_field((uint64_t **)a2, v12);
                    __int16 v28 = *(_WORD *)v14;
                    if ((*(_WORD *)v14 & 0x80) != 0) {
                      goto LABEL_47;
                    }
LABEL_46:
                    *(_WORD *)uint64_t v14 = v28 | 0x80;
                    *(unsigned char *)(v14 + 2) = 0;
LABEL_47:
                    *(unsigned char *)(v14 + 3) = v27;
                    break;
                  default:
                    RB::ProtobufDecoder::skip_field(a2, v12);
                    break;
                }
                unint64_t v12 = RB::ProtobufDecoder::next_field(a2);
              }
              while (v12);
            }
            RB::ProtobufDecoder::end_message((uint64_t)a2);
            int v34 = *((_DWORD *)this + 12);
          }
          else
          {
            *((unsigned char *)a2 + 56) = 1;
            *(void *)a2 = *((void *)a2 + 1);
            int v34 = v10;
          }
          int v35 = v34 - v10;
          long long v36 = (char *)*((void *)this + 5);
          if (!v36) {
            long long v36 = (char *)this + 24;
          }
          if (v35 != RB::Transition::_effect_args[*(_WORD *)&v36[4 * v7] & 0x7F]) {
            goto LABEL_72;
          }
          break;
        case 3u:
          float v30 = RB::ProtobufDecoder::float_field(a2, v5);
          if (v30 < 0.0) {
            float v30 = 0.0;
          }
          if (v30 <= 1.0) {
            float v31 = (float)(v30 * 255.0) + 0.5;
          }
          else {
            float v31 = 255.5;
          }
          *((unsigned char *)this + 14) = (int)v31;
          break;
        case 4u:
          unint64_t v32 = RB::ProtobufDecoder::uint_field((uint64_t **)a2, v5);
          if (v32 >= 0xFFFFFFFF) {
            int v33 = -1;
          }
          else {
            int v33 = v32;
          }
          *((_DWORD *)this + 4) = v33;
          break;
        case 5u:
          *((unsigned char *)this + 13) = RB::ProtobufDecoder::BOOL_field(a2, v5);
          break;
        case 6u:
          *((_DWORD *)this + 22) = 0;
          if ((v5 & 7) == 2)
          {
            RB::ProtobufDecoder::begin_message(a2);
            RB::Animation::decode((RB::Transition *)((char *)this + 56), a2);
            RB::ProtobufDecoder::end_message((uint64_t)a2);
          }
          else
          {
LABEL_72:
            *((unsigned char *)a2 + 56) = 1;
            *(void *)a2 = *((void *)a2 + 1);
          }
          break;
        default:
          RB::ProtobufDecoder::skip_field(a2, v5);
          break;
      }
      unint64_t result = RB::ProtobufDecoder::next_field(a2);
      unint64_t v5 = result;
    }
    while (result);
  }
  return result;
}

void RB::Transition::print(RB::Transition *this, std::string *a2)
{
  RB::SexpString::push(a2, "transition");
  uint64_t v5 = *((unsigned __int8 *)this + 12);
  if ((v5 - 1) <= 7) {
    RB::SexpString::printf(a2, 0, "%s", RB::Transition::print(RB::SexpString &)const::method_names[v5]);
  }
  if (*((unsigned char *)this + 13)) {
    RB::SexpString::print(a2, 0, "implicit");
  }
  unsigned int v6 = *((unsigned __int8 *)this + 14);
  if (v6 != 32) {
    RB::SexpString::printf(a2, 0, "(add-remove %g)", (float)((float)v6 * 0.0039216));
  }
  if (*((_DWORD *)this + 4) != -1) {
    RB::SexpString::printf(a2, 0, "(max-changes %u)", *((_DWORD *)this + 4));
  }
  if (*((_DWORD *)this + 12))
  {
    RB::SexpString::push(a2, "effects");
    unsigned int v7 = *((_DWORD *)this + 12);
    if (v7)
    {
      for (unsigned int i = 0; i < v7; i += RB::Transition::_effect_args[v11] + 1)
      {
        __int16 v9 = (char *)*((void *)this + 5);
        if (!v9) {
          __int16 v9 = (char *)this + 24;
        }
        int v10 = &v9[4 * i];
        uint64_t v11 = *(_WORD *)v10 & 0x7F;
        if (v11 <= 0x12)
        {
          RB::SexpString::push(a2, RB::Transition::print(RB::SexpString &)const::effect_names[v11]);
          unsigned int v12 = *(unsigned __int16 *)v10;
          if (((v12 >> 8) & 0x3F) != 3)
          {
            RB::SexpString::printf(a2, 0, "(events #x%x)", (v12 >> 8) & 0x3F);
            LOWORD(v12) = *(_WORD *)v10;
          }
          unsigned int v13 = v10[2];
          if ((v12 & 0x80) != 0)
          {
            if (v13 == v10[3])
            {
              RB::SexpString::printf(a2, 0, "(animation %d)");
            }
            else
            {
              RB::SexpString::printf(a2, 0, "(insert-animation %d)", v10[2]);
              RB::SexpString::printf(a2, 0, "(remove-animation %d)");
            }
          }
          else
          {
            float v14 = (float)v13 * 0.0039216;
            LOBYTE(v2) = v10[3];
            if (v14 != 0.0) {
              RB::SexpString::printf(a2, 0, "(begin %g)", v14);
            }
            if ((float)((float)v2 * 0.0039216) != 1.0) {
              RB::SexpString::printf(a2, 0, "(duration %g)");
            }
          }
          unsigned int v15 = *(_WORD *)v10 & 0x7F;
          if (v15 <= 0x10)
          {
            int v16 = 1 << v15;
            if ((v16 & 0x54) != 0)
            {
              RB::SexpString::printf(a2, 0, "(arg %g)");
            }
            else if ((v16 & 0x18008) != 0)
            {
              RB::SexpString::printf(a2, 0, "(args %g %g)");
            }
          }
          RB::SexpString::pop(a2);
          unsigned int v7 = *((_DWORD *)this + 12);
          LODWORD(v11) = *(_WORD *)v10 & 0x7F;
        }
      }
    }
    RB::SexpString::pop(a2);
  }
  RB::SexpString::pop(a2);
}

void *RB::vector<float,4ul,unsigned long>::reserve_slow(void *__dst, size_t a2)
{
  if (*((void *)__dst + 4) + (*((void *)__dst + 4) >> 1) <= a2) {
    size_t v3 = a2;
  }
  else {
    size_t v3 = *((void *)__dst + 4) + (*((void *)__dst + 4) >> 1);
  }
  unint64_t result = RB::details::realloc_vector<unsigned long,4ul>(*((void **)__dst + 2), __dst, 4uLL, (size_t *)__dst + 4, v3);
  *((void *)__dst + 2) = result;
  return result;
}

__n128 RB::Fill::Custom::Custom(RB::Fill::Custom *this, const RB::CustomShader::Closure *a2, __n128 *a3, int a4)
{
  unsigned int v6 = RB::CustomShader::Closure::Closure(this, a2);
  *((_OWORD *)v6 + 8) = xmmword_2142181C0;
  *((_OWORD *)v6 + 9) = xmmword_2142181D0;
  *((void *)v6 + 20) = 0;
  *((void *)v6 + 21) = 0;
  __n128 result = *a3;
  *((__n128 *)v6 + 11) = *a3;
  *((_DWORD *)v6 + 48) = a4;
  return result;
}

__n128 RB::Fill::Custom::Custom(RB::CustomShader::Closure *a1, uint64_t a2)
{
  size_t v3 = RB::CustomShader::Closure::Closure(a1, (const RB::CustomShader::Closure *)a2);
  long long v4 = *(_OWORD *)(a2 + 128);
  long long v5 = *(_OWORD *)(a2 + 160);
  *((_OWORD *)v3 + 9) = *(_OWORD *)(a2 + 144);
  *((_OWORD *)v3 + 10) = v5;
  *((_OWORD *)v3 + 8) = v4;
  __n128 result = *(__n128 *)(a2 + 176);
  *((__n128 *)v3 + 11) = result;
  *((_DWORD *)v3 + 48) = *(_DWORD *)(a2 + 192);
  return result;
}

uint64_t *RB::Fill::Custom::function(RB::Fill::Custom *this, uint64_t **a2)
{
  __n128 result = *(uint64_t **)this;
  if (result)
  {
    uint64_t v4 = **a2;
    long long v5 = (char *)this + 8;
    unsigned int v7 = (char *)*((void *)this + 13);
    uint64_t v6 = *((void *)this + 14);
    if (v7) {
      long long v5 = v7;
    }
    v8[0] = v5;
    v8[1] = v6;
    return RB::CustomShader::Function::function((uint64_t)result, v4, 0, v8);
  }
  return result;
}

uint64_t RB::Fill::Custom::set_custom(uint64_t a1, float32x2_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, float64x2_t *a6, float a7)
{
  _S8 = a7;
  float64x2_t v14 = a6[1];
  *(float64x2_t *)float v30 = *a6;
  *(float64x2_t *)&v30[16] = v14;
  float64x2_t v31 = a6[2];
  if (RB::AffineTransform::invert((RB::AffineTransform *)v30)) {
    unsigned int v15 = (float64x2_t *)v30;
  }
  else {
    unsigned int v15 = a6;
  }
  float64x2_t v16 = v15[1];
  uint64_t v17 = *(void *)(a5 + 104);
  v18.i64[0] = (int)v17;
  v18.i64[1] = SHIDWORD(v17);
  __asm { FMOV            V4.2D, #0.5 }
  float64x2_t v24 = vmulq_f64(vcvtq_f64_s64(v18), _Q4);
  _Q0 = vmulq_n_f64(*v15, v24.f64[0]);
  float64x2_t v26 = vmlaq_laneq_f64(vaddq_f64(_Q0, v15[2]), v16, v24, 1);
  *a2 = vcvt_f32_f64(_Q0);
  a2[1] = vcvt_f32_f64(vmulq_n_f64(v16, -v24.f64[1]));
  a2[2] = vcvt_f32_f64(v26);
  __asm { FCVT            H0, S8 }
  a2[3].i16[0] = LOWORD(_Q0.f64[0]);
  memset(v30, 0, 24);
  char v29 = 0;
  uint64_t v27 = RB::CustomShader::Closure::marshal_args((void *)a1, a5, a3, (_OWORD *)(a1 + 176), a4, (uint64_t)v30, &v29);
  if (v27)
  {
    *(_DWORD *)(a5 + 220) = RB::RenderFrame::buffer_id(**(RB::RenderFrame ***)a5, *(RB::Buffer **)v30);
    *(int32x2_t *)(a5 + 224) = vmovn_s64(*(int64x2_t *)&v30[8]);
    if (v29) {
      *(_DWORD *)(a5 + 232) = RB::RenderFrame::texture_id(**(RB::RenderFrame ***)a5, (uint64_t)v29);
    }
  }
  return v27;
}

void RB::Fill::Custom::reset_custom(RB::Fill::Custom *this, RB::RenderPass *a2)
{
  *(void *)((char *)a2 + 228) = 0;
  *(void *)((char *)a2 + 220) = 0;
  *((unsigned char *)a2 + 236) = 0;
}

unint64_t RB::Fill::Custom::set_fill_state(RB::Fill::Custom *this, RB::RenderState *a2, Function *a3, unint64_t **a4)
{
  *(_DWORD *)a2 = (*(_DWORD *)a2 & 0xFFFFF | ((*((_DWORD *)this + 48) & 1 | (2 * (*((_DWORD *)a3 + 25) >> 31))) << 20)) ^ 0x200000;
  unint64_t result = RB::RenderFrame::add_function(**a4, a3);
  *((_DWORD *)a2 + 1) = *((_DWORD *)a2 + 1) & 0x3F | (*(_DWORD *)a3 << 6);
  return result;
}

CGAffineTransform *RB::Fill::Custom::mix(RB::Fill::Custom *this, const RB::DisplayList::Interpolator::Op *a2, const RB::Fill::Custom *a3, float a4, RB::Heap *a5)
{
  RB::CustomShader::Closure::mix(this, a3, a4);
  float32x2_t v7 = *(float32x2_t *)((char *)this + 176);
  float32x2_t v8 = *(float32x2_t *)((char *)a3 + 176);
  float32x2_t v9 = vadd_f32(*(float32x2_t *)((char *)this + 184), v7);
  *(float32x2_t *)v10.i8 = vmla_n_f32(v9, vadd_f32(vsub_f32(v8, v9), *(float32x2_t *)((char *)a3 + 184)), a4);
  *((double *)this + 22) = RB::Rect::from_bounds(vmla_n_f32(v7, vsub_f32(v8, v7), a4), v10);
  *((void *)this + 23) = v11;
  unint64_t result = RB::mix((CGAffineTransform *)((char *)this + 128), (float64x2_t *)a3 + 8, v12, a4);
  *((_OWORD *)this + 8) = v14;
  *((_OWORD *)this + 9) = v15;
  *((_OWORD *)this + 10) = v16;
  return result;
}

void RB::Fill::Custom::attributes(atomic_uint **this, RB::XML::Element *a2)
{
  size_t v3 = objc_opt_new();
  uint64_t v4 = -[RBShape shapeData]((uint64_t)v3);
  RB::CustomShader::Closure::operator=(v4, this);
  v3;
  RB::XML::Element::set<RB::XML::Value::Shader>();
}

void sub_21420DD30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id a11)
{
  _Unwind_Resume(a1);
}

void *RB::Fill::Custom::encode(RB::Fill::Custom *this, RB::Encoder *a2)
{
  RB::ProtobufEncoder::encode_varint(a2, 0xAuLL);
  RB::ProtobufEncoder::begin_length_delimited(a2);
  RB::CustomShader::Closure::encode((RB::CustomShader::Function **)this, a2);
  unint64_t result = RB::ProtobufEncoder::end_length_delimited(a2);
  int64x2_t v5 = (int64x2_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f64(*((float64x2_t *)this + 9), (float64x2_t)xmmword_2142181D0), (int8x16_t)vceqq_f64(*((float64x2_t *)this + 8), (float64x2_t)xmmword_2142181C0)), (int8x16_t)vceqzq_f64(*((float64x2_t *)this + 10)));
  if ((vandq_s8((int8x16_t)vdupq_laneq_s64(v5, 1), (int8x16_t)v5).u64[0] & 0x8000000000000000) == 0)
  {
    RB::ProtobufEncoder::encode_varint(a2, 0x12uLL);
    RB::ProtobufEncoder::begin_length_delimited(a2);
    RB::AffineTransform::encode((double *)this + 16, a2);
    unint64_t result = RB::ProtobufEncoder::end_length_delimited(a2);
  }
  if (*((unsigned char *)this + 192))
  {
    RB::ProtobufEncoder::encode_varint(a2, 0x18uLL);
    unint64_t result = RB::ProtobufEncoder::encode_varint(a2, 1uLL);
  }
  uint32x2_t v6 = (uint32x2_t)vcgtz_f32(*(float32x2_t *)((char *)this + 184));
  if ((vpmin_u32(v6, v6).u32[0] & 0x80000000) != 0)
  {
    float32x4_t v7 = *((float32x4_t *)this + 11);
    return RB::ProtobufEncoder::float4_field(a2, 4, v7);
  }
  return result;
}

unint64_t RB::Fill::Custom::decode(RB::Fill::Custom *this, RB::Decoder *a2)
{
  unint64_t result = RB::ProtobufDecoder::next_field(a2);
  if (result)
  {
    unint64_t v5 = result;
    do
    {
      switch((v5 >> 3))
      {
        case 1u:
          if ((v5 & 7) != 2) {
            goto LABEL_14;
          }
          RB::ProtobufDecoder::begin_message(a2);
          RB::CustomShader::Closure::decode(this, a2);
          goto LABEL_9;
        case 2u:
          if ((v5 & 7) == 2)
          {
            RB::ProtobufDecoder::begin_message(a2);
            RB::AffineTransform::decode((RB::Fill::Custom *)((char *)this + 128), a2);
LABEL_9:
            RB::ProtobufDecoder::end_message((uint64_t)a2);
          }
          else
          {
LABEL_14:
            *((unsigned char *)a2 + 56) = 1;
            *(void *)a2 = *((void *)a2 + 1);
          }
          break;
        case 3u:
          *((_DWORD *)this + 48) &= ~1u;
          *((_DWORD *)this + 48) |= RB::ProtobufDecoder::BOOL_field(a2, v5);
          break;
        case 4u:
          *((__n128 *)this + 11) = RB::ProtobufDecoder::float4_field(a2, v5);
          break;
        default:
          RB::ProtobufDecoder::skip_field(a2, v5);
          break;
      }
      unint64_t result = RB::ProtobufDecoder::next_field(a2);
      unint64_t v5 = result;
    }
    while (result);
  }
  return result;
}

uint64_t RBImageMakeCGImage()
{
  return 0;
}

uint64_t RBImageMakeIOSurface()
{
  return 1;
}

uint64_t RBImageMakeRBSurface()
{
  return 2;
}

uint64_t RBImageMakeMTLTexture()
{
  return 4;
}

float64x2_t RBImageTransform@<Q0>(uint64_t a1@<X8>, float64x2_t a2@<Q0>, float64_t a3@<D1>, float64x2_t a4@<Q2>, float64_t a5@<D3>, float64x2_t a6@<Q4>, float64_t a7@<D5>, float64x2_t a8, float64x2_t a9)
{
  a2.f64[1] = a3;
  a4.f64[1] = a5;
  float32x2_t v9 = vcvt_f32_f64(a4);
  a6.f64[1] = a7;
  float32x2_t v10 = vcvt_f32_f64(a6);
  float32x2_t v11 = vcvt_f32_f64(a9);
  int8x8_t v12 = (int8x8_t)vdiv_f32(vmul_f32(v10, vcvt_f32_f64(a2)), v11);
  int8x8_t v13 = (int8x8_t)vsub_f32(v9, vdiv_f32(vmul_f32(vcvt_f32_f64(a8), v10), v11));
  *(double *)a1 = *(float *)v12.i32;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  float64x2_t result = vcvtq_f64_f32((float32x2_t)vext_s8(v12, v13, 4uLL));
  *(float64x2_t *)(a1 + 24) = result;
  *(double *)(a1 + 40) = *(float *)&v13.i32[1];
  return result;
}

double RBImageSimpleTransform@<D0>(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>)
{
  float v5 = a2;
  float v6 = a3;
  float v7 = a4;
  float v8 = a5;
  double result = v5;
  *(double *)a1 = v7;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(double *)(a1 + 24) = v8;
  *(double *)(a1 + 32) = result;
  *(double *)(a1 + 40) = v6;
  return result;
}

float64x2_t RBTiledImageTransform@<Q0>(uint64_t a1@<X8>, float64x2_t a2@<Q0>, float64_t a3@<D1>, double a4@<D2>, float64x2_t a5@<Q3>, float64_t a6@<D4>, float64x2_t a7, float64x2_t a8)
{
  a2.f64[1] = a3;
  *(float *)&a3 = a4;
  a5.f64[1] = a6;
  float32x2_t v8 = vcvt_f32_f64(a8);
  float32x2_t v9 = vdiv_f32(v8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a3, 0));
  int8x8_t v10 = (int8x8_t)vdiv_f32(vmul_f32(v9, vcvt_f32_f64(a2)), v8);
  int8x8_t v11 = (int8x8_t)vsub_f32(vcvt_f32_f64(a5), vdiv_f32(vmul_f32(v9, vcvt_f32_f64(a7)), v8));
  *(double *)a1 = *(float *)v10.i32;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  float64x2_t result = vcvtq_f64_f32((float32x2_t)vext_s8(v10, v11, 4uLL));
  *(float64x2_t *)(a1 + 24) = result;
  *(double *)(a1 + 40) = *(float *)&v11.i32[1];
  return result;
}

void RB::XML::Document::Document(RB::XML::Document *this)
{
}

void sub_21420E204(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;
  RB::UntypedTable::~UntypedTable(v4);
  if (*v2) {
    free(*v2);
  }
  float v6 = *v1;
  if (*v1)
  {
    int v7 = v6[2] - 1;
    v6[2] = v7;
    if (!v7) {
      (*(void (**)(_DWORD *))(*(void *)v6 + 8))(v6);
    }
  }
  _Unwind_Resume(a1);
}

void RB::XML::Document::push(RB::XML::Document *this, const char *a2)
{
}

uint64_t RB::XML::Document::pop(uint64_t this)
{
  return this;
}

uint64_t *RB::XML::Document::append(void *a1, uint64_t *a2, uint64_t *a3)
{
  float v6 = *(void **)(a1[1] + 8 * a1[2] - 8);
  uint64_t v7 = v6[4];
  if (v6[5] < (unint64_t)(v7 + 1))
  {
    RB::vector<unsigned long,0ul,unsigned long>::reserve_slow((uint64_t)(v6 + 3), v7 + 1);
    uint64_t v7 = v6[4];
  }
  uint64_t v8 = v6[3];
  uint64_t v9 = *a2;
  if (*a2) {
    ++*(_DWORD *)(v9 + 8);
  }
  *(void *)(v8 + 8 * v7) = v9;
  v6[4] = v7 + 1;
  float64x2_t result = RB::UntypedTable::lookup((RB::UntypedTable *)(a1 + 4), a3, 0);
  if (result) {
    RB::XML::Element::set<RB::XML::Value::StateID>();
  }
  return result;
}

size_t *RB::XML::Document::add_state(RB::XML::Document *this, _RBDrawingState *a2)
{
  uint64_t v4 = (size_t *)*((void *)this + 14);
  *((void *)this + 14) = (char *)v4 + 1;
  if (v4 == (size_t *)-1)
  {
    *((void *)this + 14) = 1;
    float v6 = this;
    RB::UntypedTable::for_each((uint64_t)this + 32, (void (*)(const void *, const void *, void *))RB::Table<_RBDrawingState *,unsigned long>::for_each<RB::XML::Document::add_state(_RBDrawingState *)::$_0>(RB::XML::Document::add_state(_RBDrawingState *)::$_0)const::{lambda(void const*,void const*,void *)#1}::__invoke, &v6);
    uint64_t v4 = (size_t *)*((void *)this + 14);
    *((void *)this + 14) = (char *)v4 + 1;
  }
  RB::UntypedTable::insert((size_t **)this + 4, (size_t *)a2, v4);
  return v4;
}

uint64_t *RB::XML::Document::remove_state(RB::XML::Document *this, _RBDrawingState *a2)
{
  uint64_t v4 = (RB::XML::Document *)((char *)this + 32);
  float64x2_t result = RB::UntypedTable::lookup((RB::XML::Document *)((char *)this + 32), (uint64_t *)a2, 0);
  if (result)
  {
    float v6 = result;
    float64x2_t result = (uint64_t *)RB::UntypedTable::remove(v4, a2);
    if ((uint64_t *)(*((void *)this + 14) - 1) == v6) {
      uint64_t v7 = (uint64_t)v6;
    }
    else {
      uint64_t v7 = -1;
    }
    *((void *)this + 14) = v7;
  }
  return result;
}

uint64_t *RB::XML::Document::set_state(RB::XML::Document *this, _RBDrawingState *a2)
{
  float64x2_t result = RB::UntypedTable::lookup((RB::XML::Document *)((char *)this + 32), (uint64_t *)a2, 0);
  if (result) {
    RB::XML::Element::set<RB::XML::Value::StateID>();
  }
  return result;
}

void RB::XML::Document::snapshot(RB::XML::Element **this)
{
}

void RB::XML::Element::copy(RB::XML::Element *this)
{
}

void sub_21420E778(_Unwind_Exception *exception_object)
{
  int v3 = v1[2] - 1;
  v1[2] = v3;
  if (!v3) {
    (*(void (**)(_DWORD *))(*(void *)v1 + 8))(v1);
  }
  _Unwind_Resume(exception_object);
}

void *RB::XML::Document::print(uint64_t a1, void *a2, uint64_t a3, double a4, double a5)
{
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(a2, (uint64_t)"<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n", 39);
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(a2, (uint64_t)"<display-list xmlns=\"http://www.apple.com/RenderBox/1.0\"", 56);
  uint64_t v10 = *(void *)(*(void *)a1 + 56);
  if (v10)
  {
    uint64_t v11 = *(void *)(*(void *)a1 + 48);
    uint64_t v12 = v11 + 24 * v10;
    do
    {
      LOBYTE(v19[0]) = 32;
      std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(a2, (uint64_t)v19, 1);
      size_t v13 = strlen(*(const char **)v11);
      std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(a2, *(void *)v11, v13);
      LOBYTE(v19[0]) = 61;
      std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(a2, (uint64_t)v19, 1);
      v11 += 24;
    }
    while (v11 != v12);
  }
  if (a4 > 0.0 && a5 > 0.0)
  {
    std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(a2, (uint64_t)" size=", 6);
    v19[0] = &unk_26C4ED4D8;
    *(double *)&v19[1] = a4;
    *(double *)&int32x2_t v19[2] = a5;
  }
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(a2, (uint64_t)">\n", 2);
  uint64_t v14 = *(void *)(*(void *)a1 + 32);
  if (v14)
  {
    long long v15 = *(uint64_t **)(*(void *)a1 + 24);
    uint64_t v16 = 8 * v14;
    do
    {
      uint64_t v17 = *v15++;
      RB::XML::Element::print(v17, a2, 1, a3);
      v16 -= 8;
    }
    while (v16);
  }
  return std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(a2, (uint64_t)"</display-list>\n", 16);
}

void RB::XML::anonymous namespace'::quote_value(void *a1, uint64_t a2)
{
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  __p = 0;
  (*(void (**)(uint64_t, void **))(*(void *)a2 + 16))(a2, &__p);
  char v14 = 34;
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(a1, (uint64_t)&v14, 1);
  uint64_t v3 = HIBYTE(v13);
  if (v13 >= 0) {
    p_p = &__p;
  }
  else {
    p_p = __p;
  }
  if (v13 < 0) {
    uint64_t v3 = v12;
  }
  if (v3 >= 1)
  {
    float v5 = &p_p[v3];
    float v6 = p_p;
    while ((char)*p_p > 0x3E || ((1 << *p_p) & 0x500000C400000000) == 0)
    {
      ++p_p;
LABEL_26:
      if (p_p >= v5)
      {
        if (p_p > v6) {
          std::ostream::write();
        }
        goto LABEL_29;
      }
    }
    if (p_p > v6) {
      std::ostream::write();
    }
    unsigned int v8 = *p_p;
    if (v8 > 0x3B)
    {
      if (v8 == 62)
      {
        uint64_t v9 = "&gt;";
      }
      else
      {
        if (v8 != 60)
        {
LABEL_24:
          uint64_t v9 = "&apos;";
          goto LABEL_25;
        }
        uint64_t v9 = "&lt;";
      }
    }
    else if (v8 == 34)
    {
      uint64_t v9 = "&quot;";
    }
    else
    {
      uint64_t v9 = "&amp;";
      if (v8 != 38) {
        goto LABEL_24;
      }
    }
LABEL_25:
    size_t v10 = strlen(v9);
    std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(a1, (uint64_t)v9, v10);
    float v6 = ++p_p;
    goto LABEL_26;
  }
LABEL_29:
  char v14 = 34;
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(a1, (uint64_t)&v14, 1);
  if (SHIBYTE(v13) < 0) {
    operator delete(__p);
  }
}

void sub_21420EB48(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *RB::XML::Element::print(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  unsigned int v8 = *(_DWORD *)(a1 + 72);
  if (v8) {
    uint64_t v4 = a4 & 0x7FFFFFFF | (~rb_color_space(v8) << 31);
  }
  char v25 = 60;
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(a2, (uint64_t)&v25, 1);
  uint64_t v9 = *(void *)(a1 + 16);
  if (v9)
  {
    size_t v10 = strlen(*(const char **)(a1 + 16));
    std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(a2, v9, v10);
  }
  uint64_t v11 = *(void *)(a1 + 56);
  if (v11)
  {
    uint64_t v12 = *(void *)(a1 + 48);
    uint64_t v13 = v12 + 24 * v11;
    do
    {
      char v26 = 32;
      std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(a2, (uint64_t)&v26, 1);
      size_t v14 = strlen(*(const char **)v12);
      std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(a2, *(void *)v12, v14);
      char v27 = 61;
      std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(a2, (uint64_t)&v27, 1);
      v12 += 24;
    }
    while (v12 != v13);
  }
  if (*(void *)(a1 + 32))
  {
    std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(a2, (uint64_t)">\n", 2);
    uint64_t v15 = *(void *)(a1 + 32);
    if (v15)
    {
      uint64_t v16 = *(uint64_t **)(a1 + 24);
      uint64_t v17 = 8 * v15;
      do
      {
        uint64_t v18 = *v16++;
        RB::XML::Element::print(v18, a2, (a3 + 1), v4);
        v17 -= 8;
      }
      while (v17);
    }
    std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(a2, (uint64_t)"</", 2);
    __int16 v19 = *(const char **)(a1 + 16);
    if (v19)
    {
      size_t v20 = strlen(v19);
      std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(a2, (uint64_t)v19, v20);
    }
    float v21 = ">\n";
    __int16 v22 = a2;
    uint64_t v23 = 2;
  }
  else
  {
    float v21 = "/>\n";
    __int16 v22 = a2;
    uint64_t v23 = 3;
  }
  return std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v22, (uint64_t)v21, v23);
}

void RB::XML::Element::print(RB::XML::Element *this, std::string *a2, uint64_t a3)
{
  float v6 = (const char *)*((void *)this + 2);
  if (v6) {
    RB::SexpString::push(a2, v6);
  }
  uint64_t v7 = *((void *)this + 7);
  if (v7)
  {
    uint64_t v8 = 24 * v7;
    uint64_t v9 = (void *)(*((void *)this + 6) + 8);
    do
    {
      __p[0] = 0;
      __p[1] = 0;
      uint64_t v16 = 0;
      (*(void (**)(void, void **, uint64_t))(*(void *)*v9 + 16))(*v9, __p, a3);
      if (v16 >= 0) {
        size_t v10 = __p;
      }
      else {
        size_t v10 = (void **)__p[0];
      }
      RB::SexpString::printf(a2, 0, "(%s \"%s\")", (const char *)*(v9 - 1), (const char *)v10);
      if (SHIBYTE(v16) < 0) {
        operator delete(__p[0]);
      }
      v9 += 3;
      v8 -= 24;
    }
    while (v8);
  }
  uint64_t v11 = *((void *)this + 4);
  if (v11)
  {
    uint64_t v12 = (RB::XML::Element **)*((void *)this + 3);
    uint64_t v13 = 8 * v11;
    do
    {
      size_t v14 = *v12++;
      RB::XML::Element::print(v14, (RB::SexpString *)a2, a3);
      v13 -= 8;
    }
    while (v13);
  }
  if (*((void *)this + 2)) {
    RB::SexpString::pop(a2);
  }
}

void sub_21420EE74(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void RB::XML::Document::print_children(RB::XML::Document *this, std::string *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(*(void *)this + 32);
  if (v3)
  {
    float v6 = *(RB::XML::Element ***)(*(void *)this + 24);
    uint64_t v7 = 8 * v3;
    do
    {
      uint64_t v8 = *v6++;
      RB::XML::Element::print(v8, a2, a3);
      v7 -= 8;
    }
    while (v7);
  }
}

void *RB::XML::Document::dictionary(RB::XML::Element **this, uint64_t a2)
{
  return RB::XML::Element::dictionary(*this, a2);
}

void *RB::XML::Element::dictionary(RB::XML::Element *this, uint64_t a2)
{
  uint64_t v4 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*((void *)this + 2))
  {
    uint64_t v5 = objc_msgSend(NSString, "stringWithUTF8String:");
    [v4 setObject:v5 forKeyedSubscript:RBXMLRecorderKeyName];
  }
  if (*((void *)this + 7))
  {
    float v6 = (void *)[MEMORY[0x263EFF9A0] dictionary];
    uint64_t v7 = *((void *)this + 7);
    if (v7)
    {
      uint64_t v8 = 24 * v7;
      uint64_t v9 = (void *)(*((void *)this + 6) + 8);
      do
      {
        __p[0] = 0;
        __p[1] = 0;
        uint64_t v19 = 0;
        (*(void (**)(void, void **, uint64_t))(*(void *)*v9 + 16))(*v9, __p, a2);
        if (v19 >= 0) {
          size_t v10 = __p;
        }
        else {
          size_t v10 = (void **)__p[0];
        }
        uint64_t v11 = [NSString stringWithUTF8String:v10];
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, objc_msgSend(NSString, "stringWithUTF8String:", *(v9 - 1)));
        if (SHIBYTE(v19) < 0) {
          operator delete(__p[0]);
        }
        v9 += 3;
        v8 -= 24;
      }
      while (v8);
    }
    [v4 setObject:v6 forKeyedSubscript:RBXMLRecorderKeyAttributes];
  }
  if (*((void *)this + 4))
  {
    uint64_t v12 = (void *)[MEMORY[0x263EFF980] array];
    uint64_t v13 = *((void *)this + 4);
    if (v13)
    {
      size_t v14 = (RB::XML::Element **)*((void *)this + 3);
      uint64_t v15 = 8 * v13;
      do
      {
        uint64_t v16 = RB::XML::Element::dictionary(*v14, a2);
        if (v16) {
          [v12 addObject:v16];
        }
        ++v14;
        v15 -= 8;
      }
      while (v15);
    }
    [v4 setObject:v12 forKeyedSubscript:RBXMLRecorderKeyChildren];
  }
  return v4;
}

void sub_21420F0B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void RB::XML::anonymous namespace'::indent(void *a1, uint64_t a2)
{
  v7[1] = *MEMORY[0x263EF8340];
  if ((a2 & 0x80000000) == 0)
  {
    size_t v3 = 2 * (int)a2;
    size_t v4 = (int)(v3 | 1);
    if ((v3 | 1) > 0x1000)
    {
      uint64_t v5 = (char *)malloc_type_malloc((int)(v3 | 1), 0xCFB199FuLL);
      if (!v5)
      {
LABEL_6:
        free(v5);
        return;
      }
    }
    else
    {
      MEMORY[0x270FA5388](a1, a2);
      uint64_t v5 = (char *)v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v5, v4);
    }
    memset(v5, 32, v3);
    v5[v3] = 0;
    size_t v6 = strlen(v5);
    std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(a1, (uint64_t)v5, v6);
    if (v4 <= 0x1000) {
      return;
    }
    goto LABEL_6;
  }
}

void RB::XML::Element::set_rendering_mode(uint64_t a1, int a2)
{
  if (a2 == 3 || a2 == 2) {
    RB::XML::Element::set<RB::XML::Value::Float>();
  }
  if (a2 == 1) {
    RB::XML::Element::set<RB::XML::Value::Bool>();
  }
}

void RB::Table<_RBDrawingState *,unsigned long>::for_each<RB::XML::Document::add_state(_RBDrawingState *)::$_0>(RB::XML::Document::add_state(_RBDrawingState *)::$_0)const::{lambda(void const*,void const*,void *)#1}::__invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(*(void *)a3 + 112) <= (unint64_t)(a2 + 1)) {
    uint64_t v3 = a2 + 1;
  }
  else {
    uint64_t v3 = *(void *)(*(void *)a3 + 112);
  }
  *(void *)(*(void *)a3 + 112) = v3;
}

void RB::anonymous namespace'::print_ops(unsigned int *a1, uint64_t a2)
{
  unint64_t v2 = *a1;
  if (v2)
  {
    uint64_t v5 = 0;
    while (1)
    {
      size_t v6 = *(int32x2_t **)(a2 + 16 * v5);
      if (v6) {
        break;
      }
LABEL_42:
      if (++v5 >= v2) {
        return;
      }
    }
    std::string::basic_string[abi:nn180100]<0>(&v29, " ");
    int v7 = v6[5].u8[5];
    if (v7 == 1)
    {
      uint64_t v8 = "depth-tested ";
      std::string::size_type v9 = 13;
    }
    else
    {
      if (v7 != 2) {
        goto LABEL_9;
      }
      uint64_t v8 = "depth-writing ";
      std::string::size_type v9 = 14;
    }
    std::string::append(&v29, v8, v9);
LABEL_9:
    size_t v10 = RB::RenderState::name((RB::RenderState *)v6);
    size_t v11 = strlen(v10);
    std::string::append(&v29, v10, v11);
    uint64_t v12 = a2 + 16 * v5;
    uint64_t v13 = (char *)(v12 + 14);
    size_t v14 = (char *)(v12 + 15);
    char v15 = 1;
    do
    {
      char v16 = v15;
      if (v15) {
        uint64_t v17 = " r=";
      }
      else {
        uint64_t v17 = " w=";
      }
      std::string::append(&v29, v17, 3uLL);
      if (v16) {
        uint64_t v18 = v13;
      }
      else {
        uint64_t v18 = v14;
      }
      char v19 = *v18;
      if (*v18) {
        std::string::push_back(&v29, 83);
      }
      if ((v19 & 2) != 0) {
        std::string::push_back(&v29, 67);
      }
      if ((v19 & 4) != 0) {
        std::string::push_back(&v29, 76);
      }
      if ((v19 & 8) != 0) {
        std::string::push_back(&v29, 65);
      }
      if ((v19 & 0x10) != 0) {
        std::string::push_back(&v29, 77);
      }
      if ((v19 & 0x20) != 0) {
        std::string::push_back(&v29, 90);
      }
      char v15 = 0;
    }
    while ((v16 & 1) != 0);
    std::string::push_back(&v29, 32);
    int32x2_t v20 = v6[1];
    float32x2_t v21 = vcvt_f32_s32(v20);
    float32x2_t v22 = vcvt_f32_s32(vsub_s32(v6[2], v20));
    v26[0] = v21;
    v26[1] = v22;
    RB::Rect::operator std::string(v26, __p);
    if ((v28 & 0x80u) == 0) {
      uint64_t v23 = __p;
    }
    else {
      uint64_t v23 = (void **)__p[0];
    }
    if ((v28 & 0x80u) == 0) {
      std::string::size_type v24 = v28;
    }
    else {
      std::string::size_type v24 = (std::string::size_type)__p[1];
    }
    std::string::append(&v29, (const std::string::value_type *)v23, v24);
    if ((char)v28 < 0) {
      operator delete(__p[0]);
    }
    char v25 = &v29;
    if ((v29.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      char v25 = (std::string *)v29.__r_.__value_.__r.__words[0];
    }
    printf("  [%d%s]%s\n", *(__int16 *)(a2 + 16 * v5 + 12), (const char *)v25, "");
    if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v29.__r_.__value_.__l.__data_);
    }
    unint64_t v2 = *a1;
    goto LABEL_42;
  }
}

void sub_21420F514(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  if (a26 < 0) {
    operator delete(a21);
  }
  _Unwind_Resume(exception_object);
}

uint64_t RB::Texture::set_swizzle(void *a1, const char *a2)
{
  if (((_BYTE)a2 - 1) > 3u) {
    uint64_t v2 = 84148994;
  }
  else {
    uint64_t v2 = qword_21421CEA0[(char)((_BYTE)a2 - 1)];
  }
  return [a1 setSwizzle:v2];
}

uint64_t RB::Texture::alloc@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, int a5@<W5>, int a6@<W6>, void *a7@<X8>, int32x2_t a8@<D0>)
{
  std::string::size_type v9 = (const float *)(result + 288);
  int32x2_t v10 = (int32x2_t)vld1_dup_f32(v9);
  uint32x2_t v11 = (uint32x2_t)vand_s8((int8x8_t)vcge_s32(v10, a8), (int8x8_t)vcgtz_s32(a8));
  if ((vpmin_u32(v11, v11).u32[0] & 0x80000000) != 0)
  {
    uint64_t v17 = (void *)[MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:a3 width:a8.i32[0] height:a8.i32[1] mipmapped:0];
    char v19 = v17;
    switch(a6)
    {
      case 0:
        goto LABEL_10;
      case 1:
        uint64_t v20 = 17040130;
        goto LABEL_9;
      case 2:
        uint64_t v20 = 33686018;
        goto LABEL_9;
      case 3:
        uint64_t v20 = 16908802;
        goto LABEL_9;
      case 4:
        uint64_t v20 = 50463234;
        goto LABEL_9;
      default:
        uint64_t v20 = 84148994;
LABEL_9:
        [v17 setSwizzle:v20];
LABEL_10:
        if (a5 != 6 && a5) {
          abort();
        }
        float32x2_t v21 = RB::pixel_format_traits(a3, v18);
        if (((*v21 | ((unint64_t)*((unsigned __int16 *)v21 + 2) << 32)) & 0x40000000000) != 0) {
          uint64_t v22 = 17;
        }
        else {
          uint64_t v22 = 1;
        }
        [v19 setUsage:v22];
        [v19 setStorageMode:0];
        objc_msgSend(v19, "setCpuCacheMode:", objc_msgSend(*(id *)(a2 + 16), "cpuCacheMode"));
        float64x2_t result = [*(id *)(a2 + 16) newTextureWithDescriptor:v19 offset:0 bytesPerRow:a4];
        if (result) {
          operator new();
        }
        return result;
    }
  }
  *a7 = 0;
  return result;
}

void sub_21420F7B8(_Unwind_Exception *a1)
{
  MEMORY[0x21669AC10](v1, 0x10A1C401006C202);
  _Unwind_Resume(a1);
}

unint64_t RB::Texture::has_view_usage(id *this)
{
  unsigned int v1 = *((unsigned __int8 *)this + 78);
  if (v1 < 2) {
    return 1;
  }
  if (v1 == 6) {
    return ((unint64_t)[this[2] usage] >> 4) & 1;
  }
  return 0;
}

uint64_t RB::Texture::replace(RB::Texture *this, int a2, const void *a3, uint64_t a4)
{
  uint64_t v4 = *((void *)this + 8);
  uint64_t v5 = (void *)*((void *)this + 2);
  memset(v8, 0, sizeof(v8));
  *(void *)&long long v6 = (int)v4;
  *((void *)&v6 + 1) = SHIDWORD(v4);
  long long v9 = v6;
  uint64_t v10 = 1;
  return [v5 replaceRegion:v8 mipmapLevel:a2 withBytes:a3 bytesPerRow:a4];
}

void RB::Path::Storage::clear(RB::Path::Storage *this)
{
  unsigned int v1 = this;
  uint64_t v2 = *(void *)this;
  if (*(void *)this)
  {
    *(void *)this = 0;
    if (v2)
    {
      this = (RB::Path::Storage *)(v2 & 0xFFFFFFFFFFFFFFFCLL);
      if ((v2 & 0xFFFFFFFFFFFFFFFCLL) != 0) {
        this = (RB::Path::Storage *)MEMORY[0x21669ABF0](this, 0x1000C8052888210);
      }
    }
  }
  int v3 = *((_DWORD *)v1 + 2);
  if ((v3 & 0x20) != 0)
  {
    uint64_t v4 = (os_unfair_lock_s *)RB::Path::Storage::MapCache::shared(this);
    RB::Path::Storage::MapCache::remove(v4, v1);
    int v3 = *((_DWORD *)v1 + 2);
  }
  if (v3)
  {
    uint64_t v5 = (const void *)*((void *)v1 + 7);
    if (v5)
    {
      *((void *)v1 + 7) = 0;
      CFRelease(v5);
      int v3 = *((_DWORD *)v1 + 2);
    }
  }
  if (v3) {
    *((void *)v1 + 3) = 0;
  }
  else {
    v3 &= 0xFFF000FF;
  }
  *((_DWORD *)v1 + 2) = v3 & 0xFFFFFFC1;
}

uint64_t RB::Path::NestedCallbacks::apply_elements_callback(uint64_t a1, unsigned int a2)
{
  unint64_t v2 = *(void *)(a1 + 24);
  if (a2 <= 0x18)
  {
    if (((1 << a2) & 0x1DE0000) != 0)
    {
      *(void *)(a1 + 24) = v2 + 1;
    }
    else if (a2 == 16)
    {
      *(void *)(a1 + 24) = v2 - 1;
      unint64_t v5 = *(void *)(a1 + 16);
      BOOL v6 = v2 == v5;
      if (v2 <= v5)
      {
        uint64_t v3 = 0;
        char v7 = v6;
        *(unsigned char *)(a1 + 32) = v7;
        return v3;
      }
    }
  }
  if (v2 < *(void *)(a1 + 16)) {
    return 1;
  }
  return (*(uint64_t (**)(void))(a1 + 8))(*(void *)a1);
}

BOOL RB::Path::NestedCallbacks::single_element_callback(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  switch(a2)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 12:
    case 13:
    case 14:
    case 15:
      if (v2 != *(void *)a1) {
        goto LABEL_7;
      }
      *(unsigned char *)(a1 + 24) = 1;
      goto LABEL_4;
    case 4:
      if (v2 != *(void *)a1 || !*(unsigned char *)(a1 + 24)) {
        goto LABEL_7;
      }
      *(unsigned char *)(a1 + 24) = 0;
LABEL_4:
      ++*(void *)(a1 + 16);
LABEL_7:
      BOOL result = *(void *)(a1 + 16) < 2uLL;
      break;
    case 16:
      *(void *)(a1 + 8) = v2 - 1;
      if (v2 != *(void *)a1) {
        goto LABEL_7;
      }
      BOOL result = 0;
      break;
    case 17:
    case 18:
    case 19:
    case 20:
    case 22:
    case 23:
    case 24:
      *(void *)(a1 + 8) = v2 + 1;
      if (v2 == *(void *)a1)
      {
        ++*(void *)(a1 + 16);
        *(unsigned char *)(a1 + 24) = a2 != 19;
      }
      goto LABEL_7;
    default:
      if (v2 != *(void *)a1) {
        goto LABEL_7;
      }
      goto LABEL_4;
  }
  return result;
}

BOOL RB::Path::Object::$_9::__invoke(RB::Path::Object::$_9 *this, const void *a2, const void *a3)
{
  return RB::Path::Storage::operator==((uint64_t)this + 16, (uint64_t)a2 + 16);
}

BOOL RB::Path::Object::$_10::__invoke(RB::Path::Object::$_10 *this, const void *a2)
{
  unint64_t v2 = *((unsigned int *)this + 6);
  if (v2) {
    uint64_t v3 = *((void *)this + 5);
  }
  else {
    uint64_t v3 = (v2 >> 8) & 0xFFF;
  }
  return v3 == 0;
}

uint64_t RB::Path::Object::$_12::__invoke(RB::Path::Object::$_12 *this, const void *a2)
{
  int v2 = *((_DWORD *)this + 6);
  uint64_t v3 = 1;
  if ((v2 & 2) != 0) {
    uint64_t v3 = 2;
  }
  if ((v2 & 4) != 0) {
    return 3;
  }
  else {
    return v3;
  }
}

BOOL RB::Path::Storage::decode(RB::Path::Storage *this, RB::ProtobufDecoder *a2)
{
  uint64_t v109 = *MEMORY[0x263EF8340];
  long long v107 = 0u;
  unint64_t v108 = 64;
  *(_OWORD *)__int16 v104 = 0u;
  unint64_t v105 = 64;
  long long v101 = 0u;
  unint64_t v102 = 64;
  uint64_t v97 = 0;
  unint64_t v98 = 0;
  unint64_t v99 = 0;
  uint64_t field = RB::ProtobufDecoder::next_field(a2);
  BOOL v5 = 1;
  if (field)
  {
    unint64_t v6 = field;
    float16x4_t v94 = this;
    do
    {
      unint64_t v7 = v6 >> 3;
      switch((v6 >> 3))
      {
        case 1u:
        case 3u:
          uint64_t v8 = RB::ProtobufDecoder::data_field(a2, v6);
          *((void *)&v107 + 1) = 0;
          if (v9)
          {
            uint64_t v10 = (const void *)v8;
            size_t v11 = v9;
            if (v108 < v9) {
              RB::vector<unsigned char,64ul,unsigned long>::reserve_slow(__dst, v9);
            }
            *((void *)&v107 + 1) = v11;
            if ((void)v107) {
              uint64_t v12 = (unsigned char *)v107;
            }
            else {
              uint64_t v12 = __dst;
            }
            memcpy(v12, v10, v11);
            if (v7 == 1)
            {
              uint64_t v13 = *((void *)&v107 + 1);
              size_t v14 = (unsigned char *)v107;
              if (!(void)v107) {
                size_t v14 = __dst;
              }
              if (*((void *)&v107 + 1))
              {
                do
                {
                  *v14++ &= 0x1Fu;
                  --v13;
                }
                while (v13);
              }
            }
          }
          break;
        case 2u:
          float v15 = RB::ProtobufDecoder::float_field(a2, v6);
          char v16 = v104[1];
          uint64_t v17 = (char *)v104[1] + 1;
          if ((void *)v105 < (char *)v104[1] + 1)
          {
            RB::vector<objc_object *,64ul,unsigned long>::reserve_slow(v103, (size_t)v17);
            char v16 = v104[1];
            uint64_t v17 = (char *)v104[1] + 1;
          }
          MTLPixelFormat v18 = v104[0];
          if (!v104[0]) {
            MTLPixelFormat v18 = v103;
          }
          *(double *)&v18[8 * (void)v16] = v15;
          v104[1] = v17;
          break;
        case 4u:
          unint64_t v19 = v98;
          unint64_t v20 = v98 + 1;
          if (v99 < v98 + 1)
          {
            unint64_t v19 = v98;
            unint64_t v20 = v98 + 1;
          }
          float32x2_t v21 = (char *)v97;
          uint64_t v22 = (char *)v97 + 64 * v19;
          *(_DWORD *)uint64_t v22 = 0;
          unint64_t v98 = v20;
          if ((v6 & 7) == 2)
          {
            RB::ProtobufDecoder::begin_message(a2);
            uint64_t v23 = RB::ProtobufDecoder::next_field(a2);
            if (v23)
            {
              unint64_t v24 = v23;
              char v25 = &v21[64 * v19];
              char v26 = (RB::AffineTransform *)(v25 + 16);
              char v27 = (uint64_t *)(v22 + 24);
              unsigned __int8 v28 = v25 + 32;
              float16x4_t v95 = v25 + 48;
              while (2)
              {
                switch((v24 >> 3))
                {
                  case 1u:
                    if (*(_DWORD *)v22) {
                      goto LABEL_61;
                    }
                    *(_DWORD *)uint64_t v22 = 1;
                    *(_OWORD *)char v26 = xmmword_2142181C0;
                    *unsigned __int8 v28 = xmmword_2142181D0;
                    *float16x4_t v95 = 0;
                    v95[1] = 0;
                    if ((v24 & 7) != 2) {
                      goto LABEL_104;
                    }
                    RB::ProtobufDecoder::begin_message(a2);
                    RB::AffineTransform::decode(v26, a2);
                    goto LABEL_59;
                  case 2u:
                    if (*(_DWORD *)v22) {
                      goto LABEL_61;
                    }
                    *(_DWORD *)uint64_t v22 = 2;
                    *(_OWORD *)char v26 = 0u;
                    *((_OWORD *)v26 + 1) = 0u;
                    if ((v24 & 7) != 2) {
                      goto LABEL_104;
                    }
                    RB::ProtobufDecoder::begin_message(a2);
                    uint64_t v29 = RB::ProtobufDecoder::next_field(a2);
                    if (v29)
                    {
                      unint64_t v30 = v29;
                      do
                      {
                        unint64_t v31 = v30 >> 3;
                        if ((v30 >> 3) == 3)
                        {
                          float v33 = RB::ProtobufDecoder::float_field(a2, v30);
                          uint64_t v34 = *(void *)v28;
                          unint64_t v35 = *(void *)v28 + 1;
                          if (*((void *)v22 + 5) < v35)
                          {
                            RB::vector<unsigned long,0ul,unsigned long>::reserve_slow((uint64_t)(v22 + 24), v35);
                            uint64_t v34 = *(void *)v28;
                            unint64_t v35 = *(void *)v28 + 1;
                          }
                          *(double *)(*v27 + 8 * v34) = v33;
                          *(void *)unsigned __int8 v28 = v35;
                        }
                        else if (v31 == 2)
                        {
                          unint64_t v36 = RB::ProtobufDecoder::uint_field((uint64_t **)a2, v30);
                          if (v36 <= 2) {
                            *((_DWORD *)v22 + 5) = v36;
                          }
                        }
                        else if (v31 == 1)
                        {
                          unint64_t v32 = RB::ProtobufDecoder::uint_field((uint64_t **)a2, v30);
                          if (v32 <= 6) {
                            *(_DWORD *)char v26 = v32;
                          }
                        }
                        else
                        {
                          RB::ProtobufDecoder::skip_field(a2, v30);
                        }
                        unint64_t v30 = RB::ProtobufDecoder::next_field(a2);
                      }
                      while (v30);
                    }
                    goto LABEL_59;
                  case 3u:
                    if (*(_DWORD *)v22) {
                      goto LABEL_61;
                    }
                    *(_DWORD *)uint64_t v22 = 3;
                    if ((v24 & 7) != 2) {
                      goto LABEL_104;
                    }
                    RB::ProtobufDecoder::begin_message(a2);
                    uint64_t v37 = RB::ProtobufDecoder::next_field(a2);
                    if (v37)
                    {
                      unint64_t v38 = v37;
                      do
                      {
                        if ((v38 >> 3) == 2)
                        {
                          v22[17] = RB::ProtobufDecoder::BOOL_field(a2, v38);
                        }
                        else if ((v38 >> 3) == 1)
                        {
                          unint64_t v39 = RB::ProtobufDecoder::uint_field((uint64_t **)a2, v38);
                          if (v39 <= 6) {
                            *(unsigned char *)char v26 = v39;
                          }
                        }
                        else
                        {
                          RB::ProtobufDecoder::skip_field(a2, v38);
                        }
                        unint64_t v38 = RB::ProtobufDecoder::next_field(a2);
                      }
                      while (v38);
                    }
                    goto LABEL_59;
                  case 4u:
                    if (*(_DWORD *)v22) {
                      goto LABEL_61;
                    }
                    *(_DWORD *)uint64_t v22 = 4;
                    *(void *)char v26 = 0x100000000;
                    *((void *)v22 + 4) = 0;
                    *((void *)v22 + 5) = 0;
                    *char v27 = 0;
                    if ((v24 & 7) == 2)
                    {
                      RB::ProtobufDecoder::begin_message(a2);
                      uint64_t v40 = RB::ProtobufDecoder::next_field(a2);
                      if (v40)
                      {
                        unint64_t v41 = v40;
                        do
                        {
                          switch((v41 >> 3))
                          {
                            case 1u:
                              unint64_t v42 = RB::ProtobufDecoder::uint_field((uint64_t **)a2, v41);
                              if (v42 <= 6) {
                                *((_DWORD *)v22 + 5) = v42;
                              }
                              break;
                            case 2u:
                              BOOL v43 = RB::ProtobufDecoder::BOOL_field(a2, v41) == 0;
                              int v44 = 4;
                              goto LABEL_95;
                            case 3u:
                              int v45 = *(_DWORD *)v26 | RB::ProtobufDecoder::BOOL_field(a2, v41);
                              goto LABEL_99;
                            case 4u:
                              if (RB::ProtobufDecoder::BOOL_field(a2, v41)) {
                                int v44 = 2;
                              }
                              else {
                                int v44 = 0;
                              }
                              goto LABEL_98;
                            case 5u:
                              uint64_t v46 = *(void *)v28;
                              unint64_t v47 = *(void *)v28 + 1;
                              if (*((void *)v22 + 5) < v47)
                              {
                                RB::vector<RB::Fill::Gradient::Stop,0ul,unsigned long>::reserve_slow((uint64_t)(v22 + 24), v47);
                                uint64_t v46 = *(void *)v28;
                                unint64_t v47 = *(void *)v28 + 1;
                              }
                              uint64_t v48 = *v27;
                              float v49 = (void *)(*v27 + 16 * v46);
                              *float v49 = 0;
                              v49[1] = 0;
                              *(void *)unsigned __int8 v28 = v47;
                              if ((v41 & 7) == 2)
                              {
                                RB::ProtobufDecoder::begin_message(a2);
                                uint64_t v50 = RB::ProtobufDecoder::next_field(a2);
                                if (v50)
                                {
                                  unint64_t v51 = v50;
                                  float32x2_t v52 = (float *)(v48 + 16 * v46);
                                  float32x4_t v53 = v52 + 3;
                                  float16x4_t v54 = v52 + 2;
                                  float32x4_t v55 = v52 + 1;
                                  do
                                  {
                                    switch((v51 >> 3))
                                    {
                                      case 1u:
                                        float *v55 = RB::ProtobufDecoder::float_field(a2, v51);
                                        break;
                                      case 2u:
                                        *float16x4_t v54 = RB::ProtobufDecoder::float_field(a2, v51);
                                        break;
                                      case 3u:
                                        float *v53 = RB::ProtobufDecoder::float_field(a2, v51);
                                        break;
                                      case 4u:
                                        int v56 = *(_DWORD *)v49 | RB::ProtobufDecoder::BOOL_field(a2, v51);
                                        goto LABEL_90;
                                      case 5u:
                                        if (RB::ProtobufDecoder::BOOL_field(a2, v51)) {
                                          int v57 = 2;
                                        }
                                        else {
                                          int v57 = 0;
                                        }
                                        int v56 = *(_DWORD *)v49 | v57;
LABEL_90:
                                        *(_DWORD *)float v49 = v56;
                                        break;
                                      default:
                                        RB::ProtobufDecoder::skip_field(a2, v51);
                                        break;
                                    }
                                    unint64_t v51 = RB::ProtobufDecoder::next_field(a2);
                                  }
                                  while (v51);
                                }
                                RB::ProtobufDecoder::end_message((uint64_t)a2);
                              }
                              else
                              {
                                *((unsigned char *)a2 + 56) = 1;
                                *(void *)a2 = *((void *)a2 + 1);
                              }
                              break;
                            case 6u:
                              BOOL v43 = RB::ProtobufDecoder::BOOL_field(a2, v41) == 0;
                              int v44 = 8;
LABEL_95:
                              if (v43) {
                                int v44 = 0;
                              }
LABEL_98:
                              int v45 = *(_DWORD *)v26 | v44;
LABEL_99:
                              *(_DWORD *)char v26 = v45;
                              break;
                            default:
                              RB::ProtobufDecoder::skip_field(a2, v41);
                              break;
                          }
                          unint64_t v41 = RB::ProtobufDecoder::next_field(a2);
                        }
                        while (v41);
                      }
LABEL_59:
                      RB::ProtobufDecoder::end_message((uint64_t)a2);
                    }
                    else
                    {
LABEL_104:
                      *((unsigned char *)a2 + 56) = 1;
                      *(void *)a2 = *((void *)a2 + 1);
                    }
LABEL_62:
                    unint64_t v24 = RB::ProtobufDecoder::next_field(a2);
                    if (!v24) {
                      break;
                    }
                    continue;
                  default:
LABEL_61:
                    RB::ProtobufDecoder::skip_field(a2, v24);
                    goto LABEL_62;
                }
                break;
              }
            }
            RB::ProtobufDecoder::end_message((uint64_t)a2);
          }
          else
          {
            *((unsigned char *)a2 + 56) = 1;
            *(void *)a2 = *((void *)a2 + 1);
          }
          break;
        case 5u:
          double v58 = RB::ProtobufDecoder::double_field(a2, v6);
          uint64_t v59 = *((void *)&v101 + 1);
          size_t v60 = *((void *)&v101 + 1) + 1;
          if (v102 < *((void *)&v101 + 1) + 1)
          {
            RB::vector<objc_object *,64ul,unsigned long>::reserve_slow(v100, v60);
            uint64_t v59 = *((void *)&v101 + 1);
            size_t v60 = *((void *)&v101 + 1) + 1;
          }
          float16x4_t v61 = (unsigned char *)v101;
          if (!(void)v101) {
            float16x4_t v61 = v100;
          }
          *(double *)&v61[8 * v59] = v58;
          *((void *)&v101 + 1) = v60;
          break;
        default:
          RB::ProtobufDecoder::skip_field(a2, v6);
          break;
      }
      unint64_t v6 = RB::ProtobufDecoder::next_field(a2);
    }
    while (v6);
    uint64_t v62 = *((void *)&v107 + 1);
    int v63 = (void)v107 ? (char *)v107 : __dst;
    BOOL v5 = 1;
    if (*((void *)&v107 + 1))
    {
      float32x2_t v64 = 0;
      unint64_t v65 = 0;
      uint64_t v66 = 0;
      unint64_t v67 = 0;
      uint64_t v68 = *((void *)&v107 + 1);
      float16x4_t v69 = v63;
      do
      {
        uint64_t v70 = *v69 & 0x3F;
        if ((*v69 & 0x3Fu) > 0x18)
        {
LABEL_142:
          BOOL v5 = 0;
          goto LABEL_143;
        }
        if ((*v69 & 0x80) != 0)
        {
          int v71 = 0;
          switch(*v69 & 0x3F)
          {
            case 0x10:
            case 0x12:
            case 0x16:
            case 0x17:
              break;
            case 0x11:
            case 0x15:
              goto LABEL_124;
            case 0x13:
              int v71 = 2;
              break;
            case 0x14:
              int v71 = 3;
              break;
            case 0x18:
              int v71 = 4;
              break;
            default:
              if (v70 != 4) {
LABEL_124:
              }
                int v71 = 1;
              break;
          }
          if (v67 >= v98 || *((_DWORD *)v97 + 16 * v67) != v71) {
            goto LABEL_142;
          }
          ++v67;
        }
        uint64_t v72 = __RBPathElementArgumentCount[v70];
        if ((*v69 & 0x40) != 0)
        {
          v65 += v72;
          if (v65 > *((void *)&v101 + 1)) {
            goto LABEL_142;
          }
        }
        else
        {
          v64 += v72;
          if (v64 > v104[1]) {
            goto LABEL_142;
          }
        }
        if (v70 <= 0x18)
        {
          if (((1 << v70) & 0x1DE0000) != 0)
          {
            ++v66;
          }
          else if (v70 == 16)
          {
            if (!v66) {
              goto LABEL_142;
            }
            --v66;
          }
        }
        ++v69;
        --v68;
      }
      while (v68);
      BOOL v5 = v66 == 0;
      if (!v66)
      {
        int v79 = v97;
        __int16 v80 = (double *)v101;
        if (!(void)v101) {
          __int16 v80 = (double *)v100;
        }
        BOOL v81 = (double *)v104[0];
        if (!v104[0]) {
          BOOL v81 = (double *)v103;
        }
        do
        {
          int v82 = *v63;
          char v83 = *v63;
          if (v82 < 0)
          {
            unsigned int v85 = v83 & 0x3F;
            if (v85 == 24 || v85 == 19)
            {
              v96[0] = v79[2];
              uint64_t v86 = v79[3];
              v96[1] = v79[4];
              v96[2] = v86;
              float32x4_t v84 = (int *)v96;
            }
            else
            {
              float32x4_t v84 = (int *)(v79 + 2);
            }
            v79 += 8;
          }
          else
          {
            float32x4_t v84 = 0;
            unsigned int v85 = v82 & 0xFFFFFFBF;
          }
          if (v85 > 0x18) {
            uint64_t v87 = 0;
          }
          else {
            uint64_t v87 = __RBPathElementArgumentCount[v85];
          }
          BOOL v88 = (v83 & 0x40) == 0;
          if ((v83 & 0x40) != 0) {
            uint64_t v89 = 0;
          }
          else {
            uint64_t v89 = v87;
          }
          uint64_t v90 = &v81[v89];
          if (v88) {
            uint64_t v91 = 0;
          }
          else {
            uint64_t v91 = v87;
          }
          float16x4_t v92 = &v80[v91];
          if (v88) {
            float16x4_t v93 = v81;
          }
          else {
            float16x4_t v93 = v80;
          }
          RB::Path::Storage::append_element(v94, (const char *)v85, v93, v84);
          ++v63;
          __int16 v80 = v92;
          BOOL v81 = v90;
          --v62;
        }
        while (v62);
        BOOL v5 = 1;
      }
    }
  }
LABEL_143:
  float64x2_t v73 = v97;
  unint64_t v74 = v98;
  if (v98)
  {
    unint64_t v75 = 0;
    float64x2_t v76 = (void **)((char *)v97 + 24);
    do
    {
      int v77 = *((_DWORD *)v76 - 6);
      if ((v77 == 4 || v77 == 2) && *v76)
      {
        free(*v76);
        unint64_t v74 = v98;
      }
      ++v75;
      v76 += 8;
    }
    while (v75 < v74);
    float64x2_t v73 = v97;
  }
  if (v73) {
    free(v73);
  }
  if ((void)v101) {
    free((void *)v101);
  }
  if (v104[0]) {
    free(v104[0]);
  }
  if ((void)v107) {
    free((void *)v107);
  }
  return v5;
}

uint64_t RBPathStorageGetBezierOrder(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 8);
  uint64_t v2 = 1;
  if ((v1 & 2) != 0) {
    uint64_t v2 = 2;
  }
  if ((v1 & 4) != 0) {
    return 3;
  }
  else {
    return v2;
  }
}

_DWORD *RB::Path::Storage::MapCache::Destination::closepath(RB::Path::Storage::MapCache::Destination *this)
{
  return RB::Path::Storage::append_element((RB::Path::Storage *)(*((void *)this + 1) + 16), (const char *)4, 0, 0);
}

_DWORD *RB::Path::Storage::MapCache::Destination::lineto(uint64_t a1, __n128 a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  __n128 v3 = a2;
  return RB::Path::Storage::append_element((RB::Path::Storage *)(*(void *)(a1 + 8) + 16), (const char *)1, v3.n128_f64, 0);
}

_DWORD *RB::Path::Storage::MapCache::Destination::quadto(uint64_t a1, __n128 a2, __n128 a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v4[0] = a2;
  v4[1] = a3;
  return RB::Path::Storage::append_element((RB::Path::Storage *)(*(void *)(a1 + 8) + 16), (const char *)2, (double *)v4, 0);
}

uint64_t RB::Path::NestedCallbacks::NestedCallbacks(RBPathCallbacks const*,unsigned long)::$_2::__invoke(uint64_t a1, uint64_t a2)
{
  return RBPathGetBezierOrder(a1, *(void *)(a2 + 88));
}

void *RB::vector<RB::Path::anonymous namespace'::Transform,0ul,unsigned long>::reserve_slow(uint64_t a1, unint64_t a2)
{
  if (*(void *)(a1 + 16) + (*(void *)(a1 + 16) >> 1) <= a2) {
    uint64_t v3 = a2;
  }
  else {
    uint64_t v3 = *(void *)(a1 + 16) + (*(void *)(a1 + 16) >> 1);
  }
  BOOL result = RB::details::realloc_vector<unsigned long,64ul>(*(void **)a1, (size_t *)(a1 + 16), v3);
  *(void *)a1 = result;
  return result;
}

void *RB::details::realloc_vector<unsigned long,64ul>(void *a1, size_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  if (a3)
  {
    size_t v5 = malloc_good_size(a3 << 6);
    size_t v6 = v5 >> 6;
    if (v5 >> 6 != *a2)
    {
      unint64_t v7 = malloc_type_realloc(v4, v5, 0x2F8905C9uLL);
      if (!v7) {
        RB::precondition_failure((RB *)"allocation failure", v8);
      }
      uint64_t v4 = v7;
      *a2 = v6;
    }
  }
  else
  {
    *a2 = 0;
    free(a1);
    return 0;
  }
  return v4;
}

void *RB::vector<std::pair<unsigned long,RB::refcounted_ptr<RB::Path::Object>>,1ul,unsigned long>::reserve_slow(void *__dst, size_t a2)
{
  if (*((void *)__dst + 4) + (*((void *)__dst + 4) >> 1) <= a2) {
    size_t v3 = a2;
  }
  else {
    size_t v3 = *((void *)__dst + 4) + (*((void *)__dst + 4) >> 1);
  }
  BOOL result = RB::details::realloc_vector<unsigned long,16ul>(*((void **)__dst + 2), __dst, 1uLL, (size_t *)__dst + 4, v3);
  *((void *)__dst + 2) = result;
  return result;
}

uint64_t CG::offset::offset(uint64_t result, uint64_t a2, double a3, double a4)
{
  *(void *)BOOL result = &unk_26C4E7370;
  *(double *)(result + 8) = a4;
  *(double *)(result + --*(void *)(this + 16) = a3;
  *(void *)(result + 32) = a2;
  *(_DWORD *)(result + 40) = 0;
  double v4 = a3 * 0.1;
  if (a3 * 0.1 < 0.001) {
    double v4 = 0.001;
  }
  if (a3 <= 0.0) {
    double v5 = 0.1;
  }
  else {
    double v5 = v4;
  }
  *(_OWORD *)(result + 48) = 0u;
  *(_OWORD *)(result + 64) = 0u;
  *(_OWORD *)(result + 80) = 0u;
  *(_OWORD *)(result + 96) = 0u;
  *(_OWORD *)(result + 112) = 0u;
  *(_OWORD *)(result + 128) = 0u;
  *(_OWORD *)(result + 144) = 0u;
  *(double *)(result + 24) = v5;
  return result;
}

__n128 CG::offset::moveto(__n128 *a1, __n128 a2)
{
  a1[2].n128_u32[2] = 2;
  a1[9] = a2;
  __n128 result = a1[9];
  a1[6] = result;
  a1[3] = result;
  return result;
}

__n128 CG::offset::lineto(__n128 *a1, __n128 result)
{
  __int32 v2 = a1[2].n128_i32[2];
  if (v2)
  {
    if (v2 == 1) {
      a1[2].n128_u32[2] = 2;
    }
    a1[9] = result;
    size_t v3 = a1 + 9;
    double v4 = a1 + 6;
    if (CG::offset::add_line_segment(a1, (const Point *)&a1[6], (const Point *)&a1[9]))
    {
      __n128 result = *v3;
      *double v4 = *v3;
    }
  }
  return result;
}

BOOL CG::offset::add_line_segment(__n128 *this, const Point *a2, const Point *a3)
{
  float64x2_t v4 = vsubq_f64(*(float64x2_t *)&a3->v, *(float64x2_t *)&a2->v);
  double v5 = vaddvq_f64(vmulq_f64(v4, v4));
  if (v5 <= 0.00000001)
  {
    if (this[2].n128_u32[2] == 2) {
      this[2].n128_u32[2] = 3;
    }
  }
  else
  {
    double v7 = v4.f64[1];
    if (v4.f64[0] == 0.0 && v4.f64[1] == 0.0)
    {
      double v8 = v4.f64[0];
    }
    else
    {
      double v9 = sqrt(v5);
      double v8 = v4.f64[0] / v9;
      double v7 = v4.f64[1] / v9;
    }
    v18.n128_f64[0] = v8;
    v18.n128_f64[1] = v7;
    double v10 = this->n128_f64[1];
    double v11 = -(v7 * v10);
    double v12 = v10 * v8;
    if (this[2].n128_u32[2] == 4)
    {
      float64x2_t v17 = v4;
      CG::offset::add_join((uint64_t)this, (double *)&a2->v, (uint64_t)a3, v18.n128_f64);
      __n128 v13 = v18;
      this[7] = (__n128)v17;
      this[8] = v13;
    }
    else
    {
      this[2].n128_u32[2] = 4;
      __n128 v14 = v18;
      this[7] = (__n128)v4;
      this[8] = v14;
      this[4] = (__n128)v4;
      this[5] = v14;
      v14.n128_f64[0] = *(double *)&a2->v + v11;
      v14.n128_f64[1] = *(double *)&a2[2].v + v12;
      (*(void (**)(unint64_t, __n128))(*(void *)this[2].n128_u64[0] + 16))(this[2].n128_u64[0], v14);
    }
    v15.n128_f64[0] = *(double *)&a3->v + v11;
    v15.n128_f64[1] = *(double *)&a3[2].v + v12;
    (*(void (**)(unint64_t, __n128))(*(void *)this[2].n128_u64[0] + 24))(this[2].n128_u64[0], v15);
  }
  return v5 > 0.00000001;
}

float64x2_t CG::offset::quadto(Point *a1, float64x2_t result, float64x2_t a3)
{
  Point v3 = a1[10];
  if (v3)
  {
    if (v3 == 1) {
      a1[10] = (Point)2;
    }
    *(float64x2_t *)&a1[36].v = a3;
    double v5 = (float64x2_t *)&a1[36];
    float64x2_t v6 = (float64x2_t)vdupq_n_s64(0x3FD5555555555555uLL);
    float64x2_t v7 = vmlaq_f64(result, v6, vsubq_f64(*(float64x2_t *)&a1[24].v, result));
    *(float64x2_t *)&v9[0].v = vmlaq_f64(result, v6, vsubq_f64(a3, result));
    *(float64x2_t *)&v10[0].v = v7;
    CG::Cubic::Cubic((CG::Cubic *)v8, a1 + 24, v10, v9, a1 + 36);
    if (CG::offset::add_cubic_segment((CG::offset *)a1, v8))
    {
      __n128 result = *v5;
      *(float64x2_t *)&a1[24].v = *v5;
    }
  }
  return result;
}

uint64_t CG::offset::add_cubic_segment(CG::offset *this, float64x2_t *a2)
{
  double v4 = a2[1].f64[0];
  double v5 = a2[1].f64[1];
  if ((v4 - a2->f64[0]) * (v4 - a2->f64[0]) + (v5 - a2->f64[1]) * (v5 - a2->f64[1]) <= 0.00000001
    && (double v6 = a2[2].f64[0], v7 = a2[2].f64[1], (v6 - v4) * (v6 - v4) + (v7 - v5) * (v7 - v5) <= 0.00000001)
    && (a2[3].f64[0] - v6) * (a2[3].f64[0] - v6) + (a2[3].f64[1] - v7) * (a2[3].f64[1] - v7) <= 0.00000001)
  {
    if (*((_DWORD *)this + 10) == 2)
    {
      uint64_t result = 0;
      *((_DWORD *)this + 10) = 3;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    double v9 = CG::Cubic::derivative((CG::Cubic *)a2, 0.0);
    if (v9 != 0.0 || (double v11 = v9, v12 = v10, v10 != 0.0))
    {
      double v13 = sqrt(v9 * v9 + v10 * v10);
      double v11 = v9 / v13;
      double v12 = v10 / v13;
    }
    *(double *)&long long v31 = v11;
    *((double *)&v31 + 1) = v12;
    if (*((_DWORD *)this + 10) == 4)
    {
      v29[0] = *a2;
      CG::offset::add_join((uint64_t)this, v29[0].f64, v8, (double *)&v31);
    }
    else
    {
      *((_DWORD *)this + 10) = 4;
      *((double *)this + 8) = v9;
      *((double *)this + 9) = v10;
      *((_OWORD *)this + 5) = v31;
      double v14 = *((double *)this + 1);
      v15.n128_f64[0] = a2->f64[0] - v14 * v12;
      v15.n128_f64[1] = a2->f64[1] + v14 * v11;
      (*(void (**)(void, __n128))(**((void **)this + 4) + 16))(*((void *)this + 4), v15);
    }
    double v16 = CG::Cubic::derivative((CG::Cubic *)a2, 1.0);
    *((double *)this + 14) = v16;
    *((double *)this + 15) = v17;
    if (v16 != 0.0 || v17 != 0.0)
    {
      double v18 = sqrt(v16 * v16 + v17 * v17);
      double v16 = v16 / v18;
      double v17 = v17 / v18;
    }
    *((double *)this + --*(void *)(this + 16) = v16;
    *((double *)this + 17) = v17;
    double v19 = a2[1].f64[0];
    if (((a2[2].f64[0] - a2[3].f64[0]) * (a2[2].f64[1] - a2[1].f64[1])
        + (a2[3].f64[1] - a2[2].f64[1]) * (a2[2].f64[0] - v19))
       * ((a2[2].f64[0] - v19) * (a2->f64[1] - a2[1].f64[1]) + (a2[2].f64[1] - a2[1].f64[1]) * (v19 - a2->f64[0])) > 0.0
      || (v20 = CG::Cubic::inflection_points_classic((CG::Cubic *)a2), double v22 = v20, v23 = v21, v20 == -1.0) && v21 == -1.0)
    {
      unint64_t v24 = this;
      char v25 = a2;
    }
    else
    {
      CG::Cubic::split(a2, v20, v29);
      CG::offset::path_offset_round_cube(this, v29);
      if (v23 == -1.0)
      {
        char v25 = v30;
      }
      else
      {
        CG::Cubic::split(v30, (v23 - v22) / (1.0 - v22), v27);
        CG::offset::path_offset_round_cube(this, v27);
        char v25 = (float64x2_t *)&v28;
      }
      unint64_t v24 = this;
    }
    CG::offset::path_offset_round_cube(v24, v25);
    return 1;
  }
  return result;
}

__n128 CG::offset::cubeto(uint64_t a1, __n128 result, __n128 a3, __n128 a4)
{
  int v4 = *(_DWORD *)(a1 + 40);
  if (v4)
  {
    if (v4 == 1) {
      *(_DWORD *)(a1 + 40) = 2;
    }
    *(__n128 *)&v8[0].v = a3;
    *(__n128 *)&v9[0].v = result;
    *(__n128 *)(a1 + 144) = a4;
    double v6 = (__n128 *)(a1 + 144);
    CG::Cubic::Cubic((CG::Cubic *)v7, (const Point *)(a1 + 96), v9, v8, (const Point *)(a1 + 144));
    if (CG::offset::add_cubic_segment((CG::offset *)a1, v7))
    {
      uint64_t result = *v6;
      *(__n128 *)(a1 + 96) = *v6;
    }
  }
  return result;
}

__n128 CG::offset::closepath(CG::offset *this)
{
  unsigned int v1 = *((_DWORD *)this + 10);
  if (v1 >= 2)
  {
    if (v1 == 4)
    {
      CG::offset::add_line_segment((__n128 *)this, (const Point *)this + 24, (const Point *)this + 12);
      CG::offset::add_join((uint64_t)this, (double *)this + 6, v3, (double *)this + 10);
      (*(void (**)(void))(**((void **)this + 4) + 8))(*((void *)this + 4));
    }
    *((_DWORD *)this + 10) = 1;
    __n128 result = *((__n128 *)this + 3);
    *((__n128 *)this + 6) = result;
    *((__n128 *)this + 9) = result;
  }
  return result;
}

uint64_t CG::offset::add_join(uint64_t result, double *a2, uint64_t a3, double *a4)
{
  double v5 = *(double *)(result + 128);
  double v4 = *(double *)(result + 136);
  double v7 = *a4;
  double v6 = a4[1];
  if (v6 * v4 + *a4 * v5 <= 0.99)
  {
    double v8 = *(double *)(result + 8);
    double v9 = -(v6 * v8);
    double v10 = v8 * v7;
    if (-(v4 * v8 - v6 * v8) * -(v4 * v8 - v6 * v8) + -(v8 * v7 - v8 * v5) * -(v8 * v7 - v8 * v5) >= 0.05)
    {
      double v12 = v7 + v5;
      double v13 = v4 + v6;
      double v14 = sqrt(v12 * v12 + v13 * v13);
      if (v14 >= 0.001)
      {
        double v16 = 2.66666667 / v14;
        if (vabdd_f64(v4, v6) <= vabdd_f64(v5, v7)) {
          double v15 = (1.33333333 - v16) * v13 / (v5 - v7);
        }
        else {
          double v15 = (v16 + -1.33333333) * v12 / (v4 - v6);
        }
      }
      else
      {
        double v15 = -1.33333333;
      }
      double v17 = v5 + v15 * v4;
      double v18 = a2[1];
      v19.n128_f64[0] = *a2 + -(v4 - v15 * v5) * v8;
      v19.n128_f64[1] = v18 + v17 * v8;
      double v20 = v7 - v15 * v6;
      v21.n128_f64[0] = *a2 - (v6 + v15 * v7) * v8;
      v21.n128_f64[1] = v18 + v20 * v8;
      v22.n128_f64[0] = *a2 + v9;
      v22.n128_f64[1] = v18 + v10;
      return (*(uint64_t (**)(__n128, __n128, __n128))(**(void **)(result + 32) + 40))(v19, v21, v22);
    }
    else
    {
      v11.n128_f64[0] = *a2 - v6 * v8;
      v11.n128_f64[1] = a2[1] + v10;
      return (*(uint64_t (**)(__n128))(**(void **)(result + 32) + 24))(v11);
    }
  }
  return result;
}

uint64_t CG::offset::endpath(CG::offset *this)
{
  return (***((uint64_t (****)(void))this + 4))(*((void *)this + 4));
}

double CG::offset::offset_normal(uint64_t a1, CG::Cubic *this, double *a3, double a4)
{
  double v6 = CG::Cubic::derivative(this, a4);
  if (a3)
  {
    *a3 = v6;
    a3[1] = v7;
  }
  double v8 = -v7;
  if (v7 != 0.0 || v6 != 0.0) {
    double v8 = v8 / sqrt(v7 * v7 + v6 * v6);
  }
  return *(double *)(a1 + 8) * v8;
}

uint64_t CG::offset::path_offset_round_cube_offset(CG::offset *this, float64x2_t *a2, int a3)
{
  double v5 = a2[3].f64[0];
  double v6 = a2[3].f64[1];
  double v7 = a2->f64[0];
  double v8 = a2->f64[1];
  if ((v5 - a2->f64[0]) * (v5 - a2->f64[0]) + (v6 - v8) * (v6 - v8) <= 0.00000001)
  {
    v39.n128_f64[0] = CG::offset::offset_normal((uint64_t)this, (CG::Cubic *)a2, 0, 1.0) + v5;
    unint64_t v41 = *(uint64_t (**)(__n128))(**((void **)this + 4) + 24);
    v39.n128_f64[1] = v40 + v6;
    return v41(v39);
  }
  else
  {
    long long v67 = 0uLL;
    double v10 = CG::offset::offset_normal((uint64_t)this, (CG::Cubic *)a2, (double *)&v67, 0.0) + v7;
    double v12 = v11 + v8;
    *(double *)&v66[0].v = v10;
    *(double *)&v66[2].v = v11 + v8;
    long long v65 = 0uLL;
    double v13 = a2[3].f64[0];
    double v14 = a2[3].f64[1];
    double v15 = CG::offset::offset_normal((uint64_t)this, (CG::Cubic *)a2, (double *)&v65, 1.0) + v13;
    double v17 = v16 + v14;
    *(double *)&v64[0].v = v15;
    *(double *)&v64[2].v = v16 + v14;
    long long v63 = 0uLL;
    double v18 = CG::Cubic::evaluate(a2, 0.5);
    double v20 = v19;
    double v21 = CG::offset::offset_normal((uint64_t)this, (CG::Cubic *)a2, (double *)&v63, 0.5) + v18;
    double v23 = v22 + v20;
    v62.f64[0] = v21 + -(v10 + v15 - v21 * 2.0) * 0.166666667;
    v62.f64[1] = v22 + v20 + -(v12 + v17 - (v22 + v20) * 2.0) * 0.166666667;
    float64x2_t v42 = *(float64x2_t *)&v66[0].v;
    long long v43 = v67;
    float64x2_t v47 = v62;
    long long v48 = v63;
    CG::intersection(v42.f64, v47.f64, (uint64_t)v60);
    if (v60[0]) {
      unint64_t v24 = (float64x2_t *)&v61;
    }
    else {
      unint64_t v24 = &v62;
    }
    *(float64x2_t *)&v59[0].v = *v24;
    float64x2_t v42 = *(float64x2_t *)&v64[0].v;
    long long v43 = v65;
    float64x2_t v47 = v62;
    long long v48 = v63;
    CG::intersection(v42.f64, v47.f64, (uint64_t)v57);
    if (v57[0]) {
      char v25 = (float64x2_t *)&v58;
    }
    else {
      char v25 = &v62;
    }
    *(float64x2_t *)&v56[0].v = *v25;
    BOOL v26 = __OFSUB__(a3, 1);
    int v27 = a3 - 1;
    if (v27 < 0 != v26)
    {
      return (*(uint64_t (**)(void, __n128, __n128, __n128))(**((void **)this + 4) + 40))(*((void *)this + 4), *(__n128 *)&v59[0].v, *(__n128 *)&v56[0].v, *(__n128 *)&v64[0].v);
    }
    else
    {
      CG::Cubic::Cubic((CG::Cubic *)&v47, v66, v59, v56, v64);
      uint64_t v28 = 0;
      while (1)
      {
        double v29 = *(double *)&CG::offset::path_offset_round_cube_offset(CG::Cubic const&,int)::samples[v28];
        double v30 = v23;
        double v31 = v21;
        if (v28 * 8)
        {
          double v32 = CG::Cubic::evaluate(a2, *(double *)&CG::offset::path_offset_round_cube_offset(CG::Cubic const&,int)::samples[v28]);
          double v34 = v33;
          double v31 = CG::offset::offset_normal((uint64_t)this, (CG::Cubic *)a2, 0, v29) + v32;
          double v30 = v35 + v34;
        }
        *(double *)&v45[0].v = v31;
        double v46 = v30;
        BOOL v36 = (*(void *)&v31 & 0x7FFFFFFFFFFFFFFFuLL) < 0x7FF0000000000000
           && (*(void *)&v30 & 0x7FFFFFFFFFFFFFFFuLL) < 0x7FF0000000000000;
        BOOL v37 = v36;
        if ((*(void *)&v47.f64[0] & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL
          && (*(void *)&v47.f64[1] & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL
          && ((unint64_t)v48 & 0x7FFFFFFFFFFFFFFFLL) <= 0x7FEFFFFFFFFFFFFFLL
          && (*((void *)&v48 + 1) & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL
          && (v49 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL
          && (v50 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL
          && (v51 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL
          && (v52 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL
          && (v53 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL
          && (v54 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL
          && v37
          && (v55 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL
          && (CG::Cubic::is_near(&v47, v45, v29, *((double *)this + 3)) & 1) == 0)
        {
          break;
        }
        if (++v28 == 5) {
          return (*(uint64_t (**)(void, __n128, __n128, __n128))(**((void **)this + 4) + 40))(*((void *)this + 4), *(__n128 *)&v59[0].v, *(__n128 *)&v56[0].v, *(__n128 *)&v64[0].v);
        }
      }
      CG::Cubic::split(a2, 0.5, &v42);
      CG::offset::path_offset_round_cube_offset(this, (const CG::Cubic *)&v42, v27);
      return CG::offset::path_offset_round_cube_offset(this, (const CG::Cubic *)&v44, v27);
    }
  }
}

uint64_t CG::offset::path_offset_round_cube_chord(CG::offset *this, const CG::Cubic *a2)
{
  double v3 = *((double *)a2 + 6);
  double v4 = *((double *)a2 + 7);
  v5.n128_f64[0] = CG::offset::offset_normal((uint64_t)this, a2, 0, 1.0) + v3;
  double v7 = *(uint64_t (**)(__n128))(**((void **)this + 4) + 24);
  v5.n128_f64[1] = v6 + v4;
  return v7(v5);
}

void CG::offset::path_offset_round_cube(CG::offset *this, float64x2_t *a2)
{
  double v4 = a2[1].f64[0];
  double v5 = a2[1].f64[1];
  double v7 = a2[2].f64[0];
  double v6 = a2[2].f64[1];
  double v8 = v4 - a2->f64[0];
  double v9 = v5 - a2->f64[1];
  double v10 = v7 - v4;
  double v11 = v6 - v5;
  double v12 = a2[3].f64[0] - v7;
  if (v10 * v8 + (v6 - v5) * v9 >= 0.0 && v12 * v10 + (a2[3].f64[1] - v6) * v11 >= 0.0)
  {
    CG::offset::path_offset_round_cube_offset(this, a2, 4);
  }
  else if (v8 * v8 + v9 * v9 <= 0.00000001 {
         && v10 * v10 + v11 * v11 <= 0.00000001
  }
         && v12 * v12 + (a2[3].f64[1] - v6) * (a2[3].f64[1] - v6) <= 0.00000001)
  {
    CG::offset::path_offset_round_cube_chord(this, (const CG::Cubic *)a2);
  }
  else
  {
    CG::Cubic::split(a2, 0.5, &v13);
    if (a2->f64[0] != v13.f64[0]
      || a2->f64[1] != v13.f64[1]
      || a2[1].f64[0] != v14
      || a2[1].f64[1] != v15
      || a2[2].f64[0] != v16
      || a2[2].f64[1] != v17
      || a2[3].f64[0] != v18
      || a2[3].f64[1] != v19)
    {
      CG::offset::path_offset_round_cube(this, (const CG::Cubic *)&v13);
      if (a2->f64[0] != v20[0]
        || a2->f64[1] != v20[1]
        || a2[1].f64[0] != v20[2]
        || a2[1].f64[1] != v20[3]
        || a2[2].f64[0] != v20[4]
        || a2[2].f64[1] != v20[5]
        || a2[3].f64[0] != v20[6]
        || a2[3].f64[1] != v20[7])
      {
        CG::offset::path_offset_round_cube(this, (const CG::Cubic *)v20);
      }
    }
  }
}

uint64_t RB::DisplayList::Layer::append_layer_items(uint64_t this, RB::DisplayList::Layer *a2)
{
  if (*(void *)a2)
  {
    uint64_t v3 = this;
    uint64_t v4 = *(void *)(this + 8);
    if (v4) {
      double v5 = (void *)(v4 + 8);
    }
    else {
      double v5 = (void *)this;
    }
    *double v5 = *(void *)a2;
    *(void *)(this + 8) = *((void *)a2 + 1);
    *(void *)a2 = 0;
    *((void *)a2 + 1) = 0;
    *(_DWORD *)(this + 60) |= *((_DWORD *)a2 + 15) & 0x1190;
    *((_DWORD *)a2 + 15) &= 0xFFFFEE6F;
    this = RB::max_color_depth(*(unsigned __int8 *)(this + 65), *((unsigned __int8 *)a2 + 65));
    *(unsigned char *)(v3 + 65) = this;
    *((unsigned char *)a2 + 65) = 0;
  }
  return this;
}

uint64_t RB::DisplayList::Layer::append_filter(uint64_t result, uint64_t a2)
{
  uint64_t v3 = 0;
  uint64_t v4 = (void *)(result + 16);
  do
  {
    uint64_t v5 = v3;
    double v6 = v4;
    uint64_t v3 = *v4;
    uint64_t v4 = (void *)(*v4 + 8);
  }
  while (v3);
  if (v5
    && (uint64_t v7 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 40))(a2),
        __n128 result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v5 + 32))(v5, v7, v8),
        result))
  {
    double v9 = **(uint64_t (***)(uint64_t))a2;
    return v9(a2);
  }
  else
  {
    *double v6 = a2;
    *(void *)(a2 + 8) = 0;
  }
  return result;
}

void RB::DisplayList::Layer::compute_bounds(RB::DisplayList::Layer *this)
{
  if (!*((unsigned char *)this + 66))
  {
    *((unsigned char *)this + 66) = 1;
    *((double *)this + 4) = RB::DisplayList::Layer::compute_bounds_(this, 0);
    *((void *)this + 5) = v2;
  }
}

uint64_t RB::DisplayList::Layer::effect_needs_zero_alpha(RB::DisplayList::Layer *this)
{
  if (*((unsigned char *)this + 64) == 2) {
    return (*(uint64_t (**)(void))(**((void **)this + 3) + 96))();
  }
  else {
    return 0;
  }
}

void RB::DisplayList::Layer::min_scale(RB::DisplayList::Layer *this)
{
  if (*((float *)this + 13) < 0.0)
  {
    uint64_t v2 = *(void **)this;
    if (*(void *)this)
    {
      float v3 = 0.0;
      do
      {
        float v4 = (*(float (**)(void *))(*v2 + 152))(v2);
        if (v3 < v4) {
          float v3 = v4;
        }
        for (unsigned int i = (void *)v2[3]; i; unsigned int i = (void *)*i)
        {
          float v6 = (*(float (**)(unint64_t))(*(void *)(i[1] & 0xFFFFFFFFFFFFFFFELL) + 40))(i[1] & 0xFFFFFFFFFFFFFFFELL);
          if (v3 < v6) {
            float v3 = v6;
          }
        }
        uint64_t v2 = (void *)v2[1];
      }
      while (v2);
    }
    else
    {
      float v3 = 0.0;
    }
    float v7 = 0.25;
    if (v3 >= 0.25) {
      float v7 = v3;
    }
    if ((*((_DWORD *)this + 15) & 1) == 0) {
      float v7 = v3;
    }
    *((float *)this + 13) = v7;
  }
}

uint64_t RB::DisplayList::Layer::move_filters(uint64_t this, RB::DisplayList::Layer *a2)
{
  uint64_t v2 = *((void *)a2 + 2);
  if (v2)
  {
    float v3 = (void *)(this + 16);
    do
    {
      float v4 = v3;
      uint64_t v5 = *v3;
      float v3 = (void *)(*v3 + 8);
    }
    while (v5);
    *float v4 = v2;
    *((void *)a2 + 2) = 0;
  }
  return this;
}

uint64_t RB::DisplayList::Layer::max_depth(RB::DisplayList::Layer *this)
{
  uint64_t v1 = *((unsigned __int8 *)this + 65);
  uint64_t v2 = (void *)*((void *)this + 2);
  if (v2)
  {
    unsigned __int8 v3 = *((unsigned char *)this + 65);
    do
    {
      int v4 = (*(uint64_t (**)(void *, void))(*v2 + 72))(v2, v3);
      unsigned __int8 v3 = v4;
      uint64_t v1 = RB::max_color_depth(v1, v4);
      uint64_t v2 = (void *)v2[1];
    }
    while (v2);
  }
  return v1;
}

uint64_t RB::DisplayList::Layer::discard_color(uint64_t this)
{
  if ((*(unsigned char *)(this + 60) & 8) == 0)
  {
    uint64_t v1 = this;
    if (*(unsigned char *)(this + 64) != 2
      || (this = (*(uint64_t (**)(void))(**(void **)(this + 24) + 48))(*(void *)(this + 24)),
          this))
    {
      uint64_t v2 = *(void **)(v1 + 16);
      if (!v2) {
        goto LABEL_14;
      }
      unsigned __int8 v3 = 0;
      do
      {
        int v4 = v3;
        unsigned __int8 v3 = v2;
        uint64_t v2 = (void *)v2[1];
        v3[1] = v4;
      }
      while (v2);
      *(void *)(v1 + --*(void *)(this + 16) = 0;
      LOBYTE(v5) = 1;
      do
      {
        char v6 = v5;
        float v7 = (void *)v3[1];
        char v9 = 0;
        int v5 = 0;
        if ((v6 & 1) != 0
          && (this = (*(uint64_t (**)(void *, char *))(*v3 + 80))(v3, &v9), int v5 = this, v9))
        {
          this = (*(uint64_t (**)(void *))*v3)(v3);
        }
        else
        {
          v3[1] = *(void *)(v1 + 16);
          *(void *)(v1 + --*(void *)(this + 16) = v3;
        }
        unsigned __int8 v3 = v7;
      }
      while (v7);
      if (v5)
      {
LABEL_14:
        *(_DWORD *)(v1 + 60) |= 8u;
        for (uint64_t i = *(void *)v1; i; uint64_t i = *(void *)(i + 8))
        {
          if ((*(_WORD *)(i + 46) & 0x200) != 0) {
            this = RB::DisplayList::Layer::discard_color(*(RB::DisplayList::Layer **)(i + 48));
          }
        }
      }
    }
  }
  return this;
}

void RB::DisplayList::Layer::print(RB::DisplayList::Layer *this, std::string *a2)
{
  RB::SexpString::push(a2, "layer");
  int v4 = *((_DWORD *)this + 15);
  if (v4)
  {
    RB::SexpString::print(a2, 0, "needs-bg");
    int v4 = *((_DWORD *)this + 15);
  }
  if ((v4 & 0x2000) != 0) {
    RB::SexpString::print(a2, 0, "needs-bg-below");
  }
  if (*((unsigned char *)this + 67)) {
    RB::SexpString::printf(a2, 0, "(bg-depth %d)", *((unsigned __int8 *)this + 67));
  }
  int v5 = *((_DWORD *)this + 15);
  if ((v5 & 2) != 0)
  {
    RB::SexpString::print(a2, 0, "linear");
    int v5 = *((_DWORD *)this + 15);
    if ((v5 & 4) == 0)
    {
LABEL_9:
      if ((v5 & 8) == 0) {
        goto LABEL_10;
      }
      goto LABEL_22;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_9;
  }
  RB::SexpString::print(a2, 0, "non-linear");
  int v5 = *((_DWORD *)this + 15);
  if ((v5 & 8) == 0)
  {
LABEL_10:
    if ((v5 & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  RB::SexpString::print(a2, 0, "alpha-only");
  int v5 = *((_DWORD *)this + 15);
  if ((v5 & 0x40) == 0)
  {
LABEL_11:
    if ((v5 & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_24;
  }
LABEL_23:
  RB::SexpString::print(a2, 0, "dither");
  int v5 = *((_DWORD *)this + 15);
  if ((v5 & 0x200) == 0)
  {
LABEL_12:
    if ((v5 & 0x100) == 0) {
      goto LABEL_13;
    }
    goto LABEL_25;
  }
LABEL_24:
  RB::SexpString::print(a2, 0, "filter-scale");
  int v5 = *((_DWORD *)this + 15);
  if ((v5 & 0x100) == 0)
  {
LABEL_13:
    if ((v5 & 0x10) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_25:
  RB::SexpString::print(a2, 0, "non-normal-blend");
  if ((*((_DWORD *)this + 15) & 0x10) != 0) {
LABEL_14:
  }
    RB::SexpString::print(a2, 0, "read-as-backdrop");
LABEL_15:
  float v6 = *((float *)this + 12);
  if (v6 != 0.0) {
    RB::SexpString::printf(a2, 0, "(scale %g)", v6);
  }
  int v7 = *((unsigned __int8 *)this + 64);
  if (v7 == 2)
  {
    (*(void (**)(void, std::string *))(**((void **)this + 3) + 144))(*((void *)this + 3), a2);
  }
  else if (v7 == 1)
  {
    uint64_t v8 = (float *)*((void *)this + 3);
    RB::SexpString::printf(a2, 1, "(projection %g %g %g; %g %g %g; %g %g %g)",
      *v8,
      v8[1],
      v8[2],
      v8[3],
      v8[4],
      v8[5],
      v8[6],
      v8[7],
      v8[8]);
  }
  if (*((void *)this + 2))
  {
    RB::SexpString::push(a2, "filters");
    for (uint64_t i = (void *)*((void *)this + 2); i; uint64_t i = (void *)i[1])
    {
      a2[1].__r_.__value_.__s.__data_[16] = 1;
      (*(void (**)(void *, std::string *))(*i + 120))(i, a2);
    }
    RB::SexpString::pop(a2);
  }
  if (*(void *)this)
  {
    RB::SexpString::push(a2, "contents");
    for (j = *(void **)this; j; j = (void *)j[1])
      (*(void (**)(void *, std::string *))(*j + 256))(j, a2);
    RB::SexpString::pop(a2);
  }
  RB::SexpString::pop(a2);
}

uint64_t std::shared_ptr<RB::XML::Value::Base>::shared_ptr[abi:nn180100]<RB::XML::Value::Font,void>(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 8))();
}

atomic_uint *RB::ObjcEncoderDelegate::font_set(atomic_uint *result)
{
  if (atomic_fetch_add_explicit(result + 2, 0xFFFFFFFF, memory_order_release) == 1)
  {
    __dmb(9u);
    return (atomic_uint *)(*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

void RB::DisplayList::Clip::mix(RB::DisplayList::Clip *this, const RB::DisplayList::Interpolator::State *a2, const RB::DisplayList::Clip *a3, const RB::DisplayList::CachedTransform *a4)
{
}

uint64_t render_image_async(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 8))(a1);
}

void init_background_notifications(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_2140F5000, log, OS_LOG_TYPE_ERROR, "RBDevice: unable to determine bg state", v1, 2u);
}

uint64_t RB::Symbol::Glyph::Layer::copy_path(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 8))(a1);
}

void RB::DisplayList::GenericItem1<RB::Coverage::Primitive,RB::Fill::Custom>::append_color_matrix()
{
}

void RB::DisplayList::GenericItem1<RB::Coverage::Stroke<RB::Coverage::StrokeablePath>,RB::Fill::Custom>::append_color_matrix()
{
}

void RB::DisplayList::GenericItem1<RB::Coverage::Path,RB::Fill::Custom>::append_color_matrix()
{
}

void RB::DisplayList::GenericItem1<RB::Coverage::Glyphs,RB::Fill::Custom>::append_color_matrix()
{
}

void RB::DisplayList::GenericItem1<RB::Coverage::Stroke<RBStrokeRef>,RB::Fill::Custom>::append_color_matrix()
{
}

uint64_t RBDrawingStateAddBlurFilter_cold_1()
{
  OUTLINED_FUNCTION_1();
  return (*v0)();
}

uint64_t RB::DisplayList::FilterStyle<RB::Filter::Custom>::FilterStyle<RB::Filter::Custom>(uint64_t *a1, void *a2)
{
  if (a2) {
    free(a2);
  }
  uint64_t result = *a1;
  if (*a1)
  {
    uint64_t result = OUTLINED_FUNCTION_0(result);
    if (v4)
    {
      __dmb(9u);
      OUTLINED_FUNCTION_1();
      float v6 = *(uint64_t (**)(void))(v5 + 8);
      return v6();
    }
  }
  return result;
}

uint64_t RB::ObjcEncoderDelegate::encode_message_f<NSData * RB::ObjcEncoderDelegate::encode_message<RB::DisplayList::Contents>(RB::DisplayList::Contents const&)::{lambda(RB::DisplayList::Contents&)#1},NSData * RB::ObjcEncoderDelegate::encode_message<RB::DisplayList::Contents>(RB::DisplayList::Contents const&)::{lambda(RB::DisplayList::Contents&)#2}>(uint64_t a1)
{
  uint64_t result = OUTLINED_FUNCTION_0(a1);
  if (v2)
  {
    __dmb(9u);
    OUTLINED_FUNCTION_1();
    return (*(uint64_t (**)(void))(v3 + 8))();
  }
  return result;
}

uint64_t RB::CustomShader::Library::intern_function(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 8))();
}

uint64_t RB::ImageProvider::add_to_pending(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 8))();
}

atomic_uint *RB::ImageProvider::render_device(atomic_uint *result)
{
  if (atomic_fetch_add_explicit(result + 2, 0xFFFFFFFF, memory_order_release) == 1)
  {
    __dmb(9u);
    return (atomic_uint *)(*(uint64_t (**)(atomic_uint *))(*(void *)result + 8))(result);
  }
  return result;
}

uint64_t __copy_helper_block_e8_48c58_ZTSN2RB8objc_ptrIPU21objcproto10MTLTexture11objc_objectEE56c66_ZTSN2RB8objc_ptrIPU29objcproto18RBDrawableDelegate11objc_objectEE64c30_ZTSN2RB8objc_ptrIP8RBDeviceEE72c40_ZTSN2RB14refcounted_ptrINS_8DrawableEEE120c55_ZTSN2RB8objc_ptrIPU18objcproto8MTLEvent11objc_objectEE_cold_1(uint64_t a1)
{
  uint64_t result = OUTLINED_FUNCTION_0(a1);
  if (v2)
  {
    OUTLINED_FUNCTION_1_0();
    return (*(uint64_t (**)(void))(v3 + 8))();
  }
  return result;
}

void RB::DisplayList::GenericEffect<RB::CustomEffect>::append_color_matrix(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (*(unsigned char *)(a1 + 256))
  {
    uint64_t v5 = *(size_t **)(a5 + 8);
    unint64_t v6 = RB::Heap::emplace<RB::DisplayList::GenericEffect<RB::CustomEffect>,RB::DisplayList::GenericEffect<RB::CustomEffect> const&,RB::DisplayList::Contents &>(v5 + 2, a1, (RB::DisplayList::Contents *)v5);
    *(unsigned char *)(v6 + 256) = 0;
    *(void *)(v6 + 8) = v5[39];
    v5[39] = v6;
  }
  abort();
}

uint64_t RB::DisplayList::LayerFilter::decode(uint64_t (***a1)(void))
{
  return (**a1)(a1);
}

atomic_uint *RB::DisplayList::GenericFilter<RB::Filter::Custom>::GenericFilter(atomic_uint **a1, void *a2)
{
  if (a2) {
    free(a2);
  }
  uint64_t result = *a1;
  if (*a1 && atomic_fetch_add_explicit(result + 2, 0xFFFFFFFF, memory_order_release) == 1)
  {
    __dmb(9u);
    char v4 = *(uint64_t (**)(void))(*(void *)result + 8);
    return (atomic_uint *)v4();
  }
  return result;
}

_DWORD *RB::RenderTask::schedule_many(_DWORD *result, uint64_t a2, int a3, uint64_t a4)
{
  int v7 = result[2] - 1;
  result[2] = v7;
  if (!v7) {
    uint64_t result = (_DWORD *)(*(uint64_t (**)(_DWORD *))(*(void *)result + 8))(result);
  }
  *(void *)a4 = a2;
  *(_DWORD *)(a4 + 8) = a3;
  return result;
}

void RB::DisplayList::Item::append_color_matrix()
{
}

void RB::DisplayList::Item::mix(RB::DisplayList::Item *this, const RB::DisplayList::Interpolator::State *a2, const RB::DisplayList::Item *a3, const RB::DisplayList::CachedTransform *a4)
{
}

_DWORD *RB::TextureCache::prepare_from_cache(_DWORD *result, uint64_t a2, int a3, uint64_t a4)
{
  int v7 = result[2] - 1;
  result[2] = v7;
  if (!v7) {
    uint64_t result = (_DWORD *)(*(uint64_t (**)(_DWORD *))(*(void *)result + 8))(result);
  }
  *(void *)a4 = a2;
  *(_DWORD *)(a4 + 8) = a3;
  return result;
}

uint64_t RB::TextureCache::prepare(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 8))();
}

atomic_uint *RB::DisplayList::Builder::Builder(atomic_uint **a1)
{
  uint64_t result = *a1;
  if (result)
  {
    if (atomic_fetch_add_explicit(result + 2, 0xFFFFFFFF, memory_order_release) == 1)
    {
      __dmb(9u);
      return (atomic_uint *)(*(uint64_t (**)(void))(*(void *)result + 8))();
    }
  }
  return result;
}

atomic_uint *RB::DisplayList::Builder::draw_layer(atomic_uint *result)
{
  if (atomic_fetch_add_explicit(result + 2, 0xFFFFFFFF, memory_order_release) == 1)
  {
    __dmb(9u);
    return (atomic_uint *)(*(uint64_t (**)(atomic_uint *))(*(void *)result + 8))(result);
  }
  return result;
}

atomic_uint *RB::DisplayList::State::State(atomic_uint *result)
{
  if (atomic_fetch_add_explicit(result + 2, 0xFFFFFFFF, memory_order_release) == 1)
  {
    __dmb(9u);
    return (atomic_uint *)(*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

_DWORD *RB::Device::~Device(uint64_t a1, uint64_t *a2)
{
  std::unique_ptr<RB::GlyphPathCache>::reset[abi:nn180100]((uint64_t *)(a1 + 960), 0);
  RB::UntypedTable::~UntypedTable((RB::UntypedTable *)(a1 + 880));
  RB::UntypedTable::~UntypedTable((RB::UntypedTable *)(a1 + 800));
  for (uint64_t i = 0; i != -192; i -= 8)

  for (uint64_t j = 0; j != -48; j -= 8)
  std::__hash_table<RB::FormattedRenderState,std::hash<RB::FormattedRenderState>,std::equal_to<RB::FormattedRenderState>,std::allocator<RB::FormattedRenderState>>::~__hash_table(a1 + 512);
  RB::UntypedTable::~UntypedTable((RB::UntypedTable *)(a1 + 432));
  std::__list_imp<RB::refcounted_ptr<RB::Texture>>::clear((uint64_t *)(a1 + 400));
  std::__list_imp<RB::refcounted_ptr<RB::Texture>>::clear(a2);
  std::__list_imp<RB::refcounted_ptr<RB::Texture>>::clear((uint64_t *)(a1 + 344));
  RB::Heap::~Heap((RB::Heap *)(a1 + 304));
  RB::vector<RB::Device::FrameContinuation,2ul,unsigned long>::~vector((char *)(a1 + 200));
  unint64_t v6 = *(_DWORD **)(a1 + 176);
  if (v6)
  {
    int v7 = v6[2] - 1;
    v6[2] = v7;
    if (!v7) {
      (*(void (**)(_DWORD *))(*(void *)v6 + 8))(v6);
    }
  }
  uint64_t v8 = *(_DWORD **)(a1 + 168);
  if (v8)
  {
    int v9 = v8[2] - 1;
    void v8[2] = v9;
    if (!v9) {
      (*(void (**)(_DWORD *))(*(void *)v8 + 8))(v8);
    }
  }
  uint64_t result = *(_DWORD **)(a1 + 160);
  if (result)
  {
    int v11 = result[2] - 1;
    result[2] = v11;
    if (!v11) {
      return (_DWORD *)(*(uint64_t (**)(_DWORD *))(*(void *)result + 8))(result);
    }
  }
  return result;
}

void RB::Device::alloc_shared_buffer(uint64_t *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_fault_impl(&dword_2140F5000, a2, OS_LOG_TYPE_FAULT, "unable to create buffer: %d bytes", (uint8_t *)v3, 8u);
}

_DWORD *RB::Device::alloc_shared_texture(_DWORD *result)
{
  int v1 = result[2] - 1;
  result[2] = v1;
  if (!v1) {
    return (_DWORD *)(*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

void RB::Device::noise_texture(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_fault_impl(&dword_2140F5000, log, OS_LOG_TYPE_FAULT, "unable to create noise texture", v1, 2u);
}

void RB::Device::RenderPipelineEntry::function_table(uint64_t a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_2140F5000, log, OS_LOG_TYPE_ERROR, "failed to add binary function: %@", buf, 0xCu);
}

void RB::Device::command_buffer_error(void *a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v4 = 134218242;
  uint64_t v5 = [a1 code];
  __int16 v6 = 2112;
  int v7 = a1;
  _os_log_error_impl(&dword_2140F5000, a2, OS_LOG_TYPE_ERROR, "command buffer error: %ld, %@", (uint8_t *)&v4, 0x16u);
}

atomic_uint *__copy_helper_block_e8_32c40_ZTSN2RB14refcounted_ptrINS_8DrawableEEE40c38_ZTSN2RB14refcounted_ptrINS_6DeviceEEE48c59_ZTSN2RB8objc_ptrIPU22objcproto11RBEncodable11objc_objectEE_cold_1(atomic_uint **a1)
{
  uint64_t result = *a1;
  if (result)
  {
    if (atomic_fetch_add_explicit(result + 2, 0xFFFFFFFF, memory_order_release) == 1)
    {
      __dmb(9u);
      return (atomic_uint *)(*(uint64_t (**)(void))(*(void *)result + 8))();
    }
  }
  return result;
}

atomic_uint *__copy_helper_block_e8_32c40_ZTSN2RB14refcounted_ptrINS_8DrawableEEE40c38_ZTSN2RB14refcounted_ptrINS_6DeviceEEE48c59_ZTSN2RB8objc_ptrIPU22objcproto11RBEncodable11objc_objectEE_cold_2(atomic_uint *result)
{
  if (atomic_fetch_add_explicit(result + 2, 0xFFFFFFFF, memory_order_release) == 1)
  {
    __dmb(9u);
    return (atomic_uint *)(*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

_DWORD *RB::RenderFrame::alloc_buffer_region(_DWORD *result)
{
  int v1 = result[2] - 1;
  result[2] = v1;
  if (!v1) {
    return (_DWORD *)(*(uint64_t (**)(_DWORD *))(*(void *)result + 8))(result);
  }
  return result;
}

_DWORD *RB::XML::DisplayList::draw_interpolated(_DWORD *result, uint64_t a2, int a3, uint64_t a4)
{
  int v7 = result[2] - 1;
  result[2] = v7;
  if (!v7) {
    uint64_t result = (_DWORD *)(*(uint64_t (**)(_DWORD *))(*(void *)result + 8))(result);
  }
  *(void *)a4 = a2;
  *(_DWORD *)(a4 + 8) = a3;
  return result;
}

void RB::DisplayList::Style::mix(RB::DisplayList::Style *this, const RB::DisplayList::Interpolator::State *a2, const RB::DisplayList::Style *a3, const RB::DisplayList::CachedTransform *a4)
{
}

atomic_uint *RB::DisplayList::Style::decode(atomic_uint **a1, int a2, void *a3)
{
  if (a3) {
    free(a3);
  }
  uint64_t result = *a1;
  if (*a1)
  {
    if (atomic_fetch_add_explicit(result + 2, 0xFFFFFFFF, memory_order_release) == 1)
    {
      __dmb(9u);
      return (atomic_uint *)(*(uint64_t (**)(atomic_uint *))(*(void *)result + 8))(result);
    }
  }
  return result;
}

atomic_uint *RBSymbolUpdateLayerPath_cold_1(atomic_uint *result, uint64_t a2, int a3, uint64_t a4)
{
  if (atomic_fetch_add_explicit(result + 2, 0xFFFFFFFF, memory_order_release) == 1)
  {
    __dmb(9u);
    uint64_t result = (atomic_uint *)(*(uint64_t (**)(atomic_uint *))(*(void *)result + 8))(result);
  }
  *(void *)a4 = a2;
  *(_DWORD *)(a4 + 8) = a3;
  return result;
}

uint64_t RB::Filter::GaussianBlur::GaussianBlur(uint64_t (***a1)(void))
{
  return (**a1)(a1);
}

void RB::DisplayList::SpillItem::copy(RB::DisplayList::SpillItem *this, RB::DisplayList::Builder *a2)
{
}

void RB::DisplayList::SpillItem::apply_transform(RB::DisplayList::SpillItem *this, const RB::DisplayList::CachedTransform *a2)
{
}

void RB::DisplayList::SpillItem::render(RB::DisplayList::SpillItem *this, RB::CGContext *a2)
{
}

void RB::DisplayList::SpillItem::matches(RB::DisplayList::SpillItem *this, const RB::DisplayList::Predicate *a2)
{
}

void RB::DisplayList::SpillItem::prepare_encode()
{
}

void RB::DisplayList::SpillItem::encode()
{
}

void RB::DisplayList::RootTexture::render(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_2140F5000, log, OS_LOG_TYPE_ERROR, "no drawable", buf, 2u);
}

uint64_t RB::DisplayList::RootTexture::render(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 8))(a1);
}

void RB::DisplayList::render_many()
{
  OUTLINED_FUNCTION_0_0();
  _DWORD v3[2] = v4;
  if (v5) {
    (*(void (**)(_DWORD *))(*(void *)v3 + 8))(v3);
  }
  *(void *)uint64_t v0 = v2;
  *(_DWORD *)(v0 + 8) = v1;
}

atomic_uint *RB::DisplayList::render(atomic_uint *result, uint64_t a2, int a3, uint64_t a4)
{
  if (atomic_fetch_add_explicit(result + 2, 0xFFFFFFFF, memory_order_release) == 1)
  {
    __dmb(9u);
    uint64_t result = (atomic_uint *)(*(uint64_t (**)(atomic_uint *))(*(void *)result + 8))(result);
  }
  *(void *)a4 = a2;
  *(_DWORD *)(a4 + 8) = a3;
  return result;
}

_DWORD *RB::DisplayList::LayerTask::append_task(_DWORD *result)
{
  int v1 = result[2] - 1;
  result[2] = v1;
  if (!v1) {
    return (_DWORD *)(*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

void RB::non_fatal_precondition_failure(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 136315138;
  uint64_t v4 = v2;
  _os_log_fault_impl(&dword_2140F5000, a2, OS_LOG_TYPE_FAULT, "precondition failure: %s", (uint8_t *)&v3, 0xCu);
}

uint64_t RB::SharedSurfaceGroup::remove_subsurface(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = OUTLINED_FUNCTION_0(a1);
  if (v8)
  {
    OUTLINED_FUNCTION_1_0();
    uint64_t result = (*(uint64_t (**)(void))(v9 + 8))();
  }
  *(void *)a4 = a2;
  *(_DWORD *)(a4 + 8) = a3;
  return result;
}

uint64_t RB::SharedSurfaceGroup::schedule_updates(uint64_t result, atomic_uint *a2)
{
  if ((result & 1) == 0 && atomic_fetch_add_explicit(a2 + 2, 0xFFFFFFFF, memory_order_release) == 1)
  {
    __dmb(9u);
    return (*(uint64_t (**)(atomic_uint *))(*(void *)a2 + 8))(a2);
  }
  return result;
}

uint64_t RB::SharedSurfaceGroup::schedule_updates(uint64_t a1)
{
  uint64_t result = OUTLINED_FUNCTION_0(a1);
  if (v2)
  {
    OUTLINED_FUNCTION_1_0();
    return (*(uint64_t (**)(void))(v3 + 8))();
  }
  return result;
}

uint64_t RB::SharedSurfaceGroup::add_subsurface()
{
  OUTLINED_FUNCTION_1_0();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t RB::SharedSurfaceGroup::relocate_surface(RB::SharedSurface *,BOOL)::$_0::operator()(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = OUTLINED_FUNCTION_0(a1);
  if (v8)
  {
    OUTLINED_FUNCTION_1_0();
    uint64_t result = (*(uint64_t (**)(void))(v9 + 8))();
  }
  *(void *)a4 = a2;
  *(_DWORD *)(a4 + 8) = a3;
  return result;
}

uint64_t std::__introsort<std::_ClassicAlgPolicy,RB::SharedSurface::update_removes(RB::vector<RB::SharedSurface::Remove,0ul,unsigned int> &)::$_0 &,RB::SharedSurface::Remove*,false>(uint64_t a1)
{
  uint64_t result = OUTLINED_FUNCTION_0(a1);
  if (v2)
  {
    OUTLINED_FUNCTION_1_0();
    return (*(uint64_t (**)(void))(v3 + 8))();
  }
  return result;
}

uint64_t RB::SharedSurfaceGroup::relocate_surface(RB::SharedSurface *,BOOL)::$_1::__invoke()
{
  OUTLINED_FUNCTION_1_0();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

_DWORD *RB::CustomEffect::add_tasks(_DWORD *result)
{
  int v1 = result[2] - 1;
  result[2] = v1;
  if (!v1) {
    return (_DWORD *)(*(uint64_t (**)(_DWORD *))(*(void *)result + 8))(result);
  }
  return result;
}

uint64_t RB::SurfacePool::alloc(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 8))(a1);
}

void RB::SurfacePool::dealloc(dispatch_queue_t *context)
{
}

atomic_uint *RB::SurfacePool::dealloc(atomic_uint *result, uint64_t a2, int a3, uint64_t a4)
{
  if (atomic_fetch_add_explicit(result + 2, 0xFFFFFFFF, memory_order_release) == 1)
  {
    __dmb(9u);
    uint64_t result = (atomic_uint *)(*(uint64_t (**)(atomic_uint *))(*(void *)result + 8))(result);
  }
  *(void *)a4 = a2;
  *(_DWORD *)(a4 + 8) = a3;
  return result;
}

void RB::Surface::Surface(id *a1, const void **a2)
{
  uint64_t v3 = *a2;
  if (*a2)
  {
    CFRelease(v3);
  }
}

void RB::Surface::~Surface(uint64_t a1)
{
  char v2 = *(const void **)(a1 + 48);
  if (v2)
  {
    CFRelease(v2);
  }
}

atomic_uint *RB::Fill::MeshGradient::MeshGradient(atomic_uint *result)
{
  if (atomic_fetch_add_explicit(result + 2, 0xFFFFFFFF, memory_order_release) == 1)
  {
    __dmb(9u);
    return (atomic_uint *)(*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x270EFB790]();
  return result;
}

uint64_t CAIOSurfaceCreateDefault()
{
  return MEMORY[0x270EFB7B8]();
}

uint64_t CAImageQueueCollect()
{
  return MEMORY[0x270EFB7C0]();
}

uint64_t CAImageQueueConsumeUnconsumedInRange()
{
  return MEMORY[0x270EFB7C8]();
}

uint64_t CAImageQueueCreate()
{
  return MEMORY[0x270EFB7D0]();
}

uint64_t CAImageQueueGetLastUpdateHostTime()
{
  return MEMORY[0x270EFB7E8]();
}

uint64_t CAImageQueueGetReleasedImageInfo()
{
  return MEMORY[0x270EFB7F0]();
}

uint64_t CAImageQueueGetRotationFlags()
{
  return MEMORY[0x270EFB7F8]();
}

uint64_t CAImageQueueInsertImageWithRotation()
{
  return MEMORY[0x270EFB810]();
}

uint64_t CAImageQueueInvalidate()
{
  return MEMORY[0x270EFB818]();
}

uint64_t CAImageQueueRegisterIOSurfaceBuffer()
{
  return MEMORY[0x270EFB820]();
}

uint64_t CAImageQueueSetFlags()
{
  return MEMORY[0x270EFB828]();
}

uint64_t CAImageQueueSetSize()
{
  return MEMORY[0x270EFB830]();
}

uint64_t CAImageQueueUnregisterBuffer()
{
  return MEMORY[0x270EFB838]();
}

uint64_t CALayerGetDelegate()
{
  return MEMORY[0x270EFB848]();
}

uint64_t CALayerGetSuperlayer()
{
  return MEMORY[0x270EFB858]();
}

CATransform3D *__cdecl CATransform3DConcat_(CATransform3D *__return_ptr retstr, CATransform3D *a, CATransform3D *b)
{
  return (CATransform3D *)MEMORY[0x270EFB8F8](retstr, a, b);
}

CATransform3D *__cdecl CATransform3DMakeTranslation_(CATransform3D *__return_ptr retstr, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x270EFB958](retstr, tx, ty, tz);
}

CATransform3D *__cdecl CATransform3DRotate_(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x270EFB968](retstr, t, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DTranslate_(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x270EFB980](retstr, t, tx, ty, tz);
}

CFAllocatorRef CFAllocatorCreate(CFAllocatorRef allocator, CFAllocatorContext *context)
{
  return (CFAllocatorRef)MEMORY[0x270EE4298](allocator, context);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x270EE4440](arg);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

CFStringRef CFCopyTypeIDDescription(CFTypeID type_id)
{
  return (CFStringRef)MEMORY[0x270EE47B0](type_id);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

CFDataRef CFDataCreateCopy(CFAllocatorRef allocator, CFDataRef theData)
{
  return (CFDataRef)MEMORY[0x270EE47D0](allocator, theData);
}

CFMutableDataRef CFDataCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDataRef theData)
{
  return (CFMutableDataRef)MEMORY[0x270EE47E8](allocator, capacity, theData);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x270EE47F0](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x270EE4830](theData);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x270EE4968](theDict, key, value);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CC0](key, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B0](alloc, maxLength);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x270EE50D0](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithBytesNoCopy(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x270EE50D8](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation, contentsDeallocator);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x270EE5128](alloc, str, range.location, range.length);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x270EE5190](theString, idx);
}

double CFStringGetDoubleValue(CFStringRef str)
{
  MEMORY[0x270EE51A8](str);
  return result;
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x270EE51C8](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x270EE5228](theString, prefix);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x270EE5960](retstr, t1, t2);
}

CGAffineTransformComponents *__cdecl CGAffineTransformDecompose(CGAffineTransformComponents *__return_ptr retstr, CGAffineTransform *transform)
{
  return (CGAffineTransformComponents *)MEMORY[0x270EE5968](retstr, transform);
}

BOOL CGAffineTransformEqualToTransform(CGAffineTransform *t1, CGAffineTransform *t2)
{
  return MEMORY[0x270EE5970](t1, t2);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x270EE5980](t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeWithComponents(CGAffineTransform *__return_ptr retstr, CGAffineTransformComponents *components)
{
  return (CGAffineTransform *)MEMORY[0x270EE59B8](retstr, components);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59C8](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59D8](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x270EE59E8](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x270EE59F8](context);
}

CGImageAlphaInfo CGBitmapContextGetAlphaInfo(CGContextRef context)
{
  return MEMORY[0x270EE5A18](context);
}

CGBitmapInfo CGBitmapContextGetBitmapInfo(CGContextRef context)
{
  return MEMORY[0x270EE5A20](context);
}

size_t CGBitmapContextGetBitsPerComponent(CGContextRef context)
{
  return MEMORY[0x270EE5A28](context);
}

size_t CGBitmapContextGetBitsPerPixel(CGContextRef context)
{
  return MEMORY[0x270EE5A30](context);
}

size_t CGBitmapContextGetBytesPerRow(CGContextRef context)
{
  return MEMORY[0x270EE5A38](context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x270EE5A48](context);
}

size_t CGBitmapContextGetHeight(CGContextRef context)
{
  return MEMORY[0x270EE5A50](context);
}

size_t CGBitmapContextGetWidth(CGContextRef context)
{
  return MEMORY[0x270EE5A58](context);
}

uint64_t CGBlt_copyBytes()
{
  return MEMORY[0x270EE5A78]();
}

uint64_t CGBlt_fillBytes()
{
  return MEMORY[0x270EE5A80]();
}

uint64_t CGClipGetMask()
{
  return MEMORY[0x270EE5A88]();
}

uint64_t CGClipGetMode()
{
  return MEMORY[0x270EE5A90]();
}

uint64_t CGClipGetPath()
{
  return MEMORY[0x270EE5A98]();
}

uint64_t CGClipGetRect()
{
  return MEMORY[0x270EE5AA0]();
}

uint64_t CGClipGetShouldAntialias()
{
  return MEMORY[0x270EE5AA8]();
}

uint64_t CGClipGetStroke()
{
  return MEMORY[0x270EE5AB0]();
}

uint64_t CGClipGetTextClipping()
{
  return MEMORY[0x270EE5AB8]();
}

uint64_t CGClipGetType()
{
  return MEMORY[0x270EE5AC0]();
}

uint64_t CGClipMaskGetImage()
{
  return MEMORY[0x270EE5AC8]();
}

uint64_t CGClipMaskGetMatrix()
{
  return MEMORY[0x270EE5AD0]();
}

uint64_t CGClipMaskGetRect()
{
  return MEMORY[0x270EE5AD8]();
}

uint64_t CGClipStackGetClipAtIndex()
{
  return MEMORY[0x270EE5AE0]();
}

uint64_t CGClipStackGetCount()
{
  return MEMORY[0x270EE5AE8]();
}

uint64_t CGClipStackGetIdentifier()
{
  return MEMORY[0x270EE5AF0]();
}

uint64_t CGClipStackGetRect()
{
  return MEMORY[0x270EE5AF8]();
}

uint64_t CGClipStackIsInfinite()
{
  return MEMORY[0x270EE5B00]();
}

uint64_t CGClipStrokeGetDash()
{
  return MEMORY[0x270EE5B08]();
}

uint64_t CGClipStrokeGetLineCap()
{
  return MEMORY[0x270EE5B10]();
}

uint64_t CGClipStrokeGetLineJoin()
{
  return MEMORY[0x270EE5B18]();
}

uint64_t CGClipStrokeGetLineWidth()
{
  return MEMORY[0x270EE5B20]();
}

uint64_t CGClipStrokeGetMatrix()
{
  return MEMORY[0x270EE5B28]();
}

uint64_t CGClipStrokeGetMiterLimit()
{
  return MEMORY[0x270EE5B30]();
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x270EE5B50](space, components);
}

CGColorRef CGColorCreateSRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x270EE5B88](red, green, blue, alpha);
}

CGColorRef CGColorCreateWithPattern(CGColorSpaceRef space, CGPatternRef pattern, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x270EE5B90](space, pattern, components);
}

BOOL CGColorEqualToColor(CGColorRef color1, CGColorRef color2)
{
  return MEMORY[0x270EE5B98](color1, color2);
}

CGFloat CGColorGetAlpha(CGColorRef color)
{
  MEMORY[0x270EE5BC0](color);
  return result;
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5BC8](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x270EE5BD0](color);
}

CGColorRef CGColorGetConstantColor(CFStringRef colorName)
{
  return (CGColorRef)MEMORY[0x270EE5BD8](colorName);
}

CGPatternRef CGColorGetPattern(CGColorRef color)
{
  return (CGPatternRef)MEMORY[0x270EE5BE8](color);
}

uint64_t CGColorGetPatternBaseColor()
{
  return MEMORY[0x270EE5BF0]();
}

CFPropertyListRef CGColorSpaceCopyPropertyList(CGColorSpaceRef space)
{
  return (CFPropertyListRef)MEMORY[0x270EE5C40](space);
}

CGColorSpaceRef CGColorSpaceCreatePattern(CGColorSpaceRef baseSpace)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C90](baseSpace);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5CA8](name);
}

CGColorSpaceRef CGColorSpaceCreateWithPropertyList(CFPropertyListRef plist)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5CB8](plist);
}

uint64_t CGColorSpaceEqualToColorSpace()
{
  return MEMORY[0x270EE5CC0]();
}

CFStringRef CGColorSpaceGetName(CGColorSpaceRef space)
{
  return (CFStringRef)MEMORY[0x270EE5D10](space);
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x270EE5D18](space);
}

uint64_t CGColorSpaceGetType()
{
  return MEMORY[0x270EE5D28]();
}

BOOL CGColorSpaceIsWideGamutRGB(CGColorSpaceRef a1)
{
  return MEMORY[0x270EE5D58](a1);
}

BOOL CGColorSpaceUsesExtendedRange(CGColorSpaceRef space)
{
  return MEMORY[0x270EE5D78](space);
}

uint64_t CGColorTransformConvertColorComponents()
{
  return MEMORY[0x270EE5DA0]();
}

uint64_t CGColorTransformCreate()
{
  return MEMORY[0x270EE5DB0]();
}

void CGContextAddEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextAddLineToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextAddRect(CGContextRef c, CGRect rect)
{
}

void CGContextBeginPath(CGContextRef c)
{
}

void CGContextBeginTransparencyLayer(CGContextRef c, CFDictionaryRef auxiliaryInfo)
{
}

void CGContextBeginTransparencyLayerWithRect(CGContextRef c, CGRect rect, CFDictionaryRef auxInfo)
{
}

uint64_t CGContextClear()
{
  return MEMORY[0x270EE5E30]();
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
}

void CGContextClip(CGContextRef c)
{
}

void CGContextClipToMask(CGContextRef c, CGRect rect, CGImageRef mask)
{
}

void CGContextClipToRect(CGContextRef c, CGRect rect)
{
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
}

uint64_t CGContextCreateWithDelegate()
{
  return MEMORY[0x270EE5EB8]();
}

uint64_t CGContextDelegateCreate()
{
  return MEMORY[0x270EE5EC0]();
}

uint64_t CGContextDelegateGetCallback()
{
  return MEMORY[0x270EE5EC8]();
}

uint64_t CGContextDelegateGetInfo()
{
  return MEMORY[0x270EE5ED0]();
}

uint64_t CGContextDelegateSetCallbacks()
{
  return MEMORY[0x270EE5EE0]();
}

void CGContextDrawConicGradient(CGContextRef c, CGGradientRef gradient, CGPoint center, CGFloat angle)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

uint64_t CGContextDrawImageFromRect()
{
  return MEMORY[0x270EE5F00]();
}

void CGContextDrawLayerAtPoint(CGContextRef context, CGPoint point, CGLayerRef layer)
{
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
}

void CGContextDrawPath(CGContextRef c, CGPathDrawingMode mode)
{
}

uint64_t CGContextDrawPathDirect()
{
  return MEMORY[0x270EE5F48]();
}

void CGContextDrawRadialGradient(CGContextRef c, CGGradientRef gradient, CGPoint startCenter, CGFloat startRadius, CGPoint endCenter, CGFloat endRadius, CGGradientDrawingOptions options)
{
}

void CGContextDrawShading(CGContextRef c, CGShadingRef shading)
{
}

void CGContextDrawTiledImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextEOClip(CGContextRef c)
{
}

void CGContextEndTransparencyLayer(CGContextRef c)
{
}

void CGContextFillPath(CGContextRef c)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

CGAffineTransform *__cdecl CGContextGetCTM(CGAffineTransform *__return_ptr retstr, CGContextRef c)
{
  return (CGAffineTransform *)MEMORY[0x270EE5FC0](retstr, c);
}

CGRect CGContextGetClipBoundingBox(CGContextRef c)
{
  MEMORY[0x270EE5FC8](c);
  result.size.CGFloat height = v4;
  result.size.width = v3;
  result.origin.CGFloat y = v2;
  result.origin.x = v1;
  return result;
}

uint64_t CGContextGetDelegate()
{
  return MEMORY[0x270EE5FD8]();
}

uint64_t CGContextGetGState()
{
  return MEMORY[0x270EE5FE0]();
}

CGInterpolationQuality CGContextGetInterpolationQuality(CGContextRef c)
{
  return MEMORY[0x270EE5FE8](c);
}

uint64_t CGContextGetRenderingState()
{
  return MEMORY[0x270EE6020]();
}

uint64_t CGContextGetSoftMask()
{
  return MEMORY[0x270EE6028]();
}

uint64_t CGContextGetType()
{
  return MEMORY[0x270EE6038]();
}

void CGContextMoveToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextReplacePathWithStrokedPath(CGContextRef c)
{
}

uint64_t CGContextResetState()
{
  return MEMORY[0x270EE6078]();
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetAlpha(CGContextRef c, CGFloat alpha)
{
}

uint64_t CGContextSetBaseCTM()
{
  return MEMORY[0x270EE60D8]();
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
}

uint64_t CGContextSetCTM()
{
  return MEMORY[0x270EE60E8]();
}

uint64_t CGContextSetCompositeOperation()
{
  return MEMORY[0x270EE60F0]();
}

void CGContextSetFillColor(CGContextRef c, const CGFloat *components)
{
}

void CGContextSetFillColorSpace(CGContextRef c, CGColorSpaceRef space)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetFont(CGContextRef c, CGFontRef font)
{
}

uint64_t CGContextSetFontRenderingStyle()
{
  return MEMORY[0x270EE6130]();
}

void CGContextSetFontSize(CGContextRef c, CGFloat size)
{
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
}

void CGContextSetLineCap(CGContextRef c, CGLineCap cap)
{
}

void CGContextSetLineDash(CGContextRef c, CGFloat phase, const CGFloat *lengths, size_t count)
{
}

void CGContextSetLineJoin(CGContextRef c, CGLineJoin join)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetMiterLimit(CGContextRef c, CGFloat limit)
{
}

void CGContextSetPatternPhase(CGContextRef c, CGSize phase)
{
}

void CGContextSetRGBFillColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
}

void CGContextSetShouldAntialias(CGContextRef c, BOOL shouldAntialias)
{
}

uint64_t CGContextSetShouldDrawBitmapRuns()
{
  return MEMORY[0x270EE61D0]();
}

uint64_t CGContextSetSoftMask()
{
  return MEMORY[0x270EE61F0]();
}

void CGContextSetStrokeColor(CGContextRef c, const CGFloat *components)
{
}

void CGContextSetStrokeColorSpace(CGContextRef c, CGColorSpaceRef space)
{
}

void CGContextSetTextDrawingMode(CGContextRef c, CGTextDrawingMode mode)
{
}

void CGContextSetTextMatrix(CGContextRef c, CGAffineTransform *t)
{
}

void CGContextShowGlyphsAtPositions(CGContextRef c, const CGGlyph *glyphs, const CGPoint *Lpositions, size_t count)
{
}

void CGContextStrokePath(CGContextRef c)
{
}

void CGContextStrokeRect(CGContextRef c, CGRect rect)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

uint64_t CGDashGetPattern()
{
  return MEMORY[0x270EE6288]();
}

CGDataConsumerRef CGDataConsumerCreateWithURL(CFURLRef url)
{
  return (CGDataConsumerRef)MEMORY[0x270EE62A0](url);
}

void CGDataConsumerRelease(CGDataConsumerRef consumer)
{
}

CGDataProviderRef CGDataProviderCreateDirect(void *info, off_t size, const CGDataProviderDirectCallbacks *callbacks)
{
  return (CGDataProviderRef)MEMORY[0x270EE62C0](info, size, callbacks);
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x270EE62D0](data);
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x270EE62E0](info, data, size, releaseData);
}

CGDataProviderRef CGDataProviderCreateWithURL(CFURLRef url)
{
  return (CGDataProviderRef)MEMORY[0x270EE62F0](url);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
}

CFStringRef CGFontCopyGlyphNameForGlyph(CGFontRef font, CGGlyph glyph)
{
  return (CFStringRef)MEMORY[0x270EE63F8](font, glyph);
}

uint64_t CGFontCopyName()
{
  return MEMORY[0x270EE6400]();
}

CFStringRef CGFontCopyPostScriptName(CGFontRef font)
{
  return (CFStringRef)MEMORY[0x270EE6408](font);
}

uint64_t CGFontCopyURL()
{
  return MEMORY[0x270EE6410]();
}

uint64_t CGFontCreateFontSubset()
{
  return MEMORY[0x270EE6418]();
}

uint64_t CGFontCreateGlyphPath()
{
  return MEMORY[0x270EE6428]();
}

CGFontRef CGFontCreateWithDataProvider(CGDataProviderRef provider)
{
  return (CGFontRef)MEMORY[0x270EE6430](provider);
}

uint64_t CGFontCreateWithVariations()
{
  return MEMORY[0x270EE6438]();
}

int CGFontGetCapHeight(CGFontRef font)
{
  return MEMORY[0x270EE6448](font);
}

CGRect CGFontGetFontBBox(CGFontRef font)
{
  MEMORY[0x270EE6458](font);
  result.size.CGFloat height = v4;
  result.size.width = v3;
  result.origin.CGFloat y = v2;
  result.origin.x = v1;
  return result;
}

uint64_t CGFontGetFontSubsetFormat()
{
  return MEMORY[0x270EE6460]();
}

BOOL CGFontGetGlyphAdvances(CGFontRef font, const CGGlyph *glyphs, size_t count, int *advances)
{
  return MEMORY[0x270EE6468](font, glyphs, count, advances);
}

BOOL CGFontGetGlyphBBoxes(CGFontRef font, const CGGlyph *glyphs, size_t count, CGRect *bboxes)
{
  return MEMORY[0x270EE6470](font, glyphs, count, bboxes);
}

uint64_t CGFontGetGlyphIdentifiers()
{
  return MEMORY[0x270EE6478]();
}

uint64_t CGFontGetIdentifier()
{
  return MEMORY[0x270EE6488]();
}

uint64_t CGFontGetPostScriptName()
{
  return MEMORY[0x270EE6490]();
}

uint64_t CGFontGetProperty()
{
  return MEMORY[0x270EE6498]();
}

uint64_t CGFontGetQuantizationLevelWithStyle()
{
  return MEMORY[0x270EE64A0]();
}

int CGFontGetUnitsPerEm(CGFontRef font)
{
  return MEMORY[0x270EE64B0](font);
}

uint64_t CGFontGetVariationAxes()
{
  return MEMORY[0x270EE64B8]();
}

uint64_t CGFontGetVariations()
{
  return MEMORY[0x270EE64C0]();
}

uint64_t CGFontIndexMapAddIndexes()
{
  return MEMORY[0x270EE64C8]();
}

uint64_t CGFontIndexMapCreate()
{
  return MEMORY[0x270EE64D0]();
}

uint64_t CGFontIndexMapGetValue()
{
  return MEMORY[0x270EE64D8]();
}

uint64_t CGFontIndexMapGetValues()
{
  return MEMORY[0x270EE64E0]();
}

uint64_t CGFontIndexMapRelease()
{
  return MEMORY[0x270EE64E8]();
}

uint64_t CGFontIndexSetAddIndexes()
{
  return MEMORY[0x270EE64F0]();
}

uint64_t CGFontIndexSetCreate()
{
  return MEMORY[0x270EE64F8]();
}

uint64_t CGFontIndexSetGetCount()
{
  return MEMORY[0x270EE6500]();
}

uint64_t CGFontIndexSetGetIndexes()
{
  return MEMORY[0x270EE6508]();
}

uint64_t CGFontIndexSetGetName()
{
  return MEMORY[0x270EE6510]();
}

uint64_t CGFontIndexSetRelease()
{
  return MEMORY[0x270EE6518]();
}

CGFontRef CGFontRetain(CGFontRef font)
{
  return (CGFontRef)MEMORY[0x270EE6528](font);
}

uint64_t CGFunctionEvaluate()
{
  return MEMORY[0x270EE6538]();
}

uint64_t CGFunctionGetDomain()
{
  return MEMORY[0x270EE6540]();
}

uint64_t CGFunctionGetRangeDimension()
{
  return MEMORY[0x270EE6548]();
}

uint64_t CGFunctionIsIdentity()
{
  return MEMORY[0x270EE6550]();
}

uint64_t CGGStateCreateCopy()
{
  return MEMORY[0x270EE6560]();
}

uint64_t CGGStateGetAdjustedLineWidth()
{
  return MEMORY[0x270EE6568]();
}

uint64_t CGGStateGetAlpha()
{
  return MEMORY[0x270EE6570]();
}

uint64_t CGGStateGetCTM()
{
  return MEMORY[0x270EE6578]();
}

uint64_t CGGStateGetClipStack()
{
  return MEMORY[0x270EE6580]();
}

uint64_t CGGStateGetCompositeOperation()
{
  return MEMORY[0x270EE6588]();
}

uint64_t CGGStateGetFillColor()
{
  return MEMORY[0x270EE6590]();
}

uint64_t CGGStateGetFont()
{
  return MEMORY[0x270EE65A0]();
}

uint64_t CGGStateGetFontDilation()
{
  return MEMORY[0x270EE65A8]();
}

uint64_t CGGStateGetFontRenderingStyle()
{
  return MEMORY[0x270EE65B0]();
}

uint64_t CGGStateGetFontSize()
{
  return MEMORY[0x270EE65B8]();
}

uint64_t CGGStateGetInterpolationQuality()
{
  return MEMORY[0x270EE65C0]();
}

uint64_t CGGStateGetLineCap()
{
  return MEMORY[0x270EE65C8]();
}

uint64_t CGGStateGetLineDash()
{
  return MEMORY[0x270EE65D0]();
}

uint64_t CGGStateGetLineJoin()
{
  return MEMORY[0x270EE65D8]();
}

uint64_t CGGStateGetMiterLimit()
{
  return MEMORY[0x270EE65F0]();
}

uint64_t CGGStateGetPatternPhase()
{
  return MEMORY[0x270EE65F8]();
}

uint64_t CGGStateGetShouldAntialias()
{
  return MEMORY[0x270EE6600]();
}

uint64_t CGGStateGetShouldDrawBitmapRuns()
{
  return MEMORY[0x270EE6608]();
}

uint64_t CGGStateGetSoftMask()
{
  return MEMORY[0x270EE6610]();
}

uint64_t CGGStateGetStrokeColor()
{
  return MEMORY[0x270EE6620]();
}

uint64_t CGGStateGetStyle()
{
  return MEMORY[0x270EE6628]();
}

uint64_t CGGStateGetTextDrawingMode()
{
  return MEMORY[0x270EE6630]();
}

uint64_t CGGStateRelease()
{
  return MEMORY[0x270EE6638]();
}

uint64_t CGGStateSetCTM()
{
  return MEMORY[0x270EE6640]();
}

uint64_t CGGlyphLockAccessCustomized()
{
  return MEMORY[0x270EE6648]();
}

uint64_t CGGlyphLockCreate()
{
  return MEMORY[0x270EE6650]();
}

uint64_t CGGlyphLockGetQuantizationLevel()
{
  return MEMORY[0x270EE6658]();
}

uint64_t CGGlyphLockLockGlyphBitmaps()
{
  return MEMORY[0x270EE6660]();
}

uint64_t CGGlyphLockRelease()
{
  return MEMORY[0x270EE6668]();
}

uint64_t CGGlyphLockUnlock()
{
  return MEMORY[0x270EE6670]();
}

uint64_t CGGradientApply()
{
  return MEMORY[0x270EE6678]();
}

CGGradientRef CGGradientCreateWithColorComponents(CGColorSpaceRef space, const CGFloat *components, const CGFloat *locations, size_t count)
{
  return (CGGradientRef)MEMORY[0x270EE6680](space, components, locations, count);
}

uint64_t CGGradientGetColorSpace()
{
  return MEMORY[0x270EE6698]();
}

uint64_t CGGradientGetLocationCount()
{
  return MEMORY[0x270EE66A0]();
}

uint64_t CGImageBlockCreate()
{
  return MEMORY[0x270EE66C8]();
}

uint64_t CGImageBlockRelease()
{
  return MEMORY[0x270EE66E8]();
}

uint64_t CGImageBlockSetCreate()
{
  return MEMORY[0x270EE66F0]();
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x270EE6738](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(void *)&bitmapInfo, provider);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x270EE6750](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t CGImageCreateWithImageProvider()
{
  return MEMORY[0x270EE6758]();
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x270EF4F20](data, type, count, options);
}

CGImageDestinationRef CGImageDestinationCreateWithDataConsumer(CGDataConsumerRef consumer, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x270EF4F30](consumer, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x270EF4F48](idst);
}

CGImageAlphaInfo CGImageGetAlphaInfo(CGImageRef image)
{
  return MEMORY[0x270EE6778](image);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x270EE6780](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x270EE6790](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x270EE67D8](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

uint64_t CGImageGetIdentifier()
{
  return MEMORY[0x270EE6808]();
}

uint64_t CGImageGetImageProvider()
{
  return MEMORY[0x270EE6810]();
}

uint64_t CGImageGetMask()
{
  return MEMORY[0x270EE6818]();
}

uint64_t CGImageGetMaskingColors()
{
  return MEMORY[0x270EE6820]();
}

uint64_t CGImageGetProperty()
{
  return MEMORY[0x270EE6838]();
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x270EE6868](image);
}

uint64_t CGImageHasAlpha()
{
  return MEMORY[0x270EE6870]();
}

BOOL CGImageIsMask(CGImageRef image)
{
  return MEMORY[0x270EE6878](image);
}

uint64_t CGImageProviderCopyIOSurface()
{
  return MEMORY[0x270EE6898]();
}

uint64_t CGImageProviderCopyImageTextureData()
{
  return MEMORY[0x270EE68A8]();
}

uint64_t CGImageProviderCreate()
{
  return MEMORY[0x270EE68B0]();
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x270EE6908](image);
}

uint64_t CGImageSetProperty()
{
  return MEMORY[0x270EE6910]();
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x270EF5018](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5030](data, options);
}

uint64_t CGImageTextureDataGetColorSpace()
{
  return MEMORY[0x270EE6918]();
}

uint64_t CGImageTextureDataGetDataWithBlock()
{
  return MEMORY[0x270EE6920]();
}

uint64_t CGImageTextureDataGetNumberOfMipmaps()
{
  return MEMORY[0x270EE6928]();
}

uint64_t CGImageTextureDataGetPixelFormat()
{
  return MEMORY[0x270EE6930]();
}

uint64_t CGImageTextureDataGetSize()
{
  return MEMORY[0x270EE6938]();
}

uint64_t CGImageTextureDataRetain()
{
  return MEMORY[0x270EE6948]();
}

uint64_t CGImageTextureDataSupportsTiledLayout()
{
  return MEMORY[0x270EE6950]();
}

CGLayerRef CGLayerCreateWithContext(CGContextRef context, CGSize size, CFDictionaryRef auxiliaryInfo)
{
  return (CGLayerRef)MEMORY[0x270EE6960](context, auxiliaryInfo, (__n128)size, *(__n128 *)&size.height);
}

CGContextRef CGLayerGetContext(CGLayerRef layer)
{
  return (CGContextRef)MEMORY[0x270EE6968](layer);
}

void CGPathAddCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cp1x, CGFloat cp1y, CGFloat cp2x, CGFloat cp2y, CGFloat x, CGFloat y)
{
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathAddQuadCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cpx, CGFloat cpy, CGFloat x, CGFloat y)
{
}

void CGPathApply(CGPathRef path, void *info, CGPathApplierFunction function)
{
}

uint64_t CGPathApplyWithBlock2()
{
  return MEMORY[0x270EE6FC0]();
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
}

CGPathRef CGPathCreateCopyByIntersectingPath(CGPathRef path, CGPathRef maskPath, BOOL evenOddFillRule)
{
  return (CGPathRef)MEMORY[0x270EE6FE0](path, maskPath, evenOddFillRule);
}

CGPathRef CGPathCreateCopyByNormalizing(CGPathRef path, BOOL evenOddFillRule)
{
  return (CGPathRef)MEMORY[0x270EE6FE8](path, evenOddFillRule);
}

CGPathRef CGPathCreateCopyBySubtractingPath(CGPathRef path, CGPathRef maskPath, BOOL evenOddFillRule)
{
  return (CGPathRef)MEMORY[0x270EE6FF8](path, maskPath, evenOddFillRule);
}

CGPathRef CGPathCreateCopyBySymmetricDifferenceOfPath(CGPathRef path, CGPathRef maskPath, BOOL evenOddFillRule)
{
  return (CGPathRef)MEMORY[0x270EE7000](path, maskPath, evenOddFillRule);
}

CGPathRef CGPathCreateCopyByTransformingPath(CGPathRef path, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x270EE7008](path, transform);
}

CGPathRef CGPathCreateCopyByUnioningPath(CGPathRef path, CGPathRef maskPath, BOOL evenOddFillRule)
{
  return (CGPathRef)MEMORY[0x270EE7010](path, maskPath, evenOddFillRule);
}

CGPathRef CGPathCreateCopyOfLineByIntersectingPath(CGPathRef path, CGPathRef maskPath, BOOL evenOddFillRule)
{
  return (CGPathRef)MEMORY[0x270EE7018](path, maskPath, evenOddFillRule);
}

CGPathRef CGPathCreateCopyOfLineBySubtractingPath(CGPathRef path, CGPathRef maskPath, BOOL evenOddFillRule)
{
  return (CGPathRef)MEMORY[0x270EE7020](path, maskPath, evenOddFillRule);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x270EE7030]();
}

CGPathRef CGPathCreateWithRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x270EE7058](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGPathEqualToPath(CGPathRef path1, CGPathRef path2)
{
  return MEMORY[0x270EE7068](path1, path2);
}

uint64_t CGPathGetNumberOfElements()
{
  return MEMORY[0x270EE7080]();
}

uint64_t CGPathGetNumberOfPoints()
{
  return MEMORY[0x270EE7088]();
}

CGRect CGPathGetPathBoundingBox(CGPathRef path)
{
  MEMORY[0x270EE7090](path);
  result.size.CGFloat height = v4;
  result.size.width = v3;
  result.origin.CGFloat y = v2;
  result.origin.x = v1;
  return result;
}

uint64_t CGPathIsEllipseWithTransform()
{
  return MEMORY[0x270EE70C0]();
}

BOOL CGPathIsEmpty(CGPathRef path)
{
  return MEMORY[0x270EE70C8](path);
}

uint64_t CGPathIsPrimitive()
{
  return MEMORY[0x270EE70D8]();
}

uint64_t CGPathIsRectWithTransform()
{
  return MEMORY[0x270EE70E8]();
}

uint64_t CGPathIsRoundedRectWithTransform()
{
  return MEMORY[0x270EE70F0]();
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathRelease(CGPathRef path)
{
}

CGPathRef CGPathRetain(CGPathRef path)
{
  return (CGPathRef)MEMORY[0x270EE7108](path);
}

uint64_t CGPatternGetImage()
{
  return MEMORY[0x270EE7120]();
}

uint64_t CGPatternGetMatrix()
{
  return MEMORY[0x270EE7128]();
}

uint64_t CGPatternGetShading()
{
  return MEMORY[0x270EE7130]();
}

uint64_t CGPatternIsColored()
{
  return MEMORY[0x270EE7138]();
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x270EE7168](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v5;
  result.size.width = v4;
  result.origin.CGFloat y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.CGFloat height = v6;
  result.size.width = v5;
  result.origin.CGFloat y = v4;
  result.origin.x = v3;
  return result;
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x270EE7268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x270EE7270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectStandardize(CGRect rect)
{
  MEMORY[0x270EE7288]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v4;
  result.size.width = v3;
  result.origin.CGFloat y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7290]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.width = v4;
  result.origin.CGFloat y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t CGRenderingStateGetAllowsAntialiasing()
{
  return MEMORY[0x270EE72D0]();
}

uint64_t CGRenderingStateGetBaseCTM()
{
  return MEMORY[0x270EE72D8]();
}

uint64_t CGRenderingStateGetFontRenderingStyle()
{
  return MEMORY[0x270EE72E0]();
}

uint64_t CGShadingGetBackground()
{
  return MEMORY[0x270EE72F8]();
}

uint64_t CGShadingGetBounds()
{
  return MEMORY[0x270EE7300]();
}

uint64_t CGShadingGetColorSpace()
{
  return MEMORY[0x270EE7308]();
}

uint64_t CGShadingGetDescriptor()
{
  return MEMORY[0x270EE7310]();
}

uint64_t CGShadingGetType()
{
  return MEMORY[0x270EE7318]();
}

uint64_t CGSoftMaskCreate()
{
  return MEMORY[0x270EE7358]();
}

uint64_t CGSoftMaskDelegateDrawSoftMask()
{
  return MEMORY[0x270EE7360]();
}

uint64_t CGSoftMaskGetBackground()
{
  return MEMORY[0x270EE7368]();
}

uint64_t CGSoftMaskGetBounds()
{
  return MEMORY[0x270EE7370]();
}

uint64_t CGSoftMaskGetIdentifier()
{
  return MEMORY[0x270EE7378]();
}

uint64_t CGSoftMaskGetMatrix()
{
  return MEMORY[0x270EE7380]();
}

uint64_t CGSoftMaskGetTransfer()
{
  return MEMORY[0x270EE7388]();
}

uint64_t CGStyleGetColor()
{
  return MEMORY[0x270EE73B8]();
}

uint64_t CGStyleGetData()
{
  return MEMORY[0x270EE73C0]();
}

uint64_t CGStyleGetDrawOrdering()
{
  return MEMORY[0x270EE73C8]();
}

uint64_t CGStyleGetIdentifier()
{
  return MEMORY[0x270EE73D0]();
}

uint64_t CGStyleGetType()
{
  return MEMORY[0x270EE73D8]();
}

uint64_t CGTextClippingCreatePath()
{
  return MEMORY[0x270EE73E8]();
}

CGFontRef CTFontCopyGraphicsFont(CTFontRef font, CTFontDescriptorRef *attributes)
{
  return (CGFontRef)MEMORY[0x270EE9A50](font, attributes);
}

CTFontRef CTFontCreateWithNameAndOptions(CFStringRef name, CGFloat size, const CGAffineTransform *matrix, CTFontOptions options)
{
  return (CTFontRef)MEMORY[0x270EE9B00](name, matrix, options, size);
}

CFIndex CTRunGetGlyphCount(CTRunRef run)
{
  return MEMORY[0x270EE9E68](run);
}

CTRunStatus CTRunGetStatus(CTRunRef run)
{
  return MEMORY[0x270EE9E98](run);
}

void CTRunGetStringIndices(CTRunRef run, CFRange range, CFIndex *buffer)
{
}

const CFIndex *__cdecl CTRunGetStringIndicesPtr(CTRunRef run)
{
  return (const CFIndex *)MEMORY[0x270EE9EB0](run);
}

CFTypeID CTRunGetTypeID(void)
{
  return MEMORY[0x270EE9EC8]();
}

size_t IOSurfaceAlignProperty(CFStringRef property, size_t value)
{
  return MEMORY[0x270EF4C00](property, value);
}

CFTypeRef IOSurfaceCopyValue(IOSurfaceRef buffer, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x270EF4C20](buffer, key);
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x270EF4C28](properties);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x270EF4C58](buffer);
}

uint64_t IOSurfaceGetBulkAttachments()
{
  return MEMORY[0x270EF4C90]();
}

size_t IOSurfaceGetBytesPerRow(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4CB0](buffer);
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4D48](buffer);
}

IOSurfaceID IOSurfaceGetID(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4D68](buffer);
}

OSType IOSurfaceGetPixelFormat(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4D80](buffer);
}

CFTypeID IOSurfaceGetTypeID(void)
{
  return MEMORY[0x270EF4DC8]();
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4DE0](buffer);
}

Boolean IOSurfaceIsInUse(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4E08](buffer);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x270EF4E18](buffer, *(void *)&options, seed);
}

uint64_t IOSurfaceSetBulkAttachments2()
{
  return MEMORY[0x270EF4E40]();
}

kern_return_t IOSurfaceSetPurgeable(IOSurfaceRef buffer, uint32_t newState, uint32_t *oldState)
{
  return MEMORY[0x270EF4E68](buffer, *(void *)&newState, oldState);
}

void IOSurfaceSetValue(IOSurfaceRef buffer, CFStringRef key, CFTypeRef value)
{
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x270EF4E88](buffer, *(void *)&options, seed);
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x270EF5E20]();
}

uint64_t MTLPixelFormatGetInfoForDevice()
{
  return MEMORY[0x270EF5EE0]();
}

uint64_t MTLPixelFormatGetName()
{
  return MEMORY[0x270EF5EF0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x270F982E8](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x270F982F8](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x270F98458](__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

std::string *__cdecl std::string::append(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x270F984B0](this, __n, __c);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x270F98748]();
}

uint64_t std::ostream::write()
{
  return MEMORY[0x270F98750]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x270F98758]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x270F98760]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x270F98770]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x270F988A8]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x270F988B0]();
}

void std::condition_variable::notify_all(std::condition_variable *this)
{
}

void std::condition_variable::wait(std::condition_variable *this, std::unique_lock<std::mutex> *__lk)
{
}

void std::condition_variable::~condition_variable(std::condition_variable *this)
{
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

void std::__throw_system_error(int __ev, const char *__what_arg)
{
}

void std::mutex::lock(std::mutex *this)
{
}

void std::mutex::unlock(std::mutex *this)
{
}

void std::mutex::~mutex(std::mutex *this)
{
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x270F98DE8]();
}

void operator delete[]()
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz, const std::nothrow_t *a2)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x270F98F10](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x270ED7E88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  MEMORY[0x270ED7E90](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

simd_float4 _simd_exp2_f4(simd_float4 x)
{
  MEMORY[0x270ED8248]((__n128)x);
  return result;
}

simd_float4 _simd_log2_f4(simd_float4 x)
{
  MEMORY[0x270ED82C8]((__n128)x);
  return result;
}

void abort(void)
{
}

long double acos(long double __x)
{
  MEMORY[0x270ED8588](__x);
  return result;
}

long double asin(long double __x)
{
  MEMORY[0x270ED8610](__x);
  return result;
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x270ED8688](a1, a2);
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x270ED86A8](__y, __x);
  return result;
}

int atoi(const char *a1)
{
  return MEMORY[0x270ED86E8](a1);
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_after_f(dispatch_time_t when, dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x270ED92D0](buffer, size, queue, destructor);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_sync_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

int dup2(int a1, int a2)
{
  return MEMORY[0x270ED9680](*(void *)&a1, *(void *)&a2);
}

uint64_t dyld_image_path_containing_address()
{
  return MEMORY[0x270ED96D8]();
}

double erand48(unsigned __int16 a1[3])
{
  MEMORY[0x270ED9778](a1);
  return result;
}

long double exp(long double __x)
{
  MEMORY[0x270ED9858](__x);
  return result;
}

float exp2f(float a1)
{
  MEMORY[0x270ED9868](a1);
  return result;
}

float expf(float a1)
{
  MEMORY[0x270ED9870](a1);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x270ED9938](a1);
}

float fmodf(float a1, float a2)
{
  MEMORY[0x270ED99D8](a1, a2);
  return result;
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x270ED9A20](a1, a2);
}

void free(void *a1)
{
}

float frexpf(float a1, int *a2)
{
  MEMORY[0x270ED9A70](a2, a1);
  return result;
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x270ED9BE8](a1);
}

int getpagesize(void)
{
  return MEMORY[0x270ED9CC8]();
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

float ldexpf(float a1, int a2)
{
  MEMORY[0x270EDA030](*(void *)&a2, a1);
  return result;
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x270EDA0A0](a1, a2);
}

float log2f(float a1)
{
  MEMORY[0x270EDA0E0](a1);
  return result;
}

float logf(float a1)
{
  MEMORY[0x270EDA0F8](a1);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

size_t malloc_good_size(size_t size)
{
  return MEMORY[0x270EDA358](size);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3A0](ptr, size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x270EDA598](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int mprotect(void *a1, size_t a2, int a3)
{
  return MEMORY[0x270EDA5C0](a1, a2, *(void *)&a3);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x270EDA5F8](a1, a2);
}

float nextafterf(float a1, float a2)
{
  MEMORY[0x270EDA718](a1, a2);
  return result;
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
}

id objc_initWeakOrNil(id *location, id val)
{
  return (id)MEMORY[0x270F9A690](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

id objc_storeWeakOrNil(id *location, id obj)
{
  return (id)MEMORY[0x270F9AA08](location, obj);
}

int openat(int a1, const char *a2, int a3, ...)
{
  return MEMORY[0x270EDA840](*(void *)&a1, a2, *(void *)&a3);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

BOOL os_unfair_lock_trylock(os_unfair_lock_t lock)
{
  return MEMORY[0x270EDAAD8](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x270EDAB40]();
}

float powf(float a1, float a2)
{
  MEMORY[0x270EDAD00](a1, a2);
  return result;
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x270EDAD78](*(void *)&pid, *(void *)&flavor, arg, buffer, *(void *)&buffersize);
}

uint64_t proc_pidoriginatorinfo()
{
  return MEMORY[0x270EDAD80]();
}

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return MEMORY[0x270EDAF38](a1);
}

int pthread_main_np(void)
{
  return MEMORY[0x270EDAF40]();
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x270EDB010]();
}

int puts(const char *a1)
{
  return MEMORY[0x270EDB098](a1);
}

float scalbnf(float a1, int a2)
{
  MEMORY[0x270EDB2F8](*(void *)&a2, a1);
  return result;
}

int setlinebuf(FILE *a1)
{
  return MEMORY[0x270EDB400](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int snprintf_l(char *a1, size_t a2, locale_t a3, const char *a4, ...)
{
  return MEMORY[0x270EDB518](a1, a2, a3, a4);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x270EDB590](a1, a2);
}

size_t strcspn(const char *__s, const char *__charset)
{
  return MEMORY[0x270EDB5C8](__s, __charset);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDB5D0](__s1);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x270EDB5F0](a1, a2, a3, a4);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

size_t strspn(const char *__s, const char *__charset)
{
  return MEMORY[0x270EDB698](__s, __charset);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x270EDB6A0](__s1, __s2);
}

double strtod(const char *a1, char **a2)
{
  MEMORY[0x270EDB6A8](a1, a2);
  return result;
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB6D8](__str, __endptr, *(void *)&__base);
}

float tanf(float a1)
{
  MEMORY[0x270EDB818](a1);
  return result;
}

kern_return_t thread_policy_set(thread_act_t thread, thread_policy_flavor_t flavor, thread_policy_t policy_info, mach_msg_type_number_t policy_infoCnt)
{
  return MEMORY[0x270EDB908](*(void *)&thread, *(void *)&flavor, policy_info, *(void *)&policy_infoCnt);
}

time_t time(time_t *a1)
{
  return MEMORY[0x270EDB930](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x270EDB9E8](*(void *)&a1);
}

void uuid_clear(uuid_t uu)
{
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
}

void uuid_generate(uuid_t out)
{
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x270EDBA28](uu);
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x270EDBA30](in, uu);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

vImage_Error vImageAffineWarp_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, const vImage_AffineTransform *transform, const Pixel_8888 backColor, vImage_Flags flags)
{
  return MEMORY[0x270EDEEE8](src, dest, tempBuffer, transform, backColor, *(void *)&flags);
}

vImage_Error vImageAffineWarp_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, const vImage_AffineTransform *transform, Pixel_8 backColor, vImage_Flags flags)
{
  return MEMORY[0x270EDEEF0](src, dest, tempBuffer, transform, backColor, *(void *)&flags);
}

vImage_Error vImageBoxConvolve_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImagePixelCount srcOffsetToROI_X, vImagePixelCount srcOffsetToROI_Y, uint32_t kernel_height, uint32_t kernel_width, const Pixel_8888 backgroundColor, vImage_Flags flags)
{
  return MEMORY[0x270EDEF00](src, dest, tempBuffer, srcOffsetToROI_X, srcOffsetToROI_Y, *(void *)&kernel_height, *(void *)&kernel_width, backgroundColor);
}

vImage_Error vImageBoxConvolve_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImagePixelCount srcOffsetToROI_X, vImagePixelCount srcOffsetToROI_Y, uint32_t kernel_height, uint32_t kernel_width, Pixel_8 backgroundColor, vImage_Flags flags)
{
  return MEMORY[0x270EDEF08](src, dest, tempBuffer, srcOffsetToROI_X, srcOffsetToROI_Y, *(void *)&kernel_height, *(void *)&kernel_width, backgroundColor);
}

vImage_Error vImageBuffer_InitWithCGImage(vImage_Buffer *buf, vImage_CGImageFormat *format, const CGFloat *backgroundColor, CGImageRef image, vImage_Flags flags)
{
  return MEMORY[0x270EDEF28](buf, format, backgroundColor, image, *(void *)&flags);
}

vImage_Error vImageClipToAlpha_RGBA8888(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x270EDEF40](src, dest, *(void *)&flags);
}

vImage_Error vImageMatrixMultiply_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, const int16_t matrix[16], int32_t divisor, const int16_t *pre_bias, const int32_t *post_bias, vImage_Flags flags)
{
  return MEMORY[0x270EDF238](src, dest, matrix, *(void *)&divisor, pre_bias, post_bias, *(void *)&flags);
}

vImage_Error vImageOverwriteChannelsWithScalar_ARGB8888(Pixel_8 scalar, const vImage_Buffer *src, const vImage_Buffer *dest, uint8_t copyMask, vImage_Flags flags)
{
  return MEMORY[0x270EDF250](scalar, src, dest, copyMask, *(void *)&flags);
}

vImage_Error vImagePermuteChannels_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, const uint8_t permuteMap[4], vImage_Flags flags)
{
  return MEMORY[0x270EDF268](src, dest, permuteMap, *(void *)&flags);
}

vImage_Error vImagePremultiplyData_RGBA8888(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x270EDF288](src, dest, *(void *)&flags);
}

vImage_Error vImageTableLookUp_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, const Pixel_8 alphaTable[256], const Pixel_8 redTable[256], const Pixel_8 greenTable[256], const Pixel_8 blueTable[256], vImage_Flags flags)
{
  return MEMORY[0x270EDF3A8](src, dest, alphaTable, redTable, greenTable, blueTable, *(void *)&flags);
}

vImage_Error vImageTableLookUp_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, const Pixel_8 table[256], vImage_Flags flags)
{
  return MEMORY[0x270EDF3B0](src, dest, table, *(void *)&flags);
}

vImage_Error vImageTentConvolve_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImagePixelCount srcOffsetToROI_X, vImagePixelCount srcOffsetToROI_Y, uint32_t kernel_height, uint32_t kernel_width, const Pixel_8888 backgroundColor, vImage_Flags flags)
{
  return MEMORY[0x270EDF3B8](src, dest, tempBuffer, srcOffsetToROI_X, srcOffsetToROI_Y, *(void *)&kernel_height, *(void *)&kernel_width, backgroundColor);
}

vImage_Error vImageTentConvolve_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImagePixelCount srcOffsetToROI_X, vImagePixelCount srcOffsetToROI_Y, uint32_t kernel_height, uint32_t kernel_width, Pixel_8 backgroundColor, vImage_Flags flags)
{
  return MEMORY[0x270EDF3C0](src, dest, tempBuffer, srcOffsetToROI_X, srcOffsetToROI_Y, *(void *)&kernel_height, *(void *)&kernel_width, backgroundColor);
}

vImage_Error vImageUnpremultiplyData_RGBA8888(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x270EDF3C8](src, dest, *(void *)&flags);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x270EDBA58](a1, a2, a3);
}