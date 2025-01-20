@interface NTPBTodaySectionConfig(FCAdditions)
+ (id)sectionConfigWithJSONDictionary:()FCAdditions;
@end

@implementation NTPBTodaySectionConfig(FCAdditions)

+ (id)sectionConfigWithJSONDictionary:()FCAdditions
{
  uint64_t v407 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v346 = v3;
  if (v3)
  {
    id v4 = v3;
    v348 = [v4 objectForKeyedSubscript:*MEMORY[0x263F59268]];
    uint64_t v5 = [v348 objectForKeyedSubscript:*MEMORY[0x263F59270]];
    v347 = (void *)v5;
    if (v348) {
      BOOL v6 = v5 == 0;
    }
    else {
      BOOL v6 = 1;
    }
    if (!v6)
    {
      v7 = [MEMORY[0x263F08790] dateFormatterWithFormat:@"yyyy-MM-dd'T'HH:mm:ss" forReuse:0];
      v8 = [v7 dateFromString:v347];

      if (v8)
      {
        v9 = [MEMORY[0x263EFF910] date];
        int v10 = objc_msgSend(v9, "fc_isLaterThan:", v8);

        if (v10)
        {
          uint64_t v11 = objc_msgSend(NSDictionary, "fc_dictionaryByAddingEntriesFromDictionary:toDictionary:", v348, v4);

          id v4 = (id)v11;
        }
      }
    }
    v12 = objc_opt_new();
    uint64_t v374 = 0;
    v375 = &v374;
    uint64_t v376 = 0x2020000000;
    char v377 = 1;
    uint64_t v13 = [v4 objectForKeyedSubscript:*MEMORY[0x263F591B0]];
    [v12 setIdentifier:v13];
    v329 = (void *)v13;
    if (!v13)
    {
      v14 = &_os_log_internal;
      id v15 = &_os_log_internal;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        +[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]8((void *)[[NSString alloc] initWithFormat:@"section config requires identifier"], v406);
      }

      uint64_t v13 = 0;
    }
    if (v13) {
      BOOL v16 = *((unsigned char *)v375 + 24) == 0;
    }
    else {
      BOOL v16 = 1;
    }
    char v17 = !v16;
    *((unsigned char *)v375 + 24) = v17;
    uint64_t v18 = [v4 objectForKeyedSubscript:*MEMORY[0x263F59290]];
    [v12 setSubidentifier:v18];
    uint64_t v19 = [v4 objectForKeyedSubscript:*MEMORY[0x263F591E0]];
    [v12 setName:v19];
    v345 = (void *)v19;
    uint64_t v20 = [v4 objectForKeyedSubscript:*MEMORY[0x263F59148]];
    v21 = (void *)v20;
    if (v20) {
      uint64_t v19 = v20;
    }
    [v12 setCompactName:v19];
    v326 = v21;
    uint64_t v22 = [v4 objectForKeyedSubscript:*MEMORY[0x263F59260]];
    v23 = (void *)v22;
    if (v22) {
      uint64_t v24 = v22;
    }
    else {
      uint64_t v24 = v19;
    }
    [v12 setReferralBarName:v24];
    v325 = v23;
    uint64_t v25 = [v4 objectForKeyedSubscript:*MEMORY[0x263F591D8]];
    [v12 setNameColorLight:v25];
    v328 = (void *)v25;
    if (!v25)
    {
      v26 = &_os_log_internal;
      id v27 = &_os_log_internal;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        +[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]7((void *)[[NSString alloc] initWithFormat:@"section config requires name color light"], v405);
      }

      uint64_t v25 = 0;
    }
    v324 = (void *)v18;
    if (v25) {
      BOOL v28 = *((unsigned char *)v375 + 24) == 0;
    }
    else {
      BOOL v28 = 1;
    }
    char v29 = !v28;
    *((unsigned char *)v375 + 24) = v29;
    uint64_t v30 = [v4 objectForKeyedSubscript:*MEMORY[0x263F591D0]];
    v31 = (void *)v30;
    if (v30) {
      v32 = (void *)v30;
    }
    else {
      v32 = (void *)v25;
    }
    id v344 = v32;

    [v12 setNameColorDark:v344];
    v33 = [v4 objectForKeyedSubscript:*MEMORY[0x263F59298]];
    if (!v33)
    {
      v34 = &_os_log_internal;
      id v35 = &_os_log_internal;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        +[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]6((void *)[[NSString alloc] initWithFormat:@"section config requires a section type"], v404);
      }

      v33 = 0;
    }
    if (v33) {
      BOOL v36 = *((unsigned char *)v375 + 24) == 0;
    }
    else {
      BOOL v36 = 1;
    }
    char v37 = !v36;
    *((unsigned char *)v375 + 24) = v37;
    uint64_t v38 = [v33 intValue];
    unsigned int v39 = v38;
    uint64_t v40 = v38;
    v323 = v33;
    if (v33)
    {
      uint64_t v41 = 0;
      char v42 = 0;
      switch((int)v38)
      {
        case 0:
        case 1:
        case 3:
        case 4:
        case 5:
        case 6:
          char v42 = 1;
          uint64_t v41 = v38;
          break;
        default:
          break;
      }
      [v12 setSectionType:v41];
      if (*((unsigned char *)v375 + 24)) {
        char v43 = v42;
      }
      else {
        char v43 = 0;
      }
      *((unsigned char *)v375 + 24) = v43;
    }
    v44 = [v4 objectForKeyedSubscript:*MEMORY[0x263F59150]];
    v45 = v44;
    if (v44)
    {
      objc_msgSend(v12, "setFallbackOrder:", objc_msgSend(v44, "integerValue"));
    }
    else
    {
      v47 = &_os_log_internal;
      id v48 = &_os_log_internal;
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
        +[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]5((void *)[[NSString alloc] initWithFormat:@"section config requires fallback order"], v403);
      }

      v45 = 0;
    }
    v322 = v45;
    if (v45) {
      BOOL v49 = *((unsigned char *)v375 + 24) == 0;
    }
    else {
      BOOL v49 = 1;
    }
    char v50 = !v49;
    *((unsigned char *)v375 + 24) = v50;
    v51 = [v4 objectForKeyedSubscript:*MEMORY[0x263F59140]];
    v52 = v51;
    if (v51)
    {
      objc_msgSend(v12, "setCachedResultCutoffTime:", objc_msgSend(v51, "unsignedIntegerValue"));
    }
    else
    {
      v53 = &_os_log_internal;
      id v54 = &_os_log_internal;
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
        +[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]4((void *)[[NSString alloc] initWithFormat:@"section config requires cached result cutoff time"], v402);
      }

      v52 = 0;
    }
    v321 = v52;
    if (v52) {
      BOOL v55 = *((unsigned char *)v375 + 24) == 0;
    }
    else {
      BOOL v55 = 1;
    }
    char v56 = !v55;
    *((unsigned char *)v375 + 24) = v56;
    v57 = [v4 objectForKeyedSubscript:*MEMORY[0x263F591C0]];
    v343 = v57;
    if (v57) {
      uint64_t v58 = [v57 integerValue];
    }
    else {
      uint64_t v58 = 0x7FFFFFFFFFFFFFFFLL;
    }
    [v12 setMinimumStoriesAllocation:v58];
    v59 = [v4 objectForKeyedSubscript:*MEMORY[0x263F591B8]];
    v342 = v59;
    if (v59)
    {
      unint64_t v60 = [v59 integerValue];
      unint64_t v61 = [v12 minimumStoriesAllocation];
      if (v60 <= v61) {
        uint64_t v62 = v61;
      }
      else {
        uint64_t v62 = v60;
      }
    }
    else
    {
      uint64_t v62 = 0x7FFFFFFFFFFFFFFFLL;
    }
    [v12 setMaximumStoriesAllocation:v62];
    v63 = [v4 objectForKeyedSubscript:*MEMORY[0x263F59258]];
    v341 = v63;
    if (v63)
    {
      unsigned int v64 = [v63 intValue];
      if (v64 >= 2) {
        uint64_t v65 = 2;
      }
      else {
        uint64_t v65 = v64;
      }
      [v12 setReadArticlesFilterMethod:v65];
    }
    else
    {
      v66 = &_os_log_internal;
      id v67 = &_os_log_internal;
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
        +[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]3((void *)[[NSString alloc] initWithFormat:@"section config requires a read stories filter method"], v401);
      }
    }
    if (v341) {
      BOOL v68 = *((unsigned char *)v375 + 24) == 0;
    }
    else {
      BOOL v68 = 1;
    }
    char v69 = !v68;
    *((unsigned char *)v375 + 24) = v69;
    v70 = [v4 objectForKeyedSubscript:*MEMORY[0x263F59278]];
    v340 = v70;
    if (v70)
    {
      unsigned int v71 = [v70 intValue];
      if (v71 >= 3) {
        uint64_t v72 = 0;
      }
      else {
        uint64_t v72 = v71;
      }
      [v12 setSeenArticlesFilterMethod:v72];
    }
    else
    {
      v73 = &_os_log_internal;
      id v74 = &_os_log_internal;
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR)) {
        +[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]2((void *)[[NSString alloc] initWithFormat:@"section config requires seen stories filter method"], v400);
      }

      LODWORD(v72) = 0;
    }
    if (v340) {
      BOOL v75 = *((unsigned char *)v375 + 24) == 0;
    }
    else {
      BOOL v75 = 1;
    }
    char v76 = !v75;
    *((unsigned char *)v375 + 24) = v76;
    if (v72)
    {
      v77 = [v4 objectForKeyedSubscript:*MEMORY[0x263F59280]];
      v78 = v77;
      if (v77)
      {
        objc_msgSend(v12, "setSeenArticlesMinimumTimeSinceFirstSeenToFilter:", objc_msgSend(v77, "integerValue"));
      }
      else
      {
        v79 = &_os_log_internal;
        id v80 = &_os_log_internal;
        if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR)) {
          +[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]1((void *)[[NSString alloc] initWithFormat:@"section config requires seen stories minimum time to filter when seen stories filter method is not none"], v399);
        }
      }
      if (v78) {
        BOOL v81 = *((unsigned char *)v375 + 24) == 0;
      }
      else {
        BOOL v81 = 1;
      }
      char v82 = !v81;
      *((unsigned char *)v375 + 24) = v82;
    }
    v83 = [v4 objectForKeyedSubscript:*MEMORY[0x263F59168]];
    v339 = v83;
    if (v83)
    {
      if ([v83 BOOLValue]) {
        uint64_t v84 = 4;
      }
      else {
        uint64_t v84 = 0;
      }
    }
    else
    {
      v85 = &_os_log_internal;
      id v86 = &_os_log_internal;
      if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR)) {
        +[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]0((void *)[[NSString alloc] initWithFormat:@"section config requires a policy around whether to filter duplicate clusters within the section it describes"], v398);
      }

      uint64_t v84 = 1;
    }
    if (v339) {
      BOOL v87 = *((unsigned char *)v375 + 24) == 0;
    }
    else {
      BOOL v87 = 1;
    }
    char v88 = !v87;
    *((unsigned char *)v375 + 24) = v88;
    v89 = [v4 objectForKeyedSubscript:*MEMORY[0x263F59170]];
    v338 = v89;
    if (v89)
    {
      int v90 = [v89 BOOLValue];
      uint64_t v91 = 32;
      if (!v90) {
        uint64_t v91 = 0;
      }
      v84 |= v91;
    }
    else
    {
      v92 = &_os_log_internal;
      id v93 = &_os_log_internal;
      if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR)) {
        +[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]9((void *)[[NSString alloc] initWithFormat:@"section config requires a policy around whether to filter muted channels within the section it describes"], v397);
      }
    }
    if (v338) {
      BOOL v94 = *((unsigned char *)v375 + 24) == 0;
    }
    else {
      BOOL v94 = 1;
    }
    char v95 = !v94;
    *((unsigned char *)v375 + 24) = v95;
    uint64_t v96 = [v4 objectForKeyedSubscript:*MEMORY[0x263F59180]];
    v97 = (void *)v96;
    v98 = (void *)MEMORY[0x263EFFA88];
    if (v96) {
      v98 = (void *)v96;
    }
    id v337 = v98;

    if ([v337 BOOLValue])
    {
      uint64_t v99 = [v4 objectForKeyedSubscript:*MEMORY[0x263F591E8]];
      v100 = (void *)v99;
      v101 = &unk_26D9224E0;
      if (v99) {
        v101 = (void *)v99;
      }
      id v102 = v101;

      objc_msgSend(v12, "setPaywalledStoriesMaxCount:", objc_msgSend(v102, "unsignedIntegerValue"));
      v84 |= 0x800uLL;
    }
    v103 = [v4 objectForKeyedSubscript:*MEMORY[0x263F59158]];
    v336 = v103;
    if (v103)
    {
      int v104 = [v103 BOOLValue];
      uint64_t v105 = 8;
      if (!v104) {
        uint64_t v105 = 0;
      }
    }
    else
    {
      uint64_t v105 = 8;
    }
    [v12 setIntraSectionFilteringOptions:v105 | v84];
    v106 = [v4 objectForKeyedSubscript:*MEMORY[0x263F59160]];
    v107 = v106;
    if (v106)
    {
      if ([v106 BOOLValue]) {
        uint64_t v108 = 4;
      }
      else {
        uint64_t v108 = 0;
      }
      [v12 setInterSectionFilteringOptions:v108];
    }
    else
    {
      v109 = &_os_log_internal;
      id v110 = &_os_log_internal;
      if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR)) {
        +[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]8((void *)[[NSString alloc] initWithFormat:@"section config requires a policy around whether to filter duplicate clusters across sections for the section it describes"], v396);
      }

      v107 = 0;
    }
    v320 = v107;
    if (v107) {
      BOOL v111 = *((unsigned char *)v375 + 24) == 0;
    }
    else {
      BOOL v111 = 1;
    }
    char v112 = !v111;
    *((unsigned char *)v375 + 24) = v112;
    v113 = [v4 objectForKeyedSubscript:*MEMORY[0x263F59288]];
    v114 = v113;
    if (v113)
    {
      objc_msgSend(v12, "setShownInFavoritesOnlyMode:", objc_msgSend(v113, "BOOLValue"));
    }
    else
    {
      v115 = &_os_log_internal;
      id v116 = &_os_log_internal;
      if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR)) {
        +[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]7((void *)[[NSString alloc] initWithFormat:@"section config requires a policy around whether to shown the section it describes in Favorites-only mode"], v395);
      }

      v114 = 0;
    }
    v319 = v114;
    if (v114) {
      BOOL v117 = *((unsigned char *)v375 + 24) == 0;
    }
    else {
      BOOL v117 = 1;
    }
    char v118 = !v117;
    *((unsigned char *)v375 + 24) = v118;
    uint64_t v119 = [v4 objectForKeyedSubscript:*MEMORY[0x263F591F0]];
    [v12 setPersonalizationFeatureID:v119];
    if (!v119)
    {
      v120 = &_os_log_internal;
      id v121 = &_os_log_internal;
      if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR)) {
        +[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]6((void *)[[NSString alloc] initWithFormat:@"section config requires a personalization feature ID"], v394);
      }

      uint64_t v119 = 0;
    }
    v334 = (void *)v119;
    if (v119) {
      BOOL v122 = *((unsigned char *)v375 + 24) == 0;
    }
    else {
      BOOL v122 = 1;
    }
    char v123 = !v122;
    *((unsigned char *)v375 + 24) = v123;
    uint64_t v124 = [v4 objectForKeyedSubscript:*MEMORY[0x263F59218]];
    v125 = (void *)v124;
    if (v124) {
      v126 = (void *)v124;
    }
    else {
      v126 = &unk_26D9225B8;
    }
    id v335 = v126;

    objc_msgSend(v12, "setPersonalizedPresenceFeatureImpressionPrior:", objc_msgSend(v335, "unsignedIntegerValue"));
    uint64_t v127 = [v4 objectForKeyedSubscript:*MEMORY[0x263F59208]];
    v128 = (void *)v127;
    if (v127) {
      v129 = (void *)v127;
    }
    else {
      v129 = &unk_26D9225B8;
    }
    id v333 = v129;

    objc_msgSend(v12, "setPersonalizedPresenceFeatureClickPrior:", objc_msgSend(v333, "unsignedIntegerValue"));
    uint64_t v130 = [v4 objectForKeyedSubscript:*MEMORY[0x263F59210]];
    v131 = (void *)v130;
    if (v130) {
      v132 = (void *)v130;
    }
    else {
      v132 = v334;
    }
    [v12 setPersonalizedPresenceFeatureID:v132];

    v318 = [v4 objectForKeyedSubscript:*MEMORY[0x263F59240]];
    uint64_t v133 = [v318 BOOLValue];
    [v12 setPresenceDeterminedByPersonalization:v133];
    v317 = [v4 objectForKeyedSubscript:*MEMORY[0x263F59178]];
    objc_msgSend(v12, "setFilterNonSubscribedInFavoritesOnlyMode:", objc_msgSend(v317, "BOOLValue"));
    if (v133)
    {
      uint64_t v134 = [v4 objectForKeyedSubscript:*MEMORY[0x263F59220]];
      v135 = (void *)v134;
      v136 = &unk_26D9224F8;
      if (v134) {
        v136 = (void *)v134;
      }
      id v137 = v136;

      uint64_t v138 = [v137 intValue];
      if (v138 < 2)
      {
        v139 = objc_opt_new();
        [v139 setPersonalizationMethod:v138];
        if (v138)
        {
          v140 = objc_opt_new();
          v141 = [v4 objectForKeyedSubscript:*MEMORY[0x263F59230]];
          v142 = v141;
          if (v141)
          {
            [v141 doubleValue];
            objc_msgSend(v140, "setScalar:");
          }
          else
          {
            v144 = &_os_log_internal;
            id v145 = &_os_log_internal;
            if (os_log_type_enabled(v144, OS_LOG_TYPE_ERROR)) {
              +[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]5((void *)[[NSString alloc] initWithFormat:@"section config needs a scalar whenever the section's presence is determined by Personalization"], v393);
            }
          }
          if (v142) {
            BOOL v146 = *((unsigned char *)v375 + 24) == 0;
          }
          else {
            BOOL v146 = 1;
          }
          char v147 = !v146;
          *((unsigned char *)v375 + 24) = v147;
          [v139 setRelativeConfig:v140];
        }
        else
        {
          v140 = objc_opt_new();
          v143 = [v4 objectForKeyedSubscript:*MEMORY[0x263F59200]];
          v142 = v143;
          if (v143)
          {
            [v143 doubleValue];
            objc_msgSend(v140, "setCTRToShow:");
          }
          else
          {
            v148 = &_os_log_internal;
            id v149 = &_os_log_internal;
            if (os_log_type_enabled(v148, OS_LOG_TYPE_ERROR)) {
              +[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]4((void *)[[NSString alloc] initWithFormat:@"section config needs a CTR to show whenever the section's presence is determined by Personalization"], v393);
            }
          }
          if (v142) {
            BOOL v150 = *((unsigned char *)v375 + 24) == 0;
          }
          else {
            BOOL v150 = 1;
          }
          char v151 = !v150;
          *((unsigned char *)v375 + 24) = v151;
          v152 = [v4 objectForKeyedSubscript:*MEMORY[0x263F591F8]];
          v153 = v152;
          if (v152)
          {
            [v152 doubleValue];
            objc_msgSend(v140, "setCTRToHide:");
          }
          else
          {
            v154 = &_os_log_internal;
            id v155 = &_os_log_internal;
            if (os_log_type_enabled(v154, OS_LOG_TYPE_ERROR)) {
              +[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]3((void *)[[NSString alloc] initWithFormat:@"section config needs a CTR to hide whenever the section's presence is determined by Personalization"], v392);
            }

            v153 = 0;
          }
          v331 = v153;
          if (v153) {
            BOOL v156 = *((unsigned char *)v375 + 24) == 0;
          }
          else {
            BOOL v156 = 1;
          }
          char v157 = !v156;
          *((unsigned char *)v375 + 24) = v157;
          v158 = [v4 objectForKeyedSubscript:*MEMORY[0x263F59228]];
          v159 = v158;
          if (v158)
          {
            [v158 doubleValue];
            objc_msgSend(v140, "setMinProbabilityToShow:");
          }
          else
          {
            v160 = &_os_log_internal;
            id v161 = &_os_log_internal;
            if (os_log_type_enabled(v160, OS_LOG_TYPE_ERROR)) {
              +[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]2((void *)[[NSString alloc] initWithFormat:@"section config needs a minimum probability to show whenever the section's presence is determined by Personalization"], v391);
            }
          }
          if (v159) {
            BOOL v162 = *((unsigned char *)v375 + 24) == 0;
          }
          else {
            BOOL v162 = 1;
          }
          char v163 = !v162;
          *((unsigned char *)v375 + 24) = v163;
          v164 = [v4 objectForKeyedSubscript:*MEMORY[0x263F59238]];
          v165 = v164;
          if (v164)
          {
            objc_msgSend(v140, "setSectionEdition:", objc_msgSend(v164, "unsignedIntegerValue"));
          }
          else
          {
            id v166 = &_os_log_internal;
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              +[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]1((void *)[[NSString alloc] initWithFormat:@"section config needs a section edition whenever the section's presence is determined by Personalization"], v390);
            }
          }
          if (v165) {
            BOOL v167 = *((unsigned char *)v375 + 24) == 0;
          }
          else {
            BOOL v167 = 1;
          }
          char v168 = !v167;
          *((unsigned char *)v375 + 24) = v168;
          [v139 setAbsoluteConfig:v140];
        }
        [v12 setPersonalizedPresenceConfig:v139];
      }
    }
    [v4 objectForKeyedSubscript:*MEMORY[0x263F59250]];
    long long v372 = 0u;
    long long v373 = 0u;
    long long v370 = 0u;
    long long v371 = 0u;
    id v169 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v170 = [v169 countByEnumeratingWithState:&v370 objects:v389 count:16];
    if (v170)
    {
      uint64_t v171 = *(void *)v371;
      do
      {
        for (uint64_t i = 0; i != v170; ++i)
        {
          if (*(void *)v371 != v171) {
            objc_enumerationMutation(v169);
          }
          objc_msgSend(v12, "addQueueMembership:", objc_msgSend(*(id *)(*((void *)&v370 + 1) + 8 * i), "unsignedIntegerValue"));
        }
        uint64_t v170 = [v169 countByEnumeratingWithState:&v370 objects:v389 count:16];
      }
      while (v170);
    }

    uint64_t v173 = [v169 count];
    if (!v173)
    {
      v174 = &_os_log_internal;
      id v175 = &_os_log_internal;
      if (os_log_type_enabled(v174, OS_LOG_TYPE_ERROR)) {
        +[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]0((void *)[[NSString alloc] initWithFormat:@"section config requires queue memberships"], v388);
      }
    }
    if (v173) {
      BOOL v176 = *((unsigned char *)v375 + 24) == 0;
    }
    else {
      BOOL v176 = 1;
    }
    char v177 = !v176;
    *((unsigned char *)v375 + 24) = v177;
    v178 = [v4 objectForKeyedSubscript:*MEMORY[0x263F59188]];
    v179 = v178;
    if (v178)
    {
      objc_msgSend(v12, "setGlanceable:", objc_msgSend(v178, "BOOLValue"));
    }
    else
    {
      v180 = &_os_log_internal;
      id v181 = &_os_log_internal;
      if (os_log_type_enabled(v180, OS_LOG_TYPE_ERROR)) {
        +[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]9((void *)[[NSString alloc] initWithFormat:@"section config requires glanceability"], v387);
      }
    }
    if (v179) {
      BOOL v182 = *((unsigned char *)v375 + 24) == 0;
    }
    else {
      BOOL v182 = 1;
    }
    char v183 = !v182;
    *((unsigned char *)v375 + 24) = v183;
    v184 = [v4 objectForKeyedSubscript:*MEMORY[0x263F59190]];
    [v12 setGroupActionTitle:v184];

    v185 = [v4 objectForKeyedSubscript:*MEMORY[0x263F59198]];
    [v12 setGroupActionUrl:v185];

    v186 = [v4 objectForKeyedSubscript:*MEMORY[0x263F591A8]];
    [v12 setGroupNameActionUrl:v186];

    v187 = [v4 objectForKeyedSubscript:*MEMORY[0x263F59138]];
    [v12 setBackgroundColorLight:v187];

    v188 = [v4 objectForKeyedSubscript:*MEMORY[0x263F59130]];
    [v12 setBackgroundColorDark:v188];

    uint64_t v189 = [v4 objectForKeyedSubscript:*MEMORY[0x263F591A0]];
    v190 = (void *)v189;
    v191 = (void *)MEMORY[0x263EFFA68];
    if (v189) {
      v191 = (void *)v189;
    }
    id v332 = v191;

    v192 = objc_opt_new();
    v367[0] = MEMORY[0x263EF8330];
    v367[1] = 3221225472;
    v367[2] = __71__NTPBTodaySectionConfig_FCAdditions__sectionConfigWithJSONDictionary___block_invoke;
    v367[3] = &unk_26475C4B0;
    id v327 = v192;
    id v368 = v327;
    v369 = &v374;
    [v332 enumerateObjectsUsingBlock:v367];
    uint64_t v193 = [v4 objectForKeyedSubscript:*MEMORY[0x263F59248]];
    v194 = (void *)v193;
    v195 = &unk_26D9224F8;
    if (v193) {
      v195 = (void *)v193;
    }
    id v330 = v195;

    objc_msgSend(v12, "setPromotionCriterion:", objc_msgSend(v330, "intValue"));
    v196 = [v4 objectForKeyedSubscript:*MEMORY[0x263F591C8]];
    [v12 setMutingTagID:v196];

    if (v39 <= 6)
    {
      v315 = v179;
      switch(v40)
      {
        case 1:
          v197 = objc_opt_new();
          v199 = [v4 objectForKeyedSubscript:*MEMORY[0x263F590B8]];
          v200 = v199;
          if (v199)
          {
            objc_msgSend(v197, "setCutoffTime:", objc_msgSend(v199, "integerValue"));
          }
          else
          {
            v228 = &_os_log_internal;
            id v229 = &_os_log_internal;
            if (os_log_type_enabled(v228, OS_LOG_TYPE_ERROR)) {
              +[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:].cold.5((void *)[[NSString alloc] initWithFormat:@"For You section config requires cutoff time"], v386);
            }

            v200 = 0;
          }
          v316 = v200;
          if (v200) {
            BOOL v230 = *((unsigned char *)v375 + 24) == 0;
          }
          else {
            BOOL v230 = 1;
          }
          char v231 = !v230;
          *((unsigned char *)v375 + 24) = v231;
          v314 = [v4 objectForKeyedSubscript:*MEMORY[0x263F590E0]];
          if (v314) {
            objc_msgSend(v197, "setMinimumUpdateInterval:", objc_msgSend(v314, "integerValue"));
          }
          v232 = [v4 objectForKeyedSubscript:*MEMORY[0x263F590C0]];
          v313 = v232;
          if (v232)
          {
            objc_msgSend(v197, "setFetchingBin:", objc_msgSend(v232, "intValue"));
          }
          else
          {
            v268 = &_os_log_internal;
            id v269 = &_os_log_internal;
            if (os_log_type_enabled(v268, OS_LOG_TYPE_ERROR)) {
              +[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:].cold.4((void *)[[NSString alloc] initWithFormat:@"For You section config requires fetching bin"], v385);
            }
          }
          v270 = [v4 objectForKeyedSubscript:*MEMORY[0x263F590E8]];
          v271 = v270;
          if (v270)
          {
            objc_msgSend(v197, "setSubscriptionsFetchCount:", objc_msgSend(v270, "unsignedIntegerValue"));
          }
          else
          {
            v277 = &_os_log_internal;
            id v278 = &_os_log_internal;
            if (os_log_type_enabled(v277, OS_LOG_TYPE_ERROR)) {
              +[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]((void *)[[NSString alloc] initWithFormat:@"For You section config requires subscriptions fetch count"], v384);
            }
          }
          if (v271) {
            BOOL v279 = *((unsigned char *)v375 + 24) == 0;
          }
          else {
            BOOL v279 = 1;
          }
          char v280 = !v279;
          *((unsigned char *)v375 + 24) = v280;
          v281 = [v4 objectForKeyedSubscript:*MEMORY[0x263F590C8]];
          v282 = v281;
          if (v281)
          {
            objc_msgSend(v197, "setHeadlinesPerFeedFetchCount:", objc_msgSend(v281, "unsignedIntegerValue"));
          }
          else
          {
            v288 = &_os_log_internal;
            id v289 = &_os_log_internal;
            if (os_log_type_enabled(v288, OS_LOG_TYPE_ERROR)) {
              +[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]((void *)[[NSString alloc] initWithFormat:@"For You section config requires headlines per feed fetch count"], v383);
            }
          }
          if (v282) {
            BOOL v290 = *((unsigned char *)v375 + 24) == 0;
          }
          else {
            BOOL v290 = 1;
          }
          char v291 = !v290;
          *((unsigned char *)v375 + 24) = v291;
          uint64_t v292 = [v4 objectForKeyedSubscript:*MEMORY[0x263F590D8]];
          if (v292) {
            v293 = (void *)v292;
          }
          else {
            v293 = &unk_26D922510;
          }
          objc_msgSend(v197, "setFeedMaxCount:", objc_msgSend(v293, "unsignedIntegerValue"));
          uint64_t v294 = [v4 objectForKeyedSubscript:*MEMORY[0x263F590D0]];
          v295 = (void *)v294;
          v296 = &unk_26D922528;
          if (v294) {
            v296 = (void *)v294;
          }
          id v297 = v296;

          objc_msgSend(v197, "setLocalNewsPromotionIndex:", objc_msgSend(v297, "unsignedIntegerValue"));
          [v12 setForYouTodaySectionConfig:v197];

          v179 = v315;
          goto LABEL_510;
        case 2:
          break;
        case 3:
          v197 = objc_opt_new();
          v201 = [v4 objectForKeyedSubscript:*MEMORY[0x263F59058]];
          if (!v201)
          {
            v202 = &_os_log_internal;
            id v203 = &_os_log_internal;
            if (os_log_type_enabled(v202, OS_LOG_TYPE_ERROR)) {
              +[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]1((void *)[[NSString alloc] initWithFormat:@"articleIDs section config requires articles"], v386);
            }

            v201 = 0;
          }
          if (v201) {
            BOOL v204 = *((unsigned char *)v375 + 24) == 0;
          }
          else {
            BOOL v204 = 1;
          }
          char v205 = !v204;
          *((unsigned char *)v375 + 24) = v205;
          LOBYTE(v384[0]) = 0;
          v316 = v201;
          v206 = NTPBTodaySectionConfigGenerateArticles(v201, v384);
          if (LOBYTE(v384[0]))
          {
            BOOL v207 = 1;
          }
          else
          {
            v241 = &_os_log_internal;
            id v242 = &_os_log_internal;
            if (os_log_type_enabled(v241, OS_LOG_TYPE_ERROR)) {
              +[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]0((void *)[[NSString alloc] initWithFormat:@"articleIDs section config requires valid articles"], v385);
            }

            BOOL v207 = LOBYTE(v384[0]) != 0;
          }
          if (!*((unsigned char *)v375 + 24)) {
            BOOL v207 = 0;
          }
          *((unsigned char *)v375 + 24) = v207;
          long long v365 = 0u;
          long long v366 = 0u;
          long long v363 = 0u;
          long long v364 = 0u;
          id v243 = v206;
          uint64_t v244 = [v243 countByEnumeratingWithState:&v363 objects:v382 count:16];
          if (v244)
          {
            uint64_t v245 = *(void *)v364;
            do
            {
              for (uint64_t j = 0; j != v244; ++j)
              {
                if (*(void *)v364 != v245) {
                  objc_enumerationMutation(v243);
                }
                [v197 addArticles:*(void *)(*((void *)&v363 + 1) + 8 * j)];
              }
              uint64_t v244 = [v243 countByEnumeratingWithState:&v363 objects:v382 count:16];
            }
            while (v244);
          }

          v179 = v315;
          [v12 setArticleIDsTodaySectionConfig:v197];

          goto LABEL_510;
        case 4:
          v197 = objc_opt_new();
          v208 = [v4 objectForKeyedSubscript:*MEMORY[0x263F59110]];
          if (!v208)
          {
            v209 = &_os_log_internal;
            id v210 = &_os_log_internal;
            if (os_log_type_enabled(v209, OS_LOG_TYPE_ERROR)) {
              +[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]6((void *)[[NSString alloc] initWithFormat:@"personalized section config requires mandatory articles"], v386);
            }

            v208 = 0;
          }
          if (v208) {
            BOOL v211 = *((unsigned char *)v375 + 24) == 0;
          }
          else {
            BOOL v211 = 1;
          }
          char v212 = !v211;
          *((unsigned char *)v375 + 24) = v212;
          unsigned __int8 v362 = 0;
          v316 = v208;
          v213 = NTPBTodaySectionConfigGenerateArticles(v208, &v362);
          if (v362)
          {
            int v214 = 1;
          }
          else
          {
            v247 = &_os_log_internal;
            id v248 = &_os_log_internal;
            if (os_log_type_enabled(v247, OS_LOG_TYPE_ERROR)) {
              +[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]5((void *)[[NSString alloc] initWithFormat:@"personalized section config requires valid mandatory articles"], v385);
            }

            int v214 = v362;
          }
          if (*((unsigned char *)v375 + 24)) {
            BOOL v249 = v214 == 0;
          }
          else {
            BOOL v249 = 1;
          }
          char v250 = !v249;
          *((unsigned char *)v375 + 24) = v250;
          long long v360 = 0u;
          long long v361 = 0u;
          long long v358 = 0u;
          long long v359 = 0u;
          id v251 = v213;
          uint64_t v252 = [v251 countByEnumeratingWithState:&v358 objects:v381 count:16];
          if (v252)
          {
            uint64_t v253 = *(void *)v359;
            do
            {
              for (uint64_t k = 0; k != v252; ++k)
              {
                if (*(void *)v359 != v253) {
                  objc_enumerationMutation(v251);
                }
                [v197 addMandatoryArticles:*(void *)(*((void *)&v358 + 1) + 8 * k)];
              }
              uint64_t v252 = [v251 countByEnumeratingWithState:&v358 objects:v381 count:16];
            }
            while (v252);
          }

          v255 = [v4 objectForKeyedSubscript:*MEMORY[0x263F59120]];
          if (!v255)
          {
            v256 = &_os_log_internal;
            id v257 = &_os_log_internal;
            if (os_log_type_enabled(v256, OS_LOG_TYPE_ERROR)) {
              +[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]4((void *)[[NSString alloc] initWithFormat:@"personalized section config requires personalized articles"], v384);
            }
          }
          if (v255) {
            BOOL v258 = *((unsigned char *)v375 + 24) == 0;
          }
          else {
            BOOL v258 = 1;
          }
          char v259 = !v258;
          *((unsigned char *)v375 + 24) = v259;
          char v357 = 0;
          v260 = NTPBTodaySectionConfigGenerateArticles(v255, &v357);
          if (v357)
          {
            BOOL v261 = 1;
          }
          else
          {
            v298 = &_os_log_internal;
            id v299 = &_os_log_internal;
            if (os_log_type_enabled(v298, OS_LOG_TYPE_ERROR)) {
              +[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]3((void *)[[NSString alloc] initWithFormat:@"personalized section config requires valid personalized articles"], v383);
            }

            BOOL v261 = v357 != 0;
          }
          if (!*((unsigned char *)v375 + 24)) {
            BOOL v261 = 0;
          }
          *((unsigned char *)v375 + 24) = v261;
          long long v355 = 0u;
          long long v356 = 0u;
          long long v353 = 0u;
          long long v354 = 0u;
          id v300 = v260;
          uint64_t v301 = [v300 countByEnumeratingWithState:&v353 objects:v380 count:16];
          if (v301)
          {
            uint64_t v302 = *(void *)v354;
            do
            {
              for (uint64_t m = 0; m != v301; ++m)
              {
                if (*(void *)v354 != v302) {
                  objc_enumerationMutation(v300);
                }
                [v197 addPersonalizedArticles:*(void *)(*((void *)&v353 + 1) + 8 * m)];
              }
              uint64_t v301 = [v300 countByEnumeratingWithState:&v353 objects:v380 count:16];
            }
            while (v301);
          }

          v179 = v315;
          v304 = [v4 objectForKeyedSubscript:*MEMORY[0x263F59118]];
          v305 = v304;
          if (v304)
          {
            objc_msgSend(v197, "setMaxArticlesShown:", objc_msgSend(v304, "unsignedIntegerValue"));
          }
          else
          {
            v306 = &_os_log_internal;
            id v307 = &_os_log_internal;
            v308 = v306;
            v179 = v315;
            if (os_log_type_enabled(v308, OS_LOG_TYPE_ERROR)) {
              +[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]2((void *)[[NSString alloc] initWithFormat:@"personalized section config requires max articles shown"], v379);
            }
          }
          if (v305) {
            BOOL v309 = *((unsigned char *)v375 + 24) == 0;
          }
          else {
            BOOL v309 = 1;
          }
          char v310 = !v309;
          *((unsigned char *)v375 + 24) = v310;
          [v12 setPersonalizedTodaySectionConfig:v197];

          goto LABEL_510;
        case 5:
          v197 = objc_opt_new();
          v215 = [v4 objectForKeyedSubscript:*MEMORY[0x263F59108]];
          if (!v215)
          {
            v216 = &_os_log_internal;
            id v217 = &_os_log_internal;
            if (os_log_type_enabled(v216, OS_LOG_TYPE_ERROR)) {
              +[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]8((void *)[[NSString alloc] initWithFormat:@"items section config requires items"], v386);
            }

            v215 = 0;
          }
          if (v215) {
            BOOL v218 = *((unsigned char *)v375 + 24) == 0;
          }
          else {
            BOOL v218 = 1;
          }
          char v219 = !v218;
          *((unsigned char *)v375 + 24) = v219;
          LOBYTE(v384[0]) = 0;
          v316 = v215;
          v220 = NTPBTodaySectionConfigGenerateItems(v215, v327, v384);
          if (LOBYTE(v384[0]))
          {
            BOOL v221 = 1;
          }
          else
          {
            v262 = &_os_log_internal;
            id v263 = &_os_log_internal;
            if (os_log_type_enabled(v262, OS_LOG_TYPE_ERROR)) {
              +[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]7((void *)[[NSString alloc] initWithFormat:@"items section config requires valid items"], v385);
            }

            BOOL v221 = LOBYTE(v384[0]) != 0;
          }
          if (!*((unsigned char *)v375 + 24)) {
            BOOL v221 = 0;
          }
          *((unsigned char *)v375 + 24) = v221;
          long long v351 = 0u;
          long long v352 = 0u;
          long long v349 = 0u;
          long long v350 = 0u;
          id v264 = v220;
          uint64_t v265 = [v264 countByEnumeratingWithState:&v349 objects:v378 count:16];
          if (v265)
          {
            uint64_t v266 = *(void *)v350;
            do
            {
              for (uint64_t n = 0; n != v265; ++n)
              {
                if (*(void *)v350 != v266) {
                  objc_enumerationMutation(v264);
                }
                [v197 addItems:*(void *)(*((void *)&v349 + 1) + 8 * n)];
              }
              uint64_t v265 = [v264 countByEnumeratingWithState:&v349 objects:v378 count:16];
            }
            while (v265);
          }

          v179 = v315;
          [v12 setItemsTodaySectionConfig:v197];

          goto LABEL_510;
        case 6:
          v197 = objc_opt_new();
          v222 = [v4 objectForKeyedSubscript:*MEMORY[0x263F590B8]];
          v223 = v222;
          if (v222)
          {
            objc_msgSend(v197, "setCutoffTime:", objc_msgSend(v222, "integerValue"));
          }
          else
          {
            v233 = &_os_log_internal;
            id v234 = &_os_log_internal;
            if (os_log_type_enabled(v233, OS_LOG_TYPE_ERROR)) {
              +[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:].cold.8((void *)[[NSString alloc] initWithFormat:@"Tag section config requires cutoff time"], v386);
            }

            v223 = 0;
          }
          v316 = v223;
          if (v223) {
            BOOL v235 = *((unsigned char *)v375 + 24) == 0;
          }
          else {
            BOOL v235 = 1;
          }
          char v236 = !v235;
          *((unsigned char *)v375 + 24) = v236;
          v237 = [v4 objectForKeyedSubscript:*MEMORY[0x263F590E0]];
          v238 = v237;
          if (v237) {
            objc_msgSend(v197, "setMinimumUpdateInterval:", objc_msgSend(v237, "integerValue"));
          }
          v239 = [v4 objectForKeyedSubscript:*MEMORY[0x263F590C0]];
          v240 = v239;
          if (v239)
          {
            objc_msgSend(v197, "setFetchingBin:", objc_msgSend(v239, "intValue"));
          }
          else
          {
            v272 = &_os_log_internal;
            id v273 = &_os_log_internal;
            v274 = v272;
            v179 = v315;
            if (os_log_type_enabled(v274, OS_LOG_TYPE_ERROR)) {
              +[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:].cold.7((void *)[[NSString alloc] initWithFormat:@"Tag section config requires fetching bin"], v385);
            }
          }
          v275 = [v4 objectForKeyedSubscript:*MEMORY[0x263F590C8]];
          v276 = v275;
          if (v275)
          {
            objc_msgSend(v197, "setHeadlinesPerFeedFetchCount:", objc_msgSend(v275, "unsignedIntegerValue"));
          }
          else
          {
            v283 = &_os_log_internal;
            id v284 = &_os_log_internal;
            v285 = v283;
            v179 = v315;
            if (os_log_type_enabled(v285, OS_LOG_TYPE_ERROR)) {
              +[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:].cold.6((void *)[[NSString alloc] initWithFormat:@"Tag section config requires headlines per feed fetch count"], v384);
            }
          }
          if (v276) {
            BOOL v286 = *((unsigned char *)v375 + 24) == 0;
          }
          else {
            BOOL v286 = 1;
          }
          char v287 = !v286;
          *((unsigned char *)v375 + 24) = v287;
          [v12 setTagTodaySectionConfig:v197];

          goto LABEL_510;
        default:
          v197 = objc_opt_new();
          uint64_t v198 = [v4 objectForKeyedSubscript:*MEMORY[0x263F59070]];
          if (v198)
          {
            [v197 setArticleListID:v198];
          }
          else
          {
            v224 = &_os_log_internal;
            id v225 = &_os_log_internal;
            if (os_log_type_enabled(v224, OS_LOG_TYPE_ERROR)) {
              +[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:].cold.9((void *)[[NSString alloc] initWithFormat:@"article list section config requires an articleList ID"], v386);
            }

            uint64_t v198 = 0;
          }
          v316 = (void *)v198;
          if (v198) {
            BOOL v226 = *((unsigned char *)v375 + 24) == 0;
          }
          else {
            BOOL v226 = 1;
          }
          char v227 = !v226;
          *((unsigned char *)v375 + 24) = v227;
          [v12 setArticleListTodaySectionConfig:v197];
LABEL_510:

          break;
      }
    }
    if (*((unsigned char *)v375 + 24)) {
      id v46 = v12;
    }
    else {
      id v46 = 0;
    }

    _Block_object_dispose(&v374, 8);
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]();
    }
    id v46 = 0;
  }
  id v311 = v46;

  return v311;
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"JSONDictionary", v6, 2u);
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.2(void *a1, _DWORD *a2)
{
  id v3 = a1;
  *a2 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_1((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_0_1(v4, 623);
  OUTLINED_FUNCTION_1_1(&dword_22592C000, &_os_log_internal, v5, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.3(void *a1, _DWORD *a2)
{
  id v3 = a1;
  *a2 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_1((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_0_1(v4, 614);
  OUTLINED_FUNCTION_1_1(&dword_22592C000, &_os_log_internal, v5, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.4(void *a1, _DWORD *a2)
{
  id v3 = a1;
  *a2 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_1((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_0_1(v4, 606);
  OUTLINED_FUNCTION_1_1(&dword_22592C000, &_os_log_internal, v5, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.5(void *a1, _DWORD *a2)
{
  id v3 = a1;
  *a2 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_1((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_0_1(v4, 591);
  OUTLINED_FUNCTION_1_1(&dword_22592C000, &_os_log_internal, v5, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.6(void *a1, _DWORD *a2)
{
  id v3 = a1;
  *a2 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_1((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_0_1(v4, 672);
  OUTLINED_FUNCTION_1_1(&dword_22592C000, &_os_log_internal, v5, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.7(void *a1, _DWORD *a2)
{
  id v3 = a1;
  *a2 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_1((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_0_1(v4, 664);
  OUTLINED_FUNCTION_1_1(&dword_22592C000, &_os_log_internal, v5, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.8(void *a1, _DWORD *a2)
{
  id v3 = a1;
  *a2 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_1((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_0_1(v4, 649);
  OUTLINED_FUNCTION_1_1(&dword_22592C000, &_os_log_internal, v5, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.9(void *a1, _DWORD *a2)
{
  id v3 = a1;
  *a2 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_1((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_0_1(v4, 689);
  OUTLINED_FUNCTION_1_1(&dword_22592C000, &_os_log_internal, v5, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.10(void *a1, _DWORD *a2)
{
  id v3 = a1;
  *a2 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_1((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_0_1(v4, 706);
  OUTLINED_FUNCTION_1_1(&dword_22592C000, &_os_log_internal, v5, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.11(void *a1, _DWORD *a2)
{
  id v3 = a1;
  *a2 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_1((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_0_1(v4, 701);
  OUTLINED_FUNCTION_1_1(&dword_22592C000, &_os_log_internal, v5, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.12(void *a1, _DWORD *a2)
{
  id v3 = a1;
  *a2 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_1((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_0_1(v4, 755);
  OUTLINED_FUNCTION_1_1(&dword_22592C000, &_os_log_internal, v5, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.13(void *a1, _DWORD *a2)
{
  id v3 = a1;
  *a2 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_1((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_0_1(v4, 742);
  OUTLINED_FUNCTION_1_1(&dword_22592C000, &_os_log_internal, v5, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.14(void *a1, _DWORD *a2)
{
  id v3 = a1;
  *a2 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_1((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_0_1(v4, 737);
  OUTLINED_FUNCTION_1_1(&dword_22592C000, &_os_log_internal, v5, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.15(void *a1, _DWORD *a2)
{
  id v3 = a1;
  *a2 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_1((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_0_1(v4, 728);
  OUTLINED_FUNCTION_1_1(&dword_22592C000, &_os_log_internal, v5, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.16(void *a1, _DWORD *a2)
{
  id v3 = a1;
  *a2 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_1((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_0_1(v4, 723);
  OUTLINED_FUNCTION_1_1(&dword_22592C000, &_os_log_internal, v5, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.17(void *a1, _DWORD *a2)
{
  id v3 = a1;
  *a2 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_1((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_0_1(v4, 773);
  OUTLINED_FUNCTION_1_1(&dword_22592C000, &_os_log_internal, v5, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.18(void *a1, _DWORD *a2)
{
  id v3 = a1;
  *a2 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_1((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_0_1(v4, 768);
  OUTLINED_FUNCTION_1_1(&dword_22592C000, &_os_log_internal, v5, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.19(void *a1, _DWORD *a2)
{
  id v3 = a1;
  *a2 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_1((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_0_1(v4, 534);
  OUTLINED_FUNCTION_1_1(&dword_22592C000, &_os_log_internal, v5, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.20(void *a1, _DWORD *a2)
{
  id v3 = a1;
  *a2 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_1((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_0_1(v4, 525);
  OUTLINED_FUNCTION_1_1(&dword_22592C000, &_os_log_internal, v5, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.21(void *a1, _DWORD *a2)
{
  id v3 = a1;
  *a2 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_1((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_0_1(v4, 491);
  OUTLINED_FUNCTION_1_1(&dword_22592C000, &_os_log_internal, v5, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.22(void *a1, _DWORD *a2)
{
  id v3 = a1;
  *a2 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_1((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_0_1(v4, 482);
  OUTLINED_FUNCTION_1_1(&dword_22592C000, &_os_log_internal, v5, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.23(void *a1, _DWORD *a2)
{
  id v3 = a1;
  *a2 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_1((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_0_1(v4, 473);
  OUTLINED_FUNCTION_1_1(&dword_22592C000, &_os_log_internal, v5, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.24(void *a1, _DWORD *a2)
{
  id v3 = a1;
  *a2 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_1((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_0_1(v4, 464);
  OUTLINED_FUNCTION_1_1(&dword_22592C000, &_os_log_internal, v5, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.25(void *a1, _DWORD *a2)
{
  id v3 = a1;
  *a2 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_1((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_0_1(v4, 507);
  OUTLINED_FUNCTION_1_1(&dword_22592C000, &_os_log_internal, v5, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.26(void *a1, _DWORD *a2)
{
  id v3 = a1;
  *a2 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_1((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_0_1(v4, 409);
  OUTLINED_FUNCTION_1_1(&dword_22592C000, &_os_log_internal, v5, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.27(void *a1, _DWORD *a2)
{
  id v3 = a1;
  *a2 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_1((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_0_1(v4, 403);
  OUTLINED_FUNCTION_1_1(&dword_22592C000, &_os_log_internal, v5, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.28(void *a1, _DWORD *a2)
{
  id v3 = a1;
  *a2 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_1((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_0_1(v4, 394);
  OUTLINED_FUNCTION_1_1(&dword_22592C000, &_os_log_internal, v5, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.29(void *a1, _DWORD *a2)
{
  id v3 = a1;
  *a2 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_1((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_0_1(v4, 364);
  OUTLINED_FUNCTION_1_1(&dword_22592C000, &_os_log_internal, v5, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.30(void *a1, _DWORD *a2)
{
  id v3 = a1;
  *a2 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_1((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_0_1(v4, 355);
  OUTLINED_FUNCTION_1_1(&dword_22592C000, &_os_log_internal, v5, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.31(void *a1, _DWORD *a2)
{
  id v3 = a1;
  *a2 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_1((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_0_1(v4, 343);
  OUTLINED_FUNCTION_1_1(&dword_22592C000, &_os_log_internal, v5, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.32(void *a1, _DWORD *a2)
{
  id v3 = a1;
  *a2 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_1((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_0_1(v4, 332);
  OUTLINED_FUNCTION_1_1(&dword_22592C000, &_os_log_internal, v5, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.33(void *a1, _DWORD *a2)
{
  id v3 = a1;
  *a2 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_1((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_0_1(v4, 308);
  OUTLINED_FUNCTION_1_1(&dword_22592C000, &_os_log_internal, v5, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.34(void *a1, _DWORD *a2)
{
  id v3 = a1;
  *a2 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_1((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_0_1(v4, 261);
  OUTLINED_FUNCTION_1_1(&dword_22592C000, &_os_log_internal, v5, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.35(void *a1, _DWORD *a2)
{
  id v3 = a1;
  *a2 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_1((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_0_1(v4, 252);
  OUTLINED_FUNCTION_1_1(&dword_22592C000, &_os_log_internal, v5, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.36(void *a1, _DWORD *a2)
{
  id v3 = a1;
  *a2 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_1((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_0_1(v4, 200);
  OUTLINED_FUNCTION_1_1(&dword_22592C000, &_os_log_internal, v5, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.37(void *a1, _DWORD *a2)
{
  id v3 = a1;
  *a2 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_1((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_0_1(v4, 192);
  OUTLINED_FUNCTION_1_1(&dword_22592C000, &_os_log_internal, v5, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");
}

+ (void)sectionConfigWithJSONDictionary:()FCAdditions .cold.38(void *a1, _DWORD *a2)
{
  id v3 = a1;
  *a2 = 136315906;
  OUTLINED_FUNCTION_3_1((uint64_t)"+[NTPBTodaySectionConfig(FCAdditions) sectionConfigWithJSONDictionary:]");
  OUTLINED_FUNCTION_2_1((uint64_t)"NTPBTodaySectionConfig+NTAdditions.m");
  OUTLINED_FUNCTION_0_1(v4, 174);
  OUTLINED_FUNCTION_1_1(&dword_22592C000, &_os_log_internal, v5, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@");
}

@end