@interface MDPathFilter
- ($1CD0F41CAFB66BEF540F4446800F077B)filter:(SEL)a3 allowBundleCheck:(const char *)a4;
- ($1CD0F41CAFB66BEF540F4446800F077B)filterFullPath:(SEL)a3;
- ($1CD0F41CAFB66BEF540F4446800F077B)filterFullPathTestBundle:(SEL)a3;
- ($1CD0F41CAFB66BEF540F4446800F077B)filterPartialPath:(SEL)a3;
- ($1CD0F41CAFB66BEF540F4446800F077B)iCloudPath:(SEL)a3 updateFilter:(const char *)a4;
- (BOOL)isDataROSP;
- (MDPathFilter)initWithData:(id)a3;
- (MDPathFilter)initWithMDPlist:(_MDPlistContainer *)a3;
- (_MDPlistContainer)plist;
- (id)data;
- (unint64_t)filterSubAuxValues:(id *)a3 count:(int *)a4;
- (unint64_t)trimBundlePath:(id *)a3 path:(const char *)a4 buffer:(char *)a5 length:(unint64_t)a6;
- (void)dealloc;
@end

@implementation MDPathFilter

- (MDPathFilter)initWithMDPlist:(_MDPlistContainer *)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  v67.receiver = self;
  v67.super_class = (Class)MDPathFilter;
  v4 = [(MDPathFilter *)&v67 init];
  v5 = v4;
  if (a3 && v4)
  {
    v4->_plist = (_MDPlistContainer *)CFRetain(a3);
    long long v65 = 0uLL;
    $37FF168C8709F524D812460C59637AB1 v66 = 0;
    _MDPlistContainerGetPlistObjectAtKeyPath((uint64_t)a3, "/COMMON", (uint64_t)&v65, v6, v7, v8, v9, v10);
    uint64_t v64 = 0;
    long long v62 = v65;
    $37FF168C8709F524D812460C59637AB1 v63 = v66;
    v5->_commonValues = ($931575D2DB9AA82C8240DDD2E2E52BBF *)_MDPlistDataGetBytePtr((uint64_t *)&v62, &v64);
    long long v62 = 0uLL;
    $37FF168C8709F524D812460C59637AB1 v63 = 0;
    _MDPlistContainerGetPlistObjectAtKeyPath((uint64_t)a3, "/PREFIXES", (uint64_t)&v62, v11, v12, v13, v14, v15);
    *(_OWORD *)&v5->_prefixesDictionary.containerBytes = v62;
    v5->_prefixesDictionary.$37FF168C8709F524D812460C59637AB1 reference = v63;
    long long v62 = 0uLL;
    $37FF168C8709F524D812460C59637AB1 v63 = 0;
    _MDPlistContainerGetPlistObjectAtKeyPath((uint64_t)a3, "/EXTENSIONS", (uint64_t)&v62, v16, v17, v18, v19, v20);
    *(_OWORD *)&v5->_extensionsDictionary.containerBytes = v62;
    v5->_extensionsDictionary.$37FF168C8709F524D812460C59637AB1 reference = v63;
    long long v62 = 0uLL;
    $37FF168C8709F524D812460C59637AB1 v63 = 0;
    _MDPlistContainerGetPlistObjectAtKeyPath((uint64_t)a3, "/HIDDEN_EXTENSIONS", (uint64_t)&v62, v21, v22, v23, v24, v25);
    *(_OWORD *)&v5->_hiddenExtensionsDictionary.containerBytes = v62;
    v5->_hiddenExtensionsDictionary.$37FF168C8709F524D812460C59637AB1 reference = v63;
    long long v62 = 0uLL;
    $37FF168C8709F524D812460C59637AB1 v63 = 0;
    _MDPlistContainerGetPlistObjectAtKeyPath((uint64_t)a3, "/ROOT_ARRAY", (uint64_t)&v62, v26, v27, v28, v29, v30);
    *(_OWORD *)&v5->_rootArray.containerBytes = v62;
    v5->_rootArray.$37FF168C8709F524D812460C59637AB1 reference = v63;
    $37FF168C8709F524D812460C59637AB1 v63 = 0;
    long long v62 = 0uLL;
    uint64_t var2 = v5->_commonValues->var2;
    long long v60 = *(_OWORD *)&v5->_rootArray.containerBytes;
    $37FF168C8709F524D812460C59637AB1 reference = v5->_rootArray.reference;
    _MDPlistArrayGetPlistObjectAtIndex((uint64_t)&v60, var2, v32, v33, v34, v35, v36, v37, &v62);
    long long v60 = v62;
    $37FF168C8709F524D812460C59637AB1 reference = v63;
    if (_MDPlistGetPlistObjectType((uint64_t)&v60) != 240) {
      -[MDPathFilter initWithMDPlist:](&v62, v38, v39, v40, v41, v42, v43, v44);
    }
    long long v60 = v62;
    $37FF168C8709F524D812460C59637AB1 reference = v63;
    v5->_rootElement = ($52079F86ABBA964433EE826DA835B8B1 *)arrayObjectToElementRecord((uint64_t)&v60, v38, v39, v40, v41, v42, v43, v44);
    $37FF168C8709F524D812460C59637AB1 reference = 0;
    long long v60 = 0uLL;
    _MDPlistGetRootPlistObjectFromPlist((uint64_t)v5->_plist, v45, v46, v47, v48, v49, (uint64_t)&v60);
    long long v58 = 0uLL;
    $37FF168C8709F524D812460C59637AB1 v59 = 0;
    long long v56 = v60;
    $37FF168C8709F524D812460C59637AB1 v57 = reference;
    if (_MDPlistDictionaryGetPlistObjectForKey((uint64_t)&v56, "IS_DATA_ROSP", 12, (uint64_t)&v58, v50, v51, v52, v53))
    {
      long long v56 = v58;
      $37FF168C8709F524D812460C59637AB1 v57 = v59;
      v5->_isDataROSP = _MDPlistNumberGetIntValue((uint64_t)&v56) != 0;
    }
    commonValues = v5->_commonValues;
    v5->_mountDepth = commonValues->var0;
    v5->_defaultRule = *(unint64_t *)((char *)&commonValues->var3 + 6);
    v5->_inheritMask = *(void *)(&commonValues->var2 + 1);
    v5->_processExtensions = commonValues->var1 != 0;
    v5->_auxValueCount = HIWORD(commonValues->var7);
    v5->_auxValues = (unint64_t *)&commonValues->var8;
  }
  return v5;
}

- (MDPathFilter)initWithData:(id)a3
{
  if ([a3 length])
  {
    v5 = (const void *)_MDPlistContainerCreateWithCopiedBytes(*MEMORY[0x1E4F1CF80], (unsigned __int16 *)[a3 bytes], objc_msgSend(a3, "length"), 1);
    uint64_t v6 = [(MDPathFilter *)self initWithMDPlist:v5];
    if (v5) {
      CFRelease(v5);
    }
    return v6;
  }
  else
  {
    return [(MDPathFilter *)self initWithMDPlist:0];
  }
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  plist = self->_plist;
  if (plist) {
    CFRelease(plist);
  }
  v4.receiver = self;
  v4.super_class = (Class)MDPathFilter;
  [(MDPathFilter *)&v4 dealloc];
}

- (_MDPlistContainer)plist
{
  return self->_plist;
}

- (id)data
{
  plist = self->_plist;
  objc_super v4 = (void *)MEMORY[0x1E4F1C9B8];
  if (plist)
  {
    uint64_t Bytes = _MDPlistContainerGetBytes((uint64_t)plist);
    uint64_t Length = _MDPlistContainerGetLength((uint64_t)self->_plist);
    uint64_t v7 = v4;
    uint64_t v8 = (const char *)Bytes;
  }
  else
  {
    uint64_t v8 = "";
    uint64_t v7 = (void *)MEMORY[0x1E4F1C9B8];
    uint64_t Length = 0;
  }

  return (id)[v7 dataWithBytes:v8 length:Length];
}

- (BOOL)isDataROSP
{
  return self->_isDataROSP;
}

- ($1CD0F41CAFB66BEF540F4446800F077B)filter:(SEL)a3 allowBundleCheck:(const char *)a4
{
  uint64_t v5 = MEMORY[0x1F4188790](retstr, self, a3, a4, a5);
  uint64_t v7 = v6;
  v188 = v5;
  uint64_t v157 = v8;
  uint64_t v218 = *MEMORY[0x1E4F143B8];
  bzero(v215, 0x400uLL);
  uint64_t v9 = 0;
  uint64_t v10 = v7 + 84;
  int v11 = 47;
  do
  {
    if (v11 != v7[v9])
    {
      uint64_t v10 = v7;
      goto LABEL_9;
    }
    int v11 = aVarFoldersZzZy[++v9];
  }
  while (v9 != 84);
  uint64_t v12 = strstr(v7 + 84, "/SMNopCopierSandbox-");
  if (v12)
  {
    uint64_t v13 = v12;
    if ((unint64_t)__strlcpy_chk() <= 0x3FF)
    {
      v215[v13 - v10] = 0;
      uint64_t v10 = v215;
      if (strchr(v13 + 20, 47)) {
        __strlcat_chk();
      }
    }
  }
LABEL_9:
  int v14 = *v10;
  v171 = v10;
  if (v14 == 47) {
    uint64_t j = (uint64_t)(v10 + 1);
  }
  else {
    uint64_t j = (uint64_t)v10;
  }
  bzero(&v198, 0x700uLL);
  result = ($1CD0F41CAFB66BEF540F4446800F077B *)v188[15];
  uint64_t v20 = *(void *)(&result->var7 + 1);
  uint64_t v21 = v20 & 0x7FFFFFFFFFFFFFFFLL;
  uint64_t var1_high = HIWORD(result->var1);
  BOOL v23 = HIWORD(result->var1) != 0;
  int var2 = result->var2;
  int var3 = result->var3;
  if (!*(unsigned char *)j)
  {
    __int16 v29 = 0;
    __int16 v30 = 0;
    uint64_t v31 = 0;
    uint64_t v32 = v157;
    goto LABEL_181;
  }
  uint64_t v26 = 1;
  LODWORD(v198) = 1;
  v199 = (char *)j;
  uint64_t v200 = 0;
  uint64_t v201 = 0;
  uint64_t v202 = v20 & 0x3FFFFFFFFFFFFFFFLL;
  int v203 = var1_high;
  int v204 = var2;
  int v205 = var2;
  uint64_t v27 = (uint64_t)v10;
  if (v14 == 47)
  {
    if (v10[1] && (int v28 = *(_DWORD *)((char *)&result->var0 + 6)) != 0)
    {
      int v206 = 3;
      int v207 = v28;
      v208 = (unsigned __int8 *)(v10 + 1);
      uint64_t v209 = 0;
      uint64_t v210 = 0;
      uint64_t v211 = v21;
      int v212 = var1_high;
      int v213 = var2;
      uint64_t v26 = 2;
      int v214 = var3;
    }
    else
    {
      uint64_t v26 = 1;
    }
  }
  if (*((unsigned char *)v188 + 152))
  {
    uint64_t v33 = v26;
    uint64_t v34 = result;
    uint64_t v35 = v21;
    int v36 = var3;
    int v37 = var2;
    uint64_t v38 = var1_high;
    memset(__s, 0, sizeof(__s));
    uint64_t v217 = 0;
    long long v196 = *(_OWORD *)(v188 + 9);
    uint64_t v197 = v188[11];
    if (_MDPlistDictionaryGetPlistObjectForKey((uint64_t)&v196, ".*", -1, (uint64_t)__s, v26, v16, v17, v18))
    {
      long long v196 = *(_OWORD *)__s;
      uint64_t v197 = v217;
      if (_MDPlistGetPlistObjectType((uint64_t)&v196) != 226)
      {
        long long v196 = *(_OWORD *)__s;
        uint64_t v197 = v217;
        if (_MDPlistGetPlistObjectType((uint64_t)&v196) != 35)
        {
          long long v196 = *(_OWORD *)__s;
          uint64_t v197 = v217;
          if (_MDPlistGetPlistObjectType((uint64_t)&v196) != 227)
          {
            long long v196 = *(_OWORD *)__s;
            uint64_t v197 = v217;
            if (_MDPlistGetPlistObjectType((uint64_t)&v196) != 51) {
              -[MDPathFilter filter:allowBundleCheck:].cold.5();
            }
          }
        }
      }
      long long v196 = *(_OWORD *)__s;
      uint64_t v197 = v217;
      uint64_t IntValue = _MDPlistNumberGetIntValue((uint64_t)&v196);
      *((_DWORD *)v188 + 42) = BYTE2(IntValue);
      *((_DWORD *)v188 + 43) = (unsigned __int16)IntValue;
    }
    long long v196 = *(_OWORD *)(v188 + 9);
    uint64_t v197 = v188[11];
    if (_MDPlistDictionaryGetPlistObjectForKey((uint64_t)&v196, "icloud", -1, (uint64_t)__s, v39, v40, v41, v42))
    {
      long long v196 = *(_OWORD *)__s;
      uint64_t v197 = v217;
      if (_MDPlistGetPlistObjectType((uint64_t)&v196) != 226)
      {
        long long v196 = *(_OWORD *)__s;
        uint64_t v197 = v217;
        if (_MDPlistGetPlistObjectType((uint64_t)&v196) != 35)
        {
          long long v196 = *(_OWORD *)__s;
          uint64_t v197 = v217;
          if (_MDPlistGetPlistObjectType((uint64_t)&v196) != 227)
          {
            long long v196 = *(_OWORD *)__s;
            uint64_t v197 = v217;
            if (_MDPlistGetPlistObjectType((uint64_t)&v196) != 51) {
              -[MDPathFilter filter:allowBundleCheck:].cold.4();
            }
          }
        }
      }
      long long v196 = *(_OWORD *)__s;
      uint64_t v197 = v217;
      uint64_t v44 = _MDPlistNumberGetIntValue((uint64_t)&v196);
      *((_DWORD *)v188 + 44) = BYTE2(v44);
      *((_DWORD *)v188 + 45) = (unsigned __int16)v44;
    }
    uint64_t var1_high = v38;
    int var2 = v37;
    int var3 = v36;
    uint64_t v21 = v35;
    result = v34;
    uint64_t v26 = v33;
    uint64_t v27 = (uint64_t)v10;
  }
  char v156 = 0;
  int v45 = 0;
  int v177 = 0;
  int v178 = 0;
  v159 = (long long *)(v188 + 9);
  v160 = (long long *)(v188 + 3);
  uint64_t v161 = -v27;
  while (2)
  {
    BOOL v170 = v23;
    int v172 = 0;
    uint64_t v46 = v26;
LABEL_35:
    uint64_t v47 = (char *)j;
LABEL_36:
    int v158 = v45;
    uint64_t v48 = 0;
    uint64_t v49 = 0;
    int v50 = 0;
    uint64_t v180 = -j;
    uint64_t v26 = v46;
    uint64_t v51 = v47;
    while (2)
    {
      for (uint64_t i = 0; ; ++i)
      {
        uint64_t v53 = &v51[i];
        int v54 = v51[i];
        if (v54 != 46) {
          break;
        }
        if ((unint64_t)v53 > v27) {
          v50 |= v51[i - 1] == 47;
        }
        uint64_t v49 = v48;
LABEL_45:
        uint64_t v48 = v53;
      }
      if (v51[i] && v54 != 47)
      {
        uint64_t v53 = v48;
        goto LABEL_45;
      }
      v55 = &v51[i];
      int v181 = v50;
      if (v48 && *((unsigned char *)v188 + 152))
      {
        if (v49 && j - v27 >= 21)
        {
          uint64_t v56 = 0;
          int v57 = 47;
          while (v57 == *(unsigned __int8 *)(j + v56 - 20))
          {
            int v57 = aLibraryContain[++v56];
            if (v56 == 20) {
              goto LABEL_53;
            }
          }
        }
        long long v58 = &v51[i];
        unint64_t v59 = (unint64_t)v48;
        if (v49)
        {
          int v60 = 115;
          uint64_t v61 = 1u;
          do
          {
            if (v60 != v48[v61])
            {
              long long v58 = &v51[i];
              unint64_t v59 = (unint64_t)v48;
              goto LABEL_65;
            }
            int v60 = aSb[v61++];
          }
          while (v61 != 4);
          uint64_t v62 = v48 - v51 + 19;
          if (v62 == i) {
            long long v58 = v48;
          }
          else {
            long long v58 = &v51[i];
          }
          if (v62 == i) {
            unint64_t v59 = (unint64_t)v49;
          }
          else {
            unint64_t v59 = (unint64_t)v48;
          }
        }
LABEL_65:
        v173 = result;
        v175 = v49;
        uint64_t v63 = v26;
        uint64_t v167 = v21;
        int v182 = var3;
        int v185 = var2;
        unsigned int v162 = var1_high;
        uint64_t v64 = __s;
        bzero(__s, 0x400uLL);
        $37FF168C8709F524D812460C59637AB1 v66 = (char *)(v59 + 1);
        if ((char *)(v59 + 1) != v58)
        {
          uint64_t v64 = __s;
          do
          {
            __darwin_ct_rune_t v67 = *v66++;
            *v64++ = __tolower(v67);
          }
          while (v66 != v58);
        }
        *uint64_t v64 = 0;
        long long v196 = 0uLL;
        uint64_t v197 = 0;
        int v50 = v181;
        uint64_t v165 = v63;
        if (v181)
        {
          if (v59 == j
            && (long long v194 = *((_OWORD *)v188 + 6),
                uint64_t v195 = v188[14],
                _MDPlistDictionaryGetPlistObjectForKey((uint64_t)&v194, __s, (uint64_t)&v58[~j], (uint64_t)&v196, v65, v16, v17, v18)))
          {
            long long v194 = v196;
            uint64_t v195 = v197;
            uint64_t v74 = _MDPlistNumberGetIntValue((uint64_t)&v194);
            char v68 = BYTE2(v74);
            int v72 = (unsigned __int16)v74;
            if ((_WORD)v74)
            {
              LOBYTE(v179) = BYTE2(v74);
              uint64_t v27 = (uint64_t)v171;
              uint64_t v26 = v165;
              goto LABEL_92;
            }
          }
          else
          {
            char v68 = 0;
          }
          long long v194 = *v159;
          uint64_t v195 = v188[11];
          if (_MDPlistDictionaryGetPlistObjectForKey((uint64_t)&v194, __s, (uint64_t)&v58[~v59], (uint64_t)&v196, v65, v16, v17, v18))
          {
            long long v194 = v196;
            uint64_t v195 = v197;
            uint64_t v71 = _MDPlistNumberGetIntValue((uint64_t)&v194);
            LOBYTE(v179) = BYTE2(v71);
            int v72 = (unsigned __int16)v71;
          }
          else
          {
            LOBYTE(v179) = v68;
            int v72 = 0;
          }
          uint64_t v27 = (uint64_t)v171;
          uint64_t v26 = v165;
          if (v72 != *((_DWORD *)v188 + 45) && *((_DWORD *)v188 + 43))
          {
            int v179 = *((_DWORD *)v188 + 42);
            int v72 = *((_DWORD *)v188 + 43);
            uint64_t v49 = v175;
            goto LABEL_91;
          }
LABEL_83:
          if (!v72) {
            goto LABEL_84;
          }
LABEL_92:
          long long v194 = 0uLL;
          uint64_t v195 = 0;
          long long v192 = *v160;
          uint64_t v193 = v188[5];
          uint64_t v78 = v26;
          _MDPlistArrayGetPlistObjectAtIndex((uint64_t)&v192, (v72 - 1), v69, v70, v26, v16, v17, v18, &v194);
          long long v192 = v194;
          uint64_t v193 = v195;
          int v79 = _MDPlistPlistObjectToEmbeddedReference((uint64_t)&v192);
          uint64_t v26 = v78;
          int v164 = v79;
          uint64_t v49 = v175;
        }
        else
        {
          long long v194 = *v159;
          uint64_t v195 = v188[11];
          if (_MDPlistDictionaryGetPlistObjectForKey((uint64_t)&v194, __s, (uint64_t)&v58[~v59], (uint64_t)&v196, v65, v16, v17, v18))
          {
            long long v194 = v196;
            uint64_t v195 = v197;
            uint64_t v73 = _MDPlistNumberGetIntValue((uint64_t)&v194);
            uint64_t v26 = v63;
            LOBYTE(v179) = BYTE2(v73);
            int v72 = (unsigned __int16)v73;
            uint64_t v27 = (uint64_t)v171;
            goto LABEL_83;
          }
          LOBYTE(v179) = 0;
          uint64_t v27 = (uint64_t)v171;
LABEL_84:
          if (v59 == j)
          {
            v76 = __s;
          }
          else
          {
            uint64_t v75 = 0;
            do
            {
              __s[v75] = __tolower(*(char *)(j + v75));
              ++v75;
            }
            while (j + v75 != v59);
            v76 = &__s[v75];
            int v50 = v181;
          }
          char *v76 = 0;
          long long v194 = *((_OWORD *)v188 + 3);
          uint64_t v195 = v188[8];
          uint64_t v49 = v175;
          if (_MDPlistDictionaryGetPlistObjectForKey((uint64_t)&v194, __s, v59 - j, (uint64_t)&v196, v26, v16, v17, v18))
          {
            long long v194 = v196;
            uint64_t v195 = v197;
            uint64_t v77 = _MDPlistNumberGetIntValue((uint64_t)&v194);
            LOBYTE(v179) = BYTE2(v77);
            int v72 = (unsigned __int16)v77;
            uint64_t v26 = v165;
LABEL_91:
            if (v72 >= 1) {
              goto LABEL_92;
            }
            int v164 = 0;
          }
          else
          {
            int v164 = 0;
            uint64_t v26 = v165;
          }
        }
        uint64_t var1_high = v162;
        int var3 = v182;
        int var2 = v185;
        uint64_t v21 = v167;
        result = v173;
        v55 = &v51[i];
      }
      else
      {
LABEL_53:
        int v164 = 0;
        LOBYTE(v179) = 0;
      }
      int v80 = 0;
      if (result && v55 != (char *)j)
      {
        memset(__s, 0, sizeof(__s));
        uint64_t v217 = 0;
        uint64_t v81 = *(unsigned int *)((char *)&result->var0 + 2);
        if (v81)
        {
          uint64_t v166 = v26;
          uint64_t v168 = v21;
          int v183 = var3;
          int v186 = var2;
          uint64_t v82 = var1_high;
          v83 = v55;
          uint64_t v84 = (uint64_t)&v55[v180];
          _MDPlistEmbeddedReferenceToPlistObject(v188[1], v81, 241, (uint64_t)v55, v26, v16, v17, v18, &v191);
          if (_MDPlistDictionaryGetPlistObjectForKey((uint64_t)&v191, (char *)j, v84, (uint64_t)__s, v85, v86, v87, v88))
          {
            long long v196 = *(_OWORD *)__s;
            uint64_t v197 = v217;
            if (_MDPlistGetPlistObjectType((uint64_t)&v196) != 240) {
              -[MDPathFilter filter:allowBundleCheck:]((long long *)__s, v89, v90, v91, v92, v93, v94, v95);
            }
            long long v196 = *(_OWORD *)__s;
            uint64_t v197 = v217;
            result = ($1CD0F41CAFB66BEF540F4446800F077B *)arrayObjectToElementRecord((uint64_t)&v196, v89, v90, v91, v92, v93, v94, v95);
            int v80 = 1;
            uint64_t v27 = (uint64_t)v171;
            uint64_t var1_high = v82;
            int var3 = v183;
            int var2 = v186;
          }
          else
          {
            int v80 = 0;
            int var3 = 0;
            int var2 = 0;
            BOOL v170 = 0;
            result = 0;
            uint64_t v27 = (uint64_t)v171;
            uint64_t var1_high = v82;
          }
          uint64_t v26 = v166;
          uint64_t v21 = v168;
          int v50 = v181;
          v55 = v83;
        }
        else
        {
          int v80 = 0;
          int var3 = 0;
          int var2 = 0;
          BOOL v170 = 0;
          result = 0;
        }
      }
      int v163 = v80;
      if (v55 == (char *)j) {
        int v80 = 1;
      }
      uint64_t v96 = v21 & 0x3FFFFFFFFFFFFFFFLL;
      if (v80) {
        uint64_t v96 = v21;
      }
      if (!result)
      {
        uint64_t v21 = v96;
        break;
      }
      BOOL v170 = HIWORD(result->var1) != 0;
      if (HIWORD(result->var1)) {
        uint64_t var1_high = HIWORD(result->var1);
      }
      else {
        uint64_t var1_high = var1_high;
      }
      int var2 = result->var2;
      int var3 = result->var3;
      uint64_t v97 = *(void *)(&result->var7 + 1);
      uint64_t v21 = (*(void *)&result->var4 & 0x1FFFFFFFFFFFFFFFLL ^ 0x3FFFFFFFFFFFFFFFLL) & v96 | v97;
      uint64_t v98 = v188[2];
      uint64_t v99 = *(void *)(v98 + 30);
      BOOL v100 = (v21 & v99) != 0 && (v99 & v96) == 0;
      uint64_t v101 = *(void *)(v98 + 38);
      BOOL v102 = (v101 & v21) == 0;
      BOOL v145 = !v100 || !v102;
      int v103 = v177;
      if (!v145) {
        int v103 = v161 + v51 + i;
      }
      int v104 = v178;
      int v105 = (v101 & v96) != 0 && v102;
      if (v105) {
        int v106 = 0;
      }
      else {
        int v106 = v103;
      }
      if ((v105 & ((unsigned __int16)v178 == 0)) != 0) {
        int v104 = v103;
      }
      int v177 = v106;
      int v178 = v104;
      uint64_t v107 = *(unint64_t *)((char *)&result[1].var0 + 4);
      if (v107)
      {
        if (*v55)
        {
          uint64_t v108 = *(unint64_t *)((char *)&result[1].var1 + 4);
          uint64_t v21 = v108 | (v107 & 0x1FFFFFFFFFFFFFFFLL ^ 0x3FFFFFFFFFFFFFFFLL) & v21;
          if (v108 < 0)
          {
            if (v54) {
              int v109 = 0;
            }
            else {
              int v109 = result->var2;
            }
            if (v54) {
              int v110 = 0;
            }
            else {
              int v110 = result->var3;
            }
            uint64_t v198 = 1;
            uint64_t v200 = 0;
            uint64_t v201 = 0;
            v199 = v55;
            uint64_t v202 = v21;
            int v203 = var1_high;
            int v204 = v109;
            int v205 = v110;
            uint64_t v26 = 1;
            if ((*(void *)(&result->var7 + 1) & 0x8000000000000000) == 0) {
              goto LABEL_134;
            }
LABEL_125:
            if (v54)
            {
              uint64_t v198 = 1;
              uint64_t v200 = 0;
              uint64_t v201 = 0;
              v199 = v55;
              uint64_t v202 = v21;
              int v205 = 0;
              uint64_t v26 = 1;
              int v203 = var1_high;
              int v204 = 0;
              goto LABEL_134;
            }
LABEL_177:
            LOBYTE(v23) = v170;
            goto LABEL_178;
          }
        }
      }
      if (v97 < 0) {
        goto LABEL_125;
      }
LABEL_134:
      if (LOWORD(result->var0))
      {
        v111 = v55;
        v174 = result;
        v176 = v49;
        int v112 = v26;
        v169 = (char *)j;
        uint64_t v113 = v21;
        int v184 = var3;
        int v187 = var2;
        uint64_t v114 = var1_high;
        memset(__s, 0, sizeof(__s));
        uint64_t v217 = 0;
        uint64_t v115 = LOWORD(result->var0) - 1;
        long long v196 = *v160;
        uint64_t v197 = v188[5];
        _MDPlistArrayGetPlistObjectAtIndex((uint64_t)&v196, v115, (uint64_t)"/Library/Containers/", (uint64_t)v55, v26, v16, v17, v18, (long long *)__s);
        long long v196 = *(_OWORD *)__s;
        uint64_t v197 = v217;
        if (_MDPlistGetPlistObjectType((uint64_t)&v196) != 240) {
          -[MDPathFilter filter:allowBundleCheck:]((long long *)__s, v116, v117, v118, v119, v120, v121, v122);
        }
        v123 = &v198 + 7 * v112;
        long long v196 = *(_OWORD *)__s;
        uint64_t v197 = v217;
        int v124 = _MDPlistPlistObjectToEmbeddedReference((uint64_t)&v196);
        *(_DWORD *)v123 = 2;
        *((_DWORD *)v123 + 1) = v124;
        v55 = v111;
        v123[1] = (uint64_t)v111;
        v123[2] = 0;
        v123[3] = 0;
        v123[4] = v113;
        uint64_t v21 = v113;
        uint64_t var1_high = v114;
        int var3 = v184;
        int var2 = v187;
        *((_DWORD *)v123 + 10) = v114;
        *((_DWORD *)v123 + 11) = v187;
        uint64_t v26 = (v112 + 1);
        *((_DWORD *)v123 + 12) = v184;
        uint64_t j = (uint64_t)v169;
        result = v174;
        uint64_t v49 = v176;
        uint64_t v27 = (uint64_t)v171;
        int v50 = v181;
      }
      if (v54 == 47)
      {
        int v125 = *(_DWORD *)((char *)&result->var1 + 2);
        if (v125 | v172 && (v179 & 2) == 0)
        {
          if (!v125) {
            int v125 = v172;
          }
          v126 = &v198 + 7 * (int)v26;
          *(_DWORD *)v126 = 4;
          *((_DWORD *)v126 + 1) = v125;
          v126[1] = (uint64_t)&v51[i + 1];
          v126[2] = 0;
          v126[3] = 0;
          v126[4] = v21;
          *((_DWORD *)v126 + 10) = var1_high;
          *((_DWORD *)v126 + 11) = var2;
          *((_DWORD *)v126 + 12) = var3;
          uint64_t v26 = (v26 + 1);
        }
        int v127 = *(_DWORD *)((char *)&result->var0 + 6);
        if (v127 && (v179 & 2) == 0)
        {
          v128 = &v198 + 7 * (int)v26;
          *(_DWORD *)v128 = 3;
          *((_DWORD *)v128 + 1) = v127;
          v128[1] = (uint64_t)&v51[i + 1];
          v128[2] = 0;
          v128[3] = 0;
          v128[4] = v21;
          *((_DWORD *)v128 + 10) = var1_high;
          *((_DWORD *)v128 + 11) = var2;
          *((_DWORD *)v128 + 12) = var3;
          uint64_t v26 = (v26 + 1);
        }
        if (v55 == (char *)j)
        {
          ++j;
          --v180;
          uint64_t v51 = (char *)j;
          continue;
        }
      }
      break;
    }
    uint64_t v47 = &v51[i];
    if (v164)
    {
      int v158 = 0;
      v129 = &v198 + 7 * (int)v26;
      *(_DWORD *)v129 = 2;
      *((_DWORD *)v129 + 1) = v164;
      v129[1] = (uint64_t)v47;
      v129[2] = 0;
      v129[3] = 0;
      v129[4] = v21 | 0x2000000000000000;
      *((_DWORD *)v129 + 10) = var1_high;
      *((_DWORD *)v129 + 11) = var2;
      *((_DWORD *)v129 + 12) = var3;
      uint64_t v26 = (v26 + 1);
    }
    if ((int)v26 >= 32) {
      -[MDPathFilter filter:allowBundleCheck:]();
    }
    int v45 = v158;
    if (((v54 == 0) & v158) != 0) {
      goto LABEL_177;
    }
    if ((v163 | v158))
    {
      if (v54 == 47) {
        v154 = v51 + 1;
      }
      else {
        v154 = v51;
      }
      uint64_t j = (uint64_t)&v154[i];
      v156 |= v54 == 0;
      BOOL v23 = v170;
      continue;
    }
    break;
  }
  uint64_t v46 = (int)v26 - 1;
  v130 = &v198 + 7 * v46;
  int v131 = *(_DWORD *)v130;
  if ((*(_DWORD *)v130 - 3) < 2)
  {
    v136 = &v198 + 7 * v46;
    _MDPlistEmbeddedReferenceToPlistObject(v188[1], *((unsigned int *)v136 + 1), 240, (uint64_t)v55, v26, v16, v17, v18, &v189);
    result = ($1CD0F41CAFB66BEF540F4446800F077B *)arrayObjectToElementRecord((uint64_t)&v189, v137, v138, v139, v140, v141, v142, v143);
    for (uint64_t j = v136[1]; *(unsigned char *)j && *(unsigned char *)j != 47; ++j)
      ;
    int v172 = 0;
    int v45 = 0;
    v144 = &v198 + 7 * v46;
    uint64_t v21 = v144[4];
    uint64_t var1_high = *((unsigned int *)v144 + 10);
    int var2 = *((_DWORD *)v144 + 11);
    int var3 = *((_DWORD *)v144 + 12);
    if (*(unsigned char *)j) {
      BOOL v145 = *(_DWORD *)v130 == 4;
    }
    else {
      BOOL v145 = 0;
    }
    uint64_t v47 = (char *)j;
    uint64_t v27 = (uint64_t)v171;
    if (v145)
    {
      int v45 = 0;
      int v172 = *(_DWORD *)((unint64_t)v136 | 4);
      goto LABEL_35;
    }
    goto LABEL_36;
  }
  if (v131 == 2)
  {
    v146 = &v198 + 7 * v46;
    _MDPlistEmbeddedReferenceToPlistObject(v188[1], *((unsigned int *)v146 + 1), 240, (uint64_t)v55, v26, v16, v17, v18, &v190);
    result = ($1CD0F41CAFB66BEF540F4446800F077B *)arrayObjectToElementRecord((uint64_t)&v190, v147, v148, v149, v150, v151, v152, v153);
    int v172 = 0;
    int v45 = 0;
    uint64_t j = v146[1];
    uint64_t v21 = v146[4];
    uint64_t var1_high = *((unsigned int *)v146 + 10);
    int var2 = *((_DWORD *)v146 + 11);
    int var3 = *((_DWORD *)v146 + 12);
    uint64_t v47 = (char *)j;
    uint64_t v27 = (uint64_t)v171;
    goto LABEL_36;
  }
  uint64_t v27 = (uint64_t)v171;
  if (v131 == 1)
  {
    v132 = &v198 + 7 * v46;
    uint64_t v134 = v132[4];
    v133 = v132 + 4;
    uint64_t v21 = v134;
    uint64_t var1_high = *((unsigned int *)v133 + 2);
    if (v54 == 47 && *((unsigned char *)v188 + 152))
    {
      int v172 = 0;
      int var3 = 0;
      int var2 = 0;
      BOOL v170 = 0;
      result = 0;
      uint64_t *v133 = (v188[18] | 0x2000000000000000) & v21;
      v135 = &v198 + 7 * v46;
      *((_DWORD *)v135 + 11) = 0;
      *((_DWORD *)v135 + 12) = 0;
      int v45 = 1;
      uint64_t v46 = v26;
      goto LABEL_36;
    }
    LOBYTE(v23) = 0;
LABEL_178:
    uint64_t v31 = 0x4000000000000000;
    if ((v156 & 1) == 0) {
      uint64_t v31 = 0;
    }
    uint64_t v32 = v157;
    __int16 v29 = v177;
    __int16 v30 = v178;
LABEL_181:
    *(void *)uint64_t v32 = v31 | v21;
    if ((int)var1_high < 1) {
      uint64_t v155 = 0;
    }
    else {
      uint64_t v155 = *(void *)(v188[20] + 8 * (var1_high - 1));
    }
    *(void *)(v32 + 8) = v155;
    *(_WORD *)(v32 + 16) = var1_high;
    *(_WORD *)(v32 + 18) = v23;
    *(_WORD *)(v32 + 20) = var2;
    *(_WORD *)(v32 + 22) = var3;
    *(_WORD *)(v32 + 24) = v29;
    *(_WORD *)(v32 + 26) = v30;
  }
  else
  {
    result = ($1CD0F41CAFB66BEF540F4446800F077B *)CFLog();
    __break(1u);
  }
  return result;
}

- ($1CD0F41CAFB66BEF540F4446800F077B)iCloudPath:(SEL)a3 updateFilter:(const char *)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (iCloudPath_updateFilter__gSetupCache != -1) {
    dispatch_once(&iCloudPath_updateFilter__gSetupCache, &__block_literal_global_7);
  }
  result = ($1CD0F41CAFB66BEF540F4446800F077B *)[NSString stringWithUTF8String:a4];
  if (!result) {
    goto LABEL_10;
  }
  result = ($1CD0F41CAFB66BEF540F4446800F077B *)[($1CD0F41CAFB66BEF540F4446800F077B *)result pathComponents];
  if (!result) {
    goto LABEL_10;
  }
  uint64_t v9 = result;
  result = ($1CD0F41CAFB66BEF540F4446800F077B *)[($1CD0F41CAFB66BEF540F4446800F077B *)result indexOfObject:@"Mobile Documents"];
  if ((unint64_t)result < 4 || result == ($1CD0F41CAFB66BEF540F4446800F077B *)0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_10;
  }
  int v11 = result;
  result = ($1CD0F41CAFB66BEF540F4446800F077B *)[($1CD0F41CAFB66BEF540F4446800F077B *)v9 count];
  uint64_t v12 = (char *)&v11->var0 + 1;
  if (result <= ($1CD0F41CAFB66BEF540F4446800F077B *)((char *)&v11->var0 + 1)) {
    goto LABEL_10;
  }
  result = ($1CD0F41CAFB66BEF540F4446800F077B *)objc_msgSend((id)-[$1CD0F41CAFB66BEF540F4446800F077B objectAtIndexedSubscript:](v9, "objectAtIndexedSubscript:", (char *)&v11[-1].var7 + 5), "isEqualToString:", @"Library");
  if (!result) {
    goto LABEL_10;
  }
  uint64_t v13 = objc_msgSend(NSString, "pathWithComponents:", -[$1CD0F41CAFB66BEF540F4446800F077B subarrayWithRange:](v9, "subarrayWithRange:", 0, v11));
  int v14 = (void *)[($1CD0F41CAFB66BEF540F4446800F077B *)v9 objectAtIndexedSubscript:v12];
  pthread_mutex_lock(&iCloudPath_updateFilter__gComponentIsPublicCacheLock);
  uint64_t v15 = [(id)iCloudPath_updateFilter__gPerUserCacheMapping objectForKeyedSubscript:v13];
  if (v15)
  {
    uint64_t v16 = (void *)v15;
    uid_t st_uid = 0;
  }
  else
  {
    memset(&__str, 0, sizeof(__str));
    if (stat((const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileSystemRepresentationWithPath:", v13), &__str))
    {
      result = ($1CD0F41CAFB66BEF540F4446800F077B *)pthread_mutex_unlock(&iCloudPath_updateFilter__gComponentIsPublicCacheLock);
      goto LABEL_10;
    }
    uint64_t v16 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    [(id)iCloudPath_updateFilter__gPerUserCacheMapping setObject:v16 forKeyedSubscript:v13];
    uid_t st_uid = __str.st_uid;
    if (!v16)
    {
      char v19 = 0;
      uint64_t v18 = 0;
      goto LABEL_16;
    }
  }
  uint64_t v18 = (void *)[v16 objectForKeyedSubscript:v14];
  char v19 = 1;
LABEL_16:
  result = ($1CD0F41CAFB66BEF540F4446800F077B *)pthread_mutex_unlock(&iCloudPath_updateFilter__gComponentIsPublicCacheLock);
  if (st_uid)
  {
    int out_token = 0;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v31 = 0u;
    memset(&__str, 0, sizeof(__str));
    snprintf((char *)&__str, 0x100uLL, "user.uid.%d.BRContainerCacheDidChangeDistributedNotification", st_uid);
    global_queue = dispatch_get_global_queue(2, 0);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __40__MDPathFilter_iCloudPath_updateFilter___block_invoke_2;
    handler[3] = &unk_1E5AEEA40;
    handler[4] = v16;
    result = ($1CD0F41CAFB66BEF540F4446800F077B *)notify_register_dispatch((const char *)&__str, &out_token, global_queue, handler);
  }
  char v21 = v19 ^ 1;
  if (v18) {
    char v21 = 1;
  }
  if (v21)
  {
    if (!v18) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v22 = [v14 stringByReplacingOccurrencesOfString:@"~" withString:@"."];
    uint64_t v23 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v13, "stringByAppendingPathComponent:", @"Application Support"), "stringByAppendingPathComponent:", @"CloudDocs"), "stringByAppendingPathComponent:", @"session"), "stringByAppendingPathComponent:", @"containers"), "stringByAppendingPathComponent:", v22), "stringByAppendingPathExtension:", @"plist");
    result = ($1CD0F41CAFB66BEF540F4446800F077B *)[MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v23];
    if (!result) {
      goto LABEL_10;
    }
    result = ($1CD0F41CAFB66BEF540F4446800F077B *)[MEMORY[0x1E4F28F98] propertyListWithData:result options:0 format:0 error:0];
    if (!result) {
      goto LABEL_10;
    }
    uint64_t v24 = result;
    objc_opt_class();
    result = ($1CD0F41CAFB66BEF540F4446800F077B *)objc_opt_isKindOfClass();
    if ((result & 1) == 0) {
      goto LABEL_10;
    }
    result = ($1CD0F41CAFB66BEF540F4446800F077B *)[($1CD0F41CAFB66BEF540F4446800F077B *)v24 objectForKeyedSubscript:v22];
    if (!result) {
      goto LABEL_10;
    }
    uint64_t v25 = result;
    objc_opt_class();
    result = ($1CD0F41CAFB66BEF540F4446800F077B *)objc_opt_isKindOfClass();
    if ((result & 1) == 0) {
      goto LABEL_10;
    }
    uint64_t v26 = [($1CD0F41CAFB66BEF540F4446800F077B *)v25 objectForKeyedSubscript:@"BRContainerIsDocumentScopePublic"];
    uint64_t v18 = &unk_1EF689E88;
    if (v26)
    {
      uint64_t v27 = (void *)v26;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v18 = v27;
      }
    }
    pthread_mutex_lock(&iCloudPath_updateFilter__gComponentIsPublicCacheLock);
    [v16 setObject:v18 forKeyedSubscript:v14];
    pthread_mutex_unlock(&iCloudPath_updateFilter__gComponentIsPublicCacheLock);
  }
  result = ($1CD0F41CAFB66BEF540F4446800F077B *)[v18 BOOLValue];
  if ((result & 1) == 0) {
    a5->var0 = a5->var0 & 0xFFFFFFFFFFFFFFE7 | 8;
  }
LABEL_10:
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&a5->var0;
  *(_OWORD *)((char *)&retstr->var1 + 4) = *(_OWORD *)((char *)&a5->var1 + 4);
  return result;
}

id __40__MDPathFilter_iCloudPath_updateFilter___block_invoke()
{
  id result = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  iCloudPath_updateFilter__gPerUserCacheMapping = (uint64_t)result;
  return result;
}

uint64_t __40__MDPathFilter_iCloudPath_updateFilter___block_invoke_2(uint64_t a1)
{
  pthread_mutex_lock(&iCloudPath_updateFilter__gComponentIsPublicCacheLock);
  [*(id *)(a1 + 32) removeAllObjects];

  return pthread_mutex_unlock(&iCloudPath_updateFilter__gComponentIsPublicCacheLock);
}

- ($1CD0F41CAFB66BEF540F4446800F077B)filterPartialPath:(SEL)a3
{
  if (self->var1)
  {
    objc_super v4 = a4;
    uint64_t v5 = self;
    if (!strcmp(a4, "."))
    {
      objc_super v4 = "/";
    }
    else if (*v4 == 46 && v4[1] == 47)
    {
      ++v4;
    }
    return ($1CD0F41CAFB66BEF540F4446800F077B *)[($1CD0F41CAFB66BEF540F4446800F077B *)v5 filter:v4 allowBundleCheck:0];
  }
  else
  {
    retstr->var0 = 0;
    retstr->var1 = 0;
    *(_DWORD *)&retstr->var6 = 0;
    *(void *)&retstr->int var2 = 0;
  }
  return self;
}

- ($1CD0F41CAFB66BEF540F4446800F077B)filterFullPath:(SEL)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!self->var1)
  {
    retstr->var0 = 0;
    retstr->unint64_t var1 = 0;
    *(_DWORD *)&retstr->var6 = 0;
    *(void *)&retstr->int var2 = 0;
    return self;
  }
  uint64_t v6 = self;
  unint64_t var1 = self[4].var1;
  retstr->unint64_t var1 = 0;
  *(void *)&retstr->int var2 = 0;
  retstr->var0 = var1;
  *(_DWORD *)&retstr->var6 = 0;
  int var0_low = LOWORD(self[4].var0);
  if (!LOBYTE(self[5].var6))
  {
    uint64_t v9 = a4;
    if (LOWORD(self[4].var0)) {
      goto LABEL_28;
    }
LABEL_12:
    uint64_t v9 = a4;
    goto LABEL_33;
  }
  if (!LOWORD(self[4].var0)) {
    goto LABEL_12;
  }
  if (var0_low == 2)
  {
    uint64_t v12 = 0;
    uint64_t v13 = a4 + 20;
    int v14 = 47;
    while (v14 == a4[v12])
    {
      int v14 = aSystemVolumesD[++v12];
      if (v12 == 20) {
        goto LABEL_22;
      }
    }
    uint64_t v13 = 0;
LABEL_22:
    if (v13) {
      uint64_t v9 = v13;
    }
    else {
      uint64_t v9 = a4;
    }
    int var0_low = 2;
  }
  else
  {
    uint64_t v9 = a4;
    if (var0_low == 3)
    {
      uint64_t v10 = 0;
      int v11 = 47;
      while (v11 == a4[v10])
      {
        int v11 = aSystemVolumesD[++v10];
        if (v10 == 20)
        {
LABEL_20:
          int var0_low = 3;
          goto LABEL_27;
        }
      }
      uint64_t v15 = 0;
      int v16 = 47;
      while (v16 == a4[v15])
      {
        int v16 = aSystemVolumesP[++v15];
        if (v15 == 23) {
          goto LABEL_20;
        }
      }
      int var0_low = 1;
LABEL_27:
      uint64_t v9 = a4;
    }
  }
LABEL_28:
  if (*v9 != 47)
  {
LABEL_32:
    if (!v6)
    {
LABEL_36:
      memset(v22, 0, 28);
      char v18 = 1;
      goto LABEL_37;
    }
LABEL_33:
    self = ($1CD0F41CAFB66BEF540F4446800F077B *)[($1CD0F41CAFB66BEF540F4446800F077B *)v6 filter:v9 allowBundleCheck:0];
    char v18 = 0;
LABEL_37:
    *(_OWORD *)&retstr->var0 = v22[0];
    *(_OWORD *)((char *)&retstr->var1 + 4) = *(_OWORD *)((char *)v22 + 12);
    __int16 v19 = (_WORD)v9 - (_WORD)a4;
    if (retstr->var6) {
      __int16 v20 = (_WORD)v9 - (_WORD)a4;
    }
    else {
      __int16 v20 = 0;
    }
    retstr->var6 += v20;
    if (!retstr->var7) {
      __int16 v19 = 0;
    }
    retstr->var7 += v19;
    if ((retstr->var0 & 0x2000000000) != 0)
    {
      if (v18)
      {
        memset(v22, 0, 28);
      }
      else
      {
        v21[0] = *(_OWORD *)&retstr->var0;
        *(_OWORD *)((char *)v21 + 12) = *(_OWORD *)((char *)&retstr->var1 + 4);
        self = ($1CD0F41CAFB66BEF540F4446800F077B *)[($1CD0F41CAFB66BEF540F4446800F077B *)v6 iCloudPath:a4 updateFilter:v21];
      }
      *(_OWORD *)&retstr->var0 = v22[0];
      *(_OWORD *)((char *)&retstr->var1 + 4) = *(_OWORD *)((char *)v22 + 12);
    }
    return self;
  }
  int v17 = var0_low + 1;
  while (1)
  {
    self = ($1CD0F41CAFB66BEF540F4446800F077B *)strchr((char *)v9 + 1, 47);
    if (!self) {
      break;
    }
    uint64_t v9 = (const char *)self;
    if (--v17 <= 1) {
      goto LABEL_32;
    }
  }
  if (v17 == 2)
  {
    uint64_t v9 = "/";
    if (!v6) {
      goto LABEL_36;
    }
    goto LABEL_33;
  }
  return self;
}

- ($1CD0F41CAFB66BEF540F4446800F077B)filterFullPathTestBundle:(SEL)a3
{
  if (self->var1)
  {
    __int16 v5 = (__int16)a4;
    uint64_t v6 = self;
    unint64_t var1 = self[4].var1;
    retstr->unint64_t var1 = 0;
    *(void *)&retstr->int var2 = 0;
    retstr->var0 = var1;
    *(_DWORD *)&retstr->var6 = 0;
    if (LOWORD(self[4].var0) && *a4 == 47)
    {
      int v8 = LOWORD(self[4].var0) + 1;
      uint64_t v9 = a4;
      while (1)
      {
        self = ($1CD0F41CAFB66BEF540F4446800F077B *)strchr((char *)v9 + 1, 47);
        if (!self) {
          break;
        }
        uint64_t v9 = (const char *)self;
        if (--v8 <= 1)
        {
          if (v6) {
            goto LABEL_10;
          }
LABEL_21:
          memset(v12, 0, 28);
          goto LABEL_11;
        }
      }
      if (v8 != 2) {
        return self;
      }
      uint64_t v9 = "/";
      if (!v6) {
        goto LABEL_21;
      }
    }
    else
    {
      uint64_t v9 = a4;
    }
LABEL_10:
    self = ($1CD0F41CAFB66BEF540F4446800F077B *)[($1CD0F41CAFB66BEF540F4446800F077B *)v6 filter:v9 allowBundleCheck:1];
LABEL_11:
    *(_OWORD *)&retstr->var0 = v12[0];
    *(_OWORD *)((char *)&retstr->var1 + 4) = *(_OWORD *)((char *)v12 + 12);
    __int16 v10 = (_WORD)v9 - v5;
    if (retstr->var6) {
      __int16 v11 = (_WORD)v9 - v5;
    }
    else {
      __int16 v11 = 0;
    }
    retstr->var6 += v11;
    if (!retstr->var7) {
      __int16 v10 = 0;
    }
    retstr->var7 += v10;
  }
  else
  {
    retstr->var0 = 0;
    retstr->unint64_t var1 = 0;
    *(_DWORD *)&retstr->var6 = 0;
    *(void *)&retstr->int var2 = 0;
  }
  return self;
}

- (unint64_t)trimBundlePath:(id *)a3 path:(const char *)a4 buffer:(char *)a5 length:(unint64_t)a6
{
  uint64_t var6 = a3->var6;
  if (var6 + 1 < a6) {
    unint64_t v7 = var6 + 1;
  }
  else {
    unint64_t v7 = a6;
  }
  if (a3->var6) {
    size_t v8 = v7;
  }
  else {
    size_t v8 = a6;
  }
  size_t v9 = strlcpy(a5, a4, v8);
  if (v9 + 1 < v8) {
    return v9 + 1;
  }
  else {
    return v8;
  }
}

- (unint64_t)filterSubAuxValues:(id *)a3 count:(int *)a4
{
  int var5 = a3->var5;
  if (a4) {
    *a4 = var5;
  }
  if (var5) {
    return &self->_auxValues[a3->var4];
  }
  else {
    return 0;
  }
}

- (void)initWithMDPlist:(uint64_t)a3 .cold.1(long long *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(a1, a2, a3, a4, a5, a6, a7, a8, v8, v9, v10, v11, v12, v13);
  CFLog();
  __break(1u);
}

- (void)filter:allowBundleCheck:.cold.1()
{
}

- (void)filter:(uint64_t)a3 allowBundleCheck:(uint64_t)a4 .cold.2(long long *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(a1, a2, a3, a4, a5, a6, a7, a8, v8, v9, v10, v11, v12, v13);
  CFLog();
  __break(1u);
}

- (void)filter:(uint64_t)a3 allowBundleCheck:(uint64_t)a4 .cold.3(long long *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(a1, a2, a3, a4, a5, a6, a7, a8, v8, v9, v10, v11, v12, v13);
  CFLog();
  __break(1u);
}

- (void)filter:allowBundleCheck:.cold.4()
{
}

- (void)filter:allowBundleCheck:.cold.5()
{
}

@end