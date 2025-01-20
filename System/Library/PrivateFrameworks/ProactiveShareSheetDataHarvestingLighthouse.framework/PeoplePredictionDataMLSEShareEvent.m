@interface PeoplePredictionDataMLSEShareEvent
+ (Class)featurizedCandidateType;
- (BOOL)hasEngagementType;
- (BOOL)hasFeaturizationConfig;
- (BOOL)hasSessionId;
- (BOOL)hasTrialIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)featurizedCandidates;
- (NSString)sessionId;
- (PeoplePredictionDataFeaturizationConfig)featurizationConfig;
- (PeoplePredictionDataTrialIdentifier)trialIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)engagementTypeAsString:(int)a3;
- (id)featurizedCandidateAtIndex:(unint64_t)a3;
- (int)StringAsEngagementType:(id)a3;
- (int)engagementType;
- (unint64_t)featurizedCandidatesCount;
- (unint64_t)hash;
- (void)addFeaturizedCandidate:(id)a3;
- (void)clearFeaturizedCandidates;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEngagementType:(int)a3;
- (void)setFeaturizationConfig:(id)a3;
- (void)setFeaturizedCandidates:(id)a3;
- (void)setHasEngagementType:(BOOL)a3;
- (void)setSessionId:(id)a3;
- (void)setTrialIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PeoplePredictionDataMLSEShareEvent

- (BOOL)hasSessionId
{
  return self->_sessionId != 0;
}

- (void)clearFeaturizedCandidates
{
}

- (void)addFeaturizedCandidate:(id)a3
{
  id v4 = a3;
  featurizedCandidates = self->_featurizedCandidates;
  id v8 = v4;
  if (!featurizedCandidates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_featurizedCandidates;
    self->_featurizedCandidates = v6;

    id v4 = v8;
    featurizedCandidates = self->_featurizedCandidates;
  }
  [(NSMutableArray *)featurizedCandidates addObject:v4];
}

- (unint64_t)featurizedCandidatesCount
{
  return [(NSMutableArray *)self->_featurizedCandidates count];
}

- (id)featurizedCandidateAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_featurizedCandidates objectAtIndex:a3];
}

+ (Class)featurizedCandidateType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasFeaturizationConfig
{
  return self->_featurizationConfig != 0;
}

- (BOOL)hasTrialIdentifier
{
  return self->_trialIdentifier != 0;
}

- (int)engagementType
{
  if (*(unsigned char *)&self->_has) {
    return self->_engagementType;
  }
  else {
    return 0;
  }
}

- (void)setEngagementType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_engagementType = a3;
}

- (void)setHasEngagementType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEngagementType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)engagementTypeAsString:(int)a3
{
  if (a3 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_26547DD20[a3];
  }

  return v3;
}

- (int)StringAsEngagementType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PEOPLE_SUGGESTION"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"APP_SUGGESTION"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"NON_SUGGESTION"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ABANDON"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"AIRDROP_PEOPLE_SUGGESTION"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"APP_VALID_AS_PEOPLE_SUGGESTION_TARGET"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"APP_NOT_VALID_AS_PEOPLE_SUGGESTION_TARGET"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PeoplePredictionDataMLSEShareEvent;
  int v4 = [(PeoplePredictionDataMLSEShareEvent *)&v8 description];
  v5 = [(PeoplePredictionDataMLSEShareEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  int v4 = v3;
  sessionId = self->_sessionId;
  if (sessionId) {
    [v3 setObject:sessionId forKey:@"sessionId"];
  }
  if ([(NSMutableArray *)self->_featurizedCandidates count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_featurizedCandidates, "count"));
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v7 = self->_featurizedCandidates;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v20 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v9);
    }

    [v4 setObject:v6 forKey:@"featurizedCandidate"];
  }
  featurizationConfig = self->_featurizationConfig;
  if (featurizationConfig)
  {
    v14 = [(PeoplePredictionDataFeaturizationConfig *)featurizationConfig dictionaryRepresentation];
    [v4 setObject:v14 forKey:@"featurizationConfig"];
  }
  trialIdentifier = self->_trialIdentifier;
  if (trialIdentifier)
  {
    v16 = [(PeoplePredictionDataTrialIdentifier *)trialIdentifier dictionaryRepresentation];
    [v4 setObject:v16 forKey:@"trialIdentifier"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t engagementType = self->_engagementType;
    if (engagementType >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_engagementType);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = off_26547DD20[engagementType];
    }
    [v4 setObject:v18 forKey:@"engagementType"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PeoplePredictionDataMLSEShareEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_sessionId) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_featurizedCandidates;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_trialIdentifier) {
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_featurizationConfig) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  id v9 = a3;
  if (self->_sessionId) {
    objc_msgSend(v9, "setSessionId:");
  }
  if ([(PeoplePredictionDataMLSEShareEvent *)self featurizedCandidatesCount])
  {
    [v9 clearFeaturizedCandidates];
    unint64_t v4 = [(PeoplePredictionDataMLSEShareEvent *)self featurizedCandidatesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(PeoplePredictionDataMLSEShareEvent *)self featurizedCandidateAtIndex:i];
        [v9 addFeaturizedCandidate:v7];
      }
    }
  }
  if (self->_trialIdentifier) {
    objc_msgSend(v9, "setTrialIdentifier:");
  }
  uint64_t v8 = v9;
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v9 + 2) = self->_engagementType;
    *((unsigned char *)v9 + 48) |= 1u;
  }
  if (self->_featurizationConfig)
  {
    objc_msgSend(v9, "setFeaturizationConfig:");
    uint64_t v8 = v9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_sessionId copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v8 = self->_featurizedCandidates;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v12), "copyWithZone:", a3, (void)v19);
        [(id)v5 addFeaturizedCandidate:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  id v14 = [(PeoplePredictionDataTrialIdentifier *)self->_trialIdentifier copyWithZone:a3];
  uint64_t v15 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v14;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_engagementType;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  id v16 = -[PeoplePredictionDataFeaturizationConfig copyWithZone:](self->_featurizationConfig, "copyWithZone:", a3, (void)v19);
  v17 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v16;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  sessionId = self->_sessionId;
  if ((unint64_t)sessionId | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](sessionId, "isEqual:")) {
      goto LABEL_15;
    }
  }
  featurizedCandidates = self->_featurizedCandidates;
  if ((unint64_t)featurizedCandidates | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](featurizedCandidates, "isEqual:")) {
      goto LABEL_15;
    }
  }
  trialIdentifier = self->_trialIdentifier;
  if ((unint64_t)trialIdentifier | *((void *)v4 + 5))
  {
    if (!-[PeoplePredictionDataTrialIdentifier isEqual:](trialIdentifier, "isEqual:")) {
      goto LABEL_15;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_engagementType != *((_DWORD *)v4 + 2)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_15:
    char v9 = 0;
    goto LABEL_16;
  }
  featurizationConfig = self->_featurizationConfig;
  if ((unint64_t)featurizationConfig | *((void *)v4 + 2)) {
    char v9 = -[PeoplePredictionDataFeaturizationConfig isEqual:](featurizationConfig, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_sessionId hash];
  uint64_t v4 = [(NSMutableArray *)self->_featurizedCandidates hash];
  unint64_t v5 = [(PeoplePredictionDataTrialIdentifier *)self->_trialIdentifier hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_engagementType;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ [(PeoplePredictionDataFeaturizationConfig *)self->_featurizationConfig hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 4)) {
    -[PeoplePredictionDataMLSEShareEvent setSessionId:](self, "setSessionId:");
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = *((id *)v4 + 3);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        -[PeoplePredictionDataMLSEShareEvent addFeaturizedCandidate:](self, "addFeaturizedCandidate:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  trialIdentifier = self->_trialIdentifier;
  uint64_t v11 = *((void *)v4 + 5);
  if (trialIdentifier)
  {
    if (v11) {
      -[PeoplePredictionDataTrialIdentifier mergeFrom:](trialIdentifier, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[PeoplePredictionDataMLSEShareEvent setTrialIdentifier:](self, "setTrialIdentifier:");
  }
  if (*((unsigned char *)v4 + 48))
  {
    self->_uint64_t engagementType = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
  featurizationConfig = self->_featurizationConfig;
  uint64_t v13 = *((void *)v4 + 2);
  if (featurizationConfig)
  {
    if (v13) {
      -[PeoplePredictionDataFeaturizationConfig mergeFrom:](featurizationConfig, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[PeoplePredictionDataMLSEShareEvent setFeaturizationConfig:](self, "setFeaturizationConfig:");
  }
}

- (NSString)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(id)a3
{
}

- (NSMutableArray)featurizedCandidates
{
  return self->_featurizedCandidates;
}

- (void)setFeaturizedCandidates:(id)a3
{
}

- (PeoplePredictionDataFeaturizationConfig)featurizationConfig
{
  return self->_featurizationConfig;
}

- (void)setFeaturizationConfig:(id)a3
{
}

- (PeoplePredictionDataTrialIdentifier)trialIdentifier
{
  return self->_trialIdentifier;
}

- (void)setTrialIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialIdentifier, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_featurizedCandidates, 0);

  objc_storeStrong((id *)&self->_featurizationConfig, 0);
}

@end