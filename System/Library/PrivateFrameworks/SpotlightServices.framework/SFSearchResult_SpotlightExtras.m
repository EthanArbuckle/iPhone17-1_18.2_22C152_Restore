@interface SFSearchResult_SpotlightExtras
+ (BOOL)supportsSecureCoding;
+ (void)initialize;
- (BOOL)forceNoTopHit;
- (BOOL)hasCommunicationContent;
- (BOOL)hasTextContent;
- (BOOL)hasTextContentMatch;
- (BOOL)isAppClip;
- (BOOL)isSafariTopHit;
- (BOOL)isSafariTopHitForQuery:(id)a3;
- (BOOL)isWebClip;
- (IQFMapsPersonalizationResult)mapsPersonalizationResult;
- (NSArray)answerAttributes;
- (NSData)attributeData;
- (NSData)suggestionsFeedbackData;
- (NSDate)lastUsedDate;
- (NSMutableArray)duplicatedItems;
- (NSMutableDictionary)backendData;
- (NSNumber)displayOrder;
- (NSNumber)documentIdentifier;
- (NSNumber)fileIdentifier;
- (NSNumber)parentFileIdentifier;
- (NSString)contentURL;
- (NSString)filename;
- (NSString)launchString;
- (NSString)personIdentifier;
- (NSString)personQueryIdentifier;
- (NSString)personType;
- (NSString)personalAnswerString;
- (NSString)protectionClass;
- (NSString)relatedAppIdentifier;
- (NSString)userActivityType;
- (PRSRankingItem)rankingItem;
- (SFSearchResult_SpotlightExtras)init;
- (SFSearchResult_SpotlightExtras)initWithCoder:(id)a3;
- (SFSearchResult_SpotlightExtras)initWithIdentifier:(id)a3 bundleIdentifier:(id)a4 protectionClass:(id)a5 attributeKeys:(id)a6 attributeValues:(id)a7;
- (SFSearchResult_SpotlightExtras)initWithIdentifier:(id)a3 bundleIdentifier:(id)a4 protectionClass:(id)a5 attributeKeys:(id)a6 attributeValues:(id)a7 type:(int)a8 completion:(id)a9;
- (SFSearchResult_SpotlightExtras)initWithIdentifier:(id)a3 bundleIdentifier:(id)a4 protectionClass:(id)a5 attributes:(id)a6 type:(int)a7 completion:(id)a8;
- (SFSearchResult_SpotlightExtras)initWithResult:(id)a3;
- (SFSearchResult_SpotlightExtras)initWithResult:(id)a3 groupId:(id)a4;
- (float)l2score;
- (id)debugDescription;
- (id)getStableServerResultIdentifier;
- (id)punchout;
- (id)ttrDescription;
- (id)urlValueForAttribute:(id)a3;
- (id)valueForAttribute:(id)a3 withType:(Class)a4;
- (uint64_t)score;
- (unint64_t)predictionsFeedbackActionType;
- (unsigned)feedbackBlockId;
- (void)clearBackendData;
- (void)encodeWithCoder:(id)a3;
- (void)setAnswerAttributes:(id)a3;
- (void)setAttributeData:(id)a3;
- (void)setBackendData:(id)a3;
- (void)setContentURL:(id)a3;
- (void)setDisplayOrder:(id)a3;
- (void)setDocumentIdentifier:(id)a3;
- (void)setDuplicatedItems:(id)a3;
- (void)setFeedbackBlockId:(unsigned int)a3;
- (void)setFeedbackPropertiesOnResultCopy:(id)a3;
- (void)setFileIdentifier:(id)a3;
- (void)setFilename:(id)a3;
- (void)setForceNoTopHit:(BOOL)a3;
- (void)setHasCommunicationContent:(BOOL)a3;
- (void)setHasTextContent:(BOOL)a3;
- (void)setHasTextContentMatch:(BOOL)a3;
- (void)setIsAppClip:(BOOL)a3;
- (void)setIsSafariTopHit:(BOOL)a3;
- (void)setIsWebClip:(BOOL)a3;
- (void)setL2score:(float)a3;
- (void)setLastUsedDate:(id)a3;
- (void)setLaunchString:(id)a3;
- (void)setMapsPersonalizationResult:(id)a3;
- (void)setParentFileIdentifier:(id)a3;
- (void)setPersonIdentifier:(id)a3;
- (void)setPersonQueryIdentifier:(id)a3;
- (void)setPersonType:(id)a3;
- (void)setPersonalAnswerString:(id)a3;
- (void)setPredictionsFeedbackActionType:(unint64_t)a3;
- (void)setProtectionClass:(id)a3;
- (void)setRankingItem:(id)a3;
- (void)setRelatedAppIdentifier:(id)a3;
- (void)setScore:(SFSearchResult_SpotlightExtras *)self;
- (void)setSuggestionsFeedbackData:(id)a3;
- (void)setUrl:(id)a3;
- (void)setUserActivityType:(id)a3;
@end

@implementation SFSearchResult_SpotlightExtras

- (void)clearBackendData
{
  [(SFSearchResult_SpotlightExtras *)self setBackendData:0];
  [(SFSearchResult_SpotlightExtras *)self setAttributeData:0];
}

- (SFSearchResult_SpotlightExtras)initWithResult:(id)a3 groupId:(id)a4
{
  id v5 = a3;
  v6 = [(SFSearchResult_SpotlightExtras *)self init];
  if (v6)
  {
    v7 = [v5 contentType];
    [(SFSearchResult_SpotlightExtras *)v6 setContentType:v7];

    [v5 setFeedbackPropertiesOnResultCopy:v6];
    v8 = [v5 thumbnail];
    [(SFSearchResult_SpotlightExtras *)v6 setThumbnail:v8];

    -[SFSearchResult_SpotlightExtras setPreventThumbnailImageScaling:](v6, "setPreventThumbnailImageScaling:", [v5 preventThumbnailImageScaling]);
    v9 = [v5 secondaryTitleImage];
    [(SFSearchResult_SpotlightExtras *)v6 setSecondaryTitleImage:v9];

    -[SFSearchResult_SpotlightExtras setIsSecondaryTitleDetached:](v6, "setIsSecondaryTitleDetached:", [v5 isSecondaryTitleDetached]);
    -[SFSearchResult_SpotlightExtras setIsCentered:](v6, "setIsCentered:", [v5 isCentered]);
    v10 = [v5 publishDate];
    [(SFSearchResult_SpotlightExtras *)v6 setPublishDate:v10];

    v11 = [v5 sourceName];
    [(SFSearchResult_SpotlightExtras *)v6 setSourceName:v11];

    v12 = [v5 completion];
    [(SFSearchResult_SpotlightExtras *)v6 setCompletion:v12];

    v13 = [v5 completionImage];
    [(SFSearchResult_SpotlightExtras *)v6 setCompletionImage:v13];

    v14 = [v5 url];
    [(SFSearchResult_SpotlightExtras *)v6 setUrl:v14];

    v15 = [v5 auxiliaryTopText];
    [(SFSearchResult_SpotlightExtras *)v6 setAuxiliaryTopText:v15];

    v16 = [v5 auxiliaryMiddleText];
    [(SFSearchResult_SpotlightExtras *)v6 setAuxiliaryMiddleText:v16];

    v17 = [v5 auxiliaryBottomText];
    [(SFSearchResult_SpotlightExtras *)v6 setAuxiliaryBottomText:v17];

    -[SFSearchResult_SpotlightExtras setAuxiliaryBottomTextColor:](v6, "setAuxiliaryBottomTextColor:", [v5 auxiliaryBottomTextColor]);
    v18 = [v5 punchout];
    [(SFSearchResult_SpotlightExtras *)v6 setPunchout:v18];

    v19 = [v5 storeIdentifier];
    [(SFSearchResult_SpotlightExtras *)v6 setStoreIdentifier:v19];

    v20 = [v5 calendarIdentifier];
    [(SFSearchResult_SpotlightExtras *)v6 setCalendarIdentifier:v20];

    v21 = [v5 mapsData];
    [(SFSearchResult_SpotlightExtras *)v6 setMapsData:v21];

    v22 = [v5 mapsResultType];
    [(SFSearchResult_SpotlightExtras *)v6 setMapsResultType:v22];

    v23 = [v5 mapsMoreURL];
    [(SFSearchResult_SpotlightExtras *)v6 setMapsMoreURL:v23];

    v24 = [v5 mapsMoreString];
    [(SFSearchResult_SpotlightExtras *)v6 setMapsMoreString:v24];

    v25 = [v5 mapsMoreIcon];
    [(SFSearchResult_SpotlightExtras *)v6 setMapsMoreIcon:v25];

    v26 = [v5 nearbyBusinessesString];
    [(SFSearchResult_SpotlightExtras *)v6 setNearbyBusinessesString:v26];

    v27 = [v5 appleReferrer];
    [(SFSearchResult_SpotlightExtras *)v6 setAppleReferrer:v27];

    v28 = [v5 card];
    [(SFSearchResult_SpotlightExtras *)v6 setCard:v28];

    v29 = [v5 moreResults];
    [(SFSearchResult_SpotlightExtras *)v6 setMoreResults:v29];

    v30 = [v5 moreResultsPunchout];
    [(SFSearchResult_SpotlightExtras *)v6 setMoreResultsPunchout:v30];

    v31 = [v5 userActivityRequiredString];
    [(SFSearchResult_SpotlightExtras *)v6 setUserActivityRequiredString:v31];

    v32 = [v5 sectionHeader];
    [(SFSearchResult_SpotlightExtras *)v6 setSectionHeader:v32];

    v33 = [v5 sectionHeaderMore];
    [(SFSearchResult_SpotlightExtras *)v6 setSectionHeaderMore:v33];

    v34 = [v5 sectionHeaderMoreURL];
    [(SFSearchResult_SpotlightExtras *)v6 setSectionHeaderMoreURL:v34];

    -[SFSearchResult_SpotlightExtras setRenderHorizontallyWithOtherResultsInCategory:](v6, "setRenderHorizontallyWithOtherResultsInCategory:", [v5 renderHorizontallyWithOtherResultsInCategory]);
    -[SFSearchResult_SpotlightExtras setPlacement:](v6, "setPlacement:", [v5 placement]);
    -[SFSearchResult_SpotlightExtras setMinimumRankOfTopHitToSuppressResult:](v6, "setMinimumRankOfTopHitToSuppressResult:", [v5 minimumRankOfTopHitToSuppressResult]);
    v35 = [v5 resultTemplate];
    [(SFSearchResult_SpotlightExtras *)v6 setResultTemplate:v35];

    -[SFSearchResult_SpotlightExtras setIsQuickGlance:](v6, "setIsQuickGlance:", [v5 isQuickGlance]);
    -[SFSearchResult_SpotlightExtras setIsStreaming:](v6, "setIsStreaming:", [v5 isStreaming]);
    v36 = [v5 engagementScore];
    [(SFSearchResult_SpotlightExtras *)v6 setEngagementScore:v36];

    v37 = [v5 queryIndependentScore];
    [(SFSearchResult_SpotlightExtras *)v6 setQueryIndependentScore:v37];

    v38 = [v5 maxAge];
    [(SFSearchResult_SpotlightExtras *)v6 setMaxAge:v38];

    v39 = [v5 titleNote];
    [(SFSearchResult_SpotlightExtras *)v6 setTitleNote:v39];

    v40 = [v5 titleNoteSize];
    [(SFSearchResult_SpotlightExtras *)v6 setTitleNoteSize:v40];

    v41 = [v5 icon];
    [(SFSearchResult_SpotlightExtras *)v6 setIcon:v41];

    v42 = [v5 itemProviderDataTypes];
    [(SFSearchResult_SpotlightExtras *)v6 setItemProviderDataTypes:v42];

    v43 = [v5 itemProviderFileTypes];
    [(SFSearchResult_SpotlightExtras *)v6 setItemProviderFileTypes:v43];

    v44 = [v5 contentTypeTree];
    [(SFSearchResult_SpotlightExtras *)v6 setContentTypeTree:v44];

    -[SFSearchResult_SpotlightExtras setDataOwnerType:](v6, "setDataOwnerType:", [v5 dataOwnerType]);
    v45 = [v5 fileProviderIdentifier];
    [(SFSearchResult_SpotlightExtras *)v6 setFileProviderIdentifier:v45];

    v46 = [v5 fileProviderDomainIdentifier];
    [(SFSearchResult_SpotlightExtras *)v6 setFileProviderDomainIdentifier:v46];

    v47 = [v5 srf];
    [(SFSearchResult_SpotlightExtras *)v6 setSrf:v47];

    -[SFSearchResult_SpotlightExtras setDoNotFold:](v6, "setDoNotFold:", [v5 doNotFold]);
    v48 = [v5 localFeatures];
    [(SFSearchResult_SpotlightExtras *)v6 setLocalFeatures:v48];

    v49 = [v5 entityData];
    [(SFSearchResult_SpotlightExtras *)v6 setEntityData:v49];

    v50 = [v5 entityIdentifier];
    [(SFSearchResult_SpotlightExtras *)v6 setEntityIdentifier:v50];

    v51 = [v5 mapsData];
    [(SFSearchResult_SpotlightExtras *)v6 setMapsData:v51];

    v52 = [v5 normalizedTopic];
    [(SFSearchResult_SpotlightExtras *)v6 setNormalizedTopic:v52];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v53 = v5;
      -[SFSearchResult_SpotlightExtras setHasTextContentMatch:](v6, "setHasTextContentMatch:", [v53 hasTextContentMatch]);
      v54 = [v53 mapsPersonalizationResult];
      [(SFSearchResult_SpotlightExtras *)v6 setMapsPersonalizationResult:v54];

      v55 = [v53 backendData];
      v56 = (void *)[v55 mutableCopy];
      [(SFSearchResult_SpotlightExtras *)v6 setBackendData:v56];

      v57 = [v53 rankingItem];
      [(SFSearchResult_SpotlightExtras *)v6 setRankingItem:v57];

      v58 = [v53 answerAttributes];
      v59 = (void *)[v58 copy];
      [(SFSearchResult_SpotlightExtras *)v6 setAnswerAttributes:v59];

      v60 = [v53 contentURL];

      [(SFSearchResult_SpotlightExtras *)v6 setContentURL:v60];
    }
  }

  return v6;
}

- (SFSearchResult_SpotlightExtras)initWithResult:(id)a3
{
  id v4 = a3;
  id v5 = [(SFSearchResult_SpotlightExtras *)self initWithResult:v4 groupId:0];
  if (v5)
  {
    uint64_t v6 = [v4 lastUsedDate];
    lastUsedDate = v5->_lastUsedDate;
    v5->_lastUsedDate = (NSDate *)v6;

    [v4 l2score];
    v5->_l2score = v8;
    v5->_feedbackBlockId = [v4 feedbackBlockId];
  }

  return v5;
}

- (SFSearchResult_SpotlightExtras)initWithIdentifier:(id)a3 bundleIdentifier:(id)a4 protectionClass:(id)a5 attributeKeys:(id)a6 attributeValues:(id)a7
{
  return [(SFSearchResult_SpotlightExtras *)self initWithIdentifier:a3 bundleIdentifier:a4 protectionClass:a5 attributeKeys:a6 attributeValues:a7 type:0 completion:0];
}

- (SFSearchResult_SpotlightExtras)initWithIdentifier:(id)a3 bundleIdentifier:(id)a4 protectionClass:(id)a5 attributeKeys:(id)a6 attributeValues:(id)a7 type:(int)a8 completion:(id)a9
{
  v24 = self;
  id v27 = a3;
  id v26 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = a9;
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v18 = [v14 count];
  if (v18 == [v15 count] && v18)
  {
    for (uint64_t i = 0; i != v18; ++i)
    {
      v20 = objc_msgSend(v14, "objectAtIndexedSubscript:", i, v24);
      v21 = [v15 objectAtIndexedSubscript:i];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        [v17 setObject:v21 forKey:v20];
      }
    }
  }
  v22 = -[SFSearchResult_SpotlightExtras initWithIdentifier:bundleIdentifier:protectionClass:attributes:type:completion:](v24, "initWithIdentifier:bundleIdentifier:protectionClass:attributes:type:completion:", v27, v26, v13, v17, a8, v16, v24);

  return v22;
}

- (SFSearchResult_SpotlightExtras)initWithIdentifier:(id)a3 bundleIdentifier:(id)a4 protectionClass:(id)a5 attributes:(id)a6 type:(int)a7 completion:(id)a8
{
  uint64_t v9 = *(void *)&a7;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  v30.receiver = self;
  v30.super_class = (Class)SFSearchResult_SpotlightExtras;
  v19 = [(SFSearchResult_SpotlightExtras *)&v30 init];
  v20 = v19;
  if (v19)
  {
    [(SFSearchResult_SpotlightExtras *)v19 setIdentifier:v14];
    [(SFSearchResult_SpotlightExtras *)v20 setResultBundleId:v15];
    [(SFSearchResult_SpotlightExtras *)v20 setSectionBundleIdentifier:v15];
    [(SFSearchResult_SpotlightExtras *)v20 setApplicationBundleIdentifier:v15];
    [(SFSearchResult_SpotlightExtras *)v20 setType:v9];
    [(SFSearchResult_SpotlightExtras *)v20 setCompletion:v18];
    [(SFSearchResult_SpotlightExtras *)v20 setProtectionClass:v16];
    [(SFSearchResult_SpotlightExtras *)v20 setBackendData:v17];
    v21 = [(SFSearchResult_SpotlightExtras *)v20 valueForAttribute:*MEMORY[0x1E4F22C60] withType:objc_opt_class()];
    [(SFSearchResult_SpotlightExtras *)v20 setContentType:v21];

    v22 = [(SFSearchResult_SpotlightExtras *)v20 valueForAttribute:*MEMORY[0x1E4F22C68] withType:objc_opt_class()];
    [(SFSearchResult_SpotlightExtras *)v20 setContentTypeTree:v22];

    v23 = [(SFSearchResult_SpotlightExtras *)v20 valueForAttribute:*MEMORY[0x1E4F22FB0] withType:objc_opt_class()];
    [(SFSearchResult_SpotlightExtras *)v20 setFileProviderIdentifier:v23];

    v24 = [(SFSearchResult_SpotlightExtras *)v20 valueForAttribute:*MEMORY[0x1E4F22FA8] withType:objc_opt_class()];
    [(SFSearchResult_SpotlightExtras *)v20 setFileProviderDomainIdentifier:v24];

    uint64_t v25 = [(SFSearchResult_SpotlightExtras *)v20 valueForAttribute:*MEMORY[0x1E4F234D0] withType:objc_opt_class()];
    relatedAppIdentifier = v20->_relatedAppIdentifier;
    v20->_relatedAppIdentifier = (NSString *)v25;

    uint64_t v27 = [(SFSearchResult_SpotlightExtras *)v20 valueForAttribute:*MEMORY[0x1E4F23530] withType:objc_opt_class()];
    displayOrder = v20->_displayOrder;
    v20->_displayOrder = (NSNumber *)v27;
  }
  return v20;
}

- (id)debugDescription
{
  v3 = [(SFSearchResult_SpotlightExtras *)self title];
  id v4 = [v3 text];

  if (!v4)
  {
    id v5 = [(SFSearchResult_SpotlightExtras *)self compactCard];
    uint64_t v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      id v7 = [(SFSearchResult_SpotlightExtras *)self inlineCard];
    }
    float v8 = v7;

    uint64_t v9 = [v8 cardSections];
    v10 = [v9 firstObject];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [v10 title];
      id v4 = [v11 text];
    }
    else
    {
      id v4 = 0;
    }
  }
  v12 = (void *)MEMORY[0x1E4F28E78];
  id v13 = (objc_class *)objc_opt_class();
  id v14 = NSStringFromClass(v13);
  id v15 = [(SFSearchResult_SpotlightExtras *)self sectionBundleIdentifier];
  id v16 = [v12 stringWithFormat:@"<%@ %p> %@ (%@)", v14, self, v4, v15];

  id v17 = [(SFSearchResult_SpotlightExtras *)self sectionBundleIdentifier];
  LODWORD(v15) = SSSectionIsSyndicatedPhotos(v17);

  if (v15)
  {
    id v18 = [(SFSearchResult_SpotlightExtras *)self inlineCard];
    v19 = [v18 cardSections];
    v20 = [v19 firstObject];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = [v20 cardSections];
      v22 = [v21 firstObject];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v23 = [v22 thumbnail];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v24 = [v23 photoIdentifier];
          uint64_t v25 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v23, "isSyndicated"));
          [v16 appendFormat:@" PhotoId: %@ isSyndicated: %@", v24, v25];
        }
      }
    }
  }

  return v16;
}

- (id)ttrDescription
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = [(SFSearchResult_SpotlightExtras *)self debugDescription];
  id v5 = [v3 stringWithString:v4];

  uint64_t v6 = [(SFSearchResult_SpotlightExtras *)self rankingItem];
  unsigned int v7 = [v6 hasShortCut];
  float v8 = [v6 L2FeatureVector];
  uint64_t v9 = [(SFSearchResult_SpotlightExtras *)self applicationBundleIdentifier];
  v10 = (void *)v9;
  if (v9)
  {
    [v5 appendFormat:@"\n\t\tselfBundle:%@", v9];
  }
  else
  {
    v11 = [(SFSearchResult_SpotlightExtras *)self resultBundleId];
    [v5 appendFormat:@"\n\t\tselfBundle:%@", v11];
  }
  [v8 originalL2Score];
  objc_msgSend(v5, "appendFormat:", @"\toriginalL2:%.3f", v12);
  [v8 experimentalScore];
  objc_msgSend(v5, "appendFormat:", @"\texperimentalScore:%.3f", v13);
  [v6 rawScore];
  objc_msgSend(v5, "appendFormat:", @"\n\t\trawScore:%.3f", v14);
  [v6 score];
  objc_msgSend(v5, "appendFormat:", @"\tscore:%.3f", v15);
  [(SFSearchResult_SpotlightExtras *)self l2score];
  objc_msgSend(v5, "appendFormat:", @"\tL2Score:%.3f", v16);
  [v8 scoreForFeature:386];
  objc_msgSend(v5, "appendFormat:", @"\n\t\tparsecEnumScore:%.3f", v17);
  [v8 withinBundleScore];
  objc_msgSend(v5, "appendFormat:", @"\tL2VectorWithinBundleScore:%.3f", v18);
  [v6 withinBundleScore];
  objc_msgSend(v5, "appendFormat:", @"\twithinBundleScore:%.3f", v19);
  [v8 scoreForFeature:366];
  objc_msgSend(v5, "appendFormat:", @"\n\t\tcep:%.6f", v20);
  objc_msgSend(v5, "appendFormat:", @"\ttopHit:%d", -[SFSearchResult_SpotlightExtras topHit](self, "topHit"));
  objc_msgSend(v5, "appendFormat:", @"\tblockId:%llu", -[SFSearchResult_SpotlightExtras blockId](self, "blockId"));
  objc_msgSend(v5, "appendFormat:", @"\n\t\tsafariTophit:%d", -[SFSearchResult_SpotlightExtras isSafariTopHit](self, "isSafariTopHit"));
  objc_msgSend(v5, "appendFormat:", @"\thasShortcut:%d", v7);
  objc_msgSend(v5, "appendFormat:", @"\tisFuzzyMatch:%d", -[SFSearchResult_SpotlightExtras isFuzzyMatch](self, "isFuzzyMatch"));
  objc_msgSend(v5, "appendFormat:", @"\n\t\tshouldUseCompactDisplay:%d", -[SFSearchResult_SpotlightExtras shouldUseCompactDisplay](self, "shouldUseCompactDisplay"));
  objc_msgSend(v5, "appendFormat:", @"\tusesCompactDisplay:%d", -[SFSearchResult_SpotlightExtras usesCompactDisplay](self, "usesCompactDisplay"));
  objc_msgSend(v5, "appendFormat:", @"\tusesTopHitDisplay:%d", -[SFSearchResult_SpotlightExtras usesTopHitDisplay](self, "usesTopHitDisplay"));
  objc_msgSend(v5, "appendFormat:", @"\tshouldHideUnderShowMore:%d", objc_msgSend(v6, "shouldHideUnderShowMore"));
  objc_msgSend(v5, "appendFormat:", @"\n\t\tphotosMatch:%d", objc_msgSend(v6, "photosMatch"));
  if (SSResultTypeIsLocalSuggestion([(SFSearchResult_SpotlightExtras *)self type]))
  {
    objc_msgSend(v5, "appendFormat:", @"\ttype:%d", -[SFSearchResult_SpotlightExtras type](self, "type"));
    [(SFSearchResult_SpotlightExtras *)self rankingScore];
    objc_msgSend(v5, "appendFormat:", @"\trankingScore:%f", v21);
  }

  return v5;
}

- (id)getStableServerResultIdentifier
{
  v3 = [(SFSearchResult_SpotlightExtras *)self sectionBundleIdentifier];
  if (![v3 isEqualToString:@"com.apple.parsec.stocks"])
  {
LABEL_5:

    goto LABEL_6;
  }
  id v4 = [(SFSearchResult_SpotlightExtras *)self identifier];
  int v5 = [v4 hasSuffix:@"high_low"];

  if (v5)
  {
    uint64_t v6 = [(SFSearchResult_SpotlightExtras *)self identifier];
    v3 = [v6 componentsSeparatedByString:@"-"];

    if ([v3 count] == 3)
    {
      unsigned int v7 = NSString;
      float v8 = [v3 objectAtIndexedSubscript:1];
      uint64_t v9 = [v7 stringWithFormat:@"st:%@", v8];

      goto LABEL_7;
    }
    goto LABEL_5;
  }
LABEL_6:
  uint64_t v9 = [(SFSearchResult_SpotlightExtras *)self identifier];
LABEL_7:
  return v9;
}

- (id)urlValueForAttribute:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(SFSearchResult_SpotlightExtras *)self valueForAttribute:v4 withType:objc_opt_class()];
  if (!v5)
  {
    uint64_t v6 = [(SFSearchResult_SpotlightExtras *)self valueForAttribute:v4 withType:objc_opt_class()];
    if ([v6 length])
    {
      int v5 = [MEMORY[0x1E4F1CB10] URLWithString:v6];
      unsigned int v7 = SSGeneralLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v9 = 138412290;
        id v10 = v4;
        _os_log_impl(&dword_1BDB2A000, v7, OS_LOG_TYPE_INFO, "%@ found to be NSString instead of NSURL. Converting to NSURL.", (uint8_t *)&v9, 0xCu);
      }
    }
    else
    {
      int v5 = 0;
    }
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setFeedbackPropertiesOnResultCopy:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)SFSearchResult_SpotlightExtras;
  [(SFSearchResult *)&v24 setFeedbackPropertiesOnResultCopy:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v5 = [(SFSearchResult_SpotlightExtras *)self duplicatedItems];
    [v4 setDuplicatedItems:v5];

    uint64_t v6 = [(SFSearchResult_SpotlightExtras *)self attributeData];
    [v4 setAttributeData:v6];

    unsigned int v7 = [(SFSearchResult_SpotlightExtras *)self personIdentifier];
    [v4 setPersonIdentifier:v7];

    float v8 = [(SFSearchResult_SpotlightExtras *)self personQueryIdentifier];
    [v4 setPersonQueryIdentifier:v8];

    int v9 = [(SFSearchResult_SpotlightExtras *)self relatedAppIdentifier];
    [v4 setRelatedAppIdentifier:v9];

    id v10 = [(SFSearchResult_SpotlightExtras *)self displayOrder];
    [v4 setDisplayOrder:v10];

    objc_msgSend(v4, "setIsAppClip:", -[SFSearchResult_SpotlightExtras isAppClip](self, "isAppClip"));
    objc_msgSend(v4, "setIsWebClip:", -[SFSearchResult_SpotlightExtras isWebClip](self, "isWebClip"));
    uint64_t v11 = [(SFSearchResult_SpotlightExtras *)self userActivityType];
    [v4 setUserActivityType:v11];

    float v12 = [(SFSearchResult_SpotlightExtras *)self userActivityRequiredString];
    [v4 setUserActivityRequiredString:v12];

    float v13 = [(SFSearchResult_SpotlightExtras *)self userActivityType];
    char v14 = [v13 isEqualToString:@"/app/intents"];

    if (v14)
    {
      uint64_t v15 = 3;
LABEL_9:
      [v4 setPredictionsFeedbackActionType:v15];
      float v19 = [(SFSearchResult_SpotlightExtras *)self protectionClass];
      [v4 setProtectionClass:v19];

      float v20 = [(SFSearchResult_SpotlightExtras *)self launchString];
      [v4 setLaunchString:v20];

      uint64_t v21 = [(SFSearchResult_SpotlightExtras *)self suggestionsFeedbackData];
      [v4 setSuggestionsFeedbackData:v21];

      v22 = [(SFSearchResult_SpotlightExtras *)self mapsPersonalizationResult];
      [v4 setMapsPersonalizationResult:v22];

      v23 = [(SFSearchResult_SpotlightExtras *)self answerAttributes];
      [v4 setAnswerAttributes:v23];

      goto LABEL_10;
    }
    float v16 = [(SFSearchResult_SpotlightExtras *)self userActivityRequiredString];
    if ([v16 length])
    {
      float v17 = [(SFSearchResult_SpotlightExtras *)self userActivityType];
      uint64_t v18 = [v17 length];

      if (v18)
      {
        uint64_t v15 = 1;
        goto LABEL_9;
      }
    }
    else
    {
    }
    uint64_t v15 = 4;
    goto LABEL_9;
  }
LABEL_10:
}

- (SFSearchResult_SpotlightExtras)init
{
  v3.receiver = self;
  v3.super_class = (Class)SFSearchResult_SpotlightExtras;
  return [(SFSearchResult_SpotlightExtras *)&v3 init];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    userDefaults_0 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.searchd"];
    MEMORY[0x1F41817F8]();
  }
}

- (SFSearchResult_SpotlightExtras)initWithCoder:(id)a3
{
  id v4 = a3;
  v57.receiver = self;
  v57.super_class = (Class)SFSearchResult_SpotlightExtras;
  int v5 = [(SFSearchResult_SpotlightExtras *)&v57 initWithCoder:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    unsigned int v7 = [(SFSearchResult_SpotlightExtras *)v5 url];

    if (v7)
    {
      float v8 = [(SFSearchResult_SpotlightExtras *)v6 url];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        -[SFSearchResult_SpotlightExtras initWithCoder:]();
      }
    }
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_protectionClass"];
    protectionClass = v6->_protectionClass;
    v6->_protectionClass = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_launchString"];
    launchString = v6->_launchString;
    v6->_launchString = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_filename"];
    filename = v6->_filename;
    v6->_filename = (NSString *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_fileIdentifier"];
    fileIdentifier = v6->_fileIdentifier;
    v6->_fileIdentifier = (NSNumber *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_parentFileIdentifier"];
    parentFileIdentifier = v6->_parentFileIdentifier;
    v6->_parentFileIdentifier = (NSNumber *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_documentIdentifier"];
    documentIdentifier = v6->_documentIdentifier;
    v6->_documentIdentifier = (NSNumber *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_userActivityType"];
    userActivityType = v6->_userActivityType;
    v6->_userActivityType = (NSString *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_contentURL"];
    contentURL = v6->_contentURL;
    v6->_contentURL = (NSString *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_personIdentifier"];
    personIdentifier = v6->_personIdentifier;
    v6->_personIdentifier = (NSString *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_personQueryIdentifier"];
    personQueryIdentifier = v6->_personQueryIdentifier;
    v6->_personQueryIdentifier = (NSString *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_relatedAppIdentifier"];
    relatedAppIdentifier = v6->_relatedAppIdentifier;
    v6->_relatedAppIdentifier = (NSString *)v29;

    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_displayOrder"];
    displayOrder = v6->_displayOrder;
    v6->_displayOrder = (NSNumber *)v31;

    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_suggestionsFeedbackData"];
    suggestionsFeedbackData = v6->_suggestionsFeedbackData;
    v6->_suggestionsFeedbackData = (NSData *)v33;

    v6->_hasCommunicationContent = [v4 decodeBoolForKey:@"_hasCommunicationContent"];
    v6->_hasTextContent = [v4 decodeBoolForKey:@"_hasTextContent"];
    v6->_hasTextContentMatch = [v4 decodeBoolForKey:@"_hasTextContentMatch"];
    v6->_predictionsFeedbackActionType = [v4 decodeIntegerForKey:@"_predictionsFeedbackActionType"];
    [v4 decodeFloatForKey:@"_l2score"];
    v6->_l2score = v35;
    v36 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v37 = objc_opt_class();
    v38 = objc_msgSend(v36, "setWithObjects:", v37, objc_opt_class(), 0);
    uint64_t v39 = [v4 decodeObjectOfClasses:v38 forKey:@"_duplicatedItems"];
    duplicatedItems = v6->_duplicatedItems;
    v6->_duplicatedItems = (NSMutableArray *)v39;

    uint64_t v41 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_attributeData"];
    attributeData = v6->_attributeData;
    v6->_attributeData = (NSData *)v41;

    uint64_t v43 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_lastUsedDate"];
    lastUsedDate = v6->_lastUsedDate;
    v6->_lastUsedDate = (NSDate *)v43;

    v45 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_isAppClip"];
    v6->_isAppClip = [v45 BOOLValue];

    v46 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_isWebClip"];
    v6->_isWebClip = [v46 BOOLValue];

    uint64_t v47 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_rankingItem"];
    rankingItem = v6->_rankingItem;
    v6->_rankingItem = (PRSRankingItem *)v47;

    if (!v6->_rankingItem)
    {
      v49 = objc_alloc_init(PRSRankingItem);
      v50 = v6->_rankingItem;
      v6->_rankingItem = v49;
    }
    v51 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_l2Signals"];
    [(PRSRankingItem *)v6->_rankingItem setL2Signals:v51];

    uint64_t v52 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_mapsPersonalizationResult"];
    mapsPersonalizationResult = v6->_mapsPersonalizationResult;
    v6->_mapsPersonalizationResult = (IQFMapsPersonalizationResult *)v52;

    uint64_t v54 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_answerAttributes"];
    answerAttributes = v6->_answerAttributes;
    v6->_answerAttributes = (NSArray *)v54;
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = [(SFSearchResult_SpotlightExtras *)self url];

  if (v5)
  {
    uint64_t v6 = [(SFSearchResult_SpotlightExtras *)self url];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      -[SFSearchResult_SpotlightExtras encodeWithCoder:]();
    }
  }
  v33.receiver = self;
  v33.super_class = (Class)SFSearchResult_SpotlightExtras;
  [(SFSearchResult_SpotlightExtras *)&v33 encodeWithCoder:v4];
  protectionClass = self->_protectionClass;
  if (protectionClass) {
    [v4 encodeObject:protectionClass forKey:@"_protectionClass"];
  }
  launchString = self->_launchString;
  if (launchString) {
    [v4 encodeObject:launchString forKey:@"_launchString"];
  }
  filename = self->_filename;
  if (filename) {
    [v4 encodeObject:filename forKey:@"_filename"];
  }
  fileIdentifier = self->_fileIdentifier;
  if (fileIdentifier) {
    [v4 encodeObject:fileIdentifier forKey:@"_fileIdentifier"];
  }
  parentFileIdentifier = self->_parentFileIdentifier;
  if (parentFileIdentifier) {
    [v4 encodeObject:parentFileIdentifier forKey:@"_parentFileIdentifier"];
  }
  documentIdentifier = self->_documentIdentifier;
  if (documentIdentifier) {
    [v4 encodeObject:documentIdentifier forKey:@"_documentIdentifier"];
  }
  userActivityType = self->_userActivityType;
  if (userActivityType) {
    [v4 encodeObject:userActivityType forKey:@"_userActivityType"];
  }
  contentURL = self->_contentURL;
  if (contentURL) {
    [v4 encodeObject:contentURL forKey:@"_contentURL"];
  }
  personIdentifier = self->_personIdentifier;
  if (personIdentifier) {
    [v4 encodeObject:personIdentifier forKey:@"_personIdentifier"];
  }
  personQueryIdentifier = self->_personQueryIdentifier;
  if (personQueryIdentifier) {
    [v4 encodeObject:personQueryIdentifier forKey:@"_personQueryIdentifier"];
  }
  relatedAppIdentifier = self->_relatedAppIdentifier;
  if (relatedAppIdentifier) {
    [v4 encodeObject:relatedAppIdentifier forKey:@"_relatedAppIdentifier"];
  }
  displayOrder = self->_displayOrder;
  if (displayOrder) {
    [v4 encodeObject:displayOrder forKey:@"_displayOrder"];
  }
  suggestionsFeedbackData = self->_suggestionsFeedbackData;
  if (suggestionsFeedbackData) {
    [v4 encodeObject:suggestionsFeedbackData forKey:@"_suggestionsFeedbackData"];
  }
  if (self->_hasCommunicationContent) {
    [v4 encodeBool:1 forKey:@"_hasCommunicationContent"];
  }
  if (self->_hasTextContent) {
    [v4 encodeBool:1 forKey:@"_hasTextContent"];
  }
  if (self->_hasTextContentMatch) {
    [v4 encodeBool:1 forKey:@"_hasTextContentMatch"];
  }
  unint64_t predictionsFeedbackActionType = self->_predictionsFeedbackActionType;
  if (predictionsFeedbackActionType) {
    [v4 encodeInteger:predictionsFeedbackActionType forKey:@"_predictionsFeedbackActionType"];
  }
  *(float *)&double v7 = self->_l2score;
  [v4 encodeFloat:@"_l2score" forKey:v7];
  duplicatedItems = self->_duplicatedItems;
  if (duplicatedItems) {
    [v4 encodeObject:duplicatedItems forKey:@"_duplicatedItems"];
  }
  attributeData = self->_attributeData;
  if (attributeData) {
    [v4 encodeObject:attributeData forKey:@"_attributeData"];
  }
  lastUsedDate = self->_lastUsedDate;
  if (lastUsedDate) {
    [v4 encodeObject:lastUsedDate forKey:@"_lastUsedDate"];
  }
  if (self->_isAppClip)
  {
    uint64_t v25 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
    [v4 encodeObject:v25 forKey:@"_isAppClip"];
  }
  if (self->_isWebClip)
  {
    id v26 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
    [v4 encodeObject:v26 forKey:@"_isWebClip"];
  }
  rankingItem = self->_rankingItem;
  if (rankingItem)
  {
    [v4 encodeObject:rankingItem forKey:@"_rankingItem"];
    v28 = self->_rankingItem;
  }
  else
  {
    v28 = 0;
  }
  uint64_t v29 = [(PRSRankingItem *)v28 l2Signals];

  if (v29)
  {
    objc_super v30 = [(PRSRankingItem *)self->_rankingItem l2Signals];
    [v4 encodeObject:v30 forKey:@"_l2Signals"];
  }
  mapsPersonalizationResult = self->_mapsPersonalizationResult;
  if (mapsPersonalizationResult) {
    [v4 encodeObject:mapsPersonalizationResult forKey:@"_mapsPersonalizationResult"];
  }
  answerAttributes = self->_answerAttributes;
  if (answerAttributes) {
    [v4 encodeObject:answerAttributes forKey:@"_answerAttributes"];
  }
}

- (void)setUrl:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      -[SFSearchResult_SpotlightExtras setUrl:]();
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)SFSearchResult_SpotlightExtras;
  [(SFSearchResult_SpotlightExtras *)&v5 setUrl:v4];
}

- (id)punchout
{
  v19.receiver = self;
  v19.super_class = (Class)SFSearchResult_SpotlightExtras;
  objc_super v3 = [(SFSearchResult_SpotlightExtras *)&v19 punchout];
  id v4 = v3;
  if (v3)
  {
    objc_super v5 = v3;
LABEL_5:
    double v7 = v5;
    goto LABEL_6;
  }
  cachedPunchout = self->_cachedPunchout;
  if (cachedPunchout)
  {
    objc_super v5 = cachedPunchout;
    goto LABEL_5;
  }
  uint64_t v9 = [(SFSearchResult_SpotlightExtras *)self resultBundleId];
  if ([v9 isEqualToString:@"com.apple.DocumentsApp"])
  {
    id v10 = [(SFSearchResult_SpotlightExtras *)self documentIdentifier];

    if (v10)
    {
      uint64_t v11 = (void *)MEMORY[0x1E4F1CB10];
      float v12 = [(SFSearchResult_SpotlightExtras *)self fileIdentifier];
      uint64_t v13 = [(SFSearchResult_SpotlightExtras *)self filename];
      char v14 = [(SFSearchResult_SpotlightExtras *)self parentFileIdentifier];
      uint64_t v15 = [(SFSearchResult_SpotlightExtras *)self documentIdentifier];
      float v16 = objc_msgSend(v11, "sp_URLFromFileID:filename:parentFileID:documentID:", v12, v13, v14, v15);

      if (v16)
      {
        uint64_t v17 = [MEMORY[0x1E4F9A2F8] punchoutWithURL:v16];
        uint64_t v18 = self->_cachedPunchout;
        self->_cachedPunchout = v17;

        double v7 = self->_cachedPunchout;
        goto LABEL_6;
      }
    }
  }
  else
  {
  }
  double v7 = 0;
LABEL_6:

  return v7;
}

- (BOOL)isSafariTopHitForQuery:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_super v5 = [(SFSearchResult_SpotlightExtras *)self contentURL];
    uint64_t v6 = v5;
    if (!v5)
    {
      NSLog(&cfstr_DidnTFindMdite.isa, self);
      goto LABEL_13;
    }
    if ([v5 hasPrefix:@"https://"])
    {
      uint64_t v7 = 8;
    }
    else
    {
      if (![v6 hasPrefix:@"http://"]) {
        goto LABEL_10;
      }
      uint64_t v7 = 7;
    }
    uint64_t v9 = [v6 substringFromIndex:v7];

    uint64_t v6 = (void *)v9;
LABEL_10:
    if ([v6 hasPrefix:@"www."])
    {
      uint64_t v10 = [v6 substringFromIndex:4];

      uint64_t v6 = (void *)v10;
    }
    if ([v6 rangeOfString:v4 options:9] != 0x7FFFFFFFFFFFFFFFLL)
    {
      BOOL v8 = 1;
      goto LABEL_15;
    }
LABEL_13:
    BOOL v8 = 0;
LABEL_15:

    goto LABEL_16;
  }
  BOOL v8 = 0;
LABEL_16:

  return v8;
}

- (NSData)suggestionsFeedbackData
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(SFSearchResult_SpotlightExtras *)self serverFeatures];
  objc_super v5 = v4;
  if (v4)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v23 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v11 = objc_msgSend(v6, "objectForKeyedSubscript:", v10, (void)v22);
          [v11 doubleValue];
          uint64_t v13 = SSRoundDouble(4, v12);
          [v3 setValue:v13 forKey:v10];
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v7);
    }
  }
  char v14 = SSRoundDouble(4, (double)(int)[(SFSearchResult_SpotlightExtras *)self type]);
  [v3 setValue:v14 forKey:@"type"];

  uint64_t v15 = [(SFSearchResult_SpotlightExtras *)self score];
  float v16 = SSRoundDouble(4, (double)*(unsigned long long *)&v15);
  [v3 setValue:v16 forKey:@"score"];

  uint64_t v17 = [(SFSearchResult_SpotlightExtras *)self completion];
  uint64_t v18 = SSRoundDouble(4, (double)(unint64_t)[v17 length]);
  [v3 setValue:v18 forKey:@"slen"];

  objc_super v19 = SSRoundUInt64(1uLL);
  [v3 setValue:v19 forKey:@"extras"];

  float v20 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v3 options:2 error:0];

  return (NSData *)v20;
}

- (id)valueForAttribute:(id)a3 withType:(Class)a4
{
  id v5 = a3;
  id v6 = [(SFSearchResult_SpotlightExtras *)self backendData];
  if (!v6)
  {
    uint64_t v7 = [(SFSearchResult_SpotlightExtras *)self attributeData];

    if (!v7) {
      goto LABEL_5;
    }
    id v8 = objc_alloc(MEMORY[0x1E4F237C8]);
    id v6 = [(SFSearchResult_SpotlightExtras *)self attributeData];
    uint64_t v9 = (void *)[v8 initWithData:v6];
    uint64_t v10 = [v9 decode];
    uint64_t v11 = (void *)[v10 mutableCopy];
    [(SFSearchResult_SpotlightExtras *)self setBackendData:v11];
  }
LABEL_5:
  double v12 = [(SFSearchResult_SpotlightExtras *)self backendData];
  uint64_t v13 = [v12 objectForKey:v5];

  if (objc_opt_isKindOfClass()) {
    char v14 = v13;
  }
  else {
    char v14 = 0;
  }
  id v15 = v14;

  return v15;
}

- (NSString)protectionClass
{
  return self->_protectionClass;
}

- (void)setProtectionClass:(id)a3
{
}

- (NSNumber)fileIdentifier
{
  return self->_fileIdentifier;
}

- (void)setFileIdentifier:(id)a3
{
}

- (NSNumber)parentFileIdentifier
{
  return self->_parentFileIdentifier;
}

- (void)setParentFileIdentifier:(id)a3
{
}

- (NSString)filename
{
  return self->_filename;
}

- (void)setFilename:(id)a3
{
}

- (NSNumber)documentIdentifier
{
  return self->_documentIdentifier;
}

- (void)setDocumentIdentifier:(id)a3
{
}

- (uint64_t)score
{
  return *(void *)(a1 + 992);
}

- (void)setScore:(SFSearchResult_SpotlightExtras *)self
{
  *(void *)self->_score = v2;
  *(void *)&self->_score[8] = v3;
}

- (float)l2score
{
  return self->_l2score;
}

- (void)setL2score:(float)a3
{
  self->_l2score = a3;
}

- (NSString)launchString
{
  return self->_launchString;
}

- (void)setLaunchString:(id)a3
{
}

- (NSDate)lastUsedDate
{
  return self->_lastUsedDate;
}

- (void)setLastUsedDate:(id)a3
{
}

- (NSString)userActivityType
{
  return self->_userActivityType;
}

- (void)setUserActivityType:(id)a3
{
}

- (NSMutableArray)duplicatedItems
{
  return self->_duplicatedItems;
}

- (void)setDuplicatedItems:(id)a3
{
}

- (NSString)contentURL
{
  return self->_contentURL;
}

- (void)setContentURL:(id)a3
{
}

- (NSString)personIdentifier
{
  return self->_personIdentifier;
}

- (void)setPersonIdentifier:(id)a3
{
}

- (NSString)personQueryIdentifier
{
  return self->_personQueryIdentifier;
}

- (void)setPersonQueryIdentifier:(id)a3
{
}

- (NSString)relatedAppIdentifier
{
  return self->_relatedAppIdentifier;
}

- (void)setRelatedAppIdentifier:(id)a3
{
}

- (NSString)personalAnswerString
{
  return self->_personalAnswerString;
}

- (void)setPersonalAnswerString:(id)a3
{
}

- (NSArray)answerAttributes
{
  return self->_answerAttributes;
}

- (void)setAnswerAttributes:(id)a3
{
}

- (NSNumber)displayOrder
{
  return self->_displayOrder;
}

- (void)setDisplayOrder:(id)a3
{
}

- (PRSRankingItem)rankingItem
{
  return (PRSRankingItem *)objc_getProperty(self, a2, 928, 1);
}

- (void)setRankingItem:(id)a3
{
}

- (void)setSuggestionsFeedbackData:(id)a3
{
}

- (unsigned)feedbackBlockId
{
  return self->_feedbackBlockId;
}

- (void)setFeedbackBlockId:(unsigned int)a3
{
  self->_feedbackBlockId = a3;
}

- (BOOL)hasCommunicationContent
{
  return self->_hasCommunicationContent;
}

- (void)setHasCommunicationContent:(BOOL)a3
{
  self->_hasCommunicationContent = a3;
}

- (BOOL)hasTextContent
{
  return self->_hasTextContent;
}

- (void)setHasTextContent:(BOOL)a3
{
  self->_hasTextContent = a3;
}

- (unint64_t)predictionsFeedbackActionType
{
  return self->_predictionsFeedbackActionType;
}

- (void)setPredictionsFeedbackActionType:(unint64_t)a3
{
  self->_unint64_t predictionsFeedbackActionType = a3;
}

- (BOOL)forceNoTopHit
{
  return self->_forceNoTopHit;
}

- (void)setForceNoTopHit:(BOOL)a3
{
  self->_forceNoTopHit = a3;
}

- (BOOL)isAppClip
{
  return self->_isAppClip;
}

- (void)setIsAppClip:(BOOL)a3
{
  self->_isAppClip = a3;
}

- (BOOL)isWebClip
{
  return self->_isWebClip;
}

- (void)setIsWebClip:(BOOL)a3
{
  self->_isWebClip = a3;
}

- (BOOL)isSafariTopHit
{
  return self->_isSafariTopHit;
}

- (void)setIsSafariTopHit:(BOOL)a3
{
  self->_isSafariTopHit = a3;
}

- (NSData)attributeData
{
  return self->_attributeData;
}

- (void)setAttributeData:(id)a3
{
}

- (IQFMapsPersonalizationResult)mapsPersonalizationResult
{
  return (IQFMapsPersonalizationResult *)objc_getProperty(self, a2, 960, 1);
}

- (void)setMapsPersonalizationResult:(id)a3
{
}

- (NSString)personType
{
  return self->_personType;
}

- (void)setPersonType:(id)a3
{
}

- (BOOL)hasTextContentMatch
{
  return self->_hasTextContentMatch;
}

- (void)setHasTextContentMatch:(BOOL)a3
{
  self->_hasTextContentMatch = a3;
}

- (NSMutableDictionary)backendData
{
  return self->_backendData;
}

- (void)setBackendData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backendData, 0);
  objc_storeStrong((id *)&self->_personType, 0);
  objc_storeStrong((id *)&self->_mapsPersonalizationResult, 0);
  objc_storeStrong((id *)&self->_attributeData, 0);
  objc_storeStrong((id *)&self->_suggestionsFeedbackData, 0);
  objc_storeStrong((id *)&self->_rankingItem, 0);
  objc_storeStrong((id *)&self->_displayOrder, 0);
  objc_storeStrong((id *)&self->_answerAttributes, 0);
  objc_storeStrong((id *)&self->_personalAnswerString, 0);
  objc_storeStrong((id *)&self->_relatedAppIdentifier, 0);
  objc_storeStrong((id *)&self->_personQueryIdentifier, 0);
  objc_storeStrong((id *)&self->_personIdentifier, 0);
  objc_storeStrong((id *)&self->_contentURL, 0);
  objc_storeStrong((id *)&self->_duplicatedItems, 0);
  objc_storeStrong((id *)&self->_userActivityType, 0);
  objc_storeStrong((id *)&self->_lastUsedDate, 0);
  objc_storeStrong((id *)&self->_launchString, 0);
  objc_storeStrong((id *)&self->_documentIdentifier, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_parentFileIdentifier, 0);
  objc_storeStrong((id *)&self->_fileIdentifier, 0);
  objc_storeStrong((id *)&self->_protectionClass, 0);
  objc_storeStrong((id *)&self->_cachedPunchout, 0);
}

- (void)initWithCoder:.cold.1()
{
}

- (void)encodeWithCoder:.cold.1()
{
}

- (void)setUrl:.cold.1()
{
}

@end