@interface NFRemoteAdminReaderSession
- (BOOL)_checkForCathayIngestion;
- (BOOL)_closeSession;
- (BOOL)_executePreCheckScripts:(id)a3;
- (BOOL)_preValidateCardForCathay;
- (BOOL)_preValidateCardForMercury;
- (BOOL)_validateCard;
- (BOOL)_validateCardForFelica;
- (BOOL)_validateCardForMercury:(id)a3;
- (BOOL)_validateCardForMiFare:(id)a3;
- (BOOL)reconnectTag;
- (BOOL)startNewSession;
- (NFRemoteAdminReaderSession)initWithState:(id)a3 oneTimeConnection:(BOOL)a4 secureElementManagerSession:(id)a5;
- (id)_gatherCardStateInfo;
- (id)_getRequireServiceV1List;
- (id)_getSessionSystemCode;
- (id)connectTagWithTimeout:(unint64_t)a3;
- (id)getNextRequest;
- (id)sessionCardServiceInfo;
- (unint64_t)_doFinalTSMCheckIn;
- (unint64_t)_doInitialRequest;
- (unint64_t)_doReaderModeRedirect;
- (unint64_t)_openSession;
- (unint64_t)_performReaderModeRequest;
- (unint64_t)executeScript:(id)a3;
- (unint64_t)run;
- (unsigned)_generateRandomNumber:(unsigned int)a3 endingWith:(unsigned int)a4;
- (unsigned)targetTagType;
- (void)_checkForMercuryIngestion;
- (void)_fireCardIngestionStatus:(unint64_t)a3;
- (void)_restoreRFSettingForCathayIngestion;
- (void)_restoreRFSettingForMercuryIngestion;
- (void)abort:(int64_t)a3;
- (void)processNotification:(id)a3;
- (void)readerSession:(id)a3 didDetectTags:(id)a4;
- (void)readerSessionDidEndUnexpectedly:(id)a3 reason:(id)a4;
@end

@implementation NFRemoteAdminReaderSession

- (NFRemoteAdminReaderSession)initWithState:(id)a3 oneTimeConnection:(BOOL)a4 secureElementManagerSession:(id)a5
{
  v16.receiver = self;
  v16.super_class = (Class)NFRemoteAdminReaderSession;
  v5 = [(NFRemoteAdminRedirectSession *)&v16 initWithState:a3 oneTimeConnection:a4 secureElementManagerSession:a5];
  if (v5)
  {
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    tagSem = v5->_tagSem;
    v5->_tagSem = (OS_dispatch_semaphore *)v6;

    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    sessionStartSem = v5->_sessionStartSem;
    v5->_sessionStartSem = (OS_dispatch_semaphore *)v8;

    uint64_t v10 = objc_opt_new();
    cardContents = v5->_cardContents;
    v5->_cardContents = (NSMutableDictionary *)v10;

    v5->_cardValidationStatus = 7;
    v12 = +[NFCALogger sharedCALogger];
    uint64_t v13 = [v12 generateUUID];
    sessionUUID = v5->_sessionUUID;
    v5->_sessionUUID = (NSData *)v13;

    v5->_cathayIngestionSessionInProgress = 0;
    v5->_mercuryIngestionSessionInProgress = 0;
    v5->_cardIngestionStatus = -1;
  }
  return v5;
}

- (id)sessionCardServiceInfo
{
  v2 = [(NFRemoteAdminRedirectSession *)self redirectState];
  v3 = [v2 requestInfo];

  v4 = [v3 cardServiceInfo];

  return v4;
}

- (unsigned)targetTagType
{
  v4 = [(NFRemoteAdminReaderSession *)self sessionCardServiceInfo];
  v5 = [v4 objectForKeyedSubscript:@"version"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0
    && ([v4 objectForKeyedSubscript:@"version"],
        v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 intValue],
        v7,
        v8 >= 3))
  {
    uint64_t v10 = [v4 NF_stringForKey:@"technology"];
    if ([v10 length])
    {
      unsigned int v9 = [v10 containsString:@"A"];
      if ([v10 containsString:@"B"]) {
        v9 |= 2u;
      }
      if ([v10 containsString:@"F"]) {
        v9 |= 4u;
      }
    }
    else
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        v12 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        uint64_t v16 = 45;
        if (isMetaClass) {
          uint64_t v16 = 43;
        }
        v12(4, "%c[%{public}s %{public}s]:%i Missing technology field.  Forcing TypeA", v16, ClassName, Name, 105);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v17 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = object_getClass(self);
        if (class_isMetaClass(v18)) {
          int v19 = 43;
        }
        else {
          int v19 = 45;
        }
        *(_DWORD *)buf = 67109890;
        int v23 = v19;
        __int16 v24 = 2082;
        v25 = object_getClassName(self);
        __int16 v26 = 2082;
        v27 = sel_getName(a2);
        __int16 v28 = 1024;
        int v29 = 105;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Missing technology field.  Forcing TypeA", buf, 0x22u);
      }

      unsigned int v9 = 1;
    }
  }
  else
  {
    unsigned int v9 = 4;
  }

  return v9;
}

- (unsigned)_generateRandomNumber:(unsigned int)a3 endingWith:(unsigned int)a4
{
  unsigned int v4 = a4;
  if (a3 <= a4)
  {
    unsigned int v17 = a4;
    unsigned int v4 = a3;
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      unsigned int v9 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v13 = 45;
      if (isMetaClass) {
        uint64_t v13 = 43;
      }
      v9(4, "%c[%{public}s %{public}s]:%i startingNumber > endingNumber. Swaping them!", v13, ClassName, Name, 115);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = object_getClass(self);
      if (class_isMetaClass(v15)) {
        int v16 = 43;
      }
      else {
        int v16 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v21 = v16;
      __int16 v22 = 2082;
      int v23 = object_getClassName(self);
      __int16 v24 = 2082;
      v25 = sel_getName(a2);
      __int16 v26 = 1024;
      int v27 = 115;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i startingNumber > endingNumber. Swaping them!", buf, 0x22u);
    }

    unsigned int v17 = a3;
  }
  return arc4random_uniform(v17 - v4) + v4;
}

- (id)_gatherCardStateInfo
{
  v2 = self;
  v3 = [(NFRemoteAdminReaderSession *)self sessionCardServiceInfo];
  unsigned int v4 = v3;
  p_isa = (id *)&v2->super.super.isa;
  if (v2->_cardValidationStatus == 14)
  {
    v5 = [v3 NF_arrayForKey:@"areaCodeList"];
    dispatch_semaphore_t v6 = [v4 NF_arrayForKey:@"blockDataList"];
    v7 = [v4 objectForKeyedSubscript:@"cardServiceId"];

    if (v7)
    {
      int v8 = [v4 objectForKeyedSubscript:@"cardServiceId"];
      [p_isa[10] setObject:v8 forKeyedSubscript:@"cardServiceId"];

      v2 = (NFRemoteAdminReaderSession *)p_isa;
    }
    readerSession = v2->_readerSession;
    uint64_t v10 = [(NFRemoteAdminReaderSession *)v2 _getSessionSystemCode];
    [(NFReaderSession *)readerSession felicaStateForSystemCode:v10 withRequestService:v5 withBlockReadList:v6 performSearchServiceCode:0];
    v12 = v11 = v2;

    v11->_cardValidationStatus = 0;
  }
  else
  {
    uint64_t v13 = objc_opt_new();
    v14 = [v4 NF_arrayForKey:@"stateGenerationScript"];
    v15 = [v4 valueForKey:@"stateGenerationScript"];

    if (!v15 || v14)
    {
      if (![v14 count])
      {
        __int16 v26 = v14;
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t Logger = NFLogGetLogger();
        if (Logger)
        {
          __int16 v28 = (void (*)(uint64_t, const char *, ...))Logger;
          Class = object_getClass(v2);
          BOOL isMetaClass = class_isMetaClass(Class);
          ClassName = object_getClassName(v2);
          Name = sel_getName(a2);
          uint64_t v32 = 45;
          if (isMetaClass) {
            uint64_t v32 = 43;
          }
          v28(4, "%c[%{public}s %{public}s]:%i Script is empty", v32, ClassName, Name, 160);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v33 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          v34 = object_getClass(v2);
          if (class_isMetaClass(v34)) {
            int v35 = 43;
          }
          else {
            int v35 = 45;
          }
          *(_DWORD *)buf = 67109890;
          int v198 = v35;
          __int16 v199 = 2082;
          v200 = object_getClassName(v2);
          __int16 v201 = 2082;
          v202 = sel_getName(a2);
          __int16 v203 = 1024;
          int v204 = 160;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Script is empty", buf, 0x22u);
        }

        v14 = v26;
      }
      long long v191 = 0u;
      long long v192 = 0u;
      long long v189 = 0u;
      long long v190 = 0u;
      id v36 = v14;
      id v37 = [v36 countByEnumeratingWithState:&v189 objects:v212 count:16];
      if (v37)
      {
        uint64_t v38 = *(void *)v190;
        v176 = v36;
        v177 = v13;
        v175 = v4;
        v173 = v14;
        uint64_t v171 = *(void *)v190;
        while (2)
        {
          uint64_t v39 = 0;
          id v172 = v37;
          do
          {
            if (*(void *)v190 != v38)
            {
              uint64_t v40 = v39;
              objc_enumerationMutation(v36);
              uint64_t v39 = v40;
            }
            uint64_t v174 = v39;
            v41 = *(void **)(*((void *)&v189 + 1) + 8 * v39);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              uint64_t v42 = NFLogGetLogger();
              if (v42)
              {
                v43 = (void (*)(uint64_t, const char *, ...))v42;
                v44 = object_getClass(v2);
                BOOL v45 = class_isMetaClass(v44);
                v46 = object_getClassName(v2);
                v47 = sel_getName(a2);
                uint64_t v167 = objc_opt_class();
                uint64_t v48 = 45;
                if (v45) {
                  uint64_t v48 = 43;
                }
                v43(3, "%c[%{public}s %{public}s]:%i Skipping invalid entry %{public}@", v48, v46, v47, 167, v167);
              }
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v49 = NFSharedLogGetLogger();
              if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
              {
                v50 = object_getClass(v2);
                if (class_isMetaClass(v50)) {
                  int v51 = 43;
                }
                else {
                  int v51 = 45;
                }
                v52 = object_getClassName(v2);
                v53 = sel_getName(a2);
                uint64_t v54 = objc_opt_class();
                *(_DWORD *)buf = 67110146;
                int v198 = v51;
                __int16 v199 = 2082;
                v200 = v52;
                __int16 v201 = 2082;
                v202 = v53;
                __int16 v203 = 1024;
                int v204 = 167;
                __int16 v205 = 2114;
                uint64_t v206 = v54;
                _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Skipping invalid entry %{public}@", buf, 0x2Cu);
              }
            }
            v184 = [v41 NF_stringForKey:@"command"];
            if (!v184)
            {
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              uint64_t v147 = NFLogGetLogger();
              if (v147)
              {
                v148 = (void (*)(uint64_t, const char *, ...))v147;
                v149 = object_getClass(v2);
                BOOL v150 = class_isMetaClass(v149);
                v151 = object_getClassName(v2);
                v166 = sel_getName(a2);
                uint64_t v152 = 45;
                if (v150) {
                  uint64_t v152 = 43;
                }
                v148(3, "%c[%{public}s %{public}s]:%i Invalid Command APDU. Bailing out now.", v152, v151, v166, 172);
              }
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v153 = NFSharedLogGetLogger();
              if (os_log_type_enabled(v153, OS_LOG_TYPE_ERROR))
              {
                v154 = object_getClass(v2);
                if (class_isMetaClass(v154)) {
                  int v155 = 43;
                }
                else {
                  int v155 = 45;
                }
                v156 = object_getClassName(v2);
                v157 = sel_getName(a2);
                *(_DWORD *)buf = 67109890;
                int v198 = v155;
                __int16 v199 = 2082;
                v200 = v156;
                __int16 v201 = 2082;
                v202 = v157;
                __int16 v203 = 1024;
                int v204 = 172;
                _os_log_impl((void *)&_mh_execute_header, v153, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid Command APDU. Bailing out now.", buf, 0x22u);
              }

              v2->_cardValidationStatus = 4;
LABEL_128:

              int v16 = v173;
              goto LABEL_129;
            }
            v55 = [v41 NF_arrayForKey:@"commandModifier"];
            long long v185 = 0u;
            long long v186 = 0u;
            long long v187 = 0u;
            long long v188 = 0u;
            id obj = v55;
            id v56 = [obj countByEnumeratingWithState:&v185 objects:v211 count:16];
            if (v56)
            {
              id v57 = v56;
              uint64_t v179 = *(void *)v186;
              while (2)
              {
                v58 = 0;
                uint64_t v59 = v179;
                do
                {
                  if (*(void *)v186 != v59) {
                    objc_enumerationMutation(obj);
                  }
                  v60 = *(void **)(*((void *)&v185 + 1) + 8 * (void)v58);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    v61 = [v60 NF_dictionaryForKey:@"random"];
                    if ([v61 count])
                    {
                      v62 = [v61 NF_numberForKey:@"length"];

                      BOOL v63 = v62 == 0;
                      if (v62)
                      {
                        v64 = [v61 objectForKey:@"length"];
                        v65 = (char *)[v64 integerValue];
                      }
                      else
                      {
                        v65 = 0;
                      }
                      v78 = [v61 NF_numberForKey:@"offset"];

                      if (v78)
                      {
                        v79 = [v61 objectForKey:@"offset"];
                        unint64_t v80 = (unint64_t)[v79 integerValue];

                        if ((v80 & 0x8000000000000000) != 0)
                        {
                          v81 = (char *)[v184 length] + v80;
                          if ((uint64_t)v81 < 0) {
                            goto LABEL_117;
                          }
                        }
                        else
                        {
                          v81 = (char *)v80;
                        }
                      }
                      else
                      {
                        v81 = 0;
                        unint64_t v80 = 0;
                        BOOL v63 = 1;
                      }
                      if (&v65[(void)v81] > [v184 length])
                      {
LABEL_117:
                        v180 = v65;
                        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                        uint64_t v133 = NFLogGetLogger();
                        v119 = v184;
                        if (v133)
                        {
                          v134 = (void (*)(uint64_t, const char *, ...))v133;
                          v135 = object_getClass(v2);
                          BOOL v136 = class_isMetaClass(v135);
                          v137 = object_getClassName(v2);
                          v138 = sel_getName(a2);
                          id v170 = [v184 length];
                          v165 = v138;
                          v2 = (NFRemoteAdminReaderSession *)p_isa;
                          uint64_t v139 = 43;
                          if (!v136) {
                            uint64_t v139 = 45;
                          }
                          v134(3, "%c[%{public}s %{public}s]:%i Validation Error: Invalid commandModificaiton length or offset: startingOffset = %ld, length = %ld, [theStateGenerationScriptApdus length] = %lu", v139, v137, v165, 238, v81, v65, v170);
                        }
                        v140 = v81;
                        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                        v126 = NFSharedLogGetLogger();
                        unsigned int v4 = v175;
                        v127 = v177;
                        if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
                        {
                          v141 = object_getClass(v2);
                          if (class_isMetaClass(v141)) {
                            int v142 = 43;
                          }
                          else {
                            int v142 = 45;
                          }
                          v143 = object_getClassName(p_isa);
                          v144 = sel_getName(a2);
                          id v145 = [v184 length];
                          *(_DWORD *)buf = 67110658;
                          int v198 = v142;
                          v2 = (NFRemoteAdminReaderSession *)p_isa;
                          __int16 v199 = 2082;
                          v200 = v143;
                          __int16 v201 = 2082;
                          v202 = v144;
                          __int16 v203 = 1024;
                          int v204 = 238;
                          __int16 v205 = 2048;
                          uint64_t v206 = (uint64_t)v140;
                          __int16 v207 = 2048;
                          v208 = v180;
                          __int16 v209 = 2048;
                          id v210 = v145;
LABEL_126:
                          _os_log_impl((void *)&_mh_execute_header, v126, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Validation Error: Invalid commandModificaiton length or offset: startingOffset = %ld, length = %ld, [theStateGenerationScriptApdus length] = %lu", buf, 0x40u);
                        }
LABEL_127:

                        v2->_cardValidationStatus = 4;
                        uint64_t v13 = v127;
                        goto LABEL_128;
                      }
                      v82 = [v61 NF_numberForKey:@"min"];

                      v178 = v81;
                      if (v82)
                      {
                        v83 = [v61 objectForKey:@"min"];
                        id v84 = [v83 intValue];
                      }
                      else
                      {
                        id v84 = 0;
                        BOOL v63 = 1;
                      }
                      v85 = [v61 NF_numberForKey:@"max"];

                      if (!v85
                        || ([v61 objectForKey:@"max"],
                            v86 = objc_claimAutoreleasedReturnValue(),
                            id v87 = [v86 intValue],
                            v86,
                            v2 = (NFRemoteAdminReaderSession *)p_isa,
                            v63))
                      {
                        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                        uint64_t v118 = NFLogGetLogger();
                        v119 = v184;
                        if (v118)
                        {
                          v120 = (void (*)(uint64_t, const char *, ...))v118;
                          v121 = object_getClass(v2);
                          BOOL v122 = class_isMetaClass(v121);
                          v123 = object_getClassName(v2);
                          v124 = sel_getName(a2);
                          id v169 = [v184 length];
                          v164 = v124;
                          v2 = (NFRemoteAdminReaderSession *)p_isa;
                          uint64_t v125 = 43;
                          if (!v122) {
                            uint64_t v125 = 45;
                          }
                          v120(3, "%c[%{public}s %{public}s]:%i Validation Error: Invalid commandModificaiton length or offset: startingOffset = %ld, length = %ld, [theStateGenerationScriptApdus length] = %lu", v125, v123, v164, 227, v81, v65, v169);
                        }
                        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                        v126 = NFSharedLogGetLogger();
                        unsigned int v4 = v175;
                        v127 = v177;
                        if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
                        {
                          v128 = object_getClass(v2);
                          if (class_isMetaClass(v128)) {
                            int v129 = 43;
                          }
                          else {
                            int v129 = 45;
                          }
                          v130 = object_getClassName(p_isa);
                          v131 = sel_getName(a2);
                          id v132 = [v184 length];
                          *(_DWORD *)buf = 67110658;
                          int v198 = v129;
                          v2 = (NFRemoteAdminReaderSession *)p_isa;
                          __int16 v199 = 2082;
                          v200 = v130;
                          __int16 v201 = 2082;
                          v202 = v131;
                          __int16 v203 = 1024;
                          int v204 = 227;
                          __int16 v205 = 2048;
                          uint64_t v206 = (uint64_t)v178;
                          __int16 v207 = 2048;
                          v208 = v65;
                          __int16 v209 = 2048;
                          id v210 = v132;
                          goto LABEL_126;
                        }
                        goto LABEL_127;
                      }
                      id v88 = [objc_alloc((Class)NSString) initWithFormat:@"%04X", objc_msgSend(p_isa, "_generateRandomNumber:endingWith:", v84, v87)];
                      uint64_t v89 = [v184 stringByReplacingCharactersInRange:v80 withString:v65];

                      v184 = (void *)v89;
                      uint64_t v59 = v179;
                    }
                  }
                  else
                  {
                    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                    uint64_t v66 = NFLogGetLogger();
                    if (v66)
                    {
                      v67 = (void (*)(uint64_t, const char *, ...))v66;
                      v68 = object_getClass(v2);
                      BOOL v69 = class_isMetaClass(v68);
                      v70 = object_getClassName(v2);
                      v71 = sel_getName(a2);
                      uint64_t v168 = objc_opt_class();
                      uint64_t v72 = 45;
                      if (v69) {
                        uint64_t v72 = 43;
                      }
                      v67(3, "%c[%{public}s %{public}s]:%i Element expected to be Dictionary, got %{public}@", v72, v70, v71, 184, v168);
                    }
                    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                    v61 = NFSharedLogGetLogger();
                    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
                    {
                      v73 = object_getClass(v2);
                      if (class_isMetaClass(v73)) {
                        int v74 = 43;
                      }
                      else {
                        int v74 = 45;
                      }
                      v75 = object_getClassName(v2);
                      v76 = sel_getName(a2);
                      uint64_t v77 = objc_opt_class();
                      *(_DWORD *)buf = 67110146;
                      int v198 = v74;
                      __int16 v199 = 2082;
                      v200 = v75;
                      __int16 v201 = 2082;
                      v202 = v76;
                      __int16 v203 = 1024;
                      int v204 = 184;
                      __int16 v205 = 2114;
                      uint64_t v206 = v77;
                      _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Element expected to be Dictionary, got %{public}@", buf, 0x2Cu);
                    }
                  }

                  v58 = (char *)v58 + 1;
                }
                while (v57 != v58);
                id v57 = [obj countByEnumeratingWithState:&v185 objects:v211 count:16];
                uint64_t v13 = v177;
                if (v57) {
                  continue;
                }
                break;
              }
            }

            v90 = +[NSData NF_dataWithHexString:v184];
            unsigned int v4 = v175;
            if ([v90 length])
            {
              v91 = [(NFReaderSession *)v2->_readerSession transceive:v90];
              uint64_t v92 = [v91 NF_asHexString];
              v93 = (void *)v92;
              if (v92)
              {
                if (v184)
                {
                  v195[0] = @"command";
                  v195[1] = @"response";
                  v196[0] = v184;
                  v196[1] = v92;
                  v94 = +[NSDictionary dictionaryWithObjects:v196 forKeys:v195 count:2];
                  [v177 addObject:v94];
                }
                int v95 = 0;
              }
              else
              {
                dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                uint64_t v107 = NFLogGetLogger();
                if (v107)
                {
                  v108 = (void (*)(uint64_t, const char *, ...))v107;
                  v109 = object_getClass(v2);
                  BOOL v110 = class_isMetaClass(v109);
                  v111 = object_getClassName(v2);
                  v163 = sel_getName(a2);
                  uint64_t v112 = 45;
                  if (v110) {
                    uint64_t v112 = 43;
                  }
                  v159 = v111;
                  v2 = (NFRemoteAdminReaderSession *)p_isa;
                  v108(3, "%c[%{public}s %{public}s]:%i Invalid Response APDU. Bailing out now.", v112, v159, v163, 255);
                }
                dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                v113 = NFSharedLogGetLogger();
                if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
                {
                  v114 = object_getClass(v2);
                  if (class_isMetaClass(v114)) {
                    int v115 = 43;
                  }
                  else {
                    int v115 = 45;
                  }
                  v116 = object_getClassName(v2);
                  v117 = sel_getName(a2);
                  *(_DWORD *)buf = 67109890;
                  int v198 = v115;
                  __int16 v199 = 2082;
                  v200 = v116;
                  __int16 v201 = 2082;
                  v202 = v117;
                  __int16 v203 = 1024;
                  int v204 = 255;
                  _os_log_impl((void *)&_mh_execute_header, v113, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid Response APDU. Bailing out now.", buf, 0x22u);
                }

                v2->_cardValidationStatus = 5;
                int v95 = 1;
              }

              uint64_t v13 = v177;
            }
            else
            {
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              uint64_t v96 = NFLogGetLogger();
              if (v96)
              {
                v97 = (void (*)(uint64_t, const char *, ...))v96;
                v98 = object_getClass(v2);
                BOOL v99 = class_isMetaClass(v98);
                v100 = object_getClassName(v2);
                v162 = sel_getName(a2);
                uint64_t v101 = 45;
                if (v99) {
                  uint64_t v101 = 43;
                }
                v158 = v100;
                v2 = (NFRemoteAdminReaderSession *)p_isa;
                v97(3, "%c[%{public}s %{public}s]:%i Invalid Command APDU. Bailing out now.", v101, v158, v162, 247);
              }
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v102 = NFSharedLogGetLogger();
              if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
              {
                v103 = object_getClass(v2);
                if (class_isMetaClass(v103)) {
                  int v104 = 43;
                }
                else {
                  int v104 = 45;
                }
                v105 = object_getClassName(v2);
                v106 = sel_getName(a2);
                *(_DWORD *)buf = 67109890;
                int v198 = v104;
                __int16 v199 = 2082;
                v200 = v105;
                __int16 v201 = 2082;
                v202 = v106;
                __int16 v203 = 1024;
                int v204 = 247;
                _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid Command APDU. Bailing out now.", buf, 0x22u);
              }

              v2->_cardValidationStatus = 4;
              int v95 = 1;
            }

            if (v95) {
              goto LABEL_128;
            }
            uint64_t v39 = v174 + 1;
            uint64_t v38 = v171;
            id v36 = v176;
          }
          while ((id)(v174 + 1) != v172);
          id v37 = [v176 countByEnumeratingWithState:&v189 objects:v212 count:16];
          if (v37) {
            continue;
          }
          break;
        }
      }

      CFStringRef v193 = @"data";
      v194 = v13;
      v12 = +[NSDictionary dictionaryWithObjects:&v194 forKeys:&v193 count:1];
    }
    else
    {
      int v16 = 0;
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v17 = NFLogGetLogger();
      if (v17)
      {
        v18 = (void (*)(uint64_t, const char *, ...))v17;
        int v19 = object_getClass(v2);
        BOOL v20 = class_isMetaClass(v19);
        int v21 = object_getClassName(v2);
        v160 = sel_getName(a2);
        uint64_t v22 = 45;
        if (v20) {
          uint64_t v22 = 43;
        }
        v18(3, "%c[%{public}s %{public}s]:%i Invalid Command APDU. Bailing out now.", v22, v21, v160, 156);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v23 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        __int16 v24 = object_getClass(v2);
        if (class_isMetaClass(v24)) {
          int v25 = 43;
        }
        else {
          int v25 = 45;
        }
        *(_DWORD *)buf = 67109890;
        int v198 = v25;
        __int16 v199 = 2082;
        v200 = object_getClassName(v2);
        __int16 v201 = 2082;
        v202 = sel_getName(a2);
        __int16 v203 = 1024;
        int v204 = 156;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid Command APDU. Bailing out now.", buf, 0x22u);
      }

      v2->_cardValidationStatus = 4;
LABEL_129:

      v12 = 0;
    }
  }

  return v12;
}

- (BOOL)_validateCardForFelica
{
  if ([(NFTag *)self->_tag technology] != 4)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      __int16 v24 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      id v77 = [(NFTag *)self->_tag technology];
      uint64_t v29 = 45;
      if (isMetaClass) {
        uint64_t v29 = 43;
      }
      v24(4, "%c[%{public}s %{public}s]:%i Unsupported tag, technology=%d", v29, ClassName, Name, 280, v77);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v30 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v31 = object_getClass(self);
      if (class_isMetaClass(v31)) {
        int v32 = 43;
      }
      else {
        int v32 = 45;
      }
      v33 = object_getClassName(self);
      v34 = sel_getName(a2);
      unsigned int v35 = [(NFTag *)self->_tag technology];
      *(_DWORD *)buf = 67110146;
      int v101 = v32;
      __int16 v102 = 2082;
      v103 = v33;
      __int16 v104 = 2082;
      v105 = v34;
      __int16 v106 = 1024;
      int v107 = 280;
      __int16 v108 = 1024;
      unsigned int v109 = v35;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unsupported tag, technology=%d", buf, 0x28u);
    }

    BOOL v21 = 0;
    self->_cardValidationStatus = 2;
    return v21;
  }
  unsigned int v4 = [(NFRemoteAdminReaderSession *)self _getSessionSystemCode];
  if (!v4)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v46 = NFLogGetLogger();
    if (v46)
    {
      v47 = (void (*)(uint64_t, const char *, ...))v46;
      uint64_t v48 = object_getClass(self);
      BOOL v49 = class_isMetaClass(v48);
      v50 = object_getClassName(self);
      v75 = sel_getName(a2);
      uint64_t v51 = 45;
      if (v49) {
        uint64_t v51 = 43;
      }
      v47(4, "%c[%{public}s %{public}s]:%i Missing system code definition", v51, v50, v75, 287);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v52 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      v53 = object_getClass(self);
      if (class_isMetaClass(v53)) {
        int v54 = 43;
      }
      else {
        int v54 = 45;
      }
      v55 = object_getClassName(self);
      id v56 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v101 = v54;
      __int16 v102 = 2082;
      v103 = v55;
      __int16 v104 = 2082;
      v105 = v56;
      __int16 v106 = 1024;
      int v107 = 287;
      _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Missing system code definition", buf, 0x22u);
    }

    BOOL v21 = 0;
    unint64_t v22 = 10;
    goto LABEL_52;
  }
  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  v5 = [(NFTag *)self->_tag allSystemCodes];
  id v6 = [v5 countByEnumeratingWithState:&v93 objects:v99 count:16];
  if (!v6) {
    goto LABEL_11;
  }
  id v7 = v6;
  uint64_t v8 = *(void *)v94;
  while (2)
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(void *)v94 != v8) {
        objc_enumerationMutation(v5);
      }
      if ([*(id *)(*((void *)&v93 + 1) + 8 * i) isEqualToData:v4])
      {

        id v36 = +[NSData NF_dataWithHexString:@"FFFF"];
        id v37 = [(NFRemoteAdminReaderSession *)self _getRequireServiceV1List];
        if (![v37 count])
        {
LABEL_67:
          self->_cardValidationStatus = 14;
          BOOL v21 = 1;
LABEL_79:

          goto LABEL_80;
        }
        readerSession = self->_readerSession;
        id v92 = 0;
        uint64_t v39 = [(NFReaderSession *)readerSession felicaRequestService:v37 error:&v92];
        id v40 = v92;
        if (v40)
        {
LABEL_54:
          id v57 = self->_readerSession;
          id v87 = v40;
          v58 = [(NFReaderSession *)v57 felicaRequestService:v37 forSystemCode:v4 error:&v87];
          id v59 = v87;

          if (v59)
          {
            self->_cardValidationStatus = 12;
LABEL_78:

            BOOL v21 = 0;
            goto LABEL_79;
          }
          v81 = v37;
          v82 = v39;
          long long v85 = 0u;
          long long v86 = 0u;
          long long v83 = 0u;
          long long v84 = 0u;
          unint64_t v80 = v58;
          id v41 = v58;
          id v60 = [v41 countByEnumeratingWithState:&v83 objects:v97 count:16];
          if (v60)
          {
            id v61 = v60;
            uint64_t v62 = *(void *)v84;
            while (2)
            {
              for (j = 0; j != v61; j = (char *)j + 1)
              {
                if (*(void *)v84 != v62) {
                  objc_enumerationMutation(v41);
                }
                if ([*(id *)(*((void *)&v83 + 1) + 8 * (void)j) isEqualToData:v36])
                {
                  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                  uint64_t v64 = NFLogGetLogger();
                  if (v64)
                  {
                    v65 = (void (*)(uint64_t, const char *, ...))v64;
                    uint64_t v66 = object_getClass(self);
                    BOOL v78 = class_isMetaClass(v66);
                    v67 = object_getClassName(self);
                    v76 = sel_getName(a2);
                    uint64_t v68 = 45;
                    if (v78) {
                      uint64_t v68 = 43;
                    }
                    v65(4, "%c[%{public}s %{public}s]:%i Require service not found", v68, v67, v76, 336);
                  }
                  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                  BOOL v69 = NFSharedLogGetLogger();
                  v58 = v80;
                  if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
                  {
                    v70 = object_getClass(self);
                    if (class_isMetaClass(v70)) {
                      int v71 = 43;
                    }
                    else {
                      int v71 = 45;
                    }
                    v79 = object_getClassName(self);
                    uint64_t v72 = sel_getName(a2);
                    *(_DWORD *)buf = 67109890;
                    int v101 = v71;
                    __int16 v102 = 2082;
                    v103 = v79;
                    __int16 v104 = 2082;
                    v105 = v72;
                    __int16 v106 = 1024;
                    int v107 = 336;
                    _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Require service not found", buf, 0x22u);
                  }

                  self->_cardValidationStatus = 13;
                  id v37 = v81;
                  uint64_t v39 = v82;
                  goto LABEL_78;
                }
              }
              id v61 = [v41 countByEnumeratingWithState:&v83 objects:v97 count:16];
              if (v61) {
                continue;
              }
              break;
            }
          }
        }
        else
        {
          long long v90 = 0u;
          long long v91 = 0u;
          long long v88 = 0u;
          long long v89 = 0u;
          v82 = v39;
          id v41 = v39;
          id v42 = [v41 countByEnumeratingWithState:&v88 objects:v98 count:16];
          if (!v42)
          {
LABEL_66:

            goto LABEL_67;
          }
          id v43 = v42;
          v81 = v37;
          uint64_t v44 = *(void *)v89;
          while (2)
          {
            for (k = 0; k != v43; k = (char *)k + 1)
            {
              if (*(void *)v89 != v44) {
                objc_enumerationMutation(v41);
              }
              if ([*(id *)(*((void *)&v88 + 1) + 8 * (void)k) isEqualToData:v36])
              {

                id v37 = v81;
                uint64_t v39 = v82;
                goto LABEL_54;
              }
            }
            id v43 = [v41 countByEnumeratingWithState:&v88 objects:v98 count:16];
            if (v43) {
              continue;
            }
            break;
          }
        }
        id v37 = v81;
        goto LABEL_66;
      }
    }
    id v7 = [v5 countByEnumeratingWithState:&v93 objects:v99 count:16];
    if (v7) {
      continue;
    }
    break;
  }
LABEL_11:

  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v10 = NFLogGetLogger();
  if (v10)
  {
    v11 = (void (*)(uint64_t, const char *, ...))v10;
    v12 = object_getClass(self);
    BOOL v13 = class_isMetaClass(v12);
    v14 = object_getClassName(self);
    int v74 = sel_getName(a2);
    uint64_t v15 = 45;
    if (v13) {
      uint64_t v15 = 43;
    }
    v11(4, "%c[%{public}s %{public}s]:%i Card system code mismatch for the session", v15, v14, v74, 301);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  int v16 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    uint64_t v17 = object_getClass(self);
    if (class_isMetaClass(v17)) {
      int v18 = 43;
    }
    else {
      int v18 = 45;
    }
    int v19 = object_getClassName(self);
    BOOL v20 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    int v101 = v18;
    __int16 v102 = 2082;
    v103 = v19;
    __int16 v104 = 2082;
    v105 = v20;
    __int16 v106 = 1024;
    int v107 = 301;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Card system code mismatch for the session", buf, 0x22u);
  }

  BOOL v21 = 0;
  unint64_t v22 = 11;
LABEL_52:
  self->_cardValidationStatus = v22;
LABEL_80:

  return v21;
}

- (BOOL)_executePreCheckScripts:(id)a3
{
  id v5 = a3;
  id v6 = [v5 NF_arrayForKey:@"validateCardScript"];
  id v7 = [v5 valueForKey:@"validateCardScript"];

  if (v7 && !v6)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      unsigned int v9 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v13 = 45;
      if (isMetaClass) {
        uint64_t v13 = 43;
      }
      v9(3, "%c[%{public}s %{public}s]:%i Invalid check script", v13, ClassName, Name, 356);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v14 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_23;
    }
    uint64_t v15 = object_getClass(self);
    if (class_isMetaClass(v15)) {
      int v16 = 43;
    }
    else {
      int v16 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v153 = v16;
    __int16 v154 = 2082;
    int v155 = object_getClassName(self);
    __int16 v156 = 2082;
    v157 = sel_getName(a2);
    __int16 v158 = 1024;
    int v159 = 356;
    uint64_t v17 = "%c[%{public}s %{public}s]:%i Invalid check script";
LABEL_22:
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, v17, buf, 0x22u);
LABEL_23:

    goto LABEL_24;
  }
  if (![v6 count])
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v18 = NFLogGetLogger();
    if (v18)
    {
      int v19 = (void (*)(uint64_t, const char *, ...))v18;
      BOOL v20 = object_getClass(self);
      BOOL v21 = class_isMetaClass(v20);
      unint64_t v22 = object_getClassName(self);
      v126 = sel_getName(a2);
      uint64_t v23 = 45;
      if (v21) {
        uint64_t v23 = 43;
      }
      v19(4, "%c[%{public}s %{public}s]:%i Script is empty", v23, v22, v126, 358);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v14 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_23;
    }
    __int16 v24 = object_getClass(self);
    if (class_isMetaClass(v24)) {
      int v25 = 43;
    }
    else {
      int v25 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v153 = v25;
    __int16 v154 = 2082;
    int v155 = object_getClassName(self);
    __int16 v156 = 2082;
    v157 = sel_getName(a2);
    __int16 v158 = 1024;
    int v159 = 358;
    uint64_t v17 = "%c[%{public}s %{public}s]:%i Script is empty";
    goto LABEL_22;
  }
LABEL_24:
  long long v150 = 0u;
  long long v151 = 0u;
  long long v148 = 0u;
  long long v149 = 0u;
  id obj = v6;
  id v142 = [obj countByEnumeratingWithState:&v148 objects:v167 count:16];
  if (!v142)
  {
    BOOL v110 = 1;
    goto LABEL_122;
  }
  id v133 = v5;
  uint64_t v141 = *(void *)v149;
  BOOL v136 = self;
  sel = a2;
LABEL_26:
  uint64_t v26 = 0;
  while (1)
  {
    if (*(void *)v149 != v141) {
      objc_enumerationMutation(obj);
    }
    int v27 = *(void **)(*((void *)&v148 + 1) + 8 * v26);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v48 = NFLogGetLogger();
      if (v48)
      {
        BOOL v49 = (void (*)(uint64_t, const char *, ...))v48;
        v50 = object_getClass(self);
        BOOL v51 = class_isMetaClass(v50);
        v52 = object_getClassName(self);
        v53 = sel_getName(a2);
        uint64_t v130 = objc_opt_class();
        uint64_t v54 = 45;
        if (v51) {
          uint64_t v54 = 43;
        }
        v49(3, "%c[%{public}s %{public}s]:%i Invalid element type in array, got %{public}@", v54, v52, v53, 363, v130);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v55 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        id v56 = object_getClass(self);
        if (class_isMetaClass(v56)) {
          int v57 = 43;
        }
        else {
          int v57 = 45;
        }
        v58 = object_getClassName(self);
        id v59 = sel_getName(a2);
        uint64_t v60 = objc_opt_class();
        *(_DWORD *)buf = 67110146;
        int v153 = v57;
        __int16 v154 = 2082;
        int v155 = v58;
        __int16 v156 = 2082;
        v157 = v59;
        __int16 v158 = 1024;
        int v159 = 363;
        __int16 v160 = 2114;
        uint64_t v161 = v60;
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid element type in array, got %{public}@", buf, 0x2Cu);
      }

      goto LABEL_106;
    }
    __int16 v28 = [v27 NF_stringForKey:@"command"];
    uint64_t v29 = +[NSData NF_dataWithHexString:v28];
    if (![v29 length]) {
      break;
    }
    v30 = [(NFReaderSession *)self->_readerSession transceive:v29];
    v140 = v30;
    if (v30)
    {
      v138 = v29;
      v31 = [v30 NF_asHexString];
      int v32 = [v27 NF_arrayForKey:@"filter"];
      long long v144 = 0u;
      long long v145 = 0u;
      long long v146 = 0u;
      long long v147 = 0u;
      id v143 = v32;
      id v33 = [v143 countByEnumeratingWithState:&v144 objects:v166 count:16];
      if (v33)
      {
        id v34 = v33;
        uint64_t v35 = *(void *)v145;
        v135 = v28;
        while (2)
        {
          for (i = 0; i != v34; i = (char *)i + 1)
          {
            if (*(void *)v145 != v35) {
              objc_enumerationMutation(v143);
            }
            id v37 = *(void **)(*((void *)&v144 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              uint64_t v85 = NFLogGetLogger();
              if (v85)
              {
                long long v86 = (void (*)(uint64_t, const char *, ...))v85;
                id v87 = object_getClass(v136);
                BOOL v88 = class_isMetaClass(v87);
                long long v89 = object_getClassName(v136);
                long long v90 = sel_getName(sel);
                uint64_t v131 = objc_opt_class();
                uint64_t v91 = 45;
                if (v88) {
                  uint64_t v91 = 43;
                }
                v86(3, "%c[%{public}s %{public}s]:%i Invalid type in de-serialization %{public}@", v91, v89, v90, 392, v131);
              }
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              id v92 = NFSharedLogGetLogger();
              __int16 v28 = v135;
              if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
              {
                long long v93 = object_getClass(v136);
                if (class_isMetaClass(v93)) {
                  int v94 = 43;
                }
                else {
                  int v94 = 45;
                }
                long long v95 = object_getClassName(v136);
                long long v96 = sel_getName(sel);
                v97 = objc_opt_class();
                *(_DWORD *)buf = 67110146;
                int v153 = v94;
                __int16 v154 = 2082;
                int v155 = v95;
                __int16 v156 = 2082;
                v157 = v96;
                __int16 v158 = 1024;
                int v159 = 392;
                __int16 v160 = 2114;
                uint64_t v161 = (uint64_t)v97;
                id v98 = v97;
                _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid type in de-serialization %{public}@", buf, 0x2Cu);
              }
              self = v136;
              v136->_cardValidationStatus = 9;
              int v47 = 1;
              goto LABEL_104;
            }
            uint64_t v38 = [v37 NF_numberForKey:@"length"];

            if (v38)
            {
              uint64_t v39 = [v37 objectForKey:@"length"];
              id v40 = (char *)[v39 integerValue];
            }
            else
            {
              id v40 = 0;
            }
            uint64_t v41 = [v37 NF_numberForKey:@"offset"];

            if (v41)
            {
              id v42 = [v37 objectForKey:@"offset"];
              uint64_t v41 = (uint64_t)[v42 integerValue];
            }
            id v43 = [v37 NF_arrayForKey:@"value"];
            uint64_t v44 = [v43 valueForKey:@"uppercaseString"];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              uint64_t v44 = 0;
            }
            if (v41 < 0 && (v41 += (uint64_t)[v31 length], v41 < 0)
              || &v40[v41] > [v31 length])
            {
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              uint64_t v72 = NFLogGetLogger();
              if (v72)
              {
                v73 = (void (*)(uint64_t, const char *, ...))v72;
                int v74 = object_getClass(v136);
                BOOL v75 = class_isMetaClass(v74);
                v76 = object_getClassName(v136);
                id v77 = sel_getName(sel);
                id v132 = [v31 length];
                uint64_t v78 = 45;
                if (v75) {
                  uint64_t v78 = 43;
                }
                v73(3, "%c[%{public}s %{public}s]:%i Validation Error: Invalid filter length or offset: startingOffset = %ld, length = %ld, [rResponse length] = %lu", v78, v76, v77, 436, v41, v40, v132);
              }
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v79 = NFSharedLogGetLogger();
              __int16 v28 = v135;
              if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
              {
                unint64_t v80 = object_getClass(v136);
                if (class_isMetaClass(v80)) {
                  int v81 = 43;
                }
                else {
                  int v81 = 45;
                }
                v134 = object_getClassName(v136);
                v82 = sel_getName(sel);
                id v83 = [v31 length];
                *(_DWORD *)buf = 67110658;
                int v153 = v81;
                __int16 v154 = 2082;
                int v155 = v134;
                __int16 v156 = 2082;
                v157 = v82;
                __int16 v158 = 1024;
                int v159 = 436;
                __int16 v160 = 2048;
                uint64_t v161 = v41;
                __int16 v162 = 2048;
                v163 = v40;
                __int16 v164 = 2048;
                id v165 = v83;
                _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Validation Error: Invalid filter length or offset: startingOffset = %ld, length = %ld, [rResponse length] = %lu", buf, 0x40u);
              }

              long long v84 = v136;
              v136->_cardValidationStatus = 6;
              goto LABEL_103;
            }
            BOOL v45 = [v31 substringWithRange:v41, v40];
            uint64_t v46 = [v45 uppercaseString];

            if (([v44 containsObject:v46] & 1) == 0)
            {
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              uint64_t v99 = NFLogGetLogger();
              if (v99)
              {
                v100 = (void (*)(uint64_t, const char *, ...))v99;
                int v101 = object_getClass(v136);
                BOOL v102 = class_isMetaClass(v101);
                v103 = object_getClassName(v136);
                v128 = sel_getName(sel);
                uint64_t v104 = 45;
                if (v102) {
                  uint64_t v104 = 43;
                }
                v100(3, "%c[%{public}s %{public}s]:%i Validation Error: retrieved Value not found in the allowed list", v104, v103, v128, 429);
              }
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v105 = NFSharedLogGetLogger();
              __int16 v28 = v135;
              if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
              {
                __int16 v106 = object_getClass(v136);
                if (class_isMetaClass(v106)) {
                  int v107 = 43;
                }
                else {
                  int v107 = 45;
                }
                __int16 v108 = object_getClassName(v136);
                unsigned int v109 = sel_getName(sel);
                *(_DWORD *)buf = 67109890;
                int v153 = v107;
                __int16 v154 = 2082;
                int v155 = v108;
                __int16 v156 = 2082;
                v157 = v109;
                __int16 v158 = 1024;
                int v159 = 429;
                _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Validation Error: retrieved Value not found in the allowed list", buf, 0x22u);
              }

              long long v84 = v136;
              v136->_cardValidationStatus = 3;

LABEL_103:
              self = v84;

              int v47 = 1;
              goto LABEL_104;
            }
          }
          id v34 = [v143 countByEnumeratingWithState:&v144 objects:v166 count:16];
          int v47 = 0;
          __int16 v28 = v135;
          self = v136;
          if (v34) {
            continue;
          }
          break;
        }
      }
      else
      {
        int v47 = 0;
      }
LABEL_104:

      a2 = sel;
      uint64_t v29 = v138;
    }
    else
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v61 = NFLogGetLogger();
      if (v61)
      {
        uint64_t v62 = (void (*)(uint64_t, const char *, ...))v61;
        BOOL v63 = object_getClass(self);
        BOOL v64 = class_isMetaClass(v63);
        v65 = object_getClassName(self);
        v127 = sel_getName(a2);
        uint64_t v66 = 45;
        if (v64) {
          uint64_t v66 = 43;
        }
        v62(3, "%c[%{public}s %{public}s]:%i Invalid Response APDU. Bailing out now.", v66, v65, v127, 379);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v67 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
      {
        uint64_t v68 = object_getClass(self);
        if (class_isMetaClass(v68)) {
          int v69 = 43;
        }
        else {
          int v69 = 45;
        }
        v70 = object_getClassName(self);
        int v71 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        int v153 = v69;
        __int16 v154 = 2082;
        int v155 = v70;
        __int16 v156 = 2082;
        v157 = v71;
        __int16 v158 = 1024;
        int v159 = 379;
        _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid Response APDU. Bailing out now.", buf, 0x22u);
      }

      self->_cardValidationStatus = 5;
      int v47 = 1;
    }

    if (v47)
    {
      BOOL v110 = 0;
LABEL_121:
      id v5 = v133;
      goto LABEL_122;
    }
LABEL_106:
    if ((id)++v26 == v142)
    {
      id v142 = [obj countByEnumeratingWithState:&v148 objects:v167 count:16];
      if (v142) {
        goto LABEL_26;
      }
      BOOL v110 = 1;
      goto LABEL_121;
    }
  }
  v111 = v29;
  uint64_t v112 = v28;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v113 = NFLogGetLogger();
  if (v113)
  {
    v114 = (void (*)(uint64_t, const char *, ...))v113;
    int v115 = object_getClass(self);
    BOOL v116 = class_isMetaClass(v115);
    v124 = object_getClassName(self);
    int v129 = sel_getName(a2);
    uint64_t v117 = 45;
    if (v116) {
      uint64_t v117 = 43;
    }
    v114(3, "%c[%{public}s %{public}s]:%i Validation Error: Invalid command apdu %{public}@. Bailing out", v117, v124, v129, 372, v111);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v118 = NFSharedLogGetLogger();
  id v5 = v133;
  if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
  {
    v119 = object_getClass(self);
    if (class_isMetaClass(v119)) {
      int v120 = 43;
    }
    else {
      int v120 = 45;
    }
    v121 = object_getClassName(self);
    BOOL v122 = sel_getName(a2);
    *(_DWORD *)buf = 67110146;
    int v153 = v120;
    __int16 v154 = 2082;
    int v155 = v121;
    __int16 v156 = 2082;
    v157 = v122;
    __int16 v158 = 1024;
    int v159 = 372;
    __int16 v160 = 2114;
    uint64_t v161 = (uint64_t)v111;
    _os_log_impl((void *)&_mh_execute_header, v118, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Validation Error: Invalid command apdu %{public}@. Bailing out", buf, 0x2Cu);
  }

  self->_cardValidationStatus = 4;
  BOOL v110 = 0;
LABEL_122:

  return v110;
}

- (BOOL)_validateCardForMercury:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [v5 NF_stringForKey:@"technology"];
  if (v6) {
    id v7 = (__CFString *)v6;
  }
  else {
    id v7 = &stru_100059418;
  }
  if ([(NFTag *)self->_tag technology])
  {
    CFStringRef v8 = @"A";
  }
  else if (([(NFTag *)self->_tag technology] & 2) != 0)
  {
    CFStringRef v8 = @"B";
  }
  else if (([(NFTag *)self->_tag technology] & 4) != 0)
  {
    CFStringRef v8 = @"F";
  }
  else
  {
    CFStringRef v8 = &stru_100059418;
  }
  unsigned __int8 v9 = [(__CFString *)v7 containsString:v8];
  if (v9)
  {
    if (![(NFRemoteAdminReaderSession *)self _executePreCheckScripts:v5])
    {
      unsigned __int8 v9 = 0;
      goto LABEL_26;
    }
    unint64_t v10 = 0;
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v12 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v16 = 45;
      if (isMetaClass) {
        uint64_t v16 = 43;
      }
      v12(3, "%c[%{public}s %{public}s]:%i Server supplied technology %{public}@ does not match with the Tag Technology %{public}@. Exiting now!", v16, ClassName, Name, 463, v7, v8);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v17 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = object_getClass(self);
      if (class_isMetaClass(v18)) {
        int v19 = 43;
      }
      else {
        int v19 = 45;
      }
      *(_DWORD *)buf = 67110402;
      int v23 = v19;
      __int16 v24 = 2082;
      int v25 = object_getClassName(self);
      __int16 v26 = 2082;
      int v27 = sel_getName(a2);
      __int16 v28 = 1024;
      int v29 = 463;
      __int16 v30 = 2114;
      v31 = v7;
      __int16 v32 = 2114;
      CFStringRef v33 = v8;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Server supplied technology %{public}@ does not match with the Tag Technology %{public}@. Exiting now!", buf, 0x36u);
    }

    unint64_t v10 = 2;
  }
  self->_cardValidationStatus = v10;
LABEL_26:

  return v9;
}

- (BOOL)_validateCardForMiFare:(id)a3
{
  id v4 = a3;
  [v4 NF_stringForKey:@"technology"];
  id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      id v5 = &stru_100059418;
    }
  }
  if ([(NFTag *)self->_tag technology]) {
    CFStringRef v6 = @"A";
  }
  else {
    CFStringRef v6 = &stru_100059418;
  }
  int v71 = v5;
  if (([(__CFString *)v5 containsString:v6] & 1) == 0)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      int v23 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v27 = 45;
      if (isMetaClass) {
        uint64_t v27 = 43;
      }
      BOOL v64 = ClassName;
      id v5 = v71;
      v23(3, "%c[%{public}s %{public}s]:%i Server supplied technology %{public}@ does not match with the Tag Technology %{public}@. Exiting now!", v27, v64, Name, 492, v71, v6);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    __int16 v28 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      int v29 = object_getClass(self);
      if (class_isMetaClass(v29)) {
        int v30 = 43;
      }
      else {
        int v30 = 45;
      }
      *(_DWORD *)buf = 67110402;
      int v81 = v30;
      __int16 v82 = 2082;
      id v83 = object_getClassName(self);
      __int16 v84 = 2082;
      uint64_t v85 = sel_getName(a2);
      __int16 v86 = 1024;
      int v87 = 492;
      __int16 v88 = 2114;
      uint64_t v89 = (uint64_t)v5;
      __int16 v90 = 2114;
      CFStringRef v91 = v6;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Server supplied technology %{public}@ does not match with the Tag Technology %{public}@. Exiting now!", buf, 0x36u);
    }

    BOOL v31 = 0;
    self->_cardValidationStatus = 2;
    goto LABEL_66;
  }
  id v7 = [v4 NF_arrayForKey:@"tagType"];
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v8 = NFLogGetLogger();
  id v70 = v4;
  if (v8)
  {
    unsigned __int8 v9 = (void (*)(uint64_t, const char *, ...))v8;
    unint64_t v10 = object_getClass(self);
    BOOL v11 = class_isMetaClass(v10);
    v12 = object_getClassName(self);
    uint64_t v13 = sel_getName(a2);
    id v68 = [(NFTag *)self->_tag type];
    uint64_t v14 = 45;
    if (v11) {
      uint64_t v14 = 43;
    }
    v9(6, "%c[%{public}s %{public}s]:%i Tag Type %d found", v14, v12, v13, 499, v68);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v15 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = object_getClass(self);
    if (class_isMetaClass(v16)) {
      int v17 = 43;
    }
    else {
      int v17 = 45;
    }
    uint64_t v18 = object_getClassName(self);
    int v19 = sel_getName(a2);
    unsigned int v20 = [(NFTag *)self->_tag type];
    *(_DWORD *)buf = 67110146;
    int v81 = v17;
    __int16 v82 = 2082;
    id v83 = v18;
    __int16 v84 = 2082;
    uint64_t v85 = v19;
    __int16 v86 = 1024;
    int v87 = 499;
    __int16 v88 = 1024;
    LODWORD(v89) = v20;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Tag Type %d found", buf, 0x28u);
  }

  if ([(NFTag *)self->_tag type] == 15)
  {
    CFStringRef v21 = @"MiFarePlus";
  }
  else
  {
    unsigned int v32 = [(NFTag *)self->_tag type];
    CFStringRef v21 = @"Unknown";
    if (v32 == 16) {
      CFStringRef v21 = @"DesFire";
    }
  }
  CFStringRef v72 = v21;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id obj = v7;
  id v33 = [obj countByEnumeratingWithState:&v75 objects:v79 count:16];
  if (!v33)
  {
LABEL_51:

    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v51 = NFLogGetLogger();
    if (v51)
    {
      v52 = (void (*)(uint64_t, const char *, ...))v51;
      v53 = object_getClass(self);
      BOOL v54 = class_isMetaClass(v53);
      v65 = object_getClassName(self);
      v67 = sel_getName(a2);
      uint64_t v55 = 45;
      if (v54) {
        uint64_t v55 = 43;
      }
      v52(6, "%c[%{public}s %{public}s]:%i Unsupported Tag Type %{public}@ found", v55, v65, v67, 521, v72);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v56 = NFSharedLogGetLogger();
    id v5 = v71;
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      int v57 = object_getClass(self);
      if (class_isMetaClass(v57)) {
        int v58 = 43;
      }
      else {
        int v58 = 45;
      }
      id v59 = object_getClassName(self);
      uint64_t v60 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      int v81 = v58;
      __int16 v82 = 2082;
      id v83 = v59;
      __int16 v84 = 2082;
      uint64_t v85 = v60;
      __int16 v86 = 1024;
      int v87 = 521;
      __int16 v88 = 2114;
      uint64_t v89 = (uint64_t)v72;
      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Unsupported Tag Type %{public}@ found", buf, 0x2Cu);
    }

    BOOL v31 = 0;
    unint64_t v61 = 15;
    id v4 = v70;
LABEL_63:
    self->_cardValidationStatus = v61;
    goto LABEL_65;
  }
  id v34 = v33;
  uint64_t v35 = *(void *)v76;
LABEL_33:
  uint64_t v36 = 0;
  while (1)
  {
    if (*(void *)v76 != v35) {
      objc_enumerationMutation(obj);
    }
    id v37 = *(void **)(*((void *)&v75 + 1) + 8 * v36);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v38 = NFLogGetLogger();
      if (v38)
      {
        uint64_t v39 = (void (*)(uint64_t, const char *, ...))v38;
        id v40 = object_getClass(self);
        BOOL v41 = class_isMetaClass(v40);
        id v42 = object_getClassName(self);
        id v43 = sel_getName(a2);
        uint64_t v69 = objc_opt_class();
        uint64_t v44 = 45;
        if (v41) {
          uint64_t v44 = 43;
        }
        v39(3, "%c[%{public}s %{public}s]:%i Invalid type string, got %{public}@", v44, v42, v43, 513, v69);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      BOOL v45 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        uint64_t v46 = object_getClass(self);
        if (class_isMetaClass(v46)) {
          int v47 = 43;
        }
        else {
          int v47 = 45;
        }
        uint64_t v48 = object_getClassName(self);
        BOOL v49 = sel_getName(a2);
        uint64_t v50 = objc_opt_class();
        *(_DWORD *)buf = 67110146;
        int v81 = v47;
        __int16 v82 = 2082;
        id v83 = v48;
        __int16 v84 = 2082;
        uint64_t v85 = v49;
        __int16 v86 = 1024;
        int v87 = 513;
        __int16 v88 = 2114;
        uint64_t v89 = v50;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid type string, got %{public}@", buf, 0x2Cu);
      }

      goto LABEL_49;
    }
    if (![v37 caseInsensitiveCompare:v72]) {
      break;
    }
LABEL_49:
    if (v34 == (id)++v36)
    {
      id v34 = [obj countByEnumeratingWithState:&v75 objects:v79 count:16];
      if (v34) {
        goto LABEL_33;
      }
      goto LABEL_51;
    }
  }

  id v4 = v70;
  if ([(NFRemoteAdminReaderSession *)self _executePreCheckScripts:v70])
  {
    unint64_t v61 = 0;
    BOOL v31 = 1;
    id v5 = v71;
    goto LABEL_63;
  }
  BOOL v31 = 0;
  id v5 = v71;
LABEL_65:

LABEL_66:
  return v31;
}

- (BOOL)_validateCard
{
  if (self->_readerSession)
  {
    id v4 = [(NFRemoteAdminReaderSession *)self sessionCardServiceInfo];
    id v5 = [v4 objectForKeyedSubscript:@"version"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0
      && ([v4 objectForKeyedSubscript:@"version"],
          id v7 = objc_claimAutoreleasedReturnValue(),
          id v8 = [v7 intValue],
          v7,
          (int)v8 > 2))
    {
      if (v8 == 4)
      {
        unsigned __int8 v9 = [(NFRemoteAdminReaderSession *)self _validateCardForMiFare:v4];
      }
      else
      {
        if (v8 != 3)
        {
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t Logger = NFLogGetLogger();
          if (Logger)
          {
            unint64_t v22 = (void (*)(uint64_t, const char *, ...))Logger;
            Class = object_getClass(self);
            BOOL isMetaClass = class_isMetaClass(Class);
            ClassName = object_getClassName(self);
            Name = sel_getName(a2);
            uint64_t v25 = 45;
            if (isMetaClass) {
              uint64_t v25 = 43;
            }
            v22(3, "%c[%{public}s %{public}s]:%i cardServiceInfo.version: %d is > 4. Invalid version.", v25, ClassName, Name, 570, v8);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          __int16 v26 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            uint64_t v27 = object_getClass(self);
            if (class_isMetaClass(v27)) {
              int v28 = 43;
            }
            else {
              int v28 = 45;
            }
            *(_DWORD *)buf = 67110146;
            int v33 = v28;
            __int16 v34 = 2082;
            uint64_t v35 = object_getClassName(self);
            __int16 v36 = 2082;
            id v37 = sel_getName(a2);
            __int16 v38 = 1024;
            int v39 = 570;
            __int16 v40 = 1024;
            int v41 = (int)v8;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i cardServiceInfo.version: %d is > 4. Invalid version.", buf, 0x28u);
          }

          BOOL v10 = 0;
          goto LABEL_6;
        }
        unsigned __int8 v9 = [(NFRemoteAdminReaderSession *)self _validateCardForMercury:v4];
      }
    }
    else
    {
      unsigned __int8 v9 = [(NFRemoteAdminReaderSession *)self _validateCardForFelica];
    }
    BOOL v10 = v9;
LABEL_6:

    return v10;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v11 = NFLogGetLogger();
  if (v11)
  {
    v12 = (void (*)(uint64_t, const char *, ...))v11;
    uint64_t v13 = object_getClass(self);
    BOOL v14 = class_isMetaClass(v13);
    uint64_t v15 = object_getClassName(self);
    int v30 = sel_getName(a2);
    uint64_t v16 = 45;
    if (v14) {
      uint64_t v16 = 43;
    }
    v12(3, "%c[%{public}s %{public}s]:%i Reader Session does not exist. Exiting now!", v16, v15, v30, 544);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  int v17 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    uint64_t v18 = object_getClass(self);
    if (class_isMetaClass(v18)) {
      int v19 = 43;
    }
    else {
      int v19 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v33 = v19;
    __int16 v34 = 2082;
    uint64_t v35 = object_getClassName(self);
    __int16 v36 = 2082;
    id v37 = sel_getName(a2);
    __int16 v38 = 1024;
    int v39 = 544;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Reader Session does not exist. Exiting now!", buf, 0x22u);
  }

  BOOL v10 = 0;
  self->_cardValidationStatus = 8;
  return v10;
}

- (id)_getRequireServiceV1List
{
  v3 = [(NFRemoteAdminReaderSession *)self sessionCardServiceInfo];
  id v4 = [v3 NF_arrayForKey:@"requiredServicesV1"];
  if (v4
    || (objc_msgSend(v3, "NF_arrayForKey:", @"areaCodeList"),
        (id v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v42 = v3;
    id v44 = (id)objc_opt_new();
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v5 = v4;
    id v6 = [v5 countByEnumeratingWithState:&v45 objects:v59 count:16];
    if (v6)
    {
      unint64_t v7 = (unint64_t)v6;
      uint64_t v8 = 0;
      uint64_t v9 = *(void *)v46;
      for (uint64_t i = *(void *)v46; ; uint64_t i = *(void *)v46)
      {
        if (i != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v45 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v11 length] == (id)4)
        {
          v12 = +[NSData NF_dataWithHexString:v11];
          if (v12)
          {
            [v44 addObject:v12];
          }
          else
          {
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            uint64_t Logger = NFLogGetLogger();
            if (Logger)
            {
              int v28 = (void (*)(uint64_t, const char *, ...))Logger;
              Class = object_getClass(self);
              BOOL isMetaClass = class_isMetaClass(Class);
              ClassName = object_getClassName(self);
              Name = sel_getName(a2);
              uint64_t v32 = 45;
              if (isMetaClass) {
                uint64_t v32 = 43;
              }
              v28(4, "%c[%{public}s %{public}s]:%i Node data is null", v32, ClassName, Name, 597);
            }
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            int v33 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              __int16 v34 = object_getClass(self);
              if (class_isMetaClass(v34)) {
                int v35 = 43;
              }
              else {
                int v35 = 45;
              }
              __int16 v36 = object_getClassName(self);
              id v37 = sel_getName(a2);
              *(_DWORD *)buf = 67109890;
              int v50 = v35;
              __int16 v51 = 2082;
              v52 = v36;
              __int16 v53 = 2082;
              BOOL v54 = v37;
              __int16 v55 = 1024;
              int v56 = 597;
              _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Node data is null", buf, 0x22u);
            }
          }
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            *(_WORD *)buf = 0;
            *(_WORD *)buf = __rev16([v11 unsignedShortValue]);
            uint64_t v13 = [objc_alloc((Class)NSData) initWithBytes:buf length:2];
            [v44 addObject:v13];
          }
          else
          {
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            uint64_t v14 = NFLogGetLogger();
            if (v14)
            {
              uint64_t v15 = (void (*)(uint64_t, const char *, ...))v14;
              uint64_t v16 = object_getClass(self);
              BOOL v17 = class_isMetaClass(v16);
              uint64_t v18 = object_getClassName(self);
              int v19 = sel_getName(a2);
              Class v41 = object_getClass(v11);
              uint64_t v20 = 45;
              if (v17) {
                uint64_t v20 = 43;
              }
              v15(3, "%c[%{public}s %{public}s]:%i Unexpected type, %{public}@", v20, v18, v19, 603, v41);
            }
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            uint64_t v13 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              CFStringRef v21 = object_getClass(self);
              if (class_isMetaClass(v21)) {
                int v22 = 43;
              }
              else {
                int v22 = 45;
              }
              int v23 = object_getClassName(self);
              __int16 v24 = sel_getName(a2);
              Class v25 = object_getClass(v11);
              *(_DWORD *)buf = 67110146;
              int v50 = v22;
              __int16 v51 = 2082;
              v52 = v23;
              __int16 v53 = 2082;
              BOOL v54 = v24;
              __int16 v55 = 1024;
              int v56 = 603;
              __int16 v57 = 2114;
              Class v58 = v25;
              __int16 v26 = v25;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected type, %{public}@", buf, 0x2Cu);
            }
          }
        }
        if (++v8 >= v7)
        {
          id v38 = [v5 countByEnumeratingWithState:&v45 objects:v59 count:16];
          if (!v38) {
            break;
          }
          unint64_t v7 = (unint64_t)v38;
          uint64_t v8 = 0;
        }
      }
    }

    v3 = v42;
  }
  else
  {
    id v44 = (id)objc_opt_new();
  }

  return v44;
}

- (id)_getSessionSystemCode
{
  id v4 = [(NFRemoteAdminReaderSession *)self sessionCardServiceInfo];
  id v5 = [v4 objectForKeyedSubscript:@"systemCode"];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = +[NSData NF_dataWithHexString:v5];
LABEL_6:
      unint64_t v7 = v6;
      goto LABEL_18;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      *(_WORD *)buf = __rev16([v5 unsignedShortValue]);
      id v6 = [objc_alloc((Class)NSData) initWithBytes:buf length:2];
      goto LABEL_6;
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v9 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      Class v20 = object_getClass(v5);
      uint64_t v14 = 45;
      if (isMetaClass) {
        uint64_t v14 = 43;
      }
      v9(3, "%c[%{public}s %{public}s]:%i Unexpected type, %{public}@", v14, ClassName, Name, 625, v20);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v15 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = object_getClass(self);
      if (class_isMetaClass(v16)) {
        int v17 = 43;
      }
      else {
        int v17 = 45;
      }
      *(_DWORD *)buf = 67110146;
      int v22 = v17;
      __int16 v23 = 2082;
      __int16 v24 = object_getClassName(self);
      __int16 v25 = 2082;
      __int16 v26 = sel_getName(a2);
      __int16 v27 = 1024;
      int v28 = 625;
      __int16 v29 = 2114;
      Class v30 = object_getClass(v5);
      uint64_t v18 = v30;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected type, %{public}@", buf, 0x2Cu);
    }
  }
  unint64_t v7 = 0;
LABEL_18:

  return v7;
}

- (void)abort:(int64_t)a3
{
  v19.receiver = self;
  v19.super_class = (Class)NFRemoteAdminReaderSession;
  -[NFRemoteAdminRedirectSession abort:](&v19, "abort:");
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_sessionStartSem);
  [(NFRemoteAdminReaderSession *)self _fireCardIngestionStatus:5];
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_tagSem);
  id v5 = [(NFRemoteAdminRedirectSession *)self redirectState];
  id v6 = v5;
  if (a3 == 6)
  {
    unint64_t cardIngestionStatus = 7;
    self->_unint64_t cardIngestionStatus = 7;
  }
  else
  {
    unint64_t cardIngestionStatus = self->_cardIngestionStatus;
    if (cardIngestionStatus == -1) {
      unint64_t cardIngestionStatus = 1;
    }
  }
  uint64_t v8 = [v5 stateUpdateOnSessionEndedCallback];

  if (v8)
  {
    uint64_t v9 = [v6 stateUpdateOnSessionEndedCallback];
    ((void (**)(void, void *, unint64_t))v9)[2](v9, v6, cardIngestionStatus);

    [v6 setStateUpdateOnSessionEndedCallback:0];
  }
  id v10 = objc_alloc((Class)NSMutableDictionary);
  uint64_t v11 = +[NSNumber numberWithUnsignedInt:[(NFRemoteAdminReaderSession *)self targetTagType]];
  v12 = +[NSNumber numberWithUnsignedInteger:self->_cardValidationStatus];
  id v13 = [v10 initWithObjectsAndKeys:&off_10005B260, @"state", v11, @"technology", v12, @"cardValidationStatus", 0];

  if (self->_cardIngestionStatus != -1)
  {
    uint64_t v14 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
    [v13 setObject:v14 forKeyedSubscript:@"sessionStatus"];
  }
  uint64_t v15 = [(NFRemoteAdminRedirectSession *)self redirectState];
  uint64_t v16 = [v15 spStatusCode];

  if (v16)
  {
    int v17 = [(NFRemoteAdminRedirectSession *)self redirectState];
    uint64_t v18 = [v17 spStatusCode];
    [v13 setObject:v18 forKey:@"spStatus"];
  }
  +[NFReaderModeCardIngestionCALogger postAnalyticsReaderModeCardIngestionSession:v13 prepOnly:0];
}

- (void)_fireCardIngestionStatus:(unint64_t)a3
{
  if (objc_opt_respondsToSelector())
  {
    if (self) {
      delegate = self->_delegate;
    }
    else {
      delegate = 0;
    }
    [(NFRemoteAdminSessionDelegate *)delegate handleCardIngestionStatus:a3];
  }
}

- (void)processNotification:(id)a3
{
  v21.receiver = self;
  v21.super_class = (Class)NFRemoteAdminReaderSession;
  id v5 = a3;
  [(NFRemoteAdminRedirectSession *)&v21 processNotification:v5];
  id v6 = [v5 NF_stringForKey:@"tokenValue"];

  if ([v6 length])
  {
    if (objc_opt_respondsToSelector())
    {
      if (self) {
        delegate = self->_delegate;
      }
      else {
        delegate = 0;
      }
      [(NFRemoteAdminSessionDelegate *)delegate handleCardSessionToken:v6];
    }
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v9 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v12 = 45;
      if (isMetaClass) {
        uint64_t v12 = 43;
      }
      v9(3, "%c[%{public}s %{public}s]:%i Invalid token, %{public}@", v12, ClassName, Name, 683, v6);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v13 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = object_getClass(self);
      if (class_isMetaClass(v14)) {
        int v15 = 43;
      }
      else {
        int v15 = 45;
      }
      uint64_t v16 = object_getClassName(self);
      int v17 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      int v23 = v15;
      __int16 v24 = 2082;
      __int16 v25 = v16;
      __int16 v26 = 2082;
      __int16 v27 = v17;
      __int16 v28 = 1024;
      int v29 = 683;
      __int16 v30 = 2114;
      BOOL v31 = v6;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid token, %{public}@", buf, 0x2Cu);
    }
  }
  uint64_t v18 = [(NFRemoteAdminRedirectSession *)self redirectState];
  [v18 setNotification:0];
}

- (id)getNextRequest
{
  v3 = [(NFRemoteAdminReaderSession *)self sessionCardServiceInfo];
  id v4 = [v3 objectForKeyedSubscript:@"version"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  uint64_t v6 = 2;
  if (isKindOfClass)
  {
    unint64_t v7 = [v3 objectForKeyedSubscript:@"version"];
    int v8 = [v7 intValue];

    if (v8 <= 3) {
      uint64_t v6 = 2;
    }
    else {
      uint64_t v6 = v8;
    }
  }
  else
  {
    int v8 = 0;
  }
  uint64_t v9 = [(NFRemoteAdminRedirectSession *)self redirectState];
  id v10 = [v9 step];

  uint64_t v11 = [(NFRemoteAdminRedirectSession *)self redirectState];
  uint64_t v12 = v11;
  if (!v10)
  {
    int v15 = objc_opt_new();
    uint64_t v16 = +[NSNumber numberWithInteger:v6];
    [v15 setObject:v16 forKeyedSubscript:@"kVersion"];

    int v17 = [v12 parameters];
    if (v17)
    {
      uint64_t v18 = [v12 parameters];
      [v15 setObject:v18 forKeyedSubscript:@"readerModeParameters"];
    }
    else
    {
      [v15 setObject:&__NSDictionary0__struct forKeyedSubscript:@"readerModeParameters"];
    }

    goto LABEL_15;
  }
  id v13 = [v11 step];

  uint64_t v14 = [(NFRemoteAdminRedirectSession *)self redirectState];
  uint64_t v12 = v14;
  if (v13 == (id)2)
  {
    int v15 = [v14 redirectResponse];
LABEL_15:

    goto LABEL_16;
  }
  objc_super v19 = [v14 unsentScriptResponse];

  if (v19)
  {
    Class v20 = [(NFRemoteAdminRedirectSession *)self redirectState];
    int v15 = [v20 unsentScriptResponse];
  }
  else
  {
    int v15 = objc_opt_new();
    int v22 = +[NSNumber numberWithInteger:v6];
    [v15 setObject:v22 forKeyedSubscript:@"kVersion"];

    int v23 = [(NFRemoteAdminRedirectSession *)self redirectState];
    __int16 v24 = [v23 forwardDataToSP];

    if (v24)
    {
      __int16 v25 = [(NFRemoteAdminRedirectSession *)self redirectState];
      __int16 v26 = [v25 forwardDataToSP];
      [v15 setObject:v26 forKeyedSubscript:@"forwardData"];
    }
    __int16 v27 = objc_opt_new();
    [v27 setObject:@"external" forKeyedSubscript:@"secureElementType"];
    cardContents = self->_cardContents;
    if (cardContents) {
      [v27 setObject:cardContents forKeyedSubscript:@"cardContents"];
    }
    if (v8 == 4)
    {
      int v29 = [(NFTag *)self->_tag tagID];
      __int16 v30 = [v29 NF_asHexString];

      BOOL v31 = [(NFTag *)self->_tag sak];
      uint64_t v32 = [v31 NF_asHexString];

      int v33 = [(NFTag *)self->_tag atqa];
      __int16 v34 = [v33 NF_asHexString];

      int v35 = [(NFTag *)self->_tag historicalBytes];
      __int16 v36 = [v35 NF_asHexString];

      if (v30 && v32 && v34 && v36)
      {
        v38[0] = @"UID";
        v38[1] = @"SAK";
        v39[0] = v30;
        v39[1] = v32;
        v38[2] = @"ATQA";
        v38[3] = @"historicalBytes";
        v39[2] = v34;
        v39[3] = v36;
        id v37 = +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:4];
        [v27 setObject:v37 forKeyedSubscript:@"cardTypeAParams"];
      }
    }
    [v15 setObject:v27 forKeyedSubscript:@"SEStateInfo"];
  }
LABEL_16:

  return v15;
}

- (unint64_t)executeScript:(id)a3
{
  id v5 = a3;
  if (![(NFRemoteAdminRedirectSession *)self aborted])
  {
    [(NFRemoteAdminReaderSession *)self _fireCardIngestionStatus:4];
    uint64_t v16 = objc_opt_new();
    if (!v16)
    {
      __int16 v57 = +[NSAssertionHandler currentHandler];
      [v57 handleFailureInMethod:a2 object:self file:@"NFRemoteAdminReaderSession.m" lineNumber:777 description:@"Out of resources"];
    }
    readerSession = self->_readerSession;
    id v62 = 0;
    id v18 = [(NFReaderSession *)readerSession runScript:v5 parameters:v16 results:&v62];
    uint64_t v12 = v62;
    [(NFRemoteAdminRedirectSession *)self setRedirectStepError:v18];
    objc_super v19 = [(NFRemoteAdminRedirectSession *)self redirectState];
    [v19 setUnsentScriptResponse:v12];

    Class v20 = [(NFRemoteAdminRedirectSession *)self redirectState];
    objc_super v21 = [v20 performanceMetrics];
    [v16 outTotalAPDUExecutionDuration];
    double v23 = v22;
    [v21 totalAPDUTime];
    [v21 setTotalAPDUTime:v23 + v24];

    if (v12)
    {
      if ([(NFRemoteAdminRedirectSession *)self redirectStepError] == 28
        || [(NFRemoteAdminRedirectSession *)self redirectStepError] == 29)
      {
        [(NFRemoteAdminReaderSession *)self _fireCardIngestionStatus:7];
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t Logger = NFLogGetLogger();
        if (Logger)
        {
          __int16 v26 = (void (*)(uint64_t, const char *, ...))Logger;
          Class = object_getClass(self);
          BOOL isMetaClass = class_isMetaClass(Class);
          ClassName = object_getClassName(self);
          Name = sel_getName(a2);
          uint64_t v30 = 45;
          if (isMetaClass) {
            uint64_t v30 = 43;
          }
          v26(3, "%c[%{public}s %{public}s]:%i C-APDU execution failure", v30, ClassName, Name, 790);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        BOOL v31 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          uint64_t v32 = object_getClass(self);
          if (class_isMetaClass(v32)) {
            int v33 = 43;
          }
          else {
            int v33 = 45;
          }
          __int16 v34 = object_getClassName(self);
          int v35 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          int v64 = v33;
          __int16 v65 = 2082;
          uint64_t v66 = v34;
          __int16 v67 = 2082;
          id v68 = v35;
          __int16 v69 = 1024;
          int v70 = 790;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i C-APDU execution failure", buf, 0x22u);
        }
        unint64_t v15 = 6;
      }
      else if ([(NFRemoteAdminRedirectSession *)self redirectStepError] == 3)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v37 = NFLogGetLogger();
        if (v37)
        {
          id v38 = (void (*)(uint64_t, const char *, ...))v37;
          int v39 = object_getClass(self);
          BOOL v40 = class_isMetaClass(v39);
          Class v41 = object_getClassName(self);
          uint64_t v60 = sel_getName(a2);
          uint64_t v42 = 45;
          if (v40) {
            uint64_t v42 = 43;
          }
          v38(3, "%c[%{public}s %{public}s]:%i Reader session aborted", v42, v41, v60, 792);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        BOOL v31 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          id v43 = object_getClass(self);
          if (class_isMetaClass(v43)) {
            int v44 = 43;
          }
          else {
            int v44 = 45;
          }
          long long v45 = object_getClassName(self);
          long long v46 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          int v64 = v44;
          __int16 v65 = 2082;
          uint64_t v66 = v45;
          __int16 v67 = 2082;
          id v68 = v46;
          __int16 v69 = 1024;
          int v70 = 792;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Reader session aborted", buf, 0x22u);
        }
        unint64_t v15 = 1;
      }
      else
      {
        if ([(NFRemoteAdminRedirectSession *)self redirectStepError] != 47)
        {
          unint64_t v15 = 6;
          goto LABEL_29;
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v47 = NFLogGetLogger();
        if (v47)
        {
          long long v48 = (void (*)(uint64_t, const char *, ...))v47;
          BOOL v49 = object_getClass(self);
          BOOL v50 = class_isMetaClass(v49);
          __int16 v51 = object_getClassName(self);
          unint64_t v61 = sel_getName(a2);
          uint64_t v52 = 45;
          if (v50) {
            uint64_t v52 = 43;
          }
          v48(3, "%c[%{public}s %{public}s]:%i Reader protection mode enabled", v52, v51, v61, 795);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        BOOL v31 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          __int16 v53 = object_getClass(self);
          if (class_isMetaClass(v53)) {
            int v54 = 43;
          }
          else {
            int v54 = 45;
          }
          __int16 v55 = object_getClassName(self);
          int v56 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          int v64 = v54;
          __int16 v65 = 2082;
          uint64_t v66 = v55;
          __int16 v67 = 2082;
          id v68 = v56;
          __int16 v69 = 1024;
          int v70 = 795;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Reader protection mode enabled", buf, 0x22u);
        }
        unint64_t v15 = 13;
      }
    }
    else
    {
      unint64_t v15 = 5;
    }
LABEL_29:

    goto LABEL_30;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v6 = NFLogGetLogger();
  if (v6)
  {
    unint64_t v7 = (void (*)(uint64_t, const char *, ...))v6;
    int v8 = object_getClass(self);
    BOOL v9 = class_isMetaClass(v8);
    id v10 = object_getClassName(self);
    Class v58 = sel_getName(a2);
    uint64_t v11 = 45;
    if (v9) {
      uint64_t v11 = 43;
    }
    v7(3, "%c[%{public}s %{public}s]:%i Reader session aborted", v11, v10, v58, 767);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v12 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    id v13 = object_getClass(self);
    if (class_isMetaClass(v13)) {
      int v14 = 43;
    }
    else {
      int v14 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v64 = v14;
    __int16 v65 = 2082;
    uint64_t v66 = object_getClassName(self);
    __int16 v67 = 2082;
    id v68 = sel_getName(a2);
    __int16 v69 = 1024;
    int v70 = 767;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Reader session aborted", buf, 0x22u);
  }
  unint64_t v15 = 1;
LABEL_30:

  return v15;
}

- (BOOL)startNewSession
{
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v5(6, "%c[%{public}s %{public}s]:%i ", v9, ClassName, Name, 805);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = object_getClass(self);
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v16 = v12;
    __int16 v17 = 2082;
    id v18 = object_getClassName(self);
    __int16 v19 = 2082;
    Class v20 = sel_getName(a2);
    __int16 v21 = 1024;
    int v22 = 805;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  return [(NFRemoteAdminReaderSession *)self reconnectTag];
}

- (BOOL)_preValidateCardForCathay
{
  int v4 = NFGetProductType();
  if ((v4 - 11) > 0x38 || ((1 << (v4 - 11)) & 0x100000000000007) == 0)
  {
    char v23 = 0;
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      unint64_t v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v11 = 45;
      if (isMetaClass) {
        uint64_t v11 = 43;
      }
      v7(6, "%c[%{public}s %{public}s]:%i Found device that needs dynamic RF settings update", v11, ClassName, Name, 831);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v12 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = object_getClass(self);
      if (class_isMetaClass(v13)) {
        int v14 = 43;
      }
      else {
        int v14 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v39 = v14;
      __int16 v40 = 2082;
      Class v41 = object_getClassName(self);
      __int16 v42 = 2082;
      id v43 = sel_getName(a2);
      __int16 v44 = 1024;
      int v45 = 831;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Found device that needs dynamic RF settings update", buf, 0x22u);
    }

    unint64_t v15 = [(NFRemoteAdminReaderSession *)self sessionCardServiceInfo];
    int v16 = [v15 objectForKeyedSubscript:@"version"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0
      && ([v15 objectForKeyedSubscript:@"version"],
          id v18 = objc_claimAutoreleasedReturnValue(),
          int v19 = [v18 intValue],
          v18,
          v19 > 2))
    {
      char v23 = 0;
    }
    else
    {
      Class v20 = [(NFRemoteAdminReaderSession *)self _getSessionSystemCode];
      __int16 v21 = v20;
      if (v20)
      {
        id v22 = v20;
        if (*(_WORD *)[v22 bytes] == 2176)
        {
          __int16 v21 = v22;
          char v23 = -1;
        }
        else
        {
          char v23 = 0;
        }
      }
      else
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v24 = NFLogGetLogger();
        if (v24)
        {
          __int16 v25 = (void (*)(uint64_t, const char *, ...))v24;
          __int16 v26 = object_getClass(self);
          BOOL v27 = class_isMetaClass(v26);
          __int16 v28 = object_getClassName(self);
          uint64_t v37 = sel_getName(a2);
          uint64_t v29 = 45;
          if (v27) {
            uint64_t v29 = 43;
          }
          v25(4, "%c[%{public}s %{public}s]:%i Missing system code definition", v29, v28, v37, 843);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v30 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          BOOL v31 = object_getClass(self);
          if (class_isMetaClass(v31)) {
            int v32 = 43;
          }
          else {
            int v32 = 45;
          }
          int v33 = object_getClassName(self);
          __int16 v34 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          int v39 = v32;
          __int16 v40 = 2082;
          Class v41 = v33;
          __int16 v42 = 2082;
          id v43 = v34;
          __int16 v44 = 1024;
          int v45 = 843;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Missing system code definition", buf, 0x22u);
        }

        char v23 = 0;
      }
    }
  }
  return v23 & 1;
}

- (void)_restoreRFSettingForCathayIngestion
{
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  id v5 = +[NFHardwareManager sharedHardwareManager];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000AA9C;
  v7[3] = &unk_1000586B0;
  dispatch_semaphore_t v8 = v4;
  SEL v9 = a2;
  v7[4] = self;
  uint64_t v6 = v4;
  [v5 configureReaderModeRFForTransitPartner:0 transitPartner:2 callback:v7];

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  self->_cathayIngestionSessionInProgress = 0;
}

- (BOOL)_checkForCathayIngestion
{
  BOOL v4 = [(NFRemoteAdminReaderSession *)self _preValidateCardForCathay];
  if (v4)
  {
    if (self->_cathayIngestionSessionInProgress) {
      [(NFRemoteAdminReaderSession *)self _restoreRFSettingForCathayIngestion];
    }
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    uint64_t v6 = +[NFHardwareManager sharedHardwareManager];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000AD58;
    v9[3] = &unk_1000586B0;
    dispatch_semaphore_t v10 = v5;
    SEL v11 = a2;
    v9[4] = self;
    unint64_t v7 = v5;
    [v6 configureReaderModeRFForTransitPartner:1 transitPartner:2 callback:v9];

    dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
    self->_cathayIngestionSessionInProgress = 1;
  }
  else
  {
    self->_cathayIngestionSessionInProgress = 0;
  }
  return v4;
}

- (BOOL)_preValidateCardForMercury
{
  unsigned int v3 = NFGetProductType();
  if (v3 <= 0x18 && ((1 << v3) & 0x100C000) != 0)
  {
    BOOL v4 = [(NFRemoteAdminReaderSession *)self sessionCardServiceInfo];
    dispatch_semaphore_t v5 = [v4 objectForKeyedSubscript:@"version"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      unint64_t v7 = [v4 objectForKeyedSubscript:@"version"];
      unsigned int v8 = [v7 intValue];

      if (v8 == 3) {
        return 1;
      }
    }
    else
    {
    }
  }
  return 0;
}

- (void)_restoreRFSettingForMercuryIngestion
{
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  dispatch_semaphore_t v5 = +[NFHardwareManager sharedHardwareManager];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000B0B4;
  v7[3] = &unk_1000586B0;
  dispatch_semaphore_t v8 = v4;
  SEL v9 = a2;
  v7[4] = self;
  uint64_t v6 = v4;
  [v5 configureReaderModeRFForTransitPartner:0 transitPartner:1 callback:v7];

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  self->_mercuryIngestionSessionInProgress = 0;
}

- (void)_checkForMercuryIngestion
{
  if ([(NFRemoteAdminReaderSession *)self _preValidateCardForMercury])
  {
    if (self->_mercuryIngestionSessionInProgress) {
      [(NFRemoteAdminReaderSession *)self _restoreRFSettingForMercuryIngestion];
    }
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
    dispatch_semaphore_t v5 = +[NFHardwareManager sharedHardwareManager];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000B368;
    v7[3] = &unk_1000586B0;
    dispatch_semaphore_t v8 = v4;
    SEL v9 = a2;
    v7[4] = self;
    uint64_t v6 = v4;
    [v5 configureReaderModeRFForTransitPartner:1 transitPartner:1 callback:v7];

    dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
    self->_mercuryIngestionSessionInProgress = 1;
  }
  else
  {
    self->_mercuryIngestionSessionInProgress = 0;
  }
}

- (unint64_t)_openSession
{
  p_readerSession = &self->_readerSession;
  if (!self->_readerSession)
  {
    if (![(NFRemoteAdminReaderSession *)self _checkForCathayIngestion]) {
      [(NFRemoteAdminReaderSession *)self _checkForMercuryIngestion];
    }
    uint64_t v96 = 0;
    v97 = &v96;
    uint64_t v98 = 0x3032000000;
    uint64_t v99 = sub_10000C134;
    v100 = sub_10000C144;
    id v101 = 0;
    uint64_t v6 = +[NFHardwareManager sharedHardwareManager];
    v95[0] = _NSConcreteStackBlock;
    v95[1] = 3221225472;
    v95[2] = sub_10000C14C;
    v95[3] = &unk_1000586D8;
    v95[5] = &v96;
    v95[6] = a2;
    v95[4] = self;
    unint64_t v7 = [v6 startReaderSession:v95];

    dispatch_semaphore_wait((dispatch_semaphore_t)self->_sessionStartSem, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_semaphore_t v8 = (void *)v97[5];
    if (v8)
    {
      if ([v8 code] == (id)47)
      {
        v94.receiver = self;
        v94.super_class = (Class)NFRemoteAdminReaderSession;
        [(NFRemoteAdminRedirectSession *)&v94 abort:6];
      }
      SEL v9 = &stru_1000586F8;
      goto LABEL_11;
    }
    if ([(NFRemoteAdminRedirectSession *)self aborted])
    {
      SEL v9 = &stru_100058718;
LABEL_11:
      [v7 endSessionWithCompletion:v9];
LABEL_12:
      unint64_t v3 = 5;
LABEL_13:

      _Block_object_dispose(&v96, 8);
      return v3;
    }
    objc_storeStrong((id *)p_readerSession, v7);
    [(NFReaderSession *)*p_readerSession setDelegate:self];
    if (!*p_readerSession) {
      goto LABEL_12;
    }
    [(NFRemoteAdminReaderSession *)self _fireCardIngestionStatus:10];
    if (self->_sessionUUID)
    {
      SEL v11 = +[NFCALogger sharedCALogger];
      self->_sessionStartTime = (unint64_t)[v11 getTimestamp];

      CFStringRef v112 = @"sessionStartTime";
      int v12 = +[NSDate now];
      uint64_t v113 = v12;
      id v13 = +[NSDictionary dictionaryWithObjects:&v113 forKeys:&v112 count:1];

      +[NFReaderModeCardIngestionCALogger postAnalyticsReaderModeCardIngestionSession:v13 prepOnly:1];
    }
    int v14 = [(NFRemoteAdminReaderSession *)self sessionCardServiceInfo];
    unint64_t v15 = [v14 objectForKeyedSubscript:@"version"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      __int16 v17 = [v14 objectForKeyedSubscript:@"version"];
      unsigned int v18 = [v17 intValue];

      if (v18 == 3) {
        id v19 = [(NFReaderSession *)*p_readerSession skipMifareClassification];
      }
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
    {
      Class = object_getClass(self);
      if (class_isMetaClass(Class)) {
        uint64_t v22 = 43;
      }
      else {
        uint64_t v22 = 45;
      }
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      Logger(6, "%c[%{public}s %{public}s]:%i Waiting for tag", v22, ClassName, Name, 1066);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    __int16 v25 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v26 = object_getClass(self);
      if (class_isMetaClass(v26)) {
        int v27 = 43;
      }
      else {
        int v27 = 45;
      }
      __int16 v28 = object_getClassName(self);
      uint64_t v29 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v103 = v27;
      __int16 v104 = 2082;
      v105 = v28;
      __int16 v106 = 2082;
      int v107 = v29;
      __int16 v108 = 1024;
      int v109 = 1066;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Waiting for tag", buf, 0x22u);
    }

    uint64_t v30 = [(NFRemoteAdminRedirectSession *)self redirectState];
    BOOL v31 = [v30 requestInfo];
    id v32 = [v31 maxDetectionTimeout];

    uint64_t v33 = [(NFRemoteAdminReaderSession *)self connectTagWithTimeout:v32];
    __int16 v34 = (void *)v97[5];
    v97[5] = v33;

    if (v97[5])
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v35 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v35)
      {
        __int16 v36 = object_getClass(self);
        if (class_isMetaClass(v36)) {
          uint64_t v37 = 43;
        }
        else {
          uint64_t v37 = 45;
        }
        id v38 = object_getClassName(self);
        int v39 = sel_getName(a2);
        v35(3, "%c[%{public}s %{public}s]:%i Failed to connect a tag : %@", v37, v38, v39, 1070, v97[5]);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      __int16 v40 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        Class v41 = object_getClass(self);
        if (class_isMetaClass(v41)) {
          int v42 = 43;
        }
        else {
          int v42 = 45;
        }
        id v43 = object_getClassName(self);
        __int16 v44 = sel_getName(a2);
        unint64_t v45 = v97[5];
        *(_DWORD *)buf = 67110146;
        int v103 = v42;
        __int16 v104 = 2082;
        v105 = v43;
        __int16 v106 = 2082;
        int v107 = v44;
        __int16 v108 = 1024;
        int v109 = 1070;
        __int16 v110 = 2112;
        unint64_t v111 = v45;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to connect a tag : %@", buf, 0x2Cu);
      }

      [(NFRemoteAdminReaderSession *)self _closeSession];
      if ([(id)v97[5] code] == (id)47)
      {
        unint64_t v3 = 13;
        [(NFRemoteAdminReaderSession *)self _fireCardIngestionStatus:13];
      }
      else
      {
        unint64_t v3 = 6;
        [(NFRemoteAdminReaderSession *)self _fireCardIngestionStatus:6];
      }
LABEL_101:

      goto LABEL_13;
    }
    if ([(NFRemoteAdminReaderSession *)self _validateCard])
    {
      long long v46 = [v14 objectForKeyedSubscript:@"cardServiceId"];

      if (v46)
      {
        uint64_t v47 = [v14 objectForKeyedSubscript:@"cardServiceId"];
        [(NSMutableDictionary *)self->_cardContents setObject:v47 forKeyedSubscript:@"cardServiceId"];
      }
      long long v48 = [(NFRemoteAdminReaderSession *)self _gatherCardStateInfo];
      if (v48)
      {
        [(NSMutableDictionary *)self->_cardContents addEntriesFromDictionary:v48];
LABEL_49:

        if (byte_100060438)
        {
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          BOOL v49 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v49)
          {
            BOOL v50 = object_getClass(self);
            if (class_isMetaClass(v50)) {
              uint64_t v51 = 43;
            }
            else {
              uint64_t v51 = 45;
            }
            uint64_t v52 = object_getClassName(self);
            __int16 v53 = sel_getName(a2);
            v49(6, "%c[%{public}s %{public}s]:%i [TSM] connected tag: %@", v51, v52, v53, 1114, self->_tag);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          int v54 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v55 = object_getClass(self);
            if (class_isMetaClass(v55)) {
              int v56 = 43;
            }
            else {
              int v56 = 45;
            }
            __int16 v57 = object_getClassName(self);
            Class v58 = sel_getName(a2);
            tag = self->_tag;
            *(_DWORD *)buf = 67110146;
            int v103 = v56;
            __int16 v104 = 2082;
            v105 = v57;
            __int16 v106 = 2082;
            int v107 = v58;
            __int16 v108 = 1024;
            int v109 = 1114;
            __int16 v110 = 2112;
            unint64_t v111 = (unint64_t)tag;
            _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] connected tag: %@", buf, 0x2Cu);
          }
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v60 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v60)
        {
          unint64_t v61 = object_getClass(self);
          if (class_isMetaClass(v61)) {
            uint64_t v62 = 43;
          }
          else {
            uint64_t v62 = 45;
          }
          BOOL v63 = object_getClassName(self);
          int v64 = sel_getName(a2);
          v60(6, "%c[%{public}s %{public}s]:%i connected tag", v62, v63, v64, 1115);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        __int16 v65 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v66 = object_getClass(self);
          if (class_isMetaClass(v66)) {
            int v67 = 43;
          }
          else {
            int v67 = 45;
          }
          id v68 = object_getClassName(self);
          __int16 v69 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          int v103 = v67;
          __int16 v104 = 2082;
          v105 = v68;
          __int16 v106 = 2082;
          int v107 = v69;
          __int16 v108 = 1024;
          int v109 = 1115;
          _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i connected tag", buf, 0x22u);
        }

        unint64_t v3 = 2;
        [(NFRemoteAdminReaderSession *)self _fireCardIngestionStatus:2];
        goto LABEL_101;
      }
      if (!self->_cardValidationStatus) {
        goto LABEL_49;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v70 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v70)
      {
        int v71 = object_getClass(self);
        if (class_isMetaClass(v71)) {
          uint64_t v72 = 43;
        }
        else {
          uint64_t v72 = 45;
        }
        v73 = object_getClassName(self);
        int v74 = sel_getName(a2);
        v70(3, "%c[%{public}s %{public}s]:%i returnStatus of stateInfo: %lu", v72, v73, v74, 1093, self->_cardValidationStatus);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      long long v75 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
      {
        long long v76 = object_getClass(self);
        if (class_isMetaClass(v76)) {
          int v77 = 43;
        }
        else {
          int v77 = 45;
        }
        long long v78 = object_getClassName(self);
        v79 = sel_getName(a2);
        unint64_t cardValidationStatus = self->_cardValidationStatus;
        *(_DWORD *)buf = 67110146;
        int v103 = v77;
        __int16 v104 = 2082;
        v105 = v78;
        __int16 v106 = 2082;
        int v107 = v79;
        __int16 v108 = 1024;
        int v109 = 1093;
        __int16 v110 = 2048;
        unint64_t v111 = cardValidationStatus;
        _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i returnStatus of stateInfo: %lu", buf, 0x2Cu);
      }
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v81 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v81)
    {
      __int16 v82 = object_getClass(self);
      if (class_isMetaClass(v82)) {
        uint64_t v83 = 43;
      }
      else {
        uint64_t v83 = 45;
      }
      __int16 v84 = object_getClassName(self);
      uint64_t v85 = sel_getName(a2);
      v81(3, "%c[%{public}s %{public}s]:%i _validateCard Failed with status %lu", v83, v84, v85, 1099, self->_cardValidationStatus);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    __int16 v86 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
    {
      int v87 = object_getClass(self);
      if (class_isMetaClass(v87)) {
        int v88 = 43;
      }
      else {
        int v88 = 45;
      }
      uint64_t v89 = object_getClassName(self);
      __int16 v90 = sel_getName(a2);
      unint64_t v91 = self->_cardValidationStatus;
      *(_DWORD *)buf = 67110146;
      int v103 = v88;
      __int16 v104 = 2082;
      v105 = v89;
      __int16 v106 = 2082;
      int v107 = v90;
      __int16 v108 = 1024;
      int v109 = 1099;
      __int16 v110 = 2048;
      unint64_t v111 = v91;
      _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i _validateCard Failed with status %lu", buf, 0x2Cu);
    }

    [(NFRemoteAdminReaderSession *)self _closeSession];
    unint64_t v92 = self->_cardValidationStatus;
    uint64_t v93 = 9;
    if (v92 == 5) {
      uint64_t v93 = 7;
    }
    if (v92 == 4) {
      unint64_t v3 = 12;
    }
    else {
      unint64_t v3 = v93;
    }
    [(NFRemoteAdminReaderSession *)self _fireCardIngestionStatus:v3];
    goto LABEL_101;
  }
  return 2;
}

- (BOOL)_closeSession
{
  readerSession = self->_readerSession;
  if (readerSession)
  {
    if (self->_tag)
    {
      [(NFReaderSession *)self->_readerSession disconnectTag];
      dispatch_semaphore_t v4 = self->_readerSession;
    }
    else
    {
      dispatch_semaphore_t v4 = self->_readerSession;
    }
    [(NFReaderSession *)v4 stopPolling];
    if (self->_cathayIngestionSessionInProgress) {
      [(NFRemoteAdminReaderSession *)self _restoreRFSettingForCathayIngestion];
    }
    if (self->_mercuryIngestionSessionInProgress) {
      [(NFRemoteAdminReaderSession *)self _restoreRFSettingForMercuryIngestion];
    }
    [(NFReaderSession *)self->_readerSession endSessionWithCompletion:&stru_100058738];
    dispatch_semaphore_t v5 = self->_readerSession;
    self->_readerSession = 0;

    if (self->_sessionUUID)
    {
      CFStringRef v9 = @"sessionEndTime";
      uint64_t v6 = +[NSDate now];
      dispatch_semaphore_t v10 = v6;
      unint64_t v7 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];

      +[NFReaderModeCardIngestionCALogger postAnalyticsReaderModeCardIngestionSession:v7 prepOnly:1];
    }
  }
  return readerSession != 0;
}

- (void)readerSession:(id)a3 didDetectTags:(id)a4
{
  id v6 = a4;
  if ([v6 count])
  {
    unint64_t v7 = [v6 objectAtIndex:0];
    tag = self->_tag;
    self->_tag = v7;

    if (byte_100060438)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        dispatch_semaphore_t v10 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        uint64_t v15 = 45;
        if (isMetaClass) {
          uint64_t v15 = 43;
        }
        v10(6, "%c[%{public}s %{public}s]:%i [TSM] Detected tag: %@", v15, ClassName, Name, 1163, self->_tag);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v16 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v17 = object_getClass(self);
        if (class_isMetaClass(v17)) {
          int v18 = 43;
        }
        else {
          int v18 = 45;
        }
        id v19 = object_getClassName(self);
        Class v20 = sel_getName(a2);
        __int16 v21 = self->_tag;
        *(_DWORD *)buf = 67110146;
        int v59 = v18;
        __int16 v60 = 2082;
        unint64_t v61 = v19;
        __int16 v62 = 2082;
        BOOL v63 = v20;
        __int16 v64 = 1024;
        int v65 = 1163;
        __int16 v66 = 2112;
        int v67 = v21;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Detected tag: %@", buf, 0x2Cu);
      }
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v22 = NFLogGetLogger();
    if (v22)
    {
      char v23 = (void (*)(uint64_t, const char *, ...))v22;
      uint64_t v24 = object_getClass(self);
      BOOL v25 = class_isMetaClass(v24);
      __int16 v26 = object_getClassName(self);
      int v56 = sel_getName(a2);
      uint64_t v27 = 45;
      if (v25) {
        uint64_t v27 = 43;
      }
      v23(6, "%c[%{public}s %{public}s]:%i Detected tag", v27, v26, v56, 1164);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    __int16 v28 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v29 = object_getClass(self);
      if (class_isMetaClass(v29)) {
        int v30 = 43;
      }
      else {
        int v30 = 45;
      }
      BOOL v31 = object_getClassName(self);
      id v32 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v59 = v30;
      __int16 v60 = 2082;
      unint64_t v61 = v31;
      __int16 v62 = 2082;
      BOOL v63 = v32;
      __int16 v64 = 1024;
      int v65 = 1164;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Detected tag", buf, 0x22u);
    }

    if (([(NFReaderSession *)self->_readerSession connectTag:self->_tag] & 1) == 0)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v33 = NFLogGetLogger();
      if (v33)
      {
        __int16 v34 = (void (*)(uint64_t, const char *, ...))v33;
        int v35 = object_getClass(self);
        BOOL v36 = class_isMetaClass(v35);
        uint64_t v37 = object_getClassName(self);
        id v38 = sel_getName(a2);
        uint64_t v39 = 45;
        if (v36) {
          uint64_t v39 = 43;
        }
        v34(3, "%c[%{public}s %{public}s]:%i Failed to connect tag: %{public}@", v39, v37, v38, 1166, self->_tag);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      __int16 v40 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        Class v41 = object_getClass(self);
        if (class_isMetaClass(v41)) {
          int v42 = 43;
        }
        else {
          int v42 = 45;
        }
        id v43 = object_getClassName(self);
        __int16 v44 = sel_getName(a2);
        unint64_t v45 = self->_tag;
        *(_DWORD *)buf = 67110146;
        int v59 = v42;
        __int16 v60 = 2082;
        unint64_t v61 = v43;
        __int16 v62 = 2082;
        BOOL v63 = v44;
        __int16 v64 = 1024;
        int v65 = 1166;
        __int16 v66 = 2114;
        int v67 = v45;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to connect tag: %{public}@", buf, 0x2Cu);
      }

      long long v46 = self->_tag;
      self->_tag = 0;
    }
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_tagSem);
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v47 = NFLogGetLogger();
    if (v47)
    {
      long long v48 = (void (*)(uint64_t, const char *, ...))v47;
      BOOL v49 = object_getClass(self);
      BOOL v50 = class_isMetaClass(v49);
      uint64_t v51 = object_getClassName(self);
      __int16 v57 = sel_getName(a2);
      uint64_t v52 = 45;
      if (v50) {
        uint64_t v52 = 43;
      }
      v48(3, "%c[%{public}s %{public}s]:%i No tags found", v52, v51, v57, 1176);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    __int16 v53 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      int v54 = object_getClass(self);
      if (class_isMetaClass(v54)) {
        int v55 = 43;
      }
      else {
        int v55 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v59 = v55;
      __int16 v60 = 2082;
      unint64_t v61 = object_getClassName(self);
      __int16 v62 = 2082;
      BOOL v63 = sel_getName(a2);
      __int16 v64 = 1024;
      int v65 = 1176;
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i No tags found", buf, 0x22u);
    }
  }
}

- (void)readerSessionDidEndUnexpectedly:(id)a3 reason:(id)a4
{
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v7 = a4;
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    CFStringRef v9 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v13 = 45;
    if (isMetaClass) {
      uint64_t v13 = 43;
    }
    v9(3, "%c[%{public}s %{public}s]:%i Lost reader session", v13, ClassName, Name, 1181);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  int v14 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    uint64_t v15 = object_getClass(self);
    if (class_isMetaClass(v15)) {
      int v16 = 43;
    }
    else {
      int v16 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v21 = v16;
    __int16 v22 = 2082;
    char v23 = object_getClassName(self);
    __int16 v24 = 2082;
    BOOL v25 = sel_getName(a2);
    __int16 v26 = 1024;
    int v27 = 1181;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Lost reader session", buf, 0x22u);
  }

  id v17 = [v7 code];
  if (v17 == (id)47) {
    uint64_t v18 = 6;
  }
  else {
    uint64_t v18 = 2;
  }
  [(NFRemoteAdminReaderSession *)self abort:v18];
}

- (id)connectTagWithTimeout:(unint64_t)a3
{
  id v6 = [(NFRemoteAdminRedirectSession *)self redirectState];
  int v56 = a2;
  __int16 v57 = v6;
  if (v6)
  {
    id v7 = [v6 parameters];
    dispatch_semaphore_t v8 = [v7 objectForKeyedSubscript:@"technology"];

    CFStringRef v9 = [v8 uppercaseString];
  }
  else
  {
    CFStringRef v9 = 0;
  }
  dispatch_semaphore_t v10 = [(NFRemoteAdminReaderSession *)self sessionCardServiceInfo];
  SEL v11 = [v10 objectForKeyedSubscript:@"version"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v13 = [v10 objectForKeyedSubscript:@"version"];
    unsigned int v14 = [v13 intValue];
  }
  else
  {
    unsigned int v14 = 0;
  }
  uint64_t v15 = 0;
  int64_t v16 = a3;
  do
  {
    if (v14 == 2)
    {
      readerSession = self->_readerSession;
      __int16 v60 = v15;
      uint64_t v18 = (id *)&v60;
      id v19 = (void **)&v60;
      uint64_t v20 = 4;
      goto LABEL_13;
    }
    if (v14 == 3 && [v9 containsString:@"A"])
    {
      readerSession = self->_readerSession;
      int v59 = v15;
      uint64_t v18 = (id *)&v59;
      id v19 = (void **)&v59;
      uint64_t v20 = 1;
LABEL_13:
      [(NFReaderSession *)readerSession startPollingForTechnology:v20 error:v19];
      goto LABEL_15;
    }
    int v21 = self->_readerSession;
    Class v58 = v15;
    uint64_t v18 = (id *)&v58;
    [(NFReaderSession *)v21 startPollingWithError:&v58];
LABEL_15:
    __int16 v22 = (__CFString *)*v18;

    if ([(__CFString *)v22 code] == (id)47)
    {
      sleep(1u);
      v16 -= 1000;
    }
    BOOL v23 = [(__CFString *)v22 code] != (id)47 || v16 <= 0;
    uint64_t v15 = v22;
  }
  while (!v23);
  if (a3) {
    dispatch_time_t v24 = dispatch_time(0, 1000000 * (v16 & ~(v16 >> 63)));
  }
  else {
    dispatch_time_t v24 = -1;
  }
  if (dispatch_semaphore_wait((dispatch_semaphore_t)self->_tagSem, v24) || !self->_tag)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      __int16 v26 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(v56);
      if (v22) {
        CFStringRef v31 = v22;
      }
      else {
        CFStringRef v31 = @"Timeout";
      }
      uint64_t v32 = 45;
      if (isMetaClass) {
        uint64_t v32 = 43;
      }
      v26(3, "%c[%{public}s %{public}s]:%i Failed to connect a tag : %@", v32, ClassName, Name, 1240, v31);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v33 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      __int16 v34 = object_getClass(self);
      if (class_isMetaClass(v34)) {
        int v35 = 43;
      }
      else {
        int v35 = 45;
      }
      BOOL v36 = object_getClassName(self);
      uint64_t v37 = sel_getName(v56);
      *(_DWORD *)buf = 67110146;
      if (v22) {
        CFStringRef v38 = v22;
      }
      else {
        CFStringRef v38 = @"Timeout";
      }
      int v64 = v35;
      __int16 v65 = 2082;
      __int16 v66 = v36;
      __int16 v67 = 2082;
      id v68 = v37;
      __int16 v69 = 1024;
      int v70 = 1240;
      __int16 v71 = 2112;
      CFStringRef v72 = v38;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to connect a tag : %@", buf, 0x2Cu);
    }

    if (v22)
    {
      uint64_t v39 = v22;
    }
    else
    {
      id v51 = objc_alloc((Class)NSError);
      uint64_t v52 = +[NSString stringWithUTF8String:"seld"];
      NSErrorUserInfoKey v61 = NSLocalizedDescriptionKey;
      CFStringRef v62 = @"Timeout";
      __int16 v53 = +[NSDictionary dictionaryWithObjects:&v62 forKeys:&v61 count:1];
      uint64_t v39 = (__CFString *)[v51 initWithDomain:v52 code:5 userInfo:v53];
    }
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v40 = NFLogGetLogger();
    if (v40)
    {
      Class v41 = (void (*)(uint64_t, const char *, ...))v40;
      int v42 = object_getClass(self);
      BOOL v43 = class_isMetaClass(v42);
      __int16 v44 = object_getClassName(self);
      int v55 = sel_getName(v56);
      uint64_t v45 = 45;
      if (v43) {
        uint64_t v45 = 43;
      }
      v41(6, "%c[%{public}s %{public}s]:%i Tag found", v45, v44, v55, 1243);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    long long v46 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v47 = object_getClass(self);
      if (class_isMetaClass(v47)) {
        int v48 = 43;
      }
      else {
        int v48 = 45;
      }
      BOOL v49 = object_getClassName(self);
      BOOL v50 = sel_getName(v56);
      *(_DWORD *)buf = 67109890;
      int v64 = v48;
      __int16 v65 = 2082;
      __int16 v66 = v49;
      __int16 v67 = 2082;
      id v68 = v50;
      __int16 v69 = 1024;
      int v70 = 1243;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Tag found", buf, 0x22u);
    }

    uint64_t v39 = 0;
  }

  return v39;
}

- (BOOL)reconnectTag
{
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    dispatch_semaphore_t v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v5(6, "%c[%{public}s %{public}s]:%i Disconnecting tag", v9, ClassName, Name, 1250);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  dispatch_semaphore_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    SEL v11 = object_getClass(self);
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v31 = v12;
    __int16 v32 = 2082;
    uint64_t v33 = object_getClassName(self);
    __int16 v34 = 2082;
    int v35 = sel_getName(a2);
    __int16 v36 = 1024;
    int v37 = 1250;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Disconnecting tag", buf, 0x22u);
  }

  [(NFReaderSession *)self->_readerSession disconnectTag];
  [(NFReaderSession *)self->_readerSession stopPolling];
  tag = self->_tag;
  self->_tag = 0;

  usleep(0xC350u);
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v14 = NFLogGetLogger();
  if (v14)
  {
    uint64_t v15 = (void (*)(uint64_t, const char *, ...))v14;
    int64_t v16 = object_getClass(self);
    BOOL v17 = class_isMetaClass(v16);
    uint64_t v18 = object_getClassName(self);
    uint64_t v29 = sel_getName(a2);
    uint64_t v19 = 45;
    if (v17) {
      uint64_t v19 = 43;
    }
    v15(6, "%c[%{public}s %{public}s]:%i Connecting tag", v19, v18, v29, 1259);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v20 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = object_getClass(self);
    if (class_isMetaClass(v21)) {
      int v22 = 43;
    }
    else {
      int v22 = 45;
    }
    BOOL v23 = object_getClassName(self);
    dispatch_time_t v24 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    int v31 = v22;
    __int16 v32 = 2082;
    uint64_t v33 = v23;
    __int16 v34 = 2082;
    int v35 = v24;
    __int16 v36 = 1024;
    int v37 = 1259;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Connecting tag", buf, 0x22u);
  }

  BOOL v25 = [(NFRemoteAdminReaderSession *)self connectTagWithTimeout:1000];
  BOOL v26 = v25 == 0;

  return v26;
}

- (unint64_t)_performReaderModeRequest
{
  dispatch_semaphore_t v5 = [(NFRemoteAdminReaderSession *)self getNextRequest];
  if ([v5 count])
  {
    v79 = v4;
    [(NFRemoteAdminReaderSession *)self _fireCardIngestionStatus:3];
    id v6 = objc_opt_new();
    id v7 = objc_opt_new();
    id v80 = 0;
    unint64_t v8 = [(NFRemoteAdminRedirectSession *)self executeHttpRequest:v5 httpHeader:0 response:v6 responseHeader:v7 duration:0 sessionError:&v80];
    id v9 = v80;
    dispatch_semaphore_t v10 = [(NFRemoteAdminRedirectSession *)self redirectState];
    SEL v11 = [v10 performanceMetrics];
    long long v78 = v9;
    [v11 setNsUrlSessionError:v9];

    if (v8)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        uint64_t v13 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        uint64_t v17 = 45;
        if (isMetaClass) {
          uint64_t v17 = 43;
        }
        v13(3, "%c[%{public}s %{public}s]:%i HTTP Request failed", v17, ClassName, Name, 1304);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v18 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = object_getClass(self);
        if (class_isMetaClass(v19)) {
          int v20 = 43;
        }
        else {
          int v20 = 45;
        }
        int v21 = object_getClassName(self);
        int v22 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        int v82 = v20;
        __int16 v83 = 2082;
        __int16 v84 = v21;
        __int16 v85 = 2082;
        __int16 v86 = v22;
        __int16 v87 = 1024;
        int v88 = 1304;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i HTTP Request failed", buf, 0x22u);
      }
    }
    else
    {
      uint64_t v18 = [v6 NF_dictionaryForKey:@"redirectRequest"];
      if ([v18 count])
      {
        if (byte_100060438)
        {
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v31 = NFLogGetLogger();
          if (v31)
          {
            __int16 v32 = (void (*)(uint64_t, const char *, ...))v31;
            uint64_t v33 = object_getClass(self);
            BOOL v34 = class_isMetaClass(v33);
            CFStringRef v72 = object_getClassName(self);
            long long v75 = sel_getName(a2);
            uint64_t v35 = 45;
            if (v34) {
              uint64_t v35 = 43;
            }
            v32(6, "%c[%{public}s %{public}s]:%i [TSM] Received redirect information: %@", v35, v72, v75, 1290, v18);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          __int16 v36 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            int v37 = object_getClass(self);
            if (class_isMetaClass(v37)) {
              int v38 = 43;
            }
            else {
              int v38 = 45;
            }
            uint64_t v39 = object_getClassName(self);
            uint64_t v40 = sel_getName(a2);
            *(_DWORD *)buf = 67110146;
            int v82 = v38;
            __int16 v83 = 2082;
            __int16 v84 = v39;
            __int16 v85 = 2082;
            __int16 v86 = v40;
            __int16 v87 = 1024;
            int v88 = 1290;
            __int16 v89 = 2112;
            __int16 v90 = v18;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Received redirect information: %@", buf, 0x2Cu);
          }
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v41 = NFLogGetLogger();
        if (v41)
        {
          int v42 = (void (*)(uint64_t, const char *, ...))v41;
          BOOL v43 = object_getClass(self);
          BOOL v44 = class_isMetaClass(v43);
          uint64_t v45 = object_getClassName(self);
          long long v76 = sel_getName(a2);
          uint64_t v46 = 45;
          if (v44) {
            uint64_t v46 = 43;
          }
          v42(6, "%c[%{public}s %{public}s]:%i Received redirect information", v46, v45, v76, 1291);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v47 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          int v48 = object_getClass(self);
          if (class_isMetaClass(v48)) {
            int v49 = 43;
          }
          else {
            int v49 = 45;
          }
          BOOL v50 = object_getClassName(self);
          id v51 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          int v82 = v49;
          __int16 v83 = 2082;
          __int16 v84 = v50;
          __int16 v85 = 2082;
          __int16 v86 = v51;
          __int16 v87 = 1024;
          int v88 = 1291;
          _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Received redirect information", buf, 0x22u);
        }

        uint64_t v52 = [v6 NF_stringForKey:@"kBatchId"];
        __int16 v53 = [(NFRemoteAdminRedirectSession *)self redirectState];
        [v53 setBatchId:v52];

        int v54 = [v6 NF_stringForKey:@"kTaskId"];
        int v55 = [(NFRemoteAdminRedirectSession *)self redirectState];
        [v55 setTaskId:v54];

        int v56 = [v18 NF_stringForKey:@"targetURL"];
        __int16 v57 = [(NFRemoteAdminRedirectSession *)self redirectState];
        [v57 setRedirectUrl:v56];

        Class v58 = [v18 NF_dictionaryForKey:@"forwardData"];
        int v59 = [(NFRemoteAdminRedirectSession *)self redirectState];
        [v59 setForwardDataToSP:v58];

        __int16 v60 = [(NFRemoteAdminRedirectSession *)self redirectState];
        [v60 setHttpHeaderInfo:v7];
        unint64_t v8 = 0;
      }
      else
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v61 = NFLogGetLogger();
        if (v61)
        {
          CFStringRef v62 = (void (*)(uint64_t, const char *, ...))v61;
          BOOL v63 = object_getClass(self);
          BOOL v64 = class_isMetaClass(v63);
          __int16 v65 = object_getClassName(self);
          int v77 = sel_getName(a2);
          uint64_t v66 = 45;
          if (v64) {
            uint64_t v66 = 43;
          }
          v62(3, "%c[%{public}s %{public}s]:%i Failed to receive redirect info for reader mode request", v66, v65, v77, 1299);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        __int16 v60 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
        {
          __int16 v67 = object_getClass(self);
          if (class_isMetaClass(v67)) {
            int v68 = 43;
          }
          else {
            int v68 = 45;
          }
          __int16 v69 = object_getClassName(self);
          int v70 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          int v82 = v68;
          __int16 v83 = 2082;
          __int16 v84 = v69;
          __int16 v85 = 2082;
          __int16 v86 = v70;
          __int16 v87 = 1024;
          int v88 = 1299;
          _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to receive redirect info for reader mode request", buf, 0x22u);
        }
        unint64_t v8 = 5;
      }
    }
    dispatch_semaphore_t v4 = v79;
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v23 = NFLogGetLogger();
    if (v23)
    {
      dispatch_time_t v24 = (void (*)(uint64_t, const char *, ...))v23;
      BOOL v25 = object_getClass(self);
      BOOL v26 = class_isMetaClass(v25);
      int v27 = object_getClassName(self);
      int v74 = sel_getName(a2);
      uint64_t v28 = 45;
      if (v26) {
        uint64_t v28 = 43;
      }
      v24(3, "%c[%{public}s %{public}s]:%i Failed to get next request", v28, v27, v74, 1273);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v6 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = object_getClass(self);
      if (class_isMetaClass(v29)) {
        int v30 = 43;
      }
      else {
        int v30 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v82 = v30;
      __int16 v83 = 2082;
      __int16 v84 = object_getClassName(self);
      __int16 v85 = 2082;
      __int16 v86 = sel_getName(a2);
      __int16 v87 = 1024;
      int v88 = 1273;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to get next request", buf, 0x22u);
    }
    unint64_t v8 = 3;
  }

  return v8;
}

- (unint64_t)run
{
  id v123 = 0;
  dispatch_semaphore_t v4 = +[NFSecureElement embeddedSecureElementWithError:&v123];
  id v5 = v123;
  if (!v4 || ([v4 available] & 1) == 0)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      dispatch_semaphore_t v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v13 = 45;
      if (isMetaClass) {
        uint64_t v13 = 43;
      }
      v10(3, "%c[%{public}s %{public}s]:%i eSE unavailable, aborting.  Error - %{public}@", v13, ClassName, Name, 1317, v5);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = object_getClass(self);
      if (class_isMetaClass(v15)) {
        int v16 = 43;
      }
      else {
        int v16 = 45;
      }
      uint64_t v17 = object_getClassName(self);
      uint64_t v18 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      int v127 = v16;
      __int16 v128 = 2082;
      int v129 = v17;
      __int16 v130 = 2082;
      uint64_t v131 = v18;
      __int16 v132 = 1024;
      int v133 = 1317;
      __int16 v134 = 2114;
      id v135 = v5;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i eSE unavailable, aborting.  Error - %{public}@", buf, 0x2Cu);
    }

    [(NFRemoteAdminReaderSession *)self _fireCardIngestionStatus:5];
    uint64_t v19 = [(NFRemoteAdminRedirectSession *)self redirectState];
    [v19 setStep:3];

    id v20 = [(NFRemoteAdminRedirectSession *)self redirectState];
    [v20 save];
    unint64_t v8 = 1;
    goto LABEL_15;
  }
  id v6 = [(NFRemoteAdminRedirectSession *)self redirectState];
  id v7 = [v6 step];

  if (v7)
  {
    unint64_t v8 = 0;
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v22 = NFLogGetLogger();
    if (v22)
    {
      uint64_t v23 = (void (*)(uint64_t, const char *, ...))v22;
      dispatch_time_t v24 = object_getClass(self);
      BOOL v25 = class_isMetaClass(v24);
      BOOL v26 = object_getClassName(self);
      uint64_t v118 = sel_getName(a2);
      uint64_t v27 = 45;
      if (v25) {
        uint64_t v27 = 43;
      }
      v23(6, "%c[%{public}s %{public}s]:%i initiating reader mode request", v27, v26, v118, 1329);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v28 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v29 = object_getClass(self);
      if (class_isMetaClass(v29)) {
        int v30 = 43;
      }
      else {
        int v30 = 45;
      }
      uint64_t v31 = object_getClassName(self);
      __int16 v32 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v127 = v30;
      __int16 v128 = 2082;
      int v129 = v31;
      __int16 v130 = 2082;
      uint64_t v131 = v32;
      __int16 v132 = 1024;
      int v133 = 1329;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i initiating reader mode request", buf, 0x22u);
    }

    unint64_t v8 = [(NFRemoteAdminReaderSession *)self _doInitialRequest];
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v33 = NFLogGetLogger();
    if (v33)
    {
      BOOL v34 = (void (*)(uint64_t, const char *, ...))v33;
      uint64_t v35 = object_getClass(self);
      BOOL v36 = class_isMetaClass(v35);
      int v115 = object_getClassName(self);
      v119 = sel_getName(a2);
      uint64_t v37 = 45;
      if (v36) {
        uint64_t v37 = 43;
      }
      v34(6, "%c[%{public}s %{public}s]:%i Result = 0x%04x", v37, v115, v119, 1331, v8);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v38 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v39 = object_getClass(self);
      if (class_isMetaClass(v39)) {
        int v40 = 43;
      }
      else {
        int v40 = 45;
      }
      uint64_t v41 = object_getClassName(self);
      int v42 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      int v127 = v40;
      __int16 v128 = 2082;
      int v129 = v41;
      __int16 v130 = 2082;
      uint64_t v131 = v42;
      __int16 v132 = 1024;
      int v133 = 1331;
      __int16 v134 = 1024;
      LODWORD(v135) = v8;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Result = 0x%04x", buf, 0x28u);
    }

    v124[0] = @"state";
    v124[1] = @"technology";
    v125[0] = &off_10005B278;
    BOOL v43 = +[NSNumber numberWithUnsignedInt:[(NFRemoteAdminReaderSession *)self targetTagType]];
    v125[1] = v43;
    BOOL v44 = +[NSDictionary dictionaryWithObjects:v125 forKeys:v124 count:2];

    +[NFReaderModeCardIngestionCALogger postAnalyticsReaderModeCardIngestionSession:v44 prepOnly:1];
  }
  uint64_t v45 = [(NFRemoteAdminRedirectSession *)self redirectState];
  id v46 = [v45 step];

  if (self && v46 == (id)3 && v8 == 2) {
    self->_int cardIngestionStatus = 2;
  }
  uint64_t v47 = [(NFRemoteAdminRedirectSession *)self redirectState];
  id v48 = [v47 step];

  if (v48 == (id)1)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v49 = NFLogGetLogger();
    if (v49)
    {
      BOOL v50 = (void (*)(uint64_t, const char *, ...))v49;
      id v51 = object_getClass(self);
      BOOL v52 = class_isMetaClass(v51);
      __int16 v53 = object_getClassName(self);
      int v120 = sel_getName(a2);
      uint64_t v54 = 45;
      if (v52) {
        uint64_t v54 = 43;
      }
      v50(6, "%c[%{public}s %{public}s]:%i Performing reader mode redirect", v54, v53, v120, 1348);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v55 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      int v56 = object_getClass(self);
      if (class_isMetaClass(v56)) {
        int v57 = 43;
      }
      else {
        int v57 = 45;
      }
      Class v58 = object_getClassName(self);
      int v59 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v127 = v57;
      __int16 v128 = 2082;
      int v129 = v58;
      __int16 v130 = 2082;
      uint64_t v131 = v59;
      __int16 v132 = 1024;
      int v133 = 1348;
      _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Performing reader mode redirect", buf, 0x22u);
    }

    unint64_t v60 = [(NFRemoteAdminReaderSession *)self _doReaderModeRedirect];
    if (self) {
      self->_int cardIngestionStatus = v60;
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v61 = NFLogGetLogger();
    if (v61)
    {
      CFStringRef v62 = (void (*)(uint64_t, const char *, ...))v61;
      BOOL v63 = object_getClass(self);
      if (class_isMetaClass(v63)) {
        uint64_t v64 = 43;
      }
      else {
        uint64_t v64 = 45;
      }
      __int16 v65 = object_getClassName(self);
      uint64_t v66 = sel_getName(a2);
      if (self) {
        uint64_t cardIngestionStatus_low = LODWORD(self->_cardIngestionStatus);
      }
      else {
        uint64_t cardIngestionStatus_low = 0;
      }
      v62(6, "%c[%{public}s %{public}s]:%i Result = 0x%04x", v64, v65, v66, 1350, cardIngestionStatus_low);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v68 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v69 = object_getClass(self);
      if (class_isMetaClass(v69)) {
        int v70 = 43;
      }
      else {
        int v70 = 45;
      }
      __int16 v71 = object_getClassName(self);
      CFStringRef v72 = sel_getName(a2);
      if (self) {
        int cardIngestionStatus = self->_cardIngestionStatus;
      }
      else {
        int cardIngestionStatus = 0;
      }
      *(_DWORD *)buf = 67110146;
      int v127 = v70;
      __int16 v128 = 2082;
      int v129 = v71;
      __int16 v130 = 2082;
      uint64_t v131 = v72;
      __int16 v132 = 1024;
      int v133 = 1350;
      __int16 v134 = 1024;
      LODWORD(v135) = cardIngestionStatus;
      _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Result = 0x%04x", buf, 0x28u);
    }

    id v74 = objc_alloc((Class)NSMutableDictionary);
    long long v75 = +[NSNumber numberWithUnsignedInt:[(NFRemoteAdminReaderSession *)self targetTagType]];
    long long v76 = +[NSNumber numberWithUnsignedInteger:self->_cardValidationStatus];
    id v77 = [v74 initWithObjectsAndKeys:&off_10005B290, @"state", v75, @"technology", v76, @"cardValidationStatus", 0];

    if (self->_cardIngestionStatus != -1)
    {
      long long v78 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
      [v77 setObject:v78 forKeyedSubscript:@"sessionStatus"];
    }
    v79 = [(NFRemoteAdminRedirectSession *)self redirectState];
    id v80 = [v79 spStatusCode];

    if (v80)
    {
      int v81 = [(NFRemoteAdminRedirectSession *)self redirectState];
      int v82 = [v81 spStatusCode];
      [v77 setObject:v82 forKey:@"spStatus"];
    }
    +[NFReaderModeCardIngestionCALogger postAnalyticsReaderModeCardIngestionSession:v77 prepOnly:1];
  }
  __int16 v83 = [(NFRemoteAdminRedirectSession *)self redirectState];
  id v84 = [v83 step];

  if (v84 == (id)2)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v85 = NFLogGetLogger();
    if (v85)
    {
      __int16 v86 = (void (*)(uint64_t, const char *, ...))v85;
      __int16 v87 = object_getClass(self);
      BOOL v88 = class_isMetaClass(v87);
      __int16 v89 = object_getClassName(self);
      v121 = sel_getName(a2);
      uint64_t v90 = 45;
      if (v88) {
        uint64_t v90 = 43;
      }
      v86(6, "%c[%{public}s %{public}s]:%i Performing post-redirect TSM check in", v90, v89, v121, 1370);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    unint64_t v91 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v92 = object_getClass(self);
      if (class_isMetaClass(v92)) {
        int v93 = 43;
      }
      else {
        int v93 = 45;
      }
      objc_super v94 = object_getClassName(self);
      long long v95 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v127 = v93;
      __int16 v128 = 2082;
      int v129 = v94;
      __int16 v130 = 2082;
      uint64_t v131 = v95;
      __int16 v132 = 1024;
      int v133 = 1370;
      _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Performing post-redirect TSM check in", buf, 0x22u);
    }

    unint64_t v8 = [(NFRemoteAdminReaderSession *)self _doFinalTSMCheckIn];
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v96 = NFLogGetLogger();
    if (v96)
    {
      v97 = (void (*)(uint64_t, const char *, ...))v96;
      uint64_t v98 = object_getClass(self);
      BOOL v99 = class_isMetaClass(v98);
      BOOL v116 = object_getClassName(self);
      BOOL v122 = sel_getName(a2);
      uint64_t v100 = 45;
      if (v99) {
        uint64_t v100 = 43;
      }
      v97(6, "%c[%{public}s %{public}s]:%i Result = 0x%04x", v100, v116, v122, 1372, v8);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v101 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v102 = object_getClass(self);
      if (class_isMetaClass(v102)) {
        int v103 = 43;
      }
      else {
        int v103 = 45;
      }
      __int16 v104 = object_getClassName(self);
      v105 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      int v127 = v103;
      __int16 v128 = 2082;
      int v129 = v104;
      __int16 v130 = 2082;
      uint64_t v131 = v105;
      __int16 v132 = 1024;
      int v133 = 1372;
      __int16 v134 = 1024;
      LODWORD(v135) = v8;
      _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Result = 0x%04x", buf, 0x28u);
    }

    id v106 = objc_alloc((Class)NSMutableDictionary);
    int v107 = +[NSNumber numberWithUnsignedInt:[(NFRemoteAdminReaderSession *)self targetTagType]];
    __int16 v108 = +[NSNumber numberWithUnsignedInteger:self->_cardValidationStatus];
    id v20 = [v106 initWithObjectsAndKeys:&off_10005B2A8, @"state", v107, @"technology", v108, @"cardValidationStatus", 0];

    if (self->_cardIngestionStatus != -1)
    {
      int v109 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
      [v20 setObject:v109 forKeyedSubscript:@"sessionStatus"];
    }
    __int16 v110 = [(NFRemoteAdminRedirectSession *)self redirectState];
    unint64_t v111 = [v110 spStatusCode];

    if (v111)
    {
      CFStringRef v112 = [(NFRemoteAdminRedirectSession *)self redirectState];
      uint64_t v113 = [v112 spStatusCode];
      [v20 setObject:v113 forKey:@"spStatus"];
    }
    +[NFReaderModeCardIngestionCALogger postAnalyticsReaderModeCardIngestionSession:v20 prepOnly:0];
LABEL_15:
  }
  return v8;
}

- (unint64_t)_doInitialRequest
{
  if (byte_100060438)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v5 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v9 = 45;
      if (isMetaClass) {
        uint64_t v9 = 43;
      }
      v5(6, "%c[%{public}s %{public}s]:%i [TSM] initiating reader mode request", v9, ClassName, Name, 1395);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    dispatch_semaphore_t v10 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      SEL v11 = object_getClass(self);
      if (class_isMetaClass(v11)) {
        int v12 = 43;
      }
      else {
        int v12 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v138 = v12;
      __int16 v139 = 2082;
      v140 = object_getClassName(self);
      __int16 v141 = 2082;
      id v142 = sel_getName(a2);
      __int16 v143 = 1024;
      int v144 = 1395;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] initiating reader mode request", buf, 0x22u);
    }
  }
  if ([(NFRemoteAdminRedirectSession *)self aborted])
  {
    if (![(NFRemoteAdminRedirectSession *)self aborted])
    {
      unint64_t v13 = 5;
LABEL_95:
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v91 = NFLogGetLogger();
      if (v91)
      {
        unint64_t v92 = (void (*)(uint64_t, const char *, ...))v91;
        int v93 = object_getClass(self);
        BOOL v94 = class_isMetaClass(v93);
        int v127 = object_getClassName(self);
        __int16 v134 = sel_getName(a2);
        uint64_t v95 = 45;
        if (v94) {
          uint64_t v95 = 43;
        }
        v92(3, "%c[%{public}s %{public}s]:%i Failed to perform initial reader mode request with TSM, status=0x%lx", v95, v127, v134, 1449, v13);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v96 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        v97 = object_getClass(self);
        if (class_isMetaClass(v97)) {
          int v98 = 43;
        }
        else {
          int v98 = 45;
        }
        BOOL v99 = object_getClassName(self);
        uint64_t v100 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        int v138 = v98;
        __int16 v139 = 2082;
        v140 = v99;
        __int16 v141 = 2082;
        id v142 = v100;
        __int16 v143 = 1024;
        int v144 = 1449;
        __int16 v145 = 2048;
        unint64_t v146 = v13;
        _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to perform initial reader mode request with TSM, status=0x%lx", buf, 0x2Cu);
      }

      id v78 = [(NFRemoteAdminRedirectSession *)self redirectState];
      [v78 setStep:3];
      unint64_t v79 = 2;
      goto LABEL_105;
    }
    goto LABEL_72;
  }
  unint64_t v14 = 0;
  uint64_t v15 = 5;
  do
  {
    int v16 = [(NFRemoteAdminRedirectSession *)self connection];

    if (!v16)
    {
      if (byte_100060438)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v17 = NFLogGetLogger();
        if (v17)
        {
          uint64_t v18 = (void (*)(uint64_t, const char *, ...))v17;
          uint64_t v19 = object_getClass(self);
          BOOL v20 = class_isMetaClass(v19);
          int v21 = object_getClassName(self);
          int v129 = sel_getName(a2);
          if (v20) {
            uint64_t v22 = 43;
          }
          else {
            uint64_t v22 = 45;
          }
          v18(6, "%c[%{public}s %{public}s]:%i [TSM] Opening connection to TSM", v22, v21, v129, 1401);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v23 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          dispatch_time_t v24 = object_getClass(self);
          if (class_isMetaClass(v24)) {
            int v25 = 43;
          }
          else {
            int v25 = 45;
          }
          BOOL v26 = object_getClassName(self);
          uint64_t v27 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          int v138 = v25;
          __int16 v139 = 2082;
          v140 = v26;
          __int16 v141 = 2082;
          id v142 = v27;
          __int16 v143 = 1024;
          int v144 = 1401;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Opening connection to TSM", buf, 0x22u);
        }
      }
      uint64_t v28 = [(NFRemoteAdminRedirectSession *)self redirectState];
      uint64_t v29 = [v28 sourceUrl];
      unsigned __int8 v30 = [(NFRemoteAdminRedirectSession *)self openConnection:v29];

      if ((v30 & 1) == 0)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v31 = NFLogGetLogger();
        if (v31)
        {
          __int16 v32 = (void (*)(uint64_t, const char *, ...))v31;
          uint64_t v33 = object_getClass(self);
          BOOL v34 = class_isMetaClass(v33);
          uint64_t v35 = object_getClassName(self);
          __int16 v130 = sel_getName(a2);
          if (v34) {
            uint64_t v36 = 43;
          }
          else {
            uint64_t v36 = 45;
          }
          v32(3, "%c[%{public}s %{public}s]:%i Failed to open connection to TSM", v36, v35, v130, 1404);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v37 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          int v38 = object_getClass(self);
          if (class_isMetaClass(v38)) {
            int v39 = 43;
          }
          else {
            int v39 = 45;
          }
          int v40 = object_getClassName(self);
          uint64_t v41 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          int v138 = v39;
          __int16 v139 = 2082;
          v140 = v40;
          __int16 v141 = 2082;
          id v142 = v41;
          __int16 v143 = 1024;
          int v144 = 1404;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to open connection to TSM", buf, 0x22u);
        }

        uint64_t v15 = 3;
      }
    }
    int v42 = [(NFRemoteAdminRedirectSession *)self connection];

    unint64_t v13 = v15;
    if (v42) {
      unint64_t v13 = [(NFRemoteAdminReaderSession *)self _performReaderModeRequest];
    }
    if (v14 <= 2 && v13 == 3)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v43 = NFLogGetLogger();
      if (v43)
      {
        BOOL v44 = (void (*)(uint64_t, const char *, ...))v43;
        uint64_t v45 = object_getClass(self);
        BOOL v46 = class_isMetaClass(v45);
        uint64_t v47 = object_getClassName(self);
        id v48 = sel_getName(a2);
        if (v46) {
          uint64_t v49 = 43;
        }
        else {
          uint64_t v49 = 45;
        }
        v44(5, "%c[%{public}s %{public}s]:%i Performing short retry in %d seconds", v49, v47, v48, 1416, dword_100045050[v14]);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      BOOL v50 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        id v51 = object_getClass(self);
        if (class_isMetaClass(v51)) {
          int v52 = 43;
        }
        else {
          int v52 = 45;
        }
        __int16 v53 = object_getClassName(self);
        uint64_t v54 = sel_getName(a2);
        unsigned int v55 = dword_100045050[v14];
        *(_DWORD *)buf = 67110146;
        int v138 = v52;
        __int16 v139 = 2082;
        v140 = v53;
        __int16 v141 = 2082;
        id v142 = v54;
        __int16 v143 = 1024;
        int v144 = 1416;
        __int16 v145 = 1024;
        LODWORD(v146) = v55;
        _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Performing short retry in %d seconds", buf, 0x28u);
      }

      sleep(dword_100045050[v14++]);
      unint64_t v13 = 6;
    }
    if (v14 >= 3)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v56 = NFLogGetLogger();
      if (v56)
      {
        int v57 = (void (*)(uint64_t, const char *, ...))v56;
        Class v58 = object_getClass(self);
        BOOL v59 = class_isMetaClass(v58);
        unint64_t v60 = object_getClassName(self);
        uint64_t v131 = sel_getName(a2);
        if (v59) {
          uint64_t v61 = 43;
        }
        else {
          uint64_t v61 = 45;
        }
        v57(5, "%c[%{public}s %{public}s]:%i Short retries expired", v61, v60, v131, 1421);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      CFStringRef v62 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v63 = object_getClass(self);
        if (class_isMetaClass(v63)) {
          int v64 = 43;
        }
        else {
          int v64 = 45;
        }
        __int16 v65 = object_getClassName(self);
        uint64_t v66 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        int v138 = v64;
        __int16 v139 = 2082;
        v140 = v65;
        __int16 v141 = 2082;
        id v142 = v66;
        __int16 v143 = 1024;
        int v144 = 1421;
        _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Short retries expired", buf, 0x22u);
      }
    }
    if (v13 != 6) {
      break;
    }
    uint64_t v15 = 6;
  }
  while (![(NFRemoteAdminRedirectSession *)self aborted]);
  [(NFRemoteAdminRedirectSession *)self closeConnection];
  if ([(NFRemoteAdminRedirectSession *)self aborted])
  {
    if (!v13)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v103 = NFLogGetLogger();
      if (v103)
      {
        __int16 v104 = (void (*)(uint64_t, const char *, ...))v103;
        v105 = object_getClass(self);
        BOOL v106 = class_isMetaClass(v105);
        int v107 = object_getClassName(self);
        id v135 = sel_getName(a2);
        uint64_t v108 = 45;
        if (v106) {
          uint64_t v108 = 43;
        }
        v104(6, "%c[%{public}s %{public}s]:%i Abort with checkin", v108, v107, v135, 1432);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v109 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v110 = object_getClass(self);
        if (class_isMetaClass(v110)) {
          int v111 = 43;
        }
        else {
          int v111 = 45;
        }
        CFStringRef v112 = object_getClassName(self);
        uint64_t v113 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        int v138 = v111;
        __int16 v139 = 2082;
        v140 = v112;
        __int16 v141 = 2082;
        id v142 = v113;
        __int16 v143 = 1024;
        int v144 = 1432;
        _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Abort with checkin", buf, 0x22u);
      }

      v114 = [(NFRemoteAdminRedirectSession *)self redirectState];
      [v114 setStep:2];

      id v78 = [objc_alloc((Class)NSString) initWithFormat:@"%@(reason=%d)", @"Cancel", -[NFRemoteAdminRedirectSession abortedReason](self, "abortedReason")];
      int v115 = [(NFRemoteAdminRedirectSession *)self redirectState];
      [v115 setIncompleteReason:v78];

      goto LABEL_82;
    }
LABEL_72:
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v67 = NFLogGetLogger();
    if (v67)
    {
      int v68 = (void (*)(uint64_t, const char *, ...))v67;
      __int16 v69 = object_getClass(self);
      BOOL v70 = class_isMetaClass(v69);
      __int16 v71 = object_getClassName(self);
      __int16 v132 = sel_getName(a2);
      uint64_t v72 = 45;
      if (v70) {
        uint64_t v72 = 43;
      }
      v68(6, "%c[%{public}s %{public}s]:%i Abort", v72, v71, v132, 1437);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v73 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
    {
      id v74 = object_getClass(self);
      if (class_isMetaClass(v74)) {
        int v75 = 43;
      }
      else {
        int v75 = 45;
      }
      long long v76 = object_getClassName(self);
      id v77 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v138 = v75;
      __int16 v139 = 2082;
      v140 = v76;
      __int16 v141 = 2082;
      id v142 = v77;
      __int16 v143 = 1024;
      int v144 = 1437;
      _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Abort", buf, 0x22u);
    }

    id v78 = [(NFRemoteAdminRedirectSession *)self redirectState];
    [v78 setStep:3];
LABEL_82:
    unint64_t v79 = 1;
    goto LABEL_105;
  }
  if (v13 == 8)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v116 = NFLogGetLogger();
    if (v116)
    {
      uint64_t v117 = (void (*)(uint64_t, const char *, ...))v116;
      uint64_t v118 = object_getClass(self);
      BOOL v119 = class_isMetaClass(v118);
      int v120 = object_getClassName(self);
      BOOL v136 = sel_getName(a2);
      uint64_t v121 = 45;
      if (v119) {
        uint64_t v121 = 43;
      }
      v117(6, "%c[%{public}s %{public}s]:%i device not registered", v121, v120, v136, 1445);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    BOOL v122 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
    {
      id v123 = object_getClass(self);
      if (class_isMetaClass(v123)) {
        int v124 = 43;
      }
      else {
        int v124 = 45;
      }
      uint64_t v125 = object_getClassName(self);
      v126 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v138 = v124;
      __int16 v139 = 2082;
      v140 = v125;
      __int16 v141 = 2082;
      id v142 = v126;
      __int16 v143 = 1024;
      int v144 = 1445;
      _os_log_impl((void *)&_mh_execute_header, v122, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i device not registered", buf, 0x22u);
    }

    id v78 = [(NFRemoteAdminRedirectSession *)self redirectState];
    [v78 setStep:3];
    unint64_t v79 = 8;
  }
  else
  {
    if (v13) {
      goto LABEL_95;
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v80 = NFLogGetLogger();
    if (v80)
    {
      int v81 = (void (*)(uint64_t, const char *, ...))v80;
      int v82 = object_getClass(self);
      BOOL v83 = class_isMetaClass(v82);
      id v84 = object_getClassName(self);
      int v133 = sel_getName(a2);
      uint64_t v85 = 45;
      if (v83) {
        uint64_t v85 = 43;
      }
      v81(6, "%c[%{public}s %{public}s]:%i advancing to InProgress step", v85, v84, v133, 1442);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    __int16 v86 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v87 = object_getClass(self);
      if (class_isMetaClass(v87)) {
        int v88 = 43;
      }
      else {
        int v88 = 45;
      }
      __int16 v89 = object_getClassName(self);
      uint64_t v90 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v138 = v88;
      __int16 v139 = 2082;
      v140 = v89;
      __int16 v141 = 2082;
      id v142 = v90;
      __int16 v143 = 1024;
      int v144 = 1442;
      _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i advancing to InProgress step", buf, 0x22u);
    }

    id v78 = [(NFRemoteAdminRedirectSession *)self redirectState];
    [v78 incrementStep];
    unint64_t v79 = 0;
  }
LABEL_105:

  id v101 = [(NFRemoteAdminRedirectSession *)self redirectState];
  [v101 save];

  return v79;
}

- (unint64_t)_doReaderModeRedirect
{
  if (byte_100060438)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v5 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v9 = 45;
      if (isMetaClass) {
        uint64_t v9 = 43;
      }
      v5(6, "%c[%{public}s %{public}s]:%i [TSM] Performing reader mode redirect", v9, ClassName, Name, 1465);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    dispatch_semaphore_t v10 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      SEL v11 = object_getClass(self);
      if (class_isMetaClass(v11)) {
        int v12 = 43;
      }
      else {
        int v12 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v172 = v12;
      __int16 v173 = 2082;
      uint64_t v174 = object_getClassName(self);
      __int16 v175 = 2082;
      v176 = sel_getName(a2);
      __int16 v177 = 1024;
      int v178 = 1465;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Performing reader mode redirect", buf, 0x22u);
    }
  }
  mach_continuous_time();
  if ([(NFRemoteAdminRedirectSession *)self aborted])
  {
LABEL_13:
    BOOL v13 = 0;
    unint64_t v14 = 5;
    goto LABEL_14;
  }
  if (byte_100060438)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v36 = NFLogGetLogger();
    if (v36)
    {
      uint64_t v37 = (void (*)(uint64_t, const char *, ...))v36;
      int v38 = object_getClass(self);
      BOOL v39 = class_isMetaClass(v38);
      int v40 = object_getClassName(self);
      __int16 v162 = sel_getName(a2);
      uint64_t v41 = 45;
      if (v39) {
        uint64_t v41 = 43;
      }
      v37(6, "%c[%{public}s %{public}s]:%i [TSM] Opening reader session", v41, v40, v162, 1469);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v42 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v43 = object_getClass(self);
      if (class_isMetaClass(v43)) {
        int v44 = 43;
      }
      else {
        int v44 = 45;
      }
      uint64_t v45 = object_getClassName(self);
      BOOL v46 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v172 = v44;
      __int16 v173 = 2082;
      uint64_t v174 = v45;
      __int16 v175 = 2082;
      v176 = v46;
      __int16 v177 = 1024;
      int v178 = 1469;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Opening reader session", buf, 0x22u);
    }
  }
  unint64_t v14 = [(NFRemoteAdminReaderSession *)self _openSession];
  BOOL v13 = 0;
  switch(v14)
  {
    case 2uLL:
      unint64_t v47 = 0;
      char v48 = 0;
      break;
    case 5uLL:
      goto LABEL_13;
    case 9uLL:
      goto LABEL_14;
    case 0xCuLL:
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v101 = NFLogGetLogger();
      if (v101)
      {
        BOOL v102 = (void (*)(uint64_t, const char *, ...))v101;
        uint64_t v103 = object_getClass(self);
        BOOL v104 = class_isMetaClass(v103);
        v105 = object_getClassName(self);
        v166 = sel_getName(a2);
        uint64_t v106 = 45;
        if (v104) {
          uint64_t v106 = 43;
        }
        v102(3, "%c[%{public}s %{public}s]:%i Bad Command APDU", v106, v105, v166, 1506);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v107 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
      {
        uint64_t v108 = object_getClass(self);
        if (class_isMetaClass(v108)) {
          int v109 = 43;
        }
        else {
          int v109 = 45;
        }
        __int16 v110 = object_getClassName(self);
        int v111 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        int v172 = v109;
        __int16 v173 = 2082;
        uint64_t v174 = v110;
        __int16 v175 = 2082;
        v176 = v111;
        __int16 v177 = 1024;
        int v178 = 1506;
        _os_log_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Bad Command APDU", buf, 0x22u);
      }

      BOOL v13 = 0;
      unint64_t v14 = 10;
      goto LABEL_14;
    case 0xDuLL:
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v112 = NFLogGetLogger();
      if (v112)
      {
        uint64_t v113 = (void (*)(uint64_t, const char *, ...))v112;
        v114 = object_getClass(self);
        BOOL v115 = class_isMetaClass(v114);
        uint64_t v116 = object_getClassName(self);
        uint64_t v167 = sel_getName(a2);
        uint64_t v117 = 45;
        if (v115) {
          uint64_t v117 = 43;
        }
        v113(6, "%c[%{public}s %{public}s]:%i Failed due to thermal protection", v117, v116, v167, 1511);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v118 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v119 = object_getClass(self);
        if (class_isMetaClass(v119)) {
          int v120 = 43;
        }
        else {
          int v120 = 45;
        }
        uint64_t v121 = object_getClassName(self);
        BOOL v122 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        int v172 = v120;
        __int16 v173 = 2082;
        uint64_t v174 = v121;
        __int16 v175 = 2082;
        v176 = v122;
        __int16 v177 = 1024;
        int v178 = 1511;
        _os_log_impl((void *)&_mh_execute_header, v118, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Failed due to thermal protection", buf, 0x22u);
      }

      BOOL v13 = 0;
      unint64_t v14 = 13;
      goto LABEL_14;
    default:
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v90 = NFLogGetLogger();
      if (v90)
      {
        uint64_t v91 = (void (*)(uint64_t, const char *, ...))v90;
        unint64_t v92 = object_getClass(self);
        BOOL v93 = class_isMetaClass(v92);
        BOOL v94 = object_getClassName(self);
        id v165 = sel_getName(a2);
        uint64_t v95 = 45;
        if (v93) {
          uint64_t v95 = 43;
        }
        v91(3, "%c[%{public}s %{public}s]:%i Failed to start reader session", v95, v94, v165, 1514);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v96 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        v97 = object_getClass(self);
        if (class_isMetaClass(v97)) {
          int v98 = 43;
        }
        else {
          int v98 = 45;
        }
        BOOL v99 = object_getClassName(self);
        uint64_t v100 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        int v172 = v98;
        __int16 v173 = 2082;
        uint64_t v174 = v99;
        __int16 v175 = 2082;
        v176 = v100;
        __int16 v177 = 1024;
        int v178 = 1514;
        _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to start reader session", buf, 0x22u);
      }

      BOOL v13 = 0;
      unint64_t v14 = 7;
      goto LABEL_14;
  }
  while (1)
  {
    if ((v48 & 1) == 0)
    {
      id v51 = [(NFRemoteAdminRedirectSession *)self redirectState];
      int v52 = [v51 redirectUrl];
      unsigned __int8 v53 = [(NFRemoteAdminRedirectSession *)self openConnection:v52];

      if ((v53 & 1) == 0)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v54 = NFLogGetLogger();
        if (v54)
        {
          unsigned int v55 = (void (*)(uint64_t, const char *, ...))v54;
          uint64_t v56 = object_getClass(self);
          BOOL v57 = class_isMetaClass(v56);
          Class v58 = object_getClassName(self);
          v163 = sel_getName(a2);
          uint64_t v59 = 45;
          if (v57) {
            uint64_t v59 = 43;
          }
          v55(3, "%c[%{public}s %{public}s]:%i Failed to open connection to SP-TSM", v59, v58, v163, 1478);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        unint64_t v60 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
        {
          uint64_t v61 = object_getClass(self);
          if (class_isMetaClass(v61)) {
            int v62 = 43;
          }
          else {
            int v62 = 45;
          }
          BOOL v63 = object_getClassName(self);
          int v64 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          int v172 = v62;
          __int16 v173 = 2082;
          uint64_t v174 = v63;
          __int16 v175 = 2082;
          v176 = v64;
          __int16 v177 = 1024;
          int v178 = 1478;
          _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to open connection to SP-TSM", buf, 0x22u);
        }

        char v48 = 0;
        int v50 = 0;
        unint64_t v14 = 3;
        goto LABEL_63;
      }
      char v48 = 1;
    }
    [(NFRemoteAdminReaderSession *)self _fireCardIngestionStatus:8];
    unint64_t v49 = [(NFRemoteAdminRedirectSession *)self performRedirect];
    int v50 = 1;
    if (v49 != 6) {
      break;
    }
    unint64_t v47 = 0;
LABEL_76:
    if ([(NFRemoteAdminRedirectSession *)self aborted])
    {
      unint64_t v14 = 6;
      goto LABEL_139;
    }
  }
  unint64_t v14 = v49;
  if (v49 == 1)
  {
    [(NFRemoteAdminRedirectSession *)self setRedirectStepError:3];
    int v50 = 1;
    goto LABEL_139;
  }
LABEL_63:
  unsigned int v65 = [(NFRemoteAdminRedirectSession *)self aborted];
  if (v14 == 3 && !v65 && v47 <= 2)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v66 = NFLogGetLogger();
    if (v66)
    {
      uint64_t v67 = (void (*)(uint64_t, const char *, ...))v66;
      int v68 = object_getClass(self);
      BOOL v69 = class_isMetaClass(v68);
      BOOL v70 = object_getClassName(self);
      __int16 v71 = sel_getName(a2);
      uint64_t v72 = 45;
      if (v69) {
        uint64_t v72 = 43;
      }
      v67(6, "%c[%{public}s %{public}s]:%i Performing short retry in %d seconds", v72, v70, v71, 1494, dword_100045050[v47]);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v73 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
    {
      id v74 = object_getClass(self);
      if (class_isMetaClass(v74)) {
        int v75 = 43;
      }
      else {
        int v75 = 45;
      }
      long long v76 = object_getClassName(self);
      id v77 = sel_getName(a2);
      unsigned int v78 = dword_100045050[v47];
      *(_DWORD *)buf = 67110146;
      int v172 = v75;
      __int16 v173 = 2082;
      uint64_t v174 = v76;
      __int16 v175 = 2082;
      v176 = v77;
      __int16 v177 = 1024;
      int v178 = 1494;
      __int16 v179 = 1024;
      LODWORD(v180) = v78;
      _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Performing short retry in %d seconds", buf, 0x28u);
    }

    sleep(dword_100045050[v47++]);
    goto LABEL_76;
  }
  if (v14 == 3 && v47 == 3)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v125 = NFLogGetLogger();
    if (v125)
    {
      v126 = (void (*)(uint64_t, const char *, ...))v125;
      int v127 = object_getClass(self);
      BOOL v128 = class_isMetaClass(v127);
      int v129 = object_getClassName(self);
      uint64_t v168 = sel_getName(a2);
      uint64_t v130 = 45;
      if (v128) {
        uint64_t v130 = 43;
      }
      v126(6, "%c[%{public}s %{public}s]:%i Short retries expired", v130, v129, v168, 1501);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v131 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v131, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v132 = object_getClass(self);
      if (class_isMetaClass(v132)) {
        int v133 = 43;
      }
      else {
        int v133 = 45;
      }
      __int16 v134 = object_getClassName(self);
      id v135 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v172 = v133;
      __int16 v173 = 2082;
      uint64_t v174 = v134;
      __int16 v175 = 2082;
      v176 = v135;
      __int16 v177 = 1024;
      int v178 = 1501;
      _os_log_impl((void *)&_mh_execute_header, v131, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Short retries expired", buf, 0x22u);
    }

    unint64_t v14 = 3;
  }
LABEL_139:
  BOOL v13 = v50 != 0;
LABEL_14:
  if ([(NFRemoteAdminRedirectSession *)self redirectStepError] == 3
    || [(NFRemoteAdminRedirectSession *)self aborted])
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v15 = NFLogGetLogger();
    if (v15)
    {
      int v16 = (void (*)(uint64_t, const char *, ...))v15;
      uint64_t v17 = object_getClass(self);
      BOOL v18 = class_isMetaClass(v17);
      uint64_t v19 = object_getClassName(self);
      uint64_t v161 = sel_getName(a2);
      uint64_t v20 = 45;
      if (v18) {
        uint64_t v20 = 43;
      }
      v16(6, "%c[%{public}s %{public}s]:%i aborted", v20, v19, v161, 1520);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v21 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = object_getClass(self);
      if (class_isMetaClass(v22)) {
        int v23 = 43;
      }
      else {
        int v23 = 45;
      }
      dispatch_time_t v24 = object_getClassName(self);
      int v25 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v172 = v23;
      __int16 v173 = 2082;
      uint64_t v174 = v24;
      __int16 v175 = 2082;
      v176 = v25;
      __int16 v177 = 1024;
      int v178 = 1520;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i aborted", buf, 0x22u);
    }

    if ((id)[(NFRemoteAdminRedirectSession *)self abortedReason] == (id)6) {
      unint64_t v14 = 7;
    }
    else {
      unint64_t v14 = 1;
    }
    id v26 = [objc_alloc((Class)NSString) initWithFormat:@"%@(reason=%d)", @"Cancel", -[NFRemoteAdminRedirectSession abortedReason](self, "abortedReason")];
    uint64_t v27 = [(NFRemoteAdminRedirectSession *)self redirectState];
    [v27 setIncompleteReason:v26];

    goto LABEL_29;
  }
  if (v14)
  {
    if (v14 == 7)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v79 = NFLogGetLogger();
      if (v79)
      {
        uint64_t v80 = (void (*)(uint64_t, const char *, ...))v79;
        int v81 = object_getClass(self);
        BOOL v82 = class_isMetaClass(v81);
        BOOL v83 = object_getClassName(self);
        __int16 v164 = sel_getName(a2);
        uint64_t v84 = 45;
        if (v82) {
          uint64_t v84 = 43;
        }
        v80(6, "%c[%{public}s %{public}s]:%i tag unavailable", v84, v83, v164, 1531);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v85 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v86 = object_getClass(self);
        if (class_isMetaClass(v86)) {
          int v87 = 43;
        }
        else {
          int v87 = 45;
        }
        int v88 = object_getClassName(self);
        __int16 v89 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        int v172 = v87;
        __int16 v173 = 2082;
        uint64_t v174 = v88;
        __int16 v175 = 2082;
        v176 = v89;
        __int16 v177 = 1024;
        int v178 = 1531;
        _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i tag unavailable", buf, 0x22u);
      }

      id v26 = [(NFRemoteAdminRedirectSession *)self redirectState];
      [v26 setIncompleteReason:@"CardNotFound"];
      unint64_t v14 = 3;
LABEL_29:

      goto LABEL_30;
    }
    if ([(NFRemoteAdminRedirectSession *)self redirectStepError] == 29)
    {
      id v123 = [(NFRemoteAdminRedirectSession *)self redirectState];
      id v26 = v123;
      CFStringRef v124 = @"ReaderTransceiveError";
LABEL_122:
      [v123 setIncompleteReason:v124];
      unint64_t v14 = 5;
      goto LABEL_29;
    }
    switch(v14)
    {
      case 0xDuLL:
        id v123 = [(NFRemoteAdminRedirectSession *)self redirectState];
        id v26 = v123;
        CFStringRef v124 = @"ReaderModeProtection";
        goto LABEL_122;
      case 0xAuLL:
        id v26 = [(NFRemoteAdminRedirectSession *)self redirectState];
        [v26 setIncompleteReason:@"CommandError"];
        unint64_t v14 = 6;
        goto LABEL_29;
      case 9uLL:
        id v26 = [(NFRemoteAdminRedirectSession *)self redirectState];
        [v26 setIncompleteReason:@"UnsupportedCardFound"];
        unint64_t v14 = 4;
        goto LABEL_29;
    }
    if (!v13 || v14 <= 0xF && ((1 << v14) & 0x811C) != 0)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v136 = NFLogGetLogger();
      if (v136)
      {
        v137 = (void (*)(uint64_t, const char *, ...))v136;
        int v138 = object_getClass(self);
        BOOL v139 = class_isMetaClass(v138);
        __int16 v158 = object_getClassName(self);
        id v169 = sel_getName(a2);
        uint64_t v140 = 45;
        if (v139) {
          uint64_t v140 = 43;
        }
        v137(3, "%c[%{public}s %{public}s]:%i ingestion failed, status=0x%lx", v140, v158, v169, 1556, v14);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      __int16 v141 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v141, OS_LOG_TYPE_ERROR))
      {
        id v142 = object_getClass(self);
        if (class_isMetaClass(v142)) {
          int v143 = 43;
        }
        else {
          int v143 = 45;
        }
        int v144 = object_getClassName(self);
        __int16 v145 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        int v172 = v143;
        __int16 v173 = 2082;
        uint64_t v174 = v144;
        __int16 v175 = 2082;
        v176 = v145;
        __int16 v177 = 1024;
        int v178 = 1556;
        __int16 v179 = 2048;
        unint64_t v180 = v14;
        _os_log_impl((void *)&_mh_execute_header, v141, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i ingestion failed, status=0x%lx", buf, 0x2Cu);
      }

      if (v14 != 8)
      {
        id v26 = [(NFRemoteAdminRedirectSession *)self redirectState];
        [v26 setIncompleteReason:@"NetworkError"];
        unint64_t v14 = 2;
        goto LABEL_29;
      }
      unint64_t v14 = 2;
      goto LABEL_30;
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v146 = NFLogGetLogger();
    if (v146)
    {
      long long v147 = (void (*)(uint64_t, const char *, ...))v146;
      long long v148 = object_getClass(self);
      BOOL v149 = class_isMetaClass(v148);
      int v159 = object_getClassName(self);
      id v170 = sel_getName(a2);
      uint64_t v150 = 45;
      if (v149) {
        uint64_t v150 = 43;
      }
      v147(3, "%c[%{public}s %{public}s]:%i ingestion failed, status=0x%lx", v150, v159, v170, 1563, v14);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    long long v151 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v151, OS_LOG_TYPE_ERROR))
    {
      uint64_t v152 = object_getClass(self);
      if (class_isMetaClass(v152)) {
        int v153 = 43;
      }
      else {
        int v153 = 45;
      }
      __int16 v154 = object_getClassName(self);
      int v155 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      int v172 = v153;
      __int16 v173 = 2082;
      uint64_t v174 = v154;
      __int16 v175 = 2082;
      v176 = v155;
      __int16 v177 = 1024;
      int v178 = 1563;
      __int16 v179 = 2048;
      unint64_t v180 = v14;
      _os_log_impl((void *)&_mh_execute_header, v151, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i ingestion failed, status=0x%lx", buf, 0x2Cu);
    }

    id v156 = [objc_alloc((Class)NSString) initWithFormat:@"Unknown error:%d", -[NFRemoteAdminRedirectSession redirectStepError](self, "redirectStepError")];
    v157 = [(NFRemoteAdminRedirectSession *)self redirectState];
    [v157 setIncompleteReason:v156];

    unint64_t v14 = -1;
LABEL_31:
    [(NFRemoteAdminRedirectSession *)self closeConnection];
  }
  else
  {
LABEL_30:
    if (v13) {
      goto LABEL_31;
    }
  }
  [(NFRemoteAdminReaderSession *)self _closeSession];
  uint64_t v28 = [(NFRemoteAdminRedirectSession *)self redirectState];
  uint64_t v29 = [v28 performanceMetrics];
  mach_continuous_time();
  double v30 = (double)(unint64_t)GetElapsedTimeInMillisecondsFromMachTime() / 1000.0;
  [v29 totalSessionTime];
  [v29 setTotalSessionTime:v31 + v30];

  __int16 v32 = [(NFRemoteAdminRedirectSession *)self redirectState];
  [v32 clearRetryInterval];

  uint64_t v33 = [(NFRemoteAdminRedirectSession *)self redirectState];
  [v33 incrementStep];

  BOOL v34 = [(NFRemoteAdminRedirectSession *)self redirectState];
  [v34 save];

  return v14;
}

- (unint64_t)_doFinalTSMCheckIn
{
  if (byte_100060438)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v5 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v9 = 45;
      if (isMetaClass) {
        uint64_t v9 = 43;
      }
      v5(6, "%c[%{public}s %{public}s]:%i [TSM] Performing final TSM checkin", v9, ClassName, Name, 1588);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    dispatch_semaphore_t v10 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      SEL v11 = object_getClass(self);
      if (class_isMetaClass(v11)) {
        int v12 = 43;
      }
      else {
        int v12 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v113 = v12;
      __int16 v114 = 2082;
      BOOL v115 = object_getClassName(self);
      __int16 v116 = 2082;
      uint64_t v117 = sel_getName(a2);
      __int16 v118 = 1024;
      int v119 = 1588;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Performing final TSM checkin", buf, 0x22u);
    }
  }
  unint64_t v13 = 0;
  unint64_t v14 = 5;
  while (1)
  {
    uint64_t v15 = [(NFRemoteAdminRedirectSession *)self connection];

    if (!v15)
    {
      if (byte_100060438)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v16 = NFLogGetLogger();
        if (v16)
        {
          uint64_t v17 = (void (*)(uint64_t, const char *, ...))v16;
          BOOL v18 = object_getClass(self);
          BOOL v19 = class_isMetaClass(v18);
          uint64_t v20 = object_getClassName(self);
          uint64_t v106 = sel_getName(a2);
          uint64_t v21 = 45;
          if (v19) {
            uint64_t v21 = 43;
          }
          v17(6, "%c[%{public}s %{public}s]:%i [TSM] Opening connection to TSM", v21, v20, v106, 1594);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v22 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          int v23 = object_getClass(self);
          if (class_isMetaClass(v23)) {
            int v24 = 43;
          }
          else {
            int v24 = 45;
          }
          int v25 = object_getClassName(self);
          id v26 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          int v113 = v24;
          __int16 v114 = 2082;
          BOOL v115 = v25;
          __int16 v116 = 2082;
          uint64_t v117 = v26;
          __int16 v118 = 1024;
          int v119 = 1594;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Opening connection to TSM", buf, 0x22u);
        }
      }
      uint64_t v27 = [(NFRemoteAdminRedirectSession *)self redirectState];
      uint64_t v28 = [v27 sourceUrl];
      unsigned __int8 v29 = [(NFRemoteAdminRedirectSession *)self openConnection:v28];

      if ((v29 & 1) == 0)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v30 = NFLogGetLogger();
        if (v30)
        {
          double v31 = (void (*)(uint64_t, const char *, ...))v30;
          __int16 v32 = object_getClass(self);
          BOOL v33 = class_isMetaClass(v32);
          BOOL v34 = object_getClassName(self);
          int v107 = sel_getName(a2);
          uint64_t v35 = 45;
          if (v33) {
            uint64_t v35 = 43;
          }
          v31(3, "%c[%{public}s %{public}s]:%i Failed to open connection", v35, v34, v107, 1597);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v36 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          uint64_t v37 = object_getClass(self);
          if (class_isMetaClass(v37)) {
            int v38 = 43;
          }
          else {
            int v38 = 45;
          }
          BOOL v39 = object_getClassName(self);
          int v40 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          int v113 = v38;
          __int16 v114 = 2082;
          BOOL v115 = v39;
          __int16 v116 = 2082;
          uint64_t v117 = v40;
          __int16 v118 = 1024;
          int v119 = 1597;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to open connection", buf, 0x22u);
        }

        unint64_t v14 = 3;
      }
    }
    uint64_t v41 = [(NFRemoteAdminRedirectSession *)self connection];

    if (v41)
    {
      unint64_t v14 = [(NFRemoteAdminRedirectSession *)self performCheckIn];
      if (!v14)
      {
        if (v13 <= 2)
        {
          [(NFRemoteAdminRedirectSession *)self closeConnection];
          BOOL v102 = [(NFRemoteAdminRedirectSession *)self redirectState];
          [v102 incrementStep];

          unint64_t v14 = [(NFRemoteAdminRedirectSession *)self aborted];
          goto LABEL_104;
        }
LABEL_78:
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v79 = NFLogGetLogger();
        if (v79)
        {
          uint64_t v80 = (void (*)(uint64_t, const char *, ...))v79;
          int v81 = object_getClass(self);
          BOOL v82 = class_isMetaClass(v81);
          BOOL v83 = object_getClassName(self);
          __int16 v110 = sel_getName(a2);
          uint64_t v84 = 45;
          if (v82) {
            uint64_t v84 = 43;
          }
          v80(5, "%c[%{public}s %{public}s]:%i Short retries expired", v84, v83, v110, 1621);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v73 = NFSharedLogGetLogger();
        if (!os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_88;
        }
        uint64_t v85 = object_getClass(self);
        if (class_isMetaClass(v85)) {
          int v86 = 43;
        }
        else {
          int v86 = 45;
        }
        int v87 = object_getClassName(self);
        int v88 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        int v113 = v86;
        __int16 v114 = 2082;
        BOOL v115 = v87;
        __int16 v116 = 2082;
        uint64_t v117 = v88;
        __int16 v118 = 1024;
        int v119 = 1621;
        unsigned int v78 = "%c[%{public}s %{public}s]:%i Short retries expired";
        goto LABEL_87;
      }
    }
    if ([(NFRemoteAdminRedirectSession *)self aborted])
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v67 = NFLogGetLogger();
      if (v67)
      {
        int v68 = (void (*)(uint64_t, const char *, ...))v67;
        BOOL v69 = object_getClass(self);
        BOOL v70 = class_isMetaClass(v69);
        __int16 v71 = object_getClassName(self);
        int v109 = sel_getName(a2);
        uint64_t v72 = 45;
        if (v70) {
          uint64_t v72 = 43;
        }
        v68(5, "%c[%{public}s %{public}s]:%i Checkin failed and abort was requested; try again later",
          v72,
          v71,
          v109,
          1608);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v73 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_88;
      }
      id v74 = object_getClass(self);
      if (class_isMetaClass(v74)) {
        int v75 = 43;
      }
      else {
        int v75 = 45;
      }
      long long v76 = object_getClassName(self);
      id v77 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v113 = v75;
      __int16 v114 = 2082;
      BOOL v115 = v76;
      __int16 v116 = 2082;
      uint64_t v117 = v77;
      __int16 v118 = 1024;
      int v119 = 1608;
      unsigned int v78 = "%c[%{public}s %{public}s]:%i Checkin failed and abort was requested; try again later";
LABEL_87:
      _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, v78, buf, 0x22u);
LABEL_88:

      [(NFRemoteAdminRedirectSession *)self closeConnection];
      goto LABEL_89;
    }
    if (v14 != 3 || v13 > 2) {
      break;
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v42 = NFLogGetLogger();
    if (v42)
    {
      uint64_t v43 = (void (*)(uint64_t, const char *, ...))v42;
      int v44 = object_getClass(self);
      BOOL v45 = class_isMetaClass(v44);
      BOOL v46 = object_getClassName(self);
      unint64_t v47 = sel_getName(a2);
      uint64_t v48 = 45;
      if (v45) {
        uint64_t v48 = 43;
      }
      v43(6, "%c[%{public}s %{public}s]:%i Performing short retry in %d seconds", v48, v46, v47, 1614, dword_100045050[v13]);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    unint64_t v49 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      int v50 = object_getClass(self);
      if (class_isMetaClass(v50)) {
        int v51 = 43;
      }
      else {
        int v51 = 45;
      }
      int v52 = object_getClassName(self);
      unsigned __int8 v53 = sel_getName(a2);
      unsigned int v54 = dword_100045050[v13];
      *(_DWORD *)buf = 67110146;
      int v113 = v51;
      __int16 v114 = 2082;
      BOOL v115 = v52;
      __int16 v116 = 2082;
      uint64_t v117 = v53;
      __int16 v118 = 1024;
      int v119 = 1614;
      __int16 v120 = 1024;
      unsigned int v121 = v54;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Performing short retry in %d seconds", buf, 0x28u);
    }

    sleep(dword_100045050[v13++]);
LABEL_53:
    unint64_t v14 = 6;
    if ([(NFRemoteAdminRedirectSession *)self aborted])
    {
      [(NFRemoteAdminRedirectSession *)self closeConnection];
      unint64_t v14 = 6;
      goto LABEL_55;
    }
  }
  if (v13 > 2) {
    goto LABEL_78;
  }
  if (v14 == 6) {
    goto LABEL_53;
  }
  [(NFRemoteAdminRedirectSession *)self closeConnection];
  if (v14 == 8) {
    goto LABEL_102;
  }
  if (v14 != 4)
  {
LABEL_55:
    if ([(NFRemoteAdminRedirectSession *)self aborted])
    {
      if (byte_100060438)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v55 = NFLogGetLogger();
        if (v55)
        {
          uint64_t v56 = (void (*)(uint64_t, const char *, ...))v55;
          BOOL v57 = object_getClass(self);
          BOOL v58 = class_isMetaClass(v57);
          uint64_t v59 = object_getClassName(self);
          uint64_t v108 = sel_getName(a2);
          uint64_t v60 = 45;
          if (v58) {
            uint64_t v60 = 43;
          }
          v56(6, "%c[%{public}s %{public}s]:%i [TSM] Checkin failed and abort was requested; try again later",
            v60,
            v59,
            v108,
            1646);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v61 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
        {
          int v62 = object_getClass(self);
          if (class_isMetaClass(v62)) {
            int v63 = 43;
          }
          else {
            int v63 = 45;
          }
          int v64 = object_getClassName(self);
          unsigned int v65 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          int v113 = v63;
          __int16 v114 = 2082;
          BOOL v115 = v64;
          __int16 v116 = 2082;
          uint64_t v117 = v65;
          __int16 v118 = 1024;
          int v119 = 1646;
          _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i [TSM] Checkin failed and abort was requested; try again later",
            buf,
            0x22u);
        }
      }
      uint64_t v66 = [(NFRemoteAdminRedirectSession *)self redirectState];
      [v66 incrementLongRetry];

      unint64_t v14 = 1;
      goto LABEL_104;
    }
LABEL_102:
    uint64_t v101 = [(NFRemoteAdminRedirectSession *)self redirectState];
    [v101 incrementStep];

    goto LABEL_104;
  }
LABEL_89:
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v89 = NFLogGetLogger();
  if (v89)
  {
    uint64_t v90 = (void (*)(uint64_t, const char *, ...))v89;
    uint64_t v91 = object_getClass(self);
    BOOL v92 = class_isMetaClass(v91);
    BOOL v93 = object_getClassName(self);
    int v111 = sel_getName(a2);
    uint64_t v94 = 45;
    if (v92) {
      uint64_t v94 = 43;
    }
    v90(6, "%c[%{public}s %{public}s]:%i Incrementing long retry for TSM checkin", v94, v93, v111, 1631);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v95 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v96 = object_getClass(self);
    if (class_isMetaClass(v96)) {
      int v97 = 43;
    }
    else {
      int v97 = 45;
    }
    int v98 = object_getClassName(self);
    BOOL v99 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    int v113 = v97;
    __int16 v114 = 2082;
    BOOL v115 = v98;
    __int16 v116 = 2082;
    uint64_t v117 = v99;
    __int16 v118 = 1024;
    int v119 = 1631;
    _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Incrementing long retry for TSM checkin", buf, 0x22u);
  }

  uint64_t v100 = [(NFRemoteAdminRedirectSession *)self redirectState];
  [v100 incrementLongRetry];

  unint64_t v14 = 4;
LABEL_104:
  uint64_t v103 = [(NFRemoteAdminRedirectSession *)self redirectState];
  [v103 save];

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionUUID, 0);
  objc_storeStrong((id *)&self->_sessionStartSem, 0);
  objc_storeStrong((id *)&self->_tagSem, 0);
  objc_storeStrong((id *)&self->_externalState, 0);
  objc_storeStrong((id *)&self->_cardContents, 0);
  objc_storeStrong((id *)&self->_tag, 0);

  objc_storeStrong((id *)&self->_readerSession, 0);
}

@end