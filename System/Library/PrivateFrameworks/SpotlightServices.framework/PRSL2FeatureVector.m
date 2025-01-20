@interface PRSL2FeatureVector
+ (FeatureInfo)featureForName:(id)a3;
+ (__CFSet)getL2FeatureSet;
+ (id)allowedAttributeSetForAnonPipeline;
+ (id)contextWithFeatureOrder:(id)a3 withInflation:(unint64_t)a4 withInflatedIndexToSize:(id)a5;
+ (void)initialize;
- (BOOL)displayNameFuzzySpecialInsertion;
- (BOOL)isAppInDock;
- (BOOL)isSiriAction;
- (BOOL)receiverIsVip;
- (BOOL)senderIsVip;
- (BOOL)serializeToJSON:(void *)a3 options:(int64_t)a4;
- (BOOL)vipSenderMatchesQuery;
- (NSArray)kMDItemRecentAppSearchEngagementDates;
- (NSArray)kMDItemRecentOutOfSpotlightEngagementDates;
- (NSArray)kMDItemRecentSpotlightEngagementDatesNonUnique;
- (NSArray)kMDItemUsedDates;
- (NSDate)kMDItemApplicationLastLaunchedDate;
- (NSDate)kMDItemCompletionDate;
- (NSDate)kMDItemContentCreationDate;
- (NSDate)kMDItemContentModificationDate;
- (NSDate)kMDItemDueDate;
- (NSDate)kMDItemEndDate;
- (NSDate)kMDItemExpirationDate;
- (NSDate)kMDItemLastUsedDate;
- (NSDate)kMDItemStartDate;
- (NSDate)kMDMailFreshnessDate;
- (NSDate)kMDMailLastViewedDate;
- (NSDate)kMDMailReceivedDate;
- (NSDictionary)roundTripFeatures;
- (NSDictionary)searchThroughCEPData;
- (NSMutableDictionary)topicalityAnonFeatDict;
- (NSString)bundleID;
- (NSString)bundleId;
- (NSString)device_type;
- (NSString)kMDItemContentType;
- (PRSL2FeatureVector)init;
- (PRSL2FeatureVector)initWithCache:(PRSL2FeatureScoreSmallCache *)a3 featureData:(void *)a4 featureDataSize:(unsigned __int16)a5 flags:(unsigned __int8)a6 values:(unsigned __int8)a7;
- (PRSRankingItem)rankingItem;
- (float)experimentalScore;
- (float)getAllScores:(float)a3[3235];
- (float)kMDMailFlagged;
- (float)kMDMailRead;
- (float)kMDMailRepliedTo;
- (float)originalL2Score;
- (float)scoreForFeature:(unsigned __int16)a3;
- (float)withinBundleScore;
- (id)_dictionaryRepresentationWithoutDefaultValues:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)dictionaryRepresentationWithoutDefaultValues;
- (int64_t)kMDItemCustomPageVisitCountScore;
- (int64_t)kMDItemMailCategories;
- (int64_t)kMDItemPlayCount;
- (int64_t)kMDItemUseCount;
- (int64_t)textChunkTokenLength;
- (uint64_t)indexScore;
- (void)dealloc;
- (void)restoreFromJazzkonPlusHacks:(float *)a3;
- (void)setAllDisplayNameFeatures:(float *)a3 withValue:(float)a4;
- (void)setBundleID:(id)a3;
- (void)setBundleId:(id)a3;
- (void)setDevice_type:(id)a3;
- (void)setDisplayNameFuzzySpecialInsertion:(BOOL)a3;
- (void)setExperimentalScore:(float)a3;
- (void)setIndexScore:(PRSL2FeatureVector *)self;
- (void)setIsAppInDock:(BOOL)a3;
- (void)setIsSiriAction:(BOOL)a3;
- (void)setKMDItemApplicationLastLaunchedDate:(id)a3;
- (void)setKMDItemCompletionDate:(id)a3;
- (void)setKMDItemContentCreationDate:(id)a3;
- (void)setKMDItemContentModificationDate:(id)a3;
- (void)setKMDItemContentType:(id)a3;
- (void)setKMDItemCustomPageVisitCountScore:(int64_t)a3;
- (void)setKMDItemDueDate:(id)a3;
- (void)setKMDItemEndDate:(id)a3;
- (void)setKMDItemExpirationDate:(id)a3;
- (void)setKMDItemLastUsedDate:(id)a3;
- (void)setKMDItemMailCategories:(int64_t)a3;
- (void)setKMDItemPlayCount:(int64_t)a3;
- (void)setKMDItemRecentAppSearchEngagementDates:(id)a3;
- (void)setKMDItemRecentOutOfSpotlightEngagementDates:(id)a3;
- (void)setKMDItemRecentSpotlightEngagementDatesNonUnique:(id)a3;
- (void)setKMDItemStartDate:(id)a3;
- (void)setKMDItemUseCount:(int64_t)a3;
- (void)setKMDItemUsedDates:(id)a3;
- (void)setKMDMailFlagged:(float)a3;
- (void)setKMDMailFreshnessDate:(id)a3;
- (void)setKMDMailLastViewedDate:(id)a3;
- (void)setKMDMailRead:(float)a3;
- (void)setKMDMailReceivedDate:(id)a3;
- (void)setKMDMailRepliedTo:(float)a3;
- (void)setOriginalL2Score:(float)a3;
- (void)setRankingItem:(id)a3;
- (void)setRoundTripFeatures:(id)a3;
- (void)setScores:(float *)a3 forFeatures:(unsigned __int16 *)a4 count:(unint64_t)a5;
- (void)setSearchThroughCEPData:(id)a3;
- (void)setTextChunkTokenLength:(int64_t)a3;
- (void)setTopicalityAnonFeatDict:(id)a3;
- (void)setWithinBundleScore:(float)a3;
- (void)swapAllContentCreationDateFeatures:(float *)a3;
- (void)swapAllLastUsedDateFeatures:(float *)a3;
- (void)swapAllRecenyFeatures:(float *)a3;
- (void)swapFeature:(unsigned __int16)a3 withSubstitute:(unsigned __int16)a4 scores:(float *)a5;
@end

@implementation PRSL2FeatureVector

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = &byte_1E634D87A;
    uint64_t v3 = 3235;
    do
    {
      uint64_t v4 = *((unsigned __int16 *)v2 - 1);
      char v6 = *v2;
      v2 += 16;
      char v5 = v6;
      if ((v6 & 2) != 0) {
        float v7 = 0.0;
      }
      else {
        float v7 = -1.0;
      }
      sDefaultScores[v4] = v7;
      sFeatureFlags[v4] = v5;
      --v3;
    }
    while (v3);
  }
}

+ (__CFSet)getL2FeatureSet
{
  if (getL2FeatureSet_onceToken != -1) {
    dispatch_once(&getL2FeatureSet_onceToken, &__block_literal_global_47);
  }
  return (__CFSet *)getL2FeatureSet_sL2FeatureSet;
}

CFSetRef __37__PRSL2FeatureVector_getL2FeatureSet__block_invoke()
{
  values[3235] = *(void **)MEMORY[0x1E4F143B8];
  bzero(values, 0x6518uLL);
  uint64_t v0 = 0;
  v1 = &sFeatureInfo;
  do
  {
    values[v0++] = v1;
    v1 += 2;
  }
  while (v0 != 3235);
  CFSetCallBacks v3 = *(CFSetCallBacks *)byte_1F1823128;
  CFSetRef result = CFSetCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)values, 3235, &v3);
  getL2FeatureSet_sL2FeatureSet = (uint64_t)result;
  return result;
}

+ (id)contextWithFeatureOrder:(id)a3 withInflation:(unint64_t)a4 withInflatedIndexToSize:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  v9 = [[PRSL2FeatureVectorProcessingContext alloc] initWithFeatureOrder:v8 withInflation:a4 withInflatedIndexToSize:v7];

  return v9;
}

+ (FeatureInfo)featureForName:(id)a3
{
  v6[1] = 0;
  id v3 = a3;
  v6[0] = v3;
  Value = (FeatureInfo *)CFSetGetValue(+[PRSL2FeatureVector getL2FeatureSet], v6);

  return Value;
}

+ (id)allowedAttributeSetForAnonPipeline
{
  if (allowedAttributeSetForAnonPipeline_onceToken != -1) {
    dispatch_once(&allowedAttributeSetForAnonPipeline_onceToken, &__block_literal_global_9721);
  }
  v2 = (void *)allowedAttributeSetForAnonPipeline_allowedAttrSet;
  return v2;
}

uint64_t __56__PRSL2FeatureVector_allowedAttributeSetForAnonPipeline__block_invoke()
{
  objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"kMDItemSubject", @"kMDItemTitle", @"kMDItemPath", @"kMDItemContentURL", @"redirectSourceTitle", @"redirectSourceURL", @"kMDItemFilename", @"FPFilename", @"kMDItemAlternateNames", @"kMDItemDisplayName", @"kMDItemAuthors", @"kMDItemAuthorEmailAddresses", @"kMDItemRecipients", @"kMDItemPrimaryRecipientEmailAddresses", @"kMDItemEmailAddresses", @"kMDItemLastEditorName", @"kMDItemContactKeywords",
    @"kMDItemTextContent",
    @"kMDItemComment",
    @"kMDItemDescription",
    @"kMDItemAttachmentNames",
    @"com_apple_mail_attachmentKinds",
    @"kMDItemAttachmentTypes",
  allowedAttributeSetForAnonPipeline_allowedAttrSet = 0);
  return MEMORY[0x1F41817F8]();
}

- (PRSL2FeatureVector)init
{
  v7.receiver = self;
  v7.super_class = (Class)PRSL2FeatureVector;
  v2 = [(PRSL2FeatureVector *)&v7 init];
  id v3 = v2;
  if (v2)
  {
    v2->_cache.count = 0;
    uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    topicalityAnonFeatDict = v3->_topicalityAnonFeatDict;
    v3->_topicalityAnonFeatDict = (NSMutableDictionary *)v4;

    v3->_featureDataLock._os_unfair_lock_opaque = 0;
  }
  return v3;
}

- (PRSL2FeatureVector)initWithCache:(PRSL2FeatureScoreSmallCache *)a3 featureData:(void *)a4 featureDataSize:(unsigned __int16)a5 flags:(unsigned __int8)a6 values:(unsigned __int8)a7
{
  unsigned int v9 = a5;
  v12 = [(PRSL2FeatureVector *)self init];
  v13 = v12;
  if (v12)
  {
    v12->_cache.count = a3->count;
    if (a3->count)
    {
      unint64_t v14 = 0;
      scores = v12->_cache.scores;
      do
      {
        *((_WORD *)scores + v14 - 32) = a3->features[v14];
        scores[v14] = a3->scores[v14];
        ++v14;
      }
      while (v14 < a3->count);
    }
    v16 = malloc_type_malloc(v9, 0x9BAEE257uLL);
    v13->_featureData = v16;
    memcpy(v16, a4, v9);
    v13->_featureDataSize = v9;
    v13->_flags = a6;
    v13->_values = a7;
  }
  return v13;
}

- (void)setDisplayNameFuzzySpecialInsertion:(BOOL)a3
{
  p_featureDataLock = &self->_featureDataLock;
  os_unfair_lock_lock(&self->_featureDataLock);
  self->_flags |= 1u;
  os_unfair_lock_unlock(p_featureDataLock);
}

- (BOOL)displayNameFuzzySpecialInsertion
{
  p_featureDataLock = &self->_featureDataLock;
  os_unfair_lock_lock(&self->_featureDataLock);
  os_unfair_lock_unlock(p_featureDataLock);
  return 0;
}

- (void)setIsSiriAction:(BOOL)a3
{
  p_featureDataLock = &self->_featureDataLock;
  os_unfair_lock_lock(&self->_featureDataLock);
  self->_flags |= 2u;
  self->_values = self->_values & 0xFE | a3;
  os_unfair_lock_unlock(p_featureDataLock);
}

- (BOOL)isSiriAction
{
  v2 = self;
  p_featureDataLock = &self->_featureDataLock;
  os_unfair_lock_lock(&self->_featureDataLock);
  LODWORD(v2) = v2->_values & ((v2->_flags & 2) >> 1);
  os_unfair_lock_unlock(p_featureDataLock);
  return (char)v2;
}

- (void)setIsAppInDock:(BOOL)a3
{
  BOOL v3 = a3;
  p_featureDataLock = &self->_featureDataLock;
  os_unfair_lock_lock(&self->_featureDataLock);
  self->_flags |= 4u;
  if (v3) {
    char v6 = 2;
  }
  else {
    char v6 = 0;
  }
  self->_values = self->_values & 0xFD | v6;
  os_unfair_lock_unlock(p_featureDataLock);
}

- (BOOL)isAppInDock
{
  v2 = self;
  p_featureDataLock = &self->_featureDataLock;
  os_unfair_lock_lock(&self->_featureDataLock);
  LODWORD(v2) = (v2->_flags >> 2) & ((v2->_values & 2) >> 1);
  os_unfair_lock_unlock(p_featureDataLock);
  return (char)v2;
}

- (BOOL)vipSenderMatchesQuery
{
  [(PRSL2FeatureVector *)self scoreForFeature:1853];
  return v2 != 0.0;
}

- (BOOL)senderIsVip
{
  [(PRSL2FeatureVector *)self scoreForFeature:1852];
  return v2 != 0.0;
}

- (BOOL)receiverIsVip
{
  [(PRSL2FeatureVector *)self scoreForFeature:1854];
  return v2 != 0.0;
}

- (float)scoreForFeature:(unsigned __int16)a3
{
  unsigned int v3 = a3;
  p_featureDataLock = &self->_featureDataLock;
  os_unfair_lock_lock(&self->_featureDataLock);
  if (self->_cache.count)
  {
    uint64_t v6 = 0;
    do
    {
      if (self->_cache.features[v6] == v3)
      {
        float v14 = self->_cache.scores[v6];
        goto LABEL_28;
      }
      ++v6;
    }
    while (self->_cache.count != v6);
  }
  if ((sFeatureFlags[v3] & 0x20) != 0)
  {
    BOOL BoolFromFlaggedFeature = getBoolFromFlaggedFeature(v3, self->_flags, self->_values);
    os_unfair_lock_unlock(p_featureDataLock);
    return (float)BoolFromFlaggedFeature;
  }
  if (!self->_featureDataSize)
  {
LABEL_25:
    float v14 = sDefaultScores[v3];
    goto LABEL_28;
  }
  int v7 = 0;
  int v8 = 0;
  featureData = (unsigned __int8 *)self->_featureData;
  while (1)
  {
    unsigned int v10 = *featureData;
    if ((v10 & 0xC0) != 0x40)
    {
      v11 = featureData + 1;
      if ((v10 & 0x3F) != 0)
      {
        int v12 = v10 & 0x1F;
        if ((v10 & 0x20) != 0)
        {
          v11 = featureData + 2;
          int v12 = featureData[1] | (v12 << 8);
        }
        if ((v10 & 0xC0) != 0)
        {
LABEL_15:
          if ((v10 & 0xC0) == 0x80)
          {
            if (v7 + v12 >= v3) {
              goto LABEL_25;
            }
          }
          else if (v10 >= 0xC0 && v7 + v12 >= v3)
          {
            float v14 = 0.0;
            goto LABEL_28;
          }
          goto LABEL_23;
        }
      }
      else
      {
        int v12 = 0;
        if ((v10 & 0xC0) != 0) {
          goto LABEL_15;
        }
      }
      if (v7 + v12 >= v3)
      {
        float v14 = *(float *)&v11[4 * (v3 - v7)];
        goto LABEL_28;
      }
      v11 += (4 * v12 + 4);
LABEL_23:
      v8 += v12;
      goto LABEL_24;
    }
    if (v3 == (unsigned __int16)v8) {
      break;
    }
    v11 = featureData + 1;
LABEL_24:
    unsigned int v13 = (unsigned __int16)v8++;
    int v7 = (unsigned __int16)v8;
    featureData = v11;
    if (v13 >= 0xCA2) {
      goto LABEL_25;
    }
  }
  if ((v10 & 0x3F) == 0x3F) {
    float v14 = 2147500000.0;
  }
  else {
    float v14 = (float)(v10 & 0x3F);
  }
LABEL_28:
  os_unfair_lock_unlock(p_featureDataLock);
  return v14;
}

- (float)getAllScores:(float)a3[3235]
{
  p_featureDataLock = &self->_featureDataLock;
  os_unfair_lock_lock(&self->_featureDataLock);
  decodeRankingScores((unsigned __int8 *)self->_featureData, self->_featureDataSize, (char *)a3);
  uint64_t count = self->_cache.count;
  if (self->_cache.count)
  {
    uint64_t v7 = 0;
    do
    {
      a3[self->_cache.features[v7]] = self->_cache.scores[v7];
      ++v7;
    }
    while (count != v7);
  }
  for (uint64_t i = 0; i != 6; ++i)
  {
    uint64_t v9 = (unsigned __int16)sFlaggedFeatureList[i];
    if ((sFeatureFlags[v9] & 0x20) == 0) {
      continue;
    }
    if ((unsigned __int16)sFlaggedFeatureList[i] > 0x78Au)
    {
      switch(v9)
      {
        case 0x78B:
          unsigned int v10 = 1;
          break;
        case 0x7AD:
          unsigned int v10 = 4;
          break;
        case 0x7AE:
          unsigned int v10 = 2;
          break;
        default:
          continue;
      }
    }
    else
    {
      switch(v9)
      {
        case 0x73C:
          unsigned int v10 = 16;
          break;
        case 0x73D:
          unsigned int v10 = 8;
          break;
        case 0x73E:
          unsigned int v10 = 32;
          break;
        default:
          continue;
      }
    }
    if ((self->_flags & v10) != 0)
    {
      if ((self->_values & (v10 >> 1)) != 0) {
        float v11 = 1.0;
      }
      else {
        float v11 = 0.0;
      }
      a3[v9] = v11;
    }
  }
  os_unfair_lock_unlock(p_featureDataLock);
  return a3;
}

- (void)setScores:(float *)a3 forFeatures:(unsigned __int16 *)a4 count:(unint64_t)a5
{
  char v5 = (os_unfair_lock_s *)((uint64_t (*)(PRSL2FeatureVector *, SEL, float *, unsigned __int16 *, unint64_t))MEMORY[0x1F4188790])(self, a2, a3, a4, a5);
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  float v11 = v10;
  int v12 = v5;
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  unsigned int v13 = v5 + 2;
  os_unfair_lock_lock(v5 + 2);
  uint64_t os_unfair_lock_opaque_low = LOWORD(v12[51]._os_unfair_lock_opaque);
  if ((unint64_t)(os_unfair_lock_opaque_low + v7) > 0x1F)
  {
    bzero(v59, 0x328CuLL);
    decodeRankingScores(*(unsigned __int8 **)&v12[52]._os_unfair_lock_opaque, LOWORD(v12[54]._os_unfair_lock_opaque), v59);
    if (os_unfair_lock_opaque_low)
    {
      for (uint64_t i = 0; i != os_unfair_lock_opaque_low; ++i)
        *(os_unfair_lock_s *)&v59[4 * *((unsigned __int16 *)&v12[3]._os_unfair_lock_opaque + i)] = v12[i + 19];
    }
    for (LOWORD(v12[51]._os_unfair_lock_opaque) = 0; v7; --v7)
    {
      int v25 = *v9++;
      int v24 = v25;
      float v26 = *v11;
      *(float *)&v59[4 * v25] = *v11;
      if ((sFeatureFlags[v25] & 0x20) != 0)
      {
        if (v24 > 1930)
        {
          switch(v24)
          {
            case 1931:
              unsigned int v27 = 1;
              goto LABEL_44;
            case 1965:
              unsigned int v27 = 4;
              goto LABEL_44;
            case 1966:
              unsigned int v27 = 2;
              goto LABEL_44;
          }
        }
        else
        {
          switch(v24)
          {
            case 1852:
              unsigned int v27 = 16;
              goto LABEL_44;
            case 1853:
              unsigned int v27 = 8;
              goto LABEL_44;
            case 1854:
              unsigned int v27 = 32;
LABEL_44:
              BYTE2(v12[54]._os_unfair_lock_opaque) |= v27;
              unsigned int v28 = v27 >> 1;
              if (v26 == 1.0) {
                char v29 = HIBYTE(v12[54]._os_unfair_lock_opaque) | v28;
              }
              else {
                char v29 = HIBYTE(v12[54]._os_unfair_lock_opaque) & ~(_BYTE)v28;
              }
              HIBYTE(v12[54]._os_unfair_lock_opaque) = v29;
              break;
          }
        }
      }
      ++v11;
    }
    v57 = *(void **)&v12[52]._os_unfair_lock_opaque;
    v30 = __src;
    bzero(__src, 0x1F978uLL);
    int v31 = 0;
    int v32 = 0;
    while (1)
    {
      v33 = (float *)&v59[4 * (unsigned __int16)v32];
      float v34 = *v33;
      if (*v33 == sDefaultScores[(unsigned __int16)v32])
      {
        int v35 = 128;
        goto LABEL_54;
      }
      if (v34 == 0.0)
      {
        int v35 = 192;
LABEL_54:
        uint64_t v36 = (v31 + 1);
        if (v31 == 3234)
        {
          *v30++ = v35;
        }
        else
        {
          uint64_t v37 = 0;
          v38 = &sDefaultScores[v31 + 1];
          v39 = &v59[4 * v31 + 4];
          while ((unint64_t)(v36 + v37) <= 0xCA2)
          {
            float v40 = *(float *)&v39[4 * v37];
            if (v40 == v38[v37])
            {
              int v41 = 128;
            }
            else
            {
              if (v40 != 0.0) {
                break;
              }
              int v41 = 192;
            }
            if (v41 != v35) {
              break;
            }
            if (++v37 == 2047) {
              goto LABEL_66;
            }
          }
          if ((unsigned __int16)v37 >= 0x20u)
          {
LABEL_66:
            char *v30 = v35 | BYTE1(v37) & 0x1F | 0x20;
            v30[1] = v37;
            v30 += 2;
            goto LABEL_68;
          }
          *v30++ = v35 | v37;
LABEL_68:
          v32 += v37;
        }
        goto LABEL_69;
      }
      if (v34 == 2147500000.0
        || (((int)v34 - 1) <= 0x3D ? (BOOL v42 = v34 == (float)(int)v34) : (BOOL v42 = 0), v42))
      {
        if (v34 == 2147500000.0) {
          char v51 = 127;
        }
        else {
          char v51 = (int)v34 & 0x3F | 0x40;
        }
        *v30++ = v51;
        goto LABEL_69;
      }
      if ((unsigned __int16)v32 > 0xCA1u) {
        break;
      }
      unsigned int v43 = 0;
      uint64_t v44 = (unsigned __int16)v32 + 1;
      while (1)
      {
        float v45 = *(float *)&v59[4 * v44];
        if (v45 == 2147500000.0) {
          break;
        }
        if (v45 == 0.0 || v45 == sDefaultScores[v44]) {
          break;
        }
        if (((int)v45 - 1) <= 0x3D && v45 == (float)(int)v45) {
          break;
        }
        ++v43;
        if (++v44 == 3235)
        {
          unsigned int v43 = 3234 - v32;
          break;
        }
      }
      uint64_t v48 = (unsigned __int16)v43;
      if ((unsigned __int16)v43 < 0x20u) {
        goto LABEL_96;
      }
      int v49 = (v43 >> 8) & 0x1F | 0x20;
      v50 = v30 + 2;
      v30[1] = v43;
LABEL_97:
      char *v30 = v49;
      size_t v52 = 4 * v48 + 4;
      memcpy(v50, v33, v52);
      v30 = &v50[v52];
      v32 += v43;
LABEL_69:
      int v31 = (unsigned __int16)++v32;
      if ((unsigned __int16)v32 >= 0xCA3u)
      {
        int64_t v54 = v30 - __src;
        size_t v55 = (unsigned __int16)((_WORD)v30 - (v53 + 8));
        v56 = malloc_type_malloc(v55, 0x6906E85FuLL);
        memcpy(v56, __src, v55);
        *(void *)&v12[52]._unsigned __int16 os_unfair_lock_opaque = v56;
        LOWORD(v12[54]._os_unfair_lock_opaque) = v54;
        os_unfair_lock_unlock(v13);
        free(v57);
        return;
      }
    }
    uint64_t v48 = 0;
    unsigned int v43 = 0;
LABEL_96:
    v50 = v30 + 1;
    LOBYTE(v49) = v43;
    goto LABEL_97;
  }
  if (v7)
  {
    unsigned __int16 os_unfair_lock_opaque = v12[51]._os_unfair_lock_opaque;
    do
    {
      int v17 = *v9++;
      int v16 = v17;
      float v18 = *v11;
      *((_WORD *)&v12[3]._os_unfair_lock_opaque + os_unfair_lock_opaque) = v17;
      uint64_t v19 = LOWORD(v12[51]._os_unfair_lock_opaque);
      unsigned __int16 os_unfair_lock_opaque = v19 + 1;
      LOWORD(v12[51]._os_unfair_lock_opaque) = v19 + 1;
      *(float *)&v12[v19 + 19]._unsigned __int16 os_unfair_lock_opaque = v18;
      if ((sFeatureFlags[v17] & 0x20) != 0)
      {
        if (v16 > 1930)
        {
          switch(v16)
          {
            case 1931:
              unsigned int v20 = 1;
              goto LABEL_18;
            case 1965:
              unsigned int v20 = 4;
              goto LABEL_18;
            case 1966:
              unsigned int v20 = 2;
              goto LABEL_18;
          }
        }
        else
        {
          switch(v16)
          {
            case 1852:
              unsigned int v20 = 16;
              goto LABEL_18;
            case 1853:
              unsigned int v20 = 8;
              goto LABEL_18;
            case 1854:
              unsigned int v20 = 32;
LABEL_18:
              BYTE2(v12[54]._os_unfair_lock_opaque) |= v20;
              unsigned int v21 = v20 >> 1;
              if (v18 == 1.0) {
                char v22 = HIBYTE(v12[54]._os_unfair_lock_opaque) | v21;
              }
              else {
                char v22 = HIBYTE(v12[54]._os_unfair_lock_opaque) & ~(_BYTE)v21;
              }
              HIBYTE(v12[54]._os_unfair_lock_opaque) = v22;
              break;
          }
        }
      }
      ++v11;
      --v7;
    }
    while (v7);
  }
  os_unfair_lock_unlock(v13);
}

- (id)dictionaryRepresentation
{
  return [(PRSL2FeatureVector *)self _dictionaryRepresentationWithoutDefaultValues:0];
}

- (id)_dictionaryRepresentationWithoutDefaultValues:(BOOL)a3
{
  uint64_t v3 = ((uint64_t (*)(PRSL2FeatureVector *, SEL, BOOL))MEMORY[0x1F4188790])(self, a2, a3);
  int v5 = v4;
  uint64_t v6 = v3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_opt_new();
  bzero(v24, 0x328CuLL);
  uint64_t v8 = [(id)v6 getAllScores:v24];
  uint64_t v9 = &byte_1E634D87A;
  uint64_t v10 = 3235;
  do
  {
    float v11 = *(float *)(v8 + 4 * *((unsigned __int16 *)v9 - 1));
    if (v5)
    {
      if ((unsigned __int16)(*((_WORD *)v9 - 1) - 2397) < 0x20u) {
        goto LABEL_27;
      }
      if (fabsf(v11 + 1.0) <= 0.001) {
        goto LABEL_27;
      }
      int v12 = *((unsigned __int16 *)v9 - 1);
      if ((v12 - 397) < 2 || v12 == 2391) {
        goto LABEL_27;
      }
      if ((*v9 & 0x10) != 0)
      {
        uint64_t v13 = 4;
        goto LABEL_16;
      }
      if ((*v9 & 8) != 0) {
        goto LABEL_14;
      }
      if ((*v9 & 4) != 0) {
        goto LABEL_15;
      }
      if ((*v9 & 0x40) != 0)
      {
        if (v11 <= 30.0) {
LABEL_14:
        }
          uint64_t v13 = 2;
        else {
LABEL_15:
        }
          uint64_t v13 = 1;
LABEL_16:
        +[PRSRankingUtilities floatValue:withSigFigs:](PRSRankingUtilities, "floatValue:withSigFigs:", v13);
      }
    }
    if (v11 == 0.0 || v11 == 1.0 || v11 == -1.0) {
      [MEMORY[0x1E4F28ED0] numberWithInt:(int)v11];
    }
    else {
    int v16 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithFloat:");
    }
    [v7 setObject:v16 forKeyedSubscript:*(void *)(v9 - 10)];

LABEL_27:
    v9 += 16;
    --v10;
  }
  while (v10);
  [v7 setObject:*(void *)(v6 + 248) forKeyedSubscript:@"bundleID"];
  if ((v5 & 1) == 0)
  {
    LODWORD(v17) = *(_DWORD *)(v6 + 220);
    float v18 = [MEMORY[0x1E4F28ED0] numberWithFloat:v17];
    [v7 setObject:v18 forKeyedSubscript:@"l2Score"];

    LODWORD(v19) = *(_DWORD *)(v6 + 224);
    unsigned int v20 = [MEMORY[0x1E4F28ED0] numberWithFloat:v19];
    [v7 setObject:v20 forKeyedSubscript:@"l2ScoreExperimental"];
  }
  unsigned int v21 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:*(void *)(v6 + 480)];
  [v7 setObject:v21 forKeyedSubscript:@"lscore_0_2"];

  char v22 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:*(void *)(v6 + 488)];
  [v7 setObject:v22 forKeyedSubscript:@"lscore_1_2"];

  return v7;
}

- (id)dictionaryRepresentationWithoutDefaultValues
{
  return [(PRSL2FeatureVector *)self _dictionaryRepresentationWithoutDefaultValues:1];
}

- (void)restoreFromJazzkonPlusHacks:(float *)a3
{
  float v5 = a3[372];
  if ([(NSString *)self->_bundleID isEqualToString:@"com.apple.Preferences"])
  {
    [(PRSL2FeatureVector *)self swapAllLastUsedDateFeatures:a3];
    [(PRSL2FeatureVector *)self swapAllRecenyFeatures:a3];
  }
  else if ([(NSString *)self->_bundleID isEqualToString:@"com.apple.MobileAddressBook"])
  {
    [(PRSL2FeatureVector *)self swapAllLastUsedDateFeatures:a3];
  }
  if (v5 == 0.0
    && (![(NSString *)self->_bundleID hasPrefix:@"com.apple."]
     || [(NSString *)self->_bundleID isEqualToString:@"com.apple.Preferences"]
     || [(NSString *)self->_bundleID isEqualToString:@"com.apple.CoreSuggestions"]))
  {
    [(PRSL2FeatureVector *)self swapFeature:1911 withSubstitute:2355 scores:a3];
  }
  if ([(NSString *)self->_bundleID isEqualToString:@"com.apple.mobilecal"]
    && a3[2354] != -1.0)
  {
    [(PRSL2FeatureVector *)self swapFeature:42 withSubstitute:2354 scores:a3];
  }
  if ([(NSString *)self->_bundleID isEqualToString:@"com.apple.mobilenotes"]
    || [(NSString *)self->_bundleID isEqualToString:@"com.apple.MobileAddressBook"])
  {
    [(PRSL2FeatureVector *)self swapFeature:42 withSubstitute:2354 scores:a3];
  }
  if ([(NSString *)self->_bundleID isEqualToString:@"com.apple.mobilenotes"])
  {
    if (a3[2338] != -1.0) {
      [(PRSL2FeatureVector *)self swapFeature:10 withSubstitute:2338 scores:a3];
    }
    if (a3[2339] != -1.0) {
      [(PRSL2FeatureVector *)self swapFeature:8 withSubstitute:2339 scores:a3];
    }
    if (a3[2340] != -1.0) {
      [(PRSL2FeatureVector *)self swapFeature:6 withSubstitute:2340 scores:a3];
    }
  }
  if ([(NSString *)self->_bundleID isEqualToString:@"com.apple.application"]
    || [(NSString *)self->_bundleID isEqualToString:@"com.apple.Preferences"]
    || [(NSString *)self->_bundleID isEqualToString:@"com.apple.DocumentsApp"]
    || [(NSString *)self->_bundleID isEqualToString:@"com.apple.FileProvider.LocalStorage"]
    || [(NSString *)self->_bundleID isEqualToString:@"com.apple.CloudDocs.MobileDocumentsFileProvider"])
  {
    if (a3[2354] == 1.0) {
      [(PRSL2FeatureVector *)self swapFeature:42 withSubstitute:2354 scores:a3];
    }
  }
  else if ([(NSString *)self->_bundleID isEqualToString:@"com.apple.Passbook"])
  {
    [(PRSL2FeatureVector *)self swapAllContentCreationDateFeatures:a3];
  }
  if ([(NSString *)self->_bundleID isEqualToString:@"com.apple.photos"] && a3[3085] != -1.0) {
    [(PRSL2FeatureVector *)self swapFeature:204 withSubstitute:3085 scores:a3];
  }
  if (v5 != 0.0)
  {
    [(PRSL2FeatureVector *)self swapFeature:377 withSubstitute:378 scores:a3];
  }
}

- (void)swapAllContentCreationDateFeatures:(float *)a3
{
  [(PRSL2FeatureVector *)self swapFeature:1874 withSubstitute:2341 scores:a3];
  [(PRSL2FeatureVector *)self swapFeature:9 withSubstitute:2342 scores:a3];
  [(PRSL2FeatureVector *)self swapFeature:3 withSubstitute:2343 scores:a3];
  [(PRSL2FeatureVector *)self swapFeature:7 withSubstitute:2344 scores:a3];
  [(PRSL2FeatureVector *)self swapFeature:5 withSubstitute:2345 scores:a3];
}

- (void)swapAllLastUsedDateFeatures:(float *)a3
{
  [(PRSL2FeatureVector *)self swapFeature:10 withSubstitute:2338 scores:a3];
  [(PRSL2FeatureVector *)self swapFeature:8 withSubstitute:2339 scores:a3];
  [(PRSL2FeatureVector *)self swapFeature:6 withSubstitute:2340 scores:a3];
}

- (void)swapAllRecenyFeatures:(float *)a3
{
  [(PRSL2FeatureVector *)self swapFeature:1972 withSubstitute:2346 scores:a3];
  [(PRSL2FeatureVector *)self swapFeature:1973 withSubstitute:2347 scores:a3];
  [(PRSL2FeatureVector *)self swapFeature:1974 withSubstitute:2348 scores:a3];
  [(PRSL2FeatureVector *)self swapFeature:1975 withSubstitute:2349 scores:a3];
  [(PRSL2FeatureVector *)self swapFeature:1976 withSubstitute:2350 scores:a3];
  [(PRSL2FeatureVector *)self swapFeature:1977 withSubstitute:2351 scores:a3];
  [(PRSL2FeatureVector *)self swapFeature:1978 withSubstitute:2352 scores:a3];
  [(PRSL2FeatureVector *)self swapFeature:1979 withSubstitute:2353 scores:a3];
}

- (void)setAllDisplayNameFeatures:(float *)a3 withValue:(float)a4
{
  float v4 = 1.0;
  if (a4 == -1.0) {
    float v4 = 0.0;
  }
  a3[308] = v4;
  a3[131] = a4;
  a3[203] = a4;
  a3[165] = a4;
  a3[95] = a4;
  int32x4_t v5 = vdupq_lane_s32(*(int32x2_t *)&a4, 0);
  a3[77] = a4;
  *(int32x4_t *)(a3 + 198) = v5;
  a3[130] = a4;
  a3[202] = a4;
  a3[164] = a4;
  a3[113] = a4;
  *(int32x4_t *)(a3 + 410) = v5;
  *(int32x4_t *)(a3 + 414) = v5;
  *(int32x4_t *)(a3 + 418) = v5;
  a3[422] = a4;
  a3[423] = a4;
  a3[424] = a4;
  *(int32x4_t *)(a3 + 673) = v5;
  *(int32x4_t *)(a3 + 665) = v5;
  *(int32x4_t *)(a3 + 669) = v5;
  a3[2429] = a4;
  a3[2430] = a4;
  a3[2431] = a4;
  a3[2432] = a4;
  a3[2593] = a4;
  a3[2594] = a4;
}

- (void)swapFeature:(unsigned __int16)a3 withSubstitute:(unsigned __int16)a4 scores:(float *)a5
{
  float v5 = a5[a4];
  if (v5 != -1.0)
  {
    float v6 = a5[a3];
    a5[a3] = v5;
    a5[a4] = v6;
  }
}

- (BOOL)serializeToJSON:(void *)a3 options:(int64_t)a4
{
  uint64_t v4 = ((uint64_t (*)(PRSL2FeatureVector *, SEL, void *, int64_t))MEMORY[0x1F4188790])(self, a2, a3, a4);
  char v6 = v5;
  uint64_t v8 = v7;
  uint64_t v9 = v4;
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  bzero(v78, 0x328CuLL);
  uint64_t v10 = [(id)v9 getAllScores:v78];
  if ((v6 & 2) == 0) {
    [(id)v9 restoreFromJazzkonPlusHacks:v10];
  }
  uint64_t v11 = -1;
  int v12 = &byte_1E634D87A;
  uint64_t v13 = 3235;
  do
  {
    float v14 = *(float *)(v10 + 4 * *((unsigned __int16 *)v12 - 1));
    if (*((_WORD *)v12 - 1) == 363) {
      uint64_t v11 = (uint64_t)v14;
    }
    if ((v6 & 1) == 0) {
      goto LABEL_7;
    }
    if ((unsigned __int16)(*((_WORD *)v12 - 1) - 2397) < 0x20u) {
      goto LABEL_26;
    }
    double v17 = fabsf(v14 + 1.0);
    if (v17 <= 0.001) {
      goto LABEL_26;
    }
    int v18 = *((unsigned __int16 *)v12 - 1);
    if ((v18 - 397) < 2 || v18 == 2391) {
      goto LABEL_26;
    }
    if ((*v12 & 0x10) != 0)
    {
      LODWORD(v17) = *(_DWORD *)(v10 + 4 * *((unsigned __int16 *)v12 - 1));
      uint64_t v19 = 4;
      goto LABEL_31;
    }
    if ((*v12 & 8) != 0) {
      goto LABEL_29;
    }
    if ((*v12 & 4) != 0) {
      goto LABEL_30;
    }
    if ((*v12 & 0x40) != 0)
    {
      if (v14 <= 30.0)
      {
LABEL_29:
        LODWORD(v17) = *(_DWORD *)(v10 + 4 * *((unsigned __int16 *)v12 - 1));
        uint64_t v19 = 2;
      }
      else
      {
LABEL_30:
        LODWORD(v17) = *(_DWORD *)(v10 + 4 * *((unsigned __int16 *)v12 - 1));
        uint64_t v19 = 1;
      }
LABEL_31:
      +[PRSRankingUtilities floatValue:v19 withSigFigs:v17];
      float v14 = v20;
    }
LABEL_7:
    json_writer_add_key((uint64_t)v8, (char *)[*(id *)(v12 - 10) UTF8String], 0xFFFFFFFFFFFFFFFFLL, 1);
    if (v14 == 0.0 || v14 == 1.0 || v14 == -1.0) {
      json_writer_add_int64((uint64_t)v8, (uint64_t)v14);
    }
    else {
      json_writer_add_double(v8, v14);
    }
LABEL_26:
    v12 += 16;
    --v13;
  }
  while (v13);
  id WeakRetained = objc_loadWeakRetained((id *)(v9 + 280));

  if (WeakRetained && v11 >= 1)
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      id v23 = objc_msgSend([NSString alloc], "initWithFormat:", @"attrCountWordQueryTerm%lu", i);
      json_writer_add_key((uint64_t)v8, (char *)[v23 UTF8String], 0xFFFFFFFFFFFFFFFFLL, 1);
      id v24 = objc_loadWeakRetained((id *)(v9 + 280));
      json_writer_add_uint64((uint64_t)v8, [v24 attrCountWord:i]);

      uint64_t v25 = objc_msgSend([NSString alloc], "initWithFormat:", @"attrCountWord2QueryTerm%lu", i);
      id v26 = v25;
      json_writer_add_key((uint64_t)v8, (char *)[v26 UTF8String], 0xFFFFFFFFFFFFFFFFLL, 1);
      id v27 = objc_loadWeakRetained((id *)(v9 + 280));
      json_writer_add_uint64((uint64_t)v8, [v27 attrCountWord2:i]);

      unsigned int v28 = objc_msgSend([NSString alloc], "initWithFormat:", @"attrCountWord3QueryTerm%lu", i);
      id v29 = v28;
      json_writer_add_key((uint64_t)v8, (char *)[v29 UTF8String], 0xFFFFFFFFFFFFFFFFLL, 1);
      id v30 = objc_loadWeakRetained((id *)(v9 + 280));
      json_writer_add_uint64((uint64_t)v8, [v30 attrCountWord3:i]);

      int v31 = objc_msgSend([NSString alloc], "initWithFormat:", @"attrCountPrefixQueryTerm%lu", i);
      id v32 = v31;
      json_writer_add_key((uint64_t)v8, (char *)[v32 UTF8String], 0xFFFFFFFFFFFFFFFFLL, 1);
      id v33 = objc_loadWeakRetained((id *)(v9 + 280));
      json_writer_add_uint64((uint64_t)v8, [v33 attrCountPrefix:i]);

      float v34 = objc_msgSend([NSString alloc], "initWithFormat:", @"attrCountPrefix2QueryTerm%lu", i);
      id v35 = v34;
      json_writer_add_key((uint64_t)v8, (char *)[v35 UTF8String], 0xFFFFFFFFFFFFFFFFLL, 1);
      id v36 = objc_loadWeakRetained((id *)(v9 + 280));
      json_writer_add_uint64((uint64_t)v8, [v36 attrCountPrefix2:i]);

      uint64_t v37 = objc_msgSend([NSString alloc], "initWithFormat:", @"attrCountPrefix3QueryTerm%lu", i);
      id v38 = v37;
      json_writer_add_key((uint64_t)v8, (char *)[v38 UTF8String], 0xFFFFFFFFFFFFFFFFLL, 1);
      id v39 = objc_loadWeakRetained((id *)(v9 + 280));
      json_writer_add_uint64((uint64_t)v8, [v39 attrCountPrefix3:i]);

      float v40 = objc_msgSend([NSString alloc], "initWithFormat:", @"attrCountPrefixLastQueryTerm%lu", i);
      id v41 = v40;
      json_writer_add_key((uint64_t)v8, (char *)[v41 UTF8String], 0xFFFFFFFFFFFFFFFFLL, 1);
      id v42 = objc_loadWeakRetained((id *)(v9 + 280));
      json_writer_add_uint64((uint64_t)v8, [v42 attrCountPrefixLast:i]);

      unsigned int v43 = objc_msgSend([NSString alloc], "initWithFormat:", @"attrCountPrefixLast2QueryTerm%lu", i);
      id v44 = v43;
      json_writer_add_key((uint64_t)v8, (char *)[v44 UTF8String], 0xFFFFFFFFFFFFFFFFLL, 1);
      id v45 = objc_loadWeakRetained((id *)(v9 + 280));
      json_writer_add_uint64((uint64_t)v8, [v45 attrCountPrefixLast2:i]);

      v46 = objc_msgSend([NSString alloc], "initWithFormat:", @"attrCountPrefixLast3QueryTerm%lu", i);
      id v47 = v46;
      json_writer_add_key((uint64_t)v8, (char *)[v47 UTF8String], 0xFFFFFFFFFFFFFFFFLL, 1);
      id v48 = objc_loadWeakRetained((id *)(v9 + 280));
      json_writer_add_uint64((uint64_t)v8, [v48 attrCountPrefixLast3:i]);
    }
  }
  if (!*(void *)(v9 + 248)) {
    goto LABEL_48;
  }
  json_writer_add_key((uint64_t)v8, "bundleID", 8uLL, 1);
  int v49 = (__CFString *)*(id *)(v9 + 248);
  id v50 = objc_loadWeakRetained((id *)(v9 + 280));
  int v51 = [v50 bundleIDType];

  if ((v51 & 0x2000000) == 0) {
    goto LABEL_47;
  }
  id v52 = objc_loadWeakRetained((id *)(v9 + 280));
  int v53 = [v52 bundleIDType];

  if ((v53 & 0x4000000) != 0)
  {
    uint64_t v60 = SSSectionIdentifierSyndicatedPhotosMessages;
LABEL_46:
    v61 = *v60;

    int v49 = v61;
    goto LABEL_47;
  }
  id v54 = objc_loadWeakRetained((id *)(v9 + 280));
  int v55 = [v54 bundleIDType];

  if ((v55 & 0x8000000) != 0)
  {
    uint64_t v60 = SSSectionIdentifierSyndicatedPhotosNotes;
    goto LABEL_46;
  }
  id v56 = objc_loadWeakRetained((id *)(v9 + 280));
  int v57 = [v56 bundleIDType];

  if ((v57 & 0x10000000) != 0)
  {
    uint64_t v60 = SSSectionIdentifierSyndicatedPhotosFiles;
    goto LABEL_46;
  }
  id v58 = objc_loadWeakRetained((id *)(v9 + 280));
  int v59 = [v58 bundleIDType];

  if ((v59 & 0x20000000) != 0)
  {
    uint64_t v60 = SSSectionIdentifierSyndicatedPhotosFromPhotos;
    goto LABEL_46;
  }
LABEL_47:
  v62 = v49;
  json_writer_add_string(v8, (char *)[(__CFString *)v62 UTF8String], 0xFFFFFFFFFFFFFFFFLL, 1);

LABEL_48:
  if ((v6 & 1) == 0)
  {
    json_writer_add_key((uint64_t)v8, "l2Score", 7uLL, 1);
    json_writer_add_double(v8, *(float *)(v9 + 220));
    json_writer_add_key((uint64_t)v8, "l2ScoreExperimental", 0x13uLL, 1);
    json_writer_add_double(v8, *(float *)(v9 + 224));
  }
  json_writer_add_key((uint64_t)v8, "lscore_0_2", 0xAuLL, 1);
  json_writer_add_uint64((uint64_t)v8, *(void *)(v9 + 480));
  json_writer_add_key((uint64_t)v8, "lscore_1_2", 0xAuLL, 1);
  json_writer_add_uint64((uint64_t)v8, *(void *)(v9 + 488));
  if ((v6 & 4) == 0)
  {
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    v63 = [*(id *)(v9 + 272) allKeys];
    uint64_t v64 = [v63 countByEnumeratingWithState:&v73 objects:v77 count:16];
    if (v64)
    {
      uint64_t v65 = v64;
      uint64_t v66 = *(void *)v74;
      do
      {
        for (uint64_t j = 0; j != v65; ++j)
        {
          if (*(void *)v74 != v66) {
            objc_enumerationMutation(v63);
          }
          v68 = *(void **)(*((void *)&v73 + 1) + 8 * j);
          v69 = [*(id *)(v9 + 272) objectForKey:v68];
          [v69 floatValue];
          float v71 = v70;
          json_writer_add_key((uint64_t)v8, (char *)[v68 UTF8String], 0xFFFFFFFFFFFFFFFFLL, 1);
          json_writer_add_double(v8, v71);
        }
        uint64_t v65 = [v63 countByEnumeratingWithState:&v73 objects:v77 count:16];
      }
      while (v65);
    }
  }
  return 1;
}

- (void)dealloc
{
  free(self->_featureData);
  v3.receiver = self;
  v3.super_class = (Class)PRSL2FeatureVector;
  [(PRSL2FeatureVector *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  p_featureDataLock = &self->_featureDataLock;
  os_unfair_lock_lock(&self->_featureDataLock);
  id v5 = objc_alloc((Class)objc_opt_class());
  featureData = self->_featureData;
  uint64_t featureDataSize = self->_featureDataSize;
  uint64_t flags = self->_flags;
  uint64_t values = self->_values;
  long long v10 = *(_OWORD *)&self->_cache.scores[20];
  long long v11 = *(_OWORD *)&self->_cache.scores[28];
  v28[10] = *(_OWORD *)&self->_cache.scores[24];
  v28[11] = v11;
  int v29 = *(_DWORD *)&self->_cache.count;
  long long v12 = *(_OWORD *)&self->_cache.scores[4];
  long long v13 = *(_OWORD *)&self->_cache.scores[12];
  v28[6] = *(_OWORD *)&self->_cache.scores[8];
  v28[7] = v13;
  v28[8] = *(_OWORD *)&self->_cache.scores[16];
  v28[9] = v10;
  long long v14 = *(_OWORD *)&self->_cache.features[8];
  long long v15 = *(_OWORD *)&self->_cache.features[24];
  v28[2] = *(_OWORD *)&self->_cache.features[16];
  v28[3] = v15;
  v28[4] = *(_OWORD *)self->_cache.scores;
  v28[5] = v12;
  v28[0] = *(_OWORD *)self->_cache.features;
  v28[1] = v14;
  int v16 = (void *)[v5 initWithCache:v28 featureData:featureData featureDataSize:featureDataSize flags:flags values:values];
  [(PRSL2FeatureVector *)self originalL2Score];
  objc_msgSend(v16, "setOriginalL2Score:");
  [(PRSL2FeatureVector *)self experimentalScore];
  objc_msgSend(v16, "setExperimentalScore:");
  [(PRSL2FeatureVector *)self withinBundleScore];
  objc_msgSend(v16, "setWithinBundleScore:");
  double v17 = [(PRSL2FeatureVector *)self bundleID];
  [v16 setBundleID:v17];

  int v18 = [(PRSL2FeatureVector *)self device_type];
  objc_msgSend(v16, "setDevice_type:", v18);

  uint64_t v19 = [(PRSL2FeatureVector *)self searchThroughCEPData];
  float v20 = (void *)[v19 copy];
  [v16 setSearchThroughCEPData:v20];

  uint64_t v21 = [(PRSL2FeatureVector *)self indexScore];
  objc_msgSend(v16, "setIndexScore:", v21, v22);
  objc_msgSend(v16, "setDisplayNameFuzzySpecialInsertion:", -[PRSL2FeatureVector displayNameFuzzySpecialInsertion](self, "displayNameFuzzySpecialInsertion"));
  objc_msgSend(v16, "setIsSiriAction:", -[PRSL2FeatureVector isSiriAction](self, "isSiriAction"));
  objc_msgSend(v16, "setIsAppInDock:", -[PRSL2FeatureVector isAppInDock](self, "isAppInDock"));
  id v23 = [(PRSL2FeatureVector *)self roundTripFeatures];
  if (v23)
  {
    id v24 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    uint64_t v25 = [(PRSL2FeatureVector *)self roundTripFeatures];
    id v26 = (void *)[v24 initWithDictionary:v25 copyItems:1];
    [v16 setRoundTripFeatures:v26];
  }
  else
  {
    [v16 setRoundTripFeatures:0];
  }

  os_unfair_lock_unlock(p_featureDataLock);
  return v16;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<PRSL2FeatureVector:%p d:%p s:%d f:0x%x fv:0x%x>", self, self->_featureData, self->_featureDataSize, self->_flags, self->_values);
}

- (float)originalL2Score
{
  return self->_originalL2Score;
}

- (void)setOriginalL2Score:(float)a3
{
  self->_originalL2Score = a3;
}

- (float)experimentalScore
{
  return self->_experimentalScore;
}

- (void)setExperimentalScore:(float)a3
{
  self->_experimentalScore = a3;
}

- (float)withinBundleScore
{
  return self->_withinBundleScore;
}

- (void)setWithinBundleScore:(float)a3
{
  self->_withinBundleScore = a3;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)device_type
{
  return self->_device_type;
}

- (void)setDevice_type:(id)a3
{
}

- (NSDictionary)searchThroughCEPData
{
  return self->_searchThroughCEPData;
}

- (void)setSearchThroughCEPData:(id)a3
{
}

- (uint64_t)indexScore
{
  return *(void *)(a1 + 480);
}

- (void)setIndexScore:(PRSL2FeatureVector *)self
{
  *(void *)self->_indexScore = v2;
  *(void *)&self->_indexScore[8] = v3;
}

- (NSDictionary)roundTripFeatures
{
  return self->_roundTripFeatures;
}

- (void)setRoundTripFeatures:(id)a3
{
}

- (PRSRankingItem)rankingItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rankingItem);
  return (PRSRankingItem *)WeakRetained;
}

- (void)setRankingItem:(id)a3
{
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (int64_t)textChunkTokenLength
{
  return self->_textChunkTokenLength;
}

- (void)setTextChunkTokenLength:(int64_t)a3
{
  self->_textChunkTokenLength = a3;
}

- (NSMutableDictionary)topicalityAnonFeatDict
{
  return self->_topicalityAnonFeatDict;
}

- (void)setTopicalityAnonFeatDict:(id)a3
{
}

- (float)kMDMailRead
{
  return self->_kMDMailRead;
}

- (void)setKMDMailRead:(float)a3
{
  self->_kMDMailRead = a3;
}

- (float)kMDMailRepliedTo
{
  return self->_kMDMailRepliedTo;
}

- (void)setKMDMailRepliedTo:(float)a3
{
  self->_kMDMailRepliedTo = a3;
}

- (float)kMDMailFlagged
{
  return self->_kMDMailFlagged;
}

- (void)setKMDMailFlagged:(float)a3
{
  self->_kMDMailFlagged = a3;
}

- (int64_t)kMDItemMailCategories
{
  return self->_kMDItemMailCategories;
}

- (void)setKMDItemMailCategories:(int64_t)a3
{
  self->_kMDItemMailCategories = a3;
}

- (int64_t)kMDItemCustomPageVisitCountScore
{
  return self->_kMDItemCustomPageVisitCountScore;
}

- (void)setKMDItemCustomPageVisitCountScore:(int64_t)a3
{
  self->_kMDItemCustomPageVisitCountScore = a3;
}

- (int64_t)kMDItemUseCount
{
  return self->_kMDItemUseCount;
}

- (void)setKMDItemUseCount:(int64_t)a3
{
  self->_kMDItemUseCount = a3;
}

- (int64_t)kMDItemPlayCount
{
  return self->_kMDItemPlayCount;
}

- (void)setKMDItemPlayCount:(int64_t)a3
{
  self->_kMDItemPlayCount = a3;
}

- (NSDate)kMDMailReceivedDate
{
  return self->_kMDMailReceivedDate;
}

- (void)setKMDMailReceivedDate:(id)a3
{
}

- (NSDate)kMDMailLastViewedDate
{
  return self->_kMDMailLastViewedDate;
}

- (void)setKMDMailLastViewedDate:(id)a3
{
}

- (NSDate)kMDMailFreshnessDate
{
  return self->_kMDMailFreshnessDate;
}

- (void)setKMDMailFreshnessDate:(id)a3
{
}

- (NSDate)kMDItemContentCreationDate
{
  return self->_kMDItemContentCreationDate;
}

- (void)setKMDItemContentCreationDate:(id)a3
{
}

- (NSDate)kMDItemLastUsedDate
{
  return self->_kMDItemLastUsedDate;
}

- (void)setKMDItemLastUsedDate:(id)a3
{
}

- (NSDate)kMDItemApplicationLastLaunchedDate
{
  return self->_kMDItemApplicationLastLaunchedDate;
}

- (void)setKMDItemApplicationLastLaunchedDate:(id)a3
{
}

- (NSDate)kMDItemContentModificationDate
{
  return self->_kMDItemContentModificationDate;
}

- (void)setKMDItemContentModificationDate:(id)a3
{
}

- (NSDate)kMDItemDueDate
{
  return self->_kMDItemDueDate;
}

- (void)setKMDItemDueDate:(id)a3
{
}

- (NSDate)kMDItemCompletionDate
{
  return self->_kMDItemCompletionDate;
}

- (void)setKMDItemCompletionDate:(id)a3
{
}

- (NSDate)kMDItemExpirationDate
{
  return self->_kMDItemExpirationDate;
}

- (void)setKMDItemExpirationDate:(id)a3
{
}

- (NSDate)kMDItemStartDate
{
  return self->_kMDItemStartDate;
}

- (void)setKMDItemStartDate:(id)a3
{
}

- (NSDate)kMDItemEndDate
{
  return self->_kMDItemEndDate;
}

- (void)setKMDItemEndDate:(id)a3
{
}

- (NSString)kMDItemContentType
{
  return self->_kMDItemContentType;
}

- (void)setKMDItemContentType:(id)a3
{
}

- (NSArray)kMDItemUsedDates
{
  return self->_kMDItemUsedDates;
}

- (void)setKMDItemUsedDates:(id)a3
{
}

- (NSArray)kMDItemRecentSpotlightEngagementDatesNonUnique
{
  return self->_kMDItemRecentSpotlightEngagementDatesNonUnique;
}

- (void)setKMDItemRecentSpotlightEngagementDatesNonUnique:(id)a3
{
}

- (NSArray)kMDItemRecentOutOfSpotlightEngagementDates
{
  return self->_kMDItemRecentOutOfSpotlightEngagementDates;
}

- (void)setKMDItemRecentOutOfSpotlightEngagementDates:(id)a3
{
}

- (NSArray)kMDItemRecentAppSearchEngagementDates
{
  return self->_kMDItemRecentAppSearchEngagementDates;
}

- (void)setKMDItemRecentAppSearchEngagementDates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kMDItemRecentAppSearchEngagementDates, 0);
  objc_storeStrong((id *)&self->_kMDItemRecentOutOfSpotlightEngagementDates, 0);
  objc_storeStrong((id *)&self->_kMDItemRecentSpotlightEngagementDatesNonUnique, 0);
  objc_storeStrong((id *)&self->_kMDItemUsedDates, 0);
  objc_storeStrong((id *)&self->_kMDItemContentType, 0);
  objc_storeStrong((id *)&self->_kMDItemEndDate, 0);
  objc_storeStrong((id *)&self->_kMDItemStartDate, 0);
  objc_storeStrong((id *)&self->_kMDItemExpirationDate, 0);
  objc_storeStrong((id *)&self->_kMDItemCompletionDate, 0);
  objc_storeStrong((id *)&self->_kMDItemDueDate, 0);
  objc_storeStrong((id *)&self->_kMDItemContentModificationDate, 0);
  objc_storeStrong((id *)&self->_kMDItemApplicationLastLaunchedDate, 0);
  objc_storeStrong((id *)&self->_kMDItemLastUsedDate, 0);
  objc_storeStrong((id *)&self->_kMDItemContentCreationDate, 0);
  objc_storeStrong((id *)&self->_kMDMailFreshnessDate, 0);
  objc_storeStrong((id *)&self->_kMDMailLastViewedDate, 0);
  objc_storeStrong((id *)&self->_kMDMailReceivedDate, 0);
  objc_storeStrong((id *)&self->_topicalityAnonFeatDict, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_destroyWeak((id *)&self->_rankingItem);
  objc_storeStrong((id *)&self->_roundTripFeatures, 0);
  objc_storeStrong((id *)&self->_searchThroughCEPData, 0);
  objc_storeStrong((id *)&self->_device_type, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end