@interface FCUserVector
- (FCPersonalizationTreatment)personalizationTreatment;
- (FCSubscriptionController)subscriptionController;
- (FCUserVector)init;
- (FCUserVector)initWithWhitelistURL:(id)a3 modelURL:(id)a4 personalizationTreatment:(id)a5 bundleChannelIDs:(id)a6 bundleChannelIDsVersion:(id)a7 subscriptionController:(id)a8 sportsTagIDs:(id)a9;
- (NSOrderedSet)bundleChannelIDs;
- (NSOrderedSet)sportsTagIDs;
- (NSString)bundleChannelIDsVersion;
- (NSURL)modelURL;
- (NSURL)whitelistURL;
- (id)bundleSubscribedVector;
- (id)computePersonalizationVectorWithAggregateStore:(id)a3 personalizationTreatment:(id)a4 tagRanker:(id)a5 options:(int64_t)a6;
- (id)computePersonalizationVectorWithAggregateVectorProvider:(id)a3 personalizationTreatment:(id)a4 tagRanker:(id)a5 options:(int64_t)a6;
- (id)findVector:(id)a3 closestToBins:(id)a4;
- (id)subscribedBundleChannelIDs;
- (id)subscribedSportsTagsWithPersonalizationTreatment:(id)a3 tagRanker:(id)a4;
- (void)setBundleChannelIDs:(id)a3;
- (void)setBundleChannelIDsVersion:(id)a3;
- (void)setModelURL:(id)a3;
- (void)setPersonalizationTreatment:(id)a3;
- (void)setSportsTagIDs:(id)a3;
- (void)setSubscriptionController:(id)a3;
- (void)setWhitelistURL:(id)a3;
@end

@implementation FCUserVector

- (FCUserVector)initWithWhitelistURL:(id)a3 modelURL:(id)a4 personalizationTreatment:(id)a5 bundleChannelIDs:(id)a6 bundleChannelIDsVersion:(id)a7 subscriptionController:(id)a8 sportsTagIDs:(id)a9
{
  id v25 = a3;
  id v24 = a4;
  id v23 = a5;
  id v22 = a6;
  id v21 = a7;
  id v16 = a8;
  id v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)FCUserVector;
  v18 = [(FCUserVector *)&v26 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_whitelistURL, a3);
    objc_storeStrong((id *)&v19->_modelURL, a4);
    objc_storeStrong((id *)&v19->_personalizationTreatment, a5);
    objc_storeStrong((id *)&v19->_bundleChannelIDs, a6);
    objc_storeStrong((id *)&v19->_bundleChannelIDsVersion, a7);
    objc_storeStrong((id *)&v19->_subscriptionController, a8);
    objc_storeStrong((id *)&v19->_sportsTagIDs, a9);
  }

  return v19;
}

- (FCUserVector)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCUserVector init]";
    __int16 v9 = 2080;
    v10 = "FCUserVector.m";
    __int16 v11 = 1024;
    int v12 = 66;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCUserVector init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (id)computePersonalizationVectorWithAggregateVectorProvider:(id)a3 personalizationTreatment:(id)a4 tagRanker:(id)a5 options:(int64_t)a6
{
  char v6 = a6;
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = objc_alloc_init(MEMORY[0x1E4F82C50]);
  if ((v6 & 1) == 0) {
    goto LABEL_33;
  }
  id v87 = v11;
  id v14 = objc_alloc_init(MEMORY[0x1E4F1E990]);
  [v14 setComputeUnits:0];
  uint64_t v15 = (void *)MEMORY[0x1E4F1E968];
  id v16 = [(FCUserVector *)self modelURL];
  id v103 = 0;
  uint64_t v17 = [v15 compileModelAtURL:v16 error:&v103];
  id v18 = v103;

  v19 = [FCUserVectorModel alloc];
  if (v17)
  {
    id v102 = v18;
    v20 = &v102;
    uint64_t v21 = [(FCUserVectorModel *)v19 initWithContentsOfURL:v17 configuration:v14 error:&v102];
  }
  else
  {
    id v101 = v18;
    v20 = &v101;
    uint64_t v21 = [(FCUserVectorModel *)v19 initWithConfiguration:v14 error:&v101];
  }
  id v22 = (void *)v21;
  v88 = (void *)v17;
  id v23 = *v20;

  v86 = v14;
  if (v22)
  {
    v82 = v22;
    v83 = v10;
    id v85 = v22;
    id v24 = [v85 model];
    id v25 = [v24 modelDescription];
    objc_super v26 = [v25 metadata];
    v27 = objc_msgSend(v26, "fc_safeObjectForKey:", *MEMORY[0x1E4F1E898]);
    v84 = objc_msgSend(v27, "fc_safeObjectForKey:", @"version");

    v28 = (void *)MEMORY[0x1E4F1C9B8];
    v29 = [(FCUserVector *)self whitelistURL];
    uint64_t v30 = [v28 dataWithContentsOfURL:v29];

    v81 = (void *)v30;
    if (v30)
    {
      id v80 = v12;
      id v97 = v23;
      v31 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v30 options:4 error:&v97];
      id v32 = v97;

      id v10 = v83;
      if (v31)
      {
        v78 = v32;
        id v33 = v31;
        uint64_t v34 = objc_msgSend(v33, "fc_safeObjectForKey:", @"tagIds");
        objc_msgSend(v33, "fc_safeObjectForKey:", @"bins");
        v77 = id v76 = v33;
        v35 = objc_msgSend(v33, "fc_safeObjectForKey:", @"version");
        v36 = v35;
        v74 = v35;
        v75 = (void *)v34;
        if (!v88) {
          goto LABEL_10;
        }
        if (![v35 isEqualToString:v84])
        {
          id v62 = 0;
          int v60 = 1;
          id v11 = v87;
          id v22 = v82;
        }
        else
        {
LABEL_10:
          v73 = v31;
          v37 = [v83 aggregateVectorForTags:v34];
          v38 = FCPersonalizationLog;
          if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v36;
            __int16 v105 = 2112;
            v106 = v37;
            _os_log_debug_impl(&dword_1A460D000, v38, OS_LOG_TYPE_DEBUG, "Created user aggregate input with whitelist version %@ and vector %@.", buf, 0x16u);
          }
          v39 = [v85 model];
          v40 = [v39 modelDescription];
          v41 = [v40 inputDescriptionsByName];
          v42 = [v41 objectForKeyedSubscript:@"aggregates"];
          v43 = [v42 multiArrayConstraint];
          v44 = [v43 shape];

          uint64_t v45 = [v37 count];
          v46 = [v44 firstObject];
          LODWORD(v40) = [v46 intValue];

          if (v45 == (int)v40)
          {
            v47 = (void *)[objc_alloc(MEMORY[0x1E4F1E9A8]) initWithShape:v44 dataType:65600 error:0];
            id v22 = v82;
            if ([v37 count])
            {
              unint64_t v48 = 0;
              do
              {
                v49 = [v37 objectAtIndexedSubscript:v48];
                [v47 setObject:v49 atIndexedSubscript:v48];

                ++v48;
              }
              while ([v37 count] > v48);
            }
            v50 = [[FCUserVectorModelInput alloc] initWithAggregates:v47];
            id v91 = v78;
            v51 = [v85 predictionFromFeatures:v50 error:&v91];
            id v72 = v91;

            v79 = v51;
            v52 = [v51 featureValueForName:@"user_vector"];
            uint64_t v53 = [v52 multiArrayValue];

            v70 = (void *)v53;
            v71 = v44;
            if (v53)
            {
              v69 = v50;
              v54 = [(FCUserVector *)self findVector:v53 closestToBins:v77];
              v55 = [MEMORY[0x1E4F1CA58] data];
              if ([v54 count])
              {
                unint64_t v56 = 0;
                do
                {
                  *(void *)buf = 0;
                  v57 = [v54 objectAtIndex:v56];
                  [v57 doubleValue];
                  uint64_t v59 = v58;

                  *(void *)buf = v59;
                  [v55 appendBytes:buf length:8];
                  ++v56;
                }
                while ([v54 count] > v56);
              }
              [v13 setPersonalizationVector:v55];
              [v13 setVersion:v84];

              int v60 = 0;
              id v22 = v82;
              v50 = v69;
              id v61 = v72;
            }
            else
            {
              v89[0] = MEMORY[0x1E4F143A8];
              v89[1] = 3221225472;
              v89[2] = __115__FCUserVector_computePersonalizationVectorWithAggregateVectorProvider_personalizationTreatment_tagRanker_options___block_invoke_37;
              v89[3] = &unk_1E5B54CC0;
              id v61 = v72;
              id v90 = v72;
              __115__FCUserVector_computePersonalizationVectorWithAggregateVectorProvider_personalizationTreatment_tagRanker_options___block_invoke_37((uint64_t)v89);
              objc_claimAutoreleasedReturnValue();
              int v60 = 1;
              v54 = v90;
            }

            id v62 = 0;
            v78 = v61;
            id v11 = v87;
            v44 = v71;
          }
          else
          {
            v92[0] = MEMORY[0x1E4F143A8];
            v92[1] = 3221225472;
            v92[2] = __115__FCUserVector_computePersonalizationVectorWithAggregateVectorProvider_personalizationTreatment_tagRanker_options___block_invoke_34;
            v92[3] = &unk_1E5B54CE8;
            id v93 = v44;
            id v94 = v37;
            __115__FCUserVector_computePersonalizationVectorWithAggregateVectorProvider_personalizationTreatment_tagRanker_options___block_invoke_34((uint64_t)v92);
            id v62 = (id)objc_claimAutoreleasedReturnValue();

            int v60 = 1;
            v47 = v93;
            id v11 = v87;
            id v22 = v82;
          }

          id v10 = v83;
          v31 = v73;
        }

        v64 = v76;
        id v23 = v78;
      }
      else
      {
        v95[0] = MEMORY[0x1E4F143A8];
        v95[1] = 3221225472;
        v95[2] = __115__FCUserVector_computePersonalizationVectorWithAggregateVectorProvider_personalizationTreatment_tagRanker_options___block_invoke_32;
        v95[3] = &unk_1E5B54CC0;
        id v23 = v32;
        id v96 = v23;
        __115__FCUserVector_computePersonalizationVectorWithAggregateVectorProvider_personalizationTreatment_tagRanker_options___block_invoke_32((uint64_t)v95);
        id v62 = (id)objc_claimAutoreleasedReturnValue();
        int v60 = 1;
        v64 = v96;
        id v11 = v87;
        id v22 = v82;
      }

      id v12 = v80;
    }
    else
    {
      v98[0] = MEMORY[0x1E4F143A8];
      v98[1] = 3221225472;
      v98[2] = __115__FCUserVector_computePersonalizationVectorWithAggregateVectorProvider_personalizationTreatment_tagRanker_options___block_invoke_30;
      v98[3] = &unk_1E5B54CC0;
      v98[4] = self;
      __115__FCUserVector_computePersonalizationVectorWithAggregateVectorProvider_personalizationTreatment_tagRanker_options___block_invoke_30((uint64_t)v98);
      id v62 = (id)objc_claimAutoreleasedReturnValue();
      int v60 = 1;
      id v22 = v82;
      id v10 = v83;
      id v11 = v87;
    }

    v63 = v85;
  }
  else
  {
    v99[0] = MEMORY[0x1E4F143A8];
    v99[1] = 3221225472;
    v99[2] = __115__FCUserVector_computePersonalizationVectorWithAggregateVectorProvider_personalizationTreatment_tagRanker_options___block_invoke;
    v99[3] = &unk_1E5B54CC0;
    id v23 = v23;
    id v100 = v23;
    __115__FCUserVector_computePersonalizationVectorWithAggregateVectorProvider_personalizationTreatment_tagRanker_options___block_invoke((uint64_t)v99);
    id v62 = (id)objc_claimAutoreleasedReturnValue();
    int v60 = 1;
    v63 = v100;
    id v11 = v87;
  }

  if (!v60)
  {
LABEL_33:
    if ((v6 & 2) != 0)
    {
      v65 = [(FCUserVector *)self bundleSubscribedVector];
      [v13 setBundleSubscribedVector:v65];

      v66 = [(FCUserVector *)self bundleChannelIDsVersion];
      [v13 setBundleSubscribedVectorVersion:v66];
    }
    v67 = [(FCUserVector *)self subscribedSportsTagsWithPersonalizationTreatment:v11 tagRanker:v12];
    [v13 setSportsFavoritesVector:v67];

    id v62 = v13;
  }

  return v62;
}

uint64_t __115__FCUserVector_computePersonalizationVectorWithAggregateVectorProvider_personalizationTreatment_tagRanker_options___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v4;
    _os_log_error_impl(&dword_1A460D000, v2, OS_LOG_TYPE_ERROR, "Error in creating user vector model: %{public}@", (uint8_t *)&v5, 0xCu);
  }
  return 0;
}

uint64_t __115__FCUserVector_computePersonalizationVectorWithAggregateVectorProvider_personalizationTreatment_tagRanker_options___block_invoke_30(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(void **)(a1 + 32);
    int v5 = v2;
    uint64_t v6 = [v4 whitelistURL];
    int v7 = 138412290;
    v8 = v6;
    _os_log_error_impl(&dword_1A460D000, v5, OS_LOG_TYPE_ERROR, "Failed to get data from fileURL: %@", (uint8_t *)&v7, 0xCu);
  }
  return 0;
}

uint64_t __115__FCUserVector_computePersonalizationVectorWithAggregateVectorProvider_personalizationTreatment_tagRanker_options___block_invoke_32(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_error_impl(&dword_1A460D000, v2, OS_LOG_TYPE_ERROR, "Failed to serialize whitelist data: %@", (uint8_t *)&v5, 0xCu);
  }
  return 0;
}

uint64_t __115__FCUserVector_computePersonalizationVectorWithAggregateVectorProvider_personalizationTreatment_tagRanker_options___block_invoke_34(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    uint64_t v4 = v2;
    int v5 = [v3 firstObject];
    uint64_t v6 = (int)[v5 intValue];
    uint64_t v7 = [*(id *)(a1 + 40) count];
    int v9 = 134218240;
    uint64_t v10 = v6;
    __int16 v11 = 2048;
    uint64_t v12 = v7;
    _os_log_impl(&dword_1A460D000, v4, OS_LOG_TYPE_DEFAULT, "Model metadata shape %lu does not match tag list count %lu, not submitting vector.", (uint8_t *)&v9, 0x16u);
  }
  return 0;
}

uint64_t __115__FCUserVector_computePersonalizationVectorWithAggregateVectorProvider_personalizationTreatment_tagRanker_options___block_invoke_37(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_error_impl(&dword_1A460D000, v2, OS_LOG_TYPE_ERROR, "Error when performing prediction using user vector model: %@", (uint8_t *)&v5, 0xCu);
  }
  return 0;
}

- (id)computePersonalizationVectorWithAggregateStore:(id)a3 personalizationTreatment:(id)a4 tagRanker:(id)a5 options:(int64_t)a6
{
  char v6 = a6;
  uint64_t v140 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = objc_alloc_init(MEMORY[0x1E4F82C50]);
  if ((v6 & 1) == 0) {
    goto LABEL_40;
  }
  v109 = v10;
  id v14 = objc_alloc_init(MEMORY[0x1E4F1E990]);
  [v14 setComputeUnits:0];
  uint64_t v15 = (void *)MEMORY[0x1E4F1E968];
  v110 = self;
  id v16 = [(FCUserVector *)self modelURL];
  id v135 = 0;
  uint64_t v17 = [v15 compileModelAtURL:v16 error:&v135];
  id v18 = v135;

  v19 = [FCUserVectorModel alloc];
  char v108 = v6;
  if (v17)
  {
    id v134 = v18;
    v20 = &v134;
    uint64_t v21 = [(FCUserVectorModel *)v19 initWithContentsOfURL:v17 configuration:v14 error:&v134];
  }
  else
  {
    id v133 = v18;
    v20 = &v133;
    uint64_t v21 = [(FCUserVectorModel *)v19 initWithConfiguration:v14 error:&v133];
  }
  id v22 = (void *)v21;
  id v23 = *v20;

  uint64_t v107 = v14;
  if (v22)
  {
    __int16 v105 = v17;
    id v106 = v11;
    id v103 = v12;
    id v24 = v22;
    id v25 = [v24 model];
    objc_super v26 = [v25 modelDescription];
    v27 = [v26 metadata];
    v28 = objc_msgSend(v27, "fc_safeObjectForKey:", *MEMORY[0x1E4F1E898]);
    v104 = objc_msgSend(v28, "fc_safeObjectForKey:", @"version");

    v29 = (void *)MEMORY[0x1E4F1C9B8];
    uint64_t v30 = [(FCUserVector *)v110 whitelistURL];
    uint64_t v31 = [v29 dataWithContentsOfURL:v30];

    id v102 = (void *)v31;
    if (v31)
    {
      id v129 = v23;
      id v32 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v31 options:4 error:&v129];
      id v33 = v129;

      if (v32)
      {
        id v100 = v33;
        id v34 = v32;
        v35 = objc_msgSend(v34, "fc_safeObjectForKey:", @"tagIds");
        v99 = objc_msgSend(v34, "fc_safeObjectForKey:", @"bins");
        id v97 = v34;
        v36 = objc_msgSend(v34, "fc_safeObjectForKey:", @"version");
        v98 = v36;
        if (!v17) {
          goto LABEL_10;
        }
        if (![v36 isEqualToString:v104])
        {
          id v80 = 0;
          int v79 = 1;
          id v11 = v106;
        }
        else
        {
LABEL_10:
          v95 = v32;
          id v96 = v22;
          id v37 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          long long v123 = 0u;
          long long v124 = 0u;
          long long v125 = 0u;
          long long v126 = 0u;
          id v94 = v35;
          id v38 = v35;
          uint64_t v39 = [v38 countByEnumeratingWithState:&v123 objects:v139 count:16];
          if (v39)
          {
            uint64_t v40 = v39;
            uint64_t v41 = *(void *)v124;
            do
            {
              for (uint64_t i = 0; i != v40; ++i)
              {
                if (*(void *)v124 != v41) {
                  objc_enumerationMutation(v38);
                }
                uint64_t v43 = *(void *)(*((void *)&v123 + 1) + 8 * i);
                v44 = [[FCTagIDFeature alloc] initWithTagID:v43];
                [v37 setObject:v44 forKeyedSubscript:v43];
              }
              uint64_t v40 = [v38 countByEnumeratingWithState:&v123 objects:v139 count:16];
            }
            while (v40);
          }

          uint64_t v45 = [v109 baselineAggregateWithConfigurableValues:v106];
          v46 = [v37 allValues];
          v47 = [v109 aggregatesForFeatures:v46];

          unint64_t v48 = [(FCUserVector *)v110 personalizationTreatment];
          v49 = [v48 defaultScoringConfig];
          [v49 decayFactor];
          double v51 = v50;

          [v45 personalizationValueWithBaseline:0 decayRate:v51];
          uint64_t v53 = v52;
          v117[0] = MEMORY[0x1E4F143A8];
          v117[1] = 3221225472;
          v117[2] = __106__FCUserVector_computePersonalizationVectorWithAggregateStore_personalizationTreatment_tagRanker_options___block_invoke_2;
          v117[3] = &unk_1E5B54D10;
          id v92 = v47;
          id v118 = v92;
          id v93 = v37;
          id v119 = v93;
          id v91 = v45;
          id v120 = v91;
          double v121 = v51;
          uint64_t v122 = v53;
          v54 = objc_msgSend(v38, "fc_arrayByTransformingWithBlock:", v117);
          v55 = FCPersonalizationLog;
          if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v98;
            __int16 v137 = 2112;
            v138 = v54;
            _os_log_debug_impl(&dword_1A460D000, v55, OS_LOG_TYPE_DEBUG, "Created user aggregate input with whitelist version %@ and vector %@.", buf, 0x16u);
          }
          unint64_t v56 = [v24 model];
          v57 = [v56 modelDescription];
          uint64_t v58 = [v57 inputDescriptionsByName];
          uint64_t v59 = [v58 objectForKeyedSubscript:@"aggregates"];
          int v60 = [v59 multiArrayConstraint];
          id v61 = [v60 shape];

          uint64_t v62 = [v54 count];
          v63 = [v61 firstObject];
          LODWORD(v57) = [v63 intValue];

          if (v62 == (int)v57)
          {
            id v90 = v61;
            v64 = (void *)[objc_alloc(MEMORY[0x1E4F1E9A8]) initWithShape:v61 dataType:65600 error:0];
            uint64_t v17 = v105;
            id v11 = v106;
            if ([v54 count])
            {
              unint64_t v65 = 0;
              do
              {
                v66 = [v54 objectAtIndexedSubscript:v65];
                [v64 setObject:v66 atIndexedSubscript:v65];

                ++v65;
              }
              while ([v54 count] > v65);
            }
            v67 = [[FCUserVectorModelInput alloc] initWithAggregates:v64];
            id v113 = v100;
            v68 = [v24 predictionFromFeatures:v67 error:&v113];
            id v69 = v113;

            id v101 = v68;
            v70 = [v68 featureValueForName:@"user_vector"];
            uint64_t v71 = [v70 multiArrayValue];

            id v72 = (void *)v71;
            id v22 = v96;
            v88 = v72;
            id v89 = v69;
            if (v72)
            {
              id v87 = v67;
              v73 = [(FCUserVector *)v110 findVector:v72 closestToBins:v99];
              v74 = [MEMORY[0x1E4F1CA58] data];
              if ([v73 count])
              {
                unint64_t v75 = 0;
                do
                {
                  *(void *)buf = 0;
                  id v76 = [v73 objectAtIndex:v75];
                  [v76 doubleValue];
                  uint64_t v78 = v77;

                  *(void *)buf = v78;
                  [v74 appendBytes:buf length:8];
                  ++v75;
                }
                while ([v73 count] > v75);
              }
              [v13 setPersonalizationVector:v74];
              [v13 setVersion:v104];

              int v79 = 0;
              uint64_t v17 = v105;
              id v11 = v106;
              v67 = v87;
            }
            else
            {
              v111[0] = MEMORY[0x1E4F143A8];
              v111[1] = 3221225472;
              v111[2] = __106__FCUserVector_computePersonalizationVectorWithAggregateStore_personalizationTreatment_tagRanker_options___block_invoke_49;
              v111[3] = &unk_1E5B54CC0;
              id v112 = v69;
              __106__FCUserVector_computePersonalizationVectorWithAggregateStore_personalizationTreatment_tagRanker_options___block_invoke_49((uint64_t)v111);
              objc_claimAutoreleasedReturnValue();
              int v79 = 1;
              v73 = v112;
            }

            id v80 = 0;
            v82 = v90;
            id v100 = v89;
          }
          else
          {
            v114[0] = MEMORY[0x1E4F143A8];
            v114[1] = 3221225472;
            v114[2] = __106__FCUserVector_computePersonalizationVectorWithAggregateStore_personalizationTreatment_tagRanker_options___block_invoke_48;
            v114[3] = &unk_1E5B54CE8;
            id v115 = v61;
            id v116 = v54;
            __106__FCUserVector_computePersonalizationVectorWithAggregateStore_personalizationTreatment_tagRanker_options___block_invoke_48((uint64_t)v114);
            id v80 = (id)objc_claimAutoreleasedReturnValue();

            int v79 = 1;
            v64 = v115;
            v82 = v61;
            uint64_t v17 = v105;
            id v11 = v106;
            id v22 = v96;
          }

          v35 = v94;
          id v32 = v95;
        }

        id v12 = v103;
        v81 = v97;
        id v23 = v100;
      }
      else
      {
        v127[0] = MEMORY[0x1E4F143A8];
        v127[1] = 3221225472;
        v127[2] = __106__FCUserVector_computePersonalizationVectorWithAggregateStore_personalizationTreatment_tagRanker_options___block_invoke_40;
        v127[3] = &unk_1E5B54CC0;
        id v23 = v33;
        id v128 = v23;
        __106__FCUserVector_computePersonalizationVectorWithAggregateStore_personalizationTreatment_tagRanker_options___block_invoke_40((uint64_t)v127);
        id v80 = (id)objc_claimAutoreleasedReturnValue();
        int v79 = 1;
        v81 = v128;
        id v11 = v106;
        id v12 = v103;
      }
    }
    else
    {
      v130[0] = MEMORY[0x1E4F143A8];
      v130[1] = 3221225472;
      v130[2] = __106__FCUserVector_computePersonalizationVectorWithAggregateStore_personalizationTreatment_tagRanker_options___block_invoke_39;
      v130[3] = &unk_1E5B54CC0;
      v130[4] = v110;
      __106__FCUserVector_computePersonalizationVectorWithAggregateStore_personalizationTreatment_tagRanker_options___block_invoke_39((uint64_t)v130);
      id v80 = (id)objc_claimAutoreleasedReturnValue();
      int v79 = 1;
      id v11 = v106;
      id v12 = v103;
    }
  }
  else
  {
    v131[0] = MEMORY[0x1E4F143A8];
    v131[1] = 3221225472;
    v131[2] = __106__FCUserVector_computePersonalizationVectorWithAggregateStore_personalizationTreatment_tagRanker_options___block_invoke;
    v131[3] = &unk_1E5B54CC0;
    id v23 = v23;
    id v132 = v23;
    __106__FCUserVector_computePersonalizationVectorWithAggregateStore_personalizationTreatment_tagRanker_options___block_invoke((uint64_t)v131);
    id v80 = (id)objc_claimAutoreleasedReturnValue();
    int v79 = 1;
    id v24 = v132;
  }

  char v6 = v108;
  id v10 = v109;
  self = v110;
  if (!v79)
  {
LABEL_40:
    if ((v6 & 2) != 0)
    {
      v83 = [(FCUserVector *)self bundleSubscribedVector];
      [v13 setBundleSubscribedVector:v83];

      v84 = [(FCUserVector *)self bundleChannelIDsVersion];
      [v13 setBundleSubscribedVectorVersion:v84];
    }
    id v85 = [(FCUserVector *)self subscribedSportsTagsWithPersonalizationTreatment:v11 tagRanker:v12];
    [v13 setSportsFavoritesVector:v85];

    id v80 = v13;
  }

  return v80;
}

uint64_t __106__FCUserVector_computePersonalizationVectorWithAggregateStore_personalizationTreatment_tagRanker_options___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v4;
    _os_log_error_impl(&dword_1A460D000, v2, OS_LOG_TYPE_ERROR, "Error in creating user vector model: %{public}@", (uint8_t *)&v5, 0xCu);
  }
  return 0;
}

uint64_t __106__FCUserVector_computePersonalizationVectorWithAggregateStore_personalizationTreatment_tagRanker_options___block_invoke_39(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(void **)(a1 + 32);
    int v5 = v2;
    uint64_t v6 = [v4 whitelistURL];
    int v7 = 138412290;
    v8 = v6;
    _os_log_error_impl(&dword_1A460D000, v5, OS_LOG_TYPE_ERROR, "Failed to get data from fileURL: %@", (uint8_t *)&v7, 0xCu);
  }
  return 0;
}

uint64_t __106__FCUserVector_computePersonalizationVectorWithAggregateStore_personalizationTreatment_tagRanker_options___block_invoke_40(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_error_impl(&dword_1A460D000, v2, OS_LOG_TYPE_ERROR, "Failed to serialize whitelist data: %@", (uint8_t *)&v5, 0xCu);
  }
  return 0;
}

id __106__FCUserVector_computePersonalizationVectorWithAggregateStore_personalizationTreatment_tagRanker_options___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) objectForKeyedSubscript:a2];
  int v5 = objc_msgSend(v3, "fc_safeObjectForKey:", v4);

  if (v5)
  {
    uint64_t v6 = NSNumber;
    [v5 personalizationValueWithBaseline:*(void *)(a1 + 48) decayRate:*(double *)(a1 + 56)];
    v8 = [v6 numberWithDouble:v7 - *(double *)(a1 + 64)];
  }
  else
  {
    v8 = &unk_1EF8D9A08;
  }

  return v8;
}

uint64_t __106__FCUserVector_computePersonalizationVectorWithAggregateStore_personalizationTreatment_tagRanker_options___block_invoke_48(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    uint64_t v4 = v2;
    int v5 = [v3 firstObject];
    uint64_t v6 = (int)[v5 intValue];
    uint64_t v7 = [*(id *)(a1 + 40) count];
    int v9 = 134218240;
    uint64_t v10 = v6;
    __int16 v11 = 2048;
    uint64_t v12 = v7;
    _os_log_impl(&dword_1A460D000, v4, OS_LOG_TYPE_DEFAULT, "Model metadata shape %lu does not match tag list count %lu, not submitting vector.", (uint8_t *)&v9, 0x16u);
  }
  return 0;
}

uint64_t __106__FCUserVector_computePersonalizationVectorWithAggregateStore_personalizationTreatment_tagRanker_options___block_invoke_49(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_error_impl(&dword_1A460D000, v2, OS_LOG_TYPE_ERROR, "Error when performing prediction using user vector model: %@", (uint8_t *)&v5, 0xCu);
  }
  return 0;
}

- (id)subscribedBundleChannelIDs
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = [(FCUserVector *)self bundleChannelIDs];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v10 = [(FCUserVector *)self subscriptionController];
        __int16 v11 = [v10 subscriptionForTagID:v9];

        if (v11) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  uint64_t v12 = (void *)[v3 copy];
  return v12;
}

- (id)bundleSubscribedVector
{
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  uint64_t v4 = [(FCUserVector *)self bundleChannelIDs];
  Mutable = CFBitVectorCreateMutable(v3, [v4 count]);

  uint64_t v6 = [(FCUserVector *)self bundleChannelIDs];
  CFBitVectorSetCount(Mutable, [v6 count]);

  uint64_t v7 = [(FCUserVector *)self subscribedBundleChannelIDs];
  v8 = [(FCUserVector *)self bundleChannelIDs];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    unint64_t v10 = 0;
    do
    {
      __int16 v11 = [(FCUserVector *)self bundleChannelIDs];
      uint64_t v12 = [v11 objectAtIndex:v10];

      if (v12) {
        CFBit v13 = [v7 containsObject:v12];
      }
      else {
        CFBit v13 = 0;
      }
      CFBitVectorSetBitAtIndex(Mutable, v10, v13);

      ++v10;
      long long v14 = [(FCUserVector *)self bundleChannelIDs];
      unint64_t v15 = [v14 count];
    }
    while (v15 > v10);
  }
  CFIndex Count = CFBitVectorGetCount(Mutable);
  uint64_t v17 = Count + 7;
  if (Count < -7) {
    uint64_t v17 = Count + 14;
  }
  id v18 = [MEMORY[0x1E4F1CA58] dataWithLength:v17 >> 3];
  CFIndex v19 = CFBitVectorGetCount(Mutable);
  id v20 = v18;
  uint64_t v21 = (UInt8 *)[v20 mutableBytes];
  v24.location = 0;
  v24.length = v19;
  CFBitVectorGetBits(Mutable, v24, v21);

  return v20;
}

- (id)subscribedSportsTagsWithPersonalizationTreatment:(id)a3 tagRanker:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(FCUserVector *)self sportsTagIDs];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    unint64_t v10 = [(FCUserVector *)self sportsTagIDs];
    __int16 v11 = [v10 array];

    if ([v6 personalizesSportsTagsInUserVector])
    {
      uint64_t v12 = [v7 rankTagIDsDescending:v11];

      __int16 v11 = (void *)v12;
    }
    CFBit v13 = objc_msgSend(v11, "fc_subarrayWithMaxCount:", 50);
    long long v14 = [v13 componentsJoinedByString:@","];
    unint64_t v15 = [v14 dataUsingEncoding:4];
  }
  else
  {
    unint64_t v15 = 0;
  }

  return v15;
}

- (id)findVector:(id)a3 closestToBins:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v5 count] >= 1)
  {
    uint64_t v8 = 0;
    do
    {
      uint64_t v9 = NSNumber;
      unint64_t v10 = [v5 objectAtIndexedSubscript:v8];
      [v10 doubleValue];
      __int16 v11 = objc_msgSend(v9, "numberWithDouble:");
      [v7 addObject:v11];

      ++v8;
    }
    while ([v5 count] > v8);
  }
  uint64_t v12 = FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v7;
    _os_log_debug_impl(&dword_1A460D000, v12, OS_LOG_TYPE_DEBUG, "Computed user vector with vector %@.", buf, 0xCu);
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __41__FCUserVector_findVector_closestToBins___block_invoke;
  v19[3] = &unk_1E5B4FD00;
  id v13 = v7;
  id v20 = v13;
  long long v14 = objc_msgSend(v6, "fc_arrayByTransformingWithBlock:", v19);
  unint64_t v15 = [v14 valueForKeyPath:@"@max.self"];
  long long v16 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v14, "indexOfObject:", v15));

  uint64_t v17 = FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v16;
    _os_log_debug_impl(&dword_1A460D000, v17, OS_LOG_TYPE_DEBUG, "Selected bin with vector %@.", buf, 0xCu);
  }

  return v16;
}

uint64_t __41__FCUserVector_findVector_closestToBins___block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  objc_msgSend(a2, "fc_cosineDistanceToArray:", *(void *)(a1 + 32));
  return objc_msgSend(v2, "numberWithDouble:");
}

- (NSURL)whitelistURL
{
  return self->_whitelistURL;
}

- (void)setWhitelistURL:(id)a3
{
}

- (NSURL)modelURL
{
  return self->_modelURL;
}

- (void)setModelURL:(id)a3
{
}

- (FCPersonalizationTreatment)personalizationTreatment
{
  return self->_personalizationTreatment;
}

- (void)setPersonalizationTreatment:(id)a3
{
}

- (NSOrderedSet)bundleChannelIDs
{
  return self->_bundleChannelIDs;
}

- (void)setBundleChannelIDs:(id)a3
{
}

- (NSOrderedSet)sportsTagIDs
{
  return self->_sportsTagIDs;
}

- (void)setSportsTagIDs:(id)a3
{
}

- (NSString)bundleChannelIDsVersion
{
  return self->_bundleChannelIDsVersion;
}

- (void)setBundleChannelIDsVersion:(id)a3
{
}

- (FCSubscriptionController)subscriptionController
{
  return self->_subscriptionController;
}

- (void)setSubscriptionController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionController, 0);
  objc_storeStrong((id *)&self->_bundleChannelIDsVersion, 0);
  objc_storeStrong((id *)&self->_sportsTagIDs, 0);
  objc_storeStrong((id *)&self->_bundleChannelIDs, 0);
  objc_storeStrong((id *)&self->_personalizationTreatment, 0);
  objc_storeStrong((id *)&self->_modelURL, 0);
  objc_storeStrong((id *)&self->_whitelistURL, 0);
}

@end