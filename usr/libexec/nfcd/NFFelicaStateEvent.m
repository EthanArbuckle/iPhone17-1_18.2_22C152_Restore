@interface NFFelicaStateEvent
+ (id)decodeEvent:(id)a3;
+ (id)decodeEvent:(id)a3 reverse:(BOOL)a4;
+ (id)decodeLogEvent:(id)a3;
+ (id)decodeProvider:(id)a3 service:(id)a4 blocks:(id)a5;
- (BOOL)isEmpty;
- (NFFelicaStateEvent)init;
- (id)asDictionary;
- (void)addStateInfo:(id)a3 appletAID:(id)a4;
@end

@implementation NFFelicaStateEvent

+ (id)decodeEvent:(id)a3
{
  return +[NFFelicaStateEvent decodeEvent:a3 reverse:0];
}

+ (id)decodeEvent:(id)a3 reverse:(BOOL)a4
{
  BOOL v132 = a4;
  id v4 = a3;
  v5 = objc_opt_new();
  v138 = objc_opt_new();
  v147 = objc_opt_new();
  v133 = v4;
  +[NFTLV simpleTLVsWithTag:225 fromData:v4];
  long long v164 = 0u;
  long long v165 = 0u;
  long long v166 = 0u;
  long long v167 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  v142 = v5;
  id v136 = [obj countByEnumeratingWithState:&v164 objects:v171 count:16];
  v6 = 0;
  v7 = 0;
  if (v136)
  {
    unsigned int v143 = 255;
    uint64_t v135 = *(void *)v165;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v165 != v135)
        {
          uint64_t v9 = v8;
          objc_enumerationMutation(obj);
          uint64_t v8 = v9;
        }
        uint64_t v137 = v8;
        v10 = *(void **)(*((void *)&v164 + 1) + 8 * v8);
        long long v160 = 0u;
        long long v161 = 0u;
        long long v162 = 0u;
        long long v163 = 0u;
        id v139 = [v10 children];
        id v141 = [v139 countByEnumeratingWithState:&v160 objects:v170 count:16];
        if (v141)
        {
          uint64_t v140 = *(void *)v161;
          do
          {
            uint64_t v11 = 0;
            do
            {
              if (*(void *)v161 != v140)
              {
                uint64_t v12 = v11;
                objc_enumerationMutation(v139);
                uint64_t v11 = v12;
              }
              uint64_t v144 = v11;
              v13 = *(void **)(*((void *)&v160 + 1) + 8 * v11);
              if ([v13 tag] == 209)
              {
                id v14 = [v13 value];
                v15 = (unsigned __int8 *)[v14 bytes];

                v16 = +[NSNumber numberWithUnsignedChar:*v15];
                [v5 setObject:v16 forKeyedSubscript:@"NFServiceProviderID"];
              }
              if ([v13 tag] == 210)
              {
                v17 = [v13 value];
                v18 = [v17 NF_asHexString];
                [v5 setObject:v18 forKeyedSubscript:@"NFDPAN"];
              }
              id v149 = v13;
              if ([v13 tag] == 219)
              {
                unsigned int v19 = [v13 valueAsUnsignedShort];
                v20 = +[NSNumber numberWithInt:v19 & 1];
                [v5 setObject:v20 forKeyedSubscript:@"NFInStation"];

                v21 = +[NSNumber numberWithInt:(v19 >> 1) & 1];
                [v5 setObject:v21 forKeyedSubscript:@"NFInStationShinkansen"];
              }
              if ([v13 tag] == 220)
              {
                v22 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v13 valueAsUnsignedShort]);
                [v5 setObject:v22 forKeyedSubscript:@"NFTicketUsed"];
              }
              if ([v13 tag] == 221)
              {
                v23 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v13 valueAsUnsignedShort]);
                [v5 setObject:v23 forKeyedSubscript:@"NFBlacklisted"];

                v24 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v13 valueAsUnsignedShort]);
                [v5 setObject:v24 forKeyedSubscript:@"NFRevoked"];
              }
              unsigned int v25 = [v13 tag];
              if ((v25 & 0xFFFFFFFC) == 0xD4 || v25 - 216 <= 7 && ((1 << (v25 + 40)) & 0xC7) != 0)
              {
                if ([v13 tag] <= v143)
                {
                  uint64_t v26 = objc_opt_new();

                  [v138 addObject:v26];
                  v6 = 0;
                  v7 = (void *)v26;
                }
                unsigned int v143 = [v13 tag];
              }
              if ([v13 tag] == 212)
              {
                v27 = [v13 value];
                id v28 = [v27 length];

                if ((unint64_t)v28 >= 4)
                {
                  id v31 = [v13 value];
                  v29 = [v31 bytes];

                  uint64_t v30 = 0;
                  LODWORD(v31) = 0;
                  do
                  {
                    id v31 = (id)((v29[v30] & 0xF) + 100 * (int)v31 + 10 * (v29[v30] >> 4));
                    ++v30;
                  }
                  while (v30 != 2);
                  unsigned int v32 = v29[2];
                  unsigned int v33 = v29[3];
                  if (!v6) {
                    v6 = objc_opt_new();
                  }
                  [v6 setYear:v31];
                  [v6 setMonth:(v32 & 0xF) + 10 * (v32 >> 4)];
                  [v6 setDay:(v33 & 0xF) + 10 * (v33 >> 4)];
                  [v7 setObject:v6 forKeyedSubscript:@"NFTransactionDate"];
                  v13 = v149;
                }
              }
              if ([v13 tag] == 213)
              {
                v34 = [v13 value];
                id v35 = [v34 length];

                if ((unint64_t)v35 >= 2)
                {
                  if (!v6) {
                    v6 = objc_opt_new();
                  }
                  id v36 = [v13 value];
                  v37 = (unsigned __int8 *)[v36 bytes];

                  uint64_t v38 = (v37[1] & 0xF) + 10 * (v37[1] >> 4);
                  [v6 setHour:(*v37 & 0xF) + 10 * (*v37 >> 4)];
                  [v6 setMinute:v38];
                  [v7 setObject:v6 forKeyedSubscript:@"NFTransactionDate"];
                }
              }
              if ([v13 tag] == 214)
              {
                v39 = [v13 value];
                id v40 = [v39 length];

                if ((unint64_t)v40 >= 5)
                {
                  id v41 = [v13 value];
                  v42 = (unsigned int *)[v41 bytes];

                  uint64_t v43 = bswap32(*v42);
                  int v44 = *((unsigned __int8 *)v42 + 4);
                  if (v44 == 2)
                  {
                    v45 = +[NSNumber numberWithUnsignedInt:v43];
                    v46 = v7;
                    v47 = v45;
                    CFStringRef v48 = @"NFLoyaltyBalance";
                    goto LABEL_45;
                  }
                  if (v44 == 1)
                  {
                    v45 = +[NSNumber numberWithUnsignedInt:v43];
                    v46 = v7;
                    v47 = v45;
                    CFStringRef v48 = @"NFBalance";
LABEL_45:
                    [v46 setObject:v47 forKeyedSubscript:v48];
                  }
                }
              }
              if ([v13 tag] == 215)
              {
                v49 = [v13 value];
                id v50 = [v49 length];

                if ((unint64_t)v50 >= 5)
                {
                  id v51 = [v13 value];
                  v52 = (unsigned __int8 *)[v51 bytes];

                  int v53 = (char)*v52;
                  unsigned int v54 = (v52[1] << 16) & 0x80FFFFFF | ((v53 & 0x7F) << 24) | (v52[2] << 8) | v52[3];
                  if (v53 >= 0) {
                    uint64_t v55 = v54;
                  }
                  else {
                    uint64_t v55 = -v54;
                  }
                  uint64_t v56 = v52[4];
                  v57 = +[NSNumber numberWithInt:v55];
                  [v7 setObject:v57 forKeyedSubscript:@"NFAmount"];

                  v13 = v149;
                  v58 = +[NSNumber numberWithUnsignedChar:v56];
                  [v7 setObject:v58 forKeyedSubscript:@"NFAmountType"];
                }
              }
              v145 = v6;
              if ([v13 tag] == 216)
              {
                id v59 = [v13 value];
                v60 = (unsigned __int8 *)[v59 bytes];

                v61 = +[NSNumber numberWithUnsignedChar:*v60];
                [v7 setObject:v61 forKeyedSubscript:@"NFTransactionType"];

                v13 = v149;
                v62 = +[NSNumber numberWithUnsignedChar:v60[1]];
                [v7 setObject:v62 forKeyedSubscript:@"NFSectorCombination"];

                v63 = [v5 objectForKeyedSubscript:@"NFServiceProviderID"];
                LODWORD(v60) = [&off_10031C210 isEqualToNumber:v63];

                if (v60)
                {
                  long long v158 = 0u;
                  long long v159 = 0u;
                  long long v156 = 0u;
                  long long v157 = 0u;
                  id v64 = v147;
                  id v65 = [v64 countByEnumeratingWithState:&v156 objects:v169 count:16];
                  if (!v65) {
                    goto LABEL_67;
                  }
                  id v66 = v65;
                  uint64_t v67 = *(void *)v157;
                  while (1)
                  {
                    for (i = 0; i != v66; i = (char *)i + 1)
                    {
                      if (*(void *)v157 != v67) {
                        objc_enumerationMutation(v64);
                      }
                      v69 = *(void **)(*((void *)&v156 + 1) + 8 * i);
                      v70 = [v69 objectForKeyedSubscript:@"NFServiceCode"];
                      if ([v70 isEqualToString:@"0x090c"])
                      {
                      }
                      else
                      {
                        v71 = [v69 objectForKeyedSubscript:@"NFServiceCode"];
                        unsigned int v72 = [v71 isEqualToString:@"0x090f"];

                        if (!v72) {
                          continue;
                        }
                      }
                      v73 = [v69 objectForKeyedSubscript:@"NFBlockData"];
                      if ((unint64_t)[v73 length] >= 3)
                      {
                        v74 = [v73 bytes];
                        v75 = +[NSNumber numberWithUnsignedLongLong:(unint64_t)v74[1] >> 7];
                        [v7 setObject:v75 forKeyedSubscript:@"NFSFBreakdown"];

                        v76 = +[NSNumber numberWithUnsignedLongLong:*v74 & 0x7F];
                        [v7 setObject:v76 forKeyedSubscript:@"NFDeviceCode"];

                        v77 = +[NSNumber numberWithUnsignedLongLong:v74[2] & 0x7F];
                        [v7 setObject:v77 forKeyedSubscript:@"NFPaymentType"];
                      }
                    }
                    id v66 = [v64 countByEnumeratingWithState:&v156 objects:v169 count:16];
                    if (!v66)
                    {
LABEL_67:

                      v5 = v142;
                      v13 = v149;
                      break;
                    }
                  }
                }
              }
              if ([v13 tag] == 217)
              {
                v78 = [v13 value];
                id v79 = [v78 length];

                if ((unint64_t)v79 >= 3)
                {
                  id v80 = [v13 value];
                  v81 = (unsigned __int16 *)[v80 bytes];

                  uint64_t v82 = bswap32(*v81) >> 16;
                  uint64_t v83 = *((unsigned __int8 *)v81 + 2);
                  v13 = v149;
                  if (v82 || v83)
                  {
                    v84 = [v149 value];
                    [v7 setObject:v84 forKeyedSubscript:@"NFStartStationData"];

                    v85 = +[NSNumber numberWithUnsignedShort:v82];
                    [v7 setObject:v85 forKeyedSubscript:@"NFStartStation"];

                    v13 = v149;
                    v86 = +[NSNumber numberWithUnsignedChar:v83];
                    [v7 setObject:v86 forKeyedSubscript:@"NFStartStationExt"];
                  }
                }
              }
              if ([v13 tag] == 218)
              {
                v87 = [v13 value];
                id v88 = [v87 length];

                if ((unint64_t)v88 >= 3)
                {
                  id v89 = [v13 value];
                  v90 = (unsigned __int16 *)[v89 bytes];

                  uint64_t v91 = bswap32(*v90) >> 16;
                  uint64_t v92 = *((unsigned __int8 *)v90 + 2);
                  v13 = v149;
                  if (v91 || v92)
                  {
                    v93 = [v149 value];
                    [v7 setObject:v93 forKeyedSubscript:@"NFEndStationData"];

                    v94 = +[NSNumber numberWithUnsignedShort:v91];
                    [v7 setObject:v94 forKeyedSubscript:@"NFEndStation"];

                    v13 = v149;
                    v95 = +[NSNumber numberWithUnsignedChar:v92];
                    [v7 setObject:v95 forKeyedSubscript:@"NFEndStationExt"];
                  }
                }
              }
              if ([v13 tag] == 222)
              {
                v96 = [v13 value];
                id v97 = [v96 mutableCopy];

                if ((int)[v97 length] <= 31) {
                  [v97 increaseLengthBy:(32 - [v97 length])];
                }
                v98 = [v5 objectForKeyedSubscript:@"NFServiceProviderID"];
                if (([v98 isEqualToNumber:&off_10031C228] & 1) == 0)
                {
                  v99 = [v97 NF_asHexString];
                  [v7 setObject:v99 forKeyedSubscript:@"NFTransactionID"];

                  v13 = v149;
                }
              }
              if ([v13 tag] == 223)
              {
                v100 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v13 valueAsUnsignedLong]);
                [v7 setObject:v100 forKeyedSubscript:@"NFHistorySequenceNumber"];
              }
              if ([v13 tag] == 208)
              {
                v101 = [v13 value];
                unsigned int v150 = [v101 length];

                id v102 = [v13 value];
                v103 = [v102 bytes];

                unsigned int v104 = *v103;
                if (*v103)
                {
                  if (v150)
                  {
                    unsigned int v105 = 1;
                    uint64_t v106 = 1;
                    do
                    {
                      v107 = objc_opt_new();
                      id v108 = [objc_alloc((Class)NSString) initWithFormat:@"0x%04x", *(unsigned __int16 *)&v103[v106]];
                      [v107 setObject:v108 forKeyedSubscript:@"NFServiceCode"];

                      id v109 = [objc_alloc((Class)NSString) initWithFormat:@"0x%04x", *(unsigned __int16 *)&v103[v106 + 2]];
                      [v107 setObject:v109 forKeyedSubscript:@"NFBlockNumber"];

                      id v110 = [objc_alloc((Class)NSData) initWithBytes:&v103[v106 + 4] length:16];
                      [v107 setObject:v110 forKeyedSubscript:@"NFBlockData"];

                      [v147 addObject:v107];
                      if (v105 >= v104) {
                        break;
                      }
                      unsigned int v111 = v106 + 19;
                      v106 += 20;
                      ++v105;
                    }
                    while (v111 < v150);
                  }
                }
              }
              v6 = v145;
              uint64_t v11 = v144 + 1;
              v5 = v142;
            }
            while ((id)(v144 + 1) != v141);
            id v141 = [v139 countByEnumeratingWithState:&v160 objects:v170 count:16];
          }
          while (v141);
        }

        uint64_t v8 = v137 + 1;
      }
      while ((id)(v137 + 1) != v136);
      id v136 = [obj countByEnumeratingWithState:&v164 objects:v171 count:16];
    }
    while (v136);
  }

  v112 = [v5 objectForKeyedSubscript:@"NFServiceProviderID"];
  if (!v112 || ![&off_10031C210 isEqualToNumber:v112]) {
    goto LABEL_112;
  }
  v146 = v112;
  long long v154 = 0u;
  long long v155 = 0u;
  long long v152 = 0u;
  long long v153 = 0u;
  id v151 = v147;
  id v113 = [v151 countByEnumeratingWithState:&v152 objects:v168 count:16];
  if (!v113) {
    goto LABEL_111;
  }
  id v114 = v113;
  uint64_t v115 = *(void *)v153;
  do
  {
    v116 = 0;
    id v148 = v114;
    do
    {
      v117 = v6;
      if (*(void *)v153 != v115) {
        objc_enumerationMutation(v151);
      }
      v118 = *(void **)(*((void *)&v152 + 1) + 8 * (void)v116);
      v119 = [v118 objectForKeyedSubscript:@"NFServiceCode"];
      if ([v119 isEqualToString:@"0x0088"])
      {

        v6 = v117;
      }
      else
      {
        v120 = [v118 objectForKeyedSubscript:@"NFServiceCode"];
        unsigned int v121 = [v120 isEqualToString:@"0x008b"];

        v6 = v117;
        if (!v121) {
          goto LABEL_109;
        }
      }
      v122 = [v118 objectForKeyedSubscript:@"NFBlockData"];
      if ((unint64_t)[v122 length] >= 0xD)
      {
        v123 = (char *)[v122 bytes];
        v124 = +[NSNumber numberWithInt:*(unsigned __int16 *)(v123 + 11) | (v123[13] << 16)];
        [v142 setObject:v124 forKeyedSubscript:@"NFBalance"];

        LODWORD(v124) = v123[8];
        v125 = +[NSNumber numberWithInt:(v124 >> 4) & 1];
        [v142 setObject:v125 forKeyedSubscript:@"NFNotifyOnLowBalance"];

        id v114 = v148;
        uint64_t v126 = (v124 >> 5) & 1;
        v6 = v117;
        v127 = +[NSNumber numberWithInt:v126];
        [v142 setObject:v127 forKeyedSubscript:@"NFAllowBalanceUsageForCommute"];
      }
LABEL_109:
      v116 = (char *)v116 + 1;
    }
    while (v114 != v116);
    id v114 = [v151 countByEnumeratingWithState:&v152 objects:v168 count:16];
  }
  while (v114);
LABEL_111:

  v5 = v142;
  v112 = v146;
LABEL_112:
  if (v132)
  {
    v128 = [v138 reverseObjectEnumerator];
    v129 = [v128 allObjects];
    [v5 setObject:v129 forKeyedSubscript:@"NFHistoryRecords"];
  }
  else
  {
    [v5 setObject:v138 forKeyedSubscript:@"NFHistoryRecords"];
  }
  if ([v147 count]) {
    [v5 setObject:v147 forKeyedSubscript:@"NFBlocks"];
  }
  id v130 = v5;

  return v130;
}

+ (id)decodeProvider:(id)a3 service:(id)a4 blocks:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (([v9 isEqualToNumber:&off_10031C210] & 1) == 0)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v28 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      uint64_t v32 = 45;
      if (isMetaClass) {
        uint64_t v32 = 43;
      }
      v28(6, "%c[%{public}s %{public}s]:%i Unsupported provider", v32, ClassName, Name, 385);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v23 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_36;
    }
    unsigned int v33 = object_getClass(a1);
    if (class_isMetaClass(v33)) {
      int v34 = 43;
    }
    else {
      int v34 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v78 = v34;
    __int16 v79 = 2082;
    id v80 = object_getClassName(a1);
    __int16 v81 = 2082;
    uint64_t v82 = sel_getName(a2);
    __int16 v83 = 1024;
    int v84 = 385;
    uint64_t v26 = "%c[%{public}s %{public}s]:%i Unsupported provider";
    goto LABEL_35;
  }
  if (!v11)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v35 = NFLogGetLogger();
    if (v35)
    {
      id v36 = (void (*)(uint64_t, const char *, ...))v35;
      v37 = object_getClass(a1);
      BOOL v38 = class_isMetaClass(v37);
      v39 = object_getClassName(a1);
      v74 = sel_getName(a2);
      uint64_t v40 = 45;
      if (v38) {
        uint64_t v40 = 43;
      }
      v36(6, "%c[%{public}s %{public}s]:%i Missing data", v40, v39, v74, 390);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v23 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_36;
    }
    id v41 = object_getClass(a1);
    if (class_isMetaClass(v41)) {
      int v42 = 43;
    }
    else {
      int v42 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v78 = v42;
    __int16 v79 = 2082;
    id v80 = object_getClassName(a1);
    __int16 v81 = 2082;
    uint64_t v82 = sel_getName(a2);
    __int16 v83 = 1024;
    int v84 = 390;
    uint64_t v26 = "%c[%{public}s %{public}s]:%i Missing data";
    goto LABEL_35;
  }
  id v12 = [v11 objectAtIndexedSubscript:0];
  v13 = v12;
  if (!v12 || (id v14 = v12, v15 = [v14 bytes], !objc_msgSend(v14, "length")))
  {
LABEL_8:

    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v17 = NFLogGetLogger();
    if (v17)
    {
      v18 = (void (*)(uint64_t, const char *, ...))v17;
      unsigned int v19 = object_getClass(a1);
      BOOL v20 = class_isMetaClass(v19);
      v21 = object_getClassName(a1);
      unsigned int v72 = sel_getName(a2);
      uint64_t v22 = 45;
      if (v20) {
        uint64_t v22 = 43;
      }
      v18(6, "%c[%{public}s %{public}s]:%i Block not valid", v22, v21, v72, 395);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v23 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_36;
    }
    v24 = object_getClass(a1);
    if (class_isMetaClass(v24)) {
      int v25 = 43;
    }
    else {
      int v25 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v78 = v25;
    __int16 v79 = 2082;
    id v80 = object_getClassName(a1);
    __int16 v81 = 2082;
    uint64_t v82 = sel_getName(a2);
    __int16 v83 = 1024;
    int v84 = 395;
    uint64_t v26 = "%c[%{public}s %{public}s]:%i Block not valid";
LABEL_35:
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v26, buf, 0x22u);
LABEL_36:
    id v43 = 0;
LABEL_37:

    goto LABEL_38;
  }
  uint64_t v16 = 0;
  while (!v15[v16])
  {
    if (++v16 >= (unint64_t)[v14 length]) {
      goto LABEL_8;
    }
  }

  if ([v10 isEqualToNumber:&off_10031C240])
  {
    v23 = objc_opt_new();
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v45 = NFLogGetLogger();
    if (v45)
    {
      v46 = (void (*)(uint64_t, const char *, ...))v45;
      v47 = object_getClass(a1);
      BOOL v48 = class_isMetaClass(v47);
      v49 = object_getClassName(a1);
      v75 = sel_getName(a2);
      uint64_t v50 = 45;
      if (v48) {
        uint64_t v50 = 43;
      }
      v46(6, "%c[%{public}s %{public}s]:%i Decoding green car block", v50, v49, v75, 401);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v51 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      v52 = object_getClass(a1);
      if (class_isMetaClass(v52)) {
        int v53 = 43;
      }
      else {
        int v53 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v78 = v53;
      __int16 v79 = 2082;
      id v80 = object_getClassName(a1);
      __int16 v81 = 2082;
      uint64_t v82 = sel_getName(a2);
      __int16 v83 = 1024;
      int v84 = 401;
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Decoding green car block", buf, 0x22u);
    }

    id v76 = [v11 objectAtIndexedSubscript:0];
    unsigned int v54 = (unsigned __int8 *)[v76 bytes];
    id v55 = [objc_alloc((Class)NSData) initWithBytes:v54 length:2];
    if ((objc_msgSend(v55, "NF_isZeroed") & 1) == 0) {
      [v23 setObject:v55 forKeyedSubscript:@"NFStartStationData"];
    }
    id v56 = [objc_alloc((Class)NSData) initWithBytes:v54 + 2 length:2];

    if ((objc_msgSend(v56, "NF_isZeroed") & 1) == 0) {
      [v23 setObject:v56 forKeyedSubscript:@"NFEndStationData"];
    }
    unint64_t v57 = v54[4];
    unsigned int v58 = v54[5];
    id v59 = objc_opt_new();
    [v59 setYear:(v57 >> 1) + 2000];
    [v59 setMonth:((unint64_t)(v58 | (v57 << 8)) >> 5) & 0xF];
    [v59 setDay:v58 & 0x1F];
    [v23 setObject:v59 forKeyedSubscript:@"NFPurchaseDate"];
    uint64_t v60 = 0;
    LODWORD(v61) = 0;
    do
      unint64_t v61 = v54[v60++ + 6] | (v61 << 8);
    while (v60 != 3);
    v62 = +[NSNumber numberWithUnsignedLongLong:(v61 >> 13) & 0x3F];
    [v23 setObject:v62 forKeyedSubscript:@"NFMinuteSold"];

    v63 = +[NSNumber numberWithUnsignedLongLong:(v61 >> 19) & 0x1F];
    [v23 setObject:v63 forKeyedSubscript:@"NFHourSold"];

    id v64 = +[NSNumber numberWithUnsignedShort:10 * v54[9]];
    [v23 setObject:v64 forKeyedSubscript:@"NFFare"];

    id v65 = [objc_alloc((Class)NSData) initWithBytes:v54 + 12 length:2];
    [v23 setObject:v65 forKeyedSubscript:@"NFRefundStation"];

    unint64_t v66 = v54[14];
    unsigned int v67 = v54[15];
    unint64_t v68 = v67 | (v66 << 8);
    v69 = +[NSNumber numberWithUnsignedLongLong:v67 & 1];
    [v23 setObject:v69 forKeyedSubscript:@"NFTicketUsed"];

    v70 = +[NSNumber numberWithUnsignedLongLong:(v68 >> 5) & 0x3F];
    [v23 setObject:v70 forKeyedSubscript:@"NFRefundDay"];

    v71 = +[NSNumber numberWithUnsignedLongLong:v66 >> 3];
    [v23 setObject:v71 forKeyedSubscript:@"NFRefundMonth"];

    id v43 = [objc_alloc((Class)NSDictionary) initWithObjectsAndKeys:v23, @"NFGreenCarTicket", 0];
    goto LABEL_37;
  }
  id v43 = 0;
LABEL_38:

  return v43;
}

+ (id)decodeLogEvent:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  v85 = v3;
  +[NFTLV simpleTLVsWithTag:225 fromData:v3];
  long long v102 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v92 = v4;
  id v90 = [v5 countByEnumeratingWithState:&v102 objects:v118 count:16];
  if (v90)
  {
    uint64_t v88 = *(void *)v103;
    id v89 = v5;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v103 != v88) {
          objc_enumerationMutation(v5);
        }
        uint64_t v91 = v6;
        v7 = *(void **)(*((void *)&v102 + 1) + 8 * v6);
        long long v98 = 0u;
        long long v99 = 0u;
        long long v100 = 0u;
        long long v101 = 0u;
        id obj = [v7 children];
        id v8 = [obj countByEnumeratingWithState:&v98 objects:v117 count:16];
        if (v8)
        {
          id v9 = v8;
          uint64_t v10 = *(void *)v99;
          do
          {
            for (i = 0; i != v9; i = (char *)i + 1)
            {
              if (*(void *)v99 != v10) {
                objc_enumerationMutation(obj);
              }
              id v12 = *(void **)(*((void *)&v98 + 1) + 8 * i);
              uint64_t v13 = [v12 value];
              if (v13)
              {
                id v14 = (void *)v13;
                v15 = [v12 value];
                id v16 = [v15 length];

                if (v16)
                {
                  id v17 = [objc_alloc((Class)NSString) initWithFormat:@"%02x", [v12 tag]];
                  v18 = [v12 value];
                  [v4 setObject:v18 forKeyedSubscript:v17];

                  id v19 = [v12 value];
                  BOOL v20 = (unsigned __int8 *)[v19 bytes];

                  if ([v12 tag] == 216)
                  {
                    v21 = [v12 value];
                    id v22 = [v21 length];

                    if ((unint64_t)v22 >= 0xE
                      && ([v12 value],
                          v23 = objc_claimAutoreleasedReturnValue(),
                          uint64_t v24 = ((void)[v23 length] << 32) - 0x900000000,
                          v23,
                          v24))
                    {
                      id v25 = [objc_alloc((Class)NSData) initWithBytes:v20 length:v24 >> 32];
                      uint64_t v26 = [v25 NF_asHexString];
                      [v92 setObject:v26 forKeyedSubscript:@"AID"];

                      v27 = &v20[v24 >> 32];
                      id v28 = [objc_alloc((Class)NSData) initWithBytes:v27 length:8];
                      v29 = [v28 NF_asHexString];
                      [v92 setObject:v29 forKeyedSubscript:@"IDM"];

                      id v4 = v92;
                      id v30 = objc_alloc((Class)NSString);
                      unsigned int v31 = v27[8];
                      BOOL v20 = v27 + 8;
                      id v32 = [v30 initWithFormat:@"%02x", v31];
                      [v92 setObject:v32 forKeyedSubscript:@"Command Code"];
                    }
                    else
                    {
                      id v4 = v92;
                    }
                  }
                  if ([v12 tag] == 217)
                  {
                    id v33 = [objc_alloc((Class)NSString) initWithFormat:@"%02x", *v20];
                    [v4 setObject:v33 forKeyedSubscript:@"Success Response Code"];
                  }
                  if ([v12 tag] == 218)
                  {
                    id v34 = [objc_alloc((Class)NSString) initWithFormat:@"%02x", *v20];
                    [v4 setObject:v34 forKeyedSubscript:@"External error no response"];
                  }
                  if ([v12 tag] == 219)
                  {
                    id v35 = [objc_alloc((Class)NSString) initWithFormat:@"%02x", *v20];
                    [v4 setObject:v35 forKeyedSubscript:@"External error"];
                  }
                  if ([v12 tag] == 220)
                  {
                    id v36 = [v12 value];
                    id v37 = [v36 length];

                    BOOL v38 = (unint64_t)v37 >= 9;
                    id v4 = v92;
                    if (v38)
                    {
                      id v39 = [objc_alloc((Class)NSData) initWithBytes:v20 + 1 length:8];
                      [v92 setObject:v39 forKeyedSubscript:@"Additional Debug Info"];
                    }
                  }
                }
              }
            }
            id v9 = [obj countByEnumeratingWithState:&v98 objects:v117 count:16];
          }
          while (v9);
        }

        uint64_t v6 = v91 + 1;
        id v5 = v89;
      }
      while ((id)(v91 + 1) != v90);
      id v90 = [v89 countByEnumeratingWithState:&v102 objects:v118 count:16];
    }
    while (v90);
  }

  if (![v4 count])
  {
    uint64_t v40 = &AMFDRSealingMapCopyLocalData_ptr;
    id v41 = +[NFTLV simpleTLVsWithData:v85];

    long long v96 = 0u;
    long long v97 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    id v5 = v41;
    id v42 = [v5 countByEnumeratingWithState:&v94 objects:v116 count:16];
    if (!v42) {
      goto LABEL_62;
    }
    id v43 = v42;
    uint64_t v44 = *(void *)v95;
    while (1)
    {
      for (j = 0; j != v43; j = (char *)j + 1)
      {
        if (*(void *)v95 != v44) {
          objc_enumerationMutation(v5);
        }
        v46 = *(void **)(*((void *)&v94 + 1) + 8 * (void)j);
        if ([v46 tag] == 129)
        {
          v47 = [v46 asData];
          BOOL v48 = [v47 NF_asHexString];
          [v4 setObject:v48 forKeyedSubscript:@"AID"];
        }
        if ([v46 tag] == 130)
        {
          uint64_t v49 = [v46 children];
          if (v49)
          {
            uint64_t v50 = (void *)v49;
            id v51 = [v46 children];
            id v52 = [v51 count];

            if (v52)
            {
              int v53 = [v46 children];
              unsigned int v54 = [v53 objectAtIndexedSubscript:0];

              id v55 = [v54 asData];
              id v56 = [v55 NF_asHexString];
              id v4 = v92;
              [v92 setObject:v56 forKeyedSubscript:@"Command Code"];
              goto LABEL_57;
            }
          }
          unint64_t v57 = v40[424];
          unsigned int v58 = [v46 asData];
          unsigned int v54 = [v57 simpleTLVsWithData:v58];

          if (v54 && [v54 count])
          {
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            uint64_t Logger = NFLogGetLogger();
            if (Logger)
            {
              uint64_t v60 = (void (*)(uint64_t, const char *, ...))Logger;
              Class = object_getClass(a1);
              BOOL isMetaClass = class_isMetaClass(Class);
              ClassName = object_getClassName(a1);
              Name = sel_getName(a2);
              uint64_t v64 = 45;
              if (isMetaClass) {
                uint64_t v64 = 43;
              }
              v60(6, "%c[%{public}s %{public}s]:%i Found parameter event in sub data", v64, ClassName, Name, 730);
            }
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            id v65 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
            {
              unint64_t v66 = object_getClass(a1);
              if (class_isMetaClass(v66)) {
                int v67 = 43;
              }
              else {
                int v67 = 45;
              }
              unint64_t v68 = object_getClassName(a1);
              v69 = sel_getName(a2);
              *(_DWORD *)buf = 67109890;
              int v107 = v67;
              __int16 v108 = 2082;
              id v109 = v68;
              __int16 v110 = 2082;
              unsigned int v111 = v69;
              __int16 v112 = 1024;
              int v113 = 730;
              _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Found parameter event in sub data", buf, 0x22u);
            }

            id v55 = [v54 objectAtIndexedSubscript:0];
            id v56 = [v55 asData];
            v70 = [v56 NF_asHexString];
            [v92 setObject:v70 forKeyedSubscript:@"Command Code"];

            id v4 = v92;
            uint64_t v40 = &AMFDRSealingMapCopyLocalData_ptr;
LABEL_57:
          }
          else
          {
            id v4 = v92;
          }

          continue;
        }
      }
      id v43 = [v5 countByEnumeratingWithState:&v94 objects:v116 count:16];
      if (!v43)
      {
LABEL_62:

        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v71 = NFLogGetLogger();
        if (v71)
        {
          unsigned int v72 = (void (*)(uint64_t, const char *, ...))v71;
          v73 = object_getClass(a1);
          BOOL v74 = class_isMetaClass(v73);
          uint64_t v82 = object_getClassName(a1);
          int v84 = sel_getName(a2);
          uint64_t v75 = 45;
          if (v74) {
            uint64_t v75 = 43;
          }
          id v4 = v92;
          v72(6, "%c[%{public}s %{public}s]:%i %{public}@", v75, v82, v84, 738, v92);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        id v76 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
        {
          v77 = object_getClass(a1);
          if (class_isMetaClass(v77)) {
            int v78 = 43;
          }
          else {
            int v78 = 45;
          }
          __int16 v79 = object_getClassName(a1);
          id v80 = sel_getName(a2);
          *(_DWORD *)buf = 67110146;
          int v107 = v78;
          __int16 v108 = 2082;
          id v109 = v79;
          __int16 v110 = 2082;
          unsigned int v111 = v80;
          __int16 v112 = 1024;
          int v113 = 738;
          __int16 v114 = 2114;
          uint64_t v115 = v4;
          _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
        }

        break;
      }
    }
  }

  return v4;
}

- (NFFelicaStateEvent)init
{
  v6.receiver = self;
  v6.super_class = (Class)NFFelicaStateEvent;
  v2 = [(NFFelicaStateEvent *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    stateEvents = v2->_stateEvents;
    v2->_stateEvents = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)addStateInfo:(id)a3 appletAID:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  id v7 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v14];
  [v7 setObject:v6 forKey:@"NFAppletAID"];
  uint64_t v8 = [(NSMutableDictionary *)self->_stateEvents valueForKey:v6];
  if (!v8)
  {
    id v9 = objc_opt_new();
    [(NSMutableDictionary *)self->_stateEvents setObject:v9 forKey:v6];
    [v9 addEntriesFromDictionary:v7];
    goto LABEL_11;
  }
  id v9 = (void *)v8;
  [v7 removeObjectForKey:@"NFHistoryRecords"];
  [v9 addEntriesFromDictionary:v7];
  uint64_t v10 = [v9 objectForKey:@"NFHistoryRecords"];
  uint64_t v11 = [v14 objectForKey:@"NFHistoryRecords"];
  id v12 = (void *)v11;
  if (v10 && v11)
  {
    id v13 = [objc_alloc((Class)NSMutableArray) initWithArray:v11];
    [v13 addObjectsFromArray:v10];
    if (!v13) {
      goto LABEL_10;
    }
  }
  else
  {
    if (!v11) {
      goto LABEL_10;
    }
    id v13 = [objc_alloc((Class)NSMutableArray) initWithArray:v11];
    if (!v13) {
      goto LABEL_10;
    }
  }
  [v9 setObject:v13 forKey:@"NFHistoryRecords"];

LABEL_10:
LABEL_11:
}

- (id)asDictionary
{
  return self->_stateEvents;
}

- (BOOL)isEmpty
{
  return [(NSMutableDictionary *)self->_stateEvents count] == 0;
}

- (void).cxx_destruct
{
}

@end