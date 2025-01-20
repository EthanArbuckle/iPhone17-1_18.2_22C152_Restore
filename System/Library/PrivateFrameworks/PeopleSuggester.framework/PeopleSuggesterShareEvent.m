@interface PeopleSuggesterShareEvent
+ (Class)candidatesType;
+ (Class)feedbackEventsType;
- (BOOL)hasAppSharedFrom;
- (BOOL)hasDeviceIdentifier;
- (BOOL)hasIsFallbackFetch;
- (BOOL)hasIsSharePlayAvailable;
- (BOOL)hasMadResponseStatus;
- (BOOL)hasSessionId;
- (BOOL)hasTestKey;
- (BOOL)hasTrialIdentifier;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFallbackFetch;
- (BOOL)isSharePlayAvailable;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)candidates;
- (NSMutableArray)feedbackEvents;
- (NSString)deviceIdentifier;
- (NSString)sessionId;
- (NSString)testKey;
- (PeopleSuggesterTrialIdentifier)trialIdentifier;
- (id)appSharedFromAsString:(int)a3;
- (id)candidatesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)feedbackEventsAtIndex:(unint64_t)a3;
- (id)madResponseStatusAsString:(int)a3;
- (int)StringAsAppSharedFrom:(id)a3;
- (int)StringAsMadResponseStatus:(id)a3;
- (int)appSharedFrom;
- (int)madResponseStatus;
- (int)version;
- (unint64_t)candidatesCount;
- (unint64_t)feedbackEventsCount;
- (unint64_t)hash;
- (void)addCandidates:(id)a3;
- (void)addFeedbackEvents:(id)a3;
- (void)clearCandidates;
- (void)clearFeedbackEvents;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppSharedFrom:(int)a3;
- (void)setCandidates:(id)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setFeedbackEvents:(id)a3;
- (void)setHasAppSharedFrom:(BOOL)a3;
- (void)setHasIsFallbackFetch:(BOOL)a3;
- (void)setHasIsSharePlayAvailable:(BOOL)a3;
- (void)setHasMadResponseStatus:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setIsFallbackFetch:(BOOL)a3;
- (void)setIsSharePlayAvailable:(BOOL)a3;
- (void)setMadResponseStatus:(int)a3;
- (void)setSessionId:(id)a3;
- (void)setTestKey:(id)a3;
- (void)setTrialIdentifier:(id)a3;
- (void)setVersion:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PeopleSuggesterShareEvent

- (BOOL)hasDeviceIdentifier
{
  return self->_deviceIdentifier != 0;
}

- (BOOL)hasSessionId
{
  return self->_sessionId != 0;
}

- (BOOL)hasTrialIdentifier
{
  return self->_trialIdentifier != 0;
}

- (void)setVersion:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasVersion
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)clearCandidates
{
}

- (void)addCandidates:(id)a3
{
  id v4 = a3;
  candidates = self->_candidates;
  id v8 = v4;
  if (!candidates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_candidates;
    self->_candidates = v6;

    id v4 = v8;
    candidates = self->_candidates;
  }
  [(NSMutableArray *)candidates addObject:v4];
}

- (unint64_t)candidatesCount
{
  return [(NSMutableArray *)self->_candidates count];
}

- (id)candidatesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_candidates objectAtIndex:a3];
}

+ (Class)candidatesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasTestKey
{
  return self->_testKey != 0;
}

- (int)madResponseStatus
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_madResponseStatus;
  }
  else {
    return 1;
  }
}

- (void)setMadResponseStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_madResponseStatus = a3;
}

- (void)setHasMadResponseStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMadResponseStatus
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)madResponseStatusAsString:(int)a3
{
  if ((a3 - 1) >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E5AE12A8[a3 - 1];
  }

  return v3;
}

- (int)StringAsMadResponseStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NO_REQUEST_TO_MAD"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SUCCESS"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"TIMED_OUT"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ERROR"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (void)setIsFallbackFetch:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_isFallbackFetch = a3;
}

- (void)setHasIsFallbackFetch:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsFallbackFetch
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setIsSharePlayAvailable:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_isSharePlayAvailable = a3;
}

- (void)setHasIsSharePlayAvailable:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsSharePlayAvailable
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (int)appSharedFrom
{
  if (*(unsigned char *)&self->_has) {
    return self->_appSharedFrom;
  }
  else {
    return 0;
  }
}

- (void)setAppSharedFrom:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_appSharedFrom = a3;
}

- (void)setHasAppSharedFrom:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAppSharedFrom
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)appSharedFromAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E5AE12C8[a3];
  }

  return v3;
}

- (int)StringAsAppSharedFrom:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"OTHER"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PHOTOS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SCREENSHOTS"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CAMERA"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SAFARI"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)clearFeedbackEvents
{
}

- (void)addFeedbackEvents:(id)a3
{
  id v4 = a3;
  feedbackEvents = self->_feedbackEvents;
  id v8 = v4;
  if (!feedbackEvents)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_feedbackEvents;
    self->_feedbackEvents = v6;

    id v4 = v8;
    feedbackEvents = self->_feedbackEvents;
  }
  [(NSMutableArray *)feedbackEvents addObject:v4];
}

- (unint64_t)feedbackEventsCount
{
  return [(NSMutableArray *)self->_feedbackEvents count];
}

- (id)feedbackEventsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_feedbackEvents objectAtIndex:a3];
}

+ (Class)feedbackEventsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PeopleSuggesterShareEvent;
  id v4 = [(PeopleSuggesterShareEvent *)&v8 description];
  v5 = [(PeopleSuggesterShareEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  deviceIdentifier = self->_deviceIdentifier;
  if (deviceIdentifier) {
    [v3 setObject:deviceIdentifier forKey:@"deviceIdentifier"];
  }
  sessionId = self->_sessionId;
  if (sessionId) {
    [v4 setObject:sessionId forKey:@"sessionId"];
  }
  trialIdentifier = self->_trialIdentifier;
  if (trialIdentifier)
  {
    objc_super v8 = [(PeopleSuggesterTrialIdentifier *)trialIdentifier dictionaryRepresentation];
    [v4 setObject:v8 forKey:@"trialIdentifier"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v9 = [NSNumber numberWithInt:self->_version];
    [v4 setObject:v9 forKey:@"version"];
  }
  if ([(NSMutableArray *)self->_candidates count])
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_candidates, "count"));
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v11 = self->_candidates;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v38 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = [*(id *)(*((void *)&v37 + 1) + 8 * i) dictionaryRepresentation];
          [v10 addObject:v16];
        }
        uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v13);
    }

    [v4 setObject:v10 forKey:@"candidates"];
  }
  testKey = self->_testKey;
  if (testKey) {
    [v4 setObject:testKey forKey:@"testKey"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    unsigned int v19 = self->_madResponseStatus - 1;
    if (v19 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_madResponseStatus);
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = off_1E5AE12A8[v19];
    }
    [v4 setObject:v20 forKey:@"madResponseStatus"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_22:
      if ((has & 0x10) == 0) {
        goto LABEL_23;
      }
      goto LABEL_30;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_22;
  }
  v21 = [NSNumber numberWithBool:self->_isFallbackFetch];
  [v4 setObject:v21 forKey:@"isFallbackFetch"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_23:
    if ((has & 1) == 0) {
      goto LABEL_35;
    }
    goto LABEL_31;
  }
LABEL_30:
  v22 = [NSNumber numberWithBool:self->_isSharePlayAvailable];
  [v4 setObject:v22 forKey:@"isSharePlayAvailable"];

  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_35;
  }
LABEL_31:
  uint64_t appSharedFrom = self->_appSharedFrom;
  if (appSharedFrom >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_appSharedFrom);
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = off_1E5AE12C8[appSharedFrom];
  }
  [v4 setObject:v24 forKey:@"appSharedFrom"];

LABEL_35:
  if ([(NSMutableArray *)self->_feedbackEvents count])
  {
    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_feedbackEvents, "count"));
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v26 = self->_feedbackEvents;
    uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v34;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v34 != v29) {
            objc_enumerationMutation(v26);
          }
          v31 = [*(id *)(*((void *)&v33 + 1) + 8 * j) dictionaryRepresentation];
          [v25 addObject:v31];
        }
        uint64_t v28 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v33 objects:v41 count:16];
      }
      while (v28);
    }

    [v4 setObject:v25 forKey:@"feedbackEvents"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PeopleSuggesterShareEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_deviceIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_sessionId) {
    PBDataWriterWriteStringField();
  }
  if (self->_trialIdentifier) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v5 = self->_candidates;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
  }

  if (self->_testKey) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_20:
      if ((has & 0x10) == 0) {
        goto LABEL_21;
      }
      goto LABEL_33;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_20;
  }
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_21:
    if ((has & 1) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_33:
  PBDataWriterWriteBOOLField();
  if (*(unsigned char *)&self->_has) {
LABEL_22:
  }
    PBDataWriterWriteInt32Field();
LABEL_23:
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v11 = self->_feedbackEvents;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v14 = v4;
  if (self->_deviceIdentifier)
  {
    objc_msgSend(v4, "setDeviceIdentifier:");
    id v4 = v14;
  }
  if (self->_sessionId)
  {
    objc_msgSend(v14, "setSessionId:");
    id v4 = v14;
  }
  if (self->_trialIdentifier)
  {
    objc_msgSend(v14, "setTrialIdentifier:");
    id v4 = v14;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v4 + 18) = self->_version;
    *((unsigned char *)v4 + 80) |= 4u;
  }
  if ([(PeopleSuggesterShareEvent *)self candidatesCount])
  {
    [v14 clearCandidates];
    unint64_t v5 = [(PeopleSuggesterShareEvent *)self candidatesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(PeopleSuggesterShareEvent *)self candidatesAtIndex:i];
        [v14 addCandidates:v8];
      }
    }
  }
  if (self->_testKey) {
    objc_msgSend(v14, "setTestKey:");
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v14 + 10) = self->_madResponseStatus;
    *((unsigned char *)v14 + 80) |= 2u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_17:
      if ((has & 0x10) == 0) {
        goto LABEL_18;
      }
LABEL_29:
      *((unsigned char *)v14 + 77) = self->_isSharePlayAvailable;
      *((unsigned char *)v14 + 80) |= 0x10u;
      if ((*(unsigned char *)&self->_has & 1) == 0) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_17;
  }
  *((unsigned char *)v14 + 76) = self->_isFallbackFetch;
  *((unsigned char *)v14 + 80) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) != 0) {
    goto LABEL_29;
  }
LABEL_18:
  if (has)
  {
LABEL_19:
    *((_DWORD *)v14 + 2) = self->_appSharedFrom;
    *((unsigned char *)v14 + 80) |= 1u;
  }
LABEL_20:
  if ([(PeopleSuggesterShareEvent *)self feedbackEventsCount])
  {
    [v14 clearFeedbackEvents];
    unint64_t v10 = [(PeopleSuggesterShareEvent *)self feedbackEventsCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
      {
        uint64_t v13 = [(PeopleSuggesterShareEvent *)self feedbackEventsAtIndex:j];
        [v14 addFeedbackEvents:v13];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_deviceIdentifier copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(NSString *)self->_sessionId copyWithZone:a3];
  v9 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v8;

  id v10 = [(PeopleSuggesterTrialIdentifier *)self->_trialIdentifier copyWithZone:a3];
  unint64_t v11 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v10;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_version;
    *(unsigned char *)(v5 + 80) |= 4u;
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v12 = self->_candidates;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v33 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = (void *)[*(id *)(*((void *)&v32 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addCandidates:v17];
      }
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v14);
  }

  uint64_t v18 = [(NSString *)self->_testKey copyWithZone:a3];
  long long v19 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v18;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_madResponseStatus;
    *(unsigned char *)(v5 + 80) |= 2u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_12:
      if ((has & 0x10) == 0) {
        goto LABEL_13;
      }
      goto LABEL_25;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_12;
  }
  *(unsigned char *)(v5 + 76) = self->_isFallbackFetch;
  *(unsigned char *)(v5 + 80) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_13:
    if ((has & 1) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_25:
  *(unsigned char *)(v5 + 77) = self->_isSharePlayAvailable;
  *(unsigned char *)(v5 + 80) |= 0x10u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_14:
    *(_DWORD *)(v5 + 8) = self->_appSharedFrom;
    *(unsigned char *)(v5 + 80) |= 1u;
  }
LABEL_15:
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v21 = self->_feedbackEvents;
  uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v29 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * j), "copyWithZone:", a3, (void)v28);
        [(id)v5 addFeedbackEvents:v26];
      }
      uint64_t v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v23);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_45;
  }
  deviceIdentifier = self->_deviceIdentifier;
  if ((unint64_t)deviceIdentifier | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](deviceIdentifier, "isEqual:")) {
      goto LABEL_45;
    }
  }
  sessionId = self->_sessionId;
  if ((unint64_t)sessionId | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](sessionId, "isEqual:")) {
      goto LABEL_45;
    }
  }
  trialIdentifier = self->_trialIdentifier;
  if ((unint64_t)trialIdentifier | *((void *)v4 + 8))
  {
    if (!-[PeopleSuggesterTrialIdentifier isEqual:](trialIdentifier, "isEqual:")) {
      goto LABEL_45;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 4) == 0 || self->_version != *((_DWORD *)v4 + 18)) {
      goto LABEL_45;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 4) != 0)
  {
    goto LABEL_45;
  }
  candidates = self->_candidates;
  if ((unint64_t)candidates | *((void *)v4 + 2)
    && !-[NSMutableArray isEqual:](candidates, "isEqual:"))
  {
    goto LABEL_45;
  }
  testKey = self->_testKey;
  if ((unint64_t)testKey | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](testKey, "isEqual:")) {
      goto LABEL_45;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 2) == 0 || self->_madResponseStatus != *((_DWORD *)v4 + 10)) {
      goto LABEL_45;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 2) != 0)
  {
    goto LABEL_45;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 8) == 0) {
      goto LABEL_45;
    }
    if (self->_isFallbackFetch)
    {
      if (!*((unsigned char *)v4 + 76)) {
        goto LABEL_45;
      }
    }
    else if (*((unsigned char *)v4 + 76))
    {
      goto LABEL_45;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 8) != 0)
  {
    goto LABEL_45;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 0x10) != 0)
    {
      if (self->_isSharePlayAvailable)
      {
        if (!*((unsigned char *)v4 + 77)) {
          goto LABEL_45;
        }
        goto LABEL_38;
      }
      if (!*((unsigned char *)v4 + 77)) {
        goto LABEL_38;
      }
    }
LABEL_45:
    char v11 = 0;
    goto LABEL_46;
  }
  if ((*((unsigned char *)v4 + 80) & 0x10) != 0) {
    goto LABEL_45;
  }
LABEL_38:
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 80) & 1) == 0 || self->_appSharedFrom != *((_DWORD *)v4 + 2)) {
      goto LABEL_45;
    }
  }
  else if (*((unsigned char *)v4 + 80))
  {
    goto LABEL_45;
  }
  feedbackEvents = self->_feedbackEvents;
  if ((unint64_t)feedbackEvents | *((void *)v4 + 4)) {
    char v11 = -[NSMutableArray isEqual:](feedbackEvents, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_46:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_deviceIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_sessionId hash];
  unint64_t v5 = [(PeopleSuggesterTrialIdentifier *)self->_trialIdentifier hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v6 = 2654435761 * self->_version;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = [(NSMutableArray *)self->_candidates hash];
  NSUInteger v8 = [(NSString *)self->_testKey hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v9 = 2654435761 * self->_madResponseStatus;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_6:
      uint64_t v10 = 2654435761 * self->_isFallbackFetch;
      if ((*(unsigned char *)&self->_has & 0x10) != 0) {
        goto LABEL_7;
      }
LABEL_11:
      uint64_t v11 = 0;
      if (*(unsigned char *)&self->_has) {
        goto LABEL_8;
      }
LABEL_12:
      uint64_t v12 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ [(NSMutableArray *)self->_feedbackEvents hash];
    }
  }
  else
  {
    uint64_t v9 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_6;
    }
  }
  uint64_t v10 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_11;
  }
LABEL_7:
  uint64_t v11 = 2654435761 * self->_isSharePlayAvailable;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_12;
  }
LABEL_8:
  uint64_t v12 = 2654435761 * self->_appSharedFrom;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ [(NSMutableArray *)self->_feedbackEvents hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 3)) {
    -[PeopleSuggesterShareEvent setDeviceIdentifier:](self, "setDeviceIdentifier:");
  }
  if (*((void *)v4 + 6)) {
    -[PeopleSuggesterShareEvent setSessionId:](self, "setSessionId:");
  }
  trialIdentifier = self->_trialIdentifier;
  uint64_t v6 = *((void *)v4 + 8);
  if (trialIdentifier)
  {
    if (v6) {
      -[PeopleSuggesterTrialIdentifier mergeFrom:](trialIdentifier, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[PeopleSuggesterShareEvent setTrialIdentifier:](self, "setTrialIdentifier:");
  }
  if ((*((unsigned char *)v4 + 80) & 4) != 0)
  {
    self->_version = *((_DWORD *)v4 + 18);
    *(unsigned char *)&self->_has |= 4u;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = *((id *)v4 + 2);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        [(PeopleSuggesterShareEvent *)self addCandidates:*(void *)(*((void *)&v22 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v9);
  }

  if (*((void *)v4 + 7)) {
    -[PeopleSuggesterShareEvent setTestKey:](self, "setTestKey:");
  }
  char v12 = *((unsigned char *)v4 + 80);
  if ((v12 & 2) != 0)
  {
    self->_madResponseStatus = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 2u;
    char v12 = *((unsigned char *)v4 + 80);
    if ((v12 & 8) == 0)
    {
LABEL_23:
      if ((v12 & 0x10) == 0) {
        goto LABEL_24;
      }
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 8) == 0)
  {
    goto LABEL_23;
  }
  self->_isFallbackFetch = *((unsigned char *)v4 + 76);
  *(unsigned char *)&self->_has |= 8u;
  char v12 = *((unsigned char *)v4 + 80);
  if ((v12 & 0x10) == 0)
  {
LABEL_24:
    if ((v12 & 1) == 0) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
LABEL_36:
  self->_isSharePlayAvailable = *((unsigned char *)v4 + 77);
  *(unsigned char *)&self->_has |= 0x10u;
  if (*((unsigned char *)v4 + 80))
  {
LABEL_25:
    self->_uint64_t appSharedFrom = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_26:
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v13 = *((id *)v4 + 4);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        -[PeopleSuggesterShareEvent addFeedbackEvents:](self, "addFeedbackEvents:", *(void *)(*((void *)&v18 + 1) + 8 * j), (void)v18);
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v15);
  }
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (NSString)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(id)a3
{
}

- (PeopleSuggesterTrialIdentifier)trialIdentifier
{
  return self->_trialIdentifier;
}

- (void)setTrialIdentifier:(id)a3
{
}

- (int)version
{
  return self->_version;
}

- (NSMutableArray)candidates
{
  return self->_candidates;
}

- (void)setCandidates:(id)a3
{
}

- (NSString)testKey
{
  return self->_testKey;
}

- (void)setTestKey:(id)a3
{
}

- (BOOL)isFallbackFetch
{
  return self->_isFallbackFetch;
}

- (BOOL)isSharePlayAvailable
{
  return self->_isSharePlayAvailable;
}

- (NSMutableArray)feedbackEvents
{
  return self->_feedbackEvents;
}

- (void)setFeedbackEvents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialIdentifier, 0);
  objc_storeStrong((id *)&self->_testKey, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_feedbackEvents, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);

  objc_storeStrong((id *)&self->_candidates, 0);
}

@end