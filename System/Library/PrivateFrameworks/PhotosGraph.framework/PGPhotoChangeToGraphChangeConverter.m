@interface PGPhotoChangeToGraphChangeConverter
+ (id)managedEntityNamesToTranslate;
- (PGPhotoChangeToGraphChangeConverter)initWithPhotoLibrary:(id)a3 loggingConnection:(id)a4;
- (id)graphChangesWithPhotoChange:(id)a3 progressBlock:(id)a4;
- (void)_registerTranslatorsWithPhotoLibrary:(id)a3;
@end

@implementation PGPhotoChangeToGraphChangeConverter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_entityTranslatorByEntityClassName, 0);
}

- (id)graphChangesWithPhotoChange:(id)a3 progressBlock:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = _Block_copy(v7);
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  uint64_t v29 = 0;
  v30 = (double *)&v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0;
  if (v8
    && (double v9 = CFAbsoluteTimeGetCurrent(), v9 - v30[3] >= 0.01)
    && (v30[3] = v9,
        char v28 = 0,
        (*((void (**)(void *, char *, double))v8 + 2))(v8, &v28, 0.0),
        char v10 = *((unsigned char *)v34 + 24) | v28,
        (*((unsigned char *)v34 + 24) = v10) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v38 = 70;
      *(_WORD *)&v38[4] = 2080;
      *(void *)&v38[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Core/PGPhotoChangeToGraphChangeConverter.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    id v11 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v38 = v6;
      _os_log_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_INFO, "PGPhotoChangeToGraphChangeConverter: handling change %@", buf, 0xCu);
    }
    v13 = [MEMORY[0x1E4F1CA48] array];
    entityTranslatorByEntityClassName = self->_entityTranslatorByEntityClassName;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __81__PGPhotoChangeToGraphChangeConverter_graphChangesWithPhotoChange_progressBlock___block_invoke;
    v20[3] = &unk_1E68EA0C0;
    v20[4] = self;
    id v21 = v6;
    id v23 = v7;
    id v15 = v13;
    id v22 = v15;
    id v16 = v8;
    id v24 = v16;
    v25 = &v29;
    long long v27 = xmmword_1D1F4F230;
    v26 = &v33;
    [(NSMutableDictionary *)entityTranslatorByEntityClassName enumerateKeysAndObjectsUsingBlock:v20];
    if (v8
      && (double Current = CFAbsoluteTimeGetCurrent(), Current - v30[3] >= 0.01)
      && (v30[3] = Current,
          char v28 = 0,
          (*((void (**)(id, char *, double))v16 + 2))(v16, &v28, 1.0),
          char v18 = *((unsigned char *)v34 + 24) | v28,
          (*((unsigned char *)v34 + 24) = v18) != 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v38 = 172;
        *(_WORD *)&v38[4] = 2080;
        *(void *)&v38[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Core/PGPhotoChangeToGraphChangeConverter.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      id v11 = (id)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      id v11 = v15;
    }
  }
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);

  return v11;
}

void __81__PGPhotoChangeToGraphChangeConverter_graphChangesWithPhotoChange_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v116 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  v89 = v6;
  Class v8 = NSClassFromString(v6);
  double v9 = *(id *)(*(void *)(a1 + 32) + 16);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)v111 = v6;
    _os_log_impl(&dword_1D1805000, v9, OS_LOG_TYPE_INFO, "PGPhotoChangeToGraphChangeConverter: handling entity %@", buf, 0xCu);
  }
  v87 = v7;

  char v10 = *(id *)(*(void *)(a1 + 32) + 16);
  os_signpost_id_t v11 = os_signpost_id_generate(v10);
  v12 = v10;
  v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "ChangedLocalIdentifiersForEntityClass", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v14 = mach_absolute_time();
  v88 = [*(id *)(a1 + 40) changedLocalIdentifiersForEntityClass:v8];
  uint64_t v15 = mach_absolute_time();
  mach_timebase_info v16 = info;
  v17 = v13;
  char v18 = v17;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v18, OS_SIGNPOST_INTERVAL_END, v11, "ChangedLocalIdentifiersForEntityClass", "", buf, 2u);
  }

  v19 = v18;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)v111 = "ChangedLocalIdentifiersForEntityClass";
    *(_WORD *)&v111[8] = 2048;
    double v112 = (float)((float)((float)((float)(v15 - v14) * (float)v16.numer) / (float)v16.denom) / 1000000.0);
    _os_log_impl(&dword_1D1805000, v19, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  v20 = v88;
  id v21 = [v88 objectForKeyedSubscript:*MEMORY[0x1E4F39728]];
  id v22 = [v88 objectForKeyedSubscript:*MEMORY[0x1E4F39600]];
  id v23 = [v88 objectForKeyedSubscript:*MEMORY[0x1E4F39840]];
  v91 = v21;
  uint64_t v24 = [v21 count];
  v90 = v22;
  uint64_t v25 = [v22 count];
  v86 = v23;
  uint64_t v26 = [v23 count];
  long long v27 = *(id *)(*(void *)(a1 + 32) + 16);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)v111 = v24;
    *(_WORD *)&v111[4] = 1024;
    *(_DWORD *)&v111[6] = v25;
    LOWORD(v112) = 1024;
    *(_DWORD *)((char *)&v112 + 2) = v26;
    _os_log_impl(&dword_1D1805000, v27, OS_LOG_TYPE_INFO, "PGPhotoChangeToGraphChangeConverter: %d insertions, %d deletions, %d updates", buf, 0x14u);
  }

  char v28 = v87;
  if (v24)
  {
    uint64_t v29 = [v87 graphChangesForInsertedLocalIdentifiers:v91 progressBlock:*(void *)(a1 + 56)];
    if (v29) {
      [*(id *)(a1 + 48) addObjectsFromArray:v29];
    }
  }
  if (*(void *)(a1 + 64))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v31 = *(void *)(*(void *)(a1 + 72) + 8);
    if (Current - *(double *)(v31 + 24) >= *(double *)(a1 + 88))
    {
      *(double *)(v31 + 24) = Current;
      buf[0] = 0;
      (*(void (**)(double))(*(void *)(a1 + 64) + 16))(*(double *)(a1 + 96));
      *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) |= buf[0];
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)) {
        goto LABEL_82;
      }
    }
  }
  if (v25)
  {
    uint64_t v32 = [v87 graphChangesForDeletedLocalIdentifiers:v90 progressBlock:*(void *)(a1 + 56)];
    if (v32) {
      [*(id *)(a1 + 48) addObjectsFromArray:v32];
    }
  }
  if (*(void *)(a1 + 64))
  {
    double v33 = CFAbsoluteTimeGetCurrent();
    uint64_t v34 = *(void *)(*(void *)(a1 + 72) + 8);
    if (v33 - *(double *)(v34 + 24) >= *(double *)(a1 + 88))
    {
      *(double *)(v34 + 24) = v33;
      buf[0] = 0;
      (*(void (**)(double))(*(void *)(a1 + 64) + 16))(*(double *)(a1 + 96));
      *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) |= buf[0];
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)) {
        goto LABEL_82;
      }
    }
  }
  if (!v26) {
    goto LABEL_86;
  }
  v84 = v19;
  v92 = [MEMORY[0x1E4F1CAD0] set];
  uint64_t v35 = [MEMORY[0x1E4F1CA60] dictionary];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__PGPhotoChangeToGraphChangeConverter_graphChangesWithPhotoChange_progressBlock___block_invoke_202;
  aBlock[3] = &unk_1E68EA098;
  id v104 = v87;
  id v36 = v35;
  id v105 = v36;
  id v106 = *(id *)(a1 + 40);
  id v108 = *(id *)(a1 + 56);
  id v107 = *(id *)(a1 + 48);
  v96 = (void (**)(void))_Block_copy(aBlock);
  long long v99 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  id obj = v86;
  uint64_t v37 = [obj countByEnumeratingWithState:&v99 objects:v115 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v100;
    v94 = v8;
    uint64_t v93 = *(void *)v100;
    while (2)
    {
      uint64_t v40 = 0;
      uint64_t v95 = v38;
      do
      {
        if (*(void *)v100 != v39) {
          objc_enumerationMutation(obj);
        }
        uint64_t v41 = *(void *)(*((void *)&v99 + 1) + 8 * v40);
        v42 = [*(id *)(a1 + 40) changedPropertyNamesForLocalIdentifier:v41 entityClass:v8];
        uint64_t v43 = [v42 count];
        v44 = v42;
        if (v43
          || [(id)objc_opt_class() includesRelationshipChanges]
          && (int v45 = [*(id *)(a1 + 40) hasRelationshipChangesForLocalIdentifier:v41], v44 = v92, v45))
        {
          [v36 setObject:v44 forKeyedSubscript:v41];
        }
        unint64_t v46 = objc_msgSend(v36, "count", v44);
        if (v46 >= 0xC8)
        {
          unint64_t v47 = v46;
          if (*(void *)(a1 + 64))
          {
            double v48 = CFAbsoluteTimeGetCurrent();
            uint64_t v49 = *(void *)(*(void *)(a1 + 72) + 8);
            if (v48 - *(double *)(v49 + 24) >= *(double *)(a1 + 88))
            {
              *(double *)(v49 + 24) = v48;
              buf[0] = 0;
              (*(void (**)(double))(*(void *)(a1 + 64) + 16))(*(double *)(a1 + 96));
              *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) |= buf[0];
              if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
              {
                *a4 = 1;
LABEL_62:

                int v68 = 0;
                goto LABEL_77;
              }
            }
          }
          uint64_t v50 = a1;
          v51 = *(id *)(*(void *)(a1 + 32) + 16);
          os_signpost_id_t v52 = os_signpost_id_generate(v51);
          v53 = v51;
          v54 = v53;
          if (v52 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v53))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1D1805000, v54, OS_SIGNPOST_INTERVAL_BEGIN, v52, "ProcessChangedPropertyNames", "", buf, 2u);
          }

          mach_timebase_info v98 = 0;
          mach_timebase_info(&v98);
          uint64_t v55 = mach_absolute_time();
          v96[2]();
          uint64_t v56 = mach_absolute_time();
          mach_timebase_info v57 = v98;
          v58 = v54;
          v59 = v58;
          if (v52 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v58))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)v111 = v47;
            _os_signpost_emit_with_name_impl(&dword_1D1805000, v59, OS_SIGNPOST_INTERVAL_END, v52, "ProcessChangedPropertyNames", "%d entities", buf, 8u);
          }

          v60 = v59;
          if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(NSString, "stringWithFormat:", @"%d entities", v47);
            double v61 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
            *(_DWORD *)buf = 136315650;
            *(void *)v111 = "ProcessChangedPropertyNames";
            *(_WORD *)&v111[8] = 2112;
            double v112 = v61;
            __int16 v113 = 2048;
            double v114 = (float)((float)((float)((float)(v56 - v55) * (float)v57.numer) / (float)v57.denom) / 1000000.0);
            _os_log_impl(&dword_1D1805000, v60, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", buf, 0x20u);
          }
          a1 = v50;
          Class v8 = v94;
          if (*(void *)(v50 + 64))
          {
            double v62 = CFAbsoluteTimeGetCurrent();
            uint64_t v63 = *(void *)(*(void *)(v50 + 72) + 8);
            if (v62 - *(double *)(v63 + 24) >= *(double *)(v50 + 88))
            {
              *(double *)(v63 + 24) = v62;
              buf[0] = 0;
              (*(void (**)(double))(*(void *)(v50 + 64) + 16))(*(double *)(v50 + 96));
              *(unsigned char *)(*(void *)(*(void *)(v50 + 80) + 8) + 24) |= buf[0];
              if (*(unsigned char *)(*(void *)(*(void *)(v50 + 80) + 8) + 24))
              {
                *a4 = 1;

                goto LABEL_62;
              }
            }
          }

          uint64_t v38 = v95;
          uint64_t v39 = v93;
        }

        ++v40;
      }
      while (v38 != v40);
      uint64_t v38 = [obj countByEnumeratingWithState:&v99 objects:v115 count:16];
      if (v38) {
        continue;
      }
      break;
    }
  }

  uint64_t v64 = [v36 count];
  if (v64)
  {
    uint64_t v65 = v64;
    if (!*(void *)(a1 + 64)) {
      goto LABEL_63;
    }
    double v66 = CFAbsoluteTimeGetCurrent();
    uint64_t v67 = *(void *)(*(void *)(a1 + 72) + 8);
    if (v66 - *(double *)(v67 + 24) < *(double *)(a1 + 88)) {
      goto LABEL_63;
    }
    *(double *)(v67 + 24) = v66;
    buf[0] = 0;
    (*(void (**)(double))(*(void *)(a1 + 64) + 16))(*(double *)(a1 + 96));
    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) |= buf[0];
    v20 = v88;
    v19 = v84;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
    {
      int v68 = 0;
      *a4 = 1;
    }
    else
    {
LABEL_63:
      v69 = *(id *)(*(void *)(a1 + 32) + 16);
      os_signpost_id_t v70 = os_signpost_id_generate(v69);
      v71 = v69;
      v72 = v71;
      if (v70 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v71))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v72, OS_SIGNPOST_INTERVAL_BEGIN, v70, "ProcessChangedPropertyNames", "", buf, 2u);
      }

      mach_timebase_info v98 = 0;
      mach_timebase_info(&v98);
      uint64_t v73 = mach_absolute_time();
      v96[2]();
      uint64_t v74 = mach_absolute_time();
      mach_timebase_info v75 = v98;
      v76 = v72;
      v77 = v76;
      if (v70 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v76))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v111 = v65;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v77, OS_SIGNPOST_INTERVAL_END, v70, "ProcessChangedPropertyNames", "%d entities", buf, 8u);
      }

      v78 = v77;
      if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(NSString, "stringWithFormat:", @"%d entities", v65);
        double v79 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        *(_DWORD *)buf = 136315650;
        *(void *)v111 = "ProcessChangedPropertyNames";
        *(_WORD *)&v111[8] = 2112;
        double v112 = v79;
        __int16 v113 = 2048;
        double v114 = (float)((float)((float)((float)(v74 - v73) * (float)v75.numer) / (float)v75.denom) / 1000000.0);
        _os_log_impl(&dword_1D1805000, v78, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", buf, 0x20u);
      }
      v20 = v88;
      v19 = v84;
      if (!*(void *)(a1 + 64)) {
        goto LABEL_75;
      }
      double v80 = CFAbsoluteTimeGetCurrent();
      uint64_t v81 = *(void *)(*(void *)(a1 + 72) + 8);
      if (v80 - *(double *)(v81 + 24) >= *(double *)(a1 + 88)
        && (*(double *)(v81 + 24) = v80,
            buf[0] = 0,
            (*(void (**)(double))(*(void *)(a1 + 64) + 16))(*(double *)(a1 + 96)),
            (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) |= buf[0]) != 0))
      {
        *a4 = 1;

        int v68 = 0;
      }
      else
      {
LABEL_75:

        int v68 = 1;
      }
    }
  }
  else
  {
    int v68 = 1;
LABEL_77:
    v20 = v88;
    v19 = v84;
  }

  char v28 = v87;
  if (v68)
  {
LABEL_86:
    if (*(void *)(a1 + 64))
    {
      double v82 = CFAbsoluteTimeGetCurrent();
      uint64_t v83 = *(void *)(*(void *)(a1 + 72) + 8);
      if (v82 - *(double *)(v83 + 24) >= *(double *)(a1 + 88))
      {
        *(double *)(v83 + 24) = v82;
        buf[0] = 0;
        (*(void (**)(double))(*(void *)(a1 + 64) + 16))(*(double *)(a1 + 96));
        *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) |= buf[0];
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)) {
LABEL_82:
        }
          *a4 = 1;
      }
    }
  }
}

void __81__PGPhotoChangeToGraphChangeConverter_graphChangesWithPhotoChange_progressBlock___block_invoke_202(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1D25FED50]();
  v3 = [*(id *)(a1 + 32) graphChangesForChangedPropertyNamesByLocalIdentifier:*(void *)(a1 + 40) change:*(void *)(a1 + 48) progressBlock:*(void *)(a1 + 64)];
  [*(id *)(a1 + 56) addObjectsFromArray:v3];
  [*(id *)(a1 + 40) removeAllObjects];
}

- (void)_registerTranslatorsWithPhotoLibrary:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v6 = [v4 dictionary];
  entityTranslatorByEntityClassName = self->_entityTranslatorByEntityClassName;
  self->_entityTranslatorByEntityClassName = v6;

  Class v8 = [(PGGraphEntityTranslator *)[PGGraphAssetTranslator alloc] initWithPhotoLibrary:v5];
  double v9 = self->_entityTranslatorByEntityClassName;
  char v10 = +[PGGraphEntityTranslator entityClassName];
  [(NSMutableDictionary *)v9 setObject:v8 forKeyedSubscript:v10];

  os_signpost_id_t v11 = [(PGGraphEntityTranslator *)[PGGraphMomentTranslator alloc] initWithPhotoLibrary:v5];
  v12 = self->_entityTranslatorByEntityClassName;
  v13 = +[PGGraphEntityTranslator entityClassName];
  [(NSMutableDictionary *)v12 setObject:v11 forKeyedSubscript:v13];

  uint64_t v14 = [(PGGraphEntityTranslator *)[PGGraphHighlightTranslator alloc] initWithPhotoLibrary:v5];
  uint64_t v15 = self->_entityTranslatorByEntityClassName;
  mach_timebase_info v16 = +[PGGraphEntityTranslator entityClassName];
  [(NSMutableDictionary *)v15 setObject:v14 forKeyedSubscript:v16];

  v17 = [(PGGraphEntityTranslator *)[PGGraphFaceTranslator alloc] initWithPhotoLibrary:v5];
  char v18 = self->_entityTranslatorByEntityClassName;
  v19 = +[PGGraphEntityTranslator entityClassName];
  [(NSMutableDictionary *)v18 setObject:v17 forKeyedSubscript:v19];

  v20 = [(PGGraphEntityTranslator *)[PGGraphPersonTranslator alloc] initWithPhotoLibrary:v5];
  id v21 = self->_entityTranslatorByEntityClassName;
  id v22 = +[PGGraphEntityTranslator entityClassName];
  [(NSMutableDictionary *)v21 setObject:v20 forKeyedSubscript:v22];

  uint64_t v25 = [(PGGraphEntityTranslator *)[PGGraphSocialGroupTranslator alloc] initWithPhotoLibrary:v5];
  id v23 = self->_entityTranslatorByEntityClassName;
  uint64_t v24 = +[PGGraphEntityTranslator entityClassName];
  [(NSMutableDictionary *)v23 setObject:v25 forKeyedSubscript:v24];
}

- (PGPhotoChangeToGraphChangeConverter)initWithPhotoLibrary:(id)a3 loggingConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PGPhotoChangeToGraphChangeConverter;
  Class v8 = [(PGPhotoChangeToGraphChangeConverter *)&v11 init];
  double v9 = v8;
  if (v8)
  {
    [(PGPhotoChangeToGraphChangeConverter *)v8 _registerTranslatorsWithPhotoLibrary:v6];
    objc_storeStrong((id *)&v9->_loggingConnection, a4);
  }

  return v9;
}

+ (id)managedEntityNamesToTranslate
{
  if (managedEntityNamesToTranslate_onceToken[0] != -1) {
    dispatch_once(managedEntityNamesToTranslate_onceToken, &__block_literal_global_40906);
  }
  v2 = (void *)managedEntityNamesToTranslate_managedEntityNamesToTranslate;
  return v2;
}

void __68__PGPhotoChangeToGraphChangeConverter_managedEntityNamesToTranslate__block_invoke()
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v1 = +[PGGraphEntityTranslator managedEntityName];
  v10[0] = v1;
  v2 = +[PGGraphEntityTranslator managedEntityName];
  v10[1] = v2;
  v3 = +[PGGraphEntityTranslator managedEntityName];
  v10[2] = v3;
  v4 = +[PGGraphEntityTranslator managedEntityName];
  v10[3] = v4;
  id v5 = +[PGGraphEntityTranslator managedEntityName];
  v10[4] = v5;
  id v6 = +[PGGraphEntityTranslator managedEntityName];
  v10[5] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];
  uint64_t v8 = [v0 setWithArray:v7];
  double v9 = (void *)managedEntityNamesToTranslate_managedEntityNamesToTranslate;
  managedEntityNamesToTranslate_managedEntityNamesToTranslate = v8;
}

@end