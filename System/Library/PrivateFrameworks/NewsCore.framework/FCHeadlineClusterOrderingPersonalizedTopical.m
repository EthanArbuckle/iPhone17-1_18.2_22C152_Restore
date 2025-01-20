@interface FCHeadlineClusterOrderingPersonalizedTopical
- (id)orderTopicsWithClusteredHeadlines:(id)a3 additionalHeadlines:(id)a4 subscribedTagIDs:(id)a5 scoresByArticleID:(id)a6 personalizer:(id)a7 tagNameProvider:(id)a8 personalizationTreatment:(id)a9 translationProvider:(id)a10;
@end

@implementation FCHeadlineClusterOrderingPersonalizedTopical

- (id)orderTopicsWithClusteredHeadlines:(id)a3 additionalHeadlines:(id)a4 subscribedTagIDs:(id)a5 scoresByArticleID:(id)a6 personalizer:(id)a7 tagNameProvider:(id)a8 personalizationTreatment:(id)a9 translationProvider:(id)a10
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a9;
  id v21 = a10;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __211__FCHeadlineClusterOrderingPersonalizedTopical_orderTopicsWithClusteredHeadlines_additionalHeadlines_subscribedTagIDs_scoresByArticleID_personalizer_tagNameProvider_personalizationTreatment_translationProvider___block_invoke;
  aBlock[3] = &unk_1E5B4D710;
  id v46 = v21;
  id v59 = v46;
  id v22 = v15;
  id v60 = v22;
  id v23 = a8;
  v24 = _Block_copy(aBlock);
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __211__FCHeadlineClusterOrderingPersonalizedTopical_orderTopicsWithClusteredHeadlines_additionalHeadlines_subscribedTagIDs_scoresByArticleID_personalizer_tagNameProvider_personalizationTreatment_translationProvider___block_invoke_3;
  v54[3] = &unk_1E5B4D760;
  id v45 = v18;
  id v55 = v45;
  id v25 = v24;
  id v57 = v25;
  id v26 = v22;
  id v56 = v26;
  v27 = objc_msgSend(v26, "fc_dictionaryByTransformingValuesWithBlock:", v54);
  v28 = (void *)MEMORY[0x1E4F1C978];
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __211__FCHeadlineClusterOrderingPersonalizedTopical_orderTopicsWithClusteredHeadlines_additionalHeadlines_subscribedTagIDs_scoresByArticleID_personalizer_tagNameProvider_personalizationTreatment_translationProvider___block_invoke_280;
  v51[3] = &unk_1E5B4D7B0;
  id v44 = v16;
  id v52 = v44;
  id v29 = v25;
  id v53 = v29;
  v30 = objc_msgSend(v28, "fc_array:", v51);
  if ((objc_opt_respondsToSelector() & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v43 = (void *)[[NSString alloc] initWithFormat:@"WARNING: Bad access to personalization treatment from FCHeadlineClusterOrdering. Please file a radar with a sysdiagnose."];
    *(_DWORD *)buf = 136315906;
    v62 = "-[FCHeadlineClusterOrderingPersonalizedTopical orderTopicsWithClusteredHeadlines:additionalHeadlines:subscribe"
          "dTagIDs:scoresByArticleID:personalizer:tagNameProvider:personalizationTreatment:translationProvider:]";
    __int16 v63 = 2080;
    v64 = "FCHeadlineClusterOrdering.m";
    __int16 v65 = 1024;
    int v66 = 874;
    __int16 v67 = 2114;
    v68 = v43;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __211__FCHeadlineClusterOrderingPersonalizedTopical_orderTopicsWithClusteredHeadlines_additionalHeadlines_subscribedTagIDs_scoresByArticleID_personalizer_tagNameProvider_personalizationTreatment_translationProvider___block_invoke_287;
  v47[3] = &unk_1E5B4D800;
  id v48 = v19;
  id v49 = v17;
  id v50 = v20;
  id v31 = v20;
  id v32 = v17;
  id v33 = v19;
  [v31 metaGroupingRelatednessThreshold];
  double v35 = v34;
  [v31 metaGroupingRelatednessKWeight];
  double v37 = v36;
  [v31 metaGroupingTopicScoreWeight];
  double v39 = v38;
  [v31 metaGroupingHighestScoringRelativeScoreMultiplier];
  v41 = FCTopicallyOrderGroups(v27, v30, v47, v23, v35, v37, v39, v40);

  return v41;
}

id __211__FCHeadlineClusterOrderingPersonalizedTopical_orderTopicsWithClusteredHeadlines_additionalHeadlines_subscribedTagIDs_scoresByArticleID_personalizer_tagNameProvider_personalizationTreatment_translationProvider___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  v4 = [a2 topicIDs];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __211__FCHeadlineClusterOrderingPersonalizedTopical_orderTopicsWithClusteredHeadlines_additionalHeadlines_subscribedTagIDs_scoresByArticleID_personalizer_tagNameProvider_personalizationTreatment_translationProvider___block_invoke_2;
  v11 = &unk_1E5B4D6E8;
  id v12 = *(id *)(a1 + 32);
  id v13 = *(id *)(a1 + 40);
  v5 = objc_msgSend(v4, "fc_arrayByTransformingWithBlock:", &v8);
  v6 = objc_msgSend(v3, "setWithArray:", v5, v8, v9, v10, v11);

  return v6;
}

id __211__FCHeadlineClusterOrderingPersonalizedTopical_orderTopicsWithClusteredHeadlines_additionalHeadlines_subscribedTagIDs_scoresByArticleID_personalizer_tagNameProvider_personalizationTreatment_translationProvider___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 topicTranslationForTagID:v4];
  uint64_t v6 = [v5 tagID];
  v7 = (void *)v6;
  if (v6) {
    uint64_t v8 = (void *)v6;
  }
  else {
    uint64_t v8 = v4;
  }
  id v9 = v8;

  v10 = [*(id *)(a1 + 40) objectForKeyedSubscript:v9];
  if (v10) {
    v11 = v9;
  }
  else {
    v11 = 0;
  }
  id v12 = v11;

  return v12;
}

id __211__FCHeadlineClusterOrderingPersonalizedTopical_orderTopicsWithClusteredHeadlines_additionalHeadlines_subscribedTagIDs_scoresByArticleID_personalizer_tagNameProvider_personalizationTreatment_translationProvider___block_invoke_3(id *a1, void *a2)
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __211__FCHeadlineClusterOrderingPersonalizedTopical_orderTopicsWithClusteredHeadlines_additionalHeadlines_subscribedTagIDs_scoresByArticleID_personalizer_tagNameProvider_personalizationTreatment_translationProvider___block_invoke_4;
  v8[3] = &unk_1E5B4D738;
  id v9 = a1[4];
  id v11 = a1[6];
  id v10 = a1[5];
  v5 = objc_msgSend(a2, "fc_arrayByTransformingWithBlock:", v8);
  uint64_t v6 = [v4 setWithArray:v5];

  return v6;
}

FCTopicalNodeElement *__211__FCHeadlineClusterOrderingPersonalizedTopical_orderTopicsWithClusteredHeadlines_additionalHeadlines_subscribedTagIDs_scoresByArticleID_personalizer_tagNameProvider_personalizationTreatment_translationProvider___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v5 = [v3 identifier];
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];

  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v16 = (void *)[[NSString alloc] initWithFormat:@"score should not be nil."];
    *(_DWORD *)id v21 = 136315906;
    *(void *)&v21[4] = "-[FCHeadlineClusterOrderingPersonalizedTopical orderTopicsWithClusteredHeadlines:additionalHead"
                         "lines:subscribedTagIDs:scoresByArticleID:personalizer:tagNameProvider:personalizationTreatment:"
                         "translationProvider:]_block_invoke_4";
    *(_WORD *)&v21[12] = 2080;
    *(void *)&v21[14] = "FCHeadlineClusterOrdering.m";
    __int16 v22 = 1024;
    int v23 = 851;
    __int16 v24 = 2114;
    id v25 = v16;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v21, 0x26u);
  }
  v7 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  if (![v7 count] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v17 = [NSString alloc];
    id v18 = [*(id *)(a1 + 40) allKeys];
    id v19 = [v3 topicIDs];
    id v20 = (void *)[v17 initWithFormat:@"Expected to find a grouped topic in the topic ids. Group topics are %@ and topicIDs are %@", v18, v19];
    *(_DWORD *)id v21 = 136315906;
    *(void *)&v21[4] = "-[FCHeadlineClusterOrderingPersonalizedTopical orderTopicsWithClusteredHeadlines:additionalHead"
                         "lines:subscribedTagIDs:scoresByArticleID:personalizer:tagNameProvider:personalizationTreatment:"
                         "translationProvider:]_block_invoke";
    *(_WORD *)&v21[12] = 2080;
    *(void *)&v21[14] = "FCHeadlineClusterOrdering.m";
    __int16 v22 = 1024;
    int v23 = 856;
    __int16 v24 = 2114;
    id v25 = v20;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v21, 0x26u);
  }
  uint64_t v8 = [FCTopicalNodeElement alloc];
  id v9 = [v3 identifier];
  [v6 doubleValue];
  double v11 = v10;
  id v12 = v9;
  id v13 = v7;
  if (v8)
  {
    *(void *)id v21 = v8;
    *(void *)&v21[8] = FCTopicalNodeElement;
    v14 = (FCTopicalNodeElement *)objc_msgSendSuper2((objc_super *)v21, sel_init);
    uint64_t v8 = v14;
    if (v14)
    {
      objc_storeStrong((id *)&v14->_identifier, v9);
      objc_storeStrong((id *)&v8->_topics, v7);
      v8->_score = v11;
    }
  }

  return v8;
}

void __211__FCHeadlineClusterOrderingPersonalizedTopical_orderTopicsWithClusteredHeadlines_additionalHeadlines_subscribedTagIDs_scoresByArticleID_personalizer_tagNameProvider_personalizationTreatment_translationProvider___block_invoke_280(uint64_t a1, void *a2)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __211__FCHeadlineClusterOrderingPersonalizedTopical_orderTopicsWithClusteredHeadlines_additionalHeadlines_subscribedTagIDs_scoresByArticleID_personalizer_tagNameProvider_personalizationTreatment_translationProvider___block_invoke_2_281;
  v6[3] = &unk_1E5B4D788;
  id v3 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v4 = a2;
  v5 = objc_msgSend(v3, "fc_arrayByTransformingWithBlock:", v6);
  [v4 addObjectsFromArray:v5];
}

id __211__FCHeadlineClusterOrderingPersonalizedTopical_orderTopicsWithClusteredHeadlines_additionalHeadlines_subscribedTagIDs_scoresByArticleID_personalizer_tagNameProvider_personalizationTreatment_translationProvider___block_invoke_2_281(uint64_t a1)
{
  v1 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  if ([v1 count]) {
    v2 = v1;
  }
  else {
    v2 = 0;
  }
  id v3 = v2;

  return v3;
}

double __211__FCHeadlineClusterOrderingPersonalizedTopical_orderTopicsWithClusteredHeadlines_additionalHeadlines_subscribedTagIDs_scoresByArticleID_personalizer_tagNameProvider_personalizationTreatment_translationProvider___block_invoke_287(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v5 = [v3 allObjects];
  uint64_t v6 = [v4 scoresForTagIDs:v5];

  if ([v6 count])
  {
    uint64_t v14 = 0;
    id v15 = (double *)&v14;
    uint64_t v16 = 0x2020000000;
    uint64_t v17 = 0;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __211__FCHeadlineClusterOrderingPersonalizedTopical_orderTopicsWithClusteredHeadlines_additionalHeadlines_subscribedTagIDs_scoresByArticleID_personalizer_tagNameProvider_personalizationTreatment_translationProvider___block_invoke_2_288;
    v10[3] = &unk_1E5B4D7D8;
    id v11 = *(id *)(a1 + 40);
    id v12 = *(id *)(a1 + 48);
    id v13 = &v14;
    [v6 enumerateKeysAndObjectsUsingBlock:v10];
    double v7 = v15[3];
    double v8 = v7 / (double)(unint64_t)[v6 count];

    _Block_object_dispose(&v14, 8);
  }
  else
  {
    double v8 = 0.0;
  }

  return v8;
}

void __211__FCHeadlineClusterOrderingPersonalizedTopical_orderTopicsWithClusteredHeadlines_additionalHeadlines_subscribedTagIDs_scoresByArticleID_personalizer_tagNameProvider_personalizationTreatment_translationProvider___block_invoke_2_288(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  double v5 = 1.0;
  if ([*(id *)(a1 + 32) containsObject:a2])
  {
    [*(id *)(a1 + 40) metaGroupingSubscribedTopicMultiplier];
    double v5 = v6;
  }
  [v8 doubleValue];
  *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                          + 24)
                                                              + v7 * v5;
}

@end