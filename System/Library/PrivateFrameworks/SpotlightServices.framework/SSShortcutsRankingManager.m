@interface SSShortcutsRankingManager
+ (id)moveShortcutsToRelatedAppSectionsForAllSections:(id)a3 isAsYouTypeTopHitSearch:(BOOL)a4 sectionBuilderBlock:(id)a5;
@end

@implementation SSShortcutsRankingManager

+ (id)moveShortcutsToRelatedAppSectionsForAllSections:(id)a3 isAsYouTypeTopHitSearch:(BOOL)a4 sectionBuilderBlock:(id)a5
{
  BOOL v116 = a4;
  uint64_t v158 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v119 = (void (**)(id, void *))a5;
  v7 = (void *)[v6 mutableCopy];
  v8 = objc_opt_new();
  id v118 = v6;
  if (![v6 count]) {
    goto LABEL_38;
  }
  unint64_t v9 = 0;
  v10 = @"com.apple.shortcuts";
  unint64_t v11 = -1;
  do
  {
    v12 = [v6 objectAtIndexedSubscript:v9];
    v13 = [v12 bundleIdentifier];
    [v8 setObject:v12 forKeyedSubscript:v13];

    v14 = [v12 bundleIdentifier];
    int v15 = [v14 isEqualToString:@"com.apple.shortcuts"];

    if (v15) {
      unint64_t v11 = v9;
    }

    ++v9;
  }
  while (v9 < [v6 count]);
  if (v11 == -1)
  {
LABEL_38:
    SSShortcutsAppSectionEnabled();
    v16 = 0;
  }
  else
  {
    v16 = [v6 objectAtIndexedSubscript:v11];
    if (SSShortcutsAppSectionEnabled() && v16)
    {
      v130 = v8;
      v110 = v7;
      v124 = objc_opt_new();
      v126 = objc_opt_new();
      v17 = [v16 results];
      v134 = (void *)[v17 mutableCopy];

      long long v153 = 0u;
      long long v154 = 0u;
      long long v151 = 0u;
      long long v152 = 0u;
      v112 = v16;
      v18 = [v16 results];
      uint64_t v19 = [v18 countByEnumeratingWithState:&v151 objects:v157 count:16];
      if (!v19) {
        goto LABEL_42;
      }
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v152;
      v122 = v18;
      char v139 = 1;
      uint64_t v132 = *(void *)v152;
LABEL_11:
      uint64_t v22 = 0;
      uint64_t v135 = v20;
LABEL_12:
      if (*(void *)v152 != v21) {
        objc_enumerationMutation(v18);
      }
      v23 = *(void **)(*((void *)&v151 + 1) + 8 * v22);
      v24 = [v23 relatedAppIdentifier];
      if (![v24 length] || (objc_msgSend(v24, "isEqualToString:", v10) & 1) != 0)
      {
        char v139 = 0;
        goto LABEL_35;
      }
      v25 = [v130 objectForKey:v24];
      unint64_t v141 = [v6 indexOfObject:v25];
      if (v25)
      {
        v137 = v25;
        v26 = [v25 results];
        v27 = (void *)[v26 mutableCopy];

        uint64_t v28 = [v27 count];
        if (![v27 count]) {
          goto LABEL_33;
        }
        id obj = (id)v28;
        v29 = v10;
        uint64_t v28 = 0;
        while (1)
        {
          v30 = [v27 objectAtIndexedSubscript:v28];
          v31 = [v30 resultBundleId];
          int v32 = [v31 isEqualToString:v29];

          if (v32)
          {
            v33 = [v23 rankingItem];
            [v33 likelihood];
            double v35 = v34;
            v36 = [v30 rankingItem];
            [v36 likelihood];
            double v38 = v37;

            if (v35 > v38) {
              goto LABEL_31;
            }
          }
          else if (v11 < v141)
          {
LABEL_31:

LABEL_32:
            id v6 = v118;
            v10 = v29;
            v18 = v122;
LABEL_33:
            [v27 insertObject:v23 atIndex:v28];
            v25 = v137;
            [v137 setResults:v27];
            uint64_t v21 = v132;
LABEL_34:

            [v134 removeObject:v23];
            uint64_t v20 = v135;
LABEL_35:

            if (++v22 == v20)
            {
              uint64_t v20 = [v18 countByEnumeratingWithState:&v151 objects:v157 count:16];
              if (!v20) {
                goto LABEL_42;
              }
              goto LABEL_11;
            }
            goto LABEL_12;
          }

          if (++v28 >= (unint64_t)[v27 count])
          {
            uint64_t v28 = (uint64_t)obj;
            goto LABEL_32;
          }
        }
      }
      v39 = v119[2](v119, v24);
      if (v39)
      {
        v27 = v39;
        [v39 addResults:v23];
        if (v139) {
          v40 = v124;
        }
        else {
          v40 = v126;
        }
        [v40 addObject:v27];
        [v130 setObject:v27 forKey:v24];
        goto LABEL_34;
      }
      v41 = SSGeneralLog();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        +[SSShortcutsRankingManager moveShortcutsToRelatedAppSectionsForAllSections:isAsYouTypeTopHitSearch:sectionBuilderBlock:](v41);
      }

LABEL_42:
      [v112 setResults:v134];
      v7 = v110;
      v42 = v126;
      if (v11 > [v110 count])
      {
        unint64_t v11 = [v110 count];
        v43 = SSGeneralLog();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
          +[SSShortcutsRankingManager moveShortcutsToRelatedAppSectionsForAllSections:isAsYouTypeTopHitSearch:sectionBuilderBlock:](v43);
        }
      }
      v8 = v130;
      if ([v126 count])
      {
        v42 = v126;
        v44 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v11 + 1, objc_msgSend(v126, "count"));
        [v110 insertObjects:v126 atIndexes:v44];
      }
      if ([v124 count])
      {
        v45 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v11, objc_msgSend(v124, "count"));
        [v110 insertObjects:v124 atIndexes:v45];
      }
      id v6 = v118;
      v16 = v112;
    }
  }
  if ([v16 resultsCount])
  {
    v113 = v16;
  }
  else
  {
    [v7 removeObject:v16];
    [v8 removeObjectForKey:@"com.apple.shortcuts"];

    v113 = 0;
  }
  v46 = [v8 objectForKey:@"com.apple.spotlight.tophits"];
  v47 = v46;
  if (v46)
  {
    v48 = [v46 results];
    v49 = [v48 firstObject];
    v50 = [v49 sectionBundleIdentifier];
    v51 = v47;
    int v52 = [v50 isEqualToString:@"com.apple.application"];

    if (v52)
    {
      v53 = [v51 results];
      v54 = [v53 firstObject];
      v120 = [v54 resultBundleId];
    }
    else
    {
      v120 = 0;
    }
    id v6 = v118;
    v47 = v51;
  }
  else
  {
    v120 = 0;
  }
  if (SSShortcutsAppSectionEnabled())
  {
    v55 = v120;
    if ([v120 length])
    {
      id v56 = [v8 objectForKey:v120];
    }
    else
    {
      id v56 = 0;
    }
  }
  else
  {
    id v56 = v113;
    v55 = v120;
  }
  int v57 = isIpad();
  uint64_t v58 = 3;
  if (v57) {
    uint64_t v58 = 5;
  }
  unint64_t v123 = v58;
  if (v116
    && SSAppTopHitWithShortcutsEnabled()
    && [v47 resultsCount] == 1
    && [v55 length]
    && v56
    && !+[SSTopHitAppWithEntitiesSectionBuilder supportsAppTopHitWithoutIndexFor:v55])
  {
    v131 = v8;
    v111 = v7;
    v59 = [v56 results];
    v136 = (void *)[v59 mutableCopy];

    v60 = objc_opt_new();
    long long v147 = 0u;
    long long v148 = 0u;
    long long v149 = 0u;
    long long v150 = 0u;
    id obja = [v56 results];
    uint64_t v61 = [obja countByEnumeratingWithState:&v147 objects:v156 count:16];
    v108 = v56;
    v109 = v47;
    if (!v61)
    {
      v121 = &unk_1F1861910;
      goto LABEL_121;
    }
    uint64_t v62 = v61;
    unint64_t v63 = 0;
    uint64_t v64 = *(void *)v148;
    uint64_t v117 = *MEMORY[0x1E4F23548];
    uint64_t v115 = *MEMORY[0x1E4F22D28];
    uint64_t v114 = *MEMORY[0x1E4FB4C00];
    v121 = &unk_1F1861910;
    uint64_t v125 = *(void *)v148;
    v133 = v60;
    while (1)
    {
      uint64_t v65 = 0;
      uint64_t v127 = v62;
      do
      {
        if (*(void *)v148 != v64) {
          objc_enumerationMutation(obja);
        }
        v66 = *(void **)(*((void *)&v147 + 1) + 8 * v65);
        objc_msgSend(v66, "resultBundleId", v108);
        id v67 = (id)objc_claimAutoreleasedReturnValue();
        if (![v67 isEqualToString:@"com.apple.shortcuts"]) {
          goto LABEL_116;
        }
        v68 = [v66 relatedAppIdentifier];
        v69 = v66;
        int v70 = [v68 isEqualToString:v55];

        if (!v70)
        {
          uint64_t v64 = v125;
          uint64_t v62 = v127;
          goto LABEL_117;
        }
        v71 = [v69 valueForAttribute:v117 withType:objc_opt_class()];
        int v72 = [v71 BOOLValue];

        v73 = [v69 valueForAttribute:v115 withType:objc_opt_class()];
        int v74 = [v73 isEqualToString:v114];

        v138 = v69;
        uint64_t v75 = [v69 displayOrder];
        v76 = (void *)v75;
        v77 = &unk_1F1861910;
        if (v75) {
          v77 = (void *)v75;
        }
        id v67 = v77;

        int v142 = v74;
        if (v74)
        {
LABEL_91:
          [v60 count];
          unint64_t v80 = 0;
          unint64_t v140 = v63 + 1;
          v81 = v69;
          while (v80 != [v60 count])
          {
            if (v140 == v80) {
              int v82 = v142;
            }
            else {
              int v82 = 0;
            }
            if (v82 == 1)
            {
              unint64_t v63 = v140;
              [v60 insertObject:v81 atIndex:v140];
              goto LABEL_108;
            }
            v83 = [v60 objectAtIndexedSubscript:v80];
            if (v80 <= v63)
            {
              v87 = [v81 title];
              v88 = [v87 text];
              v89 = [v83 title];
              [v89 text];
              uint64_t v90 = v65;
              id v91 = v67;
              v93 = unint64_t v92 = v63;
              uint64_t v94 = [v88 localizedCompare:v93];

              unint64_t v63 = v92;
              id v67 = v91;
              uint64_t v65 = v90;
              v81 = v138;

              BOOL v95 = v94 == -1;
              v60 = v133;
              if (v95)
              {
LABEL_107:
                [v60 insertObject:v81 atIndex:v80];

                goto LABEL_108;
              }
            }
            else
            {
              unsigned int v84 = [v67 unsignedIntValue];
              v85 = [v83 displayOrder];
              unsigned int v86 = [v85 unsignedIntValue];

              if (v84 < v86) {
                goto LABEL_107;
              }
            }

            if (++v80 > [v60 count]) {
              goto LABEL_108;
            }
          }
          [v60 addObject:v81];
          if (v142) {
            unint64_t v63 = v80;
          }
LABEL_108:
          v55 = v120;
          if ([v60 count] > v123) {
            objc_msgSend(v60, "removeObjectsInRange:", v123, objc_msgSend(v60, "count") - v123);
          }
          uint64_t v96 = [v60 count];
          if (v63 >= v96 - 1) {
            unint64_t v63 = v96 - 1;
          }
          v97 = [v60 lastObject];
          uint64_t v98 = [v97 displayOrder];
          v99 = (void *)v98;
          v100 = &unk_1F1861910;
          if (v98) {
            v100 = (void *)v98;
          }
          id v101 = v100;

          v121 = v101;
          goto LABEL_115;
        }
        if ([v60 count] >= v123)
        {
          unsigned int v78 = [v67 unsignedIntValue];
          if (v78 < [v121 unsignedIntValue]) {
            char v79 = v72;
          }
          else {
            char v79 = 0;
          }
          if (v79) {
            goto LABEL_91;
          }
        }
        else if ((v72 | v74) == 1)
        {
          goto LABEL_91;
        }
LABEL_115:
        uint64_t v64 = v125;
        uint64_t v62 = v127;
LABEL_116:

LABEL_117:
        ++v65;
      }
      while (v65 != v62);
      uint64_t v62 = [obja countByEnumeratingWithState:&v147 objects:v156 count:16];
      if (!v62)
      {
LABEL_121:

        long long v145 = 0u;
        long long v146 = 0u;
        long long v143 = 0u;
        long long v144 = 0u;
        id v102 = v60;
        uint64_t v103 = [v102 countByEnumeratingWithState:&v143 objects:v155 count:16];
        v7 = v111;
        v8 = v131;
        if (v103)
        {
          uint64_t v104 = v103;
          uint64_t v105 = *(void *)v144;
          do
          {
            for (uint64_t i = 0; i != v104; ++i)
            {
              if (*(void *)v144 != v105) {
                objc_enumerationMutation(v102);
              }
              objc_msgSend(v136, "removeObject:", *(void *)(*((void *)&v143 + 1) + 8 * i), v108);
            }
            uint64_t v104 = [v102 countByEnumeratingWithState:&v143 objects:v155 count:16];
          }
          while (v104);
        }

        id v56 = v108;
        [v108 setResults:v136];

        id v6 = v118;
        v47 = v109;
        break;
      }
    }
  }

  return v7;
}

+ (void)moveShortcutsToRelatedAppSectionsForAllSections:(os_log_t)log isAsYouTypeTopHitSearch:sectionBuilderBlock:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BDB2A000, log, OS_LOG_TYPE_ERROR, "Shortcuts section index out of bounds. This should never happen and is always a bug!", v1, 2u);
}

+ (void)moveShortcutsToRelatedAppSectionsForAllSections:(os_log_t)log isAsYouTypeTopHitSearch:sectionBuilderBlock:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BDB2A000, log, OS_LOG_TYPE_ERROR, "SectionBuilderBlock returned with nil section. Skipping for this result.", v1, 2u);
}

@end