@interface NFLoyaltyAgent
- (BOOL)hasError;
- (BOOL)isComplete;
- (NFLoyaltyAgent)init;
- (id)getTransactionEvent;
- (id)handleAPDU:(id)a3;
- (id)handleSelect:(id)a3;
- (id)hostCards;
- (void)authorize:(id)a3 withToken:(id)a4;
- (void)handleDeselect;
- (void)requireEncryption:(BOOL)a3;
- (void)setHostCards:(id)a3;
- (void)supportPayment:(BOOL)a3;
@end

@implementation NFLoyaltyAgent

- (NFLoyaltyAgent)init
{
  v6.receiver = self;
  v6.super_class = (Class)NFLoyaltyAgent;
  v2 = [(NFLoyaltyAgent *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    sessionData = v2->_sessionData;
    v2->_sessionData = v3;

    v2->_mobileCaps = 30;
    v2->_state = 0;
    v2->_lastStatus = -28672;
  }
  return v2;
}

- (void)supportPayment:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v7(6, "%c[%{public}s %{public}s]:%i enable = %d", v10, ClassName, Name, 74, v3);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = object_getClass(self);
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    *(_DWORD *)buf = 67110146;
    int v18 = v13;
    __int16 v19 = 2082;
    v20 = object_getClassName(self);
    __int16 v21 = 2082;
    v22 = sel_getName(a2);
    __int16 v23 = 1024;
    int v24 = 74;
    __int16 v25 = 1024;
    BOOL v26 = v3;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i enable = %d", buf, 0x28u);
  }

  if (v3) {
    int v14 = 48;
  }
  else {
    int v14 = 16;
  }
  self->_mobileCaps = self->_mobileCaps & 0xFFFFFFCF | v14;
}

- (void)requireEncryption:(BOOL)a3
{
  self->_mobileCaps = self->_mobileCaps & 0xFFFFFFFC | !a3;
}

- (BOOL)hasError
{
  return self->_state == 4;
}

- (BOOL)isComplete
{
  return self->_state == 3;
}

- (id)getTransactionEvent
{
  BOOL v3 = [NFValueAddedServiceTransaction alloc];
  v4 = sub_1000733D4((uint64_t)self);
  v5 = [(NFValueAddedServiceTransaction *)v3 initWithDictionary:v4];

  return v5;
}

- (void)authorize:(id)a3 withToken:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  sessionData = self->_sessionData;
  if (v11)
  {
    [(NSMutableDictionary *)self->_sessionData setObject:v11 forKey:@"PassData"];
  }
  else
  {
    v8 = objc_opt_new();
    [(NSMutableDictionary *)sessionData setObject:v8 forKey:@"PassData"];
  }
  v9 = self->_sessionData;
  if (v6)
  {
    [(NSMutableDictionary *)v9 setObject:v6 forKey:@"Token"];
  }
  else
  {
    uint64_t v10 = objc_opt_new();
    [(NSMutableDictionary *)v9 setObject:v10 forKey:@"Token"];
  }
}

- (void)setHostCards:(id)a3
{
}

- (id)hostCards
{
  return self->_cardInfo;
}

- (id)handleSelect:(id)a3
{
  id v4 = a3;
  if (sub_100075828((BOOL)self, v4))
  {
    self->_state = 0;
    +[NFGeneralStatisticsCALogger updateAnalyticsGeneralTransactionStatistics:&off_100322C40];
    v5 = sub_100072E64((unsigned int *)self, v4);
    id v6 = +[NFResponseAPDU responseWithData:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)handleAPDU:(id)a3
{
  id v5 = a3;
  self->_uint64_t lastStatus = -28672;
  if (sub_100075828((BOOL)self, v5))
  {
    self->_state = 0;
    id v6 = sub_100072E64((unsigned int *)self, v5);
    v7 = +[NFResponseAPDU responseWithData:v6];

    goto LABEL_139;
  }
  if (![v5 isGetVasDataCommand])
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v72 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v76 = 45;
      if (isMetaClass) {
        uint64_t v76 = 43;
      }
      v72(4, "%c[%{public}s %{public}s]:%i Unrecognized VAS command", v76, ClassName, Name, 655);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v77 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
    {
      v78 = object_getClass(self);
      if (class_isMetaClass(v78)) {
        int v79 = 43;
      }
      else {
        int v79 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v194 = v79;
      __int16 v195 = 2082;
      v196 = object_getClassName(self);
      __int16 v197 = 2082;
      v198 = sel_getName(a2);
      __int16 v199 = 1024;
      int v200 = 655;
      _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unrecognized VAS command", buf, 0x22u);
    }

    *(_WORD *)buf = -32406;
    id v80 = [objc_alloc((Class)NSData) initWithBytes:buf length:2];
    goto LABEL_138;
  }
  [(NSMutableDictionary *)self->_sessionData removeObjectsForKeys:&off_100322778];
  self->_state = 1;
  id v8 = v5;
  unsigned int v9 = sub_10007379C((uint64_t)self, v8);
  self->_uint64_t lastStatus = v9;
  if (v9 != 36864)
  {
    unsigned int v81 = v9;
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v82 = NFLogGetLogger();
    if (v82)
    {
      v83 = (void (*)(uint64_t, const char *, ...))v82;
      v84 = object_getClass(self);
      BOOL v85 = class_isMetaClass(v84);
      v86 = object_getClassName(self);
      v169 = sel_getName("_handleGetVasData:");
      uint64_t v87 = 45;
      if (v85) {
        uint64_t v87 = 43;
      }
      v83(3, "%c[%{public}s %{public}s]:%i Get Vas Data request validation failed", v87, v86, v169, 436);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v88 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
    {
      v89 = object_getClass(self);
      if (class_isMetaClass(v89)) {
        int v90 = 43;
      }
      else {
        int v90 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v194 = v90;
      __int16 v195 = 2082;
      v196 = object_getClassName(self);
      __int16 v197 = 2082;
      v198 = sel_getName("_handleGetVasData:");
      __int16 v199 = 1024;
      int v200 = 436;
      _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Get Vas Data request validation failed", buf, 0x22u);
    }

    v91 = objc_opt_new();
    v92 = v91;
    if (v91)
    {
      *(_WORD *)buf = __rev16(v81);
      [v91 appendBytes:buf length:2];
    }
    self->_state = 4;
    uint64_t lastStatus = self->_lastStatus;
    goto LABEL_136;
  }
  if ([v8 p2])
  {
    if ([v8 p2] != 1)
    {
      v92 = 0;
      goto LABEL_135;
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v10 = NFLogGetLogger();
    if (v10)
    {
      id v11 = (void (*)(uint64_t, const char *, ...))v10;
      v12 = object_getClass(self);
      BOOL v13 = class_isMetaClass(v12);
      int v14 = object_getClassName(self);
      v15 = sel_getName("_handleGetVasData:");
      v16 = sub_1000733D4((uint64_t)self);
      uint64_t v17 = 45;
      if (v13) {
        uint64_t v17 = 43;
      }
      v11(6, "%c[%{public}s %{public}s]:%i Get Vas Data requested: %{public}@", v17, v14, v15, 457, v16);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v18 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v19 = object_getClass(self);
      if (class_isMetaClass(v19)) {
        int v20 = 43;
      }
      else {
        int v20 = 45;
      }
      __int16 v21 = object_getClassName(self);
      v22 = sel_getName("_handleGetVasData:");
      __int16 v23 = sub_1000733D4((uint64_t)self);
      *(_DWORD *)buf = 67110146;
      int v194 = v20;
      __int16 v195 = 2082;
      v196 = v21;
      __int16 v197 = 2082;
      v198 = v22;
      __int16 v199 = 1024;
      int v200 = 457;
      __int16 v201 = 2114;
      id v202 = v23;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Get Vas Data requested: %{public}@", buf, 0x2Cu);
    }
    int v24 = [(NSMutableDictionary *)self->_sessionData objectForKey:@"MerchantId"];
    v178 = [(NSMutableDictionary *)self->_sessionData objectForKey:@"Filter"];
    v179 = [(NSMutableDictionary *)self->_sessionData objectForKey:@"FilterType"];
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v25 = NFLogGetLogger();
    if (v25)
    {
      BOOL v26 = (void (*)(uint64_t, const char *, ...))v25;
      v27 = object_getClass(self);
      BOOL v28 = class_isMetaClass(v27);
      v161 = object_getClassName(self);
      v165 = sel_getName("_lookupHostCardForRequest");
      uint64_t v29 = 45;
      if (v28) {
        uint64_t v29 = 43;
      }
      v26(6, "%c[%{public}s %{public}s]:%i Requested merchant id = %{public}@", v29, v161, v165, 392, v24);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v30 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = object_getClass(self);
      if (class_isMetaClass(v31)) {
        int v32 = 43;
      }
      else {
        int v32 = 45;
      }
      v33 = object_getClassName(self);
      v34 = sel_getName("_lookupHostCardForRequest");
      *(_DWORD *)buf = 67110146;
      int v194 = v32;
      __int16 v195 = 2082;
      v196 = v33;
      __int16 v197 = 2082;
      v198 = v34;
      __int16 v199 = 1024;
      int v200 = 392;
      __int16 v201 = 2114;
      id v202 = v24;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Requested merchant id = %{public}@", buf, 0x2Cu);
    }

    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v35 = NFLogGetLogger();
    if (v35)
    {
      v36 = (void (*)(uint64_t, const char *, ...))v35;
      v37 = object_getClass(self);
      BOOL v38 = class_isMetaClass(v37);
      v39 = object_getClassName(self);
      v166 = sel_getName("_lookupHostCardForRequest");
      uint64_t v40 = 45;
      if (v38) {
        uint64_t v40 = 43;
      }
      v36(6, "%c[%{public}s %{public}s]:%i Filter %{public}@  FilterType %{public}@", v40, v39, v166, 393, v178, v179);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v41 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      v42 = object_getClass(self);
      if (class_isMetaClass(v42)) {
        int v43 = 43;
      }
      else {
        int v43 = 45;
      }
      v44 = object_getClassName(self);
      v45 = sel_getName("_lookupHostCardForRequest");
      *(_DWORD *)buf = 67110402;
      int v194 = v43;
      __int16 v195 = 2082;
      v196 = v44;
      __int16 v197 = 2082;
      v198 = v45;
      __int16 v199 = 1024;
      int v200 = 393;
      __int16 v201 = 2114;
      id v202 = v178;
      __int16 v203 = 2114;
      v204 = v179;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Filter %{public}@  FilterType %{public}@", buf, 0x36u);
    }

    long long v183 = 0u;
    long long v184 = 0u;
    long long v181 = 0u;
    long long v182 = 0u;
    v46 = self->_cardInfo;
    id v47 = [(NSArray *)v46 countByEnumeratingWithState:&v181 objects:buf count:16];
    v177 = v24;
    v48 = v179;
    if (v47)
    {
      id v49 = v47;
      id v174 = v8;
      uint64_t v50 = *(void *)v182;
      if (v178) {
        BOOL v51 = v179 == 0;
      }
      else {
        BOOL v51 = 1;
      }
      int v52 = !v51;
      int v176 = v52;
      while (2)
      {
        for (i = 0; i != v49; i = (char *)i + 1)
        {
          if (*(void *)v182 != v50) {
            objc_enumerationMutation(v46);
          }
          v54 = *(void **)(*((void *)&v181 + 1) + 8 * i);
          v55 = [v54 identifier];
          unsigned int v56 = [v24 isEqualToData:v55];

          if (v56)
          {
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            uint64_t v57 = NFLogGetLogger();
            if (v57)
            {
              v58 = (void (*)(uint64_t, const char *, ...))v57;
              v59 = object_getClass(self);
              BOOL v60 = class_isMetaClass(v59);
              v61 = object_getClassName(self);
              v167 = sel_getName("_lookupHostCardForRequest");
              uint64_t v62 = 45;
              if (v60) {
                uint64_t v62 = 43;
              }
              v162 = v61;
              int v24 = v177;
              v58(6, "%c[%{public}s %{public}s]:%i merchant id match", v62, v162, v167, 398);
            }
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v63 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
            {
              v64 = object_getClass(self);
              if (class_isMetaClass(v64)) {
                int v65 = 43;
              }
              else {
                int v65 = 45;
              }
              v66 = object_getClassName(self);
              v67 = sel_getName("_lookupHostCardForRequest");
              *(_DWORD *)v185 = 67109890;
              int v186 = v65;
              __int16 v187 = 2082;
              v188 = v66;
              int v24 = v177;
              __int16 v189 = 2082;
              v190 = v67;
              __int16 v191 = 1024;
              int v192 = 398;
              _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i merchant id match", v185, 0x22u);
            }

            if (!v176)
            {
LABEL_90:
              id v70 = v54;
              goto LABEL_91;
            }
            if ([v179 intValue] == 1)
            {
              unsigned int v68 = [v178 intValue];
              if (v68 == [v54 type]) {
                goto LABEL_90;
              }
            }
            else
            {
              if ([v179 intValue] != 2) {
                goto LABEL_90;
              }
              unsigned int v69 = [v178 intValue];
              if (([v54 type] & v69) != 0) {
                goto LABEL_90;
              }
            }
          }
        }
        id v49 = [(NSArray *)v46 countByEnumeratingWithState:&v181 objects:buf count:16];
        if (v49) {
          continue;
        }
        break;
      }
      id v70 = 0;
LABEL_91:
      id v8 = v174;
      v48 = v179;
    }
    else
    {
      id v70 = 0;
    }

    if (self->_cardInfo)
    {
      if (v70)
      {
        unsigned int v97 = [v70 userInterventionRequired];
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v98 = NFLogGetLogger();
        v99 = (void (*)(uint64_t, const char *, ...))v98;
        if (!v97)
        {
          if (v98)
          {
            v136 = object_getClass(self);
            BOOL v137 = class_isMetaClass(v136);
            v164 = object_getClassName(self);
            v173 = sel_getName("_handleGetVasData:");
            uint64_t v138 = 45;
            if (v137) {
              uint64_t v138 = 43;
            }
            v99(6, "%c[%{public}s %{public}s]:%i Found HostCard for transaction: %{public}@", v138, v164, v173, 484, v70);
          }
          id v175 = v8;
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v139 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v139, OS_LOG_TYPE_DEFAULT))
          {
            v140 = object_getClass(self);
            if (class_isMetaClass(v140)) {
              int v141 = 43;
            }
            else {
              int v141 = 45;
            }
            v142 = object_getClassName(self);
            v143 = sel_getName("_handleGetVasData:");
            *(_DWORD *)buf = 67110146;
            int v194 = v141;
            __int16 v195 = 2082;
            v196 = v142;
            __int16 v197 = 2082;
            v198 = v143;
            __int16 v199 = 1024;
            int v200 = 484;
            __int16 v201 = 2114;
            id v202 = v70;
            _os_log_impl((void *)&_mh_execute_header, v139, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Found HostCard for transaction: %{public}@", buf, 0x2Cu);
          }

          v144 = [v70 data];
          v145 = [v70 token];
          [(NFLoyaltyAgent *)self authorize:v144 withToken:v145];

          v146 = [(NSMutableDictionary *)self->_sessionData objectForKey:@"PassData"];
          SEL sel = (SEL)[v146 length];
          id v147 = v146;
          v148 = objc_opt_new();
          v149 = [(NSMutableDictionary *)self->_sessionData objectForKey:@"Token"];
          v150 = +[NFTLV TLVWithTag:40746 value:v149];
          [v148 addObject:v150];
          id v151 = [v147 length];
          unint64_t v152 = (unint64_t)v151;
          if ((unint64_t)v151 >= 0xC0) {
            uint64_t v153 = 192;
          }
          else {
            uint64_t v153 = (uint64_t)v151;
          }
          id v154 = v147;
          id v155 = [v154 bytes];

          if (v153)
          {
            if (v152 >= 0x80) {
              uint64_t v153 = 128;
            }
            else {
              uint64_t v153 = v152;
            }
            id v156 = [objc_alloc((Class)NSData) initWithBytes:v155 length:v153];

            uint64_t v157 = +[NFTLV TLVWithTag:40743 value:v156];

            [v148 addObject:v157];
            v150 = (void *)v157;
            v149 = v156;
          }
          v158 = +[NFTLV TLVWithTag:112 children:v148];

          v159 = [v158 asMutableData];
          v92 = v159;
          if (sel == (SEL)v153)
          {
            id v8 = v175;
            if (v159)
            {
              *(_WORD *)buf = 144;
              [v159 appendBytes:buf length:2];
            }
            unsigned __int8 v160 = 3;
          }
          else
          {
            id v8 = v175;
            if (v159)
            {
              *(_WORD *)buf = __rev16(((_BYTE)sel - v153) | 0x6100);
              [v159 appendBytes:buf length:2];
            }
            unsigned __int8 v160 = 2;
          }
          self->_state = v160;

          goto LABEL_134;
        }
        if (v98)
        {
          v100 = object_getClass(self);
          BOOL v101 = class_isMetaClass(v100);
          v163 = object_getClassName(self);
          v170 = sel_getName("_handleGetVasData:");
          uint64_t v102 = 45;
          if (v101) {
            uint64_t v102 = 43;
          }
          v99(6, "%c[%{public}s %{public}s]:%i HostCard requires user intervention: %{public}@", v102, v163, v170, 477, v70);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v103 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
        {
          v104 = object_getClass(self);
          if (class_isMetaClass(v104)) {
            int v105 = 43;
          }
          else {
            int v105 = 45;
          }
          v106 = object_getClassName(self);
          v107 = sel_getName("_handleGetVasData:");
          *(_DWORD *)buf = 67110146;
          int v194 = v105;
          __int16 v195 = 2082;
          v196 = v106;
          __int16 v197 = 2082;
          v198 = v107;
          __int16 v199 = 1024;
          int v200 = 477;
          __int16 v201 = 2114;
          id v202 = v70;
          _os_log_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i HostCard requires user intervention: %{public}@", buf, 0x2Cu);
        }

        v108 = objc_opt_new();
        v92 = v108;
        if (v108)
        {
          *(_WORD *)buf = -31639;
          [v108 appendBytes:buf length:2];
        }
        unsigned __int16 v109 = 27012;
LABEL_133:
        self->_uint64_t lastStatus = v109;
        self->_state = 4;
LABEL_134:

        goto LABEL_135;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v124 = NFLogGetLogger();
      if (v124)
      {
        v125 = (void (*)(uint64_t, const char *, ...))v124;
        v126 = object_getClass(self);
        BOOL v127 = class_isMetaClass(v126);
        v128 = object_getClassName(self);
        v172 = sel_getName("_handleGetVasData:");
        uint64_t v129 = 45;
        if (v127) {
          uint64_t v129 = 43;
        }
        v125(6, "%c[%{public}s %{public}s]:%i No matching loyalty card found", v129, v128, v172, 489);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v130 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v130, OS_LOG_TYPE_DEFAULT))
      {
        v131 = object_getClass(self);
        if (class_isMetaClass(v131)) {
          int v132 = 43;
        }
        else {
          int v132 = 45;
        }
        v133 = object_getClassName(self);
        v134 = sel_getName("_handleGetVasData:");
        *(_DWORD *)buf = 67109890;
        int v194 = v132;
        __int16 v195 = 2082;
        v196 = v133;
        __int16 v197 = 2082;
        v198 = v134;
        __int16 v199 = 1024;
        int v200 = 489;
        _os_log_impl((void *)&_mh_execute_header, v130, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i No matching loyalty card found", buf, 0x22u);
      }

      v92 = objc_opt_new();
      if (!v92)
      {
LABEL_132:
        unsigned __int16 v109 = 27267;
        goto LABEL_133;
      }
    }
    else
    {
      v110 = [(NSMutableDictionary *)self->_sessionData objectForKey:@"LastRequest"];
      unsigned int v111 = [v110 BOOLValue];

      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v112 = NFLogGetLogger();
      if (v112)
      {
        v113 = (void (*)(uint64_t, const char *, ...))v112;
        v114 = object_getClass(self);
        BOOL v115 = class_isMetaClass(v114);
        v116 = object_getClassName(self);
        v171 = sel_getName("_handleGetVasData:");
        uint64_t v117 = 45;
        if (v115) {
          uint64_t v117 = 43;
        }
        v113(6, "%c[%{public}s %{public}s]:%i No loyalty cards authorized", v117, v116, v171, 464);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v118 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
      {
        v119 = object_getClass(self);
        if (class_isMetaClass(v119)) {
          int v120 = 43;
        }
        else {
          int v120 = 45;
        }
        v121 = object_getClassName(self);
        v122 = sel_getName("_handleGetVasData:");
        *(_DWORD *)buf = 67109890;
        int v194 = v120;
        __int16 v195 = 2082;
        v196 = v121;
        __int16 v197 = 2082;
        v198 = v122;
        __int16 v199 = 1024;
        int v200 = 464;
        _os_log_impl((void *)&_mh_execute_header, v118, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i No loyalty cards authorized", buf, 0x22u);
      }

      v123 = objc_opt_new();
      v92 = v123;
      if (v111)
      {
        if (v123)
        {
          *(_WORD *)buf = -30878;
          [v123 appendBytes:buf length:2];
        }
        unsigned __int16 v109 = 25223;
        goto LABEL_133;
      }
      if (!v123) {
        goto LABEL_132;
      }
    }
    *(_WORD *)buf = -31894;
    [v92 appendBytes:buf length:2];
    goto LABEL_132;
  }
  sessionData = self->_sessionData;
  v95 = +[NSNumber numberWithShort:1];
  [(NSMutableDictionary *)sessionData setObject:v95 forKey:@"TerminalMode"];

  v96 = objc_opt_new();
  v92 = v96;
  if (v96)
  {
    *(_WORD *)buf = 144;
    [v96 appendBytes:buf length:2];
  }
  self->_state = 3;
  +[NFGeneralStatisticsCALogger updateAnalyticsGeneralTransactionStatistics:&off_100322C18];
LABEL_135:
  uint64_t lastStatus = self->_lastStatus;
  if (lastStatus != 36864) {
LABEL_136:
  }
    +[NFExceptionsCALogger postAnalyticsVASTransactionException:1 withSWStatus:lastStatus];
  id v80 = v92;

LABEL_138:
  v7 = +[NFResponseAPDU responseWithData:v80];

LABEL_139:

  return v7;
}

- (void)handleDeselect
{
  if (self->_state == 3) {
    +[NFGeneralStatisticsCALogger updateAnalyticsGeneralTransactionStatistics:&off_100322C68];
  }
  self->_state = 0;
  self->_isSelected = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionData, 0);

  objc_storeStrong((id *)&self->_cardInfo, 0);
}

@end