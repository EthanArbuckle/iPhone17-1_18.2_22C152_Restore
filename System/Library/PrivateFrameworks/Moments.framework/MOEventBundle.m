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
- (id)primarySourceTypes;
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
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v36 = a6;
  id v17 = a7;
  if (!v14)
  {
    v21 = v17;
    v22 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[MOEventBundle initWithBundleIdentifier:suggestionID:startDate:endDate:creationDate:]();
    }

    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    v24 = v23;
    v25 = @"Invalid parameter not satisfying: bundleIdentifier";
    SEL v26 = a2;
    v27 = self;
    uint64_t v28 = 197;
    goto LABEL_21;
  }
  if (!v15)
  {
    v21 = v17;
    v29 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      -[MOEventBundle initWithBundleIdentifier:suggestionID:startDate:endDate:creationDate:]();
    }

    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    v24 = v23;
    v25 = @"Invalid parameter not satisfying: suggestionID";
    SEL v26 = a2;
    v27 = self;
    uint64_t v28 = 198;
    goto LABEL_21;
  }
  if (!v16)
  {
    v21 = v17;
    v30 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      -[MOEvent initWithEventIdentifier:startDate:endDate:creationDate:provider:category:]();
    }

    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    v24 = v23;
    v25 = @"Invalid parameter not satisfying: startDate";
    SEL v26 = a2;
    v27 = self;
    uint64_t v28 = 199;
    goto LABEL_21;
  }
  if (!v36)
  {
    v21 = v17;
    v31 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      -[MOEvent initWithEventIdentifier:startDate:endDate:creationDate:provider:category:]();
    }

    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    v24 = v23;
    v25 = @"Invalid parameter not satisfying: endDate";
    SEL v26 = a2;
    v27 = self;
    uint64_t v28 = 200;
LABEL_21:
    [v23 handleFailureInMethod:v26 object:v27 file:@"MOEventBundle.m" lineNumber:v28 description:v25];

    v20 = 0;
    goto LABEL_22;
  }
  id v35 = v17;
  if (v17)
  {
    v37.receiver = self;
    v37.super_class = (Class)MOEventBundle;
    v18 = [(MOEventBundle *)&v37 init];
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
    v33 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      -[MOEvent initWithEventIdentifier:startDate:endDate:creationDate:provider:category:].cold.4();
    }

    v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2 object:self file:@"MOEventBundle.m" lineNumber:201 description:@"Invalid parameter not satisfying: creationDate"];

    v20 = 0;
  }
  v21 = v35;
LABEL_22:

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
    uint64_t v48 = [v89 copy];
    events = v47->_events;
    v47->_events = (NSArray *)v48;

    v47->_filtered = a11;
    v47->_interfaceType = a12;
    v47->_photoSource = a13;
    objc_storeStrong((id *)&v47->_promptLanguage, a14);
    v47->_source = a15;
    objc_storeStrong((id *)&v47->_action, a17);
    objc_storeStrong((id *)&v47->_concurrentMediaAction, a18);
    uint64_t v50 = [v38 copy];
    actions = v47->_actions;
    v47->_actions = (NSArray *)v50;

    uint64_t v52 = [v39 copy];
    persons = v47->_persons;
    v47->_persons = (NSArray *)v52;

    objc_storeStrong((id *)&v47->_place, a21);
    objc_storeStrong((id *)&v47->_predominantWeather, a22);
    uint64_t v54 = [v40 copy];
    resources = v47->_resources;
    v47->_resources = (NSArray *)v54;

    objc_storeStrong((id *)&v47->_time, a24);
    uint64_t v56 = [v41 copy];
    metaDataForRank = v47->_metaDataForRank;
    v47->_metaDataForRank = (NSDictionary *)v56;

    uint64_t v58 = [v42 mutableCopy];
    suggestionEngagementEvents = v47->_suggestionEngagementEvents;
    v47->_suggestionEngagementEvents = (NSMutableSet *)v58;

    v47->_suggestionEngagementViewCount = a27;
    uint64_t v60 = [v43 mutableCopy];
    appEntryEngagementEvents = v47->_appEntryEngagementEvents;
    v47->_appEntryEngagementEvents = (NSMutableSet *)v60;

    v47->_isAggregatedAndSuppressed = a29;
    v47->_summarizationGranularity = a30;
    uint64_t v62 = [v44 copy];
    places = v47->_places;
    v47->_places = (NSArray *)v62;

    uint64_t v64 = [v45 copy];
    subBundleIDs = v47->_subBundleIDs;
    v47->_subBundleIDs = (NSArray *)v64;

    uint64_t v66 = [v88 copy];
    subSuggestionIDs = v47->_subSuggestionIDs;
    v47->_subSuggestionIDs = (NSArray *)v66;

    v47->_includedInSummaryBundleOnly = a34;
    v47->_bundleSubType = a35;
    v47->_bundleSuperType = a36;
    uint64_t v68 = [v87 copy];
    photoTraits = v47->_photoTraits;
    v47->_photoTraits = (NSArray *)v68;
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
  char v31 = [v5 filtered];
  uint64_t v30 = [v5 interfaceType];
  uint64_t v29 = [v5 photoSource];
  id v39 = [v5 promptLanguage];
  uint64_t v28 = [v5 source];
  objc_super v37 = [v5 startDate];
  id v38 = [v5 action];
  id v36 = [v5 concurrentMediaAction];
  v27 = [v5 actions];
  SEL v26 = [v5 persons];
  v25 = [v5 place];
  v24 = [v5 predominantWeather];
  v23 = [v5 resources];
  id v35 = [v5 time];
  v20 = [v5 metaDataForRank];
  v22 = [v5 suggestionEngagementEvents];
  uint64_t v21 = [v5 suggestionEngagementViewCount];
  v18 = [v5 appEntryEngagementEvents];
  char v19 = [v5 isAggregatedAndSuppressed];
  uint64_t v16 = [v5 summarizationGranularity];
  id v17 = [v5 places];
  v6 = [v5 subBundleIDs];
  v7 = [v5 subSuggestionIDs];
  char v8 = [v5 includedInSummaryBundleOnly];
  uint64_t v9 = [v5 bundleSubType];
  uint64_t v10 = [v5 bundleSuperType];
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
  v47 = (void *)MEMORY[0x1E4F1CA80];
  id v55 = a35;
  id v51 = a31;
  id v35 = a30;
  id v48 = a29;
  id v36 = a26;
  id v37 = a23;
  id v46 = a22;
  id v45 = a21;
  id v44 = a20;
  id v43 = a19;
  id v71 = a18;
  id v70 = a17;
  id v69 = a16;
  id v68 = a15;
  id v65 = a14;
  id v64 = a12;
  id v67 = a8;
  id v63 = a7;
  id v42 = a6;
  id v50 = a5;
  id v61 = a4;
  id v59 = a3;
  uint64_t v54 = [v47 setWithSet:a24];
  v53 = [MEMORY[0x1E4F1CA80] setWithSet:v36];

  LOBYTE(v41) = a32;
  LOBYTE(v40) = a27;
  LOBYTE(v39) = a9;
  v57 = -[MOEventBundle initWithBundleIdentifier:suggestionID:bundleType:creationDate:firstCreationDate:endDate:expirationDate:events:filtered:interfaceType:photoSource:promptLanguage:source:startDate:action:concurrentMediaAction:actions:persons:place:predominantWeather:resources:time:metaDataForRank:suggestionEngagements:suggestionEngagementViewCount:appEntryEngagements:isAggregatedAndSuppressed:summarizationGranularity:places:subBundleIDs:subSuggestionIDs:includedInSummaryBundleOnly:bundleSubType:bundleSuperType:photoTraits:](self, "initWithBundleIdentifier:suggestionID:bundleType:creationDate:firstCreationDate:endDate:expirationDate:events:filtered:interfaceType:photoSource:promptLanguage:source:startDate:action:concurrentMediaAction:actions:persons:place:predominantWeather:resources:time:metaDataForRank:suggestionEngagements:suggestionEngagementViewCount:appEntryEngagements:isAggregatedAndSuppressed:summarizationGranularity:places:subBundleIDs:subSuggestionIDs:includedInSummaryBundleOnly:bundleSubType:bundleSuperType:photoTraits:", v59, v59, v61, v50, 0, v42, v63, v67, v39, a10, a11, v64, a13,
          v65,
          v68,
          v69,
          v70,
          v71,
          v43,
          v44,
          v45,
          v46,
          v37,
          v54,
          a25,
          v53,
          v40,
          a28,
          v48,
          v35,
          v51,
          v41,
          a33,
          a34,
          v55);

  return v57;
}

- (MOEventBundle)initWithBundleIdentifier:(id)a3 bundleType:(id)a4 creationDate:(id)a5 endDate:(id)a6 expirationDate:(id)a7 events:(id)a8 filtered:(BOOL)a9 interfaceType:(unint64_t)a10 photoSource:(unint64_t)a11 promptLanguage:(id)a12 source:(unint64_t)a13 startDate:(id)a14 action:(id)a15 concurrentMediaAction:(id)a16 actions:(id)a17 persons:(id)a18 place:(id)a19 predominantWeather:(id)a20 resources:(id)a21 time:(id)a22 metaDataForRank:(id)a23 suggestionEngagements:(id)a24 suggestionEngagementViewCount:(unint64_t)a25 appEntryEngagements:(id)a26 isAggregatedAndSuppressed:(BOOL)a27 summarizationGranularity:(unint64_t)a28 places:(id)a29 subBundleIDs:(id)a30 subSuggestionIDs:(id)a31 photoTraits:(id)a32
{
  id v44 = (void *)MEMORY[0x1E4F1CA80];
  id v47 = a32;
  id v46 = a31;
  id v32 = a30;
  id v45 = a29;
  id v33 = a26;
  id v34 = a23;
  id v43 = a22;
  id v42 = a21;
  id v41 = a20;
  id v40 = a19;
  id v56 = a18;
  id v55 = a17;
  id v68 = a16;
  id v67 = a15;
  id v66 = a14;
  id v65 = a12;
  id v64 = a8;
  id v62 = a7;
  id v60 = a6;
  id v58 = a5;
  id v35 = a4;
  id v54 = a3;
  id v50 = [v44 setWithSet:a24];
  id v48 = [MEMORY[0x1E4F1CA80] setWithSet:v33];

  LOBYTE(v39) = 0;
  LOBYTE(v38) = a27;
  LOBYTE(v37) = a9;
  uint64_t v52 = -[MOEventBundle initWithBundleIdentifier:suggestionID:bundleType:creationDate:firstCreationDate:endDate:expirationDate:events:filtered:interfaceType:photoSource:promptLanguage:source:startDate:action:concurrentMediaAction:actions:persons:place:predominantWeather:resources:time:metaDataForRank:suggestionEngagements:suggestionEngagementViewCount:appEntryEngagements:isAggregatedAndSuppressed:summarizationGranularity:places:subBundleIDs:subSuggestionIDs:includedInSummaryBundleOnly:bundleSubType:bundleSuperType:photoTraits:](self, "initWithBundleIdentifier:suggestionID:bundleType:creationDate:firstCreationDate:endDate:expirationDate:events:filtered:interfaceType:photoSource:promptLanguage:source:startDate:action:concurrentMediaAction:actions:persons:place:predominantWeather:resources:time:metaDataForRank:suggestionEngagements:suggestionEngagementViewCount:appEntryEngagements:isAggregatedAndSuppressed:summarizationGranularity:places:subBundleIDs:subSuggestionIDs:includedInSummaryBundleOnly:bundleSubType:bundleSuperType:photoTraits:", v54, v54, v35, v58, 0, v60, v62, v64, v37, a10, a11, v65, a13,
          v66,
          v67,
          v68,
          v55,
          v56,
          v40,
          v41,
          v42,
          v43,
          v34,
          v50,
          a25,
          v48,
          v38,
          a28,
          v45,
          v32,
          v46,
          v39,
          0,
          0,
          v47);

  return v52;
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
    return off_1E6920260[v2 - 1];
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
  uint64_t v3 = MEMORY[0x1D26065F0](self, a2);
  id v41 = NSString;
  id v43 = (void *)v3;
  id v58 = [(MOEventBundle *)self bundleIdentifier];
  v57 = [(MOEventBundle *)self suggestionID];
  id v59 = [(MOEventBundle *)self subSuggestionIDs];
  id v56 = [(MOEventBundle *)self startDate];
  id v55 = [(MOEventBundle *)self endDate];
  id v54 = [(MOEventBundle *)self creationDate];
  v53 = [(MOEventBundle *)self expirationDate];
  uint64_t v52 = [(MOEventBundle *)self firstCreationDate];
  id v50 = [(MOEventBundle *)self displayStartDate];
  v49 = [(MOEventBundle *)self displayEndDate];
  unint64_t v39 = [(MOEventBundle *)self source];
  unint64_t v38 = [(MOEventBundle *)self interfaceType];
  unint64_t v37 = [(MOEventBundle *)self bundleSubType];
  unint64_t v36 = [(MOEventBundle *)self bundleSuperType];
  if ([(MOEventBundle *)self filtered]) {
    unint64_t v4 = @"Yes";
  }
  else {
    unint64_t v4 = @"No";
  }
  id v35 = v4;
  if ([(MOEventBundle *)self isAggregatedAndSuppressed]) {
    id v5 = @"Yes";
  }
  else {
    id v5 = @"No";
  }
  id v34 = v5;
  unint64_t v33 = [(MOEventBundle *)self summarizationGranularity];
  if ([(MOEventBundle *)self includedInSummaryBundleOnly]) {
    BOOL v6 = @"Yes";
  }
  else {
    BOOL v6 = @"No";
  }
  uint64_t v29 = v6;
  id v40 = [(MOEventBundle *)self promptLanguage];
  id v51 = [v40 mask];
  unint64_t v30 = [(MOEventBundle *)self photoSource];
  id v48 = [(MOEventBundle *)self photoTraits];
  id v46 = [(MOEventBundle *)self action];
  id v47 = [(MOEventBundle *)self concurrentMediaAction];
  id v45 = [(MOEventBundle *)self place];
  uint64_t v28 = [(MOEventBundle *)self time];
  id v44 = [(MOEventBundle *)self predominantWeather];
  v27 = [(MOEventBundle *)self actions];
  SEL v26 = [(MOEventBundle *)self persons];
  id v17 = [(MOEventBundle *)self places];
  v24 = [(MOEventBundle *)self subBundleIDs];
  id v32 = [(MOEventBundle *)self metaData];
  uint64_t v19 = [v32 count];
  char v31 = [(MOEventBundle *)self events];
  uint64_t v18 = [v31 count];
  uint64_t v16 = [(MOEventBundle *)self labels];
  v20 = [(MOEventBundle *)self promptLanguages];
  uint64_t v15 = [(MOEventBundle *)self _allResourcesImpl];
  v25 = [(MOEventBundle *)self metaData];
  v23 = [v25 allKeys];
  uint64_t v7 = [v23 count];
  v22 = [(MOEventBundle *)self metaData];
  char v8 = [v22 allKeys];
  uint64_t v21 = [(MOEventBundle *)self metaDataForRank];
  uint64_t v9 = [v21 allKeys];
  uint64_t v10 = [(MOEventBundle *)self rankingDictionary];
  v11 = [(MOEventBundle *)self suggestionEngagementEvents];
  unint64_t v12 = [(MOEventBundle *)self suggestionEngagementViewCount];
  uint64_t v13 = [(MOEventBundle *)self appEntryEngagementEvents];
  objc_msgSend(v41, "stringWithFormat:", @"<MOEventBundle bundleIdentifier, %@, suggestionID, %@, sub Suggestion IDs, %@, startDate, %@, endDate, %@, creationDate, %@, expirationDate, %@, firstCreationDate, %@, displayStartDate, %@, displayEndDate, %@, source, %lu, interfaceType, %lu, bundleSubType, %lu, bundleSuperType, %lu, filtered, %@, agg./suppressed, %@, sum. granularity, %lu, includedInSummaryOnly, %@, promptLanguage, %@, photoSource, %lu, traits, %@, action, %@, concurrentMediaAction, %@, place, %@, time, %@, predominantWeather %@, actions, %@, persons, %@, places, %@, sub bundle IDs, %@, metaData.count, %lu,  events.count, %lu, labels, %@, prompts, %@, allResources, %@, meta, %lu, meta keywords, %@, metaDataForRank, %@, rankings, %@, suggestionEngagements, %@, suggestionEngagementViewCount, %lu, appEntryEngagementEvents %@>", v58, v57, v59, v56, v55, v54, v53, v52, v50, v49, v39, v38, v37, v36, v35, v34,
    v33,
    v29,
    v51,
    v30,
    v48,
    v46,
    v47,
    v45,
    v28,
    v44,
    v27,
    v26,
    v17,
    v24,
    v19,
    v18,
    v16,
    v20,
    v15,
    v7,
    v8,
    v9,
    v10,
    v11,
    v12,
  id v42 = v13);

  return v42;
}

- (MOEventBundle)initWithEventSet:(id)a3 filtered:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
  char v8 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v9 = [(MOEventBundle *)self initWithBundleIdentifier:v8 suggestionID:v8 startDate:v7 endDate:v7 creationDate:v7];
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
  uint64_t v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = [(MOEventBundle *)self events];
  unint64_t v4 = [v3 valueForKeyPath:@"@distinctUnionOfObjects.category"];
  id v5 = [v2 setWithArray:v4];

  return (NSSet *)v5;
}

- (void)setPropertiesBasedOnEvents
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] distantFuture];
  startDate = self->_startDate;
  self->_startDate = v3;

  id v5 = [MEMORY[0x1E4F1C9C8] distantPast];
  endDate = self->_endDate;
  self->_endDate = v5;

  uint64_t v7 = [MEMORY[0x1E4F1C9C8] distantFuture];
  expirationDate = self->_expirationDate;
  self->_expirationDate = v7;

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v9 = [(MOEventBundle *)self events];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v32 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v15 = self->_startDate;
        uint64_t v16 = [v14 startDate];
        LODWORD(v15) = [(NSDate *)v15 isAfterDate:v16];

        if (v15)
        {
          id v17 = [v14 startDate];
          uint64_t v18 = (NSDate *)[v17 copy];
          uint64_t v19 = self->_startDate;
          self->_startDate = v18;
        }
        v20 = [v14 endDate];
        int v21 = [v20 isAfterDate:self->_endDate];

        if (v21)
        {
          v22 = [v14 endDate];
          v23 = (NSDate *)[v22 copy];
          v24 = self->_endDate;
          self->_endDate = v23;
        }
        v25 = self->_expirationDate;
        SEL v26 = [v14 expirationDate];
        LODWORD(v25) = [(NSDate *)v25 isAfterDate:v26];

        if (v25)
        {
          v27 = [v14 expirationDate];
          uint64_t v28 = (NSDate *)[v27 copy];
          uint64_t v29 = self->_expirationDate;
          self->_expirationDate = v28;
        }
        unint64_t v30 = [v14 provider] - 1;
        if (v30 <= 0xA) {
          self->_source |= qword_1D250F088[v30];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v11);
  }
}

- (void)addBackgroundAction:(id)a3
{
  id v7 = a3;
  unint64_t v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = [(MOEventBundle *)self backgroundActions];
  id v6 = [v4 arrayWithArray:v5];

  if (v7) {
    [v6 addObject:v7];
  }
  [(MOEventBundle *)self setBackgroundActions:v6];
}

- (void)addAction:(id)a3
{
  id v7 = a3;
  unint64_t v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = [(MOEventBundle *)self actions];
  id v6 = [v4 arrayWithArray:v5];

  if (v7) {
    [v6 addObject:v7];
  }
  [(MOEventBundle *)self setActions:v6];
}

- (unint64_t)bundleManagementPolicy
{
  return [(MOEventBundle *)self interfaceType] == 13
      || [(MOEventBundle *)self interfaceType] == 11
      || [(MOEventBundle *)self interfaceType] == 10;
}

- (id)localStartDate
{
  uint64_t v3 = [(MOEventBundle *)self time];
  if (!v3) {
    goto LABEL_4;
  }
  unint64_t v4 = (void *)v3;
  id v5 = [(MOEventBundle *)self time];
  id v6 = [v5 timeZone];

  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F1CAF0]);
    char v8 = [(MOEventBundle *)self time];
    uint64_t v9 = [v8 timeZone];
    uint64_t v10 = (void *)[v7 initWithName:v9];

    uint64_t v11 = [(MOEventBundle *)self startDate];
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
  unint64_t v4 = (void *)v3;
  id v5 = [(MOEventBundle *)self time];
  id v6 = [v5 timeZone];

  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F1CAF0]);
    char v8 = [(MOEventBundle *)self time];
    uint64_t v9 = [v8 timeZone];
    uint64_t v10 = (void *)[v7 initWithName:v9];

    uint64_t v11 = [(MOEventBundle *)self endDate];
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
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  if ([(MOEventBundle *)self bundleSubType] == 202
    || [(MOEventBundle *)self bundleSubType] == 404
    || [(MOEventBundle *)self bundleSubType] == 405)
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9C8] distantFuture];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    unint64_t v4 = [(MOEventBundle *)self events];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v55 objects:v61 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v56;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v56 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v55 + 1) + 8 * i);
          if (([v9 category] == 2 || objc_msgSend(v9, "category") == 4)
            && [v9 provider] != 5)
          {
            uint64_t v10 = [v9 startDate];
            int v11 = [v3 isAfterDate:v10];

            if (v11)
            {
              uint64_t v12 = [v9 startDate];

              uint64_t v3 = (void *)v12;
            }
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v55 objects:v61 count:16];
      }
      while (v6);
    }

    uint64_t v13 = [(MOEventBundle *)self time];
    if (!v13) {
      goto LABEL_19;
    }
    uint64_t v14 = (void *)v13;
    uint64_t v15 = [(MOEventBundle *)self time];
    uint64_t v16 = [v15 timeZone];

    if (v16)
    {
      id v17 = objc_alloc(MEMORY[0x1E4F1CAF0]);
      uint64_t v18 = [(MOEventBundle *)self time];
      uint64_t v19 = [v18 timeZone];
      v20 = (void *)[v17 initWithName:v19];

      id v21 = +[MOTime localTimeOfDate:v3 timeZone:v20];
    }
    else
    {
LABEL_19:
      id v21 = v3;
    }
  }
  else if ([(MOEventBundle *)self bundleSubType] == 203)
  {
    id v21 = [(MOEventBundle *)self startDate];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    v23 = [(MOEventBundle *)self events];
    uint64_t v24 = [v23 countByEnumeratingWithState:&v51 objects:v60 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v52;
      v27 = @"kEventResourcePatternWorkoutInfoDictArray";
      uint64_t v44 = *(void *)v52;
      id v45 = v23;
      id v43 = @"kEventResourcePatternWorkoutInfoDictArray";
      do
      {
        uint64_t v28 = 0;
        uint64_t v46 = v25;
        do
        {
          if (*(void *)v52 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v29 = *(void **)(*((void *)&v51 + 1) + 8 * v28);
          if (objc_msgSend(v29, "provider", v43, v44, v45) == 5 && objc_msgSend(v29, "category") == 2)
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

              uint64_t v34 = [v33 countByEnumeratingWithState:&v47 objects:v59 count:16];
              if (v34)
              {
                uint64_t v35 = v34;
                uint64_t v36 = *(void *)v48;
                do
                {
                  for (uint64_t j = 0; j != v35; ++j)
                  {
                    if (*(void *)v48 != v36) {
                      objc_enumerationMutation(v33);
                    }
                    unint64_t v38 = [*(id *)(*((void *)&v47 + 1) + 8 * j) objectForKeyedSubscript:@"kEventResourcePatternWorkoutStartDate"];
                    [v38 doubleValue];
                    double v40 = v39;

                    id v41 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v40];
                    if ([v21 isAfterDate:v41])
                    {
                      id v42 = v41;

                      id v21 = v42;
                    }
                  }
                  uint64_t v35 = [v33 countByEnumeratingWithState:&v47 objects:v59 count:16];
                }
                while (v35);
              }

              uint64_t v26 = v44;
              v23 = v45;
              v27 = v43;
            }
            uint64_t v25 = v46;
          }
          ++v28;
        }
        while (v28 != v25);
        uint64_t v25 = [v23 countByEnumeratingWithState:&v51 objects:v60 count:16];
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
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  if ([(MOEventBundle *)self bundleSubType] == 202
    || [(MOEventBundle *)self bundleSubType] == 404
    || [(MOEventBundle *)self bundleSubType] == 405)
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9C8] distantPast];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    unint64_t v4 = [(MOEventBundle *)self events];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v55 objects:v61 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v56;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v56 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v55 + 1) + 8 * i);
          if (([v9 category] == 2 || objc_msgSend(v9, "category") == 4)
            && [v9 provider] != 5)
          {
            uint64_t v10 = [v9 endDate];
            int v11 = [v3 isBeforeDate:v10];

            if (v11)
            {
              uint64_t v12 = [v9 endDate];

              uint64_t v3 = (void *)v12;
            }
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v55 objects:v61 count:16];
      }
      while (v6);
    }

    uint64_t v13 = [(MOEventBundle *)self time];
    if (!v13) {
      goto LABEL_19;
    }
    uint64_t v14 = (void *)v13;
    uint64_t v15 = [(MOEventBundle *)self time];
    uint64_t v16 = [v15 timeZone];

    if (v16)
    {
      id v17 = objc_alloc(MEMORY[0x1E4F1CAF0]);
      uint64_t v18 = [(MOEventBundle *)self time];
      uint64_t v19 = [v18 timeZone];
      v20 = (void *)[v17 initWithName:v19];

      id v21 = +[MOTime localTimeOfDate:v3 timeZone:v20];
    }
    else
    {
LABEL_19:
      id v21 = v3;
    }
  }
  else if ([(MOEventBundle *)self bundleSubType] == 203)
  {
    id v21 = [(MOEventBundle *)self endDate];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    v23 = [(MOEventBundle *)self events];
    uint64_t v24 = [v23 countByEnumeratingWithState:&v51 objects:v60 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v52;
      v27 = @"kEventResourcePatternWorkoutInfoDictArray";
      uint64_t v44 = *(void *)v52;
      id v45 = v23;
      id v43 = @"kEventResourcePatternWorkoutInfoDictArray";
      do
      {
        uint64_t v28 = 0;
        uint64_t v46 = v25;
        do
        {
          if (*(void *)v52 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v29 = *(void **)(*((void *)&v51 + 1) + 8 * v28);
          if (objc_msgSend(v29, "provider", v43, v44, v45) == 5 && objc_msgSend(v29, "category") == 2)
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

              uint64_t v34 = [v33 countByEnumeratingWithState:&v47 objects:v59 count:16];
              if (v34)
              {
                uint64_t v35 = v34;
                uint64_t v36 = *(void *)v48;
                do
                {
                  for (uint64_t j = 0; j != v35; ++j)
                  {
                    if (*(void *)v48 != v36) {
                      objc_enumerationMutation(v33);
                    }
                    unint64_t v38 = [*(id *)(*((void *)&v47 + 1) + 8 * j) objectForKeyedSubscript:@"kEventResourcePatternWorkoutEndDate"];
                    [v38 doubleValue];
                    double v40 = v39;

                    id v41 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v40];
                    if ([v21 isBeforeDate:v41])
                    {
                      id v42 = v41;

                      id v21 = v42;
                    }
                  }
                  uint64_t v35 = [v33 countByEnumeratingWithState:&v47 objects:v59 count:16];
                }
                while (v35);
              }

              uint64_t v26 = v44;
              v23 = v45;
              v27 = v43;
            }
            uint64_t v25 = v46;
          }
          ++v28;
        }
        while (v28 != v25);
        uint64_t v25 = [v23 countByEnumeratingWithState:&v51 objects:v60 count:16];
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
  id v7 = a3;
  unint64_t v4 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v5 = [(MOEventBundle *)self persons];
  uint64_t v6 = [v4 arrayWithArray:v5];

  if (v7) {
    [v6 addObject:v7];
  }
  [(MOEventBundle *)self setPersons:v6];
}

- (void)addResource:(id)a3
{
  id v7 = a3;
  unint64_t v4 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v5 = [(MOEventBundle *)self resources];
  uint64_t v6 = [v4 arrayWithArray:v5];

  if (v7) {
    [v6 addObject:v7];
  }
  [(MOEventBundle *)self setResources:v6];
}

- (void)addPhotoTraits:(id)a3
{
  id v7 = a3;
  unint64_t v4 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v5 = [(MOEventBundle *)self photoTraits];
  uint64_t v6 = [v4 arrayWithArray:v5];

  if ([v6 count]) {
    [v6 addObjectsFromArray:v7];
  }
  [(MOEventBundle *)self setPhotoTraits:v6];
}

- (void)addResources:(id)a3
{
  id v7 = a3;
  unint64_t v4 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v5 = [(MOEventBundle *)self resources];
  uint64_t v6 = [v4 arrayWithArray:v5];

  if ([v7 count]) {
    [v6 addObjectsFromArray:v7];
  }
  [(MOEventBundle *)self setResources:v6];
}

- (void)addMetaDataForRankForKey:(id)a3 value:(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F1CA60];
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [(MOEventBundle *)self metaDataForRank];
  id v11 = [v6 dictionaryWithDictionary:v9];

  [v11 setObject:v7 forKey:v8];
  uint64_t v10 = (void *)[v11 copy];
  [(MOEventBundle *)self setMetaDataForRank:v10];
}

- (id)_allResourcesImpl
{
  uint64_t v3 = objc_opt_new();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__MOEventBundle__allResourcesImpl__block_invoke;
  v6[3] = &unk_1E6920218;
  id v4 = v3;
  id v7 = v4;
  [(MOEventBundle *)self withResourcesUsingBlock:v6];

  return v4;
}

uint64_t __34__MOEventBundle__allResourcesImpl__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (void)withResourcesUsingBlock:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v60 = 0;
  id v61 = &v60;
  uint64_t v62 = 0x2020000000;
  char v63 = 0;
  long long v48 = self;
  uint64_t v5 = [(MOEventBundle *)self resources];
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __41__MOEventBundle_withResourcesUsingBlock___block_invoke;
  v57[3] = &unk_1E6920240;
  uint64_t v6 = (char *)v4;
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
    uint64_t v8 = [v7 countByEnumeratingWithState:&v53 objects:v65 count:16];
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
        id v11 = *(void **)(*((void *)&v53 + 1) + 8 * v10);
        uint64_t v12 = (void *)MEMORY[0x1D26065F0]();
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
        if (v8 == ++v10)
        {
          uint64_t v8 = [v7 countByEnumeratingWithState:&v53 objects:v65 count:16];
          if (v8) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    uint64_t v16 = [(MOEventBundle *)v48 place];
    if (!v16) {
      goto LABEL_25;
    }
    id v17 = [(MOEventBundle *)v48 places];
    BOOL v18 = [v17 count] == 0;

    if (!v18) {
      goto LABEL_25;
    }
    uint64_t v19 = (void *)MEMORY[0x1D26065F0]();
    v20 = [(MOEventBundle *)v48 place];
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
    uint64_t v24 = [MOResource alloc];
    uint64_t v25 = [(MOEventBundle *)v48 place];
    uint64_t v26 = [(MOResource *)v24 initWithPlace:v25 startDate:v21 endDate:v23];

    if (!v26) {
      goto LABEL_23;
    }
    v27 = [(MOEventBundle *)v48 place];
    uint64_t v28 = [v27 sourceEventIdentifier];
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
      uint64_t v30 = [v7 countByEnumeratingWithState:&v49 objects:v64 count:16];
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
          uint64_t v34 = (void *)MEMORY[0x1D26065F0]();
          uint64_t v35 = [v33 startDate];
          if (!v35)
          {
            uint64_t v35 = [(MOEventBundle *)v48 startDate];
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
          if (v30 == ++v32)
          {
            uint64_t v30 = [v7 countByEnumeratingWithState:&v49 objects:v64 count:16];
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
        id v41 = (void *)MEMORY[0x1D26065F0]();
        id v42 = [MOResource alloc];
        id v43 = [(MOEventBundle *)v48 predominantWeather];
        uint64_t v44 = [(MOResource *)v42 initWithWeather:v43];

        if (v44)
        {
          id v45 = [(MOEventBundle *)v48 predominantWeather];
          uint64_t v46 = [v45 sourceEventIdentifier];
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
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_opt_new();
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id v68 = self;
  id v7 = [(MOEventBundle *)self persons];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v78 objects:v84 count:16];
  unint64_t v9 = 0x1E691E000uLL;
  if (v8)
  {
    uint64_t v10 = v8;
    int v11 = 0;
    id v4 = *(void **)v79;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void **)v79 != v4) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void **)(*((void *)&v78 + 1) + 8 * i);
        uint64_t v14 = [[MOResource alloc] initWithPerson:v13];
        uint64_t v2 = v14;
        if (v14)
        {
          uint64_t v3 = [(MOResource *)v14 identifier];

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
      uint64_t v10 = [v7 countByEnumeratingWithState:&v78 objects:v84 count:16];
    }
    while (v10);
  }
  else
  {
    int v11 = 0;
  }

  id v17 = v68;
  if ([(MOEventBundle *)v68 interfaceType] != 7)
  {
    uint64_t v18 = [(MOEventBundle *)v68 interfaceType];
    if (v18 == 1)
    {
      id obj = [(MOEventBundle *)v68 place];
      if ([obj placeUserType] == 1)
      {
LABEL_84:

        goto LABEL_85;
      }
    }
    uint64_t v19 = [(MOEventBundle *)v68 interfaceType];
    if (v19 == 1)
    {
      uint64_t v2 = [(MOEventBundle *)v68 place];
      if ([v2 placeUserType] == 2)
      {
        BOOL v20 = 0;
        goto LABEL_35;
      }
    }
    id v4 = [(MOEventBundle *)v68 interfaceType];
    if (v4 == (void *)12)
    {
      uint64_t v3 = [(MOEventBundle *)v68 place];
      if ([v3 placeUserType] == 1)
      {
        BOOL v20 = 0;
LABEL_29:

        goto LABEL_34;
      }
      if ([(MOEventBundle *)v68 interfaceType] == 12)
      {
LABEL_27:
        id v21 = [(MOEventBundle *)v68 place];
        BOOL v20 = [v21 placeUserType] != 2;

        if (v4 != (void *)12)
        {
          id v17 = v68;
          if (v19 != 1)
          {
LABEL_36:
            if (v18 == 1)
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
                uint64_t v25 = (void *)v24;
                uint64_t v26 = [(MOEventBundle *)v17 places];
                uint64_t v27 = [v26 count];

                if (v27)
                {
LABEL_53:
                  long long v76 = 0u;
                  long long v77 = 0u;
                  long long v74 = 0u;
                  long long v75 = 0u;
                  id obj = [(MOEventBundle *)v17 places];
                  uint64_t v37 = [obj countByEnumeratingWithState:&v74 objects:v83 count:16];
                  if (!v37) {
                    goto LABEL_84;
                  }
                  uint64_t v38 = v37;
                  uint64_t v39 = *(void *)v75;
                  while (1)
                  {
                    for (uint64_t j = 0; j != v38; ++j)
                    {
                      if (*(void *)v75 != v39) {
                        objc_enumerationMutation(obj);
                      }
                      id v41 = *(void **)(*((void *)&v74 + 1) + 8 * j);
                      [v41 priorityScore];
                      if (v42 < 20000.0)
                      {
                        uint64_t v43 = [(MOEventBundle *)v17 interfaceType];
                        if (v43 == 12)
                        {
                          id v4 = [(MOEventBundle *)v17 place];
                          if ([v4 placeUserType] == 1)
                          {
                            uint64_t v44 = v4;
LABEL_81:

                            continue;
                          }
                          if ([(MOEventBundle *)v17 interfaceType] == 12)
                          {
LABEL_65:
                            id v45 = v4;
                            uint64_t v46 = [(MOEventBundle *)v17 place];
                            uint64_t v47 = [v46 placeUserType];

                            if (v43 == 12)
                            {

                              BOOL v48 = v47 == 2;
                              id v4 = v45;
                              id v17 = v68;
                              if (v48) {
                                goto LABEL_70;
                              }
                            }
                            else
                            {
                              BOOL v48 = v47 == 2;
                              id v17 = v68;
                              id v4 = v45;
                              if (v48)
                              {
LABEL_70:
                                unint64_t v9 = 0x1E691E000;
                                continue;
                              }
                            }
                          }
                          else
                          {
                          }
                        }
                        else if ([(MOEventBundle *)v17 interfaceType] == 12)
                        {
                          goto LABEL_65;
                        }
                        long long v49 = v4;
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
                        unint64_t v9 = 0x1E691E000uLL;
                        goto LABEL_81;
                      }
                    }
                    uint64_t v38 = [obj countByEnumeratingWithState:&v74 objects:v83 count:16];
                    if (!v38) {
                      goto LABEL_84;
                    }
                  }
                }
                uint64_t v28 = [(MOEventBundle *)v17 place];
                v22 = [v28 startDate];

                if (!v22)
                {
                  v22 = [(MOEventBundle *)v17 startDate];
                }
                int v29 = [(MOEventBundle *)v17 place];
                uint64_t v30 = [v29 endDate];

                if (!v30)
                {
                  uint64_t v30 = [(MOEventBundle *)v17 endDate];
                }
                uint64_t v31 = [MOResource alloc];
                uint64_t v32 = [(MOEventBundle *)v17 place];
                long long v33 = [(MOResource *)v31 initWithPlace:v32 startDate:v22 endDate:v30];

                if (v33)
                {
                  uint64_t v34 = [(MOEventBundle *)v17 place];
                  uint64_t v35 = [v34 sourceEventIdentifier];
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
    else if ([(MOEventBundle *)v68 interfaceType] == 12)
    {
      goto LABEL_27;
    }
    BOOL v20 = 1;
LABEL_34:
    if (v19 != 1) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
LABEL_85:
  long long v54 = [(MOEventBundle *)v17 predominantWeather];

  if (v54)
  {
    id v55 = objc_alloc(*(Class *)(v9 + 1840));
    long long v56 = [(MOEventBundle *)v17 predominantWeather];
    long long v57 = (void *)[v55 initWithWeather:v56];

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
  uint64_t v62 = [v61 countByEnumeratingWithState:&v70 objects:v82 count:16];
  if (v62)
  {
    uint64_t v63 = v62;
    uint64_t v64 = *(void *)v71;
    do
    {
      for (uint64_t k = 0; k != v63; ++k)
      {
        if (*(void *)v71 != v64) {
          objc_enumerationMutation(v61);
        }
        uint64_t v66 = *(void **)(*((void *)&v70 + 1) + 8 * k);
        [v66 priorityScore];
        if (v67 <= 0.0) {
          [v66 setPriorityScore:(double)v11++ + 10000.0];
        }
        [v6 addObject:v66];
      }
      uint64_t v63 = [v61 countByEnumeratingWithState:&v70 objects:v82 count:16];
    }
    while (v63);
  }

  [(MOEventBundle *)v17 setResources:v6];
}

- (void)addEvent:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(MOEventBundle *)self events];

    if (v5)
    {
      uint64_t v6 = (void *)MEMORY[0x1E4F1CA48];
      id v7 = [(MOEventBundle *)self events];
      uint64_t v8 = [v6 arrayWithArray:v7];

      [v8 addObject:v4];
      unint64_t v9 = (void *)[v8 copy];
      [(MOEventBundle *)self setEvents:v9];
    }
    else
    {
      v10[0] = v4;
      uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
      [(MOEventBundle *)self setEvents:v8];
    }
  }
}

- (void)addEvents:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v10 = v4;
    if ([v4 count])
    {
      uint64_t v5 = [(MOEventBundle *)self events];

      if (v5)
      {
        uint64_t v6 = (void *)MEMORY[0x1E4F1CA48];
        id v7 = [(MOEventBundle *)self events];
        uint64_t v8 = [v6 arrayWithArray:v7];

        if ([v10 count]) {
          [v8 addObjectsFromArray:v10];
        }
        unint64_t v9 = (void *)[v8 copy];
        [(MOEventBundle *)self setEvents:v9];
      }
      else
      {
        [(MOEventBundle *)self setEvents:v10];
      }
    }
  }
  MEMORY[0x1F41817F8]();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MOEventBundle)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
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
    unint64_t v9 = 0;
  }
  else
  {
    uint64_t v10 = [(MOEventBundle *)self initWithBundleIdentifier:v5 creationDate:v6];
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

      v11->_source = [v4 decodeIntegerForKey:@"source"];
      v11->_interfaceType = [v4 decodeIntegerForKey:@"interfaceType"];
      v11->_photoSource = [v4 decodeIntegerForKey:@"photoSource"];
      BOOL v20 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v21 = objc_opt_class();
      v22 = objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
      uint64_t v23 = [v4 decodeObjectOfClasses:v22 forKey:@"events"];
      events = v11->_events;
      v11->_events = (NSArray *)v23;

      v11->_filtered = [v4 decodeBoolForKey:@"filtered"];
      uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"promptLanguage"];
      promptLanguage = v11->_promptLanguage;
      v11->_promptLanguage = (NSString *)v25;

      uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"action"];
      action = v11->_action;
      v11->_action = (MOAction *)v27;

      uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"concurrentMediaAction"];
      concurrentMediaAction = v11->_concurrentMediaAction;
      v11->_concurrentMediaAction = (MOAction *)v29;

      uint64_t v31 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v32 = objc_opt_class();
      long long v33 = objc_msgSend(v31, "setWithObjects:", v32, objc_opt_class(), 0);
      uint64_t v34 = [v4 decodeObjectOfClasses:v33 forKey:@"actions"];
      actions = v11->_actions;
      v11->_actions = (NSArray *)v34;

      double v36 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v37 = objc_opt_class();
      uint64_t v38 = objc_msgSend(v36, "setWithObjects:", v37, objc_opt_class(), 0);
      uint64_t v39 = [v4 decodeObjectOfClasses:v38 forKey:@"backgroundActions"];
      backgroundActions = v11->_backgroundActions;
      v11->_backgroundActions = (NSArray *)v39;

      id v41 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v42 = objc_opt_class();
      uint64_t v43 = objc_msgSend(v41, "setWithObjects:", v42, objc_opt_class(), 0);
      uint64_t v44 = [v4 decodeObjectOfClasses:v43 forKey:@"persons"];
      persons = v11->_persons;
      v11->_persons = (NSArray *)v44;

      uint64_t v46 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"place"];
      place = v11->_place;
      v11->_place = (MOPlace *)v46;

      uint64_t v48 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"weather"];
      predominantWeather = v11->_predominantWeather;
      v11->_predominantWeather = (MOWeather *)v48;

      uint64_t v50 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"time"];
      time = v11->_time;
      v11->_time = (MOTime *)v50;

      long long v52 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v53 = objc_opt_class();
      long long v54 = objc_msgSend(v52, "setWithObjects:", v53, objc_opt_class(), 0);
      uint64_t v55 = [v4 decodeObjectOfClasses:v54 forKey:@"resources"];
      resources = v11->_resources;
      v11->_resources = (NSArray *)v55;

      long long v57 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rankingDictionary"];
      uint64_t v58 = +[MODictionaryEncoder decodeToDictionary:v57];
      rankingDictionary = v11->_rankingDictionary;
      v11->_rankingDictionary = (NSDictionary *)v58;

      double v60 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v61 = objc_opt_class();
      uint64_t v62 = objc_msgSend(v60, "setWithObjects:", v61, objc_opt_class(), 0);
      uint64_t v63 = [v4 decodeObjectOfClasses:v62 forKey:@"labels"];
      labels = v11->_labels;
      v11->_labels = (NSArray *)v63;

      id v65 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v66 = objc_opt_class();
      double v67 = objc_msgSend(v65, "setWithObjects:", v66, objc_opt_class(), 0);
      uint64_t v68 = [v4 decodeObjectOfClasses:v67 forKey:@"promptLanguages"];
      promptLanguages = v11->_promptLanguages;
      v11->_promptLanguages = (NSArray *)v68;

      id v70 = objc_alloc(MEMORY[0x1E4F1CA60]);
      long long v71 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metaData"];
      long long v72 = +[MODictionaryEncoder decodeToDictionary:v71];
      uint64_t v73 = [v70 initWithDictionary:v72];
      metaData = v11->_metaData;
      v11->_metaData = (NSMutableDictionary *)v73;

      long long v75 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metaDataForRank"];
      uint64_t v76 = +[MODictionaryEncoder decodeToDictionary:v75];
      metaDataForRanuint64_t k = v11->_metaDataForRank;
      v11->_metaDataForRanuint64_t k = (NSDictionary *)v76;

      uint64_t v78 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"suggestionID"];
      suggestionID = v11->_suggestionID;
      v11->_suggestionID = (NSUUID *)v78;

      long long v80 = (void *)MEMORY[0x1E4F1CA80];
      long long v81 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v82 = objc_opt_class();
      id v83 = objc_msgSend(v81, "setWithObjects:", v82, objc_opt_class(), 0);
      id v84 = [v4 decodeObjectOfClasses:v83 forKey:@"suggestionEngagements"];
      uint64_t v85 = [v80 setWithArray:v84];
      suggestionEngagementEvents = v11->_suggestionEngagementEvents;
      v11->_suggestionEngagementEvents = (NSMutableSet *)v85;

      id v87 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v88 = objc_opt_class();
      id v89 = objc_msgSend(v87, "setWithObjects:", v88, objc_opt_class(), 0);
      uint64_t v90 = [v4 decodeObjectOfClasses:v89 forKey:@"places"];
      places = v11->_places;
      v11->_places = (NSArray *)v90;

      v11->_isAggregatedAndSuppressed = [v4 decodeBoolForKey:@"isAggregatedAndSuppressed"];
      v11->_summarizationGranularity = [v4 decodeIntegerForKey:@"summarizationGranularity"];
      uint64_t v92 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"subBundleIDs"];
      subBundleIDs = v11->_subBundleIDs;
      v11->_subBundleIDs = (NSArray *)v92;

      uint64_t v94 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"subSuggestionIDs"];
      subSuggestionIDs = v11->_subSuggestionIDs;
      v11->_subSuggestionIDs = (NSArray *)v94;

      v11->_suggestionEngagementViewCount = [v4 decodeIntegerForKey:@"suggestionViewCount"];
      v96 = (void *)MEMORY[0x1E4F1CA80];
      v97 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v98 = objc_opt_class();
      v99 = objc_msgSend(v97, "setWithObjects:", v98, objc_opt_class(), 0);
      v100 = [v4 decodeObjectOfClasses:v99 forKey:@"appEntryEngagements"];
      uint64_t v101 = [v96 setWithArray:v100];
      appEntryEngagementEvents = v11->_appEntryEngagementEvents;
      v11->_appEntryEngagementEvents = (NSMutableSet *)v101;

      v103 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v104 = objc_opt_class();
      v105 = objc_msgSend(v103, "setWithObjects:", v104, objc_opt_class(), 0);
      uint64_t v106 = [v4 decodeObjectOfClasses:v105 forKey:@"visitEventsRejectedByWatchLocation"];
      visitEventsRejectedByWatchLocation = v11->_visitEventsRejectedByWatchLocation;
      v11->_visitEventsRejectedByWatchLocation = (NSArray *)v106;

      v11->_bundleSubType = [v4 decodeIntegerForKey:@"bundleSubType"];
      v11->_bundleSuperType = [v4 decodeIntegerForKey:@"bundleSuperType"];
      uint64_t v108 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clusterMetadata"];
      clusterMetadata = v11->_clusterMetadata;
      v11->_clusterMetadata = (MOClusterMetadata *)v108;

      uint64_t v110 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"outlierMetadata"];
      outlierMetadata = v11->_outlierMetadata;
      v11->_outlierMetadata = (MOOutlierMetadata *)v110;

      v112 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v113 = objc_opt_class();
      v114 = objc_msgSend(v112, "setWithObjects:", v113, objc_opt_class(), 0);
      uint64_t v115 = [v4 decodeObjectOfClasses:v114 forKey:@"photoTraits"];
      photoTraits = v11->_photoTraits;
      v11->_photoTraits = (NSArray *)v115;
    }
    self = v11;
    unint64_t v9 = self;
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
  uint64_t v5 = +[MODictionaryEncoder encodeDictionary:self->_rankingDictionary];
  [v12 encodeObject:v5 forKey:@"rankingDictionary"];

  [v12 encodeObject:self->_labels forKey:@"labels"];
  [v12 encodeObject:self->_promptLanguages forKey:@"promptLanguages"];
  uint64_t v6 = +[MODictionaryEncoder encodeDictionary:self->_metaData];
  [v12 encodeObject:v6 forKey:@"metaData"];

  id v7 = +[MODictionaryEncoder encodeDictionary:self->_metaDataForRank];
  [v12 encodeObject:v7 forKey:@"metaDataForRank"];

  [v12 encodeObject:self->_suggestionID forKey:@"suggestionID"];
  BOOL v8 = [(MOEventBundle *)self suggestionEngagementEvents];
  unint64_t v9 = [v8 allObjects];
  [v12 encodeObject:v9 forKey:@"suggestionEngagements"];

  [v12 encodeObject:self->_places forKey:@"places"];
  [v12 encodeBool:self->_isAggregatedAndSuppressed forKey:@"isAggregatedAndSuppressed"];
  [v12 encodeInteger:self->_summarizationGranularity forKey:@"summarizationGranularity"];
  [v12 encodeObject:self->_subBundleIDs forKey:@"subBundleIDs"];
  [v12 encodeObject:self->_subSuggestionIDs forKey:@"subSuggestionIDs"];
  [v12 encodeInteger:self->_suggestionEngagementViewCount forKey:@"suggestionViewCount"];
  [v12 encodeObject:self->_visitEventsRejectedByWatchLocation forKey:@"visitEventsRejectedByWatchLocation"];
  uint64_t v10 = [(MOEventBundle *)self appEntryEngagementEvents];
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
  id v4 = [(MOEventBundle *)self startDate];
  if (v4)
  {
  }
  else
  {
    uint64_t v5 = [(MOEventBundle *)self endDate];

    if (!v5)
    {
LABEL_11:
      id v17 = 0;
      goto LABEL_16;
    }
  }
  uint64_t v6 = [(MOEventBundle *)self endDate];

  id v7 = [(MOEventBundle *)self startDate];
  BOOL v8 = v7;
  if (!v6)
  {
    [(MOEventBundle *)self setEndDate:v7];
LABEL_14:

    goto LABEL_15;
  }

  if (!v8)
  {
    BOOL v8 = [(MOEventBundle *)self endDate];
    [(MOEventBundle *)self setStartDate:v8];
    goto LABEL_14;
  }
  unint64_t v9 = [(MOEventBundle *)self startDate];
  uint64_t v10 = [(MOEventBundle *)self endDate];
  char v11 = [v9 isOnOrBefore:v10];

  if ((v11 & 1) == 0)
  {
    id v12 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      [(MOEventBundle *)(uint64_t)self dateInterval];
    }

    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"MOEventBundle.m", 1471, @"startDate is NOT earlier than endDate, bundle, %@ (in %s:%d)", self, "-[MOEventBundle dateInterval]", 1471 object file lineNumber description];
  }
  uint64_t v14 = [(MOEventBundle *)self startDate];
  int v15 = [(MOEventBundle *)self endDate];
  char v16 = [v14 isBeforeDate:v15];

  if ((v16 & 1) == 0) {
    goto LABEL_11;
  }
LABEL_15:
  id v18 = objc_alloc(MEMORY[0x1E4F28C18]);
  uint64_t v19 = [(MOEventBundle *)self startDate];
  BOOL v20 = [(MOEventBundle *)self endDate];
  id v17 = (void *)[v18 initWithStartDate:v19 endDate:v20];

LABEL_16:
  return v17;
}

- (unint64_t)hash
{
  uint64_t v2 = [(MOEventBundle *)self bundleIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqualToEventBundle:(id)a3
{
  uint64_t v114 = *MEMORY[0x1E4F143B8];
  id v4 = (MOEventBundle *)a3;
  if (self == v4) {
    goto LABEL_3;
  }
  uint64_t v5 = [(MOEventBundle *)self bundleIdentifier];
  uint64_t v6 = [(MOEventBundle *)v4 bundleIdentifier];
  char v7 = [v5 isEqual:v6];

  if (v7) {
    goto LABEL_3;
  }
  uint64_t v10 = [(MOEventBundle *)self suggestionID];
  if (v10)
  {
    char v11 = (void *)v10;
    uint64_t v12 = [(MOEventBundle *)v4 suggestionID];
    if (v12)
    {
      uint64_t v13 = (void *)v12;
      uint64_t v14 = [(MOEventBundle *)self suggestionID];
      int v15 = [(MOEventBundle *)v4 suggestionID];
      char v16 = [v14 isEqual:v15];

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
  unint64_t v17 = [(MOEventBundle *)self interfaceType];
  if (v17 != [(MOEventBundle *)v4 interfaceType])
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
      id v18 = @"endDate";
      }
      double v22 = 60.0;
      goto LABEL_32;
    case 1uLL:
    case 2uLL:
      if (![(MOEventBundle *)self isEqualPropertyForObject:self other:v4 propertyPath:@"startDate" threshold:600.0])goto LABEL_84; {
      id v18 = @"endDate";
      }
      uint64_t v19 = self;
      BOOL v20 = self;
      uint64_t v21 = v4;
      double v22 = 600.0;
      goto LABEL_33;
    case 4uLL:
      if (![(MOEventBundle *)self isEqualBasicPropertiesForObject:self other:v4])goto LABEL_84; {
      uint64_t v23 = [(MOEventBundle *)self startDate];
      }
      uint64_t v24 = [(MOEventBundle *)v4 startDate];
      int v8 = [v23 isSameDayWithDate:v24];

      if (!v8) {
        goto LABEL_4;
      }
      BOOL v25 = [(MOEventBundle *)self isEqualPersonsForObject:self other:v4];
      goto LABEL_34;
    case 5uLL:
      if (![(MOEventBundle *)self isEqualBasicPropertiesForObject:self other:v4])goto LABEL_84; {
      uint64_t v26 = [(MOEventBundle *)self startDate];
      }
      uint64_t v27 = [(MOEventBundle *)v4 startDate];
      int v8 = [v26 isSameDayWithDate:v27];

      if (!v8) {
        goto LABEL_4;
      }
      long long v108 = 0u;
      long long v109 = 0u;
      long long v106 = 0u;
      long long v107 = 0u;
      uint64_t v28 = [(MOEventBundle *)self resources];
      uint64_t v29 = [v28 countByEnumeratingWithState:&v106 objects:v113 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = 0;
        uint64_t v32 = *(void *)v107;
        do
        {
          for (uint64_t i = 0; i != v30; ++i)
          {
            if (*(void *)v107 != v32) {
              objc_enumerationMutation(v28);
            }
            uint64_t v34 = *(void **)(*((void *)&v106 + 1) + 8 * i);
            uint64_t v35 = (void *)MEMORY[0x1D26065F0]();
            if ([v34 type] == 3)
            {
              uint64_t v36 = [v34 getDictionary];

              uint64_t v31 = (void *)v36;
            }
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v106 objects:v113 count:16];
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
      uint64_t v84 = [v83 countByEnumeratingWithState:&v102 objects:v112 count:16];
      if (!v84)
      {
        id v86 = 0;
LABEL_106:

        goto LABEL_107;
      }
      uint64_t v85 = v84;
      id v86 = 0;
      uint64_t v87 = *(void *)v103;
      do
      {
        for (uint64_t j = 0; j != v85; ++j)
        {
          if (*(void *)v103 != v87) {
            objc_enumerationMutation(v83);
          }
          id v89 = *(void **)(*((void *)&v102 + 1) + 8 * j);
          uint64_t v90 = (void *)MEMORY[0x1D26065F0]();
          if ([v89 type] == 3)
          {
            uint64_t v91 = [v89 getDictionary];

            id v86 = (void *)v91;
          }
        }
        uint64_t v85 = [v83 countByEnumeratingWithState:&v102 objects:v112 count:16];
      }
      while (v85);

      if (v31 && v86)
      {
        id v83 = [v31 objectForKey:@"MOMediaPlayMetaDataKeyPlayerBundleID"];
        uint64_t v92 = [v86 objectForKey:@"MOMediaPlayMetaDataKeyPlayerBundleID"];
        v93 = (void *)v92;
        if (v83 && v92) {
          [v83 isEqualToString:v92];
        }

        goto LABEL_106;
      }
LABEL_107:

      goto LABEL_3;
    case 6uLL:
      id v18 = @"dateInterval";
      double v22 = 0.8;
LABEL_32:
      uint64_t v19 = self;
      BOOL v20 = self;
      uint64_t v21 = v4;
LABEL_33:
      BOOL v25 = [(MOEventBundle *)v19 isEqualPropertyForObject:v20 other:v21 propertyPath:v18 threshold:v22];
      goto LABEL_34;
    case 7uLL:
      unint64_t v37 = [(MOEventBundle *)self bundleSubType];
      if (v37 != [(MOEventBundle *)v4 bundleSubType]) {
        goto LABEL_84;
      }
      goto LABEL_83;
    case 8uLL:
      if (![(MOEventBundle *)self isEqualPropertyForObject:self other:v4 propertyPath:@"dateInterval" threshold:0.8])goto LABEL_84; {
      BOOL v25 = [(MOEventBundle *)self isEqualResourcesForObject:self other:v4 resourceType:8];
      }
      goto LABEL_34;
    case 10uLL:
      long long v100 = 0u;
      long long v101 = 0u;
      long long v98 = 0u;
      long long v99 = 0u;
      uint64_t v38 = [(MOEventBundle *)self resources];
      uint64_t v39 = [v38 countByEnumeratingWithState:&v98 objects:v111 count:16];
      if (v39)
      {
        uint64_t v40 = v39;
        id v41 = 0;
        uint64_t v42 = *(void *)v99;
        do
        {
          for (uint64_t k = 0; k != v40; ++k)
          {
            if (*(void *)v99 != v42) {
              objc_enumerationMutation(v38);
            }
            uint64_t v44 = *(void **)(*((void *)&v98 + 1) + 8 * k);
            id v45 = (void *)MEMORY[0x1D26065F0]();
            if ([v44 type] == 15)
            {
              uint64_t v46 = [v44 getDictionary];

              id v41 = (void *)v46;
            }
          }
          uint64_t v40 = [v38 countByEnumeratingWithState:&v98 objects:v111 count:16];
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
      uint64_t v56 = [v55 countByEnumeratingWithState:&v94 objects:v110 count:16];
      if (!v56)
      {

        uint64_t v58 = 0;
LABEL_76:
        LOBYTE(v8) = [(MOEventBundle *)self isEqualBaseActionForObject:self other:v4];

        goto LABEL_4;
      }
      uint64_t v57 = v56;
      uint64_t v58 = 0;
      uint64_t v59 = *(void *)v95;
      do
      {
        for (uint64_t m = 0; m != v57; ++m)
        {
          if (*(void *)v95 != v59) {
            objc_enumerationMutation(v55);
          }
          uint64_t v61 = *(void **)(*((void *)&v94 + 1) + 8 * m);
          uint64_t v62 = (void *)MEMORY[0x1D26065F0]();
          if ([v61 type] == 15)
          {
            uint64_t v63 = [v61 getDictionary];

            uint64_t v58 = (void *)v63;
          }
        }
        uint64_t v57 = [v55 countByEnumeratingWithState:&v94 objects:v110 count:16];
      }
      while (v57);

      if (!v41 || !v58) {
        goto LABEL_76;
      }
      uint64_t v64 = [v41 objectForKey:@"MOPHMemoryMetaDataKeyMemoryIdentifier"];
      uint64_t v65 = [v58 objectForKey:@"MOPHMemoryMetaDataKeyMemoryIdentifier"];
      uint64_t v66 = (void *)v65;
      if (v64 && v65 && ([v64 isEqualToString:v65] & 1) != 0)
      {

        goto LABEL_3;
      }

LABEL_88:
      uint64_t v82 = objc_msgSend((id)objc_opt_class(), "castEvergreenSubType:", -[MOEventBundle bundleSubType](v4, "bundleSubType"));
      LOBYTE(v8) = v82 == objc_msgSend((id)objc_opt_class(), "castEvergreenSubType:", -[MOEventBundle bundleSubType](self, "bundleSubType"));
LABEL_4:

      return v8;
    case 11uLL:
      goto LABEL_88;
    case 12uLL:
      unint64_t v47 = [(MOEventBundle *)self summarizationGranularity];
      if (v47 != [(MOEventBundle *)v4 summarizationGranularity]) {
        goto LABEL_84;
      }
      if ([(MOEventBundle *)self isEqualPropertyForObject:self other:v4 propertyPath:@"startDate" threshold:600.0])
      {
        goto LABEL_3;
      }
      uint64_t v48 = [(MOEventBundle *)self subBundleIDs];
      uint64_t v49 = [v48 count];

      if (v49)
      {
        if ([(MOEventBundle *)self intersectedSubBundleIDForObject:self other:v4])
        {
          goto LABEL_3;
        }
      }
      BOOL v25 = [(MOEventBundle *)self intersectedActivityOrVisitForObject:self other:v4];
LABEL_34:
      LOBYTE(v8) = v25;
      goto LABEL_4;
    case 13uLL:
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
      unint64_t v54 = [v53 placeType];
      if (v54 > 0x64
        || ([(MOEventBundle *)v4 place],
            long long v52 = objc_claimAutoreleasedReturnValue(),
            (unint64_t)[v52 placeType] > 0x64))
      {
        double v67 = [(MOEventBundle *)self place];
        uint64_t v68 = [v67 placeType];
        id v69 = [(MOEventBundle *)v4 place];
        uint64_t v70 = [v69 placeType];

        if (v54 <= 0x64) {
        if (v68 != v70)
        }
          goto LABEL_84;
      }
      else
      {
      }
      id v71 = objc_alloc(MEMORY[0x1E4F28C18]);
      long long v72 = [(MOEventBundle *)self startDate];
      uint64_t v73 = [(MOEventBundle *)self endDate];
      long long v74 = (void *)[v71 initWithStartDate:v72 endDate:v73];

      id v75 = objc_alloc(MEMORY[0x1E4F28C18]);
      uint64_t v76 = [(MOEventBundle *)v4 startDate];
      long long v77 = [(MOEventBundle *)v4 endDate];
      uint64_t v78 = (void *)[v75 initWithStartDate:v76 endDate:v77];

      LOBYTE(v76) = [v74 intersectsDateInterval:v78];
      if (v76) {
        goto LABEL_3;
      }
LABEL_81:
      if ([(MOEventBundle *)self bundleSubType] == 801
        && [(MOEventBundle *)v4 bundleSubType] == 801)
      {
LABEL_83:
        long long v79 = [(MOEventBundle *)self startDate];
        long long v80 = [(MOEventBundle *)v4 startDate];
        LOBYTE(v8) = [v79 isSameDayWithDate:v80];
      }
      else
      {
        long long v79 = [(MOEventBundle *)self startDate];
        long long v81 = [(MOEventBundle *)v4 startDate];
        LOBYTE(v8) = v79 == v81;
      }
      goto LABEL_4;
    case 14uLL:
      goto LABEL_81;
    default:
      goto LABEL_4;
  }
}

+ (unint64_t)castEvergreenSubType:(unint64_t)a3
{
  unint64_t result = a3;
  if (a3 - 707 <= 2) {
    return qword_1D250F0E0[a3 - 707];
  }
  return result;
}

- (BOOL)intersectedSubBundleIDForObject:(id)a3 other:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v6 = [a3 subBundleIDs];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        char v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        uint64_t v12 = objc_msgSend(v5, "subBundleIDs", 0);
        uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v20;
          while (2)
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v20 != v15) {
                objc_enumerationMutation(v12);
              }
              if ([v11 isEqualToString:*(void *)(*((void *)&v19 + 1) + 8 * j)])
              {

                BOOL v17 = 1;
                goto LABEL_19;
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
            if (v14) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
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
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v7 = [a3 events];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v32;
    long long v25 = v7;
    id v26 = v6;
    uint64_t v23 = *(void *)v32;
    do
    {
      uint64_t v11 = 0;
      uint64_t v24 = v9;
      do
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v31 + 1) + 8 * v11);
        if (objc_msgSend(v12, "category", v23) == 1 || objc_msgSend(v12, "category") == 2)
        {
          long long v29 = 0u;
          long long v30 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          uint64_t v13 = [v6 events];
          uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v35 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v28;
            while (2)
            {
              for (uint64_t i = 0; i != v15; ++i)
              {
                if (*(void *)v28 != v16) {
                  objc_enumerationMutation(v13);
                }
                id v18 = *(void **)(*((void *)&v27 + 1) + 8 * i);
                if ([v18 category] == 1 || objc_msgSend(v18, "category") == 2)
                {
                  if ((uint64_t v19 = [v12 category], v19 == objc_msgSend(v18, "category"))
                    && [v12 category] == 1
                    && -[MOEventBundle isEqualPropertyForObject:other:propertyPath:threshold:](self, "isEqualPropertyForObject:other:propertyPath:threshold:", v12, v18, @"startDate", 600.0)|| (uint64_t v20 = [v12 category], v20 == objc_msgSend(v18, "category"))&& objc_msgSend(v12, "category") == 2&& -[MOEventBundle isEqualPropertyForObject:other:propertyPath:threshold:](self, "isEqualPropertyForObject:other:propertyPath:threshold:", v12, v18, @"startDate", 600.0))
                  {

                    BOOL v21 = 1;
                    uint64_t v7 = v25;
                    id v6 = v26;
                    goto LABEL_29;
                  }
                }
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v35 count:16];
              if (v15) {
                continue;
              }
              break;
            }
          }

          uint64_t v7 = v25;
          id v6 = v26;
          uint64_t v10 = v23;
          uint64_t v9 = v24;
        }
        ++v11;
      }
      while (v11 != v9);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v31 objects:v36 count:16];
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
  uint64_t v7 = [v5 bundleSuperType];
  if (v7 == [v6 bundleSuperType]
    && (uint64_t v8 = [v5 bundleSubType], v8 == objc_msgSend(v6, "bundleSubType"))
    && (uint64_t v9 = [v5 interfaceType], v9 == objc_msgSend(v6, "interfaceType")))
  {
    uint64_t v10 = [v5 summarizationGranularity];
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
        char v25 = [(id)v12 isEqualToString:v13];
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
        char v25 = [v9 isEqual:v10];
      }
      BOOL v14 = v25;
      goto LABEL_22;
    }
    id v17 = (id)v12;
    id v18 = (id)v13;
    if (![v17 intersectsDateInterval:v18]) {
      goto LABEL_14;
    }
    uint64_t v19 = [v17 intersectionWithDateInterval:v18];
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
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v33 = a4;
  uint64_t v35 = objc_opt_new();
  long long v34 = objc_opt_new();
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v32 = v7;
  uint64_t v8 = [v7 resources];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v41 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        if ([v13 type] == a5)
        {
          id v14 = [NSString alloc];
          double v15 = [v13 name];
          double v16 = [v13 assets];
          [v13 value];
          id v18 = (void *)[v14 initWithFormat:@"%@,%@,%f", v15, v16, v17];

          if (v18) {
            [v35 addObject:v18];
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v10);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v19 = [v33 resources];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v37;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v37 != v22) {
          objc_enumerationMutation(v19);
        }
        double v24 = *(void **)(*((void *)&v36 + 1) + 8 * j);
        if ([v24 type] == a5)
        {
          id v25 = [NSString alloc];
          id v26 = [v24 name];
          double v27 = [v24 assets];
          [v24 value];
          double v29 = (void *)[v25 initWithFormat:@"%@,%@,%f", v26, v27, v28];

          if (v29) {
            [v34 addObject:v29];
          }
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v36 objects:v44 count:16];
    }
    while (v21);
  }

  char v30 = [v35 isEqualToSet:v34];
  return v30;
}

- (BOOL)isEqualPersonsForObject:(id)a3 other:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  uint64_t v8 = objc_opt_new();
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v9 = [v5 persons];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
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
      uint64_t v11 = [v9 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v11);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v17 = objc_msgSend(v6, "persons", 0);
  uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void **)(*((void *)&v27 + 1) + 8 * j);
        double v23 = [v22 contactIdentifier];

        if (v23)
        {
          double v24 = [v22 contactIdentifier];
          [v8 addObject:v24];
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v19);
  }

  char v25 = [v7 isEqualToSet:v8];
  return v25;
}

- (BOOL)isEqualBaseActionForObject:(id)a3 other:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [a3 action];
  uint64_t v7 = [v5 action];

  if (v6 | v7)
  {
    char v8 = 0;
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
      uint64_t v11 = [(id)v6 actionType];
      if (v11 == [(id)v7 actionType])
      {
        uint64_t v12 = [(id)v6 actionName];
        uint64_t v13 = [(id)v7 actionName];
        char v8 = [v12 isEqualToString:v13];
      }
      else
      {
        char v8 = 0;
      }
    }
  }
  else
  {
    char v8 = 1;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (MOEventBundle *)a3;
  uint64_t v6 = v5;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    if (v5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v7 = v6;
        char v8 = [(MOEventBundle *)self bundleIdentifier];
        if (v8
          || ([(MOEventBundle *)v7 bundleIdentifier],
              (unint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          BOOL v9 = [(MOEventBundle *)self bundleIdentifier];
          BOOL v10 = [(MOEventBundle *)v7 bundleIdentifier];
          char v11 = [v9 isEqual:v10];

          if (v8)
          {
LABEL_12:

            goto LABEL_13;
          }
        }
        else
        {
          char v11 = 1;
        }

        goto LABEL_12;
      }
    }
    char v11 = 0;
  }
LABEL_13:

  return v11;
}

- (BOOL)containTheSameEventSet:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    uint64_t v6 = [(MOEventBundle *)self events];
    uint64_t v7 = (void *)[v6 mutableCopy];

    char v8 = [v5 events];

    BOOL v9 = (void *)[v8 mutableCopy];
    BOOL v10 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"startDate" ascending:1];
    v18[0] = v10;
    char v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    uint64_t v12 = [v7 sortedArrayUsingDescriptors:v11];

    uint64_t v17 = v10;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
    id v14 = [v9 sortedArrayUsingDescriptors:v13];

    char v15 = [v12 isEqualToArray:v14];
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

- (BOOL)shareEvents:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
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
    uint64_t v7 = [v5 events];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v43 objects:v49 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
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
        uint64_t v9 = [v7 countByEnumeratingWithState:&v43 objects:v49 count:16];
      }
      while (v9);
    }

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id obj = [(MOEventBundle *)self events];
    uint64_t v15 = [obj countByEnumeratingWithState:&v39 objects:v48 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      char v33 = 0;
      uint64_t v34 = *(void *)v40;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v40 != v34) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void **)(*((void *)&v39 + 1) + 8 * j);
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          id v19 = v6;
          uint64_t v20 = [v19 countByEnumeratingWithState:&v35 objects:v47 count:16];
          if (v20)
          {
            uint64_t v21 = v20;
            uint64_t v22 = v6;
            uint64_t v23 = *(void *)v36;
            while (2)
            {
              for (uint64_t k = 0; k != v21; ++k)
              {
                if (*(void *)v36 != v23) {
                  objc_enumerationMutation(v19);
                }
                char v25 = *(void **)(*((void *)&v35 + 1) + 8 * k);
                id v26 = [v18 eventIdentifier];
                uint64_t v27 = [v25 compare:v26];

                if (!v27)
                {
                  char v33 = 1;
                  goto LABEL_27;
                }
              }
              uint64_t v21 = [v19 countByEnumeratingWithState:&v35 objects:v47 count:16];
              if (v21) {
                continue;
              }
              break;
            }
LABEL_27:
            uint64_t v6 = v22;
          }
        }
        uint64_t v16 = [obj countByEnumeratingWithState:&v39 objects:v48 count:16];
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
    uint64_t v8 = [[MOEventBundleLabelFormatter alloc] initWithTemplatePath:v6];
  }
  else {
    uint64_t v8 = (MOEventBundleLabelFormatter *)objc_opt_new();
  }
  uint64_t v9 = v8;
  uint64_t v10 = [(MOEventBundle *)self getCustomLabelsForMetaData:v7 labelFormatter:v8];

  return v10;
}

- (id)getCustomLabelsForMetaData:(id)a3 labelFormatter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v8 = [(MOEventBundle *)self getBundleType];
    uint64_t v9 = [v7 formattedBundleLabelsForMetaData:v6 bundleType:v8];
  }
  else
  {
    uint64_t v8 = [(MOEventBundle *)self metaData];
    uint64_t v10 = [(MOEventBundle *)self getBundleType];
    uint64_t v9 = [v7 formattedBundleLabelsForMetaData:v8 bundleType:v10];

    id v7 = (id)v10;
  }

  return v9;
}

- (id)getCustomPromptsForMetaData:(id)a3 templateFilePath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if (v6) {
    uint64_t v8 = [[MOEventBundleLabelFormatter alloc] initWithTemplatePath:v6];
  }
  else {
    uint64_t v8 = (MOEventBundleLabelFormatter *)objc_opt_new();
  }
  uint64_t v9 = v8;
  uint64_t v10 = [(MOEventBundle *)self getCustomPromptsForMetaData:v7 labelFormatter:v8];

  return v10;
}

- (id)getCustomPromptsForMetaData:(id)a3 labelFormatter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v8 = [(MOEventBundle *)self getBundleType];
    uint64_t v9 = [v7 formattedBundlePromptsForMetaData:v6 bundleType:v8];
  }
  else
  {
    uint64_t v8 = [(MOEventBundle *)self metaData];
    uint64_t v10 = [(MOEventBundle *)self getBundleType];
    uint64_t v9 = [v7 formattedBundlePromptsForMetaData:v8 bundleType:v10];

    id v7 = (id)v10;
  }

  return v9;
}

- (BOOL)hasSuggestionEngagementEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(MOEventBundle *)self suggestionEngagementEvents];
  char v6 = [v5 containsObject:v4];

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
  char v6 = v8;
  if (v8)
  {
    id v7 = [(MOEventBundle *)self suggestionEngagementEvents];
    [v7 addObject:v8];

    char v6 = v8;
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
  char v6 = [v5 containsObject:v4];

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
  char v6 = v8;
  if (v8)
  {
    id v7 = [(MOEventBundle *)self appEntryEngagementEvents];
    [v7 addObject:v8];

    char v6 = v8;
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
  unint64_t v3 = [(MOEventBundle *)self endDate];
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

- (id)primarySourceTypes
{
  v26[1] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(MOEventBundle *)self interfaceType];
  id v4 = (void *)MEMORY[0x1E4F1CBF0];
  switch(v3)
  {
    case 1uLL:
      v26[0] = MOEventBundleSourceTypeActivity;
      double v5 = (void *)MEMORY[0x1E4F1C978];
      double v6 = (__CFString **)v26;
      goto LABEL_30;
    case 2uLL:
    case 0xDuLL:
      char v25 = MOEventBundleSourceTypeVisitLocation;
      double v5 = (void *)MEMORY[0x1E4F1C978];
      double v6 = &v25;
      goto LABEL_30;
    case 3uLL:
    case 0xAuLL:
      uint64_t v23 = MOEventBundleSourceTypePhoto;
      double v5 = (void *)MEMORY[0x1E4F1C978];
      double v6 = &v23;
      goto LABEL_30;
    case 4uLL:
      uint64_t v22 = MOEventBundleSourceTypeContact;
      double v5 = (void *)MEMORY[0x1E4F1C978];
      double v6 = &v22;
      goto LABEL_30;
    case 5uLL:
      uint64_t v21 = MOEventBundleSourceTypeMedia;
      double v5 = (void *)MEMORY[0x1E4F1C978];
      double v6 = &v21;
      goto LABEL_30;
    case 7uLL:
      v24[0] = MOEventBundleSourceTypeVisitLocation;
      v24[1] = MOEventBundleSourceTypePhoto;
      double v5 = (void *)MEMORY[0x1E4F1C978];
      double v6 = (__CFString **)v24;
      goto LABEL_8;
    case 9uLL:
      unint64_t v8 = [(MOEventBundle *)self bundleSubType];
      switch(v8)
      {
        case 0x268uLL:
          uint64_t v16 = MOEventBundleSourceTypePhoto;
          double v5 = (void *)MEMORY[0x1E4F1C978];
          double v6 = &v16;
          goto LABEL_30;
        case 0x12FuLL:
          uint64_t v17 = MOEventBundleSourceTypeContact;
          double v5 = (void *)MEMORY[0x1E4F1C978];
          double v6 = &v17;
          goto LABEL_30;
        case 0xCBuLL:
          uint64_t v18 = MOEventBundleSourceTypeActivity;
          double v5 = (void *)MEMORY[0x1E4F1C978];
          double v6 = &v18;
          goto LABEL_30;
      }
      id v4 = (void *)MEMORY[0x1E4F1CBF0];
      goto LABEL_32;
    case 0xBuLL:
      uint64_t v20 = MOEventBundleSourceTypeReflectionPrompt;
      double v5 = (void *)MEMORY[0x1E4F1C978];
      double v6 = &v20;
      goto LABEL_30;
    case 0xCuLL:
      uint64_t v9 = [(MOEventBundle *)self bundleSubType];
      id v4 = (void *)MEMORY[0x1E4F1CBF0];
      if (v9 <= 204)
      {
        if ((unint64_t)(v9 - 101) >= 5)
        {
          if ((unint64_t)(v9 - 201) >= 4) {
            goto LABEL_32;
          }
          id v14 = MOEventBundleSourceTypeActivity;
          double v5 = (void *)MEMORY[0x1E4F1C978];
          double v6 = &v14;
        }
        else
        {
          uint64_t v15 = MOEventBundleSourceTypeVisitLocation;
          double v5 = (void *)MEMORY[0x1E4F1C978];
          double v6 = &v15;
        }
        goto LABEL_30;
      }
      if ((unint64_t)(v9 - 401) <= 4 && ((1 << (v9 + 111)) & 0x19) != 0)
      {
        char v11 = MOEventBundleSourceTypeMedia;
        double v5 = (void *)MEMORY[0x1E4F1C978];
        double v6 = &v11;
LABEL_30:
        uint64_t v7 = 1;
        goto LABEL_31;
      }
      if ((unint64_t)(v9 - 205) >= 2)
      {
        if (v9 != 302) {
          goto LABEL_32;
        }
        uint64_t v12 = MOEventBundleSourceTypeContact;
        double v5 = (void *)MEMORY[0x1E4F1C978];
        double v6 = &v12;
        goto LABEL_30;
      }
      v13[0] = MOEventBundleSourceTypeActivity;
      v13[1] = MOEventBundleSourceTypeVisitLocation;
      double v5 = (void *)MEMORY[0x1E4F1C978];
      double v6 = (__CFString **)v13;
LABEL_8:
      uint64_t v7 = 2;
LABEL_31:
      id v4 = [v5 arrayWithObjects:v6 count:v7];
LABEL_32:
      return v4;
    case 0xEuLL:
      id v19 = MOEventBundleSourceTypeStateOfMind;
      double v5 = (void *)MEMORY[0x1E4F1C978];
      double v6 = &v19;
      goto LABEL_30;
    default:
      goto LABEL_32;
  }
}

- (void)initWithBundleIdentifier:suggestionID:startDate:endDate:creationDate:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1D24AE000, v0, v1, "Invalid parameter not satisfying: bundleIdentifier", v2, v3, v4, v5, v6);
}

- (void)initWithBundleIdentifier:suggestionID:startDate:endDate:creationDate:.cold.2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1D24AE000, v0, v1, "Invalid parameter not satisfying: suggestionID", v2, v3, v4, v5, v6);
}

- (void)dateInterval
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = 138412802;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  uint64_t v5 = "-[MOEventBundle dateInterval]";
  __int16 v6 = 1024;
  int v7 = 1471;
  _os_log_error_impl(&dword_1D24AE000, a2, OS_LOG_TYPE_ERROR, "startDate is NOT earlier than endDate, bundle, %@ (in %s:%d)", (uint8_t *)&v2, 0x1Cu);
}

@end