@interface PGGraphHighlightCollectionEnrichmentProcessor
- (PGGraphHighlightCollectionEnrichmentProcessor)initWithOptions:(id)a3;
- (void)_enrichYearHighlights:(id)a3 monthsHighlights:(id)a4 withManager:(id)a5 curationContext:(id)a6 enrichmentprogressBlock:(id)a7;
- (void)enrichDataModelWithManager:(id)a3 curationContext:(id)a4 graphUpdateInventory:(id)a5 progressBlock:(id)a6;
@end

@implementation PGGraphHighlightCollectionEnrichmentProcessor

- (void).cxx_destruct
{
}

- (void)_enrichYearHighlights:(id)a3 monthsHighlights:(id)a4 withManager:(id)a5 curationContext:(id)a6 enrichmentprogressBlock:(id)a7
{
  *(void *)((char *)&v195[2] + 4) = *MEMORY[0x1E4F143B8];
  id v136 = a3;
  id v132 = a4;
  id v12 = a5;
  id v131 = a6;
  id v13 = a7;
  v14 = _Block_copy(v13);
  v191 = &v190;
  uint64_t v192 = 0x2020000000;
  char v193 = 0;
  uint64_t v186 = 0;
  v187 = (double *)&v186;
  uint64_t v188 = 0x2020000000;
  uint64_t v189 = 0;
  uint64_t v190 = 0;
  if (!v14
    || (double v15 = CFAbsoluteTimeGetCurrent(), v15 - v187[3] < 0.01)
    || (v187[3] = v15,
        LOBYTE(info.numer) = 0,
        (*((void (**)(void *, mach_timebase_info *, double))v14 + 2))(v14, &info, 0.0),
        char v16 = *((unsigned char *)v191 + 24) | LOBYTE(info.numer),
        (*((unsigned char *)v191 + 24) = v16) == 0))
  {
    v135 = [v12 photoLibrary];
    v17 = [v12 enrichmentLoggingConnection];
    v18 = [[PGHighlightItemModelManager alloc] initWithLibrary:v135];
    v134 = [[PGMonthEnrichmentRule alloc] initWithModelReader:v18 loggingConnection:v17];
    v133 = [[PGYearEnrichmentRule alloc] initWithModelReader:v18 loggingConnection:v17];
    v130 = [[PGHighlightItemEnrichment alloc] initWithRule:v134 modelWriter:v18];
    v128 = [[PGHighlightItemEnrichment alloc] initWithRule:v133 modelWriter:v18];
    v19 = v17;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = [v136 count];
      int buf = 134217984;
      v195[0] = v20;
      _os_log_impl(&dword_1D1805000, v19, OS_LOG_TYPE_INFO, "Extracting existing clusters from (%ld) backing year", (uint8_t *)&buf, 0xCu);
    }

    v181[0] = MEMORY[0x1E4F143A8];
    v181[1] = 3221225472;
    v181[2] = __140__PGGraphHighlightCollectionEnrichmentProcessor__enrichYearHighlights_monthsHighlights_withManager_curationContext_enrichmentprogressBlock___block_invoke;
    v181[3] = &unk_1E68F03F8;
    id v21 = v14;
    id v182 = v21;
    v183 = &v186;
    v184 = &v190;
    uint64_t v185 = 0x3F847AE147AE147BLL;
    v129 = +[PGHighlightItemRestorer restoreExistingHighlightItemListsFromBackingHighlightItems:v136 usingModelReader:v18 progressBlock:v181];
    if (*((unsigned char *)v191 + 24))
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
LABEL_131:

        goto LABEL_132;
      }
      int buf = 67109378;
      LODWORD(v195[0]) = 137;
      WORD2(v195[0]) = 2080;
      *(void *)((char *)v195 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Graph/Data Model Enrichment/PGGraphHighlightCollectionEnrichmentProcessor.m";
      v22 = MEMORY[0x1E4F14500];
LABEL_11:
      _os_log_impl(&dword_1D1805000, v22, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
      goto LABEL_131;
    }
    if (v14)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v187[3] >= 0.01)
      {
        v187[3] = Current;
        LOBYTE(info.numer) = 0;
        (*((void (**)(id, mach_timebase_info *, double))v21 + 2))(v21, &info, 0.1);
        char v24 = *((unsigned char *)v191 + 24) | LOBYTE(info.numer);
        *((unsigned char *)v191 + 24) = v24;
        if (v24)
        {
          if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
            goto LABEL_131;
          }
          int buf = 67109378;
          LODWORD(v195[0]) = 139;
          WORD2(v195[0]) = 2080;
          *(void *)((char *)v195 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Ph"
                                          "otosGraph/Framework/Graph/Data Model Enrichment/PGGraphHighlightCollectionEnri"
                                          "chmentProcessor.m";
          v22 = MEMORY[0x1E4F14500];
          goto LABEL_11;
        }
      }
    }
    v25 = v19;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      uint64_t v26 = [v132 count];
      int buf = 134217984;
      v195[0] = v26;
      _os_log_impl(&dword_1D1805000, v25, OS_LOG_TYPE_INFO, "Extracting existing clusters from (%ld) backing months", (uint8_t *)&buf, 0xCu);
    }

    v176[0] = MEMORY[0x1E4F143A8];
    v176[1] = 3221225472;
    v176[2] = __140__PGGraphHighlightCollectionEnrichmentProcessor__enrichYearHighlights_monthsHighlights_withManager_curationContext_enrichmentprogressBlock___block_invoke_227;
    v176[3] = &unk_1E68F03F8;
    id v27 = v21;
    id v177 = v27;
    v178 = &v186;
    v179 = &v190;
    uint64_t v180 = 0x3F847AE147AE147BLL;
    v127 = +[PGHighlightItemRestorer restoreExistingHighlightItemListsFromBackingHighlightItems:v132 usingModelReader:v18 progressBlock:v176];
    if (*((unsigned char *)v191 + 24))
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
LABEL_130:

        goto LABEL_131;
      }
      int buf = 67109378;
      LODWORD(v195[0]) = 146;
      WORD2(v195[0]) = 2080;
      *(void *)((char *)v195 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Graph/Data Model Enrichment/PGGraphHighlightCollectionEnrichmentProcessor.m";
      v28 = MEMORY[0x1E4F14500];
LABEL_22:
      _os_log_impl(&dword_1D1805000, v28, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
      goto LABEL_130;
    }
    if (v14)
    {
      double v29 = CFAbsoluteTimeGetCurrent();
      if (v29 - v187[3] >= 0.01)
      {
        v187[3] = v29;
        LOBYTE(info.numer) = 0;
        (*((void (**)(id, mach_timebase_info *, double))v27 + 2))(v27, &info, 0.2);
        char v30 = *((unsigned char *)v191 + 24) | LOBYTE(info.numer);
        *((unsigned char *)v191 + 24) = v30;
        if (v30)
        {
          if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
            goto LABEL_130;
          }
          int buf = 67109378;
          LODWORD(v195[0]) = 148;
          WORD2(v195[0]) = 2080;
          *(void *)((char *)v195 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Ph"
                                          "otosGraph/Framework/Graph/Data Model Enrichment/PGGraphHighlightCollectionEnri"
                                          "chmentProcessor.m";
          v28 = MEMORY[0x1E4F14500];
          goto LABEL_22;
        }
      }
    }
    v31 = v25;
    os_signpost_id_t v32 = os_signpost_id_generate(v31);
    v33 = v31;
    v34 = v33;
    os_signpost_id_t spid = v32;
    unint64_t v35 = v32 - 1;
    if (v35 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v34, OS_SIGNPOST_INTERVAL_BEGIN, spid, "MonthEventsSelection", "", (uint8_t *)&buf, 2u);
    }
    v126 = v34;

    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    uint64_t v120 = mach_absolute_time();
    v170[0] = MEMORY[0x1E4F143A8];
    v170[1] = 3221225472;
    v170[2] = __140__PGGraphHighlightCollectionEnrichmentProcessor__enrichYearHighlights_monthsHighlights_withManager_curationContext_enrichmentprogressBlock___block_invoke_228;
    v170[3] = &unk_1E68F03F8;
    id v36 = v27;
    id v171 = v36;
    v172 = &v186;
    v173 = &v190;
    uint64_t v174 = 0x3F847AE147AE147BLL;
    [(PGHighlightItemEnrichment *)v130 updateVisibilityStateForHighlightItemLists:v127 withManager:v12 progressBlock:v170];
    if (*((unsigned char *)v191 + 24))
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
LABEL_129:

        goto LABEL_130;
      }
      int buf = 67109378;
      LODWORD(v195[0]) = 156;
      WORD2(v195[0]) = 2080;
      *(void *)((char *)v195 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Graph/Data Model Enrichment/PGGraphHighlightCollectionEnrichmentProcessor.m";
      v37 = MEMORY[0x1E4F14500];
LABEL_34:
      _os_log_impl(&dword_1D1805000, v37, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
      goto LABEL_129;
    }
    if (v14)
    {
      double v38 = CFAbsoluteTimeGetCurrent();
      if (v38 - v187[3] >= 0.01)
      {
        v187[3] = v38;
        LOBYTE(v164.numer) = 0;
        (*((void (**)(id, mach_timebase_info *, double))v36 + 2))(v36, &v164, 0.3);
        char v39 = *((unsigned char *)v191 + 24) | LOBYTE(v164.numer);
        *((unsigned char *)v191 + 24) = v39;
        if (v39)
        {
          if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
            goto LABEL_129;
          }
          int buf = 67109378;
          LODWORD(v195[0]) = 158;
          WORD2(v195[0]) = 2080;
          *(void *)((char *)v195 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Ph"
                                          "otosGraph/Framework/Graph/Data Model Enrichment/PGGraphHighlightCollectionEnri"
                                          "chmentProcessor.m";
          v37 = MEMORY[0x1E4F14500];
          goto LABEL_34;
        }
      }
    }
    v165[0] = MEMORY[0x1E4F143A8];
    v165[1] = 3221225472;
    v165[2] = __140__PGGraphHighlightCollectionEnrichmentProcessor__enrichYearHighlights_monthsHighlights_withManager_curationContext_enrichmentprogressBlock___block_invoke_229;
    v165[3] = &unk_1E68F03F8;
    id v40 = v36;
    id v166 = v40;
    v167 = &v186;
    v168 = &v190;
    uint64_t v169 = 0x3F847AE147AE147BLL;
    [(PGHighlightItemEnrichment *)v128 updateVisibilityStateForHighlightItemLists:v129 withManager:v12 progressBlock:v165];
    if (*((unsigned char *)v191 + 24))
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
LABEL_128:

        goto LABEL_129;
      }
      int buf = 67109378;
      LODWORD(v195[0]) = 163;
      WORD2(v195[0]) = 2080;
      *(void *)((char *)v195 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Graph/Data Model Enrichment/PGGraphHighlightCollectionEnrichmentProcessor.m";
      v41 = MEMORY[0x1E4F14500];
LABEL_43:
      _os_log_impl(&dword_1D1805000, v41, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
      goto LABEL_128;
    }
    v117 = (void (**)(void, void, double))v40;
    uint64_t v42 = mach_absolute_time();
    uint32_t numer = info.numer;
    uint32_t denom = info.denom;
    v45 = v126;
    v46 = v45;
    if (v35 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v46, OS_SIGNPOST_INTERVAL_END, spid, "MonthEventsSelection", "", (uint8_t *)&buf, 2u);
    }

    v47 = v46;
    if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
    {
      int buf = 136315394;
      v195[0] = "MonthEventsSelection";
      LOWORD(v195[1]) = 2048;
      *(double *)((char *)&v195[1] + 2) = (float)((float)((float)((float)(v42 - v120) * (float)numer) / (float)denom)
                                                / 1000000.0);
      _os_log_impl(&dword_1D1805000, v47, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", (uint8_t *)&buf, 0x16u);
    }

    if (v14)
    {
      double v48 = CFAbsoluteTimeGetCurrent();
      if (v48 - v187[3] >= 0.01)
      {
        v187[3] = v48;
        LOBYTE(v164.numer) = 0;
        ((void (**)(void, mach_timebase_info *, double))v117)[2](v117, &v164, 0.4);
        char v49 = *((unsigned char *)v191 + 24) | LOBYTE(v164.numer);
        *((unsigned char *)v191 + 24) = v49;
        if (v49)
        {
          if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
            goto LABEL_128;
          }
          int buf = 67109378;
          LODWORD(v195[0]) = 167;
          WORD2(v195[0]) = 2080;
          *(void *)((char *)v195 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Ph"
                                          "otosGraph/Framework/Graph/Data Model Enrichment/PGGraphHighlightCollectionEnri"
                                          "chmentProcessor.m";
          v41 = MEMORY[0x1E4F14500];
          goto LABEL_43;
        }
      }
    }
    v50 = v47;
    os_signpost_id_t v51 = os_signpost_id_generate(v50);
    v52 = v50;
    v53 = v52;
    if (v51 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v52))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v53, OS_SIGNPOST_INTERVAL_BEGIN, v51, "MonthAndYearContextualKeyAssetsComputation", "", (uint8_t *)&buf, 2u);
    }
    spida = v53;

    mach_timebase_info v164 = 0;
    mach_timebase_info(&v164);
    uint64_t v54 = mach_absolute_time();
    options = self->_options;
    v159[0] = MEMORY[0x1E4F143A8];
    v159[1] = 3221225472;
    v159[2] = __140__PGGraphHighlightCollectionEnrichmentProcessor__enrichYearHighlights_monthsHighlights_withManager_curationContext_enrichmentprogressBlock___block_invoke_231;
    v159[3] = &unk_1E68F03F8;
    id v121 = v117;
    id v160 = v121;
    v161 = &v186;
    v162 = &v190;
    uint64_t v163 = 0x3F847AE147AE147BLL;
    [(PGHighlightItemEnrichment *)v128 contextualKeyAssetForYearHighlightItemLists:v129 withManager:v12 curationContext:v131 options:options progressBlock:v159];
    if (*((unsigned char *)v191 + 24))
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
LABEL_127:

        goto LABEL_128;
      }
      int buf = 67109378;
      LODWORD(v195[0]) = 175;
      WORD2(v195[0]) = 2080;
      *(void *)((char *)v195 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Graph/Data Model Enrichment/PGGraphHighlightCollectionEnrichmentProcessor.m";
      v56 = MEMORY[0x1E4F14500];
LABEL_60:
      _os_log_impl(&dword_1D1805000, v56, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
      goto LABEL_127;
    }
    uint64_t v118 = mach_absolute_time();
    uint32_t v58 = v164.numer;
    uint32_t v57 = v164.denom;
    v59 = spida;
    v60 = v59;
    if (v51 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v59))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v60, OS_SIGNPOST_INTERVAL_END, v51, "MonthAndYearContextualKeyAssetsComputation", "", (uint8_t *)&buf, 2u);
    }

    v61 = v60;
    if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
    {
      int buf = 136315394;
      v195[0] = "MonthAndYearContextualKeyAssetsComputation";
      LOWORD(v195[1]) = 2048;
      *(double *)((char *)&v195[1] + 2) = (float)((float)((float)((float)(v118 - v54) * (float)v58) / (float)v57)
                                                / 1000000.0);
      _os_log_impl(&dword_1D1805000, v61, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", (uint8_t *)&buf, 0x16u);
    }

    if (v14)
    {
      double v62 = CFAbsoluteTimeGetCurrent();
      if (v62 - v187[3] >= 0.01)
      {
        v187[3] = v62;
        LOBYTE(v158.numer) = 0;
        (*((void (**)(id, mach_timebase_info *, double))v121 + 2))(v121, &v158, 0.6);
        char v63 = *((unsigned char *)v191 + 24) | LOBYTE(v158.numer);
        *((unsigned char *)v191 + 24) = v63;
        if (v63)
        {
          if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
            goto LABEL_127;
          }
          int buf = 67109378;
          LODWORD(v195[0]) = 179;
          WORD2(v195[0]) = 2080;
          *(void *)((char *)v195 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Ph"
                                          "otosGraph/Framework/Graph/Data Model Enrichment/PGGraphHighlightCollectionEnri"
                                          "chmentProcessor.m";
          v56 = MEMORY[0x1E4F14500];
          goto LABEL_60;
        }
      }
    }
    v64 = v61;
    os_signpost_id_t v65 = os_signpost_id_generate(v64);
    v66 = v64;
    v67 = v66;
    if (v65 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v66))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v67, OS_SIGNPOST_INTERVAL_BEGIN, v65, "MonthsEnrichment", "", (uint8_t *)&buf, 2u);
    }
    v119 = v67;

    mach_timebase_info v158 = 0;
    mach_timebase_info(&v158);
    uint64_t v68 = mach_absolute_time();
    v153[0] = MEMORY[0x1E4F143A8];
    v153[1] = 3221225472;
    v153[2] = __140__PGGraphHighlightCollectionEnrichmentProcessor__enrichYearHighlights_monthsHighlights_withManager_curationContext_enrichmentprogressBlock___block_invoke_233;
    v153[3] = &unk_1E68F03F8;
    id v122 = v121;
    id v154 = v122;
    v155 = &v186;
    v156 = &v190;
    uint64_t v157 = 0x3F847AE147AE147BLL;
    [(PGHighlightItemEnrichment *)v130 enrichHighlightItemLists:v127 progressBlock:v153];
    if (*((unsigned char *)v191 + 24))
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
LABEL_126:

        goto LABEL_127;
      }
      int buf = 67109378;
      LODWORD(v195[0]) = 187;
      WORD2(v195[0]) = 2080;
      *(void *)((char *)v195 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Graph/Data Model Enrichment/PGGraphHighlightCollectionEnrichmentProcessor.m";
      v69 = MEMORY[0x1E4F14500];
LABEL_77:
      _os_log_impl(&dword_1D1805000, v69, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
      goto LABEL_126;
    }
    uint64_t v115 = mach_absolute_time();
    uint32_t v71 = v158.numer;
    uint32_t v70 = v158.denom;
    v72 = v67;
    v73 = v72;
    if (v65 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v72))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v73, OS_SIGNPOST_INTERVAL_END, v65, "MonthsEnrichment", "", (uint8_t *)&buf, 2u);
    }

    v74 = v73;
    if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
    {
      int buf = 136315394;
      v195[0] = "MonthsEnrichment";
      LOWORD(v195[1]) = 2048;
      *(double *)((char *)&v195[1] + 2) = (float)((float)((float)((float)(v115 - v68) * (float)v71) / (float)v70)
                                                / 1000000.0);
      _os_log_impl(&dword_1D1805000, v74, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", (uint8_t *)&buf, 0x16u);
    }

    +[PGHighlightItemList updateParentHighlightItemLists:v129 withChildHighlightItems:v127];
    if (v14)
    {
      double v75 = CFAbsoluteTimeGetCurrent();
      if (v75 - v187[3] >= 0.01)
      {
        v187[3] = v75;
        LOBYTE(v152.numer) = 0;
        (*((void (**)(id, mach_timebase_info *, double))v122 + 2))(v122, &v152, 0.7);
        char v76 = *((unsigned char *)v191 + 24) | LOBYTE(v152.numer);
        *((unsigned char *)v191 + 24) = v76;
        if (v76)
        {
          if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
            goto LABEL_126;
          }
          int buf = 67109378;
          LODWORD(v195[0]) = 194;
          WORD2(v195[0]) = 2080;
          *(void *)((char *)v195 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Ph"
                                          "otosGraph/Framework/Graph/Data Model Enrichment/PGGraphHighlightCollectionEnri"
                                          "chmentProcessor.m";
          v69 = MEMORY[0x1E4F14500];
          goto LABEL_77;
        }
      }
    }
    v77 = v74;
    os_signpost_id_t v78 = os_signpost_id_generate(v77);
    v79 = v77;
    v80 = v79;
    if (v78 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v79))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v80, OS_SIGNPOST_INTERVAL_BEGIN, v78, "YearsEnrichment", "", (uint8_t *)&buf, 2u);
    }
    v116 = v80;

    mach_timebase_info v152 = 0;
    mach_timebase_info(&v152);
    uint64_t v81 = mach_absolute_time();
    v147[0] = MEMORY[0x1E4F143A8];
    v147[1] = 3221225472;
    v147[2] = __140__PGGraphHighlightCollectionEnrichmentProcessor__enrichYearHighlights_monthsHighlights_withManager_curationContext_enrichmentprogressBlock___block_invoke_236;
    v147[3] = &unk_1E68F03F8;
    id v123 = v122;
    id v148 = v123;
    v149 = &v186;
    v150 = &v190;
    uint64_t v151 = 0x3F847AE147AE147BLL;
    [(PGHighlightItemEnrichment *)v128 enrichHighlightItemLists:v129 progressBlock:v147];
    if (*((unsigned char *)v191 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        int buf = 67109378;
        LODWORD(v195[0]) = 202;
        WORD2(v195[0]) = 2080;
        *(void *)((char *)v195 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Phot"
                                        "osGraph/Framework/Graph/Data Model Enrichment/PGGraphHighlightCollectionEnrichmentProcessor.m";
        v82 = MEMORY[0x1E4F14500];
LABEL_94:
        _os_log_impl(&dword_1D1805000, v82, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
      }
    }
    else
    {
      uint64_t v112 = mach_absolute_time();
      uint32_t v84 = v152.numer;
      uint32_t v83 = v152.denom;
      v85 = v80;
      v86 = v85;
      if (v78 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v85))
      {
        LOWORD(buf) = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v86, OS_SIGNPOST_INTERVAL_END, v78, "YearsEnrichment", "", (uint8_t *)&buf, 2u);
      }

      v87 = v86;
      if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
      {
        int buf = 136315394;
        v195[0] = "YearsEnrichment";
        LOWORD(v195[1]) = 2048;
        *(double *)((char *)&v195[1] + 2) = (float)((float)((float)((float)(v112 - v81) * (float)v84) / (float)v83)
                                                  / 1000000.0);
        _os_log_impl(&dword_1D1805000, v87, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", (uint8_t *)&buf, 0x16u);
      }

      if (!v14
        || (double v88 = CFAbsoluteTimeGetCurrent(), v88 - v187[3] < 0.01)
        || (v187[3] = v88,
            LOBYTE(v146.numer) = 0,
            (*((void (**)(id, mach_timebase_info *, double))v123 + 2))(v123, &v146, 0.8),
            char v89 = *((unsigned char *)v191 + 24) | LOBYTE(v146.numer),
            (*((unsigned char *)v191 + 24) = v89) == 0))
      {
        v90 = v87;
        os_signpost_id_t v91 = os_signpost_id_generate(v90);
        v92 = v90;
        v93 = v92;
        if (v91 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v92))
        {
          LOWORD(buf) = 0;
          _os_signpost_emit_with_name_impl(&dword_1D1805000, v93, OS_SIGNPOST_INTERVAL_BEGIN, v91, "HighlightCollectionEnrichmentCommit", "", (uint8_t *)&buf, 2u);
        }

        mach_timebase_info v146 = 0;
        mach_timebase_info(&v146);
        unint64_t v113 = v91 - 1;
        os_signpost_id_t v110 = v91;
        uint64_t v111 = mach_absolute_time();
        v94 = dispatch_group_create();
        dispatch_group_enter(v94);
        v141[0] = MEMORY[0x1E4F143A8];
        v141[1] = 3221225472;
        v141[2] = __140__PGGraphHighlightCollectionEnrichmentProcessor__enrichYearHighlights_monthsHighlights_withManager_curationContext_enrichmentprogressBlock___block_invoke_238;
        v141[3] = &unk_1E68EF730;
        id v142 = v129;
        v143 = v18;
        id v144 = v127;
        id v145 = v135;
        v138[0] = MEMORY[0x1E4F143A8];
        v138[1] = 3221225472;
        v138[2] = __140__PGGraphHighlightCollectionEnrichmentProcessor__enrichYearHighlights_monthsHighlights_withManager_curationContext_enrichmentprogressBlock___block_invoke_2;
        v138[3] = &unk_1E68EF758;
        v95 = v93;
        v139 = v95;
        v96 = v94;
        v140 = v96;
        [v145 performChanges:v141 completionHandler:v138];
        while (1)
        {
          dispatch_time_t v97 = dispatch_time(0, 100000000);
          if (!dispatch_group_wait(v96, v97)) {
            break;
          }
          if (v14)
          {
            double v98 = CFAbsoluteTimeGetCurrent();
            if (v98 - v187[3] >= 0.01)
            {
              v187[3] = v98;
              LOBYTE(buf) = 0;
              (*((void (**)(id, int *, double))v123 + 2))(v123, &buf, 0.9);
              char v99 = *((unsigned char *)v191 + 24) | buf;
              *((unsigned char *)v191 + 24) = v99;
              if (v99) {
                break;
              }
            }
          }
        }
        uint64_t v100 = mach_absolute_time();
        uint32_t v101 = v146.numer;
        uint32_t v102 = v146.denom;
        v103 = v95;
        v104 = v103;
        if (v113 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v103))
        {
          LOWORD(buf) = 0;
          _os_signpost_emit_with_name_impl(&dword_1D1805000, v104, OS_SIGNPOST_INTERVAL_END, v110, "HighlightCollectionEnrichmentCommit", "", (uint8_t *)&buf, 2u);
        }
        uint64_t v114 = v100;

        v105 = v104;
        if (os_log_type_enabled(v105, OS_LOG_TYPE_INFO))
        {
          int buf = 136315394;
          v195[0] = "HighlightCollectionEnrichmentCommit";
          LOWORD(v195[1]) = 2048;
          *(double *)((char *)&v195[1] + 2) = (float)((float)((float)((float)(v114 - v111) * (float)v101) / (float)v102)
                                                    / 1000000.0);
          _os_log_impl(&dword_1D1805000, v105, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", (uint8_t *)&buf, 0x16u);
        }

        if (v14)
        {
          double v106 = CFAbsoluteTimeGetCurrent();
          if (v106 - v187[3] >= 0.01)
          {
            v187[3] = v106;
            char v137 = 0;
            (*((void (**)(id, char *, double))v123 + 2))(v123, &v137, 1.0);
            char v107 = *((unsigned char *)v191 + 24) | v137;
            *((unsigned char *)v191 + 24) = v107;
            if (v107)
            {
              v108 = MEMORY[0x1E4F14500];
              id v109 = MEMORY[0x1E4F14500];
              if (os_log_type_enabled(v108, OS_LOG_TYPE_INFO))
              {
                int buf = 67109378;
                LODWORD(v195[0]) = 271;
                WORD2(v195[0]) = 2080;
                *(void *)((char *)v195 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanaly"
                                                "sis/PhotosGraph/Framework/Graph/Data Model Enrichment/PGGraphHighlightCo"
                                                "llectionEnrichmentProcessor.m";
                _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
              }
            }
          }
        }

        goto LABEL_125;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        int buf = 67109378;
        LODWORD(v195[0]) = 206;
        WORD2(v195[0]) = 2080;
        *(void *)((char *)v195 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Phot"
                                        "osGraph/Framework/Graph/Data Model Enrichment/PGGraphHighlightCollectionEnrichmentProcessor.m";
        v82 = MEMORY[0x1E4F14500];
        goto LABEL_94;
      }
    }
LABEL_125:

    goto LABEL_126;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int buf = 67109378;
    LODWORD(v195[0]) = 119;
    WORD2(v195[0]) = 2080;
    *(void *)((char *)v195 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Graph/Data Model Enrichment/PGGraphHighlightCollectionEnrichmentProcessor.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
  }
LABEL_132:
  _Block_object_dispose(&v186, 8);
  _Block_object_dispose(&v190, 8);
}

void __140__PGGraphHighlightCollectionEnrichmentProcessor__enrichYearHighlights_monthsHighlights_withManager_curationContext_enrichmentprogressBlock___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.1 + 0.0);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __140__PGGraphHighlightCollectionEnrichmentProcessor__enrichYearHighlights_monthsHighlights_withManager_curationContext_enrichmentprogressBlock___block_invoke_227(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.1 + 0.1);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __140__PGGraphHighlightCollectionEnrichmentProcessor__enrichYearHighlights_monthsHighlights_withManager_curationContext_enrichmentprogressBlock___block_invoke_228(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.1 + 0.2);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __140__PGGraphHighlightCollectionEnrichmentProcessor__enrichYearHighlights_monthsHighlights_withManager_curationContext_enrichmentprogressBlock___block_invoke_229(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.1 + 0.3);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __140__PGGraphHighlightCollectionEnrichmentProcessor__enrichYearHighlights_monthsHighlights_withManager_curationContext_enrichmentprogressBlock___block_invoke_231(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.2 + 0.4);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __140__PGGraphHighlightCollectionEnrichmentProcessor__enrichYearHighlights_monthsHighlights_withManager_curationContext_enrichmentprogressBlock___block_invoke_233(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.1 + 0.6);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __140__PGGraphHighlightCollectionEnrichmentProcessor__enrichYearHighlights_monthsHighlights_withManager_curationContext_enrichmentprogressBlock___block_invoke_236(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.1 + 0.7);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __140__PGGraphHighlightCollectionEnrichmentProcessor__enrichYearHighlights_monthsHighlights_withManager_curationContext_enrichmentprogressBlock___block_invoke_238(id *a1)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v2 = a1[4];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v47 objects:v53 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v48 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v47 + 1) + 8 * i);
        v8 = (void *)MEMORY[0x1D25FED50]();
        [a1[5] consumeHighlightItemList:v7];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v47 objects:v53 count:16];
    }
    while (v4);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v9 = a1[6];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v43 objects:v52 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v44;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v44 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v43 + 1) + 8 * j);
        double v15 = (void *)MEMORY[0x1D25FED50]();
        [a1[5] consumeHighlightItemList:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v43 objects:v52 count:16];
    }
    while (v11);
  }

  char v16 = [a1[5] highlightUUIDsWithVisibilityStateChange];
  v17 = [a1[5] highlightUUIDsWithContextualKeyAssetChange];
  uint64_t v18 = [v16 setByAddingObjectsFromSet:v17];
  v19 = [a1[7] librarySpecificFetchOptions];
  id v36 = (void *)v18;
  uint64_t v20 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(kind == %d || kind == %d) && uuid in %@", 0, 3, v18];
  [v19 setPredicate:v20];

  unint64_t v35 = v19;
  [MEMORY[0x1E4F39238] fetchHighlightsWithOptions:v19];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v21 = [obj countByEnumeratingWithState:&v39 objects:v51 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v40;
    unint64_t v24 = 0x1E4F39000uLL;
    do
    {
      uint64_t v25 = 0;
      uint64_t v37 = v22;
      do
      {
        if (*(void *)v40 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = *(void **)(*((void *)&v39 + 1) + 8 * v25);
        id v27 = [*(id *)(v24 + 576) changeRequestForPhotosHighlight:v26];
        v28 = [v26 uuid];
        if ([v16 containsObject:v28])
        {
          objc_msgSend(v27, "setVisibilityState:", objc_msgSend(a1[5], "visibilityStateForHighlightItem:sharingFilter:", v26, 0));
          objc_msgSend(v27, "setVisibilityStateShared:", objc_msgSend(a1[5], "visibilityStateForHighlightItem:sharingFilter:", v26, 1));
          objc_msgSend(v27, "setVisibilityStateMixed:", objc_msgSend(a1[5], "visibilityStateForHighlightItem:sharingFilter:", v26, 2));
        }
        if ([v17 containsObject:v28])
        {
          uint64_t v29 = v23;
          char v30 = v17;
          v31 = v16;
          unint64_t v32 = v24;
          v33 = [a1[5] contextualKeyAssetForHighlightItem:v26 sharingFilter:0];
          if (v33) {
            [v27 setKeyAssetPrivate:v33];
          }
          v34 = [a1[5] contextualKeyAssetForHighlightItem:v26 sharingFilter:1];
          if (v34)
          {
            [v27 setKeyAssetShared:v34];
            if (v33) {
              objc_msgSend(v27, "setMixedSharingCompositionKeyAssetRelationship:", +[PGHighlightEnrichmentUtilities mixedSharingCompositionKeyAssetRelationshipForKeyAssetPrivate:keyAssetShared:shouldCompareHighlight:](PGHighlightEnrichmentUtilities, "mixedSharingCompositionKeyAssetRelationshipForKeyAssetPrivate:keyAssetShared:shouldCompareHighlight:", v33, v34, 1));
            }
          }

          unint64_t v24 = v32;
          char v16 = v31;
          v17 = v30;
          uint64_t v23 = v29;
          uint64_t v22 = v37;
        }

        ++v25;
      }
      while (v22 != v25);
      uint64_t v22 = [obj countByEnumeratingWithState:&v39 objects:v51 count:16];
    }
    while (v22);
  }
}

void __140__PGGraphHighlightCollectionEnrichmentProcessor__enrichYearHighlights_monthsHighlights_withManager_curationContext_enrichmentprogressBlock___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_error_impl(&dword_1D1805000, v6, OS_LOG_TYPE_ERROR, "Failed to persist years and months enrichments: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)enrichDataModelWithManager:(id)a3 curationContext:(id)a4 graphUpdateInventory:(id)a5 progressBlock:(id)a6
{
  v77[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v56 = a4;
  id v10 = a5;
  id aBlock = a6;
  uint64_t v11 = [v9 enrichmentLoggingConnection];
  os_signpost_id_t v12 = os_signpost_id_generate(v11);
  id v13 = v11;
  uint64_t v14 = v13;
  unint64_t v55 = v12 - 1;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)int buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PGGraphHighlightCollectionEnrichmentProcessor", "", buf, 2u);
  }
  os_signpost_id_t spid = v12;

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v54 = mach_absolute_time();
  uint64_t v15 = [v10 updateType];
  int v16 = [v10 isResumingFullAnalysis];
  v17 = [(NSDictionary *)self->_options objectForKeyedSubscript:*MEMORY[0x1E4F8AEA0]];
  if ([v17 count])
  {
    uint64_t v18 = [v9 photoLibrary];
    v19 = [v18 librarySpecificFetchOptions];

    uint64_t v20 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uuid IN %@", v17];
    [v19 setPredicate:v20];

    uint64_t v21 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:0];
    v77[0] = v21;
    uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:1];
    [v19 setSortDescriptors:v22];

    uint64_t v23 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:6 subtype:1000000302 options:v19];
    unint64_t v24 = [v23 fetchedObjects];

    uint64_t v25 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:6 subtype:1000000303 options:v19];
    uint64_t v26 = [v25 fetchedObjects];
LABEL_11:
    unint64_t v32 = (void *)v26;
LABEL_12:

    goto LABEL_13;
  }
  if (v15 == 4) {
    int v27 = 1;
  }
  else {
    int v27 = v16;
  }
  if (v27 == 1)
  {
    v28 = [v9 photoLibrary];
    v19 = [v28 librarySpecificFetchOptions];

    uint64_t v29 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:0];
    char v76 = v29;
    char v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v76 count:1];
    [v19 setSortDescriptors:v30];

    v31 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:6 subtype:1000000302 options:v19];
    unint64_t v24 = [v31 fetchedObjects];

    uint64_t v25 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:6 subtype:1000000303 options:v19];
    uint64_t v26 = [v25 fetchedObjects];
    goto LABEL_11;
  }
  if (v15 == 2)
  {
    long long v42 = [v9 photoLibrary];
    v19 = [v42 librarySpecificFetchOptions];

    uint64_t v25 = [v10 highlightsToProcessForKind:0 withHighlightUpdateTypes:127 includeHighlightsToIngest:1];
    long long v50 = [v10 highlightsToProcessForKind:3 withHighlightUpdateTypes:127 includeHighlightsToIngest:1];
    v52 = [MEMORY[0x1E4F1CA80] set];
    [v52 unionSet:v25];
    [v52 unionSet:v50];
    long long v43 = [v10 highlightsToProcessForKind:1 withHighlightUpdateTypes:127 includeHighlightsToIngest:1];
    os_signpost_id_t v51 = (void *)[v43 mutableCopy];

    if ([v52 count])
    {
      long long v44 = [MEMORY[0x1E4F39238] fetchParentHighlightsForHighlights:v52 options:v19];
      long long v45 = [v44 fetchedObjects];

      [v51 addObjectsFromArray:v45];
    }
    unint64_t v24 = [v51 allObjects];
    long long v46 = [v10 highlightsToProcessForKind:2 withHighlightUpdateTypes:127 includeHighlightsToIngest:1];
    long long v47 = (void *)[v46 mutableCopy];

    if ([v51 count])
    {
      long long v48 = [MEMORY[0x1E4F39238] fetchParentHighlightsForHighlights:v51 options:v19];
      long long v49 = [v48 fetchedObjects];

      [v47 addObjectsFromArray:v49];
    }
    unint64_t v32 = [v47 allObjects];

    goto LABEL_12;
  }
  unint64_t v32 = 0;
  unint64_t v24 = 0;
LABEL_13:
  if (![v24 count] && !objc_msgSend(v32, "count")) {
    goto LABEL_27;
  }
  v33 = _Block_copy(aBlock);
  *(void *)int buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v75 = 0;
  uint64_t v65 = 0;
  v66 = (double *)&v65;
  uint64_t v67 = 0x2020000000;
  uint64_t v68 = 0;
  if (!v33) {
    goto LABEL_21;
  }
  double Current = CFAbsoluteTimeGetCurrent();
  if (Current - v66[3] >= 0.01
    && (v66[3] = Current,
        char v64 = 0,
        (*((void (**)(void *, char *, double))v33 + 2))(v33, &v64, 0.0),
        char v35 = *(unsigned char *)(*(void *)&buf[8] + 24) | v64,
        (*(unsigned char *)(*(void *)&buf[8] + 24) = v35) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint32_t v70 = 67109378;
      int v71 = 104;
      __int16 v72 = 2080;
      v73 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Data"
            " Model Enrichment/PGGraphHighlightCollectionEnrichmentProcessor.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v70, 0x12u);
    }
    int v36 = 1;
  }
  else
  {
LABEL_21:
    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    v59[2] = __127__PGGraphHighlightCollectionEnrichmentProcessor_enrichDataModelWithManager_curationContext_graphUpdateInventory_progressBlock___block_invoke;
    v59[3] = &unk_1E68F03F8;
    id v60 = v33;
    v61 = &v65;
    double v62 = buf;
    uint64_t v63 = 0x3F847AE147AE147BLL;
    [(PGGraphHighlightCollectionEnrichmentProcessor *)self _enrichYearHighlights:v32 monthsHighlights:v24 withManager:v9 curationContext:v56 enrichmentprogressBlock:v59];
    if (*(unsigned char *)(*(void *)&buf[8] + 24))
    {
      int v36 = 1;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)uint32_t v70 = 67109378;
        int v71 = 110;
        __int16 v72 = 2080;
        v73 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Da"
              "ta Model Enrichment/PGGraphHighlightCollectionEnrichmentProcessor.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v70, 0x12u);
      }
    }
    else
    {
      int v36 = 0;
    }
  }
  _Block_object_dispose(&v65, 8);
  _Block_object_dispose(buf, 8);

  if (!v36)
  {
LABEL_27:
    uint64_t v37 = mach_absolute_time();
    uint32_t numer = info.numer;
    uint32_t denom = info.denom;
    long long v40 = v14;
    long long v41 = v40;
    if (v55 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v40))
    {
      *(_WORD *)int buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v41, OS_SIGNPOST_INTERVAL_END, spid, "PGGraphHighlightCollectionEnrichmentProcessor", "", buf, 2u);
    }

    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)int buf = 136315394;
      *(void *)&buf[4] = "PGGraphHighlightCollectionEnrichmentProcessor";
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = (float)((float)((float)((float)(v37 - v54) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1D1805000, v41, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
  }
}

void __127__PGGraphHighlightCollectionEnrichmentProcessor_enrichDataModelWithManager_curationContext_graphUpdateInventory_progressBlock___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

- (PGGraphHighlightCollectionEnrichmentProcessor)initWithOptions:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphHighlightCollectionEnrichmentProcessor;
  v6 = [(PGGraphHighlightCollectionEnrichmentProcessor *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_options, a3);
  }

  return v7;
}

@end