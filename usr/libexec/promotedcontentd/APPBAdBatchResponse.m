@interface APPBAdBatchResponse
+ (Class)adType;
+ (Class)adUpdatesType;
+ (Class)adsToEvictType;
+ (Class)tagTransformationsType;
+ (Class)uRLsToEvictType;
- (APPBAdSpecification)specification;
- (BOOL)clearCache;
- (BOOL)hasBatchId;
- (BOOL)hasClearCache;
- (BOOL)hasConfigVersion;
- (BOOL)hasError;
- (BOOL)hasErrorDetails;
- (BOOL)hasLocationGridSpacing;
- (BOOL)hasMinimumIntervalBeforeNextRequest;
- (BOOL)hasPrefetchInterval;
- (BOOL)hasPrefetchThreshold;
- (BOOL)hasSpecification;
- (BOOL)hasSupplyMetrics;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)supplyMetrics;
- (NSMutableArray)adUpdates;
- (NSMutableArray)ads;
- (NSMutableArray)adsToEvicts;
- (NSMutableArray)tagTransformations;
- (NSMutableArray)uRLsToEvicts;
- (NSString)batchId;
- (NSString)configVersion;
- (double)minimumIntervalBeforeNextRequest;
- (double)prefetchInterval;
- (float)locationGridSpacing;
- (id)adAtIndex:(unint64_t)a3;
- (id)adUpdatesAtIndex:(unint64_t)a3;
- (id)adsToEvictAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)errorAsString:(int)a3;
- (id)tagTransformationsAtIndex:(unint64_t)a3;
- (id)uRLsToEvictAtIndex:(unint64_t)a3;
- (int)StringAsError:(id)a3;
- (int)error;
- (int)prefetchThreshold;
- (unint64_t)adUpdatesCount;
- (unint64_t)adsCount;
- (unint64_t)adsToEvictsCount;
- (unint64_t)hash;
- (unint64_t)tagTransformationsCount;
- (unint64_t)uRLsToEvictsCount;
- (unsigned)errorDetails;
- (void)addAd:(id)a3;
- (void)addAdUpdates:(id)a3;
- (void)addAdsToEvict:(id)a3;
- (void)addTagTransformations:(id)a3;
- (void)addURLsToEvict:(id)a3;
- (void)clearAdUpdates;
- (void)clearAds;
- (void)clearAdsToEvicts;
- (void)clearTagTransformations;
- (void)clearURLsToEvicts;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAdUpdates:(id)a3;
- (void)setAds:(id)a3;
- (void)setAdsToEvicts:(id)a3;
- (void)setBatchId:(id)a3;
- (void)setClearCache:(BOOL)a3;
- (void)setConfigVersion:(id)a3;
- (void)setError:(int)a3;
- (void)setErrorDetails:(unsigned int)a3;
- (void)setHasClearCache:(BOOL)a3;
- (void)setHasError:(BOOL)a3;
- (void)setHasErrorDetails:(BOOL)a3;
- (void)setHasLocationGridSpacing:(BOOL)a3;
- (void)setHasMinimumIntervalBeforeNextRequest:(BOOL)a3;
- (void)setHasPrefetchInterval:(BOOL)a3;
- (void)setHasPrefetchThreshold:(BOOL)a3;
- (void)setHasSupplyMetrics:(BOOL)a3;
- (void)setLocationGridSpacing:(float)a3;
- (void)setMinimumIntervalBeforeNextRequest:(double)a3;
- (void)setPrefetchInterval:(double)a3;
- (void)setPrefetchThreshold:(int)a3;
- (void)setSpecification:(id)a3;
- (void)setSupplyMetrics:(BOOL)a3;
- (void)setTagTransformations:(id)a3;
- (void)setURLsToEvicts:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation APPBAdBatchResponse

- (int)error
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_error;
  }
  else {
    return 1;
  }
}

- (void)setError:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_error = a3;
}

- (void)setHasError:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasError
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)errorAsString:(int)a3
{
  if (a3 == 1)
  {
    v4 = @"NO_QUALIFIED";
  }
  else if (a3 == 2)
  {
    v4 = @"CONFIGURATION_ERROR";
  }
  else
  {
    v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  return v4;
}

- (int)StringAsError:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"NO_QUALIFIED"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"CONFIGURATION_ERROR"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (BOOL)hasBatchId
{
  return self->_batchId != 0;
}

- (void)clearAds
{
}

- (void)addAd:(id)a3
{
  id v4 = a3;
  ads = self->_ads;
  id v8 = v4;
  if (!ads)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_ads;
    self->_ads = v6;

    id v4 = v8;
    ads = self->_ads;
  }
  [(NSMutableArray *)ads addObject:v4];
}

- (unint64_t)adsCount
{
  return (unint64_t)[(NSMutableArray *)self->_ads count];
}

- (id)adAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_ads objectAtIndex:a3];
}

+ (Class)adType
{
  return (Class)objc_opt_class();
}

- (void)setSupplyMetrics:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_supplyMetrics = a3;
}

- (void)setHasSupplyMetrics:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasSupplyMetrics
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setLocationGridSpacing:(float)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_locationGridSpacing = a3;
}

- (void)setHasLocationGridSpacing:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasLocationGridSpacing
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setErrorDetails:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_errorDetails = a3;
}

- (void)setHasErrorDetails:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasErrorDetails
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setMinimumIntervalBeforeNextRequest:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_minimumIntervalBeforeNextRequest = a3;
}

- (void)setHasMinimumIntervalBeforeNextRequest:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMinimumIntervalBeforeNextRequest
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearAdsToEvicts
{
}

- (void)addAdsToEvict:(id)a3
{
  id v4 = a3;
  adsToEvicts = self->_adsToEvicts;
  id v8 = v4;
  if (!adsToEvicts)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_adsToEvicts;
    self->_adsToEvicts = v6;

    id v4 = v8;
    adsToEvicts = self->_adsToEvicts;
  }
  [(NSMutableArray *)adsToEvicts addObject:v4];
}

- (unint64_t)adsToEvictsCount
{
  return (unint64_t)[(NSMutableArray *)self->_adsToEvicts count];
}

- (id)adsToEvictAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_adsToEvicts objectAtIndex:a3];
}

+ (Class)adsToEvictType
{
  return (Class)objc_opt_class();
}

- (void)clearURLsToEvicts
{
}

- (void)addURLsToEvict:(id)a3
{
  id v4 = a3;
  uRLsToEvicts = self->_uRLsToEvicts;
  id v8 = v4;
  if (!uRLsToEvicts)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_uRLsToEvicts;
    self->_uRLsToEvicts = v6;

    id v4 = v8;
    uRLsToEvicts = self->_uRLsToEvicts;
  }
  [(NSMutableArray *)uRLsToEvicts addObject:v4];
}

- (unint64_t)uRLsToEvictsCount
{
  return (unint64_t)[(NSMutableArray *)self->_uRLsToEvicts count];
}

- (id)uRLsToEvictAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_uRLsToEvicts objectAtIndex:a3];
}

+ (Class)uRLsToEvictType
{
  return (Class)objc_opt_class();
}

- (void)clearAdUpdates
{
}

- (void)addAdUpdates:(id)a3
{
  id v4 = a3;
  adUpdates = self->_adUpdates;
  id v8 = v4;
  if (!adUpdates)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_adUpdates;
    self->_adUpdates = v6;

    id v4 = v8;
    adUpdates = self->_adUpdates;
  }
  [(NSMutableArray *)adUpdates addObject:v4];
}

- (unint64_t)adUpdatesCount
{
  return (unint64_t)[(NSMutableArray *)self->_adUpdates count];
}

- (id)adUpdatesAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_adUpdates objectAtIndex:a3];
}

+ (Class)adUpdatesType
{
  return (Class)objc_opt_class();
}

- (void)clearTagTransformations
{
}

- (void)addTagTransformations:(id)a3
{
  id v4 = a3;
  tagTransformations = self->_tagTransformations;
  id v8 = v4;
  if (!tagTransformations)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_tagTransformations;
    self->_tagTransformations = v6;

    id v4 = v8;
    tagTransformations = self->_tagTransformations;
  }
  [(NSMutableArray *)tagTransformations addObject:v4];
}

- (unint64_t)tagTransformationsCount
{
  return (unint64_t)[(NSMutableArray *)self->_tagTransformations count];
}

- (id)tagTransformationsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_tagTransformations objectAtIndex:a3];
}

+ (Class)tagTransformationsType
{
  return (Class)objc_opt_class();
}

- (void)setPrefetchInterval:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_prefetchInterval = a3;
}

- (void)setHasPrefetchInterval:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPrefetchInterval
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setPrefetchThreshold:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_prefetchThreshold = a3;
}

- (void)setHasPrefetchThreshold:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasPrefetchThreshold
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (BOOL)hasConfigVersion
{
  return self->_configVersion != 0;
}

- (BOOL)hasSpecification
{
  return self->_specification != 0;
}

- (void)setClearCache:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_clearCache = a3;
}

- (void)setHasClearCache:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasClearCache
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APPBAdBatchResponse;
  char v3 = [(APPBAdBatchResponse *)&v7 description];
  id v4 = [(APPBAdBatchResponse *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    int error = self->_error;
    if (error == 1)
    {
      v5 = @"NO_QUALIFIED";
    }
    else if (error == 2)
    {
      v5 = @"CONFIGURATION_ERROR";
    }
    else
    {
      v5 = +[NSString stringWithFormat:@"(unknown: %i)", self->_error];
    }
    [v3 setObject:v5 forKey:@"error"];
  }
  batchId = self->_batchId;
  if (batchId) {
    [v3 setObject:batchId forKey:@"batchId"];
  }
  if ([(NSMutableArray *)self->_ads count])
  {
    id v8 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_ads, "count")];
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    v9 = self->_ads;
    id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v52 objects:v58 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v53;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v53 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [*(id *)(*((void *)&v52 + 1) + 8 * i) dictionaryRepresentation];
          [v8 addObject:v14];
        }
        id v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v52 objects:v58 count:16];
      }
      while (v11);
    }

    [v3 setObject:v8 forKey:@"ad"];
  }
  $2B0CFA9689D2F4B68112900ADD264E21 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  v43 = +[NSNumber numberWithBool:self->_supplyMetrics];
  [v3 setObject:v43 forKey:@"supplyMetrics"];

  *(unsigned char *)&$2B0CFA9689D2F4B68112900ADD264E21 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
LABEL_21:
    *(float *)&double v7 = self->_locationGridSpacing;
    v16 = +[NSNumber numberWithFloat:v7];
    [v3 setObject:v16 forKey:@"locationGridSpacing"];

    *(unsigned char *)&$2B0CFA9689D2F4B68112900ADD264E21 has = self->_has;
  }
LABEL_22:
  if ((*(unsigned char *)&has & 8) == 0)
  {
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  v42 = +[NSNumber numberWithUnsignedInt:self->_errorDetails];
  [v3 setObject:v42 forKey:@"errorDetails"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_24:
    v17 = +[NSNumber numberWithDouble:self->_minimumIntervalBeforeNextRequest];
    [v3 setObject:v17 forKey:@"minimumIntervalBeforeNextRequest"];
  }
LABEL_25:
  adsToEvicts = self->_adsToEvicts;
  if (adsToEvicts) {
    [v3 setObject:adsToEvicts forKey:@"adsToEvict"];
  }
  uRLsToEvicts = self->_uRLsToEvicts;
  if (uRLsToEvicts) {
    [v3 setObject:uRLsToEvicts forKey:@"URLsToEvict"];
  }
  if ([(NSMutableArray *)self->_adUpdates count])
  {
    id v20 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_adUpdates, "count")];
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    v21 = self->_adUpdates;
    id v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v48 objects:v57 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v49;
      do
      {
        for (j = 0; j != v23; j = (char *)j + 1)
        {
          if (*(void *)v49 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = [*(id *)(*((void *)&v48 + 1) + 8 * (void)j) dictionaryRepresentation];
          [v20 addObject:v26];
        }
        id v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v48 objects:v57 count:16];
      }
      while (v23);
    }

    [v3 setObject:v20 forKey:@"adUpdates"];
  }
  if ([(NSMutableArray *)self->_tagTransformations count])
  {
    id v27 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_tagTransformations, "count")];
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    v28 = self->_tagTransformations;
    id v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v44 objects:v56 count:16];
    if (v29)
    {
      id v30 = v29;
      uint64_t v31 = *(void *)v45;
      do
      {
        for (k = 0; k != v30; k = (char *)k + 1)
        {
          if (*(void *)v45 != v31) {
            objc_enumerationMutation(v28);
          }
          v33 = [*(id *)(*((void *)&v44 + 1) + 8 * (void)k) dictionaryRepresentation];
          [v27 addObject:v33];
        }
        id v30 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v44 objects:v56 count:16];
      }
      while (v30);
    }

    [v3 setObject:v27 forKey:@"tagTransformations"];
  }
  char v34 = (char)self->_has;
  if ((v34 & 2) != 0)
  {
    v35 = +[NSNumber numberWithDouble:self->_prefetchInterval];
    [v3 setObject:v35 forKey:@"prefetchInterval"];

    char v34 = (char)self->_has;
  }
  if ((v34 & 0x20) != 0)
  {
    v36 = +[NSNumber numberWithInt:self->_prefetchThreshold];
    [v3 setObject:v36 forKey:@"prefetchThreshold"];
  }
  configVersion = self->_configVersion;
  if (configVersion) {
    [v3 setObject:configVersion forKey:@"configVersion"];
  }
  specification = self->_specification;
  if (specification)
  {
    v39 = [(APPBAdSpecification *)specification dictionaryRepresentation];
    [v3 setObject:v39 forKey:@"specification"];
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    v40 = +[NSNumber numberWithBool:self->_clearCache];
    [v3 setObject:v40 forKey:@"clearCache"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return APPBAdBatchResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_batchId) {
    PBDataWriterWriteStringField();
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v5 = self->_ads;
  v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v48 objects:v56 count:16];
  if (v6)
  {
    double v7 = v6;
    uint64_t v8 = *(void *)v49;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(void *)v49 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      double v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v48 objects:v56 count:16];
    }
    while (v7);
  }

  $2B0CFA9689D2F4B68112900ADD264E21 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  PBDataWriterWriteBOOLField();
  *(unsigned char *)&$2B0CFA9689D2F4B68112900ADD264E21 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
LABEL_14:
    PBDataWriterWriteFloatField();
    *(unsigned char *)&$2B0CFA9689D2F4B68112900ADD264E21 has = self->_has;
  }
LABEL_15:
  if ((*(unsigned char *)&has & 8) == 0)
  {
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  PBDataWriterWriteFixed32Field();
  if (*(unsigned char *)&self->_has) {
LABEL_17:
  }
    PBDataWriterWriteDoubleField();
LABEL_18:
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v11 = self->_adsToEvicts;
  uint64_t v12 = (char *)[(NSMutableArray *)v11 countByEnumeratingWithState:&v44 objects:v55 count:16];
  if (v12)
  {
    v13 = v12;
    uint64_t v14 = *(void *)v45;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(void *)v45 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteStringField();
      }
      v13 = (char *)[(NSMutableArray *)v11 countByEnumeratingWithState:&v44 objects:v55 count:16];
    }
    while (v13);
  }

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  v16 = self->_uRLsToEvicts;
  v17 = (char *)[(NSMutableArray *)v16 countByEnumeratingWithState:&v40 objects:v54 count:16];
  if (v17)
  {
    v18 = v17;
    uint64_t v19 = *(void *)v41;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(void *)v41 != v19) {
          objc_enumerationMutation(v16);
        }
        PBDataWriterWriteStringField();
      }
      v18 = (char *)[(NSMutableArray *)v16 countByEnumeratingWithState:&v40 objects:v54 count:16];
    }
    while (v18);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v21 = self->_adUpdates;
  id v22 = (char *)[(NSMutableArray *)v21 countByEnumeratingWithState:&v36 objects:v53 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v37;
    do
    {
      for (m = 0; m != v23; ++m)
      {
        if (*(void *)v37 != v24) {
          objc_enumerationMutation(v21);
        }
        PBDataWriterWriteSubmessage();
      }
      id v23 = (char *)[(NSMutableArray *)v21 countByEnumeratingWithState:&v36 objects:v53 count:16];
    }
    while (v23);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v26 = self->_tagTransformations;
  id v27 = (char *)[(NSMutableArray *)v26 countByEnumeratingWithState:&v32 objects:v52 count:16];
  if (v27)
  {
    v28 = v27;
    uint64_t v29 = *(void *)v33;
    do
    {
      for (n = 0; n != v28; ++n)
      {
        if (*(void *)v33 != v29) {
          objc_enumerationMutation(v26);
        }
        PBDataWriterWriteSubmessage();
      }
      v28 = (char *)[(NSMutableArray *)v26 countByEnumeratingWithState:&v32 objects:v52 count:16];
    }
    while (v28);
  }

  char v31 = (char)self->_has;
  if ((v31 & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    char v31 = (char)self->_has;
  }
  if ((v31 & 0x20) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_configVersion) {
    PBDataWriterWriteStringField();
  }
  if (self->_specification) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v4[16] = self->_error;
    *((unsigned char *)v4 + 108) |= 4u;
  }
  id v29 = v4;
  if (self->_batchId) {
    [v4 setBatchId:];
  }
  if ([(APPBAdBatchResponse *)self adsCount])
  {
    [v29 clearAds];
    unint64_t v5 = [(APPBAdBatchResponse *)self adsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(APPBAdBatchResponse *)self adAtIndex:i];
        [v29 addAd:v8];
      }
    }
  }
  $2B0CFA9689D2F4B68112900ADD264E21 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
    id v10 = v29;
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  id v10 = v29;
  *((unsigned char *)v29 + 105) = self->_supplyMetrics;
  *((unsigned char *)v29 + 108) |= 0x80u;
  *(unsigned char *)&$2B0CFA9689D2F4B68112900ADD264E21 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
LABEL_11:
    v10[18] = LODWORD(self->_locationGridSpacing);
    *((unsigned char *)v10 + 108) |= 0x10u;
    *(unsigned char *)&$2B0CFA9689D2F4B68112900ADD264E21 has = self->_has;
  }
LABEL_12:
  if ((*(unsigned char *)&has & 8) != 0)
  {
    v10[17] = self->_errorDetails;
    *((unsigned char *)v10 + 108) |= 8u;
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  if (*(unsigned char *)&has)
  {
LABEL_14:
    *((void *)v10 + 1) = *(void *)&self->_minimumIntervalBeforeNextRequest;
    *((unsigned char *)v10 + 108) |= 1u;
  }
LABEL_15:
  if ([(APPBAdBatchResponse *)self adsToEvictsCount])
  {
    [v29 clearAdsToEvicts];
    unint64_t v11 = [(APPBAdBatchResponse *)self adsToEvictsCount];
    if (v11)
    {
      unint64_t v12 = v11;
      for (uint64_t j = 0; j != v12; ++j)
      {
        uint64_t v14 = [(APPBAdBatchResponse *)self adsToEvictAtIndex:j];
        [v29 addAdsToEvict:v14];
      }
    }
  }
  if ([(APPBAdBatchResponse *)self uRLsToEvictsCount])
  {
    [v29 clearURLsToEvicts];
    unint64_t v15 = [(APPBAdBatchResponse *)self uRLsToEvictsCount];
    if (v15)
    {
      unint64_t v16 = v15;
      for (uint64_t k = 0; k != v16; ++k)
      {
        v18 = [(APPBAdBatchResponse *)self uRLsToEvictAtIndex:k];
        [v29 addURLsToEvict:v18];
      }
    }
  }
  if ([(APPBAdBatchResponse *)self adUpdatesCount])
  {
    [v29 clearAdUpdates];
    unint64_t v19 = [(APPBAdBatchResponse *)self adUpdatesCount];
    if (v19)
    {
      unint64_t v20 = v19;
      for (uint64_t m = 0; m != v20; ++m)
      {
        id v22 = [(APPBAdBatchResponse *)self adUpdatesAtIndex:m];
        [v29 addAdUpdates:v22];
      }
    }
  }
  if ([(APPBAdBatchResponse *)self tagTransformationsCount])
  {
    [v29 clearTagTransformations];
    unint64_t v23 = [(APPBAdBatchResponse *)self tagTransformationsCount];
    if (v23)
    {
      unint64_t v24 = v23;
      for (uint64_t n = 0; n != v24; ++n)
      {
        v26 = [(APPBAdBatchResponse *)self tagTransformationsAtIndex:n];
        [v29 addTagTransformations:v26];
      }
    }
  }
  char v27 = (char)self->_has;
  v28 = v29;
  if ((v27 & 2) != 0)
  {
    *((void *)v29 + 2) = *(void *)&self->_prefetchInterval;
    *((unsigned char *)v29 + 108) |= 2u;
    char v27 = (char)self->_has;
  }
  if ((v27 & 0x20) != 0)
  {
    *((_DWORD *)v29 + 19) = self->_prefetchThreshold;
    *((unsigned char *)v29 + 108) |= 0x20u;
  }
  if (self->_configVersion)
  {
    [v29 setConfigVersion:];
    v28 = v29;
  }
  if (self->_specification)
  {
    [v29 setSpecification:];
    v28 = v29;
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    v28[104] = self->_clearCache;
    v28[108] |= 0x40u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  unint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v5[16] = self->_error;
    *((unsigned char *)v5 + 108) |= 4u;
  }
  id v7 = [(NSString *)self->_batchId copyWithZone:a3];
  uint64_t v8 = (void *)v6[6];
  v6[6] = v7;

  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  v9 = self->_ads;
  id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v62 objects:v70 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v63;
    do
    {
      for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v63 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = [*(id *)(*((void *)&v62 + 1) + 8 * i) copyWithZone:a3];
        [v6 addAd:v14];
      }
      id v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v62 objects:v70 count:16];
    }
    while (v11);
  }

  $2B0CFA9689D2F4B68112900ADD264E21 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  *((unsigned char *)v6 + 105) = self->_supplyMetrics;
  *((unsigned char *)v6 + 108) |= 0x80u;
  *(unsigned char *)&$2B0CFA9689D2F4B68112900ADD264E21 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
LABEL_12:
    *((_DWORD *)v6 + 18) = LODWORD(self->_locationGridSpacing);
    *((unsigned char *)v6 + 108) |= 0x10u;
    *(unsigned char *)&$2B0CFA9689D2F4B68112900ADD264E21 has = self->_has;
  }
LABEL_13:
  if ((*(unsigned char *)&has & 8) == 0)
  {
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  *((_DWORD *)v6 + 17) = self->_errorDetails;
  *((unsigned char *)v6 + 108) |= 8u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_15:
    v6[1] = *(void *)&self->_minimumIntervalBeforeNextRequest;
    *((unsigned char *)v6 + 108) |= 1u;
  }
LABEL_16:
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  unint64_t v16 = self->_adsToEvicts;
  id v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v58 objects:v69 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v59;
    do
    {
      for (uint64_t j = 0; j != v18; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v59 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = [*(id *)(*((void *)&v58 + 1) + 8 * (void)j) copyWithZone:a3];
        [v6 addAdsToEvict:v21];
      }
      id v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v58 objects:v69 count:16];
    }
    while (v18);
  }

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v22 = self->_uRLsToEvicts;
  id v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v54 objects:v68 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v55;
    do
    {
      for (uint64_t k = 0; k != v24; uint64_t k = (char *)k + 1)
      {
        if (*(void *)v55 != v25) {
          objc_enumerationMutation(v22);
        }
        id v27 = [*(id *)(*((void *)&v54 + 1) + 8 * (void)k) copyWithZone:a3];
        [v6 addURLsToEvict:v27];
      }
      id v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v54 objects:v68 count:16];
    }
    while (v24);
  }

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  v28 = self->_adUpdates;
  id v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v50 objects:v67 count:16];
  if (v29)
  {
    id v30 = v29;
    uint64_t v31 = *(void *)v51;
    do
    {
      for (uint64_t m = 0; m != v30; uint64_t m = (char *)m + 1)
      {
        if (*(void *)v51 != v31) {
          objc_enumerationMutation(v28);
        }
        id v33 = [*(id *)(*((void *)&v50 + 1) + 8 * (void)m) copyWithZone:a3];
        [v6 addAdUpdates:v33];
      }
      id v30 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v50 objects:v67 count:16];
    }
    while (v30);
  }

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v34 = self->_tagTransformations;
  id v35 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v46 objects:v66 count:16];
  if (v35)
  {
    id v36 = v35;
    uint64_t v37 = *(void *)v47;
    do
    {
      for (uint64_t n = 0; n != v36; uint64_t n = (char *)n + 1)
      {
        if (*(void *)v47 != v37) {
          objc_enumerationMutation(v34);
        }
        id v39 = [*(id *)(*((void *)&v46 + 1) + 8 * (void)n) copyWithZone:a3];
        [v6 addTagTransformations:v39];
      }
      id v36 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v46 objects:v66 count:16];
    }
    while (v36);
  }

  char v40 = (char)self->_has;
  if ((v40 & 2) != 0)
  {
    v6[2] = *(void *)&self->_prefetchInterval;
    *((unsigned char *)v6 + 108) |= 2u;
    char v40 = (char)self->_has;
  }
  if ((v40 & 0x20) != 0)
  {
    *((_DWORD *)v6 + 19) = self->_prefetchThreshold;
    *((unsigned char *)v6 + 108) |= 0x20u;
  }
  id v41 = -[NSString copyWithZone:](self->_configVersion, "copyWithZone:", a3, (void)v46);
  long long v42 = (void *)v6[7];
  v6[7] = v41;

  id v43 = [(APPBAdSpecification *)self->_specification copyWithZone:a3];
  long long v44 = (void *)v6[10];
  v6[10] = v43;

  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    *((unsigned char *)v6 + 104) = self->_clearCache;
    *((unsigned char *)v6 + 108) |= 0x40u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_59;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 108) & 4) == 0 || self->_error != *((_DWORD *)v4 + 16)) {
      goto LABEL_59;
    }
  }
  else if ((*((unsigned char *)v4 + 108) & 4) != 0)
  {
    goto LABEL_59;
  }
  batchId = self->_batchId;
  if ((unint64_t)batchId | *((void *)v4 + 6) && !-[NSString isEqual:](batchId, "isEqual:")) {
    goto LABEL_59;
  }
  ads = self->_ads;
  if ((unint64_t)ads | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](ads, "isEqual:")) {
      goto LABEL_59;
    }
  }
  $2B0CFA9689D2F4B68112900ADD264E21 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    if ((*((unsigned char *)v4 + 108) & 0x80) == 0) {
      goto LABEL_59;
    }
    if (self->_supplyMetrics)
    {
      if (!*((unsigned char *)v4 + 105)) {
        goto LABEL_59;
      }
    }
    else if (*((unsigned char *)v4 + 105))
    {
      goto LABEL_59;
    }
  }
  else if ((*((unsigned char *)v4 + 108) & 0x80) != 0)
  {
    goto LABEL_59;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 108) & 0x10) == 0 || self->_locationGridSpacing != *((float *)v4 + 18)) {
      goto LABEL_59;
    }
  }
  else if ((*((unsigned char *)v4 + 108) & 0x10) != 0)
  {
    goto LABEL_59;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 108) & 8) == 0 || self->_errorDetails != *((_DWORD *)v4 + 17)) {
      goto LABEL_59;
    }
  }
  else if ((*((unsigned char *)v4 + 108) & 8) != 0)
  {
    goto LABEL_59;
  }
  if (*(unsigned char *)&has)
  {
    if ((*((unsigned char *)v4 + 108) & 1) == 0 || self->_minimumIntervalBeforeNextRequest != *((double *)v4 + 1)) {
      goto LABEL_59;
    }
  }
  else if (*((unsigned char *)v4 + 108))
  {
    goto LABEL_59;
  }
  adsToEvicts = self->_adsToEvicts;
  if ((unint64_t)adsToEvicts | *((void *)v4 + 5)
    && !-[NSMutableArray isEqual:](adsToEvicts, "isEqual:"))
  {
    goto LABEL_59;
  }
  uRLsToEvicts = self->_uRLsToEvicts;
  if ((unint64_t)uRLsToEvicts | *((void *)v4 + 12))
  {
    if (!-[NSMutableArray isEqual:](uRLsToEvicts, "isEqual:")) {
      goto LABEL_59;
    }
  }
  adUpdates = self->_adUpdates;
  if ((unint64_t)adUpdates | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](adUpdates, "isEqual:")) {
      goto LABEL_59;
    }
  }
  tagTransformations = self->_tagTransformations;
  if ((unint64_t)tagTransformations | *((void *)v4 + 11))
  {
    if (!-[NSMutableArray isEqual:](tagTransformations, "isEqual:")) {
      goto LABEL_59;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 108) & 2) == 0 || self->_prefetchInterval != *((double *)v4 + 2)) {
      goto LABEL_59;
    }
  }
  else if ((*((unsigned char *)v4 + 108) & 2) != 0)
  {
    goto LABEL_59;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 108) & 0x20) == 0 || self->_prefetchThreshold != *((_DWORD *)v4 + 19)) {
      goto LABEL_59;
    }
  }
  else if ((*((unsigned char *)v4 + 108) & 0x20) != 0)
  {
    goto LABEL_59;
  }
  configVersiouint64_t n = self->_configVersion;
  if ((unint64_t)configVersion | *((void *)v4 + 7)
    && !-[NSString isEqual:](configVersion, "isEqual:"))
  {
    goto LABEL_59;
  }
  specificatiouint64_t n = self->_specification;
  if ((unint64_t)specification | *((void *)v4 + 10))
  {
    if (!-[APPBAdSpecification isEqual:](specification, "isEqual:")) {
      goto LABEL_59;
    }
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 108) & 0x40) != 0)
    {
      if (self->_clearCache)
      {
        if (!*((unsigned char *)v4 + 104)) {
          goto LABEL_59;
        }
      }
      else if (*((unsigned char *)v4 + 104))
      {
        goto LABEL_59;
      }
      BOOL v14 = 1;
      goto LABEL_60;
    }
LABEL_59:
    BOOL v14 = 0;
    goto LABEL_60;
  }
  BOOL v14 = (*((unsigned char *)v4 + 108) & 0x40) == 0;
LABEL_60:

  return v14;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v34 = 2654435761 * self->_error;
  }
  else {
    uint64_t v34 = 0;
  }
  NSUInteger v33 = [(NSString *)self->_batchId hash];
  unint64_t v32 = (unint64_t)[(NSMutableArray *)self->_ads hash];
  char has = (char)self->_has;
  if (has < 0)
  {
    uint64_t v31 = 2654435761 * self->_supplyMetrics;
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v31 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) == 0)
    {
LABEL_6:
      unint64_t v4 = 0;
      goto LABEL_14;
    }
  }
  float locationGridSpacing = self->_locationGridSpacing;
  float v6 = -locationGridSpacing;
  if (locationGridSpacing >= 0.0) {
    float v6 = self->_locationGridSpacing;
  }
  float v7 = floorf(v6 + 0.5);
  float v8 = (float)(v6 - v7) * 1.8447e19;
  unint64_t v4 = 2654435761u * (unint64_t)fmodf(v7, 1.8447e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0) {
      v4 += (unint64_t)v8;
    }
  }
  else
  {
    v4 -= (unint64_t)fabsf(v8);
  }
LABEL_14:
  if ((has & 8) != 0) {
    uint64_t v29 = 2654435761 * self->_errorDetails;
  }
  else {
    uint64_t v29 = 0;
  }
  unint64_t v30 = v4;
  if (has)
  {
    double minimumIntervalBeforeNextRequest = self->_minimumIntervalBeforeNextRequest;
    double v11 = -minimumIntervalBeforeNextRequest;
    if (minimumIntervalBeforeNextRequest >= 0.0) {
      double v11 = self->_minimumIntervalBeforeNextRequest;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  unint64_t v28 = (unint64_t)[(NSMutableArray *)self->_adsToEvicts hash];
  unint64_t v14 = (unint64_t)[(NSMutableArray *)self->_uRLsToEvicts hash];
  unint64_t v15 = (unint64_t)[(NSMutableArray *)self->_adUpdates hash];
  unint64_t v16 = (unint64_t)[(NSMutableArray *)self->_tagTransformations hash];
  char v17 = (char)self->_has;
  if ((v17 & 2) != 0)
  {
    double prefetchInterval = self->_prefetchInterval;
    double v20 = -prefetchInterval;
    if (prefetchInterval >= 0.0) {
      double v20 = self->_prefetchInterval;
    }
    long double v21 = floor(v20 + 0.5);
    double v22 = (v20 - v21) * 1.84467441e19;
    unint64_t v18 = 2654435761u * (unint64_t)fmod(v21, 1.84467441e19);
    if (v22 >= 0.0)
    {
      if (v22 > 0.0) {
        v18 += (unint64_t)v22;
      }
    }
    else
    {
      v18 -= (unint64_t)fabs(v22);
    }
  }
  else
  {
    unint64_t v18 = 0;
  }
  if ((v17 & 0x20) != 0) {
    uint64_t v23 = 2654435761 * self->_prefetchThreshold;
  }
  else {
    uint64_t v23 = 0;
  }
  NSUInteger v24 = [(NSString *)self->_configVersion hash];
  unint64_t v25 = [(APPBAdSpecification *)self->_specification hash];
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    uint64_t v26 = 2654435761 * self->_clearCache;
  }
  else {
    uint64_t v26 = 0;
  }
  return v33 ^ v34 ^ v32 ^ v31 ^ v30 ^ v29 ^ v9 ^ v28 ^ v14 ^ v15 ^ v16 ^ v18 ^ v23 ^ v24 ^ v25 ^ v26;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = (char *)a3;
  unint64_t v5 = v4;
  if ((v4[108] & 4) != 0)
  {
    self->_int error = *((_DWORD *)v4 + 16);
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 6)) {
    -[APPBAdBatchResponse setBatchId:](self, "setBatchId:");
  }
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v6 = *((id *)v5 + 4);
  id v7 = [v6 countByEnumeratingWithState:&v51 objects:v59 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v52 != v9) {
          objc_enumerationMutation(v6);
        }
        [(APPBAdBatchResponse *)self addAd:*(void *)(*((void *)&v51 + 1) + 8 * i)];
      }
      id v8 = [v6 countByEnumeratingWithState:&v51 objects:v59 count:16];
    }
    while (v8);
  }

  int v11 = v5[108];
  if ((v11 & 0x80000000) == 0)
  {
    if ((v11 & 0x10) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  self->_supplyMetrics = v5[105];
  *(unsigned char *)&self->_has |= 0x80u;
  LOBYTE(v11) = v5[108];
  if ((v11 & 0x10) != 0)
  {
LABEL_14:
    self->_float locationGridSpacing = *((float *)v5 + 18);
    *(unsigned char *)&self->_has |= 0x10u;
    LOBYTE(v11) = v5[108];
  }
LABEL_15:
  if ((v11 & 8) == 0)
  {
    if ((v11 & 1) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  self->_errorDetails = *((_DWORD *)v5 + 17);
  *(unsigned char *)&self->_has |= 8u;
  if (v5[108])
  {
LABEL_17:
    self->_double minimumIntervalBeforeNextRequest = *((double *)v5 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_18:
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v12 = *((id *)v5 + 5);
  id v13 = [v12 countByEnumeratingWithState:&v47 objects:v58 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v48;
    do
    {
      for (uint64_t j = 0; j != v14; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v48 != v15) {
          objc_enumerationMutation(v12);
        }
        [(APPBAdBatchResponse *)self addAdsToEvict:*(void *)(*((void *)&v47 + 1) + 8 * (void)j)];
      }
      id v14 = [v12 countByEnumeratingWithState:&v47 objects:v58 count:16];
    }
    while (v14);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v17 = *((id *)v5 + 12);
  id v18 = [v17 countByEnumeratingWithState:&v43 objects:v57 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v44;
    do
    {
      for (uint64_t k = 0; k != v19; uint64_t k = (char *)k + 1)
      {
        if (*(void *)v44 != v20) {
          objc_enumerationMutation(v17);
        }
        [(APPBAdBatchResponse *)self addURLsToEvict:*(void *)(*((void *)&v43 + 1) + 8 * (void)k)];
      }
      id v19 = [v17 countByEnumeratingWithState:&v43 objects:v57 count:16];
    }
    while (v19);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v22 = *((id *)v5 + 3);
  id v23 = [v22 countByEnumeratingWithState:&v39 objects:v56 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v40;
    do
    {
      for (uint64_t m = 0; m != v24; uint64_t m = (char *)m + 1)
      {
        if (*(void *)v40 != v25) {
          objc_enumerationMutation(v22);
        }
        [(APPBAdBatchResponse *)self addAdUpdates:*(void *)(*((void *)&v39 + 1) + 8 * (void)m)];
      }
      id v24 = [v22 countByEnumeratingWithState:&v39 objects:v56 count:16];
    }
    while (v24);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v27 = *((id *)v5 + 11);
  id v28 = [v27 countByEnumeratingWithState:&v35 objects:v55 count:16];
  if (v28)
  {
    id v29 = v28;
    uint64_t v30 = *(void *)v36;
    do
    {
      for (uint64_t n = 0; n != v29; uint64_t n = (char *)n + 1)
      {
        if (*(void *)v36 != v30) {
          objc_enumerationMutation(v27);
        }
        -[APPBAdBatchResponse addTagTransformations:](self, "addTagTransformations:", *(void *)(*((void *)&v35 + 1) + 8 * (void)n), (void)v35);
      }
      id v29 = [v27 countByEnumeratingWithState:&v35 objects:v55 count:16];
    }
    while (v29);
  }

  char v32 = v5[108];
  if ((v32 & 2) != 0)
  {
    self->_double prefetchInterval = *((double *)v5 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v32 = v5[108];
  }
  if ((v32 & 0x20) != 0)
  {
    self->_prefetchThreshold = *((_DWORD *)v5 + 19);
    *(unsigned char *)&self->_has |= 0x20u;
  }
  if (*((void *)v5 + 7)) {
    -[APPBAdBatchResponse setConfigVersion:](self, "setConfigVersion:");
  }
  specificatiouint64_t n = self->_specification;
  uint64_t v34 = *((void *)v5 + 10);
  if (specification)
  {
    if (v34) {
      -[APPBAdSpecification mergeFrom:](specification, "mergeFrom:");
    }
  }
  else if (v34)
  {
    -[APPBAdBatchResponse setSpecification:](self, "setSpecification:");
  }
  if ((v5[108] & 0x40) != 0)
  {
    self->_clearCache = v5[104];
    *(unsigned char *)&self->_has |= 0x40u;
  }
}

- (NSString)batchId
{
  return self->_batchId;
}

- (void)setBatchId:(id)a3
{
}

- (NSMutableArray)ads
{
  return self->_ads;
}

- (void)setAds:(id)a3
{
}

- (BOOL)supplyMetrics
{
  return self->_supplyMetrics;
}

- (float)locationGridSpacing
{
  return self->_locationGridSpacing;
}

- (unsigned)errorDetails
{
  return self->_errorDetails;
}

- (double)minimumIntervalBeforeNextRequest
{
  return self->_minimumIntervalBeforeNextRequest;
}

- (NSMutableArray)adsToEvicts
{
  return self->_adsToEvicts;
}

- (void)setAdsToEvicts:(id)a3
{
}

- (NSMutableArray)uRLsToEvicts
{
  return self->_uRLsToEvicts;
}

- (void)setURLsToEvicts:(id)a3
{
}

- (NSMutableArray)adUpdates
{
  return self->_adUpdates;
}

- (void)setAdUpdates:(id)a3
{
}

- (NSMutableArray)tagTransformations
{
  return self->_tagTransformations;
}

- (void)setTagTransformations:(id)a3
{
}

- (double)prefetchInterval
{
  return self->_prefetchInterval;
}

- (int)prefetchThreshold
{
  return self->_prefetchThreshold;
}

- (NSString)configVersion
{
  return self->_configVersion;
}

- (void)setConfigVersion:(id)a3
{
}

- (APPBAdSpecification)specification
{
  return self->_specification;
}

- (void)setSpecification:(id)a3
{
}

- (BOOL)clearCache
{
  return self->_clearCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uRLsToEvicts, 0);
  objc_storeStrong((id *)&self->_tagTransformations, 0);
  objc_storeStrong((id *)&self->_specification, 0);
  objc_storeStrong((id *)&self->_configVersion, 0);
  objc_storeStrong((id *)&self->_batchId, 0);
  objc_storeStrong((id *)&self->_adsToEvicts, 0);
  objc_storeStrong((id *)&self->_ads, 0);

  objc_storeStrong((id *)&self->_adUpdates, 0);
}

@end