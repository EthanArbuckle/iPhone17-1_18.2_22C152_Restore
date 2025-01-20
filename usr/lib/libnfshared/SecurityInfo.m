@interface SecurityInfo
+ (id)securityInfoArrayFromData:(id)a3;
- (SecurityInfo)initWithType:(int64_t)a3;
- (int64_t)type;
- (void)setType:(int64_t)a3;
@end

@implementation SecurityInfo

- (SecurityInfo)initWithType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SecurityInfo;
  result = [(SecurityInfo *)&v5 init];
  if (result) {
    result->_type = a3;
  }
  return result;
}

+ (id)securityInfoArrayFromData:(id)a3
{
  uint64_t v374 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = +[NFTLV TLVWithData:v4];
  v349 = v5;
  v350 = v4;
  if (v5)
  {
    v6 = v5;
    if ([v5 tag] == 49)
    {
      v7 = [v6 children];
      uint64_t v8 = [v7 count];

      if (v8)
      {
        v347 = objc_opt_new();
        long long v357 = 0u;
        long long v358 = 0u;
        long long v359 = 0u;
        long long v360 = 0u;
        id obj = [v6 children];
        uint64_t v9 = [obj countByEnumeratingWithState:&v357 objects:v364 count:16];
        if (!v9) {
          goto LABEL_325;
        }
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v358;
        v351 = a2;
        uint64_t v353 = *(void *)v358;
        while (1)
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v358 != v11) {
              objc_enumerationMutation(obj);
            }
            v13 = *(void **)(*((void *)&v357 + 1) + 8 * v12);
            if ([v13 tag] == 48)
            {
              v14 = [v13 children];
              uint64_t v15 = [v14 count];

              if (v15)
              {
                v16 = [v13 children];
                v17 = [v16 objectAtIndex:0];

                if ([v17 tag] != 6) {
                  goto LABEL_21;
                }
                v18 = [v17 value];
                if ((unint64_t)[v18 length] <= 7)
                {

                  goto LABEL_21;
                }
                id v19 = [v17 value];
                v20 = (_DWORD *)[v19 bytes];
                BOOL v21 = *v20 == 8323076 && *(_DWORD *)((char *)v20 + 3) == 33687296;
                int v22 = !v21;

                if (v22)
                {
LABEL_21:
                  v23 = kNFLOG_DISPATCH_SPECIFIC_KEY;
                  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                  if ((unint64_t)specific >= 4) {
                    goto LABEL_349;
                  }
                  v25 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)specific);
                  if (v25)
                  {
                    Class = object_getClass(a1);
                    BOOL isMetaClass = class_isMetaClass(Class);
                    ClassName = object_getClassName(a1);
                    Name = sel_getName(a2);
                    uint64_t v28 = 45;
                    if (isMetaClass) {
                      uint64_t v28 = 43;
                    }
                    v25(4, "%c[%{public}s %{public}s]:%i Unexpected ASN sequence item 0: %{public}@", v28, ClassName, Name, 93, v17);
                    v23 = kNFLOG_DISPATCH_SPECIFIC_KEY;
                  }
                  v29 = dispatch_get_specific(v23);
                  uint64_t v11 = v353;
                  if (NFSharedLogInitialize_onceToken != -1) {
                    dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
                  }
                  v30 = (id)_NFSharedLogClient[(void)v29];
                  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                  {
                    v31 = object_getClass(a1);
                    if (class_isMetaClass(v31)) {
                      int v32 = 43;
                    }
                    else {
                      int v32 = 45;
                    }
                    v33 = object_getClassName(a1);
                    v34 = sel_getName(a2);
                    *(_DWORD *)buf = 67110146;
                    *(_DWORD *)&buf[4] = v32;
                    *(_WORD *)&buf[8] = 2082;
                    *(void *)&buf[10] = v33;
                    *(_WORD *)&buf[18] = 2082;
                    *(void *)&buf[20] = v34;
                    *(_WORD *)&buf[28] = 1024;
                    *(_DWORD *)&buf[30] = 93;
                    *(_WORD *)&buf[34] = 2114;
                    *(void *)&buf[36] = v17;
                    _os_log_impl(&dword_1CA51A000, v30, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected ASN sequence item 0: %{public}@", buf, 0x2Cu);
                  }
                  goto LABEL_33;
                }
                id v35 = [v17 value];
                unsigned int v36 = *(unsigned __int8 *)([v35 bytes] + 7);

                unsigned int v352 = v36;
                if (v36 != 3)
                {
                  if (v36 != 4) {
                    goto LABEL_288;
                  }
                  v37 = [PaceInfo alloc];
                  id v38 = v13;
                  if (v37)
                  {
                    v361.receiver = v37;
                    v361.super_class = (Class)PaceInfo;
                    v39 = [super initWithType:0];
                    if (v39)
                    {
                      v40 = v39;
                      v41 = [v38 children];
                      int v42 = [v41 count];

                      int v342 = v42;
                      unsigned int v43 = v42 - 4;
                      v44 = v40;
                      v348 = v38;
                      v346 = v40;
                      if (v43 <= 0xFFFFFFFD)
                      {
                        v45 = kNFLOG_DISPATCH_SPECIFIC_KEY;
                        v46 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                        if ((unint64_t)v46 >= 4) {
                          goto LABEL_349;
                        }
                        v47 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v46);
                        if (v47)
                        {
                          v48 = object_getClass(v40);
                          BOOL v49 = class_isMetaClass(v48);
                          v50 = object_getClassName(v40);
                          v323 = sel_getName(sel_initFromTLV_);
                          uint64_t v51 = 45;
                          if (v49) {
                            uint64_t v51 = 43;
                          }
                          v47(3, "%c[%{public}s %{public}s]:%i Unexpected # of elements in sequence", v51, v50, v323, 215);
                          v45 = kNFLOG_DISPATCH_SPECIFIC_KEY;
                        }
                        v52 = dispatch_get_specific(v45);
                        uint64_t v11 = v353;
                        if (NFSharedLogInitialize_onceToken != -1) {
                          dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
                        }
                        v53 = (id)_NFSharedLogClient[(void)v52];
                        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
                        {
                          v54 = object_getClass(v40);
                          if (class_isMetaClass(v54)) {
                            int v55 = 43;
                          }
                          else {
                            int v55 = 45;
                          }
                          v56 = object_getClassName(v44);
                          v57 = v53;
                          v58 = v56;
                          v59 = sel_getName(sel_initFromTLV_);
                          *(_DWORD *)buf = 67109890;
                          *(_DWORD *)&buf[4] = v55;
                          *(_WORD *)&buf[8] = 2082;
                          *(void *)&buf[10] = v58;
                          v53 = v57;
                          *(_WORD *)&buf[18] = 2082;
                          *(void *)&buf[20] = v59;
                          *(_WORD *)&buf[28] = 1024;
                          *(_DWORD *)&buf[30] = 215;
                          v60 = v57;
                          goto LABEL_80;
                        }
                        goto LABEL_81;
                      }
                      v74 = [v38 children];
                      v75 = [v74 objectAtIndex:0];

                      v76 = v75;
                      id v77 = [v75 value];
                      v344 = v76;
                      v339 = v77;
                      if ([v77 length] == 9 || objc_msgSend(v77, "length") == 10)
                      {
                        id v78 = v77;
                        uint64_t v79 = [v78 bytes];
                        if (*(void *)v79 == 0x4020207007F0004)
                        {
                          v44 = (void *)v79;
                          LODWORD(v80) = *(unsigned __int8 *)(v79 + 8);
                          switch(*(unsigned char *)(v79 + 8))
                          {
                            case 1:
                              v98 = (unsigned __int8 *)(v79 + 9);
                              id v99 = v78;
                              uint64_t v100 = [v99 bytes];
                              if ((unsigned __int8 *)(v100 + [v99 length]) != v98)
                              {
                                unint64_t v80 = *v98;
                                char v81 = 0;
                                v82 = v348;
                                v44 = v346;
                                switch((int)v80)
                                {
                                  case 1:
                                    goto LABEL_92;
                                  case 2:
                                    char v81 = 0;
                                    unint64_t v80 = 2;
                                    goto LABEL_92;
                                  case 3:
                                    char v81 = 0;
                                    unint64_t v80 = 3;
                                    goto LABEL_92;
                                  case 4:
                                    char v81 = 0;
                                    unint64_t v80 = 4;
                                    goto LABEL_92;
                                  default:
                                    goto LABEL_235;
                                }
                              }
                              char v81 = 0;
                              unint64_t v80 = 0;
                              goto LABEL_66;
                            case 2:
                              v155 = (unsigned __int8 *)(v79 + 9);
                              id v156 = v78;
                              uint64_t v157 = [v156 bytes];
                              if ((unsigned __int8 *)(v157 + [v156 length]) != v155)
                              {
                                int v158 = *v155 - 1;
                                char v81 = 0;
                                unint64_t v80 = 11;
                                v82 = v348;
                                v44 = v346;
                                switch(v158)
                                {
                                  case 0:
                                    goto LABEL_92;
                                  case 1:
                                    char v81 = 0;
                                    unint64_t v80 = 12;
                                    goto LABEL_92;
                                  case 2:
                                    char v81 = 0;
                                    unint64_t v80 = 13;
                                    goto LABEL_92;
                                  case 3:
                                    char v81 = 0;
                                    unint64_t v80 = 14;
                                    goto LABEL_92;
                                  default:
                                    goto LABEL_235;
                                }
                              }
                              char v81 = 0;
                              unint64_t v80 = 10;
                              goto LABEL_66;
                            case 3:
                              v159 = (unsigned __int8 *)(v79 + 9);
                              id v160 = v78;
                              uint64_t v161 = [v160 bytes];
                              if ((unsigned __int8 *)(v161 + [v160 length]) != v159)
                              {
                                int v162 = *v159 - 1;
                                char v81 = 0;
                                unint64_t v80 = 6;
                                v82 = v348;
                                v44 = v346;
                                switch(v162)
                                {
                                  case 0:
                                    goto LABEL_92;
                                  case 1:
                                    char v81 = 0;
                                    unint64_t v80 = 7;
                                    goto LABEL_92;
                                  case 2:
                                    char v81 = 0;
                                    unint64_t v80 = 8;
                                    goto LABEL_92;
                                  case 3:
                                    char v81 = 0;
                                    unint64_t v80 = 9;
                                    goto LABEL_92;
                                  default:
                                    goto LABEL_235;
                                }
                              }
                              char v81 = 0;
                              unint64_t v80 = 5;
                              goto LABEL_66;
                            case 4:
                              v163 = (unsigned __int8 *)(v79 + 9);
                              id v164 = v78;
                              uint64_t v165 = [v164 bytes];
                              if ((unsigned __int8 *)(v165 + [v164 length]) != v163)
                              {
                                int v166 = *v163 - 1;
                                char v81 = 0;
                                unint64_t v80 = 16;
                                v82 = v348;
                                v44 = v346;
                                switch(v166)
                                {
                                  case 0:
                                    goto LABEL_92;
                                  case 1:
                                    char v81 = 0;
                                    unint64_t v80 = 17;
                                    goto LABEL_92;
                                  case 2:
                                    char v81 = 0;
                                    unint64_t v80 = 18;
                                    goto LABEL_92;
                                  case 3:
                                    char v81 = 0;
                                    unint64_t v80 = 19;
                                    goto LABEL_92;
                                  default:
LABEL_235:
                                    uint64_t v154 = 9;
                                    goto LABEL_236;
                                }
                              }
                              char v81 = 0;
                              unint64_t v80 = 15;
                              goto LABEL_66;
                            default:
                              uint64_t v154 = 8;
LABEL_236:
                              if (v80 != 6) {
                                goto LABEL_242;
                              }
                              v242 = (unsigned __int8 *)v44 + v154 + 1;
                              id v243 = v78;
                              uint64_t v244 = [v243 bytes];
                              if ((unsigned __int8 *)(v244 + [v243 length]) == v242)
                              {
                                char v81 = 0;
                                unint64_t v80 = 20;
                                goto LABEL_305;
                              }
                              int v245 = *v242;
                              v44 = v346;
                              switch(v245)
                              {
                                case 2:
                                  char v81 = 0;
                                  unint64_t v80 = 21;
LABEL_323:
                                  uint64_t v11 = v353;
                                  v82 = v348;
                                  goto LABEL_92;
                                case 4:
                                  char v81 = 0;
                                  unint64_t v80 = 23;
                                  goto LABEL_323;
                                case 3:
                                  char v81 = 0;
                                  unint64_t v80 = 22;
LABEL_305:
                                  uint64_t v11 = v353;
                                  goto LABEL_66;
                              }
LABEL_242:
                              memset(buf, 0, 48);
                              unint64_t v246 = [v78 length];
                              id v247 = v78;
                              uint64_t v335 = [v247 bytes];
                              v248 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                              if ((unint64_t)v248 >= 4) {
                                goto LABEL_349;
                              }
                              v249 = v248;
                              v338 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v248);
                              if (NFSharedLogInitialize_onceToken != -1) {
                                dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
                              }
                              v250 = v348;
                              v251 = (id)_NFSharedLogClient[(void)v249];
                              if (os_log_type_enabled(v251, OS_LOG_TYPE_ERROR))
                              {
                                uint64_t v252 = [v247 length];
                                *(_DWORD *)v365 = 136315906;
                                v366 = "PaceProtocolMapper";
                                __int16 v367 = 1024;
                                int v368 = 202;
                                __int16 v369 = 2082;
                                v370 = "Failed mapping:";
                                __int16 v371 = 2048;
                                uint64_t v372 = v252;
                                _os_log_impl(&dword_1CA51A000, v251, OS_LOG_TYPE_ERROR, "%s:%i %{public}s %lu bytes", v365, 0x26u);
                              }

                              if (v338) {
                                v338(4, "%s:%i %s %lu bytes :", "PaceProtocolMapper", 202, "Failed mapping:", [v247 length]);
                              }
                              uint64_t v11 = v353;
                              if (v246)
                              {
                                uint64_t v253 = 0;
                                do
                                {
                                  unint64_t v254 = 0;
                                  v255 = (char *)&buf[__sprintf_chk((char *)buf, 0, 0x30uLL, "%04lX: ", v253)];
                                  do
                                  {
                                    unint64_t v256 = v254 + 1;
                                    unint64_t v257 = v254 + 1 + v253;
                                    int v258 = sprintf(v255, "0x%02X ", *(unsigned __int8 *)(v335 + v253 + v254));
                                    if (v254 > 6) {
                                      break;
                                    }
                                    v255 += v258;
                                    ++v254;
                                  }
                                  while (v257 < v246);
                                  v259 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                                  if (NFSharedLogInitialize_onceToken != -1) {
                                    dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
                                  }
                                  uint64_t v11 = v353;
                                  v250 = v348;
                                  v260 = (id)_NFSharedLogClient[(void)v259];
                                  if (os_log_type_enabled(v260, OS_LOG_TYPE_ERROR))
                                  {
                                    *(_DWORD *)v365 = 136446210;
                                    v366 = (const char *)buf;
                                    _os_log_impl(&dword_1CA51A000, v260, OS_LOG_TYPE_ERROR, "%{public}s", v365, 0xCu);
                                  }

                                  if (v338) {
                                    v338(4, "%s", (const char *)buf);
                                  }
                                  v253 += v256;
                                }
                                while (v257 < v246);
                              }
                              v82 = v250;
                              unint64_t v80 = -1;
                              char v81 = 1;
                              a2 = v351;
                              break;
                          }
                        }
                        else
                        {
                          unint64_t v80 = -1;
                          char v81 = 1;
LABEL_66:
                          v82 = v348;
                        }
                        v44 = v346;
                      }
                      else
                      {
                        v82 = v38;
                        unint64_t v80 = -1;
                        char v81 = 1;
                      }
LABEL_92:

                      int v105 = [v344 tag];
                      if ((v81 & 1) != 0 || v105 != 6)
                      {
                        v119 = kNFLOG_DISPATCH_SPECIFIC_KEY;
                        v120 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                        if ((unint64_t)v120 >= 4) {
                          goto LABEL_349;
                        }
                        v121 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v120);
                        if (v121)
                        {
                          v122 = object_getClass(v44);
                          BOOL v123 = class_isMetaClass(v122);
                          v317 = object_getClassName(v44);
                          v326 = sel_getName(sel_initFromTLV_);
                          uint64_t v124 = 45;
                          if (v123) {
                            uint64_t v124 = 43;
                          }
                          v121(3, "%c[%{public}s %{public}s]:%i Invalid protocol: %{public}@", v124, v317, v326, 222, v344);
                          v119 = kNFLOG_DISPATCH_SPECIFIC_KEY;
                        }
                        v125 = dispatch_get_specific(v119);
                        uint64_t v11 = v353;
                        if (NFSharedLogInitialize_onceToken != -1) {
                          dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
                        }
                        v114 = (id)_NFSharedLogClient[(void)v125];
                        if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
                        {
                          v126 = object_getClass(v44);
                          if (class_isMetaClass(v126)) {
                            int v127 = 43;
                          }
                          else {
                            int v127 = 45;
                          }
                          v128 = object_getClassName(v44);
                          v129 = sel_getName(sel_initFromTLV_);
                          *(_DWORD *)buf = 67110146;
                          *(_DWORD *)&buf[4] = v127;
                          *(_WORD *)&buf[8] = 2082;
                          *(void *)&buf[10] = v128;
                          *(_WORD *)&buf[18] = 2082;
                          *(void *)&buf[20] = v129;
                          *(_WORD *)&buf[28] = 1024;
                          *(_DWORD *)&buf[30] = 222;
                          *(_WORD *)&buf[34] = 2114;
                          v53 = v344;
                          *(void *)&buf[36] = v344;
                          _os_log_impl(&dword_1CA51A000, v114, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid protocol: %{public}@", buf, 0x2Cu);
                          v30 = 0;
                          v130 = v348;
                        }
                        else
                        {
LABEL_120:
                          v30 = 0;
                          v130 = v348;
                          v53 = v344;
                        }
                        goto LABEL_121;
                      }
                      if (v80 <= 0x14 && ((1 << v80) & 0x108421) != 0)
                      {
                        v106 = kNFLOG_DISPATCH_SPECIFIC_KEY;
                        v107 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                        if ((unint64_t)v107 >= 4) {
                          goto LABEL_349;
                        }
                        v108 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v107);
                        if (v108)
                        {
                          v109 = object_getClass(v44);
                          BOOL v110 = class_isMetaClass(v109);
                          v111 = object_getClassName(v44);
                          v325 = sel_getName(sel_initFromTLV_);
                          uint64_t v112 = 45;
                          if (v110) {
                            uint64_t v112 = 43;
                          }
                          v108(6, "%c[%{public}s %{public}s]:%i DomainParameterInfo found", v112, v111, v325, 229);
                          v106 = kNFLOG_DISPATCH_SPECIFIC_KEY;
                        }
                        uint64_t v11 = v353;
                        v113 = dispatch_get_specific(v106);
                        if (NFSharedLogInitialize_onceToken != -1) {
                          dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
                        }
                        v114 = (id)_NFSharedLogClient[(void)v113];
                        if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
                        {
                          v115 = object_getClass(v44);
                          if (class_isMetaClass(v115)) {
                            int v116 = 43;
                          }
                          else {
                            int v116 = 45;
                          }
                          v117 = object_getClassName(v44);
                          v118 = sel_getName(sel_initFromTLV_);
                          *(_DWORD *)buf = 67109890;
                          *(_DWORD *)&buf[4] = v116;
                          *(_WORD *)&buf[8] = 2082;
                          *(void *)&buf[10] = v117;
                          *(_WORD *)&buf[18] = 2082;
                          *(void *)&buf[20] = v118;
                          *(_WORD *)&buf[28] = 1024;
                          *(_DWORD *)&buf[30] = 229;
                          _os_log_impl(&dword_1CA51A000, v114, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i DomainParameterInfo found", buf, 0x22u);
                        }
                        goto LABEL_120;
                      }
                      v149 = [v82 children];
                      v150 = [v149 objectAtIndex:1];

                      v340 = v150;
                      if ([v150 tag] == 2)
                      {
                        unsigned int v151 = [v150 valueAsUnsignedLong];
                        if (v151 == 2)
                        {
                          if (v342 == 3)
                          {
                            v152 = [v348 children];
                            v153 = [v152 objectAtIndex:2];
                          }
                          else
                          {
                            v153 = 0;
                          }
                          v44[2] = v80;
                          uint64_t v295 = [NSNumber numberWithUnsignedLong:-[NSObject valueAsUnsignedLong](v153, "valueAsUnsignedLong")];
                          v296 = (void *)v44[4];
                          v44[4] = v295;

                          v30 = v44;
LABEL_312:
                          v53 = v344;

                          v130 = v348;
                          v114 = v340;
LABEL_121:

                          id v38 = v130;
LABEL_285:

LABEL_286:
                          if (v30)
                          {
                            [v347 addObject:v30];
LABEL_33:

                            goto LABEL_34;
                          }
LABEL_288:
                          v362[0] = &unk_1F24D1E98;
                          v362[1] = &unk_1F24D1EB0;
                          v363[0] = @"PK";
                          v363[1] = @"TA";
                          v362[2] = &unk_1F24D1EC8;
                          v362[3] = &unk_1F24D1EE0;
                          v363[2] = @"CA";
                          v363[3] = @"PACE";
                          v362[4] = &unk_1F24D1EF8;
                          v362[5] = &unk_1F24D1F10;
                          v363[4] = @"RI";
                          v363[5] = @"CI";
                          v362[6] = &unk_1F24D1F28;
                          v362[7] = &unk_1F24D1F40;
                          v363[6] = @"eIDSecurity";
                          v363[7] = @"PT";
                          v362[8] = &unk_1F24D1F58;
                          v362[9] = &unk_1F24D1F70;
                          v363[8] = @"PS";
                          v363[9] = @"PasswordType";
                          v362[10] = &unk_1F24D1F88;
                          v363[10] = @"eIDApplicationInfo";
                          v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v363 forKeys:v362 count:11];
                          v277 = [NSNumber numberWithUnsignedChar:v352];
                          v278 = [v30 objectForKey:v277];

                          v279 = NSString;
                          uint64_t v280 = [v17 value];
                          v281 = (void *)v280;
                          if (v278) {
                            [v279 stringWithFormat:@"id-%@ found (oid=%@)", v278, v280];
                          }
                          else {
                          v282 = [v279 stringWithFormat:@"Unknown info (%@) found", v280, v315];
                          }

                          v283 = kNFLOG_DISPATCH_SPECIFIC_KEY;
                          v284 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                          if ((unint64_t)v284 >= 4) {
                            goto LABEL_349;
                          }
                          v285 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v284);
                          if (v285)
                          {
                            v286 = object_getClass(a1);
                            BOOL v287 = class_isMetaClass(v286);
                            v321 = object_getClassName(a1);
                            v333 = sel_getName(v351);
                            uint64_t v288 = 45;
                            if (v287) {
                              uint64_t v288 = 43;
                            }
                            v285(6, "%c[%{public}s %{public}s]:%i %{public}@ found", v288, v321, v333, 129, v282);
                            v283 = kNFLOG_DISPATCH_SPECIFIC_KEY;
                          }
                          uint64_t v11 = v353;
                          v289 = dispatch_get_specific(v283);
                          if (NFSharedLogInitialize_onceToken != -1) {
                            dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
                          }
                          v290 = (id)_NFSharedLogClient[(void)v289];
                          if (os_log_type_enabled(v290, OS_LOG_TYPE_DEFAULT))
                          {
                            v291 = object_getClass(a1);
                            if (class_isMetaClass(v291)) {
                              int v292 = 43;
                            }
                            else {
                              int v292 = 45;
                            }
                            v293 = object_getClassName(a1);
                            v294 = sel_getName(v351);
                            *(_DWORD *)buf = 67110146;
                            *(_DWORD *)&buf[4] = v292;
                            *(_WORD *)&buf[8] = 2082;
                            *(void *)&buf[10] = v293;
                            uint64_t v11 = v353;
                            *(_WORD *)&buf[18] = 2082;
                            *(void *)&buf[20] = v294;
                            *(_WORD *)&buf[28] = 1024;
                            *(_DWORD *)&buf[30] = 129;
                            *(_WORD *)&buf[34] = 2114;
                            *(void *)&buf[36] = v282;
                            _os_log_impl(&dword_1CA51A000, v290, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@ found", buf, 0x2Cu);
                          }

                          a2 = v351;
                          goto LABEL_33;
                        }
                        unsigned int v261 = v151;
                        v262 = kNFLOG_DISPATCH_SPECIFIC_KEY;
                        v263 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                        if ((unint64_t)v263 >= 4) {
                          goto LABEL_349;
                        }
                        v264 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v263);
                        uint64_t v265 = v261;
                        if (v264)
                        {
                          v266 = object_getClass(v44);
                          BOOL v267 = class_isMetaClass(v266);
                          v320 = object_getClassName(v44);
                          v332 = sel_getName(sel_initFromTLV_);
                          uint64_t v268 = 45;
                          if (v267) {
                            uint64_t v268 = 43;
                          }
                          v264(4, "%c[%{public}s %{public}s]:%i Unexpected version: %lu", v268, v320, v332, 242, v261);
                          v262 = kNFLOG_DISPATCH_SPECIFIC_KEY;
                        }
                        uint64_t v11 = v353;
                        v269 = dispatch_get_specific(v262);
                        if (NFSharedLogInitialize_onceToken != -1) {
                          dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
                        }
                        v153 = (id)_NFSharedLogClient[(void)v269];
                        if (os_log_type_enabled(v153, OS_LOG_TYPE_ERROR))
                        {
                          v270 = object_getClass(v44);
                          BOOL v21 = !class_isMetaClass(v270);
                          v271 = v44;
                          if (v21) {
                            int v272 = 45;
                          }
                          else {
                            int v272 = 43;
                          }
                          v273 = object_getClassName(v271);
                          v274 = sel_getName(sel_initFromTLV_);
                          *(_DWORD *)buf = 67110146;
                          *(_DWORD *)&buf[4] = v272;
                          *(_WORD *)&buf[8] = 2082;
                          *(void *)&buf[10] = v273;
                          *(_WORD *)&buf[18] = 2082;
                          *(void *)&buf[20] = v274;
                          *(_WORD *)&buf[28] = 1024;
                          *(_DWORD *)&buf[30] = 242;
                          *(_WORD *)&buf[34] = 2048;
                          *(void *)&buf[36] = v265;
                          v179 = v153;
                          v180 = "%c[%{public}s %{public}s]:%i Unexpected version: %lu";
                          uint32_t v181 = 44;
                          goto LABEL_278;
                        }
                      }
                      else
                      {
                        v167 = kNFLOG_DISPATCH_SPECIFIC_KEY;
                        v168 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                        if ((unint64_t)v168 >= 4) {
                          goto LABEL_349;
                        }
                        v169 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v168);
                        if (v169)
                        {
                          v170 = object_getClass(v44);
                          BOOL v171 = class_isMetaClass(v170);
                          v172 = object_getClassName(v44);
                          v327 = sel_getName(sel_initFromTLV_);
                          uint64_t v173 = 45;
                          if (v171) {
                            uint64_t v173 = 43;
                          }
                          v169(3, "%c[%{public}s %{public}s]:%i Incorrect type for version", v173, v172, v327, 235);
                          v167 = kNFLOG_DISPATCH_SPECIFIC_KEY;
                        }
                        uint64_t v11 = v353;
                        v174 = dispatch_get_specific(v167);
                        if (NFSharedLogInitialize_onceToken != -1) {
                          dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
                        }
                        v153 = (id)_NFSharedLogClient[(void)v174];
                        if (os_log_type_enabled(v153, OS_LOG_TYPE_ERROR))
                        {
                          v175 = object_getClass(v44);
                          if (class_isMetaClass(v175)) {
                            int v176 = 43;
                          }
                          else {
                            int v176 = 45;
                          }
                          v177 = object_getClassName(v44);
                          v178 = sel_getName(sel_initFromTLV_);
                          *(_DWORD *)buf = 67109890;
                          *(_DWORD *)&buf[4] = v176;
                          *(_WORD *)&buf[8] = 2082;
                          *(void *)&buf[10] = v177;
                          *(_WORD *)&buf[18] = 2082;
                          *(void *)&buf[20] = v178;
                          *(_WORD *)&buf[28] = 1024;
                          *(_DWORD *)&buf[30] = 235;
                          v179 = v153;
                          v180 = "%c[%{public}s %{public}s]:%i Incorrect type for version";
                          uint32_t v181 = 34;
LABEL_278:
                          _os_log_impl(&dword_1CA51A000, v179, OS_LOG_TYPE_ERROR, v180, buf, v181);
                        }
                      }
                      v30 = 0;
                      goto LABEL_312;
                    }
                  }
LABEL_61:
                  v30 = 0;
                  goto LABEL_286;
                }
                v61 = [ChipAuthenticationInfo alloc];
                id v38 = v13;
                if (!v61) {
                  goto LABEL_61;
                }
                v361.receiver = v61;
                v361.super_class = (Class)ChipAuthenticationInfo;
                v62 = [super initWithType:1];
                if (!v62) {
                  goto LABEL_61;
                }
                v63 = v62;
                v64 = [v38 children];
                int v65 = [v64 count];

                int v336 = v65;
                v348 = v38;
                v346 = v63;
                if ((v65 - 4) <= 0xFFFFFFFD)
                {
                  v66 = kNFLOG_DISPATCH_SPECIFIC_KEY;
                  v67 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                  if ((unint64_t)v67 >= 4) {
                    goto LABEL_349;
                  }
                  v68 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v67);
                  if (v68)
                  {
                    v69 = v63;
                    v70 = object_getClass(v63);
                    BOOL v71 = class_isMetaClass(v70);
                    v72 = object_getClassName(v63);
                    v324 = sel_getName(sel_initFromTLV_);
                    uint64_t v73 = 45;
                    if (v71) {
                      uint64_t v73 = 43;
                    }
                    v68(3, "%c[%{public}s %{public}s]:%i Unexpected # of elements in sequence", v73, v72, v324, 338);
                    v66 = kNFLOG_DISPATCH_SPECIFIC_KEY;
                  }
                  else
                  {
                    v69 = v63;
                  }
                  v91 = dispatch_get_specific(v66);
                  uint64_t v11 = v353;
                  if (NFSharedLogInitialize_onceToken != -1) {
                    dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
                  }
                  v53 = (id)_NFSharedLogClient[(void)v91];
                  if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
                  {
                    v92 = object_getClass(v69);
                    if (class_isMetaClass(v92)) {
                      int v93 = 43;
                    }
                    else {
                      int v93 = 45;
                    }
                    v94 = object_getClassName(v69);
                    v95 = v53;
                    v96 = v94;
                    v97 = sel_getName(sel_initFromTLV_);
                    *(_DWORD *)buf = 67109890;
                    *(_DWORD *)&buf[4] = v93;
                    *(_WORD *)&buf[8] = 2082;
                    *(void *)&buf[10] = v96;
                    v53 = v95;
                    *(_WORD *)&buf[18] = 2082;
                    *(void *)&buf[20] = v97;
                    *(_WORD *)&buf[28] = 1024;
                    *(_DWORD *)&buf[30] = 338;
                    v60 = v95;
LABEL_80:
                    _os_log_impl(&dword_1CA51A000, v60, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected # of elements in sequence", buf, 0x22u);
                  }
LABEL_81:
                  v30 = 0;
                  id v38 = v348;
                  goto LABEL_285;
                }
                v83 = [v38 children];
                v84 = [v83 objectAtIndex:0];

                v85 = v84;
                id v86 = [v84 value];
                v345 = v85;
                v334 = v86;
                if ([v86 length] != 9 && objc_msgSend(v86, "length") != 10)
                {
                  uint64_t v89 = -1;
                  char v90 = 1;
                  v88 = v63;
                  goto LABEL_176;
                }
                a2 = (SEL)v86;
                uint64_t v87 = [(id)a2 bytes];
                if (*(void *)v87 != 0x3020207007F0004)
                {
                  v88 = v63;
                  uint64_t v89 = -1;
                  char v90 = 1;
                  a2 = v351;
LABEL_176:

                  int v182 = [v345 tag];
                  if ((v90 & 1) != 0 || v182 != 6)
                  {
                    v197 = kNFLOG_DISPATCH_SPECIFIC_KEY;
                    v198 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                    if ((unint64_t)v198 >= 4) {
                      goto LABEL_349;
                    }
                    v199 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v198);
                    if (v199)
                    {
                      v200 = object_getClass(v88);
                      BOOL v201 = class_isMetaClass(v200);
                      v318 = object_getClassName(v88);
                      v329 = sel_getName(sel_initFromTLV_);
                      uint64_t v202 = 45;
                      if (v201) {
                        uint64_t v202 = 43;
                      }
                      v199(3, "%c[%{public}s %{public}s]:%i Invalid protocol: %{public}@", v202, v318, v329, 345, v345);
                      v197 = kNFLOG_DISPATCH_SPECIFIC_KEY;
                    }
                    v203 = dispatch_get_specific(v197);
                    uint64_t v11 = v353;
                    if (NFSharedLogInitialize_onceToken != -1) {
                      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
                    }
                    v191 = (id)_NFSharedLogClient[(void)v203];
                    if (os_log_type_enabled(v191, OS_LOG_TYPE_ERROR))
                    {
                      v204 = object_getClass(v88);
                      v205 = v191;
                      if (class_isMetaClass(v204)) {
                        int v206 = 43;
                      }
                      else {
                        int v206 = 45;
                      }
                      v207 = object_getClassName(v88);
                      v208 = sel_getName(sel_initFromTLV_);
                      *(_DWORD *)buf = 67110146;
                      *(_DWORD *)&buf[4] = v206;
                      v191 = v205;
                      *(_WORD *)&buf[8] = 2082;
                      *(void *)&buf[10] = v207;
                      *(_WORD *)&buf[18] = 2082;
                      *(void *)&buf[20] = v208;
                      *(_WORD *)&buf[28] = 1024;
                      *(_DWORD *)&buf[30] = 345;
                      *(_WORD *)&buf[34] = 2114;
                      v53 = v345;
                      *(void *)&buf[36] = v345;
                      _os_log_impl(&dword_1CA51A000, v205, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid protocol: %{public}@", buf, 0x2Cu);
                      v30 = 0;
                      goto LABEL_283;
                    }
LABEL_204:
                    v30 = 0;
                    id v38 = v348;
                    v53 = v345;
                  }
                  else
                  {
                    if (v89 == 5 || !v89)
                    {
                      v183 = kNFLOG_DISPATCH_SPECIFIC_KEY;
                      v184 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                      if ((unint64_t)v184 >= 4) {
                        goto LABEL_349;
                      }
                      v185 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v184);
                      if (v185)
                      {
                        v186 = object_getClass(v88);
                        BOOL v187 = class_isMetaClass(v186);
                        v188 = object_getClassName(v88);
                        v328 = sel_getName(sel_initFromTLV_);
                        uint64_t v189 = 45;
                        if (v187) {
                          uint64_t v189 = 43;
                        }
                        v185(6, "%c[%{public}s %{public}s]:%i DomainParameterInfo found", v189, v188, v328, 349);
                        v183 = kNFLOG_DISPATCH_SPECIFIC_KEY;
                      }
                      uint64_t v11 = v353;
                      v190 = dispatch_get_specific(v183);
                      if (NFSharedLogInitialize_onceToken != -1) {
                        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
                      }
                      v191 = (id)_NFSharedLogClient[(void)v190];
                      if (os_log_type_enabled(v191, OS_LOG_TYPE_DEFAULT))
                      {
                        v192 = object_getClass(v88);
                        v193 = v191;
                        if (class_isMetaClass(v192)) {
                          int v194 = 43;
                        }
                        else {
                          int v194 = 45;
                        }
                        v195 = object_getClassName(v88);
                        v196 = sel_getName(sel_initFromTLV_);
                        *(_DWORD *)buf = 67109890;
                        *(_DWORD *)&buf[4] = v194;
                        v191 = v193;
                        *(_WORD *)&buf[8] = 2082;
                        *(void *)&buf[10] = v195;
                        *(_WORD *)&buf[18] = 2082;
                        *(void *)&buf[20] = v196;
                        *(_WORD *)&buf[28] = 1024;
                        *(_DWORD *)&buf[30] = 349;
                        _os_log_impl(&dword_1CA51A000, v193, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i DomainParameterInfo found", buf, 0x22u);
                      }
                      goto LABEL_204;
                    }
                    v209 = [v38 children];
                    v191 = [v209 objectAtIndex:1];

                    if ([v191 tag] == 2)
                    {
                      unsigned int v210 = [v191 valueAsUnsignedLong];
                      if (v210 - 4 <= 0xFFFFFFFC)
                      {
                        unsigned int v211 = v210;
                        v212 = kNFLOG_DISPATCH_SPECIFIC_KEY;
                        v213 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                        if ((unint64_t)v213 >= 4) {
                          goto LABEL_349;
                        }
                        v214 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v213);
                        uint64_t v341 = v211;
                        if (v214)
                        {
                          v215 = object_getClass(v88);
                          BOOL v337 = class_isMetaClass(v215);
                          v319 = object_getClassName(v88);
                          v330 = sel_getName(sel_initFromTLV_);
                          uint64_t v216 = 45;
                          if (v337) {
                            uint64_t v216 = 43;
                          }
                          v214(4, "%c[%{public}s %{public}s]:%i Unexpected version: %lu", v216, v319, v330, 363, v211);
                          v212 = kNFLOG_DISPATCH_SPECIFIC_KEY;
                        }
                        uint64_t v11 = v353;
                        v217 = dispatch_get_specific(v212);
                        if (NFSharedLogInitialize_onceToken != -1) {
                          dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
                        }
                        v218 = (id)_NFSharedLogClient[(void)v217];
                        if (os_log_type_enabled(v218, OS_LOG_TYPE_ERROR))
                        {
                          v219 = object_getClass(v88);
                          BOOL v21 = !class_isMetaClass(v219);
                          v220 = v88;
                          if (v21) {
                            int v221 = 45;
                          }
                          else {
                            int v221 = 43;
                          }
                          v222 = object_getClassName(v220);
                          v223 = sel_getName(sel_initFromTLV_);
                          *(_DWORD *)buf = 67110146;
                          *(_DWORD *)&buf[4] = v221;
                          *(_WORD *)&buf[8] = 2082;
                          *(void *)&buf[10] = v222;
                          *(_WORD *)&buf[18] = 2082;
                          *(void *)&buf[20] = v223;
                          *(_WORD *)&buf[28] = 1024;
                          *(_DWORD *)&buf[30] = 363;
                          *(_WORD *)&buf[34] = 2048;
                          *(void *)&buf[36] = v341;
                          v224 = v218;
                          v225 = "%c[%{public}s %{public}s]:%i Unexpected version: %lu";
                          uint32_t v226 = 44;
                          goto LABEL_231;
                        }
                        goto LABEL_232;
                      }
                      if (v336 == 3)
                      {
                        v241 = [v348 children];
                        v218 = [v241 objectAtIndex:2];
                      }
                      else
                      {
                        v218 = 0;
                      }
                      v88[2] = v89;
                      uint64_t v275 = [NSNumber numberWithUnsignedLong:-[NSObject valueAsUnsignedLong](v218, "valueAsUnsignedLong")];
                      v276 = (void *)v88[4];
                      v88[4] = v275;

                      v30 = v88;
                      v53 = v345;
                    }
                    else
                    {
                      v227 = kNFLOG_DISPATCH_SPECIFIC_KEY;
                      v228 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                      if ((unint64_t)v228 >= 4) {
                        goto LABEL_349;
                      }
                      v229 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v228);
                      if (v229)
                      {
                        v230 = object_getClass(v88);
                        BOOL v231 = class_isMetaClass(v230);
                        v232 = object_getClassName(v88);
                        v331 = sel_getName(sel_initFromTLV_);
                        uint64_t v233 = 45;
                        if (v231) {
                          uint64_t v233 = 43;
                        }
                        v229(3, "%c[%{public}s %{public}s]:%i Incorrect type for version", v233, v232, v331, 355);
                        v227 = kNFLOG_DISPATCH_SPECIFIC_KEY;
                      }
                      uint64_t v11 = v353;
                      v234 = dispatch_get_specific(v227);
                      if (NFSharedLogInitialize_onceToken != -1) {
                        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
                      }
                      v218 = (id)_NFSharedLogClient[(void)v234];
                      if (os_log_type_enabled(v218, OS_LOG_TYPE_ERROR))
                      {
                        v235 = object_getClass(v88);
                        BOOL v21 = !class_isMetaClass(v235);
                        v236 = v88;
                        v237 = v191;
                        if (v21) {
                          int v238 = 45;
                        }
                        else {
                          int v238 = 43;
                        }
                        v239 = object_getClassName(v236);
                        v240 = sel_getName(sel_initFromTLV_);
                        *(_DWORD *)buf = 67109890;
                        *(_DWORD *)&buf[4] = v238;
                        v191 = v237;
                        *(_WORD *)&buf[8] = 2082;
                        *(void *)&buf[10] = v239;
                        *(_WORD *)&buf[18] = 2082;
                        *(void *)&buf[20] = v240;
                        *(_WORD *)&buf[28] = 1024;
                        *(_DWORD *)&buf[30] = 355;
                        v224 = v218;
                        v225 = "%c[%{public}s %{public}s]:%i Incorrect type for version";
                        uint32_t v226 = 34;
LABEL_231:
                        _os_log_impl(&dword_1CA51A000, v224, OS_LOG_TYPE_ERROR, v225, buf, v226);
                      }
LABEL_232:
                      v30 = 0;
                      v53 = v345;
                    }

LABEL_283:
                    id v38 = v348;
                  }

                  goto LABEL_285;
                }
                int v101 = *(unsigned __int8 *)(v87 + 8);
                if (v101 == 2)
                {
                  v131 = (unsigned char *)(v87 + 9);
                  v132 = (id) a2;
                  uint64_t v133 = [v132 bytes];
                  if ((unsigned char *)(v133 + [v132 length]) != v131)
                  {
                    id v38 = v348;
                    v88 = v346;
                    char v90 = 0;
                    uint64_t v89 = 6;
                    a2 = v351;
                    switch(*v131)
                    {
                      case 1:
                        goto LABEL_176;
                      case 2:
                        char v90 = 0;
                        uint64_t v89 = 7;
                        goto LABEL_176;
                      case 3:
                        char v90 = 0;
                        uint64_t v89 = 8;
                        goto LABEL_176;
                      case 4:
                        char v90 = 0;
                        uint64_t v89 = 9;
                        goto LABEL_176;
                      default:
                        goto LABEL_126;
                    }
                  }
                  char v90 = 0;
                  uint64_t v89 = 5;
LABEL_174:
                  a2 = v351;
                }
                else
                {
                  if (v101 == 1)
                  {
                    v102 = (unsigned char *)(v87 + 9);
                    v103 = (id) a2;
                    uint64_t v104 = [v103 bytes];
                    if ((unsigned char *)(v104 + [v103 length]) != v102)
                    {
                      uint64_t v89 = *v102;
                      id v38 = v348;
                      v88 = v346;
                      char v90 = 0;
                      a2 = v351;
                      switch(*v102)
                      {
                        case 1:
                          goto LABEL_176;
                        case 2:
                          char v90 = 0;
                          uint64_t v89 = 2;
                          goto LABEL_176;
                        case 3:
                          char v90 = 0;
                          uint64_t v89 = 3;
                          goto LABEL_176;
                        case 4:
                          char v90 = 0;
                          uint64_t v89 = 4;
                          goto LABEL_176;
                        default:
                          goto LABEL_126;
                      }
                    }
                    char v90 = 0;
                    uint64_t v89 = 0;
                    goto LABEL_174;
                  }
LABEL_126:
                  memset(buf, 0, 48);
                  unint64_t v134 = [(id)a2 length];
                  v135 = (id) a2;
                  uint64_t v343 = [v135 bytes];
                  v136 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                  if ((unint64_t)v136 >= 4) {
                    goto LABEL_349;
                  }
                  v137 = v136;
                  v138 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v136);
                  if (NFSharedLogInitialize_onceToken != -1) {
                    dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
                  }
                  v139 = (id)_NFSharedLogClient[(void)v137];
                  if (os_log_type_enabled(v139, OS_LOG_TYPE_ERROR))
                  {
                    uint64_t v140 = [v135 length];
                    *(_DWORD *)v365 = 136315906;
                    v366 = "ChipAuthProtocolMapper";
                    __int16 v367 = 1024;
                    int v368 = 325;
                    __int16 v369 = 2082;
                    v370 = "Failed mapping:";
                    __int16 v371 = 2048;
                    uint64_t v372 = v140;
                    _os_log_impl(&dword_1CA51A000, v139, OS_LOG_TYPE_ERROR, "%s:%i %{public}s %lu bytes", v365, 0x26u);
                  }

                  if (v138) {
                    v138(4, "%s:%i %s %lu bytes :", "ChipAuthProtocolMapper", 325, "Failed mapping:", [v135 length]);
                  }
                  if (v134)
                  {
                    uint64_t v141 = 0;
                    do
                    {
                      unint64_t v142 = 0;
                      v143 = (char *)&buf[__sprintf_chk((char *)buf, 0, 0x30uLL, "%04lX: ", v141)];
                      do
                      {
                        unint64_t v144 = v142 + 1;
                        unint64_t v145 = v142 + 1 + v141;
                        int v146 = sprintf(v143, "0x%02X ", *(unsigned __int8 *)(v343 + v141 + v142));
                        if (v142 > 6) {
                          break;
                        }
                        v143 += v146;
                        ++v142;
                      }
                      while (v145 < v134);
                      v147 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                      if (NFSharedLogInitialize_onceToken != -1) {
                        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
                      }
                      v148 = (id)_NFSharedLogClient[(void)v147];
                      if (os_log_type_enabled(v148, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)v365 = 136446210;
                        v366 = (const char *)buf;
                        _os_log_impl(&dword_1CA51A000, v148, OS_LOG_TYPE_ERROR, "%{public}s", v365, 0xCu);
                      }

                      if (v138) {
                        v138(4, "%s", (const char *)buf);
                      }
                      v141 += v144;
                    }
                    while (v145 < v134);
                  }
                  uint64_t v89 = -1;
                  char v90 = 1;
                  a2 = v351;
                  uint64_t v11 = v353;
                }
                id v38 = v348;
                v88 = v346;
                goto LABEL_176;
              }
            }
LABEL_34:
            ++v12;
          }
          while (v12 != v10);
          uint64_t v297 = [obj countByEnumeratingWithState:&v357 objects:v364 count:16];
          uint64_t v10 = v297;
          if (!v297)
          {
LABEL_325:

            v298 = v349;
            v299 = v347;
            goto LABEL_346;
          }
        }
      }
    }
  }
  memset(buf, 0, 48);
  unint64_t v300 = [v4 length];
  id v301 = v4;
  obja = (unsigned __int8 *)[v301 bytes];
  v302 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  if ((unint64_t)v302 >= 4) {
LABEL_349:
  }
    __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
  v303 = v302;
  v304 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v302);
  if (NFSharedLogInitialize_onceToken != -1) {
    dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
  }
  v305 = (id)_NFSharedLogClient[(void)v303];
  if (os_log_type_enabled(v305, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v365 = 136315906;
    v366 = "+[SecurityInfo securityInfoArrayFromData:]";
    __int16 v367 = 1024;
    int v368 = 75;
    __int16 v369 = 2082;
    v370 = "Unexpected CardAccess response";
    __int16 v371 = 2048;
    uint64_t v372 = [v301 length];
    _os_log_impl(&dword_1CA51A000, v305, OS_LOG_TYPE_DEFAULT, "%s:%i %{public}s %lu bytes", v365, 0x26u);
  }

  if (v304) {
    v304(6, "%s:%i %s %lu bytes :", "+[SecurityInfo securityInfoArrayFromData:]", 75, "Unexpected CardAccess response", [v301 length]);
  }
  if (v300)
  {
    uint64_t v306 = 0;
    do
    {
      unint64_t v307 = 0;
      v308 = (char *)&buf[__sprintf_chk((char *)buf, 0, 0x30uLL, "%04lX: ", v306)];
      do
      {
        unint64_t v309 = v307 + 1;
        unint64_t v310 = v307 + 1 + v306;
        int v311 = sprintf(v308, "0x%02X ", obja[v306 + v307]);
        if (v307 > 6) {
          break;
        }
        v308 += v311;
        ++v307;
      }
      while (v310 < v300);
      v312 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      if (NFSharedLogInitialize_onceToken != -1) {
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      }
      v313 = (id)_NFSharedLogClient[(void)v312];
      if (os_log_type_enabled(v313, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v365 = 136446210;
        v366 = (const char *)buf;
        _os_log_impl(&dword_1CA51A000, v313, OS_LOG_TYPE_DEFAULT, "%{public}s", v365, 0xCu);
      }

      if (v304) {
        v304(6, "%s", (const char *)buf);
      }
      v306 += v309;
    }
    while (v310 < v300);
  }
  v299 = 0;
  v298 = v349;
LABEL_346:

  return v299;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

@end