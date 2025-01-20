@interface PPRankableSocialHighlight
+ (Class)applicationIdentifiersType;
+ (Class)calculatedFeaturesType;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BOOL)fromMeEntitlementOverrideIsPresent;
- (BOOL)hasAttributionIdentifier;
- (BOOL)hasBatchIdentifier;
- (BOOL)hasClientIdentifier;
- (BOOL)hasCollaborationIdentifier;
- (BOOL)hasContentCreationSecondsSinceReferenceDate;
- (BOOL)hasContentDisplayName;
- (BOOL)hasContentType;
- (BOOL)hasDisplayName;
- (BOOL)hasDomainIdentifier;
- (BOOL)hasFileProviderId;
- (BOOL)hasFirstPassScore;
- (BOOL)hasFromMeEntitlementOverrideIsPresent;
- (BOOL)hasGroupPhotoPathDigest;
- (BOOL)hasHandleToIdentityMap;
- (BOOL)hasHighlightIdentifier;
- (BOOL)hasHighlightType;
- (BOOL)hasIsCollaboration;
- (BOOL)hasIsConversationAutoDonating;
- (BOOL)hasIsPrimary;
- (BOOL)hasIsTopKResult;
- (BOOL)hasLocalIdentity;
- (BOOL)hasLocalIdentityProof;
- (BOOL)hasOriginatingDeviceId;
- (BOOL)hasRank;
- (BOOL)hasRankingSecondsSinceReferenceDate;
- (BOOL)hasResolvedUrl;
- (BOOL)hasResourceUrl;
- (BOOL)hasScore;
- (BOOL)hasSender;
- (BOOL)hasSourceBundleId;
- (BOOL)hasSyndicationSecondsSinceReferenceDate;
- (BOOL)hasTopKScore;
- (BOOL)hasVariant;
- (BOOL)isCollaboration;
- (BOOL)isConversationAutoDonating;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPrimary;
- (BOOL)isTopKResult;
- (BOOL)readFrom:(id)a3;
- (NSData)handleToIdentityMap;
- (NSData)localIdentity;
- (NSData)localIdentityProof;
- (NSMutableArray)applicationIdentifiers;
- (NSMutableArray)calculatedFeatures;
- (NSSet)featureNames;
- (NSString)attributionIdentifier;
- (NSString)batchIdentifier;
- (NSString)clientIdentifier;
- (NSString)collaborationIdentifier;
- (NSString)contentDisplayName;
- (NSString)contentType;
- (NSString)description;
- (NSString)displayName;
- (NSString)domainIdentifier;
- (NSString)fileProviderId;
- (NSString)groupPhotoPathDigest;
- (NSString)highlightIdentifier;
- (NSString)originatingDeviceId;
- (NSString)resolvedUrl;
- (NSString)resourceUrl;
- (NSString)sourceBundleId;
- (NSString)variant;
- (PPSocialHighlightContact)sender;
- (double)contentCreationSecondsSinceReferenceDate;
- (double)firstPassScore;
- (double)rankingSecondsSinceReferenceDate;
- (double)score;
- (double)syndicationSecondsSinceReferenceDate;
- (double)topKScore;
- (id)applicationIdentifiersAtIndex:(unint64_t)a3;
- (id)calculatedFeatureValueForKey:(id)a3;
- (id)calculatedFeaturesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)featureValueForName:(id)a3;
- (id)features;
- (id)highlightTypeAsString:(int)a3;
- (id)json;
- (int)StringAsHighlightType:(id)a3;
- (int)highlightType;
- (unint64_t)applicationIdentifiersCount;
- (unint64_t)calculatedFeaturesCount;
- (unint64_t)hash;
- (unsigned)dataVersion;
- (unsigned)rank;
- (void)addApplicationIdentifiers:(id)a3;
- (void)addCalculatedFeatures:(id)a3;
- (void)clearApplicationIdentifiers;
- (void)clearCalculatedFeatures;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setApplicationIdentifiers:(id)a3;
- (void)setAttributionIdentifier:(id)a3;
- (void)setBatchIdentifier:(id)a3;
- (void)setCalculatedFeatures:(id)a3;
- (void)setCalculatedFeaturesFromDictionary:(id)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setCollaborationIdentifier:(id)a3;
- (void)setContentCreationSecondsSinceReferenceDate:(double)a3;
- (void)setContentDisplayName:(id)a3;
- (void)setContentType:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setDomainIdentifier:(id)a3;
- (void)setFileProviderId:(id)a3;
- (void)setFirstPassScore:(double)a3;
- (void)setFromMeEntitlementOverrideIsPresent:(BOOL)a3;
- (void)setGroupPhotoPathDigest:(id)a3;
- (void)setHandleToIdentityMap:(id)a3;
- (void)setHasContentCreationSecondsSinceReferenceDate:(BOOL)a3;
- (void)setHasFirstPassScore:(BOOL)a3;
- (void)setHasFromMeEntitlementOverrideIsPresent:(BOOL)a3;
- (void)setHasHighlightType:(BOOL)a3;
- (void)setHasIsCollaboration:(BOOL)a3;
- (void)setHasIsConversationAutoDonating:(BOOL)a3;
- (void)setHasIsPrimary:(BOOL)a3;
- (void)setHasIsTopKResult:(BOOL)a3;
- (void)setHasRank:(BOOL)a3;
- (void)setHasRankingSecondsSinceReferenceDate:(BOOL)a3;
- (void)setHasScore:(BOOL)a3;
- (void)setHasSyndicationSecondsSinceReferenceDate:(BOOL)a3;
- (void)setHasTopKScore:(BOOL)a3;
- (void)setHighlightIdentifier:(id)a3;
- (void)setHighlightType:(int)a3;
- (void)setIsCollaboration:(BOOL)a3;
- (void)setIsConversationAutoDonating:(BOOL)a3;
- (void)setIsPrimary:(BOOL)a3;
- (void)setIsTopKResult:(BOOL)a3;
- (void)setLocalIdentity:(id)a3;
- (void)setLocalIdentityProof:(id)a3;
- (void)setOriginatingDeviceId:(id)a3;
- (void)setRank:(unsigned int)a3;
- (void)setRankingSecondsSinceReferenceDate:(double)a3;
- (void)setResolvedUrl:(id)a3;
- (void)setResourceUrl:(id)a3;
- (void)setScore:(double)a3;
- (void)setSender:(id)a3;
- (void)setSourceBundleId:(id)a3;
- (void)setSyndicationSecondsSinceReferenceDate:(double)a3;
- (void)setTopKScore:(double)a3;
- (void)setVariant:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PPRankableSocialHighlight

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variant, 0);
  objc_storeStrong((id *)&self->_sourceBundleId, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_resourceUrl, 0);
  objc_storeStrong((id *)&self->_resolvedUrl, 0);
  objc_storeStrong((id *)&self->_originatingDeviceId, 0);
  objc_storeStrong((id *)&self->_localIdentityProof, 0);
  objc_storeStrong((id *)&self->_localIdentity, 0);
  objc_storeStrong((id *)&self->_highlightIdentifier, 0);
  objc_storeStrong((id *)&self->_handleToIdentityMap, 0);
  objc_storeStrong((id *)&self->_groupPhotoPathDigest, 0);
  objc_storeStrong((id *)&self->_fileProviderId, 0);
  objc_storeStrong((id *)&self->_domainIdentifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_contentDisplayName, 0);
  objc_storeStrong((id *)&self->_collaborationIdentifier, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_calculatedFeatures, 0);
  objc_storeStrong((id *)&self->_batchIdentifier, 0);
  objc_storeStrong((id *)&self->_attributionIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationIdentifiers, 0);
}

- (BOOL)fromMeEntitlementOverrideIsPresent
{
  return self->_fromMeEntitlementOverrideIsPresent;
}

- (void)setHandleToIdentityMap:(id)a3
{
}

- (NSData)handleToIdentityMap
{
  return self->_handleToIdentityMap;
}

- (void)setLocalIdentityProof:(id)a3
{
}

- (NSData)localIdentityProof
{
  return self->_localIdentityProof;
}

- (void)setLocalIdentity:(id)a3
{
}

- (NSData)localIdentity
{
  return self->_localIdentity;
}

- (void)setFileProviderId:(id)a3
{
}

- (NSString)fileProviderId
{
  return self->_fileProviderId;
}

- (void)setContentDisplayName:(id)a3
{
}

- (NSString)contentDisplayName
{
  return self->_contentDisplayName;
}

- (void)setContentType:(id)a3
{
}

- (NSString)contentType
{
  return self->_contentType;
}

- (void)setCollaborationIdentifier:(id)a3
{
}

- (NSString)collaborationIdentifier
{
  return self->_collaborationIdentifier;
}

- (BOOL)isCollaboration
{
  return self->_isCollaboration;
}

- (double)firstPassScore
{
  return self->_firstPassScore;
}

- (double)topKScore
{
  return self->_topKScore;
}

- (BOOL)isTopKResult
{
  return self->_isTopKResult;
}

- (void)setVariant:(id)a3
{
}

- (NSString)variant
{
  return self->_variant;
}

- (void)setResolvedUrl:(id)a3
{
}

- (NSString)resolvedUrl
{
  return self->_resolvedUrl;
}

- (double)rankingSecondsSinceReferenceDate
{
  return self->_rankingSecondsSinceReferenceDate;
}

- (void)setOriginatingDeviceId:(id)a3
{
}

- (NSString)originatingDeviceId
{
  return self->_originatingDeviceId;
}

- (BOOL)isConversationAutoDonating
{
  return self->_isConversationAutoDonating;
}

- (double)score
{
  return self->_score;
}

- (unsigned)rank
{
  return self->_rank;
}

- (void)setAttributionIdentifier:(id)a3
{
}

- (NSString)attributionIdentifier
{
  return self->_attributionIdentifier;
}

- (BOOL)isPrimary
{
  return self->_isPrimary;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setGroupPhotoPathDigest:(id)a3
{
}

- (NSString)groupPhotoPathDigest
{
  return self->_groupPhotoPathDigest;
}

- (double)contentCreationSecondsSinceReferenceDate
{
  return self->_contentCreationSecondsSinceReferenceDate;
}

- (void)setClientIdentifier:(id)a3
{
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setCalculatedFeatures:(id)a3
{
}

- (NSMutableArray)calculatedFeatures
{
  return self->_calculatedFeatures;
}

- (void)setBatchIdentifier:(id)a3
{
}

- (NSString)batchIdentifier
{
  return self->_batchIdentifier;
}

- (void)setDomainIdentifier:(id)a3
{
}

- (NSString)domainIdentifier
{
  return self->_domainIdentifier;
}

- (void)setSender:(id)a3
{
}

- (PPSocialHighlightContact)sender
{
  return self->_sender;
}

- (void)setResourceUrl:(id)a3
{
}

- (NSString)resourceUrl
{
  return self->_resourceUrl;
}

- (void)setApplicationIdentifiers:(id)a3
{
}

- (NSMutableArray)applicationIdentifiers
{
  return self->_applicationIdentifiers;
}

- (void)setSourceBundleId:(id)a3
{
}

- (NSString)sourceBundleId
{
  return self->_sourceBundleId;
}

- (double)syndicationSecondsSinceReferenceDate
{
  return self->_syndicationSecondsSinceReferenceDate;
}

- (void)setHighlightIdentifier:(id)a3
{
}

- (NSString)highlightIdentifier
{
  return self->_highlightIdentifier;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 20)) {
    -[PPRankableSocialHighlight setHighlightIdentifier:](self, "setHighlightIdentifier:");
  }
  __int16 v5 = *((_WORD *)v4 + 128);
  if ((v5 & 0x40) != 0)
  {
    self->_highlightType = *((_DWORD *)v4 + 42);
    *(_WORD *)&self->_has |= 0x40u;
    __int16 v5 = *((_WORD *)v4 + 128);
  }
  if ((v5 & 0x10) != 0)
  {
    self->_syndicationSecondsSinceReferenceDate = *((double *)v4 + 5);
    *(_WORD *)&self->_has |= 0x10u;
  }
  if (*((void *)v4 + 29)) {
    -[PPRankableSocialHighlight setSourceBundleId:](self, "setSourceBundleId:");
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = *((id *)v4 + 7);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v6);
        }
        [(PPRankableSocialHighlight *)self addApplicationIdentifiers:*(void *)(*((void *)&v24 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v8);
  }

  if (*((void *)v4 + 27)) {
    -[PPRankableSocialHighlight setResourceUrl:](self, "setResourceUrl:");
  }
  sender = self->_sender;
  uint64_t v12 = *((void *)v4 + 28);
  if (sender)
  {
    if (v12) {
      -[PPSocialHighlightContact mergeFrom:](sender, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[PPRankableSocialHighlight setSender:](self, "setSender:");
  }
  if (*((void *)v4 + 16)) {
    -[PPRankableSocialHighlight setDomainIdentifier:](self, "setDomainIdentifier:");
  }
  if (*((void *)v4 + 9)) {
    -[PPRankableSocialHighlight setBatchIdentifier:](self, "setBatchIdentifier:");
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v13 = *((id *)v4 + 10);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        -[PPRankableSocialHighlight addCalculatedFeatures:](self, "addCalculatedFeatures:", *(void *)(*((void *)&v20 + 1) + 8 * j), (void)v20);
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v15);
  }

  if (*((void *)v4 + 11)) {
    -[PPRankableSocialHighlight setClientIdentifier:](self, "setClientIdentifier:");
  }
  if (*((_WORD *)v4 + 128))
  {
    self->_contentCreationSecondsSinceReferenceDate = *((double *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 18)) {
    -[PPRankableSocialHighlight setGroupPhotoPathDigest:](self, "setGroupPhotoPathDigest:");
  }
  if (*((void *)v4 + 15)) {
    -[PPRankableSocialHighlight setDisplayName:](self, "setDisplayName:");
  }
  if ((*((_WORD *)v4 + 128) & 0x800) != 0)
  {
    self->_isPrimary = *((unsigned char *)v4 + 251);
    *(_WORD *)&self->_has |= 0x800u;
  }
  if (*((void *)v4 + 8)) {
    -[PPRankableSocialHighlight setAttributionIdentifier:](self, "setAttributionIdentifier:");
  }
  __int16 v18 = *((_WORD *)v4 + 128);
  if ((v18 & 0x80) != 0)
  {
    self->_rank = *((_DWORD *)v4 + 50);
    *(_WORD *)&self->_has |= 0x80u;
    __int16 v18 = *((_WORD *)v4 + 128);
    if ((v18 & 8) == 0)
    {
LABEL_48:
      if ((v18 & 0x400) == 0) {
        goto LABEL_50;
      }
      goto LABEL_49;
    }
  }
  else if ((v18 & 8) == 0)
  {
    goto LABEL_48;
  }
  self->_score = *((double *)v4 + 4);
  *(_WORD *)&self->_has |= 8u;
  if ((*((_WORD *)v4 + 128) & 0x400) != 0)
  {
LABEL_49:
    self->_isConversationAutoDonating = *((unsigned char *)v4 + 250);
    *(_WORD *)&self->_has |= 0x400u;
  }
LABEL_50:
  if (*((void *)v4 + 24)) {
    -[PPRankableSocialHighlight setOriginatingDeviceId:](self, "setOriginatingDeviceId:");
  }
  if ((*((_WORD *)v4 + 128) & 4) != 0)
  {
    self->_rankingSecondsSinceReferenceDate = *((double *)v4 + 3);
    *(_WORD *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 26)) {
    -[PPRankableSocialHighlight setResolvedUrl:](self, "setResolvedUrl:");
  }
  if (*((void *)v4 + 30)) {
    -[PPRankableSocialHighlight setVariant:](self, "setVariant:");
  }
  __int16 v19 = *((_WORD *)v4 + 128);
  if ((v19 & 0x1000) != 0)
  {
    self->_isTopKResult = *((unsigned char *)v4 + 252);
    *(_WORD *)&self->_has |= 0x1000u;
    __int16 v19 = *((_WORD *)v4 + 128);
    if ((v19 & 0x20) == 0)
    {
LABEL_60:
      if ((v19 & 2) == 0) {
        goto LABEL_61;
      }
      goto LABEL_85;
    }
  }
  else if ((v19 & 0x20) == 0)
  {
    goto LABEL_60;
  }
  self->_topKScore = *((double *)v4 + 6);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v19 = *((_WORD *)v4 + 128);
  if ((v19 & 2) == 0)
  {
LABEL_61:
    if ((v19 & 0x200) == 0) {
      goto LABEL_63;
    }
    goto LABEL_62;
  }
LABEL_85:
  self->_firstPassScore = *((double *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  if ((*((_WORD *)v4 + 128) & 0x200) != 0)
  {
LABEL_62:
    self->_isCollaboration = *((unsigned char *)v4 + 249);
    *(_WORD *)&self->_has |= 0x200u;
  }
LABEL_63:
  if (*((void *)v4 + 12)) {
    -[PPRankableSocialHighlight setCollaborationIdentifier:](self, "setCollaborationIdentifier:");
  }
  if (*((void *)v4 + 14)) {
    -[PPRankableSocialHighlight setContentType:](self, "setContentType:");
  }
  if (*((void *)v4 + 13)) {
    -[PPRankableSocialHighlight setContentDisplayName:](self, "setContentDisplayName:");
  }
  if (*((void *)v4 + 17)) {
    -[PPRankableSocialHighlight setFileProviderId:](self, "setFileProviderId:");
  }
  if (*((void *)v4 + 22)) {
    -[PPRankableSocialHighlight setLocalIdentity:](self, "setLocalIdentity:");
  }
  if (*((void *)v4 + 23)) {
    -[PPRankableSocialHighlight setLocalIdentityProof:](self, "setLocalIdentityProof:");
  }
  if (*((void *)v4 + 19)) {
    -[PPRankableSocialHighlight setHandleToIdentityMap:](self, "setHandleToIdentityMap:");
  }
  if ((*((_WORD *)v4 + 128) & 0x100) != 0)
  {
    self->_fromMeEntitlementOverrideIsPresent = *((unsigned char *)v4 + 248);
    *(_WORD *)&self->_has |= 0x100u;
  }
}

- (unint64_t)hash
{
  NSUInteger v79 = [(NSString *)self->_highlightIdentifier hash];
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    uint64_t v78 = 2654435761 * self->_highlightType;
    if ((has & 0x10) != 0) {
      goto LABEL_3;
    }
LABEL_11:
    unint64_t v77 = 0;
    goto LABEL_12;
  }
  uint64_t v78 = 0;
  if ((has & 0x10) == 0) {
    goto LABEL_11;
  }
LABEL_3:
  double syndicationSecondsSinceReferenceDate = self->_syndicationSecondsSinceReferenceDate;
  double v5 = -syndicationSecondsSinceReferenceDate;
  if (syndicationSecondsSinceReferenceDate >= 0.0) {
    double v5 = self->_syndicationSecondsSinceReferenceDate;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  double v8 = fmod(v6, 1.84467441e19);
  unint64_t v9 = 2654435761u * (unint64_t)v8;
  unint64_t v10 = v9 + (unint64_t)v7;
  if (v7 <= 0.0) {
    unint64_t v10 = 2654435761u * (unint64_t)v8;
  }
  unint64_t v11 = v9 - (unint64_t)fabs(v7);
  if (v7 >= 0.0) {
    unint64_t v11 = v10;
  }
  unint64_t v77 = v11;
LABEL_12:
  NSUInteger v76 = [(NSString *)self->_sourceBundleId hash];
  uint64_t v75 = [(NSMutableArray *)self->_applicationIdentifiers hash];
  NSUInteger v74 = [(NSString *)self->_resourceUrl hash];
  unint64_t v73 = [(PPSocialHighlightContact *)self->_sender hash];
  NSUInteger v72 = [(NSString *)self->_domainIdentifier hash];
  NSUInteger v71 = [(NSString *)self->_batchIdentifier hash];
  uint64_t v70 = [(NSMutableArray *)self->_calculatedFeatures hash];
  NSUInteger v69 = [(NSString *)self->_clientIdentifier hash];
  if (*(_WORD *)&self->_has)
  {
    double contentCreationSecondsSinceReferenceDate = self->_contentCreationSecondsSinceReferenceDate;
    double v13 = -contentCreationSecondsSinceReferenceDate;
    if (contentCreationSecondsSinceReferenceDate >= 0.0) {
      double v13 = self->_contentCreationSecondsSinceReferenceDate;
    }
    long double v14 = floor(v13 + 0.5);
    double v15 = (v13 - v14) * 1.84467441e19;
    double v16 = fmod(v14, 1.84467441e19);
    unint64_t v17 = 2654435761u * (unint64_t)v16;
    unint64_t v18 = v17 + (unint64_t)v15;
    if (v15 <= 0.0) {
      unint64_t v18 = 2654435761u * (unint64_t)v16;
    }
    unint64_t v19 = v17 - (unint64_t)fabs(v15);
    if (v15 >= 0.0) {
      unint64_t v19 = v18;
    }
    unint64_t v68 = v19;
  }
  else
  {
    unint64_t v68 = 0;
  }
  NSUInteger v67 = [(NSString *)self->_groupPhotoPathDigest hash];
  NSUInteger v66 = [(NSString *)self->_displayName hash];
  if ((*(_WORD *)&self->_has & 0x800) != 0) {
    uint64_t v65 = 2654435761 * self->_isPrimary;
  }
  else {
    uint64_t v65 = 0;
  }
  NSUInteger v64 = [(NSString *)self->_attributionIdentifier hash];
  __int16 v20 = (__int16)self->_has;
  if ((v20 & 0x80) != 0)
  {
    uint64_t v63 = 2654435761 * self->_rank;
    if ((v20 & 8) != 0)
    {
LABEL_26:
      double score = self->_score;
      double v22 = -score;
      if (score >= 0.0) {
        double v22 = self->_score;
      }
      long double v23 = floor(v22 + 0.5);
      double v24 = (v22 - v23) * 1.84467441e19;
      unint64_t v25 = 2654435761u * (unint64_t)fmod(v23, 1.84467441e19);
      if (v24 >= 0.0)
      {
        if (v24 > 0.0) {
          v25 += (unint64_t)v24;
        }
      }
      else
      {
        v25 -= (unint64_t)fabs(v24);
      }
      unint64_t v62 = v25;
      if ((v20 & 0x400) == 0) {
        goto LABEL_36;
      }
LABEL_32:
      uint64_t v61 = 2654435761 * self->_isConversationAutoDonating;
      goto LABEL_37;
    }
  }
  else
  {
    uint64_t v63 = 0;
    if ((v20 & 8) != 0) {
      goto LABEL_26;
    }
  }
  unint64_t v62 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0) {
    goto LABEL_32;
  }
LABEL_36:
  uint64_t v61 = 0;
LABEL_37:
  NSUInteger v60 = [(NSString *)self->_originatingDeviceId hash];
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    double rankingSecondsSinceReferenceDate = self->_rankingSecondsSinceReferenceDate;
    double v27 = -rankingSecondsSinceReferenceDate;
    if (rankingSecondsSinceReferenceDate >= 0.0) {
      double v27 = self->_rankingSecondsSinceReferenceDate;
    }
    long double v28 = floor(v27 + 0.5);
    double v29 = (v27 - v28) * 1.84467441e19;
    double v30 = fmod(v28, 1.84467441e19);
    unint64_t v31 = 2654435761u * (unint64_t)v30;
    unint64_t v32 = v31 + (unint64_t)v29;
    if (v29 <= 0.0) {
      unint64_t v32 = 2654435761u * (unint64_t)v30;
    }
    unint64_t v33 = v31 - (unint64_t)fabs(v29);
    if (v29 >= 0.0) {
      unint64_t v33 = v32;
    }
    unint64_t v59 = v33;
  }
  else
  {
    unint64_t v59 = 0;
  }
  NSUInteger v58 = [(NSString *)self->_resolvedUrl hash];
  NSUInteger v57 = [(NSString *)self->_variant hash];
  __int16 v34 = (__int16)self->_has;
  if ((v34 & 0x1000) != 0)
  {
    uint64_t v56 = 2654435761 * self->_isTopKResult;
    if ((v34 & 0x20) != 0) {
      goto LABEL_48;
    }
LABEL_53:
    unint64_t v39 = 0;
    goto LABEL_56;
  }
  uint64_t v56 = 0;
  if ((v34 & 0x20) == 0) {
    goto LABEL_53;
  }
LABEL_48:
  double topKScore = self->_topKScore;
  double v36 = -topKScore;
  if (topKScore >= 0.0) {
    double v36 = self->_topKScore;
  }
  long double v37 = floor(v36 + 0.5);
  double v38 = (v36 - v37) * 1.84467441e19;
  unint64_t v39 = 2654435761u * (unint64_t)fmod(v37, 1.84467441e19);
  if (v38 >= 0.0)
  {
    if (v38 > 0.0) {
      v39 += (unint64_t)v38;
    }
  }
  else
  {
    v39 -= (unint64_t)fabs(v38);
  }
LABEL_56:
  if ((v34 & 2) != 0)
  {
    double firstPassScore = self->_firstPassScore;
    double v42 = -firstPassScore;
    if (firstPassScore >= 0.0) {
      double v42 = self->_firstPassScore;
    }
    long double v43 = floor(v42 + 0.5);
    double v44 = (v42 - v43) * 1.84467441e19;
    unint64_t v40 = 2654435761u * (unint64_t)fmod(v43, 1.84467441e19);
    if (v44 >= 0.0)
    {
      if (v44 > 0.0) {
        v40 += (unint64_t)v44;
      }
    }
    else
    {
      v40 -= (unint64_t)fabs(v44);
    }
  }
  else
  {
    unint64_t v40 = 0;
  }
  if ((v34 & 0x200) != 0) {
    NSUInteger v45 = [(NSString *)self->_collaborationIdentifier hash];
  }
  else {
    NSUInteger v45 = [(NSString *)self->_collaborationIdentifier hash];
  }
  NSUInteger v46 = v45;
  NSUInteger v47 = [(NSString *)self->_contentType hash];
  NSUInteger v48 = [(NSString *)self->_contentDisplayName hash];
  NSUInteger v49 = [(NSString *)self->_fileProviderId hash];
  uint64_t v50 = [(NSData *)self->_localIdentity hash];
  uint64_t v51 = [(NSData *)self->_localIdentityProof hash];
  uint64_t v52 = [(NSData *)self->_handleToIdentityMap hash];
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    uint64_t v53 = 2654435761 * self->_fromMeEntitlementOverrideIsPresent;
  }
  else {
    uint64_t v53 = 0;
  }
  return v78 ^ v79 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v39 ^ v40 ^ v55 ^ v46 ^ v47 ^ v48 ^ v49 ^ v50 ^ v51 ^ v52 ^ v53;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_123;
  }
  highlightIdentifier = self->_highlightIdentifier;
  if ((unint64_t)highlightIdentifier | *((void *)v4 + 20))
  {
    if (!-[NSString isEqual:](highlightIdentifier, "isEqual:")) {
      goto LABEL_123;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v7 = *((_WORD *)v4 + 128);
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_highlightType != *((_DWORD *)v4 + 42)) {
      goto LABEL_123;
    }
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_123;
  }
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_syndicationSecondsSinceReferenceDate != *((double *)v4 + 5)) {
      goto LABEL_123;
    }
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_123;
  }
  sourceBundleId = self->_sourceBundleId;
  if ((unint64_t)sourceBundleId | *((void *)v4 + 29)
    && !-[NSString isEqual:](sourceBundleId, "isEqual:"))
  {
    goto LABEL_123;
  }
  applicationIdentifiers = self->_applicationIdentifiers;
  if ((unint64_t)applicationIdentifiers | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](applicationIdentifiers, "isEqual:")) {
      goto LABEL_123;
    }
  }
  resourceUrl = self->_resourceUrl;
  if ((unint64_t)resourceUrl | *((void *)v4 + 27))
  {
    if (!-[NSString isEqual:](resourceUrl, "isEqual:")) {
      goto LABEL_123;
    }
  }
  sender = self->_sender;
  if ((unint64_t)sender | *((void *)v4 + 28))
  {
    if (!-[PPSocialHighlightContact isEqual:](sender, "isEqual:")) {
      goto LABEL_123;
    }
  }
  domainIdentifier = self->_domainIdentifier;
  if ((unint64_t)domainIdentifier | *((void *)v4 + 16))
  {
    if (!-[NSString isEqual:](domainIdentifier, "isEqual:")) {
      goto LABEL_123;
    }
  }
  batchIdentifier = self->_batchIdentifier;
  if ((unint64_t)batchIdentifier | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](batchIdentifier, "isEqual:")) {
      goto LABEL_123;
    }
  }
  calculatedFeatures = self->_calculatedFeatures;
  if ((unint64_t)calculatedFeatures | *((void *)v4 + 10))
  {
    if (!-[NSMutableArray isEqual:](calculatedFeatures, "isEqual:")) {
      goto LABEL_123;
    }
  }
  clientIdentifier = self->_clientIdentifier;
  if ((unint64_t)clientIdentifier | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](clientIdentifier, "isEqual:")) {
      goto LABEL_123;
    }
  }
  __int16 v16 = *((_WORD *)v4 + 128);
  if (*(_WORD *)&self->_has)
  {
    if ((v16 & 1) == 0 || self->_contentCreationSecondsSinceReferenceDate != *((double *)v4 + 1)) {
      goto LABEL_123;
    }
  }
  else if (v16)
  {
    goto LABEL_123;
  }
  groupPhotoPathDigest = self->_groupPhotoPathDigest;
  if ((unint64_t)groupPhotoPathDigest | *((void *)v4 + 18)
    && !-[NSString isEqual:](groupPhotoPathDigest, "isEqual:"))
  {
    goto LABEL_123;
  }
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((void *)v4 + 15))
  {
    if (!-[NSString isEqual:](displayName, "isEqual:")) {
      goto LABEL_123;
    }
  }
  __int16 v19 = (__int16)self->_has;
  __int16 v20 = *((_WORD *)v4 + 128);
  if ((v19 & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 128) & 0x800) == 0) {
      goto LABEL_123;
    }
    if (self->_isPrimary)
    {
      if (!*((unsigned char *)v4 + 251)) {
        goto LABEL_123;
      }
    }
    else if (*((unsigned char *)v4 + 251))
    {
      goto LABEL_123;
    }
  }
  else if ((*((_WORD *)v4 + 128) & 0x800) != 0)
  {
    goto LABEL_123;
  }
  attributionIdentifier = self->_attributionIdentifier;
  if ((unint64_t)attributionIdentifier | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](attributionIdentifier, "isEqual:")) {
      goto LABEL_123;
    }
    __int16 v19 = (__int16)self->_has;
    __int16 v20 = *((_WORD *)v4 + 128);
  }
  if ((v19 & 0x80) != 0)
  {
    if ((v20 & 0x80) == 0 || self->_rank != *((_DWORD *)v4 + 50)) {
      goto LABEL_123;
    }
  }
  else if ((v20 & 0x80) != 0)
  {
    goto LABEL_123;
  }
  if ((v19 & 8) != 0)
  {
    if ((v20 & 8) == 0 || self->_score != *((double *)v4 + 4)) {
      goto LABEL_123;
    }
  }
  else if ((v20 & 8) != 0)
  {
    goto LABEL_123;
  }
  if ((v19 & 0x400) != 0)
  {
    if ((v20 & 0x400) == 0) {
      goto LABEL_123;
    }
    if (self->_isConversationAutoDonating)
    {
      if (!*((unsigned char *)v4 + 250)) {
        goto LABEL_123;
      }
    }
    else if (*((unsigned char *)v4 + 250))
    {
      goto LABEL_123;
    }
  }
  else if ((v20 & 0x400) != 0)
  {
    goto LABEL_123;
  }
  originatingDeviceId = self->_originatingDeviceId;
  if ((unint64_t)originatingDeviceId | *((void *)v4 + 24))
  {
    if (!-[NSString isEqual:](originatingDeviceId, "isEqual:")) {
      goto LABEL_123;
    }
    __int16 v19 = (__int16)self->_has;
    __int16 v20 = *((_WORD *)v4 + 128);
  }
  if ((v19 & 4) != 0)
  {
    if ((v20 & 4) == 0 || self->_rankingSecondsSinceReferenceDate != *((double *)v4 + 3)) {
      goto LABEL_123;
    }
  }
  else if ((v20 & 4) != 0)
  {
    goto LABEL_123;
  }
  resolvedUrl = self->_resolvedUrl;
  if ((unint64_t)resolvedUrl | *((void *)v4 + 26)
    && !-[NSString isEqual:](resolvedUrl, "isEqual:"))
  {
    goto LABEL_123;
  }
  variant = self->_variant;
  if ((unint64_t)variant | *((void *)v4 + 30))
  {
    if (!-[NSString isEqual:](variant, "isEqual:")) {
      goto LABEL_123;
    }
  }
  __int16 v25 = (__int16)self->_has;
  __int16 v26 = *((_WORD *)v4 + 128);
  if ((v25 & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 128) & 0x1000) == 0) {
      goto LABEL_123;
    }
    if (self->_isTopKResult)
    {
      if (!*((unsigned char *)v4 + 252)) {
        goto LABEL_123;
      }
    }
    else if (*((unsigned char *)v4 + 252))
    {
      goto LABEL_123;
    }
  }
  else if ((*((_WORD *)v4 + 128) & 0x1000) != 0)
  {
    goto LABEL_123;
  }
  if ((v25 & 0x20) != 0)
  {
    if ((v26 & 0x20) == 0 || self->_topKScore != *((double *)v4 + 6)) {
      goto LABEL_123;
    }
  }
  else if ((v26 & 0x20) != 0)
  {
    goto LABEL_123;
  }
  if ((v25 & 2) != 0)
  {
    if ((v26 & 2) == 0 || self->_firstPassScore != *((double *)v4 + 2)) {
      goto LABEL_123;
    }
  }
  else if ((v26 & 2) != 0)
  {
    goto LABEL_123;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 128) & 0x200) == 0) {
      goto LABEL_123;
    }
    if (self->_isCollaboration)
    {
      if (!*((unsigned char *)v4 + 249)) {
        goto LABEL_123;
      }
    }
    else if (*((unsigned char *)v4 + 249))
    {
      goto LABEL_123;
    }
  }
  else if ((*((_WORD *)v4 + 128) & 0x200) != 0)
  {
    goto LABEL_123;
  }
  collaborationIdentifier = self->_collaborationIdentifier;
  if ((unint64_t)collaborationIdentifier | *((void *)v4 + 12)
    && !-[NSString isEqual:](collaborationIdentifier, "isEqual:"))
  {
    goto LABEL_123;
  }
  contentType = self->_contentType;
  if ((unint64_t)contentType | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](contentType, "isEqual:")) {
      goto LABEL_123;
    }
  }
  contentDisplayName = self->_contentDisplayName;
  if ((unint64_t)contentDisplayName | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](contentDisplayName, "isEqual:")) {
      goto LABEL_123;
    }
  }
  fileProviderId = self->_fileProviderId;
  if ((unint64_t)fileProviderId | *((void *)v4 + 17))
  {
    if (!-[NSString isEqual:](fileProviderId, "isEqual:")) {
      goto LABEL_123;
    }
  }
  localIdentity = self->_localIdentity;
  if ((unint64_t)localIdentity | *((void *)v4 + 22))
  {
    if (!-[NSData isEqual:](localIdentity, "isEqual:")) {
      goto LABEL_123;
    }
  }
  localIdentityProof = self->_localIdentityProof;
  if ((unint64_t)localIdentityProof | *((void *)v4 + 23))
  {
    if (!-[NSData isEqual:](localIdentityProof, "isEqual:")) {
      goto LABEL_123;
    }
  }
  handleToIdentityMap = self->_handleToIdentityMap;
  if ((unint64_t)handleToIdentityMap | *((void *)v4 + 19))
  {
    if (!-[NSData isEqual:](handleToIdentityMap, "isEqual:")) {
      goto LABEL_123;
    }
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 128) & 0x100) != 0)
    {
      if (self->_fromMeEntitlementOverrideIsPresent)
      {
        if (!*((unsigned char *)v4 + 248)) {
          goto LABEL_123;
        }
      }
      else if (*((unsigned char *)v4 + 248))
      {
        goto LABEL_123;
      }
      BOOL v34 = 1;
      goto LABEL_124;
    }
LABEL_123:
    BOOL v34 = 0;
    goto LABEL_124;
  }
  BOOL v34 = (*((_WORD *)v4 + 128) & 0x100) == 0;
LABEL_124:

  return v34;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_highlightIdentifier copyWithZone:a3];
  __int16 v7 = *(void **)(v5 + 160);
  *(void *)(v5 + 160) = v6;

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 168) = self->_highlightType;
    *(_WORD *)(v5 + 256) |= 0x40u;
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    *(double *)(v5 + 40) = self->_syndicationSecondsSinceReferenceDate;
    *(_WORD *)(v5 + 256) |= 0x10u;
  }
  uint64_t v9 = [(NSString *)self->_sourceBundleId copyWithZone:a3];
  unint64_t v10 = *(void **)(v5 + 232);
  *(void *)(v5 + 232) = v9;

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  unint64_t v11 = self->_applicationIdentifiers;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v66 objects:v71 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v67;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v67 != v14) {
          objc_enumerationMutation(v11);
        }
        __int16 v16 = (void *)[*(id *)(*((void *)&v66 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addApplicationIdentifiers:v16];
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v66 objects:v71 count:16];
    }
    while (v13);
  }

  uint64_t v17 = [(NSString *)self->_resourceUrl copyWithZone:a3];
  unint64_t v18 = *(void **)(v5 + 216);
  *(void *)(v5 + 216) = v17;

  id v19 = [(PPSocialHighlightContact *)self->_sender copyWithZone:a3];
  __int16 v20 = *(void **)(v5 + 224);
  *(void *)(v5 + 224) = v19;

  uint64_t v21 = [(NSString *)self->_domainIdentifier copyWithZone:a3];
  double v22 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v21;

  uint64_t v23 = [(NSString *)self->_batchIdentifier copyWithZone:a3];
  double v24 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v23;

  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  __int16 v25 = self->_calculatedFeatures;
  uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v62 objects:v70 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v63;
    do
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v63 != v28) {
          objc_enumerationMutation(v25);
        }
        double v30 = objc_msgSend(*(id *)(*((void *)&v62 + 1) + 8 * j), "copyWithZone:", a3, (void)v62);
        [(id)v5 addCalculatedFeatures:v30];
      }
      uint64_t v27 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v62 objects:v70 count:16];
    }
    while (v27);
  }

  uint64_t v31 = [(NSString *)self->_clientIdentifier copyWithZone:a3];
  unint64_t v32 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v31;

  if (*(_WORD *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_contentCreationSecondsSinceReferenceDate;
    *(_WORD *)(v5 + 256) |= 1u;
  }
  uint64_t v33 = -[NSString copyWithZone:](self->_groupPhotoPathDigest, "copyWithZone:", a3, (void)v62);
  BOOL v34 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v33;

  uint64_t v35 = [(NSString *)self->_displayName copyWithZone:a3];
  double v36 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v35;

  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    *(unsigned char *)(v5 + 251) = self->_isPrimary;
    *(_WORD *)(v5 + 256) |= 0x800u;
  }
  uint64_t v37 = [(NSString *)self->_attributionIdentifier copyWithZone:a3];
  double v38 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v37;

  __int16 v39 = (__int16)self->_has;
  if ((v39 & 0x80) != 0)
  {
    *(_DWORD *)(v5 + 200) = self->_rank;
    *(_WORD *)(v5 + 256) |= 0x80u;
    __int16 v39 = (__int16)self->_has;
    if ((v39 & 8) == 0)
    {
LABEL_25:
      if ((v39 & 0x400) == 0) {
        goto LABEL_27;
      }
      goto LABEL_26;
    }
  }
  else if ((v39 & 8) == 0)
  {
    goto LABEL_25;
  }
  *(double *)(v5 + 32) = self->_score;
  *(_WORD *)(v5 + 256) |= 8u;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_26:
    *(unsigned char *)(v5 + 250) = self->_isConversationAutoDonating;
    *(_WORD *)(v5 + 256) |= 0x400u;
  }
LABEL_27:
  uint64_t v40 = [(NSString *)self->_originatingDeviceId copyWithZone:a3];
  v41 = *(void **)(v5 + 192);
  *(void *)(v5 + 192) = v40;

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    *(double *)(v5 + 24) = self->_rankingSecondsSinceReferenceDate;
    *(_WORD *)(v5 + 256) |= 4u;
  }
  uint64_t v42 = [(NSString *)self->_resolvedUrl copyWithZone:a3];
  long double v43 = *(void **)(v5 + 208);
  *(void *)(v5 + 208) = v42;

  uint64_t v44 = [(NSString *)self->_variant copyWithZone:a3];
  NSUInteger v45 = *(void **)(v5 + 240);
  *(void *)(v5 + 240) = v44;

  __int16 v46 = (__int16)self->_has;
  if ((v46 & 0x1000) != 0)
  {
    *(unsigned char *)(v5 + 252) = self->_isTopKResult;
    *(_WORD *)(v5 + 256) |= 0x1000u;
    __int16 v46 = (__int16)self->_has;
    if ((v46 & 0x20) == 0)
    {
LABEL_31:
      if ((v46 & 2) == 0) {
        goto LABEL_32;
      }
      goto LABEL_42;
    }
  }
  else if ((v46 & 0x20) == 0)
  {
    goto LABEL_31;
  }
  *(double *)(v5 + 48) = self->_topKScore;
  *(_WORD *)(v5 + 256) |= 0x20u;
  __int16 v46 = (__int16)self->_has;
  if ((v46 & 2) == 0)
  {
LABEL_32:
    if ((v46 & 0x200) == 0) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
LABEL_42:
  *(double *)(v5 + 16) = self->_firstPassScore;
  *(_WORD *)(v5 + 256) |= 2u;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_33:
    *(unsigned char *)(v5 + 249) = self->_isCollaboration;
    *(_WORD *)(v5 + 256) |= 0x200u;
  }
LABEL_34:
  uint64_t v47 = [(NSString *)self->_collaborationIdentifier copyWithZone:a3];
  NSUInteger v48 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v47;

  uint64_t v49 = [(NSString *)self->_contentType copyWithZone:a3];
  uint64_t v50 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v49;

  uint64_t v51 = [(NSString *)self->_contentDisplayName copyWithZone:a3];
  uint64_t v52 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v51;

  uint64_t v53 = [(NSString *)self->_fileProviderId copyWithZone:a3];
  v54 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v53;

  uint64_t v55 = [(NSData *)self->_localIdentity copyWithZone:a3];
  uint64_t v56 = *(void **)(v5 + 176);
  *(void *)(v5 + 176) = v55;

  uint64_t v57 = [(NSData *)self->_localIdentityProof copyWithZone:a3];
  NSUInteger v58 = *(void **)(v5 + 184);
  *(void *)(v5 + 184) = v57;

  uint64_t v59 = [(NSData *)self->_handleToIdentityMap copyWithZone:a3];
  NSUInteger v60 = *(void **)(v5 + 152);
  *(void *)(v5 + 152) = v59;

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    *(unsigned char *)(v5 + 248) = self->_fromMeEntitlementOverrideIsPresent;
    *(_WORD *)(v5 + 256) |= 0x100u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v17 = v4;
  if (self->_highlightIdentifier)
  {
    objc_msgSend(v4, "setHighlightIdentifier:");
    id v4 = v17;
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    *((_DWORD *)v4 + 42) = self->_highlightType;
    *((_WORD *)v4 + 128) |= 0x40u;
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    *((void *)v4 + 5) = *(void *)&self->_syndicationSecondsSinceReferenceDate;
    *((_WORD *)v4 + 128) |= 0x10u;
  }
  if (self->_sourceBundleId) {
    objc_msgSend(v17, "setSourceBundleId:");
  }
  if ([(PPRankableSocialHighlight *)self applicationIdentifiersCount])
  {
    [v17 clearApplicationIdentifiers];
    unint64_t v6 = [(PPRankableSocialHighlight *)self applicationIdentifiersCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(PPRankableSocialHighlight *)self applicationIdentifiersAtIndex:i];
        [v17 addApplicationIdentifiers:v9];
      }
    }
  }
  if (self->_resourceUrl) {
    objc_msgSend(v17, "setResourceUrl:");
  }
  if (self->_sender) {
    objc_msgSend(v17, "setSender:");
  }
  if (self->_domainIdentifier) {
    objc_msgSend(v17, "setDomainIdentifier:");
  }
  if (self->_batchIdentifier) {
    objc_msgSend(v17, "setBatchIdentifier:");
  }
  if ([(PPRankableSocialHighlight *)self calculatedFeaturesCount])
  {
    [v17 clearCalculatedFeatures];
    unint64_t v10 = [(PPRankableSocialHighlight *)self calculatedFeaturesCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
      {
        uint64_t v13 = [(PPRankableSocialHighlight *)self calculatedFeaturesAtIndex:j];
        [v17 addCalculatedFeatures:v13];
      }
    }
  }
  if (self->_clientIdentifier) {
    objc_msgSend(v17, "setClientIdentifier:");
  }
  uint64_t v14 = v17;
  if (*(_WORD *)&self->_has)
  {
    *((void *)v17 + 1) = *(void *)&self->_contentCreationSecondsSinceReferenceDate;
    *((_WORD *)v17 + 128) |= 1u;
  }
  if (self->_groupPhotoPathDigest)
  {
    objc_msgSend(v17, "setGroupPhotoPathDigest:");
    uint64_t v14 = v17;
  }
  if (self->_displayName)
  {
    objc_msgSend(v17, "setDisplayName:");
    uint64_t v14 = v17;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    v14[251] = self->_isPrimary;
    *((_WORD *)v14 + 128) |= 0x800u;
  }
  if (self->_attributionIdentifier)
  {
    objc_msgSend(v17, "setAttributionIdentifier:");
    uint64_t v14 = v17;
  }
  __int16 v15 = (__int16)self->_has;
  if ((v15 & 0x80) != 0)
  {
    *((_DWORD *)v14 + 50) = self->_rank;
    *((_WORD *)v14 + 128) |= 0x80u;
    __int16 v15 = (__int16)self->_has;
    if ((v15 & 8) == 0)
    {
LABEL_39:
      if ((v15 & 0x400) == 0) {
        goto LABEL_41;
      }
      goto LABEL_40;
    }
  }
  else if ((v15 & 8) == 0)
  {
    goto LABEL_39;
  }
  *((void *)v14 + 4) = *(void *)&self->_score;
  *((_WORD *)v14 + 128) |= 8u;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_40:
    v14[250] = self->_isConversationAutoDonating;
    *((_WORD *)v14 + 128) |= 0x400u;
  }
LABEL_41:
  if (self->_originatingDeviceId)
  {
    objc_msgSend(v17, "setOriginatingDeviceId:");
    uint64_t v14 = v17;
  }
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    *((void *)v14 + 3) = *(void *)&self->_rankingSecondsSinceReferenceDate;
    *((_WORD *)v14 + 128) |= 4u;
  }
  if (self->_resolvedUrl)
  {
    objc_msgSend(v17, "setResolvedUrl:");
    uint64_t v14 = v17;
  }
  if (self->_variant)
  {
    objc_msgSend(v17, "setVariant:");
    uint64_t v14 = v17;
  }
  __int16 v16 = (__int16)self->_has;
  if ((v16 & 0x1000) != 0)
  {
    v14[252] = self->_isTopKResult;
    *((_WORD *)v14 + 128) |= 0x1000u;
    __int16 v16 = (__int16)self->_has;
    if ((v16 & 0x20) == 0)
    {
LABEL_51:
      if ((v16 & 2) == 0) {
        goto LABEL_52;
      }
      goto LABEL_78;
    }
  }
  else if ((v16 & 0x20) == 0)
  {
    goto LABEL_51;
  }
  *((void *)v14 + 6) = *(void *)&self->_topKScore;
  *((_WORD *)v14 + 128) |= 0x20u;
  __int16 v16 = (__int16)self->_has;
  if ((v16 & 2) == 0)
  {
LABEL_52:
    if ((v16 & 0x200) == 0) {
      goto LABEL_54;
    }
    goto LABEL_53;
  }
LABEL_78:
  *((void *)v14 + 2) = *(void *)&self->_firstPassScore;
  *((_WORD *)v14 + 128) |= 2u;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_53:
    v14[249] = self->_isCollaboration;
    *((_WORD *)v14 + 128) |= 0x200u;
  }
LABEL_54:
  if (self->_collaborationIdentifier)
  {
    objc_msgSend(v17, "setCollaborationIdentifier:");
    uint64_t v14 = v17;
  }
  if (self->_contentType)
  {
    objc_msgSend(v17, "setContentType:");
    uint64_t v14 = v17;
  }
  if (self->_contentDisplayName)
  {
    objc_msgSend(v17, "setContentDisplayName:");
    uint64_t v14 = v17;
  }
  if (self->_fileProviderId)
  {
    objc_msgSend(v17, "setFileProviderId:");
    uint64_t v14 = v17;
  }
  if (self->_localIdentity)
  {
    objc_msgSend(v17, "setLocalIdentity:");
    uint64_t v14 = v17;
  }
  if (self->_localIdentityProof)
  {
    objc_msgSend(v17, "setLocalIdentityProof:");
    uint64_t v14 = v17;
  }
  if (self->_handleToIdentityMap)
  {
    objc_msgSend(v17, "setHandleToIdentityMap:");
    uint64_t v14 = v17;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    v14[248] = self->_fromMeEntitlementOverrideIsPresent;
    *((_WORD *)v14 + 128) |= 0x100u;
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_highlightIdentifier) {
    PBDataWriterWriteStringField();
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x10) != 0) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_sourceBundleId) {
    PBDataWriterWriteStringField();
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  unint64_t v6 = self->_applicationIdentifiers;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v8);
  }

  if (self->_resourceUrl) {
    PBDataWriterWriteStringField();
  }
  if (self->_sender) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_domainIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_batchIdentifier) {
    PBDataWriterWriteStringField();
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  unint64_t v11 = self->_calculatedFeatures;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v13);
  }

  if (self->_clientIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (*(_WORD *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_groupPhotoPathDigest) {
    PBDataWriterWriteStringField();
  }
  if (self->_displayName) {
    PBDataWriterWriteStringField();
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_attributionIdentifier) {
    PBDataWriterWriteStringField();
  }
  __int16 v16 = (__int16)self->_has;
  if ((v16 & 0x80) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 v16 = (__int16)self->_has;
    if ((v16 & 8) == 0)
    {
LABEL_45:
      if ((v16 & 0x400) == 0) {
        goto LABEL_47;
      }
      goto LABEL_46;
    }
  }
  else if ((v16 & 8) == 0)
  {
    goto LABEL_45;
  }
  PBDataWriterWriteDoubleField();
  if ((*(_WORD *)&self->_has & 0x400) != 0) {
LABEL_46:
  }
    PBDataWriterWriteBOOLField();
LABEL_47:
  if (self->_originatingDeviceId) {
    PBDataWriterWriteStringField();
  }
  if ((*(_WORD *)&self->_has & 4) != 0) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_resolvedUrl) {
    PBDataWriterWriteStringField();
  }
  if (self->_variant) {
    PBDataWriterWriteStringField();
  }
  __int16 v17 = (__int16)self->_has;
  if ((v17 & 0x1000) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 v17 = (__int16)self->_has;
    if ((v17 & 0x20) == 0)
    {
LABEL_57:
      if ((v17 & 2) == 0) {
        goto LABEL_58;
      }
      goto LABEL_82;
    }
  }
  else if ((v17 & 0x20) == 0)
  {
    goto LABEL_57;
  }
  PBDataWriterWriteDoubleField();
  __int16 v17 = (__int16)self->_has;
  if ((v17 & 2) == 0)
  {
LABEL_58:
    if ((v17 & 0x200) == 0) {
      goto LABEL_60;
    }
    goto LABEL_59;
  }
LABEL_82:
  PBDataWriterWriteDoubleField();
  if ((*(_WORD *)&self->_has & 0x200) != 0) {
LABEL_59:
  }
    PBDataWriterWriteBOOLField();
LABEL_60:
  if (self->_collaborationIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_contentType) {
    PBDataWriterWriteStringField();
  }
  if (self->_contentDisplayName) {
    PBDataWriterWriteStringField();
  }
  if (self->_fileProviderId) {
    PBDataWriterWriteStringField();
  }
  if (self->_localIdentity) {
    PBDataWriterWriteDataField();
  }
  if (self->_localIdentityProof) {
    PBDataWriterWriteDataField();
  }
  if (self->_handleToIdentityMap) {
    PBDataWriterWriteDataField();
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PPRankableSocialHighlightReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  highlightIdentifier = self->_highlightIdentifier;
  if (highlightIdentifier) {
    [v3 setObject:highlightIdentifier forKey:@"highlightIdentifier"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    uint64_t highlightType = self->_highlightType;
    if (highlightType >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_highlightType);
      uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v8 = off_1E65D4950[highlightType];
    }
    [v4 setObject:v8 forKey:@"highlightType"];

    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    uint64_t v9 = [NSNumber numberWithDouble:self->_syndicationSecondsSinceReferenceDate];
    [v4 setObject:v9 forKey:@"syndicationSecondsSinceReferenceDate"];
  }
  sourceBundleId = self->_sourceBundleId;
  if (sourceBundleId) {
    [v4 setObject:sourceBundleId forKey:@"sourceBundleId"];
  }
  applicationIdentifiers = self->_applicationIdentifiers;
  if (applicationIdentifiers) {
    [v4 setObject:applicationIdentifiers forKey:@"applicationIdentifiers"];
  }
  resourceUrl = self->_resourceUrl;
  if (resourceUrl) {
    [v4 setObject:resourceUrl forKey:@"resourceUrl"];
  }
  sender = self->_sender;
  if (sender)
  {
    uint64_t v14 = [(PPSocialHighlightContact *)sender dictionaryRepresentation];
    [v4 setObject:v14 forKey:@"sender"];
  }
  domainIdentifier = self->_domainIdentifier;
  if (domainIdentifier) {
    [v4 setObject:domainIdentifier forKey:@"domainIdentifier"];
  }
  batchIdentifier = self->_batchIdentifier;
  if (batchIdentifier) {
    [v4 setObject:batchIdentifier forKey:@"batchIdentifier"];
  }
  if ([(NSMutableArray *)self->_calculatedFeatures count])
  {
    __int16 v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_calculatedFeatures, "count"));
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v18 = self->_calculatedFeatures;
    uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v53 objects:v57 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v54 != v21) {
            objc_enumerationMutation(v18);
          }
          long long v23 = [*(id *)(*((void *)&v53 + 1) + 8 * i) dictionaryRepresentation];
          [v17 addObject:v23];
        }
        uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v53 objects:v57 count:16];
      }
      while (v20);
    }

    [v4 setObject:v17 forKey:@"calculatedFeatures"];
  }
  clientIdentifier = self->_clientIdentifier;
  if (clientIdentifier) {
    [v4 setObject:clientIdentifier forKey:@"clientIdentifier"];
  }
  if (*(_WORD *)&self->_has)
  {
    long long v25 = [NSNumber numberWithDouble:self->_contentCreationSecondsSinceReferenceDate];
    [v4 setObject:v25 forKey:@"contentCreationSecondsSinceReferenceDate"];
  }
  groupPhotoPathDigest = self->_groupPhotoPathDigest;
  if (groupPhotoPathDigest) {
    [v4 setObject:groupPhotoPathDigest forKey:@"groupPhotoPathDigest"];
  }
  displayName = self->_displayName;
  if (displayName) {
    [v4 setObject:displayName forKey:@"displayName"];
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    uint64_t v28 = [NSNumber numberWithBool:self->_isPrimary];
    [v4 setObject:v28 forKey:@"isPrimary"];
  }
  attributionIdentifier = self->_attributionIdentifier;
  if (attributionIdentifier) {
    [v4 setObject:attributionIdentifier forKey:@"attributionIdentifier"];
  }
  __int16 v30 = (__int16)self->_has;
  if ((v30 & 0x80) != 0)
  {
    NSUInteger v48 = [NSNumber numberWithUnsignedInt:self->_rank];
    [v4 setObject:v48 forKey:@"rank"];

    __int16 v30 = (__int16)self->_has;
    if ((v30 & 8) == 0)
    {
LABEL_45:
      if ((v30 & 0x400) == 0) {
        goto LABEL_47;
      }
      goto LABEL_46;
    }
  }
  else if ((v30 & 8) == 0)
  {
    goto LABEL_45;
  }
  uint64_t v49 = [NSNumber numberWithDouble:self->_score];
  [v4 setObject:v49 forKey:@"score"];

  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_46:
    uint64_t v31 = [NSNumber numberWithBool:self->_isConversationAutoDonating];
    [v4 setObject:v31 forKey:@"isConversationAutoDonating"];
  }
LABEL_47:
  originatingDeviceId = self->_originatingDeviceId;
  if (originatingDeviceId) {
    [v4 setObject:originatingDeviceId forKey:@"originatingDeviceId"];
  }
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    uint64_t v33 = [NSNumber numberWithDouble:self->_rankingSecondsSinceReferenceDate];
    [v4 setObject:v33 forKey:@"rankingSecondsSinceReferenceDate"];
  }
  resolvedUrl = self->_resolvedUrl;
  if (resolvedUrl) {
    [v4 setObject:resolvedUrl forKey:@"resolvedUrl"];
  }
  variant = self->_variant;
  if (variant) {
    [v4 setObject:variant forKey:@"variant"];
  }
  __int16 v36 = (__int16)self->_has;
  if ((v36 & 0x1000) != 0)
  {
    uint64_t v50 = [NSNumber numberWithBool:self->_isTopKResult];
    [v4 setObject:v50 forKey:@"isTopKResult"];

    __int16 v36 = (__int16)self->_has;
    if ((v36 & 0x20) == 0)
    {
LABEL_57:
      if ((v36 & 2) == 0) {
        goto LABEL_58;
      }
      goto LABEL_82;
    }
  }
  else if ((v36 & 0x20) == 0)
  {
    goto LABEL_57;
  }
  uint64_t v51 = [NSNumber numberWithDouble:self->_topKScore];
  [v4 setObject:v51 forKey:@"topKScore"];

  __int16 v36 = (__int16)self->_has;
  if ((v36 & 2) == 0)
  {
LABEL_58:
    if ((v36 & 0x200) == 0) {
      goto LABEL_60;
    }
    goto LABEL_59;
  }
LABEL_82:
  uint64_t v52 = [NSNumber numberWithDouble:self->_firstPassScore];
  [v4 setObject:v52 forKey:@"firstPassScore"];

  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_59:
    uint64_t v37 = [NSNumber numberWithBool:self->_isCollaboration];
    [v4 setObject:v37 forKey:@"isCollaboration"];
  }
LABEL_60:
  collaborationIdentifier = self->_collaborationIdentifier;
  if (collaborationIdentifier) {
    [v4 setObject:collaborationIdentifier forKey:@"collaborationIdentifier"];
  }
  contentType = self->_contentType;
  if (contentType) {
    [v4 setObject:contentType forKey:@"contentType"];
  }
  contentDisplayName = self->_contentDisplayName;
  if (contentDisplayName) {
    [v4 setObject:contentDisplayName forKey:@"contentDisplayName"];
  }
  fileProviderId = self->_fileProviderId;
  if (fileProviderId) {
    [v4 setObject:fileProviderId forKey:@"fileProviderId"];
  }
  localIdentity = self->_localIdentity;
  if (localIdentity) {
    [v4 setObject:localIdentity forKey:@"localIdentity"];
  }
  localIdentityProof = self->_localIdentityProof;
  if (localIdentityProof) {
    [v4 setObject:localIdentityProof forKey:@"localIdentityProof"];
  }
  handleToIdentityMap = self->_handleToIdentityMap;
  if (handleToIdentityMap) {
    [v4 setObject:handleToIdentityMap forKey:@"handleToIdentityMap"];
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    NSUInteger v45 = [NSNumber numberWithBool:self->_fromMeEntitlementOverrideIsPresent];
    [v4 setObject:v45 forKey:@"fromMeEntitlementOverrideIsPresent"];
  }
  id v46 = v4;

  return v46;
}

- (NSString)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PPRankableSocialHighlight;
  id v4 = [(PPRankableSocialHighlight *)&v8 description];
  uint64_t v5 = [(PPRankableSocialHighlight *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (BOOL)hasFromMeEntitlementOverrideIsPresent
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasFromMeEntitlementOverrideIsPresent:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (void)setFromMeEntitlementOverrideIsPresent:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_fromMeEntitlementOverrideIsPresent = a3;
}

- (BOOL)hasHandleToIdentityMap
{
  return self->_handleToIdentityMap != 0;
}

- (BOOL)hasLocalIdentityProof
{
  return self->_localIdentityProof != 0;
}

- (BOOL)hasLocalIdentity
{
  return self->_localIdentity != 0;
}

- (BOOL)hasFileProviderId
{
  return self->_fileProviderId != 0;
}

- (BOOL)hasContentDisplayName
{
  return self->_contentDisplayName != 0;
}

- (BOOL)hasContentType
{
  return self->_contentType != 0;
}

- (BOOL)hasCollaborationIdentifier
{
  return self->_collaborationIdentifier != 0;
}

- (BOOL)hasIsCollaboration
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHasIsCollaboration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (void)setIsCollaboration:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_isCollaboration = a3;
}

- (BOOL)hasFirstPassScore
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasFirstPassScore:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (void)setFirstPassScore:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_double firstPassScore = a3;
}

- (BOOL)hasTopKScore
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasTopKScore:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (void)setTopKScore:(double)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_double topKScore = a3;
}

- (BOOL)hasIsTopKResult
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setHasIsTopKResult:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (void)setIsTopKResult:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_isTopKResult = a3;
}

- (BOOL)hasVariant
{
  return self->_variant != 0;
}

- (BOOL)hasResolvedUrl
{
  return self->_resolvedUrl != 0;
}

- (BOOL)hasRankingSecondsSinceReferenceDate
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasRankingSecondsSinceReferenceDate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (void)setRankingSecondsSinceReferenceDate:(double)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_double rankingSecondsSinceReferenceDate = a3;
}

- (BOOL)hasOriginatingDeviceId
{
  return self->_originatingDeviceId != 0;
}

- (BOOL)hasIsConversationAutoDonating
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setHasIsConversationAutoDonating:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (void)setIsConversationAutoDonating:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_isConversationAutoDonating = a3;
}

- (BOOL)hasScore
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasScore:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (void)setScore:(double)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_double score = a3;
}

- (BOOL)hasRank
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasRank:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (void)setRank:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_rank = a3;
}

- (BOOL)hasAttributionIdentifier
{
  return self->_attributionIdentifier != 0;
}

- (BOOL)hasIsPrimary
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setHasIsPrimary:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (void)setIsPrimary:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_isPrimary = a3;
}

- (BOOL)hasDisplayName
{
  return self->_displayName != 0;
}

- (BOOL)hasGroupPhotoPathDigest
{
  return self->_groupPhotoPathDigest != 0;
}

- (BOOL)hasContentCreationSecondsSinceReferenceDate
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasContentCreationSecondsSinceReferenceDate:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)setContentCreationSecondsSinceReferenceDate:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_double contentCreationSecondsSinceReferenceDate = a3;
}

- (BOOL)hasClientIdentifier
{
  return self->_clientIdentifier != 0;
}

- (id)calculatedFeaturesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_calculatedFeatures objectAtIndex:a3];
}

- (unint64_t)calculatedFeaturesCount
{
  return [(NSMutableArray *)self->_calculatedFeatures count];
}

- (void)addCalculatedFeatures:(id)a3
{
  id v4 = a3;
  calculatedFeatures = self->_calculatedFeatures;
  id v8 = v4;
  if (!calculatedFeatures)
  {
    unint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_calculatedFeatures;
    self->_calculatedFeatures = v6;

    id v4 = v8;
    calculatedFeatures = self->_calculatedFeatures;
  }
  [(NSMutableArray *)calculatedFeatures addObject:v4];
}

- (void)clearCalculatedFeatures
{
}

- (BOOL)hasBatchIdentifier
{
  return self->_batchIdentifier != 0;
}

- (BOOL)hasDomainIdentifier
{
  return self->_domainIdentifier != 0;
}

- (BOOL)hasSender
{
  return self->_sender != 0;
}

- (BOOL)hasResourceUrl
{
  return self->_resourceUrl != 0;
}

- (id)applicationIdentifiersAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_applicationIdentifiers objectAtIndex:a3];
}

- (unint64_t)applicationIdentifiersCount
{
  return [(NSMutableArray *)self->_applicationIdentifiers count];
}

- (void)addApplicationIdentifiers:(id)a3
{
  id v4 = a3;
  applicationIdentifiers = self->_applicationIdentifiers;
  id v8 = v4;
  if (!applicationIdentifiers)
  {
    unint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_applicationIdentifiers;
    self->_applicationIdentifiers = v6;

    id v4 = v8;
    applicationIdentifiers = self->_applicationIdentifiers;
  }
  [(NSMutableArray *)applicationIdentifiers addObject:v4];
}

- (void)clearApplicationIdentifiers
{
}

- (BOOL)hasSourceBundleId
{
  return self->_sourceBundleId != 0;
}

- (BOOL)hasSyndicationSecondsSinceReferenceDate
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasSyndicationSecondsSinceReferenceDate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (void)setSyndicationSecondsSinceReferenceDate:(double)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_double syndicationSecondsSinceReferenceDate = a3;
}

- (int)StringAsHighlightType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Automatic"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Starred"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ManualAndAutomatic"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)highlightTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E65D4950[a3];
  }
  return v3;
}

- (BOOL)hasHighlightType
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasHighlightType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (void)setHighlightType:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_uint64_t highlightType = a3;
}

- (int)highlightType
{
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
    return self->_highlightType;
  }
  else {
    return 0;
  }
}

- (BOOL)hasHighlightIdentifier
{
  return self->_highlightIdentifier != 0;
}

+ (Class)calculatedFeaturesType
{
  return (Class)objc_opt_class();
}

+ (Class)applicationIdentifiersType
{
  return (Class)objc_opt_class();
}

- (id)features
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (self->_calculatedFeatures)
  {
    __int16 v3 = objc_opt_new();
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    int v4 = self->_calculatedFeatures;
    uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if (objc_msgSend(v9, "hasName", (void)v17))
          {
            uint64_t v10 = [v9 name];
            if (v10)
            {
              unint64_t v11 = (void *)v10;
              int v12 = [v9 hasValue];

              if (v12)
              {
                uint64_t v13 = NSNumber;
                [v9 value];
                uint64_t v14 = objc_msgSend(v13, "numberWithDouble:");
                __int16 v15 = [v9 name];
                [v3 setObject:v14 forKeyedSubscript:v15];
              }
            }
          }
        }
        uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v6);
    }
  }
  else
  {
    __int16 v3 = 0;
  }
  return v3;
}

- (id)featureValueForName:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [(PPRankableSocialHighlight *)self calculatedFeatureValueForKey:v5];
  if (!v6)
  {
    uint64_t v7 = pp_default_log_handle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v5;
      _os_log_fault_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_FAULT, "Social Highlight Scorer fetched feature %@, which was not precomputed.", buf, 0xCu);
    }

    uint64_t v6 = &unk_1F256B200;
  }
  id v8 = objc_alloc(MEMORY[0x1E4F1E9A8]);
  uint64_t v13 = 0;
  uint64_t v9 = (void *)[v8 initWithShape:&unk_1F256A460 dataType:65600 error:&v13];
  if (!v9)
  {
    int v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"PPRankableSocialHighlight+FeatureRanks.m" lineNumber:63 description:@"Could not allocate memory for array"];
  }
  [v9 setObject:v6 atIndexedSubscript:0];
  uint64_t v10 = [MEMORY[0x1E4F1E950] featureValueWithMultiArray:v9];

  return v10;
}

- (NSSet)featureNames
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  __int16 v3 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int v4 = self->_calculatedFeatures;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v9, "hasName", (void)v13))
        {
          uint64_t v10 = [v9 name];

          if (v10)
          {
            unint64_t v11 = [v9 name];
            [v3 addObject:v11];
          }
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return (NSSet *)v3;
}

- (void)setCalculatedFeaturesFromDictionary:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (NSMutableArray *)objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = objc_msgSend(v4, "allKeys", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * v10);
        int v12 = objc_opt_new();
        [v12 setName:v11];
        long long v13 = [v4 objectForKeyedSubscript:v11];
        [v13 doubleValue];
        objc_msgSend(v12, "setValue:");

        [(NSMutableArray *)v5 addObject:v12];
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  calculatedFeatures = self->_calculatedFeatures;
  self->_calculatedFeatures = v5;
}

- (id)calculatedFeatureValueForKey:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = self->_calculatedFeatures;
  uint64_t v6 = (void *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "name", (void)v14);
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          int v12 = NSNumber;
          [v9 value];
          uint64_t v6 = objc_msgSend(v12, "numberWithDouble:");
          goto LABEL_11;
        }
      }
      uint64_t v6 = (void *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)json
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F28D90];
  __int16 v3 = [(PPRankableSocialHighlight *)self dictionaryRepresentation];
  id v4 = [v2 dataWithJSONObject:v3 options:8 error:0];

  if (!v4)
  {
    uint64_t v5 = pp_social_highlights_log_handle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      uint64_t v8 = 0;
      _os_log_error_impl(&dword_1CA9A8000, v5, OS_LOG_TYPE_ERROR, "Unable to serialize feedback to json: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  return v4;
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4 == 1)
  {
    id v4 = a3;
    uint64_t v5 = [[PPRankableSocialHighlight alloc] initWithData:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

@end