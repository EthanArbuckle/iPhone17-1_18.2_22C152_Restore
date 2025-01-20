@interface PPPBFeedbackLog
+ (Class)experimentalGroupsType;
+ (Class)extractedDonationsType;
+ (Class)scoredItemsType;
- (BOOL)hasAssetVersion;
- (BOOL)hasFeedbackMetadata;
- (BOOL)hasHomeLocationGeohash;
- (BOOL)hasPredictionType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)experimentalGroups;
- (NSMutableArray)extractedDonations;
- (NSMutableArray)scoredItems;
- (NSString)assetVersion;
- (NSString)homeLocationGeohash;
- (PPPBFeedbackMetadata)feedbackMetadata;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)experimentalGroupsAtIndex:(unint64_t)a3;
- (id)extractedDonationsAtIndex:(unint64_t)a3;
- (id)scoredItemsAtIndex:(unint64_t)a3;
- (int)predictionType;
- (unint64_t)experimentalGroupsCount;
- (unint64_t)extractedDonationsCount;
- (unint64_t)hash;
- (unint64_t)scoredItemsCount;
- (void)addExperimentalGroups:(id)a3;
- (void)addExtractedDonations:(id)a3;
- (void)addScoredItems:(id)a3;
- (void)clearExperimentalGroups;
- (void)clearExtractedDonations;
- (void)clearScoredItems;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAssetVersion:(id)a3;
- (void)setExperimentalGroups:(id)a3;
- (void)setExtractedDonations:(id)a3;
- (void)setFeedbackMetadata:(id)a3;
- (void)setHasPredictionType:(BOOL)a3;
- (void)setHomeLocationGeohash:(id)a3;
- (void)setPredictionType:(int)a3;
- (void)setScoredItems:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PPPBFeedbackLog

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scoredItems, 0);
  objc_storeStrong((id *)&self->_homeLocationGeohash, 0);
  objc_storeStrong((id *)&self->_feedbackMetadata, 0);
  objc_storeStrong((id *)&self->_extractedDonations, 0);
  objc_storeStrong((id *)&self->_experimentalGroups, 0);
  objc_storeStrong((id *)&self->_assetVersion, 0);
}

- (void)setAssetVersion:(id)a3
{
}

- (NSString)assetVersion
{
  return self->_assetVersion;
}

- (void)setHomeLocationGeohash:(id)a3
{
}

- (NSString)homeLocationGeohash
{
  return self->_homeLocationGeohash;
}

- (void)setExperimentalGroups:(id)a3
{
}

- (NSMutableArray)experimentalGroups
{
  return self->_experimentalGroups;
}

- (void)setExtractedDonations:(id)a3
{
}

- (NSMutableArray)extractedDonations
{
  return self->_extractedDonations;
}

- (void)setScoredItems:(id)a3
{
}

- (NSMutableArray)scoredItems
{
  return self->_scoredItems;
}

- (void)setFeedbackMetadata:(id)a3
{
}

- (PPPBFeedbackMetadata)feedbackMetadata
{
  return self->_feedbackMetadata;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  feedbackMetadata = self->_feedbackMetadata;
  uint64_t v6 = *((void *)v4 + 4);
  if (feedbackMetadata)
  {
    if (v6) {
      -[PPPBFeedbackMetadata mergeFrom:](feedbackMetadata, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[PPPBFeedbackLog setFeedbackMetadata:](self, "setFeedbackMetadata:");
  }
  if (*((unsigned char *)v4 + 64))
  {
    self->_predictionType = *((_DWORD *)v4 + 12);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v7 = *((id *)v4 + 7);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(v7);
        }
        [(PPPBFeedbackLog *)self addScoredItems:*(void *)(*((void *)&v30 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v9);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v12 = *((id *)v4 + 3);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v35 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v12);
        }
        [(PPPBFeedbackLog *)self addExtractedDonations:*(void *)(*((void *)&v26 + 1) + 8 * j)];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v35 count:16];
    }
    while (v14);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v17 = *((id *)v4 + 2);
  uint64_t v18 = [v17 countByEnumeratingWithState:&v22 objects:v34 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v23;
    do
    {
      for (uint64_t k = 0; k != v19; ++k)
      {
        if (*(void *)v23 != v20) {
          objc_enumerationMutation(v17);
        }
        -[PPPBFeedbackLog addExperimentalGroups:](self, "addExperimentalGroups:", *(void *)(*((void *)&v22 + 1) + 8 * k), (void)v22);
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v22 objects:v34 count:16];
    }
    while (v19);
  }

  if (*((void *)v4 + 5)) {
    -[PPPBFeedbackLog setHomeLocationGeohash:](self, "setHomeLocationGeohash:");
  }
  if (*((void *)v4 + 1)) {
    -[PPPBFeedbackLog setAssetVersion:](self, "setAssetVersion:");
  }
}

- (unint64_t)hash
{
  unint64_t v3 = [(PPPBFeedbackMetadata *)self->_feedbackMetadata hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_predictionType;
  }
  else {
    uint64_t v4 = 0;
  }
  unint64_t v5 = v4 ^ v3;
  uint64_t v6 = [(NSMutableArray *)self->_scoredItems hash];
  uint64_t v7 = v5 ^ v6 ^ [(NSMutableArray *)self->_extractedDonations hash];
  uint64_t v8 = [(NSMutableArray *)self->_experimentalGroups hash];
  NSUInteger v9 = v8 ^ [(NSString *)self->_homeLocationGeohash hash];
  return v7 ^ v9 ^ [(NSString *)self->_assetVersion hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  feedbackMetadata = self->_feedbackMetadata;
  if ((unint64_t)feedbackMetadata | *((void *)v4 + 4))
  {
    if (!-[PPPBFeedbackMetadata isEqual:](feedbackMetadata, "isEqual:")) {
      goto LABEL_19;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_predictionType != *((_DWORD *)v4 + 12)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
LABEL_19:
    char v11 = 0;
    goto LABEL_20;
  }
  scoredItems = self->_scoredItems;
  if ((unint64_t)scoredItems | *((void *)v4 + 7)
    && !-[NSMutableArray isEqual:](scoredItems, "isEqual:"))
  {
    goto LABEL_19;
  }
  extractedDonations = self->_extractedDonations;
  if ((unint64_t)extractedDonations | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](extractedDonations, "isEqual:")) {
      goto LABEL_19;
    }
  }
  experimentalGroups = self->_experimentalGroups;
  if ((unint64_t)experimentalGroups | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](experimentalGroups, "isEqual:")) {
      goto LABEL_19;
    }
  }
  homeLocationGeohash = self->_homeLocationGeohash;
  if ((unint64_t)homeLocationGeohash | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](homeLocationGeohash, "isEqual:")) {
      goto LABEL_19;
    }
  }
  assetVersion = self->_assetVersion;
  if ((unint64_t)assetVersion | *((void *)v4 + 1)) {
    char v11 = -[NSString isEqual:](assetVersion, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_20:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(PPPBFeedbackMetadata *)self->_feedbackMetadata copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 48) = self->_predictionType;
    *(unsigned char *)(v5 + 64) |= 1u;
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v8 = self->_scoredItems;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v40;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v40 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = (void *)[*(id *)(*((void *)&v39 + 1) + 8 * v12) copyWithZone:a3];
        [(id)v5 addScoredItems:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v39 objects:v45 count:16];
    }
    while (v10);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v14 = self->_extractedDonations;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v35 objects:v44 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v36;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v36 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = (void *)[*(id *)(*((void *)&v35 + 1) + 8 * v18) copyWithZone:a3];
        [(id)v5 addExtractedDonations:v19];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v35 objects:v44 count:16];
    }
    while (v16);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v20 = self->_experimentalGroups;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v31 objects:v43 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v32;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v32 != v23) {
          objc_enumerationMutation(v20);
        }
        long long v25 = objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * v24), "copyWithZone:", a3, (void)v31);
        [(id)v5 addExperimentalGroups:v25];

        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v31 objects:v43 count:16];
    }
    while (v22);
  }

  uint64_t v26 = [(NSString *)self->_homeLocationGeohash copyWithZone:a3];
  long long v27 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v26;

  uint64_t v28 = [(NSString *)self->_assetVersion copyWithZone:a3];
  long long v29 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v28;

  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v18 = v4;
  if (self->_feedbackMetadata)
  {
    objc_msgSend(v4, "setFeedbackMetadata:");
    id v4 = v18;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 12) = self->_predictionType;
    *((unsigned char *)v4 + 64) |= 1u;
  }
  if ([(PPPBFeedbackLog *)self scoredItemsCount])
  {
    [v18 clearScoredItems];
    unint64_t v5 = [(PPPBFeedbackLog *)self scoredItemsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(PPPBFeedbackLog *)self scoredItemsAtIndex:i];
        [v18 addScoredItems:v8];
      }
    }
  }
  if ([(PPPBFeedbackLog *)self extractedDonationsCount])
  {
    [v18 clearExtractedDonations];
    unint64_t v9 = [(PPPBFeedbackLog *)self extractedDonationsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        uint64_t v12 = [(PPPBFeedbackLog *)self extractedDonationsAtIndex:j];
        [v18 addExtractedDonations:v12];
      }
    }
  }
  if ([(PPPBFeedbackLog *)self experimentalGroupsCount])
  {
    [v18 clearExperimentalGroups];
    unint64_t v13 = [(PPPBFeedbackLog *)self experimentalGroupsCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0; k != v14; ++k)
      {
        uint64_t v16 = [(PPPBFeedbackLog *)self experimentalGroupsAtIndex:k];
        [v18 addExperimentalGroups:v16];
      }
    }
  }
  if (self->_homeLocationGeohash) {
    objc_msgSend(v18, "setHomeLocationGeohash:");
  }
  uint64_t v17 = v18;
  if (self->_assetVersion)
  {
    objc_msgSend(v18, "setAssetVersion:");
    uint64_t v17 = v18;
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_feedbackMetadata) {
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  unint64_t v5 = self->_scoredItems;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v7);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  unint64_t v10 = self->_extractedDonations;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v12);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v15 = self->_experimentalGroups;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v17);
  }

  if (self->_homeLocationGeohash) {
    PBDataWriterWriteStringField();
  }
  if (self->_assetVersion) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PPPBFeedbackLogReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  feedbackMetadata = self->_feedbackMetadata;
  if (feedbackMetadata)
  {
    unint64_t v5 = [(PPPBFeedbackMetadata *)feedbackMetadata dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"feedbackMetadata"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v6 = [NSNumber numberWithInt:self->_predictionType];
    [v3 setObject:v6 forKey:@"predictionType"];
  }
  if ([(NSMutableArray *)self->_scoredItems count])
  {
    uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_scoredItems, "count"));
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v8 = self->_scoredItems;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v39 objects:v45 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v40 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = [*(id *)(*((void *)&v39 + 1) + 8 * i) dictionaryRepresentation];
          [v7 addObject:v13];
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v39 objects:v45 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKey:@"scoredItems"];
  }
  if ([(NSMutableArray *)self->_extractedDonations count])
  {
    uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_extractedDonations, "count"));
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    uint64_t v15 = self->_extractedDonations;
    uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v35 objects:v44 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v36;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v36 != v18) {
            objc_enumerationMutation(v15);
          }
          long long v20 = [*(id *)(*((void *)&v35 + 1) + 8 * j) dictionaryRepresentation];
          [v14 addObject:v20];
        }
        uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v35 objects:v44 count:16];
      }
      while (v17);
    }

    [v3 setObject:v14 forKey:@"extractedDonations"];
  }
  if ([(NSMutableArray *)self->_experimentalGroups count])
  {
    long long v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_experimentalGroups, "count"));
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v22 = self->_experimentalGroups;
    uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v31 objects:v43 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v32;
      do
      {
        for (uint64_t k = 0; k != v24; ++k)
        {
          if (*(void *)v32 != v25) {
            objc_enumerationMutation(v22);
          }
          long long v27 = objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * k), "dictionaryRepresentation", (void)v31);
          [v21 addObject:v27];
        }
        uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v31 objects:v43 count:16];
      }
      while (v24);
    }

    [v3 setObject:v21 forKey:@"experimentalGroups"];
  }
  homeLocationGeohash = self->_homeLocationGeohash;
  if (homeLocationGeohash) {
    [v3 setObject:homeLocationGeohash forKey:@"homeLocationGeohash"];
  }
  assetVersion = self->_assetVersion;
  if (assetVersion) {
    [v3 setObject:assetVersion forKey:@"assetVersion"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PPPBFeedbackLog;
  id v4 = [(PPPBFeedbackLog *)&v8 description];
  unint64_t v5 = [(PPPBFeedbackLog *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasAssetVersion
{
  return self->_assetVersion != 0;
}

- (BOOL)hasHomeLocationGeohash
{
  return self->_homeLocationGeohash != 0;
}

- (id)experimentalGroupsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_experimentalGroups objectAtIndex:a3];
}

- (unint64_t)experimentalGroupsCount
{
  return [(NSMutableArray *)self->_experimentalGroups count];
}

- (void)addExperimentalGroups:(id)a3
{
  id v4 = a3;
  experimentalGroups = self->_experimentalGroups;
  id v8 = v4;
  if (!experimentalGroups)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_experimentalGroups;
    self->_experimentalGroups = v6;

    id v4 = v8;
    experimentalGroups = self->_experimentalGroups;
  }
  [(NSMutableArray *)experimentalGroups addObject:v4];
}

- (void)clearExperimentalGroups
{
}

- (id)extractedDonationsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_extractedDonations objectAtIndex:a3];
}

- (unint64_t)extractedDonationsCount
{
  return [(NSMutableArray *)self->_extractedDonations count];
}

- (void)addExtractedDonations:(id)a3
{
  id v4 = a3;
  extractedDonations = self->_extractedDonations;
  id v8 = v4;
  if (!extractedDonations)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_extractedDonations;
    self->_extractedDonations = v6;

    id v4 = v8;
    extractedDonations = self->_extractedDonations;
  }
  [(NSMutableArray *)extractedDonations addObject:v4];
}

- (void)clearExtractedDonations
{
}

- (id)scoredItemsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_scoredItems objectAtIndex:a3];
}

- (unint64_t)scoredItemsCount
{
  return [(NSMutableArray *)self->_scoredItems count];
}

- (void)addScoredItems:(id)a3
{
  id v4 = a3;
  scoredItems = self->_scoredItems;
  id v8 = v4;
  if (!scoredItems)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_scoredItems;
    self->_scoredItems = v6;

    id v4 = v8;
    scoredItems = self->_scoredItems;
  }
  [(NSMutableArray *)scoredItems addObject:v4];
}

- (void)clearScoredItems
{
}

- (BOOL)hasPredictionType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasPredictionType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setPredictionType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_predictionType = a3;
}

- (int)predictionType
{
  if (*(unsigned char *)&self->_has) {
    return self->_predictionType;
  }
  else {
    return 0;
  }
}

- (BOOL)hasFeedbackMetadata
{
  return self->_feedbackMetadata != 0;
}

+ (Class)experimentalGroupsType
{
  return (Class)objc_opt_class();
}

+ (Class)extractedDonationsType
{
  return (Class)objc_opt_class();
}

+ (Class)scoredItemsType
{
  return (Class)objc_opt_class();
}

@end