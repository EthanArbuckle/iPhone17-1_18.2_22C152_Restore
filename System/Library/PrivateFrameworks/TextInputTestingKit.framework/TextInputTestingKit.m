void _TIBeginMockingAssetManager()
{
  TIAssetManagerMock *v0;
  uint64_t vars8;

  __isMocking = 1;
  v0 = objc_alloc_init(TIAssetManagerMock);
  if (objc_opt_respondsToSelector()) {
    [MEMORY[0x263F7EA48] performSelector:sel_setSharedAssetManager_ withObject:v0];
  }
}

void _TIEndMockingAssetManager()
{
  if (__isMocking == 1)
  {
    __isMocking = 0;
    if (objc_opt_respondsToSelector())
    {
      v0 = (void *)MEMORY[0x263F7EA48];
      [v0 performSelector:sel_setSharedAssetManager_ withObject:0];
    }
  }
}

void std::__tree<std::__value_type<std::string,long>,std::__map_value_compare<std::string,std::__value_type<std::string,long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,long>>>::destroy(char *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<std::string,long>,std::__map_value_compare<std::string,std::__value_type<std::string,long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,long>>>::destroy(*(void *)a1);
    std::__tree<std::__value_type<std::string,long>,std::__map_value_compare<std::string,std::__value_type<std::string,long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,long>>>::destroy(*((void *)a1 + 1));
    if (a1[55] < 0) {
      operator delete(*((void **)a1 + 4));
    }
    operator delete(a1);
  }
}

void sub_23EFD4720(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
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
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

uint64_t std::operator<=>[abi:nn180100]<char,std::char_traits<char>,std::allocator<char>>(void *a1, void *a2)
{
  size_t v2 = a1[1];
  if (*((char *)a1 + 23) >= 0)
  {
    size_t v3 = *((unsigned __int8 *)a1 + 23);
  }
  else
  {
    a1 = (void *)*a1;
    size_t v3 = v2;
  }
  size_t v4 = a2[1];
  if (*((char *)a2 + 23) >= 0)
  {
    size_t v5 = *((unsigned __int8 *)a2 + 23);
  }
  else
  {
    a2 = (void *)*a2;
    size_t v5 = v4;
  }
  if (v5 >= v3) {
    size_t v6 = v3;
  }
  else {
    size_t v6 = v5;
  }
  int v7 = memcmp(a1, a2, v6);
  if (v7)
  {
    if ((v7 & 0x80000000) == 0) {
      return 1;
    }
  }
  else
  {
    if (v3 == v5) {
      return 0;
    }
    if (v3 >= v5) {
      return 1;
    }
  }
  return 255;
}

void sub_23EFD4CB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, std::__split_buffer<std::string> *a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,void **a21,id a22)
{
  a21 = (void **)&a17;
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100](&a21);

  _Unwind_Resume(a1);
}

void std::__introsort<std::_ClassicAlgPolicy,BOOL({block_pointer} {__strong}&)(std::string const&,std::string const&),std::string*,false>(unint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  while (2)
  {
    uint64_t v12 = a2 - 24;
    unint64_t v79 = a2;
    v81 = (long long *)(a2 - 48);
    v77 = (long long *)(a2 - 72);
    unint64_t v13 = a1;
    while (1)
    {
      while (1)
      {
        while (1)
        {
          a1 = v13;
          uint64_t v14 = a2 - v13;
          unint64_t v15 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(a2 - v13) >> 3);
          if (v6 || !v5)
          {
            switch(v15)
            {
              case 0uLL:
              case 1uLL:
                return;
              case 2uLL:
                if ((*(unsigned int (**)(void))(*(void *)a3 + 16))())
                {
                  uint64_t v93 = *(void *)(a1 + 16);
                  long long v86 = *(_OWORD *)a1;
                  long long v35 = *(_OWORD *)v12;
                  *(void *)(a1 + 16) = *(void *)(v12 + 16);
                  *(_OWORD *)a1 = v35;
                  *(void *)(v12 + 16) = v93;
                  *(_OWORD *)uint64_t v12 = v86;
                }
                break;
              case 3uLL:
                std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,BOOL({block_pointer} {__strong}&)(std::string const&,std::string const&),std::string*>((long long *)a1, (long long *)(a1 + 24), (long long *)v12, a3);
                break;
              case 4uLL:
                std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,BOOL({block_pointer} {__strong}&)(std::string const&,std::string const&),std::string*>(a1, a1 + 24, a1 + 48, v12, a3);
                break;
              case 5uLL:
                std::__sort5[abi:nn180100]<std::_ClassicAlgPolicy,BOOL({block_pointer} {__strong}&)(std::string const&,std::string const&),std::string*>((__n128 *)a1, a1 + 24, a1 + 48, a1 + 72, v12, a3);
                break;
              default:
                JUMPOUT(0);
            }
            return;
          }
          if (v14 <= 575)
          {
            if (a5)
            {
              if (a1 != a2)
              {
                unint64_t v36 = a1 + 24;
                if (a1 + 24 != a2)
                {
                  uint64_t v37 = 0;
                  do
                  {
                    unint64_t v38 = v36;
                    if ((*(unsigned int (**)(void))(*(void *)a3 + 16))())
                    {
                      uint64_t v94 = *(void *)(v38 + 16);
                      long long v87 = *(_OWORD *)v38;
                      *(void *)(v38 + 8) = 0;
                      *(void *)(v38 + 16) = 0;
                      *(void *)unint64_t v38 = 0;
                      uint64_t v39 = v37;
                      do
                      {
                        uint64_t v40 = a1 + v39;
                        v41 = (void **)(a1 + v39 + 24);
                        if (*(char *)(a1 + v39 + 47) < 0) {
                          operator delete(*v41);
                        }
                        *(_OWORD *)v41 = *(_OWORD *)v40;
                        *(void *)(a1 + v39 + 40) = *(void *)(v40 + 16);
                        *(unsigned char *)(v40 + 23) = 0;
                        *(unsigned char *)uint64_t v40 = 0;
                        if (!v39)
                        {
                          uint64_t v42 = a1;
                          goto LABEL_84;
                        }
                        v39 -= 24;
                      }
                      while (((*(uint64_t (**)(void))(*(void *)a3 + 16))() & 1) != 0);
                      uint64_t v42 = a1 + v39 + 24;
                      if (*(char *)(v42 + 23) < 0) {
                        operator delete(*(void **)v42);
                      }
LABEL_84:
                      a2 = v79;
                      *(void *)(v42 + 16) = v94;
                      *(_OWORD *)uint64_t v42 = v87;
                    }
                    unint64_t v36 = v38 + 24;
                    v37 += 24;
                  }
                  while (v38 + 24 != a2);
                }
              }
            }
            else if (a1 != a2)
            {
              unint64_t v68 = a1 + 24;
              if (a1 + 24 != a2)
              {
                v69 = (char *)(a1 + 47);
                do
                {
                  unint64_t v70 = v68;
                  if ((*(unsigned int (**)(void))(*(void *)a3 + 16))())
                  {
                    uint64_t v97 = *(void *)(v70 + 16);
                    long long v90 = *(_OWORD *)v70;
                    *(void *)(v70 + 8) = 0;
                    *(void *)(v70 + 16) = 0;
                    *(void *)unint64_t v70 = 0;
                    v71 = v69;
                    do
                    {
                      v72 = v71;
                      v73 = v71 - 23;
                      v74 = v71 - 47;
                      if (*v71 < 0) {
                        operator delete(*(void **)v73);
                      }
                      *(_OWORD *)v73 = *(_OWORD *)v74;
                      *((void *)v73 + 2) = *((void *)v74 + 2);
                      *(v72 - 24) = 0;
                      *(v72 - 47) = 0;
                      char v75 = (*(uint64_t (**)(void))(*(void *)a3 + 16))();
                      v71 = v72 - 24;
                    }
                    while ((v75 & 1) != 0);
                    v76 = v72 - 47;
                    if (v76[23] < 0) {
                      operator delete(*(void **)v76);
                    }
                    *((void *)v76 + 2) = v97;
                    *(_OWORD *)v76 = v90;
                  }
                  unint64_t v68 = v70 + 24;
                  v69 += 24;
                }
                while (v70 + 24 != a2);
              }
            }
            return;
          }
          if (!a4)
          {
            if (a1 != a2)
            {
              int64_t v43 = (v15 - 2) >> 1;
              int64_t v82 = v43;
              do
              {
                int64_t v44 = v43;
                if (v82 >= v43)
                {
                  uint64_t v45 = (2 * v43) | 1;
                  unint64_t v46 = a1 + 24 * v45;
                  if (2 * v43 + 2 < (uint64_t)v15 && (*(unsigned int (**)(void))(*(void *)a3 + 16))())
                  {
                    v46 += 24;
                    uint64_t v45 = 2 * v44 + 2;
                  }
                  unint64_t v47 = a1 + 24 * v44;
                  if (((*(uint64_t (**)(void))(*(void *)a3 + 16))() & 1) == 0)
                  {
                    uint64_t v95 = *(void *)(v47 + 16);
                    long long v88 = *(_OWORD *)v47;
                    *(void *)(v47 + 8) = 0;
                    *(void *)(v47 + 16) = 0;
                    *(void *)unint64_t v47 = 0;
                    while (1)
                    {
                      unint64_t v48 = v46;
                      if (*(char *)(v47 + 23) < 0) {
                        operator delete(*(void **)v47);
                      }
                      long long v49 = *(_OWORD *)v46;
                      *(void *)(v47 + 16) = *(void *)(v46 + 16);
                      *(_OWORD *)unint64_t v47 = v49;
                      *(unsigned char *)(v46 + 23) = 0;
                      *(unsigned char *)unint64_t v46 = 0;
                      if (v82 < v45) {
                        break;
                      }
                      uint64_t v50 = (2 * v45) | 1;
                      unint64_t v46 = a1 + 24 * v50;
                      uint64_t v45 = 2 * v45 + 2;
                      if (v45 < (uint64_t)v15)
                      {
                        if ((*(unsigned int (**)(void))(*(void *)a3 + 16))()) {
                          v46 += 24;
                        }
                        else {
                          uint64_t v45 = v50;
                        }
                      }
                      else
                      {
                        uint64_t v45 = v50;
                      }
                      unint64_t v47 = v48;
                      if ((*(unsigned int (**)(void))(*(void *)a3 + 16))())
                      {
                        if (*(char *)(v48 + 23) < 0) {
                          operator delete(*(void **)v48);
                        }
                        break;
                      }
                    }
                    *(void *)(v48 + 16) = v95;
                    *(_OWORD *)unint64_t v48 = v88;
                    a2 = v79;
                  }
                }
                int64_t v43 = v44 - 1;
              }
              while (v44);
              int64_t v51 = v14 / 0x18uLL;
              do
              {
                uint64_t v52 = 0;
                unint64_t v78 = a2;
                uint64_t v80 = *(void *)a1;
                *(void *)v100 = *(void *)(a1 + 8);
                *(void *)&v100[7] = *(void *)(a1 + 15);
                char v83 = *(unsigned char *)(a1 + 23);
                *(void *)(a1 + 8) = 0;
                *(void *)(a1 + 16) = 0;
                *(void *)a1 = 0;
                uint64_t v53 = v51 - 2;
                if (v51 < 2) {
                  uint64_t v53 = v51 - 1;
                }
                uint64_t v54 = v53 >> 1;
                unint64_t v55 = a1;
                do
                {
                  uint64_t v56 = v55 + 24 * v52 + 24;
                  uint64_t v57 = 2 * v52;
                  uint64_t v52 = (2 * v52) | 1;
                  uint64_t v58 = v57 + 2;
                  if (v57 + 2 < v51 && (*(unsigned int (**)(void))(*(void *)a3 + 16))())
                  {
                    v56 += 24;
                    uint64_t v52 = v58;
                  }
                  if (*(char *)(v55 + 23) < 0) {
                    operator delete(*(void **)v55);
                  }
                  long long v59 = *(_OWORD *)v56;
                  *(void *)(v55 + 16) = *(void *)(v56 + 16);
                  *(_OWORD *)unint64_t v55 = v59;
                  *(unsigned char *)(v56 + 23) = 0;
                  *(unsigned char *)uint64_t v56 = 0;
                  unint64_t v55 = v56;
                }
                while (v52 <= v54);
                if (v56 == v78 - 24)
                {
                  unint64_t v61 = v78 - 24;
                  *(void *)uint64_t v56 = v80;
                  *(void *)(v56 + 8) = *(void *)v100;
                  *(void *)(v56 + 15) = *(void *)&v100[7];
                  *(unsigned char *)(v56 + 23) = v83;
                }
                else
                {
                  long long v60 = *(_OWORD *)(v78 - 24);
                  unint64_t v61 = v78 - 24;
                  *(void *)(v56 + 16) = *(void *)(v78 - 8);
                  *(_OWORD *)uint64_t v56 = v60;
                  *(void *)(v78 - 24) = v80;
                  *(void *)(v78 - 9) = *(void *)&v100[7];
                  *(void *)(v78 - 16) = *(void *)v100;
                  *(unsigned char *)(v78 - 1) = v83;
                  uint64_t v62 = v56 - a1 + 24;
                  if (v62 >= 25)
                  {
                    unint64_t v63 = (unint64_t)(-2 - 0x5555555555555555 * (v62 >> 3)) >> 1;
                    unint64_t v64 = a1 + 24 * v63;
                    if ((*(unsigned int (**)(void))(*(void *)a3 + 16))())
                    {
                      uint64_t v96 = *(void *)(v56 + 16);
                      long long v89 = *(_OWORD *)v56;
                      *(void *)(v56 + 8) = 0;
                      *(void *)(v56 + 16) = 0;
                      *(void *)uint64_t v56 = 0;
                      while (1)
                      {
                        uint64_t v65 = v64;
                        if (*(char *)(v56 + 23) < 0) {
                          operator delete(*(void **)v56);
                        }
                        long long v66 = *(_OWORD *)v64;
                        *(void *)(v56 + 16) = *(void *)(v64 + 16);
                        *(_OWORD *)uint64_t v56 = v66;
                        *(unsigned char *)(v64 + 23) = 0;
                        *(unsigned char *)unint64_t v64 = 0;
                        if (!v63) {
                          break;
                        }
                        unint64_t v63 = (v63 - 1) >> 1;
                        unint64_t v64 = a1 + 24 * v63;
                        uint64_t v56 = v65;
                        if (((*(uint64_t (**)(void))(*(void *)a3 + 16))() & 1) == 0)
                        {
                          if (*(char *)(v65 + 23) < 0) {
                            operator delete(*(void **)v65);
                          }
                          break;
                        }
                      }
                      *(void *)(v65 + 16) = v96;
                      *(_OWORD *)uint64_t v65 = v89;
                    }
                  }
                }
                BOOL v67 = v51-- <= 2;
                a2 = v61;
              }
              while (!v67);
            }
            return;
          }
          unint64_t v16 = a1 + 24 * (v15 >> 1);
          if ((unint64_t)v14 >= 0xC01)
          {
            std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,BOOL({block_pointer} {__strong}&)(std::string const&,std::string const&),std::string*>((long long *)a1, (long long *)(a1 + 24 * (v15 >> 1)), (long long *)v12, a3);
            uint64_t v17 = 3 * (v15 >> 1);
            v18 = (long long *)(a1 + 24 * (v15 >> 1) - 24);
            std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,BOOL({block_pointer} {__strong}&)(std::string const&,std::string const&),std::string*>((long long *)(a1 + 24), v18, v81, a3);
            std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,BOOL({block_pointer} {__strong}&)(std::string const&,std::string const&),std::string*>((long long *)(a1 + 48), (long long *)(a1 + 24 + 8 * v17), v77, a3);
            std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,BOOL({block_pointer} {__strong}&)(std::string const&,std::string const&),std::string*>(v18, (long long *)v16, (long long *)(a1 + 24 + 8 * v17), a3);
            uint64_t v91 = *(void *)(a1 + 16);
            long long v84 = *(_OWORD *)a1;
            uint64_t v19 = *(void *)(v16 + 16);
            *(_OWORD *)a1 = *(_OWORD *)v16;
            *(void *)(a1 + 16) = v19;
            *(void *)(v16 + 16) = v91;
            *(_OWORD *)unint64_t v16 = v84;
          }
          else
          {
            std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,BOOL({block_pointer} {__strong}&)(std::string const&,std::string const&),std::string*>((long long *)(a1 + 24 * (v15 >> 1)), (long long *)a1, (long long *)v12, a3);
          }
          --a4;
          a2 = v79;
          if (a5 & 1) != 0 || ((*(uint64_t (**)(void))(*(void *)a3 + 16))()) {
            break;
          }
          uint64_t v102 = *(void *)(a1 + 16);
          long long v99 = *(_OWORD *)a1;
          *(void *)(a1 + 8) = 0;
          *(void *)(a1 + 16) = 0;
          *(void *)a1 = 0;
          if ((*(uint64_t (**)(void))(*(void *)a3 + 16))())
          {
            unint64_t v13 = a1;
            do
              v13 += 24;
            while (((*(uint64_t (**)(void))(*(void *)a3 + 16))() & 1) == 0);
          }
          else
          {
            unint64_t v29 = a1 + 24;
            do
            {
              unint64_t v13 = v29;
              if (v29 >= v79) {
                break;
              }
              int v30 = (*(uint64_t (**)(void))(*(void *)a3 + 16))();
              unint64_t v29 = v13 + 24;
            }
            while (!v30);
          }
          unint64_t v31 = v79;
          if (v13 < v79)
          {
            unint64_t v31 = v79;
            do
              v31 -= 24;
            while (((*(uint64_t (**)(void))(*(void *)a3 + 16))() & 1) != 0);
          }
          while (v13 < v31)
          {
            uint64_t v92 = *(void *)(v13 + 16);
            long long v85 = *(_OWORD *)v13;
            long long v32 = *(_OWORD *)v31;
            *(void *)(v13 + 16) = *(void *)(v31 + 16);
            *(_OWORD *)unint64_t v13 = v32;
            *(void *)(v31 + 16) = v92;
            *(_OWORD *)unint64_t v31 = v85;
            do
              v13 += 24;
            while (!(*(unsigned int (**)(void))(*(void *)a3 + 16))());
            do
              v31 -= 24;
            while (((*(uint64_t (**)(void))(*(void *)a3 + 16))() & 1) != 0);
          }
          v33 = (long long *)(v13 - 24);
          BOOL v5 = v13 - 24 >= a1;
          BOOL v6 = v13 - 24 == a1;
          if (v13 - 24 == a1)
          {
            if (*(char *)(v13 - 1) < 0) {
              operator delete(*(void **)a1);
            }
          }
          else
          {
            if (*(char *)(a1 + 23) < 0) {
              operator delete(*(void **)a1);
            }
            long long v34 = *v33;
            *(void *)(a1 + 16) = *(void *)(v13 - 8);
            *(_OWORD *)a1 = v34;
            *(unsigned char *)(v13 - 1) = 0;
            *(unsigned char *)(v13 - 24) = 0;
          }
          a5 = 0;
          *(void *)(v13 - 8) = v102;
          long long *v33 = v99;
        }
        uint64_t v101 = *(void *)(a1 + 16);
        long long v98 = *(_OWORD *)a1;
        *(void *)(a1 + 8) = 0;
        *(void *)(a1 + 16) = 0;
        *(void *)a1 = 0;
        unint64_t v20 = a1;
        do
          v20 += 24;
        while (((*(uint64_t (**)(void))(*(void *)a3 + 16))() & 1) != 0);
        unint64_t v21 = v79;
        if (v20 - 24 == a1)
        {
          unint64_t v21 = v79;
          do
          {
            if (v20 >= v21) {
              break;
            }
            v21 -= 24;
          }
          while (((*(uint64_t (**)(void))(*(void *)a3 + 16))() & 1) == 0);
        }
        else
        {
          do
            v21 -= 24;
          while (!(*(unsigned int (**)(void))(*(void *)a3 + 16))());
        }
        unint64_t v13 = v20;
        if (v20 < v21)
        {
          unint64_t v22 = v21;
          do
          {
            long long v23 = *(_OWORD *)v13;
            uint64_t v24 = *(void *)(v13 + 16);
            uint64_t v25 = *(void *)(v22 + 16);
            *(_OWORD *)unint64_t v13 = *(_OWORD *)v22;
            *(void *)(v13 + 16) = v25;
            *(void *)(v22 + 16) = v24;
            *(_OWORD *)unint64_t v22 = v23;
            do
              v13 += 24;
            while (((*(uint64_t (**)(void))(*(void *)a3 + 16))() & 1) != 0);
            do
              v22 -= 24;
            while (!(*(unsigned int (**)(void))(*(void *)a3 + 16))());
          }
          while (v13 < v22);
        }
        v26 = (long long *)(v13 - 24);
        if (v13 - 24 == a1)
        {
          if (*(char *)(v13 - 1) < 0) {
            operator delete(*(void **)a1);
          }
        }
        else
        {
          if (*(char *)(a1 + 23) < 0) {
            operator delete(*(void **)a1);
          }
          long long v27 = *v26;
          *(void *)(a1 + 16) = *(void *)(v13 - 8);
          *(_OWORD *)a1 = v27;
          *(unsigned char *)(v13 - 1) = 0;
          *(unsigned char *)(v13 - 24) = 0;
        }
        *(void *)(v13 - 8) = v101;
        long long *v26 = v98;
        if (v20 >= v21) {
          break;
        }
LABEL_34:
        std::__introsort<std::_ClassicAlgPolicy,BOOL({block_pointer} {__strong}&)(std::string const&,std::string const&),std::string*,false>(a1, v13 - 24, a3, a4, a5 & 1);
        a5 = 0;
      }
      BOOL v28 = std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,BOOL({block_pointer} {__strong}&)(std::string const&,std::string const&),std::string*>(a1, v13 - 24, a3);
      if (std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,BOOL({block_pointer} {__strong}&)(std::string const&,std::string const&),std::string*>(v13, v79, a3))
      {
        break;
      }
      if (!v28) {
        goto LABEL_34;
      }
    }
    a2 = v13 - 24;
    if (!v28) {
      continue;
    }
    break;
  }
}

void sub_23EFD59DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, uint64_t a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,void *__p,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a27 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  BOOL v5 = this;
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
    uint64_t v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    BOOL v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
}

void std::vector<std::string>::__destroy_vector::operator()[abi:nn180100](void ***a1)
{
  size_t v2 = *a1;
  if (*v2)
  {
    std::vector<std::string>::__clear[abi:nn180100]((uint64_t *)v2);
    size_t v3 = **a1;
    operator delete(v3);
  }
}

uint64_t **std::__tree<std::__value_type<std::string,long>,std::__map_value_compare<std::string,std::__value_type<std::string,long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,long>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t **a1, void *a2, uint64_t a3)
{
  std::string::size_type v6 = a1 + 1;
  BOOL v5 = a1[1];
  if (v5)
  {
    while (1)
    {
      while (1)
      {
        std::string::size_type v6 = (uint64_t **)v5;
        uint64_t v8 = v5 + 4;
        if ((std::operator<=>[abi:nn180100]<char,std::char_traits<char>,std::allocator<char>>(a2, v5 + 4) & 0x80) == 0) {
          break;
        }
        BOOL v5 = *v6;
        v9 = v6;
        if (!*v6) {
          goto LABEL_9;
        }
      }
      if ((std::operator<=>[abi:nn180100]<char,std::char_traits<char>,std::allocator<char>>(v8, a2) & 0x80) == 0) {
        return v6;
      }
      v9 = v6 + 1;
      BOOL v5 = v6[1];
      if (!v5) {
        goto LABEL_9;
      }
    }
  }
  else
  {
    v9 = a1 + 1;
LABEL_9:
    v10 = operator new(0x40uLL);
    v11 = (std::string *)(v10 + 4);
    if (*(char *)(a3 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(v11, *(const std::string::value_type **)a3, *(void *)(a3 + 8));
    }
    else
    {
      *(_OWORD *)&v11->__r_.__value_.__l.__data_ = *(_OWORD *)a3;
      v10[6] = *(void *)(a3 + 16);
    }
    v10[7] = 0;
    void *v10 = 0;
    v10[1] = 0;
    v10[2] = v6;
    *v9 = v10;
    uint64_t v12 = (uint64_t *)**a1;
    unint64_t v13 = v10;
    if (v12)
    {
      *a1 = v12;
      unint64_t v13 = *v9;
    }
    std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(a1[1], v13);
    a1[2] = (uint64_t *)((char *)a1[2] + 1);
  }
  return (uint64_t **)v10;
}

void sub_23EFD5C70(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t *std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      size_t v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      size_t v3 = (uint64_t *)v2[2];
      size_t v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), BOOL v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            v9 = (uint64_t **)a2[2];
          }
          else
          {
            v9 = (uint64_t **)v2[1];
            v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              size_t v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            *v9 = v2;
            v2[2] = (uint64_t)v9;
            size_t v3 = v9[2];
            size_t v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          *size_t v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), BOOL v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          *size_t v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            size_t v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          size_t v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        size_t v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        *size_t v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      *BOOL v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void std::vector<std::string>::__clear[abi:nn180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 24)
  {
    if (*(char *)(i - 1) < 0) {
      operator delete(*(void **)(i - 24));
    }
  }
  a1[1] = v2;
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<std::string>>(unint64_t a1)
{
  if (a1 >= 0xAAAAAAAAAAAAAABLL) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  return operator new(24 * a1);
}

void std::__split_buffer<std::string>::~__split_buffer(std::__split_buffer<std::string> *this)
{
  std::__split_buffer<std::string>::pointer begin = this->__begin_;
  std::__split_buffer<std::string>::pointer end = this->__end_;
  if (end != begin)
  {
    do
    {
      std::__split_buffer<std::string>::pointer v4 = end - 1;
      this->__end_ = end - 1;
      if (SHIBYTE(end[-1].__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(v4->__r_.__value_.__l.__data_);
        std::__split_buffer<std::string>::pointer v4 = this->__end_;
      }
      std::__split_buffer<std::string>::pointer end = v4;
    }
    while (v4 != begin);
  }
  if (this->__first_) {
    operator delete(this->__first_);
  }
}

void std::__throw_bad_array_new_length[abi:nn180100]()
{
}

uint64_t std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,BOOL({block_pointer} {__strong}&)(std::string const&,std::string const&),std::string*>(long long *a1, long long *a2, long long *a3, uint64_t a4)
{
  char v8 = (*(uint64_t (**)(void))(*(void *)a4 + 16))();
  uint64_t result = (*(uint64_t (**)(void))(*(void *)a4 + 16))();
  if (v8)
  {
    if (result)
    {
      uint64_t v10 = *((void *)a1 + 2);
      long long v11 = *a1;
      uint64_t v12 = *((void *)a3 + 2);
      *a1 = *a3;
      *((void *)a1 + 2) = v12;
    }
    else
    {
      uint64_t v19 = *((void *)a1 + 2);
      long long v20 = *a1;
      uint64_t v21 = *((void *)a2 + 2);
      *a1 = *a2;
      *((void *)a1 + 2) = v21;
      *a2 = v20;
      *((void *)a2 + 2) = v19;
      uint64_t result = (*(uint64_t (**)(void))(*(void *)a4 + 16))();
      if (!result) {
        return result;
      }
      uint64_t v10 = *((void *)a2 + 2);
      long long v11 = *a2;
      uint64_t v22 = *((void *)a3 + 2);
      *a2 = *a3;
      *((void *)a2 + 2) = v22;
    }
    *a3 = v11;
    *((void *)a3 + 2) = v10;
  }
  else if (result)
  {
    uint64_t v13 = *((void *)a2 + 2);
    long long v14 = *a2;
    uint64_t v15 = *((void *)a3 + 2);
    *a2 = *a3;
    *((void *)a2 + 2) = v15;
    *a3 = v14;
    *((void *)a3 + 2) = v13;
    uint64_t result = (*(uint64_t (**)(void))(*(void *)a4 + 16))();
    if (result)
    {
      uint64_t v16 = *((void *)a1 + 2);
      long long v17 = *a1;
      uint64_t v18 = *((void *)a2 + 2);
      *a1 = *a2;
      *((void *)a1 + 2) = v18;
      *a2 = v17;
      *((void *)a2 + 2) = v16;
    }
  }
  return result;
}

__n128 std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,BOOL({block_pointer} {__strong}&)(std::string const&,std::string const&),std::string*>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,BOOL({block_pointer} {__strong}&)(std::string const&,std::string const&),std::string*>((long long *)a1, (long long *)a2, (long long *)a3, a5);
  if ((*(unsigned int (**)(void))(*(void *)a5 + 16))())
  {
    uint64_t v11 = *(void *)(a3 + 16);
    long long v12 = *(_OWORD *)a3;
    uint64_t v13 = *(void *)(a4 + 16);
    *(_OWORD *)a3 = *(_OWORD *)a4;
    *(void *)(a3 + 16) = v13;
    *(_OWORD *)a4 = v12;
    *(void *)(a4 + 16) = v11;
    if ((*(unsigned int (**)(void))(*(void *)a5 + 16))())
    {
      uint64_t v14 = *(void *)(a2 + 16);
      long long v15 = *(_OWORD *)a2;
      uint64_t v16 = *(void *)(a3 + 16);
      *(_OWORD *)a2 = *(_OWORD *)a3;
      *(void *)(a2 + 16) = v16;
      *(_OWORD *)a3 = v15;
      *(void *)(a3 + 16) = v14;
      if ((*(unsigned int (**)(void))(*(void *)a5 + 16))())
      {
        uint64_t v17 = *(void *)(a1 + 16);
        __n128 result = *(__n128 *)a1;
        uint64_t v18 = *(void *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(void *)(a1 + 16) = v18;
        *(__n128 *)a2 = result;
        *(void *)(a2 + 16) = v17;
      }
    }
  }
  return result;
}

__n128 std::__sort5[abi:nn180100]<std::_ClassicAlgPolicy,BOOL({block_pointer} {__strong}&)(std::string const&,std::string const&),std::string*>(__n128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  __n128 v12 = std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,BOOL({block_pointer} {__strong}&)(std::string const&,std::string const&),std::string*>((uint64_t)a1, a2, a3, a4, a6);
  if ((*(unsigned int (**)(__n128))(*(void *)a6 + 16))(v12))
  {
    uint64_t v14 = *(void *)(a4 + 16);
    long long v15 = *(_OWORD *)a4;
    uint64_t v16 = *(void *)(a5 + 16);
    *(_OWORD *)a4 = *(_OWORD *)a5;
    *(void *)(a4 + 16) = v16;
    *(_OWORD *)a5 = v15;
    *(void *)(a5 + 16) = v14;
    if ((*(unsigned int (**)(void))(*(void *)a6 + 16))())
    {
      uint64_t v17 = *(void *)(a3 + 16);
      long long v18 = *(_OWORD *)a3;
      uint64_t v19 = *(void *)(a4 + 16);
      *(_OWORD *)a3 = *(_OWORD *)a4;
      *(void *)(a3 + 16) = v19;
      *(_OWORD *)a4 = v18;
      *(void *)(a4 + 16) = v17;
      if ((*(unsigned int (**)(void))(*(void *)a6 + 16))())
      {
        uint64_t v20 = *(void *)(a2 + 16);
        __n128 v21 = *(__n128 *)a2;
        uint64_t v22 = *(void *)(a3 + 16);
        *(_OWORD *)a2 = *(_OWORD *)a3;
        *(void *)(a2 + 16) = v22;
        *(__n128 *)a3 = v21;
        *(void *)(a3 + 16) = v20;
        if ((*(unsigned int (**)(void))(*(void *)a6 + 16))())
        {
          unint64_t v23 = a1[1].n128_u64[0];
          __n128 result = *a1;
          unint64_t v24 = *(void *)(a2 + 16);
          *a1 = *(__n128 *)a2;
          a1[1].n128_u64[0] = v24;
          *(__n128 *)a2 = result;
          *(void *)(a2 + 16) = v23;
        }
      }
    }
  }
  return result;
}

BOOL std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,BOOL({block_pointer} {__strong}&)(std::string const&,std::string const&),std::string*>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (a2 - a1) >> 3;
  BOOL result = 1;
  switch(0xAAAAAAAAAAAAAAABLL * v6)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      char v8 = (long long *)(a2 - 24);
      if ((*(unsigned int (**)(void))(*(void *)a3 + 16))())
      {
        uint64_t v9 = *(void *)(a1 + 16);
        long long v10 = *(_OWORD *)a1;
        uint64_t v11 = *(void *)(a2 - 8);
        *(_OWORD *)a1 = *v8;
        *(void *)(a1 + 16) = v11;
        *char v8 = v10;
        *(void *)(a2 - 8) = v9;
      }
      return 1;
    case 3uLL:
      std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,BOOL({block_pointer} {__strong}&)(std::string const&,std::string const&),std::string*>((long long *)a1, (long long *)(a1 + 24), (long long *)(a2 - 24), a3);
      return 1;
    case 4uLL:
      std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,BOOL({block_pointer} {__strong}&)(std::string const&,std::string const&),std::string*>(a1, a1 + 24, a1 + 48, a2 - 24, a3);
      return 1;
    case 5uLL:
      std::__sort5[abi:nn180100]<std::_ClassicAlgPolicy,BOOL({block_pointer} {__strong}&)(std::string const&,std::string const&),std::string*>((__n128 *)a1, a1 + 24, a1 + 48, a1 + 72, a2 - 24, a3);
      return 1;
    default:
      std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,BOOL({block_pointer} {__strong}&)(std::string const&,std::string const&),std::string*>((long long *)a1, (long long *)(a1 + 24), (long long *)(a1 + 48), a3);
      uint64_t v12 = a1 + 72;
      if (a1 + 72 == a2) {
        return 1;
      }
      uint64_t v13 = 0;
      int v14 = 0;
      break;
  }
  while (1)
  {
    if ((*(unsigned int (**)(void))(*(void *)a3 + 16))())
    {
      long long v19 = *(_OWORD *)v12;
      uint64_t v20 = *(void *)(v12 + 16);
      *(void *)(v12 + 8) = 0;
      *(void *)(v12 + 16) = 0;
      *(void *)uint64_t v12 = 0;
      uint64_t v15 = v13;
      do
      {
        uint64_t v16 = a1 + v15;
        uint64_t v17 = (void **)(a1 + v15 + 72);
        if (*(char *)(a1 + v15 + 95) < 0) {
          operator delete(*v17);
        }
        *(_OWORD *)uint64_t v17 = *(_OWORD *)(v16 + 48);
        *(void *)(a1 + v15 + 88) = *(void *)(v16 + 64);
        *(unsigned char *)(v16 + 71) = 0;
        *(unsigned char *)(v16 + 48) = 0;
        if (v15 == -48)
        {
          uint64_t v18 = a1;
          goto LABEL_15;
        }
        v15 -= 24;
      }
      while (((*(uint64_t (**)(void))(*(void *)a3 + 16))() & 1) != 0);
      uint64_t v18 = a1 + v15 + 72;
      if (*(char *)(v18 + 23) < 0) {
        operator delete(*(void **)v18);
      }
LABEL_15:
      *(_OWORD *)uint64_t v18 = v19;
      *(void *)(v18 + 16) = v20;
      if (++v14 == 8) {
        return v12 + 24 == a2;
      }
    }
    v13 += 24;
    v12 += 24;
    if (v12 == a2) {
      return 1;
    }
  }
}

void sub_23EFD651C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_23EFD6630(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23EFD66F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_23EFD6804(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23EFD68CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_23EFD69E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23EFD6BEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23EFD6D0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23EFD6E50(_Unwind_Exception *a1)
{
  uint64_t v6 = v5;

  _Unwind_Resume(a1);
}

void sub_23EFD6F60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23EFD70AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23EFD71B8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23EFD7280(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void _TIBeginMockingUserDictionaryServer()
{
}

void _TIBeginMockingUserDictionaryServerWithPairs(void *a1)
{
  id v1 = a1;
  uint64_t v2 = objc_alloc_init(TIUserDictionaryServerMock);
  [(TIUserDictionaryServerMock *)v2 setPairs:v1];

  if (objc_opt_respondsToSelector()) {
    [MEMORY[0x263F7EB58] performSelector:sel_setSharedInstance_ withObject:v2];
  }
}

uint64_t _TIEndMockingUserDictionaryServer()
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    id v1 = (void *)MEMORY[0x263F7EB58];
    return [v1 performSelector:sel_setSharedInstance_ withObject:0];
  }
  return result;
}

void KB::LikelihoodInfo::~LikelihoodInfo(void **this)
{
  if (*((char *)this + 39) < 0) {
    operator delete(this[2]);
  }
}

uint64_t TIRunFailingTests()
{
  return 0;
}

uint64_t TIRunFailingTestsDevice()
{
  return 0;
}

id languageModelFilePathForInputMode()
{
  v0 = TINgramModelPathForInputMode();
  return v0;
}

id englishUnigramsFilePath()
{
  v0 = UIKeyboardStaticUnigramsFile();
  return v0;
}

void invalidateCurrentTestServiceConnection()
{
  id v0 = (id)currentTestServiceConnection;
  if (v0) {
    [v0 invalidate];
  }
}

void sub_23EFD7D7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id ensureTestServiceConnection()
{
  if (currentTestServiceConnection)
  {
    id v0 = (id)currentTestServiceConnection;
  }
  else
  {
    id v0 = (id)[objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.TextInput.TextInputTestService"];
    id v1 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26F2DFAE0];
    [v0 setRemoteObjectInterface:v1];

    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3321888768;
    v7[2] = ___ZZ27ensureTestServiceConnectionENK3__0cvU13block_pointerFvvEEv_block_invoke;
    v7[3] = &__block_descriptor_33_ea8_32c40_ZTSKZ27ensureTestServiceConnectionE3__0_e5_v8__0l;
    uint64_t v2 = (void *)MEMORY[0x2455C2CF0](v7);
    [v0 setInvalidationHandler:v2];

    [v0 resume];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3321888768;
    v6[2] = __ensureTestServiceConnection_block_invoke;
    v6[3] = &__block_descriptor_33_ea8_32c40_ZTSKZ27ensureTestServiceConnectionE3__1_e17_v16__0__NSError_8l;
    size_t v3 = [v0 synchronousRemoteObjectProxyWithErrorHandler:v6];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3321888768;
    v5[2] = __ensureTestServiceConnection_block_invoke_43;
    v5[3] = &__block_descriptor_33_ea8_32c40_ZTSKZ27ensureTestServiceConnectionE3__2_e5_v8__0l;
    [v3 ackWithReply:v5];
    objc_storeStrong((id *)&currentTestServiceConnection, v0);
  }
  return v0;
}

void sub_23EFD7F48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZZ27ensureTestServiceConnectionENK3__0cvU13block_pointerFvvEEv_block_invoke()
{
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    id v0 = (void *)currentTestServiceConnection;
    currentTestServiceConnection = 0;
  }
  else
  {
    v2[0] = MEMORY[0x263EF8330];
    v2[1] = 3321888768;
    v2[2] = ___ZZZ27ensureTestServiceConnectionENK3__0clEvENKUlvE_cvU13block_pointerFvvEEv_block_invoke;
    v2[3] = &__block_descriptor_33_ea8_32c53_ZTSKZZ27ensureTestServiceConnectionENK3__0clEvEUlvE__e5_v8__0l;
    id v1 = (void *)MEMORY[0x2455C2CF0](v2);
    TIDispatchSync();
  }
}

void __ensureTestServiceConnection_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 description];
  NSLog(&cfstr_CouldNotMessag.isa, v2);

  __break(1u);
}

void sub_23EFD807C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZZZ27ensureTestServiceConnectionENK3__0clEvENKUlvE_cvU13block_pointerFvvEEv_block_invoke()
{
  id v0 = (void *)currentTestServiceConnection;
  currentTestServiceConnection = 0;
}

void __createAndLoadStaticDictionary(KB::StaticDictionary *a1@<X0>, uint64_t *a2@<X8>)
{
  v7[6] = *MEMORY[0x263EF8340];
  KB::StaticDictionary::create(a2, a1);
  KB::LexiconInfo::LexiconInfo((uint64_t)v3, (uint64_t)a1);
  KB::StaticDictionary::load();
  KB::String::~String((KB::String *)v7);
  KB::String::~String((KB::String *)&v6);
  KB::String::~String((KB::String *)&v5);
  KB::String::~String((KB::String *)&v4);
  KB::String::~String((KB::String *)v3);
}

void sub_23EFD8174(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  KB::LexiconInfo::~LexiconInfo((KB::LexiconInfo *)va);
  std::unique_ptr<KB::StaticDictionary>::reset[abi:nn180100](v2);
  _Unwind_Resume(a1);
}

uint64_t KB::LexiconInfo::LexiconInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = MEMORY[0x2455C23B0]();
  MEMORY[0x2455C23B0](v4 + 32, a2 + 32);
  MEMORY[0x2455C23B0](a1 + 64, a2 + 64);
  MEMORY[0x2455C23B0](a1 + 96, a2 + 96);
  MEMORY[0x2455C23B0](a1 + 128, a2 + 128);
  uint64_t v5 = *(void *)(a2 + 160);
  *(_DWORD *)(a1 + 168) = *(_DWORD *)(a2 + 168);
  *(void *)(a1 + 160) = v5;
  return a1;
}

void sub_23EFD8220(_Unwind_Exception *a1)
{
  KB::String::~String(v4);
  KB::String::~String(v3);
  KB::String::~String(v2);
  KB::String::~String(v1);
  _Unwind_Resume(a1);
}

void KB::LexiconInfo::~LexiconInfo(KB::LexiconInfo *this)
{
  KB::String::~String((KB::LexiconInfo *)((char *)this + 128));
  KB::String::~String((KB::LexiconInfo *)((char *)this + 96));
  KB::String::~String((KB::LexiconInfo *)((char *)this + 64));
  KB::String::~String((KB::LexiconInfo *)((char *)this + 32));
  KB::String::~String(this);
}

uint64_t std::unique_ptr<KB::StaticDictionary>::reset[abi:nn180100](uint64_t *a1)
{
  uint64_t result = *a1;
  *a1 = 0;
  if (result)
  {
    MEMORY[0x2455C2270]();
    JUMPOUT(0x2455C26F0);
  }
  return result;
}

void __createAndLoadDynamicDictionary(const KB::LexiconInfo *a1@<X0>, uint64_t *a2@<X8>)
{
  v13[6] = *MEMORY[0x263EF8340];
  KB::DynamicDictionary::create_single(a2, a1);
  uint64_t v4 = *a2;
  KB::LexiconInfo::LexiconInfo((uint64_t)v9, (uint64_t)a1);
  uint64_t v5 = (char *)operator new(0xB0uLL);
  uint64_t v6 = v5 + 176;
  v7[0] = v5;
  v7[2] = v5 + 176;
  KB::LexiconInfo::LexiconInfo((uint64_t)v5, (uint64_t)v9);
  v7[1] = v6;
  (*(void (**)(uint64_t, void *, void))(*(void *)v4 + 40))(v4, v7, 0);
  char v8 = (void **)v7;
  std::vector<KB::LexiconInfo>::__destroy_vector::operator()[abi:nn180100](&v8);
  KB::String::~String((KB::String *)v13);
  KB::String::~String((KB::String *)&v12);
  KB::String::~String((KB::String *)&v11);
  KB::String::~String((KB::String *)&v10);
  KB::String::~String((KB::String *)v9);
}

void sub_23EFD8420(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va1, a5);
  va_start(va, a5);
  char v8 = va_arg(va1, void **);
  std::vector<KB::LexiconInfo>::__destroy_vector::operator()[abi:nn180100]((void ***)va);
  KB::LexiconInfo::~LexiconInfo((KB::LexiconInfo *)va1);
  uint64_t v7 = *v5;
  *uint64_t v5 = 0;
  if (v7) {
    (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
  }
  _Unwind_Resume(a1);
}

void std::vector<KB::LexiconInfo>::__destroy_vector::operator()[abi:nn180100](void ***a1)
{
  id v1 = *a1;
  uint64_t v2 = (KB::LexiconInfo *)**a1;
  if (v2)
  {
    uint64_t v4 = (KB::LexiconInfo *)v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        uint64_t v4 = (KB::LexiconInfo *)((char *)v4 - 176);
        KB::LexiconInfo::~LexiconInfo(v4);
      }
      while (v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void __createAndLoadMutableLexiconWrapper(NSString *a1, NSString *a2)
{
  v9[4] = *MEMORY[0x263EF8340];
  size_t v3 = a1;
  uint64_t v5 = a2;
  if (v5)
  {
    UIKeyboardDynamicDictionaryFile();
    uint64_t v6 = (KB *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v6 = 0;
  }
  KB::utf8_string(v9, (KB *)v3, v4);
  KB::utf8_string(v8, v6, v7);
  KB::MutableLexiconWrapper::create();
  KB::String::~String((KB::String *)v8);
  KB::String::~String((KB::String *)v9);
}

void sub_23EFD85E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __createAndLoadDictionaryContainerMultiLexicon(NSString *a1@<X0>, NSString *a2@<X1>, float a3@<S0>, NSString *a4@<X2>, void ***a5@<X8>)
{
  v33[6] = *MEMORY[0x263EF8340];
  uint64_t v9 = a1;
  uint64_t v10 = a2;
  uint64_t v11 = a4;
  if (v11)
  {
    UIKeyboardDynamicDictionaryFile();
    uint64_t v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v12 = 0;
  }
  __getLexiconInfo(v9, v12, 1.0 - a3, (uint64_t)v29);
  if (v11)
  {
    UIKeyboardDynamicDictionaryFile();
    uint64_t v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v13 = 0;
  }
  __getLexiconInfo(v10, v13, a3, (uint64_t)v24);
  KB::LexiconInfo::LexiconInfo((uint64_t)v22, (uint64_t)v29);
  KB::LexiconInfo::LexiconInfo((uint64_t)&v23, (uint64_t)v24);
  uint64_t v20 = 0;
  int v14 = (char *)operator new(0x160uLL);
  char v15 = 0;
  uint64_t v16 = 0;
  long long v19 = v14;
  __n128 v21 = v14 + 352;
  do
  {
    char v17 = v15;
    int v14 = (char *)(KB::LexiconInfo::LexiconInfo((uint64_t)v14, (uint64_t)&v22[22 * v16]) + 176);
    char v15 = 1;
    uint64_t v16 = 1;
  }
  while ((v17 & 1) == 0);
  uint64_t v20 = v14;
  uint64_t v18 = 44;
  do
  {
    KB::String::~String((KB::String *)&v22[v18 - 6]);
    KB::String::~String((KB::String *)&v22[v18 - 10]);
    KB::String::~String((KB::String *)&v22[v18 - 14]);
    KB::String::~String((KB::String *)&v22[v18 - 18]);
    KB::String::~String((KB::String *)&v22[v18 - 22]);
    v18 -= 22;
  }
  while (v18 * 8);
  KB::DictionaryContainer::create_multilexicon();
  *a5 = v22[0];
  v22[0] = (void **)&v19;
  std::vector<KB::LexiconInfo>::__destroy_vector::operator()[abi:nn180100](v22);
  KB::String::~String((KB::String *)&v28);
  KB::String::~String((KB::String *)&v27);
  KB::String::~String((KB::String *)&v26);
  KB::String::~String((KB::String *)&v25);
  KB::String::~String((KB::String *)v24);

  KB::String::~String((KB::String *)v33);
  KB::String::~String((KB::String *)&v32);
  KB::String::~String((KB::String *)&v31);
  KB::String::~String((KB::String *)&v30);
  KB::String::~String((KB::String *)v29);
}

void sub_23EFD887C(_Unwind_Exception *a1)
{
  KB::LexiconInfo::~LexiconInfo((KB::LexiconInfo *)&STACK[0x230]);

  _Unwind_Resume(a1);
}

void __createAndLoadLanguageModelStub(NSString *a1, NSString *a2)
{
  v7[1] = *MEMORY[0x263EF8340];
  size_t v3 = a1;
  uint64_t v4 = a2;
  uint64_t v5 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v3];
  uint64_t v6 = [MEMORY[0x263F7EA88] inputModeWithIdentifier:v3];
  v7[0] = v5;
  [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  objc_claimAutoreleasedReturnValue();
  [v6 doesSupportInlineCompletion];
  KB::LanguageModelConfig::LanguageModelConfig();
  operator new();
}

void sub_23EFD8C5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, CFTypeRef a13, CFTypeRef cf, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  if (cf) {
    CFRelease(cf);
  }
  if (a13) {
    CFRelease(a13);
  }
  MEMORY[0x2455C26F0](v30, 0x10F1C404047A376);
  KB::LanguageModelConfig::~LanguageModelConfig((KB::LanguageModelConfig *)&a25);

  _Unwind_Resume(a1);
}

void KB::LanguageModelConfig::~LanguageModelConfig(KB::LanguageModelConfig *this)
{
  uint64_t v2 = (const void *)*((void *)this + 6);
  if (v2) {
    CFRelease(v2);
  }
  *((void *)this + 6) = 0;
  size_t v3 = (const void *)*((void *)this + 5);
  if (v3) {
    CFRelease(v3);
  }
  *((void *)this + 5) = 0;
  uint64_t v4 = (const void *)*((void *)this + 4);
  if (v4) {
    CFRelease(v4);
  }
  *((void *)this + 4) = 0;
  uint64_t v5 = (const void *)*((void *)this + 3);
  if (v5) {
    CFRelease(v5);
  }
  *((void *)this + 3) = 0;
  uint64_t v6 = (const void *)*((void *)this + 2);
  if (v6) {
    CFRelease(v6);
  }
  *((void *)this + 2) = 0;
  uint64_t v7 = (const void *)*((void *)this + 1);
  if (v7) {
    CFRelease(v7);
  }
  *((void *)this + 1) = 0;
  if (*(void *)this) {
    CFRelease(*(CFTypeRef *)this);
  }
  *(void *)this = 0;
}

void std::__shared_weak_count::__release_shared[abi:nn180100](std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

uint64_t std::__shared_ptr_pointer<KB::LanguageModelImplStub *,std::shared_ptr<KB::LanguageModel>::__shared_ptr_default_delete<KB::LanguageModel,KB::LanguageModelImplStub>,std::allocator<KB::LanguageModelImplStub>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

void std::__shared_ptr_pointer<KB::LanguageModelImplStub *,std::shared_ptr<KB::LanguageModel>::__shared_ptr_default_delete<KB::LanguageModel,KB::LanguageModelImplStub>,std::allocator<KB::LanguageModelImplStub>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x2455C26F0);
}

void __createAndLoadLanguageModelContainer(NSString *a1, NSString *a2, float a3, NSString *a4)
{
  v8[16] = *(void **)MEMORY[0x263EF8340];
  uint64_t v6 = a1;
  uint64_t v7 = a2;
  __createAndLoadLanguageModel(v6, a4, v8);
}

void sub_23EFD91E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,std::__shared_weak_count *a32,uint64_t a33,std::__shared_weak_count *a34,void *__p,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43)
{
  std::vector<KB::LanguageModelLexiconGroup>::__destroy_vector::operator()[abi:nn180100]((void ***)&__p);
  KB::LanguageModelLexiconGroup::~LanguageModelLexiconGroup((KB::LanguageModelLexiconGroup *)&a15);
  KB::LanguageModelLexiconGroup::~LanguageModelLexiconGroup((KB::LanguageModelLexiconGroup *)&a24);
  if (a32) {
    std::__shared_weak_count::__release_shared[abi:nn180100](a32);
  }
  if (a34) {
    std::__shared_weak_count::__release_shared[abi:nn180100](a34);
  }

  _Unwind_Resume(a1);
}

uint64_t std::unordered_map<unsigned int,float>::unordered_map(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  std::__hash_table<std::__hash_value_type<unsigned int,float>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,float>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,float>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,float>>>::__rehash<true>(a1, *(void *)(a2 + 8));
  uint64_t v5 = *(uint64_t ***)(a2 + 16);
  if (v5)
  {
    uint64_t v6 = (void *)(a1 + 16);
    unint64_t v7 = *(void *)(a1 + 8);
    do
    {
      unint64_t v8 = *((unsigned int *)v5 + 4);
      if (v7)
      {
        uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
        v9.i16[0] = vaddlv_u8(v9);
        if (v9.u32[0] > 1uLL)
        {
          unint64_t v2 = *((unsigned int *)v5 + 4);
          if (v7 <= v8) {
            unint64_t v2 = v8 % v7;
          }
        }
        else
        {
          unint64_t v2 = (v7 - 1) & v8;
        }
        uint64_t v10 = *(uint64_t ***)(*(void *)a1 + 8 * v2);
        if (v10)
        {
          for (uint64_t i = *v10; i; uint64_t i = (uint64_t *)*i)
          {
            unint64_t v12 = i[1];
            if (v12 == v8)
            {
              if (*((_DWORD *)i + 4) == v8) {
                goto LABEL_41;
              }
            }
            else
            {
              if (v9.u32[0] > 1uLL)
              {
                if (v12 >= v7) {
                  v12 %= v7;
                }
              }
              else
              {
                v12 &= v7 - 1;
              }
              if (v12 != v2) {
                break;
              }
            }
          }
        }
      }
      uint64_t v13 = operator new(0x18uLL);
      *uint64_t v13 = 0;
      v13[1] = v8;
      v13[2] = v5[2];
      float v14 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
      float v15 = *(float *)(a1 + 32);
      if (!v7 || (float)(v15 * (float)v7) < v14)
      {
        BOOL v16 = (v7 & (v7 - 1)) != 0;
        if (v7 < 3) {
          BOOL v16 = 1;
        }
        unint64_t v17 = v16 | (2 * v7);
        unint64_t v18 = vcvtps_u32_f32(v14 / v15);
        if (v17 <= v18) {
          size_t v19 = v18;
        }
        else {
          size_t v19 = v17;
        }
        std::__hash_table<std::__hash_value_type<unsigned int,float>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,float>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,float>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,float>>>::__rehash<true>(a1, v19);
        unint64_t v7 = *(void *)(a1 + 8);
        if ((v7 & (v7 - 1)) != 0)
        {
          if (v7 <= v8) {
            unint64_t v2 = v8 % v7;
          }
          else {
            unint64_t v2 = v8;
          }
        }
        else
        {
          unint64_t v2 = (v7 - 1) & v8;
        }
      }
      uint64_t v20 = *(void *)a1;
      __n128 v21 = *(void **)(*(void *)a1 + 8 * v2);
      if (v21)
      {
        *uint64_t v13 = *v21;
      }
      else
      {
        *uint64_t v13 = *v6;
        void *v6 = v13;
        *(void *)(v20 + 8 * v2) = v6;
        if (!*v13) {
          goto LABEL_40;
        }
        unint64_t v22 = *(void *)(*v13 + 8);
        if ((v7 & (v7 - 1)) != 0)
        {
          if (v22 >= v7) {
            v22 %= v7;
          }
        }
        else
        {
          v22 &= v7 - 1;
        }
        __n128 v21 = (void *)(*(void *)a1 + 8 * v22);
      }
      *__n128 v21 = v13;
LABEL_40:
      ++*(void *)(a1 + 24);
LABEL_41:
      uint64_t v5 = (uint64_t **)*v5;
    }
    while (v5);
  }
  return a1;
}

void sub_23EFD9524(_Unwind_Exception *a1)
{
  std::__hash_table<std::__hash_value_type<unsigned int,float>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,float>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,float>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,float>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

void *std::construct_at[abi:nn180100]<KB::LanguageModelLexiconGroup,KB::LanguageModelLexiconGroup const&,KB::LanguageModelLexiconGroup*>(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  std::unordered_map<unsigned int,float>::unordered_map((uint64_t)(a1 + 2), (uint64_t)(a2 + 2));
  return a1;
}

void sub_23EFD9594(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(std::__shared_weak_count **)(v1 + 8);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__hash_table<std::__hash_value_type<unsigned int,float>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,float>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,float>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,float>>>::~__hash_table(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      uint64_t v3 = (void *)*v2;
      operator delete(v2);
      unint64_t v2 = v3;
    }
    while (v3);
  }
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = 0;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

void KB::LanguageModelContainer::create()
{
}

void sub_23EFD96FC(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

void std::vector<KB::LanguageModelLexiconGroup>::__destroy_vector::operator()[abi:nn180100](void ***a1)
{
  uint64_t v1 = *a1;
  unint64_t v2 = (char *)**a1;
  if (v2)
  {
    uint64_t v4 = (char *)v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        std::__hash_table<std::__hash_value_type<unsigned int,float>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,float>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,float>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,float>>>::~__hash_table((uint64_t)(v4 - 40));
        uint64_t v6 = (std::__shared_weak_count *)*((void *)v4 - 6);
        if (v6) {
          std::__shared_weak_count::__release_shared[abi:nn180100](v6);
        }
        v4 -= 56;
      }
      while (v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void KB::LanguageModelLexiconGroup::~LanguageModelLexiconGroup(KB::LanguageModelLexiconGroup *this)
{
  std::__hash_table<std::__hash_value_type<unsigned int,float>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,float>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,float>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,float>>>::~__hash_table((uint64_t)this + 16);
  unint64_t v2 = (std::__shared_weak_count *)*((void *)this + 1);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v2);
  }
}

uint64_t std::__shared_ptr_pointer<KB::LanguageModelContainer *,std::shared_ptr<KB::LanguageModelContainer>::__shared_ptr_default_delete<KB::LanguageModelContainer,KB::LanguageModelContainer>,std::allocator<KB::LanguageModelContainer>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

void std::__shared_ptr_pointer<KB::LanguageModelContainer *,std::shared_ptr<KB::LanguageModelContainer>::__shared_ptr_default_delete<KB::LanguageModelContainer,KB::LanguageModelContainer>,std::allocator<KB::LanguageModelContainer>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x2455C26F0);
}

void std::__hash_table<std::__hash_value_type<unsigned int,float>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,float>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,float>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,float>>>::__rehash<true>(uint64_t a1, size_t __n)
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
  if (prime <= *(void *)&v4)
  {
    if (prime >= *(void *)&v4) {
      return;
    }
    unint64_t v11 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v12 = (uint8x8_t)vcnt_s8(v4), v12.i16[0] = vaddlv_u8(v12), v12.u32[0] > 1uLL))
    {
      unint64_t v11 = std::__next_prime(v11);
    }
    else
    {
      uint64_t v13 = 1 << -(char)__clz(v11 - 1);
      if (v11 >= 2) {
        unint64_t v11 = v13;
      }
    }
    if (prime <= v11) {
      size_t prime = v11;
    }
    if (prime >= *(void *)&v4) {
      return;
    }
    if (!prime)
    {
      BOOL v16 = *(void **)a1;
      *(void *)a1 = 0;
      if (v16) {
        operator delete(v16);
      }
      *(void *)(a1 + 8) = 0;
      return;
    }
  }
  if (prime >> 61) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  uint64_t v5 = operator new(8 * prime);
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = v5;
  if (v6) {
    operator delete(v6);
  }
  uint64_t v7 = 0;
  *(void *)(a1 + 8) = prime;
  do
    *(void *)(*(void *)a1 + 8 * v7++) = 0;
  while (prime != v7);
  unint64_t v8 = *(void **)(a1 + 16);
  if (v8)
  {
    size_t v9 = v8[1];
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)prime);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      if (v9 >= prime) {
        v9 %= prime;
      }
    }
    else
    {
      v9 &= prime - 1;
    }
    *(void *)(*(void *)a1 + 8 * v9) = a1 + 16;
    float v14 = (void *)*v8;
    if (*v8)
    {
      do
      {
        size_t v15 = v14[1];
        if (v10.u32[0] > 1uLL)
        {
          if (v15 >= prime) {
            v15 %= prime;
          }
        }
        else
        {
          v15 &= prime - 1;
        }
        if (v15 != v9)
        {
          if (!*(void *)(*(void *)a1 + 8 * v15))
          {
            *(void *)(*(void *)a1 + 8 * v15) = v8;
            goto LABEL_31;
          }
          *unint64_t v8 = *v14;
          *float v14 = **(void **)(*(void *)a1 + 8 * v15);
          **(void **)(*(void *)a1 + 8 * v15) = v14;
          float v14 = v8;
        }
        size_t v15 = v9;
LABEL_31:
        unint64_t v8 = v14;
        float v14 = (void *)*v14;
        size_t v9 = v15;
      }
      while (v14);
    }
  }
}

void __sentenceContextForWords(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  int8x8_t v4 = operator new(8uLL);
  *int8x8_t v4 = 0x100000000;
  std::string::basic_string[abi:nn180100]<0>(__p, "");
  uint8x8_t v12 = 0;
  uint64_t v5 = (std::string *)operator new(0x18uLL);
  uint64_t v6 = v5;
  uint64_t v7 = v5 + 1;
  unint64_t v11 = v5;
  uint64_t v13 = v5 + 1;
  if (SHIBYTE(v16) < 0)
  {
    std::string::__init_copy_ctor_external(v5, (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
  }
  else
  {
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = *(_OWORD *)__p;
    v5->__r_.__value_.__r.__words[2] = v16;
  }
  uint8x8_t v12 = v7;
  MEMORY[0x2455C22F0](a2, v4, 1, v6, 1);
  float v14 = &v11;
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100](&v14);
  if (SHIBYTE(v16) < 0) {
    operator delete(__p[0]);
  }
  operator delete(v4);
  uint64_t v8 = *a1;
  uint64_t v9 = a1[1];
  if (*a1 != v9)
  {
    do
    {
      KB::LanguageModel::id_for_static_word();
      if (*(_WORD *)v8)
      {
        if (*(void *)(v8 + 8)) {
          uint8x8_t v10 = *(char **)(v8 + 8);
        }
        else {
          uint8x8_t v10 = (char *)(v8 + 16);
        }
      }
      else
      {
        uint8x8_t v10 = "";
      }
      std::string::basic_string[abi:nn180100]<0>(&v11, v10);
      KB::LanguageModelContext::append();
      if (SHIBYTE(v13) < 0) {
        operator delete(v11);
      }
      v8 += 32;
    }
    while (v8 != v9);
  }
}

void sub_23EFD9C34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  operator delete(v21);
  _Unwind_Resume(a1);
}

void KB::LanguageModelContext::~LanguageModelContext(KB::LanguageModelContext *this)
{
  int8x8_t v4 = (void **)((char *)this + 80);
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100](&v4);
  language_modeling::v1::LinguisticContext::~LinguisticContext((KB::LanguageModelContext *)((char *)this + 72));
  language_modeling::v1::LinguisticContext::~LinguisticContext((KB::LanguageModelContext *)((char *)this + 64));
  unint64_t v2 = (void *)*((void *)this + 2);
  if (v2)
  {
    *((void *)this + 3) = v2;
    operator delete(v2);
  }
  uint64_t v3 = (std::__shared_weak_count *)*((void *)this + 1);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v3);
  }
}

void __staticWordForDictionaryString(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
}

void __staticWordForDictionaryStringLexiconID(uint64_t a1@<X0>, int a2@<W2>, uint64_t a3@<X8>)
{
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  KB::DictionaryContainer::derive_static_words();
  KB::String::String((KB::String *)a3);
  *(void *)(a3 + 48) = 0x3F80000000000000;
  *(_WORD *)(a3 + 32) = 0;
  *(_DWORD *)(a3 + 56) = 1065353216;
  KB::String::String((KB::String *)(a3 + 64));
  __asm { FMOV            V0.2S, #1.0 }
  *(void *)(a3 + 96) = _D0;
  *(_DWORD *)(a3 + 104) = 0;
  *(void *)(a3 + 152) = 0;
  *(_OWORD *)(a3 + 112) = 0u;
  *(_OWORD *)(a3 + 128) = 0u;
  *(_DWORD *)(a3 + 144) = 0;
  KB::String::String((KB::String *)(a3 + 160));
  *(_OWORD *)(a3 + 200) = 0u;
  *(unsigned char *)(a3 + 192) = 0;
  *(_OWORD *)(a3 + 216) = 0u;
  *(_DWORD *)(a3 + 232) = 1065353216;
  uint64_t v12 = v23;
  uint64_t v11 = v24;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  size_t v19 = ___Z40__staticWordForDictionaryStringLexiconIDRKN2KB6StringERKN3WTF6RefPtrINS_19DictionaryContainerEEEj_block_invoke;
  uint64_t v20 = &__block_descriptor_44_e10_B16__0r_v8l;
  uint64_t v21 = a1;
  int v22 = a2;
  uint64_t v13 = v18;
  if (v12 != v11)
  {
    while ((((uint64_t (*)(void *, uint64_t))v19)(v13, v12) & 1) == 0)
    {
      v12 += 240;
      if (v12 == v11)
      {
        uint64_t v12 = v11;
        break;
      }
    }
  }

  if (v12 != v24)
  {
    KB::String::operator=();
    KB::ByteString::operator=();
    uint64_t v14 = *(void *)(v12 + 48);
    *(_DWORD *)(a3 + 56) = *(_DWORD *)(v12 + 56);
    *(void *)(a3 + 48) = v14;
    KB::String::operator=();
    long long v15 = *(_OWORD *)(v12 + 96);
    long long v16 = *(_OWORD *)(v12 + 112);
    long long v17 = *(_OWORD *)(v12 + 144);
    *(_OWORD *)(a3 + 128) = *(_OWORD *)(v12 + 128);
    *(_OWORD *)(a3 + 144) = v17;
    *(_OWORD *)(a3 + 96) = v15;
    *(_OWORD *)(a3 + 112) = v16;
    KB::String::operator=();
    *(unsigned char *)(a3 + 192) = *(unsigned char *)(v12 + 192);
    if (v12 != a3)
    {
      *(_DWORD *)(a3 + 232) = *(_DWORD *)(v12 + 232);
      std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<unsigned long long,void *> *>>((void *)(a3 + 200), *(void **)(v12 + 216));
    }
  }
  uint64_t v26 = (void **)&v23;
  std::vector<KB::Word>::__destroy_vector::operator()[abi:nn180100](&v26);
}

void sub_23EFD9F1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, KB::String *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, char *a20)
{
  KB::String::~String(a10);
  if (*v21 >= 0xFu)
  {
    uint64_t v23 = *((void *)v20 + 5);
    if (v23) {
      MEMORY[0x2455C26D0](v23, 0x1000C8077774924);
    }
  }
  KB::String::~String(v20);
  a20 = &a17;
  std::vector<KB::Word>::__destroy_vector::operator()[abi:nn180100]((void ***)&a20);
  _Unwind_Resume(a1);
}

BOOL ___Z40__staticWordForDictionaryStringLexiconIDRKN2KB6StringERKN3WTF6RefPtrINS_19DictionaryContainerEEEj_block_invoke(uint64_t a1, KB::Word *this)
{
  v7[4] = *MEMORY[0x263EF8340];
  KB::Word::capitalized_string(v7, this);
  if (KB::String::equal((KB::String *)v7, *(const KB::String **)(a1 + 32)))
  {
    int v4 = *(_DWORD *)(a1 + 40);
    if (v4) {
      BOOL v5 = v4 == *((_DWORD *)this + 34);
    }
    else {
      BOOL v5 = 1;
    }
  }
  else
  {
    BOOL v5 = 0;
  }
  KB::String::~String((KB::String *)v7);
  return v5;
}

void sub_23EFDA044(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  KB::String::~String((KB::String *)va);
  _Unwind_Resume(a1);
}

void std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<unsigned long long,void *> *>>(void *a1, void *a2)
{
  uint64_t v4 = a1[1];
  if (!v4) {
    goto LABEL_7;
  }
  for (uint64_t i = 0; i != v4; ++i)
    *(void *)(*a1 + 8 * i) = 0;
  uint64_t v6 = (void *)a1[2];
  a1[2] = 0;
  a1[3] = 0;
  if (v6)
  {
    while (a2)
    {
      unint64_t v7 = a2[2];
      v6[2] = v7;
      uint64_t v8 = (void *)*v6;
      v6[1] = v7;
      inserted = std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__node_insert_multi_prepare((uint64_t)a1, v7, v6 + 2);
      std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__node_insert_multi_perform(a1, v6, inserted);
      a2 = (void *)*a2;
      uint64_t v6 = v8;
      if (!v8) {
        goto LABEL_7;
      }
    }
    do
    {
      uint64_t v13 = (void *)*v6;
      operator delete(v6);
      uint64_t v6 = v13;
    }
    while (v13);
  }
  else
  {
LABEL_7:
    while (a2)
    {
      uint8x8_t v10 = operator new(0x18uLL);
      void *v10 = 0;
      unint64_t v11 = a2[2];
      v10[2] = v11;
      v10[1] = v11;
      uint64_t v12 = std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__node_insert_multi_prepare((uint64_t)a1, v11, v10 + 2);
      std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__node_insert_multi_perform(a1, v10, v12);
      a2 = (void *)*a2;
    }
  }
}

void sub_23EFDA150(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void KB::Word::~Word(KB::Word *this)
{
  std::__hash_table<std::__hash_value_type<unsigned int,float>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,float>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,float>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,float>>>::~__hash_table((uint64_t)this + 200);
  KB::String::~String((KB::Word *)((char *)this + 160));
  KB::String::~String((KB::Word *)((char *)this + 64));
  if (*((unsigned __int16 *)this + 16) >= 0xFu)
  {
    uint64_t v2 = *((void *)this + 5);
    if (v2) {
      MEMORY[0x2455C26D0](v2, 0x1000C8077774924);
    }
  }
  KB::String::~String(this);
}

void std::vector<KB::Word>::__destroy_vector::operator()[abi:nn180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (char *)**a1;
  if (v2)
  {
    uint64_t v4 = (char *)v1[1];
    BOOL v5 = v2;
    if (v4 != v2)
    {
      do
        KB::Word::~Word((KB::Word *)(v4 - 240));
      while (v4 != v2);
      BOOL v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void *std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__node_insert_multi_prepare(uint64_t a1, unint64_t a2, void *a3)
{
  unint64_t v6 = *(void *)(a1 + 8);
  float v7 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v8 = *(float *)(a1 + 32);
  if (!v6 || (float)(v8 * (float)v6) < v7)
  {
    BOOL v9 = 1;
    if (v6 >= 3) {
      BOOL v9 = (v6 & (v6 - 1)) != 0;
    }
    unint64_t v10 = v9 | (2 * v6);
    unint64_t v11 = vcvtps_u32_f32(v7 / v8);
    if (v10 <= v11) {
      int8x8_t prime = (int8x8_t)v11;
    }
    else {
      int8x8_t prime = (int8x8_t)v10;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
      unint64_t v6 = *(void *)(a1 + 8);
    }
    if (*(void *)&prime > v6) {
      goto LABEL_74;
    }
    if (*(void *)&prime >= v6) {
      goto LABEL_43;
    }
    unint64_t v19 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (v6 < 3 || (uint8x8_t v20 = (uint8x8_t)vcnt_s8((int8x8_t)v6), v20.i16[0] = vaddlv_u8(v20), v20.u32[0] > 1uLL))
    {
      unint64_t v19 = std::__next_prime(v19);
    }
    else
    {
      uint64_t v21 = 1 << -(char)__clz(v19 - 1);
      if (v19 >= 2) {
        unint64_t v19 = v21;
      }
    }
    if (*(void *)&prime <= v19) {
      int8x8_t prime = (int8x8_t)v19;
    }
    if (*(void *)&prime >= v6)
    {
      unint64_t v6 = *(void *)(a1 + 8);
      goto LABEL_43;
    }
    if (prime)
    {
LABEL_74:
      if (*(void *)&prime >> 61) {
        std::__throw_bad_array_new_length[abi:nn180100]();
      }
      uint64_t v13 = operator new(8 * *(void *)&prime);
      uint64_t v14 = *(void **)a1;
      *(void *)a1 = v13;
      if (v14) {
        operator delete(v14);
      }
      uint64_t v15 = 0;
      *(int8x8_t *)(a1 + 8) = prime;
      do
        *(void *)(*(void *)a1 + 8 * v15++) = 0;
      while (*(void *)&prime != v15);
      long long v16 = *(void **)(a1 + 16);
      if (v16)
      {
        unint64_t v17 = v16[1];
        uint8x8_t v18 = (uint8x8_t)vcnt_s8(prime);
        v18.i16[0] = vaddlv_u8(v18);
        if (v18.u32[0] > 1uLL)
        {
          if (v17 >= *(void *)&prime) {
            v17 %= *(void *)&prime;
          }
        }
        else
        {
          v17 &= *(void *)&prime - 1;
        }
        *(void *)(*(void *)a1 + 8 * v17) = a1 + 16;
        for (uint64_t i = (void *)*v16; *v16; uint64_t i = (void *)*v16)
        {
          unint64_t v23 = i[1];
          if (v18.u32[0] > 1uLL)
          {
            if (v23 >= *(void *)&prime) {
              v23 %= *(void *)&prime;
            }
          }
          else
          {
            v23 &= *(void *)&prime - 1;
          }
          if (v23 == v17)
          {
            long long v16 = i;
          }
          else
          {
            uint64_t v24 = i;
            if (*(void *)(*(void *)a1 + 8 * v23))
            {
              do
              {
                uint64_t v25 = v24;
                uint64_t v24 = (void *)*v24;
              }
              while (v24 && i[2] == v24[2]);
              void *v16 = v24;
              *uint64_t v25 = **(void **)(*(void *)a1 + 8 * v23);
              **(void **)(*(void *)a1 + 8 * v23) = i;
            }
            else
            {
              *(void *)(*(void *)a1 + 8 * v23) = v16;
              long long v16 = i;
              unint64_t v17 = v23;
            }
          }
        }
      }
      unint64_t v6 = (unint64_t)prime;
    }
    else
    {
      long long v35 = *(void **)a1;
      *(void *)a1 = 0;
      if (v35) {
        operator delete(v35);
      }
      unint64_t v6 = 0;
      *(void *)(a1 + 8) = 0;
    }
  }
LABEL_43:
  uint8x8_t v26 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
  v26.i16[0] = vaddlv_u8(v26);
  if (v26.u32[0] > 1uLL)
  {
    unint64_t v27 = a2;
    if (v6 <= a2) {
      unint64_t v27 = a2 % v6;
    }
  }
  else
  {
    unint64_t v27 = (v6 - 1) & a2;
  }
  uint64_t v28 = *(void **)(*(void *)a1 + 8 * v27);
  if (!v28) {
    return 0;
  }
  int v29 = 0;
  do
  {
    uint64_t result = v28;
    uint64_t v28 = (void *)*v28;
    if (!v28) {
      break;
    }
    unint64_t v31 = v28[1];
    if (v26.u32[0] > 1uLL)
    {
      unint64_t v32 = v28[1];
      if (v31 >= v6) {
        unint64_t v32 = v31 % v6;
      }
    }
    else
    {
      unint64_t v32 = v31 & (v6 - 1);
    }
    if (v32 != v27) {
      break;
    }
    BOOL v33 = v31 == a2 && v28[2] == *a3;
    int v34 = v29 & !v33;
    v29 |= v33;
  }
  while (v34 != 1);
  return result;
}

void *std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__node_insert_multi_perform(void *result, void *a2, void *a3)
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

id __createTemporaryDirectory()
{
  id v0 = __temporaryRootPath();
  uint64_t v1 = [MEMORY[0x263F08C38] UUID];
  uint64_t v2 = [v1 UUIDString];
  int8x8_t v3 = [v0 stringByAppendingPathComponent:v2];

  if (__createDirectoryAtPath(v3)) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

void sub_23EFDA738(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id __temporaryRootPath(void)
{
  if (__temporaryRootPath(void)::onceToken != -1) {
    dispatch_once(&__temporaryRootPath(void)::onceToken, &__block_literal_global_157);
  }
  id v0 = (void *)__temporaryRootPath(void)::path;
  return v0;
}

uint64_t __createDirectoryAtPath(void *a1)
{
  v10[1] = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v2 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v9 = *MEMORY[0x263F08078];
  v10[0] = &unk_26F2C9C78;
  int8x8_t v3 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  id v8 = 0;
  uint64_t v4 = [v2 createDirectoryAtPath:v1 withIntermediateDirectories:1 attributes:v3 error:&v8];
  id v5 = v8;

  if (v5) {
    char v6 = v4;
  }
  else {
    char v6 = 1;
  }
  if ((v6 & 1) == 0) {
    NSLog(&cfstr_FailedToCreate.isa, v5);
  }

  return v4;
}

void sub_23EFDA8C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZL19__temporaryRootPathv_block_invoke()
{
  id v0 = NSTemporaryDirectory();
  uint64_t v1 = [v0 stringByAppendingPathComponent:@"TextInputTests"];
  uint64_t v2 = (void *)__temporaryRootPath(void)::path;
  __temporaryRootPath(void)::path = v1;

  if (__remakeDirectoryAtPath((void *)__temporaryRootPath(void)::path)) {
    int8x8_t v3 = (void *)__temporaryRootPath(void)::path;
  }
  else {
    int8x8_t v3 = 0;
  }
  objc_storeStrong((id *)&__temporaryRootPath(void)::path, v3);
}

void sub_23EFDA974(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __remakeDirectoryAtPath(void *a1)
{
  id v1 = a1;
  __removeTemporaryDirectory(v1);
  uint64_t DirectoryAtPath = __createDirectoryAtPath(v1);

  return DirectoryAtPath;
}

void sub_23EFDA9C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __removeTemporaryDirectory(void *a1)
{
  id v1 = a1;
  if ([v1 length])
  {
    uint64_t v2 = [MEMORY[0x263F08850] defaultManager];
    id v7 = 0;
    uint64_t v3 = [v2 removeItemAtPath:v1 error:&v7];
    id v4 = v7;

    if (v4) {
      char v5 = v3;
    }
    else {
      char v5 = 1;
    }
    if ((v5 & 1) == 0) {
      NSLog(&cfstr_FailedToRemove.isa, v4);
    }
  }
  else
  {
    uint64_t v3 = 1;
  }

  return v3;
}

void sub_23EFDAA78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __installTestResources(void *a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v23 = a1;
  id v20 = a2;
  uint64_t v3 = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Tilanguagespec.isa)];
  uint64_t v4 = [v3 bundleURL];

  unint64_t v19 = (void *)v4;
  uint64_t v21 = [NSURL URLWithString:v20 relativeToURL:v4];
  char v5 = [MEMORY[0x263F08850] defaultManager];
  char v6 = [v5 contentsOfDirectoryAtURL:v21 includingPropertiesForKeys:0 options:1 error:0];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v6;
  id v7 = 0;
  uint64_t v8 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v26;
    LOBYTE(v10) = 1;
    while (1)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v13 = [v12 lastPathComponent];
        uint64_t v14 = [v23 stringByAppendingPathComponent:v13];

        uint64_t v15 = [NSURL fileURLWithPath:v14];
        if (v10)
        {
          long long v16 = [MEMORY[0x263F08850] defaultManager];
          id v24 = v7;
          uint64_t v10 = [v16 copyItemAtURL:v12 toURL:v15 error:&v24];
          id v17 = v24;

          id v7 = v17;
          if (v10) {
            goto LABEL_12;
          }
        }
        else
        {
          uint64_t v10 = 0;
        }
        if (v7) {
          NSLog(&cfstr_ProblemInstall.isa, v7);
        }
LABEL_12:
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (!v8) {
        goto LABEL_16;
      }
    }
  }
  uint64_t v10 = 1;
LABEL_16:

  return v10;
}

void sub_23EFDAD28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

id __pretrainedDynamicModelsPath(void)
{
  id v0 = __temporaryRootPath();
  id v1 = [v0 stringByAppendingPathComponent:@"PretrainedDynamicModels"];

  return v1;
}

void sub_23EFDAE3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __pretrainDynamicModelsForInputMode(void *a1)
{
  v12[8] = *MEMORY[0x263EF8340];
  id v1 = a1;
  if (__pretrainDynamicModelsForInputMode::onceToken != -1) {
    dispatch_once(&__pretrainDynamicModelsForInputMode::onceToken, &__block_literal_global);
  }
  id v2 = (id)__pretrainDynamicModelsForInputMode::pretrainedInputModes;
  objc_sync_enter(v2);
  if (([(id)__pretrainDynamicModelsForInputMode::pretrainedInputModes containsObject:v1] & 1) == 0)
  {
    uint64_t v3 = (void *)MEMORY[0x2455C2B00]();
    v11[0] = @"INPUT_MODE";
    v11[1] = @"USE_AUTOCORRECTION";
    v12[0] = v1;
    v12[1] = MEMORY[0x263EFFA80];
    v11[2] = @"USE_RETROCORRECTION";
    v11[3] = @"USE_AUTOCAPITALIZATION";
    v12[2] = MEMORY[0x263EFFA80];
    v12[3] = MEMORY[0x263EFFA88];
    v11[4] = @"WORD_LEARNING_ENABLED";
    v11[5] = @"KEYBOARD_WIDTH";
    v12[4] = MEMORY[0x263EFFA88];
    v12[5] = &unk_26F2C9C90;
    v12[6] = @"Portrait";
    v11[6] = @"KEYBOARD_ORIENTATION";
    v11[7] = @"CUSTOM_DYNAMIC_RESOURCE_PATH";
    uint64_t v4 = __pretrainedDynamicModelsPath();
    v12[7] = v4;
    char v5 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:8];

    char v6 = [[AutocorrectionTestHarness alloc] initWithAttributes:v5];
    uint64_t v7 = [&unk_26F2C9ED0 objectForKey:v1];
    uint64_t v8 = (void *)v7;
    uint64_t v9 = (void *)MEMORY[0x263EFFA68];
    if (v7) {
      uint64_t v9 = (void *)v7;
    }
    id v10 = v9;

    [(AutocorrectionTestHarness *)v6 trainWithCorpus:v10];
    LMLanguageModelPerformMaintenance();

    [(id)__pretrainDynamicModelsForInputMode::pretrainedInputModes addObject:v1];
  }
  objc_sync_exit(v2);
}

void sub_23EFDB050(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

uint64_t ____pretrainDynamicModelsForInputMode_block_invoke()
{
  __pretrainDynamicModelsForInputMode::pretrainedInputModes = [MEMORY[0x263EFF9C0] set];
  return MEMORY[0x270F9A758]();
}

uint64_t __installPretrainedDynamicModels(void *a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = NSURL;
  uint64_t v3 = __pretrainedDynamicModelsPath();
  uint8x8_t v18 = [v2 URLWithString:v3];

  uint64_t v4 = [MEMORY[0x263F08850] defaultManager];
  char v5 = [v4 contentsOfDirectoryAtURL:v18 includingPropertiesForKeys:0 options:1 error:0];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v5;
  char v6 = 0;
  uint64_t v7 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v22;
    LOBYTE(v9) = 1;
    while (1)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(obj);
        }
        unint64_t v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v12 = [v11 lastPathComponent];
        uint64_t v13 = [v1 stringByAppendingPathComponent:v12];

        uint64_t v14 = [NSURL fileURLWithPath:v13];
        if (v9)
        {
          uint64_t v15 = [MEMORY[0x263F08850] defaultManager];
          id v20 = v6;
          uint64_t v9 = [v15 copyItemAtURL:v11 toURL:v14 error:&v20];
          id v16 = v20;

          char v6 = v16;
          if (v9) {
            goto LABEL_12;
          }
        }
        else
        {
          uint64_t v9 = 0;
        }
        if (v6) {
          NSLog(&cfstr_ProblemInstall_0.isa, v6);
        }
LABEL_12:
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (!v7) {
        goto LABEL_16;
      }
    }
  }
  uint64_t v9 = 1;
LABEL_16:

  return v9;
}

void sub_23EFDB328(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

void __removeTemporaryDynamicDictionary(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if ([v3 length])
  {
    char v5 = dynamicFilePathForInputMode(v3, v4);
    char v6 = [MEMORY[0x263F08850] defaultManager];
    char v7 = [v6 fileExistsAtPath:v5];

    if (v7)
    {
      uint64_t v8 = [MEMORY[0x263F08850] defaultManager];
      id v11 = 0;
      char v9 = [v8 removeItemAtPath:v5 error:&v11];
      id v10 = v11;

      if ((v9 & 1) == 0) {
        NSLog(&cfstr_FailedToRemove_0.isa, v10);
      }
    }
  }
}

void sub_23EFDB4B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __removeTemporaryDynamicLanguageModel(void *a1)
{
  id v1 = a1;
  objc_msgSend(NSURL, "fileURLWithPath:");
  KB::LanguageModel::clear_dynamic_learning_bundles();
}

void sub_23EFDB54C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void ____removeTemporaryDynamicLanguageModel_block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    NSLog(&cfstr_FailedToRemove_1.isa);
  }
}

id __URLWithTextSamplesForInputMode(void *a1)
{
  id v1 = a1;
  id v2 = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Tilanguagespec.isa)];
  id v3 = [v2 bundleURL];

  id v4 = [NSString stringWithFormat:@"%@-corpus.txt", v1];
  char v5 = NSURL;
  char v6 = [@"TestCorpus" stringByAppendingPathComponent:v4];
  char v7 = [v5 URLWithString:v6 relativeToURL:v3];

  return v7;
}

void sub_23EFDB674(_Unwind_Exception *a1)
{
  char v5 = v4;

  _Unwind_Resume(a1);
}

id __URLWithPersonaForPersonaName(void *a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = objc_alloc_init(MEMORY[0x263F08850]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = [&unk_26F2C9D50 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v13;
LABEL_3:
    uint64_t v5 = 0;
    while (1)
    {
      if (*(void *)v13 != v4) {
        objc_enumerationMutation(&unk_26F2C9D50);
      }
      uint64_t v6 = *(void *)(*((void *)&v12 + 1) + 8 * v5);
      char v7 = [MEMORY[0x263F086E0] mainBundle];
      uint64_t v8 = [v7 URLForResource:v1 withExtension:v6 subdirectory:@"TestPersonas"];

      char v9 = [v8 path];
      char v10 = [v2 fileExistsAtPath:v9];

      if (v10) {
        break;
      }

      if (v3 == ++v5)
      {
        uint64_t v3 = [&unk_26F2C9D50 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v3) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    uint64_t v8 = 0;
  }

  return v8;
}

void sub_23EFDB850(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id __loadTextSamplesAtURL(void *a1)
{
  id v1 = a1;
  id v8 = 0;
  id v2 = [NSString stringWithContentsOfURL:v1 encoding:4 error:&v8];
  id v3 = v8;
  if (v3)
  {
    uint64_t v4 = [v1 path];
    NSLog(&cfstr_ProblemOpening.isa, v4, v3);
  }
  uint64_t v5 = [v2 componentsSeparatedByString:@"\n"];
  uint64_t v6 = [v5 filterWithBlock:&__block_literal_global_140];

  return v6;
}

void sub_23EFDB988(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

uint64_t ____loadTextSamplesAtURL_block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEqualToString:&stru_26F2B7E50] ^ 1;
}

id __loadTextSamplesForInputMode(NSString *a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  long long v15 = a1;
  id v1 = [MEMORY[0x263EFF980] array];
  id v16 = [NSString stringWithFormat:@"%@-corpus.txt", v15];
  id v2 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v17 = [v2 bundleURL];

  id v3 = NSURL;
  uint64_t v4 = [@"TestCorpus" stringByAppendingPathComponent:v16];
  uint64_t v5 = [v3 URLWithString:v4 relativeToURL:v17];

  id v22 = 0;
  uint64_t v6 = [NSString stringWithContentsOfURL:v5 encoding:4 error:&v22];
  id v7 = v22;
  if (v7)
  {
    id v8 = [v5 path];
    NSLog(&cfstr_ProblemOpening.isa, v8, v7);
  }
  if (v6)
  {
    [v6 componentsSeparatedByString:@"\n"];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v9);
          }
          long long v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if (([v13 isEqualToString:&stru_26F2B7E50] & 1) == 0) {
            [v1 addObject:v13];
          }
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v10);
    }
  }
  return v1;
}

void sub_23EFDBC4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_23EFDC988(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

BOOL isSpace(UTF32Char a1)
{
  CFCharacterSetRef Predefined = CFCharacterSetGetPredefined(kCFCharacterSetWhitespace);
  return CFCharacterSetIsLongCharacterMember(Predefined, a1) != 0;
}

uint64_t get_idx(int a1, int a2, int a3)
{
  return (a2 + a3 * a1);
}

id TIOptimalSequenceAlignment(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  int64_t v51 = a3;
  uint64_t v52 = v5;
  if ((unint64_t)[v5 count] > 0xFFFE
    || (unint64_t)[v6 count] > 0xFFFE
    || (uint64_t v7 = (unsigned __int16)([v5 count] + 1),
        uint64_t v8 = (unsigned __int16)([v6 count] + 1),
        v7 <= 1)
    && v8 < 2)
  {
    id v9 = (void *)MEMORY[0x263EFFA68];
    goto LABEL_6;
  }
  id v9 = (void *)MEMORY[0x263EFFA68];
  if (v7 && v8)
  {
    int v45 = v7 - 1;
    uint64_t v11 = (float *)malloc_type_malloc(8 * (v8 * v7), 0x100004000313F17uLL);
    *(void *)uint64_t v11 = 0;
    if (v7 >= 2)
    {
      long long v12 = v11;
      for (uint64_t i = 1; i != v7; ++i)
      {
        if (i == 1) {
          float v14 = 1.0;
        }
        else {
          float v14 = 0.8;
        }
        float v15 = v14 + *v12;
        v12 += 2 * v8;
        *long long v12 = v15;
        *((_WORD *)v12 + 2) = i;
        *((_WORD *)v12 + 3) = 1;
      }
    }
    unint64_t v46 = v11;
    uint64_t v48 = v8;
    if (v8 >= 2)
    {
      id v16 = (_WORD *)v11 + 7;
      float v17 = *v11;
      for (uint64_t j = 1; j != v8; ++j)
      {
        if (j == 1) {
          float v19 = 1.0;
        }
        else {
          float v19 = 0.8;
        }
        float v17 = v19 + v17;
        *(float *)(v16 - 3) = v17;
        *(v16 - 1) = j;
        _WORD *v16 = 2;
        v16 += 4;
      }
      uint64_t v20 = v7 - 1;
      uint64_t v21 = 2 * v8;
      uint64_t v49 = 1;
      uint64_t v50 = v11;
      int v47 = v7;
      do
      {
        if (v7 >= 2)
        {
          uint64_t v22 = 0;
          long long v23 = v50;
          do
          {
            uint64_t v24 = [v52 objectAtIndex:v22];
            id v25 = v6;
            uint64_t v26 = [v6 objectAtIndex:v49 - 1];
            int v27 = v51[2](v51, v24, v26);

            if (v27) {
              float v28 = 0.0;
            }
            else {
              float v28 = 1.0;
            }
            float v29 = v28 + *v23;
            if (*((_WORD *)v23 + 7) == 1) {
              float v30 = 0.8;
            }
            else {
              float v30 = 1.0;
            }
            float v31 = v23[2] + v30;
            unint64_t v32 = &v23[v21];
            if (HIWORD(v23[v21 + 1]) == 2) {
              float v33 = 0.8;
            }
            else {
              float v33 = 1.0;
            }
            float v34 = v23[2 * v48] + v33;
            if (v29 > v31 || v29 > v34)
            {
              if (v31 <= v34)
              {
                v32[2] = v31;
                *((_WORD *)v32 + 6) = *((_WORD *)v23 + 6) + 1;
                *((_WORD *)v32 + 7) = 1;
              }
              else
              {
                v32[2] = v34;
                *((_WORD *)v32 + 6) = LOWORD(v23[v21 + 1]) + 1;
                *((_WORD *)v32 + 7) = 2;
              }
            }
            else
            {
              v32[2] = v29;
              *((_WORD *)v32 + 6) = *((_WORD *)v23 + 2) + 1;
              *((_WORD *)v32 + 7) = 0;
            }
            id v6 = v25;
            ++v22;
            long long v23 = (float *)((char *)v23 + v21 * 4);
          }
          while (v20 != v22);
        }
        ++v49;
        v50 += 2;
        LODWORD(v7) = v47;
      }
      while (v49 != v48);
    }
    unsigned __int16 v36 = v48 - 1;
    int v37 = v45;
    uint64_t v38 = LOWORD(v46[2 * (v48 - 1 + v48 * v45) + 1]);
    id v9 = [MEMORY[0x263EFF980] arrayWithCapacity:v38];
    if (v38)
    {
      unsigned int v39 = 0;
      do
      {
        uint64_t v40 = objc_alloc_init(TIAlignedIndexes);
        [v9 addObject:v40];

        ++v39;
      }
      while (v39 < v38);
      uint64_t v41 = v38 + 1;
      while (1)
      {
        uint64_t v42 = [v9 objectAtIndex:v41 - 2];
        int64_t v43 = v42;
        int v44 = HIWORD(v46[2 * v48 * (unsigned __int16)v37 + 1 + 2 * v36]);
        if (v44 == 2) {
          break;
        }
        if (v44 == 1)
        {
          [v42 setIndex1:(unsigned __int16)v37 - 1];
          [v43 setIndex2:0xFFFFLL];
          --v37;
        }
        else if (!HIWORD(v46[2 * v48 * (unsigned __int16)v37 + 1 + 2 * v36]))
        {
          [v42 setIndex1:(unsigned __int16)v37 - 1];
          [v43 setIndex2:v36 - 1];
          --v37;
LABEL_55:
          --v36;
        }

        if (--v41 <= 1) {
          goto LABEL_57;
        }
      }
      [v42 setIndex1:0xFFFFLL];
      [v43 setIndex2:v36 - 1];
      goto LABEL_55;
    }
LABEL_57:
    free(v46);
  }
LABEL_6:

  return v9;
}

uint64_t nextTokenLocationInRange(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  if (a4 < 1) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v4 = a3 + 16 * a4;
  while (*(void *)a3 < a1)
  {
    a3 += 16;
    if (a3 >= v4) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  if (*(void *)a3 <= a1 + a2) {
    return *(void *)a3;
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

void targetKeyRangesForSourceTokens(void *a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v32 = a1;
  id v7 = a2;
  id v8 = a4;
  if ([v8 count])
  {
    unint64_t v9 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    unint64_t v12 = 0;
    float v29 = v8;
    do
    {
      long long v13 = objc_msgSend(v8, "objectAtIndex:", v11, v29);
      float v14 = [MEMORY[0x263F089D8] string];
      unint64_t v15 = [v14 length];
      unint64_t v16 = [v13 length];
      while (v15 < v16)
      {
        unint64_t v17 = v12 + 1;
        long long v18 = [v7 objectAtIndex:v12];
        [v14 appendString:v18];

        unint64_t v15 = [v14 length];
        unint64_t v16 = [v13 length];
        unint64_t v12 = v17;
      }
      uint64_t v31 = v11;
      uint64_t v19 = 0;
      unint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
      if (v9 < v12)
      {
        do
        {
          uint64_t v21 = [v32 objectAtIndex:v10];
          if ([v21 index1] == v9)
          {
            uint64_t v22 = v21;
          }
          else
          {
            do
            {
              uint64_t v22 = [v32 objectAtIndex:++v10];

              uint64_t v21 = v22;
            }
            while ([v22 index1] != v9);
          }
          unint64_t v23 = [v22 index2];
          uint64_t v24 = v19 + v20 - v23;
          if (v19 + v20 <= v23) {
            uint64_t v25 = v23 - v20 + 1;
          }
          else {
            uint64_t v25 = v19;
          }
          if (v23 < v20) {
            unint64_t v26 = v23;
          }
          else {
            unint64_t v26 = v20;
          }
          if (v23 >= v20) {
            uint64_t v24 = v25;
          }
          if (v20 == 0x7FFFFFFFFFFFFFFFLL) {
            unint64_t v27 = v23;
          }
          else {
            unint64_t v27 = v26;
          }
          if (v20 == 0x7FFFFFFFFFFFFFFFLL) {
            uint64_t v24 = 1;
          }
          if (v23 != 0xFFFF)
          {
            unint64_t v20 = v27;
            uint64_t v19 = v24;
          }

          ++v9;
        }
        while (v9 != v12);
      }
      float v28 = (unint64_t *)(a5 + 16 * v31);
      *float v28 = v20;
      v28[1] = v19;

      uint64_t v11 = v31 + 1;
      id v8 = v29;
      unint64_t v9 = v12;
    }
    while (v31 + 1 < (unint64_t)[v29 count]);
  }
}

void keyRangesForTokens(void *a1, void *a2, uint64_t a3)
{
  id v17 = a1;
  id v5 = a2;
  if ([v5 count])
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0;
    uint64_t v8 = 0;
    do
    {
      unint64_t v9 = [v5 objectAtIndex:v7];
      uint64_t v10 = [MEMORY[0x263F089D8] string];
      unint64_t v11 = [v10 length];
      if (v11 < [v9 length])
      {
        uint64_t v12 = v6;
        do
        {
          uint64_t v8 = v12 + 1;
          long long v13 = objc_msgSend(v17, "objectAtIndex:");
          [v10 appendString:v13];

          unint64_t v14 = [v10 length];
          unint64_t v15 = [v9 length];
          uint64_t v12 = v8;
        }
        while (v14 < v15);
      }
      unint64_t v16 = (void *)(a3 + 16 * v7);
      void *v16 = v6;
      v16[1] = v8 - v6;

      ++v7;
      uint64_t v6 = v8;
    }
    while (v7 < [v5 count]);
  }
}

uint64_t reconcileTargetKeyRangesForSourceTokensAndTargetTokens(uint64_t result, unint64_t a2, unint64_t *a3, uint64_t a4)
{
  unint64_t v4 = (unint64_t)&a3[2 * a4];
  unint64_t v5 = *(void *)(v4 - 8) + *(void *)(v4 - 16);
  if (a2)
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0;
    uint64_t v8 = (unint64_t *)(result + 16);
    unint64_t v9 = a2 - 1;
    do
    {
      uint64_t v10 = (unint64_t *)(result + 16 * v6);
      unint64_t v11 = *v10;
      if (*v10 == 0x7FFFFFFFFFFFFFFFLL)
      {
        unint64_t v12 = 0;
        unint64_t *v10 = v7;
        v10[1] = 0;
        unint64_t v11 = v7;
      }
      else
      {
        unint64_t v12 = v10[1];
      }
      uint64_t v13 = v6 + 1;
      unint64_t v14 = v9;
      unint64_t v15 = v8;
      unint64_t v16 = v5;
      if (v6 + 1 < a2)
      {
        while (1)
        {
          unint64_t v17 = *v15;
          v15 += 2;
          unint64_t v16 = v17;
          if (v17 != 0x7FFFFFFFFFFFFFFFLL) {
            break;
          }
          if (!--v14)
          {
            unint64_t v16 = v5;
            break;
          }
        }
      }
      unint64_t v18 = v12 + v11;
      if (v11 != v7)
      {
        unint64_t *v10 = v7;
        unint64_t v12 = v18 - v7;
        *(void *)(result + 16 * v6 + 8) = v18 - v7;
      }
      if (v16 != v18)
      {
        uint64_t v19 = a3;
        if (a4 < 1) {
          goto LABEL_22;
        }
        while (1)
        {
          unint64_t v20 = *v19;
          if (*v19 >= v18) {
            break;
          }
          v19 += 2;
          if ((unint64_t)v19 >= v4) {
            goto LABEL_22;
          }
        }
        if (v20 > v16 || v20 == 0x7FFFFFFFFFFFFFFFLL) {
LABEL_22:
        }
          unint64_t v20 = v16;
        unint64_t v12 = v20 - v7;
        *(void *)(result + 16 * v6 + 8) = v20 - v7;
      }
      v7 += v12;
      v8 += 2;
      --v9;
      ++v6;
    }
    while (v13 != a2);
  }
  else
  {
    unint64_t v7 = 0;
  }
  if (v7 < v5) {
    *(void *)(result + 16 * a2 - 8) = v5 - *(void *)(result + 16 * a2 - 16);
  }
  return result;
}

void TITargetKeyRangesForSourceTokens(void *a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v11 = a1;
  id v12 = a2;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  if ([v14 count])
  {
    unint64_t v16 = 0;
    long long v20 = xmmword_23F04A3D0;
    do
      *(_OWORD *)(a6 + 16 * v16++) = v20;
    while (v16 < objc_msgSend(v14, "count", v20));
  }
  if ([v14 count] && objc_msgSend(v15, "count"))
  {
    if ([v14 count])
    {
      unint64_t v18 = 0;
      long long v20 = xmmword_23F04A3D0;
      do
        *(_OWORD *)(a6 + 16 * v18++) = v20;
      while (v18 < objc_msgSend(v14, "count", v20));
    }
    targetKeyRangesForSourceTokens(v11, v12, v17, v14, a6);
    [v15 count];
    uint64_t v19 = (unint64_t *)(&v20 - MEMORY[0x270FA5388]());
    keyRangesForTokens(v13, v15, (uint64_t)v19);
    reconcileTargetKeyRangesForSourceTokensAndTargetTokens(a6, [v14 count], v19, objc_msgSend(v15, "count"));
  }
}

uint64_t boundaryErrorForStrings(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if ([v3 length]) {
    uint64_t v5 = objc_msgSend(v3, "characterAtIndex:", objc_msgSend(v3, "length") - 1);
  }
  else {
    uint64_t v5 = 0;
  }
  if ([v4 length]) {
    uint64_t v6 = [v4 characterAtIndex:0];
  }
  else {
    uint64_t v6 = 0;
  }
  unint64_t v7 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  if ([v7 characterIsMember:v5])
  {
    int v8 = 0;
  }
  else
  {
    unint64_t v9 = [MEMORY[0x263F08708] punctuationCharacterSet];
    int v8 = [v9 characterIsMember:v5] ^ 1;
  }
  uint64_t v10 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  if ([v10 characterIsMember:v6])
  {
    unsigned int v11 = 0;
  }
  else
  {
    id v12 = [MEMORY[0x263F08708] punctuationCharacterSet];
    unsigned int v11 = [v12 characterIsMember:v6] ^ 1;
  }
  return v8 & v11;
}

id alignedSourceTokensAndTargetKeys(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v25 = a2;
  uint64_t v6 = [MEMORY[0x263EFF980] array];
  if ([v5 count])
  {
    unint64_t v7 = 0;
    uint64_t v24 = (void *)(a3 + 8);
    do
    {
      int v8 = [v5 objectAtIndex:v7];
      unint64_t v9 = (void *)[v8 copy];

      uint64_t v10 = (unint64_t *)(a3 + 16 * v7);
      unint64_t v11 = *v10;
      id v12 = &stru_26F2B7E50;
      if (*v10 != 0x7FFFFFFFFFFFFFFFLL)
      {
        id v13 = v6;
        uint64_t v14 = a3;
        unint64_t v15 = v10[1];
        unint64_t v16 = v25;
        if (v15 + v11 > [v25 count])
        {
          uint64_t v17 = [MEMORY[0x263F089D8] string];
          [v17 appendFormat:@"WARNING! targetKeyRange [%lu, %lu] for token '%@' is out of bounds.", v11, v15 + v11, v9];
          [v17 appendFormat:@"\nsourceTokens:\n%@", v5];
          [v17 appendFormat:@"\ntargetKeys:\n%@", v25];
          [v17 appendFormat:@"\ntargetKeyRangeForSourceTokens = "];
          if ([v5 count])
          {
            unint64_t v18 = 0;
            uint64_t v19 = v24;
            do
            {
              [v17 appendFormat:@"[%lu, %lu]", *(v19 - 1), *v19 + *(v19 - 1)];
              ++v18;
              v19 += 2;
            }
            while (v18 < [v5 count]);
          }
          NSLog(&stru_26F2B8550.isa, v17);
          unint64_t v20 = [v25 count];
          if (v11 >= v20) {
            unint64_t v11 = v20;
          }
          unint64_t v15 = [v25 count] - v11;

          unint64_t v16 = v25;
        }
        a3 = v14;
        uint64_t v6 = v13;
        uint64_t v21 = objc_msgSend(v16, "subarrayWithRange:", v11, v15);
        id v12 = [v21 componentsJoinedByString:&stru_26F2B7E50];
      }
      uint64_t v22 = objc_alloc_init(TIAlignedTokens);
      [(TIAlignedTokens *)v22 setSource:v9];
      [(TIAlignedTokens *)v22 setTarget:v12];
      [v6 addObject:v22];

      ++v7;
    }
    while (v7 < [v5 count]);
  }

  return v6;
}

id TITokenAlignmentForKeyAlignment(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  v23[1] = *MEMORY[0x263EF8340];
  id v9 = a1;
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if ([v12 count])
  {
    if ([v13 count])
    {
      [v12 count];
      uint64_t v14 = &v21 - 2 * MEMORY[0x270FA5388]();
      TITargetKeyRangesForSourceTokens(v9, v10, v11, v12, v13, (uint64_t)v14);
      unint64_t v15 = alignedSourceTokensAndTargetKeys(v12, v11, (uint64_t)v14);
      goto LABEL_7;
    }
    unint64_t v16 = [v10 componentsJoinedByString:&stru_26F2B7E50];
    uint64_t v17 = objc_alloc_init(TIAlignedTokens);
    [(TIAlignedTokens *)v17 setSource:v16];
    [(TIAlignedTokens *)v17 setTarget:&stru_26F2B7E50];
    uint64_t v22 = v17;
    unint64_t v18 = (void *)MEMORY[0x263EFF8C0];
    uint64_t v19 = &v22;
  }
  else
  {
    unint64_t v16 = [v11 componentsJoinedByString:&stru_26F2B7E50];
    uint64_t v17 = objc_alloc_init(TIAlignedTokens);
    [(TIAlignedTokens *)v17 setSource:&stru_26F2B7E50];
    [(TIAlignedTokens *)v17 setTarget:v16];
    v23[0] = v17;
    unint64_t v18 = (void *)MEMORY[0x263EFF8C0];
    uint64_t v19 = (TIAlignedTokens **)v23;
  }
  unint64_t v15 = [v18 arrayWithObjects:v19 count:1];

LABEL_7:
  return v15;
}

id TICharSequenceForTokenSequence(void *a1)
{
  id v1 = (void *)MEMORY[0x263EFF980];
  id v2 = a1;
  id v3 = [v1 array];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __TICharSequenceForTokenSequence_block_invoke;
  v6[3] = &unk_26504FC08;
  id v4 = v3;
  id v7 = v4;
  [v2 enumerateObjectsUsingBlock:v6];

  return v4;
}

void __TICharSequenceForTokenSequence_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 length];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __TICharSequenceForTokenSequence_block_invoke_2;
  v5[3] = &unk_26504FA18;
  id v6 = *(id *)(a1 + 32);
  objc_msgSend(v3, "enumerateSubstringsInRange:options:usingBlock:", 0, v4, 2, v5);
}

uint64_t __TICharSequenceForTokenSequence_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

id TIAlignedTypingSequenceForAlignedTokenSequence(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a1;
  id v12 = a2;
  id v40 = a3;
  id v39 = a4;
  id v38 = a5;
  id v37 = a6;
  id v13 = [MEMORY[0x263EFF980] array];
  if ([v11 count])
  {
    uint64_t v14 = 0;
    unint64_t v15 = 0;
    while (1)
    {
      unint64_t v16 = [v11 objectAtIndex:v14];
      uint64_t v17 = [v16 source];
      if (![v17 length]) {
        break;
      }
      unint64_t v18 = [v12 count];

      if (v15 >= v18) {
        goto LABEL_7;
      }
      uint64_t v19 = objc_alloc_init(TIAlignedTyping);
      unint64_t v20 = [v16 source];
      [(TIAlignedTokens *)v19 setSource:v20];

      uint64_t v21 = [v40 objectAtIndex:v15];
      [(TIAlignedTyping *)v19 setTouched:v21];

      uint64_t v22 = [v39 objectAtIndex:v15];
      [(TIAlignedTyping *)v19 setPredicted:v22];

      unint64_t v23 = [v38 objectAtIndex:v15];
      [(TIAlignedTyping *)v19 setInlineCompletions:v23];

      uint64_t v24 = [v37 objectAtIndex:v15];
      [(TIAlignedTyping *)v19 setDocumentStates:v24];

      id v25 = [v12 objectAtIndex:v15];
      [(TIAlignedTyping *)v19 setInserted:v25];

      unint64_t v26 = [v16 target];
      [(TIAlignedTokens *)v19 setTarget:v26];

      [v13 addObject:v19];
      ++v15;
LABEL_8:

      if (++v14 >= (unint64_t)[v11 count]) {
        goto LABEL_11;
      }
    }

LABEL_7:
    uint64_t v19 = objc_alloc_init(TIAlignedTyping);
    unint64_t v27 = [v16 source];
    [(TIAlignedTokens *)v19 setSource:v27];

    float v28 = [MEMORY[0x263EFF8C0] array];
    [(TIAlignedTyping *)v19 setTouched:v28];

    float v29 = [MEMORY[0x263EFF8C0] array];
    [(TIAlignedTyping *)v19 setDocumentStates:v29];

    float v30 = [MEMORY[0x263EFF8C0] array];
    [(TIAlignedTyping *)v19 setInserted:v30];

    uint64_t v31 = [v16 target];
    [(TIAlignedTokens *)v19 setTarget:v31];

    [v13 addObject:v19];
    goto LABEL_8;
  }
  unint64_t v15 = 0;
LABEL_11:
  if (v15 == [v12 count]
    || v15 == [v12 count] - 1
    && ([v12 objectAtIndex:v15],
        id v32 = objc_claimAutoreleasedReturnValue(),
        [v32 componentsJoinedByString:&stru_26F2B7E50],
        float v33 = objc_claimAutoreleasedReturnValue(),
        int v34 = [v33 isEqualToString:&stru_26F2B7E50],
        v33,
        v32,
        v34))
  {
    id v35 = v13;
  }
  else
  {
    id v35 = 0;
  }

  return v35;
}

id TIConcatenateAlignedTypingAtBoundaryErrors(void *a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v29 = [MEMORY[0x263EFF980] array];
  id v2 = [MEMORY[0x263F089D8] string];
  float v33 = [MEMORY[0x263EFF980] array];
  id v3 = [MEMORY[0x263EFF980] array];
  uint64_t v4 = [MEMORY[0x263EFF980] array];
  id v5 = [MEMORY[0x263EFF980] array];
  id v6 = [MEMORY[0x263EFF980] array];
  id v7 = [MEMORY[0x263F089D8] string];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v1;
  uint64_t v32 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v32)
  {
    uint64_t v31 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        id v9 = v2;
        if (*(void *)v35 != v31) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        id v11 = [v10 target];
        int v12 = boundaryErrorForStrings(v7, v11);

        if (v12)
        {
          id v13 = [v10 source];
          id v2 = v9;
          [v9 appendString:v13];

          uint64_t v14 = [v10 touched];
          [v33 addObjectsFromArray:v14];

          unint64_t v15 = [v10 predicted];
          [v3 addObjectsFromArray:v15];

          unint64_t v16 = [v10 inlineCompletions];
          [v4 addObjectsFromArray:v16];

          uint64_t v17 = [v10 documentStates];
          [v5 addObjectsFromArray:v17];

          unint64_t v18 = [v10 inserted];
          [v6 addObjectsFromArray:v18];

          uint64_t v19 = [v10 target];
          [v7 appendString:v19];
        }
        else
        {
          id v2 = v9;
          if ([v9 length] || objc_msgSend(v6, "count") || objc_msgSend(v7, "length"))
          {
            unint64_t v20 = objc_alloc_init(TIAlignedTyping);
            [(TIAlignedTokens *)v20 setSource:v9];
            [(TIAlignedTyping *)v20 setTouched:v33];
            [(TIAlignedTyping *)v20 setPredicted:v3];
            [(TIAlignedTyping *)v20 setInlineCompletions:v4];
            [(TIAlignedTyping *)v20 setDocumentStates:v5];
            [(TIAlignedTyping *)v20 setInserted:v6];
            [(TIAlignedTokens *)v20 setTarget:v7];
            [v29 addObject:v20];
          }
          uint64_t v21 = [v10 source];
          [v9 setString:v21];

          [v33 removeAllObjects];
          uint64_t v22 = [v10 touched];
          [v33 addObjectsFromArray:v22];

          [v3 removeAllObjects];
          unint64_t v23 = [v10 predicted];
          [v3 addObjectsFromArray:v23];

          [v4 removeAllObjects];
          uint64_t v24 = [v10 inlineCompletions];
          [v4 addObjectsFromArray:v24];

          [v5 removeAllObjects];
          id v25 = [v10 documentStates];
          [v5 addObjectsFromArray:v25];

          [v6 removeAllObjects];
          unint64_t v26 = [v10 inserted];
          [v6 addObjectsFromArray:v26];

          uint64_t v19 = [v10 target];
          [v7 setString:v19];
        }
      }
      uint64_t v32 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v32);
  }

  if ([v2 length] || objc_msgSend(v6, "count") || objc_msgSend(v7, "length"))
  {
    unint64_t v27 = objc_alloc_init(TIAlignedTyping);
    [(TIAlignedTokens *)v27 setSource:v2];
    [(TIAlignedTyping *)v27 setTouched:v33];
    [(TIAlignedTyping *)v27 setPredicted:v3];
    [(TIAlignedTyping *)v27 setInlineCompletions:v4];
    [(TIAlignedTyping *)v27 setDocumentStates:v5];
    [(TIAlignedTyping *)v27 setInserted:v6];
    [(TIAlignedTokens *)v27 setTarget:v7];
    [v29 addObject:v27];
  }
  return v29;
}

uint64_t plistFormattedString(void *a1, const char *a2)
{
  return [a1 stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"];
}

id plistFormattedTouchSequence(void *a1)
{
  id v1 = (void *)MEMORY[0x263EFF980];
  id v2 = a1;
  id v3 = [v1 array];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __plistFormattedTouchSequence_block_invoke;
  v6[3] = &unk_26504FC08;
  id v4 = v3;
  id v7 = v4;
  [v2 enumerateObjectsUsingBlock:v6];

  return v4;
}

void __plistFormattedTouchSequence_block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"];
  [v2 addObject:v3];
}

id plistFormattedPredictionSequence(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (v1)
  {
    id v3 = v1;
  }
  else
  {
    id v3 = [MEMORY[0x263EFF980] array];
  }
  id v4 = v3;

  return v4;
}

id plistFormattedInlineCompletionsSequence(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (v1)
  {
    id v3 = v1;
  }
  else
  {
    id v3 = [MEMORY[0x263EFF980] array];
  }
  id v4 = v3;

  return v4;
}

__CFString *TIAutocorrectionTypeForNonAutocorrectedAlignmentEntry(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = a1;
  int v8 = [v6 isEqualToString:v7];
  int v9 = [v5 isEqualToString:v7];

  int v10 = [v5 isEqualToString:v6];
  int v11 = [v6 containsString:@"\\b"];

  int v12 = v9 ^ 1;
  if (((v8 ^ 1) & 1) == 0 && !v12) {
    return @"RightInput_NoAutocorrection";
  }
  if ((v8 | v12))
  {
    uint64_t v14 = @"WrongInput_NoAutocorrection_NoManualCorrection";
    if (v11) {
      uint64_t v14 = @"WrongInput_NoAutocorrection_WrongManualCorrection";
    }
    if (v8 | v9) {
      unint64_t v15 = @"UnknownType";
    }
    else {
      unint64_t v15 = v14;
    }
    unint64_t v16 = @"RightInput_NoAutocorrection_WrongManualCorrection";
    if (v10) {
      unint64_t v16 = @"UnknownType";
    }
    if (v11) {
      unint64_t v16 = @"RightInput_NoAutocorrection_But_WrongResult";
    }
    if ((v8 ^ 1 | v9)) {
      return v15;
    }
    else {
      return v16;
    }
  }
  else if (v11)
  {
    return @"WrongInput_NoAutocorrection_RightManualCorrection";
  }
  else
  {
    return @"WrongInput_NoAutocorrection_NoManualCorrection";
  }
}

__CFString *TIAutocorrectionTypeForAutocorrectedAlignmentEntry(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = a1;
  int v8 = [v6 isEqualToString:v7];
  int v9 = [v5 isEqualToString:v7];

  int v10 = [v5 isEqualToString:v6];
  int v11 = [v6 containsString:@"\\b"];

  int v12 = v9 ^ 1;
  if (((v8 ^ 1) & 1) == 0 && !v12) {
    return @"RightInput_NoAutocorrection";
  }
  if ((v8 | v12))
  {
    uint64_t v14 = @"UnknownType";
    unint64_t v15 = @"WrongInput_WrongAutocorrection";
    if (v10) {
      unint64_t v15 = @"WrongInput_NoAutocorrection";
    }
    if (v11) {
      unint64_t v15 = @"WrongInput_WrongManualCorrection";
    }
    if ((v8 | v9)) {
      unint64_t v16 = @"UnknownType";
    }
    else {
      unint64_t v16 = v15;
    }
    if (!v10) {
      uint64_t v14 = @"RightInput_WrongAutocorrection";
    }
    if (v11) {
      uint64_t v14 = @"RightInput_WrongAutocorrection_WrongManualCorrection";
    }
    if ((v8 ^ 1 | v9)) {
      return v16;
    }
    else {
      return v14;
    }
  }
  else if (v11)
  {
    return @"WrongInput_WrongAutocorrection_RightManualCorrection";
  }
  else
  {
    return @"WrongInput_RightAutocorrection";
  }
}

uint64_t TIAutoCorrectionTypeCorrectedIsNotIntended(void *a1)
{
  v6[6] = *MEMORY[0x263EF8340];
  v6[0] = @"RightInput_WrongAutocorrection";
  v6[1] = @"RightInput_WrongAutocorrection_WrongManualCorrection";
  v6[2] = @"WrongInput_NoAutocorrection";
  v6[3] = @"WrongInput_WrongAutocorrection";
  void v6[4] = @"WrongInput_WrongManualCorrection";
  void v6[5] = @"WrongInput_WrongAutocorrection_RightManualCorrection";
  id v1 = (void *)MEMORY[0x263EFF8C0];
  id v2 = a1;
  id v3 = [v1 arrayWithObjects:v6 count:6];
  uint64_t v4 = [v3 containsObject:v2];

  return v4;
}

uint64_t TIAutoCorrectionTypeCorrectedIsNotIntendedAndInserted(void *a1)
{
  void v6[4] = *MEMORY[0x263EF8340];
  v6[0] = @"RightInput_WrongAutocorrection";
  v6[1] = @"WrongInput_WrongAutocorrection";
  v6[2] = @"RightInput_WrongAutocorrection_WrongManualCorrection";
  v6[3] = @"WrongInput_WrongAutocorrection_RightManualCorrection";
  id v1 = (void *)MEMORY[0x263EFF8C0];
  id v2 = a1;
  id v3 = [v1 arrayWithObjects:v6 count:4];
  uint64_t v4 = [v3 containsObject:v2];

  return v4;
}

uint64_t TIAutoCorrectionTypeCorrectedIsNotInserted(void *a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v6 = @"WrongInput_RightAutocorrection";
  id v7 = @"RightInput_WrongAutocorrection";
  int v8 = @"WrongInput_WrongAutocorrection";
  int v9 = @"RightInput_WrongAutocorrection_WrongManualCorrection";
  int v10 = @"WrongInput_WrongAutocorrection_RightManualCorrection";
  id v1 = (void *)MEMORY[0x263EFF8C0];
  id v2 = a1;
  id v3 = [v1 arrayWithObjects:&v6 count:5];
  uint64_t v4 = objc_msgSend(v3, "containsObject:", v2, v6, v7, v8, v9, v10, v11);

  return v4;
}

id TIPlistFormattedAlignedTypingSequence(void *a1, char a2, char a3, char a4)
{
  id v7 = a1;
  int v8 = [MEMORY[0x263EFF980] array];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __TIPlistFormattedAlignedTypingSequence_block_invoke;
  v14[3] = &unk_26504FA40;
  id v15 = v7;
  char v17 = a3;
  char v18 = a2;
  char v19 = a4;
  id v9 = v8;
  id v16 = v9;
  id v10 = v7;
  [v10 enumerateObjectsUsingBlock:v14];
  uint64_t v11 = v16;
  id v12 = v9;

  return v12;
}

void __TIPlistFormattedAlignedTypingSequence_block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  v38[5] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = [v5 source];
  id v7 = [v5 inserted];
  int v8 = [v7 componentsJoinedByString:&stru_26F2B7E50];

  id v9 = [v5 target];
  if ([*(id *)(a1 + 32) count] - 1 <= a3)
  {
    id v10 = 0;
  }
  else
  {
    id v10 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3 + 1];
  }
  uint64_t v32 = v10;
  uint64_t v35 = a1;
  long long v36 = v6;
  float v33 = v9;
  if (([v10 isAutocompleteTriggerForPreviousEntry] & 1) != 0
    || ([v5 isRevisedAutocompleteEntry] & 1) != 0)
  {
    uint64_t v11 = TIAutocorrectionTypeForAutocorrectedAlignmentEntry(v6, v8, v9);
  }
  else
  {
    uint64_t v11 = TIAutocorrectionTypeForNonAutocorrectedAlignmentEntry(v6, v8, v9);
  }
  id v12 = (void *)v11;
  v37[0] = @"intended";
  id v13 = objc_msgSend(v5, "source", MEMORY[0x263EFF9A0]);
  uint64_t v14 = [v13 stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"];
  v38[0] = v14;
  v37[1] = @"touched";
  id v15 = [v5 touched];
  id v16 = plistFormattedTouchSequence(v15);
  v38[1] = v16;
  v37[2] = @"inserted";
  long long v34 = v8;
  char v17 = [v8 stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"];
  v38[2] = v17;
  v37[3] = @"corrected";
  char v18 = [v5 target];
  char v19 = [v18 stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"];
  v37[4] = @"autocorrectionType";
  v38[3] = v19;
  v38[4] = v12;
  uint64_t v31 = v12;
  unint64_t v20 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:5];
  uint64_t v21 = [v30 dictionaryWithDictionary:v20];

  if (*(unsigned char *)(v35 + 48))
  {
    uint64_t v22 = [v5 documentStates];
    [v21 setObject:v22 forKeyedSubscript:@"documentStates"];
  }
  unint64_t v23 = [v5 sourceTransliteration];

  if (v23)
  {
    uint64_t v24 = [v5 sourceTransliteration];
    id v25 = [v24 stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"];
    [v21 setObject:v25 forKeyedSubscript:@"intendedTransliteration"];
  }
  if (*(unsigned char *)(v35 + 49))
  {
    unint64_t v26 = [v5 predicted];
    unint64_t v27 = plistFormattedPredictionSequence(v26);
    [v21 setObject:v27 forKeyedSubscript:@"predicted"];
  }
  if (*(unsigned char *)(v35 + 50))
  {
    float v28 = [v5 inlineCompletions];
    id v29 = plistFormattedInlineCompletionsSequence(v28);
    [v21 setObject:v29 forKeyedSubscript:@"inlineCompletions"];
  }
  [*(id *)(v35 + 40) addObject:v21];
}

void sub_23EFDFE98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_23EFE0504(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, std::__shared_weak_count *a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  std::unique_ptr<std::__hash_node<std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>,void *>>>>::reset[abi:nn180100](&a12);
  std::pair<KB::String const,std::shared_ptr<KB::AppTrieLoader>>::~pair((KB::String *)&a15);
  if (a11) {
    std::__shared_weak_count::__release_shared[abi:nn180100](a11);
  }
  KB::String::~String((KB::String *)&a33);
  KB::String::~String((KB::String *)(v33 - 160));

  KB::String::~String((KB::String *)(v33 - 128));
  _Unwind_Resume(a1);
}

void *std::__hash_table<std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>,std::__unordered_map_hasher<KB::String,std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>,std::hash<KB::String>,std::equal_to<KB::String>,true>,std::__unordered_map_equal<KB::String,std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>,std::equal_to<KB::String>,std::hash<KB::String>,true>,std::allocator<std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>>>::find<KB::String>(void *a1, void *a2)
{
  if (a2[1]) {
    uint64_t v4 = (KB::String *)a2[1];
  }
  else {
    uint64_t v4 = (KB::String *)(a2 + 2);
  }
  unsigned int v5 = KB::String::hash(v4, (const char *)*(unsigned __int16 *)a2);
  unint64_t v6 = a1[1];
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v5;
  uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
  v8.i16[0] = vaddlv_u8(v8);
  unint64_t v9 = v8.u32[0];
  if (v8.u32[0] > 1uLL)
  {
    unint64_t v10 = v5;
    if (v6 <= v5) {
      unint64_t v10 = v5 % v6;
    }
  }
  else
  {
    unint64_t v10 = (v6 - 1) & v5;
  }
  uint64_t v11 = *(void **)(*a1 + 8 * v10);
  if (!v11) {
    return 0;
  }
  id v12 = (void *)*v11;
  if (*v11)
  {
    do
    {
      unint64_t v13 = v12[1];
      if (v13 == v7)
      {
        if (v12 + 2 == a2 || (KB::String::equal((KB::String *)(v12 + 2), (const KB::String *)a2) & 1) != 0) {
          return v12;
        }
      }
      else
      {
        if (v9 > 1)
        {
          if (v13 >= v6) {
            v13 %= v6;
          }
        }
        else
        {
          v13 &= v6 - 1;
        }
        if (v13 != v10) {
          return 0;
        }
      }
      id v12 = (void *)*v12;
    }
    while (v12);
  }
  return v12;
}

void std::pair<KB::String const,std::shared_ptr<KB::AppTrieLoader>>::~pair(KB::String *this)
{
  id v2 = (std::__shared_weak_count *)*((void *)this + 5);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v2);
  }
  KB::String::~String(this);
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>,void *>>>>::reset[abi:nn180100](uint64_t *a1)
{
  uint64_t v1 = *a1;
  *a1 = 0;
  if (v1)
  {
    if (*((unsigned char *)a1 + 16)) {
      std::pair<KB::String const,std::shared_ptr<KB::AppTrieLoader>>::~pair((KB::String *)(v1 + 16));
    }
    operator delete((void *)v1);
  }
}

void sub_23EFE0DCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, std::__shared_weak_count *a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  std::unique_ptr<std::__hash_node<std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>,void *>>>>::reset[abi:nn180100](&a12);
  std::pair<KB::String const,std::shared_ptr<KB::AppTrieLoader>>::~pair((KB::String *)&a15);
  if (a11) {
    std::__shared_weak_count::__release_shared[abi:nn180100](a11);
  }
  KB::String::~String((KB::String *)&a33);
  KB::String::~String((KB::String *)(v33 - 160));

  KB::String::~String((KB::String *)(v33 - 128));
  _Unwind_Resume(a1);
}

void sub_23EFE0F20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23EFE0F80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23EFE113C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose((const void *)(v11 - 96), 8);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *___ZL46getLXLexiconEnumerateEntriesForStringSymbolLocv_block_invoke(uint64_t a1)
{
  id v2 = (void *)LexiconLibrary();
  uint64_t result = dlsym(v2, "LXLexiconEnumerateEntriesForString");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getLXLexiconEnumerateEntriesForStringSymbolLoc(void)::ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                           + 24);
  return result;
}

uint64_t LexiconLibrary(void)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!LexiconLibraryCore(char **)::frameworkLibrary)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = ___ZL18LexiconLibraryCorePPc_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_26504FAD8;
    uint64_t v5 = 0;
    LexiconLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
    uint64_t v1 = (void *)v3[0];
    uint64_t v0 = LexiconLibraryCore(char **)::frameworkLibrary;
    if (LexiconLibraryCore(char **)::frameworkLibrary)
    {
      if (!v3[0]) {
        return v0;
      }
    }
    else
    {
      uint64_t v1 = (void *)abort_report_np();
    }
    free(v1);
    return v0;
  }
  return LexiconLibraryCore(char **)::frameworkLibrary;
}

uint64_t ___ZL18LexiconLibraryCorePPc_block_invoke()
{
  uint64_t result = _sl_dlopen();
  LexiconLibraryCore(char **)::frameworkLibrary = result;
  return result;
}

void *___ZL29getLXEntryCopyStringSymbolLocv_block_invoke(uint64_t a1)
{
  id v2 = (void *)LexiconLibrary();
  uint64_t result = dlsym(v2, "LXEntryCopyString");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getLXEntryCopyStringSymbolLoc(void)::ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_23EFE15A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_23EFE16D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23EFE17B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23EFE18F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)TITransientLexiconManagerMock;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void sub_23EFE1D94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

id getkLXLexiconNameKey(void)
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getkLXLexiconNameKeySymbolLoc(void)::ptr;
  uint64_t v8 = getkLXLexiconNameKeySymbolLoc(void)::ptr;
  if (!getkLXLexiconNameKeySymbolLoc(void)::ptr)
  {
    uint64_t v1 = (void *)LexiconLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kLXLexiconNameKey");
    getkLXLexiconNameKeySymbolLoc(void)::ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    dlerror();
    long long v4 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

id getkLXLexiconLocaleKey(void)
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getkLXLexiconLocaleKeySymbolLoc(void)::ptr;
  uint64_t v8 = getkLXLexiconLocaleKeySymbolLoc(void)::ptr;
  if (!getkLXLexiconLocaleKeySymbolLoc(void)::ptr)
  {
    uint64_t v1 = (void *)LexiconLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kLXLexiconLocaleKey");
    getkLXLexiconLocaleKeySymbolLoc(void)::ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    dlerror();
    long long v4 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

uint64_t __LXLexiconCreateTransient(const __CFDictionary *a1, __CFError **a2)
{
  uint64_t v8 = 0;
  unint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  long long v4 = (uint64_t (*)(const __CFDictionary *, __CFError **))getLXLexiconCreateTransientSymbolLoc(void)::ptr;
  uint64_t v11 = getLXLexiconCreateTransientSymbolLoc(void)::ptr;
  if (!getLXLexiconCreateTransientSymbolLoc(void)::ptr)
  {
    uint64_t v5 = (void *)LexiconLibrary();
    v9[3] = (uint64_t)dlsym(v5, "LXLexiconCreateTransient");
    getLXLexiconCreateTransientSymbolLoc(void)::ptr = (_UNKNOWN *)v9[3];
    long long v4 = (uint64_t (*)(const __CFDictionary *, __CFError **))v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v4)
  {
    dlerror();
    uint64_t v7 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v8, 8);
    _Unwind_Resume(v7);
  }
  return v4(a1, a2);
}

void *___ZL36getLXLexiconCreateTransientSymbolLocv_block_invoke(uint64_t a1)
{
  id v2 = (void *)LexiconLibrary();
  uint64_t result = dlsym(v2, "LXLexiconCreateTransient");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getLXLexiconCreateTransientSymbolLoc(void)::ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *___ZL31getkLXLexiconLocaleKeySymbolLocv_block_invoke(uint64_t a1)
{
  id v2 = (void *)LexiconLibrary();
  uint64_t result = dlsym(v2, "kLXLexiconLocaleKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkLXLexiconLocaleKeySymbolLoc(void)::ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *___ZL29getkLXLexiconNameKeySymbolLocv_block_invoke(uint64_t a1)
{
  id v2 = (void *)LexiconLibrary();
  uint64_t result = dlsym(v2, "kLXLexiconNameKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkLXLexiconNameKeySymbolLoc(void)::ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_23EFE242C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void *___ZL24getLXLexiconAddSymbolLocv_block_invoke(uint64_t a1)
{
  id v2 = (void *)LexiconLibrary();
  uint64_t result = dlsym(v2, "LXLexiconAdd");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getLXLexiconAddSymbolLoc(void)::ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *___ZL40getLXLexiconIncrementUsageCountSymbolLocv_block_invoke(uint64_t a1)
{
  id v2 = (void *)LexiconLibrary();
  uint64_t result = dlsym(v2, "LXLexiconIncrementUsageCount");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getLXLexiconIncrementUsageCountSymbolLoc(void)::ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_23EFE25BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23EFE27B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23EFE28E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void _TIBeginMockingTransientLexiconManagerWithData(void *a1, void *a2)
{
  id v7 = a1;
  id v3 = a2;
  if ((__missingTransientLexiconManager & 1) == 0)
  {
    Class v4 = NSClassFromString(&cfstr_Titransientlex_0.isa);
    if (v4)
    {
      uint64_t v5 = [[TITransientLexiconManagerMock alloc] initWithTransientData:v7 namedEntities:v3];
      uint64_t v6 = (void *)__transientLexiconManagerMock;
      __transientLexiconManagerMock = (uint64_t)v5;

      [(objc_class *)v4 setSharedTITransientLexiconManager:__transientLexiconManagerMock];
    }
    else
    {
      __missingTransientLexiconManager = 1;
    }
  }
}

void sub_23EFE29BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t _TISetNewContactCollectionForMockingTransientLexiconManager(uint64_t a1)
{
  return [(id)__transientLexiconManagerMock setNewContactCollection:a1];
}

void _TIEndMockingTransientLexiconManager()
{
  if ((__missingTransientLexiconManager & 1) == 0)
  {
    [NSClassFromString(&cfstr_Titransientlex_0.isa) setSharedTITransientLexiconManager:0];
    uint64_t v0 = (void *)__transientLexiconManagerMock;
    __transientLexiconManagerMock = 0;
  }
}

id _TIConvertTIMockContactCollection(void *a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v16 = a1;
  uint64_t v1 = [MEMORY[0x263EFF9A0] dictionary];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = v16;
  uint64_t v2 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v19 != v3) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v6 = objc_alloc(MEMORY[0x263F4BE08]);
        id v7 = [v5 firstName];
        uint64_t v8 = [v5 middleName];
        unint64_t v9 = [v5 lastName];
        uint64_t v10 = [v5 nickName];
        [v5 relevancyScore];
        id v12 = (void *)[v6 initWithFirstName:v7 phoneticFirstName:0 middleName:v8 phoneticMiddleName:0 lastName:v9 phoneticLastName:0 organizationName:v11 jobTitle:0 nickname:0 relations:v10 streets:0 cities:0 score:0];

        unint64_t v13 = [MEMORY[0x263F08C38] UUID];
        uint64_t v14 = [v13 UUIDString];
        [v1 setObject:v12 forKey:v14];
      }
      uint64_t v2 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v2);
  }

  return v1;
}

void sub_23EFE2C50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

uint64_t _TIMockingTransientLexiconManagerOfferedCount()
{
  return [(id)__transientLexiconManagerMock offeredCount];
}

uint64_t _TIMockingTransientLexiconManagerAcceptedCount()
{
  return [(id)__transientLexiconManagerMock acceptedCount];
}

void sub_23EFE4B88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__735(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__736(uint64_t a1)
{
}

void sub_23EFE5828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
}

void std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::destroy(void *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::destroy(*a1);
    std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::destroy(a1[1]);
    operator delete(a1);
  }
}

void sub_23EFE5A6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *a32)
{
  std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::destroy(a27);
  std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::destroy(a32);
  std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::destroy(*(void **)(v32 - 112));
  _Unwind_Resume(a1);
}

void sub_23EFE5C08(_Unwind_Exception *a1)
{
  MEMORY[0x2455C26F0](v1, 0x1020C40FAF5D19FLL);
  _Unwind_Resume(a1);
}

void sub_23EFE5D38(_Unwind_Exception *a1)
{
  MEMORY[0x2455C26F0](v1, 0x1020C40FAF5D19FLL);
  _Unwind_Resume(a1);
}

void sub_23EFE5E60(_Unwind_Exception *a1)
{
  MEMORY[0x2455C26F0](v1, 0x1020C40FAF5D19FLL);
  _Unwind_Resume(a1);
}

void sub_23EFE5F7C(_Unwind_Exception *a1)
{
  MEMORY[0x2455C26F0](v1, 0x1020C40FAF5D19FLL);
  _Unwind_Resume(a1);
}

void sub_23EFE60C8(_Unwind_Exception *a1)
{
  MEMORY[0x2455C26F0](v1, 0x1020C40FAF5D19FLL);
  _Unwind_Resume(a1);
}

void sub_23EFE61E0(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;
  MEMORY[0x2455C26F0](v3, 0x1020C40FAF5D19FLL);

  _Unwind_Resume(a1);
}

void sub_23EFE6394(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_23EFE6ADC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,void *a27,void *a28,void *a29,void *a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,void *a35,void *a36,void *a37,void *a38,void *a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,void *a44,void *a45,void *a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,void *a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,void *a56,void *a57,void *a58,void *a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a67, 8);
  _Block_object_dispose((const void *)(v73 - 184), 8);

  _Unwind_Resume(a1);
}

void sub_23EFE6CD0()
{
}

void sub_23EFE6CD8()
{
}

void sub_23EFE6CE4()
{
  JUMPOUT(0x23EFE6CC0);
}

void sub_23EFE6CF4()
{
}

__n128 __Block_byref_object_copy__805(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 48);
  long long v3 = *(_OWORD *)(a2 + 64);
  *(__n128 *)(a1 + 48) = result;
  *(_OWORD *)(a1 + 64) = v3;
  return result;
}

void sub_23EFE6E6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__32(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__33(uint64_t a1)
{
}

void sub_23EFE6F60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_23EFE7570(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,id a31,char a32)
{
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a32, 8);

  _Unwind_Resume(a1);
}

void sub_23EFE76D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_23EFE7D48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  _Unwind_Resume(a1);
}

void sub_23EFE8014(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23EFE8270(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__90(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__91(uint64_t a1)
{
}

void sub_23EFE8418(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_23EFE84E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_23EFE85D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_23EFE8704(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23EFE8888(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id TITestTyperTokensForString(void *a1, void *a2)
{
  long long v3 = a1;
  CFLocaleRef v4 = a2;
  uint64_t v5 = [MEMORY[0x263EFF980] array];
  if ([(__CFString *)v3 length])
  {
    CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    v22.length = [(__CFString *)v3 length];
    v22.location = 0;
    id v7 = CFStringTokenizerCreate(v6, v3, v22, 4uLL, v4);
    unint64_t v8 = 0;
    while (CFStringTokenizerAdvanceToNextToken(v7))
    {
      CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v7);
      while (v8 < CurrentTokenRange.location)
      {
        uint64_t v10 = [(__CFString *)v3 rangeOfComposedCharacterSequenceAtIndex:v8];
        uint64_t v12 = v10;
        if ((unint64_t)(v10 + v11) <= CurrentTokenRange.location) {
          CFIndex v13 = v11;
        }
        else {
          CFIndex v13 = CurrentTokenRange.location - v10;
        }
        uint64_t v14 = -[__CFString substringWithRange:](v3, "substringWithRange:", v10, v13);
        [v5 addObject:v14];
        unint64_t v8 = v13 + v12;
      }
      id v15 = -[__CFString substringWithRange:](v3, "substringWithRange:", CurrentTokenRange.location, CurrentTokenRange.length);
      [v5 addObject:v15];
      unint64_t v8 = CurrentTokenRange.location + CurrentTokenRange.length;
    }
    while (v8 < [(__CFString *)v3 length])
    {
      uint64_t v16 = [(__CFString *)v3 rangeOfComposedCharacterSequenceAtIndex:v8];
      uint64_t v18 = v17;
      long long v19 = -[__CFString substringWithRange:](v3, "substringWithRange:", v16, v17);
      [v5 addObject:v19];
      unint64_t v8 = v16 + v18;
    }
    CFRelease(v7);
  }

  return v5;
}

uint64_t TITestTyperWritePropertyListToFile(void *a1, void *a2)
{
  v24[1] = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [v4 URLByDeletingLastPathComponent];
  CFAllocatorRef v6 = [MEMORY[0x263F08850] defaultManager];
  id v22 = 0;
  int v7 = [v6 createDirectoryAtURL:v5 withIntermediateDirectories:1 attributes:0 error:&v22];
  id v8 = v22;

  if (!v7) {
    goto LABEL_9;
  }
  unint64_t v9 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v10 = [v4 path];
  CFIndex v11 = [MEMORY[0x263EFF8F8] data];
  uint64_t v23 = *MEMORY[0x263F080A8];
  v24[0] = *MEMORY[0x263F080B0];
  uint64_t v12 = [NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:1];
  int v13 = [v9 createFileAtPath:v10 contents:v11 attributes:v12];

  if (!v13) {
    goto LABEL_9;
  }
  uint64_t v14 = [MEMORY[0x263EFF9E0] outputStreamWithURL:v4 append:1];
  [v14 open];
  uint64_t v15 = [v14 streamError];

  if (v15)
  {
    BOOL v16 = 0;
    id v8 = (id)v15;
  }
  else
  {
    id v21 = 0;
    uint64_t v17 = [MEMORY[0x263F08900] writeJSONObject:v3 toStream:v14 options:0 error:&v21];
    id v8 = v21;
    BOOL v16 = v17 != 0;
  }
  [v14 close];

  if (v16 && !v8)
  {
    uint64_t v18 = 1;
  }
  else
  {
LABEL_9:
    long long v19 = [v4 path];
    NSLog(&cfstr_ErrorSerializi.isa, v19, v8);

    uint64_t v18 = 0;
  }

  return v18;
}

uint64_t TI::CP::ContinuousPathTestCase::ContinuousPathTestCase(uint64_t a1, atomic_uint **a2, const std::vector<unsigned int> *a3, uint64_t a4, const KB::LanguageModelContext *a5, uint64_t a6)
{
  uint64_t v10 = *a2;
  *(void *)a1 = *a2;
  if (v10) {
    atomic_fetch_add(v10, 1u);
  }
  TI::CP::Path::Path((std::vector<unsigned int> *)(a1 + 8), a3);
  MEMORY[0x2455C23B0](a1 + 56, a4);
  KB::LanguageModelContext::LanguageModelContext((KB::LanguageModelContext *)(a1 + 88), a5);
  MEMORY[0x2455C23B0](a1 + 192, a6);
  return a1;
}

void sub_23EFE9D78(_Unwind_Exception *a1)
{
  KB::LanguageModelContext::~LanguageModelContext(v4);
  KB::String::~String(v3);
  TI::CP::Path::~Path(v2);
  if (*v1) {
    WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(*v1);
  }
  _Unwind_Resume(a1);
}

std::vector<unsigned int> *TI::CP::Path::Path(std::vector<unsigned int> *this, const std::vector<unsigned int> *a2)
{
  this->__begin_ = 0;
  this->__end_ = 0;
  this->__end_cap_.__value_ = 0;
  std::vector<unsigned int>::pointer begin = a2->__begin_;
  std::__split_buffer<std::string>::pointer end = a2->__end_;
  int64_t v6 = (char *)end - (char *)a2->__begin_;
  if (end != a2->__begin_)
  {
    std::vector<TI::CP::PathSample>::__vallocate[abi:nn180100](this, 0xAAAAAAAAAAAAAAABLL * (v6 >> 4));
    std::vector<unsigned int>::pointer v7 = this->__end_;
    memmove(v7, begin, v6);
    this->__end_ = (std::vector<unsigned int>::pointer)((char *)v7 + v6);
  }
  std::vector<unsigned int>::vector(this + 1, a2 + 1);
  return this;
}

void sub_23EFE9E4C(_Unwind_Exception *exception_object)
{
  id v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

KB::LanguageModelContext *KB::LanguageModelContext::LanguageModelContext(KB::LanguageModelContext *this, const KB::LanguageModelContext *a2)
{
  uint64_t v4 = *((void *)a2 + 1);
  *(void *)this = *(void *)a2;
  *((void *)this + 1) = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  *((void *)this + 4) = 0;
  int64_t v6 = (unsigned char *)*((void *)a2 + 2);
  uint64_t v5 = (unsigned char *)*((void *)a2 + 3);
  int64_t v7 = v5 - v6;
  if (v5 != v6)
  {
    std::vector<TITokenID>::__vallocate[abi:nn180100]((void *)this + 2, v7 >> 3);
    id v8 = (char *)*((void *)this + 3);
    memmove(v8, v6, v7);
    *((void *)this + 3) = &v8[8 * (v7 >> 3)];
  }
  long long v9 = *(_OWORD *)((char *)a2 + 40);
  *((void *)this + 7) = *((void *)a2 + 7);
  *(_OWORD *)((char *)this + 40) = v9;
  language_modeling::v1::LinguisticContext::LinguisticContext();
  language_modeling::v1::LinguisticContext::LinguisticContext();
  *((void *)this + 10) = 0;
  *((void *)this + 11) = 0;
  *((void *)this + 12) = 0;
  CFIndex v11 = (long long *)*((void *)a2 + 10);
  uint64_t v10 = (long long *)*((void *)a2 + 11);
  if (v10 != v11)
  {
    std::vector<std::string>::__vallocate[abi:nn180100]((void *)this + 10, 0xAAAAAAAAAAAAAAABLL * (((char *)v10 - (char *)v11) >> 3));
    *((void *)this + 11) = std::__uninitialized_allocator_copy[abi:nn180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>(v11, v10, *((std::string **)this + 11));
  }
  return this;
}

void sub_23EFE9F78(_Unwind_Exception *a1)
{
  v1[11] = v5;
  language_modeling::v1::LinguisticContext::~LinguisticContext(v4);
  language_modeling::v1::LinguisticContext::~LinguisticContext(v3);
  int64_t v7 = *v2;
  if (*v2)
  {
    v1[3] = v7;
    operator delete(v7);
  }
  id v8 = (std::__shared_weak_count *)v1[1];
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v8);
  }
  _Unwind_Resume(a1);
}

void TI::CP::Path::~Path(TI::CP::Path *this)
{
  uint64_t v2 = (void *)*((void *)this + 3);
  if (v2)
  {
    *((void *)this + 4) = v2;
    operator delete(v2);
  }
  id v3 = *(void **)this;
  if (*(void *)this)
  {
    *((void *)this + 1) = v3;
    operator delete(v3);
  }
}

unsigned int *WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(unsigned int *result)
{
  uint64_t v1 = result;
  unsigned int v2 = atomic_load(result);
  if (v2 == 1)
  {
    KB::String::~String((KB::String *)(result + 52));
    std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::destroy(*((void **)v1 + 23));
    std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::destroy(*((void **)v1 + 20));
    id v3 = (void *)*((void *)v1 + 11);
    while (v3)
    {
      uint64_t v4 = v3;
      id v3 = (void *)*v3;
      uint64_t v5 = v4[4];
      if (v5) {
        WTF::RefCounted<TI::Favonius::Key>::deref(v5);
      }
      if (*((unsigned __int16 *)v4 + 8) >= 0xFu)
      {
        uint64_t v6 = v4[3];
        if (v6) {
          MEMORY[0x2455C26D0](v6, 0x1000C8077774924);
        }
      }
      operator delete(v4);
    }
    int64_t v7 = (void *)*((void *)v1 + 9);
    *((void *)v1 + 9) = 0;
    if (v7) {
      operator delete(v7);
    }
    id v8 = (void *)*((void *)v1 + 6);
    if (v8)
    {
      do
      {
        long long v9 = (void *)*v8;
        uint64_t v10 = v8[3];
        if (v10) {
          WTF::RefCounted<TI::Favonius::Key>::deref(v10);
        }
        operator delete(v8);
        id v8 = v9;
      }
      while (v9);
    }
    CFIndex v11 = (void *)*((void *)v1 + 4);
    *((void *)v1 + 4) = 0;
    if (v11) {
      operator delete(v11);
    }
    uint64_t v12 = *((void *)v1 + 1);
    if (v12)
    {
      uint64_t v13 = *((void *)v1 + 2);
      uint64_t v14 = (void *)*((void *)v1 + 1);
      if (v13 != v12)
      {
        do
        {
          uint64_t v16 = *(void *)(v13 - 8);
          v13 -= 8;
          uint64_t v15 = v16;
          if (v16) {
            WTF::RefCounted<TI::Favonius::Key>::deref(v15);
          }
        }
        while (v13 != v12);
        uint64_t v14 = (void *)*((void *)v1 + 1);
      }
      *((void *)v1 + 2) = v12;
      operator delete(v14);
    }
    JUMPOUT(0x2455C26F0);
  }
  atomic_fetch_add((atomic_uint *volatile)result, 0xFFFFFFFF);
  return result;
}

uint64_t WTF::RefCounted<TI::Favonius::Key>::deref(uint64_t result)
{
  uint64_t v1 = result;
  unsigned int v2 = atomic_load((unsigned int *)result);
  if (v2 == 1)
  {
    if (*(unsigned __int16 *)(result + 40) >= 0xFu)
    {
      uint64_t v3 = *(void *)(result + 48);
      if (v3) {
        MEMORY[0x2455C26D0](v3, 0x1000C8077774924);
      }
    }
    KB::String::~String((KB::String *)(v1 + 8));
    JUMPOUT(0x2455C26F0);
  }
  atomic_fetch_add((atomic_uint *volatile)result, 0xFFFFFFFF);
  return result;
}

char *std::vector<std::string>::__vallocate[abi:nn180100](void *a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    abort();
  }
  __n128 result = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::string>>(a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

std::string *std::__uninitialized_allocator_copy[abi:nn180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>(long long *a1, long long *a2, std::string *this)
{
  if (a1 != a2)
  {
    uint64_t v5 = a1;
    do
    {
      if (*((char *)v5 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)v5, *((void *)v5 + 1));
      }
      else
      {
        long long v6 = *v5;
        this->__r_.__value_.__r.__words[2] = *((void *)v5 + 2);
        *(_OWORD *)&this->__r_.__value_.__l.__data_ = v6;
      }
      uint64_t v5 = (long long *)((char *)v5 + 24);
      ++this;
    }
    while (v5 != a2);
  }
  return this;
}

char *std::vector<TITokenID>::__vallocate[abi:nn180100](void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    abort();
  }
  __n128 result = (char *)operator new(8 * a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * a2];
  return result;
}

std::vector<unsigned int> *__cdecl std::vector<unsigned int>::vector(std::vector<unsigned int> *this, const std::vector<unsigned int> *__x)
{
  this->__begin_ = 0;
  this->__end_ = 0;
  this->__end_cap_.__value_ = 0;
  std::vector<unsigned int>::pointer begin = __x->__begin_;
  std::__split_buffer<std::string>::pointer end = __x->__end_;
  int64_t v5 = (char *)end - (char *)__x->__begin_;
  if (end != __x->__begin_)
  {
    std::vector<unsigned int>::__vallocate[abi:nn180100](this, v5 >> 2);
    std::vector<unsigned int>::pointer v6 = this->__end_;
    memmove(v6, begin, v5);
    this->__end_ = (std::vector<unsigned int>::pointer)((char *)v6 + v5);
  }
  return this;
}

char *std::vector<unsigned int>::__vallocate[abi:nn180100](void *a1, unint64_t a2)
{
  if (a2 >> 62) {
    abort();
  }
  __n128 result = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>(a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>(unint64_t a1)
{
  if (a1 >> 62) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  return operator new(4 * a1);
}

char *std::vector<TI::CP::PathSample>::__vallocate[abi:nn180100](void *a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556) {
    abort();
  }
  uint64_t v3 = 3 * a2;
  __n128 result = (char *)operator new(48 * a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v3];
  return result;
}

TI::CP::ContinuousPathTestResult *TI::CP::ContinuousPathTestResult::ContinuousPathTestResult(TI::CP::ContinuousPathTestResult *this, int a2, const KB::String *a3, const KB::CandidateCollection *a4, int a5, char a6)
{
  *(_DWORD *)this = a2;
  uint64_t v10 = (TI::CP::ContinuousPathTestResult *)((char *)this + 40);
  MEMORY[0x2455C23B0]((char *)this + 8, a3);
  KB::CandidateCollection::CandidateCollection(v10, a4);
  *((_DWORD *)this + 36) = a5;
  *((void *)this + 24) = 0;
  *((void *)this + 23) = 0;
  *((void *)this + 22) = (char *)this + 184;
  *(int64x2_t *)((char *)this + 200) = vdupq_n_s64(0xFFF0000000000000);
  *((unsigned char *)this + 216) = a6;
  *(_DWORD *)((char *)this + 217) = 0;
  return this;
}

void sub_23EFEA4BC(_Unwind_Exception *a1)
{
  KB::String::~String(v1);
  _Unwind_Resume(a1);
}

KB::CandidateCollection *KB::CandidateCollection::CandidateCollection(KB::CandidateCollection *this, const KB::CandidateCollection *a2)
{
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *((void *)a2 + 1);
  if (v5 != *(void *)a2)
  {
    std::vector<KB::Candidate>::__vallocate[abi:nn180100](this, 0x1CAC083126E978D5 * ((v5 - *(void *)a2) >> 3));
    std::vector<KB::Candidate>::__construct_at_end<KB::Candidate*,KB::Candidate*>(this, v4, v5);
  }
  *((void *)this + 3) = 0;
  *((void *)this + 4) = 0;
  *((void *)this + 5) = 0;
  uint64_t v6 = *((void *)a2 + 3);
  uint64_t v7 = *((void *)a2 + 4);
  if (v7 != v6)
  {
    std::vector<KB::Candidate>::__vallocate[abi:nn180100]((void *)this + 3, 0x1CAC083126E978D5 * ((v7 - v6) >> 3));
    std::vector<KB::Candidate>::__construct_at_end<KB::Candidate*,KB::Candidate*>((KB::CandidateCollection *)((char *)this + 24), v6, v7);
  }
  *((void *)this + 6) = 0;
  *((void *)this + 7) = 0;
  *((void *)this + 8) = 0;
  uint64_t v8 = *((void *)a2 + 6);
  uint64_t v9 = *((void *)a2 + 7);
  if (v9 != v8)
  {
    std::vector<KB::Candidate>::__vallocate[abi:nn180100]((void *)this + 6, 0x1CAC083126E978D5 * ((v9 - v8) >> 3));
    std::vector<KB::Candidate>::__construct_at_end<KB::Candidate*,KB::Candidate*>((KB::CandidateCollection *)((char *)this + 48), v8, v9);
  }
  *((void *)this + 9) = 0;
  *((void *)this + 10) = 0;
  *((void *)this + 11) = 0;
  uint64_t v10 = *((void *)a2 + 9);
  uint64_t v11 = *((void *)a2 + 10);
  if (v11 != v10)
  {
    std::vector<KB::Candidate>::__vallocate[abi:nn180100]((void *)this + 9, 0x1CAC083126E978D5 * ((v11 - v10) >> 3));
    std::vector<KB::Candidate>::__construct_at_end<KB::Candidate*,KB::Candidate*>((KB::CandidateCollection *)((char *)this + 72), v10, v11);
  }
  *((void *)this + 12) = *((void *)a2 + 12);
  return this;
}

void sub_23EFEA63C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)va);
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)va);
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)va);
  _Unwind_Resume(a1);
}

void std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](void ***a1)
{
  uint64_t v1 = *a1;
  unsigned int v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    uint64_t v5 = v2;
    if ((void *)v4 != v2)
    {
      do
        uint64_t v4 = MEMORY[0x2455C2430](v4 - 1000);
      while ((void *)v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

char *std::vector<KB::Candidate>::__vallocate[abi:nn180100](void *a1, unint64_t a2)
{
  if (a2 >= 0x4189374BC6A7F0) {
    abort();
  }
  uint64_t v3 = 1000 * a2;
  __n128 result = (char *)operator new(1000 * a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[v3];
  return result;
}

KB::Candidate *std::vector<KB::Candidate>::__construct_at_end<KB::Candidate*,KB::Candidate*>(KB::Candidate *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = result;
  uint64_t v4 = *((void *)result + 1);
  if (a2 != a3)
  {
    uint64_t v7 = 0;
    do
    {
      __n128 result = KB::Candidate::Candidate((KB::Candidate *)(v4 + v7), (const KB::Candidate *)(a2 + v7));
      v7 += 1000;
    }
    while (a2 + v7 != a3);
    v4 += v7;
  }
  *((void *)v3 + 1) = v4;
  return result;
}

void sub_23EFEA7C4(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

KB::Candidate *KB::Candidate::Candidate(KB::Candidate *this, const KB::Candidate *a2)
{
  uint64_t v4 = *(void *)a2;
  *((void *)this + 1) = (char *)this + 24;
  *(void *)this = v4;
  unint64_t v5 = *((void *)a2 + 2);
  *((void *)this + 2) = 3;
  uint64_t v6 = (KB::Candidate *)((char *)this + 24);
  if (v5 < 4
    || (*((void *)this + 2) = v5,
        uint64_t v6 = (KB::Word *)malloc_type_malloc(240 * v5, 0x10B2040DF775671uLL),
        (*((void *)this + 1) = v6) != 0))
  {
    if (*(void *)a2)
    {
      uint64_t v7 = (const KB::Word *)*((void *)a2 + 1);
      uint64_t v8 = 240 * *(void *)a2;
      do
      {
        uint64_t v6 = (KB::Word *)((char *)KB::Word::Word(v6, v7) + 240);
        uint64_t v7 = (const KB::Word *)((char *)v7 + 240);
        v8 -= 240;
      }
      while (v8);
    }
  }
  long long v9 = *(_OWORD *)((char *)a2 + 744);
  long long v10 = *(_OWORD *)((char *)a2 + 760);
  *((void *)this + 97) = *((void *)a2 + 97);
  *(_OWORD *)((char *)this + 744) = v9;
  *(_OWORD *)((char *)this + 760) = v10;
  KB::LanguageModelContext::LanguageModelContext((KB::Candidate *)((char *)this + 784), (const KB::Candidate *)((char *)a2 + 784));
  MEMORY[0x2455C23B0]((char *)this + 888, (char *)a2 + 888);
  if (*((char *)a2 + 943) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)((char *)this + 920), *((const std::string::value_type **)a2 + 115), *((void *)a2 + 116));
  }
  else
  {
    long long v11 = *(_OWORD *)((char *)a2 + 920);
    *((void *)this + 117) = *((void *)a2 + 117);
    *(_OWORD *)((char *)this + 920) = v11;
  }
  KB::ByteString::copy();
  *((_OWORD *)this + 60) = *((_OWORD *)a2 + 60);
  uint64_t v12 = (const void *)*((void *)a2 + 122);
  *((void *)this + 122) = v12;
  if (v12)
  {
    CFRetain(v12);
    *((void *)this + 122) = v12;
  }
  uint64_t v13 = (const void *)*((void *)a2 + 123);
  *((void *)this + 123) = v13;
  if (v13)
  {
    CFRetain(v13);
    *((void *)this + 123) = v13;
  }
  *((_DWORD *)this + 248) = *((_DWORD *)a2 + 248);
  return this;
}

void sub_23EFEA948(_Unwind_Exception *a1)
{
  KB::String::~String(v3);
  KB::LanguageModelContext::~LanguageModelContext(v2);
  WTF::Vector<KB::Word,3ul>::~Vector(v1);
  _Unwind_Resume(a1);
}

uint64_t *WTF::Vector<KB::Word,3ul>::~Vector(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if (*a1)
  {
    uint64_t v3 = (KB::Word *)a1[1];
    uint64_t v4 = 240 * v2;
    do
    {
      KB::Word::~Word(v3);
      uint64_t v3 = (KB::Word *)(v5 + 240);
      v4 -= 240;
    }
    while (v4);
    *a1 = 0;
  }
  uint64_t v6 = (uint64_t *)a1[1];
  if (a1 + 3 != v6)
  {
    a1[1] = 0;
    a1[2] = 0;
    free(v6);
  }
  return a1;
}

KB::Word *KB::Word::Word(KB::Word *this, const KB::Word *a2)
{
  MEMORY[0x2455C23B0]();
  KB::ByteString::copy();
  uint64_t v4 = *((void *)a2 + 6);
  *((_DWORD *)this + 14) = *((_DWORD *)a2 + 14);
  *((void *)this + 6) = v4;
  unint64_t v5 = (unint64_t)this + 64;
  MEMORY[0x2455C23B0]((char *)this + 64, (char *)a2 + 64);
  long long v6 = *((_OWORD *)a2 + 6);
  long long v7 = *((_OWORD *)a2 + 7);
  long long v8 = *((_OWORD *)a2 + 9);
  *((_OWORD *)this + 8) = *((_OWORD *)a2 + 8);
  *((_OWORD *)this + 9) = v8;
  *((_OWORD *)this + 6) = v6;
  *((_OWORD *)this + 7) = v7;
  MEMORY[0x2455C23B0]((char *)this + 160, (char *)a2 + 160);
  char v9 = *((unsigned char *)a2 + 192);
  *(_OWORD *)((char *)this + 200) = 0u;
  long long v10 = (uint64_t *)((char *)this + 200);
  *((unsigned char *)this + 192) = v9;
  *(_OWORD *)((char *)this + 216) = 0u;
  *((_DWORD *)this + 58) = *((_DWORD *)a2 + 58);
  std::__hash_table<std::__hash_value_type<unsigned int,float>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,float>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,float>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,float>>>::__rehash<true>((uint64_t)this + 200, *((void *)a2 + 26));
  long long v11 = (void *)*((void *)a2 + 27);
  if (v11)
  {
    uint64_t v12 = (void *)((char *)this + 216);
    unint64_t v13 = *((void *)this + 26);
    do
    {
      unint64_t v14 = v11[2];
      if (v13)
      {
        uint8x8_t v15 = (uint8x8_t)vcnt_s8((int8x8_t)v13);
        v15.i16[0] = vaddlv_u8(v15);
        if (v15.u32[0] > 1uLL)
        {
          unint64_t v5 = v11[2];
          if (v14 >= v13) {
            unint64_t v5 = v14 % v13;
          }
        }
        else
        {
          unint64_t v5 = (v13 - 1) & v14;
        }
        uint64_t v16 = *(void **)(*v10 + 8 * v5);
        if (v16)
        {
          for (uint64_t i = (void *)*v16; i; uint64_t i = (void *)*i)
          {
            unint64_t v18 = i[1];
            if (v18 == v14)
            {
              if (i[2] == v14) {
                goto LABEL_41;
              }
            }
            else
            {
              if (v15.u32[0] > 1uLL)
              {
                if (v18 >= v13) {
                  v18 %= v13;
                }
              }
              else
              {
                v18 &= v13 - 1;
              }
              if (v18 != v5) {
                break;
              }
            }
          }
        }
      }
      long long v19 = operator new(0x18uLL);
      *long long v19 = 0;
      v19[1] = v14;
      v19[2] = v11[2];
      float v20 = (float)(unint64_t)(*((void *)this + 28) + 1);
      float v21 = *((float *)this + 58);
      if (!v13 || (float)(v21 * (float)v13) < v20)
      {
        BOOL v22 = (v13 & (v13 - 1)) != 0;
        if (v13 < 3) {
          BOOL v22 = 1;
        }
        unint64_t v23 = v22 | (2 * v13);
        unint64_t v24 = vcvtps_u32_f32(v20 / v21);
        if (v23 <= v24) {
          size_t v25 = v24;
        }
        else {
          size_t v25 = v23;
        }
        std::__hash_table<std::__hash_value_type<unsigned int,float>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,float>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,float>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,float>>>::__rehash<true>((uint64_t)this + 200, v25);
        unint64_t v13 = *((void *)this + 26);
        if ((v13 & (v13 - 1)) != 0)
        {
          if (v14 >= v13) {
            unint64_t v5 = v14 % v13;
          }
          else {
            unint64_t v5 = v14;
          }
        }
        else
        {
          unint64_t v5 = (v13 - 1) & v14;
        }
      }
      uint64_t v26 = *v10;
      unint64_t v27 = *(void **)(*v10 + 8 * v5);
      if (v27)
      {
        *long long v19 = *v27;
      }
      else
      {
        *long long v19 = *v12;
        *uint64_t v12 = v19;
        *(void *)(v26 + 8 * v5) = v12;
        if (!*v19) {
          goto LABEL_40;
        }
        unint64_t v28 = *(void *)(*v19 + 8);
        if ((v13 & (v13 - 1)) != 0)
        {
          if (v28 >= v13) {
            v28 %= v13;
          }
        }
        else
        {
          v28 &= v13 - 1;
        }
        unint64_t v27 = (void *)(*v10 + 8 * v28);
      }
      *unint64_t v27 = v19;
LABEL_40:
      ++*((void *)this + 28);
LABEL_41:
      long long v11 = (void *)*v11;
    }
    while (v11);
  }
  return this;
}

void sub_23EFEAD08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, KB::String *a9, unsigned __int16 *a10)
{
  std::__hash_table<std::__hash_value_type<unsigned int,float>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,float>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,float>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,float>>>::~__hash_table(v12);
  KB::String::~String(v11);
  KB::String::~String(a9);
  if (*a10 >= 0xFu)
  {
    uint64_t v14 = *((void *)v10 + 5);
    if (v14) {
      MEMORY[0x2455C26D0](v14, 0x1000C8077774924);
    }
  }
  KB::String::~String(v10);
  _Unwind_Resume(a1);
}

void TI::CP::TestCaseConverter::create_testcase_converter(TI::CP::TestCaseConverter *this, NSString *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = this;
  KB::String::String((KB::String *)v11);
  KB::String::String((KB::String *)&v12);
  KB::String::String((KB::String *)&v13);
  KB::String::String((KB::String *)&v14);
  KB::String::String((KB::String *)v15);
  UIKeyboardStaticUnigramsFile();
  uint64_t v3 = (KB *)objc_claimAutoreleasedReturnValue();
  KB::utf8_string((uint64_t *)__p, v3, v4);
  KB::String::operator=();
  KB::String::~String((KB::String *)__p);

  unint64_t v5 = [MEMORY[0x263F7EA88] inputModeWithIdentifier:v2];
  UIKeyboardDeltaLexiconPathForInputMode();
  long long v6 = (KB *)objc_claimAutoreleasedReturnValue();
  KB::utf8_string((uint64_t *)__p, v6, v7);
  KB::String::operator=();
  KB::String::~String((KB::String *)__p);

  long long v8 = v2;
  [(TI::CP::TestCaseConverter *)v8 UTF8String];
  v15[8] = TILexiconIDForLocaleIdentifier();
  v15[10] = 1065353216;
  __createAndLoadLanguageModel((NSString *)v8, 0, &v9);
}

void sub_23EFEAF98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::__shared_weak_count *a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, uint64_t a18, char a19)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  MEMORY[0x2455C26F0](v20, 0x10B2C406726BE89);
  if (a11) {
    std::__shared_weak_count::__release_shared[abi:nn180100](a11);
  }
  KB::LexiconInfo::~LexiconInfo((KB::LexiconInfo *)&a19);

  _Unwind_Resume(a1);
}

std::string *TI::CP::TestCaseConverter::TestCaseConverter(std::string *this, long long *a2, std::string::size_type *a3, int a4)
{
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v8 = *a2;
    this->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v8;
  }
  this[1].__r_.__value_.__r.__words[0] = *a3;
  std::string::size_type v9 = a3[1];
  this[1].__r_.__value_.__l.__size_ = v9;
  if (v9) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v9 + 8), 1uLL, memory_order_relaxed);
  }
  *(_OWORD *)&this[1].__r_.__value_.__r.__words[2] = 0u;
  long long v10 = (unsigned int **)&this[1].__r_.__value_.__r.__words[2];
  this[3].__r_.__value_.__r.__words[0] = 0;
  *(_OWORD *)&this[2].__r_.__value_.__r.__words[1] = 0u;
  LODWORD(this[3].__r_.__value_.__r.__words[1]) = 1065353216;
  if (a4)
  {
    if (*((char *)a2 + 23) >= 0) {
      long long v11 = (const std::string::value_type *)a2;
    }
    else {
      long long v11 = *(const std::string::value_type **)a2;
    }
    uint64_t v12 = [NSString stringWithUTF8String:v11];
    __createAndLoadDictionaryContainer(v12, 0, &v16);
  }
  else
  {
    if (*((char *)a2 + 23) >= 0) {
      uint64_t v13 = (const std::string::value_type *)a2;
    }
    else {
      uint64_t v13 = *(const std::string::value_type **)a2;
    }
    uint64_t v12 = [NSString stringWithUTF8String:v13];
    TI::CP::createAndLoadStaticDictionaryContainer((TI::CP *)v12, &v16);
  }
  uint64_t v14 = *v10;
  KB::String *v10 = (unsigned int *)v16;
  if (v14) {
    WTF::RefCounted<KB::DictionaryContainer>::deref(v14);
  }

  return this;
}

void sub_23EFEB1B8(_Unwind_Exception *a1)
{
  std::__hash_table<std::__hash_value_type<KB::String,WTF::RefPtr<TI::Favonius::KeyboardLayout>>,std::__unordered_map_hasher<KB::String,std::__hash_value_type<KB::String,WTF::RefPtr<TI::Favonius::KeyboardLayout>>,std::hash<KB::String>,std::equal_to<KB::String>,true>,std::__unordered_map_equal<KB::String,std::__hash_value_type<KB::String,WTF::RefPtr<TI::Favonius::KeyboardLayout>>,std::equal_to<KB::String>,std::hash<KB::String>,true>,std::allocator<std::__hash_value_type<KB::String,WTF::RefPtr<TI::Favonius::KeyboardLayout>>>>::~__hash_table((uint64_t)(v3 + 1));
  if (*v3) {
    WTF::RefCounted<KB::DictionaryContainer>::deref(*v3);
  }
  unint64_t v5 = *(std::__shared_weak_count **)(v1 + 32);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v5);
  }
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(a1);
}

unsigned int *WTF::RefCounted<KB::DictionaryContainer>::deref(unsigned int *result)
{
  unsigned int v1 = atomic_load(result);
  if (v1 == 1)
  {
    MEMORY[0x2455C22B0]();
    JUMPOUT(0x2455C26F0);
  }
  atomic_fetch_add((atomic_uint *volatile)result, 0xFFFFFFFF);
  return result;
}

void TI::CP::createAndLoadStaticDictionaryContainer(TI::CP *this@<X0>, void *a2@<X8>)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v4 = this;
  KB::String::String((KB::String *)v19);
  KB::String::String((KB::String *)v20);
  KB::String::String((KB::String *)v21);
  KB::String::String((KB::String *)v22);
  KB::String::String((KB::String *)v23);
  UIKeyboardStaticUnigramsFile();
  unint64_t v5 = (KB *)objc_claimAutoreleasedReturnValue();
  KB::utf8_string(v14, v5, v6);
  KB::String::operator=();
  KB::String::~String((KB::String *)v14);

  long long v7 = v4;
  [(TI::CP *)v7 UTF8String];
  v23[8] = TILexiconIDForLocaleIdentifier();
  KB::LexiconInfo::LexiconInfo((uint64_t)v14, (uint64_t)v19);
  long long v8 = (char *)operator new(0xB0uLL);
  std::string::size_type v9 = v8 + 176;
  v11[0] = v8;
  v11[2] = v8 + 176;
  KB::LexiconInfo::LexiconInfo((uint64_t)v8, (uint64_t)v14);
  v11[1] = v9;
  KB::DictionaryContainer::create_multilexicon();
  uint64_t v10 = v12;
  uint64_t v12 = 0;
  uint64_t v13 = (void **)v11;
  *a2 = v10;
  std::vector<KB::LexiconInfo>::__destroy_vector::operator()[abi:nn180100](&v13);
  KB::String::~String((KB::String *)&v18);
  KB::String::~String((KB::String *)&v17);
  KB::String::~String((KB::String *)&v16);
  KB::String::~String((KB::String *)&v15);
  KB::String::~String((KB::String *)v14);
  KB::String::~String((KB::String *)v23);
  KB::String::~String((KB::String *)v22);
  KB::String::~String((KB::String *)v21);
  KB::String::~String((KB::String *)v20);
  KB::String::~String((KB::String *)v19);
}

void sub_23EFEB420(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void **a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  std::vector<KB::LexiconInfo>::__destroy_vector::operator()[abi:nn180100](&a13);
  KB::LexiconInfo::~LexiconInfo((KB::LexiconInfo *)&a14);
  KB::LexiconInfo::~LexiconInfo((KB::LexiconInfo *)&a36);

  _Unwind_Resume(a1);
}

uint64_t std::__hash_table<std::__hash_value_type<KB::String,WTF::RefPtr<TI::Favonius::KeyboardLayout>>,std::__unordered_map_hasher<KB::String,std::__hash_value_type<KB::String,WTF::RefPtr<TI::Favonius::KeyboardLayout>>,std::hash<KB::String>,std::equal_to<KB::String>,true>,std::__unordered_map_equal<KB::String,std::__hash_value_type<KB::String,WTF::RefPtr<TI::Favonius::KeyboardLayout>>,std::equal_to<KB::String>,std::hash<KB::String>,true>,std::allocator<std::__hash_value_type<KB::String,WTF::RefPtr<TI::Favonius::KeyboardLayout>>>>::~__hash_table(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      uint64_t v3 = (void *)*v2;
      std::__destroy_at[abi:nn180100]<std::pair<KB::String const,WTF::RefPtr<TI::Favonius::KeyboardLayout>>,0>((KB::String *)(v2 + 2));
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = 0;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

void std::__destroy_at[abi:nn180100]<std::pair<KB::String const,WTF::RefPtr<TI::Favonius::KeyboardLayout>>,0>(KB::String *this)
{
  uint64_t v2 = (unsigned int *)*((void *)this + 4);
  if (v2) {
    WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(v2);
  }
  KB::String::~String(this);
}

std::string *TI::CP::TestCaseConverter::TestCaseConverter(std::string *this, long long *a2, std::string::size_type *a3, atomic_uint **a4)
{
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v7 = *a2;
    this->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v7;
  }
  std::string::size_type v8 = a3[1];
  this[1].__r_.__value_.__r.__words[0] = *a3;
  this[1].__r_.__value_.__l.__size_ = v8;
  if (v8) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
  }
  std::string::size_type v9 = *a4;
  this[1].__r_.__value_.__r.__words[2] = (std::string::size_type)*a4;
  if (v9) {
    atomic_fetch_add(v9, 1u);
  }
  *(_OWORD *)&this[2].__r_.__value_.__l.__data_ = 0u;
  *(_OWORD *)&this[2].__r_.__value_.__r.__words[2] = 0u;
  LODWORD(this[3].__r_.__value_.__r.__words[1]) = 1065353216;
  return this;
}

uint64_t TI::CP::TestCaseConverter::set_layouts(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = ___ZN2TI2CP17TestCaseConverter11set_layoutsEP7NSArrayIP16TIKeyboardLayoutE_block_invoke;
  v3[3] = &__block_descriptor_40_e33_v32__0__TIKeyboardLayout_8Q16_B24l;
  v3[4] = a1;
  return [a2 enumerateObjectsUsingBlock:v3];
}

void ___ZN2TI2CP17TestCaseConverter11set_layoutsEP7NSArrayIP16TIKeyboardLayoutE_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v38[2] = *MEMORY[0x263EF8340];
  id v6 = a2;
  long long v7 = v6;
  uint64_t v8 = *(void *)(a1 + 32);
  std::string::size_type v9 = *(unsigned int **)(v8 + 40);
  uint64_t v32 = v9;
  if (v9) {
    atomic_fetch_add((atomic_uint *volatile)v9, 1u);
  }
  TI::CP::create_layout(v6, &v32);
  MEMORY[0x2455C23C0](&v36, a3);
  if (v37) {
    uint64_t v10 = v37;
  }
  else {
    uint64_t v10 = (KB::String *)v38;
  }
  unsigned int v11 = KB::String::hash(v10, (const char *)(unsigned __int16)v36);
  uint64_t v12 = (uint64_t *)(v8 + 48);
  unint64_t v13 = v11;
  unint64_t v14 = *(void *)(v8 + 56);
  if (v14)
  {
    uint8x8_t v15 = (uint8x8_t)vcnt_s8((int8x8_t)v14);
    v15.i16[0] = vaddlv_u8(v15);
    unint64_t v16 = v15.u32[0];
    if (v15.u32[0] > 1uLL)
    {
      unint64_t v3 = v11;
      if (v14 <= v11) {
        unint64_t v3 = v11 % v14;
      }
    }
    else
    {
      unint64_t v3 = (v14 - 1) & v11;
    }
    uint64_t v17 = *(void ***)(*v12 + 8 * v3);
    if (v17)
    {
      uint64_t v18 = (char *)*v17;
      if (*v17)
      {
        do
        {
          unint64_t v19 = *((void *)v18 + 1);
          if (v19 == v13)
          {
            if (v18 + 16 == (char *)&v36
              || (KB::String::equal((KB::String *)(v18 + 16), (const KB::String *)&v36) & 1) != 0)
            {
              goto LABEL_46;
            }
          }
          else
          {
            if (v16 > 1)
            {
              if (v19 >= v14) {
                v19 %= v14;
              }
            }
            else
            {
              v19 &= v14 - 1;
            }
            if (v19 != v3) {
              break;
            }
          }
          uint64_t v18 = *(char **)v18;
        }
        while (v18);
      }
    }
  }
  uint64_t v18 = (char *)operator new(0x38uLL);
  uint64_t v20 = (void *)(v8 + 64);
  v34[0] = (uint64_t)v18;
  v34[1] = v8 + 64;
  char v35 = 0;
  *(void *)uint64_t v18 = 0;
  *((void *)v18 + 1) = v13;
  KB::String::String();
  *((void *)v18 + 6) = 0;
  char v35 = 1;
  float v21 = (float)(unint64_t)(*(void *)(v8 + 72) + 1);
  float v22 = *(float *)(v8 + 80);
  if (!v14 || (float)(v22 * (float)v14) < v21)
  {
    BOOL v23 = 1;
    if (v14 >= 3) {
      BOOL v23 = (v14 & (v14 - 1)) != 0;
    }
    unint64_t v24 = v23 | (2 * v14);
    unint64_t v25 = vcvtps_u32_f32(v21 / v22);
    if (v24 <= v25) {
      size_t v26 = v25;
    }
    else {
      size_t v26 = v24;
    }
    std::__hash_table<std::__hash_value_type<unsigned int,float>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,float>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,float>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,float>>>::__rehash<true>(v8 + 48, v26);
    unint64_t v14 = *(void *)(v8 + 56);
    if ((v14 & (v14 - 1)) != 0)
    {
      if (v14 <= v13) {
        unint64_t v3 = v13 % v14;
      }
      else {
        unint64_t v3 = v13;
      }
    }
    else
    {
      unint64_t v3 = (v14 - 1) & v13;
    }
  }
  uint64_t v27 = *v12;
  unint64_t v28 = *(void **)(*v12 + 8 * v3);
  if (v28)
  {
    *(void *)uint64_t v18 = *v28;
LABEL_44:
    *unint64_t v28 = v18;
    goto LABEL_45;
  }
  *(void *)uint64_t v18 = *v20;
  *uint64_t v20 = v18;
  *(void *)(v27 + 8 * v3) = v20;
  if (*(void *)v18)
  {
    unint64_t v29 = *(void *)(*(void *)v18 + 8);
    if ((v14 & (v14 - 1)) != 0)
    {
      if (v29 >= v14) {
        v29 %= v14;
      }
    }
    else
    {
      v29 &= v14 - 1;
    }
    unint64_t v28 = (void *)(*v12 + 8 * v29);
    goto LABEL_44;
  }
LABEL_45:
  v34[0] = 0;
  ++*(void *)(v8 + 72);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<KB::String,WTF::RefPtr<TI::Favonius::KeyboardLayout>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<KB::String,WTF::RefPtr<TI::Favonius::KeyboardLayout>>,void *>>>>::reset[abi:nn180100](v34);
LABEL_46:
  id v30 = (unsigned int *)*((void *)v18 + 6);
  uint64_t v31 = v33;
  uint64_t v33 = 0;
  *((void *)v18 + 6) = v31;
  if (v30) {
    WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(v30);
  }
  KB::String::~String((KB::String *)&v36);
  if (v33) {
    WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(v33);
  }
  if (v32) {
    WTF::RefCounted<KB::DictionaryContainer>::deref(v32);
  }
}

void sub_23EFEB9A0(_Unwind_Exception *a1, unsigned int *a2, unsigned int *a3, ...)
{
  va_start(va1, a3);
  va_start(va, a3);
  uint64_t v5 = va_arg(va1, void);
  uint64_t v7 = va_arg(va1, void);
  uint64_t v8 = va_arg(va1, void);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<KB::String,WTF::RefPtr<TI::Favonius::KeyboardLayout>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<KB::String,WTF::RefPtr<TI::Favonius::KeyboardLayout>>,void *>>>>::reset[abi:nn180100]((uint64_t *)va);
  KB::String::~String((KB::String *)va1);
  if (a3) {
    WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(a3);
  }
  if (a2) {
    WTF::RefCounted<KB::DictionaryContainer>::deref(a2);
  }

  _Unwind_Resume(a1);
}

void TI::CP::create_layout(void *a1, unsigned int **a2)
{
  id v3 = a1;
  uint64_t v4 = v3;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x4812000000;
  v8[3] = __Block_byref_object_copy__27;
  uint64_t v8[4] = __Block_byref_object_dispose__28;
  v8[5] = &unk_23F0564DE;
  memset(v9, 0, sizeof(v9));
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3321888768;
  v6[2] = ___ZN2TI2CP13create_layoutEPK16TIKeyboardLayoutN3WTF6RefPtrIN2KB19DictionaryContainerEEE_block_invoke;
  v6[3] = &unk_26F2B74C8;
  uint64_t v5 = *a2;
  uint64_t v7 = v5;
  if (v5) {
    atomic_fetch_add((atomic_uint *volatile)v5, 1u);
  }
  void v6[4] = v8;
  [v3 enumerateKeysUsingBlock:v6];
  TI::Favonius::KeyboardLayout::create();
  if (v7) {
    WTF::RefCounted<KB::DictionaryContainer>::deref(v7);
  }
  _Block_object_dispose(v8, 8);
  WTF::Vector<WTF::RefPtr<TI::Favonius::LayoutKey>,0ul>::~Vector(v9);
}

void sub_23EFEBB28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned int *a8, ...)
{
  va_start(va, a8);
  if (a8) {
    WTF::RefCounted<KB::DictionaryContainer>::deref(a8);
  }
  _Block_object_dispose(va, 8);
  WTF::Vector<WTF::RefPtr<TI::Favonius::LayoutKey>,0ul>::~Vector(v9);

  _Unwind_Resume(a1);
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<KB::String,WTF::RefPtr<TI::Favonius::KeyboardLayout>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<KB::String,WTF::RefPtr<TI::Favonius::KeyboardLayout>>,void *>>>>::reset[abi:nn180100](uint64_t *a1)
{
  uint64_t v1 = *a1;
  *a1 = 0;
  if (v1)
  {
    if (*((unsigned char *)a1 + 16)) {
      std::__destroy_at[abi:nn180100]<std::pair<KB::String const,WTF::RefPtr<TI::Favonius::KeyboardLayout>>,0>((KB::String *)(v1 + 16));
    }
    operator delete((void *)v1);
  }
}

void *__Block_byref_object_copy__27(void *result, void *a2)
{
  result[6] = 0;
  result[7] = 0;
  result[8] = 0;
  uint64_t v2 = a2[7];
  result[6] = a2[6];
  result[7] = v2;
  a2[6] = 0;
  a2[7] = 0;
  uint64_t v3 = result[8];
  result[8] = a2[8];
  a2[8] = v3;
  return result;
}

void *__Block_byref_object_dispose__28(uint64_t a1)
{
  return WTF::Vector<WTF::RefPtr<TI::Favonius::LayoutKey>,0ul>::~Vector((void *)(a1 + 48));
}

void ___ZN2TI2CP13create_layoutEPK16TIKeyboardLayoutN3WTF6RefPtrIN2KB19DictionaryContainerEEE_block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  MEMORY[0x2455C23A0](v11);
  KB::CollatorWrapper::sortkey_for_string(&v9, (KB::CollatorWrapper *)(*(void *)(*(void *)(a1 + 40) + 8) + 72), (const KB::String *)v11);
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8);
  TI::Favonius::LayoutKey::create();
  uint64_t v4 = v2 + 6;
  unint64_t v3 = v2[6];
  if (v3 != v2[8])
  {
    uint64_t v7 = v2[7];
    goto LABEL_10;
  }
  unint64_t v5 = v3 + (v3 >> 1);
  if (v3 < 0x100) {
    unint64_t v5 = 2 * v3;
  }
  if (v5 <= v3 + 1) {
    unint64_t v6 = v3 + 1;
  }
  else {
    unint64_t v6 = v5;
  }
  WTF::Vector<WTF::RefPtr<TI::Favonius::LayoutKey>,0ul>::reserveCapacity(v2 + 6, v6);
  uint64_t v7 = v2[7];
  if (v7)
  {
    unint64_t v3 = *v4;
LABEL_10:
    *(void *)(v7 + 8 * v3) = v8;
    *uint64_t v4 = v3 + 1;
    goto LABEL_11;
  }
  if (v8) {
    WTF::RefCounted<TI::Favonius::Key>::deref(v8);
  }
LABEL_11:
  if ((unsigned __int16)v9 >= 0xFu && v10) {
    MEMORY[0x2455C26D0](v10, 0x1000C8077774924);
  }
  KB::String::~String((KB::String *)v11);
}

void sub_23EFEBD44(_Unwind_Exception *a1, uint64_t a2, unsigned __int16 a3, uint64_t a4, ...)
{
  va_start(va, a4);
  if (a2) {
    WTF::RefCounted<TI::Favonius::Key>::deref(a2);
  }
  if (a3 >= 0xFu)
  {
    if (a4) {
      MEMORY[0x2455C26D0](a4, 0x1000C8077774924);
    }
  }
  KB::String::~String((KB::String *)va);
  _Unwind_Resume(a1);
}

void *WTF::Vector<WTF::RefPtr<TI::Favonius::LayoutKey>,0ul>::~Vector(void *a1)
{
  if (*a1)
  {
    uint64_t v2 = (uint64_t *)a1[1];
    uint64_t v3 = 8 * *a1;
    do
    {
      if (*v2) {
        WTF::RefCounted<TI::Favonius::Key>::deref(*v2);
      }
      ++v2;
      v3 -= 8;
    }
    while (v3);
    *a1 = 0;
  }
  uint64_t v4 = (void *)a1[1];
  a1[1] = 0;
  a1[2] = 0;
  free(v4);
  return a1;
}

unsigned int *__destroy_helper_block_ea8_40c46_ZTSKN3WTF6RefPtrIN2KB19DictionaryContainerEEE(uint64_t a1)
{
  __n128 result = *(unsigned int **)(a1 + 40);
  if (result) {
    return WTF::RefCounted<KB::DictionaryContainer>::deref(result);
  }
  return result;
}

uint64_t __copy_helper_block_ea8_40c46_ZTSKN3WTF6RefPtrIN2KB19DictionaryContainerEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(atomic_uint **)(a2 + 40);
  *(void *)(result + 40) = v2;
  if (v2) {
    atomic_fetch_add(v2, 1u);
  }
  return result;
}

void WTF::Vector<WTF::RefPtr<TI::Favonius::LayoutKey>,0ul>::reserveCapacity(void *a1, unint64_t a2)
{
  if (a1[2] < a2)
  {
    uint64_t v3 = (void **)(a1 + 1);
    uint64_t v2 = (void *)a1[1];
    uint64_t v4 = *a1;
    a1[2] = a2;
    unint64_t v5 = malloc_type_malloc(8 * a2, 0x2004093837F09uLL);
    *uint64_t v3 = v5;
    if (v5)
    {
      memcpy(v5, v2, 8 * v4);
      unint64_t v6 = *v3;
    }
    else
    {
      unint64_t v6 = 0;
    }
    if (v6 == v2)
    {
      *uint64_t v3 = 0;
      v3[1] = 0;
    }
    free(v2);
  }
}

void TI::CP::TestCaseConverter::compute_linguistic_context_and_stem(TI::CP::TestCaseConverter *this@<X0>, NSString *a2@<X1>, KB::LanguageModelContext *a3@<X8>)
{
  v42[5] = *(void ***)MEMORY[0x263EF8340];
  uint64_t v4 = a2;
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x4012000000;
  uint64_t v32 = __Block_byref_object_copy__34;
  uint64_t v33 = (void (*)(uint64_t))__Block_byref_object_dispose__35;
  long long v34 = &unk_23F0564DE;
  long long v35 = xmmword_23F04A3D0;
  uint64_t v5 = [(NSString *)v4 length];
  v42[0] = (void **)MEMORY[0x263EF8330];
  v42[1] = (void **)3221225472;
  v42[2] = (void **)___ZN2TI2CPL23rangeOfLastWordInStringEP8NSString_block_invoke;
  v42[3] = (void **)&unk_26504FD40;
  v42[4] = (void **)&v29;
  -[NSString enumerateSubstringsInRange:options:usingBlock:](v4, "enumerateSubstringsInRange:options:usingBlock:", 0, v5, 771, v42);
  uint64_t v7 = v30[6];
  uint64_t v6 = v30[7];
  _Block_object_dispose(&v29, 8);

  if (v7 == 0x7FFFFFFFFFFFFFFFLL || v6 + v7 != [(NSString *)v4 length])
  {
    unsigned int v11 = 0;
  }
  else
  {
    uint64_t v8 = -[NSString substringWithRange:](v4, "substringWithRange:", v7, v6);
    uint64_t v9 = [v8 lowercaseString];
    char v10 = [&unk_26F2C9DE0 containsObject:v9];

    if (v10)
    {
      unsigned int v11 = 0;
    }
    else
    {
      unsigned int v11 = v8;
      uint64_t v12 = [(NSString *)v4 substringToIndex:v7];

      uint64_t v4 = (NSString *)v12;
    }
  }
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x9812000000;
  uint64_t v32 = __Block_byref_object_copy__1079;
  uint64_t v33 = __Block_byref_object_dispose__1080;
  long long v34 = &unk_23F0564DE;
  long long v35 = 0u;
  long long __p = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  language_modeling::v1::LinguisticContext::LinguisticContext((language_modeling::v1::LinguisticContext *)&v39);
  language_modeling::v1::LinguisticContext::LinguisticContext((language_modeling::v1::LinguisticContext *)&v40);
  memset(v41, 0, sizeof(v41));
  size_t v26 = v11;
  if (*((void *)this + 3))
  {
    unint64_t v14 = v4;
    uint8x8_t v15 = [(NSString *)v14 UTF8String];
    unint64_t v16 = this;
    if (*((char *)this + 23) < 0) {
      unint64_t v16 = *(TI::CP::TestCaseConverter **)this;
    }
    uint64_t v17 = (void *)MEMORY[0x263EFF960];
    uint64_t v18 = [NSString stringWithUTF8String:v16];
    unint64_t v19 = [v17 localeWithLocaleIdentifier:v18];

    TILexiconIDForLocaleIdentifier();
    if ([(NSString *)v14 length])
    {
      LMStreamTokenizerCreate();
      strlen(v15);
      uint64_t v20 = v19;
      id v27 = v19;
      unint64_t v28 = v14;
      LMStreamTokenizerPushBytes();
      LMStreamTokenizerRelease();
    }
    else
    {
      uint64_t v20 = v19;
      MEMORY[0x2455C23A0](v42, "");
      KB::LanguageModelContext::append();
      KB::String::~String((KB::String *)v42);
    }
    unint64_t v24 = v30;
    KB::utf8_string((uint64_t *)v42, v26, v21);
    std::pair<KB::LanguageModelContext,KB::String>::pair[abi:nn180100]<KB::LanguageModelContext&,KB::String,0>(a3, (const KB::LanguageModelContext *)(v24 + 6));
    KB::String::~String((KB::String *)v42);
  }
  else
  {
    float v22 = v11;
    BOOL v23 = v30;
    KB::utf8_string((uint64_t *)v42, v22, v13);
    std::pair<KB::LanguageModelContext,KB::String>::pair[abi:nn180100]<KB::LanguageModelContext&,KB::String,0>(a3, (const KB::LanguageModelContext *)(v23 + 6));
    KB::String::~String((KB::String *)v42);
  }
  _Block_object_dispose(&v29, 8);
  v42[0] = (void **)v41;
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100](v42);
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)&v40);
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)&v39);
  if ((void)__p)
  {
    *((void *)&__p + 1) = __p;
    operator delete((void *)__p);
  }
  if (*((void *)&v35 + 1)) {
    std::__shared_weak_count::__release_shared[abi:nn180100](*((std::__shared_weak_count **)&v35 + 1));
  }
}

void sub_23EFEC35C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  KB::String::~String((KB::String *)(v29 - 152));

  _Block_object_dispose(&a21, 8);
  KB::LanguageModelContext::~LanguageModelContext((KB::LanguageModelContext *)&a27);

  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__34(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[3];
  a1[3] = result;
  return result;
}

uint64_t ___ZN2TI2CPL23rangeOfLastWordInStringEP8NSString_block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  uint64_t v7 = *(void *)(*(void *)(result + 32) + 8);
  *(void *)(v7 + 48) = a3;
  *(void *)(v7 + 56) = a4;
  *a7 = 1;
  return result;
}

__n128 __Block_byref_object_copy__1079(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(void *)(a2 + 48) = 0;
  *(void *)(a2 + 56) = 0;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 80) = 0;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a2 + 64) = 0;
  *(void *)(a2 + 72) = 0;
  *(void *)(a2 + 80) = 0;
  long long v4 = *(_OWORD *)(a2 + 88);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(_OWORD *)(a1 + 88) = v4;
  language_modeling::v1::LinguisticContext::LinguisticContext();
  language_modeling::v1::LinguisticContext::LinguisticContext();
  *(void *)(a1 + 128) = 0;
  *(void *)(a1 + 136) = 0;
  *(void *)(a1 + 144) = 0;
  __n128 result = *(__n128 *)(a2 + 128);
  *(__n128 *)(a1 + 128) = result;
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a2 + 128) = 0;
  *(void *)(a2 + 136) = 0;
  *(void *)(a2 + 144) = 0;
  return result;
}

void __Block_byref_object_dispose__1080(uint64_t a1)
{
  long long v4 = (void **)(a1 + 128);
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100](&v4);
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)(a1 + 120));
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)(a1 + 112));
  uint64_t v2 = *(void **)(a1 + 64);
  if (v2)
  {
    *(void *)(a1 + 72) = v2;
    operator delete(v2);
  }
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 56);
  if (v3)
  {
    std::__shared_weak_count::__release_shared[abi:nn180100](v3);
  }
}

KB::LanguageModelContext *std::pair<KB::LanguageModelContext,KB::String>::pair[abi:nn180100]<KB::LanguageModelContext&,KB::String,0>(KB::LanguageModelContext *a1, const KB::LanguageModelContext *a2)
{
  return a1;
}

void sub_23EFEC5E0(_Unwind_Exception *a1)
{
  KB::LanguageModelContext::~LanguageModelContext(v1);
  _Unwind_Resume(a1);
}

void ___ZNK2TI2CP17TestCaseConverter35compute_linguistic_context_and_stemEP8NSString_block_invoke(uint64_t a1, NSString *a2, uint64_t a3, int a4)
{
  uint64_t v8[4] = *MEMORY[0x263EF8340];
  if (a4)
  {
    LODWORD(v5) = a4;
  }
  else
  {
    uint64_t v6 = (void *)[[NSString alloc] initWithBytes:a2 length:a3 encoding:4];
    KB::String::String((KB::String *)v8);
    unint64_t token_id_for_word = KB::LanguageModel::find_token_id_for_word();
    KB::String::~String((KB::String *)v8);

    unint64_t v5 = HIDWORD(token_id_for_word);
  }
  if (v5 != 2)
  {
    KB::utf8_string(v8, *(KB **)(a1 + 40), a2);
    KB::LanguageModelContext::append();
    KB::String::~String((KB::String *)v8);
  }
}

void sub_23EFEC718(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  KB::String::~String((KB::String *)va);

  _Unwind_Resume(a1);
}

void TI::CP::TestCaseConverter::convert(TI::CP::TestCaseConverter *a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  v57[4] = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v6 = [v5 originalWord];
  MEMORY[0x2455C23C0](v57, [v6 layoutID]);

  uint64_t v7 = (atomic_uint *)std::__hash_table<std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>,std::__unordered_map_hasher<KB::String,std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>,std::hash<KB::String>,std::equal_to<KB::String>,true>,std::__unordered_map_equal<KB::String,std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>,std::equal_to<KB::String>,std::hash<KB::String>,true>,std::allocator<std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>>>::find<KB::String>((void *)a1 + 6, v57)[6];
  if (v7) {
    atomic_fetch_add(v7, 1u);
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v8 = [v5 alignedTouches];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v39 objects:v56 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v40 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        [v12 location];
        CGFloat v14 = v13;
        CGFloat v16 = v15;
        [v12 timestamp];
        double v18 = v17;
        v58.x = v14;
        v58.y = v16;
        TI::CP::Path::append((TI::CP::Path *)&v43, v58, v18, 0.0, -1.0, 0.0);
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v39 objects:v56 count:16];
    }
    while (v9);
  }

  unint64_t v19 = [v5 expectedString];
  KB::utf8_string(v55, v19, v20);

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  *(_OWORD *)uint64_t v33 = 0u;
  language_modeling::v1::LinguisticContext::LinguisticContext((language_modeling::v1::LinguisticContext *)&v36);
  language_modeling::v1::LinguisticContext::LinguisticContext((language_modeling::v1::LinguisticContext *)&v37);
  memset(v38, 0, 24);
  KB::String::String((KB::String *)v54);
  float v21 = [v5 originalWord];
  float v22 = [v21 inputStem];
  BOOL v23 = v22 == 0;

  if (!v23)
  {
    unint64_t v24 = [v5 originalWord];
    unint64_t v25 = [v24 inputStem];
    TI::CP::TestCaseConverter::compute_linguistic_context_and_stem(a1, v25, (KB::LanguageModelContext *)&v47);
    KB::LanguageModelContext::operator=((uint64_t)&v32, &v47);
    KB::String::operator=();
    KB::String::~String((KB::String *)&v53);
    unint64_t v46 = (void **)&v52;
    std::vector<std::string>::__destroy_vector::operator()[abi:nn180100](&v46);
    language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)&v51);
    language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)&v50);
    if (__p)
    {
      uint64_t v49 = __p;
      operator delete(__p);
    }
    if (*((void *)&v47 + 1)) {
      std::__shared_weak_count::__release_shared[abi:nn180100](*((std::__shared_weak_count **)&v47 + 1));
    }
  }
  uint64_t v31 = v7;
  if (v7) {
    atomic_fetch_add(v7, 1u);
  }
  TI::CP::ContinuousPathTestCase::ContinuousPathTestCase(a3, &v31, (const std::vector<unsigned int> *)&v43, (uint64_t)v55, (const KB::LanguageModelContext *)&v32, (uint64_t)v54);
  if (v31) {
    WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref((unsigned int *)v31);
  }
  size_t v26 = [v5 alignedTouches];
  BOOL v27 = [v26 count] == 0;

  if (!v27)
  {
    unint64_t v28 = [v5 alignedTouches];
    uint64_t v29 = [v28 objectAtIndexedSubscript:0];
    [v29 timestamp];
    *(void *)(a3 + 224) = v30;
  }
  KB::String::~String((KB::String *)v54);
  *(void *)&long long v47 = v38;
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)&v47);
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)&v37);
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)&v36);
  if (v33[0])
  {
    v33[1] = v33[0];
    operator delete(v33[0]);
  }
  if (*((void *)&v32 + 1)) {
    std::__shared_weak_count::__release_shared[abi:nn180100](*((std::__shared_weak_count **)&v32 + 1));
  }
  KB::String::~String((KB::String *)v55);
  if (*((void *)&v44 + 1))
  {
    *(void *)&long long v45 = *((void *)&v44 + 1);
    operator delete(*((void **)&v44 + 1));
  }
  if ((void)v43)
  {
    *((void *)&v43 + 1) = v43;
    operator delete((void *)v43);
  }
  if (v7) {
    WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref((unsigned int *)v7);
  }
  KB::String::~String((KB::String *)v57);
}

void sub_23EFECB10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58,uint64_t a59,uint64_t a60,uint64_t a61,char a62)
{
  TI::CP::ContinuousPathTestCase::~ContinuousPathTestCase(v64);
  KB::String::~String((KB::String *)&a58);
  KB::LanguageModelContext::~LanguageModelContext((KB::LanguageModelContext *)&a11);
  KB::String::~String((KB::String *)&a62);
  TI::CP::Path::~Path((TI::CP::Path *)&a33);
  if (v63) {
    WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(v63);
  }
  KB::String::~String((KB::String *)(v67 - 152));

  _Unwind_Resume(a1);
}

uint64_t KB::LanguageModelContext::operator=(uint64_t a1, long long *a2)
{
  long long v4 = *a2;
  *(void *)a2 = 0;
  *((void *)a2 + 1) = 0;
  id v5 = *(std::__shared_weak_count **)(a1 + 8);
  *(_OWORD *)a1 = v4;
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v5);
  }
  uint64_t v6 = *(void **)(a1 + 16);
  if (v6)
  {
    *(void *)(a1 + 24) = v6;
    operator delete(v6);
    *(void *)(a1 + 16) = 0;
    *(void *)(a1 + 24) = 0;
    *(void *)(a1 + 32) = 0;
  }
  *(_OWORD *)(a1 + 16) = a2[1];
  *(void *)(a1 + 32) = *((void *)a2 + 4);
  *((void *)a2 + 2) = 0;
  *((void *)a2 + 3) = 0;
  *((void *)a2 + 4) = 0;
  long long v7 = *(long long *)((char *)a2 + 40);
  *(void *)(a1 + 56) = *((void *)a2 + 7);
  *(_OWORD *)(a1 + 40) = v7;
  language_modeling::v1::LinguisticContext::operator=();
  language_modeling::v1::LinguisticContext::operator=();
  std::vector<std::string>::__vdeallocate((std::vector<std::string> *)(a1 + 80));
  *(_OWORD *)(a1 + 80) = a2[5];
  *(void *)(a1 + 96) = *((void *)a2 + 12);
  *((void *)a2 + 10) = 0;
  *((void *)a2 + 11) = 0;
  *((void *)a2 + 12) = 0;
  return a1;
}

uint64_t std::pair<KB::LanguageModelContext,KB::String>::~pair(uint64_t a1)
{
  KB::String::~String((KB::String *)(a1 + 104));
  id v5 = (void **)(a1 + 80);
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100](&v5);
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)(a1 + 72));
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)(a1 + 64));
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    *(void *)(a1 + 24) = v2;
    operator delete(v2);
  }
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 8);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v3);
  }
  return a1;
}

void TI::CP::ContinuousPathTestCase::~ContinuousPathTestCase(TI::CP::ContinuousPathTestCase *this)
{
  KB::String::~String((TI::CP::ContinuousPathTestCase *)((char *)this + 192));
  uint64_t v6 = (void **)((char *)this + 168);
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100](&v6);
  language_modeling::v1::LinguisticContext::~LinguisticContext((TI::CP::ContinuousPathTestCase *)((char *)this + 160));
  language_modeling::v1::LinguisticContext::~LinguisticContext((TI::CP::ContinuousPathTestCase *)((char *)this + 152));
  uint64_t v2 = (void *)*((void *)this + 13);
  if (v2)
  {
    *((void *)this + 14) = v2;
    operator delete(v2);
  }
  uint64_t v3 = (std::__shared_weak_count *)*((void *)this + 12);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v3);
  }
  KB::String::~String((TI::CP::ContinuousPathTestCase *)((char *)this + 56));
  long long v4 = (void *)*((void *)this + 4);
  if (v4)
  {
    *((void *)this + 5) = v4;
    operator delete(v4);
  }
  id v5 = (void *)*((void *)this + 1);
  if (v5)
  {
    *((void *)this + 2) = v5;
    operator delete(v5);
  }
  if (*(void *)this) {
    WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(*(unsigned int **)this);
  }
}

void std::vector<std::string>::__vdeallocate(std::vector<std::string> *this)
{
  if (this->__begin_)
  {
    std::vector<std::string>::__clear[abi:nn180100]((uint64_t *)this);
    operator delete(this->__begin_);
    this->__begin_ = 0;
    this->__end_ = 0;
    this->__end_cap_.__value_ = 0;
  }
}

double TI::CP::TestResultsSummarizer::TestResultsSummarizer(TI::CP::TestResultsSummarizer *this, char a2, char a3, char a4)
{
  double result = 0.0;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((void *)this + 14) = 0;
  *((void *)this + 15) = 0;
  *((void *)this + 13) = 0;
  *(_OWORD *)((char *)this + 136) = 0u;
  *(_OWORD *)((char *)this + 152) = 0u;
  *(_OWORD *)((char *)this + 168) = 0u;
  *((void *)this + 23) = 0;
  *((_DWORD *)this + 48) = 1065353216;
  *(_OWORD *)((char *)this + 200) = 0u;
  *(_OWORD *)((char *)this + 216) = 0u;
  *(_OWORD *)((char *)this + 232) = 0u;
  *(_OWORD *)((char *)this + 248) = 0u;
  *((void *)this + 33) = 0;
  *((void *)this + 35) = 0xC010000000000000;
  *((void *)this + 36) = 0x4008000000000000;
  *((void *)this + 37) = 0;
  *((_DWORD *)this + 76) = 0;
  *((unsigned char *)this + 96) = a2;
  *((unsigned char *)this + 128) = a3;
  *((unsigned char *)this + 97) = a4;
  return result;
}

{
  double result;

  double result = 0.0;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((void *)this + 14) = 0;
  *((void *)this + 15) = 0;
  *((void *)this + 13) = 0;
  *(_OWORD *)((char *)this + 136) = 0u;
  *(_OWORD *)((char *)this + 152) = 0u;
  *(_OWORD *)((char *)this + 168) = 0u;
  *((void *)this + 23) = 0;
  *((_DWORD *)this + 48) = 1065353216;
  *(_OWORD *)((char *)this + 200) = 0u;
  *(_OWORD *)((char *)this + 216) = 0u;
  *(_OWORD *)((char *)this + 232) = 0u;
  *(_OWORD *)((char *)this + 248) = 0u;
  *((void *)this + 33) = 0;
  *((void *)this + 35) = 0xC010000000000000;
  *((void *)this + 36) = 0x4008000000000000;
  *((void *)this + 37) = 0;
  *((_DWORD *)this + 76) = 0;
  *((unsigned char *)this + 96) = a2;
  *((unsigned char *)this + 128) = a3;
  *((unsigned char *)this + 97) = a4;
  return result;
}

void TI::CP::TestResultsSummarizer::add_result(TI::CP::TestResultsSummarizer *this, const TI::CP::ContinuousPathTestResult *a2)
{
  ++*((_DWORD *)this + 23);
  int v5 = *((_DWORD *)a2 + 36);
  if (v5 == -1)
  {
    ++*((_DWORD *)this + 21);
  }
  else if (v5)
  {
    if (v5 > 3)
    {
      if (v5 > 0x27) {
        ++*((_DWORD *)this + 22);
      }
      else {
        ++*((_DWORD *)this + 20);
      }
    }
    else
    {
      ++*((_DWORD *)this + 19);
    }
  }
  else
  {
    ++*((_DWORD *)this + 18);
  }
  double v6 = *((double *)a2 + 19);
  *((double *)this + 15) = v6 + *((double *)this + 15);
  if ((*((void *)a2 + 20) & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL) {
    *((double *)this + 13) = v6 - *((double *)a2 + 20) + *((double *)this + 13);
  }
  if ((*((void *)a2 + 21) & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL) {
    *((double *)this + 14) = v6 - *((double *)a2 + 21) + *((double *)this + 14);
  }
  if (*((unsigned char *)this + 128) && *((_DWORD *)a2 + 36))
  {
    unint64_t v7 = *((void *)this + 19);
    unint64_t v8 = *((void *)this + 18);
    if (v8 >= v7)
    {
      uint64_t v10 = *((void *)this + 17);
      uint64_t v11 = 0x34F72C234F72C235 * ((uint64_t)(v8 - v10) >> 3);
      if ((unint64_t)(v11 + 1) > 0x11A7B9611A7B961) {
        goto LABEL_147;
      }
      unint64_t v12 = 0x34F72C234F72C235 * ((uint64_t)(v7 - v10) >> 3);
      uint64_t v13 = 2 * v12;
      if (2 * v12 <= v11 + 1) {
        uint64_t v13 = v11 + 1;
      }
      if (v12 >= 0x8D3DCB08D3DCB0) {
        unint64_t v14 = 0x11A7B9611A7B961;
      }
      else {
        unint64_t v14 = v13;
      }
      uint64_t v93 = (char *)this + 152;
      if (v14) {
        unint64_t v14 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<TI::CP::ContinuousPathTestResult>>(v14);
      }
      else {
        uint64_t v15 = 0;
      }
      long long v89 = (char *)v14;
      long long v90 = (TI::CP::ContinuousPathTestResult *)(v14 + 232 * v11);
      unint64_t v92 = v14 + 232 * v15;
      TI::CP::ContinuousPathTestResult::ContinuousPathTestResult(v90, a2);
      uint64_t v91 = (TI::CP::ContinuousPathTestResult *)((char *)v90 + 232);
      std::vector<TI::CP::ContinuousPathTestResult>::__swap_out_circular_buffer((uint64_t *)this + 17, &v89);
      unint64_t v9 = *((void *)this + 18);
      std::__split_buffer<TI::CP::ContinuousPathTestResult>::~__split_buffer((uint64_t)&v89);
    }
    else
    {
      TI::CP::ContinuousPathTestResult::ContinuousPathTestResult(*((TI::CP::ContinuousPathTestResult **)this + 18), a2);
      unint64_t v9 = v8 + 232;
      *((void *)this + 18) = v8 + 232;
    }
    *((void *)this + 18) = v9;
  }
  if (*((unsigned char *)a2 + 217)) {
    ++*((_DWORD *)this + 76);
  }
  if (*((unsigned char *)a2 + 219)) {
    ++*((_DWORD *)this + 75);
  }
  if (*((unsigned char *)a2 + 218)) {
    ++*((_DWORD *)this + 74);
  }
  if (v5 == -1) {
    double v16 = *((double *)this + 35);
  }
  else {
    double v16 = *((double *)this + 35) * ((double)v5 / (*((double *)this + 36) + (double)v5));
  }
  *((double *)this + 34) = v16 + *((double *)this + 34);
  int v17 = *((_DWORD *)a2 + 36);
  unint64_t v19 = (char *)*((void *)this + 32);
  unint64_t v18 = *((void *)this + 33);
  if ((unint64_t)v19 < v18)
  {
    *(_DWORD *)unint64_t v19 = v17;
    uint64_t v20 = v19 + 4;
    goto LABEL_53;
  }
  float v21 = (char *)*((void *)this + 31);
  uint64_t v22 = (v19 - v21) >> 2;
  unint64_t v23 = v22 + 1;
  if ((unint64_t)(v22 + 1) >> 62) {
LABEL_147:
  }
    abort();
  uint64_t v24 = v18 - (void)v21;
  if (v24 >> 1 > v23) {
    unint64_t v23 = v24 >> 1;
  }
  BOOL v25 = (unint64_t)v24 >= 0x7FFFFFFFFFFFFFFCLL;
  unint64_t v26 = 0x3FFFFFFFFFFFFFFFLL;
  if (!v25) {
    unint64_t v26 = v23;
  }
  if (v26)
  {
    unint64_t v26 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>(v26);
    float v21 = (char *)*((void *)this + 31);
    unint64_t v19 = (char *)*((void *)this + 32);
  }
  else
  {
    uint64_t v27 = 0;
  }
  unint64_t v28 = (_DWORD *)(v26 + 4 * v22);
  unint64_t v29 = v26 + 4 * v27;
  *unint64_t v28 = v17;
  uint64_t v20 = v28 + 1;
  while (v19 != v21)
  {
    int v30 = *((_DWORD *)v19 - 1);
    v19 -= 4;
    *--unint64_t v28 = v30;
  }
  *((void *)this + 31) = v28;
  *((void *)this + 32) = v20;
  *((void *)this + 33) = v29;
  if (v21) {
    operator delete(v21);
  }
LABEL_53:
  *((void *)this + 32) = v20;
  if (*((unsigned char *)this + 97))
  {
    unsigned int v31 = *((_DWORD *)a2 + 36);
    if (v31 <= 3)
    {
      id v32 = *(id *)(*((void *)a2 + 5) + 1000 * v31 + 984);
      uint64_t v33 = [v32 allKeys];
      if ([v33 count] != 1)
      {
LABEL_145:

        return;
      }
      if (*((_DWORD *)a2 + 36)) {
        goto LABEL_132;
      }
      unint64_t v34 = *((void *)this + 27);
      unint64_t v35 = *((void *)this + 26);
      if (v35 >= v34)
      {
        uint64_t v37 = *((void *)this + 25);
        uint64_t v38 = 0x34F72C234F72C235 * ((uint64_t)(v35 - v37) >> 3);
        if ((unint64_t)(v38 + 1) > 0x11A7B9611A7B961) {
          goto LABEL_148;
        }
        unint64_t v39 = 0x34F72C234F72C235 * ((uint64_t)(v34 - v37) >> 3);
        uint64_t v40 = 2 * v39;
        if (2 * v39 <= v38 + 1) {
          uint64_t v40 = v38 + 1;
        }
        if (v39 >= 0x8D3DCB08D3DCB0) {
          unint64_t v41 = 0x11A7B9611A7B961;
        }
        else {
          unint64_t v41 = v40;
        }
        uint64_t v93 = (char *)this + 216;
        if (v41) {
          unint64_t v41 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<TI::CP::ContinuousPathTestResult>>(v41);
        }
        else {
          uint64_t v42 = 0;
        }
        long long v89 = (char *)v41;
        long long v90 = (TI::CP::ContinuousPathTestResult *)(v41 + 232 * v38);
        uint64_t v91 = v90;
        unint64_t v92 = v41 + 232 * v42;
        TI::CP::ContinuousPathTestResult::ContinuousPathTestResult(v90, a2);
        uint64_t v91 = (TI::CP::ContinuousPathTestResult *)((char *)v91 + 232);
        std::vector<TI::CP::ContinuousPathTestResult>::__swap_out_circular_buffer((uint64_t *)this + 25, &v89);
        unint64_t v36 = *((void *)this + 26);
        std::__split_buffer<TI::CP::ContinuousPathTestResult>::~__split_buffer((uint64_t)&v89);
      }
      else
      {
        TI::CP::ContinuousPathTestResult::ContinuousPathTestResult(*((TI::CP::ContinuousPathTestResult **)this + 26), a2);
        unint64_t v36 = v35 + 232;
        *((void *)this + 26) = v35 + 232;
      }
      *((void *)this + 26) = v36;
      id v85 = [v33 firstObject];
      std::string::basic_string[abi:nn180100]<0>(__p, (char *)[v85 UTF8String]);
      long long v86 = (uint64_t *)((char *)this + 160);
      int v43 = SHIBYTE(v88);
      char v83 = __p[1];
      long long v84 = (const std::string::value_type *)__p[0];
      if (v88 >= 0) {
        long long v44 = (uint64_t *)__p;
      }
      else {
        long long v44 = (uint64_t *)__p[0];
      }
      if (v88 >= 0) {
        unint64_t v45 = HIBYTE(v88);
      }
      else {
        unint64_t v45 = (unint64_t)__p[1];
      }
      unint64_t v46 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100](v44, v45);
      unint64_t v47 = v46;
      unint64_t v48 = *((void *)this + 21);
      if (v48)
      {
        uint8x8_t v49 = (uint8x8_t)vcnt_s8((int8x8_t)v48);
        v49.i16[0] = vaddlv_u8(v49);
        unint64_t v50 = v49.u32[0];
        if (v49.u32[0] > 1uLL)
        {
          unint64_t v2 = v46;
          if (v46 >= v48) {
            unint64_t v2 = v46 % v48;
          }
        }
        else
        {
          unint64_t v2 = (v48 - 1) & v46;
        }
        uint64_t v51 = *(void ***)(*v86 + 8 * v2);
        if (v51)
        {
          uint64_t v52 = (char *)*v51;
          if (*v51)
          {
            do
            {
              unint64_t v53 = *((void *)v52 + 1);
              if (v53 == v47)
              {
                if (std::equal_to<std::string>::operator()[abi:nn180100]((unsigned __int8 *)v52 + 16, (unsigned __int8 *)__p))
                {
                  goto LABEL_117;
                }
              }
              else
              {
                if (v50 > 1)
                {
                  if (v53 >= v48) {
                    v53 %= v48;
                  }
                }
                else
                {
                  v53 &= v48 - 1;
                }
                if (v53 != v2) {
                  break;
                }
              }
              uint64_t v52 = *(char **)v52;
            }
            while (v52);
          }
        }
      }
      uint64_t v52 = (char *)operator new(0x40uLL);
      uint64_t v54 = (void *)((char *)this + 176);
      long long v89 = v52;
      long long v90 = (TI::CP::TestResultsSummarizer *)((char *)this + 176);
      LOBYTE(v91) = 0;
      unint64_t v55 = (std::string *)(v52 + 16);
      *(void *)uint64_t v52 = 0;
      *((void *)v52 + 1) = v47;
      if (v43 < 0)
      {
        std::string::__init_copy_ctor_external(v55, v84, (std::string::size_type)v83);
      }
      else
      {
        *(_OWORD *)&v55->__r_.__value_.__l.__data_ = *(_OWORD *)__p;
        *((void *)v52 + 4) = v88;
      }
      *((void *)v52 + 5) = 0;
      *((void *)v52 + 6) = 0;
      *((void *)v52 + 7) = 0;
      LOBYTE(v91) = 1;
      float v56 = (float)(unint64_t)(*((void *)this + 23) + 1);
      float v57 = *((float *)this + 48);
      if (!v48 || (float)(v57 * (float)v48) < v56)
      {
        BOOL v58 = 1;
        if (v48 >= 3) {
          BOOL v58 = (v48 & (v48 - 1)) != 0;
        }
        unint64_t v59 = v58 | (2 * v48);
        unint64_t v60 = vcvtps_u32_f32(v56 / v57);
        if (v59 <= v60) {
          size_t v61 = v60;
        }
        else {
          size_t v61 = v59;
        }
        std::__hash_table<std::__hash_value_type<unsigned int,float>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,float>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,float>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,float>>>::__rehash<true>((uint64_t)v86, v61);
        unint64_t v48 = *((void *)this + 21);
        if ((v48 & (v48 - 1)) != 0)
        {
          if (v47 >= v48) {
            unint64_t v2 = v47 % v48;
          }
          else {
            unint64_t v2 = v47;
          }
        }
        else
        {
          unint64_t v2 = (v48 - 1) & v47;
        }
      }
      uint64_t v62 = *v86;
      unint64_t v63 = *(void **)(*v86 + 8 * v2);
      if (v63)
      {
        *(void *)uint64_t v52 = *v63;
      }
      else
      {
        *(void *)uint64_t v52 = *v54;
        *uint64_t v54 = v52;
        *(void *)(v62 + 8 * v2) = v54;
        if (!*(void *)v52) {
          goto LABEL_116;
        }
        unint64_t v64 = *(void *)(*(void *)v52 + 8);
        if ((v48 & (v48 - 1)) != 0)
        {
          if (v64 >= v48) {
            v64 %= v48;
          }
        }
        else
        {
          v64 &= v48 - 1;
        }
        unint64_t v63 = (void *)(*v86 + 8 * v64);
      }
      *unint64_t v63 = v52;
LABEL_116:
      long long v89 = 0;
      ++*((void *)this + 23);
      std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::vector<TI::CP::ContinuousPathTestResult>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::vector<TI::CP::ContinuousPathTestResult>>,void *>>>>::reset[abi:nn180100]((uint64_t)&v89);
LABEL_117:
      unint64_t v65 = *((void *)v52 + 7);
      unint64_t v66 = *((void *)v52 + 6);
      if (v66 >= v65)
      {
        uint64_t v68 = *((void *)v52 + 5);
        uint64_t v69 = 0x34F72C234F72C235 * ((uint64_t)(v66 - v68) >> 3);
        if ((unint64_t)(v69 + 1) > 0x11A7B9611A7B961) {
          abort();
        }
        unint64_t v70 = 0x34F72C234F72C235 * ((uint64_t)(v65 - v68) >> 3);
        uint64_t v71 = 2 * v70;
        if (2 * v70 <= v69 + 1) {
          uint64_t v71 = v69 + 1;
        }
        if (v70 >= 0x8D3DCB08D3DCB0) {
          unint64_t v72 = 0x11A7B9611A7B961;
        }
        else {
          unint64_t v72 = v71;
        }
        uint64_t v93 = v52 + 56;
        if (v72) {
          unint64_t v72 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<TI::CP::ContinuousPathTestResult>>(v72);
        }
        else {
          uint64_t v73 = 0;
        }
        long long v89 = (char *)v72;
        long long v90 = (TI::CP::ContinuousPathTestResult *)(v72 + 232 * v69);
        uint64_t v91 = v90;
        unint64_t v92 = v72 + 232 * v73;
        TI::CP::ContinuousPathTestResult::ContinuousPathTestResult(v90, a2);
        uint64_t v91 = (TI::CP::ContinuousPathTestResult *)((char *)v91 + 232);
        std::vector<TI::CP::ContinuousPathTestResult>::__swap_out_circular_buffer((uint64_t *)v52 + 5, &v89);
        unint64_t v67 = *((void *)v52 + 6);
        std::__split_buffer<TI::CP::ContinuousPathTestResult>::~__split_buffer((uint64_t)&v89);
      }
      else
      {
        TI::CP::ContinuousPathTestResult::ContinuousPathTestResult(*((TI::CP::ContinuousPathTestResult **)v52 + 6), a2);
        unint64_t v67 = v66 + 232;
        *((void *)v52 + 6) = v66 + 232;
      }
      *((void *)v52 + 6) = v67;
      if (SHIBYTE(v88) < 0) {
        operator delete(__p[0]);
      }

LABEL_132:
      unint64_t v74 = *((void *)this + 30);
      unint64_t v75 = *((void *)this + 29);
      if (v75 < v74)
      {
        TI::CP::ContinuousPathTestResult::ContinuousPathTestResult(*((TI::CP::ContinuousPathTestResult **)this + 29), a2);
        unint64_t v76 = v75 + 232;
        *((void *)this + 29) = v75 + 232;
LABEL_144:
        *((void *)this + 29) = v76;
        goto LABEL_145;
      }
      uint64_t v77 = *((void *)this + 28);
      uint64_t v78 = 0x34F72C234F72C235 * ((uint64_t)(v75 - v77) >> 3);
      if ((unint64_t)(v78 + 1) <= 0x11A7B9611A7B961)
      {
        unint64_t v79 = 0x34F72C234F72C235 * ((uint64_t)(v74 - v77) >> 3);
        uint64_t v80 = 2 * v79;
        if (2 * v79 <= v78 + 1) {
          uint64_t v80 = v78 + 1;
        }
        if (v79 >= 0x8D3DCB08D3DCB0) {
          unint64_t v81 = 0x11A7B9611A7B961;
        }
        else {
          unint64_t v81 = v80;
        }
        uint64_t v93 = (char *)this + 240;
        if (v81) {
          unint64_t v81 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<TI::CP::ContinuousPathTestResult>>(v81);
        }
        else {
          uint64_t v82 = 0;
        }
        long long v89 = (char *)v81;
        long long v90 = (TI::CP::ContinuousPathTestResult *)(v81 + 232 * v78);
        uint64_t v91 = v90;
        unint64_t v92 = v81 + 232 * v82;
        TI::CP::ContinuousPathTestResult::ContinuousPathTestResult(v90, a2);
        uint64_t v91 = (TI::CP::ContinuousPathTestResult *)((char *)v91 + 232);
        std::vector<TI::CP::ContinuousPathTestResult>::__swap_out_circular_buffer((uint64_t *)this + 28, &v89);
        unint64_t v76 = *((void *)this + 29);
        std::__split_buffer<TI::CP::ContinuousPathTestResult>::~__split_buffer((uint64_t)&v89);
        goto LABEL_144;
      }
LABEL_148:
      abort();
    }
  }
}

void sub_23EFED81C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,char a21)
{
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::vector<TI::CP::ContinuousPathTestResult>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::vector<TI::CP::ContinuousPathTestResult>>,void *>>>>::reset[abi:nn180100]((uint64_t)&a21);
  if (a20 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

TI::CP::ContinuousPathTestResult *TI::CP::ContinuousPathTestResult::ContinuousPathTestResult(TI::CP::ContinuousPathTestResult *this, const TI::CP::ContinuousPathTestResult *a2)
{
  long long v4 = (const TI::CP::ContinuousPathTestResult *)((char *)a2 + 40);
  *(_DWORD *)this = *(_DWORD *)a2;
  int v5 = (TI::CP::ContinuousPathTestResult *)((char *)this + 40);
  MEMORY[0x2455C23B0]((char *)this + 8);
  KB::CandidateCollection::CandidateCollection(v5, v4);
  long long v6 = *((_OWORD *)a2 + 9);
  long long v7 = *((_OWORD *)a2 + 10);
  *((void *)this + 23) = 0;
  unint64_t v8 = (void *)((char *)this + 184);
  *((void *)this + 22) = (char *)this + 184;
  *((_OWORD *)this + 9) = v6;
  *((_OWORD *)this + 10) = v7;
  *((void *)this + 24) = 0;
  unint64_t v9 = (const TI::CP::ContinuousPathTestResult *)*((void *)a2 + 22);
  if (v9 != (const TI::CP::ContinuousPathTestResult *)((char *)a2 + 184))
  {
    do
    {
      uint64_t v10 = (void *)*v8;
      uint64_t v11 = (void *)((char *)this + 184);
      if (*((void **)this + 22) == v8) {
        goto LABEL_14;
      }
      unint64_t v12 = (void *)*v8;
      uint64_t v13 = (char *)this + 184;
      if (v10)
      {
        do
        {
          uint64_t v11 = v12;
          unint64_t v12 = (void *)v12[1];
        }
        while (v12);
      }
      else
      {
        do
        {
          uint64_t v11 = (void *)*((void *)v13 + 2);
          BOOL v14 = *v11 == (void)v13;
          uint64_t v13 = (char *)v11;
        }
        while (v14);
      }
      uint64_t v15 = v11[5] ? (const char *)v11[5] : (const char *)(v11 + 6);
      double v16 = *((void *)v9 + 5) ? (const char *)*((void *)v9 + 5) : (char *)v9 + 48;
      if (strcmp(v15, v16) < 0)
      {
LABEL_14:
        if (v10)
        {
          unint64_t v23 = v11;
          int v17 = (uint64_t **)(v11 + 1);
        }
        else
        {
          unint64_t v23 = (void *)((char *)this + 184);
          int v17 = (uint64_t **)((char *)this + 184);
        }
      }
      else
      {
        int v17 = (uint64_t **)std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::__find_equal<KB::String>((uint64_t)this + 176, &v23, (uint64_t)v9 + 32);
      }
      if (!*v17)
      {
        std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::__construct_node<std::pair<KB::String const,TI::CP::Path> const&>((uint64_t)v22, (uint64_t)this + 176, (uint64_t)v9 + 32);
        std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::__insert_node_at((uint64_t **)this + 22, (uint64_t)v23, v17, v22[0]);
        v22[0] = 0;
        std::unique_ptr<std::__tree_node<std::__value_type<KB::String,TI::CP::Path>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<KB::String,TI::CP::Path>,void *>>>>::reset[abi:nn180100]((uint64_t *)v22);
      }
      unint64_t v18 = (const TI::CP::ContinuousPathTestResult *)*((void *)v9 + 1);
      if (v18)
      {
        do
        {
          unint64_t v19 = v18;
          unint64_t v18 = *(const TI::CP::ContinuousPathTestResult **)v18;
        }
        while (v18);
      }
      else
      {
        do
        {
          unint64_t v19 = (const TI::CP::ContinuousPathTestResult *)*((void *)v9 + 2);
          BOOL v14 = *(void *)v19 == (void)v9;
          unint64_t v9 = v19;
        }
        while (!v14);
      }
      unint64_t v9 = v19;
    }
    while (v19 != (const TI::CP::ContinuousPathTestResult *)((char *)a2 + 184));
  }
  long long v20 = *(_OWORD *)((char *)a2 + 200);
  *(_OWORD *)((char *)this + 212) = *(_OWORD *)((char *)a2 + 212);
  *(_OWORD *)((char *)this + 200) = v20;
  return this;
}

void sub_23EFEDAA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, KB::String *a9, uint64_t a10)
{
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100](uint64_t *a1, unint64_t a2)
{
  if (a2 > 0x20)
  {
    if (a2 <= 0x40)
    {
      uint64_t v5 = *(uint64_t *)((char *)a1 + a2 - 16);
      uint64_t v6 = *a1 - 0x3C5A37A36834CED9 * (v5 + a2);
      uint64_t v8 = a1[2];
      uint64_t v7 = a1[3];
      uint64_t v9 = __ROR8__(v6 + v7, 52);
      uint64_t v10 = v6 + a1[1];
      uint64_t v11 = __ROR8__(v10, 7);
      uint64_t v12 = v10 + v8;
      uint64_t v13 = *(uint64_t *)((char *)a1 + a2 - 32) + v8;
      uint64_t v14 = *(uint64_t *)((char *)a1 + a2 - 8) + v7;
      uint64_t v15 = __ROR8__(v14 + v13, 52);
      uint64_t v16 = v11 + __ROR8__(*a1 - 0x3C5A37A36834CED9 * (v5 + a2), 37) + v9;
      uint64_t v17 = __ROR8__(v13, 37);
      uint64_t v18 = *(uint64_t *)((char *)a1 + a2 - 24) + v13;
      uint64_t v19 = __ROR8__(v18, 7);
      uint64_t v20 = v16 + __ROR8__(v12, 31);
      uint64_t v21 = v18 + v5;
      uint64_t v22 = v21 + v14;
      unint64_t v23 = 0x9AE16A3B2F90404FLL;
      unint64_t v24 = 0xC3A5C85C97CB3127 * (v22 + v20) - 0x651E95C4D06FBFB1 * (v12 + v7 + v17 + v19 + v15 + __ROR8__(v21, 31));
      unint64_t v25 = v20 - 0x3C5A37A36834CED9 * (v24 ^ (v24 >> 47));
      return (v25 ^ (v25 >> 47)) * v23;
    }
    unint64_t v4 = 0x9DDFEA08EB382D69;
    uint64_t v32 = *(uint64_t *)((char *)a1 + a2 - 48);
    uint64_t v33 = *(uint64_t *)((char *)a1 + a2 - 40);
    uint64_t v34 = *(uint64_t *)((char *)a1 + a2 - 24);
    uint64_t v36 = *(uint64_t *)((char *)a1 + a2 - 64);
    uint64_t v35 = *(uint64_t *)((char *)a1 + a2 - 56);
    uint64_t v37 = *(uint64_t *)((char *)a1 + a2 - 16);
    uint64_t v38 = *(uint64_t *)((char *)a1 + a2 - 8);
    unint64_t v39 = v35 + v37;
    unint64_t v40 = 0x9DDFEA08EB382D69
        * (v34 ^ ((0x9DDFEA08EB382D69 * (v34 ^ (v32 + a2))) >> 47) ^ (0x9DDFEA08EB382D69 * (v34 ^ (v32 + a2))));
    unint64_t v41 = 0x9DDFEA08EB382D69 * (v40 ^ (v40 >> 47));
    unint64_t v42 = v36 + a2 + v35 + v32;
    uint64_t v43 = v42 + v33;
    unint64_t v44 = __ROR8__(v42, 44) + v36 + a2 + __ROR8__(v33 + v36 + a2 - 0x622015F714C7D297 * (v40 ^ (v40 >> 47)), 21);
    uint64_t v45 = v35 + v37 + *(uint64_t *)((char *)a1 + a2 - 32) - 0x4B6D499041670D8DLL;
    uint64_t v46 = v45 + v34 + v37;
    uint64_t v47 = __ROR8__(v46, 44);
    uint64_t v48 = v46 + v38;
    uint64_t v49 = v47 + v45 + __ROR8__(v45 + v33 + v38, 21);
    uint64_t v51 = *a1;
    unint64_t v50 = a1 + 4;
    unint64_t v52 = v51 - 0x4B6D499041670D8DLL * v33;
    uint64_t v53 = -(uint64_t)((a2 - 1) & 0xFFFFFFFFFFFFFFC0);
    do
    {
      uint64_t v54 = *(v50 - 3);
      uint64_t v55 = v52 + v43 + v39 + v54;
      uint64_t v56 = v50[2];
      uint64_t v57 = v50[3];
      uint64_t v58 = v50[1];
      unint64_t v39 = v58 + v43 - 0x4B6D499041670D8DLL * __ROR8__(v39 + v44 + v56, 42);
      uint64_t v59 = v41 + v48;
      uint64_t v60 = *(v50 - 2);
      uint64_t v61 = *(v50 - 1);
      uint64_t v62 = *(v50 - 4) - 0x4B6D499041670D8DLL * v44;
      uint64_t v63 = v62 + v48 + v61;
      uint64_t v64 = v62 + v54 + v60;
      uint64_t v43 = v64 + v61;
      uint64_t v65 = __ROR8__(v64, 44) + v62;
      unint64_t v66 = (0xB492B66FBE98F273 * __ROR8__(v55, 37)) ^ v49;
      unint64_t v52 = 0xB492B66FBE98F273 * __ROR8__(v59, 33);
      unint64_t v44 = v65 + __ROR8__(v63 + v66, 21);
      unint64_t v67 = v52 + v49 + *v50;
      uint64_t v48 = v67 + v58 + v56 + v57;
      uint64_t v49 = __ROR8__(v67 + v58 + v56, 44) + v67 + __ROR8__(v39 + v60 + v67 + v57, 21);
      v50 += 8;
      unint64_t v41 = v66;
      v53 += 64;
    }
    while (v53);
    unint64_t v68 = v52
        - 0x622015F714C7D297
        * ((0x9DDFEA08EB382D69
          * (v49 ^ ((0x9DDFEA08EB382D69 * (v49 ^ v44)) >> 47) ^ (0x9DDFEA08EB382D69 * (v49 ^ v44)))) ^ ((0x9DDFEA08EB382D69 * (v49 ^ ((0x9DDFEA08EB382D69 * (v49 ^ v44)) >> 47) ^ (0x9DDFEA08EB382D69 * (v49 ^ v44)))) >> 47));
    unint64_t v69 = 0x9DDFEA08EB382D69
        * (v68 ^ (v66
                - 0x4B6D499041670D8DLL * (v39 ^ (v39 >> 47))
                - 0x622015F714C7D297
                * ((0x9DDFEA08EB382D69
                  * (v48 ^ ((0x9DDFEA08EB382D69 * (v48 ^ v43)) >> 47) ^ (0x9DDFEA08EB382D69 * (v48 ^ v43)))) ^ ((0x9DDFEA08EB382D69 * (v48 ^ ((0x9DDFEA08EB382D69 * (v48 ^ v43)) >> 47) ^ (0x9DDFEA08EB382D69 * (v48 ^ v43)))) >> 47))));
    unint64_t v70 = 0x9DDFEA08EB382D69 * (v68 ^ (v69 >> 47) ^ v69);
    goto LABEL_13;
  }
  if (a2 > 0x10)
  {
    uint64_t v26 = a1[1];
    unint64_t v27 = 0xB492B66FBE98F273 * *a1;
    uint64_t v28 = __ROR8__(0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)a1 + a2 - 8), 30) + __ROR8__(v27 - v26, 43);
    unint64_t v29 = v27 + a2 + __ROR8__(v26 ^ 0xC949D7C7509E6557, 20) - 0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)a1 + a2 - 8);
    unint64_t v23 = 0x9DDFEA08EB382D69;
    unint64_t v30 = 0x9DDFEA08EB382D69 * (v29 ^ (v28 - 0x3C5A37A36834CED9 * *(uint64_t *)((char *)a1 + a2 - 16)));
    unint64_t v31 = v29 ^ (v30 >> 47) ^ v30;
LABEL_8:
    unint64_t v25 = 0x9DDFEA08EB382D69 * v31;
    return (v25 ^ (v25 >> 47)) * v23;
  }
  if (a2 < 9)
  {
    if (a2 >= 4)
    {
      uint64_t v72 = *(unsigned int *)((char *)a1 + a2 - 4);
      unint64_t v23 = 0x9DDFEA08EB382D69;
      unint64_t v73 = 0x9DDFEA08EB382D69 * (((8 * *(_DWORD *)a1) + a2) ^ v72);
      unint64_t v31 = v72 ^ (v73 >> 47) ^ v73;
      goto LABEL_8;
    }
    unint64_t v4 = 0x9AE16A3B2F90404FLL;
    if (!a2) {
      return v4;
    }
    unint64_t v70 = (0xC949D7C7509E6557 * (a2 + 4 * *((unsigned __int8 *)a1 + a2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                   * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8)));
LABEL_13:
    v4 *= v70 ^ (v70 >> 47);
    return v4;
  }
  uint64_t v2 = *(uint64_t *)((char *)a1 + a2 - 8);
  uint64_t v3 = __ROR8__(v2 + a2, a2);
  return (0x9DDFEA08EB382D69
        * ((0x9DDFEA08EB382D69
          * (v3 ^ ((0x9DDFEA08EB382D69 * (v3 ^ *a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v3 ^ *a1)))) ^ ((0x9DDFEA08EB382D69 * (v3 ^ ((0x9DDFEA08EB382D69 * (v3 ^ *a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v3 ^ *a1)))) >> 47))) ^ v2;
}

BOOL std::equal_to<std::string>::operator()[abi:nn180100](unsigned __int8 *a1, unsigned __int8 *a2)
{
  uint64_t v2 = a1[23];
  if ((v2 & 0x80u) == 0) {
    uint64_t v3 = a1[23];
  }
  else {
    uint64_t v3 = *((void *)a1 + 1);
  }
  uint64_t v4 = a2[23];
  int v5 = (char)v4;
  if ((v4 & 0x80u) != 0) {
    uint64_t v4 = *((void *)a2 + 1);
  }
  if (v3 != v4) {
    return 0;
  }
  if (v5 < 0) {
    a2 = *(unsigned __int8 **)a2;
  }
  if ((v2 & 0x80) != 0) {
    return memcmp(*(const void **)a1, a2, *((void *)a1 + 1)) == 0;
  }
  if (!a1[23]) {
    return 1;
  }
  uint64_t v6 = v2 - 1;
  do
  {
    int v8 = *a1++;
    int v7 = v8;
    int v10 = *a2++;
    int v9 = v10;
    BOOL v12 = v6-- != 0;
    BOOL v13 = v7 == v9;
    BOOL v14 = v7 == v9;
  }
  while (v13 && v12);
  return v14;
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::vector<TI::CP::ContinuousPathTestResult>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::vector<TI::CP::ContinuousPathTestResult>>,void *>>>>::reset[abi:nn180100](uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  *(void *)a1 = 0;
  if (v1)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__destroy_at[abi:nn180100]<std::pair<std::string const,std::vector<TI::CP::ContinuousPathTestResult>>,0>((uint64_t)v1 + 16);
    }
    operator delete(v1);
  }
}

void std::__destroy_at[abi:nn180100]<std::pair<std::string const,std::vector<TI::CP::ContinuousPathTestResult>>,0>(uint64_t a1)
{
  uint64_t v3 = (void **)(a1 + 24);
  std::vector<TI::CP::ContinuousPathTestResult>::__destroy_vector::operator()[abi:nn180100](&v3);
  if (*(char *)(a1 + 23) < 0)
  {
    uint64_t v2 = *(void **)a1;
    operator delete(v2);
  }
}

void std::vector<TI::CP::ContinuousPathTestResult>::__destroy_vector::operator()[abi:nn180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    int v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 232;
        std::__destroy_at[abi:nn180100]<TI::CP::ContinuousPathTestResult,0>(v4);
      }
      while ((void *)v4 != v2);
      int v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::__destroy_at[abi:nn180100]<TI::CP::ContinuousPathTestResult,0>(uint64_t a1)
{
  std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::destroy(*(void **)(a1 + 184));
  uint64_t v2 = (void **)(a1 + 112);
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v2);
  uint64_t v2 = (void **)(a1 + 88);
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v2);
  uint64_t v2 = (void **)(a1 + 64);
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v2);
  uint64_t v2 = (void **)(a1 + 40);
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v2);
  KB::String::~String((KB::String *)(a1 + 8));
}

void std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::destroy(void *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::destroy(*a1);
    std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::destroy(a1[1]);
    std::__destroy_at[abi:nn180100]<std::pair<KB::String const,TI::CP::Path>,0>((KB::String *)(a1 + 4));
    operator delete(a1);
  }
}

void std::__destroy_at[abi:nn180100]<std::pair<KB::String const,TI::CP::Path>,0>(KB::String *this)
{
  uint64_t v2 = (void *)*((void *)this + 7);
  if (v2)
  {
    *((void *)this + 8) = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)*((void *)this + 4);
  if (v3)
  {
    *((void *)this + 5) = v3;
    operator delete(v3);
  }
  KB::String::~String(this);
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<TI::CP::ContinuousPathTestResult>>(unint64_t a1)
{
  if (a1 >= 0x11A7B9611A7B962) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  return operator new(232 * a1);
}

uint64_t std::vector<TI::CP::ContinuousPathTestResult>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t v5 = *a1;
  uint64_t v4 = a1[1];
  uint64_t result = a2[1];
  while (v4 != v5)
  {
    v4 -= 232;
    uint64_t result = std::construct_at[abi:nn180100]<TI::CP::ContinuousPathTestResult,TI::CP::ContinuousPathTestResult,TI::CP::ContinuousPathTestResult*>(result - 232, v4);
  }
  a2[1] = result;
  uint64_t v7 = *a1;
  *a1 = result;
  a2[1] = v7;
  uint64_t v8 = a1[1];
  a1[1] = a2[2];
  a2[2] = v8;
  uint64_t v9 = a1[2];
  a1[2] = a2[3];
  a2[3] = v9;
  *a2 = a2[1];
  return result;
}

uint64_t std::__split_buffer<TI::CP::ContinuousPathTestResult>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 232;
    std::__destroy_at[abi:nn180100]<TI::CP::ContinuousPathTestResult,0>(i - 232);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t std::construct_at[abi:nn180100]<TI::CP::ContinuousPathTestResult,TI::CP::ContinuousPathTestResult,TI::CP::ContinuousPathTestResult*>(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  KB::String::String();
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0;
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a2 + 40) = 0;
  *(void *)(a2 + 48) = 0;
  *(void *)(a2 + 56) = 0;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 80) = 0;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a2 + 64) = 0;
  *(void *)(a2 + 72) = 0;
  *(void *)(a2 + 80) = 0;
  *(void *)(a1 + 88) = 0;
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 104) = 0;
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a2 + 88) = 0;
  *(void *)(a2 + 96) = 0;
  *(void *)(a2 + 104) = 0;
  *(void *)(a1 + 112) = 0;
  *(void *)(a1 + 120) = 0;
  *(void *)(a1 + 128) = 0;
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a2 + 112) = 0;
  *(void *)(a2 + 120) = 0;
  *(void *)(a2 + 128) = 0;
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  long long v4 = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 160) = v4;
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  uint64_t v5 = (void *)(a2 + 184);
  uint64_t v6 = *(void *)(a2 + 184);
  *(void *)(a1 + 184) = v6;
  uint64_t v7 = a1 + 184;
  uint64_t v8 = *(void *)(a2 + 192);
  *(void *)(a1 + 192) = v8;
  if (v8)
  {
    *(void *)(v6 + 16) = v7;
    *(void *)(a2 + 176) = v5;
    *uint64_t v5 = 0;
    *(void *)(a2 + 192) = 0;
  }
  else
  {
    *(void *)(a1 + 176) = v7;
  }
  long long v9 = *(_OWORD *)(a2 + 200);
  *(_OWORD *)(a1 + 212) = *(_OWORD *)(a2 + 212);
  *(_OWORD *)(a1 + 200) = v9;
  return a1;
}

std::vector<unsigned int> *std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::__construct_node<std::pair<KB::String const,TI::CP::Path> const&>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a2 + 8;
  uint64_t v6 = (char *)operator new(0x70uLL);
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = 0;
  MEMORY[0x2455C23B0](v6 + 32, a3);
  uint64_t result = TI::CP::Path::Path((std::vector<unsigned int> *)(v6 + 64), (const std::vector<unsigned int> *)(a3 + 32));
  *(unsigned char *)(a1 + 16) = 1;
  return result;
}

void sub_23EFEE4E0(_Unwind_Exception *a1)
{
  KB::String::~String(v2);
  std::unique_ptr<std::__tree_node<std::__value_type<KB::String,TI::CP::Path>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<KB::String,TI::CP::Path>,void *>>>>::reset[abi:nn180100](v1);
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  uint64_t v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  uint64_t result = std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

void std::unique_ptr<std::__tree_node<std::__value_type<KB::String,TI::CP::Path>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<KB::String,TI::CP::Path>,void *>>>>::reset[abi:nn180100](uint64_t *a1)
{
  uint64_t v1 = *a1;
  *a1 = 0;
  if (v1)
  {
    if (*((unsigned char *)a1 + 16)) {
      std::__destroy_at[abi:nn180100]<std::pair<KB::String const,TI::CP::Path>,0>((KB::String *)(v1 + 32));
    }
    operator delete((void *)v1);
  }
}

void *std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::__find_equal<KB::String>(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = (void *)(a1 + 8);
  long long v4 = *(void **)(a1 + 8);
  if (v4)
  {
    if (*(void *)(a3 + 8)) {
      uint64_t v6 = *(const char **)(a3 + 8);
    }
    else {
      uint64_t v6 = (const char *)(a3 + 16);
    }
    do
    {
      while (1)
      {
        uint64_t v7 = v4;
        uint64_t v8 = (void *)v4[5];
        long long v9 = (const char *)(v8 ? v8 : v7 + 6);
        if ((strcmp(v6, v9) & 0x80000000) == 0) {
          break;
        }
        long long v4 = (void *)*v7;
        uint64_t v5 = v7;
        if (!*v7) {
          goto LABEL_15;
        }
      }
      if ((strcmp(v9, v6) & 0x80000000) == 0) {
        break;
      }
      uint64_t v5 = v7 + 1;
      long long v4 = (void *)v7[1];
    }
    while (v4);
  }
  else
  {
    uint64_t v7 = (void *)(a1 + 8);
  }
LABEL_15:
  *a2 = v7;
  return v5;
}

uint64_t TI::CP::TestResultsSummarizer::summarize_results(uint64_t a1, const char *a2, const char *a3)
{
  uint64_t v3 = a3;
  long long v4 = a2;
  v39[2] = *MEMORY[0x263EF8340];
  unsigned int v6 = *(_DWORD *)(a1 + 72);
  unsigned int v7 = *(_DWORD *)(a1 + 92);
  double v8 = (double)v7;
  unsigned int v9 = *(_DWORD *)(a1 + 76) + v6;
  unsigned int v10 = *(_DWORD *)(a1 + 80) + v9;
  *(_DWORD *)(a1 + 76) = v9;
  *(_DWORD *)(a1 + 80) = v10;
  uint64_t v11 = a3;
  if (a3[23] < 0) {
    uint64_t v11 = *(const char **)a3;
  }
  double v12 = (double)v9;
  BOOL v13 = a2;
  if (a2[23] < 0) {
    BOOL v13 = *(const char **)a2;
  }
  double v14 = v12 * 100.0;
  printf("%s %s top candidate hit rate: %f%%, %g%% (%d/%d)\n", v11, v13, (double)v6 * 100.0 / v8, 100.0 - (double)v6 * 100.0 / v8, v6, v7);
  uint64_t v15 = v3;
  if (v3[23] < 0) {
    uint64_t v15 = *(const char **)v3;
  }
  uint64_t v16 = v4;
  if (v4[23] < 0) {
    uint64_t v16 = *(const char **)v4;
  }
  printf("%s %s top-4 candidate hit rate: %f%%, %g%% (%d/%d)\n", v15, v16, v14 / v8, 100.0 - v14 / v8, *(_DWORD *)(a1 + 76), *(_DWORD *)(a1 + 92));
  uint64_t v17 = v3;
  if (v3[23] < 0) {
    uint64_t v17 = *(const char **)v3;
  }
  uint64_t v18 = v4;
  if (v4[23] < 0) {
    uint64_t v18 = *(const char **)v4;
  }
  printf("%s %s top-40 candidate hit rate: %f%%, %g%% (%d/%d)\n", v17, v18, (double)v10 * 100.0 / v8, 100.0 - (double)v10 * 100.0 / v8, *(_DWORD *)(a1 + 80), *(_DWORD *)(a1 + 92));
  if (*(unsigned char *)(a1 + 96))
  {
    printf("top1 path saved: %g/%g (%g%% of total)\n", *(double *)(a1 + 104), *(double *)(a1 + 120), *(double *)(a1 + 104) * 100.0 / *(double *)(a1 + 120));
    printf("top3 path saved: %g/%g (%g%% of total)\n", *(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 112) * 100.0 / *(double *)(a1 + 120));
  }
  if (*(unsigned char *)(a1 + 128))
  {
    puts("Failing cases:");
    uint64_t v20 = *(int **)(a1 + 136);
    uint64_t v21 = *(int **)(a1 + 144);
    while (v20 != v21)
    {
      uint64_t v22 = (KB::Candidate *)*((void *)v20 + 5);
      if (v22 == *((KB::Candidate **)v20 + 6)) {
        MEMORY[0x2455C23A0](&v37, "(null)");
      }
      else {
        KB::Candidate::capitalized_string(&v37, v22);
      }
      if (*((_WORD *)v20 + 4))
      {
        unint64_t v23 = (const char *)*((void *)v20 + 2);
        if (!v23) {
          unint64_t v23 = (const char *)(v20 + 6);
        }
      }
      else
      {
        unint64_t v23 = "";
      }
      int v25 = *v20;
      v20 += 58;
      int v24 = v25;
      uint64_t v26 = v38;
      if (!v38) {
        uint64_t v26 = (const char *)v39;
      }
      if ((_WORD)v37) {
        unint64_t v27 = v26;
      }
      else {
        unint64_t v27 = "";
      }
      printf("[%d] expected='%s' observed='%s'\n", v24, v23, v27);
      KB::String::~String((KB::String *)&v37);
    }
    putchar(10);
  }
  unsigned int v28 = *(_DWORD *)(a1 + 304);
  LODWORD(v19) = *(_DWORD *)(a1 + 92);
  double v29 = (double)v19;
  unsigned int v30 = *(_DWORD *)(a1 + 296);
  if (v3[23] < 0) {
    uint64_t v3 = *(const char **)v3;
  }
  double v31 = (double)v28 * 100.0 / v29;
  double v32 = (double)v30 * 100.0 / v29;
  double v33 = (double)*(unsigned int *)(a1 + 300) * 100.0 / v29;
  if (v4[23] < 0) {
    long long v4 = *(const char **)v4;
  }
  uint64_t result = printf("%s %s Confidence hit rate: %f%% (%d), false-low-conf: %f%% (%d), false-high-conf: %f%% (%d))\n", v3, v4, v31, v28, v32, v30, v33, *(_DWORD *)(a1 + 300));
  if (*(unsigned char *)(a1 + 97))
  {
    for (uint64_t i = *(uint64_t **)(a1 + 176); i; uint64_t i = (uint64_t *)*i)
    {
      uint64_t v36 = (const char *)(i + 2);
      if (*((char *)i + 39) < 0) {
        uint64_t v36 = *(const char **)v36;
      }
      printf("algo: %s, helped: %lu\n", v36, 0x34F72C234F72C235 * ((i[6] - i[5]) >> 3));
    }
    printf("base recognizer index matches top1: %lu\n", 0x34F72C234F72C235 * ((uint64_t)(*(void *)(a1 + 56) - *(void *)(a1 + 48)) >> 3));
    printf("base recognizer index is higher than top1: %lu\n", 0x34F72C234F72C235 * ((uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3));
    return printf("top1 not in base recognizer: %lu\n", 0x34F72C234F72C235 * ((uint64_t)(*(void *)(a1 + 32) - *(void *)(a1 + 24)) >> 3));
  }
  return result;
}

uint64_t TI::CP::TestResultsSummarizer::dump_match_indices(TI::CP::TestResultsSummarizer *this)
{
  uint64_t v1 = (unsigned int *)*((void *)this + 31);
  uint64_t v2 = (unsigned int *)*((void *)this + 32);
  while (v1 != v2)
  {
    unsigned int v4 = *v1++;
    unsigned int v3 = v4;
    int v5 = v4 + 48;
    if (v4 >= 0xA) {
      int v5 = 62;
    }
    if (v3 == -1) {
      int v6 = 109;
    }
    else {
      int v6 = v5;
    }
    putchar(v6);
  }
  return putchar(10);
}

double TI::CP::TestResultsSummarizer::calculate_total_rank_score(TI::CP::TestResultsSummarizer *this, double a2, double a3)
{
  LODWORD(a3) = *((_DWORD *)this + 23);
  return *((double *)this + 34) / (double)*(unint64_t *)&a3;
}

uint64_t TI::CP::get_touch_stage()
{
  if (TI::CP::operator==()) {
    return 0;
  }
  if (TI::CP::operator==()) {
    return 2;
  }
  return 1;
}

unsigned int *TI::CP::make_candidate_refinery(atomic_uint *volatile *a1, uint64_t a2)
{
  atomic_uint *volatile v5 = *a1;
  if (*a1) {
    atomic_fetch_add(*a1, 1u);
  }
  uint64_t v2 = *(std::__shared_weak_count **)(a2 + 8);
  unsigned int v4 = v2;
  if (v2) {
    atomic_fetch_add_explicit(&v2->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  KB::NgramCandidateRefinery::create();
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v4);
  }
  uint64_t result = (unsigned int *)v5;
  if (v5) {
    return WTF::RefCounted<KB::DictionaryContainer>::deref((unsigned int *)v5);
  }
  return result;
}

void sub_23EFEEBD0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::__shared_weak_count *a11, unsigned int *a12)
{
  if (a11) {
    std::__shared_weak_count::__release_shared[abi:nn180100](a11);
  }
  if (a12) {
    WTF::RefCounted<KB::DictionaryContainer>::deref(a12);
  }
  _Unwind_Resume(exception_object);
}

void TI::CP::createAndLoadDictionaryContainerMultiLexicon(TI::CP *this@<X0>, NSString *a2@<X1>, NSString *a3@<X2>, float a4@<S0>, void ***a5@<X8>)
{
  v34[6] = *MEMORY[0x263EF8340];
  unsigned int v10 = this;
  uint64_t v11 = a2;
  double v12 = a3;
  if (v12)
  {
    UIKeyboardDynamicDictionaryFile();
    BOOL v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    UIKeyboardDynamicDictionaryFile();
    double v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    double v14 = 0;
    BOOL v13 = 0;
  }
  TI::CP::getLexiconInfo(v10, v13, 1.0 - a4, (uint64_t)v30);
  TI::CP::getLexiconInfo((TI::CP *)v11, v14, a4, (uint64_t)v25);
  KB::LexiconInfo::LexiconInfo((uint64_t)v23, (uint64_t)v30);
  KB::LexiconInfo::LexiconInfo((uint64_t)&v24, (uint64_t)v25);
  uint64_t v21 = 0;
  uint64_t v15 = (char *)operator new(0x160uLL);
  char v16 = 0;
  uint64_t v17 = 0;
  uint64_t v20 = v15;
  uint64_t v22 = v15 + 352;
  do
  {
    char v18 = v16;
    uint64_t v15 = (char *)(KB::LexiconInfo::LexiconInfo((uint64_t)v15, (uint64_t)&v23[22 * v17]) + 176);
    char v16 = 1;
    uint64_t v17 = 1;
  }
  while ((v18 & 1) == 0);
  uint64_t v21 = v15;
  uint64_t v19 = 44;
  do
  {
    KB::String::~String((KB::String *)&v23[v19 - 6]);
    KB::String::~String((KB::String *)&v23[v19 - 10]);
    KB::String::~String((KB::String *)&v23[v19 - 14]);
    KB::String::~String((KB::String *)&v23[v19 - 18]);
    KB::String::~String((KB::String *)&v23[v19 - 22]);
    v19 -= 22;
  }
  while (v19 * 8);
  KB::DictionaryContainer::create_multilexicon();
  *a5 = v23[0];
  v23[0] = (void **)&v20;
  std::vector<KB::LexiconInfo>::__destroy_vector::operator()[abi:nn180100](v23);
  KB::String::~String((KB::String *)&v29);
  KB::String::~String((KB::String *)&v28);
  KB::String::~String((KB::String *)&v27);
  KB::String::~String((KB::String *)&v26);
  KB::String::~String((KB::String *)v25);
  KB::String::~String((KB::String *)v34);
  KB::String::~String((KB::String *)&v33);
  KB::String::~String((KB::String *)&v32);
  KB::String::~String((KB::String *)&v31);
  KB::String::~String((KB::String *)v30);
}

void sub_23EFEEE44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void **a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
  std::vector<KB::LexiconInfo>::__destroy_vector::operator()[abi:nn180100](&a13);
  KB::LexiconInfo::~LexiconInfo((KB::LexiconInfo *)&a57);
  KB::LexiconInfo::~LexiconInfo((KB::LexiconInfo *)&STACK[0x230]);

  _Unwind_Resume(a1);
}

void TI::CP::getLexiconInfo(TI::CP *this@<X0>, NSString *a2@<X1>, float a3@<S0>, uint64_t a4@<X8>)
{
  double v8 = this;
  uint64_t v19 = a2;
  UIKeyboardStaticUnigramsFile();
  unsigned int v9 = (KB *)objc_claimAutoreleasedReturnValue();
  deltaUnigramsFilePathForInputMode((uint64_t)v8);
  unsigned int v10 = (KB *)objc_claimAutoreleasedReturnValue();
  phrasesFilePathForInputMode((uint64_t)v8);
  uint64_t v11 = (KB *)objc_claimAutoreleasedReturnValue();
  dynamicFilePathForInputMode(v8, v19);
  double v12 = (KB *)objc_claimAutoreleasedReturnValue();
  uint64_t v20 = v8;
  [(TI::CP *)v20 UTF8String];
  int v13 = TILexiconIDForLocaleIdentifier();
  KB::utf8_string((uint64_t *)a4, v20, v14);
  KB::utf8_string((uint64_t *)(a4 + 32), v9, v15);
  KB::utf8_string((uint64_t *)(a4 + 64), v10, v16);
  KB::utf8_string((uint64_t *)(a4 + 96), v11, v17);
  KB::utf8_string((uint64_t *)(a4 + 128), v12, v18);
  *(_DWORD *)(a4 + 160) = v13;
  *(unsigned char *)(a4 + 164) = 0;
  *(float *)(a4 + 168) = a3;
}

void sub_23EFEF034(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9)
{
  KB::String::~String(v9);
  KB::String::~String(v17);
  KB::String::~String(v16);
  KB::String::~String(v13);

  _Unwind_Resume(a1);
}

void TI::CP::createAndLoadLanguageModelContainer(TI::CP *this, NSString *a2, NSString *a3, float a4, NSString *a5)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  unsigned int v7 = this;
  double v8 = a2;
  TI::CP::createAndLoadLanguageModel(v7, a3, (NSString *)1);
}

void sub_23EFEF3D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,std::__shared_weak_count *a32,uint64_t a33,std::__shared_weak_count *a34,void *__p,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43)
{
  std::vector<KB::LanguageModelLexiconGroup>::__destroy_vector::operator()[abi:nn180100]((void ***)&__p);
  KB::LanguageModelLexiconGroup::~LanguageModelLexiconGroup((KB::LanguageModelLexiconGroup *)&a15);
  KB::LanguageModelLexiconGroup::~LanguageModelLexiconGroup((KB::LanguageModelLexiconGroup *)&a24);
  if (a32) {
    std::__shared_weak_count::__release_shared[abi:nn180100](a32);
  }
  if (a34) {
    std::__shared_weak_count::__release_shared[abi:nn180100](a34);
  }

  _Unwind_Resume(a1);
}

void TI::CP::createAndLoadLanguageModel(TI::CP *this, NSString *a2, NSString *a3)
{
  v8[1] = *MEMORY[0x263EF8340];
  unsigned int v4 = this;
  atomic_uint *volatile v5 = a2;
  uint64_t v6 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v4];
  unsigned int v7 = [MEMORY[0x263F7EA88] inputModeWithIdentifier:v4];
  v8[0] = v6;
  [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  objc_claimAutoreleasedReturnValue();
  [v7 doesSupportInlineCompletion];
  KB::LanguageModelConfig::LanguageModelConfig();
  operator new();
}

void sub_23EFEF6E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  double v12 = *(std::__shared_weak_count **)(v10 + 8);
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v12);
  }
  KB::LanguageModelConfig::~LanguageModelConfig((KB::LanguageModelConfig *)va);

  _Unwind_Resume(a1);
}

void std::shared_ptr<KB::LanguageModel>::shared_ptr[abi:nn180100]<KB::LanguageModelStr,void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_23EFEF848(_Unwind_Exception *exception_object)
{
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__shared_ptr_pointer<KB::LanguageModelStr *,std::shared_ptr<KB::LanguageModel>::__shared_ptr_default_delete<KB::LanguageModel,KB::LanguageModelStr>,std::allocator<KB::LanguageModelStr>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

void std::__shared_ptr_pointer<KB::LanguageModelStr *,std::shared_ptr<KB::LanguageModel>::__shared_ptr_default_delete<KB::LanguageModel,KB::LanguageModelStr>,std::allocator<KB::LanguageModelStr>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x2455C26F0);
}

void TI::CP::createAndLoadDictionaryContainer(TI::CP *this@<X0>, NSString *a2@<X1>, void *a3@<X8>)
{
  v24[6] = *MEMORY[0x263EF8340];
  uint64_t v6 = this;
  unsigned int v7 = a2;
  if (v7)
  {
    UIKeyboardDynamicDictionaryFile();
    double v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    double v8 = 0;
  }
  TI::CP::getLexiconInfo(v6, v8, 1.0, (uint64_t)v20);
  KB::LexiconInfo::LexiconInfo((uint64_t)v15, (uint64_t)v20);
  uint64_t v9 = (char *)operator new(0xB0uLL);
  uint64_t v10 = v9 + 176;
  v12[0] = v9;
  v12[2] = v9 + 176;
  KB::LexiconInfo::LexiconInfo((uint64_t)v9, (uint64_t)v15);
  v12[1] = v10;
  KB::DictionaryContainer::create_multilexicon();
  uint64_t v11 = v13;
  uint64_t v13 = 0;
  double v14 = (void **)v12;
  *a3 = v11;
  std::vector<KB::LexiconInfo>::__destroy_vector::operator()[abi:nn180100](&v14);
  KB::String::~String((KB::String *)&v19);
  KB::String::~String((KB::String *)&v18);
  KB::String::~String((KB::String *)&v17);
  KB::String::~String((KB::String *)&v16);
  KB::String::~String((KB::String *)v15);
  KB::String::~String((KB::String *)v24);
  KB::String::~String((KB::String *)&v23);
  KB::String::~String((KB::String *)&v22);
  KB::String::~String((KB::String *)&v21);
  KB::String::~String((KB::String *)v20);
}

void sub_23EFEFA6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23EFF0350(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1156(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1157(uint64_t a1)
{
}

void TI::CP::CPTestCaseParamTrainer::evaluate_params(uint64_t a1, int a2, long long *a3, uint64_t *a4)
{
  uint64_t v5 = *(void *)(a1 + 80);
  if (*(void *)(v5 + 192))
  {
    int v6 = 0;
    TI::CP::CPTestCaseEval::evaluate_tests(v5, &v6, 0, (uint64_t)a3, 0, (uint64_t)v7);
    TI::CP::TestResultsSummarizer::dump_match_indices((TI::CP::TestResultsSummarizer *)v7);
    TI::CP::TestResultsSummarizer::~TestResultsSummarizer((TI::CP::TestResultsSummarizer *)v7);
  }
  else
  {
    TI::CP::CPTrainer::evaluate_params(a1, a2, a3, a4);
  }
}

void TI::CP::TestResultsSummarizer::~TestResultsSummarizer(TI::CP::TestResultsSummarizer *this)
{
  uint64_t v2 = (void *)*((void *)this + 31);
  if (v2)
  {
    *((void *)this + 32) = v2;
    operator delete(v2);
  }
  unsigned int v3 = (void **)((char *)this + 224);
  std::vector<TI::CP::ContinuousPathTestResult>::__destroy_vector::operator()[abi:nn180100](&v3);
  unsigned int v3 = (void **)((char *)this + 200);
  std::vector<TI::CP::ContinuousPathTestResult>::__destroy_vector::operator()[abi:nn180100](&v3);
  std::__hash_table<std::__hash_value_type<std::string,std::vector<TI::CP::ContinuousPathTestResult>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<TI::CP::ContinuousPathTestResult>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<TI::CP::ContinuousPathTestResult>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<TI::CP::ContinuousPathTestResult>>>>::~__hash_table((uint64_t)this + 160);
  unsigned int v3 = (void **)((char *)this + 136);
  std::vector<TI::CP::ContinuousPathTestResult>::__destroy_vector::operator()[abi:nn180100](&v3);
  unsigned int v3 = (void **)((char *)this + 48);
  std::vector<TI::CP::ContinuousPathTestResult>::__destroy_vector::operator()[abi:nn180100](&v3);
  unsigned int v3 = (void **)((char *)this + 24);
  std::vector<TI::CP::ContinuousPathTestResult>::__destroy_vector::operator()[abi:nn180100](&v3);
  unsigned int v3 = (void **)this;
  std::vector<TI::CP::ContinuousPathTestResult>::__destroy_vector::operator()[abi:nn180100](&v3);
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,std::vector<TI::CP::ContinuousPathTestResult>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<TI::CP::ContinuousPathTestResult>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<TI::CP::ContinuousPathTestResult>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<TI::CP::ContinuousPathTestResult>>>>::~__hash_table(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      unsigned int v3 = (void *)*v2;
      std::__destroy_at[abi:nn180100]<std::pair<std::string const,std::vector<TI::CP::ContinuousPathTestResult>>,0>((uint64_t)(v2 + 2));
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
  unsigned int v4 = *(void **)a1;
  *(void *)a1 = 0;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

void TI::CP::CPTestCaseParamTrainer::~CPTestCaseParamTrainer(TI::CP::CPTestCaseParamTrainer *this)
{
  TI::CP::CPTestCaseParamTrainer::~CPTestCaseParamTrainer(this);
  JUMPOUT(0x2455C26F0);
}

{
  uint64_t v2;
  uint64_t vars8;

  *(void *)this = &unk_26F2B7540;
  uint64_t v2 = *((void *)this + 10);
  *((void *)this + 10) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  TI::CP::CPTrainer::~CPTrainer(this);
}

void TI::CP::CPTrainer::~CPTrainer(TI::CP::CPTrainer *this)
{
  *(void *)this = &unk_26F2B77E8;
  std::__function::__value_func<TI::CP::ContinuousPathTestCase ()(unsigned int,unsigned int,BOOL)>::~__value_func[abi:nn180100]((void *)this + 6);
  unsigned int v3 = (void **)((char *)this + 16);
  std::vector<TI::CP::ContinuousPathTestCase>::__destroy_vector::operator()[abi:nn180100](&v3);
  uint64_t v2 = *((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
}

{
  uint64_t vars8;

  TI::CP::CPTrainer::~CPTrainer(this);
  JUMPOUT(0x2455C26F0);
}

void *std::__function::__value_func<TI::CP::ContinuousPathTestCase ()(unsigned int,unsigned int,BOOL)>::~__value_func[abi:nn180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

void std::vector<TI::CP::ContinuousPathTestCase>::__destroy_vector::operator()[abi:nn180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (char *)**a1;
  if (v2)
  {
    unsigned int v4 = (char *)v1[1];
    uint64_t v5 = v2;
    if (v4 != v2)
    {
      do
        TI::CP::ContinuousPathTestCase::~ContinuousPathTestCase((TI::CP::ContinuousPathTestCase *)(v4 - 240));
      while (v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void TI::CP::CPTestCaseParamTrainer::CPTestCaseParamTrainer(TI::CP::CPTrainer *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  TI::CP::CPTrainer::CPTrainer(a1);
}

void sub_23EFF09F4(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;
  MEMORY[0x2455C26F0](v5, 0x10F3C40A4669BAFLL);
  uint64_t v7 = *((void *)v2 + 10);
  *((void *)v2 + 10) = 0;
  if (v7) {
    (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
  }
  TI::CP::CPTrainer::~CPTrainer(v2);

  _Unwind_Resume(a1);
}

void TI::CP::CPTestCaseParamTrainer::CPTestCaseParamTrainer(TI::CP::CPTrainer *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  TI::CP::CPTrainer::CPTrainer(a1);
}

void sub_23EFF0B54(_Unwind_Exception *a1)
{
  uint64_t v6 = v5;
  MEMORY[0x2455C26F0](v6, 0x10F3C40A4669BAFLL);
  uint64_t v8 = *((void *)v3 + 10);
  *((void *)v3 + 10) = 0;
  if (v8) {
    (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
  }
  TI::CP::CPTrainer::~CPTrainer(v3);

  _Unwind_Resume(a1);
}

double _validateAlpha(double a1)
{
  double v1 = 1.0;
  if (a1 <= 1.0) {
    double v1 = a1;
  }
  BOOL v2 = a1 < 0.0;
  double result = 0.0;
  if (!v2) {
    return v1;
  }
  return result;
}

void sub_23EFF4EE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23EFF52C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *this)
{
  size_t i = this->__i_;
  size_t v2 = (i + 1) % 0x270;
  std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type v3 = this->__x_[(i + 397) % 0x270] ^ ((this->__x_[v2] & 0x7FFFFFFE | this->__x_[i] & 0x80000000) >> 1) ^ ((int)(this->__x_[v2] << 31) >> 31) & 0x9908B0DF;
  this->__x_[i] = v3;
  this->__i_ = v2;
  LODWORD(i) = ((v3 ^ (v3 >> 11)) << 7) & 0x9D2C5680 ^ v3 ^ (v3 >> 11);
  return (i << 15) & 0xEFC60000 ^ i ^ (((i << 15) & 0xEFC60000 ^ i) >> 18);
}

void sub_23EFF5820(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_23EFF5E88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,id a41,char a42)
{
  _Block_object_dispose(&a36, 8);
  _Block_object_dispose(&a42, 8);

  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__1445(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 48);
  long long v3 = *(_OWORD *)(a2 + 64);
  *(__n128 *)(a1 + 48) = result;
  *(_OWORD *)(a1 + 64) = v3;
  return result;
}

uint64_t __Block_byref_object_copy__15(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__16(uint64_t a1)
{
}

void sub_23EFF60AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_23EFF628C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_23EFF6544(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id conversationToJsonArray(void *a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "toJsonDict", (void)v10);
        [v2 addObject:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v2;
}

id conversationFromJsonArray(void *a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = +[TTKConversationMessage fromJsonDict:](TTKConversationMessage, "fromJsonDict:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
        [v2 addObject:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v2;
}

id conversationTestsFromJsonArray(void *a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = +[TTKConversationTest fromJsonDict:](TTKConversationTest, "fromJsonDict:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
        [v2 addObject:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v2;
}

id conversationTestsToJsonArray(void *a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "toJsonDict", (void)v10);
        [v2 addObject:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v2;
}

void sub_23EFF75B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

uint64_t __Block_byref_object_copy__1616(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1617(uint64_t a1)
{
}

void _TIBeginMockingProactiveQuickTypeManager()
{
  uint64_t v0 = objc_alloc_init(TIProactiveQuickTypeManagerMock);
  if (objc_opt_respondsToSelector()) {
    [MEMORY[0x263F7EB28] performSelector:sel_setSharedTIProactiveQuickTypeManager_ withObject:v0];
  }
}

uint64_t _TIEndMockingProactiveQuickTypeManager()
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    id v1 = (void *)MEMORY[0x263F7EB28];
    return [v1 performSelector:sel_setSharedTIProactiveQuickTypeManager_ withObject:0];
  }
  return result;
}

uint64_t _TIGetMockLanguageLikelihoodModel()
{
  return [MEMORY[0x263F7EB88] sharedLanguageLikelihoodModel];
}

void _TIBeginMockingLanguageLikelihoodModel()
{
  uint64_t v0 = objc_alloc_init(TILanguageLikelihoodModelStub);
  _TIBeginMockingLanguageLikelihoodModelWithModel(v0);
}

void _TIBeginMockingLanguageLikelihoodModelWithModel(void *a1)
{
  id v1 = a1;
  if (objc_opt_respondsToSelector()) {
    [MEMORY[0x263F7EB88] performSelector:sel_setSharedLanguageLikelihoodModel_ withObject:v1];
  }
}

uint64_t _TIEndMockingLanguageLikelihoodModel()
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    id v1 = (void *)MEMORY[0x263F7EB88];
    return [v1 performSelector:sel_setSharedLanguageLikelihoodModel_ withObject:0];
  }
  return result;
}

uint64_t isInputModeAvailable()
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v0 = MEMORY[0x2455C1FB0]();
  id v1 = MEMORY[0x2455C1FC0]();

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = v1;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void *)(*((void *)&v9 + 1) + 8 * i);
        id v7 = availableInputModes();
        LOBYTE(v6) = objc_msgSend(v7, "containsObject:", v6, (void)v9);

        if (v6)
        {
          uint64_t v3 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

id read_wordlist(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v17 = 0;
  id v1 = [NSString stringWithContentsOfFile:a1 encoding:4 error:&v17];
  id v2 = v17;
  if (v1)
  {
    uint64_t v3 = [v1 componentsSeparatedByString:@"\n"];
    uint64_t v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          long long v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if ((objc_msgSend(v10, "isEqualToString:", &stru_26F2B7E50, (void)v13) & 1) == 0)
          {
            long long v11 = +[AutocorrectionTest testWithInput:v10];
            [v4 addObject:v11];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }
      while (v7);
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

id read_unigrams_dictionary(void *a1, void *a2)
{
  v22[1] = *MEMORY[0x263EF8340];
  id v2 = unigramsPathForInputMode(a1, a2);
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    id v21 = 0;
    uint64_t v18 = v2;
    uint64_t v4 = [NSString stringWithContentsOfFile:v2 encoding:4 error:&v21];
    id v16 = v21;
    id v17 = (void *)v4;
    id v5 = [MEMORY[0x263F08B08] scannerWithString:v4];
    if (([v5 isAtEnd] & 1) == 0)
    {
      do
      {
        id v20 = 0;
        [v5 scanUpToString:@" : " intoString:&v20];
        id v6 = v20;
        id v19 = 0;
        [v5 scanUpToString:@"\n" intoString:&v19];
        id v7 = v19;
        id v8 = v6;
        uint64_t v9 = [v7 rangeOfString:@"s="];
        long long v11 = v8;
        if (v9 != 0x7FFFFFFFFFFFFFFFLL)
        {
          long long v11 = objc_msgSend(v7, "substringWithRange:", v9 + 2, objc_msgSend(v7, "length") - (v9 + v10));
        }
        v22[0] = v11;
        long long v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:1];
        long long v13 = +[AutocorrectionTest testWithInput:v8 expectedOutput:v12];

        [v3 addObject:v13];
      }
      while (![v5 isAtEnd]);
    }

    long long v14 = v17;
    id v2 = v18;
  }
  else
  {
    uint64_t v3 = 0;
    long long v14 = 0;
  }

  return v3;
}

id read_textfile(uint64_t a1, uint64_t a2)
{
  id v2 = [NSString stringWithContentsOfFile:a1 encoding:4 error:a2];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __read_textfile_block_invoke;
    v6[3] = &unk_2650500D0;
    id v4 = v3;
    id v7 = v4;
    [v2 enumerateLinesUsingBlock:v6];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

id read_typologyInfo(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v1 = [NSDictionary dictionaryWithContentsOfFile:a1];
  uint64_t v2 = [MEMORY[0x263EFF980] array];
  uint64_t v3 = [MEMORY[0x263EFF980] array];
  id v4 = (void *)v3;
  id v30 = (id)v2;
  if (v2) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    id v6 = [MEMORY[0x263F089D8] stringWithCapacity:0];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v7 = v1;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v29 = v1;
      uint64_t v10 = 0;
      uint64_t v31 = *(void *)v33;
      do
      {
        uint64_t v11 = 0;
        long long v12 = v10;
        do
        {
          if (*(void *)v33 != v31) {
            objc_enumerationMutation(v7);
          }
          uint64_t v10 = [v7 objectForKey:*(void *)(*((void *)&v32 + 1) + 8 * v11)];

          long long v13 = [v10 objectForKey:@"TouchKey"];
          if ([v13 isEqual:@" "])
          {
            long long v14 = (void *)[v4 copy];
            long long v15 = (void *)[v6 copy];
            id v16 = +[AutocorrectionTest testWithTouches:v14 expectedOutput:v15];

            [v30 addObject:v16];
            [v6 setString:&stru_26F2B7E50];
            [v4 removeAllObjects];
          }
          else
          {
            [v6 appendString:v13];
            id v17 = [v10 valueForKeyPath:@"TouchPoint.X"];
            [v17 floatValue];
            double v19 = v18;
            [v10 valueForKeyPath:@"TouchPoint.Y"];
            id v20 = v7;
            uint64_t v21 = v9;
            uint64_t v22 = v6;
            v24 = uint64_t v23 = v4;
            [v24 floatValue];
            id v16 = +[TIPointError errorWithErrorVector:](TIPointError, "errorWithErrorVector:", v19, v25);

            id v4 = v23;
            id v6 = v22;
            uint64_t v9 = v21;
            id v7 = v20;

            [v4 addObject:v16];
          }

          ++v11;
          long long v12 = v10;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v9);

      id v1 = v29;
    }

    if ([v4 count])
    {
      uint64_t v36 = v6;
      uint64_t v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v36 count:1];
      uint64_t v27 = +[AutocorrectionTest testWithTouches:v4 expectedOutput:v26];

      [v30 addObject:v27];
    }
  }
  return v30;
}

id read_candidates(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v33 = 0;
  id v1 = [NSString stringWithContentsOfFile:a1 encoding:4 error:&v33];
  id v2 = v33;
  uint64_t v3 = v2;
  if (v1)
  {
    id v24 = v2;
    float v25 = v1;
    id v4 = [v1 componentsSeparatedByString:@"\n"];
    objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    id v28 = (id)objc_claimAutoreleasedReturnValue();
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (!v6) {
      goto LABEL_16;
    }
    uint64_t v7 = v6;
    uint64_t v8 = &stru_26F2B7E50;
    uint64_t v9 = *(void *)v30;
    uint64_t v10 = @"|";
    unint64_t v11 = 0x263F08000uLL;
    uint64_t v26 = *(void *)v30;
    while (1)
    {
      uint64_t v12 = 0;
      uint64_t v27 = v7;
      do
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(v5);
        }
        long long v13 = *(void **)(*((void *)&v29 + 1) + 8 * v12);
        if (([v13 isEqualToString:v8] & 1) == 0)
        {
          long long v14 = [*(id *)(v11 + 1800) characterSetWithCharactersInString:v10];
          long long v15 = [v13 componentsSeparatedByCharactersInSet:v14];

          if ([v15 count] == 2)
          {
            [v15 objectAtIndex:0];
            id v16 = v8;
            id v17 = v5;
            double v19 = v18 = v10;
            [v15 objectAtIndex:1];
            v21 = unint64_t v20 = v11;
            uint64_t v22 = +[AutocorrectionTest testWithInput:v19 expectedOutput:v21];

            unint64_t v11 = v20;
            uint64_t v10 = v18;
            id v5 = v17;
            uint64_t v8 = v16;
            uint64_t v9 = v26;
            uint64_t v7 = v27;
            goto LABEL_12;
          }
          if ([v15 count] == 1)
          {
            uint64_t v22 = +[AutocorrectionTest testWithInput:@"\n" expectedOutput:&unk_26F2C9E88];
LABEL_12:
            [v28 addObject:v22];
          }
        }
        ++v12;
      }
      while (v7 != v12);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (!v7)
      {
LABEL_16:

        uint64_t v3 = v24;
        id v1 = v25;
        goto LABEL_18;
      }
    }
  }
  id v28 = 0;
LABEL_18:

  return v28;
}

id availableInputModes()
{
  if (availableInputModes_onceToken != -1) {
    dispatch_once(&availableInputModes_onceToken, &__block_literal_global_1966);
  }
  uint64_t v0 = (void *)availableInputModes_modes;
  return v0;
}

void __availableInputModes_block_invoke()
{
  uint64_t v0 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", @"ja_JP-50On", @"ja_JP", @"zh_Hant-HWR", @"zh_Hans-HWR", @"zh_CN", @"zh_Hant-Cangjie", @"zh_Hans-Wubihua", @"zh_Hant-Wubihua", @"zh_TW", 0);
  id v1 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v2 = (void *)availableInputModes_modes;
  availableInputModes_modes = (uint64_t)v1;

  uint64_t v3 = [MEMORY[0x263F7E570] sharedInputModeController];
  id v4 = [v3 supportedInputModeIdentifiers];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __availableInputModes_block_invoke_2;
  v6[3] = &unk_2650500F8;
  id v7 = v0;
  id v5 = v0;
  [v4 enumerateObjectsUsingBlock:v6];
}

void __availableInputModes_block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0) {
    [(id)availableInputModes_modes addObject:v3];
  }
}

void __read_textfile_block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263F08708];
  id v4 = a2;
  id v5 = [v3 whitespaceAndNewlineCharacterSet];
  id v14 = [v4 stringByTrimmingCharactersInSet:v5];

  if ([v14 length])
  {
    uint64_t v6 = [v14 componentsSeparatedByString:@"\t"];
    id v7 = objc_alloc_init(MEMORY[0x263F08A30]);
    [v7 setNumberStyle:1];
    if ((unint64_t)[v6 count] < 2)
    {
      uint64_t v9 = 0;
    }
    else
    {
      uint64_t v8 = [v6 objectAtIndexedSubscript:0];
      uint64_t v9 = [v7 numberFromString:v8];

      if (v9)
      {
        uint64_t v10 = objc_msgSend(v6, "subarrayWithRange:", 1, objc_msgSend(v6, "count") - 1);
        uint64_t v11 = [v10 componentsJoinedByString:@"\t"];

        id v12 = (id)v11;
LABEL_7:
        id v14 = v12;
        long long v13 = +[AutocorrectionTest testWithInput:v12 andCorpusId:v9];
        [*(id *)(a1 + 32) addObject:v13];

        goto LABEL_8;
      }
    }
    id v12 = v14;
    goto LABEL_7;
  }
LABEL_8:
}

id unigramsPathForInputMode(void *a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v17 = a2;
  id v4 = MEMORY[0x2455C1FB0]();
  id v5 = MEMORY[0x2455C1FC0]();

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = [NSString stringWithFormat:@"Unigrams-%@.words", *(void *)(*((void *)&v19 + 1) + 8 * i)];
        id v12 = [v3 stringByAppendingPathComponent:v11];
        long long v13 = [MEMORY[0x263F08850] defaultManager];
        int v14 = [v13 fileExistsAtPath:v12];

        if (v14)
        {
          id v15 = v12;

          uint64_t v8 = v15;
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

id read_nefile(uint64_t a1)
{
  id v8 = 0;
  id v1 = [NSString stringWithContentsOfFile:a1 encoding:4 error:&v8];
  id v2 = v8;
  id v3 = [MEMORY[0x263EFF980] array];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __read_nefile_block_invoke;
  v6[3] = &unk_2650500D0;
  id v4 = v3;
  id v7 = v4;
  [v1 enumerateLinesUsingBlock:v6];

  return v4;
}

id read_portrait_nefile(void *a1)
{
  id v1 = a1;
  id v2 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v1];
  id v10 = 0;
  id v3 = [MEMORY[0x263F08900] JSONObjectWithData:v2 options:4 error:&v10];
  id v4 = v10;
  if (!v3)
  {
    id v7 = (FILE *)*MEMORY[0x263EF8348];
    id v8 = (const char *)[v1 cStringUsingEncoding:4];
    id v9 = [v4 localizedDescription];
    fprintf(v7, "Error: Unable to parse JSON config file '%s': %s\n\n", v8, (const char *)[v9 cStringUsingEncoding:4]);

    exit(1);
  }
  if (objc_opt_respondsToSelector())
  {
    id v5 = [MEMORY[0x263F4BE10] filteredNamedEntitiesFromJSONDonations:v3];
  }
  else
  {
    id v5 = (void *)MEMORY[0x263EFFA68];
  }

  return v5;
}

id read_mock_contactsfile(uint64_t a1)
{
  id v8 = 0;
  id v1 = [NSString stringWithContentsOfFile:a1 encoding:4 error:&v8];
  id v2 = v8;
  id v3 = [MEMORY[0x263EFF980] array];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __read_mock_contactsfile_block_invoke;
  v6[3] = &unk_2650500D0;
  id v4 = v3;
  id v7 = v4;
  [v1 enumerateLinesUsingBlock:v6];

  return v4;
}

id read_contactsfile(uint64_t a1)
{
  id v8 = 0;
  id v1 = [NSString stringWithContentsOfFile:a1 encoding:4 error:&v8];
  id v2 = v8;
  id v3 = (void *)[objc_alloc(MEMORY[0x263F7EA60]) initWithRelevanceScoreType:1];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __read_contactsfile_block_invoke;
  v6[3] = &unk_2650500D0;
  id v4 = v3;
  id v7 = v4;
  [v1 enumerateLinesUsingBlock:v6];

  return v4;
}

void __read_contactsfile_block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263F08708];
  id v4 = a2;
  id v5 = [v3 whitespaceAndNewlineCharacterSet];
  id v12 = [v4 stringByTrimmingCharactersInSet:v5];

  if ([v12 length])
  {
    uint64_t v6 = [v12 componentsSeparatedByString:@","];
    id v7 = objc_alloc_init(MEMORY[0x263F7EA58]);
    id v8 = [v6 objectAtIndex:0];
    [v7 setGivenName:v8];

    id v9 = [v6 objectAtIndex:1];
    [v7 setFamilyName:v9];

    id v10 = [v6 objectAtIndex:2];
    [v10 doubleValue];
    *(float *)&double v11 = v11;
    [v7 setRelevancyScore:v11];

    [v7 setHasRelevancyScore:1];
    [*(id *)(a1 + 32) addContact:v7];
  }
}

void __read_mock_contactsfile_block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263F08708];
  id v4 = a2;
  id v5 = [v3 whitespaceAndNewlineCharacterSet];
  id v12 = [v4 stringByTrimmingCharactersInSet:v5];

  if ([v12 length])
  {
    uint64_t v6 = [v12 componentsSeparatedByString:@","];
    id v7 = objc_alloc_init(TIMockContact);
    id v8 = [v6 objectAtIndex:0];
    [(TIMockContact *)v7 setFirstName:v8];

    id v9 = [v6 objectAtIndex:1];
    [(TIMockContact *)v7 setLastName:v9];

    id v10 = [v6 objectAtIndex:2];
    [v10 doubleValue];
    *(float *)&double v11 = v11;
    [(TIMockContact *)v7 setRelevancyScore:v11];

    [*(id *)(a1 + 32) addObject:v7];
  }
}

void __read_nefile_block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263F08708];
  id v4 = a2;
  id v5 = [v3 whitespaceAndNewlineCharacterSet];
  id v6 = [v4 stringByTrimmingCharactersInSet:v5];

  if ([v6 length]) {
    [*(id *)(a1 + 32) addObject:v6];
  }
}

uint64_t print_usage()
{
  uint64_t v0 = (FILE **)MEMORY[0x263EF8358];
  fwrite("Usage: autocorrection_tester [-l language] [-p params_file | -j json_params_file] [-t textfile | -T TTKTestCase_file | -s candidate_sentence_file | -z data_driven_test_file] [-c [threshold]]\n", 0xBFuLL, 1uLL, (FILE *)*MEMORY[0x263EF8358]);
  fwrite("-V\tShow version and exit\n\n", 0x1AuLL, 1uLL, *v0);
  fwrite("-j\t", 3uLL, 1uLL, *v0);
  fwrite("\tJSON parameter file. JSON format for config parameters - uses same paramters as -p options:\n\n", 0x5EuLL, 1uLL, *v0);
  fwrite("-p\t", 3uLL, 1uLL, *v0);
  fwrite("\tParameter file. This file can specify any of the following values:\n\n", 0x45uLL, 1uLL, *v0);
  fwrite("Config Options with Overrides:\n", 0x1FuLL, 1uLL, *v0);
  fwrite("-d\t", 3uLL, 1uLL, *v0);
  fwrite("\tDICT: Directory path to TextInput project containing the unigram data files.\n\n", 0x4FuLL, 1uLL, *v0);
  fwrite("-w\t", 3uLL, 1uLL, *v0);
  fwrite("\tWORDS: Path to wordlist file. One word to a line.\n\n", 0x34uLL, 1uLL, *v0);
  fwrite("-t\t", 3uLL, 1uLL, *v0);
  fwrite("\tTEXT: Path to text file. Format may be arbitrary text.\n\n", 0x39uLL, 1uLL, *v0);
  fwrite("-T, --testcase", 0xEuLL, 1uLL, *v0);
  fwrite("\tTESTCASE: Path to test case file or directory. Format is TTKTestCase, or a directory with layout files and subdirectory of test cases.\n\n", 0x89uLL, 1uLL, *v0);
  fwrite("-s\t", 3uLL, 1uLL, *v0);
  fwrite("\tCANDIDATE_SENTENCES: Candidate sentence file. Each line is input and expected output pair, separated by a '|' character.\n\n", 0x7BuLL, 1uLL, *v0);
  fwrite("-l\t", 3uLL, 1uLL, *v0);
  fwrite("\tKEYBOARD_LANGUAGE. If dictionary path is specified, and language is not, the default is all languages.\n\n", 0x69uLL, 1uLL, *v0);
  fwrite("-u\t", 3uLL, 1uLL, *v0);
  fwrite("\tTYPOLOGY: Path to touch file. Format is determined by Typology.\n\n", 0x42uLL, 1uLL, *v0);
  fwrite("-z\t", 3uLL, 1uLL, *v0);
  fwrite("\tPath to data-drvien test file.\n\n", 0x21uLL, 1uLL, *v0);
  fwrite("-c [threshold]\t", 0xFuLL, 1uLL, *v0);
  fwrite("\tUSE_PARTFILE: Serialize intermediate results to disk to reduce memory usage. \n\t\tPass an optional number to override the default serialization threshold PARTFILE_FLUSH_THRESHOLD (500).\n\n", 0xBAuLL, 1uLL, *v0);
  fwrite("-a\t", 3uLL, 1uLL, *v0);
  fwrite("\tADDRESSBOOK: Path to contacts file. Format is comma-separated values with three fields per line - first name, surname, probability.\n\n", 0x86uLL, 1uLL, *v0);
  fwrite("-n\t", 3uLL, 1uLL, *v0);
  fwrite("\tNAMEDENTITIES: Path to name entities file. Format is one named entity per line.\n\n", 0x52uLL, 1uLL, *v0);
  fwrite("\tPORTRAIT_NAMEDENTITIES: Path to name entities json file with portrait metadata (sources, algorithms, creation timestamps).\n\n", 0x7DuLL, 1uLL, *v0);
  fwrite("-P personaName\n", 0xFuLL, 1uLL, *v0);
  fwrite("\tPERSONA: Persona to use to morph keyboard input.\n\n", 0x33uLL, 1uLL, *v0);
  fwrite("-W width\t", 9uLL, 1uLL, *v0);
  fwrite("\t\tUSE_DYNAMIC_LAYOUT --\n\t\tIf nonzero, use dynamic layout.  Default is 0.\n\n", 0x4AuLL, 1uLL, *v0);
  fwrite("\tKEYBOARD_WIDTH --\n\t\tKeyboard width (iPhone5 portrait = 320).  Default is 320.\n\n", 0x50uLL, 1uLL, *v0);
  fwrite("-O orientation\t", 0xFuLL, 1uLL, *v0);
  fwrite("\tKEYBOARD_ORIENTATION --\n\t\tKeyboard orientation: 'Portrait' or 'Landscape'.  Default is 'Portrait'.\n\n", 0x65uLL, 1uLL, *v0);
  fwrite("-o\t", 3uLL, 1uLL, *v0);
  fwrite("\tOUTPATH: Output directory\n\n", 0x1CuLL, 1uLL, *v0);
  fwrite("-i\t", 3uLL, 1uLL, *v0);
  fwrite("\tSTART_INDEX: Index of first test case to run. Default is 1 (all test cases).\n\n", 0x4FuLL, 1uLL, *v0);
  fwrite("-N\t", 3uLL, 1uLL, *v0);
  fwrite("\tEND_INDEX: Index of last test case to run. Default is NIL (all test cases).\n\n", 0x4EuLL, 1uLL, *v0);
  fwrite("-f\t", 3uLL, 1uLL, *v0);
  fwrite("\tPRINT_TYPING_TRANSCRIPT: Print each steps action/keytap and resulting text state to stdout.\n\n", 0x5EuLL, 1uLL, *v0);
  fwrite("-C\t", 3uLL, 1uLL, *v0);
  fwrite("\tSHOW_CANDIDATE_BAR: Print the candidate bar before each step to stdout.\n\n", 0x4AuLL, 1uLL, *v0);
  fwrite("-x\t", 3uLL, 1uLL, *v0);
  fwrite("\tTRANSLITERATION_SUMMARIES: For transliteration modes, at the end of each test case, print the Latin stdout, the intended native script text, and the actual native script text to stdout.\n\n", 0xBCuLL, 1uLL, *v0);
  fwrite("-b\t", 3uLL, 1uLL, *v0);
  fwrite("\tPLAYBACK: Path to playback JSON file in keyboardanalytics testcase format.\n\n", 0x4DuLL, 1uLL, *v0);
  fwrite("Conversation Config Options (provide via -j):\n", 0x2EuLL, 1uLL, *v0);
  fwrite("\tCONVERSATIONS_TEST_FILE: Path to conversations file (json format).\n\n", 0x45uLL, 1uLL, *v0);
  fwrite("\tCONVERSATION_SENDERS_TO_TEST: List of senders to test typing for. Only messages from these senders will generate results in the output. Messages from other senders will only influence adaptation.\n\n", 0xC6uLL, 1uLL, *v0);
  fwrite("\tCONVERSATION_ADAPT_TO_SENT_MESSAGES: Adapt to sent messages in conversations. Requires USES_ADAPTATION set to true.\n\n", 0x76uLL, 1uLL, *v0);
  fwrite("\tCONVERSATION_ADAPT_TO_RECEIVED_MESSAGES: Adapt to received messages in conversations. Requires USES_ADAPTATION set to true.\n\n", 0x7EuLL, 1uLL, *v0);
  fwrite("Rest of Config Options:\n", 0x18uLL, 1uLL, *v0);
  fwrite("\t\tNUM_TRIALS --\n\t\tThe number of independent trials to run.  Default is 1.\n\n", 0x4BuLL, 1uLL, *v0);
  fwrite("\t\tSPACE_HORIZONTAL_ERROR_BIAS --\n\t\tIf 0, use the horizontal space key center for touch error calculation. If 1, distribute the horizontal origin along the width of the space bar (with margins equal to 1/2 key height; If 2, bias the horizontal origin to the right "
    "side of the space bar. If 3, bias the horizontal origin to the left side of the space bar. \x13Default is 1.\n"
    "\n",
    0x172uLL,
    1uLL,
    *v0);
  fwrite("\t\tSPACE_VERTICAL_ERROR_BIAS --\n\t\tA bias to be applied to the space bar touch error calculation to simulate suspected user behavior. Expressed as a fraction of the key height (e.g., .5 would bias to the top of the space bar).\n\n", 0xE2uLL, 1uLL, *v0);
  fwrite("\t\tPROB_SPACE_INSTEAD_OF_BOTTOM_ROW --\n\t\tProbability of half-key height added to a bottom key tap in the spacebar direction. Limited by MAX_SPACE_ERRORS_PER_TEST\n\n", 0xA2uLL, 1uLL, *v0);
  fwrite("\t\tPROB_SPACE_REPLACED_BY_BOTTOM_ROW --\n\t\tProbability of half-key height subtracted from a space bar tap in the direction of the bottom key row. Limited by MAX_SPACE_ERRORS_PER_TEST. Use SPACE_HORIZONTAL_ERROR_BIAS=1 to get realistic substitutions.\n\n", 0xF9uLL, 1uLL, *v0);
  fwrite("\t\tMAX_SPACE_ERRORS_PER_TEST --\n\t\t Max count of cumulative errors using PROB_SPACE_INSTEAD_OF_BOTTOM_ROW and PROB_SPACE_REPLACED_BY_BOTTOM_ROW settings. \n\n", 0x9AuLL, 1uLL, *v0);
  fwrite("\t\tWORD_LEARNING_ENABLED --\n\t\tIf nonzero, the keyboard performs online adaptation to typing.  Default is 0.\n\n", 0x6CuLL, 1uLL, *v0);
  fwrite("\t\tNEGATIVE_LEARNING_ENABLED --\n\t\tIf nonzero, the keyboard performs negative learning in response to rejected autocorrections.  Default is 0.\n\n", 0x8EuLL, 1uLL, *v0);
  fwrite("\t\tUSES_ADAPTATION --\n\t\tReplaces deprecated 'USE_WORD_NGRAM_MODEL_ADAPTATION'. If nonzero, adaptation resources are loaded and used in beam search and to compute probabilities. If 'WORD_LEARNING_ENABLED' switch is on, it implies that 'USES_ADAPTATION' switch is on too. Otherwise, default is 0.\n\n", 0x127uLL, 1uLL, *v0);
  fwrite("\t\tUSE_LANGUAGE_MODEL --\n\t\tUse this flag to override UIKeyboardHasWordNgramModel value from InputMode_xx.plist.\n\n", 0x70uLL, 1uLL, *v0);
  fwrite("\t\tUSE_WORD_NGRAM_MODEL --\n\t\tDeprecated, see USE_LANGUAGE_MODEL instead.\n\n", 0x49uLL, 1uLL, *v0);
  fwrite("\t\tTOUCAN_LM_MODE --\n\t\tControls to which extent new generation neural lm with open vocabulary is enabled (requires presence of respective LM assets on the system or passed via custom path). If 0, 'Toucan' lm is disabled. If 1, 'Toucan' lm is enabled for completions/predictions. If 2, 'Toucan' lm is enabled for autocorrections.\n\n", 0x149uLL, 1uLL, *v0);
  fwrite("\t\tMAX_WORDS_PER_PREDICTION --\n\t\tMaximum words predidicted when autocorrection lists enabled.  Default is 1.\n\n", 0x6DuLL, 1uLL, *v0);
  fwrite("\t\tMAX_PREDICTIONS_REPORTED --\n\t\tMaximum prediction to report for every key stroke.  Default is 0, in  which case nothing is reported\n\n", 0x86uLL, 1uLL, *v0);
  fwrite("\t\tMAX_INLINE_COMPLETIONS_REPORTED --\n\t\tMaximum inline completions to report for every key stroke.  Default is 0, in  which case nothing is reported\n\n", 0x95uLL, 1uLL, *v0);
  fwrite("\t\tLOG_DOCUMENT_CONTEXT --\n\t\tInclude document context before each input in the output report.  Default is NO.\n\n", 0x6EuLL, 1uLL, *v0);
  fwrite("\t\tKEYSTROKE_SEGMENTATION_MODE --\n\t\tSpecify mode for segmenting keystrokes according to intended tokens: 'none', 'typinglog', 'alignment'. Default is 'typinglog'.\n\n", 0xA3uLL, 1uLL, *v0);
  fwrite("\t\tWARN_IF_SELECTING_POPUP_VARIANT --\n\t\tIf nonzero, warn when typer selects a popup variant (may indicate keyboard layout mis-configuration).  Default is 0.\n\n", 0x9DuLL, 1uLL, *v0);
  fwrite("\t\tSIRI_MODE --\n\t\tIf nonzero, run in SIRI MODE (aka as if invoked from type-to-siri).  Default is 0.\n\n", 0x65uLL, 1uLL, *v0);
  fwrite("\t\tUSE_AUTOCORRECTION --\n\t\tIf nonzero, enable autocorrection.  Default is 1.\n\n", 0x4DuLL, 1uLL, *v0);
  fwrite("\t\tUSE_RETROCORRECTION --\n\t\tIf nonzero, enable retrocorrection.  Default is 0.\n\n", 0x4FuLL, 1uLL, *v0);
  fwrite("\t\tUSE_AUTOCAPITALIZATION --\n\t\tIf nonzero, use autocapitalization.  Default is 1.\n\n", 0x52uLL, 1uLL, *v0);
  fwrite("\t\tUSE_PREDICTION --\n\t\tIf nonzero, enabled predictions and completions.  Default is 0.\n\n", 0x57uLL, 1uLL, *v0);
  fwrite("\t\tAUTOCORRECTION_LISTS --\n\t\tDEPRECATED in favor of USE_PREDICTION.\n\n", 0x44uLL, 1uLL, *v0);
  fwrite("\t\tMAX_PREDICTIONS --\n\t\tMaximum number of predictions displayed in UI.  Default is 3.\n\n", 0x56uLL, 1uLL, *v0);
  fwrite("\t\tMULTILINGUAL_ENABLED --\n\t\tIf nonzero, enable multilingual keyboards.  Default is 0.\n\n", 0x57uLL, 1uLL, *v0);
  fwrite("\t\tKEYBOARD_SECOND_LANGUAGE --\n\t\t.If multilingual enabled, manually configure second langauge, i.e. 'fr_FR', 'de_DE'. Default is None.\n\n", 0x87uLL, 1uLL, *v0);
  fwrite("\t\tBASE_KEY_FOR_VARIANTS --\n\t\tIf nonzero, type base letter if diacritic variant is not available.  Default is 1.\n\n", 0x71uLL, 1uLL, *v0);
  fwrite("\t\tPREFERS_TRANSLITERATION--\n\t\tIf nonzero, typing model user types transliteration and chooses native words from prediction bar. The input is expected in playback or tansliterated formats. Default is 0.\n\n", 0xCBuLL, 1uLL, *v0);
  fwrite("\t\tUSE_PARTIAL_CANDIDATES --\n\t\tIf nonzero, the transliteration model will attempt to select partial candidates if the intended string is not visible. Only valid when transliteration is enabled. Default is 0.\n\n", 0xD0uLL, 1uLL, *v0);
  fwrite("\t\tTEST_SENTENCE_TRANSLITERATION--\n\t\tIf nonzero, the expected input and its transliteration will be combined into a single word with no spaces, so the sentence is just the catentation of its words. Default is 0.\n\n", 0xD4uLL, 1uLL, *v0);
  fwrite("\t\tTRANSLITERATE_WITH_SPACES--\n\t\tSet to 1 when transliterating a language that uses spaces to separate words/syllables (languages other than Chinese/Japanese/Thai).\n\n", 0xA5uLL, 1uLL, *v0);
  fwrite("\t\tPREFERS_CONTINUOUS_PATH--\n\t\tIf nonzero, typing model user prefers to enter text using continuous path.  Default is 0.\n\n", 0x79uLL, 1uLL, *v0);
  fwrite("\t\tCONTINUOUS_PATH_ENABLED--\n\t\tIf YES, enable continuous path playback. Default is YES.", 0x56uLL, 1uLL, *v0);
  fwrite("\t\tCONTINUOUS_PATH_GENERATOR--\n\t\tString representing the preferred path generator. Valid values are \"TYPIST\" or \"SIMPLE\". Used only if PREFERS_CONTINUOUS_PATH is non-zero. If not set, then the default SIMPLE generator is used.\n\n", 0xE3uLL, 1uLL, *v0);
  fwrite("\t\tCONTINUOUS_PATH_APPEND_SPACE--\n\t\tIf nonzero, a space is automatically appended to each continuous path conversion. Otherwise, space is prepended prior to conversion, if necessary. Default is 0.\n\n", 0xC5uLL, 1uLL, *v0);
  fwrite("\t\tCONTINUOUS_PATH_ALGORITHMS--\n\t\tA number describing the bitmask of enabled algorithms for continuous path. Fav=1, ML=2, ShapeMatch=4, StoreShapes=8, ChineseML=16. Default is Favonius only.\n\n", 0xBFuLL, 1uLL, *v0);
  fwrite("\t\tENABLE_CONTINUOUS_PATH_RETROCORRECTION--\n\t\tEnable retrocorrection for continuous path input. Default=YES.\n\n", 0x6DuLL, 1uLL, *v0);
  fwrite("\t\tALPHA--\n\t\tfloat value [0.0, 1.0]. The knot parameterization used in TTKTypistContinuousPathGenerator. Used only if CONTINUOUS_PATH_GENERATOR is \"TYPIST\". If not set, then the default centripetal value (0.5) is used.\n\n", 0xDBuLL, 1uLL, *v0);
  fwrite("\t\tPREFERS_PREDICTION_SELECTION --\n\t\tIf nonzero, typing model user prefers to select candidates from prediction bar UI.  Default is 0.\n\n", 0x87uLL, 1uLL, *v0);
  fwrite("\t\tPREFERS_AUTOCORRECTION_LISTS --\n\t\tDEPRECATED in favor of PREFERS_PREDICTION_SELECTION.\n\n", 0x5AuLL, 1uLL, *v0);
  fwrite("\t\tPREFERS_SPACEBAR_DOUBLETAP --\n\t\tIf nonzero, typing model prefers spacebar double-tap to end sentence (TODO: Not yet implemented!).  Default is 0.\n\n", 0x95uLL, 1uLL, *v0);
  fwrite("\t\tPREFERS_TO_CORRECT_ERRORS --\n\t\tIf nonzero, typer prefers to correct errors by backspacing or rejecting autocorrections.  Default is YES.\n\n", 0x8CuLL, 1uLL, *v0);
  fwrite("\t\tPREFERS_AUTOCORRECT_WITH_REVISION --\n\t\tIf YES, will prefer to use autocorrection but will revise manually if autocorrection is bad. Equivalent to PREFERS_TO_CORRECT_ERRORS=YES, PROB_BEGIN_CORRECTING_AFTER_WORD_TERMINATOR=1.0, PROB_REJECT_BAD_AUTOCORRECTION=1 and overrides other values.\n\n", 0x122uLL, 1uLL, *v0);
  fwrite("\t\tPREFERS_AUTOCORRECT_FOR_CAPS --\n\t\tIf nonzero, typer prefers to rely on autocorrect for capitalizing words.  Default is 0.\n\n", 0x7DuLL, 1uLL, *v0);
  fwrite("\t\tPREFERS_AUTOCORRECT_FOR_APOSTROPHES --\n\t\tIf nonzero, typer prefers to rely on autocorrect for inserting word-medial apostrophes.  Default is 0.\n\n", 0x93uLL, 1uLL, *v0);
  fwrite("\t\tAVERAGE_KEY_TAPS_PER_SECOND --\n\t\tThe average number of key taps per second.  Default is 5/sec (~60wpm).\n\n", 0x6BuLL, 1uLL, *v0);
  fwrite("\t\tMAX_PRIOR_SEGMENTS_CHECKED_FOR_ERRORS --\n\t\tIf PREFERS_TO_CORRECT_ERRORS=YES, the maximum input segments prior to current segment checked by typist for errors.  Default is 2.\n\n", 0xB1uLL, 1uLL, *v0);
  fwrite("\t\tPROB_BEGIN_CORRECTING_AFTER_WORD --\n\t\tIf PREFERS_TO_CORRECT_ERRORS=YES, the probability of starting to correct a typo before typing a word terminator.  Default is 0.0.\n\n", 0xABuLL, 1uLL, *v0);
  fwrite("\t\tPROB_BEGIN_CORRECTING_AFTER_WORD_TERMINATOR --\n\t\tIf PREFERS_TO_CORRECT_ERRORS=YES, the probability of starting to correct typos after a word terminator.  Default is 0.0.\n\n", 0xADuLL, 1uLL, *v0);
  fwrite("\t\tPROB_REJECT_BAD_AUTOCORRECTION --\n\t\tIf PREFERS_TO_CORRECT_ERRORS=YES, the probability of rejecting a bad autocorrection if the typed string is the intended text.  Default is 0.0\n\n", 0xB5uLL, 1uLL, *v0);
  fwrite("\t\tPROB_TRANSPOSE_LETTERS --\n\t\tProbability that keystrokes for two letters are transposed.  Default is 0.\n\n", 0x6AuLL, 1uLL, *v0);
  fwrite("\t\tPROB_TRANSPOSE_LETTER_AND_SPACE --\n\t\tProbability that keystrokes for letter and space are transposed.  Default is 0.\n\n", 0x78uLL, 1uLL, *v0);
  fwrite("\t\tPROB_SKIP_LETTER --\n\t\tProbability that non-word-initial letter is skipped.  Default is 0.\n\n", 0x5DuLL, 1uLL, *v0);
  fwrite("\t\tPROB_SKIP_REPEAT_LETTER --\n\t\tProbability that repeated letter is skipped.  Default is 0.\n\n", 0x5CuLL, 1uLL, *v0);
  fwrite("\t\tPROB_SKIP_INITIAL_LETTER --\n\t\tProbability that word-initial letter is skipped.  Default is 0.\n\n", 0x61uLL, 1uLL, *v0);
  fwrite("\t\tPROB_SKIP_SPACE --\n\t\tProbability that space key is skipped.  Default is 0.\n\n", 0x4EuLL, 1uLL, *v0);
  fwrite("\t\tPROB_DOUBLE_TAP_LETTER --\n\t\tProbability that non-word-initial letter is doubled.  Default is 0.\n\n", 0x63uLL, 1uLL, *v0);
  fwrite("\t\tPROB_DOUBLE_TAP_INITIAL_LETTER --\n\t\tProbability that word-initial letter is doubled.  Default is 0.\n\n", 0x67uLL, 1uLL, *v0);
  fwrite("\t\tPROB_SUBSTITUTE_LETTER --\n\t\tProbability that some arbitrary key substitutes for non-word-initial letter.  Default is 0.\n\n", 0x7BuLL, 1uLL, *v0);
  fwrite("\t\tPROB_SUBSTITUTE_INITIAL_LETTER --\n\t\tProbability that some arbitrary key substitutes for word-initial letter.  Default is 0.\n\n", 0x7FuLL, 1uLL, *v0);
  fwrite("\t\tPROB_SUBSTITUTE_SPACE --\n\t\tProbability that some arbitrary key substitutes for space.  Default is 0.\n\n", 0x68uLL, 1uLL, *v0);
  fwrite("\t\tPROB_EXTRANEOUS_KEY --\n\t\tProbability that extraneous keystoke is inserted before non-word-initial letter.  Default is 0.\n\n", 0x7CuLL, 1uLL, *v0);
  fwrite("\t\tPROB_EXTRANEOUS_INITIAL_KEY --\n\t\tProbability that extraneous keystroke is inserted before a word-initial letter.  Default is 0.\n\n", 0x83uLL, 1uLL, *v0);
  fwrite("\t\tPROB_EXTRANEOUS_FINAL_KEY --\n\t\tProbability that extraneous keystroke is inserted after a word-final letter.  Default is 0.\n\n", 0x7EuLL, 1uLL, *v0);
  fwrite("\t\tDECOMPOSE_INPUT_STRING --\n\t\tIf nonzero, input text is decomposed prior to typing keys.  Default is 0.\n\n", 0x69uLL, 1uLL, *v0);
  fwrite("\t\tERROR_GENERATOR --\n\t\tThe subclass of TIErrorGenerator that produces errors for the touch inputs.  Each class has its own parameters, as follows.\n\n", 0x94uLL, 1uLL, *v0);
  fwrite("\t\t\tCommon parameters --\n", 0x18uLL, 1uLL, *v0);
  fwrite("\t\t\t\tRNG_SEED_SALT --\n\t\t\t\tA salt for seeding the random number generator seed. Default is 0.\n\n", 0x5DuLL, 1uLL, *v0);
  fwrite("\t\t\t\tREL_ERROR_NUMBERS_PUNCTATION --\n\t\t\t\tRelative error for typing numbers and punctuation (Default=1)\n\n", 0x67uLL, 1uLL, *v0);
  fwrite("\t\t\t\tREL_ERROR_CONTROL_KEYS --\n\t\t\t\tRelative error for typing control keys (Default=1)\n\n", 0x56uLL, 1uLL, *v0);
  fwrite("\t\t\tTIRadialErrorGenerator --\n\t\t\tEach touch is offset at a random angle and distance, selected from one of two ranges.\n\n", 0x77uLL, 1uLL, *v0);
  fwrite("\t\t\t\tDEFAULT_ERROR_RADIAL_MIN_DISTANCE --\n\t\t\t\tThe minimum radial distance around a key centroid to select an error point. Default is 0.\n\n", 0x88uLL, 1uLL, *v0);
  fwrite("\t\t\t\tDEFAULT_ERROR_RADIAL_MAX_DISTANCE --\n\t\t\t\tThe maximum radial distance around a key centroid to select an error point. Within-keyframe max value is 15.\n\n", 0x9BuLL, 1uLL, *v0);
  fwrite("\t\t\t\tLETTER_ERROR_COUNT --\n\t\t\t\tThe number of randomly selected characters to add geometry errors.\n\n", 0x62uLL, 1uLL, *v0);
  fwrite("\t\t\t\tLETTER_ERROR_RADIAL_MIN_DISTANCE --\n\t\t\t\tThe minimum radial distance around a key centroid to select an error point. Default is 0.\n\n", 0x87uLL, 1uLL, *v0);
  fwrite("\t\t\t\tLETTER_ERROR_RADIAL_MAX_DISTANCE --\n\t\t\t\tThe maximum radial distance around a key centroid to select an error point. Recommended value between 15-25.\n\n", 0x9AuLL, 1uLL, *v0);
  fwrite("\t\t\tTIGaussianErrorGenerator --\n\t\t\t(Default) Each touch is offset using independently generated Gaussian noise.\n\n", 0x70uLL, 1uLL, *v0);
  fwrite("\t\t\t\tGAUSSIAN_ERROR_STDDEV_X --\n\t\t\t\tThe standard deviation (in mm) of the Gaussian noise in the X dimension\n\n", 0x6CuLL, 1uLL, *v0);
  fwrite("\t\t\t\tGAUSSIAN_ERROR_STDDEV_Y --\n\t\t\t\tThe standard deviation (in mm) of the Gaussian noise in the Y dimension\n\n", 0x6CuLL, 1uLL, *v0);
  fwrite("\t\t\t\tSKEW_STDDEV_X --\n\t\t\t\tThe standard deviation (in mm) of the Gaussian noise for the skew in the X dimension\n\n", 0x6FuLL, 1uLL, *v0);
  fwrite("\t\t\t\tSKEW_STDDEV_Y --\n\t\t\t\tThe standard deviation (in mm) of the Gaussian noise for the skew in the Y dimension\n\n", 0x6FuLL, 1uLL, *v0);
  fwrite("\t\t\t\tSCALE_ERROR_UNITS_TO_POINTS --\n\t\t\t\tOptional multiplier to use to convert from the standard deviation values to points\n\n", 0x7BuLL, 1uLL, *v0);
  fwrite("\t\tSTEP_COUNT --\n\t\tThe number of steps each variable's sweep range is broken into.\n\n", 0x53uLL, 1uLL, *v0);
  fwrite("\t\tUSER_DIRECTORY --\n\t\tDirectory to store dynamic data like user dictionary and LMs.  KB user dirtectory is the default\n\n", 0x78uLL, 1uLL, *v0);
  fwrite("\t\tCLEAN_USER_DIRECTORY --\n\t\tIf nonzero, USER_DIRECTORY will be recreated upon startup\n\n", 0x57uLL, 1uLL, *v0);
  fwrite("\t\tSAVE_DEBUG_DATA --\n\t\tIf nonzero debug information will be saved with each run\n\n", 0x51uLL, 1uLL, *v0);
  fwrite("\t\tREPORT_AGGD_STATISTICS --\n\t\tCollect Aggd Statistics for each line of input text\n\n", 0x53uLL, 1uLL, *v0);
  fwrite("\t\tTYPOLOGY_OUTPATH --\n\t\tOutput Typology log for each line of input text to this directory\n\n", 0x5BuLL, 1uLL, *v0);
  fwrite("\t\tPATH SIMULATION --\n\t\tContinious Path simulation parameters:\n\n", 0x3FuLL, 1uLL, *v0);
  fwrite("\t\t\t\tCONTINUOUS_PATH_GENERATOR - 'TYPIST' for generating splines and 'SIMPLE' for generating line segment paths. default 'SIMPLE'\n\n", 0x82uLL, 1uLL, *v0);
  fwrite("\t\t\t\tFINGER_KEY_WIDTH_MULTIPLE - defines thinkness of a finger in multiple of key widths. This option affects overshoot - user is assumed to move his finger until he sees a frame of the key he intends to reach. Default is 0, settig it 1 will make for half key width overshoot\n\n", 0x114uLL, 1uLL, *v0);
  fwrite("\t\t\t\tGENERATE_MIDDLE_POINT - If true will make path generator to wonder to deviate from the line segments that connect target points\n\n", 0x85uLL, 1uLL, *v0);
  fwrite("\t\t\t\tMID_POINT_DEV_KEY_HEIGHT_MULTIPLE - how far a middle point is allowed deviate from line segment in key height multiples. default 2.\n\n", 0x89uLL, 1uLL, *v0);
  fwrite("\t\t\t\tPATH_BETA_PARAMETER - controls simmetrical beta distribution for choosing middle points. default 4. Reducing it to 1 results in uniform distribution, increasing it makes distribution center heavy.\n\n", 0xCAuLL, 1uLL, *v0);
  fwrite("\t\t\t\tPATH_NORMAL_KEY_WIDTH_MULTIPLE - controls how far a user misses intended target. By default it's set to 0. Recommended setting 0.4\n\n", 0x88uLL, 1uLL, *v0);
  fwrite("\t\t\t\tCPPATHGEN_TIMING_ALGORITHM - controls how points are placed on the path. EQUIDISTANT will spread point equally. ANGULAR attempts to mimic user by slowing on sharp turns and gaining speed on longer segments\n\n", 0xD3uLL, 1uLL, *v0);
  fwrite("\t\t\t\tCPPATHGEN_ACCELERATION - used for ANGULAR, defaults to 1.6\n\n", 0x40uLL, 1uLL, *v0);
  fwrite("\t\tCUSTOM_STATIC_DICTIONARY_PATH --\n\t\tProvide a path to a custom Unigrams file.\n\n", 0x50uLL, 1uLL, *v0);
  fwrite("\t\tCUSTOM_LANGUAGE_MODEL_PATH --\n\t\tProvide a path to a custom language model bundle. It will be combined with other lm bundles on the system. To override system resources bump 'priority' field in the bundle's info.plist.\n\n", 0xDDuLL, 1uLL, *v0);
  fwrite("\t\tCUSTOM_DYNAMIC_RESOURCE_PATH --\n\t\tProvide a path to a custom language model bundle.\n\n", 0x57uLL, 1uLL, *v0);
  fwrite("\t\t\t\tUSER_PATH_FILE - if given will process and use user paths found in the file\n\n", 0x51uLL, 1uLL, *v0);
  fwrite("\t\tFAVONIUS_LANGUAGE_MODEL_WEIGHT-\n\t\tfloat value [0.0, 1.0]. Weight of language model, used for rescoring candidates. If not set, then the default k_linguistic_context_power value (0.24) is used.\n\n", 0xC4uLL, 1uLL, *v0);
  id v1 = *v0;
  return fputc(10, v1);
}

id parseArgs(int a1, char *const *a2)
{
  if (a1 <= 1)
  {
    print_usage();
    id v2 = 0;
    goto LABEL_45;
  }
  v32[0] = 0;
  id v5 = [MEMORY[0x263EFF9A0] dictionary];
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __parseArgs_block_invoke;
  v30[3] = &unk_2650500A0;
  id v6 = v5;
  id v31 = v6;
  id v7 = (uint64_t (**)(void, void, void))MEMORY[0x2455C2CF0](v30);
  uint64_t v27 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"ADDRESSBOOK", @"a", @"NAMEDENTITIES", @"n", @"PORTRAIT_NAMEDENTITIES", @"n", @"DICTS", @"d", @"WORDS", @"w", @"TEXT", @"t", @"TESTCASE", @"T", @"TYPOLOGY", @"u", @"CANDIDATE_SENTENCES",
                  @"s",
                  @"PLAYBACK",
                  @"b",
                  @"PARAMS",
                  @"p",
                  @"JSON_CONFIG",
                  @"j",
                  @"BAD_SENTENCES_FILE_PATH",
                  @"B",
                  0);
  while (2)
  {
    v32[0] = getopt_long(a1, a2, "Vz:d:w:t:T:r:s:l:o:p:u:c:a:n:j:P:S:W:O:i:N:b:B:fCx", (const option *)&parseArgs_long_options, 0);
    if (v32[0] == -1)
    {
      id v2 = v6;
      goto LABEL_44;
    }
    memset(&v29, 0, sizeof(v29));
    id v8 = [NSString stringWithCharacters:v32 length:1];
    switch(v32[0])
    {
      case ':':
        if (*MEMORY[0x263EF89F0] != 122) {
          goto LABEL_9;
        }
        goto LABEL_31;
      case 'B':
        id v12 = [NSString stringWithCString:*MEMORY[0x263EF89E0] encoding:4];
        long long v13 = v6;
        int v14 = v12;
        id v15 = @"BAD_SENTENCES_FILE_PATH";
        goto LABEL_36;
      case 'C':
        id v16 = v6;
        uint64_t v17 = MEMORY[0x263EFFA88];
        float v18 = @"SHOW_CANDIDATE_BAR";
        goto LABEL_32;
      case 'N':
        __endptr = 0;
        int v19 = strtol((const char *)*MEMORY[0x263EF89E0], &__endptr, 10);
        if (!*__endptr)
        {
          id v12 = [NSNumber numberWithUnsignedInteger:v19];
          long long v13 = v6;
          int v14 = v12;
          id v15 = @"END_INDEX";
LABEL_36:
          [v13 setValue:v14 forKey:v15];
LABEL_37:

LABEL_38:
          continue;
        }
        fprintf((FILE *)*MEMORY[0x263EF8348], "Error: invalid end index: %s\n");
LABEL_43:

        id v2 = 0;
LABEL_44:

LABEL_45:
        return v2;
      case 'O':
        id v12 = [NSString stringWithCString:*MEMORY[0x263EF89E0] encoding:4];
        long long v13 = v6;
        int v14 = v12;
        id v15 = @"KEYBOARD_ORIENTATION";
        goto LABEL_36;
      case 'P':
        if (*MEMORY[0x263EF89E0])
        {
          id v12 = [NSString stringWithCString:*MEMORY[0x263EF89E0] encoding:4];
        }
        else
        {
          id v12 = 0;
        }
        float v25 = __URLWithPersonaForPersonaName(v12);

        if (!v25)
        {
          fprintf((FILE *)*MEMORY[0x263EF8348], "Error: persona does not exist: %s\n");
          goto LABEL_51;
        }
        long long v13 = v6;
        int v14 = v12;
        id v15 = @"PERSONA";
        goto LABEL_36;
      case 'S':
        id v12 = [NSString stringWithCString:*MEMORY[0x263EF89E0] encoding:4];
        long long v13 = v6;
        int v14 = v12;
        id v15 = @"SENTENCE";
        goto LABEL_36;
      case 'T':
      case 'a':
      case 'b':
      case 'd':
      case 'j':
      case 'n':
      case 'p':
      case 'r':
      case 's':
      case 't':
      case 'u':
      case 'w':
        uint64_t v9 = *MEMORY[0x263EF89E0];
        id v10 = [v27 objectForKey:v8];
        LOBYTE(v9) = ((uint64_t (**)(void, uint64_t, void *))v7)[2](v7, v9, v10);

        if ((v9 & 1) == 0) {
          goto LABEL_43;
        }
        goto LABEL_38;
      case 'V':
        puts((const char *)[@"1.14" UTF8String]);
        exit(0);
      case 'W':
        id v12 = [NSString stringWithCString:*MEMORY[0x263EF89E0] encoding:4];
        long long v13 = v6;
        int v14 = v12;
        id v15 = @"KEYBOARD_WIDTH";
        goto LABEL_36;
      case 'c':
        id v12 = [NSString stringWithCString:*MEMORY[0x263EF89E0] encoding:4];
        [v6 setValue:MEMORY[0x263EFFA88] forKey:@"USE_PARTFILE"];
        if (!v12) {
          goto LABEL_38;
        }
        long long v20 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v12, "integerValue"));
        [v6 setValue:v20 forKey:@"PARTFILE_FLUSH_THRESHOLD"];

        goto LABEL_37;
      case 'f':
        id v16 = v6;
        uint64_t v17 = MEMORY[0x263EFFA88];
        float v18 = @"PRINT_TYPING_TRANSCRIPT";
        goto LABEL_32;
      case 'i':
LABEL_9:
        __endptr = 0;
        int v11 = strtol((const char *)*MEMORY[0x263EF89E0], &__endptr, 10);
        if (*__endptr)
        {
          fprintf((FILE *)*MEMORY[0x263EF8348], "Error: invalid start index: %s\n");
          goto LABEL_43;
        }
        id v12 = [NSNumber numberWithUnsignedInteger:v11];
        long long v13 = v6;
        int v14 = v12;
        id v15 = @"START_INDEX";
        goto LABEL_36;
      case 'l':
        uint64_t v21 = [NSString stringWithCString:*MEMORY[0x263EF89E0] encoding:4];
        if (!v21) {
          goto LABEL_38;
        }
        id v12 = (void *)v21;
        long long v13 = v6;
        int v14 = v12;
        id v15 = @"KEYBOARD_LANGUAGE";
        goto LABEL_36;
      case 'o':
        id v12 = [NSString stringWithCString:*MEMORY[0x263EF89E0] encoding:4];
        long long v13 = v6;
        int v14 = v12;
        id v15 = @"OUTPATH";
        goto LABEL_36;
      case 'x':
        id v16 = v6;
        uint64_t v17 = MEMORY[0x263EFFA88];
        float v18 = @"TRANSLITERATION_SUMMARIES";
        goto LABEL_32;
      case 'z':
        if (!*MEMORY[0x263EF89E0])
        {
LABEL_31:
          id v16 = v6;
          uint64_t v17 = MEMORY[0x263EFFA88];
          float v18 = @"RUN_DSL_TEST";
LABEL_32:
          [v16 setValue:v17 forKey:v18];
          goto LABEL_38;
        }
        id v12 = [NSString stringWithCString:*MEMORY[0x263EF89E0] encoding:4];
        [v6 setValue:MEMORY[0x263EFFA88] forKey:@"RUN_DSL_TEST"];
        if (!v12) {
          goto LABEL_38;
        }
        long long v22 = (const char **)MEMORY[0x263EF89E0];
        int v23 = stat((const char *)*MEMORY[0x263EF89E0], &v29);
        uint64_t v24 = (FILE *)*MEMORY[0x263EF8348];
        if (v23)
        {
          fprintf(v24, "Error: data driven test file does not exist: %s\n");
LABEL_51:
          exit(1);
        }
        fprintf(v24, "data driven test file path: %s\n", *v22);
        long long v13 = v6;
        int v14 = v12;
        id v15 = @"DSL_TEST_FILE";
        goto LABEL_36;
      default:
        fwrite("Error: invalid paramter.\n", 0x19uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
        goto LABEL_43;
    }
  }
}

BOOL __parseArgs_block_invoke(uint64_t a1, const char *a2, void *a3)
{
  id v5 = a3;
  memset(&v12, 0, sizeof(v12));
  id v6 = [NSString stringWithCString:a2 encoding:4];
  int v7 = stat(a2, &v12);
  id v8 = (FILE *)*MEMORY[0x263EF8348];
  id v9 = v5;
  id v10 = (const char *)[v9 cStringUsingEncoding:4];
  if (v7)
  {
    fprintf(v8, "Error: %s path does not exist: %s\n", v10, a2);
  }
  else
  {
    fprintf(v8, "%s path: %s\n", v10, a2);
    [*(id *)(a1 + 32) setValue:v6 forKey:v9];
  }

  return v7 == 0;
}

id read_params(void *a1)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v29 = [MEMORY[0x263EFF9A0] dictionary];
  if (v1)
  {
    id v2 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v1];
    if (v2)
    {
      id v3 = (void *)[[NSString alloc] initWithData:v2 encoding:4];
      if (v3)
      {
        uint64_t v27 = v2;
        id v28 = v1;
        uint64_t v26 = v3;
        [v3 componentsSeparatedByString:@"\n"];
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id obj = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v4 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
        if (v4)
        {
          uint64_t v5 = v4;
          id v6 = @"#";
          uint64_t v7 = *(void *)v34;
          unint64_t v8 = 0x263F08000uLL;
          uint64_t v30 = *(void *)v34;
          do
          {
            uint64_t v9 = 0;
            uint64_t v31 = v5;
            do
            {
              if (*(void *)v34 != v7) {
                objc_enumerationMutation(obj);
              }
              id v10 = *(id *)(*((void *)&v33 + 1) + 8 * v9);
              uint64_t v11 = [v10 rangeOfString:v6];
              if (v11 != 0x7FFFFFFFFFFFFFFFLL)
              {
                uint64_t v12 = [v10 substringToIndex:v11];

                id v10 = (id)v12;
              }
              long long v13 = [*(id *)(v8 + 1800) whitespaceCharacterSet];
              int v14 = [v10 stringByTrimmingCharactersInSet:v13];

              if (([v14 isEqualToString:&stru_26F2B7E50] & 1) == 0)
              {
                id v15 = v6;
                id v16 = [v14 componentsSeparatedByString:@"="];
                uint64_t v17 = [v16 objectAtIndex:0];
                float v18 = [v16 objectAtIndex:1];
                [*(id *)(v8 + 1800) whitespaceCharacterSet];
                v20 = unint64_t v19 = v8;
                uint64_t v21 = [v17 stringByTrimmingCharactersInSet:v20];

                long long v22 = [*(id *)(v19 + 1800) whitespaceCharacterSet];
                int v23 = [v18 stringByTrimmingCharactersInSet:v22];

                if (v21)
                {
                  if (v23) {
                    uint64_t v24 = v23;
                  }
                  else {
                    uint64_t v24 = @"0";
                  }
                  [v29 setObject:v24 forKey:v21];
                }

                id v6 = v15;
                unint64_t v8 = v19;
                uint64_t v7 = v30;
                uint64_t v5 = v31;
              }

              ++v9;
            }
            while (v5 != v9);
            uint64_t v5 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
          }
          while (v5);
        }

        id v2 = v27;
        id v1 = v28;
      }
    }
  }
  return v29;
}

id getConfigurationOptions(void *a1)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = [v1 objectForKey:@"PARAMS"];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = read_params(v2);
LABEL_3:
    uint64_t v5 = (void *)v4;
    goto LABEL_7;
  }
  id v3 = [v1 objectForKey:@"JSON_CONFIG"];
  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF9A0] dictionary];
    goto LABEL_3;
  }
  id v6 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v3];
  id v40 = 0;
  uint64_t v7 = [MEMORY[0x263F08900] JSONObjectWithData:v6 options:4 error:&v40];
  id v8 = v40;
  if (!v7)
  {
    id v29 = (FILE *)*MEMORY[0x263EF8348];
    uint64_t v30 = (const char *)[v3 cStringUsingEncoding:4];
    id v31 = [v8 localizedDescription];
    fprintf(v29, "Error: Unable to parse JSON config file '%s': %s\n\n", v30, (const char *)[v31 cStringUsingEncoding:4]);

LABEL_37:
    exit(1);
  }
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:v7 copyItems:1];

LABEL_7:
  [v5 setObject:v1 forKey:@"COMMAND_LINE_ARGS"];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v9 = [&unk_26F2C9E58 countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v37 != v11) {
          objc_enumerationMutation(&unk_26F2C9E58);
        }
        uint64_t v13 = *(void *)(*((void *)&v36 + 1) + 8 * i);
        int v14 = [v1 valueForKey:v13];
        if (v14) {
          [v5 setValue:v14 forKey:v13];
        }
      }
      uint64_t v10 = [&unk_26F2C9E58 countByEnumeratingWithState:&v36 objects:v42 count:16];
    }
    while (v10);
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v15 = [&unk_26F2C9E70 countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (!v15)
  {
LABEL_24:
    long long v20 = (FILE *)*MEMORY[0x263EF8348];
    uint64_t v21 = "Error: You must provide a source of test input!\n\n";
    size_t v22 = 49;
LABEL_36:
    fwrite(v21, v22, 1uLL, v20);
    print_usage();
    goto LABEL_37;
  }
  uint64_t v16 = v15;
  uint64_t v17 = *(void *)v33;
LABEL_18:
  uint64_t v18 = 0;
  while (1)
  {
    if (*(void *)v33 != v17) {
      objc_enumerationMutation(&unk_26F2C9E70);
    }
    unint64_t v19 = [v5 objectForKey:*(void *)(*((void *)&v32 + 1) + 8 * v18)];

    if (v19) {
      break;
    }
    if (v16 == ++v18)
    {
      uint64_t v16 = [&unk_26F2C9E70 countByEnumeratingWithState:&v32 objects:v41 count:16];
      if (!v16) {
        goto LABEL_24;
      }
      goto LABEL_18;
    }
  }
  int v23 = [v5 objectForKey:@"DICT"];
  if (v23)
  {
  }
  else
  {
    uint64_t v24 = [v5 objectForKey:@"KEYBOARD_LANGUAGE"];

    if (!v24)
    {
      long long v20 = (FILE *)*MEMORY[0x263EF8348];
      uint64_t v21 = "Error: You must provide an input language.";
      size_t v22 = 42;
      goto LABEL_36;
    }
  }
  uint64_t v25 = [v1 objectForKey:@"PARAMS"];
  if (v25)
  {
    uint64_t v26 = (void *)v25;
    uint64_t v27 = [v1 objectForKey:@"JSON_CONFIG"];

    if (v27)
    {
      long long v20 = (FILE *)*MEMORY[0x263EF8348];
      uint64_t v21 = "Error: Use only Text or JSON parameter file but not both.";
      size_t v22 = 57;
      goto LABEL_36;
    }
  }

  return v5;
}

__CFString *keyForEventType(int a1)
{
  if ((a1 - 1) > 9) {
    return 0;
  }
  else {
    return off_265050150[a1 - 1];
  }
}

void _TIBeginMockingKeyboardActivityController()
{
  id v1 = objc_alloc_init(TIKeyboardAssertionManagerMock);
  if (objc_opt_respondsToSelector()) {
    [MEMORY[0x263F7EA98] performSelector:sel_setSharedAssertionManager_ withObject:v1];
  }
  uint64_t v0 = objc_alloc_init(TIKeyboardActivityControllerMock);
  if (objc_opt_respondsToSelector()) {
    [MEMORY[0x263F7EA90] performSelector:sel_setSharedController_ withObject:v0];
  }
}

uint64_t _TIEndMockingKeyboardActivityController()
{
  if (objc_opt_respondsToSelector()) {
    [MEMORY[0x263F7EA90] performSelector:sel_setSharedController_ withObject:0];
  }
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    id v1 = (void *)MEMORY[0x263F7EA98];
    return [v1 performSelector:sel_setSharedAssertionManager_ withObject:0];
  }
  return result;
}

void sub_23F00715C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23F0073A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23F0074C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23F007A34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_23F007E74(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

id TTKLogFacility()
{
  if (TTKLogFacility_onceToken != -1) {
    dispatch_once(&TTKLogFacility_onceToken, &__block_literal_global_2877);
  }
  uint64_t v0 = (void *)TTKLogFacility_logFacility;
  return v0;
}

uint64_t __TTKLogFacility_block_invoke()
{
  TTKLogFacility_logFacility = (uint64_t)os_log_create("com.apple.TextInput", "TTKLog");
  return MEMORY[0x270F9A758]();
}

void TI::CP::CPTestCaseEval::load_language_resources(TI::CP::CPTestCaseEval *this, NSString *a2, NSString *a3, double a4)
{
}

void sub_23F008364(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, unsigned int *a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a9) {
    WTF::RefCounted<KB::DictionaryContainer>::deref(a9);
  }
  if (a15 < 0) {
    operator delete(__p);
  }
  MEMORY[0x2455C26F0](v15, 0x10B2C406726BE89);
  _Unwind_Resume(a1);
}

void std::default_delete<TI::CP::TTKTestCaseConverter>::operator()[abi:nn180100](uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<KB::String,WTF::RefPtr<TI::Favonius::KeyboardLayout>>,std::__unordered_map_hasher<KB::String,std::__hash_value_type<KB::String,WTF::RefPtr<TI::Favonius::KeyboardLayout>>,std::hash<KB::String>,std::equal_to<KB::String>,true>,std::__unordered_map_equal<KB::String,std::__hash_value_type<KB::String,WTF::RefPtr<TI::Favonius::KeyboardLayout>>,std::equal_to<KB::String>,std::hash<KB::String>,true>,std::allocator<std::__hash_value_type<KB::String,WTF::RefPtr<TI::Favonius::KeyboardLayout>>>>::~__hash_table(a1 + 48);
  id v2 = *(unsigned int **)(a1 + 40);
  if (v2) {
    WTF::RefCounted<KB::DictionaryContainer>::deref(v2);
  }
  id v3 = *(std::__shared_weak_count **)(a1 + 32);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v3);
  }
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
  JUMPOUT(0x2455C26F0);
}

void TI::CP::CPTestCaseEval::~CPTestCaseEval(void **this)
{
  *this = &unk_26F2B75D0;
  if (*((char *)this + 279) < 0) {
    operator delete(this[32]);
  }
  if (*((char *)this + 255) < 0) {
    operator delete(this[29]);
  }
  if (*((char *)this + 231) < 0) {
    operator delete(this[26]);
  }

  uint64_t v2 = (uint64_t)this[23];
  this[23] = 0;
  if (v2) {
    std::default_delete<TI::CP::TTKTestCaseConverter>::operator()[abi:nn180100](v2);
  }
  TI::CP::CPEval::~CPEval((TI::CP::CPEval *)this);
  JUMPOUT(0x2455C26F0);
}

{
  uint64_t v2;
  uint64_t vars8;

  *this = &unk_26F2B75D0;
  if (*((char *)this + 279) < 0) {
    operator delete(this[32]);
  }
  if (*((char *)this + 255) < 0) {
    operator delete(this[29]);
  }
  if (*((char *)this + 231) < 0) {
    operator delete(this[26]);
  }

  uint64_t v2 = (uint64_t)this[23];
  this[23] = 0;
  if (v2) {
    std::default_delete<TI::CP::TTKTestCaseConverter>::operator()[abi:nn180100](v2);
  }
  TI::CP::CPEval::~CPEval((TI::CP::CPEval *)this);
}

void TI::CP::CPEval::~CPEval(TI::CP::CPEval *this)
{
  *(void *)this = &unk_26F2B7818;
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 15);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v2);
  }
  id v3 = (unsigned int *)*((void *)this + 13);
  if (v3)
  {
    unsigned int v4 = atomic_load(v3 + 2);
    if (v4 == 1) {
      (*(void (**)(unsigned int *))(*(void *)v3 + 8))(v3);
    }
    else {
      atomic_fetch_add((atomic_uint *volatile)v3 + 2, 0xFFFFFFFF);
    }
  }
  uint64_t v5 = (unsigned int *)*((void *)this + 12);
  if (v5)
  {
    unsigned int v6 = atomic_load(v5 + 2);
    if (v6 == 1) {
      (*(void (**)(unsigned int *))(*(void *)v5 + 40))(v5);
    }
    else {
      atomic_fetch_add((atomic_uint *volatile)v5 + 2, 0xFFFFFFFF);
    }
  }
  uint64_t v7 = (std::__shared_weak_count *)*((void *)this + 11);
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v7);
  }
  id v8 = (unsigned int *)*((void *)this + 9);
  if (v8) {
    WTF::RefCounted<KB::DictionaryContainer>::deref(v8);
  }
  if (*((char *)this + 71) < 0) {
    operator delete(*((void **)this + 6));
  }
  uint64_t v9 = (const void *)*((void *)this + 4);
  if (v9) {
    CFRelease(v9);
  }
  *((void *)this + 4) = 0;
  uint64_t v10 = (const void *)*((void *)this + 3);
  if (v10) {
    CFRelease(v10);
  }
  *((void *)this + 3) = 0;
}

{
  uint64_t vars8;

  TI::CP::CPEval::~CPEval(this);
  JUMPOUT(0x2455C26F0);
}

uint64_t TI::CP::CPTestCaseEval::CPTestCaseEval(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 152) = 0u;
  *(_OWORD *)(a1 + 168) = 0u;
  *(void *)a1 = &unk_26F2B7818;
  TI::CP::ShapeStoreConfiguration::default_config((TI::CP::ShapeStoreConfiguration *)(a1 + 16));
  *(_DWORD *)(a1 + 40) = 0;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = xmmword_23F04A3F0;
  *(_DWORD *)(a1 + 144) = 1028443341;
  *(void *)(a1 + 148) = 0x300000000;
  *(unsigned char *)(a1 + 160) = 1;
  *(void *)(a1 + 168) = 0;
  *(void *)(a1 + 176) = 0xF00000002;
  *(void *)a1 = &unk_26F2B75D0;
  *(_OWORD *)(a1 + 200) = 0u;
  *(_OWORD *)(a1 + 216) = 0u;
  *(_OWORD *)(a1 + 232) = 0u;
  *(_OWORD *)(a1 + 248) = 0u;
  *(_OWORD *)(a1 + 184) = 0u;
  *(unsigned char *)(a1 + 280) = 0;
  *(_OWORD *)(a1 + 264) = 0u;
  *(_OWORD *)(a1 + 284) = xmmword_23F04A400;
  *(void *)(a1 + 192) = v5;
  id v7 = v5;
  id v8 = *(void **)(a1 + 200);
  *(void *)(a1 + 200) = v6;

  return a1;
}

void sub_23F0087E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

const void **TI::CP::ShapeStoreConfiguration::default_config(TI::CP::ShapeStoreConfiguration *this)
{
  *(_DWORD *)this = 1050253722;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = @"shapestore.db";
  uint64_t v2 = (const void **)((char *)this + 16);
  CFRetain(@"shapestore.db");
  *uint64_t v2 = @"shapestore.db";
  CFStringRef v3 = (const __CFString *)TI_KB_USER_DIRECTORY();
  CFURLRef v4 = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x263EFFB08], v3, kCFURLPOSIXPathStyle, 1u);
  id v5 = (const void *)*((void *)this + 1);
  if (v5) {
    CFRelease(v5);
  }
  *((void *)this + 1) = v4;
  return KB::retain_ptr<__CFString const*>::operator=(v2, @"shapestore.db");
}

void sub_23F00888C(_Unwind_Exception *a1)
{
  if (v2) {
    CFRelease(v2);
  }
  TI::CP::ShapeStoreConfiguration::~ShapeStoreConfiguration(v1);
  _Unwind_Resume(a1);
}

const void **KB::retain_ptr<__CFString const*>::operator=(const void **a1, CFTypeRef cf)
{
  CFTypeRef v3 = *a1;
  if (v3 != cf)
  {
    if (cf)
    {
      CFRetain(cf);
      CFTypeRef v3 = *a1;
    }
    if (v3) {
      CFRelease(v3);
    }
    *a1 = cf;
  }
  return a1;
}

void TI::CP::ShapeStoreConfiguration::~ShapeStoreConfiguration(TI::CP::ShapeStoreConfiguration *this)
{
  uint64_t v2 = (const void *)*((void *)this + 2);
  if (v2) {
    CFRelease(v2);
  }
  *((void *)this + 2) = 0;
  CFTypeRef v3 = (const void *)*((void *)this + 1);
  if (v3) {
    CFRelease(v3);
  }
  *((void *)this + 1) = 0;
}

uint64_t TI::CP::CPTestCaseEval::CPTestCaseEval(uint64_t a1, NSString *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  TI::CP::CPEval::CPEval((TI::CP::CPEval *)a1, a2);
  *(void *)a1 = &unk_26F2B75D0;
  *(_OWORD *)(a1 + 200) = 0u;
  *(_OWORD *)(a1 + 216) = 0u;
  *(_OWORD *)(a1 + 232) = 0u;
  *(_OWORD *)(a1 + 248) = 0u;
  *(_OWORD *)(a1 + 184) = 0u;
  *(unsigned char *)(a1 + 280) = 0;
  *(_OWORD *)(a1 + 264) = 0u;
  *(_OWORD *)(a1 + 284) = xmmword_23F04A400;
  *(void *)(a1 + 192) = v7;
  id v9 = v7;
  uint64_t v10 = *(void **)(a1 + 200);
  *(void *)(a1 + 200) = v8;

  return a1;
}

void sub_23F008A18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void TI::CP::CPTestCaseEval::evaluate_tests(uint64_t a1@<X0>, int *a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, void *a5@<X5>, uint64_t a6@<X8>)
{
  uint64_t v126 = *MEMORY[0x263EF8340];
  uint64_t v63 = a5;
  unsigned __int8 v9 = *(unsigned char *)(a1 + 8);
  char v10 = *(unsigned char *)(a1 + 280);
  long long v78 = 0u;
  memset(v79, 0, sizeof(v79));
  long long v80 = 0u;
  memset(v81, 0, 32);
  memset(&v81[20], 0, 24);
  long long v82 = 0u;
  memset(v83, 0, sizeof(v83));
  int v84 = 1065353216;
  long long v87 = 0u;
  memset(v86, 0, sizeof(v86));
  long long v85 = 0u;
  uint64_t v88 = 0;
  *((void *)&v89 + 1) = 0xC010000000000000;
  long long v90 = 0x4008000000000000uLL;
  int v91 = 0;
  v81[16] = v9;
  LOBYTE(v81[32]) = v10;
  unint64_t v68 = a2;
  int v11 = *a2;
  if (*a2 == 2) {
    TI::CP::CPEval::create_input_manager((TI::CP::CPEval *)a1, v63);
  }
  if (v11 == 1) {
    TI::CP::CPEval::create_favonius((TI::CP::CPEval *)a1, v63);
  }
  if (v11) {
    goto LABEL_77;
  }
  long long v12 = *(_OWORD *)(a4 + 80);
  v118[4] = *(_OWORD *)(a4 + 64);
  v118[5] = v12;
  uint64_t v119 = *(void *)(a4 + 96);
  long long v13 = *(_OWORD *)(a4 + 16);
  v118[0] = *(_OWORD *)a4;
  v118[1] = v13;
  long long v14 = *(_OWORD *)(a4 + 32);
  v118[3] = *(_OWORD *)(a4 + 48);
  v118[2] = v14;
  if (*(char *)(a4 + 127) < 0) {
    std::string::__init_copy_ctor_external(&v120, *(const std::string::value_type **)(a4 + 104), *(void *)(a4 + 112));
  }
  else {
    std::string v120 = *(std::string *)(a4 + 104);
  }
  if (*(char *)(a4 + 151) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(a4 + 128), *(void *)(a4 + 136));
  }
  else {
    std::string __p = *(std::string *)(a4 + 128);
  }
  __int16 v122 = *(_WORD *)(a4 + 152);
  char v123 = *(unsigned char *)(a4 + 154);
  MEMORY[0x2455C23B0](v124, a4 + 160);
  long long v15 = *(_OWORD *)(a4 + 336);
  v124[10] = *(_OWORD *)(a4 + 320);
  v124[11] = v15;
  uint64_t v125 = *(void *)(a4 + 352);
  long long v16 = *(_OWORD *)(a4 + 272);
  v124[6] = *(_OWORD *)(a4 + 256);
  v124[7] = v16;
  long long v17 = *(_OWORD *)(a4 + 288);
  v124[9] = *(_OWORD *)(a4 + 304);
  v124[8] = v17;
  long long v18 = *(_OWORD *)(a4 + 208);
  v124[2] = *(_OWORD *)(a4 + 192);
  v124[3] = v18;
  long long v19 = *(_OWORD *)(a4 + 224);
  v124[5] = *(_OWORD *)(a4 + 240);
  v124[4] = v19;
  TI::CP::CPEval::create_recognizer_for_config((const std::string *)a1, a3, (uint64_t)v118, v116);
  unint64_t v66 = (const void **)v116[0];
  KB::String::~String((KB::String *)v124);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v120.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v120.__r_.__value_.__l.__data_);
  }
  if (!v66)
  {
LABEL_77:
    TI::CP::TestResultsSummarizer::TestResultsSummarizer((TI::CP::TestResultsSummarizer *)a6, (const TI::CP::TestResultsSummarizer *)&v78);
    goto LABEL_78;
  }
  printf("Running test case ");
  [*(id *)(a1 + 192) reset];
  long long v20 = [*(id *)(a1 + 192) getNextTestCase];
  int v65 = 0;
  char v73 = 0;
  int v21 = 0;
  int v71 = 0;
  int64x2_t v67 = vdupq_n_s64(0xFFF0000000000000);
LABEL_18:
  if ((v73 & 1) == 0 && v20)
  {
    context = (void *)MEMORY[0x2455C2B00]();
    ++v71;
    HIDWORD(v22) = -1030792151 * v71;
    LODWORD(v22) = -1030792151 * v71;
    if ((v22 >> 1) <= 0x51EB851)
    {
      printf("%u...", v71);
      fflush((FILE *)*MEMORY[0x263EF8358]);
    }
    int v23 = [v20 intendedText];
    BOOL v24 = [v23 length] == 0;

    if (!v24)
    {
      uint64_t v25 = +[TTKTestCase convertToIsolatedWordMode:v20];
      if (!v25)
      {
        id v50 = [v20 intendedText];
        uint64_t v51 = (const char *)[v50 UTF8String];
        unint64_t v52 = [v20 metadata];
        id v53 = [v52 objectForKey:@"recordIdentifier"];
        printf("\nUnexpected failure [#%u] converting to isolated word mode for record %u, string = <%s>, id=<%s>\n", ++v65, v71, v51, (const char *)[v53 UTF8String]);

        [*(id *)(a1 + 192) getNextTestCase];
        char v73 = 0;
        long long v20 = v72 = v20;
        goto LABEL_75;
      }
      uint64_t v26 = (void *)v25;

      long long v20 = v26;
    }
    unint64_t v69 = v20;
    if (*(void *)(a1 + 200))
    {
      uint64_t v72 = [MEMORY[0x263EFF980] array];
    }
    else
    {
      uint64_t v72 = 0;
    }
    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    uint64_t v27 = [v20 records];
    uint64_t v28 = [v27 countByEnumeratingWithState:&v74 objects:v117 count:16];
    if (!v28)
    {
      char v73 = 0;
      goto LABEL_70;
    }
    char v73 = 0;
    uint64_t v29 = *(void *)v75;
    while (1)
    {
      uint64_t v30 = 0;
      do
      {
        if (*(void *)v75 != v29) {
          objc_enumerationMutation(v27);
        }
        id v31 = *(TTKTestCaseRecord **)(*((void *)&v74 + 1) + 8 * v30);
        long long v32 = (void *)MEMORY[0x2455C2B00]();
        int v33 = *(_DWORD *)(a1 + 292);
        if (v33 < 0 || v21 <= v33)
        {
          if (v21 >= *(_DWORD *)(a1 + 288))
          {
            long long v35 = [(TTKTestCaseRecord *)v31 touchDataCollection];
            BOOL v36 = [v35 count] == 0;

            if (!v36)
            {
              int v37 = v21 + 1;
              if ((v21 - *(_DWORD *)(a1 + 288)) % *(_DWORD *)(a1 + 296))
              {
                int v34 = 5;
LABEL_61:
                int v21 = v37;
                goto LABEL_62;
              }
              TI::CP::TTKTestCaseConverter::convert(*(TI::CP::TTKTestCaseConverter **)(a1 + 184), v31, (uint64_t)v116);
              long long v38 = (TI::CP::CPTestCaseEval *)KB::String::String((KB::String *)v106);
              int v109 = 0;
              memset(v107, 0, sizeof(v107));
              memset(v108, 0, sizeof(v108));
              v113 = 0;
              uint64_t v114 = 0;
              v112 = (uint64_t *)&v113;
              v115[0] = v67;
              *(__int32 *)((char *)v115[1].i32 + 1) = 0;
              int v39 = *v68;
              if (*v68 == 2)
              {
                TI::CP::CPEval::evaluate_test_case_input_manager((TI::CP::CPEval *)a1, v116, 0, v21, (uint64_t)&v93);
                int v105 = (int)v93;
                KB::String::operator=();
              }
              else
              {
                if (v39 != 1)
                {
                  if (v39) {
                    goto LABEL_56;
                  }
                  TI::CP::CPEval::evaluate_test_case((TI::CP::CPEval *)a1, (const TI::CP::ContinuousPathTestCase *)v116, (TI::CP::TIPathRecognizerInterface *)v66, v21, (uint64_t)&v93);
                  int v105 = (int)v93;
                  KB::String::operator=();
                  KB::CandidateCollection::operator=((uint64_t)v107, (uint64_t)v95);
                  long long v110 = v99;
                  long long v111 = v100;
                  std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::destroy(v113);
                  id v40 = v102;
                  v112 = v101;
                  v113 = v102;
                  uint64_t v114 = v103;
                  if (v103)
                  {
                    v102[2] = &v113;
                    id v40 = 0;
                    uint64_t v101 = (uint64_t *)&v102;
                    uint64_t v102 = 0;
                    uint64_t v103 = 0;
                  }
                  else
                  {
                    v112 = (uint64_t *)&v113;
                  }
                  v115[0] = v104[0];
                  *(int64x2_t *)((char *)v115 + 12) = *(int64x2_t *)((char *)v104 + 12);
                  std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::destroy(v40);
                  unint64_t v92 = (void ***)v98;
                  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v92);
                  unint64_t v92 = (void ***)v97;
                  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v92);
                  unint64_t v92 = (void ***)v96;
                  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v92);
                  unint64_t v92 = (void ***)v95;
                  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v92);
                  KB::String::~String((KB::String *)v94);
                  if (a3) {
                    goto LABEL_56;
                  }
                  MEMORY[0x2455C23A0](&v93, "favonius");
                  unint64_t v92 = &v93;
                  unint64_t v44 = std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::__emplace_unique_key_args<KB::String,std::piecewise_construct_t const&,std::tuple<KB::String const&>,std::tuple<>>(&v112, (uint64_t)&v93, &v92);
                  TI::CP::Path::operator=((void **)v44 + 8, v66 + 7);
                  unint64_t v42 = (KB::String *)&v93;
LABEL_53:
                  KB::String::~String(v42);
LABEL_56:
                  if (*(void *)(a1 + 200) && ((v110 & 0x80000000) != 0 || (int)v110 >= *(_DWORD *)(a1 + 284)))
                  {
                    uint64_t v43 = TI::CP::CPTestCaseEval::create_results_dictionary(v38, (const TI::CP::ContinuousPathTestResult *)&v105, 0x28u);
                    [(TTKTestCaseRecord *)v31 setAnnotation:v43 forKey:@"cpEvalResults"];
                    [v72 addObject:v31];
                  }
                  TI::CP::TestResultsSummarizer::add_result((TI::CP::TestResultsSummarizer *)&v78, (const TI::CP::ContinuousPathTestResult *)&v105);
                  std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::destroy(v113);
                  uint64_t v93 = (void **)&v108[1] + 1;
                  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v93);
                  uint64_t v93 = (void **)v108;
                  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v93);
                  uint64_t v93 = (void **)&v107[1] + 1;
                  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v93);
                  uint64_t v93 = (void **)v107;
                  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v93);
                  KB::String::~String((KB::String *)v106);
                  TI::CP::ContinuousPathTestCase::~ContinuousPathTestCase((TI::CP::ContinuousPathTestCase *)v116);
                  int v34 = 0;
                  goto LABEL_61;
                }
                TI::CP::CPEval::evaluate_test_case_favonius((TI::CP::CPEval *)a1, (const TI::CP::ContinuousPathTestCase *)v116, 0, v21, (uint64_t)&v93);
                int v105 = (int)v93;
                KB::String::operator=();
              }
              KB::CandidateCollection::operator=((uint64_t)v107, (uint64_t)v95);
              long long v110 = v99;
              long long v111 = v100;
              std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::destroy(v113);
              unint64_t v41 = v102;
              v112 = v101;
              v113 = v102;
              uint64_t v114 = v103;
              if (v103)
              {
                v102[2] = &v113;
                unint64_t v41 = 0;
                uint64_t v101 = (uint64_t *)&v102;
                uint64_t v102 = 0;
                uint64_t v103 = 0;
              }
              else
              {
                v112 = (uint64_t *)&v113;
              }
              v115[0] = v104[0];
              *(int64x2_t *)((char *)v115 + 12) = *(int64x2_t *)((char *)v104 + 12);
              std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::destroy(v41);
              unint64_t v92 = (void ***)v98;
              std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v92);
              unint64_t v92 = (void ***)v97;
              std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v92);
              unint64_t v92 = (void ***)v96;
              std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v92);
              unint64_t v92 = (void ***)v95;
              std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v92);
              unint64_t v42 = (KB::String *)v94;
              goto LABEL_53;
            }
          }
          else
          {
            ++v21;
          }
          int v34 = 5;
        }
        else
        {
          int v34 = 4;
          char v73 = 1;
        }
LABEL_62:
        if (v34 != 5 && v34) {
          goto LABEL_70;
        }
        ++v30;
      }
      while (v28 != v30);
      uint64_t v45 = [v27 countByEnumeratingWithState:&v74 objects:v117 count:16];
      uint64_t v28 = v45;
      if (!v45)
      {
LABEL_70:

        uint64_t v46 = v69;
        if (*(void *)(a1 + 200))
        {
          if ([v72 count])
          {
            uint64_t v47 = [TTKTestCase alloc];
            uint64_t v48 = [v69 metadata];
            uint64_t v49 = [(TTKTestCase *)v47 initWithMetadata:v48 records:v72];

            [*(id *)(a1 + 200) pushNextTestCase:v49];
            uint64_t v46 = v69;
          }
        }
        long long v20 = [*(id *)(a1 + 192) getNextTestCase];

LABEL_75:
        goto LABEL_18;
      }
    }
  }
  putchar(10);
  fflush((FILE *)*MEMORY[0x263EF8358]);
  *(void *)(a6 + 16) = *(void *)&v79[0];
  *(void *)(a6 + 40) = *((void *)&v79[1] + 1);
  uint64_t v54 = v83[0];
  *(void *)(a6 + 64) = *(void *)v81;
  *(_OWORD *)a6 = v78;
  long long v78 = 0uLL;
  *(_OWORD *)(a6 + 24) = *(_OWORD *)((char *)v79 + 8);
  memset(v79, 0, sizeof(v79));
  *(_OWORD *)(a6 + 48) = v80;
  *(void *)unint64_t v81 = 0;
  long long v80 = 0uLL;
  long long v55 = *(_OWORD *)&v81[4];
  long long v56 = *(_OWORD *)&v81[12];
  long long v57 = *(_OWORD *)&v81[20];
  *(_OWORD *)(a6 + 113) = *(_OWORD *)((char *)&v81[24] + 1);
  *(_OWORD *)(a6 + 104) = v57;
  *(_OWORD *)(a6 + 88) = v56;
  *(_OWORD *)(a6 + 72) = v55;
  long long v58 = v82;
  *(void *)(a6 + 152) = v54;
  long long v82 = 0uLL;
  v83[0] = 0;
  *(_OWORD *)(a6 + 136) = v58;
  std::__hash_table<std::__hash_value_type<std::string,std::vector<TI::CP::ContinuousPathTestResult>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<TI::CP::ContinuousPathTestResult>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<TI::CP::ContinuousPathTestResult>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<TI::CP::ContinuousPathTestResult>>>>::__hash_table(a6 + 160, &v83[1]);
  *(_OWORD *)(a6 + 200) = v85;
  *(void *)(a6 + 216) = v86[0];
  v86[0] = 0;
  long long v85 = 0uLL;
  *(_OWORD *)(a6 + 224) = *(_OWORD *)&v86[1];
  uint64_t v59 = v88;
  *(void *)(a6 + 240) = v86[3];
  *(_OWORD *)&v86[1] = 0uLL;
  *(_OWORD *)(a6 + 248) = v87;
  *(void *)(a6 + 264) = v59;
  v86[3] = 0;
  long long v87 = 0uLL;
  uint64_t v88 = 0;
  long long v60 = v89;
  long long v61 = v90;
  *(_DWORD *)(a6 + 304) = v91;
  *(_OWORD *)(a6 + 272) = v60;
  *(_OWORD *)(a6 + 288) = v61;

  (*((void (**)(const void **))*v66 + 1))(v66);
LABEL_78:
  TI::CP::TestResultsSummarizer::~TestResultsSummarizer((TI::CP::TestResultsSummarizer *)&v78);
}

void sub_23F0096A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
  if (SLOBYTE(STACK[0x67F]) < 0) {
    operator delete((void *)STACK[0x668]);
  }
  TI::CP::TestResultsSummarizer::~TestResultsSummarizer((TI::CP::TestResultsSummarizer *)&a57);

  _Unwind_Resume(a1);
}

void TI::CP::EnsembleConfig::~EnsembleConfig(void **this)
{
  if (*((char *)this + 151) < 0) {
    operator delete(this[16]);
  }
  if (*((char *)this + 127) < 0) {
    operator delete(this[13]);
  }
}

TI::CP::TestResultsSummarizer *TI::CP::TestResultsSummarizer::TestResultsSummarizer(TI::CP::TestResultsSummarizer *this, const TI::CP::TestResultsSummarizer *a2)
{
  unint64_t v2 = (unint64_t)a2;
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *((void *)a2 + 1);
  if (v5 != *(void *)a2)
  {
    std::vector<TI::CP::ContinuousPathTestResult>::__vallocate[abi:nn180100](this, 0x34F72C234F72C235 * ((v5 - *(void *)a2) >> 3));
    std::vector<TI::CP::ContinuousPathTestResult>::__construct_at_end<TI::CP::ContinuousPathTestResult*,TI::CP::ContinuousPathTestResult*>(this, v4, v5);
  }
  *((void *)this + 3) = 0;
  *((void *)this + 4) = 0;
  *((void *)this + 5) = 0;
  uint64_t v6 = *(void *)(v2 + 24);
  uint64_t v7 = *(void *)(v2 + 32);
  if (v7 != v6)
  {
    std::vector<TI::CP::ContinuousPathTestResult>::__vallocate[abi:nn180100]((void *)this + 3, 0x34F72C234F72C235 * ((v7 - v6) >> 3));
    std::vector<TI::CP::ContinuousPathTestResult>::__construct_at_end<TI::CP::ContinuousPathTestResult*,TI::CP::ContinuousPathTestResult*>((TI::CP::TestResultsSummarizer *)((char *)this + 24), v6, v7);
  }
  *((void *)this + 6) = 0;
  *((void *)this + 7) = 0;
  *((void *)this + 8) = 0;
  uint64_t v8 = *(void *)(v2 + 48);
  uint64_t v9 = *(void *)(v2 + 56);
  if (v9 != v8)
  {
    std::vector<TI::CP::ContinuousPathTestResult>::__vallocate[abi:nn180100]((void *)this + 6, 0x34F72C234F72C235 * ((v9 - v8) >> 3));
    std::vector<TI::CP::ContinuousPathTestResult>::__construct_at_end<TI::CP::ContinuousPathTestResult*,TI::CP::ContinuousPathTestResult*>((TI::CP::TestResultsSummarizer *)((char *)this + 48), v8, v9);
  }
  long long v10 = *(_OWORD *)(v2 + 72);
  long long v11 = *(_OWORD *)(v2 + 88);
  long long v12 = *(_OWORD *)(v2 + 104);
  long long v13 = *(_OWORD *)(v2 + 113);
  *((void *)this + 17) = 0;
  *(_OWORD *)((char *)this + 113) = v13;
  *(_OWORD *)((char *)this + 88) = v11;
  *(_OWORD *)((char *)this + 104) = v12;
  *(_OWORD *)((char *)this + 72) = v10;
  *((void *)this + 18) = 0;
  *((void *)this + 19) = 0;
  uint64_t v14 = *(void *)(v2 + 136);
  uint64_t v15 = *(void *)(v2 + 144);
  if (v15 != v14)
  {
    std::vector<TI::CP::ContinuousPathTestResult>::__vallocate[abi:nn180100]((void *)this + 17, 0x34F72C234F72C235 * ((v15 - v14) >> 3));
    std::vector<TI::CP::ContinuousPathTestResult>::__construct_at_end<TI::CP::ContinuousPathTestResult*,TI::CP::ContinuousPathTestResult*>((TI::CP::TestResultsSummarizer *)((char *)this + 136), v14, v15);
  }
  *((_OWORD *)this + 10) = 0u;
  *((_OWORD *)this + 11) = 0u;
  *((_DWORD *)this + 48) = *(_DWORD *)(v2 + 192);
  uint64_t v51 = (uint64_t *)((char *)this + 160);
  std::__hash_table<std::__hash_value_type<unsigned int,float>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,float>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,float>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,float>>>::__rehash<true>((uint64_t)this + 160, *(void *)(v2 + 168));
  unint64_t v49 = v2;
  long long v16 = *(uint64_t **)(v2 + 176);
  if (v16)
  {
    id v50 = (void *)((char *)this + 176);
    do
    {
      int v17 = *((char *)v16 + 39);
      if (v17 >= 0) {
        long long v18 = v16 + 2;
      }
      else {
        long long v18 = (uint64_t *)v16[2];
      }
      if (v17 >= 0) {
        unint64_t v19 = *((unsigned __int8 *)v16 + 39);
      }
      else {
        unint64_t v19 = v16[3];
      }
      unint64_t v20 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100](v18, v19);
      unint64_t v21 = v20;
      unint64_t v22 = *((void *)this + 21);
      if (v22)
      {
        uint8x8_t v23 = (uint8x8_t)vcnt_s8((int8x8_t)v22);
        v23.i16[0] = vaddlv_u8(v23);
        unint64_t v24 = v23.u32[0];
        if (v23.u32[0] > 1uLL)
        {
          unint64_t v2 = v20;
          if (v20 >= v22) {
            unint64_t v2 = v20 % v22;
          }
        }
        else
        {
          unint64_t v2 = (v22 - 1) & v20;
        }
        uint64_t v25 = *(unsigned __int8 ***)(*v51 + 8 * v2);
        if (v25)
        {
          for (uint64_t i = *v25; i; uint64_t i = *(unsigned __int8 **)i)
          {
            unint64_t v27 = *((void *)i + 1);
            if (v27 == v21)
            {
              if (std::equal_to<std::string>::operator()[abi:nn180100](i + 16, (unsigned __int8 *)v16 + 16)) {
                goto LABEL_60;
              }
            }
            else
            {
              if (v24 > 1)
              {
                if (v27 >= v22) {
                  v27 %= v22;
                }
              }
              else
              {
                v27 &= v22 - 1;
              }
              if (v27 != v2) {
                break;
              }
            }
          }
        }
      }
      uint64_t v28 = (char *)operator new(0x40uLL);
      uint64_t v29 = v28;
      v52[0] = v28;
      v52[1] = (char *)this + 176;
      char v53 = 0;
      *(void *)uint64_t v28 = 0;
      *((void *)v28 + 1) = v21;
      if (*((char *)v16 + 39) < 0)
      {
        std::string::__init_copy_ctor_external((std::string *)(v28 + 16), (const std::string::value_type *)v16[2], v16[3]);
      }
      else
      {
        long long v30 = *((_OWORD *)v16 + 1);
        *((void *)v28 + 4) = v16[4];
        *((_OWORD *)v28 + 1) = v30;
      }
      v29[5] = 0;
      v29[6] = 0;
      v29[7] = 0;
      uint64_t v31 = v16[5];
      uint64_t v32 = v16[6];
      if (v32 != v31)
      {
        std::vector<TI::CP::ContinuousPathTestResult>::__vallocate[abi:nn180100](v29 + 5, 0x34F72C234F72C235 * ((v32 - v31) >> 3));
        std::vector<TI::CP::ContinuousPathTestResult>::__construct_at_end<TI::CP::ContinuousPathTestResult*,TI::CP::ContinuousPathTestResult*>((TI::CP::ContinuousPathTestResult *)(v29 + 5), v31, v32);
      }
      char v53 = 1;
      float v33 = (float)(unint64_t)(*((void *)this + 23) + 1);
      float v34 = *((float *)this + 48);
      if (!v22 || (float)(v34 * (float)v22) < v33)
      {
        BOOL v35 = (v22 & (v22 - 1)) != 0;
        if (v22 < 3) {
          BOOL v35 = 1;
        }
        unint64_t v36 = v35 | (2 * v22);
        unint64_t v37 = vcvtps_u32_f32(v33 / v34);
        if (v36 <= v37) {
          size_t v38 = v37;
        }
        else {
          size_t v38 = v36;
        }
        std::__hash_table<std::__hash_value_type<unsigned int,float>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,float>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,float>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,float>>>::__rehash<true>((uint64_t)v51, v38);
        unint64_t v22 = *((void *)this + 21);
        if ((v22 & (v22 - 1)) != 0)
        {
          if (v21 >= v22) {
            unint64_t v2 = v21 % v22;
          }
          else {
            unint64_t v2 = v21;
          }
        }
        else
        {
          unint64_t v2 = (v22 - 1) & v21;
        }
      }
      uint64_t v39 = *v51;
      id v40 = *(void **)(*v51 + 8 * v2);
      if (v40)
      {
        *uint64_t v29 = *v40;
      }
      else
      {
        *uint64_t v29 = *v50;
        *id v50 = v29;
        *(void *)(v39 + 8 * v2) = v50;
        if (!*v29) {
          goto LABEL_59;
        }
        unint64_t v41 = *(void *)(*v29 + 8);
        if ((v22 & (v22 - 1)) != 0)
        {
          if (v41 >= v22) {
            v41 %= v22;
          }
        }
        else
        {
          v41 &= v22 - 1;
        }
        id v40 = (void *)(*v51 + 8 * v41);
      }
      *id v40 = v29;
LABEL_59:
      v52[0] = 0;
      ++*((void *)this + 23);
      std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::vector<TI::CP::ContinuousPathTestResult>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::vector<TI::CP::ContinuousPathTestResult>>,void *>>>>::reset[abi:nn180100]((uint64_t)v52);
LABEL_60:
      long long v16 = (uint64_t *)*v16;
    }
    while (v16);
  }
  *((void *)this + 25) = 0;
  *((void *)this + 26) = 0;
  *((void *)this + 27) = 0;
  uint64_t v42 = *(void *)(v49 + 200);
  uint64_t v43 = *(void *)(v49 + 208);
  if (v43 != v42)
  {
    std::vector<TI::CP::ContinuousPathTestResult>::__vallocate[abi:nn180100]((void *)this + 25, 0x34F72C234F72C235 * ((v43 - v42) >> 3));
    std::vector<TI::CP::ContinuousPathTestResult>::__construct_at_end<TI::CP::ContinuousPathTestResult*,TI::CP::ContinuousPathTestResult*>((TI::CP::TestResultsSummarizer *)((char *)this + 200), v42, v43);
  }
  *((void *)this + 28) = 0;
  *((void *)this + 29) = 0;
  *((void *)this + 30) = 0;
  uint64_t v44 = *(void *)(v49 + 224);
  uint64_t v45 = *(void *)(v49 + 232);
  if (v45 != v44)
  {
    std::vector<TI::CP::ContinuousPathTestResult>::__vallocate[abi:nn180100]((void *)this + 28, 0x34F72C234F72C235 * ((v45 - v44) >> 3));
    std::vector<TI::CP::ContinuousPathTestResult>::__construct_at_end<TI::CP::ContinuousPathTestResult*,TI::CP::ContinuousPathTestResult*>((TI::CP::TestResultsSummarizer *)((char *)this + 224), v44, v45);
  }
  std::vector<unsigned int>::vector((std::vector<unsigned int> *)((char *)this + 248), (const std::vector<unsigned int> *)(v49 + 248));
  long long v46 = *(_OWORD *)(v49 + 272);
  long long v47 = *(_OWORD *)(v49 + 288);
  *((_DWORD *)this + 76) = *(_DWORD *)(v49 + 304);
  *((_OWORD *)this + 17) = v46;
  *((_OWORD *)this + 18) = v47;
  return this;
}

void sub_23F009DF8(_Unwind_Exception *a1, void **a2, void **a3, void **a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void **);
  std::vector<TI::CP::ContinuousPathTestResult>::__destroy_vector::operator()[abi:nn180100]((void ***)va1);
  std::vector<TI::CP::ContinuousPathTestResult>::__destroy_vector::operator()[abi:nn180100]((void ***)va1);
  std::__hash_table<std::__hash_value_type<std::string,std::vector<TI::CP::ContinuousPathTestResult>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<TI::CP::ContinuousPathTestResult>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<TI::CP::ContinuousPathTestResult>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<TI::CP::ContinuousPathTestResult>>>>::~__hash_table(a7);
  uint64_t v8 = a2;
  std::vector<TI::CP::ContinuousPathTestResult>::__destroy_vector::operator()[abi:nn180100]((void ***)va);
  uint64_t v8 = a3;
  std::vector<TI::CP::ContinuousPathTestResult>::__destroy_vector::operator()[abi:nn180100]((void ***)va);
  uint64_t v8 = a4;
  std::vector<TI::CP::ContinuousPathTestResult>::__destroy_vector::operator()[abi:nn180100]((void ***)va);
  std::vector<TI::CP::ContinuousPathTestResult>::__destroy_vector::operator()[abi:nn180100]((void ***)va);
  _Unwind_Resume(a1);
}

uint64_t KB::CandidateCollection::operator=(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  std::vector<KB::Candidate>::__vdeallocate((void **)(a1 + 24));
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 24) = 0;
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = 0;
  std::vector<KB::Candidate>::__vdeallocate((void **)(a1 + 48));
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a2 + 48) = 0;
  *(void *)(a2 + 56) = 0;
  *(void *)(a2 + 64) = 0;
  std::vector<KB::Candidate>::__vdeallocate((void **)(a1 + 72));
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a2 + 72) = 0;
  *(void *)(a2 + 80) = 0;
  *(void *)(a2 + 88) = 0;
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  return a1;
}

uint64_t *std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::__emplace_unique_key_args<KB::String,std::piecewise_construct_t const&,std::tuple<KB::String const&>,std::tuple<>>(uint64_t **a1, uint64_t a2, void *a3)
{
  uint64_t v5 = (void **)std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::__find_equal<KB::String>((uint64_t)a1, &v11, a2);
  uint64_t v6 = (uint64_t *)*v5;
  if (!*v5)
  {
    uint64_t v7 = (uint64_t **)v5;
    uint64_t v6 = (uint64_t *)operator new(0x70uLL);
    v9[0] = (uint64_t)v6;
    v9[1] = (uint64_t)(a1 + 1);
    char v10 = 0;
    MEMORY[0x2455C23B0](v6 + 4, *a3);
    *((_OWORD *)v6 + 5) = 0u;
    *((_OWORD *)v6 + 6) = 0u;
    *((_OWORD *)v6 + 4) = 0u;
    char v10 = 1;
    std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::__insert_node_at(a1, v11, v7, v6);
    v9[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<KB::String,TI::CP::Path>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<KB::String,TI::CP::Path>,void *>>>>::reset[abi:nn180100](v9);
  }
  return v6;
}

void sub_23F00A018(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void **TI::CP::Path::operator=(void **a1, const void **a2)
{
  if (a1 != (void **)a2)
  {
    uint64_t v4 = (char *)*a2;
    uint64_t v5 = (char *)a2[1];
    int64_t v6 = v5 - (unsigned char *)*a2;
    unint64_t v7 = 0xAAAAAAAAAAAAAAABLL * (v6 >> 4);
    uint64_t v8 = (uint64_t)a1[2];
    uint64_t v9 = (char *)*a1;
    if (0xAAAAAAAAAAAAAAABLL * ((v8 - (uint64_t)*a1) >> 4) >= v7)
    {
      long long v13 = (char *)a1[1];
      if (0xAAAAAAAAAAAAAAABLL * ((v13 - v9) >> 4) < v7)
      {
        uint64_t v14 = &v4[16 * ((v13 - v9) >> 4)];
        if (v13 != v9)
        {
          memmove(*a1, *a2, v13 - v9);
          uint64_t v9 = (char *)a1[1];
        }
        int64_t v6 = v5 - v14;
        if (v5 == v14) {
          goto LABEL_20;
        }
        uint64_t v15 = v9;
        long long v16 = v14;
        goto LABEL_19;
      }
    }
    else
    {
      if (v9)
      {
        a1[1] = v9;
        operator delete(v9);
        uint64_t v8 = 0;
        *a1 = 0;
        a1[1] = 0;
        a1[2] = 0;
      }
      if (v7 > 0x555555555555555) {
        goto LABEL_40;
      }
      unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * (v8 >> 4);
      uint64_t v11 = 2 * v10;
      if (2 * v10 <= v7) {
        uint64_t v11 = 0xAAAAAAAAAAAAAAABLL * (v6 >> 4);
      }
      if (v10 >= 0x2AAAAAAAAAAAAAALL) {
        unint64_t v12 = 0x555555555555555;
      }
      else {
        unint64_t v12 = v11;
      }
      std::vector<TI::CP::PathSample>::__vallocate[abi:nn180100](a1, v12);
      uint64_t v9 = (char *)a1[1];
    }
    if (v5 == v4)
    {
LABEL_20:
      int v17 = &v9[v6];
      long long v18 = (char *)a1[3];
      a1[1] = v17;
      unint64_t v19 = (char *)a2[3];
      unint64_t v20 = (char *)a2[4];
      size_t v21 = v20 - v19;
      unint64_t v22 = (v20 - v19) >> 2;
      uint64_t v23 = (uint64_t)a1[5];
      if (v22 <= (v23 - (uint64_t)v18) >> 2)
      {
        uint64_t v26 = a1 + 4;
        unint64_t v27 = (char *)a1[4];
        unint64_t v28 = (v27 - v18) >> 2;
        if (v28 < v22)
        {
          uint64_t v29 = &v19[4 * v28];
          if (v27 != v18)
          {
            memmove(v18, v19, v27 - v18);
            long long v18 = (char *)*v26;
          }
          size_t v21 = v20 - v29;
          if (v20 == v29) {
            goto LABEL_38;
          }
          long long v30 = v18;
          uint64_t v31 = v29;
          goto LABEL_37;
        }
LABEL_35:
        if (v20 == v19)
        {
LABEL_38:
          void *v26 = &v18[v21];
          return a1;
        }
        long long v30 = v18;
        uint64_t v31 = v19;
LABEL_37:
        memmove(v30, v31, v21);
        goto LABEL_38;
      }
      if (v18)
      {
        a1[4] = v18;
        operator delete(v18);
        uint64_t v23 = 0;
        a1[3] = 0;
        a1[4] = 0;
        a1[5] = 0;
      }
      if ((v21 & 0x8000000000000000) == 0)
      {
        uint64_t v24 = v23 >> 1;
        if (v23 >> 1 <= v22) {
          uint64_t v24 = (v20 - v19) >> 2;
        }
        if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v25 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v25 = v24;
        }
        std::vector<unsigned int>::__vallocate[abi:nn180100](a1 + 3, v25);
        uint64_t v26 = a1 + 4;
        long long v18 = (char *)a1[4];
        goto LABEL_35;
      }
LABEL_40:
      abort();
    }
    uint64_t v15 = v9;
    long long v16 = v4;
LABEL_19:
    memmove(v15, v16, v6);
    goto LABEL_20;
  }
  return a1;
}

void TI::CP::ContinuousPathTestResult::~ContinuousPathTestResult(TI::CP::ContinuousPathTestResult *this)
{
  std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::destroy(*((void **)this + 23));
  unint64_t v2 = (void **)((char *)this + 112);
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v2);
  unint64_t v2 = (void **)((char *)this + 88);
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v2);
  unint64_t v2 = (void **)((char *)this + 64);
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v2);
  unint64_t v2 = (void **)((char *)this + 40);
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v2);
  KB::String::~String((TI::CP::ContinuousPathTestResult *)((char *)this + 8));
}

id TI::CP::CPTestCaseEval::create_results_dictionary(TI::CP::CPTestCaseEval *this, const TI::CP::ContinuousPathTestResult *a2, unsigned int a3)
{
  v47[5] = *MEMORY[0x263EF8340];
  id v43 = [MEMORY[0x263EFF9A0] dictionary];
  int64_t v6 = (const char *)*((void *)a2 + 2);
  if (!v6) {
    int64_t v6 = (char *)a2 + 24;
  }
  if (*((_WORD *)a2 + 4)) {
    unint64_t v7 = v6;
  }
  else {
    unint64_t v7 = "";
  }
  uint64_t v8 = [NSString stringWithUTF8String:v7];
  [v43 setObject:v8 forKeyedSubscript:@"expected_word"];

  uint64_t v9 = [NSNumber numberWithInt:*((unsigned int *)a2 + 36)];
  [v43 setObject:v9 forKeyedSubscript:@"matched_indx"];

  unint64_t v10 = [NSNumber numberWithUnsignedInt:*(unsigned int *)a2];
  [v43 setObject:v10 forKeyedSubscript:@"test_index"];

  uint64_t v11 = [NSNumber numberWithBool:*((unsigned __int8 *)a2 + 216)];
  [v43 setObject:v11 forKeyedSubscript:@"in_lexicon"];

  unint64_t v12 = [NSNumber numberWithUnsignedInt:*((unsigned int *)a2 + 56)];
  [v43 setObject:v12 forKeyedSubscript:@"sources_used"];

  uint64_t v44 = [MEMORY[0x263EFF980] array];
  uint64_t v13 = a3;
  if (0x1CAC083126E978D5 * ((uint64_t)(*((void *)a2 + 6) - *((void *)a2 + 5)) >> 3) < (unint64_t)a3) {
    uint64_t v13 = 0x1CAC083126E978D5 * ((uint64_t)(*((void *)a2 + 6) - *((void *)a2 + 5)) >> 3);
  }
  if (v13)
  {
    uint64_t v14 = 0;
    uint64_t v15 = 1000 * v13;
    do
    {
      uint64_t v16 = *((void *)a2 + 5);
      int v17 = (void *)(v16 + v14);
      long long v18 = NSString;
      uint64_t v19 = TILocaleIdentifierForLexiconID();
      if (v19) {
        unint64_t v20 = (const char *)v19;
      }
      else {
        unint64_t v20 = "UNK";
      }
      size_t v21 = [v18 stringWithUTF8String:v20];
      v46[0] = @"cand";
      KB::Candidate::capitalized_string(v45, (KB::Candidate *)(v16 + v14));
      uint64_t v23 = KB::ns_string((KB *)v45, v22);
      v47[0] = v23;
      v47[1] = v21;
      v46[1] = @"lexicon";
      v46[2] = @"token_id";
      if (*v17) {
        uint64_t v24 = *(unsigned int *)(*(void *)(v16 + v14 + 8) + 240 * *v17 - 100);
      }
      else {
        uint64_t v24 = 0;
      }
      unint64_t v25 = [NSNumber numberWithUnsignedInt:v24];
      v47[2] = v25;
      v46[3] = @"score_info";
      uint64_t v26 = v16 + v14;
      unint64_t v27 = *(void **)(v16 + v14 + 984);
      unint64_t v28 = v27;
      if (!v27)
      {
        CFTypeRef v3 = [MEMORY[0x263EFF9D0] null];
        unint64_t v28 = v3;
      }
      v47[3] = v28;
      v46[4] = @"final_prob";
      uint64_t v29 = NSNumber;
      *(float *)&double v30 = expf(*(float *)(v26 + 744));
      uint64_t v31 = [v29 numberWithFloat:v30];
      v47[4] = v31;
      uint64_t v32 = [NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:5];

      if (!v27) {
      KB::String::~String((KB::String *)v45);
      }
      [v44 addObject:v32];

      v14 += 1000;
    }
    while (v15 != v14);
  }
  [v43 setObject:v44 forKeyedSubscript:@"candidates_info"];
  if (*((void *)a2 + 24))
  {
    float v33 = [MEMORY[0x263EFF9A0] dictionary];
    float v34 = v33;
    BOOL v35 = (const TI::CP::ContinuousPathTestResult *)*((void *)a2 + 22);
    if (v35 != (const TI::CP::ContinuousPathTestResult *)((char *)a2 + 184))
    {
      do
      {
        unint64_t v36 = TI::CP::CPTestCaseEval::serialize_path(v33, (const TI::CP::ContinuousPathTestResult *)((char *)v35 + 64));
        size_t v38 = KB::ns_string((const TI::CP::ContinuousPathTestResult *)((char *)v35 + 32), v37);
        [(TI::CP::CPTestCaseEval *)v34 setObject:v36 forKey:v38];

        uint64_t v39 = (const TI::CP::ContinuousPathTestResult *)*((void *)v35 + 1);
        if (v39)
        {
          do
          {
            id v40 = v39;
            uint64_t v39 = *(const TI::CP::ContinuousPathTestResult **)v39;
          }
          while (v39);
        }
        else
        {
          do
          {
            id v40 = (const TI::CP::ContinuousPathTestResult *)*((void *)v35 + 2);
            BOOL v41 = *(void *)v40 == (void)v35;
            BOOL v35 = v40;
          }
          while (!v41);
        }
        BOOL v35 = v40;
      }
      while (v40 != (const TI::CP::ContinuousPathTestResult *)((char *)a2 + 184));
    }
    [v43 setObject:v34 forKeyedSubscript:@"resampled_paths"];
  }
  return v43;
}

void sub_23F00A740(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,std::vector<TI::CP::ContinuousPathTestResult>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<TI::CP::ContinuousPathTestResult>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<TI::CP::ContinuousPathTestResult>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<TI::CP::ContinuousPathTestResult>>>>::__hash_table(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a2 = 0;
  *(void *)uint64_t result = v2;
  *(void *)(result + 8) = a2[1];
  a2[1] = 0;
  uint64_t v5 = a2[2];
  CFTypeRef v3 = a2 + 2;
  uint64_t v4 = v5;
  *(void *)(result + 16) = v5;
  uint64_t v6 = v3[1];
  *(void *)(result + 24) = v6;
  *(_DWORD *)(result + 32) = *((_DWORD *)v3 + 4);
  if (v6)
  {
    unint64_t v7 = *(void *)(v4 + 8);
    unint64_t v8 = *(void *)(result + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8) {
        v7 %= v8;
      }
    }
    else
    {
      v7 &= v8 - 1;
    }
    *(void *)(v2 + 8 * v7) = result + 16;
    *CFTypeRef v3 = 0;
    v3[1] = 0;
  }
  return result;
}

id TI::CP::CPTestCaseEval::serialize_path(TI::CP::CPTestCaseEval *this, const TI::CP::Path *a2)
{
  v16[5] = *MEMORY[0x263EF8340];
  CFTypeRef v3 = (void *)((char *)a2 + 8);
  id v14 = [MEMORY[0x263EFF980] arrayWithCapacity:0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a2 + 1) - *(void *)a2) >> 4)];
  uint64_t v4 = *(void *)a2;
  if (*v3 != *(void *)a2)
  {
    unint64_t v5 = 0;
    do
    {
      uint64_t v6 = (double *)(v4 + 48 * v5);
      v15[0] = @"x";
      unint64_t v7 = objc_msgSend(NSNumber, "numberWithDouble:", *v6, v14, @"x");
      v16[0] = v7;
      v15[1] = @"y";
      unint64_t v8 = [NSNumber numberWithDouble:v6[1]];
      v16[1] = v8;
      v15[2] = @"force";
      uint64_t v9 = [NSNumber numberWithDouble:*(double *)(v4 + 48 * v5 + 24)];
      v16[2] = v9;
      v15[3] = @"t";
      unint64_t v10 = [NSNumber numberWithDouble:*(double *)(v4 + 48 * v5 + 16)];
      v16[3] = v10;
      v15[4] = @"inflection";
      uint64_t v11 = [NSNumber numberWithBool:TI::CP::Path::is_inflection_point(a2)];
      v16[4] = v11;
      unint64_t v12 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:5];

      [v14 addObject:v12];
      ++v5;
      uint64_t v4 = *(void *)a2;
    }
    while (v5 < 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a2 + 1) - *(void *)a2) >> 4));
  }
  return v14;
}

void sub_23F00AAA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void std::vector<KB::Candidate>::__vdeallocate(void **a1)
{
  uint64_t v1 = *a1;
  if (*a1)
  {
    uint64_t v3 = (uint64_t)a1[1];
    uint64_t v4 = v1;
    if ((void *)v3 != v1)
    {
      do
        uint64_t v3 = MEMORY[0x2455C2430](v3 - 1000);
      while ((void *)v3 != v1);
      uint64_t v4 = *a1;
    }
    a1[1] = v1;
    operator delete(v4);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

char *std::vector<TI::CP::ContinuousPathTestResult>::__vallocate[abi:nn180100](void *a1, unint64_t a2)
{
  if (a2 >= 0x11A7B9611A7B962) {
    abort();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<TI::CP::ContinuousPathTestResult>>(a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[232 * v4];
  return result;
}

TI::CP::ContinuousPathTestResult *std::vector<TI::CP::ContinuousPathTestResult>::__construct_at_end<TI::CP::ContinuousPathTestResult*,TI::CP::ContinuousPathTestResult*>(TI::CP::ContinuousPathTestResult *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = result;
  uint64_t v4 = *((void *)result + 1);
  if (a2 != a3)
  {
    uint64_t v7 = 0;
    do
    {
      uint64_t result = TI::CP::ContinuousPathTestResult::ContinuousPathTestResult((TI::CP::ContinuousPathTestResult *)(v4 + v7), (const TI::CP::ContinuousPathTestResult *)(a2 + v7));
      v7 += 232;
    }
    while (a2 + v7 != a3);
    v4 += v7;
  }
  *((void *)v3 + 1) = v4;
  return result;
}

void sub_23F00AC2C(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void TI::CP::CPTestCaseEval::evaluate_recognizers_on_tests(uint64_t a1@<X0>, _DWORD *a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, void *a5@<X5>, int a6@<W6>, TI::CP::TestResultsSummarizer **a7@<X8>)
{
  uint64_t v223 = *MEMORY[0x263EF8340];
  v104 = a5;
  int64x2_t v166 = 0uLL;
  unint64_t v167 = 0;
  char v11 = *(unsigned char *)(a1 + 8);
  char v12 = *(unsigned char *)(a1 + 280);
  *(_OWORD *)v142 = 0u;
  memset(v143, 0, sizeof(v143));
  *(_OWORD *)v144 = 0u;
  memset(v145, 0, sizeof(v145));
  uint64_t v150 = 0;
  uint64_t v148 = 0;
  uint64_t v149 = 0;
  long long v152 = 0u;
  long long v153 = 0u;
  long long v154 = 0u;
  uint64_t v155 = 0;
  int v156 = 1065353216;
  long long v160 = 0u;
  long long v159 = 0u;
  long long v158 = 0u;
  long long v157 = 0u;
  uint64_t v161 = 0;
  unint64_t v162 = 0xC010000000000000;
  uint64_t v163 = 0x4008000000000000;
  uint64_t v164 = 0;
  int v165 = 0;
  char v146 = v11;
  char v151 = v12;
  char v147 = 0;
  memset(v121, 0, sizeof(v121));
  uint64_t v126 = 0;
  uint64_t v124 = 0;
  uint64_t v125 = 0;
  long long v128 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  uint64_t v131 = 0;
  int v132 = 1065353216;
  long long v133 = 0u;
  long long v134 = 0u;
  long long v135 = 0u;
  long long v136 = 0u;
  uint64_t v137 = 0;
  unint64_t v138 = 0xC010000000000000;
  uint64_t v139 = 0x4008000000000000;
  uint64_t v140 = 0;
  int v141 = 0;
  char v122 = v11;
  char v127 = v12;
  char v123 = 0;
  int v109 = a2;
  if (*a2 == 1) {
    TI::CP::CPEval::create_favonius((TI::CP::CPEval *)a1, v104);
  }
  int v105 = 0;
  if (*a2) {
    goto LABEL_146;
  }
  long long v13 = *(_OWORD *)(a4 + 80);
  v215[4] = *(_OWORD *)(a4 + 64);
  v215[5] = v13;
  uint64_t v216 = *(void *)(a4 + 96);
  long long v14 = *(_OWORD *)(a4 + 16);
  v215[0] = *(_OWORD *)a4;
  v215[1] = v14;
  long long v15 = *(_OWORD *)(a4 + 32);
  v215[3] = *(_OWORD *)(a4 + 48);
  v215[2] = v15;
  uint64_t v16 = (_OWORD *)(a4 + 104);
  if (*(char *)(a4 + 127) < 0)
  {
    std::string::__init_copy_ctor_external(&v217, *(const std::string::value_type **)(a4 + 104), *(void *)(a4 + 112));
  }
  else
  {
    *(_OWORD *)&v217.__r_.__value_.__l.__data_ = *v16;
    v217.__r_.__value_.__r.__words[2] = *(void *)(a4 + 120);
  }
  int v17 = (_OWORD *)(a4 + 128);
  if (*(char *)(a4 + 151) < 0)
  {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(a4 + 128), *(void *)(a4 + 136));
  }
  else
  {
    *(_OWORD *)&__p.__r_.__value_.__l.__data_ = *v17;
    __p.__r_.__value_.__r.__words[2] = *(void *)(a4 + 144);
  }
  __int16 v219 = *(_WORD *)(a4 + 152);
  char v220 = *(unsigned char *)(a4 + 154);
  MEMORY[0x2455C23B0](v221, a4 + 160);
  long long v18 = *(_OWORD *)(a4 + 336);
  v221[10] = *(_OWORD *)(a4 + 320);
  v221[11] = v18;
  uint64_t v222 = *(void *)(a4 + 352);
  long long v19 = *(_OWORD *)(a4 + 272);
  v221[6] = *(_OWORD *)(a4 + 256);
  v221[7] = v19;
  long long v20 = *(_OWORD *)(a4 + 288);
  v221[9] = *(_OWORD *)(a4 + 304);
  v221[8] = v20;
  long long v21 = *(_OWORD *)(a4 + 208);
  v221[2] = *(_OWORD *)(a4 + 192);
  v221[3] = v21;
  long long v22 = *(_OWORD *)(a4 + 224);
  v221[5] = *(_OWORD *)(a4 + 240);
  v221[4] = v22;
  TI::CP::CPEval::create_recognizer_for_config((const std::string *)a1, a3, (uint64_t)v215, v206);
  v108 = (const void **)v206[0];
  KB::String::~String((KB::String *)v221);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v217.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v217.__r_.__value_.__l.__data_);
  }
  if (a6 == 4)
  {
    int v105 = 0;
  }
  else
  {
    long long v23 = *(_OWORD *)(a4 + 80);
    v207[4] = *(_OWORD *)(a4 + 64);
    v207[5] = v23;
    uint64_t v208 = *(void *)(a4 + 96);
    long long v24 = *(_OWORD *)(a4 + 16);
    v207[0] = *(_OWORD *)a4;
    v207[1] = v24;
    long long v25 = *(_OWORD *)(a4 + 32);
    v207[3] = *(_OWORD *)(a4 + 48);
    v207[2] = v25;
    if (*(char *)(a4 + 127) < 0)
    {
      std::string::__init_copy_ctor_external(&v209, *(const std::string::value_type **)(a4 + 104), *(void *)(a4 + 112));
    }
    else
    {
      *(_OWORD *)&v209.__r_.__value_.__l.__data_ = *v16;
      v209.__r_.__value_.__r.__words[2] = *(void *)(a4 + 120);
    }
    if (*(char *)(a4 + 151) < 0)
    {
      std::string::__init_copy_ctor_external(&v210, *(const std::string::value_type **)(a4 + 128), *(void *)(a4 + 136));
    }
    else
    {
      *(_OWORD *)&v210.__r_.__value_.__l.__data_ = *v17;
      v210.__r_.__value_.__r.__words[2] = *(void *)(a4 + 144);
    }
    __int16 v211 = *(_WORD *)(a4 + 152);
    char v212 = *(unsigned char *)(a4 + 154);
    MEMORY[0x2455C23B0](v213, a4 + 160);
    long long v26 = *(_OWORD *)(a4 + 336);
    v213[10] = *(_OWORD *)(a4 + 320);
    v213[11] = v26;
    uint64_t v214 = *(void *)(a4 + 352);
    long long v27 = *(_OWORD *)(a4 + 272);
    v213[6] = *(_OWORD *)(a4 + 256);
    v213[7] = v27;
    long long v28 = *(_OWORD *)(a4 + 288);
    v213[9] = *(_OWORD *)(a4 + 304);
    v213[8] = v28;
    long long v29 = *(_OWORD *)(a4 + 208);
    v213[2] = *(_OWORD *)(a4 + 192);
    v213[3] = v29;
    long long v30 = *(_OWORD *)(a4 + 224);
    v213[5] = *(_OWORD *)(a4 + 240);
    v213[4] = v30;
    TI::CP::CPEval::create_recognizer_for_config((const std::string *)a1, a6, (uint64_t)v207, v206);
    int v105 = (TI::CP::TIPathRecognizerInterface *)v206[0];
    KB::String::~String((KB::String *)v213);
    if (SHIBYTE(v210.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v210.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v209.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v209.__r_.__value_.__l.__data_);
    }
  }
  if (!v108)
  {
LABEL_146:
    TI::CP::TestResultsSummarizer::TestResultsSummarizer((TI::CP::TestResultsSummarizer *)v206, (const TI::CP::TestResultsSummarizer *)v142);
    *a7 = 0;
    a7[1] = 0;
    a7[2] = 0;
    long long v100 = (TI::CP::TestResultsSummarizer *)operator new(0x138uLL);
    *a7 = v100;
    a7[1] = v100;
    uint64_t v101 = (TI::CP::TestResultsSummarizer *)((char *)v100 + 312);
    a7[2] = (TI::CP::TestResultsSummarizer *)((char *)v100 + 312);
    TI::CP::TestResultsSummarizer::TestResultsSummarizer(v100, (const TI::CP::TestResultsSummarizer *)v206);
    a7[1] = v101;
    TI::CP::TestResultsSummarizer::~TestResultsSummarizer((TI::CP::TestResultsSummarizer *)v206);
    v108 = 0;
    goto LABEL_154;
  }
  printf("Running test case ");
  [*(id *)(a1 + 192) reset];
  uint64_t v103 = a7;
  uint64_t v31 = [*(id *)(a1 + 192) getNextTestCase];
  int v106 = 0;
  char v116 = 0;
  uint64_t v32 = 0;
  int v113 = 0;
  int64x2_t v114 = vdupq_n_s64(0xFFF0000000000000);
LABEL_28:
  if ((v116 & 1) == 0 && v31)
  {
    context = (void *)MEMORY[0x2455C2B00]();
    ++v113;
    HIDWORD(v33) = -1030792151 * v113;
    LODWORD(v33) = -1030792151 * v113;
    if ((v33 >> 1) <= 0x51EB851)
    {
      printf("%u...", v113);
      fflush((FILE *)*MEMORY[0x263EF8358]);
    }
    float v34 = [v31 intendedText];
    BOOL v35 = [v34 length] == 0;

    if (!v35)
    {
      uint64_t v36 = +[TTKTestCase convertToIsolatedWordMode:v31];
      if (!v36)
      {
        id v94 = [v31 intendedText];
        uint64_t v95 = (const char *)[v94 UTF8String];
        uint64_t v96 = [v31 metadata];
        id v97 = [v96 objectForKey:@"recordIdentifier"];
        printf("\nUnexpected failure [#%u] converting to isolated word mode for record %u, string = <%s>, id=<%s>\n", ++v106, v113, v95, (const char *)[v97 UTF8String]);

        [*(id *)(a1 + 192) getNextTestCase];
        char v116 = 0;
        uint64_t v31 = v115 = v31;
        goto LABEL_143;
      }
      unint64_t v37 = (void *)v36;

      uint64_t v31 = v37;
    }
    long long v110 = v31;
    if (*(void *)(a1 + 200))
    {
      v115 = [MEMORY[0x263EFF980] array];
    }
    else
    {
      v115 = 0;
    }
    long long v119 = 0u;
    long long v120 = 0u;
    long long v117 = 0u;
    long long v118 = 0u;
    size_t v38 = [v31 records];
    uint64_t v39 = [v38 countByEnumeratingWithState:&v117 objects:v205 count:16];
    if (!v39)
    {
      char v116 = 0;
      goto LABEL_138;
    }
    char v116 = 0;
    uint64_t v40 = *(void *)v118;
    while (1)
    {
      uint64_t v41 = 0;
      uint64_t v42 = v32;
      do
      {
        if (*(void *)v118 != v40) {
          objc_enumerationMutation(v38);
        }
        id v43 = *(TTKTestCaseRecord **)(*((void *)&v117 + 1) + 8 * v41);
        uint64_t v44 = (void *)MEMORY[0x2455C2B00]();
        int v45 = *(_DWORD *)(a1 + 292);
        if ((v45 & 0x80000000) == 0 && (int)v42 > v45)
        {
          int v46 = 4;
          char v116 = 1;
LABEL_46:
          uint64_t v32 = v42;
          goto LABEL_52;
        }
        if ((int)v42 < *(_DWORD *)(a1 + 288))
        {
          uint64_t v32 = (v42 + 1);
LABEL_51:
          int v46 = 5;
          goto LABEL_52;
        }
        long long v47 = [(TTKTestCaseRecord *)v43 touchDataCollection];
        BOOL v48 = [v47 count] == 0;

        if (v48)
        {
          int v46 = 5;
          goto LABEL_46;
        }
        uint64_t v32 = (v42 + 1);
        if (((int)v42 - *(_DWORD *)(a1 + 288)) % *(_DWORD *)(a1 + 296)) {
          goto LABEL_51;
        }
        TI::CP::TTKTestCaseConverter::convert(*(TI::CP::TTKTestCaseConverter **)(a1 + 184), v43, (uint64_t)v206);
        KB::String::String((KB::String *)v195);
        int v198 = 0;
        memset(v196, 0, sizeof(v196));
        memset(v197, 0, sizeof(v197));
        v202 = 0;
        uint64_t v203 = 0;
        v201 = (uint64_t *)&v202;
        v204[0] = v114;
        *(__int32 *)((char *)v204[1].i32 + 1) = 0;
        unint64_t v49 = (TI::CP::CPTestCaseEval *)KB::String::String((KB::String *)v184);
        int v187 = 0;
        memset(v185, 0, sizeof(v185));
        memset(v186, 0, sizeof(v186));
        v191 = 0;
        uint64_t v192 = 0;
        v190 = (uint64_t *)&v191;
        v193[0] = v114;
        *(__int32 *)((char *)v193[1].i32 + 1) = 0;
        if (*v109 == 1)
        {
          TI::CP::CPEval::evaluate_test_case_favonius((TI::CP::CPEval *)a1, (const TI::CP::ContinuousPathTestCase *)v206, 0, v42, (uint64_t)&v169);
          int v194 = (int)v169;
          KB::String::operator=();
          KB::CandidateCollection::operator=((uint64_t)v196, (uint64_t)v173);
          long long v199 = v177;
          long long v200 = v178;
          std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::destroy(v202);
          uint64_t v51 = v180;
          v201 = v179;
          v202 = v180;
          uint64_t v203 = v181;
          if (v181)
          {
            v180[2] = &v202;
            uint64_t v51 = 0;
            v179 = (uint64_t *)&v180;
            v180 = 0;
            uint64_t v181 = 0;
          }
          else
          {
            v201 = (uint64_t *)&v202;
          }
          v204[0] = v182[0];
          *(int64x2_t *)((char *)v204 + 12) = *(int64x2_t *)((char *)v182 + 12);
          std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::destroy(v51);
          v168 = (void ***)v176;
          std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v168);
          v168 = (void ***)v175;
          std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v168);
          v168 = (void ***)v174;
          std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v168);
          v168 = (void ***)v173;
          std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v168);
          char v53 = (KB::String *)&v170;
        }
        else
        {
          if (*v109) {
            goto LABEL_74;
          }
          TI::CP::CPEval::evaluate_test_case((TI::CP::CPEval *)a1, (const TI::CP::ContinuousPathTestCase *)v206, (TI::CP::TIPathRecognizerInterface *)v108, v42, (uint64_t)&v169);
          int v194 = (int)v169;
          KB::String::operator=();
          KB::CandidateCollection::operator=((uint64_t)v196, (uint64_t)v173);
          long long v199 = v177;
          long long v200 = v178;
          std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::destroy(v202);
          id v50 = v180;
          v201 = v179;
          v202 = v180;
          uint64_t v203 = v181;
          if (v181)
          {
            v180[2] = &v202;
            id v50 = 0;
            v179 = (uint64_t *)&v180;
            v180 = 0;
            uint64_t v181 = 0;
          }
          else
          {
            v201 = (uint64_t *)&v202;
          }
          v204[0] = v182[0];
          *(int64x2_t *)((char *)v204 + 12) = *(int64x2_t *)((char *)v182 + 12);
          std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::destroy(v50);
          v168 = (void ***)v176;
          std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v168);
          v168 = (void ***)v175;
          std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v168);
          v168 = (void ***)v174;
          std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v168);
          v168 = (void ***)v173;
          std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v168);
          KB::String::~String((KB::String *)&v170);
          if (a6 != 4)
          {
            TI::CP::CPEval::evaluate_test_case((TI::CP::CPEval *)a1, (const TI::CP::ContinuousPathTestCase *)v206, v105, v42, (uint64_t)&v169);
            LODWORD(v183) = v169;
            KB::String::operator=();
            KB::CandidateCollection::operator=((uint64_t)v185, (uint64_t)v173);
            long long v188 = v177;
            long long v189 = v178;
            std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::destroy(v191);
            unint64_t v52 = v180;
            v190 = v179;
            v191 = v180;
            uint64_t v192 = v181;
            if (v181)
            {
              v180[2] = &v191;
              unint64_t v52 = 0;
              v179 = (uint64_t *)&v180;
              v180 = 0;
              uint64_t v181 = 0;
            }
            else
            {
              v190 = (uint64_t *)&v191;
            }
            v193[0] = v182[0];
            *(int64x2_t *)((char *)v193 + 12) = *(int64x2_t *)((char *)v182 + 12);
            std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::destroy(v52);
            v168 = (void ***)v176;
            std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v168);
            v168 = (void ***)v175;
            std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v168);
            v168 = (void ***)v174;
            std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v168);
            v168 = (void ***)v173;
            std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v168);
            KB::String::~String((KB::String *)&v170);
          }
          if (a3) {
            goto LABEL_74;
          }
          MEMORY[0x2455C23A0](&v169, "favonius");
          v168 = &v169;
          uint64_t v54 = std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::__emplace_unique_key_args<KB::String,std::piecewise_construct_t const&,std::tuple<KB::String const&>,std::tuple<>>(&v201, (uint64_t)&v169, &v168);
          TI::CP::Path::operator=((void **)v54 + 8, v108 + 7);
          char v53 = (KB::String *)&v169;
        }
        KB::String::~String(v53);
LABEL_74:
        if (*(void *)(a1 + 200) && ((v199 & 0x80000000) != 0 || (int)v199 >= *(_DWORD *)(a1 + 284)))
        {
          long long v55 = TI::CP::CPTestCaseEval::create_results_dictionary(v49, (const TI::CP::ContinuousPathTestResult *)&v194, 0x28u);
          [(TTKTestCaseRecord *)v43 setAnnotation:v55 forKey:@"cpEvalResults"];
          [v115 addObject:v43];
        }
        TI::CP::TestResultsSummarizer::add_result((TI::CP::TestResultsSummarizer *)v142, (const TI::CP::ContinuousPathTestResult *)&v194);
        if (a6 != 4) {
          TI::CP::TestResultsSummarizer::add_result((TI::CP::TestResultsSummarizer *)v121, (const TI::CP::ContinuousPathTestResult *)&v183);
        }
        if (!v199)
        {
          if (v188 == -1)
          {
            uint64_t v58 = *(void *)&v143[1];
            if (*(void *)&v143[1] >= *((void *)&v143[1] + 1))
            {
              uint64_t v66 = 0x34F72C234F72C235 * ((uint64_t)(*(void *)&v143[1] - *((void *)&v143[0] + 1)) >> 3);
              unint64_t v67 = v66 + 1;
              if ((unint64_t)(v66 + 1) > 0x11A7B9611A7B961) {
                goto LABEL_159;
              }
              if (0x69EE58469EE5846ALL * ((uint64_t)(*((void *)&v143[1] + 1) - *((void *)&v143[0] + 1)) >> 3) > v67) {
                unint64_t v67 = 0x69EE58469EE5846ALL * ((uint64_t)(*((void *)&v143[1] + 1) - *((void *)&v143[0] + 1)) >> 3);
              }
              if ((unint64_t)(0x34F72C234F72C235
                                    * ((uint64_t)(*((void *)&v143[1] + 1) - *((void *)&v143[0] + 1)) >> 3)) >= 0x8D3DCB08D3DCB0)
                unint64_t v68 = 0x11A7B9611A7B961;
              else {
                unint64_t v68 = v67;
              }
              v172 = (_OWORD *)((char *)&v143[1] + 8);
              if (v68) {
                unint64_t v68 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<TI::CP::ContinuousPathTestResult>>(v68);
              }
              else {
                uint64_t v69 = 0;
              }
              v169 = (void **)v68;
              v170.i64[0] = v68 + 232 * v66;
              v170.i64[1] = v170.i64[0];
              unint64_t v171 = v68 + 232 * v69;
              TI::CP::ContinuousPathTestResult::ContinuousPathTestResult((TI::CP::ContinuousPathTestResult *)v170.i64[0], (const TI::CP::ContinuousPathTestResult *)&v194);
              uint64_t v79 = v170.i64[0];
              uint64_t v59 = v170.i64[1] + 232;
              v170.i64[1] += 232;
              uint64_t v80 = *(void *)&v143[1];
              uint64_t v81 = *((void *)&v143[0] + 1);
              if (*(void *)&v143[1] == *((void *)&v143[0] + 1))
              {
                int64x2_t v82 = vdupq_n_s64(*(unint64_t *)&v143[1]);
              }
              else
              {
                do
                {
                  v80 -= 232;
                  uint64_t v79 = std::construct_at[abi:nn180100]<TI::CP::ContinuousPathTestResult,TI::CP::ContinuousPathTestResult,TI::CP::ContinuousPathTestResult*>(v79 - 232, v80);
                }
                while (v80 != v81);
                int64x2_t v82 = *(int64x2_t *)((char *)v143 + 8);
                uint64_t v59 = v170.i64[1];
              }
              *((void *)&v143[0] + 1) = v79;
              *(void *)&v143[1] = v59;
              int64x2_t v170 = v82;
              unint64_t v83 = *((void *)&v143[1] + 1);
              *((void *)&v143[1] + 1) = v171;
              unint64_t v171 = v83;
              v169 = (void **)v82.i64[0];
              std::__split_buffer<TI::CP::ContinuousPathTestResult>::~__split_buffer((uint64_t)&v169);
            }
            else
            {
              TI::CP::ContinuousPathTestResult::ContinuousPathTestResult(*(TI::CP::ContinuousPathTestResult **)&v143[1], (const TI::CP::ContinuousPathTestResult *)&v194);
              uint64_t v59 = v58 + 232;
            }
            *(void *)&v143[1] = v59;
          }
          else if ((int)v188 < 1)
          {
            long long v60 = v144[1];
            if (v144[1] >= (TI::CP::ContinuousPathTestResult *)*(void *)&v145[0])
            {
              uint64_t v70 = 0x34F72C234F72C235 * ((v144[1] - v144[0]) >> 3);
              unint64_t v71 = v70 + 1;
              if ((unint64_t)(v70 + 1) > 0x11A7B9611A7B961) {
LABEL_159:
              }
                abort();
              if (0x69EE58469EE5846ALL * ((uint64_t)(*(void *)&v145[0] - (unint64_t)v144[0]) >> 3) > v71) {
                unint64_t v71 = 0x69EE58469EE5846ALL * ((uint64_t)(*(void *)&v145[0] - (unint64_t)v144[0]) >> 3);
              }
              if ((unint64_t)(0x34F72C234F72C235
                                    * ((uint64_t)(*(void *)&v145[0] - (unint64_t)v144[0]) >> 3)) >= 0x8D3DCB08D3DCB0)
                unint64_t v72 = 0x11A7B9611A7B961;
              else {
                unint64_t v72 = v71;
              }
              v172 = v145;
              if (v72) {
                unint64_t v72 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<TI::CP::ContinuousPathTestResult>>(v72);
              }
              else {
                uint64_t v73 = 0;
              }
              v169 = (void **)v72;
              v170.i64[0] = v72 + 232 * v70;
              v170.i64[1] = v170.i64[0];
              unint64_t v171 = v72 + 232 * v73;
              TI::CP::ContinuousPathTestResult::ContinuousPathTestResult((TI::CP::ContinuousPathTestResult *)v170.i64[0], (const TI::CP::ContinuousPathTestResult *)&v194);
              int v84 = (TI::CP::ContinuousPathTestResult *)v170.i64[0];
              long long v61 = (TI::CP::ContinuousPathTestResult *)(v170.i64[1] + 232);
              v170.i64[1] += 232;
              long long v85 = v144[1];
              long long v86 = v144[0];
              if (v144[1] == v144[0])
              {
                int64x2_t v87 = vdupq_n_s64((unint64_t)v144[1]);
              }
              else
              {
                do
                {
                  long long v85 = (TI::CP::ContinuousPathTestResult *)((char *)v85 - 232);
                  int v84 = (TI::CP::ContinuousPathTestResult *)std::construct_at[abi:nn180100]<TI::CP::ContinuousPathTestResult,TI::CP::ContinuousPathTestResult,TI::CP::ContinuousPathTestResult*>((uint64_t)v84 - 232, (uint64_t)v85);
                }
                while (v85 != v86);
                int64x2_t v87 = *(int64x2_t *)v144;
                long long v61 = (TI::CP::ContinuousPathTestResult *)v170.i64[1];
              }
              v144[0] = v84;
              v144[1] = v61;
              int64x2_t v170 = v87;
              unint64_t v88 = *(void *)&v145[0];
              *(void *)&v145[0] = v171;
              unint64_t v171 = v88;
              v169 = (void **)v87.i64[0];
              std::__split_buffer<TI::CP::ContinuousPathTestResult>::~__split_buffer((uint64_t)&v169);
            }
            else
            {
              TI::CP::ContinuousPathTestResult::ContinuousPathTestResult(v144[1], (const TI::CP::ContinuousPathTestResult *)&v194);
              long long v61 = (TI::CP::ContinuousPathTestResult *)((char *)v60 + 232);
            }
            v144[1] = v61;
          }
          else
          {
            long long v56 = v142[1];
            if (v142[1] >= (TI::CP::ContinuousPathTestResult *)*(void *)&v143[0])
            {
              uint64_t v62 = 0x34F72C234F72C235 * ((v142[1] - v142[0]) >> 3);
              unint64_t v63 = v62 + 1;
              if ((unint64_t)(v62 + 1) > 0x11A7B9611A7B961) {
                goto LABEL_159;
              }
              if (0x69EE58469EE5846ALL * ((uint64_t)(*(void *)&v143[0] - (unint64_t)v142[0]) >> 3) > v63) {
                unint64_t v63 = 0x69EE58469EE5846ALL * ((uint64_t)(*(void *)&v143[0] - (unint64_t)v142[0]) >> 3);
              }
              if ((unint64_t)(0x34F72C234F72C235
                                    * ((uint64_t)(*(void *)&v143[0] - (unint64_t)v142[0]) >> 3)) >= 0x8D3DCB08D3DCB0)
                unint64_t v64 = 0x11A7B9611A7B961;
              else {
                unint64_t v64 = v63;
              }
              v172 = v143;
              if (v64) {
                unint64_t v64 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<TI::CP::ContinuousPathTestResult>>(v64);
              }
              else {
                uint64_t v65 = 0;
              }
              v169 = (void **)v64;
              v170.i64[0] = v64 + 232 * v62;
              v170.i64[1] = v170.i64[0];
              unint64_t v171 = v64 + 232 * v65;
              TI::CP::ContinuousPathTestResult::ContinuousPathTestResult((TI::CP::ContinuousPathTestResult *)v170.i64[0], (const TI::CP::ContinuousPathTestResult *)&v194);
              long long v74 = (TI::CP::ContinuousPathTestResult *)v170.i64[0];
              long long v57 = (TI::CP::ContinuousPathTestResult *)(v170.i64[1] + 232);
              v170.i64[1] += 232;
              long long v75 = v142[1];
              long long v76 = v142[0];
              if (v142[1] == v142[0])
              {
                int64x2_t v77 = vdupq_n_s64((unint64_t)v142[1]);
              }
              else
              {
                do
                {
                  long long v75 = (TI::CP::ContinuousPathTestResult *)((char *)v75 - 232);
                  long long v74 = (TI::CP::ContinuousPathTestResult *)std::construct_at[abi:nn180100]<TI::CP::ContinuousPathTestResult,TI::CP::ContinuousPathTestResult,TI::CP::ContinuousPathTestResult*>((uint64_t)v74 - 232, (uint64_t)v75);
                }
                while (v75 != v76);
                int64x2_t v77 = *(int64x2_t *)v142;
                long long v57 = (TI::CP::ContinuousPathTestResult *)v170.i64[1];
              }
              v142[0] = v74;
              v142[1] = v57;
              int64x2_t v170 = v77;
              unint64_t v78 = *(void *)&v143[0];
              *(void *)&v143[0] = v171;
              unint64_t v171 = v78;
              v169 = (void **)v77.i64[0];
              std::__split_buffer<TI::CP::ContinuousPathTestResult>::~__split_buffer((uint64_t)&v169);
            }
            else
            {
              TI::CP::ContinuousPathTestResult::ContinuousPathTestResult(v142[1], (const TI::CP::ContinuousPathTestResult *)&v194);
              long long v57 = (TI::CP::ContinuousPathTestResult *)((char *)v56 + 232);
            }
            v142[1] = v57;
          }
        }
        std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::destroy(v191);
        v169 = (void **)&v186[1] + 1;
        std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v169);
        v169 = (void **)v186;
        std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v169);
        v169 = (void **)&v185[1] + 1;
        std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v169);
        v169 = (void **)v185;
        std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v169);
        KB::String::~String((KB::String *)v184);
        std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::destroy(v202);
        v183 = (void **)&v197[1] + 1;
        std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v183);
        v183 = (void **)v197;
        std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v183);
        v183 = (void **)&v196[1] + 1;
        std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v183);
        v183 = (void **)v196;
        std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v183);
        KB::String::~String((KB::String *)v195);
        TI::CP::ContinuousPathTestCase::~ContinuousPathTestCase((TI::CP::ContinuousPathTestCase *)v206);
        int v46 = 0;
LABEL_52:
        if (v46 != 5 && v46) {
          goto LABEL_138;
        }
        ++v41;
        uint64_t v42 = v32;
      }
      while (v41 != v39);
      uint64_t v89 = [v38 countByEnumeratingWithState:&v117 objects:v205 count:16];
      uint64_t v39 = v89;
      if (!v89)
      {
LABEL_138:

        long long v90 = v110;
        if (*(void *)(a1 + 200))
        {
          if ([v115 count])
          {
            int v91 = [TTKTestCase alloc];
            unint64_t v92 = [v110 metadata];
            uint64_t v93 = [(TTKTestCase *)v91 initWithMetadata:v92 records:v115];

            [*(id *)(a1 + 200) pushNextTestCase:v93];
            long long v90 = v110;
          }
        }
        uint64_t v31 = [*(id *)(a1 + 192) getNextTestCase];

LABEL_143:
        goto LABEL_28;
      }
    }
  }
  putchar(10);
  fflush((FILE *)*MEMORY[0x263EF8358]);
  uint64_t v98 = v166.i64[1];
  if (v166.i64[1] >= v167)
  {
    long long v99 = (TI::CP::TestResultsSummarizer *)std::vector<TI::CP::TestResultsSummarizer>::__push_back_slow_path<TI::CP::TestResultsSummarizer const&>(&v166, (const TI::CP::TestResultsSummarizer *)v142);
  }
  else
  {
    TI::CP::TestResultsSummarizer::TestResultsSummarizer((TI::CP::TestResultsSummarizer *)v166.i64[1], (const TI::CP::TestResultsSummarizer *)v142);
    long long v99 = (TI::CP::TestResultsSummarizer *)(v98 + 312);
  }
  v166.i64[1] = (uint64_t)v99;
  if (a6 != 4)
  {
    if ((unint64_t)v99 >= v167)
    {
      long long v99 = (TI::CP::TestResultsSummarizer *)std::vector<TI::CP::TestResultsSummarizer>::__push_back_slow_path<TI::CP::TestResultsSummarizer const&>(&v166, (const TI::CP::TestResultsSummarizer *)v121);
    }
    else
    {
      TI::CP::TestResultsSummarizer::TestResultsSummarizer(v99, (const TI::CP::TestResultsSummarizer *)v121);
      long long v99 = (TI::CP::TestResultsSummarizer *)((char *)v99 + 312);
    }
    v166.i64[1] = (uint64_t)v99;
  }
  unint64_t v102 = v167;
  *uint64_t v103 = (TI::CP::TestResultsSummarizer *)v166.i64[0];
  v103[1] = v99;
  v103[2] = (TI::CP::TestResultsSummarizer *)v102;
  unint64_t v167 = 0;
  int64x2_t v166 = 0uLL;

LABEL_154:
  if (v105) {
    (*(void (**)(TI::CP::TIPathRecognizerInterface *))(*(void *)v105 + 8))(v105);
  }
  if (v108) {
    (*((void (**)(const void **))*v108 + 1))(v108);
  }
  TI::CP::TestResultsSummarizer::~TestResultsSummarizer((TI::CP::TestResultsSummarizer *)v121);
  TI::CP::TestResultsSummarizer::~TestResultsSummarizer((TI::CP::TestResultsSummarizer *)v142);
  v142[0] = (TI::CP::ContinuousPathTestResult *)&v166;
  std::vector<TI::CP::TestResultsSummarizer>::__destroy_vector::operator()[abi:nn180100]((void ***)v142);
}

void sub_23F00C00C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  if (SLOBYTE(STACK[0x95F]) < 0) {
    operator delete((void *)STACK[0x948]);
  }
  if (a27) {
    (*(void (**)(uint64_t))(*(void *)a27 + 8))(a27);
  }
  TI::CP::TestResultsSummarizer::~TestResultsSummarizer((TI::CP::TestResultsSummarizer *)&a67);
  TI::CP::TestResultsSummarizer::~TestResultsSummarizer((TI::CP::TestResultsSummarizer *)&STACK[0x310]);
  STACK[0x310] = (unint64_t)&STACK[0x450];
  std::vector<TI::CP::TestResultsSummarizer>::__destroy_vector::operator()[abi:nn180100]((void ***)&STACK[0x310]);

  _Unwind_Resume(a1);
}

uint64_t std::vector<TI::CP::TestResultsSummarizer>::__push_back_slow_path<TI::CP::TestResultsSummarizer const&>(int64x2_t *a1, const TI::CP::TestResultsSummarizer *a2)
{
  uint64_t v2 = 0x6F96F96F96F96F97 * ((a1->i64[1] - a1->i64[0]) >> 3);
  unint64_t v3 = v2 + 1;
  if ((unint64_t)(v2 + 1) > 0xD20D20D20D20D2) {
    abort();
  }
  if (0xDF2DF2DF2DF2DF2ELL * ((a1[1].i64[0] - a1->i64[0]) >> 3) > v3) {
    unint64_t v3 = 0xDF2DF2DF2DF2DF2ELL * ((a1[1].i64[0] - a1->i64[0]) >> 3);
  }
  if ((unint64_t)(0x6F96F96F96F96F97 * ((a1[1].i64[0] - a1->i64[0]) >> 3)) >= 0x69069069069069) {
    unint64_t v6 = 0xD20D20D20D20D2;
  }
  else {
    unint64_t v6 = v3;
  }
  unint64_t v33 = a1 + 1;
  if (v6)
  {
    if (v6 > 0xD20D20D20D20D2) {
      std::__throw_bad_array_new_length[abi:nn180100]();
    }
    uint64_t v7 = (char *)operator new(312 * v6);
  }
  else
  {
    uint64_t v7 = 0;
  }
  long long v30 = v7;
  v31.i64[0] = (uint64_t)&v7[312 * v2];
  uint64_t v32 = &v7[312 * v6];
  TI::CP::TestResultsSummarizer::TestResultsSummarizer((TI::CP::TestResultsSummarizer *)v31.i64[0], a2);
  uint64_t v8 = v31.i64[0];
  uint64_t v9 = v31.i64[0] + 312;
  v31.i64[1] = v31.i64[0] + 312;
  uint64_t v11 = a1->i64[0];
  unint64_t v10 = a1->u64[1];
  if (v10 == a1->i64[0])
  {
    int64x2_t v27 = vdupq_n_s64(v10);
  }
  else
  {
    uint64_t v12 = 0;
    do
    {
      uint64_t v13 = v8 + v12;
      long long v14 = (void *)(v8 + v12 - 312);
      uint64_t v15 = v10 + v12;
      uint64_t v16 = v10 + v12 - 312;
      *(void *)(v8 + v12 - 304) = 0;
      *long long v14 = 0;
      v14[2] = 0;
      *(_OWORD *)long long v14 = *(_OWORD *)v16;
      *(void *)(v8 + v12 - 296) = *(void *)(v10 + v12 - 296);
      *(void *)(v10 + v12 - 304) = 0;
      *(void *)uint64_t v16 = 0;
      *(void *)(v16 + 16) = 0;
      int v17 = (void *)(v8 + v12 - 288);
      uint64_t v18 = v10 + v12 - 288;
      *(void *)(v8 + v12 - 280) = 0;
      *int v17 = 0;
      v17[2] = 0;
      *(_OWORD *)int v17 = *(_OWORD *)v18;
      *(void *)(v8 + v12 - 272) = *(void *)(v10 + v12 - 272);
      *(void *)(v10 + v12 - 280) = 0;
      *(void *)uint64_t v18 = 0;
      *(void *)(v18 + 16) = 0;
      long long v19 = (void *)(v8 + v12 - 264);
      long long v20 = (_OWORD *)(v10 + v12 - 264);
      *long long v19 = 0;
      *(void *)(v13 - 256) = 0;
      *(void *)(v13 - 248) = 0;
      *(_OWORD *)long long v19 = *v20;
      *(void *)(v13 - 248) = *(void *)(v10 + v12 - 248);
      *(void *)long long v20 = 0;
      *(void *)(v15 - 256) = 0;
      *(void *)(v15 - 248) = 0;
      long long v21 = *(_OWORD *)(v10 + v12 - 240);
      long long v22 = *(_OWORD *)(v10 + v12 - 224);
      long long v23 = *(_OWORD *)(v10 + v12 - 208);
      *(_OWORD *)(v13 - 199) = *(_OWORD *)(v10 + v12 - 199);
      *(_OWORD *)(v13 - 224) = v22;
      *(_OWORD *)(v13 - 208) = v23;
      *(_OWORD *)(v13 - 240) = v21;
      *(void *)(v13 - 168) = 0;
      *(void *)(v13 - 160) = 0;
      *(void *)(v13 - 176) = 0;
      *(_OWORD *)(v13 - 176) = *(_OWORD *)(v10 + v12 - 176);
      *(void *)(v13 - 160) = *(void *)(v10 + v12 - 160);
      *(void *)(v15 - 176) = 0;
      *(void *)(v15 - 168) = 0;
      *(void *)(v15 - 160) = 0;
      std::__hash_table<std::__hash_value_type<std::string,std::vector<TI::CP::ContinuousPathTestResult>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<TI::CP::ContinuousPathTestResult>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<TI::CP::ContinuousPathTestResult>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<TI::CP::ContinuousPathTestResult>>>>::__hash_table(v8 + v12 - 152, (uint64_t *)(v10 + v12 - 152));
      *(void *)(v13 - 112) = 0;
      *(void *)(v13 - 104) = 0;
      *(void *)(v13 - 96) = 0;
      *(_OWORD *)(v13 - 112) = *(_OWORD *)(v10 + v12 - 112);
      *(void *)(v13 - 96) = *(void *)(v10 + v12 - 96);
      *(void *)(v15 - 112) = 0;
      *(void *)(v15 - 104) = 0;
      *(void *)(v15 - 96) = 0;
      *(void *)(v13 - 88) = 0;
      *(void *)(v13 - 80) = 0;
      *(void *)(v13 - 72) = 0;
      *(_OWORD *)(v13 - 88) = *(_OWORD *)(v10 + v12 - 88);
      *(void *)(v13 - 72) = *(void *)(v10 + v12 - 72);
      *(void *)(v15 - 88) = 0;
      *(void *)(v15 - 80) = 0;
      *(void *)(v15 - 72) = 0;
      *(void *)(v13 - 64) = 0;
      *(void *)(v13 - 56) = 0;
      *(void *)(v13 - 48) = 0;
      *(_OWORD *)(v13 - 64) = *(_OWORD *)(v10 + v12 - 64);
      *(void *)(v13 - 48) = *(void *)(v10 + v12 - 48);
      *(void *)(v15 - 64) = 0;
      *(void *)(v15 - 56) = 0;
      long long v24 = *(_OWORD *)(v10 + v12 - 40);
      long long v25 = *(_OWORD *)(v10 + v12 - 24);
      int v26 = *(_DWORD *)(v10 + v12 - 8);
      *(void *)(v15 - 48) = 0;
      *(_DWORD *)(v13 - 8) = v26;
      *(_OWORD *)(v13 - 24) = v25;
      *(_OWORD *)(v13 - 40) = v24;
      v12 -= 312;
    }
    while (v10 + v12 != v11);
    v8 += v12;
    int64x2_t v27 = *a1;
    uint64_t v9 = v31.i64[1];
  }
  a1->i64[0] = v8;
  a1->i64[1] = v9;
  int64x2_t v31 = v27;
  long long v28 = (char *)a1[1].i64[0];
  a1[1].i64[0] = (uint64_t)v32;
  uint64_t v32 = v28;
  long long v30 = (char *)v27.i64[0];
  std::__split_buffer<TI::CP::TestResultsSummarizer>::~__split_buffer((uint64_t)&v30);
  return v9;
}

void sub_23F00C5E4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<TI::CP::TestResultsSummarizer>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void std::vector<TI::CP::TestResultsSummarizer>::__destroy_vector::operator()[abi:nn180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (char *)**a1;
  if (v2)
  {
    uint64_t v4 = (char *)v1[1];
    unint64_t v5 = v2;
    if (v4 != v2)
    {
      do
        TI::CP::TestResultsSummarizer::~TestResultsSummarizer((TI::CP::TestResultsSummarizer *)(v4 - 312));
      while (v4 != v2);
      unint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t std::__split_buffer<TI::CP::TestResultsSummarizer>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 312;
    TI::CP::TestResultsSummarizer::~TestResultsSummarizer((TI::CP::TestResultsSummarizer *)(i - 312));
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t TI::CP::CPTestCaseEval::set_detail_level(uint64_t this, int a2)
{
  if (a2 >= 2)
  {
    int v2 = 2;
LABEL_5:
    *(_DWORD *)(this + 40) = v2;
    return this;
  }
  if (a2 == 1)
  {
    int v2 = 1;
    goto LABEL_5;
  }
  *(_DWORD *)(this + 40) = 0;
  return this;
}

void TI::CP::CPTestCaseEval::dump_summary_results_to_dir(TI::CP::CPTestCaseEval *this, const TI::CP::ContinuousPathTestResult **a2, NSString *a3)
{
  uint64_t v4 = a3;
  unint64_t v5 = [NSURL fileURLWithPath:v4];
  unint64_t v6 = [MEMORY[0x263F08850] defaultManager];
  id v25 = 0;
  char v7 = [v6 createDirectoryAtURL:v5 withIntermediateDirectories:1 attributes:0 error:&v25];
  id v8 = v25;

  if ((v7 & 1) == 0)
  {
    id v9 = [v8 description];
    printf("[write_detailed_report] Failed: %s\n", (const char *)[v9 UTF8String]);
    goto LABEL_7;
  }
  id v9 = [(NSString *)v4 stringByAppendingPathComponent:@"ensembleTop1-baseMatchIndexHigher.json"];
  unint64_t v10 = TI::CP::CPTestCaseEval::serialize_results((uint64_t)v9, a2);
  id v24 = v8;
  uint64_t v11 = [MEMORY[0x263F08900] dataWithJSONObject:v10 options:1 error:&v24];
  id v12 = v24;

  if (v12)
  {
    id v13 = [v12 description];
    NSLog(&cfstr_WriteDetailedR.isa, [v13 UTF8String]);
  }
  else
  {
    if (([v11 writeToFile:v9 atomically:1] & 1) == 0)
    {
      NSLog(&cfstr_FailedToWriteD.isa, v9);
      id v8 = 0;
      goto LABEL_5;
    }
    long long v14 = [(NSString *)v4 stringByAppendingPathComponent:@"ensembleTop1-baseMatchIndexSame.json"];

    uint64_t v16 = TI::CP::CPTestCaseEval::serialize_results(v15, a2 + 6);

    id v23 = 0;
    int v17 = [MEMORY[0x263F08900] dataWithJSONObject:v16 options:1 error:&v23];
    id v12 = v23;

    if (v12)
    {
      id v13 = [v12 description];
      NSLog(&cfstr_WriteDetailedR.isa, [v13 UTF8String]);
      id v9 = v14;
      unint64_t v10 = v16;
      uint64_t v11 = v17;
    }
    else
    {
      if (([v17 writeToFile:v14 atomically:1] & 1) == 0)
      {
        id v9 = v14;
        unint64_t v10 = v16;
        uint64_t v11 = v17;
        NSLog(&cfstr_FailedToWriteD.isa, v14);
        id v8 = 0;
        goto LABEL_5;
      }
      uint64_t v21 = [(NSString *)v4 stringByAppendingPathComponent:@"ensembleTop1-notInBase.json"];

      uint64_t v19 = TI::CP::CPTestCaseEval::serialize_results(v18, a2 + 3);

      id v22 = 0;
      long long v20 = [MEMORY[0x263F08900] dataWithJSONObject:v19 options:1 error:&v22];
      id v12 = v22;

      if (!v12)
      {
        if ([v20 writeToFile:v21 atomically:1])
        {
          id v8 = 0;
          id v9 = (id)v21;
          unint64_t v10 = (void *)v19;
          uint64_t v11 = v20;
        }
        else
        {
          id v9 = (id)v21;
          unint64_t v10 = (void *)v19;
          uint64_t v11 = v20;
          NSLog(&cfstr_FailedToWriteD.isa, v21);
          id v8 = 0;
        }
        goto LABEL_5;
      }
      [v12 description];
      uint64_t v11 = v20;
      id v13 = objc_claimAutoreleasedReturnValue();
      NSLog(&cfstr_WriteDetailedR.isa, [v13 UTF8String]);
      id v9 = (id)v21;
      unint64_t v10 = (void *)v19;
    }
  }

  id v8 = v12;
LABEL_5:

LABEL_7:
}

void sub_23F00CAF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

id TI::CP::CPTestCaseEval::serialize_results(uint64_t a1, const TI::CP::ContinuousPathTestResult **a2)
{
  v11[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263EFF980] array];
  uint64_t v4 = v3;
  unint64_t v5 = *a2;
  unint64_t v6 = a2[1];
  while (v5 != v6)
  {
    char v7 = TI::CP::CPTestCaseEval::create_results_dictionary(v3, v5, 1u);
    [(TI::CP::CPTestCaseEval *)v4 addObject:v7];

    unint64_t v5 = (const TI::CP::ContinuousPathTestResult *)((char *)v5 + 232);
  }
  unint64_t v10 = @"summary";
  v11[0] = v4;
  id v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];

  return v8;
}

void sub_23F00CC70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void TI::CP::CPTestCaseEval::write_detailed_report(TI::CP::CPTestCaseEval *this, objc_object *a2, NSString *a3)
{
  unint64_t v5 = a2;
  unint64_t v6 = a3;
  puts("Writing detailed report…");
  if (v5)
  {
    id v23 = 0;
    char v7 = [MEMORY[0x263F08900] dataWithJSONObject:v5 options:1 error:&v23];
    id v8 = v23;
    if (v8)
    {
      id v9 = v8;
      id v10 = [v8 description];
      printf("[write_detailed_report] Failed: %s\n", (const char *)[v10 UTF8String]);
LABEL_16:

      goto LABEL_17;
    }
    if (*((unsigned char *)this + 280))
    {
      id v11 = (id) [[NSString alloc] initWithData:v7 encoding:4];
      printf("Detailed results:\n%s\n", (const char *)[v11 UTF8String]);
    }
    id v10 = [NSURL fileURLWithPath:v6];
    id v12 = [v10 URLByDeletingLastPathComponent];
    id v13 = [MEMORY[0x263F08850] defaultManager];
    id v22 = 0;
    char v14 = [v13 createDirectoryAtURL:v12 withIntermediateDirectories:1 attributes:0 error:&v22];
    id v9 = v22;

    if (v14)
    {
      uint64_t v15 = [MEMORY[0x263F08850] defaultManager];
      uint64_t v16 = [v10 path];
      int v17 = [MEMORY[0x263EFF8F8] data];
      char v18 = [v15 createFileAtPath:v16 contents:v17 attributes:0];

      if ((v18 & 1) == 0)
      {
        [(NSString *)v6 UTF8String];
        printf("[write_detailed_report] Failed to create file %s\n");
        goto LABEL_15;
      }
      uint64_t v19 = [v10 path];
      char v20 = [v7 writeToFile:v19 atomically:1];

      if ((v20 & 1) == 0)
      {
        [(NSString *)v6 UTF8String];
        printf("[write_detailed_report] Failed to write to file %s\n");
        goto LABEL_15;
      }
      id v21 = [v10 path];
      [v21 UTF8String];
      printf("Detailed report written to: %s\n");
    }
    else
    {
      id v21 = [v9 description];
      [v21 UTF8String];
      printf("[write_detailed_report] Failed: %s\n");
    }

LABEL_15:
    goto LABEL_16;
  }
  puts("[write_detailed_report] Failed: no detailed results available.");
LABEL_17:
}

void sub_23F00CF4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id TI::CP::CPTestCaseEval::serialize_results_legacy(uint64_t a1, unsigned int **a2, void *a3, signed int a4)
{
  uint64_t v45[4] = *MEMORY[0x263EF8340];
  id v29 = a3;
  id v28 = [MEMORY[0x263EFF980] array];
  unint64_t v5 = *a2;
  unint64_t v6 = a2[1];
  int64x2_t v31 = v6;
  while (v5 != v6)
  {
    float v34 = v5;
    signed int v7 = v5[36];
    if (v7 < 0 || v7 >= a4)
    {
      id v8 = [v29 objectForKeyedSubscript:@"test_cases"];
      uint64_t v32 = [v8 objectAtIndexedSubscript:*v34];

      unint64_t v33 = [MEMORY[0x263EFF9A0] dictionary];
      uint64_t v9 = [v32 objectForKey:@"true_word"];
      id v10 = (void *)v9;
      if (v9) {
        id v11 = (__CFString *)v9;
      }
      else {
        id v11 = &stru_26F2B7E50;
      }
      [v33 setObject:v11 forKeyedSubscript:@"expected_word"];

      id v12 = [NSNumber numberWithInt:v34[36]];
      [v33 setObject:v12 forKeyedSubscript:@"matched_indx"];

      BOOL v35 = [MEMORY[0x263EFF980] array];
      char v14 = (id *)*((void *)v34 + 5);
      for (uint64_t i = (id *)*((void *)v34 + 6); v14 != i; v14 += 125)
      {
        id v15 = v14[123];
        KB::Candidate::capitalized_string(v45, (KB::Candidate *)v14);
        int v17 = KB::ns_string((KB *)v45, v16);
        KB::String::~String((KB::String *)v45);
        if (v15)
        {
          char v18 = [MEMORY[0x263EFF980] array];
          uint64_t v19 = [v15 allKeys];
          char v20 = [v19 sortedArrayUsingSelector:sel_compare_];

          long long v38 = 0u;
          long long v39 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          id v21 = v20;
          uint64_t v22 = [v21 countByEnumeratingWithState:&v36 objects:v44 count:16];
          if (v22)
          {
            uint64_t v23 = *(void *)v37;
            do
            {
              for (uint64_t j = 0; j != v22; ++j)
              {
                if (*(void *)v37 != v23) {
                  objc_enumerationMutation(v21);
                }
                id v25 = [v15 objectForKey:*(void *)(*((void *)&v36 + 1) + 8 * j)];
                [v18 addObject:v25];
              }
              uint64_t v22 = [v21 countByEnumeratingWithState:&v36 objects:v44 count:16];
            }
            while (v22);
          }

          v42[0] = @"cand";
          v42[1] = @"score_info";
          v43[0] = v17;
          v43[1] = v18;
          int v26 = [NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:2];
        }
        else
        {
          uint64_t v40 = @"cand";
          uint64_t v41 = v17;
          int v26 = [NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
        }
        [v35 addObject:v26];
      }
      [v33 setObject:v35 forKeyedSubscript:@"candidates_info"];
      [v28 addObject:v33];
    }
    unint64_t v5 = v34 + 58;
    unint64_t v6 = v31;
  }

  return v28;
}

void sub_23F00D3AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

void TI::CP::CPTestCaseEval::set_shape_store_config(TI::CP::CPTestCaseEval *this, NSString *a2)
{
  id v10 = a2;
  uint64_t v3 = NSURL;
  uint64_t v4 = NSTemporaryDirectory();
  unint64_t v5 = [v3 fileURLWithPath:v4 isDirectory:1];

  unint64_t v6 = [MEMORY[0x263F08850] defaultManager];
  signed int v7 = [v5 URLByAppendingPathComponent:v10];
  id v8 = [v7 path];

  if ([v6 fileExistsAtPath:v8]) {
    [v6 removeItemAtPath:v8 error:0];
  }
  uint64_t v9 = (const void *)*((void *)this + 3);
  if (v9 != v5)
  {
    if (v5)
    {
      CFRetain(v5);
      uint64_t v9 = (const void *)*((void *)this + 3);
    }
    if (v9) {
      CFRelease(v9);
    }
    *((void *)this + 3) = v5;
  }
  KB::retain_ptr<__CFString const*>::operator=((const void **)this + 4, v10);
}

void sub_23F00D5D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_23F00D6E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_23F00D798(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23F00D9C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23F00DF28(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_23F00E198(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL _isNumberPunctationKey(NSString *a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = [(NSString *)v1 _rangeOfLongCharacterAtIndex:0];
  if (v2 + v3 == [(NSString *)v1 length])
  {
    UChar32 v4 = [(NSString *)v1 _firstLongCharacter];
    if (u_ispunct(v4)) {
      BOOL v5 = 1;
    }
    else {
      BOOL v5 = u_isdigit(v4) != 0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

void sub_23F00E240(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _isControlKey(NSString *a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = [(NSString *)v1 isEqualToString:@"Shift"]
    || [(NSString *)v1 isEqualToString:@"More"]
    || [(NSString *)v1 isEqualToString:@"Delete"]
    || [(NSString *)v1 isEqualToString:@"\n"];

  return v2;
}

void sub_23F00E2D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23F00E3D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23F00E9CC(_Unwind_Exception *a1)
{
  UChar32 v4 = v3;

  _Unwind_Resume(a1);
}

void sub_23F00EA90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23F00EDBC(_Unwind_Exception *a1)
{
  UChar32 v4 = v3;

  _Unwind_Resume(a1);
}

void TI::CP::make_layout(TI::CP *this@<X0>, const KB::DictionaryContainer *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  unint64_t v6 = a2;
  unint64_t v29 = 0;
  uint64_t v30 = 0;
  uint64_t v31 = 0;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  signed int v7 = [(KB::DictionaryContainer *)v6 keys];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v26;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v25 + 1) + 8 * v10);
        [v11 frame];
        id v12 = [v11 string];
        KB::utf8_string(v32, v12, v13);

        KB::CollatorWrapper::sortkey_for_string(&v23, (KB::CollatorWrapper *)(*((void *)this + 1) + 72), (const KB::String *)v32);
        [v11 keyCode];
        TI::Favonius::LayoutKey::create();
        unint64_t v14 = v29;
        if (v29 != v31)
        {
          uint64_t v17 = v30;
          goto LABEL_15;
        }
        unint64_t v15 = v29 + (v29 >> 1);
        if (v29 < 0x100) {
          unint64_t v15 = 2 * v29;
        }
        if (v15 <= v29 + 1) {
          unint64_t v16 = v29 + 1;
        }
        else {
          unint64_t v16 = v15;
        }
        WTF::Vector<WTF::RefPtr<TI::Favonius::LayoutKey>,0ul>::reserveCapacity(&v29, v16);
        uint64_t v17 = v30;
        if (v30)
        {
          unint64_t v14 = v29;
LABEL_15:
          *(void *)(v17 + 8 * v14) = v22;
          unint64_t v29 = v14 + 1;
          goto LABEL_16;
        }
        if (v22) {
          WTF::RefCounted<TI::Favonius::Key>::deref(v22);
        }
LABEL_16:
        if ((unsigned __int16)v23 >= 0xFu && v24) {
          MEMORY[0x2455C26D0](v24, 0x1000C8077774924);
        }
        KB::String::~String((KB::String *)v32);
        ++v10;
      }
      while (v8 != v10);
      uint64_t v18 = [v7 countByEnumeratingWithState:&v25 objects:v33 count:16];
      uint64_t v8 = v18;
    }
    while (v18);
  }

  uint64_t v19 = [(KB::DictionaryContainer *)v6 name];
  KB::utf8_string(v32, v19, v20);

  TI::Favonius::KeyboardLayout::create();
  uint64_t v21 = v23;
  KB::String::operator=();
  *a3 = v21;
  KB::String::~String((KB::String *)v32);
  WTF::Vector<WTF::RefPtr<TI::Favonius::LayoutKey>,0ul>::~Vector(&v29);
}

void sub_23F00F070(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  if (v14) {
    WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(v14);
  }
  KB::String::~String((KB::String *)va1);
  WTF::Vector<WTF::RefPtr<TI::Favonius::LayoutKey>,0ul>::~Vector((uint64_t *)va);

  _Unwind_Resume(a1);
}

std::string *TI::CP::TTKTestCaseConverter::TTKTestCaseConverter(std::string *this, long long *a2, std::string::size_type *a3, atomic_uint **a4)
{
  BOOL v5 = *a4;
  signed int v7 = v5;
  if (v5) {
    atomic_fetch_add(v5, 1u);
  }
  TI::CP::TestCaseConverter::TestCaseConverter(this, a2, a3, &v7);
  if (v7) {
    WTF::RefCounted<KB::DictionaryContainer>::deref((unsigned int *)v7);
  }
  return this;
}

void sub_23F00F1A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, unsigned int *a10)
{
  if (a10) {
    WTF::RefCounted<KB::DictionaryContainer>::deref(a10);
  }
  _Unwind_Resume(exception_object);
}

void TI::CP::TTKTestCaseConverter::add_layout(TI::CP::TTKTestCaseConverter *this, TTKSimpleKeyboardPlane *a2)
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  unint64_t v47 = 0;
  uint64_t v48 = 0;
  uint64_t v49 = 0;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v42 = a2;
  UChar32 v4 = [(TTKSimpleKeyboardPlane *)v42 keys];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v43 objects:v56 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v44;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v44 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v43 + 1) + 8 * v7);
        [v8 frame];
        uint64_t v9 = [v8 string];
        KB::utf8_string(v55, v9, v10);

        KB::CollatorWrapper::sortkey_for_string((uint64_t *)&v52, (KB::CollatorWrapper *)(*(void *)(*((void *)this + 5) + 8) + 72), (const KB::String *)v55);
        [v8 keyCode];
        TI::Favonius::LayoutKey::create();
        unint64_t v11 = v47;
        if (v47 != v49)
        {
          uint64_t v14 = v48;
          goto LABEL_15;
        }
        unint64_t v12 = v47 + (v47 >> 1);
        if (v47 < 0x100) {
          unint64_t v12 = 2 * v47;
        }
        if (v12 <= v47 + 1) {
          unint64_t v13 = v47 + 1;
        }
        else {
          unint64_t v13 = v12;
        }
        WTF::Vector<WTF::RefPtr<TI::Favonius::LayoutKey>,0ul>::reserveCapacity(&v47, v13);
        uint64_t v14 = v48;
        if (v48)
        {
          unint64_t v11 = v47;
LABEL_15:
          *(void *)(v14 + 8 * v11) = v50[0];
          unint64_t v47 = v11 + 1;
          goto LABEL_16;
        }
        if (v50[0]) {
          WTF::RefCounted<TI::Favonius::Key>::deref(v50[0]);
        }
LABEL_16:
        if ((unsigned __int16)v52 >= 0xFu && v53) {
          MEMORY[0x2455C26D0](v53, 0x1000C8077774924);
        }
        KB::String::~String((KB::String *)v55);
        ++v7;
      }
      while (v5 != v7);
      uint64_t v15 = [v4 countByEnumeratingWithState:&v43 objects:v56 count:16];
      uint64_t v5 = v15;
    }
    while (v15);
  }

  uint64_t v16 = [(TTKSimpleKeyboardPlane *)v42 name];
  KB::utf8_string(v55, v16, v17);

  TI::Favonius::KeyboardLayout::create();
  uint64_t v18 = v52;
  KB::String::operator=();
  uint64_t v41 = [(TTKSimpleKeyboardPlane *)v42 name];
  KB::utf8_string((uint64_t *)&v52, v41, v19);
  if (v53) {
    char v20 = v53;
  }
  else {
    char v20 = (KB::String *)&v54;
  }
  unsigned int v21 = KB::String::hash(v20, (const char *)(unsigned __int16)v52);
  uint64_t v22 = (void *)((char *)this + 48);
  unint64_t v23 = v21;
  unint64_t v24 = *((void *)this + 7);
  if (v24)
  {
    uint8x8_t v25 = (uint8x8_t)vcnt_s8((int8x8_t)v24);
    v25.i16[0] = vaddlv_u8(v25);
    unint64_t v26 = v25.u32[0];
    if (v25.u32[0] > 1uLL)
    {
      unint64_t v2 = v21;
      if (v24 <= v21) {
        unint64_t v2 = v21 % v24;
      }
    }
    else
    {
      unint64_t v2 = (v24 - 1) & v21;
    }
    long long v27 = *(uint64_t ***)(*v22 + 8 * v2);
    if (v27)
    {
      long long v28 = (uint64_t **)*v27;
      if (*v27)
      {
        do
        {
          unint64_t v29 = (unint64_t)v28[1];
          if (v29 == v23)
          {
            if (v28 + 2 == (uint64_t **)&v52
              || (KB::String::equal((KB::String *)(v28 + 2), (const KB::String *)&v52) & 1) != 0)
            {
              goto LABEL_69;
            }
          }
          else
          {
            if (v26 > 1)
            {
              if (v29 >= v24) {
                v29 %= v24;
              }
            }
            else
            {
              v29 &= v24 - 1;
            }
            if (v29 != v2) {
              break;
            }
          }
          long long v28 = (uint64_t **)*v28;
        }
        while (v28);
      }
    }
  }
  uint64_t v30 = operator new(0x38uLL);
  uint64_t v31 = (uint64_t *)((char *)this + 64);
  v50[0] = (uint64_t)v30;
  v50[1] = (uint64_t)this + 64;
  char v51 = 0;
  *uint64_t v30 = 0;
  v30[1] = v23;
  KB::String::String();
  v30[6] = v18;
  if (v18) {
    atomic_fetch_add((atomic_uint *volatile)v18, 1u);
  }
  char v51 = 1;
  float v32 = (float)(unint64_t)(*((void *)this + 9) + 1);
  float v33 = *((float *)this + 20);
  if (!v24 || (float)(v33 * (float)v24) < v32)
  {
    BOOL v34 = 1;
    if (v24 >= 3) {
      BOOL v34 = (v24 & (v24 - 1)) != 0;
    }
    unint64_t v35 = v34 | (2 * v24);
    unint64_t v36 = vcvtps_u32_f32(v32 / v33);
    if (v35 <= v36) {
      size_t v37 = v36;
    }
    else {
      size_t v37 = v35;
    }
    std::__hash_table<std::__hash_value_type<unsigned int,float>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,float>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,float>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,float>>>::__rehash<true>((uint64_t)this + 48, v37);
    unint64_t v24 = *((void *)this + 7);
    if ((v24 & (v24 - 1)) != 0)
    {
      if (v24 <= v23) {
        unint64_t v2 = v23 % v24;
      }
      else {
        unint64_t v2 = v23;
      }
    }
    else
    {
      unint64_t v2 = (v24 - 1) & v23;
    }
  }
  long long v38 = *(uint64_t **)(*v22 + 8 * v2);
  uint64_t v39 = v50[0];
  if (v38)
  {
    *(void *)v50[0] = *v38;
LABEL_67:
    *long long v38 = v39;
    goto LABEL_68;
  }
  *(void *)v50[0] = *v31;
  *uint64_t v31 = v39;
  *(void *)(*v22 + 8 * v2) = v31;
  if (*(void *)v39)
  {
    unint64_t v40 = *(void *)(*(void *)v39 + 8);
    if ((v24 & (v24 - 1)) != 0)
    {
      if (v40 >= v24) {
        v40 %= v24;
      }
    }
    else
    {
      v40 &= v24 - 1;
    }
    long long v38 = (uint64_t *)(*v22 + 8 * v40);
    goto LABEL_67;
  }
LABEL_68:
  v50[0] = 0;
  ++*((void *)this + 9);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<KB::String,WTF::RefPtr<TI::Favonius::KeyboardLayout>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<KB::String,WTF::RefPtr<TI::Favonius::KeyboardLayout>>,void *>>>>::reset[abi:nn180100](v50);
LABEL_69:
  KB::String::~String((KB::String *)&v52);

  if (v18) {
    WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref((unsigned int *)v18);
  }
  KB::String::~String((KB::String *)v55);
  WTF::Vector<WTF::RefPtr<TI::Favonius::LayoutKey>,0ul>::~Vector(&v47);
}

void sub_23F00F6A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,__int16 a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  std::unique_ptr<std::__hash_node<std::__hash_value_type<KB::String,WTF::RefPtr<TI::Favonius::KeyboardLayout>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<KB::String,WTF::RefPtr<TI::Favonius::KeyboardLayout>>,void *>>>>::reset[abi:nn180100](&a22);
  KB::String::~String((KB::String *)&a25);

  if (v29) {
    WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(v29);
  }
  KB::String::~String((KB::String *)&a29);
  WTF::Vector<WTF::RefPtr<TI::Favonius::LayoutKey>,0ul>::~Vector(&a19);

  _Unwind_Resume(a1);
}

void TI::CP::TTKTestCaseConverter::convert(TI::CP::TTKTestCaseConverter *this@<X0>, TTKTestCaseRecord *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v55[4] = *MEMORY[0x263EF8340];
  uint64_t v5 = a2;
  uint64_t v6 = [(TTKTestCaseRecord *)v5 layoutName];
  KB::utf8_string(v55, v6, v7);

  uint64_t v8 = (atomic_uint *)std::__hash_table<std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>,std::__unordered_map_hasher<KB::String,std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>,std::hash<KB::String>,std::equal_to<KB::String>,true>,std::__unordered_map_equal<KB::String,std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>,std::equal_to<KB::String>,std::hash<KB::String>,true>,std::allocator<std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>>>::find<KB::String>((void *)this + 6, v55)[6];
  if (v8) {
    atomic_fetch_add(v8, 1u);
  }
  uint64_t v9 = [(TTKTestCaseRecord *)v5 touchDataCollection];
  uint64_t v10 = [v9 objectAtIndexedSubscript:0];

  long long v42 = 0u;
  long long v43 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  unint64_t v11 = [v10 samples];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v37 objects:v54 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v38 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        [v15 point];
        CGFloat v17 = v16;
        CGFloat v19 = v18;
        [v15 timeStamp];
        double v21 = v20;
        [v15 force];
        double v23 = v22;
        v56.x = v17;
        v56.y = v19;
        TI::CP::Path::append((TI::CP::Path *)&v41, v56, v21, v23, -1.0, 0.0);
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v37 objects:v54 count:16];
    }
    while (v12);
  }

  unint64_t v24 = [(TTKTestCaseRecord *)v5 primaryIntendedText];
  KB::utf8_string(v53, v24, v25);

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  *(_OWORD *)uint64_t v31 = 0u;
  language_modeling::v1::LinguisticContext::LinguisticContext((language_modeling::v1::LinguisticContext *)&v34);
  language_modeling::v1::LinguisticContext::LinguisticContext((language_modeling::v1::LinguisticContext *)&v35);
  memset(v36, 0, 24);
  KB::String::String((KB::String *)v52);
  unint64_t v26 = [(TTKTestCaseRecord *)v5 context];
  BOOL v27 = v26 == 0;

  if (!v27)
  {
    long long v28 = [(TTKTestCaseRecord *)v5 context];
    TI::CP::TestCaseConverter::compute_linguistic_context_and_stem(this, v28, (KB::LanguageModelContext *)&v45);
    KB::LanguageModelContext::operator=((uint64_t)&v30, &v45);
    KB::String::operator=();
    KB::String::~String((KB::String *)&v51);
    long long v44 = (void **)&v50;
    std::vector<std::string>::__destroy_vector::operator()[abi:nn180100](&v44);
    language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)&v49);
    language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)&v48);
    if (__p)
    {
      unint64_t v47 = __p;
      operator delete(__p);
    }
    if (*((void *)&v45 + 1)) {
      std::__shared_weak_count::__release_shared[abi:nn180100](*((std::__shared_weak_count **)&v45 + 1));
    }
  }
  unint64_t v29 = v8;
  if (v8) {
    atomic_fetch_add(v8, 1u);
  }
  TI::CP::ContinuousPathTestCase::ContinuousPathTestCase(a3, &v29, (const std::vector<unsigned int> *)&v41, (uint64_t)v53, (const KB::LanguageModelContext *)&v30, (uint64_t)v52);
  if (v29) {
    WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref((unsigned int *)v29);
  }
  KB::String::~String((KB::String *)v52);
  *(void *)&long long v45 = v36;
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)&v45);
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)&v35);
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)&v34);
  if (v31[0])
  {
    v31[1] = v31[0];
    operator delete(v31[0]);
  }
  if (*((void *)&v30 + 1)) {
    std::__shared_weak_count::__release_shared[abi:nn180100](*((std::__shared_weak_count **)&v30 + 1));
  }
  KB::String::~String((KB::String *)v53);
  if (*((void *)&v42 + 1))
  {
    *(void *)&long long v43 = *((void *)&v42 + 1);
    operator delete(*((void **)&v42 + 1));
  }
  if ((void)v41)
  {
    *((void *)&v41 + 1) = v41;
    operator delete((void *)v41);
  }

  if (v8) {
    WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref((unsigned int *)v8);
  }
  KB::String::~String((KB::String *)v55);
}

void sub_23F00FB44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58,uint64_t a59,uint64_t a60,uint64_t a61,char a62)
{
  std::pair<KB::LanguageModelContext,KB::String>::~pair((uint64_t)&a41);

  KB::String::~String((KB::String *)&a58);
  KB::LanguageModelContext::~LanguageModelContext((KB::LanguageModelContext *)&a11);
  KB::String::~String((KB::String *)&a62);
  TI::CP::Path::~Path((TI::CP::Path *)&a33);

  if (v63) {
    WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(v63);
  }
  KB::String::~String((KB::String *)(v66 - 168));

  _Unwind_Resume(a1);
}

void _TIBeginMockingCryptographer()
{
  uint64_t v0 = objc_alloc_init(TICryptographerMock);
  if (objc_opt_respondsToSelector()) {
    [MEMORY[0x263F7EA70] performSelector:sel_setSharedCryptographer_ withObject:v0];
  }
}

uint64_t _TIEndMockingCryptographer()
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v1 = (void *)MEMORY[0x263F7EA70];
    return [v1 performSelector:sel_setSharedCryptographer_ withObject:0];
  }
  return result;
}

void sub_23F00FE08(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23F00FED0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void _TIBeginMockingContactManagerWithContactCollection(void *a1)
{
  id v1 = a1;
  unint64_t v2 = [[TIContactManagerMock alloc] initWithContactCollection:v1];

  if (objc_opt_respondsToSelector()) {
    [MEMORY[0x263F7EA68] performSelector:sel_setSharedTIContactManager_ withObject:v2];
  }
}

void _TIEndMockingContactManager()
{
  if (objc_opt_respondsToSelector())
  {
    id v11 = [MEMORY[0x263F7EA68] sharedTIContactManager];
    uint64_t v0 = [v11 observers];
    uint64_t v1 = [v0 count];

    if (v1)
    {
      unint64_t v2 = TIBundleForInputMode();
      uint64_t v3 = (void *)[v2 classNamed:@"TIWordSearchKana"];
      if (objc_opt_respondsToSelector()) {
        [v3 performSelector:sel_clearCachedContactObserver];
      }
      UChar32 v4 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:10.0];
      uint64_t v5 = *MEMORY[0x263EFF478];
      while (1)
      {
        uint64_t v6 = [MEMORY[0x263EFF9F0] currentRunLoop];
        uint64_t v7 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:0.1];
        [v6 runMode:v5 beforeDate:v7];

        uint64_t v8 = [v11 observers];
        if (![v8 count]) {
          break;
        }
        uint64_t v9 = [MEMORY[0x263EFF910] date];
        uint64_t v10 = [v9 laterDate:v4];

        if (v10 != v4) {
          goto LABEL_11;
        }
      }

LABEL_11:
    }
    if (objc_opt_respondsToSelector()) {
      [MEMORY[0x263F7EA68] performSelector:sel_setSharedTIContactManager_ withObject:0];
    }
  }
}

void sub_23F0102D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23F0103F0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23F010520(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23F0105B8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23F010644(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23F0106D0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23F010760(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23F0107F0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23F010874(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23F010904(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23F010A20(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23F010B34(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23F010CCC(_Unwind_Exception *exception_object)
{
}

void sub_23F010D64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void _TIBeginMockingAggdReporter()
{
  if ((__missingTIAggdReporter & 1) == 0)
  {
    Class v0 = NSClassFromString(&cfstr_Tiaggdreporter.isa);
    if (v0)
    {
      Class v1 = v0;
      unint64_t v2 = objc_alloc_init(TIAggdReporterMock);
      uint64_t v3 = (void *)__aggdReportMock;
      __aggdReportMock = (uint64_t)v2;

      uint64_t v4 = __aggdReportMock;
      [(objc_class *)v1 setSharedAggdReporter:v4];
    }
    else
    {
      __missingTIAggdReporter = 1;
    }
  }
}

void _TIEndMockingAggdReporter()
{
  if ((__missingTIAggdReporter & 1) == 0)
  {
    [NSClassFromString(&cfstr_Tiaggdreporter.isa) setSharedAggdReporter:0];
    Class v0 = (void *)__aggdReportMock;
    __aggdReportMock = 0;
  }
}

uint64_t _TIGetMockingAggdReporterScalar(uint64_t a1)
{
  if (__missingTIAggdReporter) {
    return 0;
  }
  else {
    return [(id)__aggdReportMock getScalar:a1];
  }
}

id _TIGetMockingAggdReporterDistribution(uint64_t a1)
{
  if (__missingTIAggdReporter)
  {
    Class v1 = (void *)MEMORY[0x263EFFA68];
  }
  else
  {
    Class v1 = [(id)__aggdReportMock getDistributionObject:a1];
  }
  return v1;
}

uint64_t _TIMockingAggdReporterDictionaryToJSON()
{
  return [(id)__aggdReportMock toJsonString];
}

uint64_t _TIMockingAggdReporterDictionary()
{
  return [(id)__aggdReportMock toDictionary];
}

uint64_t _TIMockingAggdReporterClear()
{
  return [(id)__aggdReportMock clear];
}

id unigramsFilePathForInputMode()
{
  Class v0 = UIKeyboardStaticUnigramsFile();
  return v0;
}

id phrasesFilePathForInputMode(uint64_t a1)
{
  Class v1 = [MEMORY[0x263F7EA88] inputModeWithIdentifier:a1];
  unint64_t v2 = UIKeyboardPhraseLexiconPathForInputMode();

  return v2;
}

void sub_23F010FE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id dynamicFilePathForInputMode(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [v3 length];
  uint64_t v6 = 0;
  if (v4 && v5)
  {
    if ([v3 isEqualToString:@"en_US"])
    {
      uint64_t v7 = @"dynamic-text.dat";
    }
    else
    {
      uint64_t v8 = TIInputModeGetLanguageWithRegion();
      uint64_t v7 = [v8 stringByAppendingString:@"-dynamic-text.dat"];
    }
    if ([(__CFString *)v7 length])
    {
      uint64_t v6 = [v4 stringByAppendingPathComponent:v7];
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  return v6;
}

void sub_23F0110D8(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

id deltaUnigramsFilePathForInputMode(uint64_t a1)
{
  Class v1 = [MEMORY[0x263F7EA88] inputModeWithIdentifier:a1];
  unint64_t v2 = UIKeyboardDeltaLexiconPathForInputMode();

  return v2;
}

void sub_23F011168(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __createAndLoadDictionaryContainer(NSString *a1@<X0>, NSString *a2@<X1>, void ***a3@<X8>)
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v4 = a1;
  uint64_t v5 = a2;
  if (v5)
  {
    UIKeyboardDynamicDictionaryFile();
    uint64_t v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v6 = 0;
  }
  __getLexiconInfo(v4, v6, 1.0, (uint64_t)v43);
  KB::LexiconInfo::LexiconInfo((uint64_t)v38, (uint64_t)v43);
  BOOL v27 = v6;
  *(void *)&long long v32 = operator new(0xB0uLL);
  long long v33 = (char *)(v32 + 176);
  KB::LexiconInfo::LexiconInfo(v32, (uint64_t)v38);
  *((void *)&v32 + 1) = v32 + 176;
  KB::String::~String((KB::String *)&v42);
  KB::String::~String((KB::String *)&v41);
  KB::String::~String((KB::String *)&v40);
  KB::String::~String((KB::String *)v39);
  KB::String::~String((KB::String *)v38);
  long long v28 = v4;
  [(NSString *)v28 UTF8String];
  if (TIMultilingualDynamicModelEnabled())
  {
    MEMORY[0x2455C23A0](&v48, "mul-");
    [(NSString *)v28 UTF8String];
    KB::String::operator+();
    uint8x8_t v25 = v5;
    MEMORY[0x2455C23A0](v39, "mul");
    KB::String::~String((KB::String *)&v48);
    char v7 = 0;
    uint64_t v8 = v38;
    uint64_t v9 = 1;
    do
    {
      char v10 = v7;
      KB::String::String((KB::String *)v37);
      KB::String::String((KB::String *)v36);
      KB::String::String((KB::String *)v35);
      KB::String::String((KB::String *)v34);
      char v31 = 0;
      int v30 = 1;
      uint64_t v11 = *((void *)&v32 + 1);
      uint64_t v29 = v9;
      if (*((void *)&v32 + 1) >= (unint64_t)v33)
      {
        uint64_t v13 = 0x2E8BA2E8BA2E8BA3 * ((uint64_t)(*((void *)&v32 + 1) - v32) >> 4);
        unint64_t v14 = v13 + 1;
        if ((unint64_t)(v13 + 1) > 0x1745D1745D1745DLL) {
          abort();
        }
        if (0x5D1745D1745D1746 * ((uint64_t)&v33[-v32] >> 4) > v14) {
          unint64_t v14 = 0x5D1745D1745D1746 * ((uint64_t)&v33[-v32] >> 4);
        }
        if ((unint64_t)(0x2E8BA2E8BA2E8BA3 * ((uint64_t)&v33[-v32] >> 4)) >= 0xBA2E8BA2E8BA2ELL) {
          unint64_t v15 = 0x1745D1745D1745DLL;
        }
        else {
          unint64_t v15 = v14;
        }
        uint64_t v51 = &v33;
        if (v15)
        {
          if (v15 > 0x1745D1745D1745DLL) {
            std::__throw_bad_array_new_length[abi:nn180100]();
          }
          double v16 = (char *)operator new(176 * v15);
        }
        else
        {
          double v16 = 0;
        }
        uint64_t v48 = v16;
        v49.i64[0] = (uint64_t)&v16[176 * v13];
        v49.i64[1] = v49.i64[0];
        uint64_t v50 = &v16[176 * v15];
        std::construct_at[abi:nn180100]<KB::LexiconInfo,KB::String const&,KB::String,KB::String,KB::String,KB::String,unsigned int const&,BOOL,int,KB::LexiconInfo*>(v49.i64[0], (uint64_t)v8, (uint64_t)v37, (uint64_t)v36, (uint64_t)v35, (uint64_t)v34, &v31, &v30);
        uint64_t v17 = v49.i64[0];
        uint64_t v12 = v49.i64[1] + 176;
        v49.i64[1] += 176;
        long long v18 = v32;
        if (*((void *)&v32 + 1) == (void)v32)
        {
          int64x2_t v22 = vdupq_n_s64(*((unint64_t *)&v32 + 1));
        }
        else
        {
          uint64_t v19 = 0;
          do
          {
            KB::String::String();
            KB::String::String();
            KB::String::String();
            KB::String::String();
            uint64_t v20 = v17 + v19;
            KB::String::String();
            uint64_t v21 = *(void *)(*((void *)&v18 + 1) + v19 - 16);
            *(_DWORD *)(v20 - 8) = *(_DWORD *)(*((void *)&v18 + 1) + v19 - 8);
            *(void *)(v20 - 16) = v21;
            v19 -= 176;
          }
          while (*((void *)&v18 + 1) + v19 != (void)v18);
          v17 += v19;
          int64x2_t v22 = (int64x2_t)v32;
          uint64_t v12 = v49.i64[1];
        }
        *(void *)&long long v32 = v17;
        *((void *)&v32 + 1) = v12;
        int64x2_t v49 = v22;
        double v23 = v33;
        long long v33 = v50;
        uint64_t v50 = v23;
        uint64_t v48 = (char *)v22.i64[0];
        std::__split_buffer<KB::LexiconInfo>::~__split_buffer((uint64_t)&v48);
      }
      else
      {
        std::construct_at[abi:nn180100]<KB::LexiconInfo,KB::String const&,KB::String,KB::String,KB::String,KB::String,unsigned int const&,BOOL,int,KB::LexiconInfo*>(*((uint64_t *)&v32 + 1), (uint64_t)v8, (uint64_t)v37, (uint64_t)v36, (uint64_t)v35, (uint64_t)v34, &v31, &v30);
        uint64_t v12 = v11 + 176;
      }
      *((void *)&v32 + 1) = v12;
      KB::String::~String((KB::String *)v34);
      KB::String::~String((KB::String *)v35);
      KB::String::~String((KB::String *)v36);
      KB::String::~String((KB::String *)v37);
      uint64_t v8 = &v38[4 * v29];
      char v7 = 1;
      uint64_t v9 = 2;
    }
    while ((v10 & 1) == 0);
    for (uint64_t i = 4; i != -4; i -= 4)
      KB::String::~String((KB::String *)&v38[i]);
    uint64_t v5 = v25;
  }
  KB::DictionaryContainer::create_multilexicon();
  *a3 = v38[0];
  v38[0] = (void **)&v32;
  std::vector<KB::LexiconInfo>::__destroy_vector::operator()[abi:nn180100](v38);
  KB::String::~String((KB::String *)&v47);
  KB::String::~String((KB::String *)&v46);
  KB::String::~String((KB::String *)&v45);
  KB::String::~String((KB::String *)&v44);
  KB::String::~String((KB::String *)v43);
}

void sub_23F011638(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,void **a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,char a60)
{
  KB::String::~String((KB::String *)(v60 - 136));
  KB::String::~String((KB::String *)&a38);
  a34 = (void **)&a19;
  std::vector<KB::LexiconInfo>::__destroy_vector::operator()[abi:nn180100](&a34);
  KB::LexiconInfo::~LexiconInfo((KB::LexiconInfo *)&a60);

  _Unwind_Resume(a1);
}

void __getLexiconInfo(NSString *a1@<X0>, NSString *a2@<X1>, float a3@<S0>, uint64_t a4@<X8>)
{
  char v7 = a1;
  long long v18 = a2;
  UIKeyboardStaticUnigramsFile();
  uint64_t v8 = (KB *)objc_claimAutoreleasedReturnValue();
  deltaUnigramsFilePathForInputMode((uint64_t)v7);
  uint64_t v9 = (KB *)objc_claimAutoreleasedReturnValue();
  phrasesFilePathForInputMode((uint64_t)v7);
  char v10 = (KB *)objc_claimAutoreleasedReturnValue();
  dynamicFilePathForInputMode(v7, v18);
  uint64_t v11 = (KB *)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = v7;
  [(NSString *)v19 UTF8String];
  int v12 = TILexiconIDForLocaleIdentifier();
  KB::utf8_string((uint64_t *)a4, (KB *)v19, v13);
  KB::utf8_string((uint64_t *)(a4 + 32), v8, v14);
  KB::utf8_string((uint64_t *)(a4 + 64), v9, v15);
  KB::utf8_string((uint64_t *)(a4 + 96), v10, v16);
  KB::utf8_string((uint64_t *)(a4 + 128), v11, v17);
  *(_DWORD *)(a4 + 160) = v12;
  *(unsigned char *)(a4 + 164) = 0;
  *(float *)(a4 + 168) = a3;
}

void sub_23F011900(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9)
{
  KB::String::~String(v9);
  KB::String::~String(v17);
  KB::String::~String(v16);
  KB::String::~String(v13);

  _Unwind_Resume(a1);
}

uint64_t std::construct_at[abi:nn180100]<KB::LexiconInfo,KB::String const&,KB::String,KB::String,KB::String,KB::String,unsigned int const&,BOOL,int,KB::LexiconInfo*>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7, int *a8)
{
  *(_DWORD *)(a1 + 160) = -2;
  *(unsigned char *)(a1 + 164) = *a7;
  *(float *)(a1 + 168) = (float)*a8;
  return a1;
}

void sub_23F011A38(_Unwind_Exception *a1)
{
  KB::String::~String(v4);
  KB::String::~String(v3);
  KB::String::~String(v2);
  KB::String::~String(v1);
  _Unwind_Resume(a1);
}

uint64_t std::__split_buffer<KB::LexiconInfo>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 176;
    KB::LexiconInfo::~LexiconInfo((KB::LexiconInfo *)(i - 176));
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void __createAndLoadLanguageModel(NSString *a1@<X0>, NSString *a2@<X1>, void *a3@<X8>)
{
  v7[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = a1;
  uint64_t v6 = a2;
  *a3 = 0;
  a3[1] = 0;
  v7[0] = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v5];
  [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  objc_claimAutoreleasedReturnValue();
  [MEMORY[0x263F7EA88] inputModeWithIdentifier:v5];
  [(id)objc_claimAutoreleasedReturnValue() doesSupportInlineCompletion];
  KB::LanguageModelConfig::LanguageModelConfig();
  operator new();
}

void sub_23F011CD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  KB::LanguageModelConfig::~LanguageModelConfig((KB::LanguageModelConfig *)va);

  if (v12) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v12);
  }

  _Unwind_Resume(a1);
}

void _TIBeginMockingAppAutofillManager()
{
  Class v0 = objc_alloc_init(TIAppAutofillManagerMock);
  if (objc_opt_respondsToSelector()) {
    [MEMORY[0x263F7EA40] performSelector:sel_setSharedAppAutofillManager_ withObject:v0];
  }
}

uint64_t _TIEndMockingAppAutofillManager()
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    Class v1 = (void *)MEMORY[0x263F7EA40];
    return [v1 performSelector:sel_setSharedAppAutofillManager_ withObject:0];
  }
  return result;
}

void _TIBeginMockingAnalyticsService()
{
  if ((__missingTIAnalyticsService & 1) == 0)
  {
    Class v0 = NSClassFromString(&cfstr_Tianalyticsser.isa);
    if (v0)
    {
      Class v1 = v0;
      id v2 = objc_alloc(MEMORY[0x263F7E510]);
      uint64_t v3 = objc_opt_new();
      uint64_t v4 = [v2 initWithProvider:v3];
      uint64_t v5 = (void *)__analyticsServiceMock;
      __analyticsServiceMock = v4;

      uint64_t v6 = __analyticsServiceMock;
      [(objc_class *)v1 setMockInstance:v6];
    }
    else
    {
      __missingTIAnalyticsService = 1;
    }
  }
}

void _TIEndMockingAnalyticsService()
{
  if ((__missingTIAnalyticsService & 1) == 0)
  {
    [NSClassFromString(&cfstr_Tianalyticsser.isa) setMockInstance:0];
    Class v0 = (void *)__analyticsServiceMock;
    __analyticsServiceMock = 0;
  }
}

id _TIGetMockingAnalyticsServiceAllEvents()
{
  Class v0 = [(id)__analyticsServiceMock provider];
  Class v1 = [v0 allEvents];

  return v1;
}

id _TIGetMockingAnalyticsServiceEvents(void *a1)
{
  Class v1 = (void *)__analyticsServiceMock;
  id v2 = a1;
  uint64_t v3 = [v1 provider];
  uint64_t v4 = [(id)*MEMORY[0x263F7E708] stringByAppendingFormat:@".%@", v2];

  uint64_t v5 = [v3 eventsWithName:v4];

  return v5;
}

id _TIGetMockingAnalyticsInputAnalyticsServiceEvents(void *a1)
{
  Class v1 = (void *)__analyticsServiceMock;
  id v2 = a1;
  uint64_t v3 = [v1 provider];
  uint64_t v4 = [(id)*MEMORY[0x263F7E700] stringByAppendingFormat:@".%@", v2];

  uint64_t v5 = [v3 eventsWithName:v4];

  return v5;
}

id _TIGetMockingAnalyticsServiceEventsForMultipleEventNames(void *a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = [MEMORY[0x263EFF980] array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v1;
  uint64_t v3 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v24;
    uint64_t v6 = (void *)*MEMORY[0x263F7E708];
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v24 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v9 = [(id)__analyticsServiceMock provider];
        char v10 = [v6 stringByAppendingFormat:@".%@", v8];
        uint64_t v11 = [v9 eventsWithName:v10];

        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        id v12 = v11;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v20;
          do
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v20 != v15) {
                objc_enumerationMutation(v12);
              }
              [v2 addObject:*(void *)(*((void *)&v19 + 1) + 8 * j)];
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v14);
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v4);
  }

  return v2;
}

uint64_t _TIGetMockingAnalyticsServiceCountEvent(void *a1)
{
  id v1 = (void *)__analyticsServiceMock;
  id v2 = a1;
  uint64_t v3 = [v1 provider];
  uint64_t v4 = [(id)*MEMORY[0x263F7E708] stringByAppendingFormat:@".%@", v2];

  uint64_t v5 = [v3 countEvent:v4];
  return v5;
}

uint64_t _TIGetMockingAnalyticsServiceCountEventWithPredicate(void *a1, void *a2)
{
  uint64_t v3 = (void *)__analyticsServiceMock;
  id v4 = a2;
  id v5 = a1;
  uint64_t v6 = [v3 provider];
  char v7 = [(id)*MEMORY[0x263F7E708] stringByAppendingFormat:@".%@", v5];

  uint64_t v8 = [v6 countEvent:v7 filteredWithPredicate:v4];
  return v8;
}

uint64_t _TIGetMockingAnalyticsServiceSumIntegerField(void *a1, void *a2)
{
  uint64_t v3 = (void *)__analyticsServiceMock;
  id v4 = a2;
  id v5 = a1;
  uint64_t v6 = [v3 provider];
  char v7 = [(id)*MEMORY[0x263F7E708] stringByAppendingFormat:@".%@", v5];

  uint64_t v8 = [v6 sumIntegerField:v4 forEvent:v7];
  return v8;
}

uint64_t _TIGetMockingAnalyticsServiceSumIntegerFieldWithPredicate(void *a1, void *a2, void *a3)
{
  id v5 = (void *)__analyticsServiceMock;
  id v6 = a3;
  id v7 = a2;
  id v8 = a1;
  uint64_t v9 = [v5 provider];
  char v10 = [(id)*MEMORY[0x263F7E708] stringByAppendingFormat:@".%@", v8];

  uint64_t v11 = [v9 sumIntegerField:v7 forEvent:v10 filteredWithPredicate:v6];
  return v11;
}

double _TIGetMockingAnalyticsServiceSumFloatField(void *a1, void *a2)
{
  uint64_t v3 = (void *)__analyticsServiceMock;
  id v4 = a2;
  id v5 = a1;
  id v6 = [v3 provider];
  id v7 = [(id)*MEMORY[0x263F7E708] stringByAppendingFormat:@".%@", v5];

  [v6 sumFloatField:v4 forEvent:v7];
  double v9 = v8;

  return v9;
}

double _TIGetMockingAnalyticsServiceSumFloatFieldWithPredicate(void *a1, void *a2, void *a3)
{
  id v5 = (void *)__analyticsServiceMock;
  id v6 = a3;
  id v7 = a2;
  id v8 = a1;
  double v9 = [v5 provider];
  char v10 = [(id)*MEMORY[0x263F7E708] stringByAppendingFormat:@".%@", v8];

  [v9 sumFloatField:v7 forEvent:v10 filteredWithPredicate:v6];
  double v12 = v11;

  return v12;
}

void _TIMockingAnalyticsServiceClear()
{
  id v0 = [(id)__analyticsServiceMock provider];
  [v0 clear];
}

void sub_23F015088(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23F015544(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23F015790(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23F015B7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23F015D98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23F015F9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23F0161E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

double std::normal_distribution<double>::operator()<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>(uint64_t a1, std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *this, double *a3)
{
  if (*(unsigned char *)(a1 + 24))
  {
    *(unsigned char *)(a1 + 24) = 0;
    double v5 = *(double *)(a1 + 16);
  }
  else
  {
    do
    {
      do
      {
        double v7 = (double)std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(this);
        double v8 = (v7
            + (double)std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(this)
            * 4294967300.0)
           * 5.42101086e-20
           * 2.0
           + -1.0;
        double v9 = (double)std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(this);
        double v10 = (v9
             + (double)std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(this)
             * 4294967300.0)
            * 5.42101086e-20
            * 2.0
            + -1.0;
        double v11 = v10 * v10 + v8 * v8;
      }
      while (v11 > 1.0);
    }
    while (v11 == 0.0);
    double v12 = sqrt(log(v10 * v10 + v8 * v8) * -2.0 / v11);
    *(double *)(a1 + 16) = v10 * v12;
    *(unsigned char *)(a1 + 24) = 1;
    double v5 = v8 * v12;
  }
  return *a3 + v5 * a3[1];
}

double std::gamma_distribution<double>::operator()<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>(std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *this, double *a2)
{
  double v4 = *a2;
  if (*a2 == 1.0)
  {
    double v5 = (double)std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(this);
    std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type v6 = std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(this);
    double v7 = -log((v5 + (double)v6 * 4294967300.0) * -5.42101086e-20 + 1.0);
  }
  else if (*a2 <= 1.0)
  {
    double v21 = 1.0 - v4;
    do
    {
      while (1)
      {
        double v22 = (double)std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(this);
        double v23 = (v22
             + (double)std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(this)
             * 4294967300.0)
            * 5.42101086e-20
            + 0.0;
        double v24 = (double)std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(this);
        std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type v25 = std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(this);
        double v26 = -log(1.0 - (v24 + (double)v25 * 4294967300.0) * 5.42101086e-20);
        if (v23 <= v21) {
          break;
        }
        double v27 = log((1.0 - v23) / v4);
        double v7 = pow(v21 - v4 * v27, 1.0 / v4);
        if (v7 <= v26 - v27) {
          return v7 * a2[1];
        }
      }
      double v28 = pow(v23, 1.0 / v4);
    }
    while (v28 > v26);
    double v7 = v28;
  }
  else
  {
    double v9 = v4 + -1.0;
    double v10 = v4 * 3.0 + -0.75;
    while (1)
    {
      do
      {
        double v11 = (double)std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(this);
        double v12 = (v11
             + (double)std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(this)
             * 4294967300.0)
            * 5.42101086e-20
            + 0.0;
        std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type v13 = std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(this);
        std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type v14 = std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(this);
        double v15 = v12 * (1.0 - v12);
      }
      while (v15 == 0.0);
      double v16 = (v12 + -0.5) * sqrt(v10 / v15);
      double v7 = v9 + v16;
      if (v9 + v16 >= 0.0)
      {
        double v17 = ((double)v13 + (double)v14 * 4294967300.0) * 5.42101086e-20 + 0.0;
        double v18 = v17 * (v17 * (v15 * (v15 * (v15 * 64.0))));
        if (v18 <= 1.0 - v16 * (v16 + v16) / v7) {
          break;
        }
        double v19 = log(v18);
        long double v20 = log(v7 / v9);
        if (v19 <= -(v16 - v9 * v20) - (v16 - v9 * v20)) {
          break;
        }
      }
    }
  }
  return v7 * a2[1];
}

void sub_23F016BB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23F016DD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23F016F10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23F016FA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23F01710C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23F017564(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_23F0178A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_23F017C7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_23F017E68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_23F017F90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type v14 = v11;

  _Unwind_Resume(a1);
}

void sub_23F018098(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23F018160(_Unwind_Exception *a1)
{
  double v4 = v3;

  _Unwind_Resume(a1);
}

void sub_23F01842C(_Unwind_Exception *a1)
{
  double v7 = v4;

  _Unwind_Resume(a1);
}

void sub_23F018598(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23F0186A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23F018A7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_23F019F0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_23F01A650(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23F01A794(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_23F01AC10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
}

void sub_23F01AEE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
}

void sub_23F01B098(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23F01B734(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23F01B844(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23F01B9FC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23F01BBD4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23F01BEA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
}

void sub_23F01C174(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
}

void sub_23F01C36C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_23F01C560(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_23F01C69C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void _TIBeginMockingUserModelDataStore()
{
  id v0 = objc_alloc_init(TIUserModelDataStoreMock);
  if (objc_opt_respondsToSelector()) {
    [MEMORY[0x263F7E6E0] performSelector:sel_setSharedTIUserModelDataStore_ withObject:v0];
  }
}

uint64_t _TIEndMockingUserModelDataStore()
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    id v1 = (void *)MEMORY[0x263F7E6E0];
    return [v1 performSelector:sel_setSharedUserModelDataStore_ withObject:0];
  }
  return result;
}

void _TIMockingUserModelDataStoreClear()
{
  id v0 = [MEMORY[0x263F7E6E0] sharedUserModelDataStore];
  if (objc_opt_respondsToSelector()) {
    [v0 performSelector:sel_clear withObject:0];
  }
}

void sub_23F01CF68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void TI::CP::CPEval::load_language_resources(TI::CP::CPEval *this, NSString *a2, NSString *a3, double a4)
{
  double v7 = a2;
  double v8 = a3;
  double v9 = v7;
  std::string::basic_string[abi:nn180100]<0>(&v25, (char *)[(NSString *)v9 UTF8String]);
  double v10 = (void **)((char *)this + 48);
  if (*((char *)this + 71) < 0) {
    operator delete(*v10);
  }
  *(_OWORD *)double v10 = v25;
  *((void *)this + 8) = v26;
  if (v8)
  {
    float v11 = a4;
    TI::CP::createAndLoadDictionaryContainerMultiLexicon((TI::CP *)v9, v8, 0, v11, (void ***)&v25);
    std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type v13 = (unsigned int *)*((void *)this + 9);
    *((void *)this + 9) = v25;
    if (v13) {
      WTF::RefCounted<KB::DictionaryContainer>::deref(v13);
    }
    if (*((unsigned char *)this + 160)) {
      TI::CP::createAndLoadLanguageModelContainer((TI::CP *)v9, v8, 0, v11, v12);
    }
  }
  else
  {
    __createAndLoadDictionaryContainer(v9, 0, (void ***)&v25);
    std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type v14 = (unsigned int *)*((void *)this + 9);
    *((void *)this + 9) = v25;
    if (v14) {
      WTF::RefCounted<KB::DictionaryContainer>::deref(v14);
    }
    if (*((unsigned char *)this + 160)) {
      TI::CP::createAndLoadLanguageModel((TI::CP *)v9, 0, 0);
    }
  }
  std::allocate_shared[abi:nn180100]<KB::UnigramCandidateRefinery,std::allocator<KB::UnigramCandidateRefinery>,WTF::RefPtr<KB::DictionaryContainer> const&,void>(&v25, *((atomic_uint **)this + 9));
  double v15 = (std::__shared_weak_count *)*((void *)this + 15);
  *((_OWORD *)this + 7) = v25;
  if (v15) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v15);
  }
  TI::Favonius::UnigramTypingModel::create();
  double v16 = (unsigned int *)*((void *)this + 12);
  uint64_t v17 = v25;
  *(void *)&long long v25 = 0;
  *((void *)this + 12) = v17;
  if (v16)
  {
    unsigned int v18 = atomic_load(v16 + 2);
    if (v18 == 1) {
      (*(void (**)(unsigned int *))(*(void *)v16 + 40))(v16);
    }
    else {
      atomic_fetch_add((atomic_uint *volatile)v16 + 2, 0xFFFFFFFF);
    }
    if ((void)v25)
    {
      unsigned int v19 = atomic_load((unsigned int *)(v25 + 8));
      if (v19 == 1) {
        (*(void (**)(void))(*(void *)v25 + 40))(v25);
      }
      else {
        atomic_fetch_add((atomic_uint *volatile)(v25 + 8), 0xFFFFFFFF);
      }
    }
  }
  TI::Favonius::UnigramCandidateGenerator::create();
  long double v20 = (unsigned int *)*((void *)this + 13);
  uint64_t v21 = v25;
  *(void *)&long long v25 = 0;
  *((void *)this + 13) = v21;
  if (v20)
  {
    unsigned int v22 = atomic_load(v20 + 2);
    if (v22 == 1) {
      (*(void (**)(unsigned int *))(*(void *)v20 + 8))(v20);
    }
    else {
      atomic_fetch_add((atomic_uint *volatile)v20 + 2, 0xFFFFFFFF);
    }
    if ((void)v25)
    {
      unsigned int v23 = atomic_load((unsigned int *)(v25 + 8));
      if (v23 == 1) {
        (*(void (**)(void))(*(void *)v25 + 8))(v25);
      }
      else {
        atomic_fetch_add((atomic_uint *volatile)(v25 + 8), 0xFFFFFFFF);
      }
    }
  }
  double v24 = (std::__shared_weak_count *)*((void *)this + 11);
  *((void *)this + 10) = 0;
  *((void *)this + 11) = 0;
  if (v24) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v24);
  }
}

void sub_23F01EED0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *std::allocate_shared[abi:nn180100]<KB::UnigramCandidateRefinery,std::allocator<KB::UnigramCandidateRefinery>,WTF::RefPtr<KB::DictionaryContainer> const&,void>(void *a1, atomic_uint *a2)
{
  uint64_t result = operator new(0x28uLL);
  result[1] = 0;
  result[2] = 0;
  *uint64_t result = &unk_26F2B7630;
  result[3] = MEMORY[0x263F7EBC8] + 16;
  result[4] = a2;
  if (a2) {
    atomic_fetch_add(a2, 1u);
  }
  *a1 = result + 3;
  a1[1] = result;
  return result;
}

uint64_t std::__shared_ptr_emplace<KB::UnigramCandidateRefinery>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void std::__shared_ptr_emplace<KB::UnigramCandidateRefinery>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26F2B7630;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x2455C26F0);
}

void std::__shared_ptr_emplace<KB::UnigramCandidateRefinery>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26F2B7630;
  std::__shared_weak_count::~__shared_weak_count(this);
}

TI::CP::CPEval *TI::CP::CPEval::CPEval(TI::CP::CPEval *this, NSString *a2)
{
  uint64_t v3 = a2;
  *(void *)this = &unk_26F2B7818;
  *((unsigned char *)this + 8) = 0;
  TI::CP::ShapeStoreConfiguration::default_config((TI::CP::CPEval *)((char *)this + 16));
  *((_DWORD *)this + 10) = 0;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_OWORD *)this + 7) = 0u;
  *((_OWORD *)this + 8) = xmmword_23F04A3F0;
  *((_DWORD *)this + 36) = 1028443341;
  *(void *)((char *)this + 148) = 0x300000000;
  *((unsigned char *)this + 160) = 1;
  *((void *)this + 21) = 0;
  *((void *)this + 22) = 0xF00000002;
  (*(void (**)(TI::CP::CPEval *, NSString *, void, double))(*(void *)this + 16))(this, v3, 0, 0.0);

  return this;
}

void sub_23F01F198(_Unwind_Exception *a1)
{
  std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type v6 = *(std::__shared_weak_count **)(v2 + 120);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v6);
  }
  double v7 = *(unsigned int **)(v2 + 104);
  if (v7)
  {
    unsigned int v8 = atomic_load(v7 + 2);
    if (v8 == 1) {
      (*(void (**)(unsigned int *))(*(void *)v7 + 8))(v7);
    }
    else {
      atomic_fetch_add((atomic_uint *volatile)v7 + 2, 0xFFFFFFFF);
    }
  }
  double v9 = *(unsigned int **)(v2 + 96);
  if (v9)
  {
    unsigned int v10 = atomic_load(v9 + 2);
    if (v10 == 1) {
      (*(void (**)(unsigned int *))(*(void *)v9 + 40))(v9);
    }
    else {
      atomic_fetch_add((atomic_uint *volatile)v9 + 2, 0xFFFFFFFF);
    }
  }
  float v11 = *(std::__shared_weak_count **)(v2 + 88);
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v11);
  }
  double v12 = *(unsigned int **)(v2 + 72);
  if (v12) {
    WTF::RefCounted<KB::DictionaryContainer>::deref(v12);
  }
  if (*(char *)(v2 + 71) < 0) {
    operator delete(*v4);
  }
  TI::CP::ShapeStoreConfiguration::~ShapeStoreConfiguration(v3);

  _Unwind_Resume(a1);
}

TI::CP::CPEval *TI::CP::CPEval::CPEval(TI::CP::CPEval *this, NSString *a2, NSString *a3, double a4)
{
  double v7 = a2;
  unsigned int v8 = a3;
  *(void *)this = &unk_26F2B7818;
  *((unsigned char *)this + 8) = 0;
  TI::CP::ShapeStoreConfiguration::default_config((TI::CP::CPEval *)((char *)this + 16));
  *((_DWORD *)this + 10) = 0;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_OWORD *)this + 7) = 0u;
  *((_OWORD *)this + 8) = xmmword_23F04A3F0;
  *((_DWORD *)this + 36) = 1028443341;
  *(void *)((char *)this + 148) = 0x300000000;
  *((unsigned char *)this + 160) = 1;
  *((void *)this + 21) = 0;
  *((void *)this + 22) = 0xF00000002;
  (*(void (**)(TI::CP::CPEval *, NSString *, NSString *, double))(*(void *)this + 16))(this, v7, v8, a4);

  return this;
}

void sub_23F01F390(_Unwind_Exception *a1)
{
  double v7 = *(std::__shared_weak_count **)(v3 + 120);
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v7);
  }
  unsigned int v8 = *(unsigned int **)(v3 + 104);
  if (v8)
  {
    unsigned int v9 = atomic_load(v8 + 2);
    if (v9 == 1) {
      (*(void (**)(unsigned int *))(*(void *)v8 + 8))(v8);
    }
    else {
      atomic_fetch_add((atomic_uint *volatile)v8 + 2, 0xFFFFFFFF);
    }
  }
  unsigned int v10 = *(unsigned int **)(v3 + 96);
  if (v10)
  {
    unsigned int v11 = atomic_load(v10 + 2);
    if (v11 == 1) {
      (*(void (**)(unsigned int *))(*(void *)v10 + 40))(v10);
    }
    else {
      atomic_fetch_add((atomic_uint *volatile)v10 + 2, 0xFFFFFFFF);
    }
  }
  double v12 = *(std::__shared_weak_count **)(v3 + 88);
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v12);
  }
  std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type v13 = *(unsigned int **)(v3 + 72);
  if (v13) {
    WTF::RefCounted<KB::DictionaryContainer>::deref(v13);
  }
  if (*(char *)(v3 + 71) < 0) {
    operator delete(*v5);
  }
  TI::CP::ShapeStoreConfiguration::~ShapeStoreConfiguration(v4);

  _Unwind_Resume(a1);
}

uint64_t TI::CP::CPEval::is_match(TI::CP::CPEval *this, const KB::Candidate *a2, const KB::String *a3)
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  KB::Candidate::Candidate((KB::Candidate *)&v46, a2);
  if (*((_DWORD *)this + 39))
  {
    KB::Candidate::Candidate((KB::Candidate *)&v32, (const KB::Word *)(*((void *)a2 + 1) + 240 * *(void *)a2 - 240));
    uint64_t v6 = v46;
    double v7 = v47;
    unsigned int v8 = v33;
    uint64_t v46 = v32;
    uint64_t v32 = v6;
    if (v47 == v49)
    {
      if (v33 == v35)
      {
        for (uint64_t i = 0; i != 720; ++i)
        {
          char v14 = v7[i];
          v7[i] = v8[i];
          v8[i] = v14;
        }
      }
      else
      {
        uint64_t v9 = 0;
        uint64_t v47 = v33;
        long long v33 = v35;
        do
        {
          char v10 = v7[v9];
          v7[v9] = v35[v9];
          v35[v9++] = v10;
        }
        while (v9 != 720);
      }
    }
    else if (v33 == v35)
    {
      uint64_t v11 = 0;
      long long v33 = v47;
      uint64_t v47 = v49;
      do
      {
        char v12 = v49[v11];
        v49[v11] = v8[v11];
        v8[v11++] = v12;
      }
      while (v11 != 720);
    }
    else
    {
      uint64_t v47 = v33;
      long long v33 = v7;
    }
    uint64_t v15 = v34;
    uint64_t v34 = v48;
    long long v50 = v36;
    long long v51 = v37;
    uint64_t v48 = v15;
    uint64_t v52 = v38;
    KB::LanguageModelContext::operator=((uint64_t)&v53, v39);
    KB::String::operator=();
    if (SHIBYTE(v55) < 0) {
      operator delete((void *)__p);
    }
    long long __p = v40;
    uint64_t v55 = v41;
    HIBYTE(v41) = 0;
    LOBYTE(v40) = 0;
    KB::ByteString::operator=();
    long long v56 = v42;
    if (cf) {
      CFRelease(cf);
    }
    double v16 = v43;
    long long v43 = 0;
    CFTypeRef cf = v16;
    if (v58) {
      CFRelease(v58);
    }
    uint64_t v17 = v44;
    uint64_t v44 = 0;
    CFTypeRef v58 = v17;
    int v59 = v45;
    MEMORY[0x2455C2430](&v32);
  }
  int v18 = *((_DWORD *)this + 44);
  if (!v18)
  {
    KB::Candidate::capitalized_string(&v32, (KB::Candidate *)&v46);
    if (&v32 == (uint64_t *)a3)
    {
      uint64_t v21 = 1;
      goto LABEL_28;
    }
    uint64_t v20 = KB::String::equal(a3, (const KB::String *)&v32);
LABEL_27:
    uint64_t v21 = v20;
LABEL_28:
    KB::String::~String((KB::String *)&v32);
LABEL_41:
    long long v25 = 0;
    int v30 = 0;
    goto LABEL_42;
  }
  if (v18 != 1)
  {
    if (v18 != 2)
    {
      uint64_t v21 = 0;
      goto LABEL_41;
    }
    uint64_t v19 = *(void *)(*((void *)this + 9) + 8);
    KB::Candidate::capitalized_string(&v32, (KB::Candidate *)&v46);
    uint64_t v20 = KB::CollatorWrapper::sortkey_equal_strings((KB::CollatorWrapper *)(v19 + 72), (const KB::String *)&v32, a3);
    goto LABEL_27;
  }
  unsigned int v22 = (const char *)*((void *)a3 + 1);
  if (!v22) {
    unsigned int v22 = (char *)a3 + 16;
  }
  if (*(_WORD *)a3) {
    unsigned int v23 = v22;
  }
  else {
    unsigned int v23 = "";
  }
  double v24 = [NSString stringWithUTF8String:v23];
  long long v25 = [v24 lowercaseString];

  uint64_t v26 = NSString;
  KB::Candidate::capitalized_string(&v32, (KB::Candidate *)&v46);
  double v27 = v33;
  if (!v33) {
    double v27 = (const char *)&v34;
  }
  if ((_WORD)v32) {
    double v28 = v27;
  }
  else {
    double v28 = "";
  }
  uint64_t v29 = [v26 stringWithUTF8String:v28];
  int v30 = [v29 lowercaseString];

  KB::String::~String((KB::String *)&v32);
  uint64_t v21 = [v25 isEqualToString:v30];
LABEL_42:
  MEMORY[0x2455C2430](&v46);

  return v21;
}

void sub_23F01F804(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  KB::String::~String((KB::String *)va);
  MEMORY[0x2455C2430](&STACK[0x3F0]);
  _Unwind_Resume(a1);
}

KB::Candidate *KB::Candidate::Candidate(KB::Candidate *this, const KB::Word *a2)
{
  *(void *)this = 0;
  *((void *)this + 1) = (char *)this + 24;
  *((void *)this + 2) = 3;
  *(_OWORD *)((char *)this + 744) = xmmword_23F04A410;
  *((void *)this + 95) = 0xFF8000003F800000;
  *((void *)this + 105) = 0;
  *(_OWORD *)((char *)this + 776) = 0u;
  *(_OWORD *)((char *)this + 792) = 0u;
  *(_OWORD *)((char *)this + 808) = 0u;
  *(_OWORD *)((char *)this + 824) = 0u;
  language_modeling::v1::LinguisticContext::LinguisticContext((KB::Candidate *)((char *)this + 848));
  language_modeling::v1::LinguisticContext::LinguisticContext((KB::Candidate *)((char *)this + 856));
  *((void *)this + 109) = 0;
  *((void *)this + 108) = 0;
  *((void *)this + 110) = 0;
  KB::String::String((KB::Candidate *)((char *)this + 888));
  *((_WORD *)this + 472) = 0;
  *((void *)this + 117) = 0;
  *(_OWORD *)((char *)this + 920) = 0u;
  *((_DWORD *)this + 240) = 0;
  *((unsigned char *)this + 964) = 0;
  *((_OWORD *)this + 61) = 0u;
  *((_DWORD *)this + 248) = 0;
  KB::Candidate::append();
  return this;
}

void sub_23F01F960(_Unwind_Exception *a1)
{
  double v5 = *(const void **)(v1 + 984);
  if (v5) {
    CFRelease(v5);
  }
  *(void *)(v1 + 984) = 0;
  uint64_t v6 = *(const void **)(v1 + 976);
  if (v6) {
    CFRelease(v6);
  }
  *(void *)(v1 + 976) = 0;
  if (*(unsigned __int16 *)(v1 + 944) >= 0xFu)
  {
    uint64_t v7 = *(void *)(v1 + 952);
    if (v7) {
      MEMORY[0x2455C26D0](v7, 0x1000C8077774924);
    }
  }
  if (*(char *)(v1 + 943) < 0) {
    operator delete(*v3);
  }
  KB::String::~String(v2);
  KB::LanguageModelContext::~LanguageModelContext((KB::LanguageModelContext *)(v1 + 784));
  WTF::Vector<KB::Word,3ul>::~Vector((uint64_t *)v1);
  _Unwind_Resume(a1);
}

uint64_t TI::CP::CPEval::match_index(TI::CP::CPEval *this, const KB::String *a2, const KB::Candidate **a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  double v5 = *a3;
  uint64_t v6 = a3[1];
  MEMORY[0x2455C23B0](v8, a2);
  uint64_t v9 = this;
  if (v5 != v6)
  {
    while ((TI::CP::CPEval::is_match(v9, v5, (const KB::String *)v8) & 1) == 0)
    {
      double v5 = (const KB::Candidate *)((char *)v5 + 1000);
      if (v5 == v6)
      {
        double v5 = v6;
        break;
      }
    }
  }
  KB::String::~String((KB::String *)v8);
  if (v5 == a3[1]) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 652835029 * ((unint64_t)(v5 - *a3) >> 3);
  }
}

void sub_23F01FAB4(_Unwind_Exception *exception_object)
{
}

const std::string *TI::CP::CPEval::create_recognizer_for_config@<X0>(const std::string *result@<X0>, int a2@<W1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  *a4 = 0;
  switch(a2)
  {
    case 0:
      operator new();
    case 1:
      operator new();
    case 2:
      operator new();
    case 3:
      std::string::operator=((std::string *)(a3 + 104), result + 2);
      operator new();
    default:
      return result;
  }
}

void sub_23F020180(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, unsigned int *a11, unsigned int *a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,void *__p,uint64_t a52,int a53,__int16 a54,char a55,char a56,void *a57,uint64_t a58,int a59,__int16 a60,char a61,char a62)
{
  if (a56 < 0) {
    operator delete(__p);
  }
  if (a11)
  {
    unsigned int v65 = atomic_load(a11 + 2);
    if (v65 == 1) {
      (*(void (**)(void))(*(void *)a11 + 8))();
    }
    else {
      atomic_fetch_add((atomic_uint *volatile)a11 + 2, 0xFFFFFFFF);
    }
  }
  if (a12)
  {
    unsigned int v66 = atomic_load(a12 + 2);
    if (v66 == 1) {
      (*(void (**)(void))(*(void *)a12 + 40))();
    }
    else {
      atomic_fetch_add((atomic_uint *volatile)a12 + 2, 0xFFFFFFFF);
    }
  }
  MEMORY[0x2455C26F0](v63, 0x10B3C40F00FAD0FLL);
  uint64_t v67 = *v62;
  *uint64_t v62 = 0;
  if (v67) {
    (*(void (**)(uint64_t))(*(void *)v67 + 8))(v67);
  }
  _Unwind_Resume(a1);
}

void sub_23F020448(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:nn180100](a10);
  }
  JUMPOUT(0x23F020404);
}

void TI::CP::PathResampler::~PathResampler(TI::CP::PathResampler *this)
{
  uint64_t v2 = (void *)*((void *)this + 14);
  if (v2)
  {
    *((void *)this + 15) = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)*((void *)this + 11);
  if (v3)
  {
    *((void *)this + 12) = v3;
    operator delete(v3);
  }
  uint64_t v4 = (void *)*((void *)this + 8);
  if (v4)
  {
    *((void *)this + 9) = v4;
    operator delete(v4);
  }
  double v5 = (void *)*((void *)this + 5);
  if (v5)
  {
    *((void *)this + 6) = v5;
    operator delete(v5);
  }
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,TI::CP::ShapeRecord>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,TI::CP::ShapeRecord>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,TI::CP::ShapeRecord>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,TI::CP::ShapeRecord>>>::~__hash_table(uint64_t a1)
{
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2)
  {
    do
    {
      uint64_t v3 = (void **)*v2;
      if (*((char *)v2 + 143) < 0) {
        operator delete(v2[15]);
      }
      uint64_t v4 = v2[12];
      if (v4)
      {
        v2[13] = v4;
        operator delete(v4);
      }
      double v5 = v2[9];
      if (v5)
      {
        v2[10] = v5;
        operator delete(v5);
      }
      if (*((char *)v2 + 71) < 0) {
        operator delete(v2[6]);
      }
      if (*((char *)v2 + 39) < 0) {
        operator delete(v2[2]);
      }
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = 0;
  if (v6) {
    operator delete(v6);
  }
  return a1;
}

void TI::CP::PathReducer::~PathReducer(TI::CP::PathReducer *this)
{
  uint64_t v2 = (void *)*((void *)this + 8);
  if (v2)
  {
    *((void *)this + 9) = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)*((void *)this + 5);
  if (v3)
  {
    *((void *)this + 6) = v3;
    operator delete(v3);
  }
  uint64_t v4 = (void *)*((void *)this + 2);
  if (v4)
  {
    *((void *)this + 3) = v4;
    operator delete(v4);
  }
}

uint64_t TI::CP::TIPathRecognizerInterface::remove_shapes_older_than(TI::CP::TIPathRecognizerInterface *this, double a2)
{
  return 1;
}

uint64_t TI::CP::TIPathRecognizerInterface::usage_count(TI::CP::TIPathRecognizerInterface *this)
{
  return 0;
}

void TI::CP::CPEval::evaluate_records(std::string *a1@<X0>, uint64_t *a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  *(void *)a5 = 0;
  *(void *)(a5 + 8) = 0;
  *(void *)(a5 + 16) = 0;
  *(_DWORD *)(a5 + 24) = -1;
  uint64_t v9 = (void *)MEMORY[0x2455C2B00]();
  long long v10 = *(_OWORD *)(a4 + 80);
  v43[4] = *(_OWORD *)(a4 + 64);
  v43[5] = v10;
  uint64_t v44 = *(void *)(a4 + 96);
  long long v11 = *(_OWORD *)(a4 + 16);
  v43[0] = *(_OWORD *)a4;
  v43[1] = v11;
  long long v12 = *(_OWORD *)(a4 + 48);
  void v43[2] = *(_OWORD *)(a4 + 32);
  v43[3] = v12;
  if (*(char *)(a4 + 127) < 0) {
    std::string::__init_copy_ctor_external(&v45, *(const std::string::value_type **)(a4 + 104), *(void *)(a4 + 112));
  }
  else {
    std::string v45 = *(std::string *)(a4 + 104);
  }
  if (*(char *)(a4 + 151) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(a4 + 128), *(void *)(a4 + 136));
  }
  else {
    std::string __p = *(std::string *)(a4 + 128);
  }
  __int16 v47 = *(_WORD *)(a4 + 152);
  char v48 = *(unsigned char *)(a4 + 154);
  MEMORY[0x2455C23B0](v49, a4 + 160);
  long long v13 = *(_OWORD *)(a4 + 336);
  v49[10] = *(_OWORD *)(a4 + 320);
  v49[11] = v13;
  uint64_t v50 = *(void *)(a4 + 352);
  long long v14 = *(_OWORD *)(a4 + 272);
  v49[6] = *(_OWORD *)(a4 + 256);
  v49[7] = v14;
  long long v15 = *(_OWORD *)(a4 + 304);
  v49[8] = *(_OWORD *)(a4 + 288);
  v49[9] = v15;
  long long v16 = *(_OWORD *)(a4 + 208);
  v49[2] = *(_OWORD *)(a4 + 192);
  v49[3] = v16;
  long long v17 = *(_OWORD *)(a4 + 240);
  v49[4] = *(_OWORD *)(a4 + 224);
  v49[5] = v17;
  TI::CP::CPEval::create_recognizer_for_config(a1, a3, (uint64_t)v43, &v31);
  KB::String::~String((KB::String *)v49);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v45.__r_.__value_.__l.__data_);
  }
  uint64_t v29 = v31;
  if (v31)
  {
    uint64_t v18 = *a2;
    if (a2[1] != *a2)
    {
      uint64_t v19 = 0;
      unint64_t v20 = 0;
      do
      {
        TI::CP::CPEval::evaluate_test_case((TI::CP::CPEval *)a1, (const TI::CP::ContinuousPathTestCase *)(v18 + v19), (TI::CP::TIPathRecognizerInterface *)v29, v20, (uint64_t)v37);
        unint64_t v22 = *(void *)(a5 + 8);
        unint64_t v21 = *(void *)(a5 + 16);
        if (v22 >= v21)
        {
          uint64_t v24 = 0x34F72C234F72C235 * ((uint64_t)(v22 - *(void *)a5) >> 3);
          unint64_t v25 = v24 + 1;
          if ((unint64_t)(v24 + 1) > 0x11A7B9611A7B961) {
            abort();
          }
          unint64_t v26 = 0x34F72C234F72C235 * ((uint64_t)(v21 - *(void *)a5) >> 3);
          if (2 * v26 > v25) {
            unint64_t v25 = 2 * v26;
          }
          if (v26 >= 0x8D3DCB08D3DCB0) {
            unint64_t v27 = 0x11A7B9611A7B961;
          }
          else {
            unint64_t v27 = v25;
          }
          uint64_t v36 = a5 + 16;
          if (v27) {
            unint64_t v27 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<TI::CP::ContinuousPathTestResult>>(v27);
          }
          else {
            uint64_t v28 = 0;
          }
          uint64_t v32 = (void **)v27;
          long long v33 = (TI::CP::ContinuousPathTestResult *)(v27 + 232 * v24);
          uint64_t v34 = v33;
          unint64_t v35 = v27 + 232 * v28;
          TI::CP::ContinuousPathTestResult::ContinuousPathTestResult(v33, (const TI::CP::ContinuousPathTestResult *)v37);
          uint64_t v34 = (TI::CP::ContinuousPathTestResult *)((char *)v34 + 232);
          std::vector<TI::CP::ContinuousPathTestResult>::__swap_out_circular_buffer((uint64_t *)a5, &v32);
          unint64_t v23 = *(void *)(a5 + 8);
          std::__split_buffer<TI::CP::ContinuousPathTestResult>::~__split_buffer((uint64_t)&v32);
        }
        else
        {
          TI::CP::ContinuousPathTestResult::ContinuousPathTestResult(*(TI::CP::ContinuousPathTestResult **)(a5 + 8), (const TI::CP::ContinuousPathTestResult *)v37);
          unint64_t v23 = v22 + 232;
          *(void *)(a5 + 8) = v23;
        }
        *(void *)(a5 + 8) = v23;
        std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::destroy(v42[9]);
        uint64_t v32 = (void **)v42;
        std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v32);
        uint64_t v32 = (void **)&v41;
        std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v32);
        uint64_t v32 = (void **)&v40;
        std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v32);
        uint64_t v32 = (void **)&v39;
        std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v32);
        KB::String::~String((KB::String *)&v38);
        ++v20;
        uint64_t v18 = *a2;
        v19 += 240;
      }
      while (0xEEEEEEEEEEEEEEEFLL * ((a2[1] - *a2) >> 4) > v20);
    }
    if (a3 == 2) {
      *(_DWORD *)(a5 + 24) = TI::CP::ShapeStore::num_records((TI::CP::ShapeStore *)(v29 + 208));
    }
    (*(void (**)(uint64_t))(*(void *)v29 + 8))(v29);
  }
}

void sub_23F0209BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  (*(void (**)(uint64_t))(*(void *)a5 + 8))(a5);
  std::vector<TI::CP::ContinuousPathTestResult>::__destroy_vector::operator()[abi:nn180100]((void ***)va);
  _Unwind_Resume(a1);
}

void TI::CP::CPEval::evaluate_test_case(TI::CP::CPEval *this@<X0>, const TI::CP::ContinuousPathTestCase *a2@<X1>, TI::CP::TIPathRecognizerInterface *a3@<X2>, int a4@<W3>, uint64_t a5@<X8>)
{
  void v38[4] = *MEMORY[0x263EF8340];
  (*(void (**)(TI::CP::TIPathRecognizerInterface *))(*(void *)a3 + 56))(a3);
  *((_DWORD *)this + 39) = 0;
  if (*((unsigned char *)this + 160))
  {
    (*(void (**)(TI::CP::TIPathRecognizerInterface *, char *))(*(void *)a3 + 120))(a3, (char *)a2 + 88);
  }
  else
  {
    uint64_t v36 = 0;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    *(_OWORD *)int v30 = 0u;
    *(_OWORD *)std::string __p = 0u;
    language_modeling::v1::LinguisticContext::LinguisticContext((language_modeling::v1::LinguisticContext *)&v34);
    language_modeling::v1::LinguisticContext::LinguisticContext((language_modeling::v1::LinguisticContext *)((char *)&v34 + 8));
    long long v35 = 0uLL;
    uint64_t v36 = 0;
    (*(void (**)(TI::CP::TIPathRecognizerInterface *, void **))(*(void *)a3 + 120))(a3, v30);
    long long v37 = (void **)&v35;
    std::vector<std::string>::__destroy_vector::operator()[abi:nn180100](&v37);
    language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)((char *)&v34 + 8));
    language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)&v34);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (v30[1]) {
      std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)v30[1]);
    }
  }
  uint64_t v9 = *(atomic_uint **)a2;
  if (*(void *)a2)
  {
    atomic_fetch_add(v9, 1u);
    if (*((atomic_uint **)a3 + 1) == v9)
    {
LABEL_12:
      WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref((unsigned int *)v9);
      goto LABEL_13;
    }
    atomic_fetch_add(v9, 1u);
    long long v10 = (unsigned int *)*((void *)a3 + 1);
    *((void *)a3 + 1) = v9;
    if (!v10)
    {
LABEL_11:
      (*(void (**)(TI::CP::TIPathRecognizerInterface *))(*(void *)a3 + 152))(a3);
      if (!v9) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
LABEL_10:
    WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(v10);
    goto LABEL_11;
  }
  long long v10 = (unsigned int *)*((void *)a3 + 1);
  if (v10)
  {
    *((void *)a3 + 1) = 0;
    goto LABEL_10;
  }
LABEL_13:
  if ((*(unsigned int (**)(TI::CP::TIPathRecognizerInterface *))(*(void *)a3 + 16))(a3) == 2)
  {
    long long v11 = (char *)*((void *)a2 + 8);
    if (!v11) {
      long long v11 = (char *)a2 + 72;
    }
    if (*((_WORD *)a2 + 28)) {
      long long v12 = v11;
    }
    else {
      long long v12 = "";
    }
    std::string::basic_string[abi:nn180100]<0>(v30, v12);
    int v13 = TI::CP::ShapeStore::shape_count_for_word();
    if (SHIBYTE(__p[0]) < 0) {
      operator delete(v30[0]);
    }
    BOOL v28 = v13 > 0;
  }
  else
  {
    BOOL v28 = 0;
  }
  uint64_t v14 = *((void *)a2 + 1);
  uint64_t v15 = *((void *)a2 + 2) - v14;
  if (v15)
  {
    unint64_t v16 = 0;
    unint64_t v17 = 0xAAAAAAAAAAAAAAABLL * (v15 >> 4);
    double v18 = INFINITY;
    unsigned int v19 = 1;
    double v20 = INFINITY;
    while (1)
    {
      if (v17 == v19) {
        unsigned int v21 = 2;
      }
      else {
        unsigned int v21 = 1;
      }
      if (v19 == 1) {
        uint64_t v22 = 0;
      }
      else {
        uint64_t v22 = v21;
      }
      (*(void (**)(TI::CP::TIPathRecognizerInterface *, uint64_t, void, double, double, double, double))(*(void *)a3 + 32))(a3, v22, 0, *(double *)(v14 + 48 * v16), *(double *)(v14 + 48 * v16 + 8), *(double *)(v14 + 48 * v16 + 16), *(double *)(v14 + 48 * v16 + 24));
      if (!*((unsigned char *)this + 8)) {
        goto LABEL_40;
      }
      HIDWORD(v36) = 0;
      *(_OWORD *)int v30 = 0u;
      *(_OWORD *)std::string __p = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      (*(void (**)(TI::CP::TIPathRecognizerInterface *, void **, void))(*(void *)a3 + 80))(a3, v30, *((unsigned int *)this + 10));
      int matched = TI::CP::CPEval::match_index(this, (const TI::CP::ContinuousPathTestCase *)((char *)a2 + 56), (const KB::Candidate **)v30);
      if (matched != -1)
      {
        if (!matched)
        {
          if (fabs(v20) == INFINITY) {
            double v20 = *(double *)(v14 + 48 * v16 + 32);
          }
LABEL_37:
          if (fabs(v18) == INFINITY) {
            double v18 = *(double *)(v14 + 48 * v16 + 32);
          }
          goto LABEL_39;
        }
        if (matched <= 2) {
          goto LABEL_37;
        }
      }
LABEL_39:
      long long v37 = (void **)&v34 + 1;
      std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v37);
      long long v37 = (void **)&v33;
      std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v37);
      long long v37 = &__p[1];
      std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v37);
      long long v37 = v30;
      std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v37);
LABEL_40:
      unint64_t v16 = v19;
      uint64_t v14 = *((void *)a2 + 1);
      unint64_t v17 = 0xAAAAAAAAAAAAAAABLL * ((*((void *)a2 + 2) - v14) >> 4);
      ++v19;
      if (v17 <= v16) {
        goto LABEL_43;
      }
    }
  }
  double v20 = INFINITY;
  double v18 = INFINITY;
LABEL_43:
  HIDWORD(v36) = 0;
  *(_OWORD *)int v30 = 0u;
  *(_OWORD *)std::string __p = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  (*(void (**)(TI::CP::TIPathRecognizerInterface *, void **, void))(*(void *)a3 + 80))(a3, v30, *((unsigned int *)this + 10));
  uint64_t v24 = *((void *)this + 14);
  if (v24)
  {
    (*(void (**)(uint64_t, void **, void))(*(void *)v24 + 64))(v24, v30, 0);
    uint64_t v25 = *((void *)this + 14);
    v38[0] = &unk_26F2B7718;
    void v38[3] = v38;
    (*(void (**)(uint64_t, void **, void *))(*(void *)v25 + 56))(v25, v30, v38);
    std::__function::__value_func<void ()(KB::Candidate &,float)>::~__value_func[abi:nn180100](v38);
    KB::CandidateCollection::normalize_scores((KB::CandidateCollection *)v30);
  }
  TI::ConfidenceModel::update_confidence_for_candidates((TI::CP::CPEval *)((char *)this + 128), (KB::CandidateCollection *)v30);
  TI::CP::CPEval::compose_result_from_candidates((KB::DictionaryContainer **)this, (const KB::Candidate **)v30, a2, a4, a5);
  uint64_t v26 = *((void *)a2 + 2);
  if (*((void *)a2 + 1) == v26) {
    uint64_t v27 = 0;
  }
  else {
    uint64_t v27 = *(void *)(v26 - 16);
  }
  *(void *)(a5 + 152) = v27;
  *(double *)(a5 + 160) = v20;
  *(double *)(a5 + 168) = v18;
  *(unsigned char *)(a5 + 220) = v28;
  *(_DWORD *)(a5 + 224) = (*(uint64_t (**)(TI::CP::TIPathRecognizerInterface *))(*(void *)a3 + 24))(a3);
  long long v37 = (void **)&v34 + 1;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v37);
  long long v37 = (void **)&v33;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v37);
  long long v37 = &__p[1];
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v37);
  long long v37 = v30;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v37);
}

void sub_23F02105C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
}

void KB::CandidateCollection::~CandidateCollection(void **this)
{
  uint64_t v2 = this + 9;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v2);
  uint64_t v2 = this + 6;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v2);
  uint64_t v2 = this + 3;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v2);
  uint64_t v2 = this;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v2);
}

void *std::__function::__value_func<void ()(KB::Candidate &,float)>::~__value_func[abi:nn180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

void TI::CP::CPEval::compose_result_from_candidates(KB::DictionaryContainer **this@<X0>, const KB::Candidate **a2@<X1>, const TI::CP::ContinuousPathTestCase *a3@<X2>, int a4@<W3>, uint64_t a5@<X8>)
{
  long long v10 = (const TI::CP::ContinuousPathTestCase *)((char *)a3 + 56);
  unsigned int matched = TI::CP::CPEval::match_index((TI::CP::CPEval *)this, (const TI::CP::ContinuousPathTestCase *)((char *)a3 + 56), a2);
  long long v12 = this[9];
  if (v12)
  {
    KB::DictionaryContainer::lookup(v12, v10);
    int v13 = v29;
    uint64_t v14 = v30;
    if (v29 == v30)
    {
      char v17 = 0;
    }
    else
    {
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      uint64_t v25 = ___ZNK2TI2CP6CPEval30compose_result_from_candidatesERKN2KB19CandidateCollectionERKNS0_22ContinuousPathTestCaseEj_block_invoke;
      uint64_t v26 = &__block_descriptor_48_e10_B16__0r_v8l;
      uint64_t v27 = (TI::CP::CPEval *)this;
      BOOL v28 = a3;
      uint64_t v15 = v24;
      do
      {
        char v16 = v25((uint64_t)v15, v13);
        char v17 = v16;
        int v13 = (const KB::Word *)((char *)v13 + 240);
        if (v13 == v14) {
          char v18 = 1;
        }
        else {
          char v18 = v16;
        }
      }
      while ((v18 & 1) == 0);
    }
    uint64_t v31 = &v29;
    std::vector<KB::Word>::__destroy_vector::operator()[abi:nn180100]((void ***)&v31);
  }
  else
  {
    char v17 = 1;
  }
  TI::CP::ContinuousPathTestResult::ContinuousPathTestResult((TI::CP::ContinuousPathTestResult *)a5, a4, v10, (const KB::CandidateCollection *)a2, matched, v17);
  if ((matched & 0x80000000) != 0)
  {
    if (*a2 != a2[1])
    {
      float v22 = expf(*((float *)*a2 + 186));
      *(double *)(a5 + 208) = logf(v22);
    }
    goto LABEL_18;
  }
  unsigned int v19 = *a2;
  float v20 = expf(*((float *)*a2 + 250 * matched + 186));
  *(double *)(a5 + 200) = logf(v20);
  if (matched)
  {
    float v21 = expf(*((float *)v19 + 186));
    *(double *)(a5 + 208) = logf(v21);
    if (matched <= 3) {
      goto LABEL_22;
    }
LABEL_18:
    if (*((_DWORD *)a2 + 24) != 2)
    {
      *(unsigned char *)(a5 + 219) = 1;
      return;
    }
    goto LABEL_24;
  }
  if ((unint64_t)(0x1CAC083126E978D5 * ((a2[1] - v19) >> 3)) >= 2)
  {
    float v23 = expf(*((float *)v19 + 436));
    *(double *)(a5 + 208) = logf(v23);
  }
LABEL_22:
  if (*((_DWORD *)a2 + 24) == 2)
  {
    *(unsigned char *)(a5 + 218) = 1;
    return;
  }
LABEL_24:
  *(unsigned char *)(a5 + 217) = 1;
}

void sub_23F0213F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, void **a18)
{
  a18 = (void **)&a15;
  std::vector<KB::Word>::__destroy_vector::operator()[abi:nn180100](&a18);
  _Unwind_Resume(a1);
}

uint64_t ___ZNK2TI2CP6CPEval30compose_result_from_candidatesERKN2KB19CandidateCollectionERKNS0_22ContinuousPathTestCaseEj_block_invoke(uint64_t a1, const KB::Word *a2)
{
  v6[125] = *MEMORY[0x263EF8340];
  uint64_t v3 = *(TI::CP::CPEval **)(a1 + 32);
  KB::Candidate::Candidate((KB::Candidate *)v6, a2);
  uint64_t is_match = TI::CP::CPEval::is_match(v3, (const KB::Candidate *)v6, (const KB::String *)(*(void *)(a1 + 40) + 56));
  MEMORY[0x2455C2430](v6);
  return is_match;
}

void std::__function::__func<TI::CP::CPEval::evaluate_test_case(TI::CP::ContinuousPathTestCase const&,TI::CP::TIPathRecognizerInterface *,unsigned int)::$_0,std::allocator<TI::CP::CPEval::evaluate_test_case(TI::CP::ContinuousPathTestCase const&,TI::CP::TIPathRecognizerInterface *,unsigned int)::$_0>,void ()(KB::Candidate &,float)>::operator()(int a1, KB::Candidate *this, float *a3)
{
  float v4 = *a3;
  float v5 = *((float *)this + 187);
  float v6 = *((float *)this + 189);
  float v7 = *((float *)this + 190);
  unsigned int v8 = (char *)this + 764;
  uint64_t v16 = *(void *)((char *)this + 764);
  int v17 = *((_DWORD *)this + 193);
  if ((KB::Candidate::has_from_named_entities(this) & 1) != 0
    || KB::Candidate::has_from_supplemental_lexicon(this))
  {
    float v4 = v4 * 0.8;
  }
  float v9 = logf(v4);
  *((float *)this + 186) = v5 + (float)(v7 * (float)(v6 + v9));
  *((float *)this + 187) = v5;
  *((float *)this + 188) = v9;
  *((float *)this + 189) = v6;
  *((float *)this + 190) = v7;
  *(void *)unsigned int v8 = v16;
  *((_DWORD *)v8 + 2) = v17;
  KB::cf_mutable_dictionary((uint64_t *)&cf, v10);
  long long v11 = (__CFDictionary *)cf;
  float v12 = expf(*((float *)this + 186));
  KB::cf_number((uint64_t *)&value, v13, v12);
  CFDictionarySetValue(v11, @"refinement_omega", value);
  if (value) {
    CFRelease(value);
  }
  KB::Candidate::add_sources_info(this, @"refinement", (const __CFDictionary *)cf);
  if (cf) {
    CFRelease(cf);
  }
}

void sub_23F0215DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, CFTypeRef a9, CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
  _Unwind_Resume(exception_object);
}

void std::__function::__func<TI::CP::CPEval::evaluate_test_case(TI::CP::ContinuousPathTestCase const&,TI::CP::TIPathRecognizerInterface *,unsigned int)::$_0,std::allocator<TI::CP::CPEval::evaluate_test_case(TI::CP::ContinuousPathTestCase const&,TI::CP::TIPathRecognizerInterface *,unsigned int)::$_0>,void ()(KB::Candidate &,float)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26F2B7718;
}

void *std::__function::__func<TI::CP::CPEval::evaluate_test_case(TI::CP::ContinuousPathTestCase const&,TI::CP::TIPathRecognizerInterface *,unsigned int)::$_0,std::allocator<TI::CP::CPEval::evaluate_test_case(TI::CP::ContinuousPathTestCase const&,TI::CP::TIPathRecognizerInterface *,unsigned int)::$_0>,void ()(KB::Candidate &,float)>::__clone()
{
  uint64_t result = operator new(0x10uLL);
  *uint64_t result = &unk_26F2B7718;
  return result;
}

void std::__function::__func<TI::CP::CPEval::evaluate_test_case(TI::CP::ContinuousPathTestCase const&,TI::CP::TIPathRecognizerInterface *,unsigned int)::$_0,std::allocator<TI::CP::CPEval::evaluate_test_case(TI::CP::ContinuousPathTestCase const&,TI::CP::TIPathRecognizerInterface *,unsigned int)::$_0>,void ()(KB::Candidate &,float)>::~__func()
{
}

void TI::CP::CPEval::evaluate_test_case_favonius(TI::CP::CPEval *this@<X0>, const TI::CP::ContinuousPathTestCase *a2@<X1>, TI::Favonius::FavoniusStrokeBuildManager *a3@<X2>, int a4@<W3>, uint64_t a5@<X8>)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  (*(void (**)(TI::Favonius::FavoniusStrokeBuildManager *))(*(void *)a3 + 352))(a3);
  (*(void (**)(TI::Favonius::FavoniusStrokeBuildManager *))(*(void *)a3 + 144))(a3);
  *((_DWORD *)this + 39) = 1;
  uint64_t v8 = *((void *)a2 + 1);
  uint64_t v9 = *((void *)a2 + 2);
  if (v9 != v8)
  {
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((v9 - v8) >> 4);
    unsigned int v11 = 1;
    do
    {
      BOOL v12 = v10 == v11 && v11 != 1;
      TI::Favonius::Touch::create();
      int v13 = v30[0];
      if (v12)
      {
        uint64_t v25 = v30[0];
        if (v30[0]) {
          atomic_fetch_add((atomic_uint *volatile)v30[0], 1u);
        }
        (*(void (**)(TI::Favonius::FavoniusStrokeBuildManager *, void ***, uint64_t, void))(*(void *)a3 + 32))(a3, &v25, 4294967294, 0);
        uint64_t v14 = (uint64_t)v25;
        if (!v25) {
          goto LABEL_15;
        }
      }
      else
      {
        uint64_t v26 = v30[0];
        if (v30[0]) {
          atomic_fetch_add((atomic_uint *volatile)v30[0], 1u);
        }
        (*(void (**)(TI::Favonius::FavoniusStrokeBuildManager *, void ***, uint64_t, void))(*(void *)a3 + 24))(a3, &v26, 4294967294, 0);
        uint64_t v14 = (uint64_t)v26;
        if (!v26) {
          goto LABEL_15;
        }
      }
      WTF::RefCounted<TI::Favonius::Touch>::deref(v14);
LABEL_15:
      if (v13) {
        WTF::RefCounted<TI::Favonius::Touch>::deref((uint64_t)v13);
      }
      unint64_t v15 = v11;
      unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a2 + 2) - *((void *)a2 + 1)) >> 4);
      ++v11;
    }
    while (v10 > v15);
  }
  KB::String::String((KB::String *)v32);
  uint64_t v16 = *((unsigned int *)this + 45);
  v31[0] = &unk_26F2B7760;
  v31[3] = v31;
  (*(void (**)(const KB::Candidate **__return_ptr, TI::Favonius::FavoniusStrokeBuildManager *, char *, char *, uint64_t, unsigned char *, uint64_t, void *, void))(*(void *)a3 + 72))(v21, a3, (char *)a2 + 192, (char *)a2 + 88, v16, v32, 5, v31, 0);
  std::__function::__value_func<void ()(KB::CandidateCollection &,KB::CandidateFilterFlags,BOOL)>::~__value_func[abi:nn180100](v31);
  if (v21[1] != v21[0])
  {
    KB::Candidate::Candidate((KB::Candidate *)v30, v21[0]);
    KB::Candidate::capitalized_string(v29, (KB::Candidate *)v30);
    KB::String::String((KB::String *)v28);
    KB::String::String((KB::String *)v27);
    uint64_t v17 = KB::Candidate::string((KB::Candidate *)v30);
    (*(void (**)(void **__return_ptr, TI::Favonius::FavoniusStrokeBuildManager *, uint64_t *, unsigned char *, unsigned char *, void, uint64_t, uint64_t))(*(void *)a3 + 104))(__p, a3, v29, v28, v27, 0, v17, 1);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    KB::String::~String((KB::String *)v27);
    KB::String::~String((KB::String *)v28);
    KB::String::~String((KB::String *)v29);
    MEMORY[0x2455C2430](v30);
  }
  TI::CP::CPEval::compose_result_from_candidates((KB::DictionaryContainer **)this, v21, a2, a4, a5);
  v30[0] = (void **)&v24;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](v30);
  v30[0] = (void **)&v23;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](v30);
  v30[0] = (void **)&v22;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](v30);
  v30[0] = (void **)v21;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](v30);
  KB::String::~String((KB::String *)v32);
}

void sub_23F021A68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44)
{
  KB::String::~String((KB::String *)&a36);
  KB::String::~String((KB::String *)&a40);
  MEMORY[0x2455C2430](&a44);
  KB::CandidateCollection::~CandidateCollection(&a17);
  KB::String::~String((KB::String *)(v44 - 128));
  _Unwind_Resume(a1);
}

uint64_t WTF::RefCounted<TI::Favonius::Touch>::deref(uint64_t result)
{
  unsigned int v1 = atomic_load((unsigned int *)result);
  if (v1 == 1)
  {
    uint64_t v2 = *(unsigned int **)(result + 56);
    if (v2) {
      WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(v2);
    }
    JUMPOUT(0x2455C26F0);
  }
  atomic_fetch_add((atomic_uint *volatile)result, 0xFFFFFFFF);
  return result;
}

void *std::__function::__value_func<void ()(KB::CandidateCollection &,KB::CandidateFilterFlags,BOOL)>::~__value_func[abi:nn180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

void std::__function::__func<TI::CP::CPEval::evaluate_test_case_favonius(TI::CP::ContinuousPathTestCase const&,TI::Favonius::FavoniusStrokeBuildManager *,unsigned int)::$_0,std::allocator<TI::CP::CPEval::evaluate_test_case_favonius(TI::CP::ContinuousPathTestCase const&,TI::Favonius::FavoniusStrokeBuildManager *,unsigned int)::$_0>,void ()(KB::CandidateCollection &,KB::CandidateFilterFlags,BOOL)>::operator()(uint64_t a1, const KB::CandidateCollection *a2, uint64_t a3)
{
  uint64_t v3 = *(void **)a3;
  *(void *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = 0;
  *(void *)a3 = 0;
  KB::CandidateCollection::CandidateCollection((KB::CandidateCollection *)v4, a2);
  if (v3) {
    operator delete(v3);
  }
  uint64_t v8 = (void **)&v7;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v8);
  uint64_t v8 = (void **)&v6;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v8);
  uint64_t v8 = (void **)&v5;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v8);
  uint64_t v8 = (void **)v4;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v8);
}

void sub_23F021C88(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void std::__function::__func<TI::CP::CPEval::evaluate_test_case_favonius(TI::CP::ContinuousPathTestCase const&,TI::Favonius::FavoniusStrokeBuildManager *,unsigned int)::$_0,std::allocator<TI::CP::CPEval::evaluate_test_case_favonius(TI::CP::ContinuousPathTestCase const&,TI::Favonius::FavoniusStrokeBuildManager *,unsigned int)::$_0>,void ()(KB::CandidateCollection &,KB::CandidateFilterFlags,BOOL)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26F2B7760;
}

void *std::__function::__func<TI::CP::CPEval::evaluate_test_case_favonius(TI::CP::ContinuousPathTestCase const&,TI::Favonius::FavoniusStrokeBuildManager *,unsigned int)::$_0,std::allocator<TI::CP::CPEval::evaluate_test_case_favonius(TI::CP::ContinuousPathTestCase const&,TI::Favonius::FavoniusStrokeBuildManager *,unsigned int)::$_0>,void ()(KB::CandidateCollection &,KB::CandidateFilterFlags,BOOL)>::__clone()
{
  uint64_t result = operator new(0x10uLL);
  *uint64_t result = &unk_26F2B7760;
  return result;
}

void std::__function::__func<TI::CP::CPEval::evaluate_test_case_favonius(TI::CP::ContinuousPathTestCase const&,TI::Favonius::FavoniusStrokeBuildManager *,unsigned int)::$_0,std::allocator<TI::CP::CPEval::evaluate_test_case_favonius(TI::CP::ContinuousPathTestCase const&,TI::Favonius::FavoniusStrokeBuildManager *,unsigned int)::$_0>,void ()(KB::CandidateCollection &,KB::CandidateFilterFlags,BOOL)>::~__func()
{
}

void TI::CP::CPEval::evaluate_test_case_input_manager(TI::CP::CPEval *this@<X0>, atomic_uint *volatile *a2@<X1>, TIInputManager *a3@<X2>, int a4@<W3>, uint64_t a5@<X8>)
{
  v39[4] = *MEMORY[0x263EF8340];
  *((_DWORD *)this + 39) = 2;
  TIInputManager::clear_continuous_path(a3);
  atomic_uint *volatile v17 = *a2;
  if (*a2) {
    atomic_fetch_add(*a2, 1u);
  }
  TIInputManager::set_key_layout();
  uint64_t v15 = a5;
  if (v17) {
    WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref((unsigned int *)v17);
  }
  KB::String::String((KB::String *)v18);
  TIInputManager::set_input_context();
  KB::String::~String((KB::String *)v18);
  MEMORY[0x2455C23B0](v18, a2 + 24);
  TIInputManager::set_input();
  KB::String::~String((KB::String *)v18);
  uint64_t v8 = *((void *)a2 + 1);
  uint64_t v9 = *((void *)a2 + 2);
  if (v9 != v8)
  {
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((v9 - v8) >> 4);
    unsigned int v11 = 1;
    int v12 = 5;
    do
    {
      if (v10 == v11) {
        int v13 = 5;
      }
      else {
        int v13 = v12;
      }
      if (v11 == 1) {
        int v12 = 1;
      }
      else {
        int v12 = v13;
      }
      TIInputManager::add_touch();
      unint64_t v14 = v11;
      unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a2 + 2) - *((void *)a2 + 1)) >> 4);
      ++v11;
    }
    while (v10 > v14);
  }
  TIInputManager::lookup();
  v18[0] = 0;
  v18[1] = (void **)v19;
  void v18[2] = (void **)3;
  v19[45] = xmmword_23F04A410;
  unint64_t v20 = 0xFF8000003F800000;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v25 = 0;
  language_modeling::v1::LinguisticContext::LinguisticContext((language_modeling::v1::LinguisticContext *)&v26);
  language_modeling::v1::LinguisticContext::LinguisticContext((language_modeling::v1::LinguisticContext *)v27);
  memset(&v27[8], 0, 24);
  KB::String::String((KB::String *)v28);
  v28[2] = 0u;
  __int16 v30 = 0;
  uint64_t v29 = 0;
  int v31 = 0;
  char v32 = 0;
  long long v33 = 0u;
  int v34 = 0;
  TI::CP::CPEval::compose_result_from_candidates((KB::DictionaryContainer **)this, v35, (const TI::CP::ContinuousPathTestCase *)a2, a4, v15);
  MEMORY[0x2455C2430](v18);
  KB::String::~String((KB::String *)v39);
  v18[0] = (void **)&v38;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](v18);
  v18[0] = (void **)&v37;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](v18);
  v18[0] = (void **)&v36;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](v18);
  v18[0] = (void **)v35;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](v18);
}

void **std::tuple<KB::CandidateCollection,KB::String>::~tuple(void **a1)
{
  KB::String::~String((KB::String *)(a1 + 13));
  uint64_t v3 = a1 + 9;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v3);
  uint64_t v3 = a1 + 6;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v3);
  uint64_t v3 = a1 + 3;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v3);
  uint64_t v3 = a1;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v3);
  return a1;
}

void TI::CP::CPEval::create_favonius(TI::CP::CPEval *this, TIKeyboardInputManagerConfig *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  uint64_t v2 = a2;
  operator new();
}

void sub_23F0225A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  uint64_t v22 = *v20;
  *unint64_t v20 = 0;
  if (v22) {
    (*(void (**)(uint64_t))(*(void *)v22 + 8))(v22);
  }

  _Unwind_Resume(a1);
}

void TI::CP::CPEval::create_input_manager(TI::CP::CPEval *this, TIKeyboardInputManagerConfig *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  uint64_t v2 = a2;
  operator new();
}

void sub_23F022D34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  KB::String::~String((KB::String *)&__p);

  uint64_t v23 = *v20;
  *unint64_t v20 = 0;
  if (v23) {
    (*(void (**)(uint64_t))(*(void *)v23 + 8))(v23);
  }

  _Unwind_Resume(a1);
}

const char *TI::CP::CPEval::recognizer_description(uint64_t a1, unsigned int a2)
{
  if (a2 > 3) {
    return "";
  }
  else {
    return off_2650502F8[a2];
  }
}

void _TIBeginMockingTrialManager()
{
  id v0 = (void *)MEMORY[0x263F7EB48];
  unsigned int v1 = objc_alloc_init(MockTITrialManager);
  [v0 setSharedManager:v1];
}

uint64_t _TIEndMockingTrialManager()
{
  return [MEMORY[0x263F7EB48] setSharedManager:0];
}

void sub_23F027DFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

uint64_t __Block_byref_object_copy__5567(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5568(uint64_t a1)
{
}

uint64_t _isLetterKey(void *a1)
{
  id v1 = a1;
  if ([v1 length]
    && (uint64_t v2 = [v1 _rangeOfLongCharacterAtIndex:0], v2 + v3 == objc_msgSend(v1, "length")))
  {
    uint64_t v4 = [v1 _firstLongCharacter];
    uint64_t v5 = [MEMORY[0x263F08708] letterCharacterSet];
    uint64_t v6 = [v5 longCharacterIsMember:v4];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

BOOL _isWordEndingKey(void *a1)
{
  id v1 = a1;
  if ([v1 length] == 1) {
    UChar32 v2 = [v1 _firstLongCharacter];
  }
  else {
    UChar32 v2 = 0;
  }
  if (u_ispunct(v2)) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = u_isWhitespace(v2) != 0;
  }

  return v3;
}

BOOL _isSpaceKey(void *a1)
{
  id v1 = a1;
  if ([v1 length] == 1) {
    UChar32 v2 = [v1 _firstLongCharacter];
  }
  else {
    UChar32 v2 = 0;
  }
  BOOL v3 = u_isspace(v2) != 0;

  return v3;
}

BOOL _isNumberOrPunctuationKey(void *a1)
{
  id v1 = a1;
  if ([v1 length] == 1) {
    UChar32 v2 = [v1 _firstLongCharacter];
  }
  else {
    UChar32 v2 = 0;
  }
  if (u_isdigit(v2)) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = u_ispunct(v2) != 0;
  }

  return v3;
}

void _TIBeginMockingSingletons()
{
}

void _TIBeginMockingSingletonsWithData(void *a1, void *a2, void *a3, void *a4, int a5, char a6)
{
  id v17 = a4;
  id v11 = a3;
  id v12 = a2;
  id v13 = a1;
  if (objc_opt_respondsToSelector()) {
    [MEMORY[0x263F7EAF0] disableForTesting:1];
  }
  _TIBeginMockingKeyboardActivityController();
  _TIBeginMockingTransientLexiconManagerWithData(v13, v12);

  if (v11) {
    unint64_t v14 = v11;
  }
  else {
    unint64_t v14 = (void *)MEMORY[0x263EFFA68];
  }
  _TIBeginMockingUserDictionaryServerWithPairs(v14);

  if (v17)
  {
    _TIBeginMockingLanguageLikelihoodModelWithModel(v17);
    if (!a5) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  _TIBeginMockingLanguageLikelihoodModel();
  if (a5) {
LABEL_8:
  }
    _TIBeginMockingAssetManager();
LABEL_9:
  _TIBeginMockingAggdReporter();
  _TIBeginMockingAnalyticsService();
  _TIBeginMockingCryptographer();
  _TIBeginMockingUserModelDataStore();
  uint64_t v15 = (void *)MEMORY[0x263F7EB48];
  uint64_t v16 = objc_alloc_init(MockTITrialManager);
  [v15 setSharedManager:v16];

  if ((a6 & 1) == 0)
  {
    _TIBeginMockingProactiveQuickTypeManager();
    _TIBeginMockingAppAutofillManager();
  }
}

void _TIBeginMockingSingletonsWithResources(void *a1, void *a2, void *a3, int a4, char a5)
{
  id v14 = a3;
  id v9 = a2;
  id v10 = a1;
  _TIBeginMockingKeyboardActivityController();
  _TIBeginMockingContactManagerWithContactCollection(v10);

  if (v9) {
    id v11 = v9;
  }
  else {
    id v11 = (void *)MEMORY[0x263EFFA68];
  }
  _TIBeginMockingUserDictionaryServerWithPairs(v11);

  if (v14)
  {
    _TIBeginMockingLanguageLikelihoodModelWithModel(v14);
    if (!a4) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  _TIBeginMockingLanguageLikelihoodModel();
  if (a4) {
LABEL_6:
  }
    _TIBeginMockingAssetManager();
LABEL_7:
  _TIBeginMockingAggdReporter();
  _TIBeginMockingAnalyticsService();
  _TIBeginMockingCryptographer();
  _TIBeginMockingUserModelDataStore();
  id v12 = (void *)MEMORY[0x263F7EB48];
  id v13 = objc_alloc_init(MockTITrialManager);
  [v12 setSharedManager:v13];

  _TIBeginMockingAppAutofillManager();
  if ((a5 & 1) == 0)
  {
    _TIBeginMockingProactiveQuickTypeManager();
    _TIBeginMockingAppAutofillManager();
  }
}

void _TIBeginMockingSingletonsWithMockData(void *a1, void *a2, void *a3, void *a4, int a5, char a6)
{
  id v11 = a4;
  id v12 = a3;
  id v13 = a2;
  _TIConvertTIMockContactCollection(a1);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  _TIBeginMockingSingletonsWithData(v14, v13, v12, v11, a5, a6);
}

uint64_t _TIEndMockingSingletons()
{
  return _TIEndMockingSingletonsWithData(0);
}

uint64_t _TIEndMockingSingletonsWithData(char a1)
{
  TIDispatchWaitForAllBlocks();
  _TIEndMockingUserModelDataStore();
  _TIEndMockingCryptographer();
  _TIEndMockingAnalyticsService();
  _TIEndMockingAggdReporter();
  _TIEndMockingAssetManager();
  _TIEndMockingLanguageLikelihoodModel();
  _TIEndMockingUserDictionaryServer();
  _TIEndMockingTransientLexiconManager();
  _TIEndMockingKeyboardActivityController();
  [MEMORY[0x263F7EB48] setSharedManager:0];
  uint64_t result = objc_opt_respondsToSelector();
  if (result) {
    uint64_t result = [MEMORY[0x263F7EAF0] disableForTesting:0];
  }
  if ((a1 & 1) == 0)
  {
    _TIEndMockingProactiveQuickTypeManager();
    return _TIEndMockingAppAutofillManager();
  }
  return result;
}

void TI::CP::CPTrainer::evaluate_params(uint64_t a1, int a2, long long *a3, uint64_t *a4)
{
  v53[45] = *(void **)MEMORY[0x263EF8340];
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v39 = 0;
  if (*(unsigned char *)(a1 + 40))
  {
    TI::CP::CPEval::evaluate_records(*(std::string **)(a1 + 8), a4, a2, (uint64_t)a3, (uint64_t)&v51);
    uint64_t v7 = v51;
    uint64_t v6 = v52;
    unint64_t v8 = 0x34F72C234F72C235 * ((v52 - (uint64_t)v51) >> 3);
    if (0x34F72C234F72C235 * ((int64_t)(v39 - (unint64_t)__p[0]) >> 3) >= v8)
    {
      if (0x34F72C234F72C235 * (((char *)__p[1] - (char *)__p[0]) >> 3) >= v8)
      {
        id v11 = (char *)std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:nn180100]<TI::CP::ContinuousPathTestResult *,TI::CP::ContinuousPathTestResult *,TI::CP::ContinuousPathTestResult *>((uint64_t)v51, v52, (uint64_t)__p[0]);
        char v18 = v11;
        for (uint64_t i = (char *)__p[1]; i != v18; std::__destroy_at[abi:nn180100]<TI::CP::ContinuousPathTestResult,0>((uint64_t)i))
          i -= 232;
        __p[1] = v18;
      }
      else
      {
        uint64_t v15 = &v51[((char *)__p[1] - (char *)__p[0]) >> 3];
        id v11 = (char *)std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:nn180100]<TI::CP::ContinuousPathTestResult *,TI::CP::ContinuousPathTestResult *,TI::CP::ContinuousPathTestResult *>((uint64_t)v51, (uint64_t)v15, (uint64_t)__p[0]);
        uint64_t v16 = (char *)__p[1];
        if (v15 != (void **)v6)
        {
          uint64_t v17 = 0;
          do
          {
            id v11 = (char *)TI::CP::ContinuousPathTestResult::ContinuousPathTestResult((TI::CP::ContinuousPathTestResult *)((char *)__p[1] + v17 * 8), (const TI::CP::ContinuousPathTestResult *)&v15[v17]);
            v17 += 29;
          }
          while (&v15[v17] != (void **)v6);
          uint64_t v16 = (char *)__p[1] + v17 * 8;
        }
        __p[1] = v16;
      }
    }
    else
    {
      if (v8 > 0x11A7B9611A7B961) {
        goto LABEL_50;
      }
      unint64_t v9 = 0x69EE58469EE5846ALL * (v39 >> 3);
      if (v9 <= v8) {
        unint64_t v9 = 0x34F72C234F72C235 * ((v52 - (uint64_t)v51) >> 3);
      }
      unint64_t v10 = (unint64_t)(0x34F72C234F72C235 * (v39 >> 3)) >= 0x8D3DCB08D3DCB0 ? 0x11A7B9611A7B961 : v9;
      if (v10 > 0x11A7B9611A7B961) {
LABEL_50:
      }
        abort();
      id v11 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<TI::CP::ContinuousPathTestResult>>(v10);
      id v12 = v11;
      __p[0] = v11;
      __p[1] = v11;
      uint64_t v39 = (uint64_t)&v11[232 * v13];
      if (v7 != (void **)v6)
      {
        uint64_t v14 = 0;
        do
        {
          id v11 = (char *)TI::CP::ContinuousPathTestResult::ContinuousPathTestResult((TI::CP::ContinuousPathTestResult *)&v12[v14 * 8], (const TI::CP::ContinuousPathTestResult *)&v7[v14]);
          v14 += 29;
        }
        while (&v7[v14] != (void **)v6);
        v12 += v14 * 8;
      }
      __p[1] = v12;
    }
    TI::CP::CPTrainer::dump_match_indices((uint64_t)v11, (uint64_t *)__p);
    std::string v45 = &v51;
    std::vector<TI::CP::ContinuousPathTestResult>::__destroy_vector::operator()[abi:nn180100]((void ***)&v45);
    double v20 = 0.0;
    if (__p[0] != __p[1])
    {
      long long v21 = __p[0];
      do
      {
        int v22 = v21[36];
        double v23 = -4.0;
        if (v22 != -1) {
          double v23 = (double)v22 / ((double)v22 + 3.0) * -4.0;
        }
        double v20 = v20 + v23;
        v21 += 58;
      }
      while (v21 != __p[1]);
    }
    uint64_t v51 = __p;
    std::vector<TI::CP::ContinuousPathTestResult>::__destroy_vector::operator()[abi:nn180100](&v51);
  }
  else
  {
    long long v24 = *(const std::string **)(a1 + 8);
    TI::CP::EnsembleConfig::EnsembleConfig((uint64_t)v53, a3);
    TI::CP::CPEval::create_recognizer_for_config(v24, a2, (uint64_t)v53, &v37);
    TI::CP::EnsembleConfig::~EnsembleConfig(v53);
    while (1)
    {
      LODWORD(v45) = 0;
      LODWORD(v41) = 0;
      char v40 = 0;
      uint64_t v25 = *(void *)(a1 + 72);
      if (!v25) {
        break;
      }
      (*(void (**)(void ***__return_ptr))(*(void *)v25 + 48))(&v51);
      TI::CP::CPEval::evaluate_test_case(*(TI::CP::CPEval **)(a1 + 8), (const TI::CP::ContinuousPathTestCase *)&v51, v37, 0, (uint64_t)&v45);
      uint64_t v26 = (char *)__p[1];
      if (__p[1] >= (void *)v39)
      {
        uint64_t v28 = 0x34F72C234F72C235 * (((char *)__p[1] - (char *)__p[0]) >> 3);
        unint64_t v29 = v28 + 1;
        if ((unint64_t)(v28 + 1) > 0x11A7B9611A7B961) {
          abort();
        }
        if (0x69EE58469EE5846ALL * ((int64_t)(v39 - (unint64_t)__p[0]) >> 3) > v29) {
          unint64_t v29 = 0x69EE58469EE5846ALL * ((int64_t)(v39 - (unint64_t)__p[0]) >> 3);
        }
        if ((unint64_t)(0x34F72C234F72C235 * ((int64_t)(v39 - (unint64_t)__p[0]) >> 3)) >= 0x8D3DCB08D3DCB0) {
          unint64_t v30 = 0x11A7B9611A7B961;
        }
        else {
          unint64_t v30 = v29;
        }
        uint64_t v44 = &v39;
        if (v30) {
          unint64_t v30 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<TI::CP::ContinuousPathTestResult>>(v30);
        }
        else {
          uint64_t v31 = 0;
        }
        uint64_t v41 = (void **)v30;
        v42.i64[0] = v30 + 232 * v28;
        v42.i64[1] = v42.i64[0];
        uint64_t v43 = v30 + 232 * v31;
        std::construct_at[abi:nn180100]<TI::CP::ContinuousPathTestResult,TI::CP::ContinuousPathTestResult,TI::CP::ContinuousPathTestResult*>(v42.i64[0], (uint64_t)&v45);
        char v32 = (void *)v42.i64[0];
        uint64_t v27 = (void *)(v42.i64[1] + 232);
        v42.i64[1] += 232;
        int v34 = (char *)__p[0];
        long long v33 = (char *)__p[1];
        if (__p[1] == __p[0])
        {
          int64x2_t v35 = vdupq_n_s64((unint64_t)__p[1]);
        }
        else
        {
          do
          {
            v33 -= 232;
            char v32 = (void *)std::construct_at[abi:nn180100]<TI::CP::ContinuousPathTestResult,TI::CP::ContinuousPathTestResult,TI::CP::ContinuousPathTestResult*>((uint64_t)v32 - 232, (uint64_t)v33);
          }
          while (v33 != v34);
          int64x2_t v35 = *(int64x2_t *)__p;
          uint64_t v27 = (void *)v42.i64[1];
        }
        __p[0] = v32;
        __p[1] = v27;
        int64x2_t v42 = v35;
        uint64_t v36 = v39;
        uint64_t v39 = v43;
        uint64_t v43 = v36;
        uint64_t v41 = (void **)v35.i64[0];
        std::__split_buffer<TI::CP::ContinuousPathTestResult>::~__split_buffer((uint64_t)&v41);
      }
      else
      {
        std::construct_at[abi:nn180100]<TI::CP::ContinuousPathTestResult,TI::CP::ContinuousPathTestResult,TI::CP::ContinuousPathTestResult*>((uint64_t)__p[1], (uint64_t)&v45);
        uint64_t v27 = v26 + 232;
      }
      __p[1] = v27;
      std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::destroy(v50[9]);
      uint64_t v41 = (void **)v50;
      std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v41);
      uint64_t v41 = (void **)&v49;
      std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v41);
      uint64_t v41 = (void **)&v48;
      std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v41);
      uint64_t v41 = (void **)&v47;
      std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v41);
      KB::String::~String((KB::String *)&v46);
      TI::CP::ContinuousPathTestCase::~ContinuousPathTestCase((TI::CP::ContinuousPathTestCase *)&v51);
    }
    std::__throw_bad_function_call[abi:nn180100]();
    __break(1u);
  }
}

void sub_23F02EC50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,void **a50)
{
  if (a10) {
    (*(void (**)(uint64_t))(*(void *)a10 + 8))(a10);
  }
  a50 = (void **)&a11;
  std::vector<TI::CP::ContinuousPathTestResult>::__destroy_vector::operator()[abi:nn180100](&a50);
  _Unwind_Resume(a1);
}

uint64_t TI::CP::CPTrainer::dump_match_indices(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = a2[1];
  if (*a2 != v3)
  {
    do
    {
      unsigned int v4 = *(_DWORD *)(v2 + 144);
      int v5 = v4 + 48;
      if (v4 >= 0xA) {
        int v5 = 62;
      }
      if (v4 == -1) {
        int v6 = 109;
      }
      else {
        int v6 = v5;
      }
      putchar(v6);
      v2 += 232;
    }
    while (v2 != v3);
  }
  return putchar(10);
}

uint64_t TI::CP::EnsembleConfig::EnsembleConfig(uint64_t a1, long long *a2)
{
  long long v4 = *a2;
  long long v5 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v5;
  *(_OWORD *)a1 = v4;
  long long v6 = a2[3];
  long long v7 = a2[4];
  long long v8 = a2[5];
  *(void *)(a1 + 96) = *((void *)a2 + 12);
  *(_OWORD *)(a1 + 64) = v7;
  *(_OWORD *)(a1 + 8_TIBeginMockingSingletonsWithData(0, 0, 0, 0, 1, 0) = v8;
  *(_OWORD *)(a1 + 48) = v6;
  if (*((char *)a2 + 127) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)(a1 + 104), *((const std::string::value_type **)a2 + 13), *((void *)a2 + 14));
  }
  else
  {
    long long v9 = *(long long *)((char *)a2 + 104);
    *(void *)(a1 + 12_TIBeginMockingSingletonsWithData(0, 0, 0, 0, 1, 0) = *((void *)a2 + 15);
    *(_OWORD *)(a1 + 104) = v9;
  }
  if (*((char *)a2 + 151) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)(a1 + 128), *((const std::string::value_type **)a2 + 16), *((void *)a2 + 17));
  }
  else
  {
    long long v10 = a2[8];
    *(void *)(a1 + 144) = *((void *)a2 + 18);
    *(_OWORD *)(a1 + 128) = v10;
  }
  __int16 v11 = *((_WORD *)a2 + 76);
  *(unsigned char *)(a1 + 154) = *((unsigned char *)a2 + 154);
  *(_WORD *)(a1 + 152) = v11;
  MEMORY[0x2455C23B0](a1 + 160, a2 + 10);
  long long v12 = a2[12];
  long long v13 = a2[14];
  *(_OWORD *)(a1 + 208) = a2[13];
  *(_OWORD *)(a1 + 224) = v13;
  *(_OWORD *)(a1 + 192) = v12;
  long long v14 = a2[15];
  long long v15 = a2[16];
  long long v16 = a2[18];
  *(_OWORD *)(a1 + 272) = a2[17];
  *(_OWORD *)(a1 + 288) = v16;
  *(_OWORD *)(a1 + 24_TIBeginMockingSingletonsWithData(0, 0, 0, 0, 1, 0) = v14;
  *(_OWORD *)(a1 + 256) = v15;
  long long v17 = a2[19];
  long long v18 = a2[20];
  long long v19 = a2[21];
  *(void *)(a1 + 352) = *((void *)a2 + 44);
  *(_OWORD *)(a1 + 32_TIBeginMockingSingletonsWithData(0, 0, 0, 0, 1, 0) = v18;
  *(_OWORD *)(a1 + 336) = v19;
  *(_OWORD *)(a1 + 304) = v17;
  return a1;
}

void sub_23F02EEAC(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 127) < 0) {
    operator delete(*v2);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__throw_bad_function_call[abi:nn180100]()
{
  return std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:nn180100]<TI::CP::ContinuousPathTestResult *,TI::CP::ContinuousPathTestResult *,TI::CP::ContinuousPathTestResult *>();
}

uint64_t std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:nn180100]<TI::CP::ContinuousPathTestResult *,TI::CP::ContinuousPathTestResult *,TI::CP::ContinuousPathTestResult *>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = a1;
    do
    {
      *(_DWORD *)a3 = *(_DWORD *)v5;
      KB::String::operator=();
      if (a3 == v5)
      {
        *(void *)(a3 + 136) = *(void *)(v5 + 136);
        long long v17 = *(_OWORD *)(v5 + 160);
        *(_OWORD *)(a3 + 144) = *(_OWORD *)(v5 + 144);
        *(_OWORD *)(a3 + 16_TIBeginMockingSingletonsWithData(0, 0, 0, 0, 1, 0) = v17;
      }
      else
      {
        std::vector<KB::Candidate>::__assign_with_size[abi:nn180100]<KB::Candidate*,KB::Candidate*>(a3 + 40, *(void *)(v5 + 40), *(void *)(v5 + 48), 0x1CAC083126E978D5 * ((uint64_t)(*(void *)(v5 + 48) - *(void *)(v5 + 40)) >> 3));
        std::vector<KB::Candidate>::__assign_with_size[abi:nn180100]<KB::Candidate*,KB::Candidate*>(a3 + 64, *(void *)(v5 + 64), *(void *)(v5 + 72), 0x1CAC083126E978D5 * ((uint64_t)(*(void *)(v5 + 72) - *(void *)(v5 + 64)) >> 3));
        std::vector<KB::Candidate>::__assign_with_size[abi:nn180100]<KB::Candidate*,KB::Candidate*>(a3 + 88, *(void *)(v5 + 88), *(void *)(v5 + 96), 0x1CAC083126E978D5 * ((uint64_t)(*(void *)(v5 + 96) - *(void *)(v5 + 88)) >> 3));
        std::vector<KB::Candidate>::__assign_with_size[abi:nn180100]<KB::Candidate*,KB::Candidate*>(a3 + 112, *(void *)(v5 + 112), *(void *)(v5 + 120), 0x1CAC083126E978D5 * ((uint64_t)(*(void *)(v5 + 120) - *(void *)(v5 + 112)) >> 3));
        *(void *)(a3 + 136) = *(void *)(v5 + 136);
        long long v6 = *(_OWORD *)(v5 + 160);
        *(_OWORD *)(a3 + 144) = *(_OWORD *)(v5 + 144);
        *(_OWORD *)(a3 + 16_TIBeginMockingSingletonsWithData(0, 0, 0, 0, 1, 0) = v6;
        long long v7 = *(void **)(v5 + 176);
        long long v8 = (void *)(v5 + 184);
        if (*(void *)(a3 + 192))
        {
          uint64_t v9 = *(void *)(a3 + 184);
          long long v10 = *(uint64_t **)(a3 + 176);
          *(void *)(a3 + 176) = a3 + 184;
          *(void *)(v9 + 16) = 0;
          *(void *)(a3 + 184) = 0;
          *(void *)(a3 + 192) = 0;
          if (v10[1]) {
            __int16 v11 = (uint64_t *)v10[1];
          }
          else {
            __int16 v11 = v10;
          }
          long long v24 = (uint64_t *)(a3 + 176);
          uint64_t v25 = v11;
          uint64_t v26 = v11;
          if (!v11
            || (uint64_t v25 = std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::_DetachedTreeCache::__detach_next((uint64_t)v11),
                v7 == v8))
          {
            long long v15 = v7;
          }
          else
          {
            do
            {
              KB::String::operator=();
              TI::CP::Path::operator=((void **)v11 + 8, (const void **)v7 + 8);
              long long v12 = v26;
              leaf_high = (uint64_t **)std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::__find_leaf_high(a3 + 176, &v23, (uint64_t)(v26 + 4));
              std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::__insert_node_at((uint64_t **)(a3 + 176), v23, leaf_high, v12);
              uint64_t v26 = v25;
              if (v25) {
                uint64_t v25 = std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::_DetachedTreeCache::__detach_next((uint64_t)v25);
              }
              long long v14 = (void *)v7[1];
              if (v14)
              {
                do
                {
                  long long v15 = v14;
                  long long v14 = (void *)*v14;
                }
                while (v14);
              }
              else
              {
                do
                {
                  long long v15 = (void *)v7[2];
                  BOOL v16 = *v15 == (void)v7;
                  long long v7 = v15;
                }
                while (!v16);
              }
              __int16 v11 = v26;
              if (v26) {
                BOOL v16 = v15 == v8;
              }
              else {
                BOOL v16 = 1;
              }
              long long v7 = v15;
            }
            while (!v16);
          }
          std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:nn180100]((uint64_t)&v24);
          long long v7 = v15;
        }
        if (v7 != v8)
        {
          do
          {
            std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::__construct_node<std::pair<KB::String const,TI::CP::Path> const&>((uint64_t)&v24, a3 + 176, (uint64_t)(v7 + 4));
            long long v18 = (uint64_t **)std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::__find_leaf_high(a3 + 176, &v23, (uint64_t)(v24 + 4));
            std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::__insert_node_at((uint64_t **)(a3 + 176), v23, v18, v24);
            long long v24 = 0;
            std::unique_ptr<std::__tree_node<std::__value_type<KB::String,TI::CP::Path>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<KB::String,TI::CP::Path>,void *>>>>::reset[abi:nn180100]((uint64_t *)&v24);
            long long v19 = (void *)v7[1];
            if (v19)
            {
              do
              {
                double v20 = v19;
                long long v19 = (void *)*v19;
              }
              while (v19);
            }
            else
            {
              do
              {
                double v20 = (void *)v7[2];
                BOOL v16 = *v20 == (void)v7;
                long long v7 = v20;
              }
              while (!v16);
            }
            long long v7 = v20;
          }
          while (v20 != v8);
        }
      }
      long long v21 = *(_OWORD *)(v5 + 200);
      *(_OWORD *)(a3 + 212) = *(_OWORD *)(v5 + 212);
      *(_OWORD *)(a3 + 20_TIBeginMockingSingletonsWithData(0, 0, 0, 0, 1, 0) = v21;
      v5 += 232;
      a3 += 232;
    }
    while (v5 != a2);
  }
  return a3;
}

void sub_23F02F1A4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:nn180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void *std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::_DetachedTreeCache::__detach_next(uint64_t a1)
{
  uint64_t result = *(void **)(a1 + 16);
  if (result)
  {
    uint64_t v3 = (void *)*result;
    if (*result == a1)
    {
      *uint64_t result = 0;
      while (1)
      {
        long long v4 = (void *)result[1];
        if (!v4) {
          break;
        }
        do
        {
          uint64_t result = v4;
          long long v4 = (void *)*v4;
        }
        while (v4);
      }
    }
    else
    {
      for (result[1] = 0; v3; uint64_t v3 = (void *)result[1])
      {
        do
        {
          uint64_t result = v3;
          uint64_t v3 = (void *)*v3;
        }
        while (v3);
      }
    }
  }
  return result;
}

void *std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::__find_leaf_high(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = (void *)(a1 + 8);
  long long v4 = *(void **)(a1 + 8);
  if (v4)
  {
    if (*(void *)(a3 + 8)) {
      long long v6 = *(const char **)(a3 + 8);
    }
    else {
      long long v6 = (const char *)(a3 + 16);
    }
    do
    {
      while (1)
      {
        uint64_t v5 = v4;
        long long v7 = (void *)v4[5];
        long long v8 = (const char *)(v7 ? v7 : v5 + 6);
        if ((strcmp(v6, v8) & 0x80000000) == 0) {
          break;
        }
        long long v4 = (void *)*v5;
        uint64_t result = v5;
        if (!*v5) {
          goto LABEL_14;
        }
      }
      long long v4 = (void *)v5[1];
    }
    while (v4);
    uint64_t result = v5 + 1;
  }
  else
  {
    uint64_t result = (void *)(a1 + 8);
  }
LABEL_14:
  *a2 = v5;
  return result;
}

uint64_t std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:nn180100](uint64_t a1)
{
  std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::destroy(*(void **)(a1 + 16));
  uint64_t v2 = *(void **)(a1 + 8);
  if (v2)
  {
    uint64_t v3 = (void *)v2[2];
    if (v3)
    {
      do
      {
        uint64_t v2 = v3;
        uint64_t v3 = (void *)v3[2];
      }
      while (v3);
      *(void *)(a1 + 8) = v2;
    }
    std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::destroy(v2);
  }
  return a1;
}

KB::Candidate *std::vector<KB::Candidate>::__assign_with_size[abi:nn180100]<KB::Candidate*,KB::Candidate*>(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = *(void *)a1;
  if (0x1CAC083126E978D5 * ((uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 3) >= a4)
  {
    if (0x1CAC083126E978D5 * ((*(void *)(a1 + 8) - v8) >> 3) >= a4)
    {
      uint64_t v15 = std::__unwrap_and_dispatch[abi:nn180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,KB::Candidate *,KB::Candidate *,KB::Candidate *,0>(a2, a3, v8);
      for (uint64_t result = *(KB::Candidate **)(a1 + 8);
            result != (KB::Candidate *)v15;
      *(void *)(a1 + 8) = v15;
      return result;
    }
    uint64_t v13 = a2 + 8 * ((*(void *)(a1 + 8) - v8) >> 3);
    std::__unwrap_and_dispatch[abi:nn180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,KB::Candidate *,KB::Candidate *,KB::Candidate *,0>(a2, v13, v8);
    __int16 v11 = (KB::Candidate *)a1;
    uint64_t v12 = v13;
  }
  else
  {
    std::vector<KB::Candidate>::__vdeallocate((void **)a1);
    if (a4 > 0x4189374BC6A7EFLL) {
      abort();
    }
    unint64_t v9 = 0x395810624DD2F1AALL * ((uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 3);
    if (v9 <= a4) {
      unint64_t v9 = a4;
    }
    if ((unint64_t)(0x1CAC083126E978D5 * ((uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 3)) >= 0x20C49BA5E353F7) {
      unint64_t v10 = 0x4189374BC6A7EFLL;
    }
    else {
      unint64_t v10 = v9;
    }
    std::vector<KB::Candidate>::__vallocate[abi:nn180100]((void *)a1, v10);
    __int16 v11 = (KB::Candidate *)a1;
    uint64_t v12 = a2;
  }
  return std::vector<KB::Candidate>::__construct_at_end<KB::Candidate*,KB::Candidate*>(v11, v12, a3);
}

uint64_t std::__unwrap_and_dispatch[abi:nn180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,KB::Candidate *,KB::Candidate *,KB::Candidate *,0>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = a1;
    while (1)
    {
      if (v5 == a3) {
        goto LABEL_46;
      }
      unint64_t v6 = *(void *)a3;
      unint64_t v7 = *(void *)v5;
      if (*(void *)a3 > *(void *)v5)
      {
        uint64_t v8 = (KB::Word *)(*(void *)(a3 + 8) + 240 * v7);
        uint64_t v9 = -240 * v7 + 240 * v6;
        do
        {
          KB::Word::~Word(v8);
          uint64_t v8 = (KB::Word *)(v10 + 240);
          v9 -= 240;
        }
        while (v9);
        *(void *)a3 = v7;
        goto LABEL_34;
      }
      unint64_t v11 = *(void *)(a3 + 16);
      if (v7 <= v11)
      {
        unint64_t v7 = *(void *)a3;
        goto LABEL_34;
      }
      if (v11)
      {
        if (v6)
        {
          uint64_t v12 = *(KB::Word **)(a3 + 8);
          uint64_t v13 = 240 * v6;
          do
          {
            KB::Word::~Word(v12);
            uint64_t v12 = (KB::Word *)(v14 + 240);
            v13 -= 240;
          }
          while (v13);
          *(void *)a3 = 0;
        }
        BOOL v16 = (void **)(a3 + 8);
        uint64_t v15 = *(void **)(a3 + 8);
        if ((void *)(a3 + 24) != v15)
        {
          char *v16 = 0;
          *(void *)(a3 + 16) = 0;
          free(v15);
          uint64_t v15 = *v16;
        }
        if (v15)
        {
          unint64_t v11 = *(void *)(a3 + 16);
        }
        else
        {
          *(void *)(a3 + 8) = a3 + 24;
          *(void *)(a3 + 16) = 3;
          unint64_t v11 = 3;
        }
      }
      unint64_t v17 = *(void *)v5;
      if (v11 < *(void *)v5) {
        break;
      }
LABEL_32:
      if (!*(void *)(a3 + 8)) {
        goto LABEL_46;
      }
      unint64_t v7 = *(void *)a3;
LABEL_34:
      uint64_t v24 = *(void *)(v5 + 8);
      if (v7)
      {
        uint64_t v25 = v24 + 240 * v7;
        uint64_t v26 = *(void *)(a3 + 8) + 200;
        do
        {
          KB::String::operator=();
          KB::ByteString::operator=();
          int v27 = *(_DWORD *)(v24 + 56);
          *(void *)(v26 - 152) = *(void *)(v24 + 48);
          *(_DWORD *)(v26 - 144) = v27;
          KB::String::operator=();
          long long v28 = *(_OWORD *)(v24 + 128);
          long long v29 = *(_OWORD *)(v24 + 144);
          long long v30 = *(_OWORD *)(v24 + 112);
          *(_OWORD *)(v26 - 104) = *(_OWORD *)(v24 + 96);
          *(_OWORD *)(v26 - 56) = v29;
          *(_OWORD *)(v26 - 72) = v28;
          *(_OWORD *)(v26 - 88) = v30;
          KB::String::operator=();
          *(unsigned char *)(v26 - 8) = *(unsigned char *)(v24 + 192);
          if (v26 - 200 != v24)
          {
            *(_DWORD *)(v26 + 32) = *(_DWORD *)(v24 + 232);
            std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<unsigned long long,void *> *>>((void *)v26, *(void **)(v24 + 216));
          }
          v26 += 240;
          v24 += 240;
        }
        while (v24 != v25);
        uint64_t v24 = *(void *)(v5 + 8);
        unint64_t v31 = *(void *)a3;
      }
      else
      {
        unint64_t v31 = 0;
      }
      if (v31 != *(void *)v5)
      {
        uint64_t v32 = 240 * v31;
        long long v33 = (KB::Word *)(*(void *)(a3 + 8) + v32);
        int v34 = (const KB::Word *)(v24 + v32);
        uint64_t v35 = 240 * *(void *)v5 - v32;
        do
        {
          long long v33 = (KB::Word *)((char *)KB::Word::Word(v33, v34) + 240);
          int v34 = (const KB::Word *)((char *)v34 + 240);
          v35 -= 240;
        }
        while (v35);
        unint64_t v31 = *(void *)v5;
      }
      *(void *)a3 = v31;
LABEL_46:
      *(_DWORD *)(a3 + 744) = *(_DWORD *)(v5 + 744);
      long long v36 = *(_OWORD *)(v5 + 748);
      *(_OWORD *)(a3 + 76_TIBeginMockingSingletonsWithData(0, 0, 0, 0, 1, 0) = *(_OWORD *)(v5 + 760);
      *(_OWORD *)(a3 + 748) = v36;
      *(void *)(a3 + 776) = *(void *)(v5 + 776);
      uint64_t v37 = *(void *)(v5 + 784);
      uint64_t v38 = *(void *)(v5 + 792);
      if (v38) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v38 + 8), 1uLL, memory_order_relaxed);
      }
      *(void *)(a3 + 784) = v37;
      uint64_t v39 = *(std::__shared_weak_count **)(a3 + 792);
      *(void *)(a3 + 792) = v38;
      if (v39) {
        std::__shared_weak_count::__release_shared[abi:nn180100](v39);
      }
      if (v5 == a3)
      {
        language_modeling::v1::LinguisticContext::operator=();
        language_modeling::v1::LinguisticContext::operator=();
        goto LABEL_93;
      }
      char v40 = *(unsigned char **)(v5 + 800);
      uint64_t v41 = *(unsigned char **)(v5 + 808);
      size_t v42 = v41 - v40;
      unint64_t v43 = (v41 - v40) >> 3;
      uint64_t v44 = *(void *)(a3 + 816);
      std::string v45 = *(char **)(a3 + 800);
      if (v43 <= (v44 - (uint64_t)v45) >> 3)
      {
        uint64_t v48 = *(unsigned char **)(a3 + 808);
        unint64_t v49 = (v48 - v45) >> 3;
        if (v49 < v43)
        {
          if (v48 != v45)
          {
            memmove(*(void **)(a3 + 800), *(const void **)(v5 + 800), v48 - v45);
            std::string v45 = *(char **)(a3 + 808);
          }
          uint64_t v50 = &v40[8 * v49];
          size_t v42 = v41 - v50;
          if (v41 == v50) {
            goto LABEL_70;
          }
          uint64_t v51 = v45;
          goto LABEL_69;
        }
      }
      else
      {
        if (v45)
        {
          *(void *)(a3 + 808) = v45;
          operator delete(v45);
          uint64_t v44 = 0;
          *(void *)(a3 + 80_TIBeginMockingSingletonsWithData(0, 0, 0, 0, 1, 0) = 0;
          *(void *)(a3 + 808) = 0;
          *(void *)(a3 + 816) = 0;
        }
        if ((v42 & 0x8000000000000000) != 0) {
LABEL_107:
        }
          abort();
        uint64_t v46 = v44 >> 2;
        if (v44 >> 2 <= v43) {
          uint64_t v46 = (v41 - v40) >> 3;
        }
        if ((unint64_t)v44 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v47 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v47 = v46;
        }
        std::vector<TITokenID>::__vallocate[abi:nn180100]((void *)(a3 + 800), v47);
        std::string v45 = *(char **)(a3 + 808);
      }
      if (v41 != v40)
      {
        uint64_t v51 = v45;
        uint64_t v50 = v40;
LABEL_69:
        memmove(v51, v50, v42);
      }
LABEL_70:
      *(void *)(a3 + 808) = &v45[v42];
      long long v52 = *(_OWORD *)(v5 + 824);
      *(void *)(a3 + 84_TIBeginMockingSingletonsWithData(0, 0, 0, 0, 1, 0) = *(void *)(v5 + 840);
      *(_OWORD *)(a3 + 824) = v52;
      language_modeling::v1::LinguisticContext::operator=();
      language_modeling::v1::LinguisticContext::operator=();
      uint64_t v53 = *(std::string **)(v5 + 864);
      uint64_t v54 = *(long long **)(v5 + 872);
      unint64_t v55 = 0xAAAAAAAAAAAAAAABLL * (((char *)v54 - (char *)v53) >> 3);
      long long v56 = *(std::string **)(a3 + 864);
      if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a3 + 880) - (void)v56) >> 3) >= v55)
      {
        uint64_t v60 = *(std::string **)(a3 + 872);
        uint64_t v61 = ((char *)v60 - (char *)v56) >> 3;
        unint64_t v62 = 0xAAAAAAAAAAAAAAABLL * v61;
        if (0xAAAAAAAAAAAAAAABLL * v61 >= v55)
        {
          if (v53 != (std::string *)v54)
          {
            do
              std::string::operator=(v56++, v53++);
            while (v53 != (std::string *)v54);
            uint64_t v60 = *(std::string **)(a3 + 872);
          }
          while (v60 != v56)
          {
            if (SHIBYTE(v60[-1].__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v60[-1].__r_.__value_.__l.__data_);
            }
            --v60;
          }
          *(void *)(a3 + 872) = v56;
          goto LABEL_93;
        }
        if (v60 != v56)
        {
          uint64_t v63 = 8 * v61;
          unint64_t v64 = *(const std::string **)(v5 + 864);
          do
          {
            std::string::operator=(v56++, v64++);
            v63 -= 24;
          }
          while (v63);
          long long v56 = *(std::string **)(a3 + 872);
        }
        int v59 = std::__uninitialized_allocator_copy[abi:nn180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>((long long *)(&v53->__r_.__value_.__l + v62), v54, v56);
      }
      else
      {
        std::vector<std::string>::__vdeallocate((std::vector<std::string> *)(a3 + 864));
        if (v55 > 0xAAAAAAAAAAAAAAALL) {
          goto LABEL_107;
        }
        unint64_t v57 = 0x5555555555555556 * ((uint64_t)(*(void *)(a3 + 880) - *(void *)(a3 + 864)) >> 3);
        if (v57 <= v55) {
          unint64_t v57 = 0xAAAAAAAAAAAAAAABLL * (((char *)v54 - (char *)v53) >> 3);
        }
        if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a3 + 880) - *(void *)(a3 + 864)) >> 3) >= 0x555555555555555) {
          unint64_t v58 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v58 = v57;
        }
        std::vector<std::string>::__vallocate[abi:nn180100]((void *)(a3 + 864), v58);
        int v59 = std::__uninitialized_allocator_copy[abi:nn180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>((long long *)v53, v54, *(std::string **)(a3 + 872));
      }
      *(void *)(a3 + 872) = v59;
LABEL_93:
      KB::String::operator=();
      std::string::operator=((std::string *)(a3 + 920), (const std::string *)(v5 + 920));
      KB::ByteString::operator=();
      *(_OWORD *)(a3 + 96_TIBeginMockingSingletonsWithData(0, 0, 0, 0, 1, 0) = *(_OWORD *)(v5 + 960);
      unsigned int v65 = *(const void **)(v5 + 976);
      unsigned int v66 = *(const void **)(a3 + 976);
      if (v66 != v65)
      {
        if (v65)
        {
          CFRetain(*(CFTypeRef *)(v5 + 976));
          unsigned int v66 = *(const void **)(a3 + 976);
        }
        if (v66) {
          CFRelease(v66);
        }
        *(void *)(a3 + 976) = v65;
      }
      uint64_t v67 = *(const void **)(v5 + 984);
      unint64_t v68 = *(const void **)(a3 + 984);
      if (v68 != v67)
      {
        if (v67)
        {
          CFRetain(*(CFTypeRef *)(v5 + 984));
          unint64_t v68 = *(const void **)(a3 + 984);
        }
        if (v68) {
          CFRelease(v68);
        }
        *(void *)(a3 + 984) = v67;
      }
      *(_DWORD *)(a3 + 992) = *(_DWORD *)(v5 + 992);
      v5 += 1000;
      a3 += 1000;
      if (v5 == a2) {
        return a3;
      }
    }
    long long v19 = (void **)(a3 + 8);
    long long v18 = *(void **)(a3 + 8);
    unint64_t v20 = *(void *)a3;
    if (v17 <= 3)
    {
      long long v21 = (KB::Word *)(a3 + 24);
      *(void *)(a3 + 8) = a3 + 24;
      *(void *)(a3 + 16) = 3;
      if (!v20) {
        goto LABEL_28;
      }
    }
    else
    {
      *(void *)(a3 + 16) = v17;
      long long v21 = (KB::Word *)malloc_type_malloc(240 * v17, 0x10B2040DF775671uLL);
      *(void *)(a3 + 8) = v21;
      if (!v21 || !v20)
      {
LABEL_28:
        if ((void *)(a3 + 24) != v18)
        {
          if (*v19 == v18)
          {
            *long long v19 = 0;
            *(void *)(a3 + 16) = 0;
          }
          free(v18);
        }
        goto LABEL_32;
      }
    }
    uint64_t v22 = 240 * v20;
    uint64_t v23 = (const KB::Word *)v18;
    do
    {
      KB::Word::Word(v21, v23);
      KB::Word::~Word(v23);
      long long v21 = (KB::Word *)((char *)v21 + 240);
      uint64_t v23 = (const KB::Word *)((char *)v23 + 240);
      v22 -= 240;
    }
    while (v22);
    goto LABEL_28;
  }
  return a3;
}

void sub_23F02FAA8(_Unwind_Exception *a1)
{
  *(void *)(v1 + 872) = v2;
  _Unwind_Resume(a1);
}

void TI::CP::CPTrainer::train(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  memset(v3, 0, sizeof(v3));
  TI::CP::CPTrainer::train_records(a1, a2, (uint64_t)v3, a3);
  long long v4 = (void **)v3;
  std::vector<TI::CP::ContinuousPathTestCase>::__destroy_vector::operator()[abi:nn180100](&v4);
}

void sub_23F02FAF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void **a12)
{
  a12 = (void **)&a9;
  std::vector<TI::CP::ContinuousPathTestCase>::__destroy_vector::operator()[abi:nn180100](&a12);
  _Unwind_Resume(a1);
}

void TI::CP::CPTrainer::train_records(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  *(_DWORD *)unint64_t v58 = 4;
  *(_OWORD *)&v58[8] = xmmword_23F04A588;
  *(void *)&v58[24] = 0;
  *(void *)uint64_t v60 = 0x3FF0000000000000;
  long long v59 = xmmword_23F04A5A0;
  *(void *)&v60[24] = 0;
  *(_OWORD *)&v60[8] = xmmword_23F04A5B8;
  LODWORD(v61) = 1056964608;
  *((void *)&v61 + 1) = 0x200000001;
  LOBYTE(v62) = 1;
  HIDWORD(v62) = 3;
  memset(__p, 0, sizeof(__p));
  unint64_t v7 = (TI::CP::CPTrainer *)KB::String::String((KB::String *)v64);
  *(_DWORD *)unsigned int v65 = 1050253722;
  LOBYTE(v7_TIBeginMockingSingletonsWithData(0, 0, 0, 0, 1, 0) = 1;
  *(_OWORD *)&v65[8] = xmmword_23F04A430;
  *(_OWORD *)&v65[24] = xmmword_23F04A440;
  *(_OWORD *)&v65[40] = xmmword_23F04A450;
  *(_OWORD *)&v65[56] = xmmword_23F04A460;
  *(void *)&v65[72] = 0x4010000000000000;
  long long v66 = xmmword_23F04A470;
  long long v67 = xmmword_23F04A480;
  long long v68 = xmmword_23F04A420;
  long long v69 = xmmword_23F04A490;
  *((void *)&v70 + 1) = 0x404B30CB295E9E1BLL;
  uint64_t v71 = 0x4019D81D7DBF4880;
  TI::CP::CPTrainer::initial_parameters_for_training(v7, (uint64_t)&v35);
  *(_OWORD *)&v60[16] = v39;
  long long v61 = v40;
  uint64_t v62 = v41;
  *(_OWORD *)unint64_t v58 = v35;
  *(_OWORD *)&v58[16] = v36;
  long long v59 = v37;
  *(_OWORD *)uint64_t v60 = v38;
  if ((__p[23] & 0x80000000) != 0) {
    operator delete(*(void **)__p);
  }
  *(std::string *)std::string __p = v42;
  *((unsigned char *)&v42.__r_.__value_.__s + 23) = 0;
  v42.__r_.__value_.__s.__data_[0] = 0;
  if ((__p[47] & 0x80000000) != 0) {
    operator delete(*(void **)&__p[24]);
  }
  *(std::string *)&__p[24] = v43;
  *((unsigned char *)&v43.__r_.__value_.__s + 23) = 0;
  v43.__r_.__value_.__s.__data_[0] = 0;
  *(_WORD *)&__p[48] = v44;
  __p[50] = v45;
  KB::String::operator=();
  long long v69 = v55;
  long long v70 = v56;
  uint64_t v71 = v57;
  *(_OWORD *)&v65[64] = v51;
  long long v66 = v52;
  long long v67 = v53;
  long long v68 = v54;
  *(_OWORD *)unsigned int v65 = v47;
  *(_OWORD *)&v65[16] = v48;
  *(_OWORD *)&v65[32] = v49;
  *(_OWORD *)&v65[48] = v50;
  KB::String::~String((KB::String *)v46);
  if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v43.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v42.__r_.__value_.__l.__data_);
  }
  LOBYTE(v62) = 0;
  double v8 = (*(double (**)(uint64_t, uint64_t, unsigned char *, uint64_t))(*(void *)a1 + 24))(a1, a2, v58, a3);
  long long v9 = v61;
  *(_OWORD *)(a4 + 64) = *(_OWORD *)&v60[16];
  *(_OWORD *)(a4 + 8_TIBeginMockingSingletonsWithData(0, 0, 0, 0, 1, 0) = v9;
  *(void *)(a4 + 96) = v62;
  long long v10 = *(_OWORD *)&v58[16];
  *(_OWORD *)a4 = *(_OWORD *)v58;
  *(_OWORD *)(a4 + 16) = v10;
  long long v11 = *(_OWORD *)v60;
  *(_OWORD *)(a4 + 32) = v59;
  *(_OWORD *)(a4 + 48) = v11;
  if ((__p[23] & 0x80000000) != 0)
  {
    std::string::__init_copy_ctor_external((std::string *)(a4 + 104), *(const std::string::value_type **)__p, *(std::string::size_type *)&__p[8]);
  }
  else
  {
    *(_OWORD *)(a4 + 104) = *(_OWORD *)__p;
    *(void *)(a4 + 12_TIBeginMockingSingletonsWithData(0, 0, 0, 0, 1, 0) = *(void *)&__p[16];
  }
  if ((__p[47] & 0x80000000) != 0)
  {
    std::string::__init_copy_ctor_external((std::string *)(a4 + 128), *(const std::string::value_type **)&__p[24], *(std::string::size_type *)&__p[32]);
  }
  else
  {
    *(_OWORD *)(a4 + 128) = *(_OWORD *)&__p[24];
    *(void *)(a4 + 144) = *(void *)&__p[40];
  }
  unsigned int v33 = a2;
  *(_WORD *)(a4 + 152) = *(_WORD *)&__p[48];
  *(unsigned char *)(a4 + 154) = __p[50];
  MEMORY[0x2455C23B0]();
  long long v12 = v70;
  *(_OWORD *)(a4 + 32_TIBeginMockingSingletonsWithData(0, 0, 0, 0, 1, 0) = v69;
  *(_OWORD *)(a4 + 336) = v12;
  *(void *)(a4 + 352) = v71;
  long long v13 = v66;
  *(_OWORD *)(a4 + 256) = *(_OWORD *)&v65[64];
  *(_OWORD *)(a4 + 272) = v13;
  long long v14 = v68;
  *(_OWORD *)(a4 + 288) = v67;
  *(_OWORD *)(a4 + 304) = v14;
  long long v15 = *(_OWORD *)&v65[16];
  *(_OWORD *)(a4 + 192) = *(_OWORD *)v65;
  *(_OWORD *)(a4 + 208) = v15;
  long long v16 = *(_OWORD *)&v65[48];
  *(_OWORD *)(a4 + 224) = *(_OWORD *)&v65[32];
  *(_OWORD *)(a4 + 24_TIBeginMockingSingletonsWithData(0, 0, 0, 0, 1, 0) = v16;
  printf("initial score: %g\n", v8);
  unsigned int v17 = 0;
  unsigned int v18 = 0;
  unsigned int v19 = 1;
  double v20 = 0.01;
  double v21 = v8;
  do
  {
    TI::CP::CPTrainer::perturb(v33, (uint64_t)v58, 0, (uint64_t)&v35);
    double v22 = (*(double (**)(uint64_t, void, long long *, uint64_t))(*(void *)a1 + 24))(a1, v33, &v35, a3);
    double v23 = v22;
    double v24 = 1.0;
    if (v22 <= v21) {
      double v24 = exp(-(v21 - v22) / v20);
    }
    if (uniform_random(0.0, 1.0) >= v24)
    {
      printf("rejected: %g [p=%.3g f=%.3g n=%u t=%.3g s=%u]\n", v23, v24, (float)((float)v17 / (float)v19), v19, v20, v18++);
    }
    else
    {
      *(_OWORD *)&v60[16] = v39;
      long long v61 = v40;
      uint64_t v62 = v41;
      *(_OWORD *)unint64_t v58 = v35;
      *(_OWORD *)&v58[16] = v36;
      long long v59 = v37;
      *(_OWORD *)uint64_t v60 = v38;
      std::string::operator=((std::string *)__p, &v42);
      std::string::operator=((std::string *)&__p[24], &v43);
      *(_WORD *)&__p[48] = v44;
      __p[50] = v45;
      KB::String::operator=();
      ++v17;
      long long v69 = v55;
      long long v70 = v56;
      uint64_t v71 = v57;
      *(_OWORD *)&v65[64] = v51;
      long long v66 = v52;
      long long v67 = v53;
      long long v68 = v54;
      *(_OWORD *)unsigned int v65 = v47;
      *(_OWORD *)&v65[16] = v48;
      *(_OWORD *)&v65[32] = v49;
      *(_OWORD *)&v65[48] = v50;
      if (v23 <= v8)
      {
        printf("accepted: %g [p=%.3g, f=%.3g n=%u t=%.3g s=%u]\n", v23, v24, (float)((float)v17 / (float)v19), v19, v20, v18);
        unsigned int v18 = 0;
        double v21 = v23;
      }
      else
      {
        long long v25 = v40;
        *(_OWORD *)(a4 + 64) = v39;
        *(_OWORD *)(a4 + 8_TIBeginMockingSingletonsWithData(0, 0, 0, 0, 1, 0) = v25;
        *(void *)(a4 + 96) = v41;
        long long v26 = v36;
        *(_OWORD *)a4 = v35;
        *(_OWORD *)(a4 + 16) = v26;
        long long v27 = v38;
        *(_OWORD *)(a4 + 32) = v37;
        *(_OWORD *)(a4 + 48) = v27;
        std::string::operator=((std::string *)(a4 + 104), &v42);
        std::string::operator=((std::string *)(a4 + 128), &v43);
        *(_WORD *)(a4 + 152) = v44;
        *(unsigned char *)(a4 + 154) = v45;
        KB::String::operator=();
        long long v28 = v56;
        *(_OWORD *)(a4 + 32_TIBeginMockingSingletonsWithData(0, 0, 0, 0, 1, 0) = v55;
        *(_OWORD *)(a4 + 336) = v28;
        *(void *)(a4 + 352) = v57;
        long long v29 = v52;
        *(_OWORD *)(a4 + 256) = v51;
        *(_OWORD *)(a4 + 272) = v29;
        long long v30 = v54;
        *(_OWORD *)(a4 + 288) = v53;
        *(_OWORD *)(a4 + 304) = v30;
        long long v31 = v48;
        *(_OWORD *)(a4 + 192) = v47;
        *(_OWORD *)(a4 + 208) = v31;
        long long v32 = v50;
        *(_OWORD *)(a4 + 224) = v49;
        *(_OWORD *)(a4 + 24_TIBeginMockingSingletonsWithData(0, 0, 0, 0, 1, 0) = v32;
        printf("accepted: %g [p=%.3g f=%.3g n=%u t=%.3g s=%u] (new hi score)\n", v23, v24, (float)((float)v17 / (float)v19), v19, v20, v18);
        unsigned int v18 = 0;
        double v21 = v23;
        double v8 = v23;
      }
    }
    print_parameters((double *)v58);
    puts("======");
    KB::String::~String((KB::String *)v46);
    if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v43.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v42.__r_.__value_.__l.__data_);
    }
    double v20 = v20 * 0.95;
    ++v19;
  }
  while (v18 < 0xC8);
  printf("final score: %g\n", v8);
  puts("final params:");
  print_parameters((double *)a4);
  KB::String::~String((KB::String *)v64);
  if ((__p[47] & 0x80000000) != 0) {
    operator delete(*(void **)&__p[24]);
  }
  if ((__p[23] & 0x80000000) != 0) {
    operator delete(*(void **)__p);
  }
}

void sub_23F0302B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void **a18, TI::CP::EnsembleConfig *a19)
{
  if (*((char *)a19 + 127) < 0) {
    operator delete(*a18);
  }
  TI::CP::EnsembleConfig::~EnsembleConfig((void **)&STACK[0x200]);
  _Unwind_Resume(a1);
}

double TI::CP::CPTrainer::initial_parameters_for_training@<D0>(TI::CP::CPTrainer *this@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = 4;
  *(void *)(a2 + 24) = 0;
  *(_OWORD *)(a2 + 8) = xmmword_23F04A588;
  *(void *)(a2 + 48) = 0x3FF0000000000000;
  *(_OWORD *)(a2 + 32) = xmmword_23F04A5A0;
  *(void *)(a2 + 72) = 0;
  *(_OWORD *)(a2 + 56) = xmmword_23F04A5B8;
  *(_DWORD *)(a2 + 8_TIBeginMockingSingletonsWithData(0, 0, 0, 0, 1, 0) = 1056964608;
  *(void *)(a2 + 88) = 0x200000001;
  *(unsigned char *)(a2 + 96) = 1;
  *(_DWORD *)(a2 + 10_TIBeginMockingSingletonsWithData(0, 0, 0, 0, 1, 0) = 3;
  *(_OWORD *)(a2 + 104) = 0u;
  *(_OWORD *)(a2 + 12_TIBeginMockingSingletonsWithData(0, 0, 0, 0, 1, 0) = 0u;
  *(_OWORD *)(a2 + 136) = 0u;
  *(_DWORD *)(a2 + 151) = 0;
  KB::String::String((KB::String *)(a2 + 160));
  *(_DWORD *)(a2 + 192) = 1050253722;
  *(unsigned char *)(a2 + 336) = 1;
  *(void *)(a2 + 344) = 0x404B30CB295E9E1BLL;
  *(void *)(a2 + 352) = 0x4019D81D7DBF4880;
  __asm { FMOV            V0.2D, #0.5 }
  *(_OWORD *)(a2 + 20_TIBeginMockingSingletonsWithData(0, 0, 0, 0, 1, 0) = _Q0;
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)(a2 + 216) = _Q0;
  *(_OWORD *)(a2 + 232) = xmmword_23F04A4A0;
  *(_OWORD *)(a2 + 248) = xmmword_23F04A4B0;
  *(void *)(a2 + 264) = 0x4010000000000000;
  *(_OWORD *)(a2 + 272) = xmmword_23F04A4C0;
  *(_OWORD *)(a2 + 288) = xmmword_23F04A4D0;
  *(_OWORD *)(a2 + 304) = xmmword_23F04A420;
  *(_OWORD *)(a2 + 32_TIBeginMockingSingletonsWithData(0, 0, 0, 0, 1, 0) = xmmword_23F04A4E0;
  *(_DWORD *)(a2 + 10_TIBeginMockingSingletonsWithData(0, 0, 0, 0, 1, 0) = 3;
  double result = 0.6;
  *(_OWORD *)(a2 + 8) = xmmword_23F04A4F0;
  *(void *)(a2 + 24) = 0;
  return result;
}

void sub_23F0304B0(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 151) < 0) {
    operator delete(*(void **)(v1 + 128));
  }
  if (*(char *)(v1 + 127) < 0) {
    operator delete(*v2);
  }
  _Unwind_Resume(exception_object);
}

void TI::CP::CPTrainer::perturb(int a1@<W1>, uint64_t a2@<X2>, int a3@<W3>, uint64_t a4@<X8>)
{
  long long v8 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a4 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a4 + 8_TIBeginMockingSingletonsWithData(0, 0, 0, 0, 1, 0) = v8;
  *(void *)(a4 + 96) = *(void *)(a2 + 96);
  long long v9 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a4 = *(_OWORD *)a2;
  *(_OWORD *)(a4 + 16) = v9;
  long long v10 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a4 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a4 + 48) = v10;
  long long v11 = (std::string *)(a4 + 104);
  if (*(char *)(a2 + 127) < 0)
  {
    std::string::__init_copy_ctor_external(v11, *(const std::string::value_type **)(a2 + 104), *(void *)(a2 + 112));
  }
  else
  {
    *(_OWORD *)&v11->__r_.__value_.__l.__data_ = *(_OWORD *)(a2 + 104);
    *(void *)(a4 + 12_TIBeginMockingSingletonsWithData(0, 0, 0, 0, 1, 0) = *(void *)(a2 + 120);
  }
  if (*(char *)(a2 + 151) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)(a4 + 128), *(const std::string::value_type **)(a2 + 128), *(void *)(a2 + 136));
  }
  else
  {
    *(_OWORD *)(a4 + 128) = *(_OWORD *)(a2 + 128);
    *(void *)(a4 + 144) = *(void *)(a2 + 144);
  }
  *(_WORD *)(a4 + 152) = *(_WORD *)(a2 + 152);
  *(unsigned char *)(a4 + 154) = *(unsigned char *)(a2 + 154);
  MEMORY[0x2455C23B0](a4 + 160, a2 + 160);
  long long v12 = *(_OWORD *)(a2 + 336);
  *(_OWORD *)(a4 + 32_TIBeginMockingSingletonsWithData(0, 0, 0, 0, 1, 0) = *(_OWORD *)(a2 + 320);
  *(_OWORD *)(a4 + 336) = v12;
  *(void *)(a4 + 352) = *(void *)(a2 + 352);
  long long v13 = *(_OWORD *)(a2 + 272);
  *(_OWORD *)(a4 + 256) = *(_OWORD *)(a2 + 256);
  *(_OWORD *)(a4 + 272) = v13;
  long long v14 = *(_OWORD *)(a2 + 304);
  *(_OWORD *)(a4 + 288) = *(_OWORD *)(a2 + 288);
  *(_OWORD *)(a4 + 304) = v14;
  long long v15 = *(_OWORD *)(a2 + 208);
  *(_OWORD *)(a4 + 192) = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a4 + 208) = v15;
  long long v16 = *(_OWORD *)(a2 + 240);
  *(_OWORD *)(a4 + 224) = *(_OWORD *)(a2 + 224);
  *(_OWORD *)(a4 + 24_TIBeginMockingSingletonsWithData(0, 0, 0, 0, 1, 0) = v16;
  double v17 = *(double *)(a4 + 200);
  uint64_t v67 = *(void *)(a4 + 232);
  uint64_t v68 = *(void *)(a4 + 216);
  double v58 = *(double *)(a4 + 240);
  double v59 = *(double *)(a4 + 224);
  double v65 = *(double *)(a4 + 256);
  double v66 = *(double *)(a4 + 248);
  double v69 = *(double *)(a4 + 272);
  uint64_t v70 = *(void *)(a4 + 280);
  uint64_t v71 = *(void *)(a4 + 264);
  double v63 = *(double *)(a4 + 296);
  double v64 = *(double *)(a4 + 288);
  uint64_t v73 = *(void *)(a4 + 320);
  uint64_t v18 = *(void *)(a4 + 336);
  double v60 = *(double *)(a4 + 344);
  double v61 = *(double *)(a4 + 328);
  double v62 = *(double *)(a4 + 352);
  long long v72 = *(_OWORD *)(a4 + 304);
  long long v74 = xmmword_23F04A500;
  char v75 = 0;
  unsigned int v19 = (std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *)random_number_generator();
  double v20 = log(1.0 / v17 + -1.0);
  double v21 = std::normal_distribution<double>::operator()<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>((uint64_t)&v74, v19, (double *)&v74);
  double v57 = exp(-(v21 - v20));
  long long v74 = xmmword_23F04A500;
  char v75 = 0;
  double v22 = (std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *)random_number_generator();
  double v23 = std::normal_distribution<double>::operator()<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>((uint64_t)&v74, v22, (double *)&v74);
  double v56 = exp(v23);
  long long v74 = xmmword_23F04A500;
  char v75 = 0;
  double v24 = (std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *)random_number_generator();
  double v25 = std::normal_distribution<double>::operator()<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>((uint64_t)&v74, v24, (double *)&v74);
  double v55 = exp(v25);
  long long v74 = xmmword_23F04A500;
  char v75 = 0;
  long long v26 = (std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *)random_number_generator();
  double v27 = std::normal_distribution<double>::operator()<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>((uint64_t)&v74, v26, (double *)&v74);
  double v54 = exp(v27);
  long long v74 = xmmword_23F04A500;
  char v75 = 0;
  long long v28 = (std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *)random_number_generator();
  double v29 = std::normal_distribution<double>::operator()<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>((uint64_t)&v74, v28, (double *)&v74);
  double v30 = exp(v29);
  long long v74 = xmmword_23F04A500;
  char v75 = 0;
  long long v31 = (std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *)random_number_generator();
  double v32 = std::normal_distribution<double>::operator()<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>((uint64_t)&v74, v31, (double *)&v74);
  double v33 = exp(v32);
  long long v74 = xmmword_23F04A500;
  char v75 = 0;
  int v34 = (std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *)random_number_generator();
  double v35 = std::normal_distribution<double>::operator()<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>((uint64_t)&v74, v34, (double *)&v74);
  double v36 = exp(v35);
  long long v74 = xmmword_23F04A500;
  char v75 = 0;
  long long v37 = (std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *)random_number_generator();
  double v38 = std::normal_distribution<double>::operator()<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>((uint64_t)&v74, v37, (double *)&v74);
  double v39 = exp(v38);
  long long v74 = xmmword_23F04A500;
  char v75 = 0;
  long long v40 = (std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *)random_number_generator();
  double v41 = std::normal_distribution<double>::operator()<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>((uint64_t)&v74, v40, (double *)&v74);
  double v42 = exp(v41);
  long long v74 = xmmword_23F04A500;
  char v75 = 0;
  std::string v43 = (std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *)random_number_generator();
  double v44 = std::normal_distribution<double>::operator()<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>((uint64_t)&v74, v43, (double *)&v74);
  double v45 = exp(v44);
  long long v74 = xmmword_23F04A500;
  char v75 = 0;
  uint64_t v46 = (std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *)random_number_generator();
  double v47 = std::normal_distribution<double>::operator()<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>((uint64_t)&v74, v46, (double *)&v74);
  double v48 = exp(v47);
  long long v74 = xmmword_23F04A500;
  char v75 = 0;
  long long v49 = (std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *)random_number_generator();
  double v50 = std::normal_distribution<double>::operator()<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>((uint64_t)&v74, v49, (double *)&v74);
  double v51 = exp(v50);
  int v52 = *(_DWORD *)(a4 + 100);
  if (v52)
  {
    uniform_random(-0.05, 0.05);
    int v52 = *(_DWORD *)(a4 + 100);
  }
  if ((v52 & 2) != 0)
  {
    uniform_random(-0.05, 0.05);
    int v52 = *(_DWORD *)(a4 + 100);
  }
  if ((v52 & 4) != 0) {
    uniform_random(-0.05, 0.05);
  }
  if (!a1 || a3)
  {
    double v53 = 1.0 / (v57 + 1.0);
    *(double *)(a4 + 20_TIBeginMockingSingletonsWithData(0, 0, 0, 0, 1, 0) = v53;
    *(double *)(a4 + 208) = 1.0 - v53;
    *(void *)(a4 + 216) = v68;
    *(double *)(a4 + 224) = v59 * v30;
    *(void *)(a4 + 232) = v67;
    *(double *)(a4 + 24_TIBeginMockingSingletonsWithData(0, 0, 0, 0, 1, 0) = v58 * v56;
    *(double *)(a4 + 248) = v66 * v54;
    *(double *)(a4 + 256) = v65 * v55 * v36;
    *(void *)(a4 + 264) = v71;
    *(double *)(a4 + 272) = v69 * v42;
    *(void *)(a4 + 28_TIBeginMockingSingletonsWithData(0, 0, 0, 0, 1, 0) = v70;
    *(double *)(a4 + 288) = v64 * v33;
    *(double *)(a4 + 296) = v63 * v39;
    *(_OWORD *)(a4 + 304) = v72;
    *(void *)(a4 + 32_TIBeginMockingSingletonsWithData(0, 0, 0, 0, 1, 0) = v73;
    *(double *)(a4 + 328) = v61 * v45;
    *(void *)(a4 + 336) = v18;
    *(double *)(a4 + 344) = v60 * v48;
    *(double *)(a4 + 352) = v62 * v51;
  }
  if (a1 == 3 || a3)
  {
    *(int64x2_t *)(a4 + 8) = vdupq_n_s64(0x7FF8000000000000uLL);
    *(void *)(a4 + 24) = 0x7FF8000000000000;
  }
}

void sub_23F0309B4(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 127) < 0) {
    operator delete(*v2);
  }
  _Unwind_Resume(exception_object);
}

double uniform_random(double a1, double a2)
{
  long long v4 = (std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *)random_number_generator();
  double v5 = (double)std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(v4);
  return a1
       + (a2 - a1)
       * ((v5
         + (double)std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(v4)
         * 4294967300.0)
        * 5.42101086e-20);
}

uint64_t print_parameters(double *a1)
{
  printf("  geometry_weight = %g\n", a1[25]);
  printf("  language_weight = %g\n", a1[26]);
  printf("  path_deviation_power = %g\n", a1[27]);
  printf("  path_deviation_weight = %g\n", a1[28]);
  printf("  key_deviation_power = %g\n", a1[29]);
  printf("  key_deviation_weight = %g\n", a1[30]);
  printf("  first_key_deviation_weight = %g\n", a1[31]);
  printf("  inflection_point_key_deviation_weight = %g\n", a1[32]);
  printf("  far_key_distance = %g\n", a1[33]);
  printf("  skipped_key_cost = %g\n", a1[34]);
  printf("  skipped_inflection_point_cost = %g\n", a1[37]);
  printf("  overshoot_power = %g\n", a1[35]);
  printf("  overshoot_weight = %g\n", a1[36]);
  printf("  transposition_cost = %g\n", a1[41]);
  printf("  first_key_prediction_cost = %g\n", a1[43]);
  printf("  non_first_key_prediction_cost = %g\n", a1[44]);
  printf("  ensemble favonius (cp_search) coefficient = %f\n", a1[1]);
  printf("  ensemble ml coefficient = %f\n", a1[2]);
  return printf("  ensemble shape recognizer coefficient = %f\n", a1[3]);
}

uint64_t random_number_generator(void)
{
  {
    __cxa_atexit((void (*)(void *))std::unique_ptr<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>::~unique_ptr[abi:nn180100], &random_number_generator(void)::generator, &dword_23EFD2000);
  }
  if (random_number_generator(void)::once_token != -1) {
    dispatch_once(&random_number_generator(void)::once_token, &__block_literal_global_5875);
  }
  return random_number_generator(void)::generator;
}

void ___ZL23random_number_generatorv_block_invoke()
{
}

uint64_t *std::unique_ptr<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>::~unique_ptr[abi:nn180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2) {
    MEMORY[0x2455C26F0](v2, 0x1000C407BAC9B3ELL);
  }
  return a1;
}

void TI::CP::CPTrainer::CPTrainer(TI::CP::CPTrainer *this)
{
  *(void *)this = &unk_26F2B77E8;
  *(_OWORD *)((char *)this + 8) = 0u;
  *((void *)this + 9) = 0;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((unsigned char *)this + 4_TIBeginMockingSingletonsWithData(0, 0, 0, 0, 1, 0) = 0;
  operator new();
}

void sub_23F030F04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void **a10)
{
  MEMORY[0x2455C26F0](v11, 0x10F3C40AA89C550);
  std::__function::__value_func<TI::CP::ContinuousPathTestCase ()(unsigned int,unsigned int,BOOL)>::~__value_func[abi:nn180100]((void *)(v10 + 48));
  a10 = (void **)(v10 + 16);
  std::vector<TI::CP::ContinuousPathTestCase>::__destroy_vector::operator()[abi:nn180100](&a10);
  uint64_t v14 = *v12;
  *long long v12 = 0;
  if (v14) {
    (*(void (**)(uint64_t))(*(void *)v14 + 8))(v14);
  }
  _Unwind_Resume(a1);
}

void TI::CP::CPTrainer::CPTrainer(TI::CP::CPTrainer *this, NSString *a2)
{
  uint64_t v3 = a2;
  *(void *)this = &unk_26F2B77E8;
  *(_OWORD *)((char *)this + 8) = 0u;
  *((void *)this + 9) = 0;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((unsigned char *)this + 4_TIBeginMockingSingletonsWithData(0, 0, 0, 0, 1, 0) = 0;
  operator new();
}

void sub_23F03104C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void **a10)
{
  uint64_t v14 = v12;
  MEMORY[0x2455C26F0](v14, 0x10F3C40AA89C550);
  std::__function::__value_func<TI::CP::ContinuousPathTestCase ()(unsigned int,unsigned int,BOOL)>::~__value_func[abi:nn180100]((void *)(v11 + 48));
  a10 = (void **)(v11 + 16);
  std::vector<TI::CP::ContinuousPathTestCase>::__destroy_vector::operator()[abi:nn180100](&a10);
  uint64_t v16 = *v13;
  *long long v13 = 0;
  if (v16) {
    (*(void (**)(uint64_t))(*(void *)v16 + 8))(v16);
  }

  _Unwind_Resume(a1);
}

void TI::CP::CPTrainer::CPTrainer(uint64_t a1, void *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  id v3 = a2;
  *(void *)a1 = &unk_26F2B77E8;
  *(_OWORD *)(a1 + 8) = 0u;
  *(void *)(a1 + 72) = 0;
  *(_OWORD *)(a1 + 24) = 0u;
  *(unsigned char *)(a1 + 4_TIBeginMockingSingletonsWithData(0, 0, 0, 0, 1, 0) = 0;
  operator new();
}

void sub_23F031468(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void **a13)
{
  std::__function::__value_func<TI::CP::ContinuousPathTestCase ()(unsigned int,unsigned int,BOOL)>::~__value_func[abi:nn180100](v15);
  a13 = (void **)(v14 + 16);
  std::vector<TI::CP::ContinuousPathTestCase>::__destroy_vector::operator()[abi:nn180100](&a13);
  uint64_t v18 = *v16;
  uint64_t *v16 = 0;
  if (v18) {
    (*(void (**)(uint64_t))(*(void *)v18 + 8))(v18);
  }

  _Unwind_Resume(a1);
}

double TI::CP::CPTrainer::calculate_score(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = a2[1];
  double v3 = 0.0;
  if (*a2 != v2)
  {
    uint64_t v4 = *a2;
    do
    {
      int v5 = *(_DWORD *)(v4 + 144);
      double v6 = -4.0;
      if (v5 != -1) {
        double v6 = (double)v5 / ((double)v5 + 3.0) * -4.0;
      }
      double v3 = v3 + v6;
      v4 += 232;
    }
    while (v4 != v2);
  }
  return v3 / (double)(unint64_t)(0x34F72C234F72C235 * ((v2 - *a2) >> 3));
}

void sub_23F03284C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6193(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4_TIBeginMockingSingletonsWithData(0, 0, 0, 0, 1, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4_TIBeginMockingSingletonsWithData(0, 0, 0, 0, 1, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__6194(uint64_t a1)
{
}

void sub_23F032AC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23F0339B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23F0352C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23F03677C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23F036BE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23F03753C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23F0397D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_23F039BC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 208), 8);
  _Unwind_Resume(a1);
}

uint64_t actDsllex(void *a1)
{
  p_inst_meths = &OBJC_PROTOCOL___TIClientProxy.inst_meths;
  uint64_t v2 = &OBJC_PROTOCOL___TIClientProxy.inst_meths;
  double v3 = &OBJC_PROTOCOL___TIClientProxy.inst_meths;
  if ((yy_init & 1) == 0)
  {
    yy_init = 1;
    if (!yy_start) {
      yy_start = 1;
    }
    if (!actDslin) {
      actDslin = *MEMORY[0x263EF8350];
    }
    if (!actDslout) {
      actDslout = *MEMORY[0x263EF8358];
    }
    uint64_t v4 = yy_buffer_stack;
    if (yy_buffer_stack
      && (uint64_t v5 = yy_buffer_stack_top, (buffer = *(void *)(yy_buffer_stack + 8 * yy_buffer_stack_top)) != 0))
    {
      unint64_t v7 = (__objc2_meth_list **)(&OBJC_PROTOCOL___TIClientProxy + 24);
    }
    else
    {
      actDslensure_buffer_stack();
      unint64_t v7 = &OBJC_PROTOCOL___TIClientProxy.inst_meths;
      uint64_t buffer = actDsl_create_buffer((FILE *)actDslin, 0x4000);
      double v3 = &OBJC_PROTOCOL___TIClientProxy.inst_meths;
      uint64_t v4 = yy_buffer_stack;
      uint64_t v5 = yy_buffer_stack_top;
      *(void *)(yy_buffer_stack + 8 * yy_buffer_stack_top) = buffer;
    }
    yy_n_chars = *(void *)(buffer + 32);
    long long v8 = *(char **)(buffer + 16);
    yy_c_buf_p = (uint64_t)v8;
    actDsltext = (uint64_t)v8;
    v7[502] = **(__objc2_meth_list ***)(v4 + 8 * v5);
    yy_hold_char = *v8;
  }
  long long v9 = &OBJC_PROTOCOL___TIClientProxy.inst_meths;
  uint64_t v10 = &OBJC_PROTOCOL___TIClientProxy.inst_meths;
  uint64_t v11 = &OBJC_PROTOCOL___TIClientProxy.inst_meths;
LABEL_14:
  uint64_t v12 = yy_c_buf_p;
  *(unsigned char *)yy_c_buf_p = *((unsigned char *)p_inst_meths + 3968);
  LODWORD(v13) = *(_DWORD *)(*(void *)&v2[493][(void)v3[494]] + 48) + yy_start;
  uint64_t v14 = v12;
  while (1)
  {
    do
    {
LABEL_15:
      uint64_t v15 = yy_ec[*(unsigned __int8 *)v12];
      if (yy_accept[(int)v13])
      {
        *((_DWORD *)v10 + 993) = v13;
        v9[497] = (__objc2_meth_list *)v12;
      }
      uint64_t v16 = (int)v13;
      uint64_t v17 = yy_base[(int)v13] + v15;
      if (v13 != (__int16)yy_chk[v17])
      {
        do
        {
          uint64_t v16 = yy_def[v16];
          if (v16 >= 82) {
            uint64_t v15 = *((unsigned __int8 *)&yy_meta + v15);
          }
          uint64_t v17 = yy_base[v16] + v15;
        }
        while (yy_chk[v17] != (unsigned __int16)v16);
      }
      uint64_t v13 = yy_nxt[v17];
      ++v12;
    }
    while (yy_base[v13] != 139);
    while (2)
    {
      int v18 = (unsigned __int16)yy_accept[(int)v13];
      if (!yy_accept[(int)v13])
      {
        uint64_t v12 = (uint64_t)v9[497];
        int v18 = (unsigned __int16)yy_accept[*((int *)v10 + 993)];
      }
      int v19 = (__int16)v18;
      actDsltext = v14;
      actDslleng = v12 - v14;
      *((unsigned char *)p_inst_meths + 3968) = *(unsigned char *)v12;
      *(unsigned char *)uint64_t v12 = 0;
      yy_c_buf_p = v12;
      if (v18 != 29 && ((0x1EFEFF9DuLL >> v18) & 1) == 0)
      {
        uint64_t v20 = actDslleng;
        if (actDslleng)
        {
          int v21 = *((_DWORD *)v11 + 924);
          double v22 = (unsigned __int8 *)actDsltext;
          do
          {
            int v23 = *v22++;
            if (v23 == 10) {
              *((_DWORD *)v11 + 924) = ++v21;
            }
            --v20;
          }
          while (v20);
        }
      }
LABEL_31:
      switch(v19)
      {
        case 0:
          *(unsigned char *)uint64_t v12 = *((unsigned char *)p_inst_meths + 3968);
          uint64_t v12 = (uint64_t)v9[497];
          LODWORD(v13) = *((_DWORD *)v10 + 993);
          continue;
        case 1:
        case 7:
        case 20:
          if (actDslleng) {
            *(_DWORD *)(*(void *)&v2[493][(void)v3[494]] + 48) = *(unsigned __int8 *)(actDslleng + actDsltext - 1) == 10;
          }
          goto LABEL_14;
        case 2:
          if (actDslleng) {
            *(_DWORD *)(*(void *)&v2[493][(void)v3[494]] + 48) = *(unsigned __int8 *)(actDslleng + actDsltext - 1) == 10;
          }
          yy_push_state(1);
          return 262;
        case 3:
          int64x2_t v87 = v2;
          unint64_t v88 = (const char *)actDsltext;
          if (actDslleng) {
            *(_DWORD *)(*(void *)&v87[493][(void)v3[494]] + 48) = *(unsigned __int8 *)(actDslleng + actDsltext - 1) == 10;
          }
          if (!strcasecmp(v88, "set")) {
            return 263;
          }
          if (!strcasecmp(v88, "yes")) {
            return 260;
          }
          if (!strcasecmp(v88, "no")) {
            return 261;
          }
          uint64_t v89 = v88;
LABEL_180:
          actDsllval = (uint64_t)strdup(v89);
          return 272;
        case 4:
          long long v90 = (const char *)actDsltext;
          if (actDslleng) {
            *(_DWORD *)(*(void *)&v2[493][(void)v3[494]] + 48) = *(unsigned __int8 *)(actDslleng + actDsltext - 1) == 10;
          }
          LODWORD(actDsllval) = atoi(v90);
          return 266;
        case 5:
        case 6:
          if (actDslleng) {
            *(_DWORD *)(*(void *)&v2[493][(void)v3[494]] + 48) = *(unsigned __int8 *)(actDslleng + actDsltext - 1) == 10;
          }
          yy_pop_state();
          return 264;
        case 8:
          if (actDslleng) {
            *(_DWORD *)(*(void *)&v2[493][(void)v3[494]] + 48) = *(unsigned __int8 *)(actDslleng + actDsltext - 1) == 10;
          }
          int v67 = 4;
          goto LABEL_135;
        case 9:
          if (actDslleng) {
            *(_DWORD *)(*(void *)&v2[493][(void)v3[494]] + 48) = *(unsigned __int8 *)(actDslleng + actDsltext - 1) == 10;
          }
          yy_pop_state();
          actDsllval = (uint64_t)strndup(stringBuf, stringLen);
          stringLen = 0;
          return 269;
        case 10:
          if (actDslleng) {
            *(_DWORD *)(*(void *)&v2[493][(void)v3[494]] + 48) = *(unsigned __int8 *)(actDslleng + actDsltext - 1) == 10;
          }
          int v67 = 3;
          goto LABEL_135;
        case 11:
          if (actDslleng) {
            *(_DWORD *)(*(void *)&v2[493][(void)v3[494]] + 48) = *(unsigned __int8 *)(actDslleng + actDsltext - 1) == 10;
          }
          yy_pop_state();
          actDsllval = (uint64_t)strndup(stringBuf, stringLen);
          stringLen = 0;
          return 270;
        case 12:
          if (actDslleng) {
            *(_DWORD *)(*(void *)&v2[493][(void)v3[494]] + 48) = *(unsigned __int8 *)(actDslleng + actDsltext - 1) == 10;
          }
          int v67 = 5;
          goto LABEL_135;
        case 13:
          if (actDslleng) {
            *(_DWORD *)(*(void *)&v2[493][(void)v3[494]] + 48) = *(unsigned __int8 *)(actDslleng + actDsltext - 1) == 10;
          }
          yy_pop_state();
          actDsllval = (uint64_t)strndup(stringBuf, stringLen);
          stringLen = 0;
          return 271;
        case 14:
        case 15:
          if (actDslleng) {
            *(_DWORD *)(*(void *)&v2[493][(void)v3[494]] + 48) = *(unsigned __int8 *)(actDslleng + actDsltext - 1) == 10;
          }
          yy_pop_state();
          actDsllval = (uint64_t)strndup(stringBuf, stringLen);
          stringLen = 0;
          return 268;
        case 16:
          if (actDslleng) {
            *(_DWORD *)(*(void *)&v2[493][(void)v3[494]] + 48) = *(unsigned __int8 *)(actDslleng + actDsltext - 1) == 10;
          }
          uint64_t v68 = v3;
          int v69 = yy_start;
          if (yy_start >= 1) {
            int v69 = yy_start - 1;
          }
          unsigned int v70 = (v69 >> 1) - 2;
          if (v70 <= 5) {
            handleErrorWithLineNumber(a1, (uint64_t)off_265050638[v70], (actDsllineno - 1));
          }
          yy_pop_state();
          stringLen = 0;
          goto LABEL_136;
        case 17:
          uint64_t v71 = p_inst_meths;
          long long v72 = v2;
          uint64_t v73 = v3;
          uint64_t v74 = actDslleng;
          char v75 = (const char *)actDsltext;
          if (actDslleng) {
            *(_DWORD *)(*(void *)&v72[493][(void)v3[494]] + 48) = *(unsigned __int8 *)(actDslleng + actDsltext - 1) == 10;
          }
          if (!strcmp(v75, "\\n"))
          {
            uint64_t v85 = stringLen++;
            stringBuf[v85] = 10;
          }
          else
          {
            int v76 = strcmp(v75, "\\t");
            uint64_t v77 = stringLen;
            if (v76)
            {
              memcpy(&stringBuf[stringLen], v75 + 1, v74 - 1);
              stringLen = v74 + v77 - 1;
            }
            else
            {
              ++stringLen;
              stringBuf[v77] = 9;
            }
          }
          double v3 = v73;
          uint64_t v2 = v72;
          p_inst_meths = v71;
          goto LABEL_143;
        case 18:
          size_t v78 = actDslleng;
          uint64_t v79 = (const void *)actDsltext;
          if (actDslleng) {
            *(_DWORD *)(*(void *)&v2[493][(void)v3[494]] + 48) = *(unsigned __int8 *)(actDslleng + actDsltext - 1) == 10;
          }
          uint64_t v80 = v2;
          uint64_t v81 = v3;
          int v82 = stringLen;
          memcpy(&stringBuf[stringLen], v79, v78);
          stringLen = v82 + v78;
          double v3 = v81;
          uint64_t v2 = v80;
          goto LABEL_143;
        case 19:
          if (actDslleng) {
            *(_DWORD *)(*(void *)&v2[493][(void)v3[494]] + 48) = *(unsigned __int8 *)(actDslleng + actDsltext - 1) == 10;
          }
          yy_push_state(2);
          return 258;
        case 21:
          if (actDslleng) {
            *(_DWORD *)(*(void *)&v2[493][(void)v3[494]] + 48) = *(unsigned __int8 *)(actDslleng + actDsltext - 1) == 10;
          }
          return 265;
        case 22:
          uint64_t v89 = (const char *)actDsltext;
          if (actDslleng) {
            *(_DWORD *)(*(void *)&v2[493][(void)v3[494]] + 48) = *(unsigned __int8 *)(actDslleng + actDsltext - 1) == 10;
          }
          goto LABEL_180;
        case 23:
          if (actDslleng) {
            *(_DWORD *)(*(void *)&v2[493][(void)v3[494]] + 48) = *(unsigned __int8 *)(actDslleng + actDsltext - 1) == 10;
          }
          yy_pop_state();
          return 259;
        case 24:
          if (actDslleng) {
            *(_DWORD *)(*(void *)&v2[493][(void)v3[494]] + 48) = *(unsigned __int8 *)(actDslleng + actDsltext - 1) == 10;
          }
          return 264;
        case 25:
          int v91 = (const char *)actDsltext;
          if (actDslleng) {
            *(_DWORD *)(*(void *)&v2[493][(void)v3[494]] + 48) = *(unsigned __int8 *)(actDslleng + actDsltext - 1) == 10;
          }
          actDsllval = (uint64_t)strdup(v91);
          return 267;
        case 26:
          if (actDslleng) {
            *(_DWORD *)(*(void *)&v2[493][(void)v3[494]] + 48) = *(unsigned __int8 *)(actDslleng + actDsltext - 1) == 10;
          }
          int v67 = 7;
          goto LABEL_135;
        case 27:
          if (actDslleng) {
            *(_DWORD *)(*(void *)&v2[493][(void)v3[494]] + 48) = *(unsigned __int8 *)(actDslleng + actDsltext - 1) == 10;
          }
          int v67 = 6;
LABEL_135:
          uint64_t v68 = v3;
          yy_push_state(v67);
          goto LABEL_136;
        case 28:
          size_t v83 = actDslleng;
          int v84 = (const void *)actDsltext;
          if (actDslleng) {
            *(_DWORD *)(*(void *)&v2[493][(void)v3[494]] + 48) = *(unsigned __int8 *)(actDslleng + actDsltext - 1) == 10;
          }
          uint64_t v68 = v3;
          fwrite(v84, v83, 1uLL, (FILE *)actDslout);
LABEL_136:
          double v3 = v68;
LABEL_143:
          long long v9 = (__objc2_meth_list **)(&OBJC_PROTOCOL___TIClientProxy + 24);
          uint64_t v10 = (__objc2_meth_list **)(&OBJC_PROTOCOL___TIClientProxy + 24);
          uint64_t v11 = (__objc2_meth_list **)(&OBJC_PROTOCOL___TIClientProxy + 24);
          goto LABEL_14;
        case 29:
          int v24 = actDsltext;
          *(unsigned char *)uint64_t v12 = *((unsigned char *)p_inst_meths + 3968);
          uint64_t v25 = (uint64_t)v2[493];
          uint64_t v26 = (uint64_t)v3[494];
          uint64_t v27 = *(void *)(v25 + 8 * v26);
          if (*(_DWORD *)(v27 + 64))
          {
            uint64_t v28 = yy_n_chars;
          }
          else
          {
            uint64_t v28 = *(void *)(v27 + 32);
            yy_n_chars = v28;
            *(void *)uint64_t v27 = actDslin;
            uint64_t v27 = *(void *)(v25 + 8 * v26);
            *(_DWORD *)(v27 + 64) = 1;
          }
          LODWORD(v29) = yy_c_buf_p;
          double v30 = *(unsigned char **)(v27 + 8);
          if (yy_c_buf_p <= (unint64_t)&v30[v28])
          {
            double v61 = v3;
            uint64_t v12 = actDsltext + ~v24 + (int)v12;
            yy_c_buf_p = v12;
            LODWORD(v13) = yy_get_previous_state();
            if (yy_accept[(int)v13])
            {
              yy_last_accepting_state = v13;
              yy_last_accepting_cpos = v12;
            }
            uint64_t v62 = (int)v13;
            uint64_t v63 = yy_base[(int)v13] + 1;
            p_inst_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___TIClientProxy + 24);
            double v3 = v61;
            long long v9 = (__objc2_meth_list **)(&OBJC_PROTOCOL___TIClientProxy + 24);
            uint64_t v10 = (__objc2_meth_list **)(&OBJC_PROTOCOL___TIClientProxy + 24);
            uint64_t v11 = (__objc2_meth_list **)(&OBJC_PROTOCOL___TIClientProxy + 24);
            if (v13 != (__int16)yy_chk[v63])
            {
              do
              {
                int v64 = (unsigned __int16)yy_def[v62];
                uint64_t v62 = (__int16)v64;
                uint64_t v63 = yy_base[(__int16)v64] + 1;
              }
              while (v64 != yy_chk[v63]);
            }
            uint64_t v14 = actDsltext;
            if (v63)
            {
              int v65 = (unsigned __int16)yy_nxt[v63];
              if (v65 != 81)
              {
                LODWORD(v13) = (__int16)v65;
                yy_c_buf_p = ++v12;
                goto LABEL_15;
              }
            }
            continue;
          }
          int v94 = v24;
          uint64_t v95 = v14;
          if (yy_c_buf_p > (unint64_t)&v30[v28 + 1]) {
            yy_fatal_error("fatal flex scanner internal error--end of buffer missed");
          }
          uint64_t v31 = (char *)actDsltext;
          if (!*(_DWORD *)(v27 + 60))
          {
            p_inst_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___TIClientProxy + 24);
            if (yy_c_buf_p - actDsltext != 1) {
              goto LABEL_93;
            }
            goto LABEL_87;
          }
          int v32 = ~actDsltext + yy_c_buf_p;
          double v33 = (__objc2_meth_list **)(&OBJC_PROTOCOL___TIClientProxy + 24);
          if (v32 >= 1)
          {
            int v34 = ~actDsltext + yy_c_buf_p;
            do
            {
              char v35 = *v31++;
              *v30++ = v35;
              --v34;
            }
            while (v34);
            uint64_t v27 = *(void *)(v25 + 8 * v26);
          }
          uint64_t v96 = v32;
          if (*(_DWORD *)(v27 + 64) == 2)
          {
            yy_n_chars = 0;
            goto LABEL_44;
          }
          int v38 = ~v32;
          int v39 = *(_DWORD *)(v27 + 24);
          unsigned int v40 = v39 + ~v32;
          int v92 = v32;
          if (!v40)
          {
            double v41 = v3;
            do
            {
              if (!*(_DWORD *)(v27 + 40))
              {
                *(void *)(v27 + 8) = 0;
LABEL_195:
                yy_fatal_error("fatal error - scanner input buffer overflow");
              }
              double v42 = *(void **)(v27 + 8);
              int v43 = 2 * v39;
              *(_DWORD *)(v27 + 24) = v43;
              double v44 = malloc_type_realloc(v42, v43 + 2, 0xDB05E8D7uLL);
              *(void *)(v27 + 8) = v44;
              if (!v44) {
                goto LABEL_195;
              }
              uint64_t v29 = (uint64_t)v44 + (int)v29 - (int)v42;
              yy_c_buf_p = v29;
              uint64_t v27 = *(void *)(yy_buffer_stack + 8 * (void)v41[494]);
              int v39 = *(_DWORD *)(v27 + 24);
              unsigned int v40 = v39 + v38;
            }
            while (!(v39 + v38));
            double v33 = &OBJC_PROTOCOL___TIClientProxy.inst_meths;
          }
          if (v40 >= 0x2000) {
            size_t v45 = 0x2000;
          }
          else {
            size_t v45 = v40;
          }
          if (!*(_DWORD *)(v27 + 44))
          {
            *__error() = 0;
            uint64_t v2 = &OBJC_PROTOCOL___TIClientProxy.inst_meths;
            while (1)
            {
              size_t v48 = fread((void *)(*(void *)(*(void *)(yy_buffer_stack + 8 * yy_buffer_stack_top) + 8) + v96), 1uLL, v45, (FILE *)v33[502]);
              unint64_t v36 = (int)v48;
              yy_n_chars = (int)v48;
              if (v48 << 32)
              {
                double v3 = &OBJC_PROTOCOL___TIClientProxy.inst_meths;
                goto LABEL_78;
              }
              if (!ferror((FILE *)v33[502])) {
                break;
              }
              if (*__error() != 4) {
                goto LABEL_196;
              }
              *__error() = 0;
              clearerr((FILE *)v33[502]);
            }
            uint64_t v25 = yy_buffer_stack;
            double v3 = &OBJC_PROTOCOL___TIClientProxy.inst_meths;
            uint64_t v26 = yy_buffer_stack_top;
            uint64_t v27 = *(void *)(yy_buffer_stack + 8 * yy_buffer_stack_top);
            int v32 = v92;
LABEL_44:
            *(void *)(v27 + 32) = 0;
            if (!v32) {
              goto LABEL_81;
            }
LABEL_45:
            unint64_t v36 = 0;
            int v37 = 2;
            *(_DWORD *)(v27 + 64) = 2;
            goto LABEL_82;
          }
          unint64_t v36 = 0;
          uint64_t v2 = &OBJC_PROTOCOL___TIClientProxy.inst_meths;
          while (1)
          {
            int v46 = getc((FILE *)actDslin);
            if (v46 == -1 || v46 == 10) {
              break;
            }
            double v3 = &OBJC_PROTOCOL___TIClientProxy.inst_meths;
            *(unsigned char *)(*(void *)(*(void *)(yy_buffer_stack + 8 * yy_buffer_stack_top) + 8) + v96 + v36++) = v46;
            if (v45 == v36)
            {
              unint64_t v36 = v45;
              goto LABEL_66;
            }
          }
          double v3 = &OBJC_PROTOCOL___TIClientProxy.inst_meths;
LABEL_66:
          if (v46 == -1)
          {
            int v49 = ferror((FILE *)actDslin);
            double v3 = (__objc2_meth_list **)(&OBJC_PROTOCOL___TIClientProxy + 24);
            if (v49) {
LABEL_196:
            }
              yy_fatal_error("input in flex scanner failed");
          }
          else if (v46 == 10)
          {
            *(unsigned char *)(*(void *)(*(void *)(yy_buffer_stack + 8 * yy_buffer_stack_top) + 8) + v96 + v36++) = 10;
          }
          yy_n_chars = v36;
LABEL_78:
          uint64_t v25 = yy_buffer_stack;
          uint64_t v26 = (uint64_t)v3[494];
          uint64_t v27 = *(void *)(yy_buffer_stack + 8 * v26);
          *(void *)(v27 + 32) = v36;
          int v32 = v92;
          if (v36)
          {
            int v37 = 0;
            goto LABEL_82;
          }
          double v33 = &OBJC_PROTOCOL___TIClientProxy.inst_meths;
          if (v92) {
            goto LABEL_45;
          }
LABEL_81:
          int v50 = v32;
          double v51 = (FILE *)v33[502];
          int v52 = v3;
          actDslrestart(v51);
          int v32 = v50;
          double v3 = v52;
          unint64_t v36 = yy_n_chars;
          uint64_t v25 = (uint64_t)v2[493];
          uint64_t v26 = (uint64_t)v52[494];
          uint64_t v27 = *(void *)(v25 + 8 * v26);
          int v37 = 1;
LABEL_82:
          unint64_t v53 = v36 + v32;
          if (v53 <= *(int *)(v27 + 24))
          {
            uint64_t v58 = *(void *)(v27 + 8);
            p_inst_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___TIClientProxy + 24);
          }
          else
          {
            size_t v54 = v53 + (v36 >> 1);
            double v55 = v3;
            double v56 = malloc_type_realloc(*(void **)(v27 + 8), v54, 0xDB05E8D7uLL);
            uint64_t v25 = (uint64_t)v2[493];
            uint64_t v26 = (uint64_t)v55[494];
            *(void *)(*(void *)(v25 + 8 * v26) + 8) = v56;
            uint64_t v57 = *(void *)(v25 + 8 * v26);
            uint64_t v58 = *(void *)(v57 + 8);
            if (!v58) {
              yy_fatal_error("out of dynamic memory in yy_get_next_buffer()");
            }
            double v3 = v55;
            *(_DWORD *)(v57 + 24) = v54 - 2;
            unint64_t v53 = yy_n_chars + v96;
            p_inst_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___TIClientProxy + 24);
          }
          yy_n_chars = v53;
          *(unsigned char *)(v58 + v53) = 0;
          *(unsigned char *)(v53 + *(void *)(*(void *)(v25 + 8 * v26) + 8) + 1) = 0;
          uint64_t v31 = *(char **)(*(void *)(v25 + 8 * v26) + 8);
          actDsltext = (uint64_t)v31;
          if (v37 == 1)
          {
LABEL_87:
            yy_c_buf_p = (uint64_t)v31;
            int v59 = yy_start;
            if (yy_start >= 1) {
              int v59 = yy_start - 1;
            }
            int v19 = (v59 >> 1) + 30;
            long long v9 = (__objc2_meth_list **)(&OBJC_PROTOCOL___TIClientProxy + 24);
            uint64_t v10 = (__objc2_meth_list **)(&OBJC_PROTOCOL___TIClientProxy + 24);
            uint64_t v11 = (__objc2_meth_list **)(&OBJC_PROTOCOL___TIClientProxy + 24);
            uint64_t v14 = v95;
            goto LABEL_31;
          }
          if (v37)
          {
            double v30 = *(unsigned char **)(*(void *)&v2[493][(void)v3[494]] + 8);
            uint64_t v28 = yy_n_chars;
LABEL_93:
            uint64_t v12 = (uint64_t)&v30[v28];
            yy_c_buf_p = (uint64_t)&v30[v28];
            double v60 = v3;
            LODWORD(v13) = yy_get_previous_state();
            double v3 = v60;
            uint64_t v14 = actDsltext;
            long long v9 = (__objc2_meth_list **)(&OBJC_PROTOCOL___TIClientProxy + 24);
            uint64_t v10 = (__objc2_meth_list **)(&OBJC_PROTOCOL___TIClientProxy + 24);
            uint64_t v11 = (__objc2_meth_list **)(&OBJC_PROTOCOL___TIClientProxy + 24);
            continue;
          }
          uint64_t v12 = (uint64_t)&v31[~v94 + (int)v12];
          yy_c_buf_p = v12;
          double v66 = v3;
          LODWORD(v13) = yy_get_previous_state();
          double v3 = v66;
          uint64_t v14 = actDsltext;
          long long v9 = (__objc2_meth_list **)(&OBJC_PROTOCOL___TIClientProxy + 24);
          uint64_t v10 = (__objc2_meth_list **)(&OBJC_PROTOCOL___TIClientProxy + 24);
          uint64_t v11 = (__objc2_meth_list **)(&OBJC_PROTOCOL___TIClientProxy + 24);
          break;
        case 30:
        case 31:
        case 32:
        case 33:
        case 34:
        case 35:
        case 36:
        case 37:
          return 0;
        default:
          yy_fatal_error("fatal flex scanner internal error--no action found");
      }
      break;
    }
  }
}

void *actDslensure_buffer_stack()
{
  double result = (void *)yy_buffer_stack;
  if (yy_buffer_stack)
  {
    if (yy_buffer_stack_top >= (unint64_t)(yy_buffer_stack_max - 1))
    {
      uint64_t v1 = yy_buffer_stack_max + 8;
      double result = malloc_type_realloc((void *)yy_buffer_stack, 8 * (yy_buffer_stack_max + 8), 0xDB05E8D7uLL);
      yy_buffer_stack = (uint64_t)result;
      if (result)
      {
        uint64_t v2 = &result[yy_buffer_stack_max];
        *uint64_t v2 = 0u;
        v2[1] = 0u;
        v2[2] = 0u;
        v2[3] = 0u;
        yy_buffer_stack_max = v1;
        return result;
      }
LABEL_8:
      yy_fatal_error("out of dynamic memory in yyensure_buffer_stack()");
    }
  }
  else
  {
    double result = malloc_type_malloc(8uLL, 0xBF065FE1uLL);
    yy_buffer_stack = (uint64_t)result;
    if (!result) {
      goto LABEL_8;
    }
    *double result = 0;
    yy_buffer_stack_max = 1;
    yy_buffer_stack_top = 0;
  }
  return result;
}

uint64_t actDsl_create_buffer(FILE *a1, int a2)
{
  uint64_t v4 = malloc_type_malloc(0x48uLL, 0xBF065FE1uLL);
  if (!v4
    || (uint64_t v5 = (uint64_t)v4, v4[6] = a2, v6 = malloc_type_malloc(a2 + 2, 0xBF065FE1uLL), (*(void *)(v5 + 8) = v6) == 0))
  {
    yy_fatal_error("out of dynamic memory in yy_create_buffer()");
  }
  *(_DWORD *)(v5 + 4_TIBeginMockingSingletonsWithData(0, 0, 0, 0, 1, 0) = 1;
  actDsl_init_buffer(v5, a1);
  return v5;
}

_DWORD *yy_push_state(int a1)
{
  int v2 = yy_start_stack_ptr;
  int v3 = yy_start_stack_depth;
  double result = (_DWORD *)yy_start_stack;
  if (yy_start_stack_ptr >= yy_start_stack_depth)
  {
    int v5 = yy_start_stack_depth + 25;
    yy_start_stack_depth += 25;
    if (yy_start_stack) {
      double result = malloc_type_realloc((void *)yy_start_stack, 4 * (v3 + 25), 0xDB05E8D7uLL);
    }
    else {
      double result = malloc_type_malloc(4 * v5, 0xBF065FE1uLL);
    }
    yy_start_stack = (uint64_t)result;
    if (!result) {
      yy_fatal_error("out of memory expanding start-condition stack");
    }
    int v2 = yy_start_stack_ptr;
  }
  int v6 = yy_start;
  if (yy_start >= 1) {
    int v6 = yy_start - 1;
  }
  yy_start_stack_ptr = v2 + 1;
  result[v2] = v6 >> 1;
  yy_start = (2 * a1) | 1;
  return result;
}

void yy_pop_state()
{
  int v0 = yy_start_stack_ptr;
  unsigned int v1 = --yy_start_stack_ptr;
  if (v0 <= 0) {
    yy_fatal_error("start-condition stack underflow");
  }
  yy_start = (2 * *(_DWORD *)(yy_start_stack + 4 * v1)) | 1;
}

uint64_t yy_get_previous_state()
{
  uint64_t result = (*(_DWORD *)(*(void *)(yy_buffer_stack + 8 * yy_buffer_stack_top) + 48) + yy_start);
  unsigned int v1 = (unsigned char *)actDsltext;
  if (actDsltext < (unint64_t)yy_c_buf_p)
  {
    do
    {
      if (*v1) {
        uint64_t v2 = yy_ec[*v1];
      }
      else {
        uint64_t v2 = 1u;
      }
      if (yy_accept[(int)result])
      {
        yy_last_accepting_state = result;
        yy_last_accepting_cpos = (uint64_t)v1;
      }
      uint64_t v3 = (int)result;
      uint64_t v4 = yy_base[(int)result] + v2;
      if (result != (__int16)yy_chk[v4])
      {
        do
        {
          uint64_t v3 = yy_def[v3];
          if (v3 >= 82) {
            uint64_t v2 = *((unsigned __int8 *)&yy_meta + v2);
          }
          uint64_t v4 = yy_base[v3] + v2;
        }
        while (yy_chk[v4] != (unsigned __int16)v3);
      }
      uint64_t result = yy_nxt[v4];
      ++v1;
    }
    while (v1 != (unsigned char *)yy_c_buf_p);
  }
  return result;
}

void yy_fatal_error(const char *a1)
{
}

int *actDslrestart(FILE *a1)
{
  if (!yy_buffer_stack || (uint64_t buffer = *(void *)(yy_buffer_stack + 8 * yy_buffer_stack_top)) == 0)
  {
    actDslensure_buffer_stack();
    uint64_t buffer = actDsl_create_buffer((FILE *)actDslin, 0x4000);
    *(void *)(yy_buffer_stack + 8 * yy_buffer_stack_top) = buffer;
  }
  uint64_t result = actDsl_init_buffer(buffer, a1);
  uint64_t v4 = *(void *)(yy_buffer_stack + 8 * yy_buffer_stack_top);
  uint64_t v5 = *(void *)(v4 + 32);
  yy_c_buf_p = *(void *)(v4 + 16);
  actDsltext = yy_c_buf_p;
  int v6 = *(uint64_t **)(yy_buffer_stack + 8 * yy_buffer_stack_top);
  yy_n_chars = v5;
  actDslin = *v6;
  yy_hold_char = *(unsigned char *)yy_c_buf_p;
  return result;
}

int *actDsl_init_buffer(uint64_t a1, FILE *a2)
{
  int v4 = *__error();
  actDsl_flush_buffer(a1);
  *(void *)a1 = a2;
  *(_DWORD *)(a1 + 6_TIBeginMockingSingletonsWithData(0, 0, 0, 0, 1, 0) = 1;
  uint64_t v5 = yy_buffer_stack;
  if (yy_buffer_stack) {
    uint64_t v5 = *(void *)(yy_buffer_stack + 8 * yy_buffer_stack_top);
  }
  if (v5 != a1) {
    *(void *)(a1 + 52) = 1;
  }
  if (a2)
  {
    int v6 = fileno(a2);
    BOOL v7 = isatty(v6) > 0;
  }
  else
  {
    BOOL v7 = 0;
  }
  *(_DWORD *)(a1 + 44) = v7;
  uint64_t result = __error();
  *uint64_t result = v4;
  return result;
}

uint64_t actDsl_flush_buffer(uint64_t result)
{
  if (result)
  {
    *(void *)(result + 32) = 0;
    **(unsigned char **)(result + 8) = 0;
    *(unsigned char *)(*(void *)(result + 8) + 1) = 0;
    *(void *)(result + 16) = *(void *)(result + 8);
    *(_DWORD *)(result + 48) = 1;
    *(_DWORD *)(result + 64) = 0;
    if (yy_buffer_stack) {
      uint64_t v1 = *(void *)(yy_buffer_stack + 8 * yy_buffer_stack_top);
    }
    else {
      uint64_t v1 = 0;
    }
    if (v1 == result)
    {
      uint64_t v2 = *(void *)(yy_buffer_stack + 8 * yy_buffer_stack_top);
      yy_n_chars = *(void *)(v2 + 32);
      yy_c_buf_p = *(void *)(v2 + 16);
      actDsltext = yy_c_buf_p;
      actDslin = **(void **)(yy_buffer_stack + 8 * yy_buffer_stack_top);
      yy_hold_char = *(unsigned char *)yy_c_buf_p;
    }
  }
  return result;
}

uint64_t actDslwrap()
{
  return 1;
}

void *actDsl_switch_to_buffer(uint64_t a1)
{
  uint64_t result = actDslensure_buffer_stack();
  uint64_t v3 = yy_buffer_stack;
  if (yy_buffer_stack)
  {
    uint64_t v4 = yy_buffer_stack_top;
    uint64_t v5 = *(void *)(yy_buffer_stack + 8 * yy_buffer_stack_top);
    if (v5 == a1) {
      return result;
    }
    if (v5)
    {
      uint64_t v6 = yy_c_buf_p;
      *(unsigned char *)yy_c_buf_p = yy_hold_char;
      *(void *)(*(void *)(v3 + 8 * v4) + 16) = v6;
      *(void *)(*(void *)(v3 + 8 * v4) + 32) = yy_n_chars;
    }
  }
  else
  {
    if (!a1) {
      return result;
    }
    uint64_t v4 = yy_buffer_stack_top;
  }
  *(void *)(v3 + 8 * v4) = a1;
  yy_n_chars = *(void *)(a1 + 32);
  yy_c_buf_p = *(void *)(a1 + 16);
  actDsltext = yy_c_buf_p;
  actDslin = **(void **)(v3 + 8 * v4);
  yy_hold_char = *(unsigned char *)yy_c_buf_p;
  return result;
}

void *actDslalloc(size_t a1)
{
  return malloc_type_malloc(a1, 0xBF065FE1uLL);
}

void actDsl_delete_buffer(void **a1)
{
  if (a1)
  {
    if (yy_buffer_stack) {
      uint64_t v2 = *(void ***)(yy_buffer_stack + 8 * yy_buffer_stack_top);
    }
    else {
      uint64_t v2 = 0;
    }
    if (v2 == a1) {
      *(void *)(yy_buffer_stack + 8 * yy_buffer_stack_top) = 0;
    }
    if (*((_DWORD *)a1 + 10)) {
      free(a1[1]);
    }
    free(a1);
  }
}

void *actDslpush_buffer_state(void *result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t result = actDslensure_buffer_stack();
    uint64_t v2 = yy_buffer_stack;
    uint64_t v3 = yy_buffer_stack_top;
    if (yy_buffer_stack)
    {
      if (*(void *)(yy_buffer_stack + 8 * yy_buffer_stack_top))
      {
        uint64_t v4 = yy_c_buf_p;
        *(unsigned char *)yy_c_buf_p = yy_hold_char;
        *(void *)(*(void *)(v2 + 8 * v3) + 16) = v4;
        *(void *)(*(void *)(v2 + 8 * v3++) + 32) = yy_n_chars;
        yy_buffer_stack_top = v3;
      }
    }
    *(void *)(v2 + 8 * v3) = v1;
    uint64_t v5 = v1[4];
    yy_c_buf_p = v1[2];
    actDsltext = yy_c_buf_p;
    uint64_t v6 = *(uint64_t **)(v2 + 8 * v3);
    yy_n_chars = v5;
    actDslin = *v6;
    yy_hold_char = *(unsigned char *)yy_c_buf_p;
  }
  return result;
}

void actDslpop_buffer_state()
{
  if (yy_buffer_stack)
  {
    int v0 = *(void ***)(yy_buffer_stack + 8 * yy_buffer_stack_top);
    if (v0)
    {
      actDsl_delete_buffer(v0);
      uint64_t v1 = yy_buffer_stack;
      uint64_t v2 = yy_buffer_stack_top;
      *(void *)(yy_buffer_stack + 8 * yy_buffer_stack_top) = 0;
      if (v2)
      {
        uint64_t v3 = v2 - 1;
        yy_buffer_stack_top = v3;
        uint64_t v4 = *(void *)(v1 + 8 * v3);
        if (v4)
        {
          yy_n_chars = *(void *)(v4 + 32);
          yy_c_buf_p = *(void *)(v4 + 16);
          actDsltext = yy_c_buf_p;
          actDslin = **(void **)(v1 + 8 * v3);
          yy_hold_char = *(unsigned char *)yy_c_buf_p;
        }
      }
    }
  }
}

char *actDsl_scan_buffer(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = a2 - 2;
  if (a2 < 2 || *(unsigned char *)(a1 + v2) || *(unsigned char *)(a2 + a1 - 1)) {
    return 0;
  }
  uint64_t v6 = (char *)malloc_type_malloc(0x48uLL, 0xBF065FE1uLL);
  if (!v6) {
    yy_fatal_error("out of dynamic memory in yy_scan_buffer()");
  }
  uint64_t v4 = v6;
  *((_DWORD *)v6 + 6) = v2;
  *((void *)v6 + 1) = a1;
  *((void *)v6 + 2) = a1;
  *(void *)uint64_t v6 = 0;
  *((void *)v6 + 4) = (int)v2;
  *((void *)v6 + 5) = 0;
  *((_DWORD *)v6 + 12) = 1;
  *(void *)(v6 + 6_TIBeginMockingSingletonsWithData(0, 0, 0, 0, 1, 0) = 0;
  actDsl_switch_to_buffer((uint64_t)v6);
  return v4;
}

char *actDsl_scan_string(char *a1)
{
  uint64_t v2 = (int)strlen(a1);
  return actDsl_scan_bytes(a1, v2);
}

char *actDsl_scan_bytes(char *a1, uint64_t a2)
{
  unint64_t v4 = a2 + 2;
  uint64_t v5 = malloc_type_malloc(a2 + 2, 0xBF065FE1uLL);
  if (!v5) {
    yy_fatal_error("out of dynamic memory in yy_scan_bytes()");
  }
  if (a2)
  {
    uint64_t v6 = v5;
    uint64_t v7 = a2;
    do
    {
      char v8 = *a1++;
      *v6++ = v8;
      --v7;
    }
    while (v7);
  }
  *(_WORD *)&v5[a2] = 0;
  uint64_t result = actDsl_scan_buffer((uint64_t)v5, v4);
  if (!result) {
    yy_fatal_error("bad buffer in yy_scan_bytes()");
  }
  *((_DWORD *)result + 1_TIBeginMockingSingletonsWithData(0, 0, 0, 0, 1, 0) = 1;
  return result;
}

uint64_t actDslget_lineno()
{
  return actDsllineno;
}

uint64_t actDslget_in()
{
  return actDslin;
}

uint64_t actDslget_out()
{
  return actDslout;
}

uint64_t actDslget_leng()
{
  return actDslleng;
}

uint64_t actDslget_text()
{
  return actDsltext;
}

uint64_t actDslset_lineno(uint64_t result)
{
  actDsllineno = result;
  return result;
}

uint64_t actDslset_in(uint64_t result)
{
  actDslin = result;
  return result;
}

uint64_t actDslset_out(uint64_t result)
{
  actDslout = result;
  return result;
}

uint64_t actDslget_debug()
{
  return actDsl_flex_debug;
}

uint64_t actDslset_debug(uint64_t result)
{
  actDsl_flex_debug = result;
  return result;
}

uint64_t actDsllex_destroy()
{
  for (uint64_t i = (void *)yy_buffer_stack; yy_buffer_stack; uint64_t i = (void *)yy_buffer_stack)
  {
    if (!i[yy_buffer_stack_top]) {
      break;
    }
    actDsl_delete_buffer((void **)i[yy_buffer_stack_top]);
    *(void *)(yy_buffer_stack + 8 * yy_buffer_stack_top) = 0;
    actDslpop_buffer_state();
  }
  free(i);
  free((void *)yy_start_stack);
  actDsllineno = 1;
  yy_buffer_stack = 0;
  yy_buffer_stack_top = 0;
  yy_buffer_stack_max = 0;
  yy_c_buf_p = 0;
  yy_init = 0;
  yy_start = 0;
  yy_start_stack_ptr = 0;
  yy_start_stack_depth = 0;
  yy_start_stack = 0;
  actDslin = 0;
  actDslout = 0;
  return 0;
}

void *actDslrealloc(void *a1, size_t a2)
{
  return malloc_type_realloc(a1, a2, 0xDB05E8D7uLL);
}

void actDslreset()
{
  yy_start = 1;
  stringLen = 0;
}

uint64_t actDsl_get_line_number()
{
  return actDsllineno;
}

uint64_t yy_get_current_token()
{
  return actDsltext;
}

uint64_t actDslparse(void *a1)
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  uint64_t v1 = (FILE **)MEMORY[0x263EF8348];
  if (actDsldebug) {
    fwrite("Starting parse\n", 0xFuLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
  }
  int v60 = 0;
  int v64 = 0;
  int v2 = 0;
  actDslnerrs = 0;
  __src = v68;
  actDslchar = -2;
  unint64_t v3 = 200;
  uint64_t v62 = v70;
  unint64_t v58 = 128;
  unint64_t v4 = v69;
  uint64_t v5 = v69;
  uint64_t v6 = (uint64_t *)v68;
  while (1)
  {
    *(_WORD *)uint64_t v5 = v2;
    if (&v4[2 * v3 - 2] <= v5)
    {
      if (v3 >> 4 > 0x270
        || ((uint64_t v7 = v1, 2 * v3 >= 0x2710) ? (v8 = 10000) : (v8 = 2 * v3),
            (long long v9 = malloc_type_malloc(10 * v8 + 7, 0xAF233AF1uLL)) == 0))
      {
LABEL_145:
        handleErrorWithLineNumber(a1, (uint64_t)"memory exhausted", actDsllineno);
        uint64_t v54 = 2;
        uint64_t v10 = v4;
        goto LABEL_130;
      }
      uint64_t v10 = v9;
      uint64_t v11 = (v5 - v4) >> 1;
      uint64_t v12 = v11 + 1;
      memcpy(v9, v4, 2 * (v11 + 1));
      int64_t v13 = v8;
      uint64_t v14 = &v10[(2 * v8 + 7) & 0xFFFFFFFFFFFFFFF8];
      memcpy(v14, __src, 8 * (v11 + 1));
      if (v4 != v69) {
        free(v4);
      }
      if (actDsldebug) {
        fprintf(*v7, "Stack size increased to %lu\n", v13);
      }
      uint64_t v5 = &v10[2 * v11];
      uint64_t v6 = (uint64_t *)&v14[8 * v12 - 8];
      if (v13 <= v12)
      {
        uint64_t v54 = 1;
        goto LABEL_130;
      }
      unint64_t v4 = v10;
      __src = v14;
      unint64_t v3 = v13;
      uint64_t v1 = v7;
    }
    if (actDsldebug) {
      fprintf(*v1, "Entering state %d\n", v2);
    }
    unint64_t v66 = v3;
    if ((0x2FF8FA79F0uLL >> v2)) {
      goto LABEL_49;
    }
    int v15 = yypact[v2];
    int v16 = actDslchar;
    if (actDslchar == -2)
    {
      if (actDsldebug) {
        fwrite("Reading a token: ", 0x11uLL, 1uLL, *v1);
      }
      int v16 = actDsllex(a1);
      actDslchar = v16;
    }
    if (v16 <= 0)
    {
      actDslchar = 0;
      if (actDsldebug) {
        fwrite("Now at end of input.\n", 0x15uLL, 1uLL, *v1);
      }
      unsigned int v17 = 0;
    }
    else
    {
      if (v16 > 0x110) {
        unsigned int v17 = 2;
      }
      else {
        unsigned int v17 = yytranslate[v16];
      }
      if (actDsldebug)
      {
        fprintf(*v1, "%s ", "Next token is");
        int v18 = (FILE *)*MEMORY[0x263EF8348];
        if (v17 >= 0x12) {
          fprintf(v18, "nterm %s (");
        }
        else {
          fprintf(v18, "token %s (");
        }
        int v19 = v18;
        uint64_t v1 = (FILE **)MEMORY[0x263EF8348];
        fputc(41, v19);
        fputc(10, *v1);
      }
    }
    uint64_t v20 = v17 + v15;
    int v64 = v17;
    if (v20 > 0x27 || v17 != yycheck[v20])
    {
LABEL_49:
      if (((0x100705060FuLL >> v2) & 1) == 0)
      {
        unsigned int v25 = yydefact[v2];
        goto LABEL_51;
      }
      goto LABEL_65;
    }
    int v21 = yytable[v20];
    if (((0x7400000001uLL >> v20) & 1) == 0) {
      break;
    }
    if (((0x7400000000uLL >> v20) & 1) == 0)
    {
      unsigned int v25 = -v21;
LABEL_51:
      uint64_t v26 = v25;
      unint64_t v61 = yyr2[v25];
      uint64_t v59 = v6[1 - v61];
      if (actDsldebug)
      {
        fprintf(*v1, "Reducing stack by rule %d (line %lu):\n", v25 - 1, yyrline[v25]);
        if (v26)
        {
          uint64_t v27 = 0;
          uint64_t v28 = v61;
          if (v61 <= 1) {
            uint64_t v28 = 1;
          }
          uint64_t v67 = v28;
          do
          {
            int v29 = v27 + 1;
            fprintf(*v1, "   $%d = ", v27 + 1);
            double v30 = (FILE *)*MEMORY[0x263EF8348];
            if (yyrhs[yyprhs[v26] + v27] < 18) {
              fprintf(v30, "token %s (");
            }
            else {
              fprintf(v30, "nterm %s (");
            }
            uint64_t v31 = v30;
            uint64_t v1 = (FILE **)MEMORY[0x263EF8348];
            fputc(41, v31);
            fputc(10, *v1);
            ++v27;
          }
          while (v67 != v29);
          goto LABEL_60;
        }
LABEL_62:
        unsigned int v32 = v59;
      }
      else
      {
LABEL_60:
        unsigned int v32 = v59;
        switch((int)v26)
        {
          case 5:
            handleTyping(a1, *v6);
            break;
          case 6:
            handleCorrectionMatch(a1, *v6);
            break;
          case 7:
            handlePredictionMatch(a1, *v6);
            break;
          case 8:
            handleDocumentMatch(a1, *v6);
            break;
          case 9:
          case 10:
          case 13:
          case 14:
          case 15:
          case 20:
          case 21:
          case 22:
            break;
          case 11:
            [a1 handleNewLine];
            break;
          case 12:
            yy_start = 1;
            stringLen = 0;
            break;
          case 16:
            handleBoolConfig(a1, *(v6 - 1), *(_DWORD *)v6);
            break;
          case 17:
            handleIntConfig(a1, *(v6 - 1), *(unsigned int *)v6);
            break;
          case 18:
          case 19:
            handleStringConfig(a1, *(v6 - 1), *v6);
            break;
          case 23:
          case 24:
            uint64_t v45 = *(v6 - 1);
            uint64_t v46 = *v6;
            double v47 = a1;
            goto LABEL_114;
          case 25:
            uint64_t v45 = *v6;
            double v47 = a1;
            uint64_t v46 = 0;
LABEL_114:
            handleBracketCommand(v47, v45, v46);
            break;
          case 26:
            unsigned int v32 = 1;
            break;
          case 27:
            unsigned int v32 = 0;
            break;
          default:
            goto LABEL_62;
        }
      }
      if (actDsldebug)
      {
        fprintf(*v1, "%s ", "-> $$ =");
        size_t v48 = (FILE *)*MEMORY[0x263EF8348];
        int v49 = v26;
        uint64_t v50 = yyr1[v26];
        if (v49) {
          fprintf(v48, "nterm %s (");
        }
        else {
          fprintf(v48, "token %s (");
        }
        double v51 = v48;
        uint64_t v1 = (FILE **)MEMORY[0x263EF8348];
        fputc(41, v51);
        fputc(10, *v1);
        int v52 = &v6[-v61];
        v5 -= 2 * v61;
        if (actDsldebug) {
          yy_stack_print((__int16 *)v4, (unint64_t)v5);
        }
      }
      else
      {
        int v52 = &v6[-v61];
        uint64_t v50 = yyr1[v26];
        v5 -= 2 * v61;
      }
      v52[1] = v32 | v59 & 0xFFFFFFFF00000000;
      uint64_t v6 = v52 + 1;
      uint64_t v53 = (*(__int16 *)v5 + yypgoto[v50 - 18]);
      if (v53 <= 0x27 && *(unsigned __int16 *)v5 == (unsigned __int16)yycheck[v53]) {
        int v21 = yytable[v53];
      }
      else {
        int v21 = yydefgoto[v50 - 18];
      }
      goto LABEL_128;
    }
LABEL_65:
    if (v60 == 3)
    {
      if (actDslchar <= 0)
      {
        if (!actDslchar)
        {
          uint64_t v54 = 1;
          goto LABEL_136;
        }
      }
      else
      {
        yydestruct("Error: discarding", v64, (void **)&actDsllval);
        actDslchar = -2;
      }
    }
    else if (!v60)
    {
      ++actDslnerrs;
      uint64_t v33 = yysyntax_error(0, v2, actDslchar);
      uint64_t v34 = v33;
      unint64_t v35 = v58;
      if (v58 < v33)
      {
        if (v33 < 0) {
          size_t v36 = -1;
        }
        else {
          size_t v36 = 2 * v33;
        }
        if (v62 != v70) {
          free(v62);
        }
        int v37 = malloc_type_malloc(v36, 0x6CAC4B48uLL);
        int v38 = v70;
        if (v37) {
          int v38 = v37;
        }
        uint64_t v62 = v38;
        if (v37) {
          unint64_t v35 = v36;
        }
        else {
          unint64_t v35 = 128;
        }
      }
      unint64_t v58 = v35;
      if (v34 - 1 >= v35)
      {
        handleErrorWithLineNumber(a1, (uint64_t)"syntax error", actDsllineno);
        if (v34) {
          goto LABEL_145;
        }
      }
      else
      {
        yysyntax_error(v62, v2, actDslchar);
        handleErrorWithLineNumber(a1, (uint64_t)v62, actDsllineno);
      }
    }
    for (uint64_t i = (__int16 *)(v5 - 2); ; --i)
    {
      uint64_t v5 = (char *)(i + 1);
      if ((0x2FF8FA79F0uLL >> v2) & 1) == 0 && ((0x100304060FuLL >> v2))
      {
        int v40 = yypact[v2] + 1;
        BOOL v41 = yypact[v2] == 10 || v40 == 1;
        if (v41 && ((0x8BFFFFFFFEuLL >> v40) & 1) != 0) {
          break;
        }
      }
      if (v5 == v4)
      {
        uint64_t v54 = 1;
        uint64_t v10 = v4;
        uint64_t v5 = v4;
        goto LABEL_130;
      }
      yydestruct("Error: popping", yystos[v2], (void **)v6);
      int v2 = *i;
      if (actDsldebug) {
        yy_stack_print((__int16 *)v4, (unint64_t)i);
      }
      --v6;
    }
    int v21 = yytable[yypact[v2] + 1];
    v6[1] = actDsllval;
    ++v6;
    if (actDsldebug)
    {
      double v42 = (FILE **)MEMORY[0x263EF8348];
      fprintf((FILE *)*MEMORY[0x263EF8348], "%s ", "Shifting");
      int v43 = *v42;
      if ((0x1BE3ECC1FFuLL >> v21)) {
        fprintf(v43, "token %s (");
      }
      else {
        fprintf(v43, "nterm %s (");
      }
      double v44 = v43;
      uint64_t v1 = v42;
      fputc(41, v44);
      fputc(10, *v42);
      int v60 = 3;
    }
    else
    {
      int v60 = 3;
      uint64_t v1 = (FILE **)MEMORY[0x263EF8348];
    }
LABEL_128:
    v5 += 2;
    int v2 = v21;
    unint64_t v3 = v66;
  }
  if (v20 != 23)
  {
    int v22 = v60 - 1;
    if (!v60) {
      int v22 = 0;
    }
    int v60 = v22;
    if (actDsldebug)
    {
      fprintf(*v1, "%s ", "Shifting");
      int v23 = (FILE *)*MEMORY[0x263EF8348];
      if (v17 >= 0x12) {
        fprintf(v23, "nterm %s (");
      }
      else {
        fprintf(v23, "token %s (");
      }
      int v24 = v23;
      uint64_t v1 = (FILE **)MEMORY[0x263EF8348];
      fputc(41, v24);
      fputc(10, *v1);
    }
    if (actDslchar) {
      actDslchar = -2;
    }
    v6[1] = actDsllval;
    ++v6;
    goto LABEL_128;
  }
  uint64_t v54 = 0;
  uint64_t v10 = v4;
LABEL_130:
  if (actDslchar != -2 && actDslchar != 0) {
    yydestruct("Cleanup: discarding lookahead", v64, (void **)&actDsllval);
  }
  unint64_t v4 = v10;
LABEL_136:
  if (actDsldebug) {
    yy_stack_print((__int16 *)v4, (unint64_t)v5);
  }
  for (; v5 != v4; --v6)
  {
    uint64_t v56 = *(__int16 *)v5;
    v5 -= 2;
    yydestruct("Cleanup: popping", yystos[v56], (void **)v6);
  }
  if (v4 != v69) {
    free(v4);
  }
  if (v62 != v70) {
    free(v62);
  }
  return v54;
}

void handleTyping(void *a1, uint64_t a2)
{
  unint64_t v3 = NSString;
  id v4 = a1;
  id v5 = [v3 stringWithUTF8String:a2];
  [v4 handleTyping:v5];
}

void handleCorrectionMatch(void *a1, uint64_t a2)
{
  unint64_t v3 = NSString;
  id v4 = a1;
  id v5 = [v3 stringWithUTF8String:a2];
  [v4 handleCorrectionMatch:v5 lineNumber:actDsllineno];
}

void handlePredictionMatch(void *a1, uint64_t a2)
{
  unint64_t v3 = NSString;
  id v4 = a1;
  id v5 = [v3 stringWithUTF8String:a2];
  [v4 handlePredictionMatch:v5 lineNumber:actDsllineno];
}

void handleDocumentMatch(void *a1, uint64_t a2)
{
  unint64_t v3 = NSString;
  id v4 = a1;
  id v5 = [v3 stringWithUTF8String:a2];
  [v4 handleDocumentMatch:v5 lineNumber:actDsllineno];
}

void handleBoolConfig(void *a1, uint64_t a2, int a3)
{
  id v5 = NSString;
  id v6 = a1;
  id v7 = [v5 stringWithUTF8String:a2];
  [v6 handleBoolConfig:v7 withValue:a3 != 0 lineNumber:actDsllineno];
}

void handleIntConfig(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = NSString;
  id v6 = a1;
  id v7 = [v5 stringWithUTF8String:a2];
  [v6 handleIntConfig:v7 withValue:a3 lineNumber:actDsllineno];
}

void handleStringConfig(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = NSString;
  id v6 = a1;
  id v8 = [v5 stringWithUTF8String:a2];
  id v7 = [NSString stringWithUTF8String:a3];
  [v6 handleStringConfig:v8 withValue:v7 lineNumber:actDsllineno];
}

void handleBracketCommand(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = NSString;
  id v6 = a1;
  id v8 = [v5 stringWithUTF8String:a2];
  if (a3)
  {
    id v7 = [NSString stringWithUTF8String:a3];
  }
  else
  {
    id v7 = 0;
  }
  [v6 handleCommand:v8 withValue:v7 lineNumber:actDsllineno];

  if (a3) {
}
  }

uint64_t yy_stack_print(__int16 *a1, unint64_t a2)
{
  id v4 = (FILE **)MEMORY[0x263EF8348];
  fwrite("Stack now", 9uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
  while ((unint64_t)a1 <= a2)
  {
    int v5 = *a1++;
    fprintf(*v4, " %d", v5);
  }
  id v6 = *v4;
  return fputc(10, v6);
}

uint64_t yysyntax_error(unsigned char *a1, int a2, unsigned int a3)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  if ((0x100705860FuLL >> a2))
  {
    char v5 = a2;
    int v6 = yypact[a2];
    if (a3 > 0x110) {
      uint64_t v7 = 2;
    }
    else {
      uint64_t v7 = yytranslate[a3];
    }
    id v8 = yytname[v7];
    uint64_t v9 = yytnamerr(0, v8);
    long long v39 = 0u;
    long long v38 = 0u;
    int v37 = v8;
    strcpy(v36, "syntax error, unexpected %s");
    if ((0x2FFCFBF9F0uLL >> v5)) {
      int v10 = -v6;
    }
    else {
      int v10 = 0;
    }
    if (40 - v6 >= 18) {
      int v11 = 18;
    }
    else {
      int v11 = 40 - v6;
    }
    if (v10 < v11)
    {
      int v12 = 0;
      int64_t v13 = &v36[27];
      uint64_t v14 = v10;
      uint64_t v15 = v6;
      uint64_t v16 = v11;
      unint64_t v17 = v9;
      int v18 = ", expecting %s";
      int v19 = 1;
      uint64_t v35 = v9;
      while (1)
      {
        if (v14 == 1 || v14 != yycheck[v14 + v15])
        {
          unint64_t v21 = v17;
        }
        else
        {
          if (v19 == 5)
          {
            v36[27] = 0;
            int v19 = 1;
            unint64_t v21 = v35;
            goto LABEL_25;
          }
          uint64_t v20 = yytname[v14];
          (&v37)[v19] = v20;
          unint64_t v21 = yytnamerr(0, v20) + v17;
          --v13;
          do
          {
            int v22 = *(unsigned __int8 *)v18++;
            *++int64_t v13 = v22;
          }
          while (v22);
          ++v19;
          v12 |= v21 < v17;
          int v18 = " or %s";
        }
        ++v14;
        unint64_t v17 = v21;
        if (v14 == v16) {
          goto LABEL_25;
        }
      }
    }
    int v12 = 0;
    int v19 = 1;
    unint64_t v21 = v9;
LABEL_25:
    uint64_t v23 = 0;
    do
      uint64_t v24 = v23;
    while (v36[v23++]);
    uint64_t v3 = v24 + v21;
    BOOL v26 = __CFADD__(v24, v21);
    if (v12 | v26) {
      return -1;
    }
    if (!a1) {
      return v3;
    }
    int v28 = 0;
    for (uint64_t i = v36; ; i += v33)
    {
      int v30 = *i;
      *a1 = v30;
      if (v30 != 37) {
        break;
      }
      if (i[1] != 115 || v28 >= v19) {
        goto LABEL_42;
      }
      int v34 = v28 + 1;
      uint64_t v32 = yytnamerr((uint64_t)a1, (&v37)[v28]);
      uint64_t v33 = 2;
      int v28 = v34;
LABEL_44:
      a1 += v32;
    }
    if (!v30) {
      return v3;
    }
LABEL_42:
    uint64_t v32 = 1;
    uint64_t v33 = 1;
    goto LABEL_44;
  }
  return 0;
}

void handleErrorWithLineNumber(void *a1, uint64_t a2, uint64_t a3)
{
  char v5 = NSString;
  id v6 = a1;
  id v7 = [v5 stringWithUTF8String:a2];
  [v6 reportSyntaxErrors:v7 lineNumber:a3];
}

void yydestruct(const char *a1, int a2, void **a3)
{
  if (actDsldebug)
  {
    char v5 = "Deleting";
    if (a1) {
      char v5 = a1;
    }
    id v6 = (FILE **)MEMORY[0x263EF8348];
    fprintf((FILE *)*MEMORY[0x263EF8348], "%s ", v5);
    id v7 = *v6;
    if (a2 >= 18) {
      fprintf(v7, "nterm %s (");
    }
    else {
      fprintf(v7, "token %s (");
    }
    fputc(41, v7);
    fputc(10, *v6);
  }
  if ((a2 - 12) <= 5)
  {
    id v8 = *a3;
    free(v8);
  }
}

uint64_t yytnamerr(uint64_t a1, unsigned char *a2)
{
  if (*a2 != 34)
  {
LABEL_13:
    if (a1)
    {
      uint64_t v10 = a1 - 1;
      do
      {
        int v11 = *a2++;
        *(unsigned char *)++uint64_t v10 = v11;
      }
      while (v11);
      return v10 - a1;
    }
    else
    {
      uint64_t v12 = 0;
      while (a2[v12++])
        ;
      return v12 - 1;
    }
  }
  uint64_t v2 = 0;
  uint64_t v3 = a2;
  for (i = a2; ; uint64_t v3 = i)
  {
    int v6 = (char)*++i;
    int v5 = v6;
    char v7 = v6;
    if (v6 > 91)
    {
      if (v5 == 92)
      {
        int v9 = v3[2];
        id v8 = v3 + 2;
        if (v9 != 92) {
          goto LABEL_13;
        }
        char v7 = 92;
        uint64_t i = v8;
      }
      goto LABEL_10;
    }
    if (v5 == 34) {
      break;
    }
    if (v5 == 39 || v5 == 44) {
      goto LABEL_13;
    }
LABEL_10:
    if (a1) {
      *(unsigned char *)(a1 + v2) = v7;
    }
    ++v2;
  }
  if (a1) {
    *(unsigned char *)(a1 + v2) = 0;
  }
  return v2;
}

void handleError(void *a1, uint64_t a2)
{
}

void _GLOBAL__sub_I_TIUnitTestUtils_mm()
{
  int v0 = (void *)MEMORY[0x2455C2B00]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_23EFD2000);
}

void _GLOBAL__sub_I_TITestUserPersona_mm()
{
  int v0 = (void *)MEMORY[0x2455C2B00]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_23EFD2000);
}

void _GLOBAL__sub_I_CPUtilities_mm()
{
  int v0 = (void *)MEMORY[0x2455C2B00]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_23EFD2000);
}

void _GLOBAL__sub_I_CPParamTrainer_mm()
{
  int v0 = (void *)MEMORY[0x2455C2B00]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_23EFD2000);
}

void _GLOBAL__sub_I_CPTestCaseEval_mm()
{
  int v0 = (void *)MEMORY[0x2455C2B00]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_23EFD2000);
}

void _GLOBAL__sub_I_TTKTestCaseConverter_mm()
{
  int v0 = (void *)MEMORY[0x2455C2B00]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_23EFD2000);
}

void _GLOBAL__sub_I_TILanguageResourcesUtil_mm()
{
  int v0 = (void *)MEMORY[0x2455C2B00]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_23EFD2000);
}

void _GLOBAL__sub_I_TICPEval_mm()
{
  int v0 = (void *)MEMORY[0x2455C2B00]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_23EFD2000);
}

void _GLOBAL__sub_I_TICPTrainer_mm()
{
  int v0 = (void *)MEMORY[0x2455C2B00]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_23EFD2000);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

CFCharacterSetRef CFCharacterSetGetPredefined(CFCharacterSetPredefinedSet theSetIdentifier)
{
  return (CFCharacterSetRef)MEMORY[0x270EE4750](theSetIdentifier);
}

Boolean CFCharacterSetIsLongCharacterMember(CFCharacterSetRef theSet, UTF32Char theChar)
{
  return MEMORY[0x270EE4768](theSet, *(void *)&theChar);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x270EE4A80](allocator, localeIdentifier);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return MEMORY[0x270EE5278](tokenizer);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x270EE5290](alloc, string, range.location, range.length, options, locale);
}

CFRange CFStringTokenizerGetCurrentTokenRange(CFStringTokenizerRef tokenizer)
{
  CFIndex v1 = MEMORY[0x270EE52A0](tokenizer);
  result.length = v2;
  result.location = v1;
  return result;
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x270EE53F0](allocator, filePath, pathStyle, isDirectory);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7250]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x270EE7270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

uint64_t LMLanguageModelPerformMaintenance()
{
  return MEMORY[0x270F46B70]();
}

uint64_t LMStreamTokenizerCreate()
{
  return MEMORY[0x270F46C28]();
}

uint64_t LMStreamTokenizerPushBytes()
{
  return MEMORY[0x270F46C30]();
}

uint64_t LMStreamTokenizerRelease()
{
  return MEMORY[0x270F46C38]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

uint64_t TIBundleForInputMode()
{
  return MEMORY[0x270F7CBB8]();
}

uint64_t TICharIsAlphaNumeric()
{
  return MEMORY[0x270F7CBC8]();
}

uint64_t TICharIsSpace()
{
  return MEMORY[0x270F7CBD0]();
}

uint64_t TIDispatchAsync()
{
  return MEMORY[0x270F7CBD8]();
}

uint64_t TIDispatchSync()
{
  return MEMORY[0x270F7CBE0]();
}

uint64_t TIDispatchWaitForAllBlocks()
{
  return MEMORY[0x270F7CBE8]();
}

uint64_t TIGetInputModeProperties()
{
  return MEMORY[0x270F7CBF8]();
}

uint64_t TIInputModeGetLanguage()
{
  return MEMORY[0x270F7CC10]();
}

uint64_t TIInputModeGetLanguageWithRegion()
{
  return MEMORY[0x270F7CC18]();
}

uint64_t TIIsRevision_Enabled()
{
  return MEMORY[0x270F7CCF0]();
}

uint64_t TILexiconIDForLocaleIdentifier()
{
  return MEMORY[0x270F7CCF8]();
}

uint64_t TILocaleIdentifierForLexiconID()
{
  return MEMORY[0x270F7CD00]();
}

uint64_t TILogProblemSentencesToStdout()
{
  return MEMORY[0x270F7CD08]();
}

uint64_t TIMultilingualDynamicModelEnabled()
{
  return MEMORY[0x270F7CD10]();
}

uint64_t TINgramModelPathForInputMode()
{
  return MEMORY[0x270F7CC70]();
}

uint64_t TIPrintTypingTranscriptToStdout()
{
  return MEMORY[0x270F7CD28]();
}

uint64_t TISwearWordPolicyV1Enabled()
{
  return MEMORY[0x270F7CD30]();
}

uint64_t TI_KB_USER_DIRECTORY()
{
  return MEMORY[0x270F7CD60]();
}

uint64_t TI_SET_DIALECT_LM_PATH()
{
  return MEMORY[0x270F7CD68]();
}

uint64_t TI_SET_IS_USING_CUSTOM_DIALECT_LM()
{
  return MEMORY[0x270F7CD70]();
}

uint64_t TI_SET_KB_USER_DIRECTORY()
{
  return MEMORY[0x270F7CD78]();
}

uint64_t TI_SET_USING_TOUCAN_LM()
{
  return MEMORY[0x270F7CD80]();
}

uint64_t UIKeyboardDeltaLexiconPathForInputMode()
{
  return MEMORY[0x270F7CD88]();
}

uint64_t UIKeyboardDynamicDictionaryFile()
{
  return MEMORY[0x270F7CD90]();
}

uint64_t UIKeyboardGetInputModeKBStarLayout()
{
  return MEMORY[0x270F060E0]();
}

uint64_t UIKeyboardGetSupportedSoftwareKeyboardsForInputModeAndIdiom()
{
  return MEMORY[0x270F06108]();
}

uint64_t UIKeyboardInputModeGetComponentsFromIdentifier()
{
  return MEMORY[0x270F06118]();
}

uint64_t UIKeyboardInputModeGetNormalizedLevelsFromComponents()
{
  return MEMORY[0x270F06140]();
}

uint64_t UIKeyboardInputModeWithNewSWLayout()
{
  return MEMORY[0x270F06160]();
}

uint64_t UIKeyboardPhraseLexiconPathForInputMode()
{
  return MEMORY[0x270F7CD98]();
}

uint64_t UIKeyboardStaticUnigramsFile()
{
  return MEMORY[0x270F7CDA0]();
}

uint64_t UIKeyboardUserDirectory()
{
  return MEMORY[0x270F7CDA8]();
}

uint64_t UIRectInset()
{
  return MEMORY[0x270F06248]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t TIInputManager::set_key_layout()
{
  return MEMORY[0x270F7CDF8]();
}

uint64_t TIInputManager::set_typing_model()
{
  return MEMORY[0x270F7CE10]();
}

uint64_t TIInputManager::set_input_context()
{
  return MEMORY[0x270F7CE20]();
}

uint64_t TIInputManager::set_search_algorithm()
{
  return MEMORY[0x270F7CE28]();
}

uint64_t TIInputManager::clear_continuous_path(TIInputManager *this)
{
  return MEMORY[0x270F7CE30](this);
}

uint64_t TIInputManager::set_locale_identifier()
{
  return MEMORY[0x270F7CE40]();
}

uint64_t TIInputManager::set_uses_text_checker(TIInputManager *this)
{
  return MEMORY[0x270F7CE48](this);
}

uint64_t TIInputManager::set_candidate_refinery()
{
  return MEMORY[0x270F7CE50]();
}

uint64_t TIInputManager::set_candidate_generator()
{
  return MEMORY[0x270F7CE58]();
}

uint64_t TIInputManager::lookup()
{
  return MEMORY[0x270F7CE90]();
}

uint64_t TIInputManager::add_touch()
{
  return MEMORY[0x270F7CEA0]();
}

uint64_t TIInputManager::set_input()
{
  return MEMORY[0x270F7CEA8]();
}

uint64_t TIInputManager::TIInputManager()
{
  return MEMORY[0x270F7CEB0]();
}

uint64_t language_modeling::v1::LinguisticContext::LinguisticContext()
{
  return MEMORY[0x270F46CB0]();
}

{
  return MEMORY[0x270F46CB8]();
}

uint64_t language_modeling::v1::LinguisticContext::LinguisticContext(language_modeling::v1::LinguisticContext *this)
{
  return MEMORY[0x270F46CC0](this);
}

void language_modeling::v1::LinguisticContext::~LinguisticContext(language_modeling::v1::LinguisticContext *this)
{
}

uint64_t language_modeling::v1::LinguisticContext::operator=()
{
  return MEMORY[0x270F46CD0]();
}

{
  return MEMORY[0x270F46CD8]();
}

uint64_t TIFitAffineMLLMatrix::identity(TIFitAffineMLLMatrix *this)
{
  return MEMORY[0x270F7CEC8](this);
}

void TIFitAffineMLLMatrix::TIFitAffineMLLMatrix(TIFitAffineMLLMatrix *this, const TIFitAffineMLLMatrix *a2)
{
}

void TIFitAffineMLLMatrix::TIFitAffineMLLMatrix(TIFitAffineMLLMatrix *this)
{
}

uint64_t TIFitAffineMLLMatrix::TIFitAffineMLLMatrix()
{
  return MEMORY[0x270F7CEE0]();
}

uint64_t TIFitAffineMLLMatrix::operator()()
{
  return MEMORY[0x270F7CEE8]();
}

uint64_t KB::ByteString::copy()
{
  return MEMORY[0x270F7CEF0]();
}

uint64_t KB::ByteString::operator=()
{
  return MEMORY[0x270F7CEF8]();
}

{
  return MEMORY[0x270F7CF00]();
}

uint64_t KB::std_string(KB *this, NSString *a2)
{
  return MEMORY[0x270F7CF08](this, a2);
}

uint64_t KB::utf8_string(KB *this, NSString *a2)
{
  return MEMORY[0x270F7CF10](this, a2);
}

uint64_t KB::AppTrieLoader::create()
{
  return MEMORY[0x270F7CF28]();
}

uint64_t KB::LanguageModel::find_token_id_for_word()
{
  return MEMORY[0x270F7CF30]();
}

uint64_t KB::LanguageModel::clear_dynamic_learning_bundles()
{
  return MEMORY[0x270F7CF38]();
}

uint64_t KB::LanguageModelStr::LanguageModelStr(KB::LanguageModelStr *this, const KB::LanguageModelConfig *a2)
{
  return MEMORY[0x270F7CF58](this, a2);
}

uint64_t KB::StaticDictionary::load()
{
  return MEMORY[0x270F7CF60]();
}

uint64_t KB::StaticDictionary::create(KB::StaticDictionary *this)
{
  return MEMORY[0x270F7CF68](this);
}

void KB::StaticDictionary::~StaticDictionary(KB::StaticDictionary *this)
{
}

uint64_t KB::DynamicDictionary::create_single(KB::DynamicDictionary *this)
{
  return MEMORY[0x270F7CF78](this);
}

uint64_t KB::CandidateCollection::normalize_scores(KB::CandidateCollection *this)
{
  return MEMORY[0x270F7CF88](this);
}

uint64_t KB::DictionaryContainer::create_multilexicon()
{
  return MEMORY[0x270F7CF90]();
}

void KB::DictionaryContainer::~DictionaryContainer(KB::DictionaryContainer *this)
{
}

uint64_t KB::LanguageModelConfig::LanguageModelConfig()
{
  return MEMORY[0x270F7CFA0]();
}

uint64_t KB::LanguageModelContext::append()
{
  return MEMORY[0x270F7CFA8]();
}

{
  return MEMORY[0x270F7CFB0]();
}

uint64_t KB::LanguageModelContext::LanguageModelContext()
{
  return MEMORY[0x270F7CFB8]();
}

uint64_t KB::AddressBookTrieLoader::create()
{
  return MEMORY[0x270F7CFC8]();
}

uint64_t KB::LanguageModelImplStub::LanguageModelImplStub()
{
  return MEMORY[0x270F7CFD0]();
}

uint64_t KB::MutableLexiconWrapper::create()
{
  return MEMORY[0x270F7CFD8]();
}

uint64_t KB::cf_mutable_dictionary(KB *this)
{
  return MEMORY[0x270F7CFE0](this);
}

uint64_t KB::LanguageModelContainer::LanguageModelContainer()
{
  return MEMORY[0x270F7CFE8]();
}

uint64_t KB::NgramCandidateRefinery::create()
{
  return MEMORY[0x270F7CFF0]();
}

uint64_t KB::LanguageModelLexiconGroup::set_lexicon_weight(KB::LanguageModelLexiconGroup *this, float a2)
{
  return MEMORY[0x270F7D008](this, a2);
}

uint64_t KB::LanguageModelLexiconGroup::LanguageModelLexiconGroup()
{
  return MEMORY[0x270F7D010]();
}

uint64_t KB::String::hash(KB::String *this, const char *a2)
{
  return MEMORY[0x270F7D040](this, a2);
}

uint64_t KB::String::String()
{
  return MEMORY[0x270F7D070]();
}

uint64_t KB::String::String(KB::String *this, const char *a2)
{
  return MEMORY[0x270F7D078](this, a2);
}

uint64_t KB::String::String(KB::String *this, const KB::String *a2)
{
  return MEMORY[0x270F7D080](this, a2);
}

uint64_t KB::String::String(KB::String *this)
{
  return MEMORY[0x270F7D088](this);
}

{
  return MEMORY[0x270F7D090](this);
}

void KB::String::~String(KB::String *this)
{
}

uint64_t KB::String::operator=()
{
  return MEMORY[0x270F7D0A0]();
}

{
  return MEMORY[0x270F7D0A8]();
}

uint64_t KB::Candidate::add_sources_info(KB::Candidate *this, const __CFString *a2, const __CFDictionary *a3)
{
  return MEMORY[0x270F7D0B0](this, a2, a3);
}

uint64_t KB::Candidate::append()
{
  return MEMORY[0x270F7D0B8]();
}

void KB::Candidate::~Candidate(KB::Candidate *this)
{
}

uint64_t KB::cf_number(KB *this, double a2)
{
  return MEMORY[0x270F7D0D0](this, a2);
}

uint64_t KB::ns_string(KB *this, const KB::String *a2)
{
  return MEMORY[0x270F7D0E0](this, a2);
}

uint64_t TI::TIInputRecognizer::TIInputRecognizer()
{
  return MEMORY[0x270F7D0E8]();
}

uint64_t TI::CP::ShapeStore::num_records(TI::CP::ShapeStore *this)
{
  return MEMORY[0x270F7D0F0](this);
}

uint64_t TI::CP::ShapeStore::shape_count_for_word()
{
  return MEMORY[0x270F7D0F8]();
}

uint64_t TI::CP::ShapeStore::ShapeStore(TI::CP::ShapeStore *this, const TI::CP::ShapeStoreConfiguration *a2)
{
  return MEMORY[0x270F7D100](this, a2);
}

void TI::CP::ShapeStore::~ShapeStore(TI::CP::ShapeStore *this)
{
}

uint64_t TI::CP::TIPathRecognizerEnsemble::TIPathRecognizerEnsemble()
{
  return MEMORY[0x270F7D110]();
}

uint64_t TI::CP::Path::append(TI::CP::Path *this, CGPoint a2, double a3, double a4, double a5, double a6)
{
  return MEMORY[0x270F7D118](this, (__n128)a2, *(__n128 *)&a2.y, a3, a4, a5, a6);
}

uint64_t TI::CP::Search::Search()
{
  return MEMORY[0x270F7D120]();
}

uint64_t TI::CP::operator==()
{
  return MEMORY[0x270F7D128]();
}

uint64_t TI::Favonius::KeyboardLayout::create()
{
  return MEMORY[0x270F7D130]();
}

uint64_t TI::Favonius::UnigramTypingModel::create()
{
  return MEMORY[0x270F7D138]();
}

uint64_t TI::Favonius::BeamSearchAlgorithm::create(TI::Favonius::BeamSearchAlgorithm *this, double a2, double a3)
{
  return MEMORY[0x270F7D140](this, a2, a3);
}

uint64_t TI::Favonius::UnigramCandidateGenerator::create()
{
  return MEMORY[0x270F7D148]();
}

uint64_t TI::Favonius::FavoniusStrokeBuildManager::FavoniusStrokeBuildManager(TI::Favonius::FavoniusStrokeBuildManager *this)
{
  return MEMORY[0x270F7D150](this);
}

uint64_t TI::Favonius::Touch::create()
{
  return MEMORY[0x270F7D158]();
}

uint64_t TI::Favonius::LayoutKey::create()
{
  return MEMORY[0x270F7D160]();
}

uint64_t TIFitAffineMLLMatrix::addRow()
{
  return MEMORY[0x270F7D1B0]();
}

uint64_t TIFitAffineMLLMatrix::transform(TIFitAffineMLLMatrix *this)
{
  return MEMORY[0x270F7D1B8](this);
}

uint64_t TIFitAffineMLLMatrix::operator*()
{
  return MEMORY[0x270F7D1C0]();
}

uint64_t KB::LanguageModel::id_for_static_word()
{
  return MEMORY[0x270F7D1C8]();
}

uint64_t KB::CollatorWrapper::sortkey_for_string(KB::CollatorWrapper *this, const KB::String *a2)
{
  return MEMORY[0x270F7D1D0](this, a2);
}

uint64_t KB::CollatorWrapper::sortkey_equal_strings(KB::CollatorWrapper *this, const KB::String *a2, const KB::String *a3)
{
  return MEMORY[0x270F7D1D8](this, a2, a3);
}

uint64_t KB::DictionaryContainer::derive_static_words()
{
  return MEMORY[0x270F7D1F0]();
}

uint64_t KB::DictionaryContainer::lookup(KB::DictionaryContainer *this, const KB::String *a2)
{
  return MEMORY[0x270F7D1F8](this, a2);
}

uint64_t KB::Word::capitalized_string(KB::Word *this)
{
  return MEMORY[0x270F7D210](this);
}

uint64_t KB::String::equal(KB::String *this, const KB::String *a2)
{
  return MEMORY[0x270F7D238](this, a2);
}

uint64_t KB::String::operator+()
{
  return MEMORY[0x270F7D250]();
}

uint64_t KB::Candidate::capitalized_string(KB::Candidate *this)
{
  return MEMORY[0x270F7D260](this);
}

uint64_t KB::Candidate::has_from_named_entities(KB::Candidate *this)
{
  return MEMORY[0x270F7D268](this);
}

uint64_t KB::Candidate::has_from_supplemental_lexicon(KB::Candidate *this)
{
  return MEMORY[0x270F7D270](this);
}

uint64_t KB::Candidate::string(KB::Candidate *this)
{
  return MEMORY[0x270F7D278](this);
}

uint64_t TI::ConfidenceModel::update_confidence_for_candidates(TI::ConfidenceModel *this, KB::CandidateCollection *a2)
{
  return MEMORY[0x270F7D280](this, a2);
}

uint64_t TI::CP::Path::is_inflection_point(TI::CP::Path *this)
{
  return MEMORY[0x270F7D288](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x270F98458](__n);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x270F98560](this, __str);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

void std::__libcpp_verbose_abort(const char *__format, ...)
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

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x270ED7DA0](lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x270F98F10](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

void abort(void)
{
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x270ED85E0]();
}

int atoi(const char *a1)
{
  return MEMORY[0x270ED86E8](a1);
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x270F9A400](cls, name, imp, types);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x270F9A460](cls, name);
}

IMP class_replaceMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return (IMP)MEMORY[0x270F9A4A8](cls, name, imp, types);
}

void clearerr(FILE *a1)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
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

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
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

int ferror(FILE *a1)
{
  return MEMORY[0x270ED9918](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x270ED9938](a1);
}

int fileno(FILE *a1)
{
  return MEMORY[0x270ED9978](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x270ED9A18](*(void *)&a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x270ED9A20](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9A28](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

int getc(FILE *a1)
{
  return MEMORY[0x270ED9BC0](a1);
}

int getopt_long(int a1, char *const *a2, const char *a3, const option *a4, int *a5)
{
  return MEMORY[0x270ED9CC0](*(void *)&a1, a2, a3, a4, a5);
}

long double hypot(long double __x, long double __y)
{
  MEMORY[0x270ED9E58](__x, __y);
  return result;
}

int isatty(int a1)
{
  return MEMORY[0x270ED9EF0](*(void *)&a1);
}

long double log(long double __x)
{
  MEMORY[0x270EDA0A8](__x);
  return result;
}

float logf(float a1)
{
  MEMORY[0x270EDA0F8](a1);
  return result;
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

void method_exchangeImplementations(Method m1, Method m2)
{
}

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x270F9A4F0](m);
}

const char *__cdecl method_getTypeEncoding(Method m)
{
  return (const char *)MEMORY[0x270F9A510](m);
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

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
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

int putchar(int a1)
{
  return MEMORY[0x270EDB090](*(void *)&a1);
}

int puts(const char *a1)
{
  return MEMORY[0x270EDB098](a1);
}

int sgesv_(__CLPK_integer *__n, __CLPK_integer *__nrhs, __CLPK_real *__a, __CLPK_integer *__lda, __CLPK_integer *__ipiv, __CLPK_real *__b, __CLPK_integer *__ldb, __CLPK_integer *__info)
{
  return MEMORY[0x270EDE7A8](__n, __nrhs, __a, __lda, __ipiv, __b, __ldb, __info);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDB568](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x270EDB590](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDB5D0](__s1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x270EDB650](__s1, __n);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB6D8](__str, __endptr, *(void *)&__base);
}

int system(const char *a1)
{
  return MEMORY[0x270EDB808](a1);
}

UBool u_isWhitespace(UChar32 c)
{
  return MEMORY[0x270F99538](*(void *)&c);
}

UBool u_isdigit(UChar32 c)
{
  return MEMORY[0x270F99548](*(void *)&c);
}

UBool u_ispunct(UChar32 c)
{
  return MEMORY[0x270F99560](*(void *)&c);
}

UBool u_isspace(UChar32 c)
{
  return MEMORY[0x270F99568](*(void *)&c);
}