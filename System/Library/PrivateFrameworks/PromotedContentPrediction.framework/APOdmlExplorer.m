@interface APOdmlExplorer
- (APOdmlExplorer)initWithRankableObjects:(id)a3 pttrArray:(id)a4 assetManager:(id)a5;
- (NSMutableArray)sortableObjects;
- (NSNumber)clipping_bound;
- (NSNumber)epsilon;
- (NSString)mode;
- (NSString)noise_type;
- (id)cumulativeEpsilonGreedyProbabilityDistribution;
- (id)epsilonGreedyProbabilityDistribution;
- (id)explore;
- (id)greedy;
- (id)randomizedResponse;
- (id)rankableObjectsFromSortable;
- (id)sortableArray:(id)a3 pttrArray:(id)a4;
- (void)setSortableObjects:(id)a3;
@end

@implementation APOdmlExplorer

- (APOdmlExplorer)initWithRankableObjects:(id)a3 pttrArray:(id)a4 assetManager:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v30.receiver = self;
  v30.super_class = (Class)APOdmlExplorer;
  v11 = [(APOdmlExplorer *)&v30 init];
  v13 = v11;
  if (v11)
  {
    uint64_t v14 = objc_msgSend_sortableArray_pttrArray_(v11, v12, (uint64_t)v8, v9);
    sortableObjects = v13->_sortableObjects;
    v13->_sortableObjects = (NSMutableArray *)v14;

    uint64_t v17 = objc_msgSend_doubleValueForFactor_(v10, v16, @"EpsilonDP");
    epsilon = v13->_epsilon;
    v13->_epsilon = (NSNumber *)v17;

    uint64_t v20 = objc_msgSend_stringValueForFactor_(v10, v19, @"ExploreMode");
    mode = v13->_mode;
    v13->_mode = (NSString *)v20;

    uint64_t v23 = objc_msgSend_stringValueForFactor_(v10, v22, @"ExploreNoiseType");
    noise_type = v13->_noise_type;
    v13->_noise_type = (NSString *)v23;

    uint64_t v26 = objc_msgSend_doubleValueForFactor_(v10, v25, @"ExploreClippingBound");
    clipping_bound = v13->_clipping_bound;
    v13->_clipping_bound = (NSNumber *)v26;

    time_t v28 = time(0);
    srand48(v28);
  }

  return v13;
}

- (id)sortableArray:(id)a3 pttrArray:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v9 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v7, v8);
  if (objc_msgSend_count(v6, v10, v11))
  {
    unint64_t v12 = 0;
    do
    {
      v13 = [APOdmlSortableObject alloc];
      v15 = objc_msgSend_objectAtIndexedSubscript_(v5, v14, v12);
      uint64_t v17 = objc_msgSend_objectAtIndexedSubscript_(v6, v16, v12);
      v19 = objc_msgSend_initWithRankable_andPTTR_(v13, v18, (uint64_t)v15, v17);

      objc_msgSend_addObject_(v9, v20, (uint64_t)v19);
      ++v12;
    }
    while (v12 < objc_msgSend_count(v6, v21, v22));
  }

  return v9;
}

- (id)explore
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend_mode(self, a2, v2);
  int isEqualToString = objc_msgSend_isEqualToString_(v4, v5, @"greedy");

  if (isEqualToString)
  {
    id v9 = objc_msgSend_greedy(self, v7, v8);
  }
  else
  {
    id v10 = objc_msgSend_mode(self, v7, v8);
    int v12 = objc_msgSend_isEqualToString_(v10, v11, @"randomized-response");

    if (v12)
    {
      id v9 = objc_msgSend_randomizedResponse(self, v13, v14);
    }
    else
    {
      v15 = OdmlLogForCategory(5uLL);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        int v20 = 138412290;
        id v21 = (id)objc_opt_class();
        id v16 = v21;
        _os_log_impl(&dword_1BBC44000, v15, OS_LOG_TYPE_ERROR, "[%@] Exploration error: exploration type not found.", (uint8_t *)&v20, 0xCu);
      }
      id v9 = objc_msgSend_rankableObjectsFromSortable(self, v17, v18);
    }
  }

  return v9;
}

- (id)randomizedResponse
{
  v4 = objc_msgSend_cumulativeEpsilonGreedyProbabilityDistribution(self, a2, v2);
  double v5 = drand48();
  if (objc_msgSend_count(v4, v6, v7))
  {
    uint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = objc_msgSend_objectAtIndexedSubscript_(v4, v8, v10);
      objc_msgSend_doubleValue(v11, v12, v13);
      double v15 = v14;

      if (v5 < v15) {
        break;
      }
      if (++v10 >= (unint64_t)objc_msgSend_count(v4, v8, v9)) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    uint64_t v10 = 0;
  }
  id v16 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v17 = objc_msgSend_sortableObjects(self, v8, v9);
  v19 = objc_msgSend_arrayWithArray_(v16, v18, (uint64_t)v17);

  id v21 = objc_msgSend_objectAtIndexedSubscript_(v19, v20, 0);
  uint64_t v23 = objc_msgSend_objectAtIndexedSubscript_(v19, v22, v10);
  objc_msgSend_setObject_atIndexedSubscript_(v19, v24, (uint64_t)v23, 0);

  objc_msgSend_setObject_atIndexedSubscript_(v19, v25, (uint64_t)v21, v10);
  objc_msgSend_setSortableObjects_(self, v26, (uint64_t)v19);
  v29 = objc_msgSend_rankableObjectsFromSortable(self, v27, v28);

  return v29;
}

- (id)cumulativeEpsilonGreedyProbabilityDistribution
{
  v3 = objc_msgSend_epsilonGreedyProbabilityDistribution(self, a2, v2);
  if ((unint64_t)objc_msgSend_count(v3, v4, v5) >= 2)
  {
    unint64_t v8 = 1;
    do
    {
      uint64_t v9 = objc_msgSend_objectAtIndexedSubscript_(v3, v6, v8);
      objc_msgSend_doubleValue(v9, v10, v11);
      double v13 = v12;
      double v15 = objc_msgSend_objectAtIndexedSubscript_(v3, v14, v8 - 1);
      objc_msgSend_doubleValue(v15, v16, v17);
      double v19 = v13 + v18;

      uint64_t v22 = objc_msgSend_numberWithDouble_(NSNumber, v20, v21, v19);
      objc_msgSend_setObject_atIndexedSubscript_(v3, v23, (uint64_t)v22, v8);

      ++v8;
    }
    while (v8 < objc_msgSend_count(v3, v24, v25));
  }
  uint64_t v26 = objc_msgSend_copy(v3, v6, v7);

  return v26;
}

- (id)epsilonGreedyProbabilityDistribution
{
  v4 = objc_msgSend_sortableObjects(self, a2, v2);
  uint64_t v7 = objc_msgSend_count(v4, v5, v6);

  uint64_t v10 = objc_msgSend_sortableObjects(self, v8, v9);
  objc_msgSend_shuffle(v10, v11, v12);

  double v15 = objc_msgSend_sortableObjects(self, v13, v14);
  uint64_t v17 = objc_msgSend_objectAtIndexedSubscript_(v15, v16, 0);
  int v20 = objc_msgSend_pTTR(v17, v18, v19);

  uint64_t v23 = objc_msgSend_sortableObjects(self, v21, v22);
  uint64_t v26 = objc_msgSend_count(v23, v24, v25);

  int v29 = 0;
  if (v26)
  {
    unint64_t v30 = 0;
    do
    {
      v31 = objc_msgSend_sortableObjects(self, v27, v28);
      v33 = objc_msgSend_objectAtIndexedSubscript_(v31, v32, v30);
      v36 = objc_msgSend_pTTR(v33, v34, v35);

      objc_msgSend_doubleValue(v36, v37, v38);
      double v40 = v39;
      objc_msgSend_doubleValue(v20, v41, v42);
      if (v40 > v43)
      {
        id v44 = v36;

        int v20 = v44;
        int v29 = v30;
      }

      ++v30;
      v47 = objc_msgSend_sortableObjects(self, v45, v46);
      unint64_t v50 = objc_msgSend_count(v47, v48, v49);
    }
    while (v30 < v50);
  }
  v51 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v27, v28);
  v54 = objc_msgSend_epsilon(self, v52, v53);
  objc_msgSend_doubleValue(v54, v55, v56);
  double v58 = exp(v57);

  v61 = objc_msgSend_sortableObjects(self, v59, v60);
  uint64_t v64 = objc_msgSend_count(v61, v62, v63);

  if (v64)
  {
    unint64_t v67 = 0;
    double v68 = v58 + (double)(unint64_t)(v7 - 1);
    do
    {
      double v69 = 1.0;
      if (v29 == v67)
      {
        v70 = objc_msgSend_epsilon(self, v65, v66);
        objc_msgSend_doubleValue(v70, v71, v72);
        double v69 = exp(v73);
      }
      v74 = objc_msgSend_numberWithDouble_(NSNumber, v65, v66, v69 / v68);
      objc_msgSend_addObject_(v51, v75, (uint64_t)v74);

      ++v67;
      v78 = objc_msgSend_sortableObjects(self, v76, v77);
      unint64_t v81 = objc_msgSend_count(v78, v79, v80);
    }
    while (v67 < v81);
  }

  return v51;
}

- (id)greedy
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend_sortableObjects(self, a2, v2);
  uint64_t v6 = objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x1E4F29008], v5, @"pTTR", 0);
  v14[0] = v6;
  unint64_t v8 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v7, (uint64_t)v14, 1);
  objc_msgSend_sortUsingDescriptors_(v4, v9, (uint64_t)v8);

  uint64_t v12 = objc_msgSend_rankableObjectsFromSortable(self, v10, v11);

  return v12;
}

- (id)rankableObjectsFromSortable
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v5 = objc_msgSend_sortableObjects(self, a2, v2);
  uint64_t v8 = objc_msgSend_count(v5, v6, v7);
  uint64_t v10 = objc_msgSend_arrayWithCapacity_(v4, v9, v8);

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  double v13 = objc_msgSend_sortableObjects(self, v11, v12, 0);
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v27, v31, 16);
  if (v15)
  {
    uint64_t v18 = v15;
    uint64_t v19 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v28 != v19) {
          objc_enumerationMutation(v13);
        }
        uint64_t v21 = objc_msgSend_rankable(*(void **)(*((void *)&v27 + 1) + 8 * i), v16, v17);
        objc_msgSend_addObject_(v10, v22, (uint64_t)v21);
      }
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v27, v31, 16);
    }
    while (v18);
  }

  uint64_t v25 = objc_msgSend_copy(v10, v23, v24);

  return v25;
}

- (NSMutableArray)sortableObjects
{
  return self->_sortableObjects;
}

- (void)setSortableObjects:(id)a3
{
}

- (NSNumber)epsilon
{
  return self->_epsilon;
}

- (NSString)mode
{
  return self->_mode;
}

- (NSString)noise_type
{
  return self->_noise_type;
}

- (NSNumber)clipping_bound
{
  return self->_clipping_bound;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clipping_bound, 0);
  objc_storeStrong((id *)&self->_noise_type, 0);
  objc_storeStrong((id *)&self->_mode, 0);
  objc_storeStrong((id *)&self->_epsilon, 0);

  objc_storeStrong((id *)&self->_sortableObjects, 0);
}

@end