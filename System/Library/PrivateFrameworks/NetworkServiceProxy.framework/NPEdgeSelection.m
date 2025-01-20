@interface NPEdgeSelection
+ (BOOL)supportsSecureCoding;
- (BOOL)shouldProbeForEdgeSelection:(id)a3 edgeRank:(int64_t *)a4 edgeIndex:(int64_t *)a5 bestEdgeLabel:(id *)a6;
- (NPEdgeSelection)initWithCoder:(id)a3;
- (NPEdgeSelection)initWithWaldo:(id)a3 signature:(id)a4 interfaceType:(id)a5;
- (NPWaldo)waldoInfo;
- (NSDate)probeDate;
- (NSString)bestEdge;
- (NSString)nextBestEdge;
- (id)copyEdgeSelectionTelemetry;
- (id)description;
- (unint64_t)bestEdgeProbedRTT;
- (unint64_t)bestEdgeRTT;
- (unint64_t)nextBestEdgeRTT;
- (void)encodeWithCoder:(id)a3;
- (void)getBestEdgeFromEdgeSelection;
- (void)setBestEdge:(id)a3;
- (void)setBestEdgeProbedRTT:(unint64_t)a3;
- (void)setBestEdgeRTT:(unint64_t)a3;
- (void)setNextBestEdge:(id)a3;
- (void)setNextBestEdgeRTT:(unint64_t)a3;
- (void)setProbeDate:(id)a3;
- (void)setWaldoInfo:(id)a3;
- (void)trainEdgeSelection:(id)a3 edgeRank:(unint64_t)a4 rtt:(unint64_t)a5;
- (void)updateEdgeSelection:(unint64_t)a3;
@end

@implementation NPEdgeSelection

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NPEdgeSelection)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NPEdgeSelection;
  v5 = [(EdgeSelection *)&v19 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"BestEdge"];
    bestEdge = v5->_bestEdge;
    v5->_bestEdge = (NSString *)v9;

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = v5->_bestEdge;
      v5->_bestEdge = 0;
    }
    v5->_bestEdgeRTT = [v4 decodeIntegerForKey:@"BestEdgeRTT"];
    v5->_bestEdgeProbedRTT = [v4 decodeIntegerForKey:@"BestEdgeProbedRTT"];
    v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"NextBestEdge"];
    nextBestEdge = v5->_nextBestEdge;
    v5->_nextBestEdge = (NSString *)v15;

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = v5->_nextBestEdge;
      v5->_nextBestEdge = 0;
    }
    v5->_nextBestEdgeRTT = [v4 decodeIntegerForKey:@"NextBestEdgeRTT"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NPEdgeSelection;
  id v4 = a3;
  [(EdgeSelection *)&v7 encodeWithCoder:v4];
  v5 = [(NPEdgeSelection *)self bestEdge];
  [v4 encodeObject:v5 forKey:@"BestEdge"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[NPEdgeSelection bestEdgeRTT](self, "bestEdgeRTT"), @"BestEdgeRTT");
  objc_msgSend(v4, "encodeInteger:forKey:", -[NPEdgeSelection bestEdgeProbedRTT](self, "bestEdgeProbedRTT"), @"BestEdgeProbedRTT");
  v6 = [(NPEdgeSelection *)self nextBestEdge];
  [v4 encodeObject:v6 forKey:@"NextBestEdge"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[NPEdgeSelection nextBestEdgeRTT](self, "nextBestEdgeRTT"), @"NextBestEdgeRTT");
}

- (NPEdgeSelection)initWithWaldo:(id)a3 signature:(id)a4 interfaceType:(id)a5
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  v11 = [v8 edgeSelectionAlpha];
  if (v11)
  {
    v12 = [v8 edgeSelectionAlpha];
  }
  else
  {
    v12 = &unk_1EF43BCD0;
  }

  uint64_t v13 = [v8 edgeSelectionWindowSize];
  if (v13)
  {
    v14 = [v8 edgeSelectionWindowSize];
  }
  else
  {
    v14 = &unk_1EF43BCE8;
  }

  v19[0] = @"kESSAlpha";
  v19[1] = @"kESSWindowSize";
  v20[0] = v12;
  v20[1] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  v18.receiver = self;
  v18.super_class = (Class)NPEdgeSelection;
  v16 = [(EdgeSelection *)&v18 initWithNetworkSignature:v10 interfaceType:v9 modelParams:v15];

  if (v16)
  {
    objc_storeWeak((id *)&v16->_waldoInfo, v8);
    [(NPEdgeSelection *)v16 trainEdgeSelection:0 edgeRank:0 rtt:0];
  }

  return v16;
}

- (void)getBestEdgeFromEdgeSelection
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __47__NPEdgeSelection_getBestEdgeFromEdgeSelection__block_invoke;
  v2[3] = &unk_1E5A3B2D0;
  v2[4] = self;
  [(EdgeSelection *)self getMinimumLatencyEdge:v2];
}

void __47__NPEdgeSelection_getBestEdgeFromEdgeSelection__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_super v7 = NPGetInternalQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__NPEdgeSelection_getBestEdgeFromEdgeSelection__block_invoke_2;
  block[3] = &unk_1E5A3B178;
  uint64_t v8 = *(void *)(a1 + 32);
  id v12 = v6;
  uint64_t v13 = v8;
  id v14 = v5;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v7, block);
}

void __47__NPEdgeSelection_getBestEdgeFromEdgeSelection__block_invoke_2(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    v2 = nplog_obj();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = *(void **)(a1 + 32);
      id v4 = [*(id *)(a1 + 40) networkSignature];
      id v5 = [*(id *)(a1 + 40) interfaceType];
      int v23 = 138412802;
      v24 = v3;
      __int16 v25 = 2112;
      uint64_t v26 = (uint64_t)v4;
      __int16 v27 = 2112;
      v28 = v5;
      id v6 = "Edge selection get edge, failed get min with error: %@ (%@ %@)";
LABEL_16:
      v11 = v2;
      uint32_t v12 = 32;
      goto LABEL_17;
    }
  }
  else
  {
    objc_super v7 = *(void **)(a1 + 48);
    if (v7)
    {
      uint64_t v8 = [v7 objectForKeyedSubscript:@"kESSSelectedEdgeLabel"];
      if (v8)
      {
        id v9 = (void *)v8;
        id v10 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"kESSSelectedEdgeLabel"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
        }
        else
        {
          uint64_t v13 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"kESSRTT"];

          if (v13)
          {
            id v14 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"kESSSelectedEdgeLabel"];
            [*(id *)(a1 + 40) setNextBestEdge:v14];

            uint64_t v15 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"kESSRTT"];
            objc_msgSend(*(id *)(a1 + 40), "setNextBestEdgeRTT:", objc_msgSend(v15, "unsignedIntegerValue"));

            v16 = nplog_obj();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              objc_super v19 = [*(id *)(a1 + 40) nextBestEdge];
              uint64_t v20 = [*(id *)(a1 + 40) nextBestEdgeRTT];
              v21 = [*(id *)(a1 + 40) networkSignature];
              v22 = [*(id *)(a1 + 40) interfaceType];
              int v23 = 138413058;
              v24 = v19;
              __int16 v25 = 2048;
              uint64_t v26 = v20;
              __int16 v27 = 2112;
              v28 = v21;
              __int16 v29 = 2112;
              v30 = v22;
              _os_log_debug_impl(&dword_1A0FEE000, v16, OS_LOG_TYPE_DEBUG, "Edge selection get edge: next best edge %@ Last RTT %lu (%@ %@)", (uint8_t *)&v23, 0x2Au);
            }
            v17 = [*(id *)(a1 + 40) waldoInfo];
            [v17 setShouldSave:1];

            v2 = [*(id *)(a1 + 40) waldoInfo];
            [v2 saveToKeychain];
            goto LABEL_18;
          }
        }
      }
      v2 = nplog_obj();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        objc_super v18 = *(void **)(a1 + 48);
        id v4 = [*(id *)(a1 + 40) networkSignature];
        id v5 = [*(id *)(a1 + 40) interfaceType];
        int v23 = 138412802;
        v24 = v18;
        __int16 v25 = 2112;
        uint64_t v26 = (uint64_t)v4;
        __int16 v27 = 2112;
        v28 = v5;
        id v6 = "Edge selection get edge, failed get min, no selected edge / rtt: %@ (%@ %@)";
        goto LABEL_16;
      }
    }
    else
    {
      v2 = nplog_obj();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        id v4 = [*(id *)(a1 + 40) networkSignature];
        id v5 = [*(id *)(a1 + 40) interfaceType];
        int v23 = 138412546;
        v24 = v4;
        __int16 v25 = 2112;
        uint64_t v26 = (uint64_t)v5;
        id v6 = "Edge selection get edge, failed get min, no result dictionary (%@ %@)";
        v11 = v2;
        uint32_t v12 = 22;
LABEL_17:
        _os_log_error_impl(&dword_1A0FEE000, v11, OS_LOG_TYPE_ERROR, v6, (uint8_t *)&v23, v12);
      }
    }
  }
LABEL_18:
}

- (void)trainEdgeSelection:(id)a3 edgeRank:(unint64_t)a4 rtt:(unint64_t)a5
{
  v44[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v8)
  {
    v43[0] = @"kESSRTT";
    id v10 = [NSNumber numberWithUnsignedInteger:a5];
    v44[0] = v10;
    v44[1] = MEMORY[0x1E4F1CC38];
    v43[1] = @"kESSIsSelected";
    v43[2] = @"kESSRank";
    v11 = [NSNumber numberWithUnsignedInteger:a4 + 1];
    v44[2] = v11;
    uint32_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:3];
    [v9 setObject:v12 forKeyedSubscript:v8];

LABEL_13:
    uint64_t v26 = nplog_obj();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      v28 = [(EdgeSelection *)self networkSignature];
      __int16 v29 = [(EdgeSelection *)self interfaceType];
      *(_DWORD *)buf = 138412802;
      id v36 = v9;
      __int16 v37 = 2112;
      v38 = v28;
      __int16 v39 = 2112;
      v40 = v29;
      _os_log_debug_impl(&dword_1A0FEE000, v26, OS_LOG_TYPE_DEBUG, "Edge selection train with edge data %@ (%@ %@)", buf, 0x20u);
    }
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __51__NPEdgeSelection_trainEdgeSelection_edgeRank_rtt___block_invoke;
    v32[3] = &unk_1E5A3B1C8;
    id v33 = v9;
    v34 = self;
    [(EdgeSelection *)self trainEdgeSelectionModel:v33 reply:v32];
    id v10 = v33;
    goto LABEL_16;
  }
  uint64_t v13 = [(NPEdgeSelection *)self waldoInfo];
  id v10 = [v13 currentEdgeList];

  if ([v10 count])
  {
    unint64_t v14 = 0;
    do
    {
      uint64_t v15 = [v10 objectAtIndexedSubscript:v14];
      if (v15)
      {
        v16 = [(NPEdgeSelection *)self waldoInfo];
        v17 = [v16 edges];
        objc_super v18 = objc_msgSend(v17, "objectAtIndexedSubscript:", objc_msgSend(v15, "edgeIndex"));

        if (v18)
        {
          objc_super v19 = [v18 label];

          if (v19)
          {
            uint64_t v20 = [v15 roundTripAverageObserved];
            uint64_t v21 = [v20 average];

            v41[0] = @"kESSRTT";
            v22 = [NSNumber numberWithUnsignedInteger:v21];
            v42[0] = v22;
            v42[1] = MEMORY[0x1E4F1CC38];
            v41[1] = @"kESSIsSelected";
            v41[2] = @"kESSRank";
            int v23 = [NSNumber numberWithUnsignedInteger:v14 + 1];
            v42[2] = v23;
            v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:3];
            __int16 v25 = [v18 label];
            [v9 setObject:v24 forKeyedSubscript:v25];
          }
        }
      }
      else
      {
        objc_super v18 = 0;
      }

      ++v14;
    }
    while (v14 < [v10 count]);
  }
  if ([v9 count])
  {
    id v8 = 0;
    goto LABEL_13;
  }
  __int16 v27 = nplog_obj();
  id v8 = 0;
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    v30 = [(EdgeSelection *)self networkSignature];
    uint64_t v31 = [(EdgeSelection *)self interfaceType];
    *(_DWORD *)buf = 138412546;
    id v36 = v30;
    __int16 v37 = 2112;
    v38 = v31;
    _os_log_error_impl(&dword_1A0FEE000, v27, OS_LOG_TYPE_ERROR, "Edge selection train, no edge data (%@ %@)", buf, 0x16u);
  }
LABEL_16:
}

void __51__NPEdgeSelection_trainEdgeSelection_edgeRank_rtt___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = NPGetInternalQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__NPEdgeSelection_trainEdgeSelection_edgeRank_rtt___block_invoke_2;
  block[3] = &unk_1E5A3B178;
  id v9 = v3;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v10 = v5;
  uint64_t v11 = v6;
  id v7 = v3;
  dispatch_async(v4, block);
}

void __51__NPEdgeSelection_trainEdgeSelection_edgeRank_rtt___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    v2 = nplog_obj();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v4 = *(void *)(a1 + 40);
      uint64_t v6 = [*(id *)(a1 + 48) networkSignature];
      id v7 = [*(id *)(a1 + 48) interfaceType];
      int v8 = 138413058;
      uint64_t v9 = v4;
      __int16 v10 = 2112;
      uint64_t v11 = v5;
      __int16 v12 = 2112;
      uint64_t v13 = v6;
      __int16 v14 = 2112;
      uint64_t v15 = v7;
      _os_log_error_impl(&dword_1A0FEE000, v2, OS_LOG_TYPE_ERROR, "Edge selection train failed for edge data %@, error: %@ (%@ %@)", (uint8_t *)&v8, 0x2Au);
    }
  }
  else
  {
    id v3 = *(void **)(a1 + 48);
    [v3 getBestEdgeFromEdgeSelection];
  }
}

- (BOOL)shouldProbeForEdgeSelection:(id)a3 edgeRank:(int64_t *)a4 edgeIndex:(int64_t *)a5 bestEdgeLabel:(id *)a6
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  __int16 v10 = [(NPEdgeSelection *)self waldoInfo];
  uint64_t v11 = [v10 currentEdgeList];

  BOOL v12 = 0;
  uint64_t v13 = 0;
  *a4 = -1;
  *a5 = -1;
  __int16 v14 = 0;
  if (!v9 || !v11) {
    goto LABEL_27;
  }
  __int16 v39 = a5;
  if (![v11 count])
  {
    uint64_t v13 = 0;
    __int16 v14 = 0;
    goto LABEL_18;
  }
  __int16 v14 = 0;
  uint64_t v15 = 0;
  unint64_t v16 = 0;
  while (1)
  {
    v17 = v14;
    __int16 v14 = [v11 objectAtIndexedSubscript:v16];

    if (v14) {
      break;
    }

    uint64_t v13 = 0;
LABEL_15:
    ++v16;
    uint64_t v15 = v13;
    if (v16 >= [v11 count]) {
      goto LABEL_18;
    }
  }
  objc_super v18 = [(NPEdgeSelection *)self waldoInfo];
  objc_super v19 = [v18 edges];
  uint64_t v13 = objc_msgSend(v19, "objectAtIndexedSubscript:", objc_msgSend(v14, "edgeIndex"));

  if (!v13) {
    goto LABEL_15;
  }
  uint64_t v20 = [v13 label];

  if (!v20) {
    goto LABEL_15;
  }
  if (!v16)
  {
    uint64_t v21 = nplog_obj();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      v38 = [v13 label];
      __int16 v37 = [v14 roundTripAverageObserved];
      uint64_t v36 = [v37 average];
      v24 = [(EdgeSelection *)self networkSignature];
      __int16 v25 = [(EdgeSelection *)self interfaceType];
      *(_DWORD *)buf = 138413058;
      id v42 = v38;
      __int16 v43 = 2048;
      uint64_t v44 = v36;
      __int16 v45 = 2112;
      v46 = v24;
      __int16 v47 = 2112;
      v48 = v25;
      _os_log_debug_impl(&dword_1A0FEE000, v21, OS_LOG_TYPE_DEBUG, "Edge selection update, current best edge %@, avg RTT: %ld (%@ %@)", buf, 0x2Au);
    }
    *a6 = [v13 label];
  }
  v22 = [v13 label];
  int v23 = [v22 isEqualToString:v9];

  if (!v23) {
    goto LABEL_15;
  }
  if ([v13 probePending])
  {
    __int16 v27 = nplog_obj();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      v32 = [(EdgeSelection *)self networkSignature];
      id v33 = [(EdgeSelection *)self interfaceType];
      *(_DWORD *)buf = 138412802;
      id v42 = v9;
      __int16 v43 = 2112;
      uint64_t v44 = (uint64_t)v32;
      __int16 v45 = 2112;
      v46 = v33;
      _os_log_debug_impl(&dword_1A0FEE000, v27, OS_LOG_TYPE_DEBUG, "Edge selection update, edge %@ is already being probed currently, skip probe (%@ %@)", buf, 0x20u);
      goto LABEL_35;
    }
    goto LABEL_25;
  }
  *a4 = v16;
  *__int16 v39 = [v14 edgeIndex];
LABEL_18:
  if (*a4 == -1 || *v39 == -1)
  {
    __int16 v27 = nplog_obj();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v32 = [(EdgeSelection *)self networkSignature];
      id v33 = [(EdgeSelection *)self interfaceType];
      *(_DWORD *)buf = 138412802;
      id v42 = v9;
      __int16 v43 = 2112;
      uint64_t v44 = (uint64_t)v32;
      __int16 v45 = 2112;
      v46 = v33;
      _os_log_error_impl(&dword_1A0FEE000, v27, OS_LOG_TYPE_ERROR, "Failed edge selection update, edge %@ does not match any edge in edge list (%@ %@)", buf, 0x20u);
LABEL_35:
    }
LABEL_25:

LABEL_26:
    BOOL v12 = 0;
    goto LABEL_27;
  }
  if (!*a4)
  {
    __int16 v29 = [(NPEdgeSelection *)self waldoInfo];
    uint64_t v30 = [v29 currentEdgeIndex];

    if (v30)
    {
      BOOL v12 = 0;
      *a4 = -1;
      *__int16 v39 = -1;
      goto LABEL_27;
    }
    goto LABEL_26;
  }
  uint64_t v26 = nplog_obj();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    v34 = [(EdgeSelection *)self networkSignature];
    v35 = [(EdgeSelection *)self interfaceType];
    *(_DWORD *)buf = 138412802;
    id v42 = v9;
    __int16 v43 = 2112;
    uint64_t v44 = (uint64_t)v34;
    __int16 v45 = 2112;
    v46 = v35;
    _os_log_debug_impl(&dword_1A0FEE000, v26, OS_LOG_TYPE_DEBUG, "Edge %@ does not match current best edge, should probe (%@ %@)", buf, 0x20u);
  }
  BOOL v12 = 1;
LABEL_27:

  return v12;
}

- (void)updateEdgeSelection:(unint64_t)a3
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  uint64_t v74 = 0;
  unint64_t v75 = 0;
  uint64_t v71 = 0;
  v72 = &v71;
  uint64_t v73 = 0x2020000000;
  uint64_t v65 = 0;
  v66 = &v65;
  uint64_t v67 = 0x3032000000;
  v68 = __Block_byref_object_copy__0;
  v69 = __Block_byref_object_dispose__0;
  id v70 = [(NPEdgeSelection *)self nextBestEdge];
  uint64_t v5 = v66[5];
  id v64 = 0;
  BOOL v6 = [(NPEdgeSelection *)self shouldProbeForEdgeSelection:v5 edgeRank:v72 + 3 edgeIndex:&v75 bestEdgeLabel:&v64];
  id v7 = (__CFString *)v64;
  if (v6)
  {
    int v8 = [(NPEdgeSelection *)self waldoInfo];
    int v9 = [v8 reprocessPending];

    if (v9)
    {
      __int16 v10 = nplog_obj();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        unint64_t v11 = v66[5];
        unint64_t v12 = v72[3];
        unint64_t v13 = v75;
        __int16 v14 = [(EdgeSelection *)self networkSignature];
        uint64_t v15 = [(EdgeSelection *)self interfaceType];
        *(_DWORD *)buf = 138413314;
        unint64_t v77 = v11;
        __int16 v78 = 2048;
        unint64_t v79 = v12;
        __int16 v80 = 2048;
        unint64_t v81 = v13;
        __int16 v82 = 2112;
        unint64_t v83 = (unint64_t)v14;
        __int16 v84 = 2112;
        unint64_t v85 = (unint64_t)v15;
        _os_log_debug_impl(&dword_1A0FEE000, v10, OS_LOG_TYPE_DEBUG, "Edge selection update, reprocess probe pending, skip probe for %@ (rank %lu, index %lu) (%@ %@)", buf, 0x34u);
      }
LABEL_24:

      goto LABEL_25;
    }
    v17 = [(NPEdgeSelection *)self bestEdge];
    if ([v17 isEqualToString:v66[5]])
    {
      BOOL v18 = [(NPEdgeSelection *)self bestEdgeProbedRTT] == 0;

      if (!v18)
      {
        objc_super v19 = [(NPEdgeSelection *)self probeDate];
        if (v19)
        {
          uint64_t v20 = [(NPEdgeSelection *)self probeDate];
          uint64_t v21 = [MEMORY[0x1E4F1C9C8] date];
          BOOL v22 = [v20 compare:v21] == 1;

          if (v22)
          {
            int v23 = nplog_obj();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              unint64_t v43 = v66[5];
              uint64_t v44 = [(NPEdgeSelection *)self probeDate];
              __int16 v45 = [(EdgeSelection *)self networkSignature];
              v46 = [(EdgeSelection *)self interfaceType];
              *(_DWORD *)buf = 138413058;
              unint64_t v77 = v43;
              __int16 v78 = 2112;
              unint64_t v79 = (unint64_t)v44;
              __int16 v80 = 2112;
              unint64_t v81 = (unint64_t)v45;
              __int16 v82 = 2112;
              unint64_t v83 = (unint64_t)v46;
              _os_log_debug_impl(&dword_1A0FEE000, v23, OS_LOG_TYPE_DEBUG, "Edge selection update, skip probe for %@ because the probe date (%@) has not passed (%@ %@)", buf, 0x2Au);
            }
            [(NPEdgeSelection *)self setBestEdge:v66[5]];
            [(NPEdgeSelection *)self setBestEdgeRTT:a3];
            v24 = nplog_obj();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            {
              __int16 v47 = @"<unknown>";
              if (v7) {
                __int16 v47 = v7;
              }
              unint64_t v48 = [(NPEdgeSelection *)self bestEdgeRTT];
              uint64_t v49 = [(NPEdgeSelection *)self bestEdge];
              unint64_t v50 = [(NPEdgeSelection *)self nextBestEdgeRTT];
              unint64_t v51 = [(NPEdgeSelection *)self bestEdgeProbedRTT];
              v52 = [(EdgeSelection *)self networkSignature];
              v53 = [(EdgeSelection *)self interfaceType];
              *(_DWORD *)buf = 138413826;
              unint64_t v77 = v55;
              __int16 v78 = 2048;
              unint64_t v79 = v48;
              __int16 v80 = 2112;
              unint64_t v81 = (unint64_t)v49;
              __int16 v82 = 2048;
              unint64_t v83 = v50;
              __int16 v84 = 2048;
              unint64_t v85 = v51;
              __int16 v86 = 2112;
              v87 = v52;
              __int16 v88 = 2112;
              v89 = v53;
              _os_log_debug_impl(&dword_1A0FEE000, v24, OS_LOG_TYPE_DEBUG, "Edge selection update, best edge mismatched (%@ RTT %lu, ES %@ last RTT %lu, current RTT %lu) (%@ %@)", buf, 0x48u);
            }
            __int16 v10 = [(NPEdgeSelection *)self bestEdge];
            [(NPEdgeSelection *)self trainEdgeSelection:v10 edgeRank:v72[3] rtt:[(NPEdgeSelection *)self bestEdgeProbedRTT]];
            goto LABEL_24;
          }
        }
      }
    }
    else
    {
    }
    __int16 v25 = [(NPEdgeSelection *)self waldoInfo];
    uint64_t v26 = [v25 edges];
    __int16 v27 = [v26 objectAtIndexedSubscript:v75];

    v28 = nplog_obj();
    __int16 v10 = v28;
    if (v27)
    {
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        unint64_t v39 = v66[5];
        unint64_t v40 = v72[3];
        unint64_t v54 = v75;
        v41 = [(EdgeSelection *)self networkSignature];
        id v42 = [(EdgeSelection *)self interfaceType];
        *(_DWORD *)buf = 138413314;
        unint64_t v77 = v39;
        __int16 v78 = 2048;
        unint64_t v79 = v40;
        __int16 v80 = 2048;
        unint64_t v81 = v54;
        __int16 v82 = 2112;
        unint64_t v83 = (unint64_t)v41;
        __int16 v84 = 2112;
        unint64_t v85 = (unint64_t)v42;
        _os_log_debug_impl(&dword_1A0FEE000, v10, OS_LOG_TYPE_DEBUG, "Edge selection update, probing %@ (rank %lu, index %lu) (%@ %@)", buf, 0x34u);
      }
      [v27 setProbePending:1];
      id v29 = objc_alloc(MEMORY[0x1E4F1C9C8]);
      uint64_t v30 = [(NPEdgeSelection *)self waldoInfo];
      uint64_t v31 = [v30 probePause];
      [v31 doubleValue];
      v32 = objc_msgSend(v29, "initWithTimeIntervalSinceNow:");
      [(NPEdgeSelection *)self setProbeDate:v32];

      id v33 = [(NPEdgeSelection *)self waldoInfo];
      unint64_t v34 = v75;
      v56[0] = MEMORY[0x1E4F143A8];
      v56[1] = 3221225472;
      v56[2] = __39__NPEdgeSelection_updateEdgeSelection___block_invoke;
      v56[3] = &unk_1E5A3B2F8;
      __int16 v10 = v27;
      v57 = v10;
      v58 = self;
      v60 = &v65;
      uint64_t v62 = 1;
      unint64_t v63 = a3;
      v59 = v7;
      v61 = &v71;
      [v33 reprocessAdHocWithEdgeIndex:v34 completionHandler:v56];
    }
    else if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v77 = v75;
      _os_log_error_impl(&dword_1A0FEE000, v10, OS_LOG_TYPE_ERROR, "Edge selection probe skipped, no edge for index %lu", buf, 0xCu);
    }
    goto LABEL_24;
  }
  if ((v72[3] & 0x8000000000000000) == 0)
  {
    [(NPEdgeSelection *)self setBestEdge:v66[5]];
    [(NPEdgeSelection *)self setBestEdgeRTT:a3];
    [(NPEdgeSelection *)self setBestEdgeProbedRTT:0];
    unint64_t v16 = nplog_obj();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v35 = v66[5];
      unint64_t v36 = [(NPEdgeSelection *)self nextBestEdgeRTT];
      __int16 v37 = [(EdgeSelection *)self networkSignature];
      v38 = [(EdgeSelection *)self interfaceType];
      *(_DWORD *)buf = 138413314;
      unint64_t v77 = v35;
      __int16 v78 = 2048;
      unint64_t v79 = v36;
      __int16 v80 = 2048;
      unint64_t v81 = a3;
      __int16 v82 = 2112;
      unint64_t v83 = (unint64_t)v37;
      __int16 v84 = 2112;
      unint64_t v85 = (unint64_t)v38;
      _os_log_debug_impl(&dword_1A0FEE000, v16, OS_LOG_TYPE_DEBUG, "Edge selection update, best edge matched (%@ last RTT %lu, current RTT %lu) (%@ %@)", buf, 0x34u);
    }
    [(NPEdgeSelection *)self trainEdgeSelection:v66[5] edgeRank:v72[3] rtt:[(NPEdgeSelection *)self bestEdgeRTT]];
  }
LABEL_25:

  _Block_object_dispose(&v65, 8);
  _Block_object_dispose(&v71, 8);
}

void __39__NPEdgeSelection_updateEdgeSelection___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [*(id *)(a1 + 32) setProbePending:0];
  uint64_t v4 = nplog_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    unint64_t v11 = [*(id *)(a1 + 40) networkSignature];
    unint64_t v12 = [*(id *)(a1 + 40) interfaceType];
    int v24 = 138412802;
    uint64_t v25 = v10;
    __int16 v26 = 2112;
    uint64_t v27 = (uint64_t)v11;
    __int16 v28 = 2112;
    id v29 = v12;
    _os_log_debug_impl(&dword_1A0FEE000, v4, OS_LOG_TYPE_DEBUG, "Edge selection probe, got sorted result for %@ (%@ %@)", (uint8_t *)&v24, 0x20u);
  }
  uint64_t v5 = [*(id *)(a1 + 40) waldoInfo];
  [v5 logEdgeList:v3 debug:1 toStdout:0];

  if ([v3 count] == *(void *)(a1 + 72))
  {
    [*(id *)(a1 + 40) setBestEdge:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    [*(id *)(a1 + 40) setBestEdgeRTT:*(void *)(a1 + 80)];
    BOOL v6 = [v3 objectAtIndexedSubscript:0];
    objc_msgSend(*(id *)(a1 + 40), "setBestEdgeProbedRTT:", objc_msgSend(v6, "roundTripTime"));

    id v7 = nplog_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      if (*(void *)(a1 + 48)) {
        unint64_t v13 = *(__CFString **)(a1 + 48);
      }
      else {
        unint64_t v13 = @"<unknown>";
      }
      uint64_t v14 = [*(id *)(a1 + 40) bestEdgeRTT];
      uint64_t v15 = [*(id *)(a1 + 40) bestEdge];
      uint64_t v16 = [*(id *)(a1 + 40) nextBestEdgeRTT];
      uint64_t v17 = [*(id *)(a1 + 40) bestEdgeProbedRTT];
      BOOL v18 = [*(id *)(a1 + 40) networkSignature];
      objc_super v19 = [*(id *)(a1 + 40) interfaceType];
      int v24 = 138413826;
      uint64_t v25 = (uint64_t)v13;
      __int16 v26 = 2048;
      uint64_t v27 = v14;
      __int16 v28 = 2112;
      id v29 = v15;
      __int16 v30 = 2048;
      uint64_t v31 = v16;
      __int16 v32 = 2048;
      uint64_t v33 = v17;
      __int16 v34 = 2112;
      unint64_t v35 = v18;
      __int16 v36 = 2112;
      __int16 v37 = v19;
      _os_log_debug_impl(&dword_1A0FEE000, v7, OS_LOG_TYPE_DEBUG, "Edge selection update, best edge mismatched (%@ RTT %lu, ES %@ last RTT %lu, current RTT %lu) (%@ %@)", (uint8_t *)&v24, 0x48u);
    }
    int v8 = *(void **)(a1 + 40);
    int v9 = [v8 bestEdge];
    objc_msgSend(v8, "trainEdgeSelection:edgeRank:rtt:", v9, *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24), objc_msgSend(*(id *)(a1 + 40), "bestEdgeProbedRTT"));
  }
  else
  {
    int v9 = nplog_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = [v3 count];
      uint64_t v21 = *(void *)(a1 + 72);
      BOOL v22 = [*(id *)(a1 + 40) networkSignature];
      int v23 = [*(id *)(a1 + 40) interfaceType];
      int v24 = 134218754;
      uint64_t v25 = v20;
      __int16 v26 = 2048;
      uint64_t v27 = v21;
      __int16 v28 = 2112;
      id v29 = v22;
      __int16 v30 = 2112;
      uint64_t v31 = (uint64_t)v23;
      _os_log_error_impl(&dword_1A0FEE000, v9, OS_LOG_TYPE_ERROR, "Edge selection probe, sorted result count (%lu) != %lu (%@ %@)", (uint8_t *)&v24, 0x2Au);
    }
  }
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v4 = [(NPEdgeSelection *)self bestEdge];
  unint64_t v5 = [(NPEdgeSelection *)self bestEdgeRTT];
  unint64_t v6 = [(NPEdgeSelection *)self bestEdgeProbedRTT];
  id v7 = [(NPEdgeSelection *)self nextBestEdge];
  [v3 appendFormat:@"Edge Selection: best edge <%@, rtt %lu, probed rtt %lu> next best edge <%@, rtt %lu> trialCount %ld", v4, v5, v6, v7, -[NPEdgeSelection nextBestEdgeRTT](self, "nextBestEdgeRTT"), -[EdgeSelection trialCount](self, "trialCount")];

  v10.receiver = self;
  v10.super_class = (Class)NPEdgeSelection;
  int v8 = [(EdgeSelection *)&v10 description];
  [v3 appendFormat:@"\n\n%@", v8];

  return v3;
}

- (id)copyEdgeSelectionTelemetry
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v4 = [(NPEdgeSelection *)self bestEdge];
  [v3 setObject:v4 forKeyedSubscript:@"bestEdge"];

  unint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NPEdgeSelection bestEdgeRTT](self, "bestEdgeRTT"));
  [v3 setObject:v5 forKeyedSubscript:@"bestEdgeRTT"];

  unint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NPEdgeSelection bestEdgeProbedRTT](self, "bestEdgeProbedRTT"));
  [v3 setObject:v6 forKeyedSubscript:@"bestEdgeProbedRTT"];

  id v7 = [(NPEdgeSelection *)self nextBestEdge];
  [v3 setObject:v7 forKeyedSubscript:@"nextBestEdge"];

  int v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NPEdgeSelection nextBestEdgeRTT](self, "nextBestEdgeRTT"));
  [v3 setObject:v8 forKeyedSubscript:@"nextBestEdgeRTT"];

  int v9 = objc_msgSend(NSNumber, "numberWithInteger:", -[EdgeSelection trialCount](self, "trialCount"));
  [v3 setObject:v9 forKeyedSubscript:@"trialCount"];

  return v3;
}

- (NPWaldo)waldoInfo
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_waldoInfo);
  return (NPWaldo *)WeakRetained;
}

- (void)setWaldoInfo:(id)a3
{
}

- (NSString)bestEdge
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setBestEdge:(id)a3
{
}

- (unint64_t)bestEdgeRTT
{
  return self->_bestEdgeRTT;
}

- (void)setBestEdgeRTT:(unint64_t)a3
{
  self->_bestEdgeRTT = a3;
}

- (unint64_t)bestEdgeProbedRTT
{
  return self->_bestEdgeProbedRTT;
}

- (void)setBestEdgeProbedRTT:(unint64_t)a3
{
  self->_bestEdgeProbedRTT = a3;
}

- (NSString)nextBestEdge
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setNextBestEdge:(id)a3
{
}

- (unint64_t)nextBestEdgeRTT
{
  return self->_nextBestEdgeRTT;
}

- (void)setNextBestEdgeRTT:(unint64_t)a3
{
  self->_nextBestEdgeRTT = a3;
}

- (NSDate)probeDate
{
  return (NSDate *)objc_getProperty(self, a2, 104, 1);
}

- (void)setProbeDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_probeDate, 0);
  objc_storeStrong((id *)&self->_nextBestEdge, 0);
  objc_storeStrong((id *)&self->_bestEdge, 0);
  objc_destroyWeak((id *)&self->_waldoInfo);
}

@end