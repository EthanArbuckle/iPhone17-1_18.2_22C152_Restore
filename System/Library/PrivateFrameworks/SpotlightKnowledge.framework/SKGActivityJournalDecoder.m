@interface SKGActivityJournalDecoder
+ (void)SKGActivityJournalPlayback:(const char *)a3 block:(id)a4;
+ (void)_SKGActivityDump:(id)a3 dst:(__sFILE *)a4;
+ (void)_SKGEmbeddingTimeline:(id)a3 includePerf:(BOOL)a4 block:(id)a5;
+ (void)_SKGEmbeddingTimelineDump:(id)a3 includePerf:(BOOL)a4 dst:(__sFILE *)a5;
+ (void)_SKGEmbeddingXPCTimeline:(id)a3 updater:(id)a4 block:(id)a5;
@end

@implementation SKGActivityJournalDecoder

+ (void)SKGActivityJournalPlayback:(const char *)a3 block:(id)a4
{
  v5 = (void (**)(id, _OWORD *))a4;
  unint64_t v38 = 0;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  int v6 = open(a3, 0);
  if (v6 == -1)
  {
    v30 = (FILE *)*MEMORY[0x263EF8348];
    v31 = "### file open failed";
    size_t v32 = 20;
LABEL_61:
    fwrite(v31, v32, 1uLL, v30);
    goto LABEL_62;
  }
  int v7 = v6;
  int64_t v8 = lseek(v6, 0, 2);
  v9 = (char *)mmap(0, v8, 1, 1, v7, 0);
  close(v7);
  if (v9 == (char *)-1)
  {
    v30 = (FILE *)*MEMORY[0x263EF8348];
    v31 = "### mmap failed";
    size_t v32 = 15;
    goto LABEL_61;
  }
  if (v8 >= 1)
  {
    uint64_t v10 = 0;
    v11 = (FILE **)MEMORY[0x263EF8348];
    while (1)
    {
      uint64_t v12 = v10 + 1;
      unsigned int v13 = v9[v10];
      if (v9[v10] < 0)
      {
        if (v13 > 0xBF)
        {
          if (v13 > 0xDF)
          {
            if (v13 > 0xEF)
            {
              unsigned int v13 = *(_DWORD *)&v9[v12];
              uint64_t v12 = v10 + 5;
            }
            else
            {
              unsigned int v13 = ((v13 & 0xF) << 24) | (v9[v12] << 16) | (v9[v10 + 2] << 8) | v9[v10 + 3];
              uint64_t v12 = v10 + 4;
            }
          }
          else
          {
            unsigned int v13 = ((v13 & 0x1F) << 16) | (v9[v12] << 8) | v9[v10 + 2];
            uint64_t v12 = v10 + 3;
          }
        }
        else
        {
          int v14 = v9[v12] | ((v13 & 0x3F) << 8);
          uint64_t v12 = v10 + 2;
          unsigned int v13 = v14;
        }
      }
      uint64_t v33 = v12;
      int v15 = v13 & 1;
      BYTE4(v35) = v13 & 1;
      uint64_t v16 = (v13 >> 1) & 0x3FFFFFFF;
      LODWORD(v34) = (v13 >> 1) & 0x3FFFFFFF;
      if ((v13 & 0x80000000) == 0) {
        break;
      }
      int v20 = DWORD2(v35);
      if (v20 == typeToEventDataType((v13 >> 1) & 0x3FFFFFFF)) {
        goto LABEL_54;
      }
      fprintf(*v11, "### mismatch repeat event %d at offset %ld\n", v16, v12);
LABEL_57:
      uint64_t v10 = v33;
      if (v33 >= v8) {
        goto LABEL_58;
      }
    }
    if ((v13 & 1) != 0 && isVerboseEvent((v13 >> 1) & 0x3FFFFFFF)) {
      *((double *)&v34 + 1) = (double)v2_readVInt64((uint64_t)v9, &v33);
    }
    switch(typeToEventDataType(v16))
    {
      case 1u:
        uint64_t v21 = v33 + 1;
        unsigned int v22 = v9[v33];
        if (v9[v33] < 0)
        {
          if (v22 > 0xBF)
          {
            if (v22 > 0xDF)
            {
              if (v22 > 0xEF)
              {
                unsigned int v22 = *(_DWORD *)&v9[v21];
                uint64_t v21 = v33 + 5;
              }
              else
              {
                unsigned int v22 = ((v22 & 0xF) << 24) | (v9[v21] << 16) | (v9[v33 + 2] << 8) | v9[v33 + 3];
                uint64_t v21 = v33 + 4;
              }
            }
            else
            {
              unsigned int v22 = ((v22 & 0x1F) << 16) | (v9[v21] << 8) | v9[v33 + 2];
              uint64_t v21 = v33 + 3;
            }
          }
          else
          {
            int v23 = v9[v21] | ((v22 & 0x3F) << 8);
            uint64_t v21 = v33 + 2;
            unsigned int v22 = v23;
          }
        }
        uint64_t v33 = v21;
        LODWORD(v36) = v22;
        *((double *)&v36 + 1) = (double)v2_readVInt64((uint64_t)v9, &v33);
        goto LABEL_51;
      case 2u:
        *(double *)&long long v36 = (double)v2_readVInt64((uint64_t)v9, &v33);
        *((void *)&v36 + 1) = v2_readVInt64((uint64_t)v9, &v33);
        goto LABEL_31;
      case 3u:
        size_t v24 = v33;
        v25 = &v9[v33];
        *(void *)&long long v36 = &v9[v33];
        goto LABEL_53;
      case 4u:
        if (v15)
        {
          *(void *)&long long v36 = &v9[v33];
          size_t v26 = v33 + strlen(&v9[v33]) + 1;
          *((void *)&v36 + 1) = &v9[v26];
          uint64_t v33 = v26 + strlen(&v9[v26]) + 1;
        }
LABEL_31:
        *(void *)&long long v37 = v2_readVInt64((uint64_t)v9, &v33);
        break;
      case 5u:
        *(double *)&long long v36 = (double)v2_readVInt64((uint64_t)v9, &v33);
        break;
      case 6u:
      case 0xAu:
        uint64_t v17 = v33 + 1;
        unsigned int v18 = v9[v33];
        if (v9[v33] < 0)
        {
          if (v18 > 0xBF)
          {
            if (v18 > 0xDF)
            {
              if (v18 > 0xEF)
              {
                unsigned int v18 = *(_DWORD *)&v9[v17];
                uint64_t v17 = v33 + 5;
              }
              else
              {
                unsigned int v18 = ((v18 & 0xF) << 24) | (v9[v17] << 16) | (v9[v33 + 2] << 8) | v9[v33 + 3];
                uint64_t v17 = v33 + 4;
              }
            }
            else
            {
              unsigned int v18 = ((v18 & 0x1F) << 16) | (v9[v17] << 8) | v9[v33 + 2];
              uint64_t v17 = v33 + 3;
            }
          }
          else
          {
            int v19 = v9[v17] | ((v18 & 0x3F) << 8);
            uint64_t v17 = v33 + 2;
            unsigned int v18 = v19;
          }
        }
        uint64_t v33 = v17;
        LODWORD(v35) = v18;
        break;
      case 7u:
        *(void *)&long long v36 = &v9[v33];
        size_t v27 = v33 + strlen(&v9[v33]) + 1;
        *((void *)&v36 + 1) = &v9[v27];
        uint64_t v33 = v27 + strlen(&v9[v27]) + 1;
        unint64_t v28 = v2_readVInt64((uint64_t)v9, &v33);
        size_t v24 = v33;
        *(void *)&long long v37 = v28;
        *((void *)&v37 + 1) = &v9[v33];
        v25 = &v9[v33];
        goto LABEL_53;
      case 8u:
        *(double *)&long long v36 = (double)v2_readVInt64((uint64_t)v9, &v33);
        *((void *)&v36 + 1) = v2_readVInt64((uint64_t)v9, &v33);
        *(void *)&long long v37 = "";
        if (v16 == 20 || v16 == 47)
        {
          size_t v24 = v33;
          if (v9[v33] != 47) {
            break;
          }
        }
        else
        {
LABEL_51:
          size_t v24 = v33;
        }
LABEL_52:
        v25 = &v9[v24];
        *(void *)&long long v37 = &v9[v24];
LABEL_53:
        uint64_t v33 = v24 + strlen(v25) + 1;
        break;
      case 9u:
        break;
      case 0xBu:
        *(double *)&long long v36 = (double)v2_readVInt64((uint64_t)v9, &v33);
        *((void *)&v37 + 1) = v2_readVInt64((uint64_t)v9, &v33);
        unint64_t v38 = v2_readVInt64((uint64_t)v9, &v33);
        *((void *)&v36 + 1) = &v9[v33];
        size_t v24 = v33 + strlen(&v9[v33]) + 1;
        goto LABEL_52;
      default:
        fprintf(*v11, "### unknown type %d at offset %ld\n", v16, v33);
        uint64_t v33 = v8;
        goto LABEL_57;
    }
LABEL_54:
    v5[2](v5, &v34);
    int v29 = v34;
    if (v34 > 0x33 || ((1 << v34) & 0xC000000020000) == 0)
    {
      DWORD2(v35) = typeToEventDataType(v34);
      HIDWORD(v35) = v29;
    }
    goto LABEL_57;
  }
LABEL_58:
  munmap(v9, v8);
LABEL_62:
}

+ (void)_SKGEmbeddingTimeline:(id)a3 includePerf:(BOOL)a4 block:(id)a5
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  id v8 = a3;
  v9 = (char *)a5;
  uint64_t v76 = 0;
  v77 = &v76;
  uint64_t v78 = 0x7810000000;
  v79 = &unk_25E35E1B7;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  uint64_t v85 = 0;
  LOBYTE(v84) = 1;
  uint64_t v66 = 0;
  v67 = &v66;
  uint64_t v68 = 0x7810000000;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  v69 = &unk_25E35E1B7;
  uint64_t v75 = 0;
  id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v62 = 0;
  v63 = &v62;
  uint64_t v64 = 0x2020000000;
  uint64_t v65 = 0;
  uint64_t v58 = 0;
  v59 = (double *)&v58;
  uint64_t v60 = 0x2020000000;
  uint64_t v61 = 0;
  id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x2020000000;
  uint64_t v57 = 0;
  uint64_t v50 = 0;
  v51 = (double *)&v50;
  uint64_t v52 = 0x2020000000;
  uint64_t v53 = 0;
  uint64_t v12 = objc_alloc_init(EventCollector);
  unsigned int v13 = objc_alloc_init(EventCollector);
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x2020000000;
  char v49 = 1;
  int v14 = (void (**)(char *, char *))(v9 + 16);
  (*((void (**)(char *, const char *))v9 + 2))(v9, "Type, from_date_time, to_date_time, elapsed_time_secs, handled, skipped, processed, indexed, index_error, index_timeout, efficiency(max 36k/h), cancelFlag");
  id v15 = v8;
  uint64_t v16 = [v15 UTF8String];
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __69__SKGActivityJournalDecoder__SKGEmbeddingTimeline_includePerf_block___block_invoke;
  v32[3] = &unk_265520EB0;
  unint64_t v38 = &v76;
  v39 = &v66;
  id v17 = v10;
  id v33 = v17;
  v40 = &v58;
  v41 = &v62;
  unsigned int v18 = v9;
  long long v37 = v18;
  BOOL v45 = a4;
  int v19 = v12;
  long long v34 = v19;
  v42 = &v46;
  id v20 = v11;
  id v35 = v20;
  v43 = &v50;
  v44 = &v54;
  uint64_t v21 = v13;
  long long v36 = v21;
  [a1 SKGActivityJournalPlayback:v16 block:v32];
  if (!*((unsigned char *)v47 + 24))
  {
    bzero(v86, 0x400uLL);
    createReportLine((uint64_t)(v77 + 4), v86);
    (*v14)(v18, v86);
    createReportLine((uint64_t)(v67 + 4), v86);
    (*v14)(v18, v86);
  }
  unsigned int v22 = [(EventCollector *)v19 collectedData];
  BOOL v23 = [v22 count] == 0;

  if (!v23)
  {
    (*v14)(v18, "---------------Profiling---------------");
    [(EventCollector *)v19 printResultsWithBlock:v18];
    (*v14)(v18, "------------------end------------------");
  }
  (*v14)(v18, "");
  size_t v24 = [(EventCollector *)v21 collectedData];
  BOOL v25 = [v24 count] == 0;

  if (!v25)
  {
    (*v14)(v18, "---------------Profiling---------------");
    [(EventCollector *)v21 printResultsWithBlock:v18];
    (*v14)(v18, "------------------end------------------");
  }
  (*v14)(v18, "");
  bzero(v86, 0x400uLL);
  uint64_t v31 = 0;
  memset(v30, 0, sizeof(v30));
  NewAggregateStats(v17, (uint64_t)v30);
  (*v14)(v18, "---------------BG Task Emb Efficiency---------------");
  __sprintf_chk(v86, 0, 0x400uLL, "Total BG embeddings generated: %llu", v63[3]);
  (*v14)(v18, v86);
  __sprintf_chk(v86, 0, 0x400uLL, "Total BG runtime granted: %fs", v59[3]);
  (*v14)(v18, v86);
  double v26 = (double)(unint64_t)v63[3] / v59[3] * 60.0 * 60.0;
  __sprintf_chk(v86, 0, 0x400uLL, "Overall BG emb throughput(items/hr): %.2f", v26);
  (*v14)(v18, v86);
  __sprintf_chk(v86, 0, 0x400uLL, "Overall BG emb efficiency(max 36k): %.2f", v26 / 36000.0);
  (*v14)(v18, v86);
  (*v14)(v18, "");
  PrintAggregateStats((double *)v30, v18);
  (*v14)(v18, "---------------BG Task Emb Efficiency End---------------\n");
  uint64_t v29 = 0;
  memset(v28, 0, sizeof(v28));
  NewAggregateStats(v20, (uint64_t)v28);
  (*v14)(v18, "---------------PRI Task Emb Efficiency---------------");
  __sprintf_chk(v86, 0, 0x400uLL, "Total PRI embeddings generated: %llu", v55[3]);
  (*v14)(v18, v86);
  __sprintf_chk(v86, 0, 0x400uLL, "Total PRI runtime granted: %fs", v51[3]);
  (*v14)(v18, v86);
  double v27 = (double)(unint64_t)v55[3] / v51[3] * 60.0 * 60.0;
  __sprintf_chk(v86, 0, 0x400uLL, "Overall PRI emb throughput(items/hr): %.2f", v27);
  (*v14)(v18, v86);
  __sprintf_chk(v86, 0, 0x400uLL, "Overall PRI emb efficiency(max 36k): %.2f", v27 / 36000.0);
  (*v14)(v18, v86);
  (*v14)(v18, "");
  PrintAggregateStats((double *)v28, v18);
  (*v14)(v18, "---------------PRI Task Emb Efficiency End---------------\n");

  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v54, 8);

  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(&v62, 8);

  _Block_object_dispose(&v66, 8);
  _Block_object_dispose(&v76, 8);
}

void __69__SKGActivityJournalDecoder__SKGEmbeddingTimeline_includePerf_block___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  bzero(v37, 0x400uLL);
  int v4 = *(_DWORD *)a2;
  if (*(int *)a2 > 36)
  {
    if (v4 != 37)
    {
      if (v4 == 38)
      {
        *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 88) = *(void *)(a2 + 32);
        uint64_t v14 = *(void *)(*(void *)(a1 + 80) + 8);
        double v15 = *(double *)(v14 + 88) - *(double *)(v14 + 80);
        *(double *)(v14 + 112) = v15;
        double v16 = 0.0;
        if (v15 > 0.0)
        {
          unint64_t v17 = *(void *)(v14 + 48);
          if (v17) {
            double v16 = (double)v17 / v15 * 60.0 * 60.0;
          }
        }
        *(double *)(v14 + 104) = v16;
        unsigned int v18 = *(void **)(a1 + 48);
        int v19 = [NSNumber numberWithDouble:*(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 104) / 36000.0];
        [v18 addObject:v19];

        *(double *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 80) + 8)
                                                                                 + 112)
                                                                     + *(double *)(*(void *)(*(void *)(a1 + 112)
                                                                                             + 8)
                                                                                 + 24);
        *(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 24) += *(void *)(*(void *)(*(void *)(a1 + 80)
                                                                                              + 8)
                                                                                  + 48);
        createReportLine(*(void *)(*(void *)(a1 + 80) + 8) + 32, v37);
        (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
        if (*(unsigned char *)(a1 + 128))
        {
          id v20 = [*(id *)(a1 + 56) collectedData];
          uint64_t v21 = [v20 count];

          if (v21)
          {
            (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
            [*(id *)(a1 + 56) printResultsWithBlock:*(void *)(a1 + 64)];
            (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
          }
          (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
          [*(id *)(a1 + 56) clear];
        }
        uint64_t v13 = *(void *)(a1 + 80);
        goto LABEL_22;
      }
      goto LABEL_27;
    }
    uint64_t v23 = *(void *)(a2 + 32);
    uint64_t v24 = *(void *)(a1 + 80);
LABEL_25:
    *(void *)(*(void *)(v24 + 8) + 80) = v23;
    return;
  }
  if (v4 == 15)
  {
    uint64_t v23 = *(void *)(a2 + 32);
    uint64_t v24 = *(void *)(a1 + 72);
    goto LABEL_25;
  }
  if (v4 == 16)
  {
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 88) = *(void *)(a2 + 32);
    uint64_t v5 = *(void *)(*(void *)(a1 + 72) + 8);
    double v6 = *(double *)(v5 + 88) - *(double *)(v5 + 80);
    *(double *)(v5 + 112) = v6;
    double v7 = 0.0;
    if (v6 > 0.0)
    {
      unint64_t v8 = *(void *)(v5 + 48);
      if (v8) {
        double v7 = (double)v8 / v6 * 60.0 * 60.0;
      }
    }
    *(double *)(v5 + 104) = v7;
    v9 = *(void **)(a1 + 32);
    id v10 = [NSNumber numberWithDouble:*(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 104) / 36000.0];
    [v9 addObject:v10];

    *(double *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                            + 112)
                                                                + *(double *)(*(void *)(*(void *)(a1 + 88) + 8)
                                                                            + 24);
    *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) += *(void *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                             + 48);
    createReportLine(*(void *)(*(void *)(a1 + 72) + 8) + 32, v37);
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    if (*(unsigned char *)(a1 + 128))
    {
      id v11 = [*(id *)(a1 + 40) collectedData];
      uint64_t v12 = [v11 count];

      if (v12)
      {
        (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
        [*(id *)(a1 + 40) printResultsWithBlock:*(void *)(a1 + 64)];
        (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
      }
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
      [*(id *)(a1 + 40) clear];
    }
    uint64_t v13 = *(void *)(a1 + 72);
LABEL_22:
    uint64_t v22 = *(void *)(v13 + 8);
    *(void *)(v22 + 104) = 0;
    *(unsigned char *)(v22 + 97) = 0;
    *(_OWORD *)(v22 + 32) = 0u;
    *(_OWORD *)(v22 + 48) = 0u;
    *(_OWORD *)(v22 + 64) = 0u;
    *(_OWORD *)(v22 + 80) = 0u;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = 1;
    return;
  }
LABEL_27:
  *(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = 0;
  switch(v4)
  {
    case 13:
      uint64_t v25 = *(void *)(a1 + 72);
      goto LABEL_33;
    case 18:
      uint64_t v26 = *(void *)(a1 + 72);
      goto LABEL_31;
    case 21:
      uint64_t v26 = *(void *)(a1 + 80);
LABEL_31:
      ++*(void *)(*(void *)(v26 + 8) + 32);
      return;
    case 24:
      uint64_t v25 = *(void *)(a1 + 80);
LABEL_33:
      ++*(void *)(*(void *)(v25 + 8) + 56);
      return;
    case 25:
      uint64_t v27 = *(void *)(a1 + 80);
      goto LABEL_45;
    case 26:
      uint64_t v28 = *(void *)(a1 + 80);
      goto LABEL_43;
    case 29:
      uint64_t v29 = *(void *)(a1 + 80);
      goto LABEL_39;
    case 30:
      uint64_t v30 = *(void *)(a1 + 80);
      goto LABEL_41;
    case 31:
      uint64_t v29 = *(void *)(a1 + 72);
LABEL_39:
      ++*(void *)(*(void *)(v29 + 8) + 72);
      return;
    case 32:
      uint64_t v30 = *(void *)(a1 + 72);
LABEL_41:
      ++*(void *)(*(void *)(v30 + 8) + 64);
      return;
    case 33:
      uint64_t v28 = *(void *)(a1 + 72);
LABEL_43:
      ++*(void *)(*(void *)(v28 + 8) + 48);
      return;
    case 34:
      uint64_t v27 = *(void *)(a1 + 72);
LABEL_45:
      ++*(void *)(*(void *)(v27 + 8) + 40);
      return;
    case 35:
      uint64_t v31 = *(void *)(a1 + 72);
      goto LABEL_48;
    case 36:
      uint64_t v31 = *(void *)(a1 + 80);
LABEL_48:
      *(unsigned char *)(*(void *)(v31 + 8) + 97) = 1;
      return;
    case 46:
      if (!*(unsigned char *)(a1 + 128)) {
        return;
      }
      uint64_t v32 = *(void *)(a2 + 56);
      uint64_t v33 = *(void *)(a2 + 64);
      if (v32 == 2)
      {
        long long v34 = *(void **)(a1 + 56);
      }
      else
      {
        if (v32 != 1) {
          return;
        }
        long long v34 = *(void **)(a1 + 40);
      }
      id v36 = [NSString stringWithUTF8String:*(void *)(a2 + 40)];
      id v35 = [NSString stringWithUTF8String:*(void *)(a2 + 48)];
      [v34 handleEventWithStr1:v36 str2:v35 num:v33];

      break;
    default:
      return;
  }
}

+ (void)_SKGEmbeddingXPCTimeline:(id)a3 updater:(id)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  Calendar = getCalendar();
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy_;
  v34[4] = __Block_byref_object_dispose_;
  id v35 = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy_;
  void v32[4] = __Block_byref_object_dispose_;
  id v33 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  char v31 = 1;
  uint64_t v12 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"%20s %10s %10s %10s %10s %10s", "timestamp", "cp_a", "cp_b", "cp_c", "cp_cx", "Priority");
  v10[2](v10, v13);
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy_;
  _OWORD v28[4] = __Block_byref_object_dispose_;
  id v29 = 0;
  id v14 = v8;
  uint64_t v15 = [v14 UTF8String];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __68__SKGActivityJournalDecoder__SKGEmbeddingXPCTimeline_updater_block___block_invoke;
  v19[3] = &unk_265520ED8;
  uint64_t v27 = Calendar;
  id v16 = v12;
  id v20 = v16;
  uint64_t v23 = v28;
  unint64_t v17 = v10;
  uint64_t v22 = v17;
  uint64_t v24 = v30;
  uint64_t v25 = v34;
  uint64_t v26 = v32;
  id v18 = v9;
  id v21 = v18;
  [a1 SKGActivityJournalPlayback:v15 block:v19];

  _Block_object_dispose(v28, 8);
  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v32, 8);

  _Block_object_dispose(v34, 8);
}

void __68__SKGActivityJournalDecoder__SKGEmbeddingXPCTimeline_updater_block___block_invoke(uint64_t a1, int *a2)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  bzero(v30, 0x400uLL);
  int v4 = *a2;
  if ((*a2 - 40) >= 3)
  {
    if (v4 == 43)
    {
      uint64_t v23 = [NSString stringWithCString:*((void *)a2 + 4) encoding:4];
      uint64_t v24 = *(void *)(*(void *)(a1 + 72) + 8);
      uint64_t v25 = *(void **)(v24 + 40);
      *(void *)(v24 + 40) = v23;

      uint64_t v26 = [NSString stringWithCString:*((void *)a2 + 5) encoding:4];
      uint64_t v27 = *(void *)(*(void *)(a1 + 80) + 8);
      uint64_t v28 = *(void **)(v27 + 40);
      *(void *)(v27 + 40) = v26;

      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    }
    else if (v4 == 51 && !*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
    {
      if (a2[7] == 43
        && [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) containsString:*(void *)(a1 + 40)])
      {
        uint64_t v20 = a2[4];
        id v21 = *(void **)(a1 + 32);
        uint64_t v22 = [NSNumber numberWithUnsignedInt:v20];
        [v21 setValue:v22 forKey:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    }
  }
  else
  {
    getDateString(*(__CFCalendar **)(a1 + 88), v30, 0x400uLL, *((CFAbsoluteTime *)a2 + 4));
    id v29 = NSString;
    uint64_t v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"cs_pc_a"];
    uint64_t v6 = [v5 unsignedIntValue];
    double v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"cs_pc_b"];
    uint64_t v8 = [v7 unsignedIntValue];
    id v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"cs_pc_c"];
    uint64_t v10 = [v9 unsignedIntValue];
    id v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"cs_pc_cx"];
    uint64_t v12 = [v11 unsignedIntValue];
    uint64_t v13 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"cs_priority"];
    id v14 = objc_msgSend(v29, "stringWithFormat:", @"%10u %10u %10u %10u %10u", v6, v8, v10, v12, objc_msgSend(v13, "unsignedIntValue"));

    if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)
      || (objc_msgSend(v14, "isEqualToString:") & 1) == 0)
    {
      uint64_t v15 = *(void *)(a1 + 48);
      id v16 = [NSString stringWithFormat:@"%20s %@", v30, v14];
      (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v16);

      uint64_t v17 = [v14 copy];
      uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 8);
      int v19 = *(void **)(v18 + 40);
      *(void *)(v18 + 40) = v17;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  }
}

+ (void)_SKGEmbeddingTimelineDump:(id)a3 includePerf:(BOOL)a4 dst:(__sFILE *)a5
{
  BOOL v6 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __71__SKGActivityJournalDecoder__SKGEmbeddingTimelineDump_includePerf_dst___block_invoke;
  v11[3] = &__block_descriptor_40_e8_v16__0_8l;
  v11[4] = a5;
  id v8 = a3;
  [a1 _SKGEmbeddingTimeline:v8 includePerf:v6 block:v11];
  fwrite("------------------------- Embedding Journal Queue Timeline -------------------------------\n", 0x5BuLL, 1uLL, a5);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __71__SKGActivityJournalDecoder__SKGEmbeddingTimelineDump_includePerf_dst___block_invoke_2;
  v10[3] = &__block_descriptor_40_e18_v16__0__NSString_8l;
  v10[4] = a5;
  [a1 _SKGEmbeddingXPCTimeline:v8 updater:@"embedding" block:v10];
  fwrite("------------------------- Priority Journal Queue Timeline -------------------------------\n", 0x5AuLL, 1uLL, a5);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __71__SKGActivityJournalDecoder__SKGEmbeddingTimelineDump_includePerf_dst___block_invoke_3;
  v9[3] = &__block_descriptor_40_e18_v16__0__NSString_8l;
  v9[4] = a5;
  [a1 _SKGEmbeddingXPCTimeline:v8 updater:@"priority" block:v9];
}

uint64_t __71__SKGActivityJournalDecoder__SKGEmbeddingTimelineDump_includePerf_dst___block_invoke(uint64_t a1, char *a2)
{
  fputs(a2, *(FILE **)(a1 + 32));
  v3 = *(FILE **)(a1 + 32);
  return fputc(10, v3);
}

uint64_t __71__SKGActivityJournalDecoder__SKGEmbeddingTimelineDump_includePerf_dst___block_invoke_2(uint64_t a1, id a2)
{
  fputs((const char *)[a2 UTF8String], *(FILE **)(a1 + 32));
  v3 = *(FILE **)(a1 + 32);
  return fputc(10, v3);
}

uint64_t __71__SKGActivityJournalDecoder__SKGEmbeddingTimelineDump_includePerf_dst___block_invoke_3(uint64_t a1, id a2)
{
  fputs((const char *)[a2 UTF8String], *(FILE **)(a1 + 32));
  v3 = *(FILE **)(a1 + 32);
  return fputc(10, v3);
}

+ (void)_SKGActivityDump:(id)a3 dst:(__sFILE *)a4
{
  id v6 = a3;
  Calendar = getCalendar();
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  id v8 = v6;
  uint64_t v9 = [v8 UTF8String];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __50__SKGActivityJournalDecoder__SKGActivityDump_dst___block_invoke;
  v10[3] = &unk_265520F40;
  v10[7] = a4;
  v10[8] = Calendar;
  v10[4] = &v11;
  void v10[5] = &v19;
  v10[6] = &v15;
  [a1 SKGActivityJournalPlayback:v9 block:v10];
  fprintf(a4, "\nTotal: embCountFromPriorityUpdater:%llu priorityCountFromPriorityUpdater:%llu skipCountFromPriorityUpdater:%llu \n", v20[3], v16[3], v12[3]);
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
}

uint64_t __50__SKGActivityJournalDecoder__SKGActivityDump_dst___block_invoke(uint64_t a1, unsigned int *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  int v4 = *a2;
  uint64_t v5 = *a2;
  switch(*a2)
  {
    case 1u:
    case 2u:
    case 3u:
    case 4u:
    case 5u:
    case 6u:
    case 7u:
    case 8u:
    case 9u:
    case 0xAu:
    case 0xBu:
    case 0xCu:
    case 0xDu:
    case 0xEu:
    case 0xFu:
    case 0x10u:
    case 0x12u:
    case 0x13u:
    case 0x15u:
    case 0x16u:
    case 0x17u:
    case 0x18u:
    case 0x19u:
    case 0x1Au:
    case 0x1Bu:
    case 0x1Du:
    case 0x1Eu:
    case 0x1Fu:
    case 0x20u:
    case 0x21u:
    case 0x22u:
    case 0x23u:
    case 0x24u:
    case 0x25u:
    case 0x26u:
    case 0x27u:
    case 0x28u:
    case 0x29u:
    case 0x2Au:
    case 0x2Bu:
    case 0x2Cu:
    case 0x2Du:
    case 0x2Eu:
    case 0x36u:
      goto LABEL_6;
    case 0x11u:
      break;
    case 0x14u:
    case 0x1Cu:
    case 0x2Fu:
    case 0x30u:
    case 0x31u:
    case 0x34u:
    case 0x35u:
LABEL_3:
      uint64_t v5 = *a2;
      if ((v4 & 0xFFFFFFFE) == 0x32) {
        break;
      }
LABEL_6:
      fputc(10, *(FILE **)(a1 + 56));
      uint64_t v5 = *a2;
      break;
    case 0x32u:
    case 0x33u:
      uint64_t v5 = *a2;
      break;
    default:
      switch(v4)
      {
        case 200:
        case 201:
        case 202:
        case 203:
        case 204:
        case 205:
        case 206:
        case 207:
        case 208:
        case 209:
        case 210:
          goto LABEL_6;
        default:
          goto LABEL_3;
      }
  }
  memset(v19, 0, sizeof(v19));
  uint64_t result = typeToEventDataType(v5);
  switch((int)result)
  {
    case 1:
      double v7 = *(FILE **)(a1 + 56);
      getDateString(*(__CFCalendar **)(a1 + 64), (char *)v19, 0x200uLL, *((CFAbsoluteTime *)a2 + 5));
      return fprintf(v7, "%s pid: %d time: %ssbuild: %s ");
    case 2:
      id v8 = *(FILE **)(a1 + 56);
      getDateString(*(__CFCalendar **)(a1 + 64), (char *)v19, 0x200uLL, *((CFAbsoluteTime *)a2 + 4));
      return fprintf(v8, "Journal was reset at time %s, size before reset: %llu, size after reset: %llu ");
    case 3:
      return fprintf(*(FILE **)(a1 + 56), "%s: %s ");
    case 4:
      if (v4 == 25) {
        ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
      }
      if (!*((unsigned char *)a2 + 20)) {
        return fprintf(*(FILE **)(a1 + 56), "%s for item - oid: 0x%llx ");
      }
      BOOL v9 = isVerboseEvent(v4);
      uint64_t v10 = *(FILE **)(a1 + 56);
      if (!v9) {
        return fprintf(v10, "%s for item - bundle: %s identifier: %s oid: 0x%llx ");
      }
      getDateString(*(__CFCalendar **)(a1 + 64), (char *)v19, 0x200uLL, *((CFAbsoluteTime *)a2 + 1));
      return fprintf(v10, "%s at time %s for item - bundle: %s identifier: %s oid: 0x%llx ");
    case 5:
      uint64_t v11 = *(FILE **)(a1 + 56);
      getDateString(*(__CFCalendar **)(a1 + 64), (char *)v19, 0x200uLL, *((CFAbsoluteTime *)a2 + 4));
      return fprintf(v11, "%s at time %s ");
    case 6:
      uint64_t v12 = *(FILE **)(a1 + 56);
      return fprintf(v12, "%s: %d ");
    case 7:
      uint64_t v13 = *(FILE **)(a1 + 56);
      getDateString(*(__CFCalendar **)(a1 + 64), (char *)v19, 0x200uLL, *((CFAbsoluteTime *)a2 + 1));
      return fprintf(v13, "%s at time %s for item - bundle: %s identifier: %s oid: 0x%llx info:%s ");
    case 8:
      uint64_t v14 = *(FILE **)(a1 + 56);
      getDateString(*(__CFCalendar **)(a1 + 64), (char *)v19, 0x200uLL, *((CFAbsoluteTime *)a2 + 4));
      return fprintf(v14, "%s at time(s) %s - path:%s size: %llu ");
    case 9:
      return fprintf(*(FILE **)(a1 + 56), "%s ");
    case 10:
      unsigned int v15 = a2[7];
      if (v15 == 26)
      {
        uint64_t v16 = a2[4];
        uint64_t v17 = *(void *)(a1 + 40);
      }
      else
      {
        if (v15 != 27) {
          goto LABEL_28;
        }
        uint64_t v16 = a2[4];
        uint64_t v17 = *(void *)(a1 + 48);
      }
      *(void *)(*(void *)(v17 + 8) + 24) += v16;
LABEL_28:
      uint64_t v12 = *(FILE **)(a1 + 56);
      return fprintf(v12, "%s: %d ");
    case 11:
      uint64_t v18 = *(FILE **)(a1 + 56);
      getDateString(*(__CFCalendar **)(a1 + 64), (char *)v19, 0x200uLL, *((CFAbsoluteTime *)a2 + 4));
      return fprintf(v18, "%s: time: %s str1: %s str2: %s num1: %llu num2: %llu");
    default:
      return result;
  }
}

@end