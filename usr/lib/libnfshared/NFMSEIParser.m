@interface NFMSEIParser
+ (unsigned)parseResponseAPDU:(id)a3;
@end

@implementation NFMSEIParser

+ (unsigned)parseResponseAPDU:(id)a3
{
  uint64_t v154 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((unint64_t)[v5 length] < 2)
  {
    unsigned int v6 = 13;
    goto LABEL_101;
  }
  v7 = [v5 subdataWithRange:0, [v5 length] - 2];
  id v8 = v5;
  uint64_t v9 = [v8 bytes];
  int v10 = *(unsigned __int8 *)([v8 length] + v9 - 2);
  if ((*(unsigned __int8 *)([v8 length] + v9 - 1) | (v10 << 8)) != 0x9000)
  {
    unsigned int v6 = 16;
    goto LABEL_100;
  }
  v135 = v7;
  id v136 = v5;
  id v11 = v7;
  uint64_t v12 = [v11 bytes];
  if (![v11 length])
  {
LABEL_65:
    unsigned int v6 = 0;
    goto LABEL_67;
  }
  id v133 = a1;
  unint64_t v13 = 0;
  int v14 = 0;
  while (1)
  {
    if ([v11 length] - v13 <= 1)
    {
      v49 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      if ((unint64_t)specific >= 4) {
        goto LABEL_153;
      }
      v51 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)specific);
      v7 = v135;
      id v5 = v136;
      if (v51)
      {
        Class = object_getClass(v133);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(v133);
        Name = sel_getName(a2);
        uint64_t v55 = 45;
        if (isMetaClass) {
          uint64_t v55 = 43;
        }
        v51(5, "%c[%{public}s %{public}s]:%i Minimum length requirement not met", v55, ClassName, Name, 50);
        v49 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      v56 = dispatch_get_specific(v49);
      if (NFSharedLogInitialize_onceToken != -1) {
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      }
      v28 = (id)_NFSharedLogClient[(void)v56];
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_98;
      }
      v57 = object_getClass(v133);
      if (class_isMetaClass(v57)) {
        int v58 = 43;
      }
      else {
        int v58 = 45;
      }
      v59 = object_getClassName(v133);
      v60 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v143 = v58;
      __int16 v144 = 2082;
      v145 = v59;
      __int16 v146 = 2082;
      v147 = v60;
      __int16 v148 = 1024;
      int v149 = 50;
      v61 = "%c[%{public}s %{public}s]:%i Minimum length requirement not met";
      goto LABEL_96;
    }
    int v15 = *(unsigned __int8 *)(v12 + v13);
    int64_t v16 = *(unsigned __int8 *)(v12 + v14 + 1);
    uint64_t v17 = v14 + 2;
    if ([v11 length] - v17 < (unint64_t)v16)
    {
      v62 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      v63 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      if ((unint64_t)v63 >= 4) {
        goto LABEL_153;
      }
      v64 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v63);
      v7 = v135;
      id v5 = v136;
      if (v64)
      {
        v65 = object_getClass(v133);
        BOOL v66 = class_isMetaClass(v65);
        v67 = object_getClassName(v133);
        v126 = sel_getName(a2);
        uint64_t v68 = 45;
        if (v66) {
          uint64_t v68 = 43;
        }
        v64(5, "%c[%{public}s %{public}s]:%i Incorrect length field", v68, v67, v126, 58);
        v62 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      v69 = dispatch_get_specific(v62);
      if (NFSharedLogInitialize_onceToken != -1) {
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      }
      v28 = (id)_NFSharedLogClient[(void)v69];
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_98;
      }
      v70 = object_getClass(v133);
      if (class_isMetaClass(v70)) {
        int v71 = 43;
      }
      else {
        int v71 = 45;
      }
      v72 = object_getClassName(v133);
      v73 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v143 = v71;
      __int16 v144 = 2082;
      v145 = v72;
      __int16 v146 = 2082;
      v147 = v73;
      __int16 v148 = 1024;
      int v149 = 58;
      v61 = "%c[%{public}s %{public}s]:%i Incorrect length field";
LABEL_96:
      v74 = v28;
      uint32_t v75 = 34;
      goto LABEL_97;
    }
    if (v15 <= 201) {
      break;
    }
    if (v15 == 202 || v15 == 205)
    {
      if (v16 == 2)
      {
LABEL_19:
        if ((*(unsigned __int8 *)(v14 + v12 + 3) | (*(unsigned __int8 *)(v12 + v17) << 8)) == 0x6985) {
          goto LABEL_66;
        }
      }
    }
    else
    {
LABEL_25:
      v19 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      v20 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      if ((unint64_t)v20 >= 4) {
        goto LABEL_153;
      }
      v21 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v20);
      if (v21)
      {
        v22 = object_getClass(v133);
        BOOL v23 = class_isMetaClass(v22);
        v24 = object_getClassName(v133);
        v25 = sel_getName(a2);
        uint64_t v26 = 45;
        if (v23) {
          uint64_t v26 = 43;
        }
        v21(5, "%c[%{public}s %{public}s]:%i Unrecognized tag: 0x%X", v26, v24, v25, 169, *(unsigned __int8 *)(v12 + v17));
        v19 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      v27 = dispatch_get_specific(v19);
      if (NFSharedLogInitialize_onceToken != -1) {
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      }
      v28 = (id)_NFSharedLogClient[(void)v27];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v29 = object_getClass(v133);
        if (class_isMetaClass(v29)) {
          int v30 = 43;
        }
        else {
          int v30 = 45;
        }
        v31 = object_getClassName(v133);
        v32 = sel_getName(a2);
        int v33 = *(unsigned __int8 *)(v12 + v17);
        *(_DWORD *)buf = 67110146;
        int v143 = v30;
        __int16 v144 = 2082;
        v145 = v31;
        __int16 v146 = 2082;
        v147 = v32;
        __int16 v148 = 1024;
        int v149 = 169;
        __int16 v150 = 1024;
        int v151 = v33;
        _os_log_impl(&dword_1CA51A000, v28, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Unrecognized tag: 0x%X", buf, 0x28u);
      }
LABEL_61:
    }
LABEL_62:
    unint64_t v13 = v16 + (int)v17;
    int v14 = v16 + v17;
    if ([v11 length] <= v13) {
      goto LABEL_65;
    }
  }
  switch(v15)
  {
    case 16:
      if (v16 == 2) {
        goto LABEL_19;
      }
      if (!v16) {
        goto LABEL_66;
      }
      int v18 = *(unsigned __int8 *)(v12 + v17);
      if (*(unsigned char *)(v12 + v17))
      {
        if (v18 != 144 && v18 != 175) {
          goto LABEL_66;
        }
      }
      goto LABEL_62;
    case 17:
      if (v16)
      {
        v77 = kNFLOG_DISPATCH_SPECIFIC_KEY;
        v78 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        if ((unint64_t)v78 >= 4) {
          goto LABEL_153;
        }
        v79 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v78);
        v7 = v135;
        id v5 = v136;
        if (v79)
        {
          v80 = object_getClass(v133);
          BOOL v81 = class_isMetaClass(v80);
          v123 = object_getClassName(v133);
          v127 = sel_getName(a2);
          uint64_t v82 = 45;
          if (v81) {
            uint64_t v82 = 43;
          }
          v79(5, "%c[%{public}s %{public}s]:%i [Tag 0x11] Unexpected data length: 0x%X", v82, v123, v127, 85, v16);
          v77 = kNFLOG_DISPATCH_SPECIFIC_KEY;
        }
        v83 = dispatch_get_specific(v77);
        if (NFSharedLogInitialize_onceToken != -1) {
          dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
        }
        v28 = (id)_NFSharedLogClient[(void)v83];
        if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_98;
        }
        v84 = object_getClass(v133);
        if (class_isMetaClass(v84)) {
          int v85 = 43;
        }
        else {
          int v85 = 45;
        }
        v86 = object_getClassName(v133);
        v87 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        int v143 = v85;
        __int16 v144 = 2082;
        v145 = v86;
        __int16 v146 = 2082;
        v147 = v87;
        __int16 v148 = 1024;
        int v149 = 85;
        __int16 v150 = 1024;
        int v151 = v16;
        v61 = "%c[%{public}s %{public}s]:%i [Tag 0x11] Unexpected data length: 0x%X";
        goto LABEL_126;
      }
      uint64_t v34 = v14 + 2;
      if ((int)v17 < (int)v16)
      {
        while (__rev16(*(unsigned __int16 *)(v12 + v34)) == 36864)
        {
          v34 += 2;
          if (v34 >= v16) {
            goto LABEL_62;
          }
        }
        goto LABEL_66;
      }
      goto LABEL_62;
    case 18:
      if (v16)
      {
        v88 = kNFLOG_DISPATCH_SPECIFIC_KEY;
        v89 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        if ((unint64_t)v89 >= 4) {
          goto LABEL_153;
        }
        v90 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v89);
        v7 = v135;
        id v5 = v136;
        if (v90)
        {
          v91 = object_getClass(v133);
          BOOL v92 = class_isMetaClass(v91);
          v124 = object_getClassName(v133);
          v128 = sel_getName(a2);
          uint64_t v93 = 45;
          if (v92) {
            uint64_t v93 = 43;
          }
          v90(5, "%c[%{public}s %{public}s]:%i [Tag 0x12] Unexpected data length: 0x%X", v93, v124, v128, 97, v16);
          v88 = kNFLOG_DISPATCH_SPECIFIC_KEY;
        }
        v94 = dispatch_get_specific(v88);
        if (NFSharedLogInitialize_onceToken != -1) {
          dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
        }
        v28 = (id)_NFSharedLogClient[(void)v94];
        if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_98;
        }
        v95 = object_getClass(v133);
        if (class_isMetaClass(v95)) {
          int v96 = 43;
        }
        else {
          int v96 = 45;
        }
        v97 = object_getClassName(v133);
        v98 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        int v143 = v96;
        __int16 v144 = 2082;
        v145 = v97;
        __int16 v146 = 2082;
        v147 = v98;
        __int16 v148 = 1024;
        int v149 = 97;
        __int16 v150 = 1024;
        int v151 = v16;
        v61 = "%c[%{public}s %{public}s]:%i [Tag 0x12] Unexpected data length: 0x%X";
LABEL_126:
        v74 = v28;
        uint32_t v75 = 40;
        goto LABEL_97;
      }
      uint64_t v35 = v14 + 2;
      if ((int)v17 < (int)v16)
      {
        while (__rev16(*(unsigned __int16 *)(v12 + v35)) == 36864)
        {
          v35 += 2;
          if (v35 >= v16) {
            goto LABEL_62;
          }
        }
LABEL_66:
        unsigned int v6 = 16;
LABEL_67:
        v7 = v135;
        id v5 = v136;
        goto LABEL_100;
      }
      goto LABEL_62;
    case 19:
    case 20:
      goto LABEL_25;
    case 21:
      if (v16 <= 1)
      {
        v99 = kNFLOG_DISPATCH_SPECIFIC_KEY;
        v100 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        if ((unint64_t)v100 < 4)
        {
          v101 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v100);
          v7 = v135;
          id v5 = v136;
          if (v101)
          {
            v102 = object_getClass(v133);
            BOOL v103 = class_isMetaClass(v102);
            v104 = object_getClassName(v133);
            v129 = sel_getName(a2);
            uint64_t v105 = 45;
            if (v103) {
              uint64_t v105 = 43;
            }
            v101(5, "%c[%{public}s %{public}s]:%i [Tag 0x%X] Unexpected data length: 0x%X", v105, v104, v129, 125, 21, v16);
            v99 = kNFLOG_DISPATCH_SPECIFIC_KEY;
          }
          v106 = dispatch_get_specific(v99);
          if (NFSharedLogInitialize_onceToken != -1) {
            dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
          }
          v28 = (id)_NFSharedLogClient[(void)v106];
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            v107 = object_getClass(v133);
            if (class_isMetaClass(v107)) {
              int v108 = 43;
            }
            else {
              int v108 = 45;
            }
            v109 = object_getClassName(v133);
            v110 = sel_getName(a2);
            *(_DWORD *)buf = 67110402;
            int v143 = v108;
            __int16 v144 = 2082;
            v145 = v109;
            __int16 v146 = 2082;
            v147 = v110;
            __int16 v148 = 1024;
            int v149 = 125;
            __int16 v150 = 1024;
            int v151 = 21;
            __int16 v152 = 1024;
            int v153 = v16;
            v61 = "%c[%{public}s %{public}s]:%i [Tag 0x%X] Unexpected data length: 0x%X";
            goto LABEL_151;
          }
          goto LABEL_98;
        }
        goto LABEL_153;
      }
      if ((*(unsigned __int8 *)(v16 + (int)v17 + v12 - 1) | (*(unsigned __int8 *)(v12 + v14 + (int)v16) << 8)) != 0x9000) {
        goto LABEL_66;
      }
      if (*(unsigned __int8 *)(v12 + v17) != 230) {
        goto LABEL_66;
      }
      uint64_t v36 = *(unsigned __int8 *)(v14 + v12 + 3);
      unint64_t v37 = v36 + v14 + 4;
      if ([v11 length] <= v37) {
        goto LABEL_66;
      }
      unint64_t v132 = v37;
      v38 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v12 + v17 length:v36 + 2];
      v39 = +[NFTLV simpleTLVsWithData:v38];

      long long v139 = 0u;
      long long v140 = 0u;
      long long v137 = 0u;
      long long v138 = 0u;
      obj = v39;
      uint64_t v40 = [obj countByEnumeratingWithState:&v137 objects:v141 count:16];
      if (!v40) {
        goto LABEL_60;
      }
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v138;
      v131 = a2;
LABEL_53:
      uint64_t v43 = 0;
      break;
    default:
      if (v15) {
        goto LABEL_25;
      }
      if (v16 <= 1)
      {
        v111 = kNFLOG_DISPATCH_SPECIFIC_KEY;
        v112 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        if ((unint64_t)v112 < 4)
        {
          v113 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v112);
          v7 = v135;
          id v5 = v136;
          if (v113)
          {
            v114 = object_getClass(v133);
            BOOL v115 = class_isMetaClass(v114);
            v116 = object_getClassName(v133);
            v130 = sel_getName(a2);
            uint64_t v117 = 45;
            if (v115) {
              uint64_t v117 = 43;
            }
            v113(5, "%c[%{public}s %{public}s]:%i [Tag 0x%X] Unexpected data length: 0x%X", v117, v116, v130, 64, 0, v16);
            v111 = kNFLOG_DISPATCH_SPECIFIC_KEY;
          }
          v118 = dispatch_get_specific(v111);
          if (NFSharedLogInitialize_onceToken != -1) {
            dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
          }
          v28 = (id)_NFSharedLogClient[(void)v118];
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            v119 = object_getClass(v133);
            if (class_isMetaClass(v119)) {
              int v120 = 43;
            }
            else {
              int v120 = 45;
            }
            v121 = object_getClassName(v133);
            v122 = sel_getName(a2);
            *(_DWORD *)buf = 67110402;
            int v143 = v120;
            __int16 v144 = 2082;
            v145 = v121;
            __int16 v146 = 2082;
            v147 = v122;
            __int16 v148 = 1024;
            int v149 = 64;
            __int16 v150 = 1024;
            int v151 = 0;
            __int16 v152 = 1024;
            int v153 = v16;
            v61 = "%c[%{public}s %{public}s]:%i [Tag 0x%X] Unexpected data length: 0x%X";
LABEL_151:
            v74 = v28;
            uint32_t v75 = 46;
LABEL_97:
            _os_log_impl(&dword_1CA51A000, v74, OS_LOG_TYPE_DEFAULT, v61, buf, v75);
          }
LABEL_98:
          unsigned int v6 = 13;
          goto LABEL_99;
        }
LABEL_153:
        __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
      }
      if ((*(unsigned __int8 *)(v14 + v12 + 3) | (*(unsigned __int8 *)(v12 + v17) << 8)) != 0x9000) {
        goto LABEL_66;
      }
      goto LABEL_62;
  }
  while (2)
  {
    if (*(void *)v138 != v42) {
      objc_enumerationMutation(obj);
    }
    v44 = *(void **)(*((void *)&v137 + 1) + 8 * v43);
    id v45 = [v44 value];
    uint64_t v46 = [v45 bytes];

    v47 = [v44 value];
    uint64_t v48 = [v47 length];

    if (!v46)
    {
      unsigned int v6 = 34;
LABEL_70:
      v28 = obj;

      goto LABEL_71;
    }
    if (__rev16(*(unsigned __int16 *)(v48 + v46 - 2)) != 36864)
    {
      unsigned int v6 = 16;
      goto LABEL_70;
    }
    if (v41 != ++v43) {
      continue;
    }
    break;
  }
  uint64_t v41 = [obj countByEnumeratingWithState:&v137 objects:v141 count:16];
  a2 = v131;
  if (v41) {
    goto LABEL_53;
  }
LABEL_60:
  v28 = obj;

  if ((*(unsigned __int8 *)(v12 + (int)v132 + 1) | (*(unsigned __int8 *)(v12 + v132) << 8)) == 0x9000) {
    goto LABEL_61;
  }
  unsigned int v6 = 16;
LABEL_71:
  v7 = v135;
  id v5 = v136;
LABEL_99:

LABEL_100:
LABEL_101:

  return v6;
}

@end