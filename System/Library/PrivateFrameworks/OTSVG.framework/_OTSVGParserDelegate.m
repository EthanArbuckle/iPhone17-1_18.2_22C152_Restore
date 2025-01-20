@interface _OTSVGParserDelegate
- (BOOL)errorOccurred;
- (_OTSVGParserDelegate)initWithUnitsPerEm:(unsigned int)a3;
- (id).cxx_construct;
- (unordered_map<std::string,)namespaces;
- (unsigned)skipDepth;
- (unsigned)unitsPerEm;
- (vector<std::reference_wrapper<SVG::Element>,)stack;
- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6;
- (void)parser:(id)a3 didEndMappingPrefix:(id)a4;
- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7;
- (void)parser:(id)a3 didStartMappingPrefix:(id)a4 toURI:(id)a5;
- (void)parser:(id)a3 parseErrorOccurred:(id)a4;
- (void)parser:(id)a3 validationErrorOccurred:(id)a4;
- (void)root;
- (void)setErrorOccurred:(BOOL)a3;
- (void)setNamespaces:()unordered_map<std:()std:()std:()std:(std:(std::stack<std::string>>>> *)a3 :allocator<std::pair<const)std::string :equal_to<std::string> :hash<std::string> :stack<std::string> :string;
- (void)setRoot:(void *)a3;
- (void)setSkipDepth:(unsigned int)a3;
- (void)setStack:()vector<std:(std::allocator<std::reference_wrapper<SVG::Element>>> *)a3 :reference_wrapper<SVG::Element>;
- (void)setUnitsPerEm:(unsigned int)a3;
@end

@implementation _OTSVGParserDelegate

- (_OTSVGParserDelegate)initWithUnitsPerEm:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v14.receiver = self;
  v14.super_class = (Class)_OTSVGParserDelegate;
  v4 = [(_OTSVGParserDelegate *)&v14 init];
  v5 = v4;
  if (v4)
  {
    [(_OTSVGParserDelegate *)v4 setErrorOccurred:0];
    [(_OTSVGParserDelegate *)v5 setSkipDepth:0];
    [(_OTSVGParserDelegate *)v5 setUnitsPerEm:v3];
    [(_OTSVGParserDelegate *)v5 setRoot:0];
    __p = 0;
    v12 = 0;
    uint64_t v13 = 0;
    [(_OTSVGParserDelegate *)v5 setStack:&__p];
    if (__p)
    {
      v12 = __p;
      operator delete(__p);
    }
    *(_OWORD *)v8 = 0u;
    long long v9 = 0u;
    int v10 = 1065353216;
    [(_OTSVGParserDelegate *)v5 setNamespaces:v8];
    std::__hash_table<std::__hash_value_type<std::string,std::stack<std::string>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::stack<std::string>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::stack<std::string>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::stack<std::string>>>>::__deallocate_node((void *)v9);
    v6 = v8[0];
    v8[0] = 0;
    if (v6) {
      operator delete(v6);
    }
  }
  return v5;
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  uint64_t v112 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if ([(_OTSVGParserDelegate *)self skipDepth])
  {
    [(_OTSVGParserDelegate *)self setSkipDepth:[(_OTSVGParserDelegate *)self skipDepth] + 1];
    goto LABEL_22;
  }
  memset(&__p, 170, sizeof(__p));
  SVG::convertString((SVG *)&__p, v14);
  std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type size = __p.__r_.__value_.__l.__size_;
  }
  if (size == 26)
  {
    v18 = (__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
        ? &__p
        : (std::string *)__p.__r_.__value_.__r.__words[0];
    std::string::size_type v19 = v18->__r_.__value_.__r.__words[0];
    std::string::size_type v20 = v18->__r_.__value_.__l.__size_;
    std::string::size_type v21 = v18->__r_.__value_.__r.__words[2];
    uint64_t data_low = LOWORD(v18[1].__r_.__value_.__l.__data_);
    BOOL v23 = v19 == *(void *)"http://www.w3.org/2000/svg" && v20 == *(void *)"ww.w3.org/2000/svg";
    BOOL v24 = v23 && v21 == *(void *)"g/2000/svg";
    if (v24 && data_low == *(unsigned __int16 *)"vg")
    {
      id v88 = v14;
      v89 = v12;
      v90 = v13;
      [(_OTSVGParserDelegate *)self namespaces];
      id v87 = v16;
      id v26 = v16;
      *(_OWORD *)v98 = 0u;
      *(_OWORD *)v99 = 0u;
      unint64_t v100 = 0xAAAAAAAA3F800000;
      long long v105 = 0u;
      long long v106 = 0u;
      long long v107 = 0u;
      long long v108 = 0u;
      id obj = v26;
      uint64_t v92 = [v26 countByEnumeratingWithState:&v105 objects:&v110 count:16];
      if (!v92)
      {
LABEL_161:

        std::__hash_table<std::__hash_value_type<std::string,std::stack<std::string>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::stack<std::string>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::stack<std::string>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::stack<std::string>>>>::__deallocate_node(v96);
        if (v94) {
          operator delete(v94);
        }
        id v13 = v90;
        int v79 = [v90 isEqualToString:@"svg"];
        uint64_t v80 = *(void *)[(_OTSVGParserDelegate *)self root];
        id v12 = v89;
        if (v79)
        {
          if (!v80)
          {
            [(_OTSVGParserDelegate *)self unitsPerEm];
            operator new();
          }
          [(_OTSVGParserDelegate *)self setSkipDepth:1];
          id v14 = v88;
          id v16 = v87;
        }
        else
        {
          id v14 = v88;
          id v16 = v87;
          if (!v80) {
            goto LABEL_172;
          }
          [(_OTSVGParserDelegate *)self stack];
          v81 = v110;
          v82 = v111;
          if (v110)
          {
            v111 = v110;
            operator delete(v110);
          }
          if (v81 == v82)
          {
LABEL_172:
            [(_OTSVGParserDelegate *)self setErrorOccurred:1];
            [v89 abortParsing];
          }
          else
          {
            *(void *)&long long v105 = 0;
            if ([v90 isEqualToString:@"g"])
            {
              [(_OTSVGParserDelegate *)self stack];
              operator new();
            }
            if ([v90 isEqualToString:@"defs"])
            {
              [(_OTSVGParserDelegate *)self stack];
              operator new();
            }
            if ([v90 isEqualToString:@"use"])
            {
              [(_OTSVGParserDelegate *)self stack];
              operator new();
            }
            if ([v90 isEqualToString:@"image"])
            {
              [(_OTSVGParserDelegate *)self stack];
              operator new();
            }
            if ([v90 isEqualToString:@"path"])
            {
              [(_OTSVGParserDelegate *)self stack];
              operator new();
            }
            if ([v90 isEqualToString:@"rect"])
            {
              [(_OTSVGParserDelegate *)self stack];
              operator new();
            }
            if ([v90 isEqualToString:@"circle"])
            {
              [(_OTSVGParserDelegate *)self stack];
              operator new();
            }
            if ([v90 isEqualToString:@"ellipse"])
            {
              [(_OTSVGParserDelegate *)self stack];
              operator new();
            }
            if ([v90 isEqualToString:@"line"])
            {
              [(_OTSVGParserDelegate *)self stack];
              operator new();
            }
            if ([v90 isEqualToString:@"polyline"])
            {
              [(_OTSVGParserDelegate *)self stack];
              operator new();
            }
            if ([v90 isEqualToString:@"polygon"])
            {
              [(_OTSVGParserDelegate *)self stack];
              operator new();
            }
            if ([v90 isEqualToString:@"linearGradient"])
            {
              [(_OTSVGParserDelegate *)self stack];
              operator new();
            }
            if ([v90 isEqualToString:@"radialGradient"])
            {
              [(_OTSVGParserDelegate *)self stack];
              operator new();
            }
            if ([v90 isEqualToString:@"stop"])
            {
              [(_OTSVGParserDelegate *)self stack];
              operator new();
            }
            if ([v90 isEqualToString:@"pattern"])
            {
              [(_OTSVGParserDelegate *)self stack];
              operator new();
            }
            if ([v90 isEqualToString:@"clipPath"])
            {
              [(_OTSVGParserDelegate *)self stack];
              operator new();
            }
            if ([v90 isEqualToString:@"mask"])
            {
              [(_OTSVGParserDelegate *)self stack];
              operator new();
            }
            [(_OTSVGParserDelegate *)self setSkipDepth:1];
            id v12 = v89;
            id v13 = v90;
            id v14 = v88;
            id v16 = v87;
            uint64_t v83 = v105;
            *(void *)&long long v105 = 0;
            if (v83) {
              (*(void (**)(uint64_t))(*(void *)v83 + 8))(v83);
            }
          }
        }
        v84 = (void **)v99[0];
        if (v99[0])
        {
          do
          {
            v85 = (void **)*v84;
            if (*((char *)v84 + 87) < 0) {
              operator delete(v84[8]);
            }
            if (*((char *)v84 + 63) < 0) {
              operator delete(v84[5]);
            }
            if (*((char *)v84 + 39) < 0) {
              operator delete(v84[2]);
            }
            operator delete(v84);
            v84 = v85;
          }
          while (v85);
        }
        v86 = v98[0];
        v98[0] = 0;
        if (v86) {
          operator delete(v86);
        }
        goto LABEL_20;
      }
      uint64_t v91 = *(void *)v106;
LABEL_25:
      uint64_t v27 = 0;
      while (1)
      {
        if (*(void *)v106 != v91) {
          objc_enumerationMutation(obj);
        }
        v28 = *(void **)(*((void *)&v105 + 1) + 8 * v27);
        memset(v104, 0, sizeof(v104));
        SVG::convertString((SVG *)&v103, v28);
        if (SHIBYTE(v104[1].__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v104[1].__r_.__value_.__l.__data_);
        }
        v104[1] = v103;
        size_t v29 = (v103.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
            ? HIBYTE(v104[1].__r_.__value_.__r.__words[2])
            : v104[1].__r_.__value_.__l.__size_;
        if (!v29
          || ((v103.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
            ? (data = &v104[1])
            : (data = (std::string *)v104[1].__r_.__value_.__l.__data_),
              (v31 = memchr(data, 58, v29), std::string::size_type v32 = v31 - (unsigned char *)data, v31) ? (v33 = v32 == -1) : (v33 = 1),
              v33))
        {
          std::string::operator=(v104, &__p);
        }
        else
        {
          memset(&v103, 170, sizeof(v103));
          std::string::basic_string(&v103, &v104[1], 0, v32, (std::allocator<char> *)&v102);
          std::string::basic_string(&v102, &v104[1], v32 + 1, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&v109);
          if (SHIBYTE(v104[1].__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v104[1].__r_.__value_.__l.__data_);
          }
          v104[1] = v102;
          if ((v103.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            v34 = &v103;
          }
          else {
            v34 = (std::string *)v103.__r_.__value_.__r.__words[0];
          }
          if ((v103.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            std::string::size_type v35 = HIBYTE(v103.__r_.__value_.__r.__words[2]);
          }
          else {
            std::string::size_type v35 = v103.__r_.__value_.__l.__size_;
          }
          unint64_t v36 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100]((uint64_t)&v102, (uint64_t *)v34, v35);
          if (v95)
          {
            unint64_t v37 = v36;
            uint8x8_t v38 = (uint8x8_t)vcnt_s8(v95);
            v38.i16[0] = vaddlv_u8(v38);
            unint64_t v39 = v38.u32[0];
            if (v38.u32[0] > 1uLL)
            {
              unint64_t v40 = v36;
              if (v36 >= *(void *)&v95) {
                unint64_t v40 = v36 % *(void *)&v95;
              }
            }
            else
            {
              unint64_t v40 = (*(void *)&v95 - 1) & v36;
            }
            v42 = (unsigned __int8 **)*((void *)v94 + v40);
            if (!v42 || (v43 = *v42) == 0)
            {
LABEL_68:
              p_p = &__p;
              goto LABEL_69;
            }
            while (1)
            {
              unint64_t v44 = *((void *)v43 + 1);
              if (v37 == v44)
              {
                if (std::equal_to<std::string>::operator()[abi:nn180100]((uint64_t)&v97, v43 + 16, (unsigned __int8 *)&v103))
                {
                  unint64_t v77 = *((void *)v43 + 10) + *((void *)v43 + 9) - 1;
                  p_p = (const std::string *)(*(void *)(*((void *)v43 + 6) + 8 * (v77 / 0xAA)) + 24 * (v77 % 0xAA));
                  goto LABEL_69;
                }
              }
              else
              {
                if (v39 > 1)
                {
                  if (v44 >= *(void *)&v95) {
                    v44 %= *(void *)&v95;
                  }
                }
                else
                {
                  v44 &= *(void *)&v95 - 1;
                }
                if (v44 != v40) {
                  goto LABEL_68;
                }
              }
              v43 = *(unsigned __int8 **)v43;
              if (!v43) {
                goto LABEL_68;
              }
            }
          }
          p_p = &__p;
LABEL_69:
          std::string::operator=(v104, p_p);
          if (SHIBYTE(v103.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v103.__r_.__value_.__l.__data_);
          }
        }
        unint64_t v45 = 0xAAAAAAAAAAAAAAAALL;
        memset(&v103, 170, sizeof(v103));
        v46 = [obj objectForKeyedSubscript:v28];
        SVG::convertString((SVG *)&v103, v46);

        unint64_t v47 = SVG::QualifiedNameHash::operator()((uint64_t)&v99[1], (uint64_t)v104);
        unint64_t v48 = v47;
        unint64_t v49 = (unint64_t)v98[1];
        if (v98[1])
        {
          uint8x8_t v50 = (uint8x8_t)vcnt_s8((int8x8_t)v98[1]);
          v50.i16[0] = vaddlv_u8(v50);
          unint64_t v51 = v50.u32[0];
          if (v50.u32[0] > 1uLL)
          {
            unint64_t v45 = v47;
            if ((void *)v47 >= v98[1]) {
              unint64_t v45 = v47 % (unint64_t)v98[1];
            }
          }
          else
          {
            unint64_t v45 = ((unint64_t)v98[1] - 1) & v47;
          }
          v52 = (unsigned __int8 **)*((void *)v98[0] + v45);
          if (v52)
          {
            for (i = *v52; i; i = *(unsigned __int8 **)i)
            {
              unint64_t v54 = *((void *)i + 1);
              if (v54 == v48)
              {
                if (SVG::QualifiedNamePredicate::operator()((uint64_t)&v100, i + 16, (unsigned __int8 *)v104)) {
                  goto LABEL_143;
                }
              }
              else
              {
                if (v51 > 1)
                {
                  if (v54 >= v49) {
                    v54 %= v49;
                  }
                }
                else
                {
                  v54 &= v49 - 1;
                }
                if (v54 != v45) {
                  break;
                }
              }
            }
          }
        }
        v55 = (char *)operator new(0x58uLL);
        *(void *)v55 = 0;
        *((void *)v55 + 1) = v48;
        *(std::string *)(v55 + 16) = v104[0];
        memset(v104, 0, 24);
        *(std::string *)(v55 + 40) = v104[1];
        memset(&v104[1], 0, sizeof(std::string));
        long long v56 = *(_OWORD *)&v103.__r_.__value_.__l.__data_;
        *((void *)v55 + 10) = *((void *)&v103.__r_.__value_.__l + 2);
        *((_OWORD *)v55 + 4) = v56;
        memset(&v103, 0, sizeof(v103));
        float v57 = (float)((unint64_t)v99[1] + 1);
        if (!v49 || (float)(*(float *)&v100 * (float)v49) < v57) {
          break;
        }
LABEL_133:
        v73 = v98[0];
        v74 = (void *)*((void *)v98[0] + v45);
        if (v74)
        {
          *(void *)v55 = *v74;
        }
        else
        {
          *(void **)v55 = v99[0];
          v99[0] = v55;
          v73[v45] = v99;
          if (!*(void *)v55) {
            goto LABEL_142;
          }
          unint64_t v75 = *(void *)(*(void *)v55 + 8);
          if ((v49 & (v49 - 1)) != 0)
          {
            if (v75 >= v49) {
              v75 %= v49;
            }
          }
          else
          {
            v75 &= v49 - 1;
          }
          v74 = (char *)v98[0] + 8 * v75;
        }
        void *v74 = v55;
LABEL_142:
        ++v99[1];
LABEL_143:
        if (SHIBYTE(v103.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v103.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(v104[1].__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v104[1].__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(v104[0].__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v104[0].__r_.__value_.__l.__data_);
        }
        if (++v27 == v92)
        {
          uint64_t v78 = [obj countByEnumeratingWithState:&v105 objects:&v110 count:16];
          uint64_t v92 = v78;
          if (!v78) {
            goto LABEL_161;
          }
          goto LABEL_25;
        }
      }
      BOOL v58 = (v49 & (v49 - 1)) != 0;
      if (v49 < 3) {
        BOOL v58 = 1;
      }
      unint64_t v59 = v58 | (2 * v49);
      unint64_t v60 = vcvtps_u32_f32(v57 / *(float *)&v100);
      if (v59 <= v60) {
        int8x8_t prime = (int8x8_t)v60;
      }
      else {
        int8x8_t prime = (int8x8_t)v59;
      }
      if (*(void *)&prime == 1)
      {
        int8x8_t prime = (int8x8_t)2;
      }
      else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
      {
        int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
        unint64_t v49 = (unint64_t)v98[1];
      }
      if (*(void *)&prime > v49) {
        goto LABEL_99;
      }
      if (*(void *)&prime < v49)
      {
        unint64_t v68 = vcvtps_u32_f32((float)(unint64_t)v99[1] / *(float *)&v100);
        if (v49 < 3 || (uint8x8_t v69 = (uint8x8_t)vcnt_s8((int8x8_t)v49), v69.i16[0] = vaddlv_u8(v69), v69.u32[0] > 1uLL))
        {
          unint64_t v68 = std::__next_prime(v68);
        }
        else
        {
          uint64_t v70 = 1 << -(char)__clz(v68 - 1);
          if (v68 >= 2) {
            unint64_t v68 = v70;
          }
        }
        if (*(void *)&prime <= v68) {
          int8x8_t prime = (int8x8_t)v68;
        }
        if (*(void *)&prime >= v49)
        {
          unint64_t v49 = (unint64_t)v98[1];
        }
        else
        {
          if (prime)
          {
LABEL_99:
            if (*(void *)&prime >> 61) {
              std::__throw_bad_array_new_length[abi:nn180100]();
            }
            v62 = operator new(8 * *(void *)&prime);
            v63 = v98[0];
            v98[0] = v62;
            if (v63) {
              operator delete(v63);
            }
            uint64_t v64 = 0;
            v98[1] = (void *)prime;
            do
              *((void *)v98[0] + v64++) = 0;
            while (*(void *)&prime != v64);
            v65 = (void **)v99[0];
            if (v99[0])
            {
              unint64_t v66 = *((void *)v99[0] + 1);
              uint8x8_t v67 = (uint8x8_t)vcnt_s8(prime);
              v67.i16[0] = vaddlv_u8(v67);
              if (v67.u32[0] > 1uLL)
              {
                if (v66 >= *(void *)&prime) {
                  v66 %= *(void *)&prime;
                }
              }
              else
              {
                v66 &= *(void *)&prime - 1;
              }
              *((void *)v98[0] + v66) = v99;
              for (j = *v65; j; unint64_t v66 = v72)
              {
                unint64_t v72 = j[1];
                if (v67.u32[0] > 1uLL)
                {
                  if (v72 >= *(void *)&prime) {
                    v72 %= *(void *)&prime;
                  }
                }
                else
                {
                  v72 &= *(void *)&prime - 1;
                }
                if (v72 != v66)
                {
                  if (!*((void *)v98[0] + v72))
                  {
                    *((void *)v98[0] + v72) = v65;
                    goto LABEL_124;
                  }
                  *v65 = (void *)*j;
                  void *j = **((void **)v98[0] + v72);
                  **((void **)v98[0] + v72) = j;
                  j = v65;
                }
                unint64_t v72 = v66;
LABEL_124:
                v65 = (void **)j;
                j = (void *)*j;
              }
            }
            unint64_t v49 = (unint64_t)prime;
            goto LABEL_128;
          }
          v76 = v98[0];
          v98[0] = 0;
          if (v76) {
            operator delete(v76);
          }
          unint64_t v49 = 0;
          v98[1] = 0;
        }
      }
LABEL_128:
      if ((v49 & (v49 - 1)) != 0)
      {
        if (v48 >= v49) {
          unint64_t v45 = v48 % v49;
        }
        else {
          unint64_t v45 = v48;
        }
      }
      else
      {
        unint64_t v45 = (v49 - 1) & v48;
      }
      goto LABEL_133;
    }
  }
  [(_OTSVGParserDelegate *)self setSkipDepth:1];
LABEL_20:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
LABEL_22:
}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  if ([(_OTSVGParserDelegate *)self skipDepth])
  {
    uint64_t v7 = [(_OTSVGParserDelegate *)self skipDepth] - 1;
    [(_OTSVGParserDelegate *)self setSkipDepth:v7];
  }
  else
  {
    self->stack.__end_ = (char *)self->stack.__end_ - 8;
  }
}

- (void)parser:(id)a3 didStartMappingPrefix:(id)a4 toURI:(id)a5
{
  p_namespaces = &self->namespaces;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  SVG::convertString((SVG *)__p, v9);
  long long v104 = 0u;
  long long v105 = 0u;
  long long v103 = 0u;
  if (v107 >= 0) {
    v11 = (uint64_t *)__p;
  }
  else {
    v11 = (uint64_t *)__p[0];
  }
  if (v107 >= 0) {
    unint64_t v12 = HIBYTE(v107);
  }
  else {
    unint64_t v12 = (unint64_t)__p[1];
  }
  unint64_t v13 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100]((uint64_t)&v108, v11, v12);
  unint64_t v14 = v13;
  unint64_t value = self->namespaces.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  id v99 = v9;
  id v100 = v8;
  id v101 = v10;
  if (value)
  {
    uint8x8_t v16 = (uint8x8_t)vcnt_s8((int8x8_t)value);
    v16.i16[0] = vaddlv_u8(v16);
    unint64_t v17 = v16.u32[0];
    if (v16.u32[0] > 1uLL)
    {
      unint64_t v18 = v13;
      std::string::size_type v19 = p_namespaces;
      if (v13 >= value) {
        unint64_t v18 = v13 % value;
      }
    }
    else
    {
      unint64_t v18 = (value - 1) & v13;
      std::string::size_type v19 = p_namespaces;
    }
    BOOL v24 = (void **)v19->__table_.__bucket_list_.__ptr_.__value_[v18];
    if (!v24 || (v25 = (char *)*v24) == 0)
    {
      uint64_t v20 = 0;
      uint64_t v21 = 0;
      uint64_t v22 = 0;
      uint64_t v23 = 0;
      long long v98 = 0u;
      goto LABEL_26;
    }
    while (1)
    {
      unint64_t v26 = *((void *)v25 + 1);
      if (v26 == v14)
      {
        if (std::equal_to<std::string>::operator()[abi:nn180100]((uint64_t)&self->namespaces.__table_.__p3_, (unsigned __int8 *)v25 + 16, (unsigned __int8 *)__p))
        {
          unint64_t v66 = v101;
          goto LABEL_48;
        }
      }
      else
      {
        if (v17 > 1)
        {
          if (v26 >= value) {
            v26 %= value;
          }
        }
        else
        {
          v26 &= value - 1;
        }
        if (v26 != v18)
        {
LABEL_24:
          long long v98 = v103;
          uint64_t v22 = *((void *)&v104 + 1);
          uint64_t v23 = v104;
          uint64_t v20 = *((void *)&v105 + 1);
          uint64_t v21 = v105;
          goto LABEL_26;
        }
      }
      v25 = *(char **)v25;
      if (!v25) {
        goto LABEL_24;
      }
    }
  }
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  long long v98 = 0u;
  unint64_t v18 = 0xAAAAAAAAAAAAAAAALL;
LABEL_26:
  p_p1 = &self->namespaces.__table_.__p1_;
  unint64_t v109 = 0xAAAAAAAAAAAAAA01;
  v25 = (char *)operator new(0x58uLL);
  *(void *)&long long v108 = v25;
  *((void *)&v108 + 1) = &self->namespaces.__table_.__p1_;
  *(void *)v25 = 0;
  *((void *)v25 + 1) = v14;
  *((_OWORD *)v25 + 1) = *(_OWORD *)__p;
  *((void *)v25 + 4) = v107;
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v107 = 0;
  *(_OWORD *)(v25 + 40) = v98;
  *((void *)v25 + 7) = v23;
  *((void *)v25 + 8) = v22;
  long long v103 = 0u;
  long long v104 = 0u;
  *((void *)v25 + 9) = v21;
  *((void *)v25 + 10) = v20;
  long long v105 = 0uLL;
  float v28 = (float)(self->namespaces.__table_.__p2_.__value_ + 1);
  float v29 = self->namespaces.__table_.__p3_.__value_;
  id v9 = v99;
  id v8 = v100;
  if (!value || (float)(v29 * (float)value) < v28)
  {
    BOOL v30 = 1;
    if (value >= 3) {
      BOOL v30 = (value & (value - 1)) != 0;
    }
    unint64_t v31 = v30 | (2 * value);
    unint64_t v32 = vcvtps_u32_f32(v28 / v29);
    if (v31 <= v32) {
      size_t v33 = v32;
    }
    else {
      size_t v33 = v31;
    }
    std::__hash_table<SVG::GradientElement const*,std::hash<SVG::GradientElement const*>,std::equal_to<SVG::GradientElement const*>,std::allocator<SVG::GradientElement const*>>::__rehash<true>((uint64_t)p_namespaces, v33);
    unint64_t value = self->namespaces.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    if ((value & (value - 1)) != 0)
    {
      if (v14 >= value) {
        unint64_t v18 = v14 % value;
      }
      else {
        unint64_t v18 = v14;
      }
    }
    else
    {
      unint64_t v18 = (value - 1) & v14;
    }
  }
  v34 = p_namespaces->__table_.__bucket_list_.__ptr_.__value_;
  std::string::size_type v35 = (void **)p_namespaces->__table_.__bucket_list_.__ptr_.__value_[v18];
  if (v35)
  {
    *(void *)v25 = *v35;
    unint64_t v66 = v101;
LABEL_46:
    *std::string::size_type v35 = v25;
    goto LABEL_47;
  }
  *(__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, std::stack<std::string>>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, std::stack<std::string>>, void *>>> *)v25 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, std::stack<std::string>>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, std::stack<std::string>>, void *>>>)p_p1->__value_.__next_;
  p_p1->__value_.__next_ = v25;
  v34[v18] = p_p1;
  unint64_t v66 = v101;
  if (*(void *)v25)
  {
    unint64_t v36 = *(void *)(*(void *)v25 + 8);
    if ((value & (value - 1)) != 0)
    {
      if (v36 >= value) {
        v36 %= value;
      }
    }
    else
    {
      v36 &= value - 1;
    }
    std::string::size_type v35 = &p_namespaces->__table_.__bucket_list_.__ptr_.__value_[v36];
    goto LABEL_46;
  }
LABEL_47:
  *(void *)&long long v108 = 0;
  ++self->namespaces.__table_.__p2_.__value_;
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::stack<std::string>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::stack<std::string>>,void *>>>>::reset[abi:nn180100]((uint64_t)&v108);
LABEL_48:
  std::deque<std::string>::~deque[abi:nn180100]((uint64_t)&v103);
  if (SHIBYTE(v107) < 0) {
    operator delete(__p[0]);
  }
  SVG::convertString((SVG *)&v108, v8);
  unint64_t v37 = (char *)*((void *)v25 + 7);
  uint8x8_t v38 = (char *)*((void *)v25 + 6);
  unint64_t v39 = (v37 - v38) >> 3;
  if (v37 == v38) {
    uint64_t v40 = 0;
  }
  else {
    uint64_t v40 = 170 * v39 - 1;
  }
  unint64_t v41 = *((void *)v25 + 9);
  unint64_t v42 = *((void *)v25 + 10) + v41;
  if (v40 == v42)
  {
    v43 = v25 + 40;
    if (v41 < 0xAA)
    {
      unint64_t v59 = (char *)*((void *)v25 + 8);
      unint64_t v60 = (char *)*((void *)v25 + 5);
      if (v39 >= (v59 - v60) >> 3)
      {
        if (v59 == v60) {
          unint64_t v61 = 1;
        }
        else {
          unint64_t v61 = (v59 - v60) >> 2;
        }
        *(void *)&long long v105 = v25 + 64;
        *(void *)&long long v103 = std::__allocate_at_least[abi:nn180100]<std::allocator<SVG::Recorder::State *>>(v61);
        *((void *)&v103 + 1) = v103 + 8 * v39;
        *(void *)&long long v104 = *((void *)&v103 + 1);
        *((void *)&v104 + 1) = v103 + 8 * v62;
        __p[0] = operator new(0xFF0uLL);
        std::__split_buffer<std::string *>::push_back(&v103, __p);
        for (i = (void *)*((void *)v25 + 7);
              i != *((void **)v25 + 6);
              std::__split_buffer<std::string *>::push_front((uint64_t)&v103, i))
        {
          --i;
        }
        uint64_t v64 = (void *)*((void *)v25 + 5);
        long long v65 = v104;
        *(_OWORD *)(v25 + 40) = v103;
        *(_OWORD *)(v25 + 56) = v65;
        if (v64) {
          operator delete(v64);
        }
        goto LABEL_85;
      }
      if (v59 != v37)
      {
        *(void *)&long long v103 = operator new(0xFF0uLL);
        std::__split_buffer<std::string *>::push_back((void *)v25 + 5, &v103);
LABEL_85:
        uint8x8_t v38 = (char *)*((void *)v25 + 6);
        unint64_t v42 = *((void *)v25 + 10) + *((void *)v25 + 9);
        goto LABEL_86;
      }
      *(void *)&long long v103 = operator new(0xFF0uLL);
      std::__split_buffer<std::string *>::push_front((uint64_t)(v25 + 40), &v103);
      uint64_t v78 = (void *)*((void *)v25 + 6);
      unint64_t v37 = (char *)*((void *)v25 + 7);
      uint64_t v80 = *v78;
      int v79 = (char *)(v78 + 1);
      uint64_t v45 = v80;
      *((void *)v25 + 6) = v79;
      if (v37 == *((char **)v25 + 8))
      {
        uint64_t v83 = (uint64_t)&v79[-*v43];
        if ((unint64_t)v79 > *v43)
        {
          id v48 = v9;
          id v49 = v8;
          uint64_t v84 = v83 >> 3;
          BOOL v51 = v83 >> 3 < -1;
          uint64_t v85 = (v83 >> 3) + 2;
          if (v51) {
            uint64_t v86 = v85;
          }
          else {
            uint64_t v86 = v84 + 1;
          }
          uint64_t v87 = -(v86 >> 1);
          uint64_t v88 = v86 >> 1;
          v89 = &v79[-8 * v88];
          int64_t v90 = v37 - v79;
          if (v37 != v79)
          {
            memmove(&v79[-8 * v88], v79, v37 - v79);
            int v79 = (char *)*((void *)v25 + 6);
          }
          unint64_t v37 = &v89[v90];
          BOOL v58 = &v79[8 * v87];
          goto LABEL_63;
        }
        if (v37 == (char *)*v43) {
          unint64_t v91 = 1;
        }
        else {
          unint64_t v91 = (uint64_t)&v37[-*v43] >> 2;
        }
        unint64_t v68 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<SVG::Recorder::State *>>(v91);
        uint8x8_t v69 = &v68[8 * (v91 >> 2)];
        v71 = &v68[8 * v92];
        v93 = (uint64_t *)*((void *)v25 + 6);
        unint64_t v37 = v69;
        uint64_t v94 = *((void *)v25 + 7) - (void)v93;
        if (v94)
        {
          unint64_t v37 = &v69[v94 & 0xFFFFFFFFFFFFFFF8];
          uint64_t v95 = 8 * (v94 >> 3);
          v96 = &v68[8 * (v91 >> 2)];
          do
          {
            uint64_t v97 = *v93++;
            *(void *)v96 = v97;
            v96 += 8;
            v95 -= 8;
          }
          while (v95);
        }
LABEL_81:
        unint64_t v77 = (void *)*((void *)v25 + 5);
        *((void *)v25 + 5) = v68;
        *((void *)v25 + 6) = v69;
        *((void *)v25 + 7) = v37;
        *((void *)v25 + 8) = v71;
        if (v77)
        {
          operator delete(v77);
          unint64_t v37 = (char *)*((void *)v25 + 7);
        }
      }
    }
    else
    {
      *((void *)v25 + 9) = v41 - 170;
      uint64_t v46 = *(void *)v38;
      unint64_t v44 = v38 + 8;
      uint64_t v45 = v46;
      *((void *)v25 + 6) = v44;
      if (v37 == *((char **)v25 + 8))
      {
        uint64_t v47 = (uint64_t)&v44[-*v43];
        if ((unint64_t)v44 > *v43)
        {
          id v48 = v9;
          id v49 = v8;
          uint64_t v50 = v47 >> 3;
          BOOL v51 = v47 >> 3 < -1;
          uint64_t v52 = (v47 >> 3) + 2;
          if (v51) {
            uint64_t v53 = v52;
          }
          else {
            uint64_t v53 = v50 + 1;
          }
          uint64_t v54 = -(v53 >> 1);
          uint64_t v55 = v53 >> 1;
          long long v56 = &v44[-8 * v55];
          int64_t v57 = v37 - v44;
          if (v37 != v44)
          {
            memmove(&v44[-8 * v55], v44, v37 - v44);
            unint64_t v37 = (char *)*((void *)v25 + 6);
          }
          BOOL v58 = &v37[8 * v54];
          unint64_t v37 = &v56[v57];
LABEL_63:
          *((void *)v25 + 6) = v58;
          *((void *)v25 + 7) = v37;
          id v8 = v49;
          id v9 = v48;
          goto LABEL_84;
        }
        if (v37 == (char *)*v43) {
          unint64_t v67 = 1;
        }
        else {
          unint64_t v67 = (uint64_t)&v37[-*v43] >> 2;
        }
        unint64_t v68 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<SVG::Recorder::State *>>(v67);
        uint8x8_t v69 = &v68[8 * (v67 >> 2)];
        v71 = &v68[8 * v70];
        unint64_t v72 = (uint64_t *)*((void *)v25 + 6);
        unint64_t v37 = v69;
        uint64_t v73 = *((void *)v25 + 7) - (void)v72;
        if (v73)
        {
          unint64_t v37 = &v69[v73 & 0xFFFFFFFFFFFFFFF8];
          uint64_t v74 = 8 * (v73 >> 3);
          unint64_t v75 = &v68[8 * (v67 >> 2)];
          do
          {
            uint64_t v76 = *v72++;
            *(void *)unint64_t v75 = v76;
            v75 += 8;
            v74 -= 8;
          }
          while (v74);
        }
        goto LABEL_81;
      }
    }
LABEL_84:
    *(void *)unint64_t v37 = v45;
    *((void *)v25 + 7) += 8;
    goto LABEL_85;
  }
LABEL_86:
  unint64_t v81 = *(void *)&v38[8 * (v42 / 0xAA)] + 24 * (v42 % 0xAA);
  long long v82 = v108;
  *(void *)(v81 + 16) = v109;
  *(_OWORD *)unint64_t v81 = v82;
  unint64_t v109 = 0;
  long long v108 = 0uLL;
  ++*((void *)v25 + 10);

  if (SHIBYTE(v109) < 0) {
    operator delete((void *)v108);
  }
}

- (void)parser:(id)a3 didEndMappingPrefix:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  SVG::convertString((SVG *)&__p, v6);
  if ((v35 & 0x80u) == 0) {
    p_p = (uint64_t *)&__p;
  }
  else {
    p_p = (uint64_t *)__p;
  }
  if ((v35 & 0x80u) == 0) {
    unint64_t v9 = v35;
  }
  else {
    unint64_t v9 = (unint64_t)p_p1;
  }
  unint64_t v10 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100]((uint64_t)&v36, p_p, v9);
  unint64_t value = self->namespaces.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if (!value) {
    goto LABEL_24;
  }
  unint64_t v12 = v10;
  uint8x8_t v13 = (uint8x8_t)vcnt_s8((int8x8_t)value);
  v13.i16[0] = vaddlv_u8(v13);
  unint64_t v14 = v13.u32[0];
  if (v13.u32[0] > 1uLL)
  {
    unint64_t v15 = v10;
    if (v10 >= value) {
      unint64_t v15 = v10 % value;
    }
  }
  else
  {
    unint64_t v15 = (value - 1) & v10;
  }
  uint8x8_t v16 = (void **)self->namespaces.__table_.__bucket_list_.__ptr_.__value_[v15];
  if (v16)
  {
    unint64_t v17 = (unsigned __int8 *)*v16;
    if (*v16)
    {
      do
      {
        unint64_t v18 = *((void *)v17 + 1);
        if (v18 == v12)
        {
          if (std::equal_to<std::string>::operator()[abi:nn180100]((uint64_t)&self->namespaces.__table_.__p3_, v17 + 16, (unsigned __int8 *)&__p))break; {
        }
          }
        else
        {
          if (v14 > 1)
          {
            if (v18 >= value) {
              v18 %= value;
            }
          }
          else
          {
            v18 &= value - 1;
          }
          if (v18 != v15) {
            goto LABEL_24;
          }
        }
        unint64_t v17 = *(unsigned __int8 **)v17;
      }
      while (v17);
    }
  }
  else
  {
LABEL_24:
    unint64_t v17 = 0;
  }
  if ((char)v35 < 0) {
    operator delete(__p);
  }
  uint64_t v19 = *((void *)v17 + 10) - 1;
  unint64_t v20 = *(void *)(*((void *)v17 + 6) + 8 * ((v19 + *((void *)v17 + 9)) / 0xAAuLL))
      + 24 * ((v19 + *((void *)v17 + 9)) % 0xAAuLL);
  if (*(char *)(v20 + 23) < 0)
  {
    operator delete(*(void **)v20);
    uint64_t v19 = *((void *)v17 + 10) - 1;
  }
  *((void *)v17 + 10) = v19;
  std::deque<std::string>::__maybe_remove_back_spare[abi:nn180100]((void *)v17 + 5);
  uint64_t v21 = *((void *)v17 + 10);

  if (!v21)
  {
    unint64_t v22 = self->namespaces.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    unint64_t v23 = *((void *)v17 + 1);
    uint8x8_t v24 = (uint8x8_t)vcnt_s8((int8x8_t)v22);
    v24.i16[0] = vaddlv_u8(v24);
    if (v24.u32[0] > 1uLL)
    {
      if (v23 >= v22) {
        v23 %= v22;
      }
    }
    else
    {
      v23 &= v22 - 1;
    }
    v25 = self->namespaces.__table_.__bucket_list_.__ptr_.__value_;
    unint64_t v26 = (unsigned __int8 *)v25[v23];
    do
    {
      uint64_t v27 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, std::stack<std::string>>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, std::stack<std::string>>, void *>>> *)v26;
      unint64_t v26 = *(unsigned __int8 **)v26;
    }
    while (v26 != v17);
    if (v27 == &self->namespaces.__table_.__p1_) {
      goto LABEL_47;
    }
    unint64_t next = (unint64_t)v27[1].__value_.__next_;
    if (v24.u32[0] > 1uLL)
    {
      if (next >= v22) {
        next %= v22;
      }
    }
    else
    {
      next &= v22 - 1;
    }
    if (next != v23)
    {
LABEL_47:
      if (!*(void *)v17) {
        goto LABEL_48;
      }
      unint64_t v29 = *(void *)(*(void *)v17 + 8);
      if (v24.u32[0] > 1uLL)
      {
        if (v29 >= v22) {
          v29 %= v22;
        }
      }
      else
      {
        v29 &= v22 - 1;
      }
      if (v29 != v23) {
LABEL_48:
      }
        v25[v23] = 0;
    }
    BOOL v30 = *(unint64_t **)v17;
    if (*(void *)v17)
    {
      unint64_t v31 = v30[1];
      if (v24.u32[0] > 1uLL)
      {
        if (v31 >= v22) {
          v31 %= v22;
        }
      }
      else
      {
        v31 &= v22 - 1;
      }
      if (v31 != v23)
      {
        self->namespaces.__table_.__bucket_list_.__ptr_.__value_[v31] = v27;
        BOOL v30 = *(unint64_t **)v17;
      }
    }
    v27->__value_.__next_ = v30;
    *(void *)unint64_t v17 = 0;
    --self->namespaces.__table_.__p2_.__value_;
    std::string __p = v17;
    p_p1 = &self->namespaces.__table_.__p1_;
    char v34 = 1;
    std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::stack<std::string>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::stack<std::string>>,void *>>>>::reset[abi:nn180100]((uint64_t)&__p);
  }
}

- (void)parser:(id)a3 parseErrorOccurred:(id)a4
{
  id v5 = a3;
  if (![(_OTSVGParserDelegate *)self errorOccurred])
  {
    [(_OTSVGParserDelegate *)self setErrorOccurred:1];
    [v5 abortParsing];
  }
}

- (void)parser:(id)a3 validationErrorOccurred:(id)a4
{
  id v5 = a3;
  if (![(_OTSVGParserDelegate *)self errorOccurred])
  {
    [(_OTSVGParserDelegate *)self setErrorOccurred:1];
    [v5 abortParsing];
  }
}

- (BOOL)errorOccurred
{
  return self->errorOccurred;
}

- (void)setErrorOccurred:(BOOL)a3
{
  self->errorOccurred = a3;
}

- (unsigned)skipDepth
{
  return self->skipDepth;
}

- (void)setSkipDepth:(unsigned int)a3
{
  self->skipDepth = a3;
}

- (unsigned)unitsPerEm
{
  return self->unitsPerEm;
}

- (void)setUnitsPerEm:(unsigned int)a3
{
  self->unitsPerEm = a3;
}

- (void)root
{
  return self->root;
}

- (void)setRoot:(void *)a3
{
  self->root = a3;
}

- (vector<std::reference_wrapper<SVG::Element>,)stack
{
  objc_copyCppObjectAtomic(retstr, &self->stack, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property_);
  return result;
}

- (void)setStack:()vector<std:(std::allocator<std::reference_wrapper<SVG::Element>>> *)a3 :reference_wrapper<SVG::Element>
{
}

- (unordered_map<std::string,)namespaces
{
  objc_copyCppObjectAtomic(retstr, &self->namespaces, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__52);
  return result;
}

- (void)setNamespaces:()unordered_map<std:()std:()std:()std:(std:(std::stack<std::string>>>> *)a3 :allocator<std::pair<const)std::string :equal_to<std::string> :hash<std::string> :stack<std::string> :string
{
}

- (void).cxx_destruct
{
  std::__hash_table<std::__hash_value_type<std::string,std::stack<std::string>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::stack<std::string>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::stack<std::string>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::stack<std::string>>>>::~__hash_table((uint64_t)&self->namespaces);
  begin = self->stack.__begin_;
  if (begin)
  {
    self->stack.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((void *)self + 10) = 0;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_DWORD *)self + 22) = 1065353216;
  return self;
}

@end