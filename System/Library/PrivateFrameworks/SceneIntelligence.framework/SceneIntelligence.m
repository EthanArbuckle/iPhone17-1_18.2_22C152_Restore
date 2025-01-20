void sub_21B699714(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_21B6997CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B69988C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6998FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B69A2EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, uint64_t a19, char a20,void *a21)
{
  if (__p) {
    operator delete(__p);
  }
  std::__tree<std::__value_type<std::pair<int,int>,float>,std::__map_value_compare<std::pair<int,int>,std::__value_type<std::pair<int,int>,float>,std::less<std::pair<int,int>>,true>,std::allocator<std::__value_type<std::pair<int,int>,float>>>::destroy((uint64_t)&a20, a21);

  _Unwind_Resume(a1);
}

void std::vector<std::pair<std::pair<int,int>,half>>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 2);
  BOOL v3 = a2 >= v2;
  unint64_t v4 = a2 - v2;
  if (v4 != 0 && v3)
  {
    std::vector<std::pair<std::pair<int,int>,half>>::__append((char **)a1, v4);
  }
  else if (!v3)
  {
    *(void *)(a1 + 8) = *(void *)a1 + 12 * a2;
  }
}

char *std::__tree<std::__value_type<std::pair<int,int>,float>,std::__map_value_compare<std::pair<int,int>,std::__value_type<std::pair<int,int>,float>,std::less<std::pair<int,int>>,true>,std::allocator<std::__value_type<std::pair<int,int>,float>>>::__emplace_unique_key_args<std::pair<int,int>,std::pair<std::pair<int,int>,half>>(uint64_t **a1, int *a2, uint64_t a3)
{
  v5 = std::__tree<std::__value_type<std::pair<int,int>,float>,std::__map_value_compare<std::pair<int,int>,std::__value_type<std::pair<int,int>,float>,std::less<std::pair<int,int>>,true>,std::allocator<std::__value_type<std::pair<int,int>,float>>>::__find_equal<std::pair<int,int>>((uint64_t)a1, &v15, a2);
  v6 = (char *)*v5;
  if (!*v5)
  {
    v7 = (uint64_t **)v5;
    v6 = (char *)operator new(0x28uLL);
    *(void *)(v6 + 28) = *(void *)a3;
    _H0 = *(_WORD *)(a3 + 8);
    __asm { FCVT            S0, H0 }
    *((_DWORD *)v6 + 9) = _S0;
    std::__tree<std::__value_type<std::pair<int,int>,float>,std::__map_value_compare<std::pair<int,int>,std::__value_type<std::pair<int,int>,float>,std::less<std::pair<int,int>>,true>,std::allocator<std::__value_type<std::pair<int,int>,float>>>::__insert_node_at(a1, v15, v7, (uint64_t *)v6);
  }
  return v6;
}

uint64_t *std::__tree<std::__value_type<std::pair<int,int>,float>,std::__map_value_compare<std::pair<int,int>,std::__value_type<std::pair<int,int>,float>,std::less<std::pair<int,int>>,true>,std::allocator<std::__value_type<std::pair<int,int>,float>>>::__find_equal<std::pair<int,int>>(uint64_t a1, void *a2, int *a3)
{
  v5 = *(uint64_t **)(a1 + 8);
  result = (uint64_t *)(a1 + 8);
  unint64_t v4 = v5;
  if (v5)
  {
    int v6 = *a3;
    int v7 = a3[1];
    while (1)
    {
      while (1)
      {
        v8 = v4;
        int v9 = *((_DWORD *)v4 + 7);
        if (v6 >= v9) {
          break;
        }
LABEL_4:
        unint64_t v4 = (uint64_t *)*v8;
        result = v8;
        if (!*v8) {
          goto LABEL_12;
        }
      }
      if (v9 >= v6)
      {
        int v10 = *((_DWORD *)v8 + 8);
        if (v7 < v10) {
          goto LABEL_4;
        }
        if (v10 >= v7) {
          goto LABEL_12;
        }
      }
      result = v8 + 1;
      unint64_t v4 = (uint64_t *)v8[1];
      if (!v4) {
        goto LABEL_12;
      }
    }
  }
  v8 = result;
LABEL_12:
  *a2 = v8;
  return result;
}

uint64_t *std::__tree<std::__value_type<std::pair<int,int>,float>,std::__map_value_compare<std::pair<int,int>,std::__value_type<std::pair<int,int>,float>,std::less<std::pair<int,int>>,true>,std::allocator<std::__value_type<std::pair<int,int>,float>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  result = std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

void std::__throw_bad_array_new_length[abi:nn180100]()
{
}

uint64_t *std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      unint64_t v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      BOOL v3 = (uint64_t *)v2[2];
      unint64_t v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (int v8 = *(unsigned __int8 *)(v7 + 24), v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            int v9 = (uint64_t **)a2[2];
          }
          else
          {
            int v9 = (uint64_t **)v2[1];
            int v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              BOOL v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            *int v9 = v2;
            v2[2] = (uint64_t)v9;
            BOOL v3 = v9[2];
            unint64_t v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          *BOOL v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (int v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          uint64_t *v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            BOOL v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          BOOL v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        unint64_t v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        uint64_t *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      unsigned char *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void *std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:nn180100]<std::__map_iterator<std::__tree_iterator<std::__value_type<std::pair<int,int>,float>,std::__tree_node<std::__value_type<std::pair<int,int>,float>,void *> *,long>>,std::__map_iterator<std::__tree_iterator<std::__value_type<std::pair<int,int>,float>,std::__tree_node<std::__value_type<std::pair<int,int>,float>,void *> *,long>>,std::back_insert_iterator<std::vector<std::pair<std::pair<int,int>,half>>>>(uint64_t a1, void *a2, void *a3, char **a4)
{
  unint64_t v4 = a2;
  v16 = a4;
  if (a2 == a3) {
    return a2;
  }
  v5 = a3;
  do
  {
    uint64_t v14 = *(void *)((char *)v4 + 28);
    _S0 = *((_DWORD *)v4 + 9);
    __asm { FCVT            H0, S0 }
    __int16 v15 = _S0;
    std::back_insert_iterator<std::vector<std::pair<std::pair<int,int>,half>>>::operator=[abi:nn180100](&v16, &v14);
    uint64_t v11 = (void *)v4[1];
    if (v11)
    {
      do
      {
        uint64_t v12 = v11;
        uint64_t v11 = (void *)*v11;
      }
      while (v11);
    }
    else
    {
      do
      {
        uint64_t v12 = (void *)v4[2];
        _ZF = *v12 == (void)v4;
        unint64_t v4 = v12;
      }
      while (!_ZF);
    }
    unint64_t v4 = v12;
  }
  while (v12 != v5);
  return v5;
}

char ***std::back_insert_iterator<std::vector<std::pair<std::pair<int,int>,half>>>::operator=[abi:nn180100](char ***a1, uint64_t *a2)
{
  unint64_t v4 = *a1;
  unint64_t v5 = (unint64_t)(*a1)[1];
  int v6 = *a1;
  unint64_t v9 = (unint64_t)v6[2];
  uint64_t v7 = (uint64_t)(v6 + 2);
  unint64_t v8 = v9;
  if (v5 >= v9)
  {
    unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v5 - (void)*v4) >> 2);
    unint64_t v13 = v12 + 1;
    if (v12 + 1 > 0x1555555555555555) {
      abort();
    }
    unint64_t v14 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v8 - (void)*v4) >> 2);
    if (2 * v14 > v13) {
      unint64_t v13 = 2 * v14;
    }
    if (v14 >= 0xAAAAAAAAAAAAAAALL) {
      unint64_t v15 = 0x1555555555555555;
    }
    else {
      unint64_t v15 = v13;
    }
    if (v15) {
      v16 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<std::pair<int,int>,half>>>(v7, v15);
    }
    else {
      v16 = 0;
    }
    v17 = &v16[12 * v12];
    v18 = &v16[12 * v15];
    uint64_t v19 = *a2;
    *((_DWORD *)v17 + 2) = *((_DWORD *)a2 + 2);
    *(void *)v17 = v19;
    uint64_t v11 = v17 + 12;
    v21 = *v4;
    v20 = v4[1];
    if (v20 != *v4)
    {
      do
      {
        uint64_t v22 = *(void *)(v20 - 12);
        v20 -= 12;
        int v23 = *((_DWORD *)v20 + 2);
        *(void *)(v17 - 12) = v22;
        v17 -= 12;
        *((_DWORD *)v17 + 2) = v23;
      }
      while (v20 != v21);
      v20 = *v4;
    }
    *unint64_t v4 = v17;
    v4[1] = v11;
    v4[2] = v18;
    if (v20) {
      operator delete(v20);
    }
  }
  else
  {
    uint64_t v10 = *a2;
    *(_DWORD *)(v5 + 8) = *((_DWORD *)a2 + 2);
    *(void *)unint64_t v5 = v10;
    uint64_t v11 = (char *)(v5 + 12);
  }
  v4[1] = v11;
  return a1;
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<std::pair<int,int>,half>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x1555555555555556) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  return operator new(12 * a2);
}

unint64_t std::__introsort<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<half>(half const*,half const*,half const*,half const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,half> const&,std::pair<std::pair<int,int>,half> const&)#1} &,std::pair<std::pair<int,int>,half>*,false>(unint64_t result, unint64_t a2, uint64_t a3, char a4)
{
  unint64_t v9 = result;
LABEL_2:
  unint64_t j = v9;
  while (1)
  {
    unint64_t v9 = j;
    uint64_t v11 = a2 - j;
    unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(a2 - j) >> 2);
    if (v5 || !v4)
    {
      switch(v12)
      {
        case 0uLL:
        case 1uLL:
          return result;
        case 2uLL:
          short float v51 = *(short float *)(a2 - 4);
          short float v52 = *(short float *)(j + 8);
          if (v51 == v52)
          {
            int v54 = *(_DWORD *)(a2 - 12);
            int v53 = *(_DWORD *)j;
            if (v54 >= *(_DWORD *)j && (v53 < v54 || *(_DWORD *)(a2 - 8) >= *(_DWORD *)(j + 4))) {
              return result;
            }
          }
          else
          {
            if (v51 <= v52) {
              return result;
            }
            int v53 = *(_DWORD *)j;
            int v54 = *(_DWORD *)(a2 - 12);
          }
          *(_DWORD *)unint64_t j = v54;
          *(_DWORD *)(a2 - 12) = v53;
          int v125 = *(_DWORD *)(j + 4);
          *(_DWORD *)(j + 4) = *(_DWORD *)(a2 - 8);
          *(_DWORD *)(a2 - 8) = v125;
          *(short float *)(j + 8) = v51;
          *(short float *)(a2 - 4) = v52;
          return result;
        case 3uLL:
          return (unint64_t)std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<half>(half const*,half const*,half const*,half const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,half> const&,std::pair<std::pair<int,int>,half> const&)#1} &,std::pair<std::pair<int,int>,half>*>((short float *)j, (short float *)(j + 12), (short float *)(a2 - 12));
        case 4uLL:
          return (unint64_t)std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<half>(half const*,half const*,half const*,half const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,half> const&,std::pair<std::pair<int,int>,half> const&)#1} &,std::pair<std::pair<int,int>,half>*>((short float *)j, (short float *)(j + 12), (short float *)(j + 24), (short float *)(a2 - 12));
        case 5uLL:
          return (unint64_t)std::__sort5_maybe_branchless[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<half>(half const*,half const*,half const*,half const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,half> const&,std::pair<std::pair<int,int>,half> const&)#1} &,std::pair<std::pair<int,int>,half>*,0>((short float *)j, (short float *)(j + 12), (short float *)(j + 24), (short float *)(j + 36), (short float *)(a2 - 12));
        default:
          JUMPOUT(0);
      }
    }
    if (v11 <= 287) {
      break;
    }
    if (!a3)
    {
      if (j == a2) {
        return result;
      }
      int64_t v73 = (v12 - 2) >> 1;
      int64_t v74 = v73;
      while (1)
      {
        int64_t v75 = v74;
        if (v73 < v74) {
          goto LABEL_204;
        }
        uint64_t v76 = (2 * v74) | 1;
        unint64_t v77 = j + 12 * v76;
        if (2 * v75 + 2 >= (uint64_t)v12) {
          goto LABEL_178;
        }
        short float v78 = *(short float *)(j + 12 * v76 + 8);
        short float v79 = *(short float *)(v77 + 20);
        if (v78 == v79)
        {
          int v80 = *(_DWORD *)(v77 + 12);
          if (*(_DWORD *)v77 >= v80 && (v80 < *(_DWORD *)v77 || *(_DWORD *)(v77 + 4) >= *(_DWORD *)(v77 + 16))) {
            goto LABEL_178;
          }
        }
        else if (v78 <= v79)
        {
          goto LABEL_178;
        }
        v77 += 12;
        uint64_t v76 = 2 * v75 + 2;
LABEL_178:
        unint64_t v81 = j + 12 * v75;
        short float v82 = *(short float *)(v77 + 8);
        short float v83 = *(short float *)(v81 + 8);
        if (v82 == v83)
        {
          int v85 = *(_DWORD *)v77;
          int v84 = *(_DWORD *)v81;
          if (*(_DWORD *)v77 < *(_DWORD *)v81 || v84 >= v85 && *(_DWORD *)(v77 + 4) < *(_DWORD *)(v81 + 4)) {
            goto LABEL_204;
          }
        }
        else
        {
          if (v82 > v83) {
            goto LABEL_204;
          }
          int v84 = *(_DWORD *)v81;
          int v85 = *(_DWORD *)v77;
        }
        int v86 = *(_DWORD *)(v81 + 4);
        *(_DWORD *)unint64_t v81 = v85;
        *(_DWORD *)(v81 + 4) = *(_DWORD *)(v77 + 4);
        *(short float *)(v81 + 8) = v82;
        while (1)
        {
          if (v73 < v76) {
            goto LABEL_203;
          }
          unint64_t v87 = v77;
          uint64_t v88 = 2 * v76;
          uint64_t v76 = (2 * v76) | 1;
          unint64_t v77 = j + 12 * v76;
          uint64_t v89 = v88 + 2;
          if (v89 < (uint64_t)v12)
          {
            short float v90 = *(short float *)(j + 12 * v76 + 8);
            short float v91 = *(short float *)(v77 + 20);
            if (v90 == v91)
            {
              int v92 = *(_DWORD *)(v77 + 12);
              if (*(_DWORD *)v77 < v92 || v92 >= *(_DWORD *)v77 && *(_DWORD *)(v77 + 4) < *(_DWORD *)(v77 + 16))
              {
LABEL_191:
                v77 += 12;
                uint64_t v76 = v89;
              }
            }
            else if (v90 > v91)
            {
              goto LABEL_191;
            }
          }
          short float v93 = *(short float *)(v77 + 8);
          if (v93 == v83) {
            break;
          }
          if (v93 > v83) {
            goto LABEL_202;
          }
          int v94 = *(_DWORD *)v77;
LABEL_198:
          *(_DWORD *)unint64_t v87 = v94;
          *(_DWORD *)(v87 + 4) = *(_DWORD *)(v77 + 4);
          *(short float *)(v87 + 8) = v93;
        }
        int v94 = *(_DWORD *)v77;
        if (*(_DWORD *)v77 >= v84 && (v84 < v94 || *(_DWORD *)(v77 + 4) >= v86)) {
          goto LABEL_198;
        }
LABEL_202:
        unint64_t v77 = v87;
LABEL_203:
        *(_DWORD *)unint64_t v77 = v84;
        *(_DWORD *)(v77 + 4) = v86;
        *(short float *)(v77 + 8) = v83;
LABEL_204:
        int64_t v74 = v75 - 1;
        if (!v75)
        {
          int64_t v95 = v11 / 0xCuLL;
          while (1)
          {
            uint64_t v96 = 0;
            int v97 = *(_DWORD *)j;
            unsigned int v98 = *(_DWORD *)(j + 4);
            __int16 v99 = *(_WORD *)(j + 8);
            v100 = (short float *)j;
            do
            {
              v101 = v100;
              result = v96 + 1;
              v100 += 6 * v96 + 6;
              uint64_t v102 = 2 * v96;
              uint64_t v96 = (2 * v96) | 1;
              int64_t v103 = v102 + 2;
              if (v103 >= v95) {
                goto LABEL_218;
              }
              result = (unint64_t)&v101[6 * result];
              short float v104 = *(short float *)(result + 8);
              short float v105 = v100[10];
              if (v104 == v105)
              {
                result = *(unsigned int *)v100;
                int v106 = *((_DWORD *)v100 + 3);
                if ((int)result < v106
                  || v106 >= (int)result && (result = *((unsigned int *)v100 + 1), (int)result < *((_DWORD *)v100 + 4)))
                {
LABEL_217:
                  v100 += 6;
                  uint64_t v96 = v103;
                }
              }
              else if (v104 > v105)
              {
                goto LABEL_217;
              }
LABEL_218:
              *(_DWORD *)v101 = *(_DWORD *)v100;
              *((_DWORD *)v101 + 1) = *((_DWORD *)v100 + 1);
              v101[4] = v100[4];
            }
            while (v96 <= (uint64_t)((unint64_t)(v95 - 2) >> 1));
            if (v100 == (short float *)(a2 - 12))
            {
              *(_DWORD *)v100 = v97;
              *((_DWORD *)v100 + 1) = v98;
              *((_WORD *)v100 + 4) = v99;
            }
            else
            {
              *(_DWORD *)v100 = *(_DWORD *)(a2 - 12);
              *((_DWORD *)v100 + 1) = *(_DWORD *)(a2 - 8);
              v100[4] = *(short float *)(a2 - 4);
              *(_DWORD *)(a2 - 12) = v97;
              *(_DWORD *)(a2 - 8) = v98;
              *(_WORD *)(a2 - 4) = v99;
              uint64_t v107 = (uint64_t)v100 - j + 12;
              if (v107 >= 13)
              {
                unint64_t v108 = v107 / 0xCuLL - 2;
                unint64_t v109 = v108 >> 1;
                v110 = (short float *)(j + 12 * (v108 >> 1));
                short float v111 = v110[4];
                short float v112 = v100[4];
                if (v111 == v112)
                {
                  result = *(unsigned int *)v110;
                  int v113 = *(_DWORD *)v100;
                  if ((int)result < *(_DWORD *)v100
                    || v113 >= (int)result && *((_DWORD *)v110 + 1) < *((_DWORD *)v100 + 1))
                  {
                    goto LABEL_226;
                  }
                }
                else if (v111 > v112)
                {
                  int v113 = *(_DWORD *)v100;
                  LODWORD(result) = *(_DWORD *)v110;
LABEL_226:
                  signed int v114 = *((_DWORD *)v100 + 1);
                  while (1)
                  {
                    *(_DWORD *)v100 = result;
                    result = *((unsigned int *)v110 + 1);
                    *((_DWORD *)v100 + 1) = result;
                    v100[4] = v111;
                    if (v108 < 2) {
                      break;
                    }
                    v100 = v110;
                    unint64_t v108 = v109 - 1;
                    unint64_t v109 = (v109 - 1) >> 1;
                    v110 = (short float *)(j + 12 * v109);
                    short float v111 = v110[4];
                    if (v111 == v112)
                    {
                      result = *(unsigned int *)v110;
                      if ((int)result >= v113 && (v113 < (int)result || *((_DWORD *)v110 + 1) >= v114))
                      {
LABEL_234:
                        v110 = v100;
                        break;
                      }
                    }
                    else
                    {
                      if (v111 <= v112) {
                        goto LABEL_234;
                      }
                      LODWORD(result) = *(_DWORD *)v110;
                    }
                  }
                  *(_DWORD *)v110 = v113;
                  *((_DWORD *)v110 + 1) = v114;
                  v110[4] = v112;
                }
              }
            }
            a2 -= 12;
            if (v95-- <= 2) {
              return result;
            }
          }
        }
      }
    }
    unint64_t v13 = v12 >> 1;
    unint64_t v14 = (short float *)(j + 12 * (v12 >> 1));
    if ((unint64_t)v11 >= 0x601)
    {
      std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<half>(half const*,half const*,half const*,half const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,half> const&,std::pair<std::pair<int,int>,half> const&)#1} &,std::pair<std::pair<int,int>,half>*>((short float *)v9, (short float *)(v9 + 12 * (v12 >> 1)), (short float *)(a2 - 12));
      unint64_t v15 = v9 + 12 * v13;
      std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<half>(half const*,half const*,half const*,half const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,half> const&,std::pair<std::pair<int,int>,half> const&)#1} &,std::pair<std::pair<int,int>,half>*>((short float *)(v9 + 12), (short float *)(v15 - 12), (short float *)(a2 - 24));
      std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<half>(half const*,half const*,half const*,half const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,half> const&,std::pair<std::pair<int,int>,half> const&)#1} &,std::pair<std::pair<int,int>,half>*>((short float *)(v9 + 24), (short float *)(v9 + 12 + 12 * v13), (short float *)(a2 - 36));
      result = (unint64_t)std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<half>(half const*,half const*,half const*,half const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,half> const&,std::pair<std::pair<int,int>,half> const&)#1} &,std::pair<std::pair<int,int>,half>*>((short float *)(v15 - 12), v14, (short float *)(v9 + 12 + 12 * v13));
      uint64_t v16 = *(void *)v9;
      *(void *)unint64_t v9 = *(void *)v14;
      *(void *)unint64_t v14 = v16;
      LOWORD(v16) = *(_WORD *)(v9 + 8);
      *(_WORD *)(v9 + 8) = *(_WORD *)(v15 + 8);
      *(_WORD *)(v15 + 8) = v16;
    }
    else
    {
      result = (unint64_t)std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<half>(half const*,half const*,half const*,half const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,half> const&,std::pair<std::pair<int,int>,half> const&)#1} &,std::pair<std::pair<int,int>,half>*>((short float *)(v9 + 12 * (v12 >> 1)), (short float *)v9, (short float *)(a2 - 12));
    }
    --a3;
    if (a4)
    {
      int v17 = *(_DWORD *)v9;
      short float v18 = *(short float *)(v9 + 8);
LABEL_18:
      uint64_t v21 = 0;
      int v22 = *(_DWORD *)(v9 + 4);
      while (1)
      {
        short float v23 = *(short float *)(v9 + v21 + 20);
        if (v23 == v18) {
          break;
        }
        if (v23 <= v18) {
          goto LABEL_26;
        }
LABEL_25:
        v21 += 12;
      }
      int v24 = *(_DWORD *)(v9 + v21 + 12);
      if (v24 < v17 || v17 >= v24 && *(_DWORD *)(v9 + v21 + 16) < v22) {
        goto LABEL_25;
      }
LABEL_26:
      unint64_t v25 = v9 + v21 + 12;
      unint64_t i = a2 - 12;
      if (v21)
      {
        while (1)
        {
          short float v27 = *(short float *)(i + 8);
          if (v27 == v18)
          {
            if (*(_DWORD *)i < v17 || v17 >= *(_DWORD *)i && *(_DWORD *)(i + 4) < v22) {
              goto LABEL_52;
            }
          }
          else if (v27 > v18)
          {
            goto LABEL_52;
          }
          i -= 12;
        }
      }
      unint64_t i = a2;
      if (v25 < a2)
      {
        for (unint64_t i = a2 - 12; ; i -= 12)
        {
          short float v28 = *(short float *)(i + 8);
          if (v28 == v18)
          {
            if (*(_DWORD *)i < v17) {
              break;
            }
            if (v17 >= *(_DWORD *)i)
            {
              if (*(_DWORD *)(i + 4) < v22 || v25 >= i) {
                break;
              }
            }
            else if (v25 >= i)
            {
              break;
            }
          }
          else if (v28 > v18 || v25 >= i)
          {
            break;
          }
        }
      }
LABEL_52:
      unint64_t j = v9 + v21 + 12;
      if (v25 < i)
      {
        unint64_t v31 = i;
        do
        {
          int v32 = *(_DWORD *)j;
          *(_DWORD *)unint64_t j = *(_DWORD *)v31;
          *(_DWORD *)unint64_t v31 = v32;
          int v33 = *(_DWORD *)(j + 4);
          *(_DWORD *)(j + 4) = *(_DWORD *)(v31 + 4);
          *(_DWORD *)(v31 + 4) = v33;
          __int16 v34 = *(_WORD *)(j + 8);
          *(_WORD *)(j + 8) = *(_WORD *)(v31 + 8);
          *(_WORD *)(v31 + 8) = v34;
          do
          {
            while (1)
            {
              j += 12;
              short float v35 = *(short float *)(j + 8);
              if (v35 == v18) {
                break;
              }
              if (v35 <= v18) {
                goto LABEL_65;
              }
            }
          }
          while (*(_DWORD *)j < v17 || v17 >= *(_DWORD *)j && *(_DWORD *)(j + 4) < v22);
          do
          {
LABEL_65:
            while (1)
            {
              v31 -= 12;
              short float v36 = *(short float *)(v31 + 8);
              if (v36 == v18) {
                break;
              }
              if (v36 > v18) {
                goto LABEL_67;
              }
            }
          }
          while (*(_DWORD *)v31 >= v17 && (v17 < *(_DWORD *)v31 || *(_DWORD *)(v31 + 4) >= v22));
LABEL_67:
          ;
        }
        while (j < v31);
      }
      if (j - 12 != v9)
      {
        *(_DWORD *)unint64_t v9 = *(_DWORD *)(j - 12);
        *(_DWORD *)(v9 + 4) = *(_DWORD *)(j - 8);
        *(_WORD *)(v9 + 8) = *(_WORD *)(j - 4);
      }
      *(_DWORD *)(j - 12) = v17;
      *(_DWORD *)(j - 8) = v22;
      *(short float *)(j - 4) = v18;
      if (v25 < i)
      {
LABEL_73:
        result = std::__introsort<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<half>(half const*,half const*,half const*,half const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,half> const&,std::pair<std::pair<int,int>,half> const&)#1} &,std::pair<std::pair<int,int>,half>*,false>(v9, j - 12, a3, a4 & 1);
        a4 = 0;
      }
      else
      {
        BOOL v37 = std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<half>(half const*,half const*,half const*,half const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,half> const&,std::pair<std::pair<int,int>,half> const&)#1} &,std::pair<std::pair<int,int>,half>*>(v9, j - 12);
        result = std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<half>(half const*,half const*,half const*,half const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,half> const&,std::pair<std::pair<int,int>,half> const&)#1} &,std::pair<std::pair<int,int>,half>*>(j, a2);
        if (result)
        {
          a2 = j - 12;
          if (v37) {
            return result;
          }
          goto LABEL_2;
        }
        if (!v37) {
          goto LABEL_73;
        }
      }
    }
    else
    {
      short float v19 = *(short float *)(v9 - 4);
      short float v18 = *(short float *)(v9 + 8);
      if (v19 == v18)
      {
        int v20 = *(_DWORD *)(v9 - 12);
        int v17 = *(_DWORD *)v9;
        if (v20 < *(_DWORD *)v9 || v17 >= v20 && *(_DWORD *)(v9 - 8) < *(_DWORD *)(v9 + 4)) {
          goto LABEL_18;
        }
      }
      else
      {
        int v17 = *(_DWORD *)v9;
        if (v19 > v18) {
          goto LABEL_18;
        }
      }
      int v38 = *(_DWORD *)(v9 + 4);
      short float v39 = *(short float *)(a2 - 4);
      if (v18 == v39)
      {
        int v40 = *(_DWORD *)(a2 - 12);
        if (v17 < v40 || v40 >= v17 && v38 < *(_DWORD *)(a2 - 8))
        {
LABEL_80:
          for (unint64_t j = v9 + 12; ; j += 12)
          {
            short float v41 = *(short float *)(j + 8);
            if (v18 == v41)
            {
              if (v17 < *(_DWORD *)j || *(_DWORD *)j >= v17 && v38 < *(_DWORD *)(j + 4)) {
                goto LABEL_97;
              }
            }
            else if (v18 > v41)
            {
              goto LABEL_97;
            }
          }
        }
      }
      else if (v18 > v39)
      {
        goto LABEL_80;
      }
      for (unint64_t j = v9 + 12; j < a2; j += 12)
      {
        short float v42 = *(short float *)(j + 8);
        if (v18 == v42)
        {
          if (v17 < *(_DWORD *)j || *(_DWORD *)j >= v17 && v38 < *(_DWORD *)(j + 4)) {
            break;
          }
        }
        else if (v18 > v42)
        {
          break;
        }
      }
LABEL_97:
      v43 = (short float *)a2;
      if (j >= a2) {
        goto LABEL_120;
      }
      v44 = (short float *)(a2 - 8);
      while (v18 != v39)
      {
        if (v18 <= v39) {
          goto LABEL_106;
        }
LABEL_105:
        short float v39 = *(v44 - 4);
        v44 -= 6;
      }
      int v45 = *((_DWORD *)v44 - 1);
      if (v17 < v45 || v45 >= v17 && v38 < *(_DWORD *)v44) {
        goto LABEL_105;
      }
LABEL_106:
      v43 = v44 - 2;
LABEL_120:
      while (j < (unint64_t)v43)
      {
        int v46 = *(_DWORD *)j;
        *(_DWORD *)unint64_t j = *(_DWORD *)v43;
        *(_DWORD *)v43 = v46;
        int v47 = *(_DWORD *)(j + 4);
        *(_DWORD *)(j + 4) = *((_DWORD *)v43 + 1);
        *((_DWORD *)v43 + 1) = v47;
        __int16 v48 = *(_WORD *)(j + 8);
        *(short float *)(j + 8) = v43[4];
        *((_WORD *)v43 + 4) = v48;
        do
        {
          while (1)
          {
            j += 12;
            short float v49 = *(short float *)(j + 8);
            if (v18 == v49) {
              break;
            }
            if (v18 > v49) {
              goto LABEL_118;
            }
          }
        }
        while (v17 >= *(_DWORD *)j && (*(_DWORD *)j < v17 || v38 >= *(_DWORD *)(j + 4)));
        do
        {
LABEL_118:
          while (1)
          {
            v43 -= 6;
            short float v50 = v43[4];
            if (v18 == v50) {
              break;
            }
            if (v18 <= v50) {
              goto LABEL_120;
            }
          }
        }
        while (v17 < *(_DWORD *)v43 || *(_DWORD *)v43 >= v17 && v38 < *((_DWORD *)v43 + 1));
      }
      BOOL v4 = j - 12 >= v9;
      BOOL v5 = j - 12 == v9;
      if (j - 12 != v9)
      {
        *(_DWORD *)unint64_t v9 = *(_DWORD *)(j - 12);
        *(_DWORD *)(v9 + 4) = *(_DWORD *)(j - 8);
        *(_WORD *)(v9 + 8) = *(_WORD *)(j - 4);
      }
      a4 = 0;
      *(_DWORD *)(j - 12) = v17;
      *(_DWORD *)(j - 8) = v38;
      *(short float *)(j - 4) = v18;
    }
  }
  v55 = (_DWORD *)(j + 12);
  BOOL v57 = j == a2 || v55 == (_DWORD *)a2;
  if ((a4 & 1) == 0)
  {
    if (v57) {
      return result;
    }
    for (unint64_t k = j + 4; ; k += 12)
    {
      unint64_t v117 = v9;
      unint64_t v9 = (unint64_t)v55;
      short float v118 = *(short float *)(v117 + 20);
      short float v119 = *(short float *)(v117 + 8);
      if (v118 == v119) {
        break;
      }
      if (v118 > v119)
      {
        int v120 = *v55;
LABEL_250:
        int v121 = *(_DWORD *)(v117 + 16);
        for (unint64_t m = k; ; m -= 12)
        {
          int v123 = *(_DWORD *)m;
          *(_DWORD *)(m + 8) = *(_DWORD *)(m - 4);
          *(_DWORD *)(m + 12) = v123;
          *(short float *)(m + 16) = v119;
          short float v119 = *(short float *)(m - 8);
          if (v118 == v119)
          {
            int v124 = *(_DWORD *)(m - 16);
            if (v120 >= v124 && (v124 < v120 || v121 >= *(_DWORD *)(m - 12)))
            {
LABEL_258:
              *(_DWORD *)(m - 4) = v120;
              *(_DWORD *)unint64_t m = v121;
              *(short float *)(m + 4) = v118;
              break;
            }
          }
          else if (v118 <= v119)
          {
            goto LABEL_258;
          }
        }
      }
LABEL_259:
      v55 = (_DWORD *)(v9 + 12);
      if (v9 + 12 == a2) {
        return result;
      }
    }
    int v120 = *v55;
    if (*v55 >= *(_DWORD *)v117 && (*(_DWORD *)v117 < v120 || *(_DWORD *)(v117 + 16) >= *(_DWORD *)(v117 + 4))) {
      goto LABEL_259;
    }
    goto LABEL_250;
  }
  if (v57) {
    return result;
  }
  uint64_t v58 = 0;
  v59 = (_DWORD *)j;
  while (2)
  {
    v60 = (short float *)v59;
    v59 = v55;
    short float v61 = v60[10];
    short float v62 = v60[4];
    if (v61 == v62)
    {
      int v63 = *v55;
      int v64 = *(_DWORD *)v60;
      if (v63 >= *(_DWORD *)v60 && (v64 < v63 || *((_DWORD *)v60 + 4) >= *((_DWORD *)v60 + 1))) {
        goto LABEL_167;
      }
    }
    else
    {
      if (v61 <= v62) {
        goto LABEL_167;
      }
      int v63 = *v55;
      int v64 = *(_DWORD *)v60;
    }
    int v65 = *((_DWORD *)v60 + 4);
    *((_DWORD *)v60 + 3) = v64;
    v59[1] = *((_DWORD *)v60 + 1);
    *((short float *)v59 + 4) = v62;
    unint64_t v66 = j;
    if (v60 == (short float *)j) {
      goto LABEL_166;
    }
    uint64_t v67 = v58;
    while (2)
    {
      uint64_t v68 = j + v67;
      short float v69 = *(short float *)(j + v67 - 4);
      if (v61 != v69)
      {
        if (v61 <= v69) {
          break;
        }
        int v70 = *(_DWORD *)(v68 - 12);
        goto LABEL_163;
      }
      int v70 = *(_DWORD *)(v68 - 12);
      if (v63 < v70) {
        goto LABEL_163;
      }
      if (v70 < v63)
      {
        unint64_t v66 = j + v67;
        goto LABEL_166;
      }
      if (v65 < *(_DWORD *)(j + v67 - 8))
      {
LABEL_163:
        uint64_t v71 = j + v67;
        int v72 = *(_DWORD *)(j + v67 - 8);
        v60 -= 6;
        *(_DWORD *)uint64_t v71 = v70;
        *(_DWORD *)(v71 + 4) = v72;
        *(short float *)(v71 + 8) = v69;
        v67 -= 12;
        if (!v67)
        {
          unint64_t v66 = j;
          goto LABEL_166;
        }
        continue;
      }
      break;
    }
    unint64_t v66 = (unint64_t)v60;
LABEL_166:
    *(_DWORD *)unint64_t v66 = v63;
    *(_DWORD *)(v66 + 4) = v65;
    *(short float *)(v66 + 8) = v61;
LABEL_167:
    v55 = v59 + 3;
    v58 += 12;
    if (v59 + 3 != (_DWORD *)a2) {
      continue;
    }
    return result;
  }
}

short float *std::__sort5_maybe_branchless[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<half>(half const*,half const*,half const*,half const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,half> const&,std::pair<std::pair<int,int>,half> const&)#1} &,std::pair<std::pair<int,int>,half>*,0>(short float *a1, short float *a2, short float *a3, short float *a4, short float *a5)
{
  result = std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<half>(half const*,half const*,half const*,half const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,half> const&,std::pair<std::pair<int,int>,half> const&)#1} &,std::pair<std::pair<int,int>,half>*>(a1, a2, a3, a4);
  short float v11 = a5[4];
  short float v12 = a4[4];
  if (v11 == v12)
  {
    int v14 = *(_DWORD *)a5;
    int v13 = *(_DWORD *)a4;
    if (*(_DWORD *)a5 >= *(_DWORD *)a4 && (v13 < v14 || *((_DWORD *)a5 + 1) >= *((_DWORD *)a4 + 1))) {
      return result;
    }
  }
  else
  {
    if (v11 <= v12) {
      return result;
    }
    int v13 = *(_DWORD *)a4;
    int v14 = *(_DWORD *)a5;
  }
  *(_DWORD *)a4 = v14;
  *(_DWORD *)a5 = v13;
  int v15 = *((_DWORD *)a4 + 1);
  *((_DWORD *)a4 + 1) = *((_DWORD *)a5 + 1);
  *((_DWORD *)a5 + 1) = v15;
  a4[4] = v11;
  a5[4] = v12;
  short float v16 = a4[4];
  short float v17 = a3[4];
  if (v16 == v17)
  {
    int v19 = *(_DWORD *)a4;
    int v18 = *(_DWORD *)a3;
    if (*(_DWORD *)a4 >= *(_DWORD *)a3 && (v18 < v19 || *((_DWORD *)a4 + 1) >= *((_DWORD *)a3 + 1))) {
      return result;
    }
  }
  else
  {
    if (v16 <= v17) {
      return result;
    }
    int v18 = *(_DWORD *)a3;
    int v19 = *(_DWORD *)a4;
  }
  *(_DWORD *)a3 = v19;
  *(_DWORD *)a4 = v18;
  int v20 = *((_DWORD *)a3 + 1);
  *((_DWORD *)a3 + 1) = *((_DWORD *)a4 + 1);
  *((_DWORD *)a4 + 1) = v20;
  a3[4] = v16;
  a4[4] = v17;
  short float v21 = a3[4];
  short float v22 = a2[4];
  if (v21 == v22)
  {
    int v24 = *(_DWORD *)a3;
    int v23 = *(_DWORD *)a2;
    if (*(_DWORD *)a3 >= *(_DWORD *)a2 && (v23 < v24 || *((_DWORD *)a3 + 1) >= *((_DWORD *)a2 + 1))) {
      return result;
    }
  }
  else
  {
    if (v21 <= v22) {
      return result;
    }
    int v23 = *(_DWORD *)a2;
    int v24 = *(_DWORD *)a3;
  }
  *(_DWORD *)a2 = v24;
  *(_DWORD *)a3 = v23;
  int v25 = *((_DWORD *)a2 + 1);
  *((_DWORD *)a2 + 1) = *((_DWORD *)a3 + 1);
  *((_DWORD *)a3 + 1) = v25;
  a2[4] = v21;
  a3[4] = v22;
  short float v26 = a2[4];
  short float v27 = a1[4];
  if (v26 != v27)
  {
    if (v26 <= v27) {
      return result;
    }
    int v28 = *(_DWORD *)a1;
    int v29 = *(_DWORD *)a2;
    goto LABEL_25;
  }
  int v29 = *(_DWORD *)a2;
  int v28 = *(_DWORD *)a1;
  if (*(_DWORD *)a2 < *(_DWORD *)a1 || v28 >= v29 && *((_DWORD *)a2 + 1) < *((_DWORD *)a1 + 1))
  {
LABEL_25:
    *(_DWORD *)a1 = v29;
    *(_DWORD *)a2 = v28;
    int v30 = *((_DWORD *)a1 + 1);
    *((_DWORD *)a1 + 1) = *((_DWORD *)a2 + 1);
    *((_DWORD *)a2 + 1) = v30;
    a1[4] = v26;
    a2[4] = v27;
  }
  return result;
}

short float *std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<half>(half const*,half const*,half const*,half const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,half> const&,std::pair<std::pair<int,int>,half> const&)#1} &,std::pair<std::pair<int,int>,half>*>(short float *result, short float *a2, short float *a3)
{
  short float v3 = a2[4];
  short float v4 = result[4];
  if (v3 == v4)
  {
    if (*(_DWORD *)a2 >= *(_DWORD *)result
      && (*(_DWORD *)result < *(_DWORD *)a2 || *((_DWORD *)a2 + 1) >= *((_DWORD *)result + 1)))
    {
      goto LABEL_10;
    }
LABEL_7:
    short float v5 = a3[4];
    if (v5 == v3)
    {
      int v6 = *(_DWORD *)a3;
      int v10 = *(_DWORD *)a2;
      if (*(_DWORD *)a3 < *(_DWORD *)a2 || v10 >= v6 && *((_DWORD *)a3 + 1) < *((_DWORD *)a2 + 1)) {
        goto LABEL_14;
      }
    }
    else
    {
      if (v5 > v3)
      {
        int v6 = *(_DWORD *)a3;
LABEL_14:
        int v11 = *(_DWORD *)result;
        *(_DWORD *)result = v6;
        *(_DWORD *)a3 = v11;
        int v12 = *((_DWORD *)result + 1);
        *((_DWORD *)result + 1) = *((_DWORD *)a3 + 1);
        *((_DWORD *)a3 + 1) = v12;
        result[4] = v5;
        goto LABEL_35;
      }
      int v10 = *(_DWORD *)a2;
    }
    int v18 = *(_DWORD *)result;
    *(_DWORD *)result = v10;
    *(_DWORD *)a2 = v18;
    int v19 = *((_DWORD *)result + 1);
    *((_DWORD *)result + 1) = *((_DWORD *)a2 + 1);
    *((_DWORD *)a2 + 1) = v19;
    result[4] = v3;
    a2[4] = v4;
    short float v20 = a3[4];
    if (v20 == v4)
    {
      int v22 = *(_DWORD *)a3;
      int v21 = *(_DWORD *)a2;
      if (*(_DWORD *)a3 >= *(_DWORD *)a2 && (v21 < v22 || *((_DWORD *)a3 + 1) >= v19)) {
        return result;
      }
    }
    else
    {
      if (v20 <= v4) {
        return result;
      }
      int v21 = *(_DWORD *)a2;
      int v22 = *(_DWORD *)a3;
    }
    *(_DWORD *)a2 = v22;
    *(_DWORD *)a3 = v21;
    int v24 = *((_DWORD *)a2 + 1);
    *((_DWORD *)a2 + 1) = *((_DWORD *)a3 + 1);
    *((_DWORD *)a3 + 1) = v24;
    a2[4] = v20;
LABEL_35:
    a3[4] = v4;
    return result;
  }
  if (v3 > v4) {
    goto LABEL_7;
  }
LABEL_10:
  short float v7 = a3[4];
  if (v7 == v3)
  {
    int v9 = *(_DWORD *)a3;
    int v8 = *(_DWORD *)a2;
    if (*(_DWORD *)a3 >= *(_DWORD *)a2 && (v8 < v9 || *((_DWORD *)a3 + 1) >= *((_DWORD *)a2 + 1))) {
      return result;
    }
  }
  else
  {
    if (v7 <= v3) {
      return result;
    }
    int v8 = *(_DWORD *)a2;
    int v9 = *(_DWORD *)a3;
  }
  *(_DWORD *)a2 = v9;
  *(_DWORD *)a3 = v8;
  int v13 = *((_DWORD *)a2 + 1);
  *((_DWORD *)a2 + 1) = *((_DWORD *)a3 + 1);
  *((_DWORD *)a3 + 1) = v13;
  a2[4] = v7;
  a3[4] = v3;
  short float v14 = a2[4];
  short float v15 = result[4];
  if (v14 != v15)
  {
    if (v14 <= v15) {
      return result;
    }
    int v16 = *(_DWORD *)result;
    int v17 = *(_DWORD *)a2;
    goto LABEL_30;
  }
  int v17 = *(_DWORD *)a2;
  int v16 = *(_DWORD *)result;
  if (*(_DWORD *)a2 < *(_DWORD *)result || v16 >= v17 && *((_DWORD *)a2 + 1) < *((_DWORD *)result + 1))
  {
LABEL_30:
    *(_DWORD *)result = v17;
    *(_DWORD *)a2 = v16;
    int v23 = *((_DWORD *)result + 1);
    *((_DWORD *)result + 1) = *((_DWORD *)a2 + 1);
    *((_DWORD *)a2 + 1) = v23;
    result[4] = v14;
    a2[4] = v15;
  }
  return result;
}

BOOL std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<half>(half const*,half const*,half const*,half const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,half> const&,std::pair<std::pair<int,int>,half> const&)#1} &,std::pair<std::pair<int,int>,half>*>(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (a2 - a1) >> 2;
  BOOL result = 1;
  switch(0xAAAAAAAAAAAAAAABLL * v4)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      short float v6 = *(short float *)(a2 - 4);
      short float v7 = *(short float *)(a1 + 8);
      if (v6 != v7)
      {
        if (v6 <= v7) {
          return result;
        }
        int v8 = *(_DWORD *)a1;
        int v9 = *(_DWORD *)(a2 - 12);
        goto LABEL_36;
      }
      int v9 = *(_DWORD *)(a2 - 12);
      int v8 = *(_DWORD *)a1;
      if (v9 < *(_DWORD *)a1 || v8 >= v9 && *(_DWORD *)(a2 - 8) < *(_DWORD *)(a1 + 4))
      {
LABEL_36:
        *(_DWORD *)a1 = v9;
        *(_DWORD *)(a2 - 12) = v8;
        int v25 = *(_DWORD *)(a1 + 4);
        *(_DWORD *)(a1 + 4) = *(_DWORD *)(a2 - 8);
        *(_DWORD *)(a2 - 8) = v25;
        *(short float *)(a1 + 8) = v6;
        *(short float *)(a2 - 4) = v7;
      }
      return result;
    case 3uLL:
      std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<half>(half const*,half const*,half const*,half const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,half> const&,std::pair<std::pair<int,int>,half> const&)#1} &,std::pair<std::pair<int,int>,half>*>((short float *)a1, (short float *)(a1 + 12), (short float *)(a2 - 12));
      return 1;
    case 4uLL:
      std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<half>(half const*,half const*,half const*,half const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,half> const&,std::pair<std::pair<int,int>,half> const&)#1} &,std::pair<std::pair<int,int>,half>*>((short float *)a1, (short float *)(a1 + 12), (short float *)(a1 + 24), (short float *)(a2 - 12));
      return 1;
    case 5uLL:
      std::__sort5_maybe_branchless[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<half>(half const*,half const*,half const*,half const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,half> const&,std::pair<std::pair<int,int>,half> const&)#1} &,std::pair<std::pair<int,int>,half>*,0>((short float *)a1, (short float *)(a1 + 12), (short float *)(a1 + 24), (short float *)(a1 + 36), (short float *)(a2 - 12));
      return 1;
    default:
      uint64_t v10 = a1 + 24;
      std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<half>(half const*,half const*,half const*,half const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,half> const&,std::pair<std::pair<int,int>,half> const&)#1} &,std::pair<std::pair<int,int>,half>*>((short float *)a1, (short float *)(a1 + 12), (short float *)(a1 + 24));
      uint64_t v11 = a1 + 36;
      if (a1 + 36 == a2) {
        return 1;
      }
      uint64_t v12 = 0;
      int v13 = 0;
      break;
  }
LABEL_7:
  short float v14 = *(short float *)(v11 + 8);
  short float v15 = *(short float *)(v10 + 8);
  if (v14 == v15)
  {
    int v16 = *(_DWORD *)v11;
    int v17 = *(_DWORD *)v10;
    if (*(_DWORD *)v11 >= *(_DWORD *)v10 && (v17 < v16 || *(_DWORD *)(v11 + 4) >= *(_DWORD *)(v10 + 4))) {
      goto LABEL_26;
    }
  }
  else
  {
    if (v14 <= v15) {
      goto LABEL_26;
    }
    int v16 = *(_DWORD *)v11;
    int v17 = *(_DWORD *)v10;
  }
  int v18 = *(_DWORD *)(v11 + 4);
  *(_DWORD *)uint64_t v11 = v17;
  *(_DWORD *)(v11 + 4) = *(_DWORD *)(v10 + 4);
  *(short float *)(v11 + 8) = v15;
  uint64_t v19 = a1;
  if (v10 == a1) {
    goto LABEL_25;
  }
  uint64_t v20 = v12;
  while (1)
  {
    uint64_t v21 = a1 + v20;
    short float v22 = *(short float *)(a1 + v20 + 20);
    if (v14 == v22)
    {
      int v23 = *(_DWORD *)(v21 + 12);
      if (v16 >= v23 && (v23 < v16 || v18 >= *(_DWORD *)(a1 + v20 + 16)))
      {
        uint64_t v19 = v10;
LABEL_25:
        *(_DWORD *)uint64_t v19 = v16;
        *(_DWORD *)(v19 + 4) = v18;
        *(short float *)(v19 + 8) = v14;
        if (++v13 == 8) {
          return v11 + 12 == a2;
        }
LABEL_26:
        uint64_t v10 = v11;
        v12 += 12;
        v11 += 12;
        if (v11 == a2) {
          return 1;
        }
        goto LABEL_7;
      }
    }
    else
    {
      if (v14 <= v22)
      {
        uint64_t v19 = a1 + v20 + 24;
        goto LABEL_25;
      }
      int v23 = *(_DWORD *)(v21 + 12);
    }
    v10 -= 12;
    *(_DWORD *)(v21 + 24) = v23;
    uint64_t v24 = a1 + v20;
    *(_DWORD *)(v24 + 28) = *(_DWORD *)(a1 + v20 + 16);
    *(short float *)(v24 + 32) = v22;
    v20 -= 12;
    if (v20 == -24)
    {
      uint64_t v19 = a1;
      goto LABEL_25;
    }
  }
}

short float *std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<half>(half const*,half const*,half const*,half const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,half> const&,std::pair<std::pair<int,int>,half> const&)#1} &,std::pair<std::pair<int,int>,half>*>(short float *a1, short float *a2, short float *a3, short float *a4)
{
  BOOL result = std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<half>(half const*,half const*,half const*,half const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,half> const&,std::pair<std::pair<int,int>,half> const&)#1} &,std::pair<std::pair<int,int>,half>*>(a1, a2, a3);
  short float v9 = a4[4];
  short float v10 = a3[4];
  if (v9 == v10)
  {
    int v12 = *(_DWORD *)a4;
    int v11 = *(_DWORD *)a3;
    if (*(_DWORD *)a4 >= *(_DWORD *)a3 && (v11 < v12 || *((_DWORD *)a4 + 1) >= *((_DWORD *)a3 + 1))) {
      return result;
    }
  }
  else
  {
    if (v9 <= v10) {
      return result;
    }
    int v11 = *(_DWORD *)a3;
    int v12 = *(_DWORD *)a4;
  }
  *(_DWORD *)a3 = v12;
  *(_DWORD *)a4 = v11;
  int v13 = *((_DWORD *)a3 + 1);
  *((_DWORD *)a3 + 1) = *((_DWORD *)a4 + 1);
  *((_DWORD *)a4 + 1) = v13;
  a3[4] = v9;
  a4[4] = v10;
  short float v14 = a3[4];
  short float v15 = a2[4];
  if (v14 == v15)
  {
    int v17 = *(_DWORD *)a3;
    int v16 = *(_DWORD *)a2;
    if (*(_DWORD *)a3 >= *(_DWORD *)a2 && (v16 < v17 || *((_DWORD *)a3 + 1) >= *((_DWORD *)a2 + 1))) {
      return result;
    }
  }
  else
  {
    if (v14 <= v15) {
      return result;
    }
    int v16 = *(_DWORD *)a2;
    int v17 = *(_DWORD *)a3;
  }
  *(_DWORD *)a2 = v17;
  *(_DWORD *)a3 = v16;
  int v18 = *((_DWORD *)a2 + 1);
  *((_DWORD *)a2 + 1) = *((_DWORD *)a3 + 1);
  *((_DWORD *)a3 + 1) = v18;
  a2[4] = v14;
  a3[4] = v15;
  short float v19 = a2[4];
  short float v20 = a1[4];
  if (v19 != v20)
  {
    if (v19 <= v20) {
      return result;
    }
    int v21 = *(_DWORD *)a1;
    int v22 = *(_DWORD *)a2;
    goto LABEL_17;
  }
  int v22 = *(_DWORD *)a2;
  int v21 = *(_DWORD *)a1;
  if (*(_DWORD *)a2 < *(_DWORD *)a1 || v21 >= v22 && *((_DWORD *)a2 + 1) < *((_DWORD *)a1 + 1))
  {
LABEL_17:
    *(_DWORD *)a1 = v22;
    *(_DWORD *)a2 = v21;
    int v23 = *((_DWORD *)a1 + 1);
    *((_DWORD *)a1 + 1) = *((_DWORD *)a2 + 1);
    *((_DWORD *)a2 + 1) = v23;
    a1[4] = v19;
    a2[4] = v20;
  }
  return result;
}

void std::vector<std::pair<std::pair<int,int>,half>>::__append(char **a1, unint64_t a2)
{
  short float v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  short float v5 = v6;
  uint64_t v7 = *(void *)(v4 - 8);
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v6[-v7] >> 2) >= a2)
  {
    if (a2)
    {
      uint64_t v13 = v7 + 12 * a2;
      do
      {
        *(void *)uint64_t v7 = 0;
        *(_WORD *)(v7 + 8) = 0;
        v7 += 12;
      }
      while (v7 != v13);
      uint64_t v7 = v13;
    }
    a1[1] = (char *)v7;
  }
  else
  {
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((v7 - (uint64_t)*a1) >> 2);
    unint64_t v9 = v8 + a2;
    if (v8 + a2 > 0x1555555555555555) {
      abort();
    }
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((v5 - *a1) >> 2);
    if (2 * v10 > v9) {
      unint64_t v9 = 2 * v10;
    }
    if (v10 >= 0xAAAAAAAAAAAAAAALL) {
      unint64_t v11 = 0x1555555555555555;
    }
    else {
      unint64_t v11 = v9;
    }
    if (v11) {
      int v12 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<std::pair<int,int>,half>>>(v4, v11);
    }
    else {
      int v12 = 0;
    }
    short float v14 = &v12[12 * v8];
    short float v15 = &v14[12 * a2];
    int v16 = v14;
    do
    {
      *(void *)int v16 = 0;
      *((_WORD *)v16 + 4) = 0;
      v16 += 12;
    }
    while (v16 != v15);
    int v17 = &v12[12 * v11];
    short float v19 = *a1;
    int v18 = a1[1];
    if (v18 != *a1)
    {
      do
      {
        uint64_t v20 = *(void *)(v18 - 12);
        v18 -= 12;
        int v21 = *((_DWORD *)v18 + 2);
        *(void *)(v14 - 12) = v20;
        v14 -= 12;
        *((_DWORD *)v14 + 2) = v21;
      }
      while (v18 != v19);
      int v18 = *a1;
    }
    *a1 = v14;
    a1[1] = v15;
    a1[2] = v17;
    if (v18)
    {
      operator delete(v18);
    }
  }
}

void std::__tree<std::__value_type<std::pair<int,int>,float>,std::__map_value_compare<std::pair<int,int>,std::__value_type<std::pair<int,int>,float>,std::less<std::pair<int,int>>,true>,std::allocator<std::__value_type<std::pair<int,int>,float>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::pair<int,int>,float>,std::__map_value_compare<std::pair<int,int>,std::__value_type<std::pair<int,int>,float>,std::less<std::pair<int,int>>,true>,std::allocator<std::__value_type<std::pair<int,int>,float>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<std::pair<int,int>,float>,std::__map_value_compare<std::pair<int,int>,std::__value_type<std::pair<int,int>,float>,std::less<std::pair<int,int>>,true>,std::allocator<std::__value_type<std::pair<int,int>,float>>>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

void std::vector<std::pair<std::pair<int,int>,float>>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 2);
  BOOL v3 = a2 >= v2;
  unint64_t v4 = a2 - v2;
  if (v4 != 0 && v3)
  {
    std::vector<std::pair<std::pair<int,int>,float>>::__append((char **)a1, v4);
  }
  else if (!v3)
  {
    *(void *)(a1 + 8) = *(void *)a1 + 12 * a2;
  }
}

char *std::__tree<std::__value_type<std::pair<int,int>,float>,std::__map_value_compare<std::pair<int,int>,std::__value_type<std::pair<int,int>,float>,std::less<std::pair<int,int>>,true>,std::allocator<std::__value_type<std::pair<int,int>,float>>>::__emplace_unique_key_args<std::pair<int,int>,std::pair<std::pair<int,int>,float>>(uint64_t **a1, int *a2, uint64_t a3)
{
  short float v5 = std::__tree<std::__value_type<std::pair<int,int>,float>,std::__map_value_compare<std::pair<int,int>,std::__value_type<std::pair<int,int>,float>,std::less<std::pair<int,int>>,true>,std::allocator<std::__value_type<std::pair<int,int>,float>>>::__find_equal<std::pair<int,int>>((uint64_t)a1, &v9, a2);
  short float v6 = (char *)*v5;
  if (!*v5)
  {
    uint64_t v7 = (uint64_t **)v5;
    short float v6 = (char *)operator new(0x28uLL);
    *(void *)(v6 + 28) = *(void *)a3;
    *((_DWORD *)v6 + 9) = *(_DWORD *)(a3 + 8);
    std::__tree<std::__value_type<std::pair<int,int>,float>,std::__map_value_compare<std::pair<int,int>,std::__value_type<std::pair<int,int>,float>,std::less<std::pair<int,int>>,true>,std::allocator<std::__value_type<std::pair<int,int>,float>>>::__insert_node_at(a1, v9, v7, (uint64_t *)v6);
  }
  return v6;
}

void *std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:nn180100]<std::__map_iterator<std::__tree_iterator<std::__value_type<std::pair<int,int>,float>,std::__tree_node<std::__value_type<std::pair<int,int>,float>,void *> *,long>>,std::__map_iterator<std::__tree_iterator<std::__value_type<std::pair<int,int>,float>,std::__tree_node<std::__value_type<std::pair<int,int>,float>,void *> *,long>>,std::back_insert_iterator<std::vector<std::pair<std::pair<int,int>,float>>>>(uint64_t a1, void *a2, void *a3, char **a4)
{
  unint64_t v4 = a2;
  int v12 = a4;
  if (a2 == a3) {
    return a2;
  }
  short float v5 = a3;
  do
  {
    uint64_t v10 = *(void *)((char *)v4 + 28);
    int v11 = *((_DWORD *)v4 + 9);
    std::back_insert_iterator<std::vector<std::pair<std::pair<int,int>,half>>>::operator=[abi:nn180100](&v12, &v10);
    short float v6 = (void *)v4[1];
    if (v6)
    {
      do
      {
        uint64_t v7 = v6;
        short float v6 = (void *)*v6;
      }
      while (v6);
    }
    else
    {
      do
      {
        uint64_t v7 = (void *)v4[2];
        BOOL v8 = *v7 == (void)v4;
        unint64_t v4 = v7;
      }
      while (!v8);
    }
    unint64_t v4 = v7;
  }
  while (v7 != v5);
  return v5;
}

unint64_t std::__introsort<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<float>(float const*,float const*,float const*,float const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,float> const&,std::pair<std::pair<int,int>,float> const&)#1} &,std::pair<std::pair<int,int>,float>*,false>(unint64_t result, unint64_t a2, uint64_t a3, char a4)
{
  unint64_t v9 = result;
LABEL_2:
  unint64_t j = v9;
  while (1)
  {
    unint64_t v9 = j;
    uint64_t v11 = a2 - j;
    unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(a2 - j) >> 2);
    if (v5 || !v4)
    {
      switch(v12)
      {
        case 0uLL:
        case 1uLL:
          return result;
        case 2uLL:
          float v51 = *(float *)(a2 - 4);
          float v52 = *(float *)(j + 8);
          if (v51 == v52)
          {
            int v54 = *(_DWORD *)(a2 - 12);
            float v53 = *(float *)j;
            if (v54 >= *(_DWORD *)j && (SLODWORD(v53) < v54 || *(_DWORD *)(a2 - 8) >= *(_DWORD *)(j + 4))) {
              return result;
            }
          }
          else
          {
            if (v51 <= v52) {
              return result;
            }
            float v53 = *(float *)j;
            int v54 = *(_DWORD *)(a2 - 12);
          }
          *(_DWORD *)unint64_t j = v54;
          *(float *)(a2 - 12) = v53;
          int v125 = *(_DWORD *)(j + 4);
          *(_DWORD *)(j + 4) = *(_DWORD *)(a2 - 8);
          *(_DWORD *)(a2 - 8) = v125;
          *(float *)(j + 8) = v51;
          *(float *)(a2 - 4) = v52;
          return result;
        case 3uLL:
          return (unint64_t)std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<float>(float const*,float const*,float const*,float const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,float> const&,std::pair<std::pair<int,int>,float> const&)#1} &,std::pair<std::pair<int,int>,float>*>((float *)j, (float *)(j + 12), (float *)(a2 - 12));
        case 4uLL:
          return (unint64_t)std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<float>(float const*,float const*,float const*,float const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,float> const&,std::pair<std::pair<int,int>,float> const&)#1} &,std::pair<std::pair<int,int>,float>*>(j, j + 12, j + 24, a2 - 12);
        case 5uLL:
          return (unint64_t)std::__sort5_maybe_branchless[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<float>(float const*,float const*,float const*,float const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,float> const&,std::pair<std::pair<int,int>,float> const&)#1} &,std::pair<std::pair<int,int>,float>*,0>(j, j + 12, j + 24, j + 36, (float *)(a2 - 12));
        default:
          JUMPOUT(0);
      }
    }
    if (v11 <= 287) {
      break;
    }
    if (!a3)
    {
      if (j == a2) {
        return result;
      }
      int64_t v73 = (v12 - 2) >> 1;
      int64_t v74 = v73;
      while (1)
      {
        int64_t v75 = v74;
        if (v73 < v74) {
          goto LABEL_204;
        }
        uint64_t v76 = (2 * v74) | 1;
        unint64_t v77 = j + 12 * v76;
        if (2 * v75 + 2 >= (uint64_t)v12) {
          goto LABEL_178;
        }
        float v78 = *(float *)(j + 12 * v76 + 8);
        float v79 = *(float *)(v77 + 20);
        if (v78 == v79)
        {
          int v80 = *(_DWORD *)(v77 + 12);
          if (*(_DWORD *)v77 >= v80 && (v80 < *(_DWORD *)v77 || *(_DWORD *)(v77 + 4) >= *(_DWORD *)(v77 + 16))) {
            goto LABEL_178;
          }
        }
        else if (v78 <= v79)
        {
          goto LABEL_178;
        }
        v77 += 12;
        uint64_t v76 = 2 * v75 + 2;
LABEL_178:
        unint64_t v81 = j + 12 * v75;
        float v82 = *(float *)(v77 + 8);
        float v83 = *(float *)(v81 + 8);
        if (v82 == v83)
        {
          int v85 = *(_DWORD *)v77;
          int v84 = *(_DWORD *)v81;
          if (*(_DWORD *)v77 < *(_DWORD *)v81 || v84 >= v85 && *(_DWORD *)(v77 + 4) < *(_DWORD *)(v81 + 4)) {
            goto LABEL_204;
          }
        }
        else
        {
          if (v82 > v83) {
            goto LABEL_204;
          }
          int v84 = *(_DWORD *)v81;
          int v85 = *(_DWORD *)v77;
        }
        int v86 = *(_DWORD *)(v81 + 4);
        *(_DWORD *)unint64_t v81 = v85;
        *(_DWORD *)(v81 + 4) = *(_DWORD *)(v77 + 4);
        *(float *)(v81 + 8) = v82;
        while (1)
        {
          if (v73 < v76) {
            goto LABEL_203;
          }
          unint64_t v87 = v77;
          uint64_t v88 = 2 * v76;
          uint64_t v76 = (2 * v76) | 1;
          unint64_t v77 = j + 12 * v76;
          uint64_t v89 = v88 + 2;
          if (v89 < (uint64_t)v12)
          {
            float v90 = *(float *)(j + 12 * v76 + 8);
            float v91 = *(float *)(v77 + 20);
            if (v90 == v91)
            {
              int v92 = *(_DWORD *)(v77 + 12);
              if (*(_DWORD *)v77 < v92 || v92 >= *(_DWORD *)v77 && *(_DWORD *)(v77 + 4) < *(_DWORD *)(v77 + 16))
              {
LABEL_191:
                v77 += 12;
                uint64_t v76 = v89;
              }
            }
            else if (v90 > v91)
            {
              goto LABEL_191;
            }
          }
          float v93 = *(float *)(v77 + 8);
          if (v93 == v83) {
            break;
          }
          if (v93 > v83) {
            goto LABEL_202;
          }
          int v94 = *(_DWORD *)v77;
LABEL_198:
          *(_DWORD *)unint64_t v87 = v94;
          *(_DWORD *)(v87 + 4) = *(_DWORD *)(v77 + 4);
          *(float *)(v87 + 8) = v93;
        }
        int v94 = *(_DWORD *)v77;
        if (*(_DWORD *)v77 >= v84 && (v84 < v94 || *(_DWORD *)(v77 + 4) >= v86)) {
          goto LABEL_198;
        }
LABEL_202:
        unint64_t v77 = v87;
LABEL_203:
        *(_DWORD *)unint64_t v77 = v84;
        *(_DWORD *)(v77 + 4) = v86;
        *(float *)(v77 + 8) = v83;
LABEL_204:
        int64_t v74 = v75 - 1;
        if (!v75)
        {
          int64_t v95 = v11 / 0xCuLL;
          while (1)
          {
            uint64_t v96 = 0;
            float v97 = *(float *)j;
            unsigned int v98 = *(_DWORD *)(j + 4);
            unsigned int v99 = *(_DWORD *)(j + 8);
            v100 = (unsigned int *)j;
            do
            {
              v101 = v100;
              BOOL result = v96 + 1;
              v100 += 3 * v96 + 3;
              uint64_t v102 = 2 * v96;
              uint64_t v96 = (2 * v96) | 1;
              int64_t v103 = v102 + 2;
              if (v103 >= v95) {
                goto LABEL_218;
              }
              BOOL result = (unint64_t)&v101[3 * result];
              float v104 = *(float *)(result + 8);
              float v105 = *((float *)v100 + 5);
              if (v104 == v105)
              {
                BOOL result = *v100;
                int v106 = v100[3];
                if ((int)result < v106 || v106 >= (int)result && (BOOL result = v100[1], (int)result < (int)v100[4]))
                {
LABEL_217:
                  v100 += 3;
                  uint64_t v96 = v103;
                }
              }
              else if (v104 > v105)
              {
                goto LABEL_217;
              }
LABEL_218:
              unsigned int *v101 = *v100;
              v101[1] = v100[1];
              v101[2] = v100[2];
            }
            while (v96 <= (uint64_t)((unint64_t)(v95 - 2) >> 1));
            if (v100 == (unsigned int *)(a2 - 12))
            {
              *(float *)v100 = v97;
              v100[1] = v98;
              v100[2] = v99;
            }
            else
            {
              unsigned int *v100 = *(_DWORD *)(a2 - 12);
              v100[1] = *(_DWORD *)(a2 - 8);
              v100[2] = *(_DWORD *)(a2 - 4);
              *(float *)(a2 - 12) = v97;
              *(_DWORD *)(a2 - 8) = v98;
              *(_DWORD *)(a2 - 4) = v99;
              uint64_t v107 = (uint64_t)v100 - j + 12;
              if (v107 >= 13)
              {
                unint64_t v108 = v107 / 0xCuLL - 2;
                unint64_t v109 = v108 >> 1;
                v110 = (float *)(j + 12 * (v108 >> 1));
                float v111 = v110[2];
                float v112 = *((float *)v100 + 2);
                if (v111 == v112)
                {
                  BOOL result = *(unsigned int *)v110;
                  int v113 = *v100;
                  if ((int)result < (int)*v100 || v113 >= (int)result && *((_DWORD *)v110 + 1) < (signed int)v100[1]) {
                    goto LABEL_226;
                  }
                }
                else if (v111 > v112)
                {
                  int v113 = *v100;
                  *(float *)&BOOL result = *v110;
LABEL_226:
                  signed int v114 = v100[1];
                  while (1)
                  {
                    unsigned int *v100 = result;
                    BOOL result = *((unsigned int *)v110 + 1);
                    v100[1] = result;
                    *((float *)v100 + 2) = v111;
                    if (v108 < 2) {
                      break;
                    }
                    v100 = (unsigned int *)v110;
                    unint64_t v108 = v109 - 1;
                    unint64_t v109 = (v109 - 1) >> 1;
                    v110 = (float *)(j + 12 * v109);
                    float v111 = v110[2];
                    if (v111 == v112)
                    {
                      BOOL result = *(unsigned int *)v110;
                      if ((int)result >= v113 && (v113 < (int)result || *((_DWORD *)v110 + 1) >= v114))
                      {
LABEL_234:
                        v110 = (float *)v100;
                        break;
                      }
                    }
                    else
                    {
                      if (v111 <= v112) {
                        goto LABEL_234;
                      }
                      *(float *)&BOOL result = *v110;
                    }
                  }
                  *(_DWORD *)v110 = v113;
                  *((_DWORD *)v110 + 1) = v114;
                  v110[2] = v112;
                }
              }
            }
            a2 -= 12;
            if (v95-- <= 2) {
              return result;
            }
          }
        }
      }
    }
    unint64_t v13 = v12 >> 1;
    short float v14 = (float *)(j + 12 * (v12 >> 1));
    if ((unint64_t)v11 >= 0x601)
    {
      std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<float>(float const*,float const*,float const*,float const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,float> const&,std::pair<std::pair<int,int>,float> const&)#1} &,std::pair<std::pair<int,int>,float>*>((float *)v9, (float *)(v9 + 12 * (v12 >> 1)), (float *)(a2 - 12));
      unint64_t v15 = v9 + 12 * v13;
      std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<float>(float const*,float const*,float const*,float const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,float> const&,std::pair<std::pair<int,int>,float> const&)#1} &,std::pair<std::pair<int,int>,float>*>((float *)(v9 + 12), (float *)(v15 - 12), (float *)(a2 - 24));
      std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<float>(float const*,float const*,float const*,float const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,float> const&,std::pair<std::pair<int,int>,float> const&)#1} &,std::pair<std::pair<int,int>,float>*>((float *)(v9 + 24), (float *)(v9 + 12 + 12 * v13), (float *)(a2 - 36));
      BOOL result = (unint64_t)std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<float>(float const*,float const*,float const*,float const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,float> const&,std::pair<std::pair<int,int>,float> const&)#1} &,std::pair<std::pair<int,int>,float>*>((float *)(v15 - 12), v14, (float *)(v9 + 12 + 12 * v13));
      uint64_t v16 = *(void *)v9;
      *(void *)unint64_t v9 = *(void *)v14;
      *(void *)short float v14 = v16;
      LODWORD(v16) = *(_DWORD *)(v9 + 8);
      *(_DWORD *)(v9 + 8) = *(_DWORD *)(v15 + 8);
      *(_DWORD *)(v15 + 8) = v16;
    }
    else
    {
      BOOL result = (unint64_t)std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<float>(float const*,float const*,float const*,float const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,float> const&,std::pair<std::pair<int,int>,float> const&)#1} &,std::pair<std::pair<int,int>,float>*>((float *)(v9 + 12 * (v12 >> 1)), (float *)v9, (float *)(a2 - 12));
    }
    --a3;
    if (a4)
    {
      float v17 = *(float *)v9;
      float v18 = *(float *)(v9 + 8);
LABEL_18:
      uint64_t v21 = 0;
      int v22 = *(_DWORD *)(v9 + 4);
      while (1)
      {
        float v23 = *(float *)(v9 + v21 + 20);
        if (v23 == v18) {
          break;
        }
        if (v23 <= v18) {
          goto LABEL_26;
        }
LABEL_25:
        v21 += 12;
      }
      int v24 = *(_DWORD *)(v9 + v21 + 12);
      if (v24 < SLODWORD(v17) || SLODWORD(v17) >= v24 && *(_DWORD *)(v9 + v21 + 16) < v22) {
        goto LABEL_25;
      }
LABEL_26:
      unint64_t v25 = v9 + v21 + 12;
      unint64_t i = a2 - 12;
      if (v21)
      {
        while (1)
        {
          float v27 = *(float *)(i + 8);
          if (v27 == v18)
          {
            if (*(_DWORD *)i < SLODWORD(v17) || SLODWORD(v17) >= *(_DWORD *)i && *(_DWORD *)(i + 4) < v22) {
              goto LABEL_52;
            }
          }
          else if (v27 > v18)
          {
            goto LABEL_52;
          }
          i -= 12;
        }
      }
      unint64_t i = a2;
      if (v25 < a2)
      {
        for (unint64_t i = a2 - 12; ; i -= 12)
        {
          float v28 = *(float *)(i + 8);
          if (v28 == v18)
          {
            if (*(_DWORD *)i < SLODWORD(v17)) {
              break;
            }
            if (SLODWORD(v17) >= *(_DWORD *)i)
            {
              if (*(_DWORD *)(i + 4) < v22 || v25 >= i) {
                break;
              }
            }
            else if (v25 >= i)
            {
              break;
            }
          }
          else if (v28 > v18 || v25 >= i)
          {
            break;
          }
        }
      }
LABEL_52:
      unint64_t j = v9 + v21 + 12;
      if (v25 < i)
      {
        unint64_t v31 = (float *)i;
        do
        {
          float v32 = *(float *)j;
          *(float *)unint64_t j = *v31;
          *unint64_t v31 = v32;
          int v33 = *(_DWORD *)(j + 4);
          *(float *)(j + 4) = v31[1];
          *((_DWORD *)v31 + 1) = v33;
          int v34 = *(_DWORD *)(j + 8);
          *(float *)(j + 8) = v31[2];
          *((_DWORD *)v31 + 2) = v34;
          do
          {
            while (1)
            {
              j += 12;
              float v35 = *(float *)(j + 8);
              if (v35 == v18) {
                break;
              }
              if (v35 <= v18) {
                goto LABEL_65;
              }
            }
          }
          while (*(_DWORD *)j < SLODWORD(v17) || SLODWORD(v17) >= *(_DWORD *)j && *(_DWORD *)(j + 4) < v22);
          do
          {
LABEL_65:
            while (1)
            {
              v31 -= 3;
              float v36 = v31[2];
              if (v36 == v18) {
                break;
              }
              if (v36 > v18) {
                goto LABEL_67;
              }
            }
          }
          while (*(_DWORD *)v31 >= SLODWORD(v17) && (SLODWORD(v17) < *(_DWORD *)v31 || *((_DWORD *)v31 + 1) >= v22));
LABEL_67:
          ;
        }
        while (j < (unint64_t)v31);
      }
      if (j - 12 != v9)
      {
        *(_DWORD *)unint64_t v9 = *(_DWORD *)(j - 12);
        *(_DWORD *)(v9 + 4) = *(_DWORD *)(j - 8);
        *(_DWORD *)(v9 + 8) = *(_DWORD *)(j - 4);
      }
      *(float *)(j - 12) = v17;
      *(_DWORD *)(j - 8) = v22;
      *(float *)(j - 4) = v18;
      if (v25 < i)
      {
LABEL_73:
        BOOL result = std::__introsort<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<float>(float const*,float const*,float const*,float const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,float> const&,std::pair<std::pair<int,int>,float> const&)#1} &,std::pair<std::pair<int,int>,float>*,false>(v9, j - 12, a3, a4 & 1);
        a4 = 0;
      }
      else
      {
        BOOL v37 = std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<float>(float const*,float const*,float const*,float const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,float> const&,std::pair<std::pair<int,int>,float> const&)#1} &,std::pair<std::pair<int,int>,float>*>(v9, j - 12);
        BOOL result = std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<float>(float const*,float const*,float const*,float const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,float> const&,std::pair<std::pair<int,int>,float> const&)#1} &,std::pair<std::pair<int,int>,float>*>(j, a2);
        if (result)
        {
          a2 = j - 12;
          if (v37) {
            return result;
          }
          goto LABEL_2;
        }
        if (!v37) {
          goto LABEL_73;
        }
      }
    }
    else
    {
      float v19 = *(float *)(v9 - 4);
      float v18 = *(float *)(v9 + 8);
      if (v19 == v18)
      {
        int v20 = *(_DWORD *)(v9 - 12);
        float v17 = *(float *)v9;
        if (v20 < *(_DWORD *)v9 || SLODWORD(v17) >= v20 && *(_DWORD *)(v9 - 8) < *(_DWORD *)(v9 + 4)) {
          goto LABEL_18;
        }
      }
      else
      {
        float v17 = *(float *)v9;
        if (v19 > v18) {
          goto LABEL_18;
        }
      }
      int v38 = *(_DWORD *)(v9 + 4);
      float v39 = *(float *)(a2 - 4);
      if (v18 == v39)
      {
        int v40 = *(_DWORD *)(a2 - 12);
        if (SLODWORD(v17) < v40 || v40 >= SLODWORD(v17) && v38 < *(_DWORD *)(a2 - 8))
        {
LABEL_80:
          for (unint64_t j = v9 + 12; ; j += 12)
          {
            float v41 = *(float *)(j + 8);
            if (v18 == v41)
            {
              if (SLODWORD(v17) < *(_DWORD *)j || *(_DWORD *)j >= SLODWORD(v17) && v38 < *(_DWORD *)(j + 4)) {
                goto LABEL_97;
              }
            }
            else if (v18 > v41)
            {
              goto LABEL_97;
            }
          }
        }
      }
      else if (v18 > v39)
      {
        goto LABEL_80;
      }
      for (unint64_t j = v9 + 12; j < a2; j += 12)
      {
        float v42 = *(float *)(j + 8);
        if (v18 == v42)
        {
          if (SLODWORD(v17) < *(_DWORD *)j || *(_DWORD *)j >= SLODWORD(v17) && v38 < *(_DWORD *)(j + 4)) {
            break;
          }
        }
        else if (v18 > v42)
        {
          break;
        }
      }
LABEL_97:
      v43 = (float *)a2;
      if (j >= a2) {
        goto LABEL_120;
      }
      v44 = (float *)(a2 - 8);
      while (v18 != v39)
      {
        if (v18 <= v39) {
          goto LABEL_106;
        }
LABEL_105:
        float v39 = *(v44 - 2);
        v44 -= 3;
      }
      int v45 = *((_DWORD *)v44 - 1);
      if (SLODWORD(v17) < v45 || v45 >= SLODWORD(v17) && v38 < *(_DWORD *)v44) {
        goto LABEL_105;
      }
LABEL_106:
      v43 = v44 - 1;
LABEL_120:
      while (j < (unint64_t)v43)
      {
        float v46 = *(float *)j;
        *(float *)unint64_t j = *v43;
        float *v43 = v46;
        int v47 = *(_DWORD *)(j + 4);
        *(float *)(j + 4) = v43[1];
        *((_DWORD *)v43 + 1) = v47;
        int v48 = *(_DWORD *)(j + 8);
        *(float *)(j + 8) = v43[2];
        *((_DWORD *)v43 + 2) = v48;
        do
        {
          while (1)
          {
            j += 12;
            float v49 = *(float *)(j + 8);
            if (v18 == v49) {
              break;
            }
            if (v18 > v49) {
              goto LABEL_118;
            }
          }
        }
        while (SLODWORD(v17) >= *(_DWORD *)j && (*(_DWORD *)j < SLODWORD(v17) || v38 >= *(_DWORD *)(j + 4)));
        do
        {
LABEL_118:
          while (1)
          {
            v43 -= 3;
            float v50 = v43[2];
            if (v18 == v50) {
              break;
            }
            if (v18 <= v50) {
              goto LABEL_120;
            }
          }
        }
        while (SLODWORD(v17) < *(_DWORD *)v43 || *(_DWORD *)v43 >= SLODWORD(v17) && v38 < *((_DWORD *)v43 + 1));
      }
      BOOL v4 = j - 12 >= v9;
      BOOL v5 = j - 12 == v9;
      if (j - 12 != v9)
      {
        *(_DWORD *)unint64_t v9 = *(_DWORD *)(j - 12);
        *(_DWORD *)(v9 + 4) = *(_DWORD *)(j - 8);
        *(_DWORD *)(v9 + 8) = *(_DWORD *)(j - 4);
      }
      a4 = 0;
      *(float *)(j - 12) = v17;
      *(_DWORD *)(j - 8) = v38;
      *(float *)(j - 4) = v18;
    }
  }
  v55 = (_DWORD *)(j + 12);
  BOOL v57 = j == a2 || v55 == (_DWORD *)a2;
  if ((a4 & 1) == 0)
  {
    if (v57) {
      return result;
    }
    for (unint64_t k = j + 4; ; k += 12)
    {
      unint64_t v117 = v9;
      unint64_t v9 = (unint64_t)v55;
      float v118 = *(float *)(v117 + 20);
      float v119 = *(float *)(v117 + 8);
      if (v118 == v119) {
        break;
      }
      if (v118 > v119)
      {
        int v120 = *v55;
LABEL_250:
        int v121 = *(_DWORD *)(v117 + 16);
        for (unint64_t m = k; ; m -= 12)
        {
          int v123 = *(_DWORD *)m;
          *(_DWORD *)(m + 8) = *(_DWORD *)(m - 4);
          *(_DWORD *)(m + 12) = v123;
          *(float *)(m + 16) = v119;
          float v119 = *(float *)(m - 8);
          if (v118 == v119)
          {
            int v124 = *(_DWORD *)(m - 16);
            if (v120 >= v124 && (v124 < v120 || v121 >= *(_DWORD *)(m - 12)))
            {
LABEL_258:
              *(_DWORD *)(m - 4) = v120;
              *(_DWORD *)unint64_t m = v121;
              *(float *)(m + 4) = v118;
              break;
            }
          }
          else if (v118 <= v119)
          {
            goto LABEL_258;
          }
        }
      }
LABEL_259:
      v55 = (_DWORD *)(v9 + 12);
      if (v9 + 12 == a2) {
        return result;
      }
    }
    int v120 = *v55;
    if (*v55 >= *(_DWORD *)v117 && (*(_DWORD *)v117 < v120 || *(_DWORD *)(v117 + 16) >= *(_DWORD *)(v117 + 4))) {
      goto LABEL_259;
    }
    goto LABEL_250;
  }
  if (v57) {
    return result;
  }
  uint64_t v58 = 0;
  v59 = (_DWORD *)j;
  while (2)
  {
    v60 = (float *)v59;
    v59 = v55;
    float v61 = v60[5];
    float v62 = v60[2];
    if (v61 == v62)
    {
      int v63 = *v55;
      int v64 = *(_DWORD *)v60;
      if (v63 >= *(_DWORD *)v60 && (v64 < v63 || *((_DWORD *)v60 + 4) >= *((_DWORD *)v60 + 1))) {
        goto LABEL_167;
      }
    }
    else
    {
      if (v61 <= v62) {
        goto LABEL_167;
      }
      int v63 = *v55;
      int v64 = *(_DWORD *)v60;
    }
    int v65 = *((_DWORD *)v60 + 4);
    *((_DWORD *)v60 + 3) = v64;
    v59[1] = *((_DWORD *)v60 + 1);
    *((float *)v59 + 2) = v62;
    unint64_t v66 = j;
    if (v60 == (float *)j) {
      goto LABEL_166;
    }
    uint64_t v67 = v58;
    while (2)
    {
      uint64_t v68 = j + v67;
      float v69 = *(float *)(j + v67 - 4);
      if (v61 != v69)
      {
        if (v61 <= v69) {
          break;
        }
        int v70 = *(_DWORD *)(v68 - 12);
        goto LABEL_163;
      }
      int v70 = *(_DWORD *)(v68 - 12);
      if (v63 < v70) {
        goto LABEL_163;
      }
      if (v70 < v63)
      {
        unint64_t v66 = j + v67;
        goto LABEL_166;
      }
      if (v65 < *(_DWORD *)(j + v67 - 8))
      {
LABEL_163:
        uint64_t v71 = j + v67;
        int v72 = *(_DWORD *)(j + v67 - 8);
        v60 -= 3;
        *(_DWORD *)uint64_t v71 = v70;
        *(_DWORD *)(v71 + 4) = v72;
        *(float *)(v71 + 8) = v69;
        v67 -= 12;
        if (!v67)
        {
          unint64_t v66 = j;
          goto LABEL_166;
        }
        continue;
      }
      break;
    }
    unint64_t v66 = (unint64_t)v60;
LABEL_166:
    *(_DWORD *)unint64_t v66 = v63;
    *(_DWORD *)(v66 + 4) = v65;
    *(float *)(v66 + 8) = v61;
LABEL_167:
    v55 = v59 + 3;
    v58 += 12;
    if (v59 + 3 != (_DWORD *)a2) {
      continue;
    }
    return result;
  }
}

float *std::__sort5_maybe_branchless[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<float>(float const*,float const*,float const*,float const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,float> const&,std::pair<std::pair<int,int>,float> const&)#1} &,std::pair<std::pair<int,int>,float>*,0>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, float *a5)
{
  BOOL result = std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<float>(float const*,float const*,float const*,float const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,float> const&,std::pair<std::pair<int,int>,float> const&)#1} &,std::pair<std::pair<int,int>,float>*>(a1, a2, a3, a4);
  float v11 = a5[2];
  float v12 = *(float *)(a4 + 8);
  if (v11 == v12)
  {
    float v14 = *a5;
    int v13 = *(_DWORD *)a4;
    if (*(_DWORD *)a5 >= *(_DWORD *)a4 && (v13 < SLODWORD(v14) || *((_DWORD *)a5 + 1) >= *(_DWORD *)(a4 + 4))) {
      return result;
    }
  }
  else
  {
    if (v11 <= v12) {
      return result;
    }
    int v13 = *(_DWORD *)a4;
    float v14 = *a5;
  }
  *(float *)a4 = v14;
  *(_DWORD *)a5 = v13;
  int v15 = *(_DWORD *)(a4 + 4);
  *(float *)(a4 + 4) = a5[1];
  *((_DWORD *)a5 + 1) = v15;
  *(float *)(a4 + 8) = v11;
  a5[2] = v12;
  float v16 = *(float *)(a4 + 8);
  float v17 = *(float *)(a3 + 8);
  if (v16 == v17)
  {
    int v19 = *(_DWORD *)a4;
    int v18 = *(_DWORD *)a3;
    if (*(_DWORD *)a4 >= *(_DWORD *)a3 && (v18 < v19 || *(_DWORD *)(a4 + 4) >= *(_DWORD *)(a3 + 4))) {
      return result;
    }
  }
  else
  {
    if (v16 <= v17) {
      return result;
    }
    int v18 = *(_DWORD *)a3;
    int v19 = *(_DWORD *)a4;
  }
  *(_DWORD *)a3 = v19;
  *(_DWORD *)a4 = v18;
  int v20 = *(_DWORD *)(a3 + 4);
  *(_DWORD *)(a3 + 4) = *(_DWORD *)(a4 + 4);
  *(_DWORD *)(a4 + 4) = v20;
  *(float *)(a3 + 8) = v16;
  *(float *)(a4 + 8) = v17;
  float v21 = *(float *)(a3 + 8);
  float v22 = *(float *)(a2 + 8);
  if (v21 == v22)
  {
    int v24 = *(_DWORD *)a3;
    int v23 = *(_DWORD *)a2;
    if (*(_DWORD *)a3 >= *(_DWORD *)a2 && (v23 < v24 || *(_DWORD *)(a3 + 4) >= *(_DWORD *)(a2 + 4))) {
      return result;
    }
  }
  else
  {
    if (v21 <= v22) {
      return result;
    }
    int v23 = *(_DWORD *)a2;
    int v24 = *(_DWORD *)a3;
  }
  *(_DWORD *)a2 = v24;
  *(_DWORD *)a3 = v23;
  int v25 = *(_DWORD *)(a2 + 4);
  *(_DWORD *)(a2 + 4) = *(_DWORD *)(a3 + 4);
  *(_DWORD *)(a3 + 4) = v25;
  *(float *)(a2 + 8) = v21;
  *(float *)(a3 + 8) = v22;
  float v26 = *(float *)(a2 + 8);
  float v27 = *(float *)(a1 + 8);
  if (v26 != v27)
  {
    if (v26 <= v27) {
      return result;
    }
    int v28 = *(_DWORD *)a1;
    int v29 = *(_DWORD *)a2;
    goto LABEL_25;
  }
  int v29 = *(_DWORD *)a2;
  int v28 = *(_DWORD *)a1;
  if (*(_DWORD *)a2 < *(_DWORD *)a1 || v28 >= v29 && *(_DWORD *)(a2 + 4) < *(_DWORD *)(a1 + 4))
  {
LABEL_25:
    *(_DWORD *)a1 = v29;
    *(_DWORD *)a2 = v28;
    int v30 = *(_DWORD *)(a1 + 4);
    *(_DWORD *)(a1 + 4) = *(_DWORD *)(a2 + 4);
    *(_DWORD *)(a2 + 4) = v30;
    *(float *)(a1 + 8) = v26;
    *(float *)(a2 + 8) = v27;
  }
  return result;
}

float *std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<float>(float const*,float const*,float const*,float const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,float> const&,std::pair<std::pair<int,int>,float> const&)#1} &,std::pair<std::pair<int,int>,float>*>(float *result, float *a2, float *a3)
{
  float v3 = a2[2];
  float v4 = result[2];
  if (v3 == v4)
  {
    if (*(_DWORD *)a2 >= *(_DWORD *)result
      && (*(_DWORD *)result < *(_DWORD *)a2 || *((_DWORD *)a2 + 1) >= *((_DWORD *)result + 1)))
    {
      goto LABEL_10;
    }
LABEL_7:
    float v5 = a3[2];
    if (v5 == v3)
    {
      float v6 = *a3;
      float v10 = *a2;
      if (*(_DWORD *)a3 < *(_DWORD *)a2 || SLODWORD(v10) >= SLODWORD(v6) && *((_DWORD *)a3 + 1) < *((_DWORD *)a2 + 1)) {
        goto LABEL_14;
      }
    }
    else
    {
      if (v5 > v3)
      {
        float v6 = *a3;
LABEL_14:
        float v11 = *result;
        float *result = v6;
        *a3 = v11;
        int v12 = *((_DWORD *)result + 1);
        result[1] = a3[1];
        *((_DWORD *)a3 + 1) = v12;
        result[2] = v5;
        goto LABEL_35;
      }
      float v10 = *a2;
    }
    float v18 = *result;
    float *result = v10;
    *a2 = v18;
    int v19 = *((_DWORD *)result + 1);
    result[1] = a2[1];
    *((_DWORD *)a2 + 1) = v19;
    result[2] = v3;
    a2[2] = v4;
    float v20 = a3[2];
    if (v20 == v4)
    {
      float v22 = *a3;
      float v21 = *a2;
      if (*(_DWORD *)a3 >= *(_DWORD *)a2 && (SLODWORD(v21) < SLODWORD(v22) || *((_DWORD *)a3 + 1) >= v19)) {
        return result;
      }
    }
    else
    {
      if (v20 <= v4) {
        return result;
      }
      float v21 = *a2;
      float v22 = *a3;
    }
    *a2 = v22;
    *a3 = v21;
    int v24 = *((_DWORD *)a2 + 1);
    a2[1] = a3[1];
    *((_DWORD *)a3 + 1) = v24;
    a2[2] = v20;
LABEL_35:
    a3[2] = v4;
    return result;
  }
  if (v3 > v4) {
    goto LABEL_7;
  }
LABEL_10:
  float v7 = a3[2];
  if (v7 == v3)
  {
    float v9 = *a3;
    float v8 = *a2;
    if (*(_DWORD *)a3 >= *(_DWORD *)a2 && (SLODWORD(v8) < SLODWORD(v9) || *((_DWORD *)a3 + 1) >= *((_DWORD *)a2 + 1))) {
      return result;
    }
  }
  else
  {
    if (v7 <= v3) {
      return result;
    }
    float v8 = *a2;
    float v9 = *a3;
  }
  *a2 = v9;
  *a3 = v8;
  int v13 = *((_DWORD *)a2 + 1);
  a2[1] = a3[1];
  *((_DWORD *)a3 + 1) = v13;
  a2[2] = v7;
  a3[2] = v3;
  float v14 = a2[2];
  float v15 = result[2];
  if (v14 != v15)
  {
    if (v14 <= v15) {
      return result;
    }
    float v16 = *result;
    float v17 = *a2;
    goto LABEL_30;
  }
  float v17 = *a2;
  float v16 = *result;
  if (*(_DWORD *)a2 < *(_DWORD *)result
    || SLODWORD(v16) >= SLODWORD(v17) && *((_DWORD *)a2 + 1) < *((_DWORD *)result + 1))
  {
LABEL_30:
    float *result = v17;
    *a2 = v16;
    int v23 = *((_DWORD *)result + 1);
    result[1] = a2[1];
    *((_DWORD *)a2 + 1) = v23;
    result[2] = v14;
    a2[2] = v15;
  }
  return result;
}

BOOL std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<float>(float const*,float const*,float const*,float const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,float> const&,std::pair<std::pair<int,int>,float> const&)#1} &,std::pair<std::pair<int,int>,float>*>(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (a2 - a1) >> 2;
  BOOL result = 1;
  switch(0xAAAAAAAAAAAAAAABLL * v4)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      float v6 = *(float *)(a2 - 4);
      float v7 = *(float *)(a1 + 8);
      if (v6 != v7)
      {
        if (v6 <= v7) {
          return result;
        }
        float v8 = *(float *)a1;
        int v9 = *(_DWORD *)(a2 - 12);
        goto LABEL_36;
      }
      int v9 = *(_DWORD *)(a2 - 12);
      float v8 = *(float *)a1;
      if (v9 < *(_DWORD *)a1 || SLODWORD(v8) >= v9 && *(_DWORD *)(a2 - 8) < *(_DWORD *)(a1 + 4))
      {
LABEL_36:
        *(_DWORD *)a1 = v9;
        *(float *)(a2 - 12) = v8;
        int v25 = *(_DWORD *)(a1 + 4);
        *(_DWORD *)(a1 + 4) = *(_DWORD *)(a2 - 8);
        *(_DWORD *)(a2 - 8) = v25;
        *(float *)(a1 + 8) = v6;
        *(float *)(a2 - 4) = v7;
      }
      return result;
    case 3uLL:
      std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<float>(float const*,float const*,float const*,float const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,float> const&,std::pair<std::pair<int,int>,float> const&)#1} &,std::pair<std::pair<int,int>,float>*>((float *)a1, (float *)(a1 + 12), (float *)(a2 - 12));
      return 1;
    case 4uLL:
      std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<float>(float const*,float const*,float const*,float const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,float> const&,std::pair<std::pair<int,int>,float> const&)#1} &,std::pair<std::pair<int,int>,float>*>(a1, a1 + 12, a1 + 24, a2 - 12);
      return 1;
    case 5uLL:
      std::__sort5_maybe_branchless[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<float>(float const*,float const*,float const*,float const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,float> const&,std::pair<std::pair<int,int>,float> const&)#1} &,std::pair<std::pair<int,int>,float>*,0>(a1, a1 + 12, a1 + 24, a1 + 36, (float *)(a2 - 12));
      return 1;
    default:
      uint64_t v10 = a1 + 24;
      std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<float>(float const*,float const*,float const*,float const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,float> const&,std::pair<std::pair<int,int>,float> const&)#1} &,std::pair<std::pair<int,int>,float>*>((float *)a1, (float *)(a1 + 12), (float *)(a1 + 24));
      uint64_t v11 = a1 + 36;
      if (a1 + 36 == a2) {
        return 1;
      }
      uint64_t v12 = 0;
      int v13 = 0;
      break;
  }
LABEL_7:
  float v14 = *(float *)(v11 + 8);
  float v15 = *(float *)(v10 + 8);
  if (v14 == v15)
  {
    int v16 = *(_DWORD *)v11;
    int v17 = *(_DWORD *)v10;
    if (*(_DWORD *)v11 >= *(_DWORD *)v10 && (v17 < v16 || *(_DWORD *)(v11 + 4) >= *(_DWORD *)(v10 + 4))) {
      goto LABEL_26;
    }
  }
  else
  {
    if (v14 <= v15) {
      goto LABEL_26;
    }
    int v16 = *(_DWORD *)v11;
    int v17 = *(_DWORD *)v10;
  }
  int v18 = *(_DWORD *)(v11 + 4);
  *(_DWORD *)uint64_t v11 = v17;
  *(_DWORD *)(v11 + 4) = *(_DWORD *)(v10 + 4);
  *(float *)(v11 + 8) = v15;
  uint64_t v19 = a1;
  if (v10 == a1) {
    goto LABEL_25;
  }
  uint64_t v20 = v12;
  while (1)
  {
    uint64_t v21 = a1 + v20;
    float v22 = *(float *)(a1 + v20 + 20);
    if (v14 == v22)
    {
      int v23 = *(_DWORD *)(v21 + 12);
      if (v16 >= v23 && (v23 < v16 || v18 >= *(_DWORD *)(a1 + v20 + 16)))
      {
        uint64_t v19 = v10;
LABEL_25:
        *(_DWORD *)uint64_t v19 = v16;
        *(_DWORD *)(v19 + 4) = v18;
        *(float *)(v19 + 8) = v14;
        if (++v13 == 8) {
          return v11 + 12 == a2;
        }
LABEL_26:
        uint64_t v10 = v11;
        v12 += 12;
        v11 += 12;
        if (v11 == a2) {
          return 1;
        }
        goto LABEL_7;
      }
    }
    else
    {
      if (v14 <= v22)
      {
        uint64_t v19 = a1 + v20 + 24;
        goto LABEL_25;
      }
      int v23 = *(_DWORD *)(v21 + 12);
    }
    v10 -= 12;
    *(_DWORD *)(v21 + 24) = v23;
    uint64_t v24 = a1 + v20;
    *(_DWORD *)(v24 + 28) = *(_DWORD *)(a1 + v20 + 16);
    *(float *)(v24 + 32) = v22;
    v20 -= 12;
    if (v20 == -24)
    {
      uint64_t v19 = a1;
      goto LABEL_25;
    }
  }
}

float *std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<float>(float const*,float const*,float const*,float const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,float> const&,std::pair<std::pair<int,int>,float> const&)#1} &,std::pair<std::pair<int,int>,float>*>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  BOOL result = std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<float>(float const*,float const*,float const*,float const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,float> const&,std::pair<std::pair<int,int>,float> const&)#1} &,std::pair<std::pair<int,int>,float>*>((float *)a1, (float *)a2, (float *)a3);
  float v9 = *(float *)(a4 + 8);
  float v10 = *(float *)(a3 + 8);
  if (v9 == v10)
  {
    int v12 = *(_DWORD *)a4;
    float v11 = *(float *)a3;
    if (*(_DWORD *)a4 >= *(_DWORD *)a3 && (SLODWORD(v11) < v12 || *(_DWORD *)(a4 + 4) >= *(_DWORD *)(a3 + 4))) {
      return result;
    }
  }
  else
  {
    if (v9 <= v10) {
      return result;
    }
    float v11 = *(float *)a3;
    int v12 = *(_DWORD *)a4;
  }
  *(_DWORD *)a3 = v12;
  *(float *)a4 = v11;
  int v13 = *(_DWORD *)(a3 + 4);
  *(_DWORD *)(a3 + 4) = *(_DWORD *)(a4 + 4);
  *(_DWORD *)(a4 + 4) = v13;
  *(float *)(a3 + 8) = v9;
  *(float *)(a4 + 8) = v10;
  float v14 = *(float *)(a3 + 8);
  float v15 = *(float *)(a2 + 8);
  if (v14 == v15)
  {
    float v17 = *(float *)a3;
    float v16 = *(float *)a2;
    if (*(_DWORD *)a3 >= *(_DWORD *)a2 && (SLODWORD(v16) < SLODWORD(v17) || *(_DWORD *)(a3 + 4) >= *(_DWORD *)(a2 + 4))) {
      return result;
    }
  }
  else
  {
    if (v14 <= v15) {
      return result;
    }
    float v16 = *(float *)a2;
    float v17 = *(float *)a3;
  }
  *(float *)a2 = v17;
  *(float *)a3 = v16;
  int v18 = *(_DWORD *)(a2 + 4);
  *(_DWORD *)(a2 + 4) = *(_DWORD *)(a3 + 4);
  *(_DWORD *)(a3 + 4) = v18;
  *(float *)(a2 + 8) = v14;
  *(float *)(a3 + 8) = v15;
  float v19 = *(float *)(a2 + 8);
  float v20 = *(float *)(a1 + 8);
  if (v19 != v20)
  {
    if (v19 <= v20) {
      return result;
    }
    float v21 = *(float *)a1;
    float v22 = *(float *)a2;
    goto LABEL_17;
  }
  float v22 = *(float *)a2;
  float v21 = *(float *)a1;
  if (*(_DWORD *)a2 < *(_DWORD *)a1 || SLODWORD(v21) >= SLODWORD(v22) && *(_DWORD *)(a2 + 4) < *(_DWORD *)(a1 + 4))
  {
LABEL_17:
    *(float *)a1 = v22;
    *(float *)a2 = v21;
    int v23 = *(_DWORD *)(a1 + 4);
    *(_DWORD *)(a1 + 4) = *(_DWORD *)(a2 + 4);
    *(_DWORD *)(a2 + 4) = v23;
    *(float *)(a1 + 8) = v19;
    *(float *)(a2 + 8) = v20;
  }
  return result;
}

void std::vector<std::pair<std::pair<int,int>,float>>::__append(char **a1, unint64_t a2)
{
  float v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  float v5 = v6;
  float v7 = *(char **)(v4 - 8);
  if (0xAAAAAAAAAAAAAAABLL * ((v6 - v7) >> 2) >= a2)
  {
    if (a2)
    {
      size_t v13 = 12 * ((12 * a2 - 12) / 0xC) + 12;
      bzero(*(void **)(v4 - 8), v13);
      v7 += v13;
    }
    a1[1] = v7;
  }
  else
  {
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((v7 - *a1) >> 2);
    unint64_t v9 = v8 + a2;
    if (v8 + a2 > 0x1555555555555555) {
      abort();
    }
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((v5 - *a1) >> 2);
    if (2 * v10 > v9) {
      unint64_t v9 = 2 * v10;
    }
    if (v10 >= 0xAAAAAAAAAAAAAAALL) {
      unint64_t v11 = 0x1555555555555555;
    }
    else {
      unint64_t v11 = v9;
    }
    if (v11) {
      int v12 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<std::pair<int,int>,half>>>(v4, v11);
    }
    else {
      int v12 = 0;
    }
    float v14 = &v12[12 * v8];
    float v15 = &v12[12 * v11];
    size_t v16 = 12 * ((12 * a2 - 12) / 0xC) + 12;
    bzero(v14, v16);
    float v17 = &v14[v16];
    float v19 = *a1;
    int v18 = a1[1];
    if (v18 != *a1)
    {
      do
      {
        uint64_t v20 = *(void *)(v18 - 12);
        v18 -= 12;
        int v21 = *((_DWORD *)v18 + 2);
        *(void *)(v14 - 12) = v20;
        v14 -= 12;
        *((_DWORD *)v14 + 2) = v21;
      }
      while (v18 != v19);
      int v18 = *a1;
    }
    *a1 = v14;
    a1[1] = v17;
    a1[2] = v15;
    if (v18)
    {
      operator delete(v18);
    }
  }
}

uint64_t UInt64BitsFromString(void *a1)
{
  uint64_t v4 = 0;
  id v1 = a1;
  int v2 = objc_msgSend(v1, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", &v4, 8, 0, 1, 0, 0, objc_msgSend(v1, "length"), 0);

  if (v2) {
    return v4;
  }
  else {
    return 0;
  }
}

uint64_t SIBytesPerElement(int a1)
{
  uint64_t v1 = 0;
  int v2 = 1278226488;
  while (v2 != a1)
  {
    int v2 = *(_DWORD *)&FormatList[v1 + 24];
    v1 += 24;
    if (v1 == 312) {
      return 0;
    }
  }
  return *(int *)&FormatList[v1 + 16];
}

uint64_t SIMTLPixelFormatFromOSType(int a1)
{
  uint64_t v1 = 0;
  int v2 = 1278226488;
  while (v2 != a1)
  {
    int v2 = *(_DWORD *)&FormatList[v1 + 24];
    v1 += 24;
    if (v1 == 312) {
      return 0;
    }
  }
  return *(void *)&FormatList[v1 + 8];
}

uint64_t SIOSTypeFromMTLPixelFormat(uint64_t a1)
{
  uint64_t v1 = 0;
  while (*(void *)&FormatList[v1 + 8] != a1)
  {
    v1 += 24;
    if (v1 == 312) {
      return 0;
    }
  }
  return *(unsigned int *)&FormatList[v1];
}

uint64_t SIImageFormatMake@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  *a5 = result;
  a5[1] = a2;
  a5[2] = 0;
  a5[3] = a4;
  *((_DWORD *)a5 + 4) = a3;
  return result;
}

size_t SIImageFormatFromPixelBuffer@<X0>(__CVBuffer *a1@<X0>, uint64_t a2@<X8>)
{
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  *(void *)a2 = CVPixelBufferGetWidth(a1);
  size_t result = CVPixelBufferGetHeight(a1);
  uint64_t v6 = 0;
  *(void *)(a2 + 8) = result;
  *(_DWORD *)(a2 + 16) = PixelFormatType;
  int v7 = 1278226488;
  while (v7 != PixelFormatType)
  {
    int v7 = *(_DWORD *)&FormatList[v6 + 24];
    v6 += 24;
    if (v6 == 312)
    {
      uint64_t v8 = 0;
      goto LABEL_6;
    }
  }
  uint64_t v8 = *(void *)&FormatList[v6 + 8];
LABEL_6:
  *(void *)(a2 + 24) = v8;
  return result;
}

uint64_t SIImageFormatFromSurface@<X0>(__IOSurface *a1@<X0>, uint64_t a2@<X8>)
{
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  *(void *)a2 = IOSurfaceGetWidth(a1);
  *(void *)(a2 + 8) = IOSurfaceGetHeight(a1);
  uint64_t result = IOSurfaceGetPixelFormat(a1);
  *(_DWORD *)(a2 + 16) = result;
  *(void *)(a2 + 24) = 0;
  return result;
}

void SIImageFormatFromTexture(void *a1@<X0>, uint64_t a2@<X8>)
{
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  id v3 = a1;
  *(void *)a2 = [v3 width];
  *(void *)(a2 + 8) = [v3 height];
  *(_DWORD *)(a2 + 16) = 0;
  uint64_t v4 = [v3 pixelFormat];

  *(void *)(a2 + 24) = v4;
}

uint64_t SIImageFormatMatch(uint64_t *a1, uint64_t *a2)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  if (*a1 == *a2 && a1[1] == a2[1])
  {
    uint64_t result = 1;
  }
  else
  {
    float v5 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136380931;
      int v33 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIImageFormat.m";
      __int16 v34 = 1025;
      int v35 = 123;
      _os_log_impl(&dword_21B697000, v5, OS_LOG_TYPE_DEFAULT, " %{private}s:%{private}d *** ERROR: unexpected resolution ***", buf, 0x12u);
    }

    uint64_t v6 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *a1;
      uint64_t v8 = a1[1];
      *(_DWORD *)buf = 136381443;
      int v33 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIImageFormat.m";
      __int16 v34 = 1025;
      int v35 = 124;
      __int16 v36 = 2049;
      uint64_t v37 = v7;
      __int16 v38 = 2049;
      uint64_t v39 = v8;
      _os_log_impl(&dword_21B697000, v6, OS_LOG_TYPE_DEFAULT, " %{private}s:%{private}d ***   expected (%{private}lu x %{private}lu) ***", buf, 0x26u);
    }

    unint64_t v9 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *a2;
      uint64_t v11 = a2[1];
      *(_DWORD *)buf = 136381443;
      int v33 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIImageFormat.m";
      __int16 v34 = 1025;
      int v35 = 125;
      __int16 v36 = 2048;
      uint64_t v37 = v10;
      __int16 v38 = 2048;
      uint64_t v39 = v11;
      _os_log_impl(&dword_21B697000, v9, OS_LOG_TYPE_DEFAULT, " %{private}s:%{private}d ***   received (%lu x %lu) ***", buf, 0x26u);
    }

    uint64_t result = 0;
  }
  int v12 = *((_DWORD *)a2 + 4);
  if (v12 && v12 != *((_DWORD *)a1 + 4))
  {
    size_t v13 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136380931;
      int v33 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIImageFormat.m";
      __int16 v34 = 1025;
      int v35 = 130;
      _os_log_impl(&dword_21B697000, v13, OS_LOG_TYPE_DEFAULT, " %{private}s:%{private}d *** ERROR: unexpected ostype ***", buf, 0x12u);
    }

    float v14 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15.i32[0] = *((_DWORD *)a1 + 4);
      int16x8_t v16 = (int16x8_t)vmovl_u8(v15);
      *(int16x4_t *)v16.i8 = vrev64_s16(*(int16x4_t *)v16.i8);
      *(_DWORD *)buf = vmovn_s16(v16).u32[0];
      LOBYTE(v33) = 0;
      int v26 = 136381187;
      float v27 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIImageFormat.m";
      __int16 v28 = 1025;
      int v29 = 131;
      __int16 v30 = 2081;
      unint64_t v31 = buf;
      _os_log_impl(&dword_21B697000, v14, OS_LOG_TYPE_DEFAULT, " %{private}s:%{private}d ***   expected %{private}s ***", (uint8_t *)&v26, 0x1Cu);
    }

    float v17 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18.i32[0] = *((_DWORD *)a2 + 4);
      int16x8_t v19 = (int16x8_t)vmovl_u8(v18);
      *(int16x4_t *)v19.i8 = vrev64_s16(*(int16x4_t *)v19.i8);
      *(_DWORD *)buf = vmovn_s16(v19).u32[0];
      LOBYTE(v33) = 0;
      int v26 = 136381187;
      float v27 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIImageFormat.m";
      __int16 v28 = 1025;
      int v29 = 132;
      __int16 v30 = 2081;
      unint64_t v31 = buf;
      _os_log_impl(&dword_21B697000, v17, OS_LOG_TYPE_DEFAULT, " %{private}s:%{private}d ***   received %{private}s ***", (uint8_t *)&v26, 0x1Cu);
    }

    uint64_t result = 0;
  }
  uint64_t v20 = a2[3];
  if (v20 && v20 != a1[3])
  {
    int v21 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136380931;
      int v33 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIImageFormat.m";
      __int16 v34 = 1025;
      int v35 = 136;
      _os_log_impl(&dword_21B697000, v21, OS_LOG_TYPE_DEFAULT, " %{private}s:%{private}d *** ERROR: unexpected pixelFormat ***", buf, 0x12u);
    }

    float v22 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = a1[3];
      *(_DWORD *)buf = 136381187;
      int v33 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIImageFormat.m";
      __int16 v34 = 1025;
      int v35 = 137;
      __int16 v36 = 2049;
      uint64_t v37 = v23;
      _os_log_impl(&dword_21B697000, v22, OS_LOG_TYPE_DEFAULT, " %{private}s:%{private}d ***   expected %{private}lu ***", buf, 0x1Cu);
    }

    uint64_t v24 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = a2[3];
      *(_DWORD *)buf = 136381187;
      int v33 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIImageFormat.m";
      __int16 v34 = 1025;
      int v35 = 138;
      __int16 v36 = 2048;
      uint64_t v37 = v25;
      _os_log_impl(&dword_21B697000, v24, OS_LOG_TYPE_DEFAULT, " %{private}s:%{private}d ***   received %lu ***", buf, 0x1Cu);
    }

    return 0;
  }
  return result;
}

uint64_t SICheckPixelBuffer(__CVBuffer *a1, _OWORD *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (a1)
  {
    SIImageFormatFromPixelBuffer(a1, (uint64_t)v6);
    long long v3 = a2[1];
    *(_OWORD *)buf = *a2;
    *(_OWORD *)&buf[16] = v3;
    return SIImageFormatMatch((uint64_t *)buf, v6);
  }
  else
  {
    float v5 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136380931;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIImageFormat.m";
      *(_WORD *)&buf[12] = 1025;
      *(_DWORD *)&buf[14] = 145;
      _os_log_impl(&dword_21B697000, v5, OS_LOG_TYPE_DEFAULT, " %{private}s:%{private}d *** ERROR: pixelbuffer is null ***", buf, 0x12u);
    }

    return 0;
  }
}

uint64_t SICheckSurface(__IOSurface *a1, _OWORD *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (a1)
  {
    v7[0] = IOSurfaceGetWidth(a1);
    v7[1] = IOSurfaceGetHeight(a1);
    v7[3] = 0;
    v7[2] = IOSurfaceGetPixelFormat(a1);
    long long v4 = a2[1];
    *(_OWORD *)buf = *a2;
    *(_OWORD *)&buf[16] = v4;
    return SIImageFormatMatch((uint64_t *)buf, v7);
  }
  else
  {
    uint64_t v6 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136380931;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIImageFormat.m";
      *(_WORD *)&buf[12] = 1025;
      *(_DWORD *)&buf[14] = 153;
      _os_log_impl(&dword_21B697000, v6, OS_LOG_TYPE_DEFAULT, " %{private}s:%{private}d *** ERROR: surface is null ***", buf, 0x12u);
    }

    return 0;
  }
}

uint64_t SICheckTexture(void *a1, _OWORD *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (a1)
  {
    SIImageFormatFromTexture(a1, (uint64_t)v6);
    long long v3 = a2[1];
    *(_OWORD *)buf = *a2;
    *(_OWORD *)&buf[16] = v3;
    return SIImageFormatMatch((uint64_t *)buf, v6);
  }
  else
  {
    float v5 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136380931;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIImageFormat.m";
      *(_WORD *)&buf[12] = 1025;
      *(_DWORD *)&buf[14] = 162;
      _os_log_impl(&dword_21B697000, v5, OS_LOG_TYPE_DEFAULT, " %{private}s:%{private}d *** ERROR: texture is null ***", buf, 0x12u);
    }

    return 0;
  }
}

void callback(void *a1, void *a2)
{
}

CVPixelBufferRef SICreateCVPixelBufferFromTexture(void *a1)
{
  v14[1] = *MEMORY[0x263EF8340];
  id v1 = a1;
  CVPixelBufferRef pixelBufferOut = 0;
  if (![v1 iosurface])
  {
    uint64_t v13 = *MEMORY[0x263F04130];
    v14[0] = MEMORY[0x263EFFA78];
    CFDictionaryRef pixelBufferAttributes = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
    OSType v3 = SIOSTypeFromMTLPixelFormat([v1 pixelFormat]);
    uint64_t v4 = [v1 width];
    size_t v5 = 4 * v4 * SIBytesPerElement(v3);
    uint64_t v6 = malloc_type_malloc([v1 height] * v5, 0xF7B039EFuLL);
    memset(v11, 0, 24);
    v11[3] = (CVPixelBufferRef)[v1 width];
    v11[4] = (CVPixelBufferRef)[v1 height];
    v11[5] = (CVPixelBufferRef)1;
    [v1 getBytes:v6 bytesPerRow:v5 fromRegion:v11 mipmapLevel:0];
    CVReturn v7 = CVPixelBufferCreateWithBytes(0, [v1 width], objc_msgSend(v1, "height"), v3, v6, v5, (CVPixelBufferReleaseBytesCallback)callback, 0, pixelBufferAttributes, &pixelBufferOut);
    if (v3 == 1380411457 || v3 == 1380410945)
    {
      CGColorSpaceRef v8 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F00268]);
      CVBufferSetAttachment(pixelBufferOut, (CFStringRef)*MEMORY[0x263F03E38], v8, kCVAttachmentMode_ShouldNotPropagate);
    }
    if (v7)
    {
      CVPixelBufferRelease(pixelBufferOut);

      goto LABEL_9;
    }

LABEL_11:
    CVPixelBufferRef v9 = pixelBufferOut;
    goto LABEL_12;
  }
  if (!CVPixelBufferCreateWithIOSurface(0, (IOSurfaceRef)[v1 iosurface], 0, &pixelBufferOut)) {
    goto LABEL_11;
  }
  CVPixelBufferRelease(pixelBufferOut);
LABEL_9:
  CVPixelBufferRef v9 = 0;
LABEL_12:

  return v9;
}

void sub_21B69F388(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL SISaveCGImage(CGImage *a1, NSString *a2, UTType *a3)
{
  size_t v5 = a3;
  CFURLRef v6 = (const __CFURL *)[NSURL fileURLWithPath:a2];
  id v7 = [(UTType *)v5 identifier];
  CGColorSpaceRef v8 = (const char *)[v7 UTF8String];
  CFStringRef v9 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], v8, 0x8000100u);

  uint64_t v10 = CGImageDestinationCreateWithURL(v6, v9, 1uLL, 0);
  CFRelease(v9);
  if (v10)
  {
    CGImageDestinationAddImage(v10, a1, 0);
    BOOL v11 = CGImageDestinationFinalize(v10);
    CFRelease(v10);
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

void sub_21B69F4A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL SISaveTextureAsPNG(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = a2;
  size_t v5 = SICreateCVPixelBufferFromTexture(v3);
  if (v5)
  {
    CFURLRef v6 = [MEMORY[0x263F00650] imageWithCVPixelBuffer:v5];
    if ([v3 pixelFormat] == 115 || objc_msgSend(v3, "pixelFormat") == 125)
    {
      id v7 = [MEMORY[0x263F00640] filterWithName:@"CIGammaAdjust"];
      [v7 setValue:v6 forKey:*MEMORY[0x263F00968]];
      [v7 setValue:&unk_26CB83EC8 forKey:@"inputPower"];
      uint64_t v8 = [v7 outputImage];

      CFURLRef v6 = (void *)v8;
    }
    CFStringRef v9 = [MEMORY[0x263F00628] contextWithOptions:0];
    unint64_t v10 = [v3 width];
    unint64_t v11 = [v3 height];
    int v12 = (CGImage *)objc_msgSend(v9, "createCGImage:fromRect:format:colorSpace:", v6, *MEMORY[0x263F008B8], CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F00268]), 0.0, 0.0, (double)v10, (double)v11);
    BOOL v13 = SISaveCGImage(v12, v4, (UTType *)*MEMORY[0x263F1DC08]);
    CGImageRelease(v12);
    CVPixelBufferRelease(v5);
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

void sub_21B69F674(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL SISaveCGImageAsPNG(CGImage *a1, NSString *a2)
{
  return SISaveCGImage(a1, a2, (UTType *)*MEMORY[0x263F1DC08]);
}

BOOL SISaveTextureAsTIFF(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = a2;
  size_t v5 = SICreateCVPixelBufferFromTexture(v3);
  if (v5)
  {
    CFURLRef v6 = [MEMORY[0x263F00650] imageWithCVPixelBuffer:v5];
    id v7 = [MEMORY[0x263F00628] contextWithOptions:0];
    unint64_t v8 = [v3 width];
    unint64_t v9 = [v3 height];
    unint64_t v10 = (CGImage *)objc_msgSend(v7, "createCGImage:fromRect:format:colorSpace:", v6, *MEMORY[0x263F008B8], CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F00268]), 0.0, 0.0, (double)v8, (double)v9);
    BOOL v11 = SISaveCGImage(v10, v4, (UTType *)*MEMORY[0x263F1DCE0]);
    CGImageRelease(v10);
    CVPixelBufferRelease(v5);
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

void sub_21B69F7E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL SISaveCGImageAsTIFF(CGImage *a1, NSString *a2)
{
  return SISaveCGImage(a1, a2, (UTType *)*MEMORY[0x263F1DCE0]);
}

BOOL SISavePixelBufferTIFF(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [MEMORY[0x263F00650] imageWithCVPixelBuffer:a1];
  [v4 writeToTIFF:v3];

  return v4 != 0;
}

void sub_21B69F890(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL SISavePixelBufferPNG(__CVBuffer *a1, void *a2)
{
  v14[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [MEMORY[0x263F00650] imageWithCVPixelBuffer:a1];
  size_t v5 = (void *)MEMORY[0x263F00628];
  uint64_t v13 = *MEMORY[0x263F00850];
  v14[0] = MEMORY[0x263EFFA88];
  CFURLRef v6 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
  id v7 = [v5 contextWithOptions:v6];

  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  size_t Width = CVPixelBufferGetWidth(a1);
  unint64_t v10 = (CGImage *)objc_msgSend(v7, "createCGImage:fromRect:format:colorSpace:", v4, *MEMORY[0x263F008B0], DeviceRGB, 0.0, 0.0, (double)Width, (double)CVPixelBufferGetHeight(a1));
  BOOL v11 = SISaveCGImage(v10, v3, (UTType *)*MEMORY[0x263F1DC08]);
  CGImageRelease(v10);
  CGColorSpaceRelease(DeviceRGB);

  return v11;
}

void sub_21B69FA10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL SISaveIOSurfacePNG(__IOSurface *a1, void *a2)
{
  id v3 = a2;
  CVPixelBufferRef pixelBufferOut = 0;
  CVPixelBufferCreateWithIOSurface(0, a1, 0, &pixelBufferOut);
  BOOL v4 = SISavePixelBufferPNG(pixelBufferOut, v3);
  CVPixelBufferRelease(pixelBufferOut);

  return v4;
}

void sub_21B69FABC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void SIDumpCVPixelBufferToFile(__CVBuffer *a1, void *a2)
{
  v39[19] = *MEMORY[0x263EF8340];
  id v32 = a2;
  [v32 UTF8String];
  std::ofstream::basic_ofstream(&v37);
  CVPixelBufferLockBaseAddress(a1, 0);
  pixelBuffer = a1;
  if (CVPixelBufferGetPixelFormatType(a1) == 1111970369)
  {
    BaseAddress = (char *)CVPixelBufferGetBaseAddress(a1);
    size_t Width = CVPixelBufferGetWidth(a1);
    size_t Height = CVPixelBufferGetHeight(a1);
    size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a1);
    if (Height)
    {
      size_t v7 = BytesPerRow;
      uint64_t v8 = 0;
      unint64_t v9 = BaseAddress + 3;
      unint64_t v10 = (std::locale::id *)MEMORY[0x263F8C108];
      do
      {
        size_t v11 = Width;
        for (unint64_t i = v9; v11; --v11)
        {
          uint64_t v13 = (void *)std::ostream::operator<<();
          std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v13, (uint64_t)" ", 1);
          float v14 = (void *)std::ostream::operator<<();
          std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v14, (uint64_t)" ", 1);
          uint8x8_t v15 = (void *)std::ostream::operator<<();
          std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v15, (uint64_t)" ", 1);
          int16x8_t v16 = (void *)std::ostream::operator<<();
          std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v16, (uint64_t)" ", 1);
          i += 4;
        }
        std::ios_base::getloc((const std::ios_base *)&v38[*(void *)(v37 - 24) - 8]);
        float v17 = std::locale::use_facet(&v36, v10);
        ((void (*)(const std::locale::facet *, uint64_t))v17->__vftable[2].~facet_0)(v17, 10);
        std::locale::~locale(&v36);
        std::ostream::put();
        std::ostream::flush();
        ++v8;
        v9 += v7;
      }
      while (v8 != Height);
    }
  }
  else if (CVPixelBufferGetPixelFormatType(a1) == 875836518)
  {
    BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a1, 0);
    int16x8_t v19 = (char *)CVPixelBufferGetBaseAddressOfPlane(a1, 1uLL);
    size_t v20 = CVPixelBufferGetWidth(a1);
    size_t v35 = CVPixelBufferGetHeight(a1);
    size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a1, 0);
    size_t v21 = CVPixelBufferGetBytesPerRowOfPlane(a1, 1uLL);
    if (v35)
    {
      size_t v22 = v21;
      uint64_t v23 = 0;
      uint64_t v24 = v19 + 1;
      do
      {
        size_t v25 = v20;
        int v26 = v24;
        for (unint64_t j = BaseAddressOfPlane; v25; --v25)
        {
          ++j;
          __int16 v28 = (void *)std::ostream::operator<<();
          std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v28, (uint64_t)" ", 1);
          int v29 = (void *)std::ostream::operator<<();
          std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v29, (uint64_t)" ", 1);
          __int16 v30 = (void *)std::ostream::operator<<();
          std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v30, (uint64_t)" ", 1);
          v26 += 2;
        }
        std::ios_base::getloc((const std::ios_base *)&v38[*(void *)(v37 - 24) - 8]);
        unint64_t v31 = std::locale::use_facet(&v36, MEMORY[0x263F8C108]);
        ((void (*)(const std::locale::facet *, uint64_t))v31->__vftable[2].~facet_0)(v31, 10);
        std::locale::~locale(&v36);
        std::ostream::put();
        std::ostream::flush();
        ++v23;
        BaseAddressOfPlane += BytesPerRowOfPlane;
        v24 += v22;
      }
      while (v23 != v35);
    }
  }
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
  if (!std::filebuf::close()) {
    std::ios_base::clear((std::ios_base *)&v38[*(void *)(v37 - 24) - 8], *(_DWORD *)&v38[*(void *)(v37 - 24) + 24] | 4);
  }
  uint64_t v37 = *MEMORY[0x263F8C2B0];
  *(void *)&v38[*(void *)(v37 - 24) - 8] = *(void *)(MEMORY[0x263F8C2B0] + 24);
  MEMORY[0x21D492FA0](v38);
  std::ostream::~ostream();
  MEMORY[0x21D493060](v39);
}

void sub_21B69FF68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, std::locale a13, uint64_t a14)
{
  _Unwind_Resume(a1);
}

uint64_t *std::ofstream::basic_ofstream(uint64_t *a1)
{
  uint64_t v2 = MEMORY[0x263F8C310] + 64;
  a1[52] = MEMORY[0x263F8C310] + 64;
  id v3 = a1 + 1;
  uint64_t v4 = *(void *)(MEMORY[0x263F8C2B0] + 16);
  uint64_t v5 = *(void *)(MEMORY[0x263F8C2B0] + 8);
  *a1 = v5;
  *(uint64_t *)((char *)a1 + *(void *)(v5 - 24)) = v4;
  CFURLRef v6 = (std::ios_base *)((char *)a1 + *(void *)(*a1 - 24));
  std::ios_base::init(v6, a1 + 1);
  uint64_t v7 = MEMORY[0x263F8C310] + 24;
  v6[1].__vftable = 0;
  v6[1].__fmtflags_ = -1;
  *a1 = v7;
  a1[52] = v2;
  MEMORY[0x21D492F90](v3);
  if (!std::filebuf::open()) {
    std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 4);
  }
  return a1;
}

void sub_21B6A0168(_Unwind_Exception *a1)
{
  std::ostream::~ostream();
  MEMORY[0x21D493060](v1);
  _Unwind_Resume(a1);
}

void *std::ofstream::~ofstream(void *a1)
{
  uint64_t v2 = MEMORY[0x263F8C2B0];
  uint64_t v3 = *MEMORY[0x263F8C2B0];
  *a1 = *MEMORY[0x263F8C2B0];
  *(void *)((char *)a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 24);
  MEMORY[0x21D492FA0](a1 + 1);
  std::ostream::~ostream();
  MEMORY[0x21D493060](a1 + 52);
  return a1;
}

uint64_t SICreateCVPixelBufferFromUrl(void *a1, OSType a2, void *a3, int a4)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v7 = a1;
  id v8 = a3;
  unint64_t v9 = [NSURL fileURLWithPath:v7];
  unint64_t v10 = [MEMORY[0x263F00650] imageWithContentsOfURL:v9];
  if (!v10)
  {
    int16x8_t v19 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)CVPixelBufferRef pixelBufferOut = 136381187;
      *(void *)&pixelBufferOut[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIIOUtility.mm";
      __int16 v24 = 1025;
      int v25 = 251;
      __int16 v26 = 2113;
      id v27 = v7;
      _os_log_impl(&dword_21B697000, v19, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Could not load image resource '%{private}@' ***", pixelBufferOut, 0x1Cu);
    }

    goto LABEL_9;
  }
  if (a4)
  {
    size_t v11 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:v8 copyItems:0];
    [v11 setValue:MEMORY[0x263EFFA78] forKey:*MEMORY[0x263F04130]];

    id v8 = v11;
  }
  *(void *)CVPixelBufferRef pixelBufferOut = 0;
  [v10 extent];
  double v13 = v12;
  [v10 extent];
  CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (unint64_t)v13, (unint64_t)v14, a2, (CFDictionaryRef)v8, (CVPixelBufferRef *)pixelBufferOut);
  if (!*(void *)pixelBufferOut)
  {
LABEL_9:
    uint64_t v18 = 0;
    goto LABEL_10;
  }
  id v15 = objc_alloc(MEMORY[0x263F00628]);
  uint64_t v21 = *MEMORY[0x263F00850];
  uint64_t v22 = MEMORY[0x263EFFA88];
  int16x8_t v16 = [NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  float v17 = (void *)[v15 initWithOptions:v16];

  [v17 render:v10 toCVPixelBuffer:*(void *)pixelBufferOut];
  uint64_t v18 = *(void *)pixelBufferOut;
LABEL_10:

  return v18;
}

void sub_21B6A04B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(void *a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x21D492FD0](v13, a1);
  if (v13[0])
  {
    uint64_t v6 = (uint64_t)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *(void *)(v6 + 40);
    int v8 = *(_DWORD *)(v6 + 8);
    int v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      unint64_t v10 = std::locale::use_facet(&v14, MEMORY[0x263F8C108]);
      int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20) {
      uint64_t v11 = a2 + a3;
    }
    else {
      uint64_t v11 = a2;
    }
    if (!std::__pad_and_output[abi:nn180100]<char,std::char_traits<char>>(v7, a2, v11, a2 + a3, v6, (char)v9)) {
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
    }
  }
  MEMORY[0x21D492FE0](v13);
  return a1;
}

void sub_21B6A065C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
}

uint64_t std::__pad_and_output[abi:nn180100]<char,std::char_traits<char>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6 = a1;
  if (a1)
  {
    uint64_t v11 = *(void *)(a5 + 24);
    if (v11 <= a4 - a2) {
      int64_t v12 = 0;
    }
    else {
      int64_t v12 = v11 - (a4 - a2);
    }
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1) != a3 - a2) {
      return 0;
    }
    if (v12 >= 1)
    {
      std::string::basic_string[abi:nn180100](__p, v12, __c);
      double v13 = v18 >= 0 ? __p : (void **)__p[0];
      uint64_t v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(void *)v6 + 96))(v6, v13, v12);
      if (v18 < 0) {
        operator delete(__p[0]);
      }
      if (v14 != v12) {
        return 0;
      }
    }
    uint64_t v15 = a4 - a3;
    if (v15 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v6 + 96))(v6, a3, v15) == v15) {
      *(void *)(a5 + 24) = 0;
    }
    else {
      return 0;
    }
  }
  return v6;
}

void sub_21B6A07F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::string::basic_string[abi:nn180100](void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    abort();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000;
    *__b = v6;
  }
  else
  {
    *((unsigned char *)__b + 23) = __len;
    uint64_t v6 = __b;
    if (!__len) {
      goto LABEL_9;
    }
  }
  memset(v6, __c, __len);
LABEL_9:
  *((unsigned char *)v6 + __len) = 0;
  return __b;
}

void sub_21B6A0AC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void sub_21B6A1120(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6A197C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:nn180100](a10);
  }
  _Unwind_Resume(a1);
}

void sub_21B6A2024(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6A20B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)SISceneUnderstanding;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void std::__shared_weak_count::__release_shared[abi:nn180100](std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void sub_21B6A2568(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6A2648(_Unwind_Exception *a1)
{
  uint64_t v6 = v4;

  _Unwind_Resume(a1);
}

void sub_21B6A26F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6A2B38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6A2C48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6A371C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, void *a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *__p, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  if (__p) {
    operator delete(__p);
  }
  if (a20) {
    operator delete(a20);
  }

  _Unwind_Resume(a1);
}

void sub_21B6A3968(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  unint64_t v10 = v9;

  a9.super_class = (Class)SIBaseNetworkE5RT;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_21B6A3D38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6A3ED4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  _Unwind_Resume(a1);
}

void sub_21B6A3FB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

void sub_21B6A4074(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

void sub_21B6A4138(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

void sub_21B6A41FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

void sub_21B6A42C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

void sub_21B6A4384(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

void sub_21B6A4528(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  _Unwind_Resume(a1);
}

void sub_21B6A45FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

void sub_21B6A46C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

void sub_21B6A4794(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  _Unwind_Resume(a1);
}

void sub_21B6A4858(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

void sub_21B6A491C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

void sub_21B6A49E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

void sub_21B6A4AA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

void sub_21B6A4B68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

void sub_21B6A4C2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

void sub_21B6A4CF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

void sub_21B6A4DB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

void sub_21B6A4E5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_21B6A51C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6A60A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t std::pair<std::string const,std::unordered_set<int>>::~pair(uint64_t a1)
{
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_21B6A651C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  _Unwind_Resume(a1);
}

void sub_21B6A65E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_21B6A6798(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (a27 < 0) {
    operator delete(a22);
  }

  _Unwind_Resume(a1);
}

void sub_21B6A6AA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

std::string *std::pair<std::string const,std::unordered_set<int>>::pair[abi:nn180100](std::string *this, long long *a2)
{
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v4 = *a2;
    this->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v4;
  }
  std::unordered_set<int>::unordered_set((uint64_t)&this[1], (uint64_t)a2 + 24);
  return this;
}

void sub_21B6A6C44(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  uint64_t v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8) {
      abort();
    }
    std::string::size_type v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17) {
      std::string::size_type v6 = __sz | 7;
    }
    std::string::size_type v7 = v6 + 1;
    size_t v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    uint64_t v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
}

uint64_t std::unordered_set<int>::unordered_set(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__rehash<true>(a1, *(void *)(a2 + 8));
  for (unint64_t i = *(int **)(a2 + 16); i; unint64_t i = *(int **)i)
    std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>(a1, i + 4, i + 4);
  return a1;
}

void sub_21B6A6D5C(_Unwind_Exception *a1)
{
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

void std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__rehash<true>(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2;
  }
  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }
  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }
    else
    {
      uint64_t v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }
    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4)
    {
LABEL_16:
      std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__do_rehash<true>(a1, prime);
    }
  }
}

void std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      std::__throw_bad_array_new_length[abi:nn180100]();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0;
    *(void *)(a1 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    uint64_t v7 = *(void **)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v8) = a1 + 16;
      uint64_t v11 = (void *)*v7;
      if (*v7)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2) {
              v12 %= a2;
            }
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(void *)(*(void *)a1 + 8 * v12))
            {
              *(void *)(*(void *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            *uint64_t v7 = *v11;
            *uint64_t v11 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = v11;
            uint64_t v11 = v7;
          }
          unint64_t v12 = v8;
LABEL_24:
          uint64_t v7 = v11;
          uint64_t v11 = (void *)*v11;
          unint64_t v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    unint64_t v10 = *(void **)a1;
    *(void *)a1 = 0;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0;
  }
}

void *std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>(uint64_t a1, int *a2, _DWORD *a3)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = *a2;
      if (v7 <= v6) {
        unint64_t v3 = v6 % v7;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
    uint8x8_t v9 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      unint64_t v10 = *v9;
      if (*v9)
      {
        do
        {
          unint64_t v11 = v10[1];
          if (v11 == v6)
          {
            if (*((_DWORD *)v10 + 4) == v6) {
              return v10;
            }
          }
          else
          {
            if (v8.u32[0] > 1uLL)
            {
              if (v11 >= v7) {
                v11 %= v7;
              }
            }
            else
            {
              v11 &= v7 - 1;
            }
            if (v11 != v3) {
              break;
            }
          }
          unint64_t v10 = (void *)*v10;
        }
        while (v10);
      }
    }
  }
  unint64_t v10 = operator new(0x18uLL);
  *unint64_t v10 = 0;
  v10[1] = v6;
  *((_DWORD *)v10 + 4) = *a3;
  float v12 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    BOOL v14 = 1;
    if (v7 >= 3) {
      BOOL v14 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v15 = v14 | (2 * v7);
    unint64_t v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16) {
      size_t v17 = v16;
    }
    else {
      size_t v17 = v15;
    }
    std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__rehash<true>(a1, v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6) {
        unint64_t v3 = v6 % v7;
      }
      else {
        unint64_t v3 = v6;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
  }
  uint64_t v18 = *(void *)a1;
  int16x8_t v19 = *(void **)(*(void *)a1 + 8 * v3);
  if (v19)
  {
    *unint64_t v10 = *v19;
LABEL_38:
    *int16x8_t v19 = v10;
    goto LABEL_39;
  }
  *unint64_t v10 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v10;
  *(void *)(v18 + 8 * v3) = a1 + 16;
  if (*v10)
  {
    unint64_t v20 = *(void *)(*v10 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v20 >= v7) {
        v20 %= v7;
      }
    }
    else
    {
      v20 &= v7 - 1;
    }
    int16x8_t v19 = (void *)(*(void *)a1 + 8 * v20);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return v10;
}

void sub_21B6A71C8(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      unint64_t v3 = (void *)*v2;
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
  int8x8_t v4 = *(void **)a1;
  *(void *)a1 = 0;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>>>::find<std::string>(void *a1, uint64_t a2)
{
  uint64_t v2 = (unsigned __int8 *)a2;
  unint64_t v4 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v5 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(void *)a2;
    unint64_t v5 = v4;
  }
  unint64_t v6 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100]((uint64_t)&v17, (uint64_t *)a2, v5);
  int8x8_t v7 = (int8x8_t)a1[1];
  if (!*(void *)&v7) {
    return 0;
  }
  unint64_t v8 = v6;
  uint8x8_t v9 = (uint8x8_t)vcnt_s8(v7);
  v9.i16[0] = vaddlv_u8(v9);
  unint64_t v10 = v9.u32[0];
  if (v9.u32[0] > 1uLL)
  {
    unint64_t v11 = v6;
    if (v6 >= *(void *)&v7) {
      unint64_t v11 = v6 % *(void *)&v7;
    }
  }
  else
  {
    unint64_t v11 = (*(void *)&v7 - 1) & v6;
  }
  float v12 = *(unsigned __int8 ***)(*a1 + 8 * v11);
  if (!v12) {
    return 0;
  }
  float v13 = *v12;
  if (*v12)
  {
    uint64_t v14 = (uint64_t)(a1 + 4);
    do
    {
      unint64_t v15 = *((void *)v13 + 1);
      if (v15 == v8)
      {
        if (std::equal_to<std::string>::operator()[abi:nn180100](v14, v13 + 16, v2)) {
          return v13;
        }
      }
      else
      {
        if (v10 > 1)
        {
          if (v15 >= *(void *)&v7) {
            v15 %= *(void *)&v7;
          }
        }
        else
        {
          v15 &= *(void *)&v7 - 1;
        }
        if (v15 != v11) {
          return 0;
        }
      }
      float v13 = *(unsigned __int8 **)v13;
    }
    while (v13);
  }
  return v13;
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100](uint64_t a1, uint64_t *a2, unint64_t a3)
{
  if (a3 > 0x20)
  {
    if (a3 > 0x40)
    {
      uint64_t v4 = *(uint64_t *)((char *)a2 + a3 - 48);
      uint64_t v5 = *(uint64_t *)((char *)a2 + a3 - 40);
      uint64_t v6 = *(uint64_t *)((char *)a2 + a3 - 24);
      uint64_t v8 = *(uint64_t *)((char *)a2 + a3 - 64);
      uint64_t v7 = *(uint64_t *)((char *)a2 + a3 - 56);
      uint64_t v9 = *(uint64_t *)((char *)a2 + a3 - 16);
      uint64_t v10 = *(uint64_t *)((char *)a2 + a3 - 8);
      unint64_t v11 = v7 + v9;
      unint64_t v12 = 0x9DDFEA08EB382D69
          * (v6 ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))) >> 47) ^ (0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))));
      unint64_t v13 = 0x9DDFEA08EB382D69 * (v12 ^ (v12 >> 47));
      unint64_t v14 = v8 + a3 + v7 + v4;
      uint64_t v15 = v14 + v5;
      unint64_t v16 = __ROR8__(v14, 44) + v8 + a3 + __ROR8__(v5 + v8 + a3 - 0x622015F714C7D297 * (v12 ^ (v12 >> 47)), 21);
      uint64_t v17 = v7 + v9 + *(uint64_t *)((char *)a2 + a3 - 32) - 0x4B6D499041670D8DLL;
      uint64_t v18 = v17 + v6 + v9;
      uint64_t v19 = __ROR8__(v18, 44);
      uint64_t v20 = v18 + v10;
      uint64_t v21 = v19 + v17 + __ROR8__(v17 + v5 + v10, 21);
      uint64_t v23 = *a2;
      uint64_t v22 = a2 + 4;
      unint64_t v24 = v23 - 0x4B6D499041670D8DLL * v5;
      uint64_t v25 = -(uint64_t)((a3 - 1) & 0xFFFFFFFFFFFFFFC0);
      do
      {
        uint64_t v26 = *(v22 - 3);
        uint64_t v27 = v24 + v15 + v11 + v26;
        uint64_t v28 = v22[2];
        uint64_t v29 = v22[3];
        uint64_t v30 = v22[1];
        unint64_t v11 = v30 + v15 - 0x4B6D499041670D8DLL * __ROR8__(v11 + v16 + v28, 42);
        uint64_t v31 = v13 + v20;
        uint64_t v32 = *(v22 - 2);
        uint64_t v33 = *(v22 - 1);
        uint64_t v34 = *(v22 - 4) - 0x4B6D499041670D8DLL * v16;
        uint64_t v35 = v34 + v20 + v33;
        uint64_t v36 = v34 + v26 + v32;
        uint64_t v15 = v36 + v33;
        uint64_t v37 = __ROR8__(v36, 44) + v34;
        unint64_t v38 = (0xB492B66FBE98F273 * __ROR8__(v27, 37)) ^ v21;
        unint64_t v24 = 0xB492B66FBE98F273 * __ROR8__(v31, 33);
        unint64_t v16 = v37 + __ROR8__(v35 + v38, 21);
        unint64_t v39 = v24 + v21 + *v22;
        uint64_t v20 = v39 + v30 + v28 + v29;
        uint64_t v21 = __ROR8__(v39 + v30 + v28, 44) + v39 + __ROR8__(v11 + v32 + v39 + v29, 21);
        v22 += 8;
        unint64_t v13 = v38;
        v25 += 64;
      }
      while (v25);
      unint64_t v40 = v24
          - 0x622015F714C7D297
          * ((0x9DDFEA08EB382D69
            * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) ^ ((0x9DDFEA08EB382D69 * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) >> 47));
      unint64_t v41 = 0x9DDFEA08EB382D69
          * (v40 ^ (v38
                  - 0x4B6D499041670D8DLL * (v11 ^ (v11 >> 47))
                  - 0x622015F714C7D297
                  * ((0x9DDFEA08EB382D69
                    * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) ^ ((0x9DDFEA08EB382D69 * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) >> 47))));
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) ^ ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) >> 47));
    }
    else
    {
      return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:nn180100](a2, a3);
    }
  }
  else if (a3 > 0x10)
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:nn180100](a2, a3);
  }
  else
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:nn180100](a2, a3);
  }
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:nn180100](_DWORD *a1, unint64_t a2)
{
  if (a2 < 9)
  {
    if (a2 < 4)
    {
      unint64_t result = 0x9AE16A3B2F90404FLL;
      if (a2)
      {
        unint64_t v8 = (0xC949D7C7509E6557 * (a2 + 4 * *((unsigned __int8 *)a1 + a2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                      * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8)));
        return 0x9AE16A3B2F90404FLL * (v8 ^ (v8 >> 47));
      }
    }
    else
    {
      uint64_t v6 = *(unsigned int *)((char *)a1 + a2 - 4);
      unint64_t v7 = 0x9DDFEA08EB382D69 * (((8 * *a1) + a2) ^ v6);
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) >> 47));
    }
  }
  else
  {
    uint64_t v3 = *(void *)((char *)a1 + a2 - 8);
    uint64_t v4 = __ROR8__(v3 + a2, a2);
    return (0x9DDFEA08EB382D69
          * ((0x9DDFEA08EB382D69
            * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)))) ^ ((0x9DDFEA08EB382D69 * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)))) >> 47))) ^ v3;
  }
  return result;
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:nn180100](void *a1, uint64_t a2)
{
  uint64_t v2 = a1[1];
  unint64_t v3 = 0xB492B66FBE98F273 * *a1;
  uint64_t v4 = __ROR8__(0x9AE16A3B2F90404FLL * *(void *)((char *)a1 + a2 - 8), 30) + __ROR8__(v3 - v2, 43);
  unint64_t v5 = v3 + a2 + __ROR8__(v2 ^ 0xC949D7C7509E6557, 20) - 0x9AE16A3B2F90404FLL * *(void *)((char *)a1 + a2 - 8);
  unint64_t v6 = 0x9DDFEA08EB382D69 * (v5 ^ (v4 - 0x3C5A37A36834CED9 * *(void *)((char *)a1 + a2 - 16)));
  return 0x9DDFEA08EB382D69
       * ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) ^ ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) >> 47));
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:nn180100](void *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)((char *)a1 + a2 - 16);
  uint64_t v3 = *a1 - 0x3C5A37A36834CED9 * (v2 + a2);
  uint64_t v5 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v6 = __ROR8__(v3 + v4, 52);
  uint64_t v7 = v3 + a1[1];
  uint64_t v8 = __ROR8__(v7, 7);
  uint64_t v9 = v7 + v5;
  uint64_t v10 = *(void *)((char *)a1 + a2 - 32) + v5;
  uint64_t v11 = v8 + __ROR8__(*a1 - 0x3C5A37A36834CED9 * (v2 + a2), 37) + v6 + __ROR8__(v9, 31);
  uint64_t v12 = *(void *)((char *)a1 + a2 - 24) + v10 + v2;
  unint64_t v13 = 0xC3A5C85C97CB3127 * (v12 + *(void *)((char *)a1 + a2 - 8) + v4 + v11)
      - 0x651E95C4D06FBFB1
      * (v9
       + v4
       + __ROR8__(v10, 37)
       + __ROR8__(*(void *)((char *)a1 + a2 - 24) + v10, 7)
       + __ROR8__(*(void *)((char *)a1 + a2 - 8) + v4 + v10, 52)
       + __ROR8__(v12, 31));
  return 0x9AE16A3B2F90404FLL
       * ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) ^ ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) >> 47));
}

uint64_t std::equal_to<std::string>::operator()[abi:nn180100](uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  uint64_t v3 = a3;
  uint64_t v4 = a2[23];
  if ((v4 & 0x80u) == 0) {
    uint64_t v5 = a2[23];
  }
  else {
    uint64_t v5 = *((void *)a2 + 1);
  }
  uint64_t v6 = a3[23];
  int v7 = (char)v6;
  if ((v6 & 0x80u) != 0) {
    uint64_t v6 = *((void *)a3 + 1);
  }
  if (v5 != v6) {
    return 0;
  }
  if (v7 < 0) {
    uint64_t v3 = *(unsigned __int8 **)a3;
  }
  if ((v4 & 0x80) != 0) {
    return memcmp(*(const void **)a2, v3, *((void *)a2 + 1)) == 0;
  }
  if (!a2[23]) {
    return 1;
  }
  uint64_t v8 = v4 - 1;
  do
  {
    int v10 = *a2++;
    int v9 = v10;
    int v12 = *v3++;
    int v11 = v12;
    BOOL v14 = v8-- != 0;
    uint64_t result = v9 == v11;
  }
  while (v9 == v11 && v14);
  return result;
}

void *std::string::basic_string[abi:nn180100]<0>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    abort();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    uint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

char *std::vector<char const*>::__vallocate[abi:nn180100](void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    abort();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<char const*>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<char const*>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  return operator new(8 * a2);
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(uint64_t a1, uint64_t a2, uint64_t a3, long long **a4)
{
  uint64_t v6 = (unsigned __int8 *)a2;
  unint64_t v8 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v9 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(void *)a2;
    unint64_t v9 = v8;
  }
  unint64_t v10 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100]((uint64_t)v30, (uint64_t *)a2, v9);
  unint64_t v11 = v10;
  unint64_t v12 = *(void *)(a1 + 8);
  if (v12)
  {
    uint8x8_t v13 = (uint8x8_t)vcnt_s8((int8x8_t)v12);
    v13.i16[0] = vaddlv_u8(v13);
    unint64_t v14 = v13.u32[0];
    if (v13.u32[0] > 1uLL)
    {
      unint64_t v4 = v10;
      if (v10 >= v12) {
        unint64_t v4 = v10 % v12;
      }
    }
    else
    {
      unint64_t v4 = (v12 - 1) & v10;
    }
    uint64_t v15 = *(unsigned __int8 ***)(*(void *)a1 + 8 * v4);
    if (v15)
    {
      for (unint64_t i = *v15; i; unint64_t i = *(unsigned __int8 **)i)
      {
        unint64_t v17 = *((void *)i + 1);
        if (v17 == v11)
        {
          if (std::equal_to<std::string>::operator()[abi:nn180100](a1 + 32, i + 16, v6)) {
            return i;
          }
        }
        else
        {
          if (v14 > 1)
          {
            if (v17 >= v12) {
              v17 %= v12;
            }
          }
          else
          {
            v17 &= v12 - 1;
          }
          if (v17 != v4) {
            break;
          }
        }
      }
    }
  }
  uint64_t v18 = (char *)operator new(0x50uLL);
  v30[0] = v18;
  v30[1] = a1 + 16;
  *(void *)uint64_t v18 = 0;
  *((void *)v18 + 1) = v11;
  uint64_t v19 = *a4;
  long long v20 = **a4;
  *((void *)v18 + 4) = *((void *)*a4 + 2);
  *((_OWORD *)v18 + 1) = v20;
  *((void *)v19 + 1) = 0;
  *((void *)v19 + 2) = 0;
  *(void *)uint64_t v19 = 0;
  *(_OWORD *)(v18 + 40) = 0u;
  *(_OWORD *)(v18 + 56) = 0u;
  *((_DWORD *)v18 + 18) = 1065353216;
  char v31 = 1;
  float v21 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v22 = *(float *)(a1 + 32);
  if (!v12 || (float)(v22 * (float)v12) < v21)
  {
    BOOL v23 = 1;
    if (v12 >= 3) {
      BOOL v23 = (v12 & (v12 - 1)) != 0;
    }
    unint64_t v24 = v23 | (2 * v12);
    unint64_t v25 = vcvtps_u32_f32(v21 / v22);
    if (v24 <= v25) {
      size_t v26 = v25;
    }
    else {
      size_t v26 = v24;
    }
    std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__rehash<true>(a1, v26);
    unint64_t v12 = *(void *)(a1 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12) {
        unint64_t v4 = v11 % v12;
      }
      else {
        unint64_t v4 = v11;
      }
    }
    else
    {
      unint64_t v4 = (v12 - 1) & v11;
    }
  }
  uint64_t v27 = *(void **)(*(void *)a1 + 8 * v4);
  if (v27)
  {
    *(void *)v30[0] = *v27;
    *uint64_t v27 = v30[0];
  }
  else
  {
    *(void *)v30[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v30[0];
    *(void *)(*(void *)a1 + 8 * v4) = a1 + 16;
    if (*(void *)v30[0])
    {
      unint64_t v28 = *(void *)(*(void *)v30[0] + 8);
      if ((v12 & (v12 - 1)) != 0)
      {
        if (v28 >= v12) {
          v28 %= v12;
        }
      }
      else
      {
        v28 &= v12 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v28) = v30[0];
    }
  }
  unint64_t i = (unsigned __int8 *)v30[0];
  v30[0] = 0;
  ++*(void *)(a1 + 24);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,void *>>>>::reset[abi:nn180100]((uint64_t)v30, 0);
  return i;
}

void sub_21B6A7C30(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,void *>>>>::reset[abi:nn180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,void *>>>>::reset[abi:nn180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__destroy_at[abi:nn180100]<std::pair<std::string const,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,0>((uint64_t)v2 + 16);
    }
    operator delete(v2);
  }
}

void std::__destroy_at[abi:nn180100]<std::pair<std::string const,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,0>(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::~__hash_table(a1 + 24);
  if (*(char *)(a1 + 23) < 0)
  {
    uint64_t v2 = *(void **)a1;
    operator delete(v2);
  }
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(uint64_t a1, uint64_t a2, uint64_t a3, long long **a4)
{
  uint64_t v6 = (unsigned __int8 *)a2;
  unint64_t v8 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v9 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(void *)a2;
    unint64_t v9 = v8;
  }
  unint64_t v10 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100]((uint64_t)v30, (uint64_t *)a2, v9);
  unint64_t v11 = v10;
  unint64_t v12 = *(void *)(a1 + 8);
  if (v12)
  {
    uint8x8_t v13 = (uint8x8_t)vcnt_s8((int8x8_t)v12);
    v13.i16[0] = vaddlv_u8(v13);
    unint64_t v14 = v13.u32[0];
    if (v13.u32[0] > 1uLL)
    {
      unint64_t v4 = v10;
      if (v10 >= v12) {
        unint64_t v4 = v10 % v12;
      }
    }
    else
    {
      unint64_t v4 = (v12 - 1) & v10;
    }
    uint64_t v15 = *(unsigned __int8 ***)(*(void *)a1 + 8 * v4);
    if (v15)
    {
      for (unint64_t i = *v15; i; unint64_t i = *(unsigned __int8 **)i)
      {
        unint64_t v17 = *((void *)i + 1);
        if (v17 == v11)
        {
          if (std::equal_to<std::string>::operator()[abi:nn180100](a1 + 32, i + 16, v6)) {
            return i;
          }
        }
        else
        {
          if (v14 > 1)
          {
            if (v17 >= v12) {
              v17 %= v12;
            }
          }
          else
          {
            v17 &= v12 - 1;
          }
          if (v17 != v4) {
            break;
          }
        }
      }
    }
  }
  uint64_t v18 = operator new(0x30uLL);
  v30[0] = v18;
  v30[1] = a1 + 16;
  void *v18 = 0;
  v18[1] = v11;
  uint64_t v19 = *a4;
  long long v20 = **a4;
  v18[4] = *((void *)*a4 + 2);
  *((_OWORD *)v18 + 1) = v20;
  *((void *)v19 + 1) = 0;
  *((void *)v19 + 2) = 0;
  *(void *)uint64_t v19 = 0;
  v18[5] = 0;
  char v31 = 1;
  float v21 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v22 = *(float *)(a1 + 32);
  if (!v12 || (float)(v22 * (float)v12) < v21)
  {
    BOOL v23 = 1;
    if (v12 >= 3) {
      BOOL v23 = (v12 & (v12 - 1)) != 0;
    }
    unint64_t v24 = v23 | (2 * v12);
    unint64_t v25 = vcvtps_u32_f32(v21 / v22);
    if (v24 <= v25) {
      size_t v26 = v25;
    }
    else {
      size_t v26 = v24;
    }
    std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__rehash<true>(a1, v26);
    unint64_t v12 = *(void *)(a1 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12) {
        unint64_t v4 = v11 % v12;
      }
      else {
        unint64_t v4 = v11;
      }
    }
    else
    {
      unint64_t v4 = (v12 - 1) & v11;
    }
  }
  uint64_t v27 = *(void **)(*(void *)a1 + 8 * v4);
  if (v27)
  {
    *(void *)v30[0] = *v27;
    *uint64_t v27 = v30[0];
  }
  else
  {
    *(void *)v30[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v30[0];
    *(void *)(*(void *)a1 + 8 * v4) = a1 + 16;
    if (*(void *)v30[0])
    {
      unint64_t v28 = *(void *)(*(void *)v30[0] + 8);
      if ((v12 & (v12 - 1)) != 0)
      {
        if (v28 >= v12) {
          v28 %= v12;
        }
      }
      else
      {
        v28 &= v12 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v28) = v30[0];
    }
  }
  unint64_t i = (unsigned __int8 *)v30[0];
  v30[0] = 0;
  ++*(void *)(a1 + 24);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,void *>>>>::reset[abi:nn180100]((uint64_t)v30, 0);
  return i;
}

void sub_21B6A7F88(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,void *>>>>::reset[abi:nn180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,void *>>>>::reset[abi:nn180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__destroy_at[abi:nn180100]<std::pair<std::string const,SIE5RTPort * {__strong}>,0>((uint64_t)v2 + 16);
    }
    operator delete(v2);
  }
}

void std::__destroy_at[abi:nn180100]<std::pair<std::string const,SIE5RTPort * {__strong}>,0>(uint64_t a1)
{
  if (*(char *)(a1 + 23) < 0)
  {
    uint64_t v2 = *(void **)a1;
    operator delete(v2);
  }
}

void *std::__hash_table<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(uint64_t a1, uint64_t a2, uint64_t a3, long long **a4)
{
  uint64_t v6 = (unsigned __int8 *)a2;
  unint64_t v8 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v9 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(void *)a2;
    unint64_t v9 = v8;
  }
  unint64_t v10 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100]((uint64_t)v31, (uint64_t *)a2, v9);
  unint64_t v11 = v10;
  unint64_t v12 = *(void *)(a1 + 8);
  if (v12)
  {
    uint8x8_t v13 = (uint8x8_t)vcnt_s8((int8x8_t)v12);
    v13.i16[0] = vaddlv_u8(v13);
    unint64_t v14 = v13.u32[0];
    if (v13.u32[0] > 1uLL)
    {
      unint64_t v4 = v10;
      if (v10 >= v12) {
        unint64_t v4 = v10 % v12;
      }
    }
    else
    {
      unint64_t v4 = (v12 - 1) & v10;
    }
    uint64_t v15 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v15)
    {
      for (unint64_t i = *v15; i; unint64_t i = *(void **)i)
      {
        unint64_t v17 = *((void *)i + 1);
        if (v17 == v11)
        {
          if (std::equal_to<std::string>::operator()[abi:nn180100](a1 + 32, (unsigned __int8 *)i + 16, v6)) {
            return i;
          }
        }
        else
        {
          if (v14 > 1)
          {
            if (v17 >= v12) {
              v17 %= v12;
            }
          }
          else
          {
            v17 &= v12 - 1;
          }
          if (v17 != v4) {
            break;
          }
        }
      }
    }
  }
  uint64_t v18 = (void *)(a1 + 16);
  unint64_t i = operator new(0x30uLL);
  uint64_t v32 = a1 + 16;
  *(void *)unint64_t i = 0;
  *((void *)i + 1) = v11;
  uint64_t v19 = *a4;
  long long v20 = **a4;
  *((void *)i + 4) = *((void *)*a4 + 2);
  *((_OWORD *)i + 1) = v20;
  *((void *)v19 + 1) = 0;
  *((void *)v19 + 2) = 0;
  *(void *)uint64_t v19 = 0;
  *((void *)i + 5) = 0;
  char v33 = 1;
  float v21 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v22 = *(float *)(a1 + 32);
  if (!v12 || (float)(v22 * (float)v12) < v21)
  {
    BOOL v23 = 1;
    if (v12 >= 3) {
      BOOL v23 = (v12 & (v12 - 1)) != 0;
    }
    unint64_t v24 = v23 | (2 * v12);
    unint64_t v25 = vcvtps_u32_f32(v21 / v22);
    if (v24 <= v25) {
      size_t v26 = v25;
    }
    else {
      size_t v26 = v24;
    }
    std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__rehash<true>(a1, v26);
    unint64_t v12 = *(void *)(a1 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12) {
        unint64_t v4 = v11 % v12;
      }
      else {
        unint64_t v4 = v11;
      }
    }
    else
    {
      unint64_t v4 = (v12 - 1) & v11;
    }
  }
  uint64_t v27 = *(void *)a1;
  unint64_t v28 = *(void **)(*(void *)a1 + 8 * v4);
  if (v28)
  {
    *(void *)unint64_t i = *v28;
LABEL_41:
    *unint64_t v28 = i;
    goto LABEL_42;
  }
  *(void *)unint64_t i = *v18;
  void *v18 = i;
  *(void *)(v27 + 8 * v4) = v18;
  if (*(void *)i)
  {
    unint64_t v29 = *(void *)(*(void *)i + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v29 >= v12) {
        v29 %= v12;
      }
    }
    else
    {
      v29 &= v12 - 1;
    }
    unint64_t v28 = (void *)(*(void *)a1 + 8 * v29);
    goto LABEL_41;
  }
LABEL_42:
  ++*(void *)(a1 + 24);
  return i;
}

void sub_21B6A82C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,void *>>>::operator()[abi:nn180100](v11, v10);
  _Unwind_Resume(a1);
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,void *>>>::operator()[abi:nn180100](uint64_t a1, void **__p)
{
  if (*(unsigned char *)(a1 + 8))
  {
    if (*((char *)__p + 39) < 0) {
      operator delete(__p[2]);
    }
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

void std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,void *> *>>(void *a1, uint64_t *a2, uint64_t *a3)
{
  unint64_t v4 = a2;
  uint64_t v6 = a1[1];
  if (v6)
  {
    for (uint64_t i = 0; i != v6; ++i)
      *(void *)(*a1 + 8 * i) = 0;
    unint64_t v8 = (void *)a1[2];
    a1[2] = 0;
    a1[3] = 0;
    if (v8) {
      BOOL v9 = a2 == a3;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9)
    {
      unint64_t v10 = v8;
    }
    else
    {
      do
      {
        v12[0] = v8 + 2;
        v12[1] = v8 + 5;
        std::pair<std::string &,SIE5RTPort * {__strong}&>::operator=[abi:nn180100]<std::string const,SIE5RTPort * {__strong},(void *)0>((uint64_t)v12, (const std::string *)(v4 + 2));
        unint64_t v10 = (void *)*v8;
        std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__node_insert_multi(a1, (uint64_t)v8);
        unint64_t v4 = (uint64_t *)*v4;
        if (v10) {
          BOOL v11 = v4 == a3;
        }
        else {
          BOOL v11 = 1;
        }
        unint64_t v8 = v10;
      }
      while (!v11);
    }
    std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__deallocate_node((uint64_t)a1, v10);
  }
  while (v4 != a3)
  {
    std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__emplace_multi<std::pair<std::string const,SIE5RTPort * {__strong}> const&>(a1, (long long *)v4 + 1);
    unint64_t v4 = (uint64_t *)*v4;
  }
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__node_insert_multi(void *a1, uint64_t a2)
{
  unint64_t v4 = *(unsigned __int8 *)(a2 + 39);
  size_t v5 = (unsigned __int8 *)(a2 + 16);
  unint64_t v6 = *(void *)(a2 + 24);
  if ((v4 & 0x80u) == 0) {
    uint64_t v7 = (uint64_t *)(a2 + 16);
  }
  else {
    uint64_t v7 = *(uint64_t **)(a2 + 16);
  }
  if ((v4 & 0x80u) == 0) {
    unint64_t v8 = v4;
  }
  else {
    unint64_t v8 = v6;
  }
  unint64_t v9 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100]((uint64_t)&v12, v7, v8);
  *(void *)(a2 + 8) = v9;
  inserted = std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__node_insert_multi_prepare((uint64_t)a1, v9, v5);
  std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__node_insert_multi_perform(a1, (void *)a2, inserted);
  return a2;
}

void std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__deallocate_node(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v2 = a2;
    do
    {
      uint64_t v3 = (void *)*v2;
      std::__destroy_at[abi:nn180100]<std::pair<std::string const,SIE5RTPort * {__strong}>,0>((uint64_t)(v2 + 2));
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
}

uint64_t std::pair<std::string &,SIE5RTPort * {__strong}&>::operator=[abi:nn180100]<std::string const,SIE5RTPort * {__strong},(void *)0>(uint64_t a1, const std::string *a2)
{
  std::string::operator=(*(std::string **)a1, a2);
  objc_storeStrong(*(id **)(a1 + 8), a2[1].__r_.__value_.__l.__data_);
  return a1;
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__node_insert_multi_prepare(uint64_t a1, unint64_t a2, unsigned __int8 *a3)
{
  uint64_t v6 = a1 + 32;
  float v7 = *(float *)(a1 + 32);
  unint64_t v8 = *(void *)(a1 + 8);
  float v9 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  if (!v8 || (float)(v7 * (float)v8) < v9)
  {
    BOOL v10 = 1;
    if (v8 >= 3) {
      BOOL v10 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v11 = v10 | (2 * v8);
    unint64_t v12 = vcvtps_u32_f32(v9 / v7);
    if (v11 <= v12) {
      size_t v13 = v12;
    }
    else {
      size_t v13 = v11;
    }
    std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__rehash<false>(a1, v13);
    unint64_t v8 = *(void *)(a1 + 8);
  }
  uint8x8_t v14 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
  v14.i16[0] = vaddlv_u8(v14);
  unint64_t v15 = v14.u32[0];
  if (v14.u32[0] > 1uLL)
  {
    unint64_t v16 = a2;
    if (v8 <= a2) {
      unint64_t v16 = a2 % v8;
    }
  }
  else
  {
    unint64_t v16 = (v8 - 1) & a2;
  }
  unint64_t v17 = *(unsigned __int8 **)(*(void *)a1 + 8 * v16);
  if (v17)
  {
    uint64_t v18 = *(unsigned __int8 **)v17;
    if (*(void *)v17)
    {
      int v19 = 0;
      do
      {
        unint64_t v20 = *((void *)v18 + 1);
        if (v15 > 1)
        {
          unint64_t v21 = *((void *)v18 + 1);
          if (v20 >= v8) {
            unint64_t v21 = v20 % v8;
          }
        }
        else
        {
          unint64_t v21 = v20 & (v8 - 1);
        }
        if (v21 != v16) {
          break;
        }
        int v22 = v20 == a2 ? std::equal_to<std::string>::operator()[abi:nn180100](v6, v18 + 16, a3) : 0;
        if (v19 & (v22 ^ 1)) {
          break;
        }
        v19 |= v22;
        unint64_t v17 = *(unsigned __int8 **)v17;
        uint64_t v18 = *(unsigned __int8 **)v17;
      }
      while (*(void *)v17);
    }
  }
  return v17;
}

void *std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__node_insert_multi_perform(void *result, void *a2, void *a3)
{
  int8x8_t v3 = (int8x8_t)result[1];
  unint64_t v4 = a2[1];
  uint8x8_t v5 = (uint8x8_t)vcnt_s8(v3);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    if (v4 >= *(void *)&v3) {
      v4 %= *(void *)&v3;
    }
  }
  else
  {
    v4 &= *(void *)&v3 - 1;
  }
  if (!a3)
  {
    *a2 = result[2];
    result[2] = a2;
    *(void *)(*result + 8 * v4) = result + 2;
    if (!*a2) {
      goto LABEL_19;
    }
    unint64_t v6 = *(void *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v6 >= *(void *)&v3) {
        v6 %= *(void *)&v3;
      }
    }
    else
    {
      v6 &= *(void *)&v3 - 1;
    }
LABEL_18:
    *(void *)(*result + 8 * v6) = a2;
    goto LABEL_19;
  }
  *a2 = *a3;
  *a3 = a2;
  if (*a2)
  {
    unint64_t v6 = *(void *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v6 >= *(void *)&v3) {
        v6 %= *(void *)&v3;
      }
    }
    else
    {
      v6 &= *(void *)&v3 - 1;
    }
    if (v6 != v4) {
      goto LABEL_18;
    }
  }
LABEL_19:
  ++result[3];
  return result;
}

void std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__rehash<false>(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2;
  }
  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }
  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }
    else
    {
      uint64_t v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }
    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4)
    {
LABEL_16:
      std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__do_rehash<false>(a1, prime);
    }
  }
}

void std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__do_rehash<false>(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      std::__throw_bad_array_new_length[abi:nn180100]();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0;
    *(void *)(a1 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    uint64_t v7 = *(unsigned __int8 ***)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = (unint64_t)v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      unint64_t v10 = v9.u32[0];
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v8) = a1 + 16;
      unint64_t v12 = *v7;
      if (*v7)
      {
        unint64_t v18 = v9.u32[0];
        do
        {
          unint64_t v13 = *((void *)v12 + 1);
          if (v10 > 1)
          {
            if (v13 >= a2) {
              v13 %= a2;
            }
          }
          else
          {
            v13 &= a2 - 1;
          }
          if (v13 == v8)
          {
            uint64_t v7 = (unsigned __int8 **)v12;
          }
          else if (*(void *)(*(void *)a1 + 8 * v13))
          {
            uint8x8_t v14 = *(unsigned __int8 **)v12;
            if (*(void *)v12)
            {
              unint64_t v15 = v12;
              while (1)
              {
                int v16 = std::equal_to<std::string>::operator()[abi:nn180100](a1 + 32, v12 + 16, v14 + 16);
                unint64_t v17 = *(unsigned __int8 **)v15;
                if (!v16) {
                  break;
                }
                uint8x8_t v14 = *(unsigned __int8 **)v17;
                unint64_t v15 = *(unsigned __int8 **)v15;
                if (!*(void *)v17) {
                  goto LABEL_32;
                }
              }
              uint8x8_t v14 = *(unsigned __int8 **)v15;
              unint64_t v17 = v15;
LABEL_32:
              unint64_t v10 = v18;
            }
            else
            {
              unint64_t v17 = v12;
            }
            *uint64_t v7 = v14;
            *(void *)unint64_t v17 = **(void **)(*(void *)a1 + 8 * v13);
            **(void **)(*(void *)a1 + 8 * v13) = v12;
          }
          else
          {
            *(void *)(*(void *)a1 + 8 * v13) = v7;
            uint64_t v7 = (unsigned __int8 **)v12;
            unint64_t v8 = v13;
          }
          unint64_t v12 = *v7;
        }
        while (*v7);
      }
    }
  }
  else
  {
    unint64_t v11 = *(void **)a1;
    *(void *)a1 = 0;
    if (v11) {
      operator delete(v11);
    }
    *(void *)(a1 + 8) = 0;
  }
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__emplace_multi<std::pair<std::string const,SIE5RTPort * {__strong}> const&>(void *a1, long long *a2)
{
  std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__construct_node<std::pair<std::string const,SIE5RTPort * {__strong}> const&>((uint64_t)a1, a2, (uint64_t)v5);
  uint64_t inserted = std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__node_insert_multi(a1, v5[0]);
  v5[0] = 0;
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,void *>>>>::reset[abi:nn180100]((uint64_t)v5, 0);
  return inserted;
}

void sub_21B6A8A98(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,void *>>>>::reset[abi:nn180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

unint64_t std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__construct_node<std::pair<std::string const,SIE5RTPort * {__strong}> const&>@<X0>(uint64_t a1@<X0>, long long *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 16;
  uint64_t v6 = (char *)operator new(0x30uLL);
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v5;
  *(unsigned char *)(a3 + 16) = 0;
  *(void *)uint64_t v6 = 0;
  *((void *)v6 + 1) = 0;
  uint64_t v7 = std::pair<std::string const,SIE5RTPort * {__strong}>::pair[abi:nn180100]((std::string *)(v6 + 16), a2);
  *(unsigned char *)(a3 + 16) = 1;
  int v8 = v6[39];
  if (v8 >= 0) {
    uint8x8_t v9 = (uint64_t *)v7;
  }
  else {
    uint8x8_t v9 = (uint64_t *)*((void *)v6 + 2);
  }
  if (v8 >= 0) {
    unint64_t v10 = v6[39];
  }
  else {
    unint64_t v10 = *((void *)v6 + 3);
  }
  unint64_t result = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100]((uint64_t)&v12, v9, v10);
  *((void *)v6 + 1) = result;
  return result;
}

void sub_21B6A8B38(_Unwind_Exception *a1)
{
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,void *>>>>::reset[abi:nn180100](v1, 0);
  _Unwind_Resume(a1);
}

std::string *std::pair<std::string const,SIE5RTPort * {__strong}>::pair[abi:nn180100](std::string *this, long long *a2)
{
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v4 = *a2;
    this->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v4;
  }
  this[1].__r_.__value_.__r.__words[0] = (std::string::size_type)*((id *)a2 + 3);
  return this;
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::find<std::string>(void *a1, uint64_t a2)
{
  uint64_t v2 = (unsigned __int8 *)a2;
  unint64_t v4 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v5 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(void *)a2;
    unint64_t v5 = v4;
  }
  unint64_t v6 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100]((uint64_t)&v17, (uint64_t *)a2, v5);
  int8x8_t v7 = (int8x8_t)a1[1];
  if (!*(void *)&v7) {
    return 0;
  }
  unint64_t v8 = v6;
  uint8x8_t v9 = (uint8x8_t)vcnt_s8(v7);
  v9.i16[0] = vaddlv_u8(v9);
  unint64_t v10 = v9.u32[0];
  if (v9.u32[0] > 1uLL)
  {
    unint64_t v11 = v6;
    if (v6 >= *(void *)&v7) {
      unint64_t v11 = v6 % *(void *)&v7;
    }
  }
  else
  {
    unint64_t v11 = (*(void *)&v7 - 1) & v6;
  }
  char v12 = *(unsigned __int8 ***)(*a1 + 8 * v11);
  if (!v12) {
    return 0;
  }
  unint64_t v13 = *v12;
  if (*v12)
  {
    uint64_t v14 = (uint64_t)(a1 + 4);
    do
    {
      unint64_t v15 = *((void *)v13 + 1);
      if (v8 == v15)
      {
        if (std::equal_to<std::string>::operator()[abi:nn180100](v14, v13 + 16, v2)) {
          return v13;
        }
      }
      else
      {
        if (v10 > 1)
        {
          if (v15 >= *(void *)&v7) {
            v15 %= *(void *)&v7;
          }
        }
        else
        {
          v15 &= *(void *)&v7 - 1;
        }
        if (v15 != v11) {
          return 0;
        }
      }
      unint64_t v13 = *(unsigned __int8 **)v13;
    }
    while (v13);
  }
  return v13;
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PrewiredFunctionInfo>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(uint64_t a1, uint64_t a2, uint64_t a3, long long **a4)
{
  unint64_t v6 = (unsigned __int8 *)a2;
  unint64_t v8 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v9 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(void *)a2;
    unint64_t v9 = v8;
  }
  unint64_t v10 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100]((uint64_t)v30, (uint64_t *)a2, v9);
  unint64_t v11 = v10;
  unint64_t v12 = *(void *)(a1 + 8);
  if (v12)
  {
    uint8x8_t v13 = (uint8x8_t)vcnt_s8((int8x8_t)v12);
    v13.i16[0] = vaddlv_u8(v13);
    unint64_t v14 = v13.u32[0];
    if (v13.u32[0] > 1uLL)
    {
      unint64_t v4 = v10;
      if (v10 >= v12) {
        unint64_t v4 = v10 % v12;
      }
    }
    else
    {
      unint64_t v4 = (v12 - 1) & v10;
    }
    unint64_t v15 = *(unsigned __int8 ***)(*(void *)a1 + 8 * v4);
    if (v15)
    {
      for (uint64_t i = *v15; i; uint64_t i = *(unsigned __int8 **)i)
      {
        unint64_t v17 = *((void *)i + 1);
        if (v17 == v11)
        {
          if (std::equal_to<std::string>::operator()[abi:nn180100](a1 + 32, i + 16, v6)) {
            return i;
          }
        }
        else
        {
          if (v14 > 1)
          {
            if (v17 >= v12) {
              v17 %= v12;
            }
          }
          else
          {
            v17 &= v12 - 1;
          }
          if (v17 != v4) {
            break;
          }
        }
      }
    }
  }
  unint64_t v18 = (char *)operator new(0x80uLL);
  v30[0] = v18;
  v30[1] = a1 + 16;
  *(void *)unint64_t v18 = 0;
  *((void *)v18 + 1) = v11;
  int v19 = *a4;
  long long v20 = **a4;
  *((void *)v18 + 4) = *((void *)*a4 + 2);
  *((_OWORD *)v18 + 1) = v20;
  *((void *)v19 + 1) = 0;
  *((void *)v19 + 2) = 0;
  *(void *)int v19 = 0;
  *(_OWORD *)(v18 + 88) = 0u;
  *(_OWORD *)(v18 + 40) = 0u;
  *(_OWORD *)(v18 + 56) = 0u;
  *(_OWORD *)(v18 + 72) = 0u;
  *((_DWORD *)v18 + 24) = 1065353216;
  *((void *)v18 + 14) = 0;
  *((void *)v18 + 15) = 0;
  *((void *)v18 + 13) = 0;
  char v31 = 1;
  float v21 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v22 = *(float *)(a1 + 32);
  if (!v12 || (float)(v22 * (float)v12) < v21)
  {
    BOOL v23 = 1;
    if (v12 >= 3) {
      BOOL v23 = (v12 & (v12 - 1)) != 0;
    }
    unint64_t v24 = v23 | (2 * v12);
    unint64_t v25 = vcvtps_u32_f32(v21 / v22);
    if (v24 <= v25) {
      size_t v26 = v25;
    }
    else {
      size_t v26 = v24;
    }
    std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__rehash<true>(a1, v26);
    unint64_t v12 = *(void *)(a1 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12) {
        unint64_t v4 = v11 % v12;
      }
      else {
        unint64_t v4 = v11;
      }
    }
    else
    {
      unint64_t v4 = (v12 - 1) & v11;
    }
  }
  uint64_t v27 = *(void **)(*(void *)a1 + 8 * v4);
  if (v27)
  {
    *(void *)v30[0] = *v27;
    *uint64_t v27 = v30[0];
  }
  else
  {
    *(void *)v30[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v30[0];
    *(void *)(*(void *)a1 + 8 * v4) = a1 + 16;
    if (*(void *)v30[0])
    {
      unint64_t v28 = *(void *)(*(void *)v30[0] + 8);
      if ((v12 & (v12 - 1)) != 0)
      {
        if (v28 >= v12) {
          v28 %= v12;
        }
      }
      else
      {
        v28 &= v12 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v28) = v30[0];
    }
  }
  uint64_t i = (unsigned __int8 *)v30[0];
  v30[0] = 0;
  ++*(void *)(a1 + 24);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,PrewiredFunctionInfo>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,PrewiredFunctionInfo>,void *>>>>::reset[abi:nn180100]((uint64_t)v30, 0);
  return i;
}

void sub_21B6A8F88(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,PrewiredFunctionInfo>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,PrewiredFunctionInfo>,void *>>>>::reset[abi:nn180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,PrewiredFunctionInfo>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,PrewiredFunctionInfo>,void *>>>>::reset[abi:nn180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__destroy_at[abi:nn180100]<std::pair<std::string const,PrewiredFunctionInfo>,0>((uint64_t)v2 + 16);
    }
    operator delete(v2);
  }
}

void std::__destroy_at[abi:nn180100]<std::pair<std::string const,PrewiredFunctionInfo>,0>(uint64_t a1)
{
  int8x8_t v3 = (void **)(a1 + 88);
  std::vector<SIE5RTPort * {__strong}>::__destroy_vector::operator()[abi:nn180100](&v3);
  std::__hash_table<std::__hash_value_type<std::string,std::unordered_set<int>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_set<int>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_set<int>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_set<int>>>>::~__hash_table(a1 + 48);
  uint64_t v2 = *(void **)(a1 + 24);
  if (v2)
  {
    *(void *)(a1 + 32) = v2;
    operator delete(v2);
  }
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
}

void std::vector<SIE5RTPort * {__strong}>::__destroy_vector::operator()[abi:nn180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (char *)**a1;
  if (v2)
  {
    unint64_t v4 = (char *)v1[1];
    unint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        unint64_t v6 = (void *)*((void *)v4 - 1);
        v4 -= 8;
      }
      while (v4 != v2);
      unint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,std::unordered_set<int>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_set<int>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_set<int>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_set<int>>>>::~__hash_table(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<std::string,std::unordered_set<int>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_set<int>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_set<int>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_set<int>>>>::__deallocate_node(a1, *(void **)(a1 + 16));
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<std::string,std::unordered_set<int>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_set<int>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_set<int>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_set<int>>>>::__deallocate_node(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v2 = a2;
    do
    {
      int8x8_t v3 = (void *)*v2;
      std::__destroy_at[abi:nn180100]<std::pair<std::string const,std::unordered_set<int>>,0>((uint64_t)(v2 + 2));
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
}

void std::__destroy_at[abi:nn180100]<std::pair<std::string const,std::unordered_set<int>>,0>(uint64_t a1)
{
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table(a1 + 24);
  if (*(char *)(a1 + 23) < 0)
  {
    uint64_t v2 = *(void **)a1;
    operator delete(v2);
  }
}

uint64_t std::__split_buffer<SIE5RTPort * {__strong}>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 8;
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::unordered_set<int>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_set<int>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_set<int>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_set<int>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(uint64_t a1, uint64_t a2, uint64_t a3, long long **a4)
{
  unint64_t v6 = (unsigned __int8 *)a2;
  unint64_t v8 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v9 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(void *)a2;
    unint64_t v9 = v8;
  }
  unint64_t v10 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100]((uint64_t)v30, (uint64_t *)a2, v9);
  unint64_t v11 = v10;
  unint64_t v12 = *(void *)(a1 + 8);
  if (v12)
  {
    uint8x8_t v13 = (uint8x8_t)vcnt_s8((int8x8_t)v12);
    v13.i16[0] = vaddlv_u8(v13);
    unint64_t v14 = v13.u32[0];
    if (v13.u32[0] > 1uLL)
    {
      unint64_t v4 = v10;
      if (v10 >= v12) {
        unint64_t v4 = v10 % v12;
      }
    }
    else
    {
      unint64_t v4 = (v12 - 1) & v10;
    }
    unint64_t v15 = *(unsigned __int8 ***)(*(void *)a1 + 8 * v4);
    if (v15)
    {
      for (uint64_t i = *v15; i; uint64_t i = *(unsigned __int8 **)i)
      {
        unint64_t v17 = *((void *)i + 1);
        if (v17 == v11)
        {
          if (std::equal_to<std::string>::operator()[abi:nn180100](a1 + 32, i + 16, v6)) {
            return i;
          }
        }
        else
        {
          if (v14 > 1)
          {
            if (v17 >= v12) {
              v17 %= v12;
            }
          }
          else
          {
            v17 &= v12 - 1;
          }
          if (v17 != v4) {
            break;
          }
        }
      }
    }
  }
  unint64_t v18 = (char *)operator new(0x50uLL);
  v30[0] = v18;
  v30[1] = a1 + 16;
  *(void *)unint64_t v18 = 0;
  *((void *)v18 + 1) = v11;
  int v19 = *a4;
  long long v20 = **a4;
  *((void *)v18 + 4) = *((void *)*a4 + 2);
  *((_OWORD *)v18 + 1) = v20;
  *((void *)v19 + 1) = 0;
  *((void *)v19 + 2) = 0;
  *(void *)int v19 = 0;
  *(_OWORD *)(v18 + 40) = 0u;
  *(_OWORD *)(v18 + 56) = 0u;
  *((_DWORD *)v18 + 18) = 1065353216;
  char v31 = 1;
  float v21 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v22 = *(float *)(a1 + 32);
  if (!v12 || (float)(v22 * (float)v12) < v21)
  {
    BOOL v23 = 1;
    if (v12 >= 3) {
      BOOL v23 = (v12 & (v12 - 1)) != 0;
    }
    unint64_t v24 = v23 | (2 * v12);
    unint64_t v25 = vcvtps_u32_f32(v21 / v22);
    if (v24 <= v25) {
      size_t v26 = v25;
    }
    else {
      size_t v26 = v24;
    }
    std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__rehash<true>(a1, v26);
    unint64_t v12 = *(void *)(a1 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12) {
        unint64_t v4 = v11 % v12;
      }
      else {
        unint64_t v4 = v11;
      }
    }
    else
    {
      unint64_t v4 = (v12 - 1) & v11;
    }
  }
  uint64_t v27 = *(void **)(*(void *)a1 + 8 * v4);
  if (v27)
  {
    *(void *)v30[0] = *v27;
    *uint64_t v27 = v30[0];
  }
  else
  {
    *(void *)v30[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v30[0];
    *(void *)(*(void *)a1 + 8 * v4) = a1 + 16;
    if (*(void *)v30[0])
    {
      unint64_t v28 = *(void *)(*(void *)v30[0] + 8);
      if ((v12 & (v12 - 1)) != 0)
      {
        if (v28 >= v12) {
          v28 %= v12;
        }
      }
      else
      {
        v28 &= v12 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v28) = v30[0];
    }
  }
  uint64_t i = (unsigned __int8 *)v30[0];
  v30[0] = 0;
  ++*(void *)(a1 + 24);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unordered_set<int>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unordered_set<int>>,void *>>>>::reset[abi:nn180100]((uint64_t)v30, 0);
  return i;
}

void sub_21B6A94A4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unordered_set<int>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unordered_set<int>>,void *>>>>::reset[abi:nn180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unordered_set<int>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unordered_set<int>>,void *>>>>::reset[abi:nn180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__destroy_at[abi:nn180100]<std::pair<std::string const,std::unordered_set<int>>,0>((uint64_t)v2 + 16);
    }
    operator delete(v2);
  }
}

void std::__hash_table<std::__hash_value_type<std::string,std::unordered_set<int>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_set<int>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_set<int>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_set<int>>>>::clear(uint64_t a1)
{
  if (*(void *)(a1 + 24))
  {
    std::__hash_table<std::__hash_value_type<std::string,std::unordered_set<int>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_set<int>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_set<int>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_set<int>>>>::__deallocate_node(a1, *(void **)(a1 + 16));
    *(void *)(a1 + 16) = 0;
    uint64_t v2 = *(void *)(a1 + 8);
    if (v2)
    {
      for (uint64_t i = 0; i != v2; ++i)
        *(void *)(*(void *)a1 + 8 * i) = 0;
    }
    *(void *)(a1 + 24) = 0;
  }
}

uint64_t *std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::find<int>(void *a1, int *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0;
  }
  unint64_t v3 = *a2;
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    unint64_t v5 = *a2;
    if (*(void *)&v2 <= v3) {
      unint64_t v5 = v3 % *(void *)&v2;
    }
  }
  else
  {
    unint64_t v5 = (*(void *)&v2 - 1) & v3;
  }
  unint64_t v6 = *(uint64_t ***)(*a1 + 8 * v5);
  if (!v6) {
    return 0;
  }
  for (unint64_t result = *v6; result; unint64_t result = (uint64_t *)*result)
  {
    unint64_t v8 = result[1];
    if (v8 == v3)
    {
      if (*((_DWORD *)result + 4) == v3) {
        return result;
      }
    }
    else
    {
      if (v4.u32[0] > 1uLL)
      {
        if (v8 >= *(void *)&v2) {
          v8 %= *(void *)&v2;
        }
      }
      else
      {
        v8 &= *(void *)&v2 - 1;
      }
      if (v8 != v5) {
        return 0;
      }
    }
  }
  return result;
}

void std::__hash_table<std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PrewiredFunctionInfo>>>::clear(uint64_t a1)
{
  if (*(void *)(a1 + 24))
  {
    std::__hash_table<std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PrewiredFunctionInfo>>>::__deallocate_node(a1, *(void **)(a1 + 16));
    *(void *)(a1 + 16) = 0;
    uint64_t v2 = *(void *)(a1 + 8);
    if (v2)
    {
      for (uint64_t i = 0; i != v2; ++i)
        *(void *)(*(void *)a1 + 8 * i) = 0;
    }
    *(void *)(a1 + 24) = 0;
  }
}

void std::__hash_table<std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PrewiredFunctionInfo>>>::__deallocate_node(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v2 = a2;
    do
    {
      unint64_t v3 = (void *)*v2;
      std::__destroy_at[abi:nn180100]<std::pair<std::string const,PrewiredFunctionInfo>,0>((uint64_t)(v2 + 2));
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>>>::~__hash_table(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>>>::__deallocate_node(a1, *(void ***)(a1 + 16));
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>>>::__deallocate_node(int a1, void **__p)
{
  if (__p)
  {
    uint64_t v2 = __p;
    do
    {
      unint64_t v3 = (void **)*v2;
      if (*((char *)v2 + 39) < 0) {
        operator delete(v2[2]);
      }
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>>>::~__hash_table(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>>>::__deallocate_node(a1, *(void **)(a1 + 16));
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>>>::__deallocate_node(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v2 = a2;
    do
    {
      unint64_t v3 = (void *)*v2;
      std::__destroy_at[abi:nn180100]<std::pair<std::string const,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,0>((uint64_t)(v2 + 2));
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::~__hash_table(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__deallocate_node(a1, *(void **)(a1 + 16));
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PrewiredFunctionInfo>>>::~__hash_table(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PrewiredFunctionInfo>>>::__deallocate_node(a1, *(void **)(a1 + 16));
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void sub_21B6AA078(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6AA3F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6AAC90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)SIE5RTSurfacePortDescriptor;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_21B6AB24C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, void (*a14)(char *))
{
}

__CFString *SIGetSemanticLabelStringGlobal(unint64_t a1)
{
  if (a1 > 0x29)
  {
    if (a1 == 255) {
      unint64_t v3 = @"Invalid";
    }
    else {
      unint64_t v3 = 0;
    }
  }
  else
  {
    objc_msgSend(&unk_26CB83ED8, "objectAtIndexedSubscript:", a1, v1);
    unint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

__CFString *SIGetSemanticLabelStringV3(unint64_t a1)
{
  if (a1 > 0x1D)
  {
    if (a1 == 255) {
      unint64_t v3 = @"Invalid";
    }
    else {
      unint64_t v3 = 0;
    }
  }
  else
  {
    objc_msgSend(&unk_26CB83EF0, "objectAtIndexedSubscript:", a1, v1);
    unint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

double SICreateSceneSegmentationV3ToGlobalLabelMapping()
{
  v0 = (char *)malloc_type_malloc(0x100uLL, 0x100004077774924uLL);
  *(_OWORD *)v0 = 0u;
  *((_OWORD *)v0 + 1) = 0u;
  *((_OWORD *)v0 + 2) = 0u;
  *((_OWORD *)v0 + 3) = 0u;
  *((_OWORD *)v0 + 4) = 0u;
  *((_OWORD *)v0 + 5) = 0u;
  *((_OWORD *)v0 + 6) = 0u;
  *((_OWORD *)v0 + 7) = 0u;
  *((_OWORD *)v0 + 8) = 0u;
  *((_OWORD *)v0 + 9) = 0u;
  *((_OWORD *)v0 + 10) = 0u;
  *((_OWORD *)v0 + 11) = 0u;
  *((_OWORD *)v0 + 12) = 0u;
  *((_OWORD *)v0 + 13) = 0u;
  *((_OWORD *)v0 + 14) = 0u;
  *(_OWORD *)(v0 + 239) = 0u;
  v0[29] = 33;
  *(_OWORD *)(v0 + 1) = xmmword_21B6CAB90;
  *(void *)(v0 + 17) = 0x1F29152813121110;
  *(void *)&double result = 639902240;
  *(_DWORD *)(v0 + 25) = 639902240;
  v0[255] = -1;
  return result;
}

uint64_t SISceneSegmentationGetLegacyToV2LabelMapping(unint64_t a1)
{
  if ([&unk_26CB83F08 count] <= a1) {
    return 0;
  }
  uint64_t v2 = [&unk_26CB83F08 objectAtIndexedSubscript:a1];
  uint64_t v3 = (int)[v2 intValue];

  return v3;
}

uint64_t SISceneSegmentationGetV2ToLegacyLabelMapping(unint64_t a1)
{
  if ([&unk_26CB83F20 count] <= a1) {
    return 0;
  }
  uint64_t v2 = [&unk_26CB83F20 objectAtIndexedSubscript:a1];
  uint64_t v3 = (int)[v2 intValue];

  return v3;
}

double SISceneSegmentationGetSupportedResolution(uint64_t a1)
{
  double v1 = 256.0;
  if (a1 == 2) {
    double v1 = 192.0;
  }
  if (a1 == 3) {
    double v1 = 320.0;
  }
  if (a1 == 4) {
    return 256.0;
  }
  else {
    return v1;
  }
}

float32x2_t kannalaforw(float32x4_t a1, __n128 a2)
{
  float32x2_t v2 = *(float32x2_t *)a1.f32;
  float v3 = sqrtf(vmlas_n_f32(COERCE_FLOAT(vmulq_f32(a1, a1).i32[1]), v2.f32[0], v2.f32[0]));
  float v4 = 1.0;
  if (v3 != 0.0)
  {
    float32x2_t v19 = v2;
    float v20 = a1.f32[2];
    float v5 = atan2f(v3, a1.f32[2]);
    _S3 = (float)(v5 * v5) * (float)(v5 * (float)(v5 * v5));
    _S4 = (float)(v5 * v5) * _S3;
    _S5 = (float)(v5 * v5) * _S4;
    _Q6 = a2;
    __asm
    {
      FMLA            S0, S3, V6.S[1]
      FMLA            S0, S4, V6.S[2]
      FMLA            S0, S5, V6.S[3]
    }
    float32x2_t v2 = v19;
    float v4 = (float)(fabsf(v20) * _S0) / v3;
  }
  return vmul_n_f32(v2, v4);
}

float32x2_t kannalarev(float32x4_t a1, float32x4_t a2)
{
  float32x2_t v20 = *(float32x2_t *)a1.f32;
  float v2 = a2.f32[1];
  float v3 = a2.f32[2];
  float v4 = a2.f32[3];
  float v5 = sqrtf(vmlas_n_f32(COERCE_FLOAT(vmulq_f32(a1, a1).i32[1]), a1.f32[0], a1.f32[0])) / a1.f32[2];
  float v6 = atanf(v5);
  float v7 = vmuls_lane_f32(5.0, *(float32x2_t *)a2.f32, 1);
  float v8 = vmuls_lane_f32(7.0, a2, 2);
  float v9 = vmuls_lane_f32(9.0, a2, 3);
  float v10 = 0.0;
  int v11 = 9;
  do
  {
    float v12 = v6;
    float v13 = v6 * v6;
    float v6 = v12
       - (float)((float)((float)((float)((float)((float)(v12 + (float)(a2.f32[0] * (float)(v12 * v13)))
                                               + (float)(v2 * (float)(v12 * (float)(v13 * v13))))
                                       + (float)(v3 * (float)(v12 * (float)(v13 * (float)(v13 * v13)))))
                               + (float)(v4 * (float)(v12 * (float)((float)(v13 * v13) * (float)(v13 * v13)))))
                       - v5)
               / (float)((float)((float)((float)((float)((float)(3.0 * a2.f32[0]) * v13) + 1.0)
                                       + (float)(v7 * (float)(v13 * v13)))
                               + (float)(v8 * (float)(v13 * (float)(v13 * v13))))
                       + (float)(v9 * (float)((float)(v13 * v13) * (float)(v13 * v13)))));
    float v14 = vabds_f32(v12, v6);
    float v10 = v10 + v14;
  }
  while (v14 >= 0.0001 && v11-- != 0);
  float v16 = tanf(v6);
  float v17 = 1.0;
  if (v5 != 0.0 && v10 <= 1.0) {
    float v17 = fabsf(v16) / v5;
  }
  return vmul_n_f32(v20, v17);
}

void sub_21B6AE090(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6AE210(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

void sub_21B6AE440(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_21B6AEFF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6AF5C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

void std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::clear(uint64_t a1)
{
  if (*(void *)(a1 + 24))
  {
    std::__hash_table<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>>>::__deallocate_node(a1, *(void ***)(a1 + 16));
    *(void *)(a1 + 16) = 0;
    uint64_t v2 = *(void *)(a1 + 8);
    if (v2)
    {
      for (uint64_t i = 0; i != v2; ++i)
        *(void *)(*(void *)a1 + 8 * i) = 0;
    }
    *(void *)(a1 + 24) = 0;
  }
}

void *std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(uint64_t a1, uint64_t a2, uint64_t a3, long long **a4)
{
  float v6 = (unsigned __int8 *)a2;
  unint64_t v8 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v9 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(void *)a2;
    unint64_t v9 = v8;
  }
  unint64_t v10 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100]((uint64_t)v31, (uint64_t *)a2, v9);
  unint64_t v11 = v10;
  unint64_t v12 = *(void *)(a1 + 8);
  if (v12)
  {
    uint8x8_t v13 = (uint8x8_t)vcnt_s8((int8x8_t)v12);
    v13.i16[0] = vaddlv_u8(v13);
    unint64_t v14 = v13.u32[0];
    if (v13.u32[0] > 1uLL)
    {
      unint64_t v4 = v10;
      if (v10 >= v12) {
        unint64_t v4 = v10 % v12;
      }
    }
    else
    {
      unint64_t v4 = (v12 - 1) & v10;
    }
    unint64_t v15 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v15)
    {
      for (uint64_t i = *v15; i; uint64_t i = *(void **)i)
      {
        unint64_t v17 = *((void *)i + 1);
        if (v17 == v11)
        {
          if (std::equal_to<std::string>::operator()[abi:nn180100](a1 + 32, (unsigned __int8 *)i + 16, v6)) {
            return i;
          }
        }
        else
        {
          if (v14 > 1)
          {
            if (v17 >= v12) {
              v17 %= v12;
            }
          }
          else
          {
            v17 &= v12 - 1;
          }
          if (v17 != v4) {
            break;
          }
        }
      }
    }
  }
  unint64_t v18 = (void *)(a1 + 16);
  uint64_t i = operator new(0x30uLL);
  uint64_t v32 = a1 + 16;
  *(void *)uint64_t i = 0;
  *((void *)i + 1) = v11;
  float32x2_t v19 = *a4;
  long long v20 = **a4;
  *((void *)i + 4) = *((void *)*a4 + 2);
  *((_OWORD *)i + 1) = v20;
  *((void *)v19 + 1) = 0;
  *((void *)v19 + 2) = 0;
  *(void *)float32x2_t v19 = 0;
  *((_DWORD *)i + 10) = 0;
  char v33 = 1;
  float v21 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v22 = *(float *)(a1 + 32);
  if (!v12 || (float)(v22 * (float)v12) < v21)
  {
    BOOL v23 = 1;
    if (v12 >= 3) {
      BOOL v23 = (v12 & (v12 - 1)) != 0;
    }
    unint64_t v24 = v23 | (2 * v12);
    unint64_t v25 = vcvtps_u32_f32(v21 / v22);
    if (v24 <= v25) {
      size_t v26 = v25;
    }
    else {
      size_t v26 = v24;
    }
    std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__rehash<true>(a1, v26);
    unint64_t v12 = *(void *)(a1 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12) {
        unint64_t v4 = v11 % v12;
      }
      else {
        unint64_t v4 = v11;
      }
    }
    else
    {
      unint64_t v4 = (v12 - 1) & v11;
    }
  }
  uint64_t v27 = *(void *)a1;
  unint64_t v28 = *(void **)(*(void *)a1 + 8 * v4);
  if (v28)
  {
    *(void *)uint64_t i = *v28;
LABEL_41:
    *unint64_t v28 = i;
    goto LABEL_42;
  }
  *(void *)uint64_t i = *v18;
  void *v18 = i;
  *(void *)(v27 + 8 * v4) = v18;
  if (*(void *)i)
  {
    unint64_t v29 = *(void *)(*(void *)i + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v29 >= v12) {
        v29 %= v12;
      }
    }
    else
    {
      v29 &= v12 - 1;
    }
    unint64_t v28 = (void *)(*(void *)a1 + 8 * v29);
    goto LABEL_41;
  }
LABEL_42:
  ++*(void *)(a1 + 24);
  return i;
}

void sub_21B6AF97C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,void *>>>::operator()[abi:nn180100](v11, v10);
  _Unwind_Resume(a1);
}

void sub_21B6AFBE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6AFCCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6AFD64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6AFE24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6AFFA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6B00A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6B0144(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6B0384(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_21B6B042C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  unint64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)SIPeopleSegmentation;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_21B6B259C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6B2750(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)SIE5RTTensorPortDescriptor;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_21B6B2B60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id __SceneIntelligenceLogSharedInstance()
{
  if (__SceneIntelligenceLogSharedInstance_onceToken != -1) {
    dispatch_once(&__SceneIntelligenceLogSharedInstance_onceToken, &__block_literal_global_1);
  }
  v0 = (void *)sharedInstance;
  return v0;
}

void sub_21B6B3DEC(_Unwind_Exception *a1)
{
  float v5 = v4;

  _Unwind_Resume(a1);
}

void sub_21B6B3EBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6B4000(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6B4334(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6B43F8(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 - 33) < 0) {
    operator delete(*(void **)(v1 - 56));
  }
  _Unwind_Resume(exception_object);
}

void sub_21B6B469C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  operator delete(v15);
  _Unwind_Resume(a1);
}

void sub_21B6B4798(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21B6B481C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6B48E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_21B6B4980(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_21B6B4A0C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_21B6B4D24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6B4DF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6B4EA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6B4F58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6B50F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  _Unwind_Resume(a1);
}

void sub_21B6B51C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6B5268(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_21B6B531C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_21B6B53D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_21B6B5440(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6B54DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_21B6B5634(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  _Unwind_Resume(a1);
}

void sub_21B6B57B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6B5BEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_21B6B5DD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_21B6B6140(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)SIBaseNetworkEspresso;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_21B6B61B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6B6320(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

char *std::__hash_table<std::__hash_value_type<std::string,espresso_buffer_t>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,espresso_buffer_t>>>::__emplace_unique_key_args<std::string,std::string,espresso_buffer_t>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  float v7 = (unsigned __int8 *)a2;
  unint64_t v9 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v10 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(void *)a2;
    unint64_t v10 = v9;
  }
  unint64_t v11 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100]((uint64_t)v36, (uint64_t *)a2, v10);
  unint64_t v12 = v11;
  unint64_t v13 = *(void *)(a1 + 8);
  if (v13)
  {
    uint8x8_t v14 = (uint8x8_t)vcnt_s8((int8x8_t)v13);
    v14.i16[0] = vaddlv_u8(v14);
    unint64_t v15 = v14.u32[0];
    if (v14.u32[0] > 1uLL)
    {
      unint64_t v4 = v11;
      if (v11 >= v13) {
        unint64_t v4 = v11 % v13;
      }
    }
    else
    {
      unint64_t v4 = (v13 - 1) & v11;
    }
    float v16 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v16)
    {
      unint64_t v17 = (char *)*v16;
      if (*v16)
      {
        do
        {
          unint64_t v18 = *((void *)v17 + 1);
          if (v18 == v12)
          {
            if (std::equal_to<std::string>::operator()[abi:nn180100](a1 + 32, (unsigned __int8 *)v17 + 16, v7)) {
              return v17;
            }
          }
          else
          {
            if (v15 > 1)
            {
              if (v18 >= v13) {
                v18 %= v13;
              }
            }
            else
            {
              v18 &= v13 - 1;
            }
            if (v18 != v4) {
              break;
            }
          }
          unint64_t v17 = *(char **)v17;
        }
        while (v17);
      }
    }
  }
  float32x2_t v19 = (void *)(a1 + 16);
  unint64_t v17 = (char *)operator new(0xD0uLL);
  *((_OWORD *)v17 + 1) = *(_OWORD *)a3;
  uint64_t v20 = *(void *)(a3 + 16);
  *(void *)a3 = 0;
  *(void *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = 0;
  long long v21 = *(_OWORD *)(a4 + 96);
  *(_OWORD *)(v17 + 152) = *(_OWORD *)(a4 + 112);
  long long v22 = *(_OWORD *)(a4 + 144);
  *(_OWORD *)(v17 + 168) = *(_OWORD *)(a4 + 128);
  *(_OWORD *)(v17 + 184) = v22;
  long long v23 = *(_OWORD *)(a4 + 32);
  *(_OWORD *)(v17 + 88) = *(_OWORD *)(a4 + 48);
  long long v24 = *(_OWORD *)(a4 + 80);
  *(_OWORD *)(v17 + 104) = *(_OWORD *)(a4 + 64);
  *(_OWORD *)(v17 + 120) = v24;
  *(_OWORD *)(v17 + 136) = v21;
  long long v25 = *(_OWORD *)(a4 + 16);
  *(_OWORD *)(v17 + 40) = *(_OWORD *)a4;
  uint64_t v37 = a1 + 16;
  *(void *)unint64_t v17 = 0;
  *((void *)v17 + 1) = v12;
  *((void *)v17 + 4) = v20;
  *((void *)v17 + 25) = *(void *)(a4 + 160);
  *(_OWORD *)(v17 + 56) = v25;
  *(_OWORD *)(v17 + 72) = v23;
  char v38 = 1;
  float v26 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v27 = *(float *)(a1 + 32);
  if (!v13 || (float)(v27 * (float)v13) < v26)
  {
    BOOL v28 = 1;
    if (v13 >= 3) {
      BOOL v28 = (v13 & (v13 - 1)) != 0;
    }
    unint64_t v29 = v28 | (2 * v13);
    unint64_t v30 = vcvtps_u32_f32(v26 / v27);
    if (v29 <= v30) {
      size_t v31 = v30;
    }
    else {
      size_t v31 = v29;
    }
    std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__rehash<true>(a1, v31);
    unint64_t v13 = *(void *)(a1 + 8);
    if ((v13 & (v13 - 1)) != 0)
    {
      if (v12 >= v13) {
        unint64_t v4 = v12 % v13;
      }
      else {
        unint64_t v4 = v12;
      }
    }
    else
    {
      unint64_t v4 = (v13 - 1) & v12;
    }
  }
  uint64_t v32 = *(void *)a1;
  char v33 = *(void **)(*(void *)a1 + 8 * v4);
  if (v33)
  {
    *(void *)unint64_t v17 = *v33;
LABEL_41:
    *char v33 = v17;
    goto LABEL_42;
  }
  *(void *)unint64_t v17 = *v19;
  *float32x2_t v19 = v17;
  *(void *)(v32 + 8 * v4) = v19;
  if (*(void *)v17)
  {
    unint64_t v34 = *(void *)(*(void *)v17 + 8);
    if ((v13 & (v13 - 1)) != 0)
    {
      if (v34 >= v13) {
        v34 %= v13;
      }
    }
    else
    {
      v34 &= v13 - 1;
    }
    char v33 = (void *)(*(void *)a1 + 8 * v34);
    goto LABEL_41;
  }
LABEL_42:
  ++*(void *)(a1 + 24);
  return v17;
}

void sub_21B6B67DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,void *>>>::operator()[abi:nn180100](v11, v10);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::vector<unsigned long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<unsigned long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<unsigned long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<unsigned long>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(uint64_t a1, uint64_t a2, uint64_t a3, long long **a4)
{
  float v6 = (unsigned __int8 *)a2;
  unint64_t v8 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v9 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(void *)a2;
    unint64_t v9 = v8;
  }
  unint64_t v10 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100]((uint64_t)v30, (uint64_t *)a2, v9);
  unint64_t v11 = v10;
  unint64_t v12 = *(void *)(a1 + 8);
  if (v12)
  {
    uint8x8_t v13 = (uint8x8_t)vcnt_s8((int8x8_t)v12);
    v13.i16[0] = vaddlv_u8(v13);
    unint64_t v14 = v13.u32[0];
    if (v13.u32[0] > 1uLL)
    {
      unint64_t v4 = v10;
      if (v10 >= v12) {
        unint64_t v4 = v10 % v12;
      }
    }
    else
    {
      unint64_t v4 = (v12 - 1) & v10;
    }
    unint64_t v15 = *(unsigned __int8 ***)(*(void *)a1 + 8 * v4);
    if (v15)
    {
      for (uint64_t i = *v15; i; uint64_t i = *(unsigned __int8 **)i)
      {
        unint64_t v17 = *((void *)i + 1);
        if (v17 == v11)
        {
          if (std::equal_to<std::string>::operator()[abi:nn180100](a1 + 32, i + 16, v6)) {
            return i;
          }
        }
        else
        {
          if (v14 > 1)
          {
            if (v17 >= v12) {
              v17 %= v12;
            }
          }
          else
          {
            v17 &= v12 - 1;
          }
          if (v17 != v4) {
            break;
          }
        }
      }
    }
  }
  unint64_t v18 = operator new(0x40uLL);
  v30[0] = v18;
  v30[1] = a1 + 16;
  void *v18 = 0;
  v18[1] = v11;
  float32x2_t v19 = *a4;
  long long v20 = **a4;
  v18[4] = *((void *)*a4 + 2);
  *((_OWORD *)v18 + 1) = v20;
  *((void *)v19 + 1) = 0;
  *((void *)v19 + 2) = 0;
  *(void *)float32x2_t v19 = 0;
  v18[6] = 0;
  v18[7] = 0;
  v18[5] = 0;
  char v31 = 1;
  float v21 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v22 = *(float *)(a1 + 32);
  if (!v12 || (float)(v22 * (float)v12) < v21)
  {
    BOOL v23 = 1;
    if (v12 >= 3) {
      BOOL v23 = (v12 & (v12 - 1)) != 0;
    }
    unint64_t v24 = v23 | (2 * v12);
    unint64_t v25 = vcvtps_u32_f32(v21 / v22);
    if (v24 <= v25) {
      size_t v26 = v25;
    }
    else {
      size_t v26 = v24;
    }
    std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__rehash<true>(a1, v26);
    unint64_t v12 = *(void *)(a1 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12) {
        unint64_t v4 = v11 % v12;
      }
      else {
        unint64_t v4 = v11;
      }
    }
    else
    {
      unint64_t v4 = (v12 - 1) & v11;
    }
  }
  float v27 = *(void **)(*(void *)a1 + 8 * v4);
  if (v27)
  {
    *(void *)v30[0] = *v27;
    *float v27 = v30[0];
  }
  else
  {
    *(void *)v30[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v30[0];
    *(void *)(*(void *)a1 + 8 * v4) = a1 + 16;
    if (*(void *)v30[0])
    {
      unint64_t v28 = *(void *)(*(void *)v30[0] + 8);
      if ((v12 & (v12 - 1)) != 0)
      {
        if (v28 >= v12) {
          v28 %= v12;
        }
      }
      else
      {
        v28 &= v12 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v28) = v30[0];
    }
  }
  uint64_t i = (unsigned __int8 *)v30[0];
  v30[0] = 0;
  ++*(void *)(a1 + 24);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::vector<unsigned long>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::vector<unsigned long>>,void *>>>>::reset[abi:nn180100]((uint64_t)v30, 0);
  return i;
}

void sub_21B6B6A94(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::vector<unsigned long>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::vector<unsigned long>>,void *>>>>::reset[abi:nn180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::vector<unsigned long>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::vector<unsigned long>>,void *>>>>::reset[abi:nn180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__destroy_at[abi:nn180100]<std::pair<std::string const,std::vector<unsigned long>>,0>((uint64_t)v2 + 16);
    }
    operator delete(v2);
  }
}

void std::__destroy_at[abi:nn180100]<std::pair<std::string const,std::vector<unsigned long>>,0>(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 24);
  if (v2)
  {
    *(void *)(a1 + 32) = v2;
    operator delete(v2);
  }
  if (*(char *)(a1 + 23) < 0)
  {
    float v3 = *(void **)a1;
    operator delete(v3);
  }
}

char *std::__hash_table<std::__hash_value_type<std::string,espresso_buffer_t>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,espresso_buffer_t>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(uint64_t a1, uint64_t a2, uint64_t a3, long long **a4)
{
  float v6 = (unsigned __int8 *)a2;
  unint64_t v8 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v9 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(void *)a2;
    unint64_t v9 = v8;
  }
  unint64_t v10 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100]((uint64_t)v31, (uint64_t *)a2, v9);
  unint64_t v11 = v10;
  unint64_t v12 = *(void *)(a1 + 8);
  if (v12)
  {
    uint8x8_t v13 = (uint8x8_t)vcnt_s8((int8x8_t)v12);
    v13.i16[0] = vaddlv_u8(v13);
    unint64_t v14 = v13.u32[0];
    if (v13.u32[0] > 1uLL)
    {
      unint64_t v4 = v10;
      if (v10 >= v12) {
        unint64_t v4 = v10 % v12;
      }
    }
    else
    {
      unint64_t v4 = (v12 - 1) & v10;
    }
    unint64_t v15 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v15)
    {
      float v16 = (char *)*v15;
      if (*v15)
      {
        do
        {
          unint64_t v17 = *((void *)v16 + 1);
          if (v17 == v11)
          {
            if (std::equal_to<std::string>::operator()[abi:nn180100](a1 + 32, (unsigned __int8 *)v16 + 16, v6)) {
              return v16;
            }
          }
          else
          {
            if (v14 > 1)
            {
              if (v17 >= v12) {
                v17 %= v12;
              }
            }
            else
            {
              v17 &= v12 - 1;
            }
            if (v17 != v4) {
              break;
            }
          }
          float v16 = *(char **)v16;
        }
        while (v16);
      }
    }
  }
  unint64_t v18 = (void *)(a1 + 16);
  float v16 = (char *)operator new(0xD0uLL);
  uint64_t v32 = a1 + 16;
  *(void *)float v16 = 0;
  *((void *)v16 + 1) = v11;
  float32x2_t v19 = *a4;
  long long v20 = **a4;
  *((void *)v16 + 4) = *((void *)*a4 + 2);
  *((_OWORD *)v16 + 1) = v20;
  *((void *)v19 + 1) = 0;
  *((void *)v19 + 2) = 0;
  *(void *)float32x2_t v19 = 0;
  *(_OWORD *)(v16 + 40) = 0u;
  *(_OWORD *)(v16 + 56) = 0u;
  *(_OWORD *)(v16 + 72) = 0u;
  *(_OWORD *)(v16 + 88) = 0u;
  *(_OWORD *)(v16 + 104) = 0u;
  *(_OWORD *)(v16 + 120) = 0u;
  *(_OWORD *)(v16 + 136) = 0u;
  *(_OWORD *)(v16 + 152) = 0u;
  *(_OWORD *)(v16 + 168) = 0u;
  *(_OWORD *)(v16 + 184) = 0u;
  *((void *)v16 + 25) = 0;
  char v33 = 1;
  float v21 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v22 = *(float *)(a1 + 32);
  if (!v12 || (float)(v22 * (float)v12) < v21)
  {
    BOOL v23 = 1;
    if (v12 >= 3) {
      BOOL v23 = (v12 & (v12 - 1)) != 0;
    }
    unint64_t v24 = v23 | (2 * v12);
    unint64_t v25 = vcvtps_u32_f32(v21 / v22);
    if (v24 <= v25) {
      size_t v26 = v25;
    }
    else {
      size_t v26 = v24;
    }
    std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__rehash<true>(a1, v26);
    unint64_t v12 = *(void *)(a1 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12) {
        unint64_t v4 = v11 % v12;
      }
      else {
        unint64_t v4 = v11;
      }
    }
    else
    {
      unint64_t v4 = (v12 - 1) & v11;
    }
  }
  uint64_t v27 = *(void *)a1;
  unint64_t v28 = *(void **)(*(void *)a1 + 8 * v4);
  if (v28)
  {
    *(void *)float v16 = *v28;
LABEL_41:
    *unint64_t v28 = v16;
    goto LABEL_42;
  }
  *(void *)float v16 = *v18;
  void *v18 = v16;
  *(void *)(v27 + 8 * v4) = v18;
  if (*(void *)v16)
  {
    unint64_t v29 = *(void *)(*(void *)v16 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v29 >= v12) {
        v29 %= v12;
      }
    }
    else
    {
      v29 &= v12 - 1;
    }
    unint64_t v28 = (void *)(*(void *)a1 + 8 * v29);
    goto LABEL_41;
  }
LABEL_42:
  ++*(void *)(a1 + 24);
  return v16;
}

void sub_21B6B6E08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,void *>>>::operator()[abi:nn180100](v11, v10);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,espresso_buffer_t>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,espresso_buffer_t>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1, uint64_t a2, uint64_t a3, long long **a4)
{
  float v6 = (unsigned __int8 *)a2;
  unint64_t v8 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v9 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(void *)a2;
    unint64_t v9 = v8;
  }
  unint64_t v10 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100]((uint64_t)v27, (uint64_t *)a2, v9);
  unint64_t v11 = v10;
  unint64_t v12 = *(void *)(a1 + 8);
  if (v12)
  {
    uint8x8_t v13 = (uint8x8_t)vcnt_s8((int8x8_t)v12);
    v13.i16[0] = vaddlv_u8(v13);
    unint64_t v14 = v13.u32[0];
    if (v13.u32[0] > 1uLL)
    {
      unint64_t v4 = v10;
      if (v10 >= v12) {
        unint64_t v4 = v10 % v12;
      }
    }
    else
    {
      unint64_t v4 = (v12 - 1) & v10;
    }
    unint64_t v15 = *(unsigned __int8 ***)(*(void *)a1 + 8 * v4);
    if (v15)
    {
      for (uint64_t i = *v15; i; uint64_t i = *(unsigned __int8 **)i)
      {
        unint64_t v17 = *((void *)i + 1);
        if (v17 == v11)
        {
          if (std::equal_to<std::string>::operator()[abi:nn180100](a1 + 32, i + 16, v6)) {
            return i;
          }
        }
        else
        {
          if (v14 > 1)
          {
            if (v17 >= v12) {
              v17 %= v12;
            }
          }
          else
          {
            v17 &= v12 - 1;
          }
          if (v17 != v4) {
            break;
          }
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<std::string,espresso_buffer_t>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,espresso_buffer_t>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(a1, v11, a4, (uint64_t)v27);
  float v18 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v19 = *(float *)(a1 + 32);
  if (!v12 || (float)(v19 * (float)v12) < v18)
  {
    BOOL v20 = 1;
    if (v12 >= 3) {
      BOOL v20 = (v12 & (v12 - 1)) != 0;
    }
    unint64_t v21 = v20 | (2 * v12);
    unint64_t v22 = vcvtps_u32_f32(v18 / v19);
    if (v21 <= v22) {
      size_t v23 = v22;
    }
    else {
      size_t v23 = v21;
    }
    std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__rehash<true>(a1, v23);
    unint64_t v12 = *(void *)(a1 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12) {
        unint64_t v4 = v11 % v12;
      }
      else {
        unint64_t v4 = v11;
      }
    }
    else
    {
      unint64_t v4 = (v12 - 1) & v11;
    }
  }
  unint64_t v24 = *(void **)(*(void *)a1 + 8 * v4);
  if (v24)
  {
    *(void *)v27[0] = *v24;
    *unint64_t v24 = v27[0];
  }
  else
  {
    *(void *)v27[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v27[0];
    *(void *)(*(void *)a1 + 8 * v4) = a1 + 16;
    if (*(void *)v27[0])
    {
      unint64_t v25 = *(void *)(*(void *)v27[0] + 8);
      if ((v12 & (v12 - 1)) != 0)
      {
        if (v25 >= v12) {
          v25 %= v12;
        }
      }
      else
      {
        v25 &= v12 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v25) = v27[0];
    }
  }
  uint64_t i = (unsigned __int8 *)v27[0];
  ++*(void *)(a1 + 24);
  return i;
}

void sub_21B6B70A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void **__p, uint64_t a13)
{
  if (__p) {
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,void *>>>::operator()[abi:nn180100]((uint64_t)&a13, __p);
  }
  _Unwind_Resume(exception_object);
}

double std::__hash_table<std::__hash_value_type<std::string,espresso_buffer_t>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,espresso_buffer_t>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, long long **a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 16;
  unint64_t v8 = (char *)operator new(0xD0uLL);
  *(void *)a4 = v8;
  *(void *)(a4 + 8) = v7;
  *(unsigned char *)(a4 + 16) = 0;
  *(void *)unint64_t v8 = 0;
  *((void *)v8 + 1) = a2;
  unint64_t v9 = (std::string *)(v8 + 16);
  unint64_t v10 = *a3;
  if (*((char *)*a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)v10, *((void *)v10 + 1));
  }
  else
  {
    long long v11 = *v10;
    *((void *)v8 + 4) = *((void *)v10 + 2);
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = v11;
  }
  *((void *)v8 + 25) = 0;
  double result = 0.0;
  *(_OWORD *)(v8 + 184) = 0u;
  *(_OWORD *)(v8 + 168) = 0u;
  *(_OWORD *)(v8 + 152) = 0u;
  *(_OWORD *)(v8 + 136) = 0u;
  *(_OWORD *)(v8 + 120) = 0u;
  *(_OWORD *)(v8 + 104) = 0u;
  *(_OWORD *)(v8 + 88) = 0u;
  *(_OWORD *)(v8 + 72) = 0u;
  *(_OWORD *)(v8 + 56) = 0u;
  *(_OWORD *)(v8 + 40) = 0u;
  *(unsigned char *)(a4 + 16) = 1;
  return result;
}

void sub_21B6B7184(_Unwind_Exception *a1)
{
  void *v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,void *>>>::operator()[abi:nn180100](v3, v2);
  _Unwind_Resume(a1);
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,std::vector<unsigned long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<unsigned long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<unsigned long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<unsigned long>>>>::~__hash_table(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<std::string,std::vector<unsigned long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<unsigned long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<unsigned long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<unsigned long>>>>::__deallocate_node(a1, *(void **)(a1 + 16));
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<std::string,std::vector<unsigned long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<unsigned long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<unsigned long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<unsigned long>>>>::__deallocate_node(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v2 = a2;
    do
    {
      uint64_t v3 = (void *)*v2;
      std::__destroy_at[abi:nn180100]<std::pair<std::string const,std::vector<unsigned long>>,0>((uint64_t)(v2 + 2));
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
}

__CFString *SIResultStatusToString(unint64_t a1)
{
  if (a1 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%ld", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_2643B34C8[a1];
  }
  return v1;
}

__CFString *SIDeviceOrientationToString(unint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%ld", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_2643B34F8[a1];
  }
  return v1;
}

__CFString *SIComputeEngineTypeToString(unint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%ld", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_2643B3518[a1];
  }
  return v1;
}

__CFString *SIEarlyExitToString(unint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%ld", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_2643B3530[a1];
  }
  return v1;
}

__CFString *SIComputeEnginePriorityToString(uint64_t a1)
{
  if (a1)
  {
    if (a1 == 1)
    {
      uint64_t v2 = @"SIComputeEnginePriorityLow";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"%ld", a1);
      uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    uint64_t v2 = @"SIComputeEnginePriorityDefault";
  }
  return v2;
}

void make_crc_table()
{
  for (uint64_t i = 0; i != 256; ++i)
  {
    uint64_t v1 = 8;
    unsigned int v2 = i;
    do
    {
      if (v2) {
        unsigned int v2 = (v2 >> 1) ^ 0xEDB88320;
      }
      else {
        v2 >>= 1;
      }
      --v1;
    }
    while (v1);
    crc_table[i] = v2;
  }
  crc_table_computed = 1;
}

uint64_t update_crc(uint64_t result, char *a2, uint64_t a3)
{
  if (crc_table_computed)
  {
    if (!a3) {
      return result;
    }
    goto LABEL_12;
  }
  for (uint64_t i = 0; i != 256; ++i)
  {
    uint64_t v4 = 8;
    unsigned int v5 = i;
    do
    {
      if (v5) {
        unsigned int v5 = (v5 >> 1) ^ 0xEDB88320;
      }
      else {
        v5 >>= 1;
      }
      --v4;
    }
    while (v4);
    crc_table[i] = v5;
  }
  for (crc_table_computed = 1; a3; --a3)
  {
LABEL_12:
    char v6 = *a2++;
    double result = crc_table[(v6 ^ result)] ^ (result >> 8);
  }
  return result;
}

uint64_t crc(char *a1, uint64_t a2)
{
  return ~update_crc(0xFFFFFFFFLL, a1, a2);
}

NSObject *si_surface_load_from_data_internal(uint64_t a1, uint64_t *a2)
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v42 = 0;
  uint64_t v43 = 100;
  uint64_t v3 = [MEMORY[0x263F08AC0] propertyListWithData:a1 options:0 format:&v43 error:&v42];
  id v4 = v42;
  unsigned int v5 = v4;
  if (v3)
  {
    char v6 = [v3 objectForKeyedSubscript:@"properties"];
    if (!v6)
    {
      if (a2)
      {
        unint64_t v17 = (void *)MEMORY[0x263F087E8];
        uint64_t v52 = *MEMORY[0x263F08320];
        float v53 = @"No properties in payload";
        float v18 = [NSDictionary dictionaryWithObjects:&v53 forKeys:&v52 count:1];
        *a2 = [v17 errorWithDomain:@"com.apple.sceneintelligence" code:1 userInfo:v18];
      }
      uint64_t v7 = __SceneIntelligenceLogSharedInstance();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136380931;
        v55 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SISurface.m";
        __int16 v56 = 1025;
        int v57 = 90;
        _os_log_impl(&dword_21B697000, v7, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** No properties in payload ***", buf, 0x12u);
      }
      float v16 = 0;
      goto LABEL_44;
    }
    uint64_t v7 = [v3 objectForKeyedSubscript:@"data_size"];
    uint64_t v8 = [v7 unsignedIntegerValue];
    if (!v8)
    {
      if (a2)
      {
        float v19 = (void *)MEMORY[0x263F087E8];
        uint64_t v50 = *MEMORY[0x263F08320];
        float v51 = @"No data size in payload";
        BOOL v20 = [NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1];
        *a2 = [v19 errorWithDomain:@"com.apple.sceneintelligence" code:1 userInfo:v20];
      }
      unint64_t v10 = __SceneIntelligenceLogSharedInstance();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136380931;
        v55 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SISurface.m";
        __int16 v56 = 1025;
        int v57 = 100;
        _os_log_impl(&dword_21B697000, v10, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** No data size in payload ***", buf, 0x12u);
      }
      float v16 = 0;
      goto LABEL_43;
    }
    uint64_t v9 = v8;
    unint64_t v10 = [v3 objectForKeyedSubscript:@"compressed_data"];
    if (v10)
    {
      id v11 = [MEMORY[0x263EFF990] dataWithLength:v9];
      unint64_t v12 = (uint8_t *)[v11 bytes];
      id v40 = v11;
      size_t v13 = [v11 length];
      unint64_t v41 = v10;
      unint64_t v14 = v10;
      if (compression_decode_buffer(v12, v13, (const uint8_t *)[v14 bytes], [v14 length], 0, COMPRESSION_LZ4) != v9)
      {
        if (a2)
        {
          unint64_t v29 = (void *)MEMORY[0x263F087E8];
          uint64_t v48 = *MEMORY[0x263F08320];
          float v49 = @"Uncompressing data failed.";
          unint64_t v30 = [NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
          *a2 = [v29 errorWithDomain:@"com.apple.sceneintelligence" code:1 userInfo:v30];
        }
        unint64_t v21 = __SceneIntelligenceLogSharedInstance();
        id v15 = v40;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136380931;
          v55 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SISurface.m";
          __int16 v56 = 1025;
          int v57 = 112;
          _os_log_impl(&dword_21B697000, v21, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Uncompressing data failed. ***", buf, 0x12u);
        }
        float v16 = 0;
        unint64_t v10 = v41;
        goto LABEL_42;
      }
      id v15 = v11;
      unint64_t v10 = v41;
    }
    else
    {
      id v15 = 0;
    }
    unint64_t v21 = [objc_alloc(MEMORY[0x263F0ED00]) initWithProperties:v6];
    if (v21)
    {
      uint64_t v22 = [v15 length];
      if (v22 == [v21 allocationSize])
      {
        size_t v23 = v21;
        unint64_t v24 = v10;
        uint64_t v25 = [v23 baseAddress];
        id v15 = v15;
        size_t v26 = (const void *)[v15 bytes];
        size_t v27 = [v23 allocationSize];
        unint64_t v28 = (void *)v25;
        unint64_t v10 = v24;
        memcpy(v28, v26, v27);
        unint64_t v21 = v23;
        float v16 = v21;
LABEL_42:

LABEL_43:
LABEL_44:

        goto LABEL_45;
      }
      if (a2)
      {
        uint64_t v36 = (void *)MEMORY[0x263F087E8];
        uint64_t v44 = *MEMORY[0x263F08320];
        int v45 = @"Mismatching data sizes for surface.";
        [NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
        v38 = uint64_t v37 = v10;
        *a2 = [v36 errorWithDomain:@"com.apple.sceneintelligence" code:1 userInfo:v38];

        unint64_t v10 = v37;
      }
      unint64_t v34 = __SceneIntelligenceLogSharedInstance();
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
LABEL_41:

        float v16 = 0;
        goto LABEL_42;
      }
      *(_DWORD *)buf = 136380931;
      v55 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SISurface.m";
      __int16 v56 = 1025;
      int v57 = 131;
      uint64_t v35 = " %{private}s:%{private}d *** Mismatching data sizes for surface. ***";
    }
    else
    {
      if (a2)
      {
        char v31 = (void *)MEMORY[0x263F087E8];
        uint64_t v46 = *MEMORY[0x263F08320];
        int v47 = @"Failed to create surface.";
        [NSDictionary dictionaryWithObjects:&v47 forKeys:&v46 count:1];
        v33 = uint64_t v32 = v10;
        *a2 = [v31 errorWithDomain:@"com.apple.sceneintelligence" code:1 userInfo:v33];

        unint64_t v10 = v32;
      }
      unint64_t v34 = __SceneIntelligenceLogSharedInstance();
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        goto LABEL_41;
      }
      *(_DWORD *)buf = 136380931;
      v55 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SISurface.m";
      __int16 v56 = 1025;
      int v57 = 124;
      uint64_t v35 = " %{private}s:%{private}d *** Failed to create surface. ***";
    }
    _os_log_impl(&dword_21B697000, v34, OS_LOG_TYPE_ERROR, v35, buf, 0x12u);
    goto LABEL_41;
  }
  if (a2 && v4) {
    *a2 = (uint64_t)v4;
  }
  char v6 = __SceneIntelligenceLogSharedInstance();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136380931;
    v55 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SISurface.m";
    __int16 v56 = 1025;
    int v57 = 81;
    _os_log_impl(&dword_21B697000, v6, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to deserialize plist data ***", buf, 0x12u);
  }
  float v16 = 0;
LABEL_45:

  return v16;
}

void *si_surface_load_from_data(void *a1, uint64_t *a2)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v3 = a1;
  uint64_t v4 = [v3 length];
  id v5 = v3;
  char v6 = (void *)[v5 bytes];
  uint64_t v7 = v6;
  if (*v6 != 0xA1A0A0D474E5089)
  {
    id v11 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *v7;
      *(_DWORD *)buf = 136381443;
      unint64_t v29 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SISurface.m";
      __int16 v30 = 1025;
      int v31 = 156;
      __int16 v32 = 2048;
      uint64_t v33 = v12;
      __int16 v34 = 2048;
      uint64_t v35 = 0xA1A0A0D474E5089;
      _os_log_impl(&dword_21B697000, v11, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Wrong png header %llu %llu ***", buf, 0x26u);
    }
    goto LABEL_17;
  }
  if (v4 < 9) {
    goto LABEL_10;
  }
  uint64_t v8 = (unsigned int *)(v6 + 1);
  while (1)
  {
    uint64_t v9 = bswap32(*v8);
    unint64_t v10 = v8 + 2;
    if (bswap32(v8[1]) == *(_DWORD *)SIPngChunkType) {
      break;
    }
    uint64_t v8 = (unsigned int *)((char *)v10 + v9 + 4);
    if (v8 >= (unsigned int *)((char *)v6 + v4)) {
      goto LABEL_10;
    }
  }
  size_t v13 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v10 length:v9 freeWhenDone:0];
  unint64_t v14 = si_surface_load_from_data_internal((uint64_t)v13, a2);

  if (!v14)
  {
LABEL_10:
    id v11 = [MEMORY[0x263F00650] imageWithData:v5];
    [v11 extent];
    size_t v16 = (unint64_t)v15;
    [v11 extent];
    CVPixelBufferRef v18 = SICreateCVPixelBuffer(v16, (unint64_t)v17, 0x42475241u, 1);
    if (v18)
    {
      float v19 = v18;
      BOOL v20 = [MEMORY[0x263F00628] context];
      [v20 render:v11 toCVPixelBuffer:v19];
      IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface(v19);
      unint64_t v14 = (void *)CFRetain(IOSurface);
      CVPixelBufferRelease(v19);

LABEL_18:
      goto LABEL_19;
    }
    if (a2)
    {
      uint64_t v22 = (void *)MEMORY[0x263F087E8];
      uint64_t v26 = *MEMORY[0x263F08320];
      size_t v27 = @"Failed to load fallback png data";
      size_t v23 = [NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
      *a2 = [v22 errorWithDomain:@"com.apple.sceneintelligence" code:1 userInfo:v23];
    }
    unint64_t v24 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136380931;
      unint64_t v29 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SISurface.m";
      __int16 v30 = 1025;
      int v31 = 197;
      _os_log_impl(&dword_21B697000, v24, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to load fallback png data ***", buf, 0x12u);
    }

LABEL_17:
    unint64_t v14 = 0;
    goto LABEL_18;
  }
LABEL_19:

  return v14;
}

void *si_surface_load_from_url(uint64_t a1, uint64_t *a2)
{
  v15[1] = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:a1];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = si_surface_load_from_data(v3, a2);
  }
  else
  {
    if (a2)
    {
      char v6 = (void *)MEMORY[0x263F087E8];
      uint64_t v14 = *MEMORY[0x263F08320];
      v15[0] = @"Failed to load file";
      uint64_t v7 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
      *a2 = [v6 errorWithDomain:@"com.apple.sceneintelligence" code:1 userInfo:v7];
    }
    uint64_t v8 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136380931;
      id v11 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SISurface.m";
      __int16 v12 = 1025;
      int v13 = 211;
      _os_log_impl(&dword_21B697000, v8, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to load file ***", (uint8_t *)&v10, 0x12u);
    }

    id v5 = 0;
  }

  return v5;
}

uint64_t si_surface_save_to_data_internal(__IOSurface *a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  CFDictionaryRef v2 = IOSurfaceCopyAllValues(a1);
  id v3 = [(__CFDictionary *)v2 objectForKeyedSubscript:@"CreationProperties"];

  uint64_t v4 = (void *)MEMORY[0x263EFF8F8];
  BaseAddress = IOSurfaceGetBaseAddress(a1);
  char v6 = [v4 dataWithBytes:BaseAddress length:IOSurfaceGetAllocSize(a1)];
  objc_msgSend(MEMORY[0x263EFF990], "dataWithLength:", objc_msgSend(v6, "length"));
  id v7 = objc_claimAutoreleasedReturnValue();
  uint64_t v8 = (uint8_t *)[v7 bytes];
  size_t v9 = [v7 length];
  id v10 = v6;
  size_t v11 = compression_encode_buffer(v8, v9, (const uint8_t *)[v10 bytes], objc_msgSend(v10, "length"), 0, COMPRESSION_LZ4);
  __int16 v12 = (void *)MEMORY[0x263EFF8F8];
  id v13 = v7;
  uint64_t v14 = objc_msgSend(v12, "dataWithBytesNoCopy:length:freeWhenDone:", objc_msgSend(v13, "bytes"), v11, 0);
  double v15 = (void *)v14;
  if (v11)
  {
    v23[0] = v14;
    v22[0] = @"compressed_data";
    v22[1] = @"data_size";
    size_t v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "length"));
    v23[1] = v16;
    v22[2] = @"compressed_data_size";
    double v17 = [NSNumber numberWithUnsignedLong:v11];
    v22[3] = @"properties";
    v23[2] = v17;
    v23[3] = v3;
    CVPixelBufferRef v18 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:4];

    uint64_t v21 = 0;
    uint64_t v19 = [MEMORY[0x263F08AC0] dataWithPropertyList:v18 format:100 options:0 error:&v21];
  }
  else
  {
    CVPixelBufferRef v18 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136381443;
      uint64_t v25 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SISurface.m";
      __int16 v26 = 1025;
      int v27 = 226;
      __int16 v28 = 2048;
      uint64_t v29 = [v13 length];
      __int16 v30 = 2048;
      uint64_t v31 = [v10 length];
      _os_log_impl(&dword_21B697000, v18, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to compress data! dest length %zu src length %zu ***", buf, 0x26u);
    }
    uint64_t v19 = 0;
  }

  return v19;
}

id si_surface_png_representation(__IOSurface *a1)
{
  v38[1] = *MEMORY[0x263EF8340];
  VTPixelTransferSessionRef pixelTransferSessionOut = 0;
  if (!VTPixelTransferSessionCreate(0, &pixelTransferSessionOut))
  {
    CVPixelBufferRef pixelBufferOut = 0;
    uint64_t v37 = *MEMORY[0x263F040C0];
    v38[0] = MEMORY[0x263EFFA88];
    CFDictionaryRef v4 = [NSDictionary dictionaryWithObjects:v38 forKeys:&v37 count:1];
    CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    if (CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x263EFFB08], a1, v4, &pixelBufferOut))
    {
      char v6 = __SceneIntelligenceLogSharedInstance();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136380931;
        uint64_t v32 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SISurface.m";
        __int16 v33 = 1025;
        int v34 = 252;
        _os_log_impl(&dword_21B697000, v6, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to create input pixel buffer ***", buf, 0x12u);
      }

      id v3 = 0;
      goto LABEL_18;
    }
    CVPixelBufferRef destinationBuffer = 0;
    size_t Width = IOSurfaceGetWidth(a1);
    size_t Height = IOSurfaceGetHeight(a1);
    if (CVPixelBufferCreate(v5, Width, Height, 0x42475241u, 0, &destinationBuffer))
    {
      size_t v9 = __SceneIntelligenceLogSharedInstance();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136380931;
        uint64_t v32 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SISurface.m";
        __int16 v33 = 1025;
        int v34 = 258;
        id v10 = " %{private}s:%{private}d *** Failed to create output pixel buffer ***";
        size_t v11 = v9;
        uint32_t v12 = 18;
LABEL_15:
        _os_log_impl(&dword_21B697000, v11, OS_LOG_TYPE_ERROR, v10, buf, v12);
      }
    }
    else
    {
      OSStatus v13 = VTPixelTransferSessionTransferImage(pixelTransferSessionOut, pixelBufferOut, destinationBuffer);
      VTPixelTransferSessionInvalidate(pixelTransferSessionOut);
      CFRelease(pixelTransferSessionOut);
      CVPixelBufferRelease(pixelBufferOut);
      if (!v13)
      {
        double v15 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F00268]);
        size_t v16 = (void *)MEMORY[0x263F00650];
        CVPixelBufferRef v17 = destinationBuffer;
        uint64_t v29 = *MEMORY[0x263F008F0];
        __int16 v30 = v15;
        CVPixelBufferRef v18 = [NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
        size_t v9 = [v16 imageWithCVPixelBuffer:v17 options:v18];

        if (v9)
        {
          uint64_t v19 = (void *)MEMORY[0x263F00628];
          uint64_t v27 = *MEMORY[0x263F00858];
          __int16 v28 = v15;
          BOOL v20 = [NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
          uint64_t v21 = [v19 contextWithOptions:v20];

          uint64_t v22 = *MEMORY[0x263F00868];
          uint64_t v23 = [v21 workingColorSpace];
          id v3 = [v21 PNGRepresentationOfImage:v9 format:v22 colorSpace:v23 options:MEMORY[0x263EFFA78]];
          CGColorSpaceRelease(v15);
          CVPixelBufferRelease(destinationBuffer);
        }
        else
        {
          uint64_t v21 = __SceneIntelligenceLogSharedInstance();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136380931;
            uint64_t v32 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SISurface.m";
            __int16 v33 = 1025;
            int v34 = 278;
            _os_log_impl(&dword_21B697000, v21, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to create CIImage ***", buf, 0x12u);
          }
          id v3 = 0;
        }

        goto LABEL_17;
      }
      size_t v9 = __SceneIntelligenceLogSharedInstance();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136381187;
        uint64_t v32 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SISurface.m";
        __int16 v33 = 1025;
        int v34 = 269;
        __int16 v35 = 1024;
        OSStatus v36 = v13;
        id v10 = " %{private}s:%{private}d *** Failed to transfer pixel buffer: %d ***";
        size_t v11 = v9;
        uint32_t v12 = 24;
        goto LABEL_15;
      }
    }
    id v3 = 0;
LABEL_17:

LABEL_18:
    goto LABEL_19;
  }
  CFDictionaryRef v2 = __SceneIntelligenceLogSharedInstance();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136380931;
    uint64_t v32 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SISurface.m";
    __int16 v33 = 1025;
    int v34 = 243;
    _os_log_impl(&dword_21B697000, v2, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to create pixel transfer session ***", buf, 0x12u);
  }

  id v3 = 0;
LABEL_19:
  return v3;
}

id si_surface_save_to_data(__IOSurface *a1)
{
  CFDictionaryRef v2 = si_surface_png_representation(a1);
  if (v2)
  {
    id v3 = (void *)si_surface_save_to_data_internal(a1);
    CFDictionaryRef v4 = v3;
    if (v3)
    {
      uint64_t v5 = [v3 length];
      uint64_t v6 = [v2 length];
      id v7 = [MEMORY[0x263EFF990] dataWithLength:v5 + v6 + 12];
      uint64_t v8 = (void *)[v7 mutableBytes];
      id v9 = v2;
      memcpy(v8, (const void *)[v9 bytes], objc_msgSend(v9, "length") - 12);
      id v10 = v4;
      unsigned int v11 = ~update_crc(0xFFFFFFFFLL, (char *)[v10 bytes], objc_msgSend(v10, "length"));
      id v12 = v7;
      uint64_t v13 = [v12 mutableBytes];
      uint64_t v14 = v13 + [v9 length];
      *(_DWORD *)(v14 - 12) = bswap32([v10 length]);
      *(_DWORD *)(v14 - 8) = bswap32(*(unsigned int *)SIPngChunkType);
      id v15 = v10;
      memcpy((void *)(v14 - 4), (const void *)[v15 bytes], objc_msgSend(v15, "length"));
      uint64_t v16 = v14 + v5;
      *(_DWORD *)(v14 + v5 - 4) = bswap32(v11);
      id v17 = v9;
      uint64_t v18 = [v17 bytes];
      uint64_t v19 = [v17 length];
      int v20 = *(_DWORD *)(v18 + v19 - 4);
      *(void *)uint64_t v16 = *(void *)(v18 + v19 - 12);
      *(_DWORD *)(v16 + 8) = v20;
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

uint64_t si_surface_save_to_url(__IOSurface *a1, uint64_t a2)
{
  id v3 = si_surface_save_to_data(a1);
  return [v3 writeToURL:a2 atomically:0];
}

uint64_t si_surface_print_data_to_iterm(void *a1)
{
  id v1 = a1;
  printf("\x1B]1337;File=[size=%lld;inline=1;preserveAspectRatio=1]:", [v1 length]);
  CFDictionaryRef v2 = [v1 base64EncodedStringWithOptions:0];

  id v3 = v2;
  puts((const char *)[v3 UTF8String]);

  return puts("\a");
}

BOOL si_surface_print_url_to_iterm(uint64_t a1)
{
  id v1 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:a1];
  CFDictionaryRef v2 = v1;
  if (v1) {
    si_surface_print_data_to_iterm(v1);
  }

  return v2 != 0;
}

BOOL si_surface_print_surface_to_iterm(__IOSurface *a1)
{
  if (!a1) {
    return 0;
  }
  id v1 = si_surface_png_representation(a1);
  CFDictionaryRef v2 = v1;
  BOOL v3 = v1 != 0;
  if (v1) {
    si_surface_print_data_to_iterm(v1);
  }

  return v3;
}

uint64_t si_surface_save_raw_png_to_url(__IOSurface *a1, uint64_t a2)
{
  BOOL v3 = si_surface_png_representation(a1);
  uint64_t v4 = [v3 writeToURL:a2 atomically:0];

  return v4;
}

void sub_21B6B8D3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6B8E74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6B8F00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6B8F98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6B90B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6B91A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6B924C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6B9594(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

float32_t SIWriteBoxCorners(uint64_t a1, float32x4_t a2, float32x4_t a3, float32x4_t a4, float32x4_t a5, float32x4_t a6, double a7, float32x4_t a8)
{
  uint64_t v8 = 0;
  id v9 = (_DWORD *)(a1 + 8);
  v10.i64[0] = 0xBF000000BF000000;
  v10.i64[1] = 0xBF000000BF000000;
  do
  {
    a8.f32[0] = (float)(v8 >> 2);
    a8.f32[1] = (float)((v8 >> 1) & 1);
    a8.f32[2] = (float)(v8 & 1);
    float32x4_t v11 = vmulq_f32(a6, vaddq_f32(a8, v10));
    a8 = vaddq_f32(a5, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, v11.f32[0]), a3, *(float32x2_t *)v11.f32, 1), a4, v11, 2));
    *((void *)v9 - 1) = a8.i64[0];
    *id v9 = a8.i32[2];
    ++v8;
    v9 += 3;
  }
  while (v8 != 8);
  return a2.f32[0];
}

float32x4_t SIWriteTransformExtent(uint64_t a1, __n128 *a2, uint64_t a3, double a4, float32x4_t a5)
{
  uint64_t v5 = 0;
  uint64_t v58 = *MEMORY[0x263EF8340];
  char v6 = 1;
  memset(v57, 0, sizeof(v57));
  do
  {
    uint64_t v7 = 0;
    char v8 = v6;
    char v9 = 1;
    do
    {
      uint64_t v10 = 0;
      char v11 = v9;
      char v12 = 1;
      do
      {
        uint64_t v13 = 0;
        char v14 = v12;
        id v15 = &v57[4 * v5 + 2 * v7 + v10];
        long long v16 = *v15;
        uint64_t v17 = a1 + 48 * v5 + 24 * v7 + 12 * v10;
        do
        {
          int v18 = *(_DWORD *)(v17 + 4 * v13);
          long long v55 = v16;
          *(_DWORD *)((unint64_t)&v55 & 0xFFFFFFFFFFFFFFF3 | (4 * (v13 & 3))) = v18;
          long long v16 = v55;
          ++v13;
        }
        while (v13 != 3);
        char v12 = 0;
        *((_DWORD *)v15 + 2) = DWORD2(v55);
        *(void *)id v15 = v16;
        uint64_t v10 = 1;
      }
      while ((v14 & 1) != 0);
      char v9 = 0;
      uint64_t v7 = 1;
    }
    while ((v11 & 1) != 0);
    char v6 = 0;
    uint64_t v5 = 1;
  }
  while ((v8 & 1) != 0);
  uint64_t v19 = 0;
  v20.i32[3] = 0;
  memset(v56, 0, sizeof(v56));
  do
  {
    uint64_t v21 = 0;
    uint64_t v22 = v19++;
    if (v19 == 3) {
      char v23 = 0;
    }
    else {
      char v23 = v19;
    }
    char v24 = v22 - 1;
    if (!v22) {
      char v24 = 2;
    }
    int v25 = 1 << v22;
    uint64_t v26 = 2 - v22;
    char v27 = 1;
    do
    {
      uint64_t v28 = 0;
      char v29 = v27;
      int v30 = v21 << v23;
      uint64_t v31 = 2 * v21;
      char v32 = 1;
      do
      {
        char v33 = v32;
        unsigned int v34 = (v28 << v24) + v30;
        uint64_t v35 = a1 + 12 * (v34 + v25);
        v20.i64[0] = *(void *)v35;
        v20.i32[2] = *(_DWORD *)(v35 + 8);
        uint64_t v36 = a1 + 12 * v34;
        a5.i64[0] = *(void *)v36;
        a5.i32[2] = *(_DWORD *)(v36 + 8);
        float32x4_t v20 = vsubq_f32(v20, a5);
        v56[4 * v26 + (v28 | v31)] = v20;
        uint64_t v28 = 1;
        char v32 = 0;
      }
      while ((v33 & 1) != 0);
      char v27 = 0;
      uint64_t v21 = 1;
    }
    while ((v29 & 1) != 0);
  }
  while (v19 != 3);
  uint64_t v37 = 0;
  char v38 = v56;
  __asm { FMOV            V0.4S, #0.25 }
  do
  {
    uint64_t v44 = 0;
    float32x4_t v45 = 0uLL;
    do
      float32x4_t v45 = vaddq_f32(v45, (float32x4_t)v38[v44++]);
    while (v44 != 4);
    float32x4_t v46 = vmulq_f32(v45, _Q0);
    float32x4_t v47 = vmulq_f32(v46, v46);
    *(float *)(a3 + 4 * v37) = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v47, 2), vaddq_f32(v47, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v47.f32, 1))).f32[0]);
    uint64_t v48 = (const float *)(a3 + 4 * (v37 & 3));
    float32x4_t v49 = vld1q_dup_f32(v48);
    float32x4_t v50 = vdivq_f32(v46, v49);
    v50.i32[3] = 0;
    a2[v37++] = (__n128)v50;
    v38 += 4;
  }
  while (v37 != 3);
  uint64_t v51 = 0;
  float32x4_t v52 = 0uLL;
  do
    float32x4_t v52 = vaddq_f32(v52, (float32x4_t)v57[v51++]);
  while (v51 != 8);
  v53.i64[0] = 0x3E0000003E000000;
  v53.i64[1] = 0x3E0000003E000000;
  float32x4_t result = vmulq_f32(v52, v53);
  result.i32[3] = 1.0;
  a2[3] = (__n128)result;
  return result;
}

void sub_21B6B9A5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6B9C00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_21B6B9C94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)SIVisualLogger;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_21B6B9DA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6B9E1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6B9F30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6B9FE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6BA0BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6BA5A8(_Unwind_Exception *a1)
{
  std::__shared_weak_count::__release_shared[abi:nn180100](v4);

  _Unwind_Resume(a1);
}

void sub_21B6BA8D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6BAAE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  std::__shared_weak_count::__release_shared[abi:nn180100](v11);
  std::__shared_weak_count::__release_shared[abi:nn180100](v10);

  _Unwind_Resume(a1);
}

void sub_21B6BACF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12)
{
  std::__shared_weak_count::__release_shared[abi:nn180100](v14);
  if (a12) {
    std::__shared_weak_count::__release_shared[abi:nn180100](a12);
  }

  _Unwind_Resume(a1);
}

void sub_21B6BAF0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12)
{
  std::__shared_weak_count::__release_shared[abi:nn180100](v14);
  if (a12) {
    std::__shared_weak_count::__release_shared[abi:nn180100](a12);
  }

  _Unwind_Resume(a1);
}

void sub_21B6BB134(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12)
{
  std::__shared_weak_count::__release_shared[abi:nn180100](v15);
  if (a12) {
    std::__shared_weak_count::__release_shared[abi:nn180100](a12);
  }

  _Unwind_Resume(a1);
}

void sub_21B6BB3B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, std::__shared_weak_count *a13)
{
  std::__shared_weak_count::__release_shared[abi:nn180100](v16);
  if (a13) {
    std::__shared_weak_count::__release_shared[abi:nn180100](a13);
  }

  _Unwind_Resume(a1);
}

void sub_21B6BB588(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6BB7C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12)
{
  std::__shared_weak_count::__release_shared[abi:nn180100](v16);

  if (a12) {
    std::__shared_weak_count::__release_shared[abi:nn180100](a12);
  }

  _Unwind_Resume(a1);
}

void sub_21B6BB9EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, std::__shared_weak_count *a10)
{
  std::__shared_weak_count::__release_shared[abi:nn180100](v13);
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:nn180100](a10);
  }

  _Unwind_Resume(a1);
}

void *std::__hash_table<std::__hash_value_type<char const*,VZSubLogger *>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,VZSubLogger *>,std::hash<char const*>,std::equal_to<char const*>,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,VZSubLogger *>,std::equal_to<char const*>,std::hash<char const*>,true>,std::allocator<std::__hash_value_type<char const*,VZSubLogger *>>>::__emplace_unique_key_args<char const*,std::piecewise_construct_t const&,std::tuple<char const*&&>,std::tuple<>>(uint64_t a1, void *a2, uint64_t a3, void **a4)
{
  unint64_t v7 = 0x9DDFEA08EB382D69 * ((8 * *a2 + 8) ^ HIDWORD(*a2));
  unint64_t v8 = 0x9DDFEA08EB382D69 * (HIDWORD(*a2) ^ (v7 >> 47) ^ v7);
  unint64_t v9 = 0x9DDFEA08EB382D69 * (v8 ^ (v8 >> 47));
  unint64_t v10 = *(void *)(a1 + 8);
  if (v10)
  {
    uint8x8_t v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    if (v11.u32[0] > 1uLL)
    {
      unint64_t v4 = 0x9DDFEA08EB382D69 * (v8 ^ (v8 >> 47));
      if (v9 >= v10) {
        unint64_t v4 = v9 % v10;
      }
    }
    else
    {
      unint64_t v4 = v9 & (v10 - 1);
    }
    char v12 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v12)
    {
      for (uint64_t i = *v12; i; uint64_t i = (void *)*i)
      {
        unint64_t v14 = i[1];
        if (v14 == v9)
        {
          if (i[2] == *a2) {
            return i;
          }
        }
        else
        {
          if (v11.u32[0] > 1uLL)
          {
            if (v14 >= v10) {
              v14 %= v10;
            }
          }
          else
          {
            v14 &= v10 - 1;
          }
          if (v14 != v4) {
            break;
          }
        }
      }
    }
  }
  uint64_t i = operator new(0x20uLL);
  *uint64_t i = 0;
  i[1] = v9;
  i[2] = **a4;
  i[3] = 0;
  float v15 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v16 = *(float *)(a1 + 32);
  if (!v10 || (float)(v16 * (float)v10) < v15)
  {
    BOOL v17 = 1;
    if (v10 >= 3) {
      BOOL v17 = (v10 & (v10 - 1)) != 0;
    }
    unint64_t v18 = v17 | (2 * v10);
    unint64_t v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19) {
      size_t v20 = v19;
    }
    else {
      size_t v20 = v18;
    }
    std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__rehash<true>(a1, v20);
    unint64_t v10 = *(void *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10) {
        unint64_t v4 = v9 % v10;
      }
      else {
        unint64_t v4 = v9;
      }
    }
    else
    {
      unint64_t v4 = (v10 - 1) & v9;
    }
  }
  uint64_t v21 = *(void *)a1;
  uint64_t v22 = *(void **)(*(void *)a1 + 8 * v4);
  if (v22)
  {
    *uint64_t i = *v22;
LABEL_38:
    *uint64_t v22 = i;
    goto LABEL_39;
  }
  *uint64_t i = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = i;
  *(void *)(v21 + 8 * v4) = a1 + 16;
  if (*i)
  {
    unint64_t v23 = *(void *)(*i + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v23 >= v10) {
        v23 %= v10;
      }
    }
    else
    {
      v23 &= v10 - 1;
    }
    uint64_t v22 = (void *)(*(void *)a1 + 8 * v23);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return i;
}

void sub_21B6BBCE0(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_pointer<VZFileExportOptions *,anonymous namespace'::Ref<VZFileExportOptions *>::Ref(VZFileExportOptions *,anonymous namespace'::FromCreateTag)::{lambda(VZFileExportOptions *)#1},std::allocator<VZFileExportOptions>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x21D493090);
}

uint64_t std::__shared_ptr_pointer<VZFileExportOptions *,anonymous namespace'::Ref<VZFileExportOptions *>::Ref(VZFileExportOptions *,anonymous namespace'::FromCreateTag)::{lambda(VZFileExportOptions *)#1},std::allocator<VZFileExportOptions>>::__on_zero_shared()
{
  return VZRelease();
}

uint64_t std::__shared_ptr_pointer<VZFileExportOptions *,anonymous namespace'::Ref<VZFileExportOptions *>::Ref(VZFileExportOptions *,anonymous namespace'::FromCreateTag)::{lambda(VZFileExportOptions *)#1},std::allocator<VZFileExportOptions>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

BOOL std::type_info::operator==[abi:nn180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a2 + 8);
  if (v2 == v3) {
    return 1;
  }
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3)) {
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  }
  return 0;
}

void std::__shared_ptr_pointer<VZLogMessageFilter *,anonymous namespace'::Ref<VZLogMessageFilter *>::Ref(VZLogMessageFilter *,anonymous namespace'::FromCreateTag)::{lambda(VZLogMessageFilter *)#1},std::allocator<VZLogMessageFilter>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x21D493090);
}

uint64_t std::__shared_ptr_pointer<VZLogMessageFilter *,anonymous namespace'::Ref<VZLogMessageFilter *>::Ref(VZLogMessageFilter *,anonymous namespace'::FromCreateTag)::{lambda(VZLogMessageFilter *)#1},std::allocator<VZLogMessageFilter>>::__on_zero_shared()
{
  return VZRelease();
}

uint64_t std::__shared_ptr_pointer<VZLogMessageFilter *,anonymous namespace'::Ref<VZLogMessageFilter *>::Ref(VZLogMessageFilter *,anonymous namespace'::FromCreateTag)::{lambda(VZLogMessageFilter *)#1},std::allocator<VZLogMessageFilter>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void std::__shared_ptr_pointer<VZClientOptions *,anonymous namespace'::Ref<VZClientOptions *>::Ref(VZClientOptions *,anonymous namespace'::FromCreateTag)::{lambda(VZClientOptions *)#1},std::allocator<VZClientOptions>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x21D493090);
}

uint64_t std::__shared_ptr_pointer<VZClientOptions *,anonymous namespace'::Ref<VZClientOptions *>::Ref(VZClientOptions *,anonymous namespace'::FromCreateTag)::{lambda(VZClientOptions *)#1},std::allocator<VZClientOptions>>::__on_zero_shared()
{
  return VZRelease();
}

uint64_t std::__shared_ptr_pointer<VZClientOptions *,anonymous namespace'::Ref<VZClientOptions *>::Ref(VZClientOptions *,anonymous namespace'::FromCreateTag)::{lambda(VZClientOptions *)#1},std::allocator<VZClientOptions>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void std::__shared_ptr_pointer<VZDataInfo *,anonymous namespace'::Ref<VZDataInfo *>::Ref(VZDataInfo *,anonymous namespace'::FromCreateTag)::{lambda(VZDataInfo *)#1},std::allocator<VZDataInfo>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x21D493090);
}

uint64_t std::__shared_ptr_pointer<VZDataInfo *,anonymous namespace'::Ref<VZDataInfo *>::Ref(VZDataInfo *,anonymous namespace'::FromCreateTag)::{lambda(VZDataInfo *)#1},std::allocator<VZDataInfo>>::__on_zero_shared()
{
  return VZRelease();
}

uint64_t std::__shared_ptr_pointer<VZDataInfo *,anonymous namespace'::Ref<VZDataInfo *>::Ref(VZDataInfo *,anonymous namespace'::FromCreateTag)::{lambda(VZDataInfo *)#1},std::allocator<VZDataInfo>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void std::__shared_ptr_pointer<VZDataInfo const*,anonymous namespace'::Ref<VZDataInfo const*>::Ref(VZDataInfo const*,anonymous namespace'::FromCreateTag)::{lambda(VZDataInfo const*)#1},std::allocator<VZDataInfo const>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x21D493090);
}

uint64_t std::__shared_ptr_pointer<VZDataInfo const*,anonymous namespace'::Ref<VZDataInfo const*>::Ref(VZDataInfo const*,anonymous namespace'::FromCreateTag)::{lambda(VZDataInfo const*)#1},std::allocator<VZDataInfo const>>::__on_zero_shared()
{
  return VZRelease();
}

uint64_t std::__shared_ptr_pointer<VZDataInfo const*,anonymous namespace'::Ref<VZDataInfo const*>::Ref(VZDataInfo const*,anonymous namespace'::FromCreateTag)::{lambda(VZDataInfo const*)#1},std::allocator<VZDataInfo const>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void std::__shared_ptr_pointer<VZData const*,anonymous namespace'::Ref<VZData const*>::Ref(VZData const*,anonymous namespace'::FromCreateTag)::{lambda(VZData const*)#1},std::allocator<VZData const>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x21D493090);
}

uint64_t std::__shared_ptr_pointer<VZData const*,anonymous namespace'::Ref<VZData const*>::Ref(VZData const*,anonymous namespace'::FromCreateTag)::{lambda(VZData const*)#1},std::allocator<VZData const>>::__on_zero_shared()
{
  return VZRelease();
}

uint64_t std::__shared_ptr_pointer<VZData const*,anonymous namespace'::Ref<VZData const*>::Ref(VZData const*,anonymous namespace'::FromCreateTag)::{lambda(VZData const*)#1},std::allocator<VZData const>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

id SISimdFloat3ToArray(__n128 a1)
{
  id v1 = objc_alloc(MEMORY[0x263EFF8C0]);
  uint64_t v2 = [NSNumber numberWithFloat:a1.n128_f64[0]];
  HIDWORD(v3) = a1.n128_u32[1];
  LODWORD(v3) = a1.n128_u32[1];
  unint64_t v4 = [NSNumber numberWithFloat:v3];
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a1.n128_u32[1], a1.n128_u32[2])));
  char v6 = objc_msgSend(v1, "initWithObjects:", v2, v4, v5, 0);

  return v6;
}

void sub_21B6BC424(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id SISimdFloat4ToArray(__n128 a1)
{
  id v1 = objc_alloc(MEMORY[0x263EFF8C0]);
  uint64_t v2 = [NSNumber numberWithFloat:a1.n128_f64[0]];
  HIDWORD(v3) = a1.n128_u32[1];
  LODWORD(v3) = a1.n128_u32[1];
  unint64_t v4 = [NSNumber numberWithFloat:v3];
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a1.n128_u32[1], a1.n128_u32[2])));
  char v6 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a1.n128_u32[1], a1.n128_u32[3])));
  unint64_t v7 = objc_msgSend(v1, "initWithObjects:", v2, v4, v5, v6, 0);

  return v7;
}

void sub_21B6BC530(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id SISimdFloat3x3ToArray(__n128 a1, __n128 a2, __n128 a3)
{
  id v3 = objc_alloc(MEMORY[0x263EFF8C0]);
  unint64_t v4 = [NSNumber numberWithFloat:a1.n128_f64[0]];
  uint64_t v5 = [NSNumber numberWithFloat:a2.n128_f64[0]];
  char v6 = [NSNumber numberWithFloat:a3.n128_f64[0]];
  HIDWORD(v7) = a1.n128_u32[1];
  LODWORD(v7) = a1.n128_u32[1];
  unint64_t v8 = [NSNumber numberWithFloat:v7];
  HIDWORD(v9) = a2.n128_u32[1];
  LODWORD(v9) = a2.n128_u32[1];
  unint64_t v10 = [NSNumber numberWithFloat:v9];
  HIDWORD(v11) = a3.n128_u32[1];
  LODWORD(v11) = a3.n128_u32[1];
  char v12 = [NSNumber numberWithFloat:v11];
  uint64_t v13 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a1.n128_u32[1], a1.n128_u32[2])));
  unint64_t v14 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a2.n128_u32[1], a2.n128_u32[2])));
  float v15 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a3.n128_u32[1], a3.n128_u32[2])));
  float v16 = objc_msgSend(v3, "initWithObjects:", v4, v5, v6, v8, v10, v12, v13, v14, v15, 0);

  return v16;
}

void sub_21B6BC6EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6BC73C()
{
}

void sub_21B6BC744()
{
}

void sub_21B6BC74C()
{
}

void sub_21B6BC754()
{
}

id SISimdFloat4x4ToArray(__n128 a1, __n128 a2, __n128 a3, __n128 a4)
{
  id v4 = objc_alloc(MEMORY[0x263EFF8C0]);
  int v25 = [NSNumber numberWithFloat:a1.n128_f64[0]];
  uint64_t v5 = [NSNumber numberWithFloat:a2.n128_f64[0]];
  uint64_t v6 = [NSNumber numberWithFloat:a3.n128_f64[0]];
  uint64_t v7 = [NSNumber numberWithFloat:a4.n128_f64[0]];
  HIDWORD(v8) = a1.n128_u32[1];
  LODWORD(v8) = a1.n128_u32[1];
  char v27 = (void *)v7;
  uint64_t v9 = [NSNumber numberWithFloat:v8];
  HIDWORD(v10) = a2.n128_u32[1];
  LODWORD(v10) = a2.n128_u32[1];
  uint64_t v26 = (void *)v9;
  double v11 = [NSNumber numberWithFloat:v10];
  HIDWORD(v12) = a3.n128_u32[1];
  LODWORD(v12) = a3.n128_u32[1];
  uint64_t v13 = [NSNumber numberWithFloat:v12];
  HIDWORD(v14) = a4.n128_u32[1];
  LODWORD(v14) = a4.n128_u32[1];
  char v24 = [NSNumber numberWithFloat:v14];
  unint64_t v23 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a1.n128_u32[1], a1.n128_u32[2])));
  uint64_t v22 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a2.n128_u32[1], a2.n128_u32[2])));
  float v15 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a3.n128_u32[1], a3.n128_u32[2])));
  uint64_t v21 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a4.n128_u32[1], a4.n128_u32[2])));
  float v16 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a1.n128_u32[1], a1.n128_u32[3])));
  size_t v20 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a2.n128_u32[1], a2.n128_u32[3])));
  a1.n128_u64[0] = v6;
  a3.n128_u64[0] = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a3.n128_u32[1], a3.n128_u32[3])));
  BOOL v17 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a4.n128_u32[1], a4.n128_u32[3])));
  id v19 = (id)objc_msgSend(v4, "initWithObjects:", v25, v5, a1.n128_u64[0], v27, v26, v11, v13, v24, v23, v22, v15, v21, v16, v20, a3.n128_u64[0], v17, 0);

  return v19;
}

void sub_21B6BCA2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,void *a29,void *a30,void *a31,void *a32,void *a33)
{
  uint64_t v37 = *(void **)(v36 - 160);
  unint64_t v41 = v33;
  char v38 = *(void **)(v36 - 112);
  unint64_t v39 = *(void **)(v36 - 128);

  _Unwind_Resume(a1);
}

void sub_21B6BCB10()
{
}

void sub_21B6BCB24()
{
}

void sub_21B6BCB38()
{
}

void sub_21B6BCB4C()
{
}

void sub_21B6BCB60()
{
}

void sub_21B6BCB74()
{
}

void sub_21B6BCB84()
{
}

void sub_21B6BCB90()
{
}

void sub_21B6BCB9C()
{
}

void sub_21B6BCBA8()
{
}

void sub_21B6BCBB0()
{
}

__n128 SISimdFloat3FromArray(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 objectAtIndexedSubscript:0];
  [v2 floatValue];
  unsigned __int32 v11 = v3;
  id v4 = [v1 objectAtIndexedSubscript:1];
  [v4 floatValue];
  unsigned __int32 v10 = v5;
  uint64_t v6 = [v1 objectAtIndexedSubscript:2];
  [v6 floatValue];
  unsigned __int32 v9 = v7;

  result.n128_u32[0] = v11;
  result.n128_u32[1] = v10;
  result.n128_u32[2] = v9;
  return result;
}

void sub_21B6BCC5C(_Unwind_Exception *a1)
{
  unsigned __int32 v5 = v4;

  _Unwind_Resume(a1);
}

__n128 SISimdFloat4FromArray(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 objectAtIndexedSubscript:0];
  [v2 floatValue];
  unsigned int v14 = v3;
  id v4 = [v1 objectAtIndexedSubscript:1];
  [v4 floatValue];
  unsigned int v13 = v5;
  uint64_t v6 = [v1 objectAtIndexedSubscript:2];
  [v6 floatValue];
  unsigned int v12 = v7;
  double v8 = [v1 objectAtIndexedSubscript:3];
  [v8 floatValue];
  *(void *)&long long v9 = __PAIR64__(v13, v14);
  *((void *)&v9 + 1) = __PAIR64__(v10, v12);
  long long v15 = v9;

  return (__n128)v15;
}

void sub_21B6BCD68(_Unwind_Exception *a1)
{
  uint64_t v6 = v5;

  _Unwind_Resume(a1);
}

__n128 SISimdFloat3x3FromArray(void *a1)
{
  id v1 = a1;
  uint64_t v2 = objc_msgSend(v1, "subarrayWithRange:", 0, 3);
  __n128 v8 = SISimdFloat3FromArray(v2);
  unsigned int v3 = objc_msgSend(v1, "subarrayWithRange:", 3, 3);
  __n128 v7 = SISimdFloat3FromArray(v3);
  id v4 = objc_msgSend(v1, "subarrayWithRange:", 6, 3);
  unsigned __int32 v6 = SISimdFloat3FromArray(v4).n128_u32[0];

  result.n128_u64[0] = vzip1q_s32((int32x4_t)v8, (int32x4_t)v7).u64[0];
  result.n128_u32[2] = v6;
  return result;
}

void sub_21B6BCE74(_Unwind_Exception *a1)
{
  unsigned int v5 = v4;

  _Unwind_Resume(a1);
}

__n128 SISimdFloat4x4FromArray(void *a1)
{
  id v1 = a1;
  uint64_t v2 = objc_msgSend(v1, "subarrayWithRange:", 0, 4);
  __n128 v9 = SISimdFloat4FromArray(v2);
  unsigned int v3 = objc_msgSend(v1, "subarrayWithRange:", 4, 4);
  __n128 v8 = SISimdFloat4FromArray(v3);
  id v4 = objc_msgSend(v1, "subarrayWithRange:", 8, 4);
  __n128 v7 = SISimdFloat4FromArray(v4);
  unsigned int v5 = objc_msgSend(v1, "subarrayWithRange:", 12, 4);
  int32x4_t v10 = vzip1q_s32(vzip1q_s32((int32x4_t)v9, (int32x4_t)v7), vzip1q_s32((int32x4_t)v8, (int32x4_t)SISimdFloat4FromArray(v5)));

  return (__n128)v10;
}

void sub_21B6BCFAC(_Unwind_Exception *a1)
{
  unsigned __int32 v6 = v5;

  _Unwind_Resume(a1);
}

__CVBuffer *SICreateProbabilityFP16ColorizedResult(__CVBuffer *a1)
{
  int Width = CVPixelBufferGetWidth(a1);
  int Height = CVPixelBufferGetHeight(a1);
  id v4 = SICreateCVPixelBuffer(Width, Height, 0x18u, 1);
  CVPixelBufferLockBaseAddress(a1, 0);
  CVPixelBufferLockBaseAddress(v4, 0);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(a1);
  unsigned __int32 v6 = (char *)CVPixelBufferGetBaseAddress(v4);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a1);
  size_t v8 = CVPixelBufferGetBytesPerRow(v4);
  if (Height >= 1)
  {
    for (uint64_t i = 0; i != Height; ++i)
    {
      if (Width >= 1)
      {
        int32x4_t v10 = &v6[v8 * i];
        uint64_t v11 = Width;
        unsigned int v12 = (__int16 *)BaseAddress;
        do
        {
          __int16 v13 = *v12++;
          _H0 = v13;
          __asm { FCVT            S0, H0 }
          int v20 = (int)(float)(_S0 * 255.0);
          *int32x4_t v10 = v20;
          v10[1] = v20;
          v10[2] = v20;
          v10 += 3;
          --v11;
        }
        while (v11);
      }
      BaseAddress += 2 * (BytesPerRow >> 1);
    }
  }
  CVPixelBufferUnlockBaseAddress(a1, 0);
  CVPixelBufferUnlockBaseAddress(v4, 0);
  return v4;
}

__CVBuffer *SICreateProbabilityColorizedResult(__CVBuffer *a1)
{
  int Width = CVPixelBufferGetWidth(a1);
  int Height = CVPixelBufferGetHeight(a1);
  id v4 = SICreateCVPixelBuffer(Width, Height, 0x18u, 1);
  CVPixelBufferLockBaseAddress(a1, 0);
  CVPixelBufferLockBaseAddress(v4, 0);
  BaseAddress = (float *)CVPixelBufferGetBaseAddress(a1);
  unsigned __int32 v6 = (char *)CVPixelBufferGetBaseAddress(v4);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a1);
  size_t v8 = CVPixelBufferGetBytesPerRow(v4);
  if (Height >= 1)
  {
    for (uint64_t i = 0; i != Height; ++i)
    {
      if (Width >= 1)
      {
        int32x4_t v10 = &v6[v8 * i];
        uint64_t v11 = Width;
        unsigned int v12 = BaseAddress;
        do
        {
          float v13 = *v12++;
          int v14 = (int)(float)(v13 * 255.0);
          *int32x4_t v10 = v14;
          v10[1] = v14;
          v10[2] = v14;
          v10 += 3;
          --v11;
        }
        while (v11);
      }
      BaseAddress += BytesPerRow >> 2;
    }
  }
  CVPixelBufferUnlockBaseAddress(a1, 0);
  CVPixelBufferUnlockBaseAddress(v4, 0);
  return v4;
}

__CVBuffer *SICreateMaterialSegmentationColorizedResult(__CVBuffer *a1)
{
  int Width = CVPixelBufferGetWidth(a1);
  int Height = CVPixelBufferGetHeight(a1);
  id v4 = SICreateCVPixelBuffer(Width, Height, 0x18u, 1);
  CVPixelBufferLockBaseAddress(a1, 0);
  CVPixelBufferLockBaseAddress(v4, 0);
  BaseAddress = (unsigned __int8 *)CVPixelBufferGetBaseAddress(a1);
  uint64_t v21 = (char *)CVPixelBufferGetBaseAddress(v4);
  pixelBuffer = a1;
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a1);
  unint64_t v18 = v4;
  size_t v20 = CVPixelBufferGetBytesPerRow(v4);
  if (Height >= 1)
  {
    uint64_t v7 = 0;
    uint64_t v8 = Height;
    do
    {
      if (Width >= 1)
      {
        __n128 v9 = &v21[v20 * v7];
        uint64_t v10 = Width;
        uint64_t v11 = BaseAddress;
        do
        {
          unsigned int v12 = *v11++;
          float v13 = SIGetMaterialColorByLabel(v12);
          int v14 = [v13 objectAtIndexedSubscript:2];
          *__n128 v9 = [v14 charValue];

          long long v15 = [v13 objectAtIndexedSubscript:1];
          v9[1] = [v15 charValue];

          float v16 = [v13 objectAtIndexedSubscript:0];
          v9[2] = [v16 charValue];

          v9 += 3;
          --v10;
        }
        while (v10);
      }
      ++v7;
      BaseAddress += BytesPerRow;
    }
    while (v7 != v8);
  }
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
  CVPixelBufferUnlockBaseAddress(v18, 0);
  return v18;
}

void sub_21B6BD3F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CVBuffer *SICreateSemanticColorizedResult(__CVBuffer *a1)
{
  int Width = CVPixelBufferGetWidth(a1);
  int Height = CVPixelBufferGetHeight(a1);
  id v4 = SICreateCVPixelBuffer(Width, Height, 0x18u, 1);
  CVPixelBufferLockBaseAddress(a1, 0);
  CVPixelBufferLockBaseAddress(v4, 0);
  BaseAddress = (unsigned __int8 *)CVPixelBufferGetBaseAddress(a1);
  uint64_t v21 = (char *)CVPixelBufferGetBaseAddress(v4);
  pixelBuffer = a1;
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a1);
  unint64_t v18 = v4;
  size_t v20 = CVPixelBufferGetBytesPerRow(v4);
  if (Height >= 1)
  {
    uint64_t v7 = 0;
    uint64_t v8 = Height;
    do
    {
      if (Width >= 1)
      {
        __n128 v9 = &v21[v20 * v7];
        uint64_t v10 = Width;
        uint64_t v11 = BaseAddress;
        do
        {
          unsigned int v12 = *v11++;
          float v13 = SIGetSemanticColorByLabel(v12);
          int v14 = [v13 objectAtIndexedSubscript:0];
          *__n128 v9 = [v14 charValue];

          long long v15 = [v13 objectAtIndexedSubscript:1];
          v9[1] = [v15 charValue];

          float v16 = [v13 objectAtIndexedSubscript:2];
          v9[2] = [v16 charValue];

          v9 += 3;
          --v10;
        }
        while (v10);
      }
      ++v7;
      BaseAddress += BytesPerRow;
    }
    while (v7 != v8);
  }
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
  CVPixelBufferUnlockBaseAddress(v18, 0);
  return v18;
}

void sub_21B6BD5B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t SIGetCameraOrientationFromExtrinsic(uint64_t a1)
{
  LODWORD(v2) = HIDWORD(*(void *)(a1 + 32));
  if (v2 >= 1.0)
  {
    float v3 = atan2f(-*(float *)(a1 + 8), -*(float *)(a1 + 24));
  }
  else if (v2 <= -1.0)
  {
    float v3 = atan2f(*(float *)(a1 + 8), *(float *)(a1 + 24));
  }
  else
  {
    long long v9 = *(_OWORD *)(a1 + 32);
    asinf(-v2);
    atan2f(*(float *)&v9, *((float *)&v9 + 2));
    float v3 = atan2f(*(float *)(a1 + 4), *(float *)(a1 + 20));
  }
  float v4 = v3 * 57.2957795;
  if (v4 > -45.0 && v4 <= 45.0) {
    return 0;
  }
  if (v4 > -135.0 && v4 <= -45.0) {
    return 1;
  }
  if (v4 > 135.0 || v4 <= 45.0) {
    return 3;
  }
  else {
    return 2;
  }
}

vImage_Error SIFloat32ToFloat16(void *a1, void *a2, vImagePixelCount a3)
{
  src.data = a1;
  src.height = 1;
  src.width = a3;
  src.rowBytes = 4 * a3;
  v4.data = a2;
  v4.height = 1;
  v4.width = a3;
  v4.rowBytes = 2 * (a3 & 0x3FFFFFFFFFFFFFFFLL);
  return vImageConvert_PlanarFtoPlanar16F(&src, &v4, 0);
}

vImage_Error SIFloat16ToFloat32(void *a1, void *a2, vImagePixelCount a3)
{
  src.data = a1;
  src.height = 1;
  src.width = a3;
  src.rowBytes = 2 * (a3 & 0x3FFFFFFFFFFFFFFFLL);
  v4.data = a2;
  v4.height = 1;
  v4.width = a3;
  v4.rowBytes = 4 * a3;
  return vImageConvert_Planar16FtoPlanarF(&src, &v4, 0);
}

id createE5RTException(uint64_t a1, uint64_t a2)
{
  float v2 = createE5RTExceptionMessage(a1, a2);
  float v3 = [MEMORY[0x263EFF940] exceptionWithName:@"E5RTRegressorFailure" reason:v2 userInfo:0];

  return v3;
}

id createE5RTExceptionMessage(uint64_t a1, uint64_t a2)
{
  float v2 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d - %s", a1, a2, e5rt_get_last_error_message());
  return v2;
}

id SIGetSemanticColorByLabel(unsigned int a1)
{
  if (a1 == 255)
  {
    float v2 = &unk_26CB84B50;
  }
  else
  {
    if ([&unk_26CB848B0 count] <= (unint64_t)a1)
    {
      float v2 = &unk_26CB84B50;
    }
    else
    {
      float v2 = [&unk_26CB848B0 objectAtIndexedSubscript:a1];
    }
  }
  return v2;
}

id SIGetMaterialColorByLabel(unsigned int a1)
{
  if (a1 == 255)
  {
    float v2 = &unk_26CB84B68;
  }
  else
  {
    if ([&unk_26CB84B38 count] <= (unint64_t)a1)
    {
      float v2 = &unk_26CB84B68;
    }
    else
    {
      float v2 = [&unk_26CB84B38 objectAtIndexedSubscript:a1];
    }
  }
  return v2;
}

double translateTransform(float32x4_t a1, float32x4_t a2, float32x4_t a3, float32x4_t a4, __n128 a5)
{
  uint64_t v5 = 0;
  a5.n128_u32[3] = 1.0;
  v7[2] = *(_OWORD *)(MEMORY[0x263EF89A8] + 32);
  v7[3] = a5;
  memset(v8, 0, sizeof(v8));
  do
  {
    v8[v5] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a1, COERCE_FLOAT(v7[v5])), a2, *(float32x2_t *)&v7[v5], 1), a3, (float32x4_t)v7[v5], 2), a4, (float32x4_t)v7[v5], 3);
    ++v5;
  }
  while (v5 != 4);
  return *(double *)v8;
}

CVPixelBufferRef SICreateCVPixelBuffer(size_t a1, size_t a2, OSType a3, int a4)
{
  return SICreateCVPixelBufferWithCustomStride(a1, a2, a3, 0, a4);
}

id SIPixelFormatToStr(int a1)
{
  v3[0] = HIBYTE(a1);
  v3[1] = BYTE2(a1);
  v3[2] = BYTE1(a1);
  v3[3] = a1;
  v3[4] = 0;
  uint64_t v1 = [NSString stringWithCString:v3 encoding:1];
  return v1;
}

uint64_t SIBytesPerElementForPixelFormat(int a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (a1 <= 1278226533)
  {
    if (a1 != 1111970369)
    {
      if (a1 == 1278226488) {
        return 1;
      }
LABEL_8:
      uint64_t v1 = __SceneIntelligenceLogSharedInstance();
      if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
      {
        int v3 = 136380931;
        vImage_Buffer v4 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBuffer.m";
        __int16 v5 = 1025;
        int v6 = 68;
        _os_log_impl(&dword_21B697000, v1, OS_LOG_TYPE_INFO, " %{private}s:%{private}d *** Unsupported pixel format. Set byte per element as 1 as default ***", (uint8_t *)&v3, 0x12u);
      }

      return 1;
    }
  }
  else
  {
    if (a1 == 1278226742 || a1 == 1278226536) {
      return 2;
    }
    if (a1 != 1278226534) {
      goto LABEL_8;
    }
  }
  return 4;
}

uint64_t SIPixelBufferHasSameAttr(__CVBuffer *a1, __CVBuffer *a2)
{
  size_t Width = CVPixelBufferGetWidth(a1);
  if (Width != CVPixelBufferGetWidth(a2)) {
    return 0;
  }
  size_t Height = CVPixelBufferGetHeight(a1);
  if (Height != CVPixelBufferGetHeight(a2)) {
    return 0;
  }
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  if (PixelFormatType != CVPixelBufferGetPixelFormatType(a2)) {
    return 0;
  }
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a1);
  if (BytesPerRow != CVPixelBufferGetBytesPerRow(a2)) {
    return 0;
  }
  BOOL v8 = CVPixelBufferGetIOSurface(a1) == 0;
  return v8 ^ (CVPixelBufferGetIOSurface(a2) != 0);
}

CVPixelBufferRef SICreateCVPixelBufferWithCustomStride(size_t a1, size_t a2, OSType a3, uint64_t a4, int a5)
{
  v31[2] = *MEMORY[0x263EF8340];
  id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v11 = v10;
  if (a5) {
    [v10 setObject:MEMORY[0x263EFFA78] forKeyedSubscript:*MEMORY[0x263F04130]];
  }
  if (a4)
  {
    uint64_t v12 = [NSNumber numberWithUnsignedLong:a4];
    float v13 = (void *)v12;
    if (a3 == 875836518)
    {
      v31[0] = v12;
      int v14 = [NSNumber numberWithUnsignedLong:2 * a4];
      v31[1] = v14;
      long long v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:2];
      [v11 setObject:v15 forKeyedSubscript:*MEMORY[0x263F040C8]];
    }
    else
    {
      [v11 setObject:v12 forKeyedSubscript:*MEMORY[0x263F04078]];
    }
  }
  CVPixelBufferRef pixelBufferOut = 0;
  if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], a1, a2, a3, (CFDictionaryRef)v11, &pixelBufferOut))
  {
    float v16 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      BOOL v17 = SIPixelFormatToStr(a3);
      *(_DWORD *)buf = 136381699;
      uint64_t v22 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBuffer.m";
      __int16 v23 = 1025;
      int v24 = 122;
      __int16 v25 = 2048;
      size_t v26 = a1;
      __int16 v27 = 2048;
      size_t v28 = a2;
      __int16 v29 = 2113;
      int v30 = v17;
      _os_log_impl(&dword_21B697000, v16, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Could not create pixel buffer (%zu x %zu) with format %{private}@ ***", buf, 0x30u);
    }
    CVPixelBufferRef v18 = 0;
  }
  else
  {
    CVPixelBufferRef v18 = pixelBufferOut;
  }

  return v18;
}

uint64_t SIPixelBufferPoolCreate(uint64_t a1, uint64_t a2, uint64_t a3, CVPixelBufferPoolRef *a4)
{
  v15[4] = *MEMORY[0x263EF8340];
  v15[0] = MEMORY[0x263EFFA78];
  uint64_t v7 = *MEMORY[0x263F04240];
  v14[0] = *MEMORY[0x263F04130];
  v14[1] = v7;
  BOOL v8 = [NSNumber numberWithUnsignedInt:a1];
  v15[1] = v8;
  void v14[2] = *MEMORY[0x263F04118];
  long long v9 = [NSNumber numberWithUnsignedInt:a2];
  void v15[2] = v9;
  v14[3] = *MEMORY[0x263F04180];
  id v10 = [NSNumber numberWithUnsignedInt:a3];
  v15[3] = v10;
  CFDictionaryRef v11 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:4];

  *a4 = 0;
  uint64_t v12 = CVPixelBufferPoolCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, v11, a4);

  return v12;
}

uint64_t SIPixelBufferPoolCreateWithBytePerRowAlignment(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, CVPixelBufferPoolRef *a5)
{
  v18[5] = *MEMORY[0x263EF8340];
  v18[0] = MEMORY[0x263EFFA78];
  uint64_t v9 = *MEMORY[0x263F04240];
  v17[0] = *MEMORY[0x263F04130];
  v17[1] = v9;
  id v10 = [NSNumber numberWithUnsignedInt:a1];
  v18[1] = v10;
  v17[2] = *MEMORY[0x263F04118];
  CFDictionaryRef v11 = [NSNumber numberWithUnsignedInt:a2];
  v18[2] = v11;
  v17[3] = *MEMORY[0x263F04180];
  uint64_t v12 = [NSNumber numberWithUnsignedInt:a3];
  v18[3] = v12;
  v17[4] = *MEMORY[0x263F04078];
  float v13 = [NSNumber numberWithUnsignedInt:a4];
  v18[4] = v13;
  CFDictionaryRef v14 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:5];

  *a5 = 0;
  uint64_t v15 = CVPixelBufferPoolCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, v14, a5);

  return v15;
}

uint64_t SITransferPixelBuffer(__CVBuffer *a1, __CVBuffer *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  VTPixelTransferSessionRef pixelTransferSessionOut = 0;
  if (VTPixelTransferSessionCreate(0, &pixelTransferSessionOut))
  {
    vImage_Buffer v4 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136380931;
      id v10 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBuffer.m";
      __int16 v11 = 1025;
      int v12 = 182;
      __int16 v5 = " %{private}s:%{private}d *** Failed to create VTPixelTransferSession ***";
LABEL_7:
      _os_log_impl(&dword_21B697000, v4, OS_LOG_TYPE_ERROR, v5, buf, 0x12u);
    }
  }
  else
  {
    VTSessionSetProperty(pixelTransferSessionOut, (CFStringRef)*MEMORY[0x263F1EA08], (CFTypeRef)*MEMORY[0x263F1EC78]);
    OSStatus v6 = VTPixelTransferSessionTransferImage(pixelTransferSessionOut, a1, a2);
    VTPixelTransferSessionInvalidate(pixelTransferSessionOut);
    CFRelease(pixelTransferSessionOut);
    if (!v6) {
      return 0;
    }
    vImage_Buffer v4 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136380931;
      id v10 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBuffer.m";
      __int16 v11 = 1025;
      int v12 = 191;
      __int16 v5 = " %{private}s:%{private}d *** Failed to perform copy via pixel transfer ***";
      goto LABEL_7;
    }
  }

  return 4294960636;
}

__CVBuffer *SICreateRGBFromBGRAPixelBuffer(__CVBuffer *a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (!a1)
  {
    CVPixelBufferRef v18 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v22 = 136380931;
      __int16 v23 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBuffer.m";
      __int16 v24 = 1025;
      int v25 = 200;
      _os_log_impl(&dword_21B697000, v18, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** unexpected nil input  ***", (uint8_t *)&v22, 0x12u);
    }
    goto LABEL_14;
  }
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  if (PixelFormatType != 1111970369)
  {
    int v19 = PixelFormatType;
    CVPixelBufferRef v18 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      size_t v20 = SIPixelFormatToStr(v19);
      int v22 = 136381187;
      __int16 v23 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBuffer.m";
      __int16 v24 = 1025;
      int v25 = 205;
      __int16 v26 = 2112;
      __int16 v27 = v20;
      _os_log_impl(&dword_21B697000, v18, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Unexpected pixelFormat: %@ ***", (uint8_t *)&v22, 0x1Cu);
    }
LABEL_14:

    return 0;
  }
  size_t Width = CVPixelBufferGetWidth(a1);
  size_t Height = CVPixelBufferGetHeight(a1);
  __int16 v5 = SICreateCVPixelBufferWithCustomStride(Width, Height, 0x18u, 0, 1);
  if (v5)
  {
    size_t v6 = CVPixelBufferGetHeight(a1);
    size_t v7 = CVPixelBufferGetWidth(a1);
    size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a1);
    size_t v9 = CVPixelBufferGetBytesPerRow(v5);
    CVPixelBufferLockBaseAddress(a1, 0);
    CVPixelBufferLockBaseAddress(v5, 0);
    BaseAddress = (char *)CVPixelBufferGetBaseAddress(a1);
    __int16 v11 = (char *)CVPixelBufferGetBaseAddress(v5);
    if (v6)
    {
      uint64_t v12 = 0;
      uint64_t v13 = v11 + 2;
      CFDictionaryRef v14 = BaseAddress + 1;
      do
      {
        uint64_t v15 = v14;
        float v16 = v13;
        for (size_t i = v7; i; --i)
        {
          *(v16 - 2) = v15[1];
          *(v16 - 1) = *v15;
          unsigned char *v16 = *(v15 - 1);
          v16 += 3;
          v15 += 4;
        }
        ++v12;
        v13 += v9;
        v14 += BytesPerRow;
      }
      while (v12 != v6);
    }
    CVPixelBufferUnlockBaseAddress(v5, 0);
    CVPixelBufferUnlockBaseAddress(a1, 0);
  }
  return v5;
}

size_t SIWrapCVPixelBufferAsVImage@<X0>(__CVBuffer *a1@<X0>, void **a2@<X8>)
{
  *a2 = CVPixelBufferGetBaseAddress(a1);
  a2[1] = (void *)CVPixelBufferGetHeight(a1);
  a2[2] = (void *)CVPixelBufferGetWidth(a1);
  size_t result = CVPixelBufferGetBytesPerRow(a1);
  a2[3] = (void *)result;
  return result;
}

size_t SIWrapCVPixelBufferPlaneAsVImage@<X0>(__CVBuffer *a1@<X0>, size_t a2@<X1>, void **a3@<X8>)
{
  *a3 = CVPixelBufferGetBaseAddressOfPlane(a1, a2);
  a3[1] = (void *)CVPixelBufferGetHeightOfPlane(a1, a2);
  a3[2] = (void *)CVPixelBufferGetWidthOfPlane(a1, a2);
  size_t result = CVPixelBufferGetBytesPerRowOfPlane(a1, a2);
  a3[3] = (void *)result;
  return result;
}

__CVBuffer *SICreateIOSurfaceBacked420vImageFromBuffers(size_t a1, size_t a2, char *a3, uint64_t a4, char *a5, uint64_t a6)
{
  uint64_t v12 = SICreateCVPixelBufferWithCustomStride(a1, a2, 0x34323076u, 0, 1);
  uint64_t v13 = v12;
  if (v12)
  {
    CVPixelBufferLockBaseAddress(v12, 0);
    BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(v13, 0);
    size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(v13, 0);
    if (a2)
    {
      size_t v16 = BytesPerRowOfPlane;
      size_t v17 = a2;
      do
      {
        memcpy(BaseAddressOfPlane, a3, a1);
        a3 += a4;
        BaseAddressOfPlane += v16;
        --v17;
      }
      while (v17);
    }
    CVPixelBufferRef v18 = (char *)CVPixelBufferGetBaseAddressOfPlane(v13, 1uLL);
    size_t v19 = CVPixelBufferGetBytesPerRowOfPlane(v13, 1uLL);
    if (a2 >= 2)
    {
      size_t v20 = v19;
      size_t v21 = a2 >> 1;
      do
      {
        memcpy(v18, a5, a1);
        a5 += a6;
        v18 += v20;
        --v21;
      }
      while (v21);
    }
    CVPixelBufferUnlockBaseAddress(v13, 0);
  }
  return v13;
}

__CVBuffer *SICreateIOSurfaceBackedPackedFloat32ImageFromBuffer(size_t a1, size_t a2, char *a3, uint64_t a4, signed int a5)
{
  size_t v8 = a2;
  if (a5 <= 1380410944)
  {
    if (a5 == 843264102) {
      goto LABEL_8;
    }
    int v10 = 1278226534;
  }
  else
  {
    if (a5 == 1380410945 || a5 == 1717855600) {
      goto LABEL_8;
    }
    int v10 = 1717856627;
  }
  if (a5 != v10) {
    SICreateIOSurfaceBackedPackedFloat32ImageFromBuffer_cold_1();
  }
LABEL_8:
  __int16 v11 = SICreateCVPixelBufferWithCustomStride(a1, a2, a5, 0, 1);
  uint64_t v12 = v11;
  if (v11)
  {
    uint64_t v13 = 4;
    if (a5 == 843264102) {
      uint64_t v13 = 2;
    }
    if (a5 == 1717856627) {
      uint64_t v14 = 1;
    }
    else {
      uint64_t v14 = v13;
    }
    if (a5 == 1717855600) {
      uint64_t v15 = 1;
    }
    else {
      uint64_t v15 = v14;
    }
    if (a5 == 1278226534) {
      uint64_t v16 = 1;
    }
    else {
      uint64_t v16 = v15;
    }
    CVPixelBufferLockBaseAddress(v11, 0);
    BaseAddress = (char *)CVPixelBufferGetBaseAddress(v12);
    size_t BytesPerRow = CVPixelBufferGetBytesPerRow(v12);
    if (v8)
    {
      size_t v19 = BytesPerRow;
      size_t v20 = 4 * a1 * v16;
      do
      {
        memcpy(BaseAddress, a3, v20);
        a3 += a4;
        BaseAddress += v19;
        --v8;
      }
      while (v8);
    }
    CVPixelBufferUnlockBaseAddress(v12, 0);
  }
  return v12;
}

__CVBuffer *SICreateIOSurfaceBackedPackedFloat16ImageFromBuffer(size_t a1, size_t a2, char *a3, uint64_t a4, signed int a5)
{
  size_t v8 = a2;
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (a5 <= 1380411456)
  {
    if (a5 == 843264104) {
      goto LABEL_8;
    }
    int v10 = 1278226536;
  }
  else
  {
    if (a5 == 1380411457 || a5 == 1751410032) {
      goto LABEL_8;
    }
    int v10 = 1751411059;
  }
  if (a5 != v10) {
    SICreateIOSurfaceBackedPackedFloat16ImageFromBuffer_cold_1();
  }
LABEL_8:
  __int16 v11 = SICreateCVPixelBufferWithCustomStride(a1, a2, a5, 0, 1);
  uint64_t v12 = v11;
  if (v11)
  {
    uint64_t v13 = 1;
    if (a5 != 1278226536 && a5 != 1751410032 && a5 != 1751411059)
    {
      if (a5 == 843264104) {
        uint64_t v13 = 2;
      }
      else {
        uint64_t v13 = 4;
      }
    }
    CVPixelBufferLockBaseAddress(v11, 0);
    BaseAddress = (char *)CVPixelBufferGetBaseAddress(v12);
    size_t BytesPerRow = CVPixelBufferGetBytesPerRow(v12);
    if (v8)
    {
      size_t v16 = BytesPerRow;
      size_t v17 = 2 * a1 * v13;
      do
      {
        memcpy(BaseAddress, a3, v17);
        a3 += a4;
        BaseAddress += v16;
        --v8;
      }
      while (v8);
    }
    CVPixelBufferUnlockBaseAddress(v12, 0);
  }
  else
  {
    CVPixelBufferRef v18 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v20 = 136380931;
      size_t v21 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBuffer.m";
      __int16 v22 = 1025;
      int v23 = 361;
      _os_log_impl(&dword_21B697000, v18, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to create IOSurfaceBackedPackedFloat16Image ***", (uint8_t *)&v20, 0x12u);
    }
  }
  return v12;
}

__CVBuffer *SICreateIOSurfaceBacked420vTestImage(size_t a1, size_t a2)
{
  v16[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  size_t v7 = (char *)v16 - v6;
  if (v8)
  {
    unint64_t v9 = 0;
    int v10 = (char *)v16 - v6;
    do
    {
      if (a1)
      {
        unint64_t v11 = 0;
        do
        {
          if (((v11 / v5) + (v9 / v5))) {
            char v12 = -21;
          }
          else {
            char v12 = 16;
          }
          v10[v11++] = v12;
        }
        while (a1 != v11);
      }
      ++v9;
      v10 += a1;
    }
    while (v9 != a2);
  }
  MEMORY[0x270FA5388](v4);
  uint64_t v14 = (char *)v16 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  memset(v14, 128, v13);
  return SICreateIOSurfaceBacked420vImageFromBuffers(a1, a2, v7, a1, v14, a1);
}

__CVBuffer *SICreateIOSurfaceBackedRGBAF32TestImage(uint64_t a1)
{
  v19[1] = *MEMORY[0x263EF8340];
  size_t v1 = MEMORY[0x270FA5388](a1);
  unint64_t v5 = (char *)&v19[-2 * v4];
  uint64_t v6 = 16 * v1;
  if (v2)
  {
    unint64_t v7 = 0;
    __asm { FMOV            V0.4S, #1.0 }
    size_t v13 = v5;
    do
    {
      if (v1)
      {
        unint64_t v14 = 0;
        unint64_t v15 = v7 / v3;
        do
        {
          int32x4_t v16 = _Q0;
          *(float *)v16.i32 = (float)(((v14 / v3) + (_BYTE)v15) & 1);
          int32x4_t v17 = vzip1q_s32(v16, v16);
          *(float *)&v17.i32[2] = (float)(((v14 / v3) + (_BYTE)v15) & 1);
          *(int32x4_t *)&v13[16 * v14++] = v17;
        }
        while (v1 != v14);
      }
      ++v7;
      v13 += v6;
    }
    while (v7 != v2);
  }
  return SICreateIOSurfaceBackedPackedFloat32ImageFromBuffer(v1, v2, v5, v6, 1380410945);
}

id mcams3CVPixelBufferProperties()
{
  v4[2] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F04078];
  v3[0] = *MEMORY[0x263F04130];
  v3[1] = v0;
  v4[0] = MEMORY[0x263EFFA78];
  v4[1] = &unk_26CB85078;
  size_t v1 = [NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:2];
  return v1;
}

id mcams4wCVPixelBufferHandMattingProperties()
{
  v4[2] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F040C8];
  v3[0] = *MEMORY[0x263F04130];
  v3[1] = v0;
  v4[0] = MEMORY[0x263EFFA78];
  v4[1] = &unk_26CB84B80;
  size_t v1 = [NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:2];
  return v1;
}

__CVBuffer *SICreatePixelBufferWithNewFormatFromExistingBuffer(__CVBuffer *a1, OSType a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  size_t Width = CVPixelBufferGetWidth(a1);
  size_t Height = CVPixelBufferGetHeight(a1);
  BOOL v6 = CVPixelBufferGetIOSurface(a1) != 0;
  unint64_t v7 = SICreateCVPixelBufferWithCustomStride(Width, Height, a2, 0, v6);
  if (SITransferPixelBuffer(a1, v7) == -6660)
  {
    uint64_t v8 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
      int v10 = SIPixelFormatToStr(PixelFormatType);
      OSType v11 = CVPixelBufferGetPixelFormatType(v7);
      char v12 = SIPixelFormatToStr(v11);
      int v14 = 136381443;
      unint64_t v15 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBuffer.m";
      __int16 v16 = 1025;
      int v17 = 454;
      __int16 v18 = 2112;
      size_t v19 = v10;
      __int16 v20 = 2112;
      size_t v21 = v12;
      _os_log_impl(&dword_21B697000, v8, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to create new pixelbuffer from %@ to %@ by VideoToolbox transferSession ***", (uint8_t *)&v14, 0x26u);
    }
    CVPixelBufferRelease(v7);
    return 0;
  }
  return v7;
}

uint64_t SIPixelBufferCopy(__CVBuffer *a1, __CVBuffer *a2)
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  size_t Width = CVPixelBufferGetWidth(a1);
  size_t v5 = CVPixelBufferGetWidth(a2);
  size_t Height = CVPixelBufferGetHeight(a1);
  size_t v7 = CVPixelBufferGetHeight(a2);
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  if (PixelFormatType != CVPixelBufferGetPixelFormatType(a2))
  {
    size_t v13 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      OSType v14 = CVPixelBufferGetPixelFormatType(a1);
      unint64_t v15 = SIPixelFormatToStr(v14);
      OSType v16 = CVPixelBufferGetPixelFormatType(a2);
      int v17 = SIPixelFormatToStr(v16);
      *(_DWORD *)buf = 136381443;
      float v62 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBuffer.m";
      __int16 v63 = 1025;
      int v64 = 474;
      __int16 v65 = 2113;
      size_t v66 = (size_t)v15;
      __int16 v67 = 2113;
      size_t v68 = (size_t)v17;
      _os_log_impl(&dword_21B697000, v13, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** SIPixelBufferCopy: Source and destination buffers must have matching pixelbuffer format (src:%{private}@, dst:%{private}@) ***", buf, 0x26u);
    }
    return 2;
  }
  if (Width != v5 || Height != v7)
  {
    __int16 v18 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136380931;
      float v62 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBuffer.m";
      __int16 v63 = 1025;
      int v64 = 479;
      _os_log_impl(&dword_21B697000, v18, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** SIPixelBufferCopy: Source and destination buffers must have matching dimensions ***", buf, 0x12u);
    }

    return 2;
  }
  CVReturn v9 = CVPixelBufferLockBaseAddress(a1, 0);
  if (v9)
  {
    CVReturn v10 = v9;
    OSType v11 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136381187;
      float v62 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBuffer.m";
      __int16 v63 = 1025;
      int v64 = 485;
      __int16 v65 = 1024;
      LODWORD(v66) = v10;
      _os_log_impl(&dword_21B697000, v11, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** SIPixelBufferCopy: Error locking source buffer: %d ***", buf, 0x18u);
    }

    return 4;
  }
  v57[0] = MEMORY[0x263EF8330];
  v57[1] = 3221225472;
  uint64_t v58 = __SIPixelBufferCopy_block_invoke;
  v59 = &__block_descriptor_40_e5_v8__0l;
  v60 = a1;
  CVReturn v20 = CVPixelBufferLockBaseAddress(a2, 0);
  if (v20)
  {
    size_t v21 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136381187;
      float v62 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBuffer.m";
      __int16 v63 = 1025;
      int v64 = 498;
      __int16 v65 = 1024;
      LODWORD(v66) = v20;
      _os_log_impl(&dword_21B697000, v21, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** SIPixelBufferCopy: Error locking destination buffer: %d ***", buf, 0x18u);
    }

    uint64_t v12 = 4;
    goto LABEL_51;
  }
  v53[0] = MEMORY[0x263EF8330];
  v53[1] = 3221225472;
  int v54 = __SIPixelBufferCopy_block_invoke_29;
  long long v55 = &__block_descriptor_40_e5_v8__0l;
  __int16 v56 = a2;
  int IsPlanar = CVPixelBufferIsPlanar(a1);
  int v23 = CVPixelBufferIsPlanar(a2);
  if ((IsPlanar != 0) != (v23 != 0))
  {
    uint64_t v24 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136380931;
      float v62 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBuffer.m";
      __int16 v63 = 1025;
      int v64 = 513;
      _os_log_impl(&dword_21B697000, v24, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** SIPixelBufferCopy: Cannot have planar mismatch between source (planar) and destination (non-planar) ***", buf, 0x12u);
    }

    goto LABEL_24;
  }
  if (!IsPlanar || !v23)
  {
    size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a1);
    size_t v38 = CVPixelBufferGetBytesPerRow(a2);
    size_t v39 = v38;
    if (BytesPerRow >= v38) {
      size_t v40 = v38;
    }
    else {
      size_t v40 = BytesPerRow;
    }
    BaseAddress = (char *)CVPixelBufferGetBaseAddress(a1);
    id v42 = (char *)CVPixelBufferGetBaseAddress(a2);
    uint64_t v43 = v42;
    if (BytesPerRow == v39)
    {
      memcpy(v42, BaseAddress, v40 * Height);
    }
    else
    {
      for (; Height; --Height)
      {
        memcpy(v43, BaseAddress, v40);
        v43 += v39;
        BaseAddress += BytesPerRow;
      }
    }
    goto LABEL_49;
  }
  size_t PlaneCount = CVPixelBufferGetPlaneCount(a1);
  if (PlaneCount != CVPixelBufferGetPlaneCount(a2))
  {
    uint64_t v44 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136380931;
      float v62 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBuffer.m";
      __int16 v63 = 1025;
      int v64 = 519;
      _os_log_impl(&dword_21B697000, v44, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** SIPixelBufferCopy: Source and destination buffers must have the same number of planes ***", buf, 0x12u);
    }

LABEL_46:
    uint64_t v12 = 2;
    goto LABEL_50;
  }
  if (!PlaneCount)
  {
LABEL_49:
    CVBufferPropagateAttachments(a1, a2);
    uint64_t v12 = 0;
    goto LABEL_50;
  }
  size_t v26 = 0;
  while (1)
  {
    size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a1, v26);
    size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a1, v26);
    size_t v29 = CVPixelBufferGetWidthOfPlane(a2, v26);
    size_t v30 = CVPixelBufferGetHeightOfPlane(a2, v26);
    if (WidthOfPlane != v29 || HeightOfPlane != v30)
    {
      float32x4_t v45 = __SceneIntelligenceLogSharedInstance();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136381187;
        float v62 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBuffer.m";
        __int16 v63 = 1025;
        int v64 = 532;
        __int16 v65 = 2048;
        size_t v66 = v26;
        _os_log_impl(&dword_21B697000, v45, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** SIPixelBufferCopy: Source and destination buffers match resolution and number of planes but plane %lu within each pixel buffer are different resolutions ***", buf, 0x1Cu);
      }
      goto LABEL_54;
    }
    size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a1, v26);
    size_t v32 = CVPixelBufferGetBytesPerRowOfPlane(a2, v26);
    size_t v33 = v32 * HeightOfPlane;
    if (BytesPerRowOfPlane * HeightOfPlane != v32 * HeightOfPlane)
    {
      float32x4_t v45 = __SceneIntelligenceLogSharedInstance();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136381699;
        float v62 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBuffer.m";
        __int16 v63 = 1025;
        int v64 = 543;
        __int16 v65 = 2048;
        size_t v66 = v26;
        __int16 v67 = 2048;
        size_t v68 = BytesPerRowOfPlane * HeightOfPlane;
        __int16 v69 = 2048;
        size_t v70 = v33;
        _os_log_impl(&dword_21B697000, v45, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** SIPixelBufferCopy: Source and destination buffers match resolution and number of planes but plane %lu within each pixel buffer has a different number of bytes per row (src: %zu, dst: %zu) ***", buf, 0x30u);
      }
LABEL_54:

      goto LABEL_46;
    }
    if (!(BytesPerRowOfPlane % WidthOfPlane)) {
      break;
    }
    BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(a2, v26);
    uint64_t v35 = CVPixelBufferGetBaseAddressOfPlane(a1, v26);
    memcpy(BaseAddressOfPlane, v35, BytesPerRowOfPlane * HeightOfPlane);
LABEL_36:
    if (PlaneCount == ++v26) {
      goto LABEL_49;
    }
  }
  memset(&src, 0, sizeof(src));
  SIWrapCVPixelBufferPlaneAsVImage(a1, v26, &src.data);
  memset(&dest, 0, sizeof(dest));
  SIWrapCVPixelBufferPlaneAsVImage(a2, v26, &dest.data);
  vImage_Error v36 = vImageCopyBuffer(&src, &dest, BytesPerRowOfPlane / WidthOfPlane, 0x10u);
  if (!v36) {
    goto LABEL_36;
  }
  float32x4_t v46 = __SceneIntelligenceLogSharedInstance();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
  {
    OSType v47 = CVPixelBufferGetPixelFormatType(a1);
    SIPixelFormatToStr(v47);
    id v48 = (id)objc_claimAutoreleasedReturnValue();
    OSType v49 = CVPixelBufferGetPixelFormatType(a2);
    float32x4_t v50 = SIPixelFormatToStr(v49);
    *(_DWORD *)buf = 136382979;
    float v62 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBuffer.m";
    __int16 v63 = 1025;
    int v64 = 564;
    __int16 v65 = 2048;
    size_t v66 = v36;
    __int16 v67 = 2048;
    size_t v68 = v26;
    __int16 v69 = 2113;
    size_t v70 = (size_t)v48;
    __int16 v71 = 2049;
    size_t v72 = WidthOfPlane;
    __int16 v73 = 2049;
    size_t v74 = HeightOfPlane;
    __int16 v75 = 2113;
    uint64_t v76 = v50;
    __int16 v77 = 2049;
    size_t v78 = WidthOfPlane;
    __int16 v79 = 2049;
    size_t v80 = HeightOfPlane;
    _os_log_impl(&dword_21B697000, v46, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** SIPixelBufferCopy: vImageCopyBuffer error (%zu) for plane %zu copying pixel buffer (format:%{private}@, plane size:%{private}zux%{private}zu) to pixel buffer (format:%{private}@, plane size:%{private}zux%{private}zu) ***", buf, 0x62u);
  }
LABEL_24:
  uint64_t v12 = 4;
LABEL_50:
  v54((uint64_t)v53);
LABEL_51:
  v58((uint64_t)v57);
  return v12;
}

void sub_21B6C1B90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,void (*a21)(char *),uint64_t a22,uint64_t a23,char a24,uint64_t a25,void (*a26)(char *))
{
}

void __SIPixelBufferCopy_block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  CVReturn v1 = CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(a1 + 32), 0);
  if (v1)
  {
    CVReturn v2 = v1;
    unint64_t v3 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136381187;
      size_t v5 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBuffer.m";
      __int16 v6 = 1025;
      int v7 = 492;
      __int16 v8 = 1024;
      CVReturn v9 = v2;
      _os_log_impl(&dword_21B697000, v3, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** SIPixelBufferCopy: Error unlocking source buffer: %d ***", (uint8_t *)&v4, 0x18u);
    }
  }
}

void __SIPixelBufferCopy_block_invoke_29(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  CVReturn v1 = CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(a1 + 32), 0);
  if (v1)
  {
    CVReturn v2 = v1;
    unint64_t v3 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136381187;
      size_t v5 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBuffer.m";
      __int16 v6 = 1025;
      int v7 = 505;
      __int16 v8 = 1024;
      CVReturn v9 = v2;
      _os_log_impl(&dword_21B697000, v3, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** SIPixelBufferCopy: Error unlocking destination buffer: %d ***", (uint8_t *)&v4, 0x18u);
    }
  }
}

uint64_t SIGetInputRotateAngleAttrFromLandscapeForOrientation(unint64_t a1)
{
  if (a1 > 3) {
    return 0xFFFFFFFFLL;
  }
  else {
    return dword_21B6CB2D0[a1];
  }
}

uint64_t SIGetOutputRotateAngleAttrToLandscapeForOrientation(unint64_t a1)
{
  if (a1 > 3) {
    return 0xFFFFFFFFLL;
  }
  else {
    return dword_21B6CB2E0[a1];
  }
}

uint64_t SIRotateAndCopyBuffer(__CVBuffer *a1, __CVBuffer *a2, int a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  if (PixelFormatType != CVPixelBufferGetPixelFormatType(a2))
  {
    CVReturn v9 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LODWORD(src.data) = 136380931;
      *(void **)((char *)&src.data + 4) = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuf"
                                          "fer/SIPixelBuffer.m";
      WORD2(src.height) = 1025;
      *(_DWORD *)((char *)&src.height + 6) = 629;
      uint64_t v10 = " %{private}s:%{private}d *** [SIRotateAndCopyBuffer] Failed to rotate and copy the buffer: pixelformat mismatch ***";
      p_vImage_Buffer src = (uint8_t *)&src;
LABEL_21:
      _os_log_impl(&dword_21B697000, v9, OS_LOG_TYPE_ERROR, v10, p_src, 0x12u);
    }
LABEL_22:

    return 0;
  }
  CVPixelBufferLockBaseAddress(a1, 0);
  CVPixelBufferLockBaseAddress(a2, 0);
  if (CVPixelBufferGetPixelFormatType(a1) == 875836518)
  {
    src.data = CVPixelBufferGetBaseAddressOfPlane(a1, 0);
    src.height = CVPixelBufferGetHeightOfPlane(a1, 0);
    src.width = CVPixelBufferGetWidthOfPlane(a1, 0);
    src.rowBytes = CVPixelBufferGetBytesPerRowOfPlane(a1, 0);
    dest.data = CVPixelBufferGetBaseAddressOfPlane(a2, 0);
    dest.height = CVPixelBufferGetHeightOfPlane(a2, 0);
    dest.width = CVPixelBufferGetWidthOfPlane(a2, 0);
    dest.rowBytes = CVPixelBufferGetBytesPerRowOfPlane(a2, 0);
    v21.data = CVPixelBufferGetBaseAddressOfPlane(a1, 1uLL);
    v21.height = CVPixelBufferGetHeightOfPlane(a1, 1uLL);
    v21.width = CVPixelBufferGetWidthOfPlane(a1, 1uLL);
    v21.rowBytes = CVPixelBufferGetBytesPerRowOfPlane(a1, 1uLL);
    v13.data = CVPixelBufferGetBaseAddressOfPlane(a2, 1uLL);
    v13.height = CVPixelBufferGetHeightOfPlane(a2, 1uLL);
    v13.width = CVPixelBufferGetWidthOfPlane(a2, 1uLL);
    v13.rowBytes = CVPixelBufferGetBytesPerRowOfPlane(a2, 1uLL);
    if (vImageRotate90_Planar8(&src, &dest, a3, 0, 0x10u))
    {
      int v7 = __SceneIntelligenceLogSharedInstance();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136381187;
        OSType v16 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBuffer.m";
        __int16 v17 = 1025;
        int v18 = 660;
        __int16 v19 = 1024;
        int v20 = a3;
        _os_log_impl(&dword_21B697000, v7, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** SIRotateAndCopyBuffer: Failed to rotate 90*%d degree for YUV planar8 ***", buf, 0x18u);
      }
    }
    if (vImageRotate90_Planar16U(&v21, &v13, a3, 0, 0x10u))
    {
      __int16 v8 = __SceneIntelligenceLogSharedInstance();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136381187;
        OSType v16 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBuffer.m";
        __int16 v17 = 1025;
        int v18 = 665;
        __int16 v19 = 1024;
        int v20 = a3;
        _os_log_impl(&dword_21B697000, v8, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** SIRotateAndCopyBuffer: Failed to rotate 90*%d degree for YUV planar16U ***", buf, 0x18u);
      }
    }
    goto LABEL_24;
  }
  src.data = CVPixelBufferGetBaseAddressOfPlane(a1, 0);
  src.height = CVPixelBufferGetHeightOfPlane(a1, 0);
  src.width = CVPixelBufferGetWidthOfPlane(a1, 0);
  src.rowBytes = CVPixelBufferGetBytesPerRowOfPlane(a1, 0);
  dest.data = CVPixelBufferGetBaseAddressOfPlane(a2, 0);
  dest.height = CVPixelBufferGetHeightOfPlane(a2, 0);
  dest.width = CVPixelBufferGetWidthOfPlane(a2, 0);
  dest.rowBytes = CVPixelBufferGetBytesPerRowOfPlane(a2, 0);
  if (CVPixelBufferGetPixelFormatType(a1) == 1278226488)
  {
    if (!vImageRotate90_Planar8(&src, &dest, a3, 0, 0x10u)) {
      goto LABEL_24;
    }
LABEL_19:
    CVReturn v9 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v21.data) = 136380931;
      *(void **)((char *)&v21.data + 4) = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuf"
                                          "fer/SIPixelBuffer.m";
      WORD2(v21.height) = 1025;
      *(_DWORD *)((char *)&v21.height + 6) = 690;
      uint64_t v10 = " %{private}s:%{private}d *** Failed to rotate buffer. ***";
      p_vImage_Buffer src = (uint8_t *)&v21;
      goto LABEL_21;
    }
    goto LABEL_22;
  }
  if (CVPixelBufferGetPixelFormatType(a1) == 1278226536 || CVPixelBufferGetPixelFormatType(a1) == 1751410032)
  {
    if (vImageRotate90_Planar16F(&src, &dest, a3, 0, 0x10u)) {
      goto LABEL_19;
    }
  }
  else if (vImageRotate90_PlanarF(&src, &dest, a3, 0.0, 0x10u))
  {
    goto LABEL_19;
  }
LABEL_24:
  CVPixelBufferUnlockBaseAddress(a1, 0);
  CVPixelBufferUnlockBaseAddress(a2, 0);
  return 1;
}

void sub_21B6C25D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6C289C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6C314C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_21B6C341C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6C348C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6C3760(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_21B6C394C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t SIGetANEDeviceType()
{
  return [MEMORY[0x263F28048] aneSubType];
}

id SIMLModelAddDeviceVersion(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  if ([v4 isEqualToString:@"m9"])
  {
    size_t v5 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136381443;
      uint64_t v10 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIANETools.m";
      __int16 v11 = 1025;
      int v12 = 28;
      __int16 v13 = 2113;
      id v14 = v3;
      __int16 v15 = 2113;
      id v16 = v4;
      _os_log_impl(&dword_21B697000, v5, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Trying to load model %{private}@. in device: %{private}@ ***", (uint8_t *)&v9, 0x26u);
    }

    id v6 = v3;
  }
  else
  {
    int v7 = [@"_" stringByAppendingString:v4];
    id v6 = [v3 stringByAppendingString:v7];
  }
  return v6;
}

id SIMLModelPath_v2(void *a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  size_t v5 = [MEMORY[0x263F28048] aneSubType];
  if ([MEMORY[0x263F28048] hasANE])
  {
    id v6 = SIMLModelAddDeviceVersion(v4, v5);
    id v7 = [v3 pathForResource:v6 ofType:@"bundle" inDirectory:v5];
    __int16 v8 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v11 = 136381443;
      int v12 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIANETools.m";
      __int16 v13 = 1025;
      int v14 = 38;
      __int16 v15 = 2113;
      id v16 = v4;
      __int16 v17 = 2113;
      id v18 = v7;
      _os_log_impl(&dword_21B697000, v8, OS_LOG_TYPE_INFO, " %{private}s:%{private}d *** Loading the model %{private}@. Path: %{private}@ ***", (uint8_t *)&v11, 0x26u);
    }
  }
  else
  {
    int v9 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136381187;
      int v12 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIANETools.m";
      __int16 v13 = 1025;
      int v14 = 41;
      __int16 v15 = 2113;
      id v16 = v4;
      _os_log_impl(&dword_21B697000, v9, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Trying to load model %{private}@ on device with no ANE ***", (uint8_t *)&v11, 0x1Cu);
    }

    id v7 = v4;
  }

  return v7;
}

__CFString *SIGetDeviceType()
{
  if ([MEMORY[0x263F28048] hasANE])
  {
    uint64_t v0 = [MEMORY[0x263F28048] aneSubType];
  }
  else
  {
    uint64_t v0 = &stru_26CB7E380;
  }
  return v0;
}

id SIMLModelPath(void *a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [a1 pathForResource:v3 ofType:@"mlmodelc"];
  size_t v5 = __SceneIntelligenceLogSharedInstance();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 136381443;
    __int16 v8 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIANETools.m";
    __int16 v9 = 1025;
    int v10 = 55;
    __int16 v11 = 2113;
    id v12 = v3;
    __int16 v13 = 2113;
    int v14 = v4;
    _os_log_impl(&dword_21B697000, v5, OS_LOG_TYPE_INFO, " %{private}s:%{private}d *** Loading the model %{private}@. Path: %{private}@ ***", (uint8_t *)&v7, 0x26u);
  }

  return v4;
}

uint64_t SISupportANE()
{
  if (SISupportANE_onceToken != -1) {
    dispatch_once(&SISupportANE_onceToken, &__block_literal_global_3);
  }
  return s_deviceSupportsANE;
}

uint64_t __SISupportANE_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  s_deviceSupportsANE = result;
  return result;
}

BOOL SIPerformPreCompilation(void *a1, void *a2)
{
  v25[9] = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263F28048];
  id v4 = a2;
  id v5 = a1;
  id v6 = [v3 aneSubType];
  id v7 = objc_alloc_init(MEMORY[0x263F08B50]);
  [v7 setLaunchPath:@"/usr/local/bin/espressoc"];
  v25[0] = @"--e5-require-ane-resident=strict";
  v25[1] = @"-i";
  v25[2] = v5;
  v25[3] = @"-p";
  v25[4] = v6;
  v25[5] = @"-o";
  v25[6] = v4;
  v25[7] = @"--mil-entry-points=*";
  v25[8] = @"> /dev/null 2>&1";
  __int16 v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:9];

  [v7 setArguments:v8];
  __int16 v9 = __SceneIntelligenceLogSharedInstance();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = [v7 launchPath];
    __int16 v11 = [v7 arguments];
    int v17 = 136381443;
    id v18 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIANETools.m";
    __int16 v19 = 1025;
    int v20 = 87;
    __int16 v21 = 2113;
    uint64_t v22 = v10;
    __int16 v23 = 2113;
    uint64_t v24 = v11;
    _os_log_impl(&dword_21B697000, v9, OS_LOG_TYPE_INFO, " %{private}s:%{private}d *** running %{private}@ with arguments: %{private}@ ***", (uint8_t *)&v17, 0x26u);
  }
  [v7 launch];
  [v7 waitUntilExit];
  int v12 = [v7 terminationStatus];
  if (v12)
  {
    __int16 v13 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = [v7 launchPath];
      uint64_t v15 = [v7 arguments];
      int v17 = 136381443;
      id v18 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIANETools.m";
      __int16 v19 = 1025;
      int v20 = 91;
      __int16 v21 = 2113;
      uint64_t v22 = v14;
      __int16 v23 = 2113;
      uint64_t v24 = v15;
      _os_log_impl(&dword_21B697000, v13, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** failed to run %{private}@ with arguments: %{private}@ ***", (uint8_t *)&v17, 0x26u);
    }
  }

  return v12 == 0;
}

uint64_t SICompileE5MLBundle()
{
  return 0;
}

void sub_21B6C4DF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6C4EF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6C54D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_21B6C5674(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_21B6C56F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)SIMovReader;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_21B6C57AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B6C5860(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_21B6C5C20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *__p,uint64_t a28,int a29,__int16 a30,char a31,char a32)
{
  _Unwind_Resume(a1);
}

uint64_t SICopyRawDataToOneComponentIOSurface(__IOSurface *a1, char *a2, size_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned __int8 *a7)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  switch(a6)
  {
    case 4:
      return SICopyDataToOneComponentIOSurface<float>(a1, a2, a3, a4, a5, (uint64_t)a7);
    case 2:
      return SICopyDataToOneComponentIOSurface<half>(a1, a2, a3, a4, a5, (uint64_t)a7);
    case 1:
      return SICopyDataToOneComponentIOSurface<unsigned char>(a1, a2, a3, a4, a5, (uint64_t)a7);
    default:
      __int16 v9 = __SceneIntelligenceLogSharedInstance();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v10 = 136381187;
        __int16 v11 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBufferCopyTemplate.mm";
        __int16 v12 = 1025;
        int v13 = 34;
        __int16 v14 = 2048;
        uint64_t v15 = a6;
        _os_log_impl(&dword_21B697000, v9, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Unsupported bytePerElement in src: %zu ***", (uint8_t *)&v10, 0x1Cu);
      }

      return 4;
  }
}

uint64_t SICopyDataToOneComponentIOSurface<unsigned char>(__IOSurface *a1, char *a2, size_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  OSType PixelFormat = IOSurfaceGetPixelFormat(a1);
  if (PixelFormat == 1278226488)
  {
    return SICopyRawDataToOneComponentIOSurfaceWithPrimitiveType<unsigned char,unsigned char>(a1, a2, a3, a4, a5, a6);
  }
  else
  {
    int v13 = PixelFormat;
    if (PixelFormat == 1278226536)
    {
      return SICopyRawDataToOneComponentIOSurfaceWithPrimitiveType<half,unsigned char>(a1, a2, a3, a4, a5, a6);
    }
    else if (PixelFormat == 1278226534)
    {
      return SICopyRawDataToOneComponentIOSurfaceWithPrimitiveType<float,unsigned char>(a1, a2, a3, a4, a5, a6);
    }
    else
    {
      uint64_t v15 = __SceneIntelligenceLogSharedInstance();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = SIPixelFormatToStr(v13);
        int v17 = 136381187;
        id v18 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBufferCopyTemplate.h";
        __int16 v19 = 1025;
        int v20 = 97;
        __int16 v21 = 2113;
        uint64_t v22 = v16;
        _os_log_impl(&dword_21B697000, v15, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Unsupported surface format: %{private}@ ***", (uint8_t *)&v17, 0x1Cu);
      }
      return 4;
    }
  }
}

void sub_21B6C6158(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t SICopyDataToOneComponentIOSurface<float>(__IOSurface *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  OSType PixelFormat = IOSurfaceGetPixelFormat(a1);
  if (PixelFormat == 1278226488)
  {
    return SICopyRawDataToOneComponentIOSurfaceWithPrimitiveType<unsigned char,float>(a1, a2, a3, a4, a5, a6);
  }
  else
  {
    int v13 = PixelFormat;
    if (PixelFormat == 1278226536)
    {
      return SICopyRawDataToOneComponentIOSurfaceWithPrimitiveType<half,float>(a1, a2, a3, a4, a5, a6);
    }
    else if (PixelFormat == 1278226534)
    {
      return SICopyRawDataToOneComponentIOSurfaceWithPrimitiveType<float,float>(a1, a2, a3, a4, a5, a6);
    }
    else
    {
      uint64_t v15 = __SceneIntelligenceLogSharedInstance();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = SIPixelFormatToStr(v13);
        int v17 = 136381187;
        id v18 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBufferCopyTemplate.h";
        __int16 v19 = 1025;
        int v20 = 97;
        __int16 v21 = 2113;
        uint64_t v22 = v16;
        _os_log_impl(&dword_21B697000, v15, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Unsupported surface format: %{private}@ ***", (uint8_t *)&v17, 0x1Cu);
      }
      return 4;
    }
  }
}

void sub_21B6C63C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t SICopyDataToOneComponentIOSurface<half>(__IOSurface *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  OSType PixelFormat = IOSurfaceGetPixelFormat(a1);
  if (PixelFormat == 1278226488)
  {
    return SICopyRawDataToOneComponentIOSurfaceWithPrimitiveType<unsigned char,half>(a1, a2, a3, a4, a5, a6);
  }
  else
  {
    int v13 = PixelFormat;
    if (PixelFormat == 1278226536)
    {
      return SICopyRawDataToOneComponentIOSurfaceWithPrimitiveType<half,half>(a1, a2, a3, a4, a5, a6);
    }
    else if (PixelFormat == 1278226534)
    {
      return SICopyRawDataToOneComponentIOSurfaceWithPrimitiveType<float,half>(a1, a2, a3, a4, a5, a6);
    }
    else
    {
      uint64_t v15 = __SceneIntelligenceLogSharedInstance();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = SIPixelFormatToStr(v13);
        int v17 = 136381187;
        id v18 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBufferCopyTemplate.h";
        __int16 v19 = 1025;
        int v20 = 97;
        __int16 v21 = 2113;
        uint64_t v22 = v16;
        _os_log_impl(&dword_21B697000, v15, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Unsupported surface format: %{private}@ ***", (uint8_t *)&v17, 0x1Cu);
      }
      return 4;
    }
  }
}

void sub_21B6C6638(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t SICopyRawDataToOneComponentIOSurfaceWithPrimitiveType<float,unsigned char>(__IOSurface *a1, char *a2, size_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  size_t Width = IOSurfaceGetWidth(a1);
  size_t Height = IOSurfaceGetHeight(a1);
  size_t BytesPerRow = IOSurfaceGetBytesPerRow(a1);
  size_t BytesPerElement = IOSurfaceGetBytesPerElement(a1);
  if (Width == a3 && Height == a4)
  {
    size_t v16 = BytesPerElement;
    IOSurfaceLock(a1, 0, 0);
    BaseAddress = (char *)IOSurfaceGetBaseAddress(a1);
    __int16 v19 = BaseAddress;
    if (BytesPerRow == a5 && !a6 && v16 == 1)
    {
      memcpy(BaseAddress, a2, a5 * a4);
    }
    else if (a6 || v16 != 1)
    {
      if (a4)
      {
        uint64_t v22 = 0;
        do
        {
          if (a3)
          {
            uint64_t v23 = &a2[v22 * a5];
            size_t v24 = a3;
            int v25 = (float *)&BaseAddress[v22 * BytesPerRow];
            do
            {
              size_t v26 = v23;
              if (a6) {
                size_t v26 = (char *)(a6 + *v23);
              }
              LOBYTE(v18) = *v26;
              float v18 = (float)LODWORD(v18);
              *v25++ = v18;
              ++v23;
              --v24;
            }
            while (v24);
          }
          ++v22;
        }
        while (v22 != a4);
      }
    }
    else
    {
      for (; a4; --a4)
      {
        memcpy(v19, a2, a3);
        a2 += a5;
        v19 += BytesPerRow;
      }
    }
    IOSurfaceUnlock(a1, 0, 0);
    return 0;
  }
  else
  {
    int v20 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      int v27 = 136381955;
      uint64_t v28 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBufferCopyTemplate.h";
      __int16 v29 = 1025;
      int v30 = 34;
      __int16 v31 = 2048;
      size_t v32 = a3;
      __int16 v33 = 2048;
      uint64_t v34 = a4;
      __int16 v35 = 2048;
      size_t v36 = Width;
      __int16 v37 = 2048;
      size_t v38 = Height;
      _os_log_impl(&dword_21B697000, v20, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** CopyElement failed: size is not identical: (%zu, %zu) <-> (%zu, %zu) ***", (uint8_t *)&v27, 0x3Au);
    }

    return 4;
  }
}

uint64_t SICopyRawDataToOneComponentIOSurfaceWithPrimitiveType<unsigned char,unsigned char>(__IOSurface *a1, char *a2, size_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  size_t Width = IOSurfaceGetWidth(a1);
  size_t Height = IOSurfaceGetHeight(a1);
  size_t BytesPerRow = IOSurfaceGetBytesPerRow(a1);
  size_t BytesPerElement = IOSurfaceGetBytesPerElement(a1);
  if (Width == a3 && Height == a4)
  {
    size_t v16 = BytesPerElement;
    IOSurfaceLock(a1, 0, 0);
    BaseAddress = (char *)IOSurfaceGetBaseAddress(a1);
    float v18 = BaseAddress;
    if (BytesPerRow == a5 && !a6 && v16 == 1)
    {
      memcpy(BaseAddress, a2, a5 * a4);
    }
    else if (a6 || v16 != 1)
    {
      if (a4)
      {
        uint64_t v21 = 0;
        do
        {
          if (a3)
          {
            uint64_t v22 = &a2[v21 * a5];
            size_t v23 = a3;
            size_t v24 = &BaseAddress[v21 * BytesPerRow];
            do
            {
              int v25 = v22;
              if (a6) {
                int v25 = (char *)(a6 + *v22);
              }
              *v24++ = *v25;
              ++v22;
              --v23;
            }
            while (v23);
          }
          ++v21;
        }
        while (v21 != a4);
      }
    }
    else
    {
      for (; a4; --a4)
      {
        memcpy(v18, a2, a3);
        a2 += a5;
        v18 += BytesPerRow;
      }
    }
    IOSurfaceUnlock(a1, 0, 0);
    return 0;
  }
  else
  {
    __int16 v19 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      int v26 = 136381955;
      int v27 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBufferCopyTemplate.h";
      __int16 v28 = 1025;
      int v29 = 34;
      __int16 v30 = 2048;
      size_t v31 = a3;
      __int16 v32 = 2048;
      uint64_t v33 = a4;
      __int16 v34 = 2048;
      size_t v35 = Width;
      __int16 v36 = 2048;
      size_t v37 = Height;
      _os_log_impl(&dword_21B697000, v19, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** CopyElement failed: size is not identical: (%zu, %zu) <-> (%zu, %zu) ***", (uint8_t *)&v26, 0x3Au);
    }

    return 4;
  }
}

uint64_t SICopyRawDataToOneComponentIOSurfaceWithPrimitiveType<half,unsigned char>(__IOSurface *a1, char *a2, size_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  size_t Width = IOSurfaceGetWidth(a1);
  size_t Height = IOSurfaceGetHeight(a1);
  size_t BytesPerRow = IOSurfaceGetBytesPerRow(a1);
  size_t BytesPerElement = IOSurfaceGetBytesPerElement(a1);
  if (Width == a3 && Height == a4)
  {
    size_t v16 = BytesPerElement;
    IOSurfaceLock(a1, 0, 0);
    BaseAddress = (char *)IOSurfaceGetBaseAddress(a1);
    __int16 v19 = BaseAddress;
    if (BytesPerRow == a5 && !a6 && v16 == 1)
    {
      memcpy(BaseAddress, a2, a5 * a4);
    }
    else if (a6 || v16 != 1)
    {
      if (a4)
      {
        uint64_t v22 = 0;
        do
        {
          if (a3)
          {
            size_t v23 = &a2[v22 * a5];
            size_t v24 = a3;
            int v25 = (short float *)&BaseAddress[v22 * BytesPerRow];
            do
            {
              int v26 = v23;
              if (a6) {
                int v26 = (char *)(a6 + *v23);
              }
              LOBYTE(v18) = *v26;
              short float v18 = (short float)LOWORD(v18);
              *v25++ = v18;
              ++v23;
              --v24;
            }
            while (v24);
          }
          ++v22;
        }
        while (v22 != a4);
      }
    }
    else
    {
      for (; a4; --a4)
      {
        memcpy(v19, a2, a3);
        a2 += a5;
        v19 += BytesPerRow;
      }
    }
    IOSurfaceUnlock(a1, 0, 0);
    return 0;
  }
  else
  {
    int v20 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      int v27 = 136381955;
      __int16 v28 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBufferCopyTemplate.h";
      __int16 v29 = 1025;
      int v30 = 34;
      __int16 v31 = 2048;
      size_t v32 = a3;
      __int16 v33 = 2048;
      uint64_t v34 = a4;
      __int16 v35 = 2048;
      size_t v36 = Width;
      __int16 v37 = 2048;
      size_t v38 = Height;
      _os_log_impl(&dword_21B697000, v20, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** CopyElement failed: size is not identical: (%zu, %zu) <-> (%zu, %zu) ***", (uint8_t *)&v27, 0x3Au);
    }

    return 4;
  }
}

uint64_t SICopyRawDataToOneComponentIOSurfaceWithPrimitiveType<float,float>(__IOSurface *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  size_t Width = IOSurfaceGetWidth(a1);
  size_t Height = IOSurfaceGetHeight(a1);
  size_t BytesPerRow = IOSurfaceGetBytesPerRow(a1);
  size_t BytesPerElement = IOSurfaceGetBytesPerElement(a1);
  if (Width == a3 && Height == a4)
  {
    size_t v16 = BytesPerElement;
    IOSurfaceLock(a1, 0, 0);
    BaseAddress = (char *)IOSurfaceGetBaseAddress(a1);
    short float v18 = BaseAddress;
    if (BytesPerRow == a5 && !a6 && v16 == 4)
    {
      memcpy(BaseAddress, a2, a5 * a4);
    }
    else if (a6 || v16 != 4)
    {
      if (a4)
      {
        uint64_t v22 = 0;
        do
        {
          if (a3)
          {
            size_t v23 = (float *)&a2[v22 * a5];
            uint64_t v24 = a3;
            int v25 = (float *)&BaseAddress[v22 * BytesPerRow];
            do
            {
              float v26 = *v23;
              if (a6)
              {
                LOBYTE(v26) = *(unsigned char *)(a6 + (int)v26);
                float v26 = (float)LODWORD(v26);
              }
              *v25++ = v26;
              ++v23;
              --v24;
            }
            while (v24);
          }
          ++v22;
        }
        while (v22 != a4);
      }
    }
    else if (a4)
    {
      size_t v21 = 4 * a3;
      do
      {
        memcpy(v18, a2, v21);
        a2 += a5;
        v18 += BytesPerRow;
        --a4;
      }
      while (a4);
    }
    IOSurfaceUnlock(a1, 0, 0);
    return 0;
  }
  else
  {
    __int16 v19 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      int v27 = 136381955;
      __int16 v28 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBufferCopyTemplate.h";
      __int16 v29 = 1025;
      int v30 = 34;
      __int16 v31 = 2048;
      uint64_t v32 = a3;
      __int16 v33 = 2048;
      uint64_t v34 = a4;
      __int16 v35 = 2048;
      size_t v36 = Width;
      __int16 v37 = 2048;
      size_t v38 = Height;
      _os_log_impl(&dword_21B697000, v19, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** CopyElement failed: size is not identical: (%zu, %zu) <-> (%zu, %zu) ***", (uint8_t *)&v27, 0x3Au);
    }

    return 4;
  }
}

uint64_t SICopyRawDataToOneComponentIOSurfaceWithPrimitiveType<unsigned char,float>(__IOSurface *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  size_t Width = IOSurfaceGetWidth(a1);
  size_t Height = IOSurfaceGetHeight(a1);
  size_t BytesPerRow = IOSurfaceGetBytesPerRow(a1);
  size_t BytesPerElement = IOSurfaceGetBytesPerElement(a1);
  if (Width == a3 && Height == a4)
  {
    size_t v16 = BytesPerElement;
    IOSurfaceLock(a1, 0, 0);
    BaseAddress = (char *)IOSurfaceGetBaseAddress(a1);
    short float v18 = BaseAddress;
    if (BytesPerRow == a5 && !a6 && v16 == 4)
    {
      memcpy(BaseAddress, a2, a5 * a4);
    }
    else if (a6 || v16 != 4)
    {
      if (a4)
      {
        uint64_t v22 = 0;
        do
        {
          if (a3)
          {
            size_t v23 = (float *)&a2[v22 * a5];
            uint64_t v24 = a3;
            int v25 = &BaseAddress[v22 * BytesPerRow];
            do
            {
              int v26 = (int)*v23;
              if (a6) {
                LOBYTE(v26) = *(unsigned char *)(a6 + v26);
              }
              *v25++ = v26;
              ++v23;
              --v24;
            }
            while (v24);
          }
          ++v22;
        }
        while (v22 != a4);
      }
    }
    else if (a4)
    {
      size_t v21 = 4 * a3;
      do
      {
        memcpy(v18, a2, v21);
        a2 += a5;
        v18 += BytesPerRow;
        --a4;
      }
      while (a4);
    }
    IOSurfaceUnlock(a1, 0, 0);
    return 0;
  }
  else
  {
    __int16 v19 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      int v27 = 136381955;
      __int16 v28 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBufferCopyTemplate.h";
      __int16 v29 = 1025;
      int v30 = 34;
      __int16 v31 = 2048;
      uint64_t v32 = a3;
      __int16 v33 = 2048;
      uint64_t v34 = a4;
      __int16 v35 = 2048;
      size_t v36 = Width;
      __int16 v37 = 2048;
      size_t v38 = Height;
      _os_log_impl(&dword_21B697000, v19, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** CopyElement failed: size is not identical: (%zu, %zu) <-> (%zu, %zu) ***", (uint8_t *)&v27, 0x3Au);
    }

    return 4;
  }
}

uint64_t SICopyRawDataToOneComponentIOSurfaceWithPrimitiveType<half,float>(__IOSurface *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  size_t Width = IOSurfaceGetWidth(a1);
  size_t Height = IOSurfaceGetHeight(a1);
  size_t BytesPerRow = IOSurfaceGetBytesPerRow(a1);
  size_t BytesPerElement = IOSurfaceGetBytesPerElement(a1);
  if (Width == a3 && Height == a4)
  {
    size_t v16 = BytesPerElement;
    IOSurfaceLock(a1, 0, 0);
    BaseAddress = (char *)IOSurfaceGetBaseAddress(a1);
    short float v18 = BaseAddress;
    if (BytesPerRow == a5 && !a6 && v16 == 4)
    {
      memcpy(BaseAddress, a2, a5 * a4);
    }
    else if (a6 || v16 != 4)
    {
      if (a4)
      {
        uint64_t v22 = 0;
        do
        {
          if (a3)
          {
            size_t v23 = (float *)&a2[v22 * a5];
            uint64_t v24 = a3;
            int v25 = &BaseAddress[v22 * BytesPerRow];
            do
            {
              _S0 = *v23;
              if (a6)
              {
                LOBYTE(_S0) = *(unsigned char *)(a6 + (int)_S0);
                _S0 = (float)LODWORD(_S0);
              }
              __asm { FCVT            H0, S0 }
              *(_WORD *)int v25 = _H0;
              v25 += 2;
              ++v23;
              --v24;
            }
            while (v24);
          }
          ++v22;
        }
        while (v22 != a4);
      }
    }
    else if (a4)
    {
      size_t v21 = 4 * a3;
      do
      {
        memcpy(v18, a2, v21);
        a2 += a5;
        v18 += BytesPerRow;
        --a4;
      }
      while (a4);
    }
    IOSurfaceUnlock(a1, 0, 0);
    return 0;
  }
  else
  {
    __int16 v19 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      int v32 = 136381955;
      __int16 v33 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBufferCopyTemplate.h";
      __int16 v34 = 1025;
      int v35 = 34;
      __int16 v36 = 2048;
      uint64_t v37 = a3;
      __int16 v38 = 2048;
      uint64_t v39 = a4;
      __int16 v40 = 2048;
      size_t v41 = Width;
      __int16 v42 = 2048;
      size_t v43 = Height;
      _os_log_impl(&dword_21B697000, v19, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** CopyElement failed: size is not identical: (%zu, %zu) <-> (%zu, %zu) ***", (uint8_t *)&v32, 0x3Au);
    }

    return 4;
  }
}

uint64_t SICopyRawDataToOneComponentIOSurfaceWithPrimitiveType<float,half>(__IOSurface *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  size_t Width = IOSurfaceGetWidth(a1);
  size_t Height = IOSurfaceGetHeight(a1);
  size_t BytesPerRow = IOSurfaceGetBytesPerRow(a1);
  size_t BytesPerElement = IOSurfaceGetBytesPerElement(a1);
  if (Width == a3 && Height == a4)
  {
    size_t v16 = BytesPerElement;
    IOSurfaceLock(a1, 0, 0);
    BaseAddress = (char *)IOSurfaceGetBaseAddress(a1);
    __int16 v19 = BaseAddress;
    if (BytesPerRow == a5 && !a6 && v16 == 2)
    {
      memcpy(BaseAddress, a2, a5 * a4);
    }
    else if (a6 || v16 != 2)
    {
      if (a4)
      {
        uint64_t v23 = 0;
        do
        {
          if (a3)
          {
            uint64_t v24 = &a2[v23 * a5];
            uint64_t v25 = a3;
            int v26 = (float *)&BaseAddress[v23 * BytesPerRow];
            do
            {
              LOWORD(_S0) = *(_WORD *)v24;
              if (a6)
              {
                LOBYTE(_S0) = *(unsigned char *)(a6 + (int)*(short float *)&_S0);
                _S0 = (float)LODWORD(_S0);
              }
              else
              {
                __asm { FCVT            S0, H0 }
              }
              *v26++ = _S0;
              v24 += 2;
              --v25;
            }
            while (v25);
          }
          ++v23;
        }
        while (v23 != a4);
      }
    }
    else if (a4)
    {
      size_t v22 = 2 * a3;
      do
      {
        memcpy(v19, a2, v22);
        a2 += a5;
        v19 += BytesPerRow;
        --a4;
      }
      while (a4);
    }
    IOSurfaceUnlock(a1, 0, 0);
    return 0;
  }
  else
  {
    int v20 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      int v31 = 136381955;
      int v32 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBufferCopyTemplate.h";
      __int16 v33 = 1025;
      int v34 = 34;
      __int16 v35 = 2048;
      uint64_t v36 = a3;
      __int16 v37 = 2048;
      uint64_t v38 = a4;
      __int16 v39 = 2048;
      size_t v40 = Width;
      __int16 v41 = 2048;
      size_t v42 = Height;
      _os_log_impl(&dword_21B697000, v20, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** CopyElement failed: size is not identical: (%zu, %zu) <-> (%zu, %zu) ***", (uint8_t *)&v31, 0x3Au);
    }

    return 4;
  }
}

uint64_t SICopyRawDataToOneComponentIOSurfaceWithPrimitiveType<unsigned char,half>(__IOSurface *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  size_t Width = IOSurfaceGetWidth(a1);
  size_t Height = IOSurfaceGetHeight(a1);
  size_t BytesPerRow = IOSurfaceGetBytesPerRow(a1);
  size_t BytesPerElement = IOSurfaceGetBytesPerElement(a1);
  if (Width == a3 && Height == a4)
  {
    size_t v16 = BytesPerElement;
    IOSurfaceLock(a1, 0, 0);
    BaseAddress = (char *)IOSurfaceGetBaseAddress(a1);
    short float v18 = BaseAddress;
    if (BytesPerRow == a5 && !a6 && v16 == 2)
    {
      memcpy(BaseAddress, a2, a5 * a4);
    }
    else if (a6 || v16 != 2)
    {
      if (a4)
      {
        uint64_t v22 = 0;
        do
        {
          if (a3)
          {
            uint64_t v23 = (short float *)&a2[v22 * a5];
            uint64_t v24 = a3;
            uint64_t v25 = &BaseAddress[v22 * BytesPerRow];
            do
            {
              int v26 = (int)*v23;
              if (a6) {
                LOBYTE(v26) = *(unsigned char *)(a6 + v26);
              }
              *v25++ = v26;
              ++v23;
              --v24;
            }
            while (v24);
          }
          ++v22;
        }
        while (v22 != a4);
      }
    }
    else if (a4)
    {
      size_t v21 = 2 * a3;
      do
      {
        memcpy(v18, a2, v21);
        a2 += a5;
        v18 += BytesPerRow;
        --a4;
      }
      while (a4);
    }
    IOSurfaceUnlock(a1, 0, 0);
    return 0;
  }
  else
  {
    __int16 v19 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      int v27 = 136381955;
      __int16 v28 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBufferCopyTemplate.h";
      __int16 v29 = 1025;
      int v30 = 34;
      __int16 v31 = 2048;
      uint64_t v32 = a3;
      __int16 v33 = 2048;
      uint64_t v34 = a4;
      __int16 v35 = 2048;
      size_t v36 = Width;
      __int16 v37 = 2048;
      size_t v38 = Height;
      _os_log_impl(&dword_21B697000, v19, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** CopyElement failed: size is not identical: (%zu, %zu) <-> (%zu, %zu) ***", (uint8_t *)&v27, 0x3Au);
    }

    return 4;
  }
}

uint64_t SICopyRawDataToOneComponentIOSurfaceWithPrimitiveType<half,half>(__IOSurface *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  size_t Width = IOSurfaceGetWidth(a1);
  size_t Height = IOSurfaceGetHeight(a1);
  size_t BytesPerRow = IOSurfaceGetBytesPerRow(a1);
  size_t BytesPerElement = IOSurfaceGetBytesPerElement(a1);
  if (Width == a3 && Height == a4)
  {
    size_t v16 = BytesPerElement;
    IOSurfaceLock(a1, 0, 0);
    BaseAddress = (char *)IOSurfaceGetBaseAddress(a1);
    short float v18 = BaseAddress;
    if (BytesPerRow == a5 && !a6 && v16 == 2)
    {
      memcpy(BaseAddress, a2, a5 * a4);
    }
    else if (a6 || v16 != 2)
    {
      if (a4)
      {
        uint64_t v22 = 0;
        do
        {
          if (a3)
          {
            uint64_t v23 = (short float *)&a2[v22 * a5];
            uint64_t v24 = a3;
            uint64_t v25 = (short float *)&BaseAddress[v22 * BytesPerRow];
            do
            {
              short float v26 = *v23;
              if (a6)
              {
                LOBYTE(v26) = *(unsigned char *)(a6 + (int)v26);
                short float v26 = (short float)LOWORD(v26);
              }
              *v25++ = v26;
              ++v23;
              --v24;
            }
            while (v24);
          }
          ++v22;
        }
        while (v22 != a4);
      }
    }
    else if (a4)
    {
      size_t v21 = 2 * a3;
      do
      {
        memcpy(v18, a2, v21);
        a2 += a5;
        v18 += BytesPerRow;
        --a4;
      }
      while (a4);
    }
    IOSurfaceUnlock(a1, 0, 0);
    return 0;
  }
  else
  {
    __int16 v19 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      int v27 = 136381955;
      __int16 v28 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBufferCopyTemplate.h";
      __int16 v29 = 1025;
      int v30 = 34;
      __int16 v31 = 2048;
      uint64_t v32 = a3;
      __int16 v33 = 2048;
      uint64_t v34 = a4;
      __int16 v35 = 2048;
      size_t v36 = Width;
      __int16 v37 = 2048;
      size_t v38 = Height;
      _os_log_impl(&dword_21B697000, v19, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** CopyElement failed: size is not identical: (%zu, %zu) <-> (%zu, %zu) ***", (uint8_t *)&v27, 0x3Au);
    }

    return 4;
  }
}

void SICreateIOSurfaceBackedPackedFloat32ImageFromBuffer_cold_1()
{
  __assert_rtn("SICreateIOSurfaceBackedPackedFloat32ImageFromBuffer", "SIPixelBuffer.m", 310, "pixelFormat == kCVPixelFormatType_OneComponent32Float || pixelFormat == kCVPixelFormatType_DepthFloat32 || pixelFormat == kCVPixelFormatType_DisparityFloat32 || pixelFormat == kCVPixelFormatType_TwoComponent32Float || pixelFormat == kCVPixelFormatType_128RGBAFloat");
}

void SICreateIOSurfaceBackedPackedFloat16ImageFromBuffer_cold_1()
{
  __assert_rtn("SICreateIOSurfaceBackedPackedFloat16ImageFromBuffer", "SIPixelBuffer.m", 353, "pixelFormat == kCVPixelFormatType_OneComponent16Half || pixelFormat == kCVPixelFormatType_DepthFloat16 || pixelFormat == kCVPixelFormatType_DisparityFloat16 || pixelFormat == kCVPixelFormatType_TwoComponent16Half || pixelFormat == kCVPixelFormatType_64RGBAHalf");
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x270EFB790]();
  return result;
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C68]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5CA8](name);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x270EF4F38](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x270EF4F48](idst);
}

void CGImageRelease(CGImageRef image)
{
}

void CVBufferPropagateAttachments(CVBufferRef sourceBuffer, CVBufferRef destinationBuffer)
{
}

void CVBufferSetAttachment(CVBufferRef buffer, CFStringRef key, CFTypeRef value, CVAttachmentMode attachmentMode)
{
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

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1E8](pixelBuffer);
}

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA1F8](pixelBuffer, planeIndex);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x270EEA200](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA218](pixelBuffer);
}

size_t CVPixelBufferGetPlaneCount(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA220](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA240](pixelBuffer);
}

size_t CVPixelBufferGetWidthOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA250](pixelBuffer, planeIndex);
}

Boolean CVPixelBufferIsPlanar(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA258](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x270EEA260](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferPoolCreate(CFAllocatorRef allocator, CFDictionaryRef poolAttributes, CFDictionaryRef pixelBufferAttributes, CVPixelBufferPoolRef *poolOut)
{
  return MEMORY[0x270EEA278](allocator, poolAttributes, pixelBufferAttributes, poolOut);
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

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x270EEA320](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x270EEA330](pixelBuffer, unlockFlags);
}

CFDictionaryRef IOSurfaceCopyAllValues(IOSurfaceRef buffer)
{
  return (CFDictionaryRef)MEMORY[0x270EF4C18](buffer);
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x270EF4C28](properties);
}

size_t IOSurfaceGetAllocSize(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4C50](buffer);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x270EF4C58](buffer);
}

size_t IOSurfaceGetBytesPerElement(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4CA0](buffer);
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

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x270EF2BE8](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

OSStatus VTPixelRotationSessionCreate(CFAllocatorRef allocator, VTPixelRotationSessionRef *pixelRotationSessionOut)
{
  return MEMORY[0x270F067C0](allocator, pixelRotationSessionOut);
}

void VTPixelRotationSessionInvalidate(VTPixelRotationSessionRef session)
{
}

OSStatus VTPixelRotationSessionRotateImage(VTPixelRotationSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x270F067D0](session, sourceBuffer, destinationBuffer);
}

uint64_t VTPixelRotationSessionRotateSubImage()
{
  return MEMORY[0x270F067D8]();
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

OSStatus VTSessionSetProperty(VTSessionRef session, CFStringRef propertyKey, CFTypeRef propertyValue)
{
  return MEMORY[0x270F06820](session, propertyKey, propertyValue);
}

uint64_t VZClientOptionsCreate()
{
  return MEMORY[0x270F84198]();
}

uint64_t VZClientOptionsSetTcpIpAddress()
{
  return MEMORY[0x270F841A8]();
}

uint64_t VZDataCreateBlobWithCFData()
{
  return MEMORY[0x270F841B8]();
}

uint64_t VZDataCreateDictionaryWithCFDictionary()
{
  return MEMORY[0x270F841C0]();
}

uint64_t VZDataCreateImageWithCVPixelBuffer()
{
  return MEMORY[0x270F841C8]();
}

uint64_t VZDataCreateImageWithIOSurface()
{
  return MEMORY[0x270F841D8]();
}

uint64_t VZDataCreateNumberWithCFNumber()
{
  return MEMORY[0x270F841E0]();
}

uint64_t VZDataCreateNumbersWithCFData()
{
  return MEMORY[0x270F841E8]();
}

uint64_t VZDataGetDictionaryDataTypeID()
{
  return MEMORY[0x270F841F0]();
}

uint64_t VZDataGetMeshDataTypeID()
{
  return MEMORY[0x270F84200]();
}

uint64_t VZDataInfoCreate()
{
  return MEMORY[0x270F84218]();
}

uint64_t VZDataInfoSetName()
{
  return MEMORY[0x270F84220]();
}

uint64_t VZDataInfoSetTimestampMachContinuousNanoseconds()
{
  return MEMORY[0x270F84238]();
}

uint64_t VZDestinationCreateWithClient()
{
  return MEMORY[0x270F84248]();
}

uint64_t VZDestinationCreateWithFileExporter()
{
  return MEMORY[0x270F84250]();
}

uint64_t VZFileExportOptionsAddFilteredStoragePreference()
{
  return MEMORY[0x270F84268]();
}

uint64_t VZFileExportOptionsCreate()
{
  return MEMORY[0x270F84270]();
}

uint64_t VZFileExportOptionsSetAsyncQueueMaxElementCount()
{
  return MEMORY[0x270F84280]();
}

uint64_t VZLogMessageFilterCreate()
{
  return MEMORY[0x270F84298]();
}

uint64_t VZLogMessageFilterRequireDataTypeIDExact()
{
  return MEMORY[0x270F842A0]();
}

uint64_t VZLoggerAddDestination()
{
  return MEMORY[0x270F842B8]();
}

uint64_t VZLoggerCreate()
{
  return MEMORY[0x270F842C8]();
}

uint64_t VZLoggerEnable()
{
  return MEMORY[0x270F842D8]();
}

uint64_t VZLoggerEnabled()
{
  return MEMORY[0x270F842E8]();
}

uint64_t VZLoggerGetSubLoggerMutable()
{
  return MEMORY[0x270F842F0]();
}

uint64_t VZLoggerLogData()
{
  return MEMORY[0x270F842F8]();
}

uint64_t VZLoggerRemoveDestination()
{
  return MEMORY[0x270F84310]();
}

uint64_t VZRelease()
{
  return MEMORY[0x270F84320]();
}

uint64_t VZRetain()
{
  return MEMORY[0x270F84330]();
}

uint64_t VZSubLoggerEnable()
{
  return MEMORY[0x270F84338]();
}

uint64_t VZSubLoggerEnabled()
{
  return MEMORY[0x270F84340]();
}

uint64_t VZSubLoggerLogData()
{
  return MEMORY[0x270F84348]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t Espresso::get_internal_context(Espresso *this, void *a2)
{
  return MEMORY[0x270F279E0](this, a2);
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

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
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

void std::terminate(void)
{
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

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

float asinf(float a1)
{
  MEMORY[0x270ED8618](a1);
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

void bzero(void *a1, size_t a2)
{
}

BOOL class_conformsToProtocol(Class cls, Protocol *protocol)
{
  return MEMORY[0x270F9A420](cls, protocol);
}

size_t compression_decode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x270F98F48](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(void *)&algorithm);
}

size_t compression_encode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x270F98F58](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(void *)&algorithm);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint64_t e5rt_buffer_object_create_from_iosurface()
{
  return MEMORY[0x270F27AE8]();
}

uint64_t e5rt_buffer_object_get_data_ptr()
{
  return MEMORY[0x270F27B00]();
}

uint64_t e5rt_buffer_object_get_iosurface()
{
  return MEMORY[0x270F27B08]();
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

uint64_t e5rt_execution_stream_prewire_in_use_allocations()
{
  return MEMORY[0x270F27C50]();
}

uint64_t e5rt_execution_stream_release()
{
  return MEMORY[0x270F27C68]();
}

uint64_t e5rt_execution_stream_reset()
{
  return MEMORY[0x270F27C70]();
}

uint64_t e5rt_get_last_error_message()
{
  return MEMORY[0x270F27C88]();
}

uint64_t e5rt_io_port_bind_buffer_object()
{
  return MEMORY[0x270F27C98]();
}

uint64_t e5rt_io_port_bind_surface_object()
{
  return MEMORY[0x270F27CB0]();
}

uint64_t e5rt_io_port_is_surface()
{
  return MEMORY[0x270F27CC0]();
}

uint64_t e5rt_io_port_is_tensor()
{
  return MEMORY[0x270F27CC8]();
}

uint64_t e5rt_io_port_release()
{
  return MEMORY[0x270F27CD8]();
}

uint64_t e5rt_io_port_retain_surface_desc()
{
  return MEMORY[0x270F27CE8]();
}

uint64_t e5rt_io_port_retain_tensor_desc()
{
  return MEMORY[0x270F27CF0]();
}

uint64_t e5rt_program_library_create()
{
  return MEMORY[0x270F27D28]();
}

uint64_t e5rt_program_library_get_function_metadata()
{
  return MEMORY[0x270F27D38]();
}

uint64_t e5rt_program_library_release()
{
  return MEMORY[0x270F27D60]();
}

uint64_t e5rt_surface_desc_get_format()
{
  return MEMORY[0x270F27D80]();
}

uint64_t e5rt_surface_desc_get_height()
{
  return MEMORY[0x270F27D90]();
}

uint64_t e5rt_surface_desc_get_width()
{
  return MEMORY[0x270F27DA0]();
}

uint64_t e5rt_surface_desc_release()
{
  return MEMORY[0x270F27DB0]();
}

uint64_t e5rt_surface_object_create_from_iosurface()
{
  return MEMORY[0x270F27DD8]();
}

uint64_t e5rt_surface_object_release()
{
  return MEMORY[0x270F27DE8]();
}

uint64_t e5rt_tensor_desc_alloc_buffer_object()
{
  return MEMORY[0x270F27DF8]();
}

uint64_t e5rt_tensor_desc_create()
{
  return MEMORY[0x270F27E00]();
}

uint64_t e5rt_tensor_desc_dtype_create()
{
  return MEMORY[0x270F27E08]();
}

uint64_t e5rt_tensor_desc_dtype_get_component_dtype()
{
  return MEMORY[0x270F27E10]();
}

uint64_t e5rt_tensor_desc_dtype_get_component_size()
{
  return MEMORY[0x270F27E20]();
}

uint64_t e5rt_tensor_desc_dtype_get_num_components()
{
  return MEMORY[0x270F27E30]();
}

uint64_t e5rt_tensor_desc_dtype_release()
{
  return MEMORY[0x270F27E38]();
}

uint64_t e5rt_tensor_desc_get_rank()
{
  return MEMORY[0x270F27E48]();
}

uint64_t e5rt_tensor_desc_get_shape()
{
  return MEMORY[0x270F27E58]();
}

uint64_t e5rt_tensor_desc_get_size()
{
  return MEMORY[0x270F27E60]();
}

uint64_t e5rt_tensor_desc_get_strides()
{
  return MEMORY[0x270F27E68]();
}

uint64_t e5rt_tensor_desc_release()
{
  return MEMORY[0x270F27E78]();
}

uint64_t e5rt_tensor_desc_retain_dtype()
{
  return MEMORY[0x270F27E88]();
}

uint64_t e5rt_tensor_utils_cast_from_fp32_to_fp16()
{
  return MEMORY[0x270F27E98]();
}

uint64_t espresso_buffer_pack_tensor_shape()
{
  return MEMORY[0x270F27EC8]();
}

uint64_t espresso_buffer_unpack_tensor_shape()
{
  return MEMORY[0x270F27ED8]();
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

uint64_t espresso_get_output_blob_name()
{
  return MEMORY[0x270F27F60]();
}

uint64_t espresso_network_bind_buffer()
{
  return MEMORY[0x270F27F78]();
}

uint64_t espresso_network_bind_cvpixelbuffer()
{
  return MEMORY[0x270F27F98]();
}

uint64_t espresso_network_get_version()
{
  return MEMORY[0x270F28020]();
}

uint64_t espresso_network_query_blob_dimensions()
{
  return MEMORY[0x270F28030]();
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

void free(void *a1)
{
}

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
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

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

int objc_getClassList(Class *buffer, int bufferCount)
{
  return MEMORY[0x270F9A660](buffer, *(void *)&bufferCount);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

void objc_terminate(void)
{
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

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

int puts(const char *a1)
{
  return MEMORY[0x270EDB098](a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

float tanf(float a1)
{
  MEMORY[0x270EDB818](a1);
  return result;
}

vImage_Error vImageConvert_Planar16FtoPlanarF(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x270EDF020](src, dest, *(void *)&flags);
}

vImage_Error vImageConvert_PlanarFtoPlanar16F(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x270EDF0E8](src, dest, *(void *)&flags);
}

vImage_Error vImageCopyBuffer(const vImage_Buffer *src, const vImage_Buffer *dest, size_t pixelSize, vImage_Flags flags)
{
  return MEMORY[0x270EDF1A0](src, dest, pixelSize, *(void *)&flags);
}

vImage_Error vImageRotate90_Planar16F(const vImage_Buffer *src, const vImage_Buffer *dest, uint8_t rotationConstant, const Pixel_16F backColor, vImage_Flags flags)
{
  return MEMORY[0x270EDF2D0](src, dest, rotationConstant, backColor, *(void *)&flags);
}

vImage_Error vImageRotate90_Planar16U(const vImage_Buffer *src, const vImage_Buffer *dest, uint8_t rotationConstant, Pixel_16U backColor, vImage_Flags flags)
{
  return MEMORY[0x270EDF2D8](src, dest, rotationConstant, backColor, *(void *)&flags);
}

vImage_Error vImageRotate90_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, uint8_t rotationConstant, Pixel_8 backColor, vImage_Flags flags)
{
  return MEMORY[0x270EDF2E8](src, dest, rotationConstant, backColor, *(void *)&flags);
}

vImage_Error vImageRotate90_PlanarF(const vImage_Buffer *src, const vImage_Buffer *dest, uint8_t rotationConstant, Pixel_F backColor, vImage_Flags flags)
{
  return MEMORY[0x270EDF300](src, dest, rotationConstant, *(void *)&flags, backColor);
}