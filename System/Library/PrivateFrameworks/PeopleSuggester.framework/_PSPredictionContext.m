@interface _PSPredictionContext
+ (BOOL)supportsSecureCoding;
- (BOOL)isCancelled;
- (BOOL)isCollaborationAvailable;
- (BOOL)isCoreMLValidationFetch;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFallbackFetch;
- (BOOL)isPSRActive;
- (BOOL)isSharePlayAvailable;
- (BOOL)showPotentialFamilyMembers;
- (BOOL)supportsZKWSuggestions;
- (BOOL)timedOut;
- (MLMultiArray)coreMLInputFeatureTensor;
- (NSArray)attachments;
- (NSArray)candidateShareExtensionBundleIds;
- (NSArray)coreMLModelFeatureOrder;
- (NSArray)linkMetadataFromClient;
- (NSArray)locationUUIDs;
- (NSArray)peopleInPhotoIdentifiers;
- (NSArray)photoSuggestedPeople;
- (NSArray)scenesInPhotoIdentifiers;
- (NSArray)seedContactIdentifiers;
- (NSArray)seedRecipients;
- (NSArray)suggestionsFilteredByBundleIds;
- (NSArray)supportedBundleIds;
- (NSDate)queryStartDate;
- (NSDate)suggestionCompletionDate;
- (NSDate)suggestionDate;
- (NSDictionary)appBundleIdsToShareExtensionBundleIdsMapping;
- (NSDictionary)coreMLTensorIndexToCandidate;
- (NSDictionary)scoredCoreMLCandidates;
- (NSNumber)coreMLNumberOfCandidates;
- (NSString)accountIdentifier;
- (NSString)bundleID;
- (NSString)currentSpanId;
- (NSString)reasonType;
- (NSString)searchPrefix;
- (NSString)sessionID;
- (NSString)suggestionPath;
- (NSString)trialDeploymentId;
- (NSString)trialExperimentId;
- (NSString)trialTreatmentId;
- (NSUUID)locationUUID;
- (_PSPredictionContext)init;
- (_PSPredictionContext)initWithCoder:(id)a3;
- (int64_t)feedBack;
- (int64_t)locationType;
- (int64_t)suggestionPurpose;
- (unint64_t)hash;
- (unint64_t)totalHashOfElementsFromArray:(id)a3;
- (void)cancel;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setAppBundleIdsToShareExtensionBundleIdsMapping:(id)a3;
- (void)setAttachments:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setCandidateShareExtensionBundleIds:(id)a3;
- (void)setCoreMLInputFeatureTensor:(id)a3;
- (void)setCoreMLModelFeatureOrder:(id)a3;
- (void)setCoreMLNumberOfCandidates:(id)a3;
- (void)setCoreMLTensorIndexToCandidate:(id)a3;
- (void)setCurrentSpanId:(id)a3;
- (void)setFeedBack:(int64_t)a3;
- (void)setIsCollaborationAvailable:(BOOL)a3;
- (void)setIsCoreMLValidationFetch:(BOOL)a3;
- (void)setIsFallbackFetch:(BOOL)a3;
- (void)setIsPSRActive:(BOOL)a3;
- (void)setIsSharePlayAvailable:(BOOL)a3;
- (void)setLinkMetadataFromClient:(id)a3;
- (void)setLocationType:(int64_t)a3;
- (void)setLocationUUID:(id)a3;
- (void)setLocationUUIDs:(id)a3;
- (void)setPeopleInPhotoIdentifiers:(id)a3;
- (void)setPhotoSuggestedPeople:(id)a3;
- (void)setQueryStartDate:(id)a3;
- (void)setReasonType:(id)a3;
- (void)setScenesInPhotoIdentifiers:(id)a3;
- (void)setScoredCoreMLCandidates:(id)a3;
- (void)setSearchPrefix:(id)a3;
- (void)setSeedContactIdentifiers:(id)a3;
- (void)setSeedRecipients:(id)a3;
- (void)setSessionID:(id)a3;
- (void)setShowPotentialFamilyMembers:(BOOL)a3;
- (void)setSuggestionCompletionDate:(id)a3;
- (void)setSuggestionDate:(id)a3;
- (void)setSuggestionPath:(id)a3;
- (void)setSuggestionPurpose:(int64_t)a3;
- (void)setSuggestionsFilteredByBundleIds:(id)a3;
- (void)setSupportedBundleIds:(id)a3;
- (void)setTimedOut:(BOOL)a3;
- (void)setTrialDeploymentId:(id)a3;
- (void)setTrialExperimentId:(id)a3;
- (void)setTrialTreatmentId:(id)a3;
- (void)sync:(id)a3;
@end

@implementation _PSPredictionContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_PSPredictionContext)init
{
  v24.receiver = self;
  v24.super_class = (Class)_PSPredictionContext;
  v2 = [(_PSPredictionContext *)&v24 init];
  v3 = v2;
  if (v2)
  {
    sessionID = v2->_sessionID;
    v2->_sessionID = 0;

    suggestionDate = v3->_suggestionDate;
    v3->_suggestionDate = 0;

    locationUUID = v3->_locationUUID;
    v3->_locationUUID = 0;

    locationUUIDs = v3->_locationUUIDs;
    v3->_locationUUIDs = 0;

    bundleID = v3->_bundleID;
    v3->_bundleID = 0;

    accountIdentifier = v3->_accountIdentifier;
    v3->_accountIdentifier = 0;

    seedRecipients = v3->_seedRecipients;
    v3->_seedRecipients = 0;

    attachments = v3->_attachments;
    v3->_attachments = 0;

    photoSuggestedPeople = v3->_photoSuggestedPeople;
    v3->_photoSuggestedPeople = 0;

    *(_WORD *)&v3->_showPotentialFamilyMembers = 0;
    searchPrefix = v3->_searchPrefix;
    v3->_searchPrefix = 0;

    suggestionsFilteredByBundleIds = v3->_suggestionsFilteredByBundleIds;
    v3->_suggestionPurpose = 0;
    v3->_suggestionsFilteredByBundleIds = 0;

    seedContactIdentifiers = v3->_seedContactIdentifiers;
    v3->_seedContactIdentifiers = 0;

    v3->_isCollaborationAvailable = 0;
    linkMetadataFromClient = v3->_linkMetadataFromClient;
    v3->_linkMetadataFromClient = 0;

    peopleInPhotoIdentifiers = v3->_peopleInPhotoIdentifiers;
    v3->_peopleInPhotoIdentifiers = 0;

    scenesInPhotoIdentifiers = v3->_scenesInPhotoIdentifiers;
    v3->_scenesInPhotoIdentifiers = 0;

    v3->_isCoreMLValidationFetch = 0;
    *(_WORD *)&v3->_timedOut = 0;
    suggestionCompletionDate = v3->_suggestionCompletionDate;
    v3->_suggestionCompletionDate = 0;

    suggestionPath = v3->_suggestionPath;
    v3->_suggestionPath = 0;

    v3->_isPSRActive = 0;
    supportedBundleIds = v3->_supportedBundleIds;
    v3->_supportedBundleIds = 0;

    currentSpanId = v3->_currentSpanId;
    v3->_currentSpanId = 0;

    v3->_feedBack = -1;
    atomic_store(0, (unsigned __int8 *)&v3->_isCancelled);
  }
  return v3;
}

- (NSDate)suggestionDate
{
  suggestionDate = self->_suggestionDate;
  if (!suggestionDate)
  {
    v4 = [MEMORY[0x1E4F1C9C8] date];
    v5 = self->_suggestionDate;
    self->_suggestionDate = v4;

    suggestionDate = self->_suggestionDate;
  }

  return suggestionDate;
}

- (_PSPredictionContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v125.receiver = self;
  v125.super_class = (Class)_PSPredictionContext;
  v5 = [(_PSPredictionContext *)&v125 init];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"sessionID"];
    sessionID = v5->_sessionID;
    v5->_sessionID = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"suggestionDate"];
    suggestionDate = v5->_suggestionDate;
    v5->_suggestionDate = (NSDate *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"locationUUID"];
    locationUUID = v5->_locationUUID;
    v5->_locationUUID = (NSUUID *)v11;

    v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_opt_class();
    v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"locationUUIDs"];
    locationUUIDs = v5->_locationUUIDs;
    v5->_locationUUIDs = (NSArray *)v16;

    v5->_locationType = [v4 decodeIntegerForKey:@"locationType"];
    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleID"];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountIdentifier"];
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v20;

    v22 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v23 = objc_opt_class();
    objc_super v24 = objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
    uint64_t v25 = [v4 decodeObjectOfClasses:v24 forKey:@"seedRecipients"];
    seedRecipients = v5->_seedRecipients;
    v5->_seedRecipients = (NSArray *)v25;

    v27 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v28 = objc_opt_class();
    v29 = objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
    uint64_t v30 = [v4 decodeObjectOfClasses:v29 forKey:@"attachments"];
    attachments = v5->_attachments;
    v5->_attachments = (NSArray *)v30;

    v32 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v33 = objc_opt_class();
    uint64_t v34 = objc_opt_class();
    v35 = objc_msgSend(v32, "setWithObjects:", v33, v34, objc_opt_class(), 0);
    uint64_t v36 = [v4 decodeObjectOfClasses:v35 forKey:@"appBundleIdsToShareExtensionBundleIdsMapping"];
    appBundleIdsToShareExtensionBundleIdsMapping = v5->_appBundleIdsToShareExtensionBundleIdsMapping;
    v5->_appBundleIdsToShareExtensionBundleIdsMapping = (NSDictionary *)v36;

    v38 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v39 = objc_opt_class();
    uint64_t v40 = objc_opt_class();
    uint64_t v41 = objc_opt_class();
    v42 = objc_msgSend(v38, "setWithObjects:", v39, v40, v41, objc_opt_class(), 0);
    uint64_t v43 = [v4 decodeObjectOfClasses:v42 forKey:@"photoSuggestedPeople"];
    photoSuggestedPeople = v5->_photoSuggestedPeople;
    v5->_photoSuggestedPeople = (NSArray *)v43;

    v5->_showPotentialFamilyMembers = [v4 decodeBoolForKey:@"showPotentialFamilyMembers"];
    v5->_isSharePlayAvailable = [v4 decodeBoolForKey:@"isSharePlayAvailable"];
    uint64_t v45 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"searchPrefix"];
    searchPrefix = v5->_searchPrefix;
    v5->_searchPrefix = (NSString *)v45;

    v5->_suggestionPurpose = [v4 decodeInt64ForKey:@"suggestionPurpose"];
    v47 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v48 = objc_opt_class();
    v49 = objc_msgSend(v47, "setWithObjects:", v48, objc_opt_class(), 0);
    uint64_t v50 = [v4 decodeObjectOfClasses:v49 forKey:@"suggestionsFilteredByBundleIds"];
    suggestionsFilteredByBundleIds = v5->_suggestionsFilteredByBundleIds;
    v5->_suggestionsFilteredByBundleIds = (NSArray *)v50;

    v52 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v53 = objc_opt_class();
    v54 = objc_msgSend(v52, "setWithObjects:", v53, objc_opt_class(), 0);
    uint64_t v55 = [v4 decodeObjectOfClasses:v54 forKey:@"seedContactIdentifiers"];
    seedContactIdentifiers = v5->_seedContactIdentifiers;
    v5->_seedContactIdentifiers = (NSArray *)v55;

    v5->_isCollaborationAvailable = [v4 decodeBoolForKey:@"isCollaborationAvailable"];
    if ([v4 containsValueForKey:@"linkMetadataFromClient"])
    {
      v57 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v58 = objc_opt_class();
      uint64_t v131 = 0;
      v132 = &v131;
      uint64_t v133 = 0x2050000000;
      v59 = (void *)getLPLinkMetadataClass_softClass;
      uint64_t v134 = getLPLinkMetadataClass_softClass;
      if (!getLPLinkMetadataClass_softClass)
      {
        uint64_t v126 = MEMORY[0x1E4F143A8];
        uint64_t v127 = 3221225472;
        v128 = __getLPLinkMetadataClass_block_invoke;
        v129 = &unk_1E5ADE858;
        v130 = &v131;
        __getLPLinkMetadataClass_block_invoke((uint64_t)&v126);
        v59 = (void *)v132[3];
      }
      id v60 = v59;
      _Block_object_dispose(&v131, 8);
      v61 = objc_msgSend(v57, "setWithObjects:", v58, objc_opt_class(), 0);
      uint64_t v62 = [v4 decodeObjectOfClasses:v61 forKey:@"linkMetadataFromClient"];
      linkMetadataFromClient = v5->_linkMetadataFromClient;
      v5->_linkMetadataFromClient = (NSArray *)v62;
    }
    v64 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v65 = objc_opt_class();
    v66 = objc_msgSend(v64, "setWithObjects:", v65, objc_opt_class(), 0);
    uint64_t v67 = [v4 decodeObjectOfClasses:v66 forKey:@"peopleInPhotoIdentifiers"];
    peopleInPhotoIdentifiers = v5->_peopleInPhotoIdentifiers;
    v5->_peopleInPhotoIdentifiers = (NSArray *)v67;

    v69 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v70 = objc_opt_class();
    v71 = objc_msgSend(v69, "setWithObjects:", v70, objc_opt_class(), 0);
    uint64_t v72 = [v4 decodeObjectOfClasses:v71 forKey:@"scenesInPhotoIdentifiers"];
    scenesInPhotoIdentifiers = v5->_scenesInPhotoIdentifiers;
    v5->_scenesInPhotoIdentifiers = (NSArray *)v72;

    v5->_isFallbackFetch = [v4 decodeBoolForKey:@"isFallbackFetch"];
    v5->_isCoreMLValidationFetch = [v4 decodeBoolForKey:@"isCoreMLValidationFetch"];
    v74 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v75 = objc_opt_class();
    uint64_t v76 = objc_opt_class();
    uint64_t v77 = objc_opt_class();
    v78 = objc_msgSend(v74, "setWithObjects:", v75, v76, v77, objc_opt_class(), 0);
    uint64_t v79 = [v4 decodeObjectOfClasses:v78 forKey:@"scoredCoreMLCandidates"];
    scoredCoreMLCandidates = v5->_scoredCoreMLCandidates;
    v5->_scoredCoreMLCandidates = (NSDictionary *)v79;

    if ([v4 containsValueForKey:@"coreMLInputFeatureTensor"])
    {
      v81 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v131 = 0;
      v132 = &v131;
      uint64_t v133 = 0x2050000000;
      v82 = (void *)getMLMultiArrayClass_softClass_3;
      uint64_t v134 = getMLMultiArrayClass_softClass_3;
      if (!getMLMultiArrayClass_softClass_3)
      {
        uint64_t v126 = MEMORY[0x1E4F143A8];
        uint64_t v127 = 3221225472;
        v128 = __getMLMultiArrayClass_block_invoke_3;
        v129 = &unk_1E5ADE858;
        v130 = &v131;
        __getMLMultiArrayClass_block_invoke_3((uint64_t)&v126);
        v82 = (void *)v132[3];
      }
      id v83 = v82;
      _Block_object_dispose(&v131, 8);
      v84 = objc_msgSend(v81, "setWithObjects:", objc_opt_class(), 0);
      uint64_t v85 = [v4 decodeObjectOfClasses:v84 forKey:@"coreMLInputFeatureTensor"];
      coreMLInputFeatureTensor = v5->_coreMLInputFeatureTensor;
      v5->_coreMLInputFeatureTensor = (MLMultiArray *)v85;
    }
    v87 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v88 = objc_opt_class();
    v89 = objc_msgSend(v87, "setWithObjects:", v88, objc_opt_class(), 0);
    uint64_t v90 = [v4 decodeObjectOfClasses:v89 forKey:@"coreMLModelFeatureOrder"];
    coreMLModelFeatureOrder = v5->_coreMLModelFeatureOrder;
    v5->_coreMLModelFeatureOrder = (NSArray *)v90;

    v92 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v93 = objc_opt_class();
    uint64_t v94 = objc_opt_class();
    v95 = objc_msgSend(v92, "setWithObjects:", v93, v94, objc_opt_class(), 0);
    uint64_t v96 = [v4 decodeObjectOfClasses:v95 forKey:@"coreMLTensorIndexToCandidate"];
    coreMLTensorIndexToCandidate = v5->_coreMLTensorIndexToCandidate;
    v5->_coreMLTensorIndexToCandidate = (NSDictionary *)v96;

    uint64_t v98 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"coreMLNumberOfCandidates"];
    coreMLNumberOfCandidates = v5->_coreMLNumberOfCandidates;
    v5->_coreMLNumberOfCandidates = (NSNumber *)v98;

    uint64_t v100 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"trialExperimentId"];
    trialExperimentId = v5->_trialExperimentId;
    v5->_trialExperimentId = (NSString *)v100;

    uint64_t v102 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"trialTreatmentId"];
    trialTreatmentId = v5->_trialTreatmentId;
    v5->_trialTreatmentId = (NSString *)v102;

    uint64_t v104 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"trialDeploymentId"];
    trialDeploymentId = v5->_trialDeploymentId;
    v5->_trialDeploymentId = (NSString *)v104;

    uint64_t v106 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentSpanId"];
    currentSpanId = v5->_currentSpanId;
    v5->_currentSpanId = (NSString *)v106;

    uint64_t v108 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reasonType"];
    reasonType = v5->_reasonType;
    v5->_reasonType = (NSString *)v108;

    v5->_timedOut = [v4 decodeBoolForKey:@"timedOut"];
    uint64_t v110 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"suggestionCompletionDate"];
    suggestionCompletionDate = v5->_suggestionCompletionDate;
    v5->_suggestionCompletionDate = (NSDate *)v110;

    uint64_t v112 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"suggestionPath"];
    suggestionPath = v5->_suggestionPath;
    v5->_suggestionPath = (NSString *)v112;

    v5->_isPSRActive = [v4 decodeBoolForKey:@"isPSRActive"];
    v114 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v115 = objc_opt_class();
    v116 = objc_msgSend(v114, "setWithObjects:", v115, objc_opt_class(), 0);
    uint64_t v117 = [v4 decodeObjectOfClasses:v116 forKey:@"supportedBundleIds"];
    supportedBundleIds = v5->_supportedBundleIds;
    v5->_supportedBundleIds = (NSArray *)v117;

    v119 = (void *)MEMORY[0x1A6243860]();
    v120 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v121 = [v4 decodeObjectOfClasses:v120 forKey:@"queryStartDate"];
    queryStartDate = v5->_queryStartDate;
    v5->_queryStartDate = (NSDate *)v121;

    v5->_feedBack = [v4 decodeIntegerForKey:@"feedBack"];
    v123 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  sessionID = self->_sessionID;
  id v5 = a3;
  [v5 encodeObject:sessionID forKey:@"sessionID"];
  [v5 encodeObject:self->_suggestionDate forKey:@"suggestionDate"];
  [v5 encodeObject:self->_locationUUID forKey:@"locationUUID"];
  [v5 encodeObject:self->_locationUUIDs forKey:@"locationUUIDs"];
  [v5 encodeInteger:self->_locationType forKey:@"locationType"];
  [v5 encodeObject:self->_bundleID forKey:@"bundleID"];
  [v5 encodeObject:self->_accountIdentifier forKey:@"accountIdentifier"];
  [v5 encodeObject:self->_seedRecipients forKey:@"seedRecipients"];
  [v5 encodeObject:self->_attachments forKey:@"attachments"];
  [v5 encodeObject:self->_appBundleIdsToShareExtensionBundleIdsMapping forKey:@"appBundleIdsToShareExtensionBundleIdsMapping"];
  [v5 encodeObject:self->_photoSuggestedPeople forKey:@"photoSuggestedPeople"];
  [v5 encodeBool:self->_showPotentialFamilyMembers forKey:@"showPotentialFamilyMembers"];
  [v5 encodeBool:self->_isSharePlayAvailable forKey:@"isSharePlayAvailable"];
  [v5 encodeObject:self->_searchPrefix forKey:@"searchPrefix"];
  [v5 encodeInt64:self->_suggestionPurpose forKey:@"suggestionPurpose"];
  [v5 encodeObject:self->_suggestionsFilteredByBundleIds forKey:@"suggestionsFilteredByBundleIds"];
  [v5 encodeObject:self->_seedContactIdentifiers forKey:@"seedContactIdentifiers"];
  [v5 encodeBool:self->_isCollaborationAvailable forKey:@"isCollaborationAvailable"];
  [v5 encodeObject:self->_linkMetadataFromClient forKey:@"linkMetadataFromClient"];
  [v5 encodeObject:self->_peopleInPhotoIdentifiers forKey:@"peopleInPhotoIdentifiers"];
  [v5 encodeObject:self->_scenesInPhotoIdentifiers forKey:@"scenesInPhotoIdentifiers"];
  [v5 encodeBool:self->_isFallbackFetch forKey:@"isFallbackFetch"];
  [v5 encodeBool:self->_isCoreMLValidationFetch forKey:@"isCoreMLValidationFetch"];
  [v5 encodeObject:self->_scoredCoreMLCandidates forKey:@"scoredCoreMLCandidates"];
  [v5 encodeObject:self->_coreMLInputFeatureTensor forKey:@"coreMLInputFeatureTensor"];
  [v5 encodeObject:self->_coreMLModelFeatureOrder forKey:@"coreMLModelFeatureOrder"];
  [v5 encodeObject:self->_coreMLTensorIndexToCandidate forKey:@"coreMLTensorIndexToCandidate"];
  [v5 encodeObject:self->_coreMLNumberOfCandidates forKey:@"coreMLNumberOfCandidates"];
  [v5 encodeObject:self->_trialExperimentId forKey:@"trialExperimentId"];
  [v5 encodeObject:self->_trialTreatmentId forKey:@"trialTreatmentId"];
  [v5 encodeObject:self->_trialDeploymentId forKey:@"trialDeploymentId"];
  [v5 encodeObject:self->_currentSpanId forKey:@"currentSpanId"];
  [v5 encodeObject:self->_reasonType forKey:@"reasonType"];
  [v5 encodeBool:self->_timedOut forKey:@"timedOut"];
  [v5 encodeObject:self->_suggestionCompletionDate forKey:@"suggestionCompletionDate"];
  [v5 encodeObject:self->_suggestionPath forKey:@"suggestionPath"];
  [v5 encodeBool:self->_isPSRActive forKey:@"isPSRActive"];
  [v5 encodeObject:self->_supportedBundleIds forKey:@"supportedBundleIds"];
  [v5 encodeObject:self->_queryStartDate forKey:@"queryStartDate"];
  [v5 encodeInteger:self->_feedBack forKey:@"feedBack"];
}

- (unint64_t)totalHashOfElementsFromArray:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  if (v3
    && (long long v13 = 0u,
        long long v14 = 0u,
        long long v11 = 0u,
        long long v12 = 0u,
        (uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16]) != 0))
  {
    uint64_t v6 = v5;
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v4);
        }
        v7 ^= [*(id *)(*((void *)&v11 + 1) + 8 * i) hash];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v3 = [(_PSPredictionContext *)self seedRecipients];
  unint64_t v35 = [(_PSPredictionContext *)self totalHashOfElementsFromArray:v3];

  id v4 = [(_PSPredictionContext *)self locationUUIDs];
  unint64_t v34 = [(_PSPredictionContext *)self totalHashOfElementsFromArray:v4];

  uint64_t v5 = [(_PSPredictionContext *)self attachments];
  unint64_t v33 = [(_PSPredictionContext *)self totalHashOfElementsFromArray:v5];

  uint64_t v6 = [(_PSPredictionContext *)self suggestionsFilteredByBundleIds];
  unint64_t v32 = [(_PSPredictionContext *)self totalHashOfElementsFromArray:v6];

  unint64_t v7 = [(_PSPredictionContext *)self seedContactIdentifiers];
  unint64_t v31 = [(_PSPredictionContext *)self totalHashOfElementsFromArray:v7];

  uint64_t v8 = [(_PSPredictionContext *)self linkMetadataFromClient];
  unint64_t v30 = [(_PSPredictionContext *)self totalHashOfElementsFromArray:v8];

  uint64_t v9 = [(_PSPredictionContext *)self peopleInPhotoIdentifiers];
  unint64_t v10 = [(_PSPredictionContext *)self totalHashOfElementsFromArray:v9];

  long long v11 = [(_PSPredictionContext *)self scenesInPhotoIdentifiers];
  unint64_t v12 = [(_PSPredictionContext *)self totalHashOfElementsFromArray:v11];

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v13 = self->_photoSuggestedPeople;
  uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = 0;
    uint64_t v17 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v41 != v17) {
          objc_enumerationMutation(v13);
        }
        v19 = objc_msgSend(*(id *)(*((void *)&v40 + 1) + 8 * i), "objectForKeyedSubscript:", @"contactIdentifier", v30);
        v16 ^= [v19 hash];
      }
      uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v15);
  }
  else
  {
    uint64_t v16 = 0;
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v20 = self->_appBundleIdsToShareExtensionBundleIdsMapping;
  uint64_t v21 = [(NSDictionary *)v20 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = 0;
    uint64_t v24 = *(void *)v37;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v37 != v24) {
          objc_enumerationMutation(v20);
        }
        v23 ^= objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * j), "hash", v30);
      }
      uint64_t v22 = [(NSDictionary *)v20 countByEnumeratingWithState:&v36 objects:v44 count:16];
    }
    while (v22);
  }
  else
  {
    uint64_t v23 = 0;
  }

  NSUInteger v26 = [(NSString *)self->_sessionID hash];
  uint64_t v27 = [(NSDate *)self->_suggestionDate hash];
  NSUInteger v28 = [(NSString *)self->_bundleID hash];
  return v34 ^ v35 ^ v33 ^ v32 ^ v31 ^ v30 ^ v10 ^ v26 ^ v27 ^ v28 ^ [(NSString *)self->_accountIdentifier hash] ^ self->_showPotentialFamilyMembers ^ self->_isSharePlayAvailable ^ v12 ^ v16 ^ v23 ^ self->_suggestionPurpose ^ self->_locationType ^ self->_isCollaborationAvailable ^ self->_isFallbackFetch;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v135 = *MEMORY[0x1E4F143B8];
  id v4 = (_PSPredictionContext *)a3;
  uint64_t v5 = v4;
  if (self == v4)
  {
    LOBYTE(v28) = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = v5;
    uint64_t v7 = [(_PSPredictionContext *)self sessionID];
    if (v7)
    {
      uint64_t v8 = (void *)v7;
      uint64_t v9 = [(_PSPredictionContext *)v6 sessionID];

      if (v9)
      {
        unint64_t v10 = [(_PSPredictionContext *)self sessionID];
        long long v11 = [(_PSPredictionContext *)v6 sessionID];
        int v12 = [v10 isEqualToString:v11];

        if (!v12) {
          goto LABEL_16;
        }
      }
    }
    uint64_t v13 = [(_PSPredictionContext *)self bundleID];
    if (v13)
    {
      uint64_t v14 = (void *)v13;
      uint64_t v15 = [(_PSPredictionContext *)v6 bundleID];

      if (v15)
      {
        uint64_t v16 = [(_PSPredictionContext *)self bundleID];
        uint64_t v17 = [(_PSPredictionContext *)v6 bundleID];
        int v18 = [v16 isEqualToString:v17];

        if (!v18) {
          goto LABEL_16;
        }
      }
    }
    uint64_t v19 = [(_PSPredictionContext *)self accountIdentifier];
    if (v19)
    {
      uint64_t v20 = (void *)v19;
      uint64_t v21 = [(_PSPredictionContext *)v6 accountIdentifier];

      if (v21)
      {
        uint64_t v22 = [(_PSPredictionContext *)self accountIdentifier];
        uint64_t v23 = [(_PSPredictionContext *)v6 accountIdentifier];
        int v24 = [v22 isEqualToString:v23];

        if (!v24) {
          goto LABEL_16;
        }
      }
    }
    if ((BOOL v25 = [(_PSPredictionContext *)self showPotentialFamilyMembers],
          v25 != [(_PSPredictionContext *)v6 showPotentialFamilyMembers])
      || (BOOL v26 = [(_PSPredictionContext *)self isSharePlayAvailable],
          v26 != [(_PSPredictionContext *)v6 isSharePlayAvailable])
      || (BOOL v27 = [(_PSPredictionContext *)self isCollaborationAvailable],
          v27 != [(_PSPredictionContext *)v6 isCollaborationAvailable])
      || [(_PSPredictionContext *)self suggestionPurpose]
      && [(_PSPredictionContext *)v6 suggestionPurpose]
      && (int64_t v30 = [(_PSPredictionContext *)self suggestionPurpose],
          v30 != [(_PSPredictionContext *)v6 suggestionPurpose])
      || [(_PSPredictionContext *)self locationType]
      && [(_PSPredictionContext *)v6 locationType]
      && (int64_t v31 = [(_PSPredictionContext *)self locationType],
          v31 != [(_PSPredictionContext *)v6 locationType]))
    {
LABEL_16:
      LOBYTE(v28) = 0;
    }
    else
    {
      id v32 = objc_alloc(MEMORY[0x1E4F1CA80]);
      unint64_t v33 = [(_PSPredictionContext *)self seedRecipients];
      unint64_t v34 = (void *)[v32 initWithArray:v33];

      id v35 = objc_alloc(MEMORY[0x1E4F1CA80]);
      long long v36 = [(_PSPredictionContext *)v6 seedRecipients];
      long long v37 = (void *)[v35 initWithArray:v36];

      uint64_t v38 = [v34 count];
      if (v38 == [v37 count] && objc_msgSend(v34, "isEqualToSet:", v37))
      {
        [v34 count];
        id v39 = objc_alloc(MEMORY[0x1E4F1CA80]);
        long long v40 = [(_PSPredictionContext *)self locationUUIDs];
        long long v41 = (void *)[v39 initWithArray:v40];

        id v42 = objc_alloc(MEMORY[0x1E4F1CA80]);
        long long v43 = [(_PSPredictionContext *)v6 locationUUIDs];
        v44 = (void *)[v42 initWithArray:v43];

        uint64_t v45 = [v41 count];
        if (v45 == [v44 count] && objc_msgSend(v41, "isEqualToSet:", v44))
        {
          [v41 count];
          id v46 = objc_alloc(MEMORY[0x1E4F1CA80]);
          v47 = [(_PSPredictionContext *)self attachments];
          uint64_t v48 = (void *)[v46 initWithArray:v47];

          id v49 = objc_alloc(MEMORY[0x1E4F1CA80]);
          uint64_t v50 = [(_PSPredictionContext *)v6 attachments];
          uint64_t v51 = [v49 initWithArray:v50];

          v52 = (void *)v51;
          uint64_t v53 = [v48 count];
          if (v53 == [v52 count] && objc_msgSend(v48, "isEqualToSet:", v52))
          {
            uint64_t v121 = v41;
            v122 = v52;
            v120 = v44;
            v123 = v48;
            [v48 count];
            id v54 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
            uint64_t v55 = [(_PSPredictionContext *)self photoSuggestedPeople];
            uint64_t v56 = [v55 count];

            if (v56)
            {
              unint64_t v57 = 0;
              do
              {
                uint64_t v58 = [(_PSPredictionContext *)self photoSuggestedPeople];
                v59 = [v58 objectAtIndexedSubscript:v57];
                id v60 = [v59 objectForKeyedSubscript:@"contactIdentifier"];

                [v54 addObject:v60];
                ++v57;
                v61 = [(_PSPredictionContext *)self photoSuggestedPeople];
                unint64_t v62 = [v61 count];
              }
              while (v62 > v57);
            }
            v124 = v54;
            id v63 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
            v64 = [(_PSPredictionContext *)v6 photoSuggestedPeople];
            uint64_t v65 = [v64 count];

            if (v65)
            {
              unint64_t v66 = 0;
              do
              {
                uint64_t v67 = [(_PSPredictionContext *)v6 photoSuggestedPeople];
                v68 = [v67 objectAtIndexedSubscript:v66];
                v69 = [v68 objectForKeyedSubscript:@"contactIdentifier"];

                [v63 addObject:v69];
                ++v66;
                uint64_t v70 = [(_PSPredictionContext *)v6 photoSuggestedPeople];
                unint64_t v71 = [v70 count];
              }
              while (v71 > v66);
            }
            uint64_t v72 = v124;
            uint64_t v73 = [v124 count];
            uint64_t v74 = [v63 count];
            uint64_t v75 = v63;
            if (v73 == v74)
            {
              id v118 = v63;
              v119 = v37;
              if (objc_msgSend(v124, "isEqualToSet:"))
              {
                [v124 count];
                id v76 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
                long long v129 = 0u;
                long long v130 = 0u;
                long long v131 = 0u;
                long long v132 = 0u;
                uint64_t v77 = [(_PSPredictionContext *)self appBundleIdsToShareExtensionBundleIdsMapping];
                uint64_t v78 = [v77 countByEnumeratingWithState:&v129 objects:v134 count:16];
                if (v78)
                {
                  uint64_t v79 = v78;
                  uint64_t v80 = *(void *)v130;
                  do
                  {
                    for (uint64_t i = 0; i != v79; ++i)
                    {
                      if (*(void *)v130 != v80) {
                        objc_enumerationMutation(v77);
                      }
                      [v76 addObject:*(void *)(*((void *)&v129 + 1) + 8 * i)];
                    }
                    uint64_t v79 = [v77 countByEnumeratingWithState:&v129 objects:v134 count:16];
                  }
                  while (v79);
                }

                id v82 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
                long long v125 = 0u;
                long long v126 = 0u;
                long long v127 = 0u;
                long long v128 = 0u;
                id v83 = [(_PSPredictionContext *)v6 appBundleIdsToShareExtensionBundleIdsMapping];
                uint64_t v84 = [v83 countByEnumeratingWithState:&v125 objects:v133 count:16];
                if (v84)
                {
                  uint64_t v85 = v84;
                  uint64_t v86 = *(void *)v126;
                  do
                  {
                    for (uint64_t j = 0; j != v85; ++j)
                    {
                      if (*(void *)v126 != v86) {
                        objc_enumerationMutation(v83);
                      }
                      [v82 addObject:*(void *)(*((void *)&v125 + 1) + 8 * j)];
                    }
                    uint64_t v85 = [v83 countByEnumeratingWithState:&v125 objects:v133 count:16];
                  }
                  while (v85);
                }

                uint64_t v88 = [v76 count];
                if (v88 == [v82 count] && objc_msgSend(v76, "isEqualToSet:", v82))
                {
                  [v76 count];
                  id v89 = objc_alloc(MEMORY[0x1E4F1CAD0]);
                  uint64_t v90 = [(_PSPredictionContext *)self suggestionsFilteredByBundleIds];
                  v91 = (void *)[v89 initWithArray:v90];

                  id v92 = objc_alloc(MEMORY[0x1E4F1CAD0]);
                  uint64_t v93 = [(_PSPredictionContext *)v6 suggestionsFilteredByBundleIds];
                  uint64_t v94 = [v92 initWithArray:v93];

                  v116 = (void *)v94;
                  uint64_t v117 = v91;
                  if ([v91 isEqualToSet:v94])
                  {
                    [v91 count];
                    id v95 = objc_alloc(MEMORY[0x1E4F1CAD0]);
                    uint64_t v96 = [(_PSPredictionContext *)self seedContactIdentifiers];
                    v97 = (void *)[v95 initWithArray:v96];

                    id v98 = objc_alloc(MEMORY[0x1E4F1CAD0]);
                    v99 = [(_PSPredictionContext *)v6 seedContactIdentifiers];
                    uint64_t v100 = [v98 initWithArray:v99];

                    v114 = (void *)v100;
                    uint64_t v115 = v97;
                    if ([v97 isEqualToSet:v100])
                    {
                      [v97 count];
                      id v101 = objc_alloc(MEMORY[0x1E4F1CAD0]);
                      uint64_t v102 = [(_PSPredictionContext *)self linkMetadataFromClient];
                      v103 = (void *)[v101 initWithArray:v102];

                      id v104 = objc_alloc(MEMORY[0x1E4F1CAD0]);
                      v105 = [(_PSPredictionContext *)v6 linkMetadataFromClient];
                      uint64_t v106 = [v104 initWithArray:v105];

                      v113 = (void *)v106;
                      if ([v103 isEqualToSet:v106])
                      {
                        [v103 count];
                        id v107 = objc_alloc(MEMORY[0x1E4F1CAD0]);
                        uint64_t v108 = [(_PSPredictionContext *)self peopleInPhotoIdentifiers];
                        v109 = (void *)[v107 initWithArray:v108];

                        id v110 = objc_alloc(MEMORY[0x1E4F1CAD0]);
                        v111 = [(_PSPredictionContext *)v6 peopleInPhotoIdentifiers];
                        uint64_t v112 = (void *)[v110 initWithArray:v111];

                        int v28 = [v109 isEqualToSet:v112];
                        if (v28) {
                          [v109 count];
                        }
                      }
                      else
                      {
                        LOBYTE(v28) = 0;
                      }
                    }
                    else
                    {
                      LOBYTE(v28) = 0;
                    }
                  }
                  else
                  {
                    LOBYTE(v28) = 0;
                  }
                }
                else
                {
                  LOBYTE(v28) = 0;
                }

                long long v37 = v119;
                v44 = v120;
                long long v41 = v121;
                uint64_t v72 = v124;
              }
              else
              {
                LOBYTE(v28) = 0;
                v44 = v120;
                long long v41 = v121;
              }
              uint64_t v75 = v118;
            }
            else
            {
              LOBYTE(v28) = 0;
              v44 = v120;
              long long v41 = v121;
            }

            v52 = v122;
            uint64_t v48 = v123;
          }
          else
          {
            LOBYTE(v28) = 0;
          }
        }
        else
        {
          LOBYTE(v28) = 0;
        }
      }
      else
      {
        LOBYTE(v28) = 0;
      }
    }
  }
  else
  {
    LOBYTE(v28) = 0;
  }

  return v28;
}

- (BOOL)supportsZKWSuggestions
{
  if (supportsZKWSuggestions_onceToken != -1) {
    dispatch_once(&supportsZKWSuggestions_onceToken, &__block_literal_global_41);
  }
  id v3 = (void *)supportsZKWSuggestions_supportedBundleIds;
  id v4 = [(_PSPredictionContext *)self bundleID];
  LOBYTE(v3) = [v3 containsObject:v4];

  return (char)v3;
}

- (void)sync:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 attachments];
  [(_PSPredictionContext *)self setAttachments:v5];

  uint64_t v6 = [v4 photoSuggestedPeople];
  [(_PSPredictionContext *)self setPhotoSuggestedPeople:v6];

  uint64_t v7 = [v4 trialExperimentId];
  [(_PSPredictionContext *)self setTrialExperimentId:v7];

  uint64_t v8 = [v4 trialTreatmentId];
  [(_PSPredictionContext *)self setTrialTreatmentId:v8];

  uint64_t v9 = [v4 trialDeploymentId];
  [(_PSPredictionContext *)self setTrialDeploymentId:v9];

  -[_PSPredictionContext setIsPSRActive:](self, "setIsPSRActive:", [v4 isPSRActive]);
  unint64_t v10 = [v4 reasonType];
  [(_PSPredictionContext *)self setReasonType:v10];

  id v11 = [v4 supportedBundleIds];

  [(_PSPredictionContext *)self setSupportedBundleIds:v11];
}

- (void)cancel
{
}

- (BOOL)isCancelled
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_isCancelled);
  return v2 & 1;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (void)setSuggestionDate:(id)a3
{
}

- (NSUUID)locationUUID
{
  return self->_locationUUID;
}

- (void)setLocationUUID:(id)a3
{
}

- (NSArray)locationUUIDs
{
  return self->_locationUUIDs;
}

- (void)setLocationUUIDs:(id)a3
{
}

- (int64_t)locationType
{
  return self->_locationType;
}

- (void)setLocationType:(int64_t)a3
{
  self->_locationType = a3;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (NSArray)seedRecipients
{
  return self->_seedRecipients;
}

- (void)setSeedRecipients:(id)a3
{
}

- (NSArray)candidateShareExtensionBundleIds
{
  return self->_candidateShareExtensionBundleIds;
}

- (void)setCandidateShareExtensionBundleIds:(id)a3
{
}

- (NSDictionary)appBundleIdsToShareExtensionBundleIdsMapping
{
  return self->_appBundleIdsToShareExtensionBundleIdsMapping;
}

- (void)setAppBundleIdsToShareExtensionBundleIdsMapping:(id)a3
{
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (void)setAttachments:(id)a3
{
}

- (NSArray)photoSuggestedPeople
{
  return self->_photoSuggestedPeople;
}

- (void)setPhotoSuggestedPeople:(id)a3
{
}

- (NSArray)peopleInPhotoIdentifiers
{
  return self->_peopleInPhotoIdentifiers;
}

- (void)setPeopleInPhotoIdentifiers:(id)a3
{
}

- (NSArray)scenesInPhotoIdentifiers
{
  return self->_scenesInPhotoIdentifiers;
}

- (void)setScenesInPhotoIdentifiers:(id)a3
{
}

- (NSArray)linkMetadataFromClient
{
  return self->_linkMetadataFromClient;
}

- (void)setLinkMetadataFromClient:(id)a3
{
}

- (BOOL)showPotentialFamilyMembers
{
  return self->_showPotentialFamilyMembers;
}

- (void)setShowPotentialFamilyMembers:(BOOL)a3
{
  self->_showPotentialFamilyMembers = a3;
}

- (BOOL)isSharePlayAvailable
{
  return self->_isSharePlayAvailable;
}

- (void)setIsSharePlayAvailable:(BOOL)a3
{
  self->_isSharePlayAvailable = a3;
}

- (BOOL)isCollaborationAvailable
{
  return self->_isCollaborationAvailable;
}

- (void)setIsCollaborationAvailable:(BOOL)a3
{
  self->_isCollaborationAvailable = a3;
}

- (BOOL)timedOut
{
  return self->_timedOut;
}

- (void)setTimedOut:(BOOL)a3
{
  self->_timedOut = a3;
}

- (int64_t)suggestionPurpose
{
  return self->_suggestionPurpose;
}

- (void)setSuggestionPurpose:(int64_t)a3
{
  self->_suggestionPurpose = a3;
}

- (NSArray)suggestionsFilteredByBundleIds
{
  return self->_suggestionsFilteredByBundleIds;
}

- (void)setSuggestionsFilteredByBundleIds:(id)a3
{
}

- (NSArray)seedContactIdentifiers
{
  return self->_seedContactIdentifiers;
}

- (void)setSeedContactIdentifiers:(id)a3
{
}

- (NSString)searchPrefix
{
  return self->_searchPrefix;
}

- (void)setSearchPrefix:(id)a3
{
}

- (BOOL)isFallbackFetch
{
  return self->_isFallbackFetch;
}

- (void)setIsFallbackFetch:(BOOL)a3
{
  self->_isFallbackFetch = a3;
}

- (BOOL)isCoreMLValidationFetch
{
  return self->_isCoreMLValidationFetch;
}

- (void)setIsCoreMLValidationFetch:(BOOL)a3
{
  self->_isCoreMLValidationFetch = a3;
}

- (NSDictionary)scoredCoreMLCandidates
{
  return self->_scoredCoreMLCandidates;
}

- (void)setScoredCoreMLCandidates:(id)a3
{
}

- (MLMultiArray)coreMLInputFeatureTensor
{
  return self->_coreMLInputFeatureTensor;
}

- (void)setCoreMLInputFeatureTensor:(id)a3
{
}

- (NSArray)coreMLModelFeatureOrder
{
  return self->_coreMLModelFeatureOrder;
}

- (void)setCoreMLModelFeatureOrder:(id)a3
{
}

- (NSDictionary)coreMLTensorIndexToCandidate
{
  return self->_coreMLTensorIndexToCandidate;
}

- (void)setCoreMLTensorIndexToCandidate:(id)a3
{
}

- (NSNumber)coreMLNumberOfCandidates
{
  return self->_coreMLNumberOfCandidates;
}

- (void)setCoreMLNumberOfCandidates:(id)a3
{
}

- (int64_t)feedBack
{
  return self->_feedBack;
}

- (void)setFeedBack:(int64_t)a3
{
  self->_feedBack = a3;
}

- (NSString)trialExperimentId
{
  return self->_trialExperimentId;
}

- (void)setTrialExperimentId:(id)a3
{
}

- (NSString)trialTreatmentId
{
  return self->_trialTreatmentId;
}

- (void)setTrialTreatmentId:(id)a3
{
}

- (NSString)trialDeploymentId
{
  return self->_trialDeploymentId;
}

- (void)setTrialDeploymentId:(id)a3
{
}

- (NSString)reasonType
{
  return self->_reasonType;
}

- (void)setReasonType:(id)a3
{
}

- (NSString)currentSpanId
{
  return self->_currentSpanId;
}

- (void)setCurrentSpanId:(id)a3
{
}

- (NSDate)queryStartDate
{
  return self->_queryStartDate;
}

- (void)setQueryStartDate:(id)a3
{
}

- (NSDate)suggestionCompletionDate
{
  return self->_suggestionCompletionDate;
}

- (void)setSuggestionCompletionDate:(id)a3
{
}

- (NSString)suggestionPath
{
  return self->_suggestionPath;
}

- (void)setSuggestionPath:(id)a3
{
}

- (BOOL)isPSRActive
{
  return self->_isPSRActive;
}

- (void)setIsPSRActive:(BOOL)a3
{
  self->_isPSRActive = a3;
}

- (NSArray)supportedBundleIds
{
  return self->_supportedBundleIds;
}

- (void)setSupportedBundleIds:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedBundleIds, 0);
  objc_storeStrong((id *)&self->_suggestionPath, 0);
  objc_storeStrong((id *)&self->_suggestionCompletionDate, 0);
  objc_storeStrong((id *)&self->_queryStartDate, 0);
  objc_storeStrong((id *)&self->_currentSpanId, 0);
  objc_storeStrong((id *)&self->_reasonType, 0);
  objc_storeStrong((id *)&self->_trialDeploymentId, 0);
  objc_storeStrong((id *)&self->_trialTreatmentId, 0);
  objc_storeStrong((id *)&self->_trialExperimentId, 0);
  objc_storeStrong((id *)&self->_coreMLNumberOfCandidates, 0);
  objc_storeStrong((id *)&self->_coreMLTensorIndexToCandidate, 0);
  objc_storeStrong((id *)&self->_coreMLModelFeatureOrder, 0);
  objc_storeStrong((id *)&self->_coreMLInputFeatureTensor, 0);
  objc_storeStrong((id *)&self->_scoredCoreMLCandidates, 0);
  objc_storeStrong((id *)&self->_searchPrefix, 0);
  objc_storeStrong((id *)&self->_seedContactIdentifiers, 0);
  objc_storeStrong((id *)&self->_suggestionsFilteredByBundleIds, 0);
  objc_storeStrong((id *)&self->_linkMetadataFromClient, 0);
  objc_storeStrong((id *)&self->_scenesInPhotoIdentifiers, 0);
  objc_storeStrong((id *)&self->_peopleInPhotoIdentifiers, 0);
  objc_storeStrong((id *)&self->_photoSuggestedPeople, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_appBundleIdsToShareExtensionBundleIdsMapping, 0);
  objc_storeStrong((id *)&self->_candidateShareExtensionBundleIds, 0);
  objc_storeStrong((id *)&self->_seedRecipients, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_locationUUIDs, 0);
  objc_storeStrong((id *)&self->_locationUUID, 0);
  objc_storeStrong((id *)&self->_suggestionDate, 0);

  objc_storeStrong((id *)&self->_sessionID, 0);
}

@end