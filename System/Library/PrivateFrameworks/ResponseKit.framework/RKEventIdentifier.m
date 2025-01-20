@interface RKEventIdentifier
- (RKEventIdentifier)init;
- (RKEventIdentifier)initWithLanguageID:(id)a3;
- (id)_identifyOwnedTokenSequences:(id)a3;
- (id)_identifyStrings:(id)a3 otherDateCount:(unint64_t)a4 otherDates:(RKEventIdentifierRange *)a5;
- (id)identifyMessage:(id)a3;
- (id)identifyStrings:(id)a3;
- (id)identifyText:(id)a3;
- (void)_identifyStrings:(uint64_t)a3 otherDateCount:(char)a4 otherDates:;
- (void)resetEventIdentifierModel;
@end

@implementation RKEventIdentifier

- (RKEventIdentifier)init
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = objc_msgSend(MEMORY[0x263EFF960], "preferredLanguages", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v12;
    v6 = self;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v3);
        }
        v8 = [(RKEventIdentifier *)v6 initWithLanguageID:*(void *)(*((void *)&v11 + 1) + 8 * i)];
        if (v8)
        {
          self = v8;
          v9 = self;
          goto LABEL_12;
        }
        v6 = 0;
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      v6 = 0;
      self = 0;
      v9 = 0;
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    v9 = 0;
  }
LABEL_12:

  return v9;
}

- (RKEventIdentifier)initWithLanguageID:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RKEventIdentifier;
  uint64_t v5 = [(RKEventIdentifier *)&v12 init];
  if (!v5) {
    goto LABEL_3;
  }
  v6 = [[RKNLEventTokenizer alloc] initWithLanguageID:v4];
  tokenizer = v5->_tokenizer;
  v5->_tokenizer = v6;

  uint64_t v8 = +[RKMontrealModel modelForLanguage:v4];
  model = v5->_model;
  v5->_model = (RKMontrealModel *)v8;

  if (!v5->_model) {
    v10 = 0;
  }
  else {
LABEL_3:
  }
    v10 = v5;

  return v10;
}

- (void)resetEventIdentifierModel
{
  model = self->_model;
  if (model) {
    [(RKMontrealModel *)model reset];
  }
}

- (id)_identifyOwnedTokenSequences:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v19 = [(RKMontrealModel *)self->_model model];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (!v6)
  {

LABEL_16:
    long long v14 = 0;
    long long v13 = v5;
    goto LABEL_17;
  }
  size_t v7 = 0;
  uint64_t v8 = *(void *)v22;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v22 != v8) {
        objc_enumerationMutation(v5);
      }
      unint64_t v10 = [*(id *)(*((void *)&v21 + 1) + 8 * i) count];
      unint64_t v11 = kMaxSequenceLength;
      if (v10 < kMaxSequenceLength) {
        unint64_t v11 = v10;
      }
      v7 += v11;
    }
    uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  }
  while (v6);

  if (!v7) {
    goto LABEL_16;
  }
  v17 = malloc_type_calloc(v7, 0x14uLL, 0x100004052888210uLL);
  uint64_t v12 = weak_MRLModelStateCreate(v19);
  if (!v12) {
    __assert_rtn("-[RKEventIdentifier _identifyOwnedTokenSequences:]", "RKEventIdentifier.mm", 266, "modelState");
  }
  uint64_t v16 = v12;
  memset(v20, 0, sizeof(v20));
  id v18 = v5;
  if ([v18 countByEnumeratingWithState:v20 objects:&v25 count:16])
  {
    objc_msgSend(*(id *)v20[1], "count", v16);
    operator new[]();
  }

  weak_MRLModelStateRelease(v19, v16);
  long long v13 = v5;
  long long v14 = [[RKEventIdentification alloc] initWithOwnedTokenSequences:v18 probabilities:v17];
LABEL_17:

  return v14;
}

- (id)_identifyStrings:(id)a3 otherDateCount:(unint64_t)a4 otherDates:(RKEventIdentifierRange *)a5
{
  uint64_t v122 = *MEMORY[0x263EF8340];
  id v103 = a3;
  size_t v7 = self;
  objc_sync_enter(v7);
  if (!v7->_ioMappings)
  {
    if ([(RKMontrealModel *)v7->_model model])
    {
      uint64_t v32 = ((uint64_t (*)(void *))weak_MRLModelGetIOMappings)([(RKMontrealModel *)v7->_model model]);
      v7->_ioMappings = (const void *)v32;
      if (v32)
      {
        uint64_t v33 = 0;
        __p = 0;
        v119 = 0;
        v120 = 0;
        do
        {
          uint64_t v34 = (uint64_t)v7->_ioMappings + 48;
          int v117 = kOutputMappingCodesForEventIds[v33];
          int v35 = *(_DWORD *)std::map<int,int>::at(v34, &v117);
          v36 = v119;
          if (v119 >= v120)
          {
            uint64_t v38 = (v119 - (unsigned char *)__p) >> 3;
            unint64_t v39 = v38 + 1;
            if ((unint64_t)(v38 + 1) >> 61) {
              std::vector<std::pair<int,int>>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v40 = v120 - (unsigned char *)__p;
            if ((v120 - (unsigned char *)__p) >> 2 > v39) {
              unint64_t v39 = v40 >> 2;
            }
            if ((unint64_t)v40 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v41 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v41 = v39;
            }
            v42 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<int,int>>>((uint64_t)&v120, v41);
            v44 = &v42[8 * v38];
            *(_DWORD *)v44 = v35;
            *((_DWORD *)v44 + 1) = v33;
            v46 = (char *)__p;
            v45 = v119;
            v47 = v44;
            if (v119 != __p)
            {
              do
              {
                uint64_t v48 = *((void *)v45 - 1);
                v45 -= 8;
                *((void *)v47 - 1) = v48;
                v47 -= 8;
              }
              while (v45 != v46);
              v45 = (char *)__p;
            }
            v37 = v44 + 8;
            __p = v47;
            v119 = v44 + 8;
            v120 = &v42[8 * v43];
            if (v45) {
              operator delete(v45);
            }
          }
          else
          {
            *(_DWORD *)v119 = v35;
            *((_DWORD *)v36 + 1) = v33;
            v37 = v36 + 8;
          }
          v119 = v37;
          ++v33;
        }
        while (v33 != 5);
        unint64_t v49 = 126 - 2 * __clz((v37 - (unsigned char *)__p) >> 3);
        if (v37 == __p) {
          uint64_t v50 = 0;
        }
        else {
          uint64_t v50 = v49;
        }
        std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *,false>((uint64_t)__p, (int *)v37, (uint64_t)&v117, v50, 1);
        v51 = (char *)__p;
        outputPermutation = v7->_outputPermutation;
        for (uint64_t i = 4; i != 44; i += 8)
          *outputPermutation++ = *(_DWORD *)&v51[i];
        v119 = v51;
        operator delete(v51);
      }
    }
  }
  objc_sync_exit(v7);

  if (v7->_ioMappings)
  {
    __p = 0;
    v119 = 0;
    v120 = 0;
    if (a5)
    {
      if (a4)
      {
        uint64_t v8 = 0;
        v9 = 0;
        unint64_t v10 = 0;
        uint64_t v11 = 0;
        while (1)
        {
          uint64_t v12 = &a5[v11];
          unint64_t var0 = v12->var0;
          NSUInteger location = v12->var1.location;
          NSUInteger length = v12->var1.length;
          if (v10 >= v9)
          {
            unint64_t v17 = 0xAAAAAAAAAAAAAAABLL * ((v10 - v8) >> 3) + 1;
            if (v17 > 0xAAAAAAAAAAAAAAALL) {
              std::vector<std::pair<int,int>>::__throw_length_error[abi:ne180100]();
            }
            if (0x5555555555555556 * ((v9 - v8) >> 3) > v17) {
              unint64_t v17 = 0x5555555555555556 * ((v9 - v8) >> 3);
            }
            unint64_t v18 = 0xAAAAAAAAAAAAAAABLL * ((v9 - v8) >> 3) >= 0x555555555555555 ? 0xAAAAAAAAAAAAAAALL : v17;
            if (v18)
            {
              if (v18 > 0xAAAAAAAAAAAAAAALL) {
                std::__throw_bad_array_new_length[abi:ne180100]();
              }
              unint64_t v19 = var0;
              v20 = (char *)operator new(24 * v18);
              unint64_t var0 = v19;
            }
            else
            {
              v20 = 0;
            }
            long long v21 = &v20[8 * ((v10 - v8) >> 3)];
            *(void *)long long v21 = var0;
            *((void *)v21 + 1) = location;
            v21[16] = 1;
            if (v10 == v8)
            {
              uint64_t v8 = &v20[8 * ((v10 - v8) >> 3)];
            }
            else
            {
              long long v22 = &v20[8 * ((v10 - v8) >> 3)];
              do
              {
                long long v23 = *(_OWORD *)(v10 - 24);
                *((void *)v22 - 1) = *((void *)v10 - 1);
                *(_OWORD *)(v22 - 24) = v23;
                v22 -= 24;
                v10 -= 24;
              }
              while (v10 != v8);
              unint64_t v10 = v8;
              uint64_t v8 = v22;
            }
            v9 = &v20[24 * v18];
            uint64_t v16 = (unint64_t *)(v21 + 24);
            if (v10)
            {
              unint64_t v24 = var0;
              operator delete(v10);
              unint64_t var0 = v24;
            }
          }
          else
          {
            *(void *)unint64_t v10 = var0;
            *((void *)v10 + 1) = location;
            uint64_t v16 = (unint64_t *)(v10 + 24);
            v10[16] = 1;
          }
          NSUInteger v25 = length + location;
          if (v16 >= (unint64_t *)v9) {
            break;
          }
          *uint64_t v16 = var0;
          v16[1] = v25;
          unint64_t v10 = (char *)(v16 + 3);
          *((unsigned char *)v16 + 16) = 0;
LABEL_44:
          if (++v11 == a4) {
            goto LABEL_71;
          }
        }
        unint64_t v26 = 0xAAAAAAAAAAAAAAABLL * (((char *)v16 - v8) >> 3) + 1;
        if (v26 > 0xAAAAAAAAAAAAAAALL) {
          std::vector<std::pair<int,int>>::__throw_length_error[abi:ne180100]();
        }
        if (0x5555555555555556 * ((v9 - v8) >> 3) > v26) {
          unint64_t v26 = 0x5555555555555556 * ((v9 - v8) >> 3);
        }
        if (0xAAAAAAAAAAAAAAABLL * ((v9 - v8) >> 3) >= 0x555555555555555) {
          unint64_t v27 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v27 = v26;
        }
        if (v27)
        {
          if (v27 > 0xAAAAAAAAAAAAAAALL) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          unint64_t v28 = var0;
          v29 = (char *)operator new(24 * v27);
          unint64_t var0 = v28;
        }
        else
        {
          v29 = 0;
        }
        v30 = &v29[8 * (((char *)v16 - v8) >> 3)];
        v9 = &v29[24 * v27];
        *(void *)v30 = var0;
        *((void *)v30 + 1) = v25;
        v30[16] = 0;
        unint64_t v10 = v30 + 24;
        if (v16 == (unint64_t *)v8)
        {
          uint64_t v8 = (char *)v16;
        }
        else
        {
          do
          {
            long long v31 = *(_OWORD *)(v16 - 3);
            *((void *)v30 - 1) = *(v16 - 1);
            *(_OWORD *)(v30 - 24) = v31;
            v30 -= 24;
            v16 -= 3;
          }
          while (v16 != (unint64_t *)v8);
          if (!v8) {
            goto LABEL_43;
          }
        }
        operator delete(v8);
LABEL_43:
        uint64_t v8 = v30;
        goto LABEL_44;
      }
      uint64_t v8 = 0;
      unint64_t v10 = 0;
LABEL_71:
      unint64_t v55 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * ((v10 - v8) >> 3));
      if (v10 == v8) {
        uint64_t v56 = 0;
      }
      else {
        uint64_t v56 = v55;
      }
      std::__introsort<std::_ClassicAlgPolicy,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::$_0 &,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::Delta *,false>((unint64_t)v8, (unint64_t)v10, v56, 1);
      if (v10 != v8)
      {
        int v57 = 0;
        uint64_t v58 = 0;
        uint64_t v59 = 0;
        v60 = v8;
        do
        {
          if (v60[16])
          {
            if (v57)
            {
              ++v57;
            }
            else
            {
              uint64_t v58 = *(void *)v60;
              uint64_t v59 = *((void *)v60 + 1);
              int v57 = 1;
            }
          }
          else if (!--v57)
          {
            if (v58 == *(void *)v60)
            {
              uint64_t v61 = *((void *)v60 + 1) - v59;
              v62 = v119;
              if (v119 >= v120)
              {
                v64 = (char *)__p;
                unint64_t v65 = 0xAAAAAAAAAAAAAAABLL * ((v119 - (unsigned char *)__p) >> 3);
                unint64_t v66 = v65 + 1;
                if (v65 + 1 > 0xAAAAAAAAAAAAAAALL) {
                  std::vector<std::pair<int,int>>::__throw_length_error[abi:ne180100]();
                }
                if (0x5555555555555556 * ((v120 - (unsigned char *)__p) >> 3) > v66) {
                  unint64_t v66 = 0x5555555555555556 * ((v120 - (unsigned char *)__p) >> 3);
                }
                if (0xAAAAAAAAAAAAAAABLL * ((v120 - (unsigned char *)__p) >> 3) >= 0x555555555555555) {
                  unint64_t v67 = 0xAAAAAAAAAAAAAAALL;
                }
                else {
                  unint64_t v67 = v66;
                }
                if (v67)
                {
                  v68 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RKEventIdentifierRange>>((uint64_t)&v120, v67);
                  v64 = (char *)__p;
                  v62 = v119;
                }
                else
                {
                  v68 = 0;
                }
                v69 = &v68[24 * v65];
                *(void *)v69 = v58;
                *((void *)v69 + 1) = v59;
                *((void *)v69 + 2) = v61;
                v70 = v69;
                if (v62 != v64)
                {
                  do
                  {
                    long long v71 = *(_OWORD *)(v62 - 24);
                    *((void *)v70 - 1) = *((void *)v62 - 1);
                    *(_OWORD *)(v70 - 24) = v71;
                    v70 -= 24;
                    v62 -= 24;
                  }
                  while (v62 != v64);
                  v64 = (char *)__p;
                }
                v63 = v69 + 24;
                __p = v70;
                v119 = v69 + 24;
                v120 = &v68[24 * v67];
                if (v64) {
                  operator delete(v64);
                }
              }
              else
              {
                *(void *)v119 = v58;
                *((void *)v62 + 1) = v59;
                v63 = v62 + 24;
                *((void *)v62 + 2) = v61;
              }
              int v57 = 0;
              v119 = v63;
            }
            else
            {
              int v57 = 0;
            }
          }
          v60 += 24;
        }
        while (v60 != v10);
      }
      if (v8) {
        operator delete(v8);
      }
    }
    id v107 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v115 = 0u;
    long long v116 = 0u;
    long long v113 = 0u;
    long long v114 = 0u;
    obunint64_t j = v103;
    uint64_t v72 = [obj countByEnumeratingWithState:&v113 objects:v121 count:16];
    if (v72)
    {
      unint64_t v73 = 0;
      uint64_t v104 = 0;
      uint64_t v106 = *(void *)v114;
      do
      {
        uint64_t v74 = 0;
        uint64_t v112 = v104;
        v104 += v72;
        uint64_t v108 = v72;
        do
        {
          if (*(void *)v114 != v106) {
            objc_enumerationMutation(obj);
          }
          uint64_t v110 = v74;
          v75 = *(void **)(*((void *)&v113 + 1) + 8 * v74);
          context = (void *)MEMORY[0x21D45BF80]();
          id v76 = objc_alloc_init(MEMORY[0x263EFF980]);
          v77 = (char *)__p;
          if (v73 >= 0xAAAAAAAAAAAAAAABLL * ((v119 - (unsigned char *)__p) >> 3))
          {
            unint64_t v78 = 0;
          }
          else
          {
            unint64_t v78 = 0;
            uint64_t v79 = 24 * v73;
            do
            {
              if (*(void *)&v77[v79] != v112) {
                break;
              }
              v80 = &v77[v79];
              uint64_t v82 = *((void *)v80 + 1);
              uint64_t v81 = *((void *)v80 + 2);
              v83 = objc_msgSend(v75, "substringWithRange:", v78, v82 - v78);
              v84 = [(RKNLEventTokenizer *)v7->_tokenizer buildTokenSquence:v83 withOffset:v78];
              if ([v84 count]) {
                [v76 addObjectsFromArray:v84];
              }
              v85 = [[RKNLEventToken alloc] initWithString:@"DATE_TIME" location:v82 length:v81];
              [(RKNLEventToken *)v85 setTokenID:IOMappings::lookupInput((IOMappings *)v7->_ioMappings, "DATE_TIME", 9uLL)];
              [v76 addObject:v85];

              unint64_t v78 = v81 + v82;
              ++v73;
              v77 = (char *)__p;
              v79 += 24;
            }
            while (v73 < 0xAAAAAAAAAAAAAAABLL * ((v119 - (unsigned char *)__p) >> 3));
          }
          if (v78 < [v75 length])
          {
            v86 = objc_msgSend(v75, "substringWithRange:", v78, objc_msgSend(v75, "length") - v78);
            v87 = [(RKNLEventTokenizer *)v7->_tokenizer buildTokenSquence:v86 withOffset:v78];
            if ([v87 count]) {
              [v76 addObjectsFromArray:v87];
            }
          }
          for (unint64_t j = 0; [v76 count] > j; ++j)
          {
            v89 = [v76 objectAtIndexedSubscript:j];
            v90 = [v89 string];
            BOOL v91 = +[RKNLEventTokenizer isSpecialToken:v90];

            v92 = [v76 objectAtIndexedSubscript:j];
            [v92 string];
            if (v91)
            {
              id v93 = objc_claimAutoreleasedReturnValue();
              v94 = (char *)[v93 UTF8String];

              size_t v95 = strlen(v94);
              uint64_t v96 = IOMappings::lookupInput((IOMappings *)v7->_ioMappings, v94, v95);
            }
            else {
              v98 = {;
            }
              id v99 = [v98 lowercaseString];
              v100 = (char *)[v99 UTF8String];

              size_t v101 = strlen(v100);
              uint64_t v96 = IOMappings::lookupInput((IOMappings *)v7->_ioMappings, v100, v101);
            }
            v97 = [v76 objectAtIndexedSubscript:j];
            [v97 setTokenID:v96];
          }
          [v107 addObject:v76];

          ++v112;
          uint64_t v74 = v110 + 1;
        }
        while (v110 + 1 != v108);
        uint64_t v72 = [obj countByEnumeratingWithState:&v113 objects:v121 count:16];
      }
      while (v72);
    }

    v54 = [(RKEventIdentifier *)v7 _identifyOwnedTokenSequences:v107];

    if (__p)
    {
      v119 = (char *)__p;
      operator delete(__p);
    }
  }
  else
  {
    v54 = 0;
  }

  return v54;
}

- (id)identifyStrings:(id)a3
{
  v3 = [(RKEventIdentifier *)self _identifyStrings:a3 otherDateCount:0 otherDates:0];

  return v3;
}

- (id)identifyText:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v14 = a3;
  unint64_t v17 = objc_opt_new();
  uint64_t v23 = 0;
  unint64_t v24 = &v23;
  uint64_t v25 = 0x4812000000;
  unint64_t v26 = __Block_byref_object_copy__51;
  unint64_t v27 = __Block_byref_object_dispose__52;
  unint64_t v28 = "";
  v30 = 0;
  uint64_t v31 = 0;
  __p = 0;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  obunint64_t j = v14;
  uint64_t v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v32, 16, v14);
  if (v3)
  {
    uint64_t v4 = 0;
    uint64_t v5 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(obj);
        }
        size_t v7 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v8 = [v7 string];
        [v17 addObject:v8];
        uint64_t v9 = [v8 length];
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __34__RKEventIdentifier_identifyText___block_invoke;
        v18[3] = &unk_2642D2A80;
        v18[4] = &v23;
        v18[5] = v4 + i;
        objc_msgSend(v7, "enumerateAnnotationsInRange:usingBlock:", 0, v9, v18);
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v19 objects:v32 count:16];
      v4 += i;
    }
    while (v3);
  }

  uint64_t v10 = v24[7] - v24[6];
  if (v10) {
    uint64_t v11 = v24[6];
  }
  else {
    uint64_t v11 = 0;
  }
  uint64_t v12 = [(RKEventIdentifier *)self _identifyStrings:v17 otherDateCount:0xAAAAAAAAAAAAAAABLL * (v10 >> 3) otherDates:v11];
  _Block_object_dispose(&v23, 8);
  if (__p)
  {
    v30 = __p;
    operator delete(__p);
  }

  return v12;
}

void __34__RKEventIdentifier_identifyText___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if ((unint64_t)(a2 - 1) <= 1)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    size_t v7 = *(void **)(*(void *)(a1 + 32) + 8);
    uint64_t v8 = (char *)v7[7];
    unint64_t v9 = v7[8];
    if ((unint64_t)v8 >= v9)
    {
      uint64_t v11 = (char *)v7[6];
      unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * ((v8 - v11) >> 3);
      unint64_t v13 = v12 + 1;
      if (v12 + 1 > 0xAAAAAAAAAAAAAAALL) {
        std::vector<std::pair<int,int>>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v14 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v9 - (void)v11) >> 3);
      if (2 * v14 > v13) {
        unint64_t v13 = 2 * v14;
      }
      if (v14 >= 0x555555555555555) {
        unint64_t v15 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v15 = v13;
      }
      if (v15)
      {
        uint64_t v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RKEventIdentifierRange>>((uint64_t)(v7 + 8), v15);
        uint64_t v11 = (char *)v7[6];
        uint64_t v8 = (char *)v7[7];
      }
      else
      {
        uint64_t v16 = 0;
      }
      unint64_t v17 = &v16[24 * v12];
      unint64_t v18 = &v16[24 * v15];
      *(void *)unint64_t v17 = v6;
      *((void *)v17 + 1) = a3;
      *((void *)v17 + 2) = a4;
      uint64_t v10 = v17 + 24;
      if (v8 != v11)
      {
        do
        {
          long long v19 = *(_OWORD *)(v8 - 24);
          *((void *)v17 - 1) = *((void *)v8 - 1);
          *(_OWORD *)(v17 - 24) = v19;
          v17 -= 24;
          v8 -= 24;
        }
        while (v8 != v11);
        uint64_t v11 = (char *)v7[6];
      }
      v7[6] = v17;
      v7[7] = v10;
      v7[8] = v18;
      if (v11) {
        operator delete(v11);
      }
    }
    else
    {
      *(void *)uint64_t v8 = v6;
      *((void *)v8 + 1) = a3;
      uint64_t v10 = v8 + 24;
      *((void *)v8 + 2) = a4;
    }
    v7[7] = v10;
  }
}

- (id)identifyMessage:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v17 = a3;
  long long v20 = objc_opt_new();
  uint64_t v26 = 0;
  unint64_t v27 = &v26;
  uint64_t v28 = 0x4812000000;
  v29 = __Block_byref_object_copy__51;
  v30 = __Block_byref_object_dispose__52;
  uint64_t v31 = "";
  uint64_t v33 = 0;
  uint64_t v34 = 0;
  __p = 0;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obunint64_t j = v17;
  uint64_t v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v35, 16, v17);
  if (v3)
  {
    uint64_t v4 = 0;
    uint64_t v5 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v23 != v5) {
          objc_enumerationMutation(obj);
        }
        size_t v7 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v8 = [v7 title];
        unint64_t v9 = [v7 string];
        uint64_t v10 = [v8 stringByAppendingString:@" "];
        uint64_t v11 = [v10 stringByAppendingString:v9];

        [v20 addObject:v11];
        uint64_t v12 = [v11 length];
        v21[0] = MEMORY[0x263EF8330];
        v21[1] = 3221225472;
        v21[2] = __37__RKEventIdentifier_identifyMessage___block_invoke;
        v21[3] = &unk_2642D2A80;
        v21[4] = &v26;
        v21[5] = v4 + i;
        objc_msgSend(v7, "enumerateAnnotationsInRange:usingBlock:", 0, v12, v21);
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v22 objects:v35 count:16];
      v4 += i;
    }
    while (v3);
  }

  uint64_t v13 = v27[7] - v27[6];
  if (v13) {
    uint64_t v14 = v27[6];
  }
  else {
    uint64_t v14 = 0;
  }
  unint64_t v15 = [(RKEventIdentifier *)self _identifyStrings:v20 otherDateCount:0xAAAAAAAAAAAAAAABLL * (v13 >> 3) otherDates:v14];
  _Block_object_dispose(&v26, 8);
  if (__p)
  {
    uint64_t v33 = __p;
    operator delete(__p);
  }

  return v15;
}

void __37__RKEventIdentifier_identifyMessage___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if ((unint64_t)(a2 - 1) <= 1)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    size_t v7 = *(void **)(*(void *)(a1 + 32) + 8);
    uint64_t v8 = (char *)v7[7];
    unint64_t v9 = v7[8];
    if ((unint64_t)v8 >= v9)
    {
      uint64_t v11 = (char *)v7[6];
      unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * ((v8 - v11) >> 3);
      unint64_t v13 = v12 + 1;
      if (v12 + 1 > 0xAAAAAAAAAAAAAAALL) {
        std::vector<std::pair<int,int>>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v14 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v9 - (void)v11) >> 3);
      if (2 * v14 > v13) {
        unint64_t v13 = 2 * v14;
      }
      if (v14 >= 0x555555555555555) {
        unint64_t v15 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v15 = v13;
      }
      if (v15)
      {
        uint64_t v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RKEventIdentifierRange>>((uint64_t)(v7 + 8), v15);
        uint64_t v11 = (char *)v7[6];
        uint64_t v8 = (char *)v7[7];
      }
      else
      {
        uint64_t v16 = 0;
      }
      id v17 = &v16[24 * v12];
      unint64_t v18 = &v16[24 * v15];
      *(void *)id v17 = v6;
      *((void *)v17 + 1) = a3;
      *((void *)v17 + 2) = a4;
      uint64_t v10 = v17 + 24;
      if (v8 != v11)
      {
        do
        {
          long long v19 = *(_OWORD *)(v8 - 24);
          *((void *)v17 - 1) = *((void *)v8 - 1);
          *(_OWORD *)(v17 - 24) = v19;
          v17 -= 24;
          v8 -= 24;
        }
        while (v8 != v11);
        uint64_t v11 = (char *)v7[6];
      }
      v7[6] = v17;
      v7[7] = v10;
      v7[8] = v18;
      if (v11) {
        operator delete(v11);
      }
    }
    else
    {
      *(void *)uint64_t v8 = v6;
      *((void *)v8 + 1) = a3;
      uint64_t v10 = v8 + 24;
      *((void *)v8 + 2) = a4;
    }
    v7[7] = v10;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenizer, 0);

  objc_storeStrong((id *)&self->_model, 0);
}

- (void)_identifyStrings:(uint64_t)a3 otherDateCount:(char)a4 otherDates:
{
@end