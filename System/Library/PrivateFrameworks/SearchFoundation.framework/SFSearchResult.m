@interface SFSearchResult
+ (BOOL)supportsSecureCoding;
+ (id)fallbackBundleId;
+ (id)fallbackImageSymbolName;
+ (id)fallbackSectionBundleIdentifier;
- (BOOL)containsPersonalResult;
- (BOOL)didRerankPersonalResult;
- (BOOL)didTakeoverGo;
- (BOOL)doNotFold;
- (BOOL)hasAppTopHitShortcut;
- (BOOL)isCentered;
- (BOOL)isFuzzyMatch;
- (BOOL)isInstantAnswer;
- (BOOL)isLocalApplicationResult;
- (BOOL)isMailInstantAnswerUpdated;
- (BOOL)isQuickGlance;
- (BOOL)isSecondaryTitleDetached;
- (BOOL)isStaticCorrection;
- (BOOL)isStreaming;
- (BOOL)isVideoAssetFromPhotos;
- (BOOL)noGoTakeover;
- (BOOL)preferTopPlatter;
- (BOOL)preventThumbnailImageScaling;
- (BOOL)publiclyIndexable;
- (BOOL)renderHorizontallyWithOtherResultsInCategory;
- (BOOL)shouldAutoNavigate;
- (BOOL)shouldUseCompactDisplay;
- (BOOL)usesCompactDisplay;
- (BOOL)usesTopHitDisplay;
- (BOOL)wasCompact;
- (NSArray)alternativeURLs;
- (NSArray)contentTypeTree;
- (NSArray)descriptions;
- (NSArray)itemProviderDataTypes;
- (NSArray)itemProviderFileTypes;
- (NSData)entityData;
- (NSData)jsonData;
- (NSData)mapsData;
- (NSDictionary)dictionaryRepresentation;
- (NSDictionary)localFeatures;
- (NSDictionary)serverFeatures;
- (NSNumber)engagementScore;
- (NSNumber)indexOfResultInSectionWhenRanked;
- (NSNumber)indexOfSectionWhenRanked;
- (NSNumber)maxAge;
- (NSNumber)queryIndependentScore;
- (NSNumber)titleNoteSize;
- (NSString)appleReferrer;
- (NSString)applicationBundleIdentifier;
- (NSString)auxiliaryBottomText;
- (NSString)auxiliaryMiddleText;
- (NSString)auxiliaryTopText;
- (NSString)calendarIdentifier;
- (NSString)completedQuery;
- (NSString)completion;
- (NSString)contactIdentifier;
- (NSString)contentType;
- (NSString)correctedQuery;
- (NSString)domainName;
- (NSString)entityIdentifier;
- (NSString)entityType;
- (NSString)fbr;
- (NSString)fileProviderDomainIdentifier;
- (NSString)fileProviderIdentifier;
- (NSString)footnote;
- (NSString)identifier;
- (NSString)intendedQuery;
- (NSString)mapsMoreString;
- (NSString)mapsResultType;
- (NSString)mediaType;
- (NSString)nearbyBusinessesString;
- (NSString)publishDate;
- (NSString)resultBundleId;
- (NSString)resultTemplate;
- (NSString)resultType;
- (NSString)secondaryTitle;
- (NSString)sectionBundleIdentifier;
- (NSString)sectionHeader;
- (NSString)sectionHeaderMore;
- (NSString)sourceName;
- (NSString)srf;
- (NSString)storeIdentifier;
- (NSString)titleNote;
- (NSString)userActivityRequiredString;
- (NSString)userInput;
- (NSURL)mapsMoreURL;
- (NSURL)sectionHeaderMoreURL;
- (NSURL)url;
- (SFActionItem)action;
- (SFCard)card;
- (SFCard)compactCard;
- (SFCard)inlineCard;
- (SFCard)tophitCard;
- (SFCommandButtonItem)moreResultsButton;
- (SFCoreSpotlightRankingSignals)coreSpotlightRankingSignals;
- (SFCustom)customProperties;
- (SFImage)completionImage;
- (SFImage)icon;
- (SFImage)mapsMoreIcon;
- (SFImage)secondaryTitleImage;
- (SFImage)thumbnail;
- (SFMailRankingSignals)mailRankingSignals;
- (SFMailResultDetails)mailResultDetails;
- (SFMoreResults)moreResults;
- (SFPhotosAggregatedInfo)photosAggregatedInfo;
- (SFPhotosAttributes)photosAttributes;
- (SFPunchout)moreResultsPunchout;
- (SFPunchout)punchout;
- (SFResultEntity)resultEntity;
- (SFSafariAttributes)safariAttributes;
- (SFSearchResult)initWithCoder:(id)a3;
- (SFSearchResult)initWithQueryTopic:(id)a3;
- (SFSearchResult)initWithSearchResult:(id)a3;
- (SFText)title;
- (SFTopic)normalizedTopic;
- (SFTopic)requestedTopic;
- (double)personalizationScore;
- (double)rankingScore;
- (double)serverScore;
- (id)copyWithZone:(_NSZone *)a3;
- (int)auxiliaryBottomTextColor;
- (int)coreSpotlightIndexUsed;
- (int)coreSpotlightIndexUsedReason;
- (int)placement;
- (int)topHit;
- (int)type;
- (int64_t)dataOwnerType;
- (unint64_t)blockId;
- (unint64_t)minimumRankOfTopHitToSuppressResult;
- (unint64_t)queryId;
- (void)encodeWithCoder:(id)a3;
- (void)setAction:(id)a3;
- (void)setAlternativeURLs:(id)a3;
- (void)setAppleReferrer:(id)a3;
- (void)setApplicationBundleIdentifier:(id)a3;
- (void)setAuxiliaryBottomText:(id)a3;
- (void)setAuxiliaryBottomTextColor:(int)a3;
- (void)setAuxiliaryMiddleText:(id)a3;
- (void)setAuxiliaryTopText:(id)a3;
- (void)setBlockId:(unint64_t)a3;
- (void)setCalendarIdentifier:(id)a3;
- (void)setCard:(id)a3;
- (void)setCompactCard:(id)a3;
- (void)setCompletedQuery:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setCompletionImage:(id)a3;
- (void)setContactIdentifier:(id)a3;
- (void)setContainsPersonalResult:(BOOL)a3;
- (void)setContentType:(id)a3;
- (void)setContentTypeTree:(id)a3;
- (void)setCoreSpotlightIndexUsed:(int)a3;
- (void)setCoreSpotlightIndexUsedReason:(int)a3;
- (void)setCoreSpotlightRankingSignals:(id)a3;
- (void)setCorrectedQuery:(id)a3;
- (void)setCustomProperties:(id)a3;
- (void)setDataOwnerType:(int64_t)a3;
- (void)setDescriptions:(id)a3;
- (void)setDidRerankPersonalResult:(BOOL)a3;
- (void)setDidTakeoverGo:(BOOL)a3;
- (void)setDoNotFold:(BOOL)a3;
- (void)setDomainName:(id)a3;
- (void)setEngagementScore:(id)a3;
- (void)setEntityData:(id)a3;
- (void)setEntityIdentifier:(id)a3;
- (void)setEntityType:(id)a3;
- (void)setFbr:(id)a3;
- (void)setFileProviderDomainIdentifier:(id)a3;
- (void)setFileProviderIdentifier:(id)a3;
- (void)setFootnote:(id)a3;
- (void)setHasAppTopHitShortcut:(BOOL)a3;
- (void)setIcon:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIndexOfResultInSectionWhenRanked:(id)a3;
- (void)setIndexOfSectionWhenRanked:(id)a3;
- (void)setInlineCard:(id)a3;
- (void)setIntendedQuery:(id)a3;
- (void)setIsCentered:(BOOL)a3;
- (void)setIsFuzzyMatch:(BOOL)a3;
- (void)setIsInstantAnswer:(BOOL)a3;
- (void)setIsLocalApplicationResult:(BOOL)a3;
- (void)setIsMailInstantAnswerUpdated:(BOOL)a3;
- (void)setIsQuickGlance:(BOOL)a3;
- (void)setIsSecondaryTitleDetached:(BOOL)a3;
- (void)setIsStaticCorrection:(BOOL)a3;
- (void)setIsStreaming:(BOOL)a3;
- (void)setIsVideoAssetFromPhotos:(BOOL)a3;
- (void)setItemProviderDataTypes:(id)a3;
- (void)setItemProviderFileTypes:(id)a3;
- (void)setLocalFeatures:(id)a3;
- (void)setMailRankingSignals:(id)a3;
- (void)setMailResultDetails:(id)a3;
- (void)setMapsData:(id)a3;
- (void)setMapsMoreIcon:(id)a3;
- (void)setMapsMoreString:(id)a3;
- (void)setMapsMoreURL:(id)a3;
- (void)setMapsResultType:(id)a3;
- (void)setMaxAge:(id)a3;
- (void)setMediaType:(id)a3;
- (void)setMinimumRankOfTopHitToSuppressResult:(unint64_t)a3;
- (void)setMoreResults:(id)a3;
- (void)setMoreResultsButton:(id)a3;
- (void)setMoreResultsPunchout:(id)a3;
- (void)setNearbyBusinessesString:(id)a3;
- (void)setNoGoTakeover:(BOOL)a3;
- (void)setNormalizedTopic:(id)a3;
- (void)setPersonalizationScore:(double)a3;
- (void)setPhotosAggregatedInfo:(id)a3;
- (void)setPhotosAttributes:(id)a3;
- (void)setPlacement:(int)a3;
- (void)setPreferTopPlatter:(BOOL)a3;
- (void)setPreventThumbnailImageScaling:(BOOL)a3;
- (void)setPubliclyIndexable:(BOOL)a3;
- (void)setPublishDate:(id)a3;
- (void)setPunchout:(id)a3;
- (void)setQueryId:(unint64_t)a3;
- (void)setQueryIndependentScore:(id)a3;
- (void)setRankingScore:(double)a3;
- (void)setRenderHorizontallyWithOtherResultsInCategory:(BOOL)a3;
- (void)setRequestedTopic:(id)a3;
- (void)setResultBundleId:(id)a3;
- (void)setResultEntity:(id)a3;
- (void)setResultTemplate:(id)a3;
- (void)setResultType:(id)a3;
- (void)setSafariAttributes:(id)a3;
- (void)setSecondaryTitle:(id)a3;
- (void)setSecondaryTitleImage:(id)a3;
- (void)setSectionBundleIdentifier:(id)a3;
- (void)setSectionHeader:(id)a3;
- (void)setSectionHeaderMore:(id)a3;
- (void)setSectionHeaderMoreURL:(id)a3;
- (void)setServerFeatures:(id)a3;
- (void)setServerScore:(double)a3;
- (void)setShouldAutoNavigate:(BOOL)a3;
- (void)setShouldUseCompactDisplay:(BOOL)a3;
- (void)setSourceName:(id)a3;
- (void)setSrf:(id)a3;
- (void)setStoreIdentifier:(id)a3;
- (void)setThumbnail:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleNote:(id)a3;
- (void)setTitleNoteSize:(id)a3;
- (void)setTopHit:(int)a3;
- (void)setTophitCard:(id)a3;
- (void)setType:(int)a3;
- (void)setUrl:(id)a3;
- (void)setUserActivityRequiredString:(id)a3;
- (void)setUserInput:(id)a3;
- (void)setUsesCompactDisplay:(BOOL)a3;
- (void)setUsesTopHitDisplay:(BOOL)a3;
- (void)setWasCompact:(BOOL)a3;
- (void)updatePunchout;
@end

@implementation SFSearchResult

- (NSData)jsonData
{
  v2 = [(SFSearchResult *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(SFSearchResult *)self action];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"action"];

  v6 = [(SFSearchResult *)self applicationBundleIdentifier];

  if (v6)
  {
    v7 = [(SFSearchResult *)self applicationBundleIdentifier];
    v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"applicationBundleIdentifier"];
  }
  v9 = [(SFSearchResult *)self completedQuery];

  if (v9)
  {
    v10 = [(SFSearchResult *)self completedQuery];
    v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"completedQuery"];
  }
  v12 = [(SFSearchResult *)self correctedQuery];

  if (v12)
  {
    v13 = [(SFSearchResult *)self correctedQuery];
    v14 = (void *)[v13 copy];
    [v3 setObject:v14 forKeyedSubscript:@"correctedQuery"];
  }
  v15 = [(SFSearchResult *)self descriptions];
  uint64_t v16 = [v15 count];

  if (v16)
  {
    v17 = [MEMORY[0x1E4F1CA48] array];
    long long v88 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    v18 = [(SFSearchResult *)self descriptions];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v88 objects:v93 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v89;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v89 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = [*(id *)(*((void *)&v88 + 1) + 8 * i) dictionaryRepresentation];
          [v17 addObject:v23];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v88 objects:v93 count:16];
      }
      while (v20);
    }

    [v3 setObject:v17 forKeyedSubscript:@"descriptions"];
  }
  v24 = [(SFSearchResult *)self identifier];

  if (v24)
  {
    v25 = [(SFSearchResult *)self identifier];
    v26 = (void *)[v25 copy];
    [v3 setObject:v26 forKeyedSubscript:@"identifier"];
  }
  v27 = [(SFSearchResult *)self intendedQuery];

  if (v27)
  {
    v28 = [(SFSearchResult *)self intendedQuery];
    v29 = (void *)[v28 copy];
    [v3 setObject:v29 forKeyedSubscript:@"intendedQuery"];
  }
  v30 = [(SFSearchResult *)self fbr];

  if (v30)
  {
    v31 = [(SFSearchResult *)self fbr];
    v32 = (void *)[v31 copy];
    [v3 setObject:v32 forKeyedSubscript:@"fbr"];
  }
  v33 = objc_msgSend(NSNumber, "numberWithBool:", -[SFSearchResult isLocalApplicationResult](self, "isLocalApplicationResult"));
  [v3 setObject:v33 forKeyedSubscript:@"isLocalApplicationResult"];

  v34 = objc_msgSend(NSNumber, "numberWithBool:", -[SFSearchResult isStaticCorrection](self, "isStaticCorrection"));
  [v3 setObject:v34 forKeyedSubscript:@"isStaticCorrection"];

  v35 = objc_msgSend(NSNumber, "numberWithBool:", -[SFSearchResult isFuzzyMatch](self, "isFuzzyMatch"));
  [v3 setObject:v35 forKeyedSubscript:@"isFuzzyMatch"];

  v36 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  v37 = [(SFSearchResult *)self localFeatures];
  uint64_t v38 = [v37 countByEnumeratingWithState:&v84 objects:v92 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v85;
    do
    {
      for (uint64_t j = 0; j != v39; ++j)
      {
        if (*(void *)v85 != v40) {
          objc_enumerationMutation(v37);
        }
        uint64_t v42 = *(void *)(*((void *)&v84 + 1) + 8 * j);
        v43 = [(SFSearchResult *)self localFeatures];
        v44 = [v43 objectForKeyedSubscript:v42];
        [v36 setObject:v44 forKeyedSubscript:v42];
      }
      uint64_t v39 = [v37 countByEnumeratingWithState:&v84 objects:v92 count:16];
    }
    while (v39);
  }

  [v3 setObject:v36 forKeyedSubscript:@"localFeatures"];
  v45 = objc_msgSend(NSNumber, "numberWithBool:", -[SFSearchResult publiclyIndexable](self, "publiclyIndexable"));
  [v3 setObject:v45 forKeyedSubscript:@"publiclyIndexable"];

  v46 = [(SFSearchResult *)self punchout];
  v47 = [v46 dictionaryRepresentation];
  [v3 setObject:v47 forKeyedSubscript:@"punchout"];

  v48 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SFSearchResult queryId](self, "queryId"));
  [v3 setObject:v48 forKeyedSubscript:@"queryId"];

  v49 = NSNumber;
  [(SFSearchResult *)self rankingScore];
  v50 = objc_msgSend(v49, "numberWithDouble:");
  [v3 setObject:v50 forKeyedSubscript:@"rankingScore"];

  v51 = [(SFSearchResult *)self resultBundleId];

  if (v51)
  {
    v52 = [(SFSearchResult *)self resultBundleId];
    v53 = (void *)[v52 copy];
    [v3 setObject:v53 forKeyedSubscript:@"resultBundleId"];
  }
  v54 = [(SFSearchResult *)self resultType];

  if (v54)
  {
    v55 = [(SFSearchResult *)self resultType];
    v56 = (void *)[v55 copy];
    [v3 setObject:v56 forKeyedSubscript:@"resultType"];
  }
  v57 = [(SFSearchResult *)self sectionBundleIdentifier];

  if (v57)
  {
    v58 = [(SFSearchResult *)self sectionBundleIdentifier];
    v59 = (void *)[v58 copy];
    [v3 setObject:v59 forKeyedSubscript:@"sectionBundleIdentifier"];
  }
  v60 = [(SFSearchResult *)self title];
  v61 = [v60 dictionaryRepresentation];
  [v3 setObject:v61 forKeyedSubscript:@"title"];

  v62 = objc_msgSend(NSNumber, "numberWithInt:", -[SFSearchResult topHit](self, "topHit"));
  [v3 setObject:v62 forKeyedSubscript:@"topHit"];

  v63 = objc_msgSend(NSNumber, "numberWithInt:", -[SFSearchResult type](self, "type"));
  [v3 setObject:v63 forKeyedSubscript:@"type"];

  v64 = [(SFSearchResult *)self url];
  v65 = [v64 dictionaryRepresentation];
  [v3 setObject:v65 forKeyedSubscript:@"url"];

  v66 = [(SFSearchResult *)self inlineCard];

  if (v66)
  {
    v67 = [(SFSearchResult *)self inlineCard];
    v68 = [v67 dictionaryRepresentation];
    [v3 setObject:v68 forKeyedSubscript:@"inlineCard"];
  }
  v69 = [(SFSearchResult *)self card];

  if (v69)
  {
    v70 = [(SFSearchResult *)self card];
    v71 = [v70 dictionaryRepresentation];
    [v3 setObject:v71 forKeyedSubscript:@"card"];
  }
  v72 = [(SFSearchResult *)self thumbnail];

  if (v72)
  {
    v73 = [(SFSearchResult *)self thumbnail];
    v74 = [v73 dictionaryRepresentation];
    [v3 setObject:v74 forKeyedSubscript:@"thumbnail"];
  }
  v75 = [(SFSearchResult *)self secondaryTitle];

  if (v75)
  {
    v76 = [(SFSearchResult *)self secondaryTitle];
    v77 = (void *)[v76 copy];
    [v3 setObject:v77 forKeyedSubscript:@"secondaryTitle"];
  }
  v78 = [(SFSearchResult *)self footnote];

  if (v78)
  {
    v79 = [(SFSearchResult *)self footnote];
    v80 = (void *)[v79 copy];
    [v3 setObject:v80 forKeyedSubscript:@"footnote"];
  }
  if ([(SFSearchResult *)self doNotFold])
  {
    v81 = objc_msgSend(NSNumber, "numberWithBool:", -[SFSearchResult doNotFold](self, "doNotFold"));
    [v3 setObject:v81 forKeyedSubscript:@"doNotFold"];
  }
  if ([(SFSearchResult *)self blockId])
  {
    v82 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SFSearchResult blockId](self, "blockId"));
    [v3 setObject:v82 forKeyedSubscript:@"blockId"];
  }
  return (NSDictionary *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moreResultsButton, 0);
  objc_storeStrong((id *)&self->_photosAggregatedInfo, 0);
  objc_storeStrong((id *)&self->_photosAttributes, 0);
  objc_storeStrong((id *)&self->_entityType, 0);
  objc_storeStrong((id *)&self->_safariAttributes, 0);
  objc_storeStrong((id *)&self->_indexOfResultInSectionWhenRanked, 0);
  objc_storeStrong((id *)&self->_indexOfSectionWhenRanked, 0);
  objc_storeStrong((id *)&self->_resultEntity, 0);
  objc_storeStrong((id *)&self->_mailResultDetails, 0);
  objc_storeStrong((id *)&self->_mailRankingSignals, 0);
  objc_storeStrong((id *)&self->_coreSpotlightRankingSignals, 0);
  objc_storeStrong((id *)&self->_entityData, 0);
  objc_storeStrong((id *)&self->_srf, 0);
  objc_storeStrong((id *)&self->_fbr, 0);
  objc_storeStrong((id *)&self->_fileProviderDomainIdentifier, 0);
  objc_storeStrong((id *)&self->_fileProviderIdentifier, 0);
  objc_storeStrong((id *)&self->_contentTypeTree, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_itemProviderFileTypes, 0);
  objc_storeStrong((id *)&self->_itemProviderDataTypes, 0);
  objc_storeStrong((id *)&self->_userInput, 0);
  objc_storeStrong((id *)&self->_alternativeURLs, 0);
  objc_storeStrong((id *)&self->_compactCard, 0);
  objc_storeStrong((id *)&self->_completedQuery, 0);
  objc_storeStrong((id *)&self->_correctedQuery, 0);
  objc_storeStrong((id *)&self->_intendedQuery, 0);
  objc_storeStrong((id *)&self->_serverFeatures, 0);
  objc_storeStrong((id *)&self->_localFeatures, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_resultBundleId, 0);
  objc_storeStrong((id *)&self->_titleNoteSize, 0);
  objc_storeStrong((id *)&self->_titleNote, 0);
  objc_storeStrong((id *)&self->_maxAge, 0);
  objc_storeStrong((id *)&self->_queryIndependentScore, 0);
  objc_storeStrong((id *)&self->_engagementScore, 0);
  objc_storeStrong((id *)&self->_resultTemplate, 0);
  objc_storeStrong((id *)&self->_resultType, 0);
  objc_storeStrong((id *)&self->_customProperties, 0);
  objc_storeStrong((id *)&self->_mediaType, 0);
  objc_storeStrong((id *)&self->_domainName, 0);
  objc_storeStrong((id *)&self->_sectionHeaderMoreURL, 0);
  objc_storeStrong((id *)&self->_sectionHeaderMore, 0);
  objc_storeStrong((id *)&self->_sectionHeader, 0);
  objc_storeStrong((id *)&self->_userActivityRequiredString, 0);
  objc_storeStrong((id *)&self->_sectionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_requestedTopic, 0);
  objc_storeStrong((id *)&self->_normalizedTopic, 0);
  objc_storeStrong((id *)&self->_moreResultsPunchout, 0);
  objc_storeStrong((id *)&self->_moreResults, 0);
  objc_storeStrong((id *)&self->_tophitCard, 0);
  objc_storeStrong((id *)&self->_inlineCard, 0);
  objc_storeStrong((id *)&self->_card, 0);
  objc_storeStrong((id *)&self->_appleReferrer, 0);
  objc_storeStrong((id *)&self->_nearbyBusinessesString, 0);
  objc_storeStrong((id *)&self->_mapsMoreIcon, 0);
  objc_storeStrong((id *)&self->_mapsMoreString, 0);
  objc_storeStrong((id *)&self->_mapsMoreURL, 0);
  objc_storeStrong((id *)&self->_mapsResultType, 0);
  objc_storeStrong((id *)&self->_mapsData, 0);
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
  objc_storeStrong((id *)&self->_calendarIdentifier, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_punchout, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_auxiliaryBottomText, 0);
  objc_storeStrong((id *)&self->_auxiliaryMiddleText, 0);
  objc_storeStrong((id *)&self->_auxiliaryTopText, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_completionImage, 0);
  objc_storeStrong((id *)&self->_completion, 0);
  objc_storeStrong((id *)&self->_sourceName, 0);
  objc_storeStrong((id *)&self->_publishDate, 0);
  objc_storeStrong((id *)&self->_footnote, 0);
  objc_storeStrong((id *)&self->_descriptions, 0);
  objc_storeStrong((id *)&self->_secondaryTitleImage, 0);
  objc_storeStrong((id *)&self->_secondaryTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setMoreResultsButton:(id)a3
{
}

- (SFCommandButtonItem)moreResultsButton
{
  return self->_moreResultsButton;
}

- (void)setPhotosAggregatedInfo:(id)a3
{
}

- (SFPhotosAggregatedInfo)photosAggregatedInfo
{
  return self->_photosAggregatedInfo;
}

- (void)setPhotosAttributes:(id)a3
{
}

- (SFPhotosAttributes)photosAttributes
{
  return self->_photosAttributes;
}

- (void)setHasAppTopHitShortcut:(BOOL)a3
{
  self->_hasAppTopHitShortcut = a3;
}

- (BOOL)hasAppTopHitShortcut
{
  return self->_hasAppTopHitShortcut;
}

- (void)setEntityType:(id)a3
{
}

- (NSString)entityType
{
  return self->_entityType;
}

- (void)setSafariAttributes:(id)a3
{
}

- (SFSafariAttributes)safariAttributes
{
  return self->_safariAttributes;
}

- (void)setIndexOfResultInSectionWhenRanked:(id)a3
{
}

- (NSNumber)indexOfResultInSectionWhenRanked
{
  return self->_indexOfResultInSectionWhenRanked;
}

- (void)setIndexOfSectionWhenRanked:(id)a3
{
}

- (NSNumber)indexOfSectionWhenRanked
{
  return self->_indexOfSectionWhenRanked;
}

- (void)setIsMailInstantAnswerUpdated:(BOOL)a3
{
  self->_isMailInstantAnswerUpdated = a3;
}

- (BOOL)isMailInstantAnswerUpdated
{
  return self->_isMailInstantAnswerUpdated;
}

- (void)setResultEntity:(id)a3
{
}

- (SFResultEntity)resultEntity
{
  return self->_resultEntity;
}

- (void)setIsVideoAssetFromPhotos:(BOOL)a3
{
  self->_isVideoAssetFromPhotos = a3;
}

- (BOOL)isVideoAssetFromPhotos
{
  return self->_isVideoAssetFromPhotos;
}

- (void)setMailResultDetails:(id)a3
{
}

- (SFMailResultDetails)mailResultDetails
{
  return self->_mailResultDetails;
}

- (void)setMailRankingSignals:(id)a3
{
}

- (SFMailRankingSignals)mailRankingSignals
{
  return self->_mailRankingSignals;
}

- (void)setCoreSpotlightRankingSignals:(id)a3
{
}

- (SFCoreSpotlightRankingSignals)coreSpotlightRankingSignals
{
  return self->_coreSpotlightRankingSignals;
}

- (void)setCoreSpotlightIndexUsedReason:(int)a3
{
  self->_coreSpotlightIndexUsedReason = a3;
}

- (int)coreSpotlightIndexUsedReason
{
  return self->_coreSpotlightIndexUsedReason;
}

- (void)setCoreSpotlightIndexUsed:(int)a3
{
  self->_coreSpotlightIndexUsed = a3;
}

- (int)coreSpotlightIndexUsed
{
  return self->_coreSpotlightIndexUsed;
}

- (void)setDidRerankPersonalResult:(BOOL)a3
{
  self->_didRerankPersonalResult = a3;
}

- (BOOL)didRerankPersonalResult
{
  return self->_didRerankPersonalResult;
}

- (void)setContainsPersonalResult:(BOOL)a3
{
  self->_containsPersonalResult = a3;
}

- (BOOL)containsPersonalResult
{
  return self->_containsPersonalResult;
}

- (void)setShouldAutoNavigate:(BOOL)a3
{
  self->_shouldAutoNavigate = a3;
}

- (BOOL)shouldAutoNavigate
{
  return self->_shouldAutoNavigate;
}

- (void)setIsInstantAnswer:(BOOL)a3
{
  self->_isInstantAnswer = a3;
}

- (BOOL)isInstantAnswer
{
  return self->_isInstantAnswer;
}

- (void)setEntityData:(id)a3
{
}

- (NSData)entityData
{
  return self->_entityData;
}

- (void)setBlockId:(unint64_t)a3
{
  self->_blockId = a3;
}

- (unint64_t)blockId
{
  return self->_blockId;
}

- (void)setDoNotFold:(BOOL)a3
{
  self->_doNotFold = a3;
}

- (BOOL)doNotFold
{
  return self->_doNotFold;
}

- (void)setSrf:(id)a3
{
}

- (NSString)srf
{
  return self->_srf;
}

- (void)setFbr:(id)a3
{
}

- (NSString)fbr
{
  return self->_fbr;
}

- (void)setFileProviderDomainIdentifier:(id)a3
{
}

- (NSString)fileProviderDomainIdentifier
{
  return self->_fileProviderDomainIdentifier;
}

- (void)setFileProviderIdentifier:(id)a3
{
}

- (NSString)fileProviderIdentifier
{
  return self->_fileProviderIdentifier;
}

- (void)setDataOwnerType:(int64_t)a3
{
  self->_dataOwnerType = a3;
}

- (int64_t)dataOwnerType
{
  return self->_dataOwnerType;
}

- (void)setContentTypeTree:(id)a3
{
}

- (NSArray)contentTypeTree
{
  return self->_contentTypeTree;
}

- (void)setContentType:(id)a3
{
}

- (NSString)contentType
{
  return self->_contentType;
}

- (void)setItemProviderFileTypes:(id)a3
{
}

- (NSArray)itemProviderFileTypes
{
  return self->_itemProviderFileTypes;
}

- (void)setItemProviderDataTypes:(id)a3
{
}

- (NSArray)itemProviderDataTypes
{
  return self->_itemProviderDataTypes;
}

- (void)setUserInput:(id)a3
{
}

- (NSString)userInput
{
  return self->_userInput;
}

- (void)setPubliclyIndexable:(BOOL)a3
{
  self->_publiclyIndexable = a3;
}

- (BOOL)publiclyIndexable
{
  return self->_publiclyIndexable;
}

- (void)setQueryId:(unint64_t)a3
{
  self->_queryId = a3;
}

- (unint64_t)queryId
{
  return self->_queryId;
}

- (void)setAlternativeURLs:(id)a3
{
}

- (NSArray)alternativeURLs
{
  return self->_alternativeURLs;
}

- (void)setCompactCard:(id)a3
{
}

- (SFCard)compactCard
{
  return self->_compactCard;
}

- (void)setUsesCompactDisplay:(BOOL)a3
{
  self->_usesCompactDisplay = a3;
}

- (BOOL)usesCompactDisplay
{
  return self->_usesCompactDisplay;
}

- (void)setDidTakeoverGo:(BOOL)a3
{
  self->_didTakeoverGo = a3;
}

- (BOOL)didTakeoverGo
{
  return self->_didTakeoverGo;
}

- (void)setWasCompact:(BOOL)a3
{
  self->_wasCompact = a3;
}

- (BOOL)wasCompact
{
  return self->_wasCompact;
}

- (void)setPreferTopPlatter:(BOOL)a3
{
  self->_preferTopPlatter = a3;
}

- (BOOL)preferTopPlatter
{
  return self->_preferTopPlatter;
}

- (void)setShouldUseCompactDisplay:(BOOL)a3
{
  self->_shouldUseCompactDisplay = a3;
}

- (BOOL)shouldUseCompactDisplay
{
  return self->_shouldUseCompactDisplay;
}

- (void)setNoGoTakeover:(BOOL)a3
{
  self->_noGoTakeover = a3;
}

- (BOOL)noGoTakeover
{
  return self->_noGoTakeover;
}

- (void)setCompletedQuery:(id)a3
{
}

- (NSString)completedQuery
{
  return self->_completedQuery;
}

- (void)setCorrectedQuery:(id)a3
{
}

- (NSString)correctedQuery
{
  return self->_correctedQuery;
}

- (void)setIntendedQuery:(id)a3
{
}

- (NSString)intendedQuery
{
  return self->_intendedQuery;
}

- (void)setServerFeatures:(id)a3
{
}

- (NSDictionary)serverFeatures
{
  return self->_serverFeatures;
}

- (void)setLocalFeatures:(id)a3
{
}

- (NSDictionary)localFeatures
{
  return self->_localFeatures;
}

- (void)setIsFuzzyMatch:(BOOL)a3
{
  self->_isFuzzyMatch = a3;
}

- (BOOL)isFuzzyMatch
{
  return self->_isFuzzyMatch;
}

- (void)setIsStaticCorrection:(BOOL)a3
{
  self->_isStaticCorrection = a3;
}

- (BOOL)isStaticCorrection
{
  return self->_isStaticCorrection;
}

- (void)setIcon:(id)a3
{
}

- (SFImage)icon
{
  return self->_icon;
}

- (void)setResultBundleId:(id)a3
{
}

- (NSString)resultBundleId
{
  return self->_resultBundleId;
}

- (void)setTitleNoteSize:(id)a3
{
}

- (NSNumber)titleNoteSize
{
  return self->_titleNoteSize;
}

- (void)setTitleNote:(id)a3
{
}

- (NSString)titleNote
{
  return self->_titleNote;
}

- (void)setMaxAge:(id)a3
{
}

- (NSNumber)maxAge
{
  return self->_maxAge;
}

- (void)setQueryIndependentScore:(id)a3
{
}

- (NSNumber)queryIndependentScore
{
  return self->_queryIndependentScore;
}

- (void)setEngagementScore:(id)a3
{
}

- (NSNumber)engagementScore
{
  return self->_engagementScore;
}

- (void)setIsStreaming:(BOOL)a3
{
  self->_isStreaming = a3;
}

- (BOOL)isStreaming
{
  return self->_isStreaming;
}

- (void)setIsQuickGlance:(BOOL)a3
{
  self->_isQuickGlance = a3;
}

- (BOOL)isQuickGlance
{
  return self->_isQuickGlance;
}

- (void)setResultTemplate:(id)a3
{
}

- (NSString)resultTemplate
{
  return self->_resultTemplate;
}

- (void)setResultType:(id)a3
{
}

- (NSString)resultType
{
  return self->_resultType;
}

- (void)setCustomProperties:(id)a3
{
}

- (SFCustom)customProperties
{
  return self->_customProperties;
}

- (void)setPersonalizationScore:(double)a3
{
  self->_personalizationScore = a3;
}

- (double)personalizationScore
{
  return self->_personalizationScore;
}

- (void)setServerScore:(double)a3
{
  self->_serverScore = a3;
}

- (double)serverScore
{
  return self->_serverScore;
}

- (void)setMediaType:(id)a3
{
}

- (NSString)mediaType
{
  return self->_mediaType;
}

- (void)setMinimumRankOfTopHitToSuppressResult:(unint64_t)a3
{
  self->_minimumRankOfTopHitToSuppressResult = a3;
}

- (unint64_t)minimumRankOfTopHitToSuppressResult
{
  return self->_minimumRankOfTopHitToSuppressResult;
}

- (void)setDomainName:(id)a3
{
}

- (NSString)domainName
{
  return self->_domainName;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (int)type
{
  return self->_type;
}

- (void)setPlacement:(int)a3
{
  self->_placement = a3;
}

- (int)placement
{
  return self->_placement;
}

- (void)setRankingScore:(double)a3
{
  self->_rankingScore = a3;
}

- (double)rankingScore
{
  return self->_rankingScore;
}

- (void)setRenderHorizontallyWithOtherResultsInCategory:(BOOL)a3
{
  self->_renderHorizontallyWithOtherResultsInCategory = a3;
}

- (BOOL)renderHorizontallyWithOtherResultsInCategory
{
  return self->_renderHorizontallyWithOtherResultsInCategory;
}

- (void)setSectionHeaderMoreURL:(id)a3
{
}

- (NSURL)sectionHeaderMoreURL
{
  return self->_sectionHeaderMoreURL;
}

- (void)setSectionHeaderMore:(id)a3
{
}

- (NSString)sectionHeaderMore
{
  return self->_sectionHeaderMore;
}

- (void)setSectionHeader:(id)a3
{
}

- (NSString)sectionHeader
{
  return self->_sectionHeader;
}

- (void)setTopHit:(int)a3
{
  self->_topHit = a3;
}

- (int)topHit
{
  return self->_topHit;
}

- (void)setUserActivityRequiredString:(id)a3
{
}

- (NSString)userActivityRequiredString
{
  return self->_userActivityRequiredString;
}

- (void)setIsLocalApplicationResult:(BOOL)a3
{
  self->_isLocalApplicationResult = a3;
}

- (BOOL)isLocalApplicationResult
{
  return self->_isLocalApplicationResult;
}

- (void)setSectionBundleIdentifier:(id)a3
{
}

- (NSString)sectionBundleIdentifier
{
  return self->_sectionBundleIdentifier;
}

- (void)setApplicationBundleIdentifier:(id)a3
{
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (void)setRequestedTopic:(id)a3
{
}

- (SFTopic)requestedTopic
{
  return self->_requestedTopic;
}

- (void)setNormalizedTopic:(id)a3
{
}

- (SFTopic)normalizedTopic
{
  return self->_normalizedTopic;
}

- (void)setMoreResultsPunchout:(id)a3
{
}

- (SFPunchout)moreResultsPunchout
{
  return self->_moreResultsPunchout;
}

- (void)setMoreResults:(id)a3
{
}

- (SFMoreResults)moreResults
{
  return self->_moreResults;
}

- (void)setTophitCard:(id)a3
{
}

- (SFCard)tophitCard
{
  return self->_tophitCard;
}

- (void)setUsesTopHitDisplay:(BOOL)a3
{
  self->_usesTopHitDisplay = a3;
}

- (BOOL)usesTopHitDisplay
{
  return self->_usesTopHitDisplay;
}

- (void)setInlineCard:(id)a3
{
}

- (SFCard)inlineCard
{
  return self->_inlineCard;
}

- (void)setCard:(id)a3
{
}

- (SFCard)card
{
  return self->_card;
}

- (void)setAppleReferrer:(id)a3
{
}

- (NSString)appleReferrer
{
  return self->_appleReferrer;
}

- (void)setNearbyBusinessesString:(id)a3
{
}

- (NSString)nearbyBusinessesString
{
  return self->_nearbyBusinessesString;
}

- (void)setMapsMoreIcon:(id)a3
{
}

- (SFImage)mapsMoreIcon
{
  return self->_mapsMoreIcon;
}

- (void)setMapsMoreString:(id)a3
{
}

- (NSString)mapsMoreString
{
  return self->_mapsMoreString;
}

- (void)setMapsMoreURL:(id)a3
{
}

- (NSURL)mapsMoreURL
{
  return self->_mapsMoreURL;
}

- (void)setMapsResultType:(id)a3
{
}

- (NSString)mapsResultType
{
  return self->_mapsResultType;
}

- (void)setMapsData:(id)a3
{
}

- (void)setEntityIdentifier:(id)a3
{
}

- (NSString)entityIdentifier
{
  return self->_entityIdentifier;
}

- (void)setCalendarIdentifier:(id)a3
{
}

- (NSString)calendarIdentifier
{
  return self->_calendarIdentifier;
}

- (void)setContactIdentifier:(id)a3
{
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void)setStoreIdentifier:(id)a3
{
}

- (NSString)storeIdentifier
{
  return self->_storeIdentifier;
}

- (void)setPunchout:(id)a3
{
}

- (SFPunchout)punchout
{
  return self->_punchout;
}

- (void)setAction:(id)a3
{
}

- (SFActionItem)action
{
  return self->_action;
}

- (void)setAuxiliaryBottomTextColor:(int)a3
{
  self->_auxiliaryBottomTextColor = a3;
}

- (int)auxiliaryBottomTextColor
{
  return self->_auxiliaryBottomTextColor;
}

- (void)setAuxiliaryBottomText:(id)a3
{
}

- (NSString)auxiliaryBottomText
{
  return self->_auxiliaryBottomText;
}

- (void)setAuxiliaryMiddleText:(id)a3
{
}

- (NSString)auxiliaryMiddleText
{
  return self->_auxiliaryMiddleText;
}

- (void)setAuxiliaryTopText:(id)a3
{
}

- (NSString)auxiliaryTopText
{
  return self->_auxiliaryTopText;
}

- (void)setUrl:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (void)setCompletionImage:(id)a3
{
}

- (SFImage)completionImage
{
  return self->_completionImage;
}

- (void)setCompletion:(id)a3
{
}

- (NSString)completion
{
  return self->_completion;
}

- (void)setSourceName:(id)a3
{
}

- (NSString)sourceName
{
  return self->_sourceName;
}

- (void)setPublishDate:(id)a3
{
}

- (NSString)publishDate
{
  return self->_publishDate;
}

- (void)setFootnote:(id)a3
{
}

- (NSString)footnote
{
  return self->_footnote;
}

- (void)setDescriptions:(id)a3
{
}

- (NSArray)descriptions
{
  return self->_descriptions;
}

- (void)setIsCentered:(BOOL)a3
{
  self->_isCentered = a3;
}

- (BOOL)isCentered
{
  return self->_isCentered;
}

- (void)setIsSecondaryTitleDetached:(BOOL)a3
{
  self->_isSecondaryTitleDetached = a3;
}

- (BOOL)isSecondaryTitleDetached
{
  return self->_isSecondaryTitleDetached;
}

- (void)setSecondaryTitleImage:(id)a3
{
}

- (SFImage)secondaryTitleImage
{
  return self->_secondaryTitleImage;
}

- (void)setSecondaryTitle:(id)a3
{
}

- (NSString)secondaryTitle
{
  return self->_secondaryTitle;
}

- (void)setTitle:(id)a3
{
}

- (SFText)title
{
  return self->_title;
}

- (void)setPreventThumbnailImageScaling:(BOOL)a3
{
  self->_preventThumbnailImageScaling = a3;
}

- (BOOL)preventThumbnailImageScaling
{
  return self->_preventThumbnailImageScaling;
}

- (void)setThumbnail:(id)a3
{
}

- (SFImage)thumbnail
{
  return self->_thumbnail;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)updatePunchout
{
  id v7 = [(SFSearchResult *)self inlineCard];
  v3 = [v7 cardSections];
  v4 = [v3 firstObject];
  v5 = [v4 punchoutOptions];
  v6 = [v5 firstObject];
  [(SFSearchResult *)self setPunchout:v6];
}

- (NSData)mapsData
{
  v3 = [(SFCard *)self->_inlineCard cardSections];
  v4 = [v3 firstObject];

  mapsData = self->_mapsData;
  if (!mapsData)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = [v4 mapsData];
      goto LABEL_6;
    }
    mapsData = self->_mapsData;
  }
  v6 = mapsData;
LABEL_6:
  id v7 = v6;

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v4 initWithSearchResult:self];
}

- (SFSearchResult)initWithSearchResult:(id)a3
{
  id v4 = a3;
  v5 = [(SFSearchResult *)self init];
  if (v5)
  {
    v6 = [v4 identifier];
    [(SFSearchResult *)v5 setIdentifier:v6];

    id v7 = [v4 thumbnail];
    [(SFSearchResult *)v5 setThumbnail:v7];

    -[SFSearchResult setPreventThumbnailImageScaling:](v5, "setPreventThumbnailImageScaling:", [v4 preventThumbnailImageScaling]);
    v8 = [v4 title];
    [(SFSearchResult *)v5 setTitle:v8];

    v9 = [v4 secondaryTitle];
    [(SFSearchResult *)v5 setSecondaryTitle:v9];

    v10 = [v4 secondaryTitleImage];
    [(SFSearchResult *)v5 setSecondaryTitleImage:v10];

    -[SFSearchResult setIsSecondaryTitleDetached:](v5, "setIsSecondaryTitleDetached:", [v4 isSecondaryTitleDetached]);
    -[SFSearchResult setIsCentered:](v5, "setIsCentered:", [v4 isCentered]);
    v11 = [v4 descriptions];
    [(SFSearchResult *)v5 setDescriptions:v11];

    v12 = [v4 footnote];
    [(SFSearchResult *)v5 setFootnote:v12];

    v13 = [v4 publishDate];
    [(SFSearchResult *)v5 setPublishDate:v13];

    v14 = [v4 sourceName];
    [(SFSearchResult *)v5 setSourceName:v14];

    v15 = [v4 completion];
    [(SFSearchResult *)v5 setCompletion:v15];

    uint64_t v16 = [v4 completionImage];
    [(SFSearchResult *)v5 setCompletionImage:v16];

    v17 = [v4 url];
    [(SFSearchResult *)v5 setUrl:v17];

    v18 = [v4 auxiliaryTopText];
    [(SFSearchResult *)v5 setAuxiliaryTopText:v18];

    uint64_t v19 = [v4 auxiliaryMiddleText];
    [(SFSearchResult *)v5 setAuxiliaryMiddleText:v19];

    uint64_t v20 = [v4 auxiliaryBottomText];
    [(SFSearchResult *)v5 setAuxiliaryBottomText:v20];

    -[SFSearchResult setAuxiliaryBottomTextColor:](v5, "setAuxiliaryBottomTextColor:", [v4 auxiliaryBottomTextColor]);
    uint64_t v21 = [v4 action];
    [(SFSearchResult *)v5 setAction:v21];

    v22 = [v4 punchout];
    [(SFSearchResult *)v5 setPunchout:v22];

    v23 = [v4 storeIdentifier];
    [(SFSearchResult *)v5 setStoreIdentifier:v23];

    v24 = [v4 contactIdentifier];
    [(SFSearchResult *)v5 setContactIdentifier:v24];

    v25 = [v4 calendarIdentifier];
    [(SFSearchResult *)v5 setCalendarIdentifier:v25];

    v26 = [v4 entityIdentifier];
    [(SFSearchResult *)v5 setEntityIdentifier:v26];

    v27 = [v4 mapsData];
    [(SFSearchResult *)v5 setMapsData:v27];

    v28 = [v4 mapsResultType];
    [(SFSearchResult *)v5 setMapsResultType:v28];

    v29 = [v4 mapsMoreURL];
    [(SFSearchResult *)v5 setMapsMoreURL:v29];

    v30 = [v4 mapsMoreString];
    [(SFSearchResult *)v5 setMapsMoreString:v30];

    v31 = [v4 mapsMoreIcon];
    [(SFSearchResult *)v5 setMapsMoreIcon:v31];

    v32 = [v4 nearbyBusinessesString];
    [(SFSearchResult *)v5 setNearbyBusinessesString:v32];

    v33 = [v4 appleReferrer];
    [(SFSearchResult *)v5 setAppleReferrer:v33];

    v34 = [v4 card];
    [(SFSearchResult *)v5 setCard:v34];

    v35 = [v4 inlineCard];
    [(SFSearchResult *)v5 setInlineCard:v35];

    -[SFSearchResult setUsesTopHitDisplay:](v5, "setUsesTopHitDisplay:", [v4 usesTopHitDisplay]);
    v36 = [v4 tophitCard];
    [(SFSearchResult *)v5 setTophitCard:v36];

    v37 = [v4 moreResults];
    [(SFSearchResult *)v5 setMoreResults:v37];

    uint64_t v38 = [v4 moreResultsPunchout];
    [(SFSearchResult *)v5 setMoreResultsPunchout:v38];

    uint64_t v39 = [v4 applicationBundleIdentifier];
    [(SFSearchResult *)v5 setApplicationBundleIdentifier:v39];

    uint64_t v40 = [v4 sectionBundleIdentifier];
    [(SFSearchResult *)v5 setSectionBundleIdentifier:v40];

    -[SFSearchResult setIsLocalApplicationResult:](v5, "setIsLocalApplicationResult:", [v4 isLocalApplicationResult]);
    v41 = [v4 userActivityRequiredString];
    [(SFSearchResult *)v5 setUserActivityRequiredString:v41];

    -[SFSearchResult setTopHit:](v5, "setTopHit:", [v4 topHit]);
    uint64_t v42 = [v4 sectionHeader];
    [(SFSearchResult *)v5 setSectionHeader:v42];

    v43 = [v4 sectionHeaderMore];
    [(SFSearchResult *)v5 setSectionHeaderMore:v43];

    v44 = [v4 sectionHeaderMoreURL];
    [(SFSearchResult *)v5 setSectionHeaderMoreURL:v44];

    -[SFSearchResult setRenderHorizontallyWithOtherResultsInCategory:](v5, "setRenderHorizontallyWithOtherResultsInCategory:", [v4 renderHorizontallyWithOtherResultsInCategory]);
    [v4 rankingScore];
    -[SFSearchResult setRankingScore:](v5, "setRankingScore:");
    -[SFSearchResult setPlacement:](v5, "setPlacement:", [v4 placement]);
    -[SFSearchResult setType:](v5, "setType:", [v4 type]);
    v45 = [v4 domainName];
    [(SFSearchResult *)v5 setDomainName:v45];

    -[SFSearchResult setMinimumRankOfTopHitToSuppressResult:](v5, "setMinimumRankOfTopHitToSuppressResult:", [v4 minimumRankOfTopHitToSuppressResult]);
    v46 = [v4 mediaType];
    [(SFSearchResult *)v5 setMediaType:v46];

    [v4 serverScore];
    -[SFSearchResult setServerScore:](v5, "setServerScore:");
    [v4 personalizationScore];
    -[SFSearchResult setPersonalizationScore:](v5, "setPersonalizationScore:");
    v47 = [v4 customProperties];
    [(SFSearchResult *)v5 setCustomProperties:v47];

    v48 = [v4 resultType];
    [(SFSearchResult *)v5 setResultType:v48];

    v49 = [v4 resultTemplate];
    [(SFSearchResult *)v5 setResultTemplate:v49];

    -[SFSearchResult setIsQuickGlance:](v5, "setIsQuickGlance:", [v4 isQuickGlance]);
    -[SFSearchResult setIsStreaming:](v5, "setIsStreaming:", [v4 isStreaming]);
    v50 = [v4 engagementScore];
    [(SFSearchResult *)v5 setEngagementScore:v50];

    v51 = [v4 queryIndependentScore];
    [(SFSearchResult *)v5 setQueryIndependentScore:v51];

    v52 = [v4 maxAge];
    [(SFSearchResult *)v5 setMaxAge:v52];

    v53 = [v4 titleNote];
    [(SFSearchResult *)v5 setTitleNote:v53];

    v54 = [v4 titleNoteSize];
    [(SFSearchResult *)v5 setTitleNoteSize:v54];

    v55 = [v4 resultBundleId];
    [(SFSearchResult *)v5 setResultBundleId:v55];

    v56 = [v4 icon];
    [(SFSearchResult *)v5 setIcon:v56];

    -[SFSearchResult setIsStaticCorrection:](v5, "setIsStaticCorrection:", [v4 isStaticCorrection]);
    v57 = [v4 localFeatures];
    [(SFSearchResult *)v5 setLocalFeatures:v57];

    v58 = [v4 serverFeatures];
    [(SFSearchResult *)v5 setServerFeatures:v58];

    v59 = [v4 intendedQuery];
    [(SFSearchResult *)v5 setIntendedQuery:v59];

    v60 = [v4 correctedQuery];
    [(SFSearchResult *)v5 setCorrectedQuery:v60];

    v61 = [v4 completedQuery];
    [(SFSearchResult *)v5 setCompletedQuery:v61];

    -[SFSearchResult setNoGoTakeover:](v5, "setNoGoTakeover:", [v4 noGoTakeover]);
    -[SFSearchResult setShouldUseCompactDisplay:](v5, "setShouldUseCompactDisplay:", [v4 shouldUseCompactDisplay]);
    -[SFSearchResult setPreferTopPlatter:](v5, "setPreferTopPlatter:", [v4 preferTopPlatter]);
    -[SFSearchResult setWasCompact:](v5, "setWasCompact:", [v4 wasCompact]);
    -[SFSearchResult setDidTakeoverGo:](v5, "setDidTakeoverGo:", [v4 didTakeoverGo]);
    -[SFSearchResult setUsesCompactDisplay:](v5, "setUsesCompactDisplay:", [v4 usesCompactDisplay]);
    v62 = [v4 compactCard];
    [(SFSearchResult *)v5 setCompactCard:v62];

    v63 = [v4 alternativeURLs];
    [(SFSearchResult *)v5 setAlternativeURLs:v63];

    -[SFSearchResult setQueryId:](v5, "setQueryId:", [v4 queryId]);
    -[SFSearchResult setPubliclyIndexable:](v5, "setPubliclyIndexable:", [v4 publiclyIndexable]);
    v64 = [v4 userInput];
    [(SFSearchResult *)v5 setUserInput:v64];

    v65 = [v4 itemProviderDataTypes];
    [(SFSearchResult *)v5 setItemProviderDataTypes:v65];

    v66 = [v4 itemProviderFileTypes];
    [(SFSearchResult *)v5 setItemProviderFileTypes:v66];

    v67 = [v4 contentType];
    [(SFSearchResult *)v5 setContentType:v67];

    v68 = [v4 contentTypeTree];
    [(SFSearchResult *)v5 setContentTypeTree:v68];

    -[SFSearchResult setDataOwnerType:](v5, "setDataOwnerType:", [v4 dataOwnerType]);
    v69 = [v4 fileProviderIdentifier];
    [(SFSearchResult *)v5 setFileProviderIdentifier:v69];

    v70 = [v4 fileProviderDomainIdentifier];
    [(SFSearchResult *)v5 setFileProviderDomainIdentifier:v70];

    v71 = [v4 fbr];
    [(SFSearchResult *)v5 setFbr:v71];

    v72 = [v4 srf];
    [(SFSearchResult *)v5 setSrf:v72];

    -[SFSearchResult setDoNotFold:](v5, "setDoNotFold:", [v4 doNotFold]);
    -[SFSearchResult setBlockId:](v5, "setBlockId:", [v4 blockId]);
    v73 = [v4 entityData];
    [(SFSearchResult *)v5 setEntityData:v73];

    -[SFSearchResult setIsInstantAnswer:](v5, "setIsInstantAnswer:", [v4 isInstantAnswer]);
    -[SFSearchResult setShouldAutoNavigate:](v5, "setShouldAutoNavigate:", [v4 shouldAutoNavigate]);
    v74 = [v4 normalizedTopic];
    [(SFSearchResult *)v5 setNormalizedTopic:v74];

    v75 = [v4 requestedTopic];
    [(SFSearchResult *)v5 setRequestedTopic:v75];

    -[SFSearchResult setContainsPersonalResult:](v5, "setContainsPersonalResult:", [v4 containsPersonalResult]);
    -[SFSearchResult setDidRerankPersonalResult:](v5, "setDidRerankPersonalResult:", [v4 didRerankPersonalResult]);
    -[SFSearchResult setCoreSpotlightIndexUsed:](v5, "setCoreSpotlightIndexUsed:", [v4 coreSpotlightIndexUsed]);
    -[SFSearchResult setCoreSpotlightIndexUsedReason:](v5, "setCoreSpotlightIndexUsedReason:", [v4 coreSpotlightIndexUsedReason]);
    v76 = [v4 coreSpotlightRankingSignals];
    [(SFSearchResult *)v5 setCoreSpotlightRankingSignals:v76];

    v77 = [v4 mailRankingSignals];
    [(SFSearchResult *)v5 setMailRankingSignals:v77];

    v78 = [v4 mailResultDetails];
    [(SFSearchResult *)v5 setMailResultDetails:v78];

    -[SFSearchResult setIsVideoAssetFromPhotos:](v5, "setIsVideoAssetFromPhotos:", [v4 isVideoAssetFromPhotos]);
    v79 = [v4 resultEntity];
    [(SFSearchResult *)v5 setResultEntity:v79];

    v80 = [v4 entityType];
    [(SFSearchResult *)v5 setEntityType:v80];

    -[SFSearchResult setIsMailInstantAnswerUpdated:](v5, "setIsMailInstantAnswerUpdated:", [v4 isMailInstantAnswerUpdated]);
    v81 = [v4 indexOfSectionWhenRanked];
    [(SFSearchResult *)v5 setIndexOfSectionWhenRanked:v81];

    v82 = [v4 indexOfResultInSectionWhenRanked];
    [(SFSearchResult *)v5 setIndexOfResultInSectionWhenRanked:v82];

    v83 = [v4 safariAttributes];
    [(SFSearchResult *)v5 setSafariAttributes:v83];

    -[SFSearchResult setHasAppTopHitShortcut:](v5, "setHasAppTopHitShortcut:", [v4 hasAppTopHitShortcut]);
    long long v84 = [v4 photosAttributes];
    [(SFSearchResult *)v5 setPhotosAttributes:v84];

    long long v85 = [v4 photosAggregatedInfo];
    [(SFSearchResult *)v5 setPhotosAggregatedInfo:v85];

    long long v86 = [v4 moreResultsButton];
    [(SFSearchResult *)v5 setMoreResultsButton:v86];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v11 = a3;
  [v11 encodeObject:self->_identifier forKey:@"_identifier"];
  [v11 encodeDouble:@"_rankingScore" forKey:self->_rankingScore];
  [v11 encodeInteger:self->_topHit forKey:@"_topHit"];
  [v11 encodeObject:self->_thumbnail forKey:@"_thumbnail"];
  [v11 encodeBool:self->_preventThumbnailImageScaling forKey:@"_preventThumbnailImageScaling"];
  [v11 encodeObject:self->_title forKey:@"_title"];
  [v11 encodeObject:self->_secondaryTitle forKey:@"_secondaryTitle"];
  [v11 encodeObject:self->_secondaryTitleImage forKey:@"_secondaryTitleImage"];
  [v11 encodeBool:self->_isSecondaryTitleDetached forKey:@"_isSecondaryTitleDetached"];
  [v11 encodeBool:self->_isCentered forKey:@"_isCentered"];
  [v11 encodeObject:self->_descriptions forKey:@"_descriptions"];
  [v11 encodeObject:self->_footnote forKey:@"_footnote"];
  [v11 encodeObject:self->_publishDate forKey:@"_publishDate"];
  [v11 encodeObject:self->_sourceName forKey:@"_sourceName"];
  [v11 encodeObject:self->_completion forKey:@"_completion"];
  [v11 encodeObject:self->_completionImage forKey:@"_completionImage"];
  [v11 encodeObject:self->_url forKey:@"_url"];
  [v11 encodeObject:self->_auxiliaryTopText forKey:@"_auxiliaryTopText"];
  [v11 encodeObject:self->_auxiliaryMiddleText forKey:@"_auxiliaryMiddleText"];
  [v11 encodeObject:self->_auxiliaryBottomText forKey:@"_auxiliaryBottomText"];
  [v11 encodeInt:self->_auxiliaryBottomTextColor forKey:@"_auxiliaryBottomTextColor"];
  [v11 encodeObject:self->_action forKey:@"_action"];
  [v11 encodeObject:self->_punchout forKey:@"_punchout"];
  [v11 encodeObject:self->_storeIdentifier forKey:@"_storeIdentifier"];
  [v11 encodeObject:self->_contactIdentifier forKey:@"_contactIdentifier"];
  [v11 encodeObject:self->_calendarIdentifier forKey:@"_calendarIdentifier"];
  [v11 encodeObject:self->_entityIdentifier forKey:@"_entityIdentifier"];
  id v4 = [(SFCard *)self->_inlineCard cardSections];
  v5 = [v4 firstObject];

  if (v5)
  {
    v6 = [(SFCard *)self->_inlineCard cardSections];
    id v7 = [v6 firstObject];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || ([v7 mapsData],
          v8 = objc_claimAutoreleasedReturnValue(),
          [(SFSearchResult *)self mapsData],
          v9 = objc_claimAutoreleasedReturnValue(),
          char v10 = [v8 isEqualToData:v9],
          v9,
          v8,
          (v10 & 1) == 0))
    {
      [v11 encodeObject:self->_mapsData forKey:@"_mapsData"];
    }
  }
  [v11 encodeObject:self->_mapsResultType forKey:@"_mapsResultType"];
  [v11 encodeObject:self->_mapsMoreURL forKey:@"_mapsMoreURL"];
  [v11 encodeObject:self->_mapsMoreString forKey:@"_mapsMoreString"];
  [v11 encodeObject:self->_mapsMoreIcon forKey:@"_mapsMoreIcon"];
  [v11 encodeObject:self->_nearbyBusinessesString forKey:@"_nearbyBusinessesString"];
  [v11 encodeObject:self->_appleReferrer forKey:@"_appleReferrer"];
  [v11 encodeObject:self->_card forKey:@"_card"];
  [v11 encodeObject:self->_inlineCard forKey:@"_inlineCard"];
  [v11 encodeObject:self->_moreResults forKey:@"_moreResults"];
  [v11 encodeObject:self->_moreResultsPunchout forKey:@"_moreResultsPunchout"];
  [v11 encodeObject:self->_normalizedTopic forKey:@"_normalizedTopic"];
  [v11 encodeObject:self->_requestedTopic forKey:@"_requestedTopic"];
  [v11 encodeObject:self->_applicationBundleIdentifier forKey:@"_applicationBundleIdentifier"];
  [v11 encodeObject:self->_sectionBundleIdentifier forKey:@"_sectionBundleIdentifier"];
  [v11 encodeBool:self->_isLocalApplicationResult forKey:@"_isLocalApplicationResult"];
  [v11 encodeObject:self->_userActivityRequiredString forKey:@"_userActivityRequiredString"];
  [v11 encodeInteger:self->_type forKey:@"_type"];
  [v11 encodeInteger:self->_minimumRankOfTopHitToSuppressResult forKey:@"_minimumRankOfTopHitToSuppressResult"];
  [v11 encodeObject:self->_sectionHeader forKey:@"_sectionHeader"];
  [v11 encodeObject:self->_sectionHeaderMore forKey:@"_sectionHeaderMore"];
  [v11 encodeObject:self->_sectionHeaderMoreURL forKey:@"_sectionHeaderMoreURL"];
  [v11 encodeObject:self->_customProperties forKey:@"_customProperties"];
  [v11 encodeBool:self->_renderHorizontallyWithOtherResultsInCategory forKey:@"_renderHorizontallyWithOtherResultsInCategory"];
  [v11 encodeInteger:self->_placement forKey:@"_placement"];
  [v11 encodeObject:self->_mediaType forKey:@"_mediaType"];
  [v11 encodeDouble:@"_serverScore" forKey:self->_serverScore];
  [v11 encodeDouble:@"_personalizationScore" forKey:self->_personalizationScore];
  [v11 encodeObject:self->_resultType forKey:@"_resultType"];
  [v11 encodeObject:self->_resultTemplate forKey:@"_resultTemplate"];
  [v11 encodeBool:self->_isQuickGlance forKey:@"_isQuickGlance"];
  [v11 encodeBool:self->_isStreaming forKey:@"_isStreaming"];
  [v11 encodeObject:self->_engagementScore forKey:@"_engagementScore"];
  [v11 encodeObject:self->_queryIndependentScore forKey:@"_queryIndependentScore"];
  [v11 encodeObject:self->_maxAge forKey:@"_maxAge"];
  [v11 encodeObject:self->_titleNote forKey:@"_titleNote"];
  [v11 encodeObject:self->_titleNoteSize forKey:@"_titleNoteSize"];
  [v11 encodeObject:self->_resultBundleId forKey:@"_resultBundleId"];
  [v11 encodeObject:self->_icon forKey:@"_icon"];
  [v11 encodeBool:self->_isStaticCorrection forKey:@"_isStaticCorrection"];
  [v11 encodeBool:self->_isFuzzyMatch forKey:@"_isFuzzyMatch"];
  [v11 encodeObject:self->_localFeatures forKey:@"_localFeatures"];
  [v11 encodeObject:self->_serverFeatures forKey:@"_serverFeatures"];
  [v11 encodeBool:self->_noGoTakeover forKey:@"_noGoTakeover"];
  [v11 encodeBool:self->_shouldUseCompactDisplay forKey:@"_shouldUseCompactDisplay"];
  [v11 encodeBool:self->_preferTopPlatter forKey:@"_preferTopPlatter"];
  [v11 encodeBool:self->_wasCompact forKey:@"_wasCompact"];
  [v11 encodeBool:self->_didTakeoverGo forKey:@"_didTakeoverGo"];
  [v11 encodeBool:self->_usesCompactDisplay forKey:@"_usesCompactDisplay"];
  [v11 encodeObject:self->_compactCard forKey:@"_compactCard"];
  [v11 encodeBool:self->_usesTopHitDisplay forKey:@"_usesTopHitDisplay"];
  [v11 encodeObject:self->_tophitCard forKey:@"_tophitCard"];
  [v11 encodeObject:self->_alternativeURLs forKey:@"_alternativeURLs"];
  [v11 encodeObject:self->_intendedQuery forKey:@"_intendedQuery"];
  [v11 encodeObject:self->_completedQuery forKey:@"_completedQuery"];
  [v11 encodeObject:self->_correctedQuery forKey:@"_correctedQuery"];
  [v11 encodeInt64:self->_queryId forKey:@"_queryId"];
  [v11 encodeBool:self->_publiclyIndexable forKey:@"_publiclyIndexable"];
  [v11 encodeObject:self->_userInput forKey:@"_userInput"];
  [v11 encodeObject:self->_itemProviderDataTypes forKey:@"_itemProviderDataTypes"];
  [v11 encodeObject:self->_itemProviderFileTypes forKey:@"_itemProviderFileTypes"];
  [v11 encodeObject:self->_contentType forKey:@"_contentType"];
  [v11 encodeObject:self->_contentTypeTree forKey:@"_contentTypeTree"];
  [v11 encodeInteger:self->_dataOwnerType forKey:@"_dataOwnerType"];
  [v11 encodeObject:self->_fileProviderIdentifier forKey:@"_fileProviderIdentifier"];
  [v11 encodeObject:self->_fileProviderDomainIdentifier forKey:@"_fileProviderDomainIdentifier"];
  [v11 encodeObject:self->_fbr forKey:@"_fbr"];
  [v11 encodeBool:self->_doNotFold forKey:@"_doNotFold"];
  [v11 encodeInt64:self->_blockId forKey:@"_blockId"];
  [v11 encodeObject:self->_entityData forKey:@"_entityData"];
  [v11 encodeBool:self->_isInstantAnswer forKey:@"_isInstantAnswer"];
  [v11 encodeBool:self->_shouldAutoNavigate forKey:@"_shouldAutoNavigate"];
  [v11 encodeBool:self->_containsPersonalResult forKey:@"_containsPersonalResult"];
  [v11 encodeBool:self->_didRerankPersonalResult forKey:@"_didRerankPersonalResult"];
  [v11 encodeInt32:self->_coreSpotlightIndexUsed forKey:@"_coreSpotlightIndexUsed"];
  [v11 encodeInt32:self->_coreSpotlightIndexUsedReason forKey:@"_coreSpotlightIndexUsedReason"];
  [v11 encodeObject:self->_coreSpotlightRankingSignals forKey:@"_coreSpotlightRankingSignals"];
  [v11 encodeObject:self->_mailRankingSignals forKey:@"_mailRankingSignals"];
  [v11 encodeObject:self->_mailResultDetails forKey:@"_mailResultDetails"];
  [v11 encodeBool:self->_isVideoAssetFromPhotos forKey:@"_isVideoAssetFromPhotos"];
  [v11 encodeObject:self->_resultEntity forKey:@"_resultEntity"];
  [v11 encodeBool:self->_isMailInstantAnswerUpdated forKey:@"_isMailInstantAnswerUpdated"];
  [v11 encodeObject:self->_indexOfSectionWhenRanked forKey:@"_indexOfSectionWhenRanked"];
  [v11 encodeObject:self->_indexOfResultInSectionWhenRanked forKey:@"_indexOfResultInSectionWhenRanked"];
  [v11 encodeObject:self->_safariAttributes forKey:@"_safariAttributes"];
  [v11 encodeObject:self->_entityType forKey:@"_entityType"];
  [v11 encodeBool:self->_hasAppTopHitShortcut forKey:@"_hasAppTopHitShortcut"];
  [v11 encodeObject:self->_photosAttributes forKey:@"_photosAttributes"];
  [v11 encodeObject:self->_photosAggregatedInfo forKey:@"_photosAggregatedInfo"];
  [v11 encodeObject:self->_moreResultsButton forKey:@"_moreResultsButton"];
}

- (SFSearchResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v192.receiver = self;
  v192.super_class = (Class)SFSearchResult;
  v5 = [(SFSearchResult *)&v192 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    [v4 decodeDoubleForKey:@"_rankingScore"];
    v5->_rankingScore = v8;
    v5->_topHit = [v4 decodeIntegerForKey:@"_topHit"];
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_thumbnail"];
    thumbnail = v5->_thumbnail;
    v5->_thumbnail = (SFImage *)v9;

    v5->_preventThumbnailImageScaling = [v4 decodeBoolForKey:@"_preventThumbnailImageScaling"];
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_title"];
    title = v5->_title;
    v5->_title = (SFText *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_secondaryTitle"];
    secondaryTitle = v5->_secondaryTitle;
    v5->_secondaryTitle = (NSString *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_secondaryTitleImage"];
    secondaryTitleImage = v5->_secondaryTitleImage;
    v5->_secondaryTitleImage = (SFImage *)v15;

    v5->_isSecondaryTitleDetached = [v4 decodeBoolForKey:@"_isSecondaryTitleDetached"];
    v5->_isCentered = [v4 decodeBoolForKey:@"_isCentered"];
    v17 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"_descriptions"];
    descriptions = v5->_descriptions;
    v5->_descriptions = (NSArray *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_footnote"];
    footnote = v5->_footnote;
    v5->_footnote = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_publishDate"];
    publishDate = v5->_publishDate;
    v5->_publishDate = (NSString *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_sourceName"];
    sourceName = v5->_sourceName;
    v5->_sourceName = (NSString *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_completion"];
    completion = v5->_completion;
    v5->_completion = (NSString *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_completionImage"];
    completionImage = v5->_completionImage;
    v5->_completionImage = (SFImage *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_url"];
    url = v5->_url;
    v5->_url = (NSURL *)v32;

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_auxiliaryTopText"];
    auxiliaryTopText = v5->_auxiliaryTopText;
    v5->_auxiliaryTopText = (NSString *)v34;

    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_auxiliaryMiddleText"];
    auxiliaryMiddleText = v5->_auxiliaryMiddleText;
    v5->_auxiliaryMiddleText = (NSString *)v36;

    uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_auxiliaryBottomText"];
    auxiliaryBottomText = v5->_auxiliaryBottomText;
    v5->_auxiliaryBottomText = (NSString *)v38;

    v5->_auxiliaryBottomTextColor = [v4 decodeInt32ForKey:@"_auxiliaryBottomTextColor"];
    uint64_t v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_action"];
    action = v5->_action;
    v5->_action = (SFActionItem *)v40;

    uint64_t v42 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_punchout"];
    punchout = v5->_punchout;
    v5->_punchout = (SFPunchout *)v42;

    uint64_t v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_storeIdentifier"];
    storeIdentifier = v5->_storeIdentifier;
    v5->_storeIdentifier = (NSString *)v44;

    uint64_t v46 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_contactIdentifier"];
    contactIdentifier = v5->_contactIdentifier;
    v5->_contactIdentifier = (NSString *)v46;

    uint64_t v48 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_calendarIdentifier"];
    calendarIdentifier = v5->_calendarIdentifier;
    v5->_calendarIdentifier = (NSString *)v48;

    uint64_t v50 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_entityIdentifier"];
    entityIdentifier = v5->_entityIdentifier;
    v5->_entityIdentifier = (NSString *)v50;

    uint64_t v52 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_mapsData"];
    mapsData = v5->_mapsData;
    v5->_mapsData = (NSData *)v52;

    uint64_t v54 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_mapsResultType"];
    mapsResultType = v5->_mapsResultType;
    v5->_mapsResultType = (NSString *)v54;

    uint64_t v56 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_mapsMoreURL"];
    mapsMoreURL = v5->_mapsMoreURL;
    v5->_mapsMoreURL = (NSURL *)v56;

    uint64_t v58 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_mapsMoreString"];
    mapsMoreString = v5->_mapsMoreString;
    v5->_mapsMoreString = (NSString *)v58;

    uint64_t v60 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_mapsMoreIcon"];
    mapsMoreIcon = v5->_mapsMoreIcon;
    v5->_mapsMoreIcon = (SFImage *)v60;

    uint64_t v62 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_nearbyBusinessesString"];
    nearbyBusinessesString = v5->_nearbyBusinessesString;
    v5->_nearbyBusinessesString = (NSString *)v62;

    uint64_t v64 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_appleReferrer"];
    appleReferrer = v5->_appleReferrer;
    v5->_appleReferrer = (NSString *)v64;

    uint64_t v66 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_card"];
    card = v5->_card;
    v5->_card = (SFCard *)v66;

    uint64_t v68 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_inlineCard"];
    inlineCard = v5->_inlineCard;
    v5->_inlineCard = (SFCard *)v68;

    uint64_t v70 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_tophitCard"];
    tophitCard = v5->_tophitCard;
    v5->_tophitCard = (SFCard *)v70;

    uint64_t v72 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_moreResults"];
    moreResults = v5->_moreResults;
    v5->_moreResults = (SFMoreResults *)v72;

    uint64_t v74 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_moreResultsPunchout"];
    moreResultsPunchout = v5->_moreResultsPunchout;
    v5->_moreResultsPunchout = (SFPunchout *)v74;

    uint64_t v76 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_normalizedTopic"];
    normalizedTopic = v5->_normalizedTopic;
    v5->_normalizedTopic = (SFTopic *)v76;

    uint64_t v78 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_requestedTopic"];
    requestedTopic = v5->_requestedTopic;
    v5->_requestedTopic = (SFTopic *)v78;

    uint64_t v80 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_applicationBundleIdentifier"];
    applicationBundleIdentifier = v5->_applicationBundleIdentifier;
    v5->_applicationBundleIdentifier = (NSString *)v80;

    uint64_t v82 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_sectionBundleIdentifier"];
    sectionBundleIdentifier = v5->_sectionBundleIdentifier;
    v5->_sectionBundleIdentifier = (NSString *)v82;

    v5->_isLocalApplicationResult = [v4 decodeBoolForKey:@"_isLocalApplicationResult"];
    uint64_t v84 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_userActivityRequiredString"];
    userActivityRequiredString = v5->_userActivityRequiredString;
    v5->_userActivityRequiredString = (NSString *)v84;

    v5->_type = [v4 decodeIntegerForKey:@"_type"];
    v5->_minimumRankOfTopHitToSuppressResult = [v4 decodeIntegerForKey:@"_minimumRankOfTopHitToSuppressResult"];
    uint64_t v86 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_sectionHeader"];
    sectionHeader = v5->_sectionHeader;
    v5->_sectionHeader = (NSString *)v86;

    uint64_t v88 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_sectionHeaderMore"];
    sectionHeaderMore = v5->_sectionHeaderMore;
    v5->_sectionHeaderMore = (NSString *)v88;

    uint64_t v90 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_sectionHeaderMoreURL"];
    sectionHeaderMoreURL = v5->_sectionHeaderMoreURL;
    v5->_sectionHeaderMoreURL = (NSURL *)v90;

    v5->_placement = [v4 decodeIntegerForKey:@"_placement"];
    uint64_t v92 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_customProperties"];
    customProperties = v5->_customProperties;
    v5->_customProperties = (SFCustom *)v92;

    v5->_renderHorizontallyWithOtherResultsInCategory = [v4 decodeBoolForKey:@"_renderHorizontallyWithOtherResultsInCategory"];
    uint64_t v94 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_mediaType"];
    mediaType = v5->_mediaType;
    v5->_mediaType = (NSString *)v94;

    [v4 decodeDoubleForKey:@"_serverScore"];
    v5->_serverScore = v96;
    [v4 decodeDoubleForKey:@"_personalizationScore"];
    v5->_personalizationScore = v97;
    uint64_t v98 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_resultType"];
    resultType = v5->_resultType;
    v5->_resultType = (NSString *)v98;

    uint64_t v100 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_resultTemplate"];
    resultTemplate = v5->_resultTemplate;
    v5->_resultTemplate = (NSString *)v100;

    v5->_isQuickGlance = [v4 decodeBoolForKey:@"_isQuickGlance"];
    v5->_isStreaming = [v4 decodeBoolForKey:@"_isStreaming"];
    uint64_t v102 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_engagementScore"];
    engagementScore = v5->_engagementScore;
    v5->_engagementScore = (NSNumber *)v102;

    uint64_t v104 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_queryIndependentScore"];
    queryIndependentScore = v5->_queryIndependentScore;
    v5->_queryIndependentScore = (NSNumber *)v104;

    uint64_t v106 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_maxAge"];
    maxAge = v5->_maxAge;
    v5->_maxAge = (NSNumber *)v106;

    uint64_t v108 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_titleNote"];
    titleNote = v5->_titleNote;
    v5->_titleNote = (NSString *)v108;

    uint64_t v110 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_titleNoteSize"];
    titleNoteSize = v5->_titleNoteSize;
    v5->_titleNoteSize = (NSNumber *)v110;

    uint64_t v112 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_resultBundleId"];
    resultBundleId = v5->_resultBundleId;
    v5->_resultBundleId = (NSString *)v112;

    uint64_t v114 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_icon"];
    icon = v5->_icon;
    v5->_icon = (SFImage *)v114;

    v5->_isStaticCorrection = [v4 decodeBoolForKey:@"_isStaticCorrection"];
    v5->_isFuzzyMatch = [v4 decodeBoolForKey:@"_isFuzzyMatch"];
    v116 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v117 = objc_opt_class();
    uint64_t v118 = objc_opt_class();
    uint64_t v119 = objc_opt_class();
    v120 = objc_msgSend(v116, "setWithObjects:", v117, v118, v119, objc_opt_class(), 0);
    uint64_t v121 = [v4 decodeObjectOfClasses:v120 forKey:@"_localFeatures"];
    localFeatures = v5->_localFeatures;
    v5->_localFeatures = (NSDictionary *)v121;

    v123 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v124 = objc_opt_class();
    uint64_t v125 = objc_opt_class();
    v126 = objc_msgSend(v123, "setWithObjects:", v124, v125, objc_opt_class(), 0);
    uint64_t v127 = [v4 decodeObjectOfClasses:v126 forKey:@"_serverFeatures"];
    serverFeatures = v5->_serverFeatures;
    v5->_serverFeatures = (NSDictionary *)v127;

    v5->_shouldUseCompactDisplay = [v4 decodeBoolForKey:@"_shouldUseCompactDisplay"];
    v5->_noGoTakeover = [v4 decodeBoolForKey:@"_noGoTakeover"];
    v5->_preferTopPlatter = [v4 decodeBoolForKey:@"_preferTopPlatter"];
    v5->_wasCompact = [v4 decodeBoolForKey:@"_wasCompact"];
    v5->_didTakeoverGo = [v4 decodeBoolForKey:@"_didTakeoverGo"];
    v5->_usesCompactDisplay = [v4 decodeBoolForKey:@"_usesCompactDisplay"];
    v5->_usesTopHitDisplay = [v4 decodeBoolForKey:@"_usesTopHitDisplay"];
    uint64_t v129 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_compactCard"];
    compactCard = v5->_compactCard;
    v5->_compactCard = (SFCard *)v129;

    v131 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v132 = objc_opt_class();
    v133 = objc_msgSend(v131, "setWithObjects:", v132, objc_opt_class(), 0);
    uint64_t v134 = [v4 decodeObjectOfClasses:v133 forKey:@"_alternativeURLs"];
    alternativeURLs = v5->_alternativeURLs;
    v5->_alternativeURLs = (NSArray *)v134;

    uint64_t v136 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_intendedQuery"];
    intendedQuery = v5->_intendedQuery;
    v5->_intendedQuery = (NSString *)v136;

    uint64_t v138 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_completedQuery"];
    completedQuery = v5->_completedQuery;
    v5->_completedQuery = (NSString *)v138;

    uint64_t v140 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_correctedQuery"];
    correctedQuery = v5->_correctedQuery;
    v5->_correctedQuery = (NSString *)v140;

    v5->_queryId = [v4 decodeInt64ForKey:@"_queryId"];
    v5->_publiclyIndexable = [v4 decodeBoolForKey:@"_publiclyIndexable"];
    uint64_t v142 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_userInput"];
    userInput = v5->_userInput;
    v5->_userInput = (NSString *)v142;

    v144 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v145 = objc_opt_class();
    v146 = objc_msgSend(v144, "setWithObjects:", v145, objc_opt_class(), 0);
    uint64_t v147 = [v4 decodeObjectOfClasses:v146 forKey:@"_itemProviderDataTypes"];
    itemProviderDataTypes = v5->_itemProviderDataTypes;
    v5->_itemProviderDataTypes = (NSArray *)v147;

    v149 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v150 = objc_opt_class();
    v151 = objc_msgSend(v149, "setWithObjects:", v150, objc_opt_class(), 0);
    uint64_t v152 = [v4 decodeObjectOfClasses:v151 forKey:@"_itemProviderFileTypes"];
    itemProviderFileTypes = v5->_itemProviderFileTypes;
    v5->_itemProviderFileTypes = (NSArray *)v152;

    uint64_t v154 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_contentType"];
    contentType = v5->_contentType;
    v5->_contentType = (NSString *)v154;

    v156 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v157 = objc_opt_class();
    v158 = objc_msgSend(v156, "setWithObjects:", v157, objc_opt_class(), 0);
    uint64_t v159 = [v4 decodeObjectOfClasses:v158 forKey:@"_contentTypeTree"];
    contentTypeTree = v5->_contentTypeTree;
    v5->_contentTypeTree = (NSArray *)v159;

    v5->_dataOwnerType = [v4 decodeIntegerForKey:@"_dataOwnerType"];
    uint64_t v161 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_fileProviderIdentifier"];
    fileProviderIdentifier = v5->_fileProviderIdentifier;
    v5->_fileProviderIdentifier = (NSString *)v161;

    uint64_t v163 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_fileProviderDomainIdentifier"];
    fileProviderDomainIdentifier = v5->_fileProviderDomainIdentifier;
    v5->_fileProviderDomainIdentifier = (NSString *)v163;

    uint64_t v165 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_fbr"];
    fbr = v5->_fbr;
    v5->_fbr = (NSString *)v165;

    v5->_doNotFold = [v4 decodeBoolForKey:@"_doNotFold"];
    v5->_blockId = [v4 decodeInt64ForKey:@"_blockId"];
    uint64_t v167 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_entityData"];
    entityData = v5->_entityData;
    v5->_entityData = (NSData *)v167;

    v5->_isInstantAnswer = [v4 decodeBoolForKey:@"_isInstantAnswer"];
    v5->_shouldAutoNavigate = [v4 decodeBoolForKey:@"_shouldAutoNavigate"];
    v5->_containsPersonalResult = [v4 decodeBoolForKey:@"_containsPersonalResult"];
    v5->_didRerankPersonalResult = [v4 decodeBoolForKey:@"_didRerankPersonalResult"];
    v5->_coreSpotlightIndexUsed = [v4 decodeInt32ForKey:@"_coreSpotlightIndexUsed"];
    v5->_coreSpotlightIndexUsedReason = [v4 decodeInt32ForKey:@"_coreSpotlightIndexUsedReason"];
    uint64_t v169 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_coreSpotlightRankingSignals"];
    coreSpotlightRankingSignals = v5->_coreSpotlightRankingSignals;
    v5->_coreSpotlightRankingSignals = (SFCoreSpotlightRankingSignals *)v169;

    uint64_t v171 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_mailRankingSignals"];
    mailRankingSignals = v5->_mailRankingSignals;
    v5->_mailRankingSignals = (SFMailRankingSignals *)v171;

    uint64_t v173 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_mailResultDetails"];
    mailResultDetails = v5->_mailResultDetails;
    v5->_mailResultDetails = (SFMailResultDetails *)v173;

    v5->_isVideoAssetFromPhotos = [v4 decodeBoolForKey:@"_isVideoAssetFromPhotos"];
    uint64_t v175 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_resultEntity"];
    resultEntity = v5->_resultEntity;
    v5->_resultEntity = (SFResultEntity *)v175;

    v5->_isMailInstantAnswerUpdated = [v4 decodeBoolForKey:@"_isMailInstantAnswerUpdated"];
    uint64_t v177 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_indexOfSectionWhenRanked"];
    indexOfSectionWhenRanked = v5->_indexOfSectionWhenRanked;
    v5->_indexOfSectionWhenRanked = (NSNumber *)v177;

    uint64_t v179 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_indexOfResultInSectionWhenRanked"];
    indexOfResultInSectionWhenRanked = v5->_indexOfResultInSectionWhenRanked;
    v5->_indexOfResultInSectionWhenRanked = (NSNumber *)v179;

    uint64_t v181 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_safariAttributes"];
    safariAttributes = v5->_safariAttributes;
    v5->_safariAttributes = (SFSafariAttributes *)v181;

    uint64_t v183 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_entityType"];
    entityType = v5->_entityType;
    v5->_entityType = (NSString *)v183;

    v5->_hasAppTopHitShortcut = [v4 decodeBoolForKey:@"_hasAppTopHitShortcut"];
    uint64_t v185 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_photosAttributes"];
    photosAttributes = v5->_photosAttributes;
    v5->_photosAttributes = (SFPhotosAttributes *)v185;

    uint64_t v187 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_photosAggregatedInfo"];
    photosAggregatedInfo = v5->_photosAggregatedInfo;
    v5->_photosAggregatedInfo = (SFPhotosAggregatedInfo *)v187;

    uint64_t v189 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_moreResultsButton"];
    moreResultsButton = v5->_moreResultsButton;
    v5->_moreResultsButton = (SFCommandButtonItem *)v189;
  }
  return v5;
}

- (SFSearchResult)initWithQueryTopic:(id)a3
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)SFSearchResult;
  v5 = [(SFSearchResult *)&v26 init];
  if (v5)
  {
    uint64_t v6 = objc_alloc_init(SFText);
    id v7 = [v4 query];
    [(SFText *)v6 setText:v7];

    [(SFSearchResult *)v5 setTitle:v6];
    double v8 = [v4 query];
    [(SFSearchResult *)v5 setCompletion:v8];

    uint64_t v9 = +[SFSearchResult fallbackBundleId];
    [(SFSearchResult *)v5 setResultBundleId:v9];

    char v10 = +[SFSearchResult fallbackSectionBundleIdentifier];
    [(SFSearchResult *)v5 setSectionBundleIdentifier:v10];

    [(SFSearchResult *)v5 setType:17];
    uint64_t v11 = objc_alloc_init(SFSymbolImage);
    v12 = +[SFSearchResult fallbackImageSymbolName];
    [(SFSymbolImage *)v11 setSymbolName:v12];

    [(SFImage *)v11 setIsTemplate:1];
    uint64_t v13 = objc_alloc_init(SFPunchout);
    v14 = [(SFSearchResult *)v5 resultBundleId];
    [(SFPunchout *)v13 setBundleIdentifier:v14];

    uint64_t v15 = objc_alloc_init(SFSuggestionCardSection);
    uint64_t v16 = [v4 query];
    v17 = +[SFText textWithString:v16];
    [(SFSuggestionCardSection *)v15 setSuggestionText:v17];

    uint64_t v18 = [(SFSuggestionCardSection *)v15 suggestionText];
    [v18 setMaxLines:1];

    [(SFSuggestionCardSection *)v15 setSuggestionType:0];
    v28[0] = v13;
    uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
    [(SFCardSection *)v15 setPunchoutOptions:v19];

    [(SFSuggestionCardSection *)v15 setThumbnail:v11];
    uint64_t v20 = objc_alloc_init(SFUpdateSearchQueryCommand);
    uint64_t v21 = [v4 query];
    [(SFUpdateSearchQueryCommand *)v20 setSearchString:v21];

    [(SFUpdateSearchQueryCommand *)v20 setQuerySource:1];
    [(SFCardSection *)v15 setCommand:v20];
    uint64_t v22 = objc_alloc_init(SFCard);
    v27 = v15;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
    [(SFCard *)v22 setCardSections:v23];

    [(SFSearchResult *)v5 setInlineCard:v22];
    uint64_t v24 = v5;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)fallbackImageSymbolName
{
  return @"magnifyingglass.circle.fill";
}

+ (id)fallbackSectionBundleIdentifier
{
  return @"com.apple.coreparsec.server.fallback";
}

+ (id)fallbackBundleId
{
  return @"com.apple.coreparsec.fallback";
}

@end