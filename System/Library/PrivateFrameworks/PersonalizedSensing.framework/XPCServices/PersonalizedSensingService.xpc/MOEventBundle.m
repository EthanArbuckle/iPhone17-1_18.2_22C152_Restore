@interface MOEventBundle
+ (BOOL)supportsSecureCoding;
+ (id)getInterfaceTypeString:(unint64_t)a3 superType:(unint64_t)a4;
+ (unint64_t)castEvergreenSubType:(unint64_t)a3;
+ (unint64_t)getSuperTypeEnum:(id)a3;
- (BOOL)containTheSameEventSet:(id)a3;
- (BOOL)filtered;
- (BOOL)hasAppEntryEngagementEvent:(id)a3;
- (BOOL)hasSuggestionEngagementEvent:(id)a3;
- (BOOL)includedInSummaryBundleOnly;
- (BOOL)intersectedActivityOrVisitForObject:(id)a3 other:(id)a4;
- (BOOL)intersectedSubBundleIDForObject:(id)a3 other:(id)a4;
- (BOOL)isAggregatedAndSuppressed;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualBaseActionForObject:(id)a3 other:(id)a4;
- (BOOL)isEqualBasicPropertiesForObject:(id)a3 other:(id)a4;
- (BOOL)isEqualPersonsForObject:(id)a3 other:(id)a4;
- (BOOL)isEqualPropertyForObject:(id)a3 other:(id)a4 propertyPath:(id)a5 threshold:(double)a6;
- (BOOL)isEqualResourcesForObject:(id)a3 other:(id)a4 resourceType:(unint64_t)a5;
- (BOOL)isEqualToEventBundle:(id)a3;
- (BOOL)shareEvents:(id)a3;
- (MOAction)action;
- (MOAction)concurrentMediaAction;
- (MOClusterMetadata)clusterMetadata;
- (MOEventBundle)initWithBundleIdentifier:(id)a3 bundleType:(id)a4 creationDate:(id)a5 endDate:(id)a6 expirationDate:(id)a7 events:(id)a8 filtered:(BOOL)a9 interfaceType:(unint64_t)a10 photoSource:(unint64_t)a11 promptLanguage:(id)a12 source:(unint64_t)a13 startDate:(id)a14 action:(id)a15 concurrentMediaAction:(id)a16 actions:(id)a17 persons:(id)a18 place:(id)a19 predominantWeather:(id)a20 resources:(id)a21 time:(id)a22 metaDataForRank:(id)a23 suggestionEngagements:(id)a24 suggestionEngagementViewCount:(unint64_t)a25 appEntryEngagements:(id)a26 isAggregatedAndSuppressed:(BOOL)a27 summarizationGranularity:(unint64_t)a28 places:(id)a29 subBundleIDs:(id)a30 subSuggestionIDs:(id)a31 includedInSummaryBundleOnly:(BOOL)a32 bundleSubType:(unint64_t)a33 bundleSuperType:(unint64_t)a34 photoTraits:(id)a35;
- (MOEventBundle)initWithBundleIdentifier:(id)a3 bundleType:(id)a4 creationDate:(id)a5 endDate:(id)a6 expirationDate:(id)a7 events:(id)a8 filtered:(BOOL)a9 interfaceType:(unint64_t)a10 photoSource:(unint64_t)a11 promptLanguage:(id)a12 source:(unint64_t)a13 startDate:(id)a14 action:(id)a15 concurrentMediaAction:(id)a16 actions:(id)a17 persons:(id)a18 place:(id)a19 predominantWeather:(id)a20 resources:(id)a21 time:(id)a22 metaDataForRank:(id)a23 suggestionEngagements:(id)a24 suggestionEngagementViewCount:(unint64_t)a25 appEntryEngagements:(id)a26 isAggregatedAndSuppressed:(BOOL)a27 summarizationGranularity:(unint64_t)a28 places:(id)a29 subBundleIDs:(id)a30 subSuggestionIDs:(id)a31 photoTraits:(id)a32;
- (MOEventBundle)initWithBundleIdentifier:(id)a3 creationDate:(id)a4;
- (MOEventBundle)initWithBundleIdentifier:(id)a3 suggestionID:(id)a4 bundleType:(id)a5 creationDate:(id)a6 firstCreationDate:(id)a7 endDate:(id)a8 expirationDate:(id)a9 events:(id)a10 filtered:(BOOL)a11 interfaceType:(unint64_t)a12 photoSource:(unint64_t)a13 promptLanguage:(id)a14 source:(unint64_t)a15 startDate:(id)a16 action:(id)a17 concurrentMediaAction:(id)a18 actions:(id)a19 persons:(id)a20 place:(id)a21 predominantWeather:(id)a22 resources:(id)a23 time:(id)a24 metaDataForRank:(id)a25 suggestionEngagements:(id)a26 suggestionEngagementViewCount:(unint64_t)a27 appEntryEngagements:(id)a28 isAggregatedAndSuppressed:(BOOL)a29 summarizationGranularity:(unint64_t)a30 places:(id)a31 subBundleIDs:(id)a32 subSuggestionIDs:(id)a33 includedInSummaryBundleOnly:(BOOL)a34 bundleSubType:(unint64_t)a35 bundleSuperType:(unint64_t)a36 photoTraits:(id)a37;
- (MOEventBundle)initWithBundleIdentifier:(id)a3 suggestionID:(id)a4 startDate:(id)a5 endDate:(id)a6 creationDate:(id)a7;
- (MOEventBundle)initWithBundleIdentifier:(id)a3 usingBundle:(id)a4;
- (MOEventBundle)initWithCoder:(id)a3;
- (MOEventBundle)initWithEventSet:(id)a3 filtered:(BOOL)a4;
- (MOOutlierMetadata)outlierMetadata;
- (MOPlace)place;
- (MOTime)time;
- (MOWeather)predominantWeather;
- (NSArray)actions;
- (NSArray)backgroundActions;
- (NSArray)events;
- (NSArray)labels;
- (NSArray)persons;
- (NSArray)photoTraits;
- (NSArray)places;
- (NSArray)promptLanguages;
- (NSArray)resources;
- (NSArray)subBundleIDs;
- (NSArray)subSuggestionIDs;
- (NSArray)visitEventsRejectedByWatchLocation;
- (NSDate)creationDate;
- (NSDate)endDate;
- (NSDate)expirationDate;
- (NSDate)firstCreationDate;
- (NSDate)startDate;
- (NSDictionary)metaDataForRank;
- (NSDictionary)rankingDictionary;
- (NSMutableDictionary)metaData;
- (NSMutableSet)appEntryEngagementEvents;
- (NSMutableSet)suggestionEngagementEvents;
- (NSSet)getCategories;
- (NSString)bundleType;
- (NSString)promptLanguage;
- (NSUUID)bundleIdentifier;
- (NSUUID)suggestionID;
- (double)duration;
- (id)_allResourcesImpl;
- (id)dateInterval;
- (id)description;
- (id)displayEndDate;
- (id)displayStartDate;
- (id)getBundleType;
- (id)getCustomLabelsForMetaData:(id)a3 labelFormatter:(id)a4;
- (id)getCustomLabelsForMetaData:(id)a3 templateFilePath:(id)a4;
- (id)getCustomPromptsForMetaData:(id)a3 labelFormatter:(id)a4;
- (id)getCustomPromptsForMetaData:(id)a3 templateFilePath:(id)a4;
- (id)getSubTypeString;
- (id)getSuperTypeString;
- (id)localEndDate;
- (id)localStartDate;
- (unint64_t)bundleManagementPolicy;
- (unint64_t)bundleSubType;
- (unint64_t)bundleSuperType;
- (unint64_t)getInterfaceTypeEnum:(id)a3;
- (unint64_t)hash;
- (unint64_t)interfaceType;
- (unint64_t)photoSource;
- (unint64_t)source;
- (unint64_t)suggestionEngagementViewCount;
- (unint64_t)summarizationGranularity;
- (unint64_t)timeAtHomeSubType;
- (void)addAction:(id)a3;
- (void)addBackgroundAction:(id)a3;
- (void)addEvent:(id)a3;
- (void)addEvents:(id)a3;
- (void)addMetaDataForRankForKey:(id)a3 value:(id)a4;
- (void)addPerson:(id)a3;
- (void)addPhotoTraits:(id)a3;
- (void)addResource:(id)a3;
- (void)addResources:(id)a3;
- (void)buildResources;
- (void)clearAppEntryEngagementEvent:(id)a3;
- (void)clearSuggestionEngagementEvent:(id)a3;
- (void)dateInterval;
- (void)encodeWithCoder:(id)a3;
- (void)setAction:(id)a3;
- (void)setActions:(id)a3;
- (void)setAppEntryEngagementEvent:(id)a3;
- (void)setAppEntryEngagementEvents:(id)a3;
- (void)setBackgroundActions:(id)a3;
- (void)setBundleSubType:(unint64_t)a3;
- (void)setBundleSuperType:(unint64_t)a3;
- (void)setBundleType:(id)a3;
- (void)setClusterMetadata:(id)a3;
- (void)setConcurrentMediaAction:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setEvents:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setFiltered:(BOOL)a3;
- (void)setFirstCreationDate:(id)a3;
- (void)setIncludedInSummaryBundleOnly:(BOOL)a3;
- (void)setInterfaceType:(unint64_t)a3;
- (void)setIsAggregatedAndSuppressed:(BOOL)a3;
- (void)setLabels:(id)a3;
- (void)setMetaData:(id)a3;
- (void)setMetaDataForRank:(id)a3;
- (void)setOutlierMetadata:(id)a3;
- (void)setPersons:(id)a3;
- (void)setPhotoSource:(unint64_t)a3;
- (void)setPhotoTraits:(id)a3;
- (void)setPlace:(id)a3;
- (void)setPlaces:(id)a3;
- (void)setPredominantWeather:(id)a3;
- (void)setPromptLanguage:(id)a3;
- (void)setPromptLanguages:(id)a3;
- (void)setPropertiesBasedOnEvents;
- (void)setRankingDictionary:(id)a3;
- (void)setResources:(id)a3;
- (void)setSource:(unint64_t)a3;
- (void)setStartDate:(id)a3;
- (void)setSubBundleIDs:(id)a3;
- (void)setSubSuggestionIDs:(id)a3;
- (void)setSuggestionEngagementEvent:(id)a3;
- (void)setSuggestionEngagementEvents:(id)a3;
- (void)setSuggestionEngagementViewCount:(unint64_t)a3;
- (void)setSuggestionID:(id)a3;
- (void)setSummarizationGranularity:(unint64_t)a3;
- (void)setTime:(id)a3;
- (void)setTimeAtHomeSubType:(unint64_t)a3;
- (void)setVisitEventsRejectedByWatchLocation:(id)a3;
- (void)withResourcesUsingBlock:(id)a3;
@end

@implementation MOEventBundle

- (MOEventBundle)initWithBundleIdentifier:(id)a3 suggestionID:(id)a4 startDate:(id)a5 endDate:(id)a6 creationDate:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (!v13)
  {
    v21 = v17;
    v22 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[MOEventBundle initWithBundleIdentifier:suggestionID:startDate:endDate:creationDate:]();
    }
    goto LABEL_17;
  }
  if (!v14)
  {
    v21 = v17;
    v22 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[MOEventBundle initWithBundleIdentifier:suggestionID:startDate:endDate:creationDate:]();
    }
    goto LABEL_17;
  }
  if (!v15)
  {
    v21 = v17;
    v22 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[MOEvent initWithEventIdentifier:startDate:endDate:creationDate:provider:category:]();
    }
    goto LABEL_17;
  }
  if (!v16)
  {
    v21 = v17;
    v22 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[MOEvent initWithEventIdentifier:startDate:endDate:creationDate:provider:category:]();
    }
LABEL_17:

    v20 = 0;
    goto LABEL_18;
  }
  id v25 = v17;
  if (v17)
  {
    v26.receiver = self;
    v26.super_class = (Class)MOEventBundle;
    v18 = [(MOEventBundle *)&v26 init];
    p_isa = (id *)&v18->super.isa;
    if (v18)
    {
      objc_storeStrong((id *)&v18->_bundleIdentifier, a3);
      objc_storeStrong(p_isa + 3, a4);
      objc_storeStrong(p_isa + 4, a5);
      objc_storeStrong(p_isa + 5, a6);
      objc_storeStrong(p_isa + 6, a7);
    }
    self = p_isa;
    v20 = self;
  }
  else
  {
    v24 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[MOEvent initWithEventIdentifier:startDate:endDate:creationDate:provider:category:].cold.4();
    }

    v20 = 0;
  }
  v21 = v25;
LABEL_18:

  return v20;
}

- (MOEventBundle)initWithBundleIdentifier:(id)a3 suggestionID:(id)a4 bundleType:(id)a5 creationDate:(id)a6 firstCreationDate:(id)a7 endDate:(id)a8 expirationDate:(id)a9 events:(id)a10 filtered:(BOOL)a11 interfaceType:(unint64_t)a12 photoSource:(unint64_t)a13 promptLanguage:(id)a14 source:(unint64_t)a15 startDate:(id)a16 action:(id)a17 concurrentMediaAction:(id)a18 actions:(id)a19 persons:(id)a20 place:(id)a21 predominantWeather:(id)a22 resources:(id)a23 time:(id)a24 metaDataForRank:(id)a25 suggestionEngagements:(id)a26 suggestionEngagementViewCount:(unint64_t)a27 appEntryEngagements:(id)a28 isAggregatedAndSuppressed:(BOOL)a29 summarizationGranularity:(unint64_t)a30 places:(id)a31 subBundleIDs:(id)a32 subSuggestionIDs:(id)a33 includedInSummaryBundleOnly:(BOOL)a34 bundleSubType:(unint64_t)a35 bundleSuperType:(unint64_t)a36 photoTraits:(id)a37
{
  id v86 = a5;
  id obj = a7;
  id v85 = a7;
  id v84 = a9;
  id v89 = a10;
  id v83 = a14;
  id v82 = a17;
  id v81 = a18;
  id v38 = a19;
  id v39 = a20;
  id v80 = a21;
  id v79 = a22;
  id v40 = a23;
  id v78 = a24;
  id v41 = a25;
  id v42 = a26;
  id v43 = a28;
  id v44 = a31;
  id v45 = a32;
  id v88 = a33;
  id v87 = a37;
  v46 = [(MOEventBundle *)self initWithBundleIdentifier:a3 suggestionID:a4 startDate:a16 endDate:a8 creationDate:a6];
  v47 = v46;
  if (v46)
  {
    objc_storeStrong((id *)&v46->_firstCreationDate, obj);
    objc_storeStrong((id *)&v47->_bundleType, a5);
    objc_storeStrong((id *)&v47->_expirationDate, a9);
    v48 = (NSArray *)[v89 copy];
    events = v47->_events;
    v47->_events = v48;

    v47->_filtered = a11;
    v47->_interfaceType = a12;
    v47->_photoSource = a13;
    objc_storeStrong((id *)&v47->_promptLanguage, a14);
    v47->_source = a15;
    objc_storeStrong((id *)&v47->_action, a17);
    objc_storeStrong((id *)&v47->_concurrentMediaAction, a18);
    v50 = (NSArray *)[v38 copy];
    actions = v47->_actions;
    v47->_actions = v50;

    v52 = (NSArray *)[v39 copy];
    persons = v47->_persons;
    v47->_persons = v52;

    objc_storeStrong((id *)&v47->_place, a21);
    objc_storeStrong((id *)&v47->_predominantWeather, a22);
    v54 = (NSArray *)[v40 copy];
    resources = v47->_resources;
    v47->_resources = v54;

    objc_storeStrong((id *)&v47->_time, a24);
    v56 = (NSDictionary *)[v41 copy];
    metaDataForRank = v47->_metaDataForRank;
    v47->_metaDataForRank = v56;

    v58 = (NSMutableSet *)[v42 mutableCopy];
    suggestionEngagementEvents = v47->_suggestionEngagementEvents;
    v47->_suggestionEngagementEvents = v58;

    v47->_suggestionEngagementViewCount = a27;
    v60 = (NSMutableSet *)[v43 mutableCopy];
    appEntryEngagementEvents = v47->_appEntryEngagementEvents;
    v47->_appEntryEngagementEvents = v60;

    v47->_isAggregatedAndSuppressed = a29;
    v47->_summarizationGranularity = a30;
    v62 = (NSArray *)[v44 copy];
    places = v47->_places;
    v47->_places = v62;

    v64 = (NSArray *)[v45 copy];
    subBundleIDs = v47->_subBundleIDs;
    v47->_subBundleIDs = v64;

    v66 = (NSArray *)[v88 copy];
    subSuggestionIDs = v47->_subSuggestionIDs;
    v47->_subSuggestionIDs = v66;

    v47->_includedInSummaryBundleOnly = a34;
    v47->_bundleSubType = a35;
    v47->_bundleSuperType = a36;
    v68 = (NSArray *)[v87 copy];
    photoTraits = v47->_photoTraits;
    v47->_photoTraits = v68;
  }
  return v47;
}

- (MOEventBundle)initWithBundleIdentifier:(id)a3 usingBundle:(id)a4
{
  id v5 = a4;
  id v32 = a3;
  v46 = [v5 suggestionID];
  id v45 = [v5 bundleType];
  id v44 = [v5 creationDate];
  id v43 = [v5 firstCreationDate];
  id v41 = [v5 endDate];
  id v42 = [v5 expirationDate];
  id v40 = [v5 events];
  unsigned __int8 v31 = [v5 filtered];
  id v30 = [v5 interfaceType];
  id v29 = [v5 photoSource];
  id v39 = [v5 promptLanguage];
  id v28 = [v5 source];
  v37 = [v5 startDate];
  id v38 = [v5 action];
  v36 = [v5 concurrentMediaAction];
  v27 = [v5 actions];
  objc_super v26 = [v5 persons];
  id v25 = [v5 place];
  v24 = [v5 predominantWeather];
  v23 = [v5 resources];
  v35 = [v5 time];
  v20 = [v5 metaDataForRank];
  v22 = [v5 suggestionEngagementEvents];
  id v21 = [v5 suggestionEngagementViewCount];
  v18 = [v5 appEntryEngagementEvents];
  unsigned __int8 v19 = [v5 isAggregatedAndSuppressed];
  id v16 = [v5 summarizationGranularity];
  id v17 = [v5 places];
  v6 = [v5 subBundleIDs];
  v7 = [v5 subSuggestionIDs];
  unsigned __int8 v8 = [v5 includedInSummaryBundleOnly];
  id v9 = [v5 bundleSubType];
  id v10 = [v5 bundleSuperType];
  v11 = [v5 photoTraits];

  LOBYTE(v15) = v8;
  LOBYTE(v14) = v19;
  LOBYTE(v13) = v31;
  v34 = -[MOEventBundle initWithBundleIdentifier:suggestionID:bundleType:creationDate:firstCreationDate:endDate:expirationDate:events:filtered:interfaceType:photoSource:promptLanguage:source:startDate:action:concurrentMediaAction:actions:persons:place:predominantWeather:resources:time:metaDataForRank:suggestionEngagements:suggestionEngagementViewCount:appEntryEngagements:isAggregatedAndSuppressed:summarizationGranularity:places:subBundleIDs:subSuggestionIDs:includedInSummaryBundleOnly:bundleSubType:bundleSuperType:photoTraits:](self, "initWithBundleIdentifier:suggestionID:bundleType:creationDate:firstCreationDate:endDate:expirationDate:events:filtered:interfaceType:photoSource:promptLanguage:source:startDate:action:concurrentMediaAction:actions:persons:place:predominantWeather:resources:time:metaDataForRank:suggestionEngagements:suggestionEngagementViewCount:appEntryEngagements:isAggregatedAndSuppressed:summarizationGranularity:places:subBundleIDs:subSuggestionIDs:includedInSummaryBundleOnly:bundleSubType:bundleSuperType:photoTraits:", v32, v46, v45, v44, v43, v41, v42, v40, v13, v30, v29, v39, v28,
          v37,
          v38,
          v36,
          v27,
          v26,
          v25,
          v24,
          v23,
          v35,
          v20,
          v22,
          v21,
          v18,
          v14,
          v16,
          v17,
          v6,
          v7,
          v15,
          v9,
          v10,
          v11);

  return v34;
}

- (MOEventBundle)initWithBundleIdentifier:(id)a3 bundleType:(id)a4 creationDate:(id)a5 endDate:(id)a6 expirationDate:(id)a7 events:(id)a8 filtered:(BOOL)a9 interfaceType:(unint64_t)a10 photoSource:(unint64_t)a11 promptLanguage:(id)a12 source:(unint64_t)a13 startDate:(id)a14 action:(id)a15 concurrentMediaAction:(id)a16 actions:(id)a17 persons:(id)a18 place:(id)a19 predominantWeather:(id)a20 resources:(id)a21 time:(id)a22 metaDataForRank:(id)a23 suggestionEngagements:(id)a24 suggestionEngagementViewCount:(unint64_t)a25 appEntryEngagements:(id)a26 isAggregatedAndSuppressed:(BOOL)a27 summarizationGranularity:(unint64_t)a28 places:(id)a29 subBundleIDs:(id)a30 subSuggestionIDs:(id)a31 includedInSummaryBundleOnly:(BOOL)a32 bundleSubType:(unint64_t)a33 bundleSuperType:(unint64_t)a34 photoTraits:(id)a35
{
  id v54 = a35;
  id v50 = a31;
  id v35 = a30;
  id v47 = a29;
  id v36 = a26;
  id v37 = a23;
  id v46 = a22;
  id v45 = a21;
  id v44 = a20;
  id v43 = a19;
  id v70 = a18;
  id v69 = a17;
  id v68 = a16;
  id v67 = a15;
  id v64 = a14;
  id v63 = a12;
  id v66 = a8;
  id v62 = a7;
  id v42 = a6;
  id v49 = a5;
  id v60 = a4;
  id v58 = a3;
  v53 = +[NSMutableSet setWithSet:a24];
  v52 = +[NSMutableSet setWithSet:v36];

  LOBYTE(v41) = a32;
  LOBYTE(v40) = a27;
  LOBYTE(v39) = a9;
  v56 = -[MOEventBundle initWithBundleIdentifier:suggestionID:bundleType:creationDate:firstCreationDate:endDate:expirationDate:events:filtered:interfaceType:photoSource:promptLanguage:source:startDate:action:concurrentMediaAction:actions:persons:place:predominantWeather:resources:time:metaDataForRank:suggestionEngagements:suggestionEngagementViewCount:appEntryEngagements:isAggregatedAndSuppressed:summarizationGranularity:places:subBundleIDs:subSuggestionIDs:includedInSummaryBundleOnly:bundleSubType:bundleSuperType:photoTraits:](self, "initWithBundleIdentifier:suggestionID:bundleType:creationDate:firstCreationDate:endDate:expirationDate:events:filtered:interfaceType:photoSource:promptLanguage:source:startDate:action:concurrentMediaAction:actions:persons:place:predominantWeather:resources:time:metaDataForRank:suggestionEngagements:suggestionEngagementViewCount:appEntryEngagements:isAggregatedAndSuppressed:summarizationGranularity:places:subBundleIDs:subSuggestionIDs:includedInSummaryBundleOnly:bundleSubType:bundleSuperType:photoTraits:", v58, v58, v60, v49, 0, v42, v62, v66, v39, a10, a11, v63, a13,
          v64,
          v67,
          v68,
          v69,
          v70,
          v43,
          v44,
          v45,
          v46,
          v37,
          v53,
          a25,
          v52,
          v40,
          a28,
          v47,
          v35,
          v50,
          v41,
          a33,
          a34,
          v54);

  return v56;
}

- (MOEventBundle)initWithBundleIdentifier:(id)a3 bundleType:(id)a4 creationDate:(id)a5 endDate:(id)a6 expirationDate:(id)a7 events:(id)a8 filtered:(BOOL)a9 interfaceType:(unint64_t)a10 photoSource:(unint64_t)a11 promptLanguage:(id)a12 source:(unint64_t)a13 startDate:(id)a14 action:(id)a15 concurrentMediaAction:(id)a16 actions:(id)a17 persons:(id)a18 place:(id)a19 predominantWeather:(id)a20 resources:(id)a21 time:(id)a22 metaDataForRank:(id)a23 suggestionEngagements:(id)a24 suggestionEngagementViewCount:(unint64_t)a25 appEntryEngagements:(id)a26 isAggregatedAndSuppressed:(BOOL)a27 summarizationGranularity:(unint64_t)a28 places:(id)a29 subBundleIDs:(id)a30 subSuggestionIDs:(id)a31 photoTraits:(id)a32
{
  id v46 = a32;
  id v45 = a31;
  id v32 = a30;
  id v44 = a29;
  id v33 = a26;
  id v34 = a23;
  id v43 = a22;
  id v42 = a21;
  id v41 = a20;
  id v40 = a19;
  id v55 = a18;
  id v54 = a17;
  id v67 = a16;
  id v66 = a15;
  id v65 = a14;
  id v64 = a12;
  id v63 = a8;
  id v61 = a7;
  id v59 = a6;
  id v57 = a5;
  id v35 = a4;
  id v53 = a3;
  id v49 = +[NSMutableSet setWithSet:a24];
  id v47 = +[NSMutableSet setWithSet:v33];

  LOBYTE(v39) = 0;
  LOBYTE(v38) = a27;
  LOBYTE(v37) = a9;
  v51 = -[MOEventBundle initWithBundleIdentifier:suggestionID:bundleType:creationDate:firstCreationDate:endDate:expirationDate:events:filtered:interfaceType:photoSource:promptLanguage:source:startDate:action:concurrentMediaAction:actions:persons:place:predominantWeather:resources:time:metaDataForRank:suggestionEngagements:suggestionEngagementViewCount:appEntryEngagements:isAggregatedAndSuppressed:summarizationGranularity:places:subBundleIDs:subSuggestionIDs:includedInSummaryBundleOnly:bundleSubType:bundleSuperType:photoTraits:](self, "initWithBundleIdentifier:suggestionID:bundleType:creationDate:firstCreationDate:endDate:expirationDate:events:filtered:interfaceType:photoSource:promptLanguage:source:startDate:action:concurrentMediaAction:actions:persons:place:predominantWeather:resources:time:metaDataForRank:suggestionEngagements:suggestionEngagementViewCount:appEntryEngagements:isAggregatedAndSuppressed:summarizationGranularity:places:subBundleIDs:subSuggestionIDs:includedInSummaryBundleOnly:bundleSubType:bundleSuperType:photoTraits:", v53, v53, v35, v57, 0, v59, v61, v63, v37, a10, a11, v64, a13,
          v65,
          v66,
          v67,
          v54,
          v55,
          v40,
          v41,
          v42,
          v43,
          v34,
          v49,
          a25,
          v47,
          v38,
          a28,
          v44,
          v32,
          v45,
          v39,
          0,
          0,
          v46);

  return v51;
}

- (MOEventBundle)initWithBundleIdentifier:(id)a3 creationDate:(id)a4
{
  return [(MOEventBundle *)self initWithBundleIdentifier:a3 suggestionID:a3 startDate:a4 endDate:a4 creationDate:a4];
}

- (id)getBundleType
{
  unint64_t v3 = [(MOEventBundle *)self interfaceType];
  unint64_t v4 = [(MOEventBundle *)self bundleSuperType];
  return +[MOEventBundle getInterfaceTypeString:v3 superType:v4];
}

+ (id)getInterfaceTypeString:(unint64_t)a3 superType:(unint64_t)a4
{
  switch(a3)
  {
    case 1uLL:
      id v5 = @"activity";
      break;
    case 2uLL:
      id v5 = @"outing";
      break;
    case 3uLL:
      id v5 = @"photo_moment";
      break;
    case 4uLL:
      id v5 = @"significant_contact";
      break;
    case 5uLL:
      id v5 = @"media";
      break;
    case 6uLL:
      id v5 = @"shared_content";
      break;
    case 7uLL:
      id v5 = @"time_at_home";
      break;
    case 8uLL:
      id v5 = @"topics_of_interest";
      break;
    case 9uLL:
      if (a4)
      {
        v7 = @"workoutTrend";
        if (a4 == 3) {
          v7 = @"conversationTrend";
        }
        id v5 = v7;
      }
      else
      {
        id v5 = @"trend";
      }
      break;
    case 0xAuLL:
      id v5 = @"photo_memory";
      break;
    case 0xBuLL:
      id v5 = @"evergreen";
      break;
    case 0xCuLL:
      id v5 = @"timeContext";
      break;
    case 0xDuLL:
      id v5 = @"trip";
      break;
    case 0xEuLL:
      id v5 = @"state_of_mind";
      break;
    case 0xFuLL:
      id v5 = @"clustering";
      break;
    default:
      id v5 = @"unknown";
      break;
  }
  return v5;
}

- (id)getSuperTypeString
{
  unint64_t v2 = [(MOEventBundle *)self bundleSuperType];
  if (v2 - 1 > 8) {
    return @"unknown";
  }
  else {
    return off_1000A5F98[v2 - 1];
  }
}

- (id)getSubTypeString
{
  uint64_t v2 = [(MOEventBundle *)self bundleSubType];
  id result = @"unknown";
  if (v2 <= 600)
  {
    if (v2 <= 301)
    {
      switch(v2)
      {
        case 201:
          id result = @"workout";
          break;
        case 202:
          id result = @"workout_weekly_summary";
          break;
        case 203:
          id result = @"workout_routine";
          break;
        case 204:
          id result = @"motion_activity_walking";
          break;
        case 205:
          id result = @"workout_transit";
          break;
        case 206:
          id result = @"motion_activity_transit";
          break;
        case 207:
          id result = @"motion_activity_running";
          break;
        case 208:
          id result = @"motion_activity_mixed_running_walking";
          break;
        default:
          switch(v2)
          {
            case 'e':
              id result = @"visit";
              break;
            case 'f':
              id result = @"flight";
              break;
            case 'g':
              id result = @"dining";
              break;
            case 'h':
              id result = @"shopping";
              break;
            case 'i':
              id result = @"trip";
              break;
            case 'j':
              id result = @"pre_onboarded_visit";
              break;
            default:
              if (v2 == 301) {
                id result = @"contact";
              }
              break;
          }
          break;
      }
    }
    else if (v2 > 500)
    {
      switch(v2)
      {
        case 501:
          id result = @"time_at_home";
          break;
        case 502:
          id result = @"photos_at_home";
          break;
        case 503:
          id result = @"hosting_at_home";
          break;
        case 504:
          id result = @"evergreen_at_home";
          break;
        default:
          return result;
      }
    }
    else
    {
      switch(v2)
      {
        case 401:
          id result = @"song_on_repeat";
          break;
        case 402:
          id result = @"played_song";
          break;
        case 403:
          id result = @"played_podcast";
          break;
        case 404:
          id result = @"media_on_repeat_weekly_summary";
          break;
        case 405:
          id result = @"played_media_weekly_summary";
          break;
        case 406:
          id result = @"media_suppressed";
          break;
        case 407:
          id result = @"media_on_repeat_third_party";
          break;
        case 408:
          id result = @"played_media_third_party";
          break;
        case 409:
          id result = @"media_on_repeat_weekly_summary_third_party";
          break;
        case 410:
          id result = @"played_media_weekly_summary_third_party";
          break;
        default:
          uint64_t v4 = @"contact_weekly_summary";
          id v5 = @"contact_trend";
          if (v2 != 303) {
            id v5 = @"unknown";
          }
          BOOL v6 = v2 == 302;
LABEL_25:
          if (v6) {
            id result = v4;
          }
          else {
            id result = v5;
          }
          break;
      }
    }
  }
  else if (v2 <= 800)
  {
    switch(v2)
    {
      case 601:
        id result = @"photo_memory_single_moment";
        break;
      case 602:
        id result = @"photo_memory_person";
        break;
      case 603:
        id result = @"photo_memory_social_group";
        break;
      case 604:
        id result = @"photo_memory_last_month_at_home";
        break;
      case 605:
        id result = @"photo_memory_lookbacks";
        break;
      case 606:
        id result = @"photo_memory_foodie";
        break;
      case 607:
        id result = @"photo_memory_pet";
        break;
      case 608:
        id result = @"photo_memory_location";
        break;
      case 609:
        id result = @"photo_memory_meaningful_event";
        break;
      case 610:
        id result = @"photo_memory_trip";
        break;
      case 611:
        id result = @"photo_memory_past_super_set";
        break;
      case 612:
        id result = @"photo_memory_season";
        break;
      case 613:
        id result = @"photo_memory_recent_highlights";
        break;
      case 614:
        id result = @"photo_memory_family";
        break;
      case 615:
        id result = @"photo_memory_exciting_moments";
        break;
      case 616:
        id result = @"photo_memory_trends";
        break;
      case 617:
        id result = @"photo_memory_others";
        break;
      default:
        switch(v2)
        {
          case 701:
          case 707:
            id result = @"evergreen_gratitude";
            break;
          case 702:
            id result = @"evergreen_wisdom";
            break;
          case 703:
            id result = @"evergreen_resillience";
            break;
          case 704:
            id result = @"evergreen_creativity";
            break;
          case 705:
            id result = @"evergreen_kindness";
            break;
          case 706:
          case 709:
            id result = @"evergreen_purpose";
            break;
          case 708:
            id result = @"evergreen_resilience";
            break;
          default:
            return result;
        }
        break;
    }
  }
  else
  {
    switch(v2)
    {
      case 901:
        id result = @"clustering_outing_routine";
        break;
      case 902:
        id result = @"clustering_activity_routine";
        break;
      case 903:
        id result = @"clustering_contact_routine";
        break;
      case 904:
        id result = @"clustering_time_at_home_routine";
        break;
      case 905:
        id result = @"clustering_location_grouping";
        break;
      case 906:
        id result = @"clustering_activity_grouping";
        break;
      case 907:
        id result = @"clustering_contact_grouping";
        break;
      case 908:
        id result = @"clustering_thematic_grouping";
        break;
      case 909:
        id result = @"clustering_time_at_home_grouping";
        break;
      case 910:
        id result = @"clustering_unspecified_grouping";
        break;
      default:
        uint64_t v4 = @"daily_mood";
        id v5 = @"momentary_emotion";
        if (v2 != 802) {
          id v5 = @"unknown";
        }
        BOOL v6 = v2 == 801;
        goto LABEL_25;
    }
  }
  return result;
}

- (unint64_t)getInterfaceTypeEnum:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"unknown"])
  {
    unint64_t v4 = 0;
  }
  else if ([v3 isEqualToString:@"activity"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"outing"])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"photo_moment"])
  {
    unint64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"significant_contact"])
  {
    unint64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"media"])
  {
    unint64_t v4 = 5;
  }
  else if ([v3 isEqualToString:@"shared_content"])
  {
    unint64_t v4 = 6;
  }
  else if ([v3 isEqualToString:@"time_at_home"])
  {
    unint64_t v4 = 7;
  }
  else if ([v3 isEqualToString:@"evergreen"])
  {
    unint64_t v4 = 11;
  }
  else if ([v3 isEqualToString:@"topics_of_interest"])
  {
    unint64_t v4 = 8;
  }
  else if (([v3 isEqualToString:@"trend"] & 1) != 0 {
         || ([v3 isEqualToString:@"workoutTrend"] & 1) != 0
  }
         || ([v3 isEqualToString:@"conversationTrend"] & 1) != 0)
  {
    unint64_t v4 = 9;
  }
  else if ([v3 isEqualToString:@"photo_memory"])
  {
    unint64_t v4 = 10;
  }
  else if ([v3 isEqualToString:@"timeContext"])
  {
    unint64_t v4 = 12;
  }
  else if ([v3 isEqualToString:@"trip"])
  {
    unint64_t v4 = 13;
  }
  else if ([v3 isEqualToString:@"state_of_mind"])
  {
    unint64_t v4 = 14;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

+ (unint64_t)getSuperTypeEnum:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"unknown"])
  {
    unint64_t v4 = 0;
  }
  else if ([v3 isEqualToString:@"outing"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"activity"])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"contact"])
  {
    unint64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"media"])
  {
    unint64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"time_at_home"])
  {
    unint64_t v4 = 5;
  }
  else if ([v3 isEqualToString:@"photo_memory"])
  {
    unint64_t v4 = 6;
  }
  else if ([v3 isEqualToString:@"evergreen"])
  {
    unint64_t v4 = 7;
  }
  else if ([v3 isEqualToString:@"state_of_mind"])
  {
    unint64_t v4 = 8;
  }
  else if ([v3 isEqualToString:@"clustering"])
  {
    unint64_t v4 = 9;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (id)description
{
  v56 = [(MOEventBundle *)self bundleIdentifier];
  id v55 = [(MOEventBundle *)self suggestionID];
  id v57 = [(MOEventBundle *)self subSuggestionIDs];
  id v54 = [(MOEventBundle *)self startDate];
  id v53 = [(MOEventBundle *)self endDate];
  v52 = [(MOEventBundle *)self creationDate];
  v51 = [(MOEventBundle *)self expirationDate];
  id v50 = [(MOEventBundle *)self firstCreationDate];
  v48 = [(MOEventBundle *)self displayStartDate];
  id v47 = [(MOEventBundle *)self displayEndDate];
  unint64_t v38 = [(MOEventBundle *)self source];
  unint64_t v37 = [(MOEventBundle *)self interfaceType];
  unint64_t v36 = [(MOEventBundle *)self bundleSubType];
  unint64_t v35 = [(MOEventBundle *)self bundleSuperType];
  if ([(MOEventBundle *)self filtered]) {
    CFStringRef v3 = @"Yes";
  }
  else {
    CFStringRef v3 = @"No";
  }
  CFStringRef v34 = v3;
  if ([(MOEventBundle *)self isAggregatedAndSuppressed]) {
    CFStringRef v4 = @"Yes";
  }
  else {
    CFStringRef v4 = @"No";
  }
  CFStringRef v33 = v4;
  unint64_t v32 = [(MOEventBundle *)self summarizationGranularity];
  if ([(MOEventBundle *)self includedInSummaryBundleOnly]) {
    CFStringRef v5 = @"Yes";
  }
  else {
    CFStringRef v5 = @"No";
  }
  CFStringRef v28 = v5;
  uint64_t v39 = [(MOEventBundle *)self promptLanguage];
  id v49 = [v39 mask];
  unint64_t v29 = [(MOEventBundle *)self photoSource];
  id v46 = [(MOEventBundle *)self photoTraits];
  id v44 = [(MOEventBundle *)self action];
  id v45 = [(MOEventBundle *)self concurrentMediaAction];
  id v43 = [(MOEventBundle *)self place];
  v27 = [(MOEventBundle *)self time];
  id v42 = [(MOEventBundle *)self predominantWeather];
  objc_super v26 = [(MOEventBundle *)self actions];
  id v25 = [(MOEventBundle *)self persons];
  id v16 = [(MOEventBundle *)self places];
  v23 = [(MOEventBundle *)self subBundleIDs];
  unsigned __int8 v31 = [(MOEventBundle *)self metaData];
  id v18 = [v31 count];
  id v30 = [(MOEventBundle *)self events];
  id v17 = [v30 count];
  uint64_t v15 = [(MOEventBundle *)self labels];
  unsigned __int8 v19 = [(MOEventBundle *)self promptLanguages];
  uint64_t v14 = [(MOEventBundle *)self _allResourcesImpl];
  v24 = [(MOEventBundle *)self metaData];
  v22 = [v24 allKeys];
  id v6 = [v22 count];
  id v21 = [(MOEventBundle *)self metaData];
  v7 = [v21 allKeys];
  v20 = [(MOEventBundle *)self metaDataForRank];
  unsigned __int8 v8 = [v20 allKeys];
  id v9 = [(MOEventBundle *)self rankingDictionary];
  id v10 = [(MOEventBundle *)self suggestionEngagementEvents];
  unint64_t v11 = [(MOEventBundle *)self suggestionEngagementViewCount];
  v12 = [(MOEventBundle *)self appEntryEngagementEvents];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<MOEventBundle bundleIdentifier, %@, suggestionID, %@, sub Suggestion IDs, %@, startDate, %@, endDate, %@, creationDate, %@, expirationDate, %@, firstCreationDate, %@, displayStartDate, %@, displayEndDate, %@, source, %lu, interfaceType, %lu, bundleSubType, %lu, bundleSuperType, %lu, filtered, %@, agg./suppressed, %@, sum. granularity, %lu, includedInSummaryOnly, %@, promptLanguage, %@, photoSource, %lu, traits, %@, action, %@, concurrentMediaAction, %@, place, %@, time, %@, predominantWeather %@, actions, %@, persons, %@, places, %@, sub bundle IDs, %@, metaData.count, %lu,  events.count, %lu, labels, %@, prompts, %@, allResources, %@, meta, %lu, meta keywords, %@, metaDataForRank, %@, rankings, %@, suggestionEngagements, %@, suggestionEngagementViewCount, %lu, appEntryEngagementEvents %@>", v56, v55, v57, v54, v53, v52, v51, v50, v48, v47, v38, v37, v36, v35, v34, v33,
    v32,
    v28,
    v49,
    v29,
    v46,
    v44,
    v45,
    v43,
    v27,
    v42,
    v26,
    v25,
    v16,
    v23,
    v18,
    v17,
    v15,
    v19,
    v14,
    v6,
    v7,
    v8,
    v9,
    v10,
    v11,
  id v40 = v12);

  return v40;
}

- (MOEventBundle)initWithEventSet:(id)a3 filtered:(BOOL)a4
{
  id v6 = a3;
  v7 = +[NSDate date];
  unsigned __int8 v8 = +[NSUUID UUID];
  id v9 = [(MOEventBundle *)self initWithBundleIdentifier:v8 suggestionID:v8 startDate:v7 endDate:v7 creationDate:v7];
  if (v9)
  {
    uint64_t v10 = [v6 allObjects];
    events = v9->_events;
    v9->_events = (NSArray *)v10;

    v9->_filtered = a4;
    [(MOEventBundle *)v9 setPropertiesBasedOnEvents];
  }

  return v9;
}

- (NSSet)getCategories
{
  uint64_t v2 = [(MOEventBundle *)self events];
  CFStringRef v3 = [v2 valueForKeyPath:@"@distinctUnionOfObjects.category"];
  CFStringRef v4 = +[NSSet setWithArray:v3];

  return (NSSet *)v4;
}

- (void)setPropertiesBasedOnEvents
{
  CFStringRef v3 = +[NSDate distantFuture];
  startDate = self->_startDate;
  self->_startDate = v3;

  CFStringRef v5 = +[NSDate distantPast];
  endDate = self->_endDate;
  self->_endDate = v5;

  v7 = +[NSDate distantFuture];
  expirationDate = self->_expirationDate;
  self->_expirationDate = v7;

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v9 = [(MOEventBundle *)self events];
  id v10 = [v9 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v32;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v32 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v15 = self->_startDate;
        id v16 = [v14 startDate];
        LODWORD(v15) = [(NSDate *)v15 isAfterDate:v16];

        if (v15)
        {
          id v17 = [v14 startDate];
          id v18 = (NSDate *)[v17 copy];
          unsigned __int8 v19 = self->_startDate;
          self->_startDate = v18;
        }
        v20 = [v14 endDate];
        unsigned int v21 = [v20 isAfterDate:self->_endDate];

        if (v21)
        {
          v22 = [v14 endDate];
          v23 = (NSDate *)[v22 copy];
          v24 = self->_endDate;
          self->_endDate = v23;
        }
        id v25 = self->_expirationDate;
        objc_super v26 = [v14 expirationDate];
        LODWORD(v25) = [(NSDate *)v25 isAfterDate:v26];

        if (v25)
        {
          v27 = [v14 expirationDate];
          CFStringRef v28 = (NSDate *)[v27 copy];
          unint64_t v29 = self->_expirationDate;
          self->_expirationDate = v28;
        }
        unint64_t v30 = (unint64_t)[v14 provider] - 1;
        if (v30 <= 0xA) {
          self->_source |= qword_10009B318[v30];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v11);
  }
}

- (void)addBackgroundAction:(id)a3
{
  id v6 = a3;
  CFStringRef v4 = [(MOEventBundle *)self backgroundActions];
  CFStringRef v5 = +[NSMutableArray arrayWithArray:v4];

  if (v6) {
    [v5 addObject:v6];
  }
  [(MOEventBundle *)self setBackgroundActions:v5];
}

- (void)addAction:(id)a3
{
  id v6 = a3;
  CFStringRef v4 = [(MOEventBundle *)self actions];
  CFStringRef v5 = +[NSMutableArray arrayWithArray:v4];

  if (v6) {
    [v5 addObject:v6];
  }
  [(MOEventBundle *)self setActions:v5];
}

- (unint64_t)bundleManagementPolicy
{
  return (id)[(MOEventBundle *)self interfaceType] == (id)13
      || (id)[(MOEventBundle *)self interfaceType] == (id)11
      || (id)[(MOEventBundle *)self interfaceType] == (id)10;
}

- (id)localStartDate
{
  uint64_t v3 = [(MOEventBundle *)self time];
  if (!v3) {
    goto LABEL_4;
  }
  CFStringRef v4 = (void *)v3;
  CFStringRef v5 = [(MOEventBundle *)self time];
  id v6 = [v5 timeZone];

  if (v6)
  {
    id v7 = objc_alloc((Class)NSTimeZone);
    unsigned __int8 v8 = [(MOEventBundle *)self time];
    id v9 = [v8 timeZone];
    id v10 = [v7 initWithName:v9];

    id v11 = [(MOEventBundle *)self startDate];
    uint64_t v12 = +[MOTime localTimeOfDate:v11 timeZone:v10];
  }
  else
  {
LABEL_4:
    uint64_t v12 = [(MOEventBundle *)self startDate];
  }
  return v12;
}

- (id)localEndDate
{
  uint64_t v3 = [(MOEventBundle *)self time];
  if (!v3) {
    goto LABEL_4;
  }
  CFStringRef v4 = (void *)v3;
  CFStringRef v5 = [(MOEventBundle *)self time];
  id v6 = [v5 timeZone];

  if (v6)
  {
    id v7 = objc_alloc((Class)NSTimeZone);
    unsigned __int8 v8 = [(MOEventBundle *)self time];
    id v9 = [v8 timeZone];
    id v10 = [v7 initWithName:v9];

    id v11 = [(MOEventBundle *)self endDate];
    uint64_t v12 = +[MOTime localTimeOfDate:v11 timeZone:v10];
  }
  else
  {
LABEL_4:
    uint64_t v12 = [(MOEventBundle *)self endDate];
  }
  return v12;
}

- (id)displayStartDate
{
  if ((id)[(MOEventBundle *)self bundleSubType] == (id)202
    || (id)[(MOEventBundle *)self bundleSubType] == (id)404
    || (id)[(MOEventBundle *)self bundleSubType] == (id)405)
  {
    uint64_t v3 = +[NSDate distantFuture];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    CFStringRef v4 = [(MOEventBundle *)self events];
    id v5 = [v4 countByEnumeratingWithState:&v55 objects:v61 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v56;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v56 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v55 + 1) + 8 * i);
          if (([v9 category] == (id)2 || objc_msgSend(v9, "category") == (id)4)
            && [v9 provider] != (id)5)
          {
            id v10 = [v9 startDate];
            unsigned int v11 = [v3 isAfterDate:v10];

            if (v11)
            {
              uint64_t v12 = [v9 startDate];

              uint64_t v3 = (void *)v12;
            }
          }
        }
        id v6 = [v4 countByEnumeratingWithState:&v55 objects:v61 count:16];
      }
      while (v6);
    }

    uint64_t v13 = [(MOEventBundle *)self time];
    if (!v13) {
      goto LABEL_19;
    }
    uint64_t v14 = (void *)v13;
    uint64_t v15 = [(MOEventBundle *)self time];
    id v16 = [v15 timeZone];

    if (v16)
    {
      id v17 = objc_alloc((Class)NSTimeZone);
      id v18 = [(MOEventBundle *)self time];
      unsigned __int8 v19 = [v18 timeZone];
      id v20 = [v17 initWithName:v19];

      id v21 = +[MOTime localTimeOfDate:v3 timeZone:v20];
    }
    else
    {
LABEL_19:
      id v21 = v3;
    }
  }
  else if ((id)[(MOEventBundle *)self bundleSubType] == (id)203)
  {
    id v21 = [(MOEventBundle *)self startDate];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    v23 = [(MOEventBundle *)self events];
    id v24 = [v23 countByEnumeratingWithState:&v51 objects:v60 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v52;
      CFStringRef v27 = @"kEventResourcePatternWorkoutInfoDictArray";
      uint64_t v44 = *(void *)v52;
      id v45 = v23;
      CFStringRef v43 = @"kEventResourcePatternWorkoutInfoDictArray";
      do
      {
        CFStringRef v28 = 0;
        id v46 = v25;
        do
        {
          if (*(void *)v52 != v26) {
            objc_enumerationMutation(v23);
          }
          unint64_t v29 = *(void **)(*((void *)&v51 + 1) + 8 * (void)v28);
          if (objc_msgSend(v29, "provider", v43, v44, v45) == (id)5 && objc_msgSend(v29, "category") == (id)2)
          {
            unint64_t v30 = [v29 patterns];
            long long v31 = [v30 objectForKey:v27];

            if (v31)
            {
              long long v49 = 0u;
              long long v50 = 0u;
              long long v47 = 0u;
              long long v48 = 0u;
              long long v32 = [v29 patterns];
              long long v33 = [v32 objectForKeyedSubscript:v27];

              id v34 = [v33 countByEnumeratingWithState:&v47 objects:v59 count:16];
              if (v34)
              {
                id v35 = v34;
                uint64_t v36 = *(void *)v48;
                do
                {
                  for (j = 0; j != v35; j = (char *)j + 1)
                  {
                    if (*(void *)v48 != v36) {
                      objc_enumerationMutation(v33);
                    }
                    unint64_t v38 = [*(id *)(*((void *)&v47 + 1) + 8 * (void)j) objectForKeyedSubscript:@"kEventResourcePatternWorkoutStartDate"];
                    [v38 doubleValue];
                    double v40 = v39;

                    id v41 = +[NSDate dateWithTimeIntervalSince1970:v40];
                    if ([v21 isAfterDate:v41])
                    {
                      id v42 = v41;

                      id v21 = v42;
                    }
                  }
                  id v35 = [v33 countByEnumeratingWithState:&v47 objects:v59 count:16];
                }
                while (v35);
              }

              uint64_t v26 = v44;
              v23 = v45;
              CFStringRef v27 = v43;
            }
            id v25 = v46;
          }
          CFStringRef v28 = (char *)v28 + 1;
        }
        while (v28 != v25);
        id v25 = [v23 countByEnumeratingWithState:&v51 objects:v60 count:16];
      }
      while (v25);
    }
  }
  else
  {
    id v21 = [(MOEventBundle *)self localStartDate];
  }
  return v21;
}

- (id)displayEndDate
{
  if ((id)[(MOEventBundle *)self bundleSubType] == (id)202
    || (id)[(MOEventBundle *)self bundleSubType] == (id)404
    || (id)[(MOEventBundle *)self bundleSubType] == (id)405)
  {
    uint64_t v3 = +[NSDate distantPast];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    CFStringRef v4 = [(MOEventBundle *)self events];
    id v5 = [v4 countByEnumeratingWithState:&v55 objects:v61 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v56;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v56 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v55 + 1) + 8 * i);
          if (([v9 category] == (id)2 || objc_msgSend(v9, "category") == (id)4)
            && [v9 provider] != (id)5)
          {
            id v10 = [v9 endDate];
            unsigned int v11 = [v3 isBeforeDate:v10];

            if (v11)
            {
              uint64_t v12 = [v9 endDate];

              uint64_t v3 = (void *)v12;
            }
          }
        }
        id v6 = [v4 countByEnumeratingWithState:&v55 objects:v61 count:16];
      }
      while (v6);
    }

    uint64_t v13 = [(MOEventBundle *)self time];
    if (!v13) {
      goto LABEL_19;
    }
    uint64_t v14 = (void *)v13;
    uint64_t v15 = [(MOEventBundle *)self time];
    id v16 = [v15 timeZone];

    if (v16)
    {
      id v17 = objc_alloc((Class)NSTimeZone);
      id v18 = [(MOEventBundle *)self time];
      unsigned __int8 v19 = [v18 timeZone];
      id v20 = [v17 initWithName:v19];

      id v21 = +[MOTime localTimeOfDate:v3 timeZone:v20];
    }
    else
    {
LABEL_19:
      id v21 = v3;
    }
  }
  else if ((id)[(MOEventBundle *)self bundleSubType] == (id)203)
  {
    id v21 = [(MOEventBundle *)self endDate];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    v23 = [(MOEventBundle *)self events];
    id v24 = [v23 countByEnumeratingWithState:&v51 objects:v60 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v52;
      CFStringRef v27 = @"kEventResourcePatternWorkoutInfoDictArray";
      uint64_t v44 = *(void *)v52;
      id v45 = v23;
      CFStringRef v43 = @"kEventResourcePatternWorkoutInfoDictArray";
      do
      {
        CFStringRef v28 = 0;
        id v46 = v25;
        do
        {
          if (*(void *)v52 != v26) {
            objc_enumerationMutation(v23);
          }
          unint64_t v29 = *(void **)(*((void *)&v51 + 1) + 8 * (void)v28);
          if (objc_msgSend(v29, "provider", v43, v44, v45) == (id)5 && objc_msgSend(v29, "category") == (id)2)
          {
            unint64_t v30 = [v29 patterns];
            long long v31 = [v30 objectForKey:v27];

            if (v31)
            {
              long long v49 = 0u;
              long long v50 = 0u;
              long long v47 = 0u;
              long long v48 = 0u;
              long long v32 = [v29 patterns];
              long long v33 = [v32 objectForKeyedSubscript:v27];

              id v34 = [v33 countByEnumeratingWithState:&v47 objects:v59 count:16];
              if (v34)
              {
                id v35 = v34;
                uint64_t v36 = *(void *)v48;
                do
                {
                  for (j = 0; j != v35; j = (char *)j + 1)
                  {
                    if (*(void *)v48 != v36) {
                      objc_enumerationMutation(v33);
                    }
                    unint64_t v38 = [*(id *)(*((void *)&v47 + 1) + 8 * (void)j) objectForKeyedSubscript:@"kEventResourcePatternWorkoutEndDate"];
                    [v38 doubleValue];
                    double v40 = v39;

                    id v41 = +[NSDate dateWithTimeIntervalSince1970:v40];
                    if ([v21 isBeforeDate:v41])
                    {
                      id v42 = v41;

                      id v21 = v42;
                    }
                  }
                  id v35 = [v33 countByEnumeratingWithState:&v47 objects:v59 count:16];
                }
                while (v35);
              }

              uint64_t v26 = v44;
              v23 = v45;
              CFStringRef v27 = v43;
            }
            id v25 = v46;
          }
          CFStringRef v28 = (char *)v28 + 1;
        }
        while (v28 != v25);
        id v25 = [v23 countByEnumeratingWithState:&v51 objects:v60 count:16];
      }
      while (v25);
    }
  }
  else
  {
    id v21 = [(MOEventBundle *)self localEndDate];
  }
  return v21;
}

- (void)addPerson:(id)a3
{
  id v6 = a3;
  CFStringRef v4 = [(MOEventBundle *)self persons];
  id v5 = +[NSMutableArray arrayWithArray:v4];

  if (v6) {
    [v5 addObject:v6];
  }
  [(MOEventBundle *)self setPersons:v5];
}

- (void)addResource:(id)a3
{
  id v6 = a3;
  CFStringRef v4 = [(MOEventBundle *)self resources];
  id v5 = +[NSMutableArray arrayWithArray:v4];

  if (v6) {
    [v5 addObject:v6];
  }
  [(MOEventBundle *)self setResources:v5];
}

- (void)addPhotoTraits:(id)a3
{
  id v6 = a3;
  CFStringRef v4 = [(MOEventBundle *)self photoTraits];
  id v5 = +[NSMutableArray arrayWithArray:v4];

  if ([v5 count]) {
    [v5 addObjectsFromArray:v6];
  }
  [(MOEventBundle *)self setPhotoTraits:v5];
}

- (void)addResources:(id)a3
{
  id v6 = a3;
  CFStringRef v4 = [(MOEventBundle *)self resources];
  id v5 = +[NSMutableArray arrayWithArray:v4];

  if ([v6 count]) {
    [v5 addObjectsFromArray:v6];
  }
  [(MOEventBundle *)self setResources:v5];
}

- (void)addMetaDataForRankForKey:(id)a3 value:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unsigned __int8 v8 = [(MOEventBundle *)self metaDataForRank];
  id v10 = +[NSMutableDictionary dictionaryWithDictionary:v8];

  [v10 setObject:v6 forKey:v7];
  id v9 = [v10 copy];
  [(MOEventBundle *)self setMetaDataForRank:v9];
}

- (id)_allResourcesImpl
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __34__MOEventBundle__allResourcesImpl__block_invoke;
  v5[3] = &unk_1000A5F50;
  id v3 = (id)objc_opt_new();
  id v6 = v3;
  [(MOEventBundle *)self withResourcesUsingBlock:v5];

  return v3;
}

id __34__MOEventBundle__allResourcesImpl__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (void)withResourcesUsingBlock:(id)a3
{
  id v4 = a3;
  uint64_t v60 = 0;
  id v61 = &v60;
  uint64_t v62 = 0x2020000000;
  char v63 = 0;
  long long v48 = self;
  id v5 = [(MOEventBundle *)self resources];
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472;
  v57[2] = __41__MOEventBundle_withResourcesUsingBlock___block_invoke;
  v57[3] = &unk_1000A5F78;
  id v6 = (char *)v4;
  long long v58 = v6;
  id v59 = &v60;
  [v5 enumerateObjectsUsingBlock:v57];

  if (!*((unsigned char *)v61 + 24))
  {
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v7 = [(MOEventBundle *)v48 persons];
    id v8 = [v7 countByEnumeratingWithState:&v53 objects:v65 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v54;
LABEL_4:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v54 != v9) {
          objc_enumerationMutation(v7);
        }
        unsigned int v11 = *(void **)(*((void *)&v53 + 1) + 8 * v10);
        uint64_t v13 = [[MOResource alloc] initWithPerson:v11];
        if (!v13) {
          goto LABEL_10;
        }
        uint64_t v14 = [v11 sourceEventIdentifier];
        [(MOResource *)v13 setSourceEventIdentifier:v14];

        (*((void (**)(char *, MOResource *, uint64_t *))v6 + 2))(v6, v13, v61 + 3);
        if (*((unsigned char *)v61 + 24)) {
          int v15 = 0;
        }
        else {
LABEL_10:
        }
          int v15 = 1;

        if (!v15) {
          goto LABEL_45;
        }
        if (v8 == (id)++v10)
        {
          id v8 = [v7 countByEnumeratingWithState:&v53 objects:v65 count:16];
          if (v8) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    id v16 = [(MOEventBundle *)v48 place];
    if (!v16) {
      goto LABEL_25;
    }
    id v17 = [(MOEventBundle *)v48 places];
    BOOL v18 = [v17 count] == 0;

    if (!v18) {
      goto LABEL_25;
    }
    id v20 = [(MOEventBundle *)v48 place];
    id v21 = [v20 startDate];

    if (!v21)
    {
      id v21 = [(MOEventBundle *)v48 startDate];
    }
    v22 = [(MOEventBundle *)v48 place];
    v23 = [v22 endDate];

    if (!v23)
    {
      v23 = [(MOEventBundle *)v48 endDate];
    }
    id v24 = [MOResource alloc];
    id v25 = [(MOEventBundle *)v48 place];
    uint64_t v26 = [(MOResource *)v24 initWithPlace:v25 startDate:v21 endDate:v23];

    if (!v26) {
      goto LABEL_23;
    }
    CFStringRef v27 = [(MOEventBundle *)v48 place];
    CFStringRef v28 = [v27 sourceEventIdentifier];
    [(MOResource *)v26 setSourceEventIdentifier:v28];

    (*((void (**)(char *, MOResource *, uint64_t *))v6 + 2))(v6, v26, v61 + 3);
    if (*((unsigned char *)v61 + 24)) {
      int v29 = 0;
    }
    else {
LABEL_23:
    }
      int v29 = 1;

    if (v29)
    {
LABEL_25:
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v7 = [(MOEventBundle *)v48 places];
      id v30 = [v7 countByEnumeratingWithState:&v49 objects:v64 count:16];
      if (v30)
      {
        uint64_t v31 = *(void *)v50;
        long long v47 = v6 + 16;
LABEL_27:
        uint64_t v32 = 0;
        while (1)
        {
          if (*(void *)v50 != v31) {
            objc_enumerationMutation(v7);
          }
          long long v33 = *(void **)(*((void *)&v49 + 1) + 8 * v32);
          id v35 = [v33 startDate];
          if (!v35)
          {
            id v35 = [(MOEventBundle *)v48 startDate];
          }
          uint64_t v36 = objc_msgSend(v33, "endDate", v47);
          if (!v36)
          {
            uint64_t v36 = [(MOEventBundle *)v48 endDate];
          }
          unint64_t v37 = [[MOResource alloc] initWithPlace:v33 startDate:v35 endDate:v36];
          BOOL v39 = 1;
          if (v37)
          {
            unint64_t v38 = [v33 sourceEventIdentifier];
            [(MOResource *)v37 setSourceEventIdentifier:v38];

            (*((void (**)(char *, MOResource *, uint64_t *))v6 + 2))(v6, v37, v61 + 3);
            if (*((unsigned char *)v61 + 24)) {
              BOOL v39 = 0;
            }
          }

          if (!v39) {
            break;
          }
          if (v30 == (id)++v32)
          {
            id v30 = [v7 countByEnumeratingWithState:&v49 objects:v64 count:16];
            if (v30) {
              goto LABEL_27;
            }
            goto LABEL_41;
          }
        }
LABEL_45:

        goto LABEL_46;
      }
LABEL_41:

      double v40 = [(MOEventBundle *)v48 predominantWeather];

      if (v40)
      {
        id v42 = [MOResource alloc];
        CFStringRef v43 = [(MOEventBundle *)v48 predominantWeather];
        uint64_t v44 = [(MOResource *)v42 initWithWeather:v43];

        if (v44)
        {
          id v45 = [(MOEventBundle *)v48 predominantWeather];
          id v46 = [v45 sourceEventIdentifier];
          [(MOResource *)v44 setSourceEventIdentifier:v46];

          (*((void (**)(char *, MOResource *, uint64_t *))v6 + 2))(v6, v44, v61 + 3);
        }
      }
    }
  }
LABEL_46:

  _Block_object_dispose(&v60, 8);
}

uint64_t __41__MOEventBundle_withResourcesUsingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *a4;
  return result;
}

- (void)buildResources
{
  id v6 = objc_opt_new();
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id v68 = self;
  id v7 = [(MOEventBundle *)self persons];
  id v8 = [v7 countByEnumeratingWithState:&v78 objects:v84 count:16];
  uint64_t v9 = &OBJC_METACLASS___MOContextDimension;
  if (v8)
  {
    id v10 = v8;
    int v11 = 0;
    id v4 = *(id *)v79;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(id *)v79 != v4) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void **)(*((void *)&v78 + 1) + 8 * i);
        uint64_t v14 = [[MOResource alloc] initWithPerson:v13];
        uint64_t v2 = v14;
        if (v14)
        {
          id v3 = [(MOResource *)v14 identifier];

          if (v3)
          {
            int v15 = [v13 sourceEventIdentifier];
            [v2 setSourceEventIdentifier:v15];

            [v2 priorityScore];
            if (v16 <= 0.0) {
              [v2 setPriorityScore:(double)v11++ + 10000.0];
            }
            [v6 addObject:v2];
          }
        }
      }
      id v10 = [v7 countByEnumeratingWithState:&v78 objects:v84 count:16];
    }
    while (v10);
  }
  else
  {
    int v11 = 0;
  }

  id v17 = v68;
  if ((id)[(MOEventBundle *)v68 interfaceType] != (id)7)
  {
    id v18 = [(MOEventBundle *)v68 interfaceType];
    if (v18 == (id)1)
    {
      id obj = [(MOEventBundle *)v68 place];
      if ([obj placeUserType] == (id)1)
      {
LABEL_84:

        goto LABEL_85;
      }
    }
    id v19 = [(MOEventBundle *)v68 interfaceType];
    if (v19 == (id)1)
    {
      uint64_t v2 = [(MOEventBundle *)v68 place];
      if ([v2 placeUserType] == (id)2)
      {
        BOOL v20 = 0;
        goto LABEL_35;
      }
    }
    id v4 = [(MOEventBundle *)v68 interfaceType];
    if (v4 == (id)12)
    {
      id v3 = [(MOEventBundle *)v68 place];
      if ([v3 placeUserType] == (id)1)
      {
        BOOL v20 = 0;
LABEL_29:

        goto LABEL_34;
      }
      if ((id)[(MOEventBundle *)v68 interfaceType] == (id)12)
      {
LABEL_27:
        id v21 = [(MOEventBundle *)v68 place];
        BOOL v20 = [v21 placeUserType] != (id)2;

        if (v4 != (id)12)
        {
          id v17 = v68;
          if (v19 != (id)1)
          {
LABEL_36:
            if (v18 == (id)1)
            {

              if (!v20) {
                goto LABEL_85;
              }
            }
            else if (!v20)
            {
              goto LABEL_85;
            }
            v22 = [(MOEventBundle *)v17 place];
            [v22 priorityScore];
            if (v23 < 20000.0)
            {
              uint64_t v24 = [(MOEventBundle *)v17 place];
              if (v24)
              {
                id v25 = (void *)v24;
                uint64_t v26 = [(MOEventBundle *)v17 places];
                id v27 = [v26 count];

                if (v27)
                {
LABEL_53:
                  long long v76 = 0u;
                  long long v77 = 0u;
                  long long v74 = 0u;
                  long long v75 = 0u;
                  id obj = [(MOEventBundle *)v17 places];
                  id v37 = [obj countByEnumeratingWithState:&v74 objects:v83 count:16];
                  if (!v37) {
                    goto LABEL_84;
                  }
                  id v38 = v37;
                  uint64_t v39 = *(void *)v75;
                  while (1)
                  {
                    for (j = 0; j != v38; j = (char *)j + 1)
                    {
                      if (*(void *)v75 != v39) {
                        objc_enumerationMutation(obj);
                      }
                      id v41 = *(void **)(*((void *)&v74 + 1) + 8 * (void)j);
                      [v41 priorityScore];
                      if (v42 < 20000.0)
                      {
                        id v43 = [(MOEventBundle *)v17 interfaceType];
                        if (v43 == (id)12)
                        {
                          id v4 = [(MOEventBundle *)v17 place];
                          if ([v4 placeUserType] == (id)1)
                          {
                            uint64_t v44 = v4;
LABEL_81:

                            continue;
                          }
                          if ((id)[(MOEventBundle *)v17 interfaceType] == (id)12)
                          {
LABEL_65:
                            id v45 = v4;
                            id v46 = [(MOEventBundle *)v17 place];
                            id v47 = [v46 placeUserType];

                            if (v43 == (id)12)
                            {

                              BOOL v48 = v47 == (id)2;
                              id v4 = v45;
                              id v17 = v68;
                              if (v48) {
                                goto LABEL_70;
                              }
                            }
                            else
                            {
                              BOOL v48 = v47 == (id)2;
                              id v17 = v68;
                              id v4 = v45;
                              if (v48)
                              {
LABEL_70:
                                uint64_t v9 = &OBJC_METACLASS___MOContextDimension;
                                continue;
                              }
                            }
                          }
                          else
                          {
                          }
                        }
                        else if ((id)[(MOEventBundle *)v17 interfaceType] == (id)12)
                        {
                          goto LABEL_65;
                        }
                        id v49 = v4;
                        uint64_t v44 = [v41 startDate];
                        if (!v44)
                        {
                          uint64_t v44 = [(MOEventBundle *)v17 startDate];
                        }
                        long long v50 = [v41 endDate];
                        if (!v50)
                        {
                          long long v50 = [(MOEventBundle *)v17 endDate];
                        }
                        long long v51 = [[MOResource alloc] initWithPlace:v41 startDate:v44 endDate:v50];
                        if (v51)
                        {
                          long long v52 = [v41 sourceEventIdentifier];
                          [(MOResource *)v51 setSourceEventIdentifier:v52];

                          [(MOResource *)v51 priorityScore];
                          if (v53 <= 0.0) {
                            [(MOResource *)v51 setPriorityScore:(double)v11++ + 10000.0];
                          }
                          [v6 addObject:v51];
                        }

                        id v17 = v68;
                        id v4 = v49;
                        uint64_t v9 = &OBJC_METACLASS___MOContextDimension;
                        goto LABEL_81;
                      }
                    }
                    id v38 = [obj countByEnumeratingWithState:&v74 objects:v83 count:16];
                    if (!v38) {
                      goto LABEL_84;
                    }
                  }
                }
                CFStringRef v28 = [(MOEventBundle *)v17 place];
                v22 = [v28 startDate];

                if (!v22)
                {
                  v22 = [(MOEventBundle *)v17 startDate];
                }
                int v29 = [(MOEventBundle *)v17 place];
                id v30 = [v29 endDate];

                if (!v30)
                {
                  id v30 = [(MOEventBundle *)v17 endDate];
                }
                uint64_t v31 = [MOResource alloc];
                uint64_t v32 = [(MOEventBundle *)v17 place];
                long long v33 = [(MOResource *)v31 initWithPlace:v32 startDate:v22 endDate:v30];

                if (v33)
                {
                  id v34 = [(MOEventBundle *)v17 place];
                  id v35 = [v34 sourceEventIdentifier];
                  [(MOResource *)v33 setSourceEventIdentifier:v35];

                  [(MOResource *)v33 priorityScore];
                  if (v36 <= 0.0) {
                    [(MOResource *)v33 setPriorityScore:(double)v11++ + 10000.0];
                  }
                  [v6 addObject:v33];
                }
              }
            }

            goto LABEL_53;
          }
LABEL_35:

          goto LABEL_36;
        }
        id v17 = v68;
        goto LABEL_29;
      }
    }
    else if ((id)[(MOEventBundle *)v68 interfaceType] == (id)12)
    {
      goto LABEL_27;
    }
    BOOL v20 = 1;
LABEL_34:
    if (v19 != (id)1) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
LABEL_85:
  long long v54 = [(MOEventBundle *)v17 predominantWeather];

  if (v54)
  {
    id v55 = objc_alloc(&v9[43]);
    long long v56 = [(MOEventBundle *)v17 predominantWeather];
    id v57 = [v55 initWithWeather:v56];

    if (v57)
    {
      long long v58 = [(MOEventBundle *)v17 predominantWeather];
      id v59 = [v58 sourceEventIdentifier];
      [v57 setSourceEventIdentifier:v59];

      [v57 priorityScore];
      if (v60 <= 0.0) {
        [v57 setPriorityScore:(double)v11++ + 10000.0];
      }
      [v6 addObject:v57];
    }
  }
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v61 = [(MOEventBundle *)v17 resources];
  id v62 = [v61 countByEnumeratingWithState:&v70 objects:v82 count:16];
  if (v62)
  {
    id v63 = v62;
    uint64_t v64 = *(void *)v71;
    do
    {
      for (k = 0; k != v63; k = (char *)k + 1)
      {
        if (*(void *)v71 != v64) {
          objc_enumerationMutation(v61);
        }
        id v66 = *(void **)(*((void *)&v70 + 1) + 8 * (void)k);
        [v66 priorityScore];
        if (v67 <= 0.0) {
          [v66 setPriorityScore:(double)v11++ + 10000.0];
        }
        [v6 addObject:v66];
      }
      id v63 = [v61 countByEnumeratingWithState:&v70 objects:v82 count:16];
    }
    while (v63);
  }

  [(MOEventBundle *)v17 setResources:v6];
}

- (void)addEvent:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(MOEventBundle *)self events];

    if (v5)
    {
      id v6 = [(MOEventBundle *)self events];
      id v7 = +[NSMutableArray arrayWithArray:v6];

      [v7 addObject:v4];
      id v8 = [v7 copy];
      [(MOEventBundle *)self setEvents:v8];
    }
    else
    {
      id v9 = v4;
      id v7 = +[NSArray arrayWithObjects:&v9 count:1];
      [(MOEventBundle *)self setEvents:v7];
    }
  }
}

- (void)addEvents:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v9 = v4;
    if ([v4 count])
    {
      id v5 = [(MOEventBundle *)self events];

      if (v5)
      {
        id v6 = [(MOEventBundle *)self events];
        id v7 = +[NSMutableArray arrayWithArray:v6];

        if ([v9 count]) {
          [v7 addObjectsFromArray:v9];
        }
        id v8 = [v7 copy];
        [(MOEventBundle *)self setEvents:v8];
      }
      else
      {
        [(MOEventBundle *)self setEvents:v9];
      }
    }
  }
  _objc_release_x1();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MOEventBundle)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"creationDate"];
  id v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    id v9 = 0;
  }
  else
  {
    id v10 = [(MOEventBundle *)self initWithBundleIdentifier:v5 creationDate:v6];
    int v11 = v10;
    if (v10)
    {
      uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
      startDate = v11->_startDate;
      v11->_startDate = (NSDate *)v12;

      uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endDate"];
      endDate = v11->_endDate;
      v11->_endDate = (NSDate *)v14;

      uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"firstCreationDate"];
      firstCreationDate = v11->_firstCreationDate;
      v11->_firstCreationDate = (NSDate *)v16;

      uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expirationDate"];
      expirationDate = v11->_expirationDate;
      v11->_expirationDate = (NSDate *)v18;

      v11->_source = (unint64_t)[v4 decodeIntegerForKey:@"source"];
      v11->_interfaceType = (unint64_t)[v4 decodeIntegerForKey:@"interfaceType"];
      v11->_photoSource = (unint64_t)[v4 decodeIntegerForKey:@"photoSource"];
      uint64_t v20 = objc_opt_class();
      id v21 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v20, objc_opt_class(), 0);
      uint64_t v22 = [v4 decodeObjectOfClasses:v21 forKey:@"events"];
      events = v11->_events;
      v11->_events = (NSArray *)v22;

      v11->_filtered = [v4 decodeBoolForKey:@"filtered"];
      uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"promptLanguage"];
      promptLanguage = v11->_promptLanguage;
      v11->_promptLanguage = (NSString *)v24;

      uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"action"];
      action = v11->_action;
      v11->_action = (MOAction *)v26;

      uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"concurrentMediaAction"];
      concurrentMediaAction = v11->_concurrentMediaAction;
      v11->_concurrentMediaAction = (MOAction *)v28;

      uint64_t v30 = objc_opt_class();
      uint64_t v31 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v30, objc_opt_class(), 0);
      uint64_t v32 = [v4 decodeObjectOfClasses:v31 forKey:@"actions"];
      actions = v11->_actions;
      v11->_actions = (NSArray *)v32;

      uint64_t v34 = objc_opt_class();
      id v35 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v34, objc_opt_class(), 0);
      uint64_t v36 = [v4 decodeObjectOfClasses:v35 forKey:@"backgroundActions"];
      backgroundActions = v11->_backgroundActions;
      v11->_backgroundActions = (NSArray *)v36;

      uint64_t v38 = objc_opt_class();
      uint64_t v39 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v38, objc_opt_class(), 0);
      uint64_t v40 = [v4 decodeObjectOfClasses:v39 forKey:@"persons"];
      persons = v11->_persons;
      v11->_persons = (NSArray *)v40;

      uint64_t v42 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"place"];
      place = v11->_place;
      v11->_place = (MOPlace *)v42;

      uint64_t v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"weather"];
      predominantWeather = v11->_predominantWeather;
      v11->_predominantWeather = (MOWeather *)v44;

      uint64_t v46 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"time"];
      time = v11->_time;
      v11->_time = (MOTime *)v46;

      uint64_t v48 = objc_opt_class();
      id v49 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v48, objc_opt_class(), 0);
      uint64_t v50 = [v4 decodeObjectOfClasses:v49 forKey:@"resources"];
      resources = v11->_resources;
      v11->_resources = (NSArray *)v50;

      long long v52 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rankingDictionary"];
      uint64_t v53 = +[MODictionaryEncoder decodeToDictionary:v52];
      rankingDictionary = v11->_rankingDictionary;
      v11->_rankingDictionary = (NSDictionary *)v53;

      uint64_t v55 = objc_opt_class();
      long long v56 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v55, objc_opt_class(), 0);
      uint64_t v57 = [v4 decodeObjectOfClasses:v56 forKey:@"labels"];
      labels = v11->_labels;
      v11->_labels = (NSArray *)v57;

      uint64_t v59 = objc_opt_class();
      double v60 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v59, objc_opt_class(), 0);
      uint64_t v61 = [v4 decodeObjectOfClasses:v60 forKey:@"promptLanguages"];
      promptLanguages = v11->_promptLanguages;
      v11->_promptLanguages = (NSArray *)v61;

      id v63 = objc_alloc((Class)NSMutableDictionary);
      uint64_t v64 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metaData"];
      id v65 = +[MODictionaryEncoder decodeToDictionary:v64];
      id v66 = (NSMutableDictionary *)[v63 initWithDictionary:v65];
      metaData = v11->_metaData;
      v11->_metaData = v66;

      id v68 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metaDataForRank"];
      uint64_t v69 = +[MODictionaryEncoder decodeToDictionary:v68];
      metaDataForRank = v11->_metaDataForRank;
      v11->_metaDataForRank = (NSDictionary *)v69;

      uint64_t v71 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"suggestionID"];
      suggestionID = v11->_suggestionID;
      v11->_suggestionID = (NSUUID *)v71;

      uint64_t v73 = objc_opt_class();
      long long v74 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v73, objc_opt_class(), 0);
      long long v75 = [v4 decodeObjectOfClasses:v74 forKey:@"suggestionEngagements"];
      uint64_t v76 = +[NSMutableSet setWithArray:v75];
      suggestionEngagementEvents = v11->_suggestionEngagementEvents;
      v11->_suggestionEngagementEvents = (NSMutableSet *)v76;

      uint64_t v78 = objc_opt_class();
      long long v79 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v78, objc_opt_class(), 0);
      uint64_t v80 = [v4 decodeObjectOfClasses:v79 forKey:@"places"];
      places = v11->_places;
      v11->_places = (NSArray *)v80;

      v11->_isAggregatedAndSuppressed = [v4 decodeBoolForKey:@"isAggregatedAndSuppressed"];
      v11->_summarizationGranularity = (unint64_t)[v4 decodeIntegerForKey:@"summarizationGranularity"];
      uint64_t v82 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"subBundleIDs"];
      subBundleIDs = v11->_subBundleIDs;
      v11->_subBundleIDs = (NSArray *)v82;

      uint64_t v84 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"subSuggestionIDs"];
      subSuggestionIDs = v11->_subSuggestionIDs;
      v11->_subSuggestionIDs = (NSArray *)v84;

      v11->_suggestionEngagementViewCount = (unint64_t)[v4 decodeIntegerForKey:@"suggestionViewCount"];
      uint64_t v86 = objc_opt_class();
      id v87 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v86, objc_opt_class(), 0);
      id v88 = [v4 decodeObjectOfClasses:v87 forKey:@"appEntryEngagements"];
      uint64_t v89 = +[NSMutableSet setWithArray:v88];
      appEntryEngagementEvents = v11->_appEntryEngagementEvents;
      v11->_appEntryEngagementEvents = (NSMutableSet *)v89;

      uint64_t v91 = objc_opt_class();
      v92 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v91, objc_opt_class(), 0);
      uint64_t v93 = [v4 decodeObjectOfClasses:v92 forKey:@"visitEventsRejectedByWatchLocation"];
      visitEventsRejectedByWatchLocation = v11->_visitEventsRejectedByWatchLocation;
      v11->_visitEventsRejectedByWatchLocation = (NSArray *)v93;

      v11->_bundleSubType = (unint64_t)[v4 decodeIntegerForKey:@"bundleSubType"];
      v11->_bundleSuperType = (unint64_t)[v4 decodeIntegerForKey:@"bundleSuperType"];
      uint64_t v95 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clusterMetadata"];
      clusterMetadata = v11->_clusterMetadata;
      v11->_clusterMetadata = (MOClusterMetadata *)v95;

      uint64_t v97 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"outlierMetadata"];
      outlierMetadata = v11->_outlierMetadata;
      v11->_outlierMetadata = (MOOutlierMetadata *)v97;

      uint64_t v99 = objc_opt_class();
      v100 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v99, objc_opt_class(), 0);
      uint64_t v101 = [v4 decodeObjectOfClasses:v100 forKey:@"photoTraits"];
      photoTraits = v11->_photoTraits;
      v11->_photoTraits = (NSArray *)v101;
    }
    self = v11;
    id v9 = self;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  bundleIdentifier = self->_bundleIdentifier;
  id v12 = a3;
  [v12 encodeObject:bundleIdentifier forKey:@"bundleIdentifier"];
  [v12 encodeObject:self->_creationDate forKey:@"creationDate"];
  [v12 encodeObject:self->_firstCreationDate forKey:@"firstCreationDate"];
  [v12 encodeObject:self->_startDate forKey:@"startDate"];
  [v12 encodeObject:self->_endDate forKey:@"endDate"];
  [v12 encodeObject:self->_expirationDate forKey:@"expirationDate"];
  [v12 encodeInteger:self->_source forKey:@"source"];
  [v12 encodeInteger:self->_interfaceType forKey:@"interfaceType"];
  [v12 encodeInteger:self->_photoSource forKey:@"photoSource"];
  [v12 encodeObject:self->_events forKey:@"events"];
  [v12 encodeBool:self->_filtered forKey:@"filtered"];
  [v12 encodeObject:self->_promptLanguage forKey:@"promptLanguage"];
  [v12 encodeObject:self->_action forKey:@"action"];
  [v12 encodeObject:self->_concurrentMediaAction forKey:@"concurrentMediaAction"];
  [v12 encodeObject:self->_actions forKey:@"actions"];
  [v12 encodeObject:self->_backgroundActions forKey:@"backgroundActions"];
  [v12 encodeObject:self->_persons forKey:@"persons"];
  [v12 encodeObject:self->_place forKey:@"place"];
  [v12 encodeObject:self->_predominantWeather forKey:@"weather"];
  [v12 encodeObject:self->_time forKey:@"time"];
  [v12 encodeObject:self->_resources forKey:@"resources"];
  id v5 = +[MODictionaryEncoder encodeDictionary:self->_rankingDictionary];
  [v12 encodeObject:v5 forKey:@"rankingDictionary"];

  [v12 encodeObject:self->_labels forKey:@"labels"];
  [v12 encodeObject:self->_promptLanguages forKey:@"promptLanguages"];
  uint64_t v6 = +[MODictionaryEncoder encodeDictionary:self->_metaData];
  [v12 encodeObject:v6 forKey:@"metaData"];

  id v7 = +[MODictionaryEncoder encodeDictionary:self->_metaDataForRank];
  [v12 encodeObject:v7 forKey:@"metaDataForRank"];

  [v12 encodeObject:self->_suggestionID forKey:@"suggestionID"];
  BOOL v8 = [(MOEventBundle *)self suggestionEngagementEvents];
  id v9 = [v8 allObjects];
  [v12 encodeObject:v9 forKey:@"suggestionEngagements"];

  [v12 encodeObject:self->_places forKey:@"places"];
  [v12 encodeBool:self->_isAggregatedAndSuppressed forKey:@"isAggregatedAndSuppressed"];
  [v12 encodeInteger:self->_summarizationGranularity forKey:@"summarizationGranularity"];
  [v12 encodeObject:self->_subBundleIDs forKey:@"subBundleIDs"];
  [v12 encodeObject:self->_subSuggestionIDs forKey:@"subSuggestionIDs"];
  [v12 encodeInteger:self->_suggestionEngagementViewCount forKey:@"suggestionViewCount"];
  [v12 encodeObject:self->_visitEventsRejectedByWatchLocation forKey:@"visitEventsRejectedByWatchLocation"];
  id v10 = [(MOEventBundle *)self appEntryEngagementEvents];
  int v11 = [v10 allObjects];
  [v12 encodeObject:v11 forKey:@"appEntryEngagements"];

  [v12 encodeInteger:self->_bundleSubType forKey:@"bundleSubType"];
  [v12 encodeInteger:self->_bundleSuperType forKey:@"bundleSuperType"];
  [v12 encodeObject:self->_clusterMetadata forKey:@"clusterMetadata"];
  [v12 encodeObject:self->_outlierMetadata forKey:@"outlierMetadata"];
  [v12 encodeObject:self->_photoTraits forKey:@"photoTraits"];
}

- (id)dateInterval
{
  id v3 = [(MOEventBundle *)self startDate];
  if (v3)
  {
  }
  else
  {
    id v4 = [(MOEventBundle *)self endDate];

    if (!v4)
    {
LABEL_11:
      id v15 = 0;
      goto LABEL_16;
    }
  }
  id v5 = [(MOEventBundle *)self endDate];

  uint64_t v6 = [(MOEventBundle *)self startDate];
  id v7 = v6;
  if (!v5)
  {
    [(MOEventBundle *)self setEndDate:v6];
LABEL_14:

    goto LABEL_15;
  }

  if (!v7)
  {
    id v7 = [(MOEventBundle *)self endDate];
    [(MOEventBundle *)self setStartDate:v7];
    goto LABEL_14;
  }
  BOOL v8 = [(MOEventBundle *)self startDate];
  id v9 = [(MOEventBundle *)self endDate];
  unsigned __int8 v10 = [v8 isOnOrBefore:v9];

  if ((v10 & 1) == 0)
  {
    int v11 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      [(MOEventBundle *)(uint64_t)self dateInterval];
    }
  }
  id v12 = [(MOEventBundle *)self startDate];
  uint64_t v13 = [(MOEventBundle *)self endDate];
  unsigned __int8 v14 = [v12 isBeforeDate:v13];

  if ((v14 & 1) == 0) {
    goto LABEL_11;
  }
LABEL_15:
  id v16 = objc_alloc((Class)NSDateInterval);
  id v17 = [(MOEventBundle *)self startDate];
  uint64_t v18 = [(MOEventBundle *)self endDate];
  id v15 = [v16 initWithStartDate:v17 endDate:v18];

LABEL_16:
  return v15;
}

- (unint64_t)hash
{
  uint64_t v2 = [(MOEventBundle *)self bundleIdentifier];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqualToEventBundle:(id)a3
{
  id v4 = (MOEventBundle *)a3;
  if (self == v4) {
    goto LABEL_3;
  }
  id v5 = [(MOEventBundle *)self bundleIdentifier];
  uint64_t v6 = [(MOEventBundle *)v4 bundleIdentifier];
  unsigned __int8 v7 = [v5 isEqual:v6];

  if (v7) {
    goto LABEL_3;
  }
  uint64_t v10 = [(MOEventBundle *)self suggestionID];
  if (v10)
  {
    int v11 = (void *)v10;
    uint64_t v12 = [(MOEventBundle *)v4 suggestionID];
    if (v12)
    {
      uint64_t v13 = (void *)v12;
      unsigned __int8 v14 = [(MOEventBundle *)self suggestionID];
      id v15 = [(MOEventBundle *)v4 suggestionID];
      unsigned __int8 v16 = [v14 isEqual:v15];

      if (v16)
      {
LABEL_3:
        LOBYTE(v8) = 1;
        goto LABEL_4;
      }
    }
    else
    {
    }
  }
  id v17 = [(MOEventBundle *)self interfaceType];
  if (v17 != (void *)[(MOEventBundle *)v4 interfaceType])
  {
LABEL_84:
    LOBYTE(v8) = 0;
    goto LABEL_4;
  }
  LOBYTE(v8) = 0;
  switch([(MOEventBundle *)v4 interfaceType])
  {
    case 0uLL:
      if (![(MOEventBundle *)self isEqualPropertyForObject:self other:v4 propertyPath:@"startDate" threshold:60.0])goto LABEL_84; {
      CFStringRef v18 = @"endDate";
      }
      double v22 = 60.0;
      goto LABEL_32;
    case 1uLL:
    case 2uLL:
      if (![(MOEventBundle *)self isEqualPropertyForObject:self other:v4 propertyPath:@"startDate" threshold:600.0])goto LABEL_84; {
      CFStringRef v18 = @"endDate";
      }
      id v19 = self;
      uint64_t v20 = self;
      id v21 = v4;
      double v22 = 600.0;
      goto LABEL_33;
    case 4uLL:
      if (![(MOEventBundle *)self isEqualBasicPropertiesForObject:self other:v4])goto LABEL_84; {
      double v23 = [(MOEventBundle *)self startDate];
      }
      uint64_t v24 = [(MOEventBundle *)v4 startDate];
      unsigned int v8 = [v23 isSameDayWithDate:v24];

      if (!v8) {
        goto LABEL_4;
      }
      unsigned __int8 v25 = [(MOEventBundle *)self isEqualPersonsForObject:self other:v4];
      goto LABEL_34;
    case 5uLL:
      if (![(MOEventBundle *)self isEqualBasicPropertiesForObject:self other:v4])goto LABEL_84; {
      uint64_t v26 = [(MOEventBundle *)self startDate];
      }
      id v27 = [(MOEventBundle *)v4 startDate];
      unsigned int v8 = [v26 isSameDayWithDate:v27];

      if (!v8) {
        goto LABEL_4;
      }
      long long v108 = 0u;
      long long v109 = 0u;
      long long v106 = 0u;
      long long v107 = 0u;
      uint64_t v28 = [(MOEventBundle *)self resources];
      id v29 = [v28 countByEnumeratingWithState:&v106 objects:v113 count:16];
      if (v29)
      {
        id v30 = v29;
        uint64_t v31 = 0;
        uint64_t v32 = *(void *)v107;
        do
        {
          for (i = 0; i != v30; i = (char *)i + 1)
          {
            if (*(void *)v107 != v32) {
              objc_enumerationMutation(v28);
            }
            uint64_t v34 = *(void **)(*((void *)&v106 + 1) + 8 * i);
            if ([v34 type] == (id)3)
            {
              uint64_t v36 = [v34 getDictionary];

              uint64_t v31 = (void *)v36;
            }
          }
          id v30 = [v28 countByEnumeratingWithState:&v106 objects:v113 count:16];
        }
        while (v30);
      }
      else
      {
        uint64_t v31 = 0;
      }

      long long v104 = 0u;
      long long v105 = 0u;
      long long v102 = 0u;
      long long v103 = 0u;
      id v83 = [(MOEventBundle *)v4 resources];
      id v84 = [v83 countByEnumeratingWithState:&v102 objects:v112 count:16];
      if (!v84)
      {
        uint64_t v86 = 0;
LABEL_106:

        goto LABEL_107;
      }
      id v85 = v84;
      uint64_t v86 = 0;
      uint64_t v87 = *(void *)v103;
      do
      {
        for (j = 0; j != v85; j = (char *)j + 1)
        {
          if (*(void *)v103 != v87) {
            objc_enumerationMutation(v83);
          }
          uint64_t v89 = *(void **)(*((void *)&v102 + 1) + 8 * (void)j);
          if ([v89 type] == (id)3)
          {
            uint64_t v91 = [v89 getDictionary];

            uint64_t v86 = (void *)v91;
          }
        }
        id v85 = [v83 countByEnumeratingWithState:&v102 objects:v112 count:16];
      }
      while (v85);

      if (v31 && v86)
      {
        id v83 = [v31 objectForKey:@"MOMediaPlayMetaDataKeyPlayerBundleID"];
        uint64_t v92 = [v86 objectForKey:@"MOMediaPlayMetaDataKeyPlayerBundleID"];
        uint64_t v93 = (void *)v92;
        if (v83 && v92) {
          [v83 isEqualToString:v92];
        }

        goto LABEL_106;
      }
LABEL_107:

      goto LABEL_3;
    case 6uLL:
      CFStringRef v18 = @"dateInterval";
      double v22 = 0.8;
LABEL_32:
      id v19 = self;
      uint64_t v20 = self;
      id v21 = v4;
LABEL_33:
      unsigned __int8 v25 = [(MOEventBundle *)v19 isEqualPropertyForObject:v20 other:v21 propertyPath:v18 threshold:v22];
      goto LABEL_34;
    case 7uLL:
      id v37 = [(MOEventBundle *)self bundleSubType];
      if (v37 != (void *)[(MOEventBundle *)v4 bundleSubType]) {
        goto LABEL_84;
      }
      goto LABEL_83;
    case 8uLL:
      if (![(MOEventBundle *)self isEqualPropertyForObject:self other:v4 propertyPath:@"dateInterval" threshold:0.8])goto LABEL_84; {
      unsigned __int8 v25 = [(MOEventBundle *)self isEqualResourcesForObject:self other:v4 resourceType:8];
      }
      goto LABEL_34;
    case 0xAuLL:
      long long v100 = 0u;
      long long v101 = 0u;
      long long v98 = 0u;
      long long v99 = 0u;
      uint64_t v38 = [(MOEventBundle *)self resources];
      id v39 = [v38 countByEnumeratingWithState:&v98 objects:v111 count:16];
      if (v39)
      {
        id v40 = v39;
        id v41 = 0;
        uint64_t v42 = *(void *)v99;
        do
        {
          for (k = 0; k != v40; k = (char *)k + 1)
          {
            if (*(void *)v99 != v42) {
              objc_enumerationMutation(v38);
            }
            uint64_t v44 = *(void **)(*((void *)&v98 + 1) + 8 * (void)k);
            if ([v44 type] == (id)15)
            {
              uint64_t v46 = [v44 getDictionary];

              id v41 = (void *)v46;
            }
          }
          id v40 = [v38 countByEnumeratingWithState:&v98 objects:v111 count:16];
        }
        while (v40);
      }
      else
      {
        id v41 = 0;
      }

      long long v96 = 0u;
      long long v97 = 0u;
      long long v94 = 0u;
      long long v95 = 0u;
      uint64_t v55 = [(MOEventBundle *)v4 resources];
      id v56 = [v55 countByEnumeratingWithState:&v94 objects:v110 count:16];
      if (!v56)
      {

        long long v58 = 0;
LABEL_76:
        LOBYTE(v8) = [(MOEventBundle *)self isEqualBaseActionForObject:self other:v4];

        goto LABEL_4;
      }
      id v57 = v56;
      long long v58 = 0;
      uint64_t v59 = *(void *)v95;
      do
      {
        for (m = 0; m != v57; m = (char *)m + 1)
        {
          if (*(void *)v95 != v59) {
            objc_enumerationMutation(v55);
          }
          uint64_t v61 = *(void **)(*((void *)&v94 + 1) + 8 * (void)m);
          if ([v61 type] == (id)15)
          {
            uint64_t v63 = [v61 getDictionary];

            long long v58 = (void *)v63;
          }
        }
        id v57 = [v55 countByEnumeratingWithState:&v94 objects:v110 count:16];
      }
      while (v57);

      if (!v41 || !v58) {
        goto LABEL_76;
      }
      uint64_t v64 = [v41 objectForKey:@"MOPHMemoryMetaDataKeyMemoryIdentifier"];
      uint64_t v65 = [v58 objectForKey:@"MOPHMemoryMetaDataKeyMemoryIdentifier"];
      id v66 = (void *)v65;
      if (v64 && v65 && ([v64 isEqualToString:v65] & 1) != 0)
      {

        goto LABEL_3;
      }

LABEL_88:
      id v82 = objc_msgSend((id)objc_opt_class(), "castEvergreenSubType:", -[MOEventBundle bundleSubType](v4, "bundleSubType"));
      LOBYTE(v8) = v82 == objc_msgSend((id)objc_opt_class(), "castEvergreenSubType:", -[MOEventBundle bundleSubType](self, "bundleSubType"));
LABEL_4:

      return v8;
    case 0xBuLL:
      goto LABEL_88;
    case 0xCuLL:
      id v47 = [(MOEventBundle *)self summarizationGranularity];
      if (v47 != (void *)[(MOEventBundle *)v4 summarizationGranularity]) {
        goto LABEL_84;
      }
      if ([(MOEventBundle *)self isEqualPropertyForObject:self other:v4 propertyPath:@"startDate" threshold:600.0])
      {
        goto LABEL_3;
      }
      uint64_t v48 = [(MOEventBundle *)self subBundleIDs];
      id v49 = [v48 count];

      if (v49)
      {
        if ([(MOEventBundle *)self intersectedSubBundleIDForObject:self other:v4])
        {
          goto LABEL_3;
        }
      }
      unsigned __int8 v25 = [(MOEventBundle *)self intersectedActivityOrVisitForObject:self other:v4];
LABEL_34:
      LOBYTE(v8) = v25;
      goto LABEL_4;
    case 0xDuLL:
      uint64_t v50 = [(MOEventBundle *)self place];
      if (!v50) {
        goto LABEL_84;
      }
      long long v51 = (void *)v50;
      long long v52 = [(MOEventBundle *)v4 place];

      if (!v52) {
        goto LABEL_84;
      }
      uint64_t v53 = [(MOEventBundle *)self place];
      id v54 = [v53 placeType];
      if ((unint64_t)v54 > 0x64
        || ([(MOEventBundle *)v4 place],
            long long v52 = objc_claimAutoreleasedReturnValue(),
            (unint64_t)[v52 placeType] > 0x64))
      {
        double v67 = [(MOEventBundle *)self place];
        id v68 = [v67 placeType];
        uint64_t v69 = [(MOEventBundle *)v4 place];
        id v70 = [v69 placeType];

        if ((unint64_t)v54 <= 0x64) {
        if (v68 != v70)
        }
          goto LABEL_84;
      }
      else
      {
      }
      id v71 = objc_alloc((Class)NSDateInterval);
      long long v72 = [(MOEventBundle *)self startDate];
      uint64_t v73 = [(MOEventBundle *)self endDate];
      id v74 = [v71 initWithStartDate:v72 endDate:v73];

      id v75 = objc_alloc((Class)NSDateInterval);
      uint64_t v76 = [(MOEventBundle *)v4 startDate];
      long long v77 = [(MOEventBundle *)v4 endDate];
      id v78 = [v75 initWithStartDate:v76 endDate:v77];

      LOBYTE(v76) = [v74 intersectsDateInterval:v78];
      if (v76) {
        goto LABEL_3;
      }
LABEL_81:
      if ((id)[(MOEventBundle *)self bundleSubType] == (id)801
        && (id)[(MOEventBundle *)v4 bundleSubType] == (id)801)
      {
LABEL_83:
        long long v79 = [(MOEventBundle *)self startDate];
        uint64_t v80 = [(MOEventBundle *)v4 startDate];
        LOBYTE(v8) = [v79 isSameDayWithDate:v80];
      }
      else
      {
        long long v79 = [(MOEventBundle *)self startDate];
        long long v81 = [(MOEventBundle *)v4 startDate];
        LOBYTE(v8) = v79 == v81;
      }
      goto LABEL_4;
    case 0xEuLL:
      goto LABEL_81;
    default:
      goto LABEL_4;
  }
}

+ (unint64_t)castEvergreenSubType:(unint64_t)a3
{
  unint64_t result = a3;
  if (a3 - 707 <= 2) {
    return qword_10009B370[a3 - 707];
  }
  return result;
}

- (BOOL)intersectedSubBundleIDForObject:(id)a3 other:(id)a4
{
  id v5 = a4;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v6 = [a3 subBundleIDs];
  id v7 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        uint64_t v12 = objc_msgSend(v5, "subBundleIDs", 0);
        id v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v20;
          while (2)
          {
            for (j = 0; j != v14; j = (char *)j + 1)
            {
              if (*(void *)v20 != v15) {
                objc_enumerationMutation(v12);
              }
              if ([v11 isEqualToString:*(void *)(*((void *)&v19 + 1) + 8 * (void)j)])
              {

                BOOL v17 = 1;
                goto LABEL_19;
              }
            }
            id v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
            if (v14) {
              continue;
            }
            break;
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
      BOOL v17 = 0;
    }
    while (v8);
  }
  else
  {
    BOOL v17 = 0;
  }
LABEL_19:

  return v17;
}

- (BOOL)intersectedActivityOrVisitForObject:(id)a3 other:(id)a4
{
  id v6 = a4;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v7 = [a3 events];
  id v8 = [v7 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v32;
    long long v25 = v7;
    id v26 = v6;
    uint64_t v23 = *(void *)v32;
    do
    {
      int v11 = 0;
      id v24 = v9;
      do
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v31 + 1) + 8 * (void)v11);
        if (objc_msgSend(v12, "category", v23) == (id)1 || objc_msgSend(v12, "category") == (id)2)
        {
          long long v29 = 0u;
          long long v30 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          id v13 = [v6 events];
          id v14 = [v13 countByEnumeratingWithState:&v27 objects:v35 count:16];
          if (v14)
          {
            id v15 = v14;
            uint64_t v16 = *(void *)v28;
            while (2)
            {
              for (i = 0; i != v15; i = (char *)i + 1)
              {
                if (*(void *)v28 != v16) {
                  objc_enumerationMutation(v13);
                }
                CFStringRef v18 = *(void **)(*((void *)&v27 + 1) + 8 * i);
                if ([v18 category] == (id)1 || objc_msgSend(v18, "category") == (id)2)
                {
                  if ((id v19 = [v12 category], v19 == objc_msgSend(v18, "category"))
                    && [v12 category] == (id)1
                    && -[MOEventBundle isEqualPropertyForObject:other:propertyPath:threshold:](self, "isEqualPropertyForObject:other:propertyPath:threshold:", v12, v18, @"startDate", 600.0)|| (id v20 = [v12 category], v20 == objc_msgSend(v18, "category"))&& objc_msgSend(v12, "category") == (id)2&& -[MOEventBundle isEqualPropertyForObject:other:propertyPath:threshold:](self, "isEqualPropertyForObject:other:propertyPath:threshold:", v12, v18, @"startDate", 600.0))
                  {

                    BOOL v21 = 1;
                    id v7 = v25;
                    id v6 = v26;
                    goto LABEL_29;
                  }
                }
              }
              id v15 = [v13 countByEnumeratingWithState:&v27 objects:v35 count:16];
              if (v15) {
                continue;
              }
              break;
            }
          }

          id v7 = v25;
          id v6 = v26;
          uint64_t v10 = v23;
          id v9 = v24;
        }
        int v11 = (char *)v11 + 1;
      }
      while (v11 != v9);
      id v9 = [v7 countByEnumeratingWithState:&v31 objects:v36 count:16];
      BOOL v21 = 0;
    }
    while (v9);
  }
  else
  {
    BOOL v21 = 0;
  }
LABEL_29:

  return v21;
}

- (BOOL)isEqualBasicPropertiesForObject:(id)a3 other:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 bundleSuperType];
  if (v7 == [v6 bundleSuperType]
    && (id v8 = [v5 bundleSubType], v8 == objc_msgSend(v6, "bundleSubType"))
    && (id v9 = [v5 interfaceType], v9 == objc_msgSend(v6, "interfaceType")))
  {
    id v10 = [v5 summarizationGranularity];
    BOOL v11 = v10 == [v6 summarizationGranularity];
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)isEqualPropertyForObject:(id)a3 other:(id)a4 propertyPath:(id)a5 threshold:(double)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [v9 valueForKeyPath:v11];
  uint64_t v13 = [v10 valueForKeyPath:v11];

  if (!(v12 | v13))
  {
    BOOL v14 = 1;
    goto LABEL_22;
  }
  BOOL v14 = 0;
  if (v12 && v13)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(id)v12 timeIntervalSinceDate:v13];
      double v16 = fabs(v15);
LABEL_7:
      BOOL v14 = v16 < a6;
      goto LABEL_22;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unsigned __int8 v25 = [(id)v12 isEqualToString:v13];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v26 = (id)v13;
          [(id)v12 doubleValue];
          double v28 = v27;
          [v26 doubleValue];
          double v30 = v29;

          double v16 = v28 - v30;
          if (v28 - v30 < 0.0) {
            double v16 = -(v28 - v30);
          }
          goto LABEL_7;
        }
        unsigned __int8 v25 = [v9 isEqual:v10];
      }
      BOOL v14 = v25;
      goto LABEL_22;
    }
    id v17 = (id)v12;
    id v18 = (id)v13;
    if (![v17 intersectsDateInterval:v18]) {
      goto LABEL_14;
    }
    id v19 = [v17 intersectionWithDateInterval:v18];
    [v19 duration];
    double v21 = v20;

    long long v22 = [v17 unionWithDateInterval:v18];
    [v22 duration];
    double v24 = v23;

    if (v24 == 0.0) {
LABEL_14:
    }
      BOOL v14 = 0;
    else {
      BOOL v14 = v21 / v24 > a6;
    }
  }
LABEL_22:

  return v14;
}

- (BOOL)isEqualResourcesForObject:(id)a3 other:(id)a4 resourceType:(unint64_t)a5
{
  id v7 = a3;
  id v33 = a4;
  id v35 = objc_opt_new();
  long long v34 = objc_opt_new();
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v32 = v7;
  id v8 = [v7 resources];
  id v9 = [v8 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v41;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v41 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        if ([v13 type] == (id)a5)
        {
          id v14 = objc_alloc((Class)NSString);
          double v15 = [v13 name];
          double v16 = [v13 assets];
          [v13 value];
          id v18 = [v14 initWithFormat:@"%@,%@,%f", v15, v16, v17];

          if (v18) {
            [v35 addObject:v18];
          }
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v10);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v19 = [v33 resources];
  id v20 = [v19 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v37;
    do
    {
      for (j = 0; j != v21; j = (char *)j + 1)
      {
        if (*(void *)v37 != v22) {
          objc_enumerationMutation(v19);
        }
        double v24 = *(void **)(*((void *)&v36 + 1) + 8 * (void)j);
        if ([v24 type] == (id)a5)
        {
          id v25 = objc_alloc((Class)NSString);
          id v26 = [v24 name];
          double v27 = [v24 assets];
          [v24 value];
          id v29 = [v25 initWithFormat:@"%@,%@,%f", v26, v27, v28];

          if (v29) {
            [v34 addObject:v29];
          }
        }
      }
      id v21 = [v19 countByEnumeratingWithState:&v36 objects:v44 count:16];
    }
    while (v21);
  }

  unsigned __int8 v30 = [v35 isEqualToSet:v34];
  return v30;
}

- (BOOL)isEqualPersonsForObject:(id)a3 other:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  id v8 = objc_opt_new();
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v9 = [v5 persons];
  id v10 = [v9 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v32;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v32 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        double v15 = [v14 contactIdentifier];

        if (v15)
        {
          double v16 = [v14 contactIdentifier];
          [v7 addObject:v16];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v11);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v17 = objc_msgSend(v6, "persons", 0);
  id v18 = [v17 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v28;
    do
    {
      for (j = 0; j != v19; j = (char *)j + 1)
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void **)(*((void *)&v27 + 1) + 8 * (void)j);
        double v23 = [v22 contactIdentifier];

        if (v23)
        {
          double v24 = [v22 contactIdentifier];
          [v8 addObject:v24];
        }
      }
      id v19 = [v17 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v19);
  }

  unsigned __int8 v25 = [v7 isEqualToSet:v8];
  return v25;
}

- (BOOL)isEqualBaseActionForObject:(id)a3 other:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [a3 action];
  uint64_t v7 = [v5 action];

  if (v6 | v7)
  {
    unsigned __int8 v8 = 0;
    if (v7) {
      BOOL v9 = 0;
    }
    else {
      BOOL v9 = v6 != 0;
    }
    if (v7) {
      BOOL v10 = v6 == 0;
    }
    else {
      BOOL v10 = 0;
    }
    if (!v10 && !v9)
    {
      id v11 = [(id)v6 actionType];
      if (v11 == [(id)v7 actionType])
      {
        uint64_t v12 = [(id)v6 actionName];
        uint64_t v13 = [(id)v7 actionName];
        unsigned __int8 v8 = [v12 isEqualToString:v13];
      }
      else
      {
        unsigned __int8 v8 = 0;
      }
    }
  }
  else
  {
    unsigned __int8 v8 = 1;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (MOEventBundle *)a3;
  uint64_t v6 = v5;
  if (self == v5)
  {
    unsigned __int8 v11 = 1;
  }
  else
  {
    if (v5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v7 = v6;
        unsigned __int8 v8 = [(MOEventBundle *)self bundleIdentifier];
        if (v8
          || ([(MOEventBundle *)v7 bundleIdentifier],
              (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          BOOL v9 = [(MOEventBundle *)self bundleIdentifier];
          BOOL v10 = [(MOEventBundle *)v7 bundleIdentifier];
          unsigned __int8 v11 = [v9 isEqual:v10];

          if (v8)
          {
LABEL_12:

            goto LABEL_13;
          }
        }
        else
        {
          unsigned __int8 v11 = 1;
        }

        goto LABEL_12;
      }
    }
    unsigned __int8 v11 = 0;
  }
LABEL_13:

  return v11;
}

- (BOOL)containTheSameEventSet:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    uint64_t v6 = [(MOEventBundle *)self events];
    id v7 = [v6 mutableCopy];

    unsigned __int8 v8 = [v5 events];

    id v9 = [v8 mutableCopy];
    id v10 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startDate" ascending:1];
    id v18 = v10;
    unsigned __int8 v11 = +[NSArray arrayWithObjects:&v18 count:1];
    uint64_t v12 = [v7 sortedArrayUsingDescriptors:v11];

    id v17 = v10;
    uint64_t v13 = +[NSArray arrayWithObjects:&v17 count:1];
    id v14 = [v9 sortedArrayUsingDescriptors:v13];

    unsigned __int8 v15 = [v12 isEqualToArray:v14];
  }
  else
  {
    unsigned __int8 v15 = 0;
  }

  return v15;
}

- (BOOL)shareEvents:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v31 = v4;
    id v5 = v4;
    uint64_t v6 = objc_opt_new();
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v30 = v5;
    id v7 = [v5 events];
    id v8 = [v7 countByEnumeratingWithState:&v43 objects:v49 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v44;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v44 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          uint64_t v13 = [v12 eventIdentifier];

          if (v13)
          {
            id v14 = [v12 eventIdentifier];
            [v6 addObject:v14];
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v43 objects:v49 count:16];
      }
      while (v9);
    }

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id obj = [(MOEventBundle *)self events];
    id v15 = [obj countByEnumeratingWithState:&v39 objects:v48 count:16];
    if (v15)
    {
      id v16 = v15;
      char v33 = 0;
      uint64_t v34 = *(void *)v40;
      do
      {
        for (j = 0; j != v16; j = (char *)j + 1)
        {
          if (*(void *)v40 != v34) {
            objc_enumerationMutation(obj);
          }
          id v18 = *(void **)(*((void *)&v39 + 1) + 8 * (void)j);
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          id v19 = v6;
          id v20 = [v19 countByEnumeratingWithState:&v35 objects:v47 count:16];
          if (v20)
          {
            id v21 = v20;
            uint64_t v22 = v6;
            uint64_t v23 = *(void *)v36;
            while (2)
            {
              for (k = 0; k != v21; k = (char *)k + 1)
              {
                if (*(void *)v36 != v23) {
                  objc_enumerationMutation(v19);
                }
                unsigned __int8 v25 = *(void **)(*((void *)&v35 + 1) + 8 * (void)k);
                id v26 = [v18 eventIdentifier];
                id v27 = [v25 compare:v26];

                if (!v27)
                {
                  char v33 = 1;
                  goto LABEL_27;
                }
              }
              id v21 = [v19 countByEnumeratingWithState:&v35 objects:v47 count:16];
              if (v21) {
                continue;
              }
              break;
            }
LABEL_27:
            uint64_t v6 = v22;
          }
        }
        id v16 = [obj countByEnumeratingWithState:&v39 objects:v48 count:16];
      }
      while (v16);
    }
    else
    {
      char v33 = 0;
    }

    id v4 = v31;
    char v28 = v33;
  }
  else
  {
    char v28 = 0;
  }

  return v28 & 1;
}

- (id)getCustomLabelsForMetaData:(id)a3 templateFilePath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if (v6) {
    id v8 = [objc_alloc((Class)MOEventBundleLabelFormatter) initWithTemplatePath:v6];
  }
  else {
    id v8 = (id)objc_opt_new();
  }
  id v9 = v8;
  uint64_t v10 = [(MOEventBundle *)self getCustomLabelsForMetaData:v7 labelFormatter:v8];

  return v10;
}

- (id)getCustomLabelsForMetaData:(id)a3 labelFormatter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [(MOEventBundle *)self getBundleType];
    id v9 = [v7 formattedBundleLabelsForMetaData:v6 bundleType:v8];
  }
  else
  {
    id v8 = [(MOEventBundle *)self metaData];
    uint64_t v10 = [(MOEventBundle *)self getBundleType];
    id v9 = [v7 formattedBundleLabelsForMetaData:v8 bundleType:v10];

    id v7 = (id)v10;
  }

  return v9;
}

- (id)getCustomPromptsForMetaData:(id)a3 templateFilePath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if (v6) {
    id v8 = [objc_alloc((Class)MOEventBundleLabelFormatter) initWithTemplatePath:v6];
  }
  else {
    id v8 = (id)objc_opt_new();
  }
  id v9 = v8;
  uint64_t v10 = [(MOEventBundle *)self getCustomPromptsForMetaData:v7 labelFormatter:v8];

  return v10;
}

- (id)getCustomPromptsForMetaData:(id)a3 labelFormatter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [(MOEventBundle *)self getBundleType];
    id v9 = [v7 formattedBundlePromptsForMetaData:v6 bundleType:v8];
  }
  else
  {
    id v8 = [(MOEventBundle *)self metaData];
    uint64_t v10 = [(MOEventBundle *)self getBundleType];
    id v9 = [v7 formattedBundlePromptsForMetaData:v8 bundleType:v10];

    id v7 = (id)v10;
  }

  return v9;
}

- (BOOL)hasSuggestionEngagementEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(MOEventBundle *)self suggestionEngagementEvents];
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

- (void)setSuggestionEngagementEvent:(id)a3
{
  id v8 = a3;
  id v4 = [(MOEventBundle *)self suggestionEngagementEvents];

  if (!v4)
  {
    id v5 = objc_opt_new();
    [(MOEventBundle *)self setSuggestionEngagementEvents:v5];
  }
  unsigned __int8 v6 = v8;
  if (v8)
  {
    id v7 = [(MOEventBundle *)self suggestionEngagementEvents];
    [v7 addObject:v8];

    unsigned __int8 v6 = v8;
  }
}

- (void)clearSuggestionEngagementEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(MOEventBundle *)self suggestionEngagementEvents];
  [v5 removeObject:v4];
}

- (BOOL)hasAppEntryEngagementEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(MOEventBundle *)self appEntryEngagementEvents];
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

- (void)setAppEntryEngagementEvent:(id)a3
{
  id v8 = a3;
  id v4 = [(MOEventBundle *)self appEntryEngagementEvents];

  if (!v4)
  {
    id v5 = objc_opt_new();
    [(MOEventBundle *)self setAppEntryEngagementEvents:v5];
  }
  unsigned __int8 v6 = v8;
  if (v8)
  {
    id v7 = [(MOEventBundle *)self appEntryEngagementEvents];
    [v7 addObject:v8];

    unsigned __int8 v6 = v8;
  }
}

- (void)clearAppEntryEngagementEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(MOEventBundle *)self appEntryEngagementEvents];
  [v5 removeObject:v4];
}

- (double)duration
{
  id v3 = [(MOEventBundle *)self endDate];
  id v4 = [(MOEventBundle *)self startDate];
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5;

  return v6;
}

- (NSUUID)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSUUID)suggestionID
{
  return self->_suggestionID;
}

- (void)setSuggestionID:(id)a3
{
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (BOOL)filtered
{
  return self->_filtered;
}

- (void)setFiltered:(BOOL)a3
{
  self->_filtered = a3;
}

- (NSString)bundleType
{
  return self->_bundleType;
}

- (void)setBundleType:(id)a3
{
}

- (unint64_t)interfaceType
{
  return self->_interfaceType;
}

- (void)setInterfaceType:(unint64_t)a3
{
  self->_interfaceType = a3;
}

- (NSMutableDictionary)metaData
{
  return self->_metaData;
}

- (void)setMetaData:(id)a3
{
}

- (NSArray)labels
{
  return self->_labels;
}

- (void)setLabels:(id)a3
{
}

- (NSArray)promptLanguages
{
  return self->_promptLanguages;
}

- (void)setPromptLanguages:(id)a3
{
}

- (NSString)promptLanguage
{
  return self->_promptLanguage;
}

- (void)setPromptLanguage:(id)a3
{
}

- (NSDictionary)metaDataForRank
{
  return self->_metaDataForRank;
}

- (void)setMetaDataForRank:(id)a3
{
}

- (unint64_t)photoSource
{
  return self->_photoSource;
}

- (void)setPhotoSource:(unint64_t)a3
{
  self->_photoSource = a3;
}

- (NSArray)events
{
  return self->_events;
}

- (void)setEvents:(id)a3
{
}

- (MOAction)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
}

- (MOAction)concurrentMediaAction
{
  return self->_concurrentMediaAction;
}

- (void)setConcurrentMediaAction:(id)a3
{
}

- (NSArray)backgroundActions
{
  return self->_backgroundActions;
}

- (void)setBackgroundActions:(id)a3
{
}

- (NSArray)persons
{
  return self->_persons;
}

- (void)setPersons:(id)a3
{
}

- (MOPlace)place
{
  return self->_place;
}

- (void)setPlace:(id)a3
{
}

- (MOWeather)predominantWeather
{
  return self->_predominantWeather;
}

- (void)setPredominantWeather:(id)a3
{
}

- (NSArray)places
{
  return self->_places;
}

- (void)setPlaces:(id)a3
{
}

- (MOTime)time
{
  return self->_time;
}

- (void)setTime:(id)a3
{
}

- (NSArray)resources
{
  return self->_resources;
}

- (void)setResources:(id)a3
{
}

- (NSArray)photoTraits
{
  return self->_photoTraits;
}

- (void)setPhotoTraits:(id)a3
{
}

- (NSDictionary)rankingDictionary
{
  return self->_rankingDictionary;
}

- (void)setRankingDictionary:(id)a3
{
}

- (NSMutableSet)suggestionEngagementEvents
{
  return self->_suggestionEngagementEvents;
}

- (void)setSuggestionEngagementEvents:(id)a3
{
}

- (unint64_t)suggestionEngagementViewCount
{
  return self->_suggestionEngagementViewCount;
}

- (void)setSuggestionEngagementViewCount:(unint64_t)a3
{
  self->_suggestionEngagementViewCount = a3;
}

- (NSMutableSet)appEntryEngagementEvents
{
  return self->_appEntryEngagementEvents;
}

- (void)setAppEntryEngagementEvents:(id)a3
{
}

- (BOOL)isAggregatedAndSuppressed
{
  return self->_isAggregatedAndSuppressed;
}

- (void)setIsAggregatedAndSuppressed:(BOOL)a3
{
  self->_isAggregatedAndSuppressed = a3;
}

- (unint64_t)summarizationGranularity
{
  return self->_summarizationGranularity;
}

- (void)setSummarizationGranularity:(unint64_t)a3
{
  self->_summarizationGranularity = a3;
}

- (NSArray)subBundleIDs
{
  return self->_subBundleIDs;
}

- (void)setSubBundleIDs:(id)a3
{
}

- (NSArray)subSuggestionIDs
{
  return self->_subSuggestionIDs;
}

- (void)setSubSuggestionIDs:(id)a3
{
}

- (unint64_t)timeAtHomeSubType
{
  return self->_timeAtHomeSubType;
}

- (void)setTimeAtHomeSubType:(unint64_t)a3
{
  self->_timeAtHomeSubType = a3;
}

- (BOOL)includedInSummaryBundleOnly
{
  return self->_includedInSummaryBundleOnly;
}

- (void)setIncludedInSummaryBundleOnly:(BOOL)a3
{
  self->_includedInSummaryBundleOnly = a3;
}

- (NSArray)visitEventsRejectedByWatchLocation
{
  return self->_visitEventsRejectedByWatchLocation;
}

- (void)setVisitEventsRejectedByWatchLocation:(id)a3
{
}

- (unint64_t)bundleSubType
{
  return self->_bundleSubType;
}

- (void)setBundleSubType:(unint64_t)a3
{
  self->_bundleSubType = a3;
}

- (unint64_t)bundleSuperType
{
  return self->_bundleSuperType;
}

- (void)setBundleSuperType:(unint64_t)a3
{
  self->_bundleSuperType = a3;
}

- (NSDate)firstCreationDate
{
  return self->_firstCreationDate;
}

- (void)setFirstCreationDate:(id)a3
{
}

- (MOClusterMetadata)clusterMetadata
{
  return self->_clusterMetadata;
}

- (void)setClusterMetadata:(id)a3
{
}

- (MOOutlierMetadata)outlierMetadata
{
  return self->_outlierMetadata;
}

- (void)setOutlierMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outlierMetadata, 0);
  objc_storeStrong((id *)&self->_clusterMetadata, 0);
  objc_storeStrong((id *)&self->_firstCreationDate, 0);
  objc_storeStrong((id *)&self->_visitEventsRejectedByWatchLocation, 0);
  objc_storeStrong((id *)&self->_subSuggestionIDs, 0);
  objc_storeStrong((id *)&self->_subBundleIDs, 0);
  objc_storeStrong((id *)&self->_appEntryEngagementEvents, 0);
  objc_storeStrong((id *)&self->_suggestionEngagementEvents, 0);
  objc_storeStrong((id *)&self->_rankingDictionary, 0);
  objc_storeStrong((id *)&self->_photoTraits, 0);
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_places, 0);
  objc_storeStrong((id *)&self->_predominantWeather, 0);
  objc_storeStrong((id *)&self->_place, 0);
  objc_storeStrong((id *)&self->_persons, 0);
  objc_storeStrong((id *)&self->_backgroundActions, 0);
  objc_storeStrong((id *)&self->_concurrentMediaAction, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_metaDataForRank, 0);
  objc_storeStrong((id *)&self->_promptLanguage, 0);
  objc_storeStrong((id *)&self->_promptLanguages, 0);
  objc_storeStrong((id *)&self->_labels, 0);
  objc_storeStrong((id *)&self->_metaData, 0);
  objc_storeStrong((id *)&self->_bundleType, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_suggestionID, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (void)initWithBundleIdentifier:suggestionID:startDate:endDate:creationDate:.cold.1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_1_4((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: bundleIdentifier", v2, v3, v4, v5, v6);
}

- (void)initWithBundleIdentifier:suggestionID:startDate:endDate:creationDate:.cold.2()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_1_4((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: suggestionID", v2, v3, v4, v5, v6);
}

- (void)dateInterval
{
  int v2 = 138412802;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  uint64_t v5 = "-[MOEventBundle dateInterval]";
  __int16 v6 = 1024;
  int v7 = 1471;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "startDate is NOT earlier than endDate, bundle, %@ (in %s:%d)", (uint8_t *)&v2, 0x1Cu);
}

@end