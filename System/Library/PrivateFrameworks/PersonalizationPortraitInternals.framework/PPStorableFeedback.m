@interface PPStorableFeedback
+ (Class)feedbackItemsType;
- (BOOL)hasBuild;
- (BOOL)hasClientBundleIdentifier;
- (BOOL)hasClientIdentifier;
- (BOOL)hasIsMapped;
- (BOOL)hasMappingId;
- (BOOL)hasSecondsFrom1970;
- (BOOL)hasStoreType;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMapped;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)feedbackItems;
- (NSString)build;
- (NSString)clientBundleIdentifier;
- (NSString)clientIdentifier;
- (NSString)mappingId;
- (double)secondsFrom1970;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)feedbackItemsAtIndex:(unint64_t)a3;
- (unint64_t)feedbackItemsCount;
- (unint64_t)hash;
- (unsigned)storeType;
- (void)addFeedbackItems:(id)a3;
- (void)clearFeedbackItems;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBuild:(id)a3;
- (void)setClientBundleIdentifier:(id)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setFeedbackItems:(id)a3;
- (void)setHasIsMapped:(BOOL)a3;
- (void)setHasSecondsFrom1970:(BOOL)a3;
- (void)setHasStoreType:(BOOL)a3;
- (void)setIsMapped:(BOOL)a3;
- (void)setMappingId:(id)a3;
- (void)setSecondsFrom1970:(double)a3;
- (void)setStoreType:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PPStorableFeedback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mappingId, 0);
  objc_storeStrong((id *)&self->_feedbackItems, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_clientBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_build, 0);
}

- (void)setFeedbackItems:(id)a3
{
}

- (NSMutableArray)feedbackItems
{
  return self->_feedbackItems;
}

- (void)setBuild:(id)a3
{
}

- (NSString)build
{
  return self->_build;
}

- (BOOL)isMapped
{
  return self->_isMapped;
}

- (void)setMappingId:(id)a3
{
}

- (NSString)mappingId
{
  return self->_mappingId;
}

- (void)setClientIdentifier:(id)a3
{
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientBundleIdentifier:(id)a3
{
}

- (NSString)clientBundleIdentifier
{
  return self->_clientBundleIdentifier;
}

- (unsigned)storeType
{
  return self->_storeType;
}

- (double)secondsFrom1970
{
  return self->_secondsFrom1970;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  char v6 = *((unsigned char *)v4 + 64);
  if (v6)
  {
    self->_secondsFrom1970 = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v6 = *((unsigned char *)v4 + 64);
  }
  if ((v6 & 2) != 0)
  {
    self->_storeType = *((_DWORD *)v4 + 14);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 3)) {
    -[PPStorableFeedback setClientBundleIdentifier:](self, "setClientBundleIdentifier:");
  }
  if (*((void *)v5 + 4)) {
    -[PPStorableFeedback setClientIdentifier:](self, "setClientIdentifier:");
  }
  if (*((void *)v5 + 6)) {
    -[PPStorableFeedback setMappingId:](self, "setMappingId:");
  }
  if ((*((unsigned char *)v5 + 64) & 4) != 0)
  {
    self->_isMapped = *((unsigned char *)v5 + 60);
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v5 + 2)) {
    -[PPStorableFeedback setBuild:](self, "setBuild:");
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *((id *)v5 + 5);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[PPStorableFeedback addFeedbackItems:](self, "addFeedbackItems:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if (has)
  {
    double secondsFrom1970 = self->_secondsFrom1970;
    double v6 = -secondsFrom1970;
    if (secondsFrom1970 >= 0.0) {
      double v6 = self->_secondsFrom1970;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if ((has & 2) != 0) {
    uint64_t v9 = 2654435761 * self->_storeType;
  }
  else {
    uint64_t v9 = 0;
  }
  NSUInteger v10 = [(NSString *)self->_clientBundleIdentifier hash];
  NSUInteger v11 = [(NSString *)self->_clientIdentifier hash];
  NSUInteger v12 = [(NSString *)self->_mappingId hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v13 = 2654435761 * self->_isMapped;
  }
  else {
    uint64_t v13 = 0;
  }
  unint64_t v14 = v9 ^ v4 ^ v10 ^ v11 ^ v12;
  NSUInteger v15 = v13 ^ [(NSString *)self->_build hash];
  return v14 ^ v15 ^ [(NSMutableArray *)self->_feedbackItems hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_30;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_secondsFrom1970 != *((double *)v4 + 1)) {
      goto LABEL_30;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
    goto LABEL_30;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 2) == 0 || self->_storeType != *((_DWORD *)v4 + 14)) {
      goto LABEL_30;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 2) != 0)
  {
    goto LABEL_30;
  }
  clientBundleIdentifier = self->_clientBundleIdentifier;
  if ((unint64_t)clientBundleIdentifier | *((void *)v4 + 3)
    && !-[NSString isEqual:](clientBundleIdentifier, "isEqual:"))
  {
    goto LABEL_30;
  }
  clientIdentifier = self->_clientIdentifier;
  if ((unint64_t)clientIdentifier | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](clientIdentifier, "isEqual:")) {
      goto LABEL_30;
    }
  }
  mappingId = self->_mappingId;
  if ((unint64_t)mappingId | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](mappingId, "isEqual:")) {
      goto LABEL_30;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 4) != 0)
    {
      if (self->_isMapped)
      {
        if (!*((unsigned char *)v4 + 60)) {
          goto LABEL_30;
        }
        goto LABEL_26;
      }
      if (!*((unsigned char *)v4 + 60)) {
        goto LABEL_26;
      }
    }
LABEL_30:
    char v10 = 0;
    goto LABEL_31;
  }
  if ((*((unsigned char *)v4 + 64) & 4) != 0) {
    goto LABEL_30;
  }
LABEL_26:
  build = self->_build;
  if ((unint64_t)build | *((void *)v4 + 2) && !-[NSString isEqual:](build, "isEqual:")) {
    goto LABEL_30;
  }
  feedbackItems = self->_feedbackItems;
  if ((unint64_t)feedbackItems | *((void *)v4 + 5)) {
    char v10 = -[NSMutableArray isEqual:](feedbackItems, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_31:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if (has)
  {
    *(double *)(v5 + 8) = self->_secondsFrom1970;
    *(unsigned char *)(v5 + 64) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_storeType;
    *(unsigned char *)(v5 + 64) |= 2u;
  }
  uint64_t v8 = [(NSString *)self->_clientBundleIdentifier copyWithZone:a3];
  uint64_t v9 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v8;

  uint64_t v10 = [(NSString *)self->_clientIdentifier copyWithZone:a3];
  NSUInteger v11 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v10;

  uint64_t v12 = [(NSString *)self->_mappingId copyWithZone:a3];
  uint64_t v13 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v12;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(unsigned char *)(v6 + 60) = self->_isMapped;
    *(unsigned char *)(v6 + 64) |= 4u;
  }
  uint64_t v14 = [(NSString *)self->_build copyWithZone:a3];
  NSUInteger v15 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v14;

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v16 = self->_feedbackItems;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "copyWithZone:", a3, (void)v23);
        [(id)v6 addFeedbackItems:v21];
      }
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v18);
  }

  return (id)v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = *(void *)&self->_secondsFrom1970;
    *((unsigned char *)v4 + 64) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 14) = self->_storeType;
    *((unsigned char *)v4 + 64) |= 2u;
  }
  uint64_t v10 = v4;
  if (self->_clientBundleIdentifier)
  {
    objc_msgSend(v4, "setClientBundleIdentifier:");
    id v4 = v10;
  }
  if (self->_clientIdentifier)
  {
    objc_msgSend(v10, "setClientIdentifier:");
    id v4 = v10;
  }
  if (self->_mappingId)
  {
    objc_msgSend(v10, "setMappingId:");
    id v4 = v10;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((unsigned char *)v4 + 60) = self->_isMapped;
    *((unsigned char *)v4 + 64) |= 4u;
  }
  if (self->_build) {
    objc_msgSend(v10, "setBuild:");
  }
  if ([(PPStorableFeedback *)self feedbackItemsCount])
  {
    [v10 clearFeedbackItems];
    unint64_t v6 = [(PPStorableFeedback *)self feedbackItemsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(PPStorableFeedback *)self feedbackItemsAtIndex:i];
        [v10 addFeedbackItems:v9];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_clientBundleIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_clientIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_mappingId) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_build) {
    PBDataWriterWriteStringField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unint64_t v6 = self->_feedbackItems;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (BOOL)readFrom:(id)a3
{
  return PPStorableFeedbackReadFrom(self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    uint64_t v5 = [NSNumber numberWithDouble:self->_secondsFrom1970];
    [v3 setObject:v5 forKey:@"secondsFrom1970"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    unint64_t v6 = [NSNumber numberWithUnsignedInt:self->_storeType];
    [v3 setObject:v6 forKey:@"storeType"];
  }
  clientBundleIdentifier = self->_clientBundleIdentifier;
  if (clientBundleIdentifier) {
    [v3 setObject:clientBundleIdentifier forKey:@"clientBundleIdentifier"];
  }
  clientIdentifier = self->_clientIdentifier;
  if (clientIdentifier) {
    [v3 setObject:clientIdentifier forKey:@"clientIdentifier"];
  }
  mappingId = self->_mappingId;
  if (mappingId) {
    [v3 setObject:mappingId forKey:@"mappingId"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v10 = [NSNumber numberWithBool:self->_isMapped];
    [v3 setObject:v10 forKey:@"isMapped"];
  }
  build = self->_build;
  if (build) {
    [v3 setObject:build forKey:@"build"];
  }
  if ([(NSMutableArray *)self->_feedbackItems count])
  {
    long long v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_feedbackItems, "count"));
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v13 = self->_feedbackItems;
    uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "dictionaryRepresentation", (void)v20);
          [v12 addObject:v18];
        }
        uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v15);
    }

    [v3 setObject:v12 forKey:@"feedbackItems"];
  }
  return v3;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PPStorableFeedback;
  id v4 = [(PPStorableFeedback *)&v8 description];
  uint64_t v5 = [(PPStorableFeedback *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)feedbackItemsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_feedbackItems objectAtIndex:a3];
}

- (unint64_t)feedbackItemsCount
{
  return [(NSMutableArray *)self->_feedbackItems count];
}

- (void)addFeedbackItems:(id)a3
{
  id v4 = a3;
  feedbackItems = self->_feedbackItems;
  id v8 = v4;
  if (!feedbackItems)
  {
    unint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_feedbackItems;
    self->_feedbackItems = v6;

    id v4 = v8;
    feedbackItems = self->_feedbackItems;
  }
  [(NSMutableArray *)feedbackItems addObject:v4];
}

- (void)clearFeedbackItems
{
}

- (BOOL)hasBuild
{
  return self->_build != 0;
}

- (BOOL)hasIsMapped
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasIsMapped:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setIsMapped:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_isMapped = a3;
}

- (BOOL)hasMappingId
{
  return self->_mappingId != 0;
}

- (BOOL)hasClientIdentifier
{
  return self->_clientIdentifier != 0;
}

- (BOOL)hasClientBundleIdentifier
{
  return self->_clientBundleIdentifier != 0;
}

- (BOOL)hasStoreType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasStoreType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setStoreType:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_storeType = a3;
}

- (BOOL)hasSecondsFrom1970
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasSecondsFrom1970:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setSecondsFrom1970:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double secondsFrom1970 = a3;
}

+ (Class)feedbackItemsType
{
  return (Class)objc_opt_class();
}

@end