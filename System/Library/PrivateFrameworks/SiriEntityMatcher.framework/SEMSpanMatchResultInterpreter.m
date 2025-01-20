@interface SEMSpanMatchResultInterpreter
- (BOOL)_checkEligibilityOfSpanMatch:(id)a3 allowPartialMatch:(BOOL)a4 allowApproxMatch:(BOOL)a5 allowAliasMatch:(BOOL)a6 query:(id)a7;
- (SEMSpanMatchPolicy)exactPolicy;
- (SEMSpanMatchPolicy)exactWithAliasPolicy;
- (SEMSpanMatchPolicy)fuzzyPolicy;
- (SEMSpanMatchPolicy)fuzzyWithAbsoluteThresholdPolicy;
- (SEMSpanMatchPolicy)fuzzyWithAliasPolicy;
- (SEMSpanMatchResultInterpreter)init;
- (float)_scoreSpanMatch:(id)a3 policy:(id)a4;
- (id)_applyRegionalSpanRankingToSortedGroupMatches:(id)a3 regionalThresholdScalar:(float)a4 globalThresholdScalar:(float)a5 maximalScore:(float)a6;
- (id)_filterRankAndThresholdCandidates:(id)a3 ofQuery:(id)a4 withPolicy:(id)a5;
- (id)_groupKeyForCandidate:(id)a3;
- (id)_groupKeyForCascadeCandidate:(id)a3;
- (id)_rankerPolicyForGroupKey:(id)a3;
- (id)_sortCandidates:(id)a3;
- (id)interpretSpanMatchResults:(id)a3 ofQuery:(id)a4;
- (void)_addScoredMatch:(id)a3 toSortedArray:(id)a4;
@end

@implementation SEMSpanMatchResultInterpreter

- (SEMSpanMatchResultInterpreter)init
{
  v37.receiver = self;
  v37.super_class = (Class)SEMSpanMatchResultInterpreter;
  v2 = [(SEMSpanMatchResultInterpreter *)&v37 init];
  if (v2)
  {
    v3 = [SEMSpanMatchPolicy alloc];
    uint64_t v6 = objc_msgSend_initWithOptions_(v3, v4, 3, v5);
    fuzzyPolicy = v2->_fuzzyPolicy;
    v2->_fuzzyPolicy = (SEMSpanMatchPolicy *)v6;

    v8 = [SEMSpanMatchPolicy alloc];
    LODWORD(v9) = 1051931443;
    LODWORD(v10) = 1.0;
    uint64_t matched = objc_msgSend_initWithOptions_absoluteThreshold_matchScoreWeight_(v8, v11, 3, v12, v9, v10);
    fuzzyWithAbsoluteThresholdPolicy = v2->_fuzzyWithAbsoluteThresholdPolicy;
    v2->_fuzzyWithAbsoluteThresholdPolicy = (SEMSpanMatchPolicy *)matched;

    v15 = [SEMSpanMatchPolicy alloc];
    uint64_t v18 = objc_msgSend_initWithOptions_(v15, v16, 0, v17);
    exactPolicy = v2->_exactPolicy;
    v2->_exactPolicy = (SEMSpanMatchPolicy *)v18;

    v20 = [SEMSpanMatchPolicy alloc];
    uint64_t v23 = objc_msgSend_initWithOptions_(v20, v21, 19, v22);
    fuzzyWithAliasPolicy = v2->_fuzzyWithAliasPolicy;
    v2->_fuzzyWithAliasPolicy = (SEMSpanMatchPolicy *)v23;

    v25 = [SEMSpanMatchPolicy alloc];
    uint64_t v28 = objc_msgSend_initWithOptions_(v25, v26, 16, v27);
    exactWithAliasPolicy = v2->_exactWithAliasPolicy;
    v2->_exactWithAliasPolicy = (SEMSpanMatchPolicy *)v28;

    v2->_useSensitiveLogging = objc_msgSend_useSensitiveLogging(SEMSettings, v30, v31, v32);
    v2->_useMediaThresholdFiltering = objc_msgSend_useMediaThresholdFiltering(SEMSettings, v33, v34, v35);
  }
  return v2;
}

- (id)interpretSpanMatchResults:(id)a3 ofQuery:(id)a4
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  v11 = objc_msgSend__sortCandidates_(self, v9, (uint64_t)v6, v10);
  uint64_t v12 = (id)qword_26B3549D8;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v63 = v8;
    id v64 = v7;
    id v65 = v6;
    int v62 = objc_msgSend_count(v6, v13, v14, v15);
    int v61 = objc_msgSend_count(v11, v16, v17, v18);
    id v19 = v11;
    id v20 = objc_alloc(MEMORY[0x263EFF980]);
    uint64_t v24 = objc_msgSend_count(v19, v21, v22, v23);
    uint64_t v27 = objc_msgSend_initWithCapacity_(v20, v25, v24, v26);
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    uint64_t v31 = objc_msgSend_allKeys(v19, v28, v29, v30);
    uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v32, (uint64_t)&v69, (uint64_t)buf, 16);
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v70;
      do
      {
        uint64_t v36 = 0;
        do
        {
          if (*(void *)v70 != v35) {
            objc_enumerationMutation(v31);
          }
          objc_super v37 = sub_25C81672C(*(void **)(*((void *)&v69 + 1) + 8 * v36));
          objc_msgSend_addObject_(v27, v38, (uint64_t)v37, v39);

          ++v36;
        }
        while (v34 != v36);
        uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v40, (uint64_t)&v69, (uint64_t)buf, 16);
      }
      while (v34);
    }

    v43 = objc_msgSend_componentsJoinedByString_(v27, v41, @", ", v42);

    *(_DWORD *)buf = 136315906;
    v74 = "-[SEMSpanMatchResultInterpreter interpretSpanMatchResults:ofQuery:]";
    __int16 v75 = 1024;
    int v76 = v62;
    __int16 v77 = 1024;
    int v78 = v61;
    __int16 v79 = 2112;
    v80 = v43;
    _os_log_impl(&dword_25C7CA000, v12, OS_LOG_TYPE_INFO, "%s Sorted %u matched item candidate(s) into %u group(s): [ %@ ]", buf, 0x22u);

    id v7 = v64;
    id v6 = v65;
    id v8 = v63;
  }

  v66[0] = MEMORY[0x263EF8330];
  v66[1] = 3221225472;
  v66[2] = sub_25C81648C;
  v66[3] = &unk_2654DEF00;
  v66[4] = self;
  id v44 = v7;
  id v67 = v44;
  id v45 = v8;
  id v68 = v45;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v11, v46, (uint64_t)v66, v47);
  v48 = (void *)qword_26B3549D8;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
  {
    v49 = v48;
    int v53 = objc_msgSend_count(v45, v50, v51, v52);
    int v57 = objc_msgSend_count(v6, v54, v55, v56);
    *(_DWORD *)buf = 136315650;
    v74 = "-[SEMSpanMatchResultInterpreter interpretSpanMatchResults:ofQuery:]";
    __int16 v75 = 1024;
    int v76 = v53;
    __int16 v77 = 1024;
    int v78 = v57;
    _os_log_impl(&dword_25C7CA000, v49, OS_LOG_TYPE_INFO, "%s Span Matching produced %u final result(s) from %u total candidate(s).", buf, 0x18u);
  }
  v58 = v68;
  id v59 = v45;

  return v59;
}

- (id)_sortCandidates:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v6 = v4;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v26, (uint64_t)v34, 16);
  if (v8)
  {
    uint64_t v12 = v8;
    uint64_t v13 = *(void *)v27;
    *(void *)&long long v11 = 136315394;
    long long v25 = v11;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v6);
        }
        uint64_t v15 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v18 = objc_msgSend__groupKeyForCandidate_(self, v9, v15, v10, v25, (void)v26);
        if (v18)
        {
          objc_msgSend_objectForKey_(v5, v16, (uint64_t)v18, v17);
          id v21 = (id)objc_claimAutoreleasedReturnValue();
          if (!v21)
          {
            id v21 = objc_alloc_init(MEMORY[0x263EFF980]);
            objc_msgSend_setObject_forKey_(v5, v22, (uint64_t)v21, (uint64_t)v18);
          }
          objc_msgSend_addObject_(v21, v19, v15, v20);
        }
        else
        {
          uint64_t v23 = qword_26B3549D8;
          if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v25;
            uint64_t v31 = "-[SEMSpanMatchResultInterpreter _sortCandidates:]";
            __int16 v32 = 2112;
            uint64_t v33 = v15;
            _os_log_error_impl(&dword_25C7CA000, v23, OS_LOG_TYPE_ERROR, "%s Ignorning unsupported span match result: %@", buf, 0x16u);
          }
        }
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v26, (uint64_t)v34, 16);
    }
    while (v12);
  }

  return v5;
}

- (id)_groupKeyForCandidate:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_entityInfo(v4, v5, v6, v7);
  int v12 = objc_msgSend_entityType(v8, v9, v10, v11);

  if (v12 == 1)
  {
    uint64_t v15 = objc_msgSend__groupKeyForCascadeCandidate_(self, v13, (uint64_t)v4, v14);
  }
  else
  {
    v16 = (void *)qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = v16;
      uint64_t v22 = objc_msgSend_entityInfo(v4, v19, v20, v21);
      unsigned int v26 = objc_msgSend_entityType(v22, v23, v24, v25);
      uint64_t v30 = SEMEntityTypeDescription(v26, v27, v28, v29);
      int v31 = 136315650;
      __int16 v32 = "-[SEMSpanMatchResultInterpreter _groupKeyForCandidate:]";
      __int16 v33 = 2112;
      uint64_t v34 = v30;
      __int16 v35 = 2112;
      id v36 = v4;
      _os_log_error_impl(&dword_25C7CA000, v18, OS_LOG_TYPE_ERROR, "%s Unexpected entity type (%@) of candidate: %@", (uint8_t *)&v31, 0x20u);
    }
    uint64_t v15 = 0;
  }

  return v15;
}

- (id)_groupKeyForCascadeCandidate:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_entityInfo(v4, v5, v6, v7);
  double v9 = sub_25C80E468(v8);

  if (!v9)
  {
    self = 0;
    goto LABEL_21;
  }
  int v13 = objc_msgSend_itemType(v9, v10, v11, v12);
  __int16 v17 = v13;
  if (v13 > 19667)
  {
    if (v13 == 27122 || v13 == 19668)
    {
      int v20 = sub_25C817160(v4, v14, v15, v16);
      if (!sub_25C821A0C(v20))
      {
        __int16 v21 = v17;
        __int16 v22 = v20;
LABEL_20:
        sub_25C8171E8(v21, v22);
        self = (SEMSpanMatchResultInterpreter *)objc_claimAutoreleasedReturnValue();
        goto LABEL_21;
      }
    }
LABEL_19:
    __int16 v22 = *MEMORY[0x263F316D0];
    __int16 v21 = v17;
    goto LABEL_20;
  }
  if (v13 == 7690)
  {
    if (sub_25C817160(v4, v14, v15, v16) == 7705)
    {
      __int16 v21 = 7690;
      __int16 v22 = 7705;
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  if (v13 != 18540 || !self->_useMediaThresholdFiltering) {
    goto LABEL_19;
  }
  int v18 = sub_25C817160(v4, v14, v15, v16);
  unsigned int v19 = v18 - 18555;
  if ((v18 - 18555) <= 9 && ((1 << v19) & 0x301) != 0)
  {
    sub_25C8171E8(18540, v18);
    self = (SEMSpanMatchResultInterpreter *)objc_claimAutoreleasedReturnValue();
  }
  if (v19 > 9 || ((1 << v19) & 0x301) == 0) {
    goto LABEL_19;
  }
LABEL_21:

  return self;
}

- (id)_filterRankAndThresholdCandidates:(id)a3 ofQuery:(id)a4 withPolicy:(id)a5
{
  uint64_t v132 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v110 = a4;
  id v9 = a5;
  id v10 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v14 = objc_msgSend_count(v8, v11, v12, v13);
  uint64_t v15 = v10;
  uint64_t v16 = v9;
  unsigned int v19 = objc_msgSend_initWithCapacity_(v15, v17, v14, v18);
  uint64_t v23 = objc_msgSend_allowPartialMatch(v9, v20, v21, v22);
  unsigned int v113 = objc_msgSend_allowApproxMatch(v9, v24, v25, v26);
  uint64_t v30 = objc_msgSend_allowAliasMatch(v9, v27, v28, v29);
  if (objc_msgSend_prioritizeExactMatch(v9, v31, v32, v33))
  {
    long long v120 = 0u;
    long long v121 = 0u;
    long long v118 = 0u;
    long long v119 = 0u;
    id v34 = v8;
    uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v35, (uint64_t)&v118, (uint64_t)v131, 16);
    if (v36)
    {
      uint64_t v40 = v36;
      id v108 = v8;
      obuint64_t j = v9;
      uint64_t v41 = *(void *)v119;
      while (2)
      {
        for (uint64_t i = 0; i != v40; ++i)
        {
          if (*(void *)v119 != v41) {
            objc_enumerationMutation(v34);
          }
          v43 = objc_msgSend_spanInfo(*(void **)(*((void *)&v118 + 1) + 8 * i), v37, v38, v39);
          if ((objc_msgSend_isPartialMatch(v43, v44, v45, v46) & 1) == 0
            && (objc_msgSend_isApproximateMatch(v43, v47, v48, v49) & 1) == 0)
          {
            uint64_t v51 = v30;
            uint64_t v52 = qword_26B3549D8;
            if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315138;
              v123 = "-[SEMSpanMatchResultInterpreter _filterRankAndThresholdCandidates:ofQuery:withPolicy:]";
              _os_log_impl(&dword_25C7CA000, v52, OS_LOG_TYPE_INFO, "%s Enabling exact match prioritiy, disallow partial and approximate matches", buf, 0xCu);
            }

            unsigned int v113 = 0;
            uint64_t v23 = 0;
            v50 = v110;
            uint64_t v16 = obj;
            uint64_t v30 = v51;
            goto LABEL_16;
          }
        }
        uint64_t v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v37, (uint64_t)&v118, (uint64_t)v131, 16);
        if (v40) {
          continue;
        }
        break;
      }
      v50 = v110;
      uint64_t v16 = obj;
LABEL_16:
      id v8 = v108;
    }
    else
    {
      v50 = v110;
    }
  }
  else
  {
    v50 = v110;
  }
  long long v116 = 0u;
  long long v117 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  id obja = v8;
  uint64_t v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v53, (uint64_t)&v114, (uint64_t)v130, 16);
  if (!v54)
  {
    float v58 = 0.0;
    goto LABEL_41;
  }
  uint64_t v56 = v54;
  uint64_t v57 = *(void *)v115;
  float v58 = 0.0;
  uint64_t v107 = 136315906;
  unsigned int v109 = v30;
  do
  {
    for (uint64_t j = 0; j != v56; ++j)
    {
      if (*(void *)v115 != v57) {
        objc_enumerationMutation(obja);
      }
      v60 = *(void **)(*((void *)&v114 + 1) + 8 * j);
      if (objc_msgSend__checkEligibilityOfSpanMatch_allowPartialMatch_allowApproxMatch_allowAliasMatch_query_(self, v55, (uint64_t)v60, v23, v113, v30, v50, v107))
      {
        objc_msgSend__scoreSpanMatch_policy_(self, v55, (uint64_t)v60, (uint64_t)v16);
        float v65 = v64;
        if (v64 > v58) {
          float v58 = v64;
        }
        objc_msgSend_absoluteThreshold(v16, v61, v62, v63);
        if (*(float *)&v69 < 0.0 || (float v70 = *(float *)&v69, v65 >= *(float *)&v69))
        {
          *(float *)&double v69 = v65;
          objc_msgSend_setScore_(v60, v66, v67, v68, v69);
          objc_msgSend__addScoredMatch_toSortedArray_(self, v83, (uint64_t)v60, (uint64_t)v19);
          continue;
        }
        long long v71 = v19;
        long long v72 = v16;
        BOOL useSensitiveLogging = self->_useSensitiveLogging;
        v74 = (void *)qword_26B3549D8;
        BOOL v75 = os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO);
        if (useSensitiveLogging)
        {
          if (v75)
          {
            int v76 = v74;
            v80 = objc_msgSend_spanValue(v60, v77, v78, v79);
            *(_DWORD *)buf = 136315907;
            v123 = "-[SEMSpanMatchResultInterpreter _filterRankAndThresholdCandidates:ofQuery:withPolicy:]";
            __int16 v124 = 2117;
            v125 = v80;
            __int16 v126 = 2048;
            double v127 = v65;
            __int16 v128 = 2048;
            double v129 = v70;
            uint64_t v81 = v76;
            v82 = "%s Rejecting candidate with value: \"%{sensitive}@\" - score of %f below absolute threshold value of %f";
            goto LABEL_35;
          }
        }
        else if (v75)
        {
          int v76 = v74;
          v80 = objc_msgSend_spanValue(v60, v84, v85, v86);
          *(_DWORD *)buf = v107;
          v123 = "-[SEMSpanMatchResultInterpreter _filterRankAndThresholdCandidates:ofQuery:withPolicy:]";
          __int16 v124 = 2112;
          v125 = v80;
          __int16 v126 = 2048;
          double v127 = v65;
          __int16 v128 = 2048;
          double v129 = v70;
          uint64_t v81 = v76;
          v82 = "%s Rejecting candidate with value: \"%@\" - score of %f below absolute threshold value of %f";
LABEL_35:
          _os_log_impl(&dword_25C7CA000, v81, OS_LOG_TYPE_INFO, v82, buf, 0x2Au);
        }
        v50 = v110;
        uint64_t v16 = v72;
        unsigned int v19 = v71;
        uint64_t v30 = v109;
        continue;
      }
    }
    uint64_t v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v55, (uint64_t)&v114, (uint64_t)v130, 16);
  }
  while (v56);
LABEL_41:

  if (objc_msgSend_count(v19, v87, v88, v89))
  {
    objc_msgSend_regionalRelativeThreshold(v16, v90, v91, v92);
    int v94 = v93;
    objc_msgSend_globalRelativeThreshold(v16, v95, v96, v97);
    LODWORD(v99) = v98;
    LODWORD(v100) = v94;
    *(float *)&double v101 = v58;
    objc_msgSend__applyRegionalSpanRankingToSortedGroupMatches_regionalThresholdScalar_globalThresholdScalar_maximalScore_(self, v102, (uint64_t)v19, v103, v100, v99, v101);
    id v104 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v104 = v19;
  }
  v105 = v104;

  return v105;
}

- (float)_scoreSpanMatch:(id)a3 policy:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_msgSend_matchScoreWeight(v5, v7, v8, v9);
  float v11 = v10;
  objc_msgSend_priorScoreWeight(v5, v12, v13, v14);
  float v16 = v15;

  int v20 = objc_msgSend_spanInfo(v6, v17, v18, v19);

  objc_msgSend_matchScore(v20, v21, v22, v23);
  float v25 = v24;

  return (float)(v16 * 0.0) + (float)(v11 * v25);
}

- (void)_addScoredMatch:(id)a3 toSortedArray:(id)a4
{
  id v45 = a3;
  id v5 = a4;
  if (objc_msgSend_count(v5, v6, v7, v8))
  {
    uint64_t v11 = 0;
    while (1)
    {
      uint64_t v12 = objc_msgSend_objectAtIndex_(v5, v9, v11, v10);
      float v16 = objc_msgSend_spanInfo(v12, v13, v14, v15);
      unint64_t v20 = objc_msgSend_spanRange(v16, v17, v18, v19);
      unint64_t v22 = v21;

      uint64_t v26 = objc_msgSend_spanInfo(v45, v23, v24, v25);
      unint64_t v30 = objc_msgSend_spanRange(v26, v27, v28, v29);
      unint64_t v32 = v31;

      if (v30 < v20) {
        break;
      }
      if (v30 <= v20)
      {
        if (v32 < v22) {
          break;
        }
        if (v32 <= v22)
        {
          objc_msgSend_score(v45, v33, v34, v35);
          float v37 = v36;
          objc_msgSend_score(v12, v38, v39, v40);
          if (v37 >= v41) {
            break;
          }
        }
      }

      if (++v11 >= (unint64_t)objc_msgSend_count(v5, v42, v43, v44)) {
        goto LABEL_9;
      }
    }
    objc_msgSend_insertObject_atIndex_(v5, v33, (uint64_t)v45, v11);
  }
  else
  {
LABEL_9:
    objc_msgSend_addObject_(v5, v9, (uint64_t)v45, v10);
  }
}

- (id)_applyRegionalSpanRankingToSortedGroupMatches:(id)a3 regionalThresholdScalar:(float)a4 globalThresholdScalar:(float)a5 maximalScore:(float)a6
{
  uint64_t v94 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v14 = objc_msgSend_count(v9, v11, v12, v13);
  id v74 = (id)objc_msgSend_initWithCapacity_(v10, v15, v14, v16);
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  obuint64_t j = v9;
  uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v77, (uint64_t)v93, 16);
  if (v18)
  {
    uint64_t v22 = v18;
    uint64_t v23 = 0;
    uint64_t v24 = 0;
    float v25 = a5 * a6;
    uint64_t v26 = *(void *)v78;
    double v27 = (float)(a5 * a6);
    double v28 = a6;
    double v29 = a5;
    float v30 = 0.0;
    float v31 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v78 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v33 = *(void **)(*((void *)&v77 + 1) + 8 * i);
        objc_msgSend_score(v33, v19, v20, v21);
        float v35 = v34;
        uint64_t v39 = objc_msgSend_spanInfo(v33, v36, v37, v38);
        if (objc_msgSend_isApproximateMatch(v39, v40, v41, v42)) {
          BOOL v46 = v35 < v25;
        }
        else {
          BOOL v46 = 0;
        }
        if (v46)
        {
          BOOL useSensitiveLogging = self->_useSensitiveLogging;
          uint64_t v52 = (void *)qword_26B3549D8;
          BOOL v53 = os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO);
          if (useSensitiveLogging)
          {
            if (!v53) {
              goto LABEL_28;
            }
            uint64_t v54 = v52;
            float v58 = objc_msgSend_spanValue(v33, v55, v56, v57);
            *(_DWORD *)buf = 136316419;
            v82 = "-[SEMSpanMatchResultInterpreter _applyRegionalSpanRankingToSortedGroupMatches:regionalThresholdScalar:"
                  "globalThresholdScalar:maximalScore:]";
            __int16 v83 = 2117;
            v84 = v58;
            __int16 v85 = 2048;
            double v86 = v35;
            __int16 v87 = 2048;
            double v88 = v27;
            __int16 v89 = 2048;
            double v90 = v28;
            __int16 v91 = 2048;
            double v92 = v29;
            id v59 = v54;
            v60 = "%s Rejecting candidate with value: \"%{sensitive}@\" - approximate match with score of %f below global"
                  " threshold cutoff of %f calculated from (max score in ranked group: %f) * (configured global threshold scalar: %f)";
          }
          else
          {
            if (!v53) {
              goto LABEL_28;
            }
            uint64_t v54 = v52;
            float v58 = objc_msgSend_spanValue(v33, v67, v68, v69);
            *(_DWORD *)buf = 136316418;
            v82 = "-[SEMSpanMatchResultInterpreter _applyRegionalSpanRankingToSortedGroupMatches:regionalThresholdScalar:"
                  "globalThresholdScalar:maximalScore:]";
            __int16 v83 = 2112;
            v84 = v58;
            __int16 v85 = 2048;
            double v86 = v35;
            __int16 v87 = 2048;
            double v88 = v27;
            __int16 v89 = 2048;
            double v90 = v28;
            __int16 v91 = 2048;
            double v92 = v29;
            id v59 = v54;
            v60 = "%s Rejecting candidate with value: \"%@\" - approximate match with score of %f below global threshold "
                  "cutoff of %f calculated from (max score in ranked group: %f) * (configured global threshold scalar: %f)";
          }
        }
        else
        {
          if (v24 != objc_msgSend_spanRange(v39, v43, v44, v45) || v23 != v47)
          {
            uint64_t v24 = objc_msgSend_spanRange(v39, v47, v48, v49);
            uint64_t v23 = v47;
            float v30 = v35 * a4;
            float v31 = v35;
LABEL_22:
            objc_msgSend_addObject_(v74, v47, (uint64_t)v33, v49);
            goto LABEL_28;
          }
          if (v35 >= v30) {
            goto LABEL_22;
          }
          BOOL v61 = self->_useSensitiveLogging;
          uint64_t v62 = (void *)qword_26B3549D8;
          BOOL v63 = os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO);
          if (v61)
          {
            if (!v63) {
              goto LABEL_28;
            }
            uint64_t v54 = v62;
            float v58 = objc_msgSend_spanValue(v33, v64, v65, v66);
            *(_DWORD *)buf = 136316419;
            v82 = "-[SEMSpanMatchResultInterpreter _applyRegionalSpanRankingToSortedGroupMatches:regionalThresholdScalar:"
                  "globalThresholdScalar:maximalScore:]";
            __int16 v83 = 2117;
            v84 = v58;
            __int16 v85 = 2048;
            double v86 = v35;
            __int16 v87 = 2048;
            double v88 = v30;
            __int16 v89 = 2048;
            double v90 = v31;
            __int16 v91 = 2048;
            double v92 = a4;
            id v59 = v54;
            v60 = "%s Rejecting candidate with value: \"%{sensitive}@\" - score of %f below regional threshold cutoff of "
                  "%f calculated from (max score in region: %f) * (configured regional threshold scalar: %f)";
          }
          else
          {
            if (!v63) {
              goto LABEL_28;
            }
            uint64_t v54 = v62;
            float v58 = objc_msgSend_spanValue(v33, v70, v71, v72);
            *(_DWORD *)buf = 136316418;
            v82 = "-[SEMSpanMatchResultInterpreter _applyRegionalSpanRankingToSortedGroupMatches:regionalThresholdScalar:"
                  "globalThresholdScalar:maximalScore:]";
            __int16 v83 = 2112;
            v84 = v58;
            __int16 v85 = 2048;
            double v86 = v35;
            __int16 v87 = 2048;
            double v88 = v30;
            __int16 v89 = 2048;
            double v90 = v31;
            __int16 v91 = 2048;
            double v92 = a4;
            id v59 = v54;
            v60 = "%s Rejecting candidate with value: \"%@\" - score of %f below regional threshold cutoff of %f calculat"
                  "ed from (max score in region: %f) * (configured regional threshold scalar: %f)";
          }
        }
        _os_log_impl(&dword_25C7CA000, v59, OS_LOG_TYPE_INFO, v60, buf, 0x3Eu);

LABEL_28:
      }
      uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v19, (uint64_t)&v77, (uint64_t)v93, 16);
    }
    while (v22);
  }

  return v74;
}

- (BOOL)_checkEligibilityOfSpanMatch:(id)a3 allowPartialMatch:(BOOL)a4 allowApproxMatch:(BOOL)a5 allowAliasMatch:(BOOL)a6 query:(id)a7
{
  BOOL v201 = a4;
  uint64_t v213 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a7;
  uint64_t v14 = objc_msgSend_spanInfo(v9, v11, v12, v13);
  int v18 = objc_msgSend_matchedTokenCount(v14, v15, v16, v17);
  int v22 = objc_msgSend_maxTokenCount(v14, v19, v20, v21);
  int v26 = objc_msgSend_matchedStopWordCount(v14, v23, v24, v25);
  int v198 = objc_msgSend_maxStopWordCount(v14, v27, v28, v29);
  uint64_t v33 = objc_msgSend_entityInfo(v9, v30, v31, v32);
  float v34 = sub_25C80E468(v33);
  uint64_t v38 = objc_msgSend_itemType(v34, v35, v36, v37);

  if ((objc_msgSend_isCascadeItemTypeIncluded_(v10, v39, v38, v40) & 1) == 0)
  {
    BOOL useSensitiveLogging = self->_useSensitiveLogging;
    __int16 v87 = (void *)qword_26B3549D8;
    BOOL v88 = os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO);
    if (useSensitiveLogging)
    {
      if (!v88) {
        goto LABEL_31;
      }
      long long v77 = v87;
      double v92 = objc_msgSend_spanValue(v9, v89, v90, v91);
      objc_msgSend_descriptionForTypeIdentifier_(MEMORY[0x263F50070], v93, v38, v94);
      uint64_t v96 = v95 = v14;
      *(_DWORD *)buf = 136315651;
      v207 = "-[SEMSpanMatchResultInterpreter _checkEligibilityOfSpanMatch:allowPartialMatch:allowApproxMatch:allowAliasMatch:query:]";
      __int16 v208 = 2117;
      uint64_t v209 = (uint64_t)v92;
      __int16 v210 = 2112;
      v211[0] = v96;
      uint64_t v97 = "%s Rejecting candidate with value: \"%{sensitive}@\" itemType: %@ is excluded from query.";
    }
    else
    {
      if (!v88) {
        goto LABEL_31;
      }
      long long v77 = v87;
      double v92 = objc_msgSend_spanValue(v9, v110, v111, v112);
      objc_msgSend_descriptionForTypeIdentifier_(MEMORY[0x263F50070], v113, v38, v114);
      uint64_t v96 = v95 = v14;
      *(_DWORD *)buf = 136315650;
      v207 = "-[SEMSpanMatchResultInterpreter _checkEligibilityOfSpanMatch:allowPartialMatch:allowApproxMatch:allowAliasMatch:query:]";
      __int16 v208 = 2112;
      uint64_t v209 = (uint64_t)v92;
      __int16 v210 = 2112;
      v211[0] = v96;
      uint64_t v97 = "%s Rejecting candidate with value: \"%@\" itemType: %@ is excluded from query.";
    }
    _os_log_impl(&dword_25C7CA000, v77, OS_LOG_TYPE_INFO, v97, buf, 0x20u);

    uint64_t v14 = v95;
    goto LABEL_26;
  }
  v196 = self;
  v197 = v9;
  int v194 = v18;
  int v195 = v22;
  long long v204 = 0u;
  long long v205 = 0u;
  long long v202 = 0u;
  long long v203 = 0u;
  uint64_t v44 = objc_msgSend_fieldMatches(v9, v41, v42, v43);
  uint64_t v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(v44, v45, (uint64_t)&v202, (uint64_t)v212, 16);
  if (!v46) {
    goto LABEL_10;
  }
  uint64_t v50 = v46;
  uint64_t v51 = *(void *)v203;
  while (2)
  {
    uint64_t v52 = v14;
    for (uint64_t i = 0; i != v50; ++i)
    {
      if (*(void *)v203 != v51) {
        objc_enumerationMutation(v44);
      }
      uint64_t v54 = objc_msgSend_entityFieldInfo(*(void **)(*((void *)&v202 + 1) + 8 * i), v47, v48, v49);
      uint64_t v55 = sub_25C80E5BC(v54);
      uint64_t v59 = objc_msgSend_fieldType(v55, v56, v57, v58);

      if ((objc_msgSend_isCascadeFieldTypeIncluded_(v10, v60, v59, v61) & 1) == 0)
      {
        BOOL v98 = v196->_useSensitiveLogging;
        double v99 = (void *)qword_26B3549D8;
        BOOL v100 = os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO);
        if (v98)
        {
          id v9 = v197;
          uint64_t v14 = v52;
          if (v100)
          {
            double v101 = v99;
            v105 = objc_msgSend_spanValue(v197, v102, v103, v104);
            id v108 = objc_msgSend_descriptionForTypeIdentifier_(MEMORY[0x263F50070], v106, v59, v107);
            *(_DWORD *)buf = 136315651;
            v207 = "-[SEMSpanMatchResultInterpreter _checkEligibilityOfSpanMatch:allowPartialMatch:allowApproxMatch:allow"
                   "AliasMatch:query:]";
            __int16 v208 = 2117;
            uint64_t v209 = (uint64_t)v105;
            __int16 v210 = 2112;
            v211[0] = v108;
            unsigned int v109 = "%s Rejecting candidate with value: \"%{sensitive}@\" fieldType: %@ is excluded from query.";
LABEL_29:
            _os_log_impl(&dword_25C7CA000, v101, OS_LOG_TYPE_INFO, v109, buf, 0x20u);
          }
        }
        else
        {
          id v9 = v197;
          uint64_t v14 = v52;
          if (v100)
          {
            double v101 = v99;
            v105 = objc_msgSend_spanValue(v197, v115, v116, v117);
            id v108 = objc_msgSend_descriptionForTypeIdentifier_(MEMORY[0x263F50070], v118, v59, v119);
            *(_DWORD *)buf = 136315650;
            v207 = "-[SEMSpanMatchResultInterpreter _checkEligibilityOfSpanMatch:allowPartialMatch:allowApproxMatch:allow"
                   "AliasMatch:query:]";
            __int16 v208 = 2112;
            uint64_t v209 = (uint64_t)v105;
            __int16 v210 = 2112;
            v211[0] = v108;
            unsigned int v109 = "%s Rejecting candidate with value: \"%@\" fieldType: %@ is excluded from query.";
            goto LABEL_29;
          }
        }

        goto LABEL_31;
      }
    }
    uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v44, v47, (uint64_t)&v202, (uint64_t)v212, 16);
    uint64_t v14 = v52;
    if (v50) {
      continue;
    }
    break;
  }
LABEL_10:

  if (!v201)
  {
    id v9 = v197;
    if (!objc_msgSend_isPartialMatch(v14, v62, v63, v64)) {
      goto LABEL_47;
    }
    BOOL v122 = v196->_useSensitiveLogging;
    v123 = (void *)qword_26B3549D8;
    BOOL v124 = os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO);
    if (v122)
    {
      if (v124)
      {
        v125 = v123;
        double v129 = objc_msgSend_spanValue(v197, v126, v127, v128);
        *(_DWORD *)buf = 136315907;
        v207 = "-[SEMSpanMatchResultInterpreter _checkEligibilityOfSpanMatch:allowPartialMatch:allowApproxMatch:allowAliasMatch:query:]";
        __int16 v208 = 2117;
        uint64_t v209 = (uint64_t)v129;
        __int16 v210 = 1024;
        LODWORD(v211[0]) = v194;
        WORD2(v211[0]) = 1024;
        *(_DWORD *)((char *)v211 + 6) = v195;
        v130 = "%s Rejecting candidate with value: \"%{sensitive}@\" - partial match with %u / %u tokens matched.";
        goto LABEL_60;
      }
    }
    else if (v124)
    {
      v125 = v123;
      double v129 = objc_msgSend_spanValue(v197, v142, v143, v144);
      *(_DWORD *)buf = 136315906;
      v207 = "-[SEMSpanMatchResultInterpreter _checkEligibilityOfSpanMatch:allowPartialMatch:allowApproxMatch:allowAliasMatch:query:]";
      __int16 v208 = 2112;
      uint64_t v209 = (uint64_t)v129;
      __int16 v210 = 1024;
      LODWORD(v211[0]) = v194;
      WORD2(v211[0]) = 1024;
      *(_DWORD *)((char *)v211 + 6) = v195;
      v130 = "%s Rejecting candidate with value: \"%@\" - partial match with %u / %u tokens matched.";
      goto LABEL_60;
    }
    goto LABEL_31;
  }
  int v65 = v194;
  id v9 = v197;
  if (v194 != v26 || v195 - v194 < (v198 - v26)) {
    goto LABEL_47;
  }
  uint64_t v66 = objc_msgSend_fieldMatches(v197, v62, v63, v64);
  if (objc_msgSend_count(v66, v67, v68, v69) != 1)
  {

    long long v77 = 0;
LABEL_38:
    BOOL v131 = v196->_useSensitiveLogging;
    uint64_t v132 = (void *)qword_26B3549D8;
    BOOL v133 = os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO);
    if (v131)
    {
      if (v133)
      {
        v134 = v132;
        uint64_t v138 = objc_msgSend_spanValue(v197, v135, v136, v137);
        int v139 = v65;
        v140 = (void *)v138;
        *(_DWORD *)buf = 136315907;
        v207 = "-[SEMSpanMatchResultInterpreter _checkEligibilityOfSpanMatch:allowPartialMatch:allowApproxMatch:allowAliasMatch:query:]";
        __int16 v208 = 2117;
        uint64_t v209 = v138;
        __int16 v210 = 1024;
        LODWORD(v211[0]) = v139;
        WORD2(v211[0]) = 1024;
        *(_DWORD *)((char *)v211 + 6) = v195;
        v141 = "%s Rejecting candidate with value: \"%{sensitive}@\" - partial match with %u / %u tokens matched, and all"
               " matching stop words.";
LABEL_45:
        _os_log_impl(&dword_25C7CA000, v134, OS_LOG_TYPE_INFO, v141, buf, 0x22u);
      }
    }
    else if (v133)
    {
      v134 = v132;
      uint64_t v148 = objc_msgSend_spanValue(v197, v145, v146, v147);
      int v149 = v65;
      v140 = (void *)v148;
      *(_DWORD *)buf = 136315906;
      v207 = "-[SEMSpanMatchResultInterpreter _checkEligibilityOfSpanMatch:allowPartialMatch:allowApproxMatch:allowAliasMatch:query:]";
      __int16 v208 = 2112;
      uint64_t v209 = v148;
      __int16 v210 = 1024;
      LODWORD(v211[0]) = v149;
      WORD2(v211[0]) = 1024;
      *(_DWORD *)((char *)v211 + 6) = v195;
      v141 = "%s Rejecting candidate with value: \"%@\" - partial match with %u / %u tokens matched, and all matching stop words.";
      goto LABEL_45;
    }
LABEL_26:

    goto LABEL_31;
  }
  v73 = objc_msgSend_fieldMatches(v197, v70, v71, v72);
  long long v77 = objc_msgSend_firstObject(v73, v74, v75, v76);

  if (!v77) {
    goto LABEL_38;
  }
  uint64_t v81 = objc_msgSend_fieldSpanInfo(v77, v78, v79, v80);
  int isPartialMatch = objc_msgSend_isPartialMatch(v81, v82, v83, v84);

  if (isPartialMatch)
  {
    int v65 = v194;
    goto LABEL_38;
  }

LABEL_47:
  if (a6 || !objc_msgSend_isAliasMatch(v14, v62, v63, v64))
  {
    if (a5 || !objc_msgSend_isApproximateMatch(v14, v62, v63, v64))
    {
      BOOL v120 = 1;
      goto LABEL_32;
    }
    BOOL v164 = v196->_useSensitiveLogging;
    v165 = (void *)qword_26B3549D8;
    BOOL v166 = os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO);
    if (v164)
    {
      if (!v166) {
        goto LABEL_31;
      }
      v125 = v165;
      double v129 = objc_msgSend_spanValue(v9, v167, v168, v169);
      int v173 = objc_msgSend_editDistance(v14, v170, v171, v172);
      *(_DWORD *)buf = 136315651;
      v207 = "-[SEMSpanMatchResultInterpreter _checkEligibilityOfSpanMatch:allowPartialMatch:allowApproxMatch:allowAliasMatch:query:]";
      __int16 v208 = 2117;
      uint64_t v209 = (uint64_t)v129;
      __int16 v210 = 1024;
      LODWORD(v211[0]) = v173;
      v130 = "%s Rejecting candidate with value: \"%{sensitive}@\" - approximate match with edit distance: %u.";
    }
    else
    {
      if (!v166) {
        goto LABEL_31;
      }
      v125 = v165;
      double v129 = objc_msgSend_spanValue(v9, v187, v188, v189);
      int v193 = objc_msgSend_editDistance(v14, v190, v191, v192);
      *(_DWORD *)buf = 136315650;
      v207 = "-[SEMSpanMatchResultInterpreter _checkEligibilityOfSpanMatch:allowPartialMatch:allowApproxMatch:allowAliasMatch:query:]";
      __int16 v208 = 2112;
      uint64_t v209 = (uint64_t)v129;
      __int16 v210 = 1024;
      LODWORD(v211[0]) = v193;
      v130 = "%s Rejecting candidate with value: \"%@\" - approximate match with edit distance: %u.";
    }
    v185 = v125;
    uint32_t v186 = 28;
LABEL_64:
    _os_log_impl(&dword_25C7CA000, v185, OS_LOG_TYPE_INFO, v130, buf, v186);

    goto LABEL_31;
  }
  BOOL v150 = v196->_useSensitiveLogging;
  v151 = (void *)qword_26B3549D8;
  BOOL v152 = os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO);
  if (!v150)
  {
    if (!v152) {
      goto LABEL_31;
    }
    v125 = v151;
    double v129 = objc_msgSend_spanValue(v9, v174, v175, v176);
    int v180 = objc_msgSend_matchedAliasCount(v14, v177, v178, v179);
    int v184 = objc_msgSend_maxAliasCount(v14, v181, v182, v183);
    *(_DWORD *)buf = 136315906;
    v207 = "-[SEMSpanMatchResultInterpreter _checkEligibilityOfSpanMatch:allowPartialMatch:allowApproxMatch:allowAliasMatch:query:]";
    __int16 v208 = 2112;
    uint64_t v209 = (uint64_t)v129;
    __int16 v210 = 1024;
    LODWORD(v211[0]) = v180;
    WORD2(v211[0]) = 1024;
    *(_DWORD *)((char *)v211 + 6) = v184;
    v130 = "%s Rejecting candidate with value: \"%@\" - alias match with %u / %u tokens matched.";
LABEL_60:
    v185 = v125;
    uint32_t v186 = 34;
    goto LABEL_64;
  }
  if (v152)
  {
    v125 = v151;
    double v129 = objc_msgSend_spanValue(v9, v153, v154, v155);
    int v159 = objc_msgSend_matchedAliasCount(v14, v156, v157, v158);
    int v163 = objc_msgSend_maxAliasCount(v14, v160, v161, v162);
    *(_DWORD *)buf = 136315907;
    v207 = "-[SEMSpanMatchResultInterpreter _checkEligibilityOfSpanMatch:allowPartialMatch:allowApproxMatch:allowAliasMatch:query:]";
    __int16 v208 = 2117;
    uint64_t v209 = (uint64_t)v129;
    __int16 v210 = 1024;
    LODWORD(v211[0]) = v159;
    WORD2(v211[0]) = 1024;
    *(_DWORD *)((char *)v211 + 6) = v163;
    v130 = "%s Rejecting candidate with value: \"%{sensitive}@\" - alias match with %u / %u tokens matched.";
    goto LABEL_60;
  }
LABEL_31:
  BOOL v120 = 0;
LABEL_32:

  return v120;
}

- (id)_rankerPolicyForGroupKey:(id)a3
{
  id v5 = a3;
  int v6 = sub_25C818920(v5);
  if (v6 > 27121)
  {
    if (v6 <= 61351)
    {
      if (v6 != 27122)
      {
        if (v6 != 36434)
        {
          int v7 = 49066;
          goto LABEL_22;
        }
LABEL_23:
        uint64_t v9 = 16;
        goto LABEL_25;
      }
      int v6 = sub_25C818974(v5);
      int v7 = (unsigned __int16)*MEMORY[0x263F316D0];
LABEL_22:
      if (v6 == v7) {
        goto LABEL_23;
      }
LABEL_24:
      uint64_t v9 = 24;
      goto LABEL_25;
    }
    if (v6 == 61352) {
      goto LABEL_23;
    }
    if (v6 != 61509)
    {
      int v7 = 63369;
      goto LABEL_22;
    }
LABEL_20:
    uint64_t v9 = 32;
LABEL_25:
    v3 = (SEMSpanMatchPolicy *)*(id *)((char *)&self->super.isa + v9);
    goto LABEL_26;
  }
  if (v6 <= 17033)
  {
    if (v6 != 800)
    {
      if (v6 == 7690)
      {
        int v8 = sub_25C818974(v5);
        uint64_t v9 = 32;
        if (v8 == 7705) {
          uint64_t v9 = 40;
        }
        goto LABEL_25;
      }
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  if (v6 == 17034) {
    goto LABEL_23;
  }
  if (v6 != 18540)
  {
    if (v6 != 19668 || sub_25C818974(v5) != (unsigned __int16)*MEMORY[0x263F316D0]) {
      goto LABEL_24;
    }
    goto LABEL_20;
  }
  if (!self->_useMediaThresholdFiltering) {
    goto LABEL_23;
  }
  unsigned int v11 = sub_25C818974(v5) - 18555;
  if (v11 <= 9 && ((1 << v11) & 0x301) != 0) {
    v3 = self->_fuzzyWithAbsoluteThresholdPolicy;
  }
  uint64_t v9 = 16;
  if (v11 > 9 || ((1 << v11) & 0x301) == 0) {
    goto LABEL_25;
  }
LABEL_26:

  return v3;
}

- (SEMSpanMatchPolicy)fuzzyPolicy
{
  return self->_fuzzyPolicy;
}

- (SEMSpanMatchPolicy)exactPolicy
{
  return self->_exactPolicy;
}

- (SEMSpanMatchPolicy)fuzzyWithAliasPolicy
{
  return self->_fuzzyWithAliasPolicy;
}

- (SEMSpanMatchPolicy)exactWithAliasPolicy
{
  return self->_exactWithAliasPolicy;
}

- (SEMSpanMatchPolicy)fuzzyWithAbsoluteThresholdPolicy
{
  return self->_fuzzyWithAbsoluteThresholdPolicy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fuzzyWithAbsoluteThresholdPolicy, 0);
  objc_storeStrong((id *)&self->_exactWithAliasPolicy, 0);
  objc_storeStrong((id *)&self->_fuzzyWithAliasPolicy, 0);
  objc_storeStrong((id *)&self->_exactPolicy, 0);
  objc_storeStrong((id *)&self->_fuzzyPolicy, 0);
}

@end