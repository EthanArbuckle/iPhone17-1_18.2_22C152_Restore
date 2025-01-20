@interface PPM2FeedbackPortraitRegistered
+ (Class)recordsType;
+ (id)options;
- (BOOL)hasActiveTreatments;
- (BOOL)hasClientId;
- (BOOL)hasDomain;
- (BOOL)hasFeedbackDomainStatus;
- (BOOL)hasMappingId;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)records;
- (NSString)activeTreatments;
- (NSString)clientId;
- (NSString)mappingId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)domainAsString:(int)a3;
- (id)feedbackDomainStatusAsString:(int)a3;
- (id)recordsAtIndex:(unint64_t)a3;
- (id)typeAsString:(int)a3;
- (int)StringAsDomain:(id)a3;
- (int)StringAsFeedbackDomainStatus:(id)a3;
- (int)StringAsType:(id)a3;
- (int)domain;
- (int)feedbackDomainStatus;
- (int)type;
- (unint64_t)hash;
- (unint64_t)recordsCount;
- (void)addRecords:(id)a3;
- (void)clearRecords;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActiveTreatments:(id)a3;
- (void)setClientId:(id)a3;
- (void)setDomain:(int)a3;
- (void)setFeedbackDomainStatus:(int)a3;
- (void)setHasDomain:(BOOL)a3;
- (void)setHasFeedbackDomainStatus:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setMappingId:(id)a3;
- (void)setRecords:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PPM2FeedbackPortraitRegistered

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_records, 0);
  objc_storeStrong((id *)&self->_mappingId, 0);
  objc_storeStrong((id *)&self->_clientId, 0);
  objc_storeStrong((id *)&self->_activeTreatments, 0);
}

- (void)setActiveTreatments:(id)a3
{
}

- (NSString)activeTreatments
{
  return self->_activeTreatments;
}

- (void)setRecords:(id)a3
{
}

- (NSMutableArray)records
{
  return self->_records;
}

- (void)setMappingId:(id)a3
{
}

- (NSString)mappingId
{
  return self->_mappingId;
}

- (void)setClientId:(id)a3
{
}

- (NSString)clientId
{
  return self->_clientId;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 2)) {
    -[PPM2FeedbackPortraitRegistered setClientId:](self, "setClientId:");
  }
  char v5 = *((unsigned char *)v4 + 52);
  if (v5)
  {
    self->_domain = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 52);
  }
  if ((v5 & 4) != 0)
  {
    self->_type = *((_DWORD *)v4 + 12);
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 4)) {
    -[PPM2FeedbackPortraitRegistered setMappingId:](self, "setMappingId:");
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = *((id *)v4 + 5);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
        -[PPM2FeedbackPortraitRegistered addRecords:](self, "addRecords:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  if (*((void *)v4 + 1)) {
    -[PPM2FeedbackPortraitRegistered setActiveTreatments:](self, "setActiveTreatments:");
  }
  if ((*((unsigned char *)v4 + 52) & 2) != 0)
  {
    self->_feedbackDomainStatus = *((_DWORD *)v4 + 7);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_clientId hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_domain;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_type;
      goto LABEL_6;
    }
  }
  uint64_t v5 = 0;
LABEL_6:
  NSUInteger v6 = [(NSString *)self->_mappingId hash];
  uint64_t v7 = [(NSMutableArray *)self->_records hash];
  NSUInteger v8 = [(NSString *)self->_activeTreatments hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v9 = 2654435761 * self->_feedbackDomainStatus;
  }
  else {
    uint64_t v9 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  clientId = self->_clientId;
  if ((unint64_t)clientId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](clientId, "isEqual:")) {
      goto LABEL_24;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 52) & 1) == 0 || self->_domain != *((_DWORD *)v4 + 6)) {
      goto LABEL_24;
    }
  }
  else if (*((unsigned char *)v4 + 52))
  {
LABEL_24:
    BOOL v9 = 0;
    goto LABEL_25;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 4) == 0 || self->_type != *((_DWORD *)v4 + 12)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 4) != 0)
  {
    goto LABEL_24;
  }
  mappingId = self->_mappingId;
  if ((unint64_t)mappingId | *((void *)v4 + 4) && !-[NSString isEqual:](mappingId, "isEqual:")) {
    goto LABEL_24;
  }
  records = self->_records;
  if ((unint64_t)records | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](records, "isEqual:")) {
      goto LABEL_24;
    }
  }
  activeTreatments = self->_activeTreatments;
  if ((unint64_t)activeTreatments | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](activeTreatments, "isEqual:")) {
      goto LABEL_24;
    }
  }
  BOOL v9 = (*((unsigned char *)v4 + 52) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 2) == 0 || self->_feedbackDomainStatus != *((_DWORD *)v4 + 7)) {
      goto LABEL_24;
    }
    BOOL v9 = 1;
  }
LABEL_25:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_clientId copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  char has = (char)self->_has;
  if (has)
  {
    *(_DWORD *)(v5 + 24) = self->_domain;
    *(unsigned char *)(v5 + 52) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_type;
    *(unsigned char *)(v5 + 52) |= 4u;
  }
  uint64_t v9 = [(NSString *)self->_mappingId copyWithZone:a3];
  v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v11 = self->_records;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "copyWithZone:", a3, (void)v20);
        [(id)v5 addRecords:v16];
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v13);
  }

  uint64_t v17 = [(NSString *)self->_activeTreatments copyWithZone:a3];
  v18 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v17;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_feedbackDomainStatus;
    *(unsigned char *)(v5 + 52) |= 2u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (self->_clientId)
  {
    objc_msgSend(v4, "setClientId:");
    id v4 = v10;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v4 + 6) = self->_domain;
    *((unsigned char *)v4 + 52) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 12) = self->_type;
    *((unsigned char *)v4 + 52) |= 4u;
  }
  if (self->_mappingId) {
    objc_msgSend(v10, "setMappingId:");
  }
  if ([(PPM2FeedbackPortraitRegistered *)self recordsCount])
  {
    [v10 clearRecords];
    unint64_t v6 = [(PPM2FeedbackPortraitRegistered *)self recordsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(PPM2FeedbackPortraitRegistered *)self recordsAtIndex:i];
        [v10 addRecords:v9];
      }
    }
  }
  if (self->_activeTreatments) {
    objc_msgSend(v10, "setActiveTreatments:");
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v10 + 7) = self->_feedbackDomainStatus;
    *((unsigned char *)v10 + 52) |= 2u;
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_clientId) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_mappingId) {
    PBDataWriterWriteStringField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unint64_t v6 = self->_records;
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

  if (self->_activeTreatments) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PPM2FeedbackPortraitRegisteredReadFrom(self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  clientId = self->_clientId;
  if (clientId) {
    [v3 setObject:clientId forKey:@"clientId"];
  }
  char has = (char)self->_has;
  if (has)
  {
    uint64_t domain = self->_domain;
    if (domain >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_domain);
      uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v8 = off_1E65D4448[domain];
    }
    [v4 setObject:v8 forKey:@"domain"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    uint64_t type = self->_type;
    if (type >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_type);
      id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v10 = off_1E65D4488[type];
    }
    [v4 setObject:v10 forKey:@"type"];
  }
  mappingId = self->_mappingId;
  if (mappingId) {
    [v4 setObject:mappingId forKey:@"mappingId"];
  }
  if ([(NSMutableArray *)self->_records count])
  {
    long long v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_records, "count"));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v13 = self->_records;
    uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = [*(id *)(*((void *)&v23 + 1) + 8 * i) dictionaryRepresentation];
          [v12 addObject:v18];
        }
        uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v15);
    }

    [v4 setObject:v12 forKey:@"records"];
  }
  activeTreatments = self->_activeTreatments;
  if (activeTreatments) {
    [v4 setObject:activeTreatments forKey:@"activeTreatments"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t feedbackDomainStatus = self->_feedbackDomainStatus;
    if (feedbackDomainStatus >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_feedbackDomainStatus);
      long long v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      long long v21 = off_1E65D44B8[feedbackDomainStatus];
    }
    [v4 setObject:v21 forKey:@"feedbackDomainStatus"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PPM2FeedbackPortraitRegistered;
  id v4 = [(PPM2FeedbackPortraitRegistered *)&v8 description];
  uint64_t v5 = [(PPM2FeedbackPortraitRegistered *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (int)StringAsFeedbackDomainStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NotInDomain"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"InDomainOnly"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"InUserPortrait"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"MappedIdentifierNotInDomain"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"MappedIdentifierInDomainOnly"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"MappedIdentifierInUserPortrait"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)feedbackDomainStatusAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E65D44B8[a3];
  }
  return v3;
}

- (BOOL)hasFeedbackDomainStatus
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasFeedbackDomainStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setFeedbackDomainStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_uint64_t feedbackDomainStatus = a3;
}

- (int)feedbackDomainStatus
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_feedbackDomainStatus;
  }
  else {
    return 0;
  }
}

- (BOOL)hasActiveTreatments
{
  return self->_activeTreatments != 0;
}

- (id)recordsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_records objectAtIndex:a3];
}

- (unint64_t)recordsCount
{
  return [(NSMutableArray *)self->_records count];
}

- (void)addRecords:(id)a3
{
  id v4 = a3;
  records = self->_records;
  id v8 = v4;
  if (!records)
  {
    unint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_records;
    self->_records = v6;

    id v4 = v8;
    records = self->_records;
  }
  [(NSMutableArray *)records addObject:v4];
}

- (void)clearRecords
{
}

- (BOOL)hasMappingId
{
  return self->_mappingId != 0;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Invalid"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"EngagedExplicit"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"EngagedImplicit"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"RejectedExplicit"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"RejectedImplicit"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"Offered"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E65D4488[a3];
  }
  return v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_uint64_t type = a3;
}

- (int)type
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (int)StringAsDomain:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Topics"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NamedEntities"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Locations"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Events"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ContactsDomain"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"Connections"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"QuickTypeBroker"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"UniversalSearchSpotlightTopics"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)domainAsString:(int)a3
{
  if (a3 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E65D4448[a3];
  }
  return v3;
}

- (BOOL)hasDomain
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasDomain:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setDomain:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t domain = a3;
}

- (int)domain
{
  if (*(unsigned char *)&self->_has) {
    return self->_domain;
  }
  else {
    return 0;
  }
}

- (BOOL)hasClientId
{
  return self->_clientId != 0;
}

+ (Class)recordsType
{
  return (Class)objc_opt_class();
}

+ (id)options
{
  if (options_once != -1) {
    dispatch_once(&options_once, &__block_literal_global_653);
  }
  v2 = (void *)options_sOptions;
  return v2;
}

void __41__PPM2FeedbackPortraitRegistered_options__block_invoke()
{
  v0 = (void *)options_sOptions;
  options_sOptions = (uint64_t)&unk_1F256AF88;
}

@end