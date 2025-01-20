@interface APOdmlReranker
+ (OS_dispatch_queue)rerankResponseTimeoutQueue;
+ (OS_dispatch_queue)rerankSerialQueue;
- (APOdmlAssetManager)assetManager;
- (APOdmlReranker)init;
- (APOdmlReranker)initWithPersonalizedAdsEnabled:(BOOL)a3 assetManager:(id)a4 placementType:(unint64_t)a5;
- (APOdmlReranker)initWithPersonalizedAdsEnabled:(BOOL)a3 placementType:(unint64_t)a4;
- (APOdmlUnfairLock)rerankResponseLock;
- (BOOL)isPersonalizedAdsEnabled;
- (BOOL)sendRerankResponseIfAvailable:(id)a3 error:(id)a4;
- (NSArray)originalAds;
- (NSArray)rerankedAds;
- (NSDate)rerankingStartDate;
- (NSError)rerankerError;
- (OS_dispatch_group)rerankDispatchGroup;
- (id)predictAndExplore:(id)a3;
- (id)rerankResponse;
- (unint64_t)ident;
- (unint64_t)placementType;
- (void)_handleError:(int64_t)a3;
- (void)getRerankedAdsWithTimeLimit:(double)a3 completion:(id)a4;
- (void)rerankResponseTimeout;
- (void)setAndRerankAds:(id)a3;
- (void)setAssetManager:(id)a3;
- (void)setOriginalAds:(id)a3;
- (void)setPlacementType:(unint64_t)a3;
- (void)setRerankResponse:(id)a3;
- (void)setRerankResponseLock:(id)a3;
- (void)setRerankedAds:(id)a3;
- (void)setRerankerError:(id)a3;
- (void)setRerankingStartDate:(id)a3;
@end

@implementation APOdmlReranker

- (APOdmlReranker)init
{
  return (APOdmlReranker *)MEMORY[0x1F4181798](self, sel_initWithPersonalizedAdsEnabled_placementType_, 1);
}

- (APOdmlReranker)initWithPersonalizedAdsEnabled:(BOOL)a3 placementType:(unint64_t)a4
{
  BOOL v5 = a3;
  v7 = objc_msgSend_sharedAssetManagerCoordinator(APOdmlAssetManagerCoordinator, a2, a3);
  v9 = objc_msgSend_assetManagerForPlacementType_assetManagerType_(v7, v8, a4, 0);

  v11 = (APOdmlReranker *)objc_msgSend_initWithPersonalizedAdsEnabled_assetManager_placementType_(self, v10, v5, v9, a4);
  return v11;
}

- (APOdmlReranker)initWithPersonalizedAdsEnabled:(BOOL)a3 assetManager:(id)a4 placementType:(unint64_t)a5
{
  id v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)APOdmlReranker;
  v10 = [(APOdmlReranker *)&v20 init];
  v11 = v10;
  if (v10)
  {
    v10->_isPersonalizedAdsEnabled = a3;
    objc_storeStrong((id *)&v10->_assetManager, a4);
    v12 = [APOdmlUnfairLock alloc];
    uint64_t v14 = objc_msgSend_initWithOptions_(v12, v13, 1);
    rerankResponseLock = v11->_rerankResponseLock;
    v11->_rerankResponseLock = (APOdmlUnfairLock *)v14;

    v16 = OdmlLogForCategory(5uLL);
    v11->_ident = os_signpost_id_generate(v16);

    v11->_placementType = a5;
    dispatch_group_t v17 = dispatch_group_create();
    rerankDispatchGroup = v11->_rerankDispatchGroup;
    v11->_rerankDispatchGroup = (OS_dispatch_group *)v17;
  }
  return v11;
}

- (void)setAndRerankAds:(id)a3
{
  id v4 = a3;
  BOOL v5 = OdmlLogForCategory(5uLL);
  uint64_t v8 = objc_msgSend_ident(self, v6, v7);
  if ((unint64_t)(v8 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v9 = v8;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBC44000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v9, "Head start", (const char *)&unk_1BBC77EAD, buf, 2u);
    }
  }

  v10 = OdmlLogForCategory(5uLL);
  uint64_t v13 = objc_msgSend_ident(self, v11, v12);
  if ((unint64_t)(v13 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v14 = v13;
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBC44000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v14, "GCD Overhead", (const char *)&unk_1BBC77EAD, buf, 2u);
    }
  }

  v15 = OdmlLogForCategory(5uLL);
  uint64_t v18 = objc_msgSend_ident(self, v16, v17);
  if ((unint64_t)(v18 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v19 = v18;
    if (os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBC44000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v19, "Overall reranking", (const char *)&unk_1BBC77EAD, buf, 2u);
    }
  }

  v22 = objc_msgSend_rerankDispatchGroup(self, v20, v21);
  v25 = objc_msgSend_rerankSerialQueue(APOdmlReranker, v23, v24);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = sub_1BBC6AF60;
  v27[3] = &unk_1E624A8A0;
  v27[4] = self;
  id v28 = v4;
  id v26 = v4;
  dispatch_group_async(v22, v25, v27);
}

- (void)getRerankedAdsWithTimeLimit:(double)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = OdmlLogForCategory(5uLL);
  uint64_t v10 = objc_msgSend_ident(self, v8, v9);
  if ((unint64_t)(v10 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v11 = v10;
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBC44000, v7, OS_SIGNPOST_INTERVAL_END, v11, "Head start", (const char *)&unk_1BBC77EAD, buf, 2u);
    }
  }

  os_signpost_id_t v14 = objc_msgSend_rerankResponseLock(self, v12, v13);
  objc_msgSend_lock(v14, v15, v16);
  objc_msgSend_setRerankResponse_(self, v17, (uint64_t)v6);

  objc_msgSend_unlock(v14, v18, v19);
  v22 = objc_msgSend_rerankDispatchGroup(self, v20, v21);
  v25 = objc_msgSend_rerankSerialQueue(APOdmlReranker, v23, v24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1BBC6B49C;
  block[3] = &unk_1E624A800;
  block[4] = self;
  dispatch_group_async(v22, v25, block);

  id v28 = objc_msgSend_rerankResponseTimeoutQueue(APOdmlReranker, v26, v27);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = sub_1BBC6B72C;
  v29[3] = &unk_1E624B060;
  v29[4] = self;
  *(double *)&v29[5] = a3;
  dispatch_async(v28, v29);
}

- (id)predictAndExplore:(id)a3
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = OdmlLogForCategory(5uLL);
  uint64_t v8 = objc_msgSend_ident(self, v6, v7);
  if ((unint64_t)(v8 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v9 = v8;
    if (os_signpost_enabled(v5))
    {
      int v66 = 134283521;
      uint64_t v67 = objc_msgSend_count(v4, v10, v11);
      _os_signpost_emit_with_name_impl(&dword_1BBC44000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v9, "Aggregated PTTR Prediction", "%{private}lu", (uint8_t *)&v66, 0xCu);
    }
  }

  uint64_t v12 = [APOdmlPredictor alloc];
  v15 = objc_msgSend_assetManager(self, v13, v14);
  uint64_t v18 = objc_msgSend_assetManager(self, v16, v17);
  uint64_t v21 = objc_msgSend_currentMLModel(v18, v19, v20);
  v23 = objc_msgSend_initWithResponses_assetManager_model_(v12, v22, (uint64_t)v4, v15, v21);

  id v26 = objc_msgSend_predictTapThroughRate(v23, v24, v25);
  v29 = v26;
  if (!v26)
  {
    v52 = OdmlLogForCategory(5uLL);
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      v53 = objc_opt_class();
      int v66 = 138412546;
      uint64_t v67 = (uint64_t)v53;
      __int16 v68 = 2112;
      uint64_t v69 = 0;
      id v54 = v53;
      _os_log_impl(&dword_1BBC44000, v52, OS_LOG_TYPE_ERROR, "[%@] Reranking Error: pttrArray %@ is empty or nil.", (uint8_t *)&v66, 0x16u);
    }
    v56 = &kAPOdmlRerankingPttrArrayNil;
    goto LABEL_16;
  }
  uint64_t v30 = objc_msgSend_count(v26, v27, v28);
  uint64_t v33 = objc_msgSend_count(v4, v31, v32);
  v34 = OdmlLogForCategory(5uLL);
  v37 = v34;
  if (v30 != v33)
  {
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      v57 = objc_opt_class();
      id v58 = v57;
      uint64_t v61 = objc_msgSend_count(v29, v59, v60);
      uint64_t v64 = objc_msgSend_count(v4, v62, v63);
      int v66 = 138412802;
      uint64_t v67 = (uint64_t)v57;
      __int16 v68 = 2048;
      uint64_t v69 = v61;
      __int16 v70 = 2048;
      uint64_t v71 = v64;
      _os_log_impl(&dword_1BBC44000, v37, OS_LOG_TYPE_ERROR, "[%@] Reranking Error: pttrArray count %lu does not match rankableObjects count %lu.", (uint8_t *)&v66, 0x20u);
    }
    v56 = &kAPOdmlRerankingPttrArrayCountMismatch;
LABEL_16:
    objc_msgSend__handleError_(self, v55, *v56);
    v51 = 0;
    goto LABEL_17;
  }
  uint64_t v38 = objc_msgSend_ident(self, v35, v36);
  if ((unint64_t)(v38 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v39 = v38;
    if (os_signpost_enabled(v37))
    {
      uint64_t v42 = objc_msgSend_count(v4, v40, v41);
      int v66 = 134283521;
      uint64_t v67 = v42;
      _os_signpost_emit_with_name_impl(&dword_1BBC44000, v37, OS_SIGNPOST_INTERVAL_END, v39, "Aggregated PTTR Prediction", "%{private}lu", (uint8_t *)&v66, 0xCu);
    }
  }

  v43 = [APOdmlExplorer alloc];
  v46 = objc_msgSend_assetManager(self, v44, v45);
  v48 = objc_msgSend_initWithRankableObjects_pttrArray_assetManager_(v43, v47, (uint64_t)v4, v29, v46);

  v51 = objc_msgSend_explore(v48, v49, v50);

LABEL_17:

  return v51;
}

- (BOOL)sendRerankResponseIfAvailable:(id)a3 error:(id)a4
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = OdmlLogForCategory(5uLL);
  uint64_t v11 = objc_msgSend_ident(self, v9, v10);
  if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v12 = v11;
    if (os_signpost_enabled(v8))
    {
      *(_DWORD *)buf = 134283521;
      double v107 = COERCE_DOUBLE(objc_msgSend_count(v6, v13, v14));
      _os_signpost_emit_with_name_impl(&dword_1BBC44000, v8, OS_SIGNPOST_INTERVAL_END, v12, "Overall reranking", "%{private}lu", buf, 0xCu);
    }
  }

  uint64_t v17 = objc_msgSend_rerankResponseLock(self, v15, v16);
  objc_msgSend_lock(v17, v18, v19);
  v22 = objc_msgSend_rerankResponse(self, v20, v21);

  if (v22)
  {
    uint64_t v25 = objc_msgSend_now(MEMORY[0x1E4F1C9C8], v23, v24);
    uint64_t v28 = objc_msgSend_rerankingStartDate(self, v26, v27);
    objc_msgSend_timeIntervalSinceDate_(v25, v29, (uint64_t)v28);
    double v31 = v30;

    objc_msgSend_rerankResponse(self, v32, v33);
    v34 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    v94 = v7;
    ((void (**)(void, id, id))v34)[2](v34, v6, v7);

    objc_msgSend_setRerankResponse_(self, v35, 0);
    uint64_t v36 = OdmlLogForCategory(5uLL);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBC44000, v36, OS_LOG_TYPE_DEFAULT, "========== Reranking Summary ==========", buf, 2u);
    }

    v37 = (void *)MEMORY[0x1E4F1CA48];
    v40 = objc_msgSend_originalAds(self, v38, v39);
    unint64_t v43 = objc_msgSend_count(v40, v41, v42);

    v95 = v6;
    unint64_t v46 = objc_msgSend_count(v6, v44, v45);
    if (v43 <= v46) {
      objc_msgSend_arrayWithCapacity_(v37, v47, v46);
    }
    else {
      objc_msgSend_arrayWithCapacity_(v37, v47, v43);
    }
    double v48 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    long long v100 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    v51 = objc_msgSend_originalAds(self, v49, v50);
    uint64_t v53 = objc_msgSend_countByEnumeratingWithState_objects_count_(v51, v52, (uint64_t)&v100, v105, 16);
    if (v53)
    {
      uint64_t v56 = v53;
      uint64_t v57 = *(void *)v101;
      do
      {
        uint64_t v58 = 0;
        do
        {
          if (*(void *)v101 != v57) {
            objc_enumerationMutation(v51);
          }
          v59 = NSNumber;
          uint64_t v60 = objc_msgSend_adamID(*(void **)(*((void *)&v100 + 1) + 8 * v58), v54, v55);
          uint64_t v63 = objc_msgSend_intValue(v60, v61, v62);
          v65 = objc_msgSend_numberWithInt_(v59, v64, v63);
          objc_msgSend_addObject_(*(void **)&v48, v66, (uint64_t)v65);

          ++v58;
        }
        while (v56 != v58);
        uint64_t v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(v51, v54, (uint64_t)&v100, v105, 16);
      }
      while (v56);
    }

    uint64_t v67 = OdmlLogForCategory(5uLL);
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      double v107 = v48;
      _os_log_impl(&dword_1BBC44000, v67, OS_LOG_TYPE_DEFAULT, "Original order: %@", buf, 0xCu);
    }

    objc_msgSend_removeAllObjects(*(void **)&v48, v68, v69);
    long long v98 = 0u;
    long long v99 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    id v70 = v95;
    uint64_t v72 = objc_msgSend_countByEnumeratingWithState_objects_count_(v70, v71, (uint64_t)&v96, v104, 16);
    if (v72)
    {
      uint64_t v75 = v72;
      uint64_t v76 = *(void *)v97;
      do
      {
        uint64_t v77 = 0;
        do
        {
          if (*(void *)v97 != v76) {
            objc_enumerationMutation(v70);
          }
          v78 = NSNumber;
          v79 = objc_msgSend_adamID(*(void **)(*((void *)&v96 + 1) + 8 * v77), v73, v74);
          uint64_t v82 = objc_msgSend_intValue(v79, v80, v81);
          v84 = objc_msgSend_numberWithInt_(v78, v83, v82);
          objc_msgSend_addObject_(*(void **)&v48, v85, (uint64_t)v84);

          ++v77;
        }
        while (v75 != v77);
        uint64_t v75 = objc_msgSend_countByEnumeratingWithState_objects_count_(v70, v73, (uint64_t)&v96, v104, 16);
      }
      while (v75);
    }

    v86 = OdmlLogForCategory(5uLL);
    if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      double v107 = v48;
      _os_log_impl(&dword_1BBC44000, v86, OS_LOG_TYPE_DEFAULT, "Reranked order: %@", buf, 0xCu);
    }

    v87 = OdmlLogForCategory(5uLL);
    id v7 = v94;
    if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_description(v94, v88, v89);
      double v90 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 138412290;
      double v107 = v90;
      _os_log_impl(&dword_1BBC44000, v87, OS_LOG_TYPE_DEFAULT, "Reranking Error %@", buf, 0xCu);
    }
    v91 = OdmlLogForCategory(5uLL);
    if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v107 = v31 * 1000.0;
      _os_log_impl(&dword_1BBC44000, v91, OS_LOG_TYPE_DEFAULT, "Reranking Duration %f ms", buf, 0xCu);
    }

    v92 = OdmlLogForCategory(5uLL);
    id v6 = v95;
    if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBC44000, v92, OS_LOG_TYPE_DEFAULT, "=======================================", buf, 2u);
    }
  }
  objc_msgSend_unlock(v17, v23, v24);

  return v22 != 0;
}

- (void)rerankResponseTimeout
{
}

- (void)_handleError:(int64_t)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  BOOL v5 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], a2, @"APOdmlRerankingErrorDomain", a3, 0);
  objc_msgSend_setRerankerError_(self, v6, (uint64_t)v5);

  os_signpost_id_t v9 = objc_msgSend_rerankerError(self, v7, v8);
  os_signpost_id_t v12 = objc_msgSend_originalAds(self, v10, v11);
  int v14 = objc_msgSend_sendRerankResponseIfAvailable_error_(self, v13, (uint64_t)v12, v9);

  if (v14)
  {
    v15 = OdmlLogForCategory(5uLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v24 = 138412546;
      id v25 = (id)objc_opt_class();
      __int16 v26 = 2048;
      int64_t v27 = a3;
      id v16 = v25;
      _os_log_impl(&dword_1BBC44000, v15, OS_LOG_TYPE_ERROR, "[%@] Reranking Error: %ld.", (uint8_t *)&v24, 0x16u);
    }
    uint64_t v19 = objc_msgSend_rerankingStartDate(self, v17, v18);
    v22 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v20, v21);
    objc_msgSend_sendTimedEvent_statusSuccess_additionalDetails_startDate_endDate_(APOdmlAnalyticsReranking, v23, (uint64_t)v9, 0, 0, v19, v22);
  }
}

+ (OS_dispatch_queue)rerankSerialQueue
{
  if (qword_1EB9F97F8 != -1) {
    dispatch_once(&qword_1EB9F97F8, &unk_1F14FE818);
  }
  v2 = (void *)qword_1EB9F97F0;

  return (OS_dispatch_queue *)v2;
}

+ (OS_dispatch_queue)rerankResponseTimeoutQueue
{
  if (qword_1EB9F97E0 != -1) {
    dispatch_once(&qword_1EB9F97E0, &unk_1F14FE838);
  }
  v2 = (void *)qword_1EB9F97E8;

  return (OS_dispatch_queue *)v2;
}

- (id)rerankResponse
{
  return self->_rerankResponse;
}

- (void)setRerankResponse:(id)a3
{
}

- (NSArray)originalAds
{
  return self->_originalAds;
}

- (void)setOriginalAds:(id)a3
{
}

- (NSArray)rerankedAds
{
  return self->_rerankedAds;
}

- (void)setRerankedAds:(id)a3
{
}

- (NSError)rerankerError
{
  return (NSError *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRerankerError:(id)a3
{
}

- (NSDate)rerankingStartDate
{
  return self->_rerankingStartDate;
}

- (void)setRerankingStartDate:(id)a3
{
}

- (APOdmlAssetManager)assetManager
{
  return self->_assetManager;
}

- (void)setAssetManager:(id)a3
{
}

- (APOdmlUnfairLock)rerankResponseLock
{
  return self->_rerankResponseLock;
}

- (void)setRerankResponseLock:(id)a3
{
}

- (unint64_t)ident
{
  return self->_ident;
}

- (BOOL)isPersonalizedAdsEnabled
{
  return self->_isPersonalizedAdsEnabled;
}

- (OS_dispatch_group)rerankDispatchGroup
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 80, 1);
}

- (unint64_t)placementType
{
  return self->_placementType;
}

- (void)setPlacementType:(unint64_t)a3
{
  self->_placementType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rerankDispatchGroup, 0);
  objc_storeStrong((id *)&self->_rerankResponseLock, 0);
  objc_storeStrong((id *)&self->_assetManager, 0);
  objc_storeStrong((id *)&self->_rerankingStartDate, 0);
  objc_storeStrong((id *)&self->_rerankerError, 0);
  objc_storeStrong((id *)&self->_rerankedAds, 0);
  objc_storeStrong((id *)&self->_originalAds, 0);

  objc_storeStrong(&self->_rerankResponse, 0);
}

@end