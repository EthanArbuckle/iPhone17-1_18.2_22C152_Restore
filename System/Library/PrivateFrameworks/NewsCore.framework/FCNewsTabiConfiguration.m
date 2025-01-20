@interface FCNewsTabiConfiguration
- (FCNewsTabiAdSegmentsEndpoint)adSegmentsEndpoint;
- (FCNewsTabiChannelPickerSuggestionsConfiguration)channelPickerSuggestionsConfiguration;
- (FCNewsTabiChannelPickerSuggestionsEndpoint)channelPickerSuggestionsEndpoint;
- (FCNewsTabiConfiguration)init;
- (FCNewsTabiConfiguration)initWithDictionary:(id)a3;
- (FCNewsTabiEventAggregationConfiguration)eventAggregationConfiguration;
- (FCNewsTabiFeedPersonalizationConfiguration)feedPersonalizationConfiguration;
- (FCNewsTabiFeedPersonalizationEndpoint)feedPersonalizationEndpoint;
- (FCNewsTabiMyMagazinesConfiguration)myMagazinesConfiguration;
- (FCNewsTabiMyMagazinesEndpoint)myMagazinesEndpoint;
- (FCNewsTabiNotificationScoringConfiguration)notificationScoringConfiguration;
- (FCNewsTabiNotificationScoringEndpoint)notificationScoringEndpoint;
- (FCNewsTabiPersonalizedPaywallsConfiguration)personalizedPaywallsConfiguration;
- (FCNewsTabiPersonalizedPaywallsEndpoint)personalizedPaywallsEndpoint;
- (FCNewsTabiRecommendedIssuesConfiguration)recommendedIssuesConfiguration;
- (FCNewsTabiRecommendedIssuesEndpoint)recommendedIssuesEndpoint;
- (FCNewsTabiRecommendedTagsConfiguration)recommendedTagsConfiguration;
- (FCNewsTabiRecommendedTagsEndpoint)recommendedTagsEndpoint;
- (FCNewsTabiTagCohortMembershipConfiguration)tagCohortMembershipConfiguration;
- (FCNewsTabiTagCohortMembershipEndpoint)tagCohortMembershipEndpoint;
- (FCNewsTabiTagScoringConfiguration)tagScoringConfiguration;
- (FCNewsTabiTagScoringEndpoint)tagScoringEndpoint;
- (FCNewsTabiTagSuggestionsConfiguration)tagSuggestionsConfiguration;
- (FCNewsTabiTagSuggestionsEndpoint)tagSuggestionsEndpoint;
- (FCNewsTabiUnloadGraphOnBackgroundConfiguration)unloadGraphOnBackgroundConfiguration;
- (NSArray)packageAssetIDs;
- (NSDictionary)dictionary;
- (NSString)version;
- (id)description;
- (int64_t)mlComputeUnits;
- (void)setAdSegmentsEndpoint:(id)a3;
- (void)setChannelPickerSuggestionsConfiguration:(id)a3;
- (void)setChannelPickerSuggestionsEndpoint:(id)a3;
- (void)setDictionary:(id)a3;
- (void)setEventAggregationConfiguration:(id)a3;
- (void)setFeedPersonalizationConfiguration:(id)a3;
- (void)setFeedPersonalizationEndpoint:(id)a3;
- (void)setMlComputeUnits:(int64_t)a3;
- (void)setMyMagazinesEndpoint:(id)a3;
- (void)setNotificationScoringEndpoint:(id)a3;
- (void)setPackageAssetIDs:(id)a3;
- (void)setPersonalizedPaywallsConfiguration:(id)a3;
- (void)setPersonalizedPaywallsEndpoint:(id)a3;
- (void)setRecommendedIssuesConfiguration:(id)a3;
- (void)setRecommendedIssuesEndpoint:(id)a3;
- (void)setRecommendedTagsEndpoint:(id)a3;
- (void)setTagCohortMembershipEndpoint:(id)a3;
- (void)setTagScoringEndpoint:(id)a3;
- (void)setTagSuggestionsEndpoint:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation FCNewsTabiConfiguration

- (NSString)version
{
  return self->_version;
}

- (int64_t)mlComputeUnits
{
  return self->_mlComputeUnits;
}

void __42__FCNewsTabiConfiguration_packageAssetIDs__block_invoke_2(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 adSegmentsEndpoint];
  v6 = [v5 packageAssetID];
  objc_msgSend(v4, "fc_safelyAddObject:", v6);

  v7 = [*(id *)(a1 + 32) channelPickerSuggestionsEndpoint];
  v8 = [v7 packageAssetID];
  objc_msgSend(v4, "fc_safelyAddObject:", v8);

  v9 = [*(id *)(a1 + 32) feedPersonalizationEndpoint];
  v10 = [v9 packageAssetID];
  objc_msgSend(v4, "fc_safelyAddObject:", v10);

  v11 = [*(id *)(a1 + 32) myMagazinesEndpoint];
  v12 = [v11 packageAssetID];
  objc_msgSend(v4, "fc_safelyAddObject:", v12);

  v13 = [*(id *)(a1 + 32) notificationScoringEndpoint];
  v14 = [v13 packageAssetID];
  objc_msgSend(v4, "fc_safelyAddObject:", v14);

  v15 = [*(id *)(a1 + 32) personalizedPaywallsEndpoint];
  v16 = [v15 packageAssetID];
  objc_msgSend(v4, "fc_safelyAddObject:", v16);

  v17 = [*(id *)(a1 + 32) recommendedIssuesEndpoint];
  v18 = [v17 packageAssetID];
  objc_msgSend(v4, "fc_safelyAddObject:", v18);

  v19 = [*(id *)(a1 + 32) recommendedTagsEndpoint];
  v20 = [v19 packageAssetID];
  objc_msgSend(v4, "fc_safelyAddObject:", v20);

  v21 = [*(id *)(a1 + 32) tagCohortMembershipEndpoint];
  v22 = [v21 packageAssetID];
  objc_msgSend(v4, "fc_safelyAddObject:", v22);

  v23 = [*(id *)(a1 + 32) tagScoringEndpoint];
  v24 = [v23 packageAssetID];
  objc_msgSend(v4, "fc_safelyAddObject:", v24);

  id v26 = [*(id *)(a1 + 32) tagSuggestionsEndpoint];
  v25 = [v26 packageAssetID];
  objc_msgSend(v4, "fc_safelyAddObject:", v25);
}

void __46__FCNewsTabiConfiguration_initWithDictionary___block_invoke_3(uint64_t a1, void *a2)
{
  v3 = *(void **)(*(void *)(a1 + 32) + 16);
  id v4 = a2;
  v5 = [v3 eventAggregationOutputs];
  objc_msgSend(v4, "fc_safelyAddObject:", v5);

  v6 = [*(id *)(*(void *)(a1 + 32) + 96) eventAggregationOutputs];
  objc_msgSend(v4, "fc_safelyAddObject:", v6);

  v7 = [*(id *)(*(void *)(a1 + 32) + 104) eventAggregationOutputs];
  objc_msgSend(v4, "fc_safelyAddObject:", v7);

  v8 = [*(id *)(*(void *)(a1 + 32) + 112) eventAggregationOutputs];
  objc_msgSend(v4, "fc_safelyAddObject:", v8);

  v9 = [*(id *)(*(void *)(a1 + 32) + 120) eventAggregationOutputs];
  objc_msgSend(v4, "fc_safelyAddObject:", v9);

  v10 = [*(id *)(*(void *)(a1 + 32) + 128) eventAggregationOutputs];
  objc_msgSend(v4, "fc_safelyAddObject:", v10);

  v11 = [*(id *)(*(void *)(a1 + 32) + 136) eventAggregationOutputs];
  objc_msgSend(v4, "fc_safelyAddObject:", v11);

  v12 = [*(id *)(*(void *)(a1 + 32) + 144) eventAggregationOutputs];
  objc_msgSend(v4, "fc_safelyAddObject:", v12);

  v13 = [*(id *)(*(void *)(a1 + 32) + 152) eventAggregationOutputs];
  objc_msgSend(v4, "fc_safelyAddObject:", v13);

  v14 = [*(id *)(*(void *)(a1 + 32) + 160) eventAggregationOutputs];
  objc_msgSend(v4, "fc_safelyAddObject:", v14);

  id v15 = [*(id *)(*(void *)(a1 + 32) + 168) eventAggregationOutputs];
  objc_msgSend(v4, "fc_safelyAddObject:", v15);
}

- (FCNewsTabiTagSuggestionsEndpoint)tagSuggestionsEndpoint
{
  return self->_tagSuggestionsEndpoint;
}

- (FCNewsTabiTagScoringEndpoint)tagScoringEndpoint
{
  return self->_tagScoringEndpoint;
}

- (FCNewsTabiTagCohortMembershipEndpoint)tagCohortMembershipEndpoint
{
  return self->_tagCohortMembershipEndpoint;
}

- (FCNewsTabiRecommendedTagsEndpoint)recommendedTagsEndpoint
{
  return self->_recommendedTagsEndpoint;
}

- (FCNewsTabiRecommendedIssuesEndpoint)recommendedIssuesEndpoint
{
  return self->_recommendedIssuesEndpoint;
}

- (FCNewsTabiPersonalizedPaywallsEndpoint)personalizedPaywallsEndpoint
{
  return self->_personalizedPaywallsEndpoint;
}

- (FCNewsTabiNotificationScoringEndpoint)notificationScoringEndpoint
{
  return self->_notificationScoringEndpoint;
}

- (FCNewsTabiMyMagazinesEndpoint)myMagazinesEndpoint
{
  return self->_myMagazinesEndpoint;
}

- (FCNewsTabiFeedPersonalizationEndpoint)feedPersonalizationEndpoint
{
  return self->_feedPersonalizationEndpoint;
}

- (FCNewsTabiChannelPickerSuggestionsEndpoint)channelPickerSuggestionsEndpoint
{
  return self->_channelPickerSuggestionsEndpoint;
}

- (FCNewsTabiAdSegmentsEndpoint)adSegmentsEndpoint
{
  return self->_adSegmentsEndpoint;
}

- (NSArray)packageAssetIDs
{
  packageAssetIDs = self->_packageAssetIDs;
  if (packageAssetIDs)
  {
    v3 = packageAssetIDs;
  }
  else
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __42__FCNewsTabiConfiguration_packageAssetIDs__block_invoke;
    v5[3] = &unk_1E5B505B0;
    v5[4] = self;
    __42__FCNewsTabiConfiguration_packageAssetIDs__block_invoke((uint64_t)v5);
    v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

id __42__FCNewsTabiConfiguration_packageAssetIDs__block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__FCNewsTabiConfiguration_packageAssetIDs__block_invoke_2;
  v4[3] = &unk_1E5B4C2F0;
  v4[4] = *(void *)(a1 + 32);
  v1 = objc_msgSend(MEMORY[0x1E4F1CAD0], "fc_set:", v4);
  v2 = [v1 allObjects];

  return v2;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@; %p", objc_opt_class(), self];
  if (self->_packageAssetIDs)
  {
    id v4 = [(FCNewsTabiConfiguration *)self channelPickerSuggestionsConfiguration];
    v5 = [v4 indentedDescription];
    [v3 appendFormat:@"\n\tchannelPickerSuggestionsConfiguration: %@;", v5];

    v6 = [(FCNewsTabiConfiguration *)self eventAggregationConfiguration];
    v7 = [v6 indentedDescription];
    [v3 appendFormat:@"\n\teventAggregationConfiguration: %@;", v7];

    v8 = [(FCNewsTabiConfiguration *)self feedPersonalizationConfiguration];
    v9 = [v8 indentedDescription];
    [v3 appendFormat:@"\n\tfeedPersonalizationConfiguration: %@;", v9];

    v10 = objc_msgSend(NSNumber, "numberWithInteger:", -[FCNewsTabiConfiguration mlComputeUnits](self, "mlComputeUnits"));
    [v3 appendFormat:@"\n\tmlComputeUnits: %@;", v10];

    v11 = [(FCNewsTabiConfiguration *)self myMagazinesConfiguration];
    v12 = [v11 indentedDescription];
    [v3 appendFormat:@"\n\tmyMagazinesConfiguration: %@;", v12];

    v13 = [(FCNewsTabiConfiguration *)self notificationScoringConfiguration];
    v14 = [v13 indentedDescription];
    [v3 appendFormat:@"\n\tnotificationScoringConfiguration: %@;", v14];

    id v15 = [(FCNewsTabiConfiguration *)self packageAssetIDs];
    v16 = [v15 indentedDescription];
    [v3 appendFormat:@"\n\tpackageAssetIDs: %@;", v16];

    v17 = [(FCNewsTabiConfiguration *)self personalizedPaywallsConfiguration];
    v18 = [v17 indentedDescription];
    [v3 appendFormat:@"\n\tpersonalizedPaywallsConfiguration: %@;", v18];

    v19 = [(FCNewsTabiConfiguration *)self recommendedTagsConfiguration];
    v20 = [v19 indentedDescription];
    [v3 appendFormat:@"\n\trecommendedTagsConfiguration: %@;", v20];

    v21 = [(FCNewsTabiConfiguration *)self recommendedIssuesConfiguration];
    v22 = [v21 indentedDescription];
    [v3 appendFormat:@"\n\trecommendedIssuesConfiguration: %@;", v22];

    v23 = [(FCNewsTabiConfiguration *)self tagCohortMembershipConfiguration];
    v24 = [v23 indentedDescription];
    [v3 appendFormat:@"\n\ttagCohortMembershipConfiguration: %@;", v24];

    v25 = [(FCNewsTabiConfiguration *)self tagScoringConfiguration];
    id v26 = [v25 indentedDescription];
    [v3 appendFormat:@"\n\ttagScoringConfiguration: %@;", v26];

    v27 = [(FCNewsTabiConfiguration *)self tagSuggestionsConfiguration];
    v28 = [v27 indentedDescription];
    [v3 appendFormat:@"\n\ttagSuggestionsConfiguration: %@;", v28];
  }
  else
  {
    v29 = [(FCNewsTabiConfiguration *)self adSegmentsEndpoint];
    v30 = [v29 indentedDescription];
    [v3 appendFormat:@"\n\tadSegmentsEndpoint: %@;", v30];

    v31 = [(FCNewsTabiConfiguration *)self channelPickerSuggestionsEndpoint];
    v32 = [v31 indentedDescription];
    [v3 appendFormat:@"\n\tchannelPickerSuggestionsEndpoint: %@;", v32];

    v33 = [(FCNewsTabiConfiguration *)self eventAggregationConfiguration];
    v34 = [v33 indentedDescription];
    [v3 appendFormat:@"\n\teventAggregationConfiguration: %@;", v34];

    v35 = [(FCNewsTabiConfiguration *)self feedPersonalizationEndpoint];
    v36 = [v35 indentedDescription];
    [v3 appendFormat:@"\n\tfeedPersonalizationEndpoint: %@;", v36];

    v37 = objc_msgSend(NSNumber, "numberWithInteger:", -[FCNewsTabiConfiguration mlComputeUnits](self, "mlComputeUnits"));
    [v3 appendFormat:@"\n\tmlComputeUnits: %@;", v37];

    v38 = [(FCNewsTabiConfiguration *)self myMagazinesEndpoint];
    v39 = [v38 indentedDescription];
    [v3 appendFormat:@"\n\tmyMagazinesEndpoint: %@;", v39];

    v40 = [(FCNewsTabiConfiguration *)self notificationScoringEndpoint];
    v41 = [v40 indentedDescription];
    [v3 appendFormat:@"\n\tnotificationScoringEndpoint: %@;", v41];

    v42 = [(FCNewsTabiConfiguration *)self packageAssetIDs];
    v43 = [v42 indentedDescription];
    [v3 appendFormat:@"\n\tpackageAssetIDs: %@;", v43];

    v44 = [(FCNewsTabiConfiguration *)self personalizedPaywallsEndpoint];
    v45 = [v44 indentedDescription];
    [v3 appendFormat:@"\n\tpersonalizedPaywallsEndpoint: %@;", v45];

    v46 = [(FCNewsTabiConfiguration *)self recommendedIssuesEndpoint];
    v47 = [v46 indentedDescription];
    [v3 appendFormat:@"\n\trecommendedIssuesEndpoint: %@;", v47];

    v48 = [(FCNewsTabiConfiguration *)self recommendedTagsEndpoint];
    v49 = [v48 indentedDescription];
    [v3 appendFormat:@"\n\trecommendedTagsEndpoint: %@;", v49];

    v50 = [(FCNewsTabiConfiguration *)self tagCohortMembershipEndpoint];
    v51 = [v50 indentedDescription];
    [v3 appendFormat:@"\n\ttagCohortMembershipEndpoint: %@;", v51];

    v52 = [(FCNewsTabiConfiguration *)self tagScoringEndpoint];
    v53 = [v52 indentedDescription];
    [v3 appendFormat:@"\n\ttagScoringEndpoint: %@;", v53];

    v27 = [(FCNewsTabiConfiguration *)self tagSuggestionsEndpoint];
    v28 = [v27 indentedDescription];
    [v3 appendFormat:@"\n\ttagSuggestionsEndpoint: %@;", v28];
  }

  v54 = [(FCNewsTabiConfiguration *)self unloadGraphOnBackgroundConfiguration];
  v55 = [v54 indentedDescription];
  [v3 appendFormat:@"\n\tunloadGraphOnBackgroundConfiguration: %@;", v55];

  [v3 appendString:@"\n>"];
  return v3;
}

- (FCNewsTabiUnloadGraphOnBackgroundConfiguration)unloadGraphOnBackgroundConfiguration
{
  return self->_unloadGraphOnBackgroundConfiguration;
}

- (FCNewsTabiConfiguration)initWithDictionary:(id)a3
{
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
    v78.receiver = self;
    v78.super_class = (Class)FCNewsTabiConfiguration;
    v8 = [(FCNewsTabiConfiguration *)&v78 init];
    v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_dictionary, a3);
      uint64_t v73 = MEMORY[0x1E4F143A8];
      uint64_t v74 = 3221225472;
      v75 = __46__FCNewsTabiConfiguration_initWithDictionary___block_invoke_2;
      v76 = &unk_1E5B53FE0;
      id v10 = v7;
      id v77 = v10;
      uint64_t v11 = FCAppConfigurationIntegerValue(v10, @"mlComputeUnits", 0);
      if ((unint64_t)(v11 - 1) >= 3) {
        uint64_t v12 = 0;
      }
      else {
        uint64_t v12 = v11;
      }
      v9->_mlComputeUnits = v12;
      uint64_t v13 = FCAppConfigurationStringValue(v10, @"version", @"UNSPECIFIED");
      version = v9->_version;
      v9->_version = (NSString *)v13;

      uint64_t v15 = FCAppConfigurationArrayValueWithDefaultValue(v10, @"packageAssetIDs", 0);
      packageAssetIDs = v9->_packageAssetIDs;
      v9->_packageAssetIDs = (NSArray *)v15;

      v69 = FCAppConfigurationDictionaryValueWithDefaultValue(v10, @"adSegmentsConfiguration", 0);
      v17 = [[FCNewsTabiAdSegmentsEndpoint alloc] initWithDictionary:v69];
      adSegmentsEndpoint = v9->_adSegmentsEndpoint;
      v9->_adSegmentsEndpoint = v17;

      v68 = FCAppConfigurationDictionaryValueWithDefaultValue(v10, @"channelPickerSuggestionsConfiguration", 0);
      v19 = [[FCNewsTabiChannelPickerSuggestionsEndpoint alloc] initWithDictionary:v68];
      channelPickerSuggestionsEndpoint = v9->_channelPickerSuggestionsEndpoint;
      v9->_channelPickerSuggestionsEndpoint = v19;

      v21 = [[FCNewsTabiChannelPickerSuggestionsConfiguration alloc] initWithDictionary:v68];
      channelPickerSuggestionsConfiguration = v9->_channelPickerSuggestionsConfiguration;
      v9->_channelPickerSuggestionsConfiguration = v21;

      v67 = FCAppConfigurationDictionaryValueWithDefaultValue(v10, @"feedPersonalizationConfiguration", 0);
      v23 = [[FCNewsTabiFeedPersonalizationEndpoint alloc] initWithDictionary:v67];
      feedPersonalizationEndpoint = v9->_feedPersonalizationEndpoint;
      v9->_feedPersonalizationEndpoint = v23;

      v25 = [[FCNewsTabiFeedPersonalizationConfiguration alloc] initWithDictionary:v67];
      feedPersonalizationConfiguration = v9->_feedPersonalizationConfiguration;
      v9->_feedPersonalizationConfiguration = v25;

      v66 = FCAppConfigurationDictionaryValueWithDefaultValue(v10, @"myMagazinesConfiguration", 0);
      v27 = [[FCNewsTabiMyMagazinesEndpoint alloc] initWithDictionary:v66];
      myMagazinesEndpoint = v9->_myMagazinesEndpoint;
      v9->_myMagazinesEndpoint = v27;

      v65 = FCAppConfigurationDictionaryValueWithDefaultValue(v10, @"notificationScoringConfiguration", 0);
      v29 = [[FCNewsTabiNotificationScoringEndpoint alloc] initWithDictionary:v65];
      notificationScoringEndpoint = v9->_notificationScoringEndpoint;
      v9->_notificationScoringEndpoint = v29;

      v64 = FCAppConfigurationDictionaryValueWithDefaultValue(v10, @"personalizedPaywallsConfiguration", 0);
      v31 = [[FCNewsTabiPersonalizedPaywallsEndpoint alloc] initWithDictionary:v64];
      personalizedPaywallsEndpoint = v9->_personalizedPaywallsEndpoint;
      v9->_personalizedPaywallsEndpoint = v31;

      v33 = [[FCNewsTabiPersonalizedPaywallsConfiguration alloc] initWithDictionary:v64];
      personalizedPaywallsConfiguration = v9->_personalizedPaywallsConfiguration;
      v9->_personalizedPaywallsConfiguration = v33;

      v63 = FCAppConfigurationDictionaryValueWithDefaultValue(v10, @"recommendedIssuesConfiguration", 0);
      v35 = [[FCNewsTabiRecommendedIssuesEndpoint alloc] initWithDictionary:v63];
      recommendedIssuesEndpoint = v9->_recommendedIssuesEndpoint;
      v9->_recommendedIssuesEndpoint = v35;

      v37 = [[FCNewsTabiRecommendedIssuesConfiguration alloc] initWithDictionary:v63];
      recommendedIssuesConfiguration = v9->_recommendedIssuesConfiguration;
      v9->_recommendedIssuesConfiguration = v37;

      v62 = FCAppConfigurationDictionaryValueWithDefaultValue(v10, @"recommendedTagsConfiguration", 0);
      v39 = [[FCNewsTabiRecommendedTagsEndpoint alloc] initWithDictionary:v62];
      recommendedTagsEndpoint = v9->_recommendedTagsEndpoint;
      v9->_recommendedTagsEndpoint = v39;

      v41 = FCAppConfigurationDictionaryValueWithDefaultValue(v10, @"tagCohortMembershipConfiguration", 0);
      v42 = [[FCNewsTabiTagCohortMembershipEndpoint alloc] initWithDictionary:v41];
      tagCohortMembershipEndpoint = v9->_tagCohortMembershipEndpoint;
      v9->_tagCohortMembershipEndpoint = v42;

      FCAppConfigurationDictionaryValueWithDefaultValue(v10, @"tagScoringConfiguration", 0);
      v44 = id v70 = v7;
      v45 = [[FCNewsTabiTagScoringEndpoint alloc] initWithDictionary:v44];
      tagScoringEndpoint = v9->_tagScoringEndpoint;
      v9->_tagScoringEndpoint = v45;

      v47 = FCAppConfigurationDictionaryValueWithDefaultValue(v10, @"tagSuggestionsConfiguration", 0);
      v48 = [[FCNewsTabiTagSuggestionsEndpoint alloc] initWithDictionary:v47];
      tagSuggestionsEndpoint = v9->_tagSuggestionsEndpoint;
      v9->_tagSuggestionsEndpoint = v48;

      v50 = FCAppConfigurationDictionaryValueWithDefaultValue(v10, @"unloadGraphOnBackgroundConfiguration", 0);
      v51 = [[FCNewsTabiUnloadGraphOnBackgroundConfiguration alloc] initWithDictionary:v50];
      unloadGraphOnBackgroundConfiguration = v9->_unloadGraphOnBackgroundConfiguration;
      v9->_unloadGraphOnBackgroundConfiguration = v51;

      v53 = FCAppConfigurationDictionaryValueWithDefaultValue(v10, @"eventAggregationConfiguration", 0);
      v54 = [FCNewsTabiEventAggregationConfiguration alloc];
      v55 = (void *)MEMORY[0x1E4F1C978];
      v71[0] = MEMORY[0x1E4F143A8];
      v71[1] = 3221225472;
      v71[2] = __46__FCNewsTabiConfiguration_initWithDictionary___block_invoke_3;
      v71[3] = &unk_1E5B4BF30;
      v56 = v9;
      v72 = v56;
      v57 = objc_msgSend(v55, "fc_array:", v71);
      uint64_t v58 = [(FCNewsTabiEventAggregationConfiguration *)v54 initWithDictionary:v53 outputs:v57];
      eventAggregationConfiguration = v56->_eventAggregationConfiguration;
      v56->_eventAggregationConfiguration = (FCNewsTabiEventAggregationConfiguration *)v58;

      id v7 = v70;
    }
    self = v9;

    v60 = self;
  }
  else
  {
    v60 = 0;
  }

  return v60;
}

- (FCNewsTabiEventAggregationConfiguration)eventAggregationConfiguration
{
  return self->_eventAggregationConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagSuggestionsEndpoint, 0);
  objc_storeStrong((id *)&self->_tagScoringEndpoint, 0);
  objc_storeStrong((id *)&self->_tagCohortMembershipEndpoint, 0);
  objc_storeStrong((id *)&self->_recommendedTagsEndpoint, 0);
  objc_storeStrong((id *)&self->_recommendedIssuesEndpoint, 0);
  objc_storeStrong((id *)&self->_personalizedPaywallsEndpoint, 0);
  objc_storeStrong((id *)&self->_notificationScoringEndpoint, 0);
  objc_storeStrong((id *)&self->_myMagazinesEndpoint, 0);
  objc_storeStrong((id *)&self->_feedPersonalizationEndpoint, 0);
  objc_storeStrong((id *)&self->_channelPickerSuggestionsEndpoint, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_unloadGraphOnBackgroundConfiguration, 0);
  objc_storeStrong((id *)&self->_recommendedIssuesConfiguration, 0);
  objc_storeStrong((id *)&self->_personalizedPaywallsConfiguration, 0);
  objc_storeStrong((id *)&self->_packageAssetIDs, 0);
  objc_storeStrong((id *)&self->_feedPersonalizationConfiguration, 0);
  objc_storeStrong((id *)&self->_eventAggregationConfiguration, 0);
  objc_storeStrong((id *)&self->_channelPickerSuggestionsConfiguration, 0);
  objc_storeStrong((id *)&self->_adSegmentsEndpoint, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

- (FCNewsTabiConfiguration)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCNewsTabiConfiguration init]";
    __int16 v9 = 2080;
    id v10 = "FCNewsTabiConfiguration.m";
    __int16 v11 = 1024;
    int v12 = 74;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCNewsTabiConfiguration init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

uint64_t __46__FCNewsTabiConfiguration_initWithDictionary___block_invoke_2(uint64_t a1)
{
  uint64_t result = FCAppConfigurationIntegerValue(*(void **)(a1 + 32), @"mlComputeUnits", 0);
  if ((unint64_t)(result - 1) >= 3) {
    return 0;
  }
  return result;
}

- (FCNewsTabiChannelPickerSuggestionsConfiguration)channelPickerSuggestionsConfiguration
{
  v3 = [(FCNewsTabiConfiguration *)self channelPickerSuggestionsEndpoint];
  channelPickerSuggestionsConfiguration = [v3 configuration];
  id v5 = channelPickerSuggestionsConfiguration;
  if (!channelPickerSuggestionsConfiguration) {
    channelPickerSuggestionsConfiguration = self->_channelPickerSuggestionsConfiguration;
  }
  id v6 = channelPickerSuggestionsConfiguration;

  return v6;
}

- (FCNewsTabiFeedPersonalizationConfiguration)feedPersonalizationConfiguration
{
  v3 = [(FCNewsTabiConfiguration *)self feedPersonalizationEndpoint];
  feedPersonalizationConfiguration = [v3 configuration];
  id v5 = feedPersonalizationConfiguration;
  if (!feedPersonalizationConfiguration) {
    feedPersonalizationConfiguration = self->_feedPersonalizationConfiguration;
  }
  id v6 = feedPersonalizationConfiguration;

  return v6;
}

- (FCNewsTabiMyMagazinesConfiguration)myMagazinesConfiguration
{
  v2 = [(FCNewsTabiConfiguration *)self myMagazinesEndpoint];
  v3 = [v2 configuration];

  return (FCNewsTabiMyMagazinesConfiguration *)v3;
}

- (FCNewsTabiNotificationScoringConfiguration)notificationScoringConfiguration
{
  v2 = [(FCNewsTabiConfiguration *)self notificationScoringEndpoint];
  v3 = [v2 configuration];

  return (FCNewsTabiNotificationScoringConfiguration *)v3;
}

- (FCNewsTabiPersonalizedPaywallsConfiguration)personalizedPaywallsConfiguration
{
  v3 = [(FCNewsTabiConfiguration *)self personalizedPaywallsEndpoint];
  personalizedPaywallsConfiguration = [v3 configuration];
  id v5 = personalizedPaywallsConfiguration;
  if (!personalizedPaywallsConfiguration) {
    personalizedPaywallsConfiguration = self->_personalizedPaywallsConfiguration;
  }
  id v6 = personalizedPaywallsConfiguration;

  return v6;
}

- (FCNewsTabiRecommendedIssuesConfiguration)recommendedIssuesConfiguration
{
  v3 = [(FCNewsTabiConfiguration *)self recommendedIssuesEndpoint];
  recommendedIssuesConfiguration = [v3 configuration];
  id v5 = recommendedIssuesConfiguration;
  if (!recommendedIssuesConfiguration) {
    recommendedIssuesConfiguration = self->_recommendedIssuesConfiguration;
  }
  id v6 = recommendedIssuesConfiguration;

  return v6;
}

- (FCNewsTabiRecommendedTagsConfiguration)recommendedTagsConfiguration
{
  v2 = [(FCNewsTabiConfiguration *)self recommendedTagsEndpoint];
  v3 = [v2 configuration];

  return (FCNewsTabiRecommendedTagsConfiguration *)v3;
}

- (FCNewsTabiTagCohortMembershipConfiguration)tagCohortMembershipConfiguration
{
  v2 = [(FCNewsTabiConfiguration *)self tagCohortMembershipEndpoint];
  v3 = [v2 configuration];

  return (FCNewsTabiTagCohortMembershipConfiguration *)v3;
}

- (FCNewsTabiTagScoringConfiguration)tagScoringConfiguration
{
  v2 = [(FCNewsTabiConfiguration *)self tagScoringEndpoint];
  v3 = [v2 configuration];

  return (FCNewsTabiTagScoringConfiguration *)v3;
}

- (FCNewsTabiTagSuggestionsConfiguration)tagSuggestionsConfiguration
{
  v2 = [(FCNewsTabiConfiguration *)self tagSuggestionsEndpoint];
  v3 = [v2 configuration];

  return (FCNewsTabiTagSuggestionsConfiguration *)v3;
}

- (void)setVersion:(id)a3
{
}

- (void)setAdSegmentsEndpoint:(id)a3
{
}

- (void)setChannelPickerSuggestionsConfiguration:(id)a3
{
}

- (void)setEventAggregationConfiguration:(id)a3
{
}

- (void)setFeedPersonalizationConfiguration:(id)a3
{
}

- (void)setMlComputeUnits:(int64_t)a3
{
  self->_mlComputeUnits = a3;
}

- (void)setPackageAssetIDs:(id)a3
{
}

- (void)setPersonalizedPaywallsConfiguration:(id)a3
{
}

- (void)setRecommendedIssuesConfiguration:(id)a3
{
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (void)setDictionary:(id)a3
{
}

- (void)setChannelPickerSuggestionsEndpoint:(id)a3
{
}

- (void)setFeedPersonalizationEndpoint:(id)a3
{
}

- (void)setMyMagazinesEndpoint:(id)a3
{
}

- (void)setNotificationScoringEndpoint:(id)a3
{
}

- (void)setPersonalizedPaywallsEndpoint:(id)a3
{
}

- (void)setRecommendedIssuesEndpoint:(id)a3
{
}

- (void)setRecommendedTagsEndpoint:(id)a3
{
}

- (void)setTagCohortMembershipEndpoint:(id)a3
{
}

- (void)setTagScoringEndpoint:(id)a3
{
}

- (void)setTagSuggestionsEndpoint:(id)a3
{
}

@end