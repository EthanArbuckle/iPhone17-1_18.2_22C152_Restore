void sub_25B5CC90C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,void *a37)
{
  void *v37;

  _Unwind_Resume(a1);
}

void sub_25B5CCC64(void *a1)
{
  sub_25B5CCC9C(a1);

  JUMPOUT(0x261163EE0);
}

void *sub_25B5CCC9C(void *a1)
{
  *a1 = &unk_2708F21C0;
  a1[96] = &unk_2708F27E8;
  v2 = (std::__shared_weak_count *)a1[112];
  if (v2) {
    sub_25B404120(v2);
  }
  a1[77] = &unk_2708F27E8;
  v3 = (std::__shared_weak_count *)a1[93];
  if (v3) {
    sub_25B404120(v3);
  }
  a1[58] = &unk_2708F27E8;
  v4 = (std::__shared_weak_count *)a1[74];
  if (v4) {
    sub_25B404120(v4);
  }
  a1[39] = &unk_2708F21F8;
  v5 = (std::__shared_weak_count *)a1[55];
  if (v5) {
    sub_25B404120(v5);
  }
  a1[20] = &unk_2708F21F8;
  v6 = (std::__shared_weak_count *)a1[36];
  if (v6) {
    sub_25B404120(v6);
  }
  a1[1] = &unk_2708F21F8;
  v7 = (std::__shared_weak_count *)a1[17];
  if (v7) {
    sub_25B404120(v7);
  }
  return a1;
}

uint64_t *sub_25B5CCDE8(uint64_t *result, uint64_t *a2, uint64_t **a3, uint64_t a4, char a5)
{
  v11 = result;
  while (2)
  {
    v102 = a2 - 1;
    v12 = v11;
    while (1)
    {
      while (1)
      {
        while (1)
        {
          v11 = v12;
          uint64_t v13 = (char *)a2 - (char *)v12;
          unint64_t v14 = a2 - v12;
          if (v6 || !v5)
          {
            switch(v14)
            {
              case 0uLL:
              case 1uLL:
                return result;
              case 2uLL:
                uint64_t v44 = *v12;
                if (*(float *)(**a3 + 12 * *v102 + 8) > *(float *)(**a3 + 12 * *v12 + 8))
                {
                  uint64_t *v12 = *v102;
                  uint64_t *v102 = v44;
                }
                break;
              case 3uLL:
                uint64_t v45 = **a3;
                result = sub_25B5CD688(v12, v12 + 1, v102, v45);
                break;
              case 4uLL:
                result = sub_25B5CD734(v12, v12 + 1, v12 + 2, v102, a3);
                break;
              case 5uLL:
                v46 = v12 + 1;
                v47 = v12 + 2;
                v48 = v12 + 3;
                result = sub_25B5CD734(v12, v12 + 1, v12 + 2, v12 + 3, a3);
                uint64_t v49 = v12[3];
                uint64_t v50 = **a3;
                if (*(float *)(v50 + 12 * *v102 + 8) > *(float *)(v50 + 12 * v49 + 8))
                {
                  uint64_t *v48 = *v102;
                  uint64_t *v102 = v49;
                  uint64_t v51 = *v48;
                  uint64_t v52 = *v47;
                  float v53 = *(float *)(v50 + 12 * *v48 + 8);
                  if (v53 > *(float *)(v50 + 12 * *v47 + 8))
                  {
                    uint64_t *v47 = v51;
                    uint64_t *v48 = v52;
                    uint64_t v54 = *v46;
                    if (v53 > *(float *)(v50 + 12 * *v46 + 8))
                    {
                      v12[1] = v51;
                      v12[2] = v54;
                      uint64_t v55 = *v12;
                      if (v53 > *(float *)(v50 + 12 * *v12 + 8))
                      {
                        uint64_t *v12 = v51;
                        v12[1] = v55;
                      }
                    }
                  }
                }
                break;
              default:
                JUMPOUT(0);
            }
            return result;
          }
          if (v13 <= 191)
          {
            if (a5)
            {
              if (v12 != a2)
              {
                v56 = v12 + 1;
                if (v12 + 1 != a2)
                {
                  uint64_t v57 = **a3;
                  uint64_t v58 = 8;
                  v59 = v12;
                  do
                  {
                    uint64_t v61 = *v59;
                    uint64_t v60 = v59[1];
                    v59 = v56;
                    float v62 = *(float *)(v57 + 12 * v60 + 8);
                    if (v62 > *(float *)(v57 + 12 * v61 + 8))
                    {
                      uint64_t v63 = v58;
                      do
                      {
                        *(uint64_t *)((char *)v12 + v63) = v61;
                        uint64_t v64 = v63 - 8;
                        if (v63 == 8)
                        {
                          v65 = v12;
                          goto LABEL_78;
                        }
                        uint64_t v61 = *(uint64_t *)((char *)v12 + v63 - 16);
                        v63 -= 8;
                      }
                      while (v62 > *(float *)(v57 + 12 * v61 + 8));
                      v65 = (uint64_t *)((char *)v12 + v64);
LABEL_78:
                      uint64_t *v65 = v60;
                    }
                    v56 = v59 + 1;
                    v58 += 8;
                  }
                  while (v59 + 1 != a2);
                }
              }
            }
            else if (v12 != a2)
            {
              v97 = v12 + 1;
              if (v12 + 1 != a2)
              {
                uint64_t v98 = **a3;
                do
                {
                  uint64_t v100 = *v11;
                  uint64_t v99 = v11[1];
                  v11 = v97;
                  float v101 = *(float *)(v98 + 12 * v99 + 8);
                  if (v101 > *(float *)(v98 + 12 * v100 + 8))
                  {
                    do
                    {
                      uint64_t *v97 = v100;
                      uint64_t v100 = *(v97 - 2);
                      --v97;
                    }
                    while (v101 > *(float *)(v98 + 12 * v100 + 8));
                    uint64_t *v97 = v99;
                  }
                  v97 = v11 + 1;
                }
                while (v11 + 1 != a2);
              }
            }
            return result;
          }
          if (!a4)
          {
            if (v12 != a2)
            {
              int64_t v66 = (v14 - 2) >> 1;
              v67 = *a3;
              int64_t v68 = v66;
              do
              {
                int64_t v69 = v68;
                if (v66 >= v68)
                {
                  uint64_t v70 = (2 * v68) | 1;
                  v71 = &v12[v70];
                  uint64_t v72 = 2 * v68 + 2;
                  uint64_t v73 = *v67;
                  if (v72 < (uint64_t)v14 && *(float *)(v73 + 12 * *v71 + 8) > *(float *)(v73 + 12 * v71[1] + 8))
                  {
                    ++v71;
                    uint64_t v70 = 2 * v69 + 2;
                  }
                  v74 = &v12[v69];
                  uint64_t v75 = *v71;
                  uint64_t v76 = *v74;
                  result = (uint64_t *)(v73 + 12 * *v74);
                  float v77 = *((float *)result + 2);
                  if (*(float *)(v73 + 12 * *v71 + 8) <= v77)
                  {
                    do
                    {
                      result = v71;
                      uint64_t *v74 = v75;
                      if (v66 < v70) {
                        break;
                      }
                      uint64_t v78 = 2 * v70;
                      uint64_t v70 = (2 * v70) | 1;
                      v71 = &v12[v70];
                      uint64_t v79 = v78 + 2;
                      if (v79 < (uint64_t)v14 && *(float *)(v73 + 12 * *v71 + 8) > *(float *)(v73 + 12 * v71[1] + 8))
                      {
                        ++v71;
                        uint64_t v70 = v79;
                      }
                      uint64_t v75 = *v71;
                      v74 = result;
                    }
                    while (*(float *)(v73 + 12 * *v71 + 8) <= v77);
                    *result = v76;
                  }
                }
                int64_t v68 = v69 - 1;
              }
              while (v69);
              uint64_t v80 = (unint64_t)v13 >> 3;
              do
              {
                uint64_t v81 = 0;
                uint64_t v82 = *v12;
                v83 = *a3;
                v84 = v12;
                do
                {
                  v85 = v84;
                  v84 += v81 + 1;
                  uint64_t v86 = 2 * v81;
                  uint64_t v81 = (2 * v81) | 1;
                  uint64_t v87 = v86 + 2;
                  if (v87 < v80)
                  {
                    result = (uint64_t *)(*v83 + 12 * v84[1]);
                    if (*(float *)(*v83 + 12 * *v84 + 8) > *((float *)result + 2))
                    {
                      ++v84;
                      uint64_t v81 = v87;
                    }
                  }
                  uint64_t *v85 = *v84;
                }
                while (v81 <= (uint64_t)((unint64_t)(v80 - 2) >> 1));
                if (v84 == --a2)
                {
                  uint64_t *v84 = v82;
                }
                else
                {
                  uint64_t *v84 = *a2;
                  *a2 = v82;
                  uint64_t v88 = (char *)v84 - (char *)v12 + 8;
                  if (v88 >= 9)
                  {
                    unint64_t v89 = (((unint64_t)v88 >> 3) - 2) >> 1;
                    v90 = &v12[v89];
                    uint64_t v91 = *v90;
                    uint64_t v92 = *v84;
                    uint64_t v93 = *v83;
                    float v94 = *(float *)(v93 + 12 * *v84 + 8);
                    if (*(float *)(v93 + 12 * *v90 + 8) > v94)
                    {
                      do
                      {
                        v95 = v90;
                        uint64_t *v84 = v91;
                        if (!v89) {
                          break;
                        }
                        unint64_t v89 = (v89 - 1) >> 1;
                        v90 = &v12[v89];
                        uint64_t v91 = *v90;
                        v84 = v95;
                      }
                      while (*(float *)(v93 + 12 * *v90 + 8) > v94);
                      uint64_t *v95 = v92;
                    }
                  }
                }
              }
              while (v80-- > 2);
            }
            return result;
          }
          unint64_t v15 = v14 >> 1;
          v16 = &v12[v14 >> 1];
          uint64_t v17 = **a3;
          if ((unint64_t)v13 >= 0x401)
          {
            sub_25B5CD688(v11, &v11[v14 >> 1], v102, v17);
            sub_25B5CD688(v11 + 1, v16 - 1, a2 - 2, **a3);
            sub_25B5CD688(v11 + 2, &v11[v15 + 1], a2 - 3, **a3);
            result = sub_25B5CD688(v16 - 1, v16, &v11[v15 + 1], **a3);
            uint64_t v18 = *v11;
            uint64_t *v11 = *v16;
            uint64_t *v16 = v18;
          }
          else
          {
            result = sub_25B5CD688(&v11[v14 >> 1], v11, v102, v17);
          }
          --a4;
          uint64_t v19 = *v11;
          uint64_t v20 = **a3;
          if (a5) {
            break;
          }
          float v21 = *(float *)(v20 + 12 * v19 + 8);
          if (*(float *)(v20 + 12 * *(v11 - 1) + 8) > v21) {
            goto LABEL_13;
          }
          if (v21 <= *(float *)(v20 + 12 * *v102 + 8))
          {
            v36 = v11 + 1;
            do
            {
              v12 = v36;
              if (v36 >= a2) {
                break;
              }
              ++v36;
            }
            while (v21 <= *(float *)(v20 + 12 * *v12 + 8));
          }
          else
          {
            v12 = v11;
            do
            {
              uint64_t v35 = v12[1];
              ++v12;
            }
            while (v21 <= *(float *)(v20 + 12 * v35 + 8));
          }
          v37 = a2;
          if (v12 < a2)
          {
            v37 = a2;
            do
              uint64_t v38 = *--v37;
            while (v21 > *(float *)(v20 + 12 * v38 + 8));
          }
          if (v12 < v37)
          {
            uint64_t v39 = *v12;
            uint64_t v40 = *v37;
            do
            {
              uint64_t *v12 = v40;
              uint64_t *v37 = v39;
              do
              {
                uint64_t v41 = v12[1];
                ++v12;
                uint64_t v39 = v41;
              }
              while (v21 <= *(float *)(v20 + 12 * v41 + 8));
              do
              {
                uint64_t v42 = *--v37;
                uint64_t v40 = v42;
              }
              while (v21 > *(float *)(v20 + 12 * v42 + 8));
            }
            while (v12 < v37);
          }
          v43 = v12 - 1;
          BOOL v5 = v12 - 1 >= v11;
          BOOL v6 = v12 - 1 == v11;
          if (v12 - 1 != v11) {
            uint64_t *v11 = *v43;
          }
          a5 = 0;
          uint64_t *v43 = v19;
        }
        float v21 = *(float *)(v20 + 12 * v19 + 8);
LABEL_13:
        v22 = v11;
        do
        {
          v23 = v22;
          uint64_t v25 = v22[1];
          ++v22;
          uint64_t v24 = v25;
        }
        while (*(float *)(v20 + 12 * v25 + 8) > v21);
        v26 = a2;
        if (v23 == v11)
        {
          v26 = a2;
          do
          {
            if (v22 >= v26) {
              break;
            }
            uint64_t v28 = *--v26;
          }
          while (*(float *)(v20 + 12 * v28 + 8) <= v21);
        }
        else
        {
          do
            uint64_t v27 = *--v26;
          while (*(float *)(v20 + 12 * v27 + 8) <= v21);
        }
        if (v22 < v26)
        {
          uint64_t v29 = *v26;
          v30 = v22;
          v31 = v26;
          do
          {
            uint64_t *v30 = v29;
            uint64_t *v31 = v24;
            do
            {
              v23 = v30;
              uint64_t v32 = v30[1];
              ++v30;
              uint64_t v24 = v32;
            }
            while (*(float *)(v20 + 12 * v32 + 8) > v21);
            do
            {
              uint64_t v33 = *--v31;
              uint64_t v29 = v33;
            }
            while (*(float *)(v20 + 12 * v33 + 8) <= v21);
          }
          while (v30 < v31);
        }
        if (v23 != v11) {
          uint64_t *v11 = *v23;
        }
        uint64_t *v23 = v19;
        if (v22 >= v26) {
          break;
        }
LABEL_32:
        result = (uint64_t *)sub_25B5CCDE8(v11, v23, a3, a4, a5 & 1);
        a5 = 0;
        v12 = v23 + 1;
      }
      BOOL v34 = sub_25B5CD80C(v11, v23, a3);
      v12 = v23 + 1;
      result = (uint64_t *)sub_25B5CD80C(v23 + 1, a2, a3);
      if (result) {
        break;
      }
      if (!v34) {
        goto LABEL_32;
      }
    }
    a2 = v23;
    if (!v34) {
      continue;
    }
    return result;
  }
}

uint64_t *sub_25B5CD688(uint64_t *result, uint64_t *a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v4 = *a2;
  uint64_t v5 = *result;
  float v6 = *(float *)(a4 + 12 * *a2 + 8);
  float v7 = *(float *)(a4 + 12 * *result + 8);
  uint64_t v8 = *a3;
  float v9 = *(float *)(a4 + 12 * *a3 + 8);
  if (v6 <= v7)
  {
    if (v9 > v6)
    {
      *a2 = v8;
      *a3 = v4;
      uint64_t v10 = *result;
      if (*(float *)(a4 + 12 * *a2 + 8) > *(float *)(a4 + 12 * *result + 8))
      {
        *result = *a2;
        *a2 = v10;
      }
    }
  }
  else
  {
    if (v9 <= v6)
    {
      *result = v4;
      *a2 = v5;
      if (*(float *)(a4 + 12 * *a3 + 8) <= v7) {
        return result;
      }
      *a2 = *a3;
    }
    else
    {
      *result = v8;
    }
    *a3 = v5;
  }
  return result;
}

uint64_t *sub_25B5CD734(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t **a5)
{
  result = sub_25B5CD688(a1, a2, a3, **a5);
  uint64_t v11 = *a3;
  uint64_t v12 = **a5;
  if (*(float *)(v12 + 12 * *a4 + 8) > *(float *)(v12 + 12 * *a3 + 8))
  {
    *a3 = *a4;
    *a4 = v11;
    uint64_t v13 = *a2;
    if (*(float *)(v12 + 12 * *a3 + 8) > *(float *)(v12 + 12 * *a2 + 8))
    {
      *a2 = *a3;
      *a3 = v13;
      uint64_t v14 = *a1;
      if (*(float *)(v12 + 12 * *a2 + 8) > *(float *)(v12 + 12 * *a1 + 8))
      {
        *a1 = *a2;
        *a2 = v14;
      }
    }
  }
  return result;
}

BOOL sub_25B5CD80C(uint64_t *a1, uint64_t *a2, uint64_t **a3)
{
  uint64_t v6 = a2 - a1;
  BOOL result = 1;
  switch(v6)
  {
    case 0:
    case 1:
      return result;
    case 2:
      uint64_t v8 = *(a2 - 1);
      uint64_t v9 = *a1;
      if (*(float *)(**a3 + 12 * v8 + 8) > *(float *)(**a3 + 12 * *a1 + 8))
      {
        *a1 = v8;
        *(a2 - 1) = v9;
      }
      return result;
    case 3:
      sub_25B5CD688(a1, a1 + 1, a2 - 1, **a3);
      return 1;
    case 4:
      sub_25B5CD734(a1, a1 + 1, a1 + 2, a2 - 1, a3);
      return 1;
    case 5:
      float v21 = a1 + 1;
      v22 = a1 + 2;
      v23 = a1 + 3;
      sub_25B5CD734(a1, a1 + 1, a1 + 2, a1 + 3, a3);
      uint64_t v24 = *(a2 - 1);
      uint64_t v25 = a1[3];
      uint64_t v26 = **a3;
      if (*(float *)(v26 + 12 * v24 + 8) > *(float *)(v26 + 12 * v25 + 8))
      {
        uint64_t *v23 = v24;
        *(a2 - 1) = v25;
        uint64_t v27 = *v23;
        uint64_t v28 = *v22;
        float v29 = *(float *)(v26 + 12 * *v23 + 8);
        if (v29 > *(float *)(v26 + 12 * *v22 + 8))
        {
          uint64_t *v22 = v27;
          uint64_t *v23 = v28;
          uint64_t v30 = *v21;
          if (v29 > *(float *)(v26 + 12 * *v21 + 8))
          {
            a1[1] = v27;
            a1[2] = v30;
            uint64_t v31 = *a1;
            if (v29 > *(float *)(v26 + 12 * *a1 + 8))
            {
              *a1 = v27;
              a1[1] = v31;
            }
          }
        }
      }
      return 1;
    default:
      uint64_t v10 = a1 + 2;
      sub_25B5CD688(a1, a1 + 1, a1 + 2, **a3);
      uint64_t v11 = a1 + 3;
      if (a1 + 3 == a2) {
        return 1;
      }
      int v12 = 0;
      uint64_t v13 = **a3;
      uint64_t v14 = 24;
      break;
  }
  while (1)
  {
    uint64_t v15 = *v11;
    uint64_t v16 = *v10;
    float v17 = *(float *)(v13 + 12 * *v11 + 8);
    if (v17 > *(float *)(v13 + 12 * *v10 + 8))
    {
      uint64_t v18 = v14;
      while (1)
      {
        *(uint64_t *)((char *)a1 + v18) = v16;
        uint64_t v19 = v18 - 8;
        if (v18 == 8) {
          break;
        }
        uint64_t v16 = *(uint64_t *)((char *)a1 + v18 - 16);
        v18 -= 8;
        if (v17 <= *(float *)(v13 + 12 * v16 + 8))
        {
          uint64_t v20 = (uint64_t *)((char *)a1 + v19);
          goto LABEL_13;
        }
      }
      uint64_t v20 = a1;
LABEL_13:
      *uint64_t v20 = v15;
      if (++v12 == 8) {
        return v11 + 1 == a2;
      }
    }
    uint64_t v10 = v11;
    v14 += 8;
    if (++v11 == a2) {
      return 1;
    }
  }
}

void sub_25B5CDA90(uint64_t a1, uint64_t a2)
{
  if (*(char *)(a2 + 23) >= 0) {
    v2 = (const char *)a2;
  }
  else {
    v2 = *(const char **)a2;
  }
  v3 = fopen(v2, "rb");
  if (!v3)
  {
    uint64_t v4 = (void *)MEMORY[0x263F8C0F8];
    uint64_t v5 = sub_25B406B20(MEMORY[0x263F8C0F8], (uint64_t)"runtime_err in ", 15);
    uint64_t v6 = sub_25B406B20(v5, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/RoomScanCore/Sources/Utilities/wTensor/core/io/wnpy.hpp", 93);
    sub_25B406B20(v6, (uint64_t)" ", 1);
    float v7 = (void *)std::ostream::operator<<();
    uint64_t v8 = sub_25B406B20(v7, (uint64_t)" ", 1);
    uint64_t v9 = sub_25B406B20(v8, (uint64_t)"load_npy", 8);
    std::ios_base::getloc((const std::ios_base *)((char *)v9 + *(void *)(*v9 - 24)));
    uint64_t v10 = std::locale::use_facet(&v12, MEMORY[0x263F8C108]);
    ((void (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 10);
    std::locale::~locale(&v12);
    std::ostream::put();
    std::ostream::flush();
    std::operator+<char>();
    sub_25B5CF1E8((uint64_t)&v12);
    if (v13 < 0) {
      operator delete(v12.__locale_);
    }
    std::ios_base::getloc((const std::ios_base *)((char *)v4 + *(void *)(*v4 - 24)));
    uint64_t v11 = std::locale::use_facet(&v12, MEMORY[0x263F8C108]);
    ((void (*)(const std::locale::facet *, uint64_t))v11->__vftable[2].~facet_0)(v11, 10);
    std::locale::~locale(&v12);
    std::ostream::put();
    std::ostream::flush();
  }
  memset(v17, 0, sizeof(v17));
  uint64_t v16 = 0;
  BOOL v15 = 0;
  memset(&v14, 0, sizeof(v14));
  sub_25B5CF2E8(v3, (uint64_t)v17, (uint64_t)&v14, (uint64_t)&v16, &v15);
}

void sub_25B5CE548(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, std::locale a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  sub_25B5D1394(&a16);
  *float v21 = &unk_2708F21F8;
  uint64_t v24 = (std::__shared_weak_count *)v21[16];
  if (v24) {
    sub_25B404120(v24);
  }
  if (*(char *)(v22 - 105) < 0) {
    operator delete(*(void **)(v22 - 128));
  }
  uint64_t v25 = *(void **)(v22 - 88);
  if (v25)
  {
    *(void *)(v22 - 80) = v25;
    operator delete(v25);
  }
  _Unwind_Resume(a1);
}

void sub_25B5CE648(uint64_t a1, uint64_t a2)
{
  if (*(char *)(a2 + 23) >= 0) {
    v2 = (const char *)a2;
  }
  else {
    v2 = *(const char **)a2;
  }
  v3 = fopen(v2, "rb");
  if (!v3)
  {
    uint64_t v4 = (void *)MEMORY[0x263F8C0F8];
    uint64_t v5 = sub_25B406B20(MEMORY[0x263F8C0F8], (uint64_t)"runtime_err in ", 15);
    uint64_t v6 = sub_25B406B20(v5, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/RoomScanCore/Sources/Utilities/wTensor/core/io/wnpy.hpp", 93);
    sub_25B406B20(v6, (uint64_t)" ", 1);
    float v7 = (void *)std::ostream::operator<<();
    uint64_t v8 = sub_25B406B20(v7, (uint64_t)" ", 1);
    uint64_t v9 = sub_25B406B20(v8, (uint64_t)"load_npy", 8);
    std::ios_base::getloc((const std::ios_base *)((char *)v9 + *(void *)(*v9 - 24)));
    uint64_t v10 = std::locale::use_facet(&v12, MEMORY[0x263F8C108]);
    ((void (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 10);
    std::locale::~locale(&v12);
    std::ostream::put();
    std::ostream::flush();
    std::operator+<char>();
    sub_25B5CF1E8((uint64_t)&v12);
    if (v13 < 0) {
      operator delete(v12.__locale_);
    }
    std::ios_base::getloc((const std::ios_base *)((char *)v4 + *(void *)(*v4 - 24)));
    uint64_t v11 = std::locale::use_facet(&v12, MEMORY[0x263F8C108]);
    ((void (*)(const std::locale::facet *, uint64_t))v11->__vftable[2].~facet_0)(v11, 10);
    std::locale::~locale(&v12);
    std::ostream::put();
    std::ostream::flush();
  }
  memset(v17, 0, sizeof(v17));
  uint64_t v16 = 0;
  BOOL v15 = 0;
  memset(&v14, 0, sizeof(v14));
  sub_25B5CF2E8(v3, (uint64_t)v17, (uint64_t)&v14, (uint64_t)&v16, &v15);
}

void sub_25B5CF0E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, std::locale a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  sub_25B5D1394(&a16);
  *float v21 = &unk_2708F27E8;
  uint64_t v24 = (std::__shared_weak_count *)v21[16];
  if (v24) {
    sub_25B404120(v24);
  }
  if (*(char *)(v22 - 105) < 0) {
    operator delete(*(void **)(v22 - 128));
  }
  uint64_t v25 = *(void **)(v22 - 88);
  if (v25)
  {
    *(void *)(v22 - 80) = v25;
    operator delete(v25);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_25B5CF1E8(uint64_t a1)
{
  v2 = sub_25B406B20(MEMORY[0x263F8C0F8], (uint64_t)"err", 3);
  v3 = sub_25B406B20(v2, (uint64_t)" ", 1);
  int v4 = *(char *)(a1 + 23);
  if (v4 >= 0) {
    uint64_t v5 = a1;
  }
  else {
    uint64_t v5 = *(void *)a1;
  }
  if (v4 >= 0) {
    uint64_t v6 = *(unsigned __int8 *)(a1 + 23);
  }
  else {
    uint64_t v6 = *(void *)(a1 + 8);
  }
  float v7 = sub_25B406B20(v3, v5, v6);
  std::ios_base::getloc((const std::ios_base *)((char *)v7 + *(void *)(*v7 - 24)));
  uint64_t v8 = std::locale::use_facet(&v10, MEMORY[0x263F8C108]);
  ((void (*)(const std::locale::facet *, uint64_t))v8->__vftable[2].~facet_0)(v8, 10);
  std::locale::~locale(&v10);
  std::ostream::put();
  return std::ostream::flush();
}

void sub_25B5CF2D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
{
}

void sub_25B5CF2E8(FILE *__stream, uint64_t a2, uint64_t a3, uint64_t a4, BOOL *a5)
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  if (fread(__ptr, 1uLL, 0xAuLL, __stream) != 10)
  {
    float v7 = (void *)MEMORY[0x263F8C0F8];
    uint64_t v8 = sub_25B406B20(MEMORY[0x263F8C0F8], (uint64_t)"runtime_err in ", 15);
    uint64_t v9 = sub_25B406B20(v8, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/RoomScanCore/Sources/Utilities/wTensor/core/io/wnpy.hpp", 93);
    sub_25B406B20(v9, (uint64_t)" ", 1);
    std::locale v10 = (void *)std::ostream::operator<<();
    uint64_t v11 = sub_25B406B20(v10, (uint64_t)" ", 1);
    std::locale v12 = sub_25B406B20(v11, (uint64_t)"parse_npy_header", 16);
    std::ios_base::getloc((const std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
    char v13 = std::locale::use_facet((const std::locale *)&v81, MEMORY[0x263F8C108]);
    ((void (*)(const std::locale::facet *, uint64_t))v13->__vftable[2].~facet_0)(v13, 10);
    std::locale::~locale((std::locale *)&v81);
    std::ostream::put();
    std::ostream::flush();
    sub_25B53745C("err", "parse_npy_header: fread failed");
    std::ios_base::getloc((const std::ios_base *)((char *)v7 + *(void *)(*v7 - 24)));
    std::string v14 = std::locale::use_facet((const std::locale *)&v81, MEMORY[0x263F8C108]);
    ((void (*)(const std::locale::facet *, uint64_t))v14->__vftable[2].~facet_0)(v14, 10);
    std::locale::~locale((std::locale *)&v81);
    std::ostream::put();
    std::ostream::flush();
  }
  BOOL v15 = fgets(__ptr, 256, __stream);
  sub_25B403500(&__str, v15);
  uint64_t v16 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
  char v17 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
  std::string::size_type size = __str.__r_.__value_.__l.__size_;
  std::string::size_type v19 = __str.__r_.__value_.__r.__words[0];
  if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v20 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v20 = __str.__r_.__value_.__l.__size_;
  }
  if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_str = &__str;
  }
  else {
    p_str = (std::string *)__str.__r_.__value_.__r.__words[0];
  }
  if (p_str->__r_.__value_.__s.__data_[v20 - 1] != 10)
  {
    uint64_t v22 = sub_25B406B20(MEMORY[0x263F8C0F8], (uint64_t)"runtime_err in ", 15);
    v23 = sub_25B406B20(v22, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/RoomScanCore/Sources/Utilities/wTensor/core/io/wnpy.hpp", 93);
    sub_25B406B20(v23, (uint64_t)" ", 1);
    uint64_t v24 = (void *)std::ostream::operator<<();
    sub_25B406B20(v24, (uint64_t)" ", 1);
    sub_25B406B20(v24, (uint64_t)"parse_npy_header", 16);
    std::ios_base::getloc((const std::ios_base *)((char *)v24 + *(void *)(*v24 - 24)));
    uint64_t v25 = std::locale::use_facet((const std::locale *)&v81, MEMORY[0x263F8C108]);
    ((void (*)(const std::locale::facet *, uint64_t))v25->__vftable[2].~facet_0)(v25, 10);
    std::locale::~locale((std::locale *)&v81);
    std::ostream::put();
    std::ostream::flush();
    uint64_t v26 = sub_25B406B20(MEMORY[0x263F8C0F8], (uint64_t)"err", 3);
    uint64_t v27 = sub_25B406B20(v26, (uint64_t)" ", 1);
    uint64_t v28 = sub_25B406B20(v27, (uint64_t)" ", 1);
    std::ios_base::getloc((const std::ios_base *)((char *)v28 + *(void *)(*v28 - 24)));
    float v29 = std::locale::use_facet((const std::locale *)&v81, MEMORY[0x263F8C108]);
    ((void (*)(const std::locale::facet *, uint64_t))v29->__vftable[2].~facet_0)(v29, 10);
    std::locale::~locale((std::locale *)&v81);
    std::ostream::put();
    uint64_t v30 = (void *)MEMORY[0x263F8C0F8];
    std::ostream::flush();
    std::ios_base::getloc((const std::ios_base *)((char *)v30 + *(void *)(*v30 - 24)));
    uint64_t v31 = std::locale::use_facet((const std::locale *)&v81, MEMORY[0x263F8C108]);
    ((void (*)(const std::locale::facet *, uint64_t))v31->__vftable[2].~facet_0)(v31, 10);
    std::locale::~locale((std::locale *)&v81);
    std::ostream::put();
    std::ostream::flush();
    uint64_t v16 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
    std::string::size_type size = __str.__r_.__value_.__l.__size_;
    std::string::size_type v19 = __str.__r_.__value_.__r.__words[0];
    char v17 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
  }
  if (v17 >= 0)
  {
    uint64_t v32 = &__str;
  }
  else
  {
    uint64_t v16 = size;
    uint64_t v32 = (std::string *)v19;
  }
  if (v16 < 13) {
    goto LABEL_25;
  }
  uint64_t v33 = (char *)v32 + v16;
  BOOL v34 = v32;
  while (1)
  {
    uint64_t v35 = (char *)memchr(v34, 102, v16 - 12);
    if (!v35) {
      goto LABEL_25;
    }
    if (*(void *)v35 == 0x5F6E617274726F66 && *(void *)(v35 + 5) == 0x726564726F5F6E61) {
      break;
    }
    BOOL v34 = (std::string *)(v35 + 1);
    uint64_t v16 = v33 - (char *)v34;
    if (v33 - (char *)v34 < 13) {
      goto LABEL_25;
    }
  }
  if (v35 == v33 || (uint64_t v37 = v35 - (char *)v32, v35 - (char *)v32 == -1))
  {
LABEL_25:
    uint64_t v38 = sub_25B406B20(MEMORY[0x263F8C0F8], (uint64_t)"runtime_err in ", 15);
    uint64_t v39 = sub_25B406B20(v38, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/RoomScanCore/Sources/Utilities/wTensor/core/io/wnpy.hpp", 93);
    sub_25B406B20(v39, (uint64_t)" ", 1);
    uint64_t v40 = (void *)std::ostream::operator<<();
    sub_25B406B20(v40, (uint64_t)" ", 1);
    sub_25B406B20(v40, (uint64_t)"parse_npy_header", 16);
    std::ios_base::getloc((const std::ios_base *)((char *)v40 + *(void *)(*v40 - 24)));
    uint64_t v41 = std::locale::use_facet((const std::locale *)&v81, MEMORY[0x263F8C108]);
    ((void (*)(const std::locale::facet *, uint64_t))v41->__vftable[2].~facet_0)(v41, 10);
    std::locale::~locale((std::locale *)&v81);
    std::ostream::put();
    std::ostream::flush();
    uint64_t v42 = sub_25B406B20(MEMORY[0x263F8C0F8], (uint64_t)"err", 3);
    v43 = sub_25B406B20(v42, (uint64_t)" ", 1);
    uint64_t v44 = sub_25B406B20(v43, (uint64_t)"parse_npy_header: failed to find 'fortran_order'", 48);
    std::ios_base::getloc((const std::ios_base *)((char *)v44 + *(void *)(*v44 - 24)));
    uint64_t v45 = std::locale::use_facet((const std::locale *)&v81, MEMORY[0x263F8C108]);
    ((void (*)(const std::locale::facet *, uint64_t))v45->__vftable[2].~facet_0)(v45, 10);
    std::locale::~locale((std::locale *)&v81);
    std::ostream::put();
    v46 = (void *)MEMORY[0x263F8C0F8];
    std::ostream::flush();
    std::ios_base::getloc((const std::ios_base *)((char *)v46 + *(void *)(*v46 - 24)));
    v47 = std::locale::use_facet((const std::locale *)&v81, MEMORY[0x263F8C108]);
    ((void (*)(const std::locale::facet *, uint64_t))v47->__vftable[2].~facet_0)(v47, 10);
    std::locale::~locale((std::locale *)&v81);
    std::ostream::put();
    std::ostream::flush();
    uint64_t v37 = -1;
  }
  std::string::basic_string(&v81, &__str, v37 + 16, 4uLL, (std::allocator<char> *)&v75);
  std::string::size_type v48 = HIBYTE(v81.__r_.__value_.__r.__words[2]);
  int v49 = SHIBYTE(v81.__r_.__value_.__r.__words[2]);
  if ((v81.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type v48 = v81.__r_.__value_.__l.__size_;
  }
  if (v48 == 4)
  {
    uint64_t v50 = (std::string *)v81.__r_.__value_.__r.__words[0];
    if ((v81.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v50 = &v81;
    }
    BOOL v51 = LODWORD(v50->__r_.__value_.__l.__data_) == 1702195796;
  }
  else
  {
    BOOL v51 = 0;
  }
  *a5 = v51;
  if (v49 < 0) {
    operator delete(v81.__r_.__value_.__l.__data_);
  }
  if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    int64_t v52 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
  }
  else {
    int64_t v52 = __str.__r_.__value_.__l.__size_;
  }
  if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    float v53 = &__str;
  }
  else {
    float v53 = (std::string *)__str.__r_.__value_.__r.__words[0];
  }
  if (v52 < 1)
  {
    uint64_t v62 = -1;
  }
  else
  {
    uint64_t v54 = v53;
    uint64_t v55 = (char *)v53 + v52;
    int64_t v56 = v52;
    uint64_t v57 = v53;
    do
    {
      uint64_t v58 = memchr(v57, 40, v56);
      if (!v58) {
        break;
      }
      v59 = v58;
      if (*v58 == 40) {
        goto LABEL_47;
      }
      uint64_t v57 = (std::string *)(v58 + 1);
      int64_t v56 = v55 - (v59 + 1);
    }
    while (v56 > 0);
    v59 = (char *)v53 + v52;
LABEL_47:
    uint64_t v60 = v59 - (char *)v53;
    do
    {
      uint64_t v61 = (char *)memchr(v54, 41, v52);
      if (!v61) {
        break;
      }
      if (*v61 == 41) {
        goto LABEL_52;
      }
      uint64_t v54 = (std::string *)(v61 + 1);
      int64_t v52 = v55 - (v61 + 1);
    }
    while (v52 > 0);
    uint64_t v61 = v55;
LABEL_52:
    if (v61 == v55) {
      uint64_t v62 = -1;
    }
    else {
      uint64_t v62 = v61 - (char *)v53;
    }
    if (v59 != v55 && v60 != -1)
    {
LABEL_60:
      if (v62 == -1)
      {
        int64_t v69 = sub_25B406B20(MEMORY[0x263F8C0F8], (uint64_t)"runtime_err in ", 15);
        uint64_t v70 = sub_25B406B20(v69, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/RoomScanCore/Sources/Utilities/wTensor/core/io/wnpy.hpp", 93);
        sub_25B406B20(v70, (uint64_t)" ", 1);
        v71 = (void *)MEMORY[0x263F8C0F8];
        uint64_t v72 = (void *)std::ostream::operator<<();
        sub_25B406B20(v72, (uint64_t)" ", 1);
        sub_25B406B20(v72, (uint64_t)"parse_npy_header", 16);
        std::ios_base::getloc((const std::ios_base *)((char *)v72 + *(void *)(*v72 - 24)));
        uint64_t v73 = std::locale::use_facet((const std::locale *)&v81, MEMORY[0x263F8C108]);
        ((void (*)(const std::locale::facet *, uint64_t))v73->__vftable[2].~facet_0)(v73, 10);
        std::locale::~locale((std::locale *)&v81);
        std::ostream::put();
        std::ostream::flush();
        sub_25B5D1478("parse_npy_header: failed to find ')'");
        std::ios_base::getloc((const std::ios_base *)((char *)v71 + *(void *)(*v71 - 24)));
        v74 = std::locale::use_facet((const std::locale *)&v81, MEMORY[0x263F8C108]);
        ((void (*)(const std::locale::facet *, uint64_t))v74->__vftable[2].~facet_0)(v74, 10);
        std::locale::~locale((std::locale *)&v81);
        std::ostream::put();
        std::ostream::flush();
      }
      std::string::basic_string(&v79, &__str, v60 + 1, v62 + ~v60, (std::allocator<char> *)&v81);
      sub_25B5D3B6C(&v75);
      uint64_t v78 = 0;
      long long v77 = 0u;
      long long v76 = 0u;
      sub_25B5D3BCC();
    }
  }
  uint64_t v63 = sub_25B406B20(MEMORY[0x263F8C0F8], (uint64_t)"runtime_err in ", 15);
  uint64_t v64 = sub_25B406B20(v63, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/RoomScanCore/Sources/Utilities/wTensor/core/io/wnpy.hpp", 93);
  sub_25B406B20(v64, (uint64_t)" ", 1);
  v65 = (void *)MEMORY[0x263F8C0F8];
  int64_t v66 = (void *)std::ostream::operator<<();
  sub_25B406B20(v66, (uint64_t)" ", 1);
  sub_25B406B20(v66, (uint64_t)"parse_npy_header", 16);
  std::ios_base::getloc((const std::ios_base *)((char *)v66 + *(void *)(*v66 - 24)));
  v67 = std::locale::use_facet((const std::locale *)&v81, MEMORY[0x263F8C108]);
  ((void (*)(const std::locale::facet *, uint64_t))v67->__vftable[2].~facet_0)(v67, 10);
  std::locale::~locale((std::locale *)&v81);
  std::ostream::put();
  std::ostream::flush();
  sub_25B5D1478("parse_npy_header: failed to find '('");
  std::ios_base::getloc((const std::ios_base *)((char *)v65 + *(void *)(*v65 - 24)));
  int64_t v68 = std::locale::use_facet((const std::locale *)&v81, MEMORY[0x263F8C108]);
  ((void (*)(const std::locale::facet *, uint64_t))v68->__vftable[2].~facet_0)(v68, 10);
  std::locale::~locale((std::locale *)&v81);
  std::ostream::put();
  std::ostream::flush();
  uint64_t v60 = -1;
  goto LABEL_60;
}

void sub_25B5D0868(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,std::locale a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,void *a33,uint64_t a34,int a35,__int16 a36,char a37,char a38,void *__p,uint64_t a40,int a41,__int16 a42,char a43,char a44,std::locale a45,uint64_t a46,int a47,__int16 a48,char a49,char a50)
{
  if (a44 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_25B5D0998(uint64_t a1, char *__src, void *a3)
{
  uint64_t v6 = *(char **)(a1 + 8);
  uint64_t v7 = a1 + 16;
  unint64_t v8 = *(void *)(a1 + 16);
  if ((unint64_t)v6 >= v8)
  {
    char v13 = *(char **)a1;
    unint64_t v14 = ((uint64_t)&v6[-*(void *)a1] >> 3) + 1;
    if (v14 >> 61) {
      sub_25B3FBC4C();
    }
    uint64_t v15 = __src - v13;
    uint64_t v16 = (__src - v13) >> 3;
    uint64_t v17 = v8 - (void)v13;
    if (v17 >> 2 > v14) {
      unint64_t v14 = v17 >> 2;
    }
    if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v18 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v18 = v14;
    }
    uint64_t v30 = v7;
    if (v18)
    {
      std::string::size_type v20 = (char *)sub_25B3FCAD4(v18);
    }
    else
    {
      std::string::size_type v20 = 0;
      uint64_t v19 = 0;
    }
    float v21 = &v20[8 * v16];
    __p = v20;
    uint64_t v27 = v21;
    float v29 = &v20[8 * v19];
    if (v16 == v19)
    {
      if (v15 < 1)
      {
        if (v13 == __src) {
          unint64_t v23 = 1;
        }
        else {
          unint64_t v23 = v15 >> 2;
        }
        uint64_t v24 = (char *)sub_25B3FCAD4(v23);
        float v21 = &v24[8 * (v23 >> 2)];
        __p = v24;
        uint64_t v27 = v21;
        float v29 = &v24[8 * v25];
        if (v20) {
          operator delete(v20);
        }
      }
      else
      {
        unint64_t v22 = v16 + 2;
        if (v16 >= -1) {
          unint64_t v22 = v16 + 1;
        }
        v21 -= 8 * (v22 >> 1);
        uint64_t v27 = v21;
      }
    }
    *(void *)float v21 = *a3;
    uint64_t v28 = v21 + 8;
    sub_25B4A6EA4((void **)a1, (uint64_t)&__p, __src);
    if (__p) {
      operator delete(__p);
    }
  }
  else if (__src == v6)
  {
    *(void *)__src = *a3;
    *(void *)(a1 + 8) = __src + 8;
  }
  else
  {
    uint64_t v9 = __src + 8;
    std::locale v10 = v6 - 8;
    uint64_t v11 = *(void **)(a1 + 8);
    while (v10 < v6)
    {
      uint64_t v12 = *(void *)v10;
      v10 += 8;
      *v11++ = v12;
    }
    *(void *)(a1 + 8) = v11;
    if (v6 != v9) {
      memmove(&v6[-8 * ((v6 - v9) >> 3)], __src, v6 - v9);
    }
    *(void *)__src = *a3;
  }
}

void sub_25B5D0B50(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_25B5D0B68(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  *(_OWORD *)(a1 + 16) = 0u;
  *(void *)(a1 + 32) = 0;
  *(_OWORD *)a1 = 0u;
  sub_25B46BD74((void *)(a1 + 16), *(const void **)a2, *(void *)(a2 + 8), (uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 3);
  *(void *)(a1 + 40) = a3;
  *(unsigned char *)(a1 + 48) = a4;
  *(void *)(a1 + 56) = 1;
  uint64_t v7 = *(uint64_t **)(a1 + 16);
  uint64_t v8 = *(void *)(a1 + 24) - (void)v7;
  if (v8)
  {
    unint64_t v9 = v8 >> 3;
    if (v9 <= 1) {
      unint64_t v9 = 1;
    }
    uint64_t v10 = 1;
    do
    {
      uint64_t v11 = *v7++;
      v10 *= v11;
      *(void *)(a1 + 56) = v10;
      --v9;
    }
    while (v9);
  }
  operator new();
}

void sub_25B5D0CB4(_Unwind_Exception *a1)
{
  uint64_t v5 = *(void **)v3;
  if (*(void *)v3)
  {
    *(void *)(v3 + 8) = v5;
    operator delete(v5);
  }
  MEMORY[0x261163EE0](v3, 0x10C402FEFCB83);
  uint64_t v6 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 24) = v6;
    operator delete(v6);
  }
  uint64_t v7 = *(std::__shared_weak_count **)(v1 + 8);
  if (v7) {
    sub_25B404120(v7);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_25B5D0D24()
{
  v0 = sub_25B406B20(MEMORY[0x263F8C0F8], (uint64_t)"err", 3);
  uint64_t v1 = sub_25B406B20(v0, (uint64_t)" ", 1);
  v2 = sub_25B406B20(v1, (uint64_t)"load: fread failed", 18);
  std::ios_base::getloc((const std::ios_base *)((char *)v2 + *(void *)(*v2 - 24)));
  uint64_t v3 = std::locale::use_facet(&v5, MEMORY[0x263F8C108]);
  ((void (*)(const std::locale::facet *, uint64_t))v3->__vftable[2].~facet_0)(v3, 10);
  std::locale::~locale(&v5);
  std::ostream::put();
  return std::ostream::flush();
}

void sub_25B5D0E00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
{
}

void *sub_25B5D0E14(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    BOOL result = sub_25B3FCA18(result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      BOOL result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_25B5D0E74(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *sub_25B5D0E90(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    BOOL result = sub_25B40040C(result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      BOOL result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_25B5D0EF0(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *sub_25B5D0F0C(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    std::locale v5 = result;
    if (a4 >> 61) {
      sub_25B3FBC4C();
    }
    BOOL result = operator new(8 * a4);
    size_t v8 = result;
    void *v5 = result;
    v5[1] = result;
    v5[2] = &result[a4];
    size_t v9 = a3 - (void)a2;
    if (v9) {
      BOOL result = memcpy(result, a2, v9);
    }
    v5[1] = (char *)v8 + v9;
  }
  return result;
}

void sub_25B5D0F94(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *sub_25B5D0FB0(void *result, const void *a2, uint64_t a3, size_t __sz)
{
  if (__sz)
  {
    uint64_t v6 = result;
    BOOL result = sub_25B46E9EC(result, __sz);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      BOOL result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_25B5D1010(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *sub_25B5D102C(void *result, const void *a2, uint64_t a3, uint64_t a4)
{
  if (a4)
  {
    std::locale v5 = result;
    if (a4 < 0) {
      sub_25B3FBC4C();
    }
    BOOL result = operator new(2 * a4);
    size_t v8 = result;
    void *v5 = result;
    v5[1] = result;
    v5[2] = (char *)result + 2 * a4;
    size_t v9 = a3 - (void)a2;
    if (v9) {
      BOOL result = memcpy(result, a2, v9);
    }
    v5[1] = (char *)v8 + v9;
  }
  return result;
}

void sub_25B5D10B0(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *sub_25B5D10CC(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    std::locale v5 = result;
    if (a4 >> 61) {
      sub_25B3FBC4C();
    }
    BOOL result = operator new(8 * a4);
    size_t v8 = result;
    void *v5 = result;
    v5[1] = result;
    v5[2] = &result[a4];
    size_t v9 = a3 - (void)a2;
    if (v9) {
      BOOL result = memcpy(result, a2, v9);
    }
    v5[1] = (char *)v8 + v9;
  }
  return result;
}

void sub_25B5D1154(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *sub_25B5D1170(void *result, const void *a2, uint64_t a3, size_t __sz)
{
  if (__sz)
  {
    uint64_t v6 = result;
    BOOL result = sub_25B46E9EC(result, __sz);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      BOOL result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_25B5D11D0(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *sub_25B5D11EC(void *result, const void *a2, uint64_t a3, uint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    BOOL result = sub_25B4E5020(result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      BOOL result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_25B5D124C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *sub_25B5D1268(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    std::locale v5 = result;
    if (a4 >> 62) {
      sub_25B3FBC4C();
    }
    BOOL result = operator new(4 * a4);
    size_t v8 = result;
    void *v5 = result;
    v5[1] = result;
    v5[2] = (char *)result + 4 * a4;
    size_t v9 = a3 - (void)a2;
    if (v9) {
      BOOL result = memcpy(result, a2, v9);
    }
    v5[1] = (char *)v8 + v9;
  }
  return result;
}

void sub_25B5D12F0(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *sub_25B5D130C(void *result, unsigned char *a2, unsigned char *a3, uint64_t a4)
{
  if (a4)
  {
    uint64_t v7 = result;
    sub_25B40DE18(result, a4);
    return sub_25B4955CC(v7, a2, a3, a4);
  }
  return result;
}

void sub_25B5D137C(_Unwind_Exception *exception_object)
{
  if (*v1) {
    operator delete(*v1);
  }
  _Unwind_Resume(exception_object);
}

void *sub_25B5D1394(void *a1)
{
  v2 = (void *)a1[2];
  if (v2)
  {
    a1[3] = v2;
    operator delete(v2);
  }
  uint64_t v3 = (std::__shared_weak_count *)a1[1];
  if (v3) {
    sub_25B404120(v3);
  }
  return a1;
}

void **sub_25B5D13D4(void **result)
{
  if (result)
  {
    uint64_t v1 = result;
    v2 = *result;
    if (v2)
    {
      v1[1] = v2;
      operator delete(v2);
    }
    JUMPOUT(0x261163EE0);
  }
  return result;
}

void **sub_25B5D1434(uint64_t a1)
{
  return sub_25B5D13D4(*(void ***)(a1 + 24));
}

void sub_25B5D143C(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x261163EE0);
}

uint64_t sub_25B5D1478(const char *a1)
{
  v2 = (void *)MEMORY[0x263F8C0F8];
  uint64_t v3 = sub_25B406B20(MEMORY[0x263F8C0F8], (uint64_t)"err", 3);
  sub_25B406B20(v3, (uint64_t)" ", 1);
  size_t v4 = strlen(a1);
  sub_25B406B20(v2, (uint64_t)a1, v4);
  std::ios_base::getloc((const std::ios_base *)((char *)v2 + *(void *)(*v2 - 24)));
  std::locale v5 = std::locale::use_facet(&v7, MEMORY[0x263F8C108]);
  ((void (*)(const std::locale::facet *, uint64_t))v5->__vftable[2].~facet_0)(v5, 10);
  std::locale::~locale(&v7);
  std::ostream::put();
  return std::ostream::flush();
}

void sub_25B5D155C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
{
}

void *sub_25B5D1570(void *result, char *a2, char *a3, unint64_t a4)
{
  if (a4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_25B40044C();
  }
  std::locale v7 = result;
  if (a4 > 0x16)
  {
    uint64_t v8 = (a4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a4 | 7) != 0x17) {
      uint64_t v8 = a4 | 7;
    }
    uint64_t v9 = v8 + 1;
    BOOL result = operator new(v8 + 1);
    v7[1] = a4;
    v7[2] = v9 | 0x8000000000000000;
    void *v7 = result;
    std::locale v7 = result;
  }
  else
  {
    *((unsigned char *)result + 23) = a4;
  }
  while (a2 != a3)
  {
    char v10 = *a2++;
    *(unsigned char *)std::locale v7 = v10;
    std::locale v7 = (void *)((char *)v7 + 1);
  }
  *(unsigned char *)std::locale v7 = 0;
  return result;
}

void sub_25B5D1614(std::locale *this)
{
  locale = (std::__shared_weak_count *)this[6].__locale_;
  if (locale) {
    sub_25B404120(locale);
  }

  std::locale::~locale(this);
}

uint64_t sub_25B5D1654(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, int a5, char a6)
{
  int v7 = a5;
  uint64_t v10 = a2;
  if ((*(_WORD *)(a1 + 24) & 0x1F0) == 0)
  {
    return sub_25B5D2944(a1, a2, a3, a4, a5, a6);
  }
  v157 = (char *)(a3 - a2);
  if (!*(_DWORD *)(a1 + 28))
  {
    long long v159 = 0u;
    int64x2_t v160 = 0u;
    *(_OWORD *)v158 = 0u;
    uint64_t v73 = *(void *)(a1 + 40);
    if (v73)
    {
      *(_DWORD *)v161 = 0;
      memset(&v161[8], 0, 48);
      *(_OWORD *)__p = 0uLL;
      memset(v163, 0, 21);
      sub_25B5D3498(v158, (uint64_t)v161);
      if (__p[0]) {
        operator delete(__p[0]);
      }
      if (*(void *)&v161[32]) {
        operator delete(*(void **)&v161[32]);
      }
      v144 = a4;
      v74 = v158[1];
      unint64_t v75 = v160.i64[1] + v160.i64[0] - 1;
      unint64_t v76 = v75 / 0x2A;
      uint64_t v77 = *((void *)v158[1] + v75 / 0x2A);
      unint64_t v78 = 3 * (v75 % 0x2A);
      uint64_t v79 = v77 + 32 * v78;
      *(_DWORD *)uint64_t v79 = 0;
      *(void *)(v79 + 8) = v10;
      *(void *)(v74[v76] + 32 * v78 + 16) = v10;
      *(void *)(v74[v76] + 32 * v78 + 24) = a3;
      sub_25B5D30BC((char **)(v74[v76] + 32 * v78 + 56), *(unsigned int *)(a1 + 32));
      char v152 = 0;
      unsigned int v80 = 0;
      uint64_t v81 = v160.i64[1];
      uint64_t v82 = v158[1];
      unint64_t v83 = v160.i64[1] + v160.i64[0] - 1;
      unint64_t v84 = v83 / 0x2A;
      unint64_t v85 = 3 * (v83 % 0x2A);
      *(void *)(*((void *)v158[1] + v84) + 32 * v85 + 80) = v73;
      uint64_t v86 = v82[v84] + 32 * v85;
      *(_DWORD *)(v86 + 88) = v7;
      *(unsigned char *)(v86 + 92) = a6;
      v150 = 0;
      while (2)
      {
        if ((++v80 & 0xFFF) == 0 && (int)(v80 >> 12) >= (int)v157) {
          sub_25B5D31D4();
        }
        unint64_t v88 = v81 + v160.i64[0] - 1;
        uint64_t v89 = *((void *)v158[1] + v88 / 0x2A);
        unint64_t v90 = v88 % 0x2A;
        uint64_t v91 = v89 + 96 * (v88 % 0x2A);
        uint64_t v93 = (void *)(v91 + 80);
        uint64_t v92 = *(void *)(v91 + 80);
        if (v92) {
          (*(void (**)(uint64_t, unint64_t))(*(void *)v92 + 16))(v92, v89 + 96 * v90);
        }
        switch(*(_DWORD *)v91)
        {
          case 0xFFFFFC18:
            uint64_t v94 = *(void *)(v89 + 96 * v90 + 16);
            if ((v7 & 0x20) != 0 && v94 == v10) {
              goto LABEL_189;
            }
            uint64_t v95 = v94 - *(void *)(v89 + 96 * v90 + 8);
            v96 = v150;
            if ((v152 & ((uint64_t)v150 >= v95)) == 0) {
              v96 = (char *)v95;
            }
            if (v96 != v157)
            {
              v150 = v96;
              sub_25B5D393C(v158);
              char v152 = 1;
              goto LABEL_190;
            }
            v97 = (void **)v158[1];
            uint64_t v98 = (unsigned char *)v159;
            if ((void *)v159 == v158[1])
            {
              uint64_t v98 = v158[1];
            }
            else
            {
              uint64_t v99 = (char *)v158[1] + 8 * (v160.i64[0] / 0x2AuLL);
              uint64_t v100 = (void *)(*v99 + 96 * (v160.i64[0] % 0x2AuLL));
              unint64_t v101 = *((void *)v158[1] + (v160.i64[1] + v160.i64[0]) / 0x2AuLL)
                   + 96 * ((v160.i64[1] + v160.i64[0]) % 0x2AuLL);
              if (v100 != (void *)v101)
              {
                do
                {
                  sub_25B5D3270(v100);
                  v100 += 12;
                  if ((void *)((char *)v100 - *v99) == (void *)4032)
                  {
                    v102 = (void *)v99[1];
                    ++v99;
                    uint64_t v100 = v102;
                  }
                }
                while (v100 != (void *)v101);
                v97 = (void **)v158[1];
                uint64_t v98 = (unsigned char *)v159;
              }
            }
            v160.i64[1] = 0;
            unint64_t v133 = v98 - (unsigned char *)v97;
            if (v133 >= 0x11)
            {
              do
              {
                operator delete(*v97);
                v97 = (void **)((char *)v158[1] + 8);
                v158[1] = v97;
                unint64_t v133 = v159 - (void)v97;
              }
              while ((void)v159 - (void)v97 > 0x10uLL);
            }
            if (v133 >> 3 == 1)
            {
              uint64_t v134 = 21;
            }
            else
            {
              if (v133 >> 3 != 2) {
                goto LABEL_177;
              }
              uint64_t v134 = 42;
            }
            v160.i64[0] = v134;
LABEL_177:
            char v152 = 1;
            v150 = v157;
LABEL_190:
            uint64_t v81 = v160.i64[1];
            if (v160.i64[1]) {
              continue;
            }
            if ((v152 & 1) == 0) {
              goto LABEL_193;
            }
            uint64_t v142 = *v144;
            *(void *)uint64_t v142 = v10;
            *(void *)(v142 + 8) = &v150[v10];
            uint64_t v71 = 1;
            *(unsigned char *)(v142 + 16) = 1;
            break;
          case 0xFFFFFC19:
          case 0xFFFFFC1E:
          case 0xFFFFFC21:
            goto LABEL_190;
          case 0xFFFFFC1D:
            unint64_t v103 = v160.i64[0];
            v104 = (char *)v158[1];
            v105 = (char *)v159;
            if (!v160.i64[0])
            {
              unint64_t v108 = (uint64_t)(v159 - (unint64_t)v158[1]) >> 3;
              uint64_t v109 = 42 * v108 - 1;
              if ((void *)v159 == v158[1]) {
                uint64_t v109 = 0;
              }
              if ((unint64_t)(v109 - v160.i64[1]) < 0x2A)
              {
                if (v108 >= (uint64_t)(*((void *)&v159 + 1) - (unint64_t)v158[0]) >> 3)
                {
                  if (*((void **)&v159 + 1) == v158[0]) {
                    unint64_t v110 = 1;
                  }
                  else {
                    unint64_t v110 = (uint64_t)(*((void *)&v159 + 1) - (unint64_t)v158[0]) >> 2;
                  }
                  *(void *)&v161[32] = (char *)&v159 + 8;
                  *(void *)v161 = sub_25B3FCAD4(v110);
                  *(void *)&v161[8] = *(void *)v161;
                  *(void *)&v161[16] = *(void *)v161;
                  *(void *)&v161[24] = *(void *)v161 + 8 * v111;
                  int v156 = v7;
                  uint64_t v154 = v10;
                  *(void *)&long long v164 = operator new(0xFC0uLL);
                  sub_25B468624(v161, &v164);
                  v112 = (uint64_t *)v158[1];
                  for (i = *(char **)&v161[16]; v112 != (uint64_t *)v159; *(void *)&v161[16] += 8)
                  {
                    if (i == *(char **)&v161[24])
                    {
                      v114 = *(char **)&v161[8];
                      v115 = *(void **)v161;
                      if (*(void *)&v161[8] <= *(void *)v161)
                      {
                        if (i == *(char **)v161) {
                          unint64_t v122 = 1;
                        }
                        else {
                          unint64_t v122 = (uint64_t)&i[-*(void *)v161] >> 2;
                        }
                        v123 = (char *)sub_25B3FCAD4(v122);
                        uint64_t v126 = i - v114;
                        BOOL v125 = i == v114;
                        i = &v123[8 * (v122 >> 2)];
                        if (!v125)
                        {
                          i = &v123[8 * (v122 >> 2) + (v126 & 0xFFFFFFFFFFFFFFF8)];
                          uint64_t v127 = 8 * (v126 >> 3);
                          v128 = &v123[8 * (v122 >> 2)];
                          do
                          {
                            uint64_t v129 = *(void *)v114;
                            v114 += 8;
                            *(void *)v128 = v129;
                            v128 += 8;
                            v127 -= 8;
                          }
                          while (v127);
                        }
                        *(void *)v161 = v123;
                        *(void *)&v161[8] = &v123[8 * (v122 >> 2)];
                        *(void *)&v161[16] = i;
                        *(void *)&v161[24] = &v123[8 * v124];
                        if (v115) {
                          operator delete(v115);
                        }
                      }
                      else
                      {
                        uint64_t v116 = (uint64_t)(*(void *)&v161[8] - *(void *)v161) >> 3;
                        if (v116 >= -1) {
                          uint64_t v117 = v116 + 1;
                        }
                        else {
                          uint64_t v117 = v116 + 2;
                        }
                        uint64_t v118 = *(void *)&v161[8] - 8 * (v117 >> 1);
                        size_t v119 = (size_t)&i[-*(void *)&v161[8]];
                        if (i != *(char **)&v161[8])
                        {
                          v120 = (void *)(*(void *)&v161[8] - 8 * (v117 >> 1));
                          memmove(v120, *(const void **)&v161[8], v119);
                          uint64_t v118 = (uint64_t)v120;
                          i = v114;
                        }
                        v121 = &i[-8 * (v117 >> 1)];
                        i = (char *)(v118 + v119);
                        *(void *)&v161[8] = v121;
                        *(void *)&v161[16] = v118 + v119;
                      }
                    }
                    uint64_t v130 = *v112++;
                    *(void *)i = v130;
                    i = (char *)(*(void *)&v161[16] + 8);
                  }
                  v131 = v158[0];
                  *(_OWORD *)v158 = *(_OWORD *)v161;
                  *(void *)&long long v159 = i;
                  *((void *)&v159 + 1) = *(void *)&v161[24];
                  uint64_t v132 = 21;
                  if (&i[-*(void *)&v161[8]] != (char *)8) {
                    uint64_t v132 = v160.i64[0] + 42;
                  }
                  v160.i64[0] = v132;
                  uint64_t v10 = v154;
                  int v7 = v156;
                  if (v131) {
                    operator delete(v131);
                  }
                }
                else
                {
                  if (v158[1] == v158[0])
                  {
                    *(void *)v161 = operator new(0xFC0uLL);
                    sub_25B468624(v158, v161);
                    *(void *)v161 = *(void *)(v159 - 8);
                    *(void *)&long long v159 = v159 - 8;
                  }
                  else
                  {
                    *(void *)v161 = operator new(0xFC0uLL);
                  }
                  sub_25B46850C((uint64_t)v158, v161);
                  uint64_t v135 = 21;
                  if ((void)v159 - (unint64_t)v158[1] != 8) {
                    uint64_t v135 = v160.i64[0] + 42;
                  }
                  v160.i64[0] = v135;
                }
              }
              else
              {
                v160.i64[0] = 42;
                *(void *)v161 = *(void *)(v159 - 8);
                *(void *)&long long v159 = v159 - 8;
                sub_25B46850C((uint64_t)v158, v161);
              }
              unint64_t v103 = v160.i64[0];
              v104 = (char *)v158[1];
              v105 = (char *)v159;
            }
            v136 = &v104[8 * (v103 / 0x2A)];
            unint64_t v137 = *(void *)v136 + 96 * (v103 % 0x2A);
            if (v105 == v104) {
              uint64_t v138 = 0;
            }
            else {
              uint64_t v138 = v137;
            }
            if (v138 == *(void *)v136) {
              uint64_t v138 = *((void *)v136 - 1) + 4032;
            }
            long long v139 = *(_OWORD *)(v91 + 16);
            *(_OWORD *)(v138 - 96) = *(_OWORD *)v91;
            *(_OWORD *)(v138 - 80) = v139;
            uint64_t v140 = v89 + 96 * v90;
            *(void *)(v138 - 56) = 0;
            *(void *)(v138 - 48) = 0;
            *(void *)(v138 - 64) = 0;
            *(_OWORD *)(v138 - 64) = *(_OWORD *)(v140 + 32);
            *(void *)(v138 - 48) = *(void *)(v140 + 48);
            *(void *)(v140 + 32) = 0;
            *(void *)(v140 + 40) = 0;
            *(void *)(v140 + 48) = 0;
            *(void *)(v138 - 40) = 0;
            *(void *)(v138 - 32) = 0;
            *(void *)(v138 - 24) = 0;
            *(_OWORD *)(v138 - 40) = *(_OWORD *)(v140 + 56);
            *(void *)(v138 - 24) = *(void *)(v140 + 72);
            *(void *)(v140 + 56) = 0;
            *(void *)(v140 + 64) = 0;
            *(void *)(v140 + 72) = 0;
            uint64_t v141 = *v93;
            *(void *)(v138 - 11) = *(void *)(v91 + 85);
            *(void *)(v138 - 16) = v141;
            int64x2_t v160 = vaddq_s64(v160, (int64x2_t)xmmword_25B5F1300);
            goto LABEL_189;
          case 0xFFFFFC1F:
LABEL_189:
            sub_25B5D393C(v158);
            goto LABEL_190;
          case 0xFFFFFC20:
            long long v106 = *(_OWORD *)(v91 + 16);
            *(_OWORD *)v161 = *(_OWORD *)v91;
            *(_OWORD *)&v161[16] = v106;
            memset(&v161[32], 0, 24);
            sub_25B5D32C8(&v161[32], *(long long **)(v89 + 96 * v90 + 32), *(long long **)(v89 + 96 * v90 + 40), 0xAAAAAAAAAAAAAAABLL* ((uint64_t)(*(void *)(v89 + 96 * v90 + 40) - *(void *)(v89 + 96 * v90 + 32)) >> 3));
            __p[0] = 0;
            __p[1] = 0;
            v163[0] = 0;
            sub_25B5D3348((char *)__p, *(uint64_t **)(v89 + 96 * v90 + 56), *(uint64_t **)(v89 + 96 * v90 + 64), (uint64_t)(*(void *)(v89 + 96 * v90 + 64) - *(void *)(v89 + 96 * v90 + 56)) >> 4);
            uint64_t v107 = *v93;
            *(void *)((char *)&v163[1] + 5) = *(void *)(v91 + 85);
            v163[1] = v107;
            (*(void (**)(void, uint64_t, uint64_t))(*(void *)*v93 + 24))(*v93, 1, v91);
            (*(void (**)(void, void, unsigned char *))(*(void *)v163[1] + 24))(v163[1], 0, v161);
            sub_25B5D3498(v158, (uint64_t)v161);
            if (__p[0])
            {
              __p[1] = __p[0];
              operator delete(__p[0]);
            }
            if (*(void *)&v161[32])
            {
              *(void *)&v161[40] = *(void *)&v161[32];
              operator delete(*(void **)&v161[32]);
            }
            goto LABEL_190;
          default:
            sub_25B5D33BC();
        }
        break;
      }
    }
    else
    {
LABEL_193:
      uint64_t v71 = 0;
    }
    sub_25B5D39F0((uint64_t)v158);
    return v71;
  }
  v158[0] = 0;
  v158[1] = 0;
  *(void *)&long long v159 = 0;
  uint64_t v12 = *(void *)(a1 + 40);
  if (!v12)
  {
    uint64_t v71 = 0;
    goto LABEL_201;
  }
  *(void *)&long long v164 = a3;
  *((void *)&v164 + 1) = a3;
  char v165 = 0;
  *(_DWORD *)v161 = 0;
  memset(&v161[8], 0, 48);
  *(_OWORD *)__p = 0u;
  memset(v163, 0, 21);
  v158[1] = sub_25B5D2D7C(v158, (uint64_t)v161);
  if (__p[0]) {
    operator delete(__p[0]);
  }
  if (*(void *)&v161[32]) {
    operator delete(*(void **)&v161[32]);
  }
  v143 = a4;
  char v13 = (void **)v158[1];
  *((_DWORD *)v158[1] - 24) = 0;
  *(v13 - 11) = (void *)v10;
  *(v13 - 10) = (void *)v10;
  uint64_t v153 = v10;
  *(v13 - 9) = (void *)a3;
  sub_25B5D2F30(v13 - 8, *(unsigned int *)(a1 + 28), &v164);
  sub_25B5D30BC((char **)v158[1] - 5, *(unsigned int *)(a1 + 32));
  unint64_t v14 = 0;
  uint64_t v147 = 0;
  v148 = 0;
  v149 = 0;
  v151 = 0;
  uint64_t v146 = 0;
  uint64_t v15 = 0;
  char v16 = 0;
  unsigned int v17 = 0;
  unint64_t v18 = v158[1];
  *((void *)v158[1] - 2) = v12;
  char v155 = v7;
  *(v18 - 2) = v7;
  *((unsigned char *)v18 - 4) = a6;
  while (2)
  {
    BOOL v19 = (++v17 & 0xFFF) != 0 || (int)(v17 >> 12) < (int)v157;
    if (!v19) {
      sub_25B5D31D4();
    }
    float v21 = v18 - 4;
    uint64_t v20 = *((void *)v18 - 2);
    unint64_t v22 = v18 - 24;
    if (v20) {
      (*(void (**)(uint64_t, _DWORD *))(*(void *)v20 + 16))(v20, v18 - 24);
    }
    switch(*(_DWORD *)v22)
    {
      case 0xFFFFFC18:
        uint64_t v23 = *((void *)v18 - 10);
        if ((v155 & 0x20) != 0 && v23 == v153) {
          goto LABEL_19;
        }
        uint64_t v30 = (char *)(v23 - *((void *)v18 - 11));
        if ((v16 & ((uint64_t)v15 >= (uint64_t)v30)) != 0)
        {
          uint64_t v31 = v151;
          goto LABEL_88;
        }
        uint64_t v33 = (long long *)*((void *)v18 - 8);
        uint64_t v32 = (long long *)*((void *)v18 - 7);
        unint64_t v34 = 0xAAAAAAAAAAAAAAABLL * (((char *)v32 - (char *)v33) >> 3);
        if (0xAAAAAAAAAAAAAAABLL * ((v147 - (uint64_t)v148) >> 3) < v34)
        {
          if (v148)
          {
            operator delete(v148);
            uint64_t v147 = 0;
          }
          if (v34 > 0xAAAAAAAAAAAAAAALL) {
            goto LABEL_206;
          }
          unint64_t v35 = 0x5555555555555556 * (v147 >> 3);
          if (v35 <= v34) {
            unint64_t v35 = 0xAAAAAAAAAAAAAAABLL * (((char *)v32 - (char *)v33) >> 3);
          }
          unint64_t v36 = 0xAAAAAAAAAAAAAAABLL * (v147 >> 3) >= 0x555555555555555 ? 0xAAAAAAAAAAAAAAALL : v35;
          if (v36 > 0xAAAAAAAAAAAAAAALL) {
LABEL_206:
          }
            sub_25B3FBC4C();
          uint64_t v37 = (char *)sub_25B413D74(v36);
          unint64_t v14 = v37;
          uint64_t v39 = v37;
          while (v33 != v32)
          {
            long long v40 = *v33;
            *((void *)v39 + 2) = *((void *)v33 + 2);
            *(_OWORD *)uint64_t v39 = v40;
            v39 += 24;
            uint64_t v33 = (long long *)((char *)v33 + 24);
          }
          uint64_t v147 = (uint64_t)&v37[24 * v38];
          v148 = v37;
          goto LABEL_55;
        }
        if (0xAAAAAAAAAAAAAAABLL * ((v14 - v148) >> 3) >= v34)
        {
          if (v33 == v32)
          {
            unint64_t v14 = v148;
            uint64_t v39 = v148;
          }
          else
          {
            unint64_t v14 = v148;
            uint64_t v39 = v148;
            do
            {
              *(_OWORD *)uint64_t v39 = *v33;
              v39[16] = *((unsigned char *)v33 + 16);
              v39 += 24;
              uint64_t v33 = (long long *)((char *)v33 + 24);
            }
            while (v33 != v32);
          }
LABEL_55:
          uint64_t v45 = v39 - v14;
          goto LABEL_56;
        }
        uint64_t v41 = (long long *)((char *)v33 + 8 * ((v14 - v148) >> 3));
        if (v14 != v148)
        {
          uint64_t v42 = v148;
          do
          {
            *(_OWORD *)uint64_t v42 = *v33;
            v42[16] = *((unsigned char *)v33 + 16);
            uint64_t v33 = (long long *)((char *)v33 + 24);
            v42 += 24;
          }
          while (v33 != v41);
        }
        v43 = v14;
        while (v41 != v32)
        {
          long long v44 = *v41;
          *((void *)v43 + 2) = *((void *)v41 + 2);
          *(_OWORD *)v43 = v44;
          v43 += 24;
          uint64_t v41 = (long long *)((char *)v41 + 24);
        }
        uint64_t v45 = v43 - v14;
LABEL_56:
        uint64_t v145 = v45;
        v46 = (char *)*((void *)v18 - 5);
        v47 = (char *)*((void *)v18 - 4);
        unint64_t v48 = (v47 - v46) >> 4;
        if (v48 > (v146 - (uint64_t)v149) >> 4)
        {
          if (v149)
          {
            operator delete(v149);
            uint64_t v146 = 0;
          }
          if (v47 - v46 < 0) {
            goto LABEL_205;
          }
          uint64_t v49 = v146 >> 3;
          if (v146 >> 3 <= v48) {
            uint64_t v49 = (v47 - v46) >> 4;
          }
          unint64_t v50 = (unint64_t)v146 >= 0x7FFFFFFFFFFFFFF0 ? 0xFFFFFFFFFFFFFFFLL : v49;
          if (v50 >> 60) {
LABEL_205:
          }
            sub_25B3FBC4C();
          BOOL v51 = (char *)sub_25B3FFAEC(v50);
          float v53 = v51;
          while (v46 != v47)
          {
            *(void *)float v53 = *(void *)v46;
            *((void *)v53 + 1) = *((void *)v46 + 1);
            v53 += 16;
            v46 += 16;
          }
          uint64_t v146 = (uint64_t)&v51[16 * v52];
          v59 = (char *)(v53 - v51);
          v149 = v51;
          goto LABEL_86;
        }
        unint64_t v54 = (v151 - v149) >> 4;
        if (v54 >= v48)
        {
          if (v46 == v47)
          {
            uint64_t v61 = v149;
            uint64_t v60 = v149;
          }
          else
          {
            uint64_t v60 = v149;
            do
            {
              *(void *)uint64_t v60 = *(void *)v46;
              *((void *)v60 + 1) = *((void *)v46 + 1);
              v60 += 16;
              v46 += 16;
            }
            while (v46 != v47);
            uint64_t v61 = v149;
          }
          v59 = (char *)(v60 - v61);
          BOOL v51 = v61;
LABEL_86:
          uint64_t v58 = v145;
          goto LABEL_87;
        }
        uint64_t v55 = &v46[16 * v54];
        BOOL v51 = v151;
        if (v151 != v149)
        {
          int64_t v56 = v149;
          do
          {
            *(void *)int64_t v56 = *(void *)v46;
            *((void *)v56 + 1) = *((void *)v46 + 1);
            v46 += 16;
            v56 += 16;
          }
          while (v46 != v55);
        }
        uint64_t v57 = v151;
        if (v55 == v47)
        {
          uint64_t v58 = v145;
        }
        else
        {
          uint64_t v58 = v145;
          do
          {
            *(void *)uint64_t v57 = *(void *)v55;
            *((void *)v57 + 1) = *((void *)v55 + 1);
            v57 += 16;
            v55 += 16;
          }
          while (v55 != v47);
        }
        v59 = (char *)(v57 - v151);
LABEL_87:
        v14 += v58;
        uint64_t v31 = &v59[(void)v51];
        uint64_t v15 = v30;
LABEL_88:
        uint64_t v62 = v158[1];
        v151 = v31;
        if (v15 == v157)
        {
          uint64_t v63 = v158[0];
          while (v62 != v63)
          {
            v62 -= 12;
            sub_25B5D3270(v62);
          }
          v158[1] = v63;
          char v16 = 1;
          uint64_t v15 = v157;
        }
        else
        {
          uint64_t v64 = (char *)v158[1] - 96;
          sub_25B5D3270((void *)v158[1] - 12);
          v158[1] = v64;
          char v16 = 1;
        }
LABEL_94:
        unint64_t v18 = v158[1];
        if (v158[0] != v158[1]) {
          continue;
        }
        if (v16)
        {
          uint64_t v65 = *v143;
          *(void *)uint64_t v65 = v153;
          *(void *)(v65 + 8) = &v15[v153];
          *(unsigned char *)(v65 + 16) = 1;
          int64_t v66 = v148;
          if (v14 != v148)
          {
            v67 = v148 + 16;
            unsigned int v68 = 1;
            do
            {
              uint64_t v69 = v65 + 24 * v68;
              *(_OWORD *)uint64_t v69 = *((_OWORD *)v67 - 1);
              char v70 = *v67;
              v67 += 24;
              *(unsigned char *)(v69 + 16) = v70;
              BOOL v19 = 0xAAAAAAAAAAAAAAABLL * ((v14 - v148) >> 3) > v68++;
            }
            while (v19);
          }
          uint64_t v71 = 1;
        }
        else
        {
          uint64_t v71 = 0;
          int64_t v66 = v148;
        }
        if (v149) {
          operator delete(v149);
        }
        if (v66) {
          operator delete(v66);
        }
LABEL_201:
        *(void *)v161 = v158;
        sub_25B5D3414((void ***)v161);
        return v71;
      case 0xFFFFFC1D:
      case 0xFFFFFC1E:
      case 0xFFFFFC21:
        goto LABEL_94;
      case 0xFFFFFC1F:
LABEL_19:
        uint64_t v24 = (char *)v158[1] - 96;
        sub_25B5D3270((void *)v158[1] - 12);
        v158[1] = v24;
        goto LABEL_94;
      case 0xFFFFFC20:
        long long v25 = *((_OWORD *)v18 - 5);
        *(_OWORD *)v161 = *v22;
        *(_OWORD *)&v161[16] = v25;
        memset(&v161[32], 0, 24);
        sub_25B5D32C8(&v161[32], *((long long **)v18 - 8), *((long long **)v18 - 7), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)v18 - 7) - *((void *)v18 - 8)) >> 3));
        __p[0] = 0;
        __p[1] = 0;
        v163[0] = 0;
        sub_25B5D3348((char *)__p, *((uint64_t **)v18 - 5), *((uint64_t **)v18 - 4), (uint64_t)(*((void *)v18 - 4) - *((void *)v18 - 5)) >> 4);
        uint64_t v26 = *v21;
        *(void *)((char *)&v163[1] + 5) = *(void *)((char *)v18 - 11);
        v163[1] = v26;
        (*(void (**)(void, uint64_t, _DWORD *))(*(void *)*v21 + 24))(*v21, 1, v18 - 24);
        (*(void (**)(void, void, unsigned char *))(*(void *)v163[1] + 24))(v163[1], 0, v161);
        uint64_t v27 = (char *)v158[1];
        if (v158[1] >= (void *)v159)
        {
          v158[1] = sub_25B5D2D7C(v158, (uint64_t)v161);
          if (__p[0])
          {
            __p[1] = __p[0];
            operator delete(__p[0]);
          }
        }
        else
        {
          long long v28 = *(_OWORD *)&v161[16];
          *(_OWORD *)v158[1] = *(_OWORD *)v161;
          *((_OWORD *)v27 + 1) = v28;
          *((void *)v27 + 4) = 0;
          *((void *)v27 + 5) = 0;
          *((void *)v27 + 6) = 0;
          *((void *)v27 + 7) = 0;
          *((_OWORD *)v27 + 2) = *(_OWORD *)&v161[32];
          *((void *)v27 + 6) = *(void *)&v161[48];
          memset(&v161[32], 0, 24);
          *((void *)v27 + 8) = 0;
          *((void *)v27 + 9) = 0;
          *(_OWORD *)(v27 + 56) = *(_OWORD *)__p;
          *((void *)v27 + 9) = v163[0];
          __p[0] = 0;
          __p[1] = 0;
          v163[0] = 0;
          uint64_t v29 = v163[1];
          *(void *)(v27 + 85) = *(void *)((char *)&v163[1] + 5);
          *((void *)v27 + 10) = v29;
          v158[1] = v27 + 96;
        }
        if (*(void *)&v161[32])
        {
          *(void *)&v161[40] = *(void *)&v161[32];
          operator delete(*(void **)&v161[32]);
        }
        goto LABEL_94;
      default:
        sub_25B5D33BC();
    }
  }
}

void sub_25B5D2650(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *__p,uint64_t a30,uint64_t a31,uint64_t a32,void *a33,uint64_t a34,uint64_t a35,void *a36,uint64_t a37)
{
  operator delete(v37);
  if (__p) {
    operator delete(__p);
  }
  sub_25B5D39F0((uint64_t)&a23);
  _Unwind_Resume(a1);
}

char *sub_25B5D27D0(char **a1, unint64_t a2, long long *a3)
{
  uint64_t v6 = (uint64_t)a1[2];
  BOOL result = *a1;
  if (0xAAAAAAAAAAAAAAABLL * ((v6 - (uint64_t)result) >> 3) >= a2)
  {
    uint64_t v15 = a1[1];
    unint64_t v16 = (v15 - result) / 24;
    if (v16 >= a2) {
      uint64_t v17 = a2;
    }
    else {
      uint64_t v17 = (v15 - result) / 24;
    }
    if (v17)
    {
      unint64_t v18 = result;
      do
      {
        *(_OWORD *)unint64_t v18 = *a3;
        v18[16] = *((unsigned char *)a3 + 16);
        v18 += 24;
        --v17;
      }
      while (v17);
    }
    if (a2 <= v16)
    {
      a1[1] = &result[24 * a2];
    }
    else
    {
      BOOL v19 = &v15[24 * (a2 - v16)];
      uint64_t v20 = 24 * a2 - 24 * v16;
      do
      {
        long long v21 = *a3;
        *((void *)v15 + 2) = *((void *)a3 + 2);
        *(_OWORD *)uint64_t v15 = v21;
        v15 += 24;
        v20 -= 24;
      }
      while (v20);
      a1[1] = v19;
    }
  }
  else
  {
    if (result)
    {
      a1[1] = result;
      operator delete(result);
      uint64_t v6 = 0;
      *a1 = 0;
      a1[1] = 0;
      a1[2] = 0;
    }
    if (a2 > 0xAAAAAAAAAAAAAAALL) {
      sub_25B3FBC4C();
    }
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * (v6 >> 3);
    uint64_t v9 = 2 * v8;
    if (2 * v8 <= a2) {
      uint64_t v9 = a2;
    }
    if (v8 >= 0x555555555555555) {
      unint64_t v10 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v10 = v9;
    }
    BOOL result = sub_25B413D24(a1, v10);
    uint64_t v11 = a1[1];
    uint64_t v12 = &v11[24 * a2];
    uint64_t v13 = 24 * a2;
    do
    {
      long long v14 = *a3;
      *((void *)v11 + 2) = *((void *)a3 + 2);
      *(_OWORD *)uint64_t v11 = v14;
      v11 += 24;
      v13 -= 24;
    }
    while (v13);
    a1[1] = v12;
  }
  return result;
}

uint64_t sub_25B5D2944(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, int a5, char a6)
{
  v43 = 0;
  long long v44 = 0;
  unint64_t v45 = 0;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    *(void *)&long long v41 = a3;
    *((void *)&v41 + 1) = a3;
    char v42 = 0;
    *(_DWORD *)uint64_t v38 = 0;
    memset(&v38[8], 0, 48);
    *(_OWORD *)__p = 0u;
    memset(v40, 0, 21);
    long long v44 = sub_25B5D2D7C((void **)&v43, (uint64_t)v38);
    if (__p[0]) {
      operator delete(__p[0]);
    }
    if (*(void *)&v38[32]) {
      operator delete(*(void **)&v38[32]);
    }
    uint64_t v37 = a4;
    uint64_t v13 = v44;
    *((_DWORD *)v44 - 24) = 0;
    *((void *)v13 - 11) = a2;
    *((void *)v13 - 10) = a2;
    *((void *)v13 - 9) = a3;
    sub_25B5D2F30((void **)v13 - 8, *(unsigned int *)(a1 + 28), &v41);
    sub_25B5D30BC((char **)v44 - 5, *(unsigned int *)(a1 + 32));
    long long v14 = v44;
    *((void *)v44 - 2) = v6;
    *((_DWORD *)v14 - 2) = a5;
    *(v14 - 4) = a6;
    unsigned int v15 = 1;
    while (2)
    {
      if ((v15 & 0xFFF) != 0 || (int)(v15 >> 12) < (int)a3 - (int)a2)
      {
        uint64_t v17 = v14 - 16;
        uint64_t v16 = *((void *)v14 - 2);
        unint64_t v18 = v14 - 96;
        if (v16) {
          (*(void (**)(uint64_t, char *))(*(void *)v16 + 16))(v16, v14 - 96);
        }
        switch(*(_DWORD *)v18)
        {
          case 0xFFFFFC18:
            uint64_t v19 = *((void *)v14 - 10);
            if ((a5 & 0x20) != 0 && v19 == a2) {
              goto LABEL_14;
            }
            uint64_t v28 = *v37;
            *(void *)uint64_t v28 = a2;
            *(void *)(v28 + 8) = v19;
            *(unsigned char *)(v28 + 16) = 1;
            uint64_t v29 = *((void *)v14 - 8);
            uint64_t v30 = *((void *)v14 - 7) - v29;
            if (v30)
            {
              unint64_t v31 = 0xAAAAAAAAAAAAAAABLL * (v30 >> 3);
              uint64_t v32 = (unsigned char *)(v29 + 16);
              unsigned int v33 = 1;
              do
              {
                uint64_t v34 = v28 + 24 * v33;
                *(_OWORD *)uint64_t v34 = *((_OWORD *)v32 - 1);
                char v35 = *v32;
                v32 += 24;
                *(unsigned char *)(v34 + 16) = v35;
              }
              while (v31 > v33++);
            }
            uint64_t v26 = 1;
            goto LABEL_23;
          case 0xFFFFFC1D:
          case 0xFFFFFC1E:
          case 0xFFFFFC21:
            goto LABEL_21;
          case 0xFFFFFC1F:
LABEL_14:
            uint64_t v20 = v44 - 96;
            sub_25B5D3270((void *)v44 - 12);
            long long v44 = v20;
            goto LABEL_21;
          case 0xFFFFFC20:
            long long v21 = *((_OWORD *)v14 - 5);
            *(_OWORD *)uint64_t v38 = *(_OWORD *)v18;
            *(_OWORD *)&v38[16] = v21;
            memset(&v38[32], 0, 24);
            sub_25B5D32C8(&v38[32], *((long long **)v14 - 8), *((long long **)v14 - 7), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)v14 - 7) - *((void *)v14 - 8)) >> 3));
            __p[0] = 0;
            __p[1] = 0;
            v40[0] = 0;
            sub_25B5D3348((char *)__p, *((uint64_t **)v14 - 5), *((uint64_t **)v14 - 4), (uint64_t)(*((void *)v14 - 4) - *((void *)v14 - 5)) >> 4);
            uint64_t v22 = *(void *)v17;
            *(void *)((char *)&v40[1] + 5) = *(void *)(v14 - 11);
            v40[1] = v22;
            (*(void (**)(void, uint64_t, char *))(**(void **)v17 + 24))(*(void *)v17, 1, v14 - 96);
            (*(void (**)(void, void, unsigned char *))(*(void *)v40[1] + 24))(v40[1], 0, v38);
            uint64_t v23 = v44;
            if ((unint64_t)v44 >= v45)
            {
              long long v44 = sub_25B5D2D7C((void **)&v43, (uint64_t)v38);
              if (__p[0])
              {
                __p[1] = __p[0];
                operator delete(__p[0]);
              }
            }
            else
            {
              long long v24 = *(_OWORD *)&v38[16];
              *(_OWORD *)long long v44 = *(_OWORD *)v38;
              *((_OWORD *)v23 + 1) = v24;
              *((void *)v23 + 4) = 0;
              *((void *)v23 + 5) = 0;
              *((void *)v23 + 6) = 0;
              *((void *)v23 + 7) = 0;
              *((_OWORD *)v23 + 2) = *(_OWORD *)&v38[32];
              *((void *)v23 + 6) = *(void *)&v38[48];
              memset(&v38[32], 0, 24);
              *((void *)v23 + 8) = 0;
              *((void *)v23 + 9) = 0;
              *(_OWORD *)(v23 + 56) = *(_OWORD *)__p;
              *((void *)v23 + 9) = v40[0];
              __p[0] = 0;
              __p[1] = 0;
              v40[0] = 0;
              uint64_t v25 = v40[1];
              *(void *)(v23 + 85) = *(void *)((char *)&v40[1] + 5);
              *((void *)v23 + 10) = v25;
              long long v44 = v23 + 96;
            }
            if (*(void *)&v38[32])
            {
              *(void *)&v38[40] = *(void *)&v38[32];
              operator delete(*(void **)&v38[32]);
            }
LABEL_21:
            long long v14 = v44;
            ++v15;
            if (v43 == v44) {
              goto LABEL_22;
            }
            continue;
          default:
            sub_25B5D33BC();
        }
      }
      break;
    }
    sub_25B5D31D4();
  }
LABEL_22:
  uint64_t v26 = 0;
LABEL_23:
  *(void *)uint64_t v38 = &v43;
  sub_25B5D3414((void ***)v38);
  return v26;
}

void sub_25B5D2CFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16)
{
  sub_25B5D322C(&a11);
  a11 = v16 - 112;
  sub_25B5D3414((void ***)&a11);
  _Unwind_Resume(a1);
}

char *sub_25B5D2D7C(void **a1, uint64_t a2)
{
  unint64_t v2 = 0xAAAAAAAAAAAAAAABLL * (((unsigned char *)a1[1] - (unsigned char *)*a1) >> 5);
  unint64_t v3 = v2 + 1;
  if (v2 + 1 > 0x2AAAAAAAAAAAAAALL) {
    sub_25B3FBC4C();
  }
  if (0x5555555555555556 * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 5) > v3) {
    unint64_t v3 = 0x5555555555555556 * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 5);
  }
  if (0xAAAAAAAAAAAAAAABLL * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 5) >= 0x155555555555555) {
    unint64_t v6 = 0x2AAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v6 = v3;
  }
  if (v6)
  {
    if (v6 > 0x2AAAAAAAAAAAAAALL) {
      sub_25B3FA70C();
    }
    int v7 = (char *)operator new(96 * v6);
  }
  else
  {
    int v7 = 0;
  }
  long long v8 = *(_OWORD *)(a2 + 16);
  uint64_t v9 = &v7[96 * v2];
  *(_OWORD *)uint64_t v9 = *(_OWORD *)a2;
  *((_OWORD *)v9 + 1) = v8;
  unint64_t v10 = &v7[96 * v6];
  *((_OWORD *)v9 + 2) = *(_OWORD *)(a2 + 32);
  *((void *)v9 + 6) = *(void *)(a2 + 48);
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = 0;
  *(void *)(v9 + 85) = *(void *)(a2 + 85);
  uint64_t v11 = *(void *)(a2 + 72);
  uint64_t v12 = *(void *)(a2 + 80);
  *((void *)v9 + 9) = 0;
  *((void *)v9 + 10) = v12;
  *(_OWORD *)(v9 + 56) = *(_OWORD *)(a2 + 56);
  *((void *)v9 + 9) = v11;
  *(void *)(a2 + 64) = 0;
  *(void *)(a2 + 72) = 0;
  *(void *)(a2 + 48) = 0;
  *(void *)(a2 + 56) = 0;
  uint64_t v13 = v9 + 96;
  long long v14 = (char *)*a1;
  unsigned int v15 = (char *)a1[1];
  if (v15 == *a1)
  {
    *a1 = v9;
    a1[1] = v13;
    a1[2] = v10;
  }
  else
  {
    uint64_t v16 = 0;
    do
    {
      uint64_t v17 = &v9[v16];
      unint64_t v18 = &v15[v16];
      long long v19 = *(_OWORD *)&v15[v16 - 80];
      *((_OWORD *)v17 - 6) = *(_OWORD *)&v15[v16 - 96];
      *((_OWORD *)v17 - 5) = v19;
      *((void *)v17 - 6) = 0;
      *((_OWORD *)v17 - 4) = *(_OWORD *)&v15[v16 - 64];
      *((void *)v17 - 6) = *(void *)&v15[v16 - 48];
      *((void *)v18 - 8) = 0;
      *((void *)v18 - 7) = 0;
      *((void *)v18 - 6) = 0;
      *((void *)v17 - 3) = 0;
      *(_OWORD *)(v17 - 40) = *(_OWORD *)&v15[v16 - 40];
      *((void *)v17 - 3) = *(void *)&v15[v16 - 24];
      *((void *)v18 - 5) = 0;
      *((void *)v18 - 4) = 0;
      *((void *)v18 - 3) = 0;
      uint64_t v20 = *(void *)&v15[v16 - 16];
      *(void *)(v17 - 11) = *(void *)&v15[v16 - 11];
      *((void *)v17 - 2) = v20;
      v16 -= 96;
    }
    while (&v15[v16] != v14);
    unsigned int v15 = (char *)*a1;
    long long v21 = (char *)a1[1];
    *a1 = &v9[v16];
    a1[1] = v13;
    a1[2] = v10;
    while (v21 != v15)
    {
      v21 -= 96;
      sub_25B5D3270(v21);
    }
  }
  if (v15) {
    operator delete(v15);
  }
  return v13;
}

void sub_25B5D2F30(void **a1, unint64_t a2, long long *a3)
{
  unint64_t v6 = (char *)*a1;
  std::locale v5 = (char *)a1[1];
  unint64_t v7 = 0xAAAAAAAAAAAAAAABLL * ((v5 - (unsigned char *)*a1) >> 3);
  unint64_t v8 = a2 - v7;
  if (a2 <= v7)
  {
    if (a2 < v7) {
      a1[1] = &v6[24 * a2];
    }
  }
  else
  {
    unint64_t v10 = a1[2];
    if (0xAAAAAAAAAAAAAAABLL * ((v10 - v5) >> 3) >= v8)
    {
      uint64_t v25 = &v5[24 * v8];
      uint64_t v26 = 24 * a2 - 8 * ((v5 - (unsigned char *)*a1) >> 3);
      do
      {
        long long v27 = *a3;
        *((void *)v5 + 2) = *((void *)a3 + 2);
        *(_OWORD *)std::locale v5 = v27;
        v5 += 24;
        v26 -= 24;
      }
      while (v26);
      a1[1] = v25;
    }
    else
    {
      if (a2 > 0xAAAAAAAAAAAAAAALL) {
        sub_25B3FBC4C();
      }
      unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * ((v10 - v6) >> 3);
      uint64_t v12 = 2 * v11;
      if (2 * v11 <= a2) {
        uint64_t v12 = a2;
      }
      if (v11 >= 0x555555555555555) {
        unint64_t v13 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v13 = v12;
      }
      long long v14 = (char *)sub_25B413D74(v13);
      uint64_t v16 = &v14[24 * v7];
      uint64_t v17 = &v14[24 * a2];
      unint64_t v18 = v16;
      uint64_t v19 = 24 * a2 - 24 * v7;
      do
      {
        long long v20 = *a3;
        *((void *)v18 + 2) = *((void *)a3 + 2);
        *(_OWORD *)unint64_t v18 = v20;
        v18 += 24;
        v19 -= 24;
      }
      while (v19);
      long long v21 = &v14[24 * v15];
      uint64_t v23 = (char *)*a1;
      uint64_t v22 = (char *)a1[1];
      if (v22 != *a1)
      {
        do
        {
          long long v24 = *(_OWORD *)(v22 - 24);
          *((void *)v16 - 1) = *((void *)v22 - 1);
          *(_OWORD *)(v16 - 24) = v24;
          v16 -= 24;
          v22 -= 24;
        }
        while (v22 != v23);
        uint64_t v22 = (char *)*a1;
      }
      *a1 = v16;
      a1[1] = v17;
      a1[2] = v21;
      if (v22)
      {
        operator delete(v22);
      }
    }
  }
}

void sub_25B5D30BC(char **a1, unint64_t a2)
{
  unint64_t v3 = *a1;
  size_t v4 = a1[1];
  unint64_t v5 = (v4 - *a1) >> 4;
  if (a2 <= v5)
  {
    if (a2 >= v5) {
      return;
    }
    unint64_t v18 = &v3[16 * a2];
    goto LABEL_19;
  }
  unint64_t v6 = a2 - v5;
  unint64_t v7 = a1[2];
  if (a2 - v5 <= (v7 - v4) >> 4)
  {
    bzero(a1[1], 16 * v6);
    unint64_t v18 = &v4[16 * v6];
LABEL_19:
    a1[1] = v18;
    return;
  }
  if (a2 >> 60) {
    sub_25B3FBC4C();
  }
  uint64_t v8 = v7 - v3;
  uint64_t v9 = v8 >> 3;
  if (v8 >> 3 <= a2) {
    uint64_t v9 = a2;
  }
  if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF0) {
    unint64_t v10 = 0xFFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v10 = v9;
  }
  unint64_t v11 = (char *)sub_25B3FFAEC(v10);
  uint64_t v12 = &v11[16 * v5];
  long long v14 = &v11[16 * v13];
  bzero(v12, 16 * v6);
  uint64_t v15 = &v12[16 * v6];
  uint64_t v17 = *a1;
  uint64_t v16 = a1[1];
  if (v16 != *a1)
  {
    do
    {
      *((_OWORD *)v12 - 1) = *((_OWORD *)v16 - 1);
      v12 -= 16;
      v16 -= 16;
    }
    while (v16 != v17);
    uint64_t v16 = *a1;
  }
  *a1 = v12;
  a1[1] = v15;
  a1[2] = v14;
  if (v16)
  {
    operator delete(v16);
  }
}

void sub_25B5D31D4()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x261163C10](exception, 12);
  __cxa_throw(exception, (struct type_info *)&unk_2708F23C8, MEMORY[0x263F8C098]);
}

void sub_25B5D3218(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void *sub_25B5D322C(void *a1)
{
  unint64_t v2 = (void *)a1[7];
  if (v2)
  {
    a1[8] = v2;
    operator delete(v2);
  }
  unint64_t v3 = (void *)a1[4];
  if (v3)
  {
    a1[5] = v3;
    operator delete(v3);
  }
  return a1;
}

void sub_25B5D3270(void *a1)
{
  unint64_t v2 = (void *)a1[7];
  if (v2)
  {
    a1[8] = v2;
    operator delete(v2);
  }
  unint64_t v3 = (void *)a1[4];
  if (v3)
  {
    a1[5] = v3;
    operator delete(v3);
  }
}

char *sub_25B5D32C8(char *result, long long *a2, long long *a3, unint64_t a4)
{
  if (a4)
  {
    unint64_t v6 = result;
    BOOL result = sub_25B413D24(result, a4);
    uint64_t v7 = *((void *)v6 + 1);
    while (a2 != a3)
    {
      long long v8 = *a2;
      *(void *)(v7 + 16) = *((void *)a2 + 2);
      *(_OWORD *)uint64_t v7 = v8;
      v7 += 24;
      a2 = (long long *)((char *)a2 + 24);
    }
    *((void *)v6 + 1) = v7;
  }
  return result;
}

void sub_25B5D332C(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_25B5D3348(char *result, uint64_t *a2, uint64_t *a3, unint64_t a4)
{
  if (a4)
  {
    unint64_t v6 = result;
    BOOL result = sub_25B40F000(result, a4);
    uint64_t v7 = (void *)*((void *)v6 + 1);
    while (a2 != a3)
    {
      uint64_t v8 = *a2;
      uint64_t v9 = a2[1];
      a2 += 2;
      void *v7 = v8;
      v7[1] = v9;
      v7 += 2;
    }
    *((void *)v6 + 1) = v7;
  }
  return result;
}

void sub_25B5D33A0(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_25B5D33BC()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x261163C10](exception, 16);
  __cxa_throw(exception, (struct type_info *)&unk_2708F23C8, MEMORY[0x263F8C098]);
}

void sub_25B5D3400(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_25B5D3414(void ***a1)
{
  uint64_t v1 = *a1;
  unint64_t v2 = **a1;
  if (v2)
  {
    size_t v4 = v1[1];
    unint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v4 -= 12;
        sub_25B5D3270(v4);
      }
      while (v4 != v2);
      unint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

__n128 sub_25B5D3498(void *a1, uint64_t a2)
{
  size_t v4 = (char *)a1[2];
  unint64_t v5 = (char *)a1[1];
  if (v4 == v5) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = 42 * ((v4 - v5) >> 3) - 1;
  }
  unint64_t v7 = a1[4];
  unint64_t v8 = a1[5] + v7;
  if (v6 == v8)
  {
    if (v7 < 0x2A)
    {
      unint64_t v22 = (v4 - v5) >> 3;
      uint64_t v23 = (char *)a1[3];
      uint64_t v24 = (uint64_t)&v23[-*a1];
      if (v22 >= v24 >> 3)
      {
        if (v23 == (char *)*a1) {
          unint64_t v25 = 1;
        }
        else {
          unint64_t v25 = v24 >> 2;
        }
        uint64_t v87 = a1 + 3;
        *(void *)&long long v85 = sub_25B3FCAD4(v25);
        *((void *)&v85 + 1) = v85 + 8 * v22;
        *(void *)&long long v86 = *((void *)&v85 + 1);
        *((void *)&v86 + 1) = v85 + 8 * v26;
        unint64_t v84 = operator new(0xFC0uLL);
        sub_25B468624(&v85, &v84);
        uint64_t v27 = a1[2];
        uint64_t v29 = (char *)*((void *)&v85 + 1);
        uint64_t v28 = (char *)v85;
        unint64_t v31 = (char *)*((void *)&v86 + 1);
        uint64_t v30 = (char *)v86;
        while (v27 != a1[1])
        {
          if (v29 == v28)
          {
            if (v30 >= v31)
            {
              if (v31 == v28) {
                unint64_t v37 = 1;
              }
              else {
                unint64_t v37 = (v31 - v28) >> 2;
              }
              uint64_t v38 = (char *)sub_25B3FCAD4(v37);
              long long v40 = v38;
              uint64_t v29 = &v38[(2 * v37 + 6) & 0xFFFFFFFFFFFFFFF8];
              uint64_t v41 = v30 - v28;
              BOOL v35 = v30 == v28;
              uint64_t v30 = v29;
              if (!v35)
              {
                uint64_t v30 = &v29[v41 & 0xFFFFFFFFFFFFFFF8];
                uint64_t v42 = 8 * (v41 >> 3);
                v43 = v29;
                long long v44 = v28;
                do
                {
                  uint64_t v45 = *(void *)v44;
                  v44 += 8;
                  *(void *)v43 = v45;
                  v43 += 8;
                  v42 -= 8;
                }
                while (v42);
              }
              unint64_t v31 = &v38[8 * v39];
              if (v28) {
                operator delete(v28);
              }
              uint64_t v28 = v40;
            }
            else
            {
              uint64_t v32 = (v31 - v30) >> 3;
              if (v32 >= -1) {
                unint64_t v33 = v32 + 1;
              }
              else {
                unint64_t v33 = v32 + 2;
              }
              uint64_t v34 = &v30[8 * (v33 >> 1)];
              uint64_t v29 = &v34[-(v30 - v28)];
              size_t v36 = v30 - v28;
              BOOL v35 = v30 == v28;
              uint64_t v30 = v34;
              if (!v35) {
                memmove(v29, v28, v36);
              }
            }
          }
          uint64_t v46 = *(void *)(v27 - 8);
          v27 -= 8;
          *((void *)v29 - 1) = v46;
          v29 -= 8;
        }
        *(void *)&long long v85 = v28;
        *((void *)&v85 + 1) = v29;
        *(void *)&long long v86 = v30;
        *((void *)&v86 + 1) = v31;
        long long v48 = v85;
        long long v49 = v86;
        *(void *)&long long v85 = *a1;
        v47 = (void *)v85;
        *((void *)&v85 + 1) = v27;
        *(_OWORD *)a1 = v48;
        *((_OWORD *)a1 + 1) = v49;
        if (v47) {
          operator delete(v47);
        }
        goto LABEL_60;
      }
      if (v23 != v4)
      {
        *(void *)&long long v85 = operator new(0xFC0uLL);
        sub_25B468624(a1, &v85);
LABEL_60:
        unint64_t v5 = (char *)a1[1];
        unint64_t v8 = a1[5] + a1[4];
        goto LABEL_61;
      }
      *(void *)&long long v85 = operator new(0xFC0uLL);
      sub_25B46850C((uint64_t)a1, &v85);
      uint64_t v61 = (void *)a1[1];
      size_t v4 = (char *)a1[2];
      uint64_t v63 = *v61;
      uint64_t v62 = (char *)(v61 + 1);
      uint64_t v10 = v63;
      a1[1] = v62;
      if (v4 == (char *)a1[3])
      {
        uint64_t v64 = (uint64_t)&v62[-*a1];
        if ((unint64_t)v62 > *a1)
        {
          uint64_t v65 = v64 >> 3;
          BOOL v14 = v64 >> 3 < -1;
          uint64_t v66 = (v64 >> 3) + 2;
          if (v14) {
            uint64_t v67 = v66;
          }
          else {
            uint64_t v67 = v65 + 1;
          }
          uint64_t v68 = -(v67 >> 1);
          uint64_t v69 = v67 >> 1;
          char v70 = &v62[-8 * v69];
          int64_t v71 = v4 - v62;
          if (v4 != v62)
          {
            memmove(&v62[-8 * v69], v62, v4 - v62);
            uint64_t v62 = (char *)a1[1];
          }
          size_t v4 = &v70[v71];
          uint64_t v72 = &v62[8 * v68];
          goto LABEL_58;
        }
        if (v4 == (char *)*a1) {
          unint64_t v77 = 1;
        }
        else {
          unint64_t v77 = (uint64_t)&v4[-*a1] >> 2;
        }
        BOOL v51 = (char *)sub_25B3FCAD4(v77);
        uint64_t v52 = &v51[8 * (v77 >> 2)];
        unint64_t v54 = &v51[8 * v78];
        uint64_t v79 = (uint64_t *)a1[1];
        size_t v4 = v52;
        uint64_t v80 = a1[2] - (void)v79;
        if (v80)
        {
          size_t v4 = &v52[v80 & 0xFFFFFFFFFFFFFFF8];
          uint64_t v81 = 8 * (v80 >> 3);
          uint64_t v82 = &v51[8 * (v77 >> 2)];
          do
          {
            uint64_t v83 = *v79++;
            *(void *)uint64_t v82 = v83;
            v82 += 8;
            v81 -= 8;
          }
          while (v81);
        }
LABEL_46:
        uint64_t v60 = (void *)*a1;
        *a1 = v51;
        a1[1] = v52;
        a1[2] = v4;
        a1[3] = v54;
        if (v60)
        {
          operator delete(v60);
          size_t v4 = (char *)a1[2];
        }
      }
    }
    else
    {
      a1[4] = v7 - 42;
      uint64_t v11 = *(void *)v5;
      uint64_t v9 = v5 + 8;
      uint64_t v10 = v11;
      a1[1] = v9;
      if ((char *)a1[3] == v4)
      {
        uint64_t v12 = (uint64_t)&v9[-*a1];
        if ((unint64_t)v9 > *a1)
        {
          uint64_t v13 = v12 >> 3;
          BOOL v14 = v12 >> 3 < -1;
          uint64_t v15 = (v12 >> 3) + 2;
          if (v14) {
            uint64_t v16 = v15;
          }
          else {
            uint64_t v16 = v13 + 1;
          }
          uint64_t v17 = -(v16 >> 1);
          uint64_t v18 = v16 >> 1;
          uint64_t v19 = &v9[-8 * v18];
          int64_t v20 = v4 - v9;
          if (v4 == v9)
          {
            long long v21 = v4;
          }
          else
          {
            memmove(&v9[-8 * v18], v9, v4 - v9);
            long long v21 = (char *)a1[1];
          }
          size_t v4 = &v19[v20];
          uint64_t v72 = &v21[8 * v17];
LABEL_58:
          a1[1] = v72;
          a1[2] = v4;
          goto LABEL_59;
        }
        if (v4 == (char *)*a1) {
          unint64_t v50 = 1;
        }
        else {
          unint64_t v50 = (uint64_t)&v4[-*a1] >> 2;
        }
        BOOL v51 = (char *)sub_25B3FCAD4(v50);
        uint64_t v52 = &v51[8 * (v50 >> 2)];
        unint64_t v54 = &v51[8 * v53];
        uint64_t v55 = (uint64_t *)a1[1];
        size_t v4 = v52;
        uint64_t v56 = a1[2] - (void)v55;
        if (v56)
        {
          size_t v4 = &v52[v56 & 0xFFFFFFFFFFFFFFF8];
          uint64_t v57 = 8 * (v56 >> 3);
          uint64_t v58 = &v51[8 * (v50 >> 2)];
          do
          {
            uint64_t v59 = *v55++;
            *(void *)uint64_t v58 = v59;
            v58 += 8;
            v57 -= 8;
          }
          while (v57);
        }
        goto LABEL_46;
      }
    }
LABEL_59:
    *(void *)size_t v4 = v10;
    a1[2] += 8;
    goto LABEL_60;
  }
LABEL_61:
  unint64_t v73 = *(void *)&v5[8 * (v8 / 0x2A)] + 96 * (v8 % 0x2A);
  long long v74 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)unint64_t v73 = *(_OWORD *)a2;
  *(_OWORD *)(v73 + 16) = v74;
  *(void *)(v73 + 40) = 0;
  *(void *)(v73 + 48) = 0;
  *(void *)(v73 + 32) = 0;
  *(_OWORD *)(v73 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(v73 + 48) = *(void *)(a2 + 48);
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = 0;
  *(void *)(a2 + 48) = 0;
  *(void *)(v73 + 56) = 0;
  *(void *)(v73 + 64) = 0;
  *(void *)(v73 + 72) = 0;
  __n128 result = *(__n128 *)(a2 + 56);
  *(__n128 *)(v73 + 56) = result;
  *(void *)(v73 + 72) = *(void *)(a2 + 72);
  *(void *)(a2 + 56) = 0;
  *(void *)(a2 + 64) = 0;
  *(void *)(a2 + 72) = 0;
  uint64_t v76 = *(void *)(a2 + 80);
  *(void *)(v73 + 85) = *(void *)(a2 + 85);
  *(void *)(v73 + 80) = v76;
  ++a1[5];
  return result;
}

void sub_25B5D3904(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p)
{
  operator delete(v11);
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_25B5D393C(void *a1)
{
  unint64_t v2 = a1[5] + a1[4] - 1;
  sub_25B5D3270((void *)(*(void *)(a1[1] + 8 * (v2 / 0x2A)) + 96 * (v2 % 0x2A)));
  uint64_t v4 = a1[1];
  uint64_t v3 = a1[2];
  if (v3 == v4) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = 42 * ((v3 - v4) >> 3) - 1;
  }
  uint64_t v6 = a1[4];
  uint64_t v7 = a1[5] - 1;
  a1[5] = v7;
  if ((unint64_t)(v5 - (v7 + v6)) >= 0x54)
  {
    operator delete(*(void **)(v3 - 8));
    a1[2] -= 8;
  }
}

uint64_t sub_25B5D39F0(uint64_t a1)
{
  unint64_t v2 = *(void ***)(a1 + 8);
  uint64_t v3 = *(void ***)(a1 + 16);
  if (v3 == v2)
  {
    uint64_t v4 = (void *)(a1 + 40);
    uint64_t v3 = *(void ***)(a1 + 8);
  }
  else
  {
    uint64_t v4 = (void *)(a1 + 40);
    unint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = &v2[v5 / 0x2A];
    uint64_t v7 = (char *)*v6 + 96 * (v5 % 0x2A);
    unint64_t v8 = (unint64_t)v2[(*(void *)(a1 + 40) + v5) / 0x2A] + 96 * ((*(void *)(a1 + 40) + v5) % 0x2A);
    if (v7 != (char *)v8)
    {
      do
      {
        sub_25B5D3270(v7);
        v7 += 96;
        if (v7 - (unsigned char *)*v6 == 4032)
        {
          uint64_t v9 = (char *)v6[1];
          ++v6;
          uint64_t v7 = v9;
        }
      }
      while (v7 != (char *)v8);
      unint64_t v2 = *(void ***)(a1 + 8);
      uint64_t v3 = *(void ***)(a1 + 16);
    }
  }
  void *v4 = 0;
  unint64_t v10 = (char *)v3 - (char *)v2;
  if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
  {
    do
    {
      operator delete(*v2);
      uint64_t v3 = *(void ***)(a1 + 16);
      unint64_t v2 = (void **)(*(void *)(a1 + 8) + 8);
      *(void *)(a1 + 8) = v2;
      unint64_t v10 = (char *)v3 - (char *)v2;
    }
    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }
  unint64_t v11 = v10 >> 3;
  if (v11 == 1)
  {
    uint64_t v12 = 21;
    goto LABEL_14;
  }
  if (v11 == 2)
  {
    uint64_t v12 = 42;
LABEL_14:
    *(void *)(a1 + 32) = v12;
  }
  if (v2 != v3)
  {
    do
    {
      uint64_t v13 = *v2++;
      operator delete(v13);
    }
    while (v2 != v3);
    uint64_t v15 = *(void *)(a1 + 8);
    uint64_t v14 = *(void *)(a1 + 16);
    if (v14 != v15) {
      *(void *)(a1 + 16) = v14 + ((v15 - v14 + 7) & 0xFFFFFFFFFFFFFFF8);
    }
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

const std::locale *sub_25B5D3B6C(const std::locale *a1)
{
  unint64_t v2 = (const std::locale *)MEMORY[0x261163DF0]();
  a1[1].__locale_ = (std::locale::__imp *)std::locale::use_facet(v2, MEMORY[0x263F8C108]);
  a1[2].__locale_ = (std::locale::__imp *)std::locale::use_facet(a1, MEMORY[0x263F8C130]);
  return a1;
}

void sub_25B5D3BB8(_Unwind_Exception *a1)
{
  std::locale::~locale(v1);
  _Unwind_Resume(a1);
}

void sub_25B5D3BCC()
{
}

void sub_25B5D4004(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  _Unwind_Resume(a1);
}

void sub_25B5D4068()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x261163C10](exception, 17);
  __cxa_throw(exception, (struct type_info *)&unk_2708F23C8, MEMORY[0x263F8C098]);
}

void sub_25B5D40AC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

char *sub_25B5D40C0(_DWORD *a1, unsigned __int8 *a2, char *a3)
{
  uint64_t v6 = a2;
  do
  {
    uint64_t v7 = v6;
    uint64_t v6 = sub_25B5D9E90(a1, v6, a3);
  }
  while (v6 != v7);
  if (v7 == a2) {
    operator new();
  }
  if (v7 != (unsigned __int8 *)a3)
  {
    if (*v7 == 124)
    {
      unint64_t v8 = v7 + 1;
      uint64_t v9 = v7 + 1;
      do
      {
        unint64_t v10 = v9;
        uint64_t v9 = sub_25B5D9E90(a1, v9, a3);
      }
      while (v9 != v10);
      if (v10 == v8) {
        operator new();
      }
      sub_25B5D43CC();
    }
    return (char *)v7;
  }
  return a3;
}

unsigned __int8 *sub_25B5D4220(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  uint64_t v3 = a2;
  if (a2 == a3) {
    return a2;
  }
  uint64_t v4 = a3;
  if (*a2 == 94) {
    sub_25B5D4AE0();
  }
  if (a2 != a3)
  {
    do
    {
      uint64_t v6 = v3;
      uint64_t v3 = sub_25B5D9AB4(a1, v3, v4);
    }
    while (v3 != v6);
    if (v6 != v4)
    {
      if (v6 + 1 == v4 && *v6 == 36) {
        sub_25B5D4B64();
      }
      sub_25B5D47BC();
    }
  }
  return v4;
}

unsigned __int8 *sub_25B5D42D0(uint64_t a1, unsigned __int8 *a2, char *a3)
{
  uint64_t v3 = a3;
  uint64_t v6 = sub_25B5D475C(a1, a2, a3);
  if (v6 == a2) {
LABEL_8:
  }
    sub_25B5D47BC();
  if (v6 != (unsigned __int8 *)v3)
  {
    if (*v6 == 124)
    {
      if (sub_25B5D475C(a1, v6 + 1, v3) != v6 + 1) {
        sub_25B5D43CC();
      }
      goto LABEL_8;
    }
    return v6;
  }
  return (unsigned __int8 *)v3;
}

void sub_25B5D4374()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x261163C10](exception, 14);
  __cxa_throw(exception, (struct type_info *)&unk_2708F23C8, MEMORY[0x263F8C098]);
}

void sub_25B5D43B8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_25B5D43CC()
{
}

uint64_t sub_25B5D44D8(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(void *)(a2 + 80) = *(void *)(result + 8);
  return result;
}

void sub_25B5D44EC()
{
}

uint64_t sub_25B5D4504(uint64_t result, int a2, uint64_t a3)
{
  *(_DWORD *)a3 = -994;
  uint64_t v3 = 8;
  if (a2) {
    uint64_t v3 = 16;
  }
  *(void *)(a3 + 80) = *(void *)(result + v3);
  return result;
}

void sub_25B5D4528(uint64_t a1, _DWORD *a2)
{
  *a2 = -992;
}

void sub_25B5D4534(void *a1)
{
  sub_25B5D456C(a1);

  JUMPOUT(0x261163EE0);
}

void *sub_25B5D456C(void *a1)
{
  *a1 = &unk_2708F2600;
  uint64_t v2 = a1[2];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  *a1 = &unk_2708F22D0;
  uint64_t v3 = a1[1];
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  return a1;
}

void sub_25B5D4624(void *a1)
{
  *a1 = &unk_2708F22D0;
  uint64_t v1 = a1[1];
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }

  JUMPOUT(0x261163EE0);
}

void *sub_25B5D46B0(void *a1)
{
  *a1 = &unk_2708F22D0;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

void sub_25B5D471C(void *a1)
{
  sub_25B5D456C(a1);

  JUMPOUT(0x261163EE0);
}

unsigned __int8 *sub_25B5D475C(uint64_t a1, unsigned __int8 *a2, char *a3)
{
  uint64_t v6 = sub_25B5D4814(a1, a2, a3);
  if (v6 == a2) {
    sub_25B5D47BC();
  }
  do
  {
    uint64_t v7 = v6;
    uint64_t v6 = sub_25B5D4814(a1, v6, a3);
  }
  while (v6 != v7);
  return v7;
}

void sub_25B5D47BC()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x261163C10](exception, 15);
  __cxa_throw(exception, (struct type_info *)&unk_2708F23C8, MEMORY[0x263F8C098]);
}

void sub_25B5D4800(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_25B5D4814(uint64_t a1, unsigned __int8 *a2, char *a3)
{
  if (a2 == (unsigned __int8 *)a3)
  {
LABEL_24:
    unint64_t v11 = sub_25B5D59AC(a1, a2, a3);
    goto LABEL_25;
  }
  int v6 = (char)*a2;
  uint64_t v7 = (v6 - 36);
  if (v7 > 0x3A) {
    goto LABEL_13;
  }
  if (((1 << (v6 - 36)) & 0x5800000080004D1) == 0)
  {
    if (v7 == 5)
    {
      if (*(_DWORD *)(a1 + 36)) {
        goto LABEL_4;
      }
LABEL_14:
      sub_25B5D7850(a1);
    }
LABEL_13:
    if ((v6 - 123) < 2) {
      goto LABEL_4;
    }
    goto LABEL_14;
  }
LABEL_4:
  unint64_t v8 = a2 + 1;
  if (a2 + 1 == (unsigned __int8 *)a3) {
    goto LABEL_21;
  }
  int v9 = *a2;
  if (v9 != 92) {
    goto LABEL_22;
  }
  int v10 = (char)*v8;
  if ((v10 - 36) <= 0x3A && ((1 << (v10 - 36)) & 0x5800000080004F1) != 0
    || (v10 - 123) < 3)
  {
    sub_25B5D7850(a1);
  }
  if ((*(_DWORD *)(a1 + 24) & 0x1F0) == 0x40)
  {
    unint64_t v11 = (unsigned __int8 *)sub_25B5D6F44(a1, (char *)a2 + 1, a3, 0);
  }
  else
  {
    int v12 = sub_25B5D92FC(a1, *v8);
    uint64_t v13 = 2;
    if (!v12) {
      uint64_t v13 = 0;
    }
    unint64_t v11 = &a2[v13];
  }
  if (v11 == a2)
  {
LABEL_21:
    int v9 = *a2;
LABEL_22:
    if (v9 == 46) {
      operator new();
    }
    goto LABEL_24;
  }
LABEL_25:
  if (v11 == a2 && v11 != (unsigned __int8 *)a3)
  {
    int v14 = (char)*a2;
    if (v14 == 36) {
      sub_25B5D4B64();
    }
    if (v14 != 40)
    {
      if (v14 == 94) {
        sub_25B5D4AE0();
      }
      return a2;
    }
    sub_25B5D4BE8(a1);
    ++*(_DWORD *)(a1 + 36);
    uint64_t v15 = (char *)sub_25B5D42D0(a1, a2 + 1, a3);
    if (v15 == a3 || (uint64_t v16 = v15, *v15 != 41)) {
      sub_25B5D4C6C();
    }
    sub_25B5D4CC4(a1);
    --*(_DWORD *)(a1 + 36);
    unint64_t v11 = (unsigned __int8 *)(v16 + 1);
  }
  if (v11 == a2) {
    return a2;
  }

  return sub_25B5D4D40(a1, v11, (unsigned __int8 *)a3);
}

void sub_25B5D4AE0()
{
}

void sub_25B5D4B64()
{
}

uint64_t sub_25B5D4BE8(uint64_t result)
{
  if ((*(unsigned char *)(result + 24) & 2) == 0) {
    operator new();
  }
  return result;
}

void sub_25B5D4C6C()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x261163C10](exception, 6);
  __cxa_throw(exception, (struct type_info *)&unk_2708F23C8, MEMORY[0x263F8C098]);
}

void sub_25B5D4CB0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_25B5D4CC4(uint64_t result)
{
  if ((*(unsigned char *)(result + 24) & 2) == 0) {
    operator new();
  }
  return result;
}

unsigned __int8 *sub_25B5D4D40(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  if (a2 == a3) {
    return a2;
  }
  int v4 = (char)*a2;
  if (v4 <= 62)
  {
    if (v4 == 42 || v4 == 43) {
LABEL_18:
    }
      sub_25B5D503C();
    return a2;
  }
  if (v4 == 63) {
    goto LABEL_18;
  }
  if (v4 == 123)
  {
    unint64_t v5 = a2 + 1;
    int v6 = sub_25B5D51CC(a2 + 1, a3, &v12);
    if (v6 == v5) {
      goto LABEL_23;
    }
    if (v6 != a3)
    {
      int v7 = (char)*v6;
      if (v7 != 44)
      {
        if (v7 == 125) {
          goto LABEL_18;
        }
LABEL_23:
        sub_25B5D5268();
      }
      unint64_t v8 = v6 + 1;
      if (v6 + 1 == a3) {
        goto LABEL_23;
      }
      if (*v8 == 125) {
        goto LABEL_18;
      }
      int v11 = -1;
      int v10 = sub_25B5D51CC(v6 + 1, a3, &v11);
      if (v10 != v8 && v10 != a3 && *v10 == 125)
      {
        if (v11 >= v12) {
          goto LABEL_18;
        }
        goto LABEL_23;
      }
    }
    sub_25B5D52C0();
  }
  return a2;
}

void sub_25B5D503C()
{
}

void sub_25B5D5194(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_25B5D51CC(unsigned __int8 *result, unsigned __int8 *a2, int *a3)
{
  if (result != a2)
  {
    int v3 = *result;
    if ((v3 & 0xF8) == 0x30 || (v3 & 0xFE) == 0x38)
    {
      int v4 = v3 - 48;
      *a3 = v4;
      if (++result == a2)
      {
        return a2;
      }
      else
      {
        while (1)
        {
          int v5 = *result;
          if ((v5 & 0xF8) != 0x30 && (v5 & 0xFE) != 0x38) {
            break;
          }
          if (v4 >= 214748364) {
            sub_25B5D5268();
          }
          int v4 = v5 + 10 * v4 - 48;
          *a3 = v4;
          if (++result == a2) {
            return a2;
          }
        }
      }
    }
  }
  return result;
}

void sub_25B5D5268()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x261163C10](exception, 8);
  __cxa_throw(exception, (struct type_info *)&unk_2708F23C8, MEMORY[0x263F8C098]);
}

void sub_25B5D52AC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_25B5D52C0()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x261163C10](exception, 7);
  __cxa_throw(exception, (struct type_info *)&unk_2708F23C8, MEMORY[0x263F8C098]);
}

void sub_25B5D5304(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_25B5D5318(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -991;
  *(void *)(a2 + 80) = *(void *)(result + 8);
  return result;
}

void sub_25B5D532C()
{
}

unsigned int *sub_25B5D5344(unsigned int *result, int a2, void *a3)
{
  *(_DWORD *)a3 = -994;
  if (*((unsigned __int8 *)result + 52) == a2)
  {
    a3[10] = *((void *)result + 2);
  }
  else
  {
    a3[10] = *((void *)result + 1);
    return sub_25B5D5374(result, a3);
  }
  return result;
}

unsigned int *sub_25B5D5374(unsigned int *result, void *a2)
{
  unsigned int v2 = result[11];
  *(void *)(a2[7] + 16 * result[10] + 8) = a2[2];
  unsigned int v3 = result[12];
  if (v2 != v3)
  {
    uint64_t v4 = v2 - 1;
    uint64_t v5 = a2[3];
    uint64_t v6 = v3 - 1 - v4;
    int v7 = (unsigned char *)(a2[4] + 24 * v4 + 16);
    do
    {
      *((void *)v7 - 2) = v5;
      *((void *)v7 - 1) = v5;
      unsigned char *v7 = 0;
      v7 += 24;
      --v6;
    }
    while (v6);
  }
  return result;
}

unsigned int *sub_25B5D53C4(unsigned int *result, void *a2)
{
  uint64_t v2 = result[10];
  uint64_t v3 = a2[7];
  uint64_t v4 = (unint64_t *)(v3 + 16 * v2);
  if (*(_DWORD *)a2 == -991)
  {
    unint64_t v5 = *v4 + 1;
    unint64_t *v4 = v5;
    unint64_t v6 = *((void *)result + 3);
    unint64_t v7 = *((void *)result + 4);
    BOOL v8 = v5 < v7;
    if (v5 < v7 && v5 >= v6)
    {
      uint64_t v10 = *(void *)(v3 + 16 * v2 + 8);
      BOOL v8 = v5 < v7 && v10 != a2[2];
    }
    if (!v8 || v5 < v6)
    {
      *(_DWORD *)a2 = -994;
      if (!v8) {
        goto LABEL_25;
      }
LABEL_22:
      a2[10] = *((void *)result + 1);
      return sub_25B5D5374(result, a2);
    }
    goto LABEL_23;
  }
  unint64_t *v4 = 0;
  if (*((void *)result + 4))
  {
    if (*((void *)result + 3))
    {
      *(_DWORD *)a2 = -994;
      goto LABEL_22;
    }
LABEL_23:
    *(_DWORD *)a2 = -992;
    return result;
  }
  *(_DWORD *)a2 = -994;
LABEL_25:
  a2[10] = *((void *)result + 2);
  return result;
}

void sub_25B5D5478(void *a1)
{
  sub_25B5D456C(a1);

  JUMPOUT(0x261163EE0);
}

uint64_t sub_25B5D54B4(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  uint64_t v2 = *(void *)(a2 + 32) + 24 * (*(_DWORD *)(result + 16) - 1);
  *(void *)(v2 + 8) = *(void *)(a2 + 16);
  *(unsigned char *)(v2 + 16) = 1;
  *(void *)(a2 + 80) = *(void *)(result + 8);
  return result;
}

void sub_25B5D54EC(void *a1)
{
  *a1 = &unk_2708F22D0;
  uint64_t v1 = a1[1];
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }

  JUMPOUT(0x261163EE0);
}

void *sub_25B5D5578(void *a1)
{
  *a1 = &unk_2708F22D0;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

uint64_t sub_25B5D55E4(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(void *)(*(void *)(a2 + 32) + 24 * (*(_DWORD *)(result + 16) - 1)) = *(void *)(a2 + 16);
  *(void *)(a2 + 80) = *(void *)(result + 8);
  return result;
}

void sub_25B5D5614(void *a1)
{
  *a1 = &unk_2708F22D0;
  uint64_t v1 = a1[1];
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }

  JUMPOUT(0x261163EE0);
}

void *sub_25B5D56A0(void *a1)
{
  *a1 = &unk_2708F22D0;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

uint64_t sub_25B5D570C(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) && (*(unsigned char *)(a2 + 88) & 2) == 0
    || *(unsigned char *)(result + 16) && ((v3 = *v2, v3 != 13) ? (BOOL v4 = v3 == 10) : (BOOL v4 = 1), v4))
  {
    *(_DWORD *)a2 = -994;
    uint64_t v5 = *(void *)(result + 8);
  }
  else
  {
    uint64_t v5 = 0;
    *(_DWORD *)a2 = -993;
  }
  *(void *)(a2 + 80) = v5;
  return result;
}

void sub_25B5D575C(void *a1)
{
  *a1 = &unk_2708F22D0;
  uint64_t v1 = a1[1];
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }

  JUMPOUT(0x261163EE0);
}

void *sub_25B5D57E8(void *a1)
{
  *a1 = &unk_2708F22D0;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

uint64_t sub_25B5D5854(uint64_t result, uint64_t a2)
{
  if (*(unsigned char *)(a2 + 92))
  {
    if (*(void *)(a2 + 16) != *(void *)(a2 + 8) || (*(unsigned char *)(a2 + 88) & 1) != 0)
    {
LABEL_12:
      uint64_t v4 = 0;
      *(_DWORD *)a2 = -993;
      goto LABEL_13;
    }
  }
  else
  {
    if (!*(unsigned char *)(result + 16)) {
      goto LABEL_12;
    }
    int v2 = *(unsigned __int8 *)(*(void *)(a2 + 16) - 1);
    if (v2 != 13 && v2 != 10) {
      goto LABEL_12;
    }
  }
  *(_DWORD *)a2 = -994;
  uint64_t v4 = *(void *)(result + 8);
LABEL_13:
  *(void *)(a2 + 80) = v4;
  return result;
}

void sub_25B5D58B4(void *a1)
{
  *a1 = &unk_2708F22D0;
  uint64_t v1 = a1[1];
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }

  JUMPOUT(0x261163EE0);
}

void *sub_25B5D5940(void *a1)
{
  *a1 = &unk_2708F22D0;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

unsigned char *sub_25B5D59AC(uint64_t a1, unsigned char *a2, unsigned char *a3)
{
  if (a2 != a3 && *a2 == 91)
  {
    if (a2 + 1 != a3) {
      sub_25B5D6628();
    }
    sub_25B5D65D0();
  }
  return a2;
}

void sub_25B5D64B0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,int a31,__int16 a32,char a33,char a34,void *a35,uint64_t a36,int a37,__int16 a38,char a39,char a40,void *__p,uint64_t a42,int a43,__int16 a44,char a45,char a46)
{
  *(void *)(v46 + 144) = v47;
  if (a46 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v48 - 145) < 0) {
    operator delete(*(void **)(v48 - 168));
  }
  if (a40 < 0) {
    operator delete(a35);
  }
  _Unwind_Resume(exception_object);
}

void sub_25B5D65D0()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x261163C10](exception, 5);
  __cxa_throw(exception, (struct type_info *)&unk_2708F23C8, MEMORY[0x263F8C098]);
}

void sub_25B5D6614(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_25B5D6628()
{
}

void sub_25B5D67B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10)
{
  std::locale::~locale((std::locale *)&a9);
  a10 = v10 + 17;
  sub_25B41032C((void ***)&a10);
  uint64_t v15 = (void *)v10[14];
  if (v15)
  {
    v10[15] = v15;
    operator delete(v15);
  }
  sub_25B5D8520((void ***)&a10);
  uint64_t v16 = (void *)v10[8];
  if (v16)
  {
    v10[9] = v16;
    operator delete(v16);
  }
  uint64_t v17 = *v13;
  if (*v13)
  {
    v10[6] = v17;
    operator delete(v17);
  }
  std::locale::~locale(v12);
  *uint64_t v10 = v11;
  uint64_t v18 = v10[1];
  if (v18) {
    (*(void (**)(uint64_t))(*(void *)v18 + 8))(v18);
  }
  MEMORY[0x261163EE0](v10, 0x10F1C4061CF1F02);
  _Unwind_Resume(a1);
}

void sub_25B5D6860(uint64_t a1, uint64_t a2)
{
  char v2 = a2;
  if (*(unsigned char *)(a1 + 169))
  {
    char v2 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), a2);
    uint64_t v5 = *(unsigned char **)(a1 + 48);
    unint64_t v4 = *(void *)(a1 + 56);
    if ((unint64_t)v5 >= v4)
    {
      unint64_t v6 = *(void *)(a1 + 40);
      unint64_t v7 = &v5[-v6];
      uint64_t v8 = (uint64_t)&v5[-v6 + 1];
      if (v8 >= 0)
      {
        unint64_t v9 = v4 - v6;
        if (2 * v9 > v8) {
          uint64_t v8 = 2 * v9;
        }
        if (v9 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v10 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v10 = v8;
        }
        if (v10) {
          uint64_t v11 = operator new(v10);
        }
        else {
          uint64_t v11 = 0;
        }
        uint64_t v19 = &v7[(void)v11];
        int64_t v20 = (char *)v11 + v10;
        v7[(void)v11] = v2;
        uint64_t v18 = (uint64_t)&v7[(void)v11 + 1];
        if (v5 != (unsigned char *)v6)
        {
          long long v21 = &v5[~v6];
          do
          {
            char v22 = *--v5;
            (v21--)[(void)v11] = v22;
          }
          while (v5 != (unsigned char *)v6);
LABEL_45:
          uint64_t v5 = *(unsigned char **)(a1 + 40);
          goto LABEL_47;
        }
        goto LABEL_46;
      }
LABEL_50:
      sub_25B3FBC4C();
    }
    goto LABEL_22;
  }
  uint64_t v5 = *(unsigned char **)(a1 + 48);
  unint64_t v12 = *(void *)(a1 + 56);
  if (!*(unsigned char *)(a1 + 170))
  {
    if ((unint64_t)v5 >= v12)
    {
      unint64_t v23 = *(void *)(a1 + 40);
      uint64_t v24 = &v5[-v23];
      uint64_t v25 = (uint64_t)&v5[-v23 + 1];
      if (v25 >= 0)
      {
        unint64_t v26 = v12 - v23;
        if (2 * v26 > v25) {
          uint64_t v25 = 2 * v26;
        }
        if (v26 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v27 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v27 = v25;
        }
        if (v27) {
          uint64_t v11 = operator new(v27);
        }
        else {
          uint64_t v11 = 0;
        }
        uint64_t v19 = &v24[(void)v11];
        int64_t v20 = (char *)v11 + v27;
        v24[(void)v11] = v2;
        uint64_t v18 = (uint64_t)&v24[(void)v11 + 1];
        if (v5 != (unsigned char *)v23)
        {
          uint64_t v30 = &v5[~v23];
          do
          {
            char v31 = *--v5;
            (v30--)[(void)v11] = v31;
          }
          while (v5 != (unsigned char *)v23);
          goto LABEL_45;
        }
        goto LABEL_46;
      }
      goto LABEL_50;
    }
LABEL_22:
    unsigned char *v5 = v2;
    uint64_t v18 = (uint64_t)(v5 + 1);
    goto LABEL_49;
  }
  if ((unint64_t)v5 < v12) {
    goto LABEL_22;
  }
  unint64_t v13 = *(void *)(a1 + 40);
  int v14 = &v5[-v13];
  uint64_t v15 = (uint64_t)&v5[-v13 + 1];
  if (v15 < 0) {
    goto LABEL_50;
  }
  unint64_t v16 = v12 - v13;
  if (2 * v16 > v15) {
    uint64_t v15 = 2 * v16;
  }
  if (v16 >= 0x3FFFFFFFFFFFFFFFLL) {
    size_t v17 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    size_t v17 = v15;
  }
  if (v17) {
    uint64_t v11 = operator new(v17);
  }
  else {
    uint64_t v11 = 0;
  }
  uint64_t v19 = &v14[(void)v11];
  int64_t v20 = (char *)v11 + v17;
  v14[(void)v11] = v2;
  uint64_t v18 = (uint64_t)&v14[(void)v11 + 1];
  if (v5 != (unsigned char *)v13)
  {
    uint64_t v28 = &v5[~v13];
    do
    {
      char v29 = *--v5;
      (v28--)[(void)v11] = v29;
    }
    while (v5 != (unsigned char *)v13);
    goto LABEL_45;
  }
LABEL_46:
  uint64_t v11 = v19;
LABEL_47:
  *(void *)(a1 + 40) = v11;
  *(void *)(a1 + 48) = v18;
  *(void *)(a1 + 56) = v20;
  if (v5) {
    operator delete(v5);
  }
LABEL_49:
  *(void *)(a1 + 48) = v18;
}

char *sub_25B5D6A94(uint64_t a1, char *a2, char *a3, uint64_t a4)
{
  if (a3 - a2 < 2 || a3 - 1 == a2) {
    goto LABEL_15;
  }
  for (uint64_t i = 0; ; ++i)
  {
    unint64_t v6 = &a2[i];
    if (a2[i] == 46 && v6[1] == 93) {
      break;
    }
    if (a3 - a2 - 2 == i) {
      goto LABEL_15;
    }
  }
  if (v6 == a3) {
LABEL_15:
  }
    sub_25B5D65D0();
  sub_25B5D82B4((uint64_t)&v10, a1, a2, &a2[i]);
  if (*(char *)(a4 + 23) < 0) {
    operator delete(*(void **)a4);
  }
  *(_OWORD *)a4 = v10;
  unint64_t v7 = v11;
  *(void *)(a4 + 16) = v11;
  unint64_t v8 = HIBYTE(v7);
  if ((v8 & 0x80u) != 0) {
    unint64_t v8 = *(void *)(a4 + 8);
  }
  if (v8 - 1 >= 2) {
    sub_25B5D8470();
  }
  return v6 + 2;
}

unsigned __int8 *sub_25B5D6B74(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, uint64_t a4, uint64_t a5)
{
  if (a2 == a3) {
    sub_25B5D77F8();
  }
  int v7 = (char)*a2;
  if (v7 > 97)
  {
    if (v7 > 114)
    {
      if (v7 != 115)
      {
        if (v7 == 119)
        {
          *(_DWORD *)(a5 + 160) |= 0x500u;
          sub_25B5D6860(a5, 95);
          return a2 + 1;
        }
        goto LABEL_27;
      }
      int v9 = *(_DWORD *)(a5 + 160) | 0x4000;
    }
    else
    {
      if (v7 == 98)
      {
        if (*(char *)(a4 + 23) < 0)
        {
          *(void *)(a4 + 8) = 1;
          a4 = *(void *)a4;
        }
        else
        {
          *(unsigned char *)(a4 + 23) = 1;
        }
        *(_WORD *)a4 = 8;
        return a2 + 1;
      }
      if (v7 != 100) {
        goto LABEL_27;
      }
      int v9 = *(_DWORD *)(a5 + 160) | 0x400;
    }
    *(_DWORD *)(a5 + 160) = v9;
    return a2 + 1;
  }
  if (v7 <= 82)
  {
    if (!*a2)
    {
      if (*(char *)(a4 + 23) < 0)
      {
        *(void *)(a4 + 8) = 1;
        a4 = *(void *)a4;
      }
      else
      {
        *(unsigned char *)(a4 + 23) = 1;
      }
      *(unsigned char *)a4 = 0;
      *(unsigned char *)(a4 + 1) = 0;
      return a2 + 1;
    }
    if (v7 == 68)
    {
      int v8 = *(_DWORD *)(a5 + 164) | 0x400;
LABEL_24:
      *(_DWORD *)(a5 + 164) = v8;
      return a2 + 1;
    }
    goto LABEL_27;
  }
  if (v7 == 83)
  {
    int v8 = *(_DWORD *)(a5 + 164) | 0x4000;
    goto LABEL_24;
  }
  if (v7 == 87)
  {
    *(_DWORD *)(a5 + 164) |= 0x500u;
    if (*(unsigned char *)(a5 + 169))
    {
      char v10 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a5 + 24) + 40))(*(void *)(a5 + 24), 95);
      char v11 = v10;
      unint64_t v13 = *(unsigned char **)(a5 + 72);
      unint64_t v12 = *(void *)(a5 + 80);
      if ((unint64_t)v13 < v12)
      {
        *unint64_t v13 = v10;
        uint64_t v14 = (uint64_t)(v13 + 1);
LABEL_62:
        *(void *)(a5 + 72) = v14;
        return a2 + 1;
      }
      unint64_t v24 = *(void *)(a5 + 64);
      uint64_t v25 = &v13[-v24];
      uint64_t v26 = (uint64_t)&v13[-v24 + 1];
      if (v26 >= 0)
      {
        unint64_t v27 = v12 - v24;
        if (2 * v27 > v26) {
          uint64_t v26 = 2 * v27;
        }
        if (v27 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v28 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v28 = v26;
        }
        if (v28) {
          char v29 = operator new(v28);
        }
        else {
          char v29 = 0;
        }
        char v31 = &v29[v28];
        v25[(void)v29] = v11;
        uint64_t v14 = (uint64_t)&v25[(void)v29 + 1];
        if (v13 == (unsigned char *)v24)
        {
          char v29 = &v25[(void)v29];
        }
        else
        {
          uint64_t v32 = &v13[~v24];
          do
          {
            char v33 = *--v13;
            (v32--)[(void)v29] = v33;
          }
          while (v13 != (unsigned char *)v24);
          unint64_t v13 = *(unsigned char **)(a5 + 64);
        }
        *(void *)(a5 + 64) = v29;
        *(void *)(a5 + 72) = v14;
        *(void *)(a5 + 80) = v31;
        if (v13) {
          operator delete(v13);
        }
        goto LABEL_62;
      }
LABEL_87:
      sub_25B3FBC4C();
    }
    size_t v17 = *(unsigned char **)(a5 + 72);
    unint64_t v16 = *(void *)(a5 + 80);
    if (*(unsigned char *)(a5 + 170))
    {
      if ((unint64_t)v17 >= v16)
      {
        unint64_t v18 = *(void *)(a5 + 64);
        uint64_t v19 = &v17[-v18];
        uint64_t v20 = (uint64_t)&v17[-v18 + 1];
        if (v20 < 0) {
          goto LABEL_87;
        }
        unint64_t v21 = v16 - v18;
        if (2 * v21 > v20) {
          uint64_t v20 = 2 * v21;
        }
        if (v21 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v22 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v22 = v20;
        }
        if (v22) {
          unint64_t v23 = operator new(v22);
        }
        else {
          unint64_t v23 = 0;
        }
        uint64_t v39 = &v19[(void)v23];
        long long v40 = (char *)v23 + v22;
        v19[(void)v23] = 95;
        uint64_t v30 = (uint64_t)&v19[(void)v23 + 1];
        if (v17 != (unsigned char *)v18)
        {
          uint64_t v41 = &v17[~v18];
          do
          {
            char v42 = *--v17;
            (v41--)[(void)v23] = v42;
          }
          while (v17 != (unsigned char *)v18);
LABEL_80:
          size_t v17 = *(unsigned char **)(a5 + 64);
          goto LABEL_82;
        }
        goto LABEL_81;
      }
    }
    else if ((unint64_t)v17 >= v16)
    {
      unint64_t v34 = *(void *)(a5 + 64);
      BOOL v35 = &v17[-v34];
      uint64_t v36 = (uint64_t)&v17[-v34 + 1];
      if (v36 < 0) {
        goto LABEL_87;
      }
      unint64_t v37 = v16 - v34;
      if (2 * v37 > v36) {
        uint64_t v36 = 2 * v37;
      }
      if (v37 >= 0x3FFFFFFFFFFFFFFFLL) {
        size_t v38 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        size_t v38 = v36;
      }
      if (v38) {
        unint64_t v23 = operator new(v38);
      }
      else {
        unint64_t v23 = 0;
      }
      uint64_t v39 = &v35[(void)v23];
      long long v40 = (char *)v23 + v38;
      v35[(void)v23] = 95;
      uint64_t v30 = (uint64_t)&v35[(void)v23 + 1];
      if (v17 != (unsigned char *)v34)
      {
        v43 = &v17[~v34];
        do
        {
          char v44 = *--v17;
          (v43--)[(void)v23] = v44;
        }
        while (v17 != (unsigned char *)v34);
        goto LABEL_80;
      }
LABEL_81:
      unint64_t v23 = v39;
LABEL_82:
      *(void *)(a5 + 64) = v23;
      *(void *)(a5 + 72) = v30;
      *(void *)(a5 + 80) = v40;
      if (v17) {
        operator delete(v17);
      }
      goto LABEL_84;
    }
    *size_t v17 = 95;
    uint64_t v30 = (uint64_t)(v17 + 1);
LABEL_84:
    *(void *)(a5 + 72) = v30;
    return a2 + 1;
  }
LABEL_27:

  return sub_25B5D7EC8(a1, a2, a3, (uint64_t *)a4);
}

char *sub_25B5D6F44(uint64_t a1, char *a2, char *a3, uint64_t *a4)
{
  if (a2 == a3) {
LABEL_78:
  }
    sub_25B5D77F8();
  int v4 = *a2;
  char v5 = *a2;
  if (v4 > 97)
  {
    switch(*a2)
    {
      case 'n':
        if (!a4) {
          goto LABEL_60;
        }
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        __int16 v11 = 10;
        goto LABEL_75;
      case 'o':
      case 'p':
      case 'q':
      case 's':
      case 'u':
        goto LABEL_25;
      case 'r':
        if (!a4) {
          goto LABEL_60;
        }
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        __int16 v11 = 13;
        goto LABEL_75;
      case 't':
        if (!a4) {
          goto LABEL_60;
        }
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        __int16 v11 = 9;
        goto LABEL_75;
      case 'v':
        if (!a4) {
          goto LABEL_60;
        }
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        __int16 v11 = 11;
        goto LABEL_75;
      default:
        if (v4 == 98)
        {
          if (!a4) {
            goto LABEL_60;
          }
          if (*((char *)a4 + 23) < 0)
          {
            a4[1] = 1;
            a4 = (uint64_t *)*a4;
          }
          else
          {
            *((unsigned char *)a4 + 23) = 1;
          }
          __int16 v11 = 8;
        }
        else
        {
          if (v4 != 102) {
            goto LABEL_25;
          }
          if (!a4) {
            goto LABEL_60;
          }
          if (*((char *)a4 + 23) < 0)
          {
            a4[1] = 1;
            a4 = (uint64_t *)*a4;
          }
          else
          {
            *((unsigned char *)a4 + 23) = 1;
          }
          __int16 v11 = 12;
        }
        break;
    }
    goto LABEL_75;
  }
  if (v4 > 91)
  {
    if (v4 == 92) {
      goto LABEL_16;
    }
    if (v4 != 97) {
      goto LABEL_25;
    }
    if (!a4) {
      goto LABEL_60;
    }
    if (*((char *)a4 + 23) < 0)
    {
      a4[1] = 1;
      a4 = (uint64_t *)*a4;
    }
    else
    {
      *((unsigned char *)a4 + 23) = 1;
    }
    __int16 v11 = 7;
LABEL_75:
    *(_WORD *)a4 = v11;
    return a2 + 1;
  }
  if (v4 == 34 || v4 == 47)
  {
LABEL_16:
    if (a4)
    {
      if (*((char *)a4 + 23) < 0)
      {
        a4[1] = 1;
        a4 = (uint64_t *)*a4;
      }
      else
      {
        *((unsigned char *)a4 + 23) = 1;
      }
      *(unsigned char *)a4 = v5;
      *((unsigned char *)a4 + 1) = 0;
      return a2 + 1;
    }
LABEL_60:
    sub_25B5D7850(a1);
  }
LABEL_25:
  if ((v5 & 0xF8) != 0x30) {
    goto LABEL_78;
  }
  char v6 = v4 - 48;
  int v7 = a2 + 1;
  if (a2 + 1 == a3)
  {
LABEL_48:
    int v7 = a3;
    goto LABEL_49;
  }
  if ((*v7 & 0xF8) == 0x30)
  {
    char v6 = *v7 + 8 * v6 - 48;
    if (a2 + 2 != a3)
    {
      char v8 = a2[2];
      int v9 = v8 & 0xF8;
      char v10 = v8 + 8 * v6 - 48;
      if (v9 == 48) {
        int v7 = a2 + 3;
      }
      else {
        int v7 = a2 + 2;
      }
      if (v9 == 48) {
        char v6 = v10;
      }
      goto LABEL_49;
    }
    goto LABEL_48;
  }
LABEL_49:
  if (!a4) {
    sub_25B5D7850(a1);
  }
  if (*((char *)a4 + 23) < 0)
  {
    a4[1] = 1;
    a4 = (uint64_t *)*a4;
  }
  else
  {
    *((unsigned char *)a4 + 23) = 1;
  }
  *(unsigned char *)a4 = v6;
  *((unsigned char *)a4 + 1) = 0;
  return v7;
}

void sub_25B5D7260(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(unsigned char *)(a1 + 169))
  {
    __int16 v6 = a2 | (unsigned __int16)((_WORD)a3 << 8);
    char v8 = *(_WORD **)(a1 + 120);
    unint64_t v16 = *(void *)(a1 + 128);
    if (*(unsigned char *)(a1 + 170))
    {
      if ((unint64_t)v8 < v16) {
        goto LABEL_24;
      }
      uint64_t v17 = *(void *)(a1 + 112);
      uint64_t v18 = (uint64_t)v8 - v17;
      if ((uint64_t)v8 - v17 > -3)
      {
        uint64_t v19 = v18 >> 1;
        unint64_t v20 = v16 - v17;
        if (v20 <= (v18 >> 1) + 1) {
          unint64_t v21 = v19 + 1;
        }
        else {
          unint64_t v21 = v20;
        }
        if (v20 >= 0x7FFFFFFFFFFFFFFELL) {
          uint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          uint64_t v22 = v21;
        }
        if (v22) {
          uint64_t v22 = (uint64_t)sub_25B5D749C(v22);
        }
        else {
          uint64_t v23 = 0;
        }
        uint64_t v25 = (_WORD *)(v22 + 2 * v19);
        uint64_t v26 = v22 + 2 * v23;
        *uint64_t v25 = v6;
        unint64_t v24 = v25 + 1;
        unint64_t v37 = *(char **)(a1 + 112);
        unint64_t v27 = *(char **)(a1 + 120);
        if (v27 == v37) {
          goto LABEL_46;
        }
        do
        {
          __int16 v38 = *((_WORD *)v27 - 1);
          v27 -= 2;
          *--uint64_t v25 = v38;
        }
        while (v27 != v37);
        goto LABEL_45;
      }
    }
    else
    {
      if ((unint64_t)v8 < v16) {
        goto LABEL_24;
      }
      uint64_t v30 = *(void *)(a1 + 112);
      uint64_t v31 = (uint64_t)v8 - v30;
      if ((uint64_t)v8 - v30 > -3)
      {
        uint64_t v32 = v31 >> 1;
        unint64_t v33 = v16 - v30;
        if (v33 <= (v31 >> 1) + 1) {
          unint64_t v34 = v32 + 1;
        }
        else {
          unint64_t v34 = v33;
        }
        if (v33 >= 0x7FFFFFFFFFFFFFFELL) {
          uint64_t v35 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          uint64_t v35 = v34;
        }
        if (v35) {
          uint64_t v35 = (uint64_t)sub_25B5D749C(v35);
        }
        else {
          uint64_t v36 = 0;
        }
        uint64_t v25 = (_WORD *)(v35 + 2 * v32);
        uint64_t v26 = v35 + 2 * v36;
        *uint64_t v25 = v6;
        unint64_t v24 = v25 + 1;
        uint64_t v39 = *(char **)(a1 + 112);
        unint64_t v27 = *(char **)(a1 + 120);
        if (v27 == v39) {
          goto LABEL_46;
        }
        do
        {
          __int16 v40 = *((_WORD *)v27 - 1);
          v27 -= 2;
          *--uint64_t v25 = v40;
        }
        while (v27 != v39);
        goto LABEL_45;
      }
    }
LABEL_49:
    sub_25B3FBC4C();
  }
  unsigned __int8 v5 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), a2);
  __int16 v6 = v5 | (unsigned __int16)((*(unsigned __int16 (**)(void, uint64_t))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), a3) << 8);
  char v8 = *(_WORD **)(a1 + 120);
  unint64_t v7 = *(void *)(a1 + 128);
  if ((unint64_t)v8 < v7)
  {
LABEL_24:
    *char v8 = v6;
    unint64_t v24 = v8 + 1;
    goto LABEL_48;
  }
  uint64_t v9 = *(void *)(a1 + 112);
  uint64_t v10 = (uint64_t)v8 - v9;
  if ((uint64_t)v8 - v9 <= -3) {
    goto LABEL_49;
  }
  uint64_t v11 = v10 >> 1;
  unint64_t v12 = v7 - v9;
  if (v12 <= (v10 >> 1) + 1) {
    unint64_t v13 = v11 + 1;
  }
  else {
    unint64_t v13 = v12;
  }
  if (v12 >= 0x7FFFFFFFFFFFFFFELL) {
    uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v14 = v13;
  }
  if (v14) {
    uint64_t v14 = (uint64_t)sub_25B5D749C(v14);
  }
  else {
    uint64_t v15 = 0;
  }
  uint64_t v25 = (_WORD *)(v14 + 2 * v11);
  uint64_t v26 = v14 + 2 * v15;
  *uint64_t v25 = v6;
  unint64_t v24 = v25 + 1;
  size_t v28 = *(char **)(a1 + 112);
  unint64_t v27 = *(char **)(a1 + 120);
  if (v27 == v28) {
    goto LABEL_46;
  }
  do
  {
    __int16 v29 = *((_WORD *)v27 - 1);
    v27 -= 2;
    *--uint64_t v25 = v29;
  }
  while (v27 != v28);
LABEL_45:
  unint64_t v27 = *(char **)(a1 + 112);
LABEL_46:
  *(void *)(a1 + 112) = v25;
  *(void *)(a1 + 120) = v24;
  *(void *)(a1 + 128) = v26;
  if (v27) {
    operator delete(v27);
  }
LABEL_48:
  *(void *)(a1 + 120) = v24;
}

void *sub_25B5D749C(uint64_t a1)
{
  if (a1 < 0) {
    sub_25B3FA70C();
  }
  return operator new(2 * a1);
}

void sub_25B5D74D0(uint64_t a1, uint64_t a2, char *a3, char *a4)
{
  sub_25B5D1570(__p, a3, a4, a4 - a3);
  unint64_t v5 = v8;
  if ((v8 & 0x80u) == 0) {
    __int16 v6 = __p;
  }
  else {
    __int16 v6 = (void **)__p[0];
  }
  if ((v8 & 0x80u) != 0) {
    unint64_t v5 = (unint64_t)__p[1];
  }
  (*(void (**)(void, void **, char *))(**(void **)(a2 + 16) + 32))(*(void *)(a2 + 16), v6, (char *)v6 + v5);
  if ((char)v8 < 0) {
    operator delete(__p[0]);
  }
}

void sub_25B5D7578(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_25B5D7594(char **a1, long long *a2)
{
  unint64_t v4 = (unint64_t)a1[1];
  unint64_t v5 = (unint64_t)a1[2];
  if (v4 >= v5)
  {
    unint64_t v9 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v4 - (void)*a1) >> 4);
    unint64_t v10 = v9 + 1;
    if (v9 + 1 > 0x555555555555555) {
      sub_25B3FBC4C();
    }
    unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v5 - (void)*a1) >> 4);
    if (2 * v11 > v10) {
      unint64_t v10 = 2 * v11;
    }
    if (v11 >= 0x2AAAAAAAAAAAAAALL) {
      unint64_t v12 = 0x555555555555555;
    }
    else {
      unint64_t v12 = v10;
    }
    if (v12)
    {
      if (v12 > 0x555555555555555) {
        sub_25B3FA70C();
      }
      unint64_t v13 = (char *)operator new(48 * v12);
    }
    else
    {
      unint64_t v13 = 0;
    }
    uint64_t v14 = &v13[48 * v9];
    *(_OWORD *)uint64_t v14 = *a2;
    *((void *)v14 + 2) = *((void *)a2 + 2);
    long long v15 = *(long long *)((char *)a2 + 24);
    *((void *)a2 + 2) = 0;
    *((void *)a2 + 3) = 0;
    *(void *)a2 = 0;
    *((void *)a2 + 1) = 0;
    *(_OWORD *)(v14 + 24) = v15;
    *((void *)v14 + 5) = *((void *)a2 + 5);
    *((void *)a2 + 4) = 0;
    *((void *)a2 + 5) = 0;
    uint64_t v17 = *a1;
    unint64_t v16 = (unint64_t)a1[1];
    if ((char *)v16 == *a1)
    {
      int64x2_t v21 = vdupq_n_s64(v16);
      uint64_t v18 = &v13[48 * v9];
    }
    else
    {
      uint64_t v18 = &v13[48 * v9];
      do
      {
        long long v19 = *(_OWORD *)(v16 - 48);
        *((void *)v18 - 4) = *(void *)(v16 - 32);
        *((_OWORD *)v18 - 3) = v19;
        *(void *)(v16 - 40) = 0;
        *(void *)(v16 - 32) = 0;
        *(void *)(v16 - 48) = 0;
        long long v20 = *(_OWORD *)(v16 - 24);
        *((void *)v18 - 1) = *(void *)(v16 - 8);
        *(_OWORD *)(v18 - 24) = v20;
        v18 -= 48;
        *(void *)(v16 - 16) = 0;
        *(void *)(v16 - 8) = 0;
        *(void *)(v16 - 24) = 0;
        v16 -= 48;
      }
      while ((char *)v16 != v17);
      int64x2_t v21 = *(int64x2_t *)a1;
    }
    unsigned __int8 v8 = v14 + 48;
    *a1 = v18;
    a1[1] = v14 + 48;
    a1[2] = &v13[48 * v12];
    uint64_t v23 = v21.i64[1];
    uint64_t v22 = (void *)v21.i64[0];
    while ((void *)v23 != v22)
    {
      v23 -= 48;
      sub_25B401104(v23);
    }
    if (v22) {
      operator delete(v22);
    }
  }
  else
  {
    long long v6 = *a2;
    *(void *)(v4 + 16) = *((void *)a2 + 2);
    *(_OWORD *)unint64_t v4 = v6;
    *((void *)a2 + 1) = 0;
    *((void *)a2 + 2) = 0;
    *(void *)a2 = 0;
    long long v7 = *(long long *)((char *)a2 + 24);
    *(void *)(v4 + 40) = *((void *)a2 + 5);
    *(_OWORD *)(v4 + 24) = v7;
    *((void *)a2 + 4) = 0;
    *((void *)a2 + 5) = 0;
    *((void *)a2 + 3) = 0;
    unsigned __int8 v8 = (char *)(v4 + 48);
  }
  a1[1] = v8;
}

uint64_t sub_25B5D775C(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0) {
    operator delete(*(void **)(a1 + 24));
  }
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_25B5D77A0()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x261163C10](exception, 9);
  __cxa_throw(exception, (struct type_info *)&unk_2708F23C8, MEMORY[0x263F8C098]);
}

void sub_25B5D77E4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_25B5D77F8()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x261163C10](exception, 3);
  __cxa_throw(exception, (struct type_info *)&unk_2708F23C8, MEMORY[0x263F8C098]);
}

void sub_25B5D783C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_25B5D7850(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 24);
  if ((v1 & 1) == 0)
  {
    if ((v1 & 8) == 0) {
      operator new();
    }
    operator new();
  }
  operator new();
}

void sub_25B5D79C4(_Unwind_Exception *a1)
{
  std::locale::~locale(v2);
  void *v1 = &unk_2708F22D0;
  uint64_t v4 = v1[1];
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
  }
  MEMORY[0x261163EE0](v1, 0x10E1C4010F5D982);
  _Unwind_Resume(a1);
}

uint64_t sub_25B5D7A3C(uint64_t result, uint64_t a2)
{
  char v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) || *v2 != *(unsigned __int8 *)(result + 16))
  {
    uint64_t v3 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(void *)(a2 + 16) = v2 + 1;
    uint64_t v3 = *(void *)(result + 8);
  }
  *(void *)(a2 + 80) = v3;
  return result;
}

void sub_25B5D7A84(void *a1)
{
  *a1 = &unk_2708F22D0;
  uint64_t v1 = a1[1];
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }

  JUMPOUT(0x261163EE0);
}

void *sub_25B5D7B10(void *a1)
{
  *a1 = &unk_2708F22D0;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

uint64_t sub_25B5D7B7C(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) || *v2 != *(unsigned __int8 *)(result + 40))
  {
    uint64_t v3 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(void *)(a2 + 16) = v2 + 1;
    uint64_t v3 = *(void *)(result + 8);
  }
  *(void *)(a2 + 80) = v3;
  return result;
}

void sub_25B5D7BC4(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_2708F2450;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&unk_2708F22D0;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }

  JUMPOUT(0x261163EE0);
}

std::locale *sub_25B5D7C70(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_2708F2450;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&unk_2708F22D0;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

uint64_t sub_25B5D7CFC(uint64_t result, uint64_t a2)
{
  uint64_t v3 = *(char **)(a2 + 16);
  if (v3 == *(char **)(a2 + 24)
    || (uint64_t v4 = result,
        __n128 result = (*(uint64_t (**)(void, void))(**(void **)(result + 24) + 40))(*(void *)(result + 24), *v3), *(unsigned __int8 *)(v4 + 40) != result))
  {
    uint64_t v5 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    ++*(void *)(a2 + 16);
    uint64_t v5 = *(void *)(v4 + 8);
  }
  *(void *)(a2 + 80) = v5;
  return result;
}

void sub_25B5D7D90(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_2708F2420;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&unk_2708F22D0;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }

  JUMPOUT(0x261163EE0);
}

std::locale *sub_25B5D7E3C(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_2708F2420;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&unk_2708F22D0;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

unsigned __int8 *sub_25B5D7EC8(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, uint64_t *a4)
{
  uint64_t v4 = a2;
  if (a2 == a3) {
    return v4;
  }
  uint64_t v5 = *a2;
  if ((char)v5 > 109)
  {
    switch((char)v5)
    {
      case 'n':
        if (!a4) {
          goto LABEL_60;
        }
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        __int16 v14 = 10;
        goto LABEL_72;
      case 'r':
        if (!a4) {
          goto LABEL_60;
        }
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        __int16 v14 = 13;
        goto LABEL_72;
      case 't':
        if (!a4) {
          goto LABEL_60;
        }
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        __int16 v14 = 9;
        goto LABEL_72;
      case 'u':
        if (a2 + 1 != a3)
        {
          int v6 = a2[1];
          if ((v6 & 0xF8) == 0x30 || (v6 & 0xFE) == 0x38 || (v6 | 0x20u) - 97 < 6)
          {
            uint64_t v4 = a2 + 2;
            if (a2 + 2 != a3)
            {
              int v7 = *v4;
              if ((v7 & 0xF8) == 0x30 || (v7 & 0xFE) == 0x38 || (v7 | 0x20u) - 97 < 6) {
                goto LABEL_27;
              }
            }
          }
        }
        goto LABEL_81;
      case 'v':
        if (!a4) {
          goto LABEL_60;
        }
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        __int16 v14 = 11;
        goto LABEL_72;
      case 'x':
LABEL_27:
        if (v4 + 1 == a3) {
          goto LABEL_81;
        }
        unsigned __int8 v8 = v4[1];
        char v9 = -48;
        if ((v8 & 0xF8) == 0x30 || (v8 & 0xFE) == 0x38) {
          goto LABEL_32;
        }
        v8 |= 0x20u;
        if ((v8 - 97) >= 6u) {
          goto LABEL_81;
        }
        char v9 = -87;
LABEL_32:
        if (v4 + 2 == a3) {
          goto LABEL_81;
        }
        unsigned __int8 v10 = v4[2];
        char v11 = -48;
        if ((v10 & 0xF8) == 0x30 || (v10 & 0xFE) == 0x38) {
          goto LABEL_37;
        }
        v10 |= 0x20u;
        if ((v10 - 97) >= 6u) {
          goto LABEL_81;
        }
        char v11 = -87;
LABEL_37:
        char v12 = v11 + v10 + 16 * (v9 + v8);
        if (!a4) {
          sub_25B5D7850(a1);
        }
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(unsigned char *)a4 = v12;
        *((unsigned char *)a4 + 1) = 0;
        v4 += 3;
        break;
      default:
        goto LABEL_51;
    }
    return v4;
  }
  if ((char)v5 == 48)
  {
    if (!a4) {
      goto LABEL_60;
    }
    if (*((char *)a4 + 23) < 0)
    {
      a4[1] = 1;
      a4 = (uint64_t *)*a4;
    }
    else
    {
      *((unsigned char *)a4 + 23) = 1;
    }
    *(_WORD *)a4 = 0;
    return a2 + 1;
  }
  if ((char)v5 != 99)
  {
    if ((char)v5 == 102)
    {
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        __int16 v14 = 12;
LABEL_72:
        *(_WORD *)a4 = v14;
        return a2 + 1;
      }
LABEL_60:
      sub_25B5D7850(a1);
    }
LABEL_51:
    if ((char)v5 != 95
      && ((char)v5 < 0 || (*(_DWORD *)(*(void *)(*(void *)(a1 + 8) + 16) + 4 * v5) & 0x500) == 0))
    {
      if (!a4) {
        goto LABEL_60;
      }
      if (*((char *)a4 + 23) < 0)
      {
        a4[1] = 1;
        a4 = (uint64_t *)*a4;
      }
      else
      {
        *((unsigned char *)a4 + 23) = 1;
      }
      *(unsigned char *)a4 = v5;
      *((unsigned char *)a4 + 1) = 0;
      return a2 + 1;
    }
LABEL_81:
    sub_25B5D77F8();
  }
  if (a2 + 1 == a3) {
    goto LABEL_81;
  }
  unsigned __int8 v13 = a2[1];
  if (((v13 & 0xDF) - 65) > 0x19u) {
    goto LABEL_81;
  }
  if (!a4) {
    sub_25B5D7850(a1);
  }
  if (*((char *)a4 + 23) < 0)
  {
    a4[1] = 1;
    a4 = (uint64_t *)*a4;
  }
  else
  {
    *((unsigned char *)a4 + 23) = 1;
  }
  *(unsigned char *)a4 = v13 & 0x1F;
  *((unsigned char *)a4 + 1) = 0;
  return a2 + 2;
}

void sub_25B5D82B4(uint64_t a1, uint64_t a2, char *a3, char *a4)
{
  sub_25B5D1570(&__s, a3, a4, a4 - a3);
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    if (!__s.__r_.__value_.__l.__size_) {
      goto LABEL_9;
    }
    p_s = (std::string *)__s.__r_.__value_.__r.__words[0];
  }
  else
  {
    if (!*((unsigned char *)&__s.__r_.__value_.__s + 23)) {
      return;
    }
    p_s = &__s;
  }
  std::__get_collation_name(&v11, (const char *)p_s);
  *(_OWORD *)a1 = *(_OWORD *)&v11.__r_.__value_.__l.__data_;
  unint64_t v7 = v11.__r_.__value_.__r.__words[2];
  *(void *)(a1 + 16) = *((void *)&v11.__r_.__value_.__l + 2);
  unint64_t v8 = HIBYTE(v7);
  if ((v8 & 0x80u) != 0) {
    unint64_t v8 = *(void *)(a1 + 8);
  }
  if (v8) {
    goto LABEL_9;
  }
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    if (__s.__r_.__value_.__l.__size_ >= 3) {
      goto LABEL_9;
    }
  }
  else if (HIBYTE(__s.__r_.__value_.__r.__words[2]) >= 3u)
  {
    return;
  }
  (*(void (**)(std::string *__return_ptr))(**(void **)(a2 + 16) + 32))(&v11);
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
  *(std::string *)a1 = v11;
  if ((*(char *)(a1 + 23) & 0x80000000) == 0)
  {
    int v9 = *(unsigned __int8 *)(a1 + 23);
    if (v9 != 12 && v9 != 1)
    {
      *(unsigned char *)a1 = 0;
      *(unsigned char *)(a1 + 23) = 0;
      goto LABEL_9;
    }
    goto LABEL_23;
  }
  uint64_t v10 = *(void *)(a1 + 8);
  if (v10 == 1 || v10 == 12)
  {
LABEL_23:
    std::string::operator=((std::string *)a1, &__s);
    goto LABEL_9;
  }
  **(unsigned char **)a1 = 0;
  *(void *)(a1 + 8) = 0;
LABEL_9:
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__s.__r_.__value_.__l.__data_);
  }
}

void sub_25B5D843C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (*(char *)(v17 + 23) < 0) {
    operator delete(*(void **)v17);
  }
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_25B5D8470()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x261163C10](exception, 1);
  __cxa_throw(exception, (struct type_info *)&unk_2708F23C8, MEMORY[0x263F8C098]);
}

void sub_25B5D84B4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_25B5D84C8()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x261163C10](exception, 2);
  __cxa_throw(exception, (struct type_info *)&unk_2708F23C8, MEMORY[0x263F8C098]);
}

void sub_25B5D850C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_25B5D8520(void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    uint64_t v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 48;
        sub_25B401104(v4);
      }
      while ((void *)v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void sub_25B5D85A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(char **)(a2 + 16);
  uint64_t v5 = *(char **)(a2 + 24);
  if (v4 == v5)
  {
    uint64_t v8 = 0;
    int v9 = *(unsigned __int8 *)(a1 + 168);
    goto LABEL_170;
  }
  if (!*(unsigned char *)(a1 + 171) || v4 + 1 == v5) {
    goto LABEL_35;
  }
  char v6 = *v4;
  LOBYTE(v85) = *v4;
  char v7 = v4[1];
  HIBYTE(v85) = v7;
  if (*(unsigned char *)(a1 + 169))
  {
    LOBYTE(v85) = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), v6);
    HIBYTE(v85) = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), v7);
  }
  *((unsigned char *)&__s.__r_.__value_.__s + 23) = 2;
  LOWORD(__s.__r_.__value_.__l.__data_) = v85;
  __s.__r_.__value_.__s.__data_[2] = 0;
  memset(&__p, 0, sizeof(__p));
  std::__get_collation_name(&v86, (const char *)&__s);
  std::string __p = v86;
  std::string::size_type size = HIBYTE(v86.__r_.__value_.__r.__words[2]);
  int v11 = SHIBYTE(v86.__r_.__value_.__r.__words[2]);
  if ((v86.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type size = v86.__r_.__value_.__l.__size_;
  }
  if (size) {
    goto LABEL_11;
  }
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    if (__s.__r_.__value_.__l.__size_ >= 3) {
      goto LABEL_11;
    }
  }
  else if (HIBYTE(__s.__r_.__value_.__r.__words[2]) >= 3u)
  {
    goto LABEL_15;
  }
  (*(void (**)(std::string *__return_ptr))(**(void **)(a1 + 32) + 32))(&v86);
  if (v11 < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  std::string __p = v86;
  if ((SHIBYTE(v86.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if (HIBYTE(v86.__r_.__value_.__r.__words[2]) != 12 && HIBYTE(v86.__r_.__value_.__r.__words[2]) != 1)
    {
      __p.__r_.__value_.__s.__data_[0] = 0;
      *((unsigned char *)&__p.__r_.__value_.__s + 23) = 0;
      goto LABEL_11;
    }
    goto LABEL_113;
  }
  if (__p.__r_.__value_.__l.__size_ == 1 || __p.__r_.__value_.__l.__size_ == 12)
  {
LABEL_113:
    std::string::operator=(&__p, &__s);
    goto LABEL_11;
  }
  *__p.__r_.__value_.__l.__data_ = 0;
  __p.__r_.__value_.__l.__size_ = 0;
LABEL_11:
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__s.__r_.__value_.__l.__data_);
  }
LABEL_15:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::size_type v22 = __p.__r_.__value_.__l.__size_;
    operator delete(__p.__r_.__value_.__l.__data_);
    if (v22) {
      goto LABEL_17;
    }
LABEL_35:
    int v9 = 0;
    uint64_t v8 = 1;
    goto LABEL_36;
  }
  if (!*((unsigned char *)&__p.__r_.__value_.__s + 23)) {
    goto LABEL_35;
  }
LABEL_17:
  uint64_t v12 = *(void *)(a1 + 112);
  uint64_t v13 = *(void *)(a1 + 120) - v12;
  if (v13)
  {
    uint64_t v14 = v13 >> 1;
    if ((unint64_t)(v13 >> 1) <= 1) {
      uint64_t v14 = 1;
    }
    long long v15 = (unsigned __int8 *)(v12 + 1);
    while (v85 != *(v15 - 1) || HIBYTE(v85) != *v15)
    {
      v15 += 2;
      if (!--v14) {
        goto LABEL_26;
      }
    }
    goto LABEL_167;
  }
LABEL_26:
  if (!*(unsigned char *)(a1 + 170) || *(void *)(a1 + 88) == *(void *)(a1 + 96))
  {
    int v9 = 0;
  }
  else
  {
    sub_25B5D8EC0((uint64_t)&__s, a1 + 16, (char *)&v85, (char *)&v86);
    uint64_t v17 = *(void **)(a1 + 88);
    uint64_t v18 = *(void *)(a1 + 96) - (void)v17;
    if (v18)
    {
      unint64_t v19 = 0;
      unint64_t v20 = 0xAAAAAAAAAAAAAAABLL * (v18 >> 4);
      while ((int)(sub_25B4954C0(v17, &__s) << 24) > 0xFFFFFF
           || (int)(sub_25B4954C0(&__s, v17 + 3) << 24) >= 0x1000000)
      {
        ++v19;
        v17 += 6;
        if (v19 >= v20) {
          goto LABEL_33;
        }
      }
      int v9 = 1;
      int v21 = 5;
    }
    else
    {
LABEL_33:
      int v9 = 0;
      int v21 = 0;
    }
    if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__s.__r_.__value_.__l.__data_);
    }
    if (v9) {
      goto LABEL_145;
    }
  }
  if (*(void *)(a1 + 136) == *(void *)(a1 + 144))
  {
LABEL_149:
    if ((char)v85 < 0)
    {
      int v76 = *(_DWORD *)(a1 + 164);
    }
    else
    {
      int v73 = *(_DWORD *)(a1 + 160);
      uint64_t v74 = *(void *)(*(void *)(a1 + 24) + 16);
      int v75 = *(_DWORD *)(v74 + 4 * v85);
      if (((v75 & v73) != 0 || v85 == 95 && (v73 & 0x80) != 0)
        && (SHIBYTE(v85) & 0x80000000) == 0
        && ((*(_DWORD *)(v74 + 4 * HIBYTE(v85)) & v73) != 0 || (v73 & 0x80) != 0 && HIBYTE(v85) == 95))
      {
        goto LABEL_167;
      }
      int v76 = *(_DWORD *)(a1 + 164);
      if ((v75 & v76) != 0 || v85 == 95 && (v76 & 0x80) != 0)
      {
LABEL_166:
        int v77 = v9;
LABEL_168:
        int v9 = v77;
        goto LABEL_169;
      }
    }
    if ((SHIBYTE(v85) & 0x80000000) == 0)
    {
      if ((*(_DWORD *)(*(void *)(*(void *)(a1 + 24) + 16) + 4 * HIBYTE(v85)) & v76) == 0)
      {
        int v77 = 1;
        if (HIBYTE(v85) != 95 || (v76 & 0x80) == 0) {
          goto LABEL_168;
        }
      }
      goto LABEL_166;
    }
LABEL_167:
    int v77 = 1;
    goto LABEL_168;
  }
  sub_25B5D8F84((uint64_t)&__s, a1 + 16, (char *)&v85, (char *)&v86);
  uint64_t v57 = *(void *)(a1 + 136);
  uint64_t v58 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
  uint64_t v59 = *(void *)(a1 + 144) - v57;
  if (!v59)
  {
    if ((*((unsigned char *)&__s.__r_.__value_.__s + 23) & 0x80) != 0) {
      operator delete(__s.__r_.__value_.__l.__data_);
    }
    goto LABEL_149;
  }
  uint64_t v60 = 0;
  unint64_t v61 = v59 / 24;
  long long v62 = *(_OWORD *)&__s.__r_.__value_.__l.__data_;
  if ((__s.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v63 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v63 = __s.__r_.__value_.__l.__size_;
  }
  if (v61 <= 1) {
    uint64_t v64 = 1;
  }
  else {
    uint64_t v64 = v59 / 24;
  }
  BOOL v65 = 1;
  while (1)
  {
    uint64_t v66 = v57 + 24 * v60;
    uint64_t v67 = *(unsigned __int8 *)(v66 + 23);
    int v68 = (char)v67;
    if ((v67 & 0x80u) != 0) {
      uint64_t v67 = *(void *)(v66 + 8);
    }
    if (v63 != v67) {
      goto LABEL_140;
    }
    uint64_t v69 = v68 >= 0 ? (unsigned __int8 *)(v57 + 24 * v60) : *(unsigned __int8 **)v66;
    if ((v58 & 0x80) == 0) {
      break;
    }
    unint64_t v82 = v61;
    uint64_t v83 = v58;
    int v72 = memcmp((const void *)v62, v69, *((size_t *)&v62 + 1));
    unint64_t v61 = v82;
    uint64_t v58 = v83;
    if (!v72)
    {
      int v21 = 5;
      int v9 = 1;
      goto LABEL_143;
    }
LABEL_140:
    BOOL v65 = ++v60 < v61;
    if (v60 == v64)
    {
      int v21 = 0;
      goto LABEL_142;
    }
  }
  if (!v58)
  {
    int v9 = 1;
    if (v65) {
      goto LABEL_169;
    }
    goto LABEL_149;
  }
  p_s = &__s;
  uint64_t v71 = v58;
  do
  {
    if (p_s->__r_.__value_.__s.__data_[0] != *v69) {
      goto LABEL_140;
    }
    p_s = (std::string *)((char *)p_s + 1);
    ++v69;
    --v71;
  }
  while (v71);
  int v9 = 1;
  int v21 = 5;
LABEL_142:
  if ((v58 & 0x80) != 0) {
LABEL_143:
  }
    operator delete(__s.__r_.__value_.__l.__data_);
  if (!v65) {
    goto LABEL_149;
  }
LABEL_145:
  if (v21)
  {
LABEL_169:
    uint64_t v8 = 2;
    goto LABEL_170;
  }
  uint64_t v8 = 2;
LABEL_36:
  unsigned __int8 v23 = **(unsigned char **)(a2 + 16);
  v86.__r_.__value_.__s.__data_[0] = v23;
  if (*(unsigned char *)(a1 + 169))
  {
    unsigned __int8 v23 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), (char)v23);
    v86.__r_.__value_.__s.__data_[0] = v23;
  }
  unint64_t v24 = *(unsigned __int8 **)(a1 + 40);
  unint64_t v25 = *(void *)(a1 + 48) - (void)v24;
  if (v25)
  {
    if (v25 <= 1) {
      unint64_t v25 = 1;
    }
    while (1)
    {
      int v26 = *v24++;
      if (v26 == v23) {
        break;
      }
      if (!--v25) {
        goto LABEL_43;
      }
    }
LABEL_103:
    int v9 = 1;
    goto LABEL_170;
  }
LABEL_43:
  unsigned int v27 = *(_DWORD *)(a1 + 164);
  if (v27 || *(void *)(a1 + 64) != *(void *)(a1 + 72))
  {
    if ((v23 & 0x80) != 0 || (*(_DWORD *)(*(void *)(*(void *)(a1 + 24) + 16) + 4 * v23) & v27) == 0) {
      int v28 = (v23 == 95) & (v27 >> 7);
    }
    else {
      LOBYTE(v28) = 1;
    }
    __int16 v29 = *(void **)(a1 + 72);
    uint64_t v30 = memchr(*(void **)(a1 + 64), (char)v23, (size_t)v29 - *(void *)(a1 + 64));
    uint64_t v31 = v30 ? v30 : v29;
    if ((v28 & 1) == 0 && v31 == v29) {
      goto LABEL_103;
    }
  }
  unint64_t v33 = *(char **)(a1 + 88);
  uint64_t v32 = *(char **)(a1 + 96);
  if (v33 != v32)
  {
    if (*(unsigned char *)(a1 + 170))
    {
      sub_25B5D8EC0((uint64_t)&__s, a1 + 16, (char *)&v86, &v86.__r_.__value_.__s.__data_[1]);
      unint64_t v33 = *(char **)(a1 + 88);
      uint64_t v32 = *(char **)(a1 + 96);
    }
    else
    {
      *((unsigned char *)&__s.__r_.__value_.__s + 23) = 1;
      LOWORD(__s.__r_.__value_.__l.__data_) = v23;
    }
    uint64_t v34 = v32 - v33;
    if (v34)
    {
      unint64_t v35 = 0;
      unint64_t v36 = 0xAAAAAAAAAAAAAAABLL * (v34 >> 4);
      while ((int)(sub_25B4954C0(v33, &__s) << 24) > 0xFFFFFF
           || (int)(sub_25B4954C0(&__s, (void *)v33 + 3) << 24) >= 0x1000000)
      {
        ++v35;
        v33 += 48;
        if (v35 >= v36) {
          goto LABEL_64;
        }
      }
      char v37 = 1;
      int v9 = 1;
    }
    else
    {
LABEL_64:
      char v37 = 0;
    }
    if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__s.__r_.__value_.__l.__data_);
    }
    if (v37) {
      goto LABEL_170;
    }
  }
  if (*(void *)(a1 + 136) == *(void *)(a1 + 144)) {
    goto LABEL_98;
  }
  sub_25B5D8F84((uint64_t)&__s, a1 + 16, (char *)&v86, &v86.__r_.__value_.__s.__data_[1]);
  uint64_t v38 = *(void *)(a1 + 136);
  uint64_t v39 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
  uint64_t v40 = *(void *)(a1 + 144) - v38;
  if (!v40)
  {
    if ((*((unsigned char *)&__s.__r_.__value_.__s + 23) & 0x80) != 0) {
      operator delete(__s.__r_.__value_.__l.__data_);
    }
    goto LABEL_98;
  }
  uint64_t v41 = 0;
  unint64_t v42 = v40 / 24;
  long long v43 = *(_OWORD *)&__s.__r_.__value_.__l.__data_;
  if ((__s.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v44 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v44 = __s.__r_.__value_.__l.__size_;
  }
  if (v42 <= 1) {
    uint64_t v45 = 1;
  }
  else {
    uint64_t v45 = v40 / 24;
  }
  BOOL v46 = 1;
  while (2)
  {
    uint64_t v47 = (unsigned __int8 **)(v38 + 24 * v41);
    uint64_t v48 = (unsigned __int8 *)*((unsigned __int8 *)v47 + 23);
    int v49 = (char)v48;
    if ((char)v48 < 0) {
      uint64_t v48 = v47[1];
    }
    if ((unsigned __int8 *)v44 != v48)
    {
LABEL_91:
      BOOL v46 = ++v41 < v42;
      if (v41 == v45)
      {
LABEL_92:
        if ((v39 & 0x80) == 0) {
          goto LABEL_94;
        }
        goto LABEL_93;
      }
      continue;
    }
    break;
  }
  if (v49 >= 0) {
    unint64_t v50 = (unsigned __int8 *)(v38 + 24 * v41);
  }
  else {
    unint64_t v50 = *v47;
  }
  if ((v39 & 0x80) != 0)
  {
    int v81 = v9;
    std::string::size_type v53 = v44;
    uint64_t v80 = v38;
    int v54 = memcmp((const void *)v43, v50, *((size_t *)&v43 + 1));
    uint64_t v38 = v80;
    std::string::size_type v44 = v53;
    int v9 = v81;
    if (!v54)
    {
      int v9 = 1;
LABEL_93:
      operator delete(__s.__r_.__value_.__l.__data_);
      goto LABEL_94;
    }
    goto LABEL_91;
  }
  if (v39)
  {
    BOOL v51 = &__s;
    uint64_t v52 = v39;
    while (v51->__r_.__value_.__s.__data_[0] == *v50)
    {
      BOOL v51 = (std::string *)((char *)v51 + 1);
      ++v50;
      if (!--v52)
      {
        int v9 = 1;
        goto LABEL_92;
      }
    }
    goto LABEL_91;
  }
  int v9 = 1;
LABEL_94:
  if (!v46)
  {
LABEL_98:
    if (v86.__r_.__value_.__s.__data_[0] < 0) {
      goto LABEL_170;
    }
    unsigned int v55 = *(_DWORD *)(a1 + 160);
    if ((*(_DWORD *)(*(void *)(*(void *)(a1 + 24) + 16) + 4 * v86.__r_.__value_.__s.__data_[0]) & v55) == 0)
    {
      int v56 = (v55 >> 7) & 1;
      if (v86.__r_.__value_.__s.__data_[0] != 95) {
        int v56 = 0;
      }
      if (v56 != 1) {
        goto LABEL_170;
      }
    }
    goto LABEL_103;
  }
LABEL_170:
  if (v9 == *(unsigned __int8 *)(a1 + 168))
  {
    uint64_t v78 = 0;
    int v79 = -993;
  }
  else
  {
    *(void *)(a2 + 16) += v8;
    uint64_t v78 = *(void *)(a1 + 8);
    int v79 = -995;
  }
  *(_DWORD *)a2 = v79;
  *(void *)(a2 + 80) = v78;
}

void sub_25B5D8E84(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  if (a28 < 0) {
    operator delete(a23);
  }
  _Unwind_Resume(exception_object);
}

void sub_25B5D8EC0(uint64_t a1, uint64_t a2, char *a3, char *a4)
{
  sub_25B5D1570(__p, a3, a4, a4 - a3);
  unint64_t v5 = v8;
  if ((v8 & 0x80u) == 0) {
    char v6 = __p;
  }
  else {
    char v6 = (void **)__p[0];
  }
  if ((v8 & 0x80u) != 0) {
    unint64_t v5 = (unint64_t)__p[1];
  }
  (*(void (**)(void, void **, char *))(**(void **)(a2 + 16) + 32))(*(void *)(a2 + 16), v6, (char *)v6 + v5);
  if ((char)v8 < 0) {
    operator delete(__p[0]);
  }
}

void sub_25B5D8F68(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_25B5D8F84(uint64_t a1, uint64_t a2, char *a3, char *a4)
{
  sub_25B5D1570(__p, a3, a4, a4 - a3);
  unint64_t v6 = v12;
  if ((v12 & 0x80u) == 0) {
    char v7 = __p;
  }
  else {
    char v7 = (void **)__p[0];
  }
  if ((v12 & 0x80u) != 0) {
    unint64_t v6 = (unint64_t)__p[1];
  }
  (*(void (**)(void, void **, char *))(**(void **)(a2 + 16) + 32))(*(void *)(a2 + 16), v7, (char *)v7 + v6);
  uint64_t v8 = *(unsigned __int8 *)(a1 + 23);
  int v9 = (char)v8;
  if ((v8 & 0x80u) != 0) {
    uint64_t v8 = *(void *)(a1 + 8);
  }
  if (v8 != 1)
  {
    if (v8 == 12)
    {
      if (v9 >= 0) {
        uint64_t v10 = (unsigned char *)a1;
      }
      else {
        uint64_t v10 = *(unsigned char **)a1;
      }
      v10[11] = v10[3];
    }
    else if (v9 < 0)
    {
      **(unsigned char **)a1 = 0;
      *(void *)(a1 + 8) = 0;
    }
    else
    {
      *(unsigned char *)a1 = 0;
      *(unsigned char *)(a1 + 23) = 0;
    }
  }
  if ((char)v12 < 0) {
    operator delete(__p[0]);
  }
}

void sub_25B5D9084(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_25B5D90A0(std::locale *a1)
{
  sub_25B5D90D8(a1);

  JUMPOUT(0x261163EE0);
}

std::locale *sub_25B5D90D8(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_2708F2540;
  char v7 = a1 + 17;
  sub_25B41032C((void ***)&v7);
  locale = a1[14].__locale_;
  if (locale)
  {
    a1[15].__locale_ = locale;
    operator delete(locale);
  }
  char v7 = a1 + 11;
  sub_25B5D8520((void ***)&v7);
  uint64_t v3 = a1[8].__locale_;
  if (v3)
  {
    a1[9].__locale_ = v3;
    operator delete(v3);
  }
  uint64_t v4 = a1[5].__locale_;
  if (v4)
  {
    a1[6].__locale_ = v4;
    operator delete(v4);
  }
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&unk_2708F22D0;
  unint64_t v5 = a1[1].__locale_;
  if (v5) {
    (*(void (**)(std::locale::__imp *))(*(void *)v5 + 8))(v5);
  }
  return a1;
}

uint64_t sub_25B5D91C4(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unsigned char **)(a2 + 16);
  if (v2 == *(unsigned char **)(a2 + 24) || !*v2)
  {
    uint64_t v3 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(void *)(a2 + 16) = v2 + 1;
    uint64_t v3 = *(void *)(result + 8);
  }
  *(void *)(a2 + 80) = v3;
  return result;
}

void sub_25B5D9204(void *a1)
{
  *a1 = &unk_2708F22D0;
  uint64_t v1 = a1[1];
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }

  JUMPOUT(0x261163EE0);
}

void *sub_25B5D9290(void *a1)
{
  *a1 = &unk_2708F22D0;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

uint64_t sub_25B5D92FC(uint64_t a1, unsigned __int8 a2)
{
  if (((a2 & 0xF8) == 0x30 || (a2 & 0xFE) == 0x38) && a2 - 49 <= 8)
  {
    if (a2 - 48 <= *(_DWORD *)(a1 + 28)) {
      sub_25B5D93B4(a1);
    }
    sub_25B5D935C();
  }
  return 0;
}

void sub_25B5D935C()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x261163C10](exception, 4);
  __cxa_throw(exception, (struct type_info *)&unk_2708F23C8, MEMORY[0x263F8C098]);
}

void sub_25B5D93A0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_25B5D93B4(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 24);
  if ((v1 & 1) == 0)
  {
    if ((v1 & 8) == 0) {
      operator new();
    }
    operator new();
  }
  operator new();
}

unsigned int *sub_25B5D94E4(unsigned int *result, uint64_t a2)
{
  unint64_t v2 = result[4];
  uint64_t v3 = *(void *)(a2 + 32);
  if (0xAAAAAAAAAAAAAAABLL * ((*(void *)(a2 + 40) - v3) >> 3) < v2) {
    sub_25B5D935C();
  }
  unsigned int v5 = v2 - 1;
  if (*(unsigned char *)(v3 + 24 * v5 + 16)
    && (unint64_t v6 = result,
        uint64_t v7 = v3 + 24 * v5,
        __n128 result = *(unsigned int **)v7,
        int64_t v8 = *(void *)(v7 + 8) - *(void *)v7,
        uint64_t v9 = *(void *)(a2 + 16),
        *(void *)(a2 + 24) - v9 >= v8)
    && (__n128 result = (unsigned int *)memcmp(result, *(const void **)(a2 + 16), v8), !result))
  {
    *(_DWORD *)a2 = -994;
    *(void *)(a2 + 16) = v9 + v8;
    uint64_t v10 = *((void *)v6 + 1);
  }
  else
  {
    uint64_t v10 = 0;
    *(_DWORD *)a2 = -993;
  }
  *(void *)(a2 + 80) = v10;
  return result;
}

void sub_25B5D95A4(void *a1)
{
  *a1 = &unk_2708F22D0;
  uint64_t v1 = a1[1];
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }

  JUMPOUT(0x261163EE0);
}

void *sub_25B5D9630(void *a1)
{
  *a1 = &unk_2708F22D0;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

uint64_t sub_25B5D969C(uint64_t result, uint64_t a2)
{
  unsigned int v2 = *(_DWORD *)(result + 40) - 1;
  uint64_t v3 = *(void *)(a2 + 32);
  if (*(unsigned char *)(v3 + 24 * v2 + 16))
  {
    uint64_t v4 = (unsigned __int8 **)(v3 + 24 * v2);
    unsigned int v5 = *v4;
    uint64_t v6 = v4[1] - *v4;
    uint64_t v7 = *(void *)(a2 + 16);
    if (*(void *)(a2 + 24) - v7 >= v6)
    {
      if (v6 < 1)
      {
LABEL_8:
        *(_DWORD *)a2 = -994;
        *(void *)(a2 + 16) = v7 + v6;
        uint64_t v8 = *(void *)(result + 8);
        goto LABEL_9;
      }
      uint64_t v9 = v6;
      uint64_t v10 = *(unsigned __int8 **)(a2 + 16);
      while (1)
      {
        int v12 = *v5++;
        int v11 = v12;
        int v13 = *v10++;
        if (v11 != v13) {
          break;
        }
        if (!--v9) {
          goto LABEL_8;
        }
      }
    }
  }
  uint64_t v8 = 0;
  *(_DWORD *)a2 = -993;
LABEL_9:
  *(void *)(a2 + 80) = v8;
  return result;
}

void sub_25B5D972C(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_2708F24E0;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&unk_2708F22D0;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }

  JUMPOUT(0x261163EE0);
}

std::locale *sub_25B5D97D8(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_2708F24E0;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&unk_2708F22D0;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

uint64_t sub_25B5D9864(uint64_t result, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 32) + 24 * (*(_DWORD *)(result + 40) - 1);
  if (*(unsigned char *)(v3 + 16))
  {
    uint64_t v4 = *(void *)(v3 + 8) - *(void *)v3;
    uint64_t v5 = *(void *)(a2 + 16);
    if (*(void *)(a2 + 24) - v5 >= v4)
    {
      uint64_t v7 = result;
      if (v4 < 1)
      {
LABEL_9:
        *(_DWORD *)a2 = -994;
        *(void *)(a2 + 16) = v5 + v4;
        uint64_t v6 = *(void *)(v7 + 8);
        goto LABEL_10;
      }
      uint64_t v8 = 0;
      while (1)
      {
        int v9 = (*(uint64_t (**)(void, void))(**(void **)(v7 + 24) + 40))(*(void *)(v7 + 24), *(char *)(*(void *)v3 + v8));
        __n128 result = (*(uint64_t (**)(void, void))(**(void **)(v7 + 24) + 40))(*(void *)(v7 + 24), *(char *)(*(void *)(a2 + 16) + v8));
        if (v9 != result) {
          break;
        }
        if (v4 == ++v8)
        {
          uint64_t v5 = *(void *)(a2 + 16);
          goto LABEL_9;
        }
      }
    }
  }
  uint64_t v6 = 0;
  *(_DWORD *)a2 = -993;
LABEL_10:
  *(void *)(a2 + 80) = v6;
  return result;
}

void sub_25B5D997C(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_2708F24B0;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&unk_2708F22D0;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }

  JUMPOUT(0x261163EE0);
}

std::locale *sub_25B5D9A28(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_2708F24B0;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&unk_2708F22D0;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

unsigned __int8 *sub_25B5D9AB4(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  uint64_t v3 = a2;
  if (a2 != a3)
  {
    uint64_t v7 = a2 + 1;
    int v6 = *a2;
    if ((a2 + 1 != a3 || v6 != 36)
      && ((v6 - 46) > 0x2E || ((1 << (v6 - 46)) & 0x600000000001) == 0))
    {
      sub_25B5D7850(a1);
    }
    int v9 = sub_25B5D9E14(a1, a2, a3);
    if (v9 == v3)
    {
      if (*v3 == 46) {
        operator new();
      }
      int v9 = sub_25B5D59AC(a1, v3, a3);
    }
    if (v9 == v3 && v9 != a3)
    {
      if (v7 == a3 || *v3 != 92) {
        return v3;
      }
      int v10 = *v7;
      if (v10 == 40)
      {
        uint64_t v11 = (uint64_t)(v3 + 2);
        sub_25B5D4BE8(a1);
        do
        {
          int v12 = (unsigned __int8 *)v11;
          uint64_t v11 = sub_25B5D9AB4(a1, v11, a3);
        }
        while ((unsigned __int8 *)v11 != v12);
        if (v12 == a3 || v12 + 1 == a3 || *v12 != 92 || v12[1] != 41) {
          sub_25B5D4C6C();
        }
        int v9 = v12 + 2;
        sub_25B5D4CC4(a1);
      }
      else
      {
        int v13 = sub_25B5D92FC(a1, v10);
        uint64_t v14 = 2;
        if (!v13) {
          uint64_t v14 = 0;
        }
        int v9 = &v3[v14];
      }
    }
    if (v9 != v3)
    {
      if (v9 == a3)
      {
        return a3;
      }
      else
      {
        int v15 = *v9;
        if (v15 == 42) {
          sub_25B5D503C();
        }
        if (v9 + 1 != a3 && v15 == 92 && v9[1] == 123)
        {
          int v22 = 0;
          unint64_t v16 = sub_25B5D51CC(v9 + 2, a3, &v22);
          if (v16 == v9 + 2) {
            goto LABEL_45;
          }
          if (v16 != a3)
          {
            uint64_t v17 = v16 + 1;
            int v18 = *v16;
            if (v18 == 44)
            {
              int v21 = -1;
              unint64_t v19 = sub_25B5D51CC(v16 + 1, a3, &v21);
              if (v19 != a3 && v19 + 1 != a3 && *v19 == 92 && v19[1] == 125)
              {
                if (v21 != -1 && v21 < v22) {
LABEL_45:
                }
                  sub_25B5D5268();
LABEL_50:
                sub_25B5D503C();
              }
            }
            else if (v17 != a3 && v18 == 92 && *v17 == 125)
            {
              goto LABEL_50;
            }
          }
          sub_25B5D52C0();
        }
        return v9;
      }
    }
  }
  return v3;
}

unsigned char *sub_25B5D9E14(uint64_t a1, unsigned char *a2, unsigned char *a3)
{
  if (a2 != a3
    && a2 + 1 != a3
    && *a2 == 92
    && ((char)a2[1] - 36) <= 0x3A
    && ((1 << (a2[1] - 36)) & 0x580000000000441) != 0)
  {
    sub_25B5D7850(a1);
  }
  return a2;
}

unsigned __int8 *sub_25B5D9E90(_DWORD *a1, unsigned __int8 *a2, char *a3)
{
  if (a2 == (unsigned __int8 *)a3) {
    return a2;
  }
  int v6 = (char)*a2;
  int v7 = *a2;
  if (v6 > 91)
  {
    if (v6 == 92)
    {
      if (a2 + 1 == (unsigned __int8 *)a3) {
        goto LABEL_25;
      }
      int v13 = a2[1];
      if (v13 == 66 || v13 == 98) {
        sub_25B5DA5EC();
      }
      goto LABEL_24;
    }
    if (v6 == 94) {
      sub_25B5D4AE0();
    }
  }
  else
  {
    if (v6 == 36) {
      sub_25B5D4B64();
    }
    BOOL v9 = v6 == 40;
    uint64_t v8 = (char *)(a2 + 1);
    BOOL v9 = !v9 || v8 == a3;
    if (!v9)
    {
      int v10 = (char *)(a2 + 2);
      if (*v8 == 63 && v10 != a3)
      {
        int v12 = *v10;
        if (v12 == 33)
        {
          sub_25B5D3B6C(v28);
          long long v29 = 0u;
          uint64_t v31 = 0;
          long long v30 = 0u;
          LODWORD(v29) = a1[6];
          sub_25B5D3BCC(v28, a2 + 3, a3);
          sub_25B5DA680();
        }
        if (v12 == 61)
        {
          sub_25B5D3B6C(v28);
          long long v29 = 0u;
          uint64_t v31 = 0;
          long long v30 = 0u;
          LODWORD(v29) = a1[6];
          sub_25B5D3BCC(v28, a2 + 3, a3);
          sub_25B5DA680();
        }
      }
LABEL_24:
      int v7 = *a2;
    }
  }
LABEL_25:
  if ((char)v7 <= 91)
  {
    __n128 result = a2;
    switch((char)v7)
    {
      case '$':
      case ')':
        return result;
      case '%':
      case '&':
      case '\'':
      case ',':
      case '-':
        goto LABEL_52;
      case '(':
        if (a2 + 1 == (unsigned __int8 *)a3) {
          goto LABEL_80;
        }
        if (a2 + 2 != (unsigned __int8 *)a3 && a2[1] == 63 && a2[2] == 58)
        {
          int v15 = a1 + 9;
          ++a1[9];
          unint64_t v16 = (char *)sub_25B5D40C0(a1, a2 + 3, a3);
          if (v16 == a3) {
            goto LABEL_80;
          }
          uint64_t v17 = v16;
          if (*v16 != 41) {
            goto LABEL_80;
          }
        }
        else
        {
          sub_25B5D4BE8((uint64_t)a1);
          int v15 = a1 + 9;
          ++a1[9];
          unsigned __int8 v23 = (char *)sub_25B5D40C0(a1, a2 + 1, a3);
          if (v23 == a3 || (uint64_t v17 = v23, *v23 != 41)) {
LABEL_80:
          }
            sub_25B5D4C6C();
          sub_25B5D4CC4((uint64_t)a1);
        }
        --*v15;
        unint64_t v19 = (unsigned __int8 *)(v17 + 1);
        goto LABEL_49;
      case '*':
      case '+':
        goto LABEL_57;
      case '.':
        operator new();
      default:
        if ((char)v7 == 91)
        {
          unint64_t v19 = sub_25B5D59AC((uint64_t)a1, a2, a3);
          goto LABEL_49;
        }
        if ((char)v7 != 63) {
          goto LABEL_52;
        }
        goto LABEL_57;
    }
  }
  uint64_t v18 = ((char)v7 - 92);
  if (v18 > 0x21) {
LABEL_52:
  }
    sub_25B5D7850((uint64_t)a1);
  if (((1 << (v7 - 92)) & 0x300000006) != 0) {
    return a2;
  }
  if ((char)v7 != 92)
  {
    if (v18 == 31) {
LABEL_57:
    }
      sub_25B5DA49C();
    goto LABEL_52;
  }
  if (v7 != 92) {
    return a2;
  }
  unint64_t v20 = a2 + 1;
  if (a2 + 1 == (unsigned __int8 *)a3) {
    sub_25B5D77F8();
  }
  int v21 = *v20;
  unsigned int v22 = v21 - 48;
  if (v21 == 48) {
    sub_25B5D7850((uint64_t)a1);
  }
  if ((v21 - 49) <= 8)
  {
    unint64_t v24 = (char *)(a2 + 2);
    if (a2 + 2 == (unsigned __int8 *)a3) {
      goto LABEL_64;
    }
    do
    {
      int v25 = *v24;
      if ((v25 - 48) > 9) {
        break;
      }
      if (v22 >= 0x19999999) {
        goto LABEL_81;
      }
      ++v24;
      unsigned int v22 = v25 + 10 * v22 - 48;
    }
    while (v24 != a3);
    if (v22)
    {
LABEL_64:
      if (v22 <= a1[7]) {
        sub_25B5D93B4((uint64_t)a1);
      }
    }
LABEL_81:
    sub_25B5D935C();
  }
  int v26 = (char)*v20;
  if (v26 > 99)
  {
    if (v26 == 119) {
      goto LABEL_75;
    }
    if (v26 == 115) {
LABEL_79:
    }
      sub_25B5D6628();
    if (v26 != 100) {
      goto LABEL_76;
    }
LABEL_74:
    sub_25B5D6628();
  }
  switch(v26)
  {
    case 'D':
      goto LABEL_74;
    case 'S':
      goto LABEL_79;
    case 'W':
LABEL_75:
      sub_25B5D6628();
  }
LABEL_76:
  unsigned int v27 = sub_25B5D7EC8((uint64_t)a1, a2 + 1, (unsigned __int8 *)a3, 0);
  if (v27 == v20) {
    unint64_t v19 = a2;
  }
  else {
    unint64_t v19 = v27;
  }
LABEL_49:
  __n128 result = a2;
  if (v19 != a2)
  {
    return sub_25B5D4D40((uint64_t)a1, v19, (unsigned __int8 *)a3);
  }
  return result;
}

void sub_25B5DA450(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
}

void sub_25B5DA49C()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x261163C10](exception, 11);
  __cxa_throw(exception, (struct type_info *)&unk_2708F23C8, MEMORY[0x263F8C098]);
}

void sub_25B5DA4E0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_25B5DA4F4(void *a1)
{
  *a1 = &unk_2708F22D0;
  uint64_t v1 = a1[1];
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }

  JUMPOUT(0x261163EE0);
}

void *sub_25B5DA580(void *a1)
{
  *a1 = &unk_2708F22D0;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

void sub_25B5DA5EC()
{
}

void sub_25B5DA680()
{
}

void sub_25B5DA750(uint64_t a1, uint64_t a2)
{
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  char v26 = 0;
  long long v27 = 0uLL;
  char v28 = 0;
  char v29 = 0;
  uint64_t v30 = 0;
  std::string __p = 0;
  uint64_t v20 = 0;
  unint64_t v4 = (*(_DWORD *)(a1 + 44) + 1);
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 24);
  uint64_t v21 = 0;
  *(void *)&long long v22 = v5;
  *((void *)&v22 + 1) = v5;
  char v23 = 0;
  sub_25B5D27D0((char **)&__p, v4, &v22);
  uint64_t v24 = v6;
  uint64_t v25 = v6;
  char v26 = 0;
  long long v27 = v22;
  char v28 = v23;
  uint64_t v30 = v6;
  char v29 = 1;
  uint64_t v7 = *(void *)(a2 + 16);
  if (*(unsigned char *)(a2 + 92)) {
    BOOL v8 = v7 == *(void *)(a2 + 8);
  }
  else {
    BOOL v8 = 0;
  }
  char v9 = v8;
  if (*(unsigned __int8 *)(a1 + 84) == sub_25B5D2944(a1 + 16, v7, *(void *)(a2 + 24), (uint64_t *)&__p, *(_DWORD *)(a2 + 88) & 0xFBF | 0x40u, v9))
  {
    *(_DWORD *)a2 = -993;
    *(void *)(a2 + 80) = 0;
    int v10 = (char *)__p;
    goto LABEL_13;
  }
  *(_DWORD *)a2 = -994;
  *(void *)(a2 + 80) = *(void *)(a1 + 8);
  int v10 = (char *)__p;
  unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * ((v20 - (uint64_t)__p) >> 3);
  if (v11 < 2)
  {
LABEL_13:
    if (!v10) {
      return;
    }
    goto LABEL_14;
  }
  int v12 = *(_DWORD *)(a1 + 80);
  uint64_t v13 = *(void *)(a2 + 32);
  unsigned int v14 = 2;
  uint64_t v15 = 1;
  do
  {
    unint64_t v16 = &v10[24 * v15];
    uint64_t v17 = v13 + 24 * (v12 + v14 - 2);
    *(_OWORD *)uint64_t v17 = *(_OWORD *)v16;
    *(unsigned char *)(v17 + 16) = v16[16];
    uint64_t v15 = v14;
  }
  while (v11 > v14++);
LABEL_14:

  operator delete(v10);
}

void sub_25B5DA8DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_25B5DA8F8(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_2708F2390;
  uint64_t v2 = a1 + 2;
  locale = (std::__shared_weak_count *)a1[8].__locale_;
  if (locale) {
    sub_25B404120(locale);
  }
  std::locale::~locale(v2);
  a1->__locale_ = (std::locale::__imp *)&unk_2708F22D0;
  unint64_t v4 = a1[1].__locale_;
  if (v4) {
    (*(void (**)(std::locale::__imp *))(*(void *)v4 + 8))(v4);
  }

  JUMPOUT(0x261163EE0);
}

std::locale *sub_25B5DA9B8(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_2708F2390;
  uint64_t v2 = a1 + 2;
  locale = (std::__shared_weak_count *)a1[8].__locale_;
  if (locale) {
    sub_25B404120(locale);
  }
  std::locale::~locale(v2);
  a1->__locale_ = (std::locale::__imp *)&unk_2708F22D0;
  unint64_t v4 = a1[1].__locale_;
  if (v4) {
    (*(void (**)(std::locale::__imp *))(*(void *)v4 + 8))(v4);
  }
  return a1;
}

uint64_t sub_25B5DAA58(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unsigned __int8 **)(a2 + 8);
  uint64_t v3 = *(unsigned __int8 **)(a2 + 24);
  if (v2 == v3) {
    goto LABEL_17;
  }
  unint64_t v4 = *(unsigned __int8 **)(a2 + 16);
  if (v4 == v3)
  {
    if ((*(unsigned char *)(a2 + 88) & 8) == 0)
    {
      uint64_t v6 = *(v3 - 1);
      goto LABEL_13;
    }
LABEL_17:
    int v10 = 0;
    goto LABEL_25;
  }
  if (v4 == v2)
  {
    int v5 = *(_DWORD *)(a2 + 88);
    if ((v5 & 0x80) == 0)
    {
      if ((v5 & 4) == 0)
      {
        uint64_t v6 = *v2;
LABEL_13:
        if (v6 == 95
          || (v6 & 0x80) == 0 && (*(_DWORD *)(*(void *)(*(void *)(result + 24) + 16) + 4 * v6) & 0x500) != 0)
        {
          int v10 = 1;
          goto LABEL_25;
        }
        goto LABEL_17;
      }
      goto LABEL_17;
    }
  }
  uint64_t v7 = *(v4 - 1);
  uint64_t v8 = *v4;
  int v9 = v7 == 95 || (v7 & 0x80) == 0 && (*(_DWORD *)(*(void *)(*(void *)(result + 24) + 16) + 4 * v7) & 0x500) != 0;
  int v11 = v8 == 95
     || (v8 & 0x80) == 0 && (*(_DWORD *)(*(void *)(*(void *)(result + 24) + 16) + 4 * v8) & 0x500) != 0;
  int v10 = v9 != v11;
LABEL_25:
  if (*(unsigned __int8 *)(result + 40) == v10)
  {
    uint64_t v12 = 0;
    int v13 = -993;
  }
  else
  {
    uint64_t v12 = *(void *)(result + 8);
    int v13 = -994;
  }
  *(_DWORD *)a2 = v13;
  *(void *)(a2 + 80) = v12;
  return result;
}

void sub_25B5DAB6C(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_2708F2360;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&unk_2708F22D0;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }

  JUMPOUT(0x261163EE0);
}

std::locale *sub_25B5DAC18(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_2708F2360;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&unk_2708F22D0;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

uint64_t sub_25B5DACA8(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

void sub_25B5DACD8(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x261163EE0);
}

uint64_t sub_25B5DAD14(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(void *)(a2 + 80) = *(void *)(result + 8);
  return result;
}

void sub_25B5DAD28(void *a1)
{
  *a1 = &unk_2708F22D0;
  uint64_t v1 = a1[1];
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }

  JUMPOUT(0x261163EE0);
}

void *sub_25B5DADB4(void *a1)
{
  *a1 = &unk_2708F22D0;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

void sub_25B5DAE20(uint64_t a1, _DWORD *a2)
{
  *a2 = -1000;
}

void sub_25B5DAE2C()
{
}

uint64_t sub_25B5DAE44(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  sub_25B45E3AC(a1 + 152, a2);
  long long v6 = *(_OWORD *)(a2 + 8);
  long long v7 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 72) = v7;
  *(_OWORD *)(a1 + 56) = v6;
  uint64_t v8 = *a3;
  if (!*a3)
  {
    int v9 = sub_25B406B20(MEMORY[0x263F8C0F8], (uint64_t)"runtime_err in ", 15);
    int v10 = sub_25B406B20(v9, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/RoomScanCore/Sources/Utilities/wTensor/core/expression/../common/tile_helper.hpp", 118);
    sub_25B406B20(v10, (uint64_t)" ", 1);
    int v11 = (void *)MEMORY[0x263F8C0F8];
    uint64_t v12 = (void *)std::ostream::operator<<();
    sub_25B406B20(v12, (uint64_t)" ", 1);
    sub_25B406B20(v12, (uint64_t)"init", 4);
    std::ios_base::getloc((const std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
    int v13 = std::locale::use_facet(&v23, MEMORY[0x263F8C108]);
    ((void (*)(const std::locale::facet *, uint64_t))v13->__vftable[2].~facet_0)(v13, 10);
    std::locale::~locale(&v23);
    std::ostream::put();
    std::ostream::flush();
    sub_25B5DE67C();
    std::ios_base::getloc((const std::ios_base *)((char *)v11 + *(void *)(*v11 - 24)));
    unsigned int v14 = std::locale::use_facet(&v23, MEMORY[0x263F8C108]);
    ((void (*)(const std::locale::facet *, uint64_t))v14->__vftable[2].~facet_0)(v14, 10);
    std::locale::~locale(&v23);
    std::ostream::put();
    std::ostream::flush();
    uint64_t v8 = *a3;
  }
  *(void *)a1 = v8;
  uint64_t v15 = a3[1];
  if (!v15)
  {
    unint64_t v16 = sub_25B406B20(MEMORY[0x263F8C0F8], (uint64_t)"runtime_err in ", 15);
    uint64_t v17 = sub_25B406B20(v16, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/RoomScanCore/Sources/Utilities/wTensor/core/expression/../common/tile_helper.hpp", 118);
    sub_25B406B20(v17, (uint64_t)" ", 1);
    uint64_t v18 = (void *)MEMORY[0x263F8C0F8];
    unint64_t v19 = (void *)std::ostream::operator<<();
    sub_25B406B20(v19, (uint64_t)" ", 1);
    sub_25B406B20(v19, (uint64_t)"init", 4);
    std::ios_base::getloc((const std::ios_base *)((char *)v19 + *(void *)(*v19 - 24)));
    uint64_t v20 = std::locale::use_facet(&v23, MEMORY[0x263F8C108]);
    ((void (*)(const std::locale::facet *, uint64_t))v20->__vftable[2].~facet_0)(v20, 10);
    std::locale::~locale(&v23);
    std::ostream::put();
    std::ostream::flush();
    sub_25B5DE67C();
    std::ios_base::getloc((const std::ios_base *)((char *)v18 + *(void *)(*v18 - 24)));
    uint64_t v21 = std::locale::use_facet(&v23, MEMORY[0x263F8C108]);
    ((void (*)(const std::locale::facet *, uint64_t))v21->__vftable[2].~facet_0)(v21, 10);
    std::locale::~locale(&v23);
    std::ostream::put();
    std::ostream::flush();
    uint64_t v15 = a3[1];
  }
  *(void *)(a1 + 8) = *(void *)(a2 + 8) * v15;
  *(void *)(a1 + 48) = a3[1];
  *(void *)(a1 + 104) = 1;
  return a1;
}

void sub_25B5DB1F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
{
  std::locale::~locale(&a10);
  *(void *)(v10 + 152) = &unk_2708F27E8;
  uint64_t v12 = *(std::__shared_weak_count **)(v10 + 280);
  if (v12) {
    sub_25B404120(v12);
  }
  _Unwind_Resume(a1);
}

void sub_25B5DB244(uint64_t a1, _OWORD *a2)
{
  *(_OWORD *)(a1 + 8) = 0u;
  *(void *)a1 = &unk_2708F21F8;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(void *)(a1 + 120) = 0;
  *(void *)(a1 + 128) = 0;
  long long v3 = a2[1];
  long long v2 = a2[2];
  *(_OWORD *)(a1 + 8) = *a2;
  *(_OWORD *)(a1 + 40) = v2;
  *(_OWORD *)(a1 + 24) = v3;
  uint64_t v4 = *(void *)(a1 + 16);
  *(void *)(a1 + 56) = v4;
  *(void *)(a1 + 64) = 1;
  uint64_t v5 = *(void *)(a1 + 8) * v4;
  *(void *)(a1 + 104) = v5;
  *(void *)(a1 + 112) = 0;
  sub_25B458EBC((uint64_t)v6, v5);
}

void sub_25B5DB728(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,std::__shared_weak_count *a25)
{
  if (a25) {
    sub_25B404120(a25);
  }
  long long v27 = *(std::__shared_weak_count **)(v25 + 128);
  if (v27) {
    sub_25B404120(v27);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_25B5DB790(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a2 + 185))
  {
    uint64_t v4 = (void *)MEMORY[0x263F8C0F8];
    uint64_t v5 = sub_25B406B20(MEMORY[0x263F8C0F8], (uint64_t)"runtime_err in ", 15);
    long long v6 = sub_25B406B20(v5, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/RoomScanCore/Sources/Utilities/wTensor/core/tensor/tensor.hpp", 99);
    sub_25B406B20(v6, (uint64_t)" ", 1);
    long long v7 = (void *)std::ostream::operator<<();
    uint64_t v8 = sub_25B406B20(v7, (uint64_t)" ", 1);
    int v9 = sub_25B406B20(v8, (uint64_t)"operator=", 9);
    std::ios_base::getloc((const std::ios_base *)((char *)v9 + *(void *)(*v9 - 24)));
    uint64_t v10 = std::locale::use_facet((const std::locale *)v17, MEMORY[0x263F8C108]);
    ((void (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 10);
    std::locale::~locale((std::locale *)v17);
    std::ostream::put();
    std::ostream::flush();
    sub_25B40961C("err", "empty tensor in");
    std::ios_base::getloc((const std::ios_base *)((char *)v4 + *(void *)(*v4 - 24)));
    int v11 = std::locale::use_facet((const std::locale *)v17, MEMORY[0x263F8C108]);
    ((void (*)(const std::locale::facet *, uint64_t))v11->__vftable[2].~facet_0)(v11, 10);
    std::locale::~locale((std::locale *)v17);
    std::ostream::put();
    std::ostream::flush();
  }
  if (*(unsigned char *)(a1 + 137))
  {
    long long v13 = *(_OWORD *)(a2 + 16);
    long long v12 = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 8) = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 40) = v12;
    *(_OWORD *)(a1 + 24) = v13;
    uint64_t v15 = *(void *)(a1 + 8);
    uint64_t v14 = *(void *)(a1 + 16);
    *(void *)(a1 + 56) = v14;
    *(void *)(a1 + 64) = 1;
    *(void *)(a1 + 104) = v15 * v14;
    *(void *)(a1 + 112) = 0;
    sub_25B458EBC((uint64_t)v17, v15 * v14);
  }
  if (*(void *)(a2 + 168) != *(void *)(a1 + 120) || sub_25B40B05C(a2 + 56, a1 + 8))
  {
    sub_25B5DD098(a1, a2);
  }
  else
  {
    sub_25B4583CC((uint64_t)v17, (_OWORD *)a2);
    sub_25B5DD098((uint64_t)v17, a2);
    sub_25B4584C4(a1, (uint64_t)v17);
    *(void *)&v17[0] = &unk_2708F21F8;
    if (v18) {
      sub_25B404120(v18);
    }
  }
  return a1;
}

void sub_25B5DBA3C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,std::__shared_weak_count *a25)
{
  if (a25) {
    sub_25B404120(a25);
  }
  _Unwind_Resume(exception_object);
}

void *sub_25B5DBA84(void *a1)
{
  a1[55] = &unk_2708F21F8;
  long long v2 = (std::__shared_weak_count *)a1[71];
  if (v2) {
    sub_25B404120(v2);
  }
  a1[36] = &unk_2708F21F8;
  long long v3 = (std::__shared_weak_count *)a1[52];
  if (v3) {
    sub_25B404120(v3);
  }
  sub_25B3F9500((uint64_t)(a1 + 6));
  return a1;
}

void sub_25B5DBB08(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = 0;
  uint64_t v135 = *MEMORY[0x263EF8340];
  uint64_t v5 = (_OWORD *)(a1 + 8);
  char v6 = 1;
  do
  {
    uint64_t v7 = *((void *)v5 + v4);
    uint64_t v8 = *(void *)(a2 + 8 * v4);
    if ((v6 & 1) == 0) {
      break;
    }
    char v6 = 0;
    uint64_t v4 = 1;
  }
  while (v7 == v8);
  if (*(unsigned char *)(a2 + 424)) {
    BOOL v9 = *(unsigned char *)(a2 + 576) == 0;
  }
  else {
    BOOL v9 = 1;
  }
  int v10 = !v9;
  if (v7 == v8)
  {
    if (v10)
    {
      long long v121 = 0uLL;
      long long v122 = 0uLL;
      long long v120 = 0uLL;
      uint64_t v11 = *(void *)(a1 + 104);
      uint64_t v12 = *(void *)(a1 + 144);
      if (*(unsigned char *)(a1 + 136))
      {
        if (v11)
        {
          uint64_t v13 = 0;
          uint64_t v14 = a1 + 16;
          do
          {
            float v15 = sub_25B5DC56C(a2, &v120);
            uint64_t v16 = 0;
            *(float *)(v12 + 4 * v13) = v15;
            do
            {
              uint64_t v17 = *(void *)((char *)&v120 + v16 + 8) + 1;
              *(void *)((char *)&v120 + v16 + 8) = v17;
              if (v17 != *(void *)(v14 + v16)) {
                break;
              }
              *(void *)((char *)&v120 + v16 + 8) = 0;
              v16 -= 8;
            }
            while (v16 != -16);
            ++v13;
          }
          while (v13 != v11);
        }
      }
      else if (v11)
      {
        uint64_t v67 = 0;
        uint64_t v68 = *(void *)(a1 + 56);
        uint64_t v69 = *(void *)(a1 + 64);
        uint64_t v70 = a1 + 16;
        do
        {
          uint64_t v71 = v68 * v120 + v69 * *((void *)&v120 + 1);
          float v72 = sub_25B5DC56C(a2, &v120);
          uint64_t v73 = 0;
          *(float *)(v12 + 4 * v71) = v72;
          do
          {
            uint64_t v74 = *(void *)((char *)&v120 + v73 + 8) + 1;
            *(void *)((char *)&v120 + v73 + 8) = v74;
            if (v74 != *(void *)(v70 + v73)) {
              break;
            }
            *(void *)((char *)&v120 + v73 + 8) = 0;
            v73 -= 8;
          }
          while (v73 != -16);
          ++v67;
        }
        while (v67 != v11);
      }
    }
    else
    {
      long long v121 = 0uLL;
      long long v122 = 0uLL;
      long long v120 = 0uLL;
      uint64_t v39 = *(void *)(a1 + 104);
      uint64_t v40 = *(void *)(a1 + 144);
      if (*(unsigned char *)(a1 + 136))
      {
        if (v39)
        {
          uint64_t v41 = 0;
          uint64_t v42 = a1 + 16;
          do
          {
            float v43 = sub_25B5DC4A8(a2, &v120);
            uint64_t v44 = 0;
            *(float *)(v40 + 4 * v41) = v43;
            do
            {
              uint64_t v45 = *(void *)((char *)&v120 + v44 + 8) + 1;
              *(void *)((char *)&v120 + v44 + 8) = v45;
              if (v45 != *(void *)(v42 + v44)) {
                break;
              }
              *(void *)((char *)&v120 + v44 + 8) = 0;
              v44 -= 8;
            }
            while (v44 != -16);
            ++v41;
          }
          while (v41 != v39);
        }
      }
      else if (v39)
      {
        uint64_t v75 = 0;
        uint64_t v76 = *(void *)(a1 + 56);
        uint64_t v77 = *(void *)(a1 + 64);
        uint64_t v78 = a1 + 16;
        do
        {
          uint64_t v79 = v76 * v120 + v77 * *((void *)&v120 + 1);
          float v80 = sub_25B5DC4A8(a2, &v120);
          uint64_t v81 = 0;
          *(float *)(v40 + 4 * v79) = v80;
          do
          {
            uint64_t v82 = *(void *)((char *)&v120 + v81 + 8) + 1;
            *(void *)((char *)&v120 + v81 + 8) = v82;
            if (v82 != *(void *)(v78 + v81)) {
              break;
            }
            *(void *)((char *)&v120 + v81 + 8) = 0;
            v81 -= 8;
          }
          while (v81 != -16);
          ++v75;
        }
        while (v75 != v39);
      }
    }
  }
  else
  {
    if (v10)
    {
      long long v133 = 0uLL;
      long long v134 = 0uLL;
      long long v131 = 0uLL;
      long long v132 = 0uLL;
      long long v129 = 0uLL;
      long long v130 = 0uLL;
      long long v127 = 0uLL;
      long long v128 = 0uLL;
      long long v125 = 0uLL;
      long long v126 = 0uLL;
      long long v123 = 0uLL;
      long long v124 = 0uLL;
      long long v121 = 0uLL;
      long long v122 = 0uLL;
      long long v120 = 0uLL;
      long long v112 = 0uLL;
      long long v113 = 0uLL;
      long long v111 = 0uLL;
      sub_25B40AB84((uint64_t)&v120, v5, (_OWORD *)a2, (uint64_t)&v111);
      uint64_t v18 = 0;
      char v19 = 1;
      do
      {
        uint64_t v20 = *((void *)&v111 + v18);
        uint64_t v21 = *((void *)v5 + v18);
        if ((v19 & 1) == 0) {
          break;
        }
        char v19 = 0;
        uint64_t v18 = 1;
      }
      while (v20 == v21);
      if (v20 != v21)
      {
        long long v22 = sub_25B406B20(MEMORY[0x263F8C0F8], (uint64_t)"runtime_err in ", 15);
        std::locale v23 = sub_25B406B20(v22, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/RoomScanCore/Sources/Utilities/wTensor/core/tensor/tensor.hpp", 99);
        sub_25B406B20(v23, (uint64_t)" ", 1);
        uint64_t v24 = (void *)MEMORY[0x263F8C0F8];
        uint64_t v25 = (void *)std::ostream::operator<<();
        sub_25B406B20(v25, (uint64_t)" ", 1);
        sub_25B406B20(v25, (uint64_t)"broadcast_assign_continue", 25);
        std::ios_base::getloc((const std::ios_base *)((char *)v25 + *(void *)(*v25 - 24)));
        char v26 = std::locale::use_facet(v117, MEMORY[0x263F8C108]);
        ((void (*)(const std::locale::facet *, uint64_t))v26->__vftable[2].~facet_0)(v26, 10);
        std::locale::~locale(v117);
        std::ostream::put();
        std::ostream::flush();
        sub_25B406ED4("err", "broadcast assign issue");
        std::ios_base::getloc((const std::ios_base *)((char *)v24 + *(void *)(*v24 - 24)));
        long long v27 = std::locale::use_facet(v117, MEMORY[0x263F8C108]);
        ((void (*)(const std::locale::facet *, uint64_t))v27->__vftable[2].~facet_0)(v27, 10);
        std::locale::~locale(v117);
        std::ostream::put();
        std::ostream::flush();
      }
      long long v118 = 0u;
      long long v119 = 0u;
      long long v116 = 0u;
      *(_OWORD *)&v117[0].__locale_ = 0u;
      long long v114 = 0u;
      long long v115 = 0u;
      uint64_t v28 = *(void *)(a1 + 104);
      uint64_t v29 = *(void *)(a1 + 144);
      if (*(unsigned char *)(a1 + 136))
      {
        if (v28)
        {
          uint64_t v30 = 0;
          uint64_t v32 = (uint64_t *)*((void *)&v121 + 1);
          uint64_t v31 = (uint64_t *)v122;
          if ((unint64_t)((uint64_t)(v122 - *((void *)&v121 + 1)) >> 3) <= 1) {
            uint64_t v33 = 1;
          }
          else {
            uint64_t v33 = (uint64_t)(v122 - *((void *)&v121 + 1)) >> 3;
          }
          do
          {
            long long v114 = *(_OWORD *)&v117[0].__locale_;
            if (v31 != v32)
            {
              uint64_t v34 = v32;
              uint64_t v35 = v33;
              do
              {
                uint64_t v36 = *v34++;
                *((void *)&v114 + v36) = 0;
                --v35;
              }
              while (v35);
            }
            *(float *)(v29 + 4 * v30) = sub_25B5DC56C(a2, &v114);
            for (uint64_t i = 1; i != -1; --i)
            {
              uint64_t v38 = (std::locale::__imp *)((char *)v117[i].__locale_ + 1);
              v117[i].__locale_ = v38;
              if (v38 != *(std::locale::__imp **)((char *)&v111 + i * 8)) {
                break;
              }
              v117[i].__locale_ = 0;
            }
            ++v30;
          }
          while (v30 != v28);
        }
      }
      else if (v28)
      {
        uint64_t v83 = 0;
        unint64_t v84 = (uint64_t *)*((void *)&v121 + 1);
        uint64_t v109 = (uint64_t *)v122;
        if ((unint64_t)((uint64_t)(v122 - *((void *)&v121 + 1)) >> 3) <= 1) {
          uint64_t v85 = 1;
        }
        else {
          uint64_t v85 = (uint64_t)(v122 - *((void *)&v121 + 1)) >> 3;
        }
        uint64_t v107 = *(void *)(a1 + 56);
        uint64_t v103 = v85;
        uint64_t v105 = *(void *)(a1 + 64);
        do
        {
          locale = v117[0].__locale_;
          std::string v86 = v117[1].__locale_;
          long long v114 = *(_OWORD *)&v117[0].__locale_;
          if (v109 != v84)
          {
            unint64_t v88 = v84;
            uint64_t v89 = v103;
            do
            {
              uint64_t v90 = *v88++;
              *((void *)&v114 + v90) = 0;
              --v89;
            }
            while (v89);
          }
          *(float *)(v29 + 4 * (v107 * (void)locale + v105 * (void)v86)) = sub_25B5DC56C(a2, &v114);
          for (uint64_t j = 1; j != -1; --j)
          {
            uint64_t v92 = (std::locale::__imp *)((char *)v117[j].__locale_ + 1);
            v117[j].__locale_ = v92;
            if (v92 != *(std::locale::__imp **)((char *)&v111 + j * 8)) {
              break;
            }
            v117[j].__locale_ = 0;
          }
          ++v83;
        }
        while (v83 != v28);
      }
    }
    else
    {
      long long v133 = 0uLL;
      long long v134 = 0uLL;
      long long v131 = 0uLL;
      long long v132 = 0uLL;
      long long v129 = 0uLL;
      long long v130 = 0uLL;
      long long v127 = 0uLL;
      long long v128 = 0uLL;
      long long v125 = 0uLL;
      long long v126 = 0uLL;
      long long v123 = 0uLL;
      long long v124 = 0uLL;
      long long v121 = 0uLL;
      long long v122 = 0uLL;
      long long v120 = 0uLL;
      long long v112 = 0uLL;
      long long v113 = 0uLL;
      long long v111 = 0uLL;
      sub_25B40AB84((uint64_t)&v120, v5, (_OWORD *)a2, (uint64_t)&v111);
      uint64_t v46 = 0;
      char v47 = 1;
      do
      {
        uint64_t v48 = *((void *)&v111 + v46);
        uint64_t v49 = *((void *)v5 + v46);
        if ((v47 & 1) == 0) {
          break;
        }
        char v47 = 0;
        uint64_t v46 = 1;
      }
      while (v48 == v49);
      if (v48 != v49)
      {
        unint64_t v50 = sub_25B406B20(MEMORY[0x263F8C0F8], (uint64_t)"runtime_err in ", 15);
        BOOL v51 = sub_25B406B20(v50, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/RoomScanCore/Sources/Utilities/wTensor/core/tensor/tensor.hpp", 99);
        sub_25B406B20(v51, (uint64_t)" ", 1);
        uint64_t v52 = (void *)MEMORY[0x263F8C0F8];
        std::string::size_type v53 = (void *)std::ostream::operator<<();
        sub_25B406B20(v53, (uint64_t)" ", 1);
        sub_25B406B20(v53, (uint64_t)"broadcast_assign_stride", 23);
        std::ios_base::getloc((const std::ios_base *)((char *)v53 + *(void *)(*v53 - 24)));
        int v54 = std::locale::use_facet(v117, MEMORY[0x263F8C108]);
        ((void (*)(const std::locale::facet *, uint64_t))v54->__vftable[2].~facet_0)(v54, 10);
        std::locale::~locale(v117);
        std::ostream::put();
        std::ostream::flush();
        sub_25B406ED4("err", "broadcast assign issue");
        std::ios_base::getloc((const std::ios_base *)((char *)v52 + *(void *)(*v52 - 24)));
        unsigned int v55 = std::locale::use_facet(v117, MEMORY[0x263F8C108]);
        ((void (*)(const std::locale::facet *, uint64_t))v55->__vftable[2].~facet_0)(v55, 10);
        std::locale::~locale(v117);
        std::ostream::put();
        std::ostream::flush();
      }
      long long v118 = 0u;
      long long v119 = 0u;
      long long v116 = 0u;
      *(_OWORD *)&v117[0].__locale_ = 0u;
      long long v114 = 0u;
      long long v115 = 0u;
      uint64_t v56 = *(void *)(a1 + 104);
      uint64_t v57 = *(void *)(a1 + 144);
      if (*(unsigned char *)(a1 + 136))
      {
        if (v56)
        {
          uint64_t v58 = 0;
          uint64_t v60 = (uint64_t *)*((void *)&v121 + 1);
          uint64_t v59 = (uint64_t *)v122;
          if ((unint64_t)((uint64_t)(v122 - *((void *)&v121 + 1)) >> 3) <= 1) {
            uint64_t v61 = 1;
          }
          else {
            uint64_t v61 = (uint64_t)(v122 - *((void *)&v121 + 1)) >> 3;
          }
          do
          {
            long long v114 = *(_OWORD *)&v117[0].__locale_;
            if (v59 != v60)
            {
              long long v62 = v60;
              uint64_t v63 = v61;
              do
              {
                uint64_t v64 = *v62++;
                *((void *)&v114 + v64) = 0;
                --v63;
              }
              while (v63);
            }
            *(float *)(v57 + 4 * v58) = sub_25B5DC4A8(a2, &v114);
            for (uint64_t k = 1; k != -1; --k)
            {
              uint64_t v66 = (std::locale::__imp *)((char *)v117[k].__locale_ + 1);
              v117[k].__locale_ = v66;
              if (v66 != *(std::locale::__imp **)((char *)&v111 + k * 8)) {
                break;
              }
              v117[k].__locale_ = 0;
            }
            ++v58;
          }
          while (v58 != v56);
        }
      }
      else if (v56)
      {
        uint64_t v93 = 0;
        uint64_t v94 = (uint64_t *)*((void *)&v121 + 1);
        unint64_t v110 = (uint64_t *)v122;
        if ((unint64_t)((uint64_t)(v122 - *((void *)&v121 + 1)) >> 3) <= 1) {
          uint64_t v95 = 1;
        }
        else {
          uint64_t v95 = (uint64_t)(v122 - *((void *)&v121 + 1)) >> 3;
        }
        uint64_t v108 = *(void *)(a1 + 56);
        uint64_t v104 = v95;
        uint64_t v106 = *(void *)(a1 + 64);
        do
        {
          v97 = v117[0].__locale_;
          v96 = v117[1].__locale_;
          long long v114 = *(_OWORD *)&v117[0].__locale_;
          if (v110 != v94)
          {
            uint64_t v98 = v94;
            uint64_t v99 = v104;
            do
            {
              uint64_t v100 = *v98++;
              *((void *)&v114 + v100) = 0;
              --v99;
            }
            while (v99);
          }
          *(float *)(v57 + 4 * (v108 * (void)v97 + v106 * (void)v96)) = sub_25B5DC4A8(a2, &v114);
          for (uint64_t m = 1; m != -1; --m)
          {
            v102 = (std::locale::__imp *)((char *)v117[m].__locale_ + 1);
            v117[m].__locale_ = v102;
            if (v102 != *(std::locale::__imp **)((char *)&v111 + m * 8)) {
              break;
            }
            v117[m].__locale_ = 0;
          }
          ++v93;
        }
        while (v93 != v56);
      }
    }
    sub_25B3F9500((uint64_t)&v120);
  }
}

void sub_25B5DC474(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,std::locale a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

float sub_25B5DC4A8(uint64_t a1, void *a2)
{
  v9[6] = *MEMORY[0x263EF8340];
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  sub_25B46BB3C(a1 + 48, a2, &v7, v9, &v6, v8);
  if (*(unsigned char *)(a1 + 424)) {
    uint64_t v3 = v7;
  }
  else {
    uint64_t v3 = *(void *)(a1 + 344) * v9[0] + *(void *)(a1 + 352) * v9[1];
  }
  if (*(unsigned char *)(a1 + 576)) {
    uint64_t v4 = v6;
  }
  else {
    uint64_t v4 = *(void *)(a1 + 496) * v8[0] + *(void *)(a1 + 504) * v8[1];
  }
  return *(float *)(*(void *)(a1 + 432) + 4 * v3) / *(float *)(*(void *)(a1 + 584) + 4 * v4);
}

float sub_25B5DC56C(uint64_t a1, void *a2)
{
  v7[6] = *MEMORY[0x263EF8340];
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  sub_25B46BB3C(a1 + 48, a2, &v5, v7, &v4, v6);
  return *(float *)(*(void *)(a1 + 432) + 4 * v5) / *(float *)(*(void *)(a1 + 584) + 4 * v4);
}

void sub_25B5DC5F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = 0;
  uint64_t v165 = *MEMORY[0x263EF8340];
  uint64_t v5 = (_OWORD *)(a1 + 8);
  char v6 = 1;
  do
  {
    uint64_t v7 = *((void *)v5 + v4);
    uint64_t v8 = *(void *)(a2 + 8 * v4);
    if ((v6 & 1) == 0) {
      break;
    }
    char v6 = 0;
    uint64_t v4 = 1;
  }
  while (v7 == v8);
  if (v7 == v8)
  {
    if (*(unsigned char *)(a2 + 184))
    {
      long long v151 = 0uLL;
      long long v152 = 0uLL;
      long long v150 = 0uLL;
      uint64_t v9 = *(void *)(a1 + 104);
      int v10 = *(float **)(a1 + 144);
      if (*(unsigned char *)(a1 + 136))
      {
        if (v9)
        {
          uint64_t v11 = *(float **)(a2 + 192);
          do
          {
            float v12 = *v11++;
            *v10++ = expf(v12);
            --v9;
          }
          while (v9);
        }
      }
      else if (v9)
      {
        uint64_t v75 = 0;
        uint64_t v76 = *(void *)(a1 + 56);
        uint64_t v77 = *(void *)(a1 + 64);
        uint64_t v78 = *(void *)(a2 + 192);
        uint64_t v79 = a1 + 16;
        do
        {
          uint64_t v80 = v76 * v150 + v77 * *((void *)&v150 + 1);
          float v81 = expf(*(float *)(v78 + 4 * v75));
          uint64_t v82 = 0;
          v10[v80] = v81;
          do
          {
            uint64_t v83 = *(void *)((char *)&v150 + v82 + 8) + 1;
            *(void *)((char *)&v150 + v82 + 8) = v83;
            if (v83 != *(void *)(v79 + v82)) {
              break;
            }
            *(void *)((char *)&v150 + v82 + 8) = 0;
            v82 -= 8;
          }
          while (v82 != -16);
          ++v75;
        }
        while (v75 != v9);
      }
    }
    else
    {
      long long v151 = 0uLL;
      long long v152 = 0uLL;
      long long v150 = 0uLL;
      uint64_t v39 = *(void *)(a1 + 104);
      uint64_t v40 = *(void *)(a1 + 144);
      if (*(unsigned char *)(a1 + 136))
      {
        if (v39)
        {
          uint64_t v41 = 0;
          uint64_t v42 = *(void *)(a2 + 104);
          uint64_t v43 = *(void *)(a2 + 112);
          uint64_t v44 = *(void *)(a2 + 192);
          uint64_t v45 = a1 + 16;
          do
          {
            float v46 = expf(*(float *)(v44 + 4 * (v42 * v150 + v43 * *((void *)&v150 + 1))));
            uint64_t v47 = 0;
            *(float *)(v40 + 4 * v41) = v46;
            do
            {
              uint64_t v48 = *(void *)((char *)&v150 + v47 + 8) + 1;
              *(void *)((char *)&v150 + v47 + 8) = v48;
              if (v48 != *(void *)(v45 + v47)) {
                break;
              }
              *(void *)((char *)&v150 + v47 + 8) = 0;
              v47 -= 8;
            }
            while (v47 != -16);
            ++v41;
          }
          while (v41 != v39);
        }
      }
      else if (v39)
      {
        uint64_t v99 = 0;
        uint64_t v100 = *(void *)(a1 + 64);
        uint64_t v140 = *(void *)(a1 + 56);
        uint64_t v101 = *(void *)(a2 + 104);
        uint64_t v102 = *(void *)(a2 + 112);
        uint64_t v103 = a1 + 16;
        uint64_t v104 = *(void *)(a2 + 192);
        do
        {
          uint64_t v105 = v140 * v150 + v100 * *((void *)&v150 + 1);
          float v106 = expf(*(float *)(v104 + 4 * (v101 * v150 + v102 * *((void *)&v150 + 1))));
          uint64_t v107 = 0;
          *(float *)(v40 + 4 * v105) = v106;
          do
          {
            uint64_t v108 = *(void *)((char *)&v150 + v107 + 8) + 1;
            *(void *)((char *)&v150 + v107 + 8) = v108;
            if (v108 != *(void *)(v103 + v107)) {
              break;
            }
            *(void *)((char *)&v150 + v107 + 8) = 0;
            v107 -= 8;
          }
          while (v107 != -16);
          ++v99;
        }
        while (v99 != v39);
      }
    }
  }
  else
  {
    if (*(unsigned char *)(a2 + 184))
    {
      long long v163 = 0uLL;
      long long v164 = 0uLL;
      long long v161 = 0uLL;
      long long v162 = 0uLL;
      long long v159 = 0uLL;
      long long v160 = 0uLL;
      long long v157 = 0uLL;
      long long v158 = 0uLL;
      long long v155 = 0uLL;
      long long v156 = 0uLL;
      long long v153 = 0uLL;
      long long v154 = 0uLL;
      long long v151 = 0uLL;
      long long v152 = 0uLL;
      long long v150 = 0uLL;
      long long v142 = 0uLL;
      long long v143 = 0uLL;
      long long v141 = 0uLL;
      sub_25B40AB84((uint64_t)&v150, v5, (_OWORD *)a2, (uint64_t)&v141);
      uint64_t v13 = 0;
      char v14 = 1;
      do
      {
        uint64_t v15 = *((void *)&v141 + v13);
        uint64_t v16 = *((void *)v5 + v13);
        if ((v14 & 1) == 0) {
          break;
        }
        char v14 = 0;
        uint64_t v13 = 1;
      }
      while (v15 == v16);
      if (v15 != v16)
      {
        uint64_t v17 = sub_25B406B20(MEMORY[0x263F8C0F8], (uint64_t)"runtime_err in ", 15);
        uint64_t v18 = sub_25B406B20(v17, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/RoomScanCore/Sources/Utilities/wTensor/core/tensor/tensor.hpp", 99);
        sub_25B406B20(v18, (uint64_t)" ", 1);
        char v19 = (void *)MEMORY[0x263F8C0F8];
        uint64_t v20 = (void *)std::ostream::operator<<();
        sub_25B406B20(v20, (uint64_t)" ", 1);
        sub_25B406B20(v20, (uint64_t)"broadcast_assign_continue", 25);
        std::ios_base::getloc((const std::ios_base *)((char *)v20 + *(void *)(*v20 - 24)));
        uint64_t v21 = std::locale::use_facet(v147, MEMORY[0x263F8C108]);
        ((void (*)(const std::locale::facet *, uint64_t))v21->__vftable[2].~facet_0)(v21, 10);
        std::locale::~locale(v147);
        std::ostream::put();
        std::ostream::flush();
        sub_25B406ED4("err", "broadcast assign issue");
        std::ios_base::getloc((const std::ios_base *)((char *)v19 + *(void *)(*v19 - 24)));
        long long v22 = std::locale::use_facet(v147, MEMORY[0x263F8C108]);
        ((void (*)(const std::locale::facet *, uint64_t))v22->__vftable[2].~facet_0)(v22, 10);
        std::locale::~locale(v147);
        std::ostream::put();
        std::ostream::flush();
      }
      long long v148 = 0u;
      long long v149 = 0u;
      long long v146 = 0u;
      *(_OWORD *)&v147[0].__locale_ = 0u;
      long long v144 = 0u;
      long long v145 = 0u;
      uint64_t v23 = *(void *)(a1 + 104);
      uint64_t v24 = *(void *)(a1 + 144);
      if (*(unsigned char *)(a1 + 136))
      {
        if (v23)
        {
          uint64_t v25 = 0;
          long long v27 = (uint64_t *)*((void *)&v151 + 1);
          char v26 = (uint64_t *)v152;
          unint64_t v28 = (uint64_t)(v152 - *((void *)&v151 + 1)) >> 3;
          if (v28 <= 1) {
            unint64_t v28 = 1;
          }
          unint64_t v137 = v28;
          uint64_t v29 = *(void *)(a2 + 192);
          do
          {
            long long v144 = *(_OWORD *)&v147[0].__locale_;
            if (v26 != v27)
            {
              uint64_t v30 = v27;
              unint64_t v31 = v137;
              do
              {
                uint64_t v32 = *v30++;
                *((void *)&v144 + v32) = 0;
                --v31;
              }
              while (v31);
            }
            uint64_t v33 = 0;
            uint64_t v34 = 0;
            char v35 = 1;
            do
            {
              char v36 = v35;
              v34 += *((void *)&v162 + v33) * *((void *)&v144 + v33);
              uint64_t v33 = 1;
              char v35 = 0;
            }
            while ((v36 & 1) != 0);
            *(float *)(v24 + 4 * v25) = expf(*(float *)(v29 + 4 * v34));
            for (uint64_t i = 1; i != -1; --i)
            {
              uint64_t v38 = (std::locale::__imp *)((char *)v147[i].__locale_ + 1);
              v147[i].__locale_ = v38;
              if (v38 != *(std::locale::__imp **)((char *)&v141 + i * 8)) {
                break;
              }
              v147[i].__locale_ = 0;
            }
            ++v25;
          }
          while (v25 != v23);
        }
      }
      else if (v23)
      {
        uint64_t v84 = 0;
        uint64_t v85 = (uint64_t *)*((void *)&v151 + 1);
        long long v139 = (uint64_t *)v152;
        if ((unint64_t)((uint64_t)(v152 - *((void *)&v151 + 1)) >> 3) <= 1) {
          uint64_t v86 = 1;
        }
        else {
          uint64_t v86 = (uint64_t)(v152 - *((void *)&v151 + 1)) >> 3;
        }
        uint64_t v135 = *(void *)(a1 + 56);
        uint64_t v129 = v86;
        uint64_t v132 = *(void *)(a1 + 64);
        uint64_t v87 = *(void *)(a2 + 192);
        do
        {
          locale = v147[0].__locale_;
          uint64_t v89 = v147[1].__locale_;
          long long v144 = *(_OWORD *)&v147[0].__locale_;
          if (v139 != v85)
          {
            uint64_t v90 = v85;
            uint64_t v91 = v129;
            do
            {
              uint64_t v92 = *v90++;
              *((void *)&v144 + v92) = 0;
              --v91;
            }
            while (v91);
          }
          uint64_t v93 = 0;
          uint64_t v94 = 0;
          char v95 = 1;
          do
          {
            char v96 = v95;
            v94 += *((void *)&v162 + v93) * *((void *)&v144 + v93);
            uint64_t v93 = 1;
            char v95 = 0;
          }
          while ((v96 & 1) != 0);
          *(float *)(v24 + 4 * ((void)locale * v135 + (void)v89 * v132)) = expf(*(float *)(v87 + 4 * v94));
          for (uint64_t j = 1; j != -1; --j)
          {
            uint64_t v98 = (std::locale::__imp *)((char *)v147[j].__locale_ + 1);
            v147[j].__locale_ = v98;
            if (v98 != *(std::locale::__imp **)((char *)&v141 + j * 8)) {
              break;
            }
            v147[j].__locale_ = 0;
          }
          ++v84;
        }
        while (v84 != v23);
      }
    }
    else
    {
      long long v163 = 0uLL;
      long long v164 = 0uLL;
      long long v161 = 0uLL;
      long long v162 = 0uLL;
      long long v159 = 0uLL;
      long long v160 = 0uLL;
      long long v157 = 0uLL;
      long long v158 = 0uLL;
      long long v155 = 0uLL;
      long long v156 = 0uLL;
      long long v153 = 0uLL;
      long long v154 = 0uLL;
      long long v151 = 0uLL;
      long long v152 = 0uLL;
      long long v150 = 0uLL;
      long long v142 = 0uLL;
      long long v143 = 0uLL;
      long long v141 = 0uLL;
      sub_25B40AB84((uint64_t)&v150, v5, (_OWORD *)a2, (uint64_t)&v141);
      uint64_t v49 = 0;
      char v50 = 1;
      do
      {
        uint64_t v51 = *((void *)&v141 + v49);
        uint64_t v52 = *((void *)v5 + v49);
        if ((v50 & 1) == 0) {
          break;
        }
        char v50 = 0;
        uint64_t v49 = 1;
      }
      while (v51 == v52);
      if (v51 != v52)
      {
        std::string::size_type v53 = sub_25B406B20(MEMORY[0x263F8C0F8], (uint64_t)"runtime_err in ", 15);
        int v54 = sub_25B406B20(v53, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/RoomScanCore/Sources/Utilities/wTensor/core/tensor/tensor.hpp", 99);
        sub_25B406B20(v54, (uint64_t)" ", 1);
        unsigned int v55 = (void *)MEMORY[0x263F8C0F8];
        uint64_t v56 = (void *)std::ostream::operator<<();
        sub_25B406B20(v56, (uint64_t)" ", 1);
        sub_25B406B20(v56, (uint64_t)"broadcast_assign_stride", 23);
        std::ios_base::getloc((const std::ios_base *)((char *)v56 + *(void *)(*v56 - 24)));
        uint64_t v57 = std::locale::use_facet(v147, MEMORY[0x263F8C108]);
        ((void (*)(const std::locale::facet *, uint64_t))v57->__vftable[2].~facet_0)(v57, 10);
        std::locale::~locale(v147);
        std::ostream::put();
        std::ostream::flush();
        sub_25B406ED4("err", "broadcast assign issue");
        std::ios_base::getloc((const std::ios_base *)((char *)v55 + *(void *)(*v55 - 24)));
        uint64_t v58 = std::locale::use_facet(v147, MEMORY[0x263F8C108]);
        ((void (*)(const std::locale::facet *, uint64_t))v58->__vftable[2].~facet_0)(v58, 10);
        std::locale::~locale(v147);
        std::ostream::put();
        std::ostream::flush();
      }
      long long v148 = 0u;
      long long v149 = 0u;
      long long v146 = 0u;
      *(_OWORD *)&v147[0].__locale_ = 0u;
      long long v144 = 0u;
      long long v145 = 0u;
      uint64_t v59 = *(void *)(a1 + 104);
      uint64_t v138 = *(void *)(a1 + 144);
      if (*(unsigned char *)(a1 + 136))
      {
        if (v59)
        {
          uint64_t v60 = 0;
          long long v62 = (uint64_t *)*((void *)&v151 + 1);
          uint64_t v61 = (uint64_t *)v152;
          if ((unint64_t)((uint64_t)(v152 - *((void *)&v151 + 1)) >> 3) <= 1) {
            uint64_t v63 = 1;
          }
          else {
            uint64_t v63 = (uint64_t)(v152 - *((void *)&v151 + 1)) >> 3;
          }
          int v64 = *(unsigned __int8 *)(a2 + 184);
          uint64_t v131 = *(void *)(a2 + 104);
          uint64_t v134 = v63;
          uint64_t v128 = *(void *)(a2 + 112);
          uint64_t v65 = *(void *)(a2 + 192);
          do
          {
            long long v144 = *(_OWORD *)&v147[0].__locale_;
            if (v61 != v62)
            {
              uint64_t v66 = v62;
              uint64_t v67 = v134;
              do
              {
                uint64_t v68 = *v66++;
                *((void *)&v144 + v68) = 0;
                --v67;
              }
              while (v67);
            }
            uint64_t v69 = 0;
            uint64_t v70 = 0;
            char v71 = 1;
            do
            {
              char v72 = v71;
              v70 += *((void *)&v162 + v69) * *((void *)&v144 + v69);
              uint64_t v69 = 1;
              char v71 = 0;
            }
            while ((v72 & 1) != 0);
            if (!v64) {
              uint64_t v70 = v144 * v131 + *((void *)&v144 + 1) * v128;
            }
            *(float *)(v138 + 4 * v60) = expf(*(float *)(v65 + 4 * v70));
            for (uint64_t k = 1; k != -1; --k)
            {
              uint64_t v74 = (std::locale::__imp *)((char *)v147[k].__locale_ + 1);
              v147[k].__locale_ = v74;
              if (v74 != *(std::locale::__imp **)((char *)&v141 + k * 8)) {
                break;
              }
              v147[k].__locale_ = 0;
            }
            ++v60;
          }
          while (v60 != v59);
        }
      }
      else if (v59)
      {
        uint64_t v109 = 0;
        unint64_t v110 = (uint64_t *)*((void *)&v151 + 1);
        v136 = (uint64_t *)v152;
        if ((unint64_t)((uint64_t)(v152 - *((void *)&v151 + 1)) >> 3) <= 1) {
          uint64_t v111 = 1;
        }
        else {
          uint64_t v111 = (uint64_t)(v152 - *((void *)&v151 + 1)) >> 3;
        }
        uint64_t v133 = *(void *)(a1 + 56);
        uint64_t v127 = v111;
        uint64_t v130 = *(void *)(a1 + 64);
        int v112 = *(unsigned __int8 *)(a2 + 184);
        uint64_t v125 = *(void *)(a2 + 112);
        uint64_t v126 = *(void *)(a2 + 104);
        uint64_t v113 = *(void *)(a2 + 192);
        do
        {
          long long v114 = v147[0].__locale_;
          long long v115 = v147[1].__locale_;
          long long v144 = *(_OWORD *)&v147[0].__locale_;
          if (v136 != v110)
          {
            long long v116 = v110;
            uint64_t v117 = v127;
            do
            {
              uint64_t v118 = *v116++;
              *((void *)&v144 + v118) = 0;
              --v117;
            }
            while (v117);
          }
          uint64_t v119 = 0;
          uint64_t v120 = 0;
          char v121 = 1;
          do
          {
            char v122 = v121;
            v120 += *((void *)&v162 + v119) * *((void *)&v144 + v119);
            uint64_t v119 = 1;
            char v121 = 0;
          }
          while ((v122 & 1) != 0);
          if (!v112) {
            uint64_t v120 = v144 * v126 + *((void *)&v144 + 1) * v125;
          }
          *(float *)(v138 + 4 * ((void)v114 * v133 + (void)v115 * v130)) = expf(*(float *)(v113 + 4 * v120));
          for (uint64_t m = 1; m != -1; --m)
          {
            long long v124 = (std::locale::__imp *)((char *)v147[m].__locale_ + 1);
            v147[m].__locale_ = v124;
            if (v124 != *(std::locale::__imp **)((char *)&v141 + m * 8)) {
              break;
            }
            v147[m].__locale_ = 0;
          }
          ++v109;
        }
        while (v109 != v59);
      }
    }
    sub_25B3F9500((uint64_t)&v150);
  }
}

void sub_25B5DD064(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,std::locale a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

uint64_t sub_25B5DD098(uint64_t result, uint64_t a2)
{
  uint64_t v3 = result;
  uint64_t v4 = 0;
  uint64_t v162 = *MEMORY[0x263EF8340];
  uint64_t v5 = (_OWORD *)(result + 8);
  char v6 = 1;
  do
  {
    uint64_t v7 = *((void *)v5 + v4);
    uint64_t v8 = *(void *)(a2 + 8 * v4);
    if ((v6 & 1) == 0) {
      break;
    }
    char v6 = 0;
    uint64_t v4 = 1;
  }
  while (v7 == v8);
  if (v7 == v8)
  {
    if (*(unsigned char *)(a2 + 184))
    {
      long long v148 = 0uLL;
      long long v149 = 0uLL;
      long long v147 = 0uLL;
      uint64_t v9 = *(void *)(result + 104);
      int v10 = *(float **)(result + 144);
      if (*(unsigned char *)(result + 136))
      {
        if (v9)
        {
          uint64_t v11 = *(float **)(a2 + 192);
          do
          {
            float v12 = *v11++;
            float v13 = v12;
            if (v12 < *(float *)(a2 + 248)) {
              float v13 = *(float *)(a2 + 248);
            }
            *v10++ = v13;
            --v9;
          }
          while (v9);
        }
      }
      else if (v9)
      {
        uint64_t v80 = 0;
        uint64_t v81 = *(void *)(result + 56);
        uint64_t v82 = *(void *)(result + 64);
        uint64_t v83 = *(void *)(a2 + 192);
        do
        {
          uint64_t v84 = 0;
          float v85 = *(float *)(v83 + 4 * v80);
          if (v85 < *(float *)(a2 + 248)) {
            float v85 = *(float *)(a2 + 248);
          }
          v10[v81 * (void)v147 + v82 * *((void *)&v147 + 1)] = v85;
          do
          {
            uint64_t v86 = *(void *)((char *)&v147 + v84 + 8) + 1;
            *(void *)((char *)&v147 + v84 + 8) = v86;
            uint64_t result = *(void *)(v3 + 16 + v84);
            if (v86 != result) {
              break;
            }
            *(void *)((char *)&v147 + v84 + 8) = 0;
            v84 -= 8;
          }
          while (v84 != -16);
          ++v80;
        }
        while (v80 != v9);
      }
    }
    else
    {
      long long v148 = 0uLL;
      long long v149 = 0uLL;
      long long v147 = 0uLL;
      uint64_t v41 = *(void *)(result + 104);
      uint64_t v42 = *(void *)(result + 144);
      if (*(unsigned char *)(result + 136))
      {
        if (v41)
        {
          uint64_t v43 = 0;
          uint64_t v44 = *(void *)(a2 + 104);
          uint64_t v45 = *(void *)(a2 + 112);
          uint64_t v46 = *(void *)(a2 + 192);
          do
          {
            uint64_t v47 = 0;
            float v48 = *(float *)(v46 + 4 * (v44 * v147 + v45 * *((void *)&v147 + 1)));
            if (v48 < *(float *)(a2 + 248)) {
              float v48 = *(float *)(a2 + 248);
            }
            *(float *)(v42 + 4 * v43) = v48;
            do
            {
              uint64_t v49 = *(void *)((char *)&v147 + v47 + 8) + 1;
              *(void *)((char *)&v147 + v47 + 8) = v49;
              uint64_t result = *(void *)(v3 + 16 + v47);
              if (v49 != result) {
                break;
              }
              *(void *)((char *)&v147 + v47 + 8) = 0;
              v47 -= 8;
            }
            while (v47 != -16);
            ++v43;
          }
          while (v43 != v41);
        }
      }
      else if (v41)
      {
        uint64_t v107 = 0;
        uint64_t v108 = *(void *)(result + 56);
        uint64_t v109 = *(void *)(result + 64);
        uint64_t v110 = *(void *)(a2 + 104);
        uint64_t v111 = *(void *)(a2 + 112);
        uint64_t v112 = *(void *)(a2 + 192);
        do
        {
          uint64_t result = 0;
          float v113 = *(float *)(v112 + 4 * (v110 * v147 + v111 * *((void *)&v147 + 1)));
          if (v113 < *(float *)(a2 + 248)) {
            float v113 = *(float *)(a2 + 248);
          }
          *(float *)(v42 + 4 * (v108 * v147 + v109 * *((void *)&v147 + 1))) = v113;
          do
          {
            uint64_t v114 = *(void *)((char *)&v147 + result + 8) + 1;
            *(void *)((char *)&v147 + result + 8) = v114;
            if (v114 != *(void *)(v3 + 16 + result)) {
              break;
            }
            *(void *)((char *)&v147 + result + 8) = 0;
            result -= 8;
          }
          while (result != -16);
          ++v107;
        }
        while (v107 != v41);
      }
    }
  }
  else
  {
    if (*(unsigned char *)(a2 + 184))
    {
      long long v160 = 0uLL;
      long long v161 = 0uLL;
      long long v158 = 0uLL;
      long long v159 = 0uLL;
      long long v156 = 0uLL;
      long long v157 = 0uLL;
      long long v154 = 0uLL;
      long long v155 = 0uLL;
      long long v152 = 0uLL;
      long long v153 = 0uLL;
      long long v150 = 0uLL;
      long long v151 = 0uLL;
      long long v148 = 0uLL;
      long long v149 = 0uLL;
      long long v147 = 0uLL;
      long long v139 = 0uLL;
      long long v140 = 0uLL;
      long long v138 = 0uLL;
      sub_25B40AB84((uint64_t)&v147, v5, (_OWORD *)a2, (uint64_t)&v138);
      uint64_t v14 = 0;
      char v15 = 1;
      do
      {
        uint64_t v16 = *((void *)&v138 + v14);
        uint64_t v17 = *((void *)v5 + v14);
        if ((v15 & 1) == 0) {
          break;
        }
        char v15 = 0;
        uint64_t v14 = 1;
      }
      while (v16 == v17);
      if (v16 != v17)
      {
        uint64_t v18 = sub_25B406B20(MEMORY[0x263F8C0F8], (uint64_t)"runtime_err in ", 15);
        char v19 = sub_25B406B20(v18, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/RoomScanCore/Sources/Utilities/wTensor/core/tensor/tensor.hpp", 99);
        sub_25B406B20(v19, (uint64_t)" ", 1);
        uint64_t v20 = (void *)MEMORY[0x263F8C0F8];
        uint64_t v21 = (void *)std::ostream::operator<<();
        sub_25B406B20(v21, (uint64_t)" ", 1);
        sub_25B406B20(v21, (uint64_t)"broadcast_assign_continue", 25);
        std::ios_base::getloc((const std::ios_base *)((char *)v21 + *(void *)(*v21 - 24)));
        long long v22 = std::locale::use_facet(v144, MEMORY[0x263F8C108]);
        ((void (*)(const std::locale::facet *, uint64_t))v22->__vftable[2].~facet_0)(v22, 10);
        std::locale::~locale(v144);
        std::ostream::put();
        std::ostream::flush();
        sub_25B406ED4("err", "broadcast assign issue");
        std::ios_base::getloc((const std::ios_base *)((char *)v20 + *(void *)(*v20 - 24)));
        uint64_t v23 = std::locale::use_facet(v144, MEMORY[0x263F8C108]);
        ((void (*)(const std::locale::facet *, uint64_t))v23->__vftable[2].~facet_0)(v23, 10);
        std::locale::~locale(v144);
        std::ostream::put();
        std::ostream::flush();
      }
      long long v145 = 0u;
      long long v146 = 0u;
      long long v143 = 0u;
      *(_OWORD *)&v144[0].__locale_ = 0u;
      long long v141 = 0u;
      long long v142 = 0u;
      uint64_t v24 = *(void *)(v3 + 104);
      uint64_t v25 = *(void *)(v3 + 144);
      if (*(unsigned char *)(v3 + 136))
      {
        if (v24)
        {
          uint64_t v26 = 0;
          unint64_t v28 = (uint64_t *)*((void *)&v148 + 1);
          long long v27 = (uint64_t *)v149;
          unint64_t v29 = (uint64_t)(v149 - *((void *)&v148 + 1)) >> 3;
          if (v29 <= 1) {
            unint64_t v29 = 1;
          }
          uint64_t v30 = *(void *)(a2 + 192);
          do
          {
            long long v141 = *(_OWORD *)&v144[0].__locale_;
            if (v27 != v28)
            {
              unint64_t v31 = v28;
              unint64_t v32 = v29;
              do
              {
                uint64_t v33 = *v31++;
                *((void *)&v141 + v33) = 0;
                --v32;
              }
              while (v32);
            }
            uint64_t v34 = 0;
            uint64_t v35 = 0;
            char v36 = 1;
            do
            {
              char v37 = v36;
              v35 += *((void *)&v159 + v34) * *((void *)&v141 + v34);
              uint64_t v34 = 1;
              char v36 = 0;
            }
            while ((v37 & 1) != 0);
            float v38 = *(float *)(v30 + 4 * v35);
            if (v38 < *(float *)(a2 + 248)) {
              float v38 = *(float *)(a2 + 248);
            }
            *(float *)(v25 + 4 * v26) = v38;
            for (uint64_t i = 1; i != -1; --i)
            {
              uint64_t v40 = (std::locale::__imp *)((char *)v144[i].__locale_ + 1);
              v144[i].__locale_ = v40;
              if (v40 != *(std::locale::__imp **)((char *)&v138 + i * 8)) {
                break;
              }
              v144[i].__locale_ = 0;
            }
            ++v26;
          }
          while (v26 != v24);
        }
      }
      else if (v24)
      {
        uint64_t v87 = 0;
        uint64_t v89 = (uint64_t *)*((void *)&v148 + 1);
        unint64_t v88 = (uint64_t *)v149;
        unint64_t v90 = (uint64_t)(v149 - *((void *)&v148 + 1)) >> 3;
        if (v90 <= 1) {
          unint64_t v90 = 1;
        }
        uint64_t v91 = *(void *)(v3 + 56);
        uint64_t v92 = *(void *)(v3 + 64);
        uint64_t v93 = *(void *)(a2 + 192);
        do
        {
          locale = v144[0].__locale_;
          char v95 = v144[1].__locale_;
          long long v141 = *(_OWORD *)&v144[0].__locale_;
          if (v88 != v89)
          {
            char v96 = v89;
            unint64_t v97 = v90;
            do
            {
              uint64_t v98 = *v96++;
              *((void *)&v141 + v98) = 0;
              --v97;
            }
            while (v97);
          }
          uint64_t v99 = 0;
          uint64_t v100 = 0;
          char v101 = 1;
          do
          {
            char v102 = v101;
            v100 += *((void *)&v159 + v99) * *((void *)&v141 + v99);
            uint64_t v99 = 1;
            char v101 = 0;
          }
          while ((v102 & 1) != 0);
          uint64_t v103 = (void)locale * v91 + (void)v95 * v92;
          float v104 = *(float *)(v93 + 4 * v100);
          if (v104 < *(float *)(a2 + 248)) {
            float v104 = *(float *)(a2 + 248);
          }
          *(float *)(v25 + 4 * v103) = v104;
          for (uint64_t j = 1; j != -1; --j)
          {
            float v106 = (std::locale::__imp *)((char *)v144[j].__locale_ + 1);
            v144[j].__locale_ = v106;
            if (v106 != *(std::locale::__imp **)((char *)&v138 + j * 8)) {
              break;
            }
            v144[j].__locale_ = 0;
          }
          ++v87;
        }
        while (v87 != v24);
      }
    }
    else
    {
      long long v160 = 0uLL;
      long long v161 = 0uLL;
      long long v158 = 0uLL;
      long long v159 = 0uLL;
      long long v156 = 0uLL;
      long long v157 = 0uLL;
      long long v154 = 0uLL;
      long long v155 = 0uLL;
      long long v152 = 0uLL;
      long long v153 = 0uLL;
      long long v150 = 0uLL;
      long long v151 = 0uLL;
      long long v148 = 0uLL;
      long long v149 = 0uLL;
      long long v147 = 0uLL;
      long long v139 = 0uLL;
      long long v140 = 0uLL;
      long long v138 = 0uLL;
      sub_25B40AB84((uint64_t)&v147, v5, (_OWORD *)a2, (uint64_t)&v138);
      uint64_t v50 = 0;
      char v51 = 1;
      do
      {
        uint64_t v52 = *((void *)&v138 + v50);
        uint64_t v53 = *((void *)v5 + v50);
        if ((v51 & 1) == 0) {
          break;
        }
        char v51 = 0;
        uint64_t v50 = 1;
      }
      while (v52 == v53);
      if (v52 != v53)
      {
        int v54 = sub_25B406B20(MEMORY[0x263F8C0F8], (uint64_t)"runtime_err in ", 15);
        unsigned int v55 = sub_25B406B20(v54, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/RoomScanCore/Sources/Utilities/wTensor/core/tensor/tensor.hpp", 99);
        sub_25B406B20(v55, (uint64_t)" ", 1);
        uint64_t v56 = (void *)MEMORY[0x263F8C0F8];
        uint64_t v57 = (void *)std::ostream::operator<<();
        sub_25B406B20(v57, (uint64_t)" ", 1);
        sub_25B406B20(v57, (uint64_t)"broadcast_assign_stride", 23);
        std::ios_base::getloc((const std::ios_base *)((char *)v57 + *(void *)(*v57 - 24)));
        uint64_t v58 = std::locale::use_facet(v144, MEMORY[0x263F8C108]);
        ((void (*)(const std::locale::facet *, uint64_t))v58->__vftable[2].~facet_0)(v58, 10);
        std::locale::~locale(v144);
        std::ostream::put();
        std::ostream::flush();
        sub_25B406ED4("err", "broadcast assign issue");
        std::ios_base::getloc((const std::ios_base *)((char *)v56 + *(void *)(*v56 - 24)));
        uint64_t v59 = std::locale::use_facet(v144, MEMORY[0x263F8C108]);
        ((void (*)(const std::locale::facet *, uint64_t))v59->__vftable[2].~facet_0)(v59, 10);
        std::locale::~locale(v144);
        std::ostream::put();
        std::ostream::flush();
      }
      long long v145 = 0u;
      long long v146 = 0u;
      long long v143 = 0u;
      *(_OWORD *)&v144[0].__locale_ = 0u;
      long long v141 = 0u;
      long long v142 = 0u;
      uint64_t v60 = *(void *)(v3 + 104);
      uint64_t v61 = *(void *)(v3 + 144);
      if (*(unsigned char *)(v3 + 136))
      {
        if (v60)
        {
          uint64_t v62 = 0;
          int v64 = (uint64_t *)*((void *)&v148 + 1);
          uint64_t v63 = (uint64_t *)v149;
          unint64_t v65 = (uint64_t)(v149 - *((void *)&v148 + 1)) >> 3;
          if (v65 <= 1) {
            unint64_t v65 = 1;
          }
          int v66 = *(unsigned __int8 *)(a2 + 184);
          uint64_t v67 = *(void *)(a2 + 104);
          uint64_t v68 = *(void *)(a2 + 112);
          uint64_t v69 = *(void *)(a2 + 192);
          do
          {
            long long v141 = *(_OWORD *)&v144[0].__locale_;
            if (v63 != v64)
            {
              uint64_t v70 = v64;
              unint64_t v71 = v65;
              do
              {
                uint64_t v72 = *v70++;
                *((void *)&v141 + v72) = 0;
                --v71;
              }
              while (v71);
            }
            uint64_t v73 = 0;
            uint64_t v74 = 0;
            char v75 = 1;
            do
            {
              char v76 = v75;
              v74 += *((void *)&v159 + v73) * *((void *)&v141 + v73);
              uint64_t v73 = 1;
              char v75 = 0;
            }
            while ((v76 & 1) != 0);
            if (!v66) {
              uint64_t v74 = v141 * v67 + *((void *)&v141 + 1) * v68;
            }
            float v77 = *(float *)(v69 + 4 * v74);
            if (v77 < *(float *)(a2 + 248)) {
              float v77 = *(float *)(a2 + 248);
            }
            *(float *)(v61 + 4 * v62) = v77;
            for (uint64_t k = 1; k != -1; --k)
            {
              uint64_t v79 = (std::locale::__imp *)((char *)v144[k].__locale_ + 1);
              v144[k].__locale_ = v79;
              if (v79 != *(std::locale::__imp **)((char *)&v138 + k * 8)) {
                break;
              }
              v144[k].__locale_ = 0;
            }
            ++v62;
          }
          while (v62 != v60);
        }
      }
      else if (v60)
      {
        uint64_t v115 = 0;
        uint64_t v117 = (uint64_t *)*((void *)&v148 + 1);
        long long v116 = (uint64_t *)v149;
        unint64_t v118 = (uint64_t)(v149 - *((void *)&v148 + 1)) >> 3;
        if (v118 <= 1) {
          unint64_t v118 = 1;
        }
        uint64_t v119 = *(void *)(v3 + 56);
        uint64_t v120 = *(void *)(v3 + 64);
        int v121 = *(unsigned __int8 *)(a2 + 184);
        uint64_t v122 = *(void *)(a2 + 104);
        uint64_t v123 = *(void *)(a2 + 112);
        uint64_t v124 = *(void *)(a2 + 192);
        do
        {
          uint64_t v125 = v144[0].__locale_;
          uint64_t v126 = v144[1].__locale_;
          long long v141 = *(_OWORD *)&v144[0].__locale_;
          if (v116 != v117)
          {
            uint64_t v127 = v117;
            unint64_t v128 = v118;
            do
            {
              uint64_t v129 = *v127++;
              *((void *)&v141 + v129) = 0;
              --v128;
            }
            while (v128);
          }
          uint64_t v130 = 0;
          uint64_t v131 = 0;
          char v132 = 1;
          do
          {
            char v133 = v132;
            v131 += *((void *)&v159 + v130) * *((void *)&v141 + v130);
            uint64_t v130 = 1;
            char v132 = 0;
          }
          while ((v133 & 1) != 0);
          if (!v121) {
            uint64_t v131 = v141 * v122 + *((void *)&v141 + 1) * v123;
          }
          uint64_t v134 = (void)v125 * v119 + (void)v126 * v120;
          float v135 = *(float *)(v124 + 4 * v131);
          if (v135 < *(float *)(a2 + 248)) {
            float v135 = *(float *)(a2 + 248);
          }
          *(float *)(v61 + 4 * v134) = v135;
          for (uint64_t m = 1; m != -1; --m)
          {
            unint64_t v137 = (std::locale::__imp *)((char *)v144[m].__locale_ + 1);
            v144[m].__locale_ = v137;
            if (v137 != *(std::locale::__imp **)((char *)&v138 + m * 8)) {
              break;
            }
            v144[m].__locale_ = 0;
          }
          ++v115;
        }
        while (v115 != v60);
      }
    }
    return sub_25B3F9500((uint64_t)&v147);
  }
  return result;
}

void sub_25B5DDAC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,std::locale a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

char *sub_25B5DDAFC(char *result, uint64_t a2)
{
  uint64_t v3 = result;
  uint64_t v4 = 0;
  v167[7] = *(std::locale *)MEMORY[0x263EF8340];
  uint64_t v5 = result + 8;
  char v6 = 1;
  do
  {
    uint64_t v7 = *((void *)v5 + v4);
    uint64_t v8 = *(void *)(a2 + 8 * v4);
    if ((v6 & 1) == 0) {
      break;
    }
    char v6 = 0;
    uint64_t v4 = 1;
  }
  while (v7 == v8);
  if (v7 == v8)
  {
    if (*(unsigned char *)(a2 + 288))
    {
      memset(v167, 0, 48);
      uint64_t v9 = *((void *)result + 13);
      uint64_t v10 = *((void *)result + 18);
      if (result[136])
      {
        if (v9)
        {
          uint64_t v11 = 0;
          unint64_t v12 = *(void *)(a2 + 56);
          uint64_t v13 = *(void *)(a2 + 296);
          do
          {
            uint64_t v14 = 0;
            uint64_t v15 = 0;
            memset((char *)v154 + 8, 0, 40);
            *(void *)&v154[0] = (unint64_t)v167[1].__locale_ % v12;
            char v16 = 1;
            do
            {
              char v17 = v16;
              v15 += *(void *)(a2 + 104 + 8 * v14) * *((void *)v154 + v14);
              uint64_t v14 = 1;
              char v16 = 0;
            }
            while ((v17 & 1) != 0);
            uint64_t v18 = 0;
            *(_DWORD *)(v10 + 4 * v11) = *(_DWORD *)(v13 + 4 * v15);
            do
            {
              uint64_t result = (char *)v167[v18 + 1].__locale_ + 1;
              v167[v18 + 1].__locale_ = (std::locale::__imp *)result;
              if (result != *(char **)&v3[v18 * 8 + 16]) {
                break;
              }
              v167[v18-- + 1].__locale_ = 0;
            }
            while (v18 != -2);
            ++v11;
          }
          while (v11 != v9);
        }
      }
      else if (v9)
      {
        uint64_t v86 = 0;
        uint64_t v87 = *((void *)result + 7);
        uint64_t v88 = *((void *)result + 8);
        unint64_t v89 = *(void *)(a2 + 56);
        uint64_t v90 = *(void *)(a2 + 296);
        result += 16;
        do
        {
          uint64_t v91 = 0;
          uint64_t v92 = 0;
          memset((char *)v154 + 8, 0, 40);
          *(void *)&v154[0] = (unint64_t)v167[1].__locale_ % v89;
          char v93 = 1;
          do
          {
            char v94 = v93;
            v92 += *(void *)(a2 + 104 + 8 * v91) * *((void *)v154 + v91);
            uint64_t v91 = 1;
            char v93 = 0;
          }
          while ((v94 & 1) != 0);
          uint64_t v95 = 0;
          *(_DWORD *)(v10 + 4 * (v88 * (uint64_t)v167[1].__locale_ + v87 * (uint64_t)v167[0].__locale_)) = *(_DWORD *)(v90 + 4 * v92);
          do
          {
            char v96 = (std::locale::__imp *)((char *)v167[v95 + 1].__locale_ + 1);
            v167[v95 + 1].__locale_ = v96;
            if (v96 != *(std::locale::__imp **)&result[v95 * 8]) {
              break;
            }
            v167[v95-- + 1].__locale_ = 0;
          }
          while (v95 != -2);
          ++v86;
        }
        while (v86 != v9);
      }
    }
    else
    {
      memset(v154, 0, sizeof(v154));
      uint64_t v48 = *((void *)result + 13);
      uint64_t v49 = *((void *)result + 18);
      if (result[136])
      {
        if (v48)
        {
          uint64_t v50 = 0;
          unint64_t v51 = *(void *)(a2 + 56);
          uint64_t v52 = *(void *)(a2 + 296);
          do
          {
            uint64_t v53 = 0;
            *(_DWORD *)(v49 + 4 * v50) = *(_DWORD *)(v52 + 4 * *(void *)(a2 + 208) * (*((void *)&v154[0] + 1) % v51));
            do
            {
              uint64_t v54 = *(void *)((char *)v154 + v53 + 8) + 1;
              *(void *)((char *)v154 + v53 + 8) = v54;
              if (v54 != *(void *)&result[v53 + 16]) {
                break;
              }
              *(void *)((char *)v154 + v53 + 8) = 0;
              v53 -= 8;
            }
            while (v53 != -16);
            ++v50;
          }
          while (v50 != v48);
        }
      }
      else if (v48)
      {
        uint64_t v117 = 0;
        uint64_t v118 = *((void *)result + 7);
        uint64_t v119 = *((void *)result + 8);
        unint64_t v120 = *(void *)(a2 + 56);
        uint64_t v121 = *(void *)(a2 + 296);
        do
        {
          uint64_t v122 = 0;
          *(_DWORD *)(v49 + 4 * (v118 * *(void *)&v154[0] + v119 * *((void *)&v154[0] + 1))) = *(_DWORD *)(v121 + 4 * *(void *)(a2 + 208) * (*((void *)&v154[0] + 1) % v120));
          do
          {
            uint64_t result = (char *)(*(void *)((char *)v154 + v122 + 8) + 1);
            *(void *)((char *)v154 + v122 + 8) = result;
            if (result != *(char **)&v3[v122 + 16]) {
              break;
            }
            *(void *)((char *)v154 + v122 + 8) = 0;
            v122 -= 8;
          }
          while (v122 != -16);
          ++v117;
        }
        while (v117 != v48);
      }
    }
  }
  else
  {
    if (*(unsigned char *)(a2 + 288))
    {
      long long v165 = 0uLL;
      long long v166 = 0uLL;
      long long v163 = 0uLL;
      long long v164 = 0uLL;
      long long v161 = 0uLL;
      long long v162 = 0uLL;
      long long v159 = 0uLL;
      long long v160 = 0uLL;
      long long v157 = 0uLL;
      long long v158 = 0uLL;
      long long v155 = 0uLL;
      long long v156 = 0uLL;
      memset(v154, 0, sizeof(v154));
      long long v146 = 0uLL;
      long long v147 = 0uLL;
      long long v145 = 0uLL;
      sub_25B40AB84((uint64_t)v154, v5, (_OWORD *)a2, (uint64_t)&v145);
      uint64_t v19 = 0;
      char v20 = 1;
      do
      {
        uint64_t v21 = *((void *)&v145 + v19);
        uint64_t v22 = *((void *)v5 + v19);
        if ((v20 & 1) == 0) {
          break;
        }
        char v20 = 0;
        uint64_t v19 = 1;
      }
      while (v21 == v22);
      if (v21 != v22)
      {
        uint64_t v23 = sub_25B406B20(MEMORY[0x263F8C0F8], (uint64_t)"runtime_err in ", 15);
        uint64_t v24 = sub_25B406B20(v23, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/RoomScanCore/Sources/Utilities/wTensor/core/tensor/tensor.hpp", 99);
        sub_25B406B20(v24, (uint64_t)" ", 1);
        uint64_t v25 = (void *)MEMORY[0x263F8C0F8];
        uint64_t v26 = (void *)std::ostream::operator<<();
        sub_25B406B20(v26, (uint64_t)" ", 1);
        sub_25B406B20(v26, (uint64_t)"broadcast_assign_continue", 25);
        std::ios_base::getloc((const std::ios_base *)((char *)v26 + *(void *)(*v26 - 24)));
        long long v27 = std::locale::use_facet(v167, MEMORY[0x263F8C108]);
        ((void (*)(const std::locale::facet *, uint64_t))v27->__vftable[2].~facet_0)(v27, 10);
        std::locale::~locale(v167);
        std::ostream::put();
        std::ostream::flush();
        sub_25B406ED4("err", "broadcast assign issue");
        std::ios_base::getloc((const std::ios_base *)((char *)v25 + *(void *)(*v25 - 24)));
        unint64_t v28 = std::locale::use_facet(v167, MEMORY[0x263F8C108]);
        ((void (*)(const std::locale::facet *, uint64_t))v28->__vftable[2].~facet_0)(v28, 10);
        std::locale::~locale(v167);
        std::ostream::put();
        std::ostream::flush();
      }
      long long v152 = 0u;
      long long v153 = 0u;
      long long v150 = 0u;
      long long v151 = 0u;
      long long v148 = 0u;
      long long v149 = 0u;
      uint64_t v29 = *((void *)v3 + 13);
      uint64_t v30 = *((void *)v3 + 18);
      if (v3[136])
      {
        if (v29)
        {
          uint64_t v31 = 0;
          uint64_t v33 = (uint64_t *)*((void *)&v154[1] + 1);
          unint64_t v32 = *(uint64_t **)&v154[2];
          unint64_t v34 = (uint64_t)(*(void *)&v154[2] - *((void *)&v154[1] + 1)) >> 3;
          if (v34 <= 1) {
            unint64_t v34 = 1;
          }
          unint64_t v35 = *(void *)(a2 + 56);
          uint64_t v36 = a2 + 104;
          uint64_t v37 = *(void *)(a2 + 296);
          do
          {
            unint64_t v38 = *((void *)&v151 + 1);
            *((void *)&v148 + 1) = *((void *)&v151 + 1);
            uint64_t v39 = v33;
            unint64_t v40 = v34;
            if (v32 != v33)
            {
              do
              {
                uint64_t v41 = *v39++;
                *((void *)&v148 + v41) = 0;
                --v40;
              }
              while (v40);
              unint64_t v38 = *((void *)&v148 + 1);
            }
            uint64_t v42 = 0;
            uint64_t v43 = 0;
            memset(&v167[1], 0, 40);
            v167[0].__locale_ = (std::locale::__imp *)(v38 % v35);
            char v44 = 1;
            do
            {
              char v45 = v44;
              v43 += *(void *)(v36 + 8 * v42) * (uint64_t)v167[v42].__locale_;
              uint64_t v42 = 1;
              char v44 = 0;
            }
            while ((v45 & 1) != 0);
            *(_DWORD *)(v30 + 4 * v31) = *(_DWORD *)(v37 + 4 * v43);
            for (uint64_t i = 8; i != -8; i -= 8)
            {
              uint64_t v47 = *(void *)((char *)&v151 + i) + 1;
              *(void *)((char *)&v151 + i) = v47;
              if (v47 != *(void *)((char *)&v145 + i)) {
                break;
              }
              *(void *)((char *)&v151 + i) = 0;
            }
            ++v31;
          }
          while (v31 != v29);
        }
      }
      else if (v29)
      {
        uint64_t v97 = 0;
        uint64_t v99 = (uint64_t *)*((void *)&v154[1] + 1);
        uint64_t v98 = *(uint64_t **)&v154[2];
        unint64_t v100 = (uint64_t)(*(void *)&v154[2] - *((void *)&v154[1] + 1)) >> 3;
        if (v100 <= 1) {
          unint64_t v100 = 1;
        }
        uint64_t v101 = *((void *)v3 + 7);
        uint64_t v102 = *((void *)v3 + 8);
        unint64_t v103 = *(void *)(a2 + 56);
        uint64_t v104 = a2 + 104;
        uint64_t v105 = *(void *)(a2 + 296);
        do
        {
          long long v106 = v151;
          *((void *)&v148 + 1) = *((void *)&v151 + 1);
          uint64_t v107 = v99;
          unint64_t v108 = v100;
          if (v98 == v99)
          {
            unint64_t v110 = *((void *)&v151 + 1);
          }
          else
          {
            do
            {
              uint64_t v109 = *v107++;
              *((void *)&v148 + v109) = 0;
              --v108;
            }
            while (v108);
            unint64_t v110 = *((void *)&v148 + 1);
          }
          uint64_t v111 = 0;
          uint64_t v112 = 0;
          memset(&v167[1], 0, 40);
          v167[0].__locale_ = (std::locale::__imp *)(v110 % v103);
          char v113 = 1;
          do
          {
            char v114 = v113;
            v112 += *(void *)(v104 + 8 * v111) * (uint64_t)v167[v111].__locale_;
            uint64_t v111 = 1;
            char v113 = 0;
          }
          while ((v114 & 1) != 0);
          *(_DWORD *)(v30 + 4 * (v106 * v101 + *((void *)&v106 + 1) * v102)) = *(_DWORD *)(v105 + 4 * v112);
          for (uint64_t j = 8; j != -8; j -= 8)
          {
            uint64_t v116 = *(void *)((char *)&v151 + j) + 1;
            *(void *)((char *)&v151 + j) = v116;
            if (v116 != *(void *)((char *)&v145 + j)) {
              break;
            }
            *(void *)((char *)&v151 + j) = 0;
          }
          ++v97;
        }
        while (v97 != v29);
      }
    }
    else
    {
      long long v165 = 0uLL;
      long long v166 = 0uLL;
      long long v163 = 0uLL;
      long long v164 = 0uLL;
      long long v161 = 0uLL;
      long long v162 = 0uLL;
      long long v159 = 0uLL;
      long long v160 = 0uLL;
      long long v157 = 0uLL;
      long long v158 = 0uLL;
      long long v155 = 0uLL;
      long long v156 = 0uLL;
      memset(v154, 0, sizeof(v154));
      long long v146 = 0uLL;
      long long v147 = 0uLL;
      long long v145 = 0uLL;
      sub_25B40AB84((uint64_t)v154, v5, (_OWORD *)a2, (uint64_t)&v145);
      uint64_t v55 = 0;
      char v56 = 1;
      do
      {
        uint64_t v57 = *((void *)&v145 + v55);
        uint64_t v58 = *((void *)v5 + v55);
        if ((v56 & 1) == 0) {
          break;
        }
        char v56 = 0;
        uint64_t v55 = 1;
      }
      while (v57 == v58);
      if (v57 != v58)
      {
        uint64_t v59 = sub_25B406B20(MEMORY[0x263F8C0F8], (uint64_t)"runtime_err in ", 15);
        uint64_t v60 = sub_25B406B20(v59, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/RoomScanCore/Sources/Utilities/wTensor/core/tensor/tensor.hpp", 99);
        sub_25B406B20(v60, (uint64_t)" ", 1);
        uint64_t v61 = (void *)MEMORY[0x263F8C0F8];
        uint64_t v62 = (void *)std::ostream::operator<<();
        sub_25B406B20(v62, (uint64_t)" ", 1);
        sub_25B406B20(v62, (uint64_t)"broadcast_assign_stride", 23);
        std::ios_base::getloc((const std::ios_base *)((char *)v62 + *(void *)(*v62 - 24)));
        uint64_t v63 = std::locale::use_facet(v167, MEMORY[0x263F8C108]);
        ((void (*)(const std::locale::facet *, uint64_t))v63->__vftable[2].~facet_0)(v63, 10);
        std::locale::~locale(v167);
        std::ostream::put();
        std::ostream::flush();
        sub_25B406ED4("err", "broadcast assign issue");
        std::ios_base::getloc((const std::ios_base *)((char *)v61 + *(void *)(*v61 - 24)));
        int v64 = std::locale::use_facet(v167, MEMORY[0x263F8C108]);
        ((void (*)(const std::locale::facet *, uint64_t))v64->__vftable[2].~facet_0)(v64, 10);
        std::locale::~locale(v167);
        std::ostream::put();
        std::ostream::flush();
      }
      long long v152 = 0u;
      long long v153 = 0u;
      long long v150 = 0u;
      long long v151 = 0u;
      long long v148 = 0u;
      long long v149 = 0u;
      uint64_t v65 = *((void *)v3 + 13);
      uint64_t v66 = *((void *)v3 + 18);
      if (v3[136])
      {
        if (v65)
        {
          uint64_t v67 = 0;
          uint64_t v69 = (uint64_t *)*((void *)&v154[1] + 1);
          uint64_t v68 = *(uint64_t **)&v154[2];
          unint64_t v70 = (uint64_t)(*(void *)&v154[2] - *((void *)&v154[1] + 1)) >> 3;
          if (v70 <= 1) {
            unint64_t v70 = 1;
          }
          unint64_t v71 = *(void *)(a2 + 56);
          int v72 = *(unsigned __int8 *)(a2 + 288);
          uint64_t v73 = *(void *)(a2 + 296);
          do
          {
            unint64_t v74 = *((void *)&v151 + 1);
            *((void *)&v148 + 1) = *((void *)&v151 + 1);
            char v75 = v69;
            unint64_t v76 = v70;
            if (v68 != v69)
            {
              do
              {
                uint64_t v77 = *v75++;
                *((void *)&v148 + v77) = 0;
                --v76;
              }
              while (v76);
              unint64_t v74 = *((void *)&v148 + 1);
            }
            uint64_t v78 = 0;
            unint64_t v79 = 0;
            memset(&v167[1], 0, 40);
            unint64_t v80 = v74 % v71;
            v167[0].__locale_ = (std::locale::__imp *)v80;
            char v81 = 1;
            do
            {
              char v82 = v81;
              v79 += *(void *)(a2 + 104 + 8 * v78) * (uint64_t)v167[v78].__locale_;
              uint64_t v78 = 1;
              char v81 = 0;
            }
            while ((v82 & 1) != 0);
            unint64_t v83 = *(void *)(a2 + 208) * v80;
            if (!v72) {
              unint64_t v79 = v83;
            }
            *(_DWORD *)(v66 + 4 * v67) = *(_DWORD *)(v73 + 4 * v79);
            for (uint64_t k = 8; k != -8; k -= 8)
            {
              uint64_t v85 = *(void *)((char *)&v151 + k) + 1;
              *(void *)((char *)&v151 + k) = v85;
              if (v85 != *(void *)((char *)&v145 + k)) {
                break;
              }
              *(void *)((char *)&v151 + k) = 0;
            }
            ++v67;
          }
          while (v67 != v65);
        }
      }
      else if (v65)
      {
        uint64_t v123 = 0;
        uint64_t v125 = (uint64_t *)*((void *)&v154[1] + 1);
        uint64_t v124 = *(uint64_t **)&v154[2];
        unint64_t v126 = (uint64_t)(*(void *)&v154[2] - *((void *)&v154[1] + 1)) >> 3;
        if (v126 <= 1) {
          unint64_t v126 = 1;
        }
        uint64_t v127 = *((void *)v3 + 7);
        uint64_t v128 = *((void *)v3 + 8);
        unint64_t v129 = *(void *)(a2 + 56);
        int v130 = *(unsigned __int8 *)(a2 + 288);
        uint64_t v131 = *(void *)(a2 + 296);
        do
        {
          long long v132 = v151;
          *((void *)&v148 + 1) = *((void *)&v151 + 1);
          char v133 = v125;
          unint64_t v134 = v126;
          if (v124 == v125)
          {
            unint64_t v136 = *((void *)&v151 + 1);
          }
          else
          {
            do
            {
              uint64_t v135 = *v133++;
              *((void *)&v148 + v135) = 0;
              --v134;
            }
            while (v134);
            unint64_t v136 = *((void *)&v148 + 1);
          }
          uint64_t v137 = 0;
          unint64_t v138 = 0;
          memset(&v167[1], 0, 40);
          unint64_t v139 = v136 % v129;
          v167[0].__locale_ = (std::locale::__imp *)v139;
          char v140 = 1;
          do
          {
            char v141 = v140;
            v138 += *(void *)(a2 + 104 + 8 * v137) * (uint64_t)v167[v137].__locale_;
            uint64_t v137 = 1;
            char v140 = 0;
          }
          while ((v141 & 1) != 0);
          unint64_t v142 = *(void *)(a2 + 208) * v139;
          if (v130) {
            unint64_t v142 = v138;
          }
          *(_DWORD *)(v66 + 4 * (v132 * v127 + *((void *)&v132 + 1) * v128)) = *(_DWORD *)(v131 + 4 * v142);
          for (uint64_t m = 8; m != -8; m -= 8)
          {
            uint64_t v144 = *(void *)((char *)&v151 + m) + 1;
            *(void *)((char *)&v151 + m) = v144;
            if (v144 != *(void *)((char *)&v145 + m)) {
              break;
            }
            *(void *)((char *)&v151 + m) = 0;
          }
          ++v123;
        }
        while (v123 != v65);
      }
    }
    return (char *)sub_25B3F9500((uint64_t)v154);
  }
  return result;
}

void sub_25B5DE648(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  std::locale::~locale((std::locale *)(v27 - 144));
  sub_25B3F9500((uint64_t)&a27);
  _Unwind_Resume(a1);
}

uint64_t sub_25B5DE67C()
{
  v0 = sub_25B406B20(MEMORY[0x263F8C0F8], (uint64_t)"err", 3);
  uint64_t v1 = sub_25B406B20(v0, (uint64_t)" ", 1);
  long long v2 = sub_25B406B20(v1, (uint64_t)"tile param should larger 0", 26);
  std::ios_base::getloc((const std::ios_base *)((char *)v2 + *(void *)(*v2 - 24)));
  uint64_t v3 = std::locale::use_facet(&v5, MEMORY[0x263F8C108]);
  ((void (*)(const std::locale::facet *, uint64_t))v3->__vftable[2].~facet_0)(v3, 10);
  std::locale::~locale(&v5);
  std::ostream::put();
  return std::ostream::flush();
}

void sub_25B5DE758(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
{
}

BOOL sub_25B5DE76C(float32x2_t *a1, uint64_t a2, float32x2_t a3)
{
  unint64_t v5 = 0;
  unint64_t v6 = 0xCCCCCCCCCCCCCCCDLL * ((a2 - (uint64_t)a1) >> 3);
  unint64_t v7 = v6;
  uint64_t v8 = a1;
  while (v6 != v5)
  {
    ++v5;
    float32x2_t v9 = *v8;
    v8 += 5;
    if (sub_25B40DB9C(a3, v9, a1[5 * (v5 % v6)], 0.00001) < 0.07)
    {
      unint64_t v7 = v5 - 1;
      return v6 > v7;
    }
  }
  return v6 > v7;
}

uint64_t sub_25B5DE824(float32x2_t *a1, uint64_t a2)
{
  unint64_t v2 = 0xCCCCCCCCCCCCCCCDLL * ((a2 - (uint64_t)a1) >> 3);
  if (v2 >= 4)
  {
    unint64_t v4 = v2 - 3;
    uint64_t v6 = 0;
    unint64_t v7 = 0;
    BOOL v8 = 0;
    unint64_t v9 = v2 - 2;
    uint64_t v10 = a1 + 10;
    unint64_t v16 = 0xCCCCCCCCCCCCCCCDLL * ((a2 - (uint64_t)a1) >> 3);
    while (v2 <= v7 + 2)
    {
      unint64_t v14 = v7 + 1;
LABEL_15:
      BOOL v8 = v4 <= v14;
      ++v6;
      v10 += 5;
      unint64_t v7 = v14;
      if (v14 == v4)
      {
        char v3 = 1;
        return v3 & 1;
      }
    }
    char v17 = v8;
    uint64_t v11 = v10;
    uint64_t v12 = v6;
    while (1)
    {
      if (!v7 && v4 == v12)
      {
LABEL_13:
        unint64_t v2 = v16;
        unint64_t v14 = v7 + 1;
        goto LABEL_15;
      }
      uint64_t v13 = v12 + 3;
      if (v4 == v12) {
        uint64_t v13 = 0;
      }
      if (sub_25B40E2B8(a1[5 * v7], a1[5 * v7 + 5], *v11, a1[5 * v13])) {
        break;
      }
      ++v12;
      v11 += 5;
      if (v9 == v12) {
        goto LABEL_13;
      }
    }
    char v3 = v17;
  }
  else
  {
    char v3 = 0;
  }
  return v3 & 1;
}

void sub_25B5DE964(uint64_t *a1)
{
  uint64_t v1 = a1[1];
  unint64_t v2 = 0xCCCCCCCCCCCCCCCDLL * ((v1 - *a1) >> 3);
  if ((int)v2 >= 2)
  {
    uint64_t v4 = 0;
    uint64_t v5 = -858993459 * ((v1 - *a1) >> 3);
    uint64_t v6 = (v2 - 2) + 1;
    uint64_t v7 = 40 * (v2 - 2);
    uint64_t v24 = v6;
    do
    {
      uint64_t v8 = v5--;
      uint64_t v9 = *a1;
      uint64_t v10 = v7;
      uint64_t v11 = v6;
      while (1)
      {
        float32x2_t v12 = vsub_f32(*(float32x2_t *)(*a1 + 40 * v5), *(float32x2_t *)(v9 + v10));
        if (sqrtf(vaddv_f32(vmul_f32(v12, v12))) < 0.07) {
          break;
        }
        --v11;
        v10 -= 40;
        if ((int)v4 + (int)v11 < 1) {
          goto LABEL_19;
        }
      }
      uint64_t v13 = v9 + 40 * v5;
      unint64_t v14 = *(void **)(v13 + 8);
      uint64_t v15 = (void *)(v13 + 16);
      if (v14 != (void *)(v13 + 16))
      {
        uint64_t v16 = v9 + 40 * (v4 + v11 - 1);
        char v17 = (uint64_t **)(v16 + 8);
        uint64_t v18 = (uint64_t *)(v16 + 16);
        do
        {
          sub_25B5A48A0(v17, v18, v14 + 4, (uint64_t)(v14 + 4));
          uint64_t v19 = (void *)v14[1];
          if (v19)
          {
            do
            {
              char v20 = v19;
              uint64_t v19 = (void *)*v19;
            }
            while (v19);
          }
          else
          {
            do
            {
              char v20 = (void *)v14[2];
              BOOL v21 = *v20 == (void)v14;
              unint64_t v14 = v20;
            }
            while (!v21);
          }
          unint64_t v14 = v20;
        }
        while (v20 != v15);
        uint64_t v9 = *a1;
        uint64_t v1 = a1[1];
      }
      uint64_t v1 = sub_25B576C0C(v9 + 40 * v5 + 40, v1, v9 + 40 * v5);
      uint64_t v22 = a1[1];
      if (v22 != v1)
      {
        do
        {
          uint64_t v23 = v22 - 40;
          sub_25B400248(*(char **)(v22 - 24));
          uint64_t v22 = v23;
        }
        while (v23 != v1);
      }
      a1[1] = v1;
      uint64_t v6 = v24;
LABEL_19:
      --v4;
      v7 -= 40;
    }
    while (v8 > 2);
  }
}

void sub_25B5DEB20(uint64_t *a1, float32x2_t **a2)
{
  sub_25B5DFF34(a1, a2);
  sub_25B5E0584((float32x2_t **)a1, a2);
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  sub_25B5E06B8(a1, (uint64_t *)a2, 0, &v4, 0);
  uint64_t v7 = (void **)&v4;
  sub_25B400058(&v7);
  sub_25B5E0584((float32x2_t **)a1, a2);
  sub_25B5E33A0(a1, (uint64_t *)a2, 0.0);
  sub_25B5E0584((float32x2_t **)a1, a2);
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  sub_25B5E06B8(a1, (uint64_t *)a2, 0, &v4, 0);
  uint64_t v7 = (void **)&v4;
  sub_25B400058(&v7);
  sub_25B5E3D34(a1);
}

void sub_25B5DEBF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9, uint64_t a10, uint64_t a11, void **a12)
{
}

void sub_25B5DEC24(uint64_t *a1, uint64_t *a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  unint64_t v29 = 0;
  uint64_t v2 = *a2;
  uint64_t v3 = a2[1] - *a2;
  if (v3)
  {
    unint64_t v6 = 0;
    unint64_t v7 = 0xCCCCCCCCCCCCCCCDLL * (v3 >> 3);
    uint64_t v8 = (uint64_t)(a1 + 2);
    do
    {
      sub_25B4C9CE4((uint64_t)v27, v2 + 40 * v6);
      sub_25B4C9CE4((uint64_t)v25, *a2 + 40 * ((v6 + 1) % v7));
      if (!sub_25B5DF12C((uint64_t)v27, (uint64_t)v25))
      {
        sub_25B5DFC70((uint64_t)v22, (uint64_t)v27, (uint64_t)v25, &v29);
        unint64_t v10 = a1[1];
        unint64_t v9 = a1[2];
        if (v10 >= v9)
        {
          uint64_t v12 = 0x2E8BA2E8BA2E8BA3 * ((uint64_t)(v10 - *a1) >> 3);
          unint64_t v13 = v12 + 1;
          if ((unint64_t)(v12 + 1) > 0x2E8BA2E8BA2E8BALL) {
            sub_25B3FBC4C();
          }
          unint64_t v14 = 0x2E8BA2E8BA2E8BA3 * ((uint64_t)(v9 - *a1) >> 3);
          if (2 * v14 > v13) {
            unint64_t v13 = 2 * v14;
          }
          if (v14 >= 0x1745D1745D1745DLL) {
            unint64_t v15 = 0x2E8BA2E8BA2E8BALL;
          }
          else {
            unint64_t v15 = v13;
          }
          uint64_t v32 = v8;
          if (v15) {
            unint64_t v15 = (unint64_t)sub_25B5DFD24(v15);
          }
          else {
            uint64_t v16 = 0;
          }
          unint64_t v30 = v15;
          *(void *)uint64_t v31 = v15 + 88 * v12;
          *(void *)&v31[8] = *(void *)v31;
          *(void *)&v31[16] = v15 + 88 * v16;
          sub_25B5DFCD0(*(uint64_t *)v31, (uint64_t)v22);
          *(void *)&v31[8] += 88;
          uint64_t v17 = sub_25B5DFDD4(v8, a1[1], a1[1], *a1, *a1, *(uint64_t *)v31, *(uint64_t *)v31);
          uint64_t v18 = a1[2];
          uint64_t v21 = *(void *)&v31[8];
          long long v19 = *(_OWORD *)&v31[8];
          long long v20 = *(_OWORD *)a1;
          *a1 = v17;
          *(_OWORD *)uint64_t v31 = v20;
          *(_OWORD *)(a1 + 1) = v19;
          *(void *)&v31[16] = v18;
          unint64_t v30 = v20;
          sub_25B5DFD70((uint64_t)&v30);
          uint64_t v11 = v21;
        }
        else
        {
          sub_25B5DFCD0(a1[1], (uint64_t)v22);
          uint64_t v11 = v10 + 88;
          a1[1] = v10 + 88;
        }
        a1[1] = v11;
        sub_25B400248(v24);
        sub_25B400248(v23);
      }
      sub_25B400248(v26);
      sub_25B400248(v28);
      unint64_t v6 = v29 + 1;
      unint64_t v29 = v6;
      uint64_t v2 = *a2;
      unint64_t v7 = 0xCCCCCCCCCCCCCCCDLL * ((a2[1] - *a2) >> 3);
    }
    while (v6 < v7);
  }
}

void sub_25B5DEE5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void **a11, uint64_t a12, char *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char *a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char *a29)
{
}

void sub_25B5DEED0(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a5 >= 1)
  {
    uint64_t v6 = a3;
    uint64_t v7 = a2;
    uint64_t v11 = a1[2];
    uint64_t v9 = (uint64_t)(a1 + 2);
    uint64_t v10 = v11;
    unint64_t v12 = *(void *)(v9 - 8);
    if ((uint64_t)(0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v11 - v12) >> 3)) >= a5)
    {
      uint64_t v21 = v12 - a2;
      if ((uint64_t)(0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v12 - a2) >> 3)) >= a5)
      {
        uint64_t v22 = a3 + 40 * a5;
      }
      else
      {
        uint64_t v22 = a3 + 8 * ((uint64_t)(v12 - a2) >> 3);
        a1[1] = sub_25B4C9E10(v9, v22, a4, *(void *)(v9 - 8));
        if (v21 < 1) {
          return;
        }
      }
      sub_25B5769B8((uint64_t)a1, v7, v12, v7 + 40 * a5);
      for (; v6 != v22; v7 += 40)
      {
        sub_25B576A98((uint64_t)v27, v7, v6);
        sub_25B400248(v28);
        v6 += 40;
      }
    }
    else
    {
      uint64_t v13 = *a1;
      unint64_t v14 = a5 - 0x3333333333333333 * ((uint64_t)(v12 - *a1) >> 3);
      if (v14 > 0x666666666666666) {
        sub_25B3FBC4C();
      }
      unint64_t v15 = 0xCCCCCCCCCCCCCCCDLL * ((a2 - v13) >> 3);
      unint64_t v16 = 0xCCCCCCCCCCCCCCCDLL * ((v10 - v13) >> 3);
      uint64_t v17 = 2 * v16;
      if (2 * v16 <= v14) {
        uint64_t v17 = a5 - 0x3333333333333333 * ((uint64_t)(v12 - *a1) >> 3);
      }
      if (v16 >= 0x333333333333333) {
        unint64_t v18 = 0x666666666666666;
      }
      else {
        unint64_t v18 = v17;
      }
      uint64_t v30 = v9;
      if (v18)
      {
        long long v19 = (char *)sub_25B460930(v18);
      }
      else
      {
        long long v19 = 0;
        uint64_t v20 = 0;
      }
      uint64_t v23 = &v19[40 * v15];
      v27[0] = v19;
      v27[1] = v23;
      unint64_t v28 = v23;
      unint64_t v29 = &v19[40 * v20];
      uint64_t v24 = 5 * a5;
      uint64_t v25 = &v23[40 * a5];
      uint64_t v26 = 8 * v24;
      do
      {
        sub_25B4C9CE4((uint64_t)v23, v6);
        v23 += 40;
        v6 += 40;
        v26 -= 40;
      }
      while (v26);
      unint64_t v28 = v25;
      sub_25B576B08(a1, v27, v7);
      sub_25B4C9F74((uint64_t)v27);
    }
  }
}

void sub_25B5DF0AC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12)
{
  *(void *)(v12 + 8) = v13;
  _Unwind_Resume(exception_object);
}

void sub_25B5DF0D8(void ***a1)
{
  uint64_t v2 = (uint64_t *)*a1;
  if (*v2)
  {
    sub_25B5DF9F0((uint64_t)v2, *v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

BOOL sub_25B5DF12C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 8);
  uint64_t v3 = (void *)(a1 + 16);
  if (v2 == (void *)(a1 + 16)) {
    return 0;
  }
  uint64_t v4 = a2 + 8;
  uint64_t v5 = (void *)(a2 + 16);
  while (1)
  {
    if (*((char *)v2 + 55) < 0)
    {
      sub_25B4002F4(__p, (void *)v2[4], v2[5]);
    }
    else
    {
      *(_OWORD *)std::string __p = *((_OWORD *)v2 + 2);
      uint64_t v13 = v2[6];
    }
    uint64_t v6 = sub_25B495914(v4, __p);
    BOOL v7 = v5 != v6;
    if (SHIBYTE(v13) < 0) {
      operator delete(__p[0]);
    }
    if (v5 != v6) {
      break;
    }
    uint64_t v8 = (void *)v2[1];
    if (v8)
    {
      do
      {
        uint64_t v9 = v8;
        uint64_t v8 = (void *)*v8;
      }
      while (v8);
    }
    else
    {
      do
      {
        uint64_t v9 = (void *)v2[2];
        BOOL v10 = *v9 == (void)v2;
        uint64_t v2 = v9;
      }
      while (!v10);
    }
    uint64_t v2 = v9;
    if (v9 == v3) {
      return 0;
    }
  }
  return v7;
}

void sub_25B5DF214(void **a1)
{
  uint64_t v1 = (char **)*a1;
  if (*a1)
  {
    uint64_t v3 = (char **)a1[1];
    uint64_t v4 = *a1;
    if (v3 != v1)
    {
      do
      {
        uint64_t v5 = v3 - 5;
        sub_25B400248(*(v3 - 3));
        uint64_t v3 = v5;
      }
      while (v5 != v1);
      uint64_t v4 = *a1;
    }
    a1[1] = v1;
    operator delete(v4);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

void sub_25B5DF280(uint64_t *a1)
{
  sub_25B5DEC24(&v74, a1);
  uint64_t v2 = v74;
  uint64_t v3 = v75;
  uint64_t v4 = 0x2E8BA2E8BA2E8BA3 * ((v75 - v74) >> 3);
  if ((int)v4 > 0)
  {
    uint64_t v5 = -1171354717 * ((v75 - v74) >> 3);
    unsigned int v6 = v4 - 1;
    while (1)
    {
      unint64_t v7 = 0x2E8BA2E8BA2E8BA3 * ((v3 - v2) >> 3);
      if (v7 < 2) {
        break;
      }
      uint64_t v8 = a1[1];
      unint64_t v9 = (v5 - 1);
      BOOL v10 = (float32x2_t *)(v2 + 88 * v9);
      float32x2_t v11 = v10[10];
      uint64_t v12 = (float32x2_t *)(v2
                          + 88
                          * ((int)(v5 - 1171354717 * ((v3 - v2) >> 3) - 2) % (int)(-1171354717 * ((v3 - v2) >> 3))));
      if ((*(void *)&v11 - 0x3333333333333333 * ((v8 - *a1) >> 3) - 1) % (0xCCCCCCCCCCCCCCCDLL * ((v8 - *a1) >> 3)) == *(void *)&v12[10])
      {
        float32x2_t v14 = v10[5];
        uint64_t v13 = (uint64_t)&v10[5];
        if (sub_25B5DF910((float32x2_t *)*a1, v8, vmul_f32(vadd_f32(v14, *v12), (float32x2_t)0x3F0000003F000000)))
        {
          sub_25B576A98((uint64_t)v68, (uint64_t)&v12[5], v13);
          sub_25B400248(v69);
          uint64_t v15 = v75;
          uint64_t v16 = v74 + 88 * v9;
          if (v16 + 88 != v75)
          {
            do
            {
              uint64_t v17 = v16 + 88;
              sub_25B5DFBF8(v16, v16 + 88);
              uint64_t v16 = v17;
            }
            while (v17 + 88 != v15);
            uint64_t v16 = v17;
          }
          sub_25B5DF9F0((uint64_t)&v74, v16);
          uint64_t v18 = sub_25B576C0C(*a1 + 40 * *(void *)&v11 + 40, a1[1], *a1 + 40 * *(void *)&v11);
          uint64_t v19 = a1[1];
          if (v19 != v18)
          {
            do
            {
              uint64_t v20 = v19 - 40;
              sub_25B400248(*(char **)(v19 - 24));
              uint64_t v19 = v20;
            }
            while (v20 != v18);
          }
          a1[1] = v18;
          uint64_t v2 = v74;
          uint64_t v3 = v75;
          unint64_t v21 = 0x2E8BA2E8BA2E8BA3 * ((v75 - v74) >> 3);
          if (v21 > v9)
          {
            uint64_t v22 = 88 * v6 + 80;
            do
            {
              --*(void *)(v2 + v22);
              ++v9;
              v22 += 88;
            }
            while (v9 < v21);
          }
        }
      }
      --v6;
      if (v5-- <= 1)
      {
        unint64_t v7 = 0x2E8BA2E8BA2E8BA3 * ((v3 - v2) >> 3);
        break;
      }
    }
    if ((int)v7 >= 1)
    {
      for (unint64_t i = v7 + 1; i > 1; --i)
      {
        sub_25B5DFA4C((uint64_t)v68, v74 + 88 * (i - 2));
        uint64_t v25 = v73;
        if (v70 | v72)
        {
          float32x2_t v26 = vsub_f32(v68[0], v71[0]);
          if (sqrtf(vaddv_f32(vmul_f32(v26, v26))) < 0.5) {
            goto LABEL_50;
          }
        }
        uint64_t v27 = v73 - 1;
        BOOL v28 = sub_25B5DF12C(*a1+ 40* ((v73 - 1 - 0x3333333333333333 * ((a1[1] - *a1) >> 3)) % (0xCCCCCCCCCCCCCCCDLL * ((a1[1] - *a1) >> 3))), (uint64_t)v68);
        BOOL v29 = sub_25B5DF12C(*a1 + 40 * ((v25 + 2) % (0xCCCCCCCCCCCCCCCDLL * ((a1[1] - *a1) >> 3))), (uint64_t)v71);
        if (!v28 && !v29) {
          goto LABEL_50;
        }
        unint64_t v30 = 0xCCCCCCCCCCCCCCCDLL * ((a1[1] - *a1) >> 3);
        float32x2_t v31 = *(float32x2_t *)(*a1 + 40 * ((v27 + v30) % v30));
        float32x2_t v32 = *(float32x2_t *)(*a1 + 40 * ((v25 + 2) % v30));
        float32x2_t v33 = v71[0];
        v67[0] = v68[0];
        v67[1] = v71[0];
        int v34 = v28 && v29;
        if (v28 && v29)
        {
          float32x2_t v35 = vsub_f32(v32, v71[0]);
          int32x2_t v36 = (int32x2_t)vmul_f32(v35, v35);
          float32x2_t v37 = vsub_f32(v31, v68[0]);
          int32x2_t v38 = (int32x2_t)vmul_f32(v37, v37);
          int32x2_t v39 = (int32x2_t)vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(v36, v38), (float32x2_t)vzip2_s32(v36, v38)));
          if ((vcgt_f32((float32x2_t)v39, (float32x2_t)vdup_lane_s32(v39, 1)).u8[0] & 1) == 0) {
            goto LABEL_24;
          }
        }
        else if (v28)
        {
LABEL_24:
          float32x2_t v40 = v31;
          float32x2_t v41 = v68[0];
          goto LABEL_27;
        }
        float32x2_t v40 = v32;
        float32x2_t v41 = v71[0];
        float32x2_t v32 = v31;
        float32x2_t v33 = v68[0];
LABEL_27:
        v66[0] = v40;
        v66[1] = v41;
        v65[0] = v32;
        v65[1] = v33;
        float v42 = sub_25B3FCCE0(v66, v67, 0);
        if ((float)(180.0 - v42) < v42) {
          float v42 = 180.0 - v42;
        }
        if (v42 < 2.5 || v42 > 87.5) {
          goto LABEL_50;
        }
        float v43 = sub_25B3FCCE0(v65, v67, 0);
        if ((float)(180.0 - v43) < v43) {
          float v43 = 180.0 - v43;
        }
        if (v34)
        {
          float32x2_t v44 = vsub_f32(v32, v33);
          float32x2_t v45 = vsub_f32(v40, v41);
          if (sqrtf(vaddv_f32(vmul_f32(v45, v45))) * 0.5 < sqrtf(vaddv_f32(vmul_f32(v44, v44)))
            && (v43 < 2.5 || v43 > 87.5))
          {
            goto LABEL_50;
          }
        }
        float32x2_t v46 = vsub_f32(v41, v40);
        float v47 = vaddv_f32(vmul_f32(vsub_f32(v33, v40), v46));
        float v48 = vaddv_f32(vmul_f32(v46, v46));
        if (v48 < 0.000001) {
          float v48 = 0.000001;
        }
        float32x2_t v49 = vmla_n_f32(v40, v46, v47 / v48);
        uint64_t v50 = (float32x2_t *)*a1;
        uint64_t v51 = a1[1];
        if (vaddv_f32(vmul_f32(v46, vsub_f32(v49, v41))) >= 0.0
          && sub_25B5DF910((float32x2_t *)*a1, a1[1], v49)
          && (*(float32x2_t *)v52.f32 = v49, sub_25B5DFAA0((uint64_t)v50, v51, v25 + 1, v52, v53, v54)))
        {
          sub_25B403500(__p, "");
          sub_25B4C9C30((uint64_t)v63, __p, 0, *(double *)&v49);
          if (v62 < 0) {
            operator delete(__p[0]);
          }
        }
        else
        {
          float32x2_t v55 = vadd_f32(vsub_f32(v41, v49), v33);
          if (!sub_25B5DF910(v50, v51, v55)) {
            goto LABEL_50;
          }
          *(float32x2_t *)v56.f32 = v55;
          if (!sub_25B5DFAA0((uint64_t)v50, v51, v25 + 1, v56, v57, v58)) {
            goto LABEL_50;
          }
          sub_25B403500(v59, "");
          sub_25B4C9C30((uint64_t)v63, v59, 0, *(double *)&v55);
          if (v60 < 0) {
            operator delete(v59[0]);
          }
        }
        sub_25B5766FC(a1, *a1 + 40 * v25 + 40, (unint64_t)v63);
        sub_25B400248(v64);
LABEL_50:
        sub_25B400248(*(char **)&v71[2]);
        sub_25B400248(v69);
      }
    }
  }
  v68[0] = (float32x2_t)&v74;
  sub_25B5DF0D8((void ***)v68);
}

void sub_25B5DF880(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,char *a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char *a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char *a39)
{
  sub_25B400248(a23);
  sub_25B400248(a39);
  sub_25B400248(a34);
  a21 = v39 - 176;
  sub_25B5DF0D8((void ***)&a21);
  _Unwind_Resume(a1);
}

BOOL sub_25B5DF910(float32x2_t *a1, uint64_t a2, float32x2_t a3)
{
  if ((int)(-858993459 * ((a2 - (uint64_t)a1) >> 3)) < 1)
  {
    float v7 = 0.0;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v6 = -858993459 * ((a2 - (uint64_t)a1) >> 3);
    float v7 = 0.0;
    uint64_t v8 = a1;
    do
    {
      float32x2_t v9 = *v8;
      v8 += 5;
      float32x2_t v10 = vsub_f32(v9, a3);
      uint64_t v11 = v5 + 1;
      if (v6 - 1 == v5) {
        uint64_t v12 = 0;
      }
      else {
        uint64_t v12 = v5 + 1;
      }
      float32x2_t v13 = vsub_f32(a1[5 * v12], a3);
      float v7 = v7
         + atan2f(vmlas_n_f32((float)-v10.f32[1] * v13.f32[0], v13.f32[1], v10.f32[0]), vmlas_n_f32(vmuls_lane_f32(v10.f32[1], v13, 1), v13.f32[0], v10.f32[0]));
      uint64_t v5 = v11;
    }
    while (v6 != v11);
  }
  return fabsf(v7) < 0.1;
}

void sub_25B5DF9F0(uint64_t a1, uint64_t a2)
{
  for (uint64_t i = *(void *)(a1 + 8); i != a2; i -= 88)
  {
    sub_25B400248(*(char **)(i - 32));
    sub_25B400248(*(char **)(i - 72));
  }
  *(void *)(a1 + 8) = a2;
}

uint64_t sub_25B5DFA4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25B4C9CE4(a1, a2);
  sub_25B4C9CE4(v4 + 40, a2 + 40);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  return a1;
}

void sub_25B5DFA8C(_Unwind_Exception *a1)
{
  sub_25B400248(*(char **)(v1 + 16));
  _Unwind_Resume(a1);
}

BOOL sub_25B5DFAA0(uint64_t a1, uint64_t a2, unint64_t a3, float32x4_t a4, float32x4_t a5, float32x4_t a6)
{
  unint64_t v6 = 0xCCCCCCCCCCCCCCCDLL * ((a2 - a1) >> 3);
  if (v6 >= a3 && v6 >= 3)
  {
    if (v6 == 2)
    {
      return 1;
    }
    else
    {
      unint64_t v10 = a4.i64[0];
      uint64_t v11 = 0;
      BOOL v8 = 0;
      unint64_t v12 = a3 % v6;
      unint64_t v13 = *(void *)(a1 + 40 * ((v6 + a3 % v6 - 1) % v6));
      uint64_t v14 = *(void *)(a1 + 40 * (a3 % v6));
      for (uint64_t i = 2; i != v6; ++i)
      {
        unint64_t v16 = (v11 + v12) % v6;
        a6.i64[0] = *(void *)(a1 + 40 * v16);
        if (v16 + 1 == v6) {
          unint64_t v17 = 0;
        }
        else {
          unint64_t v17 = v16 + 1;
        }
        a4.i64[0] = v13;
        a5.i64[0] = v10;
        if (sub_25B40E540(a4, a5, a6, *(float32x2_t *)(a1 + 40 * v17))) {
          break;
        }
        unint64_t v21 = (v11 + v12 + 1) % v6;
        v20.i64[0] = *(void *)(a1 + 40 * v21);
        uint64_t v22 = v21 + 1 == v6 ? 0 : v21 + 1;
        v18.i64[0] = v10;
        v19.i64[0] = v14;
        if (sub_25B40E540(v18, v19, v20, *(float32x2_t *)(a1 + 40 * v22))) {
          break;
        }
        ++v11;
        BOOL v8 = v6 - 2 <= i - 1;
      }
    }
  }
  else
  {
    return 0;
  }
  return v8;
}

void sub_25B5DFBF8(uint64_t a1, uint64_t a2)
{
  sub_25B576A98((uint64_t)v5, a1, a2);
  sub_25B576A98((uint64_t)v4, a1 + 40, a2 + 40);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  sub_25B400248(v4[2]);
  sub_25B400248(v6);
}

void sub_25B5DFC5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char *a16)
{
}

uint64_t sub_25B5DFC70(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7 = sub_25B4C9CE4(a1, a2);
  sub_25B4C9CE4(v7 + 40, a3);
  *(void *)(a1 + 80) = *a4;
  return a1;
}

void sub_25B5DFCBC(_Unwind_Exception *a1)
{
  sub_25B400248(*(char **)(v1 + 16));
  _Unwind_Resume(a1);
}

uint64_t sub_25B5DFCD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25B4C9CE4(a1, a2);
  sub_25B4C9CE4(v4 + 40, a2 + 40);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  return a1;
}

void sub_25B5DFD10(_Unwind_Exception *a1)
{
  sub_25B400248(*(char **)(v1 + 16));
  _Unwind_Resume(a1);
}

void *sub_25B5DFD24(unint64_t a1)
{
  if (a1 >= 0x2E8BA2E8BA2E8BBLL) {
    sub_25B3FA70C();
  }
  return operator new(88 * a1);
}

uint64_t sub_25B5DFD70(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v2; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 88;
    sub_25B400248(*(char **)(i - 32));
    sub_25B400248(*(char **)(i - 72));
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t sub_25B5DFDD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v14 = a6;
  *((void *)&v14 + 1) = a7;
  long long v13 = v14;
  v11[0] = a1;
  v11[1] = &v13;
  v11[2] = &v14;
  char v12 = 0;
  if (a3 != a5)
  {
    uint64_t v9 = a3;
    do
    {
      v9 -= 88;
      sub_25B5DFE80(v7 - 88, v9);
      uint64_t v7 = *((void *)&v14 + 1) - 88;
      *((void *)&v14 + 1) -= 88;
    }
    while (v9 != a5);
  }
  char v12 = 1;
  sub_25B5DFED4((uint64_t)v11);
  return v7;
}

void sub_25B5DFE6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_25B5DFE80(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25B4C9CE4(a1, a2);
  sub_25B4C9CE4(v4 + 40, a2 + 40);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  return a1;
}

void sub_25B5DFEC0(_Unwind_Exception *a1)
{
  sub_25B400248(*(char **)(v1 + 16));
  _Unwind_Resume(a1);
}

uint64_t sub_25B5DFED4(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 16) + 8);
    uint64_t v4 = *(void *)(*(void *)(a1 + 8) + 8);
    while (v3 != v4)
    {
      sub_25B400248(*(char **)(v3 + 56));
      sub_25B400248(*(char **)(v3 + 16));
      v3 += 88;
    }
  }
  return a1;
}

void sub_25B5DFF34(uint64_t *a1, float32x2_t **a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  unint64_t v6 = 126 - 2 * __clz(0xCCCCCCCCCCCCCCCDLL * (v5 - v4));
  if (v5 == v4) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = v6;
  }
  sub_25B5EC5F4(v4, v5, v7, 1);
  BOOL v8 = *a2;
  uint64_t v9 = a2[1];
  memset(v69, 0, sizeof(v69));
  long long v10 = 0uLL;
  uint64_t v11 = &off_25B5F1000;
  if (v8 == v9)
  {
    uint64_t v35 = 0;
  }
  else
  {
    int v64 = a1;
    do
    {
      unint64_t v13 = *(void *)&v69[8];
      uint64_t v12 = *(void *)v69;
      unint64_t v14 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*(void *)&v69[8] - *(void *)v69) >> 3);
      if (v14 >= 2)
      {
        uint64_t v15 = *(void *)&v69[8] - 40;
        do
        {
          uint64_t v16 = v12 + 40 * v14;
          float32x2_t v17 = *(float32x2_t *)(v16 - 40);
          float32x2_t v18 = *(float32x2_t *)(v16 - 80);
          float32x2_t v19 = vsub_f32(v17, v18);
          float32x2_t v20 = vsub_f32(*v8, v18);
          double v21 = v19.f32[0] * v20.f32[1] - v19.f32[1] * v20.f32[0];
          float32x2_t v22 = vsub_f32(v18, v17);
          int32x2_t v23 = (int32x2_t)vmul_f32(v22, v22);
          float32x2_t v24 = vsub_f32(v18, *v8);
          int32x2_t v25 = (int32x2_t)vmul_f32(v24, v24);
          float32x2_t v26 = vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(v23, v25), (float32x2_t)vzip2_s32(v23, v25)));
          float v27 = vmul_lane_f32(v26, v26, 1).f32[0];
          if (v27 < 0.000001) {
            float v27 = 0.000001;
          }
          double v28 = v21 / v27;
          if (fabs(v28) < 0.000000999999997) {
            break;
          }
          if (v28 <= 0.0) {
            break;
          }
          sub_25B400248(*(char **)(v13 - 24));
          v13 -= 40;
          *(void *)&v69[8] = v13;
          uint64_t v12 = *(void *)v69;
          unint64_t v14 = 0xCCCCCCCCCCCCCCCDLL * ((v15 - *(void *)v69) >> 3);
          v15 -= 40;
        }
        while (v14 > 1);
      }
      if (v12 == v13
        || (int8x8_t v29 = vmvn_s8((int8x8_t)vceq_f32(*(float32x2_t *)(v12 + 40 * v14 - 40), *v8)),
            ((v29.i32[0] | v29.i32[1]) & 1) != 0))
      {
        if (v13 >= *(void *)&v69[16])
        {
          unint64_t v30 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v13 - v12) >> 3);
          if (v30 + 1 > 0x666666666666666) {
            sub_25B3FBC4C();
          }
          unint64_t v31 = 0xCCCCCCCCCCCCCCCDLL * ((*(void *)&v69[16] - v12) >> 3);
          uint64_t v32 = 2 * v31;
          if (2 * v31 <= v30 + 1) {
            uint64_t v32 = v30 + 1;
          }
          if (v31 >= 0x333333333333333) {
            unint64_t v33 = 0x666666666666666;
          }
          else {
            unint64_t v33 = v32;
          }
          uint64_t v74 = &v69[16];
          if (v33) {
            unint64_t v33 = (unint64_t)sub_25B460930(v33);
          }
          else {
            uint64_t v34 = 0;
          }
          *(void *)&long long v71 = v33;
          *((void *)&v71 + 1) = v33 + 40 * v30;
          uint64_t v72 = *((void *)&v71 + 1);
          unint64_t v73 = v33 + 40 * v34;
          sub_25B4C9CE4(*((uint64_t *)&v71 + 1), (uint64_t)v8);
          v72 += 40;
          sub_25B4C9EFC((uint64_t *)v69, &v71);
          unint64_t v13 = *(void *)&v69[8];
          sub_25B4C9F74((uint64_t)&v71);
        }
        else
        {
          sub_25B4C9CE4(v13, (uint64_t)v8);
          v13 += 40;
        }
        uint64_t v12 = *(void *)v69;
      }
      *(void *)&long long v71 = v12;
      *((void *)&v71 + 1) = v13;
      uint64_t v72 = *(void *)&v69[16];
      memset(v69, 0, sizeof(v69));
      sub_25B5DF214((void **)v69);
      *(_OWORD *)uint64_t v69 = v71;
      *(void *)&v69[16] = v72;
      uint64_t v72 = 0;
      long long v71 = 0uLL;
      uint64_t v67 = (void **)&v71;
      sub_25B4000E4(&v67);
      v8 += 5;
    }
    while (v8 != v9);
    long long v10 = *(_OWORD *)v69;
    uint64_t v35 = *(void *)&v69[16];
    a1 = v64;
    uint64_t v11 = &off_25B5F1000;
  }
  *(_OWORD *)a1 = v10;
  a1[2] = v35;
  memset(v69, 0, sizeof(v69));
  *(void *)&long long v71 = v69;
  sub_25B4000E4((void ***)&v71);
  long long v36 = 0uLL;
  int32x2_t v38 = *a2;
  float32x2_t v37 = a2[1];
  memset(v66, 0, sizeof(v66));
  if (v37 == v38)
  {
    uint64_t v63 = 0;
  }
  else
  {
    float v39 = *((float *)v11 + 880);
    do
    {
      v37 -= 5;
      unint64_t v41 = *(void *)&v66[8];
      uint64_t v40 = *(void *)v66;
      unint64_t v42 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*(void *)&v66[8] - *(void *)v66) >> 3);
      if (v42 >= 2)
      {
        uint64_t v43 = *(void *)&v66[8] - 40;
        do
        {
          uint64_t v44 = v40 + 40 * v42;
          float32x2_t v45 = *(float32x2_t *)(v44 - 40);
          float32x2_t v46 = *(float32x2_t *)(v44 - 80);
          float32x2_t v47 = vsub_f32(v45, v46);
          float32x2_t v48 = vsub_f32(*v37, v46);
          double v49 = v47.f32[0] * v48.f32[1] - v47.f32[1] * v48.f32[0];
          float32x2_t v50 = vsub_f32(v46, v45);
          int32x2_t v51 = (int32x2_t)vmul_f32(v50, v50);
          float32x2_t v52 = vsub_f32(v46, *v37);
          int32x2_t v53 = (int32x2_t)vmul_f32(v52, v52);
          float32x2_t v54 = vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(v51, v53), (float32x2_t)vzip2_s32(v51, v53)));
          float v55 = vmul_lane_f32(v54, v54, 1).f32[0];
          if (v55 < v39) {
            float v55 = v39;
          }
          double v56 = v49 / v55;
          if (fabs(v56) < 0.000000999999997) {
            break;
          }
          if (v56 <= 0.0) {
            break;
          }
          sub_25B400248(*(char **)(v41 - 24));
          v41 -= 40;
          *(void *)&v66[8] = v41;
          uint64_t v40 = *(void *)v66;
          unint64_t v42 = 0xCCCCCCCCCCCCCCCDLL * ((v43 - *(void *)v66) >> 3);
          v43 -= 40;
        }
        while (v42 > 1);
      }
      if (v40 == v41
        || (int8x8_t v57 = vmvn_s8((int8x8_t)vceq_f32(*(float32x2_t *)(v40 + 40 * v42 - 40), *v37)),
            ((v57.i32[0] | v57.i32[1]) & 1) != 0))
      {
        if (v41 >= *(void *)&v66[16])
        {
          unint64_t v58 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v41 - v40) >> 3);
          if (v58 + 1 > 0x666666666666666) {
            sub_25B3FBC4C();
          }
          unint64_t v59 = 0xCCCCCCCCCCCCCCCDLL * ((*(void *)&v66[16] - v40) >> 3);
          uint64_t v60 = 2 * v59;
          if (2 * v59 <= v58 + 1) {
            uint64_t v60 = v58 + 1;
          }
          if (v59 >= 0x333333333333333) {
            unint64_t v61 = 0x666666666666666;
          }
          else {
            unint64_t v61 = v60;
          }
          uint64_t v74 = &v66[16];
          if (v61) {
            unint64_t v61 = (unint64_t)sub_25B460930(v61);
          }
          else {
            uint64_t v62 = 0;
          }
          *(void *)&long long v71 = v61;
          *((void *)&v71 + 1) = v61 + 40 * v58;
          uint64_t v72 = *((void *)&v71 + 1);
          unint64_t v73 = v61 + 40 * v62;
          sub_25B4C9CE4(*((uint64_t *)&v71 + 1), (uint64_t)v37);
          v72 += 40;
          sub_25B4C9EFC((uint64_t *)v66, &v71);
          unint64_t v41 = *(void *)&v66[8];
          sub_25B4C9F74((uint64_t)&v71);
        }
        else
        {
          sub_25B4C9CE4(v41, (uint64_t)v37);
          v41 += 40;
        }
        uint64_t v40 = *(void *)v66;
      }
      *(void *)&long long v71 = v40;
      *((void *)&v71 + 1) = v41;
      uint64_t v72 = *(void *)&v66[16];
      memset(v66, 0, sizeof(v66));
      sub_25B5DF214((void **)v66);
      *(_OWORD *)uint64_t v66 = v71;
      *(void *)&v66[16] = v72;
      uint64_t v72 = 0;
      unsigned __int8 v70 = (void **)&v71;
      long long v71 = 0uLL;
      sub_25B4000E4(&v70);
    }
    while (v37 != v38);
    uint64_t v63 = *(void ***)v66;
    long long v36 = *(_OWORD *)&v66[8];
  }
  uint64_t v65 = v36;
  uint64_t v67 = v63;
  long long v68 = v36;
  memset(v66, 0, sizeof(v66));
  *(void *)&long long v71 = v66;
  sub_25B4000E4((void ***)&v71);
  if (0xCCCCCCCCCCCCCCCDLL * ((v65 - (uint64_t)v63) >> 3) >= 2) {
    sub_25B5DEED0(a1, a1[1], (uint64_t)(v63 + 5), v65 - 40, 0xCCCCCCCCCCCCCCCDLL * ((v65 - 40 - (uint64_t)(v63 + 5)) >> 3));
  }
  *(void *)&long long v71 = &v67;
  sub_25B4000E4((void ***)&v71);
}

void sub_25B5E04F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void **a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void ***a21)
{
  a21 = &a14;
  sub_25B4000E4((void ***)&a21);
  sub_25B4000E4(&a14);
  _Unwind_Resume(a1);
}

void sub_25B5E0584(float32x2_t **a1, void *a2)
{
  if ((int)(-858993459 * ((uint64_t)(a2[1] - *a2) >> 3)) >= 1)
  {
    uint64_t v4 = -858993459 * ((uint64_t)(a2[1] - *a2) >> 3);
    do
    {
      sub_25B4C9CE4((uint64_t)v12, *a2 + 40 * (v4 - 1));
      uint64_t v5 = *a1;
      unint64_t v6 = a1[1];
      if (*a1 != v6)
      {
        while (1)
        {
          float32x2_t v7 = vsub_f32(v12[0], *v5);
          if (sqrtf(vaddv_f32(vmul_f32(v7, v7))) < 0.07) {
            break;
          }
          v5 += 5;
          if (v5 == v6) {
            goto LABEL_10;
          }
        }
        uint64_t v8 = sub_25B576C0C(*a2 + 40 * (v4 - 1) + 40, a2[1], *a2 + 40 * (v4 - 1));
        uint64_t v9 = a2[1];
        if (v9 != v8)
        {
          do
          {
            uint64_t v10 = v9 - 40;
            sub_25B400248(*(char **)(v9 - 24));
            uint64_t v9 = v10;
          }
          while (v10 != v8);
        }
        a2[1] = v8;
      }
LABEL_10:
      sub_25B400248(*(char **)&v12[2]);
    }
    while (v4-- > 1);
  }
}

void sub_25B5E06A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, char *a12)
{
}

void sub_25B5E06B8(uint64_t *a1, uint64_t *a2, int a3, uint64_t *a4, int a5)
{
  unint64_t v6 = a1;
  sub_25B5DEC24(&v348, a1);
  int64x2_t v346 = 0uLL;
  unint64_t v347 = 0;
  uint64_t v7 = v348;
  uint64_t v8 = &off_25B5F1000;
  uint64_t v316 = v349;
  v319 = v6;
  if (v348 != v349)
  {
    v314 = a2 + 2;
    v323 = a2;
    while (1)
    {
      sub_25B5DFA4C((uint64_t)v344, v7);
      long long v342 = 0u;
      int64x2_t v343 = 0u;
      long long v341 = 0u;
      uint64_t v321 = v7;
      if (a5) {
        break;
      }
      sub_25B5DFA4C((uint64_t)v332, (uint64_t)v344);
      long long v390 = 0u;
      int64x2_t v391 = 0u;
      long long v389 = 0u;
      unint64_t v26 = a2[1];
      unint64_t v25 = a2[2];
      if (v26 >= v25)
      {
        unint64_t v28 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v26 - *a2) >> 3);
        unint64_t v29 = v28 + 1;
        if (v28 + 1 > 0x666666666666666) {
          sub_25B3FBC4C();
        }
        unint64_t v30 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v25 - *a2) >> 3);
        if (2 * v30 > v29) {
          unint64_t v29 = 2 * v30;
        }
        if (v30 >= 0x333333333333333) {
          unint64_t v31 = 0x666666666666666;
        }
        else {
          unint64_t v31 = v29;
        }
        v384[0] = v314;
        if (v31) {
          unint64_t v31 = (unint64_t)sub_25B460930(v31);
        }
        else {
          uint64_t v32 = 0;
        }
        *(void *)&v383[0] = v31;
        *((void *)&v383[0] + 1) = v31 + 40 * v28;
        *(void *)&v383[1] = *((void *)&v383[0] + 1);
        *((void *)&v383[1] + 1) = v31 + 40 * v32;
        sub_25B4C9CE4(*((uint64_t *)&v383[0] + 1), (uint64_t)v334);
        *(void *)&v383[1] += 40;
        sub_25B4C9EFC(a2, v383);
        uint64_t v27 = a2[1];
        sub_25B4C9F74((uint64_t)v383);
      }
      else
      {
        sub_25B4C9CE4(a2[1], (uint64_t)v334);
        uint64_t v27 = v26 + 40;
        a2[1] = v26 + 40;
      }
      a2[1] = v27;
      uint64_t v52 = 0xCCCCCCCCCCCCCCCDLL * ((v27 - *a2) >> 3);
      v368 = 0;
      float32x2_t v367 = 0;
      sub_25B5E6034(v383, (uint64_t)v332, v52, (uint64_t *)&v367);
      uint64_t v53 = *((void *)&v389 + 1);
      uint64_t v54 = 8 * (v390 - *((void *)&v389 + 1)) - 1;
      unint64_t v55 = v391.i64[1] + v391.i64[0];
      if ((void)v390 == *((void *)&v389 + 1)) {
        uint64_t v54 = 0;
      }
      if (v54 == v55)
      {
        sub_25B5E6E88(&v389);
        uint64_t v53 = *((void *)&v389 + 1);
        unint64_t v55 = v391.i64[1] + v391.i64[0];
      }
      double v56 = (void *)(*(void *)(v53 + ((v55 >> 3) & 0x1FFFFFFFFFFFFFF8)) + ((v55 & 0x3F) << 6));
      void *v56 = *(void *)&v383[0];
      sub_25B4C9CE4((uint64_t)(v56 + 1), (uint64_t)v383 + 8);
      v56[6] = v385;
      int8x8_t v57 = v386;
      v56[7] = v386;
      if (v57) {
        atomic_fetch_add_explicit(&v57->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      ++v391.i64[1];
      sub_25B4C9CE4((uint64_t)&v363, *v6+ 40* ((*(void *)&v334[5] - 0x3333333333333333 * ((v6[1] - *v6) >> 3) - 1)% (0xCCCCCCCCCCCCCCCDLL * ((v6[1] - *v6) >> 3))));
      *((void *)&v338 + 1) = 0;
      *(void *)&long long v339 = 0;
      *(void *)&long long v338 = (char *)&v338 + 8;
      while (1)
      {
        if (!v391.i64[1])
        {
          uint64_t v90 = a2[1];
          uint64_t v91 = v90 - 40;
          sub_25B400248(*(char **)(v90 - 24));
          a2[1] = v91;
          long long v370 = 0u;
          long long v371 = 0u;
          long long v372 = 0u;
          goto LABEL_172;
        }
        unint64_t v58 = v391.i64[1] + v391.i64[0] - 1;
        uint64_t v59 = *(void *)(*((void *)&v389 + 1) + ((v58 >> 3) & 0x1FFFFFFFFFFFFFF8));
        uint64_t v60 = (std::__shared_weak_count *)operator new(0x58uLL);
        unint64_t v61 = (std::__shared_weak_count_vtbl **)(v59 + ((v58 & 0x3F) << 6));
        v60->__shared_owners_ = 0;
        v60->__shared_weak_owners_ = 0;
        v60->__vftable = (std::__shared_weak_count_vtbl *)&unk_2708F2740;
        v60[1].__vftable = *v61;
        uint64_t v62 = (uint64_t *)&v60[1];
        p_shared_owners = (float32x2_t *)&v60[1].__shared_owners_;
        sub_25B4C9CE4((uint64_t)&v60[1].__shared_owners_, (uint64_t)(v61 + 1));
        v60[3].__vftable = v61[6];
        uint64_t v64 = (uint64_t)v61[7];
        v60[3].__shared_owners_ = v64;
        if (v64) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(v64 + 8), 1uLL, memory_order_relaxed);
        }
        sub_25B5E6E48(*(void *)(*((void *)&v389 + 1)+ (((unint64_t)(v391.i64[1] + v391.i64[0] - 1) >> 3) & 0x1FFFFFFFFFFFFFF8))+ (((v391.i64[1] + v391.i64[0] - 1) & 0x3F) << 6));
        if ((void)v390 == *((void *)&v389 + 1)) {
          uint64_t v65 = 0;
        }
        else {
          uint64_t v65 = 8 * (v390 - *((void *)&v389 + 1)) - 1;
        }
        if ((unint64_t)(v65 - (--v391.i64[1] + v391.i64[0])) >= 0x80)
        {
          operator delete(*(void **)(v390 - 8));
          *(void *)&long long v390 = v390 - 8;
        }
        float32x2_t v66 = vsub_f32(*p_shared_owners, v334[0]);
        if (fabsf(sqrtf(vaddv_f32(vmul_f32(v66, v66)))) < 0.07)
        {
          if (v60[3].__vftable) {
            break;
          }
        }
        uint64_t v67 = (void *)*((void *)&v338 + 1);
        unint64_t v68 = *v62;
        if (!*((void *)&v338 + 1)) {
          goto LABEL_120;
        }
        uint64_t v69 = (long long *)((char *)&v338 + 8);
        do
        {
          unsigned __int8 v70 = v67;
          long long v71 = v69;
          unint64_t v72 = v67[4];
          unint64_t v73 = v67 + 1;
          if (v72 >= v68)
          {
            unint64_t v73 = v70;
            uint64_t v69 = v70;
          }
          uint64_t v67 = (void *)*v73;
        }
        while (v67);
        if (v69 == (long long *)((char *)&v338 + 8)) {
          goto LABEL_120;
        }
        if (v72 < v68) {
          unsigned __int8 v70 = v71;
        }
        if (v68 < v70[4])
        {
LABEL_120:
          sub_25B5E6184((uint64_t *)&v338, v68, *v62);
          uint64_t v74 = v60[3].__vftable;
          if (v74)
          {
            sub_25B576A98((uint64_t)&v350, (uint64_t)&v363, (uint64_t)&v74->~__shared_weak_count_0);
            sub_25B400248(v352);
          }
          sub_25B5E623C((uint64_t *)&v373, p_shared_owners, (float32x2_t *)&v363, a2, 1);
          uint64_t v75 = v374;
          unint64_t v76 = v373;
          if (v374 != v373)
          {
            uint64_t v77 = v374;
            do
            {
              unint64_t v79 = *(v77 - 6);
              v77 -= 6;
              unint64_t v78 = v79;
              unint64_t v80 = (void *)*((void *)&v338 + 1);
              if (!*((void *)&v338 + 1)) {
                goto LABEL_133;
              }
              char v81 = (long long *)((char *)&v338 + 8);
              do
              {
                char v82 = v80;
                unint64_t v83 = v81;
                unint64_t v84 = v80[4];
                uint64_t v85 = v80 + 1;
                if (v84 >= v78)
                {
                  uint64_t v85 = v82;
                  char v81 = v82;
                }
                unint64_t v80 = (void *)*v85;
              }
              while (v80);
              if (v81 == (long long *)((char *)&v338 + 8)) {
                goto LABEL_133;
              }
              if (v84 < v78) {
                char v82 = v83;
              }
              if (v78 < v82[4])
              {
LABEL_133:
                v357 = (float32x2_t *)&v60[1];
                v358 = v60;
                atomic_fetch_add_explicit(&v60->__shared_owners_, 1uLL, memory_order_relaxed);
                sub_25B5E6034(&v376, (uint64_t)(v75 - 5), v78, (uint64_t *)&v357);
                uint64_t v86 = *((void *)&v389 + 1);
                uint64_t v87 = 8 * (v390 - *((void *)&v389 + 1)) - 1;
                if ((void)v390 == *((void *)&v389 + 1)) {
                  uint64_t v87 = 0;
                }
                unint64_t v88 = v391.i64[1] + v391.i64[0];
                if (v87 == v391.i64[1] + v391.i64[0])
                {
                  sub_25B5E6E88(&v389);
                  uint64_t v86 = *((void *)&v389 + 1);
                  unint64_t v88 = v391.i64[1] + v391.i64[0];
                }
                unint64_t v89 = *(void *)(v86 + ((v88 >> 3) & 0x1FFFFFFFFFFFFFF8)) + ((v88 & 0x3F) << 6);
                *(void *)unint64_t v89 = v376;
                sub_25B4C9CE4(v89 + 8, (uint64_t)&v377);
                *(_OWORD *)(v89 + 48) = v380;
                long long v380 = 0uLL;
                ++v391.i64[1];
                sub_25B400248(v379);
                if (v358) {
                  sub_25B404120(v358);
                }
                unint64_t v76 = v373;
              }
              uint64_t v75 = v77;
            }
            while (v77 != v76);
          }
          v376 = (float32x2_t *)&v373;
          sub_25B5E4A0C((void ***)&v376);
        }
        sub_25B404120(v60);
      }
      uint64_t v92 = a2[1];
      uint64_t v93 = v92 - 40;
      sub_25B400248(*(char **)(v92 - 24));
      a2[1] = v93;
      char v94 = v60[3].__vftable;
      shared_owners = (std::__shared_weak_count *)v60[3].__shared_owners_;
      if (shared_owners)
      {
        atomic_fetch_add_explicit(&shared_owners->__shared_owners_, 1uLL, memory_order_relaxed);
        long long v371 = 0u;
        long long v372 = 0u;
        long long v370 = 0u;
        atomic_fetch_add_explicit(&shared_owners->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      else
      {
        long long v371 = 0u;
        long long v372 = 0u;
        long long v370 = 0u;
      }
      uint64_t v98 = &v94[1].~__shared_weak_count_0;
      v325 = shared_owners;
      if (v94[1].~__shared_weak_count_0)
      {
        uint64_t v99 = shared_owners;
        do
        {
          v376 = (float32x2_t *)v94->~__shared_weak_count;
          sub_25B4C9CE4((uint64_t)&v377, (uint64_t)&v94->~__shared_weak_count_0);
          sub_25B5E60E0((uint64_t)&v370, &v376);
          sub_25B400248(v379);
          unint64_t v100 = (std::__shared_weak_count_vtbl *)*v98;
          shared_owners = (std::__shared_weak_count *)v94[1].__on_zero_shared;
          if (shared_owners) {
            atomic_fetch_add_explicit(&shared_owners->__shared_owners_, 1uLL, memory_order_relaxed);
          }
          if (v99) {
            sub_25B404120(v99);
          }
          uint64_t v98 = &v100[1].~__shared_weak_count_0;
          char v94 = v100;
          uint64_t v99 = shared_owners;
        }
        while (v100[1].~__shared_weak_count_0);
      }
      if (shared_owners) {
        sub_25B404120(shared_owners);
      }
      if (v325) {
        sub_25B404120(v325);
      }
      sub_25B404120(v60);
LABEL_172:
      sub_25B3FA930(*((void **)&v338 + 1));
      sub_25B400248(v365[0]);
      if (v386) {
        sub_25B404120(v386);
      }
      sub_25B400248(*((char **)&v383[1] + 1));
      sub_25B5E6538((uint64_t)&v389);
      sub_25B5E5E70(&v341, (uint64_t)&v370);
      sub_25B5E5D24(&v370);
      sub_25B400248(*(char **)&v334[2]);
      uint64_t v97 = v333;
LABEL_175:
      sub_25B400248(v97);
      if (a3)
      {
        v364 = 0;
        v363 = 0;
        v365[0] = 0;
        v384[0] = v365;
        *(void *)&v383[0] = sub_25B460930(1uLL);
        *((void *)&v383[0] + 1) = *(void *)&v383[0];
        *(void *)&v383[1] = *(void *)&v383[0];
        *((void *)&v383[1] + 1) = *(void *)&v383[0] + 40 * v101;
        sub_25B4C9CE4(*(uint64_t *)&v383[0], (uint64_t)v344);
        *(void *)&v383[1] += 40;
        sub_25B4C9EFC((uint64_t *)&v363, v383);
        uint64_t v102 = v364;
        sub_25B4C9F74((uint64_t)v383);
        v364 = v102;
        if ((void)v342 != *((void *)&v341 + 1))
        {
          unint64_t v103 = (void *)(*((void *)&v341 + 1) + 8 * (v343.i64[0] / 0x55uLL));
          unint64_t v104 = *v103 + 48 * (v343.i64[0] % 0x55uLL);
          unint64_t v105 = *(void *)(*((void *)&v341 + 1) + 8 * ((v343.i64[1] + v343.i64[0]) / 0x55uLL))
               + 48 * ((v343.i64[1] + v343.i64[0]) % 0x55uLL);
          while (v104 != v105)
          {
            if ((char *)v102 >= v365[0])
            {
              unint64_t v106 = 0xCCCCCCCCCCCCCCCDLL * (((char *)v102 - (char *)v363) >> 3);
              unint64_t v107 = v106 + 1;
              if (v106 + 1 > 0x666666666666666) {
                sub_25B3FBC4C();
              }
              if (0x999999999999999ALL * ((v365[0] - (char *)v363) >> 3) > v107) {
                unint64_t v107 = 0x999999999999999ALL * ((v365[0] - (char *)v363) >> 3);
              }
              if (0xCCCCCCCCCCCCCCCDLL * ((v365[0] - (char *)v363) >> 3) >= 0x333333333333333) {
                unint64_t v108 = 0x666666666666666;
              }
              else {
                unint64_t v108 = v107;
              }
              v384[0] = v365;
              if (v108) {
                unint64_t v108 = (unint64_t)sub_25B460930(v108);
              }
              else {
                uint64_t v109 = 0;
              }
              *(void *)&v383[0] = v108;
              *((void *)&v383[0] + 1) = v108 + 40 * v106;
              *(void *)&v383[1] = *((void *)&v383[0] + 1);
              *((void *)&v383[1] + 1) = v108 + 40 * v109;
              sub_25B4C9CE4(*((uint64_t *)&v383[0] + 1), v104 + 8);
              *(void *)&v383[1] += 40;
              sub_25B4C9EFC((uint64_t *)&v363, v383);
              uint64_t v102 = v364;
              sub_25B4C9F74((uint64_t)v383);
            }
            else
            {
              sub_25B4C9CE4((uint64_t)v102, v104 + 8);
              v102 += 5;
            }
            v364 = v102;
            v104 += 48;
            if (v104 - *v103 == 4080)
            {
              unint64_t v110 = v103[1];
              ++v103;
              unint64_t v104 = v110;
            }
          }
        }
        if ((char *)v102 >= v365[0])
        {
          unint64_t v124 = 0xCCCCCCCCCCCCCCCDLL * (((char *)v102 - (char *)v363) >> 3);
          unint64_t v125 = v124 + 1;
          if (v124 + 1 > 0x666666666666666) {
            sub_25B3FBC4C();
          }
          if (0x999999999999999ALL * ((v365[0] - (char *)v363) >> 3) > v125) {
            unint64_t v125 = 0x999999999999999ALL * ((v365[0] - (char *)v363) >> 3);
          }
          if (0xCCCCCCCCCCCCCCCDLL * ((v365[0] - (char *)v363) >> 3) >= 0x333333333333333) {
            unint64_t v126 = 0x666666666666666;
          }
          else {
            unint64_t v126 = v125;
          }
          v384[0] = v365;
          if (v126) {
            unint64_t v126 = (unint64_t)sub_25B460930(v126);
          }
          else {
            uint64_t v127 = 0;
          }
          *(void *)&v383[0] = v126;
          *((void *)&v383[0] + 1) = v126 + 40 * v124;
          *(void *)&v383[1] = *((void *)&v383[0] + 1);
          *((void *)&v383[1] + 1) = v126 + 40 * v127;
          sub_25B4C9CE4(*((uint64_t *)&v383[0] + 1), (uint64_t)v345);
          uint64_t v122 = 48;
          *(void *)&v383[1] += 40;
          sub_25B4C9EFC((uint64_t *)&v363, v383);
          uint64_t v121 = v364;
          sub_25B4C9F74((uint64_t)v383);
        }
        else
        {
          sub_25B4C9CE4((uint64_t)v102, (uint64_t)v345);
          uint64_t v121 = v102 + 5;
          uint64_t v122 = 48;
        }
        v364 = v121;
        float32x2_t v132 = (float32x2_t)v363;
        v351 = 0;
        unint64_t v350 = 0;
        v352 = 0;
        sub_25B4C9D5C((uint64_t)&v350, *v323, v323[1], 0xCCCCCCCCCCCCCCCDLL * ((v323[1] - *v323) >> 3));
        sub_25B5E0584(&v363, &v350);
        char v133 = (float32x2_t *)v350;
        unint64_t v134 = v351;
        if ((void **)v350 == v351)
        {
LABEL_236:
          uint64_t v137 = ((uint64_t)v121 - *(void *)&v132) >> 3;
          int v138 = -858993459 * v137;
          if (-858993459 * (int)v137 < 1) {
            goto LABEL_327;
          }
          uint64_t v139 = 0;
          uint64_t v140 = v138;
          uint64_t v315 = (-858993459 * v137);
          uint64_t v326 = 5;
          while (1)
          {
            uint64_t v141 = v139 + 1;
            if (v139 + 2 < v140) {
              break;
            }
LABEL_259:
            v326 += 5;
            ++v139;
            uint64_t v140 = v138;
            if (v141 == v315) {
              goto LABEL_327;
            }
          }
          while (1)
          {
            uint64_t v142 = v140--;
            long long v143 = &v363[5 * v139];
            float32x2_t v144 = *v143;
            float v145 = 0.0;
            if (v139 < v140)
            {
              long long v146 = &v363[v326];
              float v145 = 0.0;
              float32x2_t v147 = *v143;
              uint64_t v148 = v139;
              do
              {
                ++v148;
                float32x2_t v149 = *v146;
                v146 += 5;
                float32x2_t v150 = vsub_f32(v147, v149);
                float v145 = v145 + sqrtf(vaddv_f32(vmul_f32(v150, v150)));
                float32x2_t v147 = v149;
              }
              while (v148 < v140);
            }
            long long v151 = &v363[5 * v140];
            float32x2_t v152 = *v151;
            float32x2_t v153 = vsub_f32(v144, *v151);
            float v154 = sqrtf(vaddv_f32(vmul_f32(v153, v153)));
            *((void *)&v338 + 1) = 0;
            *(void *)&long long v339 = 0;
            *(void *)&long long v338 = (char *)&v338 + 8;
            BOOL v155 = v145 > (float)(v154 * 5.0) && v154 < 0.65;
            if (v155)
            {
              unint64_t v161 = v122 & 0xFFFFFFFFFFFFFF00;
              goto LABEL_268;
            }
            uint64_t v156 = v142 - 2;
            float32x2_t v157 = v363[5 * v156];
            float32x2_t v158 = vsub_f32(*v151, v157);
            float v159 = vaddv_f32(vmul_f32(vsub_f32(v144, v157), v158));
            float v160 = vaddv_f32(vmul_f32(v158, v158));
            if (v160 < 0.000001) {
              float v160 = 0.000001;
            }
            unint64_t v161 = (unint64_t)vmla_n_f32(v157, v158, v159 / v160);
            if (vaddv_f32(vmul_f32(vsub_f32((float32x2_t)v161, v157), vsub_f32((float32x2_t)v161, *v151))) <= 0.0)
            {
              float32x2_t v162 = vsub_f32(v144, (float32x2_t)v161);
              int32x2_t v163 = (int32x2_t)vmul_f32(v162, v162);
              if (sqrtf(vaddv_f32((float32x2_t)v163)) < 0.65)
              {
                float32x2_t v164 = vsub_f32((float32x2_t)v161, v152);
                int32x2_t v165 = (int32x2_t)vmul_f32(v164, v164);
                float32x2_t v166 = vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(v165, v163), (float32x2_t)vzip2_s32(v165, v163)));
                __asm { FMOV            V4.2S, #5.0 }
                _D4.f32[0] = v145;
                v171.i32[0] = vsub_f32(_D4, v166).u32[0];
                int32x2_t v172 = (int32x2_t)vmul_f32(_D4, v166);
                v171.i32[1] = v172.i32[1];
                if (vcgt_f32(v171, (float32x2_t)vdup_lane_s32(v172, 1)).u8[0])
                {
                  sub_25B5A4730((uint64_t)v383, *(void **)&v363[5 * v156 + 1], &v363[5 * v156 + 2], *(void **)&v363[5 * v140 + 1], &v363[5 * v140 + 2], (uint64_t **)&v338, (uint64_t *)&v338 + 1);
                  goto LABEL_268;
                }
              }
            }
            float32x2_t v173 = *v143;
            float32x2_t v174 = v363[5 * v141];
            float32x2_t v175 = vsub_f32(v174, *v143);
            float v176 = vaddv_f32(vmul_f32(vsub_f32(v152, *v143), v175));
            float v177 = vaddv_f32(vmul_f32(v175, v175));
            if (v177 < 0.000001) {
              float v177 = 0.000001;
            }
            unint64_t v161 = (unint64_t)vmla_n_f32(v173, v175, v176 / v177);
            if (vaddv_f32(vmul_f32(vsub_f32((float32x2_t)v161, v173), vsub_f32((float32x2_t)v161, v174))) > 0.0
              || (float32x2_t v178 = vsub_f32(v152, (float32x2_t)v161),
                  int32x2_t v179 = (int32x2_t)vmul_f32(v178, v178),
                  sqrtf(vaddv_f32((float32x2_t)v179)) >= 0.65))
            {
              uint64_t v122 = 0;
            }
            else
            {
              float32x2_t v180 = vsub_f32((float32x2_t)v161, v144);
              int32x2_t v181 = (int32x2_t)vmul_f32(v180, v180);
              float32x2_t v182 = vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(v181, v179), (float32x2_t)vzip2_s32(v181, v179)));
              __asm { FMOV            V2.2S, #5.0 }
              _D2.f32[0] = v145;
              v184.i32[0] = vsub_f32(_D2, v182).u32[0];
              int32x2_t v185 = (int32x2_t)vmul_f32(_D2, v182);
              v184.i32[1] = v185.i32[1];
              if (vcgt_f32(v184, (float32x2_t)vdup_lane_s32(v185, 1)).u8[0])
              {
                sub_25B5A4730((uint64_t)v383, *(void **)&v363[5 * v139 + 1], &v363[5 * v139 + 2], *(void **)&v363[5 * v141 + 1], &v363[5 * v141 + 2], (uint64_t **)&v338, (uint64_t *)&v338 + 1);
LABEL_268:
                *(_OWORD *)v384 = 0u;
                memset(v383, 0, sizeof(v383));
                if (v139)
                {
                  unint64_t v192 = v343.i64[0];
                  int v193 = v139;
                  do
                  {
                    sub_25B5E5BF4(v383, (void *)(*(void *)(*((void *)&v341 + 1) + 8 * (v192 / 0x55)) + 48 * (v192 % 0x55)));
                    sub_25B400248(*(char **)(*(void *)(*((void *)&v341 + 1) + 8 * (v343.i64[0] / 0x55uLL))
                                           + 48 * (v343.i64[0] % 0x55uLL)
                                           + 24));
                    int64x2_t v343 = vaddq_s64(v343, (int64x2_t)xmmword_25B5F1620);
                    unint64_t v192 = v343.i64[0];
                    if (v343.i64[0] >= 0xAAuLL)
                    {
                      operator delete(**((void ***)&v341 + 1));
                      unint64_t v192 = v343.i64[0] - 85;
                      *((void *)&v341 + 1) += 8;
                      v343.i64[0] -= 85;
                    }
                    --v193;
                  }
                  while (v193);
                }
                for (int i = v139 + 1; i < (int)v140; ++i)
                {
                  sub_25B400248(*(char **)(*(void *)(*((void *)&v341 + 1) + 8 * (v343.i64[0] / 0x55uLL))
                                         + 48 * (v343.i64[0] % 0x55uLL)
                                         + 24));
                  int64x2_t v343 = vaddq_s64(v343, (int64x2_t)xmmword_25B5F1620);
                  if (v343.i64[0] > 0xA9uLL)
                  {
                    operator delete(**((void ***)&v341 + 1));
                    *((void *)&v341 + 1) += 8;
                    v343.i64[0] -= 85;
                  }
                }
                if (!v155)
                {
                  sub_25B403500(&v373, "");
                  sub_25B4C9C30((uint64_t)&v370, &v373, 0, *(double *)&v161);
                  if (SHIBYTE(v375) < 0) {
                    operator delete(v373);
                  }
                  if ((void)v339) {
                    sub_25B4CA0B0((uint64_t **)&v370 + 1, (void *)v338, (void *)&v338 + 1);
                  }
                  LODWORD(v389) = v138;
                  sub_25B4C9CE4((uint64_t)&v389 + 8, (uint64_t)&v370);
                  v376 = (float32x2_t *)(int)v389;
                  sub_25B4C9CE4((uint64_t)&v377, (uint64_t)&v389 + 8);
                  sub_25B5E60E0((uint64_t)&v341, &v376);
                  sub_25B400248(v379);
                  sub_25B400248(*((char **)&v390 + 1));
                  sub_25B400248((char *)v371);
                }
                while (v384[1])
                {
                  unint64_t v195 = (unint64_t)v384[1] + (unint64_t)v384[0] - 1;
                  uint64_t v196 = *(void *)(*((void *)&v383[0] + 1) + 8 * (v195 / 0x55));
                  unint64_t v197 = v343.i64[0];
                  if (!v343.i64[0])
                  {
                    sub_25B5E6B88((char **)&v341);
                    unint64_t v197 = v343.i64[0];
                  }
                  v198 = (void *)(*((void *)&v341 + 1) + 8 * (v197 / 0x55));
                  uint64_t v199 = *v198 + 48 * (v197 % 0x55);
                  if ((void)v342 == *((void *)&v341 + 1)) {
                    uint64_t v199 = 0;
                  }
                  if (v199 == *v198) {
                    uint64_t v199 = *(v198 - 1) + 4080;
                  }
                  *(void *)(v199 - 48) = *(void *)(v196 + 48 * (v195 % 0x55));
                  sub_25B4C9CE4(v199 - 40, v196 + 48 * (v195 % 0x55) + 8);
                  int64x2_t v343 = vaddq_s64(v343, (int64x2_t)xmmword_25B5F1300);
                  sub_25B5E5CA4(v383);
                }
                sub_25B5E5D24(v383);
                sub_25B400248(*((char **)&v338 + 1));
                goto LABEL_327;
              }
              uint64_t v122 = v161;
            }
            sub_25B400248(0);
            if (v140 <= v139 + 2) {
              goto LABEL_259;
            }
          }
        }
        uint64_t v135 = v363;
        unint64_t v136 = v364;
        while (!sub_25B5E6690(v135, (uint64_t)v136, *v133))
        {
          v133 += 5;
          if (v133 == (float32x2_t *)v134) {
            goto LABEL_236;
          }
        }
        v186 = (void **)*((void *)&v341 + 1);
        uint64_t v187 = v342;
        if ((void)v342 == *((void *)&v341 + 1))
        {
          uint64_t v187 = *((void *)&v341 + 1);
        }
        else
        {
          v188 = (void *)(*((void *)&v341 + 1) + 8 * (v343.i64[0] / 0x55uLL));
          unint64_t v189 = *v188 + 48 * (v343.i64[0] % 0x55uLL);
          unint64_t v190 = *(void *)(*((void *)&v341 + 1) + 8 * ((v343.i64[1] + v343.i64[0]) / 0x55uLL))
               + 48 * ((v343.i64[1] + v343.i64[0]) % 0x55uLL);
          if (v189 != v190)
          {
            do
            {
              sub_25B400248(*(char **)(v189 + 24));
              v189 += 48;
              if (v189 - *v188 == 4080)
              {
                unint64_t v191 = v188[1];
                ++v188;
                unint64_t v189 = v191;
              }
            }
            while (v189 != v190);
            uint64_t v187 = v342;
            v186 = (void **)*((void *)&v341 + 1);
          }
        }
        v343.i64[1] = 0;
        unint64_t v213 = v187 - (void)v186;
        if (v213 >= 0x11)
        {
          do
          {
            operator delete(*v186);
            v186 = (void **)(*((void *)&v341 + 1) + 8);
            *((void *)&v341 + 1) = v186;
            unint64_t v213 = v342 - (void)v186;
          }
          while ((void)v342 - (void)v186 > 0x10uLL);
        }
        if (v213 >> 3 == 1)
        {
          uint64_t v214 = 42;
        }
        else
        {
          if (v213 >> 3 != 2) {
            goto LABEL_327;
          }
          uint64_t v214 = 85;
        }
        v343.i64[0] = v214;
LABEL_327:
        *(void *)&v383[0] = &v350;
        sub_25B4000E4((void ***)v383);
        *(void *)&v383[0] = &v363;
        sub_25B4000E4((void ***)v383);
        unint64_t v6 = v319;
        a2 = v323;
      }
      else
      {
        unint64_t v377 = 0;
        v376 = 0;
        v378 = 0;
        v384[0] = &v378;
        *(void *)&v383[0] = sub_25B460930(1uLL);
        *((void *)&v383[0] + 1) = *(void *)&v383[0];
        *(void *)&v383[1] = *(void *)&v383[0];
        *((void *)&v383[1] + 1) = *(void *)&v383[0] + 40 * v111;
        sub_25B4C9CE4(*(uint64_t *)&v383[0], (uint64_t)v344);
        *(void *)&v383[1] += 40;
        sub_25B4C9EFC((uint64_t *)&v376, v383);
        unint64_t v112 = v377;
        sub_25B4C9F74((uint64_t)v383);
        unint64_t v377 = v112;
        if ((void)v342 != *((void *)&v341 + 1))
        {
          char v113 = (void *)(*((void *)&v341 + 1) + 8 * (v343.i64[0] / 0x55uLL));
          unint64_t v114 = *v113 + 48 * (v343.i64[0] % 0x55uLL);
          unint64_t v115 = *(void *)(*((void *)&v341 + 1) + 8 * ((v343.i64[1] + v343.i64[0]) / 0x55uLL))
               + 48 * ((v343.i64[1] + v343.i64[0]) % 0x55uLL);
          while (v114 != v115)
          {
            if (v112 >= (unint64_t)v378)
            {
              unint64_t v116 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v112 - (void)v376) >> 3);
              unint64_t v117 = v116 + 1;
              if (v116 + 1 > 0x666666666666666) {
                sub_25B3FBC4C();
              }
              if (0x999999999999999ALL * ((v378 - (char *)v376) >> 3) > v117) {
                unint64_t v117 = 0x999999999999999ALL * ((v378 - (char *)v376) >> 3);
              }
              if (0xCCCCCCCCCCCCCCCDLL * ((v378 - (char *)v376) >> 3) >= 0x333333333333333) {
                unint64_t v118 = 0x666666666666666;
              }
              else {
                unint64_t v118 = v117;
              }
              v384[0] = &v378;
              if (v118) {
                unint64_t v118 = (unint64_t)sub_25B460930(v118);
              }
              else {
                uint64_t v119 = 0;
              }
              *(void *)&v383[0] = v118;
              *((void *)&v383[0] + 1) = v118 + 40 * v116;
              *(void *)&v383[1] = *((void *)&v383[0] + 1);
              *((void *)&v383[1] + 1) = v118 + 40 * v119;
              sub_25B4C9CE4(*((uint64_t *)&v383[0] + 1), v114 + 8);
              *(void *)&v383[1] += 40;
              sub_25B4C9EFC((uint64_t *)&v376, v383);
              unint64_t v112 = v377;
              sub_25B4C9F74((uint64_t)v383);
            }
            else
            {
              sub_25B4C9CE4(v112, v114 + 8);
              v112 += 40;
            }
            unint64_t v377 = v112;
            v114 += 48;
            if (v114 - *v113 == 4080)
            {
              unint64_t v120 = v113[1];
              ++v113;
              unint64_t v114 = v120;
            }
          }
        }
        if (v112 >= (unint64_t)v378)
        {
          unint64_t v128 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v112 - (void)v376) >> 3);
          unint64_t v129 = v128 + 1;
          a2 = v323;
          if (v128 + 1 > 0x666666666666666) {
            sub_25B3FBC4C();
          }
          if (0x999999999999999ALL * ((v378 - (char *)v376) >> 3) > v129) {
            unint64_t v129 = 0x999999999999999ALL * ((v378 - (char *)v376) >> 3);
          }
          if (0xCCCCCCCCCCCCCCCDLL * ((v378 - (char *)v376) >> 3) >= 0x333333333333333) {
            unint64_t v130 = 0x666666666666666;
          }
          else {
            unint64_t v130 = v129;
          }
          v384[0] = &v378;
          if (v130) {
            unint64_t v130 = (unint64_t)sub_25B460930(v130);
          }
          else {
            uint64_t v131 = 0;
          }
          *(void *)&v383[0] = v130;
          *((void *)&v383[0] + 1) = v130 + 40 * v128;
          *(void *)&v383[1] = *((void *)&v383[0] + 1);
          *((void *)&v383[1] + 1) = v130 + 40 * v131;
          sub_25B4C9CE4(*((uint64_t *)&v383[0] + 1), (uint64_t)v345);
          *(void *)&v383[1] += 40;
          sub_25B4C9EFC((uint64_t *)&v376, v383);
          uint64_t v123 = v377;
          sub_25B4C9F74((uint64_t)v383);
        }
        else
        {
          sub_25B4C9CE4(v112, (uint64_t)v345);
          a2 = v323;
          uint64_t v123 = v112 + 40;
        }
        unint64_t v377 = v123;
        memset(v383, 0, 24);
        sub_25B4C9D5C((uint64_t)v383, *a2, a2[1], 0xCCCCCCCCCCCCCCCDLL * ((a2[1] - *a2) >> 3));
        sub_25B5E0584(&v376, v383);
        v200 = (float32x2_t *)*((void *)&v383[0] + 1);
        for (uint64_t j = *(float32x2_t **)&v383[0]; j != v200; j += 5)
        {
          v202 = v376;
          uint64_t v203 = v377;
          if (sub_25B5E6690(v376, v377, *j))
          {
            while (v202 != (float32x2_t *)v203)
            {
              if (sub_25B5DF12C((uint64_t)j, (uint64_t)v202))
              {
                float32x2_t v204 = vsub_f32(*j, *v202);
                if (sqrtf(vaddv_f32(vmul_f32(v204, v204))) < 0.65) {
                  goto LABEL_302;
                }
              }
              v202 += 5;
            }
            v205 = (void **)*((void *)&v341 + 1);
            uint64_t v206 = v342;
            if ((void)v342 == *((void *)&v341 + 1))
            {
              uint64_t v206 = *((void *)&v341 + 1);
            }
            else
            {
              v207 = (void *)(*((void *)&v341 + 1) + 8 * (v343.i64[0] / 0x55uLL));
              unint64_t v208 = *v207 + 48 * (v343.i64[0] % 0x55uLL);
              unint64_t v209 = *(void *)(*((void *)&v341 + 1) + 8 * ((v343.i64[1] + v343.i64[0]) / 0x55uLL))
                   + 48 * ((v343.i64[1] + v343.i64[0]) % 0x55uLL);
              if (v208 != v209)
              {
                do
                {
                  sub_25B400248(*(char **)(v208 + 24));
                  v208 += 48;
                  if (v208 - *v207 == 4080)
                  {
                    unint64_t v210 = v207[1];
                    ++v207;
                    unint64_t v208 = v210;
                  }
                }
                while (v208 != v209);
                uint64_t v206 = v342;
                v205 = (void **)*((void *)&v341 + 1);
              }
              a2 = v323;
            }
            v343.i64[1] = 0;
            unint64_t v211 = v206 - (void)v205;
            if (v211 >= 0x11)
            {
              do
              {
                operator delete(*v205);
                v205 = (void **)(*((void *)&v341 + 1) + 8);
                *((void *)&v341 + 1) = v205;
                unint64_t v211 = v342 - (void)v205;
              }
              while ((void)v342 - (void)v205 > 0x10uLL);
            }
            if (v211 >> 3 == 1)
            {
              uint64_t v212 = 42;
            }
            else
            {
              if (v211 >> 3 != 2) {
                break;
              }
              uint64_t v212 = 85;
            }
            v343.i64[0] = v212;
            break;
          }
LABEL_302:
          ;
        }
        *(void *)&long long v389 = v383;
        sub_25B4000E4((void ***)&v389);
        *(void *)&v383[0] = &v376;
        sub_25B4000E4((void ***)v383);
      }
      if (a4[1] == *a4) {
        goto LABEL_400;
      }
      v215 = (char *)operator new(8uLL);
      v216 = v215;
      *(void *)v215 = v344[0];
      v217 = v215 + 8;
      if ((void)v342 == *((void *)&v341 + 1)
        || (v218 = (void *)(*((void *)&v341 + 1) + 8 * (v343.i64[0] / 0x55uLL)),
            unint64_t v219 = *v218 + 48 * (v343.i64[0] % 0x55uLL),
            unint64_t v220 = *(void *)(*((void *)&v341 + 1) + 8 * ((v343.i64[1] + v343.i64[0]) / 0x55uLL))
                 + 48 * ((v343.i64[1] + v343.i64[0]) % 0x55uLL),
            v219 == v220))
      {
        v221 = v215 + 8;
LABEL_355:
        v231 = v216;
        uint64_t v232 = (v217 - v216) >> 3;
        unint64_t v233 = v232 + 1;
        if ((unint64_t)(v232 + 1) >> 61) {
          sub_25B3FBC4C();
        }
        if ((v221 - v216) >> 2 > v233) {
          unint64_t v233 = (v221 - v216) >> 2;
        }
        if ((unint64_t)(v221 - v216) >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v234 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v234 = v233;
        }
        if (v234) {
          unint64_t v234 = (unint64_t)sub_25B3FCAD4(v234);
        }
        v216 = (char *)(v234 + 8 * v232);
        *(void *)v216 = v345[0];
        uint64_t v230 = (uint64_t)(v216 + 8);
        while (v217 != v231)
        {
          uint64_t v235 = *((void *)v217 - 1);
          v217 -= 8;
          *((void *)v216 - 1) = v235;
          v216 -= 8;
        }
        if (v231) {
          operator delete(v231);
        }
        goto LABEL_368;
      }
      v221 = v215 + 8;
      do
      {
        if (v217 >= v221)
        {
          uint64_t v222 = (v217 - v216) >> 3;
          unint64_t v223 = v222 + 1;
          if ((unint64_t)(v222 + 1) >> 61) {
            sub_25B3FBC4C();
          }
          if ((v221 - v216) >> 2 > v223) {
            unint64_t v223 = (v221 - v216) >> 2;
          }
          if ((unint64_t)(v221 - v216) >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v224 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v224 = v223;
          }
          if (v224) {
            unint64_t v224 = (unint64_t)sub_25B3FCAD4(v224);
          }
          else {
            uint64_t v225 = 0;
          }
          v226 = (char *)(v224 + 8 * v222);
          *(void *)v226 = *(void *)(v219 + 8);
          v227 = v226 + 8;
          while (v217 != v216)
          {
            uint64_t v228 = *((void *)v217 - 1);
            v217 -= 8;
            *((void *)v226 - 1) = v228;
            v226 -= 8;
          }
          v221 = (char *)(v224 + 8 * v225);
          if (v216) {
            operator delete(v216);
          }
          v216 = v226;
          v217 = v227;
        }
        else
        {
          *(void *)v217 = *(void *)(v219 + 8);
          v217 += 8;
        }
        v219 += 48;
        if (v219 - *v218 == 4080)
        {
          unint64_t v229 = v218[1];
          ++v218;
          unint64_t v219 = v229;
        }
      }
      while (v219 != v220);
      if (v217 >= v221) {
        goto LABEL_355;
      }
      *(void *)v217 = v345[0];
      uint64_t v230 = (uint64_t)(v217 + 8);
LABEL_368:
      uint64_t v236 = *a4;
      uint64_t v237 = a4[1];
      if (*a4 != v237)
      {
        unint64_t v238 = (v230 - (uint64_t)v216) >> 3;
        while (2)
        {
          v383[0] = *(_OWORD *)v236;
          v383[1] = *(_OWORD *)(v236 + 16);
          v384[1] = 0;
          uint64_t v385 = 0;
          v384[0] = 0;
          sub_25B400390(v384, *(const void **)(v236 + 32), *(void *)(v236 + 40), (uint64_t)(*(void *)(v236 + 40) - *(void *)(v236 + 32)) >> 3);
          unint64_t v239 = 0;
          int v240 = 0;
          int v241 = 0;
          LODWORD(v386) = *(_DWORD *)(v236 + 56);
          while (v238 != v239)
          {
            unint64_t v242 = v239;
            float32x2_t v243 = vsub_f32(*(float32x2_t *)&v216[8 * v239], *(float32x2_t *)&v383[0]);
            float v244 = vaddv_f32(vmul_f32(*(float32x2_t *)((char *)v383 + 8), v243));
            if (v244 >= 0.0) {
              int v245 = v244 > *((float *)&v383[1] + 2);
            }
            else {
              int v245 = -1;
            }
            float v246 = vaddv_f32(vmul_f32(v243, *(float32x2_t *)&v383[1]));
            if (v246 >= 0.0) {
              int v247 = v246 > *((float *)&v383[1] + 3);
            }
            else {
              int v247 = -1;
            }
            v241 += v245;
            v240 += v247;
            if (v241 >= 0) {
              uint64_t v248 = v241;
            }
            else {
              uint64_t v248 = -v241;
            }
            unint64_t v239 = v242 + 1;
            if (v240 >= 0) {
              uint64_t v249 = v240;
            }
            else {
              uint64_t v249 = -v240;
            }
            if (v239 != v248 && v239 != v249)
            {
              v251 = v384[0];
              if (v238 <= v242) {
                goto LABEL_395;
              }
              v252 = (float32x2_t *)v384[1];
              if (v384[0] == v384[1]) {
                goto LABEL_395;
              }
              unint64_t v253 = 0;
              v254 = (float32x2_t *)v384[0];
              do
              {
                float32x2_t v255 = *v254++;
                v253 += sub_25B57AC18((uint64_t)v216, v230, v255);
              }
              while (v254 != v252);
              if ((float)((float)v253 / (float)(unint64_t)(((char *)v252 - v251) >> 3)) <= 0.3) {
                goto LABEL_395;
              }
              v269 = (void **)*((void *)&v341 + 1);
              uint64_t v270 = v342;
              if ((void)v342 == *((void *)&v341 + 1))
              {
                uint64_t v270 = *((void *)&v341 + 1);
              }
              else
              {
                v271 = (void *)(*((void *)&v341 + 1) + 8 * (v343.i64[0] / 0x55uLL));
                unint64_t v272 = *v271 + 48 * (v343.i64[0] % 0x55uLL);
                unint64_t v273 = *(void *)(*((void *)&v341 + 1) + 8 * ((v343.i64[1] + v343.i64[0]) / 0x55uLL))
                     + 48 * ((v343.i64[1] + v343.i64[0]) % 0x55uLL);
                if (v272 != v273)
                {
                  do
                  {
                    sub_25B400248(*(char **)(v272 + 24));
                    v272 += 48;
                    if (v272 - *v271 == 4080)
                    {
                      unint64_t v274 = v271[1];
                      ++v271;
                      unint64_t v272 = v274;
                    }
                  }
                  while (v272 != v273);
                  uint64_t v270 = v342;
                  v269 = (void **)*((void *)&v341 + 1);
                }
              }
              v343.i64[1] = 0;
              unint64_t v275 = v270 - (void)v269;
              if (v275 >= 0x11)
              {
                do
                {
                  operator delete(*v269);
                  v269 = (void **)(*((void *)&v341 + 1) + 8);
                  *((void *)&v341 + 1) = v269;
                  unint64_t v275 = v342 - (void)v269;
                }
                while ((void)v342 - (void)v269 > 0x10uLL);
              }
              if (v275 >> 3 == 1)
              {
                uint64_t v276 = 42;
LABEL_436:
                v343.i64[0] = v276;
              }
              else if (v275 >> 3 == 2)
              {
                uint64_t v276 = 85;
                goto LABEL_436;
              }
              if (v251) {
                operator delete(v251);
              }
              goto LABEL_398;
            }
          }
          v251 = v384[0];
LABEL_395:
          if (v251) {
            operator delete(v251);
          }
          v236 += 64;
          if (v236 != v237) {
            continue;
          }
          break;
        }
      }
LABEL_398:
      unint64_t v6 = v319;
      a2 = v323;
      if (v216) {
        operator delete(v216);
      }
LABEL_400:
      uint64_t v256 = v346.i64[1];
      if (v346.i64[1] >= v347)
      {
        unint64_t v259 = 0xAAAAAAAAAAAAAAABLL * ((v346.i64[1] - v346.i64[0]) >> 4);
        unint64_t v260 = v259 + 1;
        if (v259 + 1 > 0x555555555555555) {
          sub_25B3FBC4C();
        }
        if (0x5555555555555556 * ((uint64_t)(v347 - v346.i64[0]) >> 4) > v260) {
          unint64_t v260 = 0x5555555555555556 * ((uint64_t)(v347 - v346.i64[0]) >> 4);
        }
        if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v347 - v346.i64[0]) >> 4) >= 0x2AAAAAAAAAAAAAALL) {
          unint64_t v261 = 0x555555555555555;
        }
        else {
          unint64_t v261 = v260;
        }
        v384[0] = &v347;
        uint64_t v258 = v321;
        if (v261)
        {
          if (v261 > 0x555555555555555) {
            sub_25B3FA70C();
          }
          v262 = (char *)operator new(48 * v261);
        }
        else
        {
          v262 = 0;
        }
        *(void *)&v383[0] = v262;
        *((void *)&v383[0] + 1) = &v262[48 * v259];
        *(void *)&v383[1] = *((void *)&v383[0] + 1);
        *((void *)&v383[1] + 1) = &v262[48 * v261];
        sub_25B5E66E4(*((uint64_t *)&v383[0] + 1), &v341);
        v263 = (void *)*((void *)&v383[0] + 1);
        uint64_t v257 = *(void *)&v383[1] + 48;
        *(void *)&v383[1] += 48;
        uint64_t v264 = v346.i64[1];
        uint64_t v265 = v346.i64[0];
        if (v346.i64[1] == v346.i64[0])
        {
          int64x2_t v267 = vdupq_n_s64(v346.u64[1]);
        }
        else
        {
          do
          {
            uint64_t v266 = *(void *)(v264 - 48);
            v264 -= 48;
            *(v263 - 6) = v266;
            v263 -= 6;
            v263[1] = *(void *)(v264 + 8);
            v263[2] = *(void *)(v264 + 16);
            v263[3] = *(void *)(v264 + 24);
            *(_OWORD *)uint64_t v264 = 0uLL;
            *(_OWORD *)(v264 + 16) = 0uLL;
            v263[4] = *(void *)(v264 + 32);
            v263[5] = *(void *)(v264 + 40);
            *(void *)(v264 + 32) = 0;
            *(void *)(v264 + 40) = 0;
          }
          while (v264 != v265);
          int64x2_t v267 = v346;
          uint64_t v257 = *(void *)&v383[1];
        }
        v346.i64[0] = (uint64_t)v263;
        v346.i64[1] = v257;
        *(int64x2_t *)((char *)v383 + 8) = v267;
        unint64_t v268 = v347;
        unint64_t v347 = *((void *)&v383[1] + 1);
        *((void *)&v383[1] + 1) = v268;
        *(void *)&v383[0] = v267.i64[0];
        sub_25B5E6B38((uint64_t)v383);
      }
      else
      {
        sub_25B5E66E4(v346.i64[1], &v341);
        uint64_t v257 = v256 + 48;
        uint64_t v258 = v321;
      }
      v346.i64[1] = v257;
      sub_25B5E5D24(&v341);
      sub_25B400248((char *)v345[2]);
      sub_25B400248((char *)v344[2]);
      uint64_t v7 = v258 + 88;
      if (v7 == v316)
      {
        uint64_t v277 = v349;
        uint64_t v7 = v348;
        uint64_t v8 = &off_25B5F1000;
        goto LABEL_441;
      }
    }
    sub_25B5DFA4C((uint64_t)v335, (uint64_t)v344);
    sub_25B5DFA4C((uint64_t)v383, (uint64_t)v335);
    sub_25B5E5400(&v387, (uint64_t)v383, a2, *v6, v6[1], 1);
    sub_25B400248((char *)v386);
    sub_25B400248(*(char **)&v383[1]);
    sub_25B5DFA4C((uint64_t)&v376, (uint64_t)v335);
    sub_25B5E5400(&v381, (uint64_t)&v376, a2, *v6, v6[1], 0);
    sub_25B400248(*((char **)&v380 + 1));
    sub_25B400248(v378);
    long long v390 = 0u;
    int64x2_t v391 = 0u;
    long long v389 = 0u;
    uint64_t v9 = v381;
    if (v382 == v381)
    {
LABEL_33:
      long long v339 = 0u;
      int64x2_t v340 = 0u;
      long long v338 = 0u;
LABEL_158:
      char v96 = (void ***)sub_25B5E5D24(&v389);
      *(void *)&long long v389 = &v381;
      sub_25B5E4A0C(v96);
      *(void *)&long long v389 = &v387;
      sub_25B5E4A0C((void ***)&v389);
      sub_25B5E5E70(&v341, (uint64_t)&v338);
      sub_25B5E5D24(&v338);
      sub_25B400248(v337);
      uint64_t v97 = v336;
      goto LABEL_175;
    }
    unint64_t v10 = 0;
    while (1)
    {
      sub_25B4C9CE4((uint64_t)&v373, v9 + 48 * v10 + 8);
      LOBYTE(v370) = 0;
      BYTE8(v372) = 0;
      if (v10) {
        sub_25B5E5B90((uint64_t)&v370, v381 + 48 * v10 - 40);
      }
      uint64_t v11 = v387;
      if (v388 != v387) {
        break;
      }
LABEL_30:
      if (BYTE8(v372)) {
        sub_25B400248((char *)v371);
      }
      sub_25B400248(v375);
      ++v10;
      uint64_t v9 = v381;
      if (0xAAAAAAAAAAAAAAABLL * ((v382 - v381) >> 4) <= v10) {
        goto LABEL_33;
      }
    }
    unint64_t v12 = 0;
    uint64_t v13 = -40;
    while (1)
    {
      sub_25B4C9CE4((uint64_t)&v367, v11 + v13 + 48);
      LOBYTE(v363) = 0;
      char v366 = 0;
      if (v12) {
        sub_25B5E5B90((uint64_t)&v363, v387 + v13);
      }
      v361 = 0;
      uint64_t v362 = 0;
      v360 = (uint64_t *)&v361;
      float32x2_t v14 = vsub_f32((float32x2_t)v373, v367);
      float v15 = sqrtf(vaddv_f32(vmul_f32(v14, v14)));
      if (v15 < 0.65)
      {
        char v33 = 0;
        int v34 = -1;
        float32x2_t v19 = 0;
        goto LABEL_45;
      }
      if (BYTE8(v372) && sub_25B5DF12C((uint64_t)&v373, (uint64_t)&v370))
      {
        if (!BYTE8(v372)) {
          sub_25B4704D8();
        }
        float32x2_t v16 = vsub_f32(*(float32x2_t *)&v370, (float32x2_t)v373);
        float v17 = vaddv_f32(vmul_f32(vsub_f32(v367, (float32x2_t)v373), v16));
        float v18 = vaddv_f32(vmul_f32(v16, v16));
        if (v18 < 0.000001) {
          float v18 = 0.000001;
        }
        float32x2_t v19 = vmla_n_f32((float32x2_t)v373, v16, v17 / v18);
        if (vaddv_f32(vmul_f32(vsub_f32(v19, (float32x2_t)v373), vsub_f32(v19, *(float32x2_t *)&v370))) <= 0.0)
        {
          float32x2_t v20 = vsub_f32(v367, v19);
          if (sqrtf(vaddv_f32(vmul_f32(v20, v20))) < 0.65)
          {
            sub_25B5A4730((uint64_t)&v350, v374, &v375, *((void **)&v370 + 1), &v371, &v360, v360);
            int v34 = 0;
            char v33 = 1;
            goto LABEL_45;
          }
        }
      }
      if (v366 && sub_25B5DF12C((uint64_t)&v367, (uint64_t)&v363))
      {
        if (!v366) {
          sub_25B4704D8();
        }
        float32x2_t v21 = vsub_f32((float32x2_t)v363, v367);
        float v22 = vaddv_f32(vmul_f32(vsub_f32((float32x2_t)v373, v367), v21));
        float v23 = vaddv_f32(vmul_f32(v21, v21));
        if (v23 < 0.000001) {
          float v23 = 0.000001;
        }
        float32x2_t v19 = vmla_n_f32(v367, v21, v22 / v23);
        if (vaddv_f32(vmul_f32(vsub_f32(v19, v367), vsub_f32(v19, (float32x2_t)v363))) <= 0.0)
        {
          float32x2_t v24 = vsub_f32((float32x2_t)v373, v19);
          if (sqrtf(vaddv_f32(vmul_f32(v24, v24))) < 0.65) {
            break;
          }
        }
      }
      sub_25B400248(v361);
      if (v366) {
        sub_25B400248(v365[0]);
      }
      sub_25B400248(v369);
      ++v12;
      uint64_t v11 = v387;
      v13 += 48;
      if (0xAAAAAAAAAAAAAAABLL * ((v388 - v387) >> 4) <= v12) {
        goto LABEL_30;
      }
    }
    sub_25B5A4730((uint64_t)&v350, v368, &v369, v364, v365, &v360, v360);
    char v33 = 0;
    int v34 = 1;
LABEL_45:
    BOOL v35 = v15 < 0.07 && v15 < 0.65;
    if (v12)
    {
      uint64_t v36 = 0;
      do
      {
        sub_25B5E5BF4(&v389, (void *)(v387 + v36));
        v36 += 48;
      }
      while (48 * v12 != v36);
    }
    if (v34 == -1)
    {
      if (v35) {
        goto LABEL_56;
      }
    }
    else if (v34)
    {
LABEL_56:
      if (v15 >= 0.65)
      {
        sub_25B403500(__p, "");
        sub_25B4C9C30((uint64_t)&v357, __p, 0, *(double *)&v19);
        if (v356 < 0) {
          operator delete(__p[0]);
        }
        if (v362) {
          sub_25B4CA0B0((uint64_t **)&v358, v360, &v361);
        }
        unint64_t v350 = 0xCCCCCCCCCCCCCCCDLL * ((v323[1] - *v323) >> 3);
        sub_25B4C9CE4((uint64_t)&v351, (uint64_t)&v357);
        uint64_t v37 = *((void *)&v389 + 1);
        if ((void)v390 == *((void *)&v389 + 1)) {
          uint64_t v38 = 0;
        }
        else {
          uint64_t v38 = 85 * ((uint64_t)(v390 - *((void *)&v389 + 1)) >> 3) - 1;
        }
        unint64_t v39 = v391.i64[1] + v391.i64[0];
        if (v38 == v391.i64[1] + v391.i64[0])
        {
          sub_25B5EC340(&v389);
          uint64_t v37 = *((void *)&v389 + 1);
          unint64_t v39 = v391.i64[1] + v391.i64[0];
        }
        uint64_t v40 = (unint64_t *)(*(void *)(v37 + 8 * (v39 / 0x55)) + 48 * (v39 % 0x55));
        *uint64_t v40 = v350;
        sub_25B4C9CE4((uint64_t)(v40 + 1), (uint64_t)&v351);
        ++v391.i64[1];
        sub_25B400248(v353);
        sub_25B400248(v359);
      }
      if ((v33 & 1) == 0) {
        sub_25B5E5BF4(&v389, (void *)(v381 + 48 * v10));
      }
      for (uint64_t k = v10; k > 0; sub_25B5E5BF4(&v389, (void *)(v381 + 48 * k)))
        --k;
      if (v391.i64[1] > 3uLL)
      {
        v358 = 0;
        v357 = 0;
        v359 = 0;
        if ((void)v390 == *((void *)&v389 + 1)
          || (unint64_t v42 = (void *)(*((void *)&v389 + 1) + 8 * (v391.i64[0] / 0x55uLL)),
              unint64_t v43 = *v42 + 48 * (v391.i64[0] % 0x55uLL),
              unint64_t v44 = *(void *)(*((void *)&v389 + 1) + 8 * ((v391.i64[0] + v391.i64[1]) / 0x55uLL))
                  + 48 * ((v391.i64[0] + v391.i64[1]) % 0x55uLL),
              v43 == v44))
        {
          float32x2_t v45 = 0;
          int32x2_t v51 = 0;
        }
        else
        {
          float32x2_t v45 = 0;
          do
          {
            if (v45 >= (uint64_t *)v359)
            {
              unint64_t v46 = 0xCCCCCCCCCCCCCCCDLL * (((char *)v45 - (char *)v357) >> 3);
              unint64_t v47 = v46 + 1;
              if (v46 + 1 > 0x666666666666666) {
                sub_25B3FBC4C();
              }
              if (0x999999999999999ALL * ((v359 - (char *)v357) >> 3) > v47) {
                unint64_t v47 = 0x999999999999999ALL * ((v359 - (char *)v357) >> 3);
              }
              if (0xCCCCCCCCCCCCCCCDLL * ((v359 - (char *)v357) >> 3) >= 0x333333333333333) {
                unint64_t v48 = 0x666666666666666;
              }
              else {
                unint64_t v48 = v47;
              }
              v354 = &v359;
              if (v48) {
                unint64_t v48 = (unint64_t)sub_25B460930(v48);
              }
              else {
                uint64_t v49 = 0;
              }
              unint64_t v350 = v48;
              v351 = (void **)(v48 + 40 * v46);
              v352 = (char *)v351;
              v353 = (char *)(v48 + 40 * v49);
              sub_25B4C9CE4((uint64_t)v351, v43 + 8);
              v352 += 40;
              sub_25B4C9EFC((uint64_t *)&v357, &v350);
              float32x2_t v45 = (uint64_t *)v358;
              sub_25B4C9F74((uint64_t)&v350);
            }
            else
            {
              sub_25B4C9CE4((uint64_t)v45, v43 + 8);
              v45 += 5;
            }
            v358 = (std::__shared_weak_count *)v45;
            v43 += 48;
            if (v43 - *v42 == 4080)
            {
              unint64_t v50 = v42[1];
              ++v42;
              unint64_t v43 = v50;
            }
          }
          while (v43 != v44);
          int32x2_t v51 = v357;
        }
        if ((sub_25B5DE824(v51, (uint64_t)v45) & 1) == 0)
        {
          long long v339 = 0u;
          int64x2_t v340 = 0u;
          long long v338 = 0u;
          unint64_t v350 = (unint64_t)&v357;
          sub_25B4000E4((void ***)&v350);
LABEL_153:
          sub_25B400248(v361);
          if (v366) {
            sub_25B400248(v365[0]);
          }
          sub_25B400248(v369);
          if (BYTE8(v372)) {
            sub_25B400248((char *)v371);
          }
          sub_25B400248(v375);
          goto LABEL_158;
        }
        unint64_t v350 = (unint64_t)&v357;
        sub_25B4000E4((void ***)&v350);
      }
      sub_25B400248(*(char **)(*(void *)(*((void *)&v389 + 1) + 8 * (v391.i64[0] / 0x55uLL))
                             + 48 * (v391.i64[0] % 0x55uLL)
                             + 24));
      int64x2_t v391 = vaddq_s64(v391, (int64x2_t)xmmword_25B5F1620);
      if (v391.i64[0] >= 0xAAuLL)
      {
        operator delete(**((void ***)&v389 + 1));
        *((void *)&v389 + 1) += 8;
        v391.i64[0] -= 85;
      }
      sub_25B5E5CA4(&v389);
      long long v338 = v389;
      long long v339 = v390;
      long long v389 = 0u;
      long long v390 = 0u;
      int64x2_t v340 = v391;
      int64x2_t v391 = 0uLL;
      goto LABEL_153;
    }
    sub_25B5E5BF4(&v389, (void *)(v387 + 48 * v12));
    goto LABEL_56;
  }
  uint64_t v277 = v348;
LABEL_441:
  uint64_t v278 = (v277 - v7) >> 3;
  unint64_t v279 = 0x2E8BA2E8BA2E8BA3 * v278;
  if (-1171354717 * (int)v278 >= 1)
  {
    unint64_t v327 = (int)v279;
    unint64_t v328 = v279 - 1;
    uint64_t v280 = (-1171354717 * v278);
    int64x2_t v331 = *((int64x2_t *)v8 + 98);
    uint64_t v324 = 0x2E8BA2E8BA2E8BA3 * v278;
    do
    {
      uint64_t v281 = v280 - 1;
      uint64_t v282 = v346.i64[0];
      uint64_t v283 = (v280 - 1);
      v284 = (void *)(v346.i64[0] + 48 * v283);
      v285 = v284 + 5;
      if (v284[5])
      {
        uint64_t v286 = v348 + 88 * v283;
        uint64_t v289 = *(void *)(v286 + 80);
        v287 = (void *)(v286 + 80);
        uint64_t v288 = v289;
        uint64_t v290 = v289 + 1;
        LOBYTE(v383[0]) = 0;
        LOBYTE(v385) = 0;
        if (v279 >= 2)
        {
          int v291 = (v328 + v283) % v327;
          uint64_t v329 = v346.i64[0];
          uint64_t v330 = v290;
          if ((*(void *)(v348 + 88 * v291 + 80) + 1) % v279 == *v287)
          {
            if (*v285)
            {
              uint64_t v292 = v346.i64[0] + 48 * v291;
              uint64_t v295 = *(void *)(v292 + 40);
              v294 = (uint64_t *)(v292 + 40);
              uint64_t v293 = v295;
              if (v295)
              {
                uint64_t v322 = v288;
                char v296 = 0;
                v297 = (void *)(v346.i64[0] + 48 * v291);
                v298 = (int64x2_t *)(v346.i64[0] + 48 * v283 + 32);
                while (1)
                {
                  uint64_t v299 = *(void *)(v284[1] + 8 * (v298->i64[0] / 0x55uLL));
                  unint64_t v300 = v298->i64[0] % 0x55uLL;
                  if (*(void *)(v299 + 48 * v300) != *(void *)(*(void *)(v297[1]
                                                                              + 8 * ((v293 + *(v294 - 1) - 1) / 0x55uLL))
                                                                  + 48 * ((v293 + *(v294 - 1) - 1) % 0x55uLL)))
                    break;
                  v301 = (void *)(v299 + 48 * v300);
                  *(void *)&v383[0] = *v301;
                  if ((_BYTE)v385)
                  {
                    sub_25B576A98((uint64_t)&v376, (uint64_t)v383 + 8, (uint64_t)(v301 + 1));
                    sub_25B400248(v378);
                  }
                  else
                  {
                    sub_25B4C9CE4((uint64_t)v383 + 8, (uint64_t)(v301 + 1));
                    LOBYTE(v385) = 1;
                  }
                  sub_25B400248(*(char **)(*(void *)(v284[1] + 8 * (v298->i64[0] / 0x55uLL))
                                         + 48 * (v298->i64[0] % 0x55uLL)
                                         + 24));
                  int64x2_t *v298 = vaddq_s64(*v298, v331);
                  sub_25B5EC270((uint64_t)v284, 1);
                  sub_25B5E5CA4(v297);
                  if (*v285)
                  {
                    uint64_t v293 = *v294;
                    char v296 = 1;
                    if (*v294) {
                      continue;
                    }
                  }
                  goto LABEL_457;
                }
                if ((v296 & 1) == 0) {
                  goto LABEL_460;
                }
LABEL_457:
                uint64_t v302 = *v319 + 40 * *(void *)(v348 + 88 * v283 + 80);
                uint64_t v303 = sub_25B576C0C(v302 + 40, v319[1], v302);
                uint64_t v304 = v319[1];
                if (v304 != v303)
                {
                  do
                  {
                    uint64_t v305 = v304 - 40;
                    sub_25B400248(*(char **)(v304 - 24));
                    uint64_t v304 = v305;
                  }
                  while (v305 != v303);
                }
                v319[1] = v303;
                uint64_t v330 = v322;
              }
            }
          }
LABEL_460:
          unint64_t v6 = v319;
          if ((_BYTE)v385)
          {
            sub_25B5766FC(v319, *v319 + 40 * v330, (unint64_t)v383 + 8);
            uint64_t v281 = v280 - 1;
            uint64_t v290 = v330 + 1;
            unint64_t v279 = v324;
            uint64_t v282 = v329;
          }
          else
          {
            unint64_t v279 = v324;
            uint64_t v282 = v329;
            uint64_t v281 = v280 - 1;
            uint64_t v290 = v330;
          }
        }
        uint64_t v306 = v284[1];
        if (v284[2] != v306)
        {
          unint64_t v307 = *(void *)(v282 + 48 * v283 + 32);
          v308 = (void *)(v306 + 8 * (v307 / 0x55));
          v309 = (float32x2_t **)(*v308 + 48 * (v307 % 0x55));
          unint64_t v310 = *(void *)(v306 + 8 * ((*v285 + v307) / 0x55)) + 48 * ((*v285 + v307) % 0x55);
          if (v309 != (float32x2_t **)v310)
          {
            uint64_t v311 = 40 * v290;
            do
            {
              v376 = *v309;
              sub_25B4C9CE4((uint64_t)&v377, (uint64_t)(v309 + 1));
              sub_25B5766FC(v6, v311 + *v6, (unint64_t)&v377);
              sub_25B400248(v379);
              v309 += 6;
              if ((float32x2_t **)((char *)v309 - *v308) == (float32x2_t **)4080)
              {
                v312 = (float32x2_t **)v308[1];
                ++v308;
                v309 = v312;
              }
              v311 += 40;
            }
            while (v309 != (float32x2_t **)v310);
          }
        }
        if ((_BYTE)v385) {
          sub_25B400248(*((char **)&v383[1] + 1));
        }
      }
      BOOL v313 = v280 <= 1;
      uint64_t v280 = v281;
    }
    while (!v313);
  }
  *(void *)&v383[0] = &v346;
  sub_25B5E6AB4((void ***)v383);
  *(void *)&v383[0] = &v348;
  sub_25B5DF0D8((void ***)v383);
}

void sub_25B5E2F28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  sub_25B400248(a68);
  STACK[0x400] = (unint64_t)&STACK[0x2C0];
  sub_25B4000E4((void ***)&STACK[0x400]);
  STACK[0x400] = (unint64_t)&STACK[0x348];
  sub_25B4000E4((void ***)&STACK[0x400]);
  sub_25B5E5D24(&STACK[0x200]);
  sub_25B400248((char *)STACK[0x270]);
  sub_25B400248((char *)STACK[0x248]);
  STACK[0x238] = (unint64_t)&STACK[0x290];
  sub_25B5E6AB4((void ***)&STACK[0x238]);
  STACK[0x238] = (unint64_t)&STACK[0x2A8];
  sub_25B5DF0D8((void ***)&STACK[0x238]);
  _Unwind_Resume(a1);
}

void sub_25B5E33A0(uint64_t *a1, uint64_t *a2, float a3)
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  sub_25B5DEC24(&v74, a1);
  int v4 = -1171354717 * ((unint64_t)(v75 - v74) >> 3);
  if (v4 >= 1)
  {
    do
    {
      unsigned int v5 = v4 - 1;
      sub_25B5DFA4C((uint64_t)v71, v74 + 88 * (v4 - 1));
      unsigned int v58 = v4;
      uint64_t v67 = 0;
      uint64_t v68 = 0;
      float32x2_t v66 = 0;
      sub_25B4C9D5C((uint64_t)&v66, *a2, a2[1], 0xCCCCCCCCCCCCCCCDLL * ((a2[1] - *a2) >> 3));
      int64x2_t v61 = 0uLL;
      uint64_t v62 = 0;
      unint64_t v6 = v71[0];
      float32x2_t v7 = (float32x2_t)v72[0];
      uint64_t v8 = v66;
      uint64_t v9 = v67;
      if (v66 == v67)
      {
        unint64_t v31 = 0;
        unint64_t v30 = 0;
      }
      else
      {
        do
        {
          float32x2_t v10 = vsub_f32((float32x2_t)v6, *v8);
          float32x2_t v11 = vsub_f32(v7, *v8);
          float v12 = vaddv_f32(vmul_f32(v10, v11));
          if (v12 <= 0.0)
          {
            int32x2_t v13 = (int32x2_t)vmul_f32(v10, v10);
            int32x2_t v14 = (int32x2_t)vmul_f32(v11, v11);
            float32x2_t v15 = vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(v13, v14), (float32x2_t)vzip2_s32(v13, v14)));
            float v16 = vmul_lane_f32(v15, v15, 1).f32[0];
            if (v16 < 0.000001) {
              float v16 = 0.000001;
            }
            float v17 = v12 / v16;
            if (v17 < a3)
            {
              *(float *)&char v82 = v17;
              sub_25B4C9CE4((uint64_t)&v83, (uint64_t)v8);
              uint64_t v18 = v61.i64[1];
              if (v61.i64[1] >= (unint64_t)v62)
              {
                unint64_t v20 = 0xAAAAAAAAAAAAAAABLL * ((v61.i64[1] - v61.i64[0]) >> 4);
                unint64_t v21 = v20 + 1;
                if (v20 + 1 > 0x555555555555555) {
                  sub_25B3FBC4C();
                }
                if (0x5555555555555556 * ((uint64_t)&v62[-v61.i64[0]] >> 4) > v21) {
                  unint64_t v21 = 0x5555555555555556 * ((uint64_t)&v62[-v61.i64[0]] >> 4);
                }
                if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v62[-v61.i64[0]] >> 4) >= 0x2AAAAAAAAAAAAAALL) {
                  unint64_t v22 = 0x555555555555555;
                }
                else {
                  unint64_t v22 = v21;
                }
                unint64_t v79 = &v62;
                if (v22)
                {
                  if (v22 > 0x555555555555555) {
                    sub_25B3FA70C();
                  }
                  float v23 = (float32x2_t **)operator new(48 * v22);
                }
                else
                {
                  float v23 = 0;
                }
                float32x2_t v24 = &v23[6 * v20];
                unint64_t v76 = v23;
                v77.i64[0] = (uint64_t)v24;
                v77.i64[1] = (uint64_t)v24;
                unint64_t v78 = (char *)&v23[6 * v22];
                *float32x2_t v24 = v82;
                sub_25B4C9CE4((uint64_t)(v24 + 2), (uint64_t)&v83);
                uint64_t v25 = v77.i64[0];
                uint64_t v19 = v77.i64[1] + 48;
                v77.i64[1] += 48;
                int64x2_t v26 = v61;
                if (v61.i64[1] == v61.i64[0])
                {
                  int64x2_t v28 = vdupq_n_s64(v61.u64[1]);
                }
                else
                {
                  uint64_t v27 = 0;
                  do
                  {
                    *(_DWORD *)(v25 + v27 - 48) = *(_DWORD *)(v26.i64[1] + v27 - 48);
                    sub_25B4C9CE4(v25 + v27 - 40, v26.i64[1] + v27 - 40);
                    v27 -= 48;
                  }
                  while (v26.i64[1] + v27 != v26.i64[0]);
                  v25 += v27;
                  int64x2_t v28 = v61;
                  uint64_t v19 = v77.i64[1];
                }
                v61.i64[0] = v25;
                v61.i64[1] = v19;
                int64x2_t v77 = v28;
                unint64_t v29 = v62;
                uint64_t v62 = v78;
                unint64_t v78 = v29;
                unint64_t v76 = (float32x2_t **)v28.i64[0];
                sub_25B5E4F04((uint64_t)&v76);
              }
              else
              {
                *(_DWORD *)v61.i64[1] = v82;
                sub_25B4C9CE4(v18 + 8, (uint64_t)&v83);
                uint64_t v19 = v18 + 48;
              }
              v61.i64[1] = v19;
              sub_25B400248(v85);
            }
          }
          v8 += 5;
        }
        while (v8 != v9);
        unint64_t v31 = (int *)v61.i64[1];
        unint64_t v30 = (int *)v61.i64[0];
      }
      unint64_t v32 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * (((char *)v31 - (char *)v30) >> 4));
      if (v31 == v30) {
        uint64_t v33 = 0;
      }
      else {
        uint64_t v33 = v32;
      }
      sub_25B5E3FF8(v30, v31, v33, 1);
      int v34 = (float32x2_t *)v61.i64[1];
      for (int i = (float32x2_t *)v61.i64[0]; i != v34; i += 6)
      {
        uint64_t v36 = v66;
        uint64_t v37 = v67;
        if (v66 == v67)
        {
LABEL_45:
          sub_25B4C9CE4((uint64_t)v69, (uint64_t)&i[1]);
          char v40 = 1;
          goto LABEL_47;
        }
        uint64_t v38 = i + 1;
        while (1)
        {
          float32x2_t v39 = vsub_f32(*v36, *v38);
          if (fabsf(sqrtf(vaddv_f32(vmul_f32(v39, v39)))) >= 0.07
            && !sub_25B5DF12C((uint64_t)v36, (uint64_t)&i[1])
            && (sub_25B5DF12C((uint64_t)v36, (uint64_t)v71) && sub_25B40E2B8((float32x2_t)v6, *v36, v7, *v38)
             || sub_25B5DF12C((uint64_t)v36, (uint64_t)v72) && sub_25B40E2B8(v7, *v36, (float32x2_t)v6, *v38)))
          {
            break;
          }
          v36 += 5;
          if (v36 == v37) {
            goto LABEL_45;
          }
        }
      }
      char v40 = 0;
      v69[0].i8[0] = 0;
LABEL_47:
      char v70 = v40;
      char v82 = (float32x2_t **)&v61;
      sub_25B5E4A0C((void ***)&v82);
      char v82 = &v66;
      sub_25B4000E4((void ***)&v82);
      if (v70)
      {
        unint64_t v41 = (unint64_t)v73 + 1;
        unint64_t v42 = 0xCCCCCCCCCCCCCCCDLL * ((a1[1] - *a1) >> 3);
        if (v42 >= (unint64_t)v73 + 1 && v42 >= 3)
        {
          unint64_t v44 = v41 % v42;
          uint64_t v45 = v41 % v42 + 1 == v42 ? 0 : v44 + 1;
          BOOL v46 = sub_25B5DF12C((uint64_t)v69, *a1 + 40 * v44);
          uint64_t v47 = *a1;
          if (!v46
            || (BOOL v48 = sub_25B5DF12C((uint64_t)v69, v47 + 40 * v45), v47 = *a1, !v48)
            || vaddv_f32(vmul_f32(vsub_f32(*(float32x2_t *)(v47 + 40 * v44), v69[0]), vsub_f32(*(float32x2_t *)(v47 + 40 * v44), *(float32x2_t *)(v47 + 40 * v45)))) <= 0.00001)
          {
            unint64_t v49 = v44 + v42;
            unint64_t v50 = (v44 + v42 - 1) % v42;
            if (!sub_25B5DF12C((uint64_t)v69, v47 + 40 * v50)
              || (unint64_t v51 = (v49 - 2) % v42, !sub_25B5DF12C((uint64_t)v69, *a1 + 40 * v51))
              || vaddv_f32(vmul_f32(vsub_f32(*(float32x2_t *)(*a1 + 40 * v50), v69[0]), vsub_f32(*(float32x2_t *)(*a1 + 40 * v50), *(float32x2_t *)(*a1 + 40 * v51)))) <= 0.00001)
            {
              if (!v70) {
                sub_25B4704D8();
              }
              sub_25B4C9CE4((uint64_t)&v82, (uint64_t)v69);
              uint64_t v63 = 0;
              uint64_t v64 = 0;
              uint64_t v65 = 0;
              v61.i64[0] = (uint64_t)&v63;
              v61.i8[8] = 0;
              uint64_t v63 = (float32x2_t *)operator new(0x28uLL);
              uint64_t v64 = v63;
              uint64_t v65 = v63 + 5;
              unint64_t v80 = v63;
              char v81 = v63;
              unint64_t v76 = &v65;
              v77.i64[0] = (uint64_t)&v80;
              v77.i64[1] = (uint64_t)&v81;
              LOBYTE(v78) = 0;
              sub_25B4C9CE4((uint64_t)v63, (uint64_t)&v82);
              uint64_t v64 = v81 + 5;
              sub_25B400248(v84);
              sub_25B5E0584(&v63, a2);
              if (!v70) {
                sub_25B4704D8();
              }
              sub_25B5766FC(a1, *a1 + 40 * (void)v73 + 40, (unint64_t)v69);
              uint64_t v52 = v75;
              uint64_t v53 = v74 + 88 * v5;
              if (v53 + 88 != v75)
              {
                do
                {
                  uint64_t v54 = v53 + 88;
                  sub_25B5DFBF8(v53, v53 + 88);
                  uint64_t v53 = v54;
                }
                while (v54 + 88 != v52);
                uint64_t v53 = v54;
              }
              sub_25B5DF9F0((uint64_t)&v74, v53);
              sub_25B4C9CE4((uint64_t)&v76, (uint64_t)v71);
              sub_25B4C9CE4((uint64_t)&v61, (uint64_t)v72);
              unint64_t v55 = v73;
              char v81 = v73;
              if (!v70) {
                goto LABEL_82;
              }
              if (!sub_25B5DF12C((uint64_t)&v76, (uint64_t)v69))
              {
                if (!v70) {
                  sub_25B4704D8();
                }
                uint64_t v56 = v74;
                sub_25B5DFC70((uint64_t)&v82, (uint64_t)&v76, (uint64_t)v69, &v81);
                sub_25B5E4A94(&v74, v56 + 88 * v5, (uint64_t)&v82);
                sub_25B400248(v86);
                sub_25B400248(v84);
                unsigned int v5 = v58;
              }
              char v81 = (float32x2_t *)((char *)v55 + 1);
              if (!v70) {
LABEL_82:
              }
                sub_25B4704D8();
              if (!sub_25B5DF12C((uint64_t)&v61, (uint64_t)v69))
              {
                if (!v70) {
                  sub_25B4704D8();
                }
                uint64_t v57 = v74;
                sub_25B5DFC70((uint64_t)&v82, (uint64_t)v69, (uint64_t)&v61, &v81);
                sub_25B5E4A94(&v74, v57 + 88 * v5, (uint64_t)&v82);
                sub_25B400248(v86);
                sub_25B400248(v84);
                ++v5;
              }
              sub_25B400248(v62);
              sub_25B400248((char *)v77.i64[1]);
              char v82 = &v63;
              sub_25B4000E4((void ***)&v82);
            }
          }
        }
        if (v70) {
          sub_25B400248(*(char **)&v69[2]);
        }
      }
      sub_25B400248((char *)v72[2]);
      sub_25B400248((char *)v71[2]);
      int v4 = v5;
    }
    while ((int)v5 > 0);
  }
  v71[0] = (void **)&v74;
  sub_25B5DF0D8(v71);
}

void sub_25B5E3BAC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49)
{
}

void sub_25B5E3D34(uint64_t *a1)
{
  uint64_t v1 = a1[1];
  int v2 = -858993459 * ((unint64_t)(v1 - *a1) >> 3);
  if (v2 >= 4)
  {
    int v4 = 0;
    do
    {
      unsigned int v5 = (float32x2_t *)(*a1 + 40 * v4);
      float32x2_t v6 = vsub_f32(*(float32x2_t *)(*a1 + 40 * ((v2 - 1 + v4) % v2)), *v5);
      float32x2_t v7 = vsub_f32(*(float32x2_t *)(*a1 + 40 * ((v4 + 1) % v2)), *v5);
      float v8 = vaddv_f32(vmul_f32(v6, v7));
      int32x2_t v9 = (int32x2_t)vmul_f32(v6, v6);
      int32x2_t v10 = (int32x2_t)vmul_f32(v7, v7);
      float32x2_t v11 = vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(v9, v10), (float32x2_t)vzip2_s32(v9, v10)));
      float v12 = v8 / fmaxf(vmul_lane_f32(v11, v11, 1).f32[0], 1.1755e-38);
      if (v12 <= 1.0) {
        float v13 = v12;
      }
      else {
        float v13 = 1.0;
      }
      if (v12 >= -1.0) {
        float v14 = v13;
      }
      else {
        float v14 = -1.0;
      }
      float v15 = acosf(v14) * 180.0 / 3.14159274;
      if (v15 <= 2.5)
      {
        uint64_t v1 = sub_25B576C0C((uint64_t)&v5[5], v1, (uint64_t)v5);
        uint64_t v16 = a1[1];
        if (v16 != v1)
        {
          do
          {
            uint64_t v17 = v16 - 40;
            sub_25B400248(*(char **)(v16 - 24));
            uint64_t v16 = v17;
          }
          while (v17 != v1);
        }
        a1[1] = v1;
        if (v2-- < 5) {
          return;
        }
      }
      else
      {
        ++v4;
      }
    }
    while (v4 < v2);
    if (v2 >= 4)
    {
      int v19 = v2;
      do
      {
        unsigned int v20 = v19 - 1;
        int v21 = v2 - 1;
        unsigned int v22 = (v2 - 1 + v19 - 1) % v2;
        if (sub_25B5DF12C(*a1 + 40 * (v19 % v2), *a1 + 40 * v22))
        {
          uint64_t v23 = *a1;
          if (v2 == 4)
          {
            float32x2_t v24 = *(float32x2_t *)(v23 + 40 * v20);
            float32x2_t v25 = *(float32x2_t *)(v23 + 40 * (v19 % 4u));
            float32x2_t v26 = vsub_f32(v24, v25);
            int32x2_t v27 = (int32x2_t)vmul_f32(v26, v26);
            float32x2_t v28 = *(float32x2_t *)(v23 + 40 * v22);
            float32x2_t v29 = vsub_f32(v24, v28);
            int32x2_t v30 = (int32x2_t)vmul_f32(v29, v29);
            float32x2_t v31 = vadd_f32((float32x2_t)vzip1_s32(v27, v30), (float32x2_t)vzip2_s32(v27, v30));
            float32x2_t v32 = *(float32x2_t *)(v23 + 40 * (((_BYTE)v19 + 1) & 3));
            int32x2_t v33 = (int32x2_t)vsqrt_f32(v31);
            float32x2_t v34 = vsub_f32(v32, v25);
            int32x2_t v35 = (int32x2_t)vmul_f32(v34, v34);
            float32x2_t v36 = vsub_f32(v32, v28);
            int32x2_t v37 = (int32x2_t)vmul_f32(v36, v36);
            int32x2_t v38 = (int32x2_t)vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(v35, v37), (float32x2_t)vzip2_s32(v35, v37)));
            int32x2_t v39 = (int32x2_t)vadd_f32((float32x2_t)vzip1_s32(v33, v38), (float32x2_t)vzip2_s32(v33, v38));
            if (vcgt_f32((float32x2_t)v39, (float32x2_t)vdup_lane_s32(v39, 1)).u8[0]) {
              unsigned int v20 = ((_BYTE)v19 + 1) & 3;
            }
          }
          uint64_t v40 = sub_25B576C0C(v23 + 40 * v20 + 40, a1[1], v23 + 40 * v20);
          uint64_t v41 = a1[1];
          if (v41 != v40)
          {
            do
            {
              uint64_t v42 = v41 - 40;
              sub_25B400248(*(char **)(v41 - 24));
              uint64_t v41 = v42;
            }
            while (v42 != v40);
          }
          a1[1] = v40;
          int v19 = v21;
          int v2 = v21;
        }
        else
        {
          --v19;
        }
      }
      while (v2 >= 4 && v19 > 0);
    }
  }
}

void sub_25B5E3FF8(int *a1, int *a2, uint64_t a3, char a4)
{
void sub_25B5E4998(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char *a27)
{
}

void sub_25B5E4A0C(void ***a1)
{
  uint64_t v1 = *a1;
  int v2 = (char **)**a1;
  if (v2)
  {
    BOOL v4 = (char **)v1[1];
    char v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        float32x2_t v6 = v4 - 6;
        sub_25B400248(*(v4 - 3));
        BOOL v4 = v6;
      }
      while (v6 != v2);
      char v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void sub_25B5E4A94(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *a1;
  unint64_t v6 = a1[1];
  uint64_t v7 = a2 - *a1;
  uint64_t v8 = v7 / 88;
  uint64_t v9 = *a1 + 88 * (v7 / 88);
  uint64_t v11 = (uint64_t)(a1 + 2);
  unint64_t v10 = a1[2];
  if (v6 >= v10)
  {
    unint64_t v15 = 0x2E8BA2E8BA2E8BA3 * ((uint64_t)(v6 - v5) >> 3) + 1;
    if (v15 > 0x2E8BA2E8BA2E8BALL) {
      sub_25B3FBC4C();
    }
    unint64_t v17 = 0x2E8BA2E8BA2E8BA3 * ((uint64_t)(v10 - v5) >> 3);
    if (2 * v17 > v15) {
      unint64_t v15 = 2 * v17;
    }
    if (v17 >= 0x1745D1745D1745DLL) {
      unint64_t v18 = 0x2E8BA2E8BA2E8BALL;
    }
    else {
      unint64_t v18 = v15;
    }
    uint64_t v43 = v11;
    if (v18)
    {
      float v20 = (char *)sub_25B5DFD24(v18);
    }
    else
    {
      float v20 = 0;
      uint64_t v19 = 0;
    }
    uint64_t v21 = (uint64_t)&v20[88 * v8];
    uint64_t v40 = v20;
    *(void *)&long long v41 = v21;
    *((void *)&v41 + 1) = v21;
    uint64_t v42 = &v20[88 * v19];
    if (v8 == v19)
    {
      if (v7 < 1)
      {
        if (v5 == a2) {
          unint64_t v24 = 1;
        }
        else {
          unint64_t v24 = 2 * v8;
        }
        uint64_t v47 = v11;
        float v25 = (char *)sub_25B5DFD24(v24);
        uint64_t v26 = (uint64_t)&v25[88 * (v24 >> 2)];
        int64_t v44 = v25;
        v45.i64[0] = v26;
        float32x2_t v28 = &v25[88 * v27];
        v45.i64[1] = v26;
        int64_t v46 = v28;
        uint64_t v29 = v41;
        if (*((void *)&v41 + 1) == (void)v41)
        {
          int64x2_t v33 = vdupq_n_s64(v41);
          uint64_t v31 = v26;
        }
        else
        {
          uint64_t v30 = (*((void *)&v41 + 1) - (void)v41) / 88;
          uint64_t v31 = v26 + 88 * v30;
          uint64_t v32 = 88 * v30;
          do
          {
            sub_25B5DFCD0(v26, v29);
            v26 += 88;
            v29 += 88;
            v32 -= 88;
          }
          while (v32);
          float v25 = v44;
          uint64_t v26 = v45.i64[0];
          int64x2_t v33 = (int64x2_t)v41;
          float32x2_t v28 = v46;
        }
        float32x2_t v34 = v42;
        int64_t v44 = v40;
        uint64_t v40 = v25;
        *(void *)&long long v41 = v26;
        int64x2_t v45 = v33;
        *((void *)&v41 + 1) = v31;
        uint64_t v42 = v28;
        int64_t v46 = v34;
        sub_25B5DFD70((uint64_t)&v44);
        uint64_t v21 = v31;
      }
      else
      {
        uint64_t v22 = v8 + 2;
        if (v8 >= -1) {
          uint64_t v22 = v8 + 1;
        }
        v21 -= 88 * (v22 >> 1);
        *(void *)&long long v41 = v21;
        *((void *)&v41 + 1) = v21;
      }
    }
    sub_25B5DFCD0(v21, a3);
    *((void *)&v41 + 1) += 88;
    *(void *)&long long v41 = sub_25B5DFDD4(v11, v9, v9, *a1, *a1, v41, v41);
    uint64_t v35 = a1[1];
    uint64_t v36 = *((void *)&v41 + 1);
    uint64_t v48 = *((void *)&v41 + 1);
    uint64_t v49 = *((void *)&v41 + 1);
    int64_t v44 = (char *)v11;
    v45.i64[0] = (uint64_t)&v48;
    v45.i64[1] = (uint64_t)&v49;
    LOBYTE(v46) = 0;
    while (v9 != v35)
    {
      sub_25B5DFE80(v36, v9);
      v9 += 88;
      uint64_t v36 = v49 + 88;
      v49 += 88;
    }
    LOBYTE(v46) = 1;
    sub_25B5E4E9C((uint64_t)&v44);
    long long v37 = *(_OWORD *)a1;
    uint64_t v38 = (uint64_t)v42;
    *a1 = v41;
    a1[1] = v36;
    long long v41 = v37;
    uint64_t v39 = a1[2];
    a1[2] = v38;
    uint64_t v42 = (char *)v39;
    uint64_t v40 = (char *)v37;
    sub_25B5DFD70((uint64_t)&v40);
  }
  else if (v9 == v6)
  {
    sub_25B5DFCD0(*a1 + 88 * (v7 / 88), a3);
    a1[1] = v9 + 88;
  }
  else
  {
    uint64_t v12 = v6 - 88;
    if (v6 < 0x58)
    {
      uint64_t v14 = a1[1];
    }
    else
    {
      unint64_t v13 = v6 - 88;
      uint64_t v14 = a1[1];
      do
      {
        sub_25B5DFCD0(v14, v13);
        v13 += 88;
        v14 += 88;
      }
      while (v13 < v6);
    }
    a1[1] = v14;
    if (v6 != v9 + 88)
    {
      uint64_t v23 = 8 * ((uint64_t)(v6 - (v9 + 88)) >> 3);
      do
      {
        sub_25B5DFBF8(v12, v5 + 88 * v8 - 88 + v23);
        v12 -= 88;
        v23 -= 88;
      }
      while (v23);
    }
    sub_25B5DFBF8(v9, a3);
  }
}

void sub_25B5E4E4C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16)
{
  *(void *)(v16 + 8) = v17;
  _Unwind_Resume(exception_object);
}

uint64_t sub_25B5E4E9C(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24))
  {
    uint64_t v3 = *(uint64_t **)(a1 + 8);
    int v2 = *(uint64_t **)(a1 + 16);
    uint64_t v4 = *v2;
    for (uint64_t i = *v3; v4 != i; v4 -= 88)
    {
      sub_25B400248(*(char **)(v4 - 32));
      sub_25B400248(*(char **)(v4 - 72));
    }
  }
  return a1;
}

uint64_t sub_25B5E4F04(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 48;
    sub_25B400248(*(char **)(i - 24));
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_25B5E4F58(int *a1, int *a2)
{
  int v2 = *a1;
  *a1 = *a2;
  uint64_t v3 = (uint64_t)(a1 + 2);
  *a2 = v2;
  uint64_t v4 = (uint64_t)(a2 + 2);
  sub_25B4C9CE4((uint64_t)v9, (uint64_t)(a1 + 2));
  sub_25B576A98((uint64_t)v7, v3, v4);
  sub_25B400248(v8);
  sub_25B576A98((uint64_t)v5, v4, (uint64_t)v9);
  sub_25B400248(v6);
  sub_25B400248(v10);
}

void sub_25B5E4FD8(_Unwind_Exception *a1)
{
  sub_25B400248(*(char **)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_25B5E4FEC(int *a1, int *a2, int *a3)
{
  uint64_t v5 = (float *)a1;
  float v6 = *(float *)a2;
  float v7 = *(float *)a3;
  if (*(float *)a2 >= *(float *)a1)
  {
    if (v7 >= v6) {
      return;
    }
    sub_25B5E4F58(a2, a3);
    if (*(float *)a2 >= *v5) {
      return;
    }
    a1 = (int *)v5;
    uint64_t v8 = a2;
  }
  else
  {
    if (v7 >= v6)
    {
      sub_25B5E4F58(a1, a2);
      if (*(float *)a3 >= *(float *)a2) {
        return;
      }
      a1 = a2;
    }
    uint64_t v8 = a3;
  }

  sub_25B5E4F58(a1, v8);
}

void sub_25B5E50AC(int *a1, int *a2, int *a3, int *a4)
{
  sub_25B5E4FEC(a1, a2, a3);
  if (*(float *)a4 < *(float *)a3)
  {
    sub_25B5E4F58(a3, a4);
    if (*(float *)a3 < *(float *)a2)
    {
      sub_25B5E4F58(a2, a3);
      if (*(float *)a2 < *(float *)a1)
      {
        sub_25B5E4F58(a1, a2);
      }
    }
  }
}

uint64_t sub_25B5E5154(int *a1, int *a2)
{
  BOOL v4 = 1;
  switch(0xAAAAAAAAAAAAAAABLL * (((char *)a2 - (char *)a1) >> 4))
  {
    case 0uLL:
    case 1uLL:
      return v4;
    case 2uLL:
      if (*((float *)a2 - 12) < *(float *)a1) {
        sub_25B5E4F58(a1, a2 - 12);
      }
      return v4;
    case 3uLL:
      sub_25B5E4FEC(a1, a1 + 12, a2 - 12);
      return v4;
    case 4uLL:
      sub_25B5E50AC(a1, a1 + 12, a1 + 24, a2 - 12);
      return v4;
    case 5uLL:
      uint64_t v14 = (float *)(a1 + 12);
      unint64_t v15 = (float *)(a1 + 24);
      uint64_t v16 = (float *)(a1 + 36);
      sub_25B5E50AC(a1, a1 + 12, a1 + 24, a1 + 36);
      float v18 = *((float *)a2 - 12);
      uint64_t v17 = a2 - 12;
      if (v18 < *((float *)a1 + 36))
      {
        sub_25B5E4F58(a1 + 36, v17);
        if (*v16 < *v15)
        {
          sub_25B5E4F58(a1 + 24, a1 + 36);
          if (*v15 < *v14)
          {
            sub_25B5E4F58(a1 + 12, a1 + 24);
            if (*((float *)a1 + 12) < *(float *)a1) {
              sub_25B5E4F58(a1, a1 + 12);
            }
          }
        }
      }
      return 1;
    default:
      uint64_t v5 = (float *)(a1 + 24);
      sub_25B5E4FEC(a1, a1 + 12, a1 + 24);
      float v6 = (float *)(a1 + 36);
      if (a1 + 36 == a2) {
        return 1;
      }
      uint64_t v7 = 0;
      int v8 = 0;
      break;
  }
  while (*v6 >= *v5)
  {
LABEL_14:
    uint64_t v5 = v6;
    v7 += 48;
    v6 += 12;
    if (v6 == (float *)a2) {
      return 1;
    }
  }
  float v20 = *v6;
  sub_25B4C9CE4((uint64_t)v21, (uint64_t)(v6 + 2));
  float v9 = *v5;
  uint64_t v10 = v7;
  while (1)
  {
    *(float *)((char *)a1 + v10 + 144) = v9;
    sub_25B576A98((uint64_t)v23, (uint64_t)a1 + v10 + 152, (uint64_t)a1 + v10 + 104);
    sub_25B400248(v24);
    if (v10 == -96) {
      break;
    }
    uint64_t v11 = (char *)a1 + v10;
    float v9 = *(float *)((char *)a1 + v10 + 48);
    v10 -= 48;
    if (v20 >= v9)
    {
      uint64_t v12 = (float *)((char *)a1 + v10 + 144);
      uint64_t v13 = (uint64_t)(v11 + 104);
      goto LABEL_12;
    }
  }
  uint64_t v13 = (uint64_t)(a1 + 2);
  uint64_t v12 = (float *)a1;
LABEL_12:
  float *v12 = v20;
  sub_25B576A98((uint64_t)v23, v13, (uint64_t)v21);
  sub_25B400248(v24);
  if (++v8 != 8)
  {
    sub_25B400248(v22);
    goto LABEL_14;
  }
  BOOL v4 = v6 + 12 == (float *)a2;
  sub_25B400248(v22);
  return v4;
}

void sub_25B5E53D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char *a13)
{
}

void sub_25B5E5400(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, int a6)
{
  unint64_t v10 = 0xCCCCCCCCCCCCCCCDLL * ((a5 - a4) >> 3);
  v86[0] = 0;
  v86[1] = 0;
  uint64_t v85 = v86;
  uint64_t v11 = v10 - 1;
  if (!a6) {
    uint64_t v11 = 2;
  }
  sub_25B4C9CE4((uint64_t)v84, a4 + 40 * ((v11 + *(void *)(a2 + 80)) % v10));
  uint64_t v12 = 40;
  if (a6) {
    uint64_t v12 = 0;
  }
  sub_25B4C9CE4((uint64_t)v83, a2 + v12);
  uint64_t v13 = 40;
  if (!a6) {
    uint64_t v13 = 0;
  }
  sub_25B4C9CE4((uint64_t)v82, a2 + v13);
  unint64_t v14 = a3[2];
  unint64_t v15 = a3[1];
  if (v15 >= v14)
  {
    unint64_t v17 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v15 - *a3) >> 3);
    if (v17 + 1 > 0x666666666666666) {
      sub_25B3FBC4C();
    }
    unint64_t v18 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v14 - *a3) >> 3);
    uint64_t v19 = 2 * v18;
    if (2 * v18 <= v17 + 1) {
      uint64_t v19 = v17 + 1;
    }
    if (v18 >= 0x333333333333333) {
      unint64_t v20 = 0x666666666666666;
    }
    else {
      unint64_t v20 = v19;
    }
    unint64_t v80 = a3 + 2;
    if (v20) {
      unint64_t v20 = (unint64_t)sub_25B460930(v20);
    }
    else {
      uint64_t v21 = 0;
    }
    unint64_t v76 = v20;
    uint64_t v77 = (char *)(v20 + 40 * v17);
    uint64_t v78 = v77;
    unint64_t v79 = (char *)(v20 + 40 * v21);
    sub_25B4C9CE4((uint64_t)v77, (uint64_t)v82);
    uint64_t v78 = v77 + 40;
    sub_25B4C9EFC(a3, &v76);
    uint64_t v16 = a3[1];
    sub_25B4C9F74((uint64_t)&v76);
  }
  else
  {
    sub_25B4C9CE4(a3[1], (uint64_t)v82);
    uint64_t v16 = v15 + 40;
    a3[1] = v16;
  }
  a3[1] = v16;
  a1[1] = 0;
  a1[2] = 0;
  *a1 = 0;
  unint64_t v76 = 0xCCCCCCCCCCCCCCCDLL * ((v16 - *a3) >> 3);
  sub_25B4C9CE4((uint64_t)&v77, (uint64_t)v83);
  uint64_t v22 = (unint64_t *)a1[1];
  if ((unint64_t)v22 >= a1[2])
  {
    uint64_t v23 = sub_25B5EA0E0(a1, &v76);
  }
  else
  {
    unint64_t *v22 = v76;
    sub_25B4C9CE4((uint64_t)(v22 + 1), (uint64_t)&v77);
    uint64_t v23 = (uint64_t)(v22 + 6);
    a1[1] = (uint64_t)(v22 + 6);
  }
  a1[1] = v23;
  sub_25B400248(v79);
  while (2)
  {
    float32x2_t v24 = vsub_f32(v83[0], v82[0]);
    if (fabsf(sqrtf(vaddv_f32(vmul_f32(v24, v24)))) >= 0.07)
    {
      sub_25B5E623C(v75, v83, v84, a3, a6);
      float v25 = (unint64_t *)v75[0];
      uint64_t v26 = v75[1];
      while (v25 != (unint64_t *)v26)
      {
        unint64_t v76 = *v25;
        sub_25B4C9CE4((uint64_t)&v77, (uint64_t)(v25 + 1));
        uint64_t v27 = v86[0];
        if (!v86[0]) {
          goto LABEL_54;
        }
        float32x2_t v28 = v86;
        do
        {
          uint64_t v29 = v27;
          uint64_t v30 = v28;
          unint64_t v31 = v27[4];
          uint64_t v32 = v27 + 1;
          if (v31 >= v76)
          {
            uint64_t v32 = v29;
            float32x2_t v28 = (void **)v29;
          }
          uint64_t v27 = (void *)*v32;
        }
        while (v27);
        if (v28 == v86) {
          goto LABEL_54;
        }
        if (v31 < v76) {
          uint64_t v29 = v30;
        }
        if (v76 < v29[4])
        {
LABEL_54:
          unint64_t v51 = (unint64_t *)a1[1];
          unint64_t v50 = a1[2];
          if ((unint64_t)v51 >= v50)
          {
            unint64_t v54 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v51 - *a1) >> 4);
            unint64_t v55 = v54 + 1;
            if (v54 + 1 > 0x555555555555555) {
              sub_25B3FBC4C();
            }
            unint64_t v56 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v50 - *a1) >> 4);
            if (2 * v56 > v55) {
              unint64_t v55 = 2 * v56;
            }
            if (v56 >= 0x2AAAAAAAAAAAAAALL) {
              unint64_t v57 = 0x555555555555555;
            }
            else {
              unint64_t v57 = v55;
            }
            uint64_t v70 = a1 + 2;
            if (v57) {
              unint64_t v57 = (unint64_t)sub_25B467D14(v57);
            }
            else {
              uint64_t v58 = 0;
            }
            uint64_t v59 = (unint64_t *)(v57 + 48 * v54);
            unint64_t v66 = v57;
            uint64_t v67 = v59;
            float v68 = v59;
            uint64_t v69 = (char *)(v57 + 48 * v58);
            unint64_t *v59 = v76;
            sub_25B4C9CE4((uint64_t)(v59 + 1), (uint64_t)&v77);
            v68 += 6;
            sub_25B5EA1EC(a1, &v66);
            uint64_t v52 = (void *)a1[1];
            sub_25B5E4F04((uint64_t)&v66);
          }
          else
          {
            *unint64_t v51 = v76;
            sub_25B4C9CE4((uint64_t)(v51 + 1), (uint64_t)&v77);
            uint64_t v52 = v51 + 6;
            a1[1] = (uint64_t)v52;
          }
          a1[1] = (uint64_t)v52;
          sub_25B576A98((uint64_t)v73, (uint64_t)v84, (uint64_t)v83);
          sub_25B400248(v74);
          sub_25B576A98((uint64_t)v71, (uint64_t)v83, (uint64_t)&v77);
          sub_25B400248(v72);
          sub_25B5E6184((uint64_t *)&v85, v76, v76);
          uint64_t v53 = v79;
LABEL_71:
          sub_25B400248(v53);
          goto LABEL_72;
        }
        sub_25B400248(v79);
        v25 += 6;
      }
      LOBYTE(v76) = 0;
      char v81 = 0;
      uint64_t v34 = *a3;
      uint64_t v33 = a3[1];
      if (v33 != *a3)
      {
        unint64_t v35 = 0;
        unint64_t v36 = 0;
        unint64_t v37 = 0;
        float v38 = INFINITY;
        do
        {
          uint64_t v39 = v86[0];
          if (!v86[0]) {
            goto LABEL_47;
          }
          uint64_t v40 = v86;
          do
          {
            long long v41 = v39;
            uint64_t v42 = v40;
            unint64_t v43 = v39[4];
            int64_t v44 = v39 + 1;
            if (v43 >= v37)
            {
              int64_t v44 = v41;
              uint64_t v40 = (void **)v41;
            }
            uint64_t v39 = (void *)*v44;
          }
          while (v39);
          if (v40 == v86) {
            goto LABEL_47;
          }
          if (v43 < v37) {
            long long v41 = v42;
          }
          if (v37 < v41[4])
          {
LABEL_47:
            int64x2_t v45 = (float32x2_t *)(v34 + 40 * v37);
            float32x2_t v46 = vsub_f32(v83[0], *v45);
            float v47 = sqrtf(vaddv_f32(vmul_f32(v46, v46)));
            if (v47 < v38)
            {
              sub_25B5E5B90((uint64_t)&v76, (uint64_t)v45);
              uint64_t v34 = *a3;
              uint64_t v33 = a3[1];
              unint64_t v35 = v37;
              unint64_t v36 = v37;
              float v38 = v47;
            }
          }
          ++v37;
        }
        while (v37 < 0xCCCCCCCCCCCCCCCDLL * ((v33 - v34) >> 3));
        if (v38 < 0.65)
        {
          if (!v81) {
            sub_25B4704D8();
          }
          unint64_t v66 = v36;
          sub_25B4C9CE4((uint64_t)&v67, (uint64_t)&v76);
          uint64_t v48 = (unint64_t *)a1[1];
          if ((unint64_t)v48 >= a1[2])
          {
            uint64_t v49 = sub_25B5EA0E0(a1, &v66);
          }
          else
          {
            unint64_t *v48 = v66;
            sub_25B4C9CE4((uint64_t)(v48 + 1), (uint64_t)&v67);
            uint64_t v49 = (uint64_t)(v48 + 6);
            a1[1] = (uint64_t)(v48 + 6);
          }
          a1[1] = v49;
          sub_25B400248(v69);
          sub_25B576A98((uint64_t)v64, (uint64_t)v84, (uint64_t)v83);
          sub_25B400248(v65);
          if (!v81) {
            sub_25B4704D8();
          }
          sub_25B576A98((uint64_t)v62, (uint64_t)v83, (uint64_t)&v76);
          sub_25B400248(v63);
          sub_25B5E6184((uint64_t *)&v85, v35, v35);
          if (v81)
          {
            uint64_t v53 = v78;
            goto LABEL_71;
          }
LABEL_72:
          unint64_t v76 = (unint64_t)v75;
          sub_25B5E4A0C((void ***)&v76);
          continue;
        }
        if (v81) {
          sub_25B400248(v78);
        }
      }
      unint64_t v76 = (unint64_t)v75;
      sub_25B5E4A0C((void ***)&v76);
    }
    break;
  }
  uint64_t v60 = a3[1];
  uint64_t v61 = v60 - 40;
  sub_25B400248(*(char **)(v60 - 24));
  a3[1] = v61;
  sub_25B400248(*(char **)&v82[2]);
  sub_25B400248(*(char **)&v83[2]);
  sub_25B400248(*(char **)&v84[2]);
  sub_25B3FA930(v86[0]);
}

void sub_25B5E5A74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,void **a40,uint64_t a41,uint64_t a42,char *a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,char *a48)
{
  sub_25B400248(a43);
  sub_25B5E4A0C(&a40);
  sub_25B400248(a48);
  sub_25B400248(*(char **)(v48 - 208));
  sub_25B400248(*(char **)(v48 - 168));
  sub_25B3FA930(*(void **)(v48 - 136));
  _Unwind_Resume(a1);
}

uint64_t sub_25B5E5B90(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 40))
  {
    sub_25B576A98((uint64_t)v4, a1, a2);
    sub_25B400248(v5);
  }
  else
  {
    sub_25B4C9CE4(a1, a2);
    *(unsigned char *)(a1 + 40) = 1;
  }
  return a1;
}

uint64_t sub_25B5E5BF4(void *a1, void *a2)
{
  uint64_t v4 = a1[2];
  uint64_t v5 = a1[1];
  uint64_t v6 = 85 * ((v4 - v5) >> 3) - 1;
  if (v4 == v5) {
    uint64_t v6 = 0;
  }
  unint64_t v7 = a1[5] + a1[4];
  if (v6 == v7)
  {
    sub_25B5EC340(a1);
    uint64_t v5 = a1[1];
    unint64_t v7 = a1[5] + a1[4];
  }
  int v8 = (void *)(*(void *)(v5 + 8 * (v7 / 0x55)) + 48 * (v7 % 0x55));
  *int v8 = *a2;
  uint64_t result = sub_25B4C9CE4((uint64_t)(v8 + 1), (uint64_t)(a2 + 1));
  ++a1[5];
  return result;
}

void sub_25B5E5CA4(void *a1)
{
  unint64_t v2 = a1[5] + a1[4] - 1;
  sub_25B400248(*(char **)(*(void *)(a1[1] + 8 * (v2 / 0x55)) + 48 * (v2 % 0x55) + 24));
  --a1[5];

  sub_25B5EC2CC(a1, 1);
}

uint64_t sub_25B5E5D24(void *a1)
{
  unint64_t v2 = (void **)a1[1];
  uint64_t v3 = (void **)a1[2];
  if (v3 == v2)
  {
    uint64_t v4 = a1 + 5;
    uint64_t v3 = (void **)a1[1];
  }
  else
  {
    uint64_t v4 = a1 + 5;
    unint64_t v5 = a1[4];
    uint64_t v6 = &v2[v5 / 0x55];
    unint64_t v7 = (unint64_t)*v6 + 48 * (v5 % 0x55);
    unint64_t v8 = (unint64_t)v2[(a1[5] + v5) / 0x55] + 48 * ((a1[5] + v5) % 0x55);
    if (v7 != v8)
    {
      do
      {
        sub_25B400248(*(char **)(v7 + 24));
        v7 += 48;
        if (v7 - (void)*v6 == 4080)
        {
          unint64_t v9 = (unint64_t)v6[1];
          ++v6;
          unint64_t v7 = v9;
        }
      }
      while (v7 != v8);
      unint64_t v2 = (void **)a1[1];
      uint64_t v3 = (void **)a1[2];
    }
  }
  void *v4 = 0;
  unint64_t v10 = (char *)v3 - (char *)v2;
  if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
  {
    do
    {
      operator delete(*v2);
      uint64_t v3 = (void **)a1[2];
      unint64_t v2 = (void **)(a1[1] + 8);
      a1[1] = v2;
      unint64_t v10 = (char *)v3 - (char *)v2;
    }
    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }
  unint64_t v11 = v10 >> 3;
  if (v11 == 1)
  {
    uint64_t v12 = 42;
  }
  else
  {
    if (v11 != 2) {
      goto LABEL_16;
    }
    uint64_t v12 = 85;
  }
  a1[4] = v12;
LABEL_16:
  while (v2 != v3)
  {
    uint64_t v13 = *v2++;
    operator delete(v13);
  }

  return sub_25B468738((uint64_t)a1);
}

double sub_25B5E5E70(void *a1, uint64_t a2)
{
  unint64_t v5 = (void **)a1[1];
  uint64_t v4 = a1[2];
  if ((void **)v4 == v5)
  {
    uint64_t v6 = a1 + 5;
    uint64_t v4 = a1[1];
  }
  else
  {
    uint64_t v6 = a1 + 5;
    unint64_t v7 = a1[4];
    unint64_t v8 = &v5[v7 / 0x55];
    unint64_t v9 = (unint64_t)*v8 + 48 * (v7 % 0x55);
    unint64_t v10 = (unint64_t)v5[(a1[5] + v7) / 0x55] + 48 * ((a1[5] + v7) % 0x55);
    if (v9 != v10)
    {
      do
      {
        sub_25B400248(*(char **)(v9 + 24));
        v9 += 48;
        if (v9 - (void)*v8 == 4080)
        {
          unint64_t v11 = (unint64_t)v8[1];
          ++v8;
          unint64_t v9 = v11;
        }
      }
      while (v9 != v10);
      unint64_t v5 = (void **)a1[1];
      uint64_t v4 = a1[2];
    }
  }
  void *v6 = 0;
  unint64_t v12 = v4 - (void)v5;
  if ((unint64_t)(v4 - (void)v5) >= 0x11)
  {
    do
    {
      operator delete(*v5);
      uint64_t v4 = a1[2];
      unint64_t v5 = (void **)(a1[1] + 8);
      a1[1] = v5;
      unint64_t v12 = v4 - (void)v5;
    }
    while ((unint64_t)(v4 - (void)v5) > 0x10);
  }
  unint64_t v13 = v12 >> 3;
  if (v13 == 1)
  {
    uint64_t v14 = 42;
  }
  else
  {
    if (v13 != 2) {
      goto LABEL_15;
    }
    uint64_t v14 = 85;
  }
  a1[4] = v14;
LABEL_15:
  if (a1[5])
  {
    sub_25B5EC270((uint64_t)a1, 0);
    sub_25B5EC2CC(a1, 0);
  }
  else
  {
    while ((void **)v4 != v5)
    {
      operator delete(*(void **)(v4 - 8));
      unint64_t v5 = (void **)a1[1];
      uint64_t v4 = a1[2] - 8;
      a1[2] = v4;
    }
    a1[4] = 0;
  }
  sub_25B5EC1A0((void **)a1);
  uint64_t v16 = a1[1];
  uint64_t v15 = a1[2];
  if (v15 != v16) {
    a1[2] = v15 + ((v16 - v15 + 7) & 0xFFFFFFFFFFFFFFF8);
  }
  sub_25B5EC1A0((void **)a1);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  a1[2] = *(void *)(a2 + 16);
  uint64_t v17 = *(void *)(a2 + 32);
  a1[3] = *(void *)(a2 + 24);
  double result = 0.0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  a1[4] = v17;
  a1[5] = *(void *)(a2 + 40);
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = 0;
  return result;
}

void *sub_25B5E6034(void *a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  a1[3] = 0;
  a1[4] = 0;
  a1[2] = a1 + 3;
  a1[6] = 0;
  a1[7] = 0;
  sub_25B576A98((uint64_t)v11, (uint64_t)(a1 + 1), a2);
  sub_25B400248(v12);
  *a1 = a3;
  uint64_t v8 = *a4;
  uint64_t v7 = a4[1];
  if (v7) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 8), 1uLL, memory_order_relaxed);
  }
  unint64_t v9 = (std::__shared_weak_count *)a1[7];
  a1[6] = v8;
  a1[7] = v7;
  if (v9) {
    sub_25B404120(v9);
  }
  return a1;
}

void sub_25B5E60C0(_Unwind_Exception *a1)
{
  uint64_t v4 = *(std::__shared_weak_count **)(v1 + 56);
  if (v4) {
    sub_25B404120(v4);
  }
  sub_25B400248(*v2);
  _Unwind_Resume(a1);
}

int64x2_t sub_25B5E60E0(uint64_t a1, void *a2)
{
  unint64_t v4 = *(void *)(a1 + 32);
  if (!v4)
  {
    sub_25B5E6B88((char **)a1);
    unint64_t v4 = *(void *)(a1 + 32);
  }
  uint64_t v5 = *(void *)(a1 + 8);
  uint64_t v6 = (void *)(v5 + 8 * (v4 / 0x55));
  uint64_t v7 = *v6 + 48 * (v4 % 0x55);
  if (*(void *)(a1 + 16) == v5) {
    uint64_t v7 = 0;
  }
  if (v7 == *v6) {
    uint64_t v7 = *(v6 - 1) + 4080;
  }
  *(void *)(v7 - 48) = *a2;
  sub_25B4C9CE4(v7 - 40, (uint64_t)(a2 + 1));
  int64x2_t result = vaddq_s64(*(int64x2_t *)(a1 + 32), (int64x2_t)xmmword_25B5F1300);
  *(int64x2_t *)(a1 + 32) = result;
  return result;
}

uint64_t *sub_25B5E6184(uint64_t *result, unint64_t a2, uint64_t a3)
{
  unint64_t v4 = result;
  uint64_t v6 = (uint64_t **)(result + 1);
  uint64_t v5 = (uint64_t *)result[1];
  if (v5)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v7 = (uint64_t **)v5;
        unint64_t v8 = v5[4];
        if (v8 <= a2) {
          break;
        }
        uint64_t v5 = *v7;
        uint64_t v6 = v7;
        if (!*v7) {
          goto LABEL_9;
        }
      }
      if (v8 >= a2) {
        break;
      }
      uint64_t v5 = v7[1];
      if (!v5)
      {
        uint64_t v6 = v7 + 1;
        goto LABEL_9;
      }
    }
  }
  else
  {
    uint64_t v7 = (uint64_t **)(result + 1);
LABEL_9:
    unint64_t v9 = (uint64_t *)operator new(0x28uLL);
    v9[4] = a3;
    *unint64_t v9 = 0;
    v9[1] = 0;
    v9[2] = (uint64_t)v7;
    void *v6 = v9;
    uint64_t v10 = *(void *)*v4;
    if (v10)
    {
      uint64_t *v4 = v10;
      unint64_t v11 = *v6;
    }
    else
    {
      unint64_t v11 = v9;
    }
    int64x2_t result = sub_25B3FA798((uint64_t *)v4[1], v11);
    ++v4[2];
  }
  return result;
}

void sub_25B5E623C(uint64_t *a1, float32x2_t *a2, float32x2_t *a3, uint64_t *a4, char a5)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  float32x2_t v7 = vsub_f32(*a3, *a2);
  float64x2_t v35 = vcvtq_f64_f32(v7);
  uint64_t v8 = *a4;
  if (a4[1] == *a4)
  {
    uint64_t v26 = 0;
    float v25 = 0;
  }
  else
  {
    char v29 = a5;
    uint64_t v11 = 0;
    unint64_t v12 = 0;
    int32x2_t v13 = (int32x2_t)vmul_f32(v7, v7);
    do
    {
      sub_25B4C9CE4((uint64_t)v34, v8 + v11);
      if (sub_25B5DF12C((uint64_t)a2, (uint64_t)v34))
      {
        float32x2_t v14 = vsub_f32(*a2, v34[0]);
        if (fabsf(sqrtf(vaddv_f32(vmul_f32(v14, v14)))) >= 0.07)
        {
          float32x2_t v15 = vsub_f32(v34[0], *a2);
          float v16 = vaddv_f32(vmul_f32(v7, v15));
          int32x2_t v17 = (int32x2_t)vmul_f32(v15, v15);
          float32x2_t v18 = vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(v13, v17), (float32x2_t)vzip2_s32(v13, v17)));
          float v19 = v16 / fmaxf(vmul_lane_f32(v18, v18, 1).f32[0], 1.1755e-38);
          float v20 = v19 <= 1.0 ? v19 : 1.0;
          float v21 = v19 >= -1.0 ? v20 : -1.0;
          float v22 = acosf(v21) * 180.0 / 3.14159274;
          if (v22 > 15.0 || !sub_25B5DF12C((uint64_t)a2, (uint64_t)a3) || sub_25B5DF12C((uint64_t)a3, (uint64_t)v34))
          {
            unint64_t v32 = v12;
            sub_25B4C9CE4((uint64_t)v33, (uint64_t)v34);
            uint64_t v23 = (unint64_t *)a1[1];
            if ((unint64_t)v23 >= a1[2])
            {
              uint64_t v24 = sub_25B5EA0E0(a1, &v32);
            }
            else
            {
              unint64_t *v23 = v32;
              sub_25B4C9CE4((uint64_t)(v23 + 1), (uint64_t)v33);
              uint64_t v24 = (uint64_t)(v23 + 6);
              a1[1] = (uint64_t)(v23 + 6);
            }
            a1[1] = v24;
            sub_25B400248(v33[2]);
          }
        }
      }
      sub_25B400248(*(char **)&v34[2]);
      ++v12;
      uint64_t v8 = *a4;
      v11 += 40;
    }
    while (v12 < 0xCCCCCCCCCCCCCCCDLL * ((a4[1] - *a4) >> 3));
    float v25 = (uint64_t *)*a1;
    uint64_t v26 = (uint64_t *)a1[1];
    a5 = v29;
  }
  unint64_t v27 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * (((char *)v26 - (char *)v25) >> 4));
  v30[0] = &v35;
  v30[1] = (float64x2_t *)a2;
  v30[2] = (float64x2_t *)a2;
  char v31 = a5;
  if (v26 == v25) {
    uint64_t v28 = 0;
  }
  else {
    uint64_t v28 = v27;
  }
  sub_25B5E7378(v25, v26, v30, v28, 1);
}

void sub_25B5E64B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  sub_25B5E4A0C((void ***)va);
  _Unwind_Resume(a1);
}

uint64_t sub_25B5E6500(uint64_t a1)
{
  unint64_t v2 = *(std::__shared_weak_count **)(a1 + 56);
  if (v2) {
    sub_25B404120(v2);
  }
  sub_25B400248(*(char **)(a1 + 24));
  return a1;
}

uint64_t sub_25B5E6538(uint64_t a1)
{
  unint64_t v2 = *(void ***)(a1 + 8);
  uint64_t v3 = *(void ***)(a1 + 16);
  if (v3 == v2)
  {
    unint64_t v4 = (void *)(a1 + 40);
    uint64_t v3 = *(void ***)(a1 + 8);
  }
  else
  {
    unint64_t v4 = (void *)(a1 + 40);
    unint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = &v2[v5 >> 6];
    uint64_t v7 = (uint64_t)*v6 + 64 * (v5 & 0x3F);
    uint64_t v8 = *(uint64_t *)((char *)v2 + (((*(void *)(a1 + 40) + v5) >> 3) & 0x1FFFFFFFFFFFFFF8))
       + 64 * ((*(void *)(a1 + 40) + v5) & 0x3F);
    if (v7 != v8)
    {
      do
      {
        sub_25B5E6E48(v7);
        v7 += 64;
        if (v7 - (void)*v6 == 4096)
        {
          uint64_t v9 = (uint64_t)v6[1];
          ++v6;
          uint64_t v7 = v9;
        }
      }
      while (v7 != v8);
      unint64_t v2 = *(void ***)(a1 + 8);
      uint64_t v3 = *(void ***)(a1 + 16);
    }
  }
  void *v4 = 0;
  unint64_t v10 = (char *)v3 - (char *)v2;
  if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
  {
    do
    {
      operator delete(*v2);
      uint64_t v3 = *(void ***)(a1 + 16);
      unint64_t v2 = (void **)(*(void *)(a1 + 8) + 8);
      *(void *)(a1 + 8) = v2;
      unint64_t v10 = (char *)v3 - (char *)v2;
    }
    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }
  unint64_t v11 = v10 >> 3;
  if (v11 == 1)
  {
    uint64_t v12 = 32;
    goto LABEL_14;
  }
  if (v11 == 2)
  {
    uint64_t v12 = 64;
LABEL_14:
    *(void *)(a1 + 32) = v12;
  }
  if (v2 != v3)
  {
    do
    {
      int32x2_t v13 = *v2++;
      operator delete(v13);
    }
    while (v2 != v3);
    uint64_t v15 = *(void *)(a1 + 8);
    uint64_t v14 = *(void *)(a1 + 16);
    if (v14 != v15) {
      *(void *)(a1 + 16) = v14 + ((v15 - v14 + 7) & 0xFFFFFFFFFFFFFFF8);
    }
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

BOOL sub_25B5E6690(float32x2_t *a1, uint64_t a2, float32x2_t a3)
{
  return !sub_25B5DF910(a1, a2, a3) && !sub_25B5DE76C(a1, a2, a3);
}

uint64_t sub_25B5E66E4(uint64_t a1, void *a2)
{
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  unint64_t v3 = a2[4];
  uint64_t v4 = a2[1];
  if (a2[2] == v4)
  {
    unint64_t v5 = 0;
    unint64_t v8 = 0;
    uint64_t v7 = (void *)(v4 + 8 * ((a2[5] + v3) / 0x55));
  }
  else
  {
    unint64_t v5 = (void *)(*(void *)(v4 + 8 * (v3 / 0x55)) + 48 * (v3 % 0x55));
    unint64_t v6 = a2[5] + v3;
    uint64_t v7 = (void *)(v4 + 8 * (v6 / 0x55));
    unint64_t v8 = *v7 + 48 * (v6 % 0x55);
  }
  if ((void *)v8 != v5)
  {
    uint64_t v9 = (void *)(v4 + 8 * (v3 / 0x55));
    uint64_t v10 = 85 * (v7 - v9)
        - 0x5555555555555555 * ((uint64_t)(v8 - *v7) >> 4)
        + 0x5555555555555555 * (((uint64_t)v5 - *v9) >> 4);
    if (v10)
    {
      unint64_t v11 = (v10 + 1) / 0x55uLL;
      uint64_t v12 = (void *)(-85 * v11 == ~v10 ? (v10 + 1) / 0x55uLL : v11 + 1);
      if (v12)
      {
        uint64_t v35 = a1 + 24;
        *(void *)&long long v33 = sub_25B3FCAD4((unint64_t)v12);
        *((void *)&v33 + 1) = v33;
        *(void *)&long long v34 = v33;
        *((void *)&v34 + 1) = v33 + 8 * v13;
        do
        {
          unint64_t v32 = operator new(0xFF0uLL);
          sub_25B468624(&v33, &v32);
          uint64_t v12 = (void *)((char *)v12 - 1);
        }
        while (v12);
        for (uint64_t i = *(void **)(a1 + 16); i != *(void **)(a1 + 8); sub_25B46850C((uint64_t)&v33, i))
          --i;
        long long v16 = v33;
        long long v17 = v34;
        *(void *)&long long v33 = *(void *)a1;
        uint64_t v15 = (void *)v33;
        *((void *)&v33 + 1) = i;
        *(_OWORD *)a1 = v16;
        *(_OWORD *)(a1 + 16) = v17;
        if (v15)
        {
          operator delete(v15);
          uint64_t v18 = *(void *)(a1 + 8);
          uint64_t v19 = *(void *)(a1 + 16);
        }
        else
        {
          uint64_t v18 = *((void *)&v16 + 1);
          uint64_t v19 = v17;
        }
        uint64_t v21 = *(void *)(a1 + 40);
        unint64_t v22 = *(void *)(a1 + 32) + v21;
        uint64_t v12 = (void *)(v18 + 8 * (v22 / 0x55));
        unint64_t v20 = v19 == v18 ? 0 : *v12 + 48 * (v22 % 0x55);
      }
      else
      {
        unint64_t v20 = 0;
        uint64_t v21 = 0;
      }
      uint64_t v23 = (uint64_t)(v20 - *v12) / 48 + v10;
      if (v23 < 1)
      {
        unint64_t v26 = 84 - v23;
        uint64_t v24 = &v12[-(v26 / 0x55)];
        unint64_t v25 = *v24 + 48 * (84 - v26 % 0x55);
      }
      else
      {
        uint64_t v24 = &v12[v23 / 0x55uLL];
        unint64_t v25 = *v24 + 48 * (v23 % 0x55uLL);
      }
      if (v20 != v25)
      {
        do
        {
          uint64_t v27 = v25;
          if (v12 != v24) {
            uint64_t v27 = *v12 + 4080;
          }
          if (v20 == v27)
          {
            uint64_t v27 = v20;
          }
          else
          {
            uint64_t v28 = (void *)v20;
            do
            {
              *uint64_t v28 = *v5;
              sub_25B4C9CE4((uint64_t)(v28 + 1), (uint64_t)(v5 + 1));
              v5 += 6;
              if ((void *)((char *)v5 - *v9) == (void *)4080)
              {
                char v29 = (void *)v9[1];
                ++v9;
                unint64_t v5 = v29;
              }
              v28 += 6;
            }
            while (v28 != (void *)v27);
            uint64_t v21 = *(void *)(a1 + 40);
          }
          v21 -= 0x5555555555555555 * ((uint64_t)(v27 - v20) >> 4);
          *(void *)(a1 + 40) = v21;
          if (v12 == v24) {
            break;
          }
          unint64_t v30 = v12[1];
          ++v12;
          unint64_t v20 = v30;
        }
        while (v30 != v25);
      }
    }
  }
  return a1;
}

void sub_25B5E6A34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13)
{
  sub_25B468738(v13);
  _Unwind_Resume(a1);
}

void sub_25B5E6AB4(void ***a1)
{
  uint64_t v1 = *a1;
  unint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    unint64_t v5 = v2;
    if ((void *)v4 != v2)
    {
      do
        uint64_t v4 = sub_25B5E5D24((void *)(v4 - 48));
      while ((void *)v4 != v2);
      unint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t sub_25B5E6B38(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 48;
    sub_25B5E5D24((void *)(i - 48));
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_25B5E6B88(char **a1)
{
  unint64_t v2 = a1[1];
  uint64_t v3 = a1[2];
  unint64_t v4 = (v3 - v2) >> 3;
  if (v3 == v2) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = 85 * v4 - 1;
  }
  unint64_t v6 = a1[4];
  if (v5 - (unint64_t)&v6[(void)a1[5]] < 0x55)
  {
    uint64_t v7 = a1[3];
    unint64_t v8 = *a1;
    uint64_t v9 = v7 - *a1;
    if (v4 >= v9 >> 3)
    {
      if (v7 == v8) {
        unint64_t v10 = 1;
      }
      else {
        unint64_t v10 = v9 >> 2;
      }
      uint64_t v42 = a1 + 3;
      float v38 = (char *)sub_25B3FCAD4(v10);
      uint64_t v39 = v38;
      uint64_t v40 = v38;
      long long v41 = &v38[8 * v11];
      unint64_t v37 = operator new(0xFF0uLL);
      sub_25B468624(&v38, &v37);
      uint64_t v13 = (uint64_t *)a1[1];
      uint64_t v12 = a1[2];
      uint64_t v14 = v40;
      while (v13 != (uint64_t *)v12)
      {
        if (v14 == v41)
        {
          long long v16 = v38;
          uint64_t v15 = v39;
          if (v39 <= v38)
          {
            if (v14 == v38) {
              unint64_t v22 = 1;
            }
            else {
              unint64_t v22 = (v14 - v38) >> 2;
            }
            uint64_t v23 = (char *)sub_25B3FCAD4(v22);
            uint64_t v26 = v14 - v15;
            BOOL v25 = v14 == v15;
            uint64_t v14 = &v23[8 * (v22 >> 2)];
            if (!v25)
            {
              uint64_t v14 = &v23[8 * (v22 >> 2) + (v26 & 0xFFFFFFFFFFFFFFF8)];
              uint64_t v27 = 8 * (v26 >> 3);
              uint64_t v28 = &v23[8 * (v22 >> 2)];
              do
              {
                uint64_t v29 = *(void *)v15;
                v15 += 8;
                *(void *)uint64_t v28 = v29;
                v28 += 8;
                v27 -= 8;
              }
              while (v27);
            }
            float v38 = v23;
            uint64_t v39 = &v23[8 * (v22 >> 2)];
            uint64_t v40 = v14;
            long long v41 = &v23[8 * v24];
            if (v16) {
              operator delete(v16);
            }
          }
          else
          {
            uint64_t v17 = (v39 - v38) >> 3;
            if (v17 >= -1) {
              uint64_t v18 = v17 + 1;
            }
            else {
              uint64_t v18 = v17 + 2;
            }
            uint64_t v19 = &v39[-8 * (v18 >> 1)];
            int64_t v20 = v14 - v39;
            if (v14 != v39)
            {
              memmove(&v39[-8 * (v18 >> 1)], v39, v14 - v39);
              uint64_t v14 = v15;
            }
            uint64_t v21 = &v14[-8 * (v18 >> 1)];
            uint64_t v14 = &v19[v20];
            uint64_t v39 = v21;
            uint64_t v40 = &v19[v20];
          }
        }
        uint64_t v30 = *v13++;
        *(void *)uint64_t v14 = v30;
        uint64_t v14 = v40 + 8;
        v40 += 8;
        uint64_t v12 = a1[2];
      }
      char v31 = *a1;
      unint64_t v32 = v39;
      *a1 = v38;
      a1[1] = v32;
      long long v33 = v41;
      a1[2] = v14;
      a1[3] = v33;
      if (v14 - v32 == 8) {
        uint64_t v34 = 42;
      }
      else {
        uint64_t v34 = (uint64_t)(a1[4] + 85);
      }
      a1[4] = (char *)v34;
      if (v31) {
        operator delete(v31);
      }
    }
    else
    {
      if (v2 == v8)
      {
        float v38 = (char *)operator new(0xFF0uLL);
        sub_25B468624(a1, &v38);
        uint64_t v35 = a1[2];
        float v38 = (char *)*((void *)v35 - 1);
        a1[2] = v35 - 8;
      }
      else
      {
        float v38 = (char *)operator new(0xFF0uLL);
      }
      sub_25B46850C((uint64_t)a1, &v38);
      if (a1[2] - a1[1] == 8) {
        uint64_t v36 = 42;
      }
      else {
        uint64_t v36 = (uint64_t)(a1[4] + 85);
      }
      a1[4] = (char *)v36;
    }
  }
  else
  {
    a1[4] = v6 + 85;
    float v38 = (char *)*((void *)v3 - 1);
    a1[2] = v3 - 8;
    sub_25B46850C((uint64_t)a1, &v38);
  }
}

void sub_25B5E6E1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p)
{
  operator delete(v10);
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_25B5E6E48(uint64_t a1)
{
  unint64_t v2 = *(std::__shared_weak_count **)(a1 + 56);
  if (v2) {
    sub_25B404120(v2);
  }
  uint64_t v3 = *(char **)(a1 + 24);

  sub_25B400248(v3);
}

void sub_25B5E6E88(void *a1)
{
  unint64_t v2 = a1[4];
  BOOL v3 = v2 >= 0x40;
  unint64_t v4 = v2 - 64;
  if (v3)
  {
    a1[4] = v4;
    uint64_t v5 = (void *)a1[1];
    unint64_t v6 = (char *)a1[2];
    uint64_t v9 = *v5;
    uint64_t v7 = (char *)(v5 + 1);
    uint64_t v8 = v9;
    a1[1] = v7;
    if (v6 != (char *)a1[3]) {
      goto LABEL_41;
    }
    uint64_t v10 = (uint64_t)&v7[-*a1];
    if ((unint64_t)v7 <= *a1)
    {
      if (v6 == (char *)*a1) {
        unint64_t v40 = 1;
      }
      else {
        unint64_t v40 = (uint64_t)&v6[-*a1] >> 2;
      }
      long long v41 = (char *)sub_25B3FCAD4(v40);
      uint64_t v42 = &v41[8 * (v40 >> 2)];
      int64_t v44 = &v41[8 * v43];
      int64x2_t v45 = (uint64_t *)a1[1];
      unint64_t v6 = v42;
      uint64_t v46 = a1[2] - (void)v45;
      if (v46)
      {
        unint64_t v6 = &v42[v46 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v47 = 8 * (v46 >> 3);
        uint64_t v48 = &v41[8 * (v40 >> 2)];
        do
        {
          uint64_t v49 = *v45++;
          *(void *)uint64_t v48 = v49;
          v48 += 8;
          v47 -= 8;
        }
        while (v47);
      }
      goto LABEL_29;
    }
LABEL_5:
    uint64_t v11 = v10 >> 3;
    BOOL v12 = v10 >> 3 < -1;
    uint64_t v13 = (v10 >> 3) + 2;
    if (v12) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = v11 + 1;
    }
    uint64_t v15 = -(v14 >> 1);
    uint64_t v16 = v14 >> 1;
    uint64_t v17 = &v7[-8 * v16];
    int64_t v18 = v6 - v7;
    if (v6 != v7)
    {
      memmove(&v7[-8 * v16], v7, v6 - v7);
      uint64_t v7 = (char *)a1[1];
    }
    unint64_t v6 = &v17[v18];
    a1[1] = &v7[8 * v15];
    a1[2] = &v17[v18];
    goto LABEL_41;
  }
  int64_t v20 = (char *)a1[2];
  uint64_t v19 = (char *)a1[3];
  uint64_t v21 = (char *)*a1;
  unint64_t v22 = (char *)a1[1];
  unint64_t v23 = (v20 - v22) >> 3;
  uint64_t v24 = (uint64_t)&v19[-*a1];
  if (v23 < v24 >> 3)
  {
    BOOL v25 = operator new(0x1000uLL);
    uint64_t v26 = v25;
    if (v19 != v20)
    {
      *(void *)int64_t v20 = v25;
LABEL_42:
      a1[2] += 8;
      return;
    }
    if (v22 == v21)
    {
      if (v20 == v22) {
        unint64_t v51 = 1;
      }
      else {
        unint64_t v51 = (v19 - v22) >> 2;
      }
      uint64_t v52 = 2 * v51;
      uint64_t v53 = (char *)sub_25B3FCAD4(v51);
      unint64_t v22 = &v53[(v52 + 6) & 0xFFFFFFFFFFFFFFF8];
      unint64_t v55 = (uint64_t *)a1[1];
      unint64_t v56 = v22;
      uint64_t v57 = a1[2] - (void)v55;
      if (v57)
      {
        unint64_t v56 = &v22[v57 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v58 = 8 * (v57 >> 3);
        uint64_t v59 = &v53[(v52 + 6) & 0xFFFFFFFFFFFFFFF8];
        do
        {
          uint64_t v60 = *v55++;
          *(void *)uint64_t v59 = v60;
          v59 += 8;
          v58 -= 8;
        }
        while (v58);
      }
      uint64_t v61 = (char *)*a1;
      *a1 = v53;
      a1[1] = v22;
      a1[2] = v56;
      a1[3] = &v53[8 * v54];
      if (v61)
      {
        operator delete(v61);
        unint64_t v22 = (char *)a1[1];
      }
    }
    *((void *)v22 - 1) = v26;
    uint64_t v7 = (char *)a1[1];
    unint64_t v6 = (char *)a1[2];
    a1[1] = v7 - 8;
    uint64_t v8 = *((void *)v7 - 1);
    a1[1] = v7;
    if (v6 != (char *)a1[3])
    {
LABEL_41:
      *(void *)unint64_t v6 = v8;
      goto LABEL_42;
    }
    uint64_t v10 = (uint64_t)&v7[-*a1];
    if ((unint64_t)v7 <= *a1)
    {
      if (v6 == (char *)*a1) {
        unint64_t v85 = 1;
      }
      else {
        unint64_t v85 = (uint64_t)&v6[-*a1] >> 2;
      }
      long long v41 = (char *)sub_25B3FCAD4(v85);
      uint64_t v42 = &v41[8 * (v85 >> 2)];
      int64_t v44 = &v41[8 * v86];
      uint64_t v87 = (uint64_t *)a1[1];
      unint64_t v6 = v42;
      uint64_t v88 = a1[2] - (void)v87;
      if (v88)
      {
        unint64_t v6 = &v42[v88 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v89 = 8 * (v88 >> 3);
        uint64_t v90 = &v41[8 * (v85 >> 2)];
        do
        {
          uint64_t v91 = *v87++;
          *(void *)uint64_t v90 = v91;
          v90 += 8;
          v89 -= 8;
        }
        while (v89);
      }
LABEL_29:
      unint64_t v50 = (char *)*a1;
      *a1 = v41;
      a1[1] = v42;
      a1[2] = v6;
      a1[3] = v44;
      if (v50)
      {
        operator delete(v50);
        unint64_t v6 = (char *)a1[2];
      }
      goto LABEL_41;
    }
    goto LABEL_5;
  }
  uint64_t v27 = v24 >> 2;
  if (v19 == v21) {
    unint64_t v28 = 1;
  }
  else {
    unint64_t v28 = v27;
  }
  uint64_t v29 = (char *)sub_25B3FCAD4(v28);
  uint64_t v31 = v30;
  unint64_t v32 = &v29[8 * v23];
  *(void *)&long long v33 = v29;
  *((void *)&v33 + 1) = v32;
  long long v95 = v33;
  uint64_t v34 = operator new(0x1000uLL);
  *(void *)&long long v35 = v32;
  *((void *)&v35 + 1) = &v29[8 * v31];
  if (v23 == v31)
  {
    uint64_t v36 = 8 * v23;
    *(void *)&long long v37 = v95;
    if (v20 - v22 >= 1)
    {
      uint64_t v38 = v36 >> 3;
      if (v38 >= -1) {
        unint64_t v39 = v38 + 1;
      }
      else {
        unint64_t v39 = v38 + 2;
      }
      v32 -= 8 * (v39 >> 1);
      *(void *)&long long v35 = v32;
      *((void *)&v37 + 1) = v32;
      goto LABEL_50;
    }
    uint64_t v62 = v36 >> 2;
    if (v20 == v22) {
      unint64_t v63 = 1;
    }
    else {
      unint64_t v63 = v62;
    }
    uint64_t v64 = (char *)sub_25B3FCAD4(v63);
    unint64_t v32 = &v64[8 * (v63 >> 2)];
    *(void *)&long long v37 = v64;
    *((void *)&v37 + 1) = v32;
    *(void *)&long long v35 = v32;
    *((void *)&v35 + 1) = &v64[8 * v65];
    if (!v29) {
      goto LABEL_50;
    }
    long long v92 = v35;
    long long v95 = v37;
    operator delete(v29);
    long long v35 = v92;
  }
  long long v37 = v95;
LABEL_50:
  *(void *)unint64_t v32 = v34;
  *(void *)&long long v35 = v35 + 8;
  for (uint64_t i = a1[2]; i != a1[1]; i -= 8)
  {
    uint64_t v67 = (void *)*((void *)&v37 + 1);
    if (*((void *)&v37 + 1) == (void)v37)
    {
      uint64_t v69 = (unsigned char *)v35;
      if ((unint64_t)v35 >= *((void *)&v35 + 1))
      {
        if (*((void *)&v35 + 1) == *((void *)&v37 + 1)) {
          unint64_t v74 = 1;
        }
        else {
          unint64_t v74 = (uint64_t)(*((void *)&v35 + 1) - *((void *)&v37 + 1)) >> 2;
        }
        uint64_t v75 = (char *)sub_25B3FCAD4(v74);
        float v68 = &v75[(2 * v74 + 6) & 0xFFFFFFFFFFFFFFF8];
        uint64_t v77 = v68;
        uint64_t v78 = v69 - (unsigned char *)v67;
        if (v69 != (unsigned char *)v67)
        {
          uint64_t v77 = &v68[v78 & 0xFFFFFFFFFFFFFFF8];
          uint64_t v79 = 8 * (v78 >> 3);
          unint64_t v80 = v68;
          char v81 = v67;
          do
          {
            uint64_t v82 = *v81++;
            *(void *)unint64_t v80 = v82;
            v80 += 8;
            v79 -= 8;
          }
          while (v79);
        }
        *(void *)&long long v37 = v75;
        *((void *)&v37 + 1) = v68;
        *(void *)&long long v35 = v77;
        *((void *)&v35 + 1) = &v75[8 * v76];
        if (v67)
        {
          long long v93 = v35;
          long long v97 = v37;
          operator delete(v67);
          long long v35 = v93;
          long long v37 = v97;
        }
      }
      else
      {
        uint64_t v70 = (uint64_t)(*((void *)&v35 + 1) - v35) >> 3;
        if (v70 >= -1) {
          uint64_t v71 = v70 + 1;
        }
        else {
          uint64_t v71 = v70 + 2;
        }
        uint64_t v72 = v71 >> 1;
        uint64_t v73 = v35 + 8 * (v71 >> 1);
        float v68 = (char *)(v73 - (v35 - *((void *)&v37 + 1)));
        if ((void)v35 == *((void *)&v37 + 1))
        {
          uint64_t v69 = (unsigned char *)*((void *)&v37 + 1);
        }
        else
        {
          uint64_t v94 = *((void *)&v35 + 1);
          uint64_t v96 = v37;
          memmove((void *)(v73 - (v35 - *((void *)&v37 + 1))), *((const void **)&v37 + 1), v35 - *((void *)&v37 + 1));
          *((void *)&v35 + 1) = v94;
          *(void *)&long long v37 = v96;
        }
        *((void *)&v37 + 1) = v68;
        *(void *)&long long v35 = &v69[8 * v72];
      }
    }
    else
    {
      float v68 = (char *)*((void *)&v37 + 1);
    }
    uint64_t v83 = *(void *)(i - 8);
    *((void *)v68 - 1) = v83;
    *((void *)&v37 + 1) -= 8;
  }
  uint64_t v84 = (char *)*a1;
  *(_OWORD *)a1 = v37;
  *((_OWORD *)a1 + 1) = v35;
  if (v84)
  {
    operator delete(v84);
  }
}

void sub_25B5E7348(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, long long a11)
{
  operator delete(v11);
  if ((void)a11) {
    operator delete((void *)a11);
  }
  _Unwind_Resume(a1);
}

void sub_25B5E7378(uint64_t *a1, uint64_t *a2, float64x2_t **a3, uint64_t a4, char a5)
{
void sub_25B5EA06C(_Unwind_Exception *a1)
{
  sub_25B400248(*(char **)(v1 - 176));
  _Unwind_Resume(a1);
}

uint64_t sub_25B5EA0E0(uint64_t *a1, void *a2)
{
  unint64_t v2 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 4);
  unint64_t v3 = v2 + 1;
  if (v2 + 1 > 0x555555555555555) {
    sub_25B3FBC4C();
  }
  unint64_t v6 = a1 + 2;
  if (0x5555555555555556 * ((a1[2] - *a1) >> 4) > v3) {
    unint64_t v3 = 0x5555555555555556 * ((a1[2] - *a1) >> 4);
  }
  if (0xAAAAAAAAAAAAAAABLL * ((a1[2] - *a1) >> 4) >= 0x2AAAAAAAAAAAAAALL) {
    unint64_t v7 = 0x555555555555555;
  }
  else {
    unint64_t v7 = v3;
  }
  uint64_t v15 = v6;
  if (v7) {
    unint64_t v7 = (unint64_t)sub_25B467D14(v7);
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = (void *)(v7 + 48 * v2);
  v12[0] = v7;
  v12[1] = v9;
  uint64_t v13 = v9;
  unint64_t v14 = v7 + 48 * v8;
  *uint64_t v9 = *a2;
  sub_25B4C9CE4((uint64_t)(v9 + 1), (uint64_t)(a2 + 1));
  v13 += 6;
  sub_25B5EA1EC(a1, v12);
  uint64_t v10 = a1[1];
  sub_25B5E4F04((uint64_t)v12);
  return v10;
}

void sub_25B5EA1D8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_25B5E4F04((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t *sub_25B5EA1EC(uint64_t *result, void *a2)
{
  unint64_t v3 = result;
  uint64_t v5 = *result;
  uint64_t v4 = result[1];
  uint64_t v6 = a2[1];
  if (v4 != *result)
  {
    uint64_t v7 = 0;
    do
    {
      *(void *)(v6 + v7 - 48) = *(void *)(v4 + v7 - 48);
      int64x2_t result = (uint64_t *)sub_25B4C9CE4(v6 + v7 - 40, v4 + v7 - 40);
      v7 -= 48;
    }
    while (v4 + v7 != v5);
    v6 += v7;
  }
  a2[1] = v6;
  uint64_t v8 = *v3;
  uint64_t *v3 = v6;
  a2[1] = v8;
  uint64_t v9 = v3[1];
  v3[1] = a2[2];
  a2[2] = v9;
  uint64_t v10 = v3[2];
  v3[2] = a2[3];
  a2[3] = v10;
  *a2 = a2[1];
  return result;
}

void sub_25B5EA2CC(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  *a1 = *a2;
  uint64_t v3 = (uint64_t)(a1 + 1);
  *a2 = v2;
  uint64_t v4 = (uint64_t)(a2 + 1);
  sub_25B4C9CE4((uint64_t)v9, (uint64_t)(a1 + 1));
  sub_25B576A98((uint64_t)v7, v3, v4);
  sub_25B400248(v8);
  sub_25B576A98((uint64_t)v5, v4, (uint64_t)v9);
  sub_25B400248(v6);
  sub_25B400248(v10);
}

void sub_25B5EA34C(_Unwind_Exception *a1)
{
  sub_25B400248(*(char **)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_25B5EA360(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t a4)
{
  float32x2_t v8 = **(float32x2_t **)(a4 + 8);
  float32x2_t v9 = (float32x2_t)a2[1];
  float64x2_t v151 = *(float64x2_t *)*(void *)a4;
  float64x2_t v144 = vcvtq_f64_f32(vsub_f32(v9, v8));
  int64x2_t v148 = (int64x2_t)vmulq_f64(v151, v151);
  int64x2_t v10 = (int64x2_t)vmulq_f64(v144, v144);
  float64x2_t v11 = vsqrtq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v148, v10), (float64x2_t)vzip2q_s64(v148, v10)));
  double v12 = vaddvq_f64(vmulq_f64(v151, v144)) / fmax(vmulq_laneq_f64(v11, v11, 1).f64[0], 2.22507386e-308);
  if (v12 <= 1.0) {
    double v13 = v12;
  }
  else {
    double v13 = 1.0;
  }
  if (v12 >= -1.0) {
    double v14 = v13;
  }
  else {
    double v14 = -1.0;
  }
  long double v142 = acos(v14);
  int v15 = *(unsigned __int8 *)(a4 + 24);
  unsigned int v16 = *(unsigned char *)(a4 + 24) == 0;
  float32x2_t v17 = (float32x2_t)a1[1];
  float64x2_t v137 = vcvtq_f64_f32(vsub_f32(v17, v8));
  int64x2_t v18 = (int64x2_t)vmulq_f64(v137, v137);
  float64x2_t v19 = vsqrtq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v148, v18), (float64x2_t)vzip2q_s64(v148, v18)));
  double v20 = vaddvq_f64(vmulq_f64(v151, v137)) / fmax(vmulq_laneq_f64(v19, v19, 1).f64[0], 2.22507386e-308);
  if (v20 <= 1.0) {
    double v21 = v20;
  }
  else {
    double v21 = 1.0;
  }
  if (v20 >= -1.0) {
    double v22 = v21;
  }
  else {
    double v22 = -1.0;
  }
  long double v23 = acos(v22);
  v24.f64[0] = v142;
  v24.f64[1] = v23;
  float64x2_t v25 = vdivq_f64(vmulq_f64(v24, (float64x2_t)vdupq_n_s64(0x4066800000000000uLL)), (float64x2_t)vdupq_n_s64(0x400921FB54442D18uLL));
  float64x2_t v26 = (float64x2_t)vdupq_n_s64(0x4076800000000000uLL);
  float64x2_t v27 = (float64x2_t)vbslq_s8((int8x16_t)vclezq_f64(vmlaq_n_f64(vmulq_n_f64((float64x2_t)vzip1q_s64((int64x2_t)v144, (int64x2_t)v137), -v151.f64[1]), (float64x2_t)vzip2q_s64((int64x2_t)v144, (int64x2_t)v137), v151.f64[0])), (int8x16_t)v25, (int8x16_t)vsubq_f64(v26, v25));
  int32x2_t v28 = vdup_n_s32(v16);
  v29.i64[0] = v28.u32[0];
  v29.i64[1] = v28.u32[1];
  float64x2_t v30 = (float64x2_t)vbslq_s8((int8x16_t)vcltzq_s64(vshlq_n_s64(v29, 0x3FuLL)), (int8x16_t)vsubq_f64(v26, v27), (int8x16_t)v27);
  __asm { FMOV            V1.2D, #15.0 }
  float64x2_t v143 = _Q1;
  int8x16_t v36 = vbslq_s8((int8x16_t)vcgtq_f64(_Q1, v30), (int8x16_t)vaddq_f64(v30, v26), (int8x16_t)v30);
  double v145 = *(double *)v36.i64;
  if (vabdd_f64(*(double *)v36.i64, *(double *)&v36.i64[1]) >= 0.100000001)
  {
    if (*(double *)v36.i64 >= *(double *)&v36.i64[1]) {
      goto LABEL_15;
    }
LABEL_30:
    float32x2_t v59 = (float32x2_t)a3[1];
    float64x2_t v139 = vcvtq_f64_f32(vsub_f32(v59, v8));
    int64x2_t v60 = (int64x2_t)vmulq_f64(v139, v139);
    float64x2_t v61 = vsqrtq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v148, v60), (float64x2_t)vzip2q_s64(v148, v60)));
    double v62 = vaddvq_f64(vmulq_f64(v151, v139)) / fmax(vmulq_laneq_f64(v61, v61, 1).f64[0], 2.22507386e-308);
    double v63 = 1.0;
    if (v62 <= 1.0) {
      double v63 = v62;
    }
    if (v62 >= -1.0) {
      double v64 = v63;
    }
    else {
      double v64 = -1.0;
    }
    double v65 = acos(v64) * 180.0 / 3.14159265;
    _D2 = v151.f64[0];
    _V3.D[1] = v139.f64[1];
    __asm { FMLA            D1, D2, V3.D[1] }
    if (_D1 > 0.0) {
      double v65 = 360.0 - v65;
    }
    if (!v15) {
      double v65 = 360.0 - v65;
    }
    if (v65 < 15.0) {
      double v65 = v65 + 360.0;
    }
    if (vabdd_f64(v65, v145) >= 0.100000001)
    {
      if (v65 >= v145) {
        goto LABEL_43;
      }
    }
    else
    {
      float32x2_t v69 = **(float32x2_t **)(a4 + 16);
      float32x2_t v70 = vsub_f32(v69, v59);
      int32x2_t v71 = (int32x2_t)vmul_f32(v70, v70);
      float32x2_t v72 = vsub_f32(v69, v9);
      int32x2_t v73 = (int32x2_t)vmul_f32(v72, v72);
      int32x2_t v74 = (int32x2_t)vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(v71, v73), (float32x2_t)vzip2_s32(v71, v73)));
      if ((vcgt_f32((float32x2_t)vdup_lane_s32(v74, 1), (float32x2_t)v74).u8[0] & 1) == 0)
      {
LABEL_43:
        sub_25B5EA2CC(a1, a2);
        float32x2_t v75 = **(float32x2_t **)(a4 + 8);
        float32x2_t v76 = (float32x2_t)a3[1];
        float64x2_t v149 = vcvtq_f64_f32(vsub_f32(v76, v75));
        float64x2_t v152 = *(float64x2_t *)*(void *)a4;
        int64x2_t v140 = (int64x2_t)vmulq_f64(v152, v152);
        int64x2_t v77 = (int64x2_t)vmulq_f64(v149, v149);
        float64x2_t v78 = vsqrtq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v140, v77), (float64x2_t)vzip2q_s64(v140, v77)));
        double v79 = vaddvq_f64(vmulq_f64(v152, v149)) / fmax(vmulq_laneq_f64(v78, v78, 1).f64[0], 2.22507386e-308);
        if (v79 <= 1.0) {
          double v80 = v79;
        }
        else {
          double v80 = 1.0;
        }
        if (v79 >= -1.0) {
          double v81 = v80;
        }
        else {
          double v81 = -1.0;
        }
        long double v146 = acos(v81);
        unsigned int v82 = *(unsigned char *)(a4 + 24) == 0;
        float32x2_t v83 = (float32x2_t)a2[1];
        float64x2_t v135 = vcvtq_f64_f32(vsub_f32(v83, v75));
        int64x2_t v84 = (int64x2_t)vmulq_f64(v135, v135);
        float64x2_t v85 = vsqrtq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v140, v84), (float64x2_t)vzip2q_s64(v140, v84)));
        double v86 = vaddvq_f64(vmulq_f64(v152, v135)) / fmax(vmulq_laneq_f64(v85, v85, 1).f64[0], 2.22507386e-308);
        if (v86 <= 1.0) {
          double v87 = v86;
        }
        else {
          double v87 = 1.0;
        }
        if (v86 >= -1.0) {
          double v88 = v87;
        }
        else {
          double v88 = -1.0;
        }
        long double v89 = acos(v88);
        v90.f64[0] = v146;
        v90.f64[1] = v89;
        float64x2_t v91 = vdivq_f64(vmulq_f64(v90, (float64x2_t)vdupq_n_s64(0x4066800000000000uLL)), (float64x2_t)vdupq_n_s64(0x400921FB54442D18uLL));
        float64x2_t v92 = (float64x2_t)vdupq_n_s64(0x4076800000000000uLL);
        float64x2_t v93 = (float64x2_t)vbslq_s8((int8x16_t)vclezq_f64(vmlaq_n_f64(vmulq_n_f64((float64x2_t)vzip1q_s64((int64x2_t)v149, (int64x2_t)v135), -v152.f64[1]), (float64x2_t)vzip2q_s64((int64x2_t)v149, (int64x2_t)v135), v152.f64[0])), (int8x16_t)v91, (int8x16_t)vsubq_f64(v92, v91));
        int32x2_t v94 = vdup_n_s32(v82);
        v95.i64[0] = v94.u32[0];
        v95.i64[1] = v94.u32[1];
        float64x2_t v96 = (float64x2_t)vbslq_s8((int8x16_t)vcltzq_s64(vshlq_n_s64(v95, 0x3FuLL)), (int8x16_t)vsubq_f64(v92, v93), (int8x16_t)v93);
        int8x16_t v97 = vbslq_s8((int8x16_t)vcgtq_f64(v143, v96), (int8x16_t)vaddq_f64(v96, v92), (int8x16_t)v96);
        if (vabdd_f64(*(double *)v97.i64, *(double *)&v97.i64[1]) >= 0.100000001)
        {
          if (*(double *)v97.i64 >= *(double *)&v97.i64[1]) {
            return;
          }
        }
        else
        {
          float32x2_t v98 = **(float32x2_t **)(a4 + 16);
          float32x2_t v99 = vsub_f32(v98, v76);
          int32x2_t v100 = (int32x2_t)vmul_f32(v99, v99);
          float32x2_t v101 = vsub_f32(v98, v83);
          int32x2_t v102 = (int32x2_t)vmul_f32(v101, v101);
          int32x2_t v103 = (int32x2_t)vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(v100, v102), (float32x2_t)vzip2_s32(v100, v102)));
          if ((vcgt_f32((float32x2_t)vdup_lane_s32(v103, 1), (float32x2_t)v103).u32[0] & 1) == 0) {
            return;
          }
        }
        char v133 = a2;
        goto LABEL_78;
      }
    }
    char v133 = a1;
LABEL_78:
    float32x2_t v134 = a3;
    goto LABEL_81;
  }
  float32x2_t v37 = **(float32x2_t **)(a4 + 16);
  float32x2_t v38 = vsub_f32(v37, v9);
  int32x2_t v39 = (int32x2_t)vmul_f32(v38, v38);
  float32x2_t v40 = vsub_f32(v37, v17);
  int32x2_t v41 = (int32x2_t)vmul_f32(v40, v40);
  int32x2_t v42 = (int32x2_t)vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(v39, v41), (float32x2_t)vzip2_s32(v39, v41)));
  if (vcgt_f32((float32x2_t)vdup_lane_s32(v42, 1), (float32x2_t)v42).u8[0]) {
    goto LABEL_30;
  }
LABEL_15:
  float32x2_t v43 = (float32x2_t)a3[1];
  float64x2_t v138 = vcvtq_f64_f32(vsub_f32(v43, v8));
  int64x2_t v44 = (int64x2_t)vmulq_f64(v138, v138);
  float64x2_t v45 = vsqrtq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v148, v44), (float64x2_t)vzip2q_s64(v148, v44)));
  double v46 = vaddvq_f64(vmulq_f64(v151, v138)) / fmax(vmulq_laneq_f64(v45, v45, 1).f64[0], 2.22507386e-308);
  double v47 = 1.0;
  if (v46 <= 1.0) {
    double v47 = v46;
  }
  if (v46 >= -1.0) {
    double v48 = v47;
  }
  else {
    double v48 = -1.0;
  }
  double v49 = acos(v48) * 180.0 / 3.14159265;
  _D2 = v151.f64[0];
  _V3.D[1] = v138.f64[1];
  __asm { FMLA            D1, D2, V3.D[1] }
  if (_D1 > 0.0) {
    double v49 = 360.0 - v49;
  }
  if (!v15) {
    double v49 = 360.0 - v49;
  }
  if (v49 < 15.0) {
    double v49 = v49 + 360.0;
  }
  if (vabdd_f64(v49, v145) >= 0.100000001)
  {
    if (v49 >= v145) {
      return;
    }
  }
  else
  {
    float32x2_t v53 = **(float32x2_t **)(a4 + 16);
    float32x2_t v54 = vsub_f32(v53, v43);
    int32x2_t v55 = (int32x2_t)vmul_f32(v54, v54);
    float32x2_t v56 = vsub_f32(v53, v9);
    int32x2_t v57 = (int32x2_t)vmul_f32(v56, v56);
    int32x2_t v58 = (int32x2_t)vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(v55, v57), (float32x2_t)vzip2_s32(v55, v57)));
    if ((vcgt_f32((float32x2_t)vdup_lane_s32(v58, 1), (float32x2_t)v58).u32[0] & 1) == 0) {
      return;
    }
  }
  sub_25B5EA2CC(a2, a3);
  float32x2_t v104 = **(float32x2_t **)(a4 + 8);
  float32x2_t v105 = (float32x2_t)a2[1];
  float64x2_t v150 = vcvtq_f64_f32(vsub_f32(v105, v104));
  float64x2_t v153 = *(float64x2_t *)*(void *)a4;
  int64x2_t v141 = (int64x2_t)vmulq_f64(v153, v153);
  int64x2_t v106 = (int64x2_t)vmulq_f64(v150, v150);
  float64x2_t v107 = vsqrtq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v141, v106), (float64x2_t)vzip2q_s64(v141, v106)));
  double v108 = vaddvq_f64(vmulq_f64(v153, v150)) / fmax(vmulq_laneq_f64(v107, v107, 1).f64[0], 2.22507386e-308);
  if (v108 <= 1.0) {
    double v109 = v108;
  }
  else {
    double v109 = 1.0;
  }
  if (v108 >= -1.0) {
    double v110 = v109;
  }
  else {
    double v110 = -1.0;
  }
  long double v147 = acos(v110);
  unsigned int v111 = *(unsigned char *)(a4 + 24) == 0;
  float32x2_t v112 = (float32x2_t)a1[1];
  float64x2_t v136 = vcvtq_f64_f32(vsub_f32(v112, v104));
  int64x2_t v113 = (int64x2_t)vmulq_f64(v136, v136);
  float64x2_t v114 = vsqrtq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v141, v113), (float64x2_t)vzip2q_s64(v141, v113)));
  double v115 = vaddvq_f64(vmulq_f64(v153, v136)) / fmax(vmulq_laneq_f64(v114, v114, 1).f64[0], 2.22507386e-308);
  if (v115 <= 1.0) {
    double v116 = v115;
  }
  else {
    double v116 = 1.0;
  }
  if (v115 >= -1.0) {
    double v117 = v116;
  }
  else {
    double v117 = -1.0;
  }
  long double v118 = acos(v117);
  v119.f64[0] = v147;
  v119.f64[1] = v118;
  float64x2_t v120 = vdivq_f64(vmulq_f64(v119, (float64x2_t)vdupq_n_s64(0x4066800000000000uLL)), (float64x2_t)vdupq_n_s64(0x400921FB54442D18uLL));
  float64x2_t v121 = (float64x2_t)vdupq_n_s64(0x4076800000000000uLL);
  float64x2_t v122 = (float64x2_t)vbslq_s8((int8x16_t)vclezq_f64(vmlaq_n_f64(vmulq_n_f64((float64x2_t)vzip1q_s64((int64x2_t)v150, (int64x2_t)v136), -v153.f64[1]), (float64x2_t)vzip2q_s64((int64x2_t)v150, (int64x2_t)v136), v153.f64[0])), (int8x16_t)v120, (int8x16_t)vsubq_f64(v121, v120));
  int32x2_t v123 = vdup_n_s32(v111);
  v124.i64[0] = v123.u32[0];
  v124.i64[1] = v123.u32[1];
  float64x2_t v125 = (float64x2_t)vbslq_s8((int8x16_t)vcltzq_s64(vshlq_n_s64(v124, 0x3FuLL)), (int8x16_t)vsubq_f64(v121, v122), (int8x16_t)v122);
  int8x16_t v126 = vbslq_s8((int8x16_t)vcgtq_f64(v143, v125), (int8x16_t)vaddq_f64(v125, v121), (int8x16_t)v125);
  if (vabdd_f64(*(double *)v126.i64, *(double *)&v126.i64[1]) >= 0.100000001)
  {
    if (*(double *)v126.i64 >= *(double *)&v126.i64[1]) {
      return;
    }
  }
  else
  {
    float32x2_t v127 = **(float32x2_t **)(a4 + 16);
    float32x2_t v128 = vsub_f32(v127, v105);
    int32x2_t v129 = (int32x2_t)vmul_f32(v128, v128);
    float32x2_t v130 = vsub_f32(v127, v112);
    int32x2_t v131 = (int32x2_t)vmul_f32(v130, v130);
    int32x2_t v132 = (int32x2_t)vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(v129, v131), (float32x2_t)vzip2_s32(v129, v131)));
    if ((vcgt_f32((float32x2_t)vdup_lane_s32(v132, 1), (float32x2_t)v132).u32[0] & 1) == 0) {
      return;
    }
  }
  char v133 = a1;
  float32x2_t v134 = a2;
LABEL_81:

  sub_25B5EA2CC(v133, v134);
}

void sub_25B5EAB9C(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t a5)
{
  sub_25B5EA360(a1, a2, a3, a5);
  float32x2_t v10 = **(float32x2_t **)(a5 + 8);
  float32x2_t v11 = (float32x2_t)a4[1];
  float64x2_t v113 = vcvtq_f64_f32(vsub_f32(v11, v10));
  float64x2_t v115 = *(float64x2_t *)*(void *)a5;
  int64x2_t v107 = (int64x2_t)vmulq_f64(v115, v115);
  int64x2_t v12 = (int64x2_t)vmulq_f64(v113, v113);
  float64x2_t v13 = vsqrtq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v107, v12), (float64x2_t)vzip2q_s64(v107, v12)));
  double v14 = vaddvq_f64(vmulq_f64(v115, v113)) / fmax(vmulq_laneq_f64(v13, v13, 1).f64[0], 2.22507386e-308);
  if (v14 <= 1.0) {
    double v15 = v14;
  }
  else {
    double v15 = 1.0;
  }
  if (v14 >= -1.0) {
    double v16 = v15;
  }
  else {
    double v16 = -1.0;
  }
  long double v110 = acos(v16);
  unsigned int v17 = *(unsigned char *)(a5 + 24) == 0;
  float32x2_t v18 = (float32x2_t)a3[1];
  float64x2_t v104 = vcvtq_f64_f32(vsub_f32(v18, v10));
  int64x2_t v19 = (int64x2_t)vmulq_f64(v104, v104);
  float64x2_t v20 = vsqrtq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v107, v19), (float64x2_t)vzip2q_s64(v107, v19)));
  double v21 = vaddvq_f64(vmulq_f64(v115, v104)) / fmax(vmulq_laneq_f64(v20, v20, 1).f64[0], 2.22507386e-308);
  if (v21 <= 1.0) {
    double v22 = v21;
  }
  else {
    double v22 = 1.0;
  }
  if (v21 >= -1.0) {
    double v23 = v22;
  }
  else {
    double v23 = -1.0;
  }
  long double v24 = acos(v23);
  v25.f64[0] = v110;
  v25.f64[1] = v24;
  float64x2_t v26 = vdivq_f64(vmulq_f64(v25, (float64x2_t)vdupq_n_s64(0x4066800000000000uLL)), (float64x2_t)vdupq_n_s64(0x400921FB54442D18uLL));
  float64x2_t v27 = (float64x2_t)vdupq_n_s64(0x4076800000000000uLL);
  float64x2_t v28 = (float64x2_t)vbslq_s8((int8x16_t)vclezq_f64(vmlaq_n_f64(vmulq_n_f64((float64x2_t)vzip1q_s64((int64x2_t)v113, (int64x2_t)v104), -v115.f64[1]), (float64x2_t)vzip2q_s64((int64x2_t)v113, (int64x2_t)v104), v115.f64[0])), (int8x16_t)v26, (int8x16_t)vsubq_f64(v27, v26));
  int32x2_t v29 = vdup_n_s32(v17);
  v30.i64[0] = v29.u32[0];
  v30.i64[1] = v29.u32[1];
  float64x2_t v31 = (float64x2_t)vbslq_s8((int8x16_t)vcltzq_s64(vshlq_n_s64(v30, 0x3FuLL)), (int8x16_t)vsubq_f64(v27, v28), (int8x16_t)v28);
  __asm { FMOV            V3.2D, #15.0 }
  int8x16_t v37 = vbslq_s8((int8x16_t)vcgtq_f64(_Q3, v31), (int8x16_t)vaddq_f64(v31, v27), (int8x16_t)v31);
  if (vabdd_f64(*(double *)v37.i64, *(double *)&v37.i64[1]) >= 0.100000001)
  {
    if (*(double *)v37.i64 >= *(double *)&v37.i64[1]) {
      return;
    }
  }
  else
  {
    float32x2_t v38 = **(float32x2_t **)(a5 + 16);
    float32x2_t v39 = vsub_f32(v38, v11);
    int32x2_t v40 = (int32x2_t)vmul_f32(v39, v39);
    float32x2_t v41 = vsub_f32(v38, v18);
    int32x2_t v42 = (int32x2_t)vmul_f32(v41, v41);
    int32x2_t v43 = (int32x2_t)vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(v40, v42), (float32x2_t)vzip2_s32(v40, v42)));
    if ((vcgt_f32((float32x2_t)vdup_lane_s32(v43, 1), (float32x2_t)v43).u32[0] & 1) == 0) {
      return;
    }
  }
  float64x2_t v114 = _Q3;
  sub_25B5EA2CC(a3, a4);
  float32x2_t v44 = **(float32x2_t **)(a5 + 8);
  float32x2_t v45 = (float32x2_t)a3[1];
  float64x2_t v111 = vcvtq_f64_f32(vsub_f32(v45, v44));
  float64x2_t v116 = *(float64x2_t *)*(void *)a5;
  int64x2_t v105 = (int64x2_t)vmulq_f64(v116, v116);
  int64x2_t v46 = (int64x2_t)vmulq_f64(v111, v111);
  float64x2_t v47 = vsqrtq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v105, v46), (float64x2_t)vzip2q_s64(v105, v46)));
  double v48 = vaddvq_f64(vmulq_f64(v116, v111)) / fmax(vmulq_laneq_f64(v47, v47, 1).f64[0], 2.22507386e-308);
  if (v48 <= 1.0) {
    double v49 = v48;
  }
  else {
    double v49 = 1.0;
  }
  if (v48 >= -1.0) {
    double v50 = v49;
  }
  else {
    double v50 = -1.0;
  }
  long double v108 = acos(v50);
  unsigned int v51 = *(unsigned char *)(a5 + 24) == 0;
  float32x2_t v52 = (float32x2_t)a2[1];
  float64x2_t v102 = vcvtq_f64_f32(vsub_f32(v52, v44));
  int64x2_t v53 = (int64x2_t)vmulq_f64(v102, v102);
  float64x2_t v54 = vsqrtq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v105, v53), (float64x2_t)vzip2q_s64(v105, v53)));
  double v55 = vaddvq_f64(vmulq_f64(v116, v102)) / fmax(vmulq_laneq_f64(v54, v54, 1).f64[0], 2.22507386e-308);
  if (v55 <= 1.0) {
    double v56 = v55;
  }
  else {
    double v56 = 1.0;
  }
  if (v55 >= -1.0) {
    double v57 = v56;
  }
  else {
    double v57 = -1.0;
  }
  long double v58 = acos(v57);
  v59.f64[0] = v108;
  v59.f64[1] = v58;
  float64x2_t v60 = vdivq_f64(vmulq_f64(v59, (float64x2_t)vdupq_n_s64(0x4066800000000000uLL)), (float64x2_t)vdupq_n_s64(0x400921FB54442D18uLL));
  float64x2_t v61 = (float64x2_t)vdupq_n_s64(0x4076800000000000uLL);
  float64x2_t v62 = (float64x2_t)vbslq_s8((int8x16_t)vclezq_f64(vmlaq_n_f64(vmulq_n_f64((float64x2_t)vzip1q_s64((int64x2_t)v111, (int64x2_t)v102), -v116.f64[1]), (float64x2_t)vzip2q_s64((int64x2_t)v111, (int64x2_t)v102), v116.f64[0])), (int8x16_t)v60, (int8x16_t)vsubq_f64(v61, v60));
  int32x2_t v63 = vdup_n_s32(v51);
  v64.i64[0] = v63.u32[0];
  v64.i64[1] = v63.u32[1];
  float64x2_t v65 = (float64x2_t)vbslq_s8((int8x16_t)vcltzq_s64(vshlq_n_s64(v64, 0x3FuLL)), (int8x16_t)vsubq_f64(v61, v62), (int8x16_t)v62);
  int8x16_t v66 = vbslq_s8((int8x16_t)vcgtq_f64(v114, v65), (int8x16_t)vaddq_f64(v65, v61), (int8x16_t)v65);
  if (vabdd_f64(*(double *)v66.i64, *(double *)&v66.i64[1]) >= 0.100000001)
  {
    if (*(double *)v66.i64 >= *(double *)&v66.i64[1]) {
      return;
    }
  }
  else
  {
    float32x2_t v67 = **(float32x2_t **)(a5 + 16);
    float32x2_t v68 = vsub_f32(v67, v45);
    int32x2_t v69 = (int32x2_t)vmul_f32(v68, v68);
    float32x2_t v70 = vsub_f32(v67, v52);
    int32x2_t v71 = (int32x2_t)vmul_f32(v70, v70);
    int32x2_t v72 = (int32x2_t)vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(v69, v71), (float32x2_t)vzip2_s32(v69, v71)));
    if ((vcgt_f32((float32x2_t)vdup_lane_s32(v72, 1), (float32x2_t)v72).u32[0] & 1) == 0) {
      return;
    }
  }
  sub_25B5EA2CC(a2, a3);
  float32x2_t v73 = **(float32x2_t **)(a5 + 8);
  float32x2_t v74 = (float32x2_t)a2[1];
  float64x2_t v112 = vcvtq_f64_f32(vsub_f32(v74, v73));
  float64x2_t v117 = *(float64x2_t *)*(void *)a5;
  int64x2_t v106 = (int64x2_t)vmulq_f64(v117, v117);
  int64x2_t v75 = (int64x2_t)vmulq_f64(v112, v112);
  float64x2_t v76 = vsqrtq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v106, v75), (float64x2_t)vzip2q_s64(v106, v75)));
  double v77 = vaddvq_f64(vmulq_f64(v117, v112)) / fmax(vmulq_laneq_f64(v76, v76, 1).f64[0], 2.22507386e-308);
  if (v77 <= 1.0) {
    double v78 = v77;
  }
  else {
    double v78 = 1.0;
  }
  if (v77 >= -1.0) {
    double v79 = v78;
  }
  else {
    double v79 = -1.0;
  }
  long double v109 = acos(v79);
  unsigned int v80 = *(unsigned char *)(a5 + 24) == 0;
  float32x2_t v81 = (float32x2_t)a1[1];
  float64x2_t v103 = vcvtq_f64_f32(vsub_f32(v81, v73));
  int64x2_t v82 = (int64x2_t)vmulq_f64(v103, v103);
  float64x2_t v83 = vsqrtq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v106, v82), (float64x2_t)vzip2q_s64(v106, v82)));
  double v84 = vaddvq_f64(vmulq_f64(v117, v103)) / fmax(vmulq_laneq_f64(v83, v83, 1).f64[0], 2.22507386e-308);
  if (v84 <= 1.0) {
    double v85 = v84;
  }
  else {
    double v85 = 1.0;
  }
  if (v84 >= -1.0) {
    double v86 = v85;
  }
  else {
    double v86 = -1.0;
  }
  long double v87 = acos(v86);
  v88.f64[0] = v109;
  v88.f64[1] = v87;
  float64x2_t v89 = vdivq_f64(vmulq_f64(v88, (float64x2_t)vdupq_n_s64(0x4066800000000000uLL)), (float64x2_t)vdupq_n_s64(0x400921FB54442D18uLL));
  float64x2_t v90 = (float64x2_t)vdupq_n_s64(0x4076800000000000uLL);
  float64x2_t v91 = (float64x2_t)vbslq_s8((int8x16_t)vclezq_f64(vmlaq_n_f64(vmulq_n_f64((float64x2_t)vzip1q_s64((int64x2_t)v112, (int64x2_t)v103), -v117.f64[1]), (float64x2_t)vzip2q_s64((int64x2_t)v112, (int64x2_t)v103), v117.f64[0])), (int8x16_t)v89, (int8x16_t)vsubq_f64(v90, v89));
  int32x2_t v92 = vdup_n_s32(v80);
  v93.i64[0] = v92.u32[0];
  v93.i64[1] = v92.u32[1];
  float64x2_t v94 = (float64x2_t)vbslq_s8((int8x16_t)vcltzq_s64(vshlq_n_s64(v93, 0x3FuLL)), (int8x16_t)vsubq_f64(v90, v91), (int8x16_t)v91);
  int8x16_t v95 = vbslq_s8((int8x16_t)vcgtq_f64(v114, v94), (int8x16_t)vaddq_f64(v94, v90), (int8x16_t)v94);
  if (vabdd_f64(*(double *)v95.i64, *(double *)&v95.i64[1]) >= 0.100000001)
  {
    if (*(double *)v95.i64 >= *(double *)&v95.i64[1]) {
      return;
    }
  }
  else
  {
    float32x2_t v96 = **(float32x2_t **)(a5 + 16);
    float32x2_t v97 = vsub_f32(v96, v74);
    int32x2_t v98 = (int32x2_t)vmul_f32(v97, v97);
    float32x2_t v99 = vsub_f32(v96, v81);
    int32x2_t v100 = (int32x2_t)vmul_f32(v99, v99);
    int32x2_t v101 = (int32x2_t)vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(v98, v100), (float32x2_t)vzip2_s32(v98, v100)));
    if ((vcgt_f32((float32x2_t)vdup_lane_s32(v101, 1), (float32x2_t)v101).u32[0] & 1) == 0) {
      return;
    }
  }

  sub_25B5EA2CC(a1, a2);
}

void sub_25B5EB1AC(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5, uint64_t a6)
{
  sub_25B5EAB9C(a1, a2, a3, a4, a6);
  float32x2_t v12 = **(float32x2_t **)(a6 + 8);
  float32x2_t v13 = (float32x2_t)a5[1];
  float64x2_t v148 = vcvtq_f64_f32(vsub_f32(v13, v12));
  float64x2_t v150 = *(float64x2_t *)*(void *)a6;
  int64x2_t v140 = (int64x2_t)vmulq_f64(v150, v150);
  int64x2_t v14 = (int64x2_t)vmulq_f64(v148, v148);
  float64x2_t v15 = vsqrtq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v140, v14), (float64x2_t)vzip2q_s64(v140, v14)));
  double v16 = vaddvq_f64(vmulq_f64(v150, v148)) / fmax(vmulq_laneq_f64(v15, v15, 1).f64[0], 2.22507386e-308);
  if (v16 <= 1.0) {
    double v17 = v16;
  }
  else {
    double v17 = 1.0;
  }
  if (v16 >= -1.0) {
    double v18 = v17;
  }
  else {
    double v18 = -1.0;
  }
  long double v144 = acos(v18);
  unsigned int v19 = *(unsigned char *)(a6 + 24) == 0;
  float32x2_t v20 = (float32x2_t)a4[1];
  float64x2_t v136 = vcvtq_f64_f32(vsub_f32(v20, v12));
  int64x2_t v21 = (int64x2_t)vmulq_f64(v136, v136);
  float64x2_t v22 = vsqrtq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v140, v21), (float64x2_t)vzip2q_s64(v140, v21)));
  double v23 = vaddvq_f64(vmulq_f64(v150, v136)) / fmax(vmulq_laneq_f64(v22, v22, 1).f64[0], 2.22507386e-308);
  if (v23 <= 1.0) {
    double v24 = v23;
  }
  else {
    double v24 = 1.0;
  }
  if (v23 >= -1.0) {
    double v25 = v24;
  }
  else {
    double v25 = -1.0;
  }
  long double v26 = acos(v25);
  v27.f64[0] = v144;
  v27.f64[1] = v26;
  float64x2_t v28 = vdivq_f64(vmulq_f64(v27, (float64x2_t)vdupq_n_s64(0x4066800000000000uLL)), (float64x2_t)vdupq_n_s64(0x400921FB54442D18uLL));
  float64x2_t v29 = (float64x2_t)vdupq_n_s64(0x4076800000000000uLL);
  float64x2_t v30 = (float64x2_t)vbslq_s8((int8x16_t)vclezq_f64(vmlaq_n_f64(vmulq_n_f64((float64x2_t)vzip1q_s64((int64x2_t)v148, (int64x2_t)v136), -v150.f64[1]), (float64x2_t)vzip2q_s64((int64x2_t)v148, (int64x2_t)v136), v150.f64[0])), (int8x16_t)v28, (int8x16_t)vsubq_f64(v29, v28));
  int32x2_t v31 = vdup_n_s32(v19);
  v32.i64[0] = v31.u32[0];
  v32.i64[1] = v31.u32[1];
  float64x2_t v33 = (float64x2_t)vbslq_s8((int8x16_t)vcltzq_s64(vshlq_n_s64(v32, 0x3FuLL)), (int8x16_t)vsubq_f64(v29, v30), (int8x16_t)v30);
  __asm { FMOV            V3.2D, #15.0 }
  int8x16_t v39 = vbslq_s8((int8x16_t)vcgtq_f64(_Q3, v33), (int8x16_t)vaddq_f64(v33, v29), (int8x16_t)v33);
  if (vabdd_f64(*(double *)v39.i64, *(double *)&v39.i64[1]) >= 0.100000001)
  {
    if (*(double *)v39.i64 >= *(double *)&v39.i64[1]) {
      return;
    }
  }
  else
  {
    float32x2_t v40 = **(float32x2_t **)(a6 + 16);
    float32x2_t v41 = vsub_f32(v40, v13);
    int32x2_t v42 = (int32x2_t)vmul_f32(v41, v41);
    float32x2_t v43 = vsub_f32(v40, v20);
    int32x2_t v44 = (int32x2_t)vmul_f32(v43, v43);
    int32x2_t v45 = (int32x2_t)vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(v42, v44), (float32x2_t)vzip2_s32(v42, v44)));
    if ((vcgt_f32((float32x2_t)vdup_lane_s32(v45, 1), (float32x2_t)v45).u32[0] & 1) == 0) {
      return;
    }
  }
  float64x2_t v149 = _Q3;
  sub_25B5EA2CC(a4, a5);
  float32x2_t v46 = **(float32x2_t **)(a6 + 8);
  float32x2_t v47 = (float32x2_t)a4[1];
  float64x2_t v145 = vcvtq_f64_f32(vsub_f32(v47, v46));
  float64x2_t v151 = *(float64x2_t *)*(void *)a6;
  int64x2_t v137 = (int64x2_t)vmulq_f64(v151, v151);
  int64x2_t v48 = (int64x2_t)vmulq_f64(v145, v145);
  float64x2_t v49 = vsqrtq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v137, v48), (float64x2_t)vzip2q_s64(v137, v48)));
  double v50 = vaddvq_f64(vmulq_f64(v151, v145)) / fmax(vmulq_laneq_f64(v49, v49, 1).f64[0], 2.22507386e-308);
  if (v50 <= 1.0) {
    double v51 = v50;
  }
  else {
    double v51 = 1.0;
  }
  if (v50 >= -1.0) {
    double v52 = v51;
  }
  else {
    double v52 = -1.0;
  }
  long double v141 = acos(v52);
  unsigned int v53 = *(unsigned char *)(a6 + 24) == 0;
  float32x2_t v54 = (float32x2_t)a3[1];
  float64x2_t v133 = vcvtq_f64_f32(vsub_f32(v54, v46));
  int64x2_t v55 = (int64x2_t)vmulq_f64(v133, v133);
  float64x2_t v56 = vsqrtq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v137, v55), (float64x2_t)vzip2q_s64(v137, v55)));
  double v57 = vaddvq_f64(vmulq_f64(v151, v133)) / fmax(vmulq_laneq_f64(v56, v56, 1).f64[0], 2.22507386e-308);
  if (v57 <= 1.0) {
    double v58 = v57;
  }
  else {
    double v58 = 1.0;
  }
  if (v57 >= -1.0) {
    double v59 = v58;
  }
  else {
    double v59 = -1.0;
  }
  long double v60 = acos(v59);
  v61.f64[0] = v141;
  v61.f64[1] = v60;
  float64x2_t v62 = vdivq_f64(vmulq_f64(v61, (float64x2_t)vdupq_n_s64(0x4066800000000000uLL)), (float64x2_t)vdupq_n_s64(0x400921FB54442D18uLL));
  float64x2_t v63 = (float64x2_t)vdupq_n_s64(0x4076800000000000uLL);
  float64x2_t v64 = (float64x2_t)vbslq_s8((int8x16_t)vclezq_f64(vmlaq_n_f64(vmulq_n_f64((float64x2_t)vzip1q_s64((int64x2_t)v145, (int64x2_t)v133), -v151.f64[1]), (float64x2_t)vzip2q_s64((int64x2_t)v145, (int64x2_t)v133), v151.f64[0])), (int8x16_t)v62, (int8x16_t)vsubq_f64(v63, v62));
  int32x2_t v65 = vdup_n_s32(v53);
  v66.i64[0] = v65.u32[0];
  v66.i64[1] = v65.u32[1];
  float64x2_t v67 = (float64x2_t)vbslq_s8((int8x16_t)vcltzq_s64(vshlq_n_s64(v66, 0x3FuLL)), (int8x16_t)vsubq_f64(v63, v64), (int8x16_t)v64);
  int8x16_t v68 = vbslq_s8((int8x16_t)vcgtq_f64(v149, v67), (int8x16_t)vaddq_f64(v67, v63), (int8x16_t)v67);
  if (vabdd_f64(*(double *)v68.i64, *(double *)&v68.i64[1]) >= 0.100000001)
  {
    if (*(double *)v68.i64 >= *(double *)&v68.i64[1]) {
      return;
    }
  }
  else
  {
    float32x2_t v69 = **(float32x2_t **)(a6 + 16);
    float32x2_t v70 = vsub_f32(v69, v47);
    int32x2_t v71 = (int32x2_t)vmul_f32(v70, v70);
    float32x2_t v72 = vsub_f32(v69, v54);
    int32x2_t v73 = (int32x2_t)vmul_f32(v72, v72);
    int32x2_t v74 = (int32x2_t)vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(v71, v73), (float32x2_t)vzip2_s32(v71, v73)));
    if ((vcgt_f32((float32x2_t)vdup_lane_s32(v74, 1), (float32x2_t)v74).u32[0] & 1) == 0) {
      return;
    }
  }
  sub_25B5EA2CC(a3, a4);
  float32x2_t v75 = **(float32x2_t **)(a6 + 8);
  float32x2_t v76 = (float32x2_t)a3[1];
  float64x2_t v146 = vcvtq_f64_f32(vsub_f32(v76, v75));
  float64x2_t v152 = *(float64x2_t *)*(void *)a6;
  int64x2_t v138 = (int64x2_t)vmulq_f64(v152, v152);
  int64x2_t v77 = (int64x2_t)vmulq_f64(v146, v146);
  float64x2_t v78 = vsqrtq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v138, v77), (float64x2_t)vzip2q_s64(v138, v77)));
  double v79 = vaddvq_f64(vmulq_f64(v152, v146)) / fmax(vmulq_laneq_f64(v78, v78, 1).f64[0], 2.22507386e-308);
  if (v79 <= 1.0) {
    double v80 = v79;
  }
  else {
    double v80 = 1.0;
  }
  if (v79 >= -1.0) {
    double v81 = v80;
  }
  else {
    double v81 = -1.0;
  }
  long double v142 = acos(v81);
  unsigned int v82 = *(unsigned char *)(a6 + 24) == 0;
  float32x2_t v83 = (float32x2_t)a2[1];
  float64x2_t v134 = vcvtq_f64_f32(vsub_f32(v83, v75));
  int64x2_t v84 = (int64x2_t)vmulq_f64(v134, v134);
  float64x2_t v85 = vsqrtq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v138, v84), (float64x2_t)vzip2q_s64(v138, v84)));
  double v86 = vaddvq_f64(vmulq_f64(v152, v134)) / fmax(vmulq_laneq_f64(v85, v85, 1).f64[0], 2.22507386e-308);
  if (v86 <= 1.0) {
    double v87 = v86;
  }
  else {
    double v87 = 1.0;
  }
  if (v86 >= -1.0) {
    double v88 = v87;
  }
  else {
    double v88 = -1.0;
  }
  long double v89 = acos(v88);
  v90.f64[0] = v142;
  v90.f64[1] = v89;
  float64x2_t v91 = vdivq_f64(vmulq_f64(v90, (float64x2_t)vdupq_n_s64(0x4066800000000000uLL)), (float64x2_t)vdupq_n_s64(0x400921FB54442D18uLL));
  float64x2_t v92 = (float64x2_t)vdupq_n_s64(0x4076800000000000uLL);
  float64x2_t v93 = (float64x2_t)vbslq_s8((int8x16_t)vclezq_f64(vmlaq_n_f64(vmulq_n_f64((float64x2_t)vzip1q_s64((int64x2_t)v146, (int64x2_t)v134), -v152.f64[1]), (float64x2_t)vzip2q_s64((int64x2_t)v146, (int64x2_t)v134), v152.f64[0])), (int8x16_t)v91, (int8x16_t)vsubq_f64(v92, v91));
  int32x2_t v94 = vdup_n_s32(v82);
  v95.i64[0] = v94.u32[0];
  v95.i64[1] = v94.u32[1];
  float64x2_t v96 = (float64x2_t)vbslq_s8((int8x16_t)vcltzq_s64(vshlq_n_s64(v95, 0x3FuLL)), (int8x16_t)vsubq_f64(v92, v93), (int8x16_t)v93);
  int8x16_t v97 = vbslq_s8((int8x16_t)vcgtq_f64(v149, v96), (int8x16_t)vaddq_f64(v96, v92), (int8x16_t)v96);
  if (vabdd_f64(*(double *)v97.i64, *(double *)&v97.i64[1]) >= 0.100000001)
  {
    if (*(double *)v97.i64 >= *(double *)&v97.i64[1]) {
      return;
    }
  }
  else
  {
    float32x2_t v98 = **(float32x2_t **)(a6 + 16);
    float32x2_t v99 = vsub_f32(v98, v76);
    int32x2_t v100 = (int32x2_t)vmul_f32(v99, v99);
    float32x2_t v101 = vsub_f32(v98, v83);
    int32x2_t v102 = (int32x2_t)vmul_f32(v101, v101);
    int32x2_t v103 = (int32x2_t)vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(v100, v102), (float32x2_t)vzip2_s32(v100, v102)));
    if ((vcgt_f32((float32x2_t)vdup_lane_s32(v103, 1), (float32x2_t)v103).u32[0] & 1) == 0) {
      return;
    }
  }
  sub_25B5EA2CC(a2, a3);
  float32x2_t v104 = **(float32x2_t **)(a6 + 8);
  float32x2_t v105 = (float32x2_t)a2[1];
  float64x2_t v147 = vcvtq_f64_f32(vsub_f32(v105, v104));
  float64x2_t v153 = *(float64x2_t *)*(void *)a6;
  int64x2_t v139 = (int64x2_t)vmulq_f64(v153, v153);
  int64x2_t v106 = (int64x2_t)vmulq_f64(v147, v147);
  float64x2_t v107 = vsqrtq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v139, v106), (float64x2_t)vzip2q_s64(v139, v106)));
  double v108 = vaddvq_f64(vmulq_f64(v153, v147)) / fmax(vmulq_laneq_f64(v107, v107, 1).f64[0], 2.22507386e-308);
  if (v108 <= 1.0) {
    double v109 = v108;
  }
  else {
    double v109 = 1.0;
  }
  if (v108 >= -1.0) {
    double v110 = v109;
  }
  else {
    double v110 = -1.0;
  }
  long double v143 = acos(v110);
  unsigned int v111 = *(unsigned char *)(a6 + 24) == 0;
  float32x2_t v112 = (float32x2_t)a1[1];
  float64x2_t v135 = vcvtq_f64_f32(vsub_f32(v112, v104));
  int64x2_t v113 = (int64x2_t)vmulq_f64(v135, v135);
  float64x2_t v114 = vsqrtq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v139, v113), (float64x2_t)vzip2q_s64(v139, v113)));
  double v115 = vaddvq_f64(vmulq_f64(v153, v135)) / fmax(vmulq_laneq_f64(v114, v114, 1).f64[0], 2.22507386e-308);
  if (v115 <= 1.0) {
    double v116 = v115;
  }
  else {
    double v116 = 1.0;
  }
  if (v115 >= -1.0) {
    double v117 = v116;
  }
  else {
    double v117 = -1.0;
  }
  long double v118 = acos(v117);
  v119.f64[0] = v143;
  v119.f64[1] = v118;
  float64x2_t v120 = vdivq_f64(vmulq_f64(v119, (float64x2_t)vdupq_n_s64(0x4066800000000000uLL)), (float64x2_t)vdupq_n_s64(0x400921FB54442D18uLL));
  float64x2_t v121 = (float64x2_t)vdupq_n_s64(0x4076800000000000uLL);
  float64x2_t v122 = (float64x2_t)vbslq_s8((int8x16_t)vclezq_f64(vmlaq_n_f64(vmulq_n_f64((float64x2_t)vzip1q_s64((int64x2_t)v147, (int64x2_t)v135), -v153.f64[1]), (float64x2_t)vzip2q_s64((int64x2_t)v147, (int64x2_t)v135), v153.f64[0])), (int8x16_t)v120, (int8x16_t)vsubq_f64(v121, v120));
  int32x2_t v123 = vdup_n_s32(v111);
  v124.i64[0] = v123.u32[0];
  v124.i64[1] = v123.u32[1];
  float64x2_t v125 = (float64x2_t)vbslq_s8((int8x16_t)vcltzq_s64(vshlq_n_s64(v124, 0x3FuLL)), (int8x16_t)vsubq_f64(v121, v122), (int8x16_t)v122);
  int8x16_t v126 = vbslq_s8((int8x16_t)vcgtq_f64(v149, v125), (int8x16_t)vaddq_f64(v125, v121), (int8x16_t)v125);
  if (vabdd_f64(*(double *)v126.i64, *(double *)&v126.i64[1]) >= 0.100000001)
  {
    if (*(double *)v126.i64 >= *(double *)&v126.i64[1]) {
      return;
    }
  }
  else
  {
    float32x2_t v127 = **(float32x2_t **)(a6 + 16);
    float32x2_t v128 = vsub_f32(v127, v105);
    int32x2_t v129 = (int32x2_t)vmul_f32(v128, v128);
    float32x2_t v130 = vsub_f32(v127, v112);
    int32x2_t v131 = (int32x2_t)vmul_f32(v130, v130);
    int32x2_t v132 = (int32x2_t)vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(v129, v131), (float32x2_t)vzip2_s32(v129, v131)));
    if ((vcgt_f32((float32x2_t)vdup_lane_s32(v132, 1), (float32x2_t)v132).u32[0] & 1) == 0) {
      return;
    }
  }

  sub_25B5EA2CC(a1, a2);
}

uint64_t sub_25B5EB994(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  BOOL v6 = 1;
  switch(0xAAAAAAAAAAAAAAABLL * (((char *)a2 - (char *)a1) >> 4))
  {
    case 0uLL:
    case 1uLL:
      return v6;
    case 2uLL:
      float32x2_t v7 = **(float32x2_t **)(a3 + 8);
      float32x2_t v8 = (float32x2_t)*(a2 - 5);
      float64x2_t v120 = vcvtq_f64_f32(vsub_f32(v8, v7));
      float64x2_t v123 = *(float64x2_t *)*(void *)a3;
      int64x2_t v114 = (int64x2_t)vmulq_f64(v123, v123);
      int64x2_t v9 = (int64x2_t)vmulq_f64(v120, v120);
      float64x2_t v10 = vsqrtq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v114, v9), (float64x2_t)vzip2q_s64(v114, v9)));
      double v11 = vaddvq_f64(vmulq_f64(v123, v120)) / fmax(vmulq_laneq_f64(v10, v10, 1).f64[0], 2.22507386e-308);
      if (v11 <= 1.0) {
        double v12 = v11;
      }
      else {
        double v12 = 1.0;
      }
      if (v11 >= -1.0) {
        double v13 = v12;
      }
      else {
        double v13 = -1.0;
      }
      long double v117 = acos(v13);
      unsigned int v14 = *(unsigned char *)(a3 + 24) == 0;
      float32x2_t v15 = (float32x2_t)a1[1];
      float64x2_t v111 = vcvtq_f64_f32(vsub_f32(v15, v7));
      int64x2_t v16 = (int64x2_t)vmulq_f64(v111, v111);
      float64x2_t v17 = vsqrtq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v114, v16), (float64x2_t)vzip2q_s64(v114, v16)));
      double v18 = vaddvq_f64(vmulq_f64(v123, v111)) / fmax(vmulq_laneq_f64(v17, v17, 1).f64[0], 2.22507386e-308);
      if (v18 <= 1.0) {
        double v19 = v18;
      }
      else {
        double v19 = 1.0;
      }
      if (v18 >= -1.0) {
        double v20 = v19;
      }
      else {
        double v20 = -1.0;
      }
      long double v21 = acos(v20);
      v22.f64[0] = v117;
      v22.f64[1] = v21;
      float64x2_t v23 = vdivq_f64(vmulq_f64(v22, (float64x2_t)vdupq_n_s64(0x4066800000000000uLL)), (float64x2_t)vdupq_n_s64(0x400921FB54442D18uLL));
      float64x2_t v24 = (float64x2_t)vdupq_n_s64(0x4076800000000000uLL);
      float64x2_t v25 = (float64x2_t)vbslq_s8((int8x16_t)vclezq_f64(vmlaq_n_f64(vmulq_n_f64((float64x2_t)vzip1q_s64((int64x2_t)v120, (int64x2_t)v111), -v123.f64[1]), (float64x2_t)vzip2q_s64((int64x2_t)v120, (int64x2_t)v111), v123.f64[0])), (int8x16_t)v23, (int8x16_t)vsubq_f64(v24, v23));
      int32x2_t v26 = vdup_n_s32(v14);
      v27.i64[0] = v26.u32[0];
      v27.i64[1] = v26.u32[1];
      float64x2_t v28 = (float64x2_t)vbslq_s8((int8x16_t)vcltzq_s64(vshlq_n_s64(v27, 0x3FuLL)), (int8x16_t)vsubq_f64(v24, v25), (int8x16_t)v25);
      __asm { FMOV            V1.2D, #15.0 }
      int8x16_t v34 = vbslq_s8((int8x16_t)vcgtq_f64(_Q1, v28), (int8x16_t)vaddq_f64(v28, v24), (int8x16_t)v28);
      if (vabdd_f64(*(double *)v34.i64, *(double *)&v34.i64[1]) >= 0.100000001)
      {
        if (*(double *)v34.i64 >= *(double *)&v34.i64[1]) {
          return 1;
        }
      }
      else
      {
        float32x2_t v35 = **(float32x2_t **)(a3 + 16);
        float32x2_t v36 = vsub_f32(v35, v8);
        int32x2_t v37 = (int32x2_t)vmul_f32(v36, v36);
        float32x2_t v38 = vsub_f32(v35, v15);
        int32x2_t v39 = (int32x2_t)vmul_f32(v38, v38);
        int32x2_t v40 = (int32x2_t)vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(v37, v39), (float32x2_t)vzip2_s32(v37, v39)));
        if ((vcgt_f32((float32x2_t)vdup_lane_s32(v40, 1), (float32x2_t)v40).u32[0] & 1) == 0) {
          return 1;
        }
      }
      sub_25B5EA2CC(a1, a2 - 6);
      return 1;
    case 3uLL:
      sub_25B5EA360(a1, a1 + 6, a2 - 6, a3);
      return v6;
    case 4uLL:
      sub_25B5EAB9C(a1, a1 + 6, a1 + 12, a2 - 6, a3);
      return v6;
    case 5uLL:
      sub_25B5EB1AC(a1, a1 + 6, a1 + 12, a1 + 18, a2 - 6, a3);
      return v6;
    default:
      float32x2_t v41 = (float32x2_t *)(a1 + 12);
      sub_25B5EA360(a1, a1 + 6, a1 + 12, a3);
      int32x2_t v42 = a1 + 18;
      if (a1 + 18 == a2) {
        return 1;
      }
      uint64_t v43 = 0;
      int v44 = 0;
      float64x2_t v109 = (float64x2_t)vdupq_n_s64(0x400921FB54442D18uLL);
      float64x2_t v110 = (float64x2_t)vdupq_n_s64(0x4066800000000000uLL);
      float64x2_t v108 = (float64x2_t)vdupq_n_s64(0x4076800000000000uLL);
      __asm { FMOV            V0.2D, #15.0 }
      float64x2_t v107 = _Q0;
      break;
  }
  while (1)
  {
    float32x2_t v46 = **(float32x2_t **)(a3 + 8);
    float32x2_t v47 = (float32x2_t)v42[1];
    float64x2_t v121 = vcvtq_f64_f32(vsub_f32(v47, v46));
    float64x2_t v124 = *(float64x2_t *)*(void *)a3;
    int64x2_t v115 = (int64x2_t)vmulq_f64(v124, v124);
    int64x2_t v48 = (int64x2_t)vmulq_f64(v121, v121);
    float64x2_t v49 = vsqrtq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v115, v48), (float64x2_t)vzip2q_s64(v115, v48)));
    double v50 = vaddvq_f64(vmulq_f64(v124, v121)) / fmax(vmulq_laneq_f64(v49, v49, 1).f64[0], 2.22507386e-308);
    double v51 = v50 <= 1.0 ? v50 : 1.0;
    double v52 = v50 >= -1.0 ? v51 : -1.0;
    long double v118 = acos(v52);
    unsigned int v53 = *(unsigned char *)(a3 + 24) == 0;
    float32x2_t v54 = v41[1];
    float64x2_t v112 = vcvtq_f64_f32(vsub_f32(v54, v46));
    int64x2_t v55 = (int64x2_t)vmulq_f64(v112, v112);
    float64x2_t v56 = vsqrtq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v115, v55), (float64x2_t)vzip2q_s64(v115, v55)));
    double v57 = vaddvq_f64(vmulq_f64(v124, v112)) / fmax(vmulq_laneq_f64(v56, v56, 1).f64[0], 2.22507386e-308);
    double v58 = v57 <= 1.0 ? v57 : 1.0;
    double v59 = v57 >= -1.0 ? v58 : -1.0;
    long double v60 = acos(v59);
    v61.f64[0] = v118;
    v61.f64[1] = v60;
    float64x2_t v62 = vdivq_f64(vmulq_f64(v61, v110), v109);
    float64x2_t v63 = (float64x2_t)vbslq_s8((int8x16_t)vclezq_f64(vmlaq_n_f64(vmulq_n_f64((float64x2_t)vzip1q_s64((int64x2_t)v121, (int64x2_t)v112), -v124.f64[1]), (float64x2_t)vzip2q_s64((int64x2_t)v121, (int64x2_t)v112), v124.f64[0])), (int8x16_t)v62, (int8x16_t)vsubq_f64(v108, v62));
    int32x2_t v64 = vdup_n_s32(v53);
    v65.i64[0] = v64.u32[0];
    v65.i64[1] = v64.u32[1];
    float64x2_t v66 = (float64x2_t)vbslq_s8((int8x16_t)vcltzq_s64(vshlq_n_s64(v65, 0x3FuLL)), (int8x16_t)vsubq_f64(v108, v63), (int8x16_t)v63);
    int8x16_t v67 = vbslq_s8((int8x16_t)vcgtq_f64(v107, v66), (int8x16_t)vaddq_f64(v66, v108), (int8x16_t)v66);
    if (vabdd_f64(*(double *)v67.i64, *(double *)&v67.i64[1]) >= 0.100000001) {
      break;
    }
    float32x2_t v68 = **(float32x2_t **)(a3 + 16);
    float32x2_t v69 = vsub_f32(v68, v47);
    int32x2_t v70 = (int32x2_t)vmul_f32(v69, v69);
    float32x2_t v71 = vsub_f32(v68, v54);
    int32x2_t v72 = (int32x2_t)vmul_f32(v71, v71);
    int32x2_t v73 = (int32x2_t)vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(v70, v72), (float32x2_t)vzip2_s32(v70, v72)));
    if (vcgt_f32((float32x2_t)vdup_lane_s32(v73, 1), (float32x2_t)v73).u32[0]) {
      goto LABEL_35;
    }
LABEL_58:
    float32x2_t v41 = (float32x2_t *)v42;
    v43 += 48;
    v42 += 6;
    if (v42 == a2) {
      return 1;
    }
  }
  if (*(double *)v67.i64 >= *(double *)&v67.i64[1]) {
    goto LABEL_58;
  }
LABEL_35:
  uint64_t v126 = *v42;
  sub_25B4C9CE4((uint64_t)v127, (uint64_t)(v42 + 1));
  for (uint64_t i = v43; ; i -= 48)
  {
    *(uint64_t *)((char *)a1 + i + 144) = *(uint64_t *)((char *)a1 + i + 96);
    sub_25B576A98((uint64_t)v129, (uint64_t)a1 + i + 152, (uint64_t)a1 + i + 104);
    sub_25B400248(v130);
    if (i == -96)
    {
      uint64_t v104 = (uint64_t)(a1 + 1);
      float32x2_t v105 = a1;
      goto LABEL_56;
    }
    float32x2_t v75 = *(float32x2_t **)(a3 + 8);
    float32x2_t v76 = *v75;
    float32x2_t v77 = v127[0];
    float64x2_t v122 = vcvtq_f64_f32(vsub_f32(v127[0], *v75));
    float64x2_t v125 = *(float64x2_t *)*(void *)a3;
    int64x2_t v116 = (int64x2_t)vmulq_f64(v125, v125);
    int64x2_t v78 = (int64x2_t)vmulq_f64(v122, v122);
    float64x2_t v79 = vsqrtq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v116, v78), (float64x2_t)vzip2q_s64(v116, v78)));
    double v80 = vaddvq_f64(vmulq_f64(v125, v122)) / fmax(vmulq_laneq_f64(v79, v79, 1).f64[0], 2.22507386e-308);
    double v81 = v80 <= 1.0 ? v80 : 1.0;
    double v82 = v80 >= -1.0 ? v81 : -1.0;
    long double v119 = acos(v82);
    unsigned int v83 = *(unsigned char *)(a3 + 24) == 0;
    float32x2_t v84 = *(float32x2_t *)((char *)a1 + i + 56);
    float64x2_t v113 = vcvtq_f64_f32(vsub_f32(v84, v76));
    int64x2_t v85 = (int64x2_t)vmulq_f64(v113, v113);
    float64x2_t v86 = vsqrtq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v116, v85), (float64x2_t)vzip2q_s64(v116, v85)));
    double v87 = vaddvq_f64(vmulq_f64(v125, v113)) / fmax(vmulq_laneq_f64(v86, v86, 1).f64[0], 2.22507386e-308);
    double v88 = v87 <= 1.0 ? v87 : 1.0;
    double v89 = v87 >= -1.0 ? v88 : -1.0;
    long double v90 = acos(v89);
    v91.f64[0] = v119;
    v91.f64[1] = v90;
    float64x2_t v92 = vdivq_f64(vmulq_f64(v91, v110), v109);
    float64x2_t v93 = (float64x2_t)vbslq_s8((int8x16_t)vclezq_f64(vmlaq_n_f64(vmulq_n_f64((float64x2_t)vzip1q_s64((int64x2_t)v122, (int64x2_t)v113), -v125.f64[1]), (float64x2_t)vzip2q_s64((int64x2_t)v122, (int64x2_t)v113), v125.f64[0])), (int8x16_t)v92, (int8x16_t)vsubq_f64(v108, v92));
    int32x2_t v94 = vdup_n_s32(v83);
    v95.i64[0] = v94.u32[0];
    v95.i64[1] = v94.u32[1];
    float64x2_t v96 = (float64x2_t)vbslq_s8((int8x16_t)vcltzq_s64(vshlq_n_s64(v95, 0x3FuLL)), (int8x16_t)vsubq_f64(v108, v93), (int8x16_t)v93);
    int8x16_t v97 = vbslq_s8((int8x16_t)vcgtq_f64(v107, v96), (int8x16_t)vaddq_f64(v96, v108), (int8x16_t)v96);
    if (vabdd_f64(*(double *)v97.i64, *(double *)&v97.i64[1]) >= 0.100000001) {
      break;
    }
    float32x2_t v98 = **(float32x2_t **)(a3 + 16);
    float32x2_t v99 = vsub_f32(v98, v77);
    int32x2_t v100 = (int32x2_t)vmul_f32(v99, v99);
    float32x2_t v101 = vsub_f32(v98, v84);
    int32x2_t v102 = (int32x2_t)vmul_f32(v101, v101);
    int32x2_t v103 = (int32x2_t)vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(v100, v102), (float32x2_t)vzip2_s32(v100, v102)));
    if ((vcgt_f32((float32x2_t)vdup_lane_s32(v103, 1), (float32x2_t)v103).u8[0] & 1) == 0) {
      goto LABEL_55;
    }
LABEL_53:
    ;
  }
  if (*(double *)v97.i64 < *(double *)&v97.i64[1]) {
    goto LABEL_53;
  }
LABEL_55:
  float32x2_t v105 = (uint64_t *)((char *)a1 + i + 96);
  uint64_t v104 = (uint64_t)a1 + i + 104;
LABEL_56:
  uint64_t *v105 = v126;
  sub_25B576A98((uint64_t)v129, v104, (uint64_t)v127);
  sub_25B400248(v130);
  if (++v44 != 8)
  {
    sub_25B400248(v128);
    goto LABEL_58;
  }
  BOOL v6 = v42 + 6 == a2;
  sub_25B400248(v128);
  return v6;
}

void sub_25B5EC0F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char *a34)
{
}

void sub_25B5EC124(uint64_t a1)
{
}

void sub_25B5EC12C(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_2708F2740;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x261163EE0);
}

void sub_25B5EC180(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_2708F2740;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_25B5EC1A0(void **a1)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a1[1];
  uint64_t v4 = (unsigned char *)a1[3] - (unsigned char *)*a1;
  unint64_t v5 = (v2 - v3) >> 3;
  if (v5 >= v4 >> 3) {
    return;
  }
  if (v2 == v3)
  {
    int64x2_t v9 = 0;
    BOOL v6 = 0;
    goto LABEL_8;
  }
  BOOL v6 = (char *)sub_25B3FCAD4(v5);
  float32x2_t v7 = a1[1];
  uint64_t v2 = a1[2];
  int64x2_t v9 = &v6[8 * v8];
  uint64_t v10 = v2 - v7;
  if (v2 == v7)
  {
LABEL_8:
    double v13 = v2;
    goto LABEL_9;
  }
  uint64_t v11 = 0;
  uint64_t v12 = 8 * (v10 >> 3);
  do
  {
    *(void *)&v6[v11] = *(void *)&v7[v11];
    v11 += 8;
  }
  while (v12 != v11);
  uint64_t v2 = a1[1];
  double v13 = a1[2];
LABEL_9:
  int64_t v14 = v13 - v2;
  float32x2_t v15 = *a1;
  *a1 = v6;
  a1[1] = v6;
  a1[2] = &v6[v14];
  a1[3] = v9;
  if (v15)
  {
    operator delete(v15);
  }
}

void sub_25B5EC270(uint64_t a1, char a2)
{
  unint64_t v3 = *(void *)(a1 + 32);
  if (v3 < 0x55) {
    a2 = 1;
  }
  if (v3 > 0xA9 || (a2 & 1) == 0)
  {
    operator delete(**(void ***)(a1 + 8));
    *(void *)(a1 + 8) += 8;
    *(void *)(a1 + 32) -= 85;
  }
}

void sub_25B5EC2CC(void *a1, char a2)
{
  uint64_t v4 = a1[1];
  uint64_t v3 = a1[2];
  if (v3 == v4) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = 85 * ((v3 - v4) >> 3) - 1;
  }
  unint64_t v6 = v5 - (a1[5] + a1[4]);
  if (v6 < 0x55) {
    a2 = 1;
  }
  if (v6 > 0xA9 || (a2 & 1) == 0)
  {
    operator delete(*(void **)(v3 - 8));
    a1[2] -= 8;
  }
}

void sub_25B5EC340(void *a1)
{
  unint64_t v2 = a1[4];
  BOOL v3 = v2 >= 0x55;
  unint64_t v4 = v2 - 85;
  if (v3)
  {
    a1[4] = v4;
    uint64_t v5 = (void *)a1[1];
    unint64_t v6 = (char *)a1[2];
    uint64_t v9 = *v5;
    float32x2_t v7 = (char *)(v5 + 1);
    uint64_t v8 = v9;
    a1[1] = v7;
    if (v6 != (char *)a1[3])
    {
LABEL_31:
      *(void *)unint64_t v6 = v8;
      a1[2] += 8;
      return;
    }
    uint64_t v10 = (uint64_t)&v7[-*a1];
    if ((unint64_t)v7 <= *a1)
    {
      if (v6 == (char *)*a1) {
        unint64_t v28 = 1;
      }
      else {
        unint64_t v28 = (uint64_t)&v6[-*a1] >> 2;
      }
      float64x2_t v29 = (char *)sub_25B3FCAD4(v28);
      float64x2_t v30 = &v29[8 * (v28 >> 2)];
      int64x2_t v32 = &v29[8 * v31];
      float64x2_t v33 = (uint64_t *)a1[1];
      unint64_t v6 = v30;
      uint64_t v34 = a1[2] - (void)v33;
      if (v34)
      {
        unint64_t v6 = &v30[v34 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v35 = 8 * (v34 >> 3);
        float32x2_t v36 = &v29[8 * (v28 >> 2)];
        do
        {
          uint64_t v37 = *v33++;
          *(void *)float32x2_t v36 = v37;
          v36 += 8;
          v35 -= 8;
        }
        while (v35);
      }
      goto LABEL_28;
    }
LABEL_5:
    uint64_t v11 = v10 >> 3;
    BOOL v12 = v10 >> 3 < -1;
    uint64_t v13 = (v10 >> 3) + 2;
    if (v12) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = v11 + 1;
    }
    uint64_t v15 = -(v14 >> 1);
    uint64_t v16 = v14 >> 1;
    float64x2_t v17 = &v7[-8 * v16];
    int64_t v18 = v6 - v7;
    if (v6 != v7)
    {
      memmove(&v7[-8 * v16], v7, v6 - v7);
      float32x2_t v7 = (char *)a1[1];
    }
    unint64_t v6 = &v17[v18];
    a1[1] = &v7[8 * v15];
    a1[2] = &v17[v18];
    goto LABEL_31;
  }
  uint64_t v19 = a1[2];
  unint64_t v20 = (v19 - a1[1]) >> 3;
  uint64_t v21 = a1[3];
  uint64_t v22 = v21 - *a1;
  if (v20 < v22 >> 3)
  {
    if (v21 != v19)
    {
      *(void *)&long long v49 = operator new(0xFF0uLL);
      sub_25B468624(a1, &v49);
      return;
    }
    *(void *)&long long v49 = operator new(0xFF0uLL);
    sub_25B46850C((uint64_t)a1, &v49);
    int32x2_t v39 = (void *)a1[1];
    unint64_t v6 = (char *)a1[2];
    uint64_t v40 = *v39;
    float32x2_t v7 = (char *)(v39 + 1);
    uint64_t v8 = v40;
    a1[1] = v7;
    if (v6 != (char *)a1[3]) {
      goto LABEL_31;
    }
    uint64_t v10 = (uint64_t)&v7[-*a1];
    if ((unint64_t)v7 <= *a1)
    {
      if (v6 == (char *)*a1) {
        unint64_t v41 = 1;
      }
      else {
        unint64_t v41 = (uint64_t)&v6[-*a1] >> 2;
      }
      float64x2_t v29 = (char *)sub_25B3FCAD4(v41);
      float64x2_t v30 = &v29[8 * (v41 >> 2)];
      int64x2_t v32 = &v29[8 * v42];
      uint64_t v43 = (uint64_t *)a1[1];
      unint64_t v6 = v30;
      uint64_t v44 = a1[2] - (void)v43;
      if (v44)
      {
        unint64_t v6 = &v30[v44 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v45 = 8 * (v44 >> 3);
        float32x2_t v46 = &v29[8 * (v41 >> 2)];
        do
        {
          uint64_t v47 = *v43++;
          *(void *)float32x2_t v46 = v47;
          v46 += 8;
          v45 -= 8;
        }
        while (v45);
      }
LABEL_28:
      float32x2_t v38 = (char *)*a1;
      *a1 = v29;
      a1[1] = v30;
      a1[2] = v6;
      a1[3] = v32;
      if (v38)
      {
        operator delete(v38);
        unint64_t v6 = (char *)a1[2];
      }
      goto LABEL_31;
    }
    goto LABEL_5;
  }
  if (v21 == *a1) {
    unint64_t v23 = 1;
  }
  else {
    unint64_t v23 = v22 >> 2;
  }
  double v51 = a1 + 3;
  *(void *)&long long v49 = sub_25B3FCAD4(v23);
  *((void *)&v49 + 1) = v49 + 8 * v20;
  *(void *)&long long v50 = *((void *)&v49 + 1);
  *((void *)&v50 + 1) = v49 + 8 * v24;
  int64x2_t v48 = operator new(0xFF0uLL);
  sub_25B468624(&v49, &v48);
  for (uint64_t i = (void *)a1[2]; i != (void *)a1[1]; sub_25B46850C((uint64_t)&v49, i))
    --i;
  int32x2_t v26 = (char *)*a1;
  long long v27 = v50;
  *(_OWORD *)a1 = v49;
  *((_OWORD *)a1 + 1) = v27;
  if (v26) {
    operator delete(v26);
  }
}

void sub_25B5EC5C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p)
{
  operator delete(v11);
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_25B5EC5F4(float32x2_t *a1, float32x2_t *a2, uint64_t a3, char a4)
{
void sub_25B5ED15C(_Unwind_Exception *a1)
{
  sub_25B400248(*(char **)(v1 - 112));
  _Unwind_Resume(a1);
}

void sub_25B5ED1D4(uint64_t a1, uint64_t a2)
{
  sub_25B4C9CE4((uint64_t)v8, a1);
  sub_25B576A98((uint64_t)v6, a1, a2);
  sub_25B400248(v7);
  sub_25B576A98((uint64_t)v4, a2, (uint64_t)v8);
  sub_25B400248(v5);
  sub_25B400248(v9);
}

void sub_25B5ED244(_Unwind_Exception *a1)
{
  sub_25B400248(*(char **)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_25B5ED258(float32x2_t *a1, float32x2_t *a2, float32x2_t *a3)
{
  BOOL v5 = a1;
  LODWORD(v6) = HIDWORD(*(unint64_t *)a2);
  LODWORD(v7) = HIDWORD(*(unint64_t *)a1);
  unsigned __int8 v8 = vcgt_f32(*a1, *a2).u8[0];
  if (v6 != v7) {
    unsigned __int8 v8 = v6 < v7;
  }
  LODWORD(v9) = HIDWORD(*(unint64_t *)a3);
  BOOL v10 = v9 < v6;
  unsigned __int8 v11 = vcgt_f32(*a2, *a3).u8[0];
  if (v9 == v6) {
    BOOL v10 = v11;
  }
  if (v8)
  {
    if (v10)
    {
LABEL_11:
      uint64_t v16 = (uint64_t)a3;
LABEL_17:
      sub_25B5ED1D4((uint64_t)a1, v16);
      return;
    }
    sub_25B5ED1D4((uint64_t)a1, (uint64_t)a2);
    LODWORD(v12) = HIDWORD(*(unint64_t *)a3);
    LODWORD(v13) = HIDWORD(*(unint64_t *)a2);
    BOOL v14 = v12 < v13;
    unsigned __int8 v15 = vcgt_f32(*a2, *a3).u8[0];
    if (v12 == v13) {
      BOOL v14 = v15;
    }
    if (v14)
    {
      a1 = a2;
      goto LABEL_11;
    }
  }
  else if (v10)
  {
    sub_25B5ED1D4((uint64_t)a2, (uint64_t)a3);
    LODWORD(v17) = HIDWORD(*(unint64_t *)a2);
    LODWORD(v18) = HIDWORD(*(unint64_t *)v5);
    BOOL v19 = v17 < v18;
    unsigned __int8 v20 = vcgt_f32(*v5, *a2).u8[0];
    if (v17 == v18) {
      BOOL v19 = v20;
    }
    if (v19)
    {
      a1 = v5;
      uint64_t v16 = (uint64_t)a2;
      goto LABEL_17;
    }
  }
}

void sub_25B5ED370(float32x2_t *a1, float32x2_t *a2, float32x2_t *a3, float32x2_t *a4)
{
  sub_25B5ED258(a1, a2, a3);
  LODWORD(v8) = HIDWORD(*(unint64_t *)a4);
  LODWORD(v9) = HIDWORD(*(unint64_t *)a3);
  BOOL v10 = v8 < v9;
  unsigned __int8 v11 = vcgt_f32(*a3, *a4).u8[0];
  if (v8 == v9) {
    BOOL v10 = v11;
  }
  if (v10)
  {
    sub_25B5ED1D4((uint64_t)a3, (uint64_t)a4);
    LODWORD(v12) = HIDWORD(*(unint64_t *)a3);
    LODWORD(v13) = HIDWORD(*(unint64_t *)a2);
    BOOL v14 = v12 < v13;
    unsigned __int8 v15 = vcgt_f32(*a2, *a3).u8[0];
    if (v12 == v13) {
      BOOL v14 = v15;
    }
    if (v14)
    {
      sub_25B5ED1D4((uint64_t)a2, (uint64_t)a3);
      LODWORD(v16) = HIDWORD(*(unint64_t *)a2);
      LODWORD(v17) = HIDWORD(*(unint64_t *)a1);
      BOOL v18 = v16 < v17;
      unsigned __int8 v19 = vcgt_f32(*a1, *a2).u8[0];
      if (v16 == v17) {
        BOOL v18 = v19;
      }
      if (v18)
      {
        sub_25B5ED1D4((uint64_t)a1, (uint64_t)a2);
      }
    }
  }
}

uint64_t sub_25B5ED460(float32x2_t *a1, float32x2_t *a2)
{
  BOOL v4 = 1;
  switch(0xCCCCCCCCCCCCCCCDLL * (a2 - a1))
  {
    case 0uLL:
    case 1uLL:
      return v4;
    case 2uLL:
      float32x2_t v5 = a2[-5];
      LODWORD(v6) = HIDWORD(*(unint64_t *)a1);
      BOOL v7 = v5.f32[1] < v6;
      unsigned __int8 v8 = vcgt_f32(*a1, v5).u8[0];
      if (v5.f32[1] == v6) {
        BOOL v7 = v8;
      }
      if (v7) {
        sub_25B5ED1D4((uint64_t)a1, (uint64_t)&a2[-5]);
      }
      return v4;
    case 3uLL:
      sub_25B5ED258(a1, a1 + 5, a2 - 5);
      return v4;
    case 4uLL:
      sub_25B5ED370(a1, a1 + 5, a1 + 10, a2 - 5);
      return v4;
    case 5uLL:
      uint64_t v22 = a1 + 5;
      float32x2_t v23 = a1 + 10;
      BOOL v24 = a1 + 15;
      sub_25B5ED370(a1, a1 + 5, a1 + 10, a1 + 15);
      float32x2_t v26 = a2[-5];
      uint64_t v25 = (uint64_t)&a2[-5];
      LODWORD(v27) = HIDWORD(*(void *)&a1[15]);
      BOOL v28 = v26.f32[1] < v27;
      unsigned __int8 v29 = vcgt_f32(a1[15], v26).u8[0];
      if (v26.f32[1] == v27) {
        BOOL v28 = v29;
      }
      if (v28)
      {
        sub_25B5ED1D4((uint64_t)&a1[15], v25);
        LODWORD(v30) = HIDWORD(*(unint64_t *)v24);
        LODWORD(v31) = HIDWORD(*(unint64_t *)v23);
        BOOL v32 = v30 < v31;
        unsigned __int8 v33 = vcgt_f32(*v23, *v24).u8[0];
        if (v30 == v31) {
          BOOL v32 = v33;
        }
        if (v32)
        {
          sub_25B5ED1D4((uint64_t)&a1[10], (uint64_t)&a1[15]);
          LODWORD(v34) = HIDWORD(*(unint64_t *)v23);
          LODWORD(v35) = HIDWORD(*(unint64_t *)v22);
          BOOL v36 = v34 < v35;
          unsigned __int8 v37 = vcgt_f32(*v22, *v23).u8[0];
          if (v34 == v35) {
            BOOL v36 = v37;
          }
          if (v36)
          {
            sub_25B5ED1D4((uint64_t)&a1[5], (uint64_t)&a1[10]);
            LODWORD(v38) = HIDWORD(*(void *)&a1[5]);
            LODWORD(v39) = HIDWORD(*(unint64_t *)a1);
            BOOL v40 = v38 < v39;
            unsigned __int8 v41 = vcgt_f32(*a1, a1[5]).u8[0];
            if (v38 == v39) {
              BOOL v40 = v41;
            }
            if (v40) {
              sub_25B5ED1D4((uint64_t)a1, (uint64_t)&a1[5]);
            }
          }
        }
      }
      return 1;
    default:
      float v9 = a1 + 10;
      sub_25B5ED258(a1, a1 + 5, a1 + 10);
      BOOL v10 = a1 + 15;
      if (&a1[15] == a2) {
        return 1;
      }
      uint64_t v11 = 0;
      int v12 = 0;
      break;
  }
  while (1)
  {
    LODWORD(v13) = HIDWORD(*(unint64_t *)v10);
    LODWORD(v14) = HIDWORD(*(unint64_t *)v9);
    BOOL v15 = v13 < v14;
    unsigned __int8 v16 = vcgt_f32(*v9, *v10).u8[0];
    if (v13 == v14) {
      BOOL v15 = v16;
    }
    if (!v15) {
      goto LABEL_20;
    }
    sub_25B4C9CE4((uint64_t)&v47, (uint64_t)v10);
    uint64_t v17 = v11;
    while (1)
    {
      sub_25B576A98((uint64_t)v45, (uint64_t)&a1[15] + v17, (uint64_t)&a1[10] + v17);
      sub_25B400248(v46);
      if (v17 == -80) {
        break;
      }
      LODWORD(v18) = HIDWORD(*(unint64_t *)((char *)&a1[5] + v17));
      BOOL v19 = v47.f32[1] < v18;
      unsigned __int8 v20 = vcgt_f32(*(float32x2_t *)((char *)a1 + v17 + 40), v47).u8[0];
      if (v47.f32[1] == v18) {
        BOOL v19 = v20;
      }
      v17 -= 40;
      if (!v19)
      {
        uint64_t v21 = (uint64_t)&a1[15] + v17;
        goto LABEL_18;
      }
    }
    uint64_t v21 = (uint64_t)a1;
LABEL_18:
    sub_25B576A98((uint64_t)v43, v21, (uint64_t)&v47);
    sub_25B400248(v44);
    if (++v12 == 8) {
      break;
    }
    sub_25B400248(v48);
LABEL_20:
    float v9 = v10;
    v11 += 40;
    v10 += 5;
    if (v10 == a2) {
      return 1;
    }
  }
  BOOL v4 = &v10[5] == a2;
  sub_25B400248(v48);
  return v4;
}

void sub_25B5ED758(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char *a22)
{
}

uint64_t sub_25B5ED788(float32x2_t *a1, float32x2_t *a2, uint64_t a3)
{
  float v6 = (float32x2_t *)operator new(8uLL);
  float32x2_t *v6 = *a1;
  BOOL v7 = (float32x2_t *)sub_25B3FCAD4(2uLL);
  uint64_t v9 = v8;
  v7[1] = *a2;
  float32x2_t *v7 = *v6;
  operator delete(v6);
  float32x2_t v10 = vmul_f32(vadd_f32(*a1, *a2), (float32x2_t)0x3F0000003F000000);
  if (v9 >= 3)
  {
    v7[2] = v10;
    uint64_t v11 = v7 + 3;
    int v12 = v7;
LABEL_13:
    uint64_t v16 = 0;
    float v18 = *(float32x2_t **)a3;
    uint64_t v17 = *(void *)(a3 + 8);
    BOOL v19 = v12;
    while (1)
    {
      float32x2_t v20 = *v19;
      if (sub_25B5DE76C(v18, v17, *v19))
      {
        if (v16) {
          goto LABEL_20;
        }
        uint64_t v16 = 1;
      }
      else if (!sub_25B5DF910(v18, v17, v20))
      {
LABEL_20:
        uint64_t v21 = 0;
        goto LABEL_21;
      }
      if (++v19 == v11) {
        goto LABEL_19;
      }
    }
  }
  uint64_t v13 = 3;
  if ((unint64_t)((8 * v9) >> 2) > 3) {
    uint64_t v13 = (8 * v9) >> 2;
  }
  if ((unint64_t)(8 * v9) >= 0x7FFFFFFFFFFFFFF8) {
    unint64_t v14 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v14 = v13;
  }
  if (v14) {
    unint64_t v14 = (unint64_t)sub_25B3FCAD4(v14);
  }
  uint64_t v15 = 0;
  *(float32x2_t *)(v14 + 16) = v10;
  uint64_t v11 = (float32x2_t *)(v14 + 24);
  do
  {
    *(float32x2_t *)(v14 + 16 + v15 * 8 - 8) = v7[v15 + 1];
    --v15;
  }
  while (v15 != -2);
  int v12 = (float32x2_t *)v14;
  operator delete(v7);
  if (v12 != v11) {
    goto LABEL_13;
  }
LABEL_19:
  uint64_t v21 = 1;
LABEL_21:
  operator delete(v12);
  return v21;
}

void sub_25B5ED924(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_25B5ED944(float32x4_t **a1, float32x4_t *a2, double a3)
{
  LODWORD(a3) = a2[2].i32[1];
  sub_25B49DB70((uint64_t)v36, (int)(float)(roundf(a2[2].f32[2] - *(float *)&a3) / 5.0), a3, a2[2].f32[2]);
  uint64_t v5 = v38;
  uint64_t v6 = v36[1];
  a1[1] = 0;
  a1[2] = 0;
  *a1 = 0;
  if (v6)
  {
    BOOL v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = a1 + 1;
    do
    {
      float v10 = a2[2].f32[0];
      __float2 v11 = __sincosf_stret((float)(*(float *)(v5 + 4 * v8) / 180.0) * 3.1416);
      *(float *)&unint64_t v12 = v10 * v11.__cosval;
      *((float *)&v12 + 1) = v10 * v11.__sinval;
      float32x4_t v13 = a2[1];
      v13.i32[2] = 0;
      float32x4_t v14 = vaddq_f32(v13, (float32x4_t)v12);
      unint64_t v15 = (unint64_t)a1[2];
      if ((unint64_t)v7 >= v15)
      {
        float32x4_t v35 = v14;
        uint64_t v16 = *a1;
        uint64_t v17 = v7 - *a1;
        unint64_t v18 = v17 + 1;
        if ((unint64_t)(v17 + 1) >> 60) {
          sub_25B3FBC4C();
        }
        uint64_t v19 = v15 - (void)v16;
        if (v19 >> 3 > v18) {
          unint64_t v18 = v19 >> 3;
        }
        if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v20 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v20 = v18;
        }
        if (v20) {
          unint64_t v20 = (unint64_t)sub_25B3FFAEC(v20);
        }
        else {
          uint64_t v21 = 0;
        }
        uint64_t v22 = (float32x4_t *)(v20 + 16 * v17);
        float32x4_t *v22 = v35;
        float32x2_t v23 = v22 + 1;
        if (v7 != v16)
        {
          do
          {
            float32x4_t v24 = v7[-1];
            --v7;
            v22[-1] = v24;
            --v22;
          }
          while (v7 != v16);
          BOOL v7 = *a1;
        }
        *a1 = v22;
        a1[1] = v23;
        a1[2] = (float32x4_t *)(v20 + 16 * v21);
        if (v7) {
          operator delete(v7);
        }
        BOOL v7 = v23;
      }
      else
      {
        *v7++ = v14;
      }
      *uint64_t v9 = v7;
      ++v8;
    }
    while (v8 != v6);
    unint64_t v25 = (unint64_t)a1[2];
    if ((unint64_t)v7 < v25)
    {
      float32x4_t *v7 = a2[1];
      float32x2_t v26 = v7 + 1;
      goto LABEL_39;
    }
    float v27 = *a1;
  }
  else
  {
    float v27 = 0;
    BOOL v7 = 0;
    unint64_t v25 = 0;
    uint64_t v9 = a1 + 1;
  }
  uint64_t v28 = v7 - v27;
  unint64_t v29 = v28 + 1;
  if ((unint64_t)(v28 + 1) >> 60) {
    sub_25B3FBC4C();
  }
  uint64_t v30 = v25 - (void)v27;
  if (v30 >> 3 > v29) {
    unint64_t v29 = v30 >> 3;
  }
  if ((unint64_t)v30 >= 0x7FFFFFFFFFFFFFF0) {
    unint64_t v31 = 0xFFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v31 = v29;
  }
  if (v31)
  {
    unint64_t v31 = (unint64_t)sub_25B3FFAEC(v31);
    BOOL v7 = *v9;
  }
  else
  {
    uint64_t v32 = 0;
  }
  unsigned __int8 v33 = (float32x4_t *)(v31 + 16 * v28);
  *unsigned __int8 v33 = a2[1];
  float32x2_t v26 = v33 + 1;
  if (v7 != v27)
  {
    do
    {
      float32x4_t v34 = v7[-1];
      --v7;
      v33[-1] = v34;
      --v33;
    }
    while (v7 != v27);
    float v27 = *a1;
  }
  *a1 = v33;
  a1[1] = v26;
  a1[2] = (float32x4_t *)(v31 + 16 * v32);
  if (v27) {
    operator delete(v27);
  }
LABEL_39:
  *uint64_t v9 = v26;
  v36[0] = &unk_2708F27E8;
  if (v37) {
    sub_25B404120(v37);
  }
}

void sub_25B5EDBD8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,std::__shared_weak_count *a27)
{
  if (v28)
  {
    *(void *)(v27 + 8) = v28;
    operator delete(v28);
  }
  if (a27) {
    sub_25B404120(a27);
  }
  _Unwind_Resume(exception_object);
}

float sub_25B5EDC28(float32x4_t a1, double a2, float32x4_t a3)
{
  float32x4_t v3 = vsubq_f32(a3, a1);
  float32x4_t v4 = vmulq_f32(v3, v3);
  int32x2_t v5 = (int32x2_t)vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v4, 2), vaddq_f32(v4, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v4.f32, 1))).u64[0];
  *(float *)v5.i32 = sqrtf(*(float *)v5.i32);
  if (*(float *)v5.i32 < 0.000001) {
    *(float *)v5.i32 = 0.000001;
  }
  float32x4_t v6 = vdivq_f32(v3, (float32x4_t)vdupq_lane_s32(v5, 0));
  unint64_t v7 = vdivq_f32(vsubq_f32(vmlaq_f32(vmlaq_n_f32(a1, v6, *(float *)&a2), (float32x4_t)0, v6), a1), (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&a2, 0)).u64[0];
  if (fabsf(*(float *)&v7) < 0.000001) {
    LODWORD(v7) = dword_25B5F1DB8[*(float *)&v7 < 0.0];
  }
  float result = (float)(atan2f(*((float *)&v7 + 1), *(float *)&v7) * 180.0) / 3.1416;
  if (result < 0.0) {
    return result + 360.0;
  }
  return result;
}

BOOL sub_25B5EDCEC(float32x4_t *a1, float32x4_t a2, double a3)
{
  float v3 = *(float *)&a3;
  LODWORD(a3) = a1[2].i32[0];
  float v5 = sub_25B5EDC28(a1[1], a3, a2);
  float32x4_t v6 = operator new(0xCuLL);
  uint64_t v7 = 0;
  int v8 = 0;
  *(void *)float32x4_t v6 = 0xFFFFFFFFLL;
  v6[2] = 1;
  do
  {
    float v9 = v5 + (float)(360 * v6[v7]);
    if ((float)(a1[2].f32[1] - v3) <= v9 && (float)(a1[2].f32[2] + v3) > v9) {
      ++v8;
    }
    ++v7;
  }
  while (v7 != 3);
  BOOL v10 = v8 > 0;
  operator delete(v6);
  return v10;
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x270EE59E8](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x270EE59F8](context);
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C60]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C68]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x270EF4F20](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x270EF4F48](idst);
}

void CGImageRelease(CGImageRef image)
{
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7238]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7290]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA150](allocator, width, height, *(void *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

CVReturn CVPixelBufferCreateWithBytes(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, void *baseAddress, size_t bytesPerRow, CVPixelBufferReleaseBytesCallback releaseCallback, void *releaseRefCon, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA168](allocator, width, height, *(void *)&pixelFormatType, baseAddress, bytesPerRow, releaseCallback, releaseRefCon);
}

CVReturn CVPixelBufferCreateWithIOSurface(CFAllocatorRef allocator, IOSurfaceRef surface, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA170](allocator, surface, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x270EEA190](pixelBuffer);
}

void *__cdecl CVPixelBufferGetBaseAddressOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return (void *)MEMORY[0x270EEA1A0](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1B0](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRowOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA1C8](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetDataSize(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1D0](pixelBuffer);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1E8](pixelBuffer);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x270EEA200](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA218](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA240](pixelBuffer);
}

Boolean CVPixelBufferIsPlanar(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA258](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x270EEA260](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferPoolCreatePixelBuffer(CFAllocatorRef allocator, CVPixelBufferPoolRef pixelBufferPool, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA288](allocator, pixelBufferPool, pixelBufferOut);
}

void CVPixelBufferPoolRelease(CVPixelBufferPoolRef pixelBufferPool)
{
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x270EEA330](pixelBuffer, unlockFlags);
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x270EF4C28](properties);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x270EF4C58](buffer);
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4D48](buffer);
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4DE0](buffer);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x270EF4E18](buffer, *(void *)&options, seed);
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x270EF4E88](buffer, *(void *)&options, seed);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x270EF5E20]();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

uint64_t SIPixelBufferPoolCreate()
{
  return MEMORY[0x270F5CB78]();
}

uint64_t VTImageRotationSessionCreate()
{
  return MEMORY[0x270F06758]();
}

uint64_t VTImageRotationSessionInvalidate()
{
  return MEMORY[0x270F06760]();
}

uint64_t VTImageRotationSessionTransferImage()
{
  return MEMORY[0x270F06778]();
}

OSStatus VTPixelTransferSessionCreate(CFAllocatorRef allocator, VTPixelTransferSessionRef *pixelTransferSessionOut)
{
  return MEMORY[0x270F067E0](allocator, pixelTransferSessionOut);
}

void VTPixelTransferSessionInvalidate(VTPixelTransferSessionRef session)
{
}

OSStatus VTPixelTransferSessionTransferImage(VTPixelTransferSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x270F067F0](session, sourceBuffer, destinationBuffer);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::string *__cdecl std::locale::name(std::string *__return_ptr retstr, const std::locale *this)
{
  return (std::string *)MEMORY[0x270F982D8](retstr, this);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x270F982E8](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x270F982F8](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x270F983B0](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

void std::__call_once(std::once_flag::_State_type *a1, void *a2, void (__cdecl *a3)(void *))
{
}

std::regex_error *__cdecl std::regex_error::regex_error(std::regex_error *this, std::regex_constants::error_type __ecode)
{
  return (std::regex_error *)MEMORY[0x270F98440](this, *(void *)&__ecode);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x270F98458](__n);
}

void std::string::__grow_by_and_replace(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add, const std::string::value_type *__p_new_stuff)
{
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984E8](this, __pos, __s, __n);
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x270F98548](this, __str, __pos, __n, __a);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x270F98560](this, __str);
}

uint64_t std::filebuf::open()
{
  return MEMORY[0x270F98638]();
}

uint64_t std::filebuf::close()
{
  return MEMORY[0x270F98640]();
}

uint64_t std::filebuf::basic_filebuf()
{
  return MEMORY[0x270F98650]();
}

uint64_t std::filebuf::~filebuf()
{
  return MEMORY[0x270F98658]();
}

uint64_t std::ostream::put()
{
  return MEMORY[0x270F98740]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x270F98748]();
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

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x270F987A8]();
}

{
  return MEMORY[0x270F987C0]();
}

std::regex_traits<char>::char_class_type std::__get_classname(const char *__s, BOOL __icase)
{
  return MEMORY[0x270F98890](__s, __icase);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

std::string *__cdecl std::__get_collation_name(std::string *__return_ptr retstr, const char *__s)
{
  return (std::string *)MEMORY[0x270F98A00](retstr, __s);
}

int std::stoi(const std::string *__str, size_t *__idx, int __base)
{
  return MEMORY[0x270F98B78](__str, __idx, *(void *)&__base);
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

uint64_t std::__sort<std::__less<float,float> &,float *>()
{
  return MEMORY[0x270F98BE0]();
}

uint64_t std::__sort<std::__less<unsigned long,unsigned long> &,unsigned long *>()
{
  return MEMORY[0x270F98BF8]();
}

std::chrono::steady_clock::time_point std::chrono::steady_clock::now(void)
{
  return (std::chrono::steady_clock::time_point)MEMORY[0x270F98C18]();
}

std::locale *__cdecl std::locale::locale(std::locale *this, const std::locale *a2)
{
  return (std::locale *)MEMORY[0x270F98C70](this, a2);
}

std::locale *__cdecl std::locale::locale(std::locale *this)
{
  return (std::locale *)MEMORY[0x270F98C78](this);
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
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

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, double __val)
{
  return (std::string *)MEMORY[0x270F98DF8](retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, float __val)
{
  return (std::string *)MEMORY[0x270F98E00](retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x270F98E08](retstr, *(void *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x270F98E20](retstr, __val);
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x270F98E38]();
}

void std::exception::~exception(std::exception *this)
{
}

void std::terminate(void)
{
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

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x270ED7DA0](lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
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

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

simd_float3x3 __invert_f3(simd_float3x3 a1)
{
  MEMORY[0x270ED7E18]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2]);
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
}

simd_float4x4 __invert_f4(simd_float4x4 a1)
{
  MEMORY[0x270ED7E20]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2], (__n128)a1.columns[3]);
  result.columns[3].i64[1] = v8;
  result.columns[3].i64[0] = v7;
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
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

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

simd_float4 _simd_round_f4(simd_float4 x)
{
  MEMORY[0x270ED8338]((__n128)x);
  return result;
}

long double acos(long double __x)
{
  MEMORY[0x270ED8588](__x);
  return result;
}

float acosf(float a1)
{
  MEMORY[0x270ED8598](a1);
  return result;
}

float atan2f(float a1, float a2)
{
  MEMORY[0x270ED86B8](a1, a2);
  return result;
}

float atanf(float a1)
{
  MEMORY[0x270ED86C0](a1);
  return result;
}

int atoi(const char *a1)
{
  return MEMORY[0x270ED86E8](a1);
}

void bzero(void *a1, size_t a2)
{
}

uint64_t cblas_dcopy_NEWLAPACK()
{
  return MEMORY[0x270EDE308]();
}

uint64_t cblas_dgemm_NEWLAPACK()
{
  return MEMORY[0x270EDE330]();
}

uint64_t cblas_sgemm_NEWLAPACK()
{
  return MEMORY[0x270EDE440]();
}

float cosf(float a1)
{
  MEMORY[0x270ED9130](a1);
  return result;
}

uint64_t dgetrf_NEWLAPACK()
{
  return MEMORY[0x270EDE598]();
}

uint64_t dgetri_NEWLAPACK()
{
  return MEMORY[0x270EDE5A8]();
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x270ED9468](label, attr, target);
}

void dispatch_resume(dispatch_object_t object)
{
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

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x270ED95D0](label);
}

void dispatch_workloop_set_os_workgroup(dispatch_workloop_t workloop, os_workgroup_t workgroup)
{
}

uint64_t dispatch_workloop_set_qos_class_floor()
{
  return MEMORY[0x270ED95F8]();
}

uint64_t e5rt_buffer_object_create_from_iosurface()
{
  return MEMORY[0x270F27AE8]();
}

uint64_t e5rt_buffer_object_release()
{
  return MEMORY[0x270F27B20]();
}

uint64_t e5rt_execution_stream_create()
{
  return MEMORY[0x270F27B90]();
}

uint64_t e5rt_execution_stream_encode_operation()
{
  return MEMORY[0x270F27BA0]();
}

uint64_t e5rt_execution_stream_execute_sync()
{
  return MEMORY[0x270F27BB0]();
}

uint64_t e5rt_execution_stream_operation_create_precompiled_compute_operation()
{
  return MEMORY[0x270F27BC0]();
}

uint64_t e5rt_execution_stream_operation_get_input_names()
{
  return MEMORY[0x270F27BE0]();
}

uint64_t e5rt_execution_stream_operation_get_num_inputs()
{
  return MEMORY[0x270F27BF0]();
}

uint64_t e5rt_execution_stream_operation_get_num_outputs()
{
  return MEMORY[0x270F27BF8]();
}

uint64_t e5rt_execution_stream_operation_get_output_names()
{
  return MEMORY[0x270F27C08]();
}

uint64_t e5rt_execution_stream_operation_release()
{
  return MEMORY[0x270F27C28]();
}

uint64_t e5rt_execution_stream_operation_retain_input_port()
{
  return MEMORY[0x270F27C30]();
}

uint64_t e5rt_execution_stream_operation_retain_output_port()
{
  return MEMORY[0x270F27C40]();
}

uint64_t e5rt_execution_stream_release()
{
  return MEMORY[0x270F27C68]();
}

uint64_t e5rt_get_last_error_message()
{
  return MEMORY[0x270F27C88]();
}

uint64_t e5rt_io_port_bind_buffer_object()
{
  return MEMORY[0x270F27C98]();
}

uint64_t e5rt_io_port_release()
{
  return MEMORY[0x270F27CD8]();
}

uint64_t e5rt_io_port_retain_tensor_desc()
{
  return MEMORY[0x270F27CF0]();
}

uint64_t e5rt_tensor_desc_dtype_get_component_dtype()
{
  return MEMORY[0x270F27E10]();
}

uint64_t e5rt_tensor_desc_dtype_get_component_pack()
{
  return MEMORY[0x270F27E18]();
}

uint64_t e5rt_tensor_desc_dtype_release()
{
  return MEMORY[0x270F27E38]();
}

uint64_t e5rt_tensor_desc_get_shape()
{
  return MEMORY[0x270F27E58]();
}

uint64_t e5rt_tensor_desc_release()
{
  return MEMORY[0x270F27E78]();
}

uint64_t e5rt_tensor_desc_retain_dtype()
{
  return MEMORY[0x270F27E88]();
}

uint64_t espresso_context_destroy()
{
  return MEMORY[0x270F27EE0]();
}

uint64_t espresso_create_context()
{
  return MEMORY[0x270F27F08]();
}

uint64_t espresso_create_plan()
{
  return MEMORY[0x270F27F20]();
}

uint64_t espresso_network_bind_buffer()
{
  return MEMORY[0x270F27F78]();
}

uint64_t espresso_network_bind_cvpixelbuffer()
{
  return MEMORY[0x270F27F98]();
}

uint64_t espresso_network_declare_output()
{
  return MEMORY[0x270F28010]();
}

uint64_t espresso_network_select_configuration()
{
  return MEMORY[0x270F28048]();
}

uint64_t espresso_plan_add_network()
{
  return MEMORY[0x270F28068]();
}

uint64_t espresso_plan_build()
{
  return MEMORY[0x270F28070]();
}

uint64_t espresso_plan_build_clean()
{
  return MEMORY[0x270F28080]();
}

uint64_t espresso_plan_destroy()
{
  return MEMORY[0x270F28090]();
}

uint64_t espresso_plan_execute_sync()
{
  return MEMORY[0x270F280A0]();
}

void exit(int a1)
{
}

long double exp(long double __x)
{
  MEMORY[0x270ED9858](__x);
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

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return (char *)MEMORY[0x270ED9968](a1, *(void *)&a2, a3);
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

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9A28](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
}

long double log(long double __x)
{
  MEMORY[0x270EDA0A8](__x);
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x270EDA458](__s, *(void *)&__c, __n);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

size_t os_proc_available_memory(void)
{
  return MEMORY[0x270EDAA40]();
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x270EDAB30]();
}

uint64_t os_workgroup_attr_set_flags()
{
  return MEMORY[0x270EDAB68]();
}

uint64_t os_workgroup_create()
{
  return MEMORY[0x270EDAB88]();
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x270EDACF8](__x, __y);
  return result;
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

int puts(const char *a1)
{
  return MEMORY[0x270EDB098](a1);
}

float sinf(float a1)
{
  MEMORY[0x270EDB4F0](a1);
  return result;
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x270EDB7D0](a1, *(void *)&a2, a3, a4, a5, a6);
}

float tanf(float a1)
{
  MEMORY[0x270EDB818](a1);
  return result;
}

void vDSP_f3x3(const float *__A, vDSP_Length __NR, vDSP_Length __NC, const float *__F, float *__C)
{
}

void vDSP_mtransD(const double *__A, vDSP_Stride __IA, double *__C, vDSP_Stride __IC, vDSP_Length __M, vDSP_Length __N)
{
}

void vDSP_sveD(const double *__A, vDSP_Stride __I, double *__C, vDSP_Length __N)
{
}

void vDSP_svesq(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
}

void vDSP_vabsD(const double *__A, vDSP_Stride __IA, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vaddD(const double *__A, vDSP_Stride __IA, const double *__B, vDSP_Stride __IB, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vmulD(const double *__A, vDSP_Stride __IA, const double *__B, vDSP_Stride __IB, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsadd(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsmul(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsmulD(const double *__A, vDSP_Stride __IA, const double *__B, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsub(const float *__B, vDSP_Stride __IB, const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsubD(const double *__B, vDSP_Stride __IB, const double *__A, vDSP_Stride __IA, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

vImage_Error vImageBuffer_Init(vImage_Buffer *buf, vImagePixelCount height, vImagePixelCount width, uint32_t pixelBits, vImage_Flags flags)
{
  return MEMORY[0x270EDEF18](buf, height, width, *(void *)&pixelBits, *(void *)&flags);
}

vImage_Error vImageConvert_FTo16U(const vImage_Buffer *src, const vImage_Buffer *dest, float offset, float scale, vImage_Flags flags)
{
  return MEMORY[0x270EDF010](src, dest, *(void *)&flags, offset, scale);
}

vImage_Error vImageDilate_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, vImagePixelCount srcOffsetToROI_X, vImagePixelCount srcOffsetToROI_Y, const unsigned __int8 *kernel, vImagePixelCount kernel_height, vImagePixelCount kernel_width, vImage_Flags flags)
{
  return MEMORY[0x270EDF1D0](src, dest, srcOffsetToROI_X, srcOffsetToROI_Y, kernel, kernel_height, kernel_width, *(void *)&flags);
}

vImage_Error vImageErode_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, vImagePixelCount srcOffsetToROI_X, vImagePixelCount srcOffsetToROI_Y, const unsigned __int8 *kernel, vImagePixelCount kernel_height, vImagePixelCount kernel_width, vImage_Flags flags)
{
  return MEMORY[0x270EDF1F8](src, dest, srcOffsetToROI_X, srcOffsetToROI_Y, kernel, kernel_height, kernel_width, *(void *)&flags);
}

vImage_Error vImageScale_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x270EDF380](src, dest, tempBuffer, *(void *)&flags);
}

__int32 *__cdecl wmemchr(__int32 *__s, __int32 __c, size_t __n)
{
  return (__int32 *)MEMORY[0x270EDBBE8](__s, *(void *)&__c, __n);
}