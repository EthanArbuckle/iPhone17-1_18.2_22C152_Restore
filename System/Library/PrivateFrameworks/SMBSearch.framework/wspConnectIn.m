@interface wspConnectIn
- (NSString)clientMachineName;
- (NSString)serverMachineName;
- (NSString)userName;
- (int)encodeBuffer:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5;
- (unsigned)cExtPropSet;
- (unsigned)cPropSets;
- (unsigned)cbBlob2;
- (unsigned)clientIsRemote;
- (unsigned)clientVersion;
- (void)setCExtPropSet:(unsigned int)a3;
- (void)setCPropSets:(unsigned int)a3;
- (void)setCbBlob2:(unsigned int)a3;
- (void)setClientIsRemote:(unsigned int)a3;
- (void)setClientMachineName:(id)a3;
- (void)setClientVersion:(unsigned int)a3;
- (void)setCoreFrameworkSet2:(id)a3;
- (void)setCoreFrameworkSet:(id)a3;
- (void)setFsciFrameworkSet1:(id)a3;
- (void)setFsciFrameworkSet2:(id)a3;
- (void)setMsidxsRowSetSet:(id)a3;
- (void)setQueryExtSet:(id)a3;
- (void)setServerMachineName:(id)a3;
- (void)setUserName:(id)a3;
- (wspConnectIn)initWithCtx:(id)a3 EnableRowSetEvents:(BOOL)a4 NoExpensiveProps:(BOOL)a5 UseExtendedBTypes:(BOOL)a6;
- (wspPropertySet)coreFrameworkSet;
- (wspPropertySet)coreFrameworkSet2;
- (wspPropertySet)fsciFrameworkSet1;
- (wspPropertySet)fsciFrameworkSet2;
- (wspPropertySet)msidxsRowSetSet;
- (wspPropertySet)queryExtSet;
@end

@implementation wspConnectIn

- (wspConnectIn)initWithCtx:(id)a3 EnableRowSetEvents:(BOOL)a4 NoExpensiveProps:(BOOL)a5 UseExtendedBTypes:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  v400.receiver = self;
  v400.super_class = (Class)wspConnectIn;
  v11 = [(wspConnectIn *)&v400 init];
  v12 = (wspConnectIn *)v11;
  if (!v11)
  {
    v27 = 0;
    v25 = 0;
    v23 = 0;
    goto LABEL_38;
  }
  *(_OWORD *)(v11 + 8) = xmmword_235FADCE0;
  *((void *)v11 + 3) = 0x100010700;
  *((_DWORD *)v11 + 8) = 0;
  uint64_t v13 = [v10 clientMachineName];
  clientMachineName = v12->_clientMachineName;
  v12->_clientMachineName = (NSString *)v13;

  uint64_t v15 = [v10 serverName];
  serverMachineName = v12->_serverMachineName;
  v12->_serverMachineName = (NSString *)v15;

  uint64_t v17 = [v10 userName];
  userName = v12->_userName;
  v12->_userName = (NSString *)v17;

  v12->_cPropSets = 2;
  v19 = [[wspPropertySet alloc] initWithPropSetID:1];
  fsciFrameworkSet1 = v12->_fsciFrameworkSet1;
  v12->_fsciFrameworkSet1 = v19;

  if (!v12->_fsciFrameworkSet1) {
    goto LABEL_35;
  }
  v21 = [[catalogNameProp alloc] initWithCatName:@"Windows\\SystemIndex" UseExtBTypes:1];
  if (!v21)
  {
    BOOL v58 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v58) {
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:](v58, v59, v60, v61, v62, v63, v64, v65);
    }
    goto LABEL_35;
  }
  v22 = v21;
  [(wspPropertySet *)v12->_fsciFrameworkSet1 addProperty:v21];
  v23 = objc_alloc_init(queryTypeProp);

  if (!v23)
  {
    BOOL v66 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v66) {
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:](v66, v67, v68, v69, v70, v71, v72, v73);
    }
LABEL_35:
    v27 = 0;
    v25 = 0;
    v23 = 0;
LABEL_36:
    v28 = (scopeFlagsProp *)v12;
LABEL_37:

    v12 = 0;
    goto LABEL_38;
  }
  [(wspPropertySet *)v12->_fsciFrameworkSet1 addProperty:v23];
  uint64_t v24 = [NSNumber numberWithInt:1];
  if (!v24)
  {
    BOOL v75 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v75) {
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:](v75, v76, v77, v78, v79, v80, v81, v82);
    }
    v27 = 0;
    v25 = 0;
    goto LABEL_36;
  }
  v25 = (void *)v24;
  uint64_t v26 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", v24, 0);
  if (!v26)
  {
    BOOL v83 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v83) {
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:].cold.4(v83, v84, v85, v86, v87, v88, v89, v90);
    }
    v27 = 0;
    goto LABEL_36;
  }
  v27 = (void *)v26;
  v28 = [[scopeFlagsProp alloc] initWithScopeFlagsArr:v26 UseExtBTypes:1];
  if (!v28)
  {
    BOOL v91 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v91) {
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:].cold.5(v91, v92, v93, v94, v95, v96, v97, v98);
    }
    goto LABEL_56;
  }
  [(wspPropertySet *)v12->_fsciFrameworkSet1 addProperty:v28];

  v29 = [[includeScopesProp alloc] initWithIncludeScopes:&unk_26E9594F8 UseExtBTypes:1];
  if (!v29)
  {
    BOOL v99 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v99) {
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:].cold.6(v99, v100, v101, v102, v103, v104, v105, v106);
    }
    goto LABEL_50;
  }
  [(wspPropertySet *)v12->_fsciFrameworkSet1 addProperty:v29];
  v30 = [[wspPropertySet alloc] initWithPropSetID:2];
  coreFrameworkSet = v12->_coreFrameworkSet;
  v12->_coreFrameworkSet = v30;

  if (!v12->_coreFrameworkSet)
  {
    v27 = &unk_26E9594F8;
    v23 = (queryTypeProp *)v29;
    goto LABEL_56;
  }
  v398 = v28;
  v32 = [machineProp alloc];
  v33 = [v10 serverName];
  v23 = [(machineProp *)v32 initWithServerMachine:v33 UseExtBTypes:0];

  if (!v23)
  {
    BOOL v107 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v107) {
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:].cold.7(v107, v108, v109, v110, v111, v112, v113, v114);
    }
    v23 = 0;
    goto LABEL_55;
  }
  [(wspPropertySet *)v12->_coreFrameworkSet addProperty:v23];
  v12->_cExtPropSet = 4;
  v34 = [[wspPropertySet alloc] initWithPropSetID:4];
  msidxsRowSetSet = v12->_msidxsRowSetSet;
  v12->_msidxsRowSetSet = v34;

  if (!v12->_msidxsRowSetSet)
  {
LABEL_55:
    v27 = &unk_26E9594F8;
    v28 = v398;
    goto LABEL_56;
  }
  v36 = [[rowQueryStatusProp alloc] initWithInt:0];

  if (!v36)
  {
    BOOL v115 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    v28 = v398;
    if (v115) {
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:].cold.8(v115, v116, v117, v118, v119, v120, v121, v122);
    }
LABEL_50:
    v23 = 0;
    v27 = &unk_26E9594F8;
LABEL_56:

    goto LABEL_37;
  }
  [(wspPropertySet *)v12->_msidxsRowSetSet addProperty:v36];
  v37 = [[cmdLocaleStrProp alloc] initWithLocaleStr:@"EN"];
  [(cmdLocaleStrProp *)v37 set_dbpropOptions:1];
  [(wspPropertySet *)v12->_msidxsRowSetSet addProperty:v37];
  v38 = [[queryRestrictionProp alloc] initWithRestrictionStr:&stru_26E952838];

  if (!v38)
  {
    BOOL v123 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    v28 = v398;
    if (v123) {
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:].cold.9(v123, v124, v125, v126, v127, v128, v129, v130);
    }
    goto LABEL_73;
  }
  [(wspPropertySet *)v12->_msidxsRowSetSet addProperty:v38];
  v39 = [[parseTreeProp alloc] initWithParseTreeStr:&stru_26E952838];

  v28 = v398;
  if (!v39)
  {
    BOOL v131 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v131) {
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:]0(v131, v132, v133, v134, v135, v136, v137, v138);
    }
    goto LABEL_73;
  }
  [(wspPropertySet *)v12->_msidxsRowSetSet addProperty:v39];
  v40 = [[maxRankProp alloc] initWithInt:0];

  if (!v40)
  {
    BOOL v139 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v139) {
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:]1(v139, v140, v141, v142, v143, v144, v145, v146);
    }
    goto LABEL_73;
  }
  [(wspPropertySet *)v12->_msidxsRowSetSet addProperty:v40];
  v41 = [[resultsFoundProp alloc] initWithInt:0];

  if (!v41)
  {
    BOOL v147 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v147) {
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:]2(v147, v148, v149, v150, v151, v152, v153, v154);
    }
    goto LABEL_73;
  }
  [(wspPropertySet *)v12->_msidxsRowSetSet addProperty:v41];
  v42 = [[whereIDProp alloc] initWithUInt:0];

  if (!v42)
  {
    BOOL v155 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v155) {
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:]3(v155, v156, v157, v158, v159, v160, v161, v162);
    }
    goto LABEL_73;
  }
  [(wspPropertySet *)v12->_msidxsRowSetSet addProperty:v42];
  v43 = [[serverVersionProp alloc] initWithInt:0];

  if (!v43)
  {
    BOOL v163 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v163) {
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:]4(v163, v164, v165, v166, v167, v168, v169, v170);
    }
    goto LABEL_73;
  }
  [(wspPropertySet *)v12->_msidxsRowSetSet addProperty:v43];
  v44 = [[serverWinVersionMajorProp alloc] initWithInt:0];

  if (!v44)
  {
    BOOL v171 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v171) {
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:]5(v171, v172, v173, v174, v175, v176, v177, v178);
    }
LABEL_73:
    v23 = 0;
LABEL_74:

    v27 = &unk_26E9594F8;
    goto LABEL_37;
  }
  [(wspPropertySet *)v12->_msidxsRowSetSet addProperty:v44];
  v45 = [[serverWinVersionMinorProp alloc] initWithInt:0];

  if (!v45)
  {
    BOOL v179 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v179) {
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:]6(v179, v180, v181, v182, v183, v184, v185, v186);
    }
    goto LABEL_87;
  }
  BOOL v46 = v7;
  [(wspPropertySet *)v12->_msidxsRowSetSet addProperty:v45];
  v47 = [[serverNlsVersionProp alloc] initWithInt:0];

  if (!v47)
  {
    BOOL v187 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v187) {
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:]7(v187, v188, v189, v190, v191, v192, v193, v194);
    }
    goto LABEL_87;
  }
  [(wspPropertySet *)v12->_msidxsRowSetSet addProperty:v47];
  v48 = [[serverNlsVersionDefProp alloc] initWithInt:0];

  if (!v48)
  {
    BOOL v195 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v195) {
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:]8(v195, v196, v197, v198, v199, v200, v201, v202);
    }
    goto LABEL_87;
  }
  [(wspPropertySet *)v12->_msidxsRowSetSet addProperty:v48];
  v23 = [[sameSortOrderUsedProp alloc] initWithBool:1];

  if (!v23)
  {
    BOOL v203 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v203) {
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:]9(v203, v204, v205, v206, v207, v208, v209, v210);
    }
    goto LABEL_87;
  }
  [(wspPropertySet *)v12->_msidxsRowSetSet addProperty:v23];
  v49 = [[wspPropertySet alloc] initWithPropSetID:3];
  queryExtSet = v12->_queryExtSet;
  v12->_queryExtSet = v49;

  if (!v12->_coreFrameworkSet)
  {
LABEL_88:
    v28 = v398;
    goto LABEL_74;
  }
  v51 = [[useContentIndexProp alloc] initWithBool:0];

  if (!v51)
  {
    BOOL v211 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v211) {
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:]0(v211, v212, v213, v214, v215, v216, v217, v218);
    }
    goto LABEL_87;
  }
  [(wspPropertySet *)v12->_queryExtSet addProperty:v51];
  v23 = [[deferNonIndexedTrimProp alloc] initWithBool:0];

  if (!v23)
  {
    BOOL v219 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v219) {
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:]1(v219, v220, v221, v222, v223, v224, v225, v226);
    }
LABEL_87:
    v23 = 0;
    goto LABEL_88;
  }
  [(wspPropertySet *)v12->_queryExtSet addProperty:v23];
  v52 = [useExtendedBtypesProp alloc];
  if (v6)
  {
    v53 = [(useExtendedBtypesProp *)v52 initWithBool:1];
    if (v53)
    {
      v54 = (wspConnectIn *)v53;
      v55 = [(useExtendedBtypesProp *)v53 cProps];
      v56 = v55;
      uint64_t v57 = 1;
      goto LABEL_91;
    }
LABEL_101:
    BOOL v240 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v240) {
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:]2(v240, v241, v242, v243, v244, v245, v246, v247);
    }
    v54 = v12;
    goto LABEL_119;
  }
  v227 = [(useExtendedBtypesProp *)v52 initWithBool:0];
  if (!v227) {
    goto LABEL_101;
  }
  v54 = (wspConnectIn *)v227;
  v55 = [(useExtendedBtypesProp *)v227 cProps];
  v56 = v55;
  uint64_t v57 = 0;
LABEL_91:
  [v55 setDbPropOptions:v57];

  [(wspPropertySet *)v12->_queryExtSet addProperty:v54];
  v228 = [[ignoreNoiseOnlyClausesProp alloc] initWithBool:0];

  if (!v228)
  {
    BOOL v248 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v248) {
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:]3(v248, v249, v250, v251, v252, v253, v254, v255);
    }
    goto LABEL_118;
  }
  [(wspPropertySet *)v12->_queryExtSet addProperty:v228];
  v229 = [[genericOptionsStrProp alloc] initWithOptionsStr:&stru_26E952838];

  if (!v229)
  {
    BOOL v256 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v256) {
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:]4(v256, v257, v258, v259, v260, v261, v262, v263);
    }
    goto LABEL_118;
  }
  [(wspPropertySet *)v12->_queryExtSet addProperty:v229];
  v230 = [[deferCatalogVerifyProp alloc] initWithBool:0];

  if (!v230)
  {
    BOOL v264 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v264) {
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:]5(v264, v265, v266, v267, v268, v269, v270, v271);
    }
    goto LABEL_118;
  }
  [(wspPropertySet *)v12->_queryExtSet addProperty:v230];
  v231 = [[ignoreSBRIProp alloc] initWithBool:0];

  if (!v231)
  {
    BOOL v272 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v272) {
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:]6(v272, v273, v274, v275, v276, v277, v278, v279);
    }
    goto LABEL_118;
  }
  [(wspPropertySet *)v12->_queryExtSet addProperty:v231];
  v232 = [[genParseTreeProp alloc] initWithBool:0];

  if (!v232)
  {
    BOOL v280 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v280) {
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:]7(v280, v281, v282, v283, v284, v285, v286, v287);
    }
    goto LABEL_118;
  }
  [(wspPropertySet *)v12->_queryExtSet addProperty:v232];
  v233 = [[freeTextAnyTermProp alloc] initWithBool:0];

  if (!v233)
  {
    BOOL v288 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v288) {
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:]8(v288, v289, v290, v291, v292, v293, v294, v295);
    }
    goto LABEL_118;
  }
  [(wspPropertySet *)v12->_queryExtSet addProperty:v233];
  v23 = [[freeTextUseStemmingProp alloc] initWithBool:0];

  if (!v23)
  {
    BOOL v296 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v296) {
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:]9(v296, v297, v298, v299, v300, v301, v302, v303);
    }
LABEL_118:

    v23 = 0;
LABEL_119:

    v27 = &unk_26E9594F8;
    v28 = v398;
    goto LABEL_37;
  }
  [(wspPropertySet *)v12->_queryExtSet addProperty:v23];
  v234 = [noExpensivePropsProp alloc];
  if (v46)
  {
    v235 = [(noExpensivePropsProp *)v234 initWithBool:1];
    if (v235)
    {
      v236 = v235;
      v237 = [(noExpensivePropsProp *)v235 cProps];
      v238 = v237;
      uint64_t v239 = 1;
      goto LABEL_122;
    }
LABEL_125:
    BOOL v311 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v311) {
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:]0(v311, v312, v313, v314, v315, v316, v317, v318);
    }

    goto LABEL_119;
  }
  v304 = [(noExpensivePropsProp *)v234 initWithBool:0];
  if (!v304) {
    goto LABEL_125;
  }
  v236 = v304;
  v237 = [(noExpensivePropsProp *)v304 cProps];
  v238 = v237;
  uint64_t v239 = 0;
LABEL_122:
  [v237 setDbPropOptions:v239];

  [(wspPropertySet *)v12->_queryExtSet addProperty:v236];
  v305 = [enableRowSetEventsProp alloc];
  if (v8)
  {
    v306 = [(enableRowSetEventsProp *)v305 initWithBool:1];
    if (v306)
    {
      v307 = (wspConnectIn *)v306;
      v308 = [(enableRowSetEventsProp *)v306 cProps];
      v309 = v308;
      uint64_t v310 = 1;
      goto LABEL_130;
    }
LABEL_139:
    BOOL v338 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v338) {
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:]1(v338, v339, v340, v341, v342, v343, v344, v345);
    }
    goto LABEL_142;
  }
  v319 = [(enableRowSetEventsProp *)v305 initWithBool:0];
  if (!v319) {
    goto LABEL_139;
  }
  v307 = (wspConnectIn *)v319;
  v308 = [(enableRowSetEventsProp *)v319 cProps];
  v309 = v308;
  uint64_t v310 = 0;
LABEL_130:
  [v308 setDbPropOptions:v310];

  [(wspPropertySet *)v12->_queryExtSet addProperty:v307];
  v320 = [[wspPropertySet alloc] initWithPropSetID:2];
  coreFrameworkSet2 = v12->_coreFrameworkSet2;
  v12->_coreFrameworkSet2 = v320;

  if (!v12->_coreFrameworkSet2)
  {

    v12 = v307;
LABEL_142:

LABEL_146:
    goto LABEL_119;
  }
  v322 = [machineProp alloc];
  v323 = [v10 serverName];
  v324 = [(machineProp *)v322 initWithServerMachine:v323 UseExtBTypes:0];

  v397 = v324;
  if (!v324)
  {
    BOOL v346 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v346) {
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:]2(v346, v347, v348, v349, v350, v351, v352, v353);
    }
    goto LABEL_145;
  }
  v325 = [(machineProp *)v324 cProps];
  [v325 setTimeMidGuid];

  [(wspPropertySet *)v12->_coreFrameworkSet2 addProperty:v324];
  v326 = [[wspPropertySet alloc] initWithPropSetID:1];
  fsciFrameworkSet2 = v12->_fsciFrameworkSet2;
  v12->_fsciFrameworkSet2 = v326;

  if (!v12->_fsciFrameworkSet1)
  {
LABEL_145:

    goto LABEL_146;
  }
  v396 = [[includeScopesProp alloc] initWithIncludeScopes:&unk_26E959510 UseExtBTypes:0];
  if (!v396)
  {
    BOOL v354 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v354) {
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:]3(v354, v355, v356, v357, v358, v359, v360, v361);
    }

    goto LABEL_153;
  }
  v328 = [(includeScopesProp *)v396 cProps];
  [v328 setTimeMidGuid];

  v329 = [(includeScopesProp *)v396 variant];
  v330 = [v329 arrObj];
  [v330 setFFeatures:256];

  [(wspPropertySet *)v12->_fsciFrameworkSet2 addProperty:v396];
  uint64_t v331 = [NSNumber numberWithInt:1];

  v394 = (void *)v331;
  if (!v331)
  {
    BOOL v362 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v362) {
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:]4(v362, v363, v364, v365, v366, v367, v368, v369);
    }

    v25 = 0;
LABEL_153:
    v12 = 0;
    int v337 = 2;
    v395 = &unk_26E959510;
    goto LABEL_165;
  }
  v395 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", v331, 0);
  if (v395)
  {
    v332 = [[scopeFlagsProp alloc] initWithScopeFlagsArr:v395 UseExtBTypes:0];

    if (!v332)
    {
      BOOL v378 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v378) {
        -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:]6(v378, v379, v380, v381, v382, v383, v384, v385);
      }
      int v337 = 2;
      v399 = v12;
      v25 = v394;
      v12 = 0;

      goto LABEL_166;
    }
    v333 = [(scopeFlagsProp *)v332 cProps];
    [v333 setTimeMidGuid];

    [(wspPropertySet *)v12->_fsciFrameworkSet2 addProperty:v332];
    v334 = [[catalogNameProp alloc] initWithCatName:@"Windows\\SystemIndex" UseExtBTypes:0];
    v335 = v334;
    if (v334)
    {
      v336 = [(catalogNameProp *)v334 cProps];
      [v336 setTimeMidGuid];

      [(wspPropertySet *)v12->_fsciFrameworkSet2 addProperty:v335];
      int v337 = 0;
    }
    else
    {
      BOOL v386 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v386) {
        -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:]7(v386, v387, v388, v389, v390, v391, v392, v393);
      }

      v12 = 0;
      int v337 = 2;
    }

    v398 = v332;
  }
  else
  {
    BOOL v370 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v370) {
      -[wspConnectIn initWithCtx:EnableRowSetEvents:NoExpensiveProps:UseExtendedBTypes:]5(v370, v371, v372, v373, v374, v375, v376, v377);
    }

    v395 = 0;
    v12 = 0;
    int v337 = 2;
  }
  v25 = v394;
LABEL_165:

LABEL_166:
  if ((v337 | 2) != 2)
  {
    v27 = v395;
    goto LABEL_39;
  }
  v27 = v395;
LABEL_38:
  v12 = v12;
LABEL_39:

  return v12;
}

- (int)encodeBuffer:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5
{
  id v8 = a3;
  unsigned int v77 = 0;
  unint64_t v9 = [v8 length];
  if (v9 <= a4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[wspConnectIn encodeBuffer:BufferOffset:BytesWritten:]9();
    }
    goto LABEL_7;
  }
  unint64_t v10 = v9 - a4;
  id v11 = v8;
  uint64_t v12 = [v11 bytes];
  if (v10 <= 0xF)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[wspConnectIn encodeBuffer:BufferOffset:BytesWritten:]();
    }
    goto LABEL_7;
  }
  uint64_t v15 = v12;
  *($D892E086A49BFFF1EF9F4B456CBD0A06 *)(v12 + a4) = self->msghdr;
  if (v10 - 16 <= 3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[wspConnectIn encodeBuffer:BufferOffset:BytesWritten:]();
    }
    goto LABEL_7;
  }
  *(_DWORD *)(v12 + a4 + 16) = self->_clientVersion;
  if (v10 - 20 <= 3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[wspConnectIn encodeBuffer:BufferOffset:BytesWritten:]();
    }
    goto LABEL_7;
  }
  *(_DWORD *)(v12 + a4 + 20) = self->_clientIsRemote;
  v16 = [utf16leData alloc];
  uint64_t v17 = [(wspConnectIn *)self clientMachineName];
  v18 = [(utf16leData *)v16 initWithStr:v17];

  if (!v18)
  {
    BOOL v21 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v21) {
      -[wspConnectIn encodeBuffer:BufferOffset:BytesWritten:].cold.4(v21, v22, v23, v24, v25, v26, v27, v28);
    }
    goto LABEL_7;
  }
  unint64_t v19 = v10 - 48;
  unsigned int v20 = [(utf16leData *)v18 byteCount];
  if (v19 < v20)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[wspConnectIn encodeBuffer:BufferOffset:BytesWritten:].cold.5();
    }

    goto LABEL_7;
  }
  unint64_t v72 = v19;
  size_t v29 = v20;
  unsigned int v70 = a4 + 48;
  id v30 = [(utf16leData *)v18 datab];
  int __dst = v29;
  memcpy((void *)(v15 + a4 + 48), (const void *)[v30 bytes], v29);

  v31 = [utf16leData alloc];
  v32 = [(wspConnectIn *)self userName];
  v33 = [(utf16leData *)v31 initWithStr:v32];

  if (!v33)
  {
    BOOL v36 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v36) {
      -[wspConnectIn encodeBuffer:BufferOffset:BytesWritten:].cold.6(v36, v37, v38, v39, v40, v41, v42, v43);
    }
    goto LABEL_7;
  }
  unint64_t v34 = v72 - v29;
  unsigned int v35 = [(utf16leData *)v33 byteCount];
  if (v72 - v29 < v35)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[wspConnectIn encodeBuffer:BufferOffset:BytesWritten:].cold.5();
    }
LABEL_37:

    goto LABEL_7;
  }
  size_t v44 = v35;
  uint64_t v73 = v33;
  id v45 = [(utf16leData *)v33 datab];
  memcpy((void *)(v15 + __dst + v70), (const void *)[v45 bytes], v44);

  unsigned int v46 = v44 + __dst + v70;
  unint64_t v47 = v34 - v44;
  unsigned int v48 = align8Pad(v46);
  if (!v48)
  {
LABEL_34:
    if (v47 <= 3)
    {
      v33 = v73;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[wspConnectIn encodeBuffer:BufferOffset:BytesWritten:].cold.8();
      }
      goto LABEL_37;
    }
    *(_DWORD *)(v15 + v46) = self->_cPropSets;
    uint64_t v49 = v46 + 4;
    v50 = [(wspConnectIn *)self fsciFrameworkSet1];
    int v13 = [v50 encodeBuffer:v11 BufferOffset:v49 BytesWritten:&v77];

    if (v13)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[wspConnectIn encodeBuffer:BufferOffset:BytesWritten:]7();
      }
    }
    else
    {
      unint64_t __dsta = v77;
      uint64_t v51 = v77 + v49;
      v52 = [(wspConnectIn *)self coreFrameworkSet];
      int v13 = [v52 encodeBuffer:v11 BufferOffset:v51 BytesWritten:&v77];

      if (v13)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[wspConnectIn encodeBuffer:BufferOffset:BytesWritten:]6();
        }
      }
      else
      {
        unsigned int v53 = v77 + v51;
        unint64_t v54 = v47 - __dsta - v77 - 4;
        *(_DWORD *)(v15 + a4 + 24) = __dsta + v77 + 4;
        unsigned int v55 = align8Pad(v53);
        if (v55)
        {
          if (v54 < v55)
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              -[wspConnectIn encodeBuffer:BufferOffset:BytesWritten:]5();
            }
            goto LABEL_32;
          }
          v53 += v55;
          v54 -= v55;
        }
        if (v54 <= 3)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            -[wspConnectIn encodeBuffer:BufferOffset:BytesWritten:].cold.9();
          }
          goto LABEL_32;
        }
        *(_DWORD *)(v15 + v53) = self->_cExtPropSet;
        unsigned int v56 = v53 + 4;
        uint64_t v57 = [(wspConnectIn *)self msidxsRowSetSet];
        int v13 = [v57 encodeBuffer:v11 BufferOffset:v53 + 4 BytesWritten:&v77];

        if (v13)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            -[wspConnectIn encodeBuffer:BufferOffset:BytesWritten:]4();
          }
        }
        else
        {
          unint64_t __dstb = v77;
          uint64_t v58 = v77 + v56;
          uint64_t v59 = [(wspConnectIn *)self queryExtSet];
          int v13 = [v59 encodeBuffer:v11 BufferOffset:v58 BytesWritten:&v77];

          if (v13)
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              -[wspConnectIn encodeBuffer:BufferOffset:BytesWritten:]3();
            }
          }
          else
          {
            uint64_t v71 = v77;
            uint64_t v60 = v77 + v58;
            uint64_t v61 = [(wspConnectIn *)self coreFrameworkSet2];
            int v13 = [v61 encodeBuffer:v11 BufferOffset:v60 BytesWritten:&v77];

            if (v13)
            {
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                -[wspConnectIn encodeBuffer:BufferOffset:BytesWritten:]2();
              }
            }
            else
            {
              uint64_t v69 = v77;
              uint64_t v62 = v77 + v60;
              uint64_t v63 = [(wspConnectIn *)self fsciFrameworkSet2];
              int v13 = [v63 encodeBuffer:v11 BufferOffset:v62 BytesWritten:&v77];

              if (!v13)
              {
                unsigned int v64 = a4 + 32;
                uint64_t v65 = v77;
                unsigned int v66 = v77 + v62;
                *(_DWORD *)(v15 + v64) = __dstb + v71 + v69 + v77 + 4;
                unsigned int v67 = align8Pad(v66);
                if (v67)
                {
                  unsigned int v68 = v67;
                  if (v54 - (__dstb + v71) - (v69 + v65) - 4 < v67)
                  {
                    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                      -[wspConnectIn encodeBuffer:BufferOffset:BytesWritten:]0();
                    }
                    goto LABEL_32;
                  }
                  bzero((void *)(v15 + v66), v67);
                  v66 += v68;
                }
                *(_DWORD *)(v15 + 8) = getChecksum32(200, (int *)(v15 + 16), v66 - 16);
                *a5 = v66;

                int v13 = 0;
                goto LABEL_8;
              }
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                -[wspConnectIn encodeBuffer:BufferOffset:BytesWritten:]1();
              }
            }
          }
        }
      }
    }

    goto LABEL_8;
  }
  if (v47 >= v48)
  {
    v46 += v48;
    v47 -= v48;
    goto LABEL_34;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[wspConnectIn encodeBuffer:BufferOffset:BytesWritten:]8();
  }
LABEL_32:

LABEL_7:
  int v13 = 12;
LABEL_8:

  return v13;
}

- (unsigned)clientVersion
{
  return self->_clientVersion;
}

- (void)setClientVersion:(unsigned int)a3
{
  self->_clientVersion = a3;
}

- (unsigned)clientIsRemote
{
  return self->_clientIsRemote;
}

- (void)setClientIsRemote:(unsigned int)a3
{
  self->_clientIsRemote = a3;
}

- (unsigned)cbBlob2
{
  return self->_cbBlob2;
}

- (void)setCbBlob2:(unsigned int)a3
{
  self->_cbBlob2 = a3;
}

- (NSString)clientMachineName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setClientMachineName:(id)a3
{
}

- (NSString)serverMachineName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setServerMachineName:(id)a3
{
}

- (NSString)userName
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setUserName:(id)a3
{
}

- (unsigned)cPropSets
{
  return self->_cPropSets;
}

- (void)setCPropSets:(unsigned int)a3
{
  self->_cPropSets = a3;
}

- (wspPropertySet)fsciFrameworkSet1
{
  return (wspPropertySet *)objc_getProperty(self, a2, 72, 1);
}

- (void)setFsciFrameworkSet1:(id)a3
{
}

- (wspPropertySet)coreFrameworkSet
{
  return (wspPropertySet *)objc_getProperty(self, a2, 80, 1);
}

- (void)setCoreFrameworkSet:(id)a3
{
}

- (unsigned)cExtPropSet
{
  return self->_cExtPropSet;
}

- (void)setCExtPropSet:(unsigned int)a3
{
  self->_cExtPropSet = a3;
}

- (wspPropertySet)msidxsRowSetSet
{
  return (wspPropertySet *)objc_getProperty(self, a2, 88, 1);
}

- (void)setMsidxsRowSetSet:(id)a3
{
}

- (wspPropertySet)queryExtSet
{
  return (wspPropertySet *)objc_getProperty(self, a2, 96, 1);
}

- (void)setQueryExtSet:(id)a3
{
}

- (wspPropertySet)coreFrameworkSet2
{
  return (wspPropertySet *)objc_getProperty(self, a2, 104, 1);
}

- (void)setCoreFrameworkSet2:(id)a3
{
}

- (wspPropertySet)fsciFrameworkSet2
{
  return (wspPropertySet *)objc_getProperty(self, a2, 112, 1);
}

- (void)setFsciFrameworkSet2:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fsciFrameworkSet2, 0);
  objc_storeStrong((id *)&self->_coreFrameworkSet2, 0);
  objc_storeStrong((id *)&self->_queryExtSet, 0);
  objc_storeStrong((id *)&self->_msidxsRowSetSet, 0);
  objc_storeStrong((id *)&self->_coreFrameworkSet, 0);
  objc_storeStrong((id *)&self->_fsciFrameworkSet1, 0);
  objc_storeStrong((id *)&self->_userName, 0);
  objc_storeStrong((id *)&self->_serverMachineName, 0);

  objc_storeStrong((id *)&self->_clientMachineName, 0);
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.11(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.12(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.13(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.15(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.16(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.17(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.19(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.21(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.22(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.23(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.25(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.26(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.27(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.29(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.31(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.32(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.33(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.35(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.36(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCtx:(uint64_t)a3 EnableRowSetEvents:(uint64_t)a4 NoExpensiveProps:(uint64_t)a5 UseExtendedBTypes:(uint64_t)a6 .cold.37(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8(&dword_235F82000, &_os_log_internal, v0, "wspConnectIn:encodeBuffer: no buffer space for WSP header, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.2()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8(&dword_235F82000, &_os_log_internal, v0, "wspConnectIn:encodeBuffer: no buffer space for clientVersion, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.3()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8(&dword_235F82000, &_os_log_internal, v0, "wspConnectIn:encodeBuffer: no buffer space for fClientIsRemote, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:(uint64_t)a3 BufferOffset:(uint64_t)a4 BytesWritten:(uint64_t)a5 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.5()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8(&dword_235F82000, &_os_log_internal, v0, "wspConnectIn:encodeBuffer: no buffer space for userName, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:(uint64_t)a3 BufferOffset:(uint64_t)a4 BytesWritten:(uint64_t)a5 .cold.6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.8()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspConnectIn:encodeBuffer: no buffer space for cPropSets: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.9()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspConnectIn:encodeBuffer: no buffer space for cExtPropSet: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.10()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspConnectIn:encodeBuffer: no buffer space for final align: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.11()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_235F82000, &_os_log_internal, v0, "wspConnectIn:encodeBuffer: encode aPropertySet fsciFrameworkSet2  error: %d\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.12()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_235F82000, &_os_log_internal, v0, "wspConnectIn:encodeBuffer: encode aPropertySet coreFrameWorkSet2 error: %d\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.13()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_235F82000, &_os_log_internal, v0, "wspConnectIn:encodeBuffer: encode queryExtSet error: %d\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.14()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_235F82000, &_os_log_internal, v0, "wspConnectIn:encodeBuffer: encode msidxsRowSetSet error: %d\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.15()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspConnectIn:encodeBuffer: no buffer space for paddingExtPropSets: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.16()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_235F82000, &_os_log_internal, v0, "wspConnectIn:encodeBuffer: encode PropertySet2  error: %d\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.17()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_235F82000, &_os_log_internal, v0, "wspConnectIn:encodeBuffer: encode PropertySet1 error: %d\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.18()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspConnectIn:encodeBuffer: no buffer space for paddingcPropSets: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.19()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspConnectIn:encodeBuffer: no buffer space, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
}

@end